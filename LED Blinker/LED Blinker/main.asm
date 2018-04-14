;LED BLINK program using subroutines for delay
; In AVR, destination is on left and source on the right
  #include "m8def.inc" //m8 for atmega 8
  .CSEG
     LDI R16,LOW(RAMEND) ; Initialsing the stack pointer to the last address of RAM
	 OUT SPL,R16       ; R16 is a timepass register
	 LDI R16, HIGH(RAMEND)
	 OUT SPH,R16
     LDI  R16,0xFF      
	 OUT DDRD,R16     //port d selected
     again: LDI R16,0x01     
            OUT PORTD,R16    ; Switch on the LED connected to PD0. UNDERSTAND THE MEANING OF 0
            RCALL delay	      ; Call the delay subroutine
	        LDI R16,0x00      ; Switch off the LED by writing 0 to PD0
            OUT PORTD,R16
            RCALL delay        ; Call the delay subroutine
            rjmp again        ; blink continously

; DELAY subroutine

delay: PUSH R16           ; save R16 as it is being used in the subroutine. PUSH causes post decremention
	   LDI R16,0xFF       
  xyz: LDI R17,0xFF       
  abc: DEC R17
	   BRNE abc
	   DEC R16
	   BRNE xyz
	   POP R16            ; put back the value of R16 from stack. POP causes pre-incremention
	   RET                ; return to calling program


/*	   The DDRx Register

The DDRD register sets the direction of Port D. Each bit of the DDRD register sets the corresponding Port D pin to be either an input or an output. A 1 makes the corresponding pin an output, and a 0 makes the corresponding pin an input. To set the first pin of Port D to be an output pin, you could use the sbi(reg,bit) function, which sets a bit (makes it high or binary 1) in a register:
sbi(DDRD, 0);   //these two statements are equivalent
sbi(DDRD, PD0); //both set the first pin of port D to be an output
                //by setting the 0 bit of the DDRD register.
To set the second pin to be an input, you could use the cbi(reg,bit) function which clears a bit (makes it low or binary 0) in a register:
cbi(DDRD, 1);   //these two statements are equivalent
cbi(DDRD, PD1); //both set the second pin of port D to be an output
                //by setting the 1 bit of the DDRD register.
Note that in C, the bit indexing begins with 0. The bits in a register go from 0 to 7. This may be a source of confusion, because when we talk about the "first pin" or "pin 1" of a port, we are referring to the 0 bit or P0 in C. The AVRmini boards label the first pin as pin 1.
You can also set the value of all the bits in the DDRx register (or any register) using the outb(reg,byte) command. It writes a byte (8 bits) to a register. For example, if you wanted to set pins 1-4 of port B to output and pins 5-8 to input, you could use:
outb(DDRB, 0x0F); //Set the low 4 pins of Port B to output
                  //and the high 4 pins to input
				  */