;CTCSS Generator for VHF radios
;Author: Chetan Bhargava <KG6NFG>
;Assembler: AVR Studio 4.11.406
;Date: 02/23/05
;Notes:
;Initially we will be trying to generate a 100 Hz CTCSS tone
;We will use ATTiny11-6PC with 32768Hz Xtal
;Pin 5 (PB0) will be tone output

;License:
;This work is licensed under the Creative Commons 
;Attribution-NonCommercial-ShareAlike 4.0 International License.
;To view a copy of this license, 
;visit http://creativecommons.org/licenses/by-nc-sa/4.0/.


;PB0 Tone Output
;PB1 (pin6), PB2 (pin7) Input for tone selection


.include "../includes/tn11def.inc"

.equ	tone 	= 0		;Tone Output
.equ	tone1_val=  $6A	;Tone value that determines the tone frequency
.equ	tone2_val=	$8A
.equ	tone3_val=	$32

;Frequency		Cycles		
;100Hz=$6A 
;77Hz=$8A
;210.7Hz=$32
;
;
.def Temp 		= R16

.ORG $0000


init:
	;set the PORTB direction
	ldi temp, 0b11001		; PB0=Out, PB1, PB2 = Input
	out DDRB, temp			;

	sbi	PORTB,1				; Activate pullup on PORTB.1
	sbi PORTB,2				; Activate pullup on PORTB.2

	in	temp, PINB

	andi temp, 0b00000110	; just to be sure, we have to consider the two pins and ignore rest
	ror	temp				; rotated temp so it is easy to make decision


Check_Pins:					; We shall check the jumpers and select the tone

	cpi temp, 0x00			;if temp=0 then jump tone4
	breq tone4

	cpi temp, 0x01			;if temp=1 then jump tone2
	breq tone2

	cpi temp, 0x02			;if temp=2 then jump tone3
	breq tone3

	cpi temp, 0x03			;if temp=3 then jump tone1
	breq tone1

	rjmp init				;else jump to init (this should not happen)



Tone1:				;start generating the first tone
	cbi PORTB, tone			
	rcall delay1
	sbi PORTB, tone
	rcall delay1
	rjmp Tone1		; repeat until reset


Tone2:				;start generating the second tone
	cbi PORTB, tone			
	rcall delay2
	sbi PORTB, tone
	rcall delay2
	rjmp Tone2		; repeat until reset
	

Tone3:				;start generating the third tone
	cbi PORTB, tone			
	rcall delay3
	sbi PORTB, tone
	rcall delay3
	rjmp Tone3		; repeat until reset


Tone4:				;start generating the fourth tone
	cbi PORTB, tone			
	rcall delay4
	sbi PORTB, tone
	rcall delay4
	rjmp Tone4		; repeat until reset

;**************
;Delay routines
;**************


Delay1:				;used by tone1
; ============================= 
;    delay loop generator 
;     327 cycles: 100Hz
;		328 can also be tried 
;		to achieve accuracy
; ----------------------------- 
; delaying 327 cycles:
          ldi  R17, $6D
WGLOOP1:  dec  R17
          brne WGLOOP1
; ============================= 
		;nop		;fine tune
ret







Delay2:				;used by tone2
; ============================= 
;    delay loop generator 
;     425 cycles:  77Hz
;		426 can also be tried
; ----------------------------- 
; delaying 423 cycles:
          ldi  R17, $8D
WGLOOP2:  dec  R17
          brne WGLOOP2
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
		  ;nop		;can be tried
; ============================= 
ret


Delay3:				;used by tone3
; ============================= 
;    delay loop generator 
;     155 cycles: 210.7 Hz
;		156 can also be tried
; ----------------------------- 
; delaying 153 cycles:
          ldi  R17, $33
WGLOOP3:  dec  R17
          brne WGLOOP3
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
		  ;nop		can be tried
; ============================= 
ret


Delay4:				;Audible test tone
	nop
	nop
	nop
	nop
ret
