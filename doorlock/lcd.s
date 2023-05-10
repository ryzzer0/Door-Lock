;;;-----------------------------------------
;;; Start MC68HC12 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	C:\gcc-hcs12\usr\bin\..\lib\gcc-lib\m6811-elf\3.3.6-m68hc1x-20060122\cc1.exe -quiet -I./include -iprefix C:\gcc-hcs12\usr\bin\../lib/gcc-lib/m6811-elf\3.3.6-m68hc1x-20060122\ -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -D__mc68hc1x__ -D__mc68hc1x -D__HAVE_SHORT_INT__ -D__INT__=16 -Dmc6812 -DMC6812 -Dmc68hc12 lcd.c -quiet -dumpbase lcd.c -m68hc12 -mshort -auxbase lcd -O3 -std=c99 -fno-ident -fno-common -fomit-frame-pointer -o lcd.s
;;; Compiled:	Fri Apr 07 01:58:15 2023
;;; (META)compiled by GNU C version 3.3.2.
;;;-----------------------------------------
	.file	"lcd.c"
	.mode mshort
	.sect	.data
	.type	DispHorBar1, @object
	.size	DispHorBar1, 8
DispHorBar1:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.type	DispHorBar2, @object
	.size	DispHorBar2, 8
DispHorBar2:
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.type	DispHorBar3, @object
	.size	DispHorBar3, 8
DispHorBar3:
	.byte	28
	.byte	28
	.byte	28
	.byte	28
	.byte	28
	.byte	28
	.byte	28
	.byte	28
	.type	DispHorBar4, @object
	.size	DispHorBar4, 8
DispHorBar4:
	.byte	30
	.byte	30
	.byte	30
	.byte	30
	.byte	30
	.byte	30
	.byte	30
	.byte	30
	.type	DispHorBar5, @object
	.size	DispHorBar5, 8
DispHorBar5:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar1, @object
	.size	DispVertBar1, 8
DispVertBar1:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.type	DispVertBar2, @object
	.size	DispVertBar2, 8
DispVertBar2:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	31
	.type	DispVertBar3, @object
	.size	DispVertBar3, 8
DispVertBar3:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar4, @object
	.size	DispVertBar4, 8
DispVertBar4:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar5, @object
	.size	DispVertBar5, 8
DispVertBar5:
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar6, @object
	.size	DispVertBar6, 8
DispVertBar6:
	.byte	0
	.byte	0
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar7, @object
	.size	DispVertBar7, 8
DispVertBar7:
	.byte	0
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.type	DispVertBar8, @object
	.size	DispVertBar8, 8
DispVertBar8:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	; extern	busy_loop_delay
	; extern	DispCursorSet
	; extern	DispDataWr
	.sect	.text
	.globl	DispClrLine
	.type	DispClrLine,@function
DispClrLine:
	pshx
	stab	0,sp
	cmpb	DispMaxRows
	blo	.L19
.L1:
	pulx
	rts
.L19:
	clrb
	pshb
	des
	ldab	2,sp
	bsr	DispCursorSet
	leas	2,sp
	bset	50, #1
	clr	1,sp
	clrb
	cmpb	DispMaxCols
	blo	.L15
.L18:
	clrb
	pshb
	des
	ldab	2,sp
	bsr	DispCursorSet
	leas	2,sp
	bra	.L1
.L15:
	bclr	50, #-2
	bset	50, #8
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	inc	1,sp
	ldab	1,sp
	cmpb	DispMaxCols
	blo	.L15
	bra	.L18
	.size	DispClrLine, .-DispClrLine
	.globl	DispCursorSet
	.type	DispCursorSet,@function
DispCursorSet:
	leas	-37,sp
	stab	36,sp
	bclr	50, #1
	clra
	ldab	36,sp
	cpd	#1
	beq	.L42
	ble	.L61
	cpd	#2
	beq	.L47
	cpd	#3
	beq	.L52
.L20:
	leas	37,sp
	rts
