#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "serial.h"
#include "ds1302rtc.h"
#include "timer.h"
#include "config.h"

#define SRAM_MAGIC	"NIXIEDISP1"

#define SEP_LEVELS	64

#define FADE_TIME	1023
#define HALF_FADE	511
#define FADE_SHIFT	5

#define DEBOUNCE_ITER	32

static void proc_cmd(char *input);
static int switch_mode(int m);
static void handle_button(unsigned char bn);
static void setdigit(int idx, unsigned char val);
static void update_display(void);
static void cycle_disp(void);
static int boolarg(char *args, unsigned char *flags, unsigned char bit);
static int load_opt(void);
static void save_opt(void);
static void numchange(long delta);
static void read_buttons(void);

enum {
	OPT_CLK0	= 1,
	OPT_CLKSEC	= 2,
	OPT_CLK12	= 4
};

struct options {
	char magic[10];
	unsigned char level[6];
	unsigned char glevel, dot_level, sep_level;
	unsigned char fademask;
	unsigned char flags;
	unsigned char cycle_time[3];
};

static struct options def_opt = {
	SRAM_MAGIC,
	{15, 15, 15, 15, 15, 15},
	15, 15, SEP_LEVELS / 8,		/* glevel, dot_level, sep_level */
	0xff,			/* fademask */
	0x02,			/* flags: CLK0=0, CLKSEC=1 */
	{6, 0, 0}		/* anti-cathode poisoning cycle schedule (6am) */
};
static struct options opt;

enum { MODE_CLOCK, MODE_TIMER, MODE_NUM };
static const char *modename[] = {"clock", "timer", "number"};

static int mode;
static unsigned char echo, blank;
static unsigned char disp[7], prev[6], fdisp[6];
static unsigned int fade_time[6];
static unsigned char dotmask;

static struct rtc_time tm;
static struct rtc_date date;

static char input[64];
static unsigned char inp_cidx;

static unsigned char bnstate, bnpress, bnprev, bndiff;


int main(void)
{
	/* SPI (SS/MOSI/SCK) are outputs */
	DDRB = ~PB_RTC_DATA;	/* port B all outputs except the RTC data line */
	PORTB = 0;
	DDRC = ~PC_BNMASK;		/* port C all outputs, except buttons */
	PORTC = PC_BNMASK;		/* enable button pullups */
	DDRD = 0xff;			/* port D all outputs */
	PORTD = 0;

	/* init the serial port we use to talk to the host */
	init_serial(38400);
	sei();

	rtc_init();
	timer_init();

	cycle_disp();

	if(load_opt() == -1) {
		opt = def_opt;
		save_opt();
	}

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

		read_buttons();

		if(bnpress) {
			if(bnpress & PC_BN_MODE) {
				switch_mode((mode + 1) % 3);
			}

			if(bnpress & ~PC_BN_MODE) {	/* if other buttons changed state... */
				handle_button(bnpress & ~PC_BN_MODE);
			}
			bnpress = 0;
		}

		if(bnstate & PC_BN_B) {
			rtc_get_date_bcd(&date);
		} else {
			rtc_get_time_bcd(&tm);
		}

		if(tm.hour == opt.cycle_time[0] && tm.min == opt.cycle_time[1] && tm.sec == opt.cycle_time[2]) {
			cycle_disp();
		}

		update_display();
	}
	return 0;
}

