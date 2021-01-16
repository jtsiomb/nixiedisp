#ifndef TIMER_H_
#define TIMER_H_

extern unsigned long nticks;
extern int timer_running;

void timer_init(void);
void timer_start(void);
void timer_stop(void);
void timer_reset(void);

#endif	/* TIMER_H_ */
