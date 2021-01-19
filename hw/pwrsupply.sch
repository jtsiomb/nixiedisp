EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
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
L Diode:1N4148 D?
U 1 1 60380ABF
P 5550 3400
AR Path="/60380ABF" Ref="D?"  Part="1" 
AR Path="/60332D47/60380ABF" Ref="D1"  Part="1" 
F 0 "D1" H 5550 3183 50  0000 C CNN
F 1 "1N4148" H 5550 3274 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 3225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5550 3400 50  0001 C CNN
	1    5550 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 3400 5750 3400
$Comp
L Device:R R?
U 1 1 60380AC6
P 5350 3850
AR Path="/60380AC6" Ref="R?"  Part="1" 
AR Path="/60332D47/60380AC6" Ref="R8"  Part="1" 
F 0 "R8" H 5420 3896 50  0000 L CNN
F 1 "1K" H 5420 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 3850 50  0001 C CNN
F 3 "~" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3400 5350 3400
Wire Wire Line
	5350 3700 5350 3650
Connection ~ 5350 3400
Wire Wire Line
	5350 3400 5200 3400
$Comp
L nixiedisp:MMBTA55 Q?
U 1 1 60380AD6
P 5650 3650
AR Path="/60380AD6" Ref="Q?"  Part="1" 
AR Path="/60332D47/60380AD6" Ref="Q2"  Part="1" 
F 0 "Q2" H 5840 3696 50  0000 L CNN
F 1 "MMBTA55" H 5750 3900 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5850 3575 50  0001 L CIN
F 3 "" H 5650 3650 50  0001 L CNN
	1    5650 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	5750 3450 5750 3400
Connection ~ 5750 3400
Wire Wire Line
	5750 3400 5850 3400
Wire Wire Line
	5450 3650 5350 3650
Connection ~ 5350 3650
Wire Wire Line
	5350 3650 5350 3400
$Comp
L power:GND #PWR?
U 1 1 60380AE2
P 5750 4000
AR Path="/60380AE2" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380AE2" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 5750 3750 50  0001 C CNN
F 1 "GND" H 5750 3850 50  0000 C CNN
F 2 "" H 5750 4000 50  0001 C CNN
F 3 "" H 5750 4000 50  0001 C CNN
	1    5750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4000 5750 4000
Wire Wire Line
	5750 4000 5750 3850
$Comp
L Device:L L?
U 1 1 60380AF0
P 6150 2850
AR Path="/60380AF0" Ref="L?"  Part="1" 
AR Path="/60332D47/60380AF0" Ref="L1"  Part="1" 
F 0 "L1" H 6000 2950 50  0000 L CNN
F 1 "220uH" H 5850 2850 50  0000 L CNN
F 2 "Inductor_SMD:L_Bourns_SDR1806" H 6150 2850 50  0001 C CNN
F 3 "~" H 6150 2850 50  0001 C CNN
	1    6150 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60380AF6
P 4400 3750
AR Path="/60380AF6" Ref="C?"  Part="1" 
AR Path="/60332D47/60380AF6" Ref="C16"  Part="1" 
F 0 "C16" H 4515 3796 50  0000 L CNN
F 1 "2.2nF" H 4515 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4438 3600 50  0001 C CNN
F 3 "~" H 4400 3750 50  0001 C CNN
	1    4400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3600 4400 3400
Wire Wire Line
	4800 3700 4800 3950
Wire Wire Line
	4400 3900 4400 3950
Wire Wire Line
	4400 3950 4800 3950
$Comp
L power:GND #PWR?
U 1 1 60380B00
P 4800 4000
AR Path="/60380B00" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B00" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 4800 3750 50  0001 C CNN
F 1 "GND" H 4800 3850 50  0000 C CNN
F 2 "" H 4800 4000 50  0001 C CNN
F 3 "" H 4800 4000 50  0001 C CNN
	1    4800 4000
	1    0    0    -1  
$EndComp
Connection ~ 4800 3950
Wire Wire Line
	4800 3950 4800 4000
$Comp
L power:+12V #PWR?
U 1 1 60380B08
P 4150 2400
AR Path="/60380B08" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B08" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 4150 2250 50  0001 C CNN
F 1 "+12V" H 4150 2550 50  0000 C CNN
F 2 "" H 4150 2400 50  0001 C CNN
F 3 "" H 4150 2400 50  0001 C CNN
	1    4150 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60380B0E
