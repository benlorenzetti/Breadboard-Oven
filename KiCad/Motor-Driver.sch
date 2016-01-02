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
Sheet 5 6
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
L MJE340 Q9
U 1 1 5681C08E
P 4500 2100
F 0 "Q9" H 4700 2175 50  0000 L CNN
F 1 "MJE340" H 4700 2100 50  0000 L CNN
F 2 "" H 4700 2025 50  0001 L CIN
F 3 "" H 4500 2100 50  0000 L CNN
	1    4500 2100
	-1   0    0    -1  
$EndComp
$Comp
L MJE340 Q13
U 1 1 5681C158
P 6400 2100
F 0 "Q13" H 6600 2175 50  0000 L CNN
F 1 "MJE340" H 6600 2100 50  0000 L CNN
F 2 "" H 6600 2025 50  0001 L CIN
F 3 "" H 6400 2100 50  0000 L CNN
	1    6400 2100
	1    0    0    -1  
$EndComp
$Comp
L MJE340 Q16
U 1 1 5681C173
P 8300 2100
F 0 "Q16" H 8500 2175 50  0000 L CNN
F 1 "MJE340" H 8500 2100 50  0000 L CNN
F 2 "" H 8500 2025 50  0001 L CIN
F 3 "" H 8300 2100 50  0000 L CNN
	1    8300 2100
	-1   0    0    -1  
$EndComp
$Comp
L MJE340 Q5
U 1 1 5681C18E
P 2600 2100
F 0 "Q5" H 2800 2175 50  0000 L CNN
F 1 "MJE340" H 2800 2100 50  0000 L CNN
F 2 "" H 2800 2025 50  0001 L CIN
F 3 "" H 2600 2100 50  0000 L CNN
	1    2600 2100
	1    0    0    -1  
$EndComp
Text HLabel 9700 2500 2    120  Output ~ 0
wind1a
Text HLabel 9700 2700 2    120  Output ~ 0
wind1b
Text HLabel 9700 2900 2    120  Output ~ 0
wind2a
Text HLabel 9700 3100 2    120  Output ~ 0
wind2b
$Comp
L MJE350 Q6
U 1 1 5681C8DD
P 2600 3600
F 0 "Q6" H 2800 3675 50  0000 L CNN
F 1 "MJE350" H 2800 3600 50  0000 L CNN
F 2 "" H 2800 3525 50  0001 L CIN
F 3 "" H 2600 3600 50  0000 L CNN
	1    2600 3600
	1    0    0    1   
$EndComp
$Comp
L MJE350 Q10
U 1 1 5681C95E
P 4500 3600
F 0 "Q10" H 4700 3675 50  0000 L CNN
F 1 "MJE350" H 4700 3600 50  0000 L CNN
F 2 "" H 4700 3525 50  0001 L CIN
F 3 "" H 4500 3600 50  0000 L CNN
	1    4500 3600
	-1   0    0    1   
$EndComp
$Comp
L MJE350 Q14
U 1 1 5681C997
P 6400 3600
F 0 "Q14" H 6600 3675 50  0000 L CNN
F 1 "MJE350" H 6600 3600 50  0000 L CNN
F 2 "" H 6600 3525 50  0001 L CIN
F 3 "" H 6400 3600 50  0000 L CNN
	1    6400 3600
	1    0    0    1   
$EndComp
$Comp
L MJE350 Q17
U 1 1 5681C9BC
P 8300 3600
F 0 "Q17" H 8500 3675 50  0000 L CNN
F 1 "MJE350" H 8500 3600 50  0000 L CNN
F 2 "" H 8500 3525 50  0001 L CIN
F 3 "" H 8300 3600 50  0000 L CNN
	1    8300 3600
	-1   0    0    1   
