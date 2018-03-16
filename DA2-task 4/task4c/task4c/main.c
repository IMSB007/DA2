
#include <avr/io.h>
#include <avr/interrupt.h>
ISR (TIMER1_OVF_vect)
{
	PORTB ^= 0XFF;
	TCNT1 = 63583;
}
int main(void)
{
	DDRD = (1<<PB2);
	TIMSK1 = (1<<TOIE1);
	TCCR1B = 5;
	TCNT1 = 63583; 
	sei();
	while (1)
	{
		
	}
}