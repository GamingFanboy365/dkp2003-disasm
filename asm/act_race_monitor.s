@ asm/act_race_monitor.s: ROM 0x011AAC-0x012430 (rom, VMA 0x08011AAC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_race_monitor
	.thumb_func
	.type init_race_monitor, %function
init_race_monitor: @ 08011AAC
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	bne _08011AB8
	b _08011BE0
_08011AB8:
	ldr r2, _08011AE4
	movs r0, #9
	strh r2, [r5]
	bl obj_new
	movs r1, #8
	bl obj_initialise
	movs r0, #0xd
	bl obj_new
	movs r1, #8
	bl obj_initialise
	ldr r4, _08011AE8
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldrh r2, [r4]
	cmp r1, #0
	bne _08011AE2
	b _08011BD0
_08011AE2:
	b _08011AEC
_08011AE4:
	.4byte 0x00000005
_08011AE8:
	.4byte gGameSetup
_08011AEC:
	lsls r4, r2, #0x10
	asrs r3, r4, #0x10
	cmp r3, #6
	beq _08011B10
	cmp r3, #1
	beq _08011B04
	movs r0, #0xe
	bl obj_new
	movs r1, #8
	bl obj_initialise
_08011B04:
	movs r0, #0xc
	bl obj_new
	movs r1, #8
	bl obj_initialise
_08011B10:
	ldr r4, _08011BFC
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #2
	beq _08011BC2
_08011B1A:
	movs r0, #5
	bl obj_new
	movs r1, #8
	bl obj_initialise
	ldr r0, _08011C00
	movs r2, #2
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #4
	orrs r1, r3
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa0
	movs r2, #3
	adds r1, r4, #0
	str r2, [r0]
	adds r1, #0x8c
	movs r2, #0
	str r2, [r1]
	movs r1, #0xa0
	str r1, [r0, #4]
	str r2, [r0, #8]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r1, #1
	beq _08011BB0
	adds r2, r4, #0
	adds r2, #0x86
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0x94
	muls r0, r1, r0
	ldr r3, _08011C04
	adds r0, #0x5c
_08011B64:
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _08011BA4
	ldm r1!, {r0}
	ldr r3, _08011C08
	str r0, [r3]
	ldr r3, _08011C0C
	str r1, [r3]
	cmp r0, #0
	beq _08011B9C
	ldr r0, _08011BFC
	adds r0, #0x88
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r2, #0
	cmp r2, r3
	bge _08011B9C
	ldrh r0, [r1, #6]
	ldr r1, _08011C10
	mov ip, r3
_08011B8C:
	ldm r1!, {r3}
	movs r4, #0x8d
	lsls r4, r4, #1
	adds r3, r3, r4
	adds r2, #1
	strh r0, [r3]
	cmp r2, ip
	blt _08011B8C
_08011B9C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08011BA4:
	ldr r3, _08011C08
	ldr r1, _08011C0C
	movs r0, #0
	str r0, [r3]
	str r0, [r1]
	b _08011B9C
_08011BB0:
	adds r2, r4, #0
	adds r2, #0x86
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #0x94
	muls r0, r1, r0
	ldr r3, _08011C04
	adds r0, #0x60
	b _08011B64
_08011BC2:
	movs r0, #0xb
	bl obj_new
	movs r1, #8
	bl obj_initialise
	b _08011B1A
_08011BD0:
	movs r0, #0xa
	bl obj_new
	movs r1, #8
	bl obj_initialise
	ldrh r2, [r4]
	b _08011AEC
_08011BE0:
	ldr r0, _08011C14
	movs r4, #0x80
	str r0, [sp]
	ldr r1, _08011C18
	ldr r0, _08011C1C
	ldr r2, _08011C20
	lsls r3, r4, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08011AB8
	.byte 0x00, 0x00
_08011BFC:
	.4byte gGameSetup
_08011C00:
	.4byte gFrameCount
_08011C04:
	.4byte gUnk_087146C0
_08011C08:
	.4byte 0x02023F8C
_08011C0C:
	.4byte 0x02023F88
_08011C10:
	.4byte gRacerObjects
_08011C14:
	.4byte gUnk_080509EC
_08011C18:
	.4byte gUnk_080509F8
_08011C1C:
	.4byte gUnk_08050A10
_08011C20:
	.4byte gUnk_08050A4C

	.global act_race_monitor
	.thumb_func
	.type act_race_monitor, %function
act_race_monitor: @ 08011C24
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	sub sp, #8
	cmp r5, #0
	bne _08011C30
	b _08011F28
_08011C30:
	ldr r2, _08011F44
	adds r4, r2, #0
	adds r4, #0x8c
	ldr r1, [r4]
	cmp r1, #6
	bls _08011C46
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r1, [r0, #8]
	adds r1, #2
	str r1, [r0, #8]
_08011C46:
	adds r0, r5, #0
	bl sub_080115A8
	bl fade_update
	ldr r3, [r4]
	cmp r3, #0xa
	bhi _08011CBA
	ldr r2, _08011F48
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.byte 0x00, 0x00
	.global _08011C60
_08011C60:
	.4byte _08011C8C
	.4byte _08011CC2
	.4byte _08011CFA
	.4byte _08011CBA
	.4byte _08011D3C
	.4byte _08011DAC
	.4byte _08011E04
	.4byte _08011CBA
	.4byte _08011E50
	.4byte _08011E94
	.4byte _08011F0E
	.global _08011C8C
_08011C8C:
	bl fade_to_normal
	movs r0, #7
	bl obj_new
	movs r1, #0
	bl obj_initialise
	movs r0, #1
	bl camera_op_set
	ldr r1, _08011F44
	movs r3, #1
	adds r1, #0x8c
	str r3, [r1]
	movs r0, #7
	movs r1, #0
	bl sub_0801E220
	adds r0, r5, #0
	adds r0, #0xa0
	movs r2, #0x78
	str r2, [r0, #4]
	.global _08011CBA
_08011CBA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.global _08011CC2
_08011CC2:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	cmp r3, #0
	ble _08011CCE
	b _08011E0E
_08011CCE:
	ldr r2, _08011F4C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08011CBA
	ldr r2, _08011F50
	ldrh r1, [r2]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08011CBA
	bl music_stop
	bl fade_to_black
	ldr r0, _08011F44
	movs r3, #2
	adds r0, #0x8c
	str r3, [r0]
	b _08011CBA
	.global _08011CFA
_08011CFA:
	ldr r2, _08011F4C
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08011CBA
	bl fade_to_normal
	ldr r0, _08011F54
	movs r2, #5
	ldr r1, [r0]
	rsbs r3, r2, #0
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	str r1, [r0]
	ldr r1, _08011F44
	movs r3, #4
	adds r1, #0x8c
	str r3, [r1]
	movs r0, #2
	bl camera_op_set
	movs r0, #8
	movs r1, #0
	bl sub_0801E220
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #0xa0
	str r0, [r1, #4]
	b _08011CBA
	.global _08011D3C
_08011D3C:
	ldr r1, _08011F4C
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	beq _08011D7C
	ldr r0, [r1]
	movs r2, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08011D7C
	ldr r0, [r1]
	subs r2, #0x81
	ands r0, r2
	str r0, [r1]
	ldr r1, _08011F58
	ldr r2, [r1]
	lsls r3, r2, #1
	ldr r2, _08011F44
	adds r3, #4
	ldrsh r0, [r2, r3]
	movs r1, #0x38
	muls r1, r0, r1
	ldr r3, _08011F5C
	adds r1, #0x24
	ldr r0, [r3, r1]
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
_08011D7C:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	cmp r3, #0
	bgt _08011E0E
	ldr r1, _08011F44
	movs r3, #5
	adds r1, #0x8c
	str r3, [r1]
	movs r1, #0x50
	str r1, [r0, #4]
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
	b _08011DF8
	.global _08011DAC
_08011DAC:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	cmp r3, #0
	bgt _08011E0E
	ldr r1, _08011F44
	movs r3, #6
	adds r1, #0x8c
	movs r2, #0x28
	str r3, [r1]
	str r2, [r0, #4]
	ldr r0, _08011F4C
	ldr r1, [r0]
	movs r2, #2
	orrs r1, r2
	str r1, [r0]
	ldr r1, [r0]
	subs r2, #0x43
	ands r1, r2
	str r1, [r0]
	ldr r0, _08011F54
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
_08011DF8:
	bl obj_new
	movs r1, #0
	bl obj_initialise
	b _08011CBA
	.global _08011E04
_08011E04:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	cmp r3, #0
	ble _08011E14
_08011E0E:
	subs r3, #2
	str r3, [r0, #4]
	b _08011CBA
_08011E14:
	ldr r4, _08011F44
	adds r2, r4, #0
	adds r2, #0x86
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _08011F60
	adds r1, #0x74
	ldr r0, [r3, r1]
	movs r1, #0
	bl sub_0801E220
	adds r1, r4, #0
	movs r2, #7
	adds r1, #0x8c
	str r2, [r1]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #2
	beq _08011E40
	b _08011CBA
_08011E40:
	ldr r2, _08011F58
	ldr r0, [r2]
	ldr r2, _08011F64
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	bl sub_0800B504
	b _08011CBA
	.global _08011E50
_08011E50:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	cmp r3, #0
	bgt _08011E5C
	b _08011CBA
_08011E5C:
	subs r3, #2
	str r3, [r0, #4]
	cmp r3, #0
	ble _08011E66
	b _08011CBA
_08011E66:
	ldr r2, _08011F58
	ldr r1, [r2]
	ldr r0, _08011F44
	adds r1, #0xa0
	ldrb r3, [r0, r1]
	cmp r3, #3
	bls _08011E82
	movs r0, #0xb
_08011E76:
	movs r1, #1
	bl sub_0801E220
_08011E7C:
	ldr r1, _08011F44
	movs r3, #9
	b _08011EF6
_08011E82:
	cmp r3, #0
	beq _08011E90
	movs r0, #0xa
	movs r1, #1
	bl sub_0801E220
	b _08011E7C
_08011E90:
	movs r0, #9
	b _08011E76
	.global _08011E94
_08011E94:
	bl music_current
	cmp r0, #0
	blt _08011F04
_08011E9C:
	ldr r7, _08011F68
	ldr r3, [r7]
	movs r4, #0
	cmp r4, r3
	bge _08011EC6
	ldr r0, _08011F64
	movs r6, #0xf0
	adds r1, r3, #0
_08011EAC:
	ldm r0!, {r3}
	movs r2, #0x8f
	lsls r2, r2, #1
	adds r3, r3, r2
	ldrb r2, [r3]
	adds r3, r6, #0
	ands r3, r2
	cmp r3, #0
	beq _08011EC0
	adds r4, #1
_08011EC0:
	subs r1, #1
	cmp r1, #0
	bne _08011EAC
_08011EC6:
	ldr r0, [r7]
	cmp r4, r0
	beq _08011ECE
	b _08011CBA
_08011ECE:
	ldr r2, _08011F4C
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08011EFC
_08011EDA:
	ldr r2, _08011F50
	ldr r1, _08011F6C
	ldrh r0, [r2]
	ands r1, r0
	cmp r1, #0
	bne _08011EE8
	b _08011CBA
_08011EE8:
	bl fade_to_black
	adds r0, r5, #0
	bl sub_0801194C
	ldr r1, _08011F44
	movs r3, #0xa
_08011EF6:
	adds r1, #0x8c
	str r3, [r1]
	b _08011CBA
_08011EFC:
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _08011EDA
_08011F04:
	movs r0, #3
	movs r1, #0
	bl sub_0801E220
	b _08011E9C
	.global _08011F0E
_08011F0E:
	ldr r1, _08011F4C
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	bne _08011F1E
	b _08011CBA
_08011F1E:
	ldr r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1]
	b _08011CBA
_08011F28:
	ldr r0, _08011F70
	movs r4, #0x99
	str r0, [sp]
	ldr r1, _08011F74
	ldr r0, _08011F78
	ldr r2, _08011F7C
	lsls r3, r4, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08011C30
	.byte 0x00, 0x00
_08011F44:
	.4byte gGameSetup
_08011F48:
	.4byte _08011C60
_08011F4C:
	.4byte gModeFlags
_08011F50:
	.4byte gKeysNew
_08011F54:
	.4byte gFrameCount
_08011F58:
	.4byte gLocalPlayerIndex
_08011F5C:
	.4byte gUnk_080511B4
_08011F60:
	.4byte gUnk_087146C0
_08011F64:
	.4byte gRacerObjects
_08011F68:
	.4byte 0x0202DE5C
_08011F6C:
	.4byte 0x0000030F
_08011F70:
	.4byte gUnk_080509EC
_08011F74:
	.4byte gUnk_080509F8
_08011F78:
	.4byte gUnk_08050A10
_08011F7C:
	.4byte gUnk_08050A60

	.global sub_08011F80
	.thumb_func
	.type sub_08011F80, %function
sub_08011F80: @ 08011F80
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov sl, r0
	mov r5, sl
	adds r5, #0xa0
	ldr r0, [r5, #0x70]
	sub sp, #0xc
	lsls r3, r0, #2
	str r2, [sp, #4]
	adds r2, r3, #0
	adds r2, #0x48
	str r3, [sp]
	ldr r3, [r5, r2]
	adds r2, r0, #1
	mov lr, r3
	str r1, [sp, #8]
	ldr r4, [r5, #0x6c]
	adds r3, r2, #0
	cmp r2, #0
	bge _08011FB2
	b _0801216A
_08011FB2:
	asrs r7, r3, #2
	lsls r6, r7, #2
	subs r1, r2, r6
	lsls r3, r1, #2
	mov fp, r3
	adds r2, r0, #2
	adds r3, #0x48
	ldr r6, [r5, r3]
	adds r3, r2, #0
	cmp r2, #0
	bge _08011FCA
	b _08012166
_08011FCA:
	asrs r1, r3, #2
	lsls r7, r1, #2
	subs r1, r2, r7
	lsls r3, r1, #2
	mov sb, r3
	adds r3, #0x48
	ldr r7, [r5, r3]
	adds r3, r0, #3
	adds r1, r3, #0
	cmp r3, #0
	bge _08011FE2
	b _08012162
_08011FE2:
	asrs r0, r1, #2
	lsls r2, r0, #2
	subs r0, r3, r2
	lsls r1, r0, #2
	adds r2, r1, #0
	adds r2, #0x48
	ldr r3, [r5, r2]
	lsls r2, r6, #1
	adds r0, r2, r6
	mov r8, r2
	mov r2, lr
	mov ip, r3
	subs r3, r0, r2
	lsls r0, r7, #1
	adds r2, r0, r7
	subs r0, r3, r2
	add r0, ip
	muls r0, r4, r0
	asrs r2, r0, #0xc
	muls r2, r4, r2
	asrs r0, r2, #0xc
	adds r2, r4, #0
	muls r2, r0, r2
	mov r3, lr
	asrs r0, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r6, #2
	adds r3, r6, r3
	subs r6, r2, r3
	lsls r3, r7, #2
	adds r2, r6, r3
	mov r3, ip
	subs r6, r2, r3
	adds r3, r4, #0
	muls r3, r6, r3
	asrs r6, r3, #0xc
	muls r6, r4, r6
	asrs r2, r6, #0xc
	adds r6, r0, r2
	mov r2, lr
	subs r3, r7, r2
	muls r3, r4, r3
	asrs r2, r3, #0xc
	adds r7, r6, r2
	ldr r6, [sp]
	adds r6, #0x58
	ldr r3, [r5, r6]
	mov lr, r3
	mov r3, fp
	adds r3, #0x58
	ldr r6, [r5, r3]
	adds r1, #0x58
	mov r3, sb
	ldr r1, [r5, r1]
	add r7, r8
	adds r3, #0x58
	asrs r0, r7, #1
	ldr r7, [r5, r3]
	lsls r3, r6, #1
	mov ip, r1
	adds r2, r3, r6
	mov r1, lr
	mov r8, r3
	subs r3, r2, r1
	lsls r1, r7, #1
	adds r2, r1, r7
	subs r1, r3, r2
	add r1, ip
	muls r1, r4, r1
	asrs r2, r1, #0xc
	muls r2, r4, r2
	asrs r1, r2, #0xc
	adds r2, r4, #0
	muls r2, r1, r2
	mov r3, lr
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r6, #2
	adds r3, r6, r3
	subs r2, r2, r3
	lsls r3, r7, #2
	adds r2, r2, r3
	mov r3, ip
	subs r2, r2, r3
	adds r3, r4, #0
	muls r3, r2, r3
	asrs r3, r3, #0xc
	muls r3, r4, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r2, lr
	subs r3, r7, r2
	muls r3, r4, r3
	asrs r2, r3, #0xc
	adds r4, r1, r2
	ldr r2, [sp, #8]
	str r0, [r2]
	add r4, r8
	ldr r3, [sp, #4]
	asrs r1, r4, #1
	str r1, [r3]
	mov r2, sl
	ldr r4, [r2, #0x24]
	ldr r3, [r2, #0x2c]
	subs r0, r0, r4
	subs r2, r1, r3
	asrs r4, r0, #8
	asrs r3, r2, #8
	adds r0, r3, #0
	muls r0, r3, r0
	adds r2, r4, #0
	muls r2, r4, r2
	asrs r1, r0, #8
	asrs r4, r2, #8
	adds r0, r4, r1
	cmp r0, #0x32
	ble _0801215E
	movs r3, #0x20
	rsbs r2, r3, #0
_080120D0:
	ldr r4, [r5, #0x74]
	lsls r1, r4, #1
	lsls r4, r2, #1
	adds r2, r1, r4
	cmp r2, #0
	ble _080120E2
	ldr r1, [r5, #0x6c]
	adds r0, r1, r2
	str r0, [r5, #0x6c]
_080120E2:
	movs r3, #0x80
	ldr r0, [r5, #0x6c]
	lsls r2, r3, #5
	cmp r0, r2
	blt _08012138
	ldr r0, _08012170
	ldr r2, [r5, #0x68]
	ldr r1, [r0]
	lsls r3, r2, #4
	adds r0, r1, r3
	movs r3, #4
	ldrsh r2, [r0, r3]
	lsls r3, r2, #4
	str r2, [r5, #0x68]
	adds r0, r1, r3
	ldr r3, [r5, #0x70]
	lsls r2, r3, #2
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r2, #0x48
	lsls r1, r3, #8
	str r1, [r5, r2]
	ldr r3, [r5, #0x70]
	lsls r2, r3, #2
	movs r1, #2
	ldrsh r3, [r0, r1]
	adds r2, #0x58
	lsls r1, r3, #8
	str r1, [r5, r2]
	ldr r1, [r5, #0x70]
	adds r2, r1, #1
	adds r3, r2, #0
	cmp r2, #0
	blt _0801215A
_08012126:
	asrs r1, r3, #2
	lsls r0, r1, #2
	subs r1, r2, r0
	str r1, [r5, #0x70]
	ldr r1, [r5, #0x30]
	movs r0, #0
	adds r1, #1
	str r0, [r5, #0x6c]
	str r1, [r5, #0x30]
_08012138:
	ldr r0, [r5, #0x74]
	adds r2, r0, r4
	str r2, [r5, #0x74]
	cmp r2, #0
	blt _08012154
_08012142:
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012154:
	movs r1, #0
	str r1, [r5, #0x74]
	b _08012142
_0801215A:
	adds r3, r1, #4
	b _08012126
_0801215E:
	movs r2, #0x20
	b _080120D0
_08012162:
	adds r1, r0, #6
	b _08011FE2
_08012166:
	adds r3, r0, #5
	b _08011FCA
_0801216A:
	adds r3, r0, #4
	b _08011FB2
	.byte 0x00, 0x00
_08012170:
	.4byte 0x02023F88

	.global sub_08012174
	.thumb_func
	.type sub_08012174, %function
sub_08012174: @ 08012174
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x56
	movs r0, #0
	ldrsh r7, [r2, r0]
	ldr r4, _0801229C
	adds r0, r7, #0
	bl _call_via_r4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	adds r0, r7, #0
	ldr r7, _080122A0
	bl _call_via_r7
	ldr r1, _080122A4
	lsls r5, r0, #0x10
	adds r7, r4, #0
	muls r7, r1, r7
	asrs r2, r5, #0x10
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r5, r7, #0xc
	ldr r7, [r6, #0x24]
	asrs r0, r3, #0xc
	adds r3, r7, r0
	adds r7, r6, #0
	adds r7, #0xa0
	ldr r1, _080122A8
	ldr r2, [r7, #0x20]
	lsls r0, r2, #4
	ldr r2, [r1]
	ldr r4, [r6, #0x2c]
	adds r6, r2, r0
	mov sl, r1
	movs r0, #4
	ldrsh r1, [r6, r0]
	mov ip, r3
	adds r3, r4, r5
	lsls r5, r1, #4
	movs r1, #0
	mov lr, r3
	adds r4, r2, r5
	mov r8, r1
	mov sb, sl
_080121DC:
	movs r3, #8
	ldrsh r2, [r6, r3]
	movs r0, #0xa
	ldrsh r3, [r6, r0]
	mov r1, ip
	muls r1, r2, r1
	mov r2, lr
	muls r2, r3, r2
	adds r3, r2, #0
	ldr r0, [r6, #0xc]
	asrs r3, r3, #8
	asrs r1, r1, #8
	adds r2, r1, r3
	adds r1, r2, r0
	movs r3, #8
	ldrsh r2, [r4, r3]
	mov fp, r1
	mov r1, ip
	muls r1, r2, r1
	movs r0, #0xa
	ldrsh r3, [r4, r0]
	adds r2, r1, #0
	mov r1, lr
	muls r1, r3, r1
	adds r3, r1, #0
	asrs r2, r2, #8
	asrs r3, r3, #8
	ldr r0, [r4, #0xc]
	adds r1, r2, r3
	mov r3, fp
	adds r2, r1, r0
	cmp r3, #0
	blt _08012222
	cmp r2, #0
	ble _08012294
_08012222:
	mov r1, sb
	ldr r2, [r1]
	adds r6, r2, r5
	movs r0, #4
	ldrsh r5, [r4, r0]
	lsls r0, r5, #4
	adds r5, r0, #0
	adds r4, r2, r5
_08012232:
	mov r1, r8
	cmp r1, #0
	beq _080121DC
	movs r2, #4
	ldrsh r1, [r4, r2]
	mov r0, sl
	ldr r2, [r0]
	lsls r3, r1, #4
	adds r2, r2, r3
	movs r0, #0
	ldrsh r3, [r6, r0]
	lsls r0, r3, #8
	mov r3, ip
	str r0, [r7, #0x48]
	str r3, [r7, #0x4c]
	movs r0, #0
	ldrsh r3, [r4, r0]
	lsls r0, r3, #8
	str r0, [r7, #0x50]
	movs r0, #0
	ldrsh r3, [r2, r0]
	lsls r0, r3, #8
	str r0, [r7, #0x54]
	movs r0, #2
	ldrsh r3, [r6, r0]
	lsls r0, r3, #8
	mov r3, lr
	str r0, [r7, #0x58]
	str r3, [r7, #0x5c]
	movs r0, #2
	ldrsh r3, [r4, r0]
	lsls r0, r3, #8
	str r0, [r7, #0x60]
	movs r0, #2
	ldrsh r3, [r2, r0]
	str r1, [r7, #0x68]
	lsls r2, r3, #8
	movs r1, #0
	str r2, [r7, #0x64]
	str r1, [r7, #0x70]
	str r1, [r7, #0x6c]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012294:
	movs r0, #1
	mov r8, r0
	b _08012232
	.byte 0x00, 0x00
_0801229C:
	.4byte cos_fx
_080122A0:
	.4byte sin_fx
_080122A4:
	.4byte 0x00004E20
_080122A8:
	.4byte 0x02023F88

	.global sub_080122AC
	.thumb_func
	.type sub_080122AC, %function
sub_080122AC: @ 080122AC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	add r1, sp, #4
	mov r2, sp
	adds r6, r0, #0
	bl sub_08011F80
	ldr r2, [r6, #0x2c]
	ldr r1, [sp, #4]
	ldr r4, [sp]
	ldr r5, [r6, #0x24]
	subs r0, r1, r5
	subs r1, r4, r2
	ldr r5, _0801230C
	bl _call_via_r5
	adds r6, #0x56
	adds r1, r0, #0
	ldrh r4, [r6]
	ldr r3, _08012310
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	mov r8, r3
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r8
	lsls r2, r0, #0x10
	asrs r3, r2, #0x13
	subs r1, r4, r3
	strh r1, [r6]
	ldrh r4, [r6]
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r8
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r4, r4, r1
	strh r4, [r6]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801230C:
	.4byte atan2_fx
_08012310:
	.4byte _03000814

	.global racemonitorBlueZingerProgress
	.thumb_func
	.type racemonitorBlueZingerProgress, %function
racemonitorBlueZingerProgress: @ 08012314
	push {r4, r5, r6, lr}
	ldr r1, _08012378
	adds r4, r0, #0
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r2, [r1, #8]
	sub sp, #4
	movs r5, #0
	cmp r0, r2
	beq _0801234C
	ldr r3, _0801237C
	lsls r2, r0, #2
	ldr r6, [r3, r2]
	movs r2, #0x8c
	lsls r2, r2, #1
	adds r3, r6, r2
	movs r6, #0
	ldrsh r2, [r3, r6]
	ldr r3, [r1, #0x30]
	subs r2, r2, r3
	cmp r2, #0
	blt _08012356
	cmp r2, #1
	bhi _0801234C
	str r0, [r1, #0xc]
	movs r5, #1
_0801234C:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_08012356:
	ldr r0, _08012380
	movs r3, #0x89
	str r0, [sp]
	ldr r1, _08012384
	ldr r0, _08012388
	ldr r2, _0801238C
	lsls r3, r3, #3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	adds r0, r4, #0
	movs r1, #0
	bl destroy_blue_zinger
	b _0801234C
_08012378:
	.4byte gGameSetup
_0801237C:
	.4byte gRacerObjects
_08012380:
	.4byte gUnk_08050A74
_08012384:
	.4byte gUnk_080509F8
_08012388:
	.4byte gUnk_08050A10
_0801238C:
	.4byte gUnk_08050A80

	.global act_random
	.thumb_func
	.type act_random, %function
act_random: @ 08012390
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0xa0
	ldr r3, [r4]
	cmp r3, #1
	beq _080123EE
	cmp r3, #1
	bgt _080123BC
	cmp r3, #0
	beq _080123AC
_080123A6:
	pop {r4}
	pop {r0}
	bx r0
_080123AC:
	movs r0, #1
	str r0, [r4]
	bl multi_lfsr_next
	lsrs r1, r0, #0xb
	adds r1, #0x20
	str r1, [r4, #4]
	b _080123A6
_080123BC:
	cmp r3, #2
	bne _080123A6
	adds r2, r1, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r1, _08012420
	adds r3, #8
	ldrh r2, [r1, r3]
	ldr r1, _08012424
	ands r1, r2
	lsls r3, r1, #5
	ldr r2, _08012428
	adds r3, #0x18
	ldr r1, [r2, r3]
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq _080123A6
	movs r1, #0
	str r1, [r4]
	bl spr_release_frame
	b _080123A6
_080123EE:
	ldr r3, [r4, #4]
	cmp r3, #0
	ble _080123FA
	subs r3, #1
	str r3, [r4, #4]
	b _080123A6
_080123FA:
	adds r3, r1, #0
	adds r3, #0x5a
	ldrh r0, [r3]
	adds r3, #0x42
	ldr r2, [r3]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #1]
	lsls r3, r2, #4
	ldr r2, _0801242C
	adds r3, #8
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _080123A6
	bl anim_get
	movs r1, #2
	str r1, [r4]
	b _080123A6
	.byte 0x00, 0x00
_08012420:
	.4byte gSprites
_08012424:
	.4byte 0x00007FFF
_08012428:
	.4byte gSpriteFrameCache
_0801242C:
	.4byte gUnk_08713650
