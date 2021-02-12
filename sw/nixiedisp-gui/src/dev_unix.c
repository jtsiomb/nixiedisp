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
#include <stdarg.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <termios.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <linux/serial.h>
#include "uimsg.h"
#include "dev.h"

static int waitresp(struct device *dev);

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

int dev_scan(void)
{
	int fd;
	DIR *dir;
	struct dirent *dent;
	struct device *head = 0, *node;
	struct serial_struct ser;

	if(!(dir = opendir("/dev"))) {
		errmsg("dev_scan: failed to open /dev");
		return -1;
	}

	while((dent = readdir(dir))) {
		if(!strstr(dent->d_name, "tty")) {
			continue;
		}
		if((fd = openat(dirfd(dir), dent->d_name, O_RDONLY | O_NOCTTY)) == -1) {
			continue;
		}
		if(ioctl(fd, TIOCGSERIAL, &ser) == -1) {
			close(fd);
			continue;
		}
		close(fd);

		if(!(node = calloc(1, sizeof *node))) {
			goto err;
		}
		if(!(node->name = malloc(strlen(dent->d_name) + 6))) {
			free(node);
			goto err;
		}
		sprintf(node->name, "/dev/%s", dent->d_name);

		node->data = (void*)-1;
		node->next = head;
		head = node;
	}

	closedir(dir);

	free_list(devlist);
	devlist = head;
	dev = 0;
	return 0;

err:
	errmsg("dev_scan: failed to allocate memory");
	free_list(head);
	return -1;
}

int dev_open(struct device *dev)
{
	int fd;
	struct termios term;

	if(!dev || !dev->name) {
		errmsg("dev_open: null device or device name");
		return -1;
	}

	if((fd = open(dev->name, O_RDWR | O_NOCTTY)) == -1) {
		errmsg("dev_open: failed to open %s: %s", dev->name, strerror(errno));
		return -1;
	}
	if(tcgetattr(fd, &term) == -1) {
		errmsg("dev_open: failed to get terminal attributes");
		close(fd);
		return -1;
	}

	term.c_cflag = CLOCAL | CREAD | CS8;
	term.c_iflag = IGNBRK | IGNPAR;
	tcsetattr(fd, TCSANOW, &term);

	cfsetispeed(&term, B38400);
	cfsetospeed(&term, B38400);


	dev->data = (void*)fd;
	return 0;
}

void dev_close(struct device *dev)
{
	int fd;

	if(!dev || (fd = (int)dev->data) == -1) {
		errmsg("dev_close: device was not open");
		return;
	}
	close(fd);
	dev->data = (void*)-1;
}

int dev_sendcmd(struct device *dev, const char *fmt, ...)
{
	int fd, len;
	va_list ap;

	if(!dev || (fd = (int)dev->data) == -1) {
		errmsg("dev_sendcmd: invalid device");
		return -1;
	}

	if(!dev->resp) {
		if(!(dev->resp = malloc(512))) {
			errmsg("dev_sendcmd: failed to allocate command/response buffer");
			return -1;
		}
		dev->resp_buf_size = 512;
	}

	va_start(ap, fmt);
	len = vsnprintf(dev->resp, dev->resp_buf_size, fmt, ap);
	va_end(ap);

	if(write(fd, dev->resp, len) == -1) {
		errmsg("dev_sendcmd: failed to send command");
		return -1;
	}
	dev->resp[0] = 0;

	if(waitresp(dev) == -1) {
		errmsg("dev_sendcmd: device not responding");
		return -1;
	}

	return (memcmp(dev->resp, "OK ", 3) == 0) ? 0 : -1;
}

static int readresp(struct device *dev)
{
	int fd = (int)dev->data;
	int sz, newsz, total = 0;
	char *tmpbuf;

	for(;;) {
		if(dev->resp_buf_size - total <= 1) {
			newsz = dev->resp_buf_size << 1;
			if(!(tmpbuf = realloc(dev->resp, newsz))) {
				fprintf(stderr, "readresp: failed to resize response buffer to %d bytes, truncating\n", newsz);
				break;
			}
		}

		if((sz = read(fd, dev->resp + total, dev->resp_buf_size - total - 1)) <= 0) {
			break;
		}
		total += sz;
	}

	dev->resp[total] = 0;
	return total ? 0 : -1;
}

static int waitresp(struct device *dev)
{
	fd_set rdset;
	int fd = (int)dev->data, rem;
	struct timeval tv0, tv;

	FD_ZERO(&rdset);
	FD_SET(fd, &rdset);

	gettimeofday(&tv0, 0);

	tv.tv_sec = 10;
	tv.tv_usec = 0;


	for(;;) {
		if(select(fd + 1, &rdset, 0, 0, &tv) == -1 && errno != EINTR) break;

		if(FD_ISSET(fd, &rdset)) {
			return readresp(dev);
		}

		gettimeofday(&tv, 0);
		rem = 10 - (int)(tv.tv_sec - tv0.tv_sec);
		if(rem <= 0) break;

		tv.tv_sec = 10 - rem;
		tv.tv_usec = 0;
	}

	return -1;
}
