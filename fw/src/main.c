#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "serial.h"

#define FADE_TIME	1023
#define HALF_FADE	511
#define FADE_SHIFT	5

/* pin assignments
 * B[0,2]: serial clock for the 3 shift registers
 * B4: SPI MISO connected to RTC I/O pin
 * B5: SPI SCK connected to RTC serial clock
 *
 * C0: serial data for the 3 shift registers
 * C1: hour separator LEDs
 * C2: RTC chip select (active high)
 *
 * D[2,7]: nixie dots
 */
#define PB_CK1		0x01
#define PB_CK2		0x02
#define PB_CK3		0x04
#define PB_RTC_DATA	0x10
#define PB_RTC_CK	0x20
#define PC_SDATA	0x01
#define PC_HRSEP	0x02
#define PC_RTC_EN	0x04
#define PD_ADOT		0x04
#define PD_BDOT		0x08
#define PD_CDOT		0x10
#define PD_DDOT		0x20
#define PD_EDOT		0x40
#define PD_FDOT		0x80

static void proc_cmd(char *input);
static void update_display(void);
static void setclock(int hr, int min, int sec);
static void setdate(int day, int mon, int year);

enum { MODE_CLOCK, MODE_NUM };

static int mode;
static int echo, blank;
static unsigned char disp[7], prev[6], fdisp[6];
static unsigned char glevel = 15, level[7] = {15, 15, 15, 15, 15, 15, 15};
static unsigned int fade_time[6];
static unsigned char mode_fademask[] = {0xfc, 0xff};	/* clock/num fademasks */
static int dotpos = -1;

static char input[128];
static unsigned char inp_cidx;


int main(void)
{
	/* SPI (SS/MOSI/SCK) are outputs */
	DDRB = ~PB_RTC_DATA;	/* port B all outputs except the RTC data line */
	PORTB = 0;
	DDRC = 0xff;			/* port C all outputs */
	PORTC = 0;
	DDRD = 0xff;			/* port D all outputs */
	PORTD = 0;

	/* init the serial port we use to talk to the host */
	init_serial(38400);
	sei();

	for(;;) {
		if(have_input()) {
			int c = getchar();
			if(echo) {
				putchar(c);
			}

			if(c == '\r' || c == '\n') {
				if(echo) putchar('\n');
				input[inp_cidx] = 0;
				proc_cmd(input);
				inp_cidx = 0;
			} else if(inp_cidx < sizeof input - 1) {
				input[inp_cidx++] = c;
			}
		}

		update_display();
		_delay_us(128);
	}
	return 0;
}

static const char *helpstr =
	"<num>: set number\n"
	" e 0|1: turn echo on/off\n"
	" b 0|1: blank/unblank display\n"
	" m n|c: change display mode (n: number, c: clock)\n"
	" s <hr>:<min>.<sec>: set clock\n"
	" d <day>/<mon>/<year>: set date\n"
	" ?/h: print command help\n";

