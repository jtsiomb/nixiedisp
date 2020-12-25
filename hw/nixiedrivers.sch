EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title "Nixie driver/decoder"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
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
F 0 "Q3" H 5200 1350 50  0000 L CNN
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
F 0 "R15" V 4850 1500 50  0000 C CNN
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
F 0 "#PWR031" H 5450 1450 50  0001 C CNN
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
F 0 "Q9" H 6000 1800 50  0000 L CNN
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
F 0 "R22" V 5650 1950 50  0000 C CNN
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
F 0 "#PWR037" H 6250 1900 50  0001 C CNN
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
F 0 "Q4" H 5200 2150 50  0000 L CNN
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
F 0 "R16" V 4850 2300 50  0000 C CNN
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
F 0 "#PWR032" H 5450 2250 50  0001 C CNN
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
F 0 "Q10" H 6000 2600 50  0000 L CNN
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
F 0 "R23" V 5650 2750 50  0000 C CNN
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
F 0 "#PWR038" H 6250 2700 50  0001 C CNN
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
F 0 "Q5" H 5200 2950 50  0000 L CNN
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
F 0 "R17" V 4850 3100 50  0000 C CNN
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
F 0 "#PWR033" H 5450 3050 50  0001 C CNN
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
F 0 "Q11" H 6000 3400 50  0000 L CNN
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
F 0 "R24" V 5650 3550 50  0000 C CNN
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
F 0 "#PWR039" H 6250 3500 50  0001 C CNN
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
F 0 "Q6" H 5200 3750 50  0000 L CNN
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
F 0 "R18" V 4850 3900 50  0000 C CNN
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
F 0 "#PWR034" H 5450 3850 50  0001 C CNN
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
F 0 "Q12" H 6000 4200 50  0000 L CNN
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
F 0 "R25" V 5650 4350 50  0000 C CNN
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
F 0 "#PWR040" H 6250 4300 50  0001 C CNN
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
F 0 "Q7" H 5200 4550 50  0000 L CNN
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
F 0 "R19" V 4850 4700 50  0000 C CNN
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
F 0 "#PWR035" H 5450 4650 50  0001 C CNN
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
F 0 "Q13" H 6000 5000 50  0000 L CNN
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
F 0 "R26" V 5650 5150 50  0000 C CNN
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
F 0 "#PWR041" H 6250 5100 50  0001 C CNN
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
F 0 "Q8" H 5200 5700 50  0000 L CNN
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
F 0 "R20" V 4850 5850 50  0000 C CNN
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
F 0 "#PWR036" H 5450 5800 50  0001 C CNN
F 1 "GND" H 5450 5900 50  0000 C CNN
F 2 "" H 5450 6050 50  0001 C CNN
F 3 "" H 5450 6050 50  0001 C CNN
	1    5450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5650 6300 5650
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
F 0 "R21" V 5600 5650 50  0000 C CNN
F 1 "47k" V 5700 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5630 5650 50  0001 C CNN
F 3 "~" H 5700 5650 50  0001 C CNN
	1    5700 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FF515FF
P 6000 5650
AR Path="/5FF515FF" Ref="R?"  Part="1" 
AR Path="/5FEFEA8C/5FF515FF" Ref="R27"  Part="1" 
AR Path="/6006A6FC/5FF515FF" Ref="R?"  Part="1" 
AR Path="/60074ED0/5FF515FF" Ref="R?"  Part="1" 
AR Path="/6007521A/5FF515FF" Ref="R?"  Part="1" 
AR Path="/6008AEBF/5FF515FF" Ref="R?"  Part="1" 
AR Path="/6008B1C5/5FF515FF" Ref="R?"  Part="1" 
AR Path="/6039F880/5FF515FF" Ref="R40"  Part="1" 
AR Path="/603EF886/5FF515FF" Ref="R53"  Part="1" 
AR Path="/603EFAE2/5FF515FF" Ref="R92"  Part="1" 
AR Path="/603FFB52/5FF515FF" Ref="R66"  Part="1" 
AR Path="/603FFDD2/5FF515FF" Ref="R79"  Part="1" 
F 0 "R27" V 5900 5650 50  0000 C CNN
F 1 "47k" V 6000 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5930 5650 50  0001 C CNN
F 3 "~" H 6000 5650 50  0001 C CNN
	1    6000 5650
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
Text HLabel 6300 5650 2    50   Output ~ 0
NL
Wire Wire Line
	4650 2300 4800 2300
