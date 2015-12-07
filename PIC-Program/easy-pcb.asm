#include <p16f883.inc>
	__CONFIG	_CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG	_CONFIG2, _WRT_OFF & _BOR21V

#define	SS	RA5
#define	SCK	RC3
#define	SDI	RC4
#define SDO	RC5
#define	LEFT	RB4
#define UP	RB1
#define	DOWN	RB5
#define	RIGHT	RB7
#define	START	RB6
#define	GRN_LED	RB3
#define	STOP	RB0
#define	RED_LED	RB3
#define	ALARM	RA4
#define	HEAT	RA3
#define	T_REF	RA0
#define	T_K1	RA1
#define	T_K2	RA2


#define	TIME_DATA	0x20
#define	TEMP_DATA	0x20
#define	MAX_DATA_SIZE	.8
#define	TT_BOOLEAN	0
#define	START_BOOLEAN	1

#define	TMR0_PERIOD	.125
#define	TIME_COUNTER_SET_VALUE	.255
#define	LED_INTENSITY	.8	; Light Intensity from 0-15

; Digits 0-9 have lookup indices 0-9, but :, deg, and C
#define	SEMICOLON	.10	
#define	DEGREE_SIGN	.11
#define	CELSIUS	.12
#define	ALL_OFF	.13

	cblock	0x20
		t0
		T0
		t1
		T1
		t2
		T2
		t3
		T3
		t4
		T4
		t5
		T5
		t6
		T6
		t7
		T7
		time_L
		time_H
		Temp
		booleans_reg
		time_counter_L
		time_counter_H
		datapoint
		POSITION_RAM
		POSITION_EE
		LastTime
		SPI_tx1	; first byte to be transfered out by SPI
		SPI_tx2	; second byte to be transfered out by SPI
		dividend	; used for division for LED display
		dig1		; "                               "
		dig10		; "                               "
		dig100		; "                               "
		dig1000		; "                               "
		delay1
		delay2
		delay3
		temp
	endc

	ORG 	0x0
Reset_Vector
	GOTO	Initialize_IO

Interupt_Vector
	ORG	0x4
	BANKSEL	0
	CLRF	PORTA	; shut down all potential output signals
	CLRF	PORTB	; (i.e. shut down the relay)
	CLRF	PORTC
	BCF	booleans_reg, START_BOOLEAN
	BTFSC	PORTB, START
	BSF	booleans_reg, START_BOOLEAN
	GOTO	Initialize_IO	; reinitialize program state/memory

;________________________Function Definitions_______________________;

; W LED_lookup_table (W); // warning: undefined behavior if W > 13
	ORG	0x10
LED_Lookup_Table
	; MUST MAKE SURE THE TABLE WILL NOT CROSS A 256 BYTE BOUNDARY!
	ADDWF	PCL, F
	RETLW	B'01111110'	; 0
	RETLW	B'00110000'	; 1
	RETLW	B'01101101'	; 2
	RETLW	B'01111001'	; 3
	RETLW	B'00110011'	; 4
	RETLW	B'01011011'	; 5
	RETLW	B'01011111'	; 6
	RETLW	B'01110000'	; 7
	RETLW	B'01111111'	; 8
	RETLW	B'01110011'	; 9
	RETLW	B'01100000'	; semicolon for clock
	RETLW	B'00010000'	; degree sign for temperature
	RETLW	B'01001110'	; C for celsius
	RETLW	B'00000000'	; All off

; void Update_LED_Display (uint16_t time, uint8_t Temp, uint8_t *tT_boolean);
Update_LED_Display
	CLRF	dig1
	CLRF	dig10
	CLRF	dig100
	CLRF	dig1000	
	BANKSEL	booleans_reg
	BTFSC	booleans_reg, TT_BOOLEAN
	GOTO	BDC_for_Temp
	; else	BDC_for_Time
BDC_for_Time
	BANKSEL	time_L
	MOVF	time_L, W
	MOVWF	dividend
