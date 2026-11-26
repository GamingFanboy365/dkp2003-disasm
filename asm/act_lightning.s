@ asm/act_lightning.s: ROM 0x02B9F4-0x02BD24 (rom, VMA 0x0802B9F4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_lightning
	.thumb_func
	.type act_lightning, %function
act_lightning: @ 0802B9F4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	mov fp, r0
	cmp r0, #0
	bne _0802BA0A
	b _0802BC76
_0802BA0A:
	movs r2, #0xa0
	add r2, fp
	ldr r0, [r2, #8]
	lsls r1, r0, #2
	ldr r0, _0802BB24
	mov r8, r2
	ldr r2, [r0, r1]
	mov r3, r8
	mov sb, r2
	ldr r2, [r3, #4]
	cmp r2, #8
	bls _0802BA24
	b _0802BC08
_0802BA24:
	ldr r2, [r3, #0xc]
	cmp r2, #0
	bne _0802BA2C
	b _0802BBEC
_0802BA2C:
	ldr r0, _0802BB28
	movs r2, #0x80
	ldr r1, [r0]
	lsls r3, r2, #5
	orrs r1, r3
	str r1, [r0]
	ldr r3, _0802BB2C
	ldr r1, _0802BB30
	str r3, [r1]
_0802BA3E:
	mov r2, r8
	ldr r0, [r2, #4]
	adds r0, #2
	str r0, [r2, #4]
	cmp r0, #0x1d
	ble _0802BABE
	ldr r0, _0802BB34
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #3
	bne _0802BA56
	b _0802BB98
_0802BA56:
	adds r3, r0, #0
	movs r2, #0
	adds r3, #0x88
	mov sl, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r7, #0
	cmp r7, r1
	bge _0802BA9E
_0802BA68:
	mov r3, sl
	adds r3, #0xa8
	ldrb r6, [r0, r3]
	ldr r1, _0802BB24
	lsls r4, r6, #2
	ldr r6, [r1, r4]
	adds r4, r6, #0
	adds r4, #0xa0
	mov r2, r8
	ldr r3, [r4, #4]
	ldr r1, [r2, #8]
	cmp r3, r1
	beq _0802BA8E
	ldr r5, [r4]
	movs r3, #0x80
	lsls r2, r3, #5
	ands r5, r2
	cmp r5, #0
	beq _0802BADC
_0802BA8E:
	movs r3, #1
	add sl, r3
	adds r3, r0, #0
	adds r3, #0x88
	movs r2, #0
	ldrsh r1, [r3, r2]
	cmp sl, r1
	blt _0802BA68
_0802BA9E:
	ldr r0, _0802BB38
	mov r1, sb
	adds r1, #0xa0
	ldr r2, [r0]
	ldr r0, [r1, #4]
	cmp r2, r0
	beq _0802BAD0
_0802BAAC:
	cmp r7, #0
	beq _0802BAB8
	mov r0, sb
	adds r1, r7, #0
	bl sub_0802026C
_0802BAB8:
	mov r0, fp
	bl sub_08001FE8
_0802BABE:
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802BAD0:
	movs r2, #0x96
	movs r0, #0x14
	lsls r1, r2, #1
	bl sub_0801E28C
	b _0802BAAC
_0802BADC:
	ldrb r3, [r6, #2]
	movs r7, #0
	cmp r3, #1
	beq _0802BB3C
	cmp r3, #2
	beq _0802BB12
_0802BAE8:
	cmp r7, #0
	beq _0802BAF4
	mov r0, sb
	adds r1, r6, #0
	bl sub_08020210
_0802BAF4:
	adds r7, r6, #0
	adds r0, r7, #0
	adds r0, #0xa0
	ldr r1, [r0]
	movs r2, #0x80
	lsls r3, r2, #6
	orrs r1, r3
	str r1, [r0]
	movs r0, #0x80
	lsls r1, r0, #1
	ldr r2, _0802BB20
	adds r0, r7, r1
	strh r2, [r0]
	ldr r0, _0802BB34
	b _0802BA8E
_0802BB12:
	adds r0, r6, #0
	movs r2, #1
	bl sub_0800E35C
	adds r7, r0, #0
	b _0802BAE8
	.byte 0x00, 0x00
_0802BB20:
	.4byte 0x0000012C
_0802BB24:
	.4byte 0x0200434C
_0802BB28:
	.4byte 0x0300566C
_0802BB2C:
	.4byte 0x0000FFFF
_0802BB30:
	.4byte 0x0201BAF0
_0802BB34:
	.4byte 0x0202D74C
_0802BB38:
	.4byte 0x0202DE58
_0802BB3C:
	adds r0, r6, #0
	movs r2, #0
	movs r3, #1
	bl sub_0800A9A4
	adds r7, r0, #0
	cmp r7, #0
	beq _0802BB56
	ldr r2, _0802BC90
	ldr r1, [r4, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0802BB6E
_0802BB56:
	ldr r1, _0802BC94
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #6
	bne _0802BAE8
	cmp r7, #0
	beq _0802BAF4
	adds r0, r6, #0
	ldr r1, _0802BC98
	bl sub_08014264
	b _0802BAE8
_0802BB6E:
	movs r0, #0x26
	bl sub_08001F58
	ldr r3, [r4, #4]
	adds r1, r0, #0
	adds r1, #0xa0
	str r3, [r1, #4]
	movs r1, #0
	bl obj_initialise
	movs r0, #0xa
	movs r3, #0x80
	str r0, [sp]
	lsls r2, r3, #9
	movs r0, #0xd3
	movs r1, #0x7f
	movs r3, #1
	str r5, [sp, #4]
	bl sub_0801FCAC
	b _0802BB56
_0802BB98:
	ldr r0, _0802BC9C
	ldr r6, [r0, #4]
	movs r0, #0x26
	bl sub_08001F58
	adds r3, r6, #0
	adds r3, #0xa0
	ldr r2, [r3, #4]
	adds r1, r0, #0
	adds r1, #0xa0
	str r2, [r1, #4]
	movs r1, #0
	bl obj_initialise
	movs r3, #0x7f
	ldr r1, [r6, #0x28]
	ldr r2, [r6, #0x2c]
	ldr r0, [r6, #0x24]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	movs r3, #0xd3
	bl sub_0801F534
	mov r3, r8
	ldr r1, [r3, #8]
	movs r3, #0x80
	adds r0, r6, #0
	lsls r2, r3, #7
	bl sub_08027FBC
	mov r0, fp
	bl sub_08001FE8
	b _0802BABE
_0802BBEC:
	movs r0, #8
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xd4
	movs r3, #1
	bl sub_0801FCAC
	movs r1, #1
	mov r2, r8
	str r1, [r2, #0xc]
	b _0802BA2C
_0802BC08:
	adds r0, r2, #0
	subs r0, #0x10
	cmp r0, #4
	bhi _0802BC36
	mov r3, r8
	ldr r2, [r3, #0x10]
	cmp r2, #0
	beq _0802BC1A
	b _0802BA2C
_0802BC1A:
	movs r0, #4
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xd5
	movs r3, #1
	bl sub_0801FCAC
	movs r1, #1
	mov r2, r8
	str r1, [r2, #0x10]
	b _0802BA2C
_0802BC36:
	adds r0, r2, #0
	subs r0, #0x18
	cmp r0, #2
	bhi _0802BC64
	mov r3, r8
	ldr r2, [r3, #0x14]
	cmp r2, #0
	beq _0802BC48
	b _0802BA2C
_0802BC48:
	movs r0, #2
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xd6
	movs r3, #1
	bl sub_0801FCAC
	movs r1, #1
	mov r2, r8
	str r1, [r2, #0x14]
	b _0802BA2C
_0802BC64:
	ldr r0, _0802BCA0
	ldr r3, _0802BCA4
	ldr r1, [r0]
	ands r1, r3
	str r1, [r0]
	ldr r1, _0802BCA8
	ldr r0, _0802BCAC
	str r1, [r0]
	b _0802BA3E
_0802BC76:
	ldr r0, _0802BCB0
	ldr r1, _0802BCB4
	str r0, [sp]
	ldr r2, _0802BCB8
	ldr r0, _0802BCBC
	movs r3, #0x45
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BA0A
	.byte 0x00, 0x00
_0802BC90:
	.4byte 0x0202DE58
_0802BC94:
	.4byte 0x0202D74C
_0802BC98:
	.4byte 0x00002666
_0802BC9C:
	.4byte 0x0200434C
_0802BCA0:
	.4byte 0x0300566C
_0802BCA4:
	.4byte 0xFFFFEFFF
_0802BCA8:
	.4byte 0x0000FFFF
_0802BCAC:
	.4byte 0x0201BAF0
_0802BCB0:
	.4byte 0x08053074
_0802BCB4:
	.4byte 0x08053080
_0802BCB8:
	.4byte 0x08053094
_0802BCBC:
	.4byte 0x080530A4

	.global sub_0802BCC0
	.thumb_func
	.type sub_0802BCC0, %function
sub_0802BCC0: @ 0802BCC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x24
	bl sub_08001F58
	adds r4, #0xa0
	adds r1, r0, #0
	ldr r2, [r4, #4]
	adds r1, #0xa0
	str r2, [r1, #8]
	movs r1, #0
	bl obj_initialise
	pop {r4}
	pop {r0}
	bx r0

	.global init_lightning
	.thumb_func
	.type init_lightning, %function
init_lightning: @ 0802BCE0
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802BCFC
_0802BCEA:
	ldr r0, _0802BCF8
	add sp, #4
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0802BCF8:
	.4byte 0x00000001
_0802BCFC:
	ldr r0, _0802BD14
	ldr r1, _0802BD18
	str r0, [sp]
	ldr r2, _0802BD1C
	ldr r0, _0802BD20
	movs r3, #0x36
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BCEA
_0802BD14:
	.4byte 0x08053074
_0802BD18:
	.4byte 0x08053080
_0802BD1C:
	.4byte 0x080530E0
_0802BD20:
	.4byte 0x080530A4
