@ asm/crt0.s: ROM 0x000000-0x000114 (rom, VMA 0x08000000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.arm

	.global _start
	.type _start, %function
_start: @ 08000000
	b _080000C0
	.incbin "baserom.gba", 0x4, 0xA8
	.global gUnk_080000AC
gUnk_080000AC:
	.byte 0x52, 0x41, 0x52, 0x45, 0x30, 0x31, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x82, 0x00, 0x00
_080000C0:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000E8
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000EC
	ldr r1, _080000F0
	mov lr, pc
	bx r1
	b _080000C0
_080000E8:
	.4byte 0x03007FA0
_080000EC:
	.4byte 0x03007F00
_080000F0:
	.4byte AgbMain
	.thumb

	.global sub_080000F4
	.thumb_func
	.type sub_080000F4, %function
sub_080000F4: @ 080000F4
	ldr r2, _08000104
	bx r2

	.global sub_080000F8
	.thumb_func
	.type sub_080000F8, %function
sub_080000F8: @ 080000F8
	ldr r2, _08000108
	bx r2

	.global sub_080000FC
	.thumb_func
	.type sub_080000FC, %function
sub_080000FC: @ 080000FC
	ldr r2, _0800010C
	bx r2

	.global sub_08000100
	.thumb_func
	.type sub_08000100, %function
sub_08000100: @ 08000100
	ldr r2, _08000110
	bx r2
_08000104:
	.4byte sub_03000518
_08000108:
	.4byte sub_0300034C
_0800010C:
	.4byte sub_0300055C
_08000110:
	.4byte sub_03000548