Wire Wire Line
	4650 3100 4800 3100
Wire Wire Line
	4650 3900 4800 3900
Wire Wire Line
	4650 4700 4800 4700
Wire Wire Line
	4650 1500 4800 1500
$Comp
L 74xx:74HC04 U15
U 1 1 60165027
P 4350 1500
AR Path="/5FEFEA8C/60165027" Ref="U15"  Part="1" 
AR Path="/6039F880/60165027" Ref="U18"  Part="1" 
AR Path="/603EF886/60165027" Ref="U21"  Part="1" 
AR Path="/603EFAE2/60165027" Ref="U30"  Part="1" 
AR Path="/603FFB52/60165027" Ref="U24"  Part="1" 
AR Path="/603FFDD2/60165027" Ref="U27"  Part="1" 
F 0 "U15" H 4450 1600 50  0000 C CNN
F 1 "74HC04" H 4550 1400 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 1500 50  0001 C CNN
	1    4350 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 2 1 601699D4
P 4350 1900
AR Path="/5FEFEA8C/601699D4" Ref="U15"  Part="2" 
AR Path="/6039F880/601699D4" Ref="U18"  Part="2" 
AR Path="/603EF886/601699D4" Ref="U21"  Part="2" 
AR Path="/603EFAE2/601699D4" Ref="U30"  Part="2" 
AR Path="/603FFB52/601699D4" Ref="U24"  Part="2" 
AR Path="/603FFDD2/601699D4" Ref="U27"  Part="2" 
F 0 "U15" H 4450 2000 50  0000 C CNN
F 1 "74HC04" H 4550 1800 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 1900 50  0001 C CNN
	2    4350 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 3 1 6016A828
P 4350 2300
AR Path="/5FEFEA8C/6016A828" Ref="U15"  Part="3" 
AR Path="/6039F880/6016A828" Ref="U18"  Part="3" 
AR Path="/603EF886/6016A828" Ref="U21"  Part="3" 
AR Path="/603EFAE2/6016A828" Ref="U30"  Part="3" 
AR Path="/603FFB52/6016A828" Ref="U24"  Part="3" 
AR Path="/603FFDD2/6016A828" Ref="U27"  Part="3" 
F 0 "U15" H 4450 2400 50  0000 C CNN
F 1 "74HC04" H 4550 2200 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 2300 50  0001 C CNN
	3    4350 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 4 1 6017136A
P 4350 2700
AR Path="/5FEFEA8C/6017136A" Ref="U15"  Part="4" 
AR Path="/6039F880/6017136A" Ref="U18"  Part="4" 
AR Path="/603EF886/6017136A" Ref="U21"  Part="4" 
AR Path="/603EFAE2/6017136A" Ref="U30"  Part="4" 
AR Path="/603FFB52/6017136A" Ref="U24"  Part="4" 
AR Path="/603FFDD2/6017136A" Ref="U27"  Part="4" 
F 0 "U15" H 4450 2800 50  0000 C CNN
F 1 "74HC04" H 4550 2600 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 2700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 2700 50  0001 C CNN
	4    4350 2700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 5 1 60172140
P 4350 3100
AR Path="/5FEFEA8C/60172140" Ref="U15"  Part="5" 
AR Path="/6039F880/60172140" Ref="U18"  Part="5" 
AR Path="/603EF886/60172140" Ref="U21"  Part="5" 
AR Path="/603EFAE2/60172140" Ref="U30"  Part="5" 
AR Path="/603FFB52/60172140" Ref="U24"  Part="5" 
AR Path="/603FFDD2/60172140" Ref="U27"  Part="5" 
F 0 "U15" H 4450 3200 50  0000 C CNN
F 1 "74HC04" H 4550 3000 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 3100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 3100 50  0001 C CNN
	5    4350 3100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 6 1 6017A3CB
