
;CodeVisionAVR C Compiler V2.05.6 
;(C) Copyright 1998-2012 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type              : ATmega8
;Program type           : Application
;Clock frequency        : 8.000000 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 256 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: No
;Enhanced function parameter passing: Yes
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#pragma AVRPART ADMIN PART_NAME ATmega8
	#pragma AVRPART MEMORY PROG_FLASH 8192
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1024
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	RCALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	RCALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _tem_save=R5
	.DEF _i=R6
	.DEF _c=R8
	.DEF _j=R10
	.DEF _run=R12
	.DEF _status=R4

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	RJMP __RESET
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP _timer2_ovf_isr
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00

_character_0:
	.DB  0x0,0xA,0x1F,0x1F,0xE,0x4,0x0,0x0
_character_1:
	.DB  0xFF,0xFB,0xF1,0xF1,0xE0,0xFB,0xFF,0xFF
_character_2:
	.DB  0x0,0x11,0xA,0x4,0xA,0x11,0x0,0x0
_character_3:
	.DB  0xFF,0xEE,0xF5,0xFB,0xF5,0xEE,0xFF,0xFF
_character_4:
	.DB  0x10,0x18,0x1C,0x1E,0x1C,0x18,0x10,0x0
_array_bmmb:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x1,0x0,0x0,0x1,0x0,0x0,0x3,0x0
	.DB  0x0,0x3,0x0,0x0,0x7,0x0,0x0,0x7
	.DB  0x0,0x0,0xF,0x0,0x0,0xF,0x0,0x0
	.DB  0x1F,0x0,0x0,0x1F,0x0,0x0,0x3F,0x0
	.DB  0x0,0x3F,0x0,0x0,0x7F,0x0,0x0,0x7F
	.DB  0x0,0x0,0xFF,0x0,0x0,0xFF,0x0,0x1
	.DB  0xFF,0x0,0x1,0xFF,0x0,0x3,0xFF,0x0
	.DB  0x3,0xFF,0x0,0x7,0xFF,0x0,0x7,0xFF
	.DB  0x0,0xF,0xFF,0x0,0xF,0xFF,0x0,0x1F
	.DB  0xFF,0x0,0x1F,0xFF,0x0,0x3F,0xFF,0x0
	.DB  0x3F,0xFF,0x0,0x7F,0xFF,0x0,0x7F,0xFF
	.DB  0x0,0xFF,0xFF,0x0,0xFF,0xFF,0x1,0xFF
	.DB  0xFF,0x1,0xFF,0xFF,0x3,0xFF,0xFF,0x3
	.DB  0xFF,0xFF,0x7,0xFF,0xFF,0x7,0xFF,0xFF
	.DB  0xF,0xFF,0xFF,0xF,0xFF,0xFF,0x1F,0xFF
	.DB  0xFF,0x1F,0xFF,0xFF,0x3F,0xFF,0xFF,0x3F
	.DB  0xFF,0xFF,0x7F,0xFF,0xFF,0x7F,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0x7F,0xFF,0xFF,0x7F
	.DB  0xFF,0xFF,0x3F,0xFF,0xFF,0x3F,0xFF,0xFF
	.DB  0x1F,0xFF,0xFF,0x1F,0xFF,0xFF,0xF,0xFF
	.DB  0xFF,0xF,0xFF,0xFF,0x7,0xFF,0xFF,0x7
	.DB  0xFF,0xFF,0x3,0xFF,0xFF,0x3,0xFF,0xFF
	.DB  0x1,0xFF,0xFF,0x1,0xFF,0xFF,0x0,0xFF
	.DB  0xFF,0x0,0xFF,0xFF,0x0,0x7F,0xFF,0x0
	.DB  0x7F,0xFF,0x0,0x3F,0xFF,0x0,0x3F,0xFF
	.DB  0x0,0x1F,0xFF,0x0,0x1F,0xFF,0x0,0xF
	.DB  0xFF,0x0,0xF,0xFF,0x0,0x7,0xFF,0x0
	.DB  0x7,0xFF,0x0,0x3,0xFF,0x0,0x3,0xFF
	.DB  0x0,0x1,0xFF,0x0,0x1,0xFF,0x0,0x0
	.DB  0xFF,0x0,0x0,0xFF,0x0,0x0,0x7F,0x0
	.DB  0x0,0x7F,0x0,0x0,0x3F,0x0,0x0,0x3F
	.DB  0x0,0x0,0x1F,0x0,0x0,0x1F,0x0,0x0
	.DB  0xF,0x0,0x0,0xF,0x0,0x0,0x7,0x0
	.DB  0x0,0x7,0x0,0x0,0x3,0x0,0x0,0x3
	.DB  0x0,0x0,0x1,0x0,0x0,0x1
_array_bmbm:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x80,0x0
	.DB  0x0,0x0,0x0,0x1,0xC0,0x0,0x0,0x0
	.DB  0x0,0x3,0xE0,0x0,0x0,0x0,0x0,0x7
	.DB  0xF0,0x0,0x0,0x0,0x0,0xF,0xF8,0x0
	.DB  0x0,0x0,0x0,0x1F,0xFC,0x0,0x0,0x0
	.DB  0x0,0x3F,0xFE,0x0,0x0,0x0,0x0,0x7F
	.DB  0xFF,0x0,0x0,0x0,0x0,0xFF,0xFF,0x80
	.DB  0x0,0x0,0x1,0xFF,0xFF,0xC0,0x0,0x0
	.DB  0x3,0xFF,0xFF,0xE0,0x0,0x0,0x7,0xFF
	.DB  0xFF,0xF0,0x0,0x0,0xF,0xFF,0xFF,0xF8
	.DB  0x0,0x0,0x1F,0xFF,0xFF,0xFC,0x0,0x0
	.DB  0x3F,0xFF,0xFF,0xFE,0x0,0x0,0x7F,0xFF
	.DB  0xFF,0xFF,0x0,0x0,0xFF,0xFF,0xFF,0xFF
	.DB  0x80,0x1,0xFF,0xFF,0xFF,0xFF,0xC0,0x3
	.DB  0xFF,0xFF,0xFF,0xFF,0xE0,0x7,0xFF,0xFF
	.DB  0xFF,0xFF,0xF0,0xF,0xFF,0xFF,0xFF,0xFF
	.DB  0xF8,0x1F,0xFF,0xFF,0xFF,0xFF,0xFC,0x3F
	.DB  0xFF,0xFF,0xFF,0xFF,0xFE,0x7F,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFE,0x7F
	.DB  0xFF,0xFF,0xFF,0xFF,0xFC,0x3F,0xFF,0xFF
	.DB  0xFF,0xFF,0xF8,0x1F,0xFF,0xFF,0xFF,0xFF
	.DB  0xF0,0xF,0xFF,0xFF,0xFF,0xFF,0xE0,0x7
	.DB  0xFF,0xFF,0xFF,0xFF,0xC0,0x3,0xFF,0xFF
	.DB  0xFF,0xFF,0x80,0x1,0xFF,0xFF,0xFF,0xFF
	.DB  0x0,0x0,0xFF,0xFF,0xFF,0xFE,0x0,0x0
	.DB  0x7F,0xFF,0xFF,0xFC,0x0,0x0,0x3F,0xFF
	.DB  0xFF,0xF8,0x0,0x0,0x1F,0xFF,0xFF,0xF0
	.DB  0x0,0x0,0xF,0xFF,0xFF,0xE0,0x0,0x0
	.DB  0x7,0xFF,0xFF,0xC0,0x0,0x0,0x3,0xFF
	.DB  0xFF,0x80,0x0,0x0,0x1,0xFF,0xFF,0x0
	.DB  0x0,0x0,0x0,0xFF,0xFE,0x0,0x0,0x0
	.DB  0x0,0x7F,0xFC,0x0,0x0,0x0,0x0,0x3F
	.DB  0xF8,0x0,0x0,0x0,0x0,0x1F,0xF0,0x0
	.DB  0x0,0x0,0x0,0xF,0xE0,0x0,0x0,0x0
	.DB  0x0,0x7,0xC0,0x0,0x0,0x0,0x0,0x3
	.DB  0x80,0x0,0x0,0x0,0x0,0x1
_array_flashing:
	.DB  0x55,0x55,0x55,0x55,0x55,0x55,0xAA,0xAA
	.DB  0xAA,0xAA,0xAA,0xAA
_array_flashing2:
	.DB  0xCC,0xCC,0xCC,0xCC,0xCC,0xCC,0x55,0x55
	.DB  0x55,0x55,0x55,0x55,0x33,0x33,0x33,0x33
	.DB  0x33,0x33