$EndComp
$Comp
L D D3
U 1 1 5681CB9A
P 3350 2100
F 0 "D3" H 3350 2200 50  0000 C CNN
F 1 "D" H 3350 2000 50  0000 C CNN
F 2 "Discret:D3" H 3350 2100 50  0001 C CNN
F 3 "" H 3350 2100 50  0000 C CNN
	1    3350 2100
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 5681D091
P 3350 3600
F 0 "D4" H 3350 3700 50  0000 C CNN
F 1 "D" H 3350 3500 50  0000 C CNN
F 2 "Discret:D3" H 3350 3600 50  0001 C CNN
F 3 "" H 3350 3600 50  0000 C CNN
	1    3350 3600
	0    1    1    0   
$EndComp
$Comp
L D D5
U 1 1 5681D0BE
P 3750 2100
F 0 "D5" H 3750 2200 50  0000 C CNN
F 1 "D" H 3750 2000 50  0000 C CNN
F 2 "Discret:D3" H 3750 2100 50  0001 C CNN
F 3 "" H 3750 2100 50  0000 C CNN
	1    3750 2100
	0    1    1    0   
$EndComp
$Comp
L D D6
U 1 1 5681D0F5
P 3750 3600
F 0 "D6" H 3750 3700 50  0000 C CNN
F 1 "D" H 3750 3500 50  0000 C CNN
F 2 "Discret:D3" H 3750 3600 50  0001 C CNN
F 3 "" H 3750 3600 50  0000 C CNN
	1    3750 3600
	0    1    1    0   
$EndComp
$Comp
L D D7
U 1 1 5681D13E
P 7150 2100
F 0 "D7" H 7150 2200 50  0000 C CNN
F 1 "D" H 7150 2000 50  0000 C CNN
F 2 "Discret:D3" H 7150 2100 50  0001 C CNN
F 3 "" H 7150 2100 50  0000 C CNN
	1    7150 2100
	0    1    1    0   
$EndComp
$Comp
L D D8
U 1 1 5681D171
P 7150 3600
F 0 "D8" H 7150 3700 50  0000 C CNN
F 1 "D" H 7150 3500 50  0000 C CNN
F 2 "Discret:D3" H 7150 3600 50  0001 C CNN
F 3 "" H 7150 3600 50  0000 C CNN
	1    7150 3600
	0    1    1    0   
$EndComp
$Comp
L D D9
U 1 1 5681D1A8
P 7550 2100
F 0 "D9" H 7550 2200 50  0000 C CNN
F 1 "D" H 7550 2000 50  0000 C CNN
F 2 "Discret:D3" H 7550 2100 50  0001 C CNN
F 3 "" H 7550 2100 50  0000 C CNN
	1    7550 2100
	0    1    1    0   
$EndComp
$Comp
L D D10
U 1 1 5681D1DF
P 7550 3600
F 0 "D10" H 7550 3700 50  0000 C CNN
F 1 "D" H 7550 3500 50  0000 C CNN
F 2 "Discret:D3" H 7550 3600 50  0001 C CNN
F 3 "" H 7550 3600 50  0000 C CNN
	1    7550 3600
	0    1    1    0   
$EndComp
$Comp
L R R32
U 1 1 5681F689
P 2300 1750
F 0 "R32" V 2380 1750 50  0000 C CNN
F 1 "165" V 2300 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 2230 1750 50  0001 C CNN
F 3 "" H 2300 1750 50  0000 C CNN
	1    2300 1750
	1    0    0    -1  
$EndComp
$Comp
L R R33
U 1 1 5681F6D4
P 4800 1750
F 0 "R33" V 4880 1750 50  0000 C CNN
F 1 "165" V 4800 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 4730 1750 50  0001 C CNN
F 3 "" H 4800 1750 50  0000 C CNN
	1    4800 1750
	1    0    0    -1  
$EndComp
$Comp
L R R34
U 1 1 5681F715
P 6100 1750
F 0 "R34" V 6180 1750 50  0000 C CNN
F 1 "165" V 6100 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 6030 1750 50  0001 C CNN
F 3 "" H 6100 1750 50  0000 C CNN
	1    6100 1750
	1    0    0    -1  
