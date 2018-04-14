//Program to Switch on an LED when a pushbutton is pressed
//LED connected to PORTD PD0
//Switch connected to PORTB PB0
//Pushbutton input normally logic 1 and when pressed becomes 0

#include <avr/io.h>
int main(void)
{
	DDRB=0x00; // Means selected for input
	DDRD=0x01;
    while(1)
    {
		PORTD=0x00;
		if((PINB & (1<<PB0))!=1) // PINB is the PORTB input register
		{						//If after ANDing PB0 and 1 it is not
		    PORTD=0x01;	        //equal to 1 i.e., if it equal to 0
			                    // the switch is pressed so switch on the LED
		}
			
        
    }
}
//Below is the program in which the opposite thing happens
/*
#include <avr/io.h>
int main(void)
{
	
	DDRC = 0x00;
	DDRD = 0x04;
	while(1)
	{
		PORTD = 0x01;
		if((~PINC) & (1<<PC0)=1)
		{
			PORTD = 0x00;
		}
	}
	
}
*/