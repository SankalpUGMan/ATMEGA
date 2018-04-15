//Program to use INT0, The ISR makes an LED glow 
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

int main(void)
{
	DDRB|=(1<<PB1);
	DDRD &= ~(1 << PD2);     // Clear the PD2 pin ,PD2 (INT0 pin) is now an input

	PORTD |= (1 << PORTD2);    // turn On the Pull-up 	// PD0 is now an input with pull-up enabled

	
	MCUCR |= (1 << ISC00);    // set INT0 to trigger on ANY logic change
	GICR |= (1 << INT0);      // Turns on INT0

	sei();                    // turn on interrupts
    PORTB=0x00;
	while(1)
	{
		   //main program running, When INT0 interrupt occurs the ISR is executed
	}
}



ISR (INT0_vect)  // This is the INT0 ISR, Interrupt Service Routine
{						//Code that has to run when INT0 occurs is put  here
	PORTB=0x02;          // The ISR here turns on the LED for a second and turns it off
	_delay_ms(1000);
	PORTB=0x00;
}