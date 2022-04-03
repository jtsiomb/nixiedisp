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
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <termios.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include "uimsg.h"
#include "dev.h"

#ifdef __linux__
#include <linux/serial.h>
#endif


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

int dev_scan(void)
{
	int fd;
	DIR *dir;
	struct dirent *dent;
	struct device *head = 0, *node;
#ifdef __linux__
	struct serial_struct ser;
#endif

	if(!(dir = opendir("/dev"))) {
		errmsg("dev_scan: failed to open /dev");
		return -1;
	}

	while((dent = readdir(dir))) {
		if(!strstr(dent->d_name, "tty")) {
			continue;
		}
		if((fd = openat(dirfd(dir), dent->d_name, O_RDONLY | O_NOCTTY | O_NONBLOCK)) == -1) {
			continue;
		}
#ifdef __linux__
		if(ioctl(fd, TIOCGSERIAL, &ser) == -1) {
			close(fd);
			continue;
		}
#else
		if(!isatty(fd)) {
			close(fd);
			continue;
		}
#endif
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
	char buf[256];

	if(!dev || !dev->name) {
		errmsg("dev_open: null device or device name");
		return -1;
	}

	if((fd = open(dev->name, O_RDWR | O_NOCTTY | O_NONBLOCK)) == -1) {
		errmsg("dev_open: failed to open %s: %s", dev->name, strerror(errno));
		return -1;
	}
	fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) & ~O_NONBLOCK);
	if(tcgetattr(fd, &term) == -1) {
		errmsg("dev_open: failed to get terminal attributes for: %s", dev->name);
		close(fd);
		return -1;
	}

	term.c_iflag = IGNBRK | IGNPAR | IGNCR;
	term.c_oflag = ONLCR;
	term.c_cflag = CLOCAL | CREAD | CS8;
	term.c_lflag = ICANON;
	cfsetispeed(&term, B38400);
	cfsetospeed(&term, B38400);
	tcsetattr(fd, TCSANOW, &term);

	write(fd, "e0\n", 3);
	if(read(fd, buf, sizeof buf) <= 0) {
		errmsg("dev_open: device not responding");
		close(fd);
		return -1;
	}
	if(memcmp(buf, "e0", 2) == 0) {
		read(fd, buf, sizeof buf);
	}

	dev->data = (void*)fd;
	dev->flags = 0;
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

	if(write(fd, dev->resp, len) == -1) {
		fprintf(stderr, "dev_sendcmd: failed to send command");
		return -1;
	}
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

	if((sz = read(fd, dev->resp, sizeof dev->resp - 1)) <= 0) {
		return -1;
	}
	dev->resp[sz] = 0;
	return 0;
}

static int waitresp(struct device *dev, long timeout_msec)
{
	fd_set rdset;
	int fd = (int)dev->data;
	long rem;
	struct timeval tv0, tv;

	gettimeofday(&tv0, 0);

	for(;;) {
		FD_ZERO(&rdset);
		FD_SET(fd, &rdset);

		tv.tv_sec = timeout_msec / 1000;
		tv.tv_usec = (timeout_msec % 1000) * 1000;

		if(select(fd + 1, &rdset, 0, 0, &tv) == -1 && errno != EINTR) break;

		if(FD_ISSET(fd, &rdset)) {
			return 0;
		}

		gettimeofday(&tv, 0);

		rem = timeout_msec - ((long)(tv.tv_sec - tv0.tv_sec) * 1000 + (long)(tv.tv_usec - tv0.tv_usec) / 1000);
		if(rem <= 0) break;

		timeout_msec = rem;
	}

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

	write(fd, buf, len);
	return 0;
}
