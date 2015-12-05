#include <p16f883.inc>
	__CONFIG	_CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG	_CONFIG2, _WRT_OFF & _BOR21V

#define DEBUG_LED	RC6
#define	SS	RA5
#define	SCK	RC3
#define	SDI	RC4
#define SDO	RC5
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
		Temp
		datapoint
		LastTime
		SPI_tx1	; first byte to be transfered out by SPI
		SPI_tx2	; second byte to be transfered out by SPI
		dividend	; used for division for LED display
		tens_Dig	; "                               "
		hundreds_Dig	; "                               "
	endc
   
Reset_Vector
	ORG 	0x0
	GOTO Initialize_RAM_Data

Interupt_Vector
	ORG	0x4

;________________________Function Definitions_______________________;

; W LED_lookup_table (W); // warning: undefined behavior if W > 13
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

; void write_datapoint_to_LEDs (*datapoint);
Write_Datapoint_to_LEDs
	MOVF	datapoint, W	; get address of value to be displayed
	MOVWF	FSR		; get value
	MOVF	INDF, W		; store value in W
	MOVWF	dividend
	CLRF	tens_Dig
	CLRF	hundreds_Dig
Hundreds_Loop
	MOVLW	.100
	SUBWF	dividend, 1
	BTFSC	STATUS, C
	INCF	hundreds_Dig, F
	BTFSC	STATUS, C
	GOTO	Hundreds_Loop
	MOVLW	.100
	ADDWF	dividend, 1
Tens_Loop
	MOVLW	.10
	SUBWF	dividend, F
	BTFSC	STATUS, C
	INCF	tens_Dig, F
	BTFSC	STATUS, C
	GOTO	Tens_Loop
	MOVLW	.10
	ADDWF	dividend, F
Test_Temp_or_Time
	BTFSC	datapoint, 0
	GOTO	Display_Temperature
Display_Time
	MOVLW	0x1	; MAX7219 digit 0 address for semicolon
	MOVWF	SPI_tx1
	MOVLW	SEMICOLON
	CALL	LED_Lookup_Table	; lookup A-DP code for semicolon
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x2	; MAX7219 digit 1 address for thousandths digit
	MOVWF	SPI_tx1
	MOVLW	ALL_OFF
	CALL	LED_Lookup_Table	; lookup A-DP code for 0
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x3	; MAX7219 digit 2 address for hundreds digit
	MOVWF	SPI_tx1
	MOVF	hundreds_Dig, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x4	; MAX7219 digit 3 address for tens digit
	MOVWF	SPI_tx1
	MOVF	tens_Dig, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x5	; MAX7219 digit 4 address for ones digit
	MOVWF	SPI_tx1
	MOVF	dividend, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	RETURN
Display_Temperature
	MOVLW	0x1	; MAX7219 digit 0 address for degree sign
	MOVWF	SPI_tx1
	MOVLW	DEGREE_SIGN
	CALL	LED_Lookup_Table	; lookup A-DP code for semicolon
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x2	; MAX7219 digit 1 address for hundreds digit
	MOVWF	SPI_tx1
	MOVF	hundreds_Dig, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer
	MOVLW	0x3	; MAX7219 digit 2 address for tens digit
	MOVWF	SPI_tx1
	MOVF	tens_Dig, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x4	; MAX7219 digit 3 address for ones digit
	MOVWF	SPI_tx1
	MOVF	dividend, W
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	MOVLW	0x5	; MAX7219 digit 4 address for celsius C
	MOVWF	SPI_tx1
	MOVF	CELSIUS
	CALL	LED_Lookup_Table	; lookup appropriate A-DP code
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer	; send data through SPI
	RETURN

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
	RETURN

;________________________Begin Main Program_________________________;
    
Initialize_RAM_Data
	BANKSEL	PORTA
	CLRF	PORTA
	CLRF	PORTB
	CLRF	PORTC
Initialize_IO
	BANKSEL	TRISA
	MOVLW	(0<<SS) | (1<<RA0) | (1<<RA1) | (1<<RA2) | (1<<RA3) | (1<<RA4)
	MOVWF	TRISA
	MOVLW	(1<<RB0)
	MOVWF	TRISB
	MOVLW	(0<<SCK) | (1<<SDI) | (0<<SDO) | (0<<DEBUG_LED)
	MOVWF	TRISC
	MOVLW	0X20
	MOVWF	datapoint
	CLRF	time_L
	CLRF	Temp

