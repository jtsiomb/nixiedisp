#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "serial.h"
#include "ds1302rtc.h"
#include "config.h"

#define SEP_LEVELS	128

#define FADE_TIME	1023
#define HALF_FADE	511
#define FADE_SHIFT	5

static void proc_cmd(char *input);
static void setdigit(int idx, unsigned char val);
static void update_display(void);
static void cycle_disp(void);

enum { MODE_CLOCK, MODE_NUM };

static int mode;
static int echo, blank;
static unsigned char disp[7], prev[6], fdisp[6];
static unsigned char glevel = 15, level[7] = {15, 15, 15, 15, 15, 15, 15};
static unsigned char sep_level = SEP_LEVELS / 8;
static unsigned int fade_time[6];
static unsigned char fademask = 0xff;
static int dotpos = -1;
static int opt_clk0, opt_sec = 1;
static struct rtc_time cycle_time = {6, 0, 0};	/* default display cycling at 6am */

static struct rtc_time tm;

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

	rtc_init();

	cycle_disp();

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

		rtc_get_time_bcd(&tm);
		if(tm.hour == cycle_time.hour && tm.min == cycle_time.min && tm.sec == cycle_time.sec) {
			cycle_disp();
		}

		update_display();
	}
	return 0;
}

static const char *helpstr =
	"nixiedisp firmware v" VERSTR " by John Tsiombikas <nuclear@member.fsf.org>\n"
	"nixiedisp is free hardware/software, released under the GNU GPLv3 or later\n"
	"      web: http://nuclear.mutantstargoat.com/hw/nixiedisp\n"
	" git repo: https://github.com/jtsiomb/nixiedisp\n"
	"\n"
	"Commands:\n"
	" <num>: set number\n"
	" e 0|1: turn echo on/off\n"
	" b 0|1: blank/unblank display\n"
	" m n|c: change display mode (n: number, c: clock)\n"
	" z 0|1: turn leading zero for single-digit hours on/off (clock mode)\n"
	" S 0|1: turn seconds display on/off (clock mode)\n"
	" s <hr>:<min>.<sec>: set clock\n"
	" d <day>/<mon>/<year>: set date\n"
	" L <level>: global intensity level (0-15)\n"
	" H <level>: hour separator intensity level (0-127)\n"
	" x <mask>: per-digit cross-fade mask (0: all disable, 0x3f: all enable)\n"
	" c: run anti-cathode poisoning cycle\n"
	" C <hr>:<min>.<sec>: set time of day to run anti-cathode poisoning cycle\n"
	" ?/h: print command help\n";

static void proc_cmd(char *input)
{
	int i, cmd, hr, min, sec, day, mon, year;
	long tmp;
	char *args, *endp;

	while(*input && isspace(*input)) input++;
	if(!*input) return;

	cmd = *input;
	args = input + 1;
	while(*args && isspace(*args)) args++;

	switch(cmd) {
	case 'e':
		if(args[0] != '?') echo = atoi(args);
		printf("OK echo %s\n", echo ? "on" : "off");
		break;

	case 'b':
		if(args[0] == '?') {
			printf("OK display blanking: %s\n", blank ? "on" : "off");
			break;
		}
		blank = atoi(args);
		printf("OK %sblanking display\n", blank ? "" : "un");
		break;

	case 'z':
		if(args[0] != '?') opt_clk0 = atoi(args);
		printf("OK clock leading zero %s\n", opt_clk0 ? "on" : "off");
		break;

	case 'S':
		if(args[0] != '?') opt_sec = atoi(args);
		printf("OK seconds display %s\n", opt_sec ? "on" : "off");
		break;

	case 'm':
		if(args[0] == '?') {
			printf("OK current mode: %s\n", mode == MODE_CLOCK ? "clock" : "number");
			break;
		}
		if(input[1] == 'c') {
			printf("OK clock mode\n");
			mode = MODE_CLOCK;
		} else if(input[1] == 'n') {
			printf("OK number mode\n");
			mode = MODE_NUM;
			PORTC &= ~PC_HRSEP;
			disp[0] = disp[1] = disp[2] = disp[3] = disp[4] = disp[5] = 0xff;
			dotpos = -1;
		} else {
			printf("ERR invalid mode: '%s'\n", args);
		}
		break;

	case 's':
		if(args[0] == '?') {
			struct rtc_time tm;
			rtc_get_time(&tm);
			printf("OK current time: %02d:%02d.%02d\n", tm.hour, tm.min, tm.sec);
			break;
		}
		sec = 0;
		if(sscanf(args, "%d:%d.%d", &hr, &min, &sec) < 2 || hr < 0 || hr >= 24 ||
				min < 0 || min >= 60 || sec < 0 || sec >= 60) {
			printf("ERR invalid time string: \"%s\"\n", args);
			break;
		}
		rtc_set_time(hr, min, sec);
		printf("OK clock set %02d:%02d.%02d\n", hr, min, sec);
		break;

	case 'C':
		if(args[0] == '?') {
			printf("OK current anti-cathode poisoning cycle time: %02d:%02d.%02d\n",
					cycle_time.hour, cycle_time.min, cycle_time.sec);
			break;
		}
		sec = 0;
		if(sscanf(args, "%d:%d.%d", &hr, &min, &sec) < 2 || hr < 0 || hr >= 24 ||
				min < 0 || min >= 60 || sec < 0 || sec >= 60) {
			printf("ERR invalid time string: \"%s\"\n", args);
			break;
		}
		cycle_time.hour = rtc_bin2bcd(hr);
		cycle_time.min = rtc_bin2bcd(min);
		cycle_time.sec = rtc_bin2bcd(sec);
		printf("OK anti-cathode poisoning cycling set for %02d:%02d.%02d\n", hr, min, sec);
		break;

	case 'd':
		if(args[0] == '?') {
			struct rtc_date date;
			rtc_get_date(&date);
			printf("OK current date: %d/%d/%d\n", date.day, date.month, date.year);
			break;
		}
		if(sscanf(args, "%d/%d/%d", &day, &mon, &year) != 3 || day < 1 || day > 31 ||
				mon < 1 || mon > 12 || year < 0) {
			printf("ERR invalid date string: \"%s\"\n", args);
			break;
		}
		if(year < 100) year += 2000;
		rtc_set_date(day, mon, year);
		printf("OK date set to %d/%d/%d\n", day, mon, year);
		break;

	case 'L':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 10);
			if(endp == args || tmp < 0 || tmp > 15) {
				printf("ERR invalid intensity level: \"%s\"\n", args);
				break;
			}
			glevel = tmp;
		}
		printf("OK global intensity: %d\n", glevel);
		break;

	case 'H':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 10);
			if(endp == args || tmp < 0 || tmp >= SEP_LEVELS) {
				printf("ERR invalid hour separator intensity: \"%s\"\n", args);
				break;
			}
			sep_level = tmp;
		}
		printf("OK hour separator intensity: %d\n", sep_level);
		break;

	case 'l':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 0);
			if(endp == args || (tmp & 0xff000000)) {
				printf("ERR invalid intensity string: \"%s\"\n", args);
				break;
			}
			for(i=0; i<6; i++) {
				level[i] = (tmp >> 20) & 0xf;
				tmp <<= 4;
			}
		}
		printf("OK per digit intensities:");
		for(i=0; i<6; i++) {
			printf(" %d", (unsigned int)level[i]);
		}
		putchar('\n');
		break;

	case 'x':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 0);
			if(endp == args) {
				printf("ERR invalid fade mask: \"%s\"\n", args);
				break;
			}
			fademask = tmp;
		}
		printf("OK fade mask: %02x\n", fademask);
		break;

	case 'c':
		printf("OK cycling display\n");
		cycle_disp();
		break;

	case '?':
	case 'h':
		puts("OK command help");
		puts(helpstr);
		break;

	default:
		if(isdigit(cmd) || cmd == '.') {
			int c, didx;
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
					setdigit(didx--, c - '0');
				}
			}

			/* fill the leading digits with 0xff, which means blank */
			while(didx >= 0) {
				disp[didx--] = 0xff;
			}

		} else {
			printf("ERR unknown command: '%c'\n", cmd);
		}
	}
}

