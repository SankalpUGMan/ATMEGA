.CSEG                
LDI ZL,LOW(NUM<<1)   
LDI ZH,HIGH(NUM<<1)
LDI XL,0x60			
LDI XH,00 
LPM R16,Z+	         
LPM R17,Z	      	                              
CP R16,R17	         
BRCC forward	     /*Activates in case of no Carry*/
MOV R16,R17	         //This is skipped somewtimes
forward: ST X,R16   //This is activated anyway....
NOP
NUM: .db 0x3E,0xF2