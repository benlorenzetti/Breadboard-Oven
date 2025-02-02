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
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 6
Title "Easy-PCB-v1"
Date ""
Rev ""
Comp "Ben Lorenzetti"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6300 5250 1450 900 
U 564E6B87
F0 "Temperature Feedback" 60
F1 "Temperature-Feedback.sch" 60
F2 "Tref" O L 6300 5500 60 
F3 "Tk" O L 6300 5400 60 
F4 "K+" I R 7750 5950 60 
F5 "Vref-" O L 6300 5600 60 
F6 "SCK" I L 6300 5900 60 
F7 "~POT" I L 6300 5750 60 
F8 "MOSI" I L 6300 6050 60 
$EndSheet
$Comp
L CONN_01X20 J3
U 1 1 565A077E
P 1000 3650
F 0 "J3" H 1000 4700 50  0000 C CNN
F 1 "HLW20R-2C7LF" V 1100 3650 50  0000 C CNN
F 2 "Easy-PCB-footprints:HLW20R-2C7LF" H 1000 3650 60  0001 C CNN
F 3 "" H 1000 3650 60  0000 C CNN
	1    1000 3650
	-1   0    0    -1  
$EndComp
$Sheet
S 6750 4550 1000 450 
U 567EDC0D
F0 "Heat Relay" 60
F1 "Heat-Relay.sch" 60
F2 "Heat" B L 6750 4650 60 
F3 "DoorC1" B L 6750 4800 60 
F4 "HeatLive" B R 7750 4900 60 
F5 "DoorC2" B L 6750 4900 60 
$EndSheet
$Comp
L PIC16F883 U1
U 1 1 5680C7DE
P 4050 3600
F 0 "U1" H 4050 3450 60  0000 C CNN
F 1 "PIC16F883" H 4050 3550 60  0000 C CNN
F 2 "Easy-PCB-footprints:DIP-28" H 4050 3600 60  0001 C CNN
F 3 "" H 4050 3600 60  0000 C CNN
	1    4050 3600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 56812537
P 2000 3100
F 0 "#PWR01" H 2000 2850 50  0001 C CNN
F 1 "GND" H 2000 2950 50  0000 C CNN
F 2 "" H 2000 3100 50  0000 C CNN
F 3 "" H 2000 3100 50  0000 C CNN
	1    2000 3100
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR02
U 1 1 568125A1
P 1500 3400
F 0 "#PWR02" H 1500 3250 50  0001 C CNN
F 1 "VDD" H 1500 3550 50  0000 C CNN
F 2 "" H 1500 3400 50  0000 C CNN
F 3 "" H 1500 3400 50  0000 C CNN
	1    1500 3400
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 56814167
P 1700 3250
F 0 "C1" H 1710 3320 50  0000 L CNN
F 1 "0.1u" H 1710 3170 50  0000 L CNN
F 2 "Easy-PCB-footprints:C_Disc_D3_P2.5" H 1700 3250 50  0001 C CNN
F 3 "" H 1700 3250 50  0000 C CNN
	1    1700 3250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 56815306
P 2550 1800
F 0 "P1" H 2550 1950 50  0000 C CNN
F 1 "1x02" V 2650 1800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 2550 1800 50  0001 C CNN
F 3 "" H 2550 1800 50  0000 C CNN
	1    2550 1800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 56815C3E
P 5450 3500
F 0 "#PWR03" H 5450 3250 50  0001 C CNN
F 1 "GND" H 5450 3350 50  0000 C CNN
F 2 "" H 5450 3500 50  0000 C CNN
F 3 "" H 5450 3500 50  0000 C CNN
	1    5450 3500
	1    0    0    -1  
