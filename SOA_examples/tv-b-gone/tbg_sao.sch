EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:tbg_sao-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny85V-10PU U1
U 1 1 5E25AFA4
P 3150 2350
F 0 "U1" H 2620 2396 50  0000 R CNN
F 1 "ATtiny85V-10PU" H 2620 2305 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W8.89mm_SMDSocket_LongPads" H 3150 2350 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 3150 2350 50  0001 C CNN
	1    3150 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E25BBA5
P 3150 4000
F 0 "C1" H 3265 4046 50  0000 L CNN
F 1 "C" H 3265 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3188 3850 50  0001 C CNN
F 3 "~" H 3150 4000 50  0001 C CNN
	1    3150 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E25E212
P 5900 2350
F 0 "#PWR0101" H 5900 2100 50  0001 C CNN
F 1 "GND" H 5905 2177 50  0000 C CNN
F 2 "" H 5900 2350 50  0001 C CNN
F 3 "" H 5900 2350 50  0001 C CNN
	1    5900 2350
	1    0    0    -1  
$EndComp
$Comp
L LED:IR204A D1
U 1 1 5E25EC2E
P 5900 1450
F 0 "D1" V 5896 1373 50  0000 R CNN
F 1 "IR204A" V 5805 1373 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 5900 1625 50  0001 C CNN
F 3 "http://www.everlight.com/file/ProductFile/IR204-A.pdf" H 5850 1450 50  0001 C CNN
	1    5900 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 1650 5900 1750
$Comp
L power:VCC #PWR0102
U 1 1 5E260B2B
P 5900 1250
F 0 "#PWR0102" H 5900 1100 50  0001 C CNN
F 1 "VCC" H 5917 1423 50  0000 C CNN
F 2 "" H 5900 1250 50  0001 C CNN
F 3 "" H 5900 1250 50  0001 C CNN
	1    5900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1250 5900 1350
$Comp
L Device:R R1
U 1 1 5E267505
P 5350 2050
F 0 "R1" V 5450 2050 50  0000 L CNN
F 1 "150R" V 5350 1950 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5280 2050 50  0001 C CNN
F 3 "~" H 5350 2050 50  0001 C CNN
	1    5350 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 2250 5900 2350
$Comp
L LED:IR204A D2
U 1 1 5E269005
P 6400 1450
F 0 "D2" V 6396 1373 50  0000 R CNN
F 1 "IR204A" V 6305 1373 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 6400 1625 50  0001 C CNN
F 3 "http://www.everlight.com/file/ProductFile/IR204-A.pdf" H 6350 1450 50  0001 C CNN
	1    6400 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 1750 6400 1750
Connection ~ 5900 1750
Wire Wire Line
	5900 1750 5900 1850
Wire Wire Line
	6400 1650 6400 1750
$Comp
L power:VCC #PWR0103
U 1 1 5E26A657
P 6400 1250
F 0 "#PWR0103" H 6400 1100 50  0001 C CNN
F 1 "VCC" H 6417 1423 50  0000 C CNN
F 2 "" H 6400 1250 50  0001 C CNN
F 3 "" H 6400 1250 50  0001 C CNN
	1    6400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1250 6400 1350
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5E26C92B
P 5800 2050
F 0 "Q1" H 5990 2096 50  0000 L CNN
F 1 "2N3904" H 5990 2005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6000 1975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5800 2050 50  0001 L CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2050 5500 2050
Wire Wire Line
	3750 2050 3850 2050
Wire Wire Line
	3750 2150 3850 2150
Wire Wire Line
	3850 2150 3850 2050
Connection ~ 3850 2050
Wire Wire Line
	3850 2050 5200 2050
$Comp
L power:VCC #PWR0104
U 1 1 5E270A17
P 3150 3750
F 0 "#PWR0104" H 3150 3600 50  0001 C CNN
F 1 "VCC" H 3167 3923 50  0000 C CNN
F 2 "" H 3150 3750 50  0001 C CNN
F 3 "" H 3150 3750 50  0001 C CNN
	1    3150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3750 3150 3850
