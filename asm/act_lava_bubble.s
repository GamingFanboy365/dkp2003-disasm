@ asm/act_lava_bubble.s: ROM 0x012EA4-0x012EF0 (rom, VMA 0x08012EA4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_lava_bubble
	.thumb_func
	.type init_lava_bubble, %function
init_lava_bubble: @ 08012EA4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08012EC8
_08012EAE:
	ldr r2, _08012EC4
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0
	strh r2, [r4]
	add sp, #4
	str r1, [r0]
	str r1, [r0, #4]
	pop {r4}
	pop {r0}
	bx r0
_08012EC4:
	.4byte 0x00000005
_08012EC8:
	ldr r0, _08012EE0
	ldr r1, _08012EE4
	str r0, [sp]
	ldr r2, _08012EE8
	ldr r0, _08012EEC
	movs r3, #0x1a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012EAE
_08012EE0:
	.4byte 0x08050D1C
_08012EE4:
	.4byte 0x08050D28
_08012EE8:
	.4byte 0x08050D40
_08012EEC:
	.4byte 0x08050D54