$EndComp
Text GLabel 5300 2700 2    60   Input ~ 0
SCK
Text GLabel 5650 5900 0    60   Input ~ 0
SCK
Text GLabel 5600 2600 2    60   Input ~ 0
CS1
Text GLabel 5650 6050 0    60   Input ~ 0
MOSI
$Comp
L R R11
U 1 1 5681DE70
P 5300 2050
F 0 "R11" V 5380 2050 50  0000 C CNN
F 1 "10k" V 5300 2050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5230 2050 50  0001 C CNN
F 3 "" H 5300 2050 50  0000 C CNN
	1    5300 2050
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5681DF9D
P 5600 2050
F 0 "R12" V 5680 2050 50  0000 C CNN
F 1 "10k" V 5600 2050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5530 2050 50  0001 C CNN
F 3 "" H 5600 2050 50  0000 C CNN
	1    5600 2050
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5681E010
P 5900 2050
F 0 "R13" V 5980 2050 50  0000 C CNN
F 1 "10k" V 5900 2050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5830 2050 50  0001 C CNN
F 3 "" H 5900 2050 50  0000 C CNN
	1    5900 2050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR04
U 1 1 5681E4B8
P 5600 1650
F 0 "#PWR04" H 5600 1500 50  0001 C CNN
F 1 "VDD" H 5600 1800 50  0000 C CNN
F 2 "" H 5600 1650 50  0000 C CNN
F 3 "" H 5600 1650 50  0000 C CNN
	1    5600 1650
	1    0    0    -1  
$EndComp
Text GLabel 5900 2500 2    60   Input ~ 0
CS2
Text GLabel 2400 2050 0    60   Input ~ 0
TX
Text GLabel 2700 2050 2    60   Input ~ 0
RX
$Comp
L R R10
U 1 1 568203C6
P 3300 5500
F 0 "R10" V 3380 5500 50  0000 C CNN
F 1 "10k" V 3300 5500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3230 5500 50  0001 C CNN
F 3 "" H 3300 5500 50  0000 C CNN
	1    3300 5500
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR05
U 1 1 5682046F
P 3300 5250
F 0 "#PWR05" H 3300 5100 50  0001 C CNN
F 1 "VDD" H 3300 5400 50  0000 C CNN
F 2 "" H 3300 5250 50  0000 C CNN
F 3 "" H 3300 5250 50  0000 C CNN
	1    3300 5250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 568217B2
P 2600 5500
F 0 "#PWR06" H 2600 5250 50  0001 C CNN
F 1 "GND" H 2600 5350 50  0000 C CNN
F 2 "" H 2600 5500 50  0000 C CNN
F 3 "" H 2600 5500 50  0000 C CNN
	1    2600 5500
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 56821F62
P 2550 5900
F 0 "P2" H 2550 6250 50  0000 C CNN
F 1 "1x06" V 2650 5900 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06" H 2550 5900 50  0001 C CNN
F 3 "" H 2550 5900 50  0000 C CNN
	1    2550 5900
	0    1    1    0   
$EndComp
NoConn ~ 2300 5700
$Comp
L SPEAKER SP1
U 1 1 56815E3D
P 9250 3950
F 0 "SP1" H 9150 4200 50  0000 C CNN
F 1 "2kHz Piezo" H 9150 3700 50  0000 C CNN
F 2 "Easy-PCB-footprints:PS1420" H 9250 3950 50  0001 C CNN
F 3 "" H 9250 3950 50  0000 C CNN
	1    9250 3950
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 56816949
P 8500 3950
F 0 "R15" V 8580 3950 50  0000 C CNN
F 1 "1k" V 8500 3950 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8430 3950 50  0001 C CNN
F 3 "" H 8500 3950 50  0000 C CNN
	1    8500 3950
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 568169CA
P 8250 4350
F 0 "R14" V 8330 4350 50  0000 C CNN
F 1 "1k" V 8250 4350 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8180 4350 50  0001 C CNN
F 3 "" H 8250 4350 50  0000 C CNN
	1    8250 4350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 56816B80
P 8700 4550
F 0 "#PWR07" H 8700 4300 50  0001 C CNN
F 1 "GND" H 8700 4400 50  0000 C CNN
F 2 "" H 8700 4550 50  0000 C CNN
F 3 "" H 8700 4550 50  0000 C CNN
	1    8700 4550
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR08
U 1 1 56816C00
P 8700 3800
F 0 "#PWR08" H 8700 3650 50  0001 C CNN
F 1 "VDD" H 8700 3950 50  0000 C CNN
F 2 "" H 8700 3800 50  0000 C CNN
F 3 "" H 8700 3800 50  0000 C CNN
	1    8700 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P3
