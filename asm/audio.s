@ asm/audio.s: ROM 0x02EAE0-0x02F4A4 (rom, VMA 0x0802EAE0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global music_play
	.thumb_func
	.type music_play, %function
music_play: @ 0802EAE0
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	ldr r7, _0802EDBC
	ldr r7, [r7]
	cmp r0, r7
	blt _0802EB0C
	push {r0, r1}
	push {lr}
	ldr r0, _0802EDC0
	ldr r1, _0802EDC4
	mov lr, r1
	ldr r1, _0802EDC8
	bx r1

	.global sub_0802EB04
	.thumb_func
	.type sub_0802EB04, %function
sub_0802EB04: @ 0802EB04
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802EB0C:
	ldr r1, _0802EDCC
	str r0, [r1]
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global audio_vsync
	.thumb_func
	.type audio_vsync, %function
audio_vsync: @ 0802EB22
	ldr r0, _0802EDD0
	ldr r2, [r0]
	mvns r2, r2
	str r2, [r0]
	ldr r1, _0802EDD4
	cmp r2, #0
	beq _0802EB32
	ldr r1, _0802EDD8
_0802EB32:
	ldr r1, [r1]
	ldr r0, _0802EDDC
	movs r2, #0
	strh r2, [r0]
	ldr r2, _0802EDE0
	ldr r3, _0802EDE4
	ldr r0, _0802EDE8
	stm r0!, {r1, r2, r3}
	ldr r0, _0802EDEC
	movs r1, #0x80
	strh r1, [r0]
	bx lr

	.global audio_init
	.thumb_func
	.type audio_init, %function
audio_init: @ 0802EB4A
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	sub sp, #4
	ldr r0, _0802EDEC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0802EDDC
	movs r2, #0
	strh r2, [r0]
	ldr r0, _0802EDF0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0802EDF4
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r2, _0802EDF8
	ldr r2, [r2]
	ldr r3, _0802EDFC
	ldr r0, _0802EE00
	stm r0!, {r1, r2, r3}
	ldr r0, _0802EDF4
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r2, _0802EE04
	ldr r2, [r2]
	ldr r3, _0802EDFC
	ldr r0, _0802EE00
	stm r0!, {r1, r2, r3}
	movs r0, #0
	str r0, [sp]
	mov r1, sp
	ldr r2, _0802EDD8
	ldr r2, [r2]
	ldr r3, _0802EE08
	ldr r0, _0802EE00
	stm r0!, {r1, r2, r3}
	movs r0, #0
	str r0, [sp]
	mov r1, sp
	ldr r2, _0802EDD4
	ldr r2, [r2]
	ldr r3, _0802EE08
	ldr r0, _0802EE00
	stm r0!, {r1, r2, r3}
	ldr r0, _0802EDD0
	movs r1, #0
	str r1, [r0]
	movs r1, #0
	mvns r1, r1
	ldr r0, _0802EDCC
	str r1, [r0]
	ldr r0, _0802EE0C
	str r1, [r0]
	ldr r0, _0802EE10
	movs r1, #0
	strh r1, [r0]
	ldrh r1, [r0]
	ldr r2, _0802EE14
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0802EDE0
	movs r1, #0x80
	strb r1, [r0]
	movs r1, #0x80
	strb r1, [r0, #4]
	ldr r0, _0802EE10
	ldr r1, [r0]
	ldr r2, _0802EE18
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0802EE1C
	ldr r1, [r0]
	movs r2, #0xc0
	bics r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	bl sub_0802F324
	bl sub_0802F34C
	movs r0, #0x80
	bl music_set_volume
	movs r0, #0x80
	bl sfx_set_volume
	bl sub_0802F364
	bl sub_0802F372
	ldr r1, _0802EE20
	ldr r2, _0802EE24
	ldr r3, _0802EE28
	ldr r3, [r3]
	ldr r4, _0802EE2C
	cmp r3, r4
	ble _0802EC32
	push {r0, r1}
	push {lr}
	ldr r0, _0802EE30
	ldr r1, _0802EE34
	mov lr, r1
	ldr r1, _0802EDC8
	bx r1

	.global sub_0802EC2A
	.thumb_func
	.type sub_0802EC2A, %function
sub_0802EC2A: @ 0802EC2A
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802EC32:
	lsrs r3, r3, #2
	ldr r0, _0802EE38
	orrs r3, r0
	ldr r0, _0802EE00
	stm r0!, {r1, r2, r3}
	bl sub_0802F26C
	ldr r0, _0802EE3C
	ldr r1, _0802EE40
	str r1, [r0]
	ldr r0, _0802EE44
	ldr r1, _0802EE48
	str r1, [r0]
	ldr r0, _0802EE4C
	bl sub_0802F1D0
	movs r0, #8
	bl sub_0802F266
	add sp, #4
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global audio_update
	.thumb_func
	.type audio_update, %function
audio_update: @ 0802EC6C
	movs r0, #0
	ldr r1, _0802EE50
	str r0, [r1]
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	ldr r0, _0802EE0C
	ldr r0, [r0]
	ldr r7, _0802EDBC
	ldr r7, [r7]
	cmp r0, r7
	blt _0802ECA2
	push {r0, r1}
	push {lr}
	ldr r0, _0802EDC0
	ldr r1, _0802EE54
	mov lr, r1
	ldr r1, _0802EDC8
	bx r1

	.global sub_0802EC9A
	.thumb_func
	.type sub_0802EC9A, %function
sub_0802EC9A: @ 0802EC9A
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802ECA2:
	ldr r0, _0802EDCC
	ldr r1, [r0]
	cmp r1, #0
	bmi _0802ED26
	movs r2, #0
	mvns r2, r2
	str r2, [r0]
	ldr r0, _0802EE0C
	str r1, [r0]
	ldr r0, _0802EE58
	movs r2, #0x80
	movs r3, #0
_0802ECBA:
	subs r2, #4
	str r3, [r0, r2]
	bne _0802ECBA
	ldr r0, _0802EE3C
	ldr r0, [r0]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, [r0]
	cmp r3, #0x10
	blt _0802ECE4
	push {r0, r1}
	push {lr}
	ldr r0, _0802EE5C
	ldr r1, _0802EE60
	mov lr, r1
	ldr r1, _0802EDC8
	bx r1

	.global sub_0802ECDC
	.thumb_func
	.type sub_0802ECDC, %function
sub_0802ECDC: @ 0802ECDC
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802ECE4:
	ldr r2, _0802EE64
	str r3, [r2]
	ldr r1, [r0, #4]
	ldr r2, _0802EE68
	str r1, [r2]
	ldr r1, [r0, #8]
	ldr r2, _0802EE6C
	ldr r4, _0802EE38
	orrs r3, r4
	ldr r4, _0802EE00
	stm r4!, {r1, r2, r3}
	ldr r1, [r0, #0xc]
	ldr r2, _0802EE70
	str r1, [r2]
	ldr r1, [r0, #0x10]
	ldr r2, _0802EE74
	str r1, [r2]
	ldr r0, _0802EE58
	movs r1, #0
	adds r2, r1, #0
	stm r0!, {r1, r2}
	ldr r0, _0802EE78
	movs r1, #1
	str r1, [r0]
	ldr r0, _0802EE7C
	movs r1, #0
	str r1, [r0]
	bl sub_0802F324
	bl sub_0802F292
	bl sub_0802F2A2
_0802ED26:
	bl sub_0802F2B0
	ldr r0, _0802EE80
	ldr r1, [r0]
	cmp r1, #1
	beq _0802ED52
	ldr r0, _0802EE0C
	ldr r1, [r0]
	cmp r1, #0
	bmi _0802ED52
	mov r0, pc
	adds r0, #7
	mov lr, r0
	ldr r0, _0802EE84
	bx r0
_0802ED44:
	bl sub_0802EEA0
	mov r0, pc
	adds r0, #7
	mov lr, r0

	.global sub_0802ED4E
	.thumb_func
	.type sub_0802ED4E, %function
sub_0802ED4E: @ 0802ED4E
	ldr r0, _0802EE88
	bx r0
_0802ED52:
	bl sub_0802EED2
	mov r0, pc
	adds r0, #7
	mov lr, r0
	ldr r0, _0802EE8C
	bx r0
_0802ED60:
	mov r0, pc
	adds r0, #7
	mov lr, r0

	.global sub_0802ED66
	.thumb_func
	.type sub_0802ED66, %function
sub_0802ED66: @ 0802ED66
	ldr r0, _0802EE90
	bx r0
_0802ED6A:
	ldr r0, _0802EE80
	ldr r1, [r0]
	cmp r1, #1
	beq _0802ED7C
	mov r0, pc
	adds r0, #7
	mov lr, r0

	.global sub_0802ED78
	.thumb_func
	.type sub_0802ED78, %function
sub_0802ED78: @ 0802ED78
	ldr r0, _0802EE94
	bx r0
_0802ED7C:
	mov r0, pc
	adds r0, #7
	mov lr, r0

	.global sub_0802ED82
	.thumb_func
	.type sub_0802ED82, %function
sub_0802ED82: @ 0802ED82
	ldr r0, _0802EE98
	bx r0
_0802ED86:
	ldr r0, _0802EE0C
	ldr r0, [r0]
	ldr r7, _0802EDBC
	ldr r7, [r7]
	cmp r0, r7
	blt _0802EDA8
	push {r0, r1}

	.global sub_0802ED94
	.thumb_func
	.type sub_0802ED94, %function
sub_0802ED94: @ 0802ED94
	push {lr}
	ldr r0, _0802EDC0
	ldr r1, _0802EE9C
	mov lr, r1
	ldr r1, _0802EDC8
	bx r1

	.global audio_song_load
	.thumb_func
	.type audio_song_load, %function
audio_song_load: @ 0802EDA0
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802EDA8:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0802EDBC:
	.4byte gUnk_08BB4F84
_0802EDC0:
	.4byte gUnk_08030604
_0802EDC4:
	.4byte sub_0802EB04
_0802EDC8:
	.4byte audio_error
_0802EDCC:
	.4byte 0x03005A7C
_0802EDD0:
	.4byte 0x03005A74
_0802EDD4:
	.4byte gUnk_080537B0
_0802EDD8:
	.4byte gUnk_080537B8
_0802EDDC:
	.4byte 0x040000C6
_0802EDE0:
	.4byte 0x040000A0
_0802EDE4:
	.4byte 0xF6000000
_0802EDE8:
	.4byte 0x040000BC
_0802EDEC:
	.4byte 0x04000084
_0802EDF0:
	.4byte 0x04000102
_0802EDF4:
	.4byte gUnk_080537D0
_0802EDF8:
	.4byte gUnk_080537B4
_0802EDFC:
	.4byte 0x85000038
_0802EE00:
	.4byte 0x040000C8
_0802EE04:
	.4byte gUnk_080537BC
_0802EE08:
	.4byte 0x85000058
_0802EE0C:
	.4byte 0x03005A78
_0802EE10:
	.4byte 0x04000082
_0802EE14:
	.4byte 0x00008800
_0802EE18:
	.4byte 0x0000030C
_0802EE1C:
	.4byte 0x04000089
_0802EE20:
	.4byte __audio_lma
_0802EE24:
	.4byte sub_03006498
_0802EE28:
	.4byte gUnk_0802D830
_0802EE2C:
	.4byte 0x000013EC
_0802EE30:
	.4byte gUnk_0803047A
_0802EE34:
	.4byte sub_0802EC2A
_0802EE38:
	.4byte 0x84000000
_0802EE3C:
	.4byte 0x0202F010
_0802EE40:
	.4byte gSongTable
_0802EE44:
	.4byte 0x0202F00C
_0802EE48:
	.4byte gInstrumentTable
_0802EE4C:
	.4byte 0x00003443
_0802EE50:
	.4byte 0x0202F01C
_0802EE54:
	.4byte sub_0802EC9A
_0802EE58:
	.4byte 0x03005A80
_0802EE5C:
	.4byte gUnk_080304AF
_0802EE60:
	.4byte sub_0802ECDC
_0802EE64:
	.4byte 0x0300640C
_0802EE68:
	.4byte 0x03005B04
_0802EE6C:
	.4byte 0x03006458
_0802EE70:
	.4byte 0x03006410
_0802EE74:
	.4byte 0x03006454
_0802EE78:
	.4byte 0x03005B00
_0802EE7C:
	.4byte 0x03005B08
_0802EE80:
	.4byte 0x0202F018
_0802EE84:
	.4byte audio_seq_step
_0802EE88:
	.4byte sub_030067CC
_0802EE8C:
	.4byte sub_030067B4
_0802EE90:
	.4byte sub_030064E4
_0802EE94:
	.4byte sub_03006654
_0802EE98:
	.4byte sub_0300663C
_0802EE9C:
	.4byte audio_song_load

	.global sub_0802EEA0
	.thumb_func
	.type sub_0802EEA0, %function
sub_0802EEA0: @ 0802EEA0
	ldr r0, _0802F124
	ldr r7, _0802F128
	movs r1, #0x80
	movs r6, #0
_0802EEA8:
	ldr r2, [r0, r1]
	cmp r2, #0
	bne _0802EEB6
	str r6, [r7, r1]
_0802EEB0:
	subs r1, #8
	bne _0802EEA8
	bx lr
_0802EEB6:
	lsrs r3, r1, #3
	subs r3, #1
	ldr r4, _0802F12C
	movs r5, #4
	muls r5, r3, r5
	ldr r3, [r4, r5]
	ldr r3, [r3, #0x3c]
	adds r4, r0, r1
	ldr r5, [r4, #4]
	adds r3, r5, r3
	ldr r5, _0802F130
	ands r3, r5
	str r3, [r4, #4]
	b _0802EEB0

	.global sub_0802EED2
	.thumb_func
	.type sub_0802EED2, %function
sub_0802EED2: @ 0802EED2
	ldr r5, _0802F134
	movs r3, #0
	ldr r6, _0802F138
	ldr r6, [r6]
	ldr r0, _0802F13C
_0802EEDC:
	ldrb r4, [r5, r3]
	cmp r4, #0x11
	beq _0802EEEC
_0802EEE2:
	adds r0, #4
	adds r3, #0x30
	cmp r3, r6
	blt _0802EEDC
	bx lr
_0802EEEC:
	ldr r1, [r0]
	subs r1, #1
	bmi _0802EEFA
	str r1, [r0]
	bne _0802EEFA
	movs r1, #0x12
	strb r1, [r5, r3]
_0802EEFA:
	b _0802EEE2

	.global sub_0802EEFC
	.thumb_func
	.type sub_0802EEFC, %function
sub_0802EEFC: @ 0802EEFC
	push {lr}
	ldr r5, _0802F134
	movs r3, #0
	ldr r6, _0802F138
	ldr r6, [r6]
_0802EF06:
	ldrb r4, [r5, r3]
	cmp r4, #0x10
	beq _0802EF28
	adds r3, #0x30
	cmp r3, r6
	blt _0802EF06
	movs r3, #0
_0802EF14:
	ldrb r4, [r5, r3]
	cmp r4, #0x12
	beq _0802EF28
	adds r3, #0x30
	cmp r3, r6
	blt _0802EF14
	movs r1, #0
	mvns r1, r1
	adds r0, r1, #0
	b _0802EF76
_0802EF28:
	adds r5, r5, r3
	movs r4, #0
	mvns r4, r4
	adds r3, #0x30
_0802EF30:
	adds r4, #1
	subs r3, #0x30
	bne _0802EF30
	push {r4}
	ldr r3, _0802F140
	ldr r7, [r3]
	adds r7, #1
	movs r6, #1
	cmn r7, r6
	bne _0802EF46
	adds r7, #1
_0802EF46:
	str r7, [r3]
	ldr r3, _0802F144
	lsls r4, r4, #2
	str r7, [r3, r4]
	push {r7}
	lsls r0, r0, #2
	ldr r4, _0802F148
	ldr r4, [r4]
	ldr r3, [r4, r0]
	ldr r0, [r3, #0xc]
	mov sb, r0
	adds r4, r0, #0
	ldr r7, [r3, #4]
	mov r8, r1
	adds r1, r2, #0
	adds r2, r3, #0
	mov r3, r8
	mov r0, pc
	adds r0, #7
	mov lr, r0
	ldr r0, _0802F14C
	bx r0
_0802EF72:
	pop {r0}
	pop {r1}
_0802EF76:
	pop {r2}
	bx r2

	.global snd_is_playing
	.thumb_func
	.type snd_is_playing, %function
snd_is_playing: @ 0802EF7A
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl snd_find
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global snd_find
	.thumb_func
	.type snd_find, %function
snd_find: @ 0802EF9E
	movs r6, #0
	ldr r2, _0802F134
	movs r3, #0
	ldr r5, _0802F138
	ldr r5, [r5]
_0802EFA8:
	ldrb r4, [r2, r3]
	cmp r4, #0x10
	bne _0802EFBA
_0802EFAE:
	adds r3, #0x30
	adds r6, #4
	cmp r3, r5
	blt _0802EFA8
	movs r0, #0
	mov pc, lr
_0802EFBA:
	ldr r4, _0802F144
	ldr r4, [r4, r6]
	cmp r0, r4
	bne _0802EFAE
	movs r0, #1
	mov pc, lr

	.global snd_set_pitch
	.thumb_func
	.type snd_set_pitch, %function
snd_set_pitch: @ 0802EFC6
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl snd_find
	cmp r0, #0
	beq _0802EFE0
	ldr r2, _0802F150
	str r1, [r2, r3]
_0802EFE0:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global snd_set_volume
	.thumb_func
	.type snd_set_volume, %function
snd_set_volume: @ 0802EFF2
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl snd_find
	cmp r0, #0
	beq _0802F00C
	ldr r2, _0802F154
	strb r1, [r2, r3]
_0802F00C:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global snd_stop
	.thumb_func
	.type snd_stop, %function
snd_stop: @ 0802F01E
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl snd_find
	cmp r0, #0
	beq _0802F03A
	ldr r2, _0802F134
	movs r1, #0x10
	strb r1, [r2, r3]
_0802F03A:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global snd_stop_all
	.thumb_func
	.type snd_stop_all, %function
snd_stop_all: @ 0802F04C
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl sub_0802F34C
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global music_stop
	.thumb_func
	.type music_stop, %function
music_stop: @ 0802F070
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl sub_0802F324
	ldr r0, _0802F158
	movs r1, #0
	mvns r1, r1
	str r1, [r0]
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global music_set_volume
	.thumb_func
	.type music_set_volume, %function
music_set_volume: @ 0802F09C
	ldr r1, _0802F15C
	str r0, [r1]
	bx lr

	.global sfx_set_volume
	.thumb_func
	.type sfx_set_volume, %function
sfx_set_volume: @ 0802F0A2
	ldr r1, _0802F160
	str r0, [r1]
	bx lr
	.byte 0x2E, 0x49, 0x08, 0x68, 0x70, 0x47

	.global sub_0802F0AE
	.thumb_func
	.type sub_0802F0AE, %function
sub_0802F0AE: @ 0802F0AE
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	adds r1, r0, #0
	mov r0, pc
	adds r0, #7
	mov lr, r0
	ldr r0, _0802F168
	bx r0
	.byte 0xF8, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xB3, 0x46, 0xBC, 0x46, 0xF0, 0xBC, 0x02, 0xBC
	.byte 0x08, 0x47

	.global audio_pause
	.thumb_func
	.type audio_pause, %function
audio_pause: @ 0802F0DA
	movs r1, #1
	ldr r0, _0802F16C
	str r1, [r0]
	bx lr

	.global audio_resume
	.thumb_func
	.type audio_resume, %function
audio_resume: @ 0802F0E2
	movs r1, #0
	ldr r0, _0802F16C
	str r1, [r0]
	bx lr

	.global sub_0802F0EA
	.thumb_func
	.type sub_0802F0EA, %function
sub_0802F0EA: @ 0802F0EA
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	bl snd_find
	cmp r0, #0
	beq _0802F10C
	ldr r2, _0802F134
	ldrb r1, [r2, r3]
	cmp r1, #0x11
	bne _0802F10C
	movs r1, #0x12
	strb r1, [r2, r3]
_0802F10C:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global snd_play
	.thumb_func
	.type snd_play, %function
snd_play: @ 0802F11E
	movs r3, #0
	b _0802F170
	.byte 0x25, 0xE0
_0802F124:
	.4byte 0x03006284
_0802F128:
	.4byte 0x03006288
_0802F12C:
	.4byte 0x03006414
_0802F130:
	.4byte 0x00FFFFFF
_0802F134:
	.4byte 0x0300632C
_0802F138:
	.4byte gUnk_080537C8
_0802F13C:
	.4byte 0x030063EC
_0802F140:
	.4byte 0x0202F014
_0802F144:
	.4byte 0x030063FC
_0802F148:
	.4byte 0x0202F00C
_0802F14C:
	.4byte sub_03006498
_0802F150:
	.4byte 0x03006350
_0802F154:
	.4byte 0x0300632F
_0802F158:
	.4byte 0x03005A78
_0802F15C:
	.4byte 0x030078C4
_0802F160:
	.4byte 0x030078C8
	.byte 0x08, 0x5B, 0x00, 0x03
_0802F168:
	.4byte sub_03006A20
_0802F16C:
	.4byte 0x0202F018
_0802F170:
	push {r4, r5, r6, r7, lr}
	mov lr, r3
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	push {lr}
	ldr r7, _0802F3E8
	ldr r7, [r7]
	cmp r0, r7
	blt _0802F1A0
	push {r0, r1}
	push {lr}
	ldr r0, _0802F3EC
	ldr r1, _0802F3F0
	mov lr, r1
	ldr r1, _0802F3F4
	bx r1

	.global sub_0802F198
	.thumb_func
	.type sub_0802F198, %function
sub_0802F198: @ 0802F198
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	.2byte 0xEFFF @ debug trap
_0802F1A0:
	bl sub_0802EEFC
	pop {r3}
	cmp r1, #0
	bmi _0802F1B0
	ldr r5, _0802F3F8
	lsls r6, r1, #2
	str r3, [r5, r6]
_0802F1B0:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global sub_0802F1C2
	.thumb_func
	.type sub_0802F1C2, %function
sub_0802F1C2: @ 0802F1C2
	ldr r0, _0802F3FC
	movs r2, #0
	strh r2, [r0]
	ldr r0, _0802F400
	movs r1, #0
	strh r1, [r0]
	bx lr

	.global sub_0802F1D0
	.thumb_func
	.type sub_0802F1D0, %function
sub_0802F1D0: @ 0802F1D0
	push {r4, r5, r6, r7, lr}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	mov r7, ip
	push {r3, r4, r5, r6, r7}
	ldr r1, _0802F404
	cmp r0, r1
	ble _0802F1FE
	push {r0, r1}
	push {lr}
	ldr r0, _0802F408
	ldr r1, _0802F40C
	mov lr, r1
	ldr r1, _0802F3F4
	bx r1

	.global sub_0802F1F2
	.thumb_func
	.type sub_0802F1F2, %function
sub_0802F1F2: @ 0802F1F2
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	movs r0, #0
	mvns r0, r0
	b _0802F24E
_0802F1FE:
	ldr r1, _0802F410
	str r0, [r1]
	ldr r1, _0802F414
	ldr r2, _0802F418
	ldr r3, _0802F41C
	movs r4, #0xb0
	cmp r0, r1
	beq _0802F234
	ldr r1, _0802F420
	ldr r2, _0802F424
	ldr r3, _0802F428
	movs r4, #0xe0
	cmp r0, r1
	beq _0802F234
	ldr r1, _0802F42C
	ldr r2, _0802F430
	ldr r3, _0802F434
	ldr r4, _0802F438
	cmp r0, r1
	beq _0802F234
	ldr r1, _0802F404
	ldr r2, _0802F43C
	ldr r3, _0802F440
	ldr r4, _0802F444
	cmp r0, r1
	beq _0802F234
	.2byte 0xEFFF @ debug trap
_0802F234:
	ldr r7, _0802F448
	str r2, [r7]
	ldr r7, _0802F44C
	str r3, [r7]
	ldr r7, _0802F450
	str r4, [r7]
	ldr r0, _0802F454
	ldr r1, _0802F448
	ldr r1, [r1]
	strh r1, [r0]
	movs r1, #0x80
	strh r1, [r0, #2]
	movs r0, #0
_0802F24E:
	pop {r3, r4, r5, r6, r7}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	mov ip, r7
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.global music_current
	.thumb_func
	.type music_current, %function
music_current: @ 0802F260
	ldr r0, _0802F458
	ldr r0, [r0]
	bx lr

	.global sub_0802F266
	.thumb_func
	.type sub_0802F266, %function
sub_0802F266: @ 0802F266
	ldr r1, _0802F45C
	str r0, [r1]
	bx lr

	.global sub_0802F26C
	.thumb_func
	.type sub_0802F26C, %function
sub_0802F26C: @ 0802F26C
	ldr r0, _0802F460
_0802F26E:
	ldrb r1, [r0]
	cmp r1, #0xa0
	beq _0802F26E
_0802F274:
	ldrb r1, [r0]
	cmp r1, #0xa0
	bne _0802F274
	mov pc, lr

	.global audio_error
	.thumb_func
	.type audio_error, %function
audio_error: @ 0802F27C
	push {r2, r3, lr}
	bl AGBPrintf
	bl AGBPrintFlush
	movs r0, #1
	ldr r1, _0802F464
	str r0, [r1]
	pop {r2, r3}
	pop {r0}
	bx r0

	.global sub_0802F292
	.thumb_func
	.type sub_0802F292, %function
sub_0802F292: @ 0802F292
	movs r1, #0x20
	lsls r1, r1, #8
	ldr r0, _0802F468
	movs r2, #0x40
_0802F29A:
	subs r2, #4
	str r1, [r0, r2]
	bne _0802F29A
	bx lr

	.global sub_0802F2A2
	.thumb_func
	.type sub_0802F2A2, %function
sub_0802F2A2: @ 0802F2A2
	movs r1, #0
	ldr r0, _0802F46C
	movs r2, #0x80
_0802F2A8:
	subs r2, #8
	str r1, [r0, r2]
	bne _0802F2A8
	bx lr

	.global sub_0802F2B0
	.thumb_func
	.type sub_0802F2B0, %function
sub_0802F2B0: @ 0802F2B0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	movs r5, #0
	movs r6, #0
	ldr r0, _0802F470
	ldr r7, _0802F450
	ldr r7, [r7]
	lsrs r7, r7, #1
	cmp r7, #0x58
	beq _0802F2D6
	cmp r7, #0x70
	beq _0802F300
	cmp r7, #0x98
	beq _0802F2F2
	cmp r7, #0xb0
	beq _0802F2E8
	.2byte 0xEFFF @ debug trap
_0802F2D6:
	movs r7, #0
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2}
	b _0802F322
_0802F2E8:
	movs r7, #0
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3}
_0802F2F2:
	movs r7, #0
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5}
_0802F300:
	movs r7, #0
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
	stm r0!, {r1, r2, r3, r4, r5, r6, r7}
_0802F322:
	bx lr

	.global sub_0802F324
	.thumb_func
	.type sub_0802F324, %function
sub_0802F324: @ 0802F324
	ldr r0, _0802F474
	ldr r3, _0802F478
	ldr r6, _0802F47C
	movs r7, #0
	movs r4, #1
	movs r5, #0x10
	movs r1, #0x10
	ldr r2, _0802F480
	ldr r2, [r2]
_0802F336:
	subs r4, #1
	bne _0802F340
	subs r5, #1
	ldr r4, _0802F484
	ldr r4, [r4]
_0802F340:
	subs r2, #0x30
	strb r1, [r0, r2]
	strb r5, [r3, r2]
	str r7, [r6, r2]
	bne _0802F336
	bx lr

	.global sub_0802F34C
	.thumb_func
	.type sub_0802F34C, %function
sub_0802F34C: @ 0802F34C
	ldr r0, _0802F488
	movs r5, #0
	mvns r5, r5
	ldr r1, _0802F48C
	ldr r1, [r1]
	movs r2, #0x10
_0802F358:
	strb r2, [r0]
	strb r5, [r0, #6]
	adds r0, #0x30
	subs r1, #1
	bne _0802F358
	bx lr

	.global sub_0802F364
	.thumb_func
	.type sub_0802F364, %function
sub_0802F364: @ 0802F364
	ldr r0, _0802F490
	movs r1, #0x10
	movs r2, #0x7f
_0802F36A:
	subs r1, #1
	strb r2, [r0, r1]
	bne _0802F36A
	bx lr

	.global sub_0802F372
	.thumb_func
	.type sub_0802F372, %function
sub_0802F372: @ 0802F372
	ldr r0, _0802F494
	movs r1, #0x10
	movs r2, #0
_0802F378:
	subs r1, #1
	strb r2, [r0, r1]
	bne _0802F378
	bx lr

	.global sub_0802F380
	.thumb_func
	.type sub_0802F380, %function
sub_0802F380: @ 0802F380
	push {r0, r1, r2, r3, r4}
	movs r4, #6
	ldrb r0, [r5, r4]
	ldr r1, _0802F498
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r1]
	push {r0, r1}
	push {lr}
	ldr r1, _0802F49C
	mov lr, r1
	ldr r1, _0802F3F4
	bx r1

	.global audio_fx_start
	.thumb_func
	.type audio_fx_start, %function
audio_fx_start: @ 0802F39C
	pop {r0}
	mov lr, r0
	pop {r0, r1}
	pop {r0, r1, r2, r3, r4}
	ldr r0, _0802F4A0
	bx r0
	.global gUnk_0802F3A8
gUnk_0802F3A8:
	.4byte gUnk_0802FC44
	.4byte gUnk_0802FCC7
	.4byte gUnk_0802FD4A
	.4byte gUnk_0802FDCD
	.4byte gUnk_0802FE50
	.4byte gUnk_0802FED3
	.4byte gUnk_0802FF56
	.4byte gUnk_0802FFD9
	.4byte gUnk_0803005C
	.4byte gUnk_080300DF
	.4byte gUnk_08030162
	.4byte gUnk_080301E6
	.4byte gUnk_0803026A
	.4byte gUnk_080302EE
	.4byte gUnk_08030372
	.4byte gUnk_080303F6
_0802F3E8:
	.4byte gUnk_08BB4F88
_0802F3EC:
	.4byte gUnk_080305E4
_0802F3F0:
	.4byte sub_0802F198
_0802F3F4:
	.4byte audio_error
_0802F3F8:
	.4byte 0x030063EC
_0802F3FC:
	.4byte 0x040000C6
_0802F400:
	.4byte 0x04000084
_0802F404:
	.4byte 0x00005220
_0802F408:
	.4byte gUnk_08030547
_0802F40C:
	.4byte sub_0802F1F2
_0802F410:
	.4byte 0x0202F000
_0802F414:
	.4byte 0x00002910
_0802F418:
	.4byte 0xFFFFF9C4
_0802F41C:
	.4byte 0x018F0064
_0802F420:
	.4byte 0x00003443
_0802F424:
	.4byte 0xFFFFFB1A
_0802F428:
	.4byte 0x01397FC3
_0802F42C:
	.4byte 0x000046ED
_0802F430:
	.4byte 0xFFFFFC64
_0802F434:
	.4byte 0x00E70086
_0802F438:
	.4byte 0x00000130
_0802F43C:
	.4byte 0xFFFFFCE2
_0802F440:
	.4byte 0x00C78032
_0802F444:
	.4byte 0x00000160
_0802F448:
	.4byte 0x0202EFFC
_0802F44C:
	.4byte 0x0202F004
_0802F450:
	.4byte 0x0202F008
_0802F454:
	.4byte 0x04000100
_0802F458:
	.4byte 0x03005A78
_0802F45C:
	.4byte 0x0202EFF8
_0802F460:
	.4byte 0x04000006
_0802F464:
	.4byte 0x0202F01C
_0802F468:
	.4byte 0x0300624C
_0802F46C:
	.4byte 0x0300628C
_0802F470:
	.4byte 0x03005F8C
_0802F474:
	.4byte 0x02003020
_0802F478:
	.4byte 0x02003026
_0802F47C:
	.4byte 0x02003028
_0802F480:
	.4byte gUnk_080537C0
_0802F484:
	.4byte gUnk_080537D4
_0802F488:
	.4byte 0x0300632C
_0802F48C:
	.4byte gUnk_080537CC
_0802F490:
	.4byte 0x0300630C
_0802F494:
	.4byte 0x0300631C
_0802F498:
	.4byte gUnk_0802F3A8
_0802F49C:
	.4byte audio_fx_start
_0802F4A0:
	.4byte 0x0802DFE0