P 4350 2500
AR Path="/60380B0E" Ref="R?"  Part="1" 
AR Path="/60332D47/60380B0E" Ref="R3"  Part="1" 
F 0 "R3" V 4300 2650 50  0000 C CNN
F 1 "1R" V 4350 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4280 2500 50  0001 C CNN
F 3 "~" H 4350 2500 50  0001 C CNN
	1    4350 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60380B14
P 4350 2600
AR Path="/60380B14" Ref="R?"  Part="1" 
AR Path="/60332D47/60380B14" Ref="R4"  Part="1" 
F 0 "R4" V 4300 2750 50  0000 C CNN
F 1 "1R" V 4350 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4280 2600 50  0001 C CNN
F 3 "~" H 4350 2600 50  0001 C CNN
	1    4350 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60380B1A
P 4350 2700
AR Path="/60380B1A" Ref="R?"  Part="1" 
AR Path="/60332D47/60380B1A" Ref="R7"  Part="1" 
F 0 "R7" V 4300 2850 50  0000 C CNN
F 1 "1R" V 4350 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4280 2700 50  0001 C CNN
F 3 "~" H 4350 2700 50  0001 C CNN
	1    4350 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 2500 4600 2500
Wire Wire Line
	4600 2500 4600 2600
Wire Wire Line
	4600 2700 4500 2700
Wire Wire Line
	4200 2500 4150 2500
Wire Wire Line
	4150 2500 4150 2600
Wire Wire Line
	4150 2700 4200 2700
Wire Wire Line
	4200 2600 4150 2600
Connection ~ 4150 2600
Wire Wire Line
	4150 2600 4150 2700
Wire Wire Line
	4500 2600 4600 2600
Connection ~ 4600 2600
Wire Wire Line
	4600 2600 4600 2700
Wire Wire Line
	4150 2400 4150 2500
Connection ~ 4150 2500
Wire Wire Line
	4150 3000 4400 3000
Connection ~ 4150 2700
Wire Wire Line
	4600 2600 5200 2600
$Comp
L Device:CP1 C?
U 1 1 60380B36
P 5400 2750
AR Path="/60380B36" Ref="C?"  Part="1" 
AR Path="/60332D47/60380B36" Ref="C37"  Part="1" 
F 0 "C37" H 5515 2796 50  0000 L CNN
F 1 "220uF" H 5515 2705 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10" H 5400 2750 50  0001 C CNN
F 3 "~" H 5400 2750 50  0001 C CNN
	1    5400 2750
	1    0    0    -1  
$EndComp
Connection ~ 5200 2600
$Comp
L power:GND #PWR?
U 1 1 60380B3D
P 5400 2900
AR Path="/60380B3D" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B3D" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 5400 2650 50  0001 C CNN
F 1 "GND" H 5400 2750 50  0000 C CNN
F 2 "" H 5400 2900 50  0001 C CNN
F 3 "" H 5400 2900 50  0001 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3200 6150 3200
Wire Wire Line
	6150 3200 6150 3000
Wire Wire Line
	6150 2700 6150 2600
Wire Wire Line
	6150 2600 5400 2600
Connection ~ 5400 2600
Wire Wire Line
	6150 3600 6150 4000
Wire Wire Line
	6150 4000 5750 4000
Connection ~ 5750 4000
$Comp
L Device:CP1 C?
U 1 1 60380B4B
P 7050 3450
AR Path="/60380B4B" Ref="C?"  Part="1" 
AR Path="/60332D47/60380B4B" Ref="C39"  Part="1" 
F 0 "C39" H 7165 3496 50  0000 L CNN
F 1 "2.2uF 250V" H 7165 3405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7050 3450 50  0001 C CNN
F 3 "~" H 7050 3450 50  0001 C CNN
	1    7050 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60380B51
P 6700 3400
AR Path="/60380B51" Ref="R?"  Part="1" 
AR Path="/60332D47/60380B51" Ref="R93"  Part="1" 
F 0 "R93" H 6770 3446 50  0000 L CNN
F 1 "475K" V 6700 3300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6630 3400 50  0001 C CNN
F 3 "~" H 6700 3400 50  0001 C CNN
	1    6700 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60380B57
P 6700 3750
AR Path="/60380B57" Ref="R?"  Part="1" 
AR Path="/60332D47/60380B57" Ref="R94"  Part="1" 
F 0 "R94" H 6770 3796 50  0000 L CNN
F 1 "3K32" V 6700 3650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6630 3750 50  0001 C CNN
F 3 "~" H 6700 3750 50  0001 C CNN
	1    6700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3550 6700 3600
Wire Wire Line
	6700 3250 6700 3200
Wire Wire Line
	6700 3200 6550 3200
Wire Wire Line
	6700 3200 7050 3200
