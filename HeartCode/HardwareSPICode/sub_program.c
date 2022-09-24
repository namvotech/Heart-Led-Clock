

void test(void)
{    

//    for (row_index=0; row_index < number_byte_test; row_index+=6) 
//    {
//        for (colum_index = 0;colum_index<6;colum_index++)
//        {
//            SPDR=spi(array_test[row_index + colum_index]);   
//        }         
//        falling_edge(LATCH_PORT, LATCH_PIN); 
//        delay_ms(200);        
//    } 


        for (colum_index = 0;colum_index<8;colum_index++)
        {
            SPDR=spi(0xff); 
            while(!(SPSR & (1<<SPIF)));  
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(500); 
        
        for (colum_index = 0;colum_index<8;colum_index++)
        {
            SPDR=spi(0x00);
            while(!(SPSR & (1<<SPIF)));   
        }         
        falling_edge(LATCH_PORT, LATCH_PIN); 
        delay_ms(500);                     
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

