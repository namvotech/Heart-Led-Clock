//flash unsigned char image[]={
//
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//0x00,0x00,0x00,0x00,
//
//
//};
//#define number_byte 250*4+8

//==========================
flash unsigned char array_test[]={
// Chay 1 Led
0x00,0x00,0x00,0x00,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x03,
0x00,0x00,0x00,0x00,0x00,0x07,
0x00,0x00,0x00,0x00,0x00,0x0f,
0x00,0x00,0x00,0x00,0x00,0x1f,
0x00,0x00,0x00,0x00,0x00,0x3f,
0x00,0x00,0x00,0x00,0x00,0x7f,
0x00,0x00,0x00,0x00,0x00,0xff,

0x00,0x00,0x00,0x00,0x01,0xff,
0x00,0x00,0x00,0x00,0x03,0xff,
0x00,0x00,0x00,0x00,0x07,0xff,
0x00,0x00,0x00,0x00,0x0f,0xff,
0x00,0x00,0x00,0x00,0x1f,0xff,
0x00,0x00,0x00,0x00,0x3f,0xff,
0x00,0x00,0x00,0x00,0x7f,0xff,
0x00,0x00,0x00,0x00,0xff,0xff,

0x00,0x00,0x00,0x01,0xff,0xff,
0x00,0x00,0x00,0x03,0xff,0xff,
0x00,0x00,0x00,0x07,0xff,0xff,
0x00,0x00,0x00,0x0f,0xff,0xff,
0x00,0x00,0x00,0x1f,0xff,0xff,
0x00,0x00,0x00,0x3f,0xff,0xff,
0x00,0x00,0x00,0x7f,0xff,0xff,
0x00,0x00,0x00,0xff,0xff,0xff,
};
#define number_byte_test 6*24


////////////////////////
#define number_byte 64*21
flash unsigned char image[]={
// H
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0x01,0x80,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
 
// E
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
 
// L
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
 
// L
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,


 
// O
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xE0,0x07,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xE0,0x07,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0x3F,0xFC,0x00,0x00,
 
// !
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xF3,0x00,0x00,
0xFF,0xF3,0x00,0x00,
0xFF,0xF3,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// _
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// I
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
 
// _
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,


// L
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,

// O
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xE0,0x07,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xE0,0x07,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0x3F,0xFC,0x00,0x00,


 
// V
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xE0,0x00,0x00,
0xFF,0xF0,0x00,0x00,
0xFF,0xF8,0x00,0x00,
0x00,0x1C,0x00,0x00,
0x00,0x0E,0x00,0x00,
0x00,0x07,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x06,0x00,0x00,
0x00,0x0C,0x00,0x00,
0x00,0x18,0x00,0x00,
0xFF,0xF0,0x00,0x00,
0xFF,0xE0,0x00,0x00,
 
// E
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,
0xC1,0x83,0x00,0x00,


// _
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
// Y
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFE,0x00,0x00,0x00,
0xFF,0x00,0x00,0x00,
0xFF,0x80,0x00,0x00,
0x01,0xC0,0x00,0x00,
0x00,0xE0,0x00,0x00,
0x00,0x7F,0x00,0x00,
0x00,0x3F,0x00,0x00,
0x00,0x3F,0x00,0x00,
0x00,0x60,0x00,0x00,
0x00,0xC0,0x00,0x00,
0x01,0x80,0x00,0x00,
0xFF,0x00,0x00,0x00,
0xFE,0x00,0x00,0x00,

 
// O
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xE0,0x07,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xE0,0x07,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0x3F,0xFC,0x00,0x00,
 
// U                                     
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFC,0x00,0x00,
0xFF,0xFE,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x00,0x07,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x03,0x00,0x00,
0x00,0x07,0x00,0x00,
0xFF,0xFE,0x00,0x00,
0xFF,0xFC,0x00,0x00,


// _
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,


// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
}; 