$EndComp
$Comp
L R R35
U 1 1 5681F758
P 8600 1750
F 0 "R35" V 8680 1750 50  0000 C CNN
F 1 "165" V 8600 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM15mm" V 8530 1750 50  0001 C CNN
F 3 "" H 8600 1750 50  0000 C CNN
	1    8600 1750
	1    0    0    -1  
$EndComp
$Comp
L R R30
U 1 1 5681FC40
P 9400 3950
F 0 "R30" V 9480 3950 50  0000 C CNN
F 1 "64" V 9400 3950 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 9330 3950 50  0001 C CNN
F 3 "" H 9400 3950 50  0000 C CNN
	1    9400 3950
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 5681FD0B
P 9400 5050
F 0 "R31" V 9480 5050 50  0000 C CNN
F 1 "64" V 9400 5050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 9330 5050 50  0001 C CNN
F 3 "" H 9400 5050 50  0000 C CNN
	1    9400 5050
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 5681FEE1
P 1600 4300
F 0 "R26" V 1680 4300 50  0000 C CNN
F 1 "140" V 1600 4300 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1530 4300 50  0001 C CNN
F 3 "" H 1600 4300 50  0000 C CNN
	1    1600 4300
	0    1    1    0   
$EndComp
$Comp
L R R28
U 1 1 5681FF38
P 5350 4700
F 0 "R28" V 5430 4700 50  0000 C CNN
F 1 "140" V 5350 4700 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5280 4700 50  0001 C CNN
F 3 "" H 5350 4700 50  0000 C CNN
	1    5350 4700
	0    1    1    0   
$EndComp
$Comp
L R R29
U 1 1 56820103
P 5650 5050
F 0 "R29" V 5730 5050 50  0000 C CNN
F 1 "115" V 5650 5050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5580 5050 50  0001 C CNN
F 3 "" H 5650 5050 50  0000 C CNN
	1    5650 5050
	-1   0    0    1   
$EndComp
$Comp
L R R27
U 1 1 56820195
P 1900 5050
F 0 "R27" V 1980 5050 50  0000 C CNN
F 1 "115" V 1900 5050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1830 5050 50  0001 C CNN
F 3 "" H 1900 5050 50  0000 C CNN
	1    1900 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 56820CB6
P 3550 4000
F 0 "#PWR037" H 3550 3750 50  0001 C CNN
F 1 "GND" H 3550 3850 50  0000 C CNN
F 2 "" H 3550 4000 50  0000 C CNN
F 3 "" H 3550 4000 50  0000 C CNN
	1    3550 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 56821929
P 7350 4000
F 0 "#PWR038" H 7350 3750 50  0001 C CNN
F 1 "GND" H 7350 3850 50  0000 C CNN
F 2 "" H 7350 4000 50  0000 C CNN
F 3 "" H 7350 4000 50  0000 C CNN
	1    7350 4000
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR039
U 1 1 56822950
P 9400 3700
F 0 "#PWR039" H 9400 3550 50  0001 C CNN
F 1 "VDD" H 9400 3850 50  0000 C CNN
F 2 "" H 9400 3700 50  0000 C CNN
F 3 "" H 9400 3700 50  0000 C CNN
	1    9400 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 56822AAE
P 9400 5400
F 0 "#PWR040" H 9400 5150 50  0001 C CNN
F 1 "GND" H 9400 5250 50  0000 C CNN
F 2 "" H 9400 5400 50  0000 C CNN
F 3 "" H 9400 5400 50  0000 C CNN
	1    9400 5400
	1    0    0    -1  
$EndComp
Text HLabel 1300 4300 0    120  Input ~ 0
wind1
Text HLabel 1300 4700 0    120  Input ~ 0
wind2
$Comp
L VCC #PWR041
U 1 1 568235AA
P 5450 1200
F 0 "#PWR041" H 5450 1050 50  0001 C CNN
F 1 "VCC" H 5450 1350 50  0000 C CNN
F 2 "" H 5450 1200 50  0000 C CNN
F 3 "" H 5450 1200 50  0000 C CNN
	1    5450 1200
	1    0    0    -1  
