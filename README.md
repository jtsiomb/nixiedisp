nixiedisp - USB nixie tube display
==================================
A 6-digit nixie tube numeric display, software-controlled over USB or RS232,
that also functions standalone as a clock. Designed to use IN-14 nixie tubes.
Powered by 12v DC supply through standard barrel jack (center-positive).

Excercise caution when operating without an enclosure, there are high voltages
(180V DC) present in the power supply section of the board, and around the
nixie tubes.

Project structure:

 - `hw/`: hardware design
 - `fw/`: firmware for the on-board AVR microcontroller
 - `sw/`: end-user host-side software for controlling the device from a computer. (TODO)

License
-------
Copyright (C) 2020-2021 John Tsiombikas <nuclear@member.fsf.org>

Hardware designs and software (firmware) in this project are free. Feel free to
use, modify, and/or redistribute under the terms of the GNU General Public
License v3, or at your option any later version published by the Free Software
Foundation. See COPYING for details.

How to build a nixiedisp device
-------------------------------
To build one of these for yourself, you need to:

  1. Zip up the contents of the `hw/gerber` directory, and send them to a PCB
     manufacturer to get boards made. For my own boards I used `jlcpcb.com`.

  2. Order the components listed in the bill of materials (`hw/bom.ods`). I
     ordered mine from `mouser.com`, and the spreadsheet contains the mouser
     reference number for each component, to make it easy to order the whole lot
     without too much searching. Make sure to order at least as many of each one
     of them, as specified in the bom.

  3. Find 6 (optionally 4) soviet IN-14 nixie tubes. They tend to go for about
     $10 - $15 each on ebay.

  4. Find a 12v DC power supply with a barrel jack (2mm center pin),
     center-positive (`+ -o)- -`), to power the board. It doesn't have to be
     regulated, but it must be able to provide at least about 600mA at 12v.
     (TODO: more accurate current requirements)

  5. If you got the git version of this project, you'll need to build the
     firmware by changing into `fw` and typing `make`. You'll need to have
     `avr-gcc`, `libc-avr`, and GNU make installed for this. Release archives
     include a pre-built firmware image you can use (`fw/nixiedisp.hex`).

  6. Assemble the board, and program the microcontroller with a suitable AVR
     ISP. If you have `avrdude` installed, you can simply change into `fw` and
     type `make program`, with the board powered up and the programmer
     connected.

References
----------
High-voltage power supply based on Michael Moorrees' nixie supply MK1.5:
https://threeneurons.wordpress.com/nixie-power-supply
