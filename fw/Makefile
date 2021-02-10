src = $(wildcard src/*.c)
obj = $(src:.c=.o)
bin = nixiedisp
hex = $(bin).hex
eep = $(bin).eep

mcu_gcc = atmega328p
mcu_dude = m328p

CC = avr-gcc
OBJCOPY = avr-objcopy

warn = -pedantic -Wall -Wno-overlength-strings

CFLAGS = -Os $(warn) -mmcu=$(mcu_gcc) -DF_CPU=14745600
LDFLAGS = -Wl,-Map,$(bin).map -mmcu=$(mcu_gcc) -lprintf_min

ifeq ($(mcu_gcc), atmega328pb)
	CFLAGS += -DHAS_PORT_E
endif

.PHONY: all
all: $(hex) $(eep)

$(bin): $(obj)
	$(CC) -o $@ $(obj) $(LDFLAGS)

$(hex): $(bin)
	$(OBJCOPY) -j .text -j .data -O ihex -R .eeprom $< $@

$(bin).bin: $(bin)
	$(OBJCOPY) -j .text -j .data -O binary -R .eeprom $< $@

$(eep): $(bin)
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@

.PHONY: fuses
fuses:
	avrdude -c usbtiny -p $(mcu_dude) -U lfuse:w:0xe6:m -U hfuse:w:0xd9:m -U efuse:w:0xf7:m

.PHONY: program
program: $(hex)
	avrdude -c usbtiny -p $(mcu_dude) -e -U flash:w:$(hex)

.PHONY: clean
clean:
	rm -f $(bin) $(obj) $(hex) $(eep) $(bin).map
