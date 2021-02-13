#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

void sighandler(int s);

int quit;
char buf[256];

int main(int argc, char **argv)
{
	int i, len, fd;
	struct termios term;
	FILE *fpstat;
	unsigned long val[7], prev[7], delta[7];

	if(!argv[1]) {
		fprintf(stderr, "pass the tty device connected to the nixie display\n");
		return 1;
	}

	signal(SIGINT, sighandler);
	signal(SIGTERM, sighandler);

	if((fd = open(argv[1], O_RDWR | O_NOCTTY)) == -1) {
		fprintf(stderr, "failed to open %s: %s\n", argv[1], strerror(errno));
		return 1;
	}

	if(tcgetattr(fd, &term) == -1) {
		fprintf(stderr, "failed to retrieve tty attributes for %s: %s\n", argv[1], strerror(errno));
		return 1;
	}
	term.c_iflag = IGNBRK | IGNPAR | IGNCR;
	term.c_oflag = ONLCR;
	term.c_cflag = CS8 | CREAD | CLOCAL;
	term.c_lflag = ICANON;
	cfsetispeed(&term, B38400);
	cfsetospeed(&term, B38400);
	tcsetattr(fd, TCSANOW, &term);

	if(!(fpstat = fopen("/proc/stat", "r"))) {
		fprintf(stderr, "failed to open /proc/stat: %s\n", strerror(errno));
		return 1;
	}
	fclose(fpstat);

	write(fd, "e0\n", 3);
	if((len = read(fd, buf, sizeof buf)) > 0 && memcmp(buf, "e0", 2) == 0) {
		read(fd, buf, sizeof buf);
	}
	write(fd, "mn\n", 3);
	if(read(fd, buf, sizeof buf) <= 0 || memcmp(buf, "OK", 2) != 0) {
		fprintf(stderr, "invalid response\n");
		return 1;
	}

	while(!quit) {
		fpstat = fopen("/proc/stat", "r");

		memcpy(prev, val, sizeof val);
		if(fscanf(fpstat, "cpu %lu %lu %lu %lu %lu %lu %lu", val, val + 1, val + 2, val + 3,
					val + 4, val + 5, val + 6) < 7) {
			write(fd, "      \n", 7);
		} else {
			unsigned long sum, usage;

			sum = 0;
			for(i=0; i<7; i++) {
				delta[i] = val[i] - prev[i];
				sum += delta[i];
			}

			if(sum) {
				usage = 100 - delta[3] * 100 / sum;
				len = sprintf(buf, "%lu\n", usage);
				write(fd, buf, len);
			}
		}
		fclose(fpstat);

		if(quit) break;
		sleep(1);
	}

	write(fd, "mc\n", 3);
	read(fd, buf, sizeof buf);
	return 0;
}

void sighandler(int s)
{
	quit = 1;
}
