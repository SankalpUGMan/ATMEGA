 .CSEG
 LDI ZL,LOW(NUM<<1)
 LDI ZH,HIGH(NUM<<1)
 LDI XL,0x60
 LDI XH,00
 LDI YL,0x61
 LDI YH,00
 LPM R16,Z+
 LPM R17,Z+
 LPM R18,Z+
 LPM R19,Z+
 ADD R16,R18
 ADC R17,R19
 BRCC forward
 forward: LPM R22,Z
 ST X+,R16
 ST X,R17
 
 
 NOP
 NUM: .dw 0x0103, 0x010D, 0X01
 ;.dw implies 16 bit nos.