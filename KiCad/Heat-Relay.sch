EESchema Schematic File Version 2
LIBS:Easy-PCB
LIBS:Easy-PCB-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Easy-PCB-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2400 4400 0    60   BiDi ~ 0
Heat
$Comp
L G5LE-1A-E_DC12 K1
U 1 1 568008CE
P 7100 3250
F 0 "K1" H 7850 3350 50  0000 L CNN
F 1 "G5LE-1A-E_DC12" H 7850 3200 50  0000 L CNN
F 2 "Easy-PCB-footprints:G5LE-1A-E_DC12" H 7100 3250 50  0001 C CNN
F 3 "" H 7100 3250 50  0000 C CNN
	1    7100 3250
	1    0    0    -1  
$EndComp
$Comp
L MJE340 Q2
U 1 1 5680095F
P 6300 4400
F 0 "Q2" H 6500 4475 50  0000 L CNN
F 1 "MJE340" H 6500 4400 50  0000 L CNN
F 2 "Easy-PCB-footprints:MJE3x0" H 6500 4325 50  0001 L CIN
F 3 "" H 6300 4400 50  0000 L CNN
	1    6300 4400
	1    0    0    -1  
$EndComp
$Comp
L D D2
U 1 1 56800A86
P 6400 3250
F 0 "D2" V 6300 3100 50  0000 R CNN
F 1 "V*A(max) > 0.4 W" V 6450 3100 50  0000 R CNN
F 2 "Discret:D3" H 6400 3250 50  0001 C CNN
F 3 "" H 6400 3250 50  0000 C CNN
	1    6400 3250
	0    1    1    0   
$EndComp
Text HLabel 8400 3850 2    60   BiDi ~ 0
HeatLive
$Comp
L VAA #PWR026
U 1 1 56800D0A
P 7650 2200
F 0 "#PWR026" H 7650 2050 50  0001 C CNN
F 1 "VAA" H 7650 2350 50  0000 C CNN
F 2 "" H 7650 2200 50  0000 C CNN
F 3 "" H 7650 2200 50  0000 C CNN
	1    7650 2200
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR027
U 1 1 56800DC1
P 6400 2200
F 0 "#PWR027" H 6400 2050 50  0001 C CNN
F 1 "+12V" H 6400 2340 50  0000 C CNN
F 2 "" H 6400 2200 50  0000 C CNN
F 3 "" H 6400 2200 50  0000 C CNN
	1    6400 2200
	1    0    0    -1  
$EndComp
Text HLabel 4400 4300 1    60   BiDi ~ 0
DoorC1
Text HLabel 4800 4300 1    60   BiDi ~ 0
DoorC2
$Comp
L R R23
U 1 1 56800FE2
P 5500 4950
F 0 "R23" V 5580 4950 50  0000 C CNN
F 1 "333" V 5500 4950 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5430 4950 50  0001 C CNN
F 3 "" H 5500 4950 50  0000 C CNN
	1    5500 4950
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 5680103F
P 3550 4400
F 0 "R22" V 3630 4400 50  0000 C CNN
F 1 "1k" V 3550 4400 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3480 4400 50  0001 C CNN
F 3 "" H 3550 4400 50  0000 C CNN
	1    3550 4400
	0    1    1    0   
$EndComp
$Comp
L R R21
U 1 1 5680107F
P 3000 3950
F 0 "R21" V 3080 3950 50  0000 C CNN
F 1 "10k" V 3000 3950 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 2930 3950 50  0001 C CNN
F 3 "" H 3000 3950 50  0000 C CNN
	1    3000 3950
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR028
U 1 1 56801231
P 3000 3300
F 0 "#PWR028" H 3000 3150 50  0001 C CNN
F 1 "VDD" H 3000 3450 50  0000 C CNN
F 2 "" H 3000 3300 50  0000 C CNN
F 3 "" H 3000 3300 50  0000 C CNN
	1    3000 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 56801366
P 5500 5400
F 0 "#PWR029" H 5500 5150 50  0001 C CNN
F 1 "GND" H 5500 5250 50  0000 C CNN
F 2 "" H 5500 5400 50  0000 C CNN
F 3 "" H 5500 5400 50  0000 C CNN
	1    5500 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 56801386
P 6400 5400
F 0 "#PWR030" H 6400 5150 50  0001 C CNN
F 1 "GND" H 6400 5250 50  0000 C CNN
F 2 "" H 6400 5400 50  0000 C CNN
F 3 "" H 6400 5400 50  0000 C CNN
	1    6400 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2200 6400 3100
Wire Wire Line
	6400 2650 7100 2650
Wire Wire Line
	7100 2650 7100 2800
Connection ~ 6400 2650
Wire Wire Line
	6400 3400 6400 4200
Wire Wire Line
	7100 3700 7100 3850
Wire Wire Line
	7100 3850 6400 3850
Connection ~ 6400 3850
Wire Wire Line
	3000 3300 3000 3800
Wire Wire Line
	2400 4400 3400 4400
Wire Wire Line
	3000 4100 3000 4400
Connection ~ 3000 4400
Wire Wire Line
	3700 4400 4400 4400
Wire Wire Line
	4400 4400 4400 4300
Wire Wire Line
	4800 4300 4800 4400
Wire Wire Line
	4800 4400 6100 4400
Wire Wire Line
	5500 4800 5500 4400
Connection ~ 5500 4400
Wire Wire Line
	5500 5100 5500 5400
Wire Wire Line
	6400 4600 6400 5400
Wire Wire Line
	7650 2200 7650 2800
Wire Wire Line
	7650 3700 7650 3850
Wire Wire Line
	7650 3850 8400 3850
Text GLabel 6400 2650 0    60   Input ~ 0
12Vrelay1
Text GLabel 6400 3850 0    60   Input ~ 0
12Vrelay2
$EndSCHEMATC