.L52:
	ldab	40,sp
	addb	DispMaxCols
	addb	#-64
	stab	31,sp
	bclr	50, #-2
	ldab	31,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	32,sp
	ldab	50
	orab	33,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	31,sp
	anda	#0
	andb	#15
	asld
	asld
	std	34,sp
	ldab	50
	orab	35,sp
.L60:
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	bra	.L20
.L47:
	ldab	40,sp
	addb	DispMaxCols
	addb	#-128
	stab	25,sp
	bclr	50, #-2
	ldab	25,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	26,sp
	ldab	50
	orab	27,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	25,sp
	anda	#0
	andb	#15
	asld
	asld
	std	28,sp
	ldab	50
	orab	29,sp
	bra	.L60
.L61:
	tbne	d,.L20
	ldab	DispMaxRows
	cmpb	#1
	beq	.L62
	ldab	40,sp
	addb	#-128
	stab	13,sp
	bclr	50, #-2
	ldab	13,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	14,sp
	ldab	50
	orab	15,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	13,sp
	anda	#0
	andb	#15
	asld
	asld
	std	16,sp
	ldab	50
	orab	17,sp
	bra	.L60
.L62:
	ldab	DispMaxCols
	lsrb
	stab	36,sp
	ldab	40,sp
	cmpb	36,sp
	bhs	.L27
	addb	#-128
	stab	1,sp
	bclr	50, #-2
	ldab	1,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	2,sp
	ldab	50
	orab	3,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	1,sp
	anda	#0
	andb	#15
	asld
	asld
	std	4,sp
	ldab	50
	orab	5,sp
	bra	.L60
.L27:
	ldab	40,sp
	subb	36,sp
	addb	#-64
	stab	7,sp
	bclr	50, #-2
	ldab	7,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	8,sp
	ldab	50
	orab	9,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	7,sp
	anda	#0
	andb	#15
	asld
	asld
	std	10,sp
	ldab	50
	orab	11,sp
	bra	.L60
.L42:
	ldab	40,sp
	addb	#-64
	stab	19,sp
	bclr	50, #-2
	ldab	19,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	20,sp
	ldab	50
	orab	21,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	19,sp
	anda	#0
	andb	#15
	asld
	asld
	std	22,sp
	ldab	50
	orab	23,sp
	bra	.L60
	.size	DispCursorSet, .-DispCursorSet
	.globl	DispHorBar
	.type	DispHorBar,@function
DispHorBar:
	leas	-15,sp
	stab	0,sp
	xgdx
	clra
	ldab	20,sp
	xgdx
	stx	4,sp
	ldy	#-13107
	tfr	x,d
	emul
	exg	x,y
	tfr	x,d
	lsrd
	lsrd
	stab	1,sp
	ldaa	#5
	mul
	stab	14,sp
	ldab	5,sp
	subb	14,sp
	stab	3,sp
	ldab	0,sp
	cmpb	DispMaxRows
	bhs	.L63
	xgdy
	clra
	ldab	1,sp
	xgdy
	ldab	18,sp
	aby
	dey
	clra
	ldab	DispMaxCols
	pshd
	cpy	2,sp+
	blt	.L85
.L63:
	leas	15,sp
	rts
.L85:
	ldab	18,sp
	pshb
	des
	ldab	2,sp
	bsr	DispCursorSet
	leas	2,sp
	bset	50, #1
	ldab	1,sp
	bne	.L76
.L84:
	ldab	3,sp
	beq	.L63
	bclr	50, #-2
	ldab	3,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	6,sp
	ldab	50
	orab	7,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	3,sp
	anda	#0
	andb	#15
	asld
	asld
	std	8,sp
	ldab	50
	orab	9,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	bra	.L63
.L76:
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #20
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldab	1,sp
	decb
	stab	1,sp
	bne	.L76
	bra	.L84
	.size	DispHorBar, .-DispHorBar
	.globl	DispVertBar
	.type	DispVertBar,@function
DispVertBar:
	leas	-7,sp
	stab	0,sp
	cmpb	DispMaxRows
	bhs	.L86
	ldab	10,sp
	cmpb	DispMaxCols
	blo	.L119
