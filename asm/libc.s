@ asm/libc.s: ROM 0x0325DC-0x0385FC (rom, VMA 0x080325DC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global CpuSet
	.thumb_func
	.type CpuSet, %function
CpuSet: @ 080325DC
	svc #0xb
	bx lr

	.global IdentifyEeprom
	.thumb_func
	.type IdentifyEeprom, %function
IdentifyEeprom: @ 080325E0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0
	cmp r0, #4
	bne _080325FC
	ldr r1, _080325F4
	ldr r0, _080325F8
	str r0, [r1]
	b _08032618
	.byte 0x00, 0x00
_080325F4:
	.4byte 0x02000000
_080325F8:
	.4byte gUnk_0884CCB8
_080325FC:
	cmp r0, #0x40
	bne _08032610
	ldr r1, _08032608
	ldr r0, _0803260C
	str r0, [r1]
	b _08032618
_08032608:
	.4byte 0x02000000
_0803260C:
	.4byte gUnk_0884CCC4
_08032610:
	ldr r1, _0803261C
	ldr r0, _08032620
	str r0, [r1]
	movs r2, #1
_08032618:
	adds r0, r2, #0
	bx lr
_0803261C:
	.4byte 0x02000000
_08032620:
	.4byte gUnk_0884CCB8

	.global eeprom_timer_intr
	.thumb_func
	.type eeprom_timer_intr, %function
eeprom_timer_intr: @ 08032624
	ldr r1, _08032640
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803263E
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803263E
	ldr r1, _08032644
	movs r0, #1
	strb r0, [r1]
_0803263E:
	bx lr
_08032640:
	.4byte 0x0202F022
_08032644:
	.4byte 0x0202F024

	.global SetEepromTimerIntr
	.thumb_func
	.type SetEepromTimerIntr, %function
SetEepromTimerIntr: @ 08032648
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _0803267C
	ldr r0, _0803266C
	strb r1, [r0]
	ldr r1, _08032670
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _08032674
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08032678
	str r0, [r2]
	movs r0, #0
	b _0803267E
	.byte 0x00, 0x00
_0803266C:
	.4byte 0x0202F020
_08032670:
	.4byte 0x0202F028
_08032674:
	.4byte 0x04000100
_08032678:
	.4byte eeprom_timer_intr
_0803267C:
	movs r0, #1
_0803267E:
	bx lr

	.global eeprom_timer_start
	.thumb_func
	.type eeprom_timer_start, %function
eeprom_timer_start: @ 08032680
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _080326EC
	ldr r1, _080326F0
	mov sb, r1
	ldrh r1, [r1]
	strh r1, [r2]
	movs r6, #0
	mov r2, sb
	strh r6, [r2]
	ldr r3, _080326F4
	mov r8, r3
	ldr r5, [r3]
	strh r6, [r5, #2]
	ldr r3, _080326F8
	ldr r4, _080326FC
	ldrb r1, [r4]
	movs r2, #8
	adds r7, r2, #0
	lsls r7, r1
	adds r1, r7, #0
	strh r1, [r3]
	subs r3, #2
	ldrb r1, [r4]
	lsls r2, r1
	ldrh r1, [r3]
	orrs r1, r2
	strh r1, [r3]
	ldr r1, _08032700
	strb r6, [r1]
	ldr r2, _08032704
	ldrh r1, [r0]
	strh r1, [r2]
	adds r0, #2
	ldrh r1, [r0]
	strh r1, [r5]
	adds r1, r5, #2
	mov r2, r8
	str r1, [r2]
	ldrh r0, [r0, #2]
	strh r0, [r5, #2]
	str r5, [r2]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080326EC:
	.4byte 0x0202F02C
_080326F0:
	.4byte 0x04000208
_080326F4:
	.4byte 0x0202F028
_080326F8:
	.4byte 0x04000202
_080326FC:
	.4byte 0x0202F020
_08032700:
	.4byte 0x0202F024
_08032704:
	.4byte 0x0202F022

	.global eeprom_timer_stop
	.thumb_func
	.type eeprom_timer_stop, %function
eeprom_timer_stop: @ 08032708
	ldr r3, _08032738
	movs r1, #0
	strh r1, [r3]
	ldr r2, _0803273C
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _08032740
	ldr r0, _08032744
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _08032748
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.byte 0x00, 0x00
_08032738:
	.4byte 0x04000208
_0803273C:
	.4byte 0x0202F028
_08032740:
	.4byte 0x04000200
_08032744:
	.4byte 0x0202F020
_08032748:
	.4byte 0x0202F02C

	.global eeprom_dma3_transmit
	.thumb_func
	.type eeprom_dma3_transmit, %function
eeprom_dma3_transmit: @ 0803274C
	push {r4, r5, r6, lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _080327AC
	ldrh r3, [r4]
	adds r6, r3, #0
	movs r3, #0
	strh r3, [r4]
	ldr r5, _080327B0
	ldrh r4, [r5]
	ldr r3, _080327B4
	ands r4, r3
	ldr r3, _080327B8
	ldr r3, [r3]
	ldrh r3, [r3, #6]
	orrs r4, r3
	strh r4, [r5]
	ldr r3, _080327BC
	str r0, [r3]
	ldr r0, _080327C0
	str r1, [r0]
	ldr r1, _080327C4
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r1]
	adds r1, #2
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080327A0
	ldr r2, _080327C8
	movs r0, #0x80
	lsls r0, r0, #8
	adds r1, r0, #0
_08032798:
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08032798
_080327A0:
	ldr r0, _080327AC
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080327AC:
	.4byte 0x04000208
_080327B0:
	.4byte 0x04000204
_080327B4:
	.4byte 0x0000F8FF
_080327B8:
	.4byte 0x02000000
_080327BC:
	.4byte 0x040000D4
_080327C0:
	.4byte 0x040000D8
_080327C4:
	.4byte 0x040000DC
_080327C8:
	.4byte 0x040000DE

	.global ReadEepromDword
	.thumb_func
	.type ReadEepromDword, %function
ReadEepromDword: @ 080327CC
	push {r4, r5, r6, lr}
	sub sp, #0x88
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080327E4
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r3, r0
	blo _080327EC
	ldr r0, _080327E8
	b _0803286E
_080327E4:
	.4byte 0x02000000
_080327E8:
	.4byte 0x000080FF
_080327EC:
	ldr r0, _08032878
	adds r6, r0, #0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #1
	mov r4, sp
	adds r2, r0, r4
	adds r2, #2
	movs r4, #0
	cmp r4, r1
	bhs _08032816
_08032802:
	strh r3, [r2]
	subs r2, #2
	lsrs r3, r3, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [r6]
	ldrb r0, [r0, #8]
	cmp r4, r0
	blo _08032802
_08032816:
	movs r0, #1
	strh r0, [r2]
	subs r2, #2
	strh r0, [r2]
	movs r4, #0xd0
	lsls r4, r4, #0x14
	ldr r0, _08032878
	ldr r0, [r0]
	ldrb r2, [r0, #8]
	adds r2, #3
	mov r0, sp
	adds r1, r4, #0
	bl eeprom_dma3_transmit
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0x44
	bl eeprom_dma3_transmit
	add r2, sp, #8
	adds r5, #6
	movs r4, #0
	movs r6, #1
_08032844:
	movs r1, #0
	movs r3, #0
_08032848:
	lsls r1, r1, #0x11
	ldrh r0, [r2]
	ands r0, r6
	lsrs r1, r1, #0x10
	orrs r1, r0
	adds r2, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08032848
	strh r1, [r5]
	subs r5, #2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08032844
	movs r0, #0
_0803286E:
	add sp, #0x88
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08032878:
	.4byte 0x02000000

	.global ProgramEepromDword
	.thumb_func
	.type ProgramEepromDword, %function
ProgramEepromDword: @ 0803287C
	push {r4, r5, lr}
	sub sp, #0xa4
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08032894
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r4, r0
	blo _0803289C
	ldr r0, _08032898
	b _08032940
_08032894:
	.4byte 0x02000000
_08032898:
	.4byte 0x000080FF
_0803289C:
	ldr r0, _080328DC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #1
	mov r1, sp
	adds r3, r0, r1
	adds r3, #0x84
	movs r0, #0
	strh r0, [r3]
	subs r3, #2
	movs r1, #0
_080328B2:
	ldrh r2, [r5]
	adds r5, #2
	movs r0, #0
_080328B8:
	strh r2, [r3]
	subs r3, #2
	lsrs r2, r2, #1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _080328B8
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080328B2
	movs r1, #0
	ldr r0, _080328DC
	adds r2, r0, #0
	ldr r0, [r0]
	b _080328EE
_080328DC:
	.4byte 0x02000000
_080328E0:
	strh r4, [r3]
	subs r3, #2
	lsrs r4, r4, #1
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r2]
_080328EE:
	ldrb r0, [r0, #8]
	cmp r1, r0
	blo _080328E0
	movs r0, #0
	strh r0, [r3]
	subs r3, #2
	movs r0, #1
	strh r0, [r3]
	movs r1, #0xd0
	lsls r1, r1, #0x14
	ldr r0, _08032948
	ldr r0, [r0]
	ldrb r2, [r0, #8]
	adds r2, #0x43
	mov r0, sp
	bl eeprom_dma3_transmit
	ldr r0, _0803294C
	bl eeprom_timer_start
	movs r4, #0
	movs r1, #0xd0
	lsls r1, r1, #0x14
	movs r3, #1
	ldr r2, _08032950
_08032920:
	ldrh r0, [r1]
	ands r0, r3
	cmp r0, #0
	bne _0803293A
	ldrb r0, [r2]
	cmp r0, #0
	beq _08032920
	ldrh r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803293A
	ldr r4, _08032954
_0803293A:
	bl eeprom_timer_stop
	adds r0, r4, #0
_08032940:
	add sp, #0xa4
	pop {r4, r5}
	pop {r1}
	bx r1
_08032948:
	.4byte 0x02000000
_0803294C:
	.4byte gUnk_0884CCD0
_08032950:
	.4byte 0x0202F024
_08032954:
	.4byte 0x0000C001

	.global VerifyEepromDword
	.thumb_func
	.type VerifyEepromDword, %function
VerifyEepromDword: @ 08032958
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r5, #0
	ldr r0, _08032974
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r1, r0
	blo _0803297C
	ldr r0, _08032978
	b _080329A6
	.byte 0x00, 0x00
_08032974:
	.4byte 0x02000000
_08032978:
	.4byte 0x000080FF
_0803297C:
	adds r0, r1, #0
	mov r1, sp
	bl ReadEepromDword
	mov r2, sp
	movs r3, #0
	b _08032994
_0803298A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bhi _080329A4
_08032994:
	ldrh r1, [r4]
	ldrh r0, [r2]
	adds r2, #2
	adds r4, #2
	cmp r1, r0
	beq _0803298A
	movs r5, #0x80
	lsls r5, r5, #8
_080329A4:
	adds r0, r5, #0
_080329A6:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global eeprom_program_verify
	.thumb_func
	.type eeprom_program_verify, %function
eeprom_program_verify: @ 080329B0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _080329C2
_080329BC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080329C2:
	cmp r6, #2
	bhi _080329E6
	adds r0, r4, #0
	adds r1, r5, #0
	bl ProgramEepromDword
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _080329BC
	adds r0, r4, #0
	adds r1, r5, #0
	bl VerifyEepromDword
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _080329BC
_080329E6:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global vsprintf
	.thumb_func
	.type vsprintf, %function
vsprintf: @ 080329F0
	push {r4, r5, lr}
	sub sp, #0x58
	mov r4, sp
	movs r5, #0
	movs r3, #0x82
	lsls r3, r3, #2
	strh r3, [r4, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _08032A20
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldr r0, _08032A24
	ldr r0, [r0]
	str r0, [sp, #0x54]
	mov r0, sp
	bl vfprintf
	ldr r1, [sp]
	strb r5, [r1]
	add sp, #0x58
	pop {r4, r5}
	pop {r1}
	bx r1
_08032A20:
	.4byte 0x7FFFFFFF
_08032A24:
	.4byte gUnk_08BB5284

	.global __sprint
	.thumb_func
	.type __sprint, %function
__sprint: @ 08032A28
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _08032A40
	adds r1, r4, #0
	bl __sfvwrite
	movs r1, #0
	str r1, [r4, #8]
	str r1, [r4, #4]
	b _08032A44
_08032A40:
	str r1, [r4, #4]
	movs r0, #0
_08032A44:
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __sbprintf
	.thumb_func
	.type __sbprintf, %function
__sbprintf: @ 08032A4C
	push {r4, r5, lr}
	ldr r4, _08032AC0
	add sp, r4
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x54]
	mov r3, sp
	movs r0, #3
	rsbs r0, r0, #0
	ldrh r4, [r5, #0xc]
	ands r0, r4
	movs r4, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r5, #0xe]
	strh r0, [r3, #0xe]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x24]
	add r0, sp, #0x58
	str r0, [sp]
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r0, sp
	bl vfprintf
	adds r4, r0, #0
	cmp r4, #0
	blt _08032A9C
	mov r0, sp
	bl fflush
	cmp r0, #0
	beq _08032A9C
	movs r4, #1
	rsbs r4, r4, #0
_08032A9C:
	mov r1, sp
	movs r0, #0x40
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08032AB0
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_08032AB0:
	adds r0, r4, #0
	movs r3, #0x8b
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08032AC0:
	.4byte 0xFFFFFBA8

	.global vfprintf
	.thumb_func
	.type vfprintf, %function
vfprintf: @ 08032AC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _vfprintf_r
	pop {r4, r5}
	pop {r1}
	bx r1

	.global _vfprintf_r
	.thumb_func
	.type _vfprintf_r, %function
_vfprintf_r: @ 08032ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08032B44
	add sp, r4
	str r0, [sp, #0x1dc]
	str r1, [sp, #0x1e0]
	adds r4, r2, #0
	mov sl, r3
	bl localeconv
	ldr r0, [r0]
	str r0, [sp, #0x1f8]
	movs r1, #0
	add r0, sp, #0x1d0
	str r1, [r0]
	ldr r1, [sp, #0x1e0]
	ldr r0, [r1, #0x54]
	cmp r0, #0
	bne _08032B0E
	ldr r0, _08032B48
	ldr r0, [r0]
	str r0, [r1, #0x54]
_08032B0E:
	ldr r2, [sp, #0x1e0]
	ldr r1, [r2, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _08032B1E
	adds r0, r1, #0
	bl __sinit
_08032B1E:
	movs r0, #8
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08032B32
	ldr r2, [sp, #0x1e0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _08032B4C
_08032B32:
	ldr r0, [sp, #0x1e0]
	bl __swsetup
	cmp r0, #0
	beq _08032B4C
	movs r0, #1
	rsbs r0, r0, #0
	bl _vfprintf_r_return
_08032B44:
	.4byte 0xFFFFFDE0
_08032B48:
	.4byte gUnk_08BB5284
_08032B4C:
	movs r0, #0x1a
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0xa
	bne _08032B70
	ldr r2, [sp, #0x1e0]
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _08032B70
	adds r0, r2, #0
	adds r1, r4, #0
	mov r2, sl
	bl __sbprintf
	bl _vfprintf_r_return
_08032B70:
	str r4, [sp, #0x1e4]
	add r1, sp, #0x1c
	add r5, sp, #0x28
	str r5, [sp, #0x1c]
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r2, #0
	str r2, [sp, #0x1f0]
	mov sb, r1
	movs r4, #0xe6
	lsls r4, r4, #1
	.2byte 0x446C @ add r4, sp, r4
	str r4, [sp, #0x214]
	movs r0, #0xe8
	lsls r0, r0, #1
	.2byte 0x4468 @ add r0, sp, r0
	str r0, [sp, #0x218]
_08032B94:
	ldr r1, [sp, #0x1e4]
	mov r8, r1
_08032B98:
	ldr r0, _08032C44
	ldr r0, [r0]
	ldr r1, _08032C48
	ldr r3, [r1]
	ldr r2, [sp, #0x218]
	str r2, [sp]
	ldr r1, [sp, #0x214]
	ldr r2, [sp, #0x1e4]
	bl _mbtowc_r
	adds r4, r0, #0
	cmp r4, #0
	ble _08032BC6
	ldr r0, [sp, #0x1e4]
	adds r0, r0, r4
	str r0, [sp, #0x1e4]
	add r0, sp, #0x1cc
	ldr r0, [r0]
	cmp r0, #0x25
	bne _08032B98
	ldr r1, [sp, #0x1e4]
	subs r1, #1
	str r1, [sp, #0x1e4]
_08032BC6:
	ldr r2, [sp, #0x1e4]
	mov r0, r8
	subs r6, r2, r0
	cmp r6, #0
	beq _08032BFE
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _08032BF8
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _08032BF6
	bl _vfprintf_r_result
_08032BF6:
	add r5, sp, #0x28
_08032BF8:
	ldr r2, [sp, #0x1f0]
	adds r2, r2, r6
	str r2, [sp, #0x1f0]
_08032BFE:
	cmp r4, #0
	bgt _08032C06
	bl _vfprintf_r_flush
_08032C06:
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	movs r0, #0
	str r0, [sp, #0x1ec]
	movs r1, #0
	str r1, [sp, #0x208]
	movs r2, #0
	str r2, [sp, #0x1f4]
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _08032C4C
	.2byte 0x4468 @ add r0, sp, r0
	strb r2, [r0]
_08032C22:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
_08032C2E:
	ldr r0, [sp, #0x1e8]
	subs r0, #0x20
	cmp r0, #0x58
	bls _08032C38
	b _080332EA
_08032C38:
	lsls r0, r0, #2
	ldr r1, _08032C50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.byte 0x00, 0x00
_08032C44:
	.4byte gUnk_08BB5284
_08032C48:
	.4byte gUnk_08BB5288
_08032C4C:
	.4byte 0x000001C9
_08032C50:
	.4byte _08032C54
	.global _08032C54
_08032C54:
	.4byte _08032DB8
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032DD0
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032DD4
	.4byte _08032DEE
	.4byte _080332EA
	.4byte _08032DEA
	.4byte _08032DFC
	.4byte _080332EA
	.4byte _08032E5C
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _08032E60
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032ECA
	.4byte _08032F1C
	.4byte _080332EA
	.4byte _08032F1C
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032E84
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080330D2
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _0803316A
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080331A6
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032EB8
	.4byte _08032ED2
	.4byte _08032F1C
	.4byte _08032F1C
	.4byte _08032F1C
	.4byte _08032E88
	.4byte _08032ED2
	.4byte _080332EA
	.4byte _080332EA
	.4byte _08032E8C
	.4byte _080332EA
	.4byte _0803308C
	.4byte _080330DA
	.4byte _08033108
	.4byte _08032EAE
	.4byte _080332EA
	.4byte _08033128
	.4byte _080332EA
	.4byte _08033172
	.4byte _080332EA
	.4byte _080332EA
	.4byte _080331B0
	.global _08032DB8
_08032DB8:
	ldr r1, _08032DCC
	.2byte 0x4469 @ add r1, sp, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08032DC4
	b _08032C22
_08032DC4:
	movs r0, #0x20
	strb r0, [r1]
	b _08032C22
	.byte 0x00, 0x00
_08032DCC:
	.4byte 0x000001C9
	.global _08032DD0
_08032DD0:
	movs r0, #1
	b _08032E9C
	.global _08032DD4
_08032DD4:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	str r0, [sp, #0x1f4]
	cmp r0, #0
	blt _08032DE6
	b _08032C22
_08032DE6:
	rsbs r0, r0, #0
	str r0, [sp, #0x1f4]
	.global _08032DEA
_08032DEA:
	movs r0, #4
	b _08032EB0
	.global _08032DEE
_08032DEE:
	ldr r1, _08032DF8
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0x2b
	strb r0, [r1]
	b _08032C22
_08032DF8:
	.4byte 0x000001C9
	.global _08032DFC
_08032DFC:
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	cmp r2, #0x2a
	bne _08032E26
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _08032E22
	b _08032C22
_08032E22:
	adds r6, r0, #0
	b _08032C22
_08032E26:
	movs r4, #0
	ldr r0, [sp, #0x1e8]
	b _08032E46
_08032E2C:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r1, [sp, #0x1e8]
	adds r4, r0, r1
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r0, [sp, #0x1e4]
	adds r0, #1
	str r0, [sp, #0x1e4]
	adds r0, r2, #0
_08032E46:
	subs r0, #0x30
	cmp r0, #9
	bls _08032E2C
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _08032E58
	b _08032C2E
_08032E58:
	adds r6, r0, #0
	b _08032C2E
	.global _08032E5C
_08032E5C:
	movs r0, #0x80
	b _08032EB0
	.global _08032E60
_08032E60:
	movs r4, #0
_08032E62:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r2, [sp, #0x1e8]
	adds r4, r0, r2
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	subs r0, #0x30
	cmp r0, #9
	bls _08032E62
	str r4, [sp, #0x1f4]
	b _08032C2E
	.global _08032E84
_08032E84:
	movs r0, #8
	b _08032E9C
	.global _08032E88
_08032E88:
	movs r0, #0x40
	b _08032EA6
	.global _08032E8C
_08032E8C:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	cmp r0, #0x6c
	bne _08032EA4
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	movs r0, #0x20
_08032E9C:
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	b _08032C22
_08032EA4:
	movs r0, #0x10
_08032EA6:
	ldr r4, [sp, #0x1ec]
	orrs r4, r0
	str r4, [sp, #0x1ec]
	b _08032C22
	.global _08032EAE
_08032EAE:
	movs r0, #0x20
_08032EB0:
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	b _08032C22
	.global _08032EB8
_08032EB8:
	add r2, sp, #0x68
	mov r8, r2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	strb r0, [r2]
	b _080332F8
	.global _08032ECA
_08032ECA:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	.global _08032ED2
_08032ED2:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _08032EE2
	movs r4, #4
	add sl, r4
	b _08032EFE
_08032EE2:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _08032EFA
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _08032F04
_08032EFA:
	movs r2, #4
	add sl, r2
_08032EFE:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_08032F04:
	cmp r4, #0
	bge _08032F12
	rsbs r4, r4, #0
	ldr r1, _08032F18
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0x2d
	strb r0, [r1]
_08032F12:
	movs r2, #1
	b _080331FE
	.byte 0x00, 0x00
_08032F18:
	.4byte 0x000001C9
	.global _08032F1C
_08032F1C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _08032F28
	movs r6, #6
	b _08032F38
_08032F28:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _08032F32
	cmp r4, #0x47
	bne _08032F38
_08032F32:
	cmp r6, #0
	bne _08032F38
	movs r6, #1
_08032F38:
	movs r0, #8
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	movs r2, #8
	add sl, r2
	mov r0, sl
	subs r0, #8
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x1fc]
	str r2, [sp, #0x200]
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isinf
	cmp r0, #0
	beq _08032F8C
	ldr r3, _08032F80
	ldr r2, _08032F7C
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __ltdf2
	cmp r0, #0
	bge _08032F72
	ldr r1, _08032F84
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0x2d
	strb r0, [r1]
_08032F72:
	ldr r2, _08032F88
	mov r8, r2
	movs r3, #3
	b _08033302
	.byte 0x00, 0x00
_08032F7C:
	.4byte 0x00000000
_08032F80:
	.4byte 0x00000000
_08032F84:
	.4byte 0x000001C9
_08032F88:
	.4byte gUnk_0884CD54
_08032F8C:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isnan
	cmp r0, #0
	beq _08032FA4
	ldr r4, _08032FA0
	mov r8, r4
	movs r3, #3
	b _08033302
_08032FA0:
	.4byte gUnk_0884CD58
_08032FA4:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	str r1, [sp]
	add r0, sp, #0x1c8
	str r0, [sp, #4]
	add r0, sp, #0x1d4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1e8]
	str r2, [sp, #0xc]
	add r0, sp, #0x1d8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1dc]
	ldr r1, [sp, #0x1fc]
	ldr r2, [sp, #0x200]
	adds r3, r6, #0
	bl cvt
	mov r8, r0
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _08032FD8
	cmp r4, #0x47
	bne _08032FFA
_08032FD8:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08032FE8
	cmp r1, r6
	ble _08032FF6
_08032FE8:
	movs r0, #0x45
	ldr r1, [sp, #0x1e8]
	cmp r1, #0x67
	bne _08032FF2
	movs r0, #0x65
_08032FF2:
	str r0, [sp, #0x1e8]
	b _08032FFA
_08032FF6:
	movs r2, #0x67
	str r2, [sp, #0x1e8]
_08032FFA:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x65
	bgt _08033020
	add r0, sp, #0x1d4
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	add r0, sp, #0x14
	ldr r2, [sp, #0x1e8]
	bl exponent
	str r0, [sp, #0x204]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	ldr r1, [sp, #0x204]
	adds r3, r1, r0
	cmp r0, #1
	bgt _08033060
	b _08033056
_08033020:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x66
	bne _08033048
	add r0, sp, #0x1d4
	ldr r0, [r0]
	cmp r0, #0
	ble _08033044
	adds r3, r0, #0
	cmp r6, #0
	bne _0803303E
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _08033070
_0803303E:
	adds r0, r3, #1
	adds r3, r0, r6
	b _08033070
_08033044:
	adds r3, r6, #2
	b _08033070
_08033048:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	cmp r1, r0
	blt _08033064
	adds r3, r1, #0
_08033056:
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _08033070
_08033060:
	adds r3, #1
	b _08033070
_08033064:
	cmp r1, #0
	bgt _0803306E
	adds r0, #2
	subs r3, r0, r1
	b _08033070
_0803306E:
	adds r3, r0, #1
_08033070:
	add r0, sp, #0x1c8
	ldrb r0, [r0]
	adds r7, r5, #0
	adds r7, #8
	cmp r0, #0
	bne _0803307E
	b _08033306
_0803307E:
	ldr r1, _08033088
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0x2d
	strb r0, [r1]
	b _08033306
_08033088:
	.4byte 0x000001C9
	.global _0803308C
_0803308C:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080330A6
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #0x1f0]
	str r1, [r0]
	b _08032B94
_080330A6:
	movs r0, #0x40
	ldr r2, [sp, #0x1ec]
	ands r2, r0
	cmp r2, #0
	beq _080330C2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	add r1, sp, #0x1f0
	ldrh r1, [r1]
	strh r1, [r0]
	b _08032B94
_080330C2:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r4, [sp, #0x1f0]
	str r4, [r0]
	b _08032B94
	.global _080330D2
_080330D2:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	.global _080330DA
_080330DA:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080330FA
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080330FA
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _08033104
_080330FA:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_08033104:
	movs r2, #0
	b _080331F6
	.global _08033108
_08033108:
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	movs r2, #2
	ldr r1, _08033124
	str r1, [sp, #0x210]
	ldr r0, [sp, #0x1ec]
	orrs r0, r2
	str r0, [sp, #0x1ec]
	movs r1, #0x78
	str r1, [sp, #0x1e8]
	b _080331F6
_08033124:
	.4byte gUnk_0884CD5C
	.global _08033128
_08033128:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _0803313C
	ldr r4, _0803315C
	mov r8, r4
_0803313C:
	cmp r6, #0
	blt _08033160
	mov r0, r8
	movs r1, #0
	adds r2, r6, #0
	bl memchr
	cmp r0, #0
	beq _08033158
	mov r1, r8
	subs r3, r0, r1
	cmp r3, r6
	bgt _08033158
	b _080332FA
_08033158:
	adds r3, r6, #0
	b _080332FA
_0803315C:
	.4byte gUnk_0884CD70
_08033160:
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080332FA
	.global _0803316A
_0803316A:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	.global _08033172
_08033172:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _08033182
	movs r0, #4
	add sl, r0
	b _0803319C
_08033182:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _08033198
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080331A2
_08033198:
	movs r4, #4
	add sl, r4
_0803319C:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080331A2:
	movs r2, #1
	b _080331F6
	.global _080331A6
_080331A6:
	ldr r0, _080331AC
	str r0, [sp, #0x210]
	b _080331B4
_080331AC:
	.4byte gUnk_0884CD78
	.global _080331B0
_080331B0:
	ldr r1, _080331D4
	str r1, [sp, #0x210]
_080331B4:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080331D8
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080331D8
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080331E2
_080331D4:
	.4byte gUnk_0884CD5C
_080331D8:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080331E2:
	movs r2, #2
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080331F6
	cmp r4, #0
	beq _080331F6
	orrs r1, r2
	str r1, [sp, #0x1ec]
_080331F6:
	ldr r1, _08033240
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0
	strb r0, [r1]
_080331FE:
	str r6, [sp, #0x208]
	cmp r6, #0
	blt _0803320E
	movs r0, #0x81
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1ec]
	ands r1, r0
	str r1, [sp, #0x1ec]
_0803320E:
	movs r0, #0xe2
	lsls r0, r0, #1
	.2byte 0x4468 @ add r0, sp, r0
	mov r8, r0
	cmp r4, #0
	bne _08033224
	adds r7, r5, #0
	adds r7, #8
	ldr r1, [sp, #0x208]
	cmp r1, #0
	beq _080332DC
_08033224:
	cmp r2, #1
	beq _08033282
	cmp r2, #1
	blo _08033248
	cmp r2, #2
	beq _080332BC
	ldr r2, _08033244
	mov r8, r2
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _08033302
	.byte 0x00, 0x00
_08033240:
	.4byte 0x000001C9
_08033244:
	.4byte gUnk_0884CD8C
_08033248:
	adds r7, r5, #0
	adds r7, #8
	movs r2, #7
_0803324E:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x30
	mov r0, r8
	strb r1, [r0]
	lsrs r4, r4, #3
	cmp r4, #0
	bne _0803324E
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080332DC
	cmp r1, #0x30
	beq _080332DC
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	movs r0, #0x30
	mov r1, r8
	strb r0, [r1]
	b _080332DC
_08033282:
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #9
	bls _080332AC
_0803328A:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x30
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl ram_divide_veneer
	adds r4, r0, #0
	cmp r4, #9
	bhi _0803328A
_080332AC:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	adds r0, #0x30
	mov r4, r8
	strb r0, [r4]
	b _080332DC
_080332BC:
	adds r7, r5, #0
	adds r7, #8
	movs r1, #0xf
_080332C2:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r1
	ldr r2, [sp, #0x210]
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2]
	lsrs r4, r4, #4
	cmp r4, #0
	bne _080332C2
_080332DC:
	add r4, sp, #0x14
	mov r1, r8
	subs r0, r4, r1
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r3, r0, r2
	b _08033306
	.global _080332EA
_080332EA:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0
	bne _080332F2
	b _vfprintf_r_flush
_080332F2:
	add r0, sp, #0x68
	mov r8, r0
	strb r4, [r0]
_080332F8:
	movs r3, #1
_080332FA:
	ldr r1, _08033324
	.2byte 0x4469 @ add r1, sp, r1
	movs r0, #0
	strb r0, [r1]
_08033302:
	adds r7, r5, #0
	adds r7, #8
_08033306:
	str r3, [sp, #0x20c]
	ldr r2, [sp, #0x208]
	cmp r3, r2
	bge _08033310
	str r2, [sp, #0x20c]
_08033310:
	ldr r0, _08033324
	.2byte 0x4468 @ add r0, sp, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033328
	ldr r4, [sp, #0x20c]
	adds r4, #1
	str r4, [sp, #0x20c]
	b _08033338
	.byte 0x00, 0x00
_08033324:
	.4byte 0x000001C9
_08033328:
	movs r0, #2
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _08033338
	ldr r2, [sp, #0x20c]
	adds r2, #2
	str r2, [sp, #0x20c]
_08033338:
	movs r0, #0x84
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	bne _080333B8
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080333B8
	ldr r1, _080333E4
	cmp r4, #0x10
	ble _0803338C
	mov r6, sb
_08033354:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, r7, #0
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _08033382
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _0803337E
	b _vfprintf_r_result
_0803337E:
	add r5, sp, #0x28
	ldr r1, _080333E4
_08033382:
	subs r4, #0x10
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #0x10
	bgt _08033354
_0803338C:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, r7, #0
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080333B8
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080333B6
	b _vfprintf_r_result
_080333B6:
	add r5, sp, #0x28
_080333B8:
	ldr r1, _080333E8
	.2byte 0x4469 @ add r1, sp, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080333EC
	str r1, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _0803342C
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	b _0803341C
	.byte 0x00, 0x00
_080333E4:
	.4byte gUnk_0884CD34
_080333E8:
	.4byte 0x000001C9
_080333EC:
	movs r2, #2
	ldr r0, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _0803342C
	add r1, sp, #0x1c4
	movs r0, #0x30
	strb r0, [r1]
	add r0, sp, #0x1e8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	str r1, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _0803342C
	ldr r0, [sp, #0x1e0]
_0803341C:
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _0803342A
	b _vfprintf_r_result
_0803342A:
	add r5, sp, #0x28
_0803342C:
	movs r0, #0x84
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0x80
	bne _080334A8
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080334A8
	ldr r1, _08033544
	cmp r4, #0x10
	ble _0803347C
	mov r6, sb
_08033448:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _08033476
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _08033472
	b _vfprintf_r_result
_08033472:
	add r5, sp, #0x28
	ldr r1, _08033544
_08033476:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _08033448
_0803347C:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080334A8
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080334A6
	b _vfprintf_r_result
_080334A6:
	add r5, sp, #0x28
_080334A8:
	ldr r0, [sp, #0x208]
	subs r4, r0, r3
	cmp r4, #0
	ble _08033516
	ldr r1, _08033544
	cmp r4, #0x10
	ble _080334EC
	mov r6, sb
_080334B8:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080334E6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080334E2
	b _vfprintf_r_result
_080334E2:
	add r5, sp, #0x28
	ldr r1, _08033544
_080334E6:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080334B8
_080334EC:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _08033516
	ldr r0, [sp, #0x1e0]
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _08033514
	b _vfprintf_r_result
_08033514:
	add r5, sp, #0x28
_08033516:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _08033548
	mov r4, r8
	str r4, [r5]
	str r3, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r3
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	bgt _0803353E
	b _0803395E
_0803353E:
	ldr r0, [sp, #0x1e0]
	b _08033954
	.byte 0x00, 0x00
_08033544:
	.4byte gUnk_0884CD44
_08033548:
	ldr r2, [sp, #0x1e8]
	cmp r2, #0x65
	bgt _08033550
	b _08033834
_08033550:
	ldr r3, _0803361C
	ldr r2, _08033618
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __eqdf2
	cmp r0, #0
	bne _08033628
	ldr r0, _08033620
	str r0, [r5]
	movs r6, #1
	str r6, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _0803358C
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _0803358A
	b _vfprintf_r_result
_0803358A:
	add r5, sp, #0x28
_0803358C:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r1, r0
	blt _080335A2
	ldr r0, [sp, #0x1ec]
	ands r0, r6
	cmp r0, #0
	bne _080335A2
	b _0803395E
_080335A2:
	ldr r0, [sp, #0x1f8]
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080335CA
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080335C8
	b _vfprintf_r_result
_080335C8:
	add r5, sp, #0x28
_080335CA:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080335D4
	b _0803395E
_080335D4:
	ldr r1, _08033624
	cmp r4, #0x10
	ble _0803360C
	mov r6, sb
_080335DC:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _08033606
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _08033602
	b _vfprintf_r_result
_08033602:
	add r5, sp, #0x28
	ldr r1, _08033624
_08033606:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080335DC
_0803360C:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	b _08033942
_08033618:
	.4byte 0x00000000
_0803361C:
	.4byte 0x00000000
_08033620:
	.4byte gUnk_0884CDA8
_08033624:
	.4byte gUnk_0884CD44
_08033628:
	add r6, sp, #0x1d4
	ldr r2, [r6]
	cmp r2, #0
	bgt _08033710
	ldr r0, _08033708
	str r0, [r5]
	movs r4, #1
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _0803365A
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _08033658
	b _vfprintf_r_result
_08033658:
	add r5, sp, #0x28
_0803365A:
	ldr r2, [sp, #0x1f8]
	str r2, [r5]
	str r4, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _08033684
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _08033682
	b _vfprintf_r_result
_08033682:
	add r5, sp, #0x28
_08033684:
	ldr r0, [r6]
	rsbs r4, r0, #0
	cmp r4, #0
	ble _080336EA
	ldr r1, _0803370C
	cmp r4, #0x10
	ble _080336C4
	mov r6, sb
_08033694:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080336BE
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080336BA
	b _vfprintf_r_result
_080336BA:
	add r5, sp, #0x28
	ldr r1, _0803370C
_080336BE:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _08033694
_080336C4:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080336EA
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080336E8
	b _vfprintf_r_result
_080336E8:
	add r5, sp, #0x28
_080336EA:
	mov r2, r8
	str r2, [r5]
	add r0, sp, #0x1d8
	ldr r1, [r0]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _0803394C
	.byte 0x00, 0x00
_08033708:
	.4byte gUnk_0884CDA8
_0803370C:
	.4byte gUnk_0884CD44
_08033710:
	add r4, sp, #0x1d8
	ldr r1, [r4]
	cmp r2, r1
	blt _080337CC
	mov r0, r8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _08033742
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _08033740
	b _vfprintf_r_result
_08033740:
	add r5, sp, #0x28
_08033742:
	ldr r1, [r6]
	ldr r0, [r4]
	subs r4, r1, r0
	cmp r4, #0
	ble _080337AA
	ldr r1, _080337C4
	cmp r4, #0x10
	ble _08033784
	mov r6, sb
_08033754:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _0803377E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _0803377A
	b _vfprintf_r_result
_0803377A:
	add r5, sp, #0x28
	ldr r1, _080337C4
_0803377E:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _08033754
_08033784:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080337AA
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080337A8
	b _vfprintf_r_result
_080337A8:
	add r5, sp, #0x28
_080337AA:
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	bne _080337B6
	b _0803395E
_080337B6:
	ldr r0, _080337C8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	b _08033942
_080337C4:
	.4byte gUnk_0884CD44
_080337C8:
	.4byte gUnk_0884CDAC
_080337CC:
	mov r0, r8
	str r0, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080337F4
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080337F2
	b _vfprintf_r_result
_080337F2:
	add r5, sp, #0x28
_080337F4:
	ldr r0, [r6]
	add r8, r0
	ldr r0, _08033830
	str r0, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _08033824
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _08033822
	b _vfprintf_r_result
_08033822:
	add r5, sp, #0x28
_08033824:
	mov r0, r8
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [r6]
	subs r1, r1, r0
	b _0803393A
_08033830:
	.4byte gUnk_0884CDAC
_08033834:
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r0, #1
	bgt _08033846
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _0803390C
_08033846:
	add r1, sp, #0x1c4
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #1
	add r8, r0
	movs r0, #0x2e
	strb r0, [r1, #1]
	str r1, [r5]
	movs r0, #2
	str r0, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _0803387E
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _0803387C
	b _vfprintf_r_result
_0803387C:
	add r5, sp, #0x28
_0803387E:
	ldr r3, _080338A8
	ldr r2, _080338A4
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __nedf2
	cmp r0, #0
	beq _080338AC
	mov r2, r8
	str r2, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, #1
	adds r0, r0, r1
	b _08033918
	.byte 0x00, 0x00
_080338A4:
	.4byte 0x00000000
_080338A8:
	.4byte 0x00000000
_080338AC:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	ble _08033934
	ldr r1, _08033908
	cmp r4, #0x10
	ble _080338EC
	mov r6, sb
_080338BC:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080338E6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080338E2
	b _vfprintf_r_result
_080338E2:
	add r5, sp, #0x28
	ldr r1, _08033908
_080338E6:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080338BC
_080338EC:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _08033934
	ldr r0, [sp, #0x1e0]
	b _0803392A
_08033908:
	.4byte gUnk_0884CD44
_0803390C:
	mov r2, r8
	str r2, [r5]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
_08033918:
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _08033934
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_0803392A:
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
	add r5, sp, #0x28
_08033934:
	add r0, sp, #0x14
	str r0, [r5]
	ldr r1, [sp, #0x204]
_0803393A:
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
_08033942:
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
_0803394C:
	cmp r0, #7
	ble _0803395E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_08033954:
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
	add r5, sp, #0x28
_0803395E:
	movs r0, #4
	ldr r4, [sp, #0x1ec]
	ands r4, r0
	cmp r4, #0
	beq _080339CA
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080339CA
	ldr r1, _080339FC
	cmp r4, #0x10
	ble _080339A8
	mov r6, sb
_0803397A:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080339A2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
	add r5, sp, #0x28
	ldr r1, _080339FC
_080339A2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _0803397A
_080339A8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080339CA
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
_080339CA:
	ldr r0, [sp, #0x20c]
	ldr r4, [sp, #0x1f4]
	cmp r0, r4
	bge _080339D4
	adds r0, r4, #0
_080339D4:
	ldr r1, [sp, #0x1f0]
	adds r1, r1, r0
	str r1, [sp, #0x1f0]
	mov r2, sb
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _080339EE
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
_080339EE:
	movs r0, #0
	mov r4, sb
	str r0, [r4, #4]
	add r5, sp, #0x28
	bl _08032B94
	.byte 0x00, 0x00
_080339FC:
	.4byte gUnk_0884CD34

	.global _vfprintf_r_flush
	.thumb_func
	.type _vfprintf_r_flush, %function
_vfprintf_r_flush: @ 08033A00
	mov r1, sb
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _08033A12
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	bne _vfprintf_r_result
_08033A12:
	movs r0, #0
	mov r1, sb
	str r0, [r1, #4]

	.global _vfprintf_r_result
	.thumb_func
	.type _vfprintf_r_result, %function
_vfprintf_r_result: @ 08033A18
	movs r0, #0x40
	ldr r2, [sp, #0x1e0]
	ldrh r2, [r2, #0xc]
	ands r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _08033A2A
	ldr r1, [sp, #0x1f0]
_08033A2A:
	adds r0, r1, #0

	.global _vfprintf_r_return
	.thumb_func
	.type _vfprintf_r_return, %function
_vfprintf_r_return: @ 08033A2C
	movs r3, #0x88
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global cvt
	.thumb_func
	.type cvt, %function
cvt: @ 08033A40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	adds r5, r2, #0
	adds r4, r1, #0
	mov r8, r3
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	mov sl, r0
	ldr r1, [sp, #0x48]
	mov sb, r1
	cmp r1, #0x66
	bne _08033A66
	movs r7, #3
	b _08033A76
_08033A66:
	mov r0, sb
	cmp r0, #0x65
	beq _08033A70
	cmp r0, #0x45
	bne _08033A74
_08033A70:
	movs r1, #1
	add r8, r1
_08033A74:
	movs r7, #2
_08033A76:
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _08033A8C
	adds r1, r5, #0
	adds r0, r4, #0
	bl __negdf2
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0x2d
_08033A8C:
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl _dtoa_r
	adds r7, r0, #0
	mov r1, sb
	cmp r1, #0x67
	beq _08033AB8
	cmp r1, #0x47
	bne _08033AC0
_08033AB8:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _08033B14
_08033AC0:
	mov r0, r8
	adds r6, r7, r0
	mov r1, sb
	cmp r1, #0x66
	bne _08033AF0
	ldrb r0, [r7]
	cmp r0, #0x30
	bne _08033AEA
	ldr r3, _08033B34
	ldr r2, _08033B30
	adds r1, r5, #0
	adds r0, r4, #0
	bl __nedf2
	cmp r0, #0
	beq _08033AEA
	mov r1, r8
	rsbs r0, r1, #0
	adds r0, #1
	mov r1, sl
	str r0, [r1]
_08033AEA:
	mov r1, sl
	ldr r0, [r1]
	adds r6, r6, r0
_08033AF0:
	ldr r3, _08033B34
	ldr r2, _08033B30
	adds r1, r5, #0
	adds r0, r4, #0
	bl __eqdf2
	cmp r0, #0
	bne _08033B02
	str r6, [sp, #0x14]
_08033B02:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bhs _08033B14
	movs r1, #0x30
_08033B0A:
	strb r1, [r0]
	adds r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blo _08033B0A
_08033B14:
	ldr r0, [sp, #0x14]
	subs r0, r0, r7
	ldr r1, [sp, #0x4c]
	str r0, [r1]
	adds r0, r7, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08033B30:
	.4byte 0x00000000
_08033B34:
	.4byte 0x00000000

	.global exponent
	.thumb_func
	.type exponent, %function
exponent: @ 08033B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x134
	adds r7, r0, #0
	adds r6, r1, #0
	strb r2, [r7]
	adds r5, r7, #1
	cmp r6, #0
	bge _08033B4E
	rsbs r6, r6, #0
	movs r0, #0x2d
	b _08033B50
_08033B4E:
	movs r0, #0x2b
_08033B50:
	strb r0, [r7, #1]
	adds r5, #1
	add r4, sp, #0x134
	cmp r6, #9
	ble _08033B92
_08033B5A:
	subs r4, #1
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #9
	bgt _08033B5A
	subs r4, #1
	adds r0, #0x30
	strb r0, [r4]
	add r0, sp, #0x134
	cmp r4, r0
	bhs _08033BA0
	adds r1, r0, #0
_08033B84:
	ldrb r0, [r4]
	strb r0, [r5]
	adds r4, #1
	adds r5, #1
	cmp r4, r1
	blo _08033B84
	b _08033BA0
_08033B92:
	movs r0, #0x30
	strb r0, [r5]
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	strb r0, [r5]
	adds r5, #1
_08033BA0:
	subs r0, r5, r7
	add sp, #0x134
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __swsetup
	.thumb_func
	.type __swsetup, %function
__swsetup: @ 08033BAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _08033BBC
	ldr r0, _08033BE8
	ldr r0, [r0]
	str r0, [r4, #0x54]
_08033BBC:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _08033BCA
	adds r0, r1, #0
	bl __sinit
_08033BCA:
	ldrh r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _08033C24
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08033BEC
	movs r0, #1
	rsbs r0, r0, #0
	b _08033C56
	.byte 0x00, 0x00
_08033BE8:
	.4byte gUnk_08BB5284
_08033BEC:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08033C1C
	ldr r1, [r4, #0x30]
	cmp r1, #0
	beq _08033C0A
	adds r0, r4, #0
	adds r0, #0x40
	cmp r1, r0
	beq _08033C08
	ldr r0, [r4, #0x54]
	bl _free_r
_08033C08:
	str r5, [r4, #0x30]
_08033C0A:
	movs r0, #0x25
	rsbs r0, r0, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	movs r1, #0
	strh r0, [r4, #0xc]
	str r1, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [r4]
_08033C1C:
	movs r0, #8
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_08033C24:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _08033C30
	adds r0, r4, #0
	bl __smakebuf
_08033C30:
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033C46
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	rsbs r0, r0, #0
	str r0, [r4, #0x18]
	b _08033C54
_08033C46:
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _08033C52
	ldr r1, [r4, #0x14]
_08033C52:
	str r1, [r4, #8]
_08033C54:
	movs r0, #0
_08033C56:
	pop {r4, r5}
	pop {r1}
	bx r1

	.global quorem
	.thumb_func
	.type quorem, %function
quorem: @ 08033C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r7, [r1, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r7
	bge _08033C78
	movs r0, #0
	b _08033DAC
_08033C78:
	ldr r0, [sp, #4]
	adds r0, #0x14
	mov r8, r0
	subs r7, #1
	lsls r0, r7, #2
	mov r1, r8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r4, [sp]
	adds r4, #0x14
	adds r5, r4, r0
	ldr r1, [r1]
	adds r1, #1
	ldr r2, [r5]
	mov sl, r2
	mov r0, sl
	bl ram_divide_veneer
	str r0, [sp, #8]
	mov r3, r8
	str r3, [sp, #0x14]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _08033D22
	movs r6, #0
	mov sb, r6
	ldr r0, _08033D0C
	mov ip, r0
_08033CB0:
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	ldm r2!, {r1}
	adds r0, r1, #0
	mov r3, ip
	ands r0, r3
	ldr r2, [sp, #8]
	muls r0, r2, r0
	mov r3, sb
	adds r2, r0, r3
	lsrs r0, r1, #0x10
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r0, [r4]
	mov r1, ip
	ands r0, r1
	ands r2, r1
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	ldr r0, [r4]
	lsrs r1, r0, #0x10
	mov r0, ip
	ands r3, r0
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _08033CB0
	mov r2, sl
	cmp r2, #0
	bne _08033D22
	ldr r4, [sp, #0x10]
	b _08033D12
	.byte 0x00, 0x00
_08033D0C:
	.4byte 0x0000FFFF
_08033D10:
	subs r7, #1
_08033D12:
	subs r5, #4
	cmp r5, r4
	bls _08033D1E
	ldr r0, [r5]
	cmp r0, #0
	beq _08033D10
_08033D1E:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_08033D22:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __mcmp
	cmp r0, #0
	blt _08033DAA
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	movs r6, #0
	mov sb, r6
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r8, r1
	lsls r2, r7, #2
	mov sl, r2
	ldr r5, _08033D94
_08033D44:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r1}
	adds r0, r1, #0
	ands r0, r5
	mov r3, sb
	adds r2, r0, r3
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	ands r2, r5
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	lsrs r1, r1, #0x10
	ands r3, r5
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _08033D44
	ldr r4, [sp, #0x10]
	mov r2, sl
	adds r5, r4, r2
	ldr r0, [r5]
	cmp r0, #0
	bne _08033DAA
	b _08033D9A
	.byte 0x00, 0x00
_08033D94:
	.4byte 0x0000FFFF
_08033D98:
	subs r7, #1
_08033D9A:
	subs r5, #4
	cmp r5, r4
	bls _08033DA6
	ldr r0, [r5]
	cmp r0, #0
	beq _08033D98
_08033DA6:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_08033DAA:
	ldr r0, [sp, #8]
_08033DAC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global _dtoa_r
	.thumb_func
	.type _dtoa_r, %function
_dtoa_r: @ 08033DBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	mov sl, r0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0xac]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	ldr r2, [r0, #0x40]
	cmp r2, #0
	beq _08033DF4
	ldr r0, [r0, #0x44]
	str r0, [r2, #4]
	mov r0, sl
	ldr r1, [r0, #0x44]
	movs r0, #1
	lsls r0, r1
	str r0, [r2, #8]
	mov r0, sl
	adds r1, r2, #0
	bl _Bfree
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x40]
_08033DF4:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	beq _08033E10
	movs r0, #1
	str r0, [r4]
	ldr r0, _08033E0C
	ands r1, r0
	str r1, [sp, #0x40]
	b _08033E12
_08033E0C:
	.4byte 0x7FFFFFFF
_08033E10:
	str r0, [r4]
_08033E12:
	ldr r1, _08033E54
	ldr r2, [sp, #0x40]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _08033E68
	ldr r0, _08033E58
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _08033E5C
	mov sb, r0
	ldr r1, [sp, #0x44]
	cmp r1, #0
	bne _08033E3A
	ldr r0, _08033E60
	ands r2, r0
	cmp r2, #0
	bne _08033E3A
	ldr r2, _08033E64
	mov sb, r2
_08033E3A:
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _08033E8C
	mov r1, sb
	ldrb r0, [r1, #3]
	adds r1, #3
	cmp r0, #0
	beq _08033E4C
	adds r1, #5
_08033E4C:
	ldr r2, [sp, #0xb0]
	str r1, [r2]
	b _08033E8C
	.byte 0x00, 0x00
_08033E54:
	.4byte 0x7FF00000
_08033E58:
	.4byte 0x0000270F
_08033E5C:
	.4byte gUnk_0884CDBC
_08033E60:
	.4byte 0x000FFFFF
_08033E64:
	.4byte gUnk_0884CDB0
_08033E68:
	ldr r3, _08033E98
	ldr r2, _08033E94
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __eqdf2
	cmp r0, #0
	bne _08033EA0
	movs r0, #1
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _08033E9C
	mov sb, r0
	ldr r1, [sp, #0xb0]
	cmp r1, #0
	beq _08033E8C
	adds r0, #1
	str r0, [r1]
_08033E8C:
	mov r0, sb
	bl _dtoa_r_return
	.byte 0x00, 0x00
_08033E94:
	.4byte 0x00000000
_08033E98:
	.4byte 0x00000000
_08033E9C:
	.4byte gUnk_0884CDC0
_08033EA0:
	add r0, sp, #8
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	add r3, sp, #4
	bl __d2b
	str r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	lsrs r0, r0, #0x15
	mov r8, r0
	cmp r0, #0
	beq _08033EF0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r0, _08033EE4
	ldr r1, [sp, #0x48]
	ands r1, r0
	str r1, [sp, #0x48]
	ldr r0, _08033EE8
	adds r2, r1, #0
	orrs r2, r0
	str r2, [sp, #0x48]
	ldr r3, _08033EEC
	add r8, r3
	movs r0, #0
	str r0, [sp, #0x58]
	ldr r6, [sp, #8]
	b _08033F50
	.byte 0x00, 0x00
_08033EE4:
	.4byte 0x000FFFFF
_08033EE8:
	.4byte 0x3FF00000
_08033EEC:
	.4byte 0xFFFFFC01
_08033EF0:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	ldr r3, _08033F18
	adds r3, r3, r2
	mov r8, r3
	adds r6, r1, #0
	cmp r3, #0x20
	ble _08033F20
	movs r0, #0x40
	subs r0, r0, r3
	ldr r4, [sp, #0x40]
	lsls r4, r0
	ldr r1, _08033F1C
	adds r0, r2, r1
	ldr r2, [sp, #0x44]
	lsrs r2, r0
	adds r0, r2, #0
	orrs r4, r0
	b _08033F2A
_08033F18:
	.4byte 0x00000432
_08033F1C:
	.4byte 0x00000412
_08033F20:
	movs r0, #0x20
	mov r3, r8
	subs r0, r0, r3
	ldr r4, [sp, #0x44]
	lsls r4, r0
_08033F2A:
	adds r0, r4, #0
	bl __floatsidf
	cmp r4, #0
	bge _08033F3C
	ldr r3, _08034000
	ldr r2, _08033FFC
	bl __adddf3
_08033F3C:
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, _08034004
	ldr r0, [sp, #0x48]
	adds r1, r0, r1
	str r1, [sp, #0x48]
	ldr r2, _08034008
	add r8, r2
	movs r3, #1
	str r3, [sp, #0x58]
_08033F50:
	ldr r2, _0803400C
	ldr r3, _08034010
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	bl __subdf3
	ldr r2, _08034014
	ldr r3, _08034018
	bl __muldf3
	ldr r2, _0803401C
	ldr r3, _08034020
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl __floatsidf
	ldr r2, _08034024
	ldr r3, _08034028
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	bl __fixdfsi
	str r0, [sp, #0x24]
	ldr r2, _0803402C
	ldr r3, _08034030
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __ltdf2
	cmp r0, #0
	bge _08033FC0
	ldr r0, [sp, #0x24]
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __nedf2
	cmp r0, #0
	beq _08033FC0
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
_08033FC0:
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	cmp r2, #0x16
	bhi _08033FEA
	ldr r1, _08034034
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _08033FE6
	ldr r3, [sp, #0x24]
	subs r3, #1
	str r3, [sp, #0x24]
_08033FE6:
	movs r0, #0
	str r0, [sp, #0x2c]
_08033FEA:
	mov r1, r8
	subs r0, r6, r1
	subs r4, r0, #1
	cmp r4, #0
	blt _08034038
	movs r2, #0
	str r2, [sp, #0x10]
	str r4, [sp, #0x34]
	b _08034040
_08033FFC:
	.4byte 0x41F00000
_08034000:
	.4byte 0x00000000
_08034004:
	.4byte 0xFE100000
_08034008:
	.4byte 0xFFFFFBCD
_0803400C:
	.4byte 0x3FF80000
_08034010:
	.4byte 0x00000000
_08034014:
	.4byte 0x3FD287A7
_08034018:
	.4byte 0x636F4361
_0803401C:
	.4byte 0x3FC68A28
_08034020:
	.4byte 0x8B60C8B3
_08034024:
	.4byte 0x3FD34413
_08034028:
	.4byte 0x509F79FB
_0803402C:
	.4byte 0x00000000
_08034030:
	.4byte 0x00000000
_08034034:
	.4byte gUnk_0884CE0C
_08034038:
	rsbs r4, r4, #0
	str r4, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x34]
_08034040:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	blt _08034054
	movs r1, #0
	str r1, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	adds r2, r2, r0
	str r2, [sp, #0x34]
	b _08034064
_08034054:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x24]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	rsbs r1, r0, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x38]
_08034064:
	ldr r3, [sp, #0xc]
	cmp r3, #9
	bls _0803406E
	movs r0, #0
	str r0, [sp, #0xc]
_0803406E:
	movs r5, #1
	ldr r1, [sp, #0xc]
	cmp r1, #5
	ble _0803407C
	subs r1, #4
	str r1, [sp, #0xc]
	movs r5, #0
_0803407C:
	movs r2, #1
	str r2, [sp, #0x30]
	ldr r3, [sp, #0xc]
	cmp r3, #5
	bhi _080340F6
	lsls r0, r3, #2
	ldr r1, _08034090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
_08034090:
	.4byte _08034094
	.global _08034094
_08034094:
	.4byte _080340AC
	.4byte _080340AC
	.4byte _080340BE
	.4byte _080340DA
	.4byte _080340C2
	.4byte _080340DE
	.global _080340AC
_080340AC:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r1, #0x12
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xa4]
	b _080340F6
	.global _080340BE
_080340BE:
	movs r3, #0
	str r3, [sp, #0x30]
	.global _080340C2
_080340C2:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bgt _080340CC
	movs r1, #1
	str r1, [sp, #0xa4]
_080340CC:
	ldr r2, [sp, #0xa4]
	mov r8, r2
	mov r3, r8
	str r3, [sp, #0x20]
	mov r0, r8
	str r0, [sp, #0x18]
	b _080340F6
	.global _080340DA
_080340DA:
	movs r1, #0
	str r1, [sp, #0x30]
	.global _080340DE
_080340DE:
	ldr r2, [sp, #0xa4]
	ldr r3, [sp, #0x24]
	adds r0, r2, r3
	adds r1, r0, #1
	mov r8, r1
	mov r2, r8
	str r2, [sp, #0x18]
	str r0, [sp, #0x20]
	cmp r1, #0
	bgt _080340F6
	movs r3, #1
	mov r8, r3
_080340F6:
	movs r4, #4
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x44]
	mov r2, r8
	cmp r2, #0x17
	bls _08034116
	movs r1, #0
_08034106:
	adds r1, #1
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, r8
	bls _08034106
	mov r3, sl
	str r1, [r3, #0x44]
_08034116:
	mov r0, sl
	ldr r1, [r0, #0x44]
	bl _Balloc
	mov r1, sl
	str r0, [r1, #0x40]
	str r0, [sp, #0x74]
	mov sb, r0
	ldr r2, [sp, #0x18]
	cmp r2, #0xe
	bls _0803412E
	b _080344A0
_0803412E:
	cmp r5, #0
	bne _08034134
	b _080344A0
_08034134:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r2, [sp, #0x1c]
	movs r7, #2
	cmp r1, #0
	ble _080341C4
	ldr r0, _080341BC
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	ldr r1, [sp, #0x24]
	asrs r4, r1, #4
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08034180
	ands r4, r2
	ldr r0, _080341C0
	ldr r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	movs r7, #3
_08034180:
	cmp r4, #0
	beq _080341A8
	ldr r5, _080341C0
_08034186:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080341A0
	adds r7, #1
	ldr r2, [r5]
	ldr r3, [r5, #4]
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
_080341A0:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _08034186
_080341A8:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	b _08034210
	.byte 0x00, 0x00
_080341BC:
	.4byte gUnk_0884CE0C
_080341C0:
	.4byte gUnk_0884CED4
_080341C4:
	ldr r2, [sp, #0x24]
	rsbs r6, r2, #0
	cmp r6, #0
	beq _08034210
	ldr r1, _080342B8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	asrs r4, r6, #4
	cmp r4, #0
	beq _08034210
	ldr r5, _080342BC
_080341EE:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08034208
	adds r7, #1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_08034208:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080341EE
_08034210:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0803424E
	ldr r2, _080342C0
	ldr r3, _080342C4
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _0803424E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _0803424E
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bgt _08034234
	b _0803448C
_08034234:
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r0, _080342C8
	ldr r1, _080342CC
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	adds r7, #1
_0803424E:
	adds r0, r7, #0
	bl __floatsidf
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	ldr r2, _080342D0
	ldr r3, _080342D4
	bl __adddf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r0, _080342D8
	ldr r3, [sp, #0x50]
	adds r0, r3, r0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _080342E4
	movs r2, #0
	str r2, [sp, #0x64]
	movs r3, #0
	str r3, [sp, #0x68]
	ldr r2, _080342DC
	ldr r3, _080342E0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __gtdf2
	cmp r0, #0
	ble _0803429C
	b _08034816
_0803429C:
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl __negdf2
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080342B6
	b _0803480E
_080342B6:
	b _0803448C
_080342B8:
	.4byte gUnk_0884CE0C
_080342BC:
	.4byte gUnk_0884CED4
_080342C0:
	.4byte 0x3FF00000
_080342C4:
	.4byte 0x00000000
_080342C8:
	.4byte 0x40240000
_080342CC:
	.4byte 0x00000000
_080342D0:
	.4byte 0x401C0000
_080342D4:
	.4byte 0x00000000
_080342D8:
	.4byte 0xFCC00000
_080342DC:
	.4byte 0x40140000
_080342E0:
	.4byte 0x00000000
_080342E4:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080343B4
	ldr r1, _08034314
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, _08034318
	ldr r1, _0803431C
	bl __divdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0
	mov r8, r1
	b _08034340
	.byte 0x00, 0x00
_08034314:
	.4byte gUnk_0884CE0C
_08034318:
	.4byte 0x3FE00000
_0803431C:
	.4byte 0x00000000
_08034320:
	ldr r1, _080343A8
	ldr r0, _080343A4
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r1, _080343A8
	ldr r0, _080343A4
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_08034340:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r2, sb
	strb r0, [r2]
	movs r3, #1
	add sb, r3
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _0803437C
	b _08034A86
_0803437C:
	ldr r0, _080343AC
	ldr r1, _080343B0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __subdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _08034396
	b _080345A0
_08034396:
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	blt _08034320
	b _0803448C
	.byte 0x00, 0x00
_080343A4:
	.4byte 0x40240000
_080343A8:
	.4byte 0x00000000
_080343AC:
	.4byte 0x3FF00000
_080343B0:
	.4byte 0x00000000
_080343B4:
	ldr r1, _080343D4
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r2, #1
	mov r8, r2
	b _080343EC
_080343D4:
	.4byte gUnk_0884CE0C
_080343D8:
	movs r3, #1
	add r8, r3
	ldr r1, _08034480
	ldr r0, _0803447C
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080343EC:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	bne _080343D8
	ldr r6, _08034484
	ldr r7, _08034488
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gtdf2
	cmp r0, #0
	ble _0803443E
	b _080345A0
_0803443E:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _0803448C
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _0803446A
	b _080345C6
_0803446A:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	beq _0803446A
	b _080345C6
	.byte 0x00, 0x00
_0803447C:
	.4byte 0x40240000
_08034480:
	.4byte 0x00000000
_08034484:
	.4byte 0x3FE00000
_08034488:
	.4byte 0x00000000
_0803448C:
	ldr r1, [sp, #0x74]
	mov sb, r1
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_080344A0:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080344A8
	b _080345DC
_080344A8:
	ldr r1, [sp, #0x24]
	cmp r1, #0xe
	ble _080344B0
	b _080345DC
_080344B0:
	ldr r1, _080344FC
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bge _08034508
	ldr r3, [sp, #0x18]
	cmp r3, #0
	bgt _08034508
	movs r0, #0
	str r0, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	cmp r3, #0
	bge _080344DA
	b _0803480E
_080344DA:
	ldr r2, _08034500
	ldr r3, _08034504
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ledf2
	cmp r0, #0
	bgt _080344F8
	b _0803480E
_080344F8:
	b _08034816
	.byte 0x00, 0x00
_080344FC:
	.4byte gUnk_0884CE0C
_08034500:
	.4byte 0x40140000
_08034504:
	.4byte 0x00000000
_08034508:
	movs r2, #1
	mov r8, r2
	b _0803452C
_0803450E:
	ldr r1, _080345D0
	ldr r0, _080345CC
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r2, _080345D4
	ldr r3, _080345D8
	bl __eqdf2
	cmp r0, #0
	bne _08034528
	b _08034A86
_08034528:
	movs r3, #1
	add r8, r3
_0803452C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	bne _0803450E
	adds r1, r3, #0
	adds r0, r2, #0
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __gtdf2
	cmp r0, #0
	bgt _080345A0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __eqdf2
	cmp r0, #0
	beq _08034596
	b _08034A86
_08034596:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _080345A0
	b _08034A86
_080345A0:
	movs r0, #0x30
_080345A2:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x39
	bne _080345BE
	ldr r1, [sp, #0x74]
	cmp sb, r1
	bne _080345A2
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	strb r0, [r1]
_080345BE:
	mov r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080345C6:
	movs r0, #1
	add sb, r0
	b _08034A86
_080345CC:
	.4byte 0x40240000
_080345D0:
	.4byte 0x00000000
_080345D4:
	.4byte 0x00000000
_080345D8:
	.4byte 0x00000000
_080345DC:
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x60]
	movs r2, #0
	str r2, [sp, #0x64]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _08034652
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _08034610
	ldr r2, [sp, #0x58]
	cmp r2, #0
	beq _08034608
	ldr r3, _08034604
	adds r3, r3, r0
	mov r8, r3
	b _0803463C
	.byte 0x00, 0x00
_08034604:
	.4byte 0x00000433
_08034608:
	ldr r1, [sp, #8]
	movs r0, #0x36
	subs r0, r0, r1
	b _0803463A
_08034610:
	ldr r4, [sp, #0x18]
	subs r4, #1
	ldr r0, [sp, #0x14]
	cmp r0, r4
	blt _0803461E
	subs r6, r0, r4
	b _0803462E
_0803461E:
	ldr r1, [sp, #0x14]
	subs r4, r4, r1
	ldr r2, [sp, #0x38]
	adds r2, r2, r4
	str r2, [sp, #0x38]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	movs r6, #0
_0803462E:
	ldr r3, [sp, #0x18]
	mov r8, r3
	cmp r3, #0
	bge _0803463C
	subs r5, r5, r3
	movs r0, #0
_0803463A:
	mov r8, r0
_0803463C:
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
	mov r0, sl
	movs r1, #1
	bl __i2b
	str r0, [sp, #0x64]
_08034652:
	cmp r5, #0
	ble _08034674
	ldr r3, [sp, #0x34]
	cmp r3, #0
	ble _08034674
	mov r8, r3
	cmp r8, r5
	ble _08034664
	mov r8, r5
_08034664:
	ldr r0, [sp, #0x10]
	mov r1, r8
	subs r0, r0, r1
	str r0, [sp, #0x10]
	subs r5, r5, r1
	ldr r2, [sp, #0x34]
	subs r2, r2, r1
	str r2, [sp, #0x34]
_08034674:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _080346C2
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080346B6
	cmp r6, #0
	ble _080346A6
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r6, #0
	bl __pow5mult
	str r0, [sp, #0x64]
	mov r0, sl
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x5c]
	bl __multiply
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	str r4, [sp, #0x5c]
_080346A6:
	ldr r1, [sp, #0x14]
	subs r4, r1, r6
	cmp r4, #0
	beq _080346C2
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r4, #0
	b _080346BC
_080346B6:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	ldr r2, [sp, #0x14]
_080346BC:
	bl __pow5mult
	str r0, [sp, #0x5c]
_080346C2:
	mov r0, sl
	movs r1, #1
	bl __i2b
	str r0, [sp, #0x68]
	ldr r2, [sp, #0x38]
	cmp r2, #0
	ble _080346DC
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl __pow5mult
	str r0, [sp, #0x68]
_080346DC:
	ldr r3, [sp, #0xc]
	cmp r3, #1
	bgt _08034718
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _08034714
	ldr r0, _0803470C
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _08034714
	ldr r0, _08034710
	ands r1, r0
	cmp r1, #0
	beq _08034714
	ldr r1, [sp, #0x10]
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r2, #1
	str r2, [sp, #0x34]
	movs r3, #1
	str r3, [sp, #0x3c]
	b _08034718
_0803470C:
	.4byte 0x000FFFFF
_08034710:
	.4byte 0x7FF00000
_08034714:
	movs r0, #0
	str r0, [sp, #0x3c]
_08034718:
	ldr r1, [sp, #0x38]
	cmp r1, #0
	beq _08034744
	ldr r2, [sp, #0x68]
	ldr r1, [r2, #0x10]
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	bl __hi0bits
	ldr r1, [sp, #0x34]
	adds r1, #0x20
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x1f
	mov r3, r8
	ands r3, r0
	mov r8, r3
	b _08034752
_08034744:
	ldr r0, [sp, #0x34]
	adds r0, #1
	mov r8, r0
	movs r0, #0x1f
	mov r1, r8
	ands r1, r0
	mov r8, r1
_08034752:
	mov r2, r8
	cmp r2, #0
	beq _0803475E
	movs r0, #0x20
	subs r2, r0, r2
	mov r8, r2
_0803475E:
	mov r3, r8
	cmp r3, #4
	ble _0803476A
	movs r0, #4
	rsbs r0, r0, #0
	b _08034772
_0803476A:
	mov r3, r8
	cmp r3, #3
	bgt _08034782
	movs r0, #0x1c
_08034772:
	add r8, r0
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	add r5, r8
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
_08034782:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _08034794
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r3, #0
	bl __lshift
	str r0, [sp, #0x5c]
_08034794:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _080347A6
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x34]
	bl __lshift
	str r0, [sp, #0x68]
_080347A6:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080347E4
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bge _080347E4
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080347E0
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x64]
_080347E0:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x18]
_080347E4:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bgt _08034828
	ldr r2, [sp, #0xc]
	cmp r2, #2
	ble _08034828
	cmp r1, #0
	blt _0803480E
	mov r0, sl
	ldr r1, [sp, #0x68]
	movs r2, #5
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bgt _08034816
_0803480E:
	ldr r3, [sp, #0xa4]
	mvns r3, r3
	str r3, [sp, #0x24]
	b _08034A5E
_08034816:
	movs r0, #0x31
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #1
	str r3, [sp, #0x24]
	b _08034A5E
_08034828:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _08034830
	b _080349A6
_08034830:
	cmp r5, #0
	ble _08034840
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r5, #0
	bl __lshift
	str r0, [sp, #0x64]
_08034840:
	ldr r1, [sp, #0x64]
	str r1, [sp, #0x60]
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	beq _08034872
	ldr r1, [r1, #4]
	mov r0, sl
	bl _Balloc
	str r0, [sp, #0x64]
	adds r0, #0xc
	ldr r1, [sp, #0x60]
	adds r1, #0xc
	ldr r3, [sp, #0x60]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #1
	bl __lshift
	str r0, [sp, #0x64]
_08034872:
	movs r0, #1
	mov r8, r0
	mov r1, r8
	ldr r2, [sp, #0x44]
	ands r2, r1
	str r2, [sp, #0x80]
	b _080348C8
_08034880:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r3, r0
	bne _080348A8
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	b _080348C4
_080348A8:
	mov r0, sl
	ldr r1, [sp, #0x60]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x60]
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x64]
_080348C4:
	movs r1, #1
	add r8, r1
_080348C8:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl quorem
	adds r7, r0, #0
	adds r7, #0x30
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	bl __mcmp
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x64]
	bl __mdiff
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _080348FC
	ldr r0, [sp, #0x5c]
	adds r1, r5, #0
	bl __mcmp
	adds r6, r0, #0
	b _080348FE
_080348FC:
	movs r6, #1
_080348FE:
	mov r0, sl
	adds r1, r5, #0
	bl _Bfree
	cmp r6, #0
	bne _0803492A
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _0803492A
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _0803492A
	cmp r7, #0x39
	beq _0803497C
	cmp r4, #0
	ble _08034920
	adds r7, #1
_08034920:
	mov r0, sb
	strb r7, [r0]
	movs r1, #1
	add sb, r1
	b _08034A5E
_0803492A:
	cmp r4, #0
	blt _0803493E
	cmp r4, #0
	bne _08034974
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _08034974
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _08034974
_0803493E:
	cmp r6, #0
	ble _0803496E
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl __lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r6, r0, #0
	cmp r6, #0
	bgt _08034968
	cmp r6, #0
	bne _0803496E
	adds r0, r7, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803496E
_08034968:
	adds r7, #1
	cmp r7, #0x3a
	beq _0803497C
_0803496E:
	mov r2, sb
	strb r7, [r2]
	b _08034A26
_08034974:
	cmp r6, #0
	ble _08034994
	cmp r7, #0x39
	bne _08034988
_0803497C:
	movs r0, #0x39
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	b _080349FC
_08034988:
	adds r0, r7, #1
	mov r3, sb
	strb r0, [r3]
	movs r0, #1
	add sb, r0
	b _08034A5E
_08034994:
	mov r1, sb
	strb r7, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	beq _080349A4
	b _08034880
_080349A4:
	b _080349D8
_080349A6:
	movs r0, #1
	mov r8, r0
	b _080349BE
_080349AC:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl __multadd
	str r0, [sp, #0x5c]
	movs r1, #1
	add r8, r1
_080349BE:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl quorem
	adds r7, r0, #0
	adds r7, #0x30
	mov r2, sb
	strb r7, [r2]
	movs r3, #1
	add sb, r3
	ldr r0, [sp, #0x18]
	cmp r8, r0
	blt _080349AC
_080349D8:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl __lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bgt _080349FC
	cmp r4, #0
	bne _08034A3E
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _08034A3E
_080349FC:
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	ldrb r2, [r2]
	cmp r2, #0x39
	bne _08034A1E
_08034A0A:
	ldr r3, [sp, #0x74]
	cmp sb, r3
	beq _08034A2C
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x39
	beq _08034A0A
_08034A1E:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_08034A26:
	movs r3, #1
	add sb, r3
	b _08034A5E
_08034A2C:
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x31
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	adds r1, #1
	mov sb, r1
	b _08034A5E
_08034A3E:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _08034A5A
_08034A4C:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _08034A4C
_08034A5A:
	movs r2, #1
	add sb, r2
_08034A5E:
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _Bfree
	ldr r3, [sp, #0x64]
	cmp r3, #0
	beq _08034A86
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _08034A7E
	cmp r0, r3
	beq _08034A7E
	mov r0, sl
	ldr r1, [sp, #0x60]
	bl _Bfree
_08034A7E:
	mov r0, sl
	ldr r1, [sp, #0x64]
	bl _Bfree
_08034A86:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp, #0xa8]
	str r0, [r2]
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _08034AA4
	str r1, [r3]
_08034AA4:
	ldr r0, [sp, #0x74]

	.global _dtoa_r_return
	.thumb_func
	.type _dtoa_r_return, %function
_dtoa_r_return: @ 08034AA6
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global fflush
	.thumb_func
	.type fflush, %function
fflush: @ 08034AB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08034AD4
	ldr r0, _08034ACC
	ldr r0, [r0]
	ldr r1, _08034AD0
	bl _fwalk
	b _08034B4A
_08034ACC:
	.4byte gUnk_08BB5284
_08034AD0:
	.4byte fflush
_08034AD4:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _08034AE0
	ldr r0, _08034B14
	ldr r0, [r0]
	str r0, [r4, #0x54]
_08034AE0:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _08034AEE
	adds r0, r1, #0
	bl __sinit
_08034AEE:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08034B48
	ldr r6, [r4, #0x10]
	cmp r6, #0
	beq _08034B48
	ldr r0, [r4]
	subs r5, r0, r6
	str r6, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08034B26
	ldr r0, [r4, #0x14]
	b _08034B28
	.byte 0x00, 0x00
_08034B14:
	.4byte gUnk_08BB5284
_08034B18:
	movs r0, #0x40
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	b _08034B4A
_08034B26:
	movs r0, #0
_08034B28:
	str r0, [r4, #8]
	cmp r5, #0
	ble _08034B48
_08034B2E:
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0x24]
	adds r1, r6, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	ble _08034B18
	adds r6, r6, r1
	subs r5, r5, r1
	cmp r5, #0
	bgt _08034B2E
_08034B48:
	movs r0, #0
_08034B4A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	.global std
	.thumb_func
	.type std, %function
std: @ 08034B50
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _08034B7C
	str r1, [r0, #0x20]
	ldr r1, _08034B80
	str r1, [r0, #0x24]
	ldr r1, _08034B84
	str r1, [r0, #0x28]
	ldr r1, _08034B88
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
_08034B7C:
	.4byte __sread
_08034B80:
	.4byte __swrite
_08034B84:
	.4byte __sseek
_08034B88:
	.4byte __sclose

	.global __sfmoreglue
	.thumb_func
	.type __sfmoreglue, %function
__sfmoreglue: @ 08034B8C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x58
	adds r6, r5, #0
	muls r6, r1, r6
	adds r1, r6, #0
	adds r1, #0xc
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	beq _08034BB8
	adds r0, #0xc
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	str r0, [r4, #8]
	adds r2, r6, #0
	bl memset
	adds r0, r4, #0
	b _08034BBA
_08034BB8:
	movs r0, #0
_08034BBA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	.global __sfp
	.thumb_func
	.type __sfp, %function
__sfp: @ 08034BC0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	cmp r0, #0
	bne _08034BD0
	adds r0, r5, #0
	bl __sinit
_08034BD0:
	movs r0, #0xec
	lsls r0, r0, #1
	adds r4, r5, r0
	b _08034BDA
_08034BD8:
	ldr r4, [r4]
_08034BDA:
	ldr r2, [r4, #8]
	ldr r0, [r4, #4]
	b _08034BEA
_08034BE0:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r1, #0
	beq _08034C0C
	adds r2, #0x58
_08034BEA:
	subs r0, #1
	cmp r0, #0
	bge _08034BE0
	ldr r0, [r4]
	cmp r0, #0
	bne _08034BD8
	adds r0, r5, #0
	movs r1, #4
	bl __sfmoreglue
	str r0, [r4]
	cmp r0, #0
	bne _08034BD8
	movs r0, #0xc
	str r0, [r5]
	movs r0, #0
	b _08034C2C
_08034C0C:
	movs r0, #1
	strh r0, [r2, #0xc]
	str r1, [r2]
	str r1, [r2, #8]
	str r1, [r2, #4]
	str r1, [r2, #0x10]
	str r1, [r2, #0x14]
	str r1, [r2, #0x18]
	ldr r0, _08034C34
	strh r0, [r2, #0xe]
	str r1, [r2, #0x30]
	str r1, [r2, #0x34]
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	str r5, [r2, #0x54]
	adds r0, r2, #0
_08034C2C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08034C34:
	.4byte 0x0000FFFF

	.global _cleanup_r
	.thumb_func
	.type _cleanup_r, %function
_cleanup_r: @ 08034C38
	push {lr}
	ldr r1, _08034C44
	bl _fwalk
	pop {r0}
	bx r0
_08034C44:
	.4byte fflush

	.global _cleanup
	.thumb_func
	.type _cleanup, %function
_cleanup: @ 08034C48
	push {lr}
	ldr r0, _08034C58
	ldr r0, [r0]
	bl _cleanup_r
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08034C58:
	.4byte gUnk_08BB5284

	.global __sinit
	.thumb_func
	.type __sinit, %function
__sinit: @ 08034C5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08034CBC
	str r0, [r5, #0x3c]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xf2
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	adds r3, r5, #0
	bl std
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #9
	movs r2, #1
	adds r3, r5, #0
	bl std
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0xa
	movs r2, #2
	adds r3, r5, #0
	bl std
	movs r0, #0xec
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0xee
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #3
	str r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
_08034CBC:
	.4byte _cleanup_r

	.global _free_r
	.thumb_func
	.type _free_r, %function
_free_r: @ 08034CC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _08034CD2
	b _08034E76
_08034CD2:
	bl __malloc_lock
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _08034D34
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _08034D40
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _08034D0E
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_08034D0E:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _08034D38
	ldr r0, [r0]
	cmp r6, r0
	blo _08034D2A
	ldr r0, _08034D3C
	ldr r1, [r0]
	mov r0, sb
	bl _malloc_trim_r
_08034D2A:
	mov r0, sb
	bl __malloc_unlock
	b _08034E76
	.byte 0x00, 0x00
_08034D34:
	.4byte gUnk_08BB529C
_08034D38:
	.4byte gUnk_08BB56A4
_08034D3C:
	.4byte gUnk_08BB56A8
_08034D40:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08034D6C
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _08034D64
	movs r2, #1
	mov r8, r2
	b _08034D6C
_08034D64:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_08034D6C:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08034DA4
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _08034D9C
	ldr r0, _08034D98
	cmp r1, r0
	bne _08034D9C
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _08034DA4
	.byte 0x00, 0x00
_08034D98:
	.4byte gUnk_08BB52A4
_08034D9C:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_08034DA4:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _08034E70
	ldr r0, _08034DD4
	cmp r6, r0
	bhi _08034DDC
	lsrs r4, r6, #3
	ldr r2, _08034DD8
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _08034E68
_08034DD4:
	.4byte 0x000001FF
_08034DD8:
	.4byte gUnk_08BB529C
_08034DDC:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _08034DE6
	lsrs r4, r6, #3
	b _08034E2E
_08034DE6:
	cmp r1, #4
	bhi _08034DF2
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _08034E2E
_08034DF2:
	cmp r1, #0x14
	bhi _08034DFC
	adds r4, r1, #0
	adds r4, #0x5b
	b _08034E2E
_08034DFC:
	cmp r1, #0x54
	bhi _08034E08
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _08034E2E
_08034E08:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08034E18
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _08034E2E
_08034E18:
	ldr r0, _08034E28
	cmp r1, r0
	bhi _08034E2C
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _08034E2E
	.byte 0x00, 0x00
_08034E28:
	.4byte 0x00000554
_08034E2C:
	movs r4, #0x7e
_08034E2E:
	lsls r0, r4, #3
	ldr r7, _08034E4C
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _08034E50
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _08034E68
	.byte 0x00, 0x00
_08034E4C:
	.4byte gUnk_08BB529C
_08034E50:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _08034E60
_08034E58:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _08034E66
	ldr r0, [r2, #4]
_08034E60:
	ands r0, r1
	cmp r6, r0
	blo _08034E58
_08034E66:
	ldr r3, [r2, #0xc]
_08034E68:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_08034E70:
	mov r0, sb
	bl __malloc_unlock
_08034E76:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global _malloc_trim_r
	.thumb_func
	.type _malloc_trim_r, %function
_malloc_trim_r: @ 08034E84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl __malloc_lock
	ldr r0, _08034F0C
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _08034F10
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl ram_divide_veneer
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _08034F02
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _08034F02
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl _sbrk_r
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08034F1C
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _08034F02
	ldr r1, _08034F14
	ldr r0, _08034F18
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_08034F02:
	adds r0, r7, #0
	bl __malloc_unlock
	movs r0, #0
	b _08034F38
_08034F0C:
	.4byte gUnk_08BB529C
_08034F10:
	.4byte 0x00000FEF
_08034F14:
	.4byte gUnk_08BB56B8
_08034F18:
	.4byte gUnk_08BB56AC
_08034F1C:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _08034F44
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl __malloc_unlock
	movs r0, #1
_08034F38:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08034F44:
	.4byte gUnk_08BB56B8

	.global __sfvwrite
	.thumb_func
	.type __sfvwrite, %function
__sfvwrite: @ 08034F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sl, r1
	ldr r6, [r1, #8]
	cmp r6, #0
	bne _08034F60
	b _08035156
_08034F60:
	movs r0, #8
	ldrh r1, [r5, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08034F70
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _08034F7C
_08034F70:
	adds r0, r5, #0
	bl __swsetup
	cmp r0, #0
	beq _08034F7C
	b _08035162
_08034F7C:
	mov r2, sl
	ldr r2, [r2]
	mov r8, r2
	movs r6, #0
	ldrh r1, [r5, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08034FD0
_08034F8E:
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	cmp r6, #0
	bne _08034FA4
_08034F96:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _08034F96
_08034FA4:
	adds r2, r6, #0
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r6, r1
	bls _08034FB0
	adds r2, r1, #0
_08034FB0:
	adds r1, r7, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	bgt _08034FBE
	b _0803515A
_08034FBE:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _08034F8E
	b _08035156
_08034FD0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0803508A
_08034FD8:
	ldrh r1, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r3, [r5]
	cmp r6, #0
	bne _08034FF0
_08034FE2:
	mov r2, r8
	ldr r7, [r2]
	ldr r6, [r2, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _08034FE2
_08034FF0:
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803501E
	cmp r6, r4
	bhs _08035004
	adds r4, r6, #0
_08035004:
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r4, r6, #0
	b _08035078
_0803501E:
	ldr r0, [r5, #0x10]
	cmp r3, r0
	bls _08035046
	cmp r6, r4
	bls _08035046
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl fflush
	cmp r0, #0
	beq _08035044
	b _0803515A
_08035044:
	b _08035078
_08035046:
	ldr r4, [r5, #0x14]
	cmp r6, r4
	blo _08035060
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	ble _0803515A
	b _08035078
_08035060:
	adds r4, r6, #0
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_08035078:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _08034FD8
	b _08035156
_0803508A:
	movs r2, #0
	str r2, [sp]
_0803508E:
	cmp r6, #0
	bne _080350A4
	movs r0, #0
	str r0, [sp]
_08035096:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _08035096
_080350A4:
	ldr r0, [sp]
	cmp r0, #0
	bne _080350C8
	adds r0, r7, #0
	movs r1, #0xa
	adds r2, r6, #0
	bl memchr
	adds r1, r0, #0
	cmp r1, #0
	beq _080350C0
	subs r0, r7, #1
	subs r1, r1, r0
	b _080350C2
_080350C0:
	adds r1, r6, #1
_080350C2:
	mov sb, r1
	movs r2, #1
	str r2, [sp]
_080350C8:
	mov r2, sb
	cmp sb, r6
	bls _080350D0
	adds r2, r6, #0
_080350D0:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x14]
	adds r4, r0, r1
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	cmp r3, r0
	bls _080350FE
	cmp r2, r4
	ble _080350FE
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl memmove
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl fflush
	cmp r0, #0
	bne _0803515A
	b _0803512E
_080350FE:
	adds r4, r1, #0
	cmp r2, r4
	blt _08035118
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	ble _0803515A
	b _0803512E
_08035118:
	adds r4, r2, #0
	adds r0, r3, #0
	adds r1, r7, #0
	bl memmove
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_0803512E:
	mov r0, sb
	subs r0, r0, r4
	mov sb, r0
	cmp r0, #0
	bne _08035146
	adds r0, r5, #0
	bl fflush
	cmp r0, #0
	bne _0803515A
	movs r1, #0
	str r1, [sp]
_08035146:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r2, sl
	ldr r0, [r2, #8]
	subs r0, r0, r4
	str r0, [r2, #8]
	cmp r0, #0
	bne _0803508E
_08035156:
	movs r0, #0
	b _08035166
_0803515A:
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_08035162:
	movs r0, #1
	rsbs r0, r0, #0
_08035166:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _fwalk
	.thumb_func
	.type _fwalk, %function
_fwalk: @ 08035178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r7, #0
	movs r1, #0xec
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, #0
	beq _080351B0
_0803518C:
	ldr r5, [r6, #8]
	ldr r4, [r6, #4]
	b _080351A4
_08035192:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080351A2
	adds r0, r5, #0
	bl _call_via_r8
	orrs r7, r0
_080351A2:
	adds r5, #0x58
_080351A4:
	subs r4, #1
	cmp r4, #0
	bge _08035192
	ldr r6, [r6]
	cmp r6, #0
	bne _0803518C
_080351B0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global _setlocale_r
	.thumb_func
	.type _setlocale_r, %function
_setlocale_r: @ 080351BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r4, #0
	beq _080351F0
	ldr r1, _080351E4
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080351EC
	ldr r1, _080351E8
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080351EC
	movs r0, #0
	b _080351F2
_080351E4:
	.4byte gUnk_0884CDFC
_080351E8:
	.4byte gUnk_0884CDF4
_080351EC:
	str r6, [r5, #0x30]
	str r4, [r5, #0x34]
_080351F0:
	ldr r0, _080351F8
_080351F2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_080351F8:
	.4byte gUnk_0884CDFC

	.global _localeconv_r
	.thumb_func
	.type _localeconv_r, %function
_localeconv_r: @ 080351FC
	ldr r0, _08035200
	bx lr
_08035200:
	.4byte gUnk_0884CDC4

	.global setlocale
	.thumb_func
	.type setlocale, %function
setlocale: @ 08035204
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08035218
	ldr r0, [r0]
	adds r1, r3, #0
	bl _setlocale_r
	pop {r1}
	bx r1
_08035218:
	.4byte gUnk_08BB5284

	.global localeconv
	.thumb_func
	.type localeconv, %function
localeconv: @ 0803521C
	push {lr}
	ldr r0, _0803522C
	ldr r0, [r0]
	bl _localeconv_r
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0803522C:
	.4byte gUnk_08BB5284

	.global __smakebuf
	.thumb_func
	.type __smakebuf, %function
__smakebuf: @ 08035230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080352C6
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _08035258
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	mov r2, sp
	bl _fstat_r
	cmp r0, #0
	bge _0803526A
_08035258:
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #3
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	b _080352AE
_0803526A:
	movs r7, #0
	ldr r1, [sp, #4]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	bne _0803527E
	movs r7, #1
_0803527E:
	movs r6, #0x80
	lsls r6, r6, #3
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080352A4
	ldr r1, [r4, #0x28]
	ldr r0, _080352A0
	cmp r1, r0
	bne _080352A4
	adds r0, r6, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r6, [r4, #0x4c]
	b _080352B0
	.byte 0x00, 0x00
_080352A0:
	.4byte __sseek
_080352A4:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
_080352AE:
	strh r0, [r4, #0xc]
_080352B0:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	bl _malloc_r
	adds r2, r0, #0
	cmp r2, #0
	bne _080352D4
	movs r0, #2
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
_080352C6:
	adds r0, r4, #0
	adds r0, #0x43
	str r0, [r4]
	str r0, [r4, #0x10]
	movs r0, #1
	str r0, [r4, #0x14]
	b _08035302
_080352D4:
	ldr r1, [r4, #0x54]
	ldr r0, _0803530C
	str r0, [r1, #0x3c]
	movs r0, #0x80
	movs r5, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r2, [r4]
	str r2, [r4, #0x10]
	str r6, [r4, #0x14]
	cmp r7, #0
	beq _08035302
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	bl isatty
	cmp r0, #0
	beq _08035302
	movs r0, #1
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_08035302:
	add sp, #0x3c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0803530C:
	.4byte _cleanup_r

	.global malloc_extend_top
	.thumb_func
	.type malloc_extend_top, %function
malloc_extend_top: @ 08035310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _08035384
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _08035388
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _0803538C
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _08035352
	ldr r3, _08035390
	adds r6, r1, r3
	ldr r0, _08035394
	ands r6, r0
_08035352:
	ldr r0, [sp]
	adds r1, r6, #0
	bl _sbrk_r
	adds r5, r0, #0
	cmp r5, sb
	beq _08035454
	cmp r5, r4
	bhs _0803536A
	ldr r0, _08035384
	cmp r8, r0
	bne _08035454
_0803536A:
	ldr r1, _08035398
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _0803539C
	adds r2, r6, r7
	ldr r3, _08035384
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _0803543C
_08035384:
	.4byte gUnk_08BB529C
_08035388:
	.4byte gUnk_08BB56A8
_0803538C:
	.4byte gUnk_08BB56AC
_08035390:
	.4byte 0x0000100F
_08035394:
	.4byte 0xFFFFF000
_08035398:
	.4byte gUnk_08BB56B8
_0803539C:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _080353A8
	str r5, [r3]
	b _080353AE
_080353A8:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_080353AE:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _080353C2
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _080353C4
_080353C2:
	movs r4, #0
_080353C4:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl _sbrk_r
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08035454
	ldr r1, _0803540C
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _08035410
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _0803543C
	cmp r7, #0xf
	bhi _08035414
	str r3, [r5, #4]
	b _08035454
	.byte 0x00, 0x00
_0803540C:
	.4byte gUnk_08BB56B8
_08035410:
	.4byte gUnk_08BB529C
_08035414:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _0803543C
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl _free_r
_0803543C:
	ldr r0, _08035464
	ldr r2, _08035468
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _0803544A
	str r1, [r2]
_0803544A:
	ldr r2, _0803546C
	ldr r0, [r2]
	cmp r1, r0
	bls _08035454
	str r1, [r2]
_08035454:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08035464:
	.4byte gUnk_08BB56B8
_08035468:
	.4byte gUnk_08BB56B0
_0803546C:
	.4byte gUnk_08BB56B4

	.global _malloc_r
	.thumb_func
	.type _malloc_r, %function
_malloc_r: @ 08035470
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _08035492
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _08035496
_08035492:
	movs r3, #0x10
	mov r8, r3
_08035496:
	ldr r0, [sp]
	bl __malloc_lock
	ldr r0, _080354DC
	cmp r8, r0
	bhi _080354EA
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _080354E0
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _080354BE
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _080354E4
_080354BE:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _08035816
	.byte 0x00, 0x00
_080354DC:
	.4byte 0x000001F7
_080354E0:
	.4byte gUnk_08BB529C
_080354E4:
	movs r0, #2
	add ip, r0
	b _08035596
_080354EA:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _080354F6
	lsrs r2, r2, #3
	b _08035546
_080354F6:
	cmp r1, #4
	bhi _08035504
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _08035548
_08035504:
	cmp r1, #0x14
	bhi _0803550E
	adds r1, #0x5b
	mov ip, r1
	b _08035548
_0803550E:
	cmp r1, #0x54
	bhi _0803551C
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _08035548
_0803551C:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0803552E
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _08035548
_0803552E:
	ldr r0, _08035540
	cmp r1, r0
	bhi _08035544
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _08035548
	.byte 0x00, 0x00
_08035540:
	.4byte 0x00000554
_08035544:
	movs r2, #0x7e
_08035546:
	mov ip, r2
_08035548:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _0803556C
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _08035592
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _08035570
	adds r0, #3
	add ip, r0
	b _08035592
_0803556C:
	.4byte gUnk_08BB529C
_08035570:
	cmp r3, #0
	blt _08035576
	b _080357B0
_08035576:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _08035592
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _08035570
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_08035592:
	movs r4, #1
	add ip, r4
_08035596:
	ldr r0, _080355D4
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _080355A2
	b _080356A4
_080355A2:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080355D8
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _08035816
	.byte 0x00, 0x00
_080355D4:
	.4byte gUnk_08BB52A4
_080355D8:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _080355EE
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _08035816
_080355EE:
	ldr r0, _08035610
	cmp r1, r0
	bhi _08035614
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _0803569C
_08035610:
	.4byte 0x000001FF
_08035614:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _0803561E
	lsrs r2, r1, #3
	b _08035662
_0803561E:
	cmp r2, #4
	bhi _0803562A
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _08035662
_0803562A:
	cmp r2, #0x14
	bhi _08035632
	adds r2, #0x5b
	b _08035662
_08035632:
	cmp r2, #0x54
	bhi _0803563E
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _08035662
_0803563E:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _0803564E
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _08035662
_0803564E:
	ldr r0, _0803565C
	cmp r2, r0
	bhi _08035660
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _08035662
_0803565C:
	.4byte 0x00000554
_08035660:
	movs r2, #0x7e
_08035662:
	lsls r0, r2, #3
	ldr r3, _08035680
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _08035684
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _08035680
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _0803569C
_08035680:
	.4byte gUnk_08BB529C
_08035684:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _08035694
_0803568C:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _0803569A
	ldr r0, [r4, #4]
_08035694:
	ands r0, r2
	cmp r1, r0
	blo _0803568C
_0803569A:
	ldr r6, [r4, #0xc]
_0803569C:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_080356A4:
	mov r0, ip
	cmp r0, #0
	bge _080356AC
	adds r0, #3
_080356AC:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _080356D0
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _0803576E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080356E2
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _080356D8
_080356D0:
	.4byte gUnk_08BB529C
_080356D4:
	movs r3, #4
	add ip, r3
_080356D8:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080356D4
_080356E2:
	ldr r4, _08035760
	mov sb, r4
_080356E6:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_080356F4:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _08035714
	movs r0, #4
	rsbs r0, r0, #0
_080356FE:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _080357C4
	cmp r3, #0
	bge _080357EC
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _080356FE
_08035714:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080356F4
_08035724:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _08035764
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _08035724
_0803573A:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _0803576E
	cmp r6, #0
	beq _0803576E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080356E6
_08035750:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08035750
	b _080356E6
_08035760:
	.4byte gUnk_08BB529C
_08035764:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _0803573A
_0803576E:
	ldr r2, _080357AC
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _08035786
	cmp r3, #0xf
	bgt _08035800
_08035786:
	ldr r0, [sp]
	mov r1, r8
	bl malloc_extend_top
	ldr r1, _080357AC
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _080357A2
	cmp r3, #0xf
	bgt _08035800
_080357A2:
	ldr r0, [sp]
	bl __malloc_unlock
	movs r0, #0
	b _08035820
_080357AC:
	.4byte gUnk_08BB529C
_080357B0:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _08035816
_080357C4:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _08035816
_080357EC:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _08035816
_08035800:
	ldr r2, _08035830
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_08035816:
	ldr r0, [sp]
	bl __malloc_unlock
	adds r0, r5, #0
	adds r0, #8
_08035820:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08035830:
	.4byte gUnk_08BB529C

	.global _mbtowc_r
	.thumb_func
	.type _mbtowc_r, %function
_mbtowc_r: @ 08035834
	sub sp, #4
	cmp r1, #0
	bne _0803583C
	mov r1, sp
_0803583C:
	cmp r2, #0
	beq _08035858
	cmp r3, #0
	bne _0803584A
	movs r0, #1
	rsbs r0, r0, #0
	b _0803585A
_0803584A:
	ldrb r0, [r2]
	str r0, [r1]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08035858
	movs r0, #1
	b _0803585A
_08035858:
	movs r0, #0
_0803585A:
	add sp, #4
	bx lr
	.byte 0x00, 0x00

	.global memchr
	.thumb_func
	.type memchr, %function
memchr: @ 08035860
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r1, r0, #0
	movs r0, #0xff
	ands r5, r0
	cmp r2, #3
	bls _080358D4
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080358D4
	adds r4, r1, #0
	movs r6, #0
	movs r1, #0
_0803587C:
	lsls r0, r6, #8
	adds r6, r0, r5
	adds r1, #1
	cmp r1, #3
	bls _0803587C
	cmp r2, #3
	bls _080358BA
	ldr r0, _080358C0
	mov ip, r0
	ldr r7, _080358C4
_08035890:
	ldr r1, [r4]
	eors r1, r6
	mov r3, ip
	adds r0, r1, r3
	bics r0, r1
	ands r0, r7
	cmp r0, #0
	beq _080358B2
	adds r1, r4, #0
	movs r3, #0
_080358A4:
	ldrb r0, [r1]
	cmp r0, r5
	beq _080358CE
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	bls _080358A4
_080358B2:
	subs r2, #4
	adds r4, #4
	cmp r2, #3
	bhi _08035890
_080358BA:
	adds r1, r4, #0
	b _080358D4
	.byte 0x00, 0x00
_080358C0:
	.4byte 0xFEFEFEFF
_080358C4:
	.4byte 0x80808080
_080358C8:
	ldrb r0, [r1]
	cmp r0, r5
	bne _080358D2
_080358CE:
	adds r0, r1, #0
	b _080358DE
_080358D2:
	adds r1, #1
_080358D4:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080358C8
	movs r0, #0
_080358DE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global memcpy
	.thumb_func
	.type memcpy, %function
memcpy: @ 080358E4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _08035924
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08035924
	adds r1, r5, #0
_080358FE:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080358FE
	cmp r2, #3
	bls _08035922
_08035918:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _08035918
_08035922:
	adds r4, r1, #0
_08035924:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0803593E
	adds r1, r0, #0
_08035930:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _08035930
_0803593E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global memmove
	.thumb_func
	.type memmove, %function
memmove: @ 08035948
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r3, r5
	bhs _0803597A
	adds r0, r3, r2
	cmp r5, r0
	bhs _0803597A
	adds r3, r0, #0
	adds r4, r5, r2
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080359CC
	adds r1, r0, #0
_0803596A:
	subs r4, #1
	subs r3, #1
	ldrb r0, [r3]
	strb r0, [r4]
	subs r2, #1
	cmp r2, r1
	bne _0803596A
	b _080359CC
_0803597A:
	cmp r2, #0xf
	bls _080359B2
	adds r0, r3, #0
	orrs r0, r4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080359B2
	adds r1, r3, #0
_0803598C:
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _0803598C
	cmp r2, #3
	bls _080359B0
_080359A6:
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080359A6
_080359B0:
	adds r3, r1, #0
_080359B2:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080359CC
	adds r1, r0, #0
_080359BE:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080359BE
_080359CC:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	.global memset
	.thumb_func
	.type memset, %function
memset: @ 080359D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _08035A1A
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _08035A1A
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _08035A0E
_080359FA:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080359FA
	b _08035A0E
_08035A0A:
	stm r1!, {r3}
	subs r2, #4
_08035A0E:
	cmp r2, #3
	bhi _08035A0A
	adds r3, r1, #0
	b _08035A1A
_08035A16:
	strb r4, [r3]
	adds r3, #1
_08035A1A:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _08035A16
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __malloc_lock
	.thumb_func
	.type __malloc_lock, %function
__malloc_lock: @ 08035A2C
	bx lr
	.byte 0x00, 0x00

	.global __malloc_unlock
	.thumb_func
	.type __malloc_unlock, %function
__malloc_unlock: @ 08035A30
	bx lr
	.byte 0x00, 0x00

	.global _Balloc
	.thumb_func
	.type _Balloc, %function
_Balloc: @ 08035A34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _08035A50
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl _calloc_r
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _08035A78
_08035A50:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _08035A62
	ldr r0, [r1]
	str r0, [r2]
	b _08035A80
_08035A62:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl _calloc_r
	adds r1, r0, #0
	cmp r1, #0
	bne _08035A7C
_08035A78:
	movs r0, #0
	b _08035A88
_08035A7C:
	str r6, [r1, #4]
	str r5, [r1, #8]
_08035A80:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_08035A88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _Bfree
	.thumb_func
	.type _Bfree, %function
_Bfree: @ 08035A90
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _08035AA6
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r2, [r0]
_08035AA6:
	bx lr

	.global __multadd
	.thumb_func
	.type __multadd, %function
__multadd: @ 08035AA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r6, [r5, #0x10]
	adds r3, r5, #0
	adds r3, #0x14
	movs r7, #0
	ldr r0, _08035B40
	mov ip, r0
_08035AC4:
	ldr r1, [r3]
	adds r0, r1, #0
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	add r2, r8
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r4, r0
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	mov r8, r1
	lsls r0, r0, #0x10
	mov r1, ip
	ands r2, r1
	adds r0, r0, r2
	stm r3!, {r0}
	adds r7, #1
	cmp r7, r6
	blt _08035AC4
	mov r2, r8
	cmp r2, #0
	beq _08035B32
	ldr r0, [r5, #8]
	cmp r6, r0
	blt _08035B22
	ldr r1, [r5, #4]
	adds r1, #1
	mov r0, sb
	bl _Balloc
	adds r4, r0, #0
	adds r0, #0xc
	adds r1, r5, #0
	adds r1, #0xc
	ldr r2, [r5, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sb
	adds r1, r5, #0
	bl _Bfree
	adds r5, r4, #0
_08035B22:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	adds r6, #1
	str r6, [r5, #0x10]
_08035B32:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08035B40:
	.4byte 0x0000FFFF

	.global __s2b
	.thumb_func
	.type __s2b, %function
__s2b: @ 08035B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	mov r0, r8
	adds r0, #8
	movs r1, #9
	bl __divsi3
	movs r1, #0
	movs r2, #1
	cmp r0, #1
	ble _08035B6C
_08035B64:
	lsls r2, r2, #1
	adds r1, #1
	cmp r0, r2
	bgt _08035B64
_08035B6C:
	adds r0, r7, #0
	bl _Balloc
	adds r1, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x14]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r5, #9
	cmp r6, #9
	ble _08035B9E
	adds r4, #9
_08035B84:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl __multadd
	adds r1, r0, #0
	adds r5, #1
	cmp r5, r6
	blt _08035B84
	adds r4, #1
	b _08035BA0
_08035B9E:
	adds r4, #0xa
_08035BA0:
	cmp r5, r8
	bge _08035BBE
	mov r0, r8
	subs r5, r0, r5
_08035BA8:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl __multadd
	adds r1, r0, #0
	subs r5, #1
	cmp r5, #0
	bne _08035BA8
_08035BBE:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __hi0bits
	.thumb_func
	.type __hi0bits, %function
__hi0bits: @ 08035BCC
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _08035C1C
	ands r0, r1
	cmp r0, #0
	bne _08035BDC
	movs r2, #0x10
	lsls r1, r1, #0x10
_08035BDC:
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08035BEA
	adds r2, #8
	lsls r1, r1, #8
_08035BEA:
	movs r0, #0xf0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08035BF8
	adds r2, #4
	lsls r1, r1, #4
_08035BF8:
	movs r0, #0xc0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08035C06
	adds r2, #2
	lsls r1, r1, #2
_08035C06:
	cmp r1, #0
	blt _08035C20
	adds r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _08035C20
	movs r0, #0x20
	b _08035C22
	.byte 0x00, 0x00
_08035C1C:
	.4byte 0xFFFF0000
_08035C20:
	adds r0, r2, #0
_08035C22:
	bx lr

	.global __lo0bits
	.thumb_func
	.type __lo0bits, %function
__lo0bits: @ 08035C24
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _08035C54
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08035C3C
	movs r0, #0
	b _08035CA4
_08035C3C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08035C4C
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _08035CA4
_08035C4C:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _08035CA4
_08035C54:
	movs r2, #0
	ldr r0, _08035C9C
	ands r0, r1
	cmp r0, #0
	bne _08035C62
	movs r2, #0x10
	lsrs r1, r1, #0x10
_08035C62:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _08035C6E
	adds r2, #8
	lsrs r1, r1, #8
_08035C6E:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08035C7A
	adds r2, #4
	lsrs r1, r1, #4
_08035C7A:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08035C86
	adds r2, #2
	lsrs r1, r1, #2
_08035C86:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08035CA0
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _08035CA0
	movs r0, #0x20
	b _08035CA4
	.byte 0x00, 0x00
_08035C9C:
	.4byte 0x0000FFFF
_08035CA0:
	str r1, [r3]
	adds r0, r2, #0
_08035CA4:
	bx lr
	.byte 0x00, 0x00

	.global __i2b
	.thumb_func
	.type __i2b, %function
__i2b: @ 08035CA8
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __multiply
	.thumb_func
	.type __multiply, %function
__multiply: @ 08035CC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _08035CE0
	str r4, [sp]
	adds r4, r5, #0
	ldr r5, [sp]
_08035CE0:
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x10]
	ldr r0, [r5, #0x10]
	mov r8, r0
	mov r2, r8
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r0, [r4, #8]
	cmp r2, r0
	ble _08035CF6
	adds r1, #1
_08035CF6:
	adds r0, r3, #0
	bl _Balloc
	str r0, [sp]
	adds r7, r0, #0
	adds r7, #0x14
	ldr r1, [sp, #4]
	lsls r0, r1, #2
	adds r2, r7, r0
	str r2, [sp, #8]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x14
	lsls r3, r6, #2
	adds r2, r5, #0
	adds r2, #0x14
	mov r5, r8
	lsls r4, r5, #2
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _08035D2A
	movs r0, #0
_08035D22:
	stm r7!, {r0}
	ldr r5, [sp, #8]
	cmp r7, r5
	blo _08035D22
_08035D2A:
	str r1, [sp, #8]
	adds r3, r1, r3
	str r3, [sp, #0xc]
	mov r8, r2
	add r4, r8
	str r4, [sp, #0x10]
	ldr r0, [sp]
	adds r0, #0x14
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0x20]
	cmp r8, r4
	bhs _08035DF2
_08035D44:
	mov r2, r8
	ldm r2!, {r6}
	str r2, [sp, #0x14]
	ldr r0, _08035E00
	ands r6, r0
	mov r4, sb
	adds r4, #4
	str r4, [sp, #0x1c]
	cmp r6, #0
	beq _08035D9C
	ldr r7, [sp, #8]
	mov r5, sb
	movs r1, #0
	mov ip, r1
	mov sl, r0
_08035D62:
	ldm r7!, {r3}
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r2, [r5]
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	adds r1, r1, r0
	mov r0, ip
	adds r4, r1, r0
	lsrs r1, r4, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r2, r2, #0x10
	adds r0, r0, r2
	adds r2, r0, r1
	lsrs r0, r2, #0x10
	mov ip, r0
	strh r2, [r5]
	strh r4, [r5, #2]
	adds r5, #4
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _08035D62
	str r0, [r5]
_08035D9C:
	mov r2, r8
	ldrh r6, [r2, #2]
	cmp r6, #0
	beq _08035DE4
	ldr r7, [sp, #8]
	mov r5, sb
	movs r4, #0
	mov ip, r4
	ldr r2, [r5]
	ldr r3, _08035E00
_08035DB0:
	ldm r7!, {r1}
	adds r0, r1, #0
	ands r0, r3
	muls r0, r6, r0
	ldrh r4, [r5, #2]
	adds r4, r4, r0
	mov r8, r4
	add r4, ip
	lsrs r0, r4, #0x10
	mov ip, r0
	strh r4, [r5]
	strh r2, [r5, #2]
	adds r5, #4
	lsrs r1, r1, #0x10
	muls r1, r6, r1
	ldr r0, [r5]
	ands r0, r3
	adds r1, r1, r0
	mov r4, ip
	adds r2, r1, r4
	lsrs r0, r2, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _08035DB0
	str r2, [r5]
_08035DE4:
	ldr r2, [sp, #0x14]
	mov r8, r2
	ldr r4, [sp, #0x1c]
	mov sb, r4
	ldr r5, [sp, #0x10]
	cmp r8, r5
	blo _08035D44
_08035DF2:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #0
	ble _08035E16
	b _08035E0E
_08035E00:
	.4byte 0x0000FFFF
_08035E04:
	ldr r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #4]
	cmp r4, #0
	ble _08035E16
_08035E0E:
	subs r5, #4
	ldr r0, [r5]
	cmp r0, #0
	beq _08035E04
_08035E16:
	ldr r5, [sp, #4]
	ldr r0, [sp]
	str r5, [r0, #0x10]
	ldr r0, [sp]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __pow5mult
	.thumb_func
	.type __pow5mult, %function
__pow5mult: @ 08035E30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _08035E5A
	ldr r0, _08035E7C
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl __multadd
	adds r7, r0, #0
_08035E5A:
	asrs r6, r6, #2
	cmp r6, #0
	beq _08035EC0
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _08035E9C
	ldr r1, _08035E80
	bl __i2b
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _08035E9C
	.byte 0x00, 0x00
_08035E7C:
	.4byte gUnk_0884CE00
_08035E80:
	.4byte 0x00000271
_08035E84:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _08035E9A
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl __multiply
	str r0, [r5]
	str r4, [r0]
_08035E9A:
	adds r5, r0, #0
_08035E9C:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08035EBA
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl __multiply
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl _Bfree
	adds r7, r4, #0
_08035EBA:
	asrs r6, r6, #1
	cmp r6, #0
	bne _08035E84
_08035EC0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global __lshift
	.thumb_func
	.type __lshift, %function
__lshift: @ 08035ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _08035EF6
_08035EEE:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _08035EEE
_08035EF6:
	mov r0, sl
	bl _Balloc
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _08035F16
	movs r1, #0
	adds r2, r6, #0
_08035F0E:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _08035F0E
_08035F16:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _08035F48
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_08035F2E:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _08035F2E
	str r2, [r4]
	cmp r2, #0
	beq _08035F50
	adds r7, #1
	b _08035F50
_08035F48:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _08035F48
_08035F50:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl _Bfree
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __mcmp
	.thumb_func
	.type __mcmp, %function
__mcmp: @ 08035F70
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _08035FAC
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_08035F8E:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _08035FA6
	movs r1, #1
	cmp r0, r2
	bhs _08035FA2
	subs r1, #2
_08035FA2:
	adds r0, r1, #0
	b _08035FAC
_08035FA6:
	cmp r3, r4
	bhi _08035F8E
	movs r0, #0
_08035FAC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __mdiff
	.thumb_func
	.type __mdiff, %function
__mdiff: @ 08035FB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bne _08035FE6
	adds r0, r6, #0
	movs r1, #0
	bl _Balloc
	adds r7, r0, #0
	movs r0, #1
	str r0, [r7, #0x10]
	str r4, [r7, #0x14]
	b _08036096
_08035FE6:
	cmp r4, #0
	bge _08035FF4
	adds r7, r5, #0
	mov r5, r8
	mov r8, r7
	movs r4, #1
	b _08035FF6
_08035FF4:
	movs r4, #0
_08035FF6:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	bl _Balloc
	adds r7, r0, #0
	str r4, [r7, #0xc]
	ldr r0, [r5, #0x10]
	mov sb, r0
	adds r6, r5, #0
	adds r6, #0x14
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r3, #0x14
	add r3, r8
	mov ip, r3
	lsls r0, r0, #2
	add r0, ip
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x14
	movs r5, #0
	ldr r0, _08036080
	mov r8, r0
_0803602A:
	ldm r6!, {r1}
	str r1, [sp, #4]
	mov r3, r8
	ands r1, r3
	mov r0, ip
	adds r0, #4
	mov ip, r0
	subs r0, #4
	ldm r0!, {r2}
	adds r0, r2, #0
	ands r0, r3
	subs r1, r1, r0
	adds r0, r1, r5
	asrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsrs r3, r1, #0x10
	lsrs r2, r2, #0x10
	subs r3, r3, r2
	adds r1, r3, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	ldr r3, [sp]
	cmp ip, r3
	blo _0803602A
	cmp r6, sl
	bhs _0803608A
	ldr r2, _08036080
_08036064:
	ldm r6!, {r1}
	adds r0, r1, #0
	ands r0, r2
	adds r0, r0, r5
	asrs r5, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	cmp r6, sl
	blo _08036064
	b _0803608A
_08036080:
	.4byte 0x0000FFFF
_08036084:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
_0803608A:
	subs r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _08036084
	mov r1, sb
	str r1, [r7, #0x10]
_08036096:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global __ulp
	.thumb_func
	.type __ulp, %function
__ulp: @ 080360A8
	push {r4, lr}
	ldr r2, _080360BC
	ands r2, r0
	ldr r0, _080360C0
	adds r2, r2, r0
	cmp r2, #0
	ble _080360C4
	adds r3, r2, #0
	movs r4, #0
	b _080360EE
_080360BC:
	.4byte 0x7FF00000
_080360C0:
	.4byte 0xFCC00000
_080360C4:
	rsbs r0, r2, #0
	asrs r2, r0, #0x14
	cmp r2, #0x13
	bgt _080360D8
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r3, r0, #0
	asrs r3, r2
	movs r4, #0
	b _080360EE
_080360D8:
	movs r3, #0
	subs r2, #0x14
	cmp r2, #0x1e
	bgt _080360EA
	movs r0, #0x1f
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	b _080360EC
_080360EA:
	movs r1, #1
_080360EC:
	adds r4, r1, #0
_080360EE:
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4}
	pop {r2}
	bx r2

	.global __b2d
	.thumb_func
	.type __b2d, %function
__b2d: @ 080360F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0x14
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r0, #0x10]
	lsls r0, r0, #2
	adds r5, r1, r0
	subs r5, #4
	ldr r2, [r5]
	adds r0, r2, #0
	str r2, [sp]
	bl __hi0bits
	adds r3, r0, #0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [r4]
	ldr r2, [sp]
	cmp r3, #0xa
	bgt _08036158
	movs r0, #0xb
	subs r0, r0, r3
	adds r1, r2, #0
	lsrs r1, r0
	ldr r0, _08036140
	adds r6, r1, #0
	orrs r6, r0
	cmp r5, r8
	bls _08036144
	subs r5, #4
	ldr r1, [r5]
	b _08036146
_08036140:
	.4byte 0x3FF00000
_08036144:
	movs r1, #0
_08036146:
	adds r0, r3, #0
	adds r0, #0x15
	lsls r2, r0
	movs r0, #0xb
	subs r0, r0, r3
	lsrs r1, r0
	adds r7, r2, #0
	orrs r7, r1
	b _080361A4
_08036158:
	cmp r5, r8
	bls _08036162
	subs r5, #4
	ldr r4, [r5]
	b _08036164
_08036162:
	movs r4, #0
_08036164:
	subs r3, #0xb
	cmp r3, #0
	beq _0803619C
	lsls r2, r3
	movs r0, #0x20
	subs r0, r0, r3
	adds r1, r4, #0
	lsrs r1, r0
	ldr r0, _08036188
	orrs r1, r0
	adds r6, r2, #0
	orrs r6, r1
	cmp r5, r8
	bls _0803618C
	subs r5, #4
	ldr r2, [r5]
	b _0803618E
	.byte 0x00, 0x00
_08036188:
	.4byte 0x3FF00000
_0803618C:
	movs r2, #0
_0803618E:
	lsls r4, r3
	movs r0, #0x20
	subs r0, r0, r3
	lsrs r2, r0
	adds r7, r4, #0
	orrs r7, r2
	b _080361A4
_0803619C:
	ldr r0, _080361B4
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r4, #0
_080361A4:
	adds r1, r7, #0
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2
_080361B4:
	.4byte 0x3FF00000

	.global __d2b
	.thumb_func
	.type __d2b, %function
__d2b: @ 080361B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r3
	ldr r3, [sp, #0x28]
	mov sl, r3
	adds r5, r2, #0
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	adds r6, r0, #0
	movs r0, #0x14
	adds r0, r0, r6
	mov r8, r0
	ldr r2, _08036220
	adds r1, r4, #0
	ands r2, r1
	str r2, [sp, #4]
	ldr r0, _08036224
	ands r4, r0
	lsrs r7, r4, #0x14
	cmp r7, #0
	beq _080361F6
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [sp, #4]
_080361F6:
	str r5, [sp]
	cmp r5, #0
	beq _08036240
	mov r0, sp
	bl __lo0bits
	adds r2, r0, #0
	cmp r2, #0
	beq _08036228
	movs r0, #0x20
	subs r0, r0, r2
	ldr r1, [sp, #4]
	lsls r1, r0
	ldr r0, [sp]
	orrs r0, r1
	str r0, [r6, #0x14]
	ldr r0, [sp, #4]
	lsrs r0, r2
	str r0, [sp, #4]
	b _0803622C
	.byte 0x00, 0x00
_08036220:
	.4byte 0x000FFFFF
_08036224:
	.4byte 0x7FFFFFFF
_08036228:
	ldr r0, [sp]
	str r0, [r6, #0x14]
_0803622C:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #4]
	movs r1, #1
	cmp r0, #0
	beq _0803623A
	movs r1, #2
_0803623A:
	str r1, [r6, #0x10]
	adds r4, r1, #0
	b _08036254
_08036240:
	add r0, sp, #4
	bl __lo0bits
	adds r2, r0, #0
	ldr r0, [sp, #4]
	str r0, [r6, #0x14]
	movs r0, #1
	str r0, [r6, #0x10]
	movs r4, #1
	adds r2, #0x20
_08036254:
	cmp r7, #0
	beq _08036270
	ldr r3, _0803626C
	adds r0, r2, r3
	adds r0, r7, r0
	mov r1, sb
	str r0, [r1]
	movs r0, #0x35
	subs r0, r0, r2
	mov r3, sl
	str r0, [r3]
	b _0803628C
_0803626C:
	.4byte 0xFFFFFBCD
_08036270:
	ldr r1, _080362A0
	adds r0, r2, r1
	mov r3, sb
	str r0, [r3]
	lsls r0, r4, #2
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	bl __hi0bits
	lsls r1, r4, #5
	subs r1, r1, r0
	mov r0, sl
	str r1, [r0]
_0803628C:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_080362A0:
	.4byte 0xFFFFFBCE

	.global __ratio
	.thumb_func
	.type __ratio, %function
__ratio: @ 080362A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	mov r1, sp
	bl __b2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r1, sp, #4
	adds r0, r5, #0
	bl __b2d
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, [sp]
	ldr r0, [sp, #4]
	subs r2, r2, r0
	ldr r0, [r4, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r2, r0
	cmp r0, #0
	ble _080362E0
	lsls r0, r0, #0x14
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	b _080362E4
_080362E0:
	lsls r0, r0, #0x14
	subs r6, r6, r0
_080362E4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __divdf3
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2

	.global _mprec_log10
	.thumb_func
	.type _mprec_log10, %function
_mprec_log10: @ 080362F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08036314
	ldr r0, _08036310
	cmp r4, #0x17
	bgt _0803631C
	ldr r0, _08036318
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	b _0803632E
_08036310:
	.4byte 0x3FF00000
_08036314:
	.4byte 0x00000000
_08036318:
	.4byte gUnk_0884CE0C
_0803631C:
	cmp r4, #0
	ble _0803632E
_08036320:
	ldr r3, _08036338
	ldr r2, _08036334
	bl __muldf3
	subs r4, #1
	cmp r4, #0
	bgt _08036320
_0803632E:
	pop {r4}
	pop {r2}
	bx r2
_08036334:
	.4byte 0x40240000
_08036338:
	.4byte 0x00000000

	.global isinf
	.thumb_func
	.type isinf, %function
isinf: @ 0803633C
	ldr r3, _08036358
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _0803635C
	subs r3, r0, r3
	rsbs r0, r3, #0
	orrs r3, r0
	lsrs r3, r3, #0x1f
	movs r0, #1
	subs r0, r0, r3
	bx lr
_08036358:
	.4byte 0x7FFFFFFF
_0803635C:
	.4byte 0x7FF00000

	.global isnan
	.thumb_func
	.type isnan, %function
isnan: @ 08036360
	ldr r3, _08036378
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _0803637C
	subs r3, r0, r3
	lsrs r3, r3, #0x1f
	adds r0, r3, #0
	bx lr
	.byte 0x00, 0x00
_08036378:
	.4byte 0x7FFFFFFF
_0803637C:
	.4byte 0x7FF00000

	.global _sbrk_r
	.thumb_func
	.type _sbrk_r, %function
_sbrk_r: @ 08036380
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080363AC
	movs r1, #0
	str r1, [r4]
	bl _sbrk
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080363A2
	ldr r0, [r4]
	cmp r0, #0
	beq _080363A2
	str r0, [r5]
_080363A2:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_080363AC:
	.4byte 0x02000004

	.global __sread
	.thumb_func
	.type __sread, %function
__sread: @ 080363B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl _read_r
	adds r1, r0, #0
	cmp r1, #0
	blt _080363D2
	ldr r0, [r5, #0x50]
	adds r0, r0, r1
	str r0, [r5, #0x50]
	b _080363DA
_080363D2:
	ldr r0, _080363E4
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
_080363DA:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_080363E4:
	.4byte 0xFFFFEFFF

	.global __swrite
	.thumb_func
	.type __swrite, %function
__swrite: @ 080363E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _0803640A
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #2
	bl _lseek_r
_0803640A:
	ldr r0, _08036428
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	adds r2, r5, #0
	adds r3, r6, #0
	bl _write_r
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08036428:
	.4byte 0xFFFFEFFF

	.global __sseek
	.thumb_func
	.type __sseek, %function
__sseek: @ 0803642C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl _lseek_r
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08036458
	ldr r0, _08036454
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
	b _08036466
_08036454:
	.4byte 0xFFFFEFFF
_08036458:
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrh r2, [r5, #0xc]
	orrs r0, r2
	strh r0, [r5, #0xc]
	str r1, [r5, #0x50]
_08036466:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __sclose
	.thumb_func
	.type __sclose, %function
__sclose: @ 08036470
	push {lr}
	ldr r2, [r0, #0x54]
	movs r3, #0xe
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl _close_r
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global strcmp
	.thumb_func
	.type strcmp, %function
strcmp: @ 08036484
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	orrs r0, r3
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080364CA
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	bne _080364CA
	ldr r5, _080364B0
	ldr r4, _080364B4
_080364A0:
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080364B8
	movs r0, #0
	b _080364DC
_080364B0:
	.4byte 0xFEFEFEFF
_080364B4:
	.4byte 0x80808080
_080364B8:
	adds r2, #4
	adds r3, #4
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _080364A0
	b _080364CA
_080364C6:
	adds r2, #1
	adds r3, #1
_080364CA:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080364D6
	ldrb r1, [r3]
	cmp r0, r1
	beq _080364C6
_080364D6:
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r0, r2, r3
_080364DC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global strlen
	.thumb_func
	.type strlen, %function
strlen: @ 080364E4
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r5, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0803651C
	adds r2, r1, #0
	ldr r1, [r2]
	ldr r4, _08036500
	adds r0, r1, r4
	bics r0, r1
	ldr r3, _08036504
	b _08036510
_08036500:
	.4byte 0xFEFEFEFF
_08036504:
	.4byte 0x80808080
_08036508:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r4
	bics r0, r1
_08036510:
	ands r0, r3
	cmp r0, #0
	beq _08036508
	adds r1, r2, #0
	b _0803651C
_0803651A:
	adds r1, #1
_0803651C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803651A
	subs r0, r1, r5
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global findslot
	.thumb_func
	.type findslot, %function
findslot: @ 0803652C
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08036534
	b _08036540
_08036534:
	.4byte 0x0202F040
_08036538:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _08036546
_08036540:
	ldr r0, [r2]
	cmp r0, r3
	bne _08036538
_08036546:
	adds r0, r1, #0
	bx lr
	.byte 0x00, 0x00

	.global remap_handle
	.thumb_func
	.type remap_handle, %function
remap_handle: @ 0803654C
	adds r2, r0, #0
	ldr r0, _08036560
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _08036568
	ldr r0, _08036564
	b _0803658E
_08036560:
	.4byte gUnk_08BB5284
_08036564:
	.4byte 0x0202F034
_08036568:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _0803657C
	ldr r0, _08036578
	b _0803658E
	.byte 0x00, 0x00
_08036578:
	.4byte 0x0202F038
_0803657C:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _0803658C
	adds r0, r2, #0
	subs r0, #0x20
	b _08036590
_0803658C:
	ldr r0, _08036594
_0803658E:
	ldr r0, [r0]
_08036590:
	bx lr
	.byte 0x00, 0x00
_08036594:
	.4byte 0x0202F03C

	.global initialise_monitor_handles
	.thumb_func
	.type initialise_monitor_handles, %function
initialise_monitor_handles: @ 08036598
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _080365F8
	str r4, [sp]
	movs r3, #3
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	adds r0, r5, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r5, _080365FC
	str r2, [r5]
	str r4, [sp]
	str r3, [sp, #8]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _08036600
	movs r4, #1
	adds r0, r4, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r0, _08036604
	str r2, [r0]
	str r2, [r3]
	ldr r2, _08036608
	adds r1, r2, #0
	subs r4, #2
	adds r0, r2, #0
	adds r0, #0x98
_080365DA:
	str r4, [r0]
	subs r0, #8
	cmp r0, r1
	bge _080365DA
	movs r0, #0
	ldr r1, [r5]
	str r1, [r2]
	str r0, [r2, #4]
	ldr r1, [r3]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
_080365F8:
	.4byte gUnk_0884CF24
_080365FC:
	.4byte 0x0202F034
_08036600:
	.4byte 0x0202F038
_08036604:
	.4byte 0x0202F03C
_08036608:
	.4byte 0x0202F040

	.global get_errno
	.thumb_func
	.type get_errno, %function
get_errno: @ 0803660C
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global error
	.thumb_func
	.type error, %function
error: @ 08036624
	push {r4, r5, lr}
	adds r5, r0, #0
	bl __errno
	adds r4, r0, #0
	bl get_errno
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	.global wrap
	.thumb_func
	.type wrap, %function
wrap: @ 0803663C
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803664C
	adds r0, r1, #0
	b _08036652
_0803664C:
	adds r0, r1, #0
	bl error
_08036652:
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _swiread
	.thumb_func
	.type _swiread, %function
_swiread: @ 08036658
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #6
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _read
	.thumb_func
	.type _read, %function
_read: @ 08036680
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl remap_handle
	bl findslot
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl _swiread
	cmp r0, #0
	bge _080366AA
	movs r0, #1
	rsbs r0, r0, #0
	bl error
	b _080366C0
_080366AA:
	subs r2, r7, r0
	cmp r6, #0x14
	beq _080366BE
	ldr r0, _080366C8
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080366BE:
	adds r0, r2, #0
_080366C0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_080366C8:
	.4byte 0x0202F040

	.global _swilseek
	.thumb_func
	.type _swilseek, %function
_swilseek: @ 080366CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	bl remap_handle
	adds r7, r0, #0
	bl findslot
	adds r6, r0, #0
	cmp r4, #1
	bne _08036702
	cmp r6, #0x14
	bne _080366F4
	movs r0, #1
	rsbs r0, r0, #0
	b _08036744
_080366F4:
	ldr r0, _08036750
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r5, r0
	movs r4, #0
_08036702:
	cmp r4, #2
	bne _08036714
	str r7, [sp]
	movs r3, #0xc
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r5, r5, r2
_08036714:
	mov r0, r8
	bl remap_handle
	str r0, [sp]
	str r5, [sp, #4]
	movs r3, #0xa
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	cmp r6, #0x14
	beq _0803673A
	cmp r2, #0
	bne _0803673A
	ldr r0, _08036750
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_0803673A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #0
	bne _08036744
	adds r0, r5, #0
_08036744:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08036750:
	.4byte 0x0202F040

	.global _lseek
	.thumb_func
	.type _lseek, %function
_lseek: @ 08036754
	push {lr}
	bl _swilseek
	bl wrap
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _swiwrite
	.thumb_func
	.type _swiwrite, %function
_swiwrite: @ 08036764
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _write
	.thumb_func
	.type _write, %function
_write: @ 0803678C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl remap_handle
	bl findslot
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _swiwrite
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080367B4
	cmp r0, r6
	bne _080367BC
_080367B4:
	adds r0, r1, #0
	bl error
	b _080367D2
_080367BC:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _080367D0
	ldr r0, _080367D8
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080367D0:
	adds r0, r2, #0
_080367D2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_080367D8:
	.4byte 0x0202F040

	.global _swiopen
	.thumb_func
	.type _swiopen, %function
_swiopen: @ 080367DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	movs r5, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r6, #0
	bl findslot
	mov r8, r0
	cmp r0, #0x14
	bne _080367FE
	adds r0, r6, #0
	b _08036872
_080367FE:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08036808
	movs r5, #2
_08036808:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08036816
	movs r0, #4
	orrs r5, r0
_08036816:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _08036824
	movs r0, #4
	orrs r5, r0
_08036824:
	movs r1, #8
	ands r4, r1
	cmp r4, #0
	beq _08036834
	movs r0, #5
	rsbs r0, r0, #0
	ands r5, r0
	orrs r5, r1
_08036834:
	str r7, [sp]
	adds r0, r7, #0
	bl strlen
	str r0, [sp, #8]
	str r5, [sp, #4]
	movs r2, #1
	adds r0, r2, #0
	mov r1, sp
	svc #0xab
	adds r3, r0, #0
	cmp r3, #0
	blt _0803686C
	ldr r0, _08036868
	mov r1, r8
	lsls r2, r1, #3
	adds r1, r2, r0
	str r3, [r1]
	adds r0, #4
	adds r2, r2, r0
	movs r0, #0
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	b _08036872
	.byte 0x00, 0x00
_08036868:
	.4byte 0x0202F040
_0803686C:
	adds r0, r3, #0
	bl error
_08036872:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00, 0x0E, 0xB4

	.global _open
	.thumb_func
	.type _open, %function
_open: @ 08036882
	push {lr}
	ldr r1, [sp, #4]
	bl _swiopen
	bl wrap
	pop {r3}
	add sp, #0xc
	bx r3

	.global _swiclose
	.thumb_func
	.type _swiclose, %function
_swiclose: @ 08036894
	push {lr}
	sub sp, #4
	bl remap_handle
	str r0, [sp]
	bl findslot
	adds r1, r0, #0
	cmp r1, #0x14
	beq _080368B4
	ldr r0, _080368C8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_080368B4:
	movs r3, #2
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #4
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_080368C8:
	.4byte 0x0202F040

	.global _close
	.thumb_func
	.type _close, %function
_close: @ 080368CC
	push {lr}
	bl _swiclose
	bl wrap
	pop {r1}
	bx r1
	.incbin "baserom.gba", 0x368DA, 0x46

	.global _sbrk
	.thumb_func
	.type _sbrk, %function
_sbrk: @ 08036920
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08036954
	ldr r0, [r4]
	cmp r0, #0
	bne _08036930
	ldr r0, _08036958
	str r0, [r4]
_08036930:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _08036946
	ldr r1, _0803695C
	movs r0, #1
	movs r2, #0x20
	bl _write
	bl semihost_exit
_08036946:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_08036954:
	.4byte 0x0202F030
_08036958:
	.4byte 0x0202F108
_0803695C:
	.4byte gUnk_0884CF28

	.global _fstat
	.thumb_func
	.type _fstat, %function
_fstat: @ 08036960
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.byte 0x00, 0x00, 0x01, 0x20, 0x40, 0x42, 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00

	.global _gettimeofday
	.thumb_func
	.type _gettimeofday, %function
_gettimeofday: @ 08036978
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08036996
	movs r4, #0x11
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r5, r0, #0
	adds r4, r5, #0
	str r4, [r2]
	movs r0, #0
	str r0, [r2, #4]
_08036996:
	cmp r3, #0
	beq _080369A0
	movs r0, #0
	str r0, [r3]
	str r0, [r3, #4]
_080369A0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	.global _times
	.thumb_func
	.type _times, %function
_times: @ 080369A8
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r3, r0, #0
	cmp r2, #0
	beq _080369C6
	str r3, [r2]
	movs r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
_080369C6:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global _write_r
	.thumb_func
	.type _write_r, %function
_write_r: @ 080369D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08036A00
	movs r3, #0
	str r3, [r4]
	bl _write
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080369F6
	ldr r0, [r4]
	cmp r0, #0
	beq _080369F6
	str r0, [r5]
_080369F6:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08036A00:
	.4byte 0x02000004

	.global _calloc_r
	.thumb_func
	.type _calloc_r, %function
_calloc_r: @ 08036A04
	push {r4, lr}
	muls r1, r2, r1
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	bne _08036A16
	movs r0, #0
	b _08036A5A
_08036A16:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0, #4]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	subs r2, r0, #4
	cmp r2, #0x24
	bhi _08036A50
	adds r1, r4, #0
	cmp r2, #0x13
	bls _08036A46
	movs r0, #0
	stm r1!, {r0}
	str r0, [r4, #4]
	adds r1, #4
	cmp r2, #0x1b
	bls _08036A46
	stm r1!, {r0}
	stm r1!, {r0}
	cmp r2, #0x23
	bls _08036A46
	stm r1!, {r0}
	stm r1!, {r0}
_08036A46:
	movs r0, #0
	stm r1!, {r0}
	stm r1!, {r0}
	str r0, [r1]
	b _08036A58
_08036A50:
	adds r0, r4, #0
	movs r1, #0
	bl memset
_08036A58:
	adds r0, r4, #0
_08036A5A:
	pop {r4}
	pop {r1}
	bx r1

	.global _close_r
	.thumb_func
	.type _close_r, %function
_close_r: @ 08036A60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _08036A8C
	movs r1, #0
	str r1, [r4]
	bl _close
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08036A82
	ldr r0, [r4]
	cmp r0, #0
	beq _08036A82
	str r0, [r5]
_08036A82:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08036A8C:
	.4byte 0x02000004

	.global __errno
	.thumb_func
	.type __errno, %function
__errno: @ 08036A90
	ldr r0, _08036A98
	ldr r0, [r0]
	bx lr
	.byte 0x00, 0x00
_08036A98:
	.4byte gUnk_08BB5284

	.global _fstat_r
	.thumb_func
	.type _fstat_r, %function
_fstat_r: @ 08036A9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r4, _08036AC8
	movs r2, #0
	str r2, [r4]
	bl _fstat
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08036AC0
	ldr r0, [r4]
	cmp r0, #0
	beq _08036AC0
	str r0, [r5]
_08036AC0:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
_08036AC8:
	.4byte 0x02000004

	.global semihost_exit
	.thumb_func
	.type semihost_exit, %function
semihost_exit: @ 08036ACC
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _08036AE8
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.byte 0x00, 0x00
_08036AE8:
	.4byte 0x00020022

	.global isatty
	.thumb_func
	.type isatty, %function
isatty: @ 08036AEC
	movs r0, #1
	bx lr
	.byte 0x70, 0x47, 0x00, 0x00

	.global _lseek_r
	.thumb_func
	.type _lseek_r, %function
_lseek_r: @ 08036AF4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08036B24
	movs r3, #0
	str r3, [r4]
	bl _lseek
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08036B1A
	ldr r0, [r4]
	cmp r0, #0
	beq _08036B1A
	str r0, [r5]
_08036B1A:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08036B24:
	.4byte 0x02000004

	.global _read_r
	.thumb_func
	.type _read_r, %function
_read_r: @ 08036B28
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08036B58
	movs r3, #0
	str r3, [r4]
	bl _read
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08036B4E
	ldr r0, [r4]
	cmp r0, #0
	beq _08036B4E
	str r0, [r5]
_08036B4E:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08036B58:
	.4byte 0x02000004

	.global _call_via_r0
	.thumb_func
	.type _call_via_r0, %function
_call_via_r0: @ 08036B5C
	bx r0
	.byte 0xC0, 0x46

	.global _call_via_r1
	.thumb_func
	.type _call_via_r1, %function
_call_via_r1: @ 08036B60
	bx r1
	.byte 0xC0, 0x46

	.global _call_via_r2
	.thumb_func
	.type _call_via_r2, %function
_call_via_r2: @ 08036B64
	bx r2
	.byte 0xC0, 0x46

	.global _call_via_r3
	.thumb_func
	.type _call_via_r3, %function
_call_via_r3: @ 08036B68
	bx r3
	.byte 0xC0, 0x46

	.global _call_via_r4
	.thumb_func
	.type _call_via_r4, %function
_call_via_r4: @ 08036B6C
	bx r4
	.byte 0xC0, 0x46

	.global _call_via_r5
	.thumb_func
	.type _call_via_r5, %function
_call_via_r5: @ 08036B70
	bx r5
	.byte 0xC0, 0x46

	.global _call_via_r6
	.thumb_func
	.type _call_via_r6, %function
_call_via_r6: @ 08036B74
	bx r6
	.byte 0xC0, 0x46

	.global _call_via_r7
	.thumb_func
	.type _call_via_r7, %function
_call_via_r7: @ 08036B78
	bx r7
	.byte 0xC0, 0x46

	.global _call_via_r8
	.thumb_func
	.type _call_via_r8, %function
_call_via_r8: @ 08036B7C
	bx r8
	.byte 0xC0, 0x46

	.global _call_via_r9
	.thumb_func
	.type _call_via_r9, %function
_call_via_r9: @ 08036B80
	bx sb
	.byte 0xC0, 0x46

	.global _call_via_r10
	.thumb_func
	.type _call_via_r10, %function
_call_via_r10: @ 08036B84
	bx sl
	.byte 0xC0, 0x46

	.global _call_via_r11
	.thumb_func
	.type _call_via_r11, %function
_call_via_r11: @ 08036B88
	bx fp
	.byte 0xC0, 0x46, 0x60, 0x47, 0xC0, 0x46, 0x68, 0x47, 0xC0, 0x46, 0x70, 0x47, 0xC0, 0x46

	.global __divsi3
	.thumb_func
	.type __divsi3, %function
__divsi3: @ 08036B98
	cmp r1, #0
	beq _08036C20
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _08036BAE
	rsbs r1, r1, #0
_08036BAE:
	cmp r0, #0
	bpl _08036BB4
	rsbs r0, r0, #0
_08036BB4:
	cmp r0, r1
	blo _08036C12
	movs r4, #1
	lsls r4, r4, #0x1c
_08036BBC:
	cmp r1, r4
	bhs _08036BCA
	cmp r1, r0
	bhs _08036BCA
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08036BBC
_08036BCA:
	lsls r4, r4, #3
_08036BCC:
	cmp r1, r4
	bhs _08036BDA
	cmp r1, r0
	bhs _08036BDA
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08036BCC
_08036BDA:
	cmp r0, r1
	blo _08036BE2
	subs r0, r0, r1
	orrs r2, r3
_08036BE2:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08036BEE
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_08036BEE:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08036BFA
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_08036BFA:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08036C06
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_08036C06:
	cmp r0, #0
	beq _08036C12
	lsrs r3, r3, #4
	beq _08036C12
	lsrs r1, r1, #4
	b _08036BDA
_08036C12:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _08036C1C
	rsbs r0, r0, #0
_08036C1C:
	pop {r4}
	mov pc, lr
_08036C20:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.byte 0x00, 0x00

	.global __div0
	.thumb_func
	.type __div0, %function
__div0: @ 08036C2C
	mov pc, lr
	.byte 0x00, 0x00

	.global __modsi3
	.thumb_func
	.type __modsi3, %function
__modsi3: @ 08036C30
	movs r3, #1
	cmp r1, #0
	beq _08036CF4
	bpl _08036C3A
	rsbs r1, r1, #0
_08036C3A:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _08036C44
	rsbs r0, r0, #0
_08036C44:
	cmp r0, r1
	blo _08036CE8
	movs r4, #1
	lsls r4, r4, #0x1c
_08036C4C:
	cmp r1, r4
	bhs _08036C5A
	cmp r1, r0
	bhs _08036C5A
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08036C4C
_08036C5A:
	lsls r4, r4, #3
_08036C5C:
	cmp r1, r4
	bhs _08036C6A
	cmp r1, r0
	bhs _08036C6A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08036C5C
_08036C6A:
	movs r2, #0
	cmp r0, r1
	blo _08036C72
	subs r0, r0, r1
_08036C72:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08036C84
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036C84:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08036C96
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036C96:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08036CA8
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036CA8:
	mov ip, r3
	cmp r0, #0
	beq _08036CB6
	lsrs r3, r3, #4
	beq _08036CB6
	lsrs r1, r1, #4
	b _08036C6A
_08036CB6:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _08036CE8
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _08036CCC
	lsrs r4, r1, #3
	adds r0, r0, r4
_08036CCC:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _08036CDA
	lsrs r4, r1, #2
	adds r0, r0, r4
_08036CDA:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _08036CE8
	lsrs r4, r1, #1
	adds r0, r0, r4
_08036CE8:
	pop {r4}
	cmp r4, #0
	bpl _08036CF0
	rsbs r0, r0, #0
_08036CF0:
	pop {r4}
	mov pc, lr
_08036CF4:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.byte 0x00, 0x00

	.global __muldi3
	.thumb_func
	.type __muldi3, %function
__muldi3: @ 08036D00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _08036D70
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _08036D40
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_08036D40:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2
_08036D70:
	.4byte 0x0000FFFF

	.global __umodsi3
	.thumb_func
	.type __umodsi3, %function
__umodsi3: @ 08036D74
	cmp r1, #0
	beq _08036E2A
	movs r3, #1
	cmp r0, r1
	bhs _08036D80
	mov pc, lr
_08036D80:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_08036D86:
	cmp r1, r4
	bhs _08036D94
	cmp r1, r0
	bhs _08036D94
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08036D86
_08036D94:
	lsls r4, r4, #3
_08036D96:
	cmp r1, r4
	bhs _08036DA4
	cmp r1, r0
	bhs _08036DA4
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08036D96
_08036DA4:
	movs r2, #0
	cmp r0, r1
	blo _08036DAC
	subs r0, r0, r1
_08036DAC:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08036DBE
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036DBE:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08036DD0
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036DD0:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08036DE2
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08036DE2:
	mov ip, r3
	cmp r0, #0
	beq _08036DF0
	lsrs r3, r3, #4
	beq _08036DF0
	lsrs r1, r1, #4
	b _08036DA4
_08036DF0:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _08036DFC
	pop {r4}
	mov pc, lr
_08036DFC:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _08036E0A
	lsrs r4, r1, #3
	adds r0, r0, r4
_08036E0A:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _08036E18
	lsrs r4, r1, #2
	adds r0, r0, r4
_08036E18:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _08036E26
	lsrs r4, r1, #1
	adds r0, r0, r4
_08036E26:
	pop {r4}
	mov pc, lr
_08036E2A:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}

	.global __pack_d
	.thumb_func
	.type __pack_d, %function
__pack_d: @ 08036E34
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	ldr r5, [r1, #0x10]
	ldr r7, [r1, #4]
	movs r6, #0
	movs r2, #0
	ldr r0, [r1]
	cmp r0, #1
	bhi _08036E4C
	movs r2, #1
_08036E4C:
	cmp r2, #0
	beq _08036E6C
	ldr r6, _08036E60
	ldr r2, _08036E64
	ldr r3, _08036E68
	adds r0, r4, #0
	adds r1, r5, #0
	orrs r1, r3
	b _08036F24
	.byte 0x00, 0x00
_08036E60:
	.4byte 0x000007FF
_08036E64:
	.4byte 0x00000000
_08036E68:
	.4byte 0x00080000
_08036E6C:
	movs r2, #0
	cmp r0, #4
	bne _08036E74
	movs r2, #1
_08036E74:
	cmp r2, #0
	bne _08036EC0
	movs r2, #0
	cmp r0, #2
	bne _08036E80
	movs r2, #1
_08036E80:
	cmp r2, #0
	beq _08036E8A
	movs r4, #0
	movs r5, #0
	b _08036F28
_08036E8A:
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _08036F28
	ldr r2, [r1, #8]
	ldr r0, _08036EA8
	cmp r2, r0
	bge _08036EBA
	subs r2, r0, r2
	cmp r2, #0x38
	ble _08036EAC
	movs r4, #0
	movs r5, #0
	b _08036F1A
	.byte 0x00, 0x00
_08036EA8:
	.4byte 0xFFFFFC02
_08036EAC:
	adds r1, r5, #0
	adds r0, r4, #0
	bl __lshrdi3
	adds r5, r1, #0
	adds r4, r0, #0
	b _08036F1A
_08036EBA:
	ldr r0, _08036EC8
	cmp r2, r0
	ble _08036ED0
_08036EC0:
	ldr r6, _08036ECC
	movs r4, #0
	movs r5, #0
	b _08036F28
_08036EC8:
	.4byte 0x000003FF
_08036ECC:
	.4byte 0x000007FF
_08036ED0:
	ldr r0, _08036EF8
	adds r6, r2, r0
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _08036EFC
	cmp r2, #0
	bne _08036EFC
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _08036F04
	movs r0, #0x80
	movs r1, #0
	b _08036F00
_08036EF8:
	.4byte 0x000003FF
_08036EFC:
	movs r0, #0x7f
	movs r1, #0
_08036F00:
	adds r4, r4, r0
	adcs r5, r1
_08036F04:
	ldr r0, _08036F6C
	cmp r5, r0
	bls _08036F1A
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, #1
_08036F1A:
	lsls r3, r5, #0x18
	lsrs r2, r4, #8
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #8
_08036F24:
	adds r5, r1, #0
	adds r4, r0, #0
_08036F28:
	str r4, [sp]
	ldr r2, _08036F70
	ands r2, r5
	ldr r0, [sp, #4]
	ldr r1, _08036F74
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, _08036F78
	adds r0, r1, #0
	ands r6, r0
	lsls r1, r6, #4
	ldr r0, _08036F7C
	ldrh r3, [r2, #6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #6]
	lsls r1, r7, #7
	movs r0, #0x7f
	ldrb r3, [r2, #7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2
_08036F6C:
	.4byte 0x1FFFFFFF
_08036F70:
	.4byte 0x000FFFFF
_08036F74:
	.4byte 0xFFF00000
_08036F78:
	.4byte 0x000007FF
_08036F7C:
	.4byte 0xFFFF800F

	.global __unpack_d
	.thumb_func
	.type __unpack_d, %function
__unpack_d: @ 08036F80
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r1, [r2, #4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r2, sp
	adds r4, r1, #0
	lsls r0, r0, #0xc
	lsrs r5, r0, #0xc
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x11
	lsrs r3, r0, #0x15
	ldrb r2, [r2, #7]
	lsrs r0, r2, #7
	str r0, [r6, #4]
	cmp r3, #0
	bne _08036FF4
	orrs r1, r5
	cmp r1, #0
	bne _08036FB4
	movs r0, #2
	str r0, [r6]
	b _08037048
_08036FB4:
	ldr r0, _08036FEC
	str r0, [r6, #8]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #3
	str r0, [r6]
	ldr r0, _08036FF0
	cmp r5, r0
	bhi _08037024
	adds r7, r0, #0
_08036FD2:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	subs r0, #1
	str r0, [r6, #8]
	cmp r5, r7
	bls _08036FD2
	b _08037024
_08036FEC:
	.4byte 0xFFFFFC02
_08036FF0:
	.4byte 0x0FFFFFFF
_08036FF4:
	ldr r0, _08037008
	cmp r3, r0
	bne _0803702A
	orrs r1, r5
	cmp r1, #0
	bne _0803700C
	movs r0, #4
	str r0, [r6]
	b _08037048
	.byte 0x00, 0x00
_08037008:
	.4byte 0x000007FF
_0803700C:
	movs r2, #0x80
	lsls r2, r2, #0xc
	movs r0, #0
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	cmp r1, #0
	beq _08037022
	movs r0, #1
	str r0, [r6]
	b _08037024
_08037022:
	str r1, [r6]
_08037024:
	str r4, [r6, #0xc]
	str r5, [r6, #0x10]
	b _08037048
_0803702A:
	ldr r1, _08037050
	adds r0, r3, r1
	str r0, [r6, #8]
	movs r0, #3
	str r0, [r6]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	ldr r2, _08037054
	ldr r3, _08037058
	orrs r1, r3
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
_08037048:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08037050:
	.4byte 0xFFFFFC01
_08037054:
	.4byte 0x00000000
_08037058:
	.4byte 0x10000000

	.global _fpadd_parts
	.thumb_func
	.type _fpadd_parts, %function
_fpadd_parts: @ 0803705C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _08037078
	movs r0, #1
_08037078:
	cmp r0, #0
	beq _08037080
_0803707C:
	adds r0, r3, #0
	b _080372B8
_08037080:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _0803708A
	movs r1, #1
_0803708A:
	cmp r1, #0
	bne _08037102
	movs r1, #0
	cmp r2, #4
	bne _08037096
	movs r1, #1
_08037096:
	cmp r1, #0
	beq _080370B8
	movs r1, #0
	cmp r0, #4
	bne _080370A2
	movs r1, #1
_080370A2:
	cmp r1, #0
	beq _0803707C
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _0803707C
	ldr r0, _080370B4
	b _080372B8
	.byte 0x00, 0x00
_080370B4:
	.4byte 0x0202F0E0
_080370B8:
	movs r1, #0
	cmp r0, #4
	bne _080370C0
	movs r1, #1
_080370C0:
	cmp r1, #0
	bne _08037102
	movs r1, #0
	cmp r0, #2
	bne _080370CC
	movs r1, #1
_080370CC:
	cmp r1, #0
	beq _080370F4
	movs r0, #0
	cmp r2, #2
	bne _080370D8
	movs r0, #1
_080370D8:
	cmp r0, #0
	beq _0803707C
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _080372B6
_080370F4:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _080370FE
	movs r1, #1
_080370FE:
	cmp r1, #0
	beq _08037106
_08037102:
	adds r0, r4, #0
	b _080372B8
_08037106:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _08037126
	rsbs r0, r0, #0
_08037126:
	cmp r0, #0x3f
	bgt _080371A4
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _08037170
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_0803713E:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _0803713E
	mov r8, sb
_08037170:
	cmp r8, sb
	ble _080371C0
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_0803717C:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _0803717C
	mov sb, r8
	b _080371C0
_080371A4:
	cmp sb, r8
	ble _080371B2
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _080371B8
_080371B2:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_080371B8:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_080371C0:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _08037268
	mov r2, ip
	cmp r2, #0
	beq _080371E2
	adds r1, r7, #0
	adds r0, r6, #0
	bl __negdi2
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _080371EE
_080371E2:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_080371EE:
	cmp r3, #0
	blt _08037204
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _0803721C
_08037204:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl __negdi2
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_0803721C:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_08037228:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _08037264
	cmp r3, r0
	bhi _08037280
	cmp r3, r0
	bne _0803723E
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _08037280
_0803723E:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _08037228
	.byte 0x00, 0x00
_08037264:
	.4byte 0x0FFFFFFF
_08037268:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_08037280:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _080372C8
	cmp r1, r0
	bls _080372B6
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_080372B6:
	mov r0, sl
_080372B8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_080372C8:
	.4byte 0x1FFFFFFF

	.global __adddf3
	.thumb_func
	.type __adddf3, %function
__adddf3: @ 080372CC
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl __pack_d
	add sp, #0x4c
	pop {r4}
	pop {r2}
	bx r2

	.global __subdf3
	.thumb_func
	.type __subdf3, %function
__subdf3: @ 08037300
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl __pack_d
	add sp, #0x4c
	pop {r4}
	pop {r2}
	bx r2

	.global __muldf3
	.thumb_func
	.type __muldf3, %function
__muldf3: @ 0803733C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _08037372
	movs r0, #1
_08037372:
	cmp r0, #0
	bne _080373D6
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08037380
	movs r2, #1
_08037380:
	cmp r2, #0
	beq _08037388
	ldr r0, [sp, #4]
	b _080373F8
_08037388:
	movs r2, #0
	cmp r1, #4
	bne _08037390
	movs r2, #1
_08037390:
	cmp r2, #0
	beq _080373A2
	movs r1, #0
	cmp r0, #2
	bne _0803739C
	movs r1, #1
_0803739C:
	cmp r1, #0
	bne _080373BA
	b _080373D6
_080373A2:
	movs r2, #0
	cmp r0, #4
	bne _080373AA
	movs r2, #1
_080373AA:
	cmp r2, #0
	beq _080373CA
	movs r0, #0
	cmp r1, #2
	bne _080373B6
	movs r0, #1
_080373B6:
	cmp r0, #0
	beq _080373C4
_080373BA:
	ldr r0, _080373C0
	b _080375C2
	.byte 0x00, 0x00
_080373C0:
	.4byte 0x0202F0E0
_080373C4:
	mov r1, r8
	ldr r0, [r1, #4]
	b _080373F8
_080373CA:
	movs r2, #0
	cmp r1, #2
	bne _080373D2
	movs r2, #1
_080373D2:
	cmp r2, #0
	beq _080373E8
_080373D6:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080375C2
_080373E8:
	movs r1, #0
	cmp r0, #2
	bne _080373F0
	movs r1, #1
_080373F0:
	cmp r1, #0
	beq _08037408
	mov r2, r8
	ldr r0, [r2, #4]
_080373F8:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _080375C2
_08037408:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _08037480
	cmp r7, r3
	bne _08037488
	cmp r6, r2
	bls _08037488
_08037480:
	ldr r5, _080375DC
	ldr r4, _080375D8
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_08037488:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _080374A4
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _080374B4
	cmp r0, r6
	bls _080374B4
_080374A4:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080374B4:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _080375E0
	cmp r5, r0
	bls _08037536
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_080374FA:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _08037520
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_08037520:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _080374FA
	mov r0, ip
	str r0, [sp, #0x30]
_08037536:
	ldr r0, _080375E4
	cmp r5, r0
	bhi _08037588
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_08037548:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _08037572
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_08037572:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _08037548
	mov r1, ip
	str r1, [sp, #0x30]
_08037588:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080375B6
	cmp r2, #0
	bne _080375B6
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080375AE
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _080375B6
_080375AE:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_080375B6:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_080375C2:
	bl __pack_d
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2
	.byte 0x00, 0x00
_080375D8:
	.4byte 0x00000000
_080375DC:
	.4byte 0x00000001
_080375E0:
	.4byte 0x1FFFFFFF
_080375E4:
	.4byte 0x0FFFFFFF

	.global __divdf3
	.thumb_func
	.type __divdf3, %function
__divdf3: @ 080375E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _08037612
	movs r0, #1
_08037612:
	cmp r0, #0
	beq _0803761A
	mov r1, sp
	b _0803775C
_0803761A:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _08037626
	movs r0, #1
_08037626:
	cmp r0, #0
	beq _0803762E
	adds r1, r4, #0
	b _0803775C
_0803762E:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _0803763E
	movs r0, #1
_0803763E:
	cmp r0, #0
	bne _0803764E
	movs r4, #0
	cmp r3, #2
	bne _0803764A
	movs r4, #1
_0803764A:
	cmp r4, #0
	beq _08037660
_0803764E:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _08037658
	b _0803775C
_08037658:
	ldr r1, _0803765C
	b _0803775C
_0803765C:
	.4byte 0x0202F0E0
_08037660:
	movs r0, #0
	cmp r2, #4
	bne _08037668
	movs r0, #1
_08037668:
	cmp r0, #0
	beq _0803767A
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _0803775C
_0803767A:
	movs r0, #0
	cmp r2, #2
	bne _08037682
	movs r0, #1
_08037682:
	cmp r0, #0
	beq _0803768E
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _0803775A
_0803768E:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080376B2
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _080376C6
	cmp r0, r4
	bls _080376C6
_080376B2:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_080376C6:
	ldr r7, _08037770
	ldr r6, _0803776C
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080376D2:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080376F6
	cmp r1, r5
	bne _080376E2
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _080376F6
_080376E2:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_080376F6:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _080376D2
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _08037750
	cmp r2, #0
	bne _08037750
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _08037740
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _08037750
_08037740:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_08037750:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_0803775A:
	mov r1, ip
_0803775C:
	adds r0, r1, #0
	bl __pack_d
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r2}
	bx r2
	.byte 0x00, 0x00
_0803776C:
	.4byte 0x00000000
_08037770:
	.4byte 0x10000000

	.global __fpcmp_parts_d
	.thumb_func
	.type __fpcmp_parts_d, %function
__fpcmp_parts_d: @ 08037774
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _08037784
	movs r0, #1
_08037784:
	cmp r0, #0
	bne _08037796
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _08037792
	movs r0, #1
_08037792:
	cmp r0, #0
	beq _0803779A
_08037796:
	movs r0, #1
	b _08037870
_0803779A:
	movs r0, #0
	cmp r1, #4
	bne _080377A2
	movs r0, #1
_080377A2:
	cmp r0, #0
	beq _080377BA
	movs r0, #0
	cmp r2, #4
	bne _080377AE
	movs r0, #1
_080377AE:
	cmp r0, #0
	beq _080377BA
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _08037870
_080377BA:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _080377C4
	movs r1, #1
_080377C4:
	cmp r1, #0
	bne _08037812
	movs r1, #0
	cmp r2, #4
	bne _080377D0
	movs r1, #1
_080377D0:
	cmp r1, #0
	beq _080377E2
_080377D4:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0803781C
	movs r1, #1
	b _0803781C
_080377E2:
	movs r1, #0
	cmp r0, #2
	bne _080377EA
	movs r1, #1
_080377EA:
	cmp r1, #0
	beq _080377FA
	movs r1, #0
	cmp r2, #2
	bne _080377F6
	movs r1, #1
_080377F6:
	cmp r1, #0
	bne _0803786E
_080377FA:
	movs r1, #0
	cmp r0, #2
	bne _08037802
	movs r1, #1
_08037802:
	cmp r1, #0
	bne _080377D4
	movs r0, #0
	cmp r2, #2
	bne _0803780E
	movs r0, #1
_0803780E:
	cmp r0, #0
	beq _08037820
_08037812:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _0803781C
	subs r1, #2
_0803781C:
	adds r0, r1, #0
	b _08037870
_08037820:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _08037832
_08037828:
	movs r0, #1
	cmp r4, #0
	beq _08037870
	subs r0, #2
	b _08037870
_08037832:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _08037828
	cmp r1, r0
	bge _0803784A
_0803783E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _08037870
	movs r0, #1
	b _08037870
_0803784A:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _08037828
	cmp r3, r2
	bne _0803785E
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _08037828
_0803785E:
	cmp r2, r3
	bhi _0803783E
	cmp r2, r3
	bne _0803786E
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _0803783E
_0803786E:
	movs r0, #0
_08037870:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __cmpdf2
	.thumb_func
	.type __cmpdf2, %function
__cmpdf2: @ 08037878
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __eqdf2
	.thumb_func
	.type __eqdf2, %function
__eqdf2: @ 080378A8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080378D0
	movs r1, #1
_080378D0:
	cmp r1, #0
	bne _080378E2
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080378DE
	movs r1, #1
_080378DE:
	cmp r1, #0
	beq _080378E6
_080378E2:
	movs r0, #1
	b _080378EE
_080378E6:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080378EE:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __nedf2
	.thumb_func
	.type __nedf2, %function
__nedf2: @ 080378F8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08037920
	movs r1, #1
_08037920:
	cmp r1, #0
	bne _08037932
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0803792E
	movs r1, #1
_0803792E:
	cmp r1, #0
	beq _08037936
_08037932:
	movs r0, #1
	b _0803793E
_08037936:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0803793E:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __gtdf2
	.thumb_func
	.type __gtdf2, %function
__gtdf2: @ 08037948
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08037970
	movs r1, #1
_08037970:
	cmp r1, #0
	bne _08037982
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0803797E
	movs r1, #1
_0803797E:
	cmp r1, #0
	beq _08037988
_08037982:
	movs r0, #1
	rsbs r0, r0, #0
	b _08037990
_08037988:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08037990:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1

	.global __gedf2
	.thumb_func
	.type __gedf2, %function
__gedf2: @ 08037998
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080379C0
	movs r1, #1
_080379C0:
	cmp r1, #0
	bne _080379D2
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080379CE
	movs r1, #1
_080379CE:
	cmp r1, #0
	beq _080379D8
_080379D2:
	movs r0, #1
	rsbs r0, r0, #0
	b _080379E0
_080379D8:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080379E0:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1

	.global __ltdf2
	.thumb_func
	.type __ltdf2, %function
__ltdf2: @ 080379E8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08037A10
	movs r1, #1
_08037A10:
	cmp r1, #0
	bne _08037A22
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08037A1E
	movs r1, #1
_08037A1E:
	cmp r1, #0
	beq _08037A26
_08037A22:
	movs r0, #1
	b _08037A2E
_08037A26:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08037A2E:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __ledf2
	.thumb_func
	.type __ledf2, %function
__ledf2: @ 08037A38
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08037A60
	movs r1, #1
_08037A60:
	cmp r1, #0
	bne _08037A72
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08037A6E
	movs r1, #1
_08037A6E:
	cmp r1, #0
	beq _08037A76
_08037A72:
	movs r0, #1
	b _08037A7E
_08037A76:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08037A7E:
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __floatsidf
	.thumb_func
	.type __floatsidf, %function
__floatsidf: @ 08037A88
	push {r4, r5, lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r1, r2, #0x1f
	str r1, [sp, #4]
	cmp r2, #0
	bne _08037AA0
	movs r0, #2
	str r0, [sp]
	b _08037AF6
_08037AA0:
	movs r0, #0x3c
	str r0, [sp, #8]
	cmp r1, #0
	beq _08037AC6
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r2, r0
	bne _08037AC0
	ldr r1, _08037ABC
	ldr r0, _08037AB8
	b _08037AFC
	.byte 0x00, 0x00
_08037AB8:
	.4byte 0xC1E00000
_08037ABC:
	.4byte 0x00000000
_08037AC0:
	rsbs r0, r2, #0
	asrs r1, r0, #0x1f
	b _08037ACA
_08037AC6:
	adds r0, r2, #0
	asrs r1, r2, #0x1f
_08037ACA:
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _08037B04
	cmp r0, r1
	bhi _08037AF6
	adds r5, r1, #0
	ldr r4, [sp, #8]
_08037ADA:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r4, #1
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bls _08037ADA
	str r4, [sp, #8]
_08037AF6:
	mov r0, sp
	bl __pack_d
_08037AFC:
	add sp, #0x14
	pop {r4, r5}
	pop {r2}
	bx r2
_08037B04:
	.4byte 0x0FFFFFFF

	.global __fixdfsi
	.thumb_func
	.type __fixdfsi, %function
__fixdfsi: @ 08037B08
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _08037B22
	movs r1, #1
_08037B22:
	cmp r1, #0
	bne _08037B56
	movs r1, #0
	cmp r0, #1
	bhi _08037B2E
	movs r1, #1
_08037B2E:
	cmp r1, #0
	bne _08037B56
	movs r1, #0
	cmp r0, #4
	bne _08037B3A
	movs r1, #1
_08037B3A:
	cmp r1, #0
	beq _08037B50
_08037B3E:
	ldr r0, [sp, #4]
	ldr r1, _08037B4C
	cmp r0, #0
	beq _08037B74
	adds r1, #1
	b _08037B74
	.byte 0x00, 0x00
_08037B4C:
	.4byte 0x7FFFFFFF
_08037B50:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08037B5A
_08037B56:
	movs r0, #0
	b _08037B76
_08037B5A:
	cmp r0, #0x1e
	bgt _08037B3E
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __lshrdi3
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _08037B74
	rsbs r1, r1, #0
_08037B74:
	adds r0, r1, #0
_08037B76:
	add sp, #0x1c
	pop {r1}
	bx r1

	.global __negdf2
	.thumb_func
	.type __negdf2, %function
__negdf2: @ 08037B7C
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08037B96
	movs r1, #1
_08037B96:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_d
	add sp, #0x1c
	pop {r2}
	bx r2
	.byte 0x81, 0xB0

	.global __make_dp
	.thumb_func
	.type __make_dp, %function
__make_dp: @ 08037BA6
	push {r4, lr}
	sub sp, #0x14
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, sp
	bl __pack_d
	add sp, #0x14
	pop {r4}
	pop {r3}
	add sp, #4
	bx r3
	.byte 0x00, 0x00

	.global __truncdfsf2
	.thumb_func
	.type __truncdfsf2, %function
__truncdfsf2: @ 08037BCC
	push {r4, r5, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsls r5, r3, #2
	lsrs r4, r2, #0x1e
	adds r0, r5, #0
	orrs r0, r4
	adds r5, r0, #0
	ldr r4, _08037C10
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0
	orrs r0, r1
	cmp r0, #0
	beq _08037BFC
	movs r0, #1
	orrs r5, r0
_08037BFC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r3, r5, #0
	bl __make_fp
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
_08037C10:
	.4byte 0x3FFFFFFF

	.global __pack_f
	.thumb_func
	.type __pack_f, %function
__pack_f: @ 08037C14
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0xc]
	ldr r6, [r0, #4]
	movs r5, #0
	movs r1, #0
	ldr r3, [r0]
	cmp r3, #1
	bhi _08037C26
	movs r1, #1
_08037C26:
	cmp r1, #0
	beq _08037C34
	movs r5, #0xff
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r2, r0
	b _08037C9A
_08037C34:
	movs r1, #0
	cmp r3, #4
	bne _08037C3C
	movs r1, #1
_08037C3C:
	cmp r1, #0
	bne _08037C70
	movs r1, #0
	cmp r3, #2
	bne _08037C48
	movs r1, #1
_08037C48:
	cmp r1, #0
	beq _08037C50
	movs r2, #0
	b _08037C9A
_08037C50:
	cmp r2, #0
	beq _08037C9A
	ldr r0, [r0, #8]
	movs r3, #0x7e
	rsbs r3, r3, #0
	cmp r0, r3
	bge _08037C6C
	subs r0, r3, r0
	cmp r0, #0x19
	ble _08037C68
	movs r2, #0
	b _08037C98
_08037C68:
	lsrs r2, r0
	b _08037C98
_08037C6C:
	cmp r0, #0x7f
	ble _08037C76
_08037C70:
	movs r5, #0xff
	movs r2, #0
	b _08037C9A
_08037C76:
	adds r5, r0, #0
	adds r5, #0x7f
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0x40
	bne _08037C8E
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08037C90
	adds r2, #0x40
	b _08037C90
_08037C8E:
	adds r2, #0x3f
_08037C90:
	cmp r2, #0
	bge _08037C98
	lsrs r2, r2, #1
	adds r5, #1
_08037C98:
	lsrs r2, r2, #7
_08037C9A:
	ldr r0, _08037CC0
	ands r2, r0
	ldr r0, _08037CC4
	ands r4, r0
	orrs r4, r2
	movs r0, #0xff
	ands r5, r0
	lsls r1, r5, #0x17
	ldr r0, _08037CC8
	ands r4, r0
	orrs r4, r1
	lsls r1, r6, #0x1f
	ldr r0, _08037CCC
	ands r4, r0
	orrs r4, r1
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_08037CC0:
	.4byte 0x007FFFFF
_08037CC4:
	.4byte 0xFF800000
_08037CC8:
	.4byte 0x807FFFFF
_08037CCC:
	.4byte 0x7FFFFFFF

	.global __unpack_f
	.thumb_func
	.type __unpack_f, %function
__unpack_f: @ 08037CD0
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r2, r1, #9
	lsls r1, r0, #1
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x1f
	str r0, [r3, #4]
	cmp r1, #0
	bne _08037D14
	cmp r2, #0
	bne _08037CF0
	movs r0, #2
	str r0, [r3]
	b _08037D48
_08037CF0:
	adds r4, r1, #0
	subs r4, #0x7e
	str r4, [r3, #8]
	lsls r2, r2, #7
	movs r0, #3
	str r0, [r3]
	ldr r1, _08037D10
	cmp r2, r1
	bhi _08037D30
	adds r0, r4, #0
_08037D04:
	lsls r2, r2, #1
	subs r0, #1
	cmp r2, r1
	bls _08037D04
	str r0, [r3, #8]
	b _08037D30
_08037D10:
	.4byte 0x3FFFFFFF
_08037D14:
	cmp r1, #0xff
	bne _08037D34
	cmp r2, #0
	bne _08037D22
	movs r0, #4
	str r0, [r3]
	b _08037D48
_08037D22:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08037D2E
	movs r0, #1
_08037D2E:
	str r0, [r3]
_08037D30:
	str r2, [r3, #0xc]
	b _08037D48
_08037D34:
	adds r0, r1, #0
	subs r0, #0x7f
	str r0, [r3, #8]
	movs r0, #3
	str r0, [r3]
	lsls r0, r2, #7
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3, #0xc]
_08037D48:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global _fpadd_parts_f
	.thumb_func
	.type _fpadd_parts_f, %function
_fpadd_parts_f: @ 08037D50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _08037D66
	movs r0, #1
_08037D66:
	cmp r0, #0
	beq _08037D6E
_08037D6A:
	adds r0, r6, #0
	b _08037EC4
_08037D6E:
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #1
	bhi _08037D78
	movs r1, #1
_08037D78:
	cmp r1, #0
	bne _08037DEC
	movs r1, #0
	cmp r2, #4
	bne _08037D84
	movs r1, #1
_08037D84:
	cmp r1, #0
	beq _08037DA4
	movs r1, #0
	cmp r0, #4
	bne _08037D90
	movs r1, #1
_08037D90:
	cmp r1, #0
	beq _08037D6A
	ldr r1, [r6, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _08037D6A
	ldr r0, _08037DA0
	b _08037EC4
_08037DA0:
	.4byte 0x0202F0F8
_08037DA4:
	movs r1, #0
	cmp r0, #4
	bne _08037DAC
	movs r1, #1
_08037DAC:
	cmp r1, #0
	bne _08037DEC
	movs r1, #0
	cmp r0, #2
	bne _08037DB8
	movs r1, #1
_08037DB8:
	cmp r1, #0
	beq _08037DDE
	movs r0, #0
	cmp r2, #2
	bne _08037DC4
	movs r0, #1
_08037DC4:
	cmp r0, #0
	beq _08037D6A
	adds r1, r5, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #4]
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r5, #4]
	b _08037EC2
_08037DDE:
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #2
	bne _08037DE8
	movs r1, #1
_08037DE8:
	cmp r1, #0
	beq _08037DF0
_08037DEC:
	adds r0, r7, #0
	b _08037EC4
_08037DF0:
	ldr r1, [r6, #8]
	ldr r3, [r7, #8]
	ldr r2, [r6, #0xc]
	ldr r4, [r7, #0xc]
	subs r0, r1, r3
	cmp r0, #0
	bge _08037E00
	rsbs r0, r0, #0
_08037E00:
	cmp r0, #0x1f
	bgt _08037E44
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
	cmp r1, r3
	ble _08037E26
	movs r7, #1
	mov ip, r7
	subs r3, r1, r3
_08037E14:
	subs r3, #1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	lsrs r4, r4, #1
	orrs r4, r0
	cmp r3, #0
	bne _08037E14
	adds r3, r1, #0
_08037E26:
	cmp r3, r1
	ble _08037E56
	movs r0, #1
	mov ip, r0
	subs r1, r3, r1
_08037E30:
	subs r1, #1
	adds r0, r2, #0
	mov r7, ip
	ands r0, r7
	lsrs r2, r2, #1
	orrs r2, r0
	cmp r1, #0
	bne _08037E30
	adds r1, r3, #0
	b _08037E56
_08037E44:
	cmp r1, r3
	ble _08037E4C
	movs r4, #0
	b _08037E50
_08037E4C:
	adds r1, r3, #0
	movs r2, #0
_08037E50:
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
_08037E56:
	cmp r6, r8
	beq _08037EA0
	cmp r6, #0
	beq _08037E62
	subs r3, r4, r2
	b _08037E64
_08037E62:
	subs r3, r2, r4
_08037E64:
	cmp r3, #0
	blt _08037E72
	movs r0, #0
	str r0, [r5, #4]
	str r1, [r5, #8]
	str r3, [r5, #0xc]
	b _08037E7C
_08037E72:
	movs r0, #1
	str r0, [r5, #4]
	str r1, [r5, #8]
	rsbs r0, r3, #0
	str r0, [r5, #0xc]
_08037E7C:
	ldr r1, [r5, #0xc]
	subs r0, r1, #1
	ldr r2, _08037E9C
	cmp r0, r2
	bhi _08037EA8
_08037E86:
	lsls r0, r1, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	adds r1, r0, #0
	subs r0, r1, #1
	cmp r0, r2
	bls _08037E86
	b _08037EA8
	.byte 0x00, 0x00
_08037E9C:
	.4byte 0x3FFFFFFE
_08037EA0:
	str r6, [r5, #4]
	str r1, [r5, #8]
	adds r0, r2, r4
	str r0, [r5, #0xc]
_08037EA8:
	movs r0, #3
	str r0, [r5]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bge _08037EC2
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_08037EC2:
	adds r0, r5, #0
_08037EC4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __addsf3
	.thumb_func
	.type __addsf3, %function
__addsf3: @ 08037ED0
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_f
	bl __pack_f
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1

	.global __subsf3
	.thumb_func
	.type __subsf3, %function
__subsf3: @ 08037F00
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_f
	bl __pack_f
	add sp, #0x38
	pop {r4}
	pop {r1}
	bx r1

	.global __mulsf3
	.thumb_func
	.type __mulsf3, %function
__mulsf3: @ 08037F38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r7, sp
	add r0, sp, #0x20
	mov r8, r0
	movs r0, #0
	ldr r1, [sp]
	mov sb, r8
	cmp r1, #1
	bhi _08037F6A
	movs r0, #1
_08037F6A:
	cmp r0, #0
	bne _08037FC8
	movs r2, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08037F78
	movs r2, #1
_08037F78:
	cmp r2, #0
	beq _08037F80
	ldr r0, [sp, #4]
	b _08037FE8
_08037F80:
	movs r2, #0
	cmp r1, #4
	bne _08037F88
	movs r2, #1
_08037F88:
	cmp r2, #0
	beq _08037F9A
	movs r1, #0
	cmp r0, #2
	bne _08037F94
	movs r1, #1
_08037F94:
	cmp r1, #0
	bne _08037FB2
	b _08037FC8
_08037F9A:
	movs r2, #0
	cmp r0, #4
	bne _08037FA2
	movs r2, #1
_08037FA2:
	cmp r2, #0
	beq _08037FBC
	movs r0, #0
	cmp r1, #2
	bne _08037FAE
	movs r0, #1
_08037FAE:
	cmp r0, #0
	beq _08037FE6
_08037FB2:
	ldr r0, _08037FB8
	b _0803808A
	.byte 0x00, 0x00
_08037FB8:
	.4byte 0x0202F0F8
_08037FBC:
	movs r2, #0
	cmp r1, #2
	bne _08037FC4
	movs r2, #1
_08037FC4:
	cmp r2, #0
	beq _08037FDA
_08037FC8:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _0803808A
_08037FDA:
	movs r1, #0
	cmp r0, #2
	bne _08037FE2
	movs r1, #1
_08037FE2:
	cmp r1, #0
	beq _08037FF8
_08037FE6:
	ldr r0, [r7, #4]
_08037FE8:
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x14]
	adds r0, r4, #0
	b _0803808A
_08037FF8:
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl __muldi3
	adds r2, r1, #0
	adds r5, r2, #0
	adds r6, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [sp, #0x18]
	adds r4, r4, r0
	str r4, [sp, #0x28]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x14]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r4, #2
	str r4, [sp, #0x28]
	cmp r2, #0
	bge _08038044
	movs r2, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_0803802E:
	adds r4, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _0803803C
	lsrs r6, r6, #1
	orrs r6, r1
_0803803C:
	lsrs r5, r5, #1
	cmp r5, #0
	blt _0803802E
	str r4, [sp, #0x28]
_08038044:
	ldr r0, _0803809C
	cmp r5, r0
	bhi _0803806A
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #1
	adds r2, r0, #0
	ldr r1, [sp, #0x28]
_08038054:
	subs r1, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _08038062
	orrs r5, r3
_08038062:
	lsls r6, r6, #1
	cmp r5, r2
	bls _08038054
	str r1, [sp, #0x28]
_0803806A:
	movs r0, #0x7f
	ands r0, r5
	cmp r0, #0x40
	bne _08038080
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _0803807E
	cmp r6, #0
	beq _08038080
_0803807E:
	adds r5, #0x40
_08038080:
	str r5, [sp, #0x2c]
	movs r0, #3
	mov r1, r8
	str r0, [r1]
	mov r0, sb
_0803808A:
	bl __pack_f
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0803809C:
	.4byte 0x3FFFFFFF

	.global __divsf3
	.thumb_func
	.type __divsf3, %function
__divsf3: @ 080380A0
	push {r4, r5, r6, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r5, sp, #0x10
	adds r1, r5, #0
	bl __unpack_f
	mov r4, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080380C6
	movs r0, #1
_080380C6:
	cmp r0, #0
	beq _080380CE
	mov r1, sp
	b _08038180
_080380CE:
	movs r0, #0
	ldr r2, [sp, #0x10]
	adds r6, r2, #0
	cmp r2, #1
	bhi _080380DA
	movs r0, #1
_080380DA:
	cmp r0, #0
	beq _080380E2
	adds r1, r5, #0
	b _08038180
_080380E2:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080380F2
	movs r0, #1
_080380F2:
	cmp r0, #0
	bne _08038102
	movs r0, #0
	cmp r3, #2
	bne _080380FE
	movs r0, #1
_080380FE:
	cmp r0, #0
	beq _08038114
_08038102:
	ldr r0, [r4]
	adds r1, r4, #0
	cmp r0, r6
	bne _08038180
	ldr r1, _08038110
	b _08038180
	.byte 0x00, 0x00
_08038110:
	.4byte 0x0202F0F8
_08038114:
	movs r1, #0
	cmp r2, #4
	bne _0803811C
	movs r1, #1
_0803811C:
	cmp r1, #0
	beq _08038128
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r1, sp
	b _08038180
_08038128:
	movs r0, #0
	cmp r2, #2
	bne _08038130
	movs r0, #1
_08038130:
	cmp r0, #0
	beq _0803813A
	movs r0, #4
	str r0, [r4]
	b _0803817E
_0803813A:
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bhs _08038150
	lsls r2, r2, #1
	subs r0, #1
	str r0, [r4, #8]
_08038150:
	movs r0, #0x80
	lsls r0, r0, #0x17
	movs r1, #0
_08038156:
	cmp r2, r3
	blo _0803815E
	orrs r1, r0
	subs r2, r2, r3
_0803815E:
	lsrs r0, r0, #1
	lsls r2, r2, #1
	cmp r0, #0
	bne _08038156
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x40
	bne _0803817C
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803817A
	cmp r2, #0
	beq _0803817C
_0803817A:
	adds r1, #0x40
_0803817C:
	str r1, [r4, #0xc]
_0803817E:
	adds r1, r4, #0
_08038180:
	adds r0, r1, #0
	bl __pack_f
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __fpcmp_parts_f
	.thumb_func
	.type __fpcmp_parts_f, %function
__fpcmp_parts_f: @ 08038190
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r2, [r4]
	cmp r2, #1
	bhi _0803819E
	movs r0, #1
_0803819E:
	cmp r0, #0
	bne _080381B0
	movs r0, #0
	ldr r3, [r1]
	cmp r3, #1
	bhi _080381AC
	movs r0, #1
_080381AC:
	cmp r0, #0
	beq _080381B4
_080381B0:
	movs r0, #1
	b _08038272
_080381B4:
	movs r0, #0
	cmp r2, #4
	bne _080381BC
	movs r0, #1
_080381BC:
	cmp r0, #0
	beq _080381D4
	movs r0, #0
	cmp r3, #4
	bne _080381C8
	movs r0, #1
_080381C8:
	cmp r0, #0
	beq _080381D4
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	b _08038272
_080381D4:
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #4
	bne _080381DE
	movs r2, #1
_080381DE:
	cmp r2, #0
	bne _0803822C
	movs r2, #0
	cmp r3, #4
	bne _080381EA
	movs r2, #1
_080381EA:
	cmp r2, #0
	beq _080381FC
_080381EE:
	ldr r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _08038236
	movs r1, #1
	b _08038236
_080381FC:
	movs r2, #0
	cmp r0, #2
	bne _08038204
	movs r2, #1
_08038204:
	cmp r2, #0
	beq _08038214
	movs r2, #0
	cmp r3, #2
	bne _08038210
	movs r2, #1
_08038210:
	cmp r2, #0
	bne _08038270
_08038214:
	movs r2, #0
	cmp r0, #2
	bne _0803821C
	movs r2, #1
_0803821C:
	cmp r2, #0
	bne _080381EE
	movs r0, #0
	cmp r3, #2
	bne _08038228
	movs r0, #1
_08038228:
	cmp r0, #0
	beq _0803823A
_0803822C:
	ldr r0, [r4, #4]
	movs r1, #1
	cmp r0, #0
	beq _08038236
	subs r1, #2
_08038236:
	adds r0, r1, #0
	b _08038272
_0803823A:
	ldr r3, [r4, #4]
	ldr r0, [r1, #4]
	cmp r3, r0
	beq _0803824C
_08038242:
	movs r0, #1
	cmp r3, #0
	beq _08038272
	subs r0, #2
	b _08038272
_0803824C:
	ldr r2, [r4, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bgt _08038242
	cmp r2, r0
	bge _08038264
_08038258:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, #0
	beq _08038272
	movs r0, #1
	b _08038272
_08038264:
	ldr r0, [r4, #0xc]
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhi _08038242
	cmp r0, r1
	blo _08038258
_08038270:
	movs r0, #0
_08038272:
	pop {r4}
	pop {r1}
	bx r1

	.global __cmpsf2
	.thumb_func
	.type __cmpsf2, %function
__cmpsf2: @ 08038278
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __eqsf2
	.thumb_func
	.type __eqsf2, %function
__eqsf2: @ 080382A4
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080382C8
	movs r1, #1
_080382C8:
	cmp r1, #0
	bne _080382DA
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080382D6
	movs r1, #1
_080382D6:
	cmp r1, #0
	beq _080382DE
_080382DA:
	movs r0, #1
	b _080382E6
_080382DE:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080382E6:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __nesf2
	.thumb_func
	.type __nesf2, %function
__nesf2: @ 080382F0
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08038314
	movs r1, #1
_08038314:
	cmp r1, #0
	bne _08038326
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08038322
	movs r1, #1
_08038322:
	cmp r1, #0
	beq _0803832A
_08038326:
	movs r0, #1
	b _08038332
_0803832A:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08038332:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __gtsf2
	.thumb_func
	.type __gtsf2, %function
__gtsf2: @ 0803833C
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08038360
	movs r1, #1
_08038360:
	cmp r1, #0
	bne _08038372
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _0803836E
	movs r1, #1
_0803836E:
	cmp r1, #0
	beq _08038378
_08038372:
	movs r0, #1
	rsbs r0, r0, #0
	b _08038380
_08038378:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08038380:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1

	.global __gesf2
	.thumb_func
	.type __gesf2, %function
__gesf2: @ 08038388
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080383AC
	movs r1, #1
_080383AC:
	cmp r1, #0
	bne _080383BE
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080383BA
	movs r1, #1
_080383BA:
	cmp r1, #0
	beq _080383C4
_080383BE:
	movs r0, #1
	rsbs r0, r0, #0
	b _080383CC
_080383C4:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080383CC:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1

	.global __ltsf2
	.thumb_func
	.type __ltsf2, %function
__ltsf2: @ 080383D4
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080383F8
	movs r1, #1
_080383F8:
	cmp r1, #0
	bne _0803840A
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08038406
	movs r1, #1
_08038406:
	cmp r1, #0
	beq _0803840E
_0803840A:
	movs r0, #1
	b _08038416
_0803840E:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08038416:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __lesf2
	.thumb_func
	.type __lesf2, %function
__lesf2: @ 08038420
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08038444
	movs r1, #1
_08038444:
	cmp r1, #0
	bne _08038456
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08038452
	movs r1, #1
_08038452:
	cmp r1, #0
	beq _0803845A
_08038456:
	movs r0, #1
	b _08038462
_0803845A:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08038462:
	add sp, #0x28
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __floatsisf
	.thumb_func
	.type __floatsisf, %function
__floatsisf: @ 0803846C
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r2, r1, #0x1f
	str r2, [sp, #4]
	cmp r1, #0
	bne _08038484
	movs r0, #2
	str r0, [sp]
	b _080384BC
_08038484:
	movs r0, #0x1e
	str r0, [sp, #8]
	cmp r2, #0
	beq _080384A2
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _0803849C
	ldr r0, _08038498
	b _080384C2
_08038498:
	.4byte 0xCF000000
_0803849C:
	rsbs r0, r1, #0
	str r0, [sp, #0xc]
	b _080384A4
_080384A2:
	str r1, [sp, #0xc]
_080384A4:
	ldr r2, [sp, #0xc]
	ldr r3, _080384C8
	cmp r2, r3
	bhi _080384BC
	ldr r1, [sp, #8]
_080384AE:
	lsls r0, r2, #1
	subs r1, #1
	adds r2, r0, #0
	cmp r0, r3
	bls _080384AE
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_080384BC:
	mov r0, sp
	bl __pack_f
_080384C2:
	add sp, #0x10
	pop {r1}
	bx r1
_080384C8:
	.4byte 0x3FFFFFFF

	.global __fixsfsi
	.thumb_func
	.type __fixsfsi, %function
__fixsfsi: @ 080384CC
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _080384E4
	movs r1, #1
_080384E4:
	cmp r1, #0
	bne _08038516
	movs r1, #0
	cmp r0, #1
	bhi _080384F0
	movs r1, #1
_080384F0:
	cmp r1, #0
	bne _08038516
	movs r1, #0
	cmp r0, #4
	bne _080384FC
	movs r1, #1
_080384FC:
	cmp r1, #0
	beq _08038510
_08038500:
	ldr r0, [sp, #4]
	ldr r1, _0803850C
	cmp r0, #0
	beq _0803852E
	adds r1, #1
	b _0803852E
_0803850C:
	.4byte 0x7FFFFFFF
_08038510:
	ldr r1, [sp, #8]
	cmp r1, #0
	bge _0803851A
_08038516:
	movs r0, #0
	b _08038530
_0803851A:
	cmp r1, #0x1e
	bgt _08038500
	movs r0, #0x1e
	subs r0, r0, r1
	ldr r1, [sp, #0xc]
	lsrs r1, r0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0803852E
	rsbs r1, r1, #0
_0803852E:
	adds r0, r1, #0
_08038530:
	add sp, #0x14
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __negsf2
	.thumb_func
	.type __negsf2, %function
__negsf2: @ 08038538
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08038550
	movs r1, #1
_08038550:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_f
	add sp, #0x14
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global __make_fp
	.thumb_func
	.type __make_fp, %function
__make_fp: @ 08038560
	push {lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, sp
	bl __pack_f
	add sp, #0x10
	pop {r1}
	bx r1

	.global __extendsfdf2
	.thumb_func
	.type __extendsfdf2, %function
__extendsfdf2: @ 08038578
	push {r4, r5, r6, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r0, sp, #0x14
	add r1, sp, #4
	bl __unpack_f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	movs r4, #0
	lsrs r6, r3, #2
	lsls r5, r4, #0x1e
	adds r4, r6, #0
	orrs r4, r5
	lsls r3, r3, #0x1e
	str r4, [sp]
	.2byte 0xF7FF, 0xFB02 @ bl #0x8037ba4
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r2}
	bx r2

	.global __lshrdi3
	.thumb_func
	.type __lshrdi3, %function
__lshrdi3: @ 080385A8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080385D8
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080385C4
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _080385D4
_080385C4:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_080385D4:
	adds r1, r4, #0
	adds r0, r3, #0
_080385D8:
	pop {r4, r5, r6}
	pop {r2}
	bx r2
	.byte 0x00, 0x00

	.global __negdi2
	.thumb_func
	.type __negdi2, %function
__negdi2: @ 080385E0
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _080385EE
	subs r1, #1
_080385EE:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4}
	pop {r2}
	bx r2
	.byte 0x00, 0x00
