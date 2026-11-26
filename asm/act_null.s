@ asm/act_null.s: ROM 0x00F5E0-0x00F618 (rom, VMA 0x0800F5E0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_null
	.thumb_func
	.type act_null, %function
act_null: @ 0800F5E0
	push {lr}
	sub sp, #4
	cmp r0, #0
	beq _0800F5EE
_0800F5E8:
	add sp, #4
	pop {r0}
	bx r0
_0800F5EE:
	ldr r0, _0800F608
	ldr r1, _0800F60C
	str r0, [sp]
	ldr r2, _0800F610
	ldr r0, _0800F614
	movs r3, #0x11
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F5E8
	.byte 0x00, 0x00
_0800F608:
	.4byte gUnk_080503B0
_0800F60C:
	.4byte gUnk_080503BC
_0800F610:
	.4byte gUnk_080503CC
_0800F614:
	.4byte gUnk_080503D8