$EndComp
Text HLabel 1550 5900 0    120  Input ~ 0
Motor_On
$Comp
L R R36
U 1 1 568252C6
P 2800 6200
F 0 "R36" V 2880 6200 50  0000 C CNN
F 1 "51" V 2800 6200 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 2730 6200 50  0001 C CNN
F 3 "" H 2800 6200 50  0000 C CNN
	1    2800 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 1500 2300 1600
Wire Wire Line
	2300 1500 8600 1500
Wire Wire Line
	4800 1500 4800 1600
Wire Wire Line
	6100 1500 6100 1600
Connection ~ 4800 1500
Wire Wire Line
	8600 1500 8600 1600
Connection ~ 6100 1500
Wire Wire Line
	6100 1900 6100 4500
Wire Wire Line
	6100 2100 6200 2100
Wire Wire Line
	4800 1900 4800 4100
Wire Wire Line
	4800 2100 4700 2100
Wire Wire Line
	2300 1900 2300 4100
Wire Wire Line
	2300 2100 2400 2100
Wire Wire Line
	2700 1900 2700 1500
Connection ~ 2700 1500
Wire Wire Line
	3350 1950 3350 1500
Connection ~ 3350 1500
Wire Wire Line
	3750 1950 3750 1500
Connection ~ 3750 1500
Wire Wire Line
	4400 1900 4400 1500
Connection ~ 4400 1500
Wire Wire Line
	6500 1900 6500 1500
Connection ~ 6500 1500
Wire Wire Line
	7150 1950 7150 1500
Connection ~ 7150 1500
Wire Wire Line
	7550 1950 7550 1500
Connection ~ 7550 1500
Wire Wire Line
	8200 1900 8200 1500
Connection ~ 8200 1500
Wire Wire Line
	8600 1900 8600 4500
Wire Wire Line
	8600 2100 8500 2100
Wire Wire Line
	2300 3600 2400 3600
Connection ~ 2300 2100
Wire Wire Line
	2700 2300 2700 3400
Wire Wire Line
	3350 2250 3350 3450
Wire Wire Line
	3750 2250 3750 3450
Wire Wire Line
	4400 2300 4400 3400
Wire Wire Line
	2700 2500 9700 2500
Connection ~ 3350 2500
Connection ~ 2700 2500
Wire Wire Line
	3750 2700 9700 2700
Connection ~ 4400 2700
Connection ~ 3750 2700
Wire Wire Line
	4800 3600 4700 3600
Connection ~ 4800 2100
Connection ~ 2300 3600
Connection ~ 4800 3600
Wire Wire Line
	2700 3800 2700 3900
Wire Wire Line
	2700 3900 4400 3900
Wire Wire Line
	4400 3900 4400 3800
Wire Wire Line
	3750 3750 3750 3900
Connection ~ 3750 3900
Wire Wire Line
	3350 3750 3350 3900
Connection ~ 3350 3900
Wire Wire Line
	3550 3900 3550 4000
Connection ~ 3550 3900
Wire Wire Line
	2300 4500 4800 4500
Wire Wire Line
	6500 2300 6500 3400
Wire Wire Line
	7150 2250 7150 3450
Wire Wire Line
	7550 2250 7550 3450
Wire Wire Line
	8200 2300 8200 3400
Wire Wire Line
	6100 3600 6200 3600
Connection ~ 6100 2100
Connection ~ 6100 3600
Wire Wire Line
	8600 3600 8500 3600
Connection ~ 8600 2100
Connection ~ 8600 3600
Wire Wire Line
	6500 3800 6500 3900
Wire Wire Line
	6500 3900 8200 3900
Wire Wire Line
	8200 3900 8200 3800
Wire Wire Line
	7550 3750 7550 3900
Connection ~ 7550 3900
Wire Wire Line
	7150 3750 7150 3900
Connection ~ 7150 3900
Connection ~ 7350 3900
Wire Wire Line
	6500 2900 9700 2900
Connection ~ 7150 2900
Connection ~ 6500 2900
Wire Wire Line
	7550 3100 9700 3100
