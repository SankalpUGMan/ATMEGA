.CSEG
LDI ZL,LOW(NUM<<1)
LDI ZH, HIGH(NUM<<1)
LDI YL, 0x62
LDI YH, 00
LPM R16, Z+
LPM R17, Z+
LPM R21, Z
GO: SUB R16, R17
CP R16, R17
BREQ EQUAL
BRCC GO INC R21
EQUAL: INC R21   /* This is activated if the numbers are equal*/
ST Y, R21 

NOP
NUM: .db 0x16, 0x02,0x00

/*If number is even, the the register R21 will store 1. If number is odd, the register will store 2*/