P 4350 3500
AR Path="/5FEFEA8C/6017A3CB" Ref="U15"  Part="6" 
AR Path="/6039F880/6017A3CB" Ref="U18"  Part="6" 
AR Path="/603EF886/6017A3CB" Ref="U21"  Part="6" 
AR Path="/603EFAE2/6017A3CB" Ref="U30"  Part="6" 
AR Path="/603FFB52/6017A3CB" Ref="U24"  Part="6" 
AR Path="/603FFDD2/6017A3CB" Ref="U27"  Part="6" 
F 0 "U15" H 4450 3600 50  0000 C CNN
F 1 "74HC04" H 4550 3400 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 3500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 3500 50  0001 C CNN
	6    4350 3500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 1 1 6017B041
P 4350 3900
AR Path="/5FEFEA8C/6017B041" Ref="U16"  Part="1" 
AR Path="/6039F880/6017B041" Ref="U19"  Part="1" 
AR Path="/603EF886/6017B041" Ref="U22"  Part="1" 
AR Path="/603EFAE2/6017B041" Ref="U31"  Part="1" 
AR Path="/603FFB52/6017B041" Ref="U25"  Part="1" 
AR Path="/603FFDD2/6017B041" Ref="U28"  Part="1" 
F 0 "U16" H 4450 4000 50  0000 C CNN
F 1 "74HC04" H 4550 3800 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 3900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 3900 50  0001 C CNN
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 2 1 6019005B
P 4350 4300
AR Path="/5FEFEA8C/6019005B" Ref="U16"  Part="2" 
AR Path="/6039F880/6019005B" Ref="U19"  Part="2" 
AR Path="/603EF886/6019005B" Ref="U22"  Part="2" 
AR Path="/603EFAE2/6019005B" Ref="U31"  Part="2" 
AR Path="/603FFB52/6019005B" Ref="U25"  Part="2" 
AR Path="/603FFDD2/6019005B" Ref="U28"  Part="2" 
F 0 "U16" H 4450 4400 50  0000 C CNN
F 1 "74HC04" H 4550 4200 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 4300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 4300 50  0001 C CNN
	2    4350 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 3 1 60195646
P 4350 4700
AR Path="/5FEFEA8C/60195646" Ref="U16"  Part="3" 
AR Path="/6039F880/60195646" Ref="U19"  Part="3" 
AR Path="/603EF886/60195646" Ref="U22"  Part="3" 
AR Path="/603EFAE2/60195646" Ref="U31"  Part="3" 
AR Path="/603FFB52/60195646" Ref="U25"  Part="3" 
AR Path="/603FFDD2/60195646" Ref="U28"  Part="3" 
F 0 "U16" H 4450 4800 50  0000 C CNN
F 1 "74HC04" H 4550 4600 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 4700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 4700 50  0001 C CNN
	3    4350 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 4 1 6019AFB4
P 4350 5150
AR Path="/5FEFEA8C/6019AFB4" Ref="U16"  Part="4" 
AR Path="/6039F880/6019AFB4" Ref="U19"  Part="4" 
AR Path="/603EF886/6019AFB4" Ref="U22"  Part="4" 
AR Path="/603EFAE2/6019AFB4" Ref="U31"  Part="4" 
AR Path="/603FFB52/6019AFB4" Ref="U25"  Part="4" 
AR Path="/603FFDD2/6019AFB4" Ref="U28"  Part="4" 
F 0 "U16" H 4450 5250 50  0000 C CNN
F 1 "74HC04" H 4550 5050 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 4350 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4350 5150 50  0001 C CNN
	4    4350 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5150 5600 5150
Wire Wire Line
	4950 4350 4950 4300
Wire Wire Line
	4950 4300 4650 4300
Wire Wire Line
	4950 4350 5600 4350
