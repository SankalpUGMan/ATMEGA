;Program to switch off an LED when a pushbutton is pressed
;Push button switch connected to PB0
;LED connected to PD0

 #include "m8def.inc"
 .CSEG
 LDI R16,0x00   ;  make PORT B as input by writing 0. For inputting, we write 0x00.
 OUT DDRB,R16   ; 0x00 to DDRB - Data Directon Register B
 LDI R16,0x01   ; Configure PD0 as output by writing 1 to 
 OUT DDRD,R16   ; the corresponding bit in DDRD. We can always choose between other pd's using binary to hexadecimal conversion.
 LDI R16,0x01   ; Switch on the LED initially
 OUT PORTD,R16  
 back:  IN R16,PINB ; PINB is the input register corresponding to PORT B
                 ; Read PINB  value 
 OUT PORTD,R16      ; and simply output it to LED
 rjmp back          ; check the pushbutton status continuously

 /* Now, things are more clear. Giving 1 or 0 to DDR stuffs 'ons or offs' the ports as well. Those ports have PD's which can be turned on with proper address.Ports have pINb's as well. Ports are 0's implies that the pinb's are 1. When pressed, they become 0.


