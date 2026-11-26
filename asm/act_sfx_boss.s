@ asm/act_sfx_boss.s: ROM 0x02896C-0x028A28 (rom, VMA 0x0802896C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_sfx_boss
	.thumb_func
	.type init_sfx_boss, %function
init_sfx_boss: @ 0802896C
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08028996
_08028976:
	ldr r0, _0802898C
	movs r2, #1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0xa0
	rsbs r1, r2, #0
	str r1, [r0, #8]
	str r1, [r0]
	str r1, [r0, #4]
	add sp, #4
	b _08028990
_0802898C:
	.4byte 0x00000001
_08028990:
	pop {r4}
	pop {r0}
	bx r0
_08028996:
	ldr r0, _080289B0
	ldr r1, _080289B4
	str r0, [sp]
	ldr r2, _080289B8
	ldr r0, _080289BC
	movs r3, #0x1a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08028976
	.byte 0x00, 0x00
_080289B0:
	.4byte 0x08052CF8
_080289B4:
	.4byte 0x08052D04
_080289B8:
	.4byte 0x08052D18
_080289BC:
	.4byte 0x08052D28

	.global act_sfx_boss
	.thumb_func
	.type act_sfx_boss, %function
act_sfx_boss: @ 080289C0
	push {r4, lr}
	ldr r1, _08028A1C
	ldr r2, [r1]
	ldr r0, _08028A20
	lsls r4, r2, #2
	ldr r2, [r0, r4]
	ldr r4, [r0, #4]
	ldr r3, [r2, #0x24]
	ldr r0, [r4, #0x24]
	subs r1, r0, r3
	asrs r0, r1, #8
	ldr r3, [r2, #0x28]
	ldr r1, [r4, #0x28]
	ldr r2, [r2, #0x2c]
	subs r1, r1, r3
	ldr r3, [r4, #0x2c]
	asrs r1, r1, #8
	subs r3, r3, r2
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r1, #0
	muls r0, r1, r0
	asrs r3, r3, #8
	adds r1, r0, #0
	adds r0, r2, r1
	adds r1, r3, #0
	muls r1, r3, r1
	adds r3, r1, #0
	movs r1, #0x80
	adds r2, r0, r3
	lsls r0, r1, #9
	cmp r2, r0
	bge _08028A14
	movs r1, #0x98
	lsls r3, r1, #1
	movs r0, #0x96
	adds r1, r4, r3
	lsls r3, r0, #1
	str r2, [r1]
	adds r0, r4, r3
	movs r2, #1
	str r2, [r0]
_08028A14:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08028A1C:
	.4byte 0x0202DE58
_08028A20:
	.4byte 0x0200434C

	.global free_sfx_boss
	.thumb_func
	.type free_sfx_boss, %function
free_sfx_boss: @ 08028A24
	bx lr
	.byte 0xC0, 0x46