$Comp
L power:GND #PWR0105
U 1 1 5E2714E1
P 3150 4250
F 0 "#PWR0105" H 3150 4000 50  0001 C CNN
F 1 "GND" H 3155 4077 50  0000 C CNN
F 2 "" H 3150 4250 50  0001 C CNN
F 3 "" H 3150 4250 50  0001 C CNN
	1    3150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4250 3150 4150
$Comp
L power:VCC #PWR0106
U 1 1 5E273998
P 3150 1600
F 0 "#PWR0106" H 3150 1450 50  0001 C CNN
F 1 "VCC" H 3167 1773 50  0000 C CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "" H 3150 1600 50  0001 C CNN
	1    3150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1600 3150 1750
$Comp
L power:GND #PWR0107
U 1 1 5E2743F1
P 3150 3150
F 0 "#PWR0107" H 3150 2900 50  0001 C CNN
F 1 "GND" H 3155 2977 50  0000 C CNN
F 2 "" H 3150 3150 50  0001 C CNN
F 3 "" H 3150 3150 50  0001 C CNN
	1    3150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2950 3150 3150
$Comp
L Switch:SW_Push SW?
U 1 1 5E26662A
P 4050 2850
F 0 "SW?" V 4004 2998 50  0000 L CNN
F 1 "SW_Push" V 4095 2998 50  0000 L CNN
F 2 "" H 4050 3050 50  0001 C CNN
F 3 "~" H 4050 3050 50  0001 C CNN
	1    4050 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 2550 4050 2550
Wire Wire Line
	4050 2550 4050 2650
$Comp
L power:GND #PWR?
U 1 1 5E268FDC
P 4050 3150
F 0 "#PWR?" H 4050 2900 50  0001 C CNN
F 1 "GND" H 4055 2977 50  0000 C CNN
F 2 "" H 4050 3150 50  0001 C CNN
F 3 "" H 4050 3150 50  0001 C CNN
	1    4050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3050 4050 3150
Wire Wire Line
	5450 3000 5450 3150
$Comp
L power:GND #PWR?
U 1 1 5E262803
P 5450 3150
F 0 "#PWR?" H 5450 2900 50  0001 C CNN
F 1 "GND" H 5455 2977 50  0000 C CNN
F 2 "" H 5450 3150 50  0001 C CNN
F 3 "" H 5450 3150 50  0001 C CNN
	1    5450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3000 4850 3150
$Comp
L power:GND #PWR?
U 1 1 5E26229D
P 4850 3150
F 0 "#PWR?" H 4850 2900 50  0001 C CNN
F 1 "GND" H 4855 2977 50  0000 C CNN
F 2 "" H 4850 3150 50  0001 C CNN
F 3 "" H 4850 3150 50  0001 C CNN
	1    4850 3150
	1    0    0    -1  
$EndComp
Connection ~ 5450 2600
Wire Wire Line
	5450 2350 5450 2600
Wire Wire Line
	3750 2350 5450 2350
Connection ~ 4850 2600
Wire Wire Line
	4850 2450 3750 2450
Wire Wire Line
	4850 2600 4850 2450
Wire Wire Line
	5450 2600 5450 2700
Wire Wire Line
	5300 2600 5450 2600
Wire Wire Line
	4850 2600 5000 2600
Wire Wire Line
	4850 2700 4850 2600
$Comp
L Device:C C?
U 1 1 5E26059E
P 5450 2850
F 0 "C?" H 5565 2896 50  0000 L CNN
F 1 "C" H 5565 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5488 2700 50  0001 C CNN
F 3 "~" H 5450 2850 50  0001 C CNN
	1    5450 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E25E200
P 4850 2850
F 0 "C?" H 4965 2896 50  0000 L CNN
F 1 "C" H 4965 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4888 2700 50  0001 C CNN
F 3 "~" H 4850 2850 50  0001 C CNN
	1    4850 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5E25CBD8
P 5150 2600
F 0 "Y?" H 5300 2450 50  0000 C CNN
F 1 "8.0Mhz" H 5000 2450 50  0000 C CNN
F 2 "" H 5150 2600 50  0001 C CNN
F 3 "~" H 5150 2600 50  0001 C CNN
	1    5150 2600
	-1   0    0    1   
$EndComp
$EndSCHEMATC
