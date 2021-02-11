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
#include "dev.h"

struct device *devlist, *dev;

int dev_mode(int mode)
{
	static const char mc[] = {'c', 't', 'n'};

	if(!dev || mode < 0 || mode >= 3) return -1;

	if(dev_sendcmd(dev, "m%c", mc[mode]) == -1) {
		return -1;
	}
	return 0;
}