Hundreds_Loop
	MOVLW	.100
	SUBWF	dividend, 1
	BTFSC	STATUS, C
	INCF	dig100, F
	BTFSC	STATUS, C
	GOTO	Hundreds_Loop
	MOVLW	.100
	ADDWF	dividend, 1
Tens_Loop
	MOVLW	.10
	SUBWF	dividend, F
	BTFSC	STATUS, C
	INCF	dig10, F
	BTFSC	STATUS, C
	GOTO	Tens_Loop
	MOVLW	.10
	ADDWF	dividend, W
	MOVWF	dig1
Display_Time
	MOVLW	0x5	; MAX7219 digit 0 address for semicolon
	MOVWF	SPI_tx1
	MOVLW	SEMICOLON
	CALL	LED_Lookup_Table	; lookup A-DP code for semicolon
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x1	; MAX7219 digit 1 address for thousandths digit
	MOVWF	SPI_tx1
	MOVLW	ALL_OFF
	CALL	LED_Lookup_Table	; lookup A-DP code for 0
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x2	; MAX7219 digit 2 address for hundreds digit
	MOVWF	SPI_tx1
	MOVF	dig100, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x3	; MAX7219 digit 3 address for tens digit
	MOVWF	SPI_tx1
	MOVF	dig10, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x4	; MAX7219 digit 4 address for ones digit
	MOVWF	SPI_tx1
	MOVF	dig1, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	RETURN
BDC_for_Temp
	MOVF	Temp, W
	MOVWF	dig1
	MOVLW	.2
	MOVWF	dig10	; add 20, because Temp=0 represents T=20deg
Subtract_Division_Loop
	MOVLW	.10		
	SUBWF	dig1, F	; subtract 10 from dividend
	BTFSS	STATUS, C	; did an underflow occur?
	GOTO	Remainder_Restoration	; if so, then division loop is complete
	INCF	dig10, F	; increment 10s digit
	BTFSC	dig10, 3	; test if 10s has carry over (test 8 digit)
	GOTO	Subtract_Division_Loop
	BTFSC	dig10, 1	; (test 2 digit; 8+2 = 10)
	GOTO	Subtract_Division_Loop
	INCF	dig100, F	; increment the 100s digit from 10s carry over
	GOTO	Subtract_Division_Loop
Remainder_Restoration
	MOVLW	.10
	ADDWF	dig1, F
Display_Temperature
	MOVLW	0x5	; MAX7219 digit 0 address for degree sign
	MOVWF	SPI_tx1
	MOVLW	DEGREE_SIGN
	CALL	LED_Lookup_Table	; lookup A-DP code for semicolon
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x1	; MAX7219 digit 1 address for hundreds digit
	MOVWF	SPI_tx1
	MOVF	dig100, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x2	; MAX7219 digit 2 address for tens digit
	MOVWF	SPI_tx1
	MOVF	dig10, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x3	; MAX7219 digit 3 address for ones digit
	MOVWF	SPI_tx1
	MOVF	dig1, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x4	; MAX7219 digit 4 address for celsius C
	MOVWF	SPI_tx1
	MOVLW	CELSIUS
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	RETURN

; Loads time and temperature datapoints into time_L and Temp variables
Compatibility_Function
	BANKSEL	datapoint
	MOVF	datapoint, W	; get address of value to be displayed
	MOVWF	FSR		; get value
	MOVF	INDF, W		; store value in W	
	MOVWF	temp
	BTFSS	temp, 0		; test if datapoint is a time or Temp
	MOVWF	time_L		; if time, store in time_L
	BTFSC	temp, 0
	MOVWF	Temp		; if Temp, store in Temp
	BCF	booleans_reg, TT_BOOLEAN
	BTFSC	datapoint, 0
	BSF	booleans_reg, TT_BOOLEAN
	RETURN
 
