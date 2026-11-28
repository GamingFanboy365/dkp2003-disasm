@ asm/act_comp_player.s: ROM 0x00ACFC-0x00F0BC (rom, VMA 0x0800ACFC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_comp_player
	.thumb_func
	.type init_comp_player, %function
init_comp_player: @ 0800ACFC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x3c
	mov fp, r0
	cmp r0, #0
	bne _0800AD14
	.2byte 0xF000, 0xFBD2 @ bl #0x800b4b8
_0800AD14:
	ldr r2, _0800AD64
	movs r0, #0
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bne _0800AD20
	b _0800B4B0
_0800AD20:
	ldr r2, _0800AD60
	mov r1, fp
	strh r2, [r1]
	adds r1, #0xa0
	str r1, [sp, #0x1c]
	ldr r6, [r1, #4]
	movs r1, #0xac
	lsls r7, r1, #1
	muls r6, r7, r6
	ldr r0, _0800AD68
	adds r7, r6, r0
	mov r0, fp
	bl sub_080036BC
	str r0, [sp, #0x38]
	movs r5, #0xa8
	ldr r2, [r0, #0x74]
	lsls r4, r5, #1
	adds r1, r7, r4
	str r2, [r1]
	ldr r3, [sp, #0x38]
	movs r6, #0xaa
	ldr r0, [r3, #0x78]
	lsls r5, r6, #1
	adds r4, r7, r5
	str r0, [r4]
	ldr r2, _0800AD6C
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r4, #0
	b _0800AD70
	.byte 0x00, 0x00
_0800AD60:
	.4byte 0x00000001
_0800AD64:
	.4byte 0x020234AA
_0800AD68:
	.4byte 0x020234AC
_0800AD6C:
	.4byte gGameSetup
_0800AD70:
	cmp r3, #0
	bne _0800AD76
	b _0800B492
_0800AD76:
	cmp r3, #4
	bne _0800AD7C
	b _0800B492
_0800AD7C:
	cmp r3, #2
	bne _0800AD82
	b _0800B48E
_0800AD82:
	cmp r4, #0
	bne _0800AD88
	b _0800B474
_0800AD88:
	ldr r3, [sp, #0x1c]
	ldr r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, #4
	ldrsh r5, [r2, r0]
	lsls r6, r5, #2
	adds r6, #0x48
	ldr r0, [r2, r6]
	str r0, [r7, #0x10]
	cmp r0, #0
	beq _0800ADCA
	bl multi_lfsr_next
	ldr r5, [r4, #8]
	lsls r2, r5, #1
	muls r2, r0, r2
	ldr r0, [r7, #0x10]
	lsrs r6, r2, #0x10
	subs r1, r6, r5
	adds r5, r0, r1
	str r5, [r7, #0x10]
	ldr r6, [r4, #0xc]
	muls r6, r5, r6
	asrs r3, r6, #8
	str r3, [r7, #0x10]
	cmp r3, #0
	bge _0800ADC0
	b _0800B46E
_0800ADC0:
	movs r1, #0x80
	lsls r2, r1, #9
	cmp r3, r2
	ble _0800ADCA
	str r2, [r7, #0x10]
_0800ADCA:
	ldr r3, [r7, #0x10]
	ldr r5, [sp, #0x38]
	str r3, [sp, #0x20]
	ldr r1, [r5, #0x3c]
	ldr r2, [r4]
	ldr r0, [r4, #4]
	muls r2, r1, r2
	muls r0, r1, r0
	asrs r5, r2, #0x10
	asrs r3, r0, #0x10
	ldr r2, [sp, #0x20]
	subs r4, r5, r3
	muls r4, r2, r4
	movs r0, #0xa6
	movs r6, #0xa4
	mov sb, r3
	lsls r3, r0, #1
	adds r2, r3, r7
	lsls r1, r6, #1
	adds r6, r7, r1
	mov sl, r2
	asrs r1, r4, #0x10
	movs r2, #0x80
	subs r4, r5, r1
	lsls r3, r2, #0x15
	str r4, [r6]
	mov r8, r3
	adds r1, r4, #0
	cmp r4, #0
	bge _0800AE08
	b _0800B46A
_0800AE08:
	ldr r3, _0800AEF0
	mov r0, r8
	bl _call_via_r3
	mov r3, r8
	eors r3, r4
	cmp r3, #0
	bge _0800AE1A
	b _0800B466
_0800AE1A:
	mov r3, sl
	str r0, [r3]
	ldr r2, [sp, #0x38]
	movs r3, #0xa2
	ldr r0, [r2, #0x40]
	lsls r1, r3, #1
	adds r4, r7, r1
	str r0, [r4]
	ldr r3, [sp, #0x1c]
	ldr r1, [r3, #4]
	ldr r4, _0800AEF4
	lsls r2, r1, #1
	adds r2, #4
	ldrsh r1, [r4, r2]
	lsls r0, r1, #2
	adds r0, #0x48
	mov r3, sb
	ldr r2, [r4, r0]
	str r5, [sp]
	str r3, [sp, #4]
	ldr r0, [r6]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	ldr r0, _0800AEF8
	bl AGBPrintf
	ldr r3, [sp, #0x38]
	movs r4, #0x9e
	lsls r1, r4, #1
	ldr r2, [r3, #0x64]
	adds r5, r7, r1
	str r2, [r5]
	movs r4, #0xaf
	movs r0, #0x9c
	lsls r5, r4, #0x12
	ldr r4, [r6]
	adds r2, r0, r7
	mov r8, r2
	adds r1, r4, #0
	cmp r4, #0
	bge _0800AE6E
	b _0800B462
_0800AE6E:
	adds r6, r5, #0
	adds r0, r5, #0
	ldr r2, _0800AEF0
	eors r6, r4
	bl _call_via_r2
	cmp r6, #0
	bge _0800AE80
	b _0800B45E
_0800AE80:
	mov r1, r8
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xac
	str r0, [sp, #0x18]
	ldr r6, [sp, #0x38]
	adds r4, r7, #0
	ldr r5, [r6, #0x44]
	adds r4, #0xb0
	str r5, [r0]
	str r4, [sp, #0x14]
	ldr r1, [r6, #0x48]
	subs r0, #4
	str r1, [r4]
	str r0, [sp, #0x10]
	ldr r4, [r6, #0x48]
	ldr r2, [r6, #0x44]
	subs r5, r2, r4
	ldr r0, [sp, #0x10]
	asrs r6, r5, #1
	adds r1, r4, r6
	str r1, [r0]
	ldr r3, [sp, #0x1c]
	ldr r5, _0800AEEC
	ldrh r2, [r3, #0xe]
	strh r5, [r7]
	strh r2, [r7, #0xc]
	strh r2, [r7, #6]
	ldr r6, _0800AEFC
	movs r1, #0
	ldrsh r4, [r6, r1]
	movs r1, #0x2c
	adds r6, r4, #0
	muls r6, r1, r6
	ldr r3, _0800AF00
	mov sb, r3
	mov r0, sb
	ldr r2, [r0]
	adds r5, r2, r6
	str r5, [sp, #0x34]
	ldr r0, [r7, #0x10]
	asrs r1, r0, #1
	ldr r0, [r5, #0x24]
	adds r4, r1, #0
	muls r4, r0, r4
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r0, r3
	lsls r3, r4, #9
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r1, r4, #0xf
	b _0800AF04
	.byte 0x00, 0x00
_0800AEEC:
	.4byte 0x00000000
_0800AEF0:
	.4byte udiv
_0800AEF4:
	.4byte gGameSetup
_0800AEF8:
	.4byte gUnk_0805017C
_0800AEFC:
	.4byte 0x020234A8
_0800AF00:
	.4byte 0x020234A0
_0800AF04:
	adds r4, r0, r1
	bl multi_lfsr_next
	ldr r2, _0800B21C
	subs r3, r4, r5
	ands r2, r0
	muls r2, r3, r2
	asrs r1, r2, #0xf
	adds r2, r5, r1
	str r2, [sp, #0x2c]
	mov r1, sb
	ldr r5, [r1]
	adds r4, r5, r6
	ldrh r2, [r4, #6]
	ldr r0, _0800B220
	mov r8, r2
	ldr r1, [r0]
	mov r0, r8
	ldrh r5, [r4, #8]
	lsls r4, r0, #2
	adds r3, r4, r1
	ldrh r1, [r3]
	mov sl, r1
	cmp r5, #1
	ble _0800AFAA
	movs r4, #0
	cmp r5, #0
	beq _0800AF4C
	adds r1, r3, #2
	adds r2, r5, #0
_0800AF40:
	ldrh r6, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r6
	cmp r2, #0
	bne _0800AF40
_0800AF4C:
	movs r3, #0x80
	lsls r2, r3, #9
	mov sb, r2
	adds r1, r4, #0
	cmp r4, #0
	bge _0800AF5A
	b _0800B45A
_0800AF5A:
	mov r0, sb
	ldr r2, _0800B224
	bl _call_via_r2
	mov r3, sb
	eors r3, r4
	adds r6, r0, #0
	cmp r3, #0
	bge _0800AF6E
	b _0800B456
_0800AF6E:
	bl multi_lfsr_next
	movs r2, #0
	mov lr, r0
	movs r4, #0
	cmp r2, r5
	bge _0800AFAA
	ldr r1, _0800B220
	ldr r0, [r1]
	mov r1, r8
	lsls r3, r1, #2
	adds r1, r3, r0
	mov r3, r8
	adds r3, r3, r5
	lsls r3, r3, #2
	mov ip, r3
_0800AF8E:
	ldrh r3, [r1, #2]
	muls r3, r6, r3
	adds r4, r4, r3
	cmp lr, r4
	bge _0800AFA2
	ldrh r1, [r1]
	mov r2, ip
	mov sl, r1
	adds r1, r2, r0
	adds r2, r5, #0
_0800AFA2:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _0800AF8E
_0800AFAA:
	movs r1, #0x2c
	mov r6, sl
	muls r6, r1, r6
	ldr r3, _0800B228
	mov sb, r3
	mov r0, sb
	ldr r2, [r0]
	adds r5, r2, r6
	str r5, [sp, #0x30]
	ldr r0, [r7, #0x10]
	asrs r1, r0, #1
	ldr r0, [r5, #0x24]
	adds r4, r1, #0
	muls r4, r0, r4
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r0, r3
	lsls r3, r4, #9
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r2, r4, #0xf
	adds r4, r0, r2
	bl multi_lfsr_next
	ldr r1, _0800B21C
	subs r3, r4, r5
	ands r1, r0
	muls r1, r3, r1
	asrs r0, r1, #0xf
	adds r4, r5, r0
	str r4, [sp, #0x28]
	mov r1, sb
	ldr r2, [r1]
	adds r1, r2, r6
	ldrh r2, [r1, #6]
	ldr r0, _0800B220
	mov sl, r2
	ldr r5, [r0]
	mov r0, sl
	lsls r4, r0, #2
	adds r3, r4, r5
	ldrh r6, [r1, #8]
	ldrh r1, [r3]
	mov sb, r1
	cmp r6, #1
	ble _0800B07A
	movs r4, #0
	cmp r6, #0
	beq _0800B01C
	adds r1, r3, #2
	adds r2, r6, #0
_0800B010:
	ldrh r5, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r5
	cmp r2, #0
	bne _0800B010
_0800B01C:
	movs r3, #0x80
	lsls r5, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _0800B028
	b _0800B452
_0800B028:
	adds r0, r5, #0
	ldr r2, _0800B224
	bl _call_via_r2
	mov r8, r0
	adds r0, r5, #0
	eors r0, r4
	cmp r0, #0
	bge _0800B03C
	b _0800B44A
_0800B03C:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r6
	bge _0800B07A
	ldr r1, _0800B220
	mov r0, sl
	ldr r5, [r1]
	lsls r3, r0, #2
	adds r1, r3, r5
	adds r3, r0, r6
	lsls r3, r3, #2
	mov lr, r3
_0800B05A:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _0800B072
	ldrh r1, [r1]
	mov r2, lr
	mov sb, r1
	adds r1, r2, r5
	adds r2, r6, #0
_0800B072:
	adds r2, #1
	adds r1, #4
	cmp r2, r6
	blt _0800B05A
_0800B07A:
	movs r1, #0x2c
	mov r6, sb
	muls r6, r1, r6
	ldr r3, _0800B228
	mov r8, r3
	mov r0, r8
	ldr r2, [r0]
	ldr r5, [r7, #0x10]
	adds r3, r2, r6
	ldr r1, [r3, #0x24]
	asrs r0, r5, #1
	adds r4, r0, #0
	muls r4, r1, r4
	mov sb, r3
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r1, r3
	lsls r3, r4, #9
	subs r4, r3, r1
	muls r4, r0, r4
	asrs r0, r4, #0xf
	adds r4, r1, r0
	bl multi_lfsr_next
	ldr r2, _0800B21C
	subs r3, r4, r5
	ands r2, r0
	muls r2, r3, r2
	asrs r0, r2, #0xf
	adds r1, r5, r0
	str r1, [sp, #0x24]
	mov r1, r8
	ldr r2, [r1]
	adds r4, r2, r6
	ldrh r2, [r4, #6]
	ldr r0, _0800B220
	mov sl, r2
	ldr r1, [r0]
	mov r0, sl
	lsls r5, r0, #2
	adds r3, r5, r1
	ldrh r6, [r4, #8]
	ldrh r4, [r3]
	str r4, [sp, #0xc]
	cmp r6, #1
	ble _0800B14A
	movs r4, #0
	cmp r6, #0
	beq _0800B0EC
	adds r1, r3, #2
	adds r2, r6, #0
_0800B0E0:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _0800B0E0
_0800B0EC:
	movs r3, #0x80
	lsls r5, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _0800B0F8
	b _0800B446
_0800B0F8:
	ldr r2, _0800B224
	adds r0, r5, #0
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	mov r8, r0
	cmp r2, #0
	bge _0800B10C
	b _0800B43E
_0800B10C:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r6
	bge _0800B14A
	ldr r1, _0800B220
	mov r0, sl
	ldr r5, [r1]
	lsls r3, r0, #2
	adds r1, r3, r5
	adds r3, r0, r6
	lsls r3, r3, #2
	mov lr, r3
_0800B12A:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _0800B142
	ldrh r0, [r1]
	mov r2, lr
	str r0, [sp, #0xc]
	adds r1, r2, r5
	adds r2, r6, #0
_0800B142:
	adds r2, #1
	adds r1, #4
	cmp r2, r6
	blt _0800B12A
_0800B14A:
	ldr r3, [sp, #0xc]
	movs r2, #0x2c
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r6, _0800B228
	ldr r0, [r6]
	ldr r5, [r7, #0x10]
	adds r6, r0, r1
	ldr r0, [r6, #0x24]
	asrs r1, r5, #1
	adds r4, r1, #0
	muls r4, r0, r4
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r0, r3
	lsls r3, r4, #9
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r2, r4, #0xf
	adds r4, r0, r2
	bl multi_lfsr_next
	ldr r1, _0800B21C
	subs r4, r4, r5
	ands r1, r0
	muls r1, r4, r1
	ldr r3, [sp, #0x34]
	asrs r2, r1, #0xf
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	adds r5, r5, r2
	lsls r2, r0, #8
	movs r0, #0x18
	ldrsh r3, [r3, r0]
	ldr r0, [sp, #0x2c]
	muls r3, r0, r3
	asrs r1, r3, #8
	adds r0, r2, r1
	str r0, [r7, #0x20]
	ldr r0, [sp, #0x30]
	movs r3, #0x14
	ldrsh r1, [r0, r3]
	lsls r2, r1, #8
	movs r1, #0x18
	ldrsh r3, [r0, r1]
	ldr r1, [sp, #0x28]
	muls r3, r1, r3
	asrs r0, r3, #8
	adds r1, r2, r0
	str r1, [r7, #0x24]
	mov r3, sb
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	lsls r2, r0, #8
	movs r0, #0x18
	ldrsh r3, [r3, r0]
	ldr r0, [sp, #0x24]
	muls r3, r0, r3
	asrs r0, r3, #8
	adds r1, r2, r0
	str r1, [r7, #0x28]
	movs r3, #0x14
	ldrsh r0, [r6, r3]
	lsls r2, r0, #8
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	muls r1, r5, r1
	asrs r0, r1, #8
	adds r1, r2, r0
	str r1, [r7, #0x2c]
	ldr r1, [sp, #0x34]
	ldrh r2, [r1, #0x12]
	cmp r2, #0
	bne _0800B1E0
	b _0800B3FC
_0800B1E0:
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r2, r0, #8
_0800B1E6:
	str r2, [r7, #0x30]
	ldr r2, [sp, #0x30]
	ldrh r1, [r2, #0x12]
	cmp r1, #0
	bne _0800B1F2
	b _0800B3BA
_0800B1F2:
	movs r0, #2
	ldrsh r1, [r2, r0]
	lsls r2, r1, #8
_0800B1F8:
	str r2, [r7, #0x34]
	mov r2, sb
	ldrh r1, [r2, #0x12]
	cmp r1, #0
	bne _0800B204
	b _0800B378
_0800B204:
	movs r0, #2
	ldrsh r1, [r2, r0]
	lsls r2, r1, #8
_0800B20A:
	str r2, [r7, #0x38]
	ldrh r2, [r6, #0x12]
	cmp r2, #0
	bne _0800B214
	b _0800B336
_0800B214:
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r2, r1, #8
	b _0800B22C
_0800B21C:
	.4byte 0x00007FFF
_0800B220:
	.4byte 0x020234A4
_0800B224:
	.4byte udiv
_0800B228:
	.4byte 0x020234A0
_0800B22C:
	str r2, [r7, #0x3c]
	ldr r0, [sp, #0x34]
	movs r3, #0x16
	ldrsh r1, [r0, r3]
	lsls r2, r1, #8
	movs r1, #0x1a
	ldrsh r3, [r0, r1]
	ldr r1, [sp, #0x2c]
	muls r3, r1, r3
	asrs r0, r3, #8
	adds r1, r2, r0
	str r1, [r7, #0x40]
	ldr r3, [sp, #0x30]
	movs r1, #0x16
	ldrsh r0, [r3, r1]
	lsls r2, r0, #8
	movs r0, #0x1a
	ldrsh r3, [r3, r0]
	ldr r0, [sp, #0x28]
	muls r3, r0, r3
	asrs r1, r3, #8
	adds r0, r2, r1
	str r0, [r7, #0x44]
	mov r0, sb
	movs r3, #0x16
	ldrsh r1, [r0, r3]
	lsls r2, r1, #8
	movs r1, #0x1a
	ldrsh r3, [r0, r1]
	ldr r1, [sp, #0x24]
	muls r3, r1, r3
	asrs r1, r3, #8
	adds r0, r2, r1
	str r0, [r7, #0x48]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	movs r0, #0x1a
	ldrsh r1, [r6, r0]
	muls r1, r5, r1
	lsls r2, r3, #8
	asrs r0, r1, #8
	adds r1, r2, r0
	str r1, [r7, #0x4c]
	movs r1, #0
	str r1, [r7, #0x50]
	ldr r3, [sp, #0xc]
	str r3, [r7, #0x1c]
	mov r0, fp
	ldr r3, [r0, #0x24]
	mov r2, fp
	adds r2, #0x84
	str r3, [r2]
	ldr r3, [r0, #0x28]
	adds r2, #4
	str r3, [r2]
	ldr r3, [r0, #0x2c]
	adds r2, #4
	str r3, [r2]
	ldr r2, [r0, #0x24]
	str r2, [r0, #0x30]
	ldr r2, [r0, #0x28]
	str r2, [r0, #0x34]
	ldr r2, [r0, #0x2c]
	mov r3, fp
	str r2, [r0, #0x38]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	str r1, [r0, #0x44]
	ldrh r0, [r7, #0xc]
	adds r3, #0x54
	strh r1, [r3]
	adds r3, #2
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x88
	strh r1, [r3]
	lsls r3, r0, #1
	adds r0, r7, r3
	movs r2, #0x82
	str r1, [r0]
	lsls r0, r2, #1
	adds r2, r7, r0
	ldr r0, [sp, #0x38]
	ldr r3, [r0, #0x14]
	str r3, [r2]
	movs r2, #0xa0
	lsls r3, r2, #1
	adds r2, r7, r3
	ldr r3, [r0, #0x1c]
	str r3, [r2]
	movs r2, #0x94
	lsls r0, r2, #1
	movs r2, #1
	rsbs r2, r2, #0
	add r0, fp
	movs r3, #0x85
	str r2, [r0]
	lsls r0, r3, #1
	add r0, fp
	strh r1, [r0]
	adds r3, r7, #0
	adds r0, r7, #0
	adds r0, #0x80
	adds r3, #0x84
	str r1, [r7, #0x78]
	str r2, [r7, #0x7c]
	str r1, [r7, #0x54]
	str r1, [r7, #0x58]
	str r2, [r7, #0x5c]
	str r2, [r7, #0x60]
	str r1, [r7, #0x64]
	str r1, [r7, #0x68]
	str r2, [r7, #0x6c]
	str r2, [r7, #0x70]
	str r1, [r7, #0x74]
	str r2, [r0]
	str r1, [r3]
	adds r3, #4
	str r2, [r3]
	adds r3, #4
	str r2, [r3]
	str r1, [r7, #0x78]
	str r2, [r7, #0x7c]
	str r2, [r0]
_0800B324:
	add sp, #0x3c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800B336:
	ldr r4, [r7, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800B35C
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r3, [r2]
	ldr r2, [r0]
	subs r3, r3, r2
	muls r3, r1, r3
	asrs r0, r3, #0xf
	adds r2, r2, r0
	b _0800B22C
_0800B35C:
	cmp r1, #0
	blt _0800B366
	ldr r3, [sp, #0x10]
	ldr r2, [r3]
	b _0800B22C
_0800B366:
	ldr r0, [sp, #0x10]
	ldr r3, [r0]
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
	subs r0, r3, r2
	muls r0, r1, r0
	asrs r1, r0, #0xf
	adds r2, r3, r1
	b _0800B22C
_0800B378:
	ldr r4, [r7, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800B39E
	ldr r0, [sp, #0x18]
	ldr r3, [r0]
	ldr r0, [sp, #0x10]
	ldr r2, [r0]
	subs r3, r3, r2
	muls r3, r1, r3
	asrs r0, r3, #0xf
	adds r2, r2, r0
	b _0800B20A
_0800B39E:
	cmp r1, #0
	blt _0800B3A8
	ldr r3, [sp, #0x10]
	ldr r2, [r3]
	b _0800B20A
_0800B3A8:
	ldr r0, [sp, #0x10]
	ldr r3, [r0]
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
	subs r0, r3, r2
	muls r0, r1, r0
	asrs r1, r0, #0xf
	adds r2, r3, r1
	b _0800B20A
_0800B3BA:
	ldr r4, [r7, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800B3E0
	ldr r0, [sp, #0x18]
	ldr r3, [r0]
	ldr r0, [sp, #0x10]
	ldr r2, [r0]
	subs r3, r3, r2
	muls r3, r1, r3
	asrs r0, r3, #0xf
	adds r2, r2, r0
	b _0800B1F8
_0800B3E0:
	cmp r1, #0
	blt _0800B3EA
	ldr r3, [sp, #0x10]
	ldr r2, [r3]
	b _0800B1F8
_0800B3EA:
	ldr r0, [sp, #0x10]
	ldr r3, [r0]
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
	subs r0, r3, r2
	muls r0, r1, r0
	asrs r1, r0, #0xf
	adds r2, r3, r1
	b _0800B1F8
_0800B3FC:
	ldr r4, [r7, #0x10]
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r2, r4, #0
	muls r2, r1, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800B422
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r3, [r2]
	ldr r2, [r0]
	subs r3, r3, r2
	muls r3, r1, r3
	asrs r0, r3, #0xf
	adds r2, r2, r0
	b _0800B1E6
_0800B422:
	cmp r1, #0
	blt _0800B42C
	ldr r3, [sp, #0x10]
	ldr r2, [r3]
	b _0800B1E6
_0800B42C:
	ldr r0, [sp, #0x10]
	ldr r3, [r0]
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
	subs r0, r3, r2
	muls r0, r1, r0
	asrs r1, r0, #0xf
	adds r2, r3, r1
	b _0800B1E6
_0800B43E:
	mov r2, r8
	rsbs r2, r2, #0
	mov r8, r2
	b _0800B10C
_0800B446:
	rsbs r1, r4, #0
	b _0800B0F8
_0800B44A:
	mov r2, r8
	rsbs r2, r2, #0
	mov r8, r2
	b _0800B03C
_0800B452:
	rsbs r1, r4, #0
	b _0800B028
_0800B456:
	rsbs r6, r6, #0
	b _0800AF6E
_0800B45A:
	rsbs r1, r4, #0
	b _0800AF5A
_0800B45E:
	rsbs r0, r0, #0
	b _0800AE80
_0800B462:
	rsbs r1, r4, #0
	b _0800AE6E
_0800B466:
	rsbs r0, r0, #0
	b _0800AE1A
_0800B46A:
	rsbs r1, r4, #0
	b _0800AE08
_0800B46E:
	movs r0, #0
	str r0, [r7, #0x10]
	b _0800ADCA
_0800B474:
	ldr r5, _0800B4D4
	ldr r0, _0800B4D8
	ldr r1, _0800B4DC
	ldr r2, _0800B4E0
	ldr r3, _0800B4E4
	str r5, [sp]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r2, _0800B4E8
	b _0800AD88
_0800B48E:
	ldr r4, _0800B4EC
	b _0800AD82
_0800B492:
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _0800B4AC
	cmp r3, #1
	beq _0800B4A8
	cmp r3, #2
	beq _0800B4A4
	b _0800AD82
_0800B4A4:
	ldr r4, _0800B4F0
	b _0800AD82
_0800B4A8:
	ldr r4, _0800B4F4
	b _0800AD82
_0800B4AC:
	ldr r4, _0800B4F8
	b _0800AD82
_0800B4B0:
	mov r0, fp
	bl obj_free
	b _0800B324
	.byte 0x10, 0x48, 0x08, 0x49, 0x00, 0x90, 0x08, 0x4A, 0x05, 0x48, 0x0F, 0x4B, 0x26, 0xF0, 0xCA, 0xFF
	.byte 0x27, 0xF0, 0x5E, 0xF8, 0xFF, 0xEF, 0xFF, 0xF7, 0x21, 0xFC, 0x00, 0x00
_0800B4D4:
	.4byte gUnk_080501DC
_0800B4D8:
	.4byte gUnk_080501E0
_0800B4DC:
	.4byte gUnk_0805021C
_0800B4E0:
	.4byte gUnk_08050234
_0800B4E4:
	.4byte 0x00000171
_0800B4E8:
	.4byte gGameSetup
_0800B4EC:
	.4byte gUnk_0884E24C
_0800B4F0:
	.4byte gUnk_0884E20C
_0800B4F4:
	.4byte gUnk_0884E1FC
_0800B4F8:
	.4byte gUnk_0884E1EC
	.4byte gUnk_08050248
	.byte 0x3D, 0x01, 0x00, 0x00

	.global sub_0800B504
	.thumb_func
	.type sub_0800B504, %function
sub_0800B504: @ 0800B504
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x30
	mov r8, r0
	adds r0, #0xa0
	str r0, [sp, #0x14]
	ldr r7, [r0, #4]
	movs r0, #0xac
	lsls r1, r0, #1
	adds r2, r7, #0
	muls r2, r1, r2
	ldr r6, _0800B58C
	ldr r4, _0800B590
	lsls r5, r7, #1
	adds r1, r2, r6
	adds r5, #4
	mov sl, r1
	ldrsh r0, [r4, r5]
	bl char_info
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x14]
	mov r3, r8
	ldrh r6, [r0, #0xe]
	mov r4, sl
	mov r0, sl
	adds r3, #0x58
	strh r6, [r4, #0xc]
	ldrh r7, [r3]
	strh r6, [r0, #6]
	mov r3, r8
	ldr r6, _0800B588
	mov r2, sl
	adds r3, #0x54
	strh r6, [r2]
	strh r7, [r4, #2]
	ldrh r4, [r3]
	strh r4, [r0, #4]
	ldr r3, [sp, #0x14]
	ldr r5, [r3, #0x48]
	adds r2, #0x9c
	str r5, [r2]
	mov r0, r8
	ldr r1, [r0, #0x48]
	adds r2, #4
	str r1, [r2]
	ldr r7, [r0, #0x4c]
	adds r2, #4
	str r7, [r2]
	strb r6, [r0, #2]
	movs r0, #0xa4
	lsls r4, r0, #1
	ldr r0, [sp, #0x2c]
	ldr r5, [r0, #0x3c]
	add r4, sl
	str r5, [r4]
	movs r2, #0xa6
	ldr r4, [r0, #0x3c]
	movs r1, #0x80
	lsls r6, r2, #1
	b _0800B594
	.byte 0x00, 0x00
_0800B588:
	.4byte 0x00000002
_0800B58C:
	.4byte 0x020234AC
_0800B590:
	.4byte gGameSetup
_0800B594:
	lsls r5, r1, #0x15
	add r6, sl
	adds r1, r4, #0
	cmp r4, #0
	bge _0800B5A2
	.2byte 0xF000, 0xFC25 @ bl #0x800bdec
_0800B5A2:
	adds r7, r5, #0
	adds r0, r5, #0
	ldr r2, _0800B90C
	eors r7, r4
	bl _call_via_r2
	cmp r7, #0
	bge _0800B5B6
	.2byte 0xF000, 0xFC18 @ bl #0x800bde6
_0800B5B6:
	str r0, [r6]
	movs r5, #0xa8
	lsls r6, r5, #1
	ldr r5, [sp, #0x2c]
	ldr r4, [r5, #0x74]
	add r6, sl
	str r4, [r6]
	movs r3, #0xaa
	ldr r7, [r5, #0x78]
	lsls r0, r3, #1
	add r0, sl
	str r7, [r0]
	movs r1, #0xa2
	ldr r4, [r5, #0x40]
	lsls r6, r1, #1
	add r6, sl
	str r4, [r6]
	ldr r1, [sp, #0x14]
	movs r7, #0x80
	ldr r0, [r1]
	lsls r3, r7, #0x12
	orrs r0, r3
	str r0, [r1]
	bl multi_lfsr_next
	mov r1, sl
	str r0, [r1, #0x10]
	adds r1, #0xac
	str r1, [sp, #0x10]
	mov r2, sl
	ldr r4, [r5, #0x44]
	adds r2, #0xb0
	str r4, [r1]
	str r2, [sp, #0xc]
	mov r3, sl
	ldr r6, [r5, #0x48]
	adds r3, #0xa8
	str r6, [r2]
	str r3, [sp, #8]
	ldr r1, [r5, #0x48]
	ldr r2, [r5, #0x44]
	subs r7, r2, r1
	asrs r0, r7, #1
	ldr r6, [sp, #8]
	adds r4, r1, r0
	movs r3, #0
	str r4, [r6]
	ldr r5, _0800B910
	str r3, [sp, #0x18]
	ldr r2, _0800B914
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov lr, r2
	mov fp, lr
_0800B622:
	movs r4, #0x2c
	adds r6, r0, #0
	muls r6, r4, r6
	ldr r2, _0800B918
	ldr r1, [r2]
	adds r3, r1, r6
	movs r0, #0x1c
	ldrsh r5, [r3, r0]
	mov r0, r8
	ldr r6, [r0, #0x24]
	muls r5, r6, r5
	movs r1, #0x1e
	ldrsh r7, [r3, r1]
	asrs r2, r5, #8
	ldr r5, [r0, #0x2c]
	muls r7, r5, r7
	mov sb, r3
	mov r4, sb
	asrs r0, r7, #8
	ldr r1, [r4, #0x20]
	adds r7, r2, r0
	adds r0, r7, r1
	cmp r0, #0
	bge _0800B654
	b _0800BD3C
_0800B654:
	ldrh r7, [r4, #6]
	mov r1, lr
	ldr r0, [r1]
	lsls r2, r7, #2
	ldrh r3, [r2, r0]
	ldrh r4, [r4, #8]
	mov sb, r3
	cmp r4, #1
	ble _0800B6E6
	movs r5, #0
	cmp r4, #0
	beq _0800B682
	mov r0, fp
	ldr r6, [r0]
	adds r1, r2, r6
	adds r2, r1, #2
	adds r1, r4, #0
_0800B676:
	ldrh r0, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r0
	cmp r1, #0
	bne _0800B676
_0800B682:
	movs r3, #0x80
	lsls r2, r3, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0800B68E
	b _0800BD38
_0800B68E:
	ldr r6, _0800B90C
	adds r0, r2, #0
	str r2, [sp]
	bl _call_via_r6
	adds r6, r0, #0
	ldr r0, [sp]
	adds r1, r0, #0
	eors r1, r5
	cmp r1, #0
	bge _0800B6A6
	b _0800BD34
_0800B6A6:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r4
	blt _0800B6B6
	b _0800BD28
_0800B6B6:
	mov r3, fp
	ldr r2, _0800B914
	ldr r0, [r3]
	lsls r3, r7, #2
	mov lr, r2
	adds r2, r3, r0
	adds r3, r7, r4
	lsls r7, r3, #2
_0800B6C6:
	ldrh r3, [r2, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800B6D8
	ldrh r2, [r2]
	adds r1, r4, #0
	mov sb, r2
	adds r2, r7, r0
_0800B6D8:
	adds r1, #1
	adds r2, #4
	cmp r1, r4
	blt _0800B6C6
	mov r4, r8
	ldr r6, [r4, #0x24]
	ldr r5, [r4, #0x2c]
_0800B6E6:
	movs r4, #0x2c
	mov r0, sb
	adds r7, r0, #0
	muls r7, r4, r7
	ldr r2, _0800B918
	ldr r1, [r2]
	adds r3, r1, r7
	movs r1, #0x1c
	ldrsh r2, [r3, r1]
	movs r4, #0x1e
	ldrsh r7, [r3, r4]
	muls r2, r6, r2
	muls r7, r5, r7
	mov ip, r3
	mov r4, ip
	ldr r1, [r4, #0x20]
	asrs r6, r7, #8
	asrs r4, r2, #8
	adds r5, r4, r6
	adds r7, r5, r1
	cmp r7, #0
	bgt _0800B714
	b _0800BD22
_0800B714:
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne _0800B71C
	b _0800B622
_0800B71C:
	movs r2, #0x2c
	adds r7, r0, #0
	muls r7, r2, r7
	ldr r3, _0800B918
	ldr r0, [r3]
	adds r4, r0, r7
	ldrh r0, [r4, #6]
	mov r1, lr
	ldr r6, [r1]
	lsls r1, r0, #2
	adds r2, r1, r6
	ldrh r3, [r2]
	ldrh r7, [r4, #8]
	mov r8, r0
	mov sb, r3
	cmp r7, #1
	ble _0800B7AA
	movs r5, #0
	cmp r7, #0
	beq _0800B754
	adds r2, #2
	adds r1, r7, #0
_0800B748:
	ldrh r6, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r6
	cmp r1, #0
	bne _0800B748
_0800B754:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0800B760
	b _0800BD1E
_0800B760:
	adds r0, r4, #0
	ldr r2, _0800B90C
	bl _call_via_r2
	adds r6, r0, #0
	adds r0, r4, #0
	eors r0, r5
	cmp r0, #0
	bge _0800B774
	b _0800BD1A
_0800B774:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r7
	bge _0800B7AA
	ldr r3, _0800B914
	mov r0, r8
	ldr r2, [r3]
	lsls r3, r0, #2
	adds r4, r3, r2
	adds r3, r0, r7
	lsls r0, r3, #2
_0800B790:
	ldrh r3, [r4, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800B7A2
	ldrh r4, [r4]
	adds r1, r7, #0
	mov sb, r4
	adds r4, r0, r2
_0800B7A2:
	adds r1, #1
	adds r4, #4
	cmp r1, r7
	blt _0800B790
_0800B7AA:
	movs r1, #0x2c
	mov r6, sb
	muls r6, r1, r6
	ldr r4, _0800B918
	ldr r2, [r4]
	adds r3, r2, r6
	mov sb, r3
	mov r3, sl
	ldr r5, [r3, #0x10]
	mov r0, sb
	ldr r1, [r0, #0x24]
	asrs r2, r5, #1
	adds r0, r2, #0
	muls r0, r1, r0
	movs r4, #0x80
	asrs r3, r0, #0xf
	lsls r0, r4, #9
	subs r4, r0, r1
	muls r4, r2, r4
	asrs r2, r4, #0xf
	subs r5, r1, r3
	adds r4, r1, r2
	bl multi_lfsr_next
	ldr r2, _0800B91C
	ands r2, r0
	subs r0, r4, r5
	muls r2, r0, r2
	asrs r4, r2, #0xf
	adds r1, r5, r4
	str r1, [sp, #0x24]
	ldr r3, _0800B918
	ldr r2, [r3]
	adds r0, r2, r6
	ldrh r2, [r0, #6]
	ldr r4, _0800B914
	mov r8, r2
	ldr r5, [r4]
	mov r4, r8
	lsls r1, r4, #2
	adds r2, r1, r5
	ldrh r6, [r0, #8]
	ldrh r0, [r2]
	mov fp, r0
	cmp r6, #1
	ble _0800B874
	movs r5, #0
	cmp r6, #0
	beq _0800B81C
	adds r2, #2
	adds r1, r6, #0
_0800B810:
	ldrh r7, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r7
	cmp r1, #0
	bne _0800B810
_0800B81C:
	movs r3, #0x80
	lsls r4, r3, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0800B828
	b _0800BD16
_0800B828:
	adds r0, r4, #0
	ldr r2, _0800B90C
	bl _call_via_r2
	adds r7, r0, #0
	adds r0, r4, #0
	eors r0, r5
	cmp r0, #0
	bge _0800B83C
	b _0800BD12
_0800B83C:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r6
	bge _0800B874
	ldr r4, _0800B914
	ldr r2, [r4]
	mov r4, r8
	lsls r0, r4, #2
	adds r4, r0, r2
	mov r0, r8
	adds r3, r0, r6
	lsls r0, r3, #2
_0800B85A:
	ldrh r3, [r4, #2]
	muls r3, r7, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800B86C
	ldrh r4, [r4]
	adds r1, r6, #0
	mov fp, r4
	adds r4, r0, r2
_0800B86C:
	adds r1, #1
	adds r4, #4
	cmp r1, r6
	blt _0800B85A
_0800B874:
	movs r0, #0x2c
	mov r6, fp
	muls r6, r0, r6
	ldr r1, _0800B918
	ldr r4, [r1]
	adds r2, r4, r6
	str r2, [sp, #0x28]
	mov r3, sl
	mov r8, r1
	ldr r5, [sp, #0x28]
	ldr r1, [r3, #0x10]
	asrs r2, r1, #1
	ldr r1, [r5, #0x24]
	adds r0, r2, #0
	muls r0, r1, r0
	movs r4, #0x80
	asrs r3, r0, #0xf
	lsls r0, r4, #9
	subs r4, r0, r1
	muls r4, r2, r4
	asrs r0, r4, #0xf
	subs r5, r1, r3
	adds r4, r1, r0
	bl multi_lfsr_next
	ldr r1, _0800B91C
	subs r3, r4, r5
	ands r1, r0
	muls r1, r3, r1
	asrs r2, r1, #0xf
	adds r1, r5, r2
	str r1, [sp, #0x20]
	mov r1, r8
	ldr r4, [r1]
	adds r0, r4, r6
	ldrh r2, [r0, #6]
	mov r8, r2
	ldr r2, _0800B914
	mov r4, r8
	ldr r5, [r2]
	lsls r1, r4, #2
	adds r2, r1, r5
	ldrh r6, [r0, #8]
	ldrh r0, [r2]
	mov fp, r0
	cmp r6, #1
	ble _0800B958
	movs r5, #0
	cmp r6, #0
	beq _0800B8E8
	adds r2, #2
	adds r1, r6, #0
_0800B8DC:
	ldrh r7, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r7
	cmp r1, #0
	bne _0800B8DC
_0800B8E8:
	movs r3, #0x80
	lsls r4, r3, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0800B8F4
	b _0800BD0E
_0800B8F4:
	adds r0, r4, #0
	ldr r2, _0800B90C
	bl _call_via_r2
	adds r1, r4, #0
	eors r1, r5
	adds r7, r0, #0
	cmp r1, #0
	bge _0800B908
	b _0800BD0A
_0800B908:
	b _0800B920
	.byte 0x00, 0x00
_0800B90C:
	.4byte udiv
_0800B910:
	.4byte 0x020234A8
_0800B914:
	.4byte 0x020234A4
_0800B918:
	.4byte 0x020234A0
_0800B91C:
	.4byte 0x00007FFF
_0800B920:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r6
	bge _0800B958
	ldr r4, _0800BC98
	ldr r2, [r4]
	mov r4, r8
	lsls r0, r4, #2
	adds r4, r0, r2
	mov r0, r8
	adds r3, r0, r6
	lsls r0, r3, #2
_0800B93E:
	ldrh r3, [r4, #2]
	muls r3, r7, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800B950
	ldrh r4, [r4]
	adds r1, r6, #0
	mov fp, r4
	adds r4, r0, r2
_0800B950:
	adds r1, #1
	adds r4, #4
	cmp r1, r6
	blt _0800B93E
_0800B958:
	movs r4, #0x2c
	mov r6, fp
	muls r6, r4, r6
	ldr r1, _0800BC9C
	ldr r2, [r1]
	adds r3, r2, r6
	mov fp, r3
	mov r3, sl
	ldr r5, [r3, #0x10]
	mov r0, fp
	mov r8, r1
	ldr r1, [r0, #0x24]
	asrs r2, r5, #1
	adds r0, r2, #0
	muls r0, r1, r0
	movs r4, #0x80
	asrs r3, r0, #0xf
	lsls r0, r4, #9
	subs r4, r0, r1
	muls r4, r2, r4
	asrs r0, r4, #0xf
	subs r5, r1, r3
	adds r4, r1, r0
	bl multi_lfsr_next
	ldr r2, _0800BCA0
	subs r3, r4, r5
	ands r2, r0
	muls r2, r3, r2
	asrs r0, r2, #0xf
	adds r1, r5, r0
	str r1, [sp, #0x1c]
	mov r1, r8
	ldr r5, [r1]
	adds r4, r5, r6
	ldrh r2, [r4, #6]
	mov r8, r2
	ldr r2, _0800BC98
	ldrh r6, [r4, #8]
	ldr r1, [r2]
	mov r4, r8
	lsls r0, r4, #2
	adds r2, r0, r1
	ldrh r5, [r2]
	str r5, [sp, #4]
	cmp r6, #1
	ble _0800BA24
	movs r5, #0
	cmp r6, #0
	beq _0800B9CC
	adds r2, #2
	adds r1, r6, #0
_0800B9C0:
	ldrh r7, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r7
	cmp r1, #0
	bne _0800B9C0
_0800B9CC:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0800B9D8
	b _0800BD06
_0800B9D8:
	adds r0, r4, #0
	ldr r2, _0800BCA4
	bl _call_via_r2
	adds r7, r0, #0
	adds r0, r4, #0
	eors r0, r5
	cmp r0, #0
	bge _0800B9EC
	b _0800BD02
_0800B9EC:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r6
	bge _0800BA24
	ldr r3, _0800BC98
	mov r4, r8
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r4, r0, r2
	mov r0, r8
	adds r3, r0, r6
	lsls r0, r3, #2
_0800BA0A:
	ldrh r3, [r4, #2]
	muls r3, r7, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800BA1C
	ldrh r1, [r4]
	adds r4, r0, r2
	str r1, [sp, #4]
	adds r1, r6, #0
_0800BA1C:
	adds r1, #1
	adds r4, #4
	cmp r1, r6
	blt _0800BA0A
_0800BA24:
	ldr r3, [sp, #4]
	movs r2, #0x2c
	adds r0, r3, #0
	muls r0, r2, r0
	ldr r6, _0800BC9C
	ldr r1, [r6]
	mov r3, sl
	adds r6, r1, r0
	ldr r5, [r3, #0x10]
	ldr r1, [r6, #0x24]
	asrs r0, r5, #1
	adds r4, r0, #0
	muls r4, r1, r4
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r1, r3
	lsls r3, r4, #9
	subs r4, r3, r1
	muls r4, r0, r4
	asrs r2, r4, #0xf
	adds r4, r1, r2
	bl multi_lfsr_next
	ldr r1, _0800BCA0
	ands r1, r0
	subs r0, r4, r5
	muls r1, r0, r1
	mov r0, sb
	movs r4, #0x14
	ldrsh r3, [r0, r4]
	asrs r2, r1, #0xf
	adds r5, r5, r2
	lsls r2, r3, #8
	movs r1, #0x18
	ldrsh r3, [r0, r1]
	ldr r0, [sp, #0x24]
	muls r3, r0, r3
	asrs r4, r3, #8
	adds r1, r2, r4
	mov r0, sl
	str r1, [r0, #0x20]
	ldr r0, [sp, #0x28]
	movs r1, #0x14
	ldrsh r3, [r0, r1]
	lsls r1, r3, #8
	movs r4, #0x18
	ldrsh r3, [r0, r4]
	ldr r4, [sp, #0x20]
	muls r3, r4, r3
	asrs r0, r3, #8
	adds r4, r1, r0
	mov r1, sl
	str r4, [r1, #0x24]
	mov r4, fp
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	lsls r2, r0, #8
	movs r0, #0x18
	ldrsh r3, [r4, r0]
	ldr r4, [sp, #0x1c]
	muls r3, r4, r3
	asrs r1, r3, #8
	adds r0, r2, r1
	mov r3, sl
	str r0, [r3, #0x28]
	movs r4, #0x14
	ldrsh r3, [r6, r4]
	lsls r1, r3, #8
	movs r0, #0x18
	ldrsh r3, [r6, r0]
	muls r3, r5, r3
	asrs r4, r3, #8
	adds r0, r1, r4
	mov r1, sl
	str r0, [r1, #0x2c]
	mov r2, sb
	ldrh r4, [r2, #0x12]
	cmp r4, #0
	bne _0800BAC4
	b _0800BCBE
_0800BAC4:
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r2, r0, #8
_0800BACA:
	mov r1, sl
	str r2, [r1, #0x30]
	ldr r2, [sp, #0x28]
	ldrh r1, [r2, #0x12]
	cmp r1, #0
	bne _0800BAD8
	b _0800BC66
_0800BAD8:
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r2, r0, #8
_0800BADE:
	mov r1, sl
	str r2, [r1, #0x34]
	mov r2, fp
	ldrh r1, [r2, #0x12]
	cmp r1, #0
	bne _0800BAEC
	b _0800BC22
_0800BAEC:
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r2, r0, #8
_0800BAF2:
	mov r1, sl
	str r2, [r1, #0x38]
	ldrh r1, [r6, #0x12]
	cmp r1, #0
	beq _0800BBDE
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r2, r0, #8
_0800BB02:
	mov r1, sl
	str r2, [r1, #0x3c]
	mov r4, sb
	movs r3, #0x16
	ldrsh r1, [r4, r3]
	movs r0, #0x1a
	ldrsh r3, [r4, r0]
	ldr r0, [sp, #0x24]
	muls r3, r0, r3
	lsls r2, r1, #8
	asrs r4, r3, #8
	adds r1, r2, r4
	mov r3, sl
	str r1, [r3, #0x40]
	ldr r0, [sp, #0x28]
	movs r4, #0x16
	ldrsh r3, [r0, r4]
	lsls r2, r3, #8
	movs r1, #0x1a
	ldrsh r3, [r0, r1]
	ldr r0, [sp, #0x20]
	muls r3, r0, r3
	asrs r4, r3, #8
	adds r1, r2, r4
	mov r0, sl
	str r1, [r0, #0x44]
	mov r3, fp
	movs r1, #0x16
	ldrsh r0, [r3, r1]
	movs r4, #0x1a
	ldrsh r3, [r3, r4]
	ldr r4, [sp, #0x1c]
	muls r3, r4, r3
	lsls r1, r0, #8
	asrs r4, r3, #8
	adds r0, r1, r4
	mov r1, sl
	str r0, [r1, #0x48]
	movs r3, #0x16
	ldrsh r4, [r6, r3]
	lsls r2, r4, #8
	movs r4, #0x1a
	ldrsh r0, [r6, r4]
	muls r0, r5, r0
	asrs r4, r0, #8
	adds r0, r2, r4
	str r0, [r1, #0x4c]
	movs r1, #0
	mov r0, sl
	str r1, [r0, #0x50]
	ldr r4, [sp, #4]
	str r4, [r0, #0x1c]
	ldr r0, [sp, #0x14]
	ldr r3, _0800BCA8
	ldr r4, [r0]
	ands r4, r3
	movs r3, #0x88
	str r4, [r0]
	lsls r4, r3, #1
	add r4, sl
	movs r0, #1
	str r0, [r4]
	movs r0, #0x82
	lsls r4, r0, #1
	ldr r0, [sp, #0x2c]
	ldr r3, [r0, #0x14]
	add r4, sl
	str r3, [r4]
	movs r3, #0xa0
	lsls r4, r3, #1
	ldr r3, [r0, #0x1c]
	mov r2, sl
	add r4, sl
	movs r0, #1
	str r3, [r4]
	mov r3, sl
	str r1, [r2, #0x54]
	str r1, [r2, #0x58]
	rsbs r2, r0, #0
	mov r0, sl
	str r2, [r3, #0x5c]
	str r2, [r3, #0x60]
	adds r0, #0x80
	str r1, [r3, #0x64]
	str r1, [r3, #0x68]
	str r2, [r3, #0x6c]
	str r2, [r3, #0x70]
	str r1, [r3, #0x74]
	str r1, [r3, #0x78]
	str r2, [r3, #0x7c]
	adds r3, #0x84
	str r2, [r0]
	str r1, [r3]
	adds r3, #4
	str r2, [r3]
	mov r4, sl
	adds r3, #4
	str r2, [r3]
	add sp, #0x30
	str r1, [r4, #0x78]
	str r2, [r4, #0x7c]
	str r2, [r0]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800BBDE:
	mov r3, sl
	ldr r4, [r3, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800BC06
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r3, [r0]
	ldr r4, [r2]
	subs r2, r3, r4
	muls r2, r1, r2
	asrs r0, r2, #0xf
	adds r2, r4, r0
	b _0800BB02
_0800BC06:
	cmp r1, #0
	blt _0800BC10
	ldr r1, [sp, #8]
	ldr r2, [r1]
	b _0800BB02
_0800BC10:
	ldr r3, [sp, #0xc]
	ldr r4, [sp, #8]
	ldr r2, [r3]
	ldr r0, [r4]
	subs r3, r0, r2
	muls r3, r1, r3
	asrs r1, r3, #0xf
	adds r2, r0, r1
	b _0800BB02
_0800BC22:
	mov r0, sl
	ldr r4, [r0, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800BC4A
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r3, [r0]
	ldr r0, [r2]
	subs r2, r3, r0
	muls r2, r1, r2
	asrs r4, r2, #0xf
	adds r2, r0, r4
	b _0800BAF2
_0800BC4A:
	cmp r1, #0
	blt _0800BC54
	ldr r3, [sp, #8]
	ldr r2, [r3]
	b _0800BAF2
_0800BC54:
	ldr r4, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r4]
	ldr r0, [r2]
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r1, r4, #0xf
	adds r2, r3, r1
	b _0800BAF2
_0800BC66:
	mov r0, sl
	ldr r4, [r0, #0x10]
	bl multi_lfsr_next
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800BC8E
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r3, [r0]
	ldr r0, [r2]
	subs r2, r3, r0
	muls r2, r1, r2
	asrs r4, r2, #0xf
	adds r2, r0, r4
	b _0800BADE
_0800BC8E:
	cmp r1, #0
	blt _0800BCAC
	ldr r3, [sp, #8]
	ldr r2, [r3]
	b _0800BADE
_0800BC98:
	.4byte 0x020234A4
_0800BC9C:
	.4byte 0x020234A0
_0800BCA0:
	.4byte 0x00007FFF
_0800BCA4:
	.4byte udiv
_0800BCA8:
	.4byte 0xFFFFF3FF
_0800BCAC:
	ldr r4, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r4]
	ldr r0, [r2]
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r1, r4, #0xf
	adds r2, r3, r1
	b _0800BADE
_0800BCBE:
	mov r0, sl
	ldr r4, [r0, #0x10]
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r2, r4, #0
	muls r2, r1, r2
	asrs r1, r2, #0x10
	cmp r1, #0
	ble _0800BCE6
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r3, [r0]
	ldr r0, [r2]
	subs r2, r3, r0
	muls r2, r1, r2
	asrs r4, r2, #0xf
	adds r2, r0, r4
	b _0800BACA
_0800BCE6:
	cmp r1, #0
	blt _0800BCF0
	ldr r3, [sp, #8]
	ldr r2, [r3]
	b _0800BACA
_0800BCF0:
	ldr r4, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r4]
	ldr r0, [r2]
	subs r4, r3, r0
	muls r4, r1, r4
	asrs r1, r4, #0xf
	adds r2, r3, r1
	b _0800BACA
_0800BD02:
	rsbs r7, r7, #0
	b _0800B9EC
_0800BD06:
	rsbs r1, r5, #0
	b _0800B9D8
_0800BD0A:
	rsbs r7, r7, #0
	b _0800B920
_0800BD0E:
	rsbs r1, r5, #0
	b _0800B8F4
_0800BD12:
	rsbs r7, r7, #0
	b _0800B83C
_0800BD16:
	rsbs r1, r5, #0
	b _0800B828
_0800BD1A:
	rsbs r6, r6, #0
	b _0800B774
_0800BD1E:
	rsbs r1, r5, #0
	b _0800B760
_0800BD22:
	movs r3, #1
	str r3, [sp, #0x18]
	b _0800B714
_0800BD28:
	mov r0, r8
	ldr r1, _0800BDF4
	ldr r6, [r0, #0x24]
	ldr r5, [r0, #0x2c]
	mov lr, r1
	b _0800B6E6
_0800BD34:
	rsbs r6, r6, #0
	b _0800B6A6
_0800BD38:
	rsbs r1, r5, #0
	b _0800B68E
_0800BD3C:
	mov r2, sb
	ldrh r7, [r2, #6]
	mov r0, lr
	ldr r5, [r0]
	ldrh r4, [r2, #8]
	lsls r2, r7, #2
	ldrh r3, [r2, r5]
	mov sb, r3
	cmp r4, #1
	ble _0800BDC4
	movs r5, #0
	cmp r4, #0
	beq _0800BD6C
	mov r1, fp
	ldr r6, [r1]
	adds r0, r2, r6
	adds r2, r0, #2
	adds r1, r4, #0
_0800BD60:
	ldrh r0, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r0
	cmp r1, #0
	bne _0800BD60
_0800BD6C:
	movs r1, #0x80
	lsls r2, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	blt _0800BDE2
_0800BD76:
	ldr r6, _0800BDF8
	adds r0, r2, #0
	str r2, [sp]
	bl _call_via_r6
	ldr r3, [sp]
	adds r6, r0, #0
	adds r0, r3, #0
	eors r0, r5
	cmp r0, #0
	blt _0800BDDE
_0800BD8C:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r4
	bge _0800BDD8
	mov r3, fp
	ldr r2, _0800BDF4
	ldr r0, [r3]
	lsls r3, r7, #2
	mov lr, r2
	adds r2, r3, r0
	adds r3, r7, r4
	lsls r7, r3, #2
_0800BDAA:
	ldrh r3, [r2, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0800BDBC
	ldrh r2, [r2]
	adds r1, r4, #0
	mov sb, r2
	adds r2, r7, r0
_0800BDBC:
	adds r1, #1
	adds r2, #4
	cmp r1, r4
	blt _0800BDAA
_0800BDC4:
	ldr r2, _0800BDFC
	movs r1, #0
	ldrsh r7, [r2, r1]
	mov r0, sb
	cmp r0, r7
	beq _0800BDD2
	b _0800B714
_0800BDD2:
	movs r4, #1
	str r4, [sp, #0x18]
	b _0800B714
_0800BDD8:
	ldr r4, _0800BDF4
	mov lr, r4
	b _0800BDC4
_0800BDDE:
	rsbs r6, r6, #0
	b _0800BD8C
_0800BDE2:
	rsbs r1, r5, #0
	b _0800BD76
	.byte 0x40, 0x42, 0xFF, 0xF7, 0xE5, 0xFB, 0x61, 0x42, 0xFF, 0xF7, 0xD8, 0xFB, 0x00, 0x00
_0800BDF4:
	.4byte 0x020234A4
_0800BDF8:
	.4byte udiv
_0800BDFC:
	.4byte 0x020234A8

	.global sub_0800BE00
	.thumb_func
	.type sub_0800BE00, %function
sub_0800BE00: @ 0800BE00
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	adds r6, r1, #0
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x18]
	mov ip, r0
	ldr r0, [r6, #0x50]
	str r3, [sp, #4]
	lsls r3, r0, #2
	str r2, [sp, #8]
	adds r2, r3, #0
	adds r2, #0x20
	str r3, [sp]
	ldr r3, [r6, r2]
	adds r2, r0, #1
	mov sl, r3
	adds r3, r2, #0
	cmp r2, #0
	bge _0800BE32
	b _0800C2D2
_0800BE32:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov fp, r3
	adds r2, r0, #2
	adds r3, #0x20
	ldr r7, [r6, r3]
	adds r3, r2, #0
	cmp r2, #0
	bge _0800BE4A
	b _0800C2CE
_0800BE4A:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov sb, r3
	adds r3, #0x20
	ldr r3, [r6, r3]
	mov lr, r3
	adds r3, r0, #3
	adds r1, r3, #0
	cmp r3, #0
	bge _0800BE64
	b _0800C2CA
_0800BE64:
	asrs r5, r1, #2
	lsls r0, r5, #2
	subs r2, r3, r0
	lsls r1, r2, #2
	adds r4, r1, #0
	adds r4, #0x20
	ldr r3, [r6, r4]
	lsls r4, r7, #1
	adds r5, r4, r7
	mov r2, sl
	mov r8, r3
	subs r3, r5, r2
	mov r5, lr
	lsls r2, r5, #1
	add r2, lr
	subs r0, r3, r2
	add r0, r8
	mov r2, ip
	muls r2, r0, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	mov r0, ip
	muls r0, r2, r0
	adds r3, r0, #0
	asrs r0, r3, #0xc
	mov r2, ip
	muls r2, r0, r2
	mov r3, sl
	asrs r0, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	subs r2, r2, r3
	lsls r3, r5, #2
	adds r7, r2, r3
	mov r5, r8
	subs r3, r7, r5
	mov r5, ip
	muls r5, r3, r5
	asrs r7, r5, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r5, r2, #0
	asrs r2, r5, #0xc
	adds r0, r0, r2
	mov r5, sl
	mov r2, lr
	subs r7, r2, r5
	mov r5, ip
	muls r5, r7, r5
	adds r2, r5, #0
	ldr r7, [sp]
	asrs r5, r2, #0xc
	adds r2, r0, r5
	adds r3, r2, r4
	adds r7, #0x30
	asrs r0, r3, #1
	ldr r3, [r6, r7]
	mov sl, r3
	mov r3, fp
	adds r3, #0x30
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x30
	ldr r3, [r6, r3]
	adds r5, r1, #0
	adds r5, #0x30
	mov lr, r3
	ldr r3, [r6, r5]
	lsls r5, r7, #1
	adds r4, r5, r7
	mov r2, sl
	mov r8, r3
	subs r3, r4, r2
	mov r4, lr
	lsls r2, r4, #1
	add r2, lr
	subs r4, r3, r2
	add r4, r8
	mov r2, ip
	muls r2, r4, r2
	adds r4, r2, #0
	asrs r2, r4, #0xc
	mov r4, ip
	muls r4, r2, r4
	adds r2, r4, #0
	asrs r4, r2, #0xc
	mov r2, ip
	muls r2, r4, r2
	mov r3, sl
	asrs r4, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	mov r7, lr
	subs r2, r2, r3
	lsls r3, r7, #2
	adds r2, r2, r3
	mov r3, r8
	subs r7, r2, r3
	mov r3, ip
	muls r3, r7, r3
	asrs r7, r3, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	adds r4, r4, r2
	mov r7, sl
	mov r2, lr
	subs r3, r2, r7
	mov r2, ip
	muls r2, r3, r2
	adds r7, r2, #0
	asrs r2, r7, #0xc
	adds r7, r4, r2
	adds r3, r7, r5
	ldr r5, [sp]
	adds r5, #0x40
	asrs r4, r3, #1
	ldr r3, [r6, r5]
	mov sl, r3
	mov r3, fp
	adds r3, #0x40
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x40
	adds r1, #0x40
	ldr r3, [r6, r3]
	ldr r1, [r6, r1]
	lsls r5, r7, #1
	mov lr, r3
	adds r2, r5, r7
	mov r8, r1
	mov r1, sl
	subs r3, r2, r1
	mov r1, lr
	lsls r2, r1, #1
	add r2, lr
	subs r1, r3, r2
	add r1, r8
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	asrs r2, r1, #0xc
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	asrs r1, r2, #0xc
	mov r2, ip
	muls r2, r1, r2
	mov r3, sl
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	mov r7, lr
	subs r2, r2, r3
	lsls r3, r7, #2
	adds r2, r2, r3
	mov r3, r8
	subs r7, r2, r3
	mov r3, ip
	muls r3, r7, r3
	asrs r7, r3, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r7, sl
	mov r2, lr
	subs r3, r2, r7
	mov r7, ip
	muls r7, r3, r7
	adds r3, r7, #0
	asrs r7, r3, #0xc
	adds r2, r1, r7
	adds r3, r2, r5
	ldr r5, [sp, #8]
	str r0, [r5]
	ldr r5, [sp, #4]
	ldr r7, [sp, #0x34]
	asrs r1, r3, #1
	str r4, [r5]
	str r1, [r7]
	ldr r7, [sp, #0xc]
	ldr r3, [r7, #0x24]
	subs r2, r0, r3
	ldr r3, [r7, #0x2c]
	asrs r0, r2, #8
	subs r2, r1, r3
	asrs r3, r2, #8
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r2, r2, #8
	asrs r1, r0, #8
	adds r0, r2, r1
	cmp r0, #0x32
	bgt _0800BFFA
	b _0800C2C6
_0800BFFA:
	movs r1, #0x20
	rsbs r2, r1, #0
_0800BFFE:
	ldr r1, [r6, #0x14]
	lsls r2, r2, #1
	lsls r0, r1, #1
	mov fp, r2
	adds r2, r0, r2
	cmp r2, #0
	ble _0800C012
	ldr r1, [r6, #0x18]
	adds r0, r1, r2
	str r0, [r6, #0x18]
_0800C012:
	movs r3, #0x80
	ldr r1, [r6, #0x18]
	lsls r2, r3, #5
	cmp r1, r2
	bge _0800C01E
	b _0800C1A4
_0800C01E:
	ldr r1, [r6, #0x1c]
	movs r4, #0x2c
	muls r1, r4, r1
	ldr r2, _0800C2D8
	ldr r5, [r2]
	ldr r0, _0800C2DC
	adds r7, r5, r1
	ldrh r1, [r7, #6]
	ldr r4, [r0]
	ldrh r5, [r7, #8]
	lsls r7, r1, #2
	adds r3, r7, r4
	ldrh r2, [r3]
	mov sb, r1
	mov sl, r2
	cmp r5, #1
	ble _0800C0B4
	movs r4, #0
	cmp r5, #0
	beq _0800C056
	adds r1, r3, #2
	adds r2, r5, #0
_0800C04A:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _0800C04A
_0800C056:
	movs r3, #0x80
	lsls r7, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _0800C062
	b _0800C2C2
_0800C062:
	adds r0, r7, #0
	ldr r2, _0800C2E0
	bl _call_via_r2
	adds r1, r7, #0
	eors r1, r4
	mov r8, r0
	cmp r1, #0
	bge _0800C076
	b _0800C2BA
_0800C076:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	bge _0800C0B4
	ldr r0, _0800C2DC
	ldr r7, [r0]
	mov r0, sb
	lsls r3, r0, #2
	adds r1, r3, r7
	adds r3, r0, r5
	lsls r3, r3, #2
	mov lr, r3
_0800C094:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _0800C0AC
	ldrh r1, [r1]
	mov r2, lr
	mov sl, r1
	adds r1, r2, r7
	adds r2, r5, #0
_0800C0AC:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _0800C094
_0800C0B4:
	movs r0, #0x2c
	mov r1, sl
	muls r1, r0, r1
	ldr r7, _0800C2D8
	mov r3, sl
	str r3, [r6, #0x1c]
	ldr r2, [r7]
	ldr r5, [r6, #0x10]
	adds r7, r2, r1
	ldr r1, [r7, #0x24]
	asrs r0, r5, #1
	adds r4, r0, #0
	muls r4, r1, r4
	asrs r3, r4, #0xf
	movs r4, #0x80
	subs r5, r1, r3
	lsls r3, r4, #9
	subs r4, r3, r1
	muls r4, r0, r4
	asrs r2, r4, #0xf
	adds r4, r1, r2
	bl multi_lfsr_next
	ldr r2, _0800C2E4
	ands r2, r0
	subs r0, r4, r5
	muls r2, r0, r2
	asrs r1, r2, #0xf
	adds r5, r5, r1
	mov r8, r5
	movs r5, #0x18
	ldrsh r0, [r7, r5]
	mov r5, r8
	muls r5, r0, r5
	movs r4, #0x14
	ldrsh r3, [r7, r4]
	ldr r2, [r6, #0x50]
	lsls r4, r3, #8
	adds r3, r5, #0
	asrs r5, r3, #8
	lsls r1, r2, #2
	adds r0, r4, r5
	adds r1, #0x20
	str r0, [r6, r1]
	ldr r5, [r6, #0x50]
	ldrh r4, [r7, #0x12]
	lsls r1, r5, #2
	adds r5, r1, #0
	adds r5, #0x30
	cmp r4, #0
	bne _0800C11C
	b _0800C274
_0800C11C:
	movs r1, #2
	ldrsh r4, [r7, r1]
	lsls r1, r4, #8
_0800C122:
	str r1, [r6, r5]
	ldr r3, [r6, #0x50]
	lsls r0, r3, #2
	movs r3, #0x16
	ldrsh r5, [r7, r3]
	movs r4, #0x1a
	ldrsh r3, [r7, r4]
	lsls r2, r5, #8
	mov r5, r8
	muls r5, r3, r5
	adds r3, r5, #0
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r0, #0x40
	str r2, [r6, r0]
	ldr r1, [r6, #0x50]
	adds r2, r1, #1
	adds r3, r2, #0
	cmp r2, #0
	bge _0800C14C
	b _0800C270
_0800C14C:
	asrs r0, r3, #2
	lsls r1, r0, #2
	subs r0, r2, r1
	ldr r2, [r6, #0x54]
	movs r1, #0
	str r0, [r6, #0x50]
	str r1, [r6, #0x18]
	cmp r2, #0
	bne _0800C160
	b _0800C25E
_0800C160:
	cmp r2, #1
	bne _0800C166
	b _0800C24E
_0800C166:
	ldr r2, [r6, #0x64]
	cmp r2, #0
	beq _0800C23E
_0800C16C:
	cmp r2, #1
	beq _0800C230
_0800C170:
	ldr r2, [r6, #0x74]
	cmp r2, #0
	beq _0800C220
_0800C176:
	cmp r2, #1
	beq _0800C20E
_0800C17A:
	adds r0, r6, #0
	adds r0, #0x88
	movs r1, #1
	ldr r2, [r0]
	rsbs r3, r1, #0
	cmp r2, r3
	beq _0800C1F4
_0800C188:
	adds r2, r6, #0
	adds r2, #0x94
	movs r3, #1
	ldr r1, [r2]
	rsbs r0, r3, #0
	cmp r1, r0
	beq _0800C1D2
	adds r0, r6, #0
	adds r0, #0x98
_0800C19A:
	movs r1, #1
	ldr r2, [r0]
	rsbs r5, r1, #0
	cmp r2, r5
	beq _0800C1C6
_0800C1A4:
	ldr r0, [r6, #0x14]
	add r0, fp
	str r0, [r6, #0x14]
	cmp r0, #0
	blt _0800C1C0
_0800C1AE:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800C1C0:
	movs r2, #0
	str r2, [r6, #0x14]
	b _0800C1AE
_0800C1C6:
	ldrb r2, [r7, #0x13]
	cmp r2, #0
	bne _0800C1A4
	ldr r1, [r6, #0x1c]
	str r1, [r0]
	b _0800C1A4
_0800C1D2:
	adds r0, r6, #0
	adds r0, #0x98
	ldr r4, [r0]
	cmp r4, r1
	beq _0800C1E8
_0800C1DC:
	movs r3, #1
	ldr r1, [r2]
	rsbs r4, r3, #0
	cmp r1, r4
	beq _0800C1A4
	b _0800C19A
_0800C1E8:
	ldrb r1, [r7, #0x13]
	cmp r1, #0
	beq _0800C1DC
	ldr r4, [r6, #0x1c]
	str r4, [r2]
	b _0800C1DC
_0800C1F4:
	adds r1, r6, #0
	adds r1, #0x8c
	ldr r3, [r1]
	cmp r3, r2
	bne _0800C188
	ldrb r2, [r7, #0x12]
	cmp r2, #0
	beq _0800C188
	ldr r2, [r6, #0x1c]
	str r2, [r0]
	ldr r0, [r6, #0x1c]
	str r0, [r1]
	b _0800C188
_0800C20E:
	ldrh r1, [r7, #0xc]
	cmp r1, #0
	bne _0800C17A
	adds r0, r6, #0
	ldr r2, [r6, #0x1c]
	adds r0, #0x80
	str r2, [r0]
	str r1, [r6, #0x74]
	b _0800C17A
_0800C220:
	ldrh r1, [r7, #0xc]
	cmp r1, #0
	beq _0800C176
	ldr r0, [r6, #0x1c]
	movs r2, #1
	str r0, [r6, #0x7c]
	str r2, [r6, #0x74]
	b _0800C176
_0800C230:
	ldrh r2, [r7, #0xe]
	cmp r2, #0
	bne _0800C170
	ldr r0, [r6, #0x1c]
	str r2, [r6, #0x64]
	str r0, [r6, #0x70]
	b _0800C170
_0800C23E:
	ldrh r0, [r7, #0xe]
	cmp r0, #0
	beq _0800C16C
	ldr r1, [r6, #0x1c]
	movs r2, #1
	str r1, [r6, #0x6c]
	str r2, [r6, #0x64]
	b _0800C16C
_0800C24E:
	ldrh r2, [r7, #0x10]
	cmp r2, #0
	beq _0800C256
	b _0800C166
_0800C256:
	ldr r1, [r6, #0x1c]
	str r2, [r6, #0x54]
	str r1, [r6, #0x60]
	b _0800C166
_0800C25E:
	ldrh r1, [r7, #0x10]
	cmp r1, #0
	bne _0800C266
	b _0800C160
_0800C266:
	ldr r0, [r6, #0x1c]
	movs r2, #1
	str r0, [r6, #0x5c]
	str r2, [r6, #0x54]
	b _0800C160
_0800C270:
	adds r3, r1, #4
	b _0800C14C
_0800C274:
	ldr r4, [r6, #0x10]
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r4, #0
	muls r1, r3, r1
	asrs r0, r1, #0x10
	cmp r0, #0
	ble _0800C298
	adds r1, r6, #0
	adds r2, r6, #0
	adds r1, #0xa8
	adds r2, #0xac
	ldr r4, [r1]
	ldr r3, [r2]
	subs r1, r3, r4
	b _0800C2B2
_0800C298:
	cmp r0, #0
	blt _0800C2A4
	adds r4, r6, #0
	adds r4, #0xa8
	ldr r1, [r4]
	b _0800C122
_0800C2A4:
	adds r2, r6, #0
	adds r1, r6, #0
	adds r1, #0xb0
	adds r2, #0xa8
	ldr r4, [r2]
	ldr r3, [r1]
	subs r1, r4, r3
_0800C2B2:
	muls r1, r0, r1
	asrs r0, r1, #0xf
	adds r1, r4, r0
	b _0800C122
_0800C2BA:
	mov r3, r8
	rsbs r3, r3, #0
	mov r8, r3
	b _0800C076
_0800C2C2:
	rsbs r1, r4, #0
	b _0800C062
_0800C2C6:
	movs r2, #0x20
	b _0800BFFE
_0800C2CA:
	adds r1, r0, #6
	b _0800BE64
_0800C2CE:
	adds r3, r0, #5
	b _0800BE4A
_0800C2D2:
	adds r3, r0, #4
	b _0800BE32
	.byte 0x00, 0x00
_0800C2D8:
	.4byte 0x020234A0
_0800C2DC:
	.4byte 0x020234A4
_0800C2E0:
	.4byte udiv
_0800C2E4:
	.4byte 0x00007FFF

	.global sub_0800C2E8
	.thumb_func
	.type sub_0800C2E8, %function
sub_0800C2E8: @ 0800C2E8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r0, #0xa0
	mov r8, r1
	adds r4, r2, #0
	adds r1, r3, #0
	movs r2, #0xc0
	ldr r3, [r0]
	lsls r0, r2, #1
	ands r3, r0
	sub sp, #4
	cmp r3, #0
	beq _0800C34E
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r0, #0
	ble _0800C342
	movs r2, #0x20
	rsbs r1, r2, #0
_0800C316:
	mov r2, r8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	lsls r4, r0, #1
	adds r3, r3, r4
	lsls r4, r1, #1
	adds r3, r3, r4
	mov sl, r3
	adds r1, r0, r4
	mov r3, r8
	mov r4, sl
	str r1, [r3, #8]
	strh r4, [r2, #0xc]
_0800C330:
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800C342:
	cmp r0, #0
	blt _0800C34A
	movs r1, #0
	b _0800C316
_0800C34A:
	movs r1, #0x20
	b _0800C316
_0800C34E:
	adds r0, r4, #0
	ldr r4, _0800C414
	bl _call_via_r4
	lsls r2, r0, #0x10
	str r2, [sp]
	mov r3, r8
	ldrh r1, [r3, #0xc]
	lsrs r0, r2, #0x10
	ldr r5, _0800C418
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	ble _0800C406
	movs r1, #0x20
_0800C370:
	mov r4, r8
	ldr r5, [r4, #8]
	movs r3, #0xc
	ldrsh r2, [r4, r3]
	lsls r4, r5, #1
	lsls r3, r1, #1
	adds r2, r2, r4
	mov sb, r3
	add r2, sb
	mov sl, r2
	cmp r5, #0
	ble _0800C3FC
	cmp r0, #0
	ble _0800C3FC
_0800C38C:
	adds r3, r5, #0
	muls r3, r5, r3
	rsbs r1, r1, #0
	rsbs r7, r3, #0
	mov fp, r1
	lsls r4, r1, #1
	adds r0, r7, #0
	cmp r7, #0
	blt _0800C3F8
_0800C39E:
	adds r1, r4, #0
	cmp r4, #0
	blt _0800C3F4
_0800C3A4:
	ldr r6, _0800C41C
	bl _call_via_r6
	adds r6, r0, #0
	adds r0, r7, #0
	eors r0, r4
	cmp r0, #0
	blt _0800C3F0
_0800C3B4:
	ldr r1, [sp]
	mov r2, sl
	lsls r3, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r2, _0800C418
	lsrs r1, r3, #0x10
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r5, #0
	ble _0800C3D0
	cmp r6, r0
	bge _0800C3E8
_0800C3D0:
	cmp r5, #0
	blt _0800C3E4
_0800C3D4:
	mov r2, sb
	adds r1, r5, r2
	mov r4, r8
	mov r0, sl
	mov r3, r8
	str r1, [r4, #8]
	strh r0, [r3, #0xc]
	b _0800C330
_0800C3E4:
	cmp r6, r0
	bgt _0800C3D4
_0800C3E8:
	mov r4, fp
	lsls r4, r4, #1
	mov sb, r4
	b _0800C3D4
_0800C3F0:
	rsbs r6, r6, #0
	b _0800C3B4
_0800C3F4:
	rsbs r1, r4, #0
	b _0800C3A4
_0800C3F8:
	adds r0, r3, #0
	b _0800C39E
_0800C3FC:
	cmp r5, #0
	bge _0800C3D4
	cmp r0, #0
	bge _0800C3D4
	b _0800C38C
_0800C406:
	cmp r0, #0
	blt _0800C40E
	movs r1, #0
	b _0800C370
_0800C40E:
	movs r3, #0x20
	rsbs r1, r3, #0
	b _0800C370
_0800C414:
	.4byte atan2_fx
_0800C418:
	.4byte _03000814
_0800C41C:
	.4byte udiv

	.global aiPlayerForward
	.thumb_func
	.type aiPlayerForward, %function
aiPlayerForward: @ 0800C420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r4, [r1]
	movs r5, #0x80
	lsls r3, r5, #9
	ands r4, r3
	sub sp, #4
	cmp r4, #0
	bne _0800C43C
	b _0800C5E8
_0800C43C:
	movs r7, #0xa6
	lsls r3, r7, #1
	adds r5, r6, r3
	ldr r4, [r0, #0x50]
	ldr r7, [r5]
	muls r7, r4, r7
	movs r0, #0x9c
	adds r3, r0, r6
	asrs r4, r7, #0xc
	mov r8, r3
_0800C450:
	ldr r2, [r1]
	movs r5, #0x80
	lsls r0, r5, #1
	ands r0, r2
	cmp r0, #0
	beq _0800C4FE
_0800C45C:
	movs r5, #0xa2
	lsls r3, r5, #1
	adds r1, r6, r3
	ldr r7, [r1]
	cmp r4, #0
	bge _0800C46A
	b _0800C550
_0800C46A:
	cmp r4, r7
	bgt _0800C4D0
	asrs r5, r4, #0xb
	cmp r5, #0x20
	ble _0800C48A
	ldr r2, _0800C5F4
	ldr r0, _0800C5F8
	str r2, [sp]
	ldr r1, _0800C5FC
	ldr r2, _0800C600
	ldr r3, _0800C604
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0800C48A:
	movs r1, #0xa8
_0800C48C:
	lsls r3, r1, #1
	adds r0, r6, r3
	ldr r1, [r0]
	lsls r2, r5, #2
	ldr r0, [r2, r1]
_0800C496:
	lsls r5, r4, #1
	lsls r1, r0, #1
	movs r3, #0xa4
	adds r2, r5, r1
	lsls r5, r3, #1
	adds r3, r6, r5
	ldr r3, [r3]
	muls r3, r2, r3
	adds r4, r4, r1
	asrs r3, r3, #0x10
	cmp r0, #0
	ble _0800C4C6
	cmp r4, r7
	ble _0800C4B4
_0800C4B2:
	adds r4, r7, #0
_0800C4B4:
	mov r2, r8
	adds r0, r3, #0
	str r4, [r2]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0800C4C6:
	cmp r0, #0
	bge _0800C4B4
	cmp r4, r7
	bge _0800C4B4
	b _0800C4B2
_0800C4D0:
	cmp r7, r4
	ble _0800C4D6
	b _0800C5D2
_0800C4D6:
	movs r2, #0x80
	lsls r5, r2, #9
	cmp r4, r5
	bgt _0800C5D2
	asrs r5, r4, #0xb
	cmp r5, #0x20
	ble _0800C4FA
	ldr r0, _0800C5F4
	ldr r1, _0800C5FC
	str r0, [sp]
	ldr r2, _0800C600
	ldr r0, _0800C5F8
	ldr r3, _0800C608
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0800C4FA:
	movs r1, #0xaa
	b _0800C48C
_0800C4FE:
	movs r7, #0x80
	ands r7, r2
	cmp r7, #0
	beq _0800C510
	adds r0, r6, #0
	adds r0, #0xb8
	ldr r2, [r0]
	cmp r2, #0
	bgt _0800C45C
_0800C510:
	ldr r2, [r1]
	movs r1, #0x80
	lsls r7, r1, #5
	ands r7, r2
	cmp r7, #0
	beq _0800C532
	cmp r4, #0
	blt _0800C52C
	ldr r3, _0800C60C
	cmp r4, r3
	bls _0800C52C
	ldr r0, _0800C610
	ldr r7, _0800C60C
	b _0800C496
_0800C52C:
	ldr r0, _0800C614
	ldr r7, _0800C60C
	b _0800C496
_0800C532:
	movs r0, #0x80
	lsls r5, r0, #6
	ands r5, r2
	cmp r5, #0
	beq _0800C5A6
	movs r2, #0x80
	lsls r7, r2, #8
	cmp r4, #0
	blt _0800C550
	movs r5, #0xa2
	lsls r3, r5, #1
	adds r1, r6, r3
	ldr r3, [r1]
	cmp r4, r3
	bgt _0800C554
_0800C550:
	ldr r0, _0800C614
	b _0800C496
_0800C554:
	cmp r3, r4
	bgt _0800C57A
	cmp r4, r7
	bgt _0800C57A
	asrs r5, r4, #0xb
	cmp r5, #0x20
	ble _0800C48A
	ldr r0, _0800C5F4
	ldr r1, _0800C5FC
	str r0, [sp]
	ldr r2, _0800C600
	ldr r0, _0800C5F8
	ldr r3, _0800C618
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800C48A
_0800C57A:
	ldr r2, _0800C61C
	movs r3, #0x80
	adds r0, r4, r2
	lsls r5, r3, #8
	cmp r0, r5
	bhi _0800C5D2
	asrs r5, r4, #0xb
	cmp r5, #0x20
	ble _0800C5A2
	ldr r1, _0800C5F4
	ldr r0, _0800C5F8
	str r1, [sp]
	ldr r2, _0800C600
	ldr r1, _0800C5FC
	ldr r3, _0800C620
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0800C5A2:
	movs r1, #0xaa
	b _0800C48C
_0800C5A6:
	cmp r4, #0
	blt _0800C5E0
	movs r5, #0x80
	lsls r7, r5, #9
	cmp r4, r7
	bhi _0800C5D2
	asrs r5, r4, #0xb
	cmp r5, #0x20
	bgt _0800C5BA
	b _0800C48A
_0800C5BA:
	ldr r2, _0800C5F4
	ldr r0, _0800C5F8
	str r2, [sp]
	ldr r1, _0800C5FC
	ldr r2, _0800C600
	ldr r3, _0800C624
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800C48A
_0800C5D2:
	movs r3, #0xaa
	lsls r0, r3, #1
	adds r2, r6, r0
	ldr r5, [r2]
	adds r5, #0x80
	ldr r0, [r5]
	b _0800C496
_0800C5E0:
	movs r1, #0x80
	ldr r0, _0800C614
	lsls r7, r1, #9
	b _0800C496
_0800C5E8:
	movs r2, #0x9c
	adds r5, r2, r6
	ldr r4, [r5]
	mov r8, r5
	b _0800C450
	.byte 0x00, 0x00
_0800C5F4:
	.4byte gUnk_08050254
_0800C5F8:
	.4byte gUnk_080501E0
_0800C5FC:
	.4byte gUnk_0805021C
_0800C600:
	.4byte gUnk_08050260
_0800C604:
	.4byte 0x0000040A
_0800C608:
	.4byte 0x00000411
_0800C60C:
	.4byte 0x00013333
_0800C610:
	.4byte 0xFFFFFD71
_0800C614:
	.4byte 0x0000028F
_0800C618:
	.4byte 0x00000435
_0800C61C:
	.4byte 0xFFFF8000
_0800C620:
	.4byte 0x0000043C
_0800C624:
	.4byte 0x0000044D

	.global sub_0800C628
	.thumb_func
	.type sub_0800C628, %function
sub_0800C628: @ 0800C628
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x4c
	mov fp, r1
	mov r8, r2
	mov sb, r3
	str r0, [sp, #0x48]
	bl aiPlayerForward
	ldr r2, [sp, #0x48]
	adds r2, #0xa0
	str r0, [sp, #0x44]
	str r2, [sp, #0x30]
	movs r3, #0x80
	ldr r1, [r2]
	lsls r0, r3, #9
	ands r1, r0
	cmp r1, #0
	bne _0800C65A
	.2byte 0xF000, 0xFE65 @ bl #0x800d324
_0800C65A:
	ldr r4, [sp, #0x48]
	mov r2, fp
	ldr r0, [r4, #0x48]
	adds r2, #0xa0
	str r2, [sp, #0x18]

	.global sub_0800C664
	.thumb_func
	.type sub_0800C664, %function
sub_0800C664: @ 0800C664
	cmp r0, #0
	bge _0800C66C
	.2byte 0xF000, 0xFE59 @ bl #0x800d31e
_0800C66C:
	cmp r0, #0
	bgt _0800C674
	.2byte 0xF000, 0xFE52 @ bl #0x800d318
_0800C674:
	movs r5, #5
	rsbs r1, r5, #0

	.global sub_0800C678
	.thumb_func
	.type sub_0800C678, %function
sub_0800C678: @ 0800C678
	movs r5, #0
	lsls r3, r0, #1
	lsls r6, r1, #1
	adds r7, r3, r6
	str r7, [sp, #0x34]
	adds r0, r0, r6
	cmp r1, #0
	bgt _0800C68C
	.2byte 0xF000, 0xFE40 @ bl #0x800d30c
_0800C68C:
	cmp r0, r5
	ble sub_0800C692

	.global sub_0800C690
	.thumb_func
	.type sub_0800C690, %function
sub_0800C690: @ 0800C690
	movs r0, #0

	.global sub_0800C692
	.thumb_func
	.type sub_0800C692, %function
sub_0800C692: @ 0800C692
	ldr r5, [sp, #0x18]
	str r0, [r5]
	ldr r6, [sp, #0x30]
	ldr r4, _0800C834
	ldr r0, [r6]
	movs r2, #0x80
	ands r0, r4
	lsls r1, r2, #9
	cmp r0, r1
	bne _0800C6AA
	.2byte 0xF000, 0xFE2A @ bl #0x800d2fe
_0800C6AA:
	mov r1, fp
	adds r1, #0xa4
	str r1, [sp, #0x14]
	ldr r1, [r1]

	.global sub_0800C6B2
	.thumb_func
	.type sub_0800C6B2, %function
sub_0800C6B2: @ 0800C6B2
	ldr r0, [sp, #0x30]
	ldr r2, [r0]
	movs r7, #0x80
	ands r7, r2
	cmp r7, #0
	beq _0800C6C8
	mov r3, fp
	adds r3, #0xb8
	ldr r4, [r3]
	cmp r4, #0
	beq _0800C6D6
_0800C6C8:
	movs r5, #0x80
	lsls r6, r5, #1
	ands r6, r2
	cmp r6, #0
	bne _0800C6D6
	.2byte 0xF000, 0xFE03 @ bl #0x800d2dc
_0800C6D6:
	movs r2, #0xa
	ldr r0, _0800C838
	rsbs r5, r2, #0

	.global sub_0800C6DC
	.thumb_func
	.type sub_0800C6DC, %function
sub_0800C6DC: @ 0800C6DC
	lsls r6, r1, #1
	lsls r7, r5, #1
	adds r4, r6, r7
	str r4, [sp, #0x2c]
	adds r1, r1, r7
	cmp r5, #0
	bgt _0800C6EE
	bl _0800D2D0
_0800C6EE:
	cmp r1, r0
	ble sub_0800C6F4

	.global sub_0800C6F2
	.thumb_func
	.type sub_0800C6F2, %function
sub_0800C6F2: @ 0800C6F2
	adds r1, r0, #0

	.global sub_0800C6F4
	.thumb_func
	.type sub_0800C6F4, %function
sub_0800C6F4: @ 0800C6F4
	ldr r0, [sp, #0x14]
	str r1, [r0]
	ldr r0, _0800C83C
	movs r5, #0
	ldrsh r1, [r0, r5]
	cmp r1, #4
	bne _0800C706
	bl sub_0800D204
_0800C706:
	ldr r4, _0800C840
	ldr r2, [r4]
	adds r5, r2, #0
	adds r5, #0xa0
	ldr r1, [r5, #4]
	adds r1, #0x98
	ldrb r6, [r0, r1]
	cmp r6, #3
	bhi _0800C71C
	bl sub_0800D172
_0800C71C:
	movs r6, #0x14
	ldrsh r5, [r0, r6]
	cmp r5, #2
	bne _0800C728
	bl sub_0800D166
_0800C728:
	movs r1, #0x90
	lsls r3, r1, #1
	adds r0, r2, r3
	movs r6, #0x96
	ldr r7, [r0]
	lsls r2, r6, #3
	cmp r7, r2
	bge _0800C73C
	bl sub_0800D160
_0800C73C:
	ldr r1, _0800C844

	.global sub_0800C73E
	.thumb_func
	.type sub_0800C73E, %function
sub_0800C73E: @ 0800C73E
	mov r0, fp
	adds r0, #0xbc
	ldr r4, [r0]
	subs r3, r1, r4
	cmp r3, #0
	bgt _0800C74E
	bl sub_0800D154
_0800C74E:
	movs r5, #0x20

	.global sub_0800C750
	.thumb_func
	.type sub_0800C750, %function
sub_0800C750: @ 0800C750
	ldr r4, [r0]
	lsls r7, r5, #1
	adds r3, r4, r7
	str r3, [r0]
	cmp r5, #0
	bgt _0800C760
	bl sub_0800D13E
_0800C760:
	cmp r3, r1
	bgt sub_0800C768
	bl sub_0800D13E

	.global sub_0800C768
	.thumb_func
	.type sub_0800C768, %function
sub_0800C768: @ 0800C768
	str r1, [r0]

	.global sub_0800C76A
	.thumb_func
	.type sub_0800C76A, %function
sub_0800C76A: @ 0800C76A
	ldr r5, [r0]
	movs r7, #0x80
	ldr r6, [sp, #0x44]
	lsls r3, r7, #9
	adds r0, r5, r3
	muls r0, r6, r0

	.global sub_0800C776
	.thumb_func
	.type sub_0800C776, %function
sub_0800C776: @ 0800C776
	asrs r1, r0, #0x10
	str r1, [sp, #0x44]
	movs r4, #0x8e
	lsls r1, r4, #1
	add r1, fp
	ldr r3, [r1]
	cmp r3, #0
	beq _0800C7B4
	cmp r3, #2
	bne _0800C78E
	bl sub_0800D0E0
_0800C78E:
	cmp r3, #2
	ble _0800C796
	bl sub_0800D0AC
_0800C796:
	cmp r3, #1
	bne sub_0800C79E
	bl sub_0800D012

	.global sub_0800C79E
	.thumb_func
	.type sub_0800C79E, %function
sub_0800C79E: @ 0800C79E
	movs r4, #0x90
	lsls r2, r4, #1
	add r2, fp
	ldr r0, [r2]
	lsls r5, r0, #4
	subs r1, r5, r0
	ldr r4, [sp, #0x44]
	lsls r7, r1, #7
	asrs r6, r7, #0x10
	adds r2, r4, r6
	str r2, [sp, #0x44]
_0800C7B4:
	ldr r7, [sp, #0x30]
	ldr r3, [r7]
	movs r6, #0x80
	ands r6, r3
	str r6, [sp, #0x28]
	cmp r6, #0
	bne _0800C7C4
	b _0800CBC0
_0800C7C4:
	mov r5, fp
	adds r5, #0xb8
	str r5, [sp, #0x24]
	ldr r3, [r5]
	str r3, [sp, #0x20]
	cmp r3, #0
	bne _0800C7D4
	b _0800C9E8
_0800C7D4:
	mov r6, fp
	ldrh r4, [r6, #2]
	ldr r7, _0800C848
	adds r0, r4, #0
	mov sb, r7
	movs r1, #0
	bl _call_via_r9
	lsls r5, r0, #0x10
	asrs r7, r5, #0x15
	subs r6, r4, r7
	mov r0, fp
	strh r6, [r0, #2]
	mov r1, fp
	ldrh r4, [r1, #6]
	ldrh r7, [r1, #0xc]
	ldr r0, _0800C830
	strh r0, [r1, #4]
	adds r1, r7, #0
	adds r0, r4, #0
	bl _call_via_r9
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r3, r4, r2
	lsls r4, r6, #0x10
	mov r2, fp
	asrs r6, r4, #0x10
	strh r3, [r2, #6]
	ldr r4, _0800C84C
	adds r0, r6, #0
	bl _call_via_r4
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	str r3, [sp, #0x40]
	ldr r3, _0800C850
	adds r0, r6, #0
	mov r8, r3
	bl _call_via_r8
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	str r1, [sp, #0x3c]
	movs r0, #0
	b _0800C854
_0800C830:
	.4byte 0x00000000
_0800C834:
	.4byte 0x00010180
_0800C838:
	.4byte 0xFFFFFED4
_0800C83C:
	.4byte gGameSetup
_0800C840:
	.4byte gRacerObjects
_0800C844:
	.4byte 0xFFFF8000
_0800C848:
	.4byte _03000814
_0800C84C:
	.4byte cos_fx
_0800C850:
	.4byte sin_fx
_0800C854:
	bl _call_via_r4
	lsls r5, r0, #0x10
	asrs r3, r5, #0x10
	str r3, [sp, #0x38]
	movs r0, #0
	bl _call_via_r8
	lsls r6, r0, #0x10
	asrs r0, r6, #0x10
	mov sb, r0
	lsls r0, r7, #0x10
	asrs r7, r0, #0x10
	adds r0, r7, #0
	bl _call_via_r4
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	mov sl, r0
	adds r0, r7, #0
	bl _call_via_r8
	ldr r5, [sp, #0x3c]
	lsls r1, r0, #0x10
	asrs r7, r1, #0x10
	adds r3, r7, #0
	muls r3, r5, r3
	ldr r1, [sp, #0x40]
	asrs r5, r3, #0xc
	mov r4, sb
	muls r4, r5, r4
	mov r6, sl
	muls r6, r1, r6
	adds r3, r7, #0
	muls r3, r1, r3
	asrs r0, r4, #0xc
	asrs r4, r6, #0xc
	adds r2, r0, r4
	ldr r0, [sp, #0x34]
	adds r6, r0, #0
	muls r6, r2, r6
	asrs r0, r3, #0xc
	mov r1, sb
	muls r1, r0, r1
	asrs r2, r6, #0xc
	ldr r6, [sp, #0x3c]
	asrs r3, r1, #0xc
	mov r1, sl
	muls r1, r6, r1
	ldr r6, [sp, #0x2c]
	asrs r1, r1, #0xc
	subs r3, r3, r1
	muls r3, r6, r3
	asrs r6, r3, #0xc
	adds r2, r2, r6
	ldr r6, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r6, r3
	ldr r7, [sp, #0x44]
	asrs r6, r3, #0xc
	muls r6, r7, r6
	asrs r7, r6, #0xc
	adds r6, r2, r7
	ldr r7, [sp, #0x48]
	str r6, [r7, #0x3c]
	mov r6, sb
	muls r6, r1, r6
	movs r3, #0
	str r3, [r7, #0x40]
	ldr r1, [sp, #0x34]
	asrs r7, r6, #0xc
	subs r2, r7, r0
	adds r6, r1, #0
	muls r6, r2, r6
	mov r7, sb
	muls r7, r4, r7
	ldr r3, [sp, #0x38]
	asrs r1, r6, #0xc
	asrs r0, r7, #0xc
	ldr r6, [sp, #0x2c]
	adds r7, r0, r5
	mov r4, sl
	muls r4, r3, r4
	muls r7, r6, r7
	ldr r6, [sp, #0x44]
	asrs r5, r7, #0xc
	asrs r7, r4, #0xc
	muls r7, r6, r7
	adds r0, r1, r5
	ldr r6, [sp, #0x48]
	asrs r1, r7, #0xc
	adds r5, r0, r1
	str r5, [r6, #0x44]
	mov r6, fp
	adds r6, #0xb4
	movs r7, #0
	ldrsh r5, [r6, r7]
	movs r4, #0x80
	lsls r2, r4, #5
	adds r4, r5, r2
	lsls r7, r4, #0x10
	asrs r0, r7, #0x11
	strh r4, [r6]
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	movs r0, #0xfa
	lsls r7, r0, #3
	asrs r1, r2, #0xc
	muls r1, r7, r1
	asrs r0, r1, #0xc
	ldr r1, [sp, #0x48]
	ldr r2, [r1, #0x28]
	subs r7, r0, r2
	str r7, [r1, #0x40]
	cmp r5, #0
	blt _0800C95E
_0800C944:
	ldr r6, [sp, #0x44]
	ldr r7, [sp, #0x48]
	asrs r1, r6, #1
	str r1, [r7, #0x50]
	add sp, #0x4c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800C95E:
	cmp r4, #0
	blt _0800C944
	ldr r0, [sp, #0x24]
	ldr r2, [r0]
	adds r4, r2, #1
	str r4, [r0]
	cmp r4, #2
	beq _0800C9C4
	cmp r4, #3
	bne _0800C944
	ldr r5, [sp, #0x48]
	movs r7, #0x40
	movs r4, #0x80
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	ldr r0, [r5, #0x24]
	str r7, [sp]
	lsls r7, r4, #9
	movs r4, #2
	str r7, [sp, #4]
	str r4, [sp, #8]
	movs r7, #0xa
	movs r4, #0
	movs r3, #0xa0
	str r7, [sp, #0xc]
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	ldr r3, _0800C9C0
	str r4, [r5, #0x40]
	strh r3, [r6]
	ldr r2, [sp, #0x24]
	str r4, [r2]
	ldr r4, _0800C9C0
	mov r3, fp
	strh r4, [r3, #4]
	ldr r4, [sp, #0x30]
	movs r1, #0x81
	ldr r7, [r4]
	movs r3, #0x88
	rsbs r6, r1, #0
	lsls r1, r3, #1
	ands r7, r6
	add r1, fp
	movs r0, #1
	str r7, [r4]
	str r0, [r1]
	b _0800C944
	.byte 0x00, 0x00
_0800C9C0:
	.4byte 0x00000000
_0800C9C4:
	ldr r6, [sp, #0x48]
	ldr r0, [r1, #0x24]
	ldr r2, [r6, #0x2c]
	ldr r1, [r6, #0x28]
	movs r7, #0x60
	movs r6, #0x80
	str r7, [sp]
	str r4, [sp, #8]
	lsls r7, r6, #9
	movs r4, #0
	movs r6, #0xa
	movs r3, #0xa0
	str r7, [sp, #4]
	str r6, [sp, #0xc]
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	b _0800C944
_0800C9E8:
	ldr r4, [sp, #0x14]
	movs r2, #0x32
	ldr r0, [r4]
	rsbs r5, r2, #0
	adds r4, r0, #0
	muls r4, r5, r4
	movs r1, #0x80
	lsls r3, r1, #7
	cmp r4, r3
	ble _0800C9FE
	adds r4, r3, #0
_0800C9FE:
	mov r0, fp
	ldrh r7, [r0, #2]
	ldr r1, _0800CBB4
	adds r0, r7, #0
	mov sb, r1
	movs r1, #0
	bl _call_via_r9
	lsls r5, r0, #0x10
	asrs r2, r5, #0x15
	subs r5, r7, r2
	mov r2, fp
	ldrh r7, [r2, #4]
	lsls r0, r4, #0x10
	strh r5, [r2, #2]
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl _call_via_r9
	lsls r6, r0, #0x10
	mov r3, fp
	asrs r4, r6, #0x12
	subs r6, r7, r4
	ldrh r7, [r3, #0xc]
	ldrh r4, [r3, #6]
	mov sl, r7
	strh r6, [r3, #4]
	mov r1, sl
	adds r0, r4, #0
	bl _call_via_r9
	lsls r3, r0, #0x10
	asrs r1, r3, #0x14
	subs r2, r4, r1
	lsls r3, r5, #0x10
	ldr r1, _0800CBB8
	asrs r5, r3, #0x10
	mov r0, fp
	mov sl, r1
	strh r2, [r0, #6]
	adds r0, r5, #0
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r4, r1, #0x10
	str r4, [sp, #0x40]
	adds r0, r5, #0
	ldr r4, _0800CBBC
	bl _call_via_r4
	lsls r5, r0, #0x10
	lsls r0, r6, #0x10
	asrs r2, r5, #0x10
	asrs r5, r0, #0x10
	str r2, [sp, #0x3c]
	adds r0, r5, #0
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	str r1, [sp, #0x38]
	adds r0, r5, #0
	bl _call_via_r4
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	adds r5, r7, #0
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	mov r8, r2
	mov r0, r8
	bl _call_via_r10
	lsls r7, r0, #0x10
	asrs r0, r7, #0x10
	mov sl, r0
	mov r0, r8
	bl _call_via_r4
	ldr r6, [sp, #0x3c]
	lsls r3, r0, #0x10
	asrs r7, r3, #0x10
	adds r1, r7, #0
	muls r1, r6, r1
	asrs r6, r1, #0xc
	ldr r1, [sp, #0x40]
	mov r5, sb
	muls r5, r6, r5
	mov r4, sl
	muls r4, r1, r4
	asrs r0, r5, #0xc
	asrs r5, r4, #0xc
	adds r2, r0, r5
	ldr r0, [sp, #0x34]
	adds r4, r0, #0
	muls r4, r2, r4
	adds r0, r1, #0
	adds r3, r7, #0
	muls r3, r0, r3
	asrs r2, r4, #0xc
	asrs r4, r3, #0xc
	mov r0, sb
	muls r0, r4, r0
	ldr r1, [sp, #0x3c]
	asrs r3, r0, #0xc
	mov r0, sl
	muls r0, r1, r0
	ldr r1, [sp, #0x2c]
	asrs r0, r0, #0xc
	subs r3, r3, r0
	muls r3, r1, r3
	asrs r1, r3, #0xc
	adds r2, r2, r1
	ldr r1, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r7, [sp, #0x44]
	asrs r1, r3, #0xc
	muls r1, r7, r1
	ldr r3, [sp, #0x48]
	asrs r7, r1, #0xc
	adds r1, r2, r7
	str r1, [r3, #0x3c]
	ldr r7, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r2, [sp, #0x34]
	asrs r1, r3, #0xc
	adds r7, r2, #0
	muls r7, r1, r7
	ldr r2, [sp, #0x40]
	asrs r1, r7, #0xc
	ldr r7, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r2, r3
	ldr r7, [sp, #0x2c]
	asrs r3, r3, #0xc
	muls r3, r7, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	ldr r2, [sp, #0x44]
	mov r3, sb
	muls r3, r2, r3
	asrs r2, r3, #0xc
	mov r3, sb
	muls r3, r0, r3
	subs r1, r1, r2
	ldr r2, [sp, #0x48]
	str r1, [r2, #0x40]
	asrs r2, r3, #0xc
	mov r3, sb
	muls r3, r5, r3
	subs r0, r2, r4
	asrs r5, r3, #0xc
	ldr r4, [sp, #0x34]
	adds r3, r5, r6
	muls r3, r7, r3
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r5, r3, #0xc
	asrs r0, r2, #0xc
	adds r7, r0, r5
	ldr r5, [sp, #0x38]
	mov r6, sl
	muls r6, r5, r6
	asrs r0, r6, #0xc
	ldr r6, [sp, #0x44]
	muls r0, r6, r0
	asrs r6, r0, #0xc
	adds r0, r7, r6
	ldr r7, [sp, #0x48]
	mov r3, fp
	str r0, [r7, #0x44]
	ldr r2, [r7, #0x28]
	adds r3, #0xb0
	ldr r3, [r3]
	adds r6, r2, r1
	cmp r6, r3
	blt _0800CB6A
	b _0800C944
_0800CB6A:
	subs r0, r3, r2
	movs r4, #0xa2
	str r0, [r7, #0x40]
	lsls r1, r4, #1
	add r1, fp
	ldr r6, [r1]
	mov r2, fp
	adds r2, #0x9c
	str r6, [r2]
	ldr r5, [sp, #0x20]
	ldr r3, [sp, #0x14]
	str r5, [r3]
	ldr r4, [sp, #0x18]
	ldr r2, [r4]
	asrs r0, r2, #1
	str r0, [r4]
	ldr r4, [sp, #0x24]
	movs r1, #1
	movs r6, #0x80
	str r1, [r4]
	lsls r5, r6, #9
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	movs r7, #0x7f
	str r5, [sp, #4]
	ldr r5, [sp, #0x20]
	str r7, [sp]
	movs r6, #0xa
	movs r7, #2
	movs r3, #0xa0
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	str r5, [sp, #0x10]
	bl gamesfx_play_at
	b _0800C944
_0800CBB4:
	.4byte _03000814
_0800CBB8:
	.4byte cos_fx
_0800CBBC:
	.4byte sin_fx
_0800CBC0:
	movs r6, #0x80
	lsls r0, r6, #1
	ands r0, r3
	str r0, [sp, #0x1c]
	cmp r0, #0
	bne _0800CBCE
	b _0800CE2C
_0800CBCE:
	mov r6, fp
	ldrh r4, [r6, #2]
	ldr r7, _0800CDBC
	adds r0, r4, #0
	mov sb, r7
	movs r1, #0
	bl _call_via_r9
	lsls r7, r0, #0x10
	asrs r5, r7, #0x15
	mov r0, fp
	subs r7, r4, r5
	ldrh r4, [r0, #4]
	strh r7, [r0, #2]
	movs r1, #0
	adds r0, r4, #0
	bl _call_via_r9
	lsls r6, r0, #0x10
	asrs r1, r6, #0x12
	subs r6, r4, r1
	mov r1, fp
	ldrh r2, [r1, #0xc]
	ldrh r4, [r1, #6]
	mov r8, r2
	strh r6, [r1, #4]
	adds r0, r4, #0
	mov r1, r8
	bl _call_via_r9
	lsls r2, r0, #0x10
	asrs r3, r2, #0x14
	subs r1, r4, r3
	lsls r0, r7, #0x10
	ldr r4, _0800CDC0
	mov r3, fp
	asrs r5, r0, #0x10
	strh r1, [r3, #6]
	mov sl, r4
	adds r0, r5, #0
	bl _call_via_r10
	lsls r2, r0, #0x10
	asrs r7, r2, #0x10
	str r7, [sp, #0x40]
	adds r0, r5, #0
	ldr r7, _0800CDC4
	bl _call_via_r7
	lsls r3, r6, #0x10
	lsls r5, r0, #0x10
	asrs r4, r5, #0x10
	asrs r5, r3, #0x10
	str r4, [sp, #0x3c]
	adds r0, r5, #0
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	str r2, [sp, #0x38]
	adds r0, r5, #0
	bl _call_via_r7
	lsls r4, r0, #0x10
	asrs r0, r4, #0x10
	mov r5, r8
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	mov r8, r5
	mov r0, r8
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	mov sl, r0
	mov r0, r8
	bl _call_via_r7
	lsls r6, r0, #0x10
	ldr r0, [sp, #0x3c]
	asrs r7, r6, #0x10
	adds r1, r7, #0
	muls r1, r0, r1
	asrs r6, r1, #0xc
	ldr r1, [sp, #0x40]
	mov r5, sb
	muls r5, r6, r5
	mov r2, sl
	muls r2, r1, r2
	asrs r4, r5, #0xc
	asrs r5, r2, #0xc
	adds r3, r4, r5
	ldr r4, [sp, #0x34]
	adds r2, r4, #0
	muls r2, r3, r2
	adds r3, r7, #0
	muls r3, r1, r3
	asrs r4, r3, #0xc
	mov r1, sb
	muls r1, r4, r1
	asrs r3, r1, #0xc
	adds r1, r0, #0
	mov r0, sl
	muls r0, r1, r0
	ldr r1, [sp, #0x2c]
	asrs r0, r0, #0xc
	subs r3, r3, r0
	muls r3, r1, r3
	asrs r2, r2, #0xc
	asrs r1, r3, #0xc
	adds r2, r2, r1
	ldr r1, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r7, [sp, #0x44]
	asrs r1, r3, #0xc
	muls r1, r7, r1
	ldr r3, [sp, #0x48]
	asrs r7, r1, #0xc
	adds r1, r2, r7
	str r1, [r3, #0x3c]
	ldr r7, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r2, [sp, #0x34]
	asrs r1, r3, #0xc
	adds r7, r2, #0
	muls r7, r1, r7
	ldr r2, [sp, #0x40]
	asrs r1, r7, #0xc
	ldr r7, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r2, r3
	ldr r7, [sp, #0x2c]
	asrs r3, r3, #0xc
	muls r3, r7, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	ldr r2, [sp, #0x44]
	mov r3, sb
	muls r3, r2, r3
	asrs r2, r3, #0xc
	mov r3, sb
	muls r3, r0, r3
	subs r1, r1, r2
	ldr r2, [sp, #0x48]
	str r1, [r2, #0x40]
	asrs r2, r3, #0xc
	subs r0, r2, r4
	ldr r4, [sp, #0x34]
	adds r2, r4, #0
	muls r2, r0, r2
	mov r4, sb
	muls r4, r5, r4
	asrs r5, r4, #0xc
	adds r4, r5, r6
	ldr r3, [sp, #0x38]
	muls r4, r7, r4
	mov r6, sl
	muls r6, r3, r6
	asrs r0, r2, #0xc
	ldr r5, [sp, #0x44]
	asrs r7, r4, #0xc
	adds r4, r0, r7
	asrs r0, r6, #0xc
	muls r0, r5, r0
	asrs r7, r0, #0xc
	adds r5, r4, r7
	ldr r7, [sp, #0x48]
	str r5, [r7, #0x44]
	mov r5, fp
	ldr r4, [r7, #0x28]
	adds r5, #0xb0
	ldr r2, [r5]
	adds r3, r4, r1
	cmp r3, r2
	bgt _0800CD92
	movs r1, #0x8a
	lsls r2, r1, #1
	add r2, fp
	ldr r0, [r2]
	cmp r0, #0
	beq _0800CE00
	ldr r3, [sp, #0x48]
	movs r6, #0x80
	lsls r1, r6, #9
	ldr r0, [r3, #0x24]
	ldr r2, [r3, #0x2c]
	str r1, [sp, #4]
	ldr r1, [sp, #0x28]
	movs r7, #0x40
	str r7, [sp]
	movs r6, #0xa
	movs r7, #2
	str r1, [sp, #0x10]
	movs r3, #0xa0
	adds r1, r4, #0
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	bl gamesfx_play_at
_0800CD64:
	ldr r1, [sp, #0x48]
	ldr r7, [r5]
	ldr r3, [r1, #0x28]
	subs r6, r7, r3
	str r6, [r1, #0x40]
	ldr r0, [sp, #0x14]
	movs r2, #0x64
	movs r5, #0x8c
	str r2, [r0]
	lsls r2, r5, #1
	add r2, fp
	movs r6, #0
	ldrsh r4, [r2, r6]
	cmp r4, #0
	ble _0800CDFA
	ldr r4, _0800CDB8
	strh r4, [r2]
_0800CD86:
	movs r6, #0x8a
	lsls r0, r6, #1
	add r0, fp
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
_0800CD92:
	movs r5, #0x8d
	movs r2, #0x8c
	lsls r0, r5, #1
	lsls r6, r2, #1
	add r0, fp
	add r6, fp
	movs r7, #0
	ldrsh r5, [r0, r7]
	movs r0, #0
	ldrsh r4, [r6, r0]
	movs r0, #0x8a
	lsls r7, r0, #1
	add r7, fp
	ldr r2, [r7]
	lsls r1, r4, #1
	adds r4, r5, r1
	cmp r2, #2
	beq _0800CDD2
	b _0800CDC8
_0800CDB8:
	.4byte 0x00000CCC
_0800CDBC:
	.4byte _03000814
_0800CDC0:
	.4byte cos_fx
_0800CDC4:
	.4byte sin_fx
_0800CDC8:
	movs r7, #0x8d
	lsls r0, r7, #1
	add r0, fp
	strh r4, [r0]
	b _0800C944
_0800CDD2:
	cmp r5, #0
	ble _0800CDF0
_0800CDD6:
	cmp r4, #0
	bgt _0800CDC8
_0800CDDA:
	movs r2, #0x8a
	lsls r6, r2, #1
	movs r4, #0
	add r6, fp
	str r4, [r6]
	ldr r7, [sp, #0x30]
	ldr r3, _0800CE28
	ldr r1, [r7]
	ands r1, r3
	str r1, [r7]
	b _0800CDC8
_0800CDF0:
	cmp r4, #0
	bge _0800CDDA
	cmp r5, #0
	bge _0800CDD6
	b _0800CDC8
_0800CDFA:
	ldr r5, _0800CE24
	strh r5, [r2]
	b _0800CD86
_0800CE00:
	ldr r3, [sp, #0x28]
	movs r6, #0x80
	ldr r2, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	lsls r1, r6, #9
	movs r7, #0x7f
	str r7, [sp]
	str r1, [sp, #4]
	movs r7, #2
	movs r6, #0xa
	str r3, [sp, #0x10]
	adds r1, r4, #0
	movs r3, #0xa0
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	bl gamesfx_play_at
	b _0800CD64
_0800CE24:
	.4byte 0xFFFFF334
_0800CE28:
	.4byte 0xFFFFFEFF
_0800CE2C:
	mov r2, fp
	ldr r7, [r2, #8]
	ldrh r5, [r2, #2]
	ldr r3, _0800D1D8
	lsls r0, r7, #0x16
	mov sl, r3
	lsrs r1, r0, #0x10
	adds r0, r5, #0
	bl _call_via_r10
	lsls r6, r0, #0x10
	asrs r4, r6, #0x15
	subs r6, r5, r4
	mov r4, fp
	strh r6, [r4, #2]
	ldr r3, [sp, #0x70]
	mov r7, sb
	mov r1, r8
	ldrh r5, [r4, #4]
	rsbs r4, r7, #0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r3, #0
	muls r1, r3, r1
	adds r0, r7, r1
	ldr r1, _0800D1DC
	bl _call_via_r1
	ldr r7, _0800D1E0
	adds r1, r0, #0
	adds r0, r4, #0
	bl _call_via_r7
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r5, #0
	bl _call_via_r10
	lsls r4, r0, #0x10
	mov r3, fp
	asrs r7, r4, #0x14
	subs r5, r5, r7
	ldrh r7, [r3, #0xc]
	ldrh r4, [r3, #6]
	mov ip, r7
	mov r1, ip
	strh r5, [r3, #4]
	adds r0, r4, #0
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r1, r3, #0x14
	subs r2, r4, r1
	lsls r3, r6, #0x10
	ldr r1, _0800D1E4
	asrs r6, r3, #0x10
	mov r0, fp
	mov sl, r1
	strh r2, [r0, #6]
	adds r0, r6, #0
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r4, r1, #0x10
	str r4, [sp, #0x40]
	adds r0, r6, #0
	ldr r4, _0800D1E8
	bl _call_via_r4
	lsls r6, r0, #0x10
	lsls r0, r5, #0x10
	asrs r2, r6, #0x10
	asrs r6, r0, #0x10
	str r2, [sp, #0x3c]
	adds r0, r6, #0
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	str r1, [sp, #0x38]
	adds r0, r6, #0
	bl _call_via_r4
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	adds r5, r7, #0
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	mov r8, r2
	mov r0, r8
	bl _call_via_r10
	lsls r7, r0, #0x10
	asrs r0, r7, #0x10
	mov sl, r0
	mov r0, r8
	bl _call_via_r4
	ldr r6, [sp, #0x3c]
	lsls r3, r0, #0x10
	asrs r7, r3, #0x10
	adds r1, r7, #0
	muls r1, r6, r1
	asrs r6, r1, #0xc
	ldr r1, [sp, #0x40]
	mov r5, sb
	muls r5, r6, r5
	mov r4, sl
	muls r4, r1, r4
	asrs r0, r5, #0xc
	asrs r5, r4, #0xc
	adds r2, r0, r5
	ldr r0, [sp, #0x34]
	adds r4, r0, #0
	muls r4, r2, r4
	adds r0, r1, #0
	adds r3, r7, #0
	muls r3, r0, r3
	asrs r2, r4, #0xc
	asrs r4, r3, #0xc
	mov r0, sb
	muls r0, r4, r0
	ldr r1, [sp, #0x3c]
	asrs r3, r0, #0xc
	mov r0, sl
	muls r0, r1, r0
	ldr r1, [sp, #0x2c]
	asrs r0, r0, #0xc
	subs r3, r3, r0
	muls r3, r1, r3
	asrs r1, r3, #0xc
	adds r2, r2, r1
	ldr r1, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r7, [sp, #0x44]
	asrs r1, r3, #0xc
	muls r1, r7, r1
	ldr r3, [sp, #0x48]
	asrs r7, r1, #0xc
	adds r1, r2, r7
	str r1, [r3, #0x3c]
	ldr r7, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r2, [sp, #0x34]
	asrs r1, r3, #0xc
	adds r7, r2, #0
	muls r7, r1, r7
	ldr r2, [sp, #0x40]
	asrs r1, r7, #0xc
	ldr r7, [sp, #0x38]
	adds r3, r7, #0
	muls r3, r2, r3
	ldr r7, [sp, #0x2c]
	asrs r3, r3, #0xc
	muls r3, r7, r3
	asrs r2, r3, #0xc
	adds r1, r1, r2
	ldr r2, [sp, #0x44]
	mov r3, sb
	muls r3, r2, r3
	asrs r2, r3, #0xc
	subs r1, r1, r2
	ldr r2, [sp, #0x48]
	str r1, [r2, #0x40]
	mov r2, sb
	muls r2, r0, r2
	asrs r0, r2, #0xc
	subs r2, r0, r4
	ldr r4, [sp, #0x34]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r4, r0, #0xc
	mov r0, sb
	muls r0, r5, r0
	asrs r5, r0, #0xc
	adds r0, r5, r6
	muls r0, r7, r0
	ldr r3, [sp, #0x38]
	mov r6, sl
	muls r6, r3, r6
	asrs r5, r0, #0xc
	adds r0, r4, r5
	ldr r4, [sp, #0x44]
	asrs r7, r6, #0xc
	muls r7, r4, r7
	asrs r5, r7, #0xc
	ldr r7, [sp, #0x48]
	adds r4, r0, r5
	str r4, [r7, #0x44]
	mov r5, fp
	adds r5, #0xb0
	ldr r4, [r7, #0x28]
	ldr r3, [r5]
	adds r6, r4, r1
	cmp r3, r6
	bgt _0800CFC0
	b _0800C944
_0800CFC0:
	cmp r4, r3
	ble _0800CFEA
	movs r1, #0x7f
	movs r6, #0x80
	ldr r0, [r7, #0x24]
	ldr r2, [r7, #0x2c]
	ldr r3, [sp, #0x1c]
	str r1, [sp]
	lsls r1, r6, #9
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	adds r1, r4, #0
	movs r3, #0xa0
	movs r6, #2
	str r6, [sp, #8]
	bl gamesfx_play_at
	ldr r4, [r7, #0x28]
	ldr r3, [r5]
_0800CFEA:
	subs r5, r3, r4
	ldr r4, [sp, #0x48]
	str r5, [r4, #0x40]
	ldr r4, [sp, #0x14]
	ldr r0, [r4]
	movs r6, #0xa2
	asrs r2, r0, #1
	rsbs r1, r2, #0
	lsls r7, r6, #1
	str r1, [r4]
	add r7, fp
	ldr r5, [r7]
	mov r2, fp
	adds r2, #0x9c
	str r5, [r2]
	ldr r5, [sp, #0x18]
	ldr r0, [r5]
	asrs r2, r0, #1
	str r2, [r5]
	b _0800C944

	.global sub_0800D012
	.thumb_func
	.type sub_0800D012, %function
sub_0800D012: @ 0800D012
	movs r7, #0x90
	lsls r2, r7, #1
	add r2, fp
	ldr r5, [r2]
	ldr r3, _0800D1EC
	movs r6, #0x80
	adds r0, r5, r3
	lsls r7, r6, #9
	str r0, [r2]
	cmp r0, r7
	blt _0800D070
	adds r0, r7, #0
	movs r5, #2
	str r0, [r2]
	str r5, [r1]
	ldr r1, [sp, #0x30]
	ldr r4, [r1, #4]
	ldr r6, _0800D1F0
	adds r4, #0x98
	ldrb r0, [r6, r4]
	ldr r5, _0800D1F4
	muls r5, r0, r5
	movs r7, #0x98
	lsls r1, r7, #1
	add r1, fp
	ldr r6, [r1]
	muls r6, r5, r6
	movs r3, #0x96
	lsls r4, r3, #1
	add r4, fp
	ldr r5, [r4]
	movs r2, #0x92
	lsls r0, r2, #1
	asrs r7, r6, #0x10
	add r0, fp
	adds r2, r5, r7
	movs r6, #0x9a
	str r2, [r0]
	lsls r4, r6, #1
	add r4, fp
	ldr r1, [r4]
	cmp r1, #0
	beq _0800D070
	ldr r4, _0800D1F8
	muls r4, r2, r4
	asrs r7, r4, #0x10
	str r7, [r0]
_0800D070:
	movs r3, #0x94
	lsls r5, r3, #1
	add r5, fp
	ldr r2, [r5]
	subs r2, #2
	str r2, [r5]
	cmp r2, #0
	ble _0800D084
	bl sub_0800C79E
_0800D084:
	movs r0, #0x25
	bl obj_new
	ldr r3, [sp, #0x30]
	adds r7, r0, #0
	ldr r6, [r3, #4]
	adds r7, #0xa0
	movs r2, #0x9c
	str r6, [r7, #8]
	lsls r4, r2, #1
	add r4, fp
	ldr r1, [r4]
	str r1, [r7, #0xc]
	movs r1, #0
	bl obj_initialise
	movs r6, #4
	str r6, [r5]
	bl sub_0800C79E

	.global sub_0800D0AC
	.thumb_func
	.type sub_0800D0AC, %function
sub_0800D0AC: @ 0800D0AC
	cmp r3, #3
	beq _0800D0B4
	bl sub_0800C79E
_0800D0B4:
	movs r6, #0x90
	lsls r2, r6, #1
	add r2, fp
	ldr r0, [r2]
	ldr r4, _0800D1FC
	adds r5, r0, r4
	str r5, [r2]
	cmp r5, #0
	ble _0800D0CA
	bl sub_0800C79E
_0800D0CA:
	movs r0, #0
	str r0, [r2]
	str r0, [r1]
	ldr r7, [sp, #0x30]
	movs r5, #0x41
	ldr r1, [r7]
	rsbs r3, r5, #0
	ands r1, r3
	str r1, [r7]
	bl sub_0800C79E

	.global sub_0800D0E0
	.thumb_func
	.type sub_0800D0E0, %function
sub_0800D0E0: @ 0800D0E0
	movs r7, #0x92
	lsls r0, r7, #1
	add r0, fp
	ldr r5, [r0]
	subs r5, #2
	str r5, [r0]
	cmp r5, #0
	ble _0800D12C
_0800D0F0:
	movs r7, #0x94
	lsls r5, r7, #1
	add r5, fp
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
	cmp r0, #0
	ble _0800D104
	bl sub_0800C79E
_0800D104:
	movs r0, #0x25
	bl obj_new
	ldr r3, [sp, #0x30]
	adds r4, r0, #0
	ldr r1, [r3, #4]
	adds r4, #0xa0
	movs r7, #0x9c
	str r1, [r4, #8]
	lsls r2, r7, #1
	add r2, fp
	ldr r6, [r2]
	movs r1, #0
	str r6, [r4, #0xc]
	bl obj_initialise
	movs r1, #4
	str r1, [r5]
	bl sub_0800C79E
_0800D12C:
	movs r2, #3
	str r2, [r1]
	ldr r3, [sp, #0x30]
	ldr r6, _0800D200
	ldr r4, [r3]
	ldr r1, [sp, #0x30]
	ands r4, r6
	str r4, [r1]
	b _0800D0F0

	.global sub_0800D13E
	.thumb_func
	.type sub_0800D13E, %function
sub_0800D13E: @ 0800D13E
	cmp r5, #0
	blt _0800D146
	bl sub_0800C76A
_0800D146:
	ldr r2, [r0]
	cmp r2, r1
	blt _0800D150
	bl sub_0800C76A
_0800D150:
	bl sub_0800C768

	.global sub_0800D154
	.thumb_func
	.type sub_0800D154, %function
sub_0800D154: @ 0800D154
	cmp r3, #0
	bge _0800D1B0
	movs r2, #0x20
	rsbs r5, r2, #0
	bl sub_0800C750

	.global sub_0800D160
	.thumb_func
	.type sub_0800D160, %function
sub_0800D160: @ 0800D160
	movs r1, #0
	bl sub_0800C73E

	.global sub_0800D166
	.thumb_func
	.type sub_0800D166, %function
sub_0800D166: @ 0800D166
	mov r0, fp
	movs r5, #0
	movs r1, #0
	adds r0, #0xbc
	bl sub_0800C750

	.global sub_0800D172
	.thumb_func
	.type sub_0800D172, %function
sub_0800D172: @ 0800D172
	movs r6, #0x8c
	lsls r0, r6, #1
	ldr r3, [sp, #0x48]
	adds r7, r2, r0
	movs r6, #0
	ldrsh r2, [r7, r6]
	adds r6, r3, r0
	mov r1, fp
	movs r0, #0
	ldrsh r7, [r6, r0]
	ldr r4, [r1, #0x10]
	subs r2, r2, r7
	asrs r1, r4, #1
	cmp r2, #0
	ble _0800D1BE
	movs r7, #0x80
	lsls r0, r7, #9
	subs r5, r0, r1
	muls r5, r2, r5
_0800D198:
	asrs r1, r5, #4
_0800D19A:
	mov r0, fp
	adds r0, #0xbc
	ldr r6, [r0]
	subs r3, r1, r6
	cmp r3, #0
	ble _0800D1AC
	movs r5, #0x80
	bl sub_0800C750
_0800D1AC:
	cmp r3, #0
	blt _0800D1B6
_0800D1B0:
	movs r5, #0
	bl sub_0800C750
_0800D1B6:
	movs r3, #0x40
	rsbs r5, r3, #0
	bl sub_0800C750
_0800D1BE:
	cmp r2, #0
	bne _0800D1CC
	ldr r2, [sp, #0x30]
	ldr r6, [r5, #0x74]
	ldr r4, [r2, #0x74]
	cmp r4, r6
	ble _0800D1D0
_0800D1CC:
	movs r1, #0
	b _0800D19A
_0800D1D0:
	movs r7, #0x80
	lsls r0, r7, #9
	subs r5, r0, r1
	b _0800D198
_0800D1D8:
	.4byte _03000814
_0800D1DC:
	.4byte isqrt
_0800D1E0:
	.4byte atan2_fx
_0800D1E4:
	.4byte cos_fx
_0800D1E8:
	.4byte sin_fx
_0800D1EC:
	.4byte 0x00003332
_0800D1F0:
	.4byte gGameSetup
_0800D1F4:
	.4byte 0x00002492
_0800D1F8:
	.4byte 0x0000CCCC
_0800D1FC:
	.4byte 0xFFFFF000
_0800D200:
	.4byte 0xFEFFFFFF

	.global sub_0800D204
	.thumb_func
	.type sub_0800D204, %function
sub_0800D204: @ 0800D204
	ldr r2, _0800D330
	movs r3, #1
	rsbs r6, r3, #0
	ldr r3, [r2]
	movs r1, #0
	movs r5, #0
	cmp r1, r3
	bge _0800D2CC
	ldr r4, _0800D334
	adds r7, r0, #0
	mov ip, r3
	adds r0, r4, #0
_0800D21C:
	ldm r0!, {r2}
	adds r3, r2, #0
	adds r3, #0xa0
	ldr r2, [r3, #4]
	adds r2, #0x98
	ldrb r3, [r7, r2]
	cmp r3, r5
	ble _0800D230
	adds r5, r3, #0
	adds r6, r1, #0
_0800D230:
	adds r1, #1
	cmp r1, ip
	blt _0800D21C
_0800D236:
	lsls r1, r6, #2
	ldr r2, [r4, r1]
	movs r4, #0x8c
	lsls r5, r4, #1
	mov r6, fp
	ldr r7, [r6, #0x10]
	adds r6, r2, r5
	adds r0, r2, #0
	movs r4, #0
	ldrsh r2, [r6, r4]
	ldr r6, [sp, #0x48]
	adds r3, r5, #0
	adds r4, r6, r3
	asrs r1, r7, #1
	movs r7, #0
	ldrsh r5, [r4, r7]
	subs r2, r2, r5
	adds r0, #0xa0
	cmp r2, #0
	ble _0800D2B2
	movs r6, #0x80
	lsls r5, r6, #9
	subs r0, r5, r1
	muls r0, r2, r0
_0800D266:
	asrs r1, r0, #4
_0800D268:
	mov r0, fp
	adds r0, #0xbc
	ldr r4, [r0]
	subs r3, r1, r4
	cmp r3, #0
	ble _0800D2A4
	movs r5, #0x80
_0800D276:
	ldr r7, [r0]
	lsls r6, r5, #1
	adds r3, r7, r6
	str r3, [r0]
	cmp r5, #0
	ble _0800D298
	cmp r3, r1
	ble _0800D298
_0800D286:
	str r1, [r0]
_0800D288:
	ldr r5, [r0]
	movs r7, #0x80
	ldr r4, [sp, #0x44]
	lsls r3, r7, #9
	adds r0, r5, r3
	muls r0, r4, r0
	bl sub_0800C776
_0800D298:
	cmp r5, #0
	bge _0800D288
	ldr r2, [r0]
	cmp r2, r1
	bge _0800D288
	b _0800D286
_0800D2A4:
	cmp r3, #0
	blt _0800D2AC
	movs r5, #0
	b _0800D276
_0800D2AC:
	movs r3, #0x40
	rsbs r5, r3, #0
	b _0800D276
_0800D2B2:
	cmp r2, #0
	bne _0800D2C0
	ldr r2, [sp, #0x30]
	ldr r4, [r0, #0x74]
	ldr r7, [r2, #0x74]
	cmp r7, r4
	ble _0800D2C4
_0800D2C0:
	movs r1, #0
	b _0800D268
_0800D2C4:
	movs r6, #0x80
	lsls r5, r6, #9
	subs r0, r5, r1
	b _0800D266
_0800D2CC:
	ldr r4, _0800D334
	b _0800D236
_0800D2D0:
	cmp r1, r0
	blt _0800D2D8
	bl sub_0800C6F4
_0800D2D8:
	bl sub_0800C6F2
	cmp r1, #0
	blt _0800D2F6
	cmp r1, #0
	ble _0800D2EE
	movs r3, #5
	rsbs r5, r3, #0
	movs r0, #0
	bl sub_0800C6DC
_0800D2EE:
	movs r5, #0
	movs r0, #0
	bl sub_0800C6DC
_0800D2F6:
	movs r5, #5
	movs r0, #0
	bl sub_0800C6DC
	ldr r3, [sp, #0x48]
	mov r0, fp
	ldr r1, [r3, #0x4c]
	adds r0, #0xa4
	str r0, [sp, #0x14]
	bl sub_0800C6B2
	cmp r0, r5
	blt _0800D314
	bl sub_0800C692
_0800D314:
	bl sub_0800C690
	movs r1, #0
	bl sub_0800C678
	movs r1, #5
	bl sub_0800C678
	mov r3, fp
	adds r3, #0xa0
	str r3, [sp, #0x18]
	ldr r0, [r3]
	bl sub_0800C664
_0800D330:
	.4byte 0x0202DE5C
_0800D334:
	.4byte gRacerObjects

	.global sub_0800D338
	.thumb_func
	.type sub_0800D338, %function
sub_0800D338: @ 0800D338
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r0, #0xa0
	adds r5, r1, #0
	movs r3, #0x80
	ldr r1, [r0]
	lsls r0, r3, #0xe
	ands r1, r0
	cmp r1, #0
	beq _0800D3FE
	movs r2, #0x80
	lsls r4, r2, #1
	adds r2, r5, r4
	ldr r1, [r2]
	cmp r1, #0
	beq _0800D3CA
	movs r6, #0xe8
	adds r3, r6, r5
	adds r7, r5, #0
	adds r6, r5, #0
	mov r8, r3
	adds r7, #0xf0
	adds r6, #0xf8
_0800D368:
	adds r4, r5, #0
	adds r4, #0xec
	mov r1, r8
	ldr r2, [r4]
	ldr r3, [r1]
	subs r0, r2, r3
	asrs r1, r0, #3
	subs r0, r2, r1
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r2, [r0]
	ldr r3, [r7]
	subs r1, r2, r3
	asrs r3, r1, #3
	subs r1, r2, r3
	str r1, [r0]
	adds r1, r5, #0
	adds r1, #0xfc
	ldr r2, [r1]
	ldr r3, [r6]
	subs r5, r2, r3
	asrs r3, r5, #3
	subs r5, r2, r3
	str r5, [r1]
	mov r5, r8
	ldr r2, [r4]
	ldr r3, [r5]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r4]
	ldr r3, [r7]
	ldr r2, [r0]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r0]
	ldr r2, [r1]
	ldr r3, [r6]
	subs r0, r2, r3
	asrs r3, r0, #3
	subs r0, r2, r3
_0800D3BE:
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800D3CA:
	movs r1, #1
	movs r0, #0xe8
	adds r3, r0, r5
	str r1, [r2]
	mov r8, r3
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r7, r2, #0x12
	mov r1, r8
	str r7, [r1]
	bl multi_lfsr_next
	adds r7, r5, #0
	lsls r4, r0, #0x10
	asrs r6, r4, #0x12
	adds r7, #0xf0
	str r6, [r7]
	bl multi_lfsr_next
	adds r6, r5, #0
	lsls r1, r0, #0x10
	adds r6, #0xf8
	asrs r3, r1, #0x12
	str r3, [r6]
	b _0800D368
_0800D3FE:
	adds r4, r5, #0
	adds r4, #0xec
	ldr r1, [r4]
	asrs r3, r1, #3
	subs r0, r1, r3
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r1, r3, r2
	str r1, [r0]
	adds r1, r5, #0
	adds r1, #0xfc
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
	b _0800D3BE
	.byte 0x00, 0x00

	.global sub_0800D43C
	.thumb_func
	.type sub_0800D43C, %function
sub_0800D43C: @ 0800D43C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r0, #0xa0
	ldr r4, [r0]
	adds r5, r1, #0
	movs r1, #0x84
	lsls r0, r1, #6
	movs r2, #0x80
	ands r4, r0
	lsls r0, r2, #6
	cmp r4, r0
	beq _0800D4A4
	adds r4, r5, #0
	adds r4, #0xc4
	ldr r1, [r4]
	asrs r3, r1, #3
	subs r0, r1, r3
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r1, r3, r2
	str r1, [r0]
	adds r1, r5, #0
	adds r1, #0xdc
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
	asrs r2, r3, #0x1e
	subs r0, r3, r2
	str r0, [r1]
_0800D496:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800D4A4:
	adds r2, r5, #0
	adds r2, #0xe4
	ldr r6, [r2]
	cmp r6, #0
	bne _0800D4B0
	b _0800D602
_0800D4B0:
	movs r0, #0xc0
	adds r2, r0, r5
	movs r1, #0xcc
	mov r8, r2
	movs r2, #0xd8
	adds r3, r1, r5
	adds r1, r2, r5
	mov sl, r3
	mov sb, r1
_0800D4C2:
	adds r7, r5, #0
	adds r7, #0xc4
	mov r2, r8
	ldr r6, [r7]
	ldr r4, [r2]
	subs r3, r4, r6
	cmp r3, #0
	bgt _0800D4D4
	b _0800D5F4
_0800D4D4:
	movs r4, #0x20
_0800D4D6:
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r1, [r0]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r3, r3, r2
	lsls r2, r4, #1
	movs r4, #0x80
	adds r1, r1, r2
	adds r3, r3, r2
	lsls r2, r4, #2
	str r1, [r0]
	cmp r1, r2
	ble _0800D5EC
_0800D4F2:
	str r2, [r0]
_0800D4F4:
	str r3, [r7]
	mov r1, r8
	ldr r2, [r1]
	cmp r6, r2
	bgt _0800D506
	cmp r2, r3
	ble _0800D50A
	cmp r6, r2
	blt _0800D516
_0800D506:
	cmp r2, r3
	blt _0800D516
_0800D50A:
	bl multi_lfsr_next
	lsls r7, r0, #0x10
	asrs r6, r7, #0x13
	mov r2, r8
	str r6, [r2]
_0800D516:
	adds r7, r5, #0
	adds r7, #0xd0
	mov r1, sl
	ldr r6, [r7]
	ldr r2, [r1]
	subs r3, r2, r6
	cmp r3, #0
	ble _0800D5DE
	movs r4, #0x20
_0800D528:
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r1, [r0]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r3, r3, r2
	lsls r2, r4, #1
	movs r4, #0x80
	adds r1, r1, r2
	adds r3, r3, r2
	lsls r2, r4, #2
	str r1, [r0]
	cmp r1, r2
	ble _0800D5D6
_0800D544:
	str r2, [r0]
_0800D546:
	str r3, [r7]
	mov r1, sl
	ldr r2, [r1]
	cmp r6, r2
	bgt _0800D558
	cmp r2, r3
	ble _0800D55C
	cmp r6, r2
	blt _0800D568
_0800D558:
	cmp r2, r3
	blt _0800D568
_0800D55C:
	bl multi_lfsr_next
	lsls r6, r0, #0x10
	asrs r3, r6, #0x13
	mov r2, sl
	str r3, [r2]
_0800D568:
	adds r7, r5, #0
	adds r7, #0xdc
	mov r1, sb
	ldr r6, [r7]
	ldr r0, [r1]
	subs r3, r0, r6
	cmp r3, #0
	ble _0800D5C8
	movs r4, #0x20
_0800D57A:
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r1, [r0]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r3, r3, r2
	lsls r2, r4, #1
	adds r1, r1, r2
	adds r3, r3, r2
	movs r2, #0x80
	lsls r2, r2, #2
	str r1, [r0]
	cmp r1, r2
	ble _0800D5C0
_0800D596:
	str r2, [r0]
_0800D598:
	str r3, [r7]
	mov r1, sb
	ldr r2, [r1]
	cmp r6, r2
	bgt _0800D5AC
	cmp r2, r3
	ble _0800D5B2
	cmp r6, r2
	bge _0800D5AC
	b _0800D496
_0800D5AC:
	cmp r2, r3
	bge _0800D5B2
	b _0800D496
_0800D5B2:
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r1, r3, #0x13
	mov r2, sb
	str r1, [r2]
	b _0800D496
_0800D5C0:
	ldr r2, _0800D640
	cmp r1, r2
	bge _0800D598
	b _0800D596
_0800D5C8:
	cmp r3, #0
	blt _0800D5D0
	movs r4, #0
	b _0800D57A
_0800D5D0:
	movs r2, #0x20
	rsbs r4, r2, #0
	b _0800D57A
_0800D5D6:
	ldr r2, _0800D640
	cmp r1, r2
	bge _0800D546
	b _0800D544
_0800D5DE:
	cmp r3, #0
	blt _0800D5E6
	movs r4, #0
	b _0800D528
_0800D5E6:
	movs r1, #0x20
	rsbs r4, r1, #0
	b _0800D528
_0800D5EC:
	ldr r2, _0800D640
	cmp r1, r2
	bge _0800D4F4
	b _0800D4F2
_0800D5F4:
	cmp r3, #0
	blt _0800D5FC
	movs r4, #0
	b _0800D4D6
_0800D5FC:
	movs r3, #0x20
	rsbs r4, r3, #0
	b _0800D4D6
_0800D602:
	movs r4, #1
	movs r7, #0xc0
	str r4, [r2]
	adds r2, r7, r5
	mov r8, r2
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r6, r3, #0x13
	movs r0, #0xcc
	mov r3, r8
	adds r1, r0, r5
	str r6, [r3]
	mov sl, r1
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	movs r4, #0xd8
	mov r2, sl
	adds r3, r4, r5
	str r1, [r2]
	mov sb, r3
	bl multi_lfsr_next
	lsls r7, r0, #0x10
	asrs r3, r7, #0x13
	mov r1, sb
	str r3, [r1]
	b _0800D4C2
	.byte 0x00, 0x00
_0800D640:
	.4byte 0xFFFFFE00

	.global sub_0800D644
	.thumb_func
	.type sub_0800D644, %function
sub_0800D644: @ 0800D644
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r2, _0800D7B8
	mov r8, r0
	adds r7, r1, #0
	movs r1, #0
	ldrsh r0, [r2, r1]
	sub sp, #0x10
	cmp r0, #0
	beq _0800D748
	ldr r1, _0800D7BC
	ldr r0, [r1]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800D670
	ldrh r2, [r7]
	cmp r2, #1
	bne _0800D670
	b _0800D7AA
_0800D670:
	add r5, sp, #4
	mov r0, r8
	adds r1, r7, #0
	add r2, sp, #0xc
	add r3, sp, #8
	str r5, [sp]
	bl sub_0800BE00
	mov r1, r8
	mov r3, r8
	ldr r6, [r3, #0x24]
	ldr r4, [r1, #0x28]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #8]
	subs r5, r0, r6
	subs r6, r2, r4
	ldr r2, _0800D7BC
	ldr r3, [r2]
	ldr r0, [r1, #0x2c]
	ldr r1, [sp, #4]
	mov ip, r3
	subs r4, r1, r0
	mov r2, ip
	movs r0, #2
	ands r2, r0
	mov sl, r2
	cmp r2, #0
	beq _0800D75E
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0800C2E8
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	str r4, [sp]
	bl sub_0800C628
	mov r0, r8
	adds r1, r7, #0
	bl sub_0800D43C
	mov r0, r8
	adds r1, r7, #0
	bl sub_0800D338
_0800D6D2:
	ldrh r2, [r7, #4]
	lsls r0, r2, #3
	adds r2, r7, #0
	adds r2, #0xb4
	ldrh r1, [r2]
	adds r2, r1, r0
	adds r0, r7, #0
	adds r0, #0xd0
	ldr r3, [r0]
	adds r0, #0x24
	adds r1, r3, r2
	ldr r2, [r0]
	adds r0, r2, r1
	mov r2, r8
	adds r2, #0x54
	lsls r1, r0, #0x10
	strh r0, [r2]
	movs r0, #0xc0
	asrs r3, r1, #0x10
	lsls r1, r0, #6
	cmp r3, r1
	ble _0800D756
_0800D6FE:
	strh r1, [r2]
_0800D700:
	movs r3, #0x8d
	lsls r2, r3, #1
	adds r3, r7, r2
	ldrh r0, [r3]
	ldrh r2, [r7, #6]
	adds r1, r2, r0
	adds r0, r7, #0
	adds r0, #0xdc
	ldr r3, [r0]
	adds r0, #0x20
	adds r2, r3, r1
	ldr r1, [r0]
	adds r0, r1, r2
	mov r2, r8
	adds r2, #0x56
	strh r0, [r2]
	adds r1, r7, #0
	adds r1, #0xc4
	ldr r3, [r1]
	ldrh r0, [r7, #2]
	adds r1, #0x28
	adds r2, r0, r3
	ldr r3, [r1]
	adds r1, r3, r2
	mov r3, r8
	adds r3, #0xf4
	mov r2, r8
	strh r0, [r3]
	adds r2, #0x58
	ldrh r0, [r7, #4]
	adds r3, #2
	strh r1, [r2]
	ldrh r1, [r7, #0xc]
	strh r0, [r3]
	adds r3, #2
	strh r1, [r3]
_0800D748:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800D756:
	ldr r1, _0800D7C0
	cmp r3, r1
	bge _0800D700
	b _0800D6FE
_0800D75E:
	movs r6, #0xa4
	lsls r3, r6, #1
	adds r2, r7, #0
	adds r4, r7, r3
	adds r2, #0x9c
	ldr r5, [r2]
	ldr r0, [r4]
	adds r6, r0, #0
	muls r6, r5, r6
	asrs r5, r6, #0x10
	movs r2, #0xc
	ldrsh r6, [r7, r2]
	ldr r4, _0800D7C4
	adds r0, r6, #0
	bl _call_via_r4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r2, _0800D7C8
	adds r0, r6, #0
	bl _call_via_r2
	lsls r5, r5, #1
	lsls r3, r0, #0x10
	adds r1, r5, #0
	muls r1, r4, r1
	asrs r0, r3, #0x10
	adds r3, r5, #0
	muls r3, r0, r3
	asrs r2, r1, #0xc
	mov r1, r8
	str r2, [r1, #0x3c]
	mov r2, sl
	str r2, [r1, #0x40]
	asrs r2, r3, #0xc
	str r2, [r1, #0x44]
	b _0800D6D2
_0800D7AA:
	movs r5, #0x88
	lsls r3, r5, #1
	adds r4, r7, r3
	strh r1, [r7]
	str r2, [r4]
	b _0800D670
	.byte 0x00, 0x00
_0800D7B8:
	.4byte 0x020234AA
_0800D7BC:
	.4byte gModeFlags
_0800D7C0:
	.4byte 0xFFFFD000
_0800D7C4:
	.4byte sin_fx
_0800D7C8:
	.4byte cos_fx

	.global sub_0800D7CC
	.thumb_func
	.type sub_0800D7CC, %function
sub_0800D7CC: @ 0800D7CC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r1, #0x58]
	mov sl, r1
	cmp r0, #0
	bne _0800D7E4
	b _0800DC7E
_0800D7E4:
	ldr r2, [r1, #0x60]
	movs r1, #1
	rsbs r5, r1, #0
	cmp r2, r5
	beq _0800D81A
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _0800DAE0
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r6, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r6, r0, r6
	ldr r1, [r1, #0x20]
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	bge _0800D81A
	b _0800DC5C
_0800D81A:
	mov r1, sl
	ldr r5, [r1, #0x68]
	cmp r5, #0
	bne _0800D824
	b _0800DC02
_0800D824:
	ldr r2, [r1, #0x70]
	movs r1, #1
	rsbs r5, r1, #0
	cmp r2, r5
	beq _0800D85A
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _0800DAE0
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r6, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r6, r0, r6
	ldr r1, [r1, #0x20]
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	bge _0800D85A
	b _0800DBE0
_0800D85A:
	mov r1, sl
	ldr r5, [r1, #0x78]
	cmp r5, #0
	bne _0800D864
	b _0800DB86
_0800D864:
	mov r5, sl
	adds r5, #0x80
	movs r1, #1
	ldr r2, [r5]
	rsbs r6, r1, #0
	cmp r2, r6
	beq _0800D89E
	movs r0, #0x2c
	muls r2, r0, r2
	ldr r1, _0800DAE0
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #0x38]
	muls r3, r0, r3
	ldr r1, [r1, #0x20]
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r3, r2, r1
	cmp r3, #0
	bge _0800D89E
	b _0800DB64
_0800D89E:
	movs r1, #0x84
	add r1, sl
	ldr r6, [r1]
	mov ip, r1
	cmp r6, #0
	bne _0800D8AC
	b _0800DB08
_0800D8AC:
	mov r6, sl
	adds r6, #0x8c
	movs r1, #1
	rsbs r3, r1, #0
	ldr r2, [r6]
	mov lr, r3
	cmp r2, lr
	beq _0800D908
	movs r5, #0x2c
	muls r2, r5, r2
	ldr r1, _0800DAE0
	ldr r4, [r1]
	adds r1, r4, r2
	movs r0, #0x1c
	ldrsh r4, [r1, r0]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r5, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r5, r0, r5
	ldr r1, [r1, #0x20]
	asrs r3, r5, #8
	adds r5, r2, r3
	adds r3, r5, r1
	ldr r5, _0800DAE4
	cmp r3, r5
	bge _0800D908
	ldr r3, [r7, #0x24]
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r3, [r7, #0x2c]
	muls r3, r0, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r0, r2, r3
	adds r3, r0, r1
	cmp r3, r5
	blt _0800D908
	movs r2, #0
_0800D900:
	mov r0, ip
	mov r1, lr
	str r2, [r0]
	str r1, [r6]
_0800D908:
	movs r0, #0x85
	lsls r3, r0, #1
	adds r1, r7, r3
	ldrh r3, [r1]
	adds r6, r7, #0
	adds r6, #0xa0
	cmp r3, #1
	beq _0800D9D8
	cmp r3, #9
	beq _0800D9D8
	cmp r3, #2
	beq _0800D9D8
	cmp r3, #8
	beq _0800D9B0
	cmp r3, #3
	beq _0800D99E
	cmp r3, #0xa
	beq _0800D99E
	cmp r3, #4
	beq _0800D99E
	cmp r3, #5
	beq _0800D972
	cmp r3, #6
	beq _0800D94C
	cmp r3, #7
	beq _0800D9CE
_0800D93C:
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800D94C:
	ldr r0, [r6, #4]
	ldr r3, _0800DAE8
	adds r0, #0x98
	ldrb r1, [r3, r0]
	cmp r1, #0
	bne _0800D994
	mov r0, ip
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D964
	ldr r2, [r6]
	b _0800D9E4
_0800D964:
	ldr r2, [r6]
	movs r0, #0xc0
	lsls r1, r0, #4
	ands r1, r2
	cmp r1, #0
	beq _0800D93C
	b _0800D9E4
_0800D972:
	mov r2, sl
	ldr r0, [r2, #0x78]
	cmp r0, #0
	beq _0800D93C
	ldr r1, [r6]
	movs r3, #0x40
	ands r1, r3
	cmp r1, #0
	bne _0800D93C
	bl multi_lfsr_next
	ldr r2, _0800DAEC
	movs r1, #0xfa
	ands r0, r2
	lsls r2, r1, #2
	cmp r0, r2
	bge _0800D93C
_0800D994:
	ldr r0, [r6]
	movs r3, #2
	orrs r0, r3
	str r0, [r6]
	b _0800D93C
_0800D99E:
	mov r1, sl
	ldr r2, [r1, #0x68]
	cmp r2, #0
	beq _0800D93C
	ldr r0, [r6]
	movs r1, #2
	orrs r0, r1
	str r0, [r6]
	b _0800D93C
_0800D9B0:
	ldr r0, [r6, #4]
	ldr r3, _0800DAE8
	adds r0, #0x98
	ldrb r1, [r3, r0]
	cmp r1, #0
	beq _0800D9C6
	ldr r1, [r6]
	movs r3, #2
	orrs r1, r3
	str r1, [r6]
	b _0800D93C
_0800D9C6:
	mov r0, ip
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D93C
_0800D9CE:
	ldr r1, [r6]
	movs r0, #2
	orrs r1, r0
	str r1, [r6]
	b _0800D93C
_0800D9D8:
	ldr r2, [r6]
	movs r0, #0xc0
	lsls r1, r0, #4
	ands r1, r2
	cmp r1, #0
	beq _0800D9EC
_0800D9E4:
	movs r1, #2
	orrs r2, r1
	str r2, [r6]
	b _0800D93C
_0800D9EC:
	ldr r3, _0800DAE8
	ldr r1, [r6, #4]
	mov fp, r3
	adds r1, #0xa8
	mov r0, fp
	ldrb r4, [r0, r1]
	mov lr, fp
	cmp r4, #0
	beq _0800DA42
	mov r1, ip
	ldr r0, [r1]
	cmp r0, #0
	beq _0800DA42
	movs r4, #2
	orrs r2, r4
	str r2, [r6]
_0800DA0C:
	ldr r2, [r6]
	movs r4, #2
	ands r2, r4
	cmp r2, #0
	bne _0800D93C
	mov r1, sl
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _0800D93C
	ldr r2, [r7, #0x28]
	ldr r1, _0800DAF0
	cmp r2, r1
	ble _0800DA28
	b _0800D93C
_0800DA28:
	bl multi_lfsr_next
	ldr r1, _0800DAEC
	movs r2, #0xfa
	ands r0, r1
	lsls r1, r2, #2
	cmp r0, r1
	blt _0800DA3A
	b _0800D93C
_0800DA3A:
	ldr r0, [r6]
	orrs r0, r4
	str r0, [r6]
	b _0800D93C
_0800DA42:
	ldr r0, [r6, #4]
	mov r2, lr
	adds r0, #0x98
	ldrb r3, [r2, r0]
	adds r4, r2, #0
	adds r4, #0x88
	adds r3, #1
	movs r0, #0
	ldrsh r1, [r4, r0]
	mov r8, r3
	cmp r8, r1
	bge _0800DA0C
	mov sb, r6
_0800DA5C:
	mov r3, r8
	adds r3, #0xa8
	ldrb r5, [r2, r3]
	ldr r0, _0800DAF4
	lsls r2, r5, #2
	ldr r5, [r0, r2]
	ldr r3, [r7, #0x24]
	ldr r4, [r5, #0x24]
	ldr r2, [r7, #0x2c]
	subs r0, r3, r4
	ldr r3, [r5, #0x2c]
	subs r4, r2, r3
	asrs r1, r0, #8
	asrs r2, r4, #8
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r2, #0
	muls r1, r2, r1
	adds r2, r1, #0
	ldr r1, _0800DAF8
	adds r3, r3, r2
	cmp r3, r1
	bgt _0800DACA
	adds r1, r4, #0
	ldr r4, _0800DAFC
	bl _call_via_r4
	adds r3, r7, #0
	lsls r2, r0, #0x10
	adds r3, #0x56
	asrs r4, r2, #0x10
	movs r1, #0
	ldrsh r2, [r3, r1]
	ldr r3, _0800DB00
	subs r1, r2, r4
	adds r4, r1, r3
	ldr r1, _0800DB04
	cmp r4, r1
	bhi _0800DACA
	adds r4, r5, #0
	adds r4, #0x56
	movs r0, #0
	ldrsh r3, [r4, r0]
	subs r4, r2, r3
	ldr r2, _0800DB00
	adds r0, r4, r2
	cmp r0, r1
	bhi _0800DACA
	mov r0, sb
	ldr r1, [r0]
	movs r3, #2
	orrs r1, r3
	str r1, [r0]
	ldr r1, _0800DAE8
	mov fp, r1
_0800DACA:
	mov r2, fp
	adds r1, r2, #0
	movs r0, #1
	adds r1, #0x88
	add r8, r0
	movs r0, #0
	ldrsh r4, [r1, r0]
	cmp r8, r4
	blt _0800DA5C
	b _0800DA0C
	.byte 0x00, 0x00
_0800DAE0:
	.4byte 0x020234A0
_0800DAE4:
	.4byte 0xFFFFB1E0
_0800DAE8:
	.4byte gGameSetup
_0800DAEC:
	.4byte 0x0000FFFF
_0800DAF0:
	.4byte 0x00001770
_0800DAF4:
	.4byte gRacerObjects
_0800DAF8:
	.4byte 0x000007CF
_0800DAFC:
	.4byte atan2_fx
_0800DB00:
	.4byte 0x00000FFF
_0800DB04:
	.4byte 0x00001FFE
_0800DB08:
	mov r6, sl
	adds r6, #0x88
	movs r1, #1
	rsbs r3, r1, #0
	ldr r2, [r6]
	mov lr, r3
	cmp r2, lr
	bne _0800DB1A
	b _0800D908
_0800DB1A:
	movs r5, #0x2c
	muls r2, r5, r2
	ldr r1, _0800DCD8
	ldr r4, [r1]
	adds r1, r4, r2
	movs r0, #0x1c
	ldrsh r4, [r1, r0]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r5, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r5, r0, r5
	ldr r1, [r1, #0x20]
	asrs r3, r5, #8
	adds r5, r2, r3
	adds r3, r5, r1
	ldr r5, _0800DCDC
	cmp r3, r5
	blt _0800DB48
	b _0800D908
_0800DB48:
	ldr r3, [r7, #0x24]
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r3, [r7, #0x2c]
	muls r3, r0, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r0, r2, r3
	adds r3, r0, r1
	cmp r3, r5
	bge _0800DB60
	b _0800D908
_0800DB60:
	movs r2, #1
	b _0800D900
_0800DB64:
	ldr r3, [r7, #0x24]
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r3, [r7, #0x2c]
	muls r3, r0, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r0, r2, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DB7C
	b _0800D89E
_0800DB7C:
	movs r2, #0
	mov r0, sl
	str r2, [r0, #0x78]
	str r6, [r5]
	b _0800D89E
_0800DB86:
	ldr r2, [r1, #0x7c]
	movs r1, #1
	rsbs r5, r1, #0
	cmp r2, r5
	bne _0800DB92
	b _0800D89E
_0800DB92:
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _0800DCD8
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r6, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r6, r0, r6
	ldr r1, [r1, #0x20]
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	blt _0800DBBE
	b _0800D89E
_0800DBBE:
	ldr r6, [r7, #0x24]
	ldr r3, [r7, #0x2c]
	adds r2, r4, #0
	muls r2, r6, r2
	muls r3, r0, r3
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r0, r6, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DBD6
	b _0800D89E
_0800DBD6:
	mov r0, sl
	movs r2, #1
	str r2, [r0, #0x78]
	str r5, [r0, #0x7c]
	b _0800D89E
_0800DBE0:
	ldr r6, [r7, #0x24]
	ldr r3, [r7, #0x2c]
	adds r2, r4, #0
	muls r2, r6, r2
	muls r3, r0, r3
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r0, r6, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DBF8
	b _0800D85A
_0800DBF8:
	mov r0, sl
	movs r2, #0
	str r2, [r0, #0x68]
	str r5, [r0, #0x70]
	b _0800D85A
_0800DC02:
	ldr r2, [r1, #0x6c]
	movs r1, #1
	rsbs r5, r1, #0
	cmp r2, r5
	bne _0800DC0E
	b _0800D85A
_0800DC0E:
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _0800DCD8
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r6, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r6, r0, r6
	ldr r1, [r1, #0x20]
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	blt _0800DC3A
	b _0800D85A
_0800DC3A:
	ldr r6, [r7, #0x24]
	ldr r3, [r7, #0x2c]
	adds r2, r4, #0
	muls r2, r6, r2
	muls r3, r0, r3
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r0, r6, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DC52
	b _0800D85A
_0800DC52:
	mov r0, sl
	movs r2, #1
	str r2, [r0, #0x68]
	str r5, [r0, #0x6c]
	b _0800D85A
_0800DC5C:
	ldr r6, [r7, #0x24]
	ldr r3, [r7, #0x2c]
	adds r2, r4, #0
	muls r2, r6, r2
	muls r3, r0, r3
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r0, r6, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DC74
	b _0800D81A
_0800DC74:
	mov r0, sl
	movs r2, #0
	str r2, [r0, #0x58]
	str r5, [r0, #0x60]
	b _0800D81A
_0800DC7E:
	movs r0, #1
	ldr r2, [r1, #0x5c]
	rsbs r5, r0, #0
	cmp r2, r5
	bne _0800DC8A
	b _0800D81A
_0800DC8A:
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _0800DCD8
	ldr r4, [r1]
	adds r1, r4, r2
	movs r0, #0x1c
	ldrsh r4, [r1, r0]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r6, [r7, #0x38]
	asrs r2, r0, #8
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	muls r6, r0, r6
	ldr r1, [r1, #0x20]
	asrs r3, r6, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	blt _0800DCB6
	b _0800D81A
_0800DCB6:
	ldr r6, [r7, #0x24]
	ldr r3, [r7, #0x2c]
	adds r2, r4, #0
	muls r2, r6, r2
	muls r3, r0, r3
	asrs r6, r2, #8
	asrs r3, r3, #8
	adds r0, r6, r3
	adds r3, r0, r1
	cmp r3, #0
	bge _0800DCCE
	b _0800D81A
_0800DCCE:
	mov r0, sl
	movs r2, #1
	str r2, [r0, #0x58]
	str r5, [r0, #0x5c]
	b _0800D81A
_0800DCD8:
	.4byte 0x020234A0
_0800DCDC:
	.4byte 0xFFFF15A0

	.global sub_0800DCE0
	.thumb_func
	.type sub_0800DCE0, %function
sub_0800DCE0: @ 0800DCE0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	movs r0, #0xac
	lsls r1, r0, #1
	muls r2, r1, r2
	ldr r0, _0800DD54
	adds r1, r2, r0
	movs r2, #0xa0
	lsls r0, r2, #1
	adds r3, r1, #0
	adds r2, r1, r0
	adds r3, #0x9c
	ldr r3, [r3]
	ldr r2, [r2]
	muls r3, r2, r3
	asrs r0, r3, #0x10
	cmp r0, r2
	ble _0800DD0C
	adds r0, r2, #0
_0800DD0C:
	movs r2, #0x86
	lsls r3, r2, #1
	adds r1, r1, r3
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r2, _0800DD58
	ldr r1, [r2]
	adds r1, #0xa0
	ldr r2, [r1, #4]
	cmp r2, #4
	beq _0800DD40
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	movs r1, #0x80
	lsls r3, r1, #4
	subs r1, r3, r2
	muls r1, r0, r1
	asrs r0, r1, #0xb
_0800DD3A:
	pop {r4}
	pop {r1}
	bx r1
_0800DD40:
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	movs r1, #0x80
	lsls r3, r1, #9
	subs r1, r3, r2
	muls r1, r0, r1
	asrs r0, r1, #0x10
	b _0800DD3A
_0800DD54:
	.4byte 0x020234AC
_0800DD58:
	.4byte 0x0200436C

	.global sub_0800DD5C
	.thumb_func
	.type sub_0800DD5C, %function
sub_0800DD5C: @ 0800DD5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0xa0
	ldr r1, [r2, #4]
	movs r0, #0xac
	lsls r4, r0, #1
	muls r1, r4, r1
	ldr r5, _0800DE00
	adds r4, r1, r5
	adds r2, r4, #0
	adds r2, #0x9c
	ldr r0, [r2]
	asrs r5, r0, #4
	adds r1, r5, #0
	muls r1, r5, r1
	asrs r0, r1, #0xc
	muls r0, r5, r0
	asrs r1, r0, #0xc
	muls r1, r5, r1
	adds r0, r4, #0
	adds r0, #0xa4
	asrs r5, r1, #8
	movs r2, #2
	ldrsh r3, [r4, r2]
	ldr r1, [r0]
	lsls r0, r1, #8
	cmp r3, #0
	ble _0800DDFA
	adds r1, r3, #0
_0800DD98:
	adds r3, r4, #0
	adds r2, r4, #0
	adds r3, #0xf4
	ldr r3, [r3]
	adds r2, #0xfc
	ldr r2, [r2]
	asrs r3, r3, #1
	adds r2, r2, r3
	adds r3, r4, #0
	adds r3, #0xec
	ldr r3, [r3]
	asrs r3, r3, #2
	adds r2, r2, r3
	subs r3, r5, r0
	subs r0, r3, r1
	adds r3, r0, r2
	movs r0, #0xa0
	lsls r1, r0, #8
	adds r0, r3, r1
	movs r1, #0x84
	lsls r2, r1, #1
	adds r1, r4, r2
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r1, _0800DE04
	ldr r0, [r1]
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r1, [r2, #4]
	cmp r1, #4
	beq _0800DDE6
	ldr r0, _0800DE08
	ldr r2, [r0]
	lsls r1, r2, #2
	ldr r2, _0800DE0C
	ldr r0, [r2, r1]
_0800DDE6:
	movs r1, #0x84
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	adds r1, r6, #0
	bl sub_08020130
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_0800DDFA:
	rsbs r1, r3, #0
	b _0800DD98
	.byte 0x00, 0x00
_0800DE00:
	.4byte 0x020234AC
_0800DE04:
	.4byte 0x0200436C
_0800DE08:
	.4byte gLocalPlayerIndex
_0800DE0C:
	.4byte gRacerObjects

	.global sub_0800DE10
	.thumb_func
	.type sub_0800DE10, %function
sub_0800DE10: @ 0800DE10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	movs r3, #0x96
	adds r6, r0, #0
	lsls r2, r3, #1
	mov r8, r1
	adds r1, r6, r2
	ldr r0, [r1]
	adds r4, r6, #0
	sub sp, #0x18
	adds r4, #0xa0
	cmp r0, #0
	bne _0800DE30
	b _0800E11A
_0800DE30:
	movs r0, #0x88
	lsls r2, r0, #1
	add r2, r8
	ldr r3, [r2]
	mov sl, r2
	cmp r3, #1
	bne _0800DE40
	b _0800E0B4
_0800DE40:
	cmp r3, #3
	bne _0800DE46
	b _0800E056
_0800DE46:
	cmp r3, #4
	bne _0800DE4C
	b _0800E002
_0800DE4C:
	cmp r3, #6
	bne _0800DE52
	b _0800DFBC
_0800DE52:
	cmp r3, #8
	bne _0800DE58
	b _0800DF7E
_0800DE58:
	cmp r3, #0xa
	beq _0800DE6A
_0800DE5C:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800DE6A:
	movs r5, #0x94
	lsls r3, r5, #1
	adds r0, r6, r3
	bl gamesfx_release
	movs r7, #0x80
	movs r1, #0x84
	movs r3, #0x86
	lsls r0, r7, #7
	lsls r5, r1, #1
	lsls r7, r3, #1
	add r5, r8
	add r7, r8
	movs r1, #0x40
	str r0, [r5]
	str r1, [r7]
	movs r2, #0xac
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	muls r1, r0, r1
	ldr r5, _0800E194
	adds r2, r1, r5
	adds r7, r2, #0
	adds r7, #0xa4
	ldr r1, [r7]
	cmp r1, #0
	ble _0800DF78
	lsls r5, r1, #1
	adds r7, r5, r1
	lsls r0, r7, #0x10
	asrs r3, r0, #8
_0800DEA8:
	movs r1, #0x84
	lsls r7, r1, #1
	adds r1, r2, r7
	ldr r7, [r1]
	subs r5, r7, r3
	asrs r2, r5, #3
	subs r0, r7, r2
	str r0, [r1]
	ldr r5, _0800E198
	ldr r0, [r5]
	adds r7, r0, #0
	adds r7, #0xa0
	ldr r2, [r7, #4]
	cmp r2, #4
	beq _0800DED0
	ldr r2, _0800E19C
	ldr r0, [r2]
	ldr r7, _0800E1A0
	lsls r5, r0, #2
	ldr r0, [r7, r5]
_0800DED0:
	ldr r2, [r1]
	adds r1, r6, #0
	bl sub_08020130
	movs r2, #0xac
	adds r7, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	muls r0, r1, r0
	ldr r5, _0800E194
	adds r1, r0, r5
	adds r4, r1, #0
	adds r4, #0xa4
	ldr r0, [r4]
	cmp r0, #0
	ble _0800DF74
	movs r4, #0xa0
	muls r4, r0, r4
	asrs r0, r4, #8
_0800DEF6:
	movs r4, #0x86
	lsls r3, r4, #1
	adds r4, r1, r3
	ldr r2, [r4]
	subs r3, r2, r0
	asrs r5, r3, #3
	subs r0, r2, r5
	str r0, [r4]
	ldr r2, _0800E198
	ldr r1, [r2]
	adds r1, #0xa0
	ldr r5, [r1, #4]
	cmp r5, #4
	beq _0800DF60
	movs r1, #0x98
	lsls r3, r1, #1
	adds r4, r6, r3
	ldr r5, [r4]
	movs r2, #0x80
	lsls r1, r2, #4
	subs r4, r1, r5
	muls r4, r0, r4
	asrs r0, r4, #0xb
_0800DF24:
	movs r5, #0x94
	lsls r1, r5, #1
	adds r5, r6, r1
	subs r1, #0x24
	add r1, r8
	ldr r3, [r1]
	movs r4, #1
	str r0, [sp]
	movs r2, #1
	movs r0, #0
	str r4, [sp, #8]
	str r0, [sp, #0x10]
	rsbs r4, r2, #0
	ldr r0, _0800E1A4
	ldr r1, _0800E1A8
	adds r2, r6, #0
	str r7, [sp, #4]
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	bne _0800DF54
	b _0800DE5C
_0800DF54:
	movs r3, #0x88
	lsls r0, r3, #1
	add r0, r8
	movs r1, #0xb
	str r1, [r0]
	b _0800DE5C
_0800DF60:
	movs r5, #0x98
	lsls r3, r5, #1
	adds r1, r6, r3
	ldr r4, [r1]
	movs r2, #0x80
	lsls r5, r2, #9
	subs r1, r5, r4
	muls r1, r0, r1
	asrs r0, r1, #0x10
	b _0800DF24
_0800DF74:
	movs r0, #0xa0
	b _0800DEF6
_0800DF78:
	movs r1, #0xc0
	lsls r3, r1, #0xa
	b _0800DEA8
_0800DF7E:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	bl gamesfx_stop
	movs r5, #0x94
	lsls r4, r5, #1
	movs r1, #0x7f
	movs r2, #0x80
	lsls r0, r2, #9
	adds r5, r6, r4
	str r1, [sp]
	movs r4, #1
	movs r3, #1
	movs r1, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r1, [sp, #0x10]
	rsbs r4, r3, #0
	movs r0, #0
	adds r2, r6, #0
	movs r3, #4
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	bne _0800DFB8
	b _0800DE5C
_0800DFB8:
	movs r2, #9
	b _0800E050
_0800DFBC:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	bl gamesfx_stop
	adds r0, r6, #0
	bl sub_0800DCE0
	movs r4, #0x94
	movs r2, #0x80
	lsls r1, r4, #1
	str r0, [sp]
	lsls r0, r2, #9
	adds r4, r6, r1
	str r0, [sp, #4]
	movs r1, #2
	movs r2, #0x1e
	movs r0, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r1, #0
	movs r3, #0xdf
	ldr r0, _0800E1AC
	adds r2, r6, #0
	bl gamesfx_play_cb
	movs r3, #1
	rsbs r1, r3, #0
	str r0, [r4]
	cmp r0, r1
	bne _0800DFFE
	b _0800DE5C
_0800DFFE:
	movs r2, #7
	b _0800E050
_0800E002:
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_0800DD5C
	adds r7, r0, #0
	adds r0, r6, #0
	bl sub_0800DCE0
	movs r4, #0x94
	lsls r3, r4, #1
	str r0, [sp, #4]
	movs r1, #2
	movs r2, #0x1e
	movs r0, #0
	adds r4, r6, r3
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, _0800E1B0
	ldr r2, _0800E1B4
	adds r5, #0xae
	ldr r0, _0800E1AC
	adds r3, r6, #0
	str r5, [sp]
	str r7, [sp, #8]
	bl gamesfx_play_cb_endcb
	movs r1, #1
	rsbs r2, r1, #0
	str r0, [r4]
	cmp r0, r2
	bne _0800E04E
	b _0800DE5C
_0800E04E:
	movs r2, #5
_0800E050:
	mov r0, sl
	str r2, [r0]
	b _0800DE5C
_0800E056:
	movs r7, #0x94
	lsls r5, r7, #1
	adds r0, r6, r5
	bl gamesfx_stop
	bl lfsr_next
	movs r1, #0xa
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_0800DD5C
	adds r7, r0, #0
	adds r0, r6, #0
	bl sub_0800DCE0
	movs r4, #0x94
	lsls r2, r4, #1
	adds r4, r6, r2
	str r0, [sp, #4]
	movs r1, #2
	movs r2, #0x1e
	movs r0, #0
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, _0800E1B0
	adds r3, r6, #0
	adds r5, #0xae
	ldr r0, _0800E1AC
	ldr r2, _0800E1B4
	str r5, [sp]
	str r7, [sp, #8]
	bl gamesfx_play_cb_endcb
	movs r3, #1
	rsbs r1, r3, #0
	str r0, [r4]
	cmp r0, r1
	bne _0800E0AC
	b _0800DE5C
_0800E0AC:
	movs r1, #5
	mov r0, sl
	str r1, [r0]
	b _0800DE5C
_0800E0B4:
	movs r7, #0x94
	lsls r2, r7, #1
	adds r0, r6, r2
	bl gamesfx_stop
	movs r4, #0x86
	movs r3, #0x84
	lsls r0, r3, #1
	movs r5, #0x80
	lsls r7, r4, #1
	lsls r1, r5, #7
	add r0, r8
	add r7, r8
	movs r4, #0
	str r1, [r0]
	str r4, [r7]
	adds r0, r6, #0
	bl sub_0800DD5C
	adds r7, r0, #0
	adds r0, r6, #0
	bl sub_0800DCE0
	movs r2, #0x82
	movs r5, #0x94
	lsls r1, r2, #1
	lsls r3, r5, #1
	add r1, r8
	adds r5, r6, r3
	ldr r3, [r1]
	str r0, [sp]
	movs r0, #0x1e
	str r7, [sp, #4]
	str r0, [sp, #0xc]
	ldr r1, _0800E1B0
	adds r2, r6, #0
	movs r7, #2
	ldr r0, _0800E1AC
	str r7, [sp, #8]
	str r4, [sp, #0x10]
	bl gamesfx_play_cb
	movs r2, #1
	rsbs r1, r2, #0
	str r0, [r5]
	cmp r0, r1
	bne _0800E114
	b _0800DE5C
_0800E114:
	mov r0, sl
	str r7, [r0]
	b _0800DE5C
_0800E11A:
	movs r2, #0x88
	lsls r4, r2, #1
	add r4, r8
	ldr r3, [r4]
	cmp r3, #2
	beq _0800E184
	cmp r3, #5
	beq _0800E174
	cmp r3, #4
	beq _0800E16C
	cmp r3, #7
	beq _0800E15C
	cmp r3, #9
	beq _0800E14C
	cmp r3, #0xb
	beq _0800E13C
	b _0800DE5C
_0800E13C:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r6, r1
	bl gamesfx_stop
	movs r2, #0xa
	str r2, [r4]
	b _0800DE5C
_0800E14C:
	movs r1, #0x94
	lsls r3, r1, #1
	adds r0, r6, r3
	bl gamesfx_stop
	movs r0, #8
	str r0, [r4]
	b _0800DE5C
_0800E15C:
	movs r1, #0x94
	lsls r2, r1, #1
	adds r0, r6, r2
	bl gamesfx_stop
	movs r0, #6
	str r0, [r4]
	b _0800DE5C
_0800E16C:
	movs r1, #0x94
	lsls r3, r1, #1
	adds r0, r6, r3
	b _0800E17A
_0800E174:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r6, r1
_0800E17A:
	bl gamesfx_stop
	movs r2, #3
	str r2, [r4]
	b _0800DE5C
_0800E184:
	movs r3, #0x94
	lsls r1, r3, #1
	adds r0, r6, r1
	bl gamesfx_stop
	movs r0, #1
	str r0, [r4]
	b _0800DE5C
_0800E194:
	.4byte 0x020234AC
_0800E198:
	.4byte 0x0200436C
_0800E19C:
	.4byte gLocalPlayerIndex
_0800E1A0:
	.4byte gRacerObjects
_0800E1A4:
	.4byte sub_0800E8C8
_0800E1A8:
	.4byte sub_0800E940
_0800E1AC:
	.4byte sub_0800DCE0
_0800E1B0:
	.4byte sub_0800DD5C
_0800E1B4:
	.4byte comp_engine_sample_end

	.global act_comp_player
	.thumb_func
	.type act_comp_player, %function
act_comp_player: @ 0800E1B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xa0
	movs r6, #0xac
	ldr r7, [r5, #4]
	lsls r2, r6, #1
	muls r7, r2, r7
	ldr r1, _0800E2F0
	adds r6, r7, r1
	ldrh r1, [r6]
	cmp r1, #0
	bne _0800E1D4
	b _0800E348
_0800E1D4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800D644
	adds r7, r4, #0
	ldr r1, [r4, #0x24]
	adds r7, #0x84
	str r1, [r7]
	ldr r0, [r4, #0x28]
	adds r7, #4
	str r0, [r7]
	ldr r2, [r4, #0x2c]
	adds r7, #4
	str r2, [r7]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x3c]
	adds r1, r2, r3
	ldr r0, [r4, #0x28]
	str r1, [r4, #0x24]
	ldr r1, [r4, #0x40]
	ldr r7, [r4, #0x2c]
	str r2, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r0, r1
	ldr r0, [r4, #0x44]
	adds r1, r7, r0
	str r7, [r4, #0x38]
	str r2, [r4, #0x28]
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	ldr r2, _0800E2F4
	bl _call_via_r2
	ldr r7, [r5]
	ldr r3, _0800E2F8
	adds r1, r4, #0
	ands r7, r3
	str r7, [r5]
	adds r1, #0x90
	movs r7, #0
	ldr r2, _0800E2FC
	str r7, [r1]
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #6
	bls _0800E238
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800D7CC
_0800E238:
	adds r0, r4, #0
	bl weaponManager
	ldr r0, [r5]
	movs r1, #0x80
	lsls r3, r1, #5
	ands r0, r3
	cmp r0, #0
	beq _0800E262
	adds r2, r4, #0
	adds r2, #0xfe
	ldrh r1, [r2]
	subs r1, #2
	lsls r0, r1, #0x10
	strh r1, [r2]
	cmp r0, #0
	bgt _0800E25C
	b _0800E32C
_0800E25C:
	adds r0, r4, #0
	bl sub_08003EBC
_0800E262:
	ldr r0, [r5]
	movs r3, #0x80
	lsls r1, r3, #6
	ands r0, r1
	cmp r0, #0
	beq _0800E280
	movs r2, #0x80
	lsls r0, r2, #1
	adds r2, r4, r0
	ldrh r1, [r2]
	subs r1, #2
	lsls r0, r1, #0x10
	strh r1, [r2]
	cmp r0, #0
	ble _0800E304
_0800E280:
	ldr r1, [r5]
	movs r0, #0x80
	lsls r3, r0, #0xe
	ands r1, r3
	cmp r1, #0
	beq _0800E29E
	movs r2, #0x84
	lsls r1, r2, #1
	adds r2, r4, r1
	ldrh r0, [r2]
	subs r0, #2
	lsls r1, r0, #0x10
	strh r0, [r2]
	cmp r1, #0
	ble _0800E2D2
_0800E29E:
	ldr r1, [r5]
	movs r0, #0x80
	lsls r3, r0, #0xd
	ands r1, r3
	cmp r1, #0
	beq _0800E2B0
	adds r0, r4, #0
	bl sub_080041BC
_0800E2B0:
	ldr r1, _0800E2FC
	adds r1, #0x8c
	ldr r2, [r1]
	cmp r2, #6
	bls _0800E2C2
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800DE10
_0800E2C2:
	movs r0, #0x96
	lsls r1, r0, #1
	adds r0, r4, r1
	movs r2, #0
	str r2, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800E2D2:
	ldr r0, _0800E2EC
	strh r0, [r2]
	ldr r3, _0800E300
	ldr r1, [r5]
	movs r0, #0x80
	ands r1, r3
	lsls r2, r0, #1
	str r1, [r5]
	adds r0, r6, r2
	movs r1, #0
	str r1, [r0]
	b _0800E29E
	.byte 0x00, 0x00
_0800E2EC:
	.4byte 0x00000000
_0800E2F0:
	.4byte 0x020234AC
_0800E2F4:
	.4byte sub_03003750
_0800E2F8:
	.4byte 0xFFFCFFFF
_0800E2FC:
	.4byte gGameSetup
_0800E300:
	.4byte 0xFFDFFFFF
_0800E304:
	ldr r0, _0800E324
	strh r0, [r2]
	ldr r3, _0800E328
	ldr r1, [r5]
	adds r0, r6, #0
	ands r1, r3
	str r1, [r5]
	adds r0, #0xe4
	movs r2, #0
	movs r1, #0x88
	str r2, [r0]
	lsls r2, r1, #1
	adds r1, r6, r2
	movs r0, #1
	str r0, [r1]
	b _0800E280
_0800E324:
	.4byte 0x00000000
_0800E328:
	.4byte 0xFFFFDFFF
_0800E32C:
	strh r7, [r2]
	ldr r3, _0800E358
	ldr r1, [r5]
	movs r0, #0x88
	ands r1, r3
	str r1, [r5]
	lsls r1, r0, #1
	adds r0, r6, r1
	movs r2, #1
	str r2, [r0]
	adds r0, r4, #0
	bl sub_08004128
	b _0800E262
_0800E348:
	ldr r1, _0800E354
	strh r1, [r6]
	bl sub_080040A4
	b _0800E1D4
	.byte 0x00, 0x00
_0800E354:
	.4byte 0x00000001
_0800E358:
	.4byte 0xFFFFEFFF

	.global sub_0800E35C
	.thumb_func
	.type sub_0800E35C, %function
sub_0800E35C: @ 0800E35C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0xa0
	movs r6, #0xac
	adds r4, r2, #0
	ldr r2, [r1, #4]
	lsls r0, r6, #1
	muls r2, r0, r2
	ldr r0, _0800E43C
	movs r3, #0x8c
	adds r6, r2, r0
	ldr r2, [r1]
	lsls r3, r3, #5
	ands r3, r2
	movs r0, #0
	cmp r3, #0
	beq _0800E396
_0800E380:
	movs r2, #0x8e
	lsls r1, r2, #1
	adds r2, r6, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _0800E390
	movs r1, #3
	str r1, [r2]
_0800E390:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0800E396:
	cmp r4, #0
	beq _0800E422
	movs r4, #0x80
	lsls r0, r4, #1
	orrs r2, r0
	str r2, [r1]
	adds r2, r6, #0
	adds r2, #0xb0
	ldr r4, [r2]
	ldr r7, [r5, #0x28]
	movs r1, #0xa
	subs r0, r4, r7
	rsbs r7, r1, #0
	adds r5, r0, #0
	muls r5, r7, r5
	ldr r4, _0800E440
	lsls r0, r5, #1
	bl _call_via_r4
	lsls r5, r0, #8
	adds r0, r5, #0
	cmp r5, #0
	blt _0800E41E
_0800E3C4:
	ldr r7, _0800E444
	movs r1, #0xa
	bl _call_via_r7
	adds r4, r0, #0
	cmp r5, #0
	blt _0800E41A
_0800E3D2:
	movs r3, #0xc0
	lsls r5, r3, #0x11
	adds r1, r4, #0
	cmp r4, #0
	blt _0800E416
_0800E3DC:
	adds r0, r5, #0
	bl _call_via_r7
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _0800E412
_0800E3EA:
	movs r4, #0x8c
	lsls r1, r4, #1
	adds r4, r6, r1
	strh r0, [r4]
	bl multi_lfsr_next
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _0800E404
	ldrh r2, [r4]
	rsbs r0, r2, #0
	strh r0, [r4]
_0800E404:
	movs r1, #0x88
	lsls r2, r1, #1
	adds r1, r6, r2
	movs r0, #3
	str r0, [r1]
_0800E40E:
	movs r0, #1
	b _0800E380
_0800E412:
	rsbs r0, r0, #0
	b _0800E3EA
_0800E416:
	rsbs r1, r4, #0
	b _0800E3DC
_0800E41A:
	rsbs r4, r4, #0
	b _0800E3D2
_0800E41E:
	rsbs r0, r5, #0
	b _0800E3C4
_0800E422:
	movs r3, #0x80
	orrs r2, r3
	str r2, [r1]
	adds r2, r6, #0
	adds r2, #0xb8
	movs r1, #0x88
	str r0, [r2]
	lsls r0, r1, #1
	adds r1, r6, r0
	movs r2, #3
	str r2, [r1]
	b _0800E40E
	.byte 0x00, 0x00
_0800E43C:
	.4byte 0x020234AC
_0800E440:
	.4byte isqrt
_0800E444:
	.4byte udiv

	.global react_comp_player
	.thumb_func
	.type react_comp_player, %function
react_comp_player: @ 0800E448
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #0x14
	adds r4, r1, #0
	cmp r5, #0
	bne _0800E456
	b _0800E666
_0800E456:
	cmp r4, #0
	bne _0800E45C
	b _0800E64E
_0800E45C:
	ldrb r3, [r4, #2]
	subs r3, #1
	cmp r3, #0x2a
	bhi _0800E54C
	ldr r2, _0800E680
	lsls r0, r3, #2
	ldr r1, [r0, r2]
	mov pc, r1
	.global _0800E46C
_0800E46C:
	.4byte _0800E518
	.4byte _0800E566
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E606
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E60E
	.4byte _0800E626
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E54C
	.4byte _0800E646
	.global _0800E518
_0800E518:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	blt _0800E554
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r0, [r1]
	movs r2, #0x80
	lsls r3, r2, #5
	ands r0, r3
	cmp r0, #0
	beq _0800E54C
	ldr r1, [r1, #4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_0800E35C
	cmp r0, #0
	beq _0800E54C
	adds r0, r4, #0
	adds r1, r5, #0
_0800E540:
	bl sub_08020210
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802026C
	.global _0800E54C
_0800E54C:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800E554:
	adds r6, r5, #0
	adds r6, #0xa0
	ldr r0, [r6]
	movs r3, #0x80
	lsls r1, r3, #5
	ands r0, r1
	cmp r0, #0
	beq _0800E600
	b _0800E5CA
	.global _0800E566
_0800E566:
	ldr r1, [r5, #0x50]
	cmp r1, #0
	blt _0800E5BA
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r4, [r0]
	movs r2, #0x80
	lsls r1, r2, #5
	ands r4, r1
	cmp r4, #0
	beq _0800E588
	ldr r1, [r0, #4]
	movs r2, #0
	adds r0, r5, #0
	bl sub_0800E35C
	b _0800E54C
_0800E588:
	adds r2, r5, #0
	adds r2, #0xa0
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0800E54C
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
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	b _0800E54C
_0800E5BA:
	adds r6, r5, #0
	adds r6, #0xa0
	ldr r2, [r6]
	movs r0, #0x80
	lsls r1, r0, #5
	ands r2, r1
	cmp r2, #0
	beq _0800E600
_0800E5CA:
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0800E5F0
_0800E5D6:
	ldr r1, [r2, #4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_0800E35C
	adds r2, r5, #0
	adds r2, #0x90
	str r4, [r2]
	ldr r1, _0800E684
	ldr r0, [r6]
	ands r0, r1
	str r0, [r6]
	b _0800E54C
_0800E5F0:
	adds r2, r5, #0
	adds r2, #0x90
	str r4, [r2]
	ldr r3, _0800E684
	ldr r1, [r6]
	ands r1, r3
	str r1, [r6]
	b _0800E54C
_0800E600:
	adds r2, r4, #0
	adds r2, #0xa0
	b _0800E5D6
	.global _0800E606
_0800E606:
	adds r0, r5, #0
	bl weaponAllocate
	b _0800E54C
	.global _0800E60E
_0800E60E:
	adds r1, r5, #0
	adds r1, #0x90
	str r4, [r1]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r1, [r0]
	ldr r2, [r0, #4]
	movs r3, #1
	adds r0, r5, #0
	bl sub_0800E740
	b _0800E54C
	.global _0800E626
_0800E626:
	adds r4, #0xa0
	ldr r1, [r4, #8]
	adds r0, r5, #0
	movs r2, #0
	bl sub_0800E35C
	cmp r0, #0
	bne _0800E638
	b _0800E54C
_0800E638:
	ldr r2, [r4, #8]
	ldr r1, _0800E688
	lsls r0, r2, #2
	ldr r4, [r1, r0]
	adds r1, r5, #0
	adds r0, r4, #0
	b _0800E540
	.global _0800E646
_0800E646:
	adds r0, r5, #0
	bl sub_0800E6A8
	b _0800E54C
_0800E64E:
	ldr r0, _0800E68C
	ldr r1, _0800E690
	str r0, [sp]
	ldr r2, _0800E694
	ldr r0, _0800E698
	ldr r3, _0800E69C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800E45C
_0800E666:
	ldr r0, _0800E6A0
	ldr r1, _0800E690
	str r0, [sp]
	ldr r2, _0800E694
	ldr r0, _0800E698
	ldr r3, _0800E6A4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800E456
	.byte 0x00, 0x00
_0800E680:
	.4byte _0800E46C
_0800E684:
	.4byte 0xFFFEFFFF
_0800E688:
	.4byte gRacerObjects
_0800E68C:
	.4byte gUnk_08050270
_0800E690:
	.4byte gUnk_0805021C
_0800E694:
	.4byte gUnk_0805027C
_0800E698:
	.4byte gUnk_080501E0
_0800E69C:
	.4byte 0x00000B33
_0800E6A0:
	.4byte gUnk_08050248
_0800E6A4:
	.4byte 0x00000B32

	.global sub_0800E6A8
	.thumb_func
	.type sub_0800E6A8, %function
sub_0800E6A8: @ 0800E6A8
	push {r4, r5, lr}
	sub sp, #0x14
	movs r4, #0x7f
	movs r3, #0x80
	str r4, [sp]
	lsls r4, r3, #9
	str r4, [sp, #4]
	movs r4, #2
	str r4, [sp, #8]
	movs r4, #4
	adds r5, r0, #0
	str r4, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	adds r4, r5, #0
	ldr r1, [r5, #0x28]
	movs r3, #0xf1
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x2c]
	adds r4, #0xa0
	bl gamesfx_play_at
	ldr r0, [r4]
	movs r3, #0x80
	lsls r1, r3, #5
	ands r0, r1
	cmp r0, #0
	beq _0800E6E8
_0800E6E0:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_0800E6E8:
	adds r0, r5, #0
	bl sub_08004168
	ldr r1, [r4]
	movs r2, #0x86
	lsls r0, r2, #6
	ands r0, r1
	cmp r0, #0
	bne _0800E6E0
	ldr r2, [r4, #4]
	movs r3, #0xac
	lsls r3, r3, #1
	muls r2, r3, r2
	ldr r3, _0800E73C
	adds r2, r2, r3
	movs r3, #0x80
	lsls r3, r3, #0xe
	orrs r1, r3
	str r1, [r4]
	movs r1, #0x84
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, _0800E738
	strh r3, [r1]
	movs r3, #0x80
	lsls r1, r3, #1
	adds r3, r2, r1
	str r0, [r3]
	movs r3, #0x9e
	adds r1, r2, #0
	lsls r0, r3, #1
	adds r2, r2, r0
	adds r1, #0x9c
	ldr r0, [r1]
	ldr r2, [r2]
	cmp r0, r2
	ble _0800E6E0
	str r2, [r1]
	b _0800E6E0
	.byte 0x00, 0x00
_0800E738:
	.4byte 0x00000014
_0800E73C:
	.4byte 0x020234AC

	.global sub_0800E740
	.thumb_func
	.type sub_0800E740, %function
sub_0800E740: @ 0800E740
	push {r4, r5, r6, lr}
	adds r0, #0xa0
	ldr r5, [r0, #4]
	movs r6, #0xac
	lsls r4, r6, #1
	adds r6, r5, #0
	muls r6, r4, r6
	ldr r5, _0800E7D8
	adds r6, r6, r5
	movs r5, #0x8e
	lsls r4, r5, #1
	adds r5, r6, r4
	movs r4, #1
	str r4, [r5]
	ldr r5, _0800E7DC
	ldr r4, [r0]
	orrs r4, r5
	movs r5, #0x94
	str r4, [r0]
	lsls r4, r5, #1
	adds r0, r6, r4
	movs r5, #0
	adds r4, #4
	str r5, [r0]
	adds r0, r6, r4
	movs r4, #0x98
	str r1, [r0]
	lsls r1, r4, #1
	adds r4, r6, r1
	str r2, [r4]
	movs r4, #0x9a
	lsls r0, r4, #1
	movs r1, #0x9c
	adds r4, r6, r0
	lsls r0, r1, #1
	adds r6, r6, r0
	str r3, [r4]
	str r5, [r6]
	ldr r0, [r4]
	cmp r0, #0
	beq _0800E7A8
	bl multi_lfsr_next
	ldr r1, _0800E7E0
	movs r2, #0x14
	ldrsh r3, [r1, r2]
	cmp r3, #0
	beq _0800E7C8
	cmp r3, #1
	beq _0800E7BA
	cmp r3, #2
	beq _0800E7AE
_0800E7A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800E7AE:
	ldr r1, _0800E7E4
	cmp r0, r1
	bgt _0800E7A8
	str r5, [r4]
	str r3, [r6]
	b _0800E7A8
_0800E7BA:
	ldr r1, _0800E7E8
	cmp r0, r1
	bgt _0800E7A8
	movs r0, #2
	str r5, [r4]
	str r0, [r6]
	b _0800E7A8
_0800E7C8:
	ldr r1, _0800E7EC
	cmp r0, r1
	bgt _0800E7A8
	movs r2, #2
	str r3, [r4]
	str r2, [r6]
	b _0800E7A8
	.byte 0x00, 0x00
_0800E7D8:
	.4byte 0x020234AC
_0800E7DC:
	.4byte 0x01000040
_0800E7E0:
	.4byte gGameSetup
_0800E7E4:
	.4byte 0x0000E665
_0800E7E8:
	.4byte 0x0000B333
_0800E7EC:
	.4byte 0x00001999

	.global free_comp_player
	.thumb_func
	.type free_comp_player, %function
free_comp_player: @ 0800E7F0
	push {lr}
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	movs r3, #0xac
	lsls r1, r3, #1
	muls r1, r2, r1
	ldr r2, _0800E81C
	adds r3, r1, r2
	movs r1, #0x88
	lsls r2, r1, #1
	adds r1, r3, r2
	movs r2, #0
	str r2, [r1]
	movs r2, #0x94
	lsls r1, r2, #1
	adds r0, r0, r1
	bl gamesfx_stop
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0800E81C:
	.4byte 0x020234AC

	.global sub_0800E820
	.thumb_func
	.type sub_0800E820, %function
sub_0800E820: @ 0800E820
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x94
	lsls r2, r0, #1
	adds r0, r4, r2
	bl gamesfx_stop
	adds r4, #0xa0
	ldr r0, [r4]
	movs r3, #0x80
	lsls r1, r3, #8
	orrs r0, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	.global sub_0800E840
	.thumb_func
	.type sub_0800E840, %function
sub_0800E840: @ 0800E840
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xa0
	ldr r3, [r4, #4]
	ldr r2, _0800E890
	adds r3, #0x98
	ldrb r3, [r2, r3]
	ldr r1, _0800E894
	muls r1, r3, r1
	movs r3, #0x96
	lsls r2, r3, #1
	adds r3, r1, #0
	muls r3, r2, r3
	asrs r1, r3, #0x10
	adds r3, r1, r2
	adds r1, r0, #0
	adds r1, #0xfe
	strh r3, [r1]
	movs r2, #0x80
	ldr r1, [r4]
	lsls r3, r2, #5
	orrs r1, r3
	ldr r2, [r4, #4]
	movs r3, #0xac
	str r1, [r4]
	lsls r1, r3, #1
	muls r1, r2, r1
	ldr r2, _0800E898
	adds r3, r1, r2
	movs r1, #0x88
	lsls r2, r1, #1
	adds r1, r3, r2
	movs r2, #6
	str r2, [r1]
	bl sub_080040F8
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0800E890:
	.4byte gGameSetup
_0800E894:
	.4byte 0x00002492
_0800E898:
	.4byte 0x020234AC

	.global comp_engine_sample_end
	.thumb_func
	.type comp_engine_sample_end, %function
comp_engine_sample_end: @ 0800E89C
	push {lr}
	adds r0, #0xa0
	ldr r2, [r0, #4]
	movs r0, #0xac
	lsls r1, r0, #1
	muls r1, r2, r1
	ldr r0, _0800E8C4
	movs r2, #0x88
	adds r3, r1, r0
	lsls r0, r2, #1
	adds r2, r3, r0
	ldr r0, [r2]
	cmp r0, #5
	beq _0800E8BC
_0800E8B8:
	pop {r0}
	bx r0
_0800E8BC:
	movs r1, #4
	str r1, [r2]
	b _0800E8B8
	.byte 0x00, 0x00
_0800E8C4:
	.4byte 0x020234AC

	.global sub_0800E8C8
	.thumb_func
	.type sub_0800E8C8, %function
sub_0800E8C8: @ 0800E8C8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	movs r0, #0xac
	lsls r1, r0, #1
	muls r2, r1, r2
	ldr r0, _0800E938
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0xa4
	ldr r2, [r0]
	cmp r2, #0
	ble _0800E934
	movs r3, #0xa0
	muls r3, r2, r3
	asrs r0, r3, #8
_0800E8EC:
	movs r2, #0x86
	lsls r3, r2, #1
	adds r1, r1, r3
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r2, _0800E93C
	ldr r1, [r2]
	adds r1, #0xa0
	ldr r2, [r1, #4]
	cmp r2, #4
	beq _0800E920
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	movs r1, #0x80
	lsls r3, r1, #4
	subs r1, r3, r2
	muls r1, r0, r1
	asrs r0, r1, #0xb
_0800E91A:
	pop {r4}
	pop {r1}
	bx r1
_0800E920:
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	movs r1, #0x80
	lsls r3, r1, #9
	subs r1, r3, r2
	muls r1, r0, r1
	asrs r0, r1, #0x10
	b _0800E91A
_0800E934:
	movs r0, #0xa0
	b _0800E8EC
_0800E938:
	.4byte 0x020234AC
_0800E93C:
	.4byte 0x0200436C

	.global sub_0800E940
	.thumb_func
	.type sub_0800E940, %function
sub_0800E940: @ 0800E940
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xa0
	ldr r1, [r0, #4]
	movs r4, #0xac
	lsls r2, r4, #1
	muls r1, r2, r1
	ldr r0, _0800E9A8
	adds r4, r1, r0
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r2, [r0]
	cmp r2, #0
	ble _0800E9A0
	lsls r1, r2, #1
	adds r0, r1, r2
	lsls r1, r0, #0x10
	asrs r0, r1, #8
_0800E964:
	movs r1, #0x84
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r2, _0800E9AC
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	cmp r2, #4
	beq _0800E98C
	ldr r0, _0800E9B0
	ldr r2, [r0]
	lsls r1, r2, #2
	ldr r2, _0800E9B4
	ldr r0, [r2, r1]
_0800E98C:
	movs r1, #0x84
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	adds r1, r5, #0
	bl sub_08020130
	pop {r4, r5}
	pop {r1}
	bx r1
_0800E9A0:
	movs r3, #0xc0
	lsls r0, r3, #0xa
	b _0800E964
	.byte 0x00, 0x00
_0800E9A8:
	.4byte 0x020234AC
_0800E9AC:
	.4byte 0x0200436C
_0800E9B0:
	.4byte gLocalPlayerIndex
_0800E9B4:
	.4byte gRacerObjects

	.global sub_0800E9B8
	.thumb_func
	.type sub_0800E9B8, %function
sub_0800E9B8: @ 0800E9B8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldrb r3, [r1, #2]
	sub sp, #4
	adds r7, r0, #0
	mov fp, r1
	cmp r3, #1
	beq _0800EA72
	cmp r3, #0x32
	beq _0800E9EA
	cmp r3, #0x35
	beq _0800E9EA
_0800E9D8:
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800E9EA:
	mov r4, fp
	adds r4, #0xa0
	ldrh r2, [r4, #0x38]
	adds r5, r7, #0
	adds r5, #0x56
	strh r2, [r5]
	ldr r0, _0800EC18
	ldr r6, [r4, #0x30]
	ldr r1, [r0]
	ldr r3, _0800EC1C
	adds r0, r1, r6
	cmp r0, r3
	bge _0800EA68
_0800EA04:
	adds r0, r3, #0
_0800EA06:
	ldr r6, _0800EC20
	adds r1, r7, #0
	adds r1, #0x54
	ldr r3, [r6]
	movs r6, #0
	ldrsh r3, [r1, r6]
	ldrh r2, [r1]
	subs r3, r3, r0
	asrs r3, r3, #4
	subs r0, r2, r3
	strh r0, [r1]
	ldr r0, _0800EC24
	ldr r2, [r4, #0x2c]
	muls r2, r0, r2
	asrs r1, r2, #0x10
	adds r2, r7, #0
	adds r2, #0xa0
	adds r3, r1, r0
	ldr r0, [r2]
	ldrh r1, [r5]
	adds r5, r1, r0
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	ldr r1, _0800EC28
	adds r0, r5, #0
	mov sb, r3
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	mov r1, sb
	muls r1, r2, r1
	ldr r0, [r4, #0x3c]
	asrs r3, r1, #0xc
	subs r1, r0, r3
	str r1, [r7, #0x24]
	ldr r2, _0800EC2C
	ldr r0, [r2]
	ldr r1, _0800EC30
	str r0, [r7, #0x28]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	mov r1, sb
	muls r1, r2, r1
	ldr r0, [r4, #0x44]
	b _0800EC06
_0800EA68:
	movs r6, #0xfa
	lsls r3, r6, #3
	cmp r0, r3
	ble _0800EA06
	b _0800EA04
_0800EA72:
	movs r1, #0xa0
	add r1, fp
	ldr r0, [r1]
	movs r4, #0x80
	lsls r3, r4, #0x10
	ands r0, r3
	mov sl, r1
	cmp r0, #0
	beq _0800EB42
	movs r3, #0x56
	adds r2, r3, r7
	ldrh r0, [r1, #0x38]
	mov r8, r2
	mov r4, r8
	strh r0, [r4]
	ldr r5, _0800EC24
	ldr r6, [r1, #0x2c]
	muls r6, r5, r6
	asrs r4, r6, #0x10
	adds r3, r4, r5
	adds r5, r7, #0
	adds r5, #0xa0
	ldrh r1, [r5]
	ldr r6, _0800EC34
	movs r0, #0
	mov sb, r3
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	ldr r4, [r5]
	adds r2, #0x10
	asrs r3, r2, #3
	adds r4, r4, r3
	lsls r0, r4, #0x10
	str r4, [r5]
	lsrs r1, r0, #0x10
	movs r0, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r6, r1, #0x10
	adds r6, #0x10
	asrs r2, r6, #3
	adds r3, r4, r2
	str r3, [r5]
	mov r6, r8
	ldrh r1, [r6]
	adds r5, r1, r3
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	ldr r6, _0800EC28
	adds r0, r5, #0
	bl _call_via_r6
	lsls r4, r0, #0x10
	asrs r2, r4, #0x10
	mov r1, sb
	muls r1, r2, r1
	asrs r3, r1, #0xc
	mov r1, fp
	ldr r0, [r1, #0x24]
	subs r6, r0, r3
	str r6, [r7, #0x24]
	ldr r4, _0800EC2C
	mov r2, sl
	ldr r1, [r2, #0x34]
	ldr r0, [r4]
	adds r4, r0, r1
	str r4, [r7, #0x28]
	ldr r6, _0800EC30
	adds r0, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	mov r6, sb
	muls r6, r2, r6
	asrs r3, r6, #0xc
	mov r6, fp
	ldr r0, [r6, #0x2c]
	subs r1, r0, r3
	str r1, [r7, #0x2c]
	ldr r0, [r6, #0x28]
	subs r1, r4, r0
	adds r0, r1, #0
	ldr r4, _0800EC38
	mov r1, sb
	bl _call_via_r4
	ldr r1, _0800EC20
	ldr r3, [r1]
	adds r1, r7, #0
	adds r1, #0x54
	lsls r2, r0, #0x10
	movs r4, #0
	ldrsh r3, [r1, r4]
	asrs r0, r2, #0x10
	subs r3, r3, r0
	ldrh r2, [r1]
	asrs r3, r3, #4
	subs r0, r2, r3
	strh r0, [r1]
	b _0800E9D8
_0800EB42:
	mov r6, sl
	adds r3, r7, #0
	ldrh r0, [r6, #0x38]
	adds r3, #0x56
	adds r5, r3, #0
	str r3, [sp]
	ldr r2, _0800EC18
	strh r0, [r5]
	ldr r4, [r2]
	ldr r1, [r6, #0x30]
	ldr r3, _0800EC1C
	adds r0, r4, r1
	cmp r0, r3
	bge _0800EC0E
_0800EB5E:
	adds r0, r3, #0
_0800EB60:
	adds r5, r7, #0
	adds r5, #0x54
	movs r4, #0
	ldrsh r2, [r5, r4]
	ldrh r6, [r5]
	subs r1, r2, r0
	asrs r4, r1, #4
	subs r0, r6, r4
	strh r0, [r5]
	mov r6, sl
	ldr r2, [r6, #0x2c]
	ldr r1, _0800EC24
	muls r2, r1, r2
	asrs r4, r2, #0x10
	adds r3, r4, r1
	mov sb, r3
	movs r1, #0x10
	ldrsh r3, [r6, r1]
	asrs r6, r3, #2
	rsbs r0, r6, #0
	lsls r5, r0, #0x10
	ldr r2, _0800EC34
	adds r6, r7, #0
	adds r6, #0xa0
	lsrs r4, r5, #0x10
	ldrh r1, [r6]
	mov r8, r2
	adds r0, r4, #0
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	ldr r5, [r6]
	adds r2, #0x10
	asrs r3, r2, #5
	adds r5, r5, r3
	lsls r0, r5, #0x10
	str r5, [r6]
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	adds r2, #0x10
	asrs r4, r2, #5
	adds r3, r5, r4
	str r3, [r6]
	ldr r4, [sp]
	ldrh r1, [r4]
	adds r2, r1, r3
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	ldr r6, _0800EC28
	adds r0, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	mov r6, sb
	muls r6, r2, r6
	asrs r3, r6, #0xc
	mov r6, fp
	ldr r0, [r6, #0x24]
	subs r1, r0, r3
	str r1, [r7, #0x24]
	ldr r2, _0800EC2C
	mov r1, sl
	ldr r0, [r2]
	ldr r2, [r1, #0x28]
	adds r3, r0, r2
	ldr r2, [r1, #0x34]
	adds r0, r3, r2
	str r0, [r7, #0x28]
	ldr r1, _0800EC30
	adds r0, r5, #0
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	mov r1, sb
	muls r1, r2, r1
	ldr r0, [r6, #0x2c]
_0800EC06:
	asrs r3, r1, #0xc
	subs r1, r0, r3
	str r1, [r7, #0x2c]
	b _0800E9D8
_0800EC0E:
	movs r6, #0xfa
	lsls r3, r6, #3
	cmp r0, r3
	ble _0800EB60
	b _0800EB5E
_0800EC18:
	.4byte 0x02023F6C
_0800EC1C:
	.4byte 0xFFFFF830
_0800EC20:
	.4byte gModeFlags
_0800EC24:
	.4byte 0x00002328
_0800EC28:
	.4byte sin_fx
_0800EC2C:
	.4byte 0x02023F70
_0800EC30:
	.4byte cos_fx
_0800EC34:
	.4byte _03000814
_0800EC38:
	.4byte atan2_fx

	.global sub_0800EC3C
	.thumb_func
	.type sub_0800EC3C, %function
sub_0800EC3C: @ 0800EC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0800ECFC
	ldr r6, [r5]
	adds r4, r6, #0
	adds r4, #0xa0
	ldr r7, [r4, #0xc]
	movs r2, #0xc
	muls r7, r2, r7
	ldr r0, _0800ED00
	ldr r5, _0800ED04
	ldr r1, [r0]
	ldr r4, [r5]
	adds r0, r1, r7
	ldr r7, _0800ED08
	lsls r1, r4, #2
	ldr r4, [r7, r1]
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r3, r2, #8
	str r3, [r6, #0x24]
	movs r2, #2
	ldrsh r5, [r0, r2]
	lsls r1, r5, #8
	str r1, [r6, #0x28]
	movs r5, #4
	ldrsh r7, [r0, r5]
	lsls r2, r7, #8
	str r3, [r6, #0x30]
	str r1, [r6, #0x34]
	str r2, [r6, #0x2c]
	str r2, [r6, #0x38]
	ldr r7, [r4, #0x24]
	ldr r0, [r4, #0x28]
	subs r5, r7, r3
	subs r7, r0, r1
	ldr r0, [r4, #0x2c]
	ldr r1, _0800ED0C
	subs r4, r0, r2
	mov r8, r1
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r8
	adds r1, r6, #0
	adds r1, #0x56
	asrs r5, r5, #4
	asrs r4, r4, #4
	strh r0, [r1]
	adds r3, r5, #0
	muls r3, r5, r3
	adds r1, r4, #0
	muls r1, r4, r1
	adds r0, r3, r1
	asrs r7, r7, #4
	cmp r0, #0
	ble _0800ECD6
	ldr r1, _0800ED10
	bl _call_via_r1
	adds r1, r0, #0
	rsbs r0, r7, #0
	bl _call_via_r8
	movs r5, #0x80
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	movs r3, #0x80
	lsls r2, r5, #6
	adds r1, r0, r2
	lsls r5, r3, #7
	cmp r1, r5
	bhi _0800ECE0
	adds r2, r6, #0
	adds r2, #0x54
	strh r0, [r2]
_0800ECD6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800ECE0:
	ldr r1, _0800ED14
	cmp r0, r1
	bge _0800ECEE
	adds r0, r6, #0
	adds r0, #0x54
	strh r1, [r0]
	b _0800ECD6
_0800ECEE:
	cmp r0, r2
	ble _0800ECD6
	adds r1, r6, #0
	adds r1, #0x54
	strh r2, [r1]
	b _0800ECD6
	.byte 0x00, 0x00
_0800ECFC:
	.4byte 0x0200436C
_0800ED00:
	.4byte 0x02023F74
_0800ED04:
	.4byte gLocalPlayerIndex
_0800ED08:
	.4byte gRacerObjects
_0800ED0C:
	.4byte atan2_fx
_0800ED10:
	.4byte isqrt
_0800ED14:
	.4byte 0xFFFFE000

	.global sub_0800ED18
	.thumb_func
	.type sub_0800ED18, %function
sub_0800ED18: @ 0800ED18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r6, r1, #0
	add r0, sp, #0xc
	mov r1, sp
	bl sub_08004674
	cmp r0, #0
	beq _0800EDDE
	adds r2, r7, #0
	adds r2, #0xa0
	ldr r1, [r2, #4]
	cmp r1, #2
	beq _0800ED72
_0800ED3C:
	ldr r0, [sp, #0xc]
	str r0, [r7, #0x24]
	ldr r2, [sp, #0x10]
	str r2, [r7, #0x28]
	ldr r1, [sp, #0x14]
	str r1, [r7, #0x2c]
	ldr r0, [sp]
	adds r1, r7, #0
	adds r1, #0x54
	strh r0, [r1]
	ldr r2, [sp, #4]
	adds r1, #2
	strh r2, [r1]
	ldr r0, [sp, #8]
	movs r2, #0
	adds r1, #2
	strh r0, [r1]
	str r2, [r7, #0x44]
	str r2, [r7, #0x40]
	str r2, [r7, #0x3c]
_0800ED64:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800ED72:
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	adds r0, #0x56
	mov r8, r1
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov sl, r2
	ldr r5, _0800EE00
	mov r0, sl
	bl _call_via_r5
	adds r1, r0, #0
	lsls r3, r1, #0x10
	asrs r5, r3, #0x10
	mov r4, r8
	muls r4, r5, r4
	ldr r0, [r6, #0x24]
	asrs r2, r4, #0xc
	adds r4, r0, r2
	ldr r1, _0800EE04
	mov r0, sl
	bl _call_via_r1
	ldr r1, [sp, #0x14]
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	adds r3, r1, #0
	muls r3, r0, r3
	asrs r2, r3, #0xc
	adds r4, r4, r2
	ldr r3, [r6, #0x28]
	ldr r2, [sp, #0x10]
	adds r3, r3, r2
	adds r2, r1, #0
	muls r2, r5, r2
	ldr r1, [r6, #0x2c]
	str r3, [sp, #0x10]
	asrs r3, r2, #0xc
	adds r2, r1, r3
	mov r1, r8
	muls r1, r0, r1
	asrs r0, r1, #0xc
	subs r1, r2, r0
	ldr r0, [sp, #4]
	add r0, sl
	str r0, [sp, #4]
	str r4, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r2, _0800EE08
	ldr r1, [r2]
	movs r0, #0
	str r1, [sp]
	str r0, [sp, #8]
	b _0800ED3C
_0800EDDE:
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r2, [r1, #8]
	str r0, [r1, #4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800ED64
	movs r3, #2
	rsbs r0, r3, #0
	ands r2, r0
	str r2, [r1, #8]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_0800E9B8
	b _0800ED64
_0800EE00:
	.4byte cos_fx
_0800EE04:
	.4byte sin_fx
_0800EE08:
	.4byte 0x02023F6C

	.global cam_path_add_point
	.thumb_func
	.type cam_path_add_point, %function
cam_path_add_point: @ 0800EE0C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0800F084
	ldrh r1, [r4]
	adds r6, r0, #0
	movs r0, #4
	ands r0, r1
	sub sp, #0x18
	cmp r0, #0
	beq _0800EE32
	bl sub_08004B7C
	cmp r0, #0
	beq _0800EE32
	bl sub_08004C0C
	adds r0, r6, #0
	adds r0, #0xa0
	movs r2, #1
	str r2, [r0, #4]
_0800EE32:
	ldrh r7, [r4]
	movs r1, #0x80
	lsls r5, r1, #2
	ands r5, r7
	cmp r5, #0
	beq _0800EEBA
	ldr r0, [r6, #0x24]
	ldr r1, [r6, #0x28]
	ldr r4, [r6, #0x2c]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	str r0, [sp, #0xc]
	adds r4, r6, #0
	adds r4, #0x54
	movs r0, #0
	ldrsh r5, [r4, r0]
	str r5, [sp]
	adds r5, r6, #0
	adds r5, #0x56
	movs r1, #0
	ldrsh r2, [r5, r1]
	adds r7, r6, #0
	str r2, [sp, #4]
	adds r7, #0x58
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov r1, sp
	str r0, [sp, #8]
	add r0, sp, #0xc
	bl sub_080044D0
	cmp r0, #0
	bne _0800EE76
	b _0800F07A
_0800EE76:
	ldr r0, _0800F088
	bl AGBPrintf
	ldr r0, [r6, #0x24]
	asrs r1, r0, #8
	ldr r0, _0800F08C
	bl AGBPrintf
	ldr r2, [r6, #0x2c]
	ldr r0, _0800F090
	asrs r1, r2, #8
	bl AGBPrintf
	ldr r7, [r6, #0x28]
	ldr r0, _0800F094
	asrs r1, r7, #8
	bl AGBPrintf
	ldrh r1, [r4]
	movs r3, #0xb4
	lsls r4, r3, #1
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r1, r0, #0x10
	ldr r0, _0800F098
	bl AGBPrintf
	ldrh r2, [r5]
	adds r7, r2, #0
	muls r7, r4, r7
	ldr r0, _0800F09C
	asrs r1, r7, #0x10
	bl AGBPrintf
_0800EEBA:
	ldr r7, _0800F0A0
	ldrh r5, [r7]
	movs r1, #1
	ands r1, r5
	adds r0, r7, #0
	cmp r1, #0
	beq _0800EF74
	movs r2, #0x40
	ands r2, r5
	cmp r2, #0
	beq _0800EEDA
	ldr r2, [r6, #0x28]
	movs r1, #0x80
	lsls r3, r1, #1
	adds r1, r2, r3
	str r1, [r6, #0x28]
_0800EEDA:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0800EEEC
	ldr r2, [r6, #0x28]
	ldr r3, _0800F0A4
	adds r5, r2, r3
	str r5, [r6, #0x28]
	ldrh r5, [r7]
_0800EEEC:
	movs r1, #0x20
	ands r1, r5
	cmp r1, #0
	beq _0800EF22
	adds r4, r6, #0
	adds r4, #0x56
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _0800F0A8
	bl _call_via_r2
	ldr r1, [r6, #0x24]
	lsls r5, r0, #0x10
	asrs r3, r5, #0x12
	adds r2, r1, r3
	str r2, [r6, #0x24]
	ldr r5, _0800F0AC
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r5
	ldr r2, [r6, #0x2c]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x12
	subs r5, r2, r3
	str r5, [r6, #0x2c]
	ldrh r5, [r7]
_0800EF22:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0800EF56
	adds r4, r6, #0
	adds r4, #0x56
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r2, _0800F0A8
	bl _call_via_r2
	ldr r2, [r6, #0x24]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x12
	subs r1, r2, r3
	str r1, [r6, #0x24]
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _0800F0AC
	bl _call_via_r2
	ldr r2, [r6, #0x2c]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x12
	adds r1, r2, r3
	str r1, [r6, #0x2c]
_0800EF56:
	ldr r1, _0800F084
	movs r2, #0x80
	ldrh r0, [r1]
	lsls r1, r2, #1
	ands r1, r0
	cmp r1, #0
	beq _0800EF68
	bl cam_path_print
_0800EF68:
	bl AGBPrintFlush
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800EF74:
	movs r1, #2
	ands r1, r5
	cmp r1, #0
	beq _0800EFE0
	movs r2, #0x40
	ands r2, r5
	cmp r2, #0
	beq _0800EF9E
	adds r2, r6, #0
	adds r2, #0x54
	ldrh r0, [r2]
	adds r0, #0x80
	strh r0, [r2]
	lsls r3, r0, #0x10
	movs r0, #0x80
	lsls r1, r0, #0x16
	cmp r3, r1
	ble _0800EFDC
	lsls r1, r0, #6
	adds r0, r7, #0
	strh r1, [r2]
_0800EF9E:
	ldrh r3, [r0]
	movs r1, #0x80
	ands r1, r3
	cmp r1, #0
	beq _0800EFBE
	adds r2, r6, #0
	adds r2, #0x54
	ldrh r3, [r2]
	subs r3, #0x80
	lsls r1, r3, #0x10
	strh r3, [r2]
	asrs r3, r1, #0x10
	ldr r1, _0800F0B0
	cmp r3, r1
	bge _0800EFBE
	strh r1, [r2]
_0800EFBE:
	ldrh r1, [r0]
	movs r2, #0x20
	ands r2, r1
	cmp r2, #0
	beq _0800EFD6
	adds r2, r6, #0
	adds r2, #0x56
	ldrh r3, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	adds r3, r3, r0
	strh r3, [r2]
_0800EFD6:
	movs r0, #0x10
	ands r0, r1
	b _0800F066
_0800EFDC:
	adds r0, r7, #0
	b _0800EF9E
_0800EFE0:
	movs r1, #0x40
	ands r1, r5
	cmp r1, #0
	beq _0800F014
	adds r4, r6, #0
	adds r4, #0x56
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r1, _0800F0AC
	bl _call_via_r1
	ldr r1, [r6, #0x24]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x12
	adds r2, r1, r3
	str r2, [r6, #0x24]
	ldr r1, _0800F0A8
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r1
	ldr r1, [r6, #0x2c]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x12
	adds r2, r1, r3
	str r2, [r6, #0x2c]
_0800F014:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0800F04A
	adds r4, r6, #0
	adds r4, #0x56
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r2, _0800F0AC
	bl _call_via_r2
	ldr r1, [r6, #0x24]
	lsls r5, r0, #0x10
	asrs r3, r5, #0x12
	subs r2, r1, r3
	str r2, [r6, #0x24]
	ldr r5, _0800F0A8
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl _call_via_r5
	ldr r2, [r6, #0x2c]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x12
	subs r5, r2, r3
	str r5, [r6, #0x2c]
	ldrh r5, [r7]
_0800F04A:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0800F062
	adds r1, r6, #0
	adds r1, #0x56
	ldrh r2, [r1]
	movs r5, #0x80
	lsls r3, r5, #2
	adds r5, r2, r3
	strh r5, [r1]
	ldrh r5, [r7]
_0800F062:
	movs r0, #0x10
	ands r0, r5
_0800F066:
	cmp r0, #0
	bne _0800F06C
	b _0800EF56
_0800F06C:
	adds r0, r6, #0
	adds r0, #0x56
	ldrh r3, [r0]
	ldr r1, _0800F0B4
	adds r2, r3, r1
	strh r2, [r0]
	b _0800EF56
_0800F07A:
	ldr r0, _0800F0B8
	bl AGBPrintf
	b _0800EEBA
	.byte 0x00, 0x00
_0800F084:
	.4byte gKeysNew
_0800F088:
	.4byte gUnk_08050290
_0800F08C:
	.4byte gUnk_080502A0
_0800F090:
	.4byte gUnk_080502A8
_0800F094:
	.4byte gUnk_080502B0
_0800F098:
	.4byte gUnk_080502B8
_0800F09C:
	.4byte gUnk_080502C8
_0800F0A0:
	.4byte gKeysHeld
_0800F0A4:
	.4byte 0xFFFFFF00
_0800F0A8:
	.4byte cos_fx
_0800F0AC:
	.4byte sin_fx
_0800F0B0:
	.4byte 0xFFFFE000
_0800F0B4:
	.4byte 0xFFFFFE00
_0800F0B8:
	.4byte gUnk_080502D8
