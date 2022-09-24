/***********************************
Declare file
**********************************/
/***********************
spi define
************************/
#define CLK_PORT PORTB
#define DIN_PORT PORTB
#define LATCH_PORT PORTB

#define CLK_PIN     5
#define DIN_PIN     3
#define LATCH_PIN   2


typedef unsigned char byte;

#define true    1
#define false   0
#define on      1
#define off      0

#define set_bit(port,pin)   (port)|= (1<<(pin))
#define clr_bit(port,pin)   (port)&=~(1<<(pin))
#define falling_edge(port, pin) do {\
                                set_bit(port,pin);\  
                                delay_ms(2);\
                                clr_bit(port,pin);\
                            } while (0)

#define rising_edge(port, pin) do {\
                                clr_bit(port,pin);\ 
                                delay_ms(2);\
                                set_bit(port,pin);\
                            } while (0)
/***************************
Variable declare
*******************************/
//Chuong
unsigned char flash    character_0[]={0x00,0x04,0x0e,0x0e,0x1f,0x04,0x00,0x00};  //Nen trang
unsigned char flash    character_1[]={0xff,0xfb,0xf1,0xf1,0xe0,0xfb,0xff,0xff};  //Nen den
//X
unsigned char flash    character_2[]={0x00,0x11,0x0a,0x04,0x0a,0x11,0x00,0x00};  //Nen trang
unsigned char flash    character_3[]={0xff,0xee,0xf5,0xfb,0xf5,0xee,0xff,0xff};  //Nen den
//< to den
flash unsigned char character_4[]={0x10,0x18,0x1c,0x1e,0x1c,0x18,0x10,0x00};


unsigned char     shift_screen[20],tem_save;
unsigned char     str_main[]="   Chuc Mung Ngay Ky Niem Cua 2 Chung Ta. Chuc Em Luon Vui Ve Va Am Ap Ben Anh. I LOVE YOU.   ";
unsigned int            i,c,j, run;
int                     str_size;
int                     lcd_size=16;
int k;
bit a;
#define LED PORTB.1

// Declare your global variables here
unsigned int row_index, colum_index;
unsigned int i;
unsigned char status=0;




