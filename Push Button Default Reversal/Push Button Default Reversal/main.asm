;Program to switch off an LED when a pushbutton is pressed
;Push button switch connected to PC0
;LED connected to PD0

 #include "m8def.inc"
 .CSEG
 LDI R16,0x00   ;  make PORT C as input by writing  
 OUT DDRC,R16   ; 0x00 to DDRC - Data Directon Register C
 LDI R16,0x08   ; Configure PD3 as output by writing 1 to 
 OUT DDRD,R16   ; the corresponding bit in DDRD
 LDI R16,0x01   ; Switch on the LED initially
 OUT PORTD,R16  
 back:  IN R16,PINC ; PINC is the input register corresponding to PORT C
                  ; Read P
 COM R16  //complement function
 OUT PORTD, R16      ; and simply output it to LED
 rjmp back          ; check the pushbutton status continuously

 ; Normally, pressing the push button turns the light on. So taking its complement will turn it into something that will make it off.

