/***********************************
Timer 0 oveflow interrupt
Check keypad
**********************************/
/***********************************
Timer 2 oveflow interrupt
**********************************/
interrupt [TIM2_OVF] void timer2_ovf_isr(void)
{  
    // Place your code here 
    i++;
    c++;
    j++; 
    run++;    
                   
}