Wire Wire Line
	4950 3550 4950 3500
Wire Wire Line
	4950 3500 4650 3500
Wire Wire Line
	4950 3550 5600 3550
Wire Wire Line
	4950 2750 4950 2700
Wire Wire Line
	4950 2700 4650 2700
Wire Wire Line
	4950 2750 5600 2750
Wire Wire Line
	4950 1950 4950 1900
Wire Wire Line
	4950 1900 4650 1900
Wire Wire Line
	4950 1950 5600 1950
Wire Wire Line
	3300 2600 3400 2600
Wire Wire Line
	3400 2600 3400 1500
Wire Wire Line
	3400 1500 4050 1500
Wire Wire Line
	3300 2700 3450 2700
Wire Wire Line
	3450 2700 3450 1900
Wire Wire Line
	3450 1900 4050 1900
Wire Wire Line
	3300 2800 3500 2800
Wire Wire Line
	3500 2800 3500 2300
Wire Wire Line
	3500 2300 4050 2300
Wire Wire Line
	3300 2900 3550 2900
Wire Wire Line
	3550 2900 3550 2700
Wire Wire Line
	3550 2700 4050 2700
Wire Wire Line
	3300 3000 3750 3000
Wire Wire Line
	3750 3000 3750 3100
Wire Wire Line
	3750 3100 4050 3100
Wire Wire Line
	3300 3100 3700 3100
Wire Wire Line
	3700 3100 3700 3500
Wire Wire Line
	3700 3500 4050 3500
Wire Wire Line
	3300 3200 3650 3200
Wire Wire Line
	3650 3200 3650 3900
Wire Wire Line
	3650 3900 4050 3900
Wire Wire Line
	3300 3300 3600 3300
Wire Wire Line
	3600 3300 3600 4300
Wire Wire Line
	3600 4300 4050 4300
Wire Wire Line
	3300 3400 3550 3400
Wire Wire Line
	3550 3400 3550 4700
Wire Wire Line
	3550 4700 4050 4700
Wire Wire Line
	3300 3500 3500 3500
Wire Wire Line
	3500 3500 3500 5150
Wire Wire Line
	3500 5150 4050 5150
$Comp
L 74xx:74LS154 U14
U 1 1 602524FA
P 2800 3300
AR Path="/5FEFEA8C/602524FA" Ref="U14"  Part="1" 
AR Path="/6039F880/602524FA" Ref="U17"  Part="1" 
AR Path="/603EF886/602524FA" Ref="U20"  Part="1" 
AR Path="/603EFAE2/602524FA" Ref="U29"  Part="1" 
AR Path="/603FFB52/602524FA" Ref="U23"  Part="1" 
AR Path="/603FFDD2/602524FA" Ref="U26"  Part="1" 
F 0 "U14" H 2950 4300 50  0000 C CNN
F 1 "74HC154" H 3000 4200 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 2800 3300 50  0001 C CNN
F 3 "" H 2800 3300 50  0001 C CNN
	1    2800 3300
	1    0    0    -1  
$EndComp
NoConn ~ 3300 3600
NoConn ~ 3300 3700
NoConn ~ 3300 3800
NoConn ~ 3300 3900
NoConn ~ 3300 4000
NoConn ~ 3300 4100
$Comp
L power:GND #PWR?
U 1 1 6026FEC7
P 2800 4400
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
F 0 "#PWR030" H 2800 4150 50  0001 C CNN
F 1 "GND" H 2805 4227 50  0000 C CNN
F 2 "" H 2800 4400 50  0001 C CNN
F 3 "" H 2800 4400 50  0001 C CNN
	1    2800 4400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U15
