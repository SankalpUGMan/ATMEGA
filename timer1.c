// this code sets up timer1 for 1 second   8 Mhz Clock 
//Be sure to set Atmega8 clock to 8 MHz by setting the appropriate fuses in AVR-Burn-O-Mat


#include <avr/io.h>
#include <avr/interrupt.h>


int main(void)
{
	DDRB|=(1<<PB1); 
	OCR1A = 7812; // 1 second
	

	TCCR1B |= (1 << WGM12);  //  CTC on OCR1A

	TIMSK |= (1 << OCIE1A); //Set interrupt on compare match

	TCCR1B |= (1 << CS12) | (1 << CS10);	// set prescaler to 1024 and start the timer
    

	sei(); 	// enable interrupts


	while (1);
	{
		// main program running here
    }
}

ISR (TIMER1_COMPA_vect)
{
	PORTB ^=(1<<PB1); //Toggling the LED
}