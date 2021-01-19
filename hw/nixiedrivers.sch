EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 8
Title "USB nixie tube display"
Date "2021-01-19"
Rev "2"
Comp ""
Comment1 ""
Comment2 "https://github.com/jtsiomb/nixiedisp"
Comment3 "Free hardware design. License: GNU GPLv3 (or later)"
Comment4 "Copyright © John Tsiombikas <nuclear@member.fsf.org>"
$EndDescr
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF0530D
P 5350 1500
AR Path="/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF0530D" Ref="Q3"  Part="1" 
AR Path="/6006A6FC/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF0530D" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF0530D" Ref="Q14"  Part="1" 
AR Path="/603EF886/5FF0530D" Ref="Q25"  Part="1" 
AR Path="/603EFAE2/5FF0530D" Ref="Q58"  Part="1" 
AR Path="/603FFB52/5FF0530D" Ref="Q36"  Part="1" 
AR Path="/603FFDD2/5FF0530D" Ref="Q47"  Part="1" 
F 0 "Q14" H 5200 1350 50  0000 L CNN
F 1 "MMBTA42" H 5100 1650 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 1425 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 1500 50  0001 L CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF05313
P 4950 1500
AR Path="/5FF05313" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF05313" Ref="R15"  Part="1" 
AR Path="/6006A6FC/5FF05313" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF05313" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF05313" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF05313" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF05313" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF05313" Ref="R28"  Part="1" 
AR Path="/603EF886/5FF05313" Ref="R41"  Part="1" 
AR Path="/603EFAE2/5FF05313" Ref="R80"  Part="1" 
AR Path="/603FFB52/5FF05313" Ref="R54"  Part="1" 
AR Path="/603FFDD2/5FF05313" Ref="R67"  Part="1" 
F 0 "R28" V 4850 1500 50  0000 C CNN
F 1 "47k" V 4950 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 1500 50  0001 C CNN
F 3 "~" H 4950 1500 50  0001 C CNN
	1    4950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 1500 5150 1500
$Comp
L power:GND #PWR?
U 1 1 5FF0531A
P 5450 1700
AR Path="/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF0531A" Ref="#PWR031"  Part="1" 
AR Path="/6006A6FC/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF0531A" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF0531A" Ref="#PWR049"  Part="1" 
AR Path="/603EF886/5FF0531A" Ref="#PWR067"  Part="1" 
AR Path="/603EFAE2/5FF0531A" Ref="#PWR0121"  Part="1" 
AR Path="/603FFB52/5FF0531A" Ref="#PWR085"  Part="1" 
AR Path="/603FFDD2/5FF0531A" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0121" H 5450 1450 50  0001 C CNN
F 1 "GND" H 5450 1550 50  0000 C CNN
F 2 "" H 5450 1700 50  0001 C CNN
F 3 "" H 5450 1700 50  0001 C CNN
	1    5450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1300 5650 1300
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF05321
P 6150 1950
AR Path="/5FF05321" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF05321" Ref="Q9"  Part="1" 
AR Path="/6006A6FC/5FF05321" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF05321" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF05321" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF05321" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF05321" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF05321" Ref="Q20"  Part="1" 
AR Path="/603EF886/5FF05321" Ref="Q31"  Part="1" 
AR Path="/603EFAE2/5FF05321" Ref="Q64"  Part="1" 
AR Path="/603FFB52/5FF05321" Ref="Q42"  Part="1" 
AR Path="/603FFDD2/5FF05321" Ref="Q53"  Part="1" 
F 0 "Q20" H 6000 1800 50  0000 L CNN
F 1 "MMBTA42" H 5900 2100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 1875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 6150 1950 50  0001 L CNN
	1    6150 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF05327
P 5750 1950
AR Path="/5FF05327" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF05327" Ref="R22"  Part="1" 
AR Path="/6006A6FC/5FF05327" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF05327" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF05327" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF05327" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF05327" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF05327" Ref="R35"  Part="1" 
AR Path="/603EF886/5FF05327" Ref="R48"  Part="1" 
AR Path="/603EFAE2/5FF05327" Ref="R87"  Part="1" 
AR Path="/603FFB52/5FF05327" Ref="R61"  Part="1" 
AR Path="/603FFDD2/5FF05327" Ref="R74"  Part="1" 
F 0 "R35" V 5650 1950 50  0000 C CNN
F 1 "47k" V 5750 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 1950 50  0001 C CNN
F 3 "~" H 5750 1950 50  0001 C CNN
	1    5750 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 1950 5950 1950
Wire Wire Line
	6250 1750 6450 1750