U 7 1 60272EB8
P 8600 5000
AR Path="/5FEFEA8C/60272EB8" Ref="U15"  Part="7" 
AR Path="/6039F880/60272EB8" Ref="U18"  Part="7" 
AR Path="/603EF886/60272EB8" Ref="U21"  Part="7" 
AR Path="/603EFAE2/60272EB8" Ref="U30"  Part="7" 
AR Path="/603FFB52/60272EB8" Ref="U24"  Part="7" 
AR Path="/603FFDD2/60272EB8" Ref="U27"  Part="7" 
F 0 "U15" H 8700 5100 50  0000 C CNN
F 1 "74HC04" H 8600 5000 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 8600 5000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 8600 5000 50  0001 C CNN
	7    8600 5000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 7 1 6027F13E
P 9100 5000
AR Path="/5FEFEA8C/6027F13E" Ref="U16"  Part="7" 
AR Path="/6039F880/6027F13E" Ref="U19"  Part="7" 
AR Path="/603EF886/6027F13E" Ref="U22"  Part="7" 
AR Path="/603EFAE2/6027F13E" Ref="U31"  Part="7" 
AR Path="/603FFB52/6027F13E" Ref="U25"  Part="7" 
AR Path="/603FFDD2/6027F13E" Ref="U28"  Part="7" 
F 0 "U16" H 9200 5100 50  0000 C CNN
F 1 "74HC04" H 9100 5000 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 9100 5000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 9100 5000 50  0001 C CNN
	7    9100 5000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR029
U 1 1 6028B489
P 2800 2300
AR Path="/5FEFEA8C/6028B489" Ref="#PWR029"  Part="1" 
AR Path="/6039F880/6028B489" Ref="#PWR047"  Part="1" 
AR Path="/603EF886/6028B489" Ref="#PWR065"  Part="1" 
AR Path="/603EFAE2/6028B489" Ref="#PWR0119"  Part="1" 
AR Path="/603FFB52/6028B489" Ref="#PWR083"  Part="1" 
AR Path="/603FFDD2/6028B489" Ref="#PWR0101"  Part="1" 
F 0 "#PWR029" H 2800 2150 50  0001 C CNN
F 1 "VCC" H 2815 2473 50  0000 C CNN
F 2 "" H 2800 2300 50  0001 C CNN
F 3 "" H 2800 2300 50  0001 C CNN
	1    2800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR044
U 1 1 6028C9E0
P 8850 4500
AR Path="/5FEFEA8C/6028C9E0" Ref="#PWR044"  Part="1" 
AR Path="/6039F880/6028C9E0" Ref="#PWR062"  Part="1" 
AR Path="/603EF886/6028C9E0" Ref="#PWR080"  Part="1" 
AR Path="/603EFAE2/6028C9E0" Ref="#PWR0134"  Part="1" 
AR Path="/603FFB52/6028C9E0" Ref="#PWR098"  Part="1" 
AR Path="/603FFDD2/6028C9E0" Ref="#PWR0116"  Part="1" 
F 0 "#PWR044" H 8850 4350 50  0001 C CNN
F 1 "VCC" H 8850 4650 50  0000 C CNN
F 2 "" H 8850 4500 50  0001 C CNN
F 3 "" H 8850 4500 50  0001 C CNN
	1    8850 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4500 8850 4500
Connection ~ 8850 4500
Wire Wire Line
	8850 4500 9100 4500
$Comp
L power:GND #PWR?
U 1 1 6029345D
P 8850 5500
AR Path="/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/6029345D" Ref="#PWR045"  Part="1" 
AR Path="/6006A6FC/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/6029345D" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/6029345D" Ref="#PWR063"  Part="1" 
AR Path="/603EF886/6029345D" Ref="#PWR081"  Part="1" 
AR Path="/603EFAE2/6029345D" Ref="#PWR0135"  Part="1" 
AR Path="/603FFB52/6029345D" Ref="#PWR099"  Part="1" 
AR Path="/603FFDD2/6029345D" Ref="#PWR0117"  Part="1" 
F 0 "#PWR045" H 8850 5250 50  0001 C CNN
F 1 "GND" H 8850 5350 50  0000 C CNN
F 2 "" H 8850 5500 50  0001 C CNN
F 3 "" H 8850 5500 50  0001 C CNN
	1    8850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5500 8850 5500
