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
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2800 2600 0    120  Input ~ 0
NichromeTemp
Text HLabel 2850 3100 0    120  Input ~ 0
HeatOn
$Comp
L R R40
U 1 1 5683EA71
P 3350 3100
F 0 "R40" V 3430 3100 50  0000 C CNN
F 1 "R" V 3350 3100 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3280 3100 50  0001 C CNN
F 3 "" H 3350 3100 50  0000 C CNN
	1    3350 3100
	0    1    1    0   
$EndComp
$Comp
L R R41
U 1 1 5683EABC
P 3700 3550
F 0 "R41" V 3780 3550 50  0000 C CNN
F 1 "R" V 3700 3550 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3630 3550 50  0001 C CNN
F 3 "" H 3700 3550 50  0000 C CNN
	1    3700 3550
	1    0    0    -1  
$EndComp
$Comp
L R R42
U 1 1 5683ED88
P 4200 3550
F 0 "R42" V 4280 3550 50  0000 C CNN
F 1 "R" V 4200 3550 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4130 3550 50  0001 C CNN
F 3 "" H 4200 3550 50  0000 C CNN
	1    4200 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR050
U 1 1 5683EDA5
P 3950 3850
F 0 "#PWR050" H 3950 3600 50  0001 C CNN
F 1 "GND" H 3950 3700 50  0000 C CNN
F 2 "" H 3950 3850 50  0000 C CNN
F 3 "" H 3950 3850 50  0000 C CNN
	1    3950 3850
	1    0    0    -1  
$EndComp
$Comp
L CP1 C5
U 1 1 5683F065
P 4850 2350
F 0 "C5" H 4875 2450 50  0000 L CNN
F 1 "CP1" H 4875 2250 50  0000 L CNN
F 2 "Easy-PCB-footprints:C_Disc_D6_P5" H 4850 2350 50  0001 C CNN
F 3 "" H 4850 2350 50  0000 C CNN
	1    4850 2350
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR051
U 1 1 5683F0D4
P 6200 1900
F 0 "#PWR051" H 6200 1750 50  0001 C CNN
F 1 "VDD" H 6200 2050 50  0000 C CNN
F 2 "" H 6200 1900 50  0000 C CNN
F 3 "" H 6200 1900 50  0000 C CNN
	1    6200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3100 3200 3100
Wire Wire Line
	3500 3100 3900 3100
Wire Wire Line
	3700 3100 3700 3400
Connection ~ 3700 3100
Wire Wire Line
	3700 3700 3700 3800
Wire Wire Line
	3700 3800 4200 3800
Wire Wire Line
	4200 3800 4200 3700
Wire Wire Line
	4200 3400 4200 3300
Wire Wire Line
	3950 3850 3950 3800
Connection ~ 3950 3800
Wire Wire Line
	4200 2600 4200 2900
Wire Wire Line
	4850 2600 4850 2500
$Comp
L R R43
U 1 1 5683F3CB
P 5300 2350
F 0 "R43" V 5380 2350 50  0000 C CNN
F 1 "R" V 5300 2350 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5230 2350 50  0001 C CNN
F 3 "" H 5300 2350 50  0000 C CNN
	1    5300 2350
	1    0    0    -1  
$EndComp
$Comp
L R R44
U 1 1 5683F658
P 5650 2600
F 0 "R44" V 5730 2600 50  0000 C CNN
F 1 "R" V 5650 2600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5580 2600 50  0001 C CNN
F 3 "" H 5650 2600 50  0000 C CNN
	1    5650 2600
	0    1    1    0   
$EndComp
$Comp
L R R46
U 1 1 5683F6FD
P 6750 2600
F 0 "R46" V 6830 2600 50  0000 C CNN
F 1 "R" V 6750 2600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6680 2600 50  0001 C CNN
F 3 "" H 6750 2600 50  0000 C CNN
	1    6750 2600
	0    1    1    0   
$EndComp
$Comp
L CP1 C8
U 1 1 5683F74C
P 7100 2350
F 0 "C8" H 7125 2450 50  0000 L CNN
F 1 "CP1" H 7125 2250 50  0000 L CNN
F 2 "Easy-PCB-footprints:C_Disc_D6_P5" H 7100 2350 50  0001 C CNN
F 3 "" H 7100 2350 50  0000 C CNN
	1    7100 2350
	1    0    0    -1  
$EndComp
$Comp
L R R47
U 1 1 5683FA2B
P 7500 2350
F 0 "R47" V 7580 2350 50  0000 C CNN
F 1 "R" V 7500 2350 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7430 2350 50  0001 C CNN
F 3 "" H 7500 2350 50  0000 C CNN
	1    7500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2600 5300 2500
Wire Wire Line
	7100 2600 7100 2500
Wire Wire Line
	7500 2600 7500 2500
Wire Wire Line
	4850 2200 4850 2100
Wire Wire Line
	4850 2100 7500 2100
Wire Wire Line
	5300 2100 5300 2200
Wire Wire Line
	7100 2100 7100 2200
Connection ~ 5300 2100
Wire Wire Line
	7500 2100 7500 2200
Connection ~ 7100 2100
Wire Wire Line
	6200 1900 6200 2100
Connection ~ 6200 2100
$Comp
L R R45
U 1 1 56840AF4
P 6200 2600
F 0 "R45" V 6280 2600 50  0000 C CNN
F 1 "R" V 6200 2600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6130 2600 50  0001 C CNN
F 3 "" H 6200 2600 50  0000 C CNN
	1    6200 2600
	0    1    1    0   
$EndComp
$Comp
L CP1 C6
U 1 1 56840B21
P 5900 2350
F 0 "C6" H 5925 2450 50  0000 L CNN
F 1 "CP1" H 5925 2250 50  0000 L CNN
F 2 "Easy-PCB-footprints:C_Disc_D6_P5" H 5900 2350 50  0001 C CNN
F 3 "" H 5900 2350 50  0000 C CNN
	1    5900 2350
	1    0    0    -1  
$EndComp
$Comp
L CP1 C7
U 1 1 56840B56
P 6500 2350
F 0 "C7" H 6525 2450 50  0000 L CNN
F 1 "CP1" H 6525 2250 50  0000 L CNN
F 2 "Easy-PCB-footprints:C_Disc_D6_P5" H 6500 2350 50  0001 C CNN
F 3 "" H 6500 2350 50  0000 C CNN
	1    6500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2600 5500 2600
Connection ~ 5300 2600
Wire Wire Line
	5800 2600 6050 2600
Wire Wire Line
	5900 2200 5900 2100
Connection ~ 5900 2100
Wire Wire Line
	5900 2500 5900 2600
Connection ~ 5900 2600
Wire Wire Line
	6350 2600 6600 2600
Wire Wire Line
	6500 2500 6500 2600
Connection ~ 6500 2600
Wire Wire Line
	6500 2200 6500 2100
Connection ~ 6500 2100
Wire Wire Line
	6900 2600 7500 2600
Connection ~ 7100 2600
Connection ~ 4850 2600
Connection ~ 4200 2600
$Comp
L 2N3904 Q19
U 1 1 56882825
P 4100 3100
F 0 "Q19" H 4300 3175 50  0000 L CNN
F 1 "2N3904" H 4300 3100 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 4300 3025 50  0000 L CIN
F 3 "" H 4100 3100 50  0000 L CNN
	1    4100 3100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
