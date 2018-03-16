

.org 0
LDI R16,0XFF
SBI DDRB, 2 ;PB5 as output
LDI R17,0 ;needed to toogle led
OUT PORTB,R17
LDI R20,5 ;to set prescaler
STS TCCR1B,R20 ;Prescaler: 1024
begin:
	RCALL delay ;calling timer to wait for 1 sec
	EOR R17,R16 ;XOR to toogle led
	OUT PORTB,R17
	RJMP begin ;repeating i.e, while(1)
delay:
	 LDS R29, TCNT1H ;loading upper bit of counter to R29
	 LDS R28, TCNT1L ;loading lower bit of counter to R28
	 CPI R28,0xA0    ;comparing if lower is 0xA1
	 BRSH body
	 RJMP delay
body:
	 CPI R29,0x07
	 BRSH done
	 RJMP delay
done:
	 LDI R20,0x00
	 STS TCNT1H,R20 ;resetting the counter to 0 for next round
	 LDI R20,0x00
	 STS TCNT1L,R20 ;resetting the counter to 0 for next round
	 RET