U 1 1 568182F1
P 10200 3150
F 0 "P3" H 10200 3400 50  0000 C CNN
F 1 "1x04" V 10300 3150 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 10200 3150 50  0001 C CNN
F 3 "" H 10200 3150 50  0000 C CNN
	1    10200 3150
	1    0    0    -1  
$EndComp
$Comp
L IEC_Male_Inlet J1
U 1 1 56821A1C
P 6700 1300
F 0 "J1" H 7350 1400 60  0000 C CNN
F 1 "703W-00/53" H 7350 1300 60  0000 C CNN
F 2 "Easy-PCB-footprints:703W-0053" H 6700 1300 60  0001 C CNN
F 3 "" H 6700 1300 60  0000 C CNN
	1    6700 1300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR09
U 1 1 568226A1
P 6700 1650
F 0 "#PWR09" H 6700 1400 50  0001 C CNN
F 1 "Earth" H 6700 1500 50  0001 C CNN
F 2 "" H 6700 1650 50  0000 C CNN
F 3 "" H 6700 1650 50  0000 C CNN
	1    6700 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5682274F
P 6900 1650
F 0 "#PWR010" H 6900 1400 50  0001 C CNN
F 1 "GND" H 6900 1500 50  0000 C CNN
F 2 "" H 6900 1650 50  0000 C CNN
F 3 "" H 6900 1650 50  0000 C CNN
	1    6900 1650
	1    0    0    -1  
$EndComp
$Sheet
S 8500 1750 1050 600 
U 5682300F
F0 "Power Circuit" 60
F1 "Power-Circuit.sch" 60
F2 "MainsLive" I L 8500 2050 60 
$EndSheet
Wire Wire Line
	2000 4200 2800 4200
Wire Wire Line
	2000 4300 2800 4300
Wire Wire Line
	2000 3600 2700 3600
Wire Wire Line
	2700 3600 2700 3500
Wire Wire Line
	2700 3500 2800 3500
Wire Wire Line
	1200 3000 2800 3000
Wire Wire Line
	1200 3100 2150 3100
Wire Wire Line
	1300 3500 1200 3500
Connection ~ 1300 3400
Wire Wire Line
	1300 3200 1200 3200
Connection ~ 1300 3100
Wire Wire Line
	2800 3300 2150 3300
Wire Wire Line
	2150 3300 2150 3100
Connection ~ 2000 3100
Wire Wire Line
	1200 3400 2800 3400
Connection ~ 1500 3400
Wire Wire Line
	1700 3150 1700 3100
Connection ~ 1700 3100
Wire Wire Line
	1700 3350 1700 3400
Connection ~ 1700 3400
Wire Wire Line
	1200 2900 2800 2900
Wire Wire Line
	2600 2000 2600 3200
Wire Wire Line
	2600 3200 2800 3200
Wire Wire Line
	2500 2000 2500 3100
Wire Wire Line
	2500 3100 2800 3100
Wire Wire Line
	5300 3500 5450 3500
Wire Wire Line
	5600 3700 5300 3700
Wire Wire Line
	5600 2200 5600 3700
Wire Wire Line
	5300 2200 5300 2900
Wire Wire Line
	5300 4200 5600 4200
Wire Wire Line
	5300 4100 5700 4100
Wire Wire Line
	5300 4000 5800 4000
Wire Wire Line
	5800 4000 5800 5600
Wire Wire Line
	5800 5600 6300 5600
Wire Wire Line
	5700 4100 5700 5500
Wire Wire Line
	5700 5500 6300 5500
Wire Wire Line
	5600 4200 5600 5400
Wire Wire Line
	5600 5400 6300 5400
Wire Wire Line
	6750 4800 1350 4800
Wire Wire Line
	1200 4900 6750 4900
Wire Wire Line
	5300 3300 5900 3300
Wire Wire Line
	5900 2200 5900 5750
Wire Wire Line
	5900 5750 6300 5750
