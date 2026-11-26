@ asm/act_static.s: ROM 0x00F618-0x00F80C (rom, VMA 0x0800F618)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_static
	.thumb_func
	.type init_static, %function
init_static: @ 0800F618
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _0800F6AE
_0800F622:
	ldr r1, _0800F658
	adds r6, r5, #0
	strh r1, [r5]
	adds r6, #0x9c
	ldr r0, [r6]
	ldr r3, [r0, #0xc]
	ldrh r4, [r3, #2]
	cmp r4, #0
	beq _0800F6AA
_0800F634:
	ldrb r1, [r3, #1]
	adds r0, r5, #0
	movs r2, #3
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r2, _0800F65C
	adds r0, r3, r2
	ldr r2, [r6]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #4]
	lsls r1, r4, #2
	strh r1, [r0, #0xa]
	b _0800F660
_0800F658:
	.4byte 0x00000001
_0800F65C:
	.4byte 0x02018F34
_0800F660:
	cmp r2, #1
	beq _0800F68E
	cmp r2, #2
	beq _0800F670
_0800F668:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800F670:
	ldrb r2, [r3, #5]
	ldrb r0, [r3, #6]
	movs r3, #0x80
	lsls r1, r2, #8
	lsls r2, r0, #8
	lsls r0, r3, #4
	str r0, [sp]
	movs r3, #0
	adds r0, r5, #0
	bl sub_08001C28
	adds r0, r5, #0
	bl obj_add_static_hit
	b _0800F668
_0800F68E:
	ldrb r0, [r3, #5]
	movs r2, #0x80
	lsls r1, r0, #8
	lsls r0, r2, #3
	str r0, [sp]
	movs r2, #0
	adds r0, r5, #0
	movs r3, #0
	bl sub_08001C28
	adds r0, r5, #0
	bl obj_add_static_hit
	b _0800F668
_0800F6AA:
	movs r4, #0x30
	b _0800F634
_0800F6AE:
	ldr r0, _0800F6C8
	ldr r1, _0800F6CC
	str r0, [sp]
	ldr r2, _0800F6D0
	ldr r0, _0800F6D4
	movs r3, #0x1c
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F622
	.byte 0x00, 0x00
_0800F6C8:
	.4byte 0x08050414
_0800F6CC:
	.4byte 0x08050420
_0800F6D0:
	.4byte 0x08050434
_0800F6D4:
	.4byte 0x08050440

	.global react_static
	.thumb_func
	.type react_static, %function
react_static: @ 0800F6D8
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _0800F706
_0800F6E2:
	cmp r4, #0
	beq _0800F6EE
_0800F6E6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0800F6EE:
	ldr r0, _0800F720
	ldr r1, _0800F724
	str r0, [sp]
	ldr r2, _0800F728
	ldr r0, _0800F72C
	movs r3, #0x61
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F6E6
_0800F706:
	ldr r0, _0800F730
	ldr r1, _0800F724
	str r0, [sp]
	ldr r2, _0800F728
	ldr r0, _0800F72C
	movs r3, #0x60
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F6E2
	.byte 0x00, 0x00
_0800F720:
	.4byte 0x0805047C
_0800F724:
	.4byte 0x08050420
_0800F728:
	.4byte 0x08050488
_0800F72C:
	.4byte 0x08050440
_0800F730:
	.4byte 0x08050414

	.global react_palmtree
	.thumb_func
	.type react_palmtree, %function
react_palmtree: @ 0800F734
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _0800F762
_0800F73E:
	cmp r4, #0
	beq _0800F74A
_0800F742:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0800F74A:
	ldr r0, _0800F77C
	ldr r1, _0800F780
	str r0, [sp]
	ldr r2, _0800F784
	ldr r0, _0800F788
	movs r3, #0x68
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F742
_0800F762:
	ldr r0, _0800F78C
	ldr r1, _0800F780
	str r0, [sp]
	ldr r2, _0800F784
	ldr r0, _0800F788
	movs r3, #0x67
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F73E
	.byte 0x00, 0x00
_0800F77C:
	.4byte 0x0805047C
_0800F780:
	.4byte 0x08050420
_0800F784:
	.4byte 0x08050498
_0800F788:
	.4byte 0x08050440
_0800F78C:
	.4byte 0x08050414

	.global react_lava_flame
	.thumb_func
	.type react_lava_flame, %function
react_lava_flame: @ 0800F790
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	adds r4, r1, #0
	cmp r5, #0
	beq _0800F7E0
_0800F79C:
	cmp r4, #0
	beq _0800F7C8
_0800F7A0:
	ldrb r3, [r4, #2]
	cmp r3, #2
	bgt _0800F7BA
	cmp r3, #1
	blt _0800F7BA
	ldr r2, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	adds r2, #0x60
	subs r1, #0x50
	str r2, [r4, #0x4c]
	str r1, [r4, #0x50]
	cmp r1, #0
	blt _0800F7C2
_0800F7BA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0800F7C2:
	movs r0, #0
	str r0, [r5, #0x50]
	b _0800F7BA
_0800F7C8:
	ldr r0, _0800F7F8
	ldr r1, _0800F7FC
	str r0, [sp]
	ldr r2, _0800F800
	ldr r0, _0800F804
	movs r3, #0x74
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F7A0
_0800F7E0:
	ldr r0, _0800F808
	ldr r1, _0800F7FC
	str r0, [sp]
	ldr r2, _0800F800
	ldr r0, _0800F804
	movs r3, #0x73
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F79C
_0800F7F8:
	.4byte 0x0805047C
_0800F7FC:
	.4byte 0x08050420
_0800F800:
	.4byte 0x080504A8
_0800F804:
	.4byte 0x08050440
_0800F808:
	.4byte 0x08050414
