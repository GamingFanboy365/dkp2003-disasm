@ asm/act_player.s: ROM 0x004E94-0x00ACFC (rom, VMA 0x08004E94)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global playerInit
	.thumb_func
	.type playerInit, %function
playerInit: @ 08004E94
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x18
	mov r0, sp
	ldr r1, _08004EE0
	adds r0, #0x16
	strh r1, [r0]
	ldr r2, _08004EE4
	ldr r1, _08004EE8
	bl CpuSet
	ldr r2, _08004EEC
	movs r0, #2
	ldrsh r1, [r2, r0]
	cmp r1, #1
	bne _08004EBE
	b _08005128
_08004EBE:
	adds r0, r2, #0
	adds r0, #0x86
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r7, #0x94
	muls r2, r7, r2
	ldr r1, _08004EF0
	adds r0, r2, #0
	adds r0, #0x44
	ldr r7, [r1, r0]
	ldm r7!, {r0}
	adds r2, #0x48
	str r7, [sp, #0x10]
	ldr r7, [r1, r2]
	str r0, [sp, #8]
	ldm r7!, {r3}
	b _08004EF4
_08004EE0:
	.4byte 0x00000000
_08004EE4:
	.4byte 0x01000820
_08004EE8:
	.4byte gRacerData
_08004EEC:
	.4byte gGameSetup
_08004EF0:
	.4byte gUnk_087146C0
_08004EF4:
	str r3, [sp, #4]
	str r7, [sp, #0xc]
_08004EF8:
	ldr r2, [sp, #8]
	cmp r2, #0x63
	ble _08004F1C
	adds r1, r2, #0
	ldr r0, _08005150
	bl AGBPrintf
	ldr r1, _08005154
	ldr r0, _08005158
	str r1, [sp]
	ldr r2, _0800515C
	ldr r1, _08005160
	ldr r3, _08005164
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08004F1C:
	movs r3, #0
	ldr r2, [sp, #8]
	mov sb, r3
	cmp sb, r2
	bge _08004FEC
	mov fp, r3
_08004F28:
	movs r1, #0x34
	mov r7, sb
	muls r7, r1, r7
	ldr r4, [sp, #0x10]
	adds r5, r7, #0
	adds r1, r4, r5
	ldr r2, [r1, #0x18]
	ldr r0, _08005168
	ldr r6, _0800516C
	ldr r4, [r1, #0x20]
	adds r5, r2, #0
	mov r8, r1
	ldr r7, [r0]
	ldr r3, [r6]
	cmp r5, r4
	ble _08004F4C
	adds r5, r4, #0
	adds r4, r2, #0
_08004F4C:
	movs r2, #0
	mov sl, r2
	asrs r2, r3, #5
	adds r0, r2, #1
	movs r6, #1
	adds r1, r0, r7
	adds r3, r7, #0
	movs r2, #0x1f
_08004F5C:
	cmp r5, r1
	bgt _08004F6A
	cmp r4, r3
	blt _08004F6A
	mov r7, sl
	orrs r7, r6
	mov sl, r7
_08004F6A:
	subs r2, #1
	adds r1, r1, r0
	adds r3, r3, r0
	lsls r6, r6, #1
	cmp r2, #0
	bge _08004F5C
	mov r0, sl
	cmp r0, #0
	bne _08004F7E
	b _0800511A
_08004F7E:
	ldr r4, _08005170
	mov r2, sl
	mov r1, fp
	str r2, [r1, r4]
	mov r0, r8
	ldr r2, [r0, #0x1c]
	movs r7, #4
	ldr r4, [r0, #0x24]
	ldr r6, _08005174
	ldr r0, _08005178
	add r7, fp
	adds r5, r2, #0
	mov sl, r7
	ldr r3, [r6]
	ldr r7, [r0]
	cmp r5, r4
	ble _08004FA4
	adds r5, r4, #0
	adds r4, r2, #0
_08004FA4:
	movs r1, #0
	mov r8, r1
	asrs r1, r3, #5
	adds r0, r1, #1
	movs r6, #1
	adds r1, r0, r7
	adds r3, r7, #0
	movs r2, #0x1f
_08004FB4:
	cmp r5, r1
	bgt _08004FC2
	cmp r4, r3
	blt _08004FC2
	mov r7, r8
	orrs r7, r6
	mov r8, r7
_08004FC2:
	subs r2, #1
	adds r1, r1, r0
	adds r3, r3, r0
	lsls r6, r6, #1
	cmp r2, #0
	bge _08004FB4
	mov r0, r8
	cmp r0, #0
	bne _08004FD6
	b _0800510C
_08004FD6:
	ldr r0, _08005170
	mov r2, r8
	mov r3, sl
	str r2, [r0, r3]
	movs r7, #1
	ldr r3, [sp, #8]
	movs r2, #8
	add sb, r7
	add fp, r2
	cmp sb, r3
	blt _08004F28
_08004FEC:
	ldr r2, [sp, #4]
	cmp r2, #0x63
	ble _08005012
	adds r1, r2, #0
	ldr r0, _0800517C
	bl AGBPrintf
	ldr r1, _08005154
	movs r7, #0xc8
	str r1, [sp]
	ldr r0, _08005158
	ldr r1, _08005160
	ldr r2, _0800515C
	lsls r3, r7, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08005012:
	movs r3, #0
	ldr r7, [sp, #4]
	mov sb, r3
	cmp sb, r7
	bge _080050DE
	mov fp, r3
_0800501E:
	movs r7, #0x34
	mov r2, sb
	muls r2, r7, r2
	ldr r5, [sp, #0xc]
	adds r4, r2, #0
	adds r1, r5, r4
	ldr r2, [r1, #0x18]
	ldr r0, _08005168
	ldr r6, _0800516C
	ldr r4, [r1, #0x20]
	adds r5, r2, #0
	mov r8, r1
	ldr r7, [r0]
	ldr r3, [r6]
	cmp r5, r4
	ble _08005042
	adds r5, r4, #0
	adds r4, r2, #0
_08005042:
	asrs r1, r3, #5
	movs r2, #0
	adds r0, r1, #1
	mov sl, r2
	movs r6, #1
	adds r1, r0, r7
	adds r3, r7, #0
	movs r2, #0x1f
_08005052:
	cmp r5, r1
	bgt _08005060
	cmp r4, r3
	blt _08005060
	mov r7, sl
	orrs r7, r6
	mov sl, r7
_08005060:
	subs r2, #1
	adds r1, r1, r0
	adds r3, r3, r0
	lsls r6, r6, #1
	cmp r2, #0
	bge _08005052
	mov r0, sl
	cmp r0, #0
	beq _080050FE
_08005072:
	ldr r5, _08005180
	mov r2, sl
	mov r1, fp
	str r2, [r1, r5]
	mov r0, r8
	ldr r2, [r0, #0x1c]
	movs r7, #4
	ldr r4, [r0, #0x24]
	ldr r6, _08005174
	ldr r0, _08005178
	add r7, fp
	adds r5, r2, #0
	mov sl, r7
	ldr r3, [r6]
	ldr r7, [r0]
	cmp r5, r4
	ble _08005098
	adds r5, r4, #0
	adds r4, r2, #0
_08005098:
	asrs r2, r3, #5
	movs r1, #0
	adds r0, r2, #1
	mov r8, r1
	movs r6, #1
	adds r1, r0, r7
	adds r3, r7, #0
	movs r2, #0x1f
_080050A8:
	cmp r5, r1
	bgt _080050B6
	cmp r4, r3
	blt _080050B6
	mov r7, r8
	orrs r7, r6
	mov r8, r7
_080050B6:
	subs r2, #1
	adds r1, r1, r0
	adds r3, r3, r0
	lsls r6, r6, #1
	cmp r2, #0
	bge _080050A8
	mov r0, r8
	cmp r0, #0
	beq _080050F0
_080050C8:
	ldr r7, _08005180
	mov r3, sl
	mov r2, r8
	str r2, [r7, r3]
	movs r1, #1
	ldr r3, [sp, #4]
	movs r7, #8
	add sb, r1
	add fp, r7
	cmp sb, r3
	blt _0800501E
_080050DE:
	add sp, #0x18
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080050F0:
	asrs r2, r5, #8
	asrs r3, r4, #8
	ldr r0, _08005184
	ldr r1, _08005188
	bl AGBPrintf
	b _080050C8
_080050FE:
	asrs r2, r5, #8
	asrs r3, r4, #8
	ldr r0, _08005184
	ldr r1, _08005188
	bl AGBPrintf
	b _08005072
_0800510C:
	asrs r2, r5, #8
	asrs r3, r4, #8
	ldr r0, _08005184
	ldr r1, _08005188
	bl AGBPrintf
	b _08004FD6
_0800511A:
	asrs r2, r5, #8
	asrs r3, r4, #8
	ldr r0, _08005184
	ldr r1, _08005188
	bl AGBPrintf
	b _08004F7E
_08005128:
	adds r0, r2, #0
	adds r0, #0x86
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r7, #0x94
	muls r2, r7, r2
	ldr r1, _0800518C
	adds r0, r2, #0
	adds r0, #0x4c
	ldr r7, [r1, r0]
	ldm r7!, {r0}
	adds r2, #0x50
	str r0, [sp, #8]
	str r7, [sp, #0x10]
	ldr r0, [r1, r2]
	ldm r0!, {r2}
	str r2, [sp, #4]
	str r0, [sp, #0xc]
	b _08004EF8
	.byte 0x00, 0x00
_08005150:
	.4byte gUnk_0804FFBC
_08005154:
	.4byte gUnk_0804FFF8
_08005158:
	.4byte gUnk_0804FFFC
_0800515C:
	.4byte gUnk_08050038
_08005160:
	.4byte gUnk_08050044
_08005164:
	.4byte 0x0000017D
_08005168:
	.4byte 0x02004284
_0800516C:
	.4byte 0x0200428C
_08005170:
	.4byte 0x02022E60
_08005174:
	.4byte 0x02004298
_08005178:
	.4byte 0x02004290
_0800517C:
	.4byte gUnk_08050058
_08005180:
	.4byte 0x02023180
_08005184:
	.4byte gUnk_08050098
_08005188:
	.4byte gUnk_080500C0
_0800518C:
	.4byte gUnk_087146C0

	.global player_hit
	.thumb_func
	.type player_hit, %function
player_hit: @ 08005190
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	adds r0, r1, #0
	ldr r1, [r0, #0x24]
	sub sp, #8
	adds r4, r2, #0
	cmp r1, #0
	beq _080051B2
	movs r2, #0
	movs r1, #4
	str r2, [r0, #0x78]
	str r1, [r0, #0x24]
_080051B2:
	adds r2, r0, #0
	adds r2, #0xe8
	ldr r1, [r2]
	str r1, [r0, #0x5c]
	movs r1, #0
	str r1, [r0, #0x60]
	str r1, [r2]
	movs r2, #3
	str r2, [r0, #0x54]
	movs r2, #0xcc
	lsls r3, r2, #1
	adds r2, r0, r3
	movs r3, #7
	str r3, [r2]
	adds r2, r0, #0
	subs r3, #0xc
	adds r2, #0x64
	str r3, [r0, #0x58]
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r0, [r1]
	movs r3, #0x80
	orrs r0, r3
	ldr r3, _080052A4
	ands r0, r3
	str r0, [r1]
	cmp r4, #0
	beq _08005290
	movs r0, #0xe
	ldrsh r4, [r1, r0]
	ldr r1, _080052A8
	adds r0, r4, #0
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	str r2, [sp, #4]
	ldr r6, _080052AC
	adds r0, r4, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	str r3, [sp]
	ldr r2, [r7, #0x3c]
	ldr r0, [r7, #0x44]
	asrs r3, r2, #1
	mov fp, r3
	movs r6, #4
	asrs r3, r0, #1
	mov sb, r3
	rsbs r2, r6, #0
	movs r3, #0x64
	mov r8, r2
	mov sl, r3
_08005222:
	bl sub_08002E78
	adds r6, r0, #0
	cmp r6, #0
	beq _08005286
	mov r0, r8
	lsls r1, r0, #0x1d
	asrs r5, r1, #0x10
	ldr r4, _080052A8
	adds r0, r5, #0
	bl _call_via_r4
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	ldr r2, _080052AC
	adds r0, r5, #0
	bl _call_via_r2
	mov r3, sl
	muls r3, r4, r3
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	asrs r1, r3, #0xc
	mov r3, sl
	muls r3, r2, r3
	ldr r0, [r7, #0x24]
	str r0, [r6]
	ldr r0, [r7, #0x28]
	str r0, [r6, #4]
	ldr r0, [r7, #0x2c]
	str r0, [r6, #8]
	ldr r0, [sp, #4]
	asrs r2, r3, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	asrs r0, r3, #0xc
	add r0, fp
	str r0, [r6, #0xc]
	str r2, [r6, #0x10]
	ldr r3, [sp]
	rsbs r0, r3, #0
	muls r0, r1, r0
	asrs r1, r0, #0xc
	ldr r0, _080052B0
	add r1, sb
	movs r2, #0x28
	str r1, [r6, #0x14]
	str r2, [r6, #0x18]
	str r0, [r6, #0x1c]
_08005286:
	movs r2, #1
	add r8, r2
	mov r0, r8
	cmp r0, #3
	ble _08005222
_08005290:
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080052A4:
	.4byte 0xFFBFB3CF
_080052A8:
	.4byte cos_fx
_080052AC:
	.4byte sin_fx
_080052B0:
	.4byte 0x00000529

	.global player_hit_spin
	.thumb_func
	.type player_hit_spin, %function
player_hit_spin: @ 080052B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	mov r8, r0
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _080052CC
	movs r1, #0
	movs r0, #4
	str r1, [r6, #0x78]
	str r0, [r6, #0x24]
_080052CC:
	movs r3, #0xa
	adds r2, r6, #0
	movs r7, #0
	rsbs r5, r3, #0
	adds r2, #0xe8
	movs r1, #4
	str r7, [r6, #0x5c]
	str r7, [r6, #0x60]
	adds r0, r6, #0
	str r7, [r2]
	str r5, [r6, #0x58]
	str r7, [r6, #0x68]
	str r1, [r6, #0x54]
	adds r0, #0x8c
	ldr r4, [r0]
	mov r0, r8
	ldr r2, [r0, #0x28]
	subs r7, r4, r2
	adds r4, r7, #0
	muls r4, r5, r4
	ldr r2, _08005378
	lsls r0, r4, #1
	bl _call_via_r2
	lsls r5, r0, #8
	adds r0, r5, #0
	cmp r5, #0
	blt _08005374
_08005304:
	ldr r7, _0800537C
	movs r1, #0xa
	bl _call_via_r7
	adds r4, r0, #0
	cmp r5, #0
	blt _08005370
_08005312:
	movs r0, #0xc0
	lsls r5, r0, #0x11
	adds r1, r4, #0
	cmp r4, #0
	blt _0800536C
_0800531C:
	adds r0, r5, #0
	bl _call_via_r7
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08005368
_0800532A:
	adds r4, r6, #0
	adds r4, #0x6c
	strh r0, [r4]
	bl multi_lfsr_next
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _08005342
	ldrh r1, [r4]
	rsbs r0, r1, #0
	strh r0, [r4]
_08005342:
	movs r1, #0xcc
	lsls r0, r1, #1
	adds r1, r6, r0
	movs r2, #7
	str r2, [r1]
	mov r1, r8
	adds r1, #0xa0
	ldr r0, [r1]
	movs r2, #0x80
	lsls r3, r2, #1
	orrs r0, r3
	ldr r3, _08005380
	ands r0, r3
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08005368:
	rsbs r0, r0, #0
	b _0800532A
_0800536C:
	rsbs r1, r4, #0
	b _0800531C
_08005370:
	rsbs r4, r4, #0
	b _08005312
_08005374:
	rsbs r0, r5, #0
	b _08005304
_08005378:
	.4byte isqrt
_0800537C:
	.4byte udiv
_08005380:
	.4byte 0xFFBFB3CF

	.global player_touch_booster_autopilot
	.thumb_func
	.type player_touch_booster_autopilot, %function
player_touch_booster_autopilot: @ 08005384
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r0, #0xa0
	add r0, r8
	ldr r3, [r0, #4]
	lsls r5, r3, #6
	mov ip, r0
	adds r4, r5, r3
	ldr r0, _0800551C
	ldr r2, _08005520
	lsls r1, r4, #3
	adds r7, r1, r0
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _080053AC
	b _08005566
_080053AC:
	adds r1, r2, #0
	adds r1, #0x86
	movs r6, #0
	ldrsh r0, [r1, r6]
	movs r4, #0x94
	muls r4, r0, r4
	ldr r3, _08005524
	adds r4, #0x6c
	ldr r6, [r3, r4]
_080053BE:
	movs r2, #0xd4
	lsls r3, r2, #1
	adds r2, r3, r7
	adds r1, r6, #0
	mov lr, r2
	movs r2, #4
	ldrsh r3, [r6, r2]
	ldm r1!, {r0}
	ldr r4, _08005528
	ldr r5, _0800552C
	mov r2, lr
	lsls r3, r3, #8
	str r0, [r4]
	str r1, [r5]
	str r3, [r2]
	movs r3, #0xd6
	lsls r2, r3, #1
	adds r3, r2, r7
	mov lr, r3
	movs r3, #0x10
	ldrsh r2, [r6, r3]
	lsls r3, r2, #8
	mov r2, lr
	str r3, [r2]
	movs r3, #0xd8
	lsls r2, r3, #1
	adds r3, r2, r7
	mov sl, r3
	movs r3, #0x1c
	ldrsh r2, [r6, r3]
	lsls r3, r2, #8
	mov r2, sl
	str r3, [r2]
	movs r2, #0xda
	lsls r3, r2, #1
	adds r2, r7, r3
	adds r0, r6, #0
	adds r4, r6, #0
	adds r5, r6, #0
	movs r3, #0x28
	ldrsh r6, [r6, r3]
	lsls r3, r6, #8
	str r3, [r2]
	movs r2, #0xdc
	lsls r3, r2, #1
	adds r2, r7, r3
	movs r6, #2
	ldrsh r3, [r1, r6]
	lsls r6, r3, #8
	str r6, [r2]
	movs r2, #0xde
	adds r0, #0x10
	lsls r6, r2, #1
	adds r2, r7, r6
	movs r6, #2
	ldrsh r3, [r0, r6]
	lsls r6, r3, #8
	str r6, [r2]
	movs r2, #0xe0
	adds r4, #0x1c
	lsls r6, r2, #1
	adds r2, r7, r6
	movs r6, #2
	ldrsh r3, [r4, r6]
	lsls r6, r3, #8
	str r6, [r2]
	movs r2, #0xe2
	lsls r6, r2, #1
	adds r5, #0x28
	adds r2, r7, r6
	movs r6, #2
	ldrsh r3, [r5, r6]
	lsls r6, r3, #8
	str r6, [r2]
	movs r2, #0xe4
	lsls r6, r2, #1
	adds r2, r7, r6
	movs r6, #4
	ldrsh r3, [r1, r6]
	lsls r1, r3, #8
	str r1, [r2]
	movs r2, #0xe6
	lsls r6, r2, #1
	adds r2, r7, r6
	movs r6, #4
	ldrsh r1, [r0, r6]
	lsls r0, r1, #8
	str r0, [r2]
	movs r3, #0xe8
	lsls r0, r3, #1
	movs r1, #4
	ldrsh r3, [r4, r1]
	adds r6, r7, r0
	lsls r2, r3, #8
	str r2, [r6]
	movs r6, #0xea
	lsls r4, r6, #1
	adds r6, r7, r4
	movs r4, #4
	ldrsh r1, [r5, r4]
	lsls r2, r1, #8
	movs r1, #0xec
	str r2, [r6]
	lsls r6, r1, #1
	adds r4, r7, r6
	movs r1, #0
	subs r0, #0x2c
	str r1, [r4]
	movs r2, #3
	adds r4, r7, r0
	str r2, [r4]
	mov r2, ip
	ldr r0, [r2]
	movs r3, #0x80
	lsls r4, r3, #0x10
	orrs r0, r4
	subs r6, #0x8c
	mov r4, ip
	str r0, [r4]
	adds r0, r7, r6
	str r1, [r0]
	mov r0, r8
	adds r0, #0x56
	movs r3, #0xae
	ldrh r2, [r0]
	lsls r4, r3, #1
	adds r3, r7, r4
	adds r6, #0xc
	strh r2, [r3]
	adds r2, r7, r6
	movs r3, #0xb0
	str r1, [r2]
	adds r4, #8
	lsls r2, r3, #1
	adds r3, r7, r2
	adds r2, r7, r4
	str r1, [r3]
	str r1, [r2]
	adds r6, #0x10
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r4, r7, r6
	str r2, [r4]
	mov r1, r8
	ldr r2, _08005518
	adds r1, #0xfe
	strh r2, [r1]
	mov r2, ip
	ldr r0, [r2]
	movs r3, #0x80
	lsls r4, r3, #5
	orrs r0, r4
	mov r4, ip
	str r0, [r4]
	ldr r0, _08005530
	ldr r2, [r0]
	ldr r0, [r4, #4]
	cmp r2, r0
	beq _0800555A
	movs r4, #0xcc
	lsls r3, r4, #1
	adds r1, r7, r3
	movs r2, #0xc
	str r2, [r1]
_08005506:
	mov r0, r8
	bl sub_080040F8
	mov r0, r8
	bl sub_0800A804
	ldr r2, _08005534
	muls r2, r0, r2
	b _08005538
_08005518:
	.4byte 0x0000007A
_0800551C:
	.4byte gRacerData
_08005520:
	.4byte gGameSetup
_08005524:
	.4byte gUnk_087146C0
_08005528:
	.4byte 0x02022E58
_0800552C:
	.4byte 0x02022E5C
_08005530:
	.4byte gLocalPlayerIndex
_08005534:
	.4byte 0x00001249
_08005538:
	movs r0, #0xbe
	lsls r4, r2, #3
	lsls r1, r0, #1
	adds r0, r7, r1
	subs r1, r4, r2
	lsls r4, r1, #0xd
	movs r1, #0x90
	asrs r2, r4, #0xf
	lsls r4, r1, #9
	adds r1, r2, r4
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800555A:
	movs r6, #0
	ldrsh r1, [r1, r6]
	movs r0, #0x1b
	bl sub_0801E28C
	b _08005506
_08005566:
	adds r5, r2, #0
	adds r5, #0x86
	movs r4, #0
	ldrsh r6, [r5, r4]
	movs r0, #0x94
	muls r0, r6, r0
	ldr r1, _0800557C
	adds r0, #0x70
	ldr r6, [r1, r0]
	b _080053BE
	.byte 0x00, 0x00
_0800557C:
	.4byte gUnk_087146C0

	.global player_touch_booster_blue
	.thumb_func
	.type player_touch_booster_blue, %function
player_touch_booster_blue: @ 08005580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	mov sl, r0
	adds r7, r1, #0
	movs r1, #0xa0
	add r1, sl
	mov r8, r1
	ldr r1, [r1, #4]
	lsls r0, r1, #6
	adds r4, r0, r1
	ldr r0, _08005668
	lsls r2, r4, #3
	adds r4, r2, r0
	ldr r0, [r4, #0x54]
	subs r0, #2
	sub sp, #0x10
	cmp r0, #1
	bls _080055E8
	ldr r2, _0800566C
	ldr r6, [r2]
	cmp r1, r6
	beq _080055F6
	adds r6, r7, #0
	adds r6, #0xa0
_080055B4:
	movs r0, #1
	movs r1, #0x14
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	adds r3, r7, #0
	adds r3, #0x56
	movs r1, #0
	ldrsh r2, [r3, r1]
	str r2, [r4, #0x38]
	ldr r2, [r6, #0xc]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x40]
	movs r0, #0
	str r2, [r4, #0x44]
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _08005670
	ands r1, r3
	ldr r3, _08005674
	orrs r1, r3
	mov r3, sl
	adds r3, #0xfa
	str r1, [r2]
	strh r0, [r3]
_080055E8:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080055F6:
	adds r6, r7, #0
	adds r6, #0xa0
	movs r3, #1
	ldr r1, [r6, #4]
	rsbs r5, r3, #0
	cmp r1, r5
	beq _0800563E
	movs r2, #0x88
	lsls r0, r2, #1
	add r0, sl
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r3, #0x90
	lsls r1, r3, #9
	lsls r0, r2, #0xc
	adds r2, r0, r1
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #0xf4
	movs r1, #0x7f
	movs r3, #1
	str r5, [sp]
	bl gamesfx_play
_08005626:
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x9e
	bl gamesfx_play
	b _080055B4
_0800563E:
	movs r0, #0x23
	bl sub_0801E074
	ldr r2, [r6, #0x14]
	movs r0, #0x80
	str r2, [r4, #0x78]
	lsls r1, r0, #9
	movs r2, #1
	movs r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r0, [sp, #0xc]
	movs r1, #0
	movs r2, #0xf7
	movs r3, #0x7f
	ldr r0, _08005678
	str r5, [sp, #8]
	bl gamesfx_play_endcb
	b _08005626
	.byte 0x00, 0x00
_08005668:
	.4byte gRacerData
_0800566C:
	.4byte gLocalPlayerIndex
_08005670:
	.4byte 0xFFFFF3FF
_08005674:
	.4byte 0x01000040
_08005678:
	.4byte booster_blue_sfx_end_cb

	.global sub_0800567C
	.thumb_func
	.type sub_0800567C, %function
sub_0800567C: @ 0800567C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	ldr r5, [r0, #0x30]
	str r5, [sp, #0x14]
	ldr r3, [r0, #0x38]
	str r3, [sp, #0x10]
	ldr r4, [r0, #0x2c]
	mov sl, r1
	ldr r3, [r0, #0x24]
	mov fp, r4
	mov r6, sl
	movs r4, #0
	str r4, [r6, #0x14]
	ldr r0, [sp, #0x10]
	mov sb, r3
	mov r2, sb
	mov r3, fp
	subs r4, r2, r5
	subs r6, r3, r0
	adds r1, r4, #0
	muls r1, r4, r1
	adds r2, r6, #0
	muls r2, r6, r2
	adds r0, r1, r2
	ldr r1, _080059D8
	bl _call_via_r1
	adds r5, r0, #0
	cmp r5, #0
	ble _08005784
	lsls r4, r4, #8
	adds r0, r4, #0
	cmp r4, #0
	bge _080056CE
	b _08005BC4
_080056CE:
	adds r1, r5, #0
	ldr r7, _080059DC
	bl _call_via_r7
	adds r1, r5, #0
	eors r1, r4
	str r0, [sp, #4]
	cmp r1, #0
	bge _080056E2
	b _08005BBC
_080056E2:
	lsls r4, r6, #8
	adds r0, r4, #0
	cmp r4, #0
	bge _080056EC
	b _08005BB8
_080056EC:
	adds r1, r5, #0
	bl _call_via_r7
	adds r6, r5, #0
	eors r6, r4
	str r0, [sp]
	cmp r6, #0
	bge _080056FE
	b _08005BB0
_080056FE:
	ldr r2, [sp, #0x18]
	ldr r6, [r2, #0x64]
	ldr r3, [sp, #0x18]
	str r6, [sp, #0xc]
	ldr r6, [r3, #0x68]
	ldr r1, _080059E0
	str r6, [sp, #8]
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08005716
	b _08005B9E
_08005716:
	adds r3, r1, #0
	adds r3, #0x86
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x94
	muls r3, r2, r3
	ldr r0, _080059E4
	adds r3, #0x44
_08005726:
	ldr r3, [r0, r3]
	cmp r3, #0
	beq _08005784
	ldm r3!, {r6}
	mov lr, r6
	mov r8, r3
	mov r2, lr
	cmp r2, #0
	ble _0800574C
	mov r4, sl
	ldr r3, [r4, #0xc]
	cmp r3, #0
	bne _08005742
	b _08005ACA
_08005742:
	cmp r3, #1
	bne _08005748
	b _08005986
_08005748:
	ldr r1, _080059E0
	ldr r0, _080059E4
_0800574C:
	movs r2, #2
	ldrsh r3, [r1, r2]
	cmp r3, #1
	bne _08005756
	b _0800596A
_08005756:
	adds r3, r1, #0
	adds r3, #0x86
	movs r1, #0
	ldrsh r2, [r3, r1]
	movs r1, #0x94
	muls r1, r2, r1
	adds r1, #0x48
	ldr r3, [r0, r1]
	cmp r3, #0
	beq _08005784
	ldm r3!, {r2}
	mov lr, r2
_0800576E:
	mov r8, r3
	mov r3, lr
	cmp r3, #0
	ble _08005784
	mov r4, sl
	ldr r3, [r4, #0xc]
	cmp r3, #0
	bne _08005780
	b _080058B0
_08005780:
	cmp r3, #2
	beq _08005796
_08005784:
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08005796:
	mov r2, sl
	movs r3, #2
	ldrsh r0, [r2, r3]
	movs r6, #0x34
	muls r6, r0, r6
	mov r4, r8
	adds r0, r4, r6
	ldr r4, [r0, #0xc]
	ldr r1, [r0, #0x10]
	ldrh r5, [r2, #2]
	mov r3, fp
	muls r3, r1, r3
	mov r2, sb
	muls r2, r4, r2
	asrs r3, r3, #8
	ldr r6, [r0, #0x14]
	asrs r4, r2, #8
	adds r1, r4, r3
	adds r3, r1, r6
	cmp r3, #0
	ble _0800583C
_080057C0:
	ldr r4, [r0]
	mov r3, sb
	muls r3, r4, r3
	ldr r5, [r0, #4]
	asrs r6, r3, #8
	mov r3, fp
	muls r3, r5, r3
	ldr r1, [r0, #8]
	asrs r3, r3, #8
	adds r2, r6, r3
	adds r6, r2, r1
	cmp r6, #0
	ble _080057E4
	movs r1, #0
	mov r4, sl
	str r1, [r4, #0xc]
	str r1, [r4, #0x14]
	b _08005784
_080057E4:
	ldr r7, [r0, #0x28]
	movs r1, #0xfa
	lsls r2, r1, #3
	muls r7, r2, r7
	asrs r1, r7, #0x10
	ldr r7, [r0, #0x2c]
	muls r7, r2, r7
	movs r3, #0xfa
	lsls r2, r3, #2
	asrs r0, r7, #0x10
	adds r7, r4, #0
	muls r7, r2, r7
	asrs r3, r7, #8
	adds r7, r1, r3
	adds r1, r5, #0
	muls r1, r2, r1
	asrs r2, r1, #8
	adds r1, r0, r2
	ldr r2, _080059E8
	adds r0, r7, #0
	bl _call_via_r2
	ldr r3, _080059EC
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r6, r3
	bge _0800581C
	adds r6, r3, #0
_0800581C:
	ldr r2, [sp, #0x18]
	lsls r1, r0, #0x10
	adds r2, #0xa0
	lsrs r0, r1, #0x10
	ldrh r1, [r2, #0xe]
	ldr r2, _080059F0
	bl _call_via_r2
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	rsbs r1, r6, #0
	muls r1, r3, r1
	mov r6, sl
	asrs r2, r1, #0xf
	str r2, [r6, #0x14]
	b _08005784
_0800583C:
	movs r6, #0
	mov ip, r6
_08005840:
	lsls r7, r5, #0x10
	asrs r6, r7, #0x10
	movs r7, #0x34
	muls r6, r7, r6
	mov r2, r8
	adds r0, r2, r6
	ldr r2, [r0, #0xc]
	ldr r5, [r0, #0x10]
	mov r1, sb
	muls r1, r2, r1
	mov r3, fp
	muls r3, r5, r3
	ldr r6, [r0, #0x14]
	asrs r5, r3, #8
	asrs r4, r1, #8
	adds r1, r4, r5
	adds r4, r1, r6
	ldrh r6, [r0, #0x30]
	adds r5, r6, #0
	muls r5, r7, r5
	mov r1, r8
	adds r2, r1, r5
	ldr r1, [r2, #0x10]
	ldr r3, [r2, #0xc]
	ldr r5, [r2, #0x14]
	mov r2, sb
	muls r2, r3, r2
	mov r3, fp
	muls r3, r1, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r1, r2, r3
	adds r2, r1, r5
	cmp r4, #0
	ble _08005898
_08005886:
	ldrh r4, [r0, #0x30]
	mov r1, sl
	strh r4, [r1, #2]
_0800588C:
	mov r2, ip
	cmp r2, #0
	bne _080057C0
	mov r1, sl
	ldrh r5, [r1, #2]
	b _08005840
_08005898:
	cmp r2, #0
	blt _08005886
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	muls r5, r7, r5
	mov r2, sl
	strh r6, [r2, #2]
	mov r4, r8
	movs r6, #1
	adds r0, r4, r5
	mov ip, r6
	b _0800588C
_080058B0:
	movs r6, #0
	mov ip, r6
	cmp r3, lr
	blt _080058BA
	b _08005780
_080058BA:
	mov r1, ip
	ldr r4, _080059F4
	lsls r6, r1, #3
	adds r2, r6, r4
	ldr r0, [r2]
	ldr r3, [sp, #0xc]
	ands r0, r3
	cmp r0, #0
	beq _080058FC
	ldr r0, [r2, #4]
	ldr r2, [sp, #8]
	ands r0, r2
	cmp r0, #0
	beq _080058FC
	movs r7, #0x34
	mov r4, ip
	muls r4, r7, r4
	mov r2, r8
	adds r0, r2, r4
	ldr r4, [r0]
	ldr r2, [sp, #4]
	adds r6, r4, #0
	muls r6, r2, r6
	ldr r5, [r0, #4]
	asrs r2, r6, #8
	ldr r6, [sp]
	adds r3, r5, #0
	muls r3, r6, r3
	asrs r3, r3, #8
	adds r6, r2, r3
	ldr r1, [r0, #8]
	cmp r6, #0
	blt _0800590A
_080058FC:
	movs r6, #1
	add ip, r6
	cmp ip, lr
	blt _080058BA
	mov r1, sl
	ldr r3, [r1, #0xc]
	b _08005780
_0800590A:
	mov r3, sb
	muls r3, r4, r3
	mov r6, fp
	muls r6, r5, r6
	asrs r2, r3, #8
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	bgt _080058FC
	ldrh r2, [r0, #0x32]
	muls r2, r7, r2
	mov r1, r8
	adds r4, r1, r2
	ldr r5, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r6, [r4, #0x14]
	mov r4, sb
	muls r4, r5, r4
	asrs r5, r4, #8
	mov r4, fp
	muls r4, r1, r4
	asrs r1, r4, #8
	adds r4, r5, r1
	adds r5, r4, r6
	ldr r2, [r0, #0xc]
	ldr r4, [r0, #0x10]
	mov r1, sb
	muls r1, r2, r1
	mov r3, fp
	muls r3, r4, r3
	ldr r6, [r0, #0x14]
	asrs r4, r3, #8
	asrs r0, r1, #8
	adds r1, r0, r4
	adds r4, r1, r6
	cmp r5, #0
	bgt _080058FC
	cmp r4, #0
	blt _080058FC
	mov r0, ip
	movs r6, #2
	mov r2, sl
	mov r4, sl
	str r6, [r2, #0xc]
	strh r0, [r4, #2]
	mov ip, lr
	b _080058FC
_0800596A:
	adds r3, r1, #0
	adds r3, #0x86
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r1, #0x94
	muls r1, r2, r1
	adds r1, #0x50
	ldr r3, [r0, r1]
	cmp r3, #0
	bne _08005980
	b _08005784
_08005980:
	ldm r3!, {r6}
	mov lr, r6
	b _0800576E
_08005986:
	mov r6, sl
	movs r1, #0
	ldrsh r3, [r6, r1]
	movs r4, #0x34
	muls r4, r3, r4
	mov r2, r8
	adds r0, r2, r4
	ldr r1, [r0, #0x10]
	ldrh r5, [r6]
	ldr r6, [r0, #0xc]
	mov r3, fp
	muls r3, r1, r3
	mov r2, sb
	muls r2, r6, r2
	ldr r4, [r0, #0x14]
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r1, r6, r3
	adds r6, r1, r4
	cmp r6, #0
	ble _08005A54
_080059B0:
	ldr r4, [r0]
	mov r3, sb
	muls r3, r4, r3
	ldr r5, [r0, #4]
	asrs r6, r3, #8
	mov r3, fp
	muls r3, r5, r3
	ldr r1, [r0, #8]
	asrs r3, r3, #8
	adds r2, r6, r3
	adds r6, r2, r1
	cmp r6, #0
	ble _080059F8
	movs r1, #0
	mov r4, sl
	str r1, [r4, #0xc]
	str r1, [r4, #0x14]
	ldr r0, _080059E4
	ldr r1, _080059E0
	b _0800574C
_080059D8:
	.4byte isqrt
_080059DC:
	.4byte udiv
_080059E0:
	.4byte gGameSetup
_080059E4:
	.4byte gUnk_087146C0
_080059E8:
	.4byte atan2_fx
_080059EC:
	.4byte 0xFFFF8001
_080059F0:
	.4byte _03000814
_080059F4:
	.4byte 0x02023180
_080059F8:
	ldr r7, [r0, #0x28]
	movs r1, #0xfa
	lsls r2, r1, #3
	muls r7, r2, r7
	asrs r1, r7, #0x10
	ldr r7, [r0, #0x2c]
	muls r7, r2, r7
	movs r3, #0xfa
	lsls r2, r3, #2
	asrs r0, r7, #0x10
	adds r7, r4, #0
	muls r7, r2, r7
	asrs r3, r7, #8
	adds r7, r1, r3
	adds r1, r5, #0
	muls r1, r2, r1
	asrs r2, r1, #8
	adds r1, r0, r2
	ldr r2, _08005BC8
	adds r0, r7, #0
	bl _call_via_r2
	ldr r3, _08005BCC
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r6, r3
	bge _08005A30
	adds r6, r3, #0
_08005A30:
	ldr r2, [sp, #0x18]
	lsls r1, r0, #0x10
	adds r2, #0xa0
	lsrs r0, r1, #0x10
	ldrh r1, [r2, #0xe]
	ldr r2, _08005BD0
	bl _call_via_r2
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	rsbs r1, r6, #0
	muls r1, r3, r1
	ldr r0, _08005BD4
	asrs r2, r1, #0xf
	ldr r1, _08005BD8
	mov r6, sl
	str r2, [r6, #0x14]
	b _0800574C
_08005A54:
	movs r3, #0
	mov ip, r3
_08005A58:
	lsls r7, r5, #0x10
	asrs r4, r7, #0x10
	movs r7, #0x34
	muls r4, r7, r4
	mov r6, r8
	adds r0, r6, r4
	ldr r2, [r0, #0xc]
	ldr r5, [r0, #0x10]
	mov r1, sb
	muls r1, r2, r1
	mov r3, fp
	muls r3, r5, r3
	ldr r6, [r0, #0x14]
	asrs r5, r3, #8
	asrs r4, r1, #8
	adds r1, r4, r5
	adds r4, r1, r6
	ldrh r6, [r0, #0x30]
	adds r5, r6, #0
	muls r5, r7, r5
	mov r1, r8
	adds r2, r1, r5
	ldr r1, [r2, #0x10]
	ldr r3, [r2, #0xc]
	ldr r5, [r2, #0x14]
	mov r2, sb
	muls r2, r3, r2
	mov r3, fp
	muls r3, r1, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r1, r2, r3
	adds r2, r1, r5
	cmp r4, #0
	ble _08005AB2
_08005A9E:
	ldrh r5, [r0, #0x30]
	mov r1, sl
	strh r5, [r1]
_08005AA4:
	mov r2, ip
	cmp r2, #0
	beq _08005AAC
	b _080059B0
_08005AAC:
	mov r4, sl
	ldrh r5, [r4]
	b _08005A58
_08005AB2:
	cmp r2, #0
	blt _08005A9E
	lsls r0, r6, #0x10
	mov r2, sl
	strh r6, [r2]
	asrs r6, r0, #0x10
	muls r6, r7, r6
	mov r4, r8
	adds r0, r4, r6
	movs r6, #1
	mov ip, r6
	b _08005AA4
_08005ACA:
	movs r6, #0
	mov ip, r6
	cmp r3, lr
	blt _08005AD4
	b _08005742
_08005AD4:
	mov r1, ip
	lsls r0, r1, #3
	ldr r1, _08005BDC
	adds r2, r0, r1
	ldr r4, [r2]
	ldr r6, [sp, #0xc]
	ands r4, r6
	cmp r4, #0
	beq _08005B16
	ldr r4, [r2, #4]
	ldr r3, [sp, #8]
	ands r4, r3
	cmp r4, #0
	beq _08005B16
	movs r6, #0x34
	mov r5, ip
	muls r5, r6, r5
	mov r4, r8
	adds r0, r4, r5
	ldr r2, [sp, #4]
	ldr r4, [r0]
	adds r3, r4, #0
	muls r3, r2, r3
	ldr r5, [r0, #4]
	ldr r6, [sp]
	asrs r2, r3, #8
	adds r3, r5, #0
	muls r3, r6, r3
	asrs r3, r3, #8
	adds r2, r2, r3
	ldr r1, [r0, #8]
	cmp r2, #0
	blt _08005B24
_08005B16:
	movs r0, #1
	add ip, r0
	cmp ip, lr
	blt _08005AD4
	mov r4, sl
	ldr r3, [r4, #0xc]
	b _08005742
_08005B24:
	ldr r2, [sp, #0x14]
	adds r6, r2, #0
	muls r6, r4, r6
	asrs r7, r6, #8
	ldr r6, [sp, #0x10]
	adds r3, r6, #0
	muls r3, r5, r3
	asrs r3, r3, #8
	adds r6, r7, r3
	mov r3, sb
	muls r3, r4, r3
	mov r4, fp
	muls r4, r5, r4
	adds r7, r6, r1
	asrs r6, r3, #8
	asrs r3, r4, #8
	adds r4, r6, r3
	adds r6, r4, r1
	cmp r6, #0
	bgt _08005B16
	cmp r7, #0
	blt _08005B16
	ldrh r5, [r0, #0x32]
	movs r4, #0x34
	muls r5, r4, r5
	mov r4, r8
	adds r2, r4, r5
	ldr r1, [r2, #0x10]
	ldr r5, [r2, #0xc]
	ldr r4, [r2, #0x14]
	mov r3, fp
	muls r3, r1, r3
	mov r2, sb
	muls r2, r5, r2
	asrs r3, r3, #8
	asrs r5, r2, #8
	adds r1, r5, r3
	adds r5, r1, r4
	ldr r3, [r0, #0xc]
	ldr r1, [r0, #0x10]
	mov r2, sb
	muls r2, r3, r2
	mov r3, fp
	muls r3, r1, r3
	ldr r4, [r0, #0x14]
	asrs r3, r3, #8
	asrs r0, r2, #8
	adds r1, r0, r3
	adds r4, r1, r4
	cmp r5, #0
	bgt _08005B16
	cmp r4, #0
	blt _08005B16
	movs r2, #1
	mov r6, sl
	str r2, [r6, #0xc]
	mov r3, ip
	mov r2, sl
	strh r3, [r2]
	mov ip, lr
	b _08005B16
_08005B9E:
	adds r3, r1, #0
	adds r3, #0x86
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x94
	muls r3, r2, r3
	ldr r0, _08005BD4
	adds r3, #0x4c
	b _08005726
_08005BB0:
	adds r1, r0, #0
	rsbs r2, r1, #0
	str r2, [sp]
	b _080056FE
_08005BB8:
	rsbs r0, r4, #0
	b _080056EC
_08005BBC:
	adds r4, r0, #0
	rsbs r0, r4, #0
	str r0, [sp, #4]
	b _080056E2
_08005BC4:
	rsbs r0, r4, #0
	b _080056CE
_08005BC8:
	.4byte atan2_fx
_08005BCC:
	.4byte 0xFFFF8001
_08005BD0:
	.4byte _03000814
_08005BD4:
	.4byte gUnk_087146C0
_08005BD8:
	.4byte gGameSetup
_08005BDC:
	.4byte 0x02022E60

	.global sub_08005BE0
	.thumb_func
	.type sub_08005BE0, %function
sub_08005BE0: @ 08005BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [r0, #0x3c]
	ldr r3, [r0, #0x40]
	ldr r2, [r0, #0x44]
	ldr r6, [r0, #0x24]
	adds r7, r0, #0
	asrs r5, r4, #1
	adds r7, #0x96
	asrs r4, r2, #1
	mov sb, r1
	asrs r1, r3, #1
	adds r3, r6, r5
	movs r6, #0
	ldrsh r2, [r7, r6]
	ldr r7, [r0, #0x28]
	mov r8, r3
	adds r3, r7, r2
	ldr r2, [r0, #0x2c]
	adds r7, r3, r1
	movs r1, #0x80
	adds r3, r2, r4
	lsls r0, r1, #4
	mov sl, r3
	cmp r7, r0
	bge _08005CCE
	adds r6, r4, #0
	muls r6, r4, r6
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r1, r6
	asrs r6, r0, #0xc
	cmp r6, #0x20
	ble _08005CCE
	bl sub_08002E78
	adds r5, r0, #0
	cmp r5, #0
	beq _08005C7C
	bl lfsr_next
	movs r2, #0x80
	asrs r3, r0, #6
	add r3, r8
	lsls r0, r2, #1
	str r3, [r5]
	str r0, [r5, #4]
	bl lfsr_next
	asrs r4, r0, #6
	add r4, sl
	str r4, [r5, #8]
	movs r4, #0
	str r4, [r5, #0xc]
	bl lfsr_next
	lsrs r1, r0, #9
	adds r2, r1, r6
	asrs r3, r7, #8
	movs r1, #8
	subs r0, r1, r3
	movs r1, #0xa2
	str r0, [r5, #0x18]
	str r2, [r5, #0x10]
	str r4, [r5, #0x14]
	lsls r0, r1, #1
	add r0, sb
	ldr r2, [r0]
	lsls r1, r2, #2
	ldr r2, _08005CDC
	ldr r0, [r2, r1]
	movs r2, #0xd1
	lsls r1, r2, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
_08005C7C:
	bl sub_08002E78
	adds r5, r0, #0
	cmp r5, #0
	beq _08005CCE
	bl lfsr_next
	movs r2, #0x80
	asrs r3, r0, #6
	add r3, r8
	lsls r0, r2, #1
	str r3, [r5]
	str r0, [r5, #4]
	bl lfsr_next
	asrs r4, r0, #6
	add r4, sl
	str r4, [r5, #8]
	movs r4, #0
	str r4, [r5, #0xc]
	bl lfsr_next
	asrs r3, r7, #8
	lsrs r1, r0, #9
	movs r0, #8
	adds r2, r1, r6
	subs r1, r0, r3
	movs r0, #0xa2
	str r1, [r5, #0x18]
	str r2, [r5, #0x10]
	str r4, [r5, #0x14]
	lsls r1, r0, #1
	add r1, sb
	ldr r2, [r1]
	lsls r0, r2, #2
	ldr r2, _08005CDC
	ldr r1, [r2, r0]
	movs r2, #0xd1
	lsls r0, r2, #4
	orrs r1, r0
	str r1, [r5, #0x1c]
_08005CCE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08005CDC:
	.4byte gUnk_0884E08C

	.global plane_turn
	.thumb_func
	.type plane_turn, %function
plane_turn: @ 08005CE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r2, [r1, #4]
	mov ip, r0
	movs r0, #0
	cmp r2, #0
	bne _08005CF6
	b _08005E2C
_08005CF6:
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r0, r5, #2
	ands r0, r4
	cmp r0, #0
	bne _08005D04
	b _08005E06
_08005D04:
	adds r4, r6, #0
	adds r4, #0x98
	ldr r0, [r4]
_08005D0A:
	ldr r5, [r4]
	subs r2, r0, r5
	cmp r2, #0
	ble _08005DD6
	ldrh r7, [r1]
	movs r2, #0x80
	lsls r1, r2, #1
	ands r1, r7
	cmp r1, #0
	beq _08005DC8
	movs r5, #0xf4
	lsls r3, r5, #1
	adds r7, r6, r3
	ldr r2, [r7]
	movs r1, #0x96
	lsls r5, r1, #1
_08005D2A:
	muls r2, r5, r2
_08005D2C:
	lsls r2, r2, #1
	cmp r2, #0
	beq _08005D42
	ldr r5, [r4]
	adds r3, r5, r2
	str r3, [r4]
	cmp r2, #0
	ble _08005DBC
	cmp r3, r0
	ble _08005DBC
_08005D40:
	str r0, [r4]
_08005D42:
	ldr r5, _08005E34
	ldr r4, [r4]
	movs r7, #0
	adds r2, r5, #4
	movs r0, #0
	movs r1, #0xc
_08005D4E:
	ldr r3, [r0, r5]
	cmp r3, r4
	bgt _08005D5C
	ldr r3, [r2]
	cmp r4, r3
	bgt _08005D5C
	ldr r7, [r2, #4]
_08005D5C:
	subs r1, #1
	adds r2, #0xc
	adds r0, #0xc
	cmp r1, #0
	bge _08005D4E
	movs r3, #0xf2
	lsls r4, r3, #1
	adds r1, r6, r4
	ldr r2, [r1]
	adds r0, r7, #0
	muls r0, r2, r0
	asrs r5, r0, #8
	lsls r3, r5, #1
	mov r5, ip
	adds r5, #0xa0
	ldrh r4, [r5, #0xe]
	adds r0, r4, r3
	strh r0, [r5, #0xe]
	ldr r1, [r6, #0x14]
	lsls r4, r7, #0x15
	adds r6, r0, r1
	ldr r3, _08005E38
	strh r6, [r5, #0xe]
	lsrs r6, r4, #0x10
	ldrh r4, [r5, #0x10]
	mov r8, r3
	adds r1, r4, #0
	adds r0, r6, #0
	bl _call_via_r8
	lsls r3, r0, #0x10
	asrs r1, r3, #0x13
	adds r2, r4, r1
	strh r2, [r5, #0x10]
	ldrh r4, [r5, #0x10]
	adds r0, r6, #0
	adds r1, r4, #0
	bl _call_via_r8
	lsls r3, r0, #0x10
	asrs r1, r3, #0x13
	adds r4, r4, r1
	strh r4, [r5, #0x10]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08005DBC:
	cmp r2, #0
	bge _08005D42
	ldr r2, [r4]
	cmp r2, r0
	bge _08005D42
	b _08005D40
_08005DC8:
	movs r5, #0xf4
	lsls r3, r5, #1
	adds r7, r6, r3
	ldr r2, [r7]
	movs r1, #0xc8
	muls r2, r1, r2
	b _08005D2C
_08005DD6:
	cmp r2, #0
	blt _08005DDE
	movs r2, #0
	b _08005D2C
_08005DDE:
	ldrh r7, [r1]
	movs r2, #0x80
	lsls r1, r2, #1
	ands r1, r7
	cmp r1, #0
	beq _08005DF8
	movs r3, #0xf4
	lsls r2, r3, #1
	adds r7, r6, r2
	ldr r1, [r7]
	subs r2, #0xbc
	rsbs r5, r1, #0
	b _08005D2A
_08005DF8:
	movs r3, #0xf4
	lsls r7, r3, #1
	adds r1, r6, r7
	ldr r2, [r1]
	rsbs r5, r2, #0
	movs r2, #0xc8
	b _08005D2A
_08005E06:
	movs r7, #0x80
	lsls r0, r7, #1
	ands r0, r4
	cmp r0, #0
	beq _08005E20
	rsbs r3, r2, #0
	lsls r5, r3, #1
	adds r4, r5, r3
	lsls r2, r4, #0xf
	adds r4, r6, #0
	asrs r0, r2, #8
	adds r4, #0x98
	b _08005D0A
_08005E20:
	lsls r0, r2, #0x10
	subs r7, r2, r0
	adds r4, r6, #0
	asrs r0, r7, #8
	adds r4, #0x98
	b _08005D0A
_08005E2C:
	adds r4, r6, #0
	adds r4, #0x98
	b _08005D0A
	.byte 0x00, 0x00
_08005E34:
	.4byte gUnk_0884E0B4
_08005E38:
	.4byte _03000814

	.global plane_bank
	.thumb_func
	.type plane_bank, %function
plane_bank: @ 08005E3C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x20
	str r2, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x1c]
	adds r2, r1, #0
	ldr r7, _08006160
	adds r2, #0x98
	ldr r0, [r2]
	movs r5, #0
	adds r2, r7, #4
	movs r4, #0xc
_08005E60:
	ldr r6, [r5, r7]
	cmp r6, r0
	bgt _08005E70
	ldr r6, [r2]
	cmp r0, r6
	bgt _08005E70
	ldr r6, [r2, #4]
	str r6, [sp, #0x10]
_08005E70:
	subs r4, #1
	adds r2, #0xc
	adds r5, #0xc
	cmp r4, #0
	bge _08005E60
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _08005E96
	ldr r0, [r1, #0x14]
	adds r0, #0x40
	cmp r0, #0x80
	bhi _08005E8A
	b _08006208
_08005E8A:
	cmp r2, #1
	bne _08005E90
	b _080061F8
_08005E90:
	cmp r2, #2
	bne _08005E96
	b _080061E8
_08005E96:
	adds r4, r1, #0
	adds r4, #0xa8
	ldr r5, [r4]
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bne _08005EA4
	b _080061DA
_08005EA4:
	movs r6, #0xa0
	lsls r3, r6, #6
	cmp r0, r3
	bne _08005EAE
	b _080061C4
_08005EAE:
	ldr r2, _08006164
	cmp r0, r2
	bne _08005EB6
	b _080061C4
_08005EB6:
	ldr r2, [sp, #0x10]
	ldr r6, _08006168
	cmp r2, r6
	bne _08005EC0
	b _080061AE
_08005EC0:
	ldr r5, _0800616C
	cmp r2, r5
	bne _08005EC8
	b _080061AE
_08005EC8:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	bne _08005ED0
	b _0800619A
_08005ED0:
	movs r5, #0x80
	adds r0, r1, #0
	movs r6, #0xa4
	adds r2, r6, r1
	lsls r3, r5, #1
	adds r0, #0xb0
	movs r5, #0
	str r3, [r0]
	mov fp, r2
	str r5, [r2]
	movs r2, #0
_08005EE6:
	ldr r0, [r4]
	ldr r6, [sp, #0x10]
	cmp r6, r0
	bgt _08005EF0
	b _08006178
_08005EF0:
	movs r3, #0xac
	adds r0, r3, r1
	lsls r5, r2, #4
	mov sb, r0
	str r5, [r0]
_08005EFA:
	ldr r0, [sp, #0x10]
	str r0, [r4]
	movs r4, #0
	str r4, [sp, #0xc]
	cmp r0, #0
	bne _08005F08
	b _08006158
_08005F08:
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [sp, #0x10]
	adds r4, r1, #0
	adds r5, r2, r0
	adds r4, #0xa0
	str r4, [sp, #8]
	str r5, [sp, #0x10]
	ldr r2, [sp, #0x18]
	ldr r6, [r4]
	subs r4, r5, r6
	ldr r5, [r2, #4]
	str r5, [sp, #4]
	cmp r5, #0
	bne _08005F28
	b _080060FE
_08005F28:
	cmp r4, #0
	bge _08005F2E
	b _080060E4
_08005F2E:
	movs r0, #0x9c
	adds r2, r0, r1
	mov r8, r2
_08005F34:
	cmp r4, #0
	bgt _08005F3A
	b _080060DC
_08005F3A:
	mov r0, r8
	ldr r2, [r0]
	cmp r2, #0
	bge _08005F44
	b _080060CE
_08005F44:
	movs r2, #0xf4
_08005F46:
	lsls r3, r2, #1
	adds r6, r1, r3
	ldr r5, [r6]
	lsls r2, r5, #0xa
_08005F4E:
	asrs r5, r2, #8
_08005F50:
	mov r0, fp
	ldr r2, [r0]
	cmp r2, #0
	bne _08005F5A
	b _080060C2
_08005F5A:
	ldr r2, [sp, #8]
	ldr r1, [r2]
	mov r2, r8
	mov sl, r1
	ldr r1, [r2]
	lsls r6, r1, #1
	add r6, sl
	lsls r3, r5, #1
	adds r0, r6, r3
	str r0, [sp, #0x14]
	cmp r1, #0
	bgt _08005F74
	b _080060B4
_08005F74:
	cmp r4, #0
	bgt _08005F7A
	b _080060B4
_08005F7A:
	mov r3, r8
	ldr r7, [r3]
	adds r3, r7, #0
	muls r3, r7, r3
	rsbs r1, r5, #0
	rsbs r6, r3, #0
	str r1, [sp]
	lsls r4, r1, #1
	adds r0, r6, #0
	cmp r6, #0
	bge _08005F92
	b _080060B0
_08005F92:
	adds r1, r4, #0
	cmp r4, #0
	bge _08005F9A
	b _080060AC
_08005F9A:
	ldr r2, _08006170
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	cmp r2, #0
	bge _08005FAA
	b _080060A8
_08005FAA:
	ldr r3, [sp, #0x10]
	ldr r6, [sp, #0x14]
	subs r4, r3, r6
	cmp r7, #0
	ble _08005FBA
	cmp r0, r4
	blt _08005FBA
	b _080060A4
_08005FBA:
	cmp r7, #0
	blt _0800609E
_08005FBE:
	ldr r3, [sp, #0x14]
	cmp sl, r3
	beq _0800600A
	ldr r0, [sp, #0x10]
	cmp sl, r0
	bgt _08005FD2
	cmp r0, r3
	ble _08005FDA
	cmp sl, r0
	blt _0800600A
_08005FD2:
	ldr r0, [sp, #0x10]
	ldr r4, [sp, #0x14]
	cmp r0, r4
	blt _0800600A
_08005FDA:
	mov r0, fp
	ldr r1, [r0]
	cmp r1, #0
	beq _08006094
	ldr r3, [sp, #0x18]
	movs r2, #0x80
	ldrh r4, [r3]
	lsls r6, r2, #1
	ands r6, r4
	cmp r6, #0
	beq _08006086
	movs r2, #0xa0
_08005FF2:
	mov r0, sb
	ldr r6, [r0]
	rsbs r4, r2, #0
	muls r6, r4, r6
	asrs r1, r6, #8
	str r1, [r0]
	mov r1, fp
	ldr r3, [r1]
	subs r3, #1
	str r3, [r1]
	cmp r3, #0
	beq _0800607C
_0800600A:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _0800606A
_08006010:
	mov r0, r8
	ldr r6, [r0]
	lsls r3, r5, #1
	adds r1, r6, r3
	str r1, [r0]
	ldr r4, [sp, #0x14]
	ldr r0, [sp, #8]
	str r4, [r0]
_08006020:
	ldr r6, [sp, #0x1c]
	adds r6, #0xa0
	movs r0, #0x10
	ldrsh r4, [r6, r0]
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r2, _08006174
	lsls r5, r1, #0xd
	lsrs r4, r5, #0x10
	ldrh r1, [r6, #0x18]
	mov r8, r2
	adds r0, r4, #0
	bl _call_via_r8
	ldr r5, [r6, #0x18]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x14
	adds r5, r5, r3
	lsls r0, r5, #0x10
	str r5, [r6, #0x18]
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	adds r5, r5, r2
	str r5, [r6, #0x18]
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800606A:
	mov r2, fp
	ldr r3, [r2]
	cmp r3, #0
	bne _08006010
	mov r0, r8
	str r3, [r0]
	ldr r5, [sp, #8]
	str r3, [r5]
	b _08006020
_0800607C:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _0800600A
	str r3, [r0]
	b _0800600A
_08006086:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _08006090
	movs r2, #0x80
	b _08005FF2
_08006090:
	movs r2, #0x40
	b _08005FF2
_08006094:
	mov r0, sb
	ldr r6, [r0]
	rsbs r2, r6, #0
	str r2, [r0]
	b _0800600A
_0800609E:
	cmp r0, r4
	ble _080060A4
	b _08005FBE
_080060A4:
	ldr r5, [sp]
	b _08005FBE
_080060A8:
	rsbs r0, r0, #0
	b _08005FAA
_080060AC:
	rsbs r1, r4, #0
	b _08005F9A
_080060B0:
	adds r0, r3, #0
	b _08005F92
_080060B4:
	cmp r1, #0
	blt _080060BA
	b _08005FBE
_080060BA:
	cmp r4, #0
	blt _080060C0
	b _08005FBE
_080060C0:
	b _08005F7A
_080060C2:
	adds r6, r1, #0
	adds r6, #0xb0
	ldr r1, [r6]
	muls r1, r5, r1
	asrs r5, r1, #8
	b _08005F5A
_080060CE:
	movs r6, #0xf4
	lsls r3, r6, #1
	adds r0, r1, r3
	ldr r5, [r0]
	lsls r6, r5, #0xb
	asrs r5, r6, #8
	b _08005F50
_080060DC:
	cmp r4, #0
	bge _0800612A
	movs r5, #0xf4
	b _08006130
_080060E4:
	movs r6, #0x9c
	adds r3, r6, r1
	ldr r2, [r3]
	mov r8, r3
	cmp r2, #0
	bgt _080060F2
	b _08005F34
_080060F2:
	movs r5, #0xf4
	lsls r3, r5, #1
	adds r6, r1, r3
	ldr r2, [r6]
	lsls r5, r2, #0xb
	b _08006138
_080060FE:
	cmp r4, #0
	blt _0800613E
	movs r2, #0x9c
	adds r3, r2, r1
	mov r8, r3
_08006108:
	cmp r4, #0
	ble _08006126
	mov r0, r8
	ldr r6, [r0]
	cmp r6, #0
	blt _08006118
	movs r2, #0xf6
	b _08005F46
_08006118:
	movs r0, #0xf6
	lsls r3, r0, #1
	adds r6, r1, r3
	ldr r5, [r6]
	lsls r0, r5, #0xb
	asrs r5, r0, #8
	b _08005F50
_08006126:
	cmp r4, #0
	blt _0800612E
_0800612A:
	movs r5, #0
	b _08005F50
_0800612E:
	movs r5, #0xf6
_08006130:
	lsls r3, r5, #1
	adds r0, r1, r3
	ldr r6, [r0]
	lsls r5, r6, #0xa
_08006138:
	rsbs r0, r5, #0
	asrs r5, r0, #8
	b _08005F50
_0800613E:
	movs r3, #0x9c
	adds r0, r3, r1
	ldr r6, [r0]
	mov r8, r0
	cmp r6, #0
	ble _08006108
	movs r5, #0xf6
	lsls r3, r5, #1
	adds r6, r1, r3
	ldr r0, [r6]
	lsls r5, r0, #0xb
	rsbs r2, r5, #0
	b _08005F4E
_08006158:
	movs r3, #1
	str r3, [sp, #0xc]
	b _08005F08
	.byte 0x00, 0x00
_08006160:
	.4byte gUnk_0884E150
_08006164:
	.4byte 0xFFFFD800
_08006168:
	.4byte 0x00001AA8
_0800616C:
	.4byte 0xFFFFE558
_08006170:
	.4byte udiv
_08006174:
	.4byte _03000814
_08006178:
	ldr r6, [sp, #0x10]
	cmp r6, r0
	bge _0800618E
	lsls r6, r2, #0xc
	movs r3, #0xac
	adds r0, r3, r1
	rsbs r5, r6, #0
	asrs r2, r5, #8
	mov sb, r0
	str r2, [r0]
	b _08005EFA
_0800618E:
	movs r5, #0xac
	adds r2, r5, r1
	movs r0, #0
	mov sb, r2
	str r0, [r2]
	b _08005EFA
_0800619A:
	adds r0, r1, #0
	adds r0, #0xb0
	movs r2, #0x40
	movs r3, #0xa4
	str r2, [r0]
	adds r0, r3, r1
	movs r6, #3
	mov fp, r0
	str r6, [r0]
	b _08005EE6
_080061AE:
	adds r6, r1, #0
	movs r3, #0xa4
	adds r2, r3, r1
	adds r6, #0xb0
	movs r5, #0x40
	movs r0, #1
	str r5, [r6]
	mov fp, r2
	str r0, [r2]
	movs r2, #0x80
	b _08005EE6
_080061C4:
	adds r0, r1, #0
	adds r0, #0xb0
	movs r2, #0x40
	movs r3, #0xa4
	str r2, [r0]
	adds r0, r3, r1
	movs r5, #3
	mov fp, r0
	adds r2, #0xc0
	str r5, [r0]
	b _08005EE6
_080061DA:
	movs r6, #0xa4
	movs r2, #0xac
	adds r3, r6, r1
	adds r0, r2, r1
	mov fp, r3
	mov sb, r0
	b _08005EFA
_080061E8:
	ldr r6, [sp, #0x18]
	ldr r2, [r6, #4]
	cmp r2, #0
	ble _080061F2
	b _08005E96
_080061F2:
	ldr r0, _08006230
	str r0, [sp, #0x10]
	b _08005E96
_080061F8:
	ldr r3, [sp, #0x18]
	ldr r4, [r3, #4]
	cmp r4, #0
	bge _08006202
	b _08005E96
_08006202:
	ldr r5, _08006234
	str r5, [sp, #0x10]
	b _08005E96
_08006208:
	cmp r2, #1
	beq _08006222
_0800620C:
	cmp r2, #2
	beq _08006212
	b _08005E96
_08006212:
	ldr r6, [sp, #0x18]
	ldr r2, [r6, #4]
	cmp r2, #0
	blt _0800621C
	b _08005E96
_0800621C:
	movs r0, #0
	str r0, [sp, #0x10]
	b _08005E96
_08006222:
	ldr r3, [sp, #0x18]
	ldr r4, [r3, #4]
	cmp r4, #0
	ble _0800620C
	movs r5, #0
	str r5, [sp, #0x10]
	b _08005E96
_08006230:
	.4byte 0xFFFFE558
_08006234:
	.4byte 0x00001AA8

	.global plane_pitch_input
	.thumb_func
	.type plane_pitch_input, %function
plane_pitch_input: @ 08006238
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r2, #8]
	mov fp, r1
	cmp r2, #0
	beq _08006268
	cmp r2, #0
	bge _08006258
	b _08006356
_08006258:
	cmp r2, #0
	bgt _0800625E
	b _08006348
_0800625E:
	mov r3, fp
	adds r3, #0xdc
	ldr r1, [r3]
	cmp r1, #0
	beq _08006348
_08006268:
	mov r2, fp
	adds r2, #0xb8
	str r2, [sp, #4]
	ldr r7, [sp, #8]
	ldr r1, [r2]
	subs r2, r7, r1
	cmp r2, #0
	ble _0800633A
	movs r0, #0x80
_0800627A:
	ldr r3, [sp, #4]
	ldr r1, [r3]
	movs r3, #0xb4
	add r3, fp
	mov sb, r1
	ldr r1, [r3]
	mov r8, r3
	lsls r3, r1, #1
	lsls r4, r0, #1
	add r3, sb
	mov sl, r4
	adds r7, r3, r4
	cmp r1, #0
	ble _08006330
	cmp r2, #0
	ble _08006330
_0800629A:
	mov r1, r8
	ldr r6, [r1]
	adds r3, r6, #0
	muls r3, r6, r3
	rsbs r2, r0, #0
	rsbs r5, r3, #0
	str r2, [sp]
	lsls r4, r2, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _0800632C
_080062B0:
	adds r1, r4, #0
	cmp r4, #0
	blt _08006328
_080062B6:
	ldr r2, _08006364
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08006324
_080062C4:
	ldr r4, [sp, #8]
	subs r2, r4, r7
	cmp r6, #0
	ble _080062D0
	cmp r0, r2
	bge _0800631C
_080062D0:
	cmp r6, #0
	blt _08006318
_080062D4:
	mov r1, r8
	ldr r2, [r1]
	add r2, sl
	str r2, [r1]
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _08006300
_080062E2:
	ldr r4, [sp, #4]
	mov r2, fp
	adds r2, #0xbc
	asrs r1, r7, #2
	str r7, [r4]
	add sp, #0xc
	str r1, [r2]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08006300:
	mov r3, sb
	cmp r3, #0
	ble _0800630E
_08006306:
	cmp r7, #0
	bgt _080062E2
_0800630A:
	movs r7, #0
	b _080062E2
_0800630E:
	cmp r7, #0
	bge _0800630A
	cmp r3, #0
	bge _08006306
	b _080062E2
_08006318:
	cmp r0, r2
	bgt _080062D4
_0800631C:
	ldr r0, [sp]
	lsls r4, r0, #1
	mov sl, r4
	b _080062D4
_08006324:
	rsbs r0, r0, #0
	b _080062C4
_08006328:
	rsbs r1, r4, #0
	b _080062B6
_0800632C:
	adds r0, r3, #0
	b _080062B0
_08006330:
	cmp r1, #0
	bge _080062D4
	cmp r2, #0
	bge _080062D4
	b _0800629A
_0800633A:
	cmp r2, #0
	blt _08006342
	movs r0, #0
	b _0800627A
_08006342:
	movs r4, #0x80
	rsbs r0, r4, #0
	b _0800627A
_08006348:
	rsbs r3, r2, #0
	lsls r0, r3, #1
	adds r7, r0, r3
	lsls r4, r7, #0xb
	asrs r2, r4, #8
	str r2, [sp, #8]
	b _08006268
_08006356:
	mov r3, fp
	adds r3, #0xd8
	ldr r0, [r3]
	cmp r0, #1
	ble _08006362
	b _08006268
_08006362:
	b _08006258
_08006364:
	.4byte udiv

	.global plane_vertical_speed
	.thumb_func
	.type plane_vertical_speed, %function
plane_vertical_speed: @ 08006368
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x30
	adds r7, r1, #0
	str r2, [sp, #0x2c]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x88
	ldr r6, [r0]
	movs r2, #0xfa
	lsls r4, r2, #1
	adds r0, r6, r4
	movs r5, #0xfa
	str r0, [sp, #0x20]
	adds r2, r7, #0
	lsls r1, r5, #2
	adds r2, #0x8c
	ldr r0, [r2]
	adds r5, r6, r1
	movs r6, #0xfa
	lsls r4, r6, #1
	adds r3, r0, r4
	str r3, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x24]
	mov r6, sl
	adds r6, #0xa0
	ldr r1, _08006634
	mov sb, r3
	ldr r3, [r6]
	ands r3, r1
	movs r1, #0x80
	lsls r2, r1, #9
	movs r4, #0
	cmp r3, r2
	bne _080063BA
	b _08006834
_080063BA:
	movs r1, #0xe8
	adds r2, r1, r7
	mov fp, r2
_080063C0:
	ldr r2, [sp, #0x2c]
	ldr r3, [r2, #8]
	cmp r3, #0
	bgt _080063CA
	b _08006814
_080063CA:
	adds r2, r7, #0
	adds r2, #0xdc
	ldr r1, [r2]
	cmp r1, #0
	bne _080063D6
	b _0800680A
_080063D6:
	adds r1, r7, #0
	adds r1, #0xd8
_080063DA:
	movs r2, #0
	str r2, [r1]
_080063DE:
	mov r3, fp
	ldr r2, [r3]
	mov r1, sb
	subs r3, r1, r2
	str r3, [sp, #0x28]
	cmp r2, #0
	bge _080063EE
	b _08006610
_080063EE:
	mov r3, sl
	ldr r1, [r3, #0x28]
	ldr r6, [sp, #0x1c]
	adds r3, r1, #0
	cmp r1, r6
	bge _08006402
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bgt _08006402
	b _080065BA
_08006402:
	mov r6, fp
	ldr r2, [r6]
	cmp r2, #0
	bgt _0800640C
	b _08006548
_0800640C:
	cmp r3, r5
	blt _080064EA
	movs r3, #0
	mov r0, sl
	mov sb, r3
	movs r4, #6
	str r3, [r6]
	str r5, [r0, #0x28]
_0800641C:
	str r3, [sp, #0x24]
_0800641E:
	cmp r4, #0
	beq _080064A2
_08006422:
	mov r6, fp
	ldr r0, [r6]
	ldr r6, [sp, #0x24]
	lsls r2, r0, #1
	lsls r0, r6, #1
	adds r1, r2, r0
	cmp r4, #5
	beq _0800648A
_08006432:
	cmp r4, #8
	beq _08006474
_08006436:
	mov r3, fp
	ldr r2, [r3]
	adds r0, r2, r0
	cmp r2, sb
	bgt _08006448
	cmp sb, r0
	ble _0800644C
	cmp r2, sb
	blt _0800646E
_08006448:
	cmp sb, r0
	blt _0800646E
_0800644C:
	mov r6, sb
	mov r0, fp
	str r6, [r0]
_08006452:
	mov r6, fp
	ldr r2, [r6]
	mov r0, sl
	str r2, [r0, #0x4c]
	add sp, #0x30
	adds r0, r1, #0
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0800646E:
	mov r2, fp
	str r0, [r2]
	b _08006452
_08006474:
	mov r2, sl
	ldr r3, [r2, #0x28]
	ldr r2, [sp, #0x20]
	adds r6, r3, r1
	cmp r6, r2
	ble _08006436
	adds r6, r7, #0
	adds r6, #0xdc
	movs r2, #1
	str r2, [r6]
	b _08006436
_0800648A:
	mov r2, sl
	ldr r3, [r2, #0x28]
	ldr r2, [sp, #0x1c]
	adds r6, r3, r1
	cmp r6, r2
	ble _08006432
	adds r6, r7, #0
	adds r6, #0xd8
	ldr r2, [r6]
	adds r2, #1
	str r2, [r6]
	b _08006436
_080064A2:
	ldr r1, [sp, #0x28]
	cmp r1, #0
	ble _080064C4
	ldr r3, [sp, #0x2c]
	ldr r6, [r3, #8]
	cmp r6, #0
	beq _080064BA
	adds r2, r7, #0
	adds r2, #0xc8
	ldr r0, [r2]
	str r0, [sp, #0x24]
	b _08006422
_080064BA:
	adds r6, r7, #0
	adds r6, #0xd0
	ldr r1, [r6]
	str r1, [sp, #0x24]
	b _08006422
_080064C4:
	ldr r3, [sp, #0x28]
	cmp r3, #0
	bge _08006422
	ldr r1, [sp, #0x2c]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080064DE
	adds r0, r7, #0
	adds r0, #0xcc
	ldr r6, [r0]
	rsbs r2, r6, #0
	str r2, [sp, #0x24]
	b _08006422
_080064DE:
	adds r6, r7, #0
	adds r6, #0xd4
	ldr r2, [r6]
	rsbs r1, r2, #0
	str r1, [sp, #0x24]
	b _08006422
_080064EA:
	ldr r6, [sp, #0x20]
	cmp r3, r6
	blt _0800641E
	subs r0, r5, r3
	adds r3, r2, #0
	muls r3, r2, r3
	rsbs r5, r3, #0
	lsls r4, r0, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _08006544
_08006500:
	adds r1, r4, #0
	cmp r4, #0
	blt _08006540
_08006506:
	ldr r2, _08006638
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _0800653C
_08006514:
	ldr r3, [sp, #0x28]
	str r0, [sp, #0x24]
	cmp r3, #0
	blt _08006524
	movs r0, #0
	mov sb, r0
_08006520:
	movs r4, #7
	b _0800641E
_08006524:
	adds r1, r7, #0
	adds r1, #0xc4
	adds r2, r7, #0
	ldr r4, [r1]
	adds r2, #0xcc
	ldr r6, [r2]
	rsbs r3, r4, #0
	adds r1, r0, #0
	subs r4, r1, r6
	mov sb, r3
	str r4, [sp, #0x24]
	b _08006520
_0800653C:
	rsbs r0, r0, #0
	b _08006514
_08006540:
	rsbs r1, r4, #0
	b _08006506
_08006544:
	adds r0, r3, #0
	b _08006500
_08006548:
	ldr r2, [sp, #0x20]
	cmp r1, r2
	bgt _08006550
	b _0800641E
_08006550:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bge _08006558
	b _0800641E
_08006558:
	adds r0, r7, #0
	adds r0, #0xd4
	ldr r3, [r0]
	mov r8, r3
	mov r6, r8
	rsbs r3, r6, #0
	str r3, [sp, #0x24]
	adds r4, r7, #0
	adds r4, #0xc4
	ldr r6, [r4]
	mov r0, fp
	rsbs r3, r6, #0
	mov sb, r3
	ldr r3, [r0]
	cmp r3, #0
	blt _0800657C
_08006578:
	movs r4, #8
	b _0800641E
_0800657C:
	adds r5, r3, #0
	muls r5, r3, r5
	adds r3, r5, #0
	subs r6, r2, r1
	rsbs r5, r3, #0
	mov r2, r8
	lsls r4, r2, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _080065B6
_08006590:
	adds r1, r4, #0
	cmp r4, #0
	blt _080065B2
_08006596:
	ldr r2, _08006638
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _080065AE
_080065A4:
	cmp r0, r6
	bge _08006578
	mov r3, r8
	str r3, [sp, #0x24]
	b _08006578
_080065AE:
	rsbs r0, r0, #0
	b _080065A4
_080065B2:
	rsbs r1, r4, #0
	b _08006596
_080065B6:
	adds r0, r3, #0
	b _08006590
_080065BA:
	adds r0, r7, #0
	adds r0, #0xd0
	ldr r4, [r0]
	adds r0, r7, #0
	str r4, [sp, #0x24]
	adds r0, #0xc0
	ldr r3, [r0]
	mov sb, r3
	cmp r2, #0
	ble _08006600
	adds r3, r2, #0
	muls r3, r2, r3
	ldr r2, [sp, #0x24]
	subs r6, r6, r1
	rsbs r5, r3, #0
	rsbs r1, r2, #0
	mov r8, r1
	lsls r4, r1, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _0800660C
_080065E4:
	adds r1, r4, #0
	cmp r4, #0
	blt _08006608
_080065EA:
	ldr r2, _08006638
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08006604
_080065F8:
	cmp r0, r6
	ble _08006600
	mov r2, r8
	str r2, [sp, #0x24]
_08006600:
	movs r4, #5
	b _0800641E
_08006604:
	rsbs r0, r0, #0
	b _080065F8
_08006608:
	rsbs r1, r4, #0
	b _080065EA
_0800660C:
	adds r0, r3, #0
	b _080065E4
_08006610:
	mov r3, sl
	ldr r1, [r3, #0x28]
	cmp r1, r0
	ble _0800661A
	b _0800678E
_0800661A:
	movs r3, #0x13
	rsbs r4, r3, #0
	cmp r2, r4
	blt _0800663C
	movs r6, #0
	mov r2, fp
	str r6, [r2]
	mov r3, sl
	mov sb, r6
	movs r4, #1
	str r0, [r3, #0x28]
	str r6, [sp, #0x24]
	b _0800641E
_08006634:
	.4byte 0x00010180
_08006638:
	.4byte udiv
_0800663C:
	movs r3, #0
	mov r1, fp
	mov r2, sl
	movs r4, #0xe0
	str r3, [r1]
	mov sb, r3
	str r0, [r2, #0x28]
	str r3, [sp, #0x24]
	movs r2, #0xfc
	adds r3, r4, r7
	mov r8, r3
	lsls r3, r2, #1
	adds r1, r7, r3
	ldr r5, [r1]
	mov r1, r8
	str r5, [r1]
	adds r5, r7, #0
	adds r5, #0xe4
	ldr r0, [r5]
	asrs r4, r0, #1
	str r4, [r5]
	ldr r2, _08006844
	ldr r1, [r6, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0800676A
_08006670:
	mov r3, sl
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	ldr r2, [r3, #0x2c]
	movs r4, #0x7f
	movs r3, #0x80
	str r4, [sp]
	lsls r4, r3, #9
	str r4, [sp, #4]
	movs r4, #2
	str r4, [sp, #8]
	movs r4, #0xa
	str r4, [sp, #0xc]
	movs r3, #0xa0
	movs r4, #0
	str r4, [sp, #0x10]
	bl gamesfx_play_at
_08006694:
	ldr r0, [r7, #0x24]
	cmp r0, #0
	beq _0800669E
	movs r1, #4
	str r1, [r7, #0x24]
_0800669E:
	movs r0, #0xe
	ldrsh r4, [r6, r0]
	ldr r6, _08006848
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	adds r0, r4, #0
	ldr r4, _0800684C
	asrs r6, r2, #0x10
	bl _call_via_r4
	movs r3, #0xfa
	lsls r2, r3, #1
	lsls r1, r0, #0x10
	adds r3, r7, r2
	mov r0, r8
	ldr r2, [r0]
	ldr r0, [r3]
	asrs r4, r1, #0x10
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r0, r1, #0x10
	ldr r1, [r5]
	adds r5, r4, #0
	muls r5, r0, r5
	adds r3, r6, #0
	muls r3, r1, r3
	asrs r2, r3, #0xc
	asrs r3, r5, #0xc
	adds r5, r2, r3
	rsbs r2, r1, #0
	adds r3, r4, #0
	muls r3, r2, r3
	adds r1, r6, #0
	muls r1, r0, r1
	asrs r4, r3, #0xc
	asrs r0, r1, #0xc
	str r5, [sp, #0x18]
	movs r6, #4
	adds r5, r4, r0
	rsbs r1, r6, #0
	str r5, [sp, #0x14]
	mov r8, r1
_080066F6:
	bl sub_08002E78
	adds r5, r0, #0
	cmp r5, #0
	beq _0800675C
	mov r2, r8
	lsls r0, r2, #0x1d
	asrs r4, r0, #0x10
	ldr r6, _08006848
	adds r0, r4, #0
	bl _call_via_r6
	ldr r1, _0800684C
	lsls r2, r0, #0x10
	adds r0, r4, #0
	asrs r6, r2, #0x10
	bl _call_via_r1
	movs r2, #0xfa
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	lsls r3, r2, #2
	adds r2, r1, #0
	muls r2, r3, r2
	adds r1, r6, #0
	muls r1, r3, r1
	mov r6, sl
	ldr r3, [r6, #0x24]
	asrs r0, r2, #0xc
	adds r3, r3, r0
	str r3, [r5]
	ldr r0, [r6, #0x28]
	str r0, [r5, #4]
	ldr r3, [r6, #0x2c]
	asrs r4, r1, #0xc
	adds r0, r3, r4
	str r0, [r5, #8]
	ldr r6, [sp, #0x18]
	asrs r4, r2, #0x10
	adds r3, r6, r4
	movs r2, #0x64
	str r3, [r5, #0xc]
	str r2, [r5, #0x10]
	ldr r6, [sp, #0x14]
	asrs r4, r1, #0x10
	ldr r0, _08006850
	adds r3, r6, r4
	movs r1, #0x1e
	str r3, [r5, #0x14]
	str r1, [r5, #0x18]
	str r0, [r5, #0x1c]
_0800675C:
	movs r4, #1
	add r8, r4
	mov r6, r8
	cmp r6, #3
	ble _080066F6
	movs r4, #2
	b _0800641E
_0800676A:
	ldr r1, _08006854
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #7
	beq _08006776
	b _08006670
_08006776:
	movs r2, #0xa
	str r2, [sp]
	movs r3, #0x80
	mov r2, sb
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xa0
	movs r3, #1
	bl gamesfx_play
	b _08006694
_0800678E:
	ldr r6, [sp, #0x1c]
	cmp r1, r6
	ble _08006796
	b _08006548
_08006796:
	adds r3, r7, #0
	adds r3, #0xc4
	ldr r6, [r3]
	cmn r2, r6
	bge _080067A8
	movs r3, #0
	mov sb, r2
	movs r4, #3
	b _0800641C
_080067A8:
	adds r3, r7, #0
	adds r3, #0xd8
	ldr r6, [r3]
	cmp r6, #0
	beq _080067B4
	b _0800641E
_080067B4:
	adds r3, r2, #0
	muls r3, r2, r3
	subs r6, r0, r1
	rsbs r5, r3, #0
	lsls r4, r6, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _08006806
_080067C4:
	adds r1, r4, #0
	cmp r4, #0
	blt _08006802
_080067CA:
	ldr r2, _08006858
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _080067FE
_080067D8:
	ldr r4, [sp, #0x28]
	str r0, [sp, #0x24]
	cmp r4, #0
	ble _080067F8
	adds r4, r7, #0
	adds r2, r7, #0
	adds r4, #0xc0
	adds r2, #0xc8
	ldr r3, [r4]
	ldr r1, [r2]
	ldr r6, [sp, #0x24]
	mov sb, r3
	adds r0, r6, r1
	str r0, [sp, #0x24]
_080067F4:
	movs r4, #4
	b _0800641E
_080067F8:
	movs r2, #0
	mov sb, r2
	b _080067F4
_080067FE:
	rsbs r0, r0, #0
	b _080067D8
_08006802:
	rsbs r1, r4, #0
	b _080067CA
_08006806:
	adds r0, r3, #0
	b _080067C4
_0800680A:
	adds r1, r7, #0
	adds r1, #0xc0
	ldr r3, [r1]
	mov sb, r3
	b _080063D6
_08006814:
	cmp r3, #0
	blt _0800681A
	b _080063DE
_0800681A:
	adds r2, r7, #0
	adds r2, #0xd8
	ldr r1, [r2]
	cmp r1, #1
	bgt _0800682E
	adds r2, r7, #0
	adds r2, #0xc4
	ldr r1, [r2]
	rsbs r3, r1, #0
	mov sb, r3
_0800682E:
	adds r1, r7, #0
	adds r1, #0xdc
	b _080063DA
_08006834:
	movs r3, #0xe8
	mov r1, sl
	adds r2, r3, r7
	ldr r3, [r1, #0x4c]
	mov fp, r2
	str r3, [r2]
	b _080063C0
	.byte 0x00, 0x00
_08006844:
	.4byte gLocalPlayerIndex
_08006848:
	.4byte cos_fx
_0800684C:
	.4byte sin_fx
_08006850:
	.4byte 0x00000529
_08006854:
	.4byte gGameSetup
_08006858:
	.4byte udiv

	.global sub_0800685C
	.thumb_func
	.type sub_0800685C, %function
sub_0800685C: @ 0800685C
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0x54]
	adds r5, r0, #0
	adds r0, r2, #0
	cmp r1, #0
	bne _0800686C
	b _08006998
_0800686C:
	cmp r1, #1
	beq _080068A0
	ldr r3, [r4, #0x70]
	cmp r3, #0
	beq _08006882
	cmp r3, #0
	ble _0800688E
	subs r3, #0x10
	str r3, [r4, #0x70]
	cmp r3, #0
	blt _08006888
_08006882:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08006888:
	movs r0, #0
	str r0, [r4, #0x70]
	b _08006882
_0800688E:
	cmp r3, #0
	bge _08006882
	adds r3, #0x10
	str r3, [r4, #0x70]
	cmp r3, #0
	ble _08006882
	movs r1, #0
	str r1, [r4, #0x70]
	b _08006882
_080068A0:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x58]
	lsls r7, r0, #1
	lsls r3, r1, #1
	adds r1, r7, r3
	adds r7, r0, r3
	ldr r3, [r4, #0x74]
	str r7, [r4, #0x5c]
	adds r7, r3, r1
	cmp r1, #0
	ble _080068C2
	movs r0, #0x80
	lsls r2, r0, #9
	cmp r3, r2
	bgt _080068C2
	cmp r7, r2
	bge _08006944
_080068C2:
	cmp r1, #0
	blt _0800693A
_080068C6:
	ldr r2, [r4, #0x58]
	cmp r2, #0
	ble _0800691E
	movs r0, #0x80
	lsls r1, r0, #8
	cmp r3, r1
	bgt _0800691E
	cmp r7, r1
	blt _0800691E
	ldr r6, [r4, #0x5c]
	adds r5, r6, #0
	muls r5, r6, r5
	movs r1, #0x80
	adds r3, r5, #0
	lsls r2, r1, #9
	subs r0, r2, r7
_080068E6:
	rsbs r6, r3, #0
	lsls r5, r0, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _0800691A
_080068F0:
	adds r1, r5, #0
	cmp r5, #0
	blt _08006916
_080068F6:
	ldr r2, _080069E4
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r5
	cmp r2, #0
	blt _08006912
_08006904:
	str r0, [r4, #0x58]
_08006906:
	ldr r2, [r4, #0x5c]
	lsls r1, r2, #0xd
	asrs r0, r1, #0x10
	str r7, [r4, #0x74]
	str r0, [r4, #0x70]
	b _08006882
_08006912:
	rsbs r0, r0, #0
	b _08006904
_08006916:
	rsbs r1, r5, #0
	b _080068F6
_0800691A:
	adds r0, r3, #0
	b _080068F0
_0800691E:
	cmp r2, #0
	bge _08006906
	ldr r2, _080069E8
	cmp r3, r2
	blt _08006906
	cmp r7, r2
	bgt _08006906
	ldr r6, [r4, #0x5c]
	adds r5, r6, #0
	muls r5, r6, r5
	ldr r1, _080069EC
	adds r3, r5, #0
	subs r0, r1, r7
	b _080068E6
_0800693A:
	ldr r2, _080069EC
	cmp r3, r2
	blt _080068C6
	cmp r7, r2
	bgt _080068C6
_08006944:
	adds r2, r4, #0
	adds r2, #0xb0
	movs r1, #0x80
	str r1, [r2]
	movs r7, #3
	subs r2, #0xc
	str r7, [r2]
	ldr r3, [r4, #0x5c]
	cmp r3, #0
	ble _08006986
	adds r0, r3, #0
	muls r0, r3, r0
	adds r7, r0, #0
	adds r2, #8
	asrs r0, r7, #5
	str r0, [r2]
_08006964:
	movs r7, #0
	str r7, [r4, #0x54]
	str r7, [r4, #0x58]
	str r7, [r4, #0x5c]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r1, [r0]
	movs r2, #0x21
	rsbs r3, r2, #0
	ands r1, r3
	str r1, [r0]
	movs r1, #0xcc
	lsls r2, r1, #1
	adds r1, r4, r2
	movs r0, #1
	str r0, [r1]
	b _08006906
_08006986:
	adds r2, r3, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r7, r4, #0
	rsbs r1, r0, #0
	adds r7, #0xac
	asrs r2, r1, #5
	str r2, [r7]
	b _08006964
_08006998:
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	ands r3, r2
	cmp r3, #0
	bne _080069A6
	b _0800686C
_080069A6:
	ldr r2, [r0, #4]
	cmp r2, #0
	bne _080069AE
	b _0800686C
_080069AE:
	str r1, [r4, #0x5c]
	movs r1, #1
	str r1, [r4, #0x54]
	ldr r2, [r0, #4]
	rsbs r1, r2, #0
	lsls r0, r1, #7
	asrs r2, r0, #8
	str r2, [r4, #0x58]
	adds r0, r5, #0
	movs r1, #9
	movs r2, #1
	bl gamesfx_play_voice
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r1, [r0]
	movs r3, #0x20
	orrs r1, r3
	movs r3, #0xcc
	lsls r2, r3, #1
	str r1, [r0]
	movs r1, #5
	adds r0, r4, r2
	str r1, [r0]
	ldr r1, [r4, #0x54]
	b _0800686C
	.byte 0x00, 0x00
_080069E4:
	.4byte udiv
_080069E8:
	.4byte 0xFFFF8000
_080069EC:
	.4byte 0xFFFF0000

	.global sub_080069F0
	.thumb_func
	.type sub_080069F0, %function
sub_080069F0: @ 080069F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r1, #0
	movs r1, #0
	ldr r7, [r5, #0x5c]
	mov sb, r1
	ldr r1, [r5, #0x58]
	mov sl, r0
	lsls r3, r1, #1
	lsls r0, r7, #1
	adds r1, r0, r3
	adds r0, r7, r3
	str r0, [r5, #0x5c]
	movs r2, #0xa0
	add r2, sl
	ldr r3, [r2, #0x14]
	sub sp, #8
	mov r8, r2
	adds r7, r3, r1
	cmp r1, #0
	ble _08006A2C
	movs r0, #0x80
	lsls r2, r0, #9
	cmp r3, r2
	bgt _08006A2C
	cmp r7, r2
	bge _08006AE4
_08006A2C:
	cmp r1, #0
	blt _08006ADA
_08006A30:
	ldr r2, [r5, #0x58]
	cmp r2, #0
	ble _08006ABE
	movs r0, #0x80
	lsls r1, r0, #8
	cmp r3, r1
	bgt _08006ABE
	cmp r7, r1
	blt _08006ABE
	ldr r2, [r5, #0x5c]
	adds r6, r2, #0
	muls r6, r2, r6
	movs r4, #0x80
	lsls r1, r4, #9
	adds r3, r6, #0
	subs r0, r1, r7
_08006A50:
	rsbs r6, r3, #0
	lsls r4, r0, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _08006ABA
_08006A5A:
	adds r1, r4, #0
	cmp r4, #0
	blt _08006AB6
_08006A60:
	ldr r2, _08006B68
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	cmp r2, #0
	blt _08006AB2
_08006A6E:
	str r0, [r5, #0x58]
_08006A70:
	mov r2, r8
	str r7, [r2, #0x14]
	ldr r0, [r5, #0x54]
	cmp r0, #2
	beq _08006A8C
_08006A7A:
	mov r0, sb
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08006A8C:
	lsls r3, r7, #0xf
	asrs r0, r3, #0x10
	ldr r2, _08006B6C
	bl _call_via_r2
	ldr r2, _08006B70
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	muls r2, r3, r2
	adds r0, r5, #0
	adds r0, #0x84
	asrs r1, r2, #0xc
	ldr r2, [r0]
	adds r0, r1, r2
	mov r1, sl
	ldr r2, [r1, #0x28]
	subs r3, r0, r2
	mov sb, r3
	b _08006A7A
_08006AB2:
	rsbs r0, r0, #0
	b _08006A6E
_08006AB6:
	rsbs r1, r4, #0
	b _08006A60
_08006ABA:
	adds r0, r3, #0
	b _08006A5A
_08006ABE:
	cmp r2, #0
	bge _08006A70
	ldr r2, _08006B74
	cmp r3, r2
	blt _08006A70
	cmp r7, r2
	bgt _08006A70
	ldr r1, [r5, #0x5c]
	adds r6, r1, #0
	muls r6, r1, r6
	ldr r4, _08006B78
	adds r3, r6, #0
	subs r0, r4, r7
	b _08006A50
_08006ADA:
	ldr r2, _08006B78
	cmp r3, r2
	blt _08006B02
	cmp r7, r2
	bgt _08006B02
_08006AE4:
	movs r7, #0
	str r7, [r5, #0x58]
	str r7, [r5, #0x5c]
	str r7, [r5, #0x54]
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _08006B7C
	ands r0, r3
	str r0, [r1]
	movs r1, #0xcc
	lsls r0, r1, #1
	adds r1, r5, r0
	movs r2, #1
	str r2, [r1]
	b _08006A70
_08006B02:
	cmp r1, #0
	bge _08006A30
	ldr r2, _08006B80
	cmp r3, r2
	blt _08006A30
	cmp r7, r2
	bgt _08006A30
	mov r1, r8
	ldr r2, [r1]
	movs r3, #0x80
	lsls r0, r3, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08006A70
	ldr r0, _08006B84
	movs r4, #0xa
	ands r2, r0
	str r2, [r1]
	movs r0, #0x9e
	lsls r2, r3, #9
	str r4, [sp]
	movs r1, #0x7f
	movs r4, #0
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	movs r0, #1
	movs r2, #0x14
	movs r1, #2
	str r1, [r5, #0x78]
	str r2, [r5, #0x28]
	str r2, [r5, #0x44]
	str r0, [r5, #0x24]
	str r4, [r5, #0x38]
	str r4, [r5, #0x3c]
	str r0, [r5, #0x40]
	str r4, [r5, #0x4c]
	str r4, [r5, #0x50]
	mov r2, r8
	ldr r0, [r2]
	ldr r3, _08006B88
	ldr r1, _08006B8C
	ands r0, r3
	mov r3, sl
	orrs r0, r1
	adds r3, #0xfa
	mov r1, r8
	str r0, [r1]
	strh r4, [r3]
	b _08006A70
_08006B68:
	.4byte udiv
_08006B6C:
	.4byte sin_fx
_08006B70:
	.4byte 0xFFFFF448
_08006B74:
	.4byte 0xFFFF8000
_08006B78:
	.4byte 0xFFFF0000
_08006B7C:
	.4byte 0xFFFFBFEF
_08006B80:
	.4byte 0xFFFF4000
_08006B84:
	.4byte 0xFFBFFFFF
_08006B88:
	.4byte 0xFFFFF3FF
_08006B8C:
	.4byte 0x01000040

	.global sub_08006B90
	.thumb_func
	.type sub_08006B90, %function
sub_08006B90: @ 08006B90
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x2c
	mov r8, r1
	movs r1, #0
	str r1, [sp, #0x1c]
	str r1, [sp, #0x18]
	str r1, [sp, #0x20]
	str r1, [sp, #0x14]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	movs r1, #0x64
	add r1, r8
	movs r3, #0
	ldrsh r2, [r1, r3]
	mov sl, r0
	mov fp, r1
	mov sb, r2
	cmp r2, #0
	bne _08006BC2
	b _08006DD0
_08006BC2:
	mov r3, sb
	cmp r3, #1
	bne _08006BCA
	b _08006D06
_08006BCA:
	ldr r2, [sp, #0x24]
	cmp r2, #0
	beq _08006C22
	movs r6, #0xa2
	lsls r4, r6, #1
	add r4, r8
	ldr r1, [r4]
	cmp r1, #2
	bne _08006BDE
	b _08006CF6
_08006BDE:
	ldr r2, _08006E48
	lsls r0, r1, #2
	ldr r6, [r2, r0]
	movs r4, #0xa0
_08006BE6:
	mov r5, sl
	ldr r3, _08006E4C
	adds r5, #0xa0
	ldr r0, [r5, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _08006CD2
_08006BF4:
	mov r3, sl
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	ldr r2, [r3, #0x2c]
	ldr r3, [sp, #0x14]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	adds r3, r4, #0
	bl gamesfx_play_at
_08006C18:
	ldr r3, _08006E4C
	ldr r0, [r5, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _08006C36
_08006C22:
	ldr r0, [sp, #0x28]
	add sp, #0x2c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08006C36:
	movs r7, #0xa2
	lsls r1, r7, #3
	movs r2, #8
	mov ip, r1
	rsbs r0, r2, #0
	mov r2, ip
	orrs r2, r6
	mov sb, r0
	mov fp, r2
_08006C48:
	bl sub_08002E78
	adds r7, r0, #0
	cmp r7, #0
	beq _08006CC6
	mov r3, sb
	lsls r2, r3, #0x1d
	asrs r6, r2, #0x10
	ldr r5, _08006E50
	adds r0, r6, #0
	bl _call_via_r5
	adds r3, r0, #0
	lsls r0, r3, #0x10
	ldr r1, _08006E54
	asrs r5, r0, #0x10
	adds r0, r6, #0
	bl _call_via_r1
	movs r4, #0xfa
	lsls r1, r4, #1
	muls r5, r1, r5
	lsls r2, r0, #0x10
	asrs r6, r2, #0x10
	asrs r0, r5, #0xc
	adds r4, r6, #0
	muls r4, r1, r4
	mov r8, r0
	bl lfsr_next
	ldr r2, _08006E58
	ldr r3, _08006E5C
	ands r2, r0
	ldr r1, [sp, #0x20]
	adds r0, r2, r3
	lsrs r2, r0, #1
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r3, r0, #0x10
	adds r2, r1, r3
	mov r1, sl
	ldr r3, [r1, #0x24]
	asrs r6, r4, #0xc
	adds r0, r3, r6
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r0, [r1, #0x2c]
	add r0, r8
	str r0, [r7, #8]
	ldr r1, [sp, #0x1c]
	asrs r0, r4, #0x10
	adds r4, r1, r0
	str r4, [r7, #0xc]
	str r2, [r7, #0x10]
	ldr r2, [sp, #0x18]
	movs r1, #0x28
	asrs r3, r5, #0x10
	adds r5, r2, r3
	str r1, [r7, #0x18]
	mov r1, fp
	str r5, [r7, #0x14]
	str r1, [r7, #0x1c]
_08006CC6:
	movs r1, #1
	add sb, r1
	mov r3, sb
	cmp r3, #7
	ble _08006C48
	b _08006C22
_08006CD2:
	ldr r1, _08006E60
	adds r1, #0x8c
	ldr r2, [r1]
	cmp r2, #7
	beq _08006CDE
	b _08006BF4
_08006CDE:
	movs r2, #0xa
	movs r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	adds r0, r4, #0
	ldr r1, [sp, #0x14]
	movs r3, #1
	bl gamesfx_play
	b _08006C18
_08006CF6:
	cmp r2, #1
	beq _08006D02
	movs r4, #0xea
_08006CFC:
	ldr r5, _08006E48
	ldr r6, [r5, #0xc]
	b _08006BE6
_08006D02:
	movs r4, #0xe9
	b _08006CFC
_08006D06:
	mov r6, r8
	adds r6, #0x66
	movs r0, #0
	ldrsh r4, [r6, r0]
	movs r5, #0x80
	lsls r0, r5, #5
	adds r5, r4, r0
	lsls r3, r5, #0x10
	asrs r0, r3, #0x11
	ldr r2, _08006E54
	strh r5, [r6]
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	movs r0, #0xfa
	asrs r1, r2, #0xc
	lsls r3, r0, #3
	muls r3, r1, r3
	mov r2, r8
	adds r2, #0x8c
	ldr r0, [r2]
	asrs r1, r3, #0xc
	adds r2, r0, r1
	mov r0, sl
	ldr r3, [r0, #0x28]
	subs r1, r2, r3
	str r1, [sp, #0x28]
	cmp r4, #0
	blt _08006D48
	b _08006BCA
_08006D48:
	cmp r5, #0
	bge _08006D4E
	b _08006BCA
_08006D4E:
	mov r1, r8
	ldr r3, [r1, #0x60]
	adds r2, r3, #1
	str r2, [r1, #0x60]
	cmp r2, #1
	beq _08006DB6
	cmp r2, #2
	beq _08006D60
	b _08006BCA
_08006D60:
	movs r0, #0x64
	str r0, [sp, #0x20]
	mov r0, sl
	ldr r3, [r0, #0x3c]
	asrs r1, r3, #1
	str r1, [sp, #0x1c]
	ldr r3, [r0, #0x44]
	movs r0, #3
	str r0, [sp, #0x24]
	asrs r1, r3, #1
	movs r0, #0
	movs r3, #0x40
	str r0, [sp, #0x28]
	str r1, [sp, #0x18]
	str r3, [sp, #0x14]
	mov r1, sp
	ldrh r1, [r1, #0x28]
	mov r3, fp
	strh r1, [r3]
	mov r3, sp
	ldrh r1, [r3, #0x28]
	strh r1, [r6]
	mov r1, r8
	str r0, [r1, #0x60]
	str r0, [r1, #0x54]
	movs r1, #0xcc
	lsls r3, r1, #1
	add r3, r8
	mov r0, sb
	str r0, [r3]
	ldr r0, [sp, #0x28]
	subs r3, #0xbc
	str r0, [r3]
	subs r3, #4
	str r2, [r3]
	mov r1, sl
	adds r1, #0xa0
	ldr r0, [r1]
	movs r2, #0x81
	rsbs r3, r2, #0
	ands r0, r3
	str r0, [r1]
	b _08006BCA
_08006DB6:
	movs r3, #0xc8
	str r3, [sp, #0x20]
	ldr r1, [r0, #0x3c]
	asrs r2, r1, #1
	str r2, [sp, #0x1c]
	ldr r1, [r0, #0x44]
	movs r2, #0x60
	asrs r0, r1, #1
	movs r1, #2
	str r0, [sp, #0x18]
	str r2, [sp, #0x14]
	str r1, [sp, #0x24]
	b _08006BCA
_08006DD0:
	mov r7, r8
	adds r7, #0x66
	ldrh r3, [r7]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x11
	ldr r1, _08006E54
	bl _call_via_r1
	lsls r4, r0, #0x10
	asrs r3, r4, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	movs r0, #0xfa
	asrs r1, r2, #0xc
	lsls r4, r0, #3
	muls r4, r1, r4
	mov r2, r8
	adds r2, #0x8c
	ldr r1, [r2]
	asrs r0, r4, #0xc
	adds r4, r1, r0
	mov r0, r8
	ldr r3, [r0, #0x58]
	ldr r1, [r0, #0x5c]
	lsls r3, r3, #1
	lsls r2, r1, #1
	adds r1, r1, r3
	str r1, [r0, #0x5c]
	adds r2, r2, r3
	mov r3, sl
	ldr r0, [r3, #0x28]
	adds r3, r0, r2
	cmp r3, r4
	bgt _08006E64
	ldr r2, _08006E44
	mov r1, fp
	subs r4, r4, r0
	strh r2, [r1]
	str r4, [sp, #0x28]
	mov r2, r8
	ldr r1, [r2, #0x5c]
	mov r3, sb
	rsbs r0, r1, #0
	str r0, [sp, #0x20]
	str r3, [r2, #0x5c]
	mov r0, sl
	ldr r2, [r0, #0x3c]
	asrs r1, r2, #1
	str r1, [sp, #0x1c]
	ldr r2, [r0, #0x44]
	movs r0, #1
	asrs r1, r2, #1
	movs r2, #0x7f
	str r1, [sp, #0x18]
	str r2, [sp, #0x14]
	str r0, [sp, #0x24]
	b _08006BCA
	.byte 0x00, 0x00
_08006E44:
	.4byte 0x00000001
_08006E48:
	.4byte gUnk_0884E08C
_08006E4C:
	.4byte gLocalPlayerIndex
_08006E50:
	.4byte cos_fx
_08006E54:
	.4byte sin_fx
_08006E58:
	.4byte 0x0000FFFF
_08006E5C:
	.4byte 0xFFFF8000
_08006E60:
	.4byte gGameSetup
_08006E64:
	movs r4, #0x32
	rsbs r6, r4, #0
	muls r1, r6, r1
	movs r5, #0x80
	lsls r3, r5, #7
	str r2, [sp, #0x28]
	cmp r1, r3
	ble _08006E76
	adds r1, r3, #0
_08006E76:
	ldrh r4, [r7]
	lsls r6, r1, #0x10
	lsrs r5, r6, #0x10
	adds r0, r4, #0
	ldr r6, _08006F38
	adds r1, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	subs r2, r4, r3
	strh r2, [r7]
	ldrh r4, [r7]
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	subs r4, r4, r3
	strh r4, [r7]
	mov r3, sl
	ldr r2, _08006F3C
	adds r3, #0xa0
	ldr r1, [r3, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _08006EB0
	b _08006BCA
_08006EB0:
	mov r0, sl
	ldr r5, [r0, #0x3c]
	ldr r2, [r0, #0x40]
	ldr r7, [r0, #0x44]
	asrs r4, r5, #2
	asrs r5, r2, #2
	bl sub_08002E78
	asrs r6, r7, #2
	adds r7, r0, #0
	cmp r7, #0
	beq _08006EF6
	mov r1, sl
	ldr r0, [r1, #0x24]
	str r0, [r7]
	ldr r2, [r1, #0x28]
	str r2, [r7, #4]
	ldr r0, [r1, #0x2c]
	str r0, [r7, #8]
	bl lfsr_next
	asrs r1, r0, #9
	str r1, [r7, #0xc]
	bl lfsr_next
	asrs r2, r0, #9
	str r2, [r7, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _08006F40
	movs r1, #0x28
	str r3, [r7, #0x14]
	str r1, [r7, #0x18]
	str r0, [r7, #0x1c]
_08006EF6:
	bl sub_08002E78
	adds r7, r0, #0
	cmp r7, #0
	bne _08006F02
	b _08006BCA
_08006F02:
	mov r2, sl
	ldr r1, [r2, #0x24]
	adds r0, r1, r4
	str r0, [r7]
	ldr r1, [r2, #0x28]
	adds r0, r1, r5
	str r0, [r7, #4]
	ldr r1, [r2, #0x2c]
	adds r0, r1, r6
	str r0, [r7, #8]
	bl lfsr_next
	asrs r2, r0, #9
	str r2, [r7, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	str r1, [r7, #0x10]
	bl lfsr_next
	ldr r1, _08006F40
	asrs r3, r0, #9
	movs r2, #0x28
	str r3, [r7, #0x14]
	str r2, [r7, #0x18]
	str r1, [r7, #0x1c]
	b _08006BCA
_08006F38:
	.4byte _03000814
_08006F3C:
	.4byte gLocalPlayerIndex
_08006F40:
	.4byte 0x00000513

	.global sub_08006F44
	.thumb_func
	.type sub_08006F44, %function
sub_08006F44: @ 08006F44
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov sl, r1
	mov fp, r0
	mov r0, sl
	ldr r5, [r0, #0x58]
	ldr r4, [r1, #0x5c]
	lsls r3, r5, #1
	adds r1, r4, r3
	lsls r2, r4, #1
	str r1, [r0, #0x5c]
	adds r5, r2, r3
	mov r2, fp
	mov r3, sl
	ldr r4, [r2, #0x28]
	adds r3, #0x8c
	ldr r0, [r3]
	adds r2, r4, r5
	sub sp, #0x28
	cmp r2, r0
	ble _08006F78
	b _08007150
_08006F78:
	subs r3, r0, r4
	rsbs r0, r1, #0
	str r0, [sp, #0x24]
	movs r7, #0x64
	mov r0, sl
	str r3, [sp, #0x18]
	str r7, [r0, #0x5c]
	mov r1, fp
	ldr r6, [r1, #0x3c]
	asrs r4, r6, #1
	str r4, [sp, #0x20]
	ldr r2, [r1, #0x44]
	asrs r1, r2, #1
	str r1, [sp, #0x1c]
	ldr r1, [r0, #0x68]
	cmp r1, #0
	bne _08006F9C
	b _0800714C
_08006F9C:
	movs r5, #0x40
_08006F9E:
	movs r2, #0xa2
	lsls r4, r2, #1
	add r4, sl
	ldr r2, [r4]
	cmp r2, #2
	bne _08006FAC
	b _0800713C
_08006FAC:
	ldr r0, _08007028
	lsls r6, r2, #2
	ldr r7, [r0, r6]
	movs r4, #0xa0
_08006FB4:
	mov r6, fp
	ldr r3, _0800702C
	adds r6, #0xa0
	ldr r0, [r6, #4]
	ldr r1, [r3]
	cmp r0, r1
	bne _08006FC4
	b _08007118
_08006FC4:
	movs r3, #0x80
	mov r2, fp
	lsls r3, r3, #9
	ldr r0, [r2, #0x24]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x2c]
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	adds r3, r4, #0
	str r5, [sp]
	bl gamesfx_play_at
_08006FE6:
	ldr r3, _0800702C
	ldr r4, [r6, #4]
	ldr r1, [r3]
	cmp r4, r1
	beq _08007080
_08006FF0:
	mov r1, sl
	adds r1, #0x6c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08007072
	ldr r2, _08007024
	strh r2, [r1]
_08007000:
	mov r0, sl
	ldr r2, [r0, #0x68]
	adds r2, #1
	str r2, [r0, #0x68]
_08007008:
	mov r4, sl
	adds r4, #0x6e
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0
	ldrsh r3, [r1, r0]
	lsls r1, r3, #1
	adds r0, r2, r1
	mov r1, sl
	ldr r3, [r1, #0x68]
	cmp r3, #2
	beq _08007046
	b _08007030
	.byte 0x00, 0x00
_08007024:
	.4byte 0x00000CCC
_08007028:
	.4byte gUnk_0884E08C
_0800702C:
	.4byte gLocalPlayerIndex
_08007030:
	strh r0, [r4]
	ldr r0, [sp, #0x18]
	add sp, #0x28
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08007046:
	cmp r2, #0
	ble _08007068
_0800704A:
	cmp r0, #0
	bgt _08007030
_0800704E:
	mov r2, sl
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [r2, #0x68]
	ldr r1, [sp, #0x18]
	mov r3, fp
	str r1, [r2, #0x54]
	adds r3, #0xa0
	ldr r2, [r3]
	ldr r1, _0800707C
	ands r2, r1
	str r2, [r3]
	b _08007030
_08007068:
	cmp r0, #0
	bge _0800704E
	cmp r2, #0
	bge _0800704A
	b _08007030
_08007072:
	ldr r4, _08007078
	strh r4, [r1]
	b _08007000
_08007078:
	.4byte 0xFFFFF334
_0800707C:
	.4byte 0xFFFFFEFF
_08007080:
	movs r1, #0xa2
	lsls r2, r1, #3
	movs r0, #8
	orrs r2, r7
	rsbs r3, r0, #0
	str r2, [sp, #0x14]
	mov sb, r3
_0800708E:
	bl sub_08002E78
	adds r7, r0, #0
	cmp r7, #0
	beq _0800710C
	mov r1, sb
	lsls r2, r1, #0x1d
	asrs r6, r2, #0x10
	ldr r5, _08007158
	adds r0, r6, #0
	bl _call_via_r5
	adds r3, r0, #0
	lsls r0, r3, #0x10
	ldr r2, _0800715C
	asrs r5, r0, #0x10
	adds r0, r6, #0
	bl _call_via_r2
	movs r4, #0xfa
	lsls r2, r4, #1
	muls r5, r2, r5
	lsls r1, r0, #0x10
	asrs r6, r1, #0x10
	adds r4, r6, #0
	muls r4, r2, r4
	asrs r2, r5, #0xc
	mov r8, r2
	bl lfsr_next
	ldr r1, _08007160
	ldr r3, _08007164
	ands r1, r0
	adds r2, r1, r3
	ldr r1, [sp, #0x24]
	lsrs r0, r2, #1
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r0, r2, #0x10
	adds r2, r1, r0
	mov r0, fp
	ldr r3, [r0, #0x24]
	asrs r6, r4, #0xc
	adds r1, r3, r6
	str r1, [r7]
	movs r1, #0
	str r1, [r7, #4]
	ldr r1, [r0, #0x2c]
	add r1, r8
	str r1, [r7, #8]
	ldr r1, [sp, #0x20]
	asrs r3, r4, #0x10
	adds r0, r1, r3
	str r2, [r7, #0x10]
	str r0, [r7, #0xc]
	ldr r1, [sp, #0x1c]
	asrs r3, r5, #0x10
	adds r5, r1, r3
	movs r2, #0x28
	str r5, [r7, #0x14]
	str r2, [r7, #0x18]
	ldr r4, [sp, #0x14]
	str r4, [r7, #0x1c]
_0800710C:
	movs r4, #1
	add sb, r4
	mov r1, sb
	cmp r1, #7
	ble _0800708E
	b _08006FF0
_08007118:
	ldr r1, _08007168
	adds r1, #0x8c
	ldr r2, [r1]
	cmp r2, #7
	beq _08007124
	b _08006FC4
_08007124:
	movs r0, #0
	movs r2, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r4, #0x80
	str r2, [sp]
	adds r1, r5, #0
	lsls r2, r4, #9
	movs r3, #1
	bl gamesfx_play
	b _08006FE6
_0800713C:
	cmp r1, #0
	beq _08007148
	movs r4, #0xea
_08007142:
	ldr r1, _0800716C
	ldr r7, [r1, #0xc]
	b _08006FB4
_08007148:
	movs r4, #0xe9
	b _08007142
_0800714C:
	movs r5, #0x7f
	b _08006F9E
_08007150:
	mov r1, sl
	str r5, [sp, #0x18]
	adds r1, #0x6c
	b _08007008
_08007158:
	.4byte cos_fx
_0800715C:
	.4byte sin_fx
_08007160:
	.4byte 0x0000FFFF
_08007164:
	.4byte 0xFFFF8000
_08007168:
	.4byte gGameSetup
_0800716C:
	.4byte gUnk_0884E08C

	.global sub_08007170
	.thumb_func
	.type sub_08007170, %function
sub_08007170: @ 08007170
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r1, #0
	mov sl, r0
	ldr r0, [r7, #0x24]
	movs r1, #0
	mov sb, r2
	mov fp, r1
	cmp r0, #0
	beq _080071A2
	cmp r0, #2
	bne _08007192
	b _08007376
_08007192:
	cmp r0, #2
	ble _08007198
	b _080072D0
_08007198:
	cmp r0, #1
	beq _080071E8
_0800719C:
	ldr r1, [r7, #0x4c]
	cmp r1, #3
	beq _080071D4
_080071A2:
	mov r3, fp
	cmp r3, #0
	beq _080071C4
	movs r0, #0x25
	bl obj_new
	mov r3, sl
	adds r3, #0xa0
	ldr r2, [r3, #4]
	adds r1, r0, #0
	adds r1, #0xa0
	str r2, [r1, #8]
	ldr r2, [r7, #0x40]
	str r2, [r1, #0xc]
	movs r1, #0
	bl obj_initialise
_080071C4:
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080071D4:
	mov r1, sb
	ldrh r0, [r1]
	ldr r3, _080071E4
	mov r2, sb
	orrs r0, r3
	strh r0, [r2]
	b _080071A2
	.byte 0x00, 0x00
_080071E4:
	.4byte 0x00000001
_080071E8:
	mov r6, sl
	adds r6, #0xa0
	ldr r2, [r6, #0x2c]
	ldr r1, _080073E8
	subs r3, r1, r2
	asrs r3, r3, #3
	adds r2, r2, r3
	subs r3, r1, r2
	asrs r1, r3, #3
	adds r3, r2, r1
	str r3, [r6, #0x2c]
	ldr r1, [r7, #0x4c]
	cmp r1, #2
	beq _08007290
_08007204:
	ldr r1, [r7, #0x28]
	subs r1, #2
	str r1, [r7, #0x28]
	cmp r1, #0
	ble _0800726E
_0800720E:
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _0800719C
	ldr r1, _080073EC
	adds r5, r7, #0
	adds r5, #0xb8
	ldrh r0, [r5]
	mov r8, r1
	movs r1, #0
	bl _call_via_r8
	ldr r4, [r5]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	subs r2, r4, r3
	str r2, [r5]
	ldrh r4, [r6, #0xe]
	ldrh r1, [r7, #0x38]
	adds r0, r4, #0
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	subs r2, r4, r3
	strh r2, [r6, #0xe]
	movs r1, #0
	ldrh r0, [r5]
	bl _call_via_r8
	ldr r4, [r5]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	subs r2, r4, r3
	str r2, [r5]
	ldrh r4, [r6, #0xe]
	ldrh r1, [r7, #0x38]
	adds r0, r4, #0
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	movs r0, #0
	mov r2, sb
	subs r4, r4, r3
	strh r4, [r6, #0xe]
	str r0, [r2, #4]
	str r0, [r2, #8]
	b _0800719C
_0800726E:
	movs r0, #0
	movs r2, #2
	str r0, [r7, #0x2c]
	str r2, [r7, #0x24]
	mov r3, sl
	adds r3, #0xfa
	ldrh r4, [r3]
	movs r1, #0xe0
	subs r4, #6
	lsls r0, r4, #0x10
	lsls r4, r1, #0xc
	cmp r0, r4
	bhi _0800720E
	movs r1, #3
	str r1, [r7, #0x4c]
	str r2, [r7, #0x40]
	b _0800720E
_08007290:
	mov r3, sb
	ldrh r2, [r3]
	adds r1, r0, #0
	ands r1, r2
	cmp r1, #0
	beq _080072C4
	ldr r1, [r7, #0x50]
_0800729E:
	cmp r1, #1
	bne _08007204
	mov r2, sl
	adds r2, #0xfa
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldrh r0, [r2]
	cmp r3, #0xfe
	bgt _080072B4
	adds r3, r0, #2
	strh r3, [r2]
_080072B4:
	mov r2, sb
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08007204
	movs r2, #2
	str r2, [r7, #0x50]
	b _08007204
_080072C4:
	ldr r1, [r7, #0x50]
	cmp r1, #0
	bne _0800729E
	movs r1, #1
	str r0, [r7, #0x50]
	b _0800729E
_080072D0:
	cmp r0, #3
	beq _08007330
	cmp r0, #4
	beq _080072DA
	b _0800719C
_080072DA:
	ldr r0, [r7, #0x30]
	ldr r4, _080073F0
	adds r2, r0, r4
	str r2, [r7, #0x30]
	cmp r2, #0
	ble _0800732A
_080072E6:
	mov r1, sl
	adds r1, #0xa0
	ldr r0, [r1, #0x2c]
	rsbs r3, r0, #0
	asrs r2, r3, #4
	adds r3, r0, r2
	rsbs r0, r3, #0
	asrs r2, r0, #4
	adds r0, r3, r2
	str r0, [r1, #0x2c]
	cmp r0, #0
	ble _08007324
_080072FE:
	ldr r2, [r7, #0x30]
	cmp r2, #0
	beq _08007306
	b _0800719C
_08007306:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _0800730E
	b _0800719C
_0800730E:
	mov r3, fp
	str r3, [r7, #0x24]
	str r3, [r7, #0x2c]
	movs r0, #0x41
	ldr r4, [r1]
	rsbs r3, r0, #0
	ands r4, r3
	str r4, [r1]
	mov r4, fp
	str r4, [r7, #0x4c]
	b _0800719C
_08007324:
	mov r2, fp
	str r2, [r1, #0x2c]
	b _080072FE
_0800732A:
	mov r1, fp
	str r1, [r7, #0x30]
	b _080072E6
_08007330:
	mov r0, sl
	adds r0, #0xa0
	ldr r2, [r0, #0x2c]
	movs r3, #0x80
	lsls r1, r3, #9
	subs r3, r1, r2
	asrs r3, r3, #4
	adds r2, r2, r3
	subs r3, r1, r2
	asrs r1, r3, #4
	adds r3, r2, r1
	str r3, [r0, #0x2c]
	ldr r1, [r7, #0x28]
	subs r1, #2
	str r1, [r7, #0x28]
	cmp r1, #0
	ble _08007368
_08007352:
	ldr r0, [r7, #0x2c]
	subs r0, #2
	str r0, [r7, #0x2c]
	cmp r0, #0
	ble _0800735E
	b _0800719C
_0800735E:
	movs r2, #1
	movs r1, #4
	mov fp, r2
	str r1, [r7, #0x2c]
	b _0800719C
_08007368:
	movs r2, #4
	str r2, [r7, #0x24]
	ldr r3, _080073F4
	ldr r1, [r0]
	ands r1, r3
	str r1, [r0]
	b _08007352
_08007376:
	mov r1, sl
	adds r1, #0xa0
	ldr r4, [r1, #0x2c]
	movs r3, #0x80
	lsls r0, r3, #9
	subs r2, r0, r4
	asrs r3, r2, #4
	adds r2, r4, r3
	subs r4, r0, r2
	asrs r3, r4, #4
	adds r4, r2, r3
	str r4, [r1, #0x2c]
	ldr r1, [r7, #0x30]
	ldr r4, _080073F8
	adds r2, r1, r4
	str r2, [r7, #0x30]
	cmp r2, r0
	blt _080073CC
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x40]
	movs r1, #3
	str r1, [r7, #0x24]
	cmp r0, #1
	beq _080073E2
	mov r0, sl
	bl sub_0800A804
	ldr r1, _080073FC
	muls r1, r0, r1
	ldr r3, [r7, #0x48]
	muls r1, r3, r1
	asrs r0, r1, #0x10
	ldr r1, [r7, #0x44]
	adds r2, r1, r0
	ldr r0, [r7, #0x4c]
	subs r0, #1
	str r2, [r7, #0x28]
	cmp r0, #1
	bhi _080073CC
	ldr r0, _08007400
	muls r0, r2, r0
	asrs r2, r0, #0x10
_080073CA:
	str r2, [r7, #0x28]
_080073CC:
	ldr r1, [r7, #0x2c]
	subs r1, #2
	str r1, [r7, #0x2c]
	cmp r1, #0
	ble _080073D8
	b _0800719C
_080073D8:
	movs r1, #1
	movs r2, #4
	mov fp, r1
	str r2, [r7, #0x2c]
	b _0800719C
_080073E2:
	ldr r2, [r7, #0x44]
	b _080073CA
	.byte 0x00, 0x00
_080073E8:
	.4byte 0xFFFF7000
_080073EC:
	.4byte _03000814
_080073F0:
	.4byte 0xFFFFF000
_080073F4:
	.4byte 0xFEFFFFFF
_080073F8:
	.4byte 0x00003332
_080073FC:
	.4byte 0x00002492
_08007400:
	.4byte 0x0000CCCC

	.global sub_08007404
	.thumb_func
	.type sub_08007404, %function
sub_08007404: @ 08007404
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r0, #0xa0
	adds r5, r1, #0
	movs r4, #0x84
	ldr r1, [r0]
	movs r3, #0x80
	lsls r0, r4, #6
	ands r1, r0
	lsls r0, r3, #6
	cmp r1, r0
	beq _08007476
	movs r4, #0x82
	lsls r1, r4, #1
	adds r4, r5, r1
	ldr r0, [r4]
	asrs r3, r0, #3
	subs r1, r0, r3
	movs r0, #0x88
	str r1, [r4]
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r1, r3, r2
	str r1, [r0]
	movs r1, #0x8e
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r1]
	ldr r3, [r4]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r4]
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r0]
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r0, r3, r2
	str r0, [r1]
_08007466:
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08007476:
	movs r2, #0x92
	lsls r0, r2, #1
	adds r2, r5, r0
	ldr r1, [r2]
	cmp r1, #0
	bne _08007484
	b _0800779E
_08007484:
	movs r3, #0x82
	lsls r0, r3, #1
	adds r1, r5, r0
	ldr r3, [r1]
	subs r0, #4
	adds r4, r5, r0
	mov sb, r3
	ldr r1, [r4]
	mov r2, sb
	subs r4, r1, r2
	cmp r4, #0
	bgt _0800749E
	b _0800778E
_0800749E:
	movs r3, #0x40
_080074A0:
	mov ip, r3
_080074A2:
	movs r1, #0x82
	lsls r0, r1, #1
	adds r1, r5, r0
	adds r0, #4
	adds r3, r5, r0
	ldr r0, [r3]
	ldr r3, [r1]
	lsls r2, r0, #1
	adds r3, r3, r2
	mov r2, ip
	lsls r2, r2, #1
	mov sl, r2
	add r3, sl
	mov r8, r3
	cmp r0, #0
	bgt _080074C4
	b _08007780
_080074C4:
	cmp r4, #0
	bgt _080074CA
	b _08007780
_080074CA:
	movs r4, #0x84
	lsls r7, r4, #1
	adds r6, r5, r7
	ldr r7, [r6]
	adds r3, r7, #0
	muls r3, r7, r3
	mov r2, ip
	rsbs r2, r2, #0
	rsbs r6, r3, #0
	mov fp, r2
	lsls r4, r2, #1
	adds r0, r6, #0
	cmp r6, #0
	bge _080074E8
	b _0800777C
_080074E8:
	adds r1, r4, #0
	cmp r4, #0
	bge _080074F0
	b _08007778
_080074F0:
	ldr r2, _080077D4
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	cmp r2, #0
	bge _08007500
	b _08007774
_08007500:
	movs r1, #0x80
	lsls r3, r1, #1
	adds r4, r5, r3
	ldr r1, [r4]
	mov r2, r8
	subs r4, r1, r2
	cmp r7, #0
	ble _08007516
	cmp r0, r4
	blt _08007516
	b _0800776C
_08007516:
	cmp r7, #0
	bge _0800751C
	b _08007766
_0800751C:
	movs r4, #0x84
	lsls r0, r4, #1
	adds r1, r5, r0
	ldr r2, [r1]
	movs r4, #0x82
	lsls r0, r4, #1
	add r2, sl
	str r2, [r1]
	movs r3, #0x80
	adds r1, r5, r0
	mov r2, r8
	lsls r4, r3, #1
	str r2, [r1]
	adds r0, r5, r4
	ldr r3, [r0]
	cmp sb, r3
	bgt _08007546
	cmp r3, r8
	ble _0800754A
	cmp sb, r3
	blt _0800755A
_08007546:
	cmp r3, r8
	blt _0800755A
_0800754A:
	movs r0, #0x80
	lsls r2, r0, #1
	adds r4, r5, r2
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	str r3, [r4]
_0800755A:
	movs r3, #0x88
	lsls r0, r3, #1
	adds r1, r5, r0
	ldr r3, [r1]
	subs r0, #4
	adds r4, r5, r0
	mov sb, r3
	ldr r1, [r4]
	mov r2, sb
	subs r4, r1, r2
	cmp r4, #0
	bgt _08007574
	b _08007756
_08007574:
	movs r3, #0x40
_08007576:
	mov ip, r3
_08007578:
	movs r1, #0x88
	lsls r0, r1, #1
	adds r1, r5, r0
	adds r0, #4
	adds r3, r5, r0
	ldr r0, [r3]
	ldr r3, [r1]
	lsls r2, r0, #1
	adds r3, r3, r2
	mov r2, ip
	lsls r2, r2, #1
	mov sl, r2
	add r3, sl
	mov r8, r3
	cmp r0, #0
	bgt _0800759A
	b _08007748
_0800759A:
	cmp r4, #0
	bgt _080075A0
	b _08007748
_080075A0:
	movs r4, #0x8a
	lsls r7, r4, #1
	adds r6, r5, r7
	ldr r7, [r6]
	adds r3, r7, #0
	muls r3, r7, r3
	mov r2, ip
	rsbs r2, r2, #0
	rsbs r6, r3, #0
	mov fp, r2
	lsls r4, r2, #1
	adds r0, r6, #0
	cmp r6, #0
	bge _080075BE
	b _08007744
_080075BE:
	adds r1, r4, #0
	cmp r4, #0
	bge _080075C6
	b _08007740
_080075C6:
	ldr r2, _080077D4
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	cmp r2, #0
	bge _080075D6
	b _0800773C
_080075D6:
	movs r1, #0x86
	lsls r3, r1, #1
	adds r4, r5, r3
	ldr r1, [r4]
	mov r2, r8
	subs r4, r1, r2
	cmp r7, #0
	ble _080075EC
	cmp r0, r4
	blt _080075EC
	b _08007734
_080075EC:
	cmp r7, #0
	bge _080075F2
	b _0800772E
_080075F2:
	movs r4, #0x8a
	lsls r0, r4, #1
	adds r1, r5, r0
	ldr r2, [r1]
	movs r4, #0x88
	lsls r0, r4, #1
	add r2, sl
	str r2, [r1]
	movs r3, #0x86
	adds r1, r5, r0
	mov r2, r8
	lsls r4, r3, #1
	str r2, [r1]
	adds r0, r5, r4
	ldr r3, [r0]
	cmp sb, r3
	bgt _0800761C
	cmp r3, r8
	ble _08007620
	cmp sb, r3
	blt _08007630
_0800761C:
	cmp r3, r8
	blt _08007630
_08007620:
	movs r0, #0x86
	lsls r2, r0, #1
	adds r4, r5, r2
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	str r3, [r4]
_08007630:
	movs r3, #0x8e
	lsls r0, r3, #1
	adds r1, r5, r0
	ldr r3, [r1]
	subs r0, #4
	adds r4, r5, r0
	mov sb, r3
	ldr r1, [r4]
	mov r2, sb
	subs r4, r1, r2
	cmp r4, #0
	ble _0800771E
	movs r3, #0x40
_0800764A:
	mov ip, r3
_0800764C:
	movs r1, #0x8e
	lsls r0, r1, #1
	adds r1, r5, r0
	adds r0, #4
	adds r3, r5, r0
	ldr r0, [r3]
	ldr r3, [r1]
	lsls r2, r0, #1
	adds r3, r3, r2
	mov r2, ip
	lsls r2, r2, #1
	mov sl, r2
	add r3, sl
	mov r8, r3
	cmp r0, #0
	ble _08007714
	cmp r4, #0
	ble _08007714
_08007670:
	movs r4, #0x90
	lsls r7, r4, #1
	adds r6, r5, r7
	ldr r7, [r6]
	adds r3, r7, #0
	muls r3, r7, r3
	mov r2, ip
	rsbs r2, r2, #0
	rsbs r6, r3, #0
	mov fp, r2
	lsls r4, r2, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _08007710
_0800768C:
	adds r1, r4, #0
	cmp r4, #0
	blt _0800770C
_08007692:
	ldr r2, _080077D4
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	cmp r2, #0
	blt _08007708
_080076A0:
	movs r1, #0x8c
	lsls r3, r1, #1
	adds r4, r5, r3
	ldr r1, [r4]
	mov r2, r8
	subs r4, r1, r2
	cmp r7, #0
	ble _080076B4
	cmp r0, r4
	bge _08007700
_080076B4:
	cmp r7, #0
	blt _080076FC
_080076B8:
	movs r0, #0x90
	lsls r1, r0, #1
	adds r0, r5, r1
	ldr r2, [r0]
	movs r1, #0x8e
	lsls r3, r1, #1
	add r2, sl
	str r2, [r0]
	movs r1, #0x8c
	adds r0, r5, r3
	mov r2, r8
	str r2, [r0]
	lsls r3, r1, #1
	adds r0, r5, r3
	ldr r3, [r0]
	cmp sb, r3
	bgt _080076E4
	cmp r3, r8
	ble _080076EA
	cmp sb, r3
	bge _080076E4
	b _08007466
_080076E4:
	cmp r3, r8
	bge _080076EA
	b _08007466
_080076EA:
	movs r4, #0x8c
	lsls r1, r4, #1
	adds r4, r5, r1
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r3, r2, #0x13
	str r3, [r4]
	b _08007466
_080076FC:
	cmp r0, r4
	bgt _080076B8
_08007700:
	mov r3, fp
	lsls r3, r3, #1
	mov sl, r3
	b _080076B8
_08007708:
	rsbs r0, r0, #0
	b _080076A0
_0800770C:
	rsbs r1, r4, #0
	b _08007692
_08007710:
	adds r0, r3, #0
	b _0800768C
_08007714:
	cmp r0, #0
	bge _080076B8
	cmp r4, #0
	bge _080076B8
	b _08007670
_0800771E:
	cmp r4, #0
	blt _08007726
	movs r3, #0
	b _0800764A
_08007726:
	movs r0, #0x40
	rsbs r2, r0, #0
	mov ip, r2
	b _0800764C
_0800772E:
	cmp r0, r4
	ble _08007734
	b _080075F2
_08007734:
	mov r3, fp
	lsls r3, r3, #1
	mov sl, r3
	b _080075F2
_0800773C:
	rsbs r0, r0, #0
	b _080075D6
_08007740:
	rsbs r1, r4, #0
	b _080075C6
_08007744:
	adds r0, r3, #0
	b _080075BE
_08007748:
	cmp r0, #0
	blt _0800774E
	b _080075F2
_0800774E:
	cmp r4, #0
	blt _08007754
	b _080075F2
_08007754:
	b _080075A0
_08007756:
	cmp r4, #0
	blt _0800775E
	movs r3, #0
	b _08007576
_0800775E:
	movs r0, #0x40
	rsbs r2, r0, #0
	mov ip, r2
	b _08007578
_08007766:
	cmp r0, r4
	ble _0800776C
	b _0800751C
_0800776C:
	mov r3, fp
	lsls r3, r3, #1
	mov sl, r3
	b _0800751C
_08007774:
	rsbs r0, r0, #0
	b _08007500
_08007778:
	rsbs r1, r4, #0
	b _080074F0
_0800777C:
	adds r0, r3, #0
	b _080074E8
_08007780:
	cmp r0, #0
	blt _08007786
	b _0800751C
_08007786:
	cmp r4, #0
	blt _0800778C
	b _0800751C
_0800778C:
	b _080074CA
_0800778E:
	cmp r4, #0
	blt _08007796
	movs r3, #0
	b _080074A0
_08007796:
	movs r0, #0x40
	rsbs r2, r0, #0
	mov ip, r2
	b _080074A2
_0800779E:
	movs r0, #1
	movs r4, #0x80
	lsls r1, r4, #1
	str r0, [r2]
	adds r4, r5, r1
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	movs r0, #0x86
	lsls r1, r0, #1
	str r2, [r4]
	adds r4, r5, r1
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	str r2, [r4]
	movs r4, #0x8c
	lsls r0, r4, #1
	adds r4, r5, r0
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x13
	str r3, [r4]
	b _08007484
_080077D4:
	.4byte udiv

	.global sub_080077D8
	.thumb_func
	.type sub_080077D8, %function
sub_080077D8: @ 080077D8
	push {r4, r5, r6, r7, lr}
	adds r0, #0xa0
	adds r5, r1, #0
	movs r3, #0x80
	ldr r1, [r0]
	lsls r0, r3, #0xe
	ands r1, r0
	cmp r1, #0
	beq _080078A2
	movs r2, #0xa0
	lsls r4, r2, #1
	adds r2, r5, r4
	ldr r1, [r2]
	cmp r1, #0
	beq _0800786C
_080077F6:
	movs r4, #0x96
	movs r1, #0x94
	lsls r3, r1, #1
	lsls r7, r4, #1
	adds r4, r5, r7
	adds r7, r3, r5
	ldr r1, [r4]
	ldr r0, [r7]
	subs r6, r1, r0
	asrs r2, r6, #3
	mov ip, r7
	movs r0, #0x9a
	subs r7, r1, r2
	movs r6, #0x98
	str r7, [r4]
	lsls r3, r0, #1
	lsls r1, r6, #1
	adds r0, r5, r3
	adds r6, r5, r1
	ldr r2, [r6]
	ldr r1, [r0]
	subs r7, r1, r2
	asrs r2, r7, #3
	subs r7, r1, r2
	str r7, [r0]
	movs r1, #0x9e
	movs r7, #0x9c
	lsls r2, r7, #1
	lsls r3, r1, #1
	adds r1, r5, r3
	adds r5, r5, r2
	ldr r3, [r5]
	ldr r2, [r1]
	subs r7, r2, r3
	asrs r3, r7, #3
	subs r7, r2, r3
	str r7, [r1]
	mov r7, ip
	ldr r2, [r4]
	ldr r3, [r7]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r4]
	ldr r2, [r0]
	ldr r3, [r6]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r0]
	ldr r2, [r1]
	ldr r3, [r5]
	subs r0, r2, r3
	asrs r3, r0, #3
	subs r0, r2, r3
_08007864:
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800786C:
	movs r0, #1
	str r0, [r2]
	movs r2, #0x94
	lsls r1, r2, #1
	adds r7, r5, r1
	bl multi_lfsr_next
	lsls r6, r0, #0x10
	asrs r4, r6, #0x12
	movs r0, #0x98
	lsls r3, r0, #1
	str r4, [r7]
	adds r6, r5, r3
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r1, r2, #0x12
	movs r4, #0x9c
	str r1, [r6]
	lsls r0, r4, #1
	adds r6, r5, r0
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r7, r3, #0x12
	str r7, [r6]
	b _080077F6
_080078A2:
	movs r4, #0x96
	lsls r2, r4, #1
	adds r4, r5, r2
	ldr r7, [r4]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r0, #0x9a
	str r1, [r4]
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r7, [r0]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r2, #0x9e
	str r1, [r0]
	lsls r7, r2, #1
	adds r1, r5, r7
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r1]
	ldr r3, [r4]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r4]
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r0]
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r0, r3, r2
	b _08007864

	.global sub_080078E4
	.thumb_func
	.type sub_080078E4, %function
sub_080078E4: @ 080078E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r1, #0
	ldr r2, [r4, #0x54]
	cmp r2, #0
	bne _080078F4
	b _080079DE
_080078F4:
	cmp r2, #5
	beq _08007902
_080078F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08007902:
	ldr r5, [r4, #0x58]
	ldr r1, [r4, #0x5c]
	ldr r0, [r4, #0x7c]
	adds r6, r5, r1
	ldr r3, [r4, #0x24]
	lsls r5, r6, #1
	adds r2, r0, #0
	adds r6, r0, r5
	cmp r3, #4
	beq _080079C8
	movs r3, #0x80
	adds r2, r3, r4
	mov r8, r2
_0800791C:
	mov r7, r8
	ldr r2, [r7]
	cmp r2, #0
	beq _08007974
	ldr r2, [r4, #0x7c]
_08007926:
	cmp r1, #0
	ble _080079C2
	asrs r3, r2, #0x10
	movs r2, #0x80
	lsls r3, r3, #0x10
	lsls r2, r2, #9
	adds r3, r3, r2
_08007934:
	cmp r5, #0
	ble _08007940
	cmp r0, r3
	bgt _08007940
	cmp r3, r6
	ble _080079B4
_08007940:
	cmp r5, #0
	blt _080079AC
_08007944:
	subs r3, r3, r6
	cmp r3, #0
	beq _08007974
	adds r2, r1, #0
	muls r2, r1, r2
	rsbs r7, r2, #0
	lsls r5, r3, #1
	adds r0, r7, #0
	cmp r7, #0
	blt _080079A8
_08007958:
	adds r1, r5, #0
	cmp r5, #0
	blt _080079A4
_0800795E:
	ldr r2, _08007A0C
	bl _call_via_r2
	adds r1, r7, #0
	eors r1, r5
	cmp r1, #0
	blt _080079A0
_0800796C:
	str r0, [r4, #0x58]
	cmp r0, #0
	beq _08007992
_08007972:
	ldr r1, [r4, #0x5c]
_08007974:
	ldr r2, [r4, #0x58]
	lsls r0, r2, #1
	ldr r2, _08007A10
	adds r3, r1, r0
	str r3, [r4, #0x5c]
	cmp r3, r2
	bge _08007988
_08007982:
	str r2, [r4, #0x5c]
_08007984:
	str r6, [r4, #0x7c]
	b _080078F8
_08007988:
	movs r1, #0x80
	lsls r2, r1, #4
	cmp r3, r2
	ble _08007984
	b _08007982
_08007992:
	movs r6, #0
	mov r7, r8
	str r6, [r4, #0x5c]
	str r6, [r4, #0x54]
	str r6, [r4, #0x58]
	str r6, [r7]
	b _08007972
_080079A0:
	rsbs r0, r0, #0
	b _0800796C
_080079A4:
	rsbs r1, r5, #0
	b _0800795E
_080079A8:
	adds r0, r2, #0
	b _08007958
_080079AC:
	cmp r0, r3
	blt _08007944
	cmp r3, r6
	blt _08007944
_080079B4:
	movs r6, #0
	mov r3, r8
	str r6, [r4, #0x5c]
	str r6, [r4, #0x54]
	str r6, [r4, #0x58]
	str r6, [r3]
	b _08007972
_080079C2:
	asrs r3, r2, #0x10
	lsls r3, r3, #0x10
	b _08007934
_080079C8:
	movs r3, #0x80
	adds r3, r3, r4
	mov r8, r3
	ldr r3, [r3]
	cmp r3, #0
	bne _08007926
	movs r2, #1
	mov r7, r8
	str r2, [r7]
	ldr r1, [r4, #0x5c]
	b _0800791C
_080079DE:
	ldr r1, [r4, #0x78]
	cmp r1, #0
	bne _080079E6
	b _080078F4
_080079E6:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	beq _080079EE
	b _080078F4
_080079EE:
	cmp r1, #2
	beq _08007A06
	movs r2, #0x80
	lsls r1, r2, #1
	str r1, [r4, #0x58]
_080079F8:
	movs r0, #0
	movs r1, #5
	str r1, [r4, #0x54]
	str r0, [r4, #0x5c]
	str r0, [r4, #0x78]
	movs r2, #5
	b _080078F4
_08007A06:
	ldr r0, _08007A14
	str r0, [r4, #0x58]
	b _080079F8
_08007A0C:
	.4byte udiv
_08007A10:
	.4byte 0xFFFFF800
_08007A14:
	.4byte 0xFFFFFF00

	.global sub_08007A18
	.thumb_func
	.type sub_08007A18, %function
sub_08007A18: @ 08007A18
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r6, #0xd0
	sub sp, #0x2c
	movs r4, #0xec
	str r0, [sp, #0x28]
	adds r7, r1, #0
	lsls r5, r6, #1
	lsls r3, r4, #1
	adds r0, r7, r3
	adds r1, r7, r5
	ldr r6, [r1]
	ldr r1, [r0]
	lsls r2, r1, #2
	mov fp, r2
	movs r2, #0xd4
	lsls r0, r2, #1
	add r0, fp
	ldr r3, [r7, r0]
	adds r2, r1, #1
	mov r8, r3
	adds r3, r2, #0
	cmp r2, #0
	bge _08007A54
	.2byte 0xF000, 0xFCAB @ bl #0x80083aa
_08007A54:
	asrs r0, r3, #2
	lsls r5, r0, #2
	subs r4, r2, r5
	lsls r3, r4, #2
	movs r0, #0xd4
	mov sb, r3
	lsls r2, r0, #1
	add r2, sb
	ldr r5, [r7, r2]
	adds r2, r1, #2
	adds r3, r2, #0
	cmp r2, #0
	bge _08007A72
	.2byte 0xF000, 0xFC99 @ bl #0x80083a4
_08007A72:
	asrs r0, r3, #2
	lsls r4, r0, #2
	subs r0, r2, r4
	lsls r3, r0, #2
	movs r4, #0xd4
	mov sl, r3
	lsls r2, r4, #1
	add r2, sl
	ldr r3, [r7, r2]
	mov ip, r3
	adds r3, r1, #3
	adds r0, r3, #0
	cmp r3, #0
	bge _08007A92
	.2byte 0xF000, 0xFC86 @ bl #0x800839e
_08007A92:
	asrs r2, r0, #2
	lsls r4, r2, #2
	subs r1, r3, r4
	movs r2, #0xd4
	lsls r0, r1, #2
	lsls r3, r2, #1
	adds r4, r0, r3
	ldr r3, [r7, r4]
	lsls r4, r5, #1
	adds r1, r4, r5
	mov r2, r8
	mov lr, r3
	subs r3, r1, r2
	mov r1, ip
	lsls r2, r1, #1
	add r2, ip
	subs r1, r3, r2
	add r1, lr
	muls r1, r6, r1
	asrs r2, r1, #0xc
	muls r2, r6, r2
	asrs r1, r2, #0xc
	adds r2, r6, #0
	muls r2, r1, r2
	mov r3, r8
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r5, #2
	adds r3, r5, r3
	mov r5, ip
	subs r2, r2, r3
	lsls r3, r5, #2
	adds r2, r2, r3
	mov r3, lr
	subs r2, r2, r3
	adds r3, r6, #0
	muls r3, r2, r3
	asrs r3, r3, #0xc
	muls r3, r6, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r2, r8
	subs r3, r5, r2
	muls r3, r6, r3
	asrs r2, r3, #0xc
	adds r5, r1, r2
	adds r2, r5, r4
	asrs r5, r2, #1
	movs r3, #0xdc
	str r5, [sp, #0x24]
	lsls r2, r3, #1
	mov r5, fp
	adds r1, r5, r2
	ldr r3, [r7, r1]
	mov r1, sb
	adds r4, r1, r2
	mov r1, sl
	ldr r5, [r7, r4]
	adds r4, r1, r2
	mov r8, r3
	ldr r3, [r7, r4]
	adds r4, r0, r2
	ldr r2, [r7, r4]
	lsls r4, r5, #1
	mov ip, r3
	adds r1, r4, r5
	mov lr, r2
	mov r2, r8
	subs r3, r1, r2
	mov r1, ip
	lsls r2, r1, #1
	add r2, ip
	subs r1, r3, r2
	add r1, lr
	muls r1, r6, r1
	asrs r2, r1, #0xc
	muls r2, r6, r2
	asrs r1, r2, #0xc
	adds r2, r6, #0
	muls r2, r1, r2
	mov r3, r8
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r5, #2
	adds r3, r5, r3
	mov r5, ip
	subs r2, r2, r3
	lsls r3, r5, #2
	adds r2, r2, r3
	mov r3, lr
	subs r2, r2, r3
	adds r3, r6, #0
	muls r3, r2, r3
	asrs r3, r3, #0xc
	muls r3, r6, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r2, r8
	subs r3, r5, r2
	muls r3, r6, r3
	asrs r2, r3, #0xc
	adds r5, r1, r2
	adds r2, r5, r4
	movs r5, #0xe4
	asrs r4, r2, #1
	lsls r2, r5, #1
	mov r5, fp
	adds r1, r5, r2
	ldr r3, [r7, r1]
	mov r1, sb
	mov fp, r3
	adds r3, r1, r2
	mov r1, sl
	ldr r5, [r7, r3]
	adds r3, r1, r2
	ldr r3, [r7, r3]
	mov sb, r3
	adds r3, r0, r2
	ldr r0, [r7, r3]
	mov r8, r0
	lsls r0, r5, #1
	adds r1, r0, r5
	mov r2, fp
	subs r3, r1, r2
	mov r1, sb
	lsls r2, r1, #1
	add r2, sb
	subs r1, r3, r2
	add r1, r8
	muls r1, r6, r1
	asrs r2, r1, #0xc
	muls r2, r6, r2
	asrs r1, r2, #0xc
	adds r2, r6, #0
	muls r2, r1, r2
	mov r3, fp
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r5, #2
	adds r3, r5, r3
	mov r5, sb
	subs r2, r2, r3
	lsls r3, r5, #2
	adds r2, r2, r3
	mov r3, r8
	subs r2, r2, r3
	adds r3, r6, #0
	muls r3, r2, r3
	asrs r3, r3, #0xc
	muls r3, r6, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r2, fp
	subs r3, r5, r2
	muls r3, r6, r3
	asrs r5, r3, #0xc
	adds r2, r1, r5
	adds r6, r2, r0
	asrs r5, r6, #1
	movs r2, #0xa6
	str r5, [sp, #0x20]
	lsls r3, r2, #1
	adds r6, r7, r3
	ldr r1, [r6]
	cmp r1, #2
	bne _08007BE0
	b _08007CFE
_08007BE0:
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x24]
	ldr r0, [r5, #0x24]
	ldr r3, [sp, #0x20]
	subs r1, r6, r0
	ldr r6, [r5, #0x2c]
	subs r5, r3, r6
	asrs r2, r1, #8
	asrs r1, r5, #8
	adds r6, r1, #0
	muls r6, r1, r6
	adds r3, r2, #0
	muls r3, r2, r3
	asrs r1, r6, #8
	asrs r5, r3, #8
	adds r6, r5, r1
	cmp r6, #0x32
	bgt _08007C06
	b _0800839A
_08007C06:
	movs r2, #0x20
	rsbs r5, r2, #0
_08007C0A:
	ldr r3, [sp, #0x24]
	movs r6, #0xb6
	lsls r1, r6, #1
	subs r2, r3, r0
	adds r6, r7, r1
	movs r1, #0xb8
	str r2, [r6]
	lsls r0, r1, #1
	adds r1, r7, r0
	ldr r0, [sp, #0x28]
	ldr r2, [r0, #0x28]
	subs r6, r4, r2
	str r6, [r1]
	movs r3, #0xba
	lsls r4, r3, #1
	ldr r3, [r0, #0x2c]
	ldr r0, [sp, #0x20]
	adds r6, r7, r4
	subs r2, r0, r3
	str r2, [r6]
	adds r4, #0x28
	adds r0, r7, r4
	ldr r6, [r0]
	lsls r3, r5, #1
	lsls r2, r6, #1
	adds r4, r6, r3
	adds r1, r2, r3
	str r4, [r0]
	cmp r4, #0
	bge _08007C48
	b _08008394
_08007C48:
	cmp r1, #0
	ble _08007C58
	movs r5, #0xd0
	lsls r6, r5, #1
	adds r4, r7, r6
	ldr r2, [r4]
	adds r0, r2, r1
	str r0, [r4]
_08007C58:
	movs r6, #0xd0
	lsls r3, r6, #1
	adds r0, r7, r3
	movs r2, #0x80
	ldr r4, [r0]
	lsls r1, r2, #5
	cmp r4, r1
	blt _08007CFE
	movs r3, #0xd2
	lsls r1, r3, #1
	adds r2, r7, r1
	ldr r4, [r2]
	movs r6, #0xc
	muls r4, r6, r4
	ldr r5, _08007F18
	ldr r0, [r5]
	movs r2, #0xa6
	adds r6, r0, r4
	lsls r0, r2, #1
	adds r2, r7, r0
	ldr r4, [r2]
	cmp r4, #0
	bne _08007C88
	b _08008302
_08007C88:
	movs r0, #6
	ldrsh r2, [r6, r0]
	movs r3, #1
	rsbs r6, r3, #0
	cmp r2, r6
	bne _08007C96
	b _080082EA
_08007C96:
	movs r0, #0xd2
	lsls r3, r0, #1
	adds r4, r7, r3
	movs r5, #0xc
	str r2, [r4]
	muls r2, r5, r2
	ldr r6, _08007F18
	ldr r1, [r6]
	movs r0, #0xec
	adds r6, r1, r2
	lsls r1, r0, #1
	adds r0, r7, r1
	ldr r3, [r0]
	movs r4, #0xd4
	lsls r5, r3, #2
	lsls r3, r4, #1
	adds r4, r5, r3
	movs r5, #0
	ldrsh r3, [r6, r5]
	lsls r5, r3, #8
	str r5, [r7, r4]
	ldr r4, [r0]
	subs r1, #0x20
	lsls r3, r4, #2
	adds r4, r3, r1
	movs r5, #2
	ldrsh r3, [r6, r5]
	lsls r5, r3, #8
	str r5, [r7, r4]
	ldr r4, [r0]
	adds r1, #0x10
	lsls r3, r4, #2
	adds r4, r3, r1
	movs r5, #4
	ldrsh r1, [r6, r5]
	lsls r5, r1, #8
	str r5, [r7, r4]
	ldr r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	cmp r2, #0
	bge _08007CEC
	b _080082E6
_08007CEC:
	asrs r6, r3, #2
	movs r5, #0xd0
	lsls r1, r6, #2
	lsls r6, r5, #1
	subs r4, r2, r1
	adds r1, r7, r6
	movs r2, #0
	str r4, [r0]
	str r2, [r1]
_08007CFE:
	movs r2, #0xba
	movs r6, #0xb6
	lsls r3, r2, #1
	lsls r0, r6, #1
	adds r4, r7, r3
	adds r1, r7, r0
	ldr r0, [r1]
	ldr r5, _08007F1C
	ldr r1, [r4]
	bl _call_via_r5
	movs r6, #0xae
	adds r2, r0, #0
	lsls r0, r6, #1
	adds r6, r7, r0
	ldrh r5, [r6]
	ldr r0, _08007F20
	lsls r4, r2, #0x10
	lsrs r1, r4, #0x10
	mov fp, r0
	adds r0, r5, #0
	bl _call_via_r11
	lsls r2, r0, #0x10
	asrs r3, r2, #0x12
	subs r1, r5, r3
	strh r1, [r6]
	movs r0, #0
	movs r6, #0xa6
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	lsls r4, r6, #1
	adds r5, r7, r4
	ldr r3, [r5]
	cmp r3, #0
	bne _08007D48
	b _08008200
_08007D48:
	cmp r3, #1
	bne _08007D4E
	b _0800806C
_08007D4E:
	cmp r3, #2
	bne _08007D54
	b _08007F2C
_08007D54:
	ldr r3, [sp, #0x28]
	adds r3, #0xa0
	str r3, [sp]
_08007D5A:
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bgt _08007D64
	b _08007F0A
_08007D64:
	movs r1, #5
	rsbs r4, r1, #0
_08007D68:
	adds r3, r7, #0
	adds r3, #0xe0
	str r3, [sp, #0x10]
	ldr r1, [sp, #0x18]
	ldr r5, [r3]
	lsls r2, r1, #1
	lsls r6, r5, #1
	adds r1, r6, r2
	movs r5, #0xfa
	str r1, [sp, #0x14]
	str r2, [sp, #0xc]
	lsls r3, r5, #1
	adds r2, r7, r3
	ldr r1, [sp, #0x14]
	ldr r6, [r2]
	adds r5, r6, #0
	muls r5, r1, r5
	ldr r2, [r7, #0x30]
	asrs r6, r5, #0x10
	lsls r5, r2, #4
	subs r3, r5, r2
	lsls r5, r3, #7
	asrs r2, r5, #0x10
	adds r5, r6, r2
	str r5, [sp, #0x14]
	ldr r5, [r7, #0x70]
	adds r6, r4, r0
	mov lr, r5
	add lr, r6
	mov r0, lr
	movs r2, #0xb0
	lsls r5, r2, #1
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r7, r5
	str r0, [sp, #8]
	movs r2, #0
	ldrsh r6, [r0, r2]
	ldr r4, _08007F24
	adds r0, r6, #0
	bl _call_via_r4
	mov sl, r0
	mov r5, sl
	lsls r1, r5, #0x10
	adds r0, r6, #0
	ldr r6, _08007F28
	asrs r5, r1, #0x10
	bl _call_via_r6
	mov fp, r5
	movs r5, #0xb2
	lsls r4, r5, #1
	adds r3, r0, #0
	adds r0, r7, r4
	str r0, [sp, #4]
	lsls r2, r3, #0x10
	movs r3, #0
	ldrsh r4, [r0, r3]
	ldr r1, _08007F24
	adds r0, r4, #0
	asrs r6, r2, #0x10
	bl _call_via_r1
	mov ip, r0
	mov r0, ip
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	mov sl, r0
	ldr r5, _08007F28
	adds r0, r4, #0
	bl _call_via_r5
	movs r1, #0xae
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r4, r7, r3
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r4, _08007F24
	mov r8, r0
	bl _call_via_r4
	adds r2, r0, #0
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r1, _08007F28
	mov r0, r8
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	adds r2, r0, #0
	muls r2, r6, r2
	asrs r1, r2, #0xc
	adds r2, r5, #0
	muls r2, r1, r2
	mov r3, fp
	muls r3, r4, r3
	asrs r1, r2, #0xc
	asrs r3, r3, #0xc
	adds r2, r1, r3
	mov r1, sb
	muls r1, r2, r1
	adds r3, r1, #0
	mov r1, fp
	muls r1, r0, r1
	asrs r2, r3, #0xc
	asrs r3, r1, #0xc
	mov ip, r3
	adds r3, r6, #0
	muls r3, r4, r3
	asrs r1, r3, #0xc
	mov r3, sl
	muls r3, r0, r3
	ldr r0, [sp, #0x14]
	asrs r3, r3, #0xc
	muls r3, r0, r3
	asrs r3, r3, #0xc
	adds r2, r2, r3
	ldr r3, [sp, #0x28]
	str r2, [r3, #0x3c]
	mov r2, sl
	muls r2, r6, r2
	asrs r3, r2, #0xc
	mov r2, sb
	muls r2, r3, r2
	adds r3, r0, #0
	muls r3, r5, r3
	asrs r2, r2, #0xc
	asrs r0, r3, #0xc
	subs r2, r2, r0
	ldr r0, [sp, #0x28]
	str r2, [r0, #0x40]
	adds r2, r5, #0
	muls r2, r1, r2
	mov r1, ip
	asrs r5, r2, #0xc
	subs r2, r5, r1
	mov r1, sb
	muls r1, r2, r1
	mov r5, sl
	muls r5, r4, r5
	asrs r2, r1, #0xc
	asrs r1, r5, #0xc
	ldr r5, [sp, #0x14]
	muls r1, r5, r1
	asrs r5, r1, #0xc
	adds r1, r2, r5
	movs r5, #0xb4
	str r1, [r0, #0x44]
	lsls r3, r5, #1
	adds r2, r7, r3
	ldr r1, [r2]
	ldr r5, [sp]
	strh r1, [r5, #0xe]
	ldr r2, [sp, #4]
	adds r1, r7, #0
	ldr r0, [r2]
	adds r1, #0xb8
	str r0, [r1]
	ldr r3, [sp, #8]
	ldr r5, [r3]
	subs r1, #0x18
	str r5, [r1]
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r5, [r2]
	ldr r0, [sp, #0x18]
	adds r3, r5, r1
	cmp r0, #0
	ble _08007EFA
	ldr r0, [sp, #0x1c]
	cmp r3, r0
	ble _08007ECC
	adds r3, r0, #0
_08007ECC:
	ldr r2, [sp, #0x10]
	str r3, [r2]
	ldr r1, [sp, #0x14]
	ldr r5, [sp, #0x28]
	asrs r2, r1, #1
	movs r3, #0xfe
	str r2, [r5, #0x50]
	lsls r5, r3, #1
	adds r1, r7, r5
	ldr r0, [r1]
	muls r0, r2, r0
	ldr r2, [sp]
	asrs r1, r0, #0xc
	str r1, [r2, #0x48]
	add sp, #0x2c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08007EFA:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bge _08007ECC
	ldr r2, [sp, #0x1c]
	cmp r3, r2
	bge _08007ECC
	adds r3, r2, #0
	b _08007ECC
_08007F0A:
	cmp r0, #0
	blt _08007F12
	movs r4, #0
	b _08007D68
_08007F12:
	movs r4, #5
	b _08007D68
	.byte 0x00, 0x00
_08007F18:
	.4byte 0x02022E5C
_08007F1C:
	.4byte atan2_fx
_08007F20:
	.4byte _03000814
_08007F24:
	.4byte cos_fx
_08007F28:
	.4byte sin_fx
_08007F2C:
	movs r0, #4
	bl sub_0801E300
	ldr r4, [sp, #0x28]
	ldr r6, _08007F6C
	movs r2, #0xb4
	adds r4, #0xfe
	strh r6, [r4]
	lsls r0, r2, #1
	adds r1, r0, r7
	movs r5, #0xae
	ldr r4, [r1]
	ldrh r0, [r1]
	mov r8, r1
	lsls r1, r5, #1
	adds r6, r7, r1
	ldrh r1, [r6]
	bl _call_via_r11
	lsls r3, r0, #0x10
	asrs r5, r3, #0x12
	subs r2, r4, r5
	mov r3, r8
	movs r6, #0xb2
	str r2, [r3]
	lsls r1, r6, #1
	adds r6, r7, r1
	subs r0, r2, r4
	mov sb, r0
	movs r3, #0xb8
	ldrh r0, [r6]
	b _08007F70
_08007F6C:
	.4byte 0x00000004
_08007F70:
	lsls r1, r3, #1
	adds r4, r7, r1
	mov sl, r0
	movs r0, #0xb6
	ldr r2, [r4]
	lsls r3, r0, #1
	adds r0, r7, r3
	rsbs r4, r2, #0
	ldr r2, [r0]
	adds r1, #4
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r7, r1
	ldr r1, [r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	ldr r1, _080081E0
	bl _call_via_r1
	ldr r2, _080081E4
	adds r1, r0, #0
	adds r0, r4, #0
	bl _call_via_r2
	adds r3, r0, #0
	lsls r0, r3, #0x10
	lsrs r1, r0, #0x10
	mov r0, sl
	bl _call_via_r11
	ldr r5, [r6]
	lsls r4, r0, #0x10
	asrs r2, r4, #0x13
	subs r1, r5, r2
	str r1, [r6]
	movs r6, #0xb0
	lsls r3, r6, #1
	mov r2, sb
	adds r6, r7, r3
	lsls r4, r2, #0x14
	ldrh r0, [r6]
	lsrs r1, r4, #0x10
	bl _call_via_r11
	ldr r5, [r6]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r3, r5, r1
	str r3, [r6]
	mov r0, r8
	movs r3, #0
	ldrsh r6, [r0, r3]
	ldr r4, _080081E8
	adds r0, r6, #0
	bl _call_via_r4
	adds r2, r0, #0
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	ldr r6, _080081EC
	bl _call_via_r6
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x24]
	ldr r2, [r1, #0x30]
	ldr r6, [sp, #0x28]
	lsls r5, r0, #0x10
	asrs r0, r5, #0x10
	ldr r1, [r6, #0x38]
	subs r5, r3, r2
	ldr r3, [sp, #0x20]
	subs r6, r3, r1
	adds r3, r4, #0
	muls r3, r5, r3
	adds r5, r0, #0
	muls r5, r6, r5
	ldr r1, [sp, #0x28]
	adds r6, r3, r5
	ldr r2, [r1, #0x24]
	ldr r3, [sp, #0x24]
	ldr r1, [sp, #0x28]
	subs r5, r3, r2
	ldr r3, [r1, #0x2c]
	ldr r2, [sp, #0x20]
	subs r1, r2, r3
	adds r3, r4, #0
	muls r3, r5, r3
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r3, r4
	cmp r6, #0
	ble _0800805C
_0800802E:
	cmp r0, #0
	ble _0800803A
	ldr r6, [sp, #0x28]
	adds r6, #0xa0
	str r6, [sp]
	b _08007D5A
_0800803A:
	ldr r2, [sp, #0x28]
	adds r2, #0xa0
	str r2, [sp]
	ldr r0, _080081F0
	ldr r5, [r2]
	ldr r1, [sp]
	ands r5, r0
	movs r2, #0xbc
	str r5, [r1]
	lsls r3, r2, #1
	movs r6, #0xb4
	adds r0, r7, r3
	lsls r4, r6, #1
	ldr r1, [r0]
	adds r5, r7, r4
	str r1, [r5]
	b _08007D5A
_0800805C:
	cmp r0, #0
	bge _0800803A
	cmp r6, #0
	bge _0800802E
	ldr r4, [sp, #0x28]
	adds r4, #0xa0
	str r4, [sp]
	b _08007D5A
_0800806C:
	movs r0, #4
	bl sub_0801E300
	ldr r1, [sp, #0x28]
	adds r1, #0xa0
	str r1, [sp]
	ldr r2, [r1, #0x34]
	adds r6, r1, #0
	cmp r2, #0
	ble _08008098
	movs r0, #0xa8
	lsls r3, r0, #1
	adds r4, r7, r3
	ldr r5, [r4]
	cmp r5, #0x3b
	bgt _08008098
	adds r5, r2, #0
	subs r5, #0x64
	str r5, [r1, #0x34]
	cmp r5, #0
	bge _08008098
	b _080081D4
_08008098:
	movs r0, #0xa8
	lsls r3, r0, #1
	adds r4, r7, r3
	ldr r1, [r4]
	cmp r1, #0
	bgt _080080A6
	b _080081CA
_080080A6:
	movs r3, #0xbc
	lsls r4, r3, #1
	adds r1, r7, r4
	ldrh r0, [r1]
	ldr r2, _080081F4
	ldrh r1, [r6, #0x38]
	bl _call_via_r2
	lsls r5, r0, #0x10
	asrs r4, r5, #0x10
	cmp r4, #0
	bge _080080C0
	b _080081C2
_080080C0:
	movs r2, #0xaa
	movs r3, #0xa8
	lsls r0, r2, #1
	lsls r1, r3, #1
	adds r5, r0, r7
	adds r2, r7, r1
	mov r8, r5
	adds r0, r4, #0
	ldr r5, [r2]
	cmp r4, #0
	blt _080081BE
_080080D6:
	adds r1, r5, #0
	cmp r5, #0
	blt _080081BA
_080080DC:
	ldr r2, _080081F8
	bl _call_via_r2
	adds r1, r4, #0
	eors r1, r5
	cmp r1, #0
	blt _080081B6
_080080EA:
	mov r1, r8
	movs r5, #0xaa
	str r0, [r1]
	lsls r4, r5, #1
	adds r1, r7, r4
	ldr r0, [r1]
	ldrh r5, [r6, #0x38]
	lsls r3, r0, #1
	adds r4, r5, r3
	strh r4, [r6, #0x38]
_080080FE:
	movs r4, #0xae
	lsls r3, r4, #1
	adds r2, r7, r3
	movs r1, #0xb4
	lsls r0, r1, #1
	ldrh r1, [r2]
	ldr r2, _080081F4
	adds r5, r7, r0
	ldrh r0, [r5]
	mov fp, r2
	bl _call_via_r11
	ldr r6, [r5]
	lsls r4, r0, #0x10
	asrs r2, r4, #0x12
	subs r1, r6, r2
	subs r0, r1, r6
	movs r6, #0xb2
	str r1, [r5]
	lsls r5, r6, #1
	adds r6, r7, r5
	mov r8, r0
	movs r3, #0xb8
	ldrh r0, [r6]
	lsls r1, r3, #1
	adds r4, r7, r1
	mov sb, r0
	movs r0, #0xb6
	ldr r2, [r4]
	lsls r3, r0, #1
	adds r0, r7, r3
	rsbs r4, r2, #0
	ldr r2, [r0]
	adds r1, #4
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r7, r1
	ldr r1, [r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	ldr r1, _080081E0
	bl _call_via_r1
	ldr r2, _080081E4
	adds r1, r0, #0
	adds r0, r4, #0
	bl _call_via_r2
	adds r3, r0, #0
	lsls r4, r3, #0x10
	lsrs r1, r4, #0x10
	mov r0, sb
	bl _call_via_r11
	ldr r5, [r6]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x13
	subs r3, r5, r2
	str r3, [r6]
	movs r6, #0xb0
	mov r2, r8
	lsls r0, r6, #1
	lsls r4, r2, #0x14
	adds r6, r7, r0
	ldrh r0, [r6]
	lsrs r1, r4, #0x10
	bl _call_via_r11
	ldr r5, [r6]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x13
	subs r3, r5, r2
	movs r4, #0xa8
	str r3, [r6]
	lsls r1, r4, #1
	adds r2, r7, r1
	ldr r0, [r2]
	subs r0, #2
	str r0, [r2]
	cmp r0, #0
	ble _080081B0
_080081A4:
	ldr r3, _080081FC
	movs r2, #0x80
	lsls r5, r2, #9
	str r3, [sp, #0x18]
	str r5, [sp, #0x1c]
	b _08007D5A
_080081B0:
	movs r6, #0
	str r6, [r2]
	b _080081A4
_080081B6:
	rsbs r0, r0, #0
	b _080080EA
_080081BA:
	rsbs r1, r5, #0
	b _080080DC
_080081BE:
	rsbs r0, r4, #0
	b _080080D6
_080081C2:
	movs r5, #0x80
	lsls r0, r5, #9
	adds r4, r4, r0
	b _080080C0
_080081CA:
	ldr r6, [sp, #0x28]
	ldr r2, _080081DC
	adds r6, #0xfe
	strh r2, [r6]
	b _080080FE
_080081D4:
	ldr r2, [sp, #0x1c]
	str r2, [r1, #0x34]
	b _08008098
	.byte 0x00, 0x00
_080081DC:
	.4byte 0x00000004
_080081E0:
	.4byte isqrt
_080081E4:
	.4byte atan2_fx
_080081E8:
	.4byte sin_fx
_080081EC:
	.4byte cos_fx
_080081F0:
	.4byte 0xFF7FFFFF
_080081F4:
	.4byte _03000814
_080081F8:
	.4byte udiv
_080081FC:
	.4byte 0xFFFFFD71
_08008200:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x28]
	ldr r6, _08008238
	adds r4, #0xa0
	adds r0, #0xfe
	str r4, [sp]
	strh r6, [r0]
	movs r0, #4
	bl sub_0801E300
	ldr r2, [sp]
	movs r3, #0x80
	ldrh r5, [r2, #0x38]
	lsls r1, r3, #2
	adds r4, r5, r1
	adds r1, r2, #0
	ldr r3, [r1, #0x34]
	ldr r2, _0800823C
	strh r4, [r1, #0x38]
	cmp r3, r2
	bgt _08008240
	adds r3, #0x64
	adds r2, #1
	str r3, [r1, #0x34]
	cmp r3, r2
	ble _08008240
	str r2, [r1, #0x34]
	b _08008240
_08008238:
	.4byte 0x0000007A
_0800823C:
	.4byte 0x00000BB7
_08008240:
	movs r4, #0xae
	lsls r3, r4, #1
	adds r2, r7, r3
	movs r1, #0xb4
	lsls r0, r1, #1
	ldrh r1, [r2]
	ldr r2, _080083B0
	adds r5, r7, r0
	ldrh r0, [r5]
	mov fp, r2
	bl _call_via_r11
	ldr r6, [r5]
	lsls r4, r0, #0x10
	asrs r2, r4, #0x12
	subs r1, r6, r2
	subs r0, r1, r6
	movs r6, #0xb2
	str r1, [r5]
	lsls r5, r6, #1
	adds r6, r7, r5
	mov r8, r0
	movs r3, #0xb8
	ldrh r0, [r6]
	lsls r1, r3, #1
	adds r4, r7, r1
	mov sb, r0
	movs r0, #0xb6
	ldr r2, [r4]
	lsls r3, r0, #1
	adds r0, r7, r3
	rsbs r4, r2, #0
	ldr r2, [r0]
	adds r1, #4
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r7, r1
	ldr r1, [r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	ldr r1, _080083B4
	bl _call_via_r1
	adds r1, r0, #0
	adds r0, r4, #0
	ldr r4, _080083B8
	bl _call_via_r4
	adds r2, r0, #0
	lsls r3, r2, #0x10
	lsrs r1, r3, #0x10
	mov r0, sb
	bl _call_via_r11
	ldr r5, [r6]
	lsls r1, r0, #0x10
	asrs r4, r1, #0x13
	subs r2, r5, r4
	str r2, [r6]
	movs r6, #0xb0
	mov r2, r8
	lsls r0, r6, #1
	lsls r3, r2, #0x14
	adds r6, r7, r0
	ldrh r0, [r6]
	lsrs r1, r3, #0x10
	bl _call_via_r11
	ldr r5, [r6]
	lsls r1, r0, #0x10
	asrs r4, r1, #0x13
	subs r2, r5, r4
	movs r0, #0xbe
	str r2, [r6]
	lsls r3, r0, #1
	adds r1, r7, r3
	ldr r5, [r1]
	ldr r2, _080083BC
	str r5, [sp, #0x1c]
	str r2, [sp, #0x18]
	b _08007D5A
_080082E6:
	adds r3, r1, #4
	b _08007CEC
_080082EA:
	movs r2, #0xd0
	movs r4, #0xa6
	lsls r3, r2, #1
	movs r0, #0x80
	lsls r5, r4, #1
	lsls r1, r0, #5
	adds r6, r7, r3
	adds r0, r7, r5
	movs r2, #2
	str r1, [r6]
	str r2, [r0]
	b _08007CFE
_08008302:
	movs r0, #0xa
	ldrsh r4, [r6, r0]
	cmp r4, #0
	bne _0800830C
	b _08007C88
_0800830C:
	movs r4, #1
	subs r1, #0x54
	str r4, [r2]
	adds r0, r7, r1
	movs r4, #0x78
	str r4, [r0]
	ldr r1, [sp, #0x28]
	adds r1, #0xfe
	strh r4, [r1]
	movs r0, #0x78
	bl sub_0801E300
	ldr r2, _080083B8
	mov fp, r2
	movs r2, #0xbc
	lsls r0, r2, #1
	mov sl, r5
	movs r3, #0xc
	adds r5, r0, r7
	movs r1, #0
	adds r4, r6, #0
	mov r8, r3
	mov sb, r5
_0800833A:
	movs r0, #6
	ldrsh r2, [r4, r0]
	movs r0, #1
	rsbs r5, r0, #0
	cmp r2, r5
	beq _0800835A
	mov r4, r8
	muls r4, r2, r4
	mov r5, sl
	ldr r2, [r5]
	adds r0, r4, #0
	adds r4, r2, r0
_08008352:
	cmp r1, #0
	beq _08008358
	b _08007C88
_08008358:
	b _0800833A
_0800835A:
	movs r5, #8
	ldrsh r2, [r4, r5]
	mov r1, r8
	muls r1, r2, r1
	mov r2, sl
	ldr r0, [r2]
	adds r5, r1, #0
	adds r1, r0, r5
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r0, #0
	ldrsh r5, [r1, r0]
	subs r0, r3, r5
	lsls r5, r0, #8
	movs r2, #4
	ldrsh r3, [r4, r2]
	movs r0, #4
	ldrsh r2, [r1, r0]
	subs r0, r3, r2
	lsls r1, r0, #8
	adds r0, r5, #0
	bl _call_via_r11
	lsls r2, r0, #0x10
	mov r1, sb
	asrs r3, r2, #0x10
	str r3, [r1]
	movs r1, #1
	b _08008352
_08008394:
	movs r5, #0
	str r5, [r0]
	b _08007C48
_0800839A:
	movs r5, #0x20
	b _08007C0A
	.byte 0x88, 0x1D, 0xFF, 0xF7, 0x77, 0xFB, 0x4B, 0x1D, 0xFF, 0xF7, 0x64, 0xFB, 0x0B, 0x1D, 0xFF, 0xF7
	.byte 0x52, 0xFB
_080083B0:
	.4byte _03000814
_080083B4:
	.4byte isqrt
_080083B8:
	.4byte atan2_fx
_080083BC:
	.4byte 0x0000028F

	.global planePlayer
	.thumb_func
	.type planePlayer, %function
planePlayer: @ 080083C0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r1, #0
	ldr r3, [r7, #0x54]
	sub sp, #0x20
	mov sl, r0
	adds r6, r2, #0
	cmp r3, #0
	bne _080083DC
	b _080089F0
_080083DC:
	cmp r3, #5
	bne _080083E2
	b _080089F0
_080083E2:
	cmp r3, #3
	bne _080083E8
	b _080089E6
_080083E8:
	cmp r3, #2
	bne _080083EE
	b _080089D8
_080083EE:
	cmp r3, #4
	bne _080083F4
	b _080089CE
_080083F4:
	movs r0, #0
_080083F6:
	mov r2, sl
	str r0, [r2, #0x40]
_080083FA:
	mov r3, sl
	adds r3, #0xa0
	str r3, [sp, #0x10]
	movs r4, #0x80
	ldr r0, [r3]
	lsls r1, r4, #9
	ands r0, r1
	cmp r0, #0
	bne _0800840E
	b _080089C2
_0800840E:
	movs r3, #0xfe
	lsls r1, r3, #1
	adds r4, r7, r1
	mov r1, sl
	ldr r0, [r1, #0x50]
	ldr r5, [r4]
	muls r5, r0, r5
	adds r3, r7, #0
	asrs r2, r5, #0xc
	adds r3, #0xe0
	str r2, [sp, #0x18]
	str r3, [sp, #4]
_08008426:
	ldr r5, [sp, #0x18]
	asrs r1, r5, #0xb
	mov fp, r1
	ldr r1, [sp, #0x10]
	movs r4, #0x80
	ldr r2, [r1]
	lsls r0, r4, #5
	ands r0, r2
	cmp r0, #0
	bne _0800843C
	b _080087B4
_0800843C:
	cmp r5, #0
	bge _08008442
	b _08008770
_08008442:
	movs r4, #0xfc
	lsls r3, r4, #1
	adds r0, r7, r3
	ldr r2, [r0]
	cmp r5, r2
	ble _08008450
	b _08008712
_08008450:
	ldrh r1, [r6]
	movs r5, #1
	ands r5, r1
	cmp r5, #0
	bne _0800845C
	b _080088FA
_0800845C:
	ldr r3, _08008774
	ldr r0, _08008778
	mov sb, r3
_08008462:
	mov r8, r0
_08008464:
	ldr r5, _0800877C
	adds r2, r5, #0
	ands r2, r1
	cmp r2, r5
	bne _08008470
	b _080086C8
_08008470:
	ldr r4, [sp, #0x18]
	cmp r4, r8
	bne _08008478
	b _080086C2
_08008478:
	mov r0, sl
	ldr r3, [r0, #0x48]
	cmp r3, #0
	bgt _08008482
	b _080086B2
_08008482:
	movs r2, #5
	rsbs r0, r2, #0
	str r0, [sp, #0x14]
_08008488:
	movs r4, #0xa2
	lsls r3, r4, #1
	adds r1, r7, r3
	mov r0, sl
	bl sub_080033C4
	adds r5, r0, #0
	cmp r5, #0
	beq _080084AA
	ldr r2, [sp, #0x10]
	movs r3, #0xc6
	ldr r0, [r2]
	lsls r1, r3, #6
	ands r0, r1
	cmp r0, #0
	bne _080084AA
	b _08008600
_080084AA:
	ldr r0, [sp, #0x10]
	movs r5, #0x80
	ldr r2, [r0]
	lsls r6, r5, #2
	ands r6, r2
	cmp r6, #0
	beq _080084CC
	ldr r1, _08008780
	ands r2, r1
	str r2, [r0]
	movs r2, #0xcc
	lsls r3, r2, #1
	adds r2, r7, r3
	ldr r0, [r2]
	cmp r0, #0xb
	bne _080084CC
	b _08008696
_080084CC:
	adds r1, r7, #0
	adds r1, #0xb8
	ldr r6, [r1]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x10]
	lsls r4, r6, #1
	adds r6, r0, r4
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	ldr r5, _08008784
	adds r0, r4, #0
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	str r2, [sp, #0x1c]
	ldr r3, _08008788
	adds r0, r4, #0
	bl _call_via_r3
	lsls r5, r0, #0x10
	asrs r0, r5, #0x10
	mov fp, r0
	mov r0, sb
	lsls r2, r0, #1
	movs r3, #0xfa
	str r2, [sp, #0xc]
	lsls r1, r6, #1
	lsls r6, r3, #1
	adds r0, r7, r6
	adds r5, r1, r2
	ldr r1, [r0]
	adds r2, r1, #0
	muls r2, r5, r2
	ldr r3, [r7, #0x30]
	lsls r6, r3, #4
	subs r0, r6, r3
	lsls r6, r0, #7
	asrs r5, r2, #0x10
	asrs r2, r6, #0x10
	adds r6, r5, r2
	ldr r5, [sp, #0x14]
	mov r3, sl
	lsls r1, r5, #1
	ldr r0, [r3, #0x48]
	str r1, [sp, #8]
	ldr r5, [r7, #0x70]
	lsls r3, r0, #1
	ldr r0, [r7, #0x54]
	adds r2, r3, r1
	lsls r1, r5, #1
	adds r5, r2, r1
	cmp r0, #2
	beq _080085CE
_08008538:
	mov r3, fp
	muls r3, r5, r3
	ldr r0, [sp, #0x1c]
	asrs r2, r3, #0xc
	adds r3, r0, #0
	muls r3, r6, r3
	asrs r3, r3, #0xc
	adds r1, r2, r3
	rsbs r2, r5, #0
	adds r5, r0, #0
	muls r5, r2, r5
	asrs r0, r5, #0xc
	mov r5, fp
	muls r5, r6, r5
	asrs r3, r5, #0xc
	adds r5, r0, r3
	mov r3, sl
	str r5, [r3, #0x44]
	str r1, [r3, #0x3c]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0xc]
	mov r2, sb
	adds r5, r1, r3
	cmp r2, #0
	ble _080085C2
	cmp r5, r8
	ble _08008570
_0800856E:
	mov r5, r8
_08008570:
	ldr r2, [sp, #4]
	mov r1, sl
	str r5, [r2]
	asrs r5, r6, #1
	str r5, [r1, #0x50]
	movs r1, #0xfe
	lsls r3, r1, #1
	adds r2, r7, r3
	ldr r1, [r2]
	muls r1, r5, r1
	ldr r5, [sp, #0x10]
	asrs r2, r1, #0xc
	str r2, [r5, #0x48]
	mov r2, sl
	ldr r0, [r2, #0x48]
	ldr r1, [sp, #8]
	adds r5, r0, r1
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _080085BC
	cmp r5, #0
	ble _0800859E
_0800859C:
	movs r5, #0
_0800859E:
	mov r2, sl
	str r5, [r2, #0x48]
	ldr r3, [sp, #0x10]
	ldrh r1, [r3, #0xe]
	adds r2, r3, #0
	strh r1, [r2, #0x38]
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080085BC:
	cmp r5, #0
	bge _0800859E
	b _0800859C
_080085C2:
	mov r3, sb
	cmp r3, #0
	bge _08008570
	cmp r5, r8
	bge _08008570
	b _0800856E
_080085CE:
	ldr r0, [sp, #0x10]
	ldr r4, [r0, #0x14]
	lsls r2, r4, #0xf
	asrs r0, r2, #0x10
	ldr r3, _08008784
	bl _call_via_r3
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r6, r2
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	asrs r1, r2, #0xd
	adds r0, r4, #0
	ldr r2, _08008788
	adds r6, r6, r1
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r6, r2
	asrs r6, r2, #0xc
	b _08008538
_08008600:
	ldr r0, _0800878C
	adds r0, #0x8c
	ldr r4, [r0]
	cmp r4, #7
	beq _0800860C
	b _080084AA
_0800860C:
	mov r0, sl
	bl sub_0800A804
	ldr r2, _08008790
	mov r8, r2
	subs r2, r4, r0
	mov r3, r8
	muls r3, r2, r3
	mov ip, r3
	mov r0, ip
	muls r0, r5, r0
	movs r1, #0x80
	asrs r5, r0, #8
	lsls r2, r1, #9
	ldr r4, [sp, #0x18]
	subs r1, r2, r5
	cmp r4, r1
	ble _0800869C
	mov r3, fp
	ldr r4, _08008794
	lsls r0, r3, #2
	ldr r6, [r4, r0]
	muls r6, r5, r6
	asrs r3, r6, #0x10
	mov sb, r3
_0800863E:
	mov r8, r1
_08008640:
	ldr r0, [sp, #0x18]
	adds r6, r5, #0
	muls r6, r0, r6
	movs r4, #0x96
	asrs r2, r6, #0x10
	lsls r1, r4, #2
	muls r1, r2, r1
	movs r3, #0xc2
	lsls r0, r3, #1
	asrs r6, r1, #0x10
	adds r5, r7, r0
	mov r3, ip
	str r6, [r5]
	cmp r3, #0
	beq _08008688
	ldr r0, [sp, #0x10]
	ldr r2, [r0]
	movs r3, #0x80
	lsls r1, r3, #2
	adds r5, r2, #0
	ands r5, r1
	cmp r5, #0
	beq _08008682
_0800866E:
	movs r2, #0xcc
	lsls r4, r2, #1
	adds r2, r7, r4
	ldr r1, [r2]
	cmp r1, #2
	beq _0800867C
	b _080084CC
_0800867C:
	movs r6, #0xa
	str r6, [r2]
	b _080084CC
_08008682:
	orrs r2, r1
	str r2, [r0]
	b _0800866E
_08008688:
	movs r1, #0xcc
	lsls r5, r1, #1
	adds r2, r7, r5
	ldr r0, [r2]
	cmp r0, #0xb
	beq _08008696
	b _080084CC
_08008696:
	movs r4, #1
	str r4, [r2]
	b _080084CC
_0800869C:
	ldrh r3, [r6]
	movs r6, #1
	ands r6, r3
	cmp r6, #0
	bne _0800863E
	movs r4, #0xfc
	lsls r2, r4, #1
	adds r1, r7, r2
	ldr r3, [r1]
	mov r8, r3
	b _08008640
_080086B2:
	cmp r3, #0
	blt _080086BC
	movs r5, #0
	str r5, [sp, #0x14]
	b _08008488
_080086BC:
	movs r1, #5
	str r1, [sp, #0x14]
	b _08008488
_080086C2:
	movs r3, #0
	mov sb, r3
	b _08008478
_080086C8:
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _080086D0
	b _08008470
_080086D0:
	movs r3, #0x80
	lsls r2, r3, #9
	ldr r3, [sp, #0x18]
	mov r8, r2
	cmp r3, r8
	ble _080086F4
	ldr r5, _08008798
	movs r0, #0x81
	adds r2, r3, r5
	lsls r3, r0, #2
	adds r1, r7, r3
	asrs r4, r2, #0xb
	ldr r5, [r1]
	lsls r0, r4, #2
	ldr r4, [r0, r5]
	lsls r3, r4, #1
	mov sb, r3
	b _08008478
_080086F4:
	ldr r3, [sp, #0x18]
	cmp r3, r8
	bge _0800870C
	movs r5, #0x80
	asrs r2, r3, #0xb
	lsls r3, r5, #2
	adds r1, r7, r3
	ldr r4, [r1]
	lsls r0, r2, #2
	ldr r2, [r0, r4]
	mov sb, r2
	b _08008478
_0800870C:
	movs r1, #0
	mov sb, r1
	b _08008478
_08008712:
	cmp r2, r5
	bgt _08008752
	ldr r0, _08008778
	cmp r5, r0
	bgt _08008736
	ldrh r1, [r6]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0800872E
	ldr r2, _08008774
	mov r8, r0
	mov sb, r2
	b _08008464
_0800872E:
	ldr r3, _0800879C
	mov r8, r2
	mov sb, r3
	b _08008464
_08008736:
	ldr r1, _0800879C
	mov sb, r1
	ldrh r1, [r6]
	movs r5, #1
	ands r5, r1
	cmp r5, #0
	beq _0800874A
	ldr r2, _08008778
	mov r8, r2
	b _08008464
_0800874A:
	movs r2, #0xfc
	lsls r3, r2, #1
	adds r4, r7, r3
	b _080088A2
_08008752:
	ldr r2, _08008778
	cmp r5, r2
	bgt _08008736
	ldr r1, _080087A0
	ldr r0, _080087A4
	str r1, [sp]
	ldr r2, _080087A8
	ldr r1, _080087AC
	ldr r3, _080087B0
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080089AA
_08008770:
	ldr r1, _08008778
	b _080089B8
_08008774:
	.4byte 0x0000028F
_08008778:
	.4byte 0x00013333
_0800877C:
	.4byte 0x00000101
_08008780:
	.4byte 0xFFFFFDFF
_08008784:
	.4byte sin_fx
_08008788:
	.4byte cos_fx
_0800878C:
	.4byte gGameSetup
_08008790:
	.4byte 0x00002492
_08008794:
	.4byte gUnk_0884D9FC
_08008798:
	.4byte 0xFFFF0000
_0800879C:
	.4byte 0xFFFFFD71
_080087A0:
	.4byte gUnk_0804FFF8
_080087A4:
	.4byte gUnk_0804FFFC
_080087A8:
	.4byte gUnk_080500D8
_080087AC:
	.4byte gUnk_08050044
_080087B0:
	.4byte 0x00000F58
_080087B4:
	movs r4, #0x80
	lsls r0, r4, #6
	ands r0, r2
	cmp r0, #0
	bne _080087C0
	b _080088D6
_080087C0:
	cmp r5, #0
	bge _080087C6
	b _080088C8
_080087C6:
	movs r2, #0xfc
	lsls r3, r2, #1
	adds r4, r7, r3
	ldr r2, [r4]
	cmp r5, r2
	bgt _080087EE
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080087E4
	ldr r2, _08008A00
	movs r4, #0x80
	lsls r3, r4, #8
	b _080088D0
_080087E4:
	movs r5, #0xa4
	lsls r0, r5, #1
	mov sb, r0
	mov r8, r2
	b _08008464
_080087EE:
	cmp r2, r5
	bgt _0800882E
	movs r3, #0x80
	lsls r1, r3, #8
	mov r8, r1
	cmp r5, r8
	bgt _0800882E
	mov r2, fp
	cmp r2, #0x20
	ble _08008818
	ldr r1, _08008A04
	ldr r0, _08008A08
	str r1, [sp]
	ldr r2, _08008A0C
	ldr r1, _08008A10
	ldr r3, _08008A14
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08008818:
	ldrh r1, [r6]
	movs r2, #1
	ands r2, r1
	cmp r2, #0
	bne _08008824
	b _0800894A
_08008824:
	movs r4, #0x80
	lsls r3, r4, #2
	adds r2, r7, r3
	ldr r4, [r2]
	b _08008940
_0800882E:
	ldr r4, _08008A18
	ldr r2, [sp, #0x18]
	movs r1, #0x80
	adds r0, r2, r4
	lsls r4, r1, #8
	cmp r0, r4
	bhi _0800887A
	mov r3, fp
	cmp r3, #0x20
	ble _08008858
	ldr r5, _08008A04
	ldr r0, _08008A08
	ldr r1, _08008A10
	ldr r2, _08008A0C
	ldr r3, _08008A1C
	str r5, [sp]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08008858:
	movs r2, #0x81
	lsls r3, r2, #2
	adds r1, r7, r3
	ldr r5, [r1]
	mov r1, fp
	lsls r0, r1, #2
	ldrh r1, [r6]
	ldr r2, [r0, r5]
	movs r0, #1
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	bne _0800895C
	movs r0, #0xfc
	lsls r5, r0, #1
	adds r4, r7, r5
	b _080088A2
_0800887A:
	movs r3, #0x80
	ldr r2, [sp, #0x18]
	lsls r1, r3, #9
	cmp r2, r1
	ble _080088A8
	movs r5, #0x81
	lsls r3, r5, #2
	adds r2, r7, r3
	ldr r0, [r2]
	ldrh r1, [r6]
	adds r0, #0x80
	ldr r3, [r0]
	movs r5, #1
	ands r5, r1
	mov sb, r3
	cmp r5, #0
	bne _0800895C
	movs r3, #0xfc
	lsls r0, r3, #1
	adds r4, r7, r0
_080088A2:
	ldr r3, [r4]
	mov r8, r3
	b _08008464
_080088A8:
	ldr r1, _08008A20
	ldr r0, _08008A08
	str r1, [sp]
	ldr r2, _08008A0C
	ldr r1, _08008A10
	ldr r3, _08008A24
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r1, [r6]
	movs r3, #0
	mov sb, r3
	mov r8, r3
	b _08008464
_080088C8:
	ldr r2, _08008A00
	movs r5, #0x80
	lsls r3, r5, #8
	ldrh r1, [r6]
_080088D0:
	mov sb, r2
	mov r8, r3
	b _08008464
_080088D6:
	cmp r5, #0
	blt _080089B4
	movs r4, #0xfc
	lsls r0, r4, #1
	adds r4, r7, r0
	ldr r2, [r4]
	cmp r5, r2
	bgt _08008904
	ldrh r1, [r6]
	movs r5, #1
	ands r5, r1
	cmp r5, #0
	beq _080088FA
	ldr r3, _08008A00
	mov sb, r3
	movs r3, #0x80
	lsls r0, r3, #9
	b _08008462
_080088FA:
	movs r0, #0xa4
	lsls r3, r0, #1
	mov sb, r3
	mov r8, r2
	b _08008464
_08008904:
	cmp r2, r5
	bgt _0800898C
	movs r1, #0x80
	lsls r0, r1, #9
	mov r8, r0
	cmp r5, r8
	bgt _08008960
	mov r1, fp
	cmp r1, #0x20
	ble _0800892E
	ldr r2, _08008A04
	ldr r0, _08008A08
	str r2, [sp]
	ldr r1, _08008A10
	ldr r2, _08008A0C
	ldr r3, _08008A28
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0800892E:
	ldrh r1, [r6]
	movs r5, #1
	ands r5, r1
	cmp r5, #0
	beq _0800894A
	movs r4, #0x80
	lsls r3, r4, #2
	adds r0, r7, r3
	ldr r4, [r0]
_08008940:
	mov r0, fp
	lsls r5, r0, #2
	ldr r2, [r5, r4]
	mov sb, r2
	b _08008464
_0800894A:
	movs r5, #0x81
	lsls r3, r5, #2
	adds r0, r7, r3
	ldr r5, [r0]
	mov r0, fp
	lsls r3, r0, #2
	ldr r2, [r3, r5]
	ldr r4, [r4]
	mov sb, r2
_0800895C:
	mov r8, r4
	b _08008464
_08008960:
	movs r4, #0x81
	lsls r3, r4, #2
	adds r5, r7, r3
	ldr r1, [r5]
	adds r1, #0x80
	ldr r3, [r1]
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	mov sb, r3
	cmp r0, #0
	beq _08008980
	movs r2, #0x80
	lsls r3, r2, #9
	mov r8, r3
	b _08008464
_08008980:
	movs r4, #0xfc
	lsls r3, r4, #1
	adds r5, r7, r3
	ldr r3, [r5]
	mov r8, r3
	b _08008464
_0800898C:
	movs r4, #0x80
	lsls r2, r4, #9
	cmp r5, r2
	bgt _08008960
	ldr r0, _08008A20
	ldr r1, _08008A10
	str r0, [sp]
	ldr r2, _08008A0C
	ldr r0, _08008A08
	ldr r3, _08008A2C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_080089AA:
	movs r1, #0
	mov sb, r1
	mov r8, r1
	ldrh r1, [r6]
	b _08008464
_080089B4:
	movs r2, #0x80
	lsls r1, r2, #9
_080089B8:
	ldr r0, _08008A00
	mov r8, r1
	ldrh r1, [r6]
	mov sb, r0
	b _08008464
_080089C2:
	adds r5, r7, #0
	adds r5, #0xe0
	str r5, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #0x18]
	b _08008426
_080089CE:
	adds r1, r7, #0
	mov r0, sl
	bl sub_08006F44
	b _080089FA
_080089D8:
	mov r0, sl
	adds r1, r7, #0
	bl sub_080069F0
	mov r3, sl
	str r0, [r3, #0x40]
	b _080083FA
_080089E6:
	mov r0, sl
	adds r1, r7, #0
	bl sub_08006B90
	b _080083F6
_080089F0:
	adds r1, r7, #0
	mov r0, sl
	adds r2, r6, #0
	bl plane_vertical_speed
_080089FA:
	mov r1, sl
	str r0, [r1, #0x40]
	b _080083FA
_08008A00:
	.4byte 0x0000028F
_08008A04:
	.4byte gUnk_080500E4
_08008A08:
	.4byte gUnk_0804FFFC
_08008A0C:
	.4byte gUnk_080500D8
_08008A10:
	.4byte gUnk_08050044
_08008A14:
	.4byte 0x00000F73
_08008A18:
	.4byte 0xFFFF8000
_08008A1C:
	.4byte 0x00000F82
_08008A20:
	.4byte gUnk_0804FFF8
_08008A24:
	.4byte 0x00000F9A
_08008A28:
	.4byte 0x00000FB5
_08008A2C:
	.4byte 0x00000FD1

	.global planeControl
	.thumb_func
	.type planeControl, %function
planeControl: @ 08008A30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	sub sp, #4
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r7, #0
	bne _08008A44
	b _08008D40
_08008A44:
	adds r5, r7, #0
	adds r5, #0x5a
	ldrh r1, [r5]
	movs r0, #0x18
	muls r0, r1, r0
	ldr r3, _08008A78
	ldr r2, _08008A74
	adds r0, #8
	strh r2, [r3, r0]
	ldr r3, [r6, #0xc]
	cmp r3, #0
	beq _08008A80
	cmp r3, #1
	bne _08008A62
	b _08008D2E
_08008A62:
	cmp r3, #2
	bne _08008A68
	b _08008D1C
_08008A68:
	ldrh r3, [r4]
	ldr r1, _08008A7C
	ands r1, r3
	strh r1, [r4]
	b _08008A80
	.byte 0x00, 0x00
_08008A74:
	.4byte 0x00000000
_08008A78:
	.4byte 0x02018F34
_08008A7C:
	.4byte 0xFFFFFDFF
_08008A80:
	movs r2, #0xa0
	adds r1, r2, r7
	mov r8, r1
	ldr r1, [r1]
	movs r2, #0x80
	ands r2, r1
	cmp r2, #0
	bne _08008A92
	b _08008D08
_08008A92:
	ldr r1, [r4, #4]
	movs r5, #0
	asrs r0, r1, #1
	str r0, [r4, #4]
	str r5, [r4, #8]
	strh r5, [r4]
	strh r5, [r4, #2]
_08008AA0:
	ldr r1, [r6, #0x54]
	cmp r1, #0
	bne _08008AA8
	b _08008C9A
_08008AA8:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl plane_turn
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl plane_bank
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl plane_pitch_input
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0800685C
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_080078E4
	adds r2, r4, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_08007170
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_08007404
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_080077D8
	mov r1, r8
	ldr r0, [r1]
	movs r5, #0x80
	lsls r1, r5, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08008B04
	b _08008C8E
_08008B04:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_08007A18
_08008B0C:
	adds r5, r6, #0
	adds r5, #0xe0
	ldr r2, [r5]
	lsls r0, r2, #0xc
	mov r2, r8
	ldr r1, [r2, #0x20]
	asrs r4, r0, #0x10
	adds r0, r1, r4
	str r0, [r2, #0x20]
	ldr r3, [r5]
	lsls r4, r3, #0xb
	asrs r2, r4, #0x10
	mov r4, r8
	ldr r3, [r4, #0x24]
	adds r1, r3, r2
	str r1, [r4, #0x24]
	ldr r3, [r5]
	lsls r5, r0, #0x10
	lsls r1, r3, #9
	asrs r0, r5, #0x10
	ldr r5, _08008D58
	asrs r4, r1, #0x10
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	asrs r2, r1, #0xc
	adds r0, #0x94
	strh r2, [r0]
	mov r2, r8
	movs r1, #0x24
	ldrsh r0, [r2, r1]
	bl _call_via_r5
	lsls r5, r0, #0x10
	asrs r3, r5, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	adds r4, r7, #0
	asrs r2, r1, #0xc
	adds r4, #0x96
	strh r2, [r4]
	ldr r5, [r6, #0x54]
	cmp r5, #1
	beq _08008B8C
	ldr r4, [r6, #0x74]
	cmp r4, #0
	beq _08008B8C
	lsls r3, r4, #0x10
	lsrs r0, r3, #0x10
	movs r1, #0
	ldr r2, _08008D5C
	bl _call_via_r2
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r3, r4, r1
	str r3, [r6, #0x74]
	cmp r3, #7
	bne _08008B8C
	b _08008C88
_08008B8C:
	cmp r5, #5
	beq _08008BB0
	ldr r4, [r6, #0x7c]
	cmp r4, #0
	beq _08008BB0
	lsls r3, r4, #0x10
	movs r1, #0
	ldr r5, _08008D5C
	lsrs r0, r3, #0x10
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r5, r4, r1
	str r5, [r6, #0x7c]
	cmp r5, #7
	beq _08008C80
	ldr r5, [r6, #0x54]
_08008BB0:
	cmp r5, #2
	beq _08008BD6
	mov r3, r8
	ldr r4, [r3, #0x14]
	cmp r4, #0
	beq _08008BD6
	lsls r1, r4, #0x10
	lsrs r0, r1, #0x10
	ldr r2, _08008D5C
	movs r1, #0
	bl _call_via_r2
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	subs r1, r4, r2
	mov r4, r8
	str r1, [r4, #0x14]
	cmp r1, #7
	beq _08008C7A
_08008BD6:
	adds r4, r6, #0
	adds r4, #0xb8
	mov r1, r8
	ldr r2, [r4]
	ldr r3, [r1, #0x14]
	adds r0, r2, r3
	adds r3, r6, #0
	adds r3, #0x66
	ldrh r1, [r3]
	movs r2, #0x88
	adds r3, r1, r0
	lsls r0, r2, #1
	adds r2, r6, r0
	ldr r2, [r2]
	adds r0, #0x24
	adds r2, r2, r3
	adds r3, r6, r0
	ldr r3, [r3]
	adds r3, r3, r2
	adds r2, r7, #0
	adds r2, #0x54
	strh r3, [r2]
	mov r3, r8
	ldr r2, [r3, #0x18]
	ldrh r3, [r3, #0xe]
	adds r3, r3, r2
	adds r2, r6, #0
	adds r2, #0x6e
	ldrh r2, [r2]
	subs r0, #0x18
	adds r2, r2, r3
	adds r3, r6, r0
	ldr r0, [r3]
	movs r3, #0x9e
	adds r1, r0, r2
	lsls r0, r3, #1
	adds r3, r6, r0
	ldr r0, [r3]
	adds r2, r0, r1
	adds r0, r7, #0
	adds r0, #0x56
	strh r2, [r0]
	adds r0, r6, #0
	adds r0, #0xa0
	mov r1, r8
	ldr r3, [r0]
	ldr r2, [r1, #0x1c]
	ldr r1, [r6, #0x74]
	adds r3, r3, r2
	adds r2, r1, r3
	movs r3, #0x82
	lsls r1, r3, #1
	adds r3, r6, r1
	ldr r1, [r3]
	movs r3, #0x96
	adds r1, r1, r2
	lsls r2, r3, #1
	adds r3, r6, r2
	ldr r2, [r3]
	adds r3, r2, r1
	ldr r1, [r6, #0x7c]
	adds r2, r1, r3
	adds r1, r7, #0
	adds r1, #0x58
	strh r2, [r1]
	ldr r3, [r0]
	adds r1, #0x9c
	strh r3, [r1]
	ldr r3, [r4]
	adds r1, #2
	strh r3, [r1]
	mov r3, r8
	ldrh r0, [r3, #0xe]
	adds r1, r7, #0
	adds r1, #0xf8
	strh r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08008C7A:
	movs r0, #0
	str r0, [r4, #0x14]
	b _08008BD6
_08008C80:
	ldr r5, [r6, #0x54]
	movs r0, #0
	str r0, [r6, #0x7c]
	b _08008BB0
_08008C88:
	movs r4, #0
	str r4, [r6, #0x74]
	b _08008B8C
_08008C8E:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl planePlayer
	b _08008B0C
_08008C9A:
	ldrh r5, [r4]
	movs r2, #0x80
	lsls r0, r2, #2
	ands r0, r5
	cmp r0, #0
	bne _08008CA8
	b _08008AA8
_08008CA8:
	ldr r0, [r4, #8]
	cmp r0, #0
	bgt _08008CB0
	b _08008AA8
_08008CB0:
	adds r0, r6, #0
	adds r0, #0xe8
	str r1, [r0]
	str r1, [r6, #0x5c]
	ldr r2, [r7, #0x28]
	adds r5, r6, #0
	adds r5, #0x84
	str r2, [r5]
	ldr r1, [r4, #8]
	rsbs r0, r1, #0
	lsls r5, r0, #5
	asrs r2, r5, #8
	movs r1, #2
	str r2, [r6, #0x58]
	str r1, [r6, #0x54]
	adds r0, r7, #0
	movs r1, #0xa
	movs r2, #1
	bl gamesfx_play_voice
	mov r2, r8
	ldr r1, [r2]
	movs r0, #0xc0
	lsls r5, r0, #4
	ands r5, r1
	cmp r5, #0
	beq _08008CF0
	movs r0, #0x80
	lsls r5, r0, #7
	orrs r5, r1
	str r5, [r2]
	adds r1, r5, #0
_08008CF0:
	movs r3, #0x10
	ldr r5, _08008D60
	orrs r3, r1
	ands r5, r3
	mov r1, r8
	movs r0, #0xcc
	str r5, [r1]
	lsls r5, r0, #1
	adds r1, r6, r5
	movs r2, #3
	str r2, [r1]
	b _08008AA8
_08008D08:
	ldr r5, _08008D64
	ands r5, r1
	cmp r5, #0
	bne _08008D12
	b _08008AA0
_08008D12:
	str r2, [r4, #4]
	str r2, [r4, #8]
	strh r2, [r4]
	strh r2, [r4, #2]
	b _08008AA0
_08008D1C:
	ldr r2, [r4, #4]
	cmp r2, #0
	ble _08008D24
	b _08008A68
_08008D24:
	ldrh r0, [r4]
	ldr r5, _08008D68
	ands r5, r0
	strh r5, [r4]
	b _08008A68
_08008D2E:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _08008D36
	b _08008A68
_08008D36:
	ldrh r3, [r4]
	ldr r1, _08008D68
	ands r1, r3
	strh r1, [r4]
	b _08008A68
_08008D40:
	ldr r0, _08008D6C
	ldr r1, _08008D70
	str r0, [sp]
	ldr r2, _08008D74
	ldr r0, _08008D78
	ldr r3, _08008D7C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08008A44
_08008D58:
	.4byte sin_fx
_08008D5C:
	.4byte _03000814
_08008D60:
	.4byte 0xFFFFF3FF
_08008D64:
	.4byte 0x00800100
_08008D68:
	.4byte 0xFFFFFEFF
_08008D6C:
	.4byte gUnk_080500F8
_08008D70:
	.4byte gUnk_08050044
_08008D74:
	.4byte gUnk_08050104
_08008D78:
	.4byte gUnk_0804FFFC
_08008D7C:
	.4byte 0x000010B5

	.global init_player
	.thumb_func
	.type init_player, %function
init_player: @ 08008D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	sub sp, #8
	cmp r4, #0
	bne _08008D94
	b _08008FC8
_08008D94:
	ldr r5, _08008DBC
	adds r6, r4, #0
	strh r5, [r4]
	strb r5, [r4, #2]
	adds r6, #0xa0
	ldr r1, [r6, #4]
	mov r8, r1
	lsls r2, r1, #6
	add r2, r8
	ldr r0, _08008DC0
	lsls r1, r2, #3
	movs r2, #0
	adds r5, r1, r0
	mov sb, r2
	bl sub_080044A0
	cmp r0, #0
	bne _08008DBA
	b _08008FB8
_08008DBA:
	b _08008DC4
_08008DBC:
	.4byte 0x00000001
_08008DC0:
	.4byte gRacerData
_08008DC4:
	adds r0, r4, #0
	bl sub_080036BC
	ldr r2, [r4, #0x24]
	adds r1, r4, #0
	adds r1, #0x84
	str r2, [r1]
	adds r7, r0, #0
	ldr r0, [r4, #0x28]
	adds r1, #4
	str r0, [r1]
	ldr r2, [r4, #0x2c]
	adds r1, #4
	str r2, [r1]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	movs r3, #0x94
	str r0, [r4, #0x30]
	str r1, [r4, #0x34]
	lsls r0, r3, #1
	movs r1, #1
	str r2, [r4, #0x38]
	adds r3, r4, r0
	movs r2, #0
	rsbs r0, r1, #0
	movs r1, #0xc6
	str r2, [r4, #0x3c]
	str r2, [r4, #0x40]
	str r2, [r4, #0x44]
	str r2, [r6]
	str r2, [r4, #0x50]
	str r2, [r4, #0x48]
	str r2, [r6, #0x28]
	str r2, [r6, #0x30]
	str r0, [r3]
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, [r7, #0x14]
	str r3, [r1]
	movs r1, #0xc4
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, [r7, #0x18]
	str r3, [r1]
	movs r3, #0xcc
	lsls r1, r3, #1
	adds r3, r5, r1
	movs r1, #0xee
	str r2, [r3]
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, [r7, #0x1c]
	str r3, [r1]
	movs r1, #0xf0
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, [r7, #0x20]
	str r3, [r1]
	adds r3, r4, #0
	ldrh r1, [r6, #0xe]
	adds r3, #0x56
	strh r1, [r3]
	movs r3, #0x86
	lsls r1, r3, #1
	adds r3, r4, r1
	str r2, [r6, #0x20]
	str r2, [r6, #0x24]
	str r2, [r6, #0x14]
	str r2, [r6, #0x18]
	str r2, [r6, #0x1c]
	strh r2, [r3]
	str r0, [r6, #8]
	movs r0, #0x81
	lsls r1, r0, #1
	adds r0, r4, r1
	ldr r1, _08008E94
	strh r1, [r0]
	ldrh r1, [r6, #0xe]
	movs r0, #0x92
	strh r1, [r6, #0x38]
	lsls r6, r0, #1
	movs r1, #0x80
	adds r0, r4, r6
	lsls r6, r1, #9
	ldr r1, _08008E98
	str r6, [r0]
	str r1, [r5, #4]
	str r1, [r5, #8]
	movs r6, #0x80
	ldr r1, [r7, #0x74]
	lsls r0, r6, #2
	adds r6, r5, r0
	str r1, [r6]
	movs r0, #0x81
	ldr r6, [r7, #0x78]
	lsls r1, r0, #2
	adds r0, r5, r1
	str r6, [r0]
	mov r0, sp
	adds r0, #6
	movs r1, #0xc
	strh r2, [r0]
	b _08008E9C
_08008E94:
	.4byte 0x00000006
_08008E98:
	.4byte 0xEFFFFFFF
_08008E9C:
	mov r2, r8
	muls r2, r1, r2
	ldr r6, _08008EF8
	adds r1, r2, r6
	adds r6, r4, #0
	ldr r2, _08008EFC
	adds r6, #0x5a
	bl CpuSet
	ldrh r0, [r6]
	cmp r0, #0xff
	beq _08008F0E
	movs r6, #0x80
	lsls r4, r6, #3
	ldr r1, _08008F00
	movs r2, #0x18
	movs r3, #0x80
	mov ip, r4
	ldr r6, _08008EF4
	ldr r4, _08008F04
	mov sl, r1
	mov r8, r2
	mov lr, r3
_08008ECA:
	mov r3, r8
	muls r3, r0, r3
	mov r1, sl
	adds r3, #4
	adds r2, r3, r1
	ldrh r1, [r2, #2]
	mov r3, lr
	ands r3, r1
	cmp r3, #0
	beq _08008EE4
	mov r3, ip
	orrs r3, r1
	strh r3, [r2, #2]
_08008EE4:
	mov r3, sb
	cmp r3, #0
	beq _08008F08
	ldrh r1, [r2, #2]
	orrs r1, r6
	strh r1, [r2, #2]
	b _08008F08
	.byte 0x00, 0x00
_08008EF4:
	.4byte 0x00000100
_08008EF8:
	.4byte 0x02004224
_08008EFC:
	.4byte 0x01000006
_08008F00:
	.4byte 0x02018F34
_08008F04:
	.4byte 0x0201A734
_08008F08:
	ldrb r0, [r4, r0]
	cmp r0, #0xff
	bne _08008ECA
_08008F0E:
	movs r3, #0xf8
	lsls r0, r3, #1
	ldr r2, [r7, #0x64]
	adds r6, r5, r0
	str r2, [r6]
	movs r4, #0xfa
	lsls r6, r4, #1
	ldr r2, [r7, #0x3c]
	adds r4, r5, r6
	str r2, [r4]
	adds r0, #0xc
	ldr r4, [r7, #0x3c]
	adds r1, r0, r5
	movs r3, #0x80
	mov r8, r1
	lsls r6, r3, #0x15
	adds r1, r4, #0
	cmp r4, #0
	blt _08008FB4
_08008F34:
	adds r0, r6, #0
	ldr r2, _08008FE0
	bl _call_via_r2
	adds r1, r6, #0
	eors r1, r4
	cmp r1, #0
	blt _08008FB0
_08008F44:
	mov r2, r8
	str r0, [r2]
	movs r1, #0xfc
	ldr r0, [r7, #0x40]
	lsls r2, r1, #1
	adds r1, r5, r2
	str r0, [r1]
	movs r3, #0xf2
	ldr r2, [r7, #0x2c]
	lsls r1, r3, #1
	adds r0, r5, r1
	str r2, [r0]
	movs r0, #0xf4
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r2, [r7, #0x30]
	adds r1, #8
	str r2, [r0]
	adds r0, r5, r1
	ldr r1, [r7, #0x34]
	str r1, [r0]
	ldr r2, [r7, #0x44]
	adds r0, r5, #0
	adds r0, #0x88
	str r2, [r0]
	ldr r1, [r7, #0x48]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x4c]
	adds r0, #0x34
	str r2, [r0]
	ldr r1, [r7, #0x58]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x50]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r7, #0x5c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x54]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r7, #0x60]
	adds r0, #4
	str r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08008FB0:
	rsbs r0, r0, #0
	b _08008F44
_08008FB4:
	rsbs r1, r4, #0
	b _08008F34
_08008FB8:
	bl sub_08004428
	cmp r8, r0
	beq _08008FC2
	b _08008DC4
_08008FC2:
	movs r3, #1
	mov sb, r3
	b _08008DC4
_08008FC8:
	ldr r0, _08008FE4
	ldr r1, _08008FE8
	str r0, [sp]
	ldr r2, _08008FEC
	ldr r0, _08008FF0
	ldr r3, _08008FF4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08008D94
_08008FE0:
	.4byte udiv
_08008FE4:
	.4byte gUnk_080500F8
_08008FE8:
	.4byte gUnk_08050044
_08008FEC:
	.4byte gUnk_08050114
_08008FF0:
	.4byte gUnk_0804FFFC
_08008FF4:
	.4byte 0x0000118A

	.global sub_08008FF8
	.thumb_func
	.type sub_08008FF8, %function
sub_08008FF8: @ 08008FF8
	push {r4, r5, r6, lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	lsls r0, r3, #6
	adds r1, r0, r3
	ldr r5, _08009080
	lsls r6, r1, #3
	adds r1, r6, r5
	adds r2, r1, #0
	adds r2, #0xe0
	ldr r4, [r2]
	asrs r5, r4, #4
	adds r0, r5, #0
	muls r0, r5, r0
	asrs r6, r0, #0xc
	muls r6, r5, r6
	asrs r4, r6, #0xc
	muls r4, r5, r4
	adds r2, r1, #0
	adds r2, #0xe8
	ldr r0, [r2]
	asrs r5, r4, #8
	lsls r4, r0, #8
	adds r0, r1, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	ble _0800907C
	adds r0, r3, #0
_08009032:
	movs r2, #0x9e
	lsls r6, r2, #1
	movs r3, #0x9a
	adds r2, r1, r6
	lsls r6, r3, #1
	adds r3, r1, r6
	ldr r3, [r3]
	ldr r2, [r2]
	asrs r3, r3, #1
	subs r6, #8
	adds r2, r2, r3
	adds r3, r1, r6
	ldr r3, [r3]
	asrs r6, r3, #2
	adds r2, r2, r6
	subs r6, r5, r4
	subs r3, r6, r0
	movs r0, #0xa0
	adds r6, r3, r2
	lsls r2, r0, #8
	adds r3, r6, r2
	movs r6, #0x80
	lsls r2, r6, #0xb
	cmp r3, r2
	ble _08009066
	adds r3, r2, #0
_08009066:
	movs r2, #0xc8
	lsls r6, r2, #1
	adds r2, r1, r6
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_0800907C:
	rsbs r0, r3, #0
	b _08009032
_08009080:
	.4byte gRacerData

	.global player_engine_sound_local
	.thumb_func
	.type player_engine_sound_local, %function
player_engine_sound_local: @ 08009084
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0xcc
	adds r6, r1, #0
	lsls r1, r2, #1
	adds r7, r0, #0
	adds r0, r1, r6
	ldr r4, [r0]
	sub sp, #0x18
	mov r8, r0
	cmp r4, #1
	bne _080090A4
	b _08009362
_080090A4:
	cmp r4, #3
	bne _080090AA
	b _0800930E
_080090AA:
	cmp r4, #5
	bne _080090B0
	b _080092BE
_080090B0:
	cmp r4, #7
	bne _080090B6
	b _08009232
_080090B6:
	cmp r4, #8
	bne _080090BC
	b _080091B0
_080090BC:
	cmp r4, #0xa
	beq _08009168
	cmp r4, #0xe
	beq _0800912C
	cmp r4, #0x10
	beq _080090D8
_080090C8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080090D8:
	movs r5, #0x94
	lsls r2, r5, #1
	adds r0, r7, r2
	bl gamesfx_release
	movs r4, #0xc8
	lsls r3, r4, #1
	movs r0, #0x80
	adds r4, r6, r3
	lsls r5, r0, #7
	movs r2, #0xca
	str r5, [r4]
	lsls r1, r2, #1
	movs r5, #0x94
	adds r0, r6, r1
	lsls r3, r5, #1
	movs r1, #0x40
	str r1, [r0]
	adds r5, r7, r3
	adds r3, #0x64
	adds r2, r6, r3
	ldr r3, [r2]
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #1
	movs r4, #1
	movs r1, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r1, [sp, #0x10]
	rsbs r4, r2, #0
	ldr r0, _08009408
	ldr r1, _0800940C
	adds r2, r7, #0
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	beq _080090C8
	movs r0, #0x11
	b _080091AA
_0800912C:
	movs r4, #0x94
	lsls r3, r4, #1
	adds r0, r7, r3
	bl gamesfx_stop
	movs r5, #0x94
	lsls r2, r5, #1
	movs r1, #0x7f
	movs r0, #0x80
	lsls r4, r0, #9
	adds r5, r7, r2
	str r1, [sp]
	movs r2, #1
	movs r3, #1
	movs r1, #0
	str r4, [sp, #4]
	str r2, [sp, #8]
	rsbs r4, r3, #0
	str r1, [sp, #0x10]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #4
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	beq _080090C8
	movs r0, #0xf
	b _080092B8
_08009168:
	movs r4, #0x94
	lsls r2, r4, #1
	adds r0, r7, r2
	bl gamesfx_stop
	movs r1, #0xca
	lsls r3, r1, #1
	movs r5, #0x94
	adds r4, r6, r3
	lsls r0, r5, #1
	adds r5, r7, r0
	ldr r0, [r4]
	movs r2, #0x80
	lsls r1, r2, #9
	str r0, [sp]
	movs r4, #1
	movs r3, #1
	movs r0, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r0, [sp, #0x10]
	rsbs r4, r3, #0
	ldr r0, _08009410
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0xe1
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	beq _080090C8
	movs r0, #0xb
_080091AA:
	mov r1, r8
	str r0, [r1]
	b _080090C8
_080091B0:
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_08008FF8
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r5, r2, #6
	adds r1, r5, r2
	ldr r5, _08009414
	lsls r2, r1, #3
	adds r1, r2, r5
	movs r2, #0xee
	lsls r5, r2, #1
	adds r3, r1, #0
	adds r3, #0xe0
	adds r2, r1, r5
	ldr r2, [r2]
	ldr r5, [r3]
	muls r5, r2, r5
	asrs r3, r5, #0x10
	adds r4, #0xae
	cmp r3, r2
	ble _080091EC
	adds r3, r2, #0
_080091EC:
	movs r5, #0xca
	lsls r2, r5, #1
	adds r5, r1, r2
	ldr r2, [r5]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r5]
	movs r5, #0x94
	lsls r1, r5, #1
	str r4, [sp]
	str r0, [sp, #8]
	movs r4, #1
	movs r3, #1
	movs r0, #0
	adds r5, r7, r1
	str r2, [sp, #4]
	str r4, [sp, #0xc]
	str r0, [sp, #0x14]
	rsbs r4, r3, #0
	ldr r0, _08009410
	ldr r1, _08009418
	ldr r2, _0800941C
	adds r3, r7, #0
	str r4, [sp, #0x10]
	bl gamesfx_play_cb_endcb
	str r0, [r5]
	cmp r0, r4
	bne _0800922A
	b _080090C8
_0800922A:
	movs r2, #9
	mov r5, r8
	str r2, [r5]
	b _080090C8
_08009232:
	movs r0, #0x94
	lsls r4, r0, #1
	adds r0, r7, r4
	bl gamesfx_stop
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_08008FF8
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r5, r2, #6
	adds r1, r5, r2
	ldr r5, _08009414
	lsls r2, r1, #3
	adds r1, r2, r5
	movs r2, #0xee
	lsls r5, r2, #1
	adds r3, r1, #0
	adds r3, #0xe0
	adds r2, r1, r5
	ldr r2, [r2]
	ldr r5, [r3]
	muls r5, r2, r5
	asrs r3, r5, #0x10
	adds r4, #0xae
	cmp r3, r2
	ble _08009278
	adds r3, r2, #0
_08009278:
	movs r5, #0xca
	lsls r2, r5, #1
	adds r5, r1, r2
	ldr r2, [r5]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r5]
	movs r5, #0x94
	lsls r1, r5, #1
	adds r5, r7, r1
	str r2, [sp, #4]
	movs r1, #1
	movs r3, #1
	movs r2, #0
	str r4, [sp]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	rsbs r4, r3, #0
	str r2, [sp, #0x14]
	ldr r0, _08009410
	ldr r1, _08009418
	ldr r2, _0800941C
	adds r3, r7, #0
	str r4, [sp, #0x10]
	bl gamesfx_play_cb_endcb
	str r0, [r5]
	cmp r0, r4
	bne _080092B6
	b _080090C8
_080092B6:
	movs r0, #9
_080092B8:
	mov r5, r8
	str r0, [r5]
	b _080090C8
_080092BE:
	movs r4, #0x94
	lsls r5, r4, #1
	adds r0, r7, r5
	bl gamesfx_stop
	movs r1, #0xf0
	lsls r3, r1, #1
	adds r2, r6, #0
	adds r2, #0xe0
	adds r0, r6, r3
	ldr r4, [r2]
	ldr r2, [r0]
	muls r4, r2, r4
	asrs r1, r4, #0x10
	cmp r1, r2
	ble _080092E0
	adds r1, r2, #0
_080092E0:
	movs r3, #0xc4
	lsls r0, r3, #1
	movs r5, #0x94
	lsls r2, r5, #1
	adds r4, r6, r0
	movs r3, #1
	ldr r0, [r4]
	adds r5, r7, r2
	rsbs r4, r3, #0
	movs r2, #0
	movs r3, #0x80
	str r2, [sp, #4]
	lsls r2, r3, #0xa
	movs r3, #1
	str r4, [sp]
	bl gamesfx_play
	str r0, [r5]
	cmp r0, r4
	bne _0800930A
	b _080090C8
_0800930A:
	movs r1, #6
	b _0800935C
_0800930E:
	movs r4, #0x94
	lsls r5, r4, #1
	adds r0, r7, r5
	bl gamesfx_stop
	movs r2, #0xf0
	lsls r3, r2, #1
	adds r0, r6, #0
	adds r1, r6, r3
	adds r0, #0xe0
	ldr r2, [r1]
	ldr r4, [r0]
	muls r4, r2, r4
	asrs r1, r4, #0x10
	cmp r1, r2
	ble _08009330
	adds r1, r2, #0
_08009330:
	movs r3, #0xc4
	lsls r0, r3, #1
	movs r5, #0x94
	lsls r2, r5, #1
	adds r4, r6, r0
	movs r3, #1
	ldr r0, [r4]
	adds r5, r7, r2
	rsbs r4, r3, #0
	movs r2, #0
	movs r3, #0x80
	str r2, [sp, #4]
	lsls r2, r3, #9
	movs r3, #1
	str r4, [sp]
	bl gamesfx_play
	str r0, [r5]
	cmp r0, r4
	bne _0800935A
	b _080090C8
_0800935A:
	movs r1, #4
_0800935C:
	mov r5, r8
	str r1, [r5]
	b _080090C8
_08009362:
	movs r5, #0x94
	lsls r2, r5, #1
	adds r0, r7, r2
	bl gamesfx_stop
	movs r0, #0xc8
	lsls r3, r0, #1
	movs r5, #0x80
	movs r0, #0xca
	lsls r1, r5, #7
	lsls r5, r0, #1
	adds r2, r3, r6
	adds r3, r5, r6
	mov sl, r3
	str r1, [r2]
	mov r5, sl
	movs r1, #0x40
	str r1, [r5]
	adds r0, r7, #0
	mov sb, r2
	bl sub_08008FF8
	adds r2, r7, #0
	adds r2, #0xa0
	ldr r0, [r2, #4]
	lsls r5, r0, #6
	adds r1, r5, r0
	ldr r0, _08009414
	lsls r2, r1, #3
	adds r1, r2, r0
	movs r5, #0xee
	lsls r3, r5, #1
	adds r2, r1, #0
	adds r2, #0xe0
	adds r5, r1, r3
	ldr r0, [r2]
	ldr r2, [r5]
	muls r0, r2, r0
	asrs r3, r0, #0x10
	cmp r3, r2
	ble _080093B6
	adds r3, r2, #0
_080093B6:
	movs r0, #0xca
	lsls r5, r0, #1
	adds r0, r1, r5
	ldr r2, [r0]
	subs r5, r2, r3
	asrs r3, r5, #3
	subs r5, r2, r3
	str r5, [r0]
	movs r1, #0xc6
	movs r5, #0x94
	lsls r3, r1, #1
	lsls r0, r5, #1
	mov r1, sl
	adds r5, r7, r0
	ldr r0, [r1]
	adds r2, r6, r3
	ldr r3, [r2]
	str r0, [sp]
	mov r0, sb
	ldr r1, [r0]
	movs r0, #1
	str r1, [sp, #4]
	movs r1, #0
	str r4, [sp, #8]
	str r1, [sp, #0x10]
	rsbs r4, r0, #0
	ldr r1, _08009418
	ldr r0, _08009410
	adds r2, r7, #0
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	bne _080093FE
	b _080090C8
_080093FE:
	movs r2, #2
	mov r1, r8
	str r2, [r1]
	b _080090C8
	.byte 0x00, 0x00
_08009408:
	.4byte player_sfx_local_vol_cb1
_0800940C:
	.4byte player_sfx_local_pitch_cb
_08009410:
	.4byte player_sfx_local_vol_cb2
_08009414:
	.4byte gRacerData
_08009418:
	.4byte sub_08008FF8
_0800941C:
	.4byte player_engine_sample_end

	.global sub_08009420
	.thumb_func
	.type sub_08009420, %function
sub_08009420: @ 08009420
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0xa0
	ldr r4, [r2, #4]
	lsls r0, r4, #6
	adds r1, r0, r4
	ldr r5, _080094B4
	lsls r7, r1, #3
	adds r1, r7, r5
	adds r2, r1, #0
	adds r2, #0xe0
	ldr r4, [r2]
	asrs r5, r4, #4
	adds r0, r5, #0
	muls r0, r5, r0
	asrs r7, r0, #0xc
	muls r7, r5, r7
	asrs r4, r7, #0xc
	muls r4, r5, r4
	adds r2, r1, #0
	adds r2, #0xe8
	ldr r0, [r2]
	asrs r5, r4, #8
	lsls r4, r0, #8
	adds r0, r1, #0
	adds r0, #0xa0
	ldr r3, [r0]
	cmp r3, #0
	ble _080094AE
	adds r0, r3, #0
_0800945E:
	movs r2, #0x9e
	lsls r7, r2, #1
	movs r3, #0x9a
	adds r2, r1, r7
	lsls r7, r3, #1
	adds r3, r1, r7
	ldr r3, [r3]
	ldr r2, [r2]
	asrs r3, r3, #1
	subs r7, #8
	adds r2, r2, r3
	adds r3, r1, r7
	ldr r3, [r3]
	asrs r3, r3, #2
	adds r2, r2, r3
	subs r3, r5, r4
	subs r3, r3, r0
	movs r0, #0xa0
	adds r3, r3, r2
	lsls r2, r0, #8
	adds r0, r3, r2
	movs r3, #0xc8
	lsls r2, r3, #1
	adds r1, r1, r2
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r0, r3, #3
	subs r2, r2, r0
	str r2, [r1]
	ldr r0, _080094B8
	ldr r1, [r0]
	lsls r3, r1, #2
	ldr r1, _080094BC
	ldr r0, [r1, r3]
	adds r1, r6, #0
	bl sub_08020130
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_080094AE:
	rsbs r0, r3, #0
	b _0800945E
	.byte 0x00, 0x00
_080094B4:
	.4byte gRacerData
_080094B8:
	.4byte gLocalPlayerIndex
_080094BC:
	.4byte gRacerObjects

	.global player_engine_sound_remote
	.thumb_func
	.type player_engine_sound_remote, %function
player_engine_sound_remote: @ 080094C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	movs r3, #0x96
	adds r5, r0, #0
	lsls r2, r3, #1
	adds r7, r1, #0
	adds r1, r5, r2
	ldr r0, [r1]
	adds r4, r5, #0
	sub sp, #0x18
	adds r4, #0xa0
	cmp r0, #0
	bne _080094E0
	b _08009842
_080094E0:
	movs r2, #0xcc
	lsls r0, r2, #1
	adds r1, r0, r7
	ldr r3, [r1]
	mov sl, r1
	cmp r3, #1
	bne _080094F0
	b _080097A4
_080094F0:
	cmp r3, #3
	bne _080094F6
	b _08009712
_080094F6:
	cmp r3, #5
	bne _080094FC
	b _08009684
_080094FC:
	cmp r3, #7
	bne _08009502
	b _080095FA
_08009502:
	cmp r3, #8
	beq _0800959A
	cmp r3, #0xa
	beq _08009592
	cmp r3, #0xc
	beq _0800951C
_0800950E:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800951C:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r5, r1
	bl gamesfx_stop
	ldr r3, [r4, #4]
	lsls r0, r3, #6
	adds r1, r0, r3
	ldr r4, _080098C8
	lsls r2, r1, #3
	adds r1, r2, r4
	movs r0, #0xee
	lsls r3, r0, #1
	adds r2, r1, #0
	adds r2, #0xe0
	adds r0, r1, r3
	ldr r4, [r2]
	ldr r2, [r0]
	muls r4, r2, r4
	asrs r3, r4, #0x10
	cmp r3, r2
	ble _0800954A
	adds r3, r2, #0
_0800954A:
	movs r4, #0xca
	lsls r2, r4, #1
	adds r4, r1, r2
	ldr r2, [r4]
	subs r0, r2, r3
	asrs r3, r0, #3
	subs r0, r2, r3
	str r0, [r4]
	str r0, [sp]
	movs r0, #0x80
	lsls r2, r0, #9
	movs r4, #0x94
	lsls r3, r4, #1
	str r2, [sp, #4]
	movs r1, #2
	movs r0, #0x1e
	movs r2, #0
	adds r4, r5, r3
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	movs r1, #0
	movs r3, #0xdf
	ldr r0, _080098CC
	adds r2, r5, #0
	bl gamesfx_play_cb
	movs r1, #1
	rsbs r3, r1, #0
	str r0, [r4]
	cmp r0, r3
	beq _0800950E
	movs r1, #0xd
	mov r4, sl
	str r1, [r4]
	b _0800950E
_08009592:
	movs r0, #2
	mov r1, sl
	str r0, [r1]
	b _0800950E
_0800959A:
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r6, r0, #0
	adds r0, r5, #0
	bl sub_08008FF8
	ldr r3, [r4, #4]
	lsls r4, r3, #6
	adds r1, r4, r3
	ldr r4, _080098C8
	lsls r2, r1, #3
	adds r1, r2, r4
	movs r2, #0xee
	lsls r4, r2, #1
	adds r3, r1, #0
	adds r3, #0xe0
	adds r2, r1, r4
	ldr r2, [r2]
	ldr r4, [r3]
	muls r4, r2, r4
	asrs r3, r4, #0x10
	adds r6, #0xae
	cmp r3, r2
	ble _080095D2
	adds r3, r2, #0
_080095D2:
	movs r4, #0xca
	lsls r2, r4, #1
	adds r4, r1, r2
	ldr r2, [r4]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r4]
	movs r4, #0x94
	lsls r1, r4, #1
	adds r4, r5, r1
	str r2, [sp, #4]
	str r0, [sp, #8]
	movs r2, #2
	movs r1, #0x1e
	movs r0, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	b _08009662
_080095FA:
	movs r0, #0x94
	lsls r6, r0, #1
	adds r0, r5, r6
	bl gamesfx_stop
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r6, r0, #0
	adds r0, r5, #0
	bl sub_08008FF8
	ldr r3, [r4, #4]
	lsls r4, r3, #6
	adds r1, r4, r3
	ldr r4, _080098C8
	lsls r2, r1, #3
	adds r1, r2, r4
	movs r2, #0xee
	lsls r4, r2, #1
	adds r3, r1, #0
	adds r3, #0xe0
	adds r2, r1, r4
	ldr r2, [r2]
	ldr r4, [r3]
	muls r4, r2, r4
	asrs r3, r4, #0x10
	adds r6, #0xae
	cmp r3, r2
	ble _0800963C
	adds r3, r2, #0
_0800963C:
	movs r4, #0xca
	lsls r2, r4, #1
	adds r4, r1, r2
	ldr r2, [r4]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r4]
	movs r4, #0x94
	lsls r1, r4, #1
	adds r4, r5, r1
	str r2, [sp, #4]
	str r0, [sp, #8]
	movs r2, #2
	movs r0, #0x1e
	movs r1, #0
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
_08009662:
	ldr r2, _080098D0
	ldr r0, _080098CC
	ldr r1, _080098D4
	adds r3, r5, #0
	str r6, [sp]
	bl gamesfx_play_cb_endcb
	movs r2, #1
	str r0, [r4]
	rsbs r4, r2, #0
	cmp r0, r4
	bne _0800967C
	b _0800950E
_0800967C:
	movs r2, #9
	mov r0, sl
	str r2, [r0]
	b _0800950E
_08009684:
	movs r6, #0x94
	lsls r2, r6, #1
	adds r0, r5, r2
	bl gamesfx_stop
	ldr r3, [r4, #4]
	lsls r0, r3, #6
	adds r6, r0, r3
	ldr r1, _080098C8
	lsls r4, r6, #3
	adds r6, r4, r1
	movs r0, #0xf0
	adds r1, r6, #0
	lsls r2, r0, #1
	adds r0, r6, r2
	adds r1, #0xe0
	ldr r4, [r1]
	ldr r1, [r0]
	adds r6, r1, #0
	muls r6, r4, r6
	asrs r0, r6, #0x10
	cmp r0, r1
	ble _080096B4
	adds r0, r1, #0
_080096B4:
	movs r4, #0x98
	lsls r3, r4, #1
	adds r6, r5, r3
	ldr r4, [r6]
	movs r2, #0x80
	lsls r6, r2, #4
	subs r1, r6, r4
	muls r1, r0, r1
	ldr r2, _080098D8
	ldr r0, [r2]
	ldr r4, _080098DC
	movs r3, #0x80
	asrs r6, r1, #0xb
	lsls r1, r0, #2
	ldr r0, [r4, r1]
	lsls r2, r3, #0xa
	adds r1, r5, #0
	bl sub_08020130
	movs r2, #0xc4
	lsls r3, r2, #1
	movs r4, #0x94
	adds r2, r7, r3
	ldr r3, [r2]
	lsls r1, r4, #1
	str r0, [sp, #4]
	movs r0, #2
	adds r4, r5, r1
	str r0, [sp, #8]
	movs r1, #0x1e
	movs r0, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _080098E0
	ldr r0, _080098E4
	adds r2, r5, #0
	str r6, [sp]
	bl gamesfx_play_cb
	movs r3, #1
	rsbs r1, r3, #0
	str r0, [r4]
	cmp r0, r1
	bne _0800970E
	b _0800950E
_0800970E:
	movs r0, #6
	b _0800979E
_08009712:
	movs r1, #0x94
	lsls r2, r1, #1
	adds r0, r5, r2
	bl gamesfx_stop
	ldr r3, [r4, #4]
	lsls r6, r3, #6
	adds r0, r6, r3
	ldr r1, _080098C8
	lsls r4, r0, #3
	adds r0, r4, r1
	movs r6, #0xf0
	adds r1, r0, #0
	lsls r2, r6, #1
	adds r6, r0, r2
	adds r1, #0xe0
	ldr r0, [r1]
	ldr r1, [r6]
	adds r6, r1, #0
	muls r6, r0, r6
	asrs r0, r6, #0x10
	cmp r0, r1
	ble _08009742
	adds r0, r1, #0
_08009742:
	movs r4, #0x98
	lsls r3, r4, #1
	adds r6, r5, r3
	ldr r4, [r6]
	movs r2, #0x80
	lsls r6, r2, #4
	subs r1, r6, r4
	muls r1, r0, r1
	ldr r2, _080098D8
	ldr r0, [r2]
	ldr r4, _080098DC
	movs r3, #0x80
	asrs r6, r1, #0xb
	lsls r1, r0, #2
	ldr r0, [r4, r1]
	lsls r2, r3, #9
	adds r1, r5, #0
	bl sub_08020130
	movs r2, #0xc4
	lsls r3, r2, #1
	movs r4, #0x94
	adds r2, r7, r3
	ldr r3, [r2]
	lsls r1, r4, #1
	str r0, [sp, #4]
	movs r0, #2
	adds r4, r5, r1
	str r0, [sp, #8]
	movs r1, #0x1e
	movs r0, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _080098E8
	ldr r0, _080098E4
	adds r2, r5, #0
	str r6, [sp]
	bl gamesfx_play_cb
	movs r1, #1
	rsbs r3, r1, #0
	str r0, [r4]
	cmp r0, r3
	bne _0800979C
	b _0800950E
_0800979C:
	movs r0, #4
_0800979E:
	mov r4, sl
	str r0, [r4]
	b _0800950E
_080097A4:
	movs r1, #0x94
	lsls r3, r1, #1
	adds r0, r5, r3
	movs r6, #0xc8
	bl gamesfx_stop
	lsls r0, r6, #1
	adds r3, r0, r7
	mov r8, r3
	movs r2, #0x80
	lsls r1, r2, #7
	mov r0, r8
	movs r6, #0xca
	str r1, [r0]
	lsls r0, r6, #1
	movs r2, #0x40
	adds r6, r7, r0
	str r2, [r6]
	adds r0, r5, #0
	bl sub_08008FF8
	ldr r3, [r4, #4]
	lsls r0, r3, #6
	adds r1, r0, r3
	ldr r4, _080098C8
	lsls r2, r1, #3
	adds r1, r2, r4
	movs r0, #0xee
	lsls r3, r0, #1
	adds r2, r1, #0
	adds r2, #0xe0
	adds r0, r1, r3
	ldr r4, [r2]
	ldr r2, [r0]
	muls r4, r2, r4
	asrs r3, r4, #0x10
	cmp r3, r2
	ble _080097F2
	adds r3, r2, #0
_080097F2:
	movs r4, #0xca
	lsls r2, r4, #1
	adds r4, r1, r2
	ldr r2, [r4]
	subs r0, r2, r3
	asrs r3, r0, #3
	subs r0, r2, r3
	str r0, [r4]
	movs r0, #0xc6
	lsls r3, r0, #1
	ldr r0, [r6]
	adds r1, r7, r3
	ldr r3, [r1]
	str r0, [sp]
	mov r0, r8
	ldr r6, [r0]
	movs r4, #0x94
	lsls r2, r4, #1
	movs r1, #0x1e
	movs r0, #0
	adds r4, r5, r2
	str r6, [sp, #4]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r2, r5, #0
	movs r6, #2
	ldr r0, _080098CC
	ldr r1, _080098D4
	str r6, [sp, #8]
	bl gamesfx_play_cb
	movs r3, #1
	rsbs r2, r3, #0
	str r0, [r4]
	cmp r0, r2
	bne _0800983C
	b _0800950E
_0800983C:
	mov r2, sl
	str r6, [r2]
	b _0800950E
_08009842:
	movs r2, #0xcc
	lsls r3, r2, #1
	adds r4, r7, r3
	ldr r3, [r4]
	cmp r3, #2
	beq _080098EC
	cmp r3, #4
	beq _080098B8
	cmp r3, #6
	beq _080098A8
	cmp r3, #9
	beq _08009898
	cmp r3, #8
	beq _08009888
	cmp r3, #0xb
	beq _08009878
	cmp r3, #0xd
	beq _08009868
	b _0800950E
_08009868:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r5, r3
	bl gamesfx_stop
	movs r2, #0xc
	str r2, [r4]
	b _0800950E
_08009878:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r5, r1
	bl gamesfx_stop
	movs r2, #0xa
	str r2, [r4]
	b _0800950E
_08009888:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r5, r3
	bl gamesfx_stop
	movs r1, #7
	str r1, [r4]
	b _0800950E
_08009898:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r5, r3
	bl gamesfx_stop
	movs r2, #7
	str r2, [r4]
	b _0800950E
_080098A8:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r5, r1
	bl gamesfx_stop
	movs r2, #1
	str r2, [r4]
	b _0800950E
_080098B8:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r5, r3
	bl gamesfx_stop
	movs r1, #1
	str r1, [r4]
	b _0800950E
_080098C8:
	.4byte gRacerData
_080098CC:
	.4byte player_sfx_remote_vol_cb1
_080098D0:
	.4byte player_engine_sample_end
_080098D4:
	.4byte sub_08009420
_080098D8:
	.4byte gLocalPlayerIndex
_080098DC:
	.4byte gRacerObjects
_080098E0:
	.4byte player_sfx_remote_pitch_cb2
_080098E4:
	.4byte player_sfx_remote_vol_cb2
_080098E8:
	.4byte player_sfx_remote_pitch_cb1
_080098EC:
	movs r2, #0x94
	lsls r3, r2, #1
	adds r0, r5, r3
	bl gamesfx_stop
	movs r0, #1
	str r0, [r4]
	b _0800950E

	.global sub_080098FC
	.thumb_func
	.type sub_080098FC, %function
sub_080098FC: @ 080098FC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x54
	ldr r1, [r2, #8]
	ldrh r3, [r4]
	adds r3, r3, r1
	strh r3, [r4]
	adds r0, #0x56
	ldrh r3, [r0]
	ldr r2, [r2, #4]
	adds r1, r3, r2
	strh r1, [r0]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	.global act_player
	.thumb_func
	.type act_player, %function
act_player: @ 0800991C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xa0
	ldr r4, [r7, #4]
	lsls r0, r4, #6
	adds r2, r0, r4
	ldr r1, _08009B78
	lsls r0, r2, #3
	movs r2, #0xc
	adds r3, r0, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r1, _08009B7C
	adds r2, r0, r1
	sub sp, #8
	mov sb, r3
	mov r8, r2
	bl sub_08004428
	cmp r4, r0
	bne _08009956
	.2byte 0xF000, 0xFC0F @ bl #0x800a174
_08009956:
	ldr r0, _08009B80
	lsls r2, r4, #1
	ldrh r1, [r0, r2]
	mov r0, r8
	strh r1, [r0]
	ldr r1, _08009B84
	ldrh r0, [r1, r2]
	mov r1, r8
	strh r0, [r1, #2]
	bl sub_0800447C
	cmp r4, r0
	bne _08009974
	bl _0800A166
_08009974:
	ldr r3, [r7, #8]
	adds r3, #1
	cmp r3, #8
	bhi _080099BC
	ldr r1, _08009B88
	lsls r0, r3, #2
	ldr r4, [r0, r1]
	mov pc, r4
	.global _08009984
_08009984:
	.4byte _080099A8
	.4byte _08009BC0
	.4byte _08009D08
	.4byte _08009E78
	.4byte _08009FA4
	.4byte _0800A0A0
	.4byte _0800A0D6
	.4byte _0800A0F2
	.4byte _080099BC
	.global _080099A8
_080099A8:
	adds r0, r6, #0
	bl sub_080040A4
	movs r1, #0xcc
	lsls r4, r1, #1
	add r4, sb
	movs r0, #1
	movs r2, #0
	str r0, [r4]
	str r2, [r7, #8]
	.global _080099BC
_080099BC:
	movs r3, #0x96
	lsls r4, r3, #1
	adds r0, r6, r4
	movs r4, #0
	str r4, [r0]
	adds r0, r6, #0
	ldr r1, [r6, #0x24]
	adds r0, #0x84
	str r1, [r0]
	ldr r2, [r6, #0x28]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r6, #0x24]
	ldr r3, [r6, #0x3c]
	ldr r1, [r6, #0x28]
	str r2, [r6, #0x30]
	adds r2, r2, r3
	ldr r3, [r6, #0x40]
	str r2, [r6, #0x24]
	adds r2, r1, r3
	ldr r0, [r6, #0x2c]
	str r2, [r6, #0x28]
	ldr r2, [r6, #0x44]
	str r1, [r6, #0x34]
	adds r1, r0, r2
	str r0, [r6, #0x38]
	str r1, [r6, #0x2c]
	adds r0, r6, #0
	ldr r2, _08009B8C
	bl _call_via_r2
	ldr r1, [r7]
	ldr r3, _08009B90
	adds r2, r6, #0
	ands r1, r3
	adds r2, #0x90
	str r1, [r7]
	str r4, [r2]
	ldr r1, [r7]
	movs r0, #0x80
	lsls r3, r0, #0xe
	ands r1, r3
	cmp r1, #0
	beq _08009A2E
	movs r2, #0x84
	lsls r1, r2, #1
	adds r2, r6, r1
	ldrh r0, [r2]
	subs r0, #2
	lsls r1, r0, #0x10
	strh r0, [r2]
	cmp r1, #0
	bgt _08009A2E
	b _08009BA8
_08009A2E:
	ldr r1, [r7]
	movs r3, #0x80
	lsls r0, r3, #0xd
	ands r1, r0
	cmp r1, #0
	beq _08009A40
	adds r0, r6, #0
	bl sub_080041BC
_08009A40:
	ldr r3, [r7, #8]
	cmp r3, #1
	beq _08009A64
	cmp r3, #7
	beq _08009A5C
_08009A4A:
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08009A5C:
	ldr r0, [r6, #0x40]
	subs r0, #0x64
	str r0, [r6, #0x40]
	b _08009A4A
_08009A64:
	movs r0, #0x85
	lsls r1, r0, #1
	adds r2, r6, r1
	ldrh r4, [r2]
	cmp r4, #0
	beq _08009B5E
	mov r1, r8
	ldrh r4, [r1, #2]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	beq _08009A84
_08009A7E:
	ldr r2, [r7]
	orrs r2, r1
	str r2, [r7]
_08009A84:
	adds r0, r6, #0
	bl weaponManager
	movs r1, #0x81
	lsls r3, r1, #1
	adds r1, r6, r3
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #5
	bgt _08009AB2
	movs r2, #0x82
	lsls r4, r2, #1
	adds r2, r6, r4
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldrh r0, [r2]
	cmp r3, #0
	beq _08009B58
	subs r3, r0, #2
	lsls r0, r3, #0x10
	strh r3, [r2]
	cmp r0, #0
	ble _08009B4C
_08009AB2:
	mov r0, sb
	ldr r1, [r0, #0x54]
	subs r1, #2
	cmp r1, #1
	bhi _08009B48
	ldr r1, _08009B94
	ldr r0, [r1]
	ldr r2, [r6, #0x28]
	ldr r1, [r0, #0x28]
	subs r0, r1, r2
	ldr r1, _08009B98
	ldr r2, _08009B9C
	bl _call_via_r2
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
_08009AD2:
	mov r3, sb
	adds r3, #0xbc
	ldr r2, [r3]
	adds r1, r2, r0
	movs r0, #0
	str r1, [r7, #0x30]
	str r0, [r7, #0x28]
	ldr r2, _08009BA0
	ldr r1, [r7, #4]
	ldr r0, [r2]
	cmp r1, r0
	bne _08009A4A
	movs r3, #0xc0
	lsls r4, r3, #1
	add r4, sb
	ldr r0, [r4]
	cmp r0, #0
	beq _08009B18
	bl lfsr_next
	ldr r1, [r4]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	muls r1, r3, r1
	asrs r2, r1, #0x10
	ldr r1, [r7, #0x28]
	adds r0, r1, r2
	str r0, [r7, #0x28]
	ldr r1, _08009BA4
	ldr r2, [r4]
	muls r2, r1, r2
	asrs r0, r2, #0x10
	muls r0, r1, r0
	asrs r1, r0, #0x10
	str r1, [r4]
_08009B18:
	movs r1, #0xc2
	lsls r4, r1, #1
	add r4, sb
	ldr r0, [r4]
	cmp r0, #0
	beq _08009A4A
	bl lfsr_next
	ldr r1, [r4]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	muls r1, r3, r1
	asrs r2, r1, #0x10
	ldr r1, [r7, #0x28]
	adds r0, r1, r2
	str r0, [r7, #0x28]
	ldr r1, _08009BA4
	ldr r2, [r4]
	muls r2, r1, r2
	asrs r0, r2, #0x10
	muls r0, r1, r0
	asrs r2, r0, #0x10
	str r2, [r4]
	b _08009A4A
_08009B48:
	movs r0, #0
	b _08009AD2
_08009B4C:
	ldr r0, _08009B70
	strh r0, [r2]
	ldrh r2, [r1]
	adds r2, #1
	strh r2, [r1]
	b _08009AB2
_08009B58:
	ldr r0, _08009B74
	strh r0, [r2]
	b _08009AB2
_08009B5E:
	mov r0, r8
	ldrh r3, [r0]
	movs r1, #2
	adds r4, r1, #0
	ands r4, r3
	cmp r4, #0
	beq _08009A84
	b _08009A7E
	.byte 0x00, 0x00
_08009B70:
	.4byte 0x00000000
_08009B74:
	.4byte 0x0000001E
_08009B78:
	.4byte gRacerData
_08009B7C:
	.4byte 0x02004224
_08009B80:
	.4byte 0x0202DE48
_08009B84:
	.4byte 0x0202DE50
_08009B88:
	.4byte _08009984
_08009B8C:
	.4byte sub_03003750
_08009B90:
	.4byte 0xFFFCFFFF
_08009B94:
	.4byte 0x0200436C
_08009B98:
	.4byte 0x00002328
_08009B9C:
	.4byte atan2_fx
_08009BA0:
	.4byte gLocalPlayerIndex
_08009BA4:
	.4byte 0x0000E666
_08009BA8:
	strh r4, [r2]
	ldr r0, [r7]
	ldr r3, _08009BBC
	movs r1, #0xa0
	ands r0, r3
	str r0, [r7]
	lsls r0, r1, #1
	add r0, sb
	str r4, [r0]
	b _08009A2E
_08009BBC:
	.4byte 0xFFDFFFFF
	.global _08009BC0
_08009BC0:
	mov r4, r8
	ldrh r5, [r4]
	movs r2, #1
	ands r2, r5
	cmp r2, #0
	bne _08009BCE
	b _08009CFC
_08009BCE:
	movs r3, #0xfa
	adds r0, r3, r6
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov sl, r0
	ldrh r2, [r0]
	cmp r4, #0xfe
	bgt _08009BE4
	adds r0, r2, #2
	mov r2, sl
	strh r0, [r2]
_08009BE4:
	movs r4, #0xfa
	lsls r2, r4, #1
	add r2, sb
	movs r0, #0xe0
	ldr r4, [r2]
	add r0, sb
	movs r3, #0xaf
	mov fp, r0
	lsls r5, r3, #0x12
	adds r1, r4, #0
	cmp r4, #0
	bge _08009BFE
	b _08009CF8
_08009BFE:
	adds r0, r5, #0
	ldr r2, _08009C4C
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08009CF4
_08009C0E:
	mov r1, fp
	str r0, [r1]
	ldr r1, _08009C48
	mov r4, r8
	movs r0, #0
	mov r2, r8
	strh r1, [r2]
	strh r1, [r4, #2]
	str r0, [r4, #4]
	str r0, [r4, #8]
	mov r1, sb
	adds r0, r6, #0
	bl planeControl
	ldr r1, _08009C50
	ldr r4, [r7, #4]
	ldr r0, [r1]
	cmp r4, r0
	beq _08009CEA
	adds r0, r6, #0
	mov r1, sb
	bl player_engine_sound_remote
_08009C3C:
	ldr r2, _08009C54
	ldr r4, [r2]
	movs r0, #2
	ands r4, r0
	b _08009C58
	.byte 0x00, 0x00
_08009C48:
	.4byte 0x00000000
_08009C4C:
	.4byte udiv
_08009C50:
	.4byte gLocalPlayerIndex
_08009C54:
	.4byte gModeFlags
_08009C58:
	cmp r4, #0
	bne _08009C5E
	b _080099BC
_08009C5E:
	movs r0, #1
	str r0, [r7, #8]
	mov r1, sl
	ldrh r2, [r1]
	mov fp, r0
	subs r2, #0xa
	movs r0, #0xf0
	lsls r4, r2, #0x10
	lsls r1, r0, #0xd
	cmp r4, r1
	bls _08009C76
	b _080099BC
_08009C76:
	ldr r1, [r7, #4]
	lsls r0, r1, #6
	adds r4, r0, r1
	ldr r0, _08009DD4
	lsls r2, r4, #3
	adds r4, r2, r0
	ldr r0, [r4, #0x54]
	subs r0, #2
	movs r5, #0
	cmp r0, #1
	bhi _08009C8E
	b _080099BC
_08009C8E:
	ldr r2, [r4, #0x24]
	cmp r2, #1
	bne _08009C96
	b _080099BC
_08009C96:
	ldr r2, _08009DD8
	ldr r0, [r2]
	cmp r1, r0
	beq _08009CD4
_08009C9E:
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #1
	bl gamesfx_play_voice
	mov r3, fp
	movs r1, #0x14
	movs r0, #0x3c
	movs r2, #0x1e
	str r3, [r4, #0x24]
	str r1, [r4, #0x28]
	str r5, [r4, #0x38]
	str r5, [r4, #0x3c]
	str r5, [r4, #0x40]
	str r0, [r4, #0x44]
	str r2, [r4, #0x48]
	str r5, [r4, #0x50]
	ldr r0, [r7]
	ldr r1, _08009DDC
	ldr r3, _08009DE0
	ands r0, r1
	orrs r0, r3
	str r0, [r7]
	mov r0, sl
	strh r5, [r0]
	str r5, [r4, #0x4c]
	b _080099BC
_08009CD4:
	movs r1, #0xa
	movs r3, #0x80
	str r1, [sp]
	lsls r2, r3, #9
	movs r0, #0x9e
	movs r1, #0xb4
	movs r3, #1
	str r5, [sp, #4]
	bl gamesfx_play
	b _08009C9E
_08009CEA:
	adds r0, r6, #0
	mov r1, sb
	bl player_engine_sound_local
	b _08009C3C
_08009CF4:
	rsbs r0, r0, #0
	b _08009C0E
_08009CF8:
	rsbs r1, r4, #0
	b _08009BFE
_08009CFC:
	movs r1, #0xfa
	adds r3, r1, r6
	mov sl, r3
	mov r4, sl
	strh r2, [r4]
	b _08009BE4
	.global _08009D08
_08009D08:
	mov r1, r8
	ldrh r2, [r1]
	movs r4, #0x20
	ands r4, r2
	cmp r4, #0
	bne _08009D16
	b _08009E5C
_08009D16:
	ldr r2, _08009DE4
	str r2, [r1, #4]
_08009D1A:
	mov r0, r8
	ldrh r2, [r0]
	movs r1, #0x40
	ands r1, r2
	cmp r1, #0
	bne _08009D28
	b _08009E40
_08009D28:
	ldr r4, _08009DE4
	str r4, [r0, #8]
_08009D2C:
	ldr r0, [r7]
	movs r1, #0x80
	lsls r3, r1, #0x10
	ands r0, r3
	cmp r0, #0
	bne _08009D3A
	b _08009E36
_08009D3A:
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	bl planeControl
	ldr r3, _08009DD8
	ldr r0, [r7, #4]
	ldr r4, [r3]
	cmp r0, r4
	beq _08009E20
_08009D4E:
	ldr r1, [r7]
	movs r4, #0x80
	lsls r3, r4, #5
	ands r1, r3
	cmp r1, #0
	beq _08009D70
	adds r2, r6, #0
	adds r2, #0xfe
	ldrh r1, [r2]
	subs r1, #2
	lsls r0, r1, #0x10
	strh r1, [r2]
	cmp r0, #0
	ble _08009DEC
	adds r0, r6, #0
	bl sub_08003EBC
_08009D70:
	ldr r4, [r7]
	movs r1, #0x80
	lsls r0, r1, #6
	ands r4, r0
	cmp r4, #0
	beq _08009D8E
	movs r2, #0x80
	lsls r1, r2, #1
	adds r2, r6, r1
	ldrh r0, [r2]
	subs r0, #2
	lsls r4, r0, #0x10
	strh r0, [r2]
	cmp r4, #0
	ble _08009DAC
_08009D8E:
	ldr r3, _08009DD8
	ldr r1, [r7, #4]
	ldr r0, [r3]
	cmp r1, r0
	beq _08009DA2
	adds r0, r6, #0
	mov r1, sb
	bl player_engine_sound_remote
	b _080099BC
_08009DA2:
	adds r0, r6, #0
	mov r1, sb
	bl player_engine_sound_local
	b _080099BC
_08009DAC:
	ldr r4, _08009DD0
	strh r4, [r2]
	ldr r1, [r7]
	ldr r3, _08009DE8
	movs r0, #0x92
	ands r1, r3
	str r1, [r7]
	lsls r1, r0, #1
	movs r4, #0
	add r1, sb
	movs r3, #0xcc
	str r4, [r1]
	lsls r4, r3, #1
	add r4, sb
	movs r0, #1
	str r0, [r4]
	b _08009D8E
	.byte 0x00, 0x00
_08009DD0:
	.4byte 0x00000000
_08009DD4:
	.4byte gRacerData
_08009DD8:
	.4byte gLocalPlayerIndex
_08009DDC:
	.4byte 0xFFFFF3FF
_08009DE0:
	.4byte 0x01000040
_08009DE4:
	.4byte 0xFFFFFF00
_08009DE8:
	.4byte 0xFFFFDFFF
_08009DEC:
	ldr r4, _08009E14
	strh r4, [r2]
	ldr r1, [r7]
	ldr r3, _08009E18
	ands r1, r3
	str r1, [r7]
	ldr r2, _08009E1C
	ldr r4, [r7, #4]
	ldr r0, [r2]
	cmp r0, r4
	beq _08009E0C
	movs r3, #0xcc
	lsls r0, r3, #1
	add r0, sb
	movs r1, #1
	str r1, [r0]
_08009E0C:
	adds r0, r6, #0
	bl sub_08004128
	b _08009D70
_08009E14:
	.4byte 0x00000000
_08009E18:
	.4byte 0xFFFFEFFF
_08009E1C:
	.4byte gLocalPlayerIndex
_08009E20:
	ldr r1, [r7]
	movs r0, #0xc0
	lsls r4, r0, #1
	ands r1, r4
	cmp r1, #0
	bne _08009D4E
	adds r0, r6, #0
	mov r1, sb
	bl sub_08005BE0
	b _08009D4E
_08009E36:
	adds r0, r6, #0
	mov r1, sb
	bl sub_0800567C
	b _08009D3A
_08009E40:
	movs r1, #0x80
	ands r1, r2
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08009E56
	movs r4, #0x80
	lsls r2, r4, #1
	mov r1, r8
	str r2, [r1, #8]
	b _08009D2C
_08009E56:
	mov r2, r8
	str r3, [r2, #8]
	b _08009D2C
_08009E5C:
	movs r1, #0x10
	ands r1, r2
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08009E72
	movs r2, #0x80
	lsls r4, r2, #1
	mov r2, r8
	str r4, [r2, #4]
	b _08009D1A
_08009E72:
	mov r4, r8
	str r3, [r4, #4]
	b _08009D1A
	.global _08009E78
_08009E78:
	ldr r2, _08009EA8
	mov r4, r8
	strh r2, [r4]
	mov r0, r8
	movs r4, #0
	strh r2, [r0, #2]
	str r4, [r0, #4]
	str r4, [r0, #8]
	mov r1, sb
	adds r0, r6, #0
	bl sub_0800567C
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	bl planeControl
	ldr r0, [r7]
	movs r3, #0x80
	lsls r1, r3, #5
	ands r0, r1
	cmp r0, #0
	beq _08009EC2
	b _08009EAC
_08009EA8:
	.4byte 0x00000000
_08009EAC:
	adds r2, r6, #0
	adds r2, #0xfe
	ldrh r1, [r2]
	subs r1, #2
	lsls r0, r1, #0x10
	strh r1, [r2]
	cmp r0, #0
	ble _08009F74
	adds r0, r6, #0
	bl sub_08003EBC
_08009EC2:
	ldr r4, [r7]
	movs r0, #0x80
	lsls r3, r0, #6
	ands r4, r3
	cmp r4, #0
	beq _08009EE0
	movs r2, #0x80
	lsls r3, r2, #1
	adds r2, r6, r3
	ldrh r4, [r2]
	subs r4, #2
	lsls r1, r4, #0x10
	strh r4, [r2]
	cmp r1, #0
	ble _08009F3C
_08009EE0:
	adds r0, r6, #0
	mov r1, sb
	bl player_engine_sound_remote
	ldr r2, [r7]
	ldr r1, _08009F64
	movs r3, #0x80
	ands r1, r2
	lsls r0, r3, #8
	cmp r1, r0
	beq _08009F34
	ldr r4, _08009F68
	movs r1, #0x80
	ands r4, r2
	lsls r2, r1, #0xb
	cmp r4, r2
	beq _08009F04
	b _080099BC
_08009F04:
	ldr r3, [r7, #4]
	lsls r1, r3, #6
	adds r0, r1, r3
	ldr r4, _08009F6C
	lsls r1, r0, #3
	adds r0, r1, r4
	movs r4, #0xa4
	lsls r1, r4, #1
	adds r4, r0, r1
	movs r2, #3
	movs r1, #0x1e
	str r2, [r7, #8]
	str r1, [r4]
	movs r1, #0xcc
	lsls r2, r1, #1
	adds r1, r0, r2
	movs r0, #0x94
	movs r4, #0
	lsls r3, r0, #1
	str r4, [r1]
	adds r0, r6, r3
	bl gamesfx_stop
	b _080099BC
_08009F34:
	adds r0, r6, #0
	bl sub_0800B504
	b _080099BC
_08009F3C:
	ldr r1, _08009F60
	strh r1, [r2]
	ldr r4, [r7]
	ldr r0, _08009F70
	movs r3, #0x92
	ands r4, r0
	lsls r0, r3, #1
	str r4, [r7]
	add r0, sb
	movs r1, #0
	movs r4, #0xcc
	str r1, [r0]
	lsls r0, r4, #1
	add r0, sb
	movs r1, #1
	str r1, [r0]
	b _08009EE0
	.byte 0x00, 0x00
_08009F60:
	.4byte 0x00000000
_08009F64:
	.4byte 0x000081F0
_08009F68:
	.4byte 0x000401F0
_08009F6C:
	.4byte gRacerData
_08009F70:
	.4byte 0xFFFFDFFF
_08009F74:
	strh r4, [r2]
	ldr r1, [r7]
	ldr r3, _08009F9C
	ands r1, r3
	str r1, [r7]
	ldr r2, _08009FA0
	ldr r4, [r7, #4]
	ldr r0, [r2]
	cmp r0, r4
	beq _08009F92
	movs r1, #0xcc
	lsls r4, r1, #1
	add r4, sb
	movs r0, #1
	str r0, [r4]
_08009F92:
	adds r0, r6, #0
	bl sub_08004128
	b _08009EC2
	.byte 0x00, 0x00
_08009F9C:
	.4byte 0xFFFFEFFF
_08009FA0:
	.4byte gLocalPlayerIndex
	.global _08009FA4
_08009FA4:
	movs r1, #0
	movs r0, #0xa4
	str r1, [r6, #0x3c]
	str r1, [r6, #0x40]
	str r1, [r6, #0x44]
	lsls r2, r0, #1
	add r2, sb
	ldr r4, [r2]
	subs r4, #2
	mov sl, r2
	str r4, [r2]
	cmp r4, #0
	blt _0800A074
	adds r4, r6, #0
	adds r4, #0x54
	ldrh r1, [r4]
	lsls r2, r1, #0x10
	asrs r0, r2, #0x13
	subs r5, r1, r0
	strh r5, [r4]
	adds r1, r6, #0
	adds r1, #0x56
	ldrh r2, [r1]
	ldr r5, _0800A008
	adds r0, r2, r5
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r2, [r0]
	lsls r3, r2, #0x10
	asrs r3, r3, #0x13
	subs r2, r2, r3
	strh r2, [r0]
	ldrh r2, [r4]
	lsls r3, r2, #0x10
	asrs r3, r3, #0x13
	subs r2, r2, r3
	strh r2, [r4]
	ldrh r2, [r1]
	adds r4, r2, r5
	strh r4, [r1]
	ldrh r5, [r0]
	lsls r1, r5, #0x10
	asrs r2, r1, #0x13
	subs r4, r5, r2
	strh r4, [r0]
	ldr r0, [r7, #4]
	ldr r1, _0800A00C
	lsls r5, r0, #1
	b _0800A010
_0800A008:
	.4byte 0x00000800
_0800A00C:
	.4byte gGameSetup
_0800A010:
	adds r5, #4
	ldrsh r0, [r1, r5]
	bl char_info
	mov r1, sl
	ldr r3, [r1]
	ldr r1, _0800A184
	muls r1, r3, r1
	adds r2, r6, #0
	adds r2, #0x5a
	ldr r5, [r0, #0xc]
	ldrh r0, [r2]
	asrs r4, r1, #8
	movs r1, #0x18
	muls r4, r5, r4
	muls r1, r0, r1
	ldr r3, _0800A188
	asrs r5, r4, #8
	adds r4, r1, r3
	ldr r3, _0800A18C
	strh r5, [r4, #0xa]
	movs r2, #0
	movs r4, #0x18
	movs r1, #0x80
	mov ip, r2
	mov fp, r3
	mov sl, r4
	mov lr, r1
_0800A048:
	mov r2, fp
	ldrb r0, [r2, r0]
	cmp r0, #0xff
	beq _0800A06E
	mov r1, sl
	muls r1, r0, r1
	ldr r4, _0800A188
	adds r3, r1, r4
	ldrh r2, [r3, #6]
	mov r3, lr
	ands r3, r2
	cmp r3, #0
	beq _0800A066
	adds r2, r1, r4
	strh r5, [r2, #0xa]
_0800A066:
	mov r4, ip
	cmp r4, #0
	beq _0800A048
	b _080099BC
_0800A06E:
	movs r3, #1
	mov ip, r3
	b _0800A066
_0800A074:
	adds r0, r6, #0
	bl obj_remove_vector_hit
	adds r0, r6, #0
	bl obj_destroy_sprite
	ldr r3, _0800A190
	ldr r1, [r7, #4]
	ldr r4, [r3]
	cmp r1, r4
	beq _0800A09A
_0800A08A:
	movs r1, #0xa4
	lsls r0, r1, #1
	movs r2, #4
	add r0, sb
	movs r4, #0x1e
	str r2, [r7, #8]
	str r4, [r0]
	b _080099BC
_0800A09A:
	bl fade_to_black
	b _0800A08A
	.global _0800A0A0
_0800A0A0:
	movs r3, #0xa4
	lsls r4, r3, #1
	add r4, sb
	ldr r0, [r4]
	subs r0, #2
	str r0, [r4]
	cmp r0, #0
	ble _0800A0B2
	b _080099BC
_0800A0B2:
	ldr r3, _0800A190
	ldr r0, [r7, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _0800A0D0
_0800A0BC:
	ldr r0, [r7]
	movs r1, #0x80
	lsls r3, r1, #0xc
	orrs r0, r3
	movs r1, #5
	movs r2, #0x1e
	str r0, [r7]
	str r1, [r7, #8]
	str r2, [r4]
	b _080099BC
_0800A0D0:
	bl fade_to_normal
	b _0800A0BC
	.global _0800A0D6
_0800A0D6:
	movs r0, #0xa4
	lsls r2, r0, #1
	add r2, sb
	ldr r4, [r2]
	subs r4, #2
	str r4, [r2]
	cmp r4, #0
	ble _0800A0E8
	b _080099BC
_0800A0E8:
	movs r4, #6
	movs r1, #0
	str r4, [r7, #8]
	str r1, [r2]
	b _080099BC
	.global _0800A0F2
_0800A0F2:
	mov r0, r8
	ldrh r2, [r0]
	movs r1, #0x20
	ands r1, r2
	cmp r1, #0
	beq _0800A14A
	ldr r2, _0800A194
	str r2, [r0, #4]
_0800A102:
	mov r3, r8
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0800A12E
	ldr r2, _0800A194
	mov r4, r8
	str r2, [r4, #8]
_0800A114:
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	bl sub_080098FC
	cmp r0, #0
	bne _0800A126
	bl _080099BC
_0800A126:
	movs r4, #7
	str r4, [r7, #8]
	bl _080099BC
_0800A12E:
	movs r1, #0x80
	ands r1, r2
	lsls r4, r1, #0x10
	lsrs r3, r4, #0x10
	cmp r3, #0
	beq _0800A144
	movs r0, #0x80
	lsls r2, r0, #1
	mov r0, r8
	str r2, [r0, #8]
	b _0800A114
_0800A144:
	mov r1, r8
	str r3, [r1, #8]
	b _0800A114
_0800A14A:
	movs r4, #0x10
	ands r4, r2
	lsls r0, r4, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0800A160
	movs r1, #0x80
	lsls r2, r1, #1
	mov r1, r8
	str r2, [r1, #4]
	b _0800A102
_0800A160:
	mov r2, r8
	str r3, [r2, #4]
	b _0800A102
_0800A166:
	mov r2, r8
	ldrh r0, [r2]
	ldrh r1, [r2, #2]
	bl ghost_set_joy
	bl _08009974
	.byte 0x41, 0x46, 0x02, 0x31, 0x40, 0x46, 0xFA, 0xF7, 0x5F, 0xF8, 0x62, 0x00, 0xFF, 0xF7, 0xEE, 0xFB
_0800A184:
	.4byte 0x00000888
_0800A188:
	.4byte 0x02018F34
_0800A18C:
	.4byte 0x0201A734
_0800A190:
	.4byte gLocalPlayerIndex
_0800A194:
	.4byte 0xFFFFFF00

	.global react_player
	.thumb_func
	.type react_player, %function
react_player: @ 0800A198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	sub sp, #0x14
	adds r4, r1, #0
	cmp r5, #0
	bne _0800A1AE
	b _0800A668
_0800A1AE:
	cmp r4, #0
	bne _0800A1B4
	b _0800A650
_0800A1B4:
	adds r6, r5, #0
	adds r6, #0xa0
	ldr r2, [r6, #4]
	lsls r0, r2, #6
	adds r1, r0, r2
	lsls r3, r1, #3
	ldr r1, _0800A510
	mov ip, r1
	adds r1, r3, r1
	ldrb r3, [r4, #2]
	subs r3, #1
	cmp r3, #0x2d
	bls _0800A1D0
	b _0800A2D0
_0800A1D0:
	ldr r2, _0800A514
	lsls r3, r3, #2
	ldr r0, [r3, r2]
	mov pc, r0
	.global _0800A1D8
_0800A1D8:
	.4byte _0800A290
	.4byte _0800A37C
	.4byte _0800A2D0
	.4byte _0800A47C
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A4D8
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A530
	.4byte _0800A5DC
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A2D0
	.4byte _0800A638
	.4byte _0800A2D0
	.4byte _0800A640
	.4byte _0800A648
	.global _0800A290
_0800A290:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	blt _0800A31E
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r7, [r0]
	movs r2, #0x80
	lsls r1, r2, #5
	ands r7, r1
	cmp r7, #0
	beq _0800A300
	ldr r0, [r6]
	ldr r3, _0800A518
	ands r0, r3
	movs r1, #0
	cmp r0, #0
	beq _0800A2EA
_0800A2B2:
	cmp r1, #0
	beq _0800A2D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl voice_hit_victim
	adds r0, r4, #0
	adds r1, r5, #0
	bl voice_hit_attacker
	ldr r1, _0800A51C
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #6
	beq _0800A2E0
	.global _0800A2D0
_0800A2D0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800A2E0:
	adds r0, r5, #0
	ldr r1, _0800A520
	bl sub_08014264
	b _0800A2D0
_0800A2EA:
	ldr r1, [r6, #4]
	lsls r0, r1, #6
	adds r2, r0, r1
	lsls r1, r2, #3
	add r1, ip
	adds r0, r5, #0
	movs r2, #0
	bl player_hit
	movs r1, #1
	b _0800A2B2
_0800A300:
	ldr r1, [r6]
	movs r2, #0x80
	lsls r3, r2, #0xa
	ands r1, r3
	cmp r1, #0
	beq _0800A2D0
	ldr r3, _0800A524
	ldr r2, [r6, #4]
	ldr r1, [r3]
	cmp r2, r1
	beq _0800A404
	ldr r2, [r0, #4]
	cmp r2, r1
	beq _0800A2D0
	b _0800A3E2
_0800A31E:
	ldr r0, [r6]
	movs r3, #0x80
	lsls r2, r3, #5
	ands r0, r2
	cmp r0, #0
	beq _0800A338
	adds r3, r4, #0
	adds r3, #0xa0
	ldr r0, [r3]
	ands r0, r2
	cmp r0, #0
	bne _0800A338
	b _0800A46C
_0800A338:
	adds r0, r5, #0
	movs r2, #0
	bl player_hit
	adds r1, r5, #0
	adds r1, #0x90
	str r4, [r1]
	ldr r3, _0800A528
	ldr r0, [r6]
	ands r0, r3
	str r0, [r6]
	ldr r2, _0800A524
	ldr r1, [r6, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0800A454
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r3, #0x9f
	bl gamesfx_play_at
	b _0800A2D0
	.global _0800A37C
_0800A37C:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	blt _0800A41A
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r7, [r0]
	movs r2, #0x80
	lsls r1, r2, #5
	ands r7, r1
	cmp r7, #0
	beq _0800A3CA
	ldr r0, [r6]
	ldr r3, _0800A518
	ands r0, r3
	movs r1, #0
	cmp r0, #0
	beq _0800A3B4
_0800A39E:
	cmp r1, #0
	beq _0800A2D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl voice_hit_victim
	adds r0, r4, #0
	adds r1, r5, #0
	bl voice_hit_attacker
	b _0800A2D0
_0800A3B4:
	ldr r1, [r6, #4]
	lsls r0, r1, #6
	adds r2, r0, r1
	lsls r1, r2, #3
	add r1, ip
	adds r0, r5, #0
	movs r2, #0
	bl player_hit
	movs r1, #1
	b _0800A39E
_0800A3CA:
	ldr r0, [r6]
	movs r1, #0x80
	lsls r3, r1, #0xa
	ands r0, r3
	cmp r0, #0
	bne _0800A3D8
	b _0800A2D0
_0800A3D8:
	ldr r3, _0800A524
	ldr r1, [r6, #4]
	ldr r0, [r3]
	cmp r1, r0
	beq _0800A404
_0800A3E2:
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r3, #0xe0
	str r7, [sp, #0x10]
	bl gamesfx_play_at
	b _0800A2D0
_0800A404:
	movs r2, #0xa
	movs r3, #0x80
	str r2, [sp]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xe0
	movs r3, #1
	str r7, [sp, #4]
	bl gamesfx_play
	b _0800A2D0
_0800A41A:
	ldr r0, [r6]
	movs r3, #0x80
	lsls r2, r3, #5
	ands r0, r2
	cmp r0, #0
	beq _0800A432
	adds r3, r4, #0
	adds r3, #0xa0
	ldr r0, [r3]
	ands r0, r2
	cmp r0, #0
	beq _0800A46C
_0800A432:
	adds r0, r5, #0
	movs r2, #0
	bl player_hit
	adds r1, r5, #0
	adds r1, #0x90
	str r4, [r1]
	ldr r3, _0800A528
	ldr r0, [r6]
	ands r0, r3
	str r0, [r6]
	ldr r2, _0800A524
	ldr r1, [r6, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0800A454
	b _0800A2D0
_0800A454:
	movs r0, #0xa
	movs r2, #0
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x9f
	movs r3, #1
	bl gamesfx_play
	b _0800A2D0
_0800A46C:
	adds r2, r5, #0
	adds r2, #0x90
	str r4, [r2]
	ldr r3, _0800A528
	ldr r1, [r6]
	ands r1, r3
	str r1, [r6]
	b _0800A2D0
	.global _0800A47C
_0800A47C:
	adds r0, r5, #0
	adds r0, #0x90
	str r4, [r0]
	ldr r2, _0800A52C
	ldr r4, [r6]
	ands r4, r2
	cmp r4, #0
	beq _0800A48E
	b _0800A2D0
_0800A48E:
	adds r0, r5, #0
	movs r2, #1
	bl player_hit
	ldr r3, _0800A524
	ldr r0, [r6, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _0800A4C2
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r3, #0x9f
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	b _0800A2D0
_0800A4C2:
	movs r2, #0xa
	movs r3, #0x80
	str r2, [sp]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x9f
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	b _0800A2D0
	.global _0800A4D8
_0800A4D8:
	adds r0, r5, #0
	bl weaponAllocate
	cmp r0, #0
	bne _0800A4E4
	b _0800A2D0
_0800A4E4:
	ldr r1, [r6]
	movs r3, #1
	ands r1, r3
	cmp r1, #0
	bne _0800A4F0
	b _0800A2D0
_0800A4F0:
	movs r0, #0x21
	bl obj_new
	ldr r1, [r4, #0x24]
	str r1, [r0, #0x24]
	ldr r2, [r4, #0x28]
	str r2, [r0, #0x28]
	adds r2, r0, #0
	ldr r1, [r4, #0x2c]
	adds r2, #0xa0
	str r1, [r0, #0x2c]
	str r5, [r2, #0x10]
	movs r1, #0
	bl obj_initialise
	b _0800A2D0
_0800A510:
	.4byte gRacerData
_0800A514:
	.4byte _0800A1D8
_0800A518:
	.4byte 0x00801180
_0800A51C:
	.4byte gGameSetup
_0800A520:
	.4byte 0x00002666
_0800A524:
	.4byte gLocalPlayerIndex
_0800A528:
	.4byte 0xFFFEFFFF
_0800A52C:
	.4byte 0x00800180
	.global _0800A530
_0800A530:
	adds r7, r5, #0
	adds r7, #0x90
	str r4, [r7]
	adds r0, r4, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #0x4a
	mov r8, r1
	ldr r1, [r0]
	mov sl, r1
	ldr r1, [r6, #4]
	ldr r3, [r0, #4]
	lsls r0, r1, #6
	adds r4, r0, r1
	ldr r0, _0800A680
	lsls r2, r4, #3
	adds r4, r2, r0
	ldr r0, [r4, #0x54]
	subs r0, #2
	movs r7, #1
	mov sb, r3
	cmp r0, #1
	bhi _0800A562
	b _0800A2D0
_0800A562:
	ldr r2, [r4, #0x24]
	cmp r2, #1
	bne _0800A56A
	b _0800A2D0
_0800A56A:
	ldr r2, _0800A684
	ldr r0, [r2]
	cmp r1, r0
	beq _0800A5C4
_0800A572:
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #1
	bl gamesfx_play_voice
	movs r2, #0x14
	str r2, [r4, #0x28]
	mov r2, r8
	str r2, [r4, #0x38]
	movs r0, #0
	mov r3, sl
	mov r2, sb
	str r0, [r4, #0x40]
	str r3, [r4, #0x44]
	str r2, [r4, #0x48]
	str r0, [r4, #0x50]
	str r7, [r4, #0x24]
	str r7, [r4, #0x3c]
	ldr r3, _0800A688
	ldr r1, [r6]
	ands r1, r3
	ldr r3, _0800A68C
	adds r2, r5, #0
	orrs r1, r3
	adds r2, #0xfa
	str r1, [r6]
	strh r0, [r2]
	ldr r1, [r6, #4]
	movs r0, #0xc
	muls r1, r0, r1
	ldr r2, _0800A690
	ldrh r0, [r1, r2]
	adds r1, r7, #0
	ands r1, r0
	cmp r1, #0
	beq _0800A5C0
	movs r0, #2
	str r0, [r4, #0x4c]
	b _0800A2D0
_0800A5C0:
	str r7, [r4, #0x4c]
	b _0800A2D0
_0800A5C4:
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r0, #0x9e
	movs r1, #0xb4
	movs r3, #1
	bl gamesfx_play
	b _0800A572
	.global _0800A5DC
_0800A5DC:
	ldr r0, [r6]
	ldr r3, _0800A694
	adds r7, r4, #0
	ands r0, r3
	adds r7, #0xa0
	movs r1, #0
	cmp r0, #0
	beq _0800A622
_0800A5EC:
	cmp r1, #0
	bne _0800A5F2
	b _0800A2D0
_0800A5F2:
	ldr r0, [r7, #8]
	ldr r4, _0800A698
	lsls r1, r0, #2
	ldr r0, [r4, r1]
	adds r1, r5, #0
	bl voice_hit_victim
	ldr r2, [r7, #8]
	lsls r1, r2, #2
	ldr r0, [r4, r1]
	adds r1, r5, #0
	bl voice_hit_attacker
	ldr r0, _0800A69C
	movs r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #6
	beq _0800A618
	b _0800A2D0
_0800A618:
	adds r0, r5, #0
	ldr r1, _0800A6A0
	bl sub_08014264
	b _0800A2D0
_0800A622:
	ldr r1, [r6, #4]
	lsls r0, r1, #6
	adds r2, r0, r1
	lsls r1, r2, #3
	add r1, ip
	adds r0, r5, #0
	movs r2, #0
	bl player_hit
	movs r1, #1
	b _0800A5EC
	.global _0800A638
_0800A638:
	adds r0, r5, #0
	bl sub_0800A6C0
	b _0800A2D0
	.global _0800A640
_0800A640:
	adds r1, r5, #0
	adds r1, #0x90
	str r4, [r1]
	b _0800A2D0
	.global _0800A648
_0800A648:
	adds r0, r5, #0
	adds r0, #0x90
	str r4, [r0]
	b _0800A2D0
_0800A650:
	ldr r0, _0800A6A4
	ldr r1, _0800A6A8
	str r0, [sp]
	ldr r2, _0800A6AC
	ldr r0, _0800A6B0
	ldr r3, _0800A6B4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800A1B4
_0800A668:
	ldr r0, _0800A6B8
	ldr r1, _0800A6A8
	str r0, [sp]
	ldr r2, _0800A6AC
	ldr r0, _0800A6B0
	ldr r3, _0800A6BC
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800A1AE
_0800A680:
	.4byte gRacerData
_0800A684:
	.4byte gLocalPlayerIndex
_0800A688:
	.4byte 0xFFFFF3FF
_0800A68C:
	.4byte 0x01000040
_0800A690:
	.4byte 0x02004224
_0800A694:
	.4byte 0x00801180
_0800A698:
	.4byte gRacerObjects
_0800A69C:
	.4byte gGameSetup
_0800A6A0:
	.4byte 0x00001999
_0800A6A4:
	.4byte gUnk_08050120
_0800A6A8:
	.4byte gUnk_08050044
_0800A6AC:
	.4byte gUnk_0805012C
_0800A6B0:
	.4byte gUnk_0804FFFC
_0800A6B4:
	.4byte 0x00001688
_0800A6B8:
	.4byte gUnk_080500F8
_0800A6BC:
	.4byte 0x00001687

	.global sub_0800A6C0
	.thumb_func
	.type sub_0800A6C0, %function
sub_0800A6C0: @ 0800A6C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	ldr r3, _0800A770
	adds r5, #0xa0
	ldr r1, [r5, #4]
	ldr r0, [r3]
	sub sp, #0x14
	cmp r1, r0
	beq _0800A780
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #4
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	movs r3, #0xf1
	bl gamesfx_play_at
_0800A6F6:
	ldr r1, [r5]
	movs r0, #0x80
	lsls r3, r0, #5
	ands r1, r3
	cmp r1, #0
	beq _0800A70A
_0800A702:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_0800A70A:
	adds r0, r4, #0
	bl sub_08004168
	ldr r1, [r5]
	movs r2, #0x86
	lsls r0, r2, #6
	ands r0, r1
	cmp r0, #0
	beq _0800A730
_0800A71C:
	ldr r2, _0800A774
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #6
	bne _0800A702
	adds r0, r4, #0
	ldr r1, _0800A778
	bl sub_08014264
	b _0800A702
_0800A730:
	ldr r2, [r5, #4]
	lsls r3, r2, #6
	adds r3, r3, r2
	ldr r2, _0800A77C
	lsls r3, r3, #3
	adds r3, r3, r2
	movs r2, #0x80
	lsls r2, r2, #0xe
	orrs r1, r2
	str r1, [r5]
	movs r1, #0x84
	lsls r2, r1, #1
	adds r1, r4, r2
	ldr r2, _0800A76C
	strh r2, [r1]
	movs r2, #0xa0
	lsls r1, r2, #1
	adds r2, r3, r1
	str r0, [r2]
	movs r2, #0xf8
	adds r1, r3, #0
	lsls r0, r2, #1
	adds r3, r3, r0
	adds r1, #0xe0
	ldr r0, [r1]
	ldr r3, [r3]
	cmp r0, r3
	ble _0800A71C
	str r3, [r1]
	b _0800A71C
_0800A76C:
	.4byte 0x00000014
_0800A770:
	.4byte gLocalPlayerIndex
_0800A774:
	.4byte gGameSetup
_0800A778:
	.4byte 0x00000CCC
_0800A77C:
	.4byte gRacerData
_0800A780:
	movs r2, #4
	movs r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xf1
	bl gamesfx_play
	b _0800A6F6

	.global sub_0800A798
	.thumb_func
	.type sub_0800A798, %function
sub_0800A798: @ 0800A798
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r4, #0xa0
	ldr r3, [r4, #4]
	lsls r1, r3, #6
	adds r5, r1, r3
	ldr r1, _0800A7DC
	lsls r2, r5, #3
	adds r5, r2, r1
	movs r1, #0xcc
	lsls r2, r1, #1
	adds r1, r5, r2
	movs r2, #0
	str r2, [r1]
	movs r1, #0x94
	lsls r2, r1, #1
	adds r0, r0, r2
	bl gamesfx_stop
	ldr r1, [r4]
	movs r0, #0x80
	lsls r3, r0, #8
	orrs r1, r3
	movs r0, #2
	str r1, [r4]
	str r0, [r4, #8]
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _0800A7D6
	movs r0, #4
	str r0, [r5, #0x24]
_0800A7D6:
	pop {r4, r5}
	pop {r0}
	bx r0
_0800A7DC:
	.4byte gRacerData

	.global sub_0800A7E0
	.thumb_func
	.type sub_0800A7E0, %function
sub_0800A7E0: @ 0800A7E0
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r3, [r1]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r3, r2
	movs r2, #0x85
	str r3, [r1]
	lsls r3, r2, #1
	adds r2, r0, r3
	ldr r3, _0800A800
	movs r0, #2
	strh r3, [r2]
	str r0, [r1, #8]
	bx lr
	.byte 0x00, 0x00
_0800A800:
	.4byte 0x00000000

	.global sub_0800A804
	.thumb_func
	.type sub_0800A804, %function
sub_0800A804: @ 0800A804
	push {r4, lr}
	ldr r2, _0800A85C
	adds r1, r0, #0
	movs r0, #0
	ldrsh r3, [r2, r0]
	cmp r3, #5
	beq _0800A822
	adds r0, r1, #0
	adds r0, #0xa0
	ldr r1, [r0, #4]
	adds r1, #0x98
	ldrb r0, [r2, r1]
_0800A81C:
	pop {r4}
	pop {r1}
	bx r1
_0800A822:
	adds r0, r1, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	adds r3, #0x98
	ldrb r0, [r2, r3]
	cmp r0, #0
	beq _0800A81C
	adds r4, r2, #0
	adds r4, #0xa8
	ldrb r2, [r4]
	lsls r3, r2, #2
	ldr r2, _0800A860
	ldr r4, [r2, r3]
	movs r2, #0x8c
	lsls r2, r2, #1
	adds r3, r4, r2
	adds r2, r1, r2
	movs r1, #0
	ldrsh r2, [r2, r1]
	movs r4, #0
	ldrsh r3, [r3, r4]
	subs r3, r3, r2
	asrs r1, r3, #1
	adds r0, r0, r1
	cmp r0, #7
	ble _0800A81C
	movs r0, #7
	b _0800A81C
	.byte 0x00, 0x00
_0800A85C:
	.4byte gGameSetup
_0800A860:
	.4byte gRacerObjects

	.global sub_0800A864
	.thumb_func
	.type sub_0800A864, %function
sub_0800A864: @ 0800A864
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xa0
	ldr r3, [r5, #4]
	lsls r0, r3, #6
	adds r6, r0, r3
	ldr r1, _0800A8CC
	lsls r0, r6, #3
	adds r6, r0, r1
	movs r1, #0xcc
	lsls r0, r1, #1
	adds r1, r6, r0
	movs r0, #0x94
	lsls r2, r0, #1
	movs r6, #0
	adds r0, r4, r2
	str r6, [r1]
	bl gamesfx_stop
	ldr r0, [r5]
	movs r1, #0x80
	lsls r3, r1, #0xc
	movs r1, #0x85
	orrs r0, r3
	lsls r3, r1, #1
	movs r2, #3
	str r0, [r5]
	adds r0, r4, r3
	str r2, [r5, #8]
	strh r6, [r0]
	adds r0, r4, #0
	bl obj_remove_vector_hit
	adds r0, r4, #0
	bl obj_destroy_sprite
	ldr r2, _0800A8D0
	ldr r1, [r5, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0800A8BE
_0800A8B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800A8BE:
	movs r0, #0x2a
	bl obj_new
	movs r1, #8
	bl obj_initialise
	b _0800A8B8
_0800A8CC:
	.4byte gRacerData
_0800A8D0:
	.4byte gLocalPlayerIndex

	.global sub_0800A8D4
	.thumb_func
	.type sub_0800A8D4, %function
sub_0800A8D4: @ 0800A8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xa0
	mov r8, r1
	ldr r1, [r5, #4]
	lsls r0, r1, #6
	adds r4, r0, r1
	ldr r0, _0800A990
	adds r7, r2, #0
	lsls r2, r4, #3
	adds r4, r2, r0
	ldr r0, [r4, #0x54]
	subs r0, #2
	sub sp, #8
	mov sl, r3
	cmp r0, #1
	bls _0800A962
	ldr r2, [r4, #0x24]
	cmp r2, #1
	beq _0800A962
	ldr r2, _0800A994
	ldr r0, [r2]
	cmp r1, r0
	beq _0800A976
_0800A90C:
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #1
	bl gamesfx_play_voice
	movs r1, #0x14
	mov r3, r8
	str r1, [r4, #0x28]
	str r3, [r4, #0x3c]
	movs r1, #0
	mov r3, sl
	movs r0, #1
	str r0, [r4, #0x24]
	str r7, [r4, #0x38]
	str r1, [r4, #0x40]
	str r3, [r4, #0x44]
	ldr r2, [sp, #0x24]
	str r1, [r4, #0x50]
	str r2, [r4, #0x48]
	ldr r2, _0800A998
	ldr r3, [r5]
	ands r3, r2
	ldr r2, _0800A99C
	orrs r3, r2
	adds r2, r6, #0
	adds r2, #0xfa
	str r3, [r5]
	strh r1, [r2]
	ldr r1, [r5, #4]
	movs r2, #0xc
	muls r1, r2, r1
	ldr r3, _0800A9A0
	adds r2, r1, r3
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _0800A970
	ldrh r3, [r2]
	adds r1, r0, #0
	ands r1, r3
	cmp r1, #0
	beq _0800A960
	movs r0, #2
_0800A960:
	str r0, [r4, #0x4c]
_0800A962:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800A970:
	ldr r2, [sp, #0x28]
	str r2, [r4, #0x4c]
	b _0800A962
_0800A976:
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r0, #0x9e
	movs r1, #0xb4
	movs r3, #1
	bl gamesfx_play
	b _0800A90C
	.byte 0x00, 0x00
_0800A990:
	.4byte gRacerData
_0800A994:
	.4byte gLocalPlayerIndex
_0800A998:
	.4byte 0xFFFFF3FF
_0800A99C:
	.4byte 0x01000040
_0800A9A0:
	.4byte 0x02004224

	.global player_weapon_hit
	.thumb_func
	.type player_weapon_hit, %function
player_weapon_hit: @ 0800A9A4
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r1, #0xa0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _0800A9F4
	ldr r3, [r1]
	ands r3, r2
	movs r4, #0
	cmp r3, #0
	beq _0800A9C2
_0800A9BA:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_0800A9C2:
	ldr r2, [r1, #4]
	lsls r4, r2, #6
	adds r1, r4, r2
	lsls r3, r1, #3
	ldr r1, _0800A9F8
	adds r4, r3, r1
	cmp r5, #0
	beq _0800A9E8
	adds r1, r4, #0
	bl player_hit_spin
_0800A9D8:
	cmp r6, #0
	beq _0800A9E4
	movs r1, #0xc0
	lsls r3, r1, #1
	adds r0, r4, r3
	str r6, [r0]
_0800A9E4:
	movs r4, #1
	b _0800A9BA
_0800A9E8:
	adds r1, r4, #0
	movs r2, #0
	bl player_hit
	b _0800A9D8
	.byte 0x00, 0x00
_0800A9F4:
	.4byte 0x00801180
_0800A9F8:
	.4byte gRacerData

	.global sub_0800A9FC
	.thumb_func
	.type sub_0800A9FC, %function
sub_0800A9FC: @ 0800A9FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r3, [r4, #4]
	lsls r1, r3, #6
	adds r6, r1, r3
	ldr r1, _0800AA60
	lsls r2, r6, #3
	adds r6, r2, r1
	bl sub_0800A804
	ldr r3, _0800AA64
	muls r3, r0, r3
	movs r0, #0x96
	lsls r2, r0, #1
	muls r3, r2, r3
	asrs r1, r3, #0x10
	adds r0, r1, r2
	adds r1, r5, #0
	adds r1, #0xfe
	strh r0, [r1]
	movs r2, #0x80
	ldr r0, [r4]
	lsls r3, r2, #5
	orrs r0, r3
	str r0, [r4]
	ldr r0, _0800AA68
	ldr r2, [r0]
	ldr r0, [r4, #4]
	cmp r2, r0
	beq _0800AA52
	movs r0, #0xcc
	lsls r1, r0, #1
	adds r0, r6, r1
	movs r2, #0xc
	str r2, [r0]
_0800AA46:
	adds r0, r5, #0
	bl sub_080040F8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800AA52:
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r0, #0x10
	bl sub_0801E28C
	b _0800AA46
	.byte 0x00, 0x00
_0800AA60:
	.4byte gRacerData
_0800AA64:
	.4byte 0x00002492
_0800AA68:
	.4byte gLocalPlayerIndex

	.global booster_blue_sfx_end_cb
	.thumb_func
	.type booster_blue_sfx_end_cb, %function
booster_blue_sfx_end_cb: @ 0800AA6C
	push {lr}
	movs r0, #0x46
	bl sub_0801E074
	pop {r0}
	bx r0

	.global player_sfx_local_vol_cb2
	.thumb_func
	.type player_sfx_local_vol_cb2, %function
player_sfx_local_vol_cb2: @ 0800AA78
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	lsls r0, r3, #6
	adds r1, r0, r3
	ldr r0, _0800AAB4
	lsls r2, r1, #3
	adds r1, r2, r0
	movs r2, #0xee
	lsls r0, r2, #1
	adds r3, r1, #0
	adds r3, #0xe0
	adds r2, r1, r0
	ldr r2, [r2]
	ldr r0, [r3]
	muls r0, r2, r0
	asrs r3, r0, #0x10
	cmp r3, r2
	ble _0800AAA0
	adds r3, r2, #0
_0800AAA0:
	movs r2, #0xca
	lsls r0, r2, #1
	adds r2, r1, r0
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
_0800AAB4:
	.4byte gRacerData

	.global player_engine_sample_end
	.thumb_func
	.type player_engine_sample_end, %function
player_engine_sample_end: @ 0800AAB8
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	lsls r1, r3, #6
	adds r0, r1, r3
	lsls r1, r0, #3
	ldr r0, _0800AAE0
	movs r2, #0xcc
	adds r3, r1, r0
	lsls r0, r2, #1
	adds r2, r3, r0
	ldr r0, [r2]
	cmp r0, #9
	beq _0800AAD8
_0800AAD4:
	pop {r0}
	bx r0
_0800AAD8:
	movs r0, #8
	str r0, [r2]
	b _0800AAD4
	.byte 0x00, 0x00
_0800AAE0:
	.4byte gRacerData

	.global player_sfx_local_vol_cb1
	.thumb_func
	.type player_sfx_local_vol_cb1, %function
player_sfx_local_vol_cb1: @ 0800AAE4
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	lsls r1, r3, #6
	adds r0, r1, r3
	lsls r1, r0, #3
	ldr r0, _0800AB18
	adds r2, r1, r0
	ldr r1, [r2, #0x5c]
	cmp r1, #0
	ble _0800AB14
	movs r0, #0xa0
	muls r0, r1, r0
	asrs r3, r0, #8
_0800AB00:
	movs r1, #0xca
	lsls r0, r1, #1
	adds r2, r2, r0
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
_0800AB14:
	movs r3, #0xa0
	b _0800AB00
_0800AB18:
	.4byte gRacerData

	.global player_sfx_local_pitch_cb
	.thumb_func
	.type player_sfx_local_pitch_cb, %function
player_sfx_local_pitch_cb: @ 0800AB1C
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	lsls r1, r3, #6
	adds r0, r1, r3
	lsls r1, r0, #3
	ldr r0, _0800AB54
	adds r2, r1, r0
	ldr r1, [r2, #0x5c]
	cmp r1, #0
	ble _0800AB4E
	lsls r0, r1, #1
	adds r3, r0, r1
	lsls r0, r3, #0x10
	asrs r3, r0, #8
_0800AB3A:
	movs r1, #0xc8
	lsls r0, r1, #1
	adds r2, r2, r0
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
_0800AB4E:
	movs r1, #0xc0
	lsls r3, r1, #0xa
	b _0800AB3A
_0800AB54:
	.4byte gRacerData

	.global player_sfx_remote_vol_cb1
	.thumb_func
	.type player_sfx_remote_vol_cb1, %function
player_sfx_remote_vol_cb1: @ 0800AB58
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r0, r2, #6
	adds r1, r0, r2
	ldr r0, _0800ABAC
	lsls r2, r1, #3
	adds r1, r2, r0
	movs r2, #0xee
	lsls r0, r2, #1
	adds r3, r1, #0
	adds r2, r1, r0
	adds r3, #0xe0
	ldr r3, [r3]
	ldr r2, [r2]
	muls r3, r2, r3
	asrs r0, r3, #0x10
	cmp r0, r2
	ble _0800AB84
	adds r0, r2, #0
_0800AB84:
	movs r3, #0xca
	lsls r2, r3, #1
	adds r1, r1, r2
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r0, r3, #3
	subs r2, r2, r0
	movs r3, #0x98
	str r2, [r1]
	lsls r1, r3, #1
	adds r3, r4, r1
	ldr r1, [r3]
	movs r3, #0x80
	lsls r0, r3, #4
	subs r3, r0, r1
	muls r3, r2, r3
	asrs r0, r3, #0xb
	pop {r4}
	pop {r1}
	bx r1
_0800ABAC:
	.4byte gRacerData

	.global player_sfx_remote_vol_cb2
	.thumb_func
	.type player_sfx_remote_vol_cb2, %function
player_sfx_remote_vol_cb2: @ 0800ABB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xa0
	ldr r2, [r0, #4]
	lsls r1, r2, #6
	adds r0, r1, r2
	ldr r2, _0800ABF4
	lsls r1, r0, #3
	adds r0, r1, r2
	movs r1, #0xf0
	adds r2, r0, #0
	lsls r1, r1, #1
	adds r3, r0, r1
	adds r2, #0xe0
	ldr r0, [r2]
	ldr r1, [r3]
	adds r3, r1, #0
	muls r3, r0, r3
	asrs r0, r3, #0x10
	cmp r0, r1
	ble _0800ABDC
	adds r0, r1, #0
_0800ABDC:
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	movs r1, #0x80
	lsls r3, r1, #4
	subs r1, r3, r2
	muls r1, r0, r1
	asrs r0, r1, #0xb
	pop {r4}
	pop {r1}
	bx r1
_0800ABF4:
	.4byte gRacerData

	.global player_sfx_remote_pitch_cb1
	.thumb_func
	.type player_sfx_remote_pitch_cb1, %function
player_sfx_remote_pitch_cb1: @ 0800ABF8
	push {lr}
	ldr r2, _0800AC14
	adds r1, r0, #0
	ldr r0, [r2]
	ldr r2, _0800AC18
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r3, #0x80
	lsls r2, r3, #9
	bl sub_08020130
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0800AC14:
	.4byte gLocalPlayerIndex
_0800AC18:
	.4byte gRacerObjects

	.global player_sfx_remote_pitch_cb2
	.thumb_func
	.type player_sfx_remote_pitch_cb2, %function
player_sfx_remote_pitch_cb2: @ 0800AC1C
	push {lr}
	ldr r2, _0800AC38
	adds r1, r0, #0
	ldr r0, [r2]
	ldr r2, _0800AC3C
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r3, #0x80
	lsls r2, r3, #0xa
	bl sub_08020130
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0800AC38:
	.4byte gLocalPlayerIndex
_0800AC3C:
	.4byte gRacerObjects

	.global free_player
	.thumb_func
	.type free_player, %function
free_player: @ 0800AC40
	push {lr}
	movs r2, #0x94
	lsls r1, r2, #1
	adds r0, r0, r1
	bl gamesfx_stop
	pop {r0}
	bx r0

	.global aiPlayerInit
	.thumb_func
	.type aiPlayerInit, %function
aiPlayerInit: @ 0800AC50
	push {lr}
	ldr r2, _0800ACB4
	movs r1, #0
	ldrsh r0, [r2, r1]
	sub sp, #4
	cmp r0, #6
	beq _0800ACD4
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _0800ACE2
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _0800ACB8
	adds r0, #0x38
_0800AC76:
	ldr r1, [r3, r0]
	ldrh r3, [r1]
	ldr r0, _0800ACBC
	strh r3, [r0]
	ldrh r0, [r1, #2]
	ldr r2, _0800ACC0
	lsls r3, r0, #0x10
	strh r0, [r2]
	asrs r0, r3, #0x10
	movs r3, #0x2c
	muls r3, r0, r3
	ldr r2, _0800ACC4
	adds r1, #4
	str r1, [r2]
	adds r1, r1, r3
	ldr r3, _0800ACC8
	str r1, [r3]
	cmp r0, #0
	beq _0800ACDA
_0800AC9C:
	ldr r1, _0800ACB0
	mov r0, sp
	adds r0, #2
	strh r1, [r0]
	ldr r2, _0800ACCC
	ldr r1, _0800ACD0
	bl CpuSet
	b _0800ACD4
	.byte 0x00, 0x00
_0800ACB0:
	.4byte 0x00000000
_0800ACB4:
	.4byte gGameSetup
_0800ACB8:
	.4byte gUnk_087146C0
_0800ACBC:
	.4byte gAiPathHeader
_0800ACC0:
	.4byte gAiPathCount
_0800ACC4:
	.4byte gAiPathNodes
_0800ACC8:
	.4byte gAiPathLinks
_0800ACCC:
	.4byte 0x01000560
_0800ACD0:
	.4byte gAiRacers
_0800ACD4:
	add sp, #4
	pop {r0}
	bx r0
_0800ACDA:
	ldr r0, _0800ACF4
	bl AGBPrintf
	b _0800AC9C
_0800ACE2:
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _0800ACF8
	adds r0, #0x3c
	b _0800AC76
_0800ACF4:
	.4byte gUnk_0805013C
_0800ACF8:
	.4byte gUnk_087146C0
