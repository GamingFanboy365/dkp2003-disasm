@ asm/frontend.s: ROM 0x0144A0-0x0168D4 (rom, VMA 0x080144A0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global fe_credits_init
	.thumb_func
	.type fe_credits_init, %function
fe_credits_init: @ 080144A0
	push {r4, lr}
	ldr r4, _080144E8
	ldr r1, _080144DC
	ldr r0, _080144EC
	strh r1, [r4]
	ldr r1, _080144F0
	bl AGBPrintf
	ldr r2, _080144F4
	movs r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	str r1, [r2, #8]
	movs r3, #0x80
	ldr r2, _080144E0
	lsls r0, r3, #0x13
	strh r2, [r0]
	ldr r2, _080144E4
	adds r0, #8
	strh r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	strh r1, [r0]
	ldr r0, _080144F8
	ldr r1, _080144FC
	b _08014500
	.byte 0x00, 0x00
_080144DC:
	.4byte 0x00000000
_080144E0:
	.4byte 0x00001140
_080144E4:
	.4byte 0x00008004
_080144E8:
	.4byte 0x04000208
_080144EC:
	.4byte gUnk_08051104
_080144F0:
	.4byte gUnk_08051114
_080144F4:
	.4byte 0x02023F98
_080144F8:
	.4byte gStateFunc
_080144FC:
	.4byte sub_0801429C
_08014500:
	str r1, [r0]
	ldr r0, _0801450C
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
_0801450C:
	.4byte 0x00000001

	.global sub_08014510
	.thumb_func
	.type sub_08014510, %function
sub_08014510: @ 08014510
	push {r4, lr}
	sub sp, #4
	ldr r4, _08014558
	mov r1, sp
	ldr r2, _0801454C
	ldr r0, _08014550
	adds r1, #2
	strh r2, [r4]
	strh r0, [r1]
	ldr r0, _0801455C
	ldr r2, _08014560
	str r1, [r0]
	ldr r1, _08014564
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08014568
	ldr r3, _0801456C
	ldr r1, [r0]
	orrs r1, r3
	str r1, [r0]
	bl sub_080035F8
	ldr r0, _08014570
	ldr r1, _08014574
	str r1, [r0]
	ldr r0, _08014554
	add sp, #4
	strh r0, [r4]
	b _08014578
_0801454C:
	.4byte 0x00000000
_08014550:
	.4byte 0x00007FFF
_08014554:
	.4byte 0x00000001
_08014558:
	.4byte 0x04000208
_0801455C:
	.4byte 0x040000D4
_08014560:
	.4byte 0x81000100
_08014564:
	.4byte 0x0201BB18
_08014568:
	.4byte 0x0201BAF0
_0801456C:
	.4byte 0x0000FFFF
_08014570:
	.4byte gStateFunc
_08014574:
	.4byte sub_08014580
_08014578:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global sub_08014580
	.thumb_func
	.type sub_08014580, %function
sub_08014580: @ 08014580
	push {r4, lr}
	bl sub_08003478
	ldr r4, _080145BC
	ldr r0, _080145C4
	strh r4, [r0]
	ldr r4, _080145C8
	ldr r1, [r4]
	movs r2, #0x80
	orrs r1, r2
	str r1, [r4]
	ldr r1, [r4]
	lsls r3, r2, #2
	ldr r2, _080145C0
	eors r1, r3
	str r1, [r4]
	strh r2, [r0]
	ldr r0, _080145CC
	bl sub_08036B5C
	ldr r0, [r4]
	movs r3, #0x80
	lsls r1, r3, #4
	ands r0, r1
	cmp r0, #0
	beq _080145D0
	movs r0, #0
	bl sub_0801E5A4
	b _080145D0
_080145BC:
	.4byte 0x00000000
_080145C0:
	.4byte 0x00000001
_080145C4:
	.4byte 0x04000208
_080145C8:
	.4byte 0x0300566C
_080145CC:
	.4byte sub_03003D54
_080145D0:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0xC0, 0x46

	.global sub_080145D8
	.thumb_func
	.type sub_080145D8, %function
sub_080145D8: @ 080145D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _080148C0
	ldr r3, [r5]
	mov ip, r0
	mov sl, r1
	mov lr, r2
	cmp ip, r3
	beq _08014692
	ldr r1, _080148C4
	subs r2, r0, r3
	ldr r0, [r1]
	mov sb, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	cmn r2, r0
	bge _08014604
	lsls r4, r1, #2
	adds r2, r2, r4
_08014604:
	cmp r2, r0
	ble _0801460C
	lsls r0, r1, #2
	subs r2, r2, r0
_0801460C:
	movs r1, #0x20
	rsbs r3, r1, #0
	cmp r2, r3
	bge _08014616
	adds r2, r3, #0
_08014616:
	cmp r2, #0x20
	ble _0801461C
	movs r2, #0x20
_0801461C:
	cmp r2, #0
	bge _08014622
	b _080148EC
_08014622:
	mov r1, ip
	subs r7, r1, r2
	adds r4, r7, #0
	mov r7, ip
	adds r4, #0x1f
	adds r7, #0x1f
	cmp r4, r7
	bge _0801468E
_08014632:
	mov r2, sb
	ldr r5, [r2]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _08014644
_0801463E:
	subs r6, r6, r3
	cmp r6, r3
	bge _0801463E
_08014644:
	movs r5, #0
_08014646:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	lsls r1, r2, #1
	ldr r2, _080148C8
	adds r0, r1, r2
	mov r2, sb
	ldr r1, [r2]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r2, r3, r6
	lsls r3, r2, #1
	adds r2, r3, r1
	ldrh r3, [r2, #4]
	movs r1, #3
	adds r2, r5, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	adds r2, r4, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r1, r3, r2
	ldr r2, _080148CC
	lsls r3, r1, #1
	ldrh r1, [r3, r2]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _08014646
	adds r4, #1
	cmp r4, r7
	blt _08014632
_0801468C:
	ldr r5, _080148C0
_0801468E:
	mov r3, ip
	str r3, [r5]
_08014692:
	ldr r5, _080148D0
	ldr r3, [r5]
	cmp sl, r3
	beq _0801473C
	mov r1, sl
	subs r2, r1, r3
	ldr r3, _080148D4
	ldr r4, [r3]
	ldrh r1, [r4]
	lsls r0, r1, #1
	mov r8, r3
	cmn r2, r0
	bge _080146B0
	lsls r4, r1, #2
	adds r2, r2, r4
_080146B0:
	cmp r2, r0
	ble _080146B8
	lsls r0, r1, #2
	subs r2, r2, r0
_080146B8:
	movs r1, #0x20
	rsbs r3, r1, #0
	cmp r2, r3
	bge _080146C2
	adds r2, r3, #0
_080146C2:
	cmp r2, #0x20
	ble _080146C8
	movs r2, #0x20
_080146C8:
	cmp r2, #0
	bge _080146CE
	b _08014858
_080146CE:
	mov r1, sl
	subs r7, r1, r2
	adds r4, r7, #0
	mov r7, sl
	adds r4, #0x1f
	adds r7, #0x1f
	cmp r4, r7
	bge _08014738
_080146DE:
	mov r2, r8
	ldr r5, [r2]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _080146F0
_080146EA:
	subs r6, r6, r3
	cmp r6, r3
	bge _080146EA
_080146F0:
	movs r5, #0
_080146F2:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	lsls r1, r2, #1
	ldr r2, _080148D8
	adds r0, r1, r2
	mov r2, r8
	ldr r1, [r2]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r3, r3, r6
	lsls r2, r3, #1
	adds r3, r2, r1
	ldrh r2, [r3, #4]
	movs r1, #3
	adds r3, r5, #0
	ands r3, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r3, r4, #0
	ands r3, r1
	lsls r1, r2, #2
	adds r2, r1, r3
	ldr r3, _080148DC
	ldrb r1, [r2, r3]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _080146F2
	adds r4, #1
	cmp r4, r7
	blt _080146DE
_08014736:
	ldr r5, _080148D0
_08014738:
	mov r3, sl
	str r3, [r5]
_0801473C:
	ldr r5, _080148E0
	ldr r3, [r5]
	cmp lr, r3
	beq _080147E6
	mov r1, lr
	subs r2, r1, r3
	ldr r3, _080148E4
	ldr r4, [r3]
	ldrh r1, [r4]
	lsls r0, r1, #1
	mov ip, r3
	cmn r2, r0
	bge _0801475A
	lsls r7, r1, #2
	adds r2, r2, r7
_0801475A:
	cmp r2, r0
	ble _08014762
	lsls r0, r1, #2
	subs r2, r2, r0
_08014762:
	movs r1, #0x20
	rsbs r3, r1, #0
	cmp r2, r3
	bge _0801476C
	adds r2, r3, #0
_0801476C:
	cmp r2, #0x20
	ble _08014772
	movs r2, #0x20
_08014772:
	cmp r2, #0
	blt _080147F4
	mov r1, lr
	subs r7, r1, r2
	adds r4, r7, #0
	mov r7, lr
	adds r4, #0x1f
	adds r7, #0x1f
	cmp r4, r7
	bge _080147E2
_08014786:
	mov r2, ip
	ldr r5, [r2]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _08014798
_08014792:
	subs r6, r6, r3
	cmp r6, r3
	bge _08014792
_08014798:
	movs r5, #0
_0801479A:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	lsls r1, r2, #1
	ldr r2, _080148E8
	adds r0, r1, r2
	mov r2, ip
	ldr r1, [r2]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r2, r3, r6
	lsls r3, r2, #1
	adds r2, r3, r1
	ldrh r3, [r2, #4]
	movs r1, #3
	adds r2, r5, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	adds r2, r4, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r1, r3, r2
	ldr r2, _080148CC
	lsls r3, r1, #1
	ldrh r1, [r3, r2]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _0801479A
	adds r4, #1
	cmp r4, r7
	blt _08014786
_080147E0:
	ldr r5, _080148E0
_080147E2:
	mov r3, lr
	str r3, [r5]
_080147E6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080147F4:
	mov r4, lr
	subs r7, r4, r2
	cmp lr, r7
	bge _080147E2
_080147FC:
	mov r1, ip
	ldr r5, [r1]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _0801480E
_08014808:
	subs r6, r6, r3
	cmp r6, r3
	bge _08014808
_0801480E:
	movs r5, #0
_08014810:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	ldr r1, _080148E8
	lsls r3, r2, #1
	adds r0, r3, r1
	mov r3, ip
	ldr r1, [r3]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r2, r3, r6
	lsls r3, r2, #1
	adds r2, r3, r1
	ldrh r3, [r2, #4]
	movs r1, #3
	adds r2, r5, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	adds r2, r4, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r1, r3, r2
	ldr r2, _080148CC
	lsls r3, r1, #1
	ldrh r1, [r3, r2]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _08014810
	adds r4, #1
	cmp r4, r7
	blt _080147FC
	b _080147E0
_08014858:
	mov r4, sl
	subs r3, r4, r2
	cmp r4, r3
	blt _08014862
	b _08014738
_08014862:
	mov ip, r3
_08014864:
	mov r1, r8
	ldr r5, [r1]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _08014876
_08014870:
	subs r6, r6, r3
	cmp r6, r3
	bge _08014870
_08014876:
	movs r5, #0
_08014878:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	ldr r1, _080148D8
	lsls r3, r2, #1
	adds r0, r3, r1
	mov r3, r8
	ldr r1, [r3]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r3, r3, r6
	lsls r2, r3, #1
	adds r3, r2, r1
	ldrh r2, [r3, #4]
	movs r1, #3
	adds r3, r5, #0
	ands r3, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r3, r4, #0
	ands r3, r1
	lsls r1, r2, #2
	adds r2, r1, r3
	ldr r3, _080148DC
	ldrb r1, [r2, r3]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _08014878
	adds r4, #1
	cmp r4, ip
	blt _08014864
	b _08014736
	.byte 0x00, 0x00
_080148C0:
	.4byte 0x020241C8
_080148C4:
	.4byte 0x020240F8
_080148C8:
	.4byte 0x06000280
_080148CC:
	.4byte gUnk_081108A0
_080148D0:
	.4byte 0x020241CC
_080148D4:
	.4byte 0x020240FC
_080148D8:
	.4byte 0x06000A80
_080148DC:
	.4byte gUnk_081136E0
_080148E0:
	.4byte 0x020241D0
_080148E4:
	.4byte 0x02024100
_080148E8:
	.4byte 0x06001280
_080148EC:
	mov r4, ip
	subs r3, r4, r2
	cmp r4, r3
	blt _080148F6
	b _0801468E
_080148F6:
	mov r8, r3
_080148F8:
	mov r2, sb
	ldr r5, [r2]
	ldrh r3, [r5]
	asrs r6, r4, #2
	cmp r6, r3
	blt _0801490A
_08014904:
	subs r6, r6, r3
	cmp r6, r3
	bge _08014904
_0801490A:
	movs r5, #0
_0801490C:
	movs r0, #0x1f
	lsls r1, r5, #5
	ands r0, r4
	adds r2, r1, r0
	lsls r1, r2, #1
	ldr r2, _08014954
	adds r0, r1, r2
	mov r2, sb
	ldr r1, [r2]
	ldrh r2, [r1]
	asrs r3, r5, #2
	muls r3, r2, r3
	adds r2, r3, r6
	lsls r3, r2, #1
	adds r2, r3, r1
	ldrh r3, [r2, #4]
	movs r1, #3
	adds r2, r5, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	adds r2, r4, #0
	ands r2, r1
	lsls r3, r3, #2
	adds r1, r3, r2
	ldr r2, _08014958
	lsls r3, r1, #1
	ldrh r1, [r3, r2]
	adds r5, #1
	strh r1, [r0]
	cmp r5, #9
	ble _0801490C
	adds r4, #1
	cmp r4, r8
	blt _080148F8
	b _0801468C
_08014954:
	.4byte 0x06000280
_08014958:
	.4byte gUnk_081108A0

	.global fe_title_init
	.thumb_func
	.type fe_title_init, %function
fe_title_init: @ 0801495C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r0, _080149BC
	ldr r1, _080149C0
	sub sp, #0x10
	bl AGBPrintf
	ldr r5, _080149A4
	ldr r6, _080149C4
	ldr r0, _080149C8
	strh r5, [r6]
	ldr r4, _080149A8
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	ldr r4, _080149CC
	ldr r3, _080149AC
	ldrh r7, [r4]
	orrs r7, r3
	strh r7, [r4]
	ldr r1, _080149D0
	ldr r7, _080149D4
	ldr r0, _080149D8
	ldr r4, _080149B0
	str r1, [r7]
	movs r2, #0x80
	ldr r1, _080149B4
	str r0, [r7, #4]
	strh r4, [r6]
	ldr r0, _080149B8
	b _080149DC
	.byte 0x00, 0x00
_080149A4:
	.4byte 0x00000000
_080149A8:
	.4byte 0x00000002
_080149AC:
	.4byte 0x00000010
_080149B0:
	.4byte 0x00000001
_080149B4:
	.4byte 0x00009740
_080149B8:
	.4byte 0x00000008
_080149BC:
	.4byte gUnk_0805118C
_080149C0:
	.4byte gUnk_08051198
_080149C4:
	.4byte 0x04000208
_080149C8:
	.4byte 0x04000200
_080149CC:
	.4byte 0x04000004
_080149D0:
	.4byte sub_08015C38
_080149D4:
	.4byte 0x03005620
_080149D8:
	.4byte sub_08015C54
_080149DC:
	lsls r4, r2, #0x13
	strh r1, [r4]
	ldr r7, _08014A1C
	adds r4, #8
	strh r0, [r4]
	ldr r6, _08014A20
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	strh r6, [r4]
	adds r4, #4
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	mov r2, sp
	adds r4, #2
	strh r5, [r4]
	ldr r0, _08014A24
	strh r5, [r2, #0xe]
	ldr r4, _08014A28
	b _08014A2C
	.byte 0x00, 0x00
_08014A1C:
	.4byte 0x00000184
_08014A20:
	.4byte 0x00000208
_08014A24:
	.4byte 0x810000A0
_08014A28:
	.4byte 0x040000D4
_08014A2C:
	movs r2, #0xe
	ldr r1, _08014AA4
	.2byte 0x446A @ add r2, sp, r2
	str r2, [r4]
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldr r0, _08014AA8
	ldr r3, [r4, #8]
	movs r2, #0x16
	ldrsh r3, [r0, r2]
	cmp r3, #1
	bne _08014A46
	b _08014DBA
_08014A46:
	cmp r3, #1
	ble _08014A4C
	b _08014D6C
_08014A4C:
	cmp r3, #0
	bne _08014A52
	b _08014D20
_08014A52:
	ldr r5, _08014AAC
	ldr r2, _08014AB0
	ldr r0, [r5]
	ldr r3, [r2]
	ldr r1, _08014AA4
	movs r2, #0xa0
	ldr r6, _08014AB4
	bl _call_via_r6
	ldr r4, _08014AA0
	mov r3, sp
	strh r4, [r3, #0xe]
	ldr r6, _08014AB8
	movs r1, #0xc0
	ldr r3, _08014ABC
	movs r7, #0xe
	lsls r0, r1, #0x13
	.2byte 0x446F @ add r7, sp, r7
	str r7, [r6]
	str r0, [r6, #4]
	str r3, [r6, #8]
	ldr r5, _08014AC0
	ldr r1, _08014AC4
	ldr r2, [r6, #8]
	mov r2, sp
	strh r4, [r2, #0xe]
	str r7, [r6]
	str r5, [r6, #4]
	str r1, [r6, #8]
	ldr r0, _08014AC8
	ldr r3, [r6, #8]
	movs r3, #0
	ldr r4, _08014ACC
	mov ip, r3
	ldr r2, _08014AD0
	ldr r3, [r0]
	mov fp, r4
	b _08014AD4
	.byte 0x00, 0x00
_08014AA0:
	.4byte 0x00000000
_08014AA4:
	.4byte 0x02023FA4
_08014AA8:
	.4byte 0x0202D74C
_08014AAC:
	.4byte 0x02024104
_08014AB0:
	.4byte 0x0201BAEC
_08014AB4:
	.4byte sub_03003BB8
_08014AB8:
	.4byte 0x040000D4
_08014ABC:
	.4byte 0x81000C00
_08014AC0:
	.4byte 0x06008000
_08014AC4:
	.4byte 0x81000010
_08014AC8:
	.4byte 0x020240F8
_08014ACC:
	.4byte gUnk_081108A0
_08014AD0:
	.4byte 0x020240FC
_08014AD4:
	mov sl, r3
	ldr r4, _08014BE8
	ldr r3, [r2]
	mov r8, r3
	ldr r3, [r4]
	mov lr, r3
_08014AE0:
	mov r3, ip
	mov r2, ip
	lsls r2, r2, #5
	asrs r7, r3, #2
	mov r5, ip
	movs r3, #3
	movs r6, #0
	mov sb, r2
	ands r5, r3
_08014AF2:
	mov r2, sb
	adds r3, r2, r6
	ldr r4, _08014BEC
	lsls r1, r3, #1
	adds r0, r1, r4
	str r0, [sp, #4]
	mov r4, sl
	ldrh r3, [r4]
	muls r3, r7, r3
	asrs r0, r6, #2
	adds r2, r3, r0
	lsls r4, r2, #1
	add r4, sl
	ldrh r2, [r4, #4]
	lsls r4, r2, #2
	adds r2, r4, r5
	str r2, [sp]
	movs r4, #3
	adds r2, r6, #0
	ands r2, r4
	ldr r4, [sp]
	lsls r3, r4, #2
	adds r4, r3, r2
	lsls r3, r4, #1
	mov r4, fp
	ldrh r3, [r3, r4]
	ldr r4, [sp, #4]
	strh r3, [r4]
	ldr r3, _08014BF0
	adds r4, r1, r3
	str r4, [sp, #4]
	mov r4, r8
	ldrh r4, [r4]
	adds r3, r4, #0
	muls r3, r7, r3
	adds r3, r3, r0
	lsls r4, r3, #1
	add r4, r8
	ldrh r3, [r4, #4]
	lsls r4, r3, #2
	adds r3, r4, r5
	lsls r4, r3, #2
	adds r3, r4, r2
	ldr r4, _08014BF4
	ldrb r3, [r3, r4]
	ldr r4, [sp, #4]
	strh r3, [r4]
	ldr r4, _08014BF8
	adds r1, r1, r4
	mov r4, lr
	ldrh r3, [r4]
	muls r3, r7, r3
	adds r4, r3, r0
	lsls r0, r4, #1
	add r0, lr
	ldrh r4, [r0, #4]
	lsls r0, r4, #2
	adds r4, r0, r5
	lsls r0, r4, #2
	adds r4, r0, r2
	lsls r0, r4, #1
	mov r2, fp
	ldrh r4, [r0, r2]
	adds r6, #1
	strh r4, [r1]
	cmp r6, #0x1f
	ble _08014AF2
	movs r7, #1
	add ip, r7
	mov r4, ip
	cmp r4, #9
	ble _08014AE0
	ldr r4, _08014BFC
	movs r2, #0xe0
	ldr r0, _08014C00
	movs r5, #0
	add r6, sp, #8
	lsls r1, r2, #0x13
	str r5, [sp, #8]
	str r6, [r4]
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldr r2, _08014C04
	ldr r6, _08014C08
	movs r7, #0xe
	ldr r3, [r4, #8]
	.2byte 0x446F @ add r7, sp, r7
	mov r3, sp
	strh r5, [r3, #0xe]
	ldr r1, _08014BDC
	str r7, [r4]
	str r6, [r4, #4]
	ldr r7, _08014C0C
	str r2, [r4, #8]
	ldr r0, _08014BE0
	ldr r3, [r4, #8]
	strh r1, [r7]
	ldr r3, _08014BE4
	adds r7, #6
	strh r0, [r7]
	adds r7, #4
	strh r3, [r7]
	bl fe_spr_init
	ldr r6, _08014C10
	ldr r4, _08014C14
	ldr r1, _08014C18
	ldr r0, _08014C1C
	ldr r2, _08014C20
	ldr r7, _08014C24
	str r5, [r6]
	ldr r6, _08014C28
	str r5, [r4]
	movs r3, #0x10
	str r5, [r1]
	str r5, [r0]
	b _08014C2C
_08014BDC:
	.4byte 0x00003F1F
_08014BE0:
	.4byte 0x000000EF
_08014BE4:
	.4byte 0x00000003
_08014BE8:
	.4byte 0x02024100
_08014BEC:
	.4byte 0x06000280
_08014BF0:
	.4byte 0x06000A80
_08014BF4:
	.4byte gUnk_081136E0
_08014BF8:
	.4byte 0x06001280
_08014BFC:
	.4byte 0x040000D4
_08014C00:
	.4byte 0x85000100
_08014C04:
	.4byte 0x81004000
_08014C08:
	.4byte 0x06010000
_08014C0C:
	.4byte 0x0400004A
_08014C10:
	.4byte 0x020240E4
_08014C14:
	.4byte 0x020241D0
_08014C18:
	.4byte 0x020241CC
_08014C1C:
	.4byte 0x020241C8
_08014C20:
	.4byte 0x020240F0
_08014C24:
	.4byte 0x020240E8
_08014C28:
	.4byte 0x020240EC
_08014C2C:
	str r5, [r2]
	ldr r0, _08014E08
	str r5, [r7]
	ldr r7, _08014E0C
	str r3, [r6]
	movs r2, #0x46
	movs r1, #0xf0
	movs r4, #0x78
	movs r6, #0xa0
	str r5, [r0]
	str r2, [r7]
	str r1, [r0, #4]
	str r2, [r7, #4]
	str r4, [r0, #8]
	str r6, [r7, #8]
	str r5, [r0, #0xc]
	str r2, [r7, #0xc]
	ldr r5, _08014E10
	str r1, [r0, #0x10]
	ldr r1, _08014E14
	adds r6, #0x60
	str r2, [r7, #0x10]
	str r6, [r5]
	str r6, [r5, #4]
	str r6, [r5, #8]
	str r6, [r5, #0xc]
	str r6, [r5, #0x10]
	str r6, [r1]
	ldr r4, _08014E18
	ldr r2, _08014E1C
	str r6, [r1, #4]
	str r6, [r1, #8]
	str r6, [r1, #0xc]
	str r6, [r1, #0x10]
	ldr r7, _08014E20
	ldr r6, _08014E24
	mov sl, r4
	mov r8, r2
	movs r4, #0
	movs r5, #3
_08014C7C:
	bl sub_08000B14
	movs r1, #0xf0
	muls r1, r0, r1
	mov r2, sl
	lsrs r0, r1, #0x10
	str r0, [r4, r2]
	bl sub_08000B14
	movs r2, #0x28
	muls r2, r0, r2
	lsrs r1, r2, #0x10
	adds r1, #0xa0
	mov r2, r8
	movs r0, #0
	str r1, [r4, r2]
	str r0, [r6, r4]
	bl sub_08000B14
	subs r5, #1
	lsrs r3, r0, #0xc
	str r3, [r4, r7]
	adds r4, #4
	cmp r5, #0
	bge _08014C7C
	ldr r5, _08014E28
	movs r4, #0x16
	ldrsh r3, [r5, r4]
	cmp r3, #1
	beq _08014D18
	cmp r3, #1
	bgt _08014D0C
	cmp r3, #0
	beq _08014D04
_08014CC0:
	movs r0, #0x37
	bl sub_0802F09C
	movs r0, #0x7f
	bl sub_0802F0A2
	movs r3, #0xfa
	lsls r2, r3, #2
	ldr r3, _08014E2C
	movs r5, #3
_08014CD4:
	subs r5, #1
	stm r3!, {r2}
	cmp r5, #0
	bge _08014CD4
	bl sub_0801DEDC
	bl sub_08003634
	ldr r1, _08014E30
	ldr r0, _08014E34
	str r1, [r0]
	ldr r0, _08014E38
	ldr r1, _08014E3C
	bl AGBPrintf
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08014D04:
	movs r0, #5
	bl music_play_if_changed
	b _08014CC0
_08014D0C:
	cmp r3, #2
	bne _08014CC0
	movs r0, #0x19
	bl music_play_if_changed
	b _08014CC0
_08014D18:
	movs r0, #0x18
	bl music_play_if_changed
	b _08014CC0
_08014D20:
	ldr r3, _08014E40
	ldr r0, _08014E44
	ldr r7, _08014E48
	str r3, [r0]
	ldr r6, _08014E4C
	ldr r1, _08014E50
	ldr r5, _08014E54
	ldr r3, _08014E58
	ldr r0, _08014E5C
	str r7, [r6]
	str r1, [r5]
	str r3, [r0]
	ldr r0, _08014E60
	bl sub_080035C8
	ldr r6, _08014E64
	str r6, [r4]
	subs r6, #2
	ldrh r1, [r6]
	movs r5, #0x80
	lsls r6, r5, #0x18
	ldr r7, _08014E68
	lsls r0, r1, #5
	orrs r0, r6
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r7, _08014E6C
	ldr r3, [r4, #8]
	str r7, [r4]
	subs r7, #2
	ldrh r2, [r7]
	ldr r3, _08014E70
	lsls r5, r2, #4
	orrs r5, r6
	str r3, [r4, #4]
	str r5, [r4, #8]
	ldr r3, [r4, #8]
	b _08014A52
_08014D6C:
	cmp r3, #2
	beq _08014D72
	b _08014A52
_08014D72:
	ldr r3, _08014E74
	ldr r7, _08014E44
	ldr r5, _08014E78
	str r3, [r7]
	ldr r6, _08014E4C
	ldr r1, _08014E7C
	ldr r0, _08014E54
	ldr r3, _08014E80
	ldr r7, _08014E5C
	str r5, [r6]
	str r1, [r0]
	str r3, [r7]
	ldr r0, _08014E84
	bl sub_080035C8
	ldr r6, _08014E88
	str r6, [r4]
	subs r6, #2
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r6, r2, #0x18
	ldr r5, _08014E68
	lsls r0, r1, #5
	orrs r0, r6
	str r5, [r4, #4]
	ldr r7, _08014E8C
	str r0, [r4, #8]
	ldr r3, [r4, #8]
	str r7, [r4]
	subs r7, #2
	ldrh r5, [r7]
	ldr r3, _08014E70
	lsls r2, r5, #4
	orrs r2, r6
	str r3, [r4, #4]
	b _08014E00
_08014DBA:
	ldr r0, _08014E90
	ldr r7, _08014E44
	ldr r3, _08014E94
	str r0, [r7]
	ldr r5, _08014E4C
	ldr r1, _08014E98
	ldr r6, _08014E54
	ldr r0, _08014E9C
	ldr r7, _08014E5C
	str r3, [r5]
	str r1, [r6]
	str r0, [r7]
	ldr r0, _08014EA0
	bl sub_080035C8
	ldr r5, _08014EA4
	str r5, [r4]
	subs r5, #2
	ldrh r1, [r5]
	movs r6, #0x80
	lsls r5, r6, #0x18
	ldr r3, _08014E68
	lsls r2, r1, #5
	orrs r2, r5
	str r3, [r4, #4]
	ldr r7, _08014EA8
	str r2, [r4, #8]
	ldr r3, [r4, #8]
	str r7, [r4]
	subs r7, #2
	ldrh r6, [r7]
	ldr r0, _08014E70
	lsls r2, r6, #4
	orrs r2, r5
	str r0, [r4, #4]
_08014E00:
	str r2, [r4, #8]
	ldr r3, [r4, #8]
	b _08014A52
	.byte 0x00, 0x00
_08014E08:
	.4byte 0x02024108
_08014E0C:
	.4byte 0x0202411C
_08014E10:
	.4byte 0x02024130
_08014E14:
	.4byte 0x02024144
_08014E18:
	.4byte 0x02024158
_08014E1C:
	.4byte 0x02024168
_08014E20:
	.4byte 0x02024188
_08014E24:
	.4byte 0x02024178
_08014E28:
	.4byte 0x0202D74C
_08014E2C:
	.4byte 0x02024198
_08014E30:
	.4byte sub_08014EAC
_08014E34:
	.4byte gStateFunc
_08014E38:
	.4byte gUnk_080511A8
_08014E3C:
	.4byte gUnk_08051198
_08014E40:
	.4byte gUnk_0863BBE0
_08014E44:
	.4byte 0x02024104
_08014E48:
	.4byte gUnk_081C007C
_08014E4C:
	.4byte 0x020240F8
_08014E50:
	.4byte gUnk_081C01C0
_08014E54:
	.4byte 0x020240FC
_08014E58:
	.4byte gUnk_081BFFD8
_08014E5C:
	.4byte 0x02024100
_08014E60:
	.4byte gUnk_08057650
_08014E64:
	.4byte gUnk_080D1796
_08014E68:
	.4byte 0x06004000
_08014E6C:
	.4byte gUnk_080D0214
_08014E70:
	.4byte 0x06008C80
_08014E74:
	.4byte gUnk_0863BE60
_08014E78:
	.4byte gUnk_081B866C
_08014E7C:
	.4byte gUnk_081B85A8
_08014E80:
	.4byte gUnk_081B8544
_08014E84:
	.4byte gUnk_08057E50
_08014E88:
	.4byte gUnk_0806BD38
_08014E8C:
	.4byte gUnk_08068B56
_08014E90:
	.4byte gUnk_0863BD20
_08014E94:
	.4byte gUnk_081C02B8
_08014E98:
	.4byte gUnk_081C037C
_08014E9C:
	.4byte gUnk_081C0254
_08014EA0:
	.4byte gUnk_08058C50
_08014EA4:
	.4byte gUnk_080DDCDE
_08014EA8:
	.4byte gUnk_080DBD1C

	.global sub_08014EAC
	.thumb_func
	.type sub_08014EAC, %function
sub_08014EAC: @ 08014EAC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	bl sub_08003478
	ldr r7, _080151C0
	ldr r6, _080151C4
	ldr r0, [r7]
	ldr r3, [r6]
	ldr r1, _080151C8
	movs r2, #0xa0
	ldr r5, _080151CC
	bl _call_via_r5
	ldr r1, _080151D0
	ldr r4, [r1]
	ldr r0, _080151D4
	lsls r3, r4, #1
	strh r3, [r0]
	adds r0, #4
	strh r4, [r0]
	asrs r2, r4, #1
	adds r0, #4
	asrs r1, r4, #3
	strh r2, [r0]
	asrs r0, r4, #2
	asrs r2, r4, #4
	bl sub_080145D8
	bl sub_08017E1C
	ldr r5, _080151D8
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r4, #0x86
	movs r7, #0
	movs r0, #3
_08014F00:
	lsls r3, r7, #1
	adds r6, r1, #0
	asrs r6, r3
	ands r6, r0
	cmp r6, #0
	beq _08014F0E
	subs r4, #0xe
_08014F0E:
	adds r7, #1
	cmp r7, #3
	ble _08014F00
	movs r7, #0

	.global sub_08014F16
	.thumb_func
	.type sub_08014F16, %function
sub_08014F16: @ 08014F16
	adds r6, r5, #0
	adds r6, #0x26
	ldrb r2, [r6]
	lsls r1, r7, #1
	asrs r2, r1
	movs r0, #3
	ands r2, r0
	cmp r2, #1
	bne _08014F2C
	.2byte 0xF000, 0xFE60 @ bl #0x8015bec
_08014F2C:
	cmp r2, #2
	bne sub_08014F34
	.2byte 0xF000, 0xFE52 @ bl #0x8015bd8

	.global sub_08014F34
	.thumb_func
	.type sub_08014F34, %function
sub_08014F34: @ 08014F34
	adds r7, #1
	cmp r7, #3
	bgt _08014F3E
	bl _08015BD2
_08014F3E:
	ldr r4, _080151DC
	ldr r2, [r4]
	cmp r2, #0
	ble _08014F6C
	ldr r5, _080151E0
	ldr r1, [r5]
	movs r6, #0x10
	ands r1, r6
	cmp r1, #0
	beq _08014F6C
	bl sub_080192E8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x81
	movs r0, #0x78
	ldr r2, _080151E4
	bl fe_spr_plot
_08014F6C:
	ldr r1, [r4]
	cmp r1, #1
	bgt _08014FA6
	ldr r2, _080151E0
	ldr r6, [r2]
	movs r5, #0x10
	ands r6, r5
	cmp r6, #0
	beq _08014F9E
	bl sub_080192E8
	movs r6, #0x80
	adds r3, r0, #0
	lsls r1, r6, #6
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x97
	movs r0, #0x78
	ldr r2, _080151E4
	bl fe_spr_plot
	ldr r1, [r4]
_08014F9E:
	cmp r1, #1
	bne _08014FA6
	.2byte 0xF000, 0xFE0D @ bl #0x8015bc0
_08014FA6:
	ldr r6, _080151E8
	ldr r0, [r4]
	ldr r5, _080151EC
	lsls r4, r0, #2
	ldr r0, [r5, r4]
	movs r1, #0
	bl sub_080189E4
	ldr r5, _080151F0
	adds r1, r5, #0
	adds r4, r0, #0
	bl sub_08018A78
	lsrs r1, r0, #0x1f
	adds r2, r0, r1
	asrs r1, r2, #1
	movs r0, #0x7f
	movs r2, #0x78
	subs r3, r2, r1
	str r0, [sp]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r2, r6, #0
	bl sub_08018B10
	bl sub_080192E8
	movs r5, #0
	adds r3, r0, #0
	movs r1, #0x8d
	movs r0, #0x78
	ldr r2, _080151F4
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r4, _080151D8
	movs r0, #0x16
	ldrsh r3, [r4, r0]
	cmp r3, #1
	bne _08015000
	bl sub_08015AC4
_08015000:
	cmp r3, #1
	ble _08015008
	bl sub_0801597E
_08015008:
	cmp r3, #0
	bne sub_08015010
	bl sub_08015928

	.global sub_08015010
	.thumb_func
	.type sub_08015010, %function
sub_08015010: @ 08015010
	ldr r4, _080151D0
	ldr r3, [r4]
	adds r5, r3, #0
	subs r5, #0x10
	str r5, [sp, #0x10]
	cmp r3, #0x11
	bne sub_08015022
	bl sub_08015914

	.global sub_08015022
	.thumb_func
	.type sub_08015022, %function
sub_08015022: @ 08015022
	cmp r3, #0x52
	bne sub_0801502A
	bl sub_08015904

	.global sub_0801502A
	.thumb_func
	.type sub_0801502A, %function
sub_0801502A: @ 0801502A
	ldr r1, [sp, #0x10]
	cmp r1, #0xf0
	bne sub_08015034
	bl sub_080158BA

	.global sub_08015034
	.thumb_func
	.type sub_08015034, %function
sub_08015034: @ 08015034
	ldr r3, _080151D8
	movs r2, #0x16
	ldrsh r0, [r3, r2]
	cmp r0, #2
	bne _08015042
	bl sub_08015852
_08015042:
	movs r6, #0xfa
	ldr r5, _080151F8
	ldr r0, _080151FC
	lsls r1, r6, #2
	movs r6, #0
	movs r7, #0
	mov fp, r5
	mov sb, r0
	mov r8, r1
	mov sl, r6
_08015056:
	mov r3, fp
	ldr r2, [r6, r3]
	ldr r3, _08015200
	cmp r2, r3
	bgt _080150CA
	ldr r4, _080151D8
	movs r5, #0x16
	ldrsh r1, [r4, r5]
	ldr r5, _08015204
	ldr r0, [r5, r6]
	adds r5, r2, r0
	mov r0, fp
	lsls r3, r1, #2
	str r5, [r6, r0]
	ldr r1, _080151E0
	ldr r0, [r1]
	mov r2, r8
	muls r2, r0, r2
	adds r4, r3, r7
	lsls r3, r2, #0x10
	asrs r0, r3, #0x10
	ldr r1, _08015208
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r3, r2, #0x1a
	lsls r1, r3, #6
	movs r0, #0x84
	adds r2, r1, r3
	lsls r1, r0, #4
	adds r0, r2, r1
	ldr r2, _0801520C
	ldrb r1, [r2, r0]
	ldr r3, _08015210
	ldr r2, _08015214
	str r1, [sp]
	lsls r0, r4, #2
	ldr r1, [r2, r6]
	ldr r2, [r3, r0]
	movs r4, #0x38
	adds r0, r2, #0
	muls r0, r4, r0
	adds r3, r0, #0
	mov r4, sb
	adds r3, #8
	adds r0, #0xc
	ldr r2, [r4, r3]
	ldr r3, [r4, r0]
	mov r0, sl
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r4, r0, #5
	str r4, [sp, #8]
	adds r0, r5, #0
	mov r4, sl
	str r4, [sp, #0xc]
	bl fe_spr_plot
_080150CA:
	movs r2, #0x10
	adds r7, #1
	add r8, r2
	adds r6, #4
	cmp r7, #3
	ble _08015056

	.global sub_080150D6
	.thumb_func
	.type sub_080150D6, %function
sub_080150D6: @ 080150D6
	ldr r0, [sp, #0x10]
	subs r0, #1
	cmp r0, #0x76
	bhi _0801514A
	ldr r3, [sp, #0x10]
	ldr r0, _08015218
	lsls r2, r3, #1
	ldrh r4, [r0, r2]
	ldr r5, _0801521C
	ldr r1, _08015220
	str r4, [r5]
	ldr r4, _08015224
	ldrh r0, [r1, r2]
	ldr r3, _08015228
	str r0, [r4]
	ldr r0, _0801522C
	ldrh r1, [r3, r2]
	ldr r3, _08015230
	str r1, [r0]
	ldr r1, _08015234
	ldrh r3, [r3, r2]
	str r3, [r1]
	ldr r3, _08015238
	ldrh r3, [r3, r2]
	str r3, [r5, #4]
	ldr r3, _0801523C
	ldrh r3, [r3, r2]
	str r3, [r4, #4]
	ldr r3, _08015240
	ldrh r3, [r3, r2]
	str r3, [r0, #4]
	ldr r3, _08015244
	ldrh r3, [r3, r2]
	str r3, [r1, #4]
	ldr r3, _08015248
	ldrh r3, [r3, r2]
	str r3, [r5, #8]
	ldr r3, _0801524C
	ldrh r3, [r3, r2]
	str r3, [r4, #8]
	ldr r3, _08015250
	ldrh r3, [r3, r2]
	str r3, [r0, #8]
	ldr r3, _08015254
	ldrh r0, [r3, r2]
	str r0, [r1, #8]
	ldr r1, _08015258
	ldrh r0, [r1, r2]
	ldr r1, _0801525C
	str r0, [r5, #0xc]
	ldrh r0, [r1, r2]
	ldr r1, _08015260
	str r0, [r4, #0xc]
	ldrh r0, [r1, r2]
	ldr r1, _08015264
	str r0, [r5, #0x10]
	ldrh r5, [r1, r2]
	str r5, [r4, #0x10]
_0801514A:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	bgt _08015152
	b _08015814
_08015152:
	ldr r3, _0801522C
	movs r7, #1
	rsbs r2, r7, #0
	movs r0, #0x80
	ldr r1, [r3]
	mov r8, r2
	lsls r5, r0, #1
	mov r6, r8
	mov r7, r8
	mov ip, r3
	cmp r1, r5
	bne _0801516C
	b _08015846
_0801516C:
	ldr r4, _08015268
	ldr r5, _0801526C
	lsls r3, r1, #2
	ldr r3, [r4, r3]
	ldr r7, [r5]
	ldr r2, _08015270
	lsls r0, r7, #5
	lsrs r1, r3, #0x10
	strh r1, [r0, r2]
	adds r3, r2, #0
	ldr r1, _080151BC
	adds r3, #8
	strh r1, [r0, r3]
	adds r3, #8
	adds r3, r0, r3
	strh r1, [r3]
	ldr r3, _08015234
	ldr r1, [r3]
	lsls r3, r1, #2
	ldr r1, [r4, r3]
	adds r2, #0x18
	lsrs r4, r1, #0x10
	adds r1, r7, #1
	strh r4, [r0, r2]
	str r1, [r5]
_0801519E:
	mov r5, ip
	ldr r1, [r5, #4]
	movs r5, #0x80
	lsls r3, r5, #1
	cmp r1, r3
	bne _080151AC
	b _0801583A
_080151AC:
	ldr r4, _08015268
	ldr r5, _0801526C
	lsls r3, r1, #2
	ldr r3, [r4, r3]
	ldr r6, [r5]
	ldr r2, _08015270
	lsls r0, r6, #5
	b _08015274
_080151BC:
	.4byte 0x00000000
_080151C0:
	.4byte 0x02024104
_080151C4:
	.4byte 0x0201BAEC
_080151C8:
	.4byte 0x02023FA4
_080151CC:
	.4byte sub_03003BB8
_080151D0:
	.4byte 0x020240F0
_080151D4:
	.4byte 0x04000010
_080151D8:
	.4byte 0x0202D74C
_080151DC:
	.4byte 0x020240E4
_080151E0:
	.4byte 0x03005660
_080151E4:
	.4byte gUnk_08294DF0
_080151E8:
	.4byte gUnk_0863FD80
_080151EC:
	.4byte gUnk_0884E3A0
_080151F0:
	.4byte gUnk_0863FDE8
_080151F4:
	.4byte gUnk_082961F0
_080151F8:
	.4byte 0x02024198
_080151FC:
	.4byte gUnk_080511B4
_08015200:
	.4byte 0x0000012B
_08015204:
	.4byte 0x020241A8
_08015208:
	.4byte sub_03000138
_0801520C:
	.4byte gUnk_08715A68
_08015210:
	.4byte gUnk_080513AC
_08015214:
	.4byte 0x020241B8
_08015218:
	.4byte gUnk_086535B0
_0801521C:
	.4byte 0x02024108
_08015220:
	.4byte gUnk_086536A0
_08015224:
	.4byte 0x0202411C
_08015228:
	.4byte gUnk_08653880
_0801522C:
	.4byte 0x02024130
_08015230:
	.4byte gUnk_08653970
_08015234:
	.4byte 0x02024144
_08015238:
	.4byte gUnk_08653A60
_0801523C:
	.4byte gUnk_08653B50
_08015240:
	.4byte gUnk_08653D30
_08015244:
	.4byte gUnk_08653E20
_08015248:
	.4byte gUnk_08654000
_0801524C:
	.4byte gUnk_08653F10
_08015250:
	.4byte gUnk_086541E0
_08015254:
	.4byte gUnk_086542D0
_08015258:
	.4byte gUnk_086543C0
_0801525C:
	.4byte gUnk_086544B0
_08015260:
	.4byte gUnk_08654870
_08015264:
	.4byte gUnk_08654960
_08015268:
	.4byte gUnk_0803F49C
_0801526C:
	.4byte 0x02024390
_08015270:
	.4byte 0x0200000E
_08015274:
	lsrs r1, r3, #0x10
	strh r1, [r0, r2]
	adds r3, r2, #0
	ldr r1, _080152B4
	adds r3, #8
	strh r1, [r0, r3]
	adds r3, #8
	adds r3, r0, r3
	strh r1, [r3]
	ldr r1, _080152B8
	ldr r3, [r1, #4]
	lsls r1, r3, #2
	ldr r3, [r4, r1]
	adds r2, #0x18
	lsrs r1, r3, #0x10
	adds r4, r6, #1
	strh r1, [r0, r2]
	str r4, [r5]
_08015298:
	mov r2, ip
	movs r0, #0x80
	ldr r1, [r2, #8]
	lsls r5, r0, #1
	cmp r1, r5
	bne _080152A6
	b _0801582E
_080152A6:
	ldr r5, _080152BC
	ldr r4, [r5]
	lsls r0, r4, #5
	mov r8, r4
	ldr r4, _080152C0
	lsls r3, r1, #2
	b _080152C4
_080152B4:
	.4byte 0x00000000
_080152B8:
	.4byte 0x02024144
_080152BC:
	.4byte 0x02024390
_080152C0:
	.4byte gUnk_0803F49C
_080152C4:
	ldr r3, [r4, r3]
	ldr r2, _08015308
	lsrs r1, r3, #0x10
	strh r1, [r0, r2]
	adds r3, r2, #0
	ldr r1, _08015304
	adds r3, #8
	strh r1, [r0, r3]
	adds r3, #8
	adds r3, r0, r3
	strh r1, [r3]
	ldr r1, _0801530C
	ldr r3, [r1, #8]
	lsls r1, r3, #2
	ldr r3, [r4, r1]
	lsrs r1, r3, #0x10
	mov r3, r8
	adds r2, #0x18
	adds r3, #1
	strh r1, [r0, r2]
	str r3, [r5]
_080152EE:
	ldr r5, _08015310
	movs r0, #0x16
	ldrsh r2, [r5, r0]
	cmp r2, #1
	bne _080152FA
	b _0801574C
_080152FA:
	cmp r2, #1
	ble _08015300
	b _08015678
_08015300:
	b _08015314
	.byte 0x00, 0x00
_08015304:
	.4byte 0x00000000
_08015308:
	.4byte 0x0200000E
_0801530C:
	.4byte 0x02024144
_08015310:
	.4byte 0x0202D74C
_08015314:
	cmp r2, #0
	bne _0801531A
	b _08015554
_0801531A:
	movs r4, #0x16
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bne _08015324
	b _080154FC
_08015324:
	ldr r5, _08015624
	ldr r3, [r5]
	cmp r3, #1
	bne _0801532E
	b _0801542C
_0801532E:
	cmp r3, #1
	bgt _080153B2
	cmp r3, #0
	beq _0801539E
_08015336:
	ldr r4, _08015628
	ldr r5, [r4]
	adds r5, #1
	str r5, [r4]
	ldr r4, _0801562C
	movs r2, #0x80
	ldr r1, [r4]
	lsls r5, r2, #3
	adds r0, r5, #0
	bics r0, r1
	cmp r0, #0
	beq _0801538C
	bl sub_0801DACC
	cmp r0, #0
	beq _0801538C
	ldr r2, [r4]
	orrs r2, r5
	str r2, [r4]
	bl sub_080035F8
	ldr r1, _08015624
	movs r3, #2
	str r3, [r1]
	ldr r2, _08015630
	ldr r0, [r2]
	cmp r0, #1
	beq _0801537E
	movs r0, #1
	movs r4, #0x80
	str r0, [r2]
	movs r1, #0x7f
	movs r0, #0xbd
	lsls r2, r4, #9
	bl sub_0802F11E
_0801537E:
	ldr r4, _08015634
	adds r0, r4, #0
	bl sub_08000BDC
	adds r0, r4, #0
	bl sub_08000BFC
_0801538C:
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801539E:
	ldr r2, _0801562C
	movs r0, #0x80
	ldr r4, [r2]
	lsls r1, r0, #4
	ands r4, r1
	cmp r4, #0
	beq _08015336
	movs r4, #1
	str r4, [r5]
	b _08015336
_080153B2:
	cmp r3, #2
	beq _080153DE
	cmp r3, #3
	bne _08015336
	ldr r2, _08015638
	ldr r3, [r2]
	cmp r3, #0
	ble _080153C8
	subs r3, #1
	str r3, [r2]
	b _08015336
_080153C8:
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl sub_0802F11E
	bl sub_0801DF74
	movs r1, #1
	str r1, [r5]
	b _08015336
_080153DE:
	ldr r2, _0801562C
	movs r4, #0x80
	ldr r1, [r2]
	lsls r5, r4, #4
	ands r1, r5
	cmp r1, #0
	beq _08015336
	ldr r5, _08015634
	adds r0, r5, #0
	bl sub_08000BDC
	adds r0, r5, #0
	bl sub_08000BFC
	bl sub_0802F04C
	ldr r0, _08015630
	ldr r3, [r0]
	cmp r3, #1
	beq _08015424
	cmp r3, #1
	bgt _08015416
	cmp r3, #0
	bne _08015336
	movs r0, #0
	bl sub_0801E5A4
	b _08015336
_08015416:
	cmp r3, #2
	beq _0801541C
	b _08015336
_0801541C:
	movs r0, #2
	bl sub_0801E5A4
	b _08015336
_08015424:
	movs r0, #1
	bl sub_0801E5A4
	b _08015336
_0801542C:
	ldr r1, _0801563C
	ldrh r2, [r1]
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08015486
	ldr r4, _08015630
	ldr r1, [r4]
	cmp r1, #1
	beq _08015470
_08015440:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xcb
	movs r1, #0x7f
	bl sub_0802F11E
	ldr r2, [r4]
	cmp r2, #1
	beq _08015460
	bl sub_0801DEE8
	bl sub_080035F8
	movs r2, #2
	str r2, [r5]
	b _08015336
_08015460:
	bl sub_0801DEF4
	ldr r0, _08015638
	movs r1, #0x1e
	movs r4, #3
	str r1, [r0]
	str r4, [r5]
	b _08015336
_08015470:
	bl sub_0801DF44
	cmp r0, #0
	bne _08015440
	movs r5, #0x80
	movs r1, #0x7f
	lsls r2, r5, #9
	movs r0, #0xcc
	bl sub_0802F11E
	b _08015336
_08015486:
	movs r4, #0x40
	ands r4, r2
	cmp r4, #0
	beq _080154AA
	ldr r4, _08015630
	ldr r0, [r4]
	cmp r0, #0
	ble _080154AA
	movs r3, #0x80
	movs r1, #0x7f
	movs r0, #0xbd
	lsls r2, r3, #9
	bl sub_0802F11E
	ldr r1, [r4]
	subs r1, #1
	str r1, [r4]
	b _08015336
_080154AA:
	ldrh r4, [r1]
	movs r5, #0x80
	ands r5, r4
	cmp r5, #0
	beq _080154D0
	ldr r4, _08015630
	ldr r2, [r4]
	cmp r2, #1
	bgt _080154D0
	movs r3, #0x80
	movs r0, #0xbd
	movs r1, #0x7f
	lsls r2, r3, #9
	bl sub_0802F11E
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	b _08015336
_080154D0:
	ldrh r5, [r1]
	movs r1, #4
	ands r1, r5
	cmp r1, #0
	bne _080154DC
	b _08015336
_080154DC:
	movs r4, #0x80
	lsls r2, r4, #9
	movs r0, #0xbd
	movs r1, #0x7f
	bl sub_0802F11E
	ldr r2, _08015630
	ldr r3, [r2]
	cmp r3, #1
	bgt _080154F6
	adds r3, #1
	str r3, [r2]
	b _08015336
_080154F6:
	movs r0, #0
	str r0, [r2]
	b _08015336
_080154FC:
	ldr r5, _08015640
	ldr r6, _08015644
	mov r8, r5
	movs r7, #0
	movs r4, #0
	movs r5, #0
_08015508:
	mov r0, r8
	ldrsh r2, [r4, r0]
	ldr r0, _08015628
	movs r3, #0xb3
	ldr r1, [r0]
	lsls r0, r3, #2
	muls r0, r1, r0
	asrs r1, r0, #8
	ldr r0, _08015648
	subs r2, r2, r1
	ands r2, r0
	movs r3, #0x97
	adds r0, r2, #0
	lsls r1, r3, #1
	subs r2, #0x21
	subs r0, #0x40
	cmp r2, r1
	bhi _0801554A
	mov r2, r8
	adds r1, r4, #2
	ldrsh r1, [r2, r1]
	ldr r3, _0801564C
	ldr r2, [r3, r4]
	lsls r3, r2, #4
	ldr r2, [r6, r3]
	adds r3, #4
	ldr r3, [r6, r3]
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_0801554A:
	adds r7, #1
	adds r4, #4
	cmp r7, #5
	bls _08015508
	b _08015324
_08015554:
	ldr r1, _08015650
	ldr r5, _08015654
	movs r4, #1
	ldr r0, [r1, #4]
	ldr r1, [r5, #4]
	rsbs r5, r4, #0
	str r2, [sp]
	cmp r6, r5
	beq _0801556A
	movs r4, #0x80
	lsls r2, r4, #1
_0801556A:
	str r2, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r6, r3
	beq _0801561E
	lsls r2, r6, #9
	str r2, [sp, #8]
_08015578:
	movs r4, #0
	ldr r2, _08015658
	ldr r3, _0801565C
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, _08015650
	ldr r5, _08015654
	movs r2, #1
	rsbs r3, r2, #0
	ldr r0, [r1]
	ldr r1, [r5]
	str r4, [sp]
	cmp r7, r3
	beq _0801559A
	movs r2, #0x80
	lsls r4, r2, #1
_0801559A:
	str r4, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r7, r3
	beq _08015618
	lsls r4, r7, #9
	str r4, [sp, #8]
_080155A8:
	movs r4, #0
	ldr r2, _08015660
	ldr r3, _08015664
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r5, #1
	ldr r1, _08015650
	ldr r7, _08015654
	rsbs r2, r5, #0
	ldr r0, [r1, #8]
	ldr r1, [r7, #8]
	str r4, [sp]
	cmp r8, r2
	beq _080155CA
	movs r2, #0x80
	lsls r4, r2, #1
_080155CA:
	str r4, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r8, r3
	beq _08015612
	mov r5, r8
	lsls r7, r5, #9
	str r7, [sp, #8]
_080155DA:
	movs r4, #0
	ldr r2, _08015668
	ldr r3, _0801566C
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r5, _08015654
	ldr r7, _08015650
	ldr r2, _08015670
	ldr r3, _08015674
	ldr r1, [r5, #0xc]
	ldr r0, [r7, #0xc]
	mov r8, r2
	mov sl, r3
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, [r5, #0x10]
	movs r5, #0x80
	lsls r2, r5, #5
	ldr r0, [r7, #0x10]
	mov r3, sl
	str r2, [sp, #8]
	mov r2, r8
	b _0801580A
_08015612:
	movs r4, #0
	str r4, [sp, #8]
	b _080155DA
_08015618:
	movs r7, #0
	str r7, [sp, #8]
	b _080155A8
_0801561E:
	movs r4, #0
	str r4, [sp, #8]
	b _08015578
_08015624:
	.4byte 0x020240E8
_08015628:
	.4byte 0x020240F0
_0801562C:
	.4byte 0x0300566C
_08015630:
	.4byte 0x020240E4
_08015634:
	.4byte 0x00001105
_08015638:
	.4byte 0x020240F4
_0801563C:
	.4byte 0x0300565E
_08015640:
	.4byte gUnk_08051124
_08015644:
	.4byte gUnk_08713650
_08015648:
	.4byte 0x000003FF
_0801564C:
	.4byte gUnk_0805113C
_08015650:
	.4byte 0x02024108
_08015654:
	.4byte 0x0202411C
_08015658:
	.4byte gUnk_085C6190
_0801565C:
	.4byte gUnk_0863F960
_08015660:
	.4byte gUnk_085C57E0
_08015664:
	.4byte gUnk_0863F940
_08015668:
	.4byte gUnk_085C8760
_0801566C:
	.4byte gUnk_0863F9E0
_08015670:
	.4byte gUnk_085C8EA0
_08015674:
	.4byte gUnk_0863FA00
_08015678:
	cmp r2, #2
	beq _0801567E
	b _0801531A
_0801567E:
	ldr r1, _080159F4
	ldr r4, _080159F8
	movs r2, #1
	movs r3, #0
	rsbs r5, r2, #0
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	str r3, [sp]
	cmp r6, r5
	beq _08015748
	movs r2, #0x80
	lsls r5, r2, #1
	str r5, [sp, #4]
_08015698:
	movs r4, #1
	rsbs r3, r4, #0
	cmp r6, r3
	beq _08015742
	lsls r5, r6, #9
	str r5, [sp, #8]
_080156A4:
	movs r4, #0
	ldr r2, _080159FC
	ldr r3, _08015A00
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r5, #1
	ldr r1, _080159F4
	ldr r2, _080159F8
	rsbs r3, r5, #0
	ldr r0, [r1]
	ldr r1, [r2]
	str r4, [sp]
	cmp r7, r3
	beq _080156C6
	movs r5, #0x80
	lsls r4, r5, #1
_080156C6:
	str r4, [sp, #4]
	movs r4, #1
	rsbs r2, r4, #0
	cmp r7, r2
	beq _0801573C
	lsls r5, r7, #9
	str r5, [sp, #8]
_080156D4:
	movs r4, #0
	ldr r2, _08015A04
	ldr r3, _08015A08
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, _080159F4
	ldr r5, _080159F8
	movs r2, #1
	rsbs r3, r2, #0
	ldr r0, [r1, #8]
	ldr r1, [r5, #8]
	str r4, [sp]
	cmp r8, r3
	beq _080156F6
	movs r7, #0x80
	lsls r4, r7, #1
_080156F6:
	str r4, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r8, r3
	beq _08015736
	mov r4, r8
	lsls r2, r4, #9
	str r2, [sp, #8]
_08015706:
	movs r4, #0
	ldr r2, _08015A0C
	ldr r3, _08015A10
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r5, _080159F8
	ldr r7, _080159F4
	ldr r2, _08015A14
	ldr r3, _08015A18
	ldr r1, [r5, #0xc]
	ldr r0, [r7, #0xc]
	mov r8, r2
	mov sl, r3
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r2, #0x80
	ldr r1, [r5, #0x10]
	ldr r0, [r7, #0x10]
	b _08015802
_08015736:
	movs r4, #0
	str r4, [sp, #8]
	b _08015706
_0801573C:
	movs r7, #0
	str r7, [sp, #8]
	b _080156D4
_08015742:
	movs r2, #0
	str r2, [sp, #8]
	b _080156A4
_08015748:
	str r3, [sp, #4]
	b _08015698
_0801574C:
	ldr r1, _080159F4
	ldr r4, _080159F8
	movs r5, #1
	movs r3, #0
	rsbs r2, r5, #0
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	str r3, [sp]
	cmp r6, r2
	beq _0801582A
	movs r5, #0x80
	lsls r2, r5, #1
	str r2, [sp, #4]
_08015766:
	movs r4, #1
	rsbs r3, r4, #0
	cmp r6, r3
	beq _08015824
	lsls r2, r6, #9
	str r2, [sp, #8]
_08015772:
	movs r4, #0
	ldr r2, _08015A1C
	ldr r3, _08015A20
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r5, #1
	ldr r1, _080159F4
	ldr r2, _080159F8
	rsbs r3, r5, #0
	ldr r0, [r1]
	ldr r1, [r2]
	str r4, [sp]
	cmp r7, r3
	beq _08015794
	movs r5, #0x80
	lsls r4, r5, #1
_08015794:
	str r4, [sp, #4]
	movs r4, #1
	rsbs r2, r4, #0
	cmp r7, r2
	beq _0801581E
	lsls r5, r7, #9
	str r5, [sp, #8]
_080157A2:
	movs r4, #0
	ldr r2, _08015A24
	ldr r3, _08015A28
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r1, _080159F4
	ldr r5, _080159F8
	movs r2, #1
	rsbs r3, r2, #0
	ldr r0, [r1, #8]
	ldr r1, [r5, #8]
	str r4, [sp]
	cmp r8, r3
	beq _080157C4
	movs r7, #0x80
	lsls r4, r7, #1
_080157C4:
	str r4, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r8, r3
	beq _08015818
	mov r4, r8
	lsls r2, r4, #9
	str r2, [sp, #8]
_080157D4:
	movs r4, #0
	ldr r2, _08015A2C
	ldr r3, _08015A30
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r5, _080159F8
	ldr r7, _080159F4
	ldr r2, _08015A34
	ldr r3, _08015A38
	ldr r1, [r5, #0x10]
	ldr r0, [r7, #0x10]
	mov r8, r2
	mov sl, r3
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	movs r2, #0x80
	ldr r1, [r5, #0xc]
	ldr r0, [r7, #0xc]
_08015802:
	lsls r5, r2, #5
	mov r3, sl
	mov r2, r8
	str r5, [sp, #8]
_0801580A:
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_08015814:
	ldr r5, _08015A3C
	b _0801531A
_08015818:
	movs r4, #0
	str r4, [sp, #8]
	b _080157D4
_0801581E:
	movs r7, #0
	str r7, [sp, #8]
	b _080157A2
_08015824:
	movs r5, #0
	str r5, [sp, #8]
	b _08015772
_0801582A:
	str r3, [sp, #4]
	b _08015766
_0801582E:
	ldr r4, _08015A40
	ldr r2, [r4, #8]
	cmp r2, r1
	beq _08015838
	b _080152A6
_08015838:
	b _080152EE
_0801583A:
	ldr r2, _08015A40
	ldr r0, [r2, #4]
	cmp r0, r1
	beq _08015844
	b _080151AC
_08015844:
	b _08015298
_08015846:
	ldr r2, _08015A40
	ldr r4, [r2]
	cmp r4, r1
	beq _08015850
	b _0801516C
_08015850:
	b _0801519E

	.global sub_08015852
	.thumb_func
	.type sub_08015852, %function
sub_08015852: @ 08015852
	ldr r1, _08015A44
	movs r4, #0x96
	ldr r2, [r1]
	lsls r5, r4, #1
	cmp r2, r5
	blt _08015860
	b sub_080150D6
_08015860:
	ldr r5, _08015A48
	ldr r0, [r5]
	adds r5, r2, r0
	str r5, [r1]
	ldr r2, _08015A4C
	ldr r0, _08015A50
	ldr r4, [r2]
	adds r1, r4, #0
	muls r1, r0, r1
	lsls r4, r1, #0x10
	asrs r0, r4, #0x10
	ldr r1, _08015A54
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r3, r2, #0x1a
	lsls r4, r3, #6
	movs r1, #0x84
	adds r2, r4, r3
	lsls r0, r1, #4
	ldr r4, _08015A58
	adds r1, r2, r0
	ldrb r0, [r4, r1]
	ldr r4, _08015A5C
	ldr r3, _08015A60
	movs r2, #0xe4
	ldr r1, [r4]
	lsls r4, r2, #1
	adds r2, r3, r4
	str r0, [sp]
	adds r4, #4
	movs r0, #0x80
	adds r3, r3, r4
	lsls r0, r0, #5
	movs r4, #0
	str r0, [sp, #8]
	ldr r2, [r2]
	ldr r3, [r3]
	adds r0, r5, #0
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	bl sub_080150D6

	.global sub_080158BA
	.thumb_func
	.type sub_080158BA, %function
sub_080158BA: @ 080158BA
	ldr r0, _08015A44
	ldr r6, _08015A5C
	ldr r5, _08015A48
	movs r7, #0
	mov r8, r0
	movs r4, #0
_080158C6:
	bl sub_08000B14
	lsrs r1, r0, #0xa
	rsbs r3, r1, #0
	subs r3, #0x20
	mov r1, r8
	str r3, [r4, r1]
	bl sub_08000B14
	lsls r3, r7, #5
	lsrs r2, r0, #0xc
	adds r1, r2, r3
	adds r1, #0x20
	str r1, [r4, r6]
	bl sub_08000B14
	lsrs r2, r0, #0xe
	adds r2, #4
	adds r7, #1
	str r2, [r4, r5]
	adds r4, #4
	cmp r7, #3
	ble _080158C6
	movs r4, #0x80
	movs r0, #0xff
	movs r1, #0x7f
	lsls r2, r4, #9
	bl sub_0802F11E
	bl sub_08015034

	.global sub_08015904
	.thumb_func
	.type sub_08015904, %function
sub_08015904: @ 08015904
	movs r5, #0x80
	movs r0, #0xee
	movs r1, #0x7f
	lsls r2, r5, #9
	bl sub_0802F11E
	bl sub_0801502A

	.global sub_08015914
	.thumb_func
	.type sub_08015914, %function
sub_08015914: @ 08015914
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xed
	movs r1, #0xbc
	bl sub_0802F11E
	ldr r0, _08015A64
	ldr r3, [r0]
	bl sub_08015022

	.global sub_08015928
	.thumb_func
	.type sub_08015928, %function
sub_08015928: @ 08015928
	ldr r1, _08015A68
	ldr r6, _08015A6C
	movs r7, #0
	mov r8, r1
	movs r4, #0
	movs r5, #0
_08015934:
	mov r2, r8
	ldrsh r3, [r4, r2]
	ldr r0, _08015A64
	ldr r2, [r0]
	lsls r0, r2, #0xa
	asrs r1, r0, #8
	ldr r0, _08015A70
	subs r3, r3, r1
	ands r3, r0
	movs r2, #0x97
	adds r0, r3, #0
	lsls r1, r2, #1
	subs r3, #1
	subs r0, #0x20
	cmp r3, r1
	bhi _08015972
	mov r3, r8
	adds r1, r4, #2
	ldrsh r1, [r3, r1]
	ldr r3, _08015A74
	ldr r2, [r3, r4]
	lsls r3, r2, #4
	ldr r2, [r6, r3]
	adds r3, #4
	ldr r3, [r6, r3]
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_08015972:
	adds r7, #1
	adds r4, #4
	cmp r7, #6
	bls _08015934
	bl sub_08015010

	.global sub_0801597E
	.thumb_func
	.type sub_0801597E, %function
sub_0801597E: @ 0801597E
	cmp r3, #2
	beq _08015986
	bl sub_08015010
_08015986:
	ldr r5, _08015A78
	ldr r3, [r5]
	cmp r3, #0
	ble _08015996
	subs r3, #1
	str r3, [r5]
	bl sub_08015010
_08015996:
	ldr r6, _08015A7C
	ldr r4, [r6]
	cmp r4, #0x13
	bgt _08015A88
	ldr r1, _08015A80
	ldr r5, _08015A84
	ldr r3, _08015A6C
	movs r2, #0xd4
	ldr r0, [r1]
	ldr r1, [r5]
	lsls r5, r2, #3
	adds r2, r3, r5
	adds r5, #4
	adds r3, r3, r5
	ldr r3, [r3]
	ldr r2, [r2]
	movs r5, #0
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r4, _08015A64
	ldr r5, [r4]
	movs r3, #3
	ands r5, r3
	cmp r5, #0
	beq _080159D4
	bl sub_08015010
_080159D4:
	ldr r3, [r6]
	cmp r3, #0
	beq _080159E2
_080159DA:
	adds r3, #1
	str r3, [r6]
	bl sub_08015010
_080159E2:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xa5
	movs r1, #0x7f
	bl sub_0802F11E
	ldr r3, [r6]
	b _080159DA
	.byte 0x00, 0x00
_080159F4:
	.4byte 0x02024108
_080159F8:
	.4byte 0x0202411C
_080159FC:
	.4byte gUnk_085C39C0
_08015A00:
	.4byte gUnk_0863F8E0
_08015A04:
	.4byte gUnk_085C2F60
_08015A08:
	.4byte gUnk_0863F8C0
_08015A0C:
	.4byte gUnk_085C41D0
_08015A10:
	.4byte gUnk_0863F900
_08015A14:
	.4byte gUnk_085C4D80
_08015A18:
	.4byte gUnk_0863F920
_08015A1C:
	.4byte gUnk_085C7520
_08015A20:
	.4byte gUnk_0863F9A0
_08015A24:
	.4byte gUnk_085C6AB0
_08015A28:
	.4byte gUnk_0863F980
_08015A2C:
	.4byte gUnk_085C8760
_08015A30:
	.4byte gUnk_0863F9E0
_08015A34:
	.4byte gUnk_085C7F30
_08015A38:
	.4byte gUnk_0863F9C0
_08015A3C:
	.4byte 0x0202D74C
_08015A40:
	.4byte 0x02024144
_08015A44:
	.4byte 0x02024198
_08015A48:
	.4byte 0x020241A8
_08015A4C:
	.4byte 0x03005660
_08015A50:
	.4byte 0x00000534
_08015A54:
	.4byte sub_03000138
_08015A58:
	.4byte gUnk_08715A68
_08015A5C:
	.4byte 0x020241B8
_08015A60:
	.4byte gUnk_080511B4
_08015A64:
	.4byte 0x020240F0
_08015A68:
	.4byte gUnk_08051154
_08015A6C:
	.4byte gUnk_08713650
_08015A70:
	.4byte 0x000003FF
_08015A74:
	.4byte gUnk_08051170
_08015A78:
	.4byte 0x02024188
_08015A7C:
	.4byte 0x02024178
_08015A80:
	.4byte 0x02024158
_08015A84:
	.4byte 0x02024168
_08015A88:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xa6
	bl sub_0802F11E
	bl sub_08000B14
	movs r2, #0xf0
	muls r2, r0, r2
	ldr r0, _08015C08
	lsrs r1, r2, #0x10
	str r1, [r0]
	bl sub_08000B14
	movs r4, #0xa
	muls r4, r0, r4
	ldr r1, _08015C0C
	lsrs r2, r4, #0x10
	adds r2, #0xa0
	movs r0, #0
	str r2, [r1]
	str r0, [r6]
	bl sub_08000B14
	lsrs r4, r0, #8
	adds r4, #0x14
	str r4, [r5]
	bl sub_08015010

	.global sub_08015AC4
	.thumb_func
	.type sub_08015AC4, %function
sub_08015AC4: @ 08015AC4
	ldr r3, _08015C10
	ldr r4, _08015C0C
	movs r5, #0
	movs r7, #0
	mov sb, r3
	mov fp, r4
	mov sl, r5
_08015AD2:
	mov r0, sb
	ldr r3, [r5, r0]
	mov r8, r5
	cmp r3, #0
	ble _08015AEC
	subs r3, #1
	str r3, [r0, r5]
_08015AE0:
	adds r7, #1
	adds r5, #4
	cmp r7, #1
	ble _08015AD2
	bl sub_08015010
_08015AEC:
	ldr r6, _08015C14
	ldr r4, [r6, r5]
	cmp r4, #0x10
	bgt _08015B92
	movs r1, #1
	ands r1, r7
	cmp r1, #0
	beq _08015B8E
	movs r3, #0x5b
_08015AFE:
	ldr r4, _08015C08
	ldr r0, [r5, r4]
	ldr r4, _08015C18
	mov r2, fp
	lsls r3, r3, #4
	ldr r1, [r5, r2]
	ldr r2, [r4, r3]
	adds r3, #4
	ldr r3, [r4, r3]
	ldr r4, [r6, r5]
	str r4, [sp]
	mov r4, sl
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, _08015C1C
	ldr r4, [r2]
	movs r3, #3
	ands r4, r3
	cmp r4, #0
	bne _08015AE0
	mov r1, r8
	ldr r0, [r6, r1]
	cmp r0, #0
	beq _08015B3E
_08015B34:
	ldr r1, _08015C14
	ldr r0, [r1, r5]
	adds r0, #1
	str r0, [r1, r5]
	b _08015AE0
_08015B3E:
	bl sub_08000B14
	lsrs r0, r0, #0xe
	cmp r0, #0
	beq _08015B78
	cmp r0, #1
	beq _08015B62
	bl sub_08000B14
	adds r2, r0, #0
	lsrs r1, r2, #0xa
	movs r4, #0x80
	adds r1, #0x40
	movs r0, #0xa3
	lsls r2, r4, #9
	bl sub_0802F11E
	b _08015B34
_08015B62:
	bl sub_08000B14
	adds r3, r0, #0
	lsrs r1, r3, #0xa
	movs r4, #0x80
	adds r1, #0x40
	lsls r2, r4, #9
	movs r0, #0xa2
	bl sub_0802F11E
	b _08015B34
_08015B78:
	bl sub_08000B14
	adds r2, r0, #0
	lsrs r1, r2, #0xa
	movs r3, #0x80
	adds r1, #0x40
	lsls r2, r3, #9
	movs r0, #0xa1
	bl sub_0802F11E
	b _08015B34
_08015B8E:
	movs r3, #0x5c
	b _08015AFE
_08015B92:
	bl sub_08000B14
	movs r2, #0xf0
	muls r2, r0, r2
	ldr r1, _08015C08
	lsrs r0, r2, #0x10
	str r0, [r1, r5]
	bl sub_08000B14
	movs r4, #0x14
	muls r4, r0, r4
	lsrs r2, r4, #0x10
	adds r2, #0xa0
	mov r0, sl
	mov r4, fp
	str r2, [r4, r5]
	str r0, [r6, r5]
	bl sub_08000B14
	mov r1, sb
	lsrs r3, r0, #0xa
	str r3, [r1, r5]
	b _08015AE0
	.byte 0x08, 0xF0, 0xC0, 0xF9, 0x00, 0x28, 0x01, 0xD0, 0xFF, 0xF7, 0xED, 0xF9, 0x14, 0x4E, 0xFF, 0xF7
	.byte 0xEB, 0xF9
_08015BD2:
	ldr r5, _08015C24
	bl sub_08014F16
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _08015C28
	adds r0, r4, #0
	ldr r3, _08015C2C
	movs r1, #4
	b _08015BFE
	.byte 0x00, 0x25, 0x20, 0x1C, 0x0F, 0x4A, 0x10, 0x4B, 0x04, 0x21, 0x00, 0x95, 0x01, 0x95, 0x02, 0x95
	.byte 0x03, 0x95
_08015BFE:
	bl fe_spr_plot
	adds r4, #0x1c
	bl sub_08014F34
_08015C08:
	.4byte 0x02024158
_08015C0C:
	.4byte 0x02024168
_08015C10:
	.4byte 0x02024188
_08015C14:
	.4byte 0x02024178
_08015C18:
	.4byte gUnk_08713650
_08015C1C:
	.4byte 0x020240F0
	.4byte gUnk_0863EE20
_08015C24:
	.4byte 0x0202D74C
_08015C28:
	.4byte gUnk_0862C220
_08015C2C:
	.4byte gUnk_0863FCA0
	.4byte gUnk_0862BFF0
	.4byte gUnk_0863FC80

	.global sub_08015C38
	.thumb_func
	.type sub_08015C38, %function
sub_08015C38: @ 08015C38
	push {lr}
	bl sub_0800041C
	ldr r0, _08015C50
	movs r2, #0xa0
	ldrh r1, [r0]
	lsls r0, r2, #0x13
	strh r1, [r0]
	bl sub_08000444
	pop {r0}
	bx r0
_08015C50:
	.4byte 0x02023FA4

	.global sub_08015C54
	.thumb_func
	.type sub_08015C54, %function
sub_08015C54: @ 08015C54
	push {lr}
	ldr r0, _08015C74
	ldrh r1, [r0]
	adds r1, #1
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bhi _08015C70
	ldr r3, _08015C78
	lsls r1, r2, #1
	ldrh r0, [r3, r1]
	movs r3, #0xa0
	lsls r1, r3, #0x13
	strh r0, [r1]
_08015C70:
	pop {r0}
	bx r0
_08015C74:
	.4byte 0x04000006
_08015C78:
	.4byte 0x02023FA4

	.global sub_08015C7C
	.thumb_func
	.type sub_08015C7C, %function
sub_08015C7C: @ 08015C7C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov r8, r1
	mov r3, r8
	sub sp, #0x18
	subs r3, #0x72
	str r2, [sp, #0x14]
	cmp r3, #0xf0
	ble _08015C98
	movs r3, #0xf0
_08015C98:
	mov r2, r8
	subs r2, #0xa
	cmp r2, #0xf0
	ble _08015CA2
	movs r2, #0xf0
_08015CA2:
	lsls r5, r3, #8
	orrs r5, r2
	ldr r4, _08015CE8
	ldr r2, _08015CEC
	ldr r1, _08015CE4
	ldr r6, _08015CF0
	lsls r7, r0, #2
	strh r5, [r4]
	strh r1, [r6]
	ldr r6, [r2, r7]
	movs r0, #0x38
	str r7, [sp, #0x10]
	adds r7, r6, #0
	muls r7, r0, r7
	ldr r1, _08015CF4
	adds r5, r7, #0
	adds r5, #0x18
	ldr r0, [r1, r5]
	mov sb, r1
	movs r1, #0
	bl sub_080189E4
	movs r3, #0x6c
	rsbs r2, r3, #0
	add r2, r8
	mov fp, r2
	mov r3, fp
	movs r4, #0x30
	ldr r1, _08015CF8
	movs r2, #0
	str r4, [sp]
	b _08015CFC
	.byte 0x00, 0x00
_08015CE4:
	.4byte 0x00002C9A
_08015CE8:
	.4byte 0x04000040
_08015CEC:
	.4byte gUnk_080513AC
_08015CF0:
	.4byte 0x04000044
_08015CF4:
	.4byte gUnk_080511B4
_08015CF8:
	.4byte gUnk_0863FDF8
_08015CFC:
	bl sub_08018B10
	ldr r2, _08015DA8
	ldr r4, [r2]
	movs r0, #0x7b
	adds r1, r4, #0
	muls r1, r0, r1
	lsls r5, r1, #0x10
	asrs r0, r5, #0x10
	ldr r2, _08015DAC
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r1, #0xe4
	lsls r0, r1, #1
	lsls r5, r3, #1
	adds r2, r5, r3
	adds r5, r4, #0
	muls r5, r0, r5
	asrs r3, r2, #0xc
	mov sl, r3
	lsls r3, r5, #0x10
	asrs r0, r3, #0x10
	ldr r2, _08015DB0
	bl _call_via_r2
	movs r5, #0x5a
	muls r5, r4, r5
	lsls r1, r0, #0x10
	asrs r0, r1, #0x1b
	mov lr, r0
	ldr r0, _08015DB4
	lsls r3, r6, #2
	ldr r2, [r0, r3]
	lsrs r1, r5, #7
	ldr r5, [r2, #0xc]
	movs r6, #0x14
	muls r5, r6, r5
	movs r4, #0x7f
	ands r1, r4
	ldr r4, _08015DB8
	ldr r2, _08015DBC
	ldr r0, [r4, r5]
	lsrs r6, r0, #0x10
	ldr r0, [r2]
	ldr r5, _08015DC0
	lsls r4, r0, #5
	movs r0, #0x40
	ands r0, r1
	adds r2, r4, r5
	adds r3, r6, #0
	cmp r0, #0
	beq _08015D6A
	rsbs r3, r6, #0
_08015D6A:
	strh r3, [r2]
	ldr r2, _08015DA4
	adds r3, r5, #0
	adds r3, #8
	strh r2, [r4, r3]
	adds r3, #8
	adds r3, r4, r3
	strh r2, [r3]
	adds r2, r5, #0
	adds r2, #0x18
	strh r6, [r4, r2]
	movs r2, #0x3c
	rsbs r3, r2, #0
	adds r5, r7, #0
	add sl, r8
	add r3, sl
	adds r5, #8
	mov r4, sb
	mov ip, r3
	ldr r2, [r4, r5]
	movs r3, #0x5a
	adds r5, #4
	add lr, r3
	ldr r7, [r4, r5]
	cmp r0, #0
	bne _08015DA0
	b _08015F72
_08015DA0:
	ldr r0, _08015DC4
	b _08015DC8
_08015DA4:
	.4byte 0x00000000
_08015DA8:
	.4byte 0x03005660
_08015DAC:
	.4byte sub_03000138
_08015DB0:
	.4byte sub_03000134
_08015DB4:
	.4byte gUnk_0884DF24
_08015DB8:
	.4byte gUnk_0803F49C
_08015DBC:
	.4byte 0x02024390
_08015DC0:
	.4byte 0x0200000E
_08015DC4:
	.4byte 0x00000594
_08015DC8:
	subs r4, r0, r1
_08015DCA:
	ldr r5, _08015F78
	movs r1, #0x80
	ldrb r0, [r5, r4]
	lsls r5, r1, #1
	str r5, [sp, #4]
	str r0, [sp]
	ldr r5, _08015F7C
	ldr r0, [r5]
	lsls r4, r0, #9
	str r4, [sp, #8]
	mov r0, ip
	movs r4, #0
	mov r1, lr
	adds r3, r7, #0
	str r4, [sp, #0xc]
	bl fe_spr_plot
	lsls r2, r6, #2
	adds r1, r2, r6
	ldr r7, [r5]
	asrs r0, r1, #2
	ldr r1, _08015F80
	adds r7, #1
	adds r3, r1, #0
	lsls r2, r7, #5
	adds r3, #8
	adds r6, r2, r3
	adds r3, r1, #0
	adds r3, #0x10
	strh r0, [r2, r1]
	strh r4, [r6]
	adds r6, r2, r3
	strh r4, [r6]
	adds r1, #0x18
	movs r6, #0xa0
	strh r0, [r2, r1]
	lsls r3, r7, #9
	lsls r1, r6, #3
	mov r0, sl
	str r7, [r5]
	ldr r2, _08015F84
	str r1, [sp, #4]
	str r3, [sp, #8]
	subs r0, #0x3c
	ldr r3, _08015F88
	movs r1, #0x69
	str r4, [sp]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r1, #0
	movs r0, #0x18
	bl sub_080189E4
	movs r7, #0x6c
	ldr r1, _08015F8C
	movs r2, #0
	mov r3, fp
	str r7, [sp]
	bl sub_08018B10
	ldr r4, _08015F90
	ldr r2, _08015F94
	mov sl, r4
	ldr r4, [sp, #0x10]
	ldr r6, [r2, r4]
	movs r1, #0x38
	muls r1, r6, r1
	ldr r3, _08015F98
	adds r1, #0x28
	mov r4, r8
	ldr r7, _08015F9C
	ldr r6, [r3, r1]
	movs r5, #0
	subs r4, #0x46
_08015E66:
	cmp r5, r6
	blt _08015E6C
	b _08015F6C
_08015E6C:
	movs r2, #1
	str r2, [sp]
_08015E70:
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x71
	adds r0, r4, #0
	mov r2, sl
	adds r3, r7, #0
	adds r5, #1
	bl fe_spr_plot
	adds r4, #8
	cmp r5, #4
	ble _08015E66
	movs r1, #0
	movs r0, #0x19
	bl sub_080189E4
	movs r7, #0x78
	ldr r1, _08015F8C
	movs r2, #0
	mov r3, fp
	str r7, [sp]
	bl sub_08018B10
	ldr r2, _08015F90
	ldr r4, _08015F94
	mov sl, r2
	ldr r2, [sp, #0x10]
	ldr r6, [r4, r2]
	movs r1, #0x38
	muls r1, r6, r1
	ldr r3, _08015F98
	adds r1, #0x2c
	mov r4, r8
	ldr r7, _08015F9C
	ldr r6, [r3, r1]
	movs r5, #0
	subs r4, #0x46
_08015EBE:
	cmp r5, r6
	bge _08015F66
	movs r0, #1
	str r0, [sp]
_08015EC6:
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x7d
	mov r2, sl
	adds r3, r7, #0
	adds r5, #1
	bl fe_spr_plot
	adds r4, #8
	cmp r5, #4
	ble _08015EBE
	movs r1, #0
	movs r0, #0x1a
	bl sub_080189E4
	movs r5, #0x84
	ldr r1, _08015F8C
	movs r2, #0
	mov r3, fp
	str r5, [sp]
	bl sub_08018B10
	ldr r0, _08015F94
	ldr r6, [sp, #0x10]
	ldr r7, [r0, r6]
	movs r4, #0x38
	muls r4, r7, r4
	ldr r3, _08015F98
	ldr r1, _08015F90
	ldr r2, _08015F9C
	adds r4, #0x30
	mov r6, r8
	ldr r7, [r3, r4]
	movs r5, #0
	mov sb, r1
	mov sl, r2
	subs r6, #0x46
_08015F16:
	cmp r5, r7
	bge _08015F60
	movs r1, #1
	str r1, [sp]
_08015F1E:
	movs r4, #0
	adds r0, r6, #0
	movs r1, #0x89
	mov r2, sb
	mov r3, sl
	adds r5, #1
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r6, #8
	bl fe_spr_plot
	cmp r5, #4
	ble _08015F16
	ldr r1, [sp, #0x14]
	mov r0, r8
	ldr r2, _08015FA0
	ldr r3, _08015FA4
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	add sp, #0x18
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08015F60:
	movs r2, #2
	str r2, [sp]
	b _08015F1E
_08015F66:
	movs r1, #2
	str r1, [sp]
	b _08015EC6
_08015F6C:
	movs r1, #2
	str r1, [sp]
	b _08015E70
_08015F72:
	ldr r5, _08015FA8
	adds r4, r1, r5
	b _08015DCA
_08015F78:
	.4byte gUnk_08715A68
_08015F7C:
	.4byte 0x02024390
_08015F80:
	.4byte 0x0200000E
_08015F84:
	.4byte gUnk_08628BD0
_08015F88:
	.4byte gUnk_0863FAE0
_08015F8C:
	.4byte gUnk_0863FDF8
_08015F90:
	.4byte gUnk_08629E00
_08015F94:
	.4byte gUnk_080513AC
_08015F98:
	.4byte gUnk_080511B4
_08015F9C:
	.4byte gUnk_0863FBE0
_08015FA0:
	.4byte gUnk_085C96D0
_08015FA4:
	.4byte gUnk_0863FA20
_08015FA8:
	.4byte 0x00000514

	.global fe_characterselect_init
	.thumb_func
	.type fe_characterselect_init, %function
fe_characterselect_init: @ 08015FAC
	push {r4, lr}
	ldr r0, _08015FFC
	ldr r1, _08016000
	ldr r4, _08015FE8
	sub sp, #8
	bl AGBPrintf
	ldr r0, _08016004
	ldr r1, _08016008
	strh r4, [r0]
	movs r3, #3
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	ldr r3, _0801600C
	ldr r1, _08016010
	str r3, [r1]
	ldr r1, _08015FEC
	movs r2, #0x80
	strh r1, [r0]
	ldr r1, _08015FF0
	lsls r0, r2, #0x13
	strh r1, [r0]
	ldr r1, _08015FF4
	adds r0, #8
	strh r1, [r0]
	ldr r1, _08015FF8
	b _08016014
	.byte 0x00, 0x00
_08015FE8:
	.4byte 0x00000000
_08015FEC:
	.4byte 0x00000001
_08015FF0:
	.4byte 0x00001240
_08015FF4:
	.4byte 0x00000108
_08015FF8:
	.4byte 0x00000084
_08015FFC:
	.4byte gUnk_080513DC
_08016000:
	.4byte gUnk_080513E8
_08016004:
	.4byte 0x04000208
_08016008:
	.4byte 0x04000200
_0801600C:
	.4byte sub_08000460
_08016010:
	.4byte 0x03005620
_08016014:
	adds r0, #2
	strh r1, [r0]
	adds r0, #6
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r1, _08016058
	adds r0, #2
	strh r4, [r0]
	adds r0, #0x32
	strh r1, [r0]
	ldr r1, _0801605C
	adds r0, #2
	strh r1, [r0]
	ldr r1, _08016060
	subs r0, #0xa
	strh r1, [r0]
	ldr r1, _08016064
	adds r0, #4
	strh r1, [r0]
	ldr r1, _08016068
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _0801606C
	adds r0, #2
	strh r1, [r0]
	bl sub_08018C58
	ldr r0, _08016074
	ldr r2, _08016070
	b _08016078
	.byte 0x00, 0x00
_08016058:
	.4byte 0x00000033
_0801605C:
	.4byte 0x00000012
_08016060:
	.4byte 0x00007AE6
_08016064:
	.4byte 0x00002C9A
_08016068:
	.4byte 0x00002261
_0801606C:
	.4byte 0x0000030F
_08016070:
	.4byte 0x0000F3FF
_08016074:
	.4byte 0x040000D4
_08016078:
	ldr r3, _080160CC
	mov r1, sp
	adds r1, #6
	strh r2, [r1]
	str r1, [r0]
	str r3, [r0, #4]
	ldr r3, _080160D0
	str r3, [r0, #8]
	ldr r3, _080160C8
	ldr r2, [r0, #8]
	strh r3, [r1]
	ldr r3, _080160D4
	str r1, [r0]
	str r3, [r0, #4]
	ldr r3, _080160D8
	str r3, [r0, #8]
	movs r3, #0xf8
	ldr r2, [r0, #8]
	str r3, [sp]
	ldr r3, _080160DC
	mov r2, sp
	str r2, [r0]
	str r3, [r0, #4]
	ldr r3, _080160E0
	str r3, [r0, #8]
	ldr r3, _080160E4
	ldr r2, [r0, #8]
	strh r4, [r1]
	str r1, [r0]
	ldr r1, _080160E8
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _080160EC
	movs r1, #0
	ldr r3, _080160F0
	str r1, [r0]
	str r1, [r0, #8]
	b _080160F4
	.byte 0x00, 0x00
_080160C8:
	.4byte 0x0000FFFF
_080160CC:
	.4byte 0x06000800
_080160D0:
	.4byte 0x81000400
_080160D4:
	.4byte 0x0600FFE0
_080160D8:
	.4byte 0x81000010
_080160DC:
	.4byte 0x02000008
_080160E0:
	.4byte 0x85000100
_080160E4:
	.4byte 0x81004000
_080160E8:
	.4byte 0x06010000
_080160EC:
	.4byte 0x02024208
_080160F0:
	.4byte 0x020241D4
_080160F4:
	movs r2, #3
_080160F6:
	subs r2, #1
	stm r3!, {r1}
	cmp r2, #0
	bge _080160F6
	ldr r0, _08016170
	movs r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x10]
	str r1, [r0, #0x1c]
	movs r2, #0x40
	subs r1, #1
	ldr r3, _08016174
	str r1, [r0, #0x20]
	rsbs r0, r2, #0
	movs r1, #0
	movs r2, #3
_08016118:
	subs r2, #1
	str r0, [r3, #0x10]
	str r1, [r3, #0x18]
	str r1, [r3]
	str r1, [r3, #4]
	str r1, [r3, #8]
	str r1, [r3, #0xc]
	adds r3, #0x1c
	cmp r2, #0
	bge _08016118
	ldr r0, _08016174
	movs r3, #0x5a
	str r3, [r0, #0x68]
	str r3, [r0, #0x4c]
	ldr r3, _08016170
	movs r1, #0x1c
	str r1, [r0, #0x30]
	str r1, [r0, #0x14]
	adds r3, #0x24
	movs r1, #0
	movs r2, #3
_08016142:
	subs r2, #1
	stm r3!, {r1}
	cmp r2, #0
	bge _08016142
	movs r0, #0
	bl sub_0801931C
	bl fe_spr_init
	bl sub_08003634
	ldr r3, _08016178
	ldr r0, _0801617C
	ldr r1, _08016180
	str r3, [r0]
	ldr r0, _08016184
	bl AGBPrintf
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08016170:
	.4byte 0x020241D4
_08016174:
	.4byte 0x02024214
_08016178:
	.4byte sub_08016188
_0801617C:
	.4byte gStateFunc
_08016180:
	.4byte gUnk_080513E8
_08016184:
	.4byte gUnk_08051400

	.global sub_08016188
	.thumb_func
	.type sub_08016188, %function
sub_08016188: @ 08016188
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x18
	bl sub_08003478
	ldr r2, _08016314
	movs r0, #0x16
	ldrsh r1, [r2, r0]
	cmp r1, #2
	beq _080161AE
	ldr r5, _08016318
	ldr r4, [r5]
	ldr r0, _0801631C
	lsrs r1, r4, #2
	strh r1, [r0]
_080161AE:
	ldr r5, _08016320
	ldr r3, [r5, #0x14]
	cmp r3, #0
	bne _080161B8
	b _08016824
_080161B8:
	cmp r3, #2
	bne _080161BE
	b _08016758
_080161BE:
	ldr r0, _08016324
	ldr r1, [r0]
	cmp r1, #1
	bne _080161C8
	b _08016734
_080161C8:
	cmp r1, #1
	ble _080161CE
	b _080166EA
_080161CE:
	cmp r1, #0
	bne _080161D4
	b _080166D6
_080161D4:
	bl sub_08017E1C
	ldr r3, _08016328
	movs r1, #0
	ldr r0, [r3]
	mov sb, r1
	cmp sb, r0
	bge _0801622E
	ldr r7, _08016320
	ldr r6, _0801632C
	adds r5, r7, #0
	movs r4, #0
_080161EC:
	ldr r1, [r7, #0x1c]
	mov r0, sb
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08016220
	ldr r2, [r5]
	movs r0, #0x1c
	muls r2, r0, r2
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, #0x14
	ldr r0, [r6, r1]
	ldr r1, [r6, r2]
	mov r2, sb
	str r2, [sp]
	adds r0, #0x1c
	adds r1, #0x28
	ldr r2, _08016330
	ldr r3, _08016334
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_08016220:
	ldr r3, _08016328
	movs r1, #1
	ldr r2, [r3]
	add sb, r1
	adds r5, #4
	cmp sb, r2
	blt _080161EC
_0801622E:
	ldr r4, _08016318
	ldr r5, [r4]
	movs r7, #1
	lsrs r6, r5, #3
	ands r6, r7
	cmp r6, #0
	bne _0801623E
	b _080166D0
_0801623E:
	ldr r0, _08016338
	str r0, [sp, #0x10]
_08016242:
	ldr r1, _08016314
	movs r4, #0x14
	ldrsh r6, [r1, r4]
	lsls r2, r6, #2
	str r2, [sp, #0x14]
	ldr r4, _0801633C
	ldr r2, _0801632C
	lsls r3, r6, #4
	movs r1, #3
	adds r3, #0xc
	mov sb, r1
	mov r8, r2
	mov fp, r4
	movs r5, #0
	mov sl, r3
_08016260:
	ldr r2, _08016340
	mov r3, sl
	ldr r2, [r2, r3]
	movs r3, #0x38
	mov lr, r2
	mov r2, lr
	muls r2, r3, r2
	movs r7, #0x1c
	mov r4, sb
	muls r4, r7, r4
	adds r3, r2, #0
	mov r2, fp
	ldr r2, [r2, r3]
	adds r7, r4, #0
	adds r6, r4, #0
	mov lr, r2
	mov r1, r8
	mov r2, fp
	adds r7, #0x10
	adds r6, #0x14
	adds r3, #4
	ldr r0, [r1, r7]
	ldr r3, [r2, r3]
	ldr r1, [r1, r6]
	mov r2, r8
	adds r4, #0x18
	ldr r4, [r2, r4]
	adds r0, #0x1c
	adds r1, #0x28
	mov r2, lr
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r0, _08016344
	ldr r4, [r0]
	ldr r1, _08016320
	lsls r2, r4, #2
	ldr r0, [r1, r2]
	cmp sb, r0
	bne _080162B8
	b _080166B4
_080162B8:
	movs r2, #1
	rsbs r6, r2, #0
	movs r1, #4
	add sb, r6
	rsbs r3, r1, #0
	mov r4, sb
	add sl, r3
	cmp r4, #0
	bge _08016260
	bl fe_draw_title
	bl sub_08018D40
	ldr r6, _08016324
	ldr r4, _08016310
	ldr r0, [r6, #8]
	subs r1, r4, r0
	lsls r3, r1, #0x19
	ldr r2, _08016348
	asrs r0, r3, #0x10
	bl _call_via_r2
	lsls r7, r0, #0x10
	asrs r4, r7, #0x10
	movs r1, #0x78
	adds r2, r4, #0
	muls r2, r1, r2
	ldr r7, [r6, #4]
	ldr r3, [sp, #0x14]
	asrs r1, r2, #0xc
	adds r0, r3, r7
	adds r1, #0xf0
	movs r2, #0xa0
	bl sub_08015C7C
	ldr r0, [sp, #0x14]
	ldr r4, _08016340
	movs r3, #0
	lsls r6, r0, #2
	mov sb, r3
	ldr r7, _0801632C
	adds r3, r6, r4
	mov fp, r3
	b _0801634C
_08016310:
	.4byte 0x00000020
_08016314:
	.4byte 0x0202D74C
_08016318:
	.4byte 0x03005660
_0801631C:
	.4byte 0x04000014
_08016320:
	.4byte 0x020241D4
_08016324:
	.4byte 0x02024208
_08016328:
	.4byte 0x0202DE5C
_0801632C:
	.4byte 0x02024214
_08016330:
	.4byte gUnk_083D9200
_08016334:
	.4byte gUnk_0863F640
_08016338:
	.4byte gUnk_0863F280
_0801633C:
	.4byte gUnk_080511B4
_08016340:
	.4byte gUnk_080513AC
_08016344:
	.4byte gLocalPlayerIndex
_08016348:
	.4byte sub_03000138
_0801634C:
	movs r2, #0x1c
	mov r6, sb
	muls r6, r2, r6
	ldr r1, [r7, r6]
	mov sl, r1
	cmp r1, #0
	bne _0801635C
	b _08016640
_0801635C:
	cmp r1, #1
	bne _08016362
	b _080165D4
_08016362:
	movs r4, #1
	add sb, r4
	movs r0, #4
	mov r4, sb
	add fp, r0
	cmp r4, #3
	ble _0801634C
	ldr r3, _08016690
	movs r0, #0
	ldr r2, [r3]
	mov sb, r0
	cmp sb, r2
	bge _080163A6
	ldr r2, _08016694
	ldr r3, _08016698
	mov r8, r2
	mov sl, r3
	mov r7, r8
_08016386:
	ldr r4, [r7, #0x24]
	cmp r4, #1
	bne _0801638E
	b _080165B4
_0801638E:
	cmp r4, #1
	ble _08016394
	b _08016540
_08016394:
	cmp r4, #0
	beq _080163B8
_08016398:
	movs r4, #1
	add sb, r4
	ldr r4, _08016690
	ldr r0, [r4]
	adds r7, #4
	cmp sb, r0
	blt _08016386
_080163A6:
	add sp, #0x18
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080163B8:
	mov r0, r8
	ldr r6, [r0, #0x14]
	cmp r6, #1
	bne _08016398
	mov r1, sb
	ldr r0, _0801669C
	lsls r5, r1, #1
	ldrh r2, [r0, r5]
	movs r1, #9
	ands r1, r2
	cmp r1, #0
	beq _0801642E
	mov r2, sl
	ldr r4, [r2]
	cmp sb, r4
	beq _080163FC
_080163D8:
	ldr r4, [sp, #0x14]
	ldr r3, [r7]
	ldr r2, _080166A0
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, _080166A4
	ldr r4, [r2, r3]
	adds r1, r5, #4
	strh r4, [r0, r1]
	mov r1, r8
	ldr r4, [r1, #0x1c]
	mov r0, sb
	lsls r6, r0
	orrs r4, r6
	str r4, [r1, #0x1c]
	movs r1, #3
	str r1, [r7, #0x24]
	b _08016398
_080163FC:
	movs r2, #0x80
	lsls r4, r2, #9
	movs r1, #0x7f
	adds r2, r4, #0
	movs r0, #0xcb
	bl sub_0802F11E
	ldr r3, [r7]
	ldr r0, [sp, #0x14]
	ldr r2, _080166A0
	adds r3, r0, r3
	lsls r3, r3, #2
	ldr r0, [r2, r3]
	movs r3, #0x38
	muls r3, r0, r3
	ldr r1, _080166A8
	adds r3, #0x1c
	ldr r0, [r1, r3]
	adds r2, r4, #0
	movs r1, #0x7f
	bl sub_0802F11E
	mov r1, r8
	str r0, [r1, #0x20]
	b _080163D8
_0801642E:
	movs r5, #2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _0801645E
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcc
	bl sub_0802F11E
	mov r2, r8
	str r5, [r7, #0x24]
	str r5, [r2, #0x14]
	bl sub_0801932C
	ldr r1, _080166AC
	mov r3, r8
	movs r2, #3
	str r4, [r3, #0x10]
	str r2, [r1]
	bl sub_080035F8
	b _08016398
_0801645E:
	ldr r3, [r7]
	cmp r3, #1
	beq _08016504
	cmp r3, #1
	bgt _080164A0
	cmp r3, #0
	bne _08016398
	movs r4, #0x10
	ands r4, r2
	cmp r4, #0
	beq _08016482
	str r6, [r7]
	mov r4, sl
	ldr r0, [r4]
	cmp sb, r0
	beq _08016480
	b _08016398
_08016480:
	b _08016532
_08016482:
	movs r1, #0x80
	ands r1, r2
	cmp r1, #0
	bne _0801648C
	b _08016398
_0801648C:
	str r5, [r7]
	mov r0, sl
	ldr r2, [r0]
	cmp sb, r2
	beq _08016498
	b _08016398
_08016498:
	movs r4, #0x80
	movs r1, #0x7f
	lsls r2, r4, #9
	b _08016538
_080164A0:
	cmp r3, #2
	beq _080164CE
	cmp r3, #3
	beq _080164AA
	b _08016398
_080164AA:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080164C0
	str r5, [r7]
	mov r1, sl
	ldr r2, [r1]
	cmp sb, r2
	beq _080164BE
	b _08016398
_080164BE:
	b _08016532
_080164C0:
	movs r1, #0x40
	ands r1, r2
	cmp r1, #0
	bne _080164CA
	b _08016398
_080164CA:
	str r6, [r7]
	b _08016528
_080164CE:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _080164E6
	movs r4, #3
	str r4, [r7]
	mov r4, sl
	ldr r2, [r4]
	cmp sb, r2
	beq _080164E4
	b _08016398
_080164E4:
	b _08016532
_080164E6:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080164F0
	b _08016398
_080164F0:
	str r4, [r7]
	mov r0, sl
	ldr r1, [r0]
	cmp sb, r1
	beq _080164FC
	b _08016398
_080164FC:
	movs r4, #0x80
	movs r1, #0x7f
	lsls r2, r4, #9
	b _08016538
_08016504:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801651A
	str r4, [r7]
	mov r1, sl
	ldr r2, [r1]
	cmp sb, r2
	beq _08016518
	b _08016398
_08016518:
	b _08016532
_0801651A:
	movs r1, #0x80
	ands r1, r2
	cmp r1, #0
	bne _08016524
	b _08016398
_08016524:
	movs r0, #3
	str r0, [r7]
_08016528:
	mov r2, sl
	ldr r4, [r2]
	cmp sb, r4
	beq _08016532
	b _08016398
_08016532:
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
_08016538:
	movs r0, #0xbf
	bl sub_0802F11E
	b _08016398
_08016540:
	cmp r4, #2
	beq _08016594
	cmp r4, #3
	beq _0801654A
	b _08016398
_0801654A:
	mov r1, r8
	ldr r0, [r1, #0x20]
	cmp r0, #0
	blt _0801655C
	bl sub_0802EF7A
	cmp r0, #0
	beq _0801655C
	b _08016398
_0801655C:
	ldr r3, _08016690
	movs r1, #1
	ldr r0, [r3]
	adds r2, r1, #0
	lsls r2, r0
	mov r0, r8
	ldr r3, [r0, #0x1c]
	subs r2, #1
	cmp r3, r2
	beq _08016572
	b _08016398
_08016572:
	str r1, [r7, #0x24]
	movs r1, #2
	str r1, [r0, #0x14]
	bl sub_0801932C
	movs r2, #0
	mov r1, r8
	str r2, [r1, #0x10]
	ldr r1, _080166AC
	mov r2, sb
	str r4, [r1]
	cmp r2, #0
	beq _0801658E
	b _08016398
_0801658E:
	bl sub_080035F8
	b _08016398
_08016594:
	ldr r2, _080166B0
	movs r4, #0x80
	ldr r0, [r2]
	lsls r1, r4, #4
	ands r0, r1
	cmp r0, #0
	bne _080165A4
	b _08016398
_080165A4:
	mov r4, sb
	cmp r4, #0
	beq _080165AC
	b _08016398
_080165AC:
	movs r0, #0
	bl sub_0801E5A4
	b _08016398
_080165B4:
	ldr r2, _080166B0
	movs r4, #0x80
	ldr r0, [r2]
	lsls r1, r4, #4
	ands r0, r1
	cmp r0, #0
	bne _080165C4
	b _08016398
_080165C4:
	mov r3, sb
	cmp r3, #0
	beq _080165CC
	b _08016398
_080165CC:
	movs r0, #1
	bl sub_0801E5A4
	b _08016398
_080165D4:
	mov r0, fp
	ldr r5, [r0]
	movs r3, #0x38
	muls r3, r5, r3
	ldr r2, _080166A8
	adds r5, r6, #4
	ldr r0, [r7, r5]
	adds r3, #0x10
	ldr r3, [r2, r3]
	lsls r2, r0, #2
	adds r0, r6, #0
	mov ip, r3
	adds r0, #8
	ldr r3, [r7, r0]
	mov r4, ip
	ldr r2, [r2, r4]
	lsls r3, r3, #2
	ldr r4, [r3, r2]
	adds r1, r6, #0
	subs r4, #1
	adds r1, #0x18
	str r4, [r7, r1]
	adds r4, r6, #0
	adds r4, #0xc
	ldr r3, [r7, r4]
	cmp r3, #0
	ble _08016610
	subs r3, #1
	str r3, [r7, r4]
	b _08016362
_08016610:
	ldr r1, [r7, r5]
	lsls r2, r1, #2
	mov r1, ip
	ldr r3, [r2, r1]
	ldr r2, [r3, #4]
	str r2, [r7, r4]
	ldr r2, [r7, r0]
	adds r2, #1
	str r2, [r7, r0]
	ldr r0, [r7, r5]
	lsls r3, r0, #2
	ldr r0, [r3, r1]
	lsls r1, r2, #2
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _08016632
	b _08016362
_08016632:
	str r3, [r7, r6]
	bl sub_08000B14
	lsrs r3, r0, #0xb
	adds r3, #0x28
	str r3, [r7, r4]
	b _08016362
_08016640:
	movs r3, #0xc
	adds r2, r3, r6
	ldr r3, [r7, r2]
	mov r8, r2
	cmp r3, #0
	ble _08016652
	subs r3, #1
	str r3, [r7, r2]
	b _08016362
_08016652:
	mov r3, fp
	ldr r0, [r3]
	movs r1, #0x38
	adds r4, r0, #0
	muls r4, r1, r4
	bl sub_08000B14
	ldr r3, _080166A8
	adds r4, #0x14
	ldr r1, [r3, r4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r5, r6, #4
	ldr r4, [r7, r5]
	lsrs r0, r2, #0x10
	adds r2, r4, r0
	str r2, [r7, r5]
	cmp r2, r1
	blt _0801667C
	subs r4, r2, r1
	str r4, [r7, r5]
_0801667C:
	adds r1, r6, #0
	movs r0, #1
	mov r4, sl
	mov r3, r8
	adds r1, #8
	movs r2, #2
	str r0, [r7, r6]
	str r4, [r7, r3]
	str r2, [r7, r1]
	b _08016362
_08016690:
	.4byte 0x0202DE5C
_08016694:
	.4byte 0x020241D4
_08016698:
	.4byte gLocalPlayerIndex
_0801669C:
	.4byte 0x0202DE50
_080166A0:
	.4byte gUnk_080513AC
_080166A4:
	.4byte 0x0202D74C
_080166A8:
	.4byte gUnk_080511B4
_080166AC:
	.4byte 0x02024208
_080166B0:
	.4byte 0x0300566C
_080166B4:
	mov r1, r8
	ldr r0, [r1, r7]
	ldr r1, [r1, r6]
	adds r0, #0x1c
	adds r1, #0x28
	ldr r2, _08016748
	ldr r3, [sp, #0x10]
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	b _080162B8
_080166D0:
	ldr r3, _0801674C
	str r3, [sp, #0x10]
	b _08016242
_080166D6:
	ldr r5, _08016750
	ldr r2, [r5]
	ldr r7, _08016754
	lsls r6, r2, #2
	ldr r4, [r7, r6]
	movs r5, #1
	str r4, [r0, #4]
	str r5, [r0]
	str r1, [r0, #8]
	b _080161D4
_080166EA:
	cmp r1, #2
	beq _0801671C
	cmp r1, #3
	beq _080166F4
	b _080161D4
_080166F4:
	ldr r3, [r0, #8]
	cmp r3, #0
	ble _08016700
	subs r3, #1
	str r3, [r0, #8]
	b _080161D4
_08016700:
	ldr r2, _08016750
	ldr r5, [r2]
	ldr r7, _08016754
	lsls r6, r5, #2
	adds r6, #0x24
	ldr r3, [r7, r6]
	cmp r3, #0
	beq _08016718
	movs r4, #1
	rsbs r1, r4, #0
	str r1, [r0]
	b _080161D4
_08016718:
	str r3, [r0]
	b _080161D4
_0801671C:
	ldr r1, _08016750
	ldr r2, [r1]
	ldr r5, _08016754
	lsls r7, r2, #2
	ldr r6, [r0, #4]
	ldr r4, [r5, r7]
	cmp r6, r4
	bne _0801672E
	b _080161D4
_0801672E:
	movs r4, #3
	str r4, [r0]
	b _080161D4
_08016734:
	ldr r3, [r0, #8]
	cmp r3, #0x1f
	bgt _08016740
	adds r3, #1
	str r3, [r0, #8]
	b _080161D4
_08016740:
	movs r1, #2
	str r1, [r0]
	b _080161D4
	.byte 0x00, 0x00
_08016748:
	.4byte gUnk_0831F540
_0801674C:
	.4byte gUnk_0863EE80
_08016750:
	.4byte gLocalPlayerIndex
_08016754:
	.4byte 0x020241D4
_08016758:
	ldr r4, [r5, #0x10]
	cmp r4, #0x1f
	bgt _0801677C
	ldr r3, _08016798
	subs r2, r3, r4
	lsls r7, r2, #0x19
	asrs r0, r7, #0x10
	ldr r6, _080167A0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r2, #0x88
	muls r2, r3, r2
	ldr r6, _080167A4
	asrs r7, r2, #0xc
	subs r7, #0x82
	str r7, [r6, #0x10]
_0801677C:
	adds r0, r4, #0
	subs r0, #0x11
	cmp r0, #0x1e
	bhi _080167B8
	ldr r6, _0801679C
	subs r1, r6, r4
	lsls r3, r1, #0x19
	ldr r4, _080167A0
	asrs r0, r3, #0x10
	bl _call_via_r4
	lsls r2, r0, #0x10
	b _080167A8
	.byte 0x00, 0x00
_08016798:
	.4byte 0x00000020
_0801679C:
	.4byte 0x00000030
_080167A0:
	.4byte sub_03000138
_080167A4:
	.4byte 0x02024214
_080167A8:
	asrs r7, r2, #0x10
	movs r6, #0x88
	muls r6, r7, r6
	ldr r4, _08016800
	asrs r1, r6, #0xc
	subs r1, #0x48
	str r1, [r4, #0x2c]
	ldr r4, [r5, #0x10]
_080167B8:
	adds r0, r4, #0
	subs r0, #9
	cmp r0, #0x1e
	bhi _080167E0
	ldr r3, _080167F8
	subs r2, r3, r4
	lsls r7, r2, #0x19
	asrs r0, r7, #0x10
	ldr r6, _08016804
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r4, #0x88
	muls r4, r3, r4
	ldr r7, _08016800
	asrs r2, r4, #0xc
	subs r2, #0x82
	str r2, [r7, #0x48]
	ldr r4, [r5, #0x10]
_080167E0:
	adds r0, r4, #0
	subs r0, #0x19
	cmp r0, #0x1e
	bhi _0801681A
	ldr r6, _080167FC
	subs r1, r6, r4
	lsls r3, r1, #0x19
	ldr r4, _08016804
	asrs r0, r3, #0x10
	bl _call_via_r4
	b _08016808
_080167F8:
	.4byte 0x00000028
_080167FC:
	.4byte 0x00000038
_08016800:
	.4byte 0x02024214
_08016804:
	.4byte sub_03000138
_08016808:
	lsls r2, r0, #0x10
	asrs r7, r2, #0x10
	movs r6, #0x88
	muls r6, r7, r6
	ldr r4, _080168CC
	asrs r1, r6, #0xc
	subs r1, #0x48
	str r1, [r4, #0x64]
	ldr r4, [r5, #0x10]
_0801681A:
	cmp r4, #0x37
	ble _080168C0
	movs r7, #3
	str r7, [r5, #0x14]
	b _080161BE
_08016824:
	ldr r4, [r5, #0x10]
	adds r6, r4, #0
	subs r6, #0x11
	cmp r6, #0x1e
	bhi _0801684C
	adds r1, r4, #0
	subs r1, #0x10
	lsls r2, r1, #0x19
	asrs r0, r2, #0x10
	ldr r7, _080168D0
	bl _call_via_r7
	lsls r6, r0, #0x10
	asrs r3, r6, #0x10
	movs r1, #0x88
	muls r1, r3, r1
	ldr r7, _080168CC
	asrs r2, r1, #0xc
	subs r2, #0x82
	str r2, [r7, #0x10]
_0801684C:
	cmp r4, #0x1f
	bgt _0801686C
	lsls r1, r4, #0x19
	asrs r0, r1, #0x10
	ldr r2, _080168D0
	bl _call_via_r2
	lsls r7, r0, #0x10
	asrs r3, r7, #0x10
	movs r6, #0x88
	muls r6, r3, r6
	ldr r0, _080168CC
	asrs r4, r6, #0xc
	subs r4, #0x48
	str r4, [r0, #0x2c]
	ldr r4, [r5, #0x10]
_0801686C:
	adds r0, r4, #0
	subs r0, #0x19
	cmp r0, #0x1e
	bhi _08016894
	adds r6, r4, #0
	subs r6, #0x18
	lsls r4, r6, #0x19
	asrs r0, r4, #0x10
	ldr r1, _080168D0
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	movs r7, #0x88
	muls r7, r3, r7
	ldr r4, _080168CC
	asrs r6, r7, #0xc
	subs r6, #0x82
	str r6, [r4, #0x48]
	ldr r4, [r5, #0x10]
_08016894:
	adds r0, r4, #0
	subs r0, #9
	cmp r0, #0x1e
	bhi _080168BC
	adds r2, r4, #0
	subs r2, #8
	lsls r7, r2, #0x19
	asrs r0, r7, #0x10
	ldr r6, _080168D0
	bl _call_via_r6
	lsls r4, r0, #0x10
	asrs r3, r4, #0x10
	movs r1, #0x88
	muls r1, r3, r1
	ldr r7, _080168CC
	asrs r2, r1, #0xc
	subs r2, #0x48
	str r2, [r7, #0x64]
	ldr r4, [r5, #0x10]
_080168BC:
	cmp r4, #0x37
	bgt _080168C6
_080168C0:
	adds r0, r4, #1
	str r0, [r5, #0x10]
	b _080161BE
_080168C6:
	movs r1, #1
	str r1, [r5, #0x14]
	b _080161BE
_080168CC:
	.4byte 0x02024214
_080168D0:
	.4byte sub_03000138