.L86:
	leas	7,sp
	rts
.L119:
	pshb
	des
	ldab	2,sp
	bsr	DispCursorSet
	leas	2,sp
	bset	50, #1
	clra
	ldab	12,sp
	beq	.L93
	cpd	#8
	bgt	.L110
	ldab	12,sp
	decb
	stab	2,sp
	bclr	50, #-2
	ldab	2,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	3,sp
	ldab	50
	orab	4,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	2,sp
	anda	#0
	andb	#15
	asld
	asld
	std	5,sp
	ldab	50
	orab	6,sp
.L118:
	stab	50
.L117:
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	bra	.L86
.L110:
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #28
	bra	.L117
.L93:
	bclr	50, #-2
	bset	50, #8
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	50
	bra	.L118
	.size	DispVertBar, .-DispVertBar
	.globl	DispStr
	.type	DispStr,@function
DispStr:
	leas	-8,sp
	stab	7,sp
	cmpb	DispMaxRows
	bhs	.L120
	ldab	11,sp
	cmpb	DispMaxCols
	blo	.L137
.L120:
	leas	8,sp
	rts
.L137:
	pshb
	des
	ldab	9,sp
	bsr	DispCursorSet
	leas	2,sp
	bset	50, #1
	ldab	11,sp
	stab	0,sp
	cmpb	DispMaxCols
	bhs	.L120
	ldy	12,sp
	ldab	0,y
	stab	6,sp
	beq	.L120
.L134:
	ldd	12,sp
	addd	#1
	std	12,sp
	bclr	50, #-2
	ldab	6,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	1,sp
	ldab	50
	orab	2,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	6,sp
	anda	#0
	andb	#15
	asld
	asld
	std	3,sp
	ldab	50
	orab	4,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	inc	0,sp
	ldab	0,sp
	cmpb	DispMaxCols
	bhs	.L120
	ldy	12,sp
	ldab	0,y
	stab	6,sp
	bne	.L134
	bra	.L120
	.size	DispStr, .-DispStr
	.globl	DispSel
	.type	DispSel,@function
DispSel:
	tbne	b,.L139
	bclr	50, #1
	rts
.L139:
	bset	50, #1
	rts
	.size	DispSel, .-DispSel
	.globl	DispLock
	.type	DispLock,@function
DispLock:
	rts
	.size	DispLock, .-DispLock
	.globl	DispUnlock
	.type	DispUnlock,@function
DispUnlock:
	rts
	.size	DispUnlock, .-DispUnlock
	.globl	DispDly_uS
	.type	DispDly_uS,@function
DispDly_uS:
	ldd	#10
	bsr	busy_loop_delay
	rts
	.size	DispDly_uS, .-DispDly_uS
	.globl	DispInitPort
	.type	DispInitPort,@function
DispInitPort:
	bset	51, #63
	rts
	.size	DispInitPort, .-DispInitPort
	.globl	DispChar
	.type	DispChar,@function
DispChar:
	leas	-5,sp
	stab	0,sp
	cmpb	DispMaxRows
	bhs	.L145
	ldab	8,sp
	cmpb	DispMaxCols
	blo	.L156
.L145:
	leas	5,sp
	rts
.L156:
	pshb
	des
	ldab	2,sp
	bsr	DispCursorSet
	leas	2,sp
	bset	50, #1
	bclr	50, #-2
	ldab	10,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	1,sp
	ldab	50
	orab	2,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	10,sp
	anda	#0
	andb	#15
	asld
	asld
	std	3,sp
	ldab	50
	orab	4,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	bra	.L145
	.size	DispChar, .-DispChar
	.globl	DispDataWr
	.type	DispDataWr,@function
DispDataWr:
	leas	-6,sp
	stab	1,sp
	bclr	50, #-2
	ldab	1,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	2,sp
	ldab	50
	orab	3,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	1,sp
	anda	#0
	andb	#15
	asld
	asld
	std	4,sp
	ldab	50
	orab	5,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	leas	6,sp
	rts
	.size	DispDataWr, .-DispDataWr
	.globl	DispDataWrOneNibble
	.type	DispDataWrOneNibble,@function