Connection ~ 5300 2700
Connection ~ 5600 2600
Connection ~ 5900 3300
Wire Wire Line
	5300 1900 5300 1800
Wire Wire Line
	5300 1800 5900 1800
Wire Wire Line
	5900 1800 5900 1900
Wire Wire Line
	5600 1650 5600 1900
Connection ~ 5600 1800
Wire Wire Line
	2400 2050 2500 2050
Connection ~ 2500 2050
Wire Wire Line
	2600 2050 2700 2050
Connection ~ 2600 2050
Wire Wire Line
	5300 5700 2800 5700
Wire Wire Line
	5300 4300 5300 5700
Connection ~ 3300 5700
Wire Wire Line
	3300 5250 3300 5350
Wire Wire Line
	2700 5700 2700 5300
Wire Wire Line
	2700 5300 3300 5300
Connection ~ 3300 5300
Wire Wire Line
	2600 5700 2600 5500
Wire Wire Line
	2400 5700 2400 4200
Connection ~ 2400 4200
Wire Wire Line
	2500 5700 2500 4300
Connection ~ 2500 4300
Wire Wire Line
	8500 3800 8700 3800
Wire Wire Line
	8700 3800 8700 3850
Wire Wire Line
	8700 3850 8950 3850
Wire Wire Line
	8500 4100 8700 4100
Wire Wire Line
	8700 4050 8700 4150
Wire Wire Line
	8700 4050 8950 4050
Connection ~ 8700 4100
Wire Wire Line
	5300 3200 8850 3200
Wire Wire Line
	6700 1450 6700 1650
Wire Wire Line
	6900 1450 6900 1650
$Comp
L SPST SW1
U 1 1 5682860D
P 7750 2050
F 0 "SW1" H 7750 2250 50  0000 C CNN
F 1 "R1966ABLKBLKFR" H 7750 1900 50  0000 C CNN
F 2 "Easy-PCB-footprints:R1966ABLKBLKFR" H 7750 2050 50  0001 C CNN
F 3 "" H 7750 2050 50  0000 C CNN
	1    7750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1450 6500 2050
Wire Wire Line
	6500 2050 7250 2050
Wire Wire Line
	8250 2050 8500 2050
$Sheet
S 8850 2900 1000 500 
U 5681BEC8
F0 "Motor Driver" 60
F1 "Motor-Driver.sch" 60
F2 "wind1a" O R 9850 3000 60 
F3 "wind1b" O R 9850 3100 60 
F4 "wind2a" O R 9850 3200 60 
F5 "wind2b" O R 9850 3300 60 
F6 "wind1" I L 8850 3000 60 
F7 "wind2" I L 8850 3100 60 
F8 "Motor_On" I L 8850 3200 60 
$EndSheet
Wire Wire Line
	5650 5900 6300 5900
Wire Wire Line
	5650 6050 6300 6050
$Sheet
S 6750 3650 1050 450 
U 56830748
F0 "Analog Math" 60
F1 "Analog-Math.sch" 60
F2 "NichromeTemp" I L 6750 3900 60 
F3 "HeatOn" I L 6750 4000 60 
$EndSheet
Wire Wire Line
	6000 3800 6000 4650
Wire Wire Line
	6000 4650 6750 4650
$Comp
L CONN_01X02 P5
U 1 1 568338BB
P 10200 6000
F 0 "P5" H 10200 6150 50  0000 C CNN
F 1 "1x02" V 10300 6000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 10200 6000 50  0001 C CNN
F 3 "" H 10200 6000 50  0000 C CNN
	1    10200 6000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P4
U 1 1 5683419B
P 10200 5000
F 0 "P4" H 10200 5200 50  0000 C CNN
F 1 "1x03 Terminal Block" V 10300 5000 50  0000 C CNN
F 2 "Easy-PCB-footprints:5-1437652-4" H 10200 5000 50  0001 C CNN
F 3 "" H 10200 5000 50  0000 C CNN
	1    10200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3900 6750 3900
Wire Wire Line
	5300 3400 6100 3400
Wire Wire Line
	6100 3400 6100 4350
Wire Wire Line
	6100 4350 8100 4350