_array_flashing3:
	.DB  0xE3,0x8E,0x38,0xE3,0x8E,0x38,0x71,0xE7
	.DB  0x1C,0x71,0xE7,0x1C,0x38,0xE3,0x8E,0x38
	.DB  0xE3,0x8E,0x1C,0x71,0xE7,0x1C,0x71,0xE7
	.DB  0x8E,0x38,0xE3,0x8E,0x38,0xE3,0xC7,0x1C
	.DB  0x71,0xC7,0x1C,0x71
_array_flashing4:
	.DB  0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0x78,0x78
	.DB  0x78,0x78,0x78,0x78,0x3C,0x3C,0x3C,0x3C
	.DB  0x3C,0x3C,0x1E,0x1E,0x1E,0x1E,0x1E,0x1E
	.DB  0xF,0xF,0xF,0xF,0xF,0xF,0x87,0x87
	.DB  0x87,0x87,0x87,0x87,0xC3,0xC3,0xC3,0xC3
	.DB  0xC3,0xC3,0xE1,0xE1,0xE1,0xE1,0xE1,0xE1
_array_flashing6:
	.DB  0xFC,0xF,0xC0,0xFC,0xF,0xC0,0x7E,0x7
	.DB  0xE0,0x7E,0x7,0xE0,0x3F,0x3,0xF0,0x3F
	.DB  0x3,0xF0,0x1F,0x81,0xF8,0x1F,0x81,0xF8
	.DB  0xF,0xC0,0xFC,0xF,0xC0,0xFC,0x7,0xE0
	.DB  0x7E,0x7,0xE0,0x7E,0x3,0xF0,0x3F,0x3
	.DB  0xF0,0x3F,0x81,0xF8,0x1F,0x81,0xF8,0x1F
	.DB  0xC0,0xFC,0xF,0xC0,0xFC,0xF,0xE0,0x7E
	.DB  0x7,0xE0,0x7E,0x7,0xF0,0x3F,0x3,0xF0
	.DB  0x3F,0x3,0xF8,0x1F,0x81,0xF8,0x1F,0x81
_array_flashing8:
	.DB  0xFF,0x0,0xFF,0x0,0xFF,0x0,0x7F,0x80
	.DB  0x7F,0x80,0x7F,0x80,0x3F,0xC0,0x3F,0xC0
	.DB  0x3F,0xC0,0x1F,0xE0,0x1F,0xE0,0x1F,0xE0
	.DB  0xF,0xF0,0xF,0xF0,0xF,0xF0,0x7,0xF8
	.DB  0x7,0xF8,0x7,0xF8,0x3,0xFC,0x3,0xFC
	.DB  0x3,0xFC,0x1,0xFE,0x1,0xFE,0x1,0xFE
	.DB  0x0,0xFF,0x0,0xFF,0x0,0xFF,0x80,0x7F
	.DB  0x80,0x7F,0x80,0x7F,0xC0,0x3F,0xC0,0x3F
	.DB  0xC0,0x3F,0xE0,0x1F,0xE0,0x1F,0xE0,0x1F
	.DB  0xF0,0xF,0xF0,0xF,0xF0,0xF,0xF8,0x7
	.DB  0xF8,0x7,0xF8,0x7,0xFC,0x3,0xFC,0x3
	.DB  0xFC,0x3,0xFE,0x1,0xFE,0x1,0xFE,0x1
_array_blinking:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF
_tbl10_G102:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G102:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

;REGISTER BIT VARIABLES INITIALIZATION
__REG_BIT_VARS:
	.DW  0x0000

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x0

_0x3:
	.DB  0x20,0x20,0x20,0x2A,0x2A,0x20,0x4D,0x65
	.DB  0x72,0x79,0x20,0x63,0x68,0x72,0x69,0x73
	.DB  0x74,0x6D,0x61,0x73,0x20,0x54,0x68,0x75
	.DB  0x79,0x20,0x54,0x69,0x65,0x6E,0x20,0x78
	.DB  0x69,0x6E,0x68,0x20,0x64,0x65,0x70,0x20
	.DB  0x63,0x75,0x61,0x20,0x4C,0x69,0x65,0x6D
	.DB  0x20,0x44,0x61,0x75,0x20,0x2A,0x2A,0x20
	.DB  0x20,0x20
_0x4:
	.DB  0x10
_0x5:
	.DB  0x58,0x1B
_0x6:
	.DB  0x2C,0x1
_0x0:
	.DB  0x20,0x49,0x20,0x4C,0x6F,0x76,0x65,0x20
	.DB  0x59,0x6F,0x75,0x20,0x0
_0x2020003:
	.DB  0x80,0xC0

__GLOBAL_INI_TBL:
	.DW  0x01
	.DW  0x02
	.DW  __REG_BIT_VARS*2

	.DW  0x01
	.DW  0x04
	.DW  __REG_VARS*2

	.DW  0x3A
	.DW  _str_main
	.DW  _0x3*2

	.DW  0x01
	.DW  _lcd_size
	.DW  _0x4*2

	.DW  0x02
	.DW  _timer
	.DW  _0x5*2

	.DW  0x02
	.DW  _lcd_time
	.DW  _0x6*2

	.DW  0x0D
	.DW  _0xB0
	.DW  _0x0*2

	.DW  0x02
	.DW  __base_y_G101
	.DW  _0x2020003*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	OUT  WDTCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	RJMP _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160

	.CSEG
;/*****************************************************
;This program was produced by the
;CodeWizardAVR V2.05.6
;Automatic Program Generator
;© Copyright 1998-2012 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project : Clock Circuit
;Version : 1.0
;Date    : 12/17/2014
;Author  : NamVo-Monster Electronics
;Company : AVL
;Comments:
;
;
;Chip type               : ATmega8
;Program type            : Application
;AVR Core Clock frequency: 16.000000 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 256
;*****************************************************/
;#include <mega8.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <delay.h>
;#include <string.h>
;//#include <spi.h>
;
;// Alphanumeric LCD functions
;#include <alcd.h>
;// Standard Input/Output functions
;#include <stdio.h>
;// Declare your global variables here
;#include <declare.c>
;/***********************************
;Declare file
;**********************************/
;/***********************
;spi define
;************************/
;#define CLK_PORT PORTB
;#define DIN_PORT PORTB
;#define LATCH_PORT PORTB
;
;#define CLK_PIN     5
;#define DIN_PIN     3
;#define LATCH_PIN   2
;
;
;typedef unsigned char byte;
;
;#define true    1
;#define false   0
;#define on      1
;#define off      0
;
;#define set_bit(port,pin)   (port)|= (1<<(pin))
;#define clr_bit(port,pin)   (port)&=~(1<<(pin))
;#define falling_edge(port, pin) do {\
;                                set_bit(port,pin);\
;                                delay_ms(1);\
;                                clr_bit(port,pin);\
;                            } while (0)
;
;#define rising_edge(port, pin) do {\
;                                clr_bit(port,pin);\
;                                delay_ms(1);\
;                                set_bit(port,pin);\
;                            } while (0)
;/***************************
;Variable declare
;*******************************/
;//Chuong
;unsigned char flash    character_0[]={0x00,0x0a,0x1f,0x1f,0x0e,0x04,0x00,0x00};  //Nen trang
;//unsigned char flash    character_0[]={0x00,0x04,0x0e,0x0e,0x1f,0x04,0x00,0x00};  //Nen trang
;unsigned char flash    character_1[]={0xff,0xfb,0xf1,0xf1,0xe0,0xfb,0xff,0xff};  //Nen den
;//X
;unsigned char flash    character_2[]={0x00,0x11,0x0a,0x04,0x0a,0x11,0x00,0x00};  //Nen trang
;unsigned char flash    character_3[]={0xff,0xee,0xf5,0xfb,0xf5,0xee,0xff,0xff};  //Nen den
;//< to den
;flash unsigned char character_4[]={0x10,0x18,0x1c,0x1e,0x1c,0x18,0x10,0x00};
;
;
;unsigned char     shift_screen[20],tem_save;
;unsigned char     str_main[]="   ** Mery christmas Thuy Tien xinh dep cua Liem Dau **   ";

	.DSEG
