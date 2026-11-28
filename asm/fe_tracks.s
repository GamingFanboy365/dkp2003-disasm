@ asm/fe_tracks.s: ROM 0x0168D4-0x017F54 (rom, VMA 0x080168D4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global fe_tracks_init
	.thumb_func
	.type fe_tracks_init, %function
fe_tracks_init: @ 080168D4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r0, _08016930
	ldr r1, _08016934
	sub sp, #0xc
	ldr r5, _0801691C
	bl AGBPrintf
	ldr r0, _08016938
	ldr r4, _0801693C
	strh r5, [r0]
	ldr r6, _08016920
	ldrh r2, [r4]
	ldr r3, _08016940
	orrs r2, r6
	ldr r1, _08016944
	strh r2, [r4]
	movs r2, #0x80
	ldr r4, _08016924
	str r3, [r1]
	strh r6, [r0]
	lsls r1, r2, #0x13
	ldr r6, _08016928
	strh r4, [r1]
	ldr r0, _0801692C
	adds r1, #8
	strh r6, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #6
	b _08016948
	.byte 0x00, 0x00
_0801691C:
	.4byte 0x00000000
_08016920:
	.4byte 0x00000001
_08016924:
	.4byte 0x00001240
_08016928:
	.4byte 0x00000108
_0801692C:
	.4byte 0x00000084
_08016930:
	.4byte gUnk_0805140C
_08016934:
	.4byte gUnk_08051418
_08016938:
	.4byte 0x04000208
_0801693C:
	.4byte 0x04000200
_08016940:
	.4byte vblank_handler
_08016944:
	.4byte gIrqHandler
_08016948:
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	ldr r4, _08016984
	adds r1, #2
	strh r5, [r1]
	ldr r6, _08016988
	adds r1, #0x32
	strh r4, [r1]
	ldr r0, _0801698C
	adds r1, #2
	strh r6, [r1]
	ldr r5, _08016990
	subs r1, #0xa
	strh r0, [r1]
	ldr r4, _08016994
	adds r1, #4
	strh r5, [r1]
	ldr r6, _08016998
	adds r1, #0xc
	strh r4, [r1]
	adds r1, #2
	strh r6, [r1]
	bl sub_08018C58
	ldr r0, _0801699C
	mov r1, sp
	b _080169A0
_08016984:
	.4byte 0x00000033
_08016988:
	.4byte 0x00000012
_0801698C:
	.4byte 0x00007AE6
_08016990:
	.4byte 0x00002C9A
_08016994:
	.4byte 0x00002261
_08016998:
	.4byte 0x0000030F
_0801699C:
	.4byte 0x0000F3FF
_080169A0:
	adds r1, #0xa
	strh r0, [r1]
	ldr r5, _080169EC
	ldr r0, _080169F0
	ldr r4, _080169F4
	str r1, [r0]
	ldr r3, _080169E8
	str r5, [r0, #4]
	ldr r6, _080169F8
	str r4, [r0, #8]
	ldr r5, _080169FC
	ldr r2, [r0, #8]
	strh r3, [r1]
	str r1, [r0]
	str r6, [r0, #4]
	str r5, [r0, #8]
	add r4, sp, #4
	movs r5, #0
	ldr r2, [r0, #8]
	movs r3, #0xe0
	str r5, [sp, #4]
	str r4, [r0]
	ldr r4, _08016A00
	lsls r6, r3, #0x13
	str r6, [r0, #4]
	str r4, [r0, #8]
	ldr r3, _08016A04
	ldr r2, [r0, #8]
	strh r5, [r1]
	str r1, [r0]
	ldr r1, _08016A08
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	b _08016A0C
	.byte 0x00, 0x00
_080169E8:
	.4byte 0x0000FFFF
_080169EC:
	.4byte 0x06000800
_080169F0:
	.4byte 0x040000D4
_080169F4:
	.4byte 0x81000400
_080169F8:
	.4byte 0x0600FFE0
_080169FC:
	.4byte 0x81000010
_08016A00:
	.4byte 0x85000100
_08016A04:
	.4byte 0x06010000
_08016A08:
	.4byte 0x81004000
_08016A0C:
	bl fe_spr_init
	ldr r4, _08016AE0
	ldr r6, _08016AE4
	str r5, [r4, #8]
	str r5, [r4]
	str r5, [r4, #4]
	movs r1, #0
	ldrsh r3, [r6, r1]
	cmp r3, #2
	bne _08016A24
	b _08016BE2
_08016A24:
	cmp r3, #2
	ble _08016A2A
	b _08016BBA
_08016A2A:
	cmp r3, #1
	bne _08016A30
	b _08016B9C
_08016A30:
	ldr r0, _08016AE8
	ldr r1, _08016AEC
	str r0, [sp]
	ldr r2, _08016AF0
	ldr r0, _08016AF4
	movs r3, #0x8e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08016A46:
	ldr r6, _08016AF8
	movs r1, #0
	str r1, [r6]
	str r1, [r6, #4]
	str r1, [r6, #8]
	bl sound_disable
	bl sub_08018654
	ldr r1, _08016AE0
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0xc]
	movs r6, #0
	subs r0, r3, r2
	cmp r6, r0
	blt _08016A68
	b _08016B6E
_08016A68:
	ldr r2, _08016AFC
	ldr r7, _08016B00
	mov sl, r2
	mov r8, r7
	ldr r2, _08016B04
	adds r7, r1, #0
	ldr r1, _08016B08
	movs r5, #0
	mov sb, r1
	mov fp, r2
_08016A7C:
	ldr r1, _08016B0C
	ldrh r0, [r1, #2]
	adds r4, r0, r1
	movs r1, #0x1c
	movs r0, #4
	bl sub_080185A8
	mov r3, sl
	str r0, [r5, r3]
	lsls r3, r0, #1
	ldrh r2, [r3, r4]
	ldr r1, _08016ABC
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _08016AC0
	ldr r2, _08016AC4
	strh r1, [r0, #6]
	ldr r1, _08016AC8
	strh r2, [r0, #4]
	strh r1, [r0, #0xc]
	ldr r2, _08016ACC
	ldr r1, _08016AD0
	strh r2, [r0, #0xa]
	strh r1, [r0, #0x10]
	mov r2, r8
	ldr r1, _08016AD4
	strh r2, [r0, #0xe]
	ldr r2, _08016AD8
	strh r1, [r0, #0x14]
	ldr r1, _08016ADC
	strh r2, [r0, #0x12]
	b _08016B10
_08016ABC:
	.4byte 0x00000004
_08016AC0:
	.4byte 0x00000000
_08016AC4:
	.4byte 0x00008010
_08016AC8:
	.4byte 0x00000008
_08016ACC:
	.4byte 0x00008030
_08016AD0:
	.4byte 0x00008050
_08016AD4:
	.4byte 0x0000000E
_08016AD8:
	.4byte 0x00000010
_08016ADC:
	.4byte 0x00000018
_08016AE0:
	.4byte 0x02024284
_08016AE4:
	.4byte gGameSetup
_08016AE8:
	.4byte gUnk_08051428
_08016AEC:
	.4byte gUnk_08051448
_08016AF0:
	.4byte gUnk_08051418
_08016AF4:
	.4byte gUnk_08051458
_08016AF8:
	.4byte 0x02024318
_08016AFC:
	.4byte 0x02024298
_08016B00:
	.4byte 0x0000400E
_08016B04:
	.4byte gCourses
_08016B08:
	.4byte gUnk_0863FDE8
_08016B0C:
	.4byte 0x02024394
_08016B10:
	mov r3, r8
	ldr r2, _08016B50
	strh r3, [r0, #2]
	strh r1, [r0, #0x18]
	mov r1, sl
	strh r3, [r0, #8]
	strh r2, [r0, #0x16]
	ldr r0, [r5, r1]
	bl sub_0801854C
	ldr r2, [r7, #0xc]
	movs r1, #0x2c
	adds r4, r2, r6
	muls r4, r1, r4
	mov r2, fp
	ldr r0, [r2, r4]
	movs r1, #0
	bl fe_get_text
	mov r1, sb
	adds r4, r0, #0
	bl fe_text_width
	movs r3, #0x70
	subs r2, r3, r0
	lsrs r0, r2, #0x1f
	adds r1, r2, r0
	asrs r2, r1, #1
	mov r1, sl
	ldr r0, [r5, r1]
	movs r3, #0
	b _08016B54
_08016B50:
	.4byte 0x00004068
_08016B54:
	str r0, [sp]
	mov r1, sb
	adds r0, r4, #0
	bl sub_080188B8
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #0xc]
	adds r6, #1
	subs r0, r1, r3
	adds r5, #4
	cmp r6, r0
	bge _08016B6E
	b _08016A7C
_08016B6E:
	bl sound_enable
	movs r0, #4
	bl music_play_if_changed
	bl fade_to_normal
	ldr r3, _08016BF0
	ldr r0, _08016BF4
	ldr r1, _08016BF8
	str r3, [r0]
	ldr r0, _08016BFC
	bl AGBPrintf
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08016B9C:
	movs r0, #0x15
	bl sub_0801931C
	adds r1, r6, #0
	str r5, [r4, #0xc]
	adds r1, #0x21
	ldrb r6, [r1]
	movs r1, #0x10
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	beq _08016BD0
	movs r2, #0x20
	str r2, [r4, #0x10]
	b _08016A46
_08016BBA:
	cmp r3, #5
	beq _08016BD4
	cmp r3, #6
	beq _08016BC4
	b _08016A30
_08016BC4:
	movs r0, #3
	bl sub_0801931C
	movs r2, #0x20
	movs r1, #0x24
	str r2, [r4, #0xc]
_08016BD0:
	str r1, [r4, #0x10]
	b _08016A46
_08016BD4:
	movs r0, #0x14
	bl sub_0801931C
	movs r6, #0x20
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	b _08016A46
_08016BE2:
	movs r0, #0x16
	bl sub_0801931C
	movs r0, #0x10
	str r5, [r4, #0xc]
	str r0, [r4, #0x10]
	b _08016A46
_08016BF0:
	.4byte fe_tracks_process
_08016BF4:
	.4byte gStateFunc
_08016BF8:
	.4byte gUnk_08051418
_08016BFC:
	.4byte gUnk_08051494

	.global fe_tracks_draw_times
	.thumb_func
	.type fe_tracks_draw_times, %function
fe_tracks_draw_times: @ 08016C00
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x3c
	mov fp, r1
	str r3, [sp, #0x24]
	mov r3, fp
	subs r3, #0x72
	str r0, [sp, #0x2c]
	str r2, [sp, #0x28]
	cmp r3, #0xf0
	ble _08016C20
	movs r3, #0xf0
_08016C20:
	mov r2, fp
	subs r2, #0xa
	cmp r2, #0xf0
	ble _08016C2A
	movs r2, #0xf0
_08016C2A:
	lsls r1, r3, #8
	ldr r7, _08016C70
	ldr r0, _08016C74
	ldr r6, _08016C6C
	orrs r1, r2
	strh r1, [r7]
	strh r6, [r0]
	ldr r3, [sp, #0x2c]
	movs r5, #0x2c
	adds r4, r3, #0
	muls r4, r5, r4
	ldr r2, _08016C78
	movs r1, #0
	ldr r0, [r2, r4]
	bl fe_get_text
	mov r4, fp
	ldr r7, _08016C7C
	movs r1, #0x30
	subs r4, #0x6c
	str r1, [sp]
	adds r3, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl fe_text_draw
	ldr r0, _08016C80
	movs r1, #0
	ldrsh r3, [r0, r1]
	cmp r3, #1
	bne _08016C6A
	b _08016E3E
_08016C6A:
	b _08016C84
_08016C6C:
	.4byte 0x00002C9A
_08016C70:
	.4byte 0x04000040
_08016C74:
	.4byte 0x04000044
_08016C78:
	.4byte gCourses
_08016C7C:
	.4byte gUnk_0863FDF8
_08016C80:
	.4byte gGameSetup
_08016C84:
	cmp r3, #2
	bne _08016C8A
	b _08016DF8
_08016C8A:
	ldr r6, _08016F14
	ldr r7, [r6]
	movs r4, #0x5a
	adds r5, r7, #0
	muls r5, r4, r5
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	ldr r2, _08016F18
	adds r0, r6, #0
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r7, _08016F1C
	mov sl, r0
	adds r0, r6, #0
	bl _call_via_r7
	lsls r5, r0, #0x10
	ldr r3, [sp, #0x2c]
	asrs r2, r5, #0x10
	movs r4, #0x2c
	str r2, [sp, #0x10]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r1, _08016F20
	adds r0, r2, #0
	mov r6, fp
	ldr r7, [sp, #0x28]
	adds r0, #0x24
	subs r6, #0x3c
	ldr r3, [r1, r0]
	str r6, [sp, #0x20]
	subs r7, #0x3c
	movs r6, #0
	mov sb, r7
	cmp r6, r3
	bge _08016D4E
	adds r0, r2, #0
	mov r8, r1
	str r3, [sp, #0x1c]
	adds r3, r2, #0
	adds r2, #0x20
	adds r0, #0x28
	adds r3, #0x1c
	str r2, [sp, #0x14]
	mov r2, r8
	str r3, [sp, #0x18]
	ldr r5, [r2, r0]
_08016CEC:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldr r0, [sp, #0x10]
	subs r4, #0x20
	subs r1, #0x20
	adds r7, r0, #0
	muls r7, r4, r7
	mov r2, sl
	muls r2, r1, r2
	adds r0, r7, r2
	movs r7, #0x17
	muls r7, r0, r7
	asrs r0, r7, #0x10
	ldr r7, [sp, #0x24]
	adds r2, r7, #0
	muls r2, r0, r2
	asrs r3, r2, #8
	ldr r2, [sp, #0x20]
	adds r0, r2, r3
	ldr r3, [sp, #0x10]
	adds r2, r3, #0
	muls r2, r1, r2
	mov r1, sl
	muls r1, r4, r1
	subs r2, r2, r1
	lsls r1, r2, #3
	adds r4, r1, r2
	asrs r1, r4, #0x10
	adds r4, r7, #0
	muls r4, r1, r4
	ldr r3, [sp, #0x18]
	ldr r7, [sp, #0x14]
	movs r2, #0
	asrs r1, r4, #8
	mov r4, r8
	add r1, sb
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [r4, r3]
	ldr r3, [r4, r7]
	bl fe_spr_plot
	ldr r1, [sp, #0x1c]
	adds r6, #1
	adds r5, #8
	cmp r6, r1
	blt _08016CEC
_08016D4E:
	movs r4, #0xc
	mov r7, sl
	muls r7, r4, r7
	ldr r1, _08016F24
	ldr r5, [r1]
	mov r8, r1
	ldr r1, _08016F28
	lsls r0, r5, #5
	asrs r6, r7, #8
	strh r6, [r0, r1]
	ldr r6, [sp, #0x10]
	adds r7, r1, #0
	asrs r2, r6, #3
	adds r7, #8
	strh r2, [r0, r7]
	adds r2, r6, #0
	muls r2, r4, r2
	adds r7, #8
	asrs r4, r2, #8
	strh r4, [r0, r7]
	mov r7, sl
	lsls r2, r7, #5
	rsbs r6, r2, #0
	asrs r4, r6, #8
	adds r1, #0x18
	strh r4, [r0, r1]
	ldr r2, [sp, #0x2c]
	movs r4, #0x2c
	muls r4, r2, r4
	ldr r6, _08016F20
	adds r3, r4, #0
	adds r3, #0x14
	ldr r2, [r6, r3]
	adds r4, #0x18
	movs r1, #0xc0
	ldr r0, [sp, #0x20]
	ldr r3, [r6, r4]
	lsls r5, r5, #9
	movs r4, #0
	lsls r6, r1, #2
	mov r1, sb
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	mov sl, r2
	bl fe_spr_plot
	str r4, [sp]
	str r6, [sp, #4]
	mov r2, r8
	ldr r0, [r2]
	mov r1, sb
	lsls r6, r0, #9
	mov r2, sl
	ldr r0, [sp, #0x20]
	adds r1, #8
	ldr r3, _08016F2C
	str r6, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	mov r6, r8
	ldr r1, [r6]
	adds r1, #1
	str r1, [r6]
	ldr r1, [sp, #0x28]
	mov r0, fp
	ldr r2, _08016F30
	ldr r3, _08016F34
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	add sp, #0x3c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08016DF8:
	ldr r6, _08016F38
	movs r2, #0xfc
	lsls r3, r2, #1
	ldr r1, _08016F3C
	adds r0, r6, r3
	ldrh r4, [r0]
	ldr r7, [r1, #8]
	movs r5, #1
	asrs r4, r7
	ands r4, r5
	cmp r4, #0
	bne _08016E12
	b _08016C8A
_08016E12:
	movs r1, #1
	ldr r0, _08016F40
	bl sub_080186E4
	ldr r6, _08016F14
	ldr r1, [r6]
	adds r2, r0, #0
	lsrs r5, r1, #3
	mov r0, fp
	movs r7, #7
	movs r4, #0
	ands r5, r7
	subs r0, #0x64
	movs r1, #0x86
	ldr r3, _08016F44
	str r5, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _08016C8A
_08016E3E:
	movs r1, #0
	movs r0, #0x7c
	bl fe_get_text
	movs r3, #0x78
	str r3, [sp]
	mov r8, r3
	adds r1, r7, #0
	adds r3, r4, #0
	movs r2, #0
	bl fe_text_draw
	movs r1, #0
	movs r0, #0x7d
	bl fe_get_text
	movs r6, #0x84
	adds r1, r7, #0
	adds r3, r4, #0
	movs r2, #0
	str r6, [sp]
	bl fe_text_draw
	ldr r2, [sp, #0x2c]
	mov sl, r6
	movs r6, #0x80
	lsls r5, r2, #3
	lsls r3, r6, #2
	ldr r0, _08016F38
	add r4, sp, #0x30
	adds r6, r5, r3
	ldrh r1, [r0, r6]
	adds r0, r4, #0
	bl sub_08018A14
	movs r1, #0x4e
	mov r0, r8
	rsbs r3, r1, #0
	str r0, [sp]
	add r3, fp
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	mov sb, r3
	bl fe_text_draw
	movs r2, #0xfe
	lsls r3, r2, #1
	ldr r0, _08016F38
	adds r5, r5, r3
	ldrh r1, [r0, r5]
	movs r2, #1
	adds r0, r4, #0
	bl sub_080187D0
	adds r1, r7, #0
	adds r0, r4, #0
	bl fe_text_width
	adds r2, r0, #0
	mov r0, fp
	subs r3, r0, r2
	mov r1, r8
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	subs r3, #0xd
	bl fe_text_draw
	ldr r1, _08016F38
	adds r3, r6, r1
	ldrh r1, [r3, #2]
	adds r0, r4, #0
	bl sub_08018A14
	mov r3, sl
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, sb
	movs r2, #0
	bl fe_text_draw
	ldr r0, _08016F38
	adds r3, r5, r0
	ldrh r1, [r3, #2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_080187D0
	adds r1, r7, #0
	adds r0, r4, #0
	bl fe_text_width
	adds r2, r0, #0
	mov r0, fp
	subs r3, r0, r2
	mov r1, sl
	str r1, [sp]
	subs r3, #0xd
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl fe_text_draw
	b _08016C8A
_08016F14:
	.4byte 0x03005660
_08016F18:
	.4byte sin_fx
_08016F1C:
	.4byte cos_fx
_08016F20:
	.4byte gCourses
_08016F24:
	.4byte 0x02024390
_08016F28:
	.4byte 0x0200000E
_08016F2C:
	.4byte gUnk_0863EEA0
_08016F30:
	.4byte gUnk_085C96D0
_08016F34:
	.4byte gUnk_0863FA20
_08016F38:
	.4byte gGameSetup
_08016F3C:
	.4byte 0x02024318
_08016F40:
	.4byte gUnk_08294EC0
_08016F44:
	.4byte gUnk_0863F180

	.global fe_tracks_process
	.thumb_func
	.type fe_tracks_process, %function
fe_tracks_process: @ 08016F48
	push {r4, r5, r6, lr}
	sub sp, #0x10
	bl fade_update
	ldr r1, _0801708C
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _08016F64
	ldr r5, _08017090
	ldr r4, [r5]
	ldr r0, _08017094
	lsrs r2, r4, #2
	strh r2, [r0]
_08016F64:
	bl sub_08017E1C
	bl fe_draw_title
	bl sub_08018D40
	ldr r6, _08017098
	ldr r1, [r6]
	cmp r1, #0
	ble _08016F9E
	ldr r2, _08017090
	ldr r0, [r2]
	movs r4, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08016F9E
	bl sub_080192E8
	movs r5, #0
	adds r3, r0, #0
	movs r1, #0x5c
	movs r0, #0x3d
	ldr r2, _0801709C
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_08016F9E:
	ldr r4, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr r0, [r6]
	subs r1, r4, r3
	subs r1, #1
	cmp r0, r1
	bge _08016FD6
	ldr r2, _08017090
	ldr r5, [r2]
	movs r1, #0x10
	ands r5, r1
	cmp r5, #0
	beq _08016FD6
	bl sub_080192E8
	movs r5, #0x80
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	lsls r4, r5, #6
	str r0, [sp, #0xc]
	movs r1, #0x72
	movs r0, #0x3d
	ldr r2, _0801709C
	str r4, [sp, #8]
	bl fe_spr_plot
_08016FD6:
	movs r4, #0
_08016FD8:
	ldr r2, [r6]
	adds r1, r2, r4
	subs r0, r1, #3
	cmp r0, #0
	blt _08017016
	ldr r5, [r6, #0x10]
	ldr r3, [r6, #0xc]
	subs r6, r5, r3
	cmp r0, r6
	bge _08017016
	lsls r2, r4, #4
	adds r1, r2, #0
	adds r1, #0x29
	ldr r6, _080170A0
	cmp r4, #3
	bne _08016FFA
	b _08017244
_08016FFA:
	ldr r5, _080170A4
_08016FFC:
	ldr r2, _080170A8
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r2, r6, #0
	movs r0, #5
	adds r3, r5, #0
	bl fe_spr_plot
_08017016:
	adds r4, #1
	cmp r4, #6
	bgt _0801701E
	b _08017240
_0801701E:
	bl sub_080192E8
	movs r4, #0
	adds r3, r0, #0
	movs r1, #0x67
	movs r0, #0x3d
	ldr r2, _080170AC
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r5, _080170B0
	ldr r3, [r5]
	cmp r3, #1
	bne _08017042
	b _0801722E
_08017042:
	cmp r3, #1
	ble _08017048
	b _0801720E
_08017048:
	cmp r3, #0
	bne _0801704E
	b _080171E6
_0801704E:
	ldr r6, _08017098
_08017050:
	ldr r0, [r5, #4]
	ldr r1, _08017088
	subs r2, r1, r0
	lsls r3, r2, #0x19
	ldr r1, _080170B4
	asrs r0, r3, #0x10
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	movs r1, #0x78
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r3, [r5, #8]
	asrs r1, r2, #0xc
	ldr r2, [r6, #0xc]
	adds r0, r2, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, #0xf0
	movs r2, #0xa0
	bl fe_tracks_draw_times
	ldr r3, [r6, #8]
	cmp r3, #1
	bne _08017086
	b _080171C2
_08017086:
	b _080170B8
_08017088:
	.4byte 0x00000020
_0801708C:
	.4byte gGameSetup
_08017090:
	.4byte 0x03005660
_08017094:
	.4byte 0x04000014
_08017098:
	.4byte 0x02024284
_0801709C:
	.4byte gUnk_08294DF0
_080170A0:
	.4byte 0x02024394
_080170A4:
	.4byte gUnk_0863EE20
_080170A8:
	.4byte 0x02024298
_080170AC:
	.4byte gUnk_082962A0
_080170B0:
	.4byte 0x02024318
_080170B4:
	.4byte sin_fx
_080170B8:
	cmp r3, #1
	ble _080170BE
	b _080171A4
_080170BE:
	cmp r3, #0
	beq _080170CA
_080170C2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_080170CA:
	ldr r1, _08017248
	ldrh r2, [r1]
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _080170E8
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcb
	bl snd_play
	movs r2, #1
	str r2, [r6, #8]
	b _08017100
_080170E8:
	movs r4, #2
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0801710A
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl snd_play
	str r4, [r6, #8]
_08017100:
	bl sub_0801932C
	bl fade_to_black
	b _080170C2
_0801710A:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08017144
	ldr r2, [r6]
	cmp r2, #0
	ble _08017144
	movs r3, #0x80
	movs r1, #0x7f
	movs r0, #0xc0
	lsls r2, r3, #9
	bl snd_play
	ldr r1, [r6]
	subs r1, #1
	str r1, [r6]
_0801712A:
	ldr r1, _0801724C
	ldr r2, [r1]
	ldr r3, [r1, #4]
	cmp r2, r3
	bge _08017138
	str r2, [r1, #4]
	adds r3, r2, #0
_08017138:
	adds r3, #6
	cmp r2, r3
	ble _080170C2
	subs r0, r2, #6
	str r0, [r1, #4]
	b _080170C2
_08017144:
	ldrh r3, [r1]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08017172
	ldr r4, _0801724C
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r0, r3, r2
	ldr r2, [r4]
	subs r0, #1
	cmp r2, r0
	bge _08017172
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldr r2, [r4]
	adds r2, #1
	str r2, [r4]
	b _0801712A
_08017172:
	ldrh r0, [r1]
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0801712A
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xc0
	bl snd_play
	ldr r1, _0801724C
	ldr r2, [r1, #0xc]
	ldr r3, [r1, #0x10]
	subs r0, r3, r2
	ldr r2, [r1]
	subs r0, #1
	cmp r2, r0
	bge _0801719E
	adds r0, r2, #1
	str r0, [r1]
	b _0801712A
_0801719E:
	movs r2, #0
	str r2, [r1]
	b _0801712A
_080171A4:
	cmp r3, #2
	beq _080171AA
	b _080170C2
_080171AA:
	ldr r2, _08017250
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	bne _080171BA
	b _080170C2
_080171BA:
	movs r0, #0
	bl mcp_process
	b _080170C2
_080171C2:
	ldr r2, _08017250
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	bne _080171D2
	b _080170C2
_080171D2:
	ldr r1, [r6, #0xc]
	ldr r2, [r6]
	adds r0, r1, r2
	ldr r1, _08017254
	adds r1, #0x84
	strh r0, [r1]
	movs r0, #1
	bl mcp_process
	b _080170C2
_080171E6:
	ldr r1, _0801724C
	ldr r3, [r5, #8]
	ldr r6, [r1]
	cmp r3, r6
	beq _080171F8
	movs r2, #2
	adds r6, r1, #0
	str r2, [r5]
	b _08017050
_080171F8:
	ldr r3, [r5, #4]
	cmp r3, #0x1f
	bgt _08017206
	adds r3, #1
	adds r6, r1, #0
	str r3, [r5, #4]
	b _08017050
_08017206:
	movs r0, #1
	adds r6, r1, #0
	str r0, [r5]
	b _08017050
_0801720E:
	cmp r3, #2
	beq _08017214
	b _0801704E
_08017214:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08017222
	ldr r6, _0801724C
	subs r3, #1
	str r3, [r5, #4]
	b _08017050
_08017222:
	ldr r0, _0801724C
	str r4, [r5]
	ldr r6, [r0]
	str r6, [r5, #8]
	adds r6, r0, #0
	b _08017050
_0801722E:
	ldr r6, _0801724C
	ldr r3, [r5, #8]
	ldr r1, [r6]
	cmp r3, r1
	bne _0801723A
	b _08017050
_0801723A:
	movs r2, #2
	str r2, [r5]
	b _08017050
_08017240:
	ldr r6, _0801724C
	b _08016FD8
_08017244:
	ldr r5, _08017258
	b _08016FFC
_08017248:
	.4byte gKeysNew
_0801724C:
	.4byte 0x02024284
_08017250:
	.4byte gModeFlags
_08017254:
	.4byte gGameSetup
_08017258:
	.4byte gUnk_0863FD80

	.global fe_timesheet_draw
	.thumb_func
	.type fe_timesheet_draw, %function
fe_timesheet_draw: @ 0801725C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r2, _08017444
	ldr r1, _08017448
	ldr r0, [r2, #4]
	adds r1, #0xb4
	rsbs r5, r0, #0
	ldr r0, [r2, #0xc]
	ldr r7, [r1]
	movs r1, #0x24
	sub sp, #0x10
	mov r8, r1
	cmp r0, #0
	bne _0801727E
	b _0801743C
_0801727E:
	ldr r6, _0801744C
_08017280:
	movs r1, #0
	movs r0, #0x4b
	bl fe_get_text
	ldr r4, _08017450
	mov r2, r8
	adds r3, r5, #0
	str r2, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, #0x28
	bl fe_text_draw
	add r3, sp, #4
	mov sl, r3
	adds r1, r7, #0
	movs r2, #1
	mov r0, sl
	bl sub_080187D0
	adds r1, r4, #0
	mov r0, sl
	bl fe_text_width
	adds r2, r0, #0
	subs r3, r5, r2
	mov r1, r8
	adds r2, r6, #0
	adds r3, #0xc8
	str r1, [sp]
	mov r0, sl
	adds r1, r4, #0
	bl fe_text_draw
	ldr r7, _08017448
	ldr r2, _08017444
	adds r3, r7, #0
	adds r3, #0xb8
	adds r7, #0xb4
	ldr r6, [r3]
	ldr r5, [r7]
	ldr r4, [r2, #0xc]
	movs r3, #0x32
	subs r7, r6, r5
	mov r8, r3
	ldr r5, [r2, #4]
	cmp r4, #1
	bne _080172E2
	b _08017436
_080172E2:
	ldr r6, _0801744C
_080172E4:
	movs r1, #0
	movs r0, #0x4c
	bl fe_get_text
	ldr r4, _08017450
	mov r1, r8
	adds r3, r5, #0
	str r1, [sp]
	adds r3, #0x28
	adds r1, r4, #0
	adds r2, r6, #0
	bl fe_text_draw
	adds r1, r7, #0
	movs r2, #1
	mov r0, sl
	bl sub_080187D0
	adds r1, r4, #0
	mov r0, sl
	bl fe_text_width
	adds r7, r0, #0
	mov r2, r8
	subs r3, r5, r7
	adds r3, #0xc8
	str r2, [sp]
	mov r0, sl
	adds r1, r4, #0
	adds r2, r6, #0
	bl fe_text_draw
	ldr r2, _08017444
	ldr r1, [r2, #4]
	ldr r0, [r2, #0xc]
	movs r3, #0x40
	rsbs r5, r1, #0
	mov r8, r3
	cmp r0, #2
	bne _08017336
	b _08017430
_08017336:
	ldr r6, _0801744C
_08017338:
	movs r1, #0
	movs r0, #0x4d
	bl fe_get_text
	ldr r4, _08017450
	mov r1, r8
	adds r3, r5, #0
	str r1, [sp]
	adds r2, r6, #0
	adds r3, #0x28
	adds r1, r4, #0
	bl fe_text_draw
	ldr r1, _08017448
	adds r3, r1, #0
	adds r3, #0xbc
	adds r1, #0xb8
	ldr r0, [r3]
	ldr r7, [r1]
	movs r2, #1
	subs r1, r0, r7
	mov r0, sl
	bl sub_080187D0
	adds r1, r4, #0
	mov r0, sl
	bl fe_text_width
	adds r2, r0, #0
	subs r3, r5, r2
	mov r2, r8
	adds r3, #0xc8
	str r2, [sp]
	mov r0, sl
	adds r2, r6, #0
	adds r1, r4, #0
	bl fe_text_draw
	ldr r2, _08017444
	ldr r6, [r2, #0x10]
	movs r3, #0x5c
	ldr r5, [r2, #4]
	mov r8, r3
	cmp r6, #0
	beq _0801742A
	ldr r6, _0801744C
_08017394:
	movs r1, #0
	movs r0, #0x4e
	bl fe_get_text
	ldr r7, _08017450
	mov r1, r8
	adds r3, r5, #0
	str r1, [sp]
	adds r3, #0x28
	adds r2, r6, #0
	adds r1, r7, #0
	bl fe_text_draw
	ldr r0, _08017448
	adds r0, #0xbc
	ldr r1, [r0]
	movs r2, #1
	mov r0, sl
	bl sub_080187D0
	adds r1, r7, #0
	mov r0, sl
	bl fe_text_width
	adds r1, r0, #0
	subs r3, r5, r1
	mov r2, r8
	str r2, [sp]
	adds r3, #0xc8
	adds r2, r6, #0
	mov r0, sl
	adds r1, r7, #0
	bl fe_text_draw
	ldr r6, _08017444
	ldr r2, [r6, #0xc]
	cmp r2, #0
	blt _08017422
_080173E0:
	movs r1, #0
	movs r0, #0x4f
	bl fe_get_text
	ldr r1, [r6, #4]
	movs r3, #0x78
	rsbs r5, r1, #0
	adds r1, r7, #0
	mov r8, r3
	adds r4, r0, #0
	bl fe_text_width
	movs r2, #0xf0
	subs r1, r2, r0
	lsrs r2, r1, #0x1f
	adds r0, r1, r2
	asrs r1, r0, #1
	adds r3, r5, r1
	adds r2, r6, #0
	mov r1, r8
	str r1, [sp]
	adds r2, #0x14
	adds r0, r4, #0
	adds r1, r7, #0
	bl fe_text_draw
_08017414:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08017422:
	ldr r2, [r6, #0x10]
	cmp r2, #0
	bge _080173E0
	b _08017414
_0801742A:
	adds r6, r2, #0
	adds r6, #0x14
	b _08017394
_08017430:
	adds r6, r2, #0
	adds r6, #0x14
	b _08017338
_08017436:
	adds r6, r2, #0
	adds r6, #0x14
	b _080172E4
_0801743C:
	adds r6, r2, #0
	adds r6, #0x14
	b _08017280
	.byte 0x00, 0x00
_08017444:
	.4byte 0x02024324
_08017448:
	.4byte gGameSetup
_0801744C:
	.4byte gUnk_0863FD80
_08017450:
	.4byte gUnk_0863FDE8

	.global sub_08017454
	.thumb_func
	.type sub_08017454, %function
sub_08017454: @ 08017454
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0xc
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, _08017508
	ldr r2, [r0]
	movs r6, #0xc0
	lsls r3, r2, #0xa
	mov sb, r3
	lsls r5, r6, #8
	add r5, sb
	lsls r7, r2, #0x1a
	lsls r4, r5, #0x10
	ldr r2, _0801750C
	asrs r1, r4, #0x10
	asrs r0, r7, #0x10
	str r1, [sp]
	mov fp, r2
	bl _call_via_r11
	movs r2, #0x80
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	lsls r3, r2, #5
	mov sl, r3
	ldr r3, _08017510
	add r1, sl
	adds r3, #0x16
	str r1, [sp, #4]
	mov r8, r3
	movs r7, #2
_0801749C:
	ldr r6, _08017514
	ldrh r1, [r7, r6]
	ldr r5, [sp, #4]
	movs r6, #0x1f
	ands r6, r1
	adds r0, r6, #0
	muls r0, r5, r0
	movs r4, #0xc0
	lsls r1, r4, #7
	add r1, sb
	lsls r2, r1, #0x10
	asrs r5, r0, #0xd
	asrs r0, r2, #0x10
	bl _call_via_r11
	lsls r3, r0, #0x10
	asrs r4, r3, #0x10
	add r4, sl
	adds r1, r6, #0
	muls r1, r4, r1
	ldr r0, [sp]
	asrs r4, r1, #0xd
	bl _call_via_r11
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	add r3, sl
	adds r1, r6, #0
	muls r1, r3, r1
	lsls r4, r4, #5
	asrs r2, r1, #0xd
	lsls r1, r2, #0xa
	adds r0, r5, r4
	mov r2, r8
	adds r5, r0, r1
	strh r5, [r2]
	ldr r1, [sp, #8]
	movs r2, #2
	adds r1, #1
	add r8, r2
	adds r7, #2
	str r1, [sp, #8]
	cmp r1, #0xf
	ble _0801749C
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08017508:
	.4byte 0x03005660
_0801750C:
	.4byte sin_fx
_08017510:
	.4byte 0x02024324
_08017514:
	.4byte gUnk_0863FD80

	.global fe_tracks_timesheet_init
	.thumb_func
	.type fe_tracks_timesheet_init, %function
fe_tracks_timesheet_init: @ 08017518
	push {r4, r5, r6, lr}
	ldr r5, _08017550
	ldr r6, _08017560
	ldr r0, _08017564
	ldr r1, _08017568
	sub sp, #8
	ldr r4, _0801756C
	bl AGBPrintf
	strh r5, [r6]
	movs r2, #3
	ldrh r1, [r4]
	rsbs r0, r2, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, _08017570
	ldr r1, _08017574
	ldr r0, _08017554
	movs r2, #0x80
	ldr r4, _08017558
	str r3, [r1]
	strh r0, [r6]
	ldr r1, _0801755C
	lsls r6, r2, #0x13
	strh r4, [r6]
	adds r6, #8
	strh r1, [r6]
	b _08017578
_08017550:
	.4byte 0x00000000
_08017554:
	.4byte 0x00000001
_08017558:
	.4byte 0x00009140
_0801755C:
	.4byte 0x00000084
_08017560:
	.4byte 0x04000208
_08017564:
	.4byte gUnk_080514A0
_08017568:
	.4byte gUnk_080514AC
_0801756C:
	.4byte 0x04000200
_08017570:
	.4byte vblank_handler
_08017574:
	.4byte gIrqHandler
_08017578:
	adds r6, #8
	strh r5, [r6]
	ldr r0, _080175B8
	adds r6, #2
	strh r5, [r6]
	ldr r4, _080175BC
	adds r6, #0x38
	strh r0, [r6]
	ldr r1, _080175C0
	adds r6, #6
	strh r4, [r6]
	adds r6, #4
	strh r1, [r6]
	bl sub_08018C58
	movs r0, #0xf8
	str r0, [sp, #4]
	ldr r2, _080175C4
	ldr r0, _080175C8
	ldr r1, _080175CC
	add r4, sp, #4
	str r4, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r6, _080175D0
	ldr r3, [r0, #8]
	ldr r4, _080175D4
	mov r3, sp
	adds r3, #2
	strh r5, [r3]
	b _080175D8
	.byte 0x00, 0x00
_080175B8:
	.4byte 0x00003F1F
_080175BC:
	.4byte 0x000000EF
_080175C0:
	.4byte 0x00000003
_080175C4:
	.4byte 0x02000008
_080175C8:
	.4byte 0x040000D4
_080175CC:
	.4byte 0x85000100
_080175D0:
	.4byte 0x06010000
_080175D4:
	.4byte 0x81004000
_080175D8:
	str r3, [r0]
	str r6, [r0, #4]
	str r4, [r0, #8]
	movs r5, #1
	rsbs r2, r5, #0
	ldr r3, [r0, #8]
	ldr r5, _080176D4
	ldr r0, _080176D8
	movs r1, #0xf0
	movs r4, #0
	str r2, [r0, #0x10]
	str r2, [r0, #0xc]
	str r1, [r0, #4]
	str r4, [r0]
	adds r1, r5, #0
	adds r1, #0x84
	ldrh r6, [r1]
	movs r3, #0x80
	lsls r2, r6, #3
	lsls r6, r3, #2
	adds r3, r2, r6
	ldrh r3, [r5, r3]
	cmp r3, #0
	beq _080176B6
	movs r3, #0xfe
	lsls r6, r3, #1
	adds r3, r5, #0
	adds r1, r2, r6
	adds r3, #0xbc
	ldrh r2, [r5, r1]
	ldr r3, [r3]
	cmp r2, r3
	bls _0801761E
	strh r3, [r5, r1]
_0801761C:
	str r4, [r0, #0x10]
_0801761E:
	adds r2, r5, #0
	adds r2, #0x84
	ldrh r0, [r2]
	movs r1, #0x80
	lsls r2, r0, #3
	lsls r3, r1, #2
	adds r1, r2, r3
	adds r0, r1, r5
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _080176A0
_08017634:
	movs r0, #0
_08017636:
	cmp r0, #0
	ble _08017698
	lsls r3, r0, #2
	adds r2, r3, #0
	adds r2, #0xb4
	adds r3, #0xb0
	ldr r1, [r5, r2]
	ldr r3, [r5, r3]
	subs r2, r1, r3
_08017648:
	adds r3, r5, #0
	adds r3, #0x84
	ldrh r1, [r3]
	lsls r3, r1, #3
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r3, r3, r1
	adds r1, r3, r5
	ldrh r3, [r1, #2]
	cmp r3, r2
	ble _08017664
	strh r2, [r1, #2]
	ldr r2, _080176D8
	str r0, [r2, #0xc]
_08017664:
	adds r0, #1
	cmp r0, #2
	ble _08017636
	bl sub_08017454
	bl fe_spr_init
	movs r0, #3
	bl music_play_if_changed
	bl fade_to_normal
	movs r0, #0x15
	bl sub_0801931C
	ldr r3, _080176DC
	ldr r0, _080176E0
	ldr r1, _080176E4
	str r3, [r0]
	ldr r0, _080176E8
	bl AGBPrintf
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08017698:
	adds r1, r5, #0
	adds r1, #0xb4
	ldr r2, [r1]
	b _08017648
_080176A0:
	movs r3, #0xfe
	adds r0, r5, #0
	adds r0, #0xb4
	lsls r6, r3, #1
	adds r3, r2, r6
	ldr r2, [r0]
	adds r0, r3, r5
	strh r2, [r0, #2]
	ldr r0, _080176D8
	str r1, [r0, #0xc]
	b _08017634
_080176B6:
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r2, r2, r3
	adds r3, r5, #0
	adds r3, #0xbc
	ldr r3, [r3]
	strh r3, [r5, r2]
	ldrh r3, [r1]
	lsls r2, r3, #3
	adds r1, r2, r6
	ldr r2, _080176D0
	strh r2, [r5, r1]
	b _0801761C
_080176D0:
	.4byte 0x00000421
_080176D4:
	.4byte gGameSetup
_080176D8:
	.4byte 0x02024324
_080176DC:
	.4byte fe_tracks_timesheet_process
_080176E0:
	.4byte gStateFunc
_080176E4:
	.4byte gUnk_080514AC
_080176E8:
	.4byte gUnk_080514C8

	.global fe_tracks_timesheet_process
	.thumb_func
	.type fe_tracks_timesheet_process, %function
fe_tracks_timesheet_process: @ 080176EC
	push {r4, lr}
	bl fade_update
	ldr r1, _080177BC
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _08017706
	ldr r1, _080177C0
	ldr r4, [r1]
	ldr r0, _080177C4
	lsrs r2, r4, #2
	strh r2, [r0]
_08017706:
	bl sub_08017E1C
	bl sub_08017454
	bl fe_timesheet_draw
	ldr r4, _080177C8
	ldr r3, [r4]
	cmp r3, #1
	beq _0801779C
	cmp r3, #1
	bgt _0801773A
	cmp r3, #0
	beq _08017728
_08017722:
	pop {r4}
	pop {r0}
	bx r0
_08017728:
	movs r3, #0x80
	movs r0, #0xcd
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	movs r0, #1
	str r0, [r4]
	b _08017722
_0801773A:
	cmp r3, #2
	beq _08017772
	cmp r3, #3
	bne _08017722
	bl fe_draw_title
	ldr r3, [r4, #4]
	cmp r3, #0xef
	bgt _0801775A
	adds r3, #5
	str r3, [r4, #4]
	cmp r3, #0xf0
	ble _08017722
	movs r1, #0xf0
	str r1, [r4, #4]
	b _08017722
_0801775A:
	ldr r2, [r4, #0xc]
	movs r0, #0
	cmp r2, #0
	blt _0801776A
_08017762:
	movs r0, #1
_08017764:
	bl mcp_process
	b _08017722
_0801776A:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	bge _08017762
	b _08017764
_08017772:
	bl fe_draw_title
	ldr r2, _080177CC
	ldrh r1, [r2]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08017722
	bl fade_to_black
	bl sub_0801932C
	movs r3, #0x80
	movs r0, #0xd8
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	movs r0, #3
	str r0, [r4]
	b _08017722
_0801779C:
	bl fe_draw_title
	ldr r3, [r4, #4]
	cmp r3, #0
	ble _080177B4
	subs r3, #5
	str r3, [r4, #4]
	cmp r3, #0
	bge _08017722
	movs r2, #0
	str r2, [r4, #4]
	b _08017722
_080177B4:
	movs r1, #2
	str r1, [r4]
	b _08017722
	.byte 0x00, 0x00
_080177BC:
	.4byte gGameSetup
_080177C0:
	.4byte 0x03005660
_080177C4:
	.4byte 0x04000010
_080177C8:
	.4byte 0x02024324
_080177CC:
	.4byte gKeysNew

	.global sub_080177D0
	.thumb_func
	.type sub_080177D0, %function
sub_080177D0: @ 080177D0
	push {lr}
	ldr r0, _08017810
	ldr r1, [r0, #0xc]
	cmp r1, #0
	blt _080177F0
	ldr r2, _08017814
	adds r3, r2, #0
	adds r3, #0x84
	ldrh r1, [r3]
	lsls r3, r1, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r3, r1
	ldrh r1, [r2, #0x24]
	adds r3, r3, r2
	strh r1, [r3, #2]
_080177F0:
	ldr r2, [r0, #0x10]
	cmp r2, #0
	blt _0801780A
	ldr r1, _08017814
	adds r0, r1, #0
	adds r0, #0x84
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r3, r2, #3
	lsls r2, r0, #2
	adds r0, r3, r2
	ldrh r2, [r1, #0x24]
	strh r2, [r1, r0]
_0801780A:
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08017810:
	.4byte 0x02024324
_08017814:
	.4byte gGameSetup

	.global fe_cranky_init
	.thumb_func
	.type fe_cranky_init, %function
fe_cranky_init: @ 08017818
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r8
	push {r5, r6}
	ldr r3, _08017868
	ldr r6, _08017858
	mov sl, r3
	ldr r5, _0801786C
	mov r8, r0
	mov r1, sl
	ldr r0, _08017870
	sub sp, #8
	ldr r4, _08017874
	bl AGBPrintf
	strh r6, [r5]
	ldr r0, _0801785C
	ldrh r1, [r4]
	orrs r1, r0
	strh r1, [r4]
	ldr r4, _08017878
	ldr r3, _08017860
	ldrh r0, [r4]
	orrs r0, r3
	strh r0, [r4]
	ldr r2, _0801787C
	ldr r0, _08017880
	ldr r1, _08017884
	ldr r4, _08017864
	str r2, [r0]
	b _08017888
	.byte 0x00, 0x00
_08017858:
	.4byte 0x00000000
_0801785C:
	.4byte 0x00000002
_08017860:
	.4byte 0x00000010
_08017864:
	.4byte 0x00000001
_08017868:
	.4byte gUnk_080514D4
_0801786C:
	.4byte 0x04000208
_08017870:
	.4byte gUnk_080514E4
_08017874:
	.4byte 0x04000200
_08017878:
	.4byte 0x04000004
_0801787C:
	.4byte sub_08017DD8
_08017880:
	.4byte gIrqHandler
_08017884:
	.4byte sub_08017DF4
_08017888:
	str r1, [r0, #4]
	movs r2, #0x80
	ldr r1, _080178C0
	strh r4, [r5]
	ldr r0, _080178C4
	lsls r4, r2, #0x13
	strh r1, [r4]
	ldr r5, _080178C8
	adds r4, #8
	strh r0, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #6
	strh r6, [r4]
	adds r4, #2
	strh r6, [r4]
	adds r4, #2
	strh r6, [r4]
	ldr r1, _080178CC
	adds r4, #2
	strh r6, [r4]
	ldr r0, _080178D0
	adds r4, #0x32
	strh r1, [r4]
	ldr r5, _080178D4
	adds r4, #2
	b _080178D8
	.byte 0x00, 0x00
_080178C0:
	.4byte 0x00003340
_080178C4:
	.4byte 0x00000104
_080178C8:
	.4byte 0x00000009
_080178CC:
	.4byte 0x00000033
_080178D0:
	.4byte 0x00000012
_080178D4:
	.4byte 0x000004EC
_080178D8:
	strh r0, [r4]
	ldr r6, _08017914
	subs r4, #0xa
	strh r5, [r4]
	ldr r1, _08017918
	adds r4, #4
	strh r6, [r4]
	ldr r0, _0801791C
	adds r4, #0xc
	strh r1, [r4]
	adds r4, #2
	strh r0, [r4]
	ldr r0, _08017920
	bl pal_load
	ldr r4, _08017924
	ldr r5, _08017928
	str r5, [r4]
	subs r5, #2
	ldrh r2, [r5]
	movs r6, #0x80
	lsls r1, r6, #0x18
	ldr r3, _0801792C
	lsls r0, r2, #4
	orrs r0, r1
	str r3, [r4, #4]
	ldr r5, _08017930
	str r0, [r4, #8]
	b _08017934
	.byte 0x00, 0x00
_08017914:
	.4byte 0x0000A0A0
_08017918:
	.4byte 0x00003261
_0801791C:
	.4byte 0x0000030F
_08017920:
	.4byte gUnk_08054450
_08017924:
	.4byte 0x040000D4
_08017928:
	.4byte gUnk_08081D04
_0801792C:
	.4byte 0x06008000
_08017930:
	.4byte gUnk_081B885C
_08017934:
	movs r6, #0xc0
	ldr r2, _08017980
	lsls r1, r6, #0x13
	ldr r3, [r4, #8]
	ldr r0, _08017978
	str r5, [r4]
	ldr r6, _08017984
	str r1, [r4, #4]
	ldr r5, _08017988
	str r2, [r4, #8]
	mov r2, sp
	adds r2, #6
	ldr r3, [r4, #8]
	ldr r1, _0801797C
	strh r0, [r2]
	str r2, [r4]
	ldr r0, _0801798C
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r5, _08017990
	ldr r3, [r4, #8]
	strh r1, [r2]
	str r2, [r4]
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, _08017994
	movs r6, #0xe0
	ldr r3, [r4, #8]
	movs r5, #0
	mov r3, sp
	lsls r1, r6, #0x13
	str r5, [sp]
	str r3, [r4]
	b _08017998
_08017978:
	.4byte 0x0000FFFF
_0801797C:
	.4byte 0x0000F000
_08017980:
	.4byte 0x80000400
_08017984:
	.4byte 0x81000010
_08017988:
	.4byte 0x06004000
_0801798C:
	.4byte 0x06000800
_08017990:
	.4byte 0x81000280
_08017994:
	.4byte 0x85000100
_08017998:
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldr r6, _08017A44
	ldr r3, [r4, #8]
	strh r5, [r2]
	str r2, [r4]
	ldr r2, _08017A48
	str r2, [r4, #4]
	str r6, [r4, #8]
	ldr r3, [r4, #8]
	bl fe_spr_init
	ldr r6, _08017A4C
	mov r3, r8
	str r3, [r6, #0xc]
	ldr r3, _08017A50
	ldr r4, _08017A54
	movs r1, #0x1e
	str r5, [r6, #4]
	str r1, [r3, #4]
	subs r1, #0x1f
	str r5, [r3]
	str r1, [r3, #8]
	mov r0, r8
	str r1, [r4, #8]
	str r5, [r4, #0xc]
	str r5, [r4, #4]
	bl sub_08018C3C
	str r0, [r4, #0x10]
	movs r0, #0xa0
	str r0, [r4]
	bl sub_08018654
	movs r2, #0x80
	lsls r1, r2, #1
	movs r0, #4
	bl sub_080185A8
	ldr r2, _08017A58
	str r0, [r6, #8]
	ldrh r3, [r2, #2]
	lsls r0, r0, #1
	adds r1, r3, r2
	ldrh r2, [r0, r1]
	adds r0, r1, r2
	ldr r1, _08017A24
	strh r1, [r0]
	ldr r1, _08017A28
	strh r1, [r0, #4]
	ldr r1, _08017A2C
	strh r1, [r0, #0xa]
	ldr r1, _08017A30
	strh r1, [r0, #0xc]
	ldr r1, _08017A34
	strh r1, [r0, #0x10]
	ldr r1, _08017A38
	strh r1, [r0, #0x12]
	ldr r1, _08017A3C
	strh r1, [r0, #0x16]
	ldr r1, _08017A40
	strh r5, [r0, #2]
	strh r1, [r0, #0x18]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xe]
	strh r5, [r0, #0x14]
	bl fade_to_normal
	b _08017A5C
_08017A24:
	.4byte 0x00000004
_08017A28:
	.4byte 0x0000C0A0
_08017A2C:
	.4byte 0x0000C0E0
_08017A30:
	.4byte 0x00000040
_08017A34:
	.4byte 0x0000C020
_08017A38:
	.4byte 0x00000080
_08017A3C:
	.4byte 0x0000C060
_08017A40:
	.4byte 0x000000C0
_08017A44:
	.4byte 0x81004000
_08017A48:
	.4byte 0x06010000
_08017A4C:
	.4byte 0x02024370
_08017A50:
	.4byte 0x02024380
_08017A54:
	.4byte 0x02024358
_08017A58:
	.4byte 0x02024394
_08017A5C:
	movs r0, #0x13
	bl music_play_if_changed
	ldr r1, _08017A80
	ldr r0, _08017A84
	str r1, [r0]
	ldr r0, _08017A88
	mov r1, sl
	bl AGBPrintf
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08017A80:
	.4byte fe_cranky_process
_08017A84:
	.4byte gStateFunc
_08017A88:
	.4byte gUnk_080514F0

	.global sub_08017A8C
	.thumb_func
	.type sub_08017A8C, %function
sub_08017A8C: @ 08017A8C
	push {r4, r5, lr}
	ldr r2, _08017B04
	ldr r5, _08017B08
	ldr r4, [r2, #8]
	ldr r1, [r5]
	sub sp, #0x10
	adds r1, #0x24
	str r4, [sp]
	movs r0, #0x80
	movs r4, #0
	ldr r2, _08017B0C
	ldr r3, _08017B10
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r0, _08017B14
	ldr r2, [r0]
	movs r1, #1
	lsrs r0, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08017AE6
	ldr r1, [r5]
	ldr r3, [r5, #0x14]
	adds r0, r1, r3
	ldr r3, [r5, #0x10]
	ldr r2, [r5, #0xc]
	adds r1, r0, #0
	subs r3, #1
	subs r1, #8
	movs r0, #0
	cmp r2, r3
	blt _08017AD4
	movs r0, #1
_08017AD4:
	str r0, [sp]
	ldr r2, _08017B18
	movs r0, #0xe4
	ldr r3, _08017B1C
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_08017AE6:
	ldr r2, _08017B08
	ldr r0, [r2]
	ldr r3, [r2, #0x14]
	adds r2, r0, r3
	lsls r1, r0, #8
	cmp r2, #0xa0
	ble _08017AF6
	movs r2, #0xa0
_08017AF6:
	adds r3, r1, r2
	ldr r1, _08017B20
	add sp, #0x10
	strh r3, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
_08017B04:
	.4byte 0x02024370
_08017B08:
	.4byte 0x02024358
_08017B0C:
	.4byte 0x02024394
_08017B10:
	.4byte gUnk_0863FD60
_08017B14:
	.4byte 0x03005660
_08017B18:
	.4byte gUnk_08629E00
_08017B1C:
	.4byte gUnk_0863FBE0
_08017B20:
	.4byte 0x04000044

	.global fe_cranky_process
	.thumb_func
	.type fe_cranky_process, %function
fe_cranky_process: @ 08017B24
	push {r4, r5, r6, r7, lr}
	ldr r0, _08017D9C
	ldr r1, _08017DA0
	ldr r3, [r0]
	movs r2, #0xa0
	ldr r0, _08017DA4
	ldr r5, _08017DA8
	sub sp, #0x10
	bl _call_via_r5
	bl fade_update
	bl sub_08017E1C
	ldr r7, _08017DAC
	ldr r3, [r7, #8]
	cmp r3, #1
	bne _08017B4A
	b _08017D68
_08017B4A:
	cmp r3, #1
	ble _08017B50
	b _08017D22
_08017B50:
	cmp r3, #0
	bne _08017B56
	b _08017CE2
_08017B56:
	ldr r4, _08017DB0
	ldr r1, [r4]
	movs r2, #0x80
	asrs r6, r1, #3
	str r6, [sp]
	movs r4, #0
	lsls r6, r2, #3
	ldr r3, _08017DB4
	movs r0, #0
	movs r1, #0
	ldr r2, _08017DB8
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r5, _08017DBC
	ldr r3, [r5]
	cmp r3, #0
	bne _08017B80
	b _08017C98
_08017B80:
	cmp r3, #1
	bne _08017B86
	b _08017C68
_08017B86:
	ldr r2, _08017DB0
	ldr r3, [r2]
	cmp r3, #0x4e
	bgt _08017C62
	adds r3, #1
	str r3, [r2]
_08017B92:
	ldr r6, _08017DB0
	ldr r3, [r6]
	cmp r3, #8
	beq _08017C54
	cmp r3, #0x40
	beq _08017C46
_08017B9E:
	ldr r1, [r6, #4]
	cmp r1, #1
	beq _08017C04
	cmp r1, #1
	bgt _08017BCC
	cmp r1, #0
	beq _08017BB4
_08017BAC:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08017BB4:
	ldr r2, _08017DC0
	ldr r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _08017BAC
	ldr r0, _08017DAC
	str r1, [r0, #8]
	movs r1, #1
	str r1, [r6, #4]
	b _08017BAC
_08017BCC:
	cmp r1, #2
	beq _08017BEE
	cmp r1, #3
	bne _08017BAC
	ldr r2, _08017DC0
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08017BAC
	bl snd_stop_all
	movs r0, #0
	bl mcp_process
	b _08017BAC
_08017BEE:
	ldr r2, _08017DAC
	movs r1, #1
	ldr r3, [r2, #8]
	rsbs r0, r1, #0
	cmp r3, r0
	bne _08017BAC
	movs r1, #0
	str r1, [r2, #8]
	movs r2, #1
	str r2, [r6, #4]
	b _08017BAC
_08017C04:
	ldr r4, _08017DAC
	ldr r5, [r4, #8]
	cmp r5, #2
	bne _08017BAC
	ldr r2, _08017DC4
	ldrh r0, [r2]
	movs r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08017BAC
	ldr r0, [r4, #0xc]
	movs r3, #0x80
	adds r0, #1
	str r0, [r4, #0xc]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xbd
	bl snd_play
	ldr r3, [r4, #0xc]
	ldr r1, [r4, #0x10]
	cmp r3, r1
	bge _08017C3A
	movs r2, #3
	str r2, [r4, #8]
	str r5, [r6, #4]
	b _08017BAC
_08017C3A:
	movs r1, #3
	str r1, [r4, #8]
	str r1, [r6, #4]
	bl fade_to_black
	b _08017BAC
_08017C46:
	movs r3, #0x80
	movs r0, #0xbb
	movs r1, #0x4d
	lsls r2, r3, #9
	bl snd_play
	b _08017B9E
_08017C54:
	movs r3, #0x80
	movs r1, #0x61
	lsls r2, r3, #9
	movs r0, #0xbc
	bl snd_play
	b _08017B9E
_08017C62:
	movs r1, #0
	str r1, [r2]
	b _08017B92
_08017C68:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08017C74
	subs r3, #1
	str r3, [r5, #4]
	b _08017B86
_08017C74:
	str r4, [r5]
	bl lfsr_next
	lsrs r6, r0, #0xc
	ldr r0, [r5, #8]
	adds r6, #5
	str r6, [r5, #4]
	cmp r0, #0
	blt _08017C8A
	bl snd_release
_08017C8A:
	movs r3, #0x80
	movs r0, #0xec
	movs r1, #0x14
	lsls r2, r3, #9
	bl snd_play
	b _08017B86
_08017C98:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08017CB8
	subs r3, #1
	str r3, [r5, #4]
	movs r0, #0x78
	movs r1, #0x50
	ldr r2, _08017DC8
	ldr r3, _08017DCC
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	b _08017B86
_08017CB8:
	movs r0, #1
	str r0, [r5]
	bl lfsr_next
	movs r3, #0x80
	lsrs r2, r0, #0xa
	lsls r4, r3, #9
	adds r2, #0x14
	str r2, [r5, #4]
	movs r1, #0xa
	adds r2, r4, #0
	movs r0, #0xeb
	bl snd_play
	movs r1, #0x3c
	str r0, [r5, #8]
	adds r2, r4, #0
	movs r0, #0xec
	bl snd_play
	b _08017B86
_08017CE2:
	bl sound_disable
	ldr r4, _08017DB0
	ldr r0, [r4, #8]
	bl sub_0801854C
	ldr r0, [r4, #0xc]
	ldr r1, [r7, #0xc]
	bl fe_get_text
	ldr r6, _08017DD0
	adds r1, r6, #0
	adds r5, r0, #0
	bl sub_08018AC8
	adds r0, #0xc
	str r0, [r7, #0x14]
	ldr r2, [r4, #8]
	movs r3, #0x78
	movs r4, #0x20
	str r2, [sp]
	adds r1, r6, #0
	rsbs r2, r3, #0
	adds r0, r5, #0
	rsbs r3, r4, #0
	bl sub_080188B8
	bl sound_enable
	movs r1, #1
	str r1, [r7, #8]
	b _08017B56
_08017D22:
	cmp r3, #2
	beq _08017D62
	cmp r3, #3
	beq _08017D2C
	b _08017B56
_08017D2C:
	bl sub_08017A8C
	ldr r0, [r7, #4]
	cmp r0, #0
	ble _08017D5A
	subs r0, #1
	lsls r3, r0, #0x1a
	str r0, [r7, #4]
	ldr r4, _08017DD4
	asrs r0, r3, #0x10
	bl _call_via_r4
	ldr r6, [r7, #0x14]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	adds r6, #4
	adds r5, r6, #0
	muls r5, r2, r5
	movs r4, #0xa0
	asrs r3, r5, #0xc
	subs r1, r4, r3
	str r1, [r7]
	b _08017B56
_08017D5A:
	movs r5, #1
	rsbs r0, r5, #0
	str r0, [r7, #8]
	b _08017B56
_08017D62:
	bl sub_08017A8C
	b _08017B56
_08017D68:
	bl sub_08017A8C
	ldr r0, [r7, #4]
	cmp r0, #0xf
	bgt _08017D96
	adds r0, #1
	lsls r6, r0, #0x1a
	str r0, [r7, #4]
	ldr r5, _08017DD4
	asrs r0, r6, #0x10
	bl _call_via_r5
	ldr r2, [r7, #0x14]
	lsls r3, r0, #0x10
	asrs r4, r3, #0x10
	adds r2, #4
	adds r1, r2, #0
	muls r1, r4, r1
	movs r6, #0xa0
	asrs r0, r1, #0xc
	subs r5, r6, r0
	str r5, [r7]
	b _08017B56
_08017D96:
	movs r0, #2
	str r0, [r7, #8]
	b _08017B56
_08017D9C:
	.4byte gBrightness
_08017DA0:
	.4byte 0x02023FA4
_08017DA4:
	.4byte gUnk_0863BFA0
_08017DA8:
	.4byte pal_copy_bright
_08017DAC:
	.4byte 0x02024358
_08017DB0:
	.4byte 0x02024370
_08017DB4:
	.4byte gUnk_0863F1E0
_08017DB8:
	.4byte gUnk_08296B40
_08017DBC:
	.4byte 0x02024380
_08017DC0:
	.4byte gModeFlags
_08017DC4:
	.4byte gKeysNew
_08017DC8:
	.4byte gUnk_0829F3D0
_08017DCC:
	.4byte gUnk_0863F200
_08017DD0:
	.4byte gUnk_0863FDF8
_08017DD4:
	.4byte sin_fx

	.global sub_08017DD8
	.thumb_func
	.type sub_08017DD8, %function
sub_08017DD8: @ 08017DD8
	push {lr}
	bl vblank_handler_noaudio
	ldr r0, _08017DF0
	movs r2, #0xa0
	ldrh r1, [r0]
	lsls r0, r2, #0x13
	strh r1, [r0]
	bl snd_update_if_enabled
	pop {r0}
	bx r0
_08017DF0:
	.4byte 0x02023FA4

	.global sub_08017DF4
	.thumb_func
	.type sub_08017DF4, %function
sub_08017DF4: @ 08017DF4
	push {lr}
	ldr r0, _08017E14
	ldrh r1, [r0]
	adds r1, #1
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bhi _08017E10
	ldr r3, _08017E18
	lsls r1, r2, #1
	ldrh r0, [r3, r1]
	movs r3, #0xa0
	lsls r1, r3, #0x13
	strh r0, [r1]
_08017E10:
	pop {r0}
	bx r0
_08017E14:
	.4byte 0x04000006
_08017E18:
	.4byte 0x02023FA4

	.global sub_08017E1C
	.thumb_func
	.type sub_08017E1C, %function
sub_08017E1C: @ 08017E1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _08017E64
	ldr r0, _08017E5C
	strh r0, [r5]
	ldr r0, _08017E68
	ldr r2, [r0]
	movs r4, #0x80
	orrs r2, r4
	str r2, [r0]
	ldr r1, [r0]
	lsls r3, r4, #2
	ldr r2, _08017E60
	eors r1, r3
	str r1, [r0]
	ldr r4, _08017E6C
	strh r2, [r5]
	sub sp, #4
	bl _call_via_r4
	ldr r1, _08017E70
	ldr r5, _08017E74
	ldr r0, [r1]
	ldr r1, [r5]
	lsls r2, r0, #2
	subs r0, r2, r1
	movs r4, #0
	cmp r4, r0
	bge _08017E8E
	b _08017E78
	.byte 0x00, 0x00
_08017E5C:
	.4byte 0x00000000
_08017E60:
	.4byte 0x00000001
_08017E64:
	.4byte 0x04000208
_08017E68:
	.4byte gModeFlags
_08017E6C:
	.4byte pal_flush
_08017E70:
	.4byte 0x02024390
_08017E74:
	.4byte 0x020243AC
_08017E78:
	ldr r3, [r5]
	ldr r1, _08017EF4
	lsls r2, r3, #3
	movs r3, #0xf8
	str r3, [r2, r1]
	ldr r1, [r5]
	adds r4, #1
	adds r1, #1
	str r1, [r5]
	cmp r4, r0
	blt _08017E78
_08017E8E:
	ldr r4, [r5]
	lsls r0, r4, #3
	cmp r0, #0
	ble _08017EAE
	ldr r4, _08017EF8
	ldr r2, _08017EF4
	movs r1, #0xe0
	str r2, [r4]
	lsls r2, r1, #0x13
	str r2, [r4, #4]
	movs r2, #0x80
	lsls r3, r2, #0x18
	asrs r1, r0, #1
	orrs r1, r3
	str r1, [r4, #8]
	ldr r3, [r4, #8]
_08017EAE:
	movs r3, #0x80
	lsls r4, r3, #3
	cmp r0, r4
	bge _08017EDC
	ldr r4, _08017EF0
	mov r2, sp
	adds r2, #2
	strh r4, [r2]
	movs r1, #0xe0
	ldr r4, _08017EF8
	lsls r3, r1, #0x13
	str r2, [r4]
	adds r1, r0, r3
	movs r2, #0x80
	str r1, [r4, #4]
	lsls r1, r2, #3
	subs r2, r1, r0
	asrs r0, r2, #1
	movs r2, #0x81
	lsls r1, r2, #0x18
	orrs r0, r1
	str r0, [r4, #8]
	ldr r3, [r4, #8]
_08017EDC:
	ldr r2, _08017EFC
	ldr r0, [r2]
	movs r4, #0
	cmp r4, r0
	bge _08017F20
	ldr r3, _08017F00
	ldr r5, _08017F04
	ldr r6, _08017F08
	mov r8, r3
	b _08017F0C
_08017EF0:
	.4byte 0x000000F8
_08017EF4:
	.4byte 0x02000008
_08017EF8:
	.4byte 0x040000D4
_08017EFC:
	.4byte 0x020243B4
_08017F00:
	.4byte obj_tiles_upload
_08017F04:
	.4byte 0x020245B8
_08017F08:
	.4byte 0x020243B8
_08017F0C:
	adds r7, r2, #0
_08017F0E:
	ldrh r1, [r5]
	ldm r6!, {r0}
	bl _call_via_r8
	ldr r2, [r7]
	adds r4, #1
	adds r5, #2
	cmp r4, r2
	blt _08017F0E
_08017F20:
	ldr r2, _08017F44
	ldr r1, _08017F48
	movs r0, #0
	str r0, [r2]
	str r0, [r1]
	ldr r2, _08017F4C
	ldr r1, _08017F50
	str r0, [r2]
	str r0, [r1]
	bl pal_slots_reset
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08017F44:
	.4byte 0x020243AC
_08017F48:
	.4byte 0x020243B0
_08017F4C:
	.4byte 0x020243B4
_08017F50:
	.4byte 0x02024390