$Comp
L power:GND #PWR?
U 1 1 5FF05F57
P 6250 2150
AR Path="/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF05F57" Ref="#PWR037"  Part="1" 
AR Path="/6006A6FC/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF05F57" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF05F57" Ref="#PWR055"  Part="1" 
AR Path="/603EF886/5FF05F57" Ref="#PWR073"  Part="1" 
AR Path="/603EFAE2/5FF05F57" Ref="#PWR0127"  Part="1" 
AR Path="/603FFB52/5FF05F57" Ref="#PWR091"  Part="1" 
AR Path="/603FFDD2/5FF05F57" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0127" H 6250 1900 50  0001 C CNN
F 1 "GND" H 6250 2000 50  0000 C CNN
F 2 "" H 6250 2150 50  0001 C CNN
F 3 "" H 6250 2150 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF07144
P 5350 2300
AR Path="/5FF07144" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF07144" Ref="Q4"  Part="1" 
AR Path="/6006A6FC/5FF07144" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF07144" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF07144" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF07144" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF07144" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF07144" Ref="Q15"  Part="1" 
AR Path="/603EF886/5FF07144" Ref="Q26"  Part="1" 
AR Path="/603EFAE2/5FF07144" Ref="Q59"  Part="1" 
AR Path="/603FFB52/5FF07144" Ref="Q37"  Part="1" 
AR Path="/603FFDD2/5FF07144" Ref="Q48"  Part="1" 
F 0 "Q15" H 5200 2150 50  0000 L CNN
F 1 "MMBTA42" H 5100 2450 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 2225 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 2300 50  0001 L CNN
	1    5350 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF071D6
P 4950 2300
AR Path="/5FF071D6" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF071D6" Ref="R16"  Part="1" 
AR Path="/6006A6FC/5FF071D6" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF071D6" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF071D6" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF071D6" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF071D6" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF071D6" Ref="R29"  Part="1" 
AR Path="/603EF886/5FF071D6" Ref="R42"  Part="1" 
AR Path="/603EFAE2/5FF071D6" Ref="R81"  Part="1" 
AR Path="/603FFB52/5FF071D6" Ref="R55"  Part="1" 
AR Path="/603FFDD2/5FF071D6" Ref="R68"  Part="1" 
F 0 "R29" V 4850 2300 50  0000 C CNN
F 1 "47k" V 4950 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 2300 50  0001 C CNN
F 3 "~" H 4950 2300 50  0001 C CNN
	1    4950 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 2300 5150 2300
$Comp
L power:GND #PWR?
U 1 1 5FF071E1
P 5450 2500
AR Path="/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF071E1" Ref="#PWR032"  Part="1" 
AR Path="/6006A6FC/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF071E1" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF071E1" Ref="#PWR050"  Part="1" 
AR Path="/603EF886/5FF071E1" Ref="#PWR068"  Part="1" 
AR Path="/603EFAE2/5FF071E1" Ref="#PWR0122"  Part="1" 
AR Path="/603FFB52/5FF071E1" Ref="#PWR086"  Part="1" 
AR Path="/603FFDD2/5FF071E1" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0122" H 5450 2250 50  0001 C CNN
F 1 "GND" H 5450 2350 50  0000 C CNN
F 2 "" H 5450 2500 50  0001 C CNN
F 3 "" H 5450 2500 50  0001 C CNN
	1    5450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2100 5650 2100
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF071EC
P 6150 2750
AR Path="/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF071EC" Ref="Q10"  Part="1" 
AR Path="/6006A6FC/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF071EC" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF071EC" Ref="Q21"  Part="1" 
AR Path="/603EF886/5FF071EC" Ref="Q32"  Part="1" 
AR Path="/603EFAE2/5FF071EC" Ref="Q65"  Part="1" 
AR Path="/603FFB52/5FF071EC" Ref="Q43"  Part="1" 
AR Path="/603FFDD2/5FF071EC" Ref="Q54"  Part="1" 
F 0 "Q21" H 6000 2600 50  0000 L CNN
F 1 "MMBTA42" H 5900 2900 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 2675 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 6150 2750 50  0001 L CNN
	1    6150 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF071F6
P 5750 2750
AR Path="/5FF071F6" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF071F6" Ref="R23"  Part="1" 
AR Path="/6006A6FC/5FF071F6" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF071F6" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF071F6" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF071F6" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF071F6" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF071F6" Ref="R36"  Part="1" 
AR Path="/603EF886/5FF071F6" Ref="R49"  Part="1" 
AR Path="/603EFAE2/5FF071F6" Ref="R88"  Part="1" 
AR Path="/603FFB52/5FF071F6" Ref="R62"  Part="1" 
AR Path="/603FFDD2/5FF071F6" Ref="R75"  Part="1" 
F 0 "R36" V 5650 2750 50  0000 C CNN
F 1 "47k" V 5750 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 2750 50  0001 C CNN
F 3 "~" H 5750 2750 50  0001 C CNN
	1    5750 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 2750 5950 2750