Waste_Time	MACRO	s1, s2, s3
    	MOVLW	s1
	MOVWF	delay1
	MOVLW	s2
	MOVWF	delay2
	MOVLW	s3
	MOVWF	delay3
	DECFSZ	delay1, F
	GOTO	$-1
	DECFSZ	delay2, F
	GOTO	$-3
	DECFSZ	delay3, F
	GOTO	$-5
	ENDM

; void spi_2byte_transfer (SPI_tx1, SPI_tx2);
SPI_2byte_Transfer
	BANKSEL	0x0
	BCF	PORTA, SS	; pull MAX7219 slave select active low
	MOVF	SPI_tx1, W	; get the first byte to transmit
	MOVWF	SSPBUF		; start transmission
	BANKSEL	SSPSTAT
	BTFSS	SSPSTAT, BF	; has data been received (transmit complete?)
	GOTO	$-1
	BANKSEL	0x0		; location of SPI_tx1, 2, and SSPBUF
	MOVF	SPI_tx2, W
	MOVWF	SSPBUF		; start transmission
	BANKSEL	SSPSTAT
	BTFSS	SSPSTAT, BF	; wait for transmission completion
	GOTO	$-1
	BANKSEL	0x0		; return to bank 0...
	BSF	PORTA, SS	; rising edge on MAX7219 LOAD/SS line
	Waste_Time	.16, .1, .1
	RETURN

;________________________Begin Main Program_________________________;
    
Initialize_IO
	BANKSEL	TRISA
	MOVLW	(0<<SS) | (1<<T_K1) | (1<<T_K2) | (1<<T_REF) | (0<<HEAT) | (1<<ALARM)
	MOVWF	TRISA
	MOVLW	(1<<STOP) | (1<<LEFT) | (1<<UP) | (1<<DOWN) | (1<<RIGHT) | (1<<START)
	MOVWF	TRISB
	MOVLW	(0<<SCK) | (1<<SDI) | (0<<SDO)
	MOVWF	TRISC
	BANKSEL	WPUB
	MOVLW	(1<<LEFT) | (1<<RIGHT) | (1<<UP) | (1<<DOWN) | (1<<START) | (1<<STOP) | (0<<GRN_LED)
	MOVWF	WPUB	; enable weak pullups for pushbutton inputs
	BANKSEL	OPTION_REG
	BCF	OPTION_REG, NOT_RBPU	; enable global pullups
	BANKSEL	ANSEL
	CLRF	ANSEL
	BANKSEL	ANSELH
	CLRF	ANSELH

Blink_Red_Once
	BANKSEL	PORTB
	BSF	PORTB, RED_LED
	Waste_Time	.256, .256, .4
	BCF	PORTB, RED_LED
	Waste_Time	.256, .256, .4

Initialize_Data
	BANKSEL	datapoint
	MOVLW	0x20
	MOVWF	datapoint
	MOVWF	POSITION_RAM
	CLRF	POSITION_EE
	CLRF	time_L
	CLRF	time_H
	CLRF	Temp

Initialize_Interupt_Sources
	BANKSEL	PORTB
	MOVLW	1 << RB0
	ANDWF	PORTB, W	; save portB so it can be used to determine the
	BANKSEL	OPTION_REG	;   default state of the RB0 interupt
	BCF	OPTION_REG, INTEDG	; interupt on falling edge of RB0/INT pin
	BTFSC	STATUS, Z	; unless RB0 is already fallen, then
	BSF	OPTION_REG, INTEDG	; interupt on rising edge.
	BCF	INTCON, INTF	; clear external RB0 interupt flag
	BSF	INTCON, INTE	; enable external RB0 interupt
	BCF	INTCON, RBIE	; disable port B change interupts
	BANKSEL	PIE1
	CLRF	PIE1		; disable a whole bunch of interupts
	BANKSEL	PIE2
	CLRF	PIE2		; disable a whole bunch of interupts
	BSF	INTCON, GIE	; set global interupt enable