Wire Wire Line
	7750 4900 10000 4900
$Comp
L Earth #PWR011
U 1 1 568362D2
P 9850 5300
F 0 "#PWR011" H 9850 5050 50  0001 C CNN
F 1 "Earth" H 9850 5150 50  0001 C CNN
F 2 "" H 9850 5300 50  0000 C CNN
F 3 "" H 9850 5300 50  0000 C CNN
	1    9850 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 56836494
P 9550 5150
F 0 "#PWR012" H 9550 4900 50  0001 C CNN
F 1 "GND" H 9550 5000 50  0000 C CNN
F 2 "" H 9550 5150 50  0000 C CNN
F 3 "" H 9550 5150 50  0000 C CNN
	1    9550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5000 9550 5000
Wire Wire Line
	9550 5000 9550 5150
Wire Wire Line
	10000 5100 9850 5100
Wire Wire Line
	9850 5100 9850 5300
$Comp
L GND #PWR013
U 1 1 56836D64
P 9850 6200
F 0 "#PWR013" H 9850 5950 50  0001 C CNN
F 1 "GND" H 9850 6050 50  0000 C CNN
F 2 "" H 9850 6200 50  0000 C CNN
F 3 "" H 9850 6200 50  0000 C CNN
	1    9850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 6050 9850 6050
Wire Wire Line
	9850 6050 9850 6200
Wire Wire Line
	7750 5950 10000 5950
Wire Wire Line
	10000 3000 9850 3000
Wire Wire Line
	9850 3100 10000 3100
Wire Wire Line
	10000 3200 9850 3200
Wire Wire Line
	9850 3300 10000 3300
Wire Wire Line
	1300 3400 1300 3500
Wire Wire Line
	1300 3300 1200 3300
Wire Wire Line
	1300 3100 1300 3300
Connection ~ 1300 3200
Text GLabel 1850 3000 1    60   Input ~ 0
MOSI
Text GLabel 2000 2900 1    60   Input ~ 0
MISO
Wire Wire Line
	5300 2700 1600 2700
Wire Wire Line
	1600 2700 1600 2800
Wire Wire Line
	1600 2800 1200 2800
Wire Wire Line
	1500 2600 5600 2600
Wire Wire Line
	1500 2600 1500 2700
Wire Wire Line
	1500 2700 1200 2700
Wire Wire Line
	5300 4500 2250 4500
Connection ~ 5300 4500
$Comp
L R R9
U 1 1 5683D9B0
P 2100 4500
F 0 "R9" V 2050 4700 50  0000 C CNN
F 1 "1k" V 2100 4500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 2030 4500 50  0001 C CNN
F 3 "" H 2100 4500 50  0000 C CNN
	1    2100 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 4400 1200 4400
Wire Wire Line
	1200 4900 1200 4600
Wire Wire Line
	1200 4500 1350 4500
Wire Wire Line
	1350 4500 1350 4800
Wire Wire Line
	3300 5700 3300 5650
Wire Wire Line
	1450 4400 1450 4500
$Comp
L R_PACK8 RP1
U 1 1 5682FC9C
P 1800 3950
F 0 "RP1" H 1800 4400 50  0000 C CNN
F 1 "320" H 1800 3500 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_DIP_x8_Slide" H 1800 3950 50  0001 C CNN
F 3 "" H 1800 3950 50  0000 C CNN
	1    1800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4500 1950 4500
Wire Wire Line
	2000 3700 2800 3700
Wire Wire Line
	2800 3800 2000 3800
Wire Wire Line
	2000 3900 2800 3900
Wire Wire Line
	2800 4000 2000 4000
Wire Wire Line
	2000 4100 2800 4100
Wire Wire Line
	1200 3600 1600 3600
Wire Wire Line
	1200 3700 1600 3700
Wire Wire Line
	1200 3800 1600 3800
Wire Wire Line
	1200 3900 1600 3900
Wire Wire Line
	1200 4000 1600 4000
Wire Wire Line
	1200 4100 1600 4100
Wire Wire Line
	1200 4200 1600 4200
Wire Wire Line
	1200 4300 1600 4300
