@ asm/main.s: ROM 0x000114-0x0004B8 (rom, VMA 0x08000114)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global AgbMain
	.thumb_func
	.type AgbMain, %function
AgbMain: @ 08000114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08000158
	ldr r5, _0800015C
	sub sp, #0xc
	strh r3, [r5]
	movs r0, #0xc0
	ldr r5, _08000160
	ldr r1, _08000164
	movs r6, #0
	add r7, sp, #8
	lsls r4, r0, #0x12
	str r6, [sp, #8]
	movs r2, #0x80
	str r7, [r5]
	str r4, [r5, #4]
	str r1, [r5, #8]
	ldr r4, _08000168
	mov r1, sp
	adds r1, #6
	lsls r0, r2, #0x12
	ldr r3, [r5, #8]
	movs r2, #0xc0
	strh r6, [r1]
	str r1, [r5]
	str r0, [r5, #4]
	str r4, [r5, #8]
	ldr r4, _0800016C
	lsls r0, r2, #0x13
	ldr r3, [r5, #8]
	strh r6, [r1]
	str r1, [r5]
	b _08000170
_08000158:
	.4byte 0x00004017
_0800015C:
	.4byte 0x04000204
_08000160:
	.4byte 0x040000D4
_08000164:
	.4byte 0x85001F80
_08000168:
	.4byte 0x81020000
_0800016C:
	.4byte 0x8100C000
_08000170:
	str r0, [r5, #4]
	str r4, [r5, #8]
	movs r2, #0xe0
	ldr r3, [r5, #8]
	str r6, [sp, #8]
	str r7, [r5]
	ldr r7, _08000204
	lsls r0, r2, #0x13
	str r0, [r5, #4]
	str r7, [r5, #8]
	movs r4, #0xa0
	ldr r3, [r5, #8]
	ldr r0, _08000208
	strh r6, [r1]
	ldr r6, _0800020C
	lsls r2, r4, #0x13
	movs r4, #0x80
	str r1, [r5]
	ldr r7, _08000210
	str r2, [r5, #4]
	ldr r1, _08000214
	str r0, [r5, #8]
	lsls r2, r4, #0x18
	lsrs r0, r6, #1
	orrs r0, r2
	ldr r3, [r5, #8]
	str r1, [r5]
	str r7, [r5, #4]
	ldr r1, _08000218
	str r0, [r5, #8]
	ldr r0, _0800021C
	ldr r3, [r5, #8]
	str r1, [r0]
	ldr r1, _08000220
	ldr r2, _08000224
	movs r3, #0xe
_080001B8:
	subs r3, #1
	stm r2!, {r1}
	cmp r3, #0
	bge _080001B8
	ldr r3, _080001FC
	ldr r5, _08000228
	ldr r0, _08000224
	ldr r1, _08000200
	ldr r7, _0800022C
	ldr r6, _08000230
	str r5, [r0]
	strh r1, [r7]
	strh r3, [r6]
	bl AGBPrintInit
	ldr r0, _08000234
	movs r1, #0x16
	bl AGBPrintf
	ldr r0, _08000238
	ldr r1, _08000210
	ldr r2, _0800020C
	bl AGBPrintf
	ldr r0, _0800023C
	ldr r1, _08000240
	ldr r2, _08000244
	bl AGBPrintf
	ldr r2, _08000248
	ldr r1, _0800024C
	ldr r0, _08000250
	b _08000254
	.byte 0x00, 0x00
_080001FC:
	.4byte 0x00002001
_08000200:
	.4byte 0x00000008
_08000204:
	.4byte 0x85000100
_08000208:
	.4byte 0x81000200
_0800020C:
	.4byte __iwram_size
_08000210:
	.4byte IntrMain
_08000214:
	.4byte __iwram_lma
_08000218:
	.4byte IntrMain
_0800021C:
	.4byte 0x03007FFC
_08000220:
	.4byte sub_08000418
_08000224:
	.4byte gIrqHandler
_08000228:
	.4byte vblank_handler
_0800022C:
	.4byte 0x04000004
_08000230:
	.4byte 0x04000200
_08000234:
	.4byte gUnk_0804F49C
_08000238:
	.4byte gUnk_0804F4B4
_0800023C:
	.4byte gUnk_0804F4CC
_08000240:
	.4byte gIrqHandler
_08000244:
	.4byte 0x000022AC
_08000248:
	.4byte 0x0002F108
_0800024C:
	.4byte 0x02000000
_08000250:
	.4byte gUnk_0804F4E4
_08000254:
	bl AGBPrintf
	ldr r4, _08000294
	bl AGBPrintFlush
	ldr r6, _0800029C
	ldr r5, _080002A0
	strh r4, [r6]
	movs r4, #0
	str r4, [r5]
	ldr r5, _080002A4
	str r4, [r5]
	bl sound_init
	bl sub_08003550
	bl link_init
	bl eeprom_load
	bl fe_start
	ldr r0, _080002A8
	bl sub_08000BDC
	ldr r0, _08000298
	ldr r1, _080002AC
	strh r0, [r1]
	ldr r0, _080002B0
	ldr r1, _080002B4
	b _080002B8
	.byte 0x00, 0x00
_08000294:
	.4byte 0x00000000
_08000298:
	.4byte 0x00000001
_0800029C:
	.4byte gIrqFlags
_080002A0:
	.4byte 0x03005660
_080002A4:
	.4byte gModeFlags
_080002A8:
	.4byte 0x00001105
_080002AC:
	.4byte 0x04000208
_080002B0:
	.4byte gUnk_0804F4FC
_080002B4:
	.4byte gUnk_0804F514
_080002B8:
	bl AGBPrintf
	bl AGBPrintFlush
	ldr r7, _08000350
	ldr r2, _08000354
	mov r8, r5
	strh r4, [r2]
	strh r4, [r7]
	adds r7, r6, #0
_080002CC:
	bl AGBPrintFlush1Block
	mov r2, r8
	ldr r4, [r2]
	movs r1, #0x80
	lsls r3, r1, #7
	ands r4, r3
	cmp r4, #0
	bne _080002E0
	b _080003CA
_080002E0:
	bl link_sync
	ldr r6, _08000358
	ldr r4, _0800035C
	ldr r5, _08000360
	ldr r2, [r6]
	ldr r3, [r4]
	str r2, [r5]
	cmp r3, #0
	beq _080003B0
_080002F4:
	bl _call_via_r3
	mov r2, r8
	ldr r0, [r2]
	movs r3, #0x80
	lsls r1, r3, #8
	orrs r0, r1
	str r0, [r2]
	ldr r3, [r5]
	ldr r1, [r6]
	cmp r3, r1
	beq _08000382
_0800030C:
	ldr r1, _08000364
	ldr r0, [r1]
	ldr r2, _08000354
	adds r0, #1
	str r0, [r1]
	ldrh r0, [r2]
	ldr r1, _08000348
	ands r1, r0
	cmp r1, #0xf
	bne _080002CC
	ldr r0, _08000368
	ldr r1, _0800036C
	bl AGBPrintf
	bl AGBPrintFlush
	ldr r1, _0800034C
	ldr r0, _08000370
	strh r1, [r0]
	ldr r1, _08000374
	movs r3, #0
	str r3, [r1]
	adds r1, #0xc
	str r3, [r1]
	adds r1, #0xc
	str r3, [r1]
	adds r1, #0xc
	str r3, [r1]
	add sp, #0xc
	b _08000378
_08000348:
	.4byte 0x000003FF
_0800034C:
	.4byte 0x00000000
_08000350:
	.4byte gKeysNew
_08000354:
	.4byte gKeysHeld
_08000358:
	.4byte gVBlankCount
_0800035C:
	.4byte gStateFunc
_08000360:
	.4byte 0x02004220
_08000364:
	.4byte 0x03005660
_08000368:
	.4byte gUnk_0804F51C
_0800036C:
	.4byte gUnk_0804F514
_08000370:
	.4byte 0x04000208
_08000374:
	.4byte 0x040000B8
_08000378:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08000382:
	ldrh r0, [r7]
	ldr r3, _080003A8
	ands r0, r3
	strh r0, [r7]
	ldrh r1, [r7]
	movs r0, #1
	bics r0, r1
	cmp r0, #0
	beq _0800030C
	ldr r0, _080003AC
	movs r1, #1
_08000398:
	svc #2
	ldrh r2, [r0]
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	bne _08000398
	b _0800030C
	.byte 0x00, 0x00
_080003A8:
	.4byte 0xFFFFFFFE
_080003AC:
	.4byte gIrqFlags
_080003B0:
	ldr r0, _080003FC
	ldr r1, _08000400
	str r0, [sp]
	ldr r2, _08000404
	ldr r0, _08000408
	ldr r3, _0800040C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r3, [r4]
	b _080002F4
_080003CA:
	bl link_sync
	ldr r4, _08000410
	ldr r3, [r4]
	cmp r3, #0
	beq _080003E0
_080003D6:
	bl _call_via_r3
	bl snd_update
	b _0800030C
_080003E0:
	ldr r2, _080003FC
	ldr r0, _08000408
	str r2, [sp]
	ldr r1, _08000400
	ldr r2, _08000404
	ldr r3, _08000414
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r3, [r4]
	b _080003D6
	.byte 0x00, 0x00
_080003FC:
	.4byte gUnk_0804F544
_08000400:
	.4byte gUnk_0804F558
_08000404:
	.4byte gUnk_0804F514
_08000408:
	.4byte gUnk_0804F564
_0800040C:
	.4byte 0x00000293
_08000410:
	.4byte gStateFunc
_08000414:
	.4byte 0x000002C9

	.global sub_08000418
	.thumb_func
	.type sub_08000418, %function
sub_08000418: @ 08000418
	bx lr
	.byte 0x00, 0x00

	.global sub_0800041C
	.thumb_func
	.type sub_0800041C, %function
sub_0800041C: @ 0800041C
	push {lr}
	ldr r0, _0800043C
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	bl sound_vblank
	ldr r0, _08000440
	ldr r3, _08000438
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	pop {r0}
	bx r0
_08000438:
	.4byte 0x00000001
_0800043C:
	.4byte gVBlankCount
_08000440:
	.4byte gIrqFlags

	.global sub_08000444
	.thumb_func
	.type sub_08000444, %function
sub_08000444: @ 08000444
	push {lr}
	ldr r2, _0800045C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #7
	ands r0, r1
	cmp r0, #0
	beq _08000458
	bl snd_update
_08000458:
	pop {r0}
	bx r0
_0800045C:
	.4byte gModeFlags

	.global vblank_handler
	.thumb_func
	.type vblank_handler, %function
vblank_handler: @ 08000460
	push {lr}
	ldr r0, _08000490
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	bl sound_vblank
	ldr r0, _08000494
	ldr r3, _0800048C
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	ldr r2, _08000498
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #7
	ands r0, r1
	cmp r0, #0
	beq _0800049C
	bl snd_update
	b _0800049C
_0800048C:
	.4byte 0x00000001
_08000490:
	.4byte gVBlankCount
_08000494:
	.4byte gIrqFlags
_08000498:
	.4byte gModeFlags
_0800049C:
	pop {r0}
	bx r0
	.byte 0x02, 0x49, 0x03, 0x48, 0x01, 0x80, 0x03, 0x48, 0x01, 0x80, 0x70, 0x47, 0x00, 0x00, 0x00, 0x00
	.byte 0x5C, 0x56, 0x00, 0x03, 0x5E, 0x56, 0x00, 0x03