Initialzie_Fosc
	BANKSEL	OSCCON
	MOVLW	(B'110' << IRCF0) | (0<<OSTS) | (1<<SCS)
	MOVWF	OSCCON

Initialize_SPI
	BANKSEL	SSPCON
	MOVLW	B'0001'	; set SSPM<3:0> for Master Mode, Fosc/4
	MOVWF	SSPCON
	BSF	SSPCON, CKP	; set clock idle state to high level
	BANKSEL	SSPSTAT
	BSF	SSPSTAT, SMP	; input data sampled at end of data output time
	BSF	SSPSTAT, CKE	; data transmitted on rising edge of clock (rising edge for MAX7219)
	BANKSEL	SSPCON
	BSF	SSPCON, SSPEN	; enable Serial Peripheral Interface

Initialize_MAX7219
	; Leave Sleep Mode
	MOVLW	0xC		; MAX7219 shutdown address
	MOVWF	SPI_tx1
	MOVLW	0x1		; xxxx xxx1 for normal operation (xxxx xxx0 for shutdown)
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	; Leave Sleep Mode
	MOVLW	0xF		; MAX7219 display test address
	MOVWF	SPI_tx1
	MOVLW	0x0		; xxxx xxx0 for normal operation (xxxx xxx1 for test)
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	; Set scan limit to digits 0-4
	MOVLW	0xB		; MAX7219 scan limit address
	MOVWF	SPI_tx1
	MOVLW	0x4		; xxxx x100 for digits 0-4
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	; Set BCD Mode to No Decoding
	MOVLW	0x9		; MAX7219 shutdown address
	MOVWF	SPI_tx1
	MOVLW	0x0		; 0000 0000 for no decoding on any digit
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	; Set Intensity Level
	MOVLW	0xA		; MAX7219 intensity address
	MOVWF	SPI_tx1
	MOVLW	LED_INTENSITY	; the desired duty cycle, 0-15 are valid values
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
  
Initialize_ADC

Initialize_Timer0
	BANKSEL	OPTION_REG
	BCF	OPTION_REG, T0CS; select instruction clock Fosc/4
	BCF	OPTION_REG, PSA	; assign prescalar to Timer 0
	BCF	OPTION_REG, PS2	; Set PS<2:0> to 000, corresponding
	BCF	OPTION_REG, PS1	; to a prescalar of 2
	BCF	OPTION_REG, PS0
	BANKSEL	INTCON
	BCF	INTCON, T0IE	; disable the Timer0 interupt

EE_READ:
	BANKSEL	POSITION_RAM    
    MOVF	POSITION_RAM,w
    MOVWF	FSR
    MOVF	POSITION_EE,w	    ;EEPROM ADDRESS
    BANKSEL	EEADR		    ;TO READ
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,RD	    ;EE READ, NOT WRITE
    BANKSEL	EEDAT
    MOVF	EEDAT,w		    ;MOVE DATA AT DESIGNATED EE ADDR TO W
    MOVWF	INDF		    ;MOVE W TO VARIABLE IN RAM
    BANKSEL	POSITION_RAM
    INCF	POSITION_RAM,F
    INCF	POSITION_EE,F
    BTFSS	POSITION_EE,4	    ;REPEAT 15 TIMES, FOR 15 VAR
    GOTO	EE_READ

Set_Point_Programming
	CALL	Compatibility_Function
	CALL	Update_LED_Display
	Waste_Time	.256, .256, .2
Input_Loop

	BANKSEL	TIME_DATA
	CLRF	TIME_DATA
	BANKSEL	TEMP_DATA
	CLRF	TEMP_DATA
	CLRF	TEMP_DATA + MAX_DATA_SIZE

	BANKSEL	PORTA
	BTFSC	PORTB, UP		    ;UP PB
	GOTO	UpCheck
    
	BTFSC	PORTB, DOWN		    ;DOWN PB
	GOTO	DownCheck
    
	BTFSC	PORTB, LEFT		    ;LEFT PB
	GOTO	LeftCheck

	BTFSC	PORTB, RIGHT		    ;RIGHT PB
	GOTO	RightCheck
    
	BTFSC	booleans_reg, START_BOOLEAN
	GOTO	Start_Active_Low
