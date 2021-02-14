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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dev.h"

struct device *devlist;

void dev_mask_mod(struct device *dev)
{
	if(dev) dev->flags |= DEV_MODMASK;
}

void dev_unmask_mod(struct device *dev)
{
	if(dev) dev->flags &= ~DEV_MODMASK;
}

int dev_mode(struct device *dev, int mode)
{
	static const char mc[] = {'c', 't', 'n'};

	if(!dev || mode < 0 || mode >= 3) return -1;

	return dev_sendcmd(dev, "m%c", mc[mode]);
}

int dev_getmode(struct device *dev)
{
	char *ptr;

	if(!dev) return -1;

	if(dev_sendcmd(dev, "m?") == -1) {
		return -1;
	}

	if((ptr = strstr(dev->resp, "OK current mode: "))) {
		switch(ptr[17]) {
		case 'c':
			return MODE_CLOCK;
		case 't':
			return MODE_TIMER;
		case 'n':
			return MODE_NUMBER;
		}
	}
	return -1;
}

int dev_clock_set_time(struct device *dev, int hr, int min, int sec)
{
	if(!dev || hr < 0 || hr > 23 || min < 0 || min > 59 || sec < 0 || sec > 59) {
		return -1;
	}

	return dev_sendcmd(dev, "s %d:%d.%d", hr, min, sec);
}

int dev_clock_get_time(struct device *dev, int *hr, int *min, int *sec)
{
	if(!dev) return -1;

	if(dev_sendcmd(dev, "s?") == -1) {
		return -1;
	}
	if(sscanf(dev->resp, "OK current time: %d:%d.%d", hr, min, sec) < 3) {
		return -1;
	}
	return 0;
}

int dev_clock_set_date(struct device *dev, int day, int mon, int yr)
{
	if(!dev || day < 1 || day > 31 || mon < 1 || mon > 12 || yr < 0) {
		return -1;
	}

	return dev_sendcmd(dev, "d %d/%d/%d", day, mon, yr);
}

int dev_clock_get_date(struct device *dev, int *day, int *mon, int *yr)
{
	if(!dev) return -1;

	if(dev_sendcmd(dev, "d?") == -1) {
		return -1;
	}
	if(sscanf(dev->resp, "OK current date: %d/%d/%d", day, mon, yr) < 3) {
		return -1;
	}
	return 0;
}

int dev_clock_set_hrmode(struct device *dev, int mode)
{
	if(!dev || (mode != 12 && mode != 24)) {
		return -1;
	}

	return dev_sendcmd(dev, "M%d", mode);
}

int dev_clock_get_hrmode(struct device *dev)
{
	int mode;

	if(!dev) return -1;

	if(dev_sendcmd(dev, "M?") == -1) {
		return -1;
	}
	if(sscanf(dev->resp, "OK clock mode: %dhr", &mode) != 1 || (mode != 12 && mode != 24)) {
		return -1;
	}
	return mode;
}

int dev_clock_set_leadzero(struct device *dev, int z)
{
	if(!dev) return -1;
	return dev_sendcmd(dev, "z%d", z ? 1 : 0);
}

int dev_clock_get_leadzero(struct device *dev)
{
	static const char *prefix = "OK clock leading zero ";
	char *ptr;

	if(!dev) return -1;

	if(dev_sendcmd(dev, "z?") == -1) {
		return -1;
	}
	if(!strstr(dev->resp, prefix)) {
		return -1;
	}
	ptr = dev->resp + strlen(prefix);
	if(memcmp(ptr, "on", 2) == 0) {
		return 1;
	}
	if(memcmp(ptr, "off", 3) == 0) {
		return 0;
	}
	return -1;
}

int dev_clock_set_showsec(struct device *dev, int ss)
{
	if(!dev || ss < 0 || ss > 1) return -1;

	return dev_sendcmd(dev, "S%d", ss);
}

int dev_clock_get_showsec(struct device *dev)
{
	static const char *prefix = "OK seconds display ";
	char *ptr;

	if(!dev) return -1;

	if(dev_sendcmd(dev, "S?") == -1) {
		return -1;
	}
	if(!strstr(dev->resp, prefix)) {
		return -1;
	}
	ptr = dev->resp + strlen(prefix);
	if(memcmp(ptr, "on", 2) == 0) {
		return 1;
	}
	if(memcmp(ptr, "off", 3) == 0) {
		return 0;
	}
	return -1;
}

int dev_timer_start(struct device *dev)
{
	if(!dev) return -1;
	return dev_sendcmd(dev, "t1");
}

int dev_timer_stop(struct device *dev)
{
	if(!dev) return -1;
	return dev_sendcmd(dev, "t0");
}

int dev_timer_reset(struct device *dev)
{
	if(!dev) return -1;
	return dev_sendcmd(dev, "tr");
}

int dev_timer(struct device *dev, unsigned int *tm)
{
	char *ptr;

	if(!dev) return -1;

	if(dev_sendcmd(dev, "t?") == -1) {
		return -1;
	}

	if(!(ptr = strchr(dev->resp, ':'))) {
		return -1;
	}

	if(tm) *tm = atoi(ptr + 1);
	*ptr = 0;
	return strstr(dev->resp, "running") ? 1 : 0;
}