Connection ~ 8850 5500
Wire Wire Line
	8850 5500 9100 5500
Wire Wire Line
	2300 2600 2000 2600
Wire Wire Line
	2300 2700 2000 2700
Wire Wire Line
	2300 2800 2000 2800
Wire Wire Line
	2300 2900 2000 2900
Wire Wire Line
	2300 3200 2300 4400
Wire Wire Line
	2300 4400 2800 4400
Connection ~ 2800 4400
Wire Wire Line
	2300 3100 2300 3200
Connection ~ 2300 3200
Text HLabel 2000 2600 0    50   Input ~ 0
D0
Text HLabel 2000 2700 0    50   Input ~ 0
D1
Text HLabel 2000 2800 0    50   Input ~ 0
D2
Text HLabel 2000 2900 0    50   Input ~ 0
D3
Text HLabel 4250 5850 0    50   Input ~ 0
LDOT
$Comp
L 74xx:74HC04 U16
U 6 1 601A75CB
P 9900 5150
AR Path="/5FEFEA8C/601A75CB" Ref="U16"  Part="6" 
AR Path="/6039F880/601A75CB" Ref="U19"  Part="6" 
AR Path="/603EF886/601A75CB" Ref="U22"  Part="6" 
AR Path="/603EFAE2/601A75CB" Ref="U31"  Part="6" 
AR Path="/603FFB52/601A75CB" Ref="U25"  Part="6" 
AR Path="/603FFDD2/601A75CB" Ref="U28"  Part="6" 
F 0 "U16" H 10000 5250 50  0000 C CNN
F 1 "74HC04" H 10100 5050 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 9900 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 9900 5150 50  0001 C CNN
	6    9900 5150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U16
U 5 1 6019DF3A
P 9900 4750
AR Path="/5FEFEA8C/6019DF3A" Ref="U16"  Part="5" 
AR Path="/6039F880/6019DF3A" Ref="U19"  Part="5" 
AR Path="/603EF886/6019DF3A" Ref="U22"  Part="5" 
AR Path="/603EFAE2/6019DF3A" Ref="U31"  Part="5" 
AR Path="/603FFB52/6019DF3A" Ref="U25"  Part="5" 
AR Path="/603FFDD2/6019DF3A" Ref="U28"  Part="5" 
F 0 "U16" H 10000 4850 50  0000 C CNN
F 1 "74HC04" H 10100 4650 50  0000 C CNN
F 2 "Package_SO:SO-14_5.3x10.2mm_P1.27mm" H 9900 4750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 9900 4750 50  0001 C CNN
	5    9900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5850 4800 5850
NoConn ~ 10200 4750
NoConn ~ 10200 5150
Wire Wire Line
	9600 4750 9600 5150
Connection ~ 9600 5150
Wire Wire Line
	9600 5150 9600 5350
$Comp
L power:GND #PWR?
U 1 1 60365893
P 9600 5350
AR Path="/60365893" Ref="#PWR?"  Part="1" 
AR Path="/5FEFEA8C/60365893" Ref="#PWR046"  Part="1" 
AR Path="/6006A6FC/60365893" Ref="#PWR?"  Part="1" 
AR Path="/60074ED0/60365893" Ref="#PWR?"  Part="1" 
AR Path="/6007521A/60365893" Ref="#PWR?"  Part="1" 
AR Path="/6008AEBF/60365893" Ref="#PWR?"  Part="1" 
AR Path="/6008B1C5/60365893" Ref="#PWR?"  Part="1" 
AR Path="/6039F880/60365893" Ref="#PWR064"  Part="1" 
AR Path="/603EF886/60365893" Ref="#PWR082"  Part="1" 
AR Path="/603EFAE2/60365893" Ref="#PWR0136"  Part="1" 
AR Path="/603FFB52/60365893" Ref="#PWR0100"  Part="1" 
AR Path="/603FFDD2/60365893" Ref="#PWR0118"  Part="1" 
F 0 "#PWR046" H 9600 5100 50  0001 C CNN
F 1 "GND" H 9600 5200 50  0000 C CNN
F 2 "" H 9600 5350 50  0001 C CNN
F 3 "" H 9600 5350 50  0001 C CNN
	1    9600 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 61F358B7
