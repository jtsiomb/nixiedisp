#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
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

static int echo;

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

static void proc_cmd(char *input)
{
	switch(input[0]) {
	case 'e':
		echo = input[1] == '1' ? 1 : 0;
		printf("OK echo %s\n", echo ? "on" : "off");
		break;

	case '?':
		puts("OK command help");
		puts(" e 0|1: turn echo on/off");
		break;

	default:
		printf("ERR unknown command: '%c'\n", input[0]);
	}
}
