/*
 * pwm.c
 *
 * Created: 9/22/2016 11:22:50 AM
 *  Author: students
 */ 

#include <avr/io.h>


int main(void)
{
	DDRB |= (1 << DDB3); // PB3 is output

	OCR2 = 128; 	// set PWM for 50% duty cycle


	TCCR2 |= (1 << COM21)|(1 << WGM21) | (1 << WGM20)|(1 << CS21); 	// set non-inverting mode,fast PWM Mode,prescaler to 8 and starts PWM


	while (1)
	{
		
	}
}