Wire Wire Line
	6250 2550 6500 2550
$Comp
L power:GND #PWR?
U 1 1 5FF07202
P 6250 2950
AR Path="/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF07202" Ref="#PWR038"  Part="1" 
AR Path="/6006A6FC/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF07202" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF07202" Ref="#PWR056"  Part="1" 
AR Path="/603EF886/5FF07202" Ref="#PWR074"  Part="1" 
AR Path="/603EFAE2/5FF07202" Ref="#PWR0128"  Part="1" 
AR Path="/603FFB52/5FF07202" Ref="#PWR092"  Part="1" 
AR Path="/603FFDD2/5FF07202" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0128" H 6250 2700 50  0001 C CNN
F 1 "GND" H 6250 2800 50  0000 C CNN
F 2 "" H 6250 2950 50  0001 C CNN
F 3 "" H 6250 2950 50  0001 C CNN
	1    6250 2950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF09C0A
P 5350 3100
AR Path="/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF09C0A" Ref="Q5"  Part="1" 
AR Path="/6006A6FC/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF09C0A" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF09C0A" Ref="Q16"  Part="1" 
AR Path="/603EF886/5FF09C0A" Ref="Q27"  Part="1" 
AR Path="/603EFAE2/5FF09C0A" Ref="Q60"  Part="1" 
AR Path="/603FFB52/5FF09C0A" Ref="Q38"  Part="1" 
AR Path="/603FFDD2/5FF09C0A" Ref="Q49"  Part="1" 
F 0 "Q16" H 5200 2950 50  0000 L CNN
F 1 "MMBTA42" H 5100 3250 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 3025 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 3100 50  0001 L CNN
	1    5350 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF09D0C
P 4950 3100
AR Path="/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D0C" Ref="R17"  Part="1" 
AR Path="/6006A6FC/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF09D0C" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF09D0C" Ref="R30"  Part="1" 
AR Path="/603EF886/5FF09D0C" Ref="R43"  Part="1" 
AR Path="/603EFAE2/5FF09D0C" Ref="R82"  Part="1" 
AR Path="/603FFB52/5FF09D0C" Ref="R56"  Part="1" 
AR Path="/603FFDD2/5FF09D0C" Ref="R69"  Part="1" 
F 0 "R30" V 4850 3100 50  0000 C CNN
F 1 "47k" V 4950 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 3100 50  0001 C CNN
F 3 "~" H 4950 3100 50  0001 C CNN
	1    4950 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3100 5150 3100
$Comp
L power:GND #PWR?
U 1 1 5FF09D17
P 5450 3300
AR Path="/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D17" Ref="#PWR033"  Part="1" 
AR Path="/6006A6FC/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF09D17" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF09D17" Ref="#PWR051"  Part="1" 
AR Path="/603EF886/5FF09D17" Ref="#PWR069"  Part="1" 
AR Path="/603EFAE2/5FF09D17" Ref="#PWR0123"  Part="1" 
AR Path="/603FFB52/5FF09D17" Ref="#PWR087"  Part="1" 
AR Path="/603FFDD2/5FF09D17" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0123" H 5450 3050 50  0001 C CNN
F 1 "GND" H 5450 3150 50  0000 C CNN
F 2 "" H 5450 3300 50  0001 C CNN
F 3 "" H 5450 3300 50  0001 C CNN
	1    5450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2900 5650 2900
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF09D22
P 6150 3550
AR Path="/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D22" Ref="Q11"  Part="1" 
AR Path="/6006A6FC/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF09D22" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF09D22" Ref="Q22"  Part="1" 
AR Path="/603EF886/5FF09D22" Ref="Q33"  Part="1" 
AR Path="/603EFAE2/5FF09D22" Ref="Q66"  Part="1" 
AR Path="/603FFB52/5FF09D22" Ref="Q44"  Part="1" 
AR Path="/603FFDD2/5FF09D22" Ref="Q55"  Part="1" 
F 0 "Q22" H 6000 3400 50  0000 L CNN
F 1 "MMBTA42" H 5900 3700 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 3475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 6150 3550 50  0001 L CNN
	1    6150 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF09D2C
P 5750 3550
AR Path="/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D2C" Ref="R24"  Part="1" 
AR Path="/6006A6FC/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF09D2C" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF09D2C" Ref="R37"  Part="1" 
AR Path="/603EF886/5FF09D2C" Ref="R50"  Part="1" 
AR Path="/603EFAE2/5FF09D2C" Ref="R89"  Part="1" 
AR Path="/603FFB52/5FF09D2C" Ref="R63"  Part="1" 
AR Path="/603FFDD2/5FF09D2C" Ref="R76"  Part="1" 
F 0 "R37" V 5650 3550 50  0000 C CNN
F 1 "47k" V 5750 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 3550 50  0001 C CNN
F 3 "~" H 5750 3550 50  0001 C CNN
	1    5750 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3550 5950 3550
