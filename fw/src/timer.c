#include <avr/io.h>
#include <avr/interrupt.h>

unsigned long nticks, n10ticks;

void timer_init(void)
{
	/* 230 / (14745600 / 64) is very close to 1ms */
	TCCR0A = 2;	/* mode 2: CTC */
	TCCR0B = 3;	/* clk/64 */
	OCR0A = 229;
	TIMSK0 = 0;	/* disable interrupt by default, enable on start */
}

void timer_start(void)
{
	cli();
	nticks = 0;
	n10ticks = 0;
	TCNT0 = 0;
	TIMSK0 = 2;	/* enable output compare match A interrupt */
	sei();
}

void timer_stop(void)
{
	TIMSK0 = 0;	/* stop the interrupts */
}

void timer_reset(void)
{
	cli();
	nticks = 0;
	n10ticks = 0;
	TCNT0 = 0;
	sei();
}

ISR(TIMER0_COMPA_vect) {
	if(++nticks >= 10) {
		n10ticks++;
	}
}
