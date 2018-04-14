/*PROGRAM to Switch on an LED for sometime 
and then switch it off
*/

#include <avr/io.h>
#include<util/delay.h>
int main(void)
{
	DDRD=0x01;
    while(1)
    {
        PORTD=0x01;
		_delay_ms(1000);
		PORTD=0x00;
    }
}