@ asm/act_tnt_launcher.s: ROM 0x011180-0x0112B4 (rom, VMA 0x08011180)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_tnt_launcher
	.thumb_func
	.type act_tnt_launcher, %function
act_tnt_launcher: @ 08011180
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08011228
_0801118A:
	adds r6, r4, #0
	adds r6, #0xa0
	ldr r1, [r6]
	ldr r2, _0801121C
	lsls r0, r1, #2
	ldr r1, [r2, r0]
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _080111A4
_0801119C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080111A4:
	adds r5, r1, #0
	adds r5, #0xa0
	ldr r3, [r5]
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r3, r2
	cmp r3, #0
	beq _0801119C
	ldr r2, [r4, #0x24]
	str r2, [r1, #0x24]
	ldr r7, [r4, #0x28]
	str r7, [r1, #0x28]
	adds r7, r1, #0
	ldr r2, [r4, #0x2c]
	adds r7, #0x54
	str r2, [r1, #0x2c]
	strh r0, [r7]
	ldr r1, [r6, #4]
	adds r7, #2
	strh r1, [r7]
	ldr r7, _08011220
	ldr r3, [r5, #4]
	ldr r0, [r7]
	cmp r3, r0
	beq _080111FC
_080111D6:
	adds r0, r4, #0
	movs r1, #0x55
	movs r2, #0x13
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _08011224
	adds r1, r3, r2
	ldr r2, _08011218
	strh r2, [r1, #0xa]
	bl sub_08002FE0
	movs r1, #1
	str r1, [r6, #8]
	b _0801119C
_080111FC:
	movs r0, #0x2a
	bl sub_08001F58
	movs r1, #8
	bl obj_initialise
	ldr r3, [r5, #4]
	ldr r0, [r7]
	cmp r3, r0
	bne _080111D6
	movs r0, #5
	bl camera_op_set
	b _080111D6
_08011218:
	.4byte 0x00000060
_0801121C:
	.4byte gRacerObjects
_08011220:
	.4byte gLocalPlayerIndex
_08011224:
	.4byte 0x02018F34
_08011228:
	ldr r0, _08011240
	ldr r1, _08011244
	str r0, [sp]
	ldr r2, _08011248
	ldr r0, _0801124C
	movs r3, #0x27
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801118A
_08011240:
	.4byte gUnk_080508E0
_08011244:
	.4byte gUnk_080508EC
_08011248:
	.4byte gUnk_08050904
_0801124C:
	.4byte gUnk_08050918

	.global init_tnt_launcher
	.thumb_func
	.type init_tnt_launcher, %function
init_tnt_launcher: @ 08011250
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801128A
_0801125A:
	ldr r0, _08011280
	adds r2, r4, #0
	strh r0, [r4]
	adds r2, #0x9c
	ldr r1, [r2]
	ldr r3, [r1, #0xc]
	adds r0, r4, #0
	ldrb r1, [r3, #8]
	adds r0, #0xa0
	str r1, [r0]
	ldr r3, [r2]
	ldr r2, [r3, #0xc]
	ldrb r1, [r2, #7]
	lsls r2, r1, #8
	movs r1, #0
	str r2, [r0, #4]
	str r1, [r0, #8]
	add sp, #4
	b _08011284
_08011280:
	.4byte 0x00000001
_08011284:
	pop {r4}
	pop {r0}
	bx r0
_0801128A:
	ldr r0, _080112A4
	ldr r1, _080112A8
	str r0, [sp]
	ldr r2, _080112AC
	ldr r0, _080112B0
	movs r3, #0x19
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801125A
	.byte 0x00, 0x00
_080112A4:
	.4byte gUnk_080508E0
_080112A8:
	.4byte gUnk_080508EC
_080112AC:
	.4byte gUnk_08050954
_080112B0:
	.4byte gUnk_08050918