Initialize_SPI
	BANKSEL	SSPCON
	MOVLW	B'0001'	; set SSPM<3:0> for Master Mode, Fosc/64
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
  
	MOVLW	.120
	MOVWF	0x20
	CALL	Write_Datapoint_to_LEDs
	END 
 
    BANKSEL	EEADR
    MOVLW	.0		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,RD	    ;EE READ, NOT WRITE
    BANKSEL	EEDAT		    
    MOVF	EEDAT,w		    ;MOVE DATA AT DESIGNATED EE ADDR TO W
    BANKSEL	t0
    MOVWF	t0		    ;MOVE W TO VARIABLE IN RAM
				    ;REPEAT 15 TIMES, FOR 15 VAR
    BANKSEL	EEADR
    MOVLW	.1
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T0
    MOVWF	T0
    
    BANKSEL	EEADR
    MOVLW	.2
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t1
    MOVWF	t1
    
    BANKSEL	EEADR
    MOVLW	.3
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T1
    MOVWF	T1
    
    BANKSEL	EEADR
    MOVLW	.4
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t2
    MOVWF	t2
    
    BANKSEL	EEADR
    MOVLW	.5
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T2
    MOVWF	T2
    
    BANKSEL	EEADR
    MOVLW	.6
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t3
    MOVWF	t3
    
    BANKSEL	EEADR
    MOVLW	.7
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T3
    MOVWF	T3
    
    BANKSEL	EEADR
    MOVLW	.8
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t4
    MOVWF	t4
    
    BANKSEL	EEADR
    MOVLW	.9
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T4
    MOVWF	T4
    
    BANKSEL	EEADR
    MOVLW	.10
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t5
    MOVWF	t5
    
    BANKSEL	EEADR
    MOVLW	.11
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T5
    MOVWF	T5
    
    BANKSEL	EEADR
    MOVLW	.12
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t6
    MOVWF	t6
    
    BANKSEL	EEADR
    MOVLW	.13
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T6
    MOVWF	T6
    
    BANKSEL	EEADR
    MOVLW	.14
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	t7
    MOVWF	t7
    
    BANKSEL	EEADR
    MOVLW	.15
    MOVWF	EEADR
    BANKSEL	EECON1
    BCF		EECON1,EEPGD
    BSF		EECON1,RD
    BANKSEL	EEDAT
    MOVF	EEDAT,w
    BANKSEL	T7
    MOVWF	T7
      
Input:
    BTFSS	PORTA,2		    ;UP PB
    GOTO	UpCheck
    
    BTFSC	PORTA,3		    ;DOWN PB
    GOTO	DownCheck
    
    BTFSC	PORTA,0		    ;LEFT PB
    GOTO	LeftCheck

    BTFSC	PORTA,1		    ;RIGHT PB
    GOTO	RightCheck
    
    BTFSC	PORTA,5		    ;START PB
    GOTO	Start
    
UpCheck:			    ;ARE YOU TRYING TO ADJUST 
    CALL	WASTETIME	    ;1ST, 2ND, & 16TH DATAPOINTS?
    BCF		STATUS,Z	    ;IF SO, STOP IT.
    MOVLW	0X20		     
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input
    BCF		STATUS,Z
    MOVLW	0X21
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input	
    BCF		STATUS,Z
    MOVLW	0X2F
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
	    
	MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT DATAPOINT INTO IND ADDR 
	MOVWF	FSR
	INCF	INDF		    ;INCREMENT VALUE AT CURRENT DATAPOINT ADDR
	CALL	Write_datapoint_to_LEDs
	GOTO	Input		    ;RETURN TO INPUT
    
DownCheck:			    ;ARE YOU TRYING TO ADJUST 
    CALL	WASTETIME	    ;1ST, 2ND, & 16TH DATAPOINTS?
    BCF		STATUS,Z	    ;IF SO, STOP IT.
    MOVLW	0X20		     
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input
    BCF		STATUS,Z
    MOVLW	0X21
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input	
    BCF		STATUS,Z
    MOVLW	0X2F
    SUBWF	datapoint,w
    BTFSC	STATUS,Z
    GOTO	Input
    
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
    GOTO	Input		    ;DON'T ADJUST TIME
    
ImplementDown:
    MOVF	datapoint,w	    ;MOVE ADDR OF CURRENT DATAPOINT INTO IND ADDR 
    MOVWF	FSR
    DECF	INDF		    ;DECREMENT VALUE AT CURRENT DATAPOINT ADDR
	CALL	Write_datapoint_to_LEDs
	GOTO	Input		    ;RETURN TO INPUT
    
