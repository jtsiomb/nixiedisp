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

struct device {
	int type;
	char *name;
	void *data;
	char resp[512];

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


int dev_mode(struct device *dev, int mode);
int dev_getmode(struct device *dev);
int dev_clock_settime(struct device *dev, int hr, int min, int sec);
int dev_clock_gettime(struct device *dev, int *hr, int *min, int *sec);
int dev_clock_setdate(struct device *dev, int day, int mon, int yr);
int dev_clock_getdate(struct device *dev, int *day, int *mon, int *yr);

#ifdef __cplusplus
}
#endif

#endif	/* DEV_H_ */
