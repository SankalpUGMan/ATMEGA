 #include "m8def.inc"
 .CSEG
 LDI R16,0x01 ;  PIN 0 of PORTD should be output, so write 1 to BIT 0
 OUT DDRD,R16 ; of the Data Direction Register DDRD 
 LDI ZL,LOW(NUM<<1)
 LDI ZH,HIGH(NUM<<1)
 LPM R14, Z+
 LPM R13, Z
 FORWARD: LPM R15,Z

 LDI R16,0x01 ; Switch on the LED by writing 1 to PD0
 OUT PORTD,R16
 GO: INC R15
 CP R14,R15
 BRCC GO
 INC R13
 CP R14,R13
 BRCC FORWARD
 LDI R16,0x00
 OUT PORTD,R16
 
 again:  rjmp again ; Stop
 NOP
 NUM: .db 0xF1, 0x00
 ; Its a n squared loop