Wire Wire Line
	6250 3350 6500 3350
$Comp
L power:GND #PWR?
U 1 1 5FF09D38
P 6250 3750
AR Path="/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D38" Ref="#PWR039"  Part="1" 
AR Path="/6006A6FC/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF09D38" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF09D38" Ref="#PWR057"  Part="1" 
AR Path="/603EF886/5FF09D38" Ref="#PWR075"  Part="1" 
AR Path="/603EFAE2/5FF09D38" Ref="#PWR0129"  Part="1" 
AR Path="/603FFB52/5FF09D38" Ref="#PWR093"  Part="1" 
AR Path="/603FFDD2/5FF09D38" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0129" H 6250 3500 50  0001 C CNN
F 1 "GND" H 6250 3600 50  0000 C CNN
F 2 "" H 6250 3750 50  0001 C CNN
F 3 "" H 6250 3750 50  0001 C CNN
	1    6250 3750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF09D42
P 5350 3900
AR Path="/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D42" Ref="Q6"  Part="1" 
AR Path="/6006A6FC/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF09D42" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF09D42" Ref="Q17"  Part="1" 
AR Path="/603EF886/5FF09D42" Ref="Q28"  Part="1" 
AR Path="/603EFAE2/5FF09D42" Ref="Q61"  Part="1" 
AR Path="/603FFB52/5FF09D42" Ref="Q39"  Part="1" 
AR Path="/603FFDD2/5FF09D42" Ref="Q50"  Part="1" 
F 0 "Q17" H 5200 3750 50  0000 L CNN
F 1 "MMBTA42" H 5100 4050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 3825 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 3900 50  0001 L CNN
	1    5350 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF09D4C
P 4950 3900
AR Path="/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D4C" Ref="R18"  Part="1" 
AR Path="/6006A6FC/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF09D4C" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF09D4C" Ref="R31"  Part="1" 
AR Path="/603EF886/5FF09D4C" Ref="R44"  Part="1" 
AR Path="/603EFAE2/5FF09D4C" Ref="R83"  Part="1" 
AR Path="/603FFB52/5FF09D4C" Ref="R57"  Part="1" 
AR Path="/603FFDD2/5FF09D4C" Ref="R70"  Part="1" 
F 0 "R31" V 4850 3900 50  0000 C CNN
F 1 "47k" V 4950 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 3900 50  0001 C CNN
F 3 "~" H 4950 3900 50  0001 C CNN
	1    4950 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3900 5150 3900
$Comp
L power:GND #PWR?
U 1 1 5FF09D57
P 5450 4100
AR Path="/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D57" Ref="#PWR034"  Part="1" 
AR Path="/6006A6FC/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF09D57" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF09D57" Ref="#PWR052"  Part="1" 
AR Path="/603EF886/5FF09D57" Ref="#PWR070"  Part="1" 
AR Path="/603EFAE2/5FF09D57" Ref="#PWR0124"  Part="1" 
AR Path="/603FFB52/5FF09D57" Ref="#PWR088"  Part="1" 
AR Path="/603FFDD2/5FF09D57" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0124" H 5450 3850 50  0001 C CNN
F 1 "GND" H 5450 3950 50  0000 C CNN
F 2 "" H 5450 4100 50  0001 C CNN
F 3 "" H 5450 4100 50  0001 C CNN
	1    5450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3700 5700 3700
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF09D62
P 6150 4350
AR Path="/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D62" Ref="Q12"  Part="1" 
AR Path="/6006A6FC/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF09D62" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF09D62" Ref="Q23"  Part="1" 
AR Path="/603EF886/5FF09D62" Ref="Q34"  Part="1" 
AR Path="/603EFAE2/5FF09D62" Ref="Q67"  Part="1" 
AR Path="/603FFB52/5FF09D62" Ref="Q45"  Part="1" 
AR Path="/603FFDD2/5FF09D62" Ref="Q56"  Part="1" 
F 0 "Q23" H 6000 4200 50  0000 L CNN
F 1 "MMBTA42" H 5900 4500 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 4275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 6150 4350 50  0001 L CNN
	1    6150 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF09D6C
P 5750 4350
AR Path="/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D6C" Ref="R25"  Part="1" 
AR Path="/6006A6FC/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF09D6C" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF09D6C" Ref="R38"  Part="1" 
AR Path="/603EF886/5FF09D6C" Ref="R51"  Part="1" 
AR Path="/603EFAE2/5FF09D6C" Ref="R90"  Part="1" 
AR Path="/603FFB52/5FF09D6C" Ref="R64"  Part="1" 
AR Path="/603FFDD2/5FF09D6C" Ref="R77"  Part="1" 
F 0 "R38" V 5650 4350 50  0000 C CNN
F 1 "47k" V 5750 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 4350 50  0001 C CNN
F 3 "~" H 5750 4350 50  0001 C CNN
	1    5750 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 4350 5950 4350
