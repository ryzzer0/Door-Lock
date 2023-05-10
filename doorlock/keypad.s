;;;-----------------------------------------
;;; Start MC68HC12 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	C:\gcc-hcs12\usr\bin\..\lib\gcc-lib\m6811-elf\3.3.6-m68hc1x-20060122\cc1.exe -quiet -I./include -iprefix C:\gcc-hcs12\usr\bin\../lib/gcc-lib/m6811-elf\3.3.6-m68hc1x-20060122\ -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -D__mc68hc1x__ -D__mc68hc1x -D__HAVE_SHORT_INT__ -D__INT__=16 -Dmc6812 -DMC6812 -Dmc68hc12 keypad.c -quiet -dumpbase keypad.c -m68hc12 -mshort -auxbase keypad -O3 -std=c99 -fno-ident -fno-common -fomit-frame-pointer -o keypad.s
;;; Compiled:	Fri Apr 07 01:58:15 2023
;;; (META)compiled by GNU C version 3.3.2.
;;;-----------------------------------------
	.file	"keypad.c"
	.mode mshort
	.globl	KEYPAD_IGNORE
	.sect	.data
	.type	KEYPAD_IGNORE, @object
	.size	KEYPAD_IGNORE, 1
KEYPAD_IGNORE:
	.byte	0
	.globl	keypad_layout
	.section	.rodata
	.type	keypad_layout, @object
	.size	keypad_layout, 16
keypad_layout:
	.byte	49
	.byte	50
	.byte	51
	.byte	65
	.byte	52
	.byte	53
	.byte	54
	.byte	66
	.byte	55
	.byte	56
	.byte	57
	.byte	67
	.byte	42
	.byte	48
	.byte	35
	.byte	68
	.sect	.text
	.globl	KeypadReadPort
	.type	KeypadReadPort,@function
KeypadReadPort:
	leas	-3,sp
	ldab	KEYPAD_IGNORE
	cmpb	#1
	beq	.L19
	clr	1,sp
	xgdy
	clrb
	xgdy
.L13:
	movb	#-16,0
	xgdx
	tfr	y,d
	sex	b,d
	xgdx
	ldd	#16
	bsr	___lshlhi3
	comb
	stab	2,sp
	ldab	0
	andb	2,sp
	stab	0
	clr	0,sp
.L12:
	ldab	0
	andb	#15
	clra
	xgdx
	clra
	ldab	0,sp
	xgdx
	bsr	___ashrhi3
	anda	#0
	andb	#1
	tbeq	d,.L18
	inc	1,sp
	inc	0,sp
	ldab	0,sp
	cmpb	#3
	bls	.L12
	iny
	xgdy
	cmpb	#3
	xgdy
	ble	.L13
.L19:
	ldd	#255
.L1:
	leas	3,sp
	rts
.L18:
	movb	#1,KEYPAD_IGNORE
	ldy	#keypad_layout
	ldab	1,sp
	aby
	clra
	ldab	0,y
	bra	.L1
	.size	KeypadReadPort, .-KeypadReadPort
	.globl	EnableKeyboardAgain
	.type	EnableKeyboardAgain,@function
EnableKeyboardAgain:
	clr	KEYPAD_IGNORE
	rts
	.size	EnableKeyboardAgain, .-EnableKeyboardAgain
	.globl	DisableKeyboard
	.type	DisableKeyboard,@function
DisableKeyboard:
	movb	#1,KEYPAD_IGNORE
	rts
	.size	DisableKeyboard, .-DisableKeyboard
	.globl	KeypadInitPort
	.type	KeypadInitPort,@function
KeypadInitPort:
	ldy	#2
	bset	0,y, #-16
	bclr	0,y, #15
	bset	12, #1
	rts
	.size	KeypadInitPort, .-KeypadInitPort
