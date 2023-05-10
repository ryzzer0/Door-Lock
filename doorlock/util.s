;;;-----------------------------------------
;;; Start MC68HC12 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	C:\gcc-hcs12\usr\bin\..\lib\gcc-lib\m6811-elf\3.3.6-m68hc1x-20060122\cc1.exe -quiet -I./include -iprefix C:\gcc-hcs12\usr\bin\../lib/gcc-lib/m6811-elf\3.3.6-m68hc1x-20060122\ -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -D__mc68hc1x__ -D__mc68hc1x -D__HAVE_SHORT_INT__ -D__INT__=16 -Dmc6812 -DMC6812 -Dmc68hc12 util.c -quiet -dumpbase util.c -m68hc12 -mshort -auxbase util -O3 -std=c99 -fno-ident -fno-common -fomit-frame-pointer -o util.s
;;; Compiled:	Fri Apr 07 01:58:15 2023
;;; (META)compiled by GNU C version 3.3.2.
;;;-----------------------------------------
	.file	"util.c"
	.mode mshort
	.sect	.text
	.globl	busy_loop_delay
	.type	busy_loop_delay,@function
busy_loop_delay:
	ldy	#0
	tbeq	d,.L13
.L11:
	ldx	#260
.L66:
	dbne	x,.L66
	iny
	pshd
	cpy	2,sp+
	blo	.L11
.L13:
	rts
	.size	busy_loop_delay, .-busy_loop_delay
	.globl	set_clock_24mhz
	.type	set_clock_24mhz,@function
set_clock_24mhz:
	bclr	57, #-128
	bset	58, #64
	movb	#5,52
	movb	#1,53
.L68:
	ldab	55
	anda	#0
	andb	#8
	tbeq	d,.L68
	bset	57, #-128
	rts
	.size	set_clock_24mhz, .-set_clock_24mhz