///////////////////
#define number_byte_tt 64*21
flash unsigned char image_tt[]={

// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,



// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,



// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,



// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,




// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,



// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,



// trai tim rong
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x60,0xC0,0x00,0x00,
0x40,0x60,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x18,0x00,0x00,
0x30,0x0C,0x00,0x00,
0x18,0x06,0x00,0x00,
0x18,0x03,0x00,0x00,
0x30,0x06,0x00,0x00,
0x60,0x0C,0x00,0x00,
0x40,0x18,0x00,0x00,
0x40,0x30,0x00,0x00,
0x60,0x60,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// trai tim dac
0x1F,0x00,0x00,0x00,
0x3F,0x80,0x00,0x00,
0x7F,0xC0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x1F,0xFE,0x00,0x00,
0x1F,0xFF,0x00,0x00,
0x3F,0xFE,0x00,0x00,
0x7F,0xFC,0x00,0x00,
0x7F,0xF8,0x00,0x00,
0x7F,0xF0,0x00,0x00,
0x7F,0xE0,0x00,0x00,
0x3F,0xC0,0x00,0x00,
0x1F,0x80,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
};

////////////////////////////////////
flash unsigned char image_avl[]={
// G
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x3F,0xFC,0x00,0x00,
0x7F,0xFE,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xE0,0x07,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x03,0x00,0x00,
0xC0,0x63,0x00,0x00,
0xC0,0x63,0x00,0x00,
0xC0,0x73,0x00,0x00,
0xC0,0x7F,0x00,0x00,
0x60,0x7E,0x00,0x00,
0x20,0x3C,0x00,0x00,
 
// o
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x03,0xFC,0x00,0x00,
0x07,0xFE,0x00,0x00,
0x0F,0xFF,0x00,0x00,
0x0C,0x03,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x04,0x02,0x00,0x00,
0x03,0xFC,0x00,0x00,

// o
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x03,0xFC,0x00,0x00,
0x07,0xFE,0x00,0x00,
0x0F,0xFF,0x00,0x00,
0x0C,0x03,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x04,0x02,0x00,0x00,
0x03,0xFC,0x00,0x00,
 
// d
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x03,0xFC,0x00,0x00,
0x07,0xFE,0x00,0x00,
0x0F,0xFF,0x00,0x00,
0x0C,0x03,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x01,0x00,0x00,
0x0C,0x03,0x00,0x00,
0x0F,0xFF,0x00,0x00,
0xFF,0xFE,0x00,0x00,
0xFF,0xFC,0x00,0x00,

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// N
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x30,0x00,0x00,0x00,
0x18,0x00,0x00,0x00,
0x0C,0x00,0x00,0x00,
0x06,0x00,0x00,0x00,
0x03,0x00,0x00,0x00,
0x01,0x80,0x00,0x00,
0x00,0xC0,0x00,0x00,
0x00,0x60,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,


// i
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x04,0x00,0x00,
0x00,0x08,0x00,0x00,
0x00,0x10,0x00,0x00,
0x00,0x20,0x00,0x00,
0xCF,0xFF,0x00,0x00,
0xCF,0xFF,0x00,0x00,
0x00,0x01,0x00,0x00,
0x00,0x02,0x00,0x00,
0x00,0x04,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 
// g
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x03,0xFC,0x00,0xC0,
0x07,0xFE,0x01,0x20,
0x0F,0xFF,0x01,0x10,
0x0C,0x03,0x02,0x10,
0x08,0x01,0x02,0x30,
0x08,0x01,0x04,0x60,
0x08,0x01,0x04,0xC0,
0x08,0x01,0x09,0x80,
0x08,0x01,0x0B,0x00,
0x0C,0x03,0x96,0x00,
0x0F,0xFF,0xFC,0x00,
0x07,0xFF,0xF8,0x00,
0x03,0xFF,0xF0,0x00,

// h
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x04,0x00,0x00,
0x00,0x08,0x00,0x00,
0x00,0x10,0x00,0x00,
0x00,0x20,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xC1,0x10,0x00,0x00,
0x82,0x20,0x00,0x00,
0x44,0x40,0x00,0x00,
0x38,0x40,0x00,0x00,
0x00,0x60,0x00,0x00,
0x00,0x7F,0x00,0x00,
0x00,0x3F,0x00,0x00,
 
// t
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x08,0x04,0x00,0x00,
0x08,0x08,0x00,0x00,
0x08,0x10,0x00,0x00,
0x08,0x20,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0xFF,0xFF,0x00,0x00,
0x08,0x01,0x00,0x00,
0x08,0x02,0x00,0x00,
0x08,0x04,0x00,0x00,
0x08,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
 

0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
};
#define number_byte_avl 64*10





   