Start_Active_High
	BTFSC	PORTB, START
	GOTO	Start
	GOTO	Input_Loop
Start_Active_Low
	BTFSS	PORTB, START		    ;START PB
    	GOTO	Start
	GOTO	Input_Loop
   
UpCheck:
				    ;ARE YOU TRYING TO ADJUST 
				;1ST, 2ND, & 16TH DATAPOINTS?
    BCF		STATUS,Z	    ;IF SO, STOP IT.
    MOVLW	0X20		     
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    BCF		STATUS,Z
    MOVLW	0X21
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    BCF		STATUS,Z
    MOVLW	0X2F
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.

;    BTFSC	datapoint,0	    ;ARE YOU ON A TIME INPUT?
;    GOTO	ImplementUp		    
;
;TimeCheckA:   
;    BCF		STATUS,C
;    BCF		STATUS,Z
;    MOVLW	0XFF
;    MOVWF	temp
;    MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT DATAPOINT INTO IND ADDR 
;    MOVWF	FSR
;    MOVF	INDF,w
;    SUBWF	temp,w
;    BTFSS	STATUS,Z
;    GOTO	ImplementUp
;
;    MOVLW	.2		       
;    SUBWF	datapoint,w	    ;W HAS ADDR OF LAST TIME ENTRY
;    MOVWF	FSR		    ;MOVE ADDR OF LAST TIME ENTRY INTO IND ADDR
;    MOVF	INDF,w		    ;LastTime HAS VALUE OF LAST TIME ENTRY
;    MOVWF	LastTime
;    MOVF	datapoint,w
;    MOVWF	FSR
;    MOVF	LastTime,w
;    MOVWF	INDF
;    CALL	Write_Datapoint_to_LEDs
;    GOTO	Input
;       
;ImplementUp:	    
    MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT DATAPOINT INTO IND ADDR 
    MOVWF	FSR
    INCF	INDF,F		    ;INCREMENT VALUE AT CURRENT DATAPOINT ADDR
    GOTO	Set_Point_Programming
    
DownCheck:			    ;ARE YOU TRYING TO ADJUST 
				    ;1ST, 2ND, & 16TH DATAPOINTS?
    BCF		STATUS,Z	    ;IF SO, STOP IT.
    MOVLW	0X20		     
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    BCF		STATUS,Z
    MOVLW	0X21
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    BCF		STATUS,Z
    MOVLW	0X2F
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input_Loop
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
    
    BTFSC	datapoint,0	    ;ARE YOU ON A TIME INPUT?
    GOTO	ImplementDown	    ;IF NOT, HURRY UP AND GET IMPLEMENTED
        
TimeCheck:    
    BCF		STATUS,C
    BCF		STATUS,Z
    MOVLW	.2		       
    SUBWF	datapoint,w	    ;W HAS ADDR OF LAST TIME ENTRY
    MOVWF	FSR		    ;MOVE ADDR OF LAST TIME ENTRY INTO IND ADDR
    MOVF	INDF,w		    ;LastTime HAS VALUE OF LAST TIME ENTRY
    MOVWF	LastTime
    MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT TIME ENTRY INTO IND ADDR
    MOVWF	FSR
    MOVF	INDF,w		    ;W HAS VALUE OF CURRENT TIME ENTRY
    SUBWF	LastTime,w	    ;COMPARE TIMES
    BTFSS	STATUS,C	    ;IF CURRENT TIME < LAST TIME
    BTFSC	STATUS,Z	    ;OR IF CURRENT TIME = LAST TIME 
    GOTO	Input_Loop	    ;DON'T ADJUST TIME
    