Connection ~ 8200 3100
Connection ~ 7550 3100
Wire Wire Line
	5800 4700 5500 4700
Wire Wire Line
	7350 3900 7350 4000
Wire Wire Line
	5100 4300 9400 4300
Wire Wire Line
	9400 4100 9400 4900
Connection ~ 9400 4300
Wire Wire Line
	8900 4700 9400 4700
Connection ~ 9400 4700
Wire Wire Line
	9400 3800 9400 3700
Wire Wire Line
	9400 5200 9400 5400
Wire Wire Line
	1300 4300 1450 4300
Wire Wire Line
	1750 4300 2000 4300
Wire Wire Line
	1300 4700 5200 4700
Wire Wire Line
	1900 4300 1900 4900
Connection ~ 1900 4300
Wire Wire Line
	5650 4700 5650 4900
Connection ~ 5650 4700
Wire Wire Line
	6100 4900 8600 4900
Wire Wire Line
	5450 1200 5450 1500
Connection ~ 5450 1500
Wire Wire Line
	1550 5900 2000 5900
$Comp
L R R39
U 1 1 56825779
P 6600 6750
F 0 "R39" V 6680 6750 50  0000 C CNN
F 1 "10" V 6600 6750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6530 6750 50  0001 C CNN
F 3 "" H 6600 6750 50  0000 C CNN
	1    6600 6750
	1    0    0    -1  
$EndComp
$Comp
L R R38
U 1 1 568257DC
P 4400 7050
F 0 "R38" V 4480 7050 50  0000 C CNN
F 1 "10" V 4400 7050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4330 7050 50  0001 C CNN
F 3 "" H 4400 7050 50  0000 C CNN
	1    4400 7050
	1    0    0    -1  
$EndComp
$Comp
L R R37
U 1 1 568258D1
P 3300 7050
F 0 "R37" V 3380 7050 50  0000 C CNN
F 1 "10" V 3300 7050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3230 7050 50  0001 C CNN
F 3 "" H 3300 7050 50  0000 C CNN
	1    3300 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 56825AD6
P 3300 7350
F 0 "#PWR042" H 3300 7100 50  0001 C CNN
F 1 "GND" H 3300 7200 50  0000 C CNN
F 2 "" H 3300 7350 50  0000 C CNN
F 3 "" H 3300 7350 50  0000 C CNN
	1    3300 7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 56825B36
P 4400 7350
F 0 "#PWR043" H 4400 7100 50  0001 C CNN
F 1 "GND" H 4400 7200 50  0000 C CNN
F 2 "" H 4400 7350 50  0000 C CNN
F 3 "" H 4400 7350 50  0000 C CNN
	1    4400 7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 56825B96
P 6600 7100
F 0 "#PWR044" H 6600 6850 50  0001 C CNN
F 1 "GND" H 6600 6950 50  0000 C CNN
F 2 "" H 6600 7100 50  0000 C CNN
F 3 "" H 6600 7100 50  0000 C CNN
	1    6600 7100
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR045
U 1 1 56825C42
P 2300 5500
F 0 "#PWR045" H 2300 5350 50  0001 C CNN
F 1 "VDD" H 2300 5650 50  0000 C CNN
F 2 "" H 2300 5500 50  0000 C CNN
F 3 "" H 2300 5500 50  0000 C CNN
	1    2300 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 56825CA2
P 1900 5350
F 0 "#PWR046" H 1900 5100 50  0001 C CNN
F 1 "GND" H 1900 5200 50  0000 C CNN
F 2 "" H 1900 5350 50  0000 C CNN
F 3 "" H 1900 5350 50  0000 C CNN
	1    1900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5200 1900 5350
$Comp
L GND #PWR047
U 1 1 56825D8E
P 5650 5400
F 0 "#PWR047" H 5650 5150 50  0001 C CNN
F 1 "GND" H 5650 5250 50  0000 C CNN
F 2 "" H 5650 5400 50  0000 C CNN
F 3 "" H 5650 5400 50  0000 C CNN
	1    5650 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5200 5650 5400