Connection ~ 6700 3200
Wire Wire Line
	6250 3600 6250 3900
Wire Wire Line
	6250 4250 5200 4250
Wire Wire Line
	5200 4250 5200 3500
Connection ~ 6700 3600
$Comp
L power:GND #PWR?
U 1 1 60380B66
P 6700 3900
AR Path="/60380B66" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B66" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 6700 3650 50  0001 C CNN
F 1 "GND" H 6700 3750 50  0000 C CNN
F 2 "" H 6700 3900 50  0001 C CNN
F 3 "" H 6700 3900 50  0001 C CNN
	1    6700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3900 7050 3900
Wire Wire Line
	7050 3900 7050 3600
Connection ~ 6700 3900
$Comp
L power:HT #PWR?
U 1 1 60380B6F
P 7050 3100
AR Path="/60380B6F" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B6F" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 7050 3220 50  0001 C CNN
F 1 "HT" H 7050 3250 50  0000 C CNN
F 2 "" H 7050 3100 50  0001 C CNN
F 3 "" H 7050 3100 50  0001 C CNN
	1    7050 3100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U?
U 1 1 60380B75
P 4800 4550
AR Path="/60380B75" Ref="U?"  Part="1" 
AR Path="/60332D47/60380B75" Ref="U34"  Part="1" 
F 0 "U34" H 4800 4792 50  0000 C CNN
F 1 "L7805" H 4800 4701 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4825 4400 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4800 4500 50  0001 C CNN
	1    4800 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4550 4450 4550
Wire Wire Line
	4150 4550 4150 3000
$Comp
L Device:CP1 C?
U 1 1 60380B7D
P 4450 4700
AR Path="/60380B7D" Ref="C?"  Part="1" 
AR Path="/60332D47/60380B7D" Ref="C35"  Part="1" 
F 0 "C35" H 4200 4700 50  0000 L CNN
F 1 "0.33uF" H 4200 4600 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 4450 4700 50  0001 C CNN
F 3 "~" H 4450 4700 50  0001 C CNN
	1    4450 4700
	1    0    0    -1  
$EndComp
Connection ~ 4450 4550
Wire Wire Line
	4450 4550 4150 4550
Wire Wire Line
	4450 4850 4800 4850
Connection ~ 4800 4850
Wire Wire Line
	4800 4850 5200 4850
Wire Wire Line
	5100 4550 5200 4550
$Comp
L power:GND #PWR?
U 1 1 60380B89
P 4800 4850
AR Path="/60380B89" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B89" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 4800 4600 50  0001 C CNN
F 1 "GND" H 4800 4700 50  0000 C CNN
F 2 "" H 4800 4850 50  0001 C CNN
F 3 "" H 4800 4850 50  0001 C CNN
	1    4800 4850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60380B8F
P 5200 4550
AR Path="/60380B8F" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380B8F" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 5200 4400 50  0001 C CNN
F 1 "VCC" H 5200 4700 50  0000 C CNN
F 2 "" H 5200 4550 50  0001 C CNN
F 3 "" H 5200 4550 50  0001 C CNN
	1    5200 4550
	1    0    0    -1  
$EndComp
Connection ~ 4150 3000
Wire Wire Line
	6700 3600 6250 3600
$Comp
L Device:C C?
U 1 1 60380B97
P 6450 3900
AR Path="/60380B97" Ref="C?"  Part="1" 
AR Path="/60332D47/60380B97" Ref="C38"  Part="1" 
F 0 "C38" V 6300 3850 50  0000 L CNN
F 1 "10nF" V 6600 3800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 3750 50  0001 C CNN
F 3 "~" H 6450 3900 50  0001 C CNN
	1    6450 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 3900 6250 3900
Connection ~ 6250 3900
Wire Wire Line
	6250 3900 6250 4250
Wire Wire Line
	6600 3900 6700 3900
Wire Wire Line
	5200 2600 5400 2600
Text Notes 6750 3150 0    50   ~ 0
+180V
Text Notes 5000 2450 0    50   ~ 0
Power supply
Wire Wire Line
	7050 3100 7050 3200
Connection ~ 7050 3200
Wire Wire Line
	7050 3200 7050 3300
Wire Wire Line
	4150 2700 4150 3000
Wire Wire Line
	4550 5000 4150 5000
Wire Wire Line
	4150 5000 4150 4550
Connection ~ 4150 4550
$Comp
L power:GND #PWR?
U 1 1 60380BAB
P 4550 5550
AR Path="/60380BAB" Ref="#PWR?"  Part="1" 
AR Path="/60332D47/60380BAB" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 4550 5300 50  0001 C CNN
F 1 "GND" H 4550 5400 50  0000 C CNN
F 2 "" H 4550 5550 50  0001 C CNN
F 3 "" H 4550 5550 50  0001 C CNN
	1    4550 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60380BB1
