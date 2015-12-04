; Blink LED Connected to PORTD 0

#include <p16f883.inc>
	__CONFIG	_CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG	_CONFIG2, _WRT_OFF & _BOR21V

#define	SS	RA5
#define	SCK	RC3
#define	SDI	RC4
#define SDO	RC5
#define	LED_INTENSITY	.8	; Light Intensity from 0-15

; Digits 0-9 have lookup indices 0-9, but :, deg, and C
#define	SEMICOLON	.10	
#define	DEGREE_SIGN	.11
#define	CELSIUS	.12


	cblock	0x20
		SPI_tx1	; first byte to be transfered out by SPI
		SPI_tx2	; second byte to be transfered out by SPI
	endc

Reset_Vector
	ORG 	0x0
	GOTO Initialize_IO

Interupt_Vector
	ORG	0x4

;________________________Function Definitions_______________________;

; W LED_lookup_table (W); // warning: undefined behavior if W > 12
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

; void spi_2byte_transfer (SPI_tx1, SPI_tx2);
SPI_2byte_Transfer
	BANKSEL	0x0
	BCF	PORTA, SS	; pull MAX7219 slave select active low
	CLRW			
	SUBLW	0x1		; add a delay
	BTFSS	STATUS, Z
	GOTO	$-2
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

Initialize_IO
	BANKSEL	PORTA
	CLRF	PORTA
	CLRF	PORTB
	CLRF	PORTC
	BANKSEL	TRISA
	MOVLW	(0<<SS)
	MOVWF	TRISA
	MOVLW	(0<<SCK) | (1<<SDI) | (0<<SDO)
	MOVWF	TRISC

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

	MOVLW	0x1		; MAX7219 intensity address
	MOVWF	SPI_tx1
	MOVLW	DEGREE_SIGN
	CALL	LED_Lookup_Table
	MOVWF	SPI_tx2
	CALL	SPI_2byte_Transfer


	END
