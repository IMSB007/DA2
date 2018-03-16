
#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>


int main(void)
{
    DDRB = 0xFF;    	
	while(1)
	{
		_delay_ms(250);
		PORTB ^=(1<<PB2);
	}
}