P 4750 5250
AR Path="/60380BB1" Ref="J?"  Part="1" 
AR Path="/60332D47/60380BB1" Ref="J6"  Part="1" 
F 0 "J6" H 4830 5242 50  0000 L CNN
F 1 "pwr sw" H 4650 5050 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4750 5250 50  0001 C CNN
F 3 "~" H 4750 5250 50  0001 C CNN
	1    4750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5250 4550 5000
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60380BB8
P 4450 4450
AR Path="/60380BB8" Ref="#FLG?"  Part="1" 
AR Path="/60332D47/60380BB8" Ref="#FLG01"  Part="1" 
F 0 "#FLG01" H 4450 4525 50  0001 C CNN
F 1 "PWR_FLAG" H 4450 4600 50  0000 C CNN
F 2 "" H 4450 4450 50  0001 C CNN
F 3 "~" H 4450 4450 50  0001 C CNN
	1    4450 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4450 4450 4550
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60380BBF
P 7200 3200
AR Path="/60380BBF" Ref="#FLG?"  Part="1" 
AR Path="/60332D47/60380BBF" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 7200 3275 50  0001 C CNN
F 1 "PWR_FLAG" H 7300 3350 50  0000 C CNN
F 2 "" H 7200 3200 50  0001 C CNN
F 3 "~" H 7200 3200 50  0001 C CNN
	1    7200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3200 7050 3200
Wire Wire Line
	4550 5450 4550 5550
Connection ~ 4550 5550
$Comp
L Device:CP1 C?
U 1 1 60380BCE
P 5200 4700
AR Path="/60380BCE" Ref="C?"  Part="1" 
AR Path="/60332D47/60380BCE" Ref="C36"  Part="1" 
F 0 "C36" H 5350 4700 50  0000 L CNN
F 1 "0.33uF" H 5250 4600 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 5200 4700 50  0001 C CNN
F 3 "~" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
Connection ~ 5200 4550
$Comp
L Transistor_FET:IRF740 Q?
U 1 1 60380BD5
P 6050 3400
AR Path="/60380BD5" Ref="Q?"  Part="1" 
AR Path="/60332D47/60380BD5" Ref="Q69"  Part="1" 
F 0 "Q69" H 6254 3446 50  0000 L CNN
F 1 "IRF740" H 6254 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 6300 3325 50  0001 L CIN
F 3 "http://www.vishay.com/docs/91054/91054.pdf" H 6050 3400 50  0001 L CNN
	1    6050 3400
	1    0    0    -1  
$EndComp
Connection ~ 6150 3200
Text HLabel 7300 3200 2    50   Input ~ 0
HT
Text HLabel 5300 4550 2    50   Input ~ 0
VCC
Text HLabel 4700 5550 2    50   Input ~ 0
GND
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 60380BC6
P 4250 5450
AR Path="/60380BC6" Ref="J?"  Part="1" 
AR Path="/60332D47/60380BC6" Ref="J4"  Part="1" 
F 0 "J4" H 4250 5750 50  0000 C CNN
F 1 "12VDC IN" H 4250 5650 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 4300 5410 50  0001 C CNN
F 3 "~" H 4300 5410 50  0001 C CNN
	1    4250 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5550 4700 5550
Wire Wire Line
	5300 4550 5200 4550
Wire Wire Line
	7300 3200 7200 3200
Connection ~ 7200 3200
$Comp
L Diode:MRA4005T3G D2
U 1 1 627C194A
P 6400 3200
F 0 "D2" H 6400 2983 50  0000 C CNN
F 1 "MUR160" H 6400 3074 50  0000 C CNN
F 2 "Diode_SMD:D_SMA-SMB_Universal_Handsoldering" H 6400 3025 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MRA4003T3-D.PDF" H 6400 3200 50  0001 C CNN
	1    6400 3200
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Switching:MC34063AD U33
U 1 1 627D0348
P 4800 3200
F 0 "U33" H 4800 3667 50  0000 C CNN
F 1 "MC34063AD" H 4800 3576 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4850 2750 50  0001 L CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MC34063A-D.PDF" H 5300 3100 50  0001 C CNN
	1    4800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2600 5200 3000
Wire Wire Line
	5200 3000 5200 3100
Connection ~ 5200 3000
Connection ~ 5200 3100
Wire Wire Line
	5200 3100 5200 3200
$EndSCHEMATC
