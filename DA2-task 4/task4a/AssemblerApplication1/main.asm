
.include "m328def.inc"
.org 0x0000             
	rjmp Reset               
.org 0x0020            
	rjmp overflow_handler   



Reset: 
   ldi r16,  0b00000101
   out TCCR0B, r16      
   ldi r16, 0b00000001
   sts TIMSK0, r16      

   sei                   

   clr r16
   out TCNT0, r16       
   ldi r20, 0xFF
   OUT DDRB,R20        


blink:
   sbi PORTB, 2          
   rcall delay           
   cbi PORTB, 2          
   rcall delay           
   rjmp blink            
  
delay:
   clr r17         
sec_count:
   cpi r17,7    
   brne sec_count        
   ret                   

overflow_handler: 
   inc r17         
   cpi r17, 0xA0     
   brne PC+2             
   clr r17        
   reti                  