.CSEG ; this directive stores the program in flash memory
LDI ZL,LOW(NUM<<1) ; load start of array in Z register to be used as memory pointer
LDI ZH,HIGH(NUM<<1)
LPM R0,Z+ ; Get first value in memory which is the length of the array
LPM R16,Z+
DEC R0 ; number of comparisons is one less than length of array
CLZ ; clear zero flag
CLC ; clear carry flag
again: LPM R17,Z+ ; Get next number in R17
CP R16,R17 ; Compare R16 and R17
BRCC forward ; Branch if R16 already is larger (Carry flag cleared)
MOV R16,R17 ; Otherwise move larger R17 number to R16 since R16 always
             ;holds the larger number
forward: DEC R0 ; Decrement counter
BRNE again ; If not end of array continue checking. BRNE stops looping once the thing or register above it becomes 0.
NOP
NUM: .db 0x05,0x34,0xE2,0x11,0xC1,0xF2 ;First number in the array is length of total numbers