Wire Wire Line
	2300 5500 2300 5700
Wire Wire Line
	2300 6100 2300 6200
Wire Wire Line
	2300 6200 2650 6200
Wire Wire Line
	2950 6200 6300 6200
Wire Wire Line
	3300 6200 3300 6300
Wire Wire Line
	3600 6500 4100 6500
Wire Wire Line
	3850 6200 3850 6500
Connection ~ 3300 6200
Connection ~ 3850 6500
Connection ~ 3850 6200
Wire Wire Line
	3300 6700 3300 6900
Wire Wire Line
	3300 7200 3300 7350
Wire Wire Line
	4400 6700 4400 6900
Wire Wire Line
	4400 7200 4400 7350
Wire Wire Line
	4400 6300 4400 4500
Connection ~ 4400 4500
Wire Wire Line
	6600 6000 6600 4900
Connection ~ 6600 4900
Wire Wire Line
	6600 6400 6600 6600
Wire Wire Line
	6600 6900 6600 7100
$Comp
L 2N3904 Q3
U 1 1 568814C5
P 2200 4300
F 0 "Q3" H 2400 4375 50  0000 L CNN
F 1 "2N3904" H 2400 4300 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 2400 4225 50  0000 L CIN
F 3 "" H 2200 4300 50  0000 L CNN
	1    2200 4300
	1    0    0    -1  
$EndComp
$Comp
L 2N3904 Q11
U 1 1 56881680
P 4900 4300
F 0 "Q11" H 5100 4375 50  0000 L CNN
F 1 "2N3904" H 5100 4300 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 5100 4225 50  0000 L CIN
F 3 "" H 4900 4300 50  0000 L CNN
	1    4900 4300
	-1   0    0    -1  
$EndComp
$Comp
L 2N3904 Q12
U 1 1 56881817
P 6000 4700
F 0 "Q12" H 6200 4775 50  0000 L CNN
F 1 "2N3904" H 6200 4700 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 6200 4625 50  0000 L CIN
F 3 "" H 6000 4700 50  0000 L CNN
	1    6000 4700
	1    0    0    -1  
$EndComp
$Comp
L 2N3904 Q18
U 1 1 56881960
P 8700 4700
F 0 "Q18" H 8900 4775 50  0000 L CNN
F 1 "2N3904" H 8900 4700 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 8900 4625 50  0000 L CIN
F 3 "" H 8700 4700 50  0000 L CNN
	1    8700 4700
	-1   0    0    -1  
$EndComp
$Comp
L 2N3904 Q15
U 1 1 56881BB3
P 6500 6200
F 0 "Q15" H 6700 6275 50  0000 L CNN
F 1 "2N3904" H 6700 6200 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 6700 6125 50  0000 L CIN
F 3 "" H 6500 6200 50  0000 L CNN
	1    6500 6200
	1    0    0    -1  
$EndComp
$Comp
L 2N3904 Q8
U 1 1 56881E2C
P 4300 6500
F 0 "Q8" H 4500 6575 50  0000 L CNN
F 1 "2N3904" H 4500 6500 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 4500 6425 50  0000 L CIN
F 3 "" H 4300 6500 50  0000 L CNN
	1    4300 6500
	1    0    0    -1  
$EndComp
$Comp
L 2N3904 Q7
U 1 1 56881FE9
P 3400 6500
F 0 "Q7" H 3600 6575 50  0000 L CNN
F 1 "2N3904" H 3600 6500 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 3600 6425 50  0000 L CIN
F 3 "" H 3400 6500 50  0000 L CNN
	1    3400 6500
	-1   0    0    -1  
$EndComp
$Comp
L 2N3904 Q4
U 1 1 5688217E
P 2200 5900
F 0 "Q4" H 2400 5975 50  0000 L CNN
F 1 "2N3904" H 2400 5900 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 2400 5825 50  0000 L CIN
F 3 "" H 2200 5900 50  0000 L CNN
	1    2200 5900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
