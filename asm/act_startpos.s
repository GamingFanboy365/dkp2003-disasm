@ asm/act_startpos.s: ROM 0x0108C8-0x010A5C (rom, VMA 0x080108C8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_start_pos
	.thumb_func
	.type init_start_pos, %function
init_start_pos: @ 080108C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	sub sp, #4
	cmp r7, #0
	bne _080108D8
	b _08010A20
_080108D8:
	movs r1, #0x9c
	adds r0, r1, r7
	ldr r2, [r0]
	ldr r5, _08010914
	ldr r1, [r2, #0xc]
	adds r3, r5, #0
	adds r3, #0x88
	mov r8, r0
	ldrb r2, [r1, #1]
	movs r0, #0
	ldrsh r3, [r3, r0]
	cmp r2, r3
	bge _08010900
	movs r3, #2
	ldrsh r2, [r5, r3]
	cmp r2, #0
	bne _080108FC
	b _08010A16
_080108FC:
	cmp r2, #1
	beq _08010918
_08010900:
	adds r0, r7, #0
	bl sub_08001FE8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08010914:
	.4byte 0x0202D74C
_08010918:
	ldr r2, [r1, #4]
	cmp r2, #1
	bne _08010900
_0801091E:
	mov r0, r8
	ldr r2, [r0]
	ldr r4, [r2, #0xc]
	ldrb r6, [r4, #1]
	adds r1, r5, #2
	adds r6, #0x3c
	ldrsb r4, [r1, r6]
	cmp r4, #0
	blt _080109FE
_08010930:
	ldr r3, _08010990
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r4, #2
	ldr r6, [r3, r0]
	cmp r1, #3
	beq _080109EC
	ldr r2, _08010994
	ldr r5, [r2]
	cmp r4, r5
	bge _080109E6
	movs r1, #1
_08010948:
	strb r1, [r6, #2]
_0801094A:
	adds r5, r6, #0
	adds r5, #0xa0
	str r4, [r5, #4]
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _08010988
	ldrb r2, [r1, #2]
	ldr r4, _0801098C
	subs r1, r0, r2
	lsls r0, r1, #8
	strh r4, [r5, #0xc]
	strh r4, [r5, #0x10]
	strh r0, [r5, #0xe]
	ldr r2, [r7, #0x28]
	ldr r1, _08010998
	str r2, [r6, #0x28]
	movs r2, #0
	ldrsh r4, [r1, r2]
	cmp r4, #3
	beq _080109D4
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	ldr r1, _0801099C
	bl _call_via_r1
	lsls r4, r0, #0x10
	asrs r2, r4, #0x10
	ldr r4, _080109A0
	b _080109A4
	.byte 0x00, 0x00
_08010988:
	.4byte 0x00000080
_0801098C:
	.4byte 0x00000000
_08010990:
	.4byte 0x0200434C
_08010994:
	.4byte 0x0202DE5C
_08010998:
	.4byte 0x0202D74C
_0801099C:
	.4byte sub_03000138
_080109A0:
	.4byte 0x0002FDA0
_080109A4:
	adds r1, r2, #0
	muls r1, r4, r1
	asrs r3, r1, #0xc
	ldr r1, [r7, #0x24]
	subs r0, r1, r3
	str r0, [r6, #0x24]
	ldr r1, _08010A38
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	adds r1, r2, #0
	muls r1, r4, r1
	asrs r3, r1, #0xc
	ldr r1, [r7, #0x2c]
	subs r0, r1, r3
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	movs r1, #2
	bl obj_initialise
	b _08010900
_080109D4:
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	ldr r1, _08010A3C
	bl _call_via_r1
	lsls r4, r0, #0x10
	asrs r2, r4, #0x10
	ldr r4, _08010A40
	b _080109A4
_080109E6:
	movs r0, #2
	strb r0, [r6, #2]
	b _0801094A
_080109EC:
	ldr r2, _08010A44
	ldr r5, [r2]
	cmp r4, r5
	bge _080109F8
	movs r1, #0x32
	b _08010948
_080109F8:
	movs r0, #0x35
	strb r0, [r6, #2]
	b _0801094A
_080109FE:
	ldr r0, _08010A48
	ldr r1, _08010A4C
	str r0, [sp]
	ldr r2, _08010A50
	ldr r0, _08010A54
	movs r3, #0x32
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010930
_08010A16:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _08010A1E
	b _080108FC
_08010A1E:
	b _0801091E
_08010A20:
	ldr r0, _08010A58
	ldr r1, _08010A4C
	str r0, [sp]
	ldr r2, _08010A50
	ldr r0, _08010A54
	movs r3, #0x20
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080108D8
_08010A38:
	.4byte sub_03000134
_08010A3C:
	.4byte sub_03000138
_08010A40:
	.4byte 0x00056B80
_08010A44:
	.4byte 0x0202DE5C
_08010A48:
	.4byte 0x08050708
_08010A4C:
	.4byte 0x08050740
_08010A50:
	.4byte 0x08050754
_08010A54:
	.4byte 0x08050764
_08010A58:
	.4byte 0x080507A0
