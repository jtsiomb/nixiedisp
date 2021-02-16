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
#include <ctype.h>
#include <stdarg.h>
#include <errno.h>
#include <windows.h>
#include "uimsg.h"
#include "dev.h"


static int readresp(struct device *dev, long timeout_msec);
static int waitresp(struct device *dev, long timeout_msec);

static void free_list(struct device *d)
{
	struct device *tmp;

	while(d) {
		tmp = d;
		d = d->next;
		free(tmp->name);
		if(tmp->data) {
			dev_close(tmp);
		}
		free(tmp->resp);
		free(tmp);
	}
}

static int bytecmp(const void *a, const void *b)
{
	return *(unsigned char*)b - *(unsigned char*)a;
}

int dev_scan(void)
{
	char *ptr;
	char buf[1024], name[8];
	unsigned char ports[256];
	int i, num_ports = 0;
	struct device *head = 0, *node;

	if(!QueryDosDeviceA(0, buf, sizeof buf)) {
		errmsg("dev_scan: available serial port query failed");
		return -1;
	}

	ptr = buf;
	while(*ptr) {
		int n;
		if(sscanf(ptr, "COM%d", &n) == 1) {
			ports[num_ports++] = n;
		}
		ptr += strlen(ptr) + 1;
	}
	qsort(ports, num_ports, 1, bytecmp);

	for(i=0; i<num_ports; i++) {
		sprintf(name, "COM%d", (int)ports[i]);

		if(!(node = calloc(1, sizeof *node))) {
			goto err;
		}

		if(QueryDosDeviceA(name, buf, sizeof buf)) {
			if(!(node->name = malloc(strlen(name) + strlen(buf) + 4))) {
				free(node);
				goto err;
			}
			sprintf(node->name, "%s: %s", name, buf);

			printf("COM%d:", ports[i]);
			ptr = buf;
			while(*ptr) {
				printf(" %s", ptr);
				ptr += strlen(ptr) + 1;
			}
			putchar('\n');
		} else {
			if(!(node->name = malloc(strlen(name) + 1))) {
				free(node);
				goto err;
			}
			strcpy(node->name, name);

			printf("COM%d\n", ports[i]);
		}

		node->next = head;
		head = node;
	}

	free_list(devlist);
	devlist = head;
	return 0;

err:
	errmsg("dev_scan: failed to allocate memory");
	free_list(head);
	return -1;
}

int dev_open(struct device *dev)
{
	return -1;
}

void dev_close(struct device *dev)
{
}

int dev_sendcmd(struct device *dev, const char *fmt, ...)
{
	int fd, len;
	va_list ap;
	char *ptr;

	if(!dev || (fd = (int)dev->data) == -1) {
		fprintf(stderr, "dev_sendcmd: invalid device");
		return -1;
	}

	va_start(ap, fmt);
	len = vsnprintf(dev->resp, sizeof dev->resp - 1, fmt, ap);
	va_end(ap);

	if((dev->flags & DEV_MODMASK) && !strchr(dev->resp, '?')) {
		return 0;
	}

	printf("dev_sendcmd(\"%s\")\n", dev->resp);

	if(dev->resp[len-1] != '\n') {
		dev->resp[len] = '\n';
		dev->resp[++len] = 0;
	}

	/*
	if(write(fd, dev->resp, len) == -1) {
		fprintf(stderr, "dev_sendcmd: failed to send command");
		return -1;
	}
	*/
	dev->resp[0] = 0;

	if(readresp(dev, 2000) == -1) {
		fprintf(stderr, "dev_sendcmd: device not responding");
		return -1;
	}

	if((len = strlen(dev->resp)) > 0) {
		ptr = dev->resp + len - 1;
		while(ptr >= dev->resp && isspace(*ptr)) {
			*ptr-- = 0;
		}
	}

	printf("  <- \"%s\"\n", dev->resp);

	return (memcmp(dev->resp, "OK ", 3) == 0) ? 0 : -1;
}

static int readresp(struct device *dev, long timeout_msec)
{
	int fd = (int)dev->data;
	int sz;

	if(waitresp(dev, timeout_msec) == -1) {
		return -1;
	}

	/*
	if((sz = read(fd, dev->resp, sizeof dev->resp - 1)) <= 0) {
		return -1;
	}
	dev->resp[sz] = 0;
	*/
	return 0;
}

static int waitresp(struct device *dev, long timeout_msec)
{
	return -1;
}


int dev_number(struct device *dev, float num)
{
	char buf[16];
	int fd, len;

	if(!dev || num < 0.0) return -1;

	fd = (int)dev->data;

	len = snprintf(buf, sizeof buf, "%g", num);
	if(len > 6) len = 6;
	buf[len] = 0;

	printf("dev_number(\"%s\")\n", buf);
	buf[len] = '\n';
	buf[++len] = 0;

	/*write(fd, buf, len);*/
	return 0;
}
