@ asm/act_boss_monitor.s: ROM 0x025EBC-0x026254 (rom, VMA 0x08025EBC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_boss_monitor
	.thumb_func
	.type init_boss_monitor, %function
init_boss_monitor: @ 08025EBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	sub sp, #4
	cmp r6, #0
	beq _08025F4C
_08025EC6:
	ldr r4, _08025F04
	movs r0, #0x37
	strh r4, [r6]
	bl sub_08001F58
	movs r3, #0xc0
	lsls r5, r3, #7
	adds r1, r0, #0
	movs r3, #0xae
	movs r4, #0
	adds r1, #0xa0
	lsls r2, r3, #8
	movs r3, #0x84
	str r4, [r1]
	str r2, [r0, #0x28]
	lsls r2, r3, #8
	str r5, [r0, #0x24]
	str r2, [r1, #0xc]
	movs r1, #8
	bl obj_initialise
	movs r0, #0x37
	bl sub_08001F58
	adds r1, r0, #0
	adds r1, #0xa0
	movs r2, #1
	movs r3, #0xc0
	str r2, [r1]
	lsls r2, r3, #8
	b _08025F08
_08025F04:
	.4byte 0x00000005
_08025F08:
	movs r3, #0x96
	str r2, [r0, #0x28]
	lsls r2, r3, #8
	str r5, [r0, #0x24]
	str r2, [r1, #0xc]
	movs r1, #8
	bl obj_initialise
	movs r0, #5
	bl sub_08001F58
	movs r1, #8
	bl obj_initialise
	ldr r1, _08025F64
	adds r0, r6, #0
	adds r0, #0xa0
	adds r1, #0x8c
	movs r2, #0xa0
	str r4, [r1]
	str r2, [r0]
	str r4, [r0, #4]
	ldr r0, _08025F68
	movs r2, #2
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #4
	orrs r1, r3
	str r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08025F4C:
	ldr r0, _08025F6C
	ldr r1, _08025F70
	str r0, [sp]
	ldr r2, _08025F74
	ldr r0, _08025F78
	movs r3, #0x4d
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08025EC6
_08025F64:
	.4byte gGameSetup
_08025F68:
	.4byte gFrameCount
_08025F6C:
	.4byte gUnk_08052A60
_08025F70:
	.4byte gUnk_08052A6C
_08025F74:
	.4byte gUnk_08052A84
_08025F78:
	.4byte gUnk_08052A98

	.global act_boss_monitor
	.thumb_func
	.type act_boss_monitor, %function
act_boss_monitor: @ 08025F7C
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #0x18
	cmp r4, #0
	bne _08025F88
	b _08026208
_08025F88:
	ldr r1, _08026220
	adds r5, r1, #0
	adds r5, #0x8c
	ldr r0, [r5]
	cmp r0, #6
	bls _08025F9E
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r2, [r0, #4]
	adds r2, #2
	str r2, [r0, #4]
_08025F9E:
	adds r0, r4, #0
	bl sub_08025DF0
	bl sub_08003478
	ldr r3, [r5]
	cmp r3, #0xa
	bhi _08026010
	ldr r2, _08026224
	lsls r0, r3, #2
	ldr r1, [r0, r2]
	mov pc, r1
	.byte 0x00, 0x00
	.global _08025FB8
_08025FB8:
	.4byte _08025FE4
	.4byte _08026050
	.4byte _08026084
	.4byte _08026010
	.4byte _080260C4
	.4byte _0802610C
	.4byte _0802615C
	.4byte _08026010
	.4byte _0802618E
	.4byte _080261CC
	.4byte _080261EE
	.global _08025FE4
_08025FE4:
	bl sub_08003634
	movs r0, #7
	bl sub_08001F58
	movs r1, #0
	bl obj_initialise
	movs r0, #1
	bl camera_op_set
	ldr r0, _08026220
	movs r3, #1
	adds r0, #0x8c
	str r3, [r0]
	movs r0, #7
	bl music_play_if_changed
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x78
	str r2, [r1]
	.global _08026010
_08026010:
	add r0, sp, #0x14
	add r1, sp, #0x10
	bl sub_08025C78
	add r0, sp, #0xc
	add r1, sp, #8
	bl sub_08028058
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0xc]
	subs r1, r2, r0
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #8]
	subs r3, r0, r2
	adds r2, r3, #0
	muls r2, r3, r2
	adds r0, r1, #0
	muls r0, r1, r0
	adds r1, r2, #0
	adds r0, r0, r1
	ldr r1, _08026228
	bl _call_via_r1
	ldr r2, _0802622C
	adds r1, r0, #0
	ldr r0, [r2, #4]
	bl sub_08028068
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.global _08026050
_08026050:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	ble _0802605C
	b _08026166
_0802605C:
	ldr r2, _08026230
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08026010
	ldr r2, _08026234
	ldrh r0, [r2]
	movs r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08026010
	bl music_stop
	bl sub_080035F8
	ldr r1, _08026220
	movs r3, #2
	b _080261E0
	.global _08026084
_08026084:
	ldr r2, _08026230
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08026010
	bl sub_08003634
	ldr r0, _08026238
	movs r2, #5
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	str r1, [r0]
	ldr r0, _08026220
	movs r3, #4
	adds r0, #0x8c
	str r3, [r0]
	movs r0, #2
	bl camera_op_set
	movs r0, #8
	bl music_play_if_changed
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0xa0
	str r1, [r0]
	b _08026010
	.global _080260C4
_080260C4:
	ldr r1, _08026230
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	beq _080260DC
	ldr r0, [r1]
	movs r2, #0x41
	rsbs r3, r2, #0
	ands r0, r3
	str r0, [r1]
_080260DC:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	bgt _08026166
	ldr r1, _08026220
	movs r3, #5
	adds r1, #0x8c
	str r3, [r1]
	movs r1, #0x50
	str r1, [r0]
	movs r2, #0
	subs r1, #0x51
	movs r3, #0x80
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x96
	movs r3, #1
	bl gamesfx_play
	movs r0, #0x1e
	b _08026150
	.global _0802610C
_0802610C:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	bgt _08026166
	ldr r1, _08026220
	movs r3, #6
	adds r1, #0x8c
	movs r2, #0x28
	str r3, [r1]
	str r2, [r0]
	ldr r0, _08026230
	ldr r1, [r0]
	movs r3, #2
	orrs r1, r3
	str r1, [r0]
	ldr r0, _08026238
	ldr r1, [r0]
	movs r3, #0x40
	orrs r1, r3
	str r1, [r0]
	movs r1, #1
	rsbs r2, r1, #0
	movs r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x97
	bl gamesfx_play
	movs r0, #0x1f
_08026150:
	bl sub_08001F58
	movs r1, #0
	bl obj_initialise
	b _08026010
	.global _0802615C
_0802615C:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	ble _0802616C
_08026166:
	subs r3, #2
	str r3, [r0]
	b _08026010
_0802616C:
	ldr r4, _08026220
	adds r2, r4, #0
	adds r2, #0x86
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _0802623C
	adds r1, #0x74
	ldr r0, [r3, r1]
	movs r1, #0
	bl sub_0801E220
	adds r4, #0x8c
	movs r0, #7
	str r0, [r4]
	b _08026010
	.global _0802618E
_0802618E:
	ldr r2, _08026230
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080261C4
_0802619A:
	ldr r2, _08026240
	ldr r1, [r2]
	ldr r0, _08026220
	adds r1, #0xa0
	ldrb r3, [r0, r1]
	cmp r3, #3
	bls _080261B4
	movs r0, #0xb
_080261AA:
	bl music_play_if_changed
_080261AE:
	ldr r1, _08026220
	movs r3, #9
	b _080261E0
_080261B4:
	cmp r3, #0
	beq _080261C0
	movs r0, #0xa
	bl music_play_if_changed
	b _080261AE
_080261C0:
	movs r0, #9
	b _080261AA
_080261C4:
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _0802619A
	.global _080261CC
_080261CC:
	ldr r2, _08026230
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080261E6
_080261D8:
	bl sub_080035F8
	ldr r1, _08026220
	movs r3, #0xa
_080261E0:
	adds r1, #0x8c
	str r3, [r1]
	b _08026010
_080261E6:
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _080261D8
	.global _080261EE
_080261EE:
	ldr r1, _08026230
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	bne _080261FE
	b _08026010
_080261FE:
	ldr r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1]
	b _08026010
_08026208:
	ldr r0, _08026244
	ldr r1, _08026248
	str r0, [sp]
	ldr r2, _0802624C
	ldr r0, _08026250
	movs r3, #0x81
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08025F88
_08026220:
	.4byte gGameSetup
_08026224:
	.4byte _08025FB8
_08026228:
	.4byte sub_03000744
_0802622C:
	.4byte gRacerObjects
_08026230:
	.4byte 0x0300566C
_08026234:
	.4byte gKeysNew
_08026238:
	.4byte gFrameCount
_0802623C:
	.4byte gUnk_087146C0
_08026240:
	.4byte gLocalPlayerIndex
_08026244:
	.4byte gUnk_08052A60
_08026248:
	.4byte gUnk_08052A6C
_0802624C:
	.4byte gUnk_08052AD4
_08026250:
	.4byte gUnk_08052A98
