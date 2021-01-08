#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "serial.h"

/* TODO before board arrive:
 * - USB comms
 * - RTC time/data setting
 * - hack the digit drivers with 7seg?
 */

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
static void show_number(uint32_t xnum);
static void setclock(int hr, int min, int sec);
static void setdate(int day, int mon, int year);

enum { MODE_CLOCK, MODE_NUM };

static int mode;
static int echo, blank;
static uint32_t number;

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
				input[inp_cidx] = 0;
				proc_cmd(input);
				inp_cidx = 0;
			} else if(inp_cidx < sizeof input - 1) {
				input[inp_cidx++] = c;
			}
		}
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
	int cmd, hr, min, sec, day, mon, year;
	char *args;

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
		update_display();
		break;

	case 'm':
		if(input[1] == 'c') {
			printf("OK clock mode\n");
			mode = MODE_CLOCK;
			update_display();
		} else if(input[1] == 'n') {
			printf("OK number mode\n");
			mode = MODE_NUM;
			update_display();
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
		if(mode == MODE_CLOCK) {
			update_display();
		}
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

	case 'x':
		{
			char *endp;
			long num = strtol(args, &endp, 16);
			if(endp == args) {
				printf("ERR invalid hex number: \"%s\"\n", args);
				break;
			}
			number = num;
			if(mode == MODE_NUM) {
				update_display();
			}
		}
		break;

	case '?':
	case 'h':
		puts("OK command help");
		puts(helpstr);
		break;

	default:
		if(isdigit(args[0])) {
			int num = atoi(args);
			number = (uint32_t)num << 16;
			printf("OK number: %d (%08lxh)\n", num, number);
			if(mode == MODE_NUM) {
				update_display();
			}
		} else {
			printf("ERR unknown command: '%c'\n", cmd);
		}
	}
}

static void update_display(void)
{
	show_number(number);
}

static void set_digit(int idx, unsigned int d)
{
	int i;
	unsigned int clkbit = 1 << idx;

	for(i=0; i<8; i++) {
		PORTC = (PORTC & 0xfe) | (d >> 7);
		PORTB = (PORTB & 0xf8) | clkbit;
		PORTB &= 0xf8;
		d <<= 1;
	}
}

static void show_number(uint32_t n)
{
	int i, d;

	for(i=0; i<6; i++) {
		d = n % 10;
		n /= 10;

		set_digit(i, d);
	}
}

static void setclock(int hr, int min, int sec)
{
}

static void setdate(int day, int mon, int year)
{
}
