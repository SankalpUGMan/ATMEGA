.CSEG
LDI ZL, LOW(NUM<<1)
LDI ZH, HIGH(NUM<<1)
LDI XL, 0x60
LDI XH, 00
LPM R16, Z+
LPM R17, Z+
LPM R20, Z+
LPM R21, Z
AND R16, R17
CP R16, R17
BREQ EQUAL
INC R21
EQUAL: INC R20

NOP
NUM: .db 0x14, 0x01, 0x00
/*In case of even numbers, R20 and R21 both are incremented by 1 each and in case of odd numbers only R20 is incremented*/