Wire Wire Line
	6250 4150 6500 4150
$Comp
L power:GND #PWR?
U 1 1 5FF09D78
P 6250 4550
AR Path="/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF09D78" Ref="#PWR040"  Part="1" 
AR Path="/6006A6FC/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF09D78" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF09D78" Ref="#PWR058"  Part="1" 
AR Path="/603EF886/5FF09D78" Ref="#PWR076"  Part="1" 
AR Path="/603EFAE2/5FF09D78" Ref="#PWR0130"  Part="1" 
AR Path="/603FFB52/5FF09D78" Ref="#PWR094"  Part="1" 
AR Path="/603FFDD2/5FF09D78" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0130" H 6250 4300 50  0001 C CNN
F 1 "GND" H 6250 4400 50  0000 C CNN
F 2 "" H 6250 4550 50  0001 C CNN
F 3 "" H 6250 4550 50  0001 C CNN
	1    6250 4550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF15CE1
P 5350 4700
AR Path="/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF15CE1" Ref="Q7"  Part="1" 
AR Path="/6006A6FC/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF15CE1" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF15CE1" Ref="Q18"  Part="1" 
AR Path="/603EF886/5FF15CE1" Ref="Q29"  Part="1" 
AR Path="/603EFAE2/5FF15CE1" Ref="Q62"  Part="1" 
AR Path="/603FFB52/5FF15CE1" Ref="Q40"  Part="1" 
AR Path="/603FFDD2/5FF15CE1" Ref="Q51"  Part="1" 
F 0 "Q18" H 5200 4550 50  0000 L CNN
F 1 "MMBTA42" H 5100 4850 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 4625 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 4700 50  0001 L CNN
	1    5350 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF15EC3
P 4950 4700
AR Path="/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF15EC3" Ref="R19"  Part="1" 
AR Path="/6006A6FC/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF15EC3" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF15EC3" Ref="R32"  Part="1" 
AR Path="/603EF886/5FF15EC3" Ref="R45"  Part="1" 
AR Path="/603EFAE2/5FF15EC3" Ref="R84"  Part="1" 
AR Path="/603FFB52/5FF15EC3" Ref="R58"  Part="1" 
AR Path="/603FFDD2/5FF15EC3" Ref="R71"  Part="1" 
F 0 "R32" V 4850 4700 50  0000 C CNN
F 1 "47k" V 4950 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 4700 50  0001 C CNN
F 3 "~" H 4950 4700 50  0001 C CNN
	1    4950 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4700 5150 4700
$Comp
L power:GND #PWR?
U 1 1 5FF15ECE
P 5450 4900
AR Path="/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF15ECE" Ref="#PWR035"  Part="1" 
AR Path="/6006A6FC/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF15ECE" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF15ECE" Ref="#PWR053"  Part="1" 
AR Path="/603EF886/5FF15ECE" Ref="#PWR071"  Part="1" 
AR Path="/603EFAE2/5FF15ECE" Ref="#PWR0125"  Part="1" 
AR Path="/603FFB52/5FF15ECE" Ref="#PWR089"  Part="1" 
AR Path="/603FFDD2/5FF15ECE" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0125" H 5450 4650 50  0001 C CNN
F 1 "GND" H 5450 4750 50  0000 C CNN
F 2 "" H 5450 4900 50  0001 C CNN
F 3 "" H 5450 4900 50  0001 C CNN
	1    5450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4500 5700 4500
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF15ED9
P 6150 5150
AR Path="/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF15ED9" Ref="Q13"  Part="1" 
AR Path="/6006A6FC/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF15ED9" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF15ED9" Ref="Q24"  Part="1" 
AR Path="/603EF886/5FF15ED9" Ref="Q35"  Part="1" 
AR Path="/603EFAE2/5FF15ED9" Ref="Q68"  Part="1" 
AR Path="/603FFB52/5FF15ED9" Ref="Q46"  Part="1" 
AR Path="/603FFDD2/5FF15ED9" Ref="Q57"  Part="1" 
F 0 "Q24" H 6000 5000 50  0000 L CNN
F 1 "MMBTA42" H 5900 5300 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 5075 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 6150 5150 50  0001 L CNN
	1    6150 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF15EE3
