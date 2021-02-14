/*
nixiedisp-gui - settings and control app for the nixie tube display
Copyright (C) 2021  John Tsiombikas <nuclear@member.fsf.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#ifndef DEV_H_
#define DEV_H_

enum { DEV_USB, DEV_SERIAL };

enum {
	DEV_MODMASK		= 1,
	DEV_TMRUNNING	= 2,
	DEV_SHOWSEC		= 4,
	DEV_DIMSEC		= 8
};

struct device {
	int type;
	char *name;
	void *data;
	char resp[512];
	int flags;

	struct device *next;
};

extern struct device *devlist;

enum { MODE_CLOCK, MODE_TIMER, MODE_NUMBER };

#ifdef __cplusplus
extern "C" {
#endif

int dev_scan(void);
int dev_open(struct device *dev);
void dev_close(struct device *dev);
int dev_sendcmd(struct device *dev, const char *fmt, ...);

/* mask/unmask modifications, when masked, no set commands are sent to the device */
void dev_mask_mod(struct device *dev);
void dev_unmask_mod(struct device *dev);

int dev_mode(struct device *dev, int mode);
int dev_getmode(struct device *dev);
int dev_set_intensity(struct device *dev, int val);
int dev_get_intensity(struct device *dev);
int dev_blank(struct device *dev, int blank);
int dev_getblank(struct device *dev);
int dev_setfade(struct device *dev, int fade);
int dev_getfade(struct device *dev);

int dev_cycle(struct device *dev);
int dev_sched_cycle(struct device *dev, int hr, int min, int sec);
int dev_get_sched_cycle(struct device *dev, int *hr, int *min, int *sec);

int dev_clock_set_time(struct device *dev, int hr, int min, int sec);
int dev_clock_get_time(struct device *dev, int *hr, int *min, int *sec);
int dev_clock_set_date(struct device *dev, int day, int mon, int yr);
int dev_clock_get_date(struct device *dev, int *day, int *mon, int *yr);
int dev_clock_set_hrmode(struct device *dev, int mode);
int dev_clock_get_hrmode(struct device *dev);
int dev_clock_set_leadzero(struct device *dev, int z);
int dev_clock_get_leadzero(struct device *dev);
int dev_clock_set_showsec(struct device *dev, int ss);
int dev_clock_get_showsec(struct device *dev);
int dev_clock_set_hrsep(struct device *dev, int val);
int dev_clock_get_hrsep(struct device *dev);

int dev_timer_start(struct device *dev);
int dev_timer_stop(struct device *dev);
int dev_timer_reset(struct device *dev);
int dev_timer(struct device *dev, unsigned int *tm);

int dev_number(struct device *dev, float num);

#ifdef __cplusplus
}
#endif

#endif	/* DEV_H_ */