DispDataWrOneNibble:
	pshx
	bclr	50, #-2
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	0,sp
	ldab	50
	orab	1,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	pulx
	rts
	.size	DispDataWrOneNibble, .-DispDataWrOneNibble
	.globl	DispClrScr
	.type	DispClrScr,@function
DispClrScr:
	bclr	50, #1
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #4
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	rts
	.size	DispClrScr, .-DispClrScr
	.globl	DispDefChar
	.type	DispDefChar,@function
DispDefChar:
	leas	-13,sp
	bclr	50, #1
	clra
	asld
	asld
	asld
	addb	#64
	stab	2,sp
	bclr	50, #-2
	ldab	2,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	3,sp
	ldab	50
	orab	4,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	2,sp
	anda	#0
	andb	#8
	asld
	asld
	std	5,sp
	ldab	50
	orab	6,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	bset	50, #1
	clr	0,sp
.L194:
	ldy	15,sp
	movb	0,y,8,sp
	iny
	sty	15,sp
	bclr	50, #-2
	ldab	8,sp
	lsrb
	lsrb
	lsrb
	lsrb
	anda	#0
	andb	#15
	asld
	asld
	std	9,sp
	ldab	50
	orab	10,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	8,sp
	anda	#0
	andb	#15
	asld
	asld
	std	11,sp
	ldab	50
	orab	12,sp
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	inc	0,sp
	ldab	0,sp
	cmpb	#7
	bls	.L194
	leas	13,sp
	rts
	.size	DispDefChar, .-DispDefChar
	.globl	DispDummy
	.type	DispDummy,@function
DispDummy:
	rts
	.size	DispDummy, .-DispDummy
	.globl	DispHorBarInit
	.type	DispHorBarInit,@function
DispHorBarInit:
	movw	#DispHorBar1,2,-sp
	ldab	#1
	bsr	DispDefChar
	movw	#DispHorBar2,2,-sp
	ldab	#2
	bsr	DispDefChar
	movw	#DispHorBar3,2,-sp
	ldab	#3
	bsr	DispDefChar
	movw	#DispHorBar4,2,-sp
	ldab	#4
	bsr	DispDefChar
	movw	#DispHorBar5,2,-sp
	ldab	#5
	bsr	DispDefChar
	leas	10,sp
	rts
	.size	DispHorBarInit, .-DispHorBarInit
	.globl	DispVertBarInit
	.type	DispVertBarInit,@function
DispVertBarInit:
	movw	#DispVertBar1,2,-sp
	clrb
	bsr	DispDefChar
	movw	#DispVertBar2,2,-sp
	ldab	#1
	bsr	DispDefChar
	movw	#DispVertBar3,2,-sp
	ldab	#2
	bsr	DispDefChar
	movw	#DispVertBar4,2,-sp
	ldab	#3
	bsr	DispDefChar
	movw	#DispVertBar5,2,-sp
	ldab	#4
	bsr	DispDefChar
	movw	#DispVertBar6,2,-sp
	ldab	#5
	bsr	DispDefChar
	movw	#DispVertBar7,2,-sp
	ldab	#6
	bsr	DispDefChar
	movw	#DispVertBar8,2,-sp
	ldab	#7
	bsr	DispDefChar
	leas	16,sp
	rts
	.size	DispVertBarInit, .-DispVertBarInit
	.globl	DispInit
	.type	DispInit,@function
DispInit:
	bset	51, #63
	stab	DispMaxRows
	movb	3,sp,DispMaxCols
	bclr	50, #1
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #12
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #12
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #12
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #8
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #8
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #32
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #48
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #4
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	ldab	50
	stab	50
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #-2
	bset	50, #24
	bset	50, #2
	ldd	#10
	bsr	busy_loop_delay
	bclr	50, #2
	ldd	#10
	bsr	busy_loop_delay
	rts
	.size	DispInit, .-DispInit
	.local	DispMaxCols
	.comm	DispMaxCols,1,1
	.local	DispMaxRows
	.comm	DispMaxRows,1,1
