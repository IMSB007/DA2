

 .EQU F_CPU = 1000000
 .ORG 0

 LDI R16, LOW(RAMEND)
 OUT SPL, R16
 LDI R16, HIGH(RAMEND)
 OUT SPH, R16


MAIN:  
LDI R16, 0xFF  
OUT DDRB, R16 


BACK:  
COM R16 
OUT PORTB, R16  
CALL DELAY_1sec  
RJMP BACK 

Delay_1sec:                
    LDI     r17,   3      
Delay1:
    LDI     r18,   138
Delay2:
    LDI     r19,   86     
Delay3:
    DEC     r19                              
    BRNE    Delay3          
    DEC     r18            
    BRNE    Delay2          
    DEC     r17            
    BRNE    Delay1          
RET