Wire Wire Line
	6000 3800 5300 3800
Connection ~ 6500 4900
Wire Wire Line
	6500 4900 6500 4000
Wire Wire Line
	6500 4000 6750 4000
$Comp
L 2N3904 Q1
U 1 1 56880FA0
P 8600 4350
F 0 "Q1" H 8800 4425 50  0000 L CNN
F 1 "2N3904" H 8800 4350 50  0000 L CNN
F 2 "Easy-PCB-footprints:TO-92" H 8800 4275 50  0000 L CIN
F 3 "" H 8600 4350 50  0000 L CNN
	1    8600 4350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 568D89CB
P 1125 7050
F 0 "P6" H 1125 7150 50  0000 C CNN
F 1 "via" V 1225 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 1125 7050 50  0001 C CNN
F 3 "" H 1125 7050 50  0000 C CNN
	1    1125 7050
	0    1    1    0   
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 568D8D16
P 1350 7050
F 0 "P7" H 1350 7150 50  0000 C CNN
F 1 "via" V 1450 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 1350 7050 50  0001 C CNN
F 3 "" H 1350 7050 50  0000 C CNN
	1    1350 7050
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR014
U 1 1 568D9243
P 1125 6850
F 0 "#PWR014" H 1125 6700 50  0001 C CNN
F 1 "VDD" H 1125 7000 50  0000 C CNN
F 2 "" H 1125 6850 50  0000 C CNN
F 3 "" H 1125 6850 50  0000 C CNN
	1    1125 6850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR015
U 1 1 568D9301
P 1350 6850
F 0 "#PWR015" H 1350 6700 50  0001 C CNN
F 1 "VDD" H 1350 7000 50  0000 C CNN
F 2 "" H 1350 6850 50  0000 C CNN
F 3 "" H 1350 6850 50  0000 C CNN
	1    1350 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3000 7150 3000
Wire Wire Line
	7150 3000 7250 3100
Wire Wire Line
	7250 3100 8850 3100
Wire Wire Line
	8850 3000 7250 3000
Wire Wire Line
	7250 3000 7150 3100
Wire Wire Line
	7150 3100 5300 3100
$Comp
L CONN_01X01 P8
U 1 1 56A0E415
P 1575 7050
F 0 "P8" H 1575 7150 50  0000 C CNN
F 1 "via" V 1675 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 1575 7050 50  0001 C CNN
F 3 "" H 1575 7050 50  0000 C CNN
	1    1575 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	1575 6850 1575 6775
Text GLabel 1575 6775 1    60   Input ~ 0
12or24VAC1
$Comp
L CONN_01X01 P9
U 1 1 56A0EF61
P 1800 7050
F 0 "P9" H 1800 7150 50  0000 C CNN
F 1 "via" V 1900 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 1800 7050 50  0001 C CNN
F 3 "" H 1800 7050 50  0000 C CNN
	1    1800 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 6850 1800 6775
Text GLabel 1800 6775 1    60   Input ~ 0
DoorC2
$Comp
L CONN_01X01 P10
U 1 1 56A104F7
P 2025 7050
F 0 "P10" H 2025 7150 50  0000 C CNN
F 1 "via" V 2125 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 2025 7050 50  0001 C CNN
F 3 "" H 2025 7050 50  0000 C CNN
	1    2025 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2025 6850 2025 6775
Text GLabel 2025 6775 1    60   Input ~ 0
MOSI
$Comp
L CONN_01X01 P11
U 1 1 56A1147C
P 2250 7050
F 0 "P11" H 2250 7150 50  0000 C CNN
F 1 "via" V 2350 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 2250 7050 50  0001 C CNN
F 3 "" H 2250 7050 50  0000 C CNN
	1    2250 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 6850 2250 6775
Text GLabel 2250 6775 1    60   Input ~ 0
SCK
$Comp
L CONN_01X01 P13
U 1 1 56A12FD6
P 2475 7050
F 0 "P13" H 2475 7150 50  0000 C CNN
F 1 "via" V 2575 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 2475 7050 50  0001 C CNN
F 3 "" H 2475 7050 50  0000 C CNN
	1    2475 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2475 6850 2475 6775
