@ asm/act_battle_monitor.s: ROM 0x013ED8-0x0144A0 (rom, VMA 0x08013ED8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_battle_monitor
	.thumb_func
	.type init_battle_monitor, %function
init_battle_monitor: @ 08013ED8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	sub sp, #4
	cmp r6, #0
	beq _08013F82
_08013EE2:
	ldr r2, _08013F08
	movs r0, #9
	strh r2, [r6]
	bl obj_new
	movs r1, #8
	bl obj_initialise
	ldr r1, _08013F0C
	adds r2, r1, #0
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r4, #0
	cmp r4, r0
	bge _08013F4C
	ldr r5, _08013F10
	adds r7, r2, #0
	b _08013F14
_08013F08:
	.4byte 0x00000005
_08013F0C:
	.4byte gGameSetup
_08013F10:
	.4byte gUnk_0884E370
_08013F14:
	movs r0, #0x37
	bl obj_new
	movs r3, #0xc
	adds r2, r4, #0
	muls r2, r3, r2
	adds r1, r0, #0
	adds r1, #0xa0
	str r4, [r1]
	ldr r3, [r5, r2]
	lsls r3, r3, #8
	str r3, [r0, #0x24]
	adds r3, r2, #4
	ldr r3, [r5, r3]
	lsls r3, r3, #8
	str r3, [r0, #0x28]
	adds r2, #8
	ldr r3, [r5, r2]
	lsls r2, r3, #8
	str r2, [r1, #0xc]
	movs r1, #8
	bl obj_initialise
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r4, #1
	cmp r4, r0
	blt _08013F14
_08013F4C:
	movs r0, #5
	bl obj_new
	movs r1, #8
	bl obj_initialise
	ldr r0, _08013F9C
	movs r2, #0
	adds r0, #0x8c
	str r2, [r0]
	adds r0, r6, #0
	adds r0, #0xa0
	movs r1, #0xa0
	str r1, [r0]
	str r2, [r0, #4]
	ldr r0, _08013FA0
	movs r2, #2
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #4
	orrs r1, r3
	str r1, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08013F82:
	ldr r0, _08013FA4
	ldr r1, _08013FA8
	str r0, [sp]
	ldr r2, _08013FAC
	ldr r0, _08013FB0
	movs r3, #0xbf
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013EE2
	.byte 0x00, 0x00
_08013F9C:
	.4byte gGameSetup
_08013FA0:
	.4byte gFrameCount
_08013FA4:
	.4byte gUnk_08051078
_08013FA8:
	.4byte gUnk_08051084
_08013FAC:
	.4byte gUnk_080510A0
_08013FB0:
	.4byte gUnk_080510B4

	.global act_battle_monitor
	.thumb_func
	.type act_battle_monitor, %function
act_battle_monitor: @ 08013FB4
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #8
	cmp r4, #0
	bne _08013FC0
	b _0801421C
_08013FC0:
	ldr r0, _08014234
	adds r5, r0, #0
	adds r5, #0x8c
	ldr r3, [r5]
	cmp r3, #6
	bls _08013FD8
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	adds r2, #2
	str r2, [r1, #4]
	ldr r3, [r5]
_08013FD8:
	cmp r3, #7
	bhi _08013FE2
	adds r0, r4, #0
	bl sub_08013D4C
_08013FE2:
	bl fade_update
	ldr r3, [r5]
	cmp r3, #0xa
	bhi _08014044
	ldr r2, _08014238
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.global _08013FF4
_08013FF4:
	.4byte _08014020
	.4byte _0801404C
	.4byte _08014074
	.4byte _08014044
	.4byte _080140A8
	.4byte _080140F0
	.4byte _08014140
	.4byte _08014044
	.4byte _0801416C
	.4byte _080141B2
	.4byte _08014202
	.global _08014020
_08014020:
	bl fade_to_normal
	movs r0, #7
	bl obj_new
	movs r1, #0
	bl obj_initialise
	movs r0, #1
	bl camera_op_set
	ldr r0, _08014234
	movs r3, #1
	adds r0, #0x8c
	str r3, [r0]
	movs r0, #7
_08014040:
	bl music_play_if_changed
	.global _08014044
_08014044:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.global _0801404C
_0801404C:
	ldr r2, _0801423C
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08014044
	ldr r2, _08014240
	ldrh r0, [r2]
	movs r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08014044
	bl music_stop
	bl fade_to_black
	ldr r1, _08014234
	movs r3, #2
	b _080141EC
	.global _08014074
_08014074:
	ldr r2, _0801423C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08014044
	bl fade_to_normal
	ldr r0, _08014244
	movs r2, #5
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	str r1, [r0]
	ldr r0, _08014234
	movs r3, #4
	adds r0, #0x8c
	str r3, [r0]
	movs r0, #2
	bl camera_op_set
	movs r0, #8
	b _08014040
	.global _080140A8
_080140A8:
	ldr r1, _0801423C
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	beq _080140C0
	ldr r0, [r1]
	movs r2, #0x41
	rsbs r3, r2, #0
	ands r0, r3
	str r0, [r1]
_080140C0:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	bgt _080141BC
	ldr r1, _08014234
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
	b _08014134
	.global _080140F0
_080140F0:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	bgt _080141BC
	ldr r1, _08014234
	movs r3, #6
	adds r1, #0x8c
	movs r2, #0x28
	str r3, [r1]
	str r2, [r0]
	ldr r0, _0801423C
	ldr r1, [r0]
	movs r3, #2
	orrs r1, r3
	str r1, [r0]
	ldr r0, _08014244
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
_08014134:
	bl obj_new
	movs r1, #0
	bl obj_initialise
	b _08014044
	.global _08014140
_08014140:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	bgt _080141BC
	ldr r4, _08014234
	adds r2, r4, #0
	adds r2, #0x86
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _08014248
	adds r1, #0x74
	ldr r0, [r3, r1]
	movs r1, #0
	bl music_request
	adds r4, #0x8c
	movs r0, #7
	str r0, [r4]
	b _08014044
	.global _0801416C
_0801416C:
	bl sub_08013C68
	movs r0, #0x39
	bl obj_new
	movs r1, #0
	bl obj_initialise
	ldr r2, _0801424C
	ldr r1, [r2]
	ldr r0, _08014234
	adds r1, #0xa0
	ldrb r3, [r0, r1]
	cmp r3, #3
	bls _080141A2
	movs r0, #0xb
_0801418C:
	bl music_play_if_changed
_08014190:
	ldr r1, _08014234
	movs r3, #9
	adds r1, #0x8c
	str r3, [r1]
	adds r1, r4, #0
	adds r1, #0xa0
	movs r0, #0x3c
	str r0, [r1]
	b _08014044
_080141A2:
	cmp r3, #0
	beq _080141AE
	movs r0, #0xa
	bl music_play_if_changed
	b _08014190
_080141AE:
	movs r0, #9
	b _0801418C
	.global _080141B2
_080141B2:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	ble _080141C2
_080141BC:
	subs r3, #2
	str r3, [r0]
	b _08014044
_080141C2:
	bl music_current
	cmp r0, #0
	blt _080141FA
_080141CA:
	ldr r2, _0801423C
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080141F2
_080141D6:
	ldr r2, _08014240
	ldr r1, _08014250
	ldrh r0, [r2]
	ands r1, r0
	cmp r1, #0
	bne _080141E4
	b _08014044
_080141E4:
	bl fade_to_black
	ldr r1, _08014234
	movs r3, #0xa
_080141EC:
	adds r1, #0x8c
	str r3, [r1]
	b _08014044
_080141F2:
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _080141D6
_080141FA:
	movs r0, #3
	bl music_play_if_changed
	b _080141CA
	.global _08014202
_08014202:
	ldr r1, _0801423C
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	bne _08014212
	b _08014044
_08014212:
	ldr r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1]
	b _08014044
_0801421C:
	ldr r0, _08014254
	ldr r1, _08014258
	str r0, [sp]
	ldr r2, _0801425C
	ldr r0, _08014260
	movs r3, #0xf8
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013FC0
_08014234:
	.4byte gGameSetup
_08014238:
	.4byte _08013FF4
_0801423C:
	.4byte gModeFlags
_08014240:
	.4byte gKeysNew
_08014244:
	.4byte gFrameCount
_08014248:
	.4byte gUnk_087146C0
_0801424C:
	.4byte gLocalPlayerIndex
_08014250:
	.4byte 0x0000030F
_08014254:
	.4byte gUnk_08051078
_08014258:
	.4byte gUnk_08051084
_0801425C:
	.4byte gUnk_080510F0
_08014260:
	.4byte gUnk_080510B4

	.global sub_08014264
	.thumb_func
	.type sub_08014264, %function
sub_08014264: @ 08014264
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xa0
	ldr r2, [r4, #4]
	lsls r3, r2, #1
	ldr r2, _08014294
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r2, _08014298
	lsls r3, r3, #2
	ldr r3, [r2, r3]
	movs r2, #0x92
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r3, [r0]
	asrs r2, r2, #0xc
	subs r1, r3, r2
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08014294:
	.4byte gGameSetup
_08014298:
	.4byte gUnk_0884E34C

	.global fe_credits_process
	.thumb_func
	.type fe_credits_process, %function
fe_credits_process: @ 0801429C
	push {r4, r5, lr}
	sub sp, #0x10
	bl fade_update
	bl fe_frame_end
	ldr r5, _08014450
	ldr r3, [r5]
	cmp r3, #6
	bhi _0801430E
	ldr r2, _08014454
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.global _080142B8
_080142B8:
	.4byte _080142D4
	.4byte _08014316
	.4byte _08014328
	.4byte _08014370
	.4byte _080143B8
	.4byte _080143D0
	.4byte _08014436
	.global _080142D4
_080142D4:
	ldr r0, _08014458
	ldr r1, _0801445C
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #4
	movs r2, #0x80
	ldr r3, _08014460
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08014464
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08014468
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _0801446C
	bl pal_load
	bl fade_to_normal
	ldr r0, _08014450
	movs r3, #1
_0801430C:
	str r3, [r0]
_0801430E:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.global _08014316
_08014316:
	ldr r2, _08014470
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _0801430E
	movs r1, #2
	b _080143C8
	.global _08014328
_08014328:
	ldr r3, [r5, #8]
	cmp r3, #0x7f
	bgt _08014366
	asrs r4, r3, #2
	str r4, [sp]
	movs r0, #0x78
	movs r4, #0
	movs r1, #0x50
	ldr r2, _08014474
	ldr r3, _08014478
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, [r5, #8]
	asrs r0, r1, #2
	str r0, [sp]
	ldr r2, _0801447C
	movs r0, #0x78
	movs r1, #0x50
	ldr r3, _08014480
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r5, #8]
	adds r2, #1
	str r2, [r5, #8]
	b _0801430E
_08014366:
	bl fade_to_black
	movs r2, #3
	str r2, [r5]
	b _0801430E
	.global _08014370
_08014370:
	ldr r2, _08014470
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _0801430E
	ldr r0, _08014458
	ldr r1, _08014484
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #4
	movs r2, #0x80
	ldr r3, _08014460
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	ldr r2, _08014488
	str r1, [r0, #8]
	movs r1, #0xc0
	ldr r3, [r0, #8]
	str r2, [r0]
	lsls r2, r1, #0x13
	ldr r1, _08014468
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _0801448C
	bl pal_load
	bl fade_to_normal
	ldr r0, _08014450
	movs r3, #4
	b _0801430C
	.global _080143B8
_080143B8:
	ldr r2, _08014470
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _0801430E
	movs r1, #5
_080143C8:
	movs r0, #0
	str r1, [r5]
	str r0, [r5, #8]
	b _0801430E
	.global _080143D0
_080143D0:
	ldr r2, [r5, #8]
	cmp r2, #0x7f
	bgt _0801442C
	movs r3, #0
	asrs r0, r2, #2
	str r0, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	cmp r2, #0x3b
	bgt _08014428
	movs r1, #0x80
	lsls r2, r1, #3
	str r2, [sp, #0xc]
_080143EA:
	movs r0, #0x58
	movs r1, #0x50
	ldr r2, _08014490
	ldr r3, _08014494
	bl fe_spr_plot
	ldr r1, _08014450
	ldr r0, [r1, #8]
	movs r3, #0
	asrs r2, r0, #2
	str r2, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	cmp r0, #0x57
	bgt _08014424
	movs r2, #0x80
	lsls r0, r2, #3
	str r0, [sp, #0xc]
_0801440E:
	movs r0, #0x58
	movs r1, #0x50
	ldr r2, _08014498
	ldr r3, _0801449C
	bl fe_spr_plot
	ldr r1, _08014450
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	b _0801430E
_08014424:
	str r3, [sp, #0xc]
	b _0801440E
_08014428:
	str r3, [sp, #0xc]
	b _080143EA
_0801442C:
	bl fade_to_black
	movs r2, #6
	str r2, [r5]
	b _0801430E
	.global _08014436
_08014436:
	ldr r2, _08014470
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	bne _08014446
	b _0801430E
_08014446:
	movs r0, #0
	bl mcp_process
	b _0801430E
	.byte 0x00, 0x00
_08014450:
	.4byte 0x02023F98
_08014454:
	.4byte _080142B8
_08014458:
	.4byte 0x040000D4
_0801445C:
	.4byte gUnk_080E1AE0
_08014460:
	.4byte 0x06004000
_08014464:
	.4byte gUnk_082934F8
_08014468:
	.4byte 0x80000400
_0801446C:
	.4byte gUnk_0805A650
_08014470:
	.4byte gModeFlags
_08014474:
	.4byte gUnk_08447820
_08014478:
	.4byte gUnk_0863F780
_0801447C:
	.4byte gUnk_084490C0
_08014480:
	.4byte gUnk_0863F7A0
_08014484:
	.4byte gUnk_080E2AC2
_08014488:
	.4byte gUnk_082939FC
_0801448C:
	.4byte gUnk_0805A850
_08014490:
	.4byte gUnk_0843FB00
_08014494:
	.4byte gUnk_0863F740
_08014498:
	.4byte gUnk_084424F0
_0801449C:
	.4byte gUnk_0863F760
