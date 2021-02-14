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

int dev_clock_settime(struct device *dev, int hr, int min, int sec)
{
	if(!dev || hr < 0 || hr > 23 || min < 0 || min > 59 || sec < 0 || sec > 59) {
		return -1;
	}

	return dev_sendcmd(dev, "s %d:%d.%d", hr, min, sec);
}

int dev_clock_gettime(struct device *dev, int *hr, int *min, int *sec)
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

int dev_clock_setdate(struct device *dev, int day, int mon, int yr)
{
	if(!dev || day < 1 || day > 31 || mon < 1 || mon > 12 || yr < 0) {
		return -1;
	}

	return dev_sendcmd(dev, "d %d/%d/%d", day, mon, yr);
}

int dev_clock_getdate(struct device *dev, int *day, int *mon, int *yr)
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
