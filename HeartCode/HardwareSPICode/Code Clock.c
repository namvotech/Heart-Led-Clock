/*****************************************************
This program was produced by the
CodeWizardAVR V2.05.6
Automatic Program Generator
© Copyright 1998-2012 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : Clock Circuit
Version : 1.0
Date    : 12/17/2014
Author  : NamVo-Monster Electronics
Company : AVL
Comments:


Chip type               : ATmega8
Program type            : Application
AVR Core Clock frequency: 16.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*****************************************************/
#include <mega8.h>
#include <delay.h>
#include <string.h>
#include <spi.h>

// Alphanumeric LCD functions
#include <alcd.h>
// Standard Input/Output functions
#include <stdio.h>
// Declare your global variables here
#include <declare.c>
#include <bitmap.c>
#include <sub_program.c>
#include <sub_interrupt.c>

void main(void)
{

// Declare your local variables here

// Input/Output Ports initialization
// Port B initialization
PORTB=0x00;
DDRB=0xef;

// Port C initialization
PORTC=0x00;
DDRC=0xff;

// Port D initialization
PORTD=0x00;
DDRD=0xff;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
//TCCR0|=(1<<CS01);
//TCNT0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: 250.000 kHz
// Mode: Fast PWM top=ICR1
// OC1A output: Toggle
// OC1B output: Toggle
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
//TCCR1A|=(1<<COM1A1)|(1<<COM1B1)|(1<<WGM11);
//TCCR1B|=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10);
TCCR1A=0x00;
TCCR1B=0x00;
TCNT1H=0x00;
TCNT1L=0x00;
ICR1=20000;
OCR1A=2000;
OCR1B=2000;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=0xFF
// OC2 output: Disconnected

ASSR=0x00;
TCCR2|=(1<<CS21)|(1<<CS20);
TCNT2=0x00;
OCR2=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK|=(1<<TOIE0)|(1<<TOIE2);

// ADC initialization
// ADC disabled
ADCSRA=0x00;

// TWI initialization
// TWI disabled
TWCR=0x00;

//SPI
SPCR |= ((1<<SPE) | (1<<MSTR) | (0<<DORD) | (1<<CPOL) | (1<<CPHA)| (1<<SPR1)|(1<<SPR0));    
// Set SPI clock rate to FCPU/2.
SPSR |= (1<<SPI2X); 

lcd_clear();
lcd_init(16);
lcd_gotoxy(0,1);
lcd_puts("Hello");

//Subroutine call recording CGRAM character on the LCD
define_char(character_0,0x00);
define_char(character_1,0x01);
define_char(character_2,0x02);
define_char(character_3,0x03);
define_char(character_4,0x04);
//define_char(character_5,0x05);

str_size = strlen(str_main);
#asm("sei")
    
while (1)
{         
      /********************************
      Display program String Shift
      *****************************/ 
//      if(run>=100)   
//      { 
//        lcd_string_shift(0);
//        run=0;
//        a=~a; 
//      }          
//      LED=a?1:0; 
//      delay_ms(250);  
      
      test();
      //delay_ms(3000);
                    
}
}