LeftCheck:			    ;ARE YOU TRYING TO MOVE
    CALL	WASTETIME	    ;BEFORE THE 1ST DATAPOINT?
    BCF		STATUS,Z	    ;WHAT ARE YOU? A TIME-TRAVELLER?
    MOVLW	.0		    
    SUBWF	datapoint,w	    
    BTFSC	STATUS,Z
    GOTO	Input		    ;YOU CAN'T SAVE THE DINOSAURS. STOP IT.
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
	    
	DECF	datapoint
	CALL	Write_datapoint_to_LEDs
	GOTO	Input
    
RightCheck:			    ;ARE YOU TRYING TO MOVE
    CALL	WASTETIME	    ;PAST THE 16TH DATAPOINT?
    BCF		STATUS,Z	    ;ANOTHER TIME-TRAVELLER, HUH?
    MOVLW	.15		    
    SUBWF	datapoint,w	    
    BTFSC	STATUS,Z
    GOTO	Input		    ;GET OUTTA HERE, MARTY MCFLY. STOP IT.
    
    	    ;YOU FOLLOWED THE RULES. GOOD WORK.
	    
    INCF	datapoint
	CALL	Write_datapoint_to_LEDs
    GOTO	Input
    
Start:				    ;WRITE ALL POINTS TO EEPROM
    CALL	WASTETIME
				    
    MOVF	t0,w
    BANKSEL	EEADR
    MOVLW	.0		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t0
    				    ;REPEAT 15 TIMES, FOR 15 VAR
    MOVF	T0,w
    BANKSEL	EEADR
    MOVLW	.1		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T0
    
    MOVF	t1,w
    BANKSEL	EEADR
    MOVLW	.2		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t1
    
    MOVF	T1,w
    BANKSEL	EEADR
    MOVLW	.3		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T1
    
    MOVF	t2,w
    BANKSEL	EEADR
    MOVLW	.4		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t2
    
    MOVF	T2,w
    BANKSEL	EEADR
    MOVLW	.5		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T2
    
    MOVF	t3,w
    BANKSEL	EEADR
    MOVLW	.6		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t3
    
    MOVF	T3,w
    BANKSEL	EEADR
    MOVLW	.7		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T3
    
    MOVF	t4,w
    BANKSEL	EEADR
    MOVLW	.8		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t4
    
    MOVF	T4,w
    BANKSEL	EEADR
    MOVLW	.9		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T4
    
    MOVF	t5,w
    BANKSEL	EEADR
    MOVLW	.10		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t5
    
    MOVF	T5,w
    BANKSEL	EEADR
    MOVLW	.11		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T5
    
    MOVF	t6,w
    BANKSEL	EEADR
    MOVLW	.12		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t6
    
    MOVF	T6,w
    BANKSEL	EEADR
    MOVLW	.13		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T6
    
    MOVF	t7,w
    BANKSEL	EEADR
    MOVLW	.14		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	t7
    
    MOVF	T7,w
    BANKSEL	EEADR
    MOVLW	.15		    ;EEPROM ADDRESS
    MOVWF	EEADR		    ;TO READ
    MOVWF	EEDAT
    BANKSEL	EECON1		    
    BCF		EECON1,EEPGD	    ;POINT TO DATA MEMORY, NOT PROGRAM MEMORY
    BSF		EECON1,WREN	    ;ENABLE WRITE
    BCF		INTCON,GIE	    ;DISABLE INT
    BTFSC	INTCON,GIE	    ;SEE AN576
    GOTO	$-2
    MOVLW	.55		    ;!!!!!!REQUIRED SEQUENCE!!!!!!
    MOVWF	EECON2		    ;NO IDEA WHAT IS HAPPENING
    MOVLW	.170		    ;EECON2 ISN'T EVEN REAL
    MOVWF	EECON2		    ;THIS IS BS 
    BSF		EECON1,WR	    ;SET WR BIT TO BEGIN WRITE
    BSF		INTCON,GIE	    ;ENABLE INT
    SLEEP			    ;WAIT FOR INT TO SIGNAL WRITE COMPLETE
    BCF		EECON1,WREN	    ;DISABLE WRITES
    BANKSEL	T7    
    
    ;GOTO	LED_Loop

WASTETIME:
    NOP
    RETURN

end