static void proc_cmd(char *input)
{
	int i, cmd, hr, min, sec, day, mon, year, tmp;
	char *args, *endp;

	while(*input && isspace(*input)) input++;
	if(!*input) return;

	cmd = *input;
	args = input + 1;
	while(*args && isspace(*args)) args++;

	switch(cmd) {
	case 'e':
		echo = atoi(args);
		printf("OK echo %s\n", echo ? "on" : "off");
		break;

	case 'b':
		printf("OK %sblanking display\n", blank ? "" : "un");
		blank = atoi(args);
		break;

	case 'm':
		if(input[1] == 'c') {
			printf("OK clock mode\n");
			mode = MODE_CLOCK;
		} else if(input[1] == 'n') {
			printf("OK number mode\n");
			mode = MODE_NUM;
		} else {
			printf("ERR invalid mode: '%s'\n", args);
		}
		break;

	case 's':
		sec = 0;
		if(sscanf(args, "%d:%d.%d", &hr, &min, &sec) < 2) {
			printf("ERR invalid time string: \"%s\"\n", args);
			break;
		}
		setclock(hr, min, sec);
		printf("OK clock set\n");
		break;

	case 'd':
		if(sscanf(args, "%d/%d/%d", &day, &mon, &year) != 3 || day < 1 || day > 31 ||
				mon < 1 || mon > 12 || year < 0) {
			printf("ERR invalid date string: \"%s\"\n", args);
			break;
		}
		if(year < 100) year += 2000;
		setdate(day, mon, year);
		printf("OK date set\n");
		/* TODO */
		break;

	case '?':
	case 'h':
		puts("OK command help");
		puts(helpstr);
		break;

	case 'L':
		tmp = strtol(args, &endp, 10);
		if(endp == args || tmp < 0 || tmp > 15) {
			printf("ERR invalid intensity level: \"%s\"\n", args);
			break;
		}
		printf("OK global intensity: %d\n", tmp);
		glevel = tmp;
		break;

	case 'x':
		tmp = strtol(args, &endp, 0);
		if(endp == args) {
			printf("ERR invalid fade mask: \"%s\"\n", args);
			break;
		}
		printf("OK %s fade mask: %02x\n", mode == MODE_CLOCK ? "clock" : "number", tmp);
		mode_fademask[mode] = tmp;
		break;

	default:
		if(isdigit(cmd) || cmd == '.') {
			int c, d, didx;
			char *end;

			end = input;
			while(*end && (isdigit(*end) || *end == '.')) end++;
			if(end == input) break;

			dotpos = -1;
			didx = 5;
			while(end > input && didx >= 0) {
				c = *--end;
				if(c == '.') {
					dotpos = didx + 1;
				} else {
					d = c - '0';
					if(disp[didx] != d) {
						fade_time[didx] = FADE_TIME;
						prev[didx] = disp[didx];
						disp[didx--] = d;
					} else {
						didx--;
					}
				}
			}

			/* fill the leading digits with 0xff, which means blank */
			while(didx >= 0) {
				disp[didx--] = 0xff;
			}

			fputs("OK number: \"", stdout);
			for(i=0; i<6; i++) {
				if(dotpos == i) putchar('.');
				putchar(disp[i] == 0xff ? ' ' : disp[i] + '0');
			}
			puts("\"");

		} else {
			printf("ERR unknown command: '%c'\n", cmd);
		}
	}
}

static void shiftout(int sreg, unsigned char val)
{
	int i;
	unsigned int clkbit = 1 << sreg;

	for(i=0; i<8; i++) {
		PORTC = (PORTC & 0xfe) | (val >> 7);
		PORTB = (PORTB & 0xf8) | clkbit;
		PORTB &= 0xf8;
		val <<= 1;
	}
}

static void update_display(void)
{
	static unsigned int frame;
	int i, visdot, mplex, lvl, dframe, fade, fadeout;
	unsigned char *dptr, digit, fademask;

	fademask = mode_fademask[mode];

	/* id the dot is not visible at all, we don't bother with multiplexing it
	 * with the digits (see below)
	 */
	visdot = dotpos >= 0 && dotpos < 6;

	/* mplex is used to multiplex the decimal point 1/4 of the time with the
	 * digits the rest 3/4. if we ignite both the decimal point and a digit in
	 * the same tube, it leads to a fuzzy glow around the decimal point
	 */
	mplex = ++frame & 3;

	/* handle dimming by splitting a display cycle into 16 sections, and
	 * keeping the tube off for a fraction of those, even if it's supposed
	 * to display a digit.
	 */
	dframe = frame & 0xf;

	if(!visdot || mplex) {
		/* dot is not visible at all, or it is, but we're in the 3/4 of the time
		 * when we display digits
		 */

		lvl = glevel;	/* take global dimming into account */
		for(i=0; i<6; i++) {

			if((fademask & (0x20 >> i)) && fade_time[i]) {
				fadeout = fade_time[i] > HALF_FADE ? 1 : 0;
				fade = fadeout ? fade_time[i] - HALF_FADE : HALF_FADE - fade_time[i];
				digit = fadeout ? prev[i] : disp[i];

				lvl = lvl * (fade >> FADE_SHIFT) >> 4;

				fdisp[i] = dframe <= lvl ? digit : 0xff;
			} else {
				fdisp[i] = dframe <= lvl ? disp[i] : 0xff;
			}

			if(fade_time[i]) fade_time[i]--;
		}
	} else {
		fdisp[0] = fdisp[1] = fdisp[2] = fdisp[3] = fdisp[4] = fdisp[5] = 0xff;
	}

	lvl = glevel * level[6] >> 4;
	if(!mplex && visdot && dframe <= lvl) {
		/* dot is visible and we're in the 1/4 of the time when we display the dot */
		PORTD = PD_ADOT << dotpos;
	} else {
		PORTD = 0;
	}

	dptr = fdisp;
	for(i=0; i<3; i++) {
		shiftout(i, (dptr[0] & 0xf) | (dptr[1] << 4));
		dptr += 2;
	}
}

static void setclock(int hr, int min, int sec)
{
}

static void setdate(int day, int mon, int year)
{
}
