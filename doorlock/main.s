;;;-----------------------------------------
;;; Start MC68HC12 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	C:\gcc-hcs12\usr\bin\..\lib\gcc-lib\m6811-elf\3.3.6-m68hc1x-20060122\cc1.exe -quiet -I./include -iprefix C:\gcc-hcs12\usr\bin\../lib/gcc-lib/m6811-elf\3.3.6-m68hc1x-20060122\ -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -D__mc68hc1x__ -D__mc68hc1x -D__HAVE_SHORT_INT__ -D__INT__=16 -Dmc6812 -DMC6812 -Dmc68hc12 main.c -quiet -dumpbase main.c -m68hc12 -mshort -auxbase main -O3 -std=c99 -fno-ident -fno-common -fomit-frame-pointer -o main.s
;;; Compiled:	Fri Apr 07 01:58:15 2023
;;; (META)compiled by GNU C version 3.3.2.
;;;-----------------------------------------
	.file	"main.c"
	.mode mshort
	.globl	segment_decoder
	.sect	.data
	.type	segment_decoder, @object
	.size	segment_decoder, 36
segment_decoder:
	.word	63
	.word	6
	.word	91
	.word	79
	.word	102
	.word	109
	.word	125
	.word	7
	.word	127
	.word	111
	.word	119
	.word	124
	.word	57
	.word	94
	.word	121
	.word	113
	.word	61
	.word	118
	.globl	message_index_on_7segment_LEDs
	.type	message_index_on_7segment_LEDs, @object
	.size	message_index_on_7segment_LEDs, 1
message_index_on_7segment_LEDs:
	.byte	0
	.globl	display_counter
	.type	display_counter, @object
	.size	display_counter, 2
display_counter:
	.word	0
	.globl	cal
	.type	cal, @object
	.size	cal, 5
cal:
	.byte	0
	.zero	4
	.globl	calCnt
	.type	calCnt, @object
	.size	calCnt, 2
calCnt:
	.word	0
	.globl	pass
	.type	pass, @object
	.size	pass, 5
pass:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	0
	.globl	attempts
	.type	attempts, @object
	.size	attempts, 2
attempts:
	.word	0
	.globl	timer
	.type	timer, @object
	.size	timer, 4
timer:
	.long	0
	.section	.rodata
.LC0:
	.string	"closed"
	.globl	wrd
	.sect	.data
	.type	wrd, @object
	.size	wrd, 2
wrd:
	.word	.LC0
	.globl	keypad_debounce_timer
	.type	keypad_debounce_timer, @object
	.size	keypad_debounce_timer, 2
keypad_debounce_timer:
	.word	0
	.globl	keypad_enabled
	.type	keypad_enabled, @object
	.size	keypad_enabled, 2
keypad_enabled:
	.word	1
	.globl	open
	.type	open, @object
	.size	open, 2
open:
	.word	0
	.globl	showPass
	.type	showPass, @object
	.size	showPass, 2
showPass:
	.word	1
	.globl	change
	.type	change, @object
	.size	change, 2
change:
	.word	0
	.section	.rodata
.LC1:
	.string	"0000"
	.string	""
	.globl	num
	.sect	.data
	.type	num, @object
	.size	num, 2
num:
	.word	.LC1
	.globl	opening
	.type	opening, @object
	.size	opening, 2
opening:
	.word	0
	; extern	busy_loop_delay
	; extern	KeypadReadPort
	; extern	DispInit
	; extern	DisableKeyboard
	; extern	DispClrScr
	; extern	DispStr
	; extern	EnableKeyboardAgain
	.local	index_on_7segment_LEDs.0
	.comm	index_on_7segment_LEDs.0,2,1
	.section	.rodata
.LC3:
	.string	"try again!"
.LC4:
	.string	"try again later!"
.LC2:
	.string	"open"
.LC6:
	.string	"Enter new Password"
.LC5:
	.string	"Password Changed"
	.sect	.text
	.globl	execute_the_jobs
	.type	execute_the_jobs,@function