P 5750 5150
AR Path="/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF15EE3" Ref="R26"  Part="1" 
AR Path="/6006A6FC/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF15EE3" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF15EE3" Ref="R39"  Part="1" 
AR Path="/603EF886/5FF15EE3" Ref="R52"  Part="1" 
AR Path="/603EFAE2/5FF15EE3" Ref="R91"  Part="1" 
AR Path="/603FFB52/5FF15EE3" Ref="R65"  Part="1" 
AR Path="/603FFDD2/5FF15EE3" Ref="R78"  Part="1" 
F 0 "R39" V 5650 5150 50  0000 C CNN
F 1 "47k" V 5750 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 5150 50  0001 C CNN
F 3 "~" H 5750 5150 50  0001 C CNN
	1    5750 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 5150 5950 5150
Wire Wire Line
	6250 4950 6500 4950
$Comp
L power:GND #PWR?
U 1 1 5FF15EEF
P 6250 5350
AR Path="/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF15EEF" Ref="#PWR041"  Part="1" 
AR Path="/6006A6FC/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF15EEF" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF15EEF" Ref="#PWR059"  Part="1" 
AR Path="/603EF886/5FF15EEF" Ref="#PWR077"  Part="1" 
AR Path="/603EFAE2/5FF15EEF" Ref="#PWR0131"  Part="1" 
AR Path="/603FFB52/5FF15EEF" Ref="#PWR095"  Part="1" 
AR Path="/603FFDD2/5FF15EEF" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0131" H 6250 5100 50  0001 C CNN
F 1 "GND" H 6250 5200 50  0000 C CNN
F 2 "" H 6250 5350 50  0001 C CNN
F 3 "" H 6250 5350 50  0001 C CNN
	1    6250 5350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBTA42 Q?
U 1 1 5FF15EF9
P 5350 5850
AR Path="/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/5FEFEA8C/5FF15EF9" Ref="Q8"  Part="1" 
AR Path="/6006A6FC/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/60074ED0/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/6007521A/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/6008AEBF/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/6008B1C5/5FF15EF9" Ref="Q?"  Part="1" 
AR Path="/6039F880/5FF15EF9" Ref="Q19"  Part="1" 
AR Path="/603EF886/5FF15EF9" Ref="Q30"  Part="1" 
AR Path="/603EFAE2/5FF15EF9" Ref="Q63"  Part="1" 
AR Path="/603FFB52/5FF15EF9" Ref="Q41"  Part="1" 
AR Path="/603FFDD2/5FF15EF9" Ref="Q52"  Part="1" 
F 0 "Q19" H 5200 5700 50  0000 L CNN
F 1 "MMBTA42" H 5100 6000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 5775 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBTA42LT1-D.PDF" H 5350 5850 50  0001 L CNN
	1    5350 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF15F03
P 4950 5850
AR Path="/5FF15F03" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF15F03" Ref="R20"  Part="1" 
AR Path="/6006A6FC/5FF15F03" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF15F03" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF15F03" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF15F03" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF15F03" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF15F03" Ref="R33"  Part="1" 
AR Path="/603EF886/5FF15F03" Ref="R46"  Part="1" 
AR Path="/603EFAE2/5FF15F03" Ref="R85"  Part="1" 
AR Path="/603FFB52/5FF15F03" Ref="R59"  Part="1" 
AR Path="/603FFDD2/5FF15F03" Ref="R72"  Part="1" 
F 0 "R33" V 4850 5850 50  0000 C CNN
F 1 "47k" V 4950 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 5850 50  0001 C CNN
F 3 "~" H 4950 5850 50  0001 C CNN
	1    4950 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 5850 5150 5850
$Comp
L power:GND #PWR?
U 1 1 5FF15F0E
P 5450 6050
AR Path="/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/5FF15F0E" Ref="#PWR036"  Part="1" 
AR Path="/6006A6FC/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/5FF15F0E" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/5FF15F0E" Ref="#PWR054"  Part="1" 
AR Path="/603EF886/5FF15F0E" Ref="#PWR072"  Part="1" 
AR Path="/603EFAE2/5FF15F0E" Ref="#PWR0126"  Part="1" 
AR Path="/603FFB52/5FF15F0E" Ref="#PWR090"  Part="1" 
AR Path="/603FFDD2/5FF15F0E" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0126" H 5450 5800 50  0001 C CNN
F 1 "GND" H 5450 5900 50  0000 C CNN
F 2 "" H 5450 6050 50  0001 C CNN
F 3 "" H 5450 6050 50  0001 C CNN
	1    5450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5650 6000 5650
