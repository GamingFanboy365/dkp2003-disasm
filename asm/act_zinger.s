@ asm/act_zinger.s: ROM 0x012EF0-0x013154 (rom, VMA 0x08012EF0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_zinger
	.thumb_func
	.type init_zinger, %function
init_zinger: @ 08012EF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _08012FA0
_08012EFA:
	ldr r1, _08012F30
	adds r6, r5, #0
	strh r1, [r5]
	adds r6, #0x9c
	ldr r0, [r6]
	ldr r3, [r0, #0xc]
	ldrh r4, [r3, #2]
	cmp r4, #0
	beq _08012F9C
_08012F0C:
	ldrb r1, [r3, #1]
	adds r0, r5, #0
	movs r2, #0x13
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _08012F34
	lsls r1, r4, #2
	adds r4, r3, r2
	strh r1, [r4, #0xa]
	bl sub_08002FE0
	b _08012F38
	.byte 0x00, 0x00
_08012F30:
	.4byte 0x00000001
_08012F34:
	.4byte 0x02018F34
_08012F38:
	bl sub_08000B78
	adds r4, r5, #0
	adds r4, #0xa0
	str r0, [r4]
	bl sub_08000B78
	lsrs r1, r0, #0xe
	str r1, [r4, #0x10]
	bl sub_08000B78
	lsrs r2, r0, #0xe
	str r2, [r4, #0x14]
	bl sub_08000B78
	lsrs r3, r0, #0xe
	str r3, [r4, #0x18]
	bl sub_08000B78
	lsrs r1, r0, #7
	str r1, [r4, #4]
	bl sub_08000B78
	lsrs r2, r0, #7
	str r2, [r4, #8]
	bl sub_08000B78
	lsrs r3, r0, #7
	str r3, [r4, #0xc]
	ldr r1, [r6]
	ldr r0, [r1, #0xc]
	ldrb r2, [r0, #4]
	cmp r2, #0
	beq _08012F94
	movs r1, #0x80
	lsls r0, r1, #3
	str r0, [sp]
	movs r1, #0
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_08001C28
	adds r0, r5, #0
	bl obj_add_vector_hit
_08012F94:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08012F9C:
	movs r4, #0x30
	b _08012F0C
_08012FA0:
	ldr r0, _08012FB8
	ldr r1, _08012FBC
	str r0, [sp]
	ldr r2, _08012FC0
	ldr r0, _08012FC4
	movs r3, #0x1e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012EFA
_08012FB8:
	.4byte 0x08050D90
_08012FBC:
	.4byte 0x08050D9C
_08012FC0:
	.4byte 0x08050DB0
_08012FC4:
	.4byte 0x08050DBC

	.global act_zinger
	.thumb_func
	.type act_zinger, %function
act_zinger: @ 08012FC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	sub sp, #4
	cmp r7, #0
	bne _08012FDA
	b _080130C4
_08012FDA:
	adds r4, r7, #0
	adds r4, #0xa0
	ldr r3, [r4]
	ldr r2, _080130DC
	mov sl, r3
	ldr r3, [r2]
	ldr r0, [r4, #4]
	mov r8, r3
	mov r5, r8
	muls r5, r0, r5
	add r5, sl
	lsls r6, r5, #0x10
	asrs r0, r6, #0x10
	ldr r6, _080130E0
	bl _call_via_r6
	ldr r1, [r4, #0x10]
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	adds r5, r1, #0
	muls r5, r2, r5
	asrs r1, r5, #4
	adds r5, r7, #0
	adds r5, #0x9c
	ldr r3, [r5]
	ldr r0, [r3]
	lsls r3, r0, #8
	adds r0, r1, r3
	ldr r3, [r7, #0x24]
	subs r1, r0, r3
	str r1, [r7, #0x3c]
	ldr r0, [r4, #8]
	mov r1, r8
	muls r1, r0, r1
	add r1, sl
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	bl _call_via_r6
	movs r1, #0x80
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	lsls r3, r1, #5
	adds r1, r2, r3
	ldr r3, [r4, #0x14]
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r3, [r5]
	ldr r0, [r3, #4]
	asrs r1, r2, #4
	lsls r3, r0, #8
	adds r0, r1, r3
	ldr r3, [r7, #0x28]
	subs r1, r0, r3
	str r1, [r7, #0x40]
	ldr r0, [r4, #0xc]
	mov r2, r8
	muls r2, r0, r2
	add r2, sl
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	ldr r3, [r4, #0x18]
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r3, [r5]
	asrs r0, r1, #4
	ldr r1, [r3, #8]
	lsls r3, r1, #8
	adds r1, r0, r3
	ldr r3, [r7, #0x2c]
	subs r0, r1, r3
	str r0, [r7, #0x44]
	adds r2, r7, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	bl sub_08002FE0
	ldr r1, [r7, #0x24]
	adds r0, r7, #0
	adds r0, #0x84
	str r1, [r0]
	ldr r2, [r7, #0x28]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r7, #0x2c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x24]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x28]
	str r2, [r7, #0x30]
	adds r2, r2, r3
	ldr r3, [r7, #0x40]
	ldr r0, [r7, #0x2c]
	str r1, [r7, #0x34]
	str r2, [r7, #0x24]
	adds r2, r1, r3
	ldr r1, [r7, #0x44]
	str r2, [r7, #0x28]
	adds r2, r0, r1
	str r0, [r7, #0x38]
	str r2, [r7, #0x2c]
	adds r0, r7, #0
	ldr r1, _080130E4
	bl _call_via_r1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080130C4:
	ldr r0, _080130E8
	ldr r1, _080130EC
	str r0, [sp]
	ldr r2, _080130F0
	ldr r0, _080130F4
	movs r3, #0x3f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012FDA
_080130DC:
	.4byte 0x03005660
_080130E0:
	.4byte sub_03000138
_080130E4:
	.4byte sub_03003750
_080130E8:
	.4byte 0x08050D90
_080130EC:
	.4byte 0x08050D9C
_080130F0:
	.4byte 0x08050DF8
_080130F4:
	.4byte 0x08050DBC

	.global react_zinger
	.thumb_func
	.type react_zinger, %function
react_zinger: @ 080130F8
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _08013126
_08013102:
	cmp r4, #0
	beq _0801310E
_08013106:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0801310E:
	ldr r0, _08013140
	ldr r1, _08013144
	str r0, [sp]
	ldr r2, _08013148
	ldr r0, _0801314C
	movs r3, #0x5d
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013106
_08013126:
	ldr r0, _08013150
	ldr r1, _08013144
	str r0, [sp]
	ldr r2, _08013148
	ldr r0, _0801314C
	movs r3, #0x5c
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013102
	.byte 0x00, 0x00
_08013140:
	.4byte 0x08050E04
_08013144:
	.4byte 0x08050D9C
_08013148:
	.4byte 0x08050E10
_0801314C:
	.4byte 0x08050DBC
_08013150:
	.4byte 0x08050D90
