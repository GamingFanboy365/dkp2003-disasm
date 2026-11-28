@ asm/act_camera.s: ROM 0x00F0BC-0x00F5E0 (rom, VMA 0x0800F0BC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global camera_race_start
	.thumb_func
	.type camera_race_start, %function
camera_race_start: @ 0800F0BC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x20
	cmp r7, #0
	bne _0800F0D2
	b _0800F250
_0800F0D2:
	ldrb r0, [r7, #2]
	cmp r0, #3
	beq _0800F0F0
	ldr r1, _0800F12C
	movs r4, #0xf0
	str r1, [sp]
	ldr r0, _0800F130
	ldr r1, _0800F134
	ldr r2, _0800F138
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0800F0F0:
	adds r4, r7, #0
	adds r4, #0x54
	str r4, [sp, #4]
	ldr r3, [sp, #4]
	ldr r6, _0800F128
	ldr r4, _0800F13C
	strh r6, [r3]
	ldr r1, [r4]
	ldr r5, _0800F140
	lsls r0, r1, #2
	ldr r2, [r5, r0]
	adds r2, #0x56
	ldrh r1, [r2]
	adds r0, r7, #0
	adds r0, #0x56
	strh r1, [r0]
	adds r0, #2
	strh r6, [r0]
	movs r6, #0xa0
	adds r3, r6, r7
	mov fp, r3
	movs r2, #0
	mov r1, fp
	str r2, [r1]
	adds r6, r5, #0
	movs r5, #0xb
	b _0800F144
	.byte 0x00, 0x00
_0800F128:
	.4byte 0x00000000
_0800F12C:
	.4byte gUnk_080502F4
_0800F130:
	.4byte gUnk_08050310
_0800F134:
	.4byte gUnk_0805034C
_0800F138:
	.4byte gUnk_08050360
_0800F13C:
	.4byte gLocalPlayerIndex
_0800F140:
	.4byte gRacerObjects
_0800F144:
	ldr r0, [r4]
	lsls r2, r0, #2
	ldr r1, [r6, r2]
	adds r0, r7, #0
	subs r5, #1
	bl sub_0800E9B8
	cmp r5, #0
	bge _0800F144
	mov r3, fp
	ldr r5, [r3, #8]
	movs r6, #1
	orrs r5, r6
	mov r1, fp
	str r6, [r3, #4]
	str r5, [r1, #8]
	bl sub_08004AF0
	ldr r2, _0800F268
	ldr r6, _0800F26C
	mov r8, r2
	movs r4, #0
	movs r5, #8
_0800F172:
	mov r3, r8
	adds r0, r4, r3
	adds r1, r4, r6
	subs r5, #1
	bl sub_080044D0
	adds r4, #0xc
	cmp r5, #0
	bge _0800F172
	ldr r2, _0800F270
	ldr r6, [r2]
	ldr r4, _0800F274
	lsls r5, r6, #2
	ldr r6, [r4, r5]
	movs r0, #0x56
	adds r1, r0, r6
	movs r2, #0
	ldrsh r5, [r1, r2]
	mov r8, r1
	adds r0, r5, #0
	ldr r1, _0800F278
	bl _call_via_r1
	lsls r3, r0, #0x10
	ldr r1, [r7, #0x24]
	asrs r4, r3, #0x10
	ldr r3, [r6, #0x24]
	subs r2, r1, r3
	mov sl, r1
	adds r1, r2, #0
	muls r1, r4, r1
	ldr r2, _0800F27C
	adds r0, r5, #0
	mov sb, r2
	asrs r4, r1, #0xc
	bl _call_via_r9
	lsls r5, r0, #0x10
	ldr r3, [r6, #0x2c]
	asrs r2, r5, #0x10
	ldr r5, [r7, #0x2c]
	subs r1, r5, r3
	muls r1, r2, r1
	asrs r0, r1, #0xc
	subs r2, r4, r0
	str r2, [sp, #0x14]
	ldr r4, [r7, #0x28]
	ldr r1, [r6, #0x28]
	subs r0, r4, r1
	str r0, [sp, #0x18]
	mov r3, r8
	movs r1, #0
	ldrsh r3, [r3, r1]
	mov r8, r3
	ldr r2, _0800F278
	mov r0, r8
	bl _call_via_r2
	ldr r1, [r6, #0x2c]
	lsls r3, r0, #0x10
	asrs r4, r3, #0x10
	subs r5, r5, r1
	adds r2, r5, #0
	muls r2, r4, r2
	mov r0, r8
	asrs r4, r2, #0xc
	bl _call_via_r9
	ldr r1, [r6, #0x24]
	mov r2, sl
	subs r2, r2, r1
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	mov sl, r2
	mov r1, sl
	muls r1, r0, r1
	asrs r2, r1, #0xc
	adds r1, r4, r2
	str r1, [sp, #0x1c]
	ldr r3, [sp, #4]
	movs r1, #0
	ldrsh r0, [r3, r1]
	add r4, sp, #8
	add r2, sp, #0x14
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	adds r1, r4, #0
	adds r0, r2, #0
	bl sub_080044D0
	add r3, sp, #0x14
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080044D0
	movs r1, #2
	mov r2, fp
	str r1, [r2, #4]
	bl sub_08004B7C
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800F250:
	ldr r0, _0800F280
	ldr r1, _0800F284
	str r0, [sp]
	ldr r2, _0800F288
	ldr r0, _0800F28C
	ldr r3, _0800F290
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F0D2
_0800F268:
	.4byte gUnk_0884E25C
_0800F26C:
	.4byte gUnk_0884E2C8
_0800F270:
	.4byte gLocalPlayerIndex
_0800F274:
	.4byte gRacerObjects
_0800F278:
	.4byte sub_03000134
_0800F27C:
	.4byte sub_03000138
_0800F280:
	.4byte gUnk_08050374
_0800F284:
	.4byte gUnk_0805034C
_0800F288:
	.4byte gUnk_08050360
_0800F28C:
	.4byte gUnk_08050310
_0800F290:
	.4byte 0x000001DF

	.global camera_op_set
	.thumb_func
	.type camera_op_set, %function
camera_op_set: @ 0800F294
	push {lr}
	sub sp, #4
	cmp r0, #6
	bhi _0800F338
	ldr r3, _0800F350
	lsls r1, r0, #2
	ldr r0, [r1, r3]
	mov pc, r0
	.global _0800F2A4
_0800F2A4:
	.4byte _0800F2C0
	.4byte _0800F2D0
	.4byte _0800F30E
	.4byte _0800F318
	.4byte _0800F320
	.4byte _0800F328
	.4byte _0800F330
	.global _0800F2C0
_0800F2C0:
	ldr r2, _0800F354
	ldr r0, [r2]
	movs r1, #0
_0800F2C6:
	adds r0, #0xa0
	str r1, [r0, #4]
_0800F2CA:
	add sp, #4
	pop {r0}
	bx r0
	.global _0800F2D0
_0800F2D0:
	ldr r3, _0800F358
	movs r1, #2
	ldrsh r2, [r3, r1]
	cmp r2, #1
	beq _0800F2FE
	cmp r2, #4
	beq _0800F2FE
	adds r3, #0x86
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _0800F35C
	adds r1, #0x54
_0800F2EC:
	ldr r0, [r3, r1]
	bl sub_08004558
	ldr r2, _0800F354
	ldr r1, [r2]
	movs r0, #1
	adds r1, #0xa0
	str r0, [r1, #4]
	b _0800F2CA
_0800F2FE:
	adds r3, #0x86
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _0800F35C
	adds r1, #0x58
	b _0800F2EC
	.global _0800F30E
_0800F30E:
	ldr r1, _0800F354
	ldr r0, [r1]
	bl camera_race_start
	b _0800F2CA
	.global _0800F318
_0800F318:
	ldr r2, _0800F354
	ldr r0, [r2]
	movs r1, #3
	b _0800F2C6
	.global _0800F320
_0800F320:
	ldr r2, _0800F354
	ldr r0, [r2]
	movs r1, #4
	b _0800F2C6
	.global _0800F328
_0800F328:
	ldr r2, _0800F354
	ldr r0, [r2]
	movs r1, #5
	b _0800F2C6
	.global _0800F330
_0800F330:
	ldr r2, _0800F354
	ldr r0, [r2]
	movs r1, #6
	b _0800F2C6
_0800F338:
	ldr r0, _0800F360
	ldr r1, _0800F364
	str r0, [sp]
	ldr r2, _0800F368
	ldr r0, _0800F36C
	ldr r3, _0800F370
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F2CA
_0800F350:
	.4byte _0800F2A4
_0800F354:
	.4byte 0x0200436C
_0800F358:
	.4byte gGameSetup
_0800F35C:
	.4byte gUnk_087146C0
_0800F360:
	.4byte gUnk_08050380
_0800F364:
	.4byte gUnk_0805034C
_0800F368:
	.4byte gUnk_08050388
_0800F36C:
	.4byte gUnk_08050310
_0800F370:
	.4byte 0x00000242

	.global init_camera
	.thumb_func
	.type init_camera, %function
init_camera: @ 0800F374
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _0800F42E
_0800F37E:
	ldr r1, _0800F3B8
	ldr r4, _0800F3BC
	adds r0, r5, #0
	movs r2, #3
	adds r0, #0x54
	strh r1, [r5]
	strb r2, [r5, #2]
	ldr r1, _0800F3C4
	strh r4, [r0]
	ldr r2, [r1]
	ldr r0, _0800F3C8
	lsls r1, r2, #2
	ldr r4, [r0, r1]
	adds r4, #0x56
	ldrh r2, [r4]
	adds r4, r5, #0
	adds r4, #0x56
	strh r2, [r4]
	ldr r2, _0800F3C0
	adds r4, r5, #0
	adds r4, #0x58
	strh r2, [r4]
	adds r2, r5, #0
	adds r2, #0xa0
	movs r4, #0
	str r4, [r2, #4]
	ldr r1, [r0, r1]
	b _0800F3CC
	.byte 0x00, 0x00
_0800F3B8:
	.4byte 0x00000005
_0800F3BC:
	.4byte 0x00000A00
_0800F3C0:
	.4byte 0x00000000
_0800F3C4:
	.4byte gLocalPlayerIndex
_0800F3C8:
	.4byte gRacerObjects
_0800F3CC:
	adds r0, r5, #0
	bl sub_0800E9B8
	bl sub_08004AF0
	movs r1, #0xd3
	ldr r0, _0800F448
	ldr r2, _0800F44C
	lsls r3, r1, #2
	movs r1, #0xd0
	str r3, [r0]
	lsls r3, r1, #4
	ldr r1, [r2]
	ldr r0, _0800F450
	adds r1, #0xa0
	str r3, [r0]
	ldr r2, _0800F454
	str r4, [r1, #0xc]
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _0800F41C
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _0800F458
	adds r0, #0x64
_0800F408:
	ldr r1, [r3, r0]
	ldm r1!, {r2}
	ldr r0, _0800F45C
	str r2, [r0]
	ldr r2, _0800F460
	add sp, #4
	str r1, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
_0800F41C:
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _0800F458
	adds r0, #0x68
	b _0800F408
_0800F42E:
	ldr r0, _0800F464
	ldr r1, _0800F468
	str r0, [sp]
	ldr r2, _0800F46C
	ldr r0, _0800F470
	ldr r3, _0800F474
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F37E
	.byte 0x00, 0x00
_0800F448:
	.4byte 0x02023F6C
_0800F44C:
	.4byte 0x0200436C
_0800F450:
	.4byte 0x02023F70
_0800F454:
	.4byte gGameSetup
_0800F458:
	.4byte gUnk_087146C0
_0800F45C:
	.4byte 0x02023F78
_0800F460:
	.4byte 0x02023F74
_0800F464:
	.4byte gUnk_08050374
_0800F468:
	.4byte gUnk_0805034C
_0800F46C:
	.4byte gUnk_08050398
_0800F470:
	.4byte gUnk_08050310
_0800F474:
	.4byte 0x0000024A

	.global act_camera
	.thumb_func
	.type act_camera, %function
act_camera: @ 0800F478
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	bne _0800F484
	b _0800F598
_0800F484:
	adds r7, r4, #0
	adds r7, #0xa0
	ldr r3, [r7, #4]
	cmp r3, #6
	bls _0800F490
	b _0800F580
_0800F490:
	ldr r2, _0800F5B0
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.global _0800F498
_0800F498:
	.4byte _0800F4B4
	.4byte _0800F4CC
	.4byte _0800F4CC
	.4byte _0800F4DE
	.4byte _0800F4E6
	.4byte _0800F552
	.4byte _0800F4C4
	.global _0800F4B4
_0800F4B4:
	ldr r1, _0800F5B4
	ldr r2, [r1]
	lsls r0, r2, #2
	ldr r2, _0800F5B8
	ldr r1, [r2, r0]
	adds r0, r4, #0
	bl sub_0800E9B8
	.global _0800F4C4
_0800F4C4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.global _0800F4CC
_0800F4CC:
	ldr r1, _0800F5B4
	ldr r2, [r1]
	lsls r0, r2, #2
	ldr r2, _0800F5B8
	ldr r1, [r2, r0]
	adds r0, r4, #0
	bl sub_0800ED18
	b _0800F4C4
	.global _0800F4DE
_0800F4DE:
	adds r0, r4, #0
	bl cam_path_add_point
	b _0800F4C4
	.global _0800F4E6
_0800F4E6:
	ldr r2, _0800F5B4
	ldr r0, [r2]
	ldr r2, _0800F5B8
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	ldr r1, _0800F5BC
	ldr r2, [r1]
	cmp r2, #0
	ble _0800F4C4
	ldr r6, [r7, #0xc]
	movs r5, #0xc
	adds r1, r6, #0
	muls r1, r5, r1
	ldr r2, _0800F5C0
	ldr r6, [r2]
	adds r2, r6, r1
	movs r4, #6
	ldrsh r3, [r2, r4]
	mov ip, r3
	mov r4, ip
	muls r4, r5, r4
	ldr r3, [r0, #0x24]
	adds r5, r6, r4
	ldr r4, [r0, #0x2c]
	asrs r1, r3, #8
	asrs r0, r4, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	subs r6, r1, r3
	movs r4, #4
	ldrsh r3, [r2, r4]
	subs r2, r0, r3
	adds r4, r6, #0
	muls r4, r6, r4
	adds r6, r2, #0
	muls r6, r2, r6
	movs r2, #0
	ldrsh r3, [r5, r2]
	adds r4, r4, r6
	subs r6, r1, r3
	movs r1, #4
	ldrsh r3, [r5, r1]
	subs r2, r0, r3
	adds r1, r2, #0
	muls r1, r2, r1
	adds r0, r6, #0
	muls r0, r6, r0
	adds r3, r1, #0
	adds r1, r0, r3
	cmp r4, r1
	bls _0800F4C4
	mov r2, ip
	str r2, [r7, #0xc]
	b _0800F4C4
	.global _0800F552
_0800F552:
	ldr r0, _0800F5B4
	ldr r2, [r0]
	lsls r1, r2, #2
	ldr r2, _0800F5B8
	ldr r0, [r2, r1]
	ldr r1, [r0, #0x24]
	str r1, [r4, #0x24]
	ldr r1, [r0, #0x28]
	str r1, [r4, #0x28]
	ldr r1, [r0, #0x2c]
	adds r2, r0, #0
	str r1, [r4, #0x2c]
	adds r2, #0x54
	ldrh r1, [r2]
	adds r2, r4, #0
	adds r2, #0x54
	strh r1, [r2]
	adds r0, #0x56
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
	b _0800F4C4
_0800F580:
	ldr r1, _0800F5C4
	ldr r0, _0800F5C8
	str r1, [sp]
	ldr r2, _0800F5CC
	ldr r1, _0800F5D0
	ldr r3, _0800F5D4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F4C4
_0800F598:
	ldr r0, _0800F5D8
	ldr r1, _0800F5D0
	str r0, [sp]
	ldr r2, _0800F5CC
	ldr r0, _0800F5C8
	ldr r3, _0800F5DC
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F484
_0800F5B0:
	.4byte _0800F498
_0800F5B4:
	.4byte gLocalPlayerIndex
_0800F5B8:
	.4byte gRacerObjects
_0800F5BC:
	.4byte 0x02023F78
_0800F5C0:
	.4byte 0x02023F74
_0800F5C4:
	.4byte gUnk_08050380
_0800F5C8:
	.4byte gUnk_08050310
_0800F5CC:
	.4byte gUnk_080503A4
_0800F5D0:
	.4byte gUnk_0805034C
_0800F5D4:
	.4byte 0x00000285
_0800F5D8:
	.4byte gUnk_08050374
_0800F5DC:
	.4byte 0x0000026E