$Comp
L Device:R R?
U 1 1 5FF51489
P 5700 5650
AR Path="/5FF51489" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF51489" Ref="R21"  Part="1" 
AR Path="/6006A6FC/5FF51489" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF51489" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF51489" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF51489" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF51489" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF51489" Ref="R34"  Part="1" 
AR Path="/603EF886/5FF51489" Ref="R47"  Part="1" 
AR Path="/603EFAE2/5FF51489" Ref="R86"  Part="1" 
AR Path="/603FFB52/5FF51489" Ref="R60"  Part="1" 
AR Path="/603FFDD2/5FF51489" Ref="R73"  Part="1" 
F 0 "R34" V 5600 5650 50  0000 C CNN
F 1 "160k" V 5700 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5630 5650 50  0001 C CNN
F 3 "~" H 5700 5650 50  0001 C CNN
	1    5700 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 5650 5450 5650
Text HLabel 6450 1750 2    50   Output ~ 0
N1
Text HLabel 5650 2100 2    50   Output ~ 0
N2
Text HLabel 6500 2550 2    50   Output ~ 0
N3
Text HLabel 5650 2900 2    50   Output ~ 0
N4
Text HLabel 6500 3350 2    50   Output ~ 0
N5
Text HLabel 5700 3700 2    50   Output ~ 0
N6
Text HLabel 6500 4150 2    50   Output ~ 0
N7
Text HLabel 5700 4500 2    50   Output ~ 0
N8
Text HLabel 6500 4950 2    50   Output ~ 0
N9
Text HLabel 5650 1300 2    50   Output ~ 0
N0
Text HLabel 6000 5650 2    50   Output ~ 0
NL
Wire Wire Line
	4950 4350 4950 4300
Wire Wire Line
	4950 4350 5600 4350
Wire Wire Line
	4950 3550 4950 3500
Wire Wire Line
	4950 3550 5600 3550
Wire Wire Line
	4950 2750 4950 2700
Wire Wire Line
	4950 2750 5600 2750
Wire Wire Line
	4950 1950 4950 1900
Wire Wire Line
	4950 1950 5600 1950
Wire Wire Line
	3900 2600 4000 2600
Wire Wire Line
	4000 2600 4000 1500
Wire Wire Line
	3900 2700 4050 2700
Wire Wire Line
	4050 2700 4050 1900
Wire Wire Line
	3900 2800 4100 2800
Wire Wire Line
	4100 2800 4100 2300
Wire Wire Line
	3900 2900 4150 2900
Wire Wire Line
	4150 2900 4150 2700
Wire Wire Line
	3900 3000 4350 3000
Wire Wire Line
	4350 3000 4350 3100
Wire Wire Line
	3900 3100 4300 3100
Wire Wire Line
	4300 3100 4300 3500
Wire Wire Line
	3900 3200 4250 3200
Wire Wire Line
	4250 3200 4250 3900
Wire Wire Line
	3900 3300 4200 3300
Wire Wire Line
	4200 3300 4200 4300
Wire Wire Line
	3900 3400 4150 3400
Wire Wire Line
	4150 3400 4150 4700
Wire Wire Line
	3900 3500 4100 3500
Wire Wire Line
	4100 3500 4100 5150
NoConn ~ 3900 3600
NoConn ~ 3900 3700
NoConn ~ 3900 3800
NoConn ~ 3900 3900
NoConn ~ 3900 4000
NoConn ~ 3900 4100
$Comp
L power:GND #PWR?
U 1 1 6026FEC7
P 3300 4250
AR Path="/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/6026FEC7" Ref="#PWR030"  Part="1" 
AR Path="/6006A6FC/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/6026FEC7" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/6026FEC7" Ref="#PWR048"  Part="1" 
AR Path="/603EF886/6026FEC7" Ref="#PWR066"  Part="1" 
AR Path="/603EFAE2/6026FEC7" Ref="#PWR0120"  Part="1" 
AR Path="/603FFB52/6026FEC7" Ref="#PWR084"  Part="1" 
AR Path="/603FFDD2/6026FEC7" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0120" H 3300 4000 50  0001 C CNN
F 1 "GND" H 3305 4077 50  0000 C CNN
F 2 "" H 3300 4250 50  0001 C CNN
F 3 "" H 3300 4250 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR029
U 1 1 6028B489
P 3300 2450
AR Path="/5FEFEA8C/6028B489" Ref="#PWR029"  Part="1" 
AR Path="/6039F880/6028B489" Ref="#PWR047"  Part="1" 
AR Path="/603EF886/6028B489" Ref="#PWR065"  Part="1" 
AR Path="/603EFAE2/6028B489" Ref="#PWR0119"  Part="1" 
AR Path="/603FFB52/6028B489" Ref="#PWR083"  Part="1" 
AR Path="/603FFDD2/6028B489" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0119" H 3300 2300 50  0001 C CNN
F 1 "VCC" H 3315 2623 50  0000 C CNN
F 2 "" H 3300 2450 50  0001 C CNN
F 3 "" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3200 2400 3200
Wire Wire Line
	2700 3300 2400 3300
Wire Wire Line
	2700 3400 2400 3400