P 7350 5000
AR Path="/5FEFEA8C/61F358B7" Ref="C17"  Part="1" 
AR Path="/6039F880/61F358B7" Ref="C20"  Part="1" 
AR Path="/603EF886/61F358B7" Ref="C23"  Part="1" 
AR Path="/603FFB52/61F358B7" Ref="C26"  Part="1" 
AR Path="/603FFDD2/61F358B7" Ref="C29"  Part="1" 
AR Path="/603EFAE2/61F358B7" Ref="C32"  Part="1" 
F 0 "C17" H 7400 5100 50  0000 L CNN
F 1 "0.1uF" H 7400 4900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7388 4850 50  0001 C CNN
F 3 "~" H 7350 5000 50  0001 C CNN
	1    7350 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 61F3B605
P 7700 5000
AR Path="/5FEFEA8C/61F3B605" Ref="C18"  Part="1" 
AR Path="/6039F880/61F3B605" Ref="C21"  Part="1" 
AR Path="/603EF886/61F3B605" Ref="C24"  Part="1" 
AR Path="/603FFB52/61F3B605" Ref="C27"  Part="1" 
AR Path="/603FFDD2/61F3B605" Ref="C30"  Part="1" 
AR Path="/603EFAE2/61F3B605" Ref="C33"  Part="1" 
F 0 "C18" H 7750 5100 50  0000 L CNN
F 1 "0.1uF" H 7750 4900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7738 4850 50  0001 C CNN
F 3 "~" H 7700 5000 50  0001 C CNN
	1    7700 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 61F3C171
P 8050 5000
AR Path="/5FEFEA8C/61F3C171" Ref="C19"  Part="1" 
AR Path="/6039F880/61F3C171" Ref="C22"  Part="1" 
AR Path="/603EF886/61F3C171" Ref="C25"  Part="1" 
AR Path="/603FFB52/61F3C171" Ref="C28"  Part="1" 
AR Path="/603FFDD2/61F3C171" Ref="C31"  Part="1" 
AR Path="/603EFAE2/61F3C171" Ref="C34"  Part="1" 
F 0 "C19" H 8100 5100 50  0000 L CNN
F 1 "0.1uF" H 8100 4900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8088 4850 50  0001 C CNN
F 3 "~" H 8050 5000 50  0001 C CNN
	1    8050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4850 7700 4850
Connection ~ 7700 4850
Wire Wire Line
	7700 4850 8050 4850
Wire Wire Line
	7350 5150 7700 5150
Connection ~ 7700 5150
Wire Wire Line
	7700 5150 8050 5150
$Comp
L power:VCC #PWR042
U 1 1 61F4A88C
P 7700 4850
AR Path="/5FEFEA8C/61F4A88C" Ref="#PWR042"  Part="1" 
AR Path="/6039F880/61F4A88C" Ref="#PWR060"  Part="1" 
AR Path="/603EF886/61F4A88C" Ref="#PWR078"  Part="1" 
AR Path="/603EFAE2/61F4A88C" Ref="#PWR0132"  Part="1" 
AR Path="/603FFB52/61F4A88C" Ref="#PWR096"  Part="1" 
AR Path="/603FFDD2/61F4A88C" Ref="#PWR0114"  Part="1" 
F 0 "#PWR042" H 7700 4700 50  0001 C CNN
F 1 "VCC" H 7700 5000 50  0000 C CNN
F 2 "" H 7700 4850 50  0001 C CNN
F 3 "" H 7700 4850 50  0001 C CNN
	1    7700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F4E589
P 7700 5150
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
F 0 "#PWR043" H 7700 4900 50  0001 C CNN
F 1 "GND" H 7700 5000 50  0000 C CNN
F 2 "" H 7700 5150 50  0001 C CNN
F 3 "" H 7700 5150 50  0001 C CNN
	1    7700 5150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
