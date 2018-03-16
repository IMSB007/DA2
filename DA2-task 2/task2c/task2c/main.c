

#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB|=(1<<PB2);                            
    while (1) 
    {
		if((PIND&0b00000010)==0b00000010){     
			PORTB |= (1<<PB2);                  
			_delay_ms(1000);                     
		}
		else{
			PORTB = 0;                        
		}
    }
}