Text GLabel 2475 6775 1    60   Input ~ 0
CS2
$Comp
L CONN_01X01 P14
U 1 1 56A2BF77
P 2700 7050
F 0 "P14" H 2700 7150 50  0000 C CNN
F 1 "via" V 2800 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 2700 7050 50  0001 C CNN
F 3 "" H 2700 7050 50  0000 C CNN
	1    2700 7050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR016
U 1 1 56A2C3C6
P 2700 6775
F 0 "#PWR016" H 2700 6525 50  0001 C CNN
F 1 "GND" H 2700 6625 50  0000 C CNN
F 2 "" H 2700 6775 50  0000 C CNN
F 3 "" H 2700 6775 50  0000 C CNN
	1    2700 6775
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 6775 2700 6850
$Comp
L CONN_01X01 P15
U 1 1 56A2CB3C
P 2925 7050
F 0 "P15" H 2925 7150 50  0000 C CNN
F 1 "via" V 3025 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 2925 7050 50  0001 C CNN
F 3 "" H 2925 7050 50  0000 C CNN
	1    2925 7050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 56A2CCE5
P 2925 6775
F 0 "#PWR017" H 2925 6525 50  0001 C CNN
F 1 "GND" H 2925 6625 50  0000 C CNN
F 2 "" H 2925 6775 50  0000 C CNN
F 3 "" H 2925 6775 50  0000 C CNN
	1    2925 6775
	-1   0    0    1   
$EndComp
Wire Wire Line
	2925 6850 2925 6775
$Comp
L CONN_01X01 P16
U 1 1 56A2EBBC
P 3150 7050
F 0 "P16" H 3150 7150 50  0000 C CNN
F 1 "via" V 3250 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 3150 7050 50  0001 C CNN
F 3 "" H 3150 7050 50  0000 C CNN
	1    3150 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 6850 3150 6775
Text GLabel 3150 6775 1    60   Input ~ 0
Motor_On
Text GLabel 8200 3200 3    60   Input ~ 0
Motor_On
$Comp
L CONN_01X01 P17
U 1 1 56A305FB
P 3375 7050
F 0 "P17" H 3375 7150 50  0000 C CNN
F 1 "via" V 3475 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 3375 7050 50  0001 C CNN
F 3 "" H 3375 7050 50  0000 C CNN
	1    3375 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	3375 6850 3375 6775
$Comp
L GND #PWR018
U 1 1 56A308A6
P 3375 6775
F 0 "#PWR018" H 3375 6525 50  0001 C CNN
F 1 "GND" H 3375 6625 50  0000 C CNN
F 2 "" H 3375 6775 50  0000 C CNN
F 3 "" H 3375 6775 50  0000 C CNN
	1    3375 6775
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X01 P18
U 1 1 56A31D71
P 3600 7050
F 0 "P18" H 3600 7150 50  0000 C CNN
F 1 "via" V 3700 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 3600 7050 50  0001 C CNN
F 3 "" H 3600 7050 50  0000 C CNN
	1    3600 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 6850 3600 6775
$Comp
L GND #PWR019
U 1 1 56A32319
P 3600 6775
F 0 "#PWR019" H 3600 6525 50  0001 C CNN
F 1 "GND" H 3600 6625 50  0000 C CNN
F 2 "" H 3600 6775 50  0000 C CNN
F 3 "" H 3600 6775 50  0000 C CNN
	1    3600 6775
	-1   0    0    1   
$EndComp
Text GLabel 4025 5700 1    60   Input ~ 0
Reset
$Comp
L CONN_01X01 P19
U 1 1 56A33F66
P 3825 7050
F 0 "P19" H 3825 7150 50  0000 C CNN
F 1 "via" V 3925 7050 50  0000 C CNN
F 2 "Connect:PINTST" H 3825 7050 50  0001 C CNN
F 3 "" H 3825 7050 50  0000 C CNN
	1    3825 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	3825 6850 3825 6775
Text GLabel 3825 6775 1    60   Input ~ 0
Reset
$EndSCHEMATC