execute_the_jobs:
	leas	-15,sp
	movw	keypad_enabled,0,sp
	ldd	0,sp
	bne	.L54
	ldd	attempts
	cpd	#3
	beq	.L55
	ldd	opening
	cpd	#1
	beq	.L34
	ldd	opening
	cpd	#2
	beq	.L34
	ldy	keypad_debounce_timer
	leax	1,y
	stx	keypad_debounce_timer
	ldd	keypad_debounce_timer
	cpd	#10
	bhi	.L56
.L28:
	ldd	showPass
	cpd	#1
	beq	.L57
	movb	#-1,602
	ldy	index_on_7segment_LEDs.0
	ldd	#3
	pshy
	subd	2,sp+
	std	11,sp
	ldd	#1
	ldx	11,sp
	bsr	___lshlhi3
	comb
	stab	600
	tfr	y,d
	asld
	asld
	anda	#0
	andb	#-4
	std	13,sp
	ldd	#255
	ldx	13,sp
	bsr	___lshrhi3
	anda	#0
	andb	#15
	asld
	tfr	d,x
	ldab	segment_decoder+1,x
	stab	1
	leax	1,y
	stx	index_on_7segment_LEDs.0
	cpx	#3
	ble	.L1
	clr	index_on_7segment_LEDs.0
	clr	index_on_7segment_LEDs.0+1
.L1:
	leas	15,sp
	rts
.L57:
	movw	num,7,sp
	clr	9,sp
	clr	10,sp
.L47:
	ldy	7,sp
	ldd	9,sp
	leay	d,y
	ldab	0,y
	beq	.L1
	movb	#-1,602
	ldx	#3
	xgdx
	subd	9,sp
	xgdx
	ldd	#1
	bsr	___lshlhi3
	comb
	stab	600
	clra
	ldab	0,y
	asld
	tfr	d,y
	leay	segment_decoder-96,y
	movb	1,y,1
	ldd	#20
	bsr	busy_loop_delay
	ldy	9,sp
	iny
	sty	9,sp
	cpy	#3
	ble	.L47
	bra	.L1
.L56:
	movw	0,sp,keypad_debounce_timer
	movw	#1,keypad_enabled
	bsr	EnableKeyboardAgain
	bra	.L28
.L34:
	bclr	160, #16
	bset	161, #16
	ldd	opening
	cpd	#1
	beq	.L58
	bset	161, #16
.L36:
	bclr	162, #16
	bclr	163, #48
	movb	#3,168
	movb	#-1,184
	movb	#40,192
	bset	160, #16
	ldd	timer+2
	ldx	timer
	addd	#1
	bcc	.L66
	inx	
.L66:
	std	timer+2
	stx	timer
	ldd	timer+2
	ldx	timer
	bmi	.L28
	bmi	.L59
	beq	.L59
.L38:
	ldy	#0
	sty	opening
	sty	timer+2
	sty	timer
	bsr	EnableKeyboardAgain
	movw	#1,keypad_enabled
	bra	.L28
.L59:
	cpd	#1000
	bls	.L28
	bra	.L38
.L58:
	bclr	161, #16
	bra	.L36
.L55:
	ldd	timer+2
	ldx	timer
	addd	#1
	bcc	.L67
	inx	
.L67:
	std	timer+2
	stx	timer
	ldd	timer+2
	ldx	timer
	bmi	.L28
	bmi	.L60
	beq	.L60
.L31:
	movw	#0,timer+2
	movw	#0,timer
	movw	#1,keypad_enabled
	bsr	EnableKeyboardAgain
	movw	0,sp,attempts
	movw	#.LC0,wrd
	movw	#.LC1,num
	movw	#1,showPass
	bra	.L28
.L60:
	cpd	#10000
	bls	.L28
	bra	.L31
.L54:
	bsr	KeypadReadPort
	stab	2,sp
	cmpb	#-1
	beq	.L3
	ldab	#16
	pshb
	des
	ldab	#2
	bsr	DispInit
	leas	2,sp
	stx	_.xy
	ldx	open
	tfr	x,d
	stx	_.z
	ldx	_.xy
	tbne	d,.L4
	ldab	2,sp
	addb	#-48
	cmpb	#9
	bhi	.L5
	ldab	cal+3
	bne	.L5
	ldy	calCnt
	leax	cal,y
	movb	2,sp,0,x
	ldy	calCnt
	leax	cal+1,y
	ldy	_.z
	xgdy
	stab	0,x
	xgdy
	ldy	calCnt
	leax	1,y
	stx	calCnt
	movw	#cal,num