static const char *helpstr =
	"nixiedisp firmware v" VERSTR " by John Tsiombikas <nuclear@member.fsf.org>\n"
	"  web: http://nuclear.mutantstargoat.com/hw/nixiedisp\n"
	"  git: https://github.com/jtsiomb/nixiedisp\n"
	"\n"
	"Commands:\n"
	" <num>: set number\n"
	" e 0|1: echo\n"
	" b 0|1: blank display\n"
	" m n|c|t: mode (number/clock/timer)\n"
	" M 24|12: clock mode (24h/12h)\n"
	" z 0|1: clock leading zero\n"
	" S 0|1: clock seconds display\n"
	" s <hr>:<min>.<sec>: set clock\n"
	" d <day>/<mon>/<year>: set date\n"
	" L <level>: global intensity (0-15)\n"
	" H <level>: hour separator intensity (0-63)\n"
	" l <levels>: intensity (nibble per digit)\n"
	" x <mask>: fade mask (6 bits)\n"
	" t 0|1|r: timer stop/start/reset\n"
	" c: run anti-cathode poisoning cycle\n"
	" C <hr>:<min>.<sec>: set time to run cycle\n";

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
		if(args[0] != '?') {
			if(boolarg(args, &echo, 1) == -1) break;
		}
		printf("OK echo %s\n", echo ? "on" : "off");
		break;

	case 'b':
		if(args[0] != '?') {
			if(boolarg(args, &blank, 1) == -1) break;
		}
		printf("OK blanking: %s\n", blank ? "on" : "off");
		break;

	case 'z':
		if(args[0] != '?') {
			if(boolarg(args, &opt.flags, OPT_CLK0) == -1) break;
			save_opt();
		}
		printf("OK clock leading zero %s\n", opt.flags & OPT_CLK0 ? "on" : "off");
		break;

	case 'S':
		if(args[0] != '?') {
			if(boolarg(args, &opt.flags, OPT_CLKSEC) == -1) break;
			save_opt();
		}
		printf("OK seconds display %s\n", opt.flags & OPT_CLKSEC ? "on" : "off");
		break;

	case 'm':
		if(args[0] == '?') {
			printf("OK current mode: %s\n", modename[mode]);
			break;
		}
		if(switch_mode(args[0]) == -1) {
			printf("ERR invalid mode: '%s'\n", args);
			break;
		}
		printf("OK %s mode\n", modename[mode]);
		break;

	case 'M':
		if(args[0] != '?') {
			if(args[0] == '1' && args[1] == '2') {
				opt.flags |= OPT_CLK12;
			} else if(args[0] == '2' && args[1] == '4') {
				opt.flags &= ~OPT_CLK12;
			} else {
				printf("ERR invalid clock mode: '%s'\n", args);
				break;
			}
			save_opt();
		}
		printf("OK clock mode: %shr\n", opt.flags & OPT_CLK12 ? "12" : "24");
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
					(int)opt.cycle_time[0], (int)opt.cycle_time[1], (int)opt.cycle_time[2]);
			break;
		}
		sec = 0;
		if(sscanf(args, "%d:%d.%d", &hr, &min, &sec) < 2 || hr < 0 || hr >= 24 ||
				min < 0 || min >= 60 || sec < 0 || sec >= 60) {
			printf("ERR invalid time string: \"%s\"\n", args);
			break;
		}
		opt.cycle_time[0] = rtc_bin2bcd(hr);
		opt.cycle_time[1] = rtc_bin2bcd(min);
		opt.cycle_time[2] = rtc_bin2bcd(sec);
		printf("OK anti-cathode poisoning cycling set for %02d:%02d.%02d\n", hr, min, sec);
		save_opt();
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
		rtc_set_date(year, mon, day);
		printf("OK date set to %d/%d/%d\n", day, mon, year);
		break;

	case 'L':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 10);
			if(endp == args || tmp < 0 || tmp > 15) {
				printf("ERR invalid intensity level: \"%s\"\n", args);
				break;
			}
			opt.glevel = tmp;
			save_opt();
		}
		printf("OK global intensity: %d\n", opt.glevel);
		break;

	case 'H':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 10);
			if(endp == args || tmp < 0 || tmp >= SEP_LEVELS) {
				printf("ERR invalid hour separator intensity: \"%s\"\n", args);
				break;
			}
			opt.sep_level = tmp;
			save_opt();
		}
		printf("OK hour separator intensity: %d\n", opt.sep_level);
		break;

	case 'l':
		if(args[0] != '?') {
			tmp = strtol(args, &endp, 0);
			if(endp == args || (tmp & 0xff000000)) {
				printf("ERR invalid intensity string: \"%s\"\n", args);
				break;
			}
			for(i=0; i<6; i++) {
				opt.level[i] = (tmp >> 20) & 0xf;
				tmp <<= 4;
			}
			save_opt();
		}
		printf("OK per digit intensities:");
		for(i=0; i<6; i++) {
			printf(" %d", (unsigned int)opt.level[i]);
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
			opt.fademask = tmp;
			save_opt();
		}
		printf("OK fade mask: %02x\n", opt.fademask);
		break;

	case 't':
		if(args[0] == '?') {
			printf("OK timer: %lu\n", nticks);
			break;
		}
		if(args[0] == '0') {
			timer_stop();
			printf("OK timer stopped\n");
		} else if(args[0] == '1') {
			timer_start();
			printf("OK timer started\n");
		} else if(args[0] == 'r') {
			timer_reset();
			printf("OK timer reset\n");
		} else {
			printf("ERR invalid timer command: \"%s\"\n", args);
		}
		break;

	case 'c':
		printf("OK cycling display\n");
		cycle_disp();
		break;

	case 'R':
		printf("OK resetting options\n");
		opt = def_opt;
		save_opt();
		break;

	case '>':
		if(mode == MODE_NUM) {
			tmp = atoi(args);
			numchange(tmp > 0 ? tmp : 1);
		}
		break;

	case '<':
		if(mode == MODE_NUM) {
			tmp = atoi(args);
			numchange(-(tmp > 0 ? tmp : 1));
		}
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
			while(*end && (isdigit(*end) || *end == '.' || *end == ' ')) end++;
			if(end == input) break;

			dotmask = 0;
			didx = 5;
			while(end > input && didx >= 0) {
				c = *--end;
				if(c == '.') {
					dotmask |= 1 << (didx + 1);
				} else if(c == ' ') {
					setdigit(didx--, 0xff);
				} else {
					setdigit(didx--, c - '0');
				}
			}

			if(end > input && *--end == '.') {
				dotmask |= 1;
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

static int switch_mode(int m)
{
	switch(m) {
	case 'c':
		m = MODE_CLOCK;
		break;
	case 'n':
		m = MODE_NUM;
		break;
	case 't':
		m = MODE_TIMER;
		break;
	}

	if(m == mode) return 0;

	switch(m) {
	case MODE_CLOCK:
		break;

	case MODE_NUM:
		PORTC &= ~PC_HRSEP;
		disp[0] = disp[1] = disp[2] = disp[3] = disp[4] = disp[5] = 0xff;
		dotmask = 0;
		break;

	case MODE_TIMER:
		PORTC &= ~PC_HRSEP;
		dotmask = 0;
		break;

	default:
		return -1;
	}

	mode = m;
	return 0;
}

static void handle_button(unsigned char pressed)
{
	switch(mode) {
	case MODE_TIMER:
		if(pressed & PC_BN_A) {
			if(timer_running) {
				timer_stop();
			} else {
				timer_start();
			}
		}
		if(pressed & PC_BN_B) {
			timer_reset();
		}
		break;

	case MODE_NUM:
		if(pressed & PC_BN_A) {
			numchange(-1);
		}
		if(pressed & PC_BN_B) {
			numchange(1);
		}
		break;

	default:
		break;	/* manual clock setting not implemented yet */
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

static unsigned char c12lut[] = {
	0x12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x10, 0x11, 0x12, 1, 2, 3, 4, 5, 6, 7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	8, 9, 0x10, 0x11, 0x12
};

static void update_display(void)
{
	static unsigned int frame;
	int i, hour, sec, mplex, lvl, dframe, fade, fadeout, dp = 0;
	unsigned char *dptr, digit;
	unsigned long tval;

	/* mplex is used to multiplex the decimal point 1/4 of the time with the
	 * digits the rest 3/4. if we ignite both the decimal point and a digit in
	 * the same tube, it leads to a fuzzy glow around the decimal point
	 */
	mplex = ++frame & 3;

	if(blank) {
		shiftout(0, 0xff);
		shiftout(1, 0xff);
		shiftout(2, 0xff);
		PORTC &= ~PC_HRSEP;
		PORTD = 0;
		return;
	}


	switch(mode) {
	case MODE_CLOCK:
		if(bnstate & PC_BN_B) {
			/* show date while holding down B */
			setdigit(0, date.day & 0xf0 ? date.day >> 4 : 0xff);
			setdigit(1, date.day & 0xf);
			setdigit(2, date.month & 0xf0 ? date.month >> 4 : 0xff);
			setdigit(3, date.month & 0xf);
			setdigit(4, date.year >> 4);
			setdigit(5, date.year & 0xf);
			dp = 0x14;
			PORTC &= ~PC_HRSEP;
		} else {
			/* otherwise show the time */
			hour = (opt.flags & OPT_CLK12) ? c12lut[tm.hour] : tm.hour;

			setdigit(0, (opt.flags & OPT_CLK0) || (hour & 0xf0) ? hour >> 4 : 0xf);
			setdigit(1, hour & 0xf);
			setdigit(2, tm.min >> 4);
			setdigit(3, tm.min & 0xf);
			if(opt.flags & OPT_CLKSEC) {
				setdigit(4, tm.sec >> 4);
				setdigit(5, tm.sec & 0xf);

				/* dot is always in the seconds tube when in clock mode */
				dp = 0x10;
			} else {
				setdigit(4, 0xf);
				setdigit(5, 0xf);

				dp = 0;
			}

			if((frame & (SEP_LEVELS - 1)) <= opt.sep_level) {
				PORTC |= PC_HRSEP;
			} else {
				PORTC &= ~PC_HRSEP;
			}
		}
		break;

	case MODE_TIMER:
		tval = nticks / 10;

		setdigit(5, tval % 10);
		tval /= 10;
		setdigit(4, tval % 10);
		tval /= 10;

		sec = tval % 60;
		tval /= 60;

		setdigit(3, sec % 10);
		sec /= 10;
		setdigit(2, sec % 10);

		setdigit(1, tval % 10);
		tval /= 10;
		setdigit(0, tval % 10);

		dp = 0x14;	/* dots on both the seconds (2) and hundredths (4) tube */
		break;

	case MODE_NUM:
	default:
		dp = dotmask;
	}


	/* handle dimming by splitting a display cycle into 16 sections, and
	 * keeping the tube off for a fraction of those, even if it's supposed
	 * to display a digit.
	 */
	dframe = frame & 0xf;

	if(!dp || mplex) {
		/* dot is not visible at all, or it is, but we're in the 3/4 of the time
		 * when we display digits
		 */

		for(i=0; i<6; i++) {
			lvl = opt.glevel * opt.level[i] >> 4;

			if((opt.fademask & (0x20 >> i)) && fade_time[i]) {
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

	lvl = opt.glevel * opt.level[6] >> 4;
	if(!mplex && dp && dframe <= lvl) {
		/* dot is visible and we're in the 1/4 of the time when we display the dot */
		PORTD = dp << 2;	/* starts from pin 2 of the output port */
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

	PORTC &= ~PC_HRSEP;
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

static int boolarg(char *args, unsigned char *flags, unsigned char bit)
{
	if(!isdigit(args[0])) {
		printf("ERR invalid boolean value \"%s\", expecting 0 or 1\n", args);
		return -1;
	}

	if(*args == '0') {
		*flags &= ~bit;
	} else {
		*flags |= bit;
	}
	return 0;
}

static int load_opt(void)
{
	int i;
	unsigned char *ptr = (unsigned char*)&opt;

	for(i=0; i<sizeof opt; i++) {
		*ptr++ = rtc_load(i);
	}
	return memcmp(opt.magic, SRAM_MAGIC, sizeof opt.magic) == 0 ? 0 : -1;
}

static void save_opt(void)
{
	int i;
	unsigned char *ptr = (unsigned char*)&opt;

	for(i=0; i<sizeof opt; i++) {
		rtc_store(i, *ptr++);
	}
}

static void numchange(long delta)
{
	int i;
	unsigned long num, scale = 1;
	unsigned char *dptr = disp + 5;

	num = 0;
	for(i=0; i<6; i++) {
		if(*dptr <= 9) num += (unsigned long)*dptr * scale;
		dptr--;
		scale *= 10;
	}

	num += delta;

	for(i=0; i<6; i++) {
		setdigit(5 - i, num || i == 0 ? num % 10 : 0xff);
		num /= 10;
	}
}

static void read_buttons(void)
{
	static unsigned char cur, prev;
	static int count;

	prev = cur;
	cur = ~PINC & PC_BNMASK;

	if(cur == prev) {
		count++;
	} else {
		count = 0;
	}

	if(count > DEBOUNCE_ITER) {
		bnprev = bnstate;
		bnstate = cur;
		bndiff = bnstate ^ bnprev;
		bnpress = bndiff & bnstate;
		count = 0;
	}
}
