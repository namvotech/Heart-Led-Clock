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
    blink_counter++;  
    
    if(blink_counter<=timer) 
    {
        hu=0;         
    }    
    else if (blink_counter<=timer*2)
    {   
        hu=1;                 
    }
    else if (blink_counter<=timer*3)
    {   
        hu=2;                 
    } 
    else if (blink_counter<=timer*4)
    {   
        hu=3;                 
    } 
    else if (blink_counter<=timer*5)
    {   
        hu=4;                 
    } 
    else if (blink_counter<=timer*6)
    {   
        hu=5;                 
    }
    else if (blink_counter<=timer*7)
    {   
        hu=6;                 
    } 
    else if (blink_counter<=timer*8)
    {   
        hu=7;                 
    } 
    else if (blink_counter<=timer*9)
    {   
        hu=8;                 
    }              
    else blink_counter=0;    
                      
}
