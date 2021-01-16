#ifndef CONFIG_H_
#define CONFIG_H_

#define VERSTR	"1.0"

/* pin assignments
 * B[0,2]: serial clock for the 3 shift registers
 * B4: SPI MISO connected to RTC I/O pin
 * B5: SPI SCK connected to RTC serial clock
 *
 * C0: serial data for the 3 shift registers
 * C1: hour separator LEDs
 * C2: RTC chip select (active high)
 *
 * C3: mode button (PCINT11)
 * C4: button A (PCINT12)
 * C5: button B (PCINT13)
 *
 * D[2,7]: nixie dots
 */
#define PB_CK1		0x01
#define PB_CK2		0x02
#define PB_CK3		0x04
#define PB_RTC_DATA	0x10
#define PB_RTC_CK	0x20
#define PC_SDATA	0x01
#define PC_HRSEP	0x02
#define PC_RTC_EN	0x04
#define PC_BN_MODE	0x08
#define PC_BN_A		0x10
#define PC_BN_B		0x20
#define PD_ADOT		0x04
#define PD_BDOT		0x08
#define PD_CDOT		0x10
#define PD_DDOT		0x20
#define PD_EDOT		0x40
#define PD_FDOT		0x80

#define PC_BNMASK	(PC_BN_MODE | PC_BN_A | PC_BN_B)


#endif	/* CONFIG_H_ */