ImplementDown:
    MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT DATAPOINT INTO IND ADDR 
    MOVWF	FSR
    DECF	INDF,F		    ;DECREMENT VALUE AT CURRENT DATAPOINT ADDR
	GOTO	Set_Point_Programming
    
LeftCheck:			    ;ARE YOU TRYING TO MOVE
				    ;BEFORE THE 1ST DATAPOINT?
    BCF		STATUS,Z	    ;WHAT ARE YOU? A TIME-TRAVELLER?
    MOVLW	0X20		    
    SUBWF	datapoint,w	    
    BTFSC	STATUS,Z
    GOTO	Input_Loop	    ;YOU CAN'T SAVE THE DINOSAURS. STOP IT.
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
	    
    DECF	datapoint,F
	GOTO	Set_Point_Programming
    
RightCheck:			    ;ARE YOU TRYING TO MOVE
				    ;PAST THE 16TH DATAPOINT?
    BCF		STATUS,Z	    ;ANOTHER TIME-TRAVELLER, HUH?
    MOVLW	0X2F		    
    SUBWF	datapoint,w	    
    BTFSC	STATUS,Z
    GOTO	Input_Loop	    ;GET OUTTA HERE, MARTY MCFLY. STOP IT.
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
	    
    INCF	datapoint,F
	GOTO	Set_Point_Programming
    
Start:				    ;WRITE ALL POINTS TO EEPROM
    MOVLW	0X20
    BANKSEL	POSITION_RAM
    MOVWF	POSITION_RAM
    CLRF	POSITION_EE
EE_WRITE: 
    MOVF	POSITION_RAM,w
    MOVWF	FSR
    MOVF	POSITION_EE,w    
    
    BANKSEL	EEADR
    MOVWF	EEADR		    ;EEPROM ADDRESS
    MOVF	INDF,w		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	0X55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	0XAA		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    BANKSEL	delay1
    CLRF	delay1
    CLRF	delay2
DELAY:				    ;WAIT FOR WRITING TO FINISH
    DECFSZ	delay1
    GOTO	DELAY
    DECFSZ	delay2
    GOTO	DELAY
    BANKSEL	EECON1
    BCF		EECON1,WREN	    ;DISABLE WRITES
    
    BANKSEL	POSITION_EE
    INCF	POSITION_RAM,F
    INCF	POSITION_EE,F
    BTFSS	POSITION_EE,4	    ;REPEAT 15 TIMES, FOR 15 VAR
    GOTO	EE_WRITE	
   
	BANKSEL	TRISA
	BCF	TRISA, ALARM

Control_Loop
	
	BANKSEL	TMR0
	MOVLW	(.256 - TMR0_PERIOD)	; (because TMR0 increments until it overflows)
	MOVWF	TMR0			; Start timing
	BCF	INTCON, T0IF		; and Clear the Timer Interupt Flag

	BANKSEL	time_counter_L		; Reset the Counter for Timer Overflows
	CLRF	time_counter_L
	MOVLW	TIME_COUNTER_SET_VALUE
	MOVWF	time_counter_H	

Time_Counting_Loop
	BTFSS	INTCON, T0IF	; Test for Timer Overflow (note INTCON is in all banks)
	GOTO	$-1
	BCF	INTCON, T0IF
	BANKSEL	TMR0
	MOVLW	(.255 - TMR0_PERIOD)	; Reset TMR0
	MOVWF	TMR0
	BANKSEL	0		; Toggle Alarm (note bank 0 for digital I/O and time_counter)
	MOVLW	(1 << ALARM)
	XORWF	PORTA, F
	DECFSZ	time_counter_L	; Decrement (time_counter--) and test for zero
	GOTO	Time_Counting_Loop
	DECFSZ	time_counter_H
	GOTO	Time_Counting_Loop

	MOVLW	(1 << GRN_LED)
	XORWF	PORTB, F

	GOTO	Control_Loop
	


    end