;
;unsigned int            i,c,j, run;
;int                     str_size;
;int                     lcd_size=16;
;int k;
;bit a;
;unsigned int row, col;
;#define LED PORTB.1
;unsigned int blink_counter;
;int timer=7000, hu=0, lcd_time=300;
;
;
;// Declare your global variables here
;unsigned int row_index, colum_index;
;unsigned int i;
;unsigned char status=0;
;
;
;
;
;
;#include <bitmap.c>
;
;//==========================
;flash unsigned char array_bmmb[]={
;// Chay 1 Led
;0x00,0x00,0x0,0x00,0x00,0x00,
;
;
;0x00,0x00,0x01,0x00,0x00,0x01,
;0x00,0x00,0x03,0x00,0x00,0x03,
;0x00,0x00,0x07,0x00,0x00,0x07,
;0x00,0x00,0x0f,0x00,0x00,0x0f,
;0x00,0x00,0x1f,0x00,0x00,0x1f,
;0x00,0x00,0x3f,0x00,0x00,0x3f,
;0x00,0x00,0x7f,0x00,0x00,0x7f,
;0x00,0x00,0xff,0x00,0x00,0xff,
;
;0x00,0x01,0xff,0x00,0x01,0xff,
;0x00,0x03,0xff,0x00,0x03,0xff,
;0x00,0x07,0xff,0x00,0x07,0xff,
;0x00,0x0f,0xff,0x00,0x0f,0xff,
;0x00,0x1f,0xff,0x00,0x1f,0xff,
;0x00,0x3f,0xff,0x00,0x3f,0xff,
;0x00,0x7f,0xff,0x00,0x7f,0xff,
;0x00,0xff,0xff,0x00,0xff,0xff,
;
;0x01,0xff,0xff,0x01,0xff,0xff,
;0x03,0xff,0xff,0x03,0xff,0xff,
;0x07,0xff,0xff,0x07,0xff,0xff,
;0x0f,0xff,0xff,0x0f,0xff,0xff,
;0x1f,0xff,0xff,0x1f,0xff,0xff,
;0x3f,0xff,0xff,0x3f,0xff,0xff,
;0x7f,0xff,0xff,0x7f,0xff,0xff,
;0xff,0xff,0xff,0xff,0xff,0xff,
;
;0xff,0xff,0xff,0xff,0xff,0xff,
;0x7f,0xff,0xff,0x7f,0xff,0xff,
;0x3f,0xff,0xff,0x3f,0xff,0xff,
;0x1f,0xff,0xff,0x1f,0xff,0xff,
;0x0f,0xff,0xff,0x0f,0xff,0xff,
;0x07,0xff,0xff,0x07,0xff,0xff,
;0x03,0xff,0xff,0x03,0xff,0xff,
;0x01,0xff,0xff,0x01,0xff,0xff,
;
;0x00,0xff,0xff,0x00,0xff,0xff,
;0x00,0x7f,0xff,0x00,0x7f,0xff,
;0x00,0x3f,0xff,0x00,0x3f,0xff,
;0x00,0x1f,0xff,0x00,0x1f,0xff,
;0x00,0x0f,0xff,0x00,0x0f,0xff,
;0x00,0x07,0xff,0x00,0x07,0xff,
;0x00,0x03,0xff,0x00,0x03,0xff,
;0x00,0x01,0xff,0x00,0x01,0xff,
;
;0x00,0x00,0xff,0x00,0x00,0xff,
;0x00,0x00,0x7f,0x00,0x00,0x7f,
;0x00,0x00,0x3f,0x00,0x00,0x3f,
;0x00,0x00,0x1f,0x00,0x00,0x1f,
;0x00,0x00,0x0f,0x00,0x00,0x0f,
;0x00,0x00,0x07,0x00,0x00,0x07,
;0x00,0x00,0x03,0x00,0x00,0x03,
;0x00,0x00,0x01,0x00,0x00,0x01,
;
;};
;#define number_byte_array_bmmb 6*(8*6+1)
;
;
;
;//==========================
;flash unsigned char array_bmbm[]={
;// Chay 1 Led
;0x00,0x00,0x00,0x00,0x00,0x00,
;
;0x80,0x00,0x00,0x00,0x00,0x01,
;0xc0,0x00,0x00,0x00,0x00,0x03,
;0xe0,0x00,0x00,0x00,0x00,0x07,
;0xf0,0x00,0x00,0x00,0x00,0x0f,
;0xf8,0x00,0x00,0x00,0x00,0x1f,
;0xfc,0x00,0x00,0x00,0x00,0x3f,
;0xfe,0x00,0x00,0x00,0x00,0x7f,
;0xff,0x00,0x00,0x00,0x00,0xff,
;
;
;0xff,0x80,0x00,0x00,0x01,0xff,
;0xff,0xc0,0x00,0x00,0x03,0xff,
;0xff,0xe0,0x00,0x00,0x07,0xff,
;0xff,0xf0,0x00,0x00,0x0f,0xff,
;0xff,0xf8,0x00,0x00,0x1f,0xff,
;0xff,0xfc,0x00,0x00,0x3f,0xff,
;0xff,0xfe,0x00,0x00,0x7f,0xff,
;0xff,0xff,0,0x00,0xff,0xff,
;
;
;0xff,0xff,0x80,0x01,0xff,0xff,
;0xff,0xff,0xc0,0x03,0xff,0xff,
;0xff,0xff,0xe0,0x07,0xff,0xff,
;0xff,0xff,0xf0,0x0f,0xff,0xff,
;0xff,0xff,0xf8,0x1f,0xff,0xff,
;0xff,0xff,0xfc,0x3f,0xff,0xff,
;0xff,0xff,0xfe,0x7f,0xff,0xff,
;0xff,0xff,0xff,0xff,0xff,0xff,
;
;
;
;0xff,0xff,0xff,0xff,0xff,0xff,
;0xff,0xff,0xfe,0x7f,0xff,0xff,
;0xff,0xff,0xfc,0x3f,0xff,0xff,
;0xff,0xff,0xf8,0x1f,0xff,0xff,
;0xff,0xff,0xf0,0x0f,0xff,0xff,
;0xff,0xff,0xe0,0x07,0xff,0xff,
;0xff,0xff,0xc0,0x03,0xff,0xff,
;0xff,0xff,0x80,0x01,0xff,0xff,
;
;
;0xff,0xff,0x00,0x00,0xff,0xff,
;0xff,0xfe,0x00,0x00,0x7f,0xff,
;0xff,0xfc,0x00,0x00,0x3f,0xff,
;0xff,0xf8,0x00,0x00,0x1f,0xff,
;0xff,0xf0,0x00,0x00,0x0f,0xff,
;0xff,0xe0,0x00,0x00,0x07,0xff,
;0xff,0xc0,0x00,0x00,0x03,0xff,
;0xff,0x80,0x00,0x00,0x01,0xff,
;
;0xff,0x00,0x00,0x00,0x00,0xff,
;0xfe,0x00,0x00,0x00,0x00,0x7f,
;0xfc,0x00,0x00,0x00,0x00,0x3f,
;0xf8,0x00,0x00,0x00,0x00,0x1f,
;0xf0,0x00,0x00,0x00,0x00,0x0f,
;0xe0,0x00,0x00,0x00,0x00,0x07,
;0xc0,0x00,0x00,0x00,0x00,0x03,
;0x80,0x00,0x00,0x00,0x00,0x01,
;
;
;
;};
;#define number_byte_array_bmbm 6*(6*8+1)
;
;
;
;
;//==========================
;flash unsigned char array_flashing[]={
;// Chay 1 Led
;0x55,0x55,0x55,0x55,0x55,0x55,
;0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,
;};
;#define number_byte_array_flashing 6*2
;////////////////////////
;//==========================
;flash unsigned char array_flashing2[]={
;// Chay 1 Led
;0xcc,0xcc,0xcc,0xcc,0xcc,0xcc,
;0x55,0x55,0x55,0x55,0x55,0x55,
;0x33,0x33,0x33,0x33,0x33,0x33,
;};
;#define number_byte_array_flashing2 6*3
;////////////////////////
;//==========================
;flash unsigned char array_flashing3[]={
;// Chay 1 Led
;0xe3,0x8e,0x38,0xe3,0x8e,0x38,
;0x71,0xe7,0x1c,0x71,0xe7,0x1c,
;0x38,0xe3,0x8e,0x38,0xe3,0x8e,
;0x1c,0x71,0xe7,0x1c,0x71,0xe7,
;0x8e,0x38,0xe3,0x8e,0x38,0xe3,
;0xc7,0x1c,0x71,0xc7,0x1c,0x71,
;};
;#define number_byte_array_flashing3 6*6
;////////////////////////
;//==========================
;flash unsigned char array_flashing4[]={
;// Chay 1 Led
;0xf0,0xf0,0xf0,0xf0,0xf0,0xf0,
;0x78,0x78,0x78,0x78,0x78,0x78,
;0x3c,0x3c,0x3c,0x3c,0x3c,0x3c,
;0x1e,0x1e,0x1e,0x1e,0x1e,0x1e,
;
;0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,
;0x87,0x87,0x87,0x87,0x87,0x87,
;0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,
;0xe1,0xe1,0xe1,0xe1,0xe1,0xe1,
;};
;//==========================
;#define number_byte_array_flashing4 6*8
;////////////////////////
;flash unsigned char array_flashing6[]={
;// Chay 1 Led
;0xfc,0x0f,0xc0,0xfc,0x0f,0xc0,
;0x7e,0x07,0xe0,0x7e,0x07,0xe0,
;0x3f,0x03,0xf0,0x3f,0x03,0xf0,
;0x1f,0x81,0xf8,0x1f,0x81,0xf8,
;
;0x0f,0xc0,0xfc,0x0f,0xc0,0xfc,
;0x07,0xe0,0x7e,0x07,0xe0,0x7e,
;0x03,0xf0,0x3f,0x03,0xf0,0x3f,
;0x81,0xf8,0x1f,0x81,0xf8,0x1f,
;
;0xc0,0xfc,0x0f,0xc0,0xfc,0x0f,
;0xe0,0x7e,0x07,0xe0,0x7e,0x07,
;0xf0,0x3f,0x03,0xf0,0x3f,0x03,
;0xf8,0x1f,0x81,0xf8,0x1f,0x81,
;};
;//==========================
;#define number_byte_array_flashing6 6*12
;////////////////////////
;
;flash unsigned char array_flashing8[]={
;// Chay 1 Led
;0xff,0x00,0xff,0x00,0xff,0x00,
;0x7f,0x80,0x7f,0x80,0x7f,0x80,
;0x3f,0xc0,0x3f,0xc0,0x3f,0xc0,
;0x1f,0xe0,0x1f,0xe0,0x1f,0xe0,
;
;0x0f,0xf0,0x0f,0xf0,0x0f,0xf0,
;0x07,0xf8,0x07,0xf8,0x07,0xf8,
;0x03,0xfc,0x03,0xfc,0x03,0xfc,
;0x01,0xfe,0x01,0xfe,0x01,0xfe,
;
;0x00,0xff,0x00,0xff,0x00,0xff,
;0x80,0x7f,0x80,0x7f,0x80,0x7f,
;0xc0,0x3f,0xc0,0x3f,0xc0,0x3f,
;0xe0,0x1f,0xe0,0x1f,0xe0,0x1f,
;
;0xf0,0x0f,0xf0,0x0f,0xf0,0x0f,
;0xf8,0x07,0xf8,0x07,0xf8,0x07,
;0xfc,0x03,0xfc,0x03,0xfc,0x03,
;0xfe,0x01,0xfe,0x01,0xfe,0x01,
;
;};
;//==========================
;#define number_byte_array_flashing8 6*16
;////////////////////////
;flash unsigned char array_blinking[]={
;// Chay 1 Led
;0x00,0x00,0x00,0x00,0x00,0x00,
;0xff,0xff,0xff,0xff,0xff,0xff,
;};
;#define number_byte_array_blinking 6*2
;////////////////////////
;
;
;
;
;
;
;
;
;
;
;#include <sub_program.c>
;
;void sw_spi_send(unsigned char val) {
; 0000 0023 void sw_spi_send(unsigned char val) {

	.CSEG
_sw_spi_send:
;  unsigned char i;
;//  for (i = 0; i < 8; i++) {
;//    DIN_PORT.DIN_PIN=val&0x80;
;//    val<<=1;
;//    rising_edge(CLK_PORT,CLK_PIN);
;//  }
;
; for(i=8;i>0;i--)
	ST   -Y,R26
	ST   -Y,R17
;	val -> Y+1
;	i -> R17
	LDI  R17,LOW(8)
_0x8:
	CPI  R17,1
	BRLO _0x9
; {
;    DIN_PORT.DIN_PIN= (val>>(i-1))&(0x01);// select each bit of data from high to low
	MOV  R30,R17
	SUBI R30,LOW(1)
	LDD  R26,Y+1
	RCALL __LSRB12
	ANDI R30,LOW(0x1)
	BRNE _0xA
	CBI  0x18,3
	RJMP _0xB
_0xA:
	SBI  0x18,3
_0xB:
;    rising_edge(CLK_PORT,CLK_PIN);
	CBI  0x18,5
	RCALL SUBOPT_0x0
	SBI  0x18,5
; }
	SUBI R17,1
	RJMP _0x8
_0x9:
;}
	LDD  R17,Y+0
	RJMP _0x2080003
;
;//=================================
;void lcd_string_shift(unsigned char row,)
;{
_lcd_string_shift:
;    int  shift;
;    if(j>=25)
	ST   -Y,R26
	RCALL __SAVELOCR2
;	row -> Y+2
;	shift -> R16,R17
	LDI  R30,LOW(25)
	LDI  R31,HIGH(25)
	CP   R10,R30
	CPC  R11,R31
	BRLO _0xF
;    {
;      tem_save=str_main[0];
	LDS  R5,_str_main
;      for(shift=0;shift<=(str_size-2);shift++)
	__GETWRN 16,17,0
_0x11:
	RCALL SUBOPT_0x1
	SBIW R30,2
	CP   R30,R16
	CPC  R31,R17
	BRLT _0x12
;      {
;        if(shift<=lcd_size-1)
	LDS  R30,_lcd_size
	LDS  R31,_lcd_size+1
	SBIW R30,1
	CP   R30,R16
	CPC  R31,R17
	BRLT _0x13
;        {
;            shift_screen[shift]=str_main[shift];
	MOVW R30,R16
	SUBI R30,LOW(-_shift_screen)
	SBCI R31,HIGH(-_shift_screen)
	MOVW R0,R30
	LDI  R26,LOW(_str_main)
	LDI  R27,HIGH(_str_main)
	ADD  R26,R16
	ADC  R27,R17
	LD   R30,X
	MOVW R26,R0
	ST   X,R30
;            lcd_gotoxy(shift,row);
	ST   -Y,R16
	LDD  R26,Y+3
	RCALL _lcd_gotoxy
;            lcd_putchar(shift_screen[shift]);
	LDI  R26,LOW(_shift_screen)
	LDI  R27,HIGH(_shift_screen)
	ADD  R26,R16
	ADC  R27,R17
	LD   R26,X
	RCALL _lcd_putchar
;        }
;        str_main[shift]= str_main[shift+1];
_0x13:
	MOVW R26,R16
	SUBI R26,LOW(-_str_main)
	SBCI R27,HIGH(-_str_main)
	MOVW R30,R16
	__ADDW1MN _str_main,1
	LD   R30,Z
	ST   X,R30
;      }
	__ADDWRN 16,17,1
	RJMP _0x11
_0x12:
;      str_main[str_size-1]=tem_save;
	RCALL SUBOPT_0x1
	SBIW R30,1
	SUBI R30,LOW(-_str_main)
	SBCI R31,HIGH(-_str_main)
	ST   Z,R5
;      j=0;
	CLR  R10
	CLR  R11
;    }
;}
_0xF:
	RCALL __LOADLOCR2
	RJMP _0x2080002
;
;
;void bmmb(void)
;{
_bmmb:
;
;    for (row_index=0; row_index < number_byte_array_bmmb; row_index+=6)
	RCALL SUBOPT_0x2
_0x15:
	RCALL SUBOPT_0x3
	CPI  R26,LOW(0x126)
	LDI  R30,HIGH(0x126)
	CPC  R27,R30
	BRSH _0x16
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x18:
	RCALL SUBOPT_0x5
	BRSH _0x19
;        {
;            sw_spi_send(array_bmmb[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_bmmb*2)
	SBCI R31,HIGH(-_array_bmmb*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x1A
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x1A:
	SBRS R2,0
	RJMP _0x1B
	LDI  R30,LOW(1)
	RJMP _0x1C
_0x1B:
	LDI  R30,LOW(0)
_0x1C:
	CPI  R30,0
	BRNE _0x1E
	CBI  0x18,1
	RJMP _0x1F
_0x1E:
	SBI  0x18,1
_0x1F:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x18
_0x19:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(100);
	LDI  R26,LOW(100)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x15
_0x16:
;
;}
	RET
;
;void bmbm(void)
;{
_bmbm:
;
;    for (row_index=0; row_index < number_byte_array_bmbm; row_index+=6)
	RCALL SUBOPT_0x2
_0x24:
	RCALL SUBOPT_0x3
	CPI  R26,LOW(0x126)
	LDI  R30,HIGH(0x126)
	CPC  R27,R30
	BRSH _0x25
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x27:
	RCALL SUBOPT_0x5
	BRSH _0x28
;        {
;            sw_spi_send(array_bmbm[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_bmbm*2)
	SBCI R31,HIGH(-_array_bmbm*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x29
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x29:
	SBRS R2,0
	RJMP _0x2A
	LDI  R30,LOW(1)
	RJMP _0x2B
_0x2A:
	LDI  R30,LOW(0)
_0x2B:
	CPI  R30,0
	BRNE _0x2D
	CBI  0x18,1
	RJMP _0x2E
_0x2D:
	SBI  0x18,1
_0x2E:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x27
_0x28:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(20);
	LDI  R26,LOW(20)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x24
_0x25:
;
;}
	RET
;
;
;void flashing(void)
;{
_flashing:
;
;    for (row_index=0; row_index < number_byte_array_flashing; row_index+=6)
	RCALL SUBOPT_0x2
_0x33:
	RCALL SUBOPT_0x3
	SBIW R26,12
	BRSH _0x34
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x36:
	RCALL SUBOPT_0x5
	BRSH _0x37
;        {
;            sw_spi_send(array_flashing[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing*2)
	SBCI R31,HIGH(-_array_flashing*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x38
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x38:
	SBRS R2,0
	RJMP _0x39
	LDI  R30,LOW(1)
	RJMP _0x3A
_0x39:
	LDI  R30,LOW(0)
_0x3A:
	CPI  R30,0
	BRNE _0x3C
	CBI  0x18,1
	RJMP _0x3D
_0x3C:
	SBI  0x18,1
_0x3D:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x36
_0x37:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(200);
	LDI  R26,LOW(200)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x33
_0x34:
;
;}
	RET
;
;void flashing2(void)
;{
_flashing2:
;
;    for (row_index=0; row_index < number_byte_array_flashing2; row_index+=6)
	RCALL SUBOPT_0x2
_0x42:
	RCALL SUBOPT_0x3
	SBIW R26,18
	BRSH _0x43
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x45:
	RCALL SUBOPT_0x5
	BRSH _0x46
;        {
;            sw_spi_send(array_flashing2[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing2*2)
	SBCI R31,HIGH(-_array_flashing2*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x47
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x47:
	SBRS R2,0
	RJMP _0x48
	LDI  R30,LOW(1)
	RJMP _0x49
_0x48:
	LDI  R30,LOW(0)
_0x49:
	CPI  R30,0
	BRNE _0x4B
	CBI  0x18,1
	RJMP _0x4C
_0x4B:
	SBI  0x18,1
_0x4C:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x45
_0x46:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(200);
	LDI  R26,LOW(200)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x42
_0x43:
;
;}
	RET
;void flashing3(void)
;{
_flashing3:
;
;    for (row_index=0; row_index < number_byte_array_flashing3; row_index+=6)
	RCALL SUBOPT_0x2
_0x51:
	RCALL SUBOPT_0x3
	SBIW R26,36
	BRSH _0x52
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x54:
	RCALL SUBOPT_0x5
	BRSH _0x55
;        {
;            sw_spi_send(array_flashing3[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing3*2)
	SBCI R31,HIGH(-_array_flashing3*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x56
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x56:
	SBRS R2,0
	RJMP _0x57
	LDI  R30,LOW(1)
	RJMP _0x58
_0x57:
	LDI  R30,LOW(0)
_0x58:
	CPI  R30,0
	BRNE _0x5A
	CBI  0x18,1
	RJMP _0x5B
_0x5A:
	SBI  0x18,1
_0x5B:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x54
_0x55:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(150);
	LDI  R26,LOW(150)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x51
_0x52:
;
;}
	RET
;
;void flashing4(void)
;{
_flashing4:
;
;    for (row_index=0; row_index < number_byte_array_flashing4; row_index+=6)
	RCALL SUBOPT_0x2
_0x60:
	RCALL SUBOPT_0x3
	SBIW R26,48
	BRSH _0x61
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x63:
	RCALL SUBOPT_0x5
	BRSH _0x64
;        {
;            sw_spi_send(array_flashing4[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing4*2)
	SBCI R31,HIGH(-_array_flashing4*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x65
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x65:
	SBRS R2,0
	RJMP _0x66
	LDI  R30,LOW(1)
	RJMP _0x67
_0x66:
	LDI  R30,LOW(0)
_0x67:
	CPI  R30,0
	BRNE _0x69
	CBI  0x18,1
	RJMP _0x6A
_0x69:
	SBI  0x18,1
_0x6A:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x63
_0x64:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(100);
	LDI  R26,LOW(100)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x60
_0x61:
;
;}
	RET
;void flashing6(void)
;{
_flashing6:
;
;    for (row_index=0; row_index < number_byte_array_flashing6; row_index+=6)
	RCALL SUBOPT_0x2
_0x6F:
	RCALL SUBOPT_0x3
	CPI  R26,LOW(0x48)
	LDI  R30,HIGH(0x48)
	CPC  R27,R30
	BRSH _0x70
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x72:
	RCALL SUBOPT_0x5
	BRSH _0x73
;        {
;            sw_spi_send(array_flashing6[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing6*2)
	SBCI R31,HIGH(-_array_flashing6*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x74
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x74:
	SBRS R2,0
	RJMP _0x75
	LDI  R30,LOW(1)
	RJMP _0x76
_0x75:
	LDI  R30,LOW(0)
_0x76:
	CPI  R30,0
	BRNE _0x78
	CBI  0x18,1
	RJMP _0x79
_0x78:
	SBI  0x18,1
_0x79:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x72
_0x73:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(50);
	LDI  R26,LOW(50)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x6F
_0x70:
;
;}
	RET
;void flashing8(void)
;{
_flashing8:
;
;    for (row_index=0; row_index < number_byte_array_flashing8; row_index+=6)
	RCALL SUBOPT_0x2
_0x7E:
	RCALL SUBOPT_0x3
	CPI  R26,LOW(0x60)
	LDI  R30,HIGH(0x60)
	CPC  R27,R30
	BRSH _0x7F
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x81:
	RCALL SUBOPT_0x5
	BRSH _0x82
;        {
;            sw_spi_send(array_flashing8[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_flashing8*2)
	SBCI R31,HIGH(-_array_flashing8*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x83
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x83:
	SBRS R2,0
	RJMP _0x84
	LDI  R30,LOW(1)
	RJMP _0x85
_0x84:
	LDI  R30,LOW(0)
_0x85:
	CPI  R30,0
	BRNE _0x87
	CBI  0x18,1
	RJMP _0x88
_0x87:
	SBI  0x18,1
_0x88:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x81
_0x82:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(30);
	LDI  R26,LOW(30)
	RCALL SUBOPT_0xB
;    }
	RCALL SUBOPT_0xC
	RJMP _0x7E
_0x7F:
;
;}
	RET
;void blinking(void)
;{
_blinking:
;
;    for (row_index=0; row_index < number_byte_array_blinking; row_index+=6)
	RCALL SUBOPT_0x2
_0x8D:
	RCALL SUBOPT_0x3
	SBIW R26,12
	BRSH _0x8E
;    {
;        for (colum_index = 0;colum_index<6;colum_index++)
	RCALL SUBOPT_0x4
_0x90:
	RCALL SUBOPT_0x5
	BRSH _0x91
;        {
;            sw_spi_send(array_blinking[row_index+colum_index]);
	RCALL SUBOPT_0x6
	SUBI R30,LOW(-_array_blinking*2)
	SBCI R31,HIGH(-_array_blinking*2)
	RCALL SUBOPT_0x7
;            if(run>=lcd_time)
	BRLO _0x92
;            {
;                lcd_string_shift(0);
	RCALL SUBOPT_0x8
;                run=0;
;                a=~a;
;            }
;            LED=a?1:0;
_0x92:
	SBRS R2,0
	RJMP _0x93
	LDI  R30,LOW(1)
	RJMP _0x94
_0x93:
	LDI  R30,LOW(0)
_0x94:
	CPI  R30,0
	BRNE _0x96
	CBI  0x18,1
	RJMP _0x97
_0x96:
	SBI  0x18,1
_0x97:
;        }
	RCALL SUBOPT_0x9
	RJMP _0x90
_0x91:
;        falling_edge(LATCH_PORT, LATCH_PIN);
	RCALL SUBOPT_0xA
	CBI  0x18,2
;        delay_ms(300);
	LDI  R26,LOW(300)
	LDI  R27,HIGH(300)
	RCALL _delay_ms
;    }
	RCALL SUBOPT_0xC
	RJMP _0x8D
_0x8E:
;
;}
	RET
;
;/*********************************
;//Subroutine recording CGRAM character on the LCD
;// function used to define user characters
;*************************************/
;void define_char(flash unsigned char *pc,unsigned char char_code)
;{
_define_char:
;char i,address;
;address=(char_code<<3)|0x40;
	ST   -Y,R26
	RCALL __SAVELOCR2
;	*pc -> Y+3
;	char_code -> Y+2
;	i -> R17
;	address -> R16
	LDD  R30,Y+2
	LSL  R30
	LSL  R30
	LSL  R30
	ORI  R30,0x40
	MOV  R16,R30
;for (i=0; i<8; i++) lcd_write_byte(address++,*pc++);
	LDI  R17,LOW(0)
_0x9C:
	CPI  R17,8
	BRSH _0x9D
	ST   -Y,R16
	INC  R16
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	ADIW R30,1
	STD  Y+4,R30
	STD  Y+4+1,R31
	SBIW R30,1
	LPM  R26,Z
	RCALL _lcd_write_byte
	SUBI R17,-1
	RJMP _0x9C
_0x9D:
	RCALL __LOADLOCR2
	ADIW R28,5
	RET
;
;#include <sub_interrupt.c>
;/***********************************
;Timer 0 oveflow interrupt
;Check keypad
;**********************************/
;/***********************************
;Timer 2 oveflow interrupt
;**********************************/
;interrupt [TIM2_OVF] void timer2_ovf_isr(void)
; 0000 0024 {
_timer2_ovf_isr:
	ST   -Y,R0
	ST   -Y,R1
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
;    // Place your code here
;    i++;
	MOVW R30,R6
	ADIW R30,1
	MOVW R6,R30
;    c++;
	MOVW R30,R8
	ADIW R30,1
	MOVW R8,R30
;    j++;
	MOVW R30,R10
	ADIW R30,1
	MOVW R10,R30
;    run++;
	MOVW R30,R12
	ADIW R30,1
	MOVW R12,R30
;    blink_counter++;
	LDI  R26,LOW(_blink_counter)
	LDI  R27,HIGH(_blink_counter)
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
;
;    if(blink_counter<=timer)
	RCALL SUBOPT_0xD
	RCALL SUBOPT_0xE
	BRLO _0x9E
;    {
;        hu=0;
	LDI  R30,LOW(0)
	STS  _hu,R30
	STS  _hu+1,R30
;    }
;    else if (blink_counter<=timer*2)
	RJMP _0x9F
_0x9E:
	RCALL SUBOPT_0xD
	LSL  R30
	ROL  R31
	RCALL SUBOPT_0xE
	BRLO _0xA0
;    {
;        hu=1;
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*3)
	RJMP _0xA1
_0xA0:
	RCALL SUBOPT_0xD
	LDI  R26,LOW(3)
	LDI  R27,HIGH(3)
	RCALL SUBOPT_0x10
	BRLO _0xA2
;    {
;        hu=2;
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*4)
	RJMP _0xA3
_0xA2:
	RCALL SUBOPT_0xD
	RCALL __LSLW2
	RCALL SUBOPT_0xE
	BRLO _0xA4
;    {
;        hu=3;
	LDI  R30,LOW(3)
	LDI  R31,HIGH(3)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*5)
	RJMP _0xA5
_0xA4:
	RCALL SUBOPT_0xD
	LDI  R26,LOW(5)
	LDI  R27,HIGH(5)
	RCALL SUBOPT_0x10
	BRLO _0xA6
;    {
;        hu=4;
	LDI  R30,LOW(4)
	LDI  R31,HIGH(4)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*6)
	RJMP _0xA7
_0xA6:
	RCALL SUBOPT_0xD
	LDI  R26,LOW(6)
	LDI  R27,HIGH(6)
	RCALL SUBOPT_0x10
	BRLO _0xA8
;    {
;        hu=5;
	LDI  R30,LOW(5)
	LDI  R31,HIGH(5)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*7)
	RJMP _0xA9
_0xA8:
	RCALL SUBOPT_0xD
	LDI  R26,LOW(7)
	LDI  R27,HIGH(7)
	RCALL SUBOPT_0x10
	BRLO _0xAA
;    {
;        hu=6;
	LDI  R30,LOW(6)
	LDI  R31,HIGH(6)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*8)
	RJMP _0xAB
_0xAA:
	RCALL SUBOPT_0xD
	RCALL __LSLW3
	RCALL SUBOPT_0xE
	BRLO _0xAC
;    {
;        hu=7;
	LDI  R30,LOW(7)
	LDI  R31,HIGH(7)
	RCALL SUBOPT_0xF
;    }
;    else if (blink_counter<=timer*9)
	RJMP _0xAD
_0xAC:
	RCALL SUBOPT_0xD
	LDI  R26,LOW(9)
	LDI  R27,HIGH(9)
	RCALL SUBOPT_0x10
	BRLO _0xAE
;    {
;        hu=8;
	LDI  R30,LOW(8)
	LDI  R31,HIGH(8)
	RCALL SUBOPT_0xF
;    }
;    else blink_counter=0;
	RJMP _0xAF
_0xAE:
	LDI  R30,LOW(0)
	STS  _blink_counter,R30
	STS  _blink_counter+1,R30
;
;}
_0xAF:
_0xAD:
_0xAB:
_0xA9:
_0xA7:
_0xA5:
_0xA3:
_0xA1:
_0x9F:
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R1,Y+
	LD   R0,Y+
	RETI
;
;void main(void)
; 0000 0027 {
_main:
; 0000 0028 
; 0000 0029 // Declare your local variables here
; 0000 002A 
; 0000 002B // Input/Output Ports initialization
; 0000 002C // Port B initialization
; 0000 002D PORTB=0x00;
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 002E DDRB=0xef;
	LDI  R30,LOW(239)
	OUT  0x17,R30
; 0000 002F 
; 0000 0030 // Port C initialization
; 0000 0031 PORTC=0x00;
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 0032 DDRC=0xff;
	LDI  R30,LOW(255)
	OUT  0x14,R30
; 0000 0033 
; 0000 0034 // Port D initialization
; 0000 0035 PORTD=0x00;
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 0036 DDRD=0xff;
	LDI  R30,LOW(255)
	OUT  0x11,R30
; 0000 0037 
; 0000 0038 // Timer/Counter 0 initialization
; 0000 0039 // Clock source: System Clock
; 0000 003A // Clock value: Timer 0 Stopped
; 0000 003B //TCCR0|=(1<<CS01);
; 0000 003C //TCNT0=0x00;
; 0000 003D 
; 0000 003E // Timer/Counter 1 initialization
; 0000 003F // Clock source: System Clock
; 0000 0040 // Clock value: 250.000 kHz
; 0000 0041 // Mode: Fast PWM top=ICR1
; 0000 0042 // OC1A output: Toggle
; 0000 0043 // OC1B output: Toggle
; 0000 0044 // Noise Canceler: Off
; 0000 0045 // Input Capture on Falling Edge
; 0000 0046 // Timer1 Overflow Interrupt: Off
; 0000 0047 // Input Capture Interrupt: Off
; 0000 0048 // Compare A Match Interrupt: Off
; 0000 0049 // Compare B Match Interrupt: Off
; 0000 004A //TCCR1A|=(1<<COM1A1)|(1<<COM1B1)|(1<<WGM11);
; 0000 004B //TCCR1B|=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10);
; 0000 004C //TCCR1A=0x00;
; 0000 004D //TCCR1B=0x00;
; 0000 004E //TCNT1H=0x00;
; 0000 004F //TCNT1L=0x00;
; 0000 0050 //ICR1=20000;
; 0000 0051 //OCR1A=2000;
; 0000 0052 //OCR1B=2000;
; 0000 0053 
; 0000 0054 // Timer/Counter 2 initialization
; 0000 0055 // Clock source: System Clock
; 0000 0056 // Clock value: Timer2 Stopped
; 0000 0057 // Mode: Normal top=0xFF
; 0000 0058 // OC2 output: Disconnected
; 0000 0059 
; 0000 005A ASSR=0x00;
	LDI  R30,LOW(0)
	OUT  0x22,R30
; 0000 005B //TCCR2|=(1<<CS21)|(1<<CS20);
; 0000 005C TCCR2|=(1<<CS22);
	IN   R30,0x25
	ORI  R30,4
	OUT  0x25,R30
; 0000 005D TCNT2=0x00;
	LDI  R30,LOW(0)
	OUT  0x24,R30
; 0000 005E OCR2=0x00;
	OUT  0x23,R30
; 0000 005F 
; 0000 0060 // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 0061 TIMSK|=(1<<TOIE0)|(1<<TOIE2);
	IN   R30,0x39
	ORI  R30,LOW(0x41)
	OUT  0x39,R30
; 0000 0062 
; 0000 0063 // ADC initialization
; 0000 0064 // ADC disabled
; 0000 0065 ADCSRA=0x00;
	LDI  R30,LOW(0)
	OUT  0x6,R30
; 0000 0066 
; 0000 0067 // TWI initialization
; 0000 0068 // TWI disabled
; 0000 0069 TWCR=0x00;
	OUT  0x36,R30
; 0000 006A /*
; 0000 006B //SPI
; 0000 006C SPCR |= ((1<<SPE) | (1<<MSTR) | (0<<DORD) | (1<<CPOL) | (1<<CPHA)| (1<<SPR1)|(1<<SPR0));
; 0000 006D // Set SPI clock rate to FCPU/2.
; 0000 006E SPSR |= (1<<SPI2X);
; 0000 006F */
; 0000 0070 lcd_clear();
	RCALL _lcd_clear
; 0000 0071 lcd_init(16);
	LDI  R26,LOW(16)
	RCALL _lcd_init
; 0000 0072 lcd_gotoxy(0,1);
	LDI  R30,LOW(0)
	ST   -Y,R30
	LDI  R26,LOW(1)
	RCALL _lcd_gotoxy
; 0000 0073 
; 0000 0074 lcd_putchar(0x00);
	RCALL SUBOPT_0x11
; 0000 0075 lcd_putchar(0x00);
	RCALL SUBOPT_0x11
; 0000 0076 lcd_puts(" I Love You ");
	__POINTW2MN _0xB0,0
	RCALL _lcd_puts
; 0000 0077 lcd_putchar(0x00);
	RCALL SUBOPT_0x11
; 0000 0078 lcd_putchar(0x00);
	RCALL SUBOPT_0x11
; 0000 0079 
; 0000 007A //Subroutine call recording CGRAM character on the LCD
; 0000 007B define_char(character_0,0x00);
	LDI  R30,LOW(_character_0*2)
	LDI  R31,HIGH(_character_0*2)
	RCALL SUBOPT_0x12
	LDI  R26,LOW(0)
	RCALL _define_char
; 0000 007C define_char(character_1,0x01);
	LDI  R30,LOW(_character_1*2)
	LDI  R31,HIGH(_character_1*2)
	RCALL SUBOPT_0x12
	LDI  R26,LOW(1)
	RCALL _define_char
; 0000 007D define_char(character_2,0x02);
	LDI  R30,LOW(_character_2*2)
	LDI  R31,HIGH(_character_2*2)
	RCALL SUBOPT_0x12
	LDI  R26,LOW(2)
	RCALL _define_char
; 0000 007E define_char(character_3,0x03);
	LDI  R30,LOW(_character_3*2)
	LDI  R31,HIGH(_character_3*2)
	RCALL SUBOPT_0x12
	LDI  R26,LOW(3)
	RCALL _define_char
; 0000 007F define_char(character_4,0x04);
	LDI  R30,LOW(_character_4*2)
	LDI  R31,HIGH(_character_4*2)
	RCALL SUBOPT_0x12
	LDI  R26,LOW(4)
	RCALL _define_char
; 0000 0080 //define_char(character_5,0x05);
; 0000 0081 
; 0000 0082 str_size = strlen(str_main);
	LDI  R26,LOW(_str_main)
	LDI  R27,HIGH(_str_main)
	RCALL _strlen
	STS  _str_size,R30
	STS  _str_size+1,R31
; 0000 0083 #asm("sei")
	sei
; 0000 0084 
; 0000 0085     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 0086     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 0087     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 0088     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 0089     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 008A     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 008B     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 008C     sw_spi_send(0x00);
	RCALL SUBOPT_0x13
; 0000 008D     rising_edge(LATCH_PORT, LATCH_PIN);
	CBI  0x18,2
	RCALL SUBOPT_0x0
	SBI  0x18,2
; 0000 008E     delay_ms(10);
	LDI  R26,LOW(10)
	RCALL SUBOPT_0xB
; 0000 008F 
; 0000 0090 
; 0000 0091 while (1)
_0xB4:
; 0000 0092 {
; 0000 0093 
; 0000 0094     // Place your code here
; 0000 0095     timer=7000;
	LDI  R30,LOW(7000)
	LDI  R31,HIGH(7000)
	STS  _timer,R30
	STS  _timer+1,R31
; 0000 0096     switch (hu) {
	LDS  R30,_hu
	LDS  R31,_hu+1
; 0000 0097     case 0:
	SBIW R30,0
	BRNE _0xBA
; 0000 0098         blinking();
	RCALL _blinking
; 0000 0099     break;
	RJMP _0xB9
; 0000 009A     case 1:
_0xBA:
	CPI  R30,LOW(0x1)
	LDI  R26,HIGH(0x1)
	CPC  R31,R26
	BRNE _0xBB
; 0000 009B         bmbm();
	RCALL _bmbm
; 0000 009C     break;
	RJMP _0xB9
; 0000 009D     case 2:
_0xBB:
	CPI  R30,LOW(0x2)
	LDI  R26,HIGH(0x2)
	CPC  R31,R26
	BRNE _0xBC
; 0000 009E         flashing();
	RCALL _flashing
; 0000 009F     break;
	RJMP _0xB9
; 0000 00A0     case 3:
_0xBC:
	CPI  R30,LOW(0x3)
	LDI  R26,HIGH(0x3)
	CPC  R31,R26
	BRNE _0xBD
; 0000 00A1         flashing2();
	RCALL _flashing2
; 0000 00A2     break;
	RJMP _0xB9
; 0000 00A3     case 4:
_0xBD:
	CPI  R30,LOW(0x4)
	LDI  R26,HIGH(0x4)
	CPC  R31,R26
	BRNE _0xBE
; 0000 00A4         flashing3();
	RCALL _flashing3
; 0000 00A5     break;
	RJMP _0xB9
; 0000 00A6     case 5:
_0xBE:
	CPI  R30,LOW(0x5)
	LDI  R26,HIGH(0x5)
	CPC  R31,R26
	BRNE _0xBF
; 0000 00A7         flashing4();
	RCALL _flashing4
; 0000 00A8     break;
	RJMP _0xB9
; 0000 00A9     case 6:
_0xBF:
	CPI  R30,LOW(0x6)
	LDI  R26,HIGH(0x6)
	CPC  R31,R26
	BRNE _0xC0
; 0000 00AA         flashing6();
	RCALL _flashing6
; 0000 00AB     break;
	RJMP _0xB9
; 0000 00AC     case 7:
_0xC0:
	CPI  R30,LOW(0x7)
	LDI  R26,HIGH(0x7)
	CPC  R31,R26
	BRNE _0xC1
; 0000 00AD         flashing8();
	RCALL _flashing8
; 0000 00AE     break;
	RJMP _0xB9
; 0000 00AF     case 8:
_0xC1:
	CPI  R30,LOW(0x8)
	LDI  R26,HIGH(0x8)
	CPC  R31,R26
	BRNE _0xC3
; 0000 00B0         bmmb();
	RCALL _bmmb
; 0000 00B1     break;
; 0000 00B2     default:
_0xC3:
; 0000 00B3     };
_0xB9:
; 0000 00B4 
; 0000 00B5 
; 0000 00B6 //    if(hu==0)
; 0000 00B7 //    {
; 0000 00B8 //        blinking();
; 0000 00B9 //    }
; 0000 00BA //    else if (hu==1)
; 0000 00BB //    {
; 0000 00BC //        bmbm();
; 0000 00BD //    }
; 0000 00BE //    else if (hu==2)
; 0000 00BF //    {
; 0000 00C0 //        flashing();
; 0000 00C1 //    }
; 0000 00C2 //    else if (hu==3)
; 0000 00C3 //    {
; 0000 00C4 //        bmmb();
; 0000 00C5 //    }
; 0000 00C6 //    else if (hu==4)
; 0000 00C7 //    {
; 0000 00C8 //        flashing2();
; 0000 00C9 //    }
; 0000 00CA //
; 0000 00CB //    flashing8();
; 0000 00CC 
; 0000 00CD }
	RJMP _0xB4
; 0000 00CE }
_0xC4:
	RJMP _0xC4

	.DSEG
_0xB0:
	.BYTE 0xD

	.CSEG
_strlen:
	ST   -Y,R27
	ST   -Y,R26
    ld   r26,y+
    ld   r27,y+
    clr  r30
    clr  r31
strlen0:
    ld   r22,x+
    tst  r22
    breq strlen1
    adiw r30,1
    rjmp strlen0
strlen1:
    ret
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.DSEG

	.CSEG
__lcd_write_nibble_G101:
	ST   -Y,R26
	LD   R30,Y
	ANDI R30,LOW(0x10)
	BREQ _0x2020004
	SBI  0x12,5
	RJMP _0x2020005
_0x2020004:
	CBI  0x12,5
_0x2020005:
	LD   R30,Y
	ANDI R30,LOW(0x20)
	BREQ _0x2020006
	SBI  0x12,4
	RJMP _0x2020007
_0x2020006:
	CBI  0x12,4
_0x2020007:
	LD   R30,Y
	ANDI R30,LOW(0x40)
	BREQ _0x2020008
	SBI  0x12,3
	RJMP _0x2020009
_0x2020008:
	CBI  0x12,3
_0x2020009:
	LD   R30,Y
	ANDI R30,LOW(0x80)
	BREQ _0x202000A
	SBI  0x12,2
	RJMP _0x202000B
_0x202000A:
	CBI  0x12,2
_0x202000B:
	__DELAY_USB 5
	SBI  0x12,6
	__DELAY_USB 13
	CBI  0x12,6
	__DELAY_USB 13
	RJMP _0x2080001
__lcd_write_data:
	ST   -Y,R26
	LD   R26,Y
	RCALL __lcd_write_nibble_G101
    ld    r30,y
    swap  r30
    st    y,r30
	LD   R26,Y
	RCALL __lcd_write_nibble_G101
	__DELAY_USB 133
	RJMP _0x2080001
_lcd_write_byte:
	ST   -Y,R26
	LDD  R26,Y+1
	RCALL __lcd_write_data
	RCALL SUBOPT_0x14
	RJMP _0x2080003
_lcd_gotoxy:
	ST   -Y,R26
	LD   R30,Y
	LDI  R31,0
	SUBI R30,LOW(-__base_y_G101)
	SBCI R31,HIGH(-__base_y_G101)
	LD   R30,Z
	LDD  R26,Y+1
	ADD  R26,R30
	RCALL __lcd_write_data
	LDD  R30,Y+1
	STS  __lcd_x,R30
	LD   R30,Y
	STS  __lcd_y,R30
_0x2080003:
	ADIW R28,2
	RET
_lcd_clear:
	LDI  R26,LOW(2)
	RCALL __lcd_write_data
	LDI  R26,LOW(3)
	RCALL SUBOPT_0xB
	LDI  R26,LOW(12)
	RCALL __lcd_write_data
	LDI  R26,LOW(1)
	RCALL __lcd_write_data
	LDI  R26,LOW(3)
	RCALL SUBOPT_0xB
	LDI  R30,LOW(0)
	STS  __lcd_y,R30
	STS  __lcd_x,R30
	RET
_lcd_putchar:
	ST   -Y,R26
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BREQ _0x2020011
	LDS  R30,__lcd_maxx
	LDS  R26,__lcd_x
	CP   R26,R30
	BRLO _0x2020010
_0x2020011:
	LDI  R30,LOW(0)
	ST   -Y,R30
	LDS  R26,__lcd_y
	SUBI R26,-LOW(1)
	STS  __lcd_y,R26
	RCALL _lcd_gotoxy
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BRNE _0x2020013
	RJMP _0x2080001
_0x2020013:
_0x2020010:
	LDS  R30,__lcd_x
	SUBI R30,-LOW(1)
	STS  __lcd_x,R30
	RCALL SUBOPT_0x14
	RJMP _0x2080001
_lcd_puts:
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
_0x2020014:
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	LD   R30,X+
	STD  Y+1,R26
	STD  Y+1+1,R27
	MOV  R17,R30
	CPI  R30,0
	BREQ _0x2020016
	MOV  R26,R17
	RCALL _lcd_putchar
	RJMP _0x2020014
_0x2020016:
	LDD  R17,Y+0
_0x2080002:
	ADIW R28,3
	RET
_lcd_init:
	ST   -Y,R26
	SBI  0x11,5
	SBI  0x11,4
	SBI  0x11,3
	SBI  0x11,2
	SBI  0x11,6
	SBI  0x17,0
	SBI  0x11,7
	CBI  0x12,6
	CBI  0x18,0
	CBI  0x12,7
	LD   R30,Y
	STS  __lcd_maxx,R30
	SUBI R30,-LOW(128)
	__PUTB1MN __base_y_G101,2
	LD   R30,Y
	SUBI R30,-LOW(192)
	__PUTB1MN __base_y_G101,3
	LDI  R26,LOW(20)
	RCALL SUBOPT_0xB
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x15
	LDI  R26,LOW(32)
	RCALL __lcd_write_nibble_G101
	__DELAY_USW 200
	LDI  R26,LOW(40)
	RCALL __lcd_write_data
	LDI  R26,LOW(4)
	RCALL __lcd_write_data
	LDI  R26,LOW(133)
	RCALL __lcd_write_data
	LDI  R26,LOW(6)
	RCALL __lcd_write_data
	RCALL _lcd_clear
_0x2080001:
	ADIW R28,1
	RET
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG

	.CSEG

	.DSEG
_shift_screen:
	.BYTE 0x14
_str_main:
	.BYTE 0x3B
_str_size:
	.BYTE 0x2
_lcd_size:
	.BYTE 0x2
_blink_counter:
	.BYTE 0x2
_timer:
	.BYTE 0x2
_hu:
	.BYTE 0x2
_lcd_time:
	.BYTE 0x2
_row_index:
	.BYTE 0x2
_colum_index:
	.BYTE 0x2
__base_y_G101:
	.BYTE 0x4
__lcd_x:
	.BYTE 0x1
__lcd_y:
	.BYTE 0x1
__lcd_maxx:
	.BYTE 0x1

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 11 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x0:
	LDI  R26,LOW(1)
	LDI  R27,0
	RJMP _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1:
	LDS  R30,_str_size
	LDS  R31,_str_size+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:30 WORDS
SUBOPT_0x2:
	LDI  R30,LOW(0)
	STS  _row_index,R30
	STS  _row_index+1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 18 TIMES, CODE SIZE REDUCTION:49 WORDS
SUBOPT_0x3:
	LDS  R26,_row_index
	LDS  R27,_row_index+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:30 WORDS
SUBOPT_0x4:
	LDI  R30,LOW(0)
	STS  _colum_index,R30
	STS  _colum_index+1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:30 WORDS
SUBOPT_0x5:
	LDS  R26,_colum_index
	LDS  R27,_colum_index+1
	SBIW R26,6
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:46 WORDS
SUBOPT_0x6:
	LDS  R30,_colum_index
	LDS  R31,_colum_index+1
	RCALL SUBOPT_0x3
	ADD  R30,R26
	ADC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:54 WORDS
SUBOPT_0x7:
	LPM  R26,Z
	RCALL _sw_spi_send
	LDS  R30,_lcd_time
	LDS  R31,_lcd_time+1
	CP   R12,R30
	CPC  R13,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:38 WORDS
SUBOPT_0x8:
	LDI  R26,LOW(0)
	RCALL _lcd_string_shift
	CLR  R12
	CLR  R13
	LDI  R30,LOW(1)
	EOR  R2,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:46 WORDS
SUBOPT_0x9:
	LDI  R26,LOW(_colum_index)
	LDI  R27,HIGH(_colum_index)
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0xA:
	SBI  0x18,2
	RJMP SUBOPT_0x0

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0xB:
	LDI  R27,0
	RJMP _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:62 WORDS
SUBOPT_0xC:
	LDS  R30,_row_index
	LDS  R31,_row_index+1
	ADIW R30,6
	STS  _row_index,R30
	STS  _row_index+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:22 WORDS
SUBOPT_0xD:
	LDS  R30,_timer
	LDS  R31,_timer+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:38 WORDS
SUBOPT_0xE:
	LDS  R26,_blink_counter
	LDS  R27,_blink_counter+1
	CP   R30,R26
	CPC  R31,R27
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:19 WORDS
SUBOPT_0xF:
	STS  _hu,R30
	STS  _hu+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x10:
	RCALL __MULW12
	RJMP SUBOPT_0xE

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x11:
	LDI  R26,LOW(0)
	RJMP _lcd_putchar

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x12:
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x13:
	LDI  R26,LOW(0)
	RJMP _sw_spi_send

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x14:
	SBI  0x18,0
	LD   R26,Y
	RCALL __lcd_write_data
	CBI  0x18,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x15:
	LDI  R26,LOW(48)
	RCALL __lcd_write_nibble_G101
	__DELAY_USW 200
	RET


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x7D0
	wdr
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__ANEGW1:
	NEG  R31
	NEG  R30
	SBCI R31,0
	RET

__LSRB12:
	TST  R30
	MOV  R0,R30
	MOV  R30,R26
	BREQ __LSRB12R
__LSRB12L:
	LSR  R30
	DEC  R0
	BRNE __LSRB12L
__LSRB12R:
	RET

__LSLW3:
	LSL  R30
	ROL  R31
__LSLW2:
	LSL  R30
	ROL  R31
	LSL  R30
	ROL  R31
	RET

__MULW12U:
	MUL  R31,R26
	MOV  R31,R0
	MUL  R30,R27
	ADD  R31,R0
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	RET

__MULW12:
	RCALL __CHKSIGNW
	RCALL __MULW12U
	BRTC __MULW121
	RCALL __ANEGW1
__MULW121:
	RET

__CHKSIGNW:
	CLT
	SBRS R31,7
	RJMP __CHKSW1
	RCALL __ANEGW1
	SET
__CHKSW1:
	SBRS R27,7
	RJMP __CHKSW2
	COM  R26
	COM  R27
	ADIW R26,1
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSW2:
	RET

__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

;END OF CODE MARKER
__END_OF_CODE:
