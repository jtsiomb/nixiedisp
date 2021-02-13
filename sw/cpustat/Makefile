obj = cpustat.o
bin = cpustat

CFLAGS = -pedantic -Wall -g

$(bin): $(obj)
	$(CC) -o $@ $(obj) $(LDFLAGS)

.PHONY: clean
clean:
	$(RM) $(obj) $(bin)
