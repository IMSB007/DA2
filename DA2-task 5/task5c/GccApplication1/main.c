/*
 * GccApplication1.c
 *
 * Created: 3/13/2018 11:57:04 AM
 * Author : chenj21
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 8000000UL
#include <util/delay.h>


//Interrupt Service Routine for INT0
ISR(INT0_vect)
{
	unsigned char  temp;
	
	_delay_ms(500);
	temp = PORTB;
	/* This for loop blink LEDs on Dataport 5 times*/
	PORTB = 0xFF;
	_delay_ms(1000);
	PORTB = 0x00;
	PORTB = temp;
	

}

int main(void)
{
	DDRB |= (1<<PB1); //set PORTB PIN1 as OUTPUT
	DDRD = 0; //PORTD as INPUT
	
	EIMSK |= (1<<INT0);					// Enable INT0
	EICRA |= (1<<ISC01) | (1<<ISC00);	// Trigger INT0 on rising edge
	
	sei();				//Enable Global Interrupt
	
	while(1)
	{
		
	}
}