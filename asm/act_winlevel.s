@ asm/act_winlevel.s: ROM 0x0210A0-0x0246C0 (rom, VMA 0x080210A0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global get_key
	.thumb_func
	.type get_key, %function
get_key: @ 080210A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0x74
	muls r0, r6, r0
	ldr r7, _08021328
	adds r0, #0x6c
	sub sp, #0x64
	ldr r2, [r7, r0]
	cmp r6, #1
	bne _080210BE
	b _0802131C
_080210BE:
	cmp r6, #1
	ble _080210C4
	b _080212FE
_080210C4:
	cmp r6, #0
	bne _080210CA
	b _080212F4
_080210CA:
	ldr r2, _0802132C
	ldr r0, _08021330
	str r2, [sp]
	ldr r1, _08021334
	ldr r2, _08021338
	movs r3, #0x33
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r7, _08021328
	movs r2, #0
_080210E4:
	movs r1, #0x74
	adds r4, r6, #0
	muls r4, r1, r4
	movs r0, #0
	ldrsh r5, [r2, r0]
	adds r1, r4, #0
	adds r1, #0x68
	adds r0, r4, #0
	str r5, [r7, r1]
	adds r0, #0x60
	movs r5, #0
	str r5, [r7, r0]
	ldr r0, [r7, r1]
	ldr r1, _0802133C
	bl _call_via_r1
	adds r5, r4, #0
	movs r3, #0x70
	adds r5, #0x64
	add r1, sp, #4
	adds r2, r3, r4
	str r0, [r7, r5]
	mov sl, r7
	movs r5, #0
	mov r8, r1
	mov sb, r2
	movs r7, #0xe
_0802111A:
	adds r1, r4, #0
	mov r0, sl
	adds r1, #0x6c
	ldr r2, [r0, r1]
	adds r0, r2, r5
	subs r2, r0, #1
	cmp r2, #0
	bge _0802112C
	b _080212F0
_0802112C:
	mov r1, sl
	mov r0, sb
	ldr r3, [r1, r0]
	cmp r2, r3
	blt _08021138
	subs r2, r3, #1
_08021138:
	cmp r6, #1
	bne _0802113E
	b _080212E8
_0802113E:
	cmp r6, #1
	ble _08021144
	b _080212CE
_08021144:
	cmp r6, #0
	bne _0802114A
	b _080212C4
_0802114A:
	ldr r2, _0802132C
	ldr r0, _08021330
	str r2, [sp]
	ldr r1, _08021334
	ldr r2, _08021338
	movs r3, #0x33
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	movs r2, #0
_08021162:
	lsls r3, r5, #2
	mov r0, r8
	adds r1, r3, r0
	movs r3, #5
	mov lr, r3
_0802116C:
	movs r0, #2
	ldrsh r3, [r2, r0]
	str r3, [r1]
	movs r3, #1
	rsbs r0, r3, #0
	add lr, r0
	mov r0, lr
	adds r1, #0x10
	adds r2, #2
	cmp r0, #0
	bge _0802116C
	adds r5, #1
	cmp r5, #3
	ble _0802111A
	movs r5, #0
	mov r1, r8
_0802118C:
	movs r3, #2
	lsls r2, r5, #2
	mov lr, r3
_08021192:
	movs r3, #1
	ldr r0, [r1, r2]
	rsbs r7, r3, #0
	add lr, r7
	lsls r4, r0, #8
	mov r0, lr
	str r4, [r1, r2]
	adds r2, #0x10
	cmp r0, #0
	bge _08021192
	adds r5, #1
	cmp r5, #3
	ble _0802118C
	movs r1, #0
	movs r2, #0x38
	mov r0, r8
	mov lr, r1
	mov ip, r2
	adds r0, #0x30
	movs r7, #0x30
_080211BA:
	mov r3, lr
	movs r2, #0x80
	ldr r1, [r0, #4]
	lsls r5, r3, #4
	lsls r4, r2, #8
	ldr r3, [r0]
	adds r2, r1, r4
	cmp r3, r2
	ble _080211D4
_080211CC:
	ldr r4, _08021340
	adds r3, r3, r4
	cmp r3, r2
	bgt _080211CC
_080211D4:
	ldr r4, _08021344
	adds r2, r1, r4
	cmp r3, r2
	bge _080211E6
_080211DC:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r3, r3, r4
	cmp r3, r2
	blt _080211DC
_080211E6:
	mov r2, r8
	str r3, [r7, r2]
	movs r2, #0x80
	ldr r1, [r0, #4]
	lsls r4, r2, #8
	ldr r3, [r0, #8]
	adds r2, r1, r4
	mov sl, ip
	cmp r3, r2
	ble _08021202
_080211FA:
	ldr r4, _08021340
	adds r3, r3, r4
	cmp r3, r2
	bgt _080211FA
_08021202:
	ldr r4, _08021344
	adds r2, r1, r4
	cmp r3, r2
	bge _08021214
_0802120A:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r3, r3, r4
	cmp r3, r2
	blt _0802120A
_08021214:
	mov r2, r8
	mov r4, sl
	str r3, [r2, r4]
	movs r2, #0x80
	ldr r1, [r0, #8]
	adds r4, r5, #0
	ldr r3, [r0, #0xc]
	lsls r5, r2, #8
	adds r2, r1, r5
	adds r4, #0x3c
	cmp r3, r2
	ble _08021234
_0802122C:
	ldr r5, _08021340
	adds r3, r3, r5
	cmp r3, r2
	bgt _0802122C
_08021234:
	ldr r5, _08021344
	adds r2, r1, r5
	cmp r3, r2
	bge _08021246
_0802123C:
	movs r1, #0x80
	lsls r5, r1, #9
	adds r3, r3, r5
	cmp r3, r2
	blt _0802123C
_08021246:
	movs r1, #1
	mov r2, r8
	add lr, r1
	str r3, [r2, r4]
	mov r5, lr
	movs r4, #0x10
	add ip, r4
	adds r0, #0x10
	adds r7, #0x10
	cmp r5, #2
	ble _080211BA
	movs r7, #0x74
	adds r0, r6, #0
	muls r0, r7, r0
	ldr r6, _08021328
	adds r7, r0, r6
	movs r0, #5
	mov ip, r8
	mov lr, r0
_0802126C:
	mov r1, ip
	ldr r4, [r1, #4]
	lsls r5, r4, #1
	str r5, [r7]
	mov r3, ip
	ldr r6, [r1]
	ldr r0, [r3, #8]
	rsbs r1, r6, #0
	adds r2, r1, r0
	str r2, [r7, #4]
	lsls r2, r6, #1
	lsls r6, r4, #2
	adds r3, r6, r4
	subs r6, r2, r3
	lsls r3, r0, #2
	adds r2, r6, r3
	mov r3, ip
	ldr r6, [r3, #0xc]
	subs r3, r2, r6
	str r3, [r7, #8]
	adds r3, r5, r4
	lsls r5, r0, #1
	adds r4, r1, r3
	adds r2, r5, r0
	subs r5, r4, r2
	movs r3, #1
	adds r2, r5, r6
	rsbs r5, r3, #0
	add lr, r5
	movs r4, #0x10
	mov r0, lr
	str r2, [r7, #0xc]
	add ip, r4
	adds r7, #0x10
	cmp r0, #0
	bge _0802126C
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080212C4:
	movs r1, #0xc
	muls r2, r1, r2
	ldr r0, _08021348
	adds r2, r2, r0
	b _08021162
_080212CE:
	cmp r6, #2
	beq _080212E0
	cmp r6, #3
	beq _080212D8
	b _0802114A
_080212D8:
	muls r2, r7, r2
	ldr r0, _0802134C
	adds r2, r2, r0
	b _08021162
_080212E0:
	muls r2, r7, r2
	ldr r1, _08021350
	adds r2, r2, r1
	b _08021162
_080212E8:
	muls r2, r7, r2
	ldr r0, _08021354
	adds r2, r2, r0
	b _08021162
_080212F0:
	movs r2, #0
	b _0802112C
_080212F4:
	movs r1, #0xc
	muls r2, r1, r2
	ldr r0, _08021348
	adds r2, r2, r0
	b _080210E4
_080212FE:
	cmp r6, #2
	beq _08021312
	cmp r6, #3
	beq _08021308
	b _080210CA
_08021308:
	movs r5, #0xe
	muls r2, r5, r2
	ldr r4, _0802134C
	adds r2, r2, r4
	b _080210E4
_08021312:
	movs r1, #0xe
	muls r2, r1, r2
	ldr r0, _08021350
	adds r2, r2, r0
	b _080210E4
_0802131C:
	movs r5, #0xe
	muls r2, r5, r2
	ldr r4, _08021354
	adds r2, r2, r4
	b _080210E4
	.byte 0x00, 0x00
_08021328:
	.4byte 0x0202E440
_0802132C:
	.4byte gUnk_080527A0
_08021330:
	.4byte gUnk_080527A8
_08021334:
	.4byte gUnk_080527E4
_08021338:
	.4byte gUnk_080527F8
_0802133C:
	.4byte _03000570
_08021340:
	.4byte 0xFFFF0000
_08021344:
	.4byte 0xFFFF8000
_08021348:
	.4byte gUnk_086437C6
_0802134C:
	.4byte gUnk_08643866
_08021350:
	.4byte gUnk_0864382A
_08021354:
	.4byte gUnk_086437EE

	.global sub_08021358
	.thumb_func
	.type sub_08021358, %function
sub_08021358: @ 08021358
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov sl, r0
	movs r0, #0x74
	adds r4, r1, #0
	muls r4, r0, r4
	sub sp, #0x24
	ldr r2, _08021448
	mov r1, sp
	adds r1, #0xc
	mov r8, r2
	mov sb, r4
	movs r2, #5
	str r1, [sp]
	mov r7, sb
	mov fp, r2
_08021380:
	adds r0, r7, #0
	mov r4, r8
	adds r0, #0xc
	ldr r2, [r4, r0]
	mov r3, sb
	adds r3, #0x60
	ldr r5, [r4, r3]
	asrs r1, r2, #0x1f
	str r2, [sp, #4]
	str r1, [sp, #8]
	movs r6, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r3, r6, #0
	adds r2, r5, #0
	bl __muldi3
	adds r3, r7, #0
	adds r3, #8
	ldr r2, [r4, r3]
	adds r0, r1, #0
	asrs r4, r2, #0x1f
	adds r3, r2, #0
	asrs r1, r1, #0x1f
	adds r0, r0, r3
	adcs r1, r4
	adds r3, r6, #0
	adds r2, r5, #0
	bl __muldi3
	mov r4, r8
	adds r3, r7, #4
	ldr r2, [r4, r3]
	adds r0, r1, #0
	asrs r4, r2, #0x1f
	adds r3, r2, #0
	asrs r1, r1, #0x1f
	adds r0, r0, r3
	adcs r1, r4
	adds r3, r6, #0
	adds r2, r5, #0
	bl __muldi3
	adds r3, r1, #0
	asrs r4, r1, #0x1f
	str r3, [sp, #4]
	str r4, [sp, #8]
	mov r1, r8
	ldr r0, [r1, r7]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r3, r0, #0
	asrs r4, r0, #0x1f
	adds r1, r1, r3
	adcs r2, r4
	str r1, [sp, #4]
	str r2, [sp, #8]
	lsls r1, r2, #0x1f
	ldr r2, [sp, #4]
	adds r4, r1, #0
	lsrs r0, r2, #1
	ldr r2, [sp]
	orrs r4, r0
	stm r2!, {r4}
	movs r1, #1
	rsbs r0, r1, #0
	adds r3, r2, #0
	add fp, r0
	str r3, [sp]
	mov r3, fp
	adds r7, #0x10
	cmp r3, #0
	bge _08021380
	ldr r1, [sp, #0xc]
	mov r4, sl
	str r1, [r4, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x28]
	ldr r2, [sp, #0x14]
	str r2, [r4, #0x2c]
	ldr r1, [sp, #0x18]
	mov r2, sl
	adds r2, #0x54
	strh r1, [r2]
	ldr r0, [sp, #0x1c]
	adds r2, #2
	strh r0, [r2]
	ldr r1, [sp, #0x20]
	adds r2, #2
	strh r1, [r2]
	add sp, #0x24
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08021448:
	.4byte 0x0202E440

	.global act_winlevel
	.thumb_func
	.type act_winlevel, %function
act_winlevel: @ 0802144C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r4, #0xa0
	bl fade_update
	ldr r3, [r4]
	mov sl, r4
	cmp r3, #0
	beq _080214EA
	cmp r3, #1
	beq _08021474
_08021468:
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08021474:
	ldr r5, _080215A4
	movs r6, #0
_08021478:
	movs r2, #0x74
	adds r0, r6, #0
	muls r0, r2, r0
	adds r4, r0, #0
	adds r4, #0x68
	ldr r3, [r5, r4]
	cmp r3, #0
	ble _080214A4
	subs r3, #2
	str r3, [r5, r4]
	adds r3, r0, #0
	adds r3, #0x64
	adds r1, r0, #0
	ldr r2, [r5, r3]
	adds r1, #0x60
	ldr r3, [r5, r1]
	lsls r2, r2, #1
	adds r3, r3, r2
	str r3, [r5, r1]
	ldr r2, [r5, r4]
	cmp r2, #0
	ble _080214D0
_080214A4:
	adds r6, #1
	cmp r6, #3
	ble _08021478
	ldr r1, _080215A8
	ldr r0, [r1]
	movs r1, #0
	bl sub_08021358
	ldr r4, _080215AC
	movs r1, #1
	ldr r0, [r4]
	bl sub_08021358
	ldr r0, [r4, #4]
	movs r1, #2
	bl sub_08021358
	ldr r0, [r4, #8]
	movs r1, #3
	bl sub_08021358
	b _08021468
_080214D0:
	adds r4, r0, #0
	adds r1, #0xc
	adds r4, #0x70
	ldr r2, [r5, r1]
	ldr r0, [r5, r4]
	cmp r2, r0
	bge _080214A4
	adds r0, r2, #1
	str r0, [r5, r1]
	adds r0, r6, #0
	bl get_key
	b _080214A4
_080214EA:
	bl fade_to_normal
	movs r0, #6
	bl camera_op_set
	ldr r2, _080215B0
	ldr r7, _080215AC
	mov r8, r2
	movs r6, #2
_080214FC:
	ldm r7!, {r4}
	ldr r0, _080215B4
	movs r5, #0x30
	strb r5, [r4, #2]
	ldr r5, [r0]
	movs r2, #0x13
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl obj_setup_sprite
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r2, #0x18
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, [r5, #0xc]
	add r1, r8
	lsls r2, r3, #1
	strh r2, [r1, #0xa]
	bl sub_08002FE0
	subs r6, #1
	adds r0, r4, #0
	movs r1, #2
	bl obj_initialise
	cmp r6, #0
	bge _080214FC
	ldr r0, _080215A4
	ldr r5, _080215B8
	ldr r2, _080215BC
	ldrh r1, [r5]
	ldrh r6, [r2]
	adds r4, r0, #0
	ldr r2, _080215C0
	adds r4, #0xe4
	movs r5, #0xac
	str r1, [r0, #0x70]
	str r6, [r4]
	lsls r1, r5, #1
	ldrh r6, [r2]
	ldr r2, _080215C4
	adds r4, r0, r1
	movs r5, #0xe6
	str r6, [r4]
	lsls r1, r5, #1
	ldrh r6, [r2]
	adds r4, r0, r1
	str r6, [r4]
	adds r4, r0, #0
	movs r6, #0
	adds r4, #0x6c
	movs r5, #0
_08021568:
	str r5, [r4]
	adds r0, r6, #0
	adds r6, #1
	adds r4, #0x74
	bl get_key
	cmp r6, #3
	ble _08021568
	ldr r4, _080215A8
	movs r1, #0
	ldr r0, [r4]
	bl sub_08021358
	ldr r4, _080215AC
	movs r1, #1
	ldr r0, [r4]
	bl sub_08021358
	ldr r0, [r4, #4]
	movs r1, #2
	bl sub_08021358
	ldr r0, [r4, #8]
	movs r1, #3
	bl sub_08021358
	movs r0, #1
	mov r2, sl
	str r0, [r2]
	b _08021468
_080215A4:
	.4byte 0x0202E440
_080215A8:
	.4byte 0x0200436C
_080215AC:
	.4byte gRacerObjects
_080215B0:
	.4byte 0x02018F34
_080215B4:
	.4byte gUnk_0884DF24
_080215B8:
	.4byte gUnk_086437C4
_080215BC:
	.4byte gUnk_086437EC
_080215C0:
	.4byte gUnk_08643828
_080215C4:
	.4byte gUnk_08643864
	.byte 0x01, 0x49, 0x01, 0x80, 0x70, 0x47, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

	.global init_winlevel
	.thumb_func
	.type init_winlevel, %function
init_winlevel: @ 080215D4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080215F8
_080215DE:
	ldr r2, _080215F4
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0
	strh r2, [r4]
	add sp, #4
	str r1, [r0]
	str r1, [r0, #4]
	pop {r4}
	pop {r0}
	bx r0
_080215F4:
	.4byte 0x00000001
_080215F8:
	ldr r0, _08021610
	ldr r1, _08021614
	str r0, [sp]
	ldr r2, _08021618
	ldr r0, _0802161C
	movs r3, #0xa0
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080215DE
_08021610:
	.4byte gUnk_08052800
_08021614:
	.4byte gUnk_080527E4
_08021618:
	.4byte gUnk_0805280C
_0802161C:
	.4byte gUnk_080527A8

	.global fe_cups_win2_init
	.thumb_func
	.type fe_cups_win2_init, %function
fe_cups_win2_init: @ 08021620
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r5, _08021664
	ldr r7, _08021670
	ldr r0, _08021674
	strh r5, [r7]
	ldr r1, _08021678
	sub sp, #0x30
	ldr r4, _0802167C
	bl AGBPrintf
	bl sub_0802F1C2
	strh r5, [r7]
	ldr r0, _08021668
	ldrh r1, [r4]
	orrs r1, r0
	strh r1, [r4]
	ldr r0, _08021680
	ldr r3, _0802166C
	ldrh r6, [r0]
	orrs r6, r3
	strh r6, [r0]
	ldr r4, _08021684
	ldr r6, _08021688
	ldr r1, _0802168C
	str r4, [r6]
	str r1, [r6, #4]
	b _08021690
	.byte 0x00, 0x00
_08021664:
	.4byte 0x00000000
_08021668:
	.4byte 0x00000002
_0802166C:
	.4byte 0x00000010
_08021670:
	.4byte 0x04000208
_08021674:
	.4byte gUnk_080528F4
_08021678:
	.4byte gUnk_08052900
_0802167C:
	.4byte 0x04000200
_08021680:
	.4byte 0x04000004
_08021684:
	.4byte sub_08022504
_08021688:
	.4byte gIrqHandler
_0802168C:
	.4byte sub_08022520
_08021690:
	movs r2, #0x80
	ldr r0, _080216C8
	ldr r6, _080216CC
	lsls r1, r2, #0x13
	ldr r4, _080216D0
	strh r6, [r7]
	strh r0, [r1]
	ldr r7, _080216D4
	adds r1, #8
	strh r4, [r1]
	ldr r0, _080216D8
	adds r1, #2
	strh r7, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #4
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	b _080216DC
_080216C8:
	.4byte 0x00001740
_080216CC:
	.4byte 0x00000001
_080216D0:
	.4byte 0x00000088
_080216D4:
	.4byte 0x00000189
_080216D8:
	.4byte 0x0000028A
_080216DC:
	adds r1, #0x36
	strh r5, [r1]
	ldr r0, _0802185C
	bl pal_load
	ldr r4, _08021860
	ldr r0, _08021864
	ldr r3, [r4]
	ldr r1, _08021868
	movs r2, #0xa0
	ldr r7, _0802186C
	bl _call_via_r7
	ldr r7, _08021870
	ldr r0, _08021874
	str r0, [r7]
	subs r0, #2
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r4, r2, #0x18
	ldr r3, _08021878
	lsls r0, r1, #5
	orrs r0, r4
	str r3, [r7, #4]
	str r0, [r7, #8]
	mov r0, sp
	adds r0, #0xe
	ldr r3, [r7, #8]
	ldr r2, _0802187C
	strh r5, [r0]
	movs r5, #0xc0
	lsls r1, r5, #0x13
	ldr r4, _08021880
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r3, [r7, #8]
	ldr r5, _08021884
	str r4, [r7]
	ldr r4, _08021888
	ldr r1, _0802188C
	ldr r2, _08021890
	str r5, [r7, #4]
	str r4, [r7, #8]
	ldr r3, [r7, #8]
	add r5, sp, #8
	str r1, [r7]
	str r2, [r7, #4]
	str r4, [r7, #8]
	movs r4, #0
	ldr r3, [r7, #8]
	movs r1, #0xe0
	str r4, [sp, #8]
	str r5, [r7]
	ldr r5, _08021894
	lsls r2, r1, #0x13
	str r2, [r7, #4]
	str r5, [r7, #8]
	ldr r3, [r7, #8]
	ldr r1, _08021898
	strh r4, [r0]
	str r0, [r7]
	ldr r0, _0802189C
	str r1, [r7, #4]
	str r0, [r7, #8]
	ldr r3, [r7, #8]
	bl fe_spr_init
	movs r2, #0xf8
	ldr r5, _080218A0
	lsls r1, r2, #1
	adds r2, r5, r1
	ldrb r0, [r2]
	cmp r0, #0
	bne _08021774
	b _080218BC
_08021774:
	ldr r1, _080218A4
	str r4, [r1, #4]
	str r4, [r1]
	str r4, [r1, #0x1c]
	str r4, [r1, #0x20]
	str r4, [r1, #8]
	ldrb r3, [r2]
	cmp r3, #3
	bhi _08021852
	adds r7, r3, #0
	movs r5, #3
	subs r3, r5, r7
_0802178C:
	ldr r2, _080218A4
	movs r6, #1
	str r3, [r1, #0x18]
	rsbs r3, r6, #0
	str r3, [r2, #0x48]
	movs r4, #2
	adds r2, #0x4c
_0802179A:
	subs r4, #1
	stm r2!, {r3}
	cmp r4, #0
	bge _0802179A
	add r1, sp, #0x10
	mov lr, r1
	movs r4, #0
	mov r3, lr
_080217AA:
	stm r3!, {r4}
	adds r4, #1
	cmp r4, #7
	ble _080217AA
	ldr r2, _080218A0
	mov ip, r2
	mov sl, ip
	mov fp, lr
	mov sb, ip
_080217BC:
	movs r3, #0
	mov r8, r3
	movs r6, #4
	movs r5, #0
	movs r4, #6
_080217C6:
	mov r7, fp
	ldr r1, [r6, r7]
	ldr r0, [r5, r7]
	lsls r7, r1, #1
	adds r7, #0x2c
	str r7, [sp, #4]
	lsls r2, r0, #1
	adds r2, #0x2c
	mov r3, sl
	ldrsh r3, [r3, r2]
	ldr r7, [sp, #4]
	str r3, [sp]
	mov r2, sl
	ldrsh r2, [r2, r7]
	ldr r7, [sp]
	cmp r7, r2
	bge _080217F4
	mov r7, lr
	str r1, [r5, r7]
	str r0, [r6, r7]
	movs r0, #1
	mov r8, r0
	mov ip, sb
_080217F4:
	subs r4, #1
	adds r6, #4
	adds r5, #4
	cmp r4, #0
	bge _080217C6
	mov r1, r8
	cmp r1, #0
	bne _080217BC
	movs r4, #0
_08021806:
	lsls r7, r4, #2
	mov r5, lr
	ldr r0, [r5, r7]
	lsls r3, r0, #1
	adds r2, r7, #0
	adds r3, #4
	mov r7, ip
	ldr r1, _080218A4
	ldrsh r3, [r7, r3]
	adds r2, #0xc
	adds r4, #1
	str r3, [r1, r2]
	cmp r4, #2
	ble _08021806
	bl fade_to_normal
	movs r0, #0x1a
	bl music_play_if_changed
	ldr r1, _080218A8
	ldr r0, _080218AC
	str r1, [r0]
	ldr r0, _080218B0
	ldr r1, _080218B4
	bl AGBPrintf
	ldr r3, _08021858
	ldr r1, _080218B8
	add sp, #0x30
	strh r3, [r1]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08021852:
	movs r3, #0
	b _0802178C
	.byte 0x00, 0x00
_08021858:
	.4byte 0x00000001
_0802185C:
	.4byte gUnk_08055450
_08021860:
	.4byte gBrightness
_08021864:
	.4byte gUnk_0863C0E0
_08021868:
	.4byte 0x02023FA4
_0802186C:
	.4byte sub_03003BB8
_08021870:
	.4byte 0x040000D4
_08021874:
	.4byte gUnk_08104D58
_08021878:
	.4byte 0x06008000
_0802187C:
	.4byte 0x81000400
_08021880:
	.4byte gUnk_081BC704
_08021884:
	.4byte 0x06000800
_08021888:
	.4byte 0x80000400
_0802188C:
	.4byte gUnk_081BCC08
_08021890:
	.4byte 0x06001000
_08021894:
	.4byte 0x85000100
_08021898:
	.4byte 0x06010000
_0802189C:
	.4byte 0x81004000
_080218A0:
	.4byte gGameSetup
_080218A4:
	.4byte 0x0202E610
_080218A8:
	.4byte fe_cups_win2_process
_080218AC:
	.4byte gStateFunc
_080218B0:
	.4byte gUnk_08052914
_080218B4:
	.4byte gUnk_08052900
_080218B8:
	.4byte 0x04000208
_080218BC:
	strb r6, [r2]
	b _08021774

	.global sub_080218C0
	.thumb_func
	.type sub_080218C0, %function
sub_080218C0: @ 080218C0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	str r1, [sp, #0x10]
	ldr r2, _080219F0
	ldr r3, [r2, #0x34]
	mov fp, r0
	cmp r3, #0
	ble _08021988
	subs r3, #1
	adds r7, r2, #0
	str r3, [r2, #0x34]
_080218E0:
	adds r0, r7, #0
	ldr r2, [r0, #0x44]
	movs r5, #0
	cmp r5, r2
	bge _08021958
	ldr r2, [sp, #0x10]
	lsls r3, r2, #1
	movs r1, #0x38
	adds r3, r3, r2
	ldr r6, _080219F4
	mov sb, r1
	mov sl, r5
	mov r8, r3
_080218FA:
	mov r3, r8
	adds r2, r5, r3
	movs r1, #0x18
	muls r2, r1, r2
	adds r3, r2, #0
	adds r3, #0xc
	ldr r1, [r6, r3]
	cmp r1, #0
	beq _08021948
	ldr r4, [r0, #0x34]
	cmp r4, #0
	beq _0802196A
_08021912:
	mov r1, r8
	adds r3, r5, r1
	movs r0, #0x18
	adds r4, r3, #0
	muls r4, r0, r4
	ldr r0, [r6, r4]
	adds r3, r4, #4
	adds r4, #0x10
	ldr r4, [r6, r4]
	ldr r1, [r6, r3]
	adds r3, #8
	ldr r2, [r6, r3]
	mov r3, sb
	mov lr, r4
	ldr r4, [r7, r3]
	movs r3, #0xc0
	movs r7, #0
	str r4, [sp]
	add r0, fp
	lsls r4, r3, #4
	mov r3, lr
	str r7, [sp, #4]
	str r7, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r7, _080219F0
_08021948:
	movs r0, #4
	add sb, r0
	add sl, r0
	adds r0, r7, #0
	ldr r2, [r0, #0x44]
	adds r5, #1
	cmp r5, r2
	blt _080218FA
_08021958:
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802196A:
	mov r3, sl
	adds r3, #0x38
	ldr r1, [r0, r3]
	cmp r1, #1
	bne _08021912
	adds r7, r2, #0
	adds r7, #0x14
	movs r3, #0xd8
	ldr r0, [r6, r7]
	movs r1, #0x7f
	lsls r2, r3, #8
	bl snd_play
	ldr r7, _080219F0
	b _08021912
_08021988:
	movs r0, #6
	str r0, [r2, #0x34]
	ldr r0, [r2, #0x44]
	movs r5, #0
	cmp r5, r0
	bge _080219EC
	ldr r0, [sp, #0x10]
	lsls r4, r0, #1
	adds r7, r2, #0
	adds r3, r4, r0
	ldr r2, _080219F4
	mov ip, r3
	movs r3, #0x18
	adds r6, r7, #0
	mov r8, r2
	mov lr, r3
_080219A8:
	lsls r1, r5, #2
	adds r0, r1, #0
	adds r1, r5, #0
	add r1, ip
	mov r3, lr
	muls r3, r1, r3
	adds r0, #0x38
	ldr r4, [r6, r0]
	mov sl, r3
	mov r1, r8
	adds r3, #8
	ldr r3, [r1, r3]
	adds r2, r4, #1
	str r2, [r6, r0]
	cmp r2, r3
	beq _080219D6
	adds r2, r5, #1
_080219CA:
	adds r7, r6, #0
	ldr r0, [r7, #0x44]
	adds r5, r2, #0
	cmp r5, r0
	blt _080219A8
	b _080218E0
_080219D6:
	subs r2, r4, #1
	str r2, [r7, r0]
	ldr r0, [r7, #0x44]
	adds r2, r5, #1
	cmp r0, r2
	bne _080219CA
	cmp r2, #2
	bgt _080219CA
	adds r1, r5, #2
	str r1, [r7, #0x44]
	b _080219CA
_080219EC:
	adds r7, r2, #0
	b _080218E0
_080219F0:
	.4byte 0x0202E610
_080219F4:
	.4byte gUnk_0805281C

	.global fe_cups_win2_process
	.thumb_func
	.type fe_cups_win2_process, %function
fe_cups_win2_process: @ 080219F8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	bl fade_update
	ldr r0, _08021D70
	ldr r1, _08021D74
	ldr r3, [r0]
	movs r2, #0xa0
	ldr r0, _08021D78
	ldr r4, _08021D7C
	bl _call_via_r4
	bl sub_08017E1C
	ldr r1, _08021D80
	mov r8, r1
	mov r2, r8
	ldr r3, [r2, #8]
	mov r7, r8
	cmp r3, #5
	bls _08021A2E
	b _08021CD0
_08021A2E:
	ldr r2, _08021D84
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.byte 0x00, 0x00
	.global _08021A38
_08021A38:
	.4byte _08021A50
	.4byte _08021ED0
	.4byte _08021FEC
	.4byte _08022138
	.4byte _08022166
	.4byte _080223A4
	.global _08021A50
_08021A50:
	ldr r6, [r7, #0x48]
	cmp r6, #0
	bge _08021A58
	b _08021EB8
_08021A58:
	ldr r4, _08021D88
	ldr r3, [r4]
	movs r0, #0xd7
	adds r1, r3, #0
	muls r1, r0, r1
	lsls r5, r1, #0x10
	asrs r0, r5, #0x10
	ldr r5, _08021D8C
	bl _call_via_r5
	adds r2, r0, #0
	lsls r3, r2, #0x10
	asrs r2, r3, #0x12
	movs r3, #0x80
	lsls r0, r3, #9
	adds r1, r2, r0
	adds r0, r6, #0
	bl sub_0802EFC6
	ldr r3, [r4]
	ldr r0, _08021D90
	adds r4, r3, #0
	muls r4, r0, r4
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	bl _call_via_r5
	adds r6, r0, #0
	lsls r2, r6, #0x10
	asrs r1, r2, #0x16
	adds r1, #0x7f
	ldr r0, [r7, #0x48]
	bl sub_0802EFF2
	ldr r5, [r7, #0x1c]
	ldr r4, [r7, #0x20]
	adds r5, #1
	asrs r2, r5, #3
	str r5, [r7, #0x1c]
	cmp r2, r4
	beq _08021AD6
	adds r0, r2, #0
	adds r6, r0, #0
	movs r4, #0x1f
	adds r6, #0x1f
	str r2, [r7, #0x20]
	ands r6, r4
	movs r7, #0xc0
	ldr r4, _08021D94
	movs r1, #0
	lsls r2, r6, #1
	lsls r5, r7, #0x13
_08021AC0:
	ldrh r6, [r4]
	muls r6, r1, r6
	adds r7, r0, r6
	lsls r6, r7, #1
	adds r6, #0x42
	ldrh r7, [r4, r6]
	adds r1, #1
	strh r7, [r2, r5]
	adds r2, #0x40
	cmp r1, #0x13
	ble _08021AC0
_08021AD6:
	ldr r7, _08021D80
	ldr r0, _08021D98
	ldr r6, [r7, #0x1c]
	movs r2, #0xfe
	lsls r4, r2, #1
	strh r6, [r0]
	subs r0, r4, r6
	ldr r4, _08021D88
	ldr r3, [r4]
	lsls r5, r3, #1
	adds r1, r5, r3
	lsrs r5, r1, #4
	movs r6, #3
	ands r5, r6
	str r5, [sp]
	ldr r3, _08021D9C
	movs r5, #0
	movs r1, #0x63
	ldr r2, _08021DA0
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, [r4]
	ldr r6, _08021D8C
	lsls r2, r1, #0x1a
	mov sl, r6
	asrs r0, r2, #0x10
	bl _call_via_r10
	lsls r6, r0, #0x10
	asrs r3, r6, #0x19
	lsls r1, r3, #6
	movs r0, #0x84
	adds r2, r1, r3
	mov sb, r4
	ldr r6, _08021DA4
	lsls r4, r0, #4
	adds r0, r2, r4
	ldr r3, [r7, #0xc]
	ldr r2, [r7, #0x1c]
	ldrb r1, [r6, r0]
	movs r6, #0x38
	mov fp, r6
	movs r4, #0xe6
	subs r0, r4, r2
	mov r2, fp
	muls r2, r3, r2
	ldr r4, _08021DA8
	adds r6, r2, #0
	adds r6, #0xc
	adds r2, #8
	str r1, [sp]
	ldr r2, [r4, r2]
	ldr r3, [r4, r6]
	movs r1, #0x50
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	mov r3, sb
	ldr r6, [r3]
	ldr r0, _08021DAC
	adds r1, r6, #0
	muls r1, r0, r1
	mov r8, r4
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r2, r0, #0
	ldr r0, _08021DB0
	adds r1, r6, #0
	muls r1, r0, r1
	lsls r3, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r6, r3, #6
	movs r0, #0x84
	adds r1, r6, r3
	lsls r2, r0, #4
	ldr r6, _08021DA4
	adds r0, r1, r2
	ldrb r1, [r6, r0]
	movs r3, #0x96
	ldr r6, [r7, #0x1c]
	lsls r2, r3, #2
	subs r0, r2, r6
	ldr r6, [r7, #0x10]
	mov r2, fp
	muls r2, r6, r2
	adds r3, r2, #0
	mov r6, r8
	adds r4, #0x3c
	adds r2, #8
	adds r3, #0xc
	str r1, [sp]
	ldr r3, [r6, r3]
	ldr r2, [r6, r2]
	adds r1, r4, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	mov r1, sb
	ldr r6, [r1]
	ldr r0, _08021DB4
	adds r2, r6, #0
	muls r2, r0, r2
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r1, r0, #0
	ldr r0, _08021DB8
	adds r2, r6, #0
	muls r2, r0, r2
	lsls r6, r2, #0x10
	lsls r3, r1, #0x10
	asrs r0, r6, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r2, r3, #6
	movs r0, #0x84
	adds r1, r2, r3
	lsls r6, r0, #4
	ldr r2, _08021DA4
	adds r0, r1, r6
	movs r3, #0xaf
	ldr r6, [r7, #0x1c]
	ldrb r1, [r2, r0]
	lsls r2, r3, #2
	subs r0, r2, r6
	ldr r6, [r7, #0x14]
	mov r2, fp
	muls r2, r6, r2
	adds r3, r2, #0
	mov r6, r8
	adds r4, #0x5a
	adds r2, #8
	adds r3, #0xc
	ldr r2, [r6, r2]
	str r1, [sp]
	ldr r3, [r6, r3]
	adds r1, r4, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r7, #0x4c]
	cmp r2, #0
	bge _08021C20
	b _08021E96
_08021C20:
	ldr r2, _08021D80
	ldr r7, [r2, #0x50]
	mov r8, r2
	cmp r7, #0
	bge _08021C2C
	b _08021E6E
_08021C2C:
	mov r5, r8
	ldr r2, [r5, #0x54]
	cmp r2, #0
	bge _08021C36
	b _08021E4A
_08021C36:
	mov r6, r8
	ldr r0, [r6, #0x4c]
	cmp r0, #0
	blt _08021C4A
	ldr r3, [r6, #0x1c]
	movs r7, #0xe6
	subs r5, r7, r3
	cmp r5, #0
	bge _08021C4A
	b _08021E3E
_08021C4A:
	mov r7, r8
	ldr r0, [r7, #0x50]
	cmp r0, #0
	blt _08021C60
	ldr r5, [r7, #0x1c]
	movs r2, #0x96
	lsls r4, r2, #2
	subs r6, r4, r5
	cmp r6, #0
	bge _08021C60
	b _08021E32
_08021C60:
	mov r1, r8
	ldr r0, [r1, #0x54]
	cmp r0, #0
	blt _08021C76
	ldr r4, [r1, #0x1c]
	movs r5, #0xaf
	lsls r6, r5, #2
	subs r7, r6, r4
	cmp r7, #0
	bge _08021C76
	b _08021E24
_08021C76:
	ldr r0, _08021D88
	ldr r5, [r0]
	ldr r7, _08021DBC
	rsbs r6, r5, #0
	lsls r4, r6, #2
	strh r4, [r7]
	ldr r4, _08021D80
	ldr r3, [r4, #0x1c]
	lsls r1, r6, #4
	adds r7, #4
	strh r1, [r7]
	cmp r3, #0x50
	bne _08021C92
	b _08021E0A
_08021C92:
	movs r2, #0xcd
	lsls r5, r2, #1
	cmp r3, r5
	bne _08021C9C
	b _08021DF0
_08021C9C:
	movs r2, #0xe8
	lsls r6, r2, #1
	cmp r3, r6
	bne _08021CA6
	b _08021DD6
_08021CA6:
	movs r2, #0x8c
	lsls r7, r2, #2
	cmp r3, r7
	bne _08021CB0
	b _08021DC8
_08021CB0:
	ldr r1, _08021D80
	movs r2, #0x8c
	ldr r3, [r1, #0x1c]
	lsls r0, r2, #2
	mov r8, r1
	cmp r3, r0
	ble _08021CD0
	ldr r2, _08021DC0
	ldr r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _08021CD0
	movs r0, #1
	str r0, [r1, #8]
_08021CD0:
	mov r3, r8
	ldr r2, [r3, #4]
	cmp r2, #1
	beq _08021D5A
	cmp r2, #1
	bgt _08021D08
	cmp r2, #0
	beq _08021CF2
_08021CE0:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08021CF2:
	ldr r2, _08021DC0
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08021CE0
	movs r1, #1
	mov r4, r8
	str r1, [r4, #4]
	b _08021CE0
_08021D08:
	cmp r2, #2
	bne _08021CE0
	ldr r2, _08021DC0
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08021CE0
	movs r5, #0
_08021D1C:
	lsls r7, r5, #2
	adds r4, r7, #0
	adds r4, #0x4c
	mov r6, r8
	ldr r0, [r6, r4]
	bl snd_is_playing
	cmp r0, #0
	beq _08021D3A
	ldr r0, [r6, r4]
	bl sub_0802F01E
	movs r1, #1
	rsbs r0, r1, #0
	str r0, [r6, r4]
_08021D3A:
	adds r5, #1
	cmp r5, #2
	ble _08021D1C
	mov r7, r8
	ldr r0, [r7, #0x48]
	bl snd_is_playing
	cmp r0, #0
	beq _08021D52
	ldr r0, [r7, #0x48]
	bl sub_0802F01E
_08021D52:
	movs r0, #0
	bl mcp_process
	b _08021CE0
_08021D5A:
	ldr r1, _08021DC4
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08021CE0
	movs r2, #2
	mov r5, r8
	str r2, [r5, #4]
	bl fade_to_white
	b _08021CE0
_08021D70:
	.4byte gBrightness
_08021D74:
	.4byte 0x02023FA4
_08021D78:
	.4byte gUnk_0863C0E0
_08021D7C:
	.4byte sub_03003BB8
_08021D80:
	.4byte 0x0202E610
_08021D84:
	.4byte _08021A38
_08021D88:
	.4byte 0x03005660
_08021D8C:
	.4byte sub_03000138
_08021D90:
	.4byte 0x00000203
_08021D94:
	.4byte gUnk_081BD108
_08021D98:
	.4byte 0x04000010
_08021D9C:
	.4byte gUnk_0863FC60
_08021DA0:
	.4byte gUnk_0862B6A0
_08021DA4:
	.4byte gUnk_08715A68
_08021DA8:
	.4byte gUnk_080511B4
_08021DAC:
	.4byte 0x000004D2
_08021DB0:
	.4byte 0x00000534
_08021DB4:
	.4byte 0x00000602
_08021DB8:
	.4byte 0x000005E7
_08021DBC:
	.4byte 0x04000014
_08021DC0:
	.4byte gModeFlags
_08021DC4:
	.4byte gKeysNew
_08021DC8:
	ldr r1, [r4, #4]
	cmp r1, #2
	bne _08021DD0
	b _08021CB0
_08021DD0:
	bl fade_to_white
	b _08021CB0
_08021DD6:
	ldr r0, [r4, #0x14]
	movs r7, #0x30
	muls r7, r0, r7
	ldr r1, _08021ECC
	movs r3, #0x80
	adds r7, #4
	ldr r0, [r1, r7]
	lsls r2, r3, #9
	movs r1, #0x7f
	bl snd_play
	ldr r3, [r4, #0x1c]
	b _08021CA6
_08021DF0:
	ldr r0, [r4, #0x10]
	movs r7, #0x30
	muls r7, r0, r7
	ldr r1, _08021ECC
	movs r3, #0x80
	adds r7, #4
	ldr r0, [r1, r7]
	lsls r2, r3, #9
	movs r1, #0x7f
	bl snd_play
	ldr r3, [r4, #0x1c]
	b _08021C9C
_08021E0A:
	ldr r6, [r4, #0xc]
	movs r7, #0x30
	muls r7, r6, r7
	ldr r1, _08021ECC
	movs r3, #0x80
	adds r7, #8
	ldr r0, [r1, r7]
	lsls r2, r3, #9
	movs r1, #0x7f
	bl snd_play
	ldr r3, [r4, #0x1c]
	b _08021C92
_08021E24:
	bl sub_0802F01E
	movs r2, #1
	rsbs r0, r2, #0
	mov r2, r8
	str r0, [r2, #0x54]
	b _08021C76
_08021E32:
	bl sub_0802F01E
	movs r1, #1
	rsbs r0, r1, #0
	str r0, [r7, #0x50]
	b _08021C60
_08021E3E:
	bl sub_0802F01E
	movs r1, #1
	rsbs r2, r1, #0
	str r2, [r6, #0x4c]
	b _08021C4A
_08021E4A:
	ldr r1, [r5, #0x1c]
	movs r0, #0xaf
	lsls r7, r0, #2
	subs r6, r7, r1
	cmp r6, #0xef
	ble _08021E58
	b _08021C36
_08021E58:
	ldr r0, [r5, #0x14]
	bl sub_080040EC
	movs r4, #0x80
	ldr r0, [r0, #0x14]
	movs r1, #0x40
	lsls r2, r4, #9
	bl snd_play
	str r0, [r5, #0x54]
	b _08021C36
_08021E6E:
	ldr r5, [r2, #0x1c]
	movs r4, #0x96
	lsls r0, r4, #2
	subs r1, r0, r5
	cmp r1, #0xef
	ble _08021E7C
	b _08021C2C
_08021E7C:
	mov r3, r8
	ldr r0, [r3, #0x10]
	bl sub_080040EC
	movs r3, #0x80
	ldr r0, [r0, #0x14]
	movs r1, #0x40
	lsls r2, r3, #9
	bl snd_play
	mov r4, r8
	str r0, [r4, #0x50]
	b _08021C2C
_08021E96:
	ldr r4, [r7, #0x1c]
	movs r3, #0xe6
	subs r5, r3, r4
	cmp r5, #0xef
	ble _08021EA2
	b _08021C20
_08021EA2:
	ldr r0, [r7, #0xc]
	bl sub_080040EC
	movs r6, #0x80
	ldr r0, [r0, #0x14]
	movs r1, #0x40
	lsls r2, r6, #9
	bl snd_play
	str r0, [r7, #0x4c]
	b _08021C20
_08021EB8:
	movs r3, #0x80
	movs r0, #0xc4
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	str r0, [r7, #0x48]
	adds r6, r0, #0
	b _08021A58
	.byte 0x00, 0x00
_08021ECC:
	.4byte gUnk_08051B90
	.global _08021ED0
_08021ED0:
	movs r5, #0
_08021ED2:
	lsls r6, r5, #2
	adds r4, r6, #0
	adds r4, #0x4c
	mov r3, r8
	ldr r0, [r3, r4]
	bl snd_is_playing
	cmp r0, #0
	beq _08021EF2
	mov r6, r8
	ldr r0, [r6, r4]
	bl sub_0802F01E
	movs r1, #1
	rsbs r7, r1, #0
	str r7, [r6, r4]
_08021EF2:
	adds r5, #1
	cmp r5, #2
	ble _08021ED2
	mov r7, r8
	ldr r0, [r7, #0x48]
	bl snd_is_playing
	cmp r0, #0
	beq _08021F10
	movs r5, #1
	ldr r0, [r7, #0x48]
	rsbs r4, r5, #0
	bl sub_0802F01E
	str r4, [r7, #0x48]
_08021F10:
	ldr r7, _08021F4C
	movs r1, #0x80
	lsls r6, r1, #0x13
	strh r7, [r6]
	ldr r0, _08021F50
	ldr r7, _08021F54
	str r0, [r7]
	subs r0, #2
	ldrh r2, [r0]
	movs r5, #0x80
	ldr r3, _08021F58
	lsls r1, r2, #5
	lsls r4, r5, #0x18
	orrs r1, r4
	movs r6, #0x80
	str r3, [r7, #4]
	lsls r0, r6, #1
	str r1, [r7, #8]
	mov r1, r8
	ldr r3, [r7, #8]
	movs r2, #0x20
	movs r3, #0x30
	str r0, [r1, #0x24]
	adds r0, #0x80
	str r2, [r1, #0x2c]
	movs r6, #0
	movs r2, #0x1f
	str r0, [r1, #0x28]
	b _08021F5C
	.byte 0x00, 0x00
_08021F4C:
	.4byte 0x00001340
_08021F50:
	.4byte gUnk_08102A56
_08021F54:
	.4byte 0x040000D4
_08021F58:
	.4byte 0x06008000
_08021F5C:
	str r3, [r1, #0x30]
	ldr r5, _08021FE0
	mov sl, r8
	mov ip, r3
	mov r8, r2
	mov lr, r6
_08021F68:
	mov r3, sl
	ldr r3, [r3, #0x2c]
	movs r0, #0
	mov r4, lr
	mov sb, r3
_08021F72:
	mov r7, sb
	adds r1, r0, r7
	adds r2, r1, #0
	mov r3, r8
	ands r2, r3
	adds r7, r4, r2
	lsls r3, r7, #1
	movs r7, #0xc0
	lsls r7, r7, #0x13
	adds r2, r3, r7
	ldrh r3, [r5]
	muls r3, r6, r3
	adds r7, r1, r3
	lsls r3, r7, #1
	adds r3, #4
	ldrh r7, [r5, r3]
	strh r7, [r2]
	mov r2, ip
	adds r1, r0, r2
	mov r3, r8
	ands r1, r3
	adds r7, r4, r1
	ldr r2, _08021FE4
	lsls r3, r7, #1
	adds r1, r3, r2
	ldrh r2, [r5]
	mov r7, ip
	subs r3, r2, r7
	muls r2, r6, r2
	subs r3, r3, r0
	adds r3, r3, r2
	lsls r2, r3, #1
	adds r2, #4
	ldrh r3, [r5, r2]
	ldr r2, _08021FDC
	adds r0, #1
	eors r3, r2
	strh r3, [r1]
	cmp r0, #0x1f
	ble _08021F72
	movs r0, #0x20
	adds r6, #1
	add lr, r0
	cmp r6, #0x13
	ble _08021F68
	bl fade_to_normal
	ldr r2, _08021FE8
	movs r1, #2
	mov r8, r2
	str r1, [r2, #8]
	b _08021CD0
	.byte 0x00, 0x00
_08021FDC:
	.4byte 0x00000400
_08021FE0:
	.4byte gUnk_081BE50C
_08021FE4:
	.4byte 0x06000800
_08021FE8:
	.4byte 0x0202E610
	.global _08021FEC
_08021FEC:
	ldr r3, [r7, #0x24]
	cmp r3, #0
	ble _08021FF6
	subs r3, #1
	str r3, [r7, #0x24]
_08021FF6:
	cmp r3, #0x3c
	bgt _08021FFC
	b _08022128
_08021FFC:
	adds r3, #0x80
_08021FFE:
	str r3, [r7, #0x28]
_08022000:
	ldr r3, _08022098
	mov r8, r3
	ldr r0, [r3, #0x24]
	mov r4, r8
	ldr r7, [r4, #0x2c]
	asrs r2, r0, #3
	cmp r2, r7
	beq _0802203C
	adds r0, r2, #0
	movs r5, #0x1f
	str r2, [r4, #0x2c]
	ands r5, r0
	movs r3, #0xc0
	ldr r4, _0802209C
	lsls r2, r5, #1
	movs r1, #0
	lsls r5, r3, #0x13
_08022022:
	ldrh r7, [r4]
	muls r7, r1, r7
	adds r6, r0, r7
	lsls r7, r6, #1
	adds r7, #4
	ldrh r6, [r4, r7]
	adds r1, #1
	strh r6, [r2, r5]
	adds r2, #0x40
	cmp r1, #0x13
	ble _08022022
	ldr r5, _08022098
	mov r8, r5
_0802203C:
	mov r6, r8
	ldr r0, [r6, #0x24]
	ldr r1, _080220A0
	ldr r2, [r6, #0x28]
	mov r7, r8
	strh r0, [r1]
	ldr r1, [r7, #0x30]
	asrs r6, r2, #3
	cmp r6, r1
	beq _08022088
	cmp r6, r1
	ble _080220E2
	adds r7, r1, #0
	adds r7, #0x1f
	movs r3, #0x1f
	ands r7, r3
	ldr r2, _080220A4
	lsls r0, r7, #1
	ldr r5, _0802209C
	ldr r7, _08022094
	movs r4, #0
	mov ip, r2
_08022068:
	ldrh r2, [r5]
	subs r3, r2, r1
	muls r2, r4, r2
	adds r3, r3, r2
	lsls r2, r3, #1
	subs r2, #0x3a
	ldrh r3, [r5, r2]
	adds r4, #1
	eors r3, r7
	mov r2, ip
	strh r3, [r0, r2]
	adds r0, #0x40
	cmp r4, #0x13
	ble _08022068
_08022084:
	ldr r0, _08022098
	str r6, [r0, #0x30]
_08022088:
	ldr r1, _08022098
	ldr r0, _080220A8
	ldr r2, [r1, #0x28]
	strh r2, [r0]
	ldr r0, [r1, #0x24]
	b _080220AC
_08022094:
	.4byte 0x00000400
_08022098:
	.4byte 0x0202E610
_0802209C:
	.4byte gUnk_081BE50C
_080220A0:
	.4byte 0x04000010
_080220A4:
	.4byte 0x06000800
_080220A8:
	.4byte 0x04000014
_080220AC:
	cmp r0, #0
	bne _080220B8
	movs r3, #0x84
	lsls r3, r3, #1
	cmp r2, r3
	beq _080220BC
_080220B8:
	mov r8, r1
	b _08021CD0
_080220BC:
	movs r2, #3
	str r2, [r1, #8]
	movs r2, #1
	str r2, [r1, #0x44]
	adds r2, r1, #0
	str r0, [r1, #0x34]
	adds r2, #0x38
	movs r0, #0
	movs r3, #2
_080220CE:
	subs r3, #1
	stm r2!, {r0}
	cmp r3, #0
	bge _080220CE
	ldr r2, _0802211C
	movs r0, #0x96
	lsls r1, r0, #1
	mov r8, r2
	str r1, [r2]
	b _08021CD0
_080220E2:
	ldr r1, _0802211C
	ldr r0, [r1, #0x30]
	movs r5, #0x1f
	subs r7, r0, #1
	ands r7, r5
	ldr r3, _08022120
	lsls r1, r7, #1
	ldr r5, _08022124
	ldr r7, _08022118
	movs r4, #0
	mov ip, r3
_080220F8:
	ldrh r2, [r5]
	subs r3, r2, r0
	muls r2, r4, r2
	adds r3, r3, r2
	lsls r2, r3, #1
	adds r2, #2
	ldrh r3, [r5, r2]
	adds r4, #1
	eors r3, r7
	mov r2, ip
	strh r3, [r1, r2]
	adds r1, #0x40
	cmp r4, #0x13
	ble _080220F8
	b _08022084
	.byte 0x00, 0x00
_08022118:
	.4byte 0x00000400
_0802211C:
	.4byte 0x0202E610
_08022120:
	.4byte 0x06000800
_08022124:
	.4byte gUnk_081BE50C
_08022128:
	movs r6, #0x84
	ldr r3, [r7, #0x28]
	lsls r4, r6, #1
	cmp r3, r4
	blt _08022134
	b _08022000
_08022134:
	adds r3, #1
	b _08021FFE
	.global _08022138
_08022138:
	ldr r1, [r7, #0x18]
	movs r0, #0
	bl sub_080218C0
	ldr r3, [r7]
	cmp r3, #0
	ble _0802214E
	subs r3, #1
	mov r8, r7
	str r3, [r7]
	b _08021CD0
_0802214E:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xff
	movs r1, #0x7f
	bl snd_play
	movs r2, #4
	str r2, [r7, #8]
	mov r8, r7
	subs r2, #0x54
	str r2, [r7, #0x1c]
	b _08021CD0
	.global _08022166
_08022166:
	ldr r3, _08022348
	ldr r6, _0802234C
	ldr r4, [r3]
	adds r2, r4, #0
	muls r2, r6, r2
	ldr r6, _08022350
	lsls r5, r2, #0x10
	mov sl, r6
	asrs r0, r5, #0x10
	bl _call_via_r10
	lsls r6, r4, #0x1a
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r2, r6, #0x10
	asrs r5, r0, #0x19
	adds r0, r2, #0
	bl _call_via_r10
	lsls r4, r0, #0x10
	asrs r3, r4, #0x19
	lsls r1, r3, #6
	movs r0, #0x84
	adds r2, r1, r3
	ldr r4, _08022354
	lsls r6, r0, #4
	adds r0, r2, r6
	ldrb r1, [r4, r0]
	ldr r6, [r7, #0xc]
	movs r4, #0x38
	mov fp, r4
	mov r2, fp
	muls r2, r6, r2
	ldr r3, _08022358
	mov r8, r3
	adds r3, r2, #0
	adds r6, r3, #0
	mov r4, r8
	adds r6, #8
	adds r3, #0xc
	ldr r0, [r7, #0x1c]
	ldr r2, [r4, r6]
	ldr r3, [r4, r3]
	movs r4, #0x80
	str r1, [sp]
	adds r5, #0x50
	lsls r1, r4, #5
	str r1, [sp, #8]
	movs r6, #0
	mov sb, r1
	adds r0, #0x32
	adds r1, r5, #0
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r3, _08022348
	ldr r0, _0802235C
	ldr r5, [r3]
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r2, r0, #0
	ldr r0, _08022360
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r3, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r5, r3, #6
	movs r0, #0x84
	adds r1, r5, r3
	lsls r2, r0, #4
	ldr r5, _08022354
	adds r0, r1, r2
	ldrb r1, [r5, r0]
	ldr r5, [r7, #0x10]
	mov r2, fp
	muls r2, r5, r2
	adds r3, r2, #0
	ldr r0, [r7, #0x1c]
	str r1, [sp]
	mov r5, r8
	adds r4, #0x3c
	mov r1, sb
	adds r2, #8
	adds r3, #0xc
	str r1, [sp, #8]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r1, r4, #0
	adds r0, #0x1e
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r3, _08022348
	ldr r0, _08022364
	ldr r5, [r3]
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r2, r0, #0
	ldr r0, _08022368
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r3, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r5, r3, #6
	movs r0, #0x84
	adds r1, r5, r3
	lsls r2, r0, #4
	ldr r5, _08022354
	adds r0, r1, r2
	ldrb r1, [r5, r0]
	ldr r5, [r7, #0x14]
	mov r2, fp
	muls r2, r5, r2
	adds r3, r2, #0
	ldr r0, [r7, #0x1c]
	mov r5, r8
	str r1, [sp]
	adds r4, #0x5a
	mov r1, sb
	adds r2, #8
	adds r3, #0xc
	ldr r3, [r5, r3]
	ldr r2, [r5, r2]
	str r1, [sp, #8]
	adds r0, #0x14
	adds r1, r4, #0
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r7, #0x24]
	ldr r0, [r7, #0x1c]
	rsbs r5, r2, #0
	lsrs r1, r5, #0x1f
	adds r0, #3
	adds r6, r5, r1
	str r0, [r7, #0x1c]
	ldr r1, [r7, #0x18]
	asrs r0, r6, #1
	bl sub_080218C0
	ldr r3, [r7, #0x24]
	cmp r3, #0xff
	bgt _080222F2
	adds r3, #1
	ldr r0, [r7, #0x2c]
	asrs r2, r3, #3
	str r3, [r7, #0x24]
	cmp r2, r0
	beq _080222EA
	adds r0, r2, #0
	adds r5, r0, #0
	movs r4, #0x1f
	adds r5, #0x1f
	ands r5, r4
	movs r6, #0xc0
	ldr r4, _0802236C
	str r2, [r7, #0x2c]
	movs r1, #0
	lsls r2, r5, #1
	lsls r5, r6, #0x13
_080222D4:
	ldrh r3, [r4]
	muls r3, r1, r3
	adds r6, r0, r3
	lsls r3, r6, #1
	adds r3, #0x42
	ldrh r6, [r4, r3]
	adds r1, #1
	strh r6, [r2, r5]
	adds r2, #0x40
	cmp r1, #0x13
	ble _080222D4
_080222EA:
	ldr r2, _08022370
	ldr r1, _08022374
	ldr r0, [r2, #0x24]
	strh r0, [r1]
_080222F2:
	ldr r2, _08022370
	ldr r3, [r2, #0x28]
	mov r8, r2
	cmp r3, #0
	ble _08022380
	subs r3, #1
	str r3, [r2, #0x28]
	mov r4, r8
	ldr r5, [r4, #0x30]
	asrs r2, r3, #3
	cmp r2, r5
	beq _08022336
	str r2, [r4, #0x30]
	movs r7, #0x1f
	adds r4, r2, #0
	ands r7, r4
	lsls r1, r7, #1
	ldr r5, _0802236C
	ldr r7, _08022378
	ldr r6, _08022344
	movs r0, #0
_0802231C:
	ldrh r2, [r5]
	subs r3, r2, r4
	muls r2, r0, r2
	adds r3, r3, r2
	lsls r3, r3, #1
	adds r3, #2
	ldrh r2, [r5, r3]
	adds r0, #1
	eors r2, r6
	strh r2, [r1, r7]
	adds r1, #0x40
	cmp r0, #0x13
	ble _0802231C
_08022336:
	ldr r1, _08022370
	ldr r6, _0802237C
	ldr r3, [r1, #0x28]
	strh r3, [r6]
	mov r8, r1
	b _08022380
	.byte 0x00, 0x00
_08022344:
	.4byte 0x00000400
_08022348:
	.4byte 0x03005660
_0802234C:
	.4byte 0x0000051F
_08022350:
	.4byte sub_03000138
_08022354:
	.4byte gUnk_08715A68
_08022358:
	.4byte gUnk_080511B4
_0802235C:
	.4byte 0x000004D2
_08022360:
	.4byte 0x00000534
_08022364:
	.4byte 0x00000602
_08022368:
	.4byte 0x000005E7
_0802236C:
	.4byte gUnk_081BE50C
_08022370:
	.4byte 0x0202E610
_08022374:
	.4byte 0x04000010
_08022378:
	.4byte 0x06000800
_0802237C:
	.4byte 0x04000014
_08022380:
	mov r5, r8
	movs r0, #0x80
	ldr r1, [r5, #0x24]
	lsls r6, r0, #1
	cmp r1, r6
	beq _0802238E
	b _08021CD0
_0802238E:
	ldr r2, [r5, #4]
	movs r1, #5
	str r1, [r5, #8]
	cmp r2, #2
	bne _0802239A
	b _08021CD0
_0802239A:
	movs r0, #2
	str r0, [r5, #4]
	bl fade_to_white
	b _08021CD0
	.global _080223A4
_080223A4:
	ldr r0, _080224E0
	ldr r2, _080224E4
	ldr r6, [r0]
	adds r1, r6, #0
	muls r1, r2, r1
	ldr r2, _080224E8
	lsls r5, r1, #0x10
	mov sl, r2
	asrs r0, r5, #0x10
	bl _call_via_r10
	adds r3, r0, #0
	lsls r0, r6, #0x1a
	asrs r2, r0, #0x10
	adds r0, r2, #0
	lsls r4, r3, #0x10
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x19
	asrs r5, r4, #0x19
	movs r6, #0x84
	lsls r4, r3, #6
	adds r1, r4, r3
	lsls r2, r6, #4
	ldr r4, _080224EC
	adds r0, r1, r2
	ldr r6, [r7, #0xc]
	ldrb r1, [r4, r0]
	ldr r2, _080224F0
	movs r4, #0x38
	mov fp, r4
	mov r8, r2
	mov r2, fp
	muls r2, r6, r2
	adds r3, r2, #0
	adds r6, r3, #0
	mov r4, r8
	adds r6, #8
	adds r3, #0xc
	ldr r0, [r7, #0x1c]
	ldr r2, [r4, r6]
	ldr r3, [r4, r3]
	movs r4, #0x80
	str r1, [sp]
	adds r5, #0x50
	lsls r1, r4, #5
	str r1, [sp, #8]
	movs r6, #0
	mov sb, r1
	adds r0, #0x32
	adds r1, r5, #0
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r3, _080224E0
	ldr r0, _080224F4
	ldr r5, [r3]
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r2, r0, #0
	ldr r0, _080224F8
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r3, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r5, r3, #6
	movs r0, #0x84
	adds r1, r5, r3
	lsls r2, r0, #4
	ldr r5, _080224EC
	adds r0, r1, r2
	ldrb r1, [r5, r0]
	ldr r5, [r7, #0x10]
	mov r2, fp
	muls r2, r5, r2
	adds r3, r2, #0
	ldr r0, [r7, #0x1c]
	str r1, [sp]
	mov r5, r8
	adds r4, #0x3c
	mov r1, sb
	adds r2, #8
	adds r3, #0xc
	str r1, [sp, #8]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r1, r4, #0
	adds r0, #0x1e
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r3, _080224E0
	ldr r0, _080224FC
	ldr r5, [r3]
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	bl _call_via_r10
	adds r2, r0, #0
	ldr r0, _08022500
	adds r1, r5, #0
	muls r1, r0, r1
	lsls r3, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	asrs r4, r3, #0x19
	bl _call_via_r10
	lsls r1, r0, #0x10
	asrs r3, r1, #0x1a
	lsls r5, r3, #6
	movs r0, #0x84
	adds r1, r5, r3
	lsls r2, r0, #4
	ldr r5, _080224EC
	adds r0, r1, r2
	ldrb r1, [r5, r0]
	ldr r5, [r7, #0x14]
	mov r2, fp
	muls r2, r5, r2
	adds r3, r2, #0
	ldr r0, [r7, #0x1c]
	mov r5, r8
	str r1, [sp]
	adds r4, #0x5a
	mov r1, sb
	adds r2, #8
	adds r3, #0xc
	ldr r2, [r5, r2]
	str r1, [sp, #8]
	adds r0, #0x14
	ldr r3, [r5, r3]
	adds r1, r4, #0
	str r6, [sp, #4]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r7, #0x1c]
	mov r8, r7
	adds r2, #1
	str r2, [r7, #0x1c]
	bl _08021CD0
_080224E0:
	.4byte 0x03005660
_080224E4:
	.4byte 0x0000051F
_080224E8:
	.4byte sub_03000138
_080224EC:
	.4byte gUnk_08715A68
_080224F0:
	.4byte gUnk_080511B4
_080224F4:
	.4byte 0x000004D2
_080224F8:
	.4byte 0x00000534
_080224FC:
	.4byte 0x00000602
_08022500:
	.4byte 0x000005E7

	.global sub_08022504
	.thumb_func
	.type sub_08022504, %function
sub_08022504: @ 08022504
	push {lr}
	bl sub_0800041C
	ldr r0, _0802251C
	movs r2, #0xa0
	ldrh r1, [r0]
	lsls r0, r2, #0x13
	strh r1, [r0]
	bl sub_08000444
	pop {r0}
	bx r0
_0802251C:
	.4byte 0x02023FA4

	.global sub_08022520
	.thumb_func
	.type sub_08022520, %function
sub_08022520: @ 08022520
	push {lr}
	ldr r0, _08022540
	ldrh r1, [r0]
	adds r1, #1
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bhi _0802253C
	ldr r3, _08022544
	lsls r1, r2, #1
	ldrh r0, [r3, r1]
	movs r3, #0xa0
	lsls r1, r3, #0x13
	strh r0, [r1]
_0802253C:
	pop {r0}
	bx r0
_08022540:
	.4byte 0x04000006
_08022544:
	.4byte 0x02023FA4

	.global fe_cups_trophy_init
	.thumb_func
	.type fe_cups_trophy_init, %function
fe_cups_trophy_init: @ 08022548
	push {r4, r5, r6, lr}
	ldr r6, _080225A0
	ldr r0, _080225A4
	adds r1, r6, #0
	sub sp, #8
	bl AGBPrintf
	ldr r5, _0802258C
	ldr r4, _080225A8
	ldr r0, _080225AC
	strh r5, [r4]
	movs r3, #3
	ldrh r2, [r0]
	rsbs r1, r3, #0
	ands r1, r2
	strh r1, [r0]
	ldr r3, _080225B0
	ldr r1, _080225B4
	ldr r0, _08022590
	str r3, [r1]
	movs r2, #0x80
	ldr r1, _08022594
	strh r0, [r4]
	lsls r4, r2, #0x13
	ldr r0, _08022598
	strh r1, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r5, [r4]
	ldr r1, _0802259C
	adds r4, #2
	b _080225B8
	.byte 0x00, 0x00
_0802258C:
	.4byte 0x00000000
_08022590:
	.4byte 0x00000001
_08022594:
	.4byte 0x00009140
_08022598:
	.4byte 0x00000084
_0802259C:
	.4byte 0x00003F1F
_080225A0:
	.4byte gUnk_08052920
_080225A4:
	.4byte gUnk_08052934
_080225A8:
	.4byte 0x04000208
_080225AC:
	.4byte 0x04000200
_080225B0:
	.4byte vblank_handler
_080225B4:
	.4byte gIrqHandler
_080225B8:
	strh r5, [r4]
	ldr r0, _080225F4
	adds r4, #0x38
	strh r1, [r4]
	adds r4, #6
	ldr r1, _080225F8
	strh r0, [r4]
	adds r4, #4
	movs r0, #0xc0
	strh r1, [r4]
	lsls r2, r0, #0x13
	ldr r1, _08022600
	mov r4, sp
	ldr r0, _08022604
	adds r4, #6
	strh r5, [r4]
	str r4, [r1]
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _080225FC
	ldr r3, [r1, #8]
	ldr r0, _08022608
	strh r2, [r4]
	ldr r2, _0802260C
	str r4, [r1]
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, _08022610
	b _08022614
	.byte 0x00, 0x00
_080225F4:
	.4byte 0x000000EF
_080225F8:
	.4byte 0x00000003
_080225FC:
	.4byte 0x00007FFF
_08022600:
	.4byte 0x040000D4
_08022604:
	.4byte 0x81008000
_08022608:
	.4byte gPalBuffer
_0802260C:
	.4byte 0x81000100
_08022610:
	.4byte gPalDirty
_08022614:
	ldr r3, [r1, #8]
	ldr r2, _0802266C
	ldr r3, [r0]
	orrs r3, r2
	str r3, [r0]
	movs r0, #0xf8
	str r0, [sp]
	ldr r2, _08022670
	ldr r0, _08022674
	mov r3, sp
	str r3, [r1]
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _08022678
	ldr r0, _0802267C
	ldr r3, [r1, #8]
	strh r5, [r4]
	str r4, [r1]
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r3, [r1, #8]
	bl fe_spr_init
	ldr r0, _08022680
	movs r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	movs r0, #0x1a
	bl music_play_if_changed
	bl fade_to_normal
	ldr r1, _08022684
	ldr r0, _08022688
	str r1, [r0]
	ldr r0, _0802268C
	adds r1, r6, #0
	bl AGBPrintf
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0802266C:
	.4byte 0x0000FFFF
_08022670:
	.4byte 0x02000008
_08022674:
	.4byte 0x85000100
_08022678:
	.4byte 0x06010000
_0802267C:
	.4byte 0x81004000
_08022680:
	.4byte 0x0202E668
_08022684:
	.4byte fe_cups_trophy_process
_08022688:
	.4byte gStateFunc
_0802268C:
	.4byte gUnk_08052940

	.global fe_cups_trophy_process
	.thumb_func
	.type fe_cups_trophy_process, %function
fe_cups_trophy_process: @ 08022690
	push {r4, r5, r6, lr}
	sub sp, #0x10
	bl fade_update
	bl sub_08017E1C
	movs r1, #0
	movs r0, #0xaf
	bl sub_080189E4
	ldr r5, _08022820
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	adds r1, r0, #0
	lsrs r3, r1, #0x1f
	adds r6, r1, r3
	asrs r2, r6, #1
	movs r0, #8
	movs r6, #0x78
	subs r3, r6, r2
	str r0, [sp]
	movs r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08018B10
	movs r1, #0
	movs r0, #0xb0
	bl sub_080189E4
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	adds r1, r0, #0
	lsrs r3, r1, #0x1f
	adds r0, r1, r3
	asrs r2, r0, #1
	movs r1, #0x20
	subs r3, r6, r2
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_08018B10
	movs r0, #0xf8
	ldr r1, _08022824
	lsls r3, r0, #1
	adds r0, r1, r3
	ldrb r3, [r0]
	cmp r3, #2
	bne _08022700
	b _080227E0
_08022700:
	cmp r3, #2
	bgt _0802277E
	cmp r3, #1
	beq _08022748
_08022708:
	ldr r4, _08022828
	ldr r3, [r4]
	cmp r3, #0
	beq _08022732
	cmp r3, #1
	beq _0802271C
_08022714:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0802271C:
	ldr r2, _0802282C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08022714
	movs r0, #0
	bl mcp_process
	b _08022714
_08022732:
	ldr r2, _08022830
	ldrh r0, [r2]
	movs r1, #0xb
	ands r1, r0
	cmp r1, #0
	beq _08022714
	bl fade_to_black
	movs r1, #1
	str r1, [r4]
	b _08022714
_08022748:
	movs r4, #0
	ldr r2, _08022834
	ldr r3, _08022838
	movs r0, #0x78
	movs r1, #0x5a
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r1, #0
	movs r0, #0xb1
	bl sub_080189E4
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	adds r3, r0, #0
	lsrs r0, r3, #0x1f
	adds r1, r3, r0
	asrs r0, r1, #1
	subs r3, r6, r0
	adds r1, r5, #0
	adds r0, r4, #0
	b _08022814
_0802277E:
	cmp r3, #3
	beq _080227C4
	cmp r3, #4
	bne _08022708
	movs r4, #0
	ldr r2, _0802283C
	ldr r3, _08022840
	movs r0, #0x78
	movs r1, #0x5a
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r1, #0
	movs r0, #0xb4
	bl sub_080189E4
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	adds r3, r0, #0
	lsrs r0, r3, #0x1f
	adds r1, r3, r0
	asrs r2, r1, #1
	subs r3, r6, r2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	str r6, [sp]
	bl sub_08018B10
	b _08022708
_080227C4:
	movs r4, #0
	ldr r2, _08022844
	ldr r3, _08022848
	movs r0, #0x78
	movs r1, #0x5a
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r1, #0
	movs r0, #0xb3
	b _080227FA
_080227E0:
	movs r4, #0
	ldr r2, _0802284C
	ldr r3, _08022850
	movs r0, #0x78
	movs r1, #0x5a
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r1, #0
	movs r0, #0xb2
_080227FA:
	bl sub_080189E4
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	adds r3, r0, #0
	lsrs r0, r3, #0x1f
	adds r1, r3, r0
	asrs r2, r1, #1
	subs r3, r6, r2
	adds r0, r4, #0
	adds r1, r5, #0
_08022814:
	movs r2, #0
	str r6, [sp]
	bl sub_08018B10
	b _08022708
	.byte 0x00, 0x00
_08022820:
	.4byte gUnk_0863FDE8
_08022824:
	.4byte gGameSetup
_08022828:
	.4byte 0x0202E668
_0802282C:
	.4byte gModeFlags
_08022830:
	.4byte gKeysNew
_08022834:
	.4byte gUnk_08296500
_08022838:
	.4byte gUnk_0863F1C0
_0802283C:
	.4byte gUnk_0831EDA0
_08022840:
	.4byte gUnk_0863F260
_08022844:
	.4byte gUnk_0843F480
_08022848:
	.4byte gUnk_0863F6C0
_0802284C:
	.4byte gUnk_08629010
_08022850:
	.4byte gUnk_0863FB00

	.global fe_boss_win_init
	.thumb_func
	.type fe_boss_win_init, %function
fe_boss_win_init: @ 08022854
	push {r4, r5, r6, lr}
	ldr r5, _0802288C
	ldr r4, _08022898
	ldr r0, _0802289C
	strh r5, [r4]
	ldr r1, _080228A0
	sub sp, #8
	ldr r6, _080228A4
	bl AGBPrintf
	bl sub_0802F1C2
	strh r5, [r4]
	ldr r0, _08022890
	ldrh r1, [r6]
	orrs r1, r0
	strh r1, [r6]
	ldr r6, _080228A8
	ldr r3, _08022894
	ldrh r0, [r6]
	orrs r0, r3
	strh r0, [r6]
	ldr r1, _080228AC
	ldr r6, _080228B0
	ldr r0, _080228B4
	str r1, [r6]
	b _080228B8
	.byte 0x00, 0x00
_0802288C:
	.4byte 0x00000000
_08022890:
	.4byte 0x00000002
_08022894:
	.4byte 0x00000010
_08022898:
	.4byte 0x04000208
_0802289C:
	.4byte gUnk_0805294C
_080228A0:
	.4byte gUnk_08052958
_080228A4:
	.4byte 0x04000200
_080228A8:
	.4byte 0x04000004
_080228AC:
	.4byte sub_08023030
_080228B0:
	.4byte gIrqHandler
_080228B4:
	.4byte sub_0802304C
_080228B8:
	str r0, [r6, #4]
	ldr r6, _080228F0
	movs r2, #0x80
	ldr r1, _080228F4
	strh r6, [r4]
	ldr r0, _080228F8
	lsls r4, r2, #0x13
	strh r1, [r4]
	ldr r1, _080228FC
	adds r4, #8
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #6
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #0x3a
	strh r5, [r4]
	ldr r0, _08022900
	bl pal_load
	ldr r2, _08022904
	b _08022908
_080228F0:
	.4byte 0x00000001
_080228F4:
	.4byte 0x00001340
_080228F8:
	.4byte 0x00000088
_080228FC:
	.4byte 0x00000189
_08022900:
	.4byte gUnk_08055450
_08022904:
	.4byte gBrightness
_08022908:
	ldr r0, _08022A20
	ldr r3, [r2]
	ldr r1, _08022A24
	movs r2, #0xa0
	ldr r4, _08022A28
	bl _call_via_r4
	ldr r2, _08022A2C
	ldr r0, _08022A30
	str r0, [r2]
	subs r0, #2
	ldrh r1, [r0]
	lsls r0, r1, #5
	movs r1, #0x80
	lsls r4, r1, #0x18
	ldr r3, _08022A34
	orrs r0, r4
	str r3, [r2, #4]
	str r0, [r2, #8]
	mov r0, sp
	adds r0, #6
	ldr r3, [r2, #8]
	strh r5, [r0]
	movs r3, #0xc0
	ldr r5, _08022A38
	lsls r4, r3, #0x13
	str r0, [r2]
	str r4, [r2, #4]
	str r5, [r2, #8]
	ldr r5, _08022A3C
	ldr r3, [r2, #8]
	str r5, [r2]
	str r4, [r2, #4]
	ldr r4, _08022A40
	ldr r1, _08022A44
	str r4, [r2, #8]
	ldr r5, _08022A48
	ldr r3, [r2, #8]
	str r1, [r2]
	str r5, [r2, #4]
	movs r1, #0xe0
	str r4, [r2, #8]
	lsls r5, r1, #0x13
	ldr r1, _08022A4C
	ldr r3, [r2, #8]
	movs r4, #0
	mov r3, sp
	str r4, [sp]
	str r3, [r2]
	str r5, [r2, #4]
	str r1, [r2, #8]
	ldr r5, _08022A50
	ldr r3, [r2, #8]
	strh r4, [r0]
	str r0, [r2]
	ldr r0, _08022A54
	str r5, [r2, #4]
	str r0, [r2, #8]
	ldr r3, [r2, #8]
	bl fe_spr_init
	movs r2, #0xf8
	ldr r0, _08022A58
	lsls r1, r2, #1
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	bne _08022992
	b _08022A78
_08022992:
	ldr r1, _08022A5C
	movs r2, #1
	rsbs r5, r2, #0
	str r4, [r1, #4]
	str r4, [r1]
	str r4, [r1, #8]
	str r5, [r1, #0x2c]
	adds r6, r0, #0
	adds r6, #0xa0
	ldrb r2, [r6]
	lsls r3, r2, #1
	adds r3, #4
	ldrsh r3, [r0, r3]
	str r3, [r1, #0xc]
	adds r3, r0, #0
	adds r3, #0xa1
	ldrb r6, [r3]
	lsls r3, r6, #1
	adds r3, #4
	ldrsh r3, [r0, r3]
	str r3, [r1, #0x10]
	ldr r3, _08022A60
	ldr r3, [r3]
	movs r0, #0
	cmp r2, r3
	beq _08022A16
_080229C6:
	adds r3, r1, #0
	str r0, [r1, #0x14]
	str r4, [r1, #0x34]
	str r4, [r1, #0x30]
	movs r2, #0
	adds r3, #0x38
	adds r0, r5, #0
	movs r1, #9
_080229D6:
	subs r1, #1
	str r2, [r3]
	str r2, [r3, #4]
	str r2, [r3, #8]
	str r2, [r3, #0xc]
	str r2, [r3, #0x10]
	strh r2, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r2, [r3, #0x1c]
	str r0, [r3, #0x20]
	adds r3, #0x24
	cmp r1, #0
	bge _080229D6
	bl fade_to_normal
	movs r0, #0x1a
	bl music_play_if_changed
	ldr r1, _08022A64
	ldr r0, _08022A68
	str r1, [r0]
	ldr r0, _08022A6C
	ldr r1, _08022A70
	bl AGBPrintf
	ldr r3, _08022A1C
	ldr r1, _08022A74
	add sp, #8
	strh r3, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08022A16:
	movs r0, #1
	b _080229C6
	.byte 0x00, 0x00
_08022A1C:
	.4byte 0x00000001
_08022A20:
	.4byte gUnk_0863C0E0
_08022A24:
	.4byte 0x02023FA4
_08022A28:
	.4byte sub_03003BB8
_08022A2C:
	.4byte 0x040000D4
_08022A30:
	.4byte gUnk_08104D58
_08022A34:
	.4byte 0x06008000
_08022A38:
	.4byte 0x81000400
_08022A3C:
	.4byte gUnk_081BC704
_08022A40:
	.4byte 0x80000400
_08022A44:
	.4byte gUnk_081BCC08
_08022A48:
	.4byte 0x06000800
_08022A4C:
	.4byte 0x85000100
_08022A50:
	.4byte 0x06010000
_08022A54:
	.4byte 0x81004000
_08022A58:
	.4byte gGameSetup
_08022A5C:
	.4byte 0x0202E670
_08022A60:
	.4byte gLocalPlayerIndex
_08022A64:
	.4byte fe_boss_win_process
_08022A68:
	.4byte gStateFunc
_08022A6C:
	.4byte gUnk_0805296C
_08022A70:
	.4byte gUnk_08052958
_08022A74:
	.4byte 0x04000208
_08022A78:
	strb r6, [r2]
	b _08022992

	.global fe_boss_win_process
	.thumb_func
	.type fe_boss_win_process, %function
fe_boss_win_process: @ 08022A7C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	bl fade_update
	ldr r0, _08022B54
	ldr r1, _08022B58
	ldr r3, [r0]
	movs r2, #0xa0
	ldr r0, _08022B5C
	ldr r4, _08022B60
	bl _call_via_r4
	bl sub_08017E1C
	ldr r0, _08022B64
	ldr r7, [r0, #8]
	cmp r7, #0
	beq _08022B70
_08022AAA:
	ldr r0, _08022B64
	ldr r2, [r0, #4]
	cmp r2, #1
	beq _08022B3C
	cmp r2, #1
	bgt _08022AE2
	cmp r2, #0
	beq _08022ACC
_08022ABA:
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08022ACC:
	ldr r2, _08022B68
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08022ABA
	ldr r1, _08022B64
	movs r0, #1
	str r0, [r1, #4]
	b _08022ABA
_08022AE2:
	cmp r2, #2
	bne _08022ABA
	ldr r2, _08022B68
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08022ABA
	movs r5, #0
_08022AF6:
	movs r0, #0x24
	muls r0, r5, r0
	ldr r3, _08022B64
	adds r4, r0, #0
	adds r4, #0x58
	ldr r0, [r3, r4]
	bl snd_is_playing
	cmp r0, #0
	beq _08022B1A
	ldr r1, _08022B64
	ldr r0, [r1, r4]
	bl sub_0802F01E
	movs r0, #1
	ldr r1, _08022B64
	rsbs r2, r0, #0
	str r2, [r1, r4]
_08022B1A:
	adds r5, #1
	cmp r5, #9
	ble _08022AF6
	ldr r3, _08022B64
	ldr r0, [r3, #0x2c]
	bl snd_is_playing
	cmp r0, #0
	beq _08022B34
	ldr r1, _08022B64
	ldr r0, [r1, #0x2c]
	bl sub_0802F01E
_08022B34:
	movs r0, #0
	bl mcp_process
	b _08022ABA
_08022B3C:
	ldr r0, _08022B6C
	ldrh r1, [r0]
	ands r1, r2
	cmp r1, #0
	beq _08022ABA
	ldr r2, _08022B64
	movs r1, #2
	str r1, [r2, #4]
	bl fade_to_white
	b _08022ABA
	.byte 0x00, 0x00
_08022B54:
	.4byte gBrightness
_08022B58:
	.4byte 0x02023FA4
_08022B5C:
	.4byte gUnk_0863C0E0
_08022B60:
	.4byte sub_03003BB8
_08022B64:
	.4byte 0x0202E670
_08022B68:
	.4byte gModeFlags
_08022B6C:
	.4byte gKeysNew
_08022B70:
	ldr r4, [r0, #0x2c]
	cmp r4, #0
	bge _08022B78
	b _08023000
_08022B78:
	ldr r6, _08022EE8
	ldr r3, [r6]
	movs r0, #0xd7
	adds r1, r3, #0
	muls r1, r0, r1
	lsls r5, r1, #0x10
	asrs r0, r5, #0x10
	ldr r5, _08022EEC
	bl _call_via_r5
	adds r3, r0, #0
	lsls r2, r3, #0x10
	asrs r0, r2, #0x12
	movs r2, #0x80
	lsls r3, r2, #9
	adds r1, r0, r3
	adds r0, r4, #0
	bl sub_0802EFC6
	ldr r3, [r6]
	ldr r0, _08022EF0
	adds r4, r3, #0
	muls r4, r0, r4
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	bl _call_via_r5
	adds r2, r0, #0
	lsls r3, r2, #0x10
	ldr r4, _08022EF4
	asrs r1, r3, #0x16
	adds r1, #0x7f
	ldr r0, [r4, #0x2c]
	bl sub_0802EFF2
	ldr r0, [r6]
	ldr r2, _08022EF4
	rsbs r3, r0, #0
	ldr r0, [r2, #0x30]
	lsls r4, r3, #2
	subs r1, r4, r0
	ldr r4, _08022EF8
	ldr r2, _08022EF4
	strh r1, [r4]
	lsls r4, r3, #4
	subs r1, r4, r0
	ldr r0, _08022EFC
	ldr r4, [r2]
	strh r1, [r0]
	cmp r4, #0
	bne _08022BE0
	b _08022FCC
_08022BE0:
	cmp r4, #0xdb
	bhi _08022C2A
	ldr r4, _08022EF4
	movs r1, #0xfa
	str r1, [r4, #0x40]
	ldr r0, _08022F00
	ldr r4, [r6]
	adds r2, r4, #0
	muls r2, r0, r2
	lsls r3, r2, #0x10
	asrs r0, r3, #0x10
	bl _call_via_r5
	lsls r1, r0, #0x10
	ldr r3, _08022EF4
	lsls r0, r4, #0x1a
	asrs r2, r1, #0x19
	adds r2, #0x5a
	asrs r1, r0, #0x10
	str r2, [r3, #0x44]
	adds r0, r1, #0
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r1, r3, #0x19
	ldr r2, _08022EF4
	lsls r4, r1, #6
	str r1, [r2, #0x4c]
	adds r2, r4, r1
	movs r1, #0x84
	lsls r4, r1, #4
	ldr r0, _08022F04
	adds r1, r2, r4
	ldrb r4, [r0, r1]
	ldr r2, _08022EF4
	str r4, [r2, #0x48]
	ldr r4, [r2]
_08022C2A:
	cmp r4, #0
	blt _08022C72
	movs r1, #0xc8
	ldr r4, _08022EF4
	lsls r2, r1, #1
	str r2, [r4, #0x64]
	ldr r0, _08022F08
	ldr r4, [r6]
	adds r1, r4, #0
	muls r1, r0, r1
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r6, r3, #0x19
	ldr r1, _08022EF4
	lsls r0, r4, #0x1a
	asrs r2, r0, #0x10
	adds r6, #0x50
	str r6, [r1, #0x68]
	adds r0, r2, #0
	bl _call_via_r5
	lsls r4, r0, #0x10
	asrs r3, r4, #0x19
	lsls r5, r3, #6
	movs r6, #0x84
	adds r2, r5, r3
	lsls r1, r6, #4
	ldr r0, _08022F04
	adds r4, r2, r1
	ldrb r5, [r0, r4]
	ldr r6, _08022EF4
	str r5, [r6, #0x6c]
	ldr r4, [r6]
_08022C72:
	cmp r4, #0x63
	bhi _08022C80
	ldr r5, _08022EF4
	ldr r6, [r5, #0x30]
	adds r6, #2
	str r6, [r5, #0x30]
	str r7, [r5, #0x34]
_08022C80:
	movs r7, #0
	movs r0, #0x80
	movs r1, #0xa0
	movs r6, #0
	movs r2, #0x8c
	str r7, [sp, #0x10]
	mov fp, r0
	mov sb, r1
	movs r7, #0x88
	mov r8, r2
	mov sl, r6
_08022C96:
	ldr r0, _08022EF4
	mov r5, sl
	ldr r3, [r0]
	adds r5, #0x64
	cmp r3, r5
	bne _08022CA4
	b _08022F92
_08022CA4:
	cmp r3, r5
	ble _08022CB4
	cmp r3, r8
	bge _08022CB4
	ldr r0, _08022EF4
	ldr r5, [r0, r7]
	subs r5, #3
	str r5, [r0, r7]
_08022CB4:
	ldr r5, _08022EF4
	ldr r2, [r5]
	cmp r2, r8
	bne _08022CBE
	b _08022F58
_08022CBE:
	cmp r2, r8
	ble _08022CD0
	mov r3, sl
	adds r3, #0xa0
	cmp r2, r3
	bge _08022CD0
	ldr r4, [r5, r7]
	adds r4, #0x10
	str r4, [r5, r7]
_08022CD0:
	ldr r0, _08022EF4
	ldr r5, [r0]
	cmp r5, sb
	bne _08022CDA
	b _08022F50
_08022CDA:
	ldr r1, [sp, #0x10]
	movs r0, #0xa
	movs r3, #0x24
	adds r1, #1
	add fp, r3
	add sb, r0
	adds r7, #0x24
	adds r6, #0x24
	add r8, r0
	add sl, r0
	str r1, [sp, #0x10]
	cmp r1, #7
	ble _08022C96
	ldr r1, _08022EF4
	ldr r2, [r1]
	adds r6, r2, #0
	subs r6, #0xdc
	cmp r6, #0x4f
	bhi _08022D32
	ldr r7, _08022F0C
	lsls r6, r2, #4
	adds r0, r6, r7
	ldr r4, [r1, #0x44]
	asrs r5, r0, #8
	ldr r0, [r1, #0x4c]
	adds r7, r4, r5
	str r7, [r1, #0x44]
	cmp r0, #0xf
	bgt _08022D1A
	adds r2, r0, #1
	str r2, [r1, #0x4c]
	adds r0, r2, #0
_08022D1A:
	movs r1, #0x41
	bl __modsi3
	movs r2, #0x84
	lsls r4, r0, #6
	adds r6, r4, r0
	lsls r7, r2, #4
	ldr r0, _08022F04
	adds r5, r6, r7
	ldrb r1, [r0, r5]
	ldr r4, _08022EF4
	str r1, [r4, #0x48]
_08022D32:
	ldr r2, _08022EF4
	movs r3, #0x8c
	ldr r5, [r2]
	lsls r1, r3, #1
	cmp r5, r1
	blt _08022D6E
	ldr r0, [r2, #0x14]
	cmp r0, #0
	bne _08022D46
	b _08022F42
_08022D46:
	ldr r7, [r2, #0x64]
	ldr r6, [r2, #0x68]
	adds r1, r7, #0
	adds r0, r6, #0
_08022D4E:
	subs r1, #0x78
	subs r0, #0x50
	ldr r4, _08022EF4
	ldr r6, [r4, #0x30]
	subs r7, r1, r6
	adds r7, #0x1f
	asrs r2, r7, #5
	adds r5, r6, r2
	ldr r6, _08022EF4
	ldr r7, [r6, #0x34]
	subs r4, r0, r7
	adds r4, #0xf
	asrs r0, r4, #4
	adds r1, r7, r0
	str r5, [r6, #0x30]
	str r1, [r6, #0x34]
_08022D6E:
	ldr r2, _08022EF4
	movs r3, #0x91
	ldr r5, [r2]
	lsls r1, r3, #1
	cmp r5, r1
	ble _08022DAE
	ldr r0, [r2, #0x14]
	cmp r0, #0
	bne _08022D82
	b _08022F3E
_08022D82:
	movs r0, #0xb5
_08022D84:
	movs r1, #0
	bl sub_080189E4
	adds r5, r0, #0
	ldr r6, _08022F10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08018A78
	lsrs r7, r0, #0x1f
	adds r1, r0, r7
	asrs r4, r1, #1
	movs r2, #0x78
	subs r3, r2, r4
	movs r7, #0x7f
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08022F14
	str r7, [sp]
	bl sub_08018B10
_08022DAE:
	ldr r1, _08022EF4
	ldr r5, [r1]
	cmp r5, #0x64
	bne _08022DB8
	b _08022EC2
_08022DB8:
	ldr r1, _08022EF4
	ldr r0, [r1]
	cmp r0, #0xe6
	beq _08022E82
_08022DC0:
	ldr r0, _08022EF4
	ldr r3, [r0]
	cmp r3, #0xee
	beq _08022E70
_08022DC8:
	ldr r2, _08022F18
	cmp r3, r2
	beq _08022E36
_08022DCE:
	ldr r4, _08022EF4
	movs r7, #0x80
	ldr r6, [r4]
	lsls r1, r7, #3
	cmp r6, r1
	beq _08022E26
_08022DDA:
	ldr r1, _08022F1C
	mov r8, r1
	mov r7, r8
	movs r6, #0
	subs r7, #0x38
_08022DE4:
	movs r1, #0x24
	muls r1, r6, r1
	mov r2, r8
	adds r4, r1, r2
	ldr r5, [r4]
	cmp r5, #0
	beq _08022E16
	ldr r1, [r4, #8]
	ldr r2, [r7, #0x30]
	ldr r3, [r7, #0x34]
	subs r0, r1, r2
	ldr r2, [r4, #0xc]
	subs r1, r2, r3
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #4]
	str r2, [sp]
	ldrh r2, [r4, #0x18]
	str r2, [sp, #4]
	ldrh r2, [r4, #0x1a]
	str r2, [sp, #8]
	ldrh r2, [r4, #0x1c]
	str r2, [sp, #0xc]
	adds r2, r5, #0
	bl fe_spr_plot
_08022E16:
	adds r6, #1
	cmp r6, #9
	ble _08022DE4
	ldr r0, _08022EF4
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	b _08022AAA
_08022E26:
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _08022DDA
	movs r5, #2
	bl fade_to_white
	str r5, [r4, #4]
	b _08022DDA
_08022E36:
	ldr r1, _08022EF4
	ldr r7, [r1, #0x14]
	cmp r7, #0
	beq _08022E56
	ldr r0, [r1, #0xc]
	movs r1, #0x30
	muls r1, r0, r1
	ldr r6, _08022F20
	adds r1, #8
	movs r5, #0x80
	ldr r0, [r6, r1]
	lsls r2, r5, #9
	movs r1, #0x7f
	bl snd_play
	b _08022DCE
_08022E56:
	ldr r2, _08022EF4
	ldr r5, [r2, #0xc]
	movs r7, #0x30
	muls r7, r5, r7
	ldr r3, _08022F20
	adds r7, #0x10
	movs r4, #0x80
	ldr r0, [r3, r7]
	movs r1, #0x7f
	lsls r2, r4, #9
	bl snd_play
	b _08022DCE
_08022E70:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #4
	movs r1, #0x50
	bl snd_play
	ldr r4, _08022EF4
	ldr r3, [r4]
	b _08022DC8
_08022E82:
	ldr r0, [r1, #0xc]
	bl sub_080040EC
	ldr r1, [r0, #0x10]
	cmp r1, #1
	beq _08022EA8
	ldr r6, _08022EF4
	ldr r5, [r6, #0x10]
	movs r1, #0x30
	muls r1, r5, r1
	ldr r7, _08022F20
	adds r1, #0x1c
	movs r3, #0x80
	ldr r0, [r7, r1]
	lsls r2, r3, #9
	movs r1, #0x7f
	bl snd_play
	b _08022DC0
_08022EA8:
	ldr r2, _08022EF4
	ldr r4, [r2, #0x10]
	movs r5, #0x30
	muls r5, r4, r5
	ldr r6, _08022F20
	adds r5, #0x20
	movs r7, #0x80
	ldr r0, [r6, r5]
	movs r1, #0x7f
	lsls r2, r7, #9
	bl snd_play
	b _08022DC0
_08022EC2:
	ldr r0, [r1, #0x10]
	bl sub_080040EC
	ldr r6, [r0, #0x10]
	cmp r6, #1
	beq _08022F24
	ldr r4, _08022EF4
	ldr r3, [r4, #0xc]
	movs r5, #0x30
	muls r5, r3, r5
	ldr r6, _08022F20
	adds r5, #0x14
	movs r7, #0x80
	ldr r0, [r6, r5]
	movs r1, #0x7f
	lsls r2, r7, #9
	bl snd_play
	b _08022DB8
_08022EE8:
	.4byte 0x03005660
_08022EEC:
	.4byte sub_03000138
_08022EF0:
	.4byte 0x00000203
_08022EF4:
	.4byte 0x0202E670
_08022EF8:
	.4byte 0x04000010
_08022EFC:
	.4byte 0x04000014
_08022F00:
	.4byte 0x0000051F
_08022F04:
	.4byte gUnk_08715A68
_08022F08:
	.4byte 0x000004D2
_08022F0C:
	.4byte 0xFFFFF240
_08022F10:
	.4byte gUnk_0863FDD8
_08022F14:
	.4byte gUnk_0863FDA0
_08022F18:
	.4byte 0x00000127
_08022F1C:
	.4byte 0x0202E6A8
_08022F20:
	.4byte gUnk_08051B90
_08022F24:
	ldr r2, _08023014
	ldr r0, [r2, #0xc]
	movs r4, #0x30
	muls r4, r0, r4
	ldr r1, _08023018
	adds r4, #0x18
	movs r3, #0x80
	ldr r0, [r1, r4]
	lsls r2, r3, #9
	movs r1, #0x7f
	bl snd_play
	b _08022DB8
_08022F3E:
	movs r0, #0xb6
	b _08022D84
_08022F42:
	ldr r3, _08023014
	ldr r5, _08023014
	ldr r2, [r3, #0x40]
	ldr r4, [r5, #0x44]
	adds r1, r2, #0
	adds r0, r4, #0
	b _08022D4E
_08022F50:
	movs r2, #0
	mov r1, fp
	str r2, [r0, r1]
	b _08022CDA
_08022F58:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x40
	movs r0, #0xf1
	bl snd_play
	adds r4, r6, #0
	adds r4, #0xa0
	str r0, [r5, r4]
	ldr r2, [r5, #0x40]
	adds r2, #0x18
	str r2, [r5, r7]
	ldr r1, [r5, #0x44]
	adds r0, r6, #0
	adds r0, #0x8c
	adds r1, #0xa
	str r1, [r5, r0]
	movs r1, #2
	ldr r0, _0802301C
	bl sub_080186E4
	ldr r2, _08023020
	adds r1, r6, #0
	subs r4, #0x20
	adds r1, #0x84
	str r0, [r5, r4]
	str r2, [r5, r1]
	ldr r2, [r5]
	b _08022CBE
_08022F92:
	ldr r4, [r0, #0x64]
	subs r4, #0x18
	str r4, [r0, r7]
	ldr r2, [r0, #0x68]
	adds r4, r6, #0
	ldr r1, _08023024
	adds r4, #0x8c
	adds r2, #0xa
	str r2, [r0, r4]
	ldr r2, _08023028
	subs r4, #0xc
	str r1, [r0, r4]
	adds r4, #4
	str r2, [r0, r4]
	movs r3, #0x80
	adds r4, #0xc
	movs r1, #0
	str r1, [r0, r4]
	lsls r2, r3, #9
	movs r0, #0xef
	movs r1, #0x40
	bl snd_play
	adds r4, r6, #0
	ldr r2, _08023014
	adds r4, #0xa0
	str r0, [r2, r4]
	ldr r3, [r2]
	b _08022CA4
_08022FCC:
	ldr r3, [r2, #0x10]
	movs r0, #0x38
	adds r2, r3, #0
	muls r2, r0, r2
	ldr r1, _0802302C
	mov lr, r2
	adds r2, #8
	ldr r2, [r1, r2]
	ldr r3, _08023014
	str r2, [r3, #0x38]
	mov r3, lr
	adds r3, #0xc
	ldr r2, _08023014
	ldr r3, [r1, r3]
	str r3, [r2, #0x3c]
	ldr r3, [r2, #0xc]
	muls r3, r0, r3
	adds r0, r3, #0
	adds r0, #8
	ldr r2, [r1, r0]
	ldr r0, _08023014
	adds r3, #0xc
	str r2, [r0, #0x5c]
	ldr r2, [r1, r3]
	str r2, [r0, #0x60]
	b _08022BE0
_08023000:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc4
	movs r1, #0x7f
	bl snd_play
	ldr r2, _08023014
	str r0, [r2, #0x2c]
	adds r4, r0, #0
	b _08022B78
_08023014:
	.4byte 0x0202E670
_08023018:
	.4byte gUnk_08051B90
_0802301C:
	.4byte gUnk_0862A510
_08023020:
	.4byte gUnk_0863FC40
_08023024:
	.4byte gUnk_086391B0
_08023028:
	.4byte gUnk_08638C30
_0802302C:
	.4byte gUnk_080511B4

	.global sub_08023030
	.thumb_func
	.type sub_08023030, %function
sub_08023030: @ 08023030
	push {lr}
	bl sub_0800041C
	ldr r0, _08023048
	movs r2, #0xa0
	ldrh r1, [r0]
	lsls r0, r2, #0x13
	strh r1, [r0]
	bl sub_08000444
	pop {r0}
	bx r0
_08023048:
	.4byte 0x02023FA4

	.global sub_0802304C
	.thumb_func
	.type sub_0802304C, %function
sub_0802304C: @ 0802304C
	push {lr}
	ldr r0, _0802306C
	ldrh r1, [r0]
	adds r1, #1
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bhi _08023068
	ldr r3, _08023070
	lsls r1, r2, #1
	ldrh r0, [r3, r1]
	movs r3, #0xa0
	lsls r1, r3, #0x13
	strh r0, [r1]
_08023068:
	pop {r0}
	bx r0
_0802306C:
	.4byte 0x04000006
_08023070:
	.4byte 0x02023FA4

	.global sub_08023074
	.thumb_func
	.type sub_08023074, %function
sub_08023074: @ 08023074
	push {lr}
	ldr r2, _080230D4
	movs r1, #2
	ldrsh r0, [r2, r1]
	sub sp, #4
	cmp r0, #1
	beq _080230FC
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _080230D8
	adds r0, #0x38
_08023092:
	ldr r1, [r3, r0]
	ldrh r3, [r1]
	ldr r0, _080230DC
	strh r3, [r0]
	ldrh r0, [r1, #2]
	ldr r2, _080230E0
	lsls r3, r0, #0x10
	strh r0, [r2]
	asrs r0, r3, #0x10
	movs r3, #0x2c
	muls r3, r0, r3
	ldr r2, _080230E4
	adds r1, #4
	str r1, [r2]
	adds r1, r1, r3
	ldr r3, _080230E8
	str r1, [r3]
	cmp r0, #0
	beq _080230F4
_080230B8:
	mov r0, sp
	ldr r1, _080230D0
	adds r0, #2
	strh r1, [r0]
	ldr r2, _080230EC
	ldr r1, _080230F0
	bl sub_080325DC
	add sp, #4
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080230D0:
	.4byte 0x00000000
_080230D4:
	.4byte gGameSetup
_080230D8:
	.4byte gUnk_087146C0
_080230DC:
	.4byte 0x0202EA10
_080230E0:
	.4byte 0x0202EA12
_080230E4:
	.4byte 0x0202EA08
_080230E8:
	.4byte 0x0202EA0C
_080230EC:
	.4byte 0x010000FC
_080230F0:
	.4byte 0x0202E810
_080230F4:
	ldr r0, _08023110
	bl AGBPrintf
	b _080230B8
_080230FC:
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _08023114
	adds r0, #0x3c
	b _08023092
	.byte 0x00, 0x00
_08023110:
	.4byte gUnk_08052978
_08023114:
	.4byte gUnk_087146C0

	.global sub_08023118
	.thumb_func
	.type sub_08023118, %function
sub_08023118: @ 08023118
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	adds r6, r1, #0
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x20]
	mov ip, r0
	ldr r0, [r6, #0x58]
	str r3, [sp, #4]
	lsls r3, r0, #2
	str r2, [sp, #8]
	adds r2, r3, #0
	adds r2, #0x28
	str r3, [sp]
	ldr r3, [r6, r2]
	adds r2, r0, #1
	mov sl, r3
	adds r3, r2, #0
	cmp r2, #0
	bge _0802314A
	b _08023474
_0802314A:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov fp, r3
	adds r2, r0, #2
	adds r3, #0x28
	ldr r7, [r6, r3]
	adds r3, r2, #0
	cmp r2, #0
	bge _08023162
	b _08023470
_08023162:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov sb, r3
	adds r3, #0x28
	ldr r3, [r6, r3]
	mov lr, r3
	adds r3, r0, #3
	adds r1, r3, #0
	cmp r3, #0
	bge _0802317C
	b _0802346C
_0802317C:
	asrs r5, r1, #2
	lsls r0, r5, #2
	subs r2, r3, r0
	lsls r1, r2, #2
	adds r4, r1, #0
	adds r4, #0x28
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
	adds r7, #0x38
	asrs r0, r3, #1
	ldr r3, [r6, r7]
	mov sl, r3
	mov r3, fp
	adds r3, #0x38
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x38
	ldr r3, [r6, r3]
	adds r5, r1, #0
	adds r5, #0x38
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
	adds r5, #0x48
	asrs r4, r3, #1
	ldr r3, [r6, r5]
	mov sl, r3
	mov r3, fp
	adds r3, #0x48
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x48
	adds r1, #0x48
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
	bgt _08023312
	b _08023468
_08023312:
	movs r1, #0x20
	rsbs r2, r1, #0
_08023316:
	ldr r1, [r6, #0x1c]
	lsls r2, r2, #1
	lsls r0, r1, #1
	mov fp, r2
	adds r2, r0, r2
	cmp r2, #0
	ble _0802332A
	ldr r1, [r6, #0x20]
	adds r0, r1, r2
	str r0, [r6, #0x20]
_0802332A:
	movs r3, #0x80
	ldr r1, [r6, #0x20]
	lsls r2, r3, #5
	cmp r1, r2
	blt _08023426
	ldr r1, [r6, #0x24]
	movs r4, #0x2c
	muls r1, r4, r1
	ldr r2, _08023478
	ldr r5, [r2]
	ldr r0, _0802347C
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
	ble _080233C8
	movs r4, #0
	cmp r5, #0
	beq _0802336C
	adds r1, r3, #2
	adds r2, r5, #0
_08023360:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _08023360
_0802336C:
	movs r3, #0x80
	lsls r7, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _08023378
	b _08023464
_08023378:
	adds r0, r7, #0
	ldr r2, _08023480
	bl _call_via_r2
	adds r1, r7, #0
	eors r1, r4
	mov r8, r0
	cmp r1, #0
	blt _0802345C
_0802338A:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	bge _080233C8
	ldr r0, _0802347C
	ldr r7, [r0]
	mov r0, sb
	lsls r3, r0, #2
	adds r1, r3, r7
	adds r3, r0, r5
	lsls r3, r3, #2
	mov lr, r3
_080233A8:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _080233C0
	ldrh r1, [r1]
	mov r2, lr
	mov sl, r1
	adds r1, r2, r7
	adds r2, r5, #0
_080233C0:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _080233A8
_080233C8:
	movs r7, #0x2c
	mov r1, sl
	muls r1, r7, r1
	mov r3, sl
	str r3, [r6, #0x24]
	ldr r0, _08023478
	ldr r2, [r0]
	ldr r4, [r6, #0x58]
	adds r0, r2, r1
	lsls r1, r4, #2
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r1, #0x28
	lsls r7, r5, #8
	str r7, [r6, r1]
	ldr r5, [r6, #0x58]
	lsls r1, r5, #2
	movs r5, #2
	ldrsh r3, [r0, r5]
	adds r1, #0x38
	lsls r7, r3, #8
	str r7, [r6, r1]
	ldr r7, [r6, #0x58]
	lsls r1, r7, #2
	movs r7, #4
	ldrsh r3, [r0, r7]
	adds r1, #0x48
	lsls r3, r3, #8
	str r3, [r6, r1]
	ldr r1, [r6, #0x58]
	adds r2, r1, #1
	adds r3, r2, #0
	cmp r2, #0
	blt _08023458
_0802340C:
	asrs r1, r3, #2
	lsls r3, r1, #2
	subs r1, r2, r3
	str r1, [r6, #0x58]
	movs r1, #0
	str r1, [r6, #0x20]
	adds r2, r6, #0
	adds r2, #0xf0
	movs r1, #1
	ldr r3, [r2]
	rsbs r1, r1, #0
	cmp r3, r1
	beq _08023448
_08023426:
	ldr r2, [r6, #0x1c]
	add r2, fp
	str r2, [r6, #0x1c]
	cmp r2, #0
	blt _08023442
_08023430:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08023442:
	movs r1, #0
	str r1, [r6, #0x1c]
	b _08023430
_08023448:
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023426
	ldr r0, [r6, #0x24]
	str r0, [r2]
	b _08023426
_08023458:
	adds r3, r1, #4
	b _0802340C
_0802345C:
	mov r3, r8
	rsbs r3, r3, #0
	mov r8, r3
	b _0802338A
_08023464:
	rsbs r1, r4, #0
	b _08023378
_08023468:
	movs r2, #0x20
	b _08023316
_0802346C:
	adds r1, r0, #6
	b _0802317C
_08023470:
	adds r3, r0, #5
	b _08023162
_08023474:
	adds r3, r0, #4
	b _0802314A
_08023478:
	.4byte 0x0202EA08
_0802347C:
	.4byte 0x0202EA0C
_08023480:
	.4byte sub_0300034C

	.global sub_08023484
	.thumb_func
	.type sub_08023484, %function
sub_08023484: @ 08023484
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	ldr r0, [r4, #4]
	adds r5, r1, #0
	movs r6, #0
	cmp r0, #0
	beq _0802349C
	adds r2, r5, #0
	adds r2, #0xb8
	ldr r1, [r2]
	cmp r1, #0
	beq _08023528
_0802349C:
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r2, [r0]
	subs r1, r6, r2
	cmp r1, #0
	ble _080234F8
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r1, r3, #1
	ands r1, r2
	cmp r1, #0
	beq _080234EC
	movs r1, #0xb8
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r2, [r1]
	movs r1, #0x96
	lsls r3, r1, #1
_080234C0:
	adds r1, r2, #0
	muls r1, r3, r1
_080234C4:
	lsls r1, r1, #1
	cmp r1, #0
	beq _080234DA
	ldr r2, [r0]
	adds r3, r2, r1
	str r3, [r0]
	cmp r1, #0
	ble _080234E0
	cmp r3, r6
	ble _080234E0
_080234D8:
	str r6, [r0]
_080234DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_080234E0:
	cmp r1, #0
	bge _080234DA
	ldr r1, [r0]
	cmp r1, r6
	bge _080234DA
	b _080234D8
_080234EC:
	movs r1, #0xb8
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r2, [r1]
	movs r3, #0xc8
	b _080234C0
_080234F8:
	cmp r1, #0
	blt _08023500
	movs r1, #0
	b _080234C4
_08023500:
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r1, r3, #1
	ands r1, r2
	cmp r1, #0
	beq _0802351A
	movs r3, #0xb8
	lsls r2, r3, #1
	adds r3, r5, r2
	ldr r1, [r3]
	subs r2, #0x44
	rsbs r3, r1, #0
	b _080234C0
_0802351A:
	movs r1, #0xb8
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r2, [r1]
	rsbs r3, r2, #0
	movs r2, #0xc8
	b _080234C0
_08023528:
	ldrh r6, [r4]
	movs r2, #0x80
	lsls r1, r2, #1
	ands r1, r6
	cmp r1, #0
	beq _08023540
	rsbs r3, r0, #0
	lsls r6, r3, #1
	adds r1, r6, r3
	lsls r0, r1, #0xf
	asrs r6, r0, #8
	b _0802349C
_08023540:
	lsls r1, r0, #0x10
	subs r2, r0, r1
	asrs r6, r2, #8
	b _0802349C

	.global sub_08023548
	.thumb_func
	.type sub_08023548, %function
sub_08023548: @ 08023548
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	adds r4, r1, #0
	str r0, [sp, #0x10]
	str r2, [sp, #0xc]
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r2, [r5]
	movs r0, #0xfa
	movs r6, #0xfa
	lsls r5, r0, #1
	adds r0, r2, r5
	lsls r1, r6, #2
	adds r6, r2, r1
	str r0, [sp, #4]
	adds r2, r4, #0
	adds r2, #0xc4
	ldr r0, [r2]
	movs r1, #0xfa
	lsls r5, r1, #1
	adds r3, r0, r5
	ldr r2, [sp, #0x10]
	str r3, [sp]
	adds r2, #0xa0
	movs r3, #0
	ldr r1, _0802387C
	mov sb, r3
	mov fp, r3
	ldr r3, [r2]
	ands r3, r1
	movs r1, #0x80
	lsls r2, r1, #9
	movs r5, #0
	cmp r3, r2
	bne _0802359A
	b _08023892
_0802359A:
	ldr r2, [sp, #0xc]
	ldr r3, [r2, #8]
	cmp r3, #0
	bgt _080235A4
	b _08023864
_080235A4:
	movs r3, #0xb4
	lsls r1, r3, #1
	adds r3, r4, r1
	ldr r1, [r3]
	cmp r1, #0
	bne _080235B2
	b _08023858
_080235B2:
	movs r3, #0xb2
_080235B4:
	lsls r1, r3, #1
	adds r3, r4, r1
	mov r1, fp
	str r1, [r3]
_080235BC:
	ldr r2, [r4, #0x14]
	mov r8, r2
	mov r1, r8
	mov r3, sb
	subs r2, r3, r1
	str r2, [sp, #8]
	cmp r1, #0
	bge _080235CE
	b _080237E4
_080235CE:
	ldr r2, [r4, #0x6c]
	ldr r0, [sp]
	adds r3, r2, #0
	cmp r2, r0
	bge _080235E0
	ldr r0, [sp, #8]
	cmp r0, #0
	bgt _080235E0
	b _08023788
_080235E0:
	cmp r1, #0
	bgt _080235E6
	b _0802371C
_080235E6:
	cmp r3, r6
	blt _080236BA
	movs r3, #0
	mov fp, r3
	mov sb, r3
	movs r5, #6
	mov r8, r3
	str r3, [r4, #0x14]
	str r6, [r4, #0x6c]
_080235F8:
	cmp r5, #0
	beq _0802366A
_080235FC:
	mov r0, r8
	mov r1, fp
	lsls r2, r0, #1
	lsls r0, r1, #1
	adds r1, r2, r0
	cmp r5, #5
	beq _08023650
_0802360A:
	cmp r5, #8
	beq _08023642
_0802360E:
	add r0, r8
	cmp r8, sb
	bgt _0802361C
	cmp sb, r0
	ble _08023620
	cmp r8, sb
	blt _0802363E
_0802361C:
	cmp sb, r0
	blt _0802363E
_08023620:
	mov r3, sb
	str r3, [r4, #0x14]
_08023624:
	ldr r0, [r4, #0x14]
	ldr r2, [sp, #0x10]
	add sp, #0x14
	str r0, [r2, #0x4c]
	adds r0, r1, #0
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802363E:
	str r0, [r4, #0x14]
	b _08023624
_08023642:
	ldr r2, [r4, #0x6c]
	adds r3, r2, r1
	ldr r2, [sp, #4]
	cmp r3, r2
	ble _0802360E
	movs r2, #0xb4
	b _0802365C
_08023650:
	ldr r2, [r4, #0x6c]
	adds r3, r2, r1
	ldr r2, [sp]
	cmp r3, r2
	ble _0802360A
	movs r2, #0xb2
_0802365C:
	lsls r3, r2, #1
	adds r2, r4, r3
	movs r3, #1
	str r3, [r2]
	ldr r2, [r4, #0x14]
	mov r8, r2
	b _0802360E
_0802366A:
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _08023690
	ldr r3, [sp, #0xc]
	ldr r1, [r3, #8]
	cmp r1, #0
	beq _08023684
	movs r3, #0xac
	lsls r1, r3, #1
	adds r2, r4, r1
	ldr r3, [r2]
	mov fp, r3
	b _080235FC
_08023684:
	movs r3, #0xac
	lsls r2, r3, #1
	adds r0, r4, r2
	ldr r3, [r0]
	mov fp, r3
	b _080235FC
_08023690:
	ldr r1, [sp, #8]
	cmp r1, #0
	bge _080235FC
	ldr r3, [sp, #0xc]
	ldr r2, [r3, #8]
	cmp r2, #0
	beq _080236AC
	movs r0, #0xac
	lsls r3, r0, #1
	adds r2, r4, r3
	ldr r0, [r2]
	rsbs r3, r0, #0
	mov fp, r3
	b _080235FC
_080236AC:
	movs r1, #0xb0
	lsls r3, r1, #1
	adds r0, r4, r3
	ldr r1, [r0]
	rsbs r3, r1, #0
	mov fp, r3
	b _080235FC
_080236BA:
	ldr r0, [sp, #4]
	cmp r3, r0
	blt _080235F8
	subs r7, r6, r3
	adds r3, r1, #0
	muls r3, r1, r3
	rsbs r6, r3, #0
	lsls r5, r7, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _08023718
_080236D0:
	adds r1, r5, #0
	cmp r5, #0
	blt _08023714
_080236D6:
	ldr r2, _08023880
	bl _call_via_r2
	adds r1, r6, #0
	eors r1, r5
	cmp r1, #0
	blt _08023710
_080236E4:
	ldr r5, [sp, #8]
	mov fp, r0
	cmp r5, #0
	blt _080236F4
	movs r3, #0
	mov sb, r3
_080236F0:
	movs r5, #7
	b _080235F8
_080236F4:
	movs r5, #0xa8
	lsls r3, r5, #1
	adds r2, r4, r3
	ldr r1, [r2]
	movs r5, #0xac
	rsbs r3, r1, #0
	mov sb, r3
	lsls r3, r5, #1
	adds r2, r4, r3
	ldr r0, [r2]
	mov r2, fp
	subs r2, r2, r0
	mov fp, r2
	b _080236F0
_08023710:
	rsbs r0, r0, #0
	b _080236E4
_08023714:
	rsbs r1, r5, #0
	b _080236D6
_08023718:
	adds r0, r3, #0
	b _080236D0
_0802371C:
	ldr r3, [sp, #4]
	cmp r2, r3
	bgt _08023724
	b _080235F8
_08023724:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _0802372C
	b _080235F8
_0802372C:
	movs r3, #0xb0
	lsls r5, r3, #1
	adds r3, r4, r5
	ldr r3, [r3]
	subs r5, #0x10
	mov sl, r3
	rsbs r3, r3, #0
	mov fp, r3
	adds r3, r4, r5
	ldr r5, [r3]
	rsbs r3, r5, #0
	mov sb, r3
	cmp r1, #0
	blt _0802374C
_08023748:
	movs r5, #8
	b _080235F8
_0802374C:
	adds r3, r1, #0
	muls r3, r1, r3
	ldr r6, [sp, #4]
	mov r0, sl
	subs r7, r6, r2
	rsbs r6, r3, #0
	lsls r5, r0, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _08023784
_08023760:
	adds r1, r5, #0
	cmp r5, #0
	blt _08023780
_08023766:
	ldr r2, _08023880
	bl _call_via_r2
	adds r1, r6, #0
	eors r1, r5
	cmp r1, #0
	blt _0802377C
_08023774:
	cmp r0, r7
	bge _08023748
	mov fp, sl
	b _08023748
_0802377C:
	rsbs r0, r0, #0
	b _08023774
_08023780:
	rsbs r1, r5, #0
	b _08023766
_08023784:
	adds r0, r3, #0
	b _08023760
_08023788:
	movs r3, #0xb0
	lsls r5, r3, #1
	adds r0, r4, r5
	ldr r3, [r0]
	movs r1, #0xa8
	mov fp, r3
	lsls r3, r1, #1
	adds r5, r4, r3
	ldr r3, [r5]
	mov r1, r8
	mov sb, r3
	cmp r1, #0
	ble _080237D4
	mov r3, r8
	muls r3, r1, r3
	ldr r6, [sp]
	mov r0, fp
	rsbs r0, r0, #0
	subs r7, r6, r2
	rsbs r6, r3, #0
	mov sl, r0
	lsls r5, r0, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _080237E0
_080237BA:
	adds r1, r5, #0
	cmp r5, #0
	blt _080237DC
_080237C0:
	ldr r2, _08023880
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r5
	cmp r2, #0
	blt _080237D8
_080237CE:
	cmp r0, r7
	ble _080237D4
	mov fp, sl
_080237D4:
	movs r5, #5
	b _080235F8
_080237D8:
	rsbs r0, r0, #0
	b _080237CE
_080237DC:
	rsbs r1, r5, #0
	b _080237C0
_080237E0:
	adds r0, r3, #0
	b _080237BA
_080237E4:
	ldr r2, [r4, #0x6c]
	cmp r2, r0
	bgt _080237FA
	movs r3, #0
	mov fp, r3
	mov sb, r3
	movs r5, #1
	mov r8, r3
	str r3, [r4, #0x14]
	str r0, [r4, #0x6c]
	b _080235F8
_080237FA:
	ldr r3, [sp]
	cmp r2, r3
	bgt _0802371C
	subs r7, r0, r2
	mov r0, r8
	mov r3, r8
	muls r3, r0, r3
	rsbs r6, r3, #0
	lsls r5, r7, #1
	adds r0, r6, #0
	cmp r6, #0
	blt _08023854
_08023812:
	adds r1, r5, #0
	cmp r5, #0
	blt _08023850
_08023818:
	ldr r2, _08023880
	bl _call_via_r2
	adds r1, r6, #0
	eors r1, r5
	cmp r1, #0
	blt _0802384C
_08023826:
	mov fp, r0
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _08023846
	movs r1, #0xa8
	lsls r5, r1, #1
	adds r0, r4, r5
	ldr r3, [r0]
	movs r2, #0xac
	mov sb, r3
	lsls r3, r2, #1
	adds r1, r4, r3
	ldr r5, [r1]
	add fp, r5
_08023842:
	movs r5, #4
	b _080235F8
_08023846:
	movs r1, #0
	mov sb, r1
	b _08023842
_0802384C:
	rsbs r0, r0, #0
	b _08023826
_08023850:
	rsbs r1, r5, #0
	b _08023818
_08023854:
	adds r0, r3, #0
	b _08023812
_08023858:
	movs r2, #0xa8
	lsls r3, r2, #1
	adds r2, r4, r3
	ldr r3, [r2]
	mov sb, r3
	b _080235B2
_08023864:
	cmp r3, #0
	blt _0802386A
	b _080235BC
_0802386A:
	movs r1, #0xb2
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	cmp r2, #0
	beq _08023884
_08023876:
	movs r3, #0xb4
	b _080235B4
	.byte 0x00, 0x00
_0802387C:
	.4byte 0x00010180
_08023880:
	.4byte sub_0300034C
_08023884:
	movs r3, #0xa8
	lsls r2, r3, #1
	adds r3, r4, r2
	ldr r2, [r3]
	rsbs r3, r2, #0
	mov sb, r3
	b _08023876
_08023892:
	ldr r3, [sp, #0x10]
	ldr r1, [r3, #0x4c]
	str r1, [r4, #0x14]
	b _0802359A
	.byte 0x00, 0x00

	.global sub_0802389C
	.thumb_func
	.type sub_0802389C, %function
sub_0802389C: @ 0802389C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	ldr r7, _08023954
	adds r0, #0xb4
	ldr r1, [r0]
	movs r5, #0
	adds r2, r7, #4
	movs r4, #0
	movs r0, #0xc
_080238B0:
	ldr r3, [r4, r7]
	cmp r3, r1
	bgt _080238BE
	ldr r3, [r2]
	cmp r1, r3
	bgt _080238BE
	ldr r5, [r2, #4]
_080238BE:
	subs r0, #1
	adds r2, #0xc
	adds r4, #0xc
	cmp r0, #0
	bge _080238B0
	movs r1, #0xb6
	lsls r3, r1, #1
	adds r4, r6, r3
	ldr r1, [r4]
	lsls r0, r5, #1
	muls r1, r0, r1
	ldr r4, [r6, #0x74]
	asrs r2, r1, #0xa
	adds r1, r4, r2
	str r1, [r6, #0x74]
	adds r0, r6, #0
	adds r0, #0xd4
	ldr r5, [r0]
	movs r0, #0xfa
	lsls r4, r5, #1
	adds r2, r1, r4
	lsls r3, r0, #4
	str r2, [r6, #0x74]
	cmp r2, r3
	ble _08023938
	adds r5, r6, #0
	adds r5, #0xb8
	movs r2, #1
	str r3, [r6, #0x74]
_080238F8:
	str r2, [r5]
_080238FA:
	movs r3, #8
	ldrsh r5, [r6, r3]
	ldr r4, _08023958
	adds r0, r5, #0
	bl _call_via_r4
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	ldr r1, _0802395C
	adds r0, r5, #0
	bl _call_via_r1
	ldr r1, [r6, #0x74]
	adds r3, r4, #0
	muls r3, r1, r3
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	asrs r2, r3, #0xc
	ldr r3, [r6, #0x5c]
	adds r3, r3, r2
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r1, [r6, #0x64]
	str r3, [r6, #0x68]
	asrs r3, r2, #0xc
	subs r0, r1, r3
	str r0, [r6, #0x70]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08023938:
	ldr r3, _08023960
	cmp r2, r3
	bge _0802394C
	adds r0, r6, #0
	movs r1, #1
	adds r0, #0xb8
	rsbs r4, r1, #0
	str r3, [r6, #0x74]
	str r4, [r0]
	b _080238FA
_0802394C:
	adds r5, r6, #0
	adds r5, #0xb8
	movs r2, #0
	b _080238F8
_08023954:
	.4byte gUnk_0884EF50
_08023958:
	.4byte sub_03000134
_0802395C:
	.4byte sub_03000138
_08023960:
	.4byte 0xFFFFF060

	.global sub_08023964
	.thumb_func
	.type sub_08023964, %function
sub_08023964: @ 08023964
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r1, #0
	adds r1, #0xb8
	ldr r0, [r1]
	sub sp, #0xc
	adds r7, r2, #0
	cmp r0, #0
	bne _08023980
	b _08023B06
_08023980:
	movs r2, #0
	str r2, [sp, #8]
_08023984:
	ldr r0, [sp, #8]
	adds r2, r6, #0
	adds r2, #0xa0
	str r0, [r2]
	subs r2, #8
	str r2, [sp, #4]
	ldr r1, [r2]
	subs r4, r0, r1
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0802399C
	b _08023AAA
_0802399C:
	cmp r4, #0
	bge _080239A2
	b _08023A8E
_080239A2:
	movs r0, #0x94
	adds r2, r0, r6
	mov r8, r2
_080239A8:
	cmp r4, #0
	ble _08023A86
	mov r0, r8
	ldr r1, [r0]
	cmp r1, #0
	blt _08023A82
	movs r2, #0xb8
_080239B6:
	lsls r3, r2, #1
	adds r1, r6, r3
	ldr r2, [r1]
	lsls r1, r2, #0xa
_080239BE:
	asrs r2, r1, #8
_080239C0:
	ldr r0, [sp, #4]
	ldr r3, [r0]
	mov r0, r8
	ldr r1, [r0]
	mov fp, r3
	lsls r0, r2, #1
	lsls r3, r1, #1
	add r3, fp
	mov sb, r0
	add r3, sb
	mov sl, r3
	cmp r1, #0
	ble _08023A78
	cmp r4, #0
	ble _08023A78
_080239DE:
	mov r3, r8
	ldr r7, [r3]
	adds r3, r7, #0
	muls r3, r7, r3
	rsbs r1, r2, #0
	rsbs r5, r3, #0
	str r1, [sp]
	lsls r4, r1, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _08023A74
_080239F4:
	adds r1, r4, #0
	cmp r4, #0
	blt _08023A70
_080239FA:
	ldr r2, _08023B40
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _08023A6C
_08023A08:
	ldr r1, [sp, #8]
	mov r3, sl
	subs r4, r1, r3
	cmp r7, #0
	ble _08023A16
	cmp r0, r4
	bge _08023A64
_08023A16:
	cmp r7, #0
	blt _08023A60
_08023A1A:
	mov r2, r8
	ldr r1, [r2]
	add r1, sb
	str r1, [r2]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _08023A42
_08023A28:
	ldr r0, [sp, #4]
	mov r2, sl
	str r2, [r0]
	add sp, #0xc
	str r2, [r6, #0xc]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08023A42:
	mov r0, fp
	cmp r0, #0
	ble _08023A54
_08023A48:
	mov r3, sl
	cmp r3, #0
	bgt _08023A28
_08023A4E:
	movs r0, #0
	mov sl, r0
	b _08023A28
_08023A54:
	mov r2, sl
	cmp r2, #0
	bge _08023A4E
	cmp r0, #0
	bge _08023A48
	b _08023A28
_08023A60:
	cmp r0, r4
	bgt _08023A1A
_08023A64:
	ldr r3, [sp]
	lsls r0, r3, #1
	mov sb, r0
	b _08023A1A
_08023A6C:
	rsbs r0, r0, #0
	b _08023A08
_08023A70:
	rsbs r1, r4, #0
	b _080239FA
_08023A74:
	adds r0, r3, #0
	b _080239F4
_08023A78:
	cmp r1, #0
	bge _08023A1A
	cmp r4, #0
	bge _08023A1A
	b _080239DE
_08023A82:
	movs r0, #0xb8
	b _08023AC6
_08023A86:
	cmp r4, #0
	bge _08023AD6
	movs r1, #0xb8
	b _08023ADC
_08023A8E:
	movs r0, #0x94
	adds r3, r0, r6
	ldr r2, [r3]
	mov r8, r3
	cmp r2, #0
	bgt _08023A9C
	b _080239A8
_08023A9C:
	movs r2, #0xb8
	lsls r3, r2, #1
	adds r1, r6, r3
	ldr r0, [r1]
	lsls r2, r0, #0xb
	rsbs r1, r2, #0
	b _080239BE
_08023AAA:
	cmp r4, #0
	blt _08023AEA
	movs r2, #0x94
	adds r3, r2, r6
	mov r8, r3
_08023AB4:
	cmp r4, #0
	ble _08023AD2
	mov r0, r8
	ldr r1, [r0]
	cmp r1, #0
	blt _08023AC4
	movs r2, #0xba
	b _080239B6
_08023AC4:
	movs r0, #0xba
_08023AC6:
	lsls r3, r0, #1
	adds r1, r6, r3
	ldr r2, [r1]
	lsls r0, r2, #0xb
	asrs r2, r0, #8
	b _080239C0
_08023AD2:
	cmp r4, #0
	blt _08023ADA
_08023AD6:
	movs r2, #0
	b _080239C0
_08023ADA:
	movs r1, #0xba
_08023ADC:
	lsls r3, r1, #1
	adds r0, r6, r3
	ldr r2, [r0]
	lsls r1, r2, #0xa
	rsbs r0, r1, #0
	asrs r2, r0, #8
	b _080239C0
_08023AEA:
	movs r3, #0x94
	adds r0, r3, r6
	ldr r1, [r0]
	mov r8, r0
	cmp r1, #0
	ble _08023AB4
	movs r1, #0xba
	lsls r3, r1, #1
	adds r0, r6, r3
	ldr r1, [r0]
	lsls r2, r1, #0xb
	rsbs r0, r2, #0
	asrs r2, r0, #8
	b _080239C0
_08023B06:
	movs r2, #0
	str r2, [sp, #8]
	adds r4, r6, #0
	ldr r5, _08023B44
	adds r4, #0xb4
	ldr r0, [r4]
	adds r1, r5, #4
	movs r4, #0xc
_08023B16:
	ldr r3, [r2, r5]
	cmp r3, r0
	bgt _08023B26
	ldr r3, [r1]
	cmp r0, r3
	bgt _08023B26
	ldr r3, [r1, #4]
	str r3, [sp, #8]
_08023B26:
	subs r4, #1
	adds r1, #0xc
	adds r2, #0xc
	cmp r4, #0
	bge _08023B16
	ldr r3, [sp, #8]
	lsls r4, r3, #1
	adds r2, r4, r3
	lsls r1, r2, #0xc
	asrs r0, r1, #0xa
	str r0, [sp, #8]
	b _08023984
	.byte 0x00, 0x00
_08023B40:
	.4byte sub_0300034C
_08023B44:
	.4byte gUnk_0884EF50

	.global sub_08023B48
	.thumb_func
	.type sub_08023B48, %function
sub_08023B48: @ 08023B48
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov r8, r1
	adds r7, r0, #0
	movs r1, #0xe8
	movs r0, #0xec
	add r0, r8
	add r1, r8
	ldr r3, [r0]
	ldr r6, [r1]
	mov fp, r1
	movs r1, #0x32
	mov sl, r0
	rsbs r0, r1, #0
	adds r5, r6, r3
	muls r3, r0, r3
	movs r0, #0xc0
	sub sp, #8
	lsls r4, r5, #1
	lsls r2, r0, #6
	str r4, [sp, #4]
	cmp r3, r2
	ble _08023B80
	adds r3, r2, #0
_08023B80:
	lsls r1, r3, #0x10
	ldr r2, _08023D60
	mov r6, r8
	adds r6, #0xe4
	lsrs r5, r1, #0x10
	ldrh r0, [r6]
	mov sb, r2
	adds r1, r5, #0
	bl _call_via_r9
	ldr r4, [r6]
	lsls r3, r0, #0x10
	asrs r2, r3, #0x12
	subs r4, r4, r2
	lsls r1, r4, #0x10
	str r4, [r6]
	lsrs r0, r1, #0x10
	adds r1, r5, #0
	bl _call_via_r9
	lsls r3, r0, #0x10
	asrs r2, r3, #0x12
	subs r4, r4, r2
	str r4, [r6]
	mov r5, r8
	adds r5, #0xe0
	ldr r3, [r5]
	cmp r3, #0
	bne _08023BBC
	b _08023CA8
_08023BBC:
	cmp r3, #1
	beq _08023C8E
	cmp r3, #2
	beq _08023BF0
_08023BC4:
	mov r0, fp
	ldr r1, [r0]
	lsls r3, r1, #1
	mov r1, sl
	ldr r2, [r1]
	adds r0, r2, r3
	movs r3, #0xfa
	rsbs r3, r3, #0
	str r0, [r1]
	cmp r0, r3
	bge _08023BDC
	str r3, [r1]
_08023BDC:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08023BF0:
	mov r3, r8
	adds r3, #0xc4
	ldr r3, [r3]
	movs r1, #0xfa
	lsls r0, r1, #1
	adds r1, r3, r0
	ldr r3, [r7, #0x28]
	ldr r0, [sp, #4]
	adds r2, r3, r0
	cmp r2, r1
	bge _08023C4A
	mov r0, fp
	ldr r3, [r0]
	cmp r3, #0
	beq _08023C4A
	subs r6, r1, r2
	mov r1, sl
	ldr r4, [r1]
	adds r5, r4, #0
	muls r5, r4, r5
	adds r3, r5, #0
	rsbs r5, r3, #0
	lsls r4, r6, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _08023C46
_08023C24:
	adds r1, r4, #0
	cmp r4, #0
	blt _08023C42
_08023C2A:
	ldr r2, _08023D64
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _08023C3E
_08023C38:
	mov r3, fp
	str r0, [r3]
	b _08023BC4
_08023C3E:
	rsbs r0, r0, #0
	b _08023C38
_08023C42:
	rsbs r1, r4, #0
	b _08023C2A
_08023C46:
	adds r0, r3, #0
	b _08023C24
_08023C4A:
	movs r2, #0
	str r2, [r5]
	str r2, [r6]
	ldr r3, [r7, #0x28]
	subs r0, r3, r1
	movs r1, #0x94
	mov r3, r8
	str r0, [sp, #4]
	adds r3, #0xdc
	lsls r0, r1, #1
	str r2, [r3]
	movs r1, #1
	add r0, r8
	mov r3, sl
	str r2, [r5]
	str r1, [r0]
	str r2, [r3]
	mov r0, fp
	movs r3, #0xb4
	str r2, [r0]
	lsls r0, r3, #1
	add r0, r8
	movs r3, #0xb2
	str r2, [r0]
	lsls r0, r3, #1
	add r0, r8
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa0
	ldr r1, [r0]
	subs r2, #0x81
	ands r1, r2
	str r1, [r0]
	b _08023BC4
_08023C8E:
	ldr r1, [r7, #0x28]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	mov r0, sl
	ldr r1, [r0]
	cmp r1, #0
	ble _08023BC4
	ldr r3, _08023D68
	cmp r2, r3
	ble _08023BC4
	movs r2, #2
	str r2, [r5]
	b _08023BC4
_08023CA8:
	adds r0, r7, #0
	ldr r2, _08023D6C
	adds r0, #0xa0
	ldr r1, [r0, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _08023CDA
_08023CB6:
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x28]
	adds r2, r1, r0
	ldr r0, _08023D68
	cmp r2, r0
	ble _08023CC4
	b _08023BC4
_08023CC4:
	movs r0, #1
	str r0, [r5]
	movs r2, #0xa
	mov r0, fp
	movs r3, #0x94
	str r2, [r0]
	lsls r0, r3, #1
	add r0, r8
	movs r1, #7
	str r1, [r0]
	b _08023BC4
_08023CDA:
	ldr r6, [r7, #0x3c]
	ldr r1, [r7, #0x44]
	ldr r2, [r7, #0x40]
	asrs r3, r6, #2
	asrs r4, r1, #2
	str r4, [sp]
	mov sb, r3
	asrs r6, r2, #2
	bl sub_08002E78
	adds r4, r0, #0
	cmp r4, #0
	beq _08023D20
	ldr r1, [r7, #0x24]
	str r1, [r4]
	ldr r2, [r7, #0x28]
	str r2, [r4, #4]
	ldr r0, [r7, #0x2c]
	str r0, [r4, #8]
	bl lfsr_next
	asrs r1, r0, #9
	str r1, [r4, #0xc]
	bl lfsr_next
	asrs r2, r0, #9
	str r2, [r4, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _08023D70
	movs r1, #0x28
	str r3, [r4, #0x14]
	str r1, [r4, #0x18]
	str r0, [r4, #0x1c]
_08023D20:
	bl sub_08002E78
	adds r4, r0, #0
	cmp r4, #0
	beq _08023CB6
	ldr r2, [r7, #0x24]
	add r2, sb
	str r2, [r4]
	ldr r1, [r7, #0x28]
	adds r0, r1, r6
	str r0, [r4, #4]
	ldr r3, [sp]
	ldr r2, [r7, #0x2c]
	adds r1, r2, r3
	str r1, [r4, #8]
	bl lfsr_next
	asrs r2, r0, #9
	str r2, [r4, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	str r1, [r4, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _08023D70
	movs r2, #0x28
	str r3, [r4, #0x14]
	str r2, [r4, #0x18]
	str r0, [r4, #0x1c]
	b _08023CB6
_08023D60:
	.4byte _03000814
_08023D64:
	.4byte sub_0300034C
_08023D68:
	.4byte 0xFFFFF830
_08023D6C:
	.4byte gLocalPlayerIndex
_08023D70:
	.4byte 0x00000513

	.global sub_08023D74
	.thumb_func
	.type sub_08023D74, %function
sub_08023D74: @ 08023D74
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x1c
	adds r5, r1, #0
	str r2, [sp, #0x18]
	adds r1, #0xb8
	ldr r0, [r1]
	cmp r0, #0
	bne _08023D90
	b _0802405C
_08023D90:
	movs r0, #0
	str r0, [sp, #0x10]
_08023D94:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r6, [r0]
	ldr r1, [sp, #0x10]
	cmp r1, r6
	bne _08023DA2
	b _0802404E
_08023DA2:
	ldr r1, [sp, #0x18]
	ldr r2, [r1, #4]
	cmp r2, #0
	bne _08023DAC
	b _0802403A
_08023DAC:
	movs r2, #0x80
	ldrh r3, [r1]
	lsls r1, r2, #1
	adds r6, r1, #0
	ands r6, r3
	cmp r6, #0
	bne _08023DBC
	b _08024022
_08023DBC:
	adds r6, r5, #0
	adds r6, #0x90
	movs r3, #0x40
	str r3, [r6]
	movs r3, #0x84
	adds r2, r3, r5
	movs r6, #3
	mov fp, r2
	adds r3, r1, #0
	str r6, [r2]
_08023DD0:
	ldr r1, [r0]
	ldr r6, [sp, #0x10]
	cmp r6, r1
	bgt _08023DDA
	b _08024004
_08023DDA:
	movs r6, #0x8c
	adds r1, r6, r5
	lsls r2, r3, #4
_08023DE0:
	mov sb, r1
	str r2, [r1]
_08023DE4:
	ldr r1, [sp, #0x10]
	str r1, [r0]
	movs r0, #0
	str r0, [sp, #0xc]
	cmp r1, #0
	bne _08023DF2
	b _08023FFE
_08023DF2:
	mov r2, sb
	ldr r1, [r2]
	ldr r2, [sp, #0x10]
	adds r3, r5, #0
	adds r0, r2, r1
	adds r3, #0x80
	str r0, [sp, #0x10]
	str r3, [sp, #8]
	ldr r6, [r3]
	subs r1, r0, r6
	ldr r6, [sp, #0x18]
	ldr r2, [r6, #4]
	str r2, [sp, #4]
	cmp r2, #0
	bne _08023E12
	b _08023FAE
_08023E12:
	cmp r1, #0
	bge _08023E18
	b _08023F96
_08023E18:
	ldr r3, [r5, #0x7c]
	mov r8, r3
_08023E1C:
	cmp r1, #0
	bgt _08023E22
	b _08023F84
_08023E22:
	mov r2, r8
	cmp r2, #0
	bge _08023E2A
	b _08023F78
_08023E2A:
	movs r6, #0xb8
_08023E2C:
	lsls r3, r6, #1
	adds r0, r5, r3
	ldr r6, [r0]
	lsls r2, r6, #0xa
_08023E34:
	asrs r6, r2, #8
_08023E36:
	mov r2, fp
	ldr r0, [r2]
	cmp r0, #0
	bne _08023E40
	b _08023F6C
_08023E40:
	ldr r2, [sp, #8]
	ldr r3, [r2]
	mov r2, r8
	mov sl, r3
	lsls r3, r2, #1
	add r3, sl
	lsls r2, r6, #1
	adds r0, r3, r2
	mov r3, r8
	str r0, [sp, #0x14]
	cmp r3, #0
	bgt _08023E5A
	b _08023F60
_08023E5A:
	cmp r1, #0
	bgt _08023E60
	b _08023F60
_08023E60:
	mov r1, r8
	mov r3, r8
	muls r3, r1, r3
	rsbs r1, r6, #0
	rsbs r7, r3, #0
	str r1, [sp]
	lsls r4, r1, #1
	adds r0, r7, #0
	cmp r7, #0
	bge _08023E76
	b _08023F5C
_08023E76:
	adds r1, r4, #0
	cmp r4, #0
	blt _08023F58
_08023E7C:
	ldr r2, _08024098
	bl _call_via_r2
	adds r2, r7, #0
	eors r2, r4
	cmp r2, #0
	blt _08023F54
_08023E8A:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x14]
	subs r1, r3, r2
	mov r3, r8
	cmp r3, #0
	ble _08023E9A
	cmp r0, r1
	bge _08023F50
_08023E9A:
	mov r2, r8
	cmp r2, #0
	blt _08023F4C
_08023EA0:
	ldr r3, [sp, #0x14]
	cmp sl, r3
	beq _08023EEC
	ldr r1, [sp, #0x10]
	cmp sl, r1
	bgt _08023EB4
	cmp r1, r3
	ble _08023EBC
	cmp sl, r1
	blt _08023EEC
_08023EB4:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r3, r0
	blt _08023EEC
_08023EBC:
	mov r1, fp
	ldr r2, [r1]
	cmp r2, #0
	beq _08023F42
	ldr r1, [sp, #0x18]
	movs r2, #0x80
	ldrh r0, [r1]
	lsls r1, r2, #1
	ands r1, r0
	cmp r1, #0
	beq _08023F34
	movs r3, #0xa0
_08023ED4:
	mov r1, sb
	rsbs r0, r3, #0
	ldr r3, [r1]
	muls r3, r0, r3
	asrs r0, r3, #8
	str r0, [r1]
	mov r2, fp
	ldr r3, [r2]
	subs r3, #1
	str r3, [r2]
	cmp r3, #0
	beq _08023F28
_08023EEC:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _08023F18
_08023EF2:
	ldr r1, [r5, #0x7c]
	lsls r3, r6, #1
	adds r0, r1, r3
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x14]
	str r0, [r5, #0x7c]
	str r1, [r2]
_08023F00:
	ldr r1, [sp, #8]
	ldr r0, [r1]
	add sp, #0x1c
	str r0, [r5]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08023F18:
	mov r1, fp
	ldr r3, [r1]
	cmp r3, #0
	bne _08023EF2
	ldr r0, [sp, #8]
	str r3, [r5, #0x7c]
	str r3, [r0]
	b _08023F00
_08023F28:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08023EEC
	mov r2, sb
	str r3, [r2]
	b _08023EEC
_08023F34:
	ldr r3, [sp, #4]
	cmp r3, #0
	beq _08023F3E
	movs r3, #0x80
	b _08023ED4
_08023F3E:
	movs r3, #0x40
	b _08023ED4
_08023F42:
	mov r1, sb
	ldr r2, [r1]
	rsbs r0, r2, #0
	str r0, [r1]
	b _08023EEC
_08023F4C:
	cmp r0, r1
	bgt _08023EA0
_08023F50:
	ldr r6, [sp]
	b _08023EA0
_08023F54:
	rsbs r0, r0, #0
	b _08023E8A
_08023F58:
	rsbs r1, r4, #0
	b _08023E7C
_08023F5C:
	adds r0, r3, #0
	b _08023E76
_08023F60:
	mov r2, r8
	cmp r2, #0
	bge _08023EA0
	cmp r1, #0
	bge _08023EA0
	b _08023E60
_08023F6C:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r2, [r0]
	muls r2, r6, r2
	asrs r6, r2, #8
	b _08023E40
_08023F78:
	movs r0, #0xb8
	lsls r3, r0, #1
	adds r6, r5, r3
	ldr r0, [r6]
	lsls r2, r0, #0xb
	b _08023E34
_08023F84:
	cmp r1, #0
	bge _08023FD4
	movs r6, #0xb8
	lsls r3, r6, #1
	adds r0, r5, r3
	ldr r6, [r0]
	lsls r0, r6, #0xa
	rsbs r2, r0, #0
	b _08023E34
_08023F96:
	ldr r3, [r5, #0x7c]
	mov r8, r3
	cmp r3, #0
	bgt _08023FA0
	b _08023E1C
_08023FA0:
	movs r6, #0xb8
	lsls r3, r6, #1
	adds r0, r5, r3
	ldr r6, [r0]
	lsls r0, r6, #0xb
	rsbs r2, r0, #0
	b _08023E34
_08023FAE:
	cmp r1, #0
	blt _08023FE6
	ldr r3, [r5, #0x7c]
	mov r8, r3
_08023FB6:
	cmp r1, #0
	ble _08023FD0
	mov r2, r8
	cmp r2, #0
	blt _08023FC4
	movs r6, #0xba
	b _08023E2C
_08023FC4:
	movs r0, #0xba
	lsls r3, r0, #1
	adds r6, r5, r3
	ldr r0, [r6]
	lsls r2, r0, #0xb
	b _08023E34
_08023FD0:
	cmp r1, #0
	blt _08023FD8
_08023FD4:
	movs r6, #0
	b _08023E36
_08023FD8:
	movs r6, #0xba
	lsls r3, r6, #1
	adds r0, r5, r3
	ldr r6, [r0]
	lsls r0, r6, #0xa
	rsbs r2, r0, #0
	b _08023E34
_08023FE6:
	ldr r2, [r5, #0x7c]
	mov r8, r2
	cmp r2, #0
	ble _08023FB6
	movs r6, #0xba
	lsls r3, r6, #1
	adds r0, r5, r3
	ldr r2, [r0]
	lsls r6, r2, #0xb
	rsbs r0, r6, #0
	asrs r6, r0, #8
	b _08023E36
_08023FFE:
	movs r3, #1
	str r3, [sp, #0xc]
	b _08023DF2
_08024004:
	ldr r6, [sp, #0x10]
	cmp r6, r1
	bge _08024016
	movs r6, #0x8c
	lsls r2, r3, #0xc
	adds r1, r6, r5
	rsbs r6, r2, #0
	asrs r2, r6, #8
	b _08023DE0
_08024016:
	movs r3, #0x8c
	adds r2, r3, r5
	movs r1, #0
	mov sb, r2
	str r1, [r2]
	b _08023DE4
_08024022:
	adds r6, r5, #0
	movs r3, #0x40
	movs r1, #0x84
	adds r6, #0x90
	str r3, [r6]
	adds r3, r1, r5
	mov fp, r3
	movs r2, #1
	mov r1, fp
	movs r3, #0x80
	str r2, [r1]
	b _08023DD0
_0802403A:
	adds r1, r5, #0
	adds r1, #0x90
	movs r3, #0x40
	movs r6, #0x84
	str r3, [r1]
	adds r2, r6, r5
	movs r1, #3
	str r1, [r2]
	mov fp, r2
	b _08023DD0
_0802404E:
	movs r6, #0x84
	movs r2, #0x8c
	adds r3, r6, r5
	adds r1, r2, r5
	mov fp, r3
	mov sb, r1
	b _08023DE4
_0802405C:
	movs r3, #0
	str r3, [sp, #0x10]
	adds r2, r5, #0
	ldr r6, _0802409C
	adds r2, #0xb4
	ldr r1, [r2]
	movs r4, #0
	adds r2, r6, #4
	movs r0, #0xc
_0802406E:
	ldr r3, [r4, r6]
	cmp r3, r1
	bgt _0802407E
	ldr r3, [r2]
	cmp r1, r3
	bgt _0802407E
	ldr r3, [r2, #4]
	str r3, [sp, #0x10]
_0802407E:
	subs r0, #1
	adds r2, #0xc
	adds r4, #0xc
	cmp r0, #0
	bge _0802406E
	ldr r3, [sp, #0x10]
	lsls r2, r3, #2
	adds r0, r2, r3
	lsls r1, r0, #0xb
	asrs r6, r1, #0xa
	str r6, [sp, #0x10]
	b _08023D94
	.byte 0x00, 0x00
_08024098:
	.4byte sub_0300034C
_0802409C:
	.4byte gUnk_0884EF50

	.global sub_080240A0
	.thumb_func
	.type sub_080240A0, %function
sub_080240A0: @ 080240A0
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
	beq _080240D2
	cmp r2, #0
	bge _080240C0
	b _080241BC
_080240C0:
	cmp r2, #0
	bgt _080240C6
	b _080241AE
_080240C6:
	movs r1, #0xb4
	lsls r0, r1, #1
	add r0, fp
	ldr r7, [r0]
	cmp r7, #0
	beq _080241AE
_080240D2:
	mov r2, fp
	adds r2, #0xa8
	str r2, [sp, #4]
	ldr r7, [sp, #8]
	ldr r1, [r2]
	subs r2, r7, r1
	cmp r2, #0
	ble _080241A0
	movs r0, #0x80
_080240E4:
	ldr r3, [sp, #4]
	ldr r1, [r3]
	movs r3, #0xa4
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
	ble _08024196
	cmp r2, #0
	ble _08024196
_08024104:
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
	blt _08024192
_0802411A:
	adds r1, r4, #0
	cmp r4, #0
	blt _0802418E
_08024120:
	ldr r2, _080241CC
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _0802418A
_0802412E:
	ldr r4, [sp, #8]
	subs r2, r4, r7
	cmp r6, #0
	ble _0802413A
	cmp r0, r2
	bge _08024182
_0802413A:
	cmp r6, #0
	blt _0802417E
_0802413E:
	mov r1, r8
	ldr r2, [r1]
	add r2, sl
	str r2, [r1]
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _08024166
_0802414C:
	ldr r4, [sp, #4]
	mov r1, fp
	str r7, [r4]
	add sp, #0xc
	str r7, [r1, #4]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08024166:
	mov r3, sb
	cmp r3, #0
	ble _08024174
_0802416C:
	cmp r7, #0
	bgt _0802414C
_08024170:
	movs r7, #0
	b _0802414C
_08024174:
	cmp r7, #0
	bge _08024170
	cmp r3, #0
	bge _0802416C
	b _0802414C
_0802417E:
	cmp r0, r2
	bgt _0802413E
_08024182:
	ldr r0, [sp]
	lsls r4, r0, #1
	mov sl, r4
	b _0802413E
_0802418A:
	rsbs r0, r0, #0
	b _0802412E
_0802418E:
	rsbs r1, r4, #0
	b _08024120
_08024192:
	adds r0, r3, #0
	b _0802411A
_08024196:
	cmp r1, #0
	bge _0802413E
	cmp r2, #0
	bge _0802413E
	b _08024104
_080241A0:
	cmp r2, #0
	blt _080241A8
	movs r0, #0
	b _080240E4
_080241A8:
	movs r4, #0x80
	rsbs r0, r4, #0
	b _080240E4
_080241AE:
	rsbs r3, r2, #0
	lsls r0, r3, #1
	adds r7, r0, r3
	lsls r4, r7, #0xb
	asrs r2, r4, #8
	str r2, [sp, #8]
	b _080240D2
_080241BC:
	movs r4, #0xb2
	lsls r1, r4, #1
	add r1, fp
	ldr r0, [r1]
	cmp r0, #0
	beq _080241CA
	b _080240D2
_080241CA:
	b _080240C0
_080241CC:
	.4byte sub_0300034C

	.global sub_080241D0
	.thumb_func
	.type sub_080241D0, %function
sub_080241D0: @ 080241D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	adds r4, r7, #0
	adds r4, #0xc8
	ldr r2, [r4]
	cmp r2, #0
	bne _080241E8
	b _08024346
_080241E8:
	movs r2, #0xd0
	movs r3, #0xcc
	adds r1, r2, r7
	adds r2, r3, r7
	ldr r5, [r1]
	mov r8, r1
	ldr r1, [r2]
	lsls r6, r5, #1
	lsls r3, r1, #1
	adds r1, r6, r3
	adds r6, r5, r3
	mov r5, r8
	str r6, [r5]
	movs r3, #0xd8
	mov sl, r2
	adds r2, r3, r7
	mov sb, r2
	ldr r2, [r2]
	adds r6, r2, r1
	cmp r1, #0
	ble _0802421E
	movs r5, #0x80
	lsls r3, r5, #9
	cmp r2, r3
	bgt _0802421E
	cmp r6, r3
	bge _080242EC
_0802421E:
	cmp r1, #0
	blt _080242E2
_08024222:
	mov r5, sl
	ldr r0, [r5]
	cmp r0, #0
	ble _08024292
	movs r5, #0x80
	lsls r1, r5, #8
	cmp r2, r1
	bgt _08024292
	cmp r6, r1
	blt _08024292
	lsls r1, r5, #9
	mov r5, r8
	ldr r2, [r5]
	adds r4, r2, #0
	muls r4, r2, r4
	adds r3, r4, #0
	subs r0, r1, r6
	rsbs r5, r3, #0
	lsls r4, r0, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _0802428E
_0802424E:
	adds r1, r4, #0
	cmp r4, #0
	blt _0802428A
_08024254:
	ldr r2, _08024378
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _08024286
_08024262:
	mov r2, sl
	str r0, [r2]
_08024266:
	mov r2, sb
	str r6, [r2]
	mov r5, r8
	ldr r1, [r5]
	adds r0, r7, #0
	lsls r2, r1, #0xb
	adds r0, #0xd4
	asrs r1, r2, #0x10
	str r1, [r0]
_08024278:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08024286:
	rsbs r0, r0, #0
	b _08024262
_0802428A:
	rsbs r1, r4, #0
	b _08024254
_0802428E:
	adds r0, r3, #0
	b _0802424E
_08024292:
	mov r5, sl
	ldr r0, [r5]
	cmp r0, #0
	bge _08024266
	ldr r3, _0802437C
	cmp r2, r3
	blt _08024266
	cmp r6, r3
	bgt _08024266
	ldr r1, _08024380
	subs r0, r1, r6
	mov r1, r8
	ldr r5, [r1]
	adds r4, r5, #0
	muls r4, r5, r4
	adds r3, r4, #0
	rsbs r5, r3, #0
	lsls r4, r0, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _080242DE
_080242BC:
	adds r1, r4, #0
	cmp r4, #0
	blt _080242DA
_080242C2:
	ldr r2, _08024378
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _080242D6
_080242D0:
	mov r1, sl
	str r0, [r1]
	b _08024266
_080242D6:
	rsbs r0, r0, #0
	b _080242D0
_080242DA:
	rsbs r1, r4, #0
	b _080242C2
_080242DE:
	adds r0, r3, #0
	b _080242BC
_080242E2:
	ldr r3, _08024380
	cmp r2, r3
	blt _08024222
	cmp r6, r3
	bgt _08024222
_080242EC:
	adds r2, r7, #0
	adds r2, #0x90
	movs r1, #0x80
	str r1, [r2]
	movs r6, #3
	subs r2, #0xc
	str r6, [r2]
	mov r5, r8
	ldr r3, [r5]
	cmp r3, #0
	ble _08024334
	adds r5, r3, #0
	muls r5, r3, r5
	adds r6, r5, #0
	adds r2, #8
	asrs r5, r6, #5
	str r5, [r2]
_0802430E:
	movs r6, #0
	mov r1, sl
	mov r2, r8
	str r6, [r4]
	adds r5, r0, #0
	str r6, [r1]
	str r6, [r2]
	adds r5, #0xa0
	ldr r0, [r5]
	movs r1, #0x21
	rsbs r3, r1, #0
	movs r2, #0x94
	ands r0, r3
	lsls r1, r2, #1
	str r0, [r5]
	adds r0, r7, r1
	movs r5, #1
	str r5, [r0]
	b _08024266
_08024334:
	adds r6, r3, #0
	muls r6, r3, r6
	adds r2, r6, #0
	adds r1, r7, #0
	rsbs r6, r2, #0
	adds r1, #0x8c
	asrs r2, r6, #5
	str r2, [r1]
	b _0802430E
_08024346:
	adds r1, r7, #0
	adds r1, #0xd4
	ldr r3, [r1]
	cmp r3, #0
	beq _08024278
	cmp r3, #0
	ble _08024362
	subs r3, #0x10
	str r3, [r1]
	cmp r3, #0
	blt _0802435E
	b _08024278
_0802435E:
	str r2, [r1]
	b _08024278
_08024362:
	cmp r3, #0
	blt _08024368
	b _08024278
_08024368:
	adds r3, #0x10
	str r3, [r1]
	cmp r3, #0
	bgt _08024372
	b _08024278
_08024372:
	str r2, [r1]
	b _08024278
	.byte 0x00, 0x00
_08024378:
	.4byte sub_0300034C
_0802437C:
	.4byte 0xFFFF8000
_08024380:
	.4byte 0xFFFF0000

	.global sub_08024384
	.thumb_func
	.type sub_08024384, %function
sub_08024384: @ 08024384
	push {r4, r5, r6, r7, lr}
	adds r0, #0xa0
	adds r5, r1, #0
	movs r3, #0x80
	ldr r1, [r0]
	lsls r0, r3, #0xe
	ands r1, r0
	cmp r1, #0
	beq _0802444E
	movs r2, #0xa4
	lsls r4, r2, #1
	adds r2, r5, r4
	ldr r1, [r2]
	cmp r1, #0
	beq _08024418
_080243A2:
	movs r4, #0x9a
	movs r1, #0x98
	lsls r3, r1, #1
	lsls r7, r4, #1
	adds r4, r5, r7
	adds r7, r3, r5
	ldr r1, [r4]
	ldr r0, [r7]
	subs r6, r1, r0
	asrs r2, r6, #3
	mov ip, r7
	movs r0, #0x9e
	subs r7, r1, r2
	movs r6, #0x9c
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
	movs r1, #0xa2
	movs r7, #0xa0
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
_08024410:
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08024418:
	movs r0, #1
	str r0, [r2]
	movs r2, #0x98
	lsls r1, r2, #1
	adds r7, r5, r1
	bl multi_lfsr_next
	lsls r6, r0, #0x10
	asrs r4, r6, #0x12
	movs r0, #0x9c
	lsls r3, r0, #1
	str r4, [r7]
	adds r6, r5, r3
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r1, r2, #0x12
	movs r4, #0xa0
	str r1, [r6]
	lsls r0, r4, #1
	adds r6, r5, r0
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r7, r3, #0x12
	str r7, [r6]
	b _080243A2
_0802444E:
	movs r4, #0x9a
	lsls r2, r4, #1
	adds r4, r5, r2
	ldr r7, [r4]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r0, #0x9e
	str r1, [r4]
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r7, [r0]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r2, #0xa2
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
	b _08024410

	.global sub_08024490
	.thumb_func
	.type sub_08024490, %function
sub_08024490: @ 08024490
	push {r4, r5, r6, lr}
	ldr r0, _08024504
	ldr r3, [r0, #0x10]
	asrs r5, r3, #4
	adds r1, r5, #0
	muls r1, r5, r1
	asrs r6, r1, #0xc
	muls r6, r5, r6
	asrs r4, r6, #0xc
	muls r4, r5, r4
	ldr r1, [r0, #0x14]
	lsls r5, r1, #8
	adds r1, r0, #0
	adds r1, #0x80
	ldr r2, [r1]
	asrs r6, r4, #8
	cmp r2, #0
	ble _08024500
	adds r4, r2, #0
_080244B6:
	movs r3, #0xa2
	lsls r2, r3, #1
	movs r1, #0x9e
	adds r3, r0, r2
	lsls r2, r1, #1
	adds r1, r0, r2
	ldr r2, [r3]
	ldr r3, [r1]
	adds r2, r2, r3
	movs r3, #0x9a
	lsls r1, r3, #1
	adds r3, r0, r1
	ldr r3, [r3]
	adds r1, r2, r3
	lsls r2, r4, #1
	subs r3, r6, r5
	subs r3, r3, r2
	movs r2, #0xa0
	lsls r4, r2, #8
	adds r2, r3, r4
	movs r4, #0x80
	lsls r3, r4, #0xb
	cmp r2, r3
	ble _080244E8
	adds r2, r3, #0
_080244E8:
	movs r3, #0x90
	lsls r4, r3, #1
	adds r3, r0, r4
	ldr r0, [r3]
	subs r2, r0, r2
	asrs r2, r2, #3
	subs r0, r0, r2
	str r0, [r3]
	adds r0, r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_08024500:
	rsbs r4, r2, #0
	b _080244B6
_08024504:
	.4byte 0x0202E810

	.global sub_08024508
	.thumb_func
	.type sub_08024508, %function
sub_08024508: @ 08024508
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0x94
	adds r4, r1, #0
	lsls r1, r2, #1
	adds r6, r0, #0
	adds r0, r1, r4
	ldr r5, [r0]
	sub sp, #0x14
	mov sl, r0
	cmp r5, #1
	bne _08024528
	b _0802461C
_08024528:
	cmp r5, #3
	beq _080245D0
	cmp r5, #5
	beq _08024594
	cmp r5, #7
	beq _08024544
_08024534:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08024544:
	movs r5, #0x94
	lsls r2, r5, #1
	adds r5, r6, r2
	adds r0, r5, #0
	bl gamesfx_release
	movs r1, #0x90
	lsls r3, r1, #1
	adds r1, r4, r3
	movs r0, #0x80
	movs r3, #0x92
	lsls r2, r0, #7
	lsls r0, r3, #1
	str r2, [r1]
	adds r3, r4, r0
	movs r2, #0x40
	str r2, [r3]
	subs r0, #8
	adds r3, r4, r0
	ldr r3, [r3]
	str r2, [sp]
	ldr r0, [r1]
	movs r4, #1
	str r0, [sp, #4]
	movs r1, #1
	movs r0, #0
	str r4, [sp, #8]
	str r0, [sp, #0x10]
	rsbs r4, r1, #0
	ldr r0, _080246AC
	ldr r1, _080246B0
	adds r2, r6, #0
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	beq _08024534
	movs r0, #8
	b _08024616
_08024594:
	movs r5, #0x94
	lsls r3, r5, #1
	adds r5, r6, r3
	adds r0, r5, #0
	bl gamesfx_stop
	movs r1, #0x7f
	movs r0, #0x80
	lsls r2, r0, #9
	str r1, [sp]
	movs r4, #1
	movs r3, #1
	movs r1, #0
	str r2, [sp, #4]
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
	beq _08024534
	movs r2, #6
	mov r0, sl
	str r2, [r0]
	b _08024534
_080245D0:
	movs r5, #0x94
	lsls r2, r5, #1
	adds r5, r6, r2
	adds r0, r5, #0
	bl gamesfx_stop
	movs r3, #0xc4
	lsls r0, r3, #1
	adds r3, r4, r0
	ldr r1, [r4, #0x10]
	ldr r0, [r3]
	adds r3, r0, #0
	muls r3, r1, r3
	asrs r1, r3, #0x10
	cmp r1, r0
	ble _080245F2
	adds r1, r0, #0
_080245F2:
	movs r2, #0x8c
	lsls r3, r2, #1
	adds r2, r4, r3
	movs r3, #1
	ldr r0, [r2]
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
	beq _08024534
	movs r0, #4
_08024616:
	mov r1, sl
	str r0, [r1]
	b _08024534
_0802461C:
	movs r0, #0x94
	lsls r2, r0, #1
	adds r1, r2, r6
	mov sb, r1
	mov r0, sb
	movs r7, #0x90
	bl gamesfx_stop
	lsls r3, r7, #1
	movs r1, #0x80
	movs r7, #0x92
	adds r2, r3, r4
	lsls r0, r1, #7
	lsls r1, r7, #1
	str r0, [r2]
	adds r7, r4, r1
	movs r0, #0x40
	str r0, [r7]
	adds r0, r6, #0
	mov r8, r2
	bl sub_08024490
	ldr r1, _080246B4
	movs r3, #0xc2
	lsls r2, r3, #1
	adds r3, r1, r2
	ldr r0, [r3]
	ldr r2, [r1, #0x10]
	adds r3, r0, #0
	muls r3, r2, r3
	asrs r3, r3, #0x10
	cmp r3, r0
	ble _08024660
	adds r3, r0, #0
_08024660:
	movs r0, #0x92
	lsls r2, r0, #1
	adds r0, r1, r2
	ldr r2, [r0]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r0]
	movs r2, #0x8e
	ldr r0, [r7]
	lsls r3, r2, #1
	adds r1, r4, r3
	ldr r3, [r1]
	str r0, [sp]
	mov r1, r8
	ldr r4, [r1]
	movs r2, #1
	movs r1, #0
	str r4, [sp, #4]
	str r1, [sp, #0x10]
	rsbs r4, r2, #0
	ldr r0, _080246B8
	adds r2, r6, #0
	ldr r1, _080246BC
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	mov r2, sb
	str r0, [r2]
	cmp r0, r4
	bne _080246A2
	b _08024534
_080246A2:
	movs r1, #2
	mov r0, sl
	str r1, [r0]
	b _08024534
	.byte 0x00, 0x00
_080246AC:
	.4byte sub_08025D8C
_080246B0:
	.4byte sub_08025DBC
_080246B4:
	.4byte 0x0202E810
_080246B8:
	.4byte sub_08025D58
_080246BC:
	.4byte sub_08024490
