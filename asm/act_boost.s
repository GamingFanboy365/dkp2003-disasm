@ asm/act_boost.s: ROM 0x012A20-0x012BA4 (rom, VMA 0x08012A20)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_booster
	.thumb_func
	.type init_booster, %function
init_booster: @ 08012A20
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08012AE8
_08012A2A:
	ldr r0, _08012A48
	movs r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, #0
	beq _08012AD8
_08012A34:
	cmp r2, #1
	beq _08012A4C
_08012A38:
	adds r0, r4, #0
	bl obj_free
_08012A3E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08012A48:
	.4byte gGameSetup
_08012A4C:
	adds r5, r4, #0
	adds r5, #0x9c
	ldr r1, [r5]
	ldr r0, [r1, #0xc]
	ldr r2, [r0, #0xc]
	cmp r2, #1
	bne _08012A38
_08012A5A:
	ldr r0, _08012A94
	movs r1, #0x33
	strh r0, [r4]
	movs r2, #0x13
	adds r0, r4, #0
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _08012AA0
	adds r1, r3, r2
	ldr r2, _08012A98
	strh r2, [r1, #0xa]
	bl sub_08002FE0
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	ldr r1, _08012A9C
	ldrb r2, [r0, #1]
	subs r0, r1, r2
	lsls r1, r0, #8
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
	b _08012AA4
	.byte 0x00, 0x00
_08012A94:
	.4byte 0x00000001
_08012A98:
	.4byte 0x0000003C
_08012A9C:
	.4byte 0x00000080
_08012AA0:
	.4byte 0x02018F34
_08012AA4:
	ldr r2, [r5]
	ldr r1, [r2, #0xc]
	ldrb r0, [r1, #2]
	movs r2, #0x80
	lsls r1, r0, #8
	lsls r0, r2, #3
	str r0, [sp]
	movs r2, #0
	adds r0, r4, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r4, #0
	bl obj_add_static_hit
	ldr r1, [r5]
	ldr r2, [r1, #0xc]
	adds r0, r4, #0
	ldrh r1, [r2, #4]
	adds r0, #0xa0
	str r1, [r0]
	ldr r2, [r5]
	ldr r1, [r2, #0xc]
	ldrh r2, [r1, #6]
	str r2, [r0, #4]
	b _08012A3E
_08012AD8:
	adds r5, r4, #0
	adds r5, #0x9c
	ldr r1, [r5]
	ldr r0, [r1, #0xc]
	ldr r1, [r0, #8]
	cmp r1, #1
	bne _08012A34
	b _08012A5A
_08012AE8:
	ldr r0, _08012B00
	ldr r1, _08012B04
	str r0, [sp]
	ldr r2, _08012B08
	ldr r0, _08012B0C
	movs r3, #0x1d
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012A2A
_08012B00:
	.4byte gUnk_08050C1C
_08012B04:
	.4byte gUnk_08050C28
_08012B08:
	.4byte gUnk_08050C38
_08012B0C:
	.4byte gUnk_08050C48

	.global act_booster
	.thumb_func
	.type act_booster, %function
act_booster: @ 08012B10
	push {lr}
	sub sp, #4
	cmp r0, #0
	beq _08012B1E
_08012B18:
	add sp, #4
	pop {r0}
	bx r0
_08012B1E:
	ldr r0, _08012B38
	ldr r1, _08012B3C
	str r0, [sp]
	ldr r2, _08012B40
	ldr r0, _08012B44
	movs r3, #0x40
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012B18
	.byte 0x00, 0x00
_08012B38:
	.4byte gUnk_08050C1C
_08012B3C:
	.4byte gUnk_08050C28
_08012B40:
	.4byte gUnk_08050C84
_08012B44:
	.4byte gUnk_08050C48

	.global react_booster
	.thumb_func
	.type react_booster, %function
react_booster: @ 08012B48
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _08012B76
_08012B52:
	cmp r4, #0
	beq _08012B5E
_08012B56:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08012B5E:
	ldr r0, _08012B90
	ldr r1, _08012B94
	str r0, [sp]
	ldr r2, _08012B98
	ldr r0, _08012B9C
	movs r3, #0x46
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012B56
_08012B76:
	ldr r0, _08012BA0
	ldr r1, _08012B94
	str r0, [sp]
	ldr r2, _08012B98
	ldr r0, _08012B9C
	movs r3, #0x45
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012B52
	.byte 0x00, 0x00
_08012B90:
	.4byte gUnk_08050C90
_08012B94:
	.4byte gUnk_08050C28
_08012B98:
	.4byte gUnk_08050C9C
_08012B9C:
	.4byte gUnk_08050C48
_08012BA0:
	.4byte gUnk_08050C1C
