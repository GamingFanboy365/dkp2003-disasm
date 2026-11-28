@ asm/act_life_meter.s: ROM 0x02D338-0x02D834 (rom, VMA 0x0802D338)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_life_meter
	.thumb_func
	.type init_life_meter, %function
init_life_meter: @ 0802D338
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	cmp r0, #0
	bne _0802D34E
	b _0802D5D8
_0802D34E:
	ldr r1, _0802D384
	mov r0, r8
	strh r1, [r0]
	movs r5, #0x80
	mov r1, r8
	adds r1, #0xa0
	movs r6, #0
	lsls r2, r5, #9
	str r6, [r1, #4]
	str r2, [r1, #0x10]
	ldr r3, [r1, #0xc]
	ldr r4, [r0, #0x28]
	cmp r3, r4
	bgt _0802D36C
	b _0802D5D2
_0802D36C:
	movs r7, #0xe0
	lsls r0, r7, #3
	str r0, [r1, #8]
_0802D372:
	ldr r1, [r1]
	ldr r6, _0802D388
	lsls r3, r1, #1
	movs r2, #0
	ldrsh r5, [r6, r2]
	adds r3, #4
	mov fp, r1
	ldrsh r4, [r6, r3]
	b _0802D38C
_0802D384:
	.4byte 0x00001001
_0802D388:
	.4byte gGameSetup
_0802D38C:
	cmp r5, #6
	bne _0802D392
	b _0802D5CE
_0802D392:
	movs r0, #7
_0802D394:
	bl spr_get_info
	mov r1, r8
	adds r1, #0x5a
	strh r0, [r1]
	ldrh r1, [r1]
	mov lr, r1
	ldr r1, _0802D414
	lsls r4, r4, #2
	ldr r5, [r1, r4]
	mov sb, r4
	movs r4, #0x18
	mov r1, lr
	muls r1, r4, r1
	ldr r4, _0802D418
	lsls r2, r5, #4
	ldr r0, _0802D41C
	ldr r6, [r4, r2]
	adds r7, r1, #0
	adds r7, #0x14
	str r6, [r0, r7]
	adds r3, r2, #0
	adds r3, #0xc
	ldr r5, [r4, r3]
	adds r6, r1, #4
	adds r6, r6, r0
	adds r2, #4
	strh r5, [r6, #2]
	ldr r5, [r4, r2]
	subs r7, #4
	str r5, [r0, r7]
	ldr r3, _0802D420
	mov r5, sb
	ldr r4, _0802D40C
	ldr r2, [r3, r5]
	adds r7, r1, #0
	adds r7, #8
	strh r4, [r0, r7]
	adds r3, r1, r0
	strh r2, [r0, r1]
	adds r2, r7, r0
	ldr r0, _0802D410
	strh r4, [r3, #2]
	ldr r1, _0802D424
	strh r4, [r6]
	strh r0, [r2, #2]
	mov r0, fp
	lsls r6, r0, #2
	ldr r7, [r1, r6]
	movs r5, #0x87
	lsls r4, r5, #1
	adds r0, r7, r4
	ldrh r2, [r0]
	cmp r2, #1
	bne _0802D404
	b _0802D5C8
_0802D404:
	ldr r2, _0802D428
	str r2, [sp, #8]
	b _0802D42C
	.byte 0x00, 0x00
_0802D40C:
	.4byte 0x00000000
_0802D410:
	.4byte 0x00000100
_0802D414:
	.4byte gUnk_0885009C
_0802D418:
	.4byte gUnk_08713650
_0802D41C:
	.4byte gSprites
_0802D420:
	.4byte gUnk_088500E4
_0802D424:
	.4byte gRacerObjects
_0802D428:
	.4byte gUnk_0863F160
_0802D42C:
	movs r5, #0x18
	mov sb, r5
	ldr r1, _0802D46C
	movs r5, #4
	rsbs r3, r5, #0
	ldr r4, _0802D474
	ldr r6, _0802D470
	movs r7, #0
	mov sl, r1
	mov ip, r3
_0802D440:
	ldr r0, _0802D478
	mov r3, lr
	ldrb r2, [r0, r3]
	mov r5, sb
	mov lr, r2
	mov r2, lr
	muls r2, r5, r2
	ldr r3, _0802D47C
	adds r1, r2, #4
	adds r5, r2, #0
	adds r0, r1, r4
	adds r5, #0x14
	str r3, [r4, r5]
	strh r6, [r0, #2]
	ldr r3, [sp, #8]
	subs r5, #4
	adds r1, r2, #0
	str r3, [r4, r5]
	adds r1, #8
	mov r5, sl
	strh r5, [r4, r1]
	b _0802D480
_0802D46C:
	.4byte 0x00000008
_0802D470:
	.4byte 0x00000000
_0802D474:
	.4byte gSprites
_0802D478:
	.4byte gSpriteNext
_0802D47C:
	.4byte gUnk_08639220
_0802D480:
	lsls r5, r7, #3
	strh r5, [r4, r2]
	adds r3, r2, r4
	mov r5, ip
	strh r5, [r3, #2]
	ldr r5, _0802D4C0
	strh r6, [r0]
	adds r7, #1
	adds r0, r1, r4
	strh r5, [r0, #2]
	cmp r7, #5
	ble _0802D440
	ldr r6, _0802D4C8
	movs r0, #0
	ldrsh r7, [r6, r0]
	cmp r7, #6
	beq _0802D562
_0802D4A2:
	movs r7, #0xe8
	mov r5, fp
	muls r5, r7, r5
	mov r0, r8
	bl obj_add_draw
	ldr r4, _0802D4CC
	adds r2, r5, r4
	mov sb, r2
	ldr r2, _0802D4C4
	movs r5, #0x1f
	movs r0, #0
	movs r7, #0
	b _0802D4D0
	.byte 0x00, 0x00
_0802D4C0:
	.4byte 0x00000100
_0802D4C4:
	.4byte 0x0000001F
_0802D4C8:
	.4byte gGameSetup
_0802D4CC:
	.4byte 0x0202EC60
_0802D4D0:
	mov r8, r2
	mov sl, r5
	mov lr, r0
_0802D4D6:
	ldr r6, [sp, #8]
	mov r1, lr
	ldrh r0, [r1, r6]
	lsls r2, r0, #0x10
	lsrs r5, r2, #0x1a
	mov r1, r8
	ands r5, r1
	mov r6, sl
	ldr r1, _0802D5B0
	ands r6, r0
	lsrs r4, r2, #0x15
	mov r0, r8
	mov r2, lr
	ands r0, r4
	ldrh r4, [r2, r1]
	mov ip, r0
	lsls r3, r4, #0x10
	mov r0, sl
	mov r2, r8
	ands r0, r4
	lsrs r1, r3, #0x1a
	lsrs r4, r3, #0x15
	movs r3, #0xc
	ands r4, r2
	ands r1, r2
	adds r2, r7, #0
	muls r2, r3, r2
	lsls r3, r6, #0xa
	add r2, sb
	strh r3, [r2]
	mov r3, ip
	lsls r3, r3, #0xa
	str r3, [sp, #4]
	mov r3, sp
	ldrh r3, [r3, #4]
	subs r0, r0, r6
	strh r3, [r2, #2]
	lsls r3, r5, #0xa
	strh r3, [r2, #4]
	lsls r3, r0, #0xa
	mov r0, ip
	strh r3, [r2, #6]
	subs r3, r4, r0
	lsls r4, r3, #0xa
	subs r3, r1, r5
	lsls r0, r3, #0xa
	adds r7, #1
	movs r3, #2
	strh r4, [r2, #8]
	strh r0, [r2, #0xa]
	add lr, r3
	cmp r7, #0xf
	ble _0802D4D6
	movs r2, #0xe8
	mov r1, fp
	muls r1, r2, r1
	ldr r0, _0802D5B4
	movs r3, #0
	adds r2, r1, #4
	str r3, [r0, r2]
	add sp, #0xc
	str r3, [r0, r1]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802D562:
	ldr r6, _0802D5B8
	mov r1, lr
	ldrb r3, [r6, r1]
	movs r1, #0x18
	mov sl, r3
	mov r6, sl
	muls r6, r1, r6
	ldr r2, _0802D5BC
	ldr r0, _0802D5A4
	ldr r7, _0802D5A8
	adds r1, r6, #0
	strh r0, [r2, r6]
	adds r3, r6, #4
	ldr r0, _0802D5AC
	adds r4, r6, r2
	adds r1, #8
	strh r7, [r4, #2]
	adds r7, r1, r2
	adds r1, r3, r2
	strh r0, [r2, r3]
	strh r5, [r7, #2]
	strh r0, [r1, #2]
	adds r5, r6, #0
	ldr r0, _0802D5C0
	adds r5, #0x14
	ldr r1, _0802D5C4
	str r0, [r2, r5]
	adds r6, #0x10
	mov r5, fp
	str r1, [r2, r6]
	strh r5, [r7]
	b _0802D4A2
	.byte 0x00, 0x00
_0802D5A4:
	.4byte 0xFFFFFFE0
_0802D5A8:
	.4byte 0xFFFFFFF6
_0802D5AC:
	.4byte 0x00000000
_0802D5B0:
	.4byte gUnk_0863F140
_0802D5B4:
	.4byte 0x0202EC58
_0802D5B8:
	.4byte gSpriteNext
_0802D5BC:
	.4byte gSprites
_0802D5C0:
	.4byte gUnk_083D9200
_0802D5C4:
	.4byte gUnk_0863F640
_0802D5C8:
	ldr r0, _0802D5F0
	str r0, [sp, #8]
	b _0802D42C
_0802D5CE:
	movs r0, #8
	b _0802D394
_0802D5D2:
	ldr r4, _0802D5F4
	str r4, [r1, #8]
	b _0802D372
_0802D5D8:
	ldr r0, _0802D5F8
	ldr r1, _0802D5FC
	str r0, [sp]
	ldr r2, _0802D600
	ldr r0, _0802D604
	movs r3, #0xbb
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D34E
_0802D5F0:
	.4byte gUnk_0863F120
_0802D5F4:
	.4byte 0xFFFFF900
_0802D5F8:
	.4byte gUnk_08053730
_0802D5FC:
	.4byte gUnk_0805373C
_0802D600:
	.4byte gUnk_08053754
_0802D604:
	.4byte gUnk_08053764

	.global act_life_meter
	.thumb_func
	.type act_life_meter, %function
act_life_meter: @ 0802D608
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	cmp r0, #0
	bne _0802D61E
	b _0802D7CA
_0802D61E:
	mov r4, r8
	adds r4, #0xa0
	ldr r3, [r4, #4]
	cmp r3, #1
	bne _0802D62A
	b _0802D79A
_0802D62A:
	cmp r3, #1
	bgt _0802D658
	cmp r3, #0
	beq _0802D644
_0802D632:
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802D644:
	ldr r1, _0802D654
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #5
	bne _0802D632
	movs r2, #1
	str r2, [r4, #4]
	b _0802D632
_0802D654:
	.4byte gGameSetup
_0802D658:
	cmp r3, #2
	bne _0802D632
	ldr r5, [r4]
	ldr r1, _0802D6F8
	lsls r6, r5, #2
	ldr r2, [r1, r6]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	bgt _0802D66C
	b _0802D792
_0802D66C:
	movs r6, #0x92
	lsls r0, r6, #1
	adds r3, r0, r2
	ldr r2, [r3]
	mov ip, r3
	cmp r2, r1
	bne _0802D67C
	b _0802D78A
_0802D67C:
	movs r7, #0x5a
	add r7, r8
	ldrh r0, [r7]
	movs r2, #0x18
	adds r6, r0, #0
	muls r6, r2, r6
	mov sl, r7
	ldr r3, _0802D6FC
	lsls r7, r5, #1
	adds r7, #4
	ldrsh r1, [r3, r7]
	ldr r5, _0802D700
	lsls r2, r1, #2
	ldr r7, [r5, r2]
	ldr r1, _0802D704
	adds r6, #0x10
	movs r5, #0xa
	str r7, [r1, r6]
	str r5, [r4, #0x14]
	mov r7, ip
	ldr r6, [r7]
	movs r7, #0x30
	muls r7, r6, r7
	asrs r5, r7, #0x13
	asrs r1, r7, #0x10
	lsls r2, r5, #3
	subs r7, r1, r2
	str r7, [sp, #4]
	cmp r6, #0
	beq _0802D6BC
	cmp r1, #0
	beq _0802D784
_0802D6BC:
	ldr r3, _0802D708
	ldr r7, _0802D6F0
	mov fp, r3
	ldr r3, _0802D6F4
	ldr r6, _0802D704
	movs r2, #0
	movs r1, #0x18
	mov sb, r3
	mov lr, r7
_0802D6CE:
	mov r7, fp
	ldrb r0, [r7, r0]
	cmp r2, r5
	bge _0802D76E
	adds r3, r0, #0
	muls r3, r1, r3
	mov r7, sb
_0802D6DC:
	adds r3, #8
	strh r7, [r6, r3]
	adds r2, #1
	cmp r2, #5
	ble _0802D6CE
	mov r0, ip
	ldr r5, [r0]
	str r5, [r4, #0x10]
	b _0802D70C
	.byte 0x00, 0x00
_0802D6F0:
	.4byte 0x00000000
_0802D6F4:
	.4byte 0x00000008
_0802D6F8:
	.4byte gRacerObjects
_0802D6FC:
	.4byte gGameSetup
_0802D700:
	.4byte gUnk_088500C0
_0802D704:
	.4byte gSprites
_0802D708:
	.4byte gSpriteNext
_0802D70C:
	ldr r3, [r4, #0x14]
	cmp r3, #0
	ble _0802D71A
	subs r3, #2
	str r3, [r4, #0x14]
	cmp r3, #0
	ble _0802D740
_0802D71A:
	mov r0, r8
	bl life_meter_pal_pulse
	mov r2, sl
	ldr r6, _0802D7E4
	ldr r5, _0802D7E8
	adds r1, r0, #0
	movs r4, #0x18
	ldrh r0, [r2]
	movs r2, #5
_0802D72E:
	ldrb r0, [r6, r0]
	adds r3, r0, #0
	muls r3, r4, r3
	subs r2, #1
	adds r3, #0x10
	str r1, [r5, r3]
	cmp r2, #0
	bge _0802D72E
	b _0802D632
_0802D740:
	movs r6, #0
	str r6, [r4, #0x14]
	mov r5, sl
	ldrh r3, [r5]
	movs r2, #0x18
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r7, [r4]
	ldr r4, _0802D7EC
	lsls r5, r7, #1
	adds r5, #4
	ldrsh r1, [r4, r5]
	ldr r0, _0802D7F0
	lsls r4, r1, #2
	ldr r5, [r0, r4]
	ldr r1, _0802D7F4
	lsls r2, r5, #4
	adds r2, #4
	ldr r0, [r1, r2]
	ldr r4, _0802D7E8
	adds r6, #0x10
	str r0, [r4, r6]
	b _0802D71A
_0802D76E:
	cmp r2, r5
	beq _0802D77A
	adds r3, r0, #0
	muls r3, r1, r3
	mov r7, lr
	b _0802D6DC
_0802D77A:
	adds r3, r0, #0
	muls r3, r1, r3
	mov r7, sp
	ldrh r7, [r7, #4]
	b _0802D6DC
_0802D784:
	movs r6, #1
	str r6, [sp, #4]
	b _0802D6BC
_0802D78A:
	movs r3, #0x5a
	add r3, r8
	mov sl, r3
	b _0802D70C
_0802D792:
	movs r2, #0x5a
	add r2, r8
	mov sl, r2
	b _0802D70C
_0802D79A:
	mov r0, r8
	ldr r1, [r0, #0x28]
	ldr r3, [r4, #8]
	adds r2, r1, r3
	str r2, [r0, #0x28]
	ldr r1, [r4, #8]
	cmp r1, #0
	ble _0802D7B0
	ldr r0, [r4, #0xc]
	cmp r2, r0
	bge _0802D7BE
_0802D7B0:
	cmp r1, #0
	blt _0802D7B6
	b _0802D632
_0802D7B6:
	ldr r1, [r4, #0xc]
	cmp r2, r1
	ble _0802D7BE
	b _0802D632
_0802D7BE:
	ldr r0, [r4, #0xc]
	mov r2, r8
	str r0, [r2, #0x28]
	movs r2, #2
	str r2, [r4, #4]
	b _0802D632
_0802D7CA:
	ldr r0, _0802D7F8
	ldr r1, _0802D7FC
	str r0, [sp]
	ldr r2, _0802D800
	ldr r0, _0802D804
	ldr r3, _0802D808
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D61E
	.byte 0x00, 0x00
_0802D7E4:
	.4byte gSpriteNext
_0802D7E8:
	.4byte gSprites
_0802D7EC:
	.4byte gGameSetup
_0802D7F0:
	.4byte gUnk_0885009C
_0802D7F4:
	.4byte gUnk_08713650
_0802D7F8:
	.4byte gUnk_08053730
_0802D7FC:
	.4byte gUnk_0805373C
_0802D800:
	.4byte gUnk_080537A0
_0802D804:
	.4byte gUnk_08053764
_0802D808:
	.4byte 0x00000143

	.global snd_init
	.thumb_func
	.type snd_init, %function
snd_init: @ 0802D80C
	push {lr}
	bl audio_init
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global snd_vsync
	.thumb_func
	.type snd_vsync, %function
snd_vsync: @ 0802D818
	push {lr}
	bl audio_vsync
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global snd_update
	.thumb_func
	.type snd_update, %function
snd_update: @ 0802D824
	push {lr}
	bl audio_update
	pop {r0}
	bx r0
	.byte 0xC0, 0x46
	.global gUnk_0802D830
gUnk_0802D830:
	.4byte __audio_size
