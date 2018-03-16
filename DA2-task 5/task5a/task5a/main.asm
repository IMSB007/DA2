.INCLUDE "M328DEF.INC"
 .EQU F_CPU = 16000000
.org 0x00
.org 0x20
RJMP INT_0


 LDI R16, LOW(RAMEND)
 OUT SPL, R16
 LDI R16, HIGH(RAMEND)
 OUT SPH, R16

INIT: 
LDI R16, 2  
OUT DDRB, R16
LDI R16, 0b00000010
OUT DDRD, R16

sei
done:
rjmp done

Delay_1sec:                 
    LDI     r17,   32     
Delay1:
    LDI     r18,   255    
Delay2:
    LDI     r19,   255    
Delay3:
    DEC     r19            
    NOP                    
    BRNE    Delay3         

    DEC     r18           
    BRNE    Delay2          
    DEC     r17           
    BRNE    Delay1        
RET

INT_0:
	IN R20,PIND 
	OUT PORTB, R20
	call Delay_1sec
	reti