static void setdigit(int idx, unsigned char val)
{
	unsigned char *dptr = disp + idx;

	if(val == *dptr) return;

	prev[idx] = *dptr;
	*dptr = val;
	fade_time[idx] = FADE_TIME;
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
	int i, visdot, mplex, lvl, dframe, fade, fadeout, dp;
	unsigned char *dptr, digit;

	/* mplex is used to multiplex the decimal point 1/4 of the time with the
	 * digits the rest 3/4. if we ignite both the decimal point and a digit in
	 * the same tube, it leads to a fuzzy glow around the decimal point
	 */
	mplex = ++frame & 3;

	if(blank) {
		shiftout(0, 0xff);
		shiftout(1, 0xff);
		shiftout(2, 0xff);
		PORTC = 0;
		PORTD = 0;
		return;
	}


	if(mode == MODE_CLOCK) {
		setdigit(0, opt_clk0 || (tm.hour & 0xf0) ? tm.hour >> 4 : 0xf);
		setdigit(1, tm.hour & 0xf);
		setdigit(2, tm.min >> 4);
		setdigit(3, tm.min & 0xf);
		if(opt_sec) {
			setdigit(4, tm.sec >> 4);
			setdigit(5, tm.sec & 0xf);

			/* dot is always in the seconds tube when in clock mode */
			dp = 4;
			visdot = 1;
		} else {
			setdigit(4, 0xf);
			setdigit(5, 0xf);

			dp = -1;
			visdot = 0;
		}

		if((frame & (SEP_LEVELS - 1)) <= sep_level) {
			PORTC |= PC_HRSEP;
		} else {
			PORTC = 0;
		}
	} else {
		dp = dotpos;
		visdot = dotpos >= 0 && dotpos < 6;
	}


	/* handle dimming by splitting a display cycle into 16 sections, and
	 * keeping the tube off for a fraction of those, even if it's supposed
	 * to display a digit.
	 */
	dframe = frame & 0xf;

	if(!visdot || mplex) {
		/* dot is not visible at all, or it is, but we're in the 3/4 of the time
		 * when we display digits
		 */

		for(i=0; i<6; i++) {
			lvl = glevel * level[i] >> 4;

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
		PORTD = PD_ADOT << dp;
	} else {
		PORTD = 0;
	}

	dptr = fdisp;
	for(i=0; i<3; i++) {
		shiftout(i, (dptr[0] & 0xf) | (dptr[1] << 4));
		dptr += 2;
	}
}

static void cycle_disp(void)
{
	int i, j;

	PORTC = 0;
	PORTD = 0;

	for(i=0; i<10; i++) {
		for(j=0; j<3; j++) {
			shiftout(j, i | (i << 4));
		}
		_delay_ms(100);
	}

	shiftout(0, 0xff);
	shiftout(1, 0xff);
	shiftout(2, 0xff);

	PORTD = 0xff;
	_delay_ms(120);
	PORTD = 0;

	for(i=0; i<10; i++) {
		int x = 9 - i;
		for(j=0; j<3; j++) {
			shiftout(j, x | (x << 4));
		}
		_delay_ms(100);
	}
}
