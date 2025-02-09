
void sw_spi_send(unsigned char val) {
  unsigned char i;
//  for (i = 0; i < 8; i++) {
//    DIN_PORT.DIN_PIN=val&0x80;
//    val<<=1; 
//    rising_edge(CLK_PORT,CLK_PIN);
//  } 
  
 for(i=8;i>0;i--)
  {
    DIN_PORT.DIN_PIN= (val>>(i-1))&(0x01);// select each bit of data from high to low
    rising_edge(CLK_PORT,CLK_PIN);
 }   
}

//=================================
void lcd_string_shift(unsigned char row,)
{
    int  shift;
    if(j>=25)
    {
      tem_save=str_main[0];
      for(shift=0;shift<=(str_size-2);shift++)
      {
        if(shift<=lcd_size-1)
        {
            shift_screen[shift]=str_main[shift];
            lcd_gotoxy(shift,row);
            lcd_putchar(shift_screen[shift]);
        }
        str_main[shift]= str_main[shift+1];
      }
      str_main[str_size-1]=tem_save;
      j=0;
    }
}


void bmmb(void)
{    

    for (row_index=0; row_index < number_byte_array_bmmb; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {        
            sw_spi_send(array_bmmb[row_index+colum_index]);       
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;              
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(100);        
    } 
                    
}

void bmbm(void)
{    

    for (row_index=0; row_index < number_byte_array_bmbm; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_bmbm[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(20);        
    } 
                    
}


void flashing(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(200);        
    } 
                    
}

void flashing2(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing2; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing2[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(200);        
    } 
                    
}
void flashing3(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing3; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing3[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(150);        
    } 
                    
}

void flashing4(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing4; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing4[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(100);        
    } 
                    
}
void flashing6(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing6; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing6[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(50);        
    } 
                    
}
void flashing8(void)
{    

    for (row_index=0; row_index < number_byte_array_flashing8; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_flashing8[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(30);        
    } 
                    
}
void blinking(void)
{    

    for (row_index=0; row_index < number_byte_array_blinking; row_index+=6) 
    {
        for (colum_index = 0;colum_index<6;colum_index++)
        {
            sw_spi_send(array_blinking[row_index+colum_index]); 
            if(run>=lcd_time)   
            { 
                lcd_string_shift(0);
                run=0;
                a=~a; 
            }          
            LED=a?1:0;                          
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(300);        
    } 
                    
}

/*********************************
//Subroutine recording CGRAM character on the LCD
// function used to define user characters
*************************************/
void define_char(flash unsigned char *pc,unsigned char char_code)
{
char i,address;
address=(char_code<<3)|0x40;
for (i=0; i<8; i++) lcd_write_byte(address++,*pc++);
}