.L19:
	bsr	DispClrScr
	movw	wrd,2,-sp
	ldab	#1
	pshb
	des
	bsr	DispStr
	leas	4,sp
.L3:
	ldy	keypad_debounce_timer
	leax	1,y
	stx	keypad_debounce_timer
	ldd	keypad_debounce_timer
	cpd	#400
	bls	.L28
	movw	#0,keypad_debounce_timer
	movw	#0,keypad_enabled
	bsr	DisableKeyboard
	bra	.L28
.L5:
	ldab	2,sp
	cmpb	#65
	beq	.L61
	cmpb	#66
	beq	.L53
	cmpb	#67
	beq	.L62
	cmpb	#68
	bne	.L19
	ldab	cal+3
	beq	.L19
	movw	#.LC1,num
	movb	cal,3,sp
	ldab	pass
	cmpb	3,sp
	beq	.L63
.L15:
	ldy	attempts
	leax	1,y
	stx	attempts
	movw	#.LC3,wrd
	clr	cal
	clr	cal+1
	clr	cal+2
	clr	cal+3
	movw	#0,calCnt
	movw	#.LC1,num
	ldd	attempts
	cpd	#3
	bne	.L19
	movw	#0,keypad_enabled
	bsr	DisableKeyboard
	movw	#.LC4,wrd
.L53:
	movw	#0,showPass
	bra	.L19
.L63:
	movb	cal+1,4,sp
	ldab	pass+1
	cmpb	4,sp
	bne	.L15
	movb	cal+2,5,sp
	ldab	pass+2
	cmpb	5,sp
	bne	.L15
	movb	cal+3,6,sp
	ldab	pass+3
	cmpb	6,sp
	bne	.L15
	movw	#1,open
	movw	#1,opening
	movw	#0,attempts
	movw	#0,showPass
	movw	#.LC2,wrd
	bra	.L19
.L62:
	clr	cal
	clr	cal+1
	clr	cal+2
	clr	cal+3
	movw	#0,calCnt
	movw	#.LC1,num
	bra	.L19
.L61:
	movw	#1,showPass
	bra	.L19
.L4:
	movw	#0,timer+2
	movw	#0,timer
	ldd	change
	cpd	#1
	beq	.L64
.L20:
	ldab	2,sp
	cmpb	#67
	beq	.L65
	cmpb	#68
	bne	.L19
	ldd	change
	bne	.L19
	std	open
	movw	#2,opening
	stab	cal
	stab	cal+1
	stab	cal+2
	stab	cal+3
	std	calCnt
	movw	#.LC1,num
	movw	#.LC0,wrd
	movw	#1,showPass
	std	keypad_enabled
	bsr	DisableKeyboard
	bra	.L19
.L65:
	movw	#1,change
	movw	#0,calCnt
	movw	#1,showPass
	movw	#.LC6,wrd
	bra	.L19
.L64:
	ldab	2,sp
	cmpb	#47
	bls	.L20
	cmpb	#57
	bhi	.L20
	ldy	calCnt
	leax	pass,y
	movb	2,sp,0,x
	ldy	calCnt
	leax	1,y
	stx	calCnt
	ldy	calCnt
	leax	pass,y
	clr	0,x
	movw	#pass,num
	ldd	calCnt
	cpd	#4
	bne	.L19
	ldx	#0
	stx	change
	stx	calCnt
	stx	showPass
	movw	#.LC5,wrd
	bra	.L19
	.size	execute_the_jobs, .-execute_the_jobs
	; extern	set_clock_24mhz
	; extern	KeypadInitPort
	.globl	main
	.type	main,@function
main:
	bsr	set_clock_24mhz
	movb	#-1,3
	movw	#rti_isr,15984
	movw	#10,counter_for_real_time_interrupt_limit
	movb	#17,59
	movw	#0,counter_for_real_time_interrupt
	bset	56, #-128
	movb	#-128,55
; Begin inline assembler code
#APP
	cli
; End of inline assembler code
#NO_APP
	clr	610
	bsr	KeypadInitPort
	ldab	#16
	pshb
	des
	ldab	#2
	bsr	DispInit
	leas	2,sp
