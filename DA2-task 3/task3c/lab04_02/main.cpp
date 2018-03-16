
#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>


int main(void)
{
	DDRB |= (1 << DDB2);		

	ICR1 = 0x0F41;							
	OCR1B= 0x07A0;							



	TCCR1A |= (1 << COM1A1)|(1 << COM1B0)|(1 << COM1B1);	
	TCCR1A |= (1 << WGM11);
	TCCR1B |= (1 << WGM12)|(1 << WGM13);	
	
	TCCR1B |= (1<<CS12)|(1 << CS10);		
	while (1);
	{

	}
}

