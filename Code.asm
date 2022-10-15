;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;
;-------------------------------------------------------------------------------
main:	bic.b   #0FFh,&P1SEL			;Make P1.X Digital I/O
		bic.b   #0FFh,&P1SEL2	    	;Make P1.X Digital I/O
		bic.b   #0FFh,&P2SEL	    	;Make P2.X Digital I/O
		bic.b   #0FFh,&P2SEL2	    	;Make P2.X Digital I/O
		bis.b   #0FFh,&P1DIR    	;Make P1.X Output
		bic.b   #0FFh,&P1OUT     	;Clear P1.X Output
		bis.b   #0FFh,&P2DIR     	;Make P2.X Output
		bic.b   #0FFh,&P2OUT     	;Clear P2.X Output
		mov.b   #0,R4			;Set R4 regiter set to 0. R4 register is counter
		call    #Delay		        ;Call the Delay subroutine

Onedigits:
		call 	#Twodigits		;Call the Twodigits subroutine
		mov.b   #03Fh,&P1OUT	    	;Pins to be open in base 16 for 0
		call    #Delay          	;Call the Delay subroutine
		mov.b   #006h,&P1OUT	    	;Pins to be open in base 16 for 1
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #05Bh,&P1OUT    	;Pins to be open in base 16 for 2
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #04Fh,&P1OUT    	;Pins to be open in base 16 for 3
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #066h,&P1OUT    	;Pins to be open in base 16 for 4
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #06Dh,&P1OUT		;Pins to be open in base 16 for 5
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #0FDh,&P1OUT		;Pins to be open in base 16 for 6
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #007h,&P1OUT		;Pins to be open in base 16 for 7
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #07Fh,&P1OUT		;Pins to be open in base 16 for 8
        	call    #Delay			;Call the Delay subroutine
        	mov.b   #06Fh,&P1OUT		;Pins to be open in base 16 for 9
        	call    #Delay			;Call the Delay subroutine
        	;call   #Exit			;Call the Exit subroutine
        	jmp     Onedigits		;Jump to  Onedigits
Twodigits:
            	cmp.b 	#0,R4			;Compare R4 with 0
            	jeq 	zerowrite		;If R4=0 then goto zerowrite label
            	cmp.b 	#1,R4			;Compare R4 with 1
            	jeq 	onewrite		;If R4=1 then goto onewrite label
            	cmp.b 	#2,R4			;Compare R4 with 2
            	jeq 	twowrite		;If R4=2 then goto twowrite label
            	cmp.b 	#3,R4			;Compare R4 with 3
            	jeq 	threewrite		;If R4=3 then goto threewrite label
            	cmp.b 	#4,R4			;Compare R4 with 4
            	jeq 	fourwrite		;If R4=4 then goto fourwrite label
            	cmp.b 	#5,R4			;Compare R4 with 5
            	jeq 	fivewrite		;If R4=5 then goto fivewrite label
            	cmp.b 	#6,R4			;Compare R4 with 6
            	jeq 	sixwrite		;If R4=6 then goto sixwrite label
            	cmp.b 	#7,R4			;Compare R4 with 7
            	jeq 	sevenwrite		;If R4=7 then goto sevenwrite label
            	cmp.b 	#8,R4			;Compare R4 with 8
            	jeq 	eightwrite		;If R4=8 then goto eightwrite label
            	cmp.b 	#9,R4			;Compare R4 with 9
            	jeq 	ninewrite		;If R4=9 then goto ninewrite label

zerowrite:  
            	mov.b   #03Fh,&P2OUT		;Pins to be open in base 16 for 0
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
onewrite:
            	mov.b   #006h,&P2OUT		;Pins to be open in base 16 for 1
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
twowrite:
            	mov.b   #05Bh,&P2OUT		;Pins to be open in base 16 for 2
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
threewrite:
            	mov.b   #04Fh,&P2OUT		;Pins to be open in base 16 for 3
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
fourwrite:
            	mov.b   #066h,&P2OUT		;Pins to be open in base 16 for 4
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
fivewrite:
            	mov.b   #06Dh,&P2OUT		;Pins to be open in base 16 for 5
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
sixwrite:
            	mov.b   #0FDh,&P2OUT		;Pins to be open in base 16 for 6
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
sevenwrite:
            	mov.b   #007h,&P2OUT		;Pins to be open in base 16 for 7
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
eightwrite:
            	mov.b   #07Fh,&P2OUT		;Pins to be open in base 16 for 8
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
ninewrite:
            	mov.b   #06Fh,&P2OUT		;Pins to be open in base 16 for 9
            	add.b   #1,R4			;Increasing the value of register R4 by 1
            	jmp 	onexit			;Jump to onexit label
onexit:
            	cmp.b 	#10,R4			;Compare R4 with 10
            	jeq 	ResetR4			;If R4=10 then goto ResetR4 label
            	ret				;Return to caller
ResetR4:    	mov.b	#0,R4			;Set R4 regiter set to 0
            	ret				;Return to caller

Delay:      	mov.w	#0xFFFFFFFF, R5		;Set R5 regiter set to 0xFFFFFFFF
Dloop:	     	sub.w	#1, R5			;Register R5 decreased by 1
            	jne	Dloop			;If Z is not equal to 0 jump to Dloop
            	ret				;Return to caller

Exit:	     	bic.b   #0FFh,&P1OUT       	;Clear P1.X Output
            	bic.b   #0FFh,&P2OUT      	;Clear P2.X Output
            	nop				;End of program

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