Wire Wire Line
	2700 3500 2400 3500
Text HLabel 2400 3200 0    50   Input ~ 0
D0
Text HLabel 2400 3300 0    50   Input ~ 0
D1
Text HLabel 2400 3400 0    50   Input ~ 0
D2
Text HLabel 2400 3500 0    50   Input ~ 0
D3
Text HLabel 4250 5850 0    50   Input ~ 0
LDOT
Wire Wire Line
	4250 5850 4800 5850
$Comp
L Device:C C18
U 1 1 61F3B605
P 3300 4900
AR Path="/5FEFEA8C/61F3B605" Ref="C18"  Part="1" 
AR Path="/6039F880/61F3B605" Ref="C21"  Part="1" 
AR Path="/603EF886/61F3B605" Ref="C24"  Part="1" 
AR Path="/603FFB52/61F3B605" Ref="C27"  Part="1" 
AR Path="/603FFDD2/61F3B605" Ref="C30"  Part="1" 
AR Path="/603EFAE2/61F3B605" Ref="C33"  Part="1" 
F 0 "C21" H 3350 5000 50  0000 L CNN
F 1 "0.1uF" H 3350 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 4750 50  0001 C CNN
F 3 "~" H 3300 4900 50  0001 C CNN
	1    3300 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR042
U 1 1 61F4A88C
P 3300 4750
AR Path="/5FEFEA8C/61F4A88C" Ref="#PWR042"  Part="1" 
AR Path="/6039F880/61F4A88C" Ref="#PWR060"  Part="1" 
AR Path="/603EF886/61F4A88C" Ref="#PWR078"  Part="1" 
AR Path="/603EFAE2/61F4A88C" Ref="#PWR0132"  Part="1" 
AR Path="/603FFB52/61F4A88C" Ref="#PWR096"  Part="1" 
AR Path="/603FFDD2/61F4A88C" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0132" H 3300 4600 50  0001 C CNN
F 1 "VCC" H 3300 4900 50  0000 C CNN
F 2 "" H 3300 4750 50  0001 C CNN
F 3 "" H 3300 4750 50  0001 C CNN
	1    3300 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F4E589
P 3300 5050
AR Path="/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/61F4E589" Ref="#PWR043"  Part="1" 
AR Path="/6006A6FC/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/61F4E589" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/61F4E589" Ref="#PWR061"  Part="1" 
AR Path="/603EF886/61F4E589" Ref="#PWR079"  Part="1" 
AR Path="/603EFAE2/61F4E589" Ref="#PWR0133"  Part="1" 
AR Path="/603FFB52/61F4E589" Ref="#PWR097"  Part="1" 
AR Path="/603FFDD2/61F4E589" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0133" H 3300 4800 50  0001 C CNN
F 1 "GND" H 3300 4900 50  0000 C CNN
F 2 "" H 3300 5050 50  0001 C CNN
F 3 "" H 3300 5050 50  0001 C CNN
	1    3300 5050
	1    0    0    -1  
$EndComp
$Comp
L 4xxx_IEEE:4514 U14
U 1 1 62811958
P 3300 3350
AR Path="/5FEFEA8C/62811958" Ref="U14"  Part="1" 
AR Path="/6039F880/62811958" Ref="U15"  Part="1" 
AR Path="/603EF886/62811958" Ref="U16"  Part="1" 
AR Path="/603FFB52/62811958" Ref="U17"  Part="1" 
AR Path="/603FFDD2/62811958" Ref="U18"  Part="1" 
AR Path="/603EFAE2/62811958" Ref="U19"  Part="1" 
F 0 "U15" H 3450 4300 50  0000 C CNN
F 1 "74HC4514" H 3550 4200 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 3300 3350 50  0001 C CNN
F 3 "" H 3300 3350 50  0001 C CNN
	1    3300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2300 4800 2300
Wire Wire Line
	4350 3100 4800 3100
Wire Wire Line
	4250 3900 4800 3900
Wire Wire Line
	4150 4700 4800 4700
Wire Wire Line
	4000 1500 4800 1500
Wire Wire Line
	4100 5150 5600 5150
Wire Wire Line
	4200 4300 4950 4300
Wire Wire Line
	4300 3500 4950 3500
Wire Wire Line
	4150 2700 4950 2700
Wire Wire Line
	4050 1900 4950 1900
Wire Wire Line
	3300 4150 3300 4250
Wire Wire Line
	3300 4250 2700 4250
Wire Wire Line
	2700 4250 2700 3900
Connection ~ 3300 4250
Wire Wire Line
	3300 2450 3300 2550
Wire Wire Line
	3300 2450 2700 2450
Wire Wire Line
	2700 2450 2700 2800
Connection ~ 3300 2450
$EndSCHEMATC
