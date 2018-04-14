 ;avr program to switch on an LED 
 ; LED connected to PORTD 0

 #include "m8def.inc"
 .CSEG
 LDI R16,0x01 ;  PIN 0 of PORTD should be output, so write 1 to BIT 0.  0x00 wil make DDRD as input register.
 OUT DDRD,R16 ; of the Data Direction Register DDRD. It actually selects the port. It not just selects the port. It selected PD0. For PD3; 3  means 8 and in hexadecimal, 8 will be 0x08. Putting it will on the PD3. Now what is left is turning on the port.

 LDI R16,0x01  ; Switch on the LED by writing 1 to PD0. If we had written 0, it would have turned off.
 OUT PORTD,R16

 
 again:  rjmp again ; Stop. I think it makes the flow of light continuous.
 
 /* From whatever I have now known so far, I get that DDR are direction registers and they hve ports at their ends. Those ports have leds. Putting 0 means the output is 0 and putting 1 means its on.*/
   
   //For such functionality, we need to first select the register and then turn it on or off...