.L73:
	bra	.L73
	.size	main, .-main
	.globl	display_hex_number_on_7segment_LEDs
	.type	display_hex_number_on_7segment_LEDs,@function
display_hex_number_on_7segment_LEDs:
	leas	-9,sp
	std	7,sp
	movb	#-1,602
	ldy	index_on_7segment_LEDs.0
	ldx	#3
	pshy
	xgdx
	subd	2,sp+
	xgdx
	sty	_.z
	ldd	#1
	bsr	___lshlhi3
	comb
	stab	2,sp
	movb	2,sp,600
	ldd	_.z
	asld
	asld
	anda	#0
	andb	#-4
	std	5,sp
	ldd	7,sp
	ldx	5,sp
	bsr	___lshrhi3
	anda	#0
	andb	#15
	asld
	tfr	d,y
	ldab	segment_decoder+1,y
	stab	1
	ldd	_.z
	addd	#1
	std	index_on_7segment_LEDs.0
	cpd	#3
	ble	.L75
	clr	index_on_7segment_LEDs.0
	clr	index_on_7segment_LEDs.0+1
.L75:
	leas	9,sp
	rts
	.size	display_hex_number_on_7segment_LEDs, .-display_hex_number_on_7segment_LEDs
	.globl	display_pass_on_7segment_LEDs
	.type	display_pass_on_7segment_LEDs,@function
display_pass_on_7segment_LEDs:
	pshx
	pshx
	std	0,sp
	clr	2,sp
	clr	3,sp
.L83:
	ldy	0,sp
	ldd	2,sp
	leay	d,y
	ldab	0,y
	beq	.L79
	movb	#-1,602
	ldx	#3
	xgdx
	subd	2,sp
	xgdx
	ldd	#1
	bsr	___lshlhi3
	comb
	stab	600
	clra
	ldab	0,y
	asld
	tfr	d,y
	leay	segment_decoder-96,y
	movb	1,y,1
	ldd	#20
	bsr	busy_loop_delay
	ldd	2,sp
	addd	#1
	std	2,sp
	cpd	#3
	ble	.L83
.L79:
	pulx
	pulx
	rts
	.size	display_pass_on_7segment_LEDs, .-display_pass_on_7segment_LEDs
	.globl	reset
	.type	reset,@function
reset:
	clr	cal
	clr	cal+1
	clr	cal+2
	clr	cal+3
	movw	#0,calCnt
	movw	#.LC1,num
	rts
	.size	reset, .-reset
	.globl	rti_isr
	.type	rti_isr,@function
	.interrupt	rti_isr
rti_isr:
	movw	_.tmp,2,-sp
	movw	_.z,2,-sp
	movw	_.xy,2,-sp
	movb	#-128,55
	ldd	counter_for_real_time_interrupt
	ldy	counter_for_real_time_interrupt_limit
	pshy
	cpd	2,sp+
	beq	.L89
	ldy	counter_for_real_time_interrupt
	leax	1,y
	stx	counter_for_real_time_interrupt
.L86:
	movw	2,sp+,_.xy
	movw	2,sp+,_.z
	movw	2,sp+,_.tmp
	rti
.L89:
	movw	#0,counter_for_real_time_interrupt
	bsr	execute_the_jobs
	bra	.L86
	.size	rti_isr, .-rti_isr
	.globl	rti_init
	.type	rti_init,@function
rti_init:
	movw	#rti_isr,15984
	movw	2,sp,counter_for_real_time_interrupt_limit
	stab	59
	movw	#0,counter_for_real_time_interrupt
	bset	56, #-128
	movb	#-128,55
	rts
	.size	rti_init, .-rti_init
	.globl	counter_for_real_time_interrupt
	.sect	.bss
	.type	counter_for_real_time_interrupt, @object
	.size	counter_for_real_time_interrupt, 2
counter_for_real_time_interrupt:
	.zero	2
	.globl	counter_for_real_time_interrupt_limit
	.type	counter_for_real_time_interrupt_limit, @object
	.size	counter_for_real_time_interrupt_limit, 2
counter_for_real_time_interrupt_limit:
	.zero	2
