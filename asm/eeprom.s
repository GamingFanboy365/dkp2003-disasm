@ asm/eeprom.s: ROM 0x01D2EC-0x0202C8 (rom, VMA 0x0801D2EC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global eeprom_update
	.thumb_func
	.type eeprom_update, %function
eeprom_update: @ 0801D2EC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801D374
	ldr r1, _0801D378
	bl AGBPrintf
	bl AGBPrintFlush
	bl sub_0801E1A0
	ldr r5, _0801D37C
	ldr r4, _0801D380
	movs r7, #0
	movs r6, #0
_0801D306:
	ldr r1, [r5]
	ldr r0, [r4]
	cmp r1, r0
	beq _0801D36A
_0801D30E:
	lsls r3, r6, #0x10
	adds r1, r4, #0
	lsrs r0, r3, #0x10
	bl sub_0803287C
	ldr r1, [r4]
	str r1, [r5]
	ldr r2, [r4, #4]
	orrs r7, r0
	lsls r0, r7, #0x10
	str r2, [r5, #4]
	asrs r7, r0, #0x10
_0801D326:
	adds r6, #1
	adds r5, #8
	adds r4, #8
	cmp r6, #0x3f
	ble _0801D306
	lsls r4, r7, #0x10
	cmp r4, #0
	beq _0801D346
_0801D336:
	bl sub_0801E1B4
	rsbs r1, r4, #0
	orrs r1, r4
	lsrs r0, r1, #0x1f
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801D346:
	ldr r5, _0801D37C
	movs r6, #0
_0801D34A:
	lsls r7, r6, #0x10
	lsrs r0, r7, #0x10
	adds r1, r5, #0
	bl sub_08032958
	lsls r2, r0, #0x10
	orrs r2, r4
	adds r6, #1
	asrs r7, r2, #0x10
	adds r5, #8
	cmp r6, #0x3f
	ble _0801D366
	lsls r4, r7, #0x10
	b _0801D336
_0801D366:
	lsls r4, r7, #0x10
	b _0801D34A
_0801D36A:
	ldr r3, [r5, #4]
	ldr r0, [r4, #4]
	cmp r3, r0
	bne _0801D30E
	b _0801D326
_0801D374:
	.4byte gUnk_08051A60
_0801D378:
	.4byte gUnk_08051A64
_0801D37C:
	.4byte 0x0202DA48
_0801D380:
	.4byte 0x0202DC48

	.global sub_0801D384
	.thumb_func
	.type sub_0801D384, %function
sub_0801D384: @ 0801D384
	push {r4, r5, lr}
	ldr r1, _0801D438
	adds r5, r0, #0
	ldr r0, [r1]
	ldr r2, _0801D43C
	str r0, [r5]
	ldr r0, [r2, #0x1c]
	adds r4, r5, #0
	str r0, [r5, #4]
	adds r0, r2, #0
	movs r1, #0
	adds r4, #8
	adds r0, #0x6c
_0801D39E:
	ldrb r2, [r0, #0xc]
	lsls r3, r2, #4
	ldrb r2, [r0]
	adds r1, #1
	orrs r3, r2
	strb r3, [r4]
	adds r0, #1
	adds r4, #1
	cmp r1, #0xb
	ble _0801D39E
	ldr r0, _0801D43C
	movs r4, #0xf
	ldrb r1, [r0, #0x16]
	adds r2, r4, #0
	ands r2, r1
	movs r3, #0x10
	ldrb r1, [r5, #0x14]
	rsbs r3, r3, #0
	ands r3, r1
	orrs r3, r2
	ldrb r2, [r0, #0x18]
	ands r3, r4
	lsls r1, r2, #4
	orrs r3, r1
	movs r2, #0xfc
	strb r3, [r5, #0x14]
	lsls r3, r2, #1
	adds r2, r0, r3
	ldrh r1, [r2]
	adds r2, r5, #0
	strh r1, [r5, #0x16]
	adds r2, #0x18
	adds r0, #0x20
	movs r1, #2
_0801D3E2:
	ldrb r3, [r0]
	subs r1, #1
	strb r3, [r2]
	adds r0, #1
	adds r2, #1
	cmp r1, #0
	bge _0801D3E2
	ldr r1, _0801D43C
	ldrh r3, [r1, #0x24]
	adds r1, #0x26
	ldrb r0, [r1]
	movs r2, #0x16
	strb r2, [r5, #0x1b]
	strh r3, [r5, #0x1c]
	strb r0, [r5, #0x1e]
	movs r1, #0
	movs r0, #0
_0801D404:
	ldrb r2, [r5, r1]
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	subs r0, r3, r2
	lsls r2, r0, #0x10
	adds r1, #1
	asrs r0, r2, #0x10
	cmp r1, #0xfd
	ble _0801D404
	adds r2, r5, #0
	adds r2, #0xfe
	strh r0, [r2]
	ldr r1, _0801D440
	ldr r0, _0801D444
	movs r2, #0x80
	str r1, [r0]
	lsls r3, r2, #1
	ldr r1, _0801D448
	adds r2, r5, r3
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801D438:
	.4byte gUnk_080000AC
_0801D43C:
	.4byte 0x0202D74C
_0801D440:
	.4byte 0x0202D948
_0801D444:
	.4byte 0x040000D4
_0801D448:
	.4byte 0x80000080

	.global sub_0801D44C
	.thumb_func
	.type sub_0801D44C, %function
sub_0801D44C: @ 0801D44C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, _0801D4D4
	ldr r1, [r5, #4]
	str r1, [r2, #0x1c]
	adds r1, r2, #0
	movs r4, #0
	movs r6, #0xf
	adds r0, #8
	adds r1, #0x6c
_0801D460:
	ldrb r2, [r0]
	adds r3, r6, #0
	ands r3, r2
	lsls r2, r2, #0x18
	strb r3, [r1]
	adds r4, #1
	lsrs r3, r2, #0x1c
	strb r3, [r1, #0xc]
	adds r0, #1
	adds r1, #1
	cmp r4, #0xb
	ble _0801D460
	ldrb r4, [r5, #0x14]
	ldr r1, _0801D4D4
	lsls r0, r4, #0x1c
	lsrs r2, r0, #0x1c
	lsls r3, r4, #0x18
	movs r4, #0xfc
	strh r2, [r1, #0x16]
	lsrs r0, r3, #0x1c
	lsls r2, r4, #1
	ldrh r3, [r5, #0x16]
	adds r4, r1, r2
	adds r2, r5, #0
	strh r0, [r1, #0x18]
	adds r2, #0x18
	strh r3, [r4]
	adds r1, #0x20
	movs r4, #2
_0801D49A:
	ldrb r0, [r2]
	subs r4, #1
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	cmp r4, #0
	bge _0801D49A
	movs r2, #0x80
	ldr r0, _0801D4D8
	lsls r3, r2, #1
	adds r2, r5, r3
	str r2, [r0]
	ldr r1, _0801D4DC
	ldr r2, _0801D4E0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r2, _0801D4E4
	ldr r3, [r0, #8]
	adds r0, r1, r2
	ldrh r2, [r5, #0x1c]
	strh r2, [r0, #0x24]
	ldr r0, _0801D4E8
	ldrb r3, [r5, #0x1e]
	adds r2, r1, r0
	strb r3, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801D4D4:
	.4byte 0x0202D74C
_0801D4D8:
	.4byte 0x040000D4
_0801D4DC:
	.4byte 0x0202D948
_0801D4E0:
	.4byte 0x80000080
_0801D4E4:
	.4byte 0xFFFFFE04
_0801D4E8:
	.4byte 0xFFFFFE2A

	.global sub_0801D4EC
	.thumb_func
	.type sub_0801D4EC, %function
sub_0801D4EC: @ 0801D4EC
	push {r4, lr}
	ldr r2, _0801D528
	ldr r0, _0801D524
	adds r3, r2, #0
	movs r1, #0
	adds r3, #0x26
	strh r0, [r2, #0x16]
	str r1, [r2, #0x1c]
	strh r1, [r2, #0x18]
	strh r1, [r2, #0x24]
	strb r0, [r3]
	movs r0, #0
	adds r3, #0x46
_0801D506:
	adds r1, #1
	strb r0, [r3]
	strb r0, [r3, #0xc]
	adds r3, #1
	cmp r1, #0xb
	ble _0801D506
	movs r3, #0x80
	lsls r4, r3, #2
	adds r3, r2, r4
	ldr r0, _0801D524
	subs r4, #4
	movs r1, #0
	adds r2, r2, r4
	b _0801D52C
	.byte 0x00, 0x00
_0801D524:
	.4byte 0x00000000
_0801D528:
	.4byte 0x0202D74C
_0801D52C:
	adds r1, #1
	strh r0, [r2]
	strh r0, [r3]
	strh r0, [r2, #2]
	strh r0, [r3, #2]
	adds r2, #8
	adds r3, #8
	cmp r1, #0x1f
	ble _0801D52C
	ldr r3, _0801D558
	movs r2, #0
	adds r3, #0x20
	movs r1, #2
_0801D546:
	subs r1, #1
	strb r2, [r3]
	adds r3, #1
	cmp r1, #0
	bge _0801D546
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801D558:
	.4byte 0x0202D74C

	.global eeprom_load
	.thumb_func
	.type eeprom_load, %function
eeprom_load: @ 0801D55C
	push {r4, r5, r6, lr}
	sub sp, #4
	mov r1, sp
	ldr r0, _0801D59C
	adds r1, #2
	strh r0, [r1]
	ldr r0, _0801D5A0
	ldr r2, _0801D5A4
	str r1, [r0]
	ldr r1, _0801D5A8
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	movs r0, #4
	bl sub_080325E0
	ldr r1, _0801D5AC
	movs r0, #2
	bl sub_08032648
	ldr r0, _0801D5B0
	ldr r1, _0801D5B4
	bl AGBPrintf
	bl AGBPrintFlush
	bl sub_0801E1A0
	ldr r4, _0801D5B8
	ldr r6, _0801D5BC
	movs r5, #0
	b _0801D5C0
_0801D59C:
	.4byte 0x00000000
_0801D5A0:
	.4byte 0x040000D4
_0801D5A4:
	.4byte 0x0202D74C
_0801D5A8:
	.4byte 0x8100017E
_0801D5AC:
	.4byte 0x03005634
_0801D5B0:
	.4byte gUnk_08051A60
_0801D5B4:
	.4byte gUnk_08051A74
_0801D5B8:
	.4byte 0x0202DA48
_0801D5BC:
	.4byte 0x0202DC48
_0801D5C0:
	lsls r3, r5, #0x10
	adds r1, r4, #0
	lsrs r0, r3, #0x10
	bl sub_080327CC
	ldr r2, [r4]
	str r2, [r6]
	ldr r1, [r4, #4]
	adds r5, #1
	str r1, [r6, #4]
	adds r4, #8
	adds r6, #8
	cmp r5, #0x3f
	ble _0801D5C0
	bl sub_0801E1B4
	ldr r0, _0801D628
	ldr r2, _0801D62C
	ldr r3, [r0]
	ldr r1, [r2]
	cmp r3, r1
	beq _0801D66C
_0801D5EC:
	movs r3, #0
_0801D5EE:
	cmp r3, #0
	beq _0801D64A
_0801D5F2:
	ldr r2, _0801D630
	ldr r0, _0801D61C
	ldr r1, _0801D620
	strh r0, [r2, #0x14]
	strh r0, [r2]
	strh r0, [r2, #2]
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x88
	strh r1, [r0]
	ldr r1, _0801D624
	subs r0, #2
	strh r1, [r0]
	movs r0, #1
	rsbs r1, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	movs r3, #0
	adds r1, #0x3e
	adds r2, #4
	b _0801D634
_0801D61C:
	.4byte 0x00000000
_0801D620:
	.4byte 0x00000008
_0801D624:
	.4byte 0x00000006
_0801D628:
	.4byte 0x0202DA48
_0801D62C:
	.4byte gUnk_080000AC
_0801D630:
	.4byte 0x0202D74C
_0801D634:
	strh r3, [r2]
	adds r3, #1
	strb r0, [r1]
	adds r2, #2
	adds r1, #1
	cmp r3, #7
	ble _0801D634
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801D64A:
	bl sub_0801D4EC
	ldr r3, _0801D660
	ldr r1, _0801D664
	ldr r0, _0801D668
	strh r3, [r1, #0x18]
	bl sub_0801D384
	bl eeprom_update
	b _0801D5F2
_0801D660:
	.4byte 0xFFFFFFFF
_0801D664:
	.4byte 0x0202D74C
_0801D668:
	.4byte 0x0202DC48
_0801D66C:
	ldrb r2, [r0, #0x1b]
	cmp r2, #0x16
	bne _0801D5EC
	bl sub_0801D44C
	ldr r2, _0801D690
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	cmp r0, #5
	ble _0801D68A
	ldr r0, _0801D694
	bl AGBPrintf
	bl sub_0801D4EC
_0801D68A:
	movs r3, #1
	b _0801D5EE
	.byte 0x00, 0x00
_0801D690:
	.4byte 0x0202D74C
_0801D694:
	.4byte gUnk_08051A80

	.global sub_0801D698
	.thumb_func
	.type sub_0801D698, %function
sub_0801D698: @ 0801D698
	push {lr}
	ldr r0, _0801D6A8
	bl sub_0801D384
	bl eeprom_update
	pop {r0}
	bx r0
_0801D6A8:
	.4byte 0x0202DC48

	.global sub_0801D6AC
	.thumb_func
	.type sub_0801D6AC, %function
sub_0801D6AC: @ 0801D6AC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r2, _0801D73C
	mov r5, sp
	ldrh r1, [r2]
	strh r1, [r5]
	ldrh r1, [r2, #2]
	strh r1, [r5, #2]
	ldrh r1, [r2, #4]
	strh r1, [r5, #4]
	ldrh r1, [r2, #6]
	strh r1, [r5, #6]
	adds r2, #8
	ldrh r0, [r2]
	ldr r2, _0801D740
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r1, [r2]
	cmp r1, #0
	bne _0801D6D6
	b _0801D9C0
_0801D6D6:
	ldr r4, _0801D744
	ldr r1, [r4]
	cmp r1, #0
	bne _0801D6E0
	b _0801D820
_0801D6E0:
	ldr r6, _0801D748
	ldr r0, _0801D74C
	movs r4, #0
	adds r1, r5, #0
_0801D6E8:
	ldr r3, [r6]
	ldm r0!, {r2}
	lsls r3, r3, #1
	adds r3, r3, r2
	ldrh r2, [r1]
	adds r4, #1
	adds r1, #2
	strh r2, [r3]
	cmp r4, #3
	ble _0801D6E8
	ldr r1, _0801D748
	ldr r3, [r1]
	adds r3, #1
	str r3, [r1]
	ldr r2, [r1]
	cmp r2, #4
	beq _0801D760
	ldr r1, _0801D750
	ldr r2, [r1]
	cmp r2, #3
	bhi _0801D732
	ldr r3, _0801D754
	ldr r0, [r1]
	ldr r2, [r3]
	lsls r3, r0, #1
	adds r0, r3, r2
	ldrh r2, [r0]
	ldr r0, _0801D758
	strh r2, [r0]
	ldr r2, [r1]
	adds r2, #1
	str r2, [r1]
	ldr r1, _0801D75C
	ldr r0, [r1]
	cmp r0, #0
	bne _0801D732
	b _0801D880
_0801D732:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801D73C:
	.4byte 0x04000120
_0801D740:
	.4byte 0x0202DE74
_0801D744:
	.4byte 0x0202DE70
_0801D748:
	.4byte 0x0202DE7C
_0801D74C:
	.4byte gUnk_0884EC98
_0801D750:
	.4byte 0x0202DE78
_0801D754:
	.4byte gUnk_0884EC94
_0801D758:
	.4byte 0x0400012A
_0801D75C:
	.4byte gLocalPlayerIndex
_0801D760:
	ldr r0, _0801D7D4
	ldr r3, [r0]
	movs r4, #0
	movs r7, #1
	cmp r4, r3
	bge _0801D7B4
	ldr r5, _0801D7D8
	ldr r6, _0801D7DC
	mov ip, r3
_0801D772:
	ldm r6!, {r1}
	movs r3, #0
	movs r0, #0
_0801D778:
	ldrh r2, [r1]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r3, r3, r2
	lsls r2, r3, #0x10
	adds r0, #1
	asrs r3, r2, #0x10
	adds r1, #2
	cmp r0, #2
	bls _0801D778
	ldr r0, _0801D7E0
	mvns r1, r3
	adds r3, r1, r0
	lsls r0, r4, #3
	adds r2, r0, #4
	adds r1, r2, r5
	lsls r3, r3, #0x10
	ldrh r2, [r1, #2]
	lsrs r3, r3, #0x10
	cmp r3, r2
	beq _0801D7AE
	ldr r2, _0801D7CC
	strh r2, [r1]
	ldrh r3, [r1]
	adds r7, r0, r5
	strh r3, [r7, #2]
	movs r7, #0
_0801D7AE:
	adds r4, #1
	cmp r4, ip
	blt _0801D772
_0801D7B4:
	cmp r7, #0
	beq _0801D804
	ldr r1, _0801D7E4
	ldr r3, _0801D7D0
	strh r3, [r1]
	ldr r1, _0801D7E8
	movs r0, #0
	str r0, [r1]
_0801D7C4:
	ldr r0, _0801D7EC
	ldr r2, [r0]
	b _0801D7F0
	.byte 0x00, 0x00
_0801D7CC:
	.4byte 0x00000000
_0801D7D0:
	.4byte 0x0000FEA2
_0801D7D4:
	.4byte 0x0202DE5C
_0801D7D8:
	.4byte 0x0202DE88
_0801D7DC:
	.4byte gUnk_0884EC98
_0801D7E0:
	.4byte 0x0000FFF8
_0801D7E4:
	.4byte 0x0400012A
_0801D7E8:
	.4byte 0x0202DE6C
_0801D7EC:
	.4byte gLocalPlayerIndex
_0801D7F0:
	cmp r2, #0
	beq _0801D7FC
_0801D7F4:
	ldr r0, _0801D814
	movs r1, #0
	str r1, [r0]
	b _0801D732
_0801D7FC:
	ldr r3, _0801D80C
	ldr r1, _0801D818
	strh r3, [r1]
	b _0801D7F4
_0801D804:
	ldr r1, _0801D810
	ldr r0, _0801D81C
	strh r1, [r0]
	b _0801D7C4
_0801D80C:
	.4byte 0x000000C0
_0801D810:
	.4byte 0x00001331
_0801D814:
	.4byte 0x0202DE70
_0801D818:
	.4byte 0x0400010E
_0801D81C:
	.4byte 0x0400012A
_0801D820:
	ldrh r3, [r5]
	ldr r4, _0801D8A0
	cmp r3, r4
	bne _0801D82A
	b _0801D95C
_0801D82A:
	ldrh r3, [r5]
	ldr r0, _0801D8A4
	cmp r3, r0
	beq _0801D8D8
	ldr r4, _0801D8A8
	cmp r3, r4
	beq _0801D8C8
	ldr r0, _0801D8AC
	cmp r3, r0
	beq _0801D88C
	ldr r1, _0801D8B0
	ldr r2, [r1]
	cmp r2, #0
	beq _0801D848
	b _0801D732
_0801D848:
	ldr r6, _0801D8B4
	ldr r3, [r6]
	movs r0, #0
	cmp r0, r3
	bge _0801D868
	ldr r4, _0801D8B8
	adds r1, r5, #0
	adds r2, r3, #0
_0801D858:
	ldrh r3, [r1]
	mov ip, r3
	adds r1, #2
	cmp ip, r4
	beq _0801D888
_0801D862:
	subs r2, #1
	cmp r2, #0
	bne _0801D858
_0801D868:
	ldr r2, [r6]
	cmp r0, r2
	bne _0801D870
	b _0801D732
_0801D870:
	ldr r0, _0801D8BC
	ldr r3, _0801D898
	ldr r1, _0801D8B0
	strh r3, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _0801D880
	b _0801D732
_0801D880:
	ldr r0, _0801D89C
	ldr r1, _0801D8C0
	strh r0, [r1]
	b _0801D732
_0801D888:
	adds r0, #1
	b _0801D862
_0801D88C:
	ldr r1, _0801D8C4
	movs r0, #6
	movs r3, #0
	str r0, [r2]
	str r3, [r1]
	b _0801D732
_0801D898:
	.4byte 0x0000FEA2
_0801D89C:
	.4byte 0x000000C0
_0801D8A0:
	.4byte 0x0000A25E
_0801D8A4:
	.4byte 0x0000BEEF
_0801D8A8:
	.4byte 0x00002A2E
_0801D8AC:
	.4byte 0x0000DEAD
_0801D8B0:
	.4byte gLocalPlayerIndex
_0801D8B4:
	.4byte 0x0202DE5C
_0801D8B8:
	.4byte 0x0000FEA2
_0801D8BC:
	.4byte 0x0400012A
_0801D8C0:
	.4byte 0x0400010E
_0801D8C4:
	.4byte 0x0202DE6C
_0801D8C8:
	movs r1, #4
	str r1, [r2]
	ldr r1, _0801D8D4
	movs r0, #0
	str r0, [r1]
	b _0801D732
_0801D8D4:
	.4byte 0x0202DE6C
_0801D8D8:
	ldr r0, _0801D920
	ldr r2, [r0]
	cmp r2, #0
	ble _0801D8EA
	ldr r3, _0801D924
	ldr r1, _0801D91C
	ldrh r2, [r3]
	orrs r2, r1
	strh r2, [r3]
_0801D8EA:
	ldr r1, _0801D928
	ldr r3, _0801D92C
	movs r2, #0
	str r2, [r1]
	str r2, [r3]
	ldr r3, _0801D930
	movs r2, #1
	str r2, [r3]
	ldr r3, _0801D934
	str r2, [r3]
	ldr r2, [r1]
	cmp r2, #3
	bls _0801D906
	b _0801D732
_0801D906:
	ldr r2, _0801D938
	ldr r3, [r1]
	ldr r2, [r2]
	lsls r3, r3, #1
	adds r3, r3, r2
	ldrh r2, [r3]
	ldr r3, _0801D93C
	strh r2, [r3]
	ldr r2, [r1]
	b _0801D940
	.byte 0x00, 0x00
_0801D91C:
	.4byte 0x00000080
_0801D920:
	.4byte gLocalPlayerIndex
_0801D924:
	.4byte 0x03005664
_0801D928:
	.4byte 0x0202DE78
_0801D92C:
	.4byte 0x0202DE7C
_0801D930:
	.4byte 0x0202DE70
_0801D934:
	.4byte 0x0202DE6C
_0801D938:
	.4byte gUnk_0884EC94
_0801D93C:
	.4byte 0x0400012A
_0801D940:
	adds r2, #1
	str r2, [r1]
	ldr r1, [r0]
	cmp r1, #0
	beq _0801D94C
	b _0801D732
_0801D94C:
	ldr r3, _0801D954
	ldr r0, _0801D958
	strh r3, [r0]
	b _0801D732
_0801D954:
	.4byte 0x000000C0
_0801D958:
	.4byte 0x0400010E
_0801D95C:
	ldr r6, _0801D9CC
	ldr r4, _0801D9D0
	movs r2, #0xc0
	movs r3, #5
	str r3, [r6]
	str r1, [r4]
	lsls r6, r0, #0x10
	lsls r4, r2, #0xe
	ands r4, r6
	ldr r2, _0801D9D4
	ldr r6, _0801D9D8
	lsrs r0, r4, #0x14
	ldr r4, _0801D9DC
	str r0, [r6]
	str r1, [r2]
	adds r6, r5, #0
	movs r1, #0
	adds r0, r2, #0
_0801D980:
	lsls r3, r1, #1
	ldrh r2, [r6, r3]
	cmp r2, r4
	beq _0801D9BC
	adds r2, r1, #1
	ldr r1, [r0]
	cmp r2, r1
	ble _0801D992
	str r2, [r0]
_0801D992:
	adds r1, r2, #0
	cmp r1, #3
	ble _0801D980
	ldr r2, _0801D9E0
	movs r0, #0
	ldr r4, _0801D9E4
	str r0, [r2]
	movs r1, #0
	adds r0, r5, #0
_0801D9A4:
	ldrh r3, [r0]
	cmp r3, r4
	beq _0801D9B4
_0801D9AA:
	adds r1, #1
	adds r0, #2
	cmp r1, #3
	ble _0801D9A4
	b _0801D732
_0801D9B4:
	ldr r3, [r2]
	adds r3, #1
	str r3, [r2]
	b _0801D9AA
_0801D9BC:
	adds r2, r1, #1
	b _0801D992
_0801D9C0:
	ldr r3, _0801D9C8
	ldr r1, _0801D9E8
	strh r3, [r1]
	b _0801D732
_0801D9C8:
	.4byte 0x00001331
_0801D9CC:
	.4byte 0x0202DE68
_0801D9D0:
	.4byte 0x0202DE6C
_0801D9D4:
	.4byte 0x0202DE5C
_0801D9D8:
	.4byte gLocalPlayerIndex
_0801D9DC:
	.4byte 0x0000FFFF
_0801D9E0:
	.4byte 0x0202DE60
_0801D9E4:
	.4byte 0x0000A25E
_0801D9E8:
	.4byte 0x0400012A

	.global sub_0801D9EC
	.thumb_func
	.type sub_0801D9EC, %function
sub_0801D9EC: @ 0801D9EC
	push {r4, lr}
	ldr r3, _0801DA20
	ldr r4, _0801DA2C
	ldr r0, _0801DA24
	strh r3, [r4]
	subs r4, #0xd4
	strh r3, [r4]
	subs r4, #0xc
	strh r0, [r4]
	adds r4, #2
	strh r3, [r4]
	ldr r4, _0801DA30
	movs r2, #0x41
	ldrh r1, [r4]
	rsbs r0, r2, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, _0801DA28
	ldrh r1, [r4]
	orrs r1, r3
	strh r1, [r4]
	ldr r2, _0801DA34
	ldr r4, _0801DA38
	ldr r0, _0801DA3C
	str r2, [r4, #0x18]
	b _0801DA40
_0801DA20:
	.4byte 0x00000000
_0801DA24:
	.4byte 0x00006003
_0801DA28:
	.4byte 0x00000080
_0801DA2C:
	.4byte 0x04000208
_0801DA30:
	.4byte 0x04000200
_0801DA34:
	.4byte sub_0801DFC4
_0801DA38:
	.4byte 0x03005620
_0801DA3C:
	.4byte sub_0801D6AC
_0801DA40:
	str r0, [r4, #0x1c]
	ldr r1, _0801DA94
	ldr r2, _0801DA98
	ldr r0, _0801DA9C
	movs r4, #0
	str r4, [r1]
	strh r4, [r2]
	ldr r1, _0801DAA0
	strh r4, [r0]
	ldr r2, _0801DAA4
	ldr r0, _0801DAA8
	movs r3, #1
	str r4, [r1]
	str r3, [r2]
	ldr r1, _0801DAAC
	str r4, [r0]
	ldr r0, _0801DAB0
	movs r2, #5
	str r4, [r1]
	str r2, [r0]
	ldr r0, _0801DAB4
	ldr r1, _0801DA8C
	str r4, [r0]
	ldr r4, _0801DAB8
	ldr r0, _0801DABC
	movs r3, #0
	movs r2, #3
_0801DA76:
	subs r2, #1
	strh r1, [r3, r0]
	strh r1, [r3, r4]
	adds r3, #2
	cmp r2, #0
	bge _0801DA76
	ldr r3, _0801DA90
	ldr r1, _0801DAC0
	strh r3, [r1]
	b _0801DAC4
	.byte 0x00, 0x00
_0801DA8C:
	.4byte 0x00000000
_0801DA90:
	.4byte 0x00000001
_0801DA94:
	.4byte 0x0202DE74
_0801DA98:
	.4byte 0x0202DE64
_0801DA9C:
	.4byte 0x0202DE66
_0801DAA0:
	.4byte gLocalPlayerIndex
_0801DAA4:
	.4byte 0x0202DE5C
_0801DAA8:
	.4byte 0x0202DE60
_0801DAAC:
	.4byte 0x0202DE70
_0801DAB0:
	.4byte 0x0202DE68
_0801DAB4:
	.4byte 0x03005660
_0801DAB8:
	.4byte 0x0202DE48
_0801DABC:
	.4byte 0x0202DE50
_0801DAC0:
	.4byte 0x04000208
_0801DAC4:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global sub_0801DACC
	.thumb_func
	.type sub_0801DACC, %function
sub_0801DACC: @ 0801DACC
	push {r4, lr}
	ldr r0, _0801DAFC
	ldr r4, _0801DB00
	ldrh r2, [r0]
	lsls r1, r2, #0x10
	ldr r2, [r4]
	asrs r3, r1, #0x10
	cmp r2, #2
	bne _0801DAE0
	b _0801DC04
_0801DAE0:
	cmp r2, #2
	bgt _0801DB68
	cmp r2, #1
	beq _0801DB04
_0801DAE8:
	ldr r2, [r4]
	movs r0, #0
	cmp r2, #5
	beq _0801DAF6
_0801DAF0:
	pop {r4}
	pop {r1}
	bx r1
_0801DAF6:
	movs r0, #1
	b _0801DAF0
	.byte 0x00, 0x00
_0801DAFC:
	.4byte 0x04000128
_0801DB00:
	.4byte 0x0202DE74
_0801DB04:
	lsls r4, r3, #0x10
	lsrs r2, r4, #0x10
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	beq _0801DB30
	mvns r1, r2
	movs r2, #0x80
	ands r2, r1
	cmp r2, #0
	beq _0801DB30
	ldr r4, _0801DB50
	ldr r3, _0801DB48
	strh r3, [r4]
	movs r4, #4
	ands r4, r1
	cmp r4, #0
	beq _0801DB30
	ldrh r1, [r0]
	ldr r4, _0801DB4C
	orrs r1, r4
	strh r1, [r0]
_0801DB30:
	ldr r2, _0801DB54
	ldr r0, [r2]
	cmp r0, #0
	ble _0801DB64
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r2, [r2]
	cmp r2, #0
	bne _0801DB64
	ldr r4, _0801DB58
	b _0801DB5C
_0801DB48:
	.4byte 0x0000A25E
_0801DB4C:
	.4byte 0x00000080
_0801DB50:
	.4byte 0x0400012A
_0801DB54:
	.4byte 0x0202DE68
_0801DB58:
	.4byte 0x0202DE5C
_0801DB5C:
	ldr r0, _0801DBAC
	movs r3, #1
	str r2, [r0]
	str r3, [r4]
_0801DB64:
	ldr r4, _0801DBB0
	b _0801DAE8
_0801DB68:
	cmp r2, #3
	beq _0801DBD0
	cmp r2, #6
	bne _0801DAE8
	movs r1, #0
	str r1, [r4]
	ldr r0, _0801DBAC
	ldr r4, _0801DBB4
	ldr r2, _0801DBB8
	movs r3, #1
	str r1, [r0]
	str r3, [r4]
	ldr r0, _0801DBBC
	str r1, [r2]
	ldr r4, _0801DBC0
	ldr r2, _0801DBC4
	movs r3, #5
	str r1, [r0]
	str r3, [r4]
	ldr r0, _0801DBC8
	str r1, [r2]
	ldr r4, _0801DBCC
	ldr r2, _0801DBA8
	movs r3, #0
_0801DB98:
	adds r1, #1
	strh r2, [r3, r0]
	strh r2, [r3, r4]
	adds r3, #2
	cmp r1, #3
	ble _0801DB98
	b _0801DB64
	.byte 0x00, 0x00
_0801DBA8:
	.4byte 0x00000000
_0801DBAC:
	.4byte gLocalPlayerIndex
_0801DBB0:
	.4byte 0x0202DE74
_0801DBB4:
	.4byte 0x0202DE5C
_0801DBB8:
	.4byte 0x0202DE60
_0801DBBC:
	.4byte 0x0202DE70
_0801DBC0:
	.4byte 0x0202DE68
_0801DBC4:
	.4byte 0x03005660
_0801DBC8:
	.4byte 0x0202DE50
_0801DBCC:
	.4byte 0x0202DE48
_0801DBD0:
	lsls r1, r3, #0x10
	lsrs r2, r1, #0x10
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _0801DBDE
	b _0801DAE8
_0801DBDE:
	movs r1, #0x80
	bics r1, r2
	cmp r1, #0
	bne _0801DBE8
	b _0801DAE8
_0801DBE8:
	ldr r3, _0801DBF8
	ldr r1, _0801DC00
	strh r3, [r1]
	ldr r3, _0801DBFC
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	b _0801DAE8
_0801DBF8:
	.4byte 0x0000DEAD
_0801DBFC:
	.4byte 0x00000080
_0801DC00:
	.4byte 0x0400012A
_0801DC04:
	lsls r0, r3, #0x10
	lsrs r2, r0, #0x10
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _0801DC12
	b _0801DAE8
_0801DC12:
	movs r1, #0x80
	bics r1, r2
	cmp r1, #0
	bne _0801DC1C
	b _0801DAE8
_0801DC1C:
	ldr r4, _0801DC30
	ldr r1, _0801DC38
	strh r4, [r1]
	ldr r4, _0801DC3C
	ldr r3, _0801DC34
	ldrh r0, [r4]
	orrs r0, r3
	strh r0, [r4]
	b _0801DB64
	.byte 0x00, 0x00
_0801DC30:
	.4byte 0x00002A2E
_0801DC34:
	.4byte 0x00000080
_0801DC38:
	.4byte 0x0400012A
_0801DC3C:
	.4byte 0x04000128

	.global sub_0801DC40
	.thumb_func
	.type sub_0801DC40, %function
sub_0801DC40: @ 0801DC40
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801DD5C
	ldrh r1, [r4]
	mvns r0, r1
	ldr r1, _0801DD60
	lsls r3, r0, #0x10
	ldrh r2, [r1]
	lsrs r0, r3, #0x10
	bics r0, r2
	ldr r2, _0801DD64
	strh r0, [r2]
	ldr r2, _0801DD68
	asrs r4, r3, #0x10
	strh r4, [r1]
	ldr r1, [r2]
	cmp r1, #5
	beq _0801DC9A
	ldr r1, [r2]
	cmp r1, #4
	beq _0801DC9A
	ldr r2, _0801DD6C
	ldr r1, _0801DD70
	strh r4, [r2]
	strh r0, [r1]
	ldr r2, _0801DD74
	ldr r1, _0801DD78
	strh r4, [r2]
	strh r0, [r1]
	ldr r0, _0801DD7C
	movs r3, #2
	ldrh r1, [r0]
	rsbs r2, r3, #0
	ands r2, r1
	adds r1, r0, #0
	strh r2, [r0]
_0801DC86:
	ldrh r3, [r1]
	movs r0, #1
	bics r0, r3
	cmp r0, #0
	beq _0801DC94
	svc #2
	b _0801DC86
_0801DC94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801DC9A:
	ldr r5, [r2]
	cmp r5, #5
	bne _0801DCA2
	b _0801DDE4
_0801DCA2:
	ldr r1, [r2]
	cmp r1, #4
	bne _0801DCAA
	b _0801DDA0
_0801DCAA:
	ldr r5, _0801DD80
	movs r3, #1
	str r3, [r5]
	ldr r0, _0801DD84
	ldr r5, _0801DD88
	ldr r4, [r0]
	ldr r2, _0801DD60
	strh r4, [r5]
	ldrh r1, [r2]
	ldr r0, _0801DD64
	strh r1, [r5, #2]
	ldr r2, _0801DD8C
	ldrh r4, [r0]
	ldr r1, [r2]
	strh r4, [r5, #4]
	movs r0, #0
	movs r4, #0
_0801DCCC:
	ldrh r2, [r1]
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, r2
	lsls r2, r0, #0x10
	adds r4, #1
	asrs r0, r2, #0x10
	adds r1, #2
	cmp r4, #2
	bls _0801DCCC
	ldr r3, _0801DD90
	mvns r1, r0
	adds r0, r1, r3
	ldr r2, _0801DD94
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r2]
	strh r0, [r5, #6]
	cmp r1, #0
	beq _0801DD1C
	ldr r1, _0801DD7C
	movs r3, #0x81
	ldrh r2, [r1]
	rsbs r0, r3, #0
	ands r0, r2
	strh r0, [r1]
	ldrh r3, [r1]
	movs r0, #0x80
	bics r0, r3
	cmp r0, #0
	beq _0801DC94
	adds r0, r1, #0
	movs r1, #0x80
_0801DD0E:
	svc #2
	ldrh r2, [r0]
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	bne _0801DD0E
	b _0801DC94
_0801DD1C:
	ldr r1, _0801DD7C
	movs r3, #2
	ldrh r2, [r1]
	rsbs r0, r3, #0
	ands r0, r2
	strh r0, [r1]
	ldrh r3, [r1]
	movs r0, #1
	bics r0, r3
	cmp r0, #0
	beq _0801DD42
	adds r0, r1, #0
	movs r1, #1
_0801DD36:
	svc #2
	ldrh r2, [r0]
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	bne _0801DD36
_0801DD42:
	ldr r1, _0801DD54
	ldr r0, _0801DD98
	strh r1, [r0]
	ldr r0, _0801DD9C
	ldr r3, _0801DD58
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	b _0801DC94
_0801DD54:
	.4byte 0x0000BEEF
_0801DD58:
	.4byte 0x00000080
_0801DD5C:
	.4byte 0x04000130
_0801DD60:
	.4byte 0x0202DE66
_0801DD64:
	.4byte 0x0202DE64
_0801DD68:
	.4byte 0x0202DE74
_0801DD6C:
	.4byte 0x0202DE48
_0801DD70:
	.4byte 0x0202DE50
_0801DD74:
	.4byte 0x0300565C
_0801DD78:
	.4byte 0x0300565E
_0801DD7C:
	.4byte 0x03005664
_0801DD80:
	.4byte 0x0202DE6C
_0801DD84:
	.4byte 0x03005660
_0801DD88:
	.4byte 0x0202DE80
_0801DD8C:
	.4byte gUnk_0884EC94
_0801DD90:
	.4byte 0x0000FFF8
_0801DD94:
	.4byte gLocalPlayerIndex
_0801DD98:
	.4byte 0x0400012A
_0801DD9C:
	.4byte 0x04000128
_0801DDA0:
	movs r4, #5
	str r4, [r2]
	ldr r1, _0801DDCC
	ldr r4, _0801DDD0
	ldr r0, _0801DDD4
	movs r3, #0
	movs r2, #3
_0801DDAE:
	subs r2, #1
	strh r1, [r3, r4]
	strh r1, [r3, r0]
	adds r3, #2
	cmp r2, #0
	bge _0801DDAE
	ldr r1, _0801DDCC
	ldr r2, _0801DDD8
	ldr r0, _0801DDDC
	ldr r5, _0801DDE0
	movs r3, #0
	strh r1, [r2]
	str r3, [r5]
	strh r1, [r0]
	b _0801DCAA
_0801DDCC:
	.4byte 0x00000000
_0801DDD0:
	.4byte 0x0202DE48
_0801DDD4:
	.4byte 0x0202DE50
_0801DDD8:
	.4byte 0x0300565C
_0801DDDC:
	.4byte 0x0300565E
_0801DDE0:
	.4byte 0x03005660
_0801DDE4:
	movs r0, #0x80
	ldr r2, _0801DE88
	lsls r4, r0, #9
	ldr r1, _0801DE8C
	str r4, [r2]
	ldr r6, [r1]
	adds r0, r1, #0
	cmp r6, #0
	beq _0801DE10
	ldr r5, [r2]
	cmp r5, #0
	ble _0801DE10
_0801DDFC:
	ldr r6, [r2]
	subs r6, #1
	str r6, [r2]
	ldr r1, [r0]
	cmp r1, #0
	beq _0801DE0E
	ldr r4, [r2]
	cmp r4, #0
	bgt _0801DDFC
_0801DE0E:
	ldr r1, _0801DE8C
_0801DE10:
	ldr r2, [r1]
	cmp r2, #0
	beq _0801DE1C
	ldr r0, _0801DE90
	bl AGBPrintf
_0801DE1C:
	ldr r0, _0801DE94
	ldr r3, [r0]
	cmp r3, #0
	ble _0801DED2
	ldr r5, _0801DE98
	lsls r1, r3, #3
	ldrh r3, [r5, r1]
	ldrh r6, [r5]
	mov ip, r3
	cmp ip, r6
	beq _0801DE46
	ldrh r2, [r5, r1]
	ldrh r0, [r5]
	subs r1, r2, r0
	ldr r0, _0801DE9C
	bl AGBPrintf
	ldrh r4, [r5]
	ldr r1, _0801DEA0
	adds r4, #1
	str r4, [r1]
_0801DE46:
	movs r0, #0
_0801DE48:
	lsls r2, r0, #3
	adds r3, r2, r5
	ldrh r6, [r3, #2]
	ldr r4, _0801DEA4
	lsls r1, r0, #1
	adds r2, #4
	strh r6, [r4, r1]
	ldrh r3, [r5, r2]
	ldr r6, _0801DEA8
	adds r0, #1
	strh r3, [r6, r1]
	cmp r0, #3
	ble _0801DE48
	ldr r5, _0801DEAC
	ldr r0, _0801DE84
	ldr r1, _0801DEB0
	ldr r2, _0801DEB4
	ldr r3, [r5]
	strh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	cmp r0, r3
	blt _0801DE78
	b _0801DCAA
_0801DE78:
	adds r5, r1, #0
	adds r7, r4, #0
	mov ip, r3
	adds r4, r2, #0
	movs r1, #0
	b _0801DEB8
_0801DE84:
	.4byte 0x00000000
_0801DE88:
	.4byte 0x0202DE68
_0801DE8C:
	.4byte 0x0202DE6C
_0801DE90:
	.4byte gUnk_08051AA8
_0801DE94:
	.4byte gLocalPlayerIndex
_0801DE98:
	.4byte 0x0202DE88
_0801DE9C:
	.4byte gUnk_08051AB4
_0801DEA0:
	.4byte 0x03005660
_0801DEA4:
	.4byte 0x0202DE48
_0801DEA8:
	.4byte 0x0202DE50
_0801DEAC:
	.4byte 0x0202DE5C
_0801DEB0:
	.4byte 0x0300565C
_0801DEB4:
	.4byte 0x0300565E
_0801DEB8:
	ldrh r2, [r1, r7]
	ldrh r3, [r5]
	orrs r3, r2
	strh r3, [r5]
	ldrh r2, [r1, r6]
	ldrh r3, [r4]
	adds r0, #1
	orrs r3, r2
	strh r3, [r4]
	adds r1, #2
	cmp r0, ip
	blt _0801DEB8
	b _0801DCAA
_0801DED2:
	ldr r5, _0801DED8
	b _0801DE46
	.byte 0x00, 0x00
_0801DED8:
	.4byte 0x0202DE88

	.global sub_0801DEDC
	.thumb_func
	.type sub_0801DEDC, %function
sub_0801DEDC: @ 0801DEDC
	ldr r0, _0801DEE4
	movs r1, #1
	str r1, [r0]
	bx lr
_0801DEE4:
	.4byte 0x0202DE74

	.global sub_0801DEE8
	.thumb_func
	.type sub_0801DEE8, %function
sub_0801DEE8: @ 0801DEE8
	ldr r0, _0801DEF0
	movs r1, #6
	str r1, [r0]
	bx lr
_0801DEF0:
	.4byte 0x0202DE74

	.global sub_0801DEF4
	.thumb_func
	.type sub_0801DEF4, %function
sub_0801DEF4: @ 0801DEF4
	ldr r0, _0801DF2C
	movs r1, #2
	str r1, [r0]
	ldr r2, _0801DF1C
	ldr r0, _0801DF30
	ldr r1, _0801DF34
	strh r2, [r0]
	ldr r2, _0801DF20
	ldrh r3, [r1]
	orrs r3, r2
	strh r3, [r1]
	ldr r3, _0801DF24
	ldr r1, _0801DF38
	strh r3, [r1]
	ldr r3, _0801DF3C
	subs r1, #0xf6
	str r3, [r1]
	ldr r1, _0801DF28
	strh r1, [r0]
	b _0801DF40
_0801DF1C:
	.4byte 0x00000000
_0801DF20:
	.4byte 0x00000040
_0801DF24:
	.4byte 0x000000C0
_0801DF28:
	.4byte 0x00000001
_0801DF2C:
	.4byte 0x0202DE74
_0801DF30:
	.4byte 0x04000208
_0801DF34:
	.4byte 0x04000200
_0801DF38:
	.4byte 0x04000202
_0801DF3C:
	.4byte 0x000097FA
_0801DF40:
	bx lr
	.byte 0x00, 0x00

	.global sub_0801DF44
	.thumb_func
	.type sub_0801DF44, %function
sub_0801DF44: @ 0801DF44
	push {lr}
	ldr r2, _0801DF68
	ldr r1, [r2]
	movs r0, #0
	cmp r1, #0
	beq _0801DF54
_0801DF50:
	pop {r1}
	bx r1
_0801DF54:
	ldr r1, _0801DF6C
	ldr r2, [r1]
	cmp r2, #1
	ble _0801DF50
	ldr r3, _0801DF70
	ldr r1, [r3]
	cmp r2, r1
	bne _0801DF50
	movs r0, #1
	b _0801DF50
_0801DF68:
	.4byte gLocalPlayerIndex
_0801DF6C:
	.4byte 0x0202DE5C
_0801DF70:
	.4byte 0x0202DE60

	.global sub_0801DF74
	.thumb_func
	.type sub_0801DF74, %function
sub_0801DF74: @ 0801DF74
	push {r4, lr}
	ldr r0, _0801DFAC
	movs r4, #3
	str r4, [r0]
	ldr r4, _0801DFB0
	ldr r0, _0801DFA0
	ldr r1, _0801DFB4
	strh r0, [r4]
	movs r3, #0x41
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	ldr r3, _0801DFA4
	ldr r1, _0801DFB8
	strh r3, [r1]
	subs r1, #0xf4
	strh r0, [r1]
	ldr r0, _0801DFA8
	strh r0, [r4]
	b _0801DFBC
	.byte 0x00, 0x00
_0801DFA0:
	.4byte 0x00000000
_0801DFA4:
	.4byte 0x000000C0
_0801DFA8:
	.4byte 0x00000001
_0801DFAC:
	.4byte 0x0202DE74
_0801DFB0:
	.4byte 0x04000208
_0801DFB4:
	.4byte 0x04000200
_0801DFB8:
	.4byte 0x04000202
_0801DFBC:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global sub_0801DFC4
	.thumb_func
	.type sub_0801DFC4, %function
sub_0801DFC4: @ 0801DFC4
	ldr r1, _0801DFD8
	ldr r0, _0801DFE0
	strh r1, [r0]
	ldr r0, _0801DFE4
	ldr r3, _0801DFDC
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	b _0801DFE8
	.byte 0x00, 0x00
_0801DFD8:
	.4byte 0x00000000
_0801DFDC:
	.4byte 0x00000080
_0801DFE0:
	.4byte 0x0400010E
_0801DFE4:
	.4byte 0x04000128
_0801DFE8:
	bx lr
	.byte 0xC0, 0x46

	.global music_play_if_changed
	.thumb_func
	.type music_play_if_changed, %function
music_play_if_changed: @ 0801DFEC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	blt _0801E00E
	bl sub_0802F260
	cmp r0, r4
	beq _0801E008
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
_0801E008:
	pop {r4}
	pop {r0}
	bx r0
_0801E00E:
	bl sub_0802F070
	b _0801E008

	.global sub_0801E014
	.thumb_func
	.type sub_0801E014, %function
sub_0801E014: @ 0801E014
	push {r4, r5, r6, lr}
	ldr r1, _0801E06C
	ldr r3, [r1, #4]
	str r0, [r1]
	cmp r3, #0
	blt _0801E064
	lsls r1, r0, #4
	asrs r6, r1, #4
_0801E024:
	ldr r5, _0801E06C
	ldr r2, [r5, #4]
	ldr r1, [r5]
	cmp r2, #0
	ble _0801E05E
	movs r4, #0x10
	subs r0, r4, r2
	muls r0, r1, r0
	asrs r3, r0, #4
_0801E036:
	ldr r4, _0801E070
	lsls r1, r3, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0x10]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F09C
	lsls r1, r6, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F0A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E05E:
	lsls r2, r1, #4
	asrs r3, r2, #4
	b _0801E036
_0801E064:
	adds r3, #0x10
	muls r3, r0, r3
	asrs r6, r3, #4
	b _0801E024
_0801E06C:
	.4byte 0x0202DEA8
_0801E070:
	.4byte gUnk_08051AD4

	.global sub_0801E074
	.thumb_func
	.type sub_0801E074, %function
sub_0801E074: @ 0801E074
	push {r4, r5, r6, lr}
	ldr r1, _0801E0D0
	ldr r3, [r1, #4]
	str r0, [r1, #0x10]
	ldr r2, [r1]
	cmp r3, #0
	blt _0801E0C6
	lsls r0, r2, #4
	asrs r6, r0, #4
_0801E086:
	ldr r5, _0801E0D0
	ldr r2, [r5, #4]
	ldr r1, [r5]
	cmp r2, #0
	ble _0801E0C0
	movs r0, #0x10
	subs r4, r0, r2
	muls r4, r1, r4
	asrs r3, r4, #4
_0801E098:
	ldr r4, _0801E0D4
	lsls r1, r3, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0x10]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F09C
	lsls r1, r6, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F0A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E0C0:
	lsls r2, r1, #4
	asrs r3, r2, #4
	b _0801E098
_0801E0C6:
	adds r3, #0x10
	muls r3, r2, r3
	asrs r6, r3, #4
	b _0801E086
	.byte 0x00, 0x00
_0801E0D0:
	.4byte 0x0202DEA8
_0801E0D4:
	.4byte gUnk_08051AD4

	.global sub_0801E0D8
	.thumb_func
	.type sub_0801E0D8, %function
sub_0801E0D8: @ 0801E0D8
	push {r4, r5, r6, lr}
	ldr r1, _0801E134
	ldr r3, [r1, #4]
	str r0, [r1, #0xc]
	ldr r2, [r1]
	cmp r3, #0
	blt _0801E12A
	lsls r0, r2, #4
	asrs r6, r0, #4
_0801E0EA:
	ldr r5, _0801E134
	ldr r2, [r5, #4]
	ldr r1, [r5]
	cmp r2, #0
	ble _0801E124
	movs r0, #0x10
	subs r4, r0, r2
	muls r4, r1, r4
	asrs r3, r4, #4
_0801E0FC:
	ldr r4, _0801E138
	lsls r1, r3, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0x10]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F09C
	lsls r1, r6, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F0A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E124:
	lsls r2, r1, #4
	asrs r3, r2, #4
	b _0801E0FC
_0801E12A:
	adds r3, #0x10
	muls r3, r2, r3
	asrs r6, r3, #4
	b _0801E0EA
	.byte 0x00, 0x00
_0801E134:
	.4byte 0x0202DEA8
_0801E138:
	.4byte gUnk_08051AD4

	.global sub_0801E13C
	.thumb_func
	.type sub_0801E13C, %function
sub_0801E13C: @ 0801E13C
	push {r4, r5, r6, lr}
	ldr r1, _0801E198
	str r0, [r1, #4]
	ldr r2, [r1]
	cmp r0, #0
	blt _0801E18C
	lsls r0, r2, #4
	asrs r6, r0, #4
_0801E14C:
	ldr r5, _0801E198
	ldr r2, [r5, #4]
	ldr r1, [r5]
	cmp r2, #0
	ble _0801E186
	movs r0, #0x10
	subs r4, r0, r2
	muls r4, r1, r4
	asrs r3, r4, #4
_0801E15E:
	ldr r4, _0801E19C
	lsls r1, r3, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0x10]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F09C
	lsls r1, r6, #2
	ldr r0, [r4, r1]
	ldr r2, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r0, r1, #7
	bl sub_0802F0A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E186:
	lsls r2, r1, #4
	asrs r3, r2, #4
	b _0801E15E
_0801E18C:
	adds r1, r0, #0
	adds r1, #0x10
	muls r1, r2, r1
	asrs r6, r1, #4
	b _0801E14C
	.byte 0x00, 0x00
_0801E198:
	.4byte 0x0202DEA8
_0801E19C:
	.4byte gUnk_08051AD4

	.global sub_0801E1A0
	.thumb_func
	.type sub_0801E1A0, %function
sub_0801E1A0: @ 0801E1A0
	push {lr}
	ldr r0, _0801E1B0
	movs r1, #0
	str r1, [r0, #8]
	bl sub_0802F1C2
	pop {r0}
	bx r0
_0801E1B0:
	.4byte 0x0202DEA8

	.global sub_0801E1B4
	.thumb_func
	.type sub_0801E1B4, %function
sub_0801E1B4: @ 0801E1B4
	ldr r0, _0801E1BC
	movs r1, #1
	str r1, [r0, #8]
	bx lr
_0801E1BC:
	.4byte 0x0202DEA8

	.global sub_0801E1C0
	.thumb_func
	.type sub_0801E1C0, %function
sub_0801E1C0: @ 0801E1C0
	push {lr}
	ldr r1, _0801E1D4
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0801E1CE
	bl sub_0802D818
_0801E1CE:
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801E1D4:
	.4byte 0x0202DEA8

	.global sub_0801E1D8
	.thumb_func
	.type sub_0801E1D8, %function
sub_0801E1D8: @ 0801E1D8
	push {lr}
	bl sub_0802D80C
	ldr r0, _0801E1FC
	movs r1, #0
	str r1, [r0, #4]
	movs r2, #0x10
	movs r1, #1
	str r2, [r0]
	str r1, [r0, #8]
	movs r2, #0x7f
	movs r1, #0x46
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	bl sub_0802F0E2
	pop {r0}
	bx r0
_0801E1FC:
	.4byte 0x0202DEA8

	.global sub_0801E200
	.thumb_func
	.type sub_0801E200, %function
sub_0801E200: @ 0801E200
	ldr r0, _0801E214
	ldr r2, _0801E218
	movs r1, #0
	str r1, [r2]
	str r1, [r0]
	ldr r0, _0801E21C
	subs r1, #1
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_0801E214:
	.4byte 0x0202DEC0
_0801E218:
	.4byte 0x0202DEBC
_0801E21C:
	.4byte 0x0202DEC4

	.global sub_0801E220
	.thumb_func
	.type sub_0801E220, %function
sub_0801E220: @ 0801E220
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _0801E250
	ldr r0, _0801E280
	movs r1, #0
	str r1, [r0]
	ldr r0, _0801E284
	str r1, [r0]
	cmp r4, #0
	blt _0801E278
	bl sub_0802F260
	cmp r0, r4
	beq _0801E24A
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
_0801E24A:
	pop {r4}
	pop {r0}
	bx r0
_0801E250:
	ldr r1, _0801E284
	ldr r2, [r1]
	cmp r2, #0
	beq _0801E25E
	ldr r0, _0801E288
	str r4, [r0]
	b _0801E24A
_0801E25E:
	cmp r4, #0
	blt _0801E278
	bl sub_0802F260
	cmp r0, r4
	beq _0801E24A
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
	b _0801E24A
_0801E278:
	bl sub_0802F070
	b _0801E24A
	.byte 0x00, 0x00
_0801E280:
	.4byte 0x0202DEC0
_0801E284:
	.4byte 0x0202DEBC
_0801E288:
	.4byte 0x0202DEC4

	.global sub_0801E28C
	.thumb_func
	.type sub_0801E28C, %function
sub_0801E28C: @ 0801E28C
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	bl sub_0802F260
	ldr r2, _0801E2F4
	ldr r1, [r2]
	cmp r1, #0
	beq _0801E2CA
	cmp r4, r0
	beq _0801E2BA
	cmp r4, #0
	blt _0801E2EC
	bl sub_0802F260
	cmp r0, r4
	beq _0801E2BA
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
_0801E2BA:
	ldr r2, _0801E2F8
	ldr r0, _0801E2F4
	movs r3, #1
	str r5, [r2]
	str r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
_0801E2CA:
	cmp r4, r0
	beq _0801E2BA
	ldr r1, _0801E2FC
	str r0, [r1]
	cmp r4, #0
	blt _0801E2EC
	bl sub_0802F260
	cmp r0, r4
	beq _0801E2BA
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
	b _0801E2BA
_0801E2EC:
	bl sub_0802F070
	b _0801E2BA
	.byte 0x00, 0x00
_0801E2F4:
	.4byte 0x0202DEBC
_0801E2F8:
	.4byte 0x0202DEC0
_0801E2FC:
	.4byte 0x0202DEC4

	.global sub_0801E300
	.thumb_func
	.type sub_0801E300, %function
sub_0801E300: @ 0801E300
	ldr r2, _0801E30C
	str r0, [r2]
	ldr r0, _0801E310
	movs r1, #1
	str r1, [r0]
	bx lr
_0801E30C:
	.4byte 0x0202DEC0
_0801E310:
	.4byte 0x0202DEBC

	.global sub_0801E314
	.thumb_func
	.type sub_0801E314, %function
sub_0801E314: @ 0801E314
	push {r4, r5, r6, lr}
	ldr r6, _0801E38C
	ldr r0, [r6]
	cmp r0, #0
	beq _0801E32A
	ldr r1, _0801E390
	ldr r4, [r1]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	beq _0801E330
_0801E32A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E330:
	ldr r5, _0801E394
	ldr r3, [r5]
	cmp r3, #0
	beq _0801E32A
	subs r3, #2
	str r3, [r5]
	cmp r3, #0
	bgt _0801E32A
	bl sub_0802F260
	cmp r0, #0x14
	beq _0801E370
	str r4, [r5]
	ldr r0, _0801E398
	str r4, [r6]
	ldr r4, [r0]
	cmp r4, #0
	blt _0801E36A
	bl sub_0802F260
	cmp r0, r4
	beq _0801E32A
	adds r0, r4, #0
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
	b _0801E32A
_0801E36A:
	bl sub_0802F070
	b _0801E32A
_0801E370:
	bl sub_0802F260
	cmp r0, #0x17
	beq _0801E384
	movs r0, #0x17
	bl sub_0802EAE0
	movs r0, #0x46
	bl sub_0802F09C
_0801E384:
	movs r2, #0x4a
	str r2, [r5]
	b _0801E32A
	.byte 0x00, 0x00
_0801E38C:
	.4byte 0x0202DEBC
_0801E390:
	.4byte gFrameCount
_0801E394:
	.4byte 0x0202DEC0
_0801E398:
	.4byte 0x0202DEC4

	.global sub_0801E39C
	.thumb_func
	.type sub_0801E39C, %function
sub_0801E39C: @ 0801E39C
	push {r4, lr}
	ldr r3, _0801E3E0
	ldr r0, _0801E3D8
	strh r0, [r3, #0x2a]
	ldr r0, _0801E3DC
	ldr r1, _0801E3D8
	strh r0, [r3, #0x3c]
	movs r2, #7
	adds r3, #0x2c
_0801E3AE:
	subs r2, #1
	strh r1, [r3]
	adds r3, #2
	cmp r2, #0
	bge _0801E3AE
	ldr r0, _0801E3E0
	movs r1, #0x28
	ldrsh r4, [r0, r1]
	movs r3, #6
	muls r3, r4, r3
	movs r1, #0x2a
	ldrsh r2, [r0, r1]
	adds r4, r3, r2
	lsls r1, r4, #2
	ldr r2, _0801E3E4
	adds r1, #4
	ldr r4, [r2, r1]
	adds r1, r0, #0
	adds r1, #0x84
	b _0801E3E8
	.byte 0x00, 0x00
_0801E3D8:
	.4byte 0x00000000
_0801E3DC:
	.4byte 0x00000003
_0801E3E0:
	.4byte 0x0202D74C
_0801E3E4:
	.4byte gUnk_08051654
_0801E3E8:
	strh r4, [r1]
	ldrh r2, [r1]
	movs r1, #0x2c
	muls r2, r1, r2
	ldr r4, _0801E40C
	adds r3, r2, #4
	ldr r1, [r4, r3]
	adds r3, r0, #0
	adds r3, #0x86
	adds r2, #8
	strh r1, [r3]
	ldr r1, [r4, r2]
	strh r1, [r0, #2]
	bl game_init
	pop {r4}
	pop {r0}
	bx r0
_0801E40C:
	.4byte gUnk_08051D40

	.global sub_0801E410
	.thumb_func
	.type sub_0801E410, %function
sub_0801E410: @ 0801E410
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r4, _0801E594
	movs r0, #0x2a
	ldrsh r1, [r4, r0]
	sub sp, #0x40
	ldrh r2, [r4, #0x2a]
	cmp r1, #2
	bgt _0801E4B4
	movs r3, #0x28
	ldrsh r0, [r4, r3]
	movs r7, #6
	muls r7, r0, r7
	adds r2, #1
	lsls r1, r2, #0x10
	asrs r3, r1, #0x10
	adds r0, r7, r3
	ldr r1, _0801E598
	lsls r7, r0, #2
	adds r7, #4
	ldr r0, [r1, r7]
	adds r1, r4, #0
	adds r1, #0x84
	strh r2, [r4, #0x2a]
	strh r0, [r1]
	ldrh r7, [r1]
	movs r1, #0x2c
	muls r7, r1, r7
	ldr r0, _0801E59C
	adds r3, r7, #4
	ldr r1, [r0, r3]
	adds r3, r4, #0
	adds r3, #0x86
	adds r7, #8
	strh r1, [r3]
	ldr r1, [r0, r7]
	strh r1, [r4, #2]
	bl game_init
	adds r2, r4, #0
	adds r2, #0x88
	movs r7, #0
	ldrsh r0, [r2, r7]
	movs r1, #0
	cmp r1, r0
	bge _0801E48C
	adds r0, r2, #0
	adds r5, r4, #2
	adds r2, #0x18
_0801E47A:
	ldrb r4, [r2]
	adds r4, #0x3c
	strb r1, [r5, r4]
	movs r4, #0
	ldrsh r7, [r0, r4]
	adds r1, #1
	adds r2, #1
	cmp r1, r7
	blt _0801E47A
_0801E48C:
	ldr r1, _0801E594
	movs r7, #0
	ldrsh r2, [r1, r7]
	cmp r2, #0
	beq _0801E4AE
_0801E496:
	bl game_init
	movs r0, #0
_0801E49C:
	add sp, #0x40
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801E4AE:
	bl sub_08003A64
	b _0801E496
_0801E4B4:
	add r0, sp, #0x20
	mov ip, r0
	movs r4, #0
	mov r3, ip
_0801E4BC:
	stm r3!, {r4}
	adds r4, #1
	cmp r4, #7
	ble _0801E4BC
	ldr r1, _0801E594
	mov sl, ip
	mov r8, r1
_0801E4CA:
	movs r2, #0
	mov lr, r2
	movs r6, #4
	movs r5, #0
	movs r4, #6
_0801E4D4:
	mov r3, sl
	ldr r0, [r5, r3]
	ldr r1, [r6, r3]
	lsls r2, r0, #1
	lsls r3, r1, #1
	adds r3, #0x2c
	adds r2, #0x2c
	mov r7, r8
	mov sb, r3
	ldrsh r7, [r7, r2]
	mov r3, sb
	mov fp, r7
	mov r7, r8
	ldrsh r7, [r7, r3]
	mov sb, r7
	cmp fp, sb
	bge _0801E500
	mov r7, ip
	str r1, [r5, r7]
	str r0, [r6, r7]
	movs r0, #1
	mov lr, r0
_0801E500:
	subs r4, #1
	adds r6, #4
	adds r5, #4
	cmp r4, #0
	bge _0801E4D4
	mov r1, lr
	cmp r1, #0
	bne _0801E4CA
	mov r0, sp
	movs r4, #0
	adds r1, r0, #0
	mov r2, ip
_0801E518:
	ldm r2!, {r3}
	lsls r3, r3, #2
	str r4, [r1, r3]
	adds r4, #1
	cmp r4, #7
	ble _0801E518
	ldr r2, _0801E5A0
	ldr r1, [r2]
	lsls r3, r1, #2
	ldr r2, [r0, r3]
	cmp r2, #2
	bgt _0801E58E
	ldr r0, _0801E594
	movs r4, #0
	ldrsh r3, [r0, r4]
	cmp r3, #0
	beq _0801E53E
_0801E53A:
	movs r0, #1
	b _0801E49C
_0801E53E:
	movs r7, #3
	movs r4, #0xf8
	subs r3, r7, r2
	lsls r7, r4, #1
	adds r4, r0, r7
	strb r3, [r4]
	lsls r3, r1, #1
	adds r3, #0x2c
	ldrsh r2, [r0, r3]
	cmp r2, #0x24
	beq _0801E588
_0801E554:
	movs r2, #0x28
	ldrsh r3, [r0, r2]
	adds r1, r3, #0
	adds r1, #0x6c
	ldrb r2, [r4]
	ldrb r3, [r0, r1]
	cmp r3, r2
	bhs _0801E568
	strb r2, [r0, r1]
	ldrb r2, [r4]
_0801E568:
	adds r1, r2, #0
	cmp r1, #2
	bls _0801E57C
	movs r4, #0x28
	ldrsh r1, [r0, r4]
	adds r2, r1, #0
	adds r2, #0x78
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _0801E582
_0801E57C:
	bl sub_0801D698
	b _0801E53A
_0801E582:
	movs r1, #1
	strb r1, [r0, r2]
	b _0801E57C
_0801E588:
	movs r1, #4
	strb r1, [r4]
	b _0801E554
_0801E58E:
	movs r0, #2
	b _0801E49C
	.byte 0x00, 0x00
_0801E594:
	.4byte 0x0202D74C
_0801E598:
	.4byte gUnk_08051654
_0801E59C:
	.4byte gUnk_08051D40
_0801E5A0:
	.4byte gLocalPlayerIndex

	.global sub_0801E5A4
	.thumb_func
	.type sub_0801E5A4, %function
sub_0801E5A4: @ 0801E5A4
	push {r4, r5, r6, lr}
	ldr r5, _0801E660
	adds r4, r0, #0
	ldr r2, [r5]
	ldr r0, _0801E664
	ldr r1, _0801E668
	adds r3, r4, #0
	bl AGBPrintf
	ldr r2, [r5]
	cmp r2, #0xe8
	bne _0801E5C0
	bl sub_0801F132
_0801E5C0:
	cmp r2, #0xe8
	ble _0801E5C6
	b _0801EB1E
_0801E5C6:
	cmp r2, #0xd7
	bne _0801E5CC
	b _0801EB14
_0801E5CC:
	cmp r2, #0xd7
	ble _0801E5D2
	b _0801E916
_0801E5D2:
	cmp r2, #0xd1
	bne _0801E5D8
	b _0801E904
_0801E5D8:
	cmp r2, #0xd1
	ble _0801E5DE
	b _0801E720
_0801E5DE:
	cmp r2, #0x32
	bne _0801E5E4
	b _0801E6D4
_0801E5E4:
	cmp r2, #0x32
	bgt _0801E60A
	cmp r2, #0xa
	beq _0801E5FC
_0801E5EC:
	ldr r5, _0801E660
	ldr r0, _0801E66C
	ldr r1, [r5]
	bl AGBPrintf
_0801E5F6:
	bl AGBPrintFlush
	b _0801E5F6
_0801E5FC:
	bl fe_movie_init
	movs r2, #0x32
	str r2, [r5]

	.global mcp_process
	.thumb_func
	.type mcp_process, %function
mcp_process: @ 0801E604
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801E60A:
	cmp r2, #0x64
	beq _0801E68C
	cmp r2, #0xc8
	bne _0801E5EC
	cmp r4, #1
	beq _0801E674
	cmp r4, #1
	bgt _0801E62A
	cmp r4, #0
	bne mcp_process
	ldr r1, _0801E660
	movs r0, #0x64
	str r0, [r1]
	bl fe_title_init
	b mcp_process
_0801E62A:
	cmp r4, #2
	beq _0801E648
	cmp r4, #3
	bne mcp_process
	ldr r1, _0801E660
	movs r3, #0xe6
	str r3, [r1]
	ldr r0, _0801E658
	ldr r1, _0801E670
	strh r0, [r1]
	adds r1, #0x88
	strh r0, [r1]
	bl fe_characterselect_init
	b mcp_process
_0801E648:
	ldr r0, _0801E660
	movs r3, #0xdc
	str r3, [r0]
	ldr r1, _0801E65C
	ldr r0, _0801E670
	strh r1, [r0]
	b _0801EBFC
	.byte 0x00, 0x00
_0801E658:
	.4byte 0x00000002
_0801E65C:
	.4byte 0x00000001
_0801E660:
	.4byte 0x0202DEC8
_0801E664:
	.4byte gUnk_08051B18
_0801E668:
	.4byte gUnk_08051B34
_0801E66C:
	.4byte gUnk_08051B40
_0801E670:
	.4byte 0x0202D74C
_0801E674:
	ldr r1, _0801E6AC
	movs r3, #0xd2
	str r3, [r1]
	ldr r0, _0801E6A4
	ldr r1, _0801E6B0
	ldr r3, _0801E6A8
	strh r0, [r1]
	adds r1, #0x88
	strh r3, [r1]
	bl fe_characterselect_init
	b mcp_process
_0801E68C:
	cmp r4, #1
	beq _0801E6C8
	cmp r4, #1
	bgt _0801E6B4
	cmp r4, #0
	bne mcp_process
	ldr r0, _0801E6AC
	movs r3, #0xc8
	str r3, [r0]
	bl sub_0801EEF2
	.byte 0x00, 0x00
_0801E6A4:
	.4byte 0x00000000
_0801E6A8:
	.4byte 0x00000008
_0801E6AC:
	.4byte 0x0202DEC8
_0801E6B0:
	.4byte 0x0202D74C
_0801E6B4:
	cmp r4, #2
	bne mcp_process
	movs r3, #0xc8
	ldr r1, _0801E710
	lsls r0, r3, #1
	str r0, [r1]
	movs r0, #0
	bl fe_options_init
	b mcp_process
_0801E6C8:
	movs r3, #0x96
	ldr r1, _0801E710
	lsls r0, r3, #1
	str r0, [r1]
	bl sub_0801EEF2
_0801E6D4:
	ldr r0, _0801E714
	ldr r1, [r0]
	ldr r4, _0801E718
	lsls r2, r1, #1
	ldrh r1, [r4, r2]
	movs r0, #0x80
	lsls r4, r0, #2
	ands r4, r1
	cmp r4, #0
	beq _0801E6F6
	ldr r4, _0801E71C
_0801E6EA:
	ldr r2, _0801E70C
	movs r1, #0xc8
	ldr r0, _0801E710
	lsls r3, r1, #1
	strh r2, [r4, #0x18]
	b _0801EE10
_0801E6F6:
	ldr r4, _0801E71C
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	cmp r1, #0
	blt _0801E6EA
	movs r2, #0x64
	str r2, [r5]
	bl fe_title_init
	b mcp_process
	.byte 0x00, 0x00
_0801E70C:
	.4byte 0x00000000
_0801E710:
	.4byte 0x0202DEC8
_0801E714:
	.4byte gLocalPlayerIndex
_0801E718:
	.4byte 0x0202DE48
_0801E71C:
	.4byte 0x0202D74C
_0801E720:
	cmp r2, #0xd4
	bne _0801E726
	b _0801E8DE
_0801E726:
	cmp r2, #0xd4
	bgt _0801E81E
	cmp r2, #0xd2
	beq _0801E80A
	cmp r2, #0xd3
	beq _0801E734
	b _0801E5EC
_0801E734:
	cmp r4, #1
	beq _0801E796
	cmp r4, #1
	bgt _0801E74E
	cmp r4, #0
	beq _0801E742
	b mcp_process
_0801E742:
	ldr r1, _0801E7BC
	movs r0, #0xd2
	str r0, [r1]
	bl fe_characterselect_init
	b mcp_process
_0801E74E:
	cmp r4, #2
	beq _0801E754
	b mcp_process
_0801E754:
	ldr r5, _0801E7C0
	movs r3, #0x80
	ldr r2, [r5, #0x1c]
	lsls r1, r3, #1
	adds r0, r1, #0
	bics r0, r2
	cmp r0, #0
	beq _0801E77A
	orrs r2, r1
	str r2, [r5, #0x1c]
	bl sub_0801D698
	ldr r1, _0801E7BC
	movs r0, #0xda
	str r0, [r1]
	movs r0, #0x99
	bl fe_cranky_init
	b mcp_process
_0801E77A:
	ldr r0, _0801E7BC
	adds r1, r5, #0
	movs r3, #0xd9
	adds r1, #0x88
	str r3, [r0]
	strh r4, [r1]
	ldrh r2, [r5, #0x28]
	ldr r0, _0801E7B8
	adds r1, r5, #0
	adds r1, #0x84
	adds r2, #0x24
	strh r0, [r5]
	strh r2, [r1]
	b _0801EAA4
_0801E796:
	ldr r4, _0801E7C0
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	adds r0, r4, #0
	cmp r1, #1
	beq _0801E7E6
_0801E7A2:
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	beq _0801E7C4
_0801E7AA:
	ldr r1, _0801E7BC
	movs r0, #0xd4
	str r0, [r1]
	bl sub_0801E39C
	b mcp_process
	.byte 0x00, 0x00
_0801E7B8:
	.4byte 0x00000003
_0801E7BC:
	.4byte 0x0202DEC8
_0801E7C0:
	.4byte 0x0202D74C
_0801E7C4:
	ldr r2, [r0, #0x1c]
	movs r1, #0x10
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801E7AA
	orrs r2, r1
	str r2, [r0, #0x1c]
	bl sub_0801D698
	ldr r0, _0801E964
	movs r3, #0xd7
	str r3, [r0]
	movs r0, #0x95
	bl fe_cranky_init
	b mcp_process
_0801E7E6:
	movs r3, #0x80
	ldr r2, [r4, #0x1c]
	lsls r1, r3, #3
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801E7A2
	orrs r2, r1
	str r2, [r4, #0x1c]
	bl sub_0801D698
	ldr r0, _0801E964
	movs r1, #0xd7
	str r1, [r0]
	movs r0, #0x9b
	bl fe_cranky_init
	b mcp_process
_0801E80A:
	cmp r4, #0
	beq _0801E816
	cmp r4, #1
	beq _0801E814
	b mcp_process
_0801E814:
	b _0801EEB6
_0801E816:
	ldr r0, _0801E964
	movs r1, #0xc8
	str r1, [r0]
	b _0801EDB4
_0801E81E:
	cmp r2, #0xd5
	beq _0801E834
	cmp r2, #0xd6
	beq _0801E828
	b _0801E5EC
_0801E828:
	ldr r3, _0801E968
	ldr r1, _0801E964
	str r3, [r1]
	bl fe_cups_trophy_init
	b mcp_process
_0801E834:
	cmp r4, #0
	beq _0801E8B0
	cmp r4, #1
	beq _0801E83E
	b mcp_process
_0801E83E:
	ldr r4, _0801E96C
	ldr r2, [r4, #0x1c]
	mvns r1, r2
	movs r0, #0x20
	adds r3, r1, #0
	ands r3, r0
	cmp r3, #0
	beq _0801E864
	orrs r2, r0
	str r2, [r4, #0x1c]
	bl sub_0801D698
	ldr r1, _0801E964
	movs r0, #0xdb
	str r0, [r1]
	movs r0, #0x96
	bl fe_cranky_init
	b mcp_process
_0801E864:
	movs r0, #0x40
	adds r3, r1, #0
	ands r3, r0
	cmp r3, #0
	beq _0801E884
	orrs r2, r0
	str r2, [r4, #0x1c]
	bl sub_0801D698
	ldr r1, _0801E964
	movs r3, #0xdb
	str r3, [r1]
	movs r0, #0x97
	bl fe_cranky_init
	b mcp_process
_0801E884:
	movs r0, #0x80
	adds r3, r0, #0
	ands r3, r1
	cmp r3, #0
	beq _0801E8A4
	orrs r2, r0
	str r2, [r4, #0x1c]
	bl sub_0801D698
	ldr r0, _0801E964
	movs r1, #0xdb
	str r1, [r0]
	movs r0, #0x98
	bl fe_cranky_init
	b mcp_process
_0801E8A4:
	ldr r0, _0801E964
	movs r3, #0xd1
	str r3, [r0]
	bl fe_retry_init
	b mcp_process
_0801E8B0:
	bl sub_0801E410
	cmp r0, #1
	beq _0801E8D2
	cmp r0, #1
	bgt _0801E8CA
	cmp r0, #0
	beq _0801E8C2
	b mcp_process
_0801E8C2:
	ldr r1, _0801E964
	movs r3, #0xd4
	str r3, [r1]
	b mcp_process
_0801E8CA:
	cmp r0, #2
	beq _0801E8D0
	b mcp_process
_0801E8D0:
	b _0801EEB6
_0801E8D2:
	ldr r0, _0801E964
	movs r1, #0xd6
	str r1, [r0]
	bl fe_cups_win2_init
	b mcp_process
_0801E8DE:
	cmp r4, #1
	beq _0801E8FA
	cmp r4, #1
	ble _0801E8E8
	b _0801EC78
_0801E8E8:
	cmp r4, #0
	beq _0801E8EE
	b mcp_process
_0801E8EE:
	ldr r1, _0801E964
	movs r0, #0xd3
	str r0, [r1]
	bl fe_cups_init
	b mcp_process
_0801E8FA:
	movs r2, #0xd5
	str r2, [r5]
	bl fe_cups_scoreboard_init
	b mcp_process
_0801E904:
	cmp r4, #0
	bne _0801E90A
	b _0801EEEE
_0801E90A:
	cmp r4, #1
	beq _0801E910
	b mcp_process
_0801E910:
	movs r4, #0xd4
	str r4, [r5]
	b _0801EC7E
_0801E916:
	cmp r2, #0xdd
	bne _0801E91C
	b _0801EAF8
_0801E91C:
	cmp r2, #0xdd
	ble _0801E922
	b _0801EA04
_0801E922:
	cmp r2, #0xda
	beq _0801E9D6
	cmp r2, #0xda
	bgt _0801E9A4
	cmp r2, #0xd8
	beq _0801E98C
	cmp r2, #0xd9
	beq _0801E934
	b _0801E5EC
_0801E934:
	ldr r5, _0801E96C
	ldr r2, _0801E95C
	ldr r0, _0801E960
	strh r2, [r5]
	adds r2, r5, #0
	adds r2, #0x88
	strh r0, [r2]
	cmp r4, #1
	beq _0801E980
	cmp r4, #1
	bgt _0801E970
	cmp r4, #0
	beq _0801E950
	b mcp_process
_0801E950:
	ldr r1, _0801E964
	movs r3, #0xd3
	str r3, [r1]
	bl fe_cups_init
	b mcp_process
_0801E95C:
	.4byte 0x00000000
_0801E960:
	.4byte 0x00000008
_0801E964:
	.4byte 0x0202DEC8
_0801E968:
	.4byte 0x0000085D
_0801E96C:
	.4byte 0x0202D74C
_0801E970:
	cmp r4, #2
	beq _0801E976
	b mcp_process
_0801E976:
	ldr r0, _0801E998
	adds r1, r5, #0
	strh r0, [r5]
	strh r4, [r2]
	b _0801EAA2
_0801E980:
	ldr r1, _0801E99C
	ldr r0, _0801E9A0
	str r1, [r0]
	bl fe_boss_win_init
	b mcp_process
_0801E98C:
	movs r1, #0xd3
	str r1, [r5]
	bl fe_cups_init
	b mcp_process
	.byte 0x00, 0x00
_0801E998:
	.4byte 0x00000003
_0801E99C:
	.4byte 0x0000087B
_0801E9A0:
	.4byte 0x0202DEC8
_0801E9A4:
	cmp r2, #0xdb
	beq _0801E9CC
	cmp r2, #0xdc
	beq _0801E9AE
	b _0801E5EC
_0801E9AE:
	cmp r4, #0
	beq _0801E9C4
	cmp r4, #1
	beq _0801E9B8
	b mcp_process
_0801E9B8:
	ldr r1, _0801E9FC
	movs r3, #0xdd
	str r3, [r1]
	bl fe_tracks_init
	b mcp_process
_0801E9C4:
	ldr r1, _0801E9FC
	movs r0, #0xc8
	str r0, [r1]
	b _0801EDB4
_0801E9CC:
	movs r1, #0xd1
	str r1, [r5]
	bl fe_retry_init
	b mcp_process
_0801E9D6:
	movs r0, #0xd9
	str r0, [r5]
	ldr r0, _0801EA00
	ldr r4, _0801E9F4
	adds r1, r0, #0
	adds r1, #0x88
	strh r4, [r1]
	ldrh r4, [r0, #0x28]
	ldr r2, _0801E9F8
	subs r1, #4
	adds r4, #0x24
	strh r2, [r0]
	strh r4, [r1]
	b _0801F166
	.byte 0x00, 0x00
_0801E9F4:
	.4byte 0x00000002
_0801E9F8:
	.4byte 0x00000003
_0801E9FC:
	.4byte 0x0202DEC8
_0801EA00:
	.4byte 0x0202D74C
_0801EA04:
	cmp r2, #0xe0
	beq _0801EAEC
	cmp r2, #0xe0
	bgt _0801EA5C
	cmp r2, #0xde
	beq _0801EA2C
	cmp r2, #0xdf
	beq _0801EA16
	b _0801E5EC
_0801EA16:
	cmp r4, #0
	beq _0801EA26
	cmp r4, #1
	beq _0801EA20
	b mcp_process
_0801EA20:
	ldr r1, _0801EBD8
	movs r0, #0xe0
	b _0801EE20
_0801EA26:
	ldr r0, _0801EBD8
	movs r3, #0xdd
	b _0801EE5A
_0801EA2C:
	cmp r4, #1
	beq _0801EA50
	cmp r4, #1
	bgt _0801EA40
	cmp r4, #0
	beq _0801EA3A
	b mcp_process
_0801EA3A:
	ldr r0, _0801EBD8
	movs r3, #0xdd
	b _0801EE5A
_0801EA40:
	cmp r4, #2
	beq _0801EA46
	b mcp_process
_0801EA46:
	ldr r0, _0801EBDC
	ldr r4, _0801EBD8
	adds r1, r0, #0
	str r2, [r4]
	b _0801F164
_0801EA50:
	ldr r1, _0801EBD8
	movs r0, #0xdf
	str r0, [r1]
	bl fe_tracks_timesheet_init
	b mcp_process
_0801EA5C:
	cmp r2, #0xe6
	beq _0801EACE
	cmp r2, #0xe7
	beq _0801EA66
	b _0801E5EC
_0801EA66:
	cmp r4, #0
	beq _0801EAC2
	cmp r4, #1
	beq _0801EA70
	b mcp_process
_0801EA70:
	ldr r5, _0801EBDC
	ldr r3, [r5, #0x1c]
	adds r1, r4, #0
	bics r1, r3
	cmp r1, #0
	beq _0801EA92
	orrs r3, r4
	str r3, [r5, #0x1c]
	bl sub_0801D698
	ldr r1, _0801EBD8
	movs r0, #0xea
	str r0, [r1]
	movs r0, #0x91
	bl fe_cranky_init
	b mcp_process
_0801EA92:
	ldr r0, _0801EBD8
	movs r3, #0xe8
	str r3, [r0]
	movs r0, #0xfa
	lsls r3, r0, #1
	adds r0, r5, r3
	str r1, [r0]
	adds r1, r5, #0
_0801EAA2:
	adds r1, #0x84
_0801EAA4:
	ldrh r2, [r1]
	movs r1, #0x2c
	muls r2, r1, r2
	ldr r0, _0801EBE0
	adds r3, r2, #4
	ldr r1, [r0, r3]
	adds r3, r5, #0
	adds r3, #0x86
	adds r2, #8
	strh r1, [r3]
	ldr r1, [r0, r2]
	strh r1, [r5, #2]
	bl game_init
	b mcp_process
_0801EAC2:
	ldr r0, _0801EBD8
	movs r3, #0xe6
	str r3, [r0]
	bl fe_characterselect_init
	b mcp_process
_0801EACE:
	cmp r4, #0
	beq _0801EAE4
	cmp r4, #1
	beq _0801EAD8
	b mcp_process
_0801EAD8:
	ldr r0, _0801EBD8
	movs r1, #0xe7
	str r1, [r0]
	bl fe_tracks_init
	b mcp_process
_0801EAE4:
	ldr r1, _0801EBD8
	movs r3, #0xc8
	str r3, [r1]
	b _0801EDB4
_0801EAEC:
	bl sub_080177D0
	bl sub_0801D698
	movs r2, #0xdd
	b _0801F144
_0801EAF8:
	cmp r4, #0
	beq _0801EB0A
	cmp r4, #1
	beq _0801EB02
	b mcp_process
_0801EB02:
	ldr r0, _0801EBDC
	movs r4, #0xde
	str r4, [r5]
	b _0801F162
_0801EB0A:
	movs r2, #0xdc
	str r2, [r5]
	bl fe_characterselect_init
	b mcp_process
_0801EB14:
	movs r2, #0xd4
	str r2, [r5]
	bl sub_0801E39C
	b mcp_process
_0801EB1E:
	movs r0, #0xa1
	lsls r3, r0, #1
	cmp r2, r3
	bne _0801EB28
	b _0801F104
_0801EB28:
	cmp r2, r3
	ble _0801EB2E
	b _0801ED50
_0801EB2E:
	subs r3, #0xb
	cmp r2, r3
	bne _0801EB36
	b _0801ED2E
_0801EB36:
	cmp r2, r3
	bgt _0801EC18
	cmp r2, #0xeb
	bne _0801EB40
	b _0801F142
_0801EB40:
	cmp r2, #0xeb
	bgt _0801EB54
	cmp r2, #0xea
	beq _0801EB4A
	b _0801E5EC
_0801EB4A:
	movs r0, #0xe8
	str r0, [r5]
	movs r4, #0xfa
	ldr r0, _0801EBDC
	b _0801F15A
_0801EB54:
	movs r0, #0x96
	lsls r1, r0, #1
	cmp r2, r1
	beq _0801EB82
	movs r3, #0x9b
	lsls r0, r3, #1
	cmp r2, r0
	beq _0801EB66
	b _0801E5EC
_0801EB66:
	cmp r4, #0
	beq _0801EB76
	cmp r4, #1
	beq _0801EB70
	b mcp_process
_0801EB70:
	ldr r3, _0801EBE4
	ldr r0, _0801EBD8
	b _0801EEBA
_0801EB76:
	ldr r2, _0801EBD8
	movs r0, #1
	str r1, [r2]
	bl fe_spotscreen_init
	b mcp_process
_0801EB82:
	cmp r4, #1
	beq _0801EBEC
	cmp r4, #1
	bgt _0801EB9C
	cmp r4, #0
	beq _0801EB90
	b mcp_process
_0801EB90:
	ldr r1, _0801EBD8
	movs r3, #0x64
	str r3, [r1]
	bl fe_title_init
	b mcp_process
_0801EB9C:
	cmp r4, #2
	beq _0801EBB2
	cmp r4, #3
	beq _0801EBA6
	b mcp_process
_0801EBA6:
	movs r1, #0xa5
	ldr r0, _0801EBD8
	lsls r3, r1, #1
	str r3, [r0]
	ldr r2, _0801EBD0
	b _0801EBBC
_0801EBB2:
	movs r1, #0xa0
	ldr r0, _0801EBD8
	lsls r3, r1, #1
	str r3, [r0]
	ldr r2, _0801EBD4
_0801EBBC:
	ldr r0, _0801EBDC
	ldr r1, _0801EBE8
	strh r2, [r0]
	ldr r2, [r1]
	adds r0, #0x88
	strh r2, [r0]
	bl fe_characterselect_init
	b mcp_process
	.byte 0x00, 0x00
_0801EBD0:
	.4byte 0x00000005
_0801EBD4:
	.4byte 0x00000006
_0801EBD8:
	.4byte 0x0202DEC8
_0801EBDC:
	.4byte 0x0202D74C
_0801EBE0:
	.4byte gUnk_08051D40
_0801EBE4:
	.4byte 0x00000137
_0801EBE8:
	.4byte 0x0202DE5C
_0801EBEC:
	movs r3, #0x9b
	ldr r0, _0801EC10
	lsls r1, r3, #1
	str r1, [r0]
	ldr r3, _0801EC08
	ldr r0, _0801EC14
	ldr r1, _0801EC0C
	strh r3, [r0]
_0801EBFC:
	adds r0, #0x88
	strh r1, [r0]
	bl fe_characterselect_init
	b mcp_process
	.byte 0x00, 0x00
_0801EC08:
	.4byte 0x00000004
_0801EC0C:
	.4byte 0x00000008
_0801EC10:
	.4byte 0x0202DEC8
_0801EC14:
	.4byte 0x0202D74C
_0801EC18:
	movs r1, #0x9d
	lsls r6, r1, #1
	cmp r2, r6
	bne _0801EC22
	b _0801ED26
_0801EC22:
	cmp r2, r6
	bgt _0801ECD6
	movs r3, #0x9c
	lsls r5, r3, #1
	cmp r2, r5
	beq _0801EC64
	ldr r0, _0801EF18
	cmp r2, r0
	beq _0801EC36
	b _0801E5EC
_0801EC36:
	bl sub_0801E410
	cmp r0, #1
	beq _0801EC5A
	cmp r0, #1
	bgt _0801EC4E
	cmp r0, #0
	beq _0801EC48
	b mcp_process
_0801EC48:
	ldr r2, _0801EF1C
	str r5, [r2]
	b mcp_process
_0801EC4E:
	cmp r0, #2
	beq _0801EC54
	b mcp_process
_0801EC54:
	ldr r3, _0801EF20
	ldr r0, _0801EF1C
	b _0801EEBA
_0801EC5A:
	ldr r1, _0801EF1C
	str r6, [r1]
	bl fe_cups_win2_init
	b mcp_process
_0801EC64:
	cmp r4, #1
	beq _0801ECCA
	cmp r4, #1
	bgt _0801EC78
	cmp r4, #0
	beq _0801EC72
	b mcp_process
_0801EC72:
	ldr r3, _0801EF20
	ldr r0, _0801EF1C
	b _0801EEBA
_0801EC78:
	cmp r4, #2
	beq _0801EC7E
	b mcp_process
_0801EC7E:
	ldr r4, _0801EF24
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, #0x2a]
	cmp r0, #0
	ble _0801EC90
	ldrh r2, [r4, #0x3c]
	subs r2, #1
	strh r2, [r4, #0x3c]
_0801EC90:
	movs r3, #0x28
	ldrsh r2, [r4, r3]
	movs r0, #6
	muls r2, r0, r2
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r2, r1
	lsls r3, r0, #2
	ldr r1, _0801EF28
	adds r3, #4
	ldr r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x84
	strh r0, [r1]
	ldrh r2, [r1]
	movs r1, #0x2c
	muls r2, r1, r2
	ldr r0, _0801EF2C
	adds r3, r2, #4
	ldr r1, [r0, r3]
	adds r3, r4, #0
	adds r3, #0x86
	adds r2, #8
	strh r1, [r3]
	ldr r1, [r0, r2]
	strh r1, [r4, #2]
	bl game_init
	b mcp_process
_0801ECCA:
	ldr r0, _0801EF18
	ldr r1, _0801EF1C
	str r0, [r1]
	bl fe_cups_scoreboard_init
	b mcp_process
_0801ECD6:
	movs r3, #0xa0
	lsls r1, r3, #1
	cmp r2, r1
	beq _0801ED06
	ldr r0, _0801EF30
	cmp r2, r0
	beq _0801ECE6
	b _0801E5EC
_0801ECE6:
	cmp r4, #0
	beq _0801ECFC
	cmp r4, #1
	beq _0801ECF0
	b mcp_process
_0801ECF0:
	movs r0, #0xa1
	lsls r3, r0, #1
	ldr r4, _0801EF1C
	ldr r0, _0801EF24
	str r3, [r4]
	b _0801F162
_0801ECFC:
	ldr r2, _0801EF1C
	str r1, [r2]
	bl fe_characterselect_init
	b mcp_process
_0801ED06:
	cmp r4, #0
	beq _0801ED1C
	cmp r4, #1
	beq _0801ED10
	b mcp_process
_0801ED10:
	ldr r0, _0801EF30
	ldr r1, _0801EF1C
	str r0, [r1]
	bl fe_tracks_init
	b mcp_process
_0801ED1C:
	movs r3, #0x96
	ldr r1, _0801EF1C
	lsls r0, r3, #1
	str r0, [r1]
	b _0801EDB4
_0801ED26:
	str r3, [r5]
	bl fe_cups_init
	b mcp_process
_0801ED2E:
	cmp r4, #0
	beq _0801ED44
	cmp r4, #1
	beq _0801ED38
	b mcp_process
_0801ED38:
	movs r1, #0x9c
	lsls r0, r1, #1
	str r0, [r5]
	bl sub_0801E39C
	b mcp_process
_0801ED44:
	movs r2, #0x9b
	lsls r1, r2, #1
	str r1, [r5]
	bl fe_characterselect_init
	b mcp_process
_0801ED50:
	movs r1, #0xcd
	lsls r3, r1, #1
	cmp r2, r3
	bne _0801ED5A
	b _0801F0F4
_0801ED5A:
	cmp r2, r3
	ble _0801ED60
	b _0801EE74
_0801ED60:
	movs r0, #0xa6
	lsls r1, r0, #1
	cmp r2, r1
	beq _0801EE46
	cmp r2, r1
	bgt _0801EDBE
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r2, r0
	beq _0801ED9E
	subs r3, #0x4f
	cmp r2, r3
	beq _0801ED7E
	bl _0801E5EC
_0801ED7E:
	cmp r4, #0
	beq _0801ED92
	cmp r4, #1
	beq _0801ED8A
	bl mcp_process
_0801ED8A:
	ldr r0, _0801EF24
	ldr r4, _0801EF1C
	str r1, [r4]
	b _0801F162
_0801ED92:
	ldr r2, _0801EF1C
	str r0, [r2]
	bl fe_characterselect_init
	bl mcp_process
_0801ED9E:
	cmp r4, #0
	beq _0801EDAC
	cmp r4, #1
	beq _0801EDAA
	bl mcp_process
_0801EDAA:
	b _0801EE56
_0801EDAC:
	movs r1, #0x96
	ldr r0, _0801EF1C
	lsls r3, r1, #1
	str r3, [r0]
_0801EDB4:
	movs r0, #1
	bl fe_spotscreen_init
	bl mcp_process
_0801EDBE:
	movs r3, #0xc8
	lsls r1, r3, #1
	cmp r2, r1
	beq _0801EDDE
	ldr r0, _0801EF34
	cmp r2, r0
	beq _0801EDD0
	bl _0801E5EC
_0801EDD0:
	ldr r2, _0801EF1C
	movs r0, #0
	str r1, [r2]
	bl fe_options_init
	bl mcp_process
_0801EDDE:
	cmp r4, #5
	bhi _0801EEE0
	ldr r3, _0801EF38
	lsls r1, r4, #2
	ldr r0, [r1, r3]
	mov pc, r0
	.byte 0x00, 0x00
	.global _0801EDEC
_0801EDEC:
	.4byte _0801EE04
	.4byte _0801EE0C
	.4byte _0801EE1C
	.4byte _0801EEE0
	.4byte _0801EE2A
	.4byte _0801EE38
	.global _0801EE04
_0801EE04:
	ldr r0, _0801EF1C
	movs r1, #0x64
	str r1, [r0]
	b _0801F0F8
	.global _0801EE0C
_0801EE0C:
	ldr r3, _0801EF34
	ldr r0, _0801EF1C
_0801EE10:
	str r3, [r0]
	movs r0, #1
	bl fe_options_init
	bl mcp_process
	.global _0801EE1C
_0801EE1C:
	ldr r0, _0801EF34
	ldr r1, _0801EF1C
_0801EE20:
	str r0, [r1]
	bl fe_name_init
	bl mcp_process
	.global _0801EE2A
_0801EE2A:
	ldr r3, _0801EF34
	ldr r1, _0801EF1C
	str r3, [r1]
	bl fe_boss_win_init
	bl mcp_process
	.global _0801EE38
_0801EE38:
	ldr r1, _0801EF34
	ldr r0, _0801EF1C
	str r1, [r0]
	bl fe_credits_screen_init
	bl mcp_process
_0801EE46:
	cmp r4, #1
	beq _0801EE70
	cmp r4, #1
	bgt _0801EE64
	cmp r4, #0
	beq _0801EE56
	bl mcp_process
_0801EE56:
	ldr r3, _0801EF3C
	ldr r0, _0801EF1C
_0801EE5A:
	str r3, [r0]
	bl fe_tracks_init
	bl mcp_process
_0801EE64:
	cmp r4, #2
	beq _0801EE6C
	bl mcp_process
_0801EE6C:
	ldr r0, _0801EF24
	b _0801F162
_0801EE70:
	ldr r2, _0801EF3C
	b _0801F144
_0801EE74:
	ldr r3, _0801EF40
	cmp r2, r3
	beq _0801EEFC
	cmp r2, r3
	bgt _0801EED0
	subs r3, #0x1e
	cmp r2, r3
	beq _0801EEC4
	adds r3, #1
	cmp r2, r3
	beq _0801EE8E
	bl _0801E5EC
_0801EE8E:
	ldr r0, _0801EF24
	movs r3, #0x80
	ldr r2, [r0, #0x1c]
	lsls r1, r3, #6
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801EEB6
	orrs r2, r1
	str r2, [r0, #0x1c]
	bl sub_0801D698
	ldr r0, _0801EF1C
	movs r1, #0xd8
	str r1, [r0]
	movs r0, #0x9e
	bl fe_cranky_init
	bl mcp_process
_0801EEB6:
	ldr r0, _0801EF1C
	movs r3, #0xd3
_0801EEBA:
	str r3, [r0]
	bl fe_cups_init
	bl mcp_process
_0801EEC4:
	ldr r2, _0801EF44
	str r2, [r5]
	bl fe_credits_screen_init
	bl mcp_process
_0801EED0:
	ldr r3, _0801EF48
	cmp r2, r3
	beq _0801EEEE
	adds r3, #1
	cmp r2, r3
	beq _0801EEE0
	bl _0801E5EC
	.global _0801EEE0
_0801EEE0:
	ldr r0, _0801EF1C
	movs r3, #0x64
	str r3, [r0]
	bl fe_title_init
	bl mcp_process
_0801EEEE:
	movs r2, #0xc8
	str r2, [r5]

	.global sub_0801EEF2
	.thumb_func
	.type sub_0801EEF2, %function
sub_0801EEF2: @ 0801EEF2
	movs r0, #0
	bl fe_spotscreen_init
	bl mcp_process
_0801EEFC:
	ldr r1, _0801EF24
	adds r0, r1, #0
	adds r0, #0xa0
	ldrb r2, [r0]
	cmp r2, #0
	beq _0801EF4C
	movs r1, #0xd8
	str r1, [r5]
	movs r0, #0x9a
	bl fe_cranky_init
	bl mcp_process
	.byte 0x00, 0x00
_0801EF18:
	.4byte 0x00000139
_0801EF1C:
	.4byte 0x0202DEC8
_0801EF20:
	.4byte 0x00000137
_0801EF24:
	.4byte 0x0202D74C
_0801EF28:
	.4byte gUnk_08051654
_0801EF2C:
	.4byte gUnk_08051D40
_0801EF30:
	.4byte 0x00000141
_0801EF34:
	.4byte 0x00000191
_0801EF38:
	.4byte _0801EDEC
_0801EF3C:
	.4byte 0x0000014B
_0801EF40:
	.4byte 0x0000087B
_0801EF44:
	.4byte 0x0000085E
_0801EF48:
	.4byte 0x0000088F
_0801EF4C:
	movs r2, #0x28
	ldrsh r5, [r1, r2]
	movs r4, #2
	adds r5, #0x78
	strb r4, [r1, r5]
	adds r4, r1, #0
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r2, r1, #2
	adds r0, r2, r4
	adds r2, r0, #0
	movs r5, #0
	adds r2, #0x78
	movs r1, #3
_0801EF68:
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #2
	bne _0801EF72
	b _0801F0F0
_0801EF72:
	subs r1, #1
	cmp r1, #0
	bge _0801EF68
	cmp r5, #4
	bne _0801EF7E
	b _0801F088
_0801EF7E:
	movs r2, #0x14
	ldrsh r3, [r4, r2]
	cmp r3, #1
	beq _0801F01E
	cmp r3, #1
	bgt _0801EFE6
	cmp r3, #0
	beq _0801EF90
	b _0801F1C8
_0801EF90:
	cmp r5, #2
	beq _0801EFDC
	cmp r5, #2
	bgt _0801EFA8
	cmp r5, #1
	beq _0801EF9E
	b _0801F1C8
_0801EF9E:
	ldr r0, _0801F298
	movs r1, #0xd8
	str r1, [r0]
	movs r0, #0x9f
	b _0801F1C4
_0801EFA8:
	cmp r5, #3
	beq _0801EFD2
	cmp r5, #4
	beq _0801EFB2
	b _0801F1C8
_0801EFB2:
	ldr r0, _0801F29C
	ldr r1, _0801F298
	str r0, [r1]
	movs r3, #0x80
	ldr r2, [r4, #0x1c]
	lsls r1, r3, #7
	adds r0, r1, #0
	bics r0, r2
	cmp r0, #0
	beq _0801EFCE
	orrs r2, r1
	str r2, [r4, #0x1c]
	movs r0, #0xa2
	b _0801F1C4
_0801EFCE:
	movs r0, #0xa9
	b _0801F1C4
_0801EFD2:
	ldr r1, _0801F298
	movs r0, #0xd8
	str r0, [r1]
	movs r0, #0xa1
	b _0801F1C4
_0801EFDC:
	ldr r0, _0801F298
	movs r3, #0xd8
	str r3, [r0]
	movs r0, #0xa0
	b _0801F1C4
_0801EFE6:
	cmp r3, #2
	beq _0801EFEC
	b _0801F1C8
_0801EFEC:
	cmp r5, #4
	beq _0801EFFC
	ldr r1, _0801F298
	movs r0, #0xd3
	str r0, [r1]
	bl fe_cups_init
	b _0801F1C8
_0801EFFC:
	movs r3, #0x89
	ldr r1, _0801F298
	lsls r0, r3, #4
	str r0, [r1]
	movs r3, #0x80
	ldr r2, [r4, #0x1c]
	lsls r1, r3, #9
	adds r0, r1, #0
	bics r0, r2
	cmp r0, #0
	beq _0801F01A
	orrs r2, r1
	str r2, [r4, #0x1c]
	movs r0, #0xa8
	b _0801F1C4
_0801F01A:
	movs r0, #0xab
	b _0801F1C4
_0801F01E:
	cmp r5, #2
	beq _0801F07E
	cmp r5, #2
	bgt _0801F036
	cmp r5, #1
	beq _0801F02C
	b _0801F1C8
_0801F02C:
	ldr r1, _0801F298
	movs r3, #0xd8
	str r3, [r1]
	movs r0, #0xa3
	b _0801F1C4
_0801F036:
	cmp r5, #3
	beq _0801F074
	cmp r5, #4
	beq _0801F040
	b _0801F1C8
_0801F040:
	movs r3, #0x89
	ldr r1, _0801F298
	lsls r0, r3, #4
	str r0, [r1]
	movs r3, #0x80
	ldr r2, [r4, #0x1c]
	lsls r1, r3, #8
	adds r0, r1, #0
	bics r0, r2
	cmp r0, #0
	beq _0801F070
	orrs r2, r1
	str r2, [r4, #0x1c]
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0801F06C
	movs r0, #0xa7
	b _0801F1C4
_0801F06C:
	movs r0, #0xa6
	b _0801F1C4
_0801F070:
	movs r0, #0xaa
	b _0801F1C4
_0801F074:
	ldr r0, _0801F298
	movs r3, #0xd8
	str r3, [r0]
	movs r0, #0xa5
	b _0801F1C4
_0801F07E:
	ldr r0, _0801F298
	movs r1, #0xd8
	str r1, [r0]
	movs r0, #0xa4
	b _0801F1C4
_0801F088:
	adds r2, r4, #0
	adds r2, #0x26
	movs r1, #0
	strb r1, [r2]
	adds r0, r2, #0
	movs r1, #0
_0801F094:
	movs r2, #0x14
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r3, r2, r1
	adds r3, #0x78
	movs r2, #1
	strb r2, [r4, r3]
	movs r2, #0x14
	ldrsh r3, [r4, r2]
	lsls r3, r3, #2
	adds r2, r3, r1
	adds r2, #0x6c
	ldrb r3, [r4, r2]
	cmp r3, #3
	beq _0801F0E2
	cmp r3, #4
	beq _0801F0DC
_0801F0B6:
	adds r1, #1
	cmp r1, #3
	ble _0801F094
	ldr r0, _0801F2A0
	ldrh r1, [r0, #0x14]
	lsls r4, r1, #0x10
	strh r1, [r0, #0x16]
	cmp r4, #0
	beq _0801F0CC
	adds r4, r0, #0
	b _0801EF7E
_0801F0CC:
	adds r4, r0, #0
	adds r4, #0x21
	ldrb r3, [r4]
	movs r2, #0x10
	orrs r3, r2
	strb r3, [r4]
	adds r4, r0, #0
	b _0801EF7E
_0801F0DC:
	lsls r3, r1, #1
	movs r2, #2
	b _0801F0E6
_0801F0E2:
	lsls r3, r1, #1
	movs r2, #1
_0801F0E6:
	lsls r2, r3
	ldrb r3, [r0]
	orrs r2, r3
	strb r2, [r0]
	b _0801F0B6
_0801F0F0:
	adds r5, #1
	b _0801EF72
_0801F0F4:
	movs r1, #0x64
	str r1, [r5]
_0801F0F8:
	bl sub_0801D698
	bl fe_title_init
	bl mcp_process
_0801F104:
	cmp r4, #1
	beq _0801F126
	cmp r4, #1
	bgt _0801F118
	cmp r4, #0
	beq _0801F114
	bl mcp_process
_0801F114:
	ldr r2, _0801F2A4
	b _0801F144
_0801F118:
	cmp r4, #2
	beq _0801F120
	bl mcp_process
_0801F120:
	ldr r0, _0801F2A0
	str r2, [r5]
	b _0801F162
_0801F126:
	ldr r1, _0801F2A4
	str r1, [r5]
	bl fe_tracks_init
	bl mcp_process

	.global sub_0801F132
	.thumb_func
	.type sub_0801F132, %function
sub_0801F132: @ 0801F132
	cmp r4, #1
	beq _0801F186
	cmp r4, #1
	bgt _0801F14E
	cmp r4, #0
	beq _0801F142
	bl mcp_process
_0801F142:
	movs r2, #0xe7
_0801F144:
	str r2, [r5]
	bl fe_tracks_init
	bl mcp_process
_0801F14E:
	cmp r4, #2
	beq _0801F156
	bl mcp_process
_0801F156:
	ldr r0, _0801F2A0
	movs r4, #0xfa
_0801F15A:
	lsls r1, r4, #1
	adds r4, r0, r1
	movs r2, #0
	str r2, [r4]
_0801F162:
	adds r1, r0, #0
_0801F164:
	adds r1, #0x84
_0801F166:
	ldrh r2, [r1]
	movs r1, #0x2c
	muls r2, r1, r2
	ldr r4, _0801F2A8
	adds r3, r2, #4
	ldr r1, [r4, r3]
	adds r3, r0, #0
	adds r3, #0x86
	adds r2, #8
	strh r1, [r3]
	ldr r1, [r4, r2]
	strh r1, [r0, #2]
	bl game_init
	bl mcp_process
_0801F186:
	ldr r0, _0801F2A0
	movs r6, #0xfa
	lsls r2, r6, #1
	adds r6, r0, r2
	ldr r1, [r6]
	movs r3, #0xf
	ands r1, r3
	str r1, [r6]
	adds r2, r0, #0
	adds r2, #0xa0
	ldrb r1, [r2]
	adds r2, r1, #0
	cmp r2, #0
	beq _0801F280
_0801F1A2:
	ldr r2, [r6]
	cmp r2, #5
	bgt _0801F1F2
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _0801F1D0
	ldr r2, [r0, #0x1c]
	movs r1, #2
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801F210
	orrs r2, r1
	str r2, [r0, #0x1c]
	movs r2, #0xeb
	str r2, [r5]
	movs r0, #0x92
_0801F1C4:
	bl fe_cranky_init
_0801F1C8:
	bl sub_0801D698
	bl mcp_process
_0801F1D0:
	ldr r2, [r0, #0x1c]
	movs r1, #8
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801F1E8
	orrs r2, r1
	str r2, [r0, #0x1c]
	movs r0, #0xeb
	str r0, [r5]
	movs r0, #0x94
	b _0801F1C4
_0801F1E8:
	movs r1, #0xe7
	str r1, [r5]
	bl fe_tracks_init
	b _0801F1C8
_0801F1F2:
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _0801F21A
	ldr r2, [r0, #0x1c]
	movs r1, #4
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801F210
	orrs r2, r1
	movs r1, #0xeb
	str r2, [r0, #0x1c]
	str r1, [r5]
	movs r0, #0x93
	b _0801F1C4
_0801F210:
	movs r0, #0xe7
	str r0, [r5]
	bl fe_tracks_init
	b _0801F1C8
_0801F21A:
	movs r1, #0xfc
	lsls r3, r1, #1
	adds r1, r0, r3
	ldrh r2, [r1]
	ldr r1, _0801F2AC
	cmp r2, r1
	beq _0801F24C
	movs r3, #0x80
	ldr r2, [r0, #0x1c]
	lsls r1, r3, #4
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801F242
	orrs r2, r1
	str r2, [r0, #0x1c]
	movs r0, #0xeb
	str r0, [r5]
	movs r0, #0x9c
	b _0801F1C4
_0801F242:
	movs r2, #0xe7
	str r2, [r5]
	bl fe_tracks_init
	b _0801F1C8
_0801F24C:
	movs r3, #0x80
	ldr r2, [r0, #0x1c]
	lsls r1, r3, #5
	adds r3, r1, #0
	bics r3, r2
	cmp r3, #0
	beq _0801F276
	orrs r2, r1
	movs r1, #0xeb
	str r2, [r0, #0x1c]
	str r1, [r5]
	movs r0, #0x9d
	bl fe_cranky_init
_0801F268:
	ldr r0, _0801F2A0
	adds r0, #0x22
	ldrb r3, [r0]
	movs r2, #0x10
	orrs r3, r2
	strb r3, [r0]
	b _0801F1C8
_0801F276:
	movs r0, #0xe7
	str r0, [r5]
	bl fe_tracks_init
	b _0801F268
_0801F280:
	movs r2, #0xfc
	lsls r3, r2, #1
	adds r2, r0, r3
	adds r3, r0, #0
	adds r3, #0x84
	ldrh r3, [r3]
	lsls r4, r3
	ldrh r3, [r2]
	orrs r4, r3
	strh r4, [r2]
	b _0801F1A2
	.byte 0x00, 0x00
_0801F298:
	.4byte 0x0202DEC8
_0801F29C:
	.4byte 0x0000088F
_0801F2A0:
	.4byte 0x0202D74C
_0801F2A4:
	.4byte 0x00000141
_0801F2A8:
	.4byte gUnk_08051D40
_0801F2AC:
	.4byte 0x0000FFFF

	.global sub_0801F2B0
	.thumb_func
	.type sub_0801F2B0, %function
sub_0801F2B0: @ 0801F2B0
	push {lr}
	ldr r0, _0801F2C0
	movs r1, #0xa
	str r1, [r0]
	bl sub_08014510
	pop {r0}
	bx r0
_0801F2C0:
	.4byte 0x0202DEC8

	.global gamesfx_update
	.thumb_func
	.type gamesfx_update, %function
gamesfx_update: @ 0801F2C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r0, _0801F518
	ldr r3, [r0]
	mov sl, r3
	mov r1, sl
	movs r0, #2
	ands r1, r0
	movs r2, #0
	mov r8, r1
	mov sl, r2
_0801F2DE:
	movs r2, #0x30
	mov r1, sl
	muls r1, r2, r1
	ldr r0, _0801F51C
	adds r6, r1, r0
	ldr r1, [r6, #0x14]
	cmp r1, #0
	bne _0801F2F0
	b _0801F3E4
_0801F2F0:
	ldr r0, [r6]
	bl sub_0802EF7A
	cmp r0, #0
	bne _0801F2FC
	b _0801F500
_0801F2FC:
	ldr r2, [r6, #0x18]
	movs r1, #0x80
	lsls r0, r1, #9
	ands r0, r2
	cmp r0, #0
	bne _0801F30A
	b _0801F496
_0801F30A:
	ldr r0, [r6]
	bl sub_0802F01E
_0801F310:
	movs r2, #0
	str r2, [r6, #0x14]
_0801F314:
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _0801F3E4
_0801F31A:
	movs r3, #1
	add sl, r3
	mov r3, sl
	cmp r3, #3
	ble _0801F2DE
	ldr r1, _0801F520
	ldr r0, [r1]
	cmp r0, #0
	beq _0801F332
	mov r1, r8
	cmp r1, #0
	beq _0801F382
_0801F332:
	ldr r2, _0801F524
	ldr r3, [r2]
	cmp r3, #0
	beq _0801F340
	mov r1, r8
	cmp r1, #0
	beq _0801F370
_0801F340:
	ldr r1, _0801F528
	ldr r3, [r1]
	cmp r3, #0
	beq _0801F34E
	mov r2, r8
	cmp r2, #0
	beq _0801F35A
_0801F34E:
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801F35A:
	subs r3, #2
	str r3, [r1]
	cmp r3, #0
	bgt _0801F34E
	movs r0, #1
	rsbs r3, r0, #0
	ldr r0, _0801F52C
	str r3, [r0]
	mov r3, r8
	str r3, [r1]
	b _0801F34E
_0801F370:
	subs r3, #2
	str r3, [r2]
	cmp r3, #0
	bgt _0801F340
	str r1, [r2]
	movs r0, #0
	bl sub_0801F800
	b _0801F340
_0801F382:
	ldr r5, _0801F530
	movs r7, #0
	adds r4, r0, #0
_0801F388:
	ldr r3, [r4, #0x24]
	cmp r3, #0
	blt _0801F396
	subs r3, #2
	str r3, [r4, #0x24]
	cmp r3, #0
	ble _0801F3A8
_0801F396:
	ldr r3, [r4, #4]
	cmp r3, #0
	beq _0801F3A4
	adds r4, r3, #0
_0801F39E:
	cmp r7, #0
	bne _0801F332
	b _0801F388
_0801F3A4:
	movs r7, #1
	b _0801F39E
_0801F3A8:
	ldr r3, [r4, #0x38]
	cmp r3, #0
	beq _0801F3B4
	ldr r0, [r6, #0x2c]
	bl _call_via_r3
_0801F3B4:
	ldr r3, [r4, #8]
	ldr r0, [r5]
	ldr r1, [r4]
	bics r0, r3
	str r0, [r5]
	cmp r1, #0
	beq _0801F3D6
	ldr r3, [r4, #4]
	cmp r3, #0
	beq _0801F3D2
	str r3, [r1, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	str r2, [r1]
	b _0801F396
_0801F3D2:
	str r3, [r1, #4]
	b _0801F396
_0801F3D6:
	ldr r0, _0801F520
	ldr r2, [r4, #4]
	str r2, [r0]
	cmp r2, #0
	beq _0801F396
	str r1, [r2]
	b _0801F396
_0801F3E4:
	ldr r0, _0801F520
	ldr r5, [r0]
	cmp r5, #0
	beq _0801F31A
	mov r3, r8
	adds r4, r5, #0
	cmp r3, #0
	beq _0801F3FC
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _0801F3FC
	b _0801F31A
_0801F3FC:
	ldr r3, [r4, #0x30]
	cmp r3, #0
	beq _0801F492
	ldr r0, [r4, #0x3c]
	bl _call_via_r3
	adds r7, r0, #0
_0801F40A:
	ldr r3, [r5, #0x34]
	cmp r3, #0
	beq _0801F48E
	ldr r0, [r5, #0x3c]
	bl _call_via_r3
	adds r4, r0, #0
_0801F418:
	adds r2, r4, #0
	ldr r0, [r5, #0x10]
	adds r1, r7, #0
	bl sub_0802F11E
	movs r2, #1
	rsbs r3, r2, #0
	cmp r0, r3
	bne _0801F42C
	b _0801F31A
_0801F42C:
	str r0, [r6]
	ldr r0, [r5, #0xc]
	str r0, [r6, #4]
	ldr r2, [r5, #0x10]
	str r2, [r6, #8]
	ldr r1, [r5, #0x14]
	str r1, [r6, #0xc]
	ldr r0, [r5, #0x18]
	movs r2, #1
	str r0, [r6, #0x10]
	str r2, [r6, #0x14]
	ldr r1, [r5, #0x28]
	str r1, [r6, #0x18]
	ldr r0, [r5, #0x2c]
	str r0, [r6, #0x1c]
	ldr r2, [r5, #0x30]
	str r2, [r6, #0x20]
	ldr r1, [r5, #0x34]
	str r1, [r6, #0x24]
	ldr r0, [r5, #0x38]
	str r0, [r6, #0x28]
	ldr r2, [r5, #0x3c]
	ldr r0, _0801F530
	str r2, [r6, #0x2c]
	ldr r3, [r5, #8]
	ldr r1, [r0]
	bics r1, r3
	str r1, [r0]
	ldr r1, [r5]
	cmp r1, #0
	beq _0801F47E
	ldr r3, [r5, #4]
	cmp r3, #0
	beq _0801F47A
	str r3, [r1, #4]
	ldr r1, [r5, #4]
	ldr r2, [r5]
	str r2, [r1]
	b _0801F31A
_0801F47A:
	str r3, [r1, #4]
	b _0801F31A
_0801F47E:
	ldr r0, _0801F520
	ldr r2, [r5, #4]
	str r2, [r0]
	cmp r2, #0
	bne _0801F48A
	b _0801F31A
_0801F48A:
	str r1, [r2]
	b _0801F31A
_0801F48E:
	ldr r4, [r5, #0x18]
	b _0801F418
_0801F492:
	ldr r7, [r4, #0x14]
	b _0801F40A
_0801F496:
	movs r1, #0x80
	lsls r0, r1, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0801F4A8
	ldr r0, [r6]
	bl sub_0802F0EA
	b _0801F314
_0801F4A8:
	ldr r3, [r6, #0x20]
	cmp r3, #0
	beq _0801F4B4
	mov r1, r8
	cmp r1, #0
	beq _0801F4D8
_0801F4B4:
	ldr r3, [r6, #0x24]
	cmp r3, #0
	bne _0801F4BC
	b _0801F314
_0801F4BC:
	mov r1, r8
	cmp r1, #0
	beq _0801F4C4
	b _0801F314
_0801F4C4:
	ldr r0, [r6, #0x2c]
	bl _call_via_r3
	adds r4, r0, #0
	adds r1, r4, #0
	ldr r0, [r6]
	bl sub_0802EFC6
	str r4, [r6, #0x10]
	b _0801F314
_0801F4D8:
	ldr r0, [r6, #0x2c]
	bl _call_via_r3
	adds r7, r0, #0
	movs r0, #1
	rsbs r3, r0, #0
	cmp r7, r3
	beq _0801F4F4
	ldr r0, [r6]
	adds r1, r7, #0
	bl sub_0802EFF2
	str r7, [r6, #0xc]
	b _0801F4B4
_0801F4F4:
	ldr r0, [r6]
	bl sub_0802F01E
	mov r3, r8
	str r3, [r6, #0x14]
	b _0801F4B4
_0801F500:
	ldr r3, [r6, #0x28]
	cmp r3, #0
	bne _0801F508
	b _0801F310
_0801F508:
	mov r2, r8
	cmp r2, #0
	beq _0801F510
	b _0801F310
_0801F510:
	ldr r0, [r6, #0x2c]
	bl _call_via_r3
	b _0801F310
_0801F518:
	.4byte gFrameCount
_0801F51C:
	.4byte gSfxVoices
_0801F520:
	.4byte gSfxPendingList
_0801F524:
	.4byte 0x0202E424
_0801F528:
	.4byte 0x0202E42C
_0801F52C:
	.4byte 0x0202E428
_0801F530:
	.4byte gSfxPendingMask

	.global gamesfx_play_at
	.thumb_func
	.type gamesfx_play_at, %function
gamesfx_play_at: @ 0801F534
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r1, #0
	ldr r1, _0801F688
	adds r6, r2, #0
	ldr r2, [r1]
	adds r5, r2, #0
	adds r5, #0xa0
	ldr r1, [r5, #4]
	mov r8, r3
	ldr r7, [sp, #0x18]
	cmp r1, #4
	bne _0801F552
	b _0801F684
_0801F552:
	ldr r5, _0801F68C
	ldr r2, [r5]
	lsls r1, r2, #2
	ldr r2, _0801F690
	ldr r5, [r2, r1]
_0801F55C:
	ldr r3, [r5, #0x24]
	subs r2, r3, r0
	ldr r0, [r5, #0x28]
	subs r3, r0, r4
	asrs r1, r2, #8
	asrs r2, r3, #8
	ldr r3, [r5, #0x2c]
	subs r0, r3, r6
	asrs r3, r0, #8
	adds r0, r1, #0
	muls r0, r1, r0
	adds r1, r2, #0
	muls r1, r2, r1
	adds r6, r0, #0
	adds r2, r1, #0
	adds r1, r6, r2
	adds r6, r3, #0
	muls r6, r3, r6
	adds r0, r6, #0
	adds r6, r1, r0
	movs r1, #0x80
	lsls r0, r1, #8
	cmp r6, r0
	ble _0801F58E
	b _0801F67E
_0801F58E:
	ldr r3, _0801F694
	movs r4, #1
	rsbs r2, r4, #0
	ldr r4, [r3]
	movs r0, #1
	movs r1, #0
_0801F59A:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801F678
	lsls r0, r0, #1
_0801F5A4:
	adds r1, #1
	cmp r1, #0xf
	ble _0801F59A
	movs r4, #1
	rsbs r1, r4, #0
	cmp r2, r1
	beq _0801F66C
	ldr r1, _0801F698
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801F694
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801F5C2:
	cmp r4, #0
	beq _0801F67E
	movs r2, #0x80
	lsls r0, r2, #8
	subs r1, r0, r6
	muls r1, r7, r1
	asrs r0, r1, #0xf
	cmp r0, r7
	ble _0801F664
	adds r0, r7, #0
_0801F5D6:
	ldr r1, _0801F69C
	ldr r2, [r1]
	str r2, [r4, #0xc]
	mov r2, r8
	str r0, [r4, #0x14]
	str r2, [r4, #0x10]
	ldr r1, [sp, #0x1c]
	str r1, [r4, #0x18]
	ldr r2, [sp, #0x20]
	ldr r0, _0801F6A0
	str r2, [r4, #0x1c]
	ldr r1, [r0]
	str r1, [r4, #0x20]
	ldr r2, [sp, #0x24]
	str r2, [r4, #0x24]
	ldr r0, [sp, #0x28]
	movs r1, #0
	str r0, [r4, #0x28]
	str r5, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	ldr r2, _0801F6A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0801F65C
	movs r0, #0
	adds r1, r3, #0
	adds r5, r2, #0
_0801F612:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801F64A
	ldr r0, [r1]
	str r4, [r0, #4]
	ldr r2, [r1]
	str r1, [r4, #4]
	str r2, [r4]
	str r4, [r1]
	ldr r0, [r4]
	cmp r0, #0
	beq _0801F646
_0801F62C:
	movs r0, #1
_0801F62E:
	cmp r0, #0
	beq _0801F612
_0801F632:
	ldr r1, _0801F69C
	ldr r3, [r1]
	adds r0, r3, #0
	adds r3, #1
	str r3, [r1]
_0801F63C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801F646:
	str r4, [r5]
	b _0801F62C
_0801F64A:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F654
	adds r1, r3, #0
	b _0801F62E
_0801F654:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801F62C
_0801F65C:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801F632
_0801F664:
	cmp r0, #0
	bge _0801F5D6
	movs r0, #0
	b _0801F5D6
_0801F66C:
	ldr r0, _0801F6A8
	ldr r1, _0801F6AC
	movs r4, #0
	bl AGBPrintf
	b _0801F5C2
_0801F678:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801F5A4
_0801F67E:
	movs r2, #1
	rsbs r0, r2, #0
	b _0801F63C
_0801F684:
	adds r5, r2, #0
	b _0801F55C
_0801F688:
	.4byte 0x0200436C
_0801F68C:
	.4byte gLocalPlayerIndex
_0801F690:
	.4byte gRacerObjects
_0801F694:
	.4byte gSfxPendingMask
_0801F698:
	.4byte gSfxPendingPool
_0801F69C:
	.4byte gSfxNextId
_0801F6A0:
	.4byte 0x03005660
_0801F6A4:
	.4byte gSfxPendingList
_0801F6A8:
	.4byte gUnk_08051B58
_0801F6AC:
	.4byte gUnk_08051B7C

	.global gamesfx_stop
	.thumb_func
	.type gamesfx_stop, %function
gamesfx_stop: @ 0801F6B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #1
	ldr r0, [r5]
	rsbs r3, r1, #0
	cmp r0, r3
	beq _0801F704
	ldr r2, _0801F74C
	movs r1, #0x80
	lsls r4, r1, #9
	adds r1, r2, #0
	mov ip, r0
	adds r6, r3, #0
	adds r1, #0x90
_0801F6CC:
	ldr r3, [r2, #0x14]
	cmp r3, #0
	beq _0801F6D8
	ldr r3, [r2, #4]
	cmp r3, ip
	beq _0801F742
_0801F6D8:
	adds r2, #0x30
	cmp r2, r1
	ble _0801F6CC
	ldr r4, _0801F750
	ldr r3, [r4]
	cmp r3, #0
	beq _0801F6FE
	ldr r6, _0801F754
	movs r2, #0
	adds r1, r3, #0
_0801F6EC:
	ldr r3, [r1, #0xc]
	cmp r3, r0
	beq _0801F70E
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F70A
	adds r1, r3, #0
_0801F6FA:
	cmp r2, #0
	beq _0801F6EC
_0801F6FE:
	movs r1, #1
	rsbs r2, r1, #0
	str r2, [r5]
_0801F704:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801F70A:
	movs r2, #1
	b _0801F6FA
_0801F70E:
	ldr r3, [r1, #8]
	ldr r0, [r6]
	ldr r2, [r1]
	bics r0, r3
	str r0, [r6]
	cmp r2, #0
	beq _0801F736
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F732
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	ldr r2, [r1]
	str r2, [r0]
_0801F72A:
	movs r0, #1
	rsbs r1, r0, #0
	str r1, [r5]
	b _0801F704
_0801F732:
	str r3, [r2, #4]
	b _0801F72A
_0801F736:
	ldr r3, [r1, #4]
	str r3, [r4]
	cmp r3, #0
	beq _0801F72A
	str r2, [r3]
	b _0801F72A
_0801F742:
	ldr r0, [r2, #0x18]
	orrs r0, r4
	str r0, [r2, #0x18]
	str r6, [r5]
	b _0801F704
_0801F74C:
	.4byte gSfxVoices
_0801F750:
	.4byte gSfxPendingList
_0801F754:
	.4byte gSfxPendingMask

	.global gamesfx_release
	.thumb_func
	.type gamesfx_release, %function
gamesfx_release: @ 0801F758
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #1
	ldr r0, [r5]
	rsbs r3, r1, #0
	cmp r0, r3
	beq _0801F7AC
	ldr r2, _0801F7F4
	movs r1, #0x80
	lsls r4, r1, #0xa
	adds r1, r2, #0
	mov ip, r0
	adds r6, r3, #0
	adds r1, #0x90
_0801F774:
	ldr r3, [r2, #0x14]
	cmp r3, #0
	beq _0801F780
	ldr r3, [r2, #4]
	cmp r3, ip
	beq _0801F7EA
_0801F780:
	adds r2, #0x30
	cmp r2, r1
	ble _0801F774
	ldr r4, _0801F7F8
	ldr r3, [r4]
	cmp r3, #0
	beq _0801F7A6
	ldr r6, _0801F7FC
	movs r2, #0
	adds r1, r3, #0
_0801F794:
	ldr r3, [r1, #0xc]
	cmp r3, r0
	beq _0801F7B6
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F7B2
	adds r1, r3, #0
_0801F7A2:
	cmp r2, #0
	beq _0801F794
_0801F7A6:
	movs r1, #1
	rsbs r2, r1, #0
	str r2, [r5]
_0801F7AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801F7B2:
	movs r2, #1
	b _0801F7A2
_0801F7B6:
	ldr r3, [r1, #8]
	ldr r0, [r6]
	ldr r2, [r1]
	bics r0, r3
	str r0, [r6]
	cmp r2, #0
	beq _0801F7DE
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F7DA
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	ldr r2, [r1]
	str r2, [r0]
_0801F7D2:
	movs r0, #1
	rsbs r1, r0, #0
	str r1, [r5]
	b _0801F7AC
_0801F7DA:
	str r3, [r2, #4]
	b _0801F7D2
_0801F7DE:
	ldr r3, [r1, #4]
	str r3, [r4]
	cmp r3, #0
	beq _0801F7D2
	str r2, [r3]
	b _0801F7D2
_0801F7EA:
	ldr r0, [r2, #0x18]
	orrs r0, r4
	str r0, [r2, #0x18]
	str r6, [r5]
	b _0801F7AC
_0801F7F4:
	.4byte gSfxVoices
_0801F7F8:
	.4byte gSfxPendingList
_0801F7FC:
	.4byte gSfxPendingMask

	.global sub_0801F800
	.thumb_func
	.type sub_0801F800, %function
sub_0801F800: @ 0801F800
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r1, _0801F994
	ldr r0, [r1]
	cmp r0, #0
	beq _0801F818
	ldr r2, _0801F998
	ldr r0, [r2]
	cmp r0, #0
	beq _0801F82C
_0801F818:
	movs r1, #1
	ldr r0, _0801F99C
	rsbs r3, r1, #0
	str r3, [r0]
_0801F820:
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801F82C:
	ldr r0, _0801F9A0
	ldr r1, [r0]
	ldr r4, _0801F9A4
	lsls r6, r1, #4
	adds r0, r6, r4
	ldr r4, [r0]
	movs r3, #1
	rsbs r6, r3, #0
	cmp r4, #1
	bls _0801F842
	b _0801F978
_0801F842:
	ldr r1, [r0, #0xc]
	adds r1, #0xa0
	ldr r7, [r1, #4]
	ldr r2, _0801F9A8
	lsls r3, r7, #1
	ldr r5, _0801F9AC
	adds r3, #4
	ldrsh r1, [r2, r3]
	ldr r2, [r5]
	cmp r2, r1
	beq _0801F86E
	movs r2, #0xc
	muls r2, r1, r2
	adds r6, r2, r4
	ldr r2, _0801F9B0
	lsls r3, r6, #2
	str r1, [r5]
	movs r1, #0x96
	ldr r6, [r2, r3]
	lsls r3, r1, #1
	ldr r1, _0801F9B4
	str r3, [r1]
_0801F86E:
	movs r3, #1
	rsbs r2, r3, #0
	cmp r6, r2
	beq _0801F920
	ldr r3, [r0, #0xc]
	mov sl, r3
	ldr r3, _0801F9B8
	ldr r7, [r0, #4]
	ldr r0, [r0, #8]
	ldr r4, [r3]
	mov r8, r0
	movs r5, #0
	movs r0, #1
	movs r1, #0
_0801F88A:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801F972
	lsls r0, r0, #1
_0801F894:
	adds r1, #1
	cmp r1, #0xf
	ble _0801F88A
	movs r3, #1
	rsbs r4, r3, #0
	cmp r2, r4
	beq _0801F966
	ldr r1, _0801F9BC
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801F9B8
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801F8B2:
	cmp r4, #0
	beq _0801F960
	ldr r1, _0801F9C0
	ldr r2, [r1]
	mov r3, r8
	str r7, [r4, #0x14]
	movs r7, #3
	str r2, [r4, #0xc]
	str r7, [r4, #0x1c]
	str r6, [r4, #0x10]
	str r3, [r4, #0x18]
	ldr r0, _0801F9C4
	ldr r7, _0801F9C8
	ldr r1, [r0]
	movs r2, #0x1e
	str r7, [r4, #0x38]
	mov r7, sl
	str r2, [r4, #0x24]
	str r1, [r4, #0x20]
	str r5, [r4, #0x28]
	str r5, [r4, #0x2c]
	str r5, [r4, #0x30]
	str r5, [r4, #0x34]
	str r7, [r4, #0x3c]
	ldr r2, _0801F9CC
	ldr r3, [r2]
	cmp r3, #0
	beq _0801F958
	movs r0, #0
	adds r1, r3, #0
	adds r5, r2, #0
_0801F8F0:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801F946
	ldr r0, [r1]
	str r4, [r0, #4]
	ldr r2, [r1]
	str r1, [r4, #4]
	str r2, [r4]
	str r4, [r1]
	ldr r0, [r4]
	cmp r0, #0
	beq _0801F942
_0801F90A:
	movs r0, #1
_0801F90C:
	cmp r0, #0
	beq _0801F8F0
_0801F910:
	ldr r1, _0801F9C0
	ldr r2, [r1]
	mov ip, r2
	adds r2, #1
	str r2, [r1]
	mov r2, ip
_0801F91C:
	ldr r0, _0801F99C
	str r2, [r0]
_0801F920:
	ldr r1, _0801F994
	ldr r2, [r1]
	subs r2, #1
	str r2, [r1]
	ldr r0, _0801F9A0
	ldr r3, [r0]
	adds r2, r3, #1
	adds r3, r2, #0
	cmp r2, #0
	blt _0801F93E
_0801F934:
	asrs r1, r3, #3
	lsls r3, r1, #3
	subs r1, r2, r3
	str r1, [r0]
	b _0801F820
_0801F93E:
	adds r3, #7
	b _0801F934
_0801F942:
	str r4, [r5]
	b _0801F90A
_0801F946:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801F950
	adds r1, r3, #0
	b _0801F90C
_0801F950:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801F90A
_0801F958:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801F910
_0801F960:
	movs r0, #1
	rsbs r2, r0, #0
	b _0801F91C
_0801F966:
	ldr r0, _0801F9D0
	ldr r1, _0801F9D4
	movs r4, #0
	bl AGBPrintf
	b _0801F8B2
_0801F972:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801F894
_0801F978:
	ldr r1, [r0, #0xc]
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r3, r2, #1
	ldr r2, _0801F9A8
	adds r3, #4
	ldrsh r6, [r2, r3]
	movs r1, #0xc
	muls r1, r6, r1
	ldr r2, _0801F9B0
	adds r6, r1, r4
	lsls r1, r6, #2
	ldr r6, [r2, r1]
	b _0801F86E
_0801F994:
	.4byte 0x0202E41C
_0801F998:
	.4byte 0x0202E424
_0801F99C:
	.4byte 0x0202E420
_0801F9A0:
	.4byte 0x0202E418
_0801F9A4:
	.4byte 0x0202E398
_0801F9A8:
	.4byte 0x0202D74C
_0801F9AC:
	.4byte 0x0202E428
_0801F9B0:
	.4byte gUnk_08051B90
_0801F9B4:
	.4byte 0x0202E42C
_0801F9B8:
	.4byte gSfxPendingMask
_0801F9BC:
	.4byte gSfxPendingPool
_0801F9C0:
	.4byte gSfxNextId
_0801F9C4:
	.4byte 0x03005660
_0801F9C8:
	.4byte sub_0801F800
_0801F9CC:
	.4byte gSfxPendingList
_0801F9D0:
	.4byte gUnk_08051B58
_0801F9D4:
	.4byte gUnk_08051B7C

	.global gamesfx_play_voice
	.thumb_func
	.type gamesfx_play_voice, %function
gamesfx_play_voice: @ 0801F9D8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0801FB78
	adds r4, r1, #0
	movs r3, #1
	ldr r1, [r0]
	rsbs r0, r3, #0
	cmp r1, r0
	beq _0801FA3E
_0801F9EA:
	cmp r2, #0
	beq _0801F9F4
_0801F9EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801F9F4:
	ldr r5, _0801FB7C
	ldr r0, [r5]
	cmp r0, #7
	bgt _0801F9EE
	ldr r2, _0801FB80
	ldr r7, [r2]
	adds r3, r7, r0
	adds r2, r3, #0
	cmp r3, #0
	blt _0801FA3A
_0801FA08:
	asrs r1, r2, #3
	lsls r7, r1, #3
	subs r1, r3, r7
	lsls r7, r1, #4
	ldr r1, _0801FB84
	adds r2, r7, r1
	adds r1, r6, #0
	adds r1, #0xa0
	ldr r7, [r1, #4]
	ldr r1, _0801FB88
	lsls r3, r7, #1
	adds r3, #4
	ldrsh r1, [r1, r3]
	ldr r3, _0801FB8C
	str r1, [r3]
	movs r1, #0x7f
	movs r3, #0x80
	str r1, [r2, #4]
	lsls r1, r3, #9
	str r1, [r2, #8]
	adds r1, r0, #1
	str r4, [r2]
	str r6, [r2, #0xc]
	str r1, [r5]
	b _0801F9EE
_0801FA3A:
	adds r2, r3, #7
	b _0801FA08
_0801FA3E:
	ldr r3, _0801FB90
	ldr r0, [r3]
	cmp r0, #0
	bne _0801F9EA
	adds r7, r1, #0
	cmp r4, #1
	bls _0801FA4E
	b _0801FB5C
_0801FA4E:
	adds r5, r6, #0
	adds r5, #0xa0
	ldr r1, [r5, #4]
	ldr r2, _0801FB88
	lsls r3, r1, #1
	ldr r0, _0801FB8C
	adds r3, #4
	ldrsh r1, [r2, r3]
	ldr r2, [r0]
	cmp r2, r1
	beq _0801FA7A
	movs r2, #0xc
	muls r2, r1, r2
	adds r7, r2, r4
	ldr r2, _0801FB94
	lsls r3, r7, #2
	str r1, [r0]
	ldr r7, [r2, r3]
	movs r1, #0x96
	ldr r0, _0801FB98
	lsls r3, r1, #1
	str r3, [r0]
_0801FA7A:
	movs r3, #1
	rsbs r2, r3, #0
	cmp r7, r2
	beq _0801F9EE
	ldr r3, _0801FB9C
	ldr r4, [r3]
	movs r5, #0
	movs r0, #1
	movs r1, #0
_0801FA8C:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801FB56
	lsls r0, r0, #1
_0801FA96:
	adds r1, #1
	cmp r1, #0xf
	ble _0801FA8C
	movs r3, #1
	rsbs r4, r3, #0
	cmp r2, r4
	beq _0801FB4A
	ldr r1, _0801FBA0
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801FB9C
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801FAB4:
	cmp r4, #0
	beq _0801FB44
	ldr r2, _0801FBA4
	ldr r0, [r2]
	movs r1, #0x7f
	movs r2, #0x80
	str r0, [r4, #0xc]
	str r1, [r4, #0x14]
	lsls r0, r2, #9
	movs r1, #3
	str r1, [r4, #0x1c]
	str r7, [r4, #0x10]
	str r0, [r4, #0x18]
	ldr r2, _0801FBA8
	ldr r0, [r2]
	ldr r2, _0801FBAC
	movs r1, #0x1e
	str r2, [r4, #0x38]
	str r0, [r4, #0x20]
	str r1, [r4, #0x24]
	str r5, [r4, #0x28]
	str r5, [r4, #0x2c]
	str r5, [r4, #0x30]
	str r5, [r4, #0x34]
	str r6, [r4, #0x3c]
	ldr r2, _0801FBB0
	ldr r3, [r2]
	cmp r3, #0
	beq _0801FB3C
	movs r0, #0
	adds r1, r3, #0
	adds r5, r2, #0
_0801FAF4:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801FB2A
	ldr r0, [r1]
	str r4, [r0, #4]
	ldr r2, [r1]
	str r1, [r4, #4]
	str r2, [r4]
	str r4, [r1]
	ldr r0, [r4]
	cmp r0, #0
	beq _0801FB26
_0801FB0E:
	movs r0, #1
_0801FB10:
	cmp r0, #0
	beq _0801FAF4
_0801FB14:
	ldr r1, _0801FBA4
	ldr r2, [r1]
	mov ip, r2
	adds r2, #1
	str r2, [r1]
	mov r2, ip
_0801FB20:
	ldr r0, _0801FB78
	str r2, [r0]
	b _0801F9EE
_0801FB26:
	str r4, [r5]
	b _0801FB0E
_0801FB2A:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801FB34
	adds r1, r3, #0
	b _0801FB10
_0801FB34:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801FB0E
_0801FB3C:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801FB14
_0801FB44:
	movs r0, #1
	rsbs r2, r0, #0
	b _0801FB20
_0801FB4A:
	ldr r0, _0801FBB4
	ldr r1, _0801FBB8
	movs r4, #0
	bl AGBPrintf
	b _0801FAB4
_0801FB56:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801FA96
_0801FB5C:
	adds r1, r6, #0
	adds r1, #0xa0
	ldr r7, [r1, #4]
	ldr r0, _0801FB88
	lsls r2, r7, #1
	adds r2, #4
	ldrsh r1, [r0, r2]
	movs r0, #0xc
	muls r0, r1, r0
	ldr r1, _0801FB94
	adds r7, r0, r4
	lsls r0, r7, #2
	ldr r7, [r1, r0]
	b _0801FA7A
_0801FB78:
	.4byte 0x0202E420
_0801FB7C:
	.4byte 0x0202E41C
_0801FB80:
	.4byte 0x0202E418
_0801FB84:
	.4byte 0x0202E398
_0801FB88:
	.4byte 0x0202D74C
_0801FB8C:
	.4byte 0x0202E428
_0801FB90:
	.4byte 0x0202E424
_0801FB94:
	.4byte gUnk_08051B90
_0801FB98:
	.4byte 0x0202E42C
_0801FB9C:
	.4byte gSfxPendingMask
_0801FBA0:
	.4byte gSfxPendingPool
_0801FBA4:
	.4byte gSfxNextId
_0801FBA8:
	.4byte 0x03005660
_0801FBAC:
	.4byte sub_0801F800
_0801FBB0:
	.4byte gSfxPendingList
_0801FBB4:
	.4byte gUnk_08051B58
_0801FBB8:
	.4byte gUnk_08051B7C

	.global sub_0801FBBC
	.thumb_func
	.type sub_0801FBBC, %function
sub_0801FBBC: @ 0801FBBC
	push {r4, lr}
	sub sp, #8
	mov r0, sp
	ldr r4, _0801FC00
	adds r0, #6
	strh r4, [r0]
	ldr r1, _0801FC04
	ldr r2, _0801FC08
	bl sub_080325DC
	add r0, sp, #4
	strh r4, [r0]
	ldr r1, _0801FC0C
	ldr r2, _0801FC10
	bl sub_080325DC
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _0801FC14
	ldr r2, _0801FC18
	bl sub_080325DC
	ldr r1, _0801FC1C
	movs r2, #0
	ldr r0, _0801FC20
	str r2, [r1]
	ldr r1, _0801FC24
	str r2, [r0]
	ldr r0, _0801FC28
	str r2, [r1]
	ldr r1, _0801FC2C
	str r2, [r0]
	b _0801FC30
_0801FC00:
	.4byte 0x00000000
_0801FC04:
	.4byte gSfxPendingPool
_0801FC08:
	.4byte 0x01000200
_0801FC0C:
	.4byte gSfxVoices
_0801FC10:
	.4byte 0x01000060
_0801FC14:
	.4byte 0x0202E398
_0801FC18:
	.4byte 0x01000040
_0801FC1C:
	.4byte gSfxPendingList
_0801FC20:
	.4byte gSfxPendingMask
_0801FC24:
	.4byte gSfxNextId
_0801FC28:
	.4byte 0x0202E418
_0801FC2C:
	.4byte 0x0202E41C
_0801FC30:
	movs r3, #1
	ldr r0, _0801FC50
	str r2, [r1]
	rsbs r1, r3, #0
	str r1, [r0]
	ldr r0, _0801FC54
	str r2, [r0]
	ldr r0, _0801FC58
	str r1, [r0]
	ldr r0, _0801FC5C
	add sp, #8
	str r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801FC50:
	.4byte 0x0202E420
_0801FC54:
	.4byte 0x0202E424
_0801FC58:
	.4byte 0x0202E428
_0801FC5C:
	.4byte 0x0202E42C

	.global sub_0801FC60
	.thumb_func
	.type sub_0801FC60, %function
sub_0801FC60: @ 0801FC60
	push {r4, r5, lr}
	movs r5, #0
_0801FC64:
	movs r2, #0x30
	adds r1, r5, #0
	muls r1, r2, r1
	ldr r0, _0801FCA0
	adds r4, r1, r0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0801FC88
	ldr r0, [r4]
	bl sub_0802EF7A
	cmp r0, #0
	beq _0801FC88
	ldr r0, [r4]
	bl sub_0802F01E
	movs r0, #0
	str r0, [r4, #0x14]
_0801FC88:
	adds r5, #1
	cmp r5, #3
	ble _0801FC64
	ldr r3, _0801FCA4
	ldr r1, _0801FCA8
	movs r0, #0
	str r0, [r3]
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801FCA0:
	.4byte gSfxVoices
_0801FCA4:
	.4byte gSfxPendingList
_0801FCA8:
	.4byte gSfxPendingMask

	.global gamesfx_play
	.thumb_func
	.type gamesfx_play, %function
gamesfx_play: @ 0801FCAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r3
	ldr r3, _0801FD90
	adds r5, r0, #0
	ldr r4, [r3]
	movs r0, #1
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	rsbs r2, r0, #0
_0801FCC4:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801FD8A
	lsls r0, r0, #1
_0801FCCE:
	adds r1, #1
	cmp r1, #0xf
	ble _0801FCC4
	movs r4, #1
	rsbs r1, r4, #0
	cmp r2, r1
	beq _0801FD7E
	ldr r1, _0801FD94
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801FD90
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801FCEC:
	cmp r4, #0
	beq _0801FD78
	ldr r0, _0801FD98
	ldr r2, [r0]
	mov r3, r8
	str r2, [r4, #0xc]
	str r5, [r4, #0x10]
	str r6, [r4, #0x14]
	str r7, [r4, #0x18]
	str r3, [r4, #0x1c]
	ldr r1, _0801FD9C
	ldr r0, [r1]
	str r0, [r4, #0x20]
	ldr r2, [sp, #0x18]
	str r2, [r4, #0x24]
	ldr r1, [sp, #0x1c]
	movs r0, #0
	str r1, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	ldr r2, _0801FDA0
	ldr r3, [r2]
	cmp r3, #0
	beq _0801FD70
	adds r1, r3, #0
	adds r5, r2, #0
_0801FD26:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801FD5E
	ldr r2, [r1]
	str r4, [r2, #4]
	ldr r0, [r1]
	str r1, [r4, #4]
	str r0, [r4]
	str r4, [r1]
	ldr r2, [r4]
	cmp r2, #0
	beq _0801FD5A
_0801FD40:
	movs r0, #1
_0801FD42:
	cmp r0, #0
	beq _0801FD26
_0801FD46:
	ldr r1, _0801FD98
	ldr r3, [r1]
	adds r0, r3, #0
	adds r3, #1
	str r3, [r1]
_0801FD50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801FD5A:
	str r4, [r5]
	b _0801FD40
_0801FD5E:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801FD68
	adds r1, r3, #0
	b _0801FD42
_0801FD68:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801FD40
_0801FD70:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801FD46
_0801FD78:
	movs r2, #1
	rsbs r0, r2, #0
	b _0801FD50
_0801FD7E:
	ldr r0, _0801FDA4
	ldr r1, _0801FDA8
	movs r4, #0
	bl AGBPrintf
	b _0801FCEC
_0801FD8A:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801FCCE
_0801FD90:
	.4byte gSfxPendingMask
_0801FD94:
	.4byte gSfxPendingPool
_0801FD98:
	.4byte gSfxNextId
_0801FD9C:
	.4byte 0x03005660
_0801FDA0:
	.4byte gSfxPendingList
_0801FDA4:
	.4byte gUnk_08051B58
_0801FDA8:
	.4byte gUnk_08051B7C

	.global gamesfx_play_cb
	.thumb_func
	.type gamesfx_play_cb, %function
gamesfx_play_cb: @ 0801FDAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r3, #0
	ldr r3, _0801FE98
	adds r6, r0, #0
	ldr r4, [r3]
	movs r0, #1
	adds r7, r1, #0
	mov r8, r2
	movs r1, #0
	rsbs r2, r0, #0
_0801FDC4:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801FE90
	lsls r0, r0, #1
_0801FDCE:
	adds r1, #1
	cmp r1, #0xf
	ble _0801FDC4
	movs r4, #1
	rsbs r1, r4, #0
	cmp r2, r1
	beq _0801FE84
	ldr r1, _0801FE9C
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801FE98
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801FDEC:
	cmp r4, #0
	beq _0801FE7E
	ldr r0, _0801FEA0
	ldr r2, [r0]
	str r5, [r4, #0x10]
	str r2, [r4, #0xc]
	ldr r1, [sp, #0x18]
	str r1, [r4, #0x14]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x18]
	ldr r2, [sp, #0x20]
	ldr r1, _0801FEA4
	str r2, [r4, #0x1c]
	ldr r0, [r1]
	str r0, [r4, #0x20]
	ldr r2, [sp, #0x24]
	str r2, [r4, #0x24]
	ldr r1, [sp, #0x28]
	movs r0, #0
	mov r3, r8
	str r1, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r6, [r4, #0x30]
	str r7, [r4, #0x34]
	str r0, [r4, #0x38]
	str r3, [r4, #0x3c]
	ldr r2, _0801FEA8
	ldr r3, [r2]
	cmp r3, #0
	beq _0801FE76
	adds r1, r3, #0
	adds r5, r2, #0
_0801FE2C:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801FE64
	ldr r2, [r1]
	str r4, [r2, #4]
	ldr r0, [r1]
	str r1, [r4, #4]
	str r0, [r4]
	str r4, [r1]
	ldr r2, [r4]
	cmp r2, #0
	beq _0801FE60
_0801FE46:
	movs r0, #1
_0801FE48:
	cmp r0, #0
	beq _0801FE2C
_0801FE4C:
	ldr r1, _0801FEA0
	ldr r3, [r1]
	adds r0, r3, #0
	adds r3, #1
	str r3, [r1]
_0801FE56:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801FE60:
	str r4, [r5]
	b _0801FE46
_0801FE64:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801FE6E
	adds r1, r3, #0
	b _0801FE48
_0801FE6E:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801FE46
_0801FE76:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801FE4C
_0801FE7E:
	movs r2, #1
	rsbs r0, r2, #0
	b _0801FE56
_0801FE84:
	ldr r0, _0801FEAC
	ldr r1, _0801FEB0
	movs r4, #0
	bl AGBPrintf
	b _0801FDEC
_0801FE90:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801FDCE
	.byte 0x00, 0x00
_0801FE98:
	.4byte gSfxPendingMask
_0801FE9C:
	.4byte gSfxPendingPool
_0801FEA0:
	.4byte gSfxNextId
_0801FEA4:
	.4byte 0x03005660
_0801FEA8:
	.4byte gSfxPendingList
_0801FEAC:
	.4byte gUnk_08051B58
_0801FEB0:
	.4byte gUnk_08051B7C

	.global gamesfx_play_endcb
	.thumb_func
	.type gamesfx_play_endcb, %function
gamesfx_play_endcb: @ 0801FEB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	ldr r3, _0801FF9C
	adds r7, r0, #0
	ldr r4, [r3]
	movs r0, #1
	mov r8, r1
	adds r5, r2, #0
	movs r1, #0
	rsbs r2, r0, #0
_0801FECC:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0801FF96
	lsls r0, r0, #1
_0801FED6:
	adds r1, #1
	cmp r1, #0xf
	ble _0801FECC
	movs r4, #1
	rsbs r1, r4, #0
	cmp r2, r1
	beq _0801FF8A
	ldr r1, _0801FFA0
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _0801FF9C
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801FEF4:
	cmp r4, #0
	beq _0801FF84
	ldr r2, _0801FFA4
	ldr r1, [r2]
	str r5, [r4, #0x10]
	str r1, [r4, #0xc]
	str r6, [r4, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r1, _0801FFA8
	str r2, [r4, #0x1c]
	ldr r0, [r1]
	str r0, [r4, #0x20]
	ldr r2, [sp, #0x20]
	str r2, [r4, #0x24]
	ldr r1, [sp, #0x24]
	movs r0, #0
	mov r3, r8
	str r1, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r7, [r4, #0x38]
	str r3, [r4, #0x3c]
	ldr r2, _0801FFAC
	ldr r3, [r2]
	cmp r3, #0
	beq _0801FF7C
	adds r1, r3, #0
	adds r5, r2, #0
_0801FF32:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _0801FF6A
	ldr r0, [r1]
	str r4, [r0, #4]
	ldr r2, [r1]
	str r1, [r4, #4]
	str r2, [r4]
	str r4, [r1]
	ldr r0, [r4]
	cmp r0, #0
	beq _0801FF66
_0801FF4C:
	movs r0, #1
_0801FF4E:
	cmp r0, #0
	beq _0801FF32
_0801FF52:
	ldr r1, _0801FFA4
	ldr r3, [r1]
	adds r0, r3, #0
	adds r3, #1
	str r3, [r1]
_0801FF5C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0801FF66:
	str r4, [r5]
	b _0801FF4C
_0801FF6A:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0801FF74
	adds r1, r3, #0
	b _0801FF4E
_0801FF74:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _0801FF4C
_0801FF7C:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0801FF52
_0801FF84:
	movs r2, #1
	rsbs r0, r2, #0
	b _0801FF5C
_0801FF8A:
	ldr r0, _0801FFB0
	ldr r1, _0801FFB4
	movs r4, #0
	bl AGBPrintf
	b _0801FEF4
_0801FF96:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801FED6
_0801FF9C:
	.4byte gSfxPendingMask
_0801FFA0:
	.4byte gSfxPendingPool
_0801FFA4:
	.4byte gSfxNextId
_0801FFA8:
	.4byte 0x03005660
_0801FFAC:
	.4byte gSfxPendingList
_0801FFB0:
	.4byte gUnk_08051B58
_0801FFB4:
	.4byte gUnk_08051B7C

	.global gamesfx_play_cb_endcb
	.thumb_func
	.type gamesfx_play_cb_endcb, %function
gamesfx_play_cb_endcb: @ 0801FFB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r3
	ldr r3, _080200A4
	adds r5, r0, #0
	ldr r4, [r3]
	movs r0, #1
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	rsbs r2, r0, #0
_0801FFD0:
	adds r3, r0, #0
	ands r3, r4
	cmp r3, #0
	beq _0802009E
	lsls r0, r0, #1
_0801FFDA:
	adds r1, #1
	cmp r1, #0xf
	ble _0801FFD0
	movs r4, #1
	rsbs r1, r4, #0
	cmp r2, r1
	beq _08020092
	ldr r1, _080200A8
	lsls r3, r2, #6
	adds r4, r3, r1
	str r0, [r4, #8]
	ldr r1, _080200A4
	ldr r2, [r1]
	orrs r2, r0
	str r2, [r1]
_0801FFF8:
	cmp r4, #0
	beq _0802008C
	ldr r1, _080200AC
	ldr r0, [r1]
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x18]
	str r2, [r4, #0x10]
	ldr r1, [sp, #0x1c]
	str r1, [r4, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x18]
	ldr r2, [sp, #0x24]
	ldr r1, _080200B0
	str r2, [r4, #0x1c]
	ldr r0, [r1]
	str r0, [r4, #0x20]
	ldr r2, [sp, #0x28]
	str r2, [r4, #0x24]
	ldr r1, [sp, #0x2c]
	mov r3, r8
	movs r0, #0
	str r1, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r5, [r4, #0x30]
	str r6, [r4, #0x34]
	str r7, [r4, #0x38]
	str r3, [r4, #0x3c]
	ldr r2, _080200B4
	ldr r3, [r2]
	cmp r3, #0
	beq _08020084
	adds r1, r3, #0
	adds r5, r2, #0
_0802003A:
	ldr r2, [r4, #0x1c]
	ldr r3, [r1, #0x1c]
	cmp r2, r3
	bge _08020072
	ldr r2, [r1]
	str r4, [r2, #4]
	ldr r0, [r1]
	str r1, [r4, #4]
	str r0, [r4]
	str r4, [r1]
	ldr r2, [r4]
	cmp r2, #0
	beq _0802006E
_08020054:
	movs r0, #1
_08020056:
	cmp r0, #0
	beq _0802003A
_0802005A:
	ldr r1, _080200AC
	ldr r3, [r1]
	adds r0, r3, #0
	adds r3, #1
	str r3, [r1]
_08020064:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802006E:
	str r4, [r5]
	b _08020054
_08020072:
	ldr r3, [r1, #4]
	cmp r3, #0
	beq _0802007C
	adds r1, r3, #0
	b _08020056
_0802007C:
	str r1, [r4]
	str r4, [r1, #4]
	str r3, [r4, #4]
	b _08020054
_08020084:
	str r3, [r4]
	str r3, [r4, #4]
	str r4, [r2]
	b _0802005A
_0802008C:
	movs r2, #1
	rsbs r0, r2, #0
	b _08020064
_08020092:
	ldr r0, _080200B8
	ldr r1, _080200BC
	movs r4, #0
	bl AGBPrintf
	b _0801FFF8
_0802009E:
	adds r2, r1, #0
	movs r1, #0x10
	b _0801FFDA
_080200A4:
	.4byte gSfxPendingMask
_080200A8:
	.4byte gSfxPendingPool
_080200AC:
	.4byte gSfxNextId
_080200B0:
	.4byte 0x03005660
_080200B4:
	.4byte gSfxPendingList
_080200B8:
	.4byte gUnk_08051B58
_080200BC:
	.4byte gUnk_08051B7C

	.global sub_080200C0
	.thumb_func
	.type sub_080200C0, %function
sub_080200C0: @ 080200C0
	push {r4, r5, lr}
	movs r5, #0
_080200C4:
	movs r2, #0x30
	adds r1, r5, #0
	muls r1, r2, r1
	ldr r0, _080200F4
	adds r4, r1, r0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080200E6
	ldr r0, [r4]
	bl sub_0802EF7A
	cmp r0, #0
	beq _080200E6
	ldr r0, [r4]
	movs r1, #0
	bl sub_0802EFF2
_080200E6:
	adds r5, #1
	cmp r5, #3
	ble _080200C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080200F4:
	.4byte gSfxVoices

	.global sub_080200F8
	.thumb_func
	.type sub_080200F8, %function
sub_080200F8: @ 080200F8
	push {r4, r5, lr}
	movs r5, #0
_080200FC:
	movs r2, #0x30
	adds r1, r5, #0
	muls r1, r2, r1
	ldr r0, _0802012C
	adds r4, r1, r0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0802011E
	ldr r0, [r4]
	bl sub_0802EF7A
	cmp r0, #0
	beq _0802011E
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl sub_0802EFF2
_0802011E:
	adds r5, #1
	cmp r5, #3
	ble _080200FC
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0802012C:
	.4byte gSfxVoices

	.global sub_08020130
	.thumb_func
	.type sub_08020130, %function
sub_08020130: @ 08020130
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r4, [r6, #0x30]
	ldr r0, [r5, #0x30]
	ldr r3, [r6, #0x34]
	subs r1, r0, r4
	ldr r4, [r5, #0x34]
	asrs r0, r1, #4
	adds r7, r2, #0
	subs r1, r4, r3
	ldr r2, [r6, #0x38]
	ldr r3, [r5, #0x38]
	asrs r4, r1, #4
	subs r1, r3, r2
	asrs r2, r1, #4
	adds r1, r0, #0
	muls r1, r0, r1
	adds r3, r4, #0
	muls r3, r4, r3
	adds r0, r1, #0
	adds r1, r2, #0
	muls r1, r2, r1
	adds r4, r0, r3
	ldr r3, _080201F8
	adds r0, r4, r1
	mov r8, r3
	bl _call_via_r8
	ldr r3, [r6, #0x24]
	adds r4, r0, #0
	ldr r0, [r5, #0x24]
	subs r1, r0, r3
	asrs r0, r1, #4
	ldr r2, [r6, #0x28]
	ldr r1, [r5, #0x28]
	subs r3, r1, r2
	asrs r1, r3, #4
	ldr r2, [r6, #0x2c]
	ldr r3, [r5, #0x2c]
	subs r5, r3, r2
	asrs r2, r5, #4
	adds r5, r0, #0
	muls r5, r0, r5
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r2, #0
	muls r1, r2, r1
	adds r0, r5, #0
	adds r5, r0, r3
	adds r0, r5, r1
	bl _call_via_r8
	asrs r5, r4, #1
	asrs r1, r0, #1
	subs r3, r5, r1
	ldr r1, _080201FC
	lsls r0, r3, #4
	adds r2, r0, r1
	lsls r5, r2, #8
	subs r4, r1, r0
	adds r0, r5, #0
	cmp r5, #0
	blt _080201F2
_080201B4:
	adds r1, r4, #0
	cmp r4, #0
	blt _080201EE
_080201BA:
	ldr r2, _08020200
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _080201EA
_080201C8:
	adds r2, r0, #0
	muls r2, r7, r2
	movs r1, #0x80
	asrs r0, r2, #8
	lsls r3, r1, #0xb
	cmp r0, r3
	ble _080201E2
	adds r0, r3, #0
_080201D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_080201E2:
	cmp r0, #0
	bge _080201D8
	movs r0, #0
	b _080201D8
_080201EA:
	rsbs r0, r0, #0
	b _080201C8
_080201EE:
	rsbs r1, r4, #0
	b _080201BA
_080201F2:
	rsbs r0, r5, #0
	b _080201B4
	.byte 0x00, 0x00
_080201F8:
	.4byte sub_03000744
_080201FC:
	.4byte 0x00000DAC
_08020200:
	.4byte sub_0300034C

	.global sub_08020204
	.thumb_func
	.type sub_08020204, %function
sub_08020204: @ 08020204
	ldr r1, _0802020C
	str r0, [r1]
	bx lr
	.byte 0x00, 0x00
_0802020C:
	.4byte 0x0202E424

	.global sub_08020210
	.thumb_func
	.type sub_08020210, %function
sub_08020210: @ 08020210
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, _08020268
	adds r1, r5, #0
	adds r1, #0xa0
	ldr r0, [r1, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08020262
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r3, [r2, #4]
	cmp r3, r1
	beq _08020234
_0802022E:
	pop {r4, r5}
	pop {r0}
	bx r0
_08020234:
	ldr r1, [r2, #4]
	cmp r0, r1
	beq _0802022E
	movs r3, #0x87
	lsls r0, r3, #1
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08020256
	cmp r0, #1
	bne _0802022E
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl gamesfx_play_voice
	b _0802022E
_08020256:
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl gamesfx_play_voice
	b _0802022E
_08020262:
	adds r2, r4, #0
	adds r2, #0xa0
	b _08020234
_08020268:
	.4byte gLocalPlayerIndex

	.global sub_0802026C
	.thumb_func
	.type sub_0802026C, %function
sub_0802026C: @ 0802026C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _080202C4
	adds r0, r1, #0
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r5, [r1, #4]
	ldr r1, [r2]
	cmp r5, r1
	beq _080202BE
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r3, [r2, #4]
	cmp r3, r1
	beq _08020290
_0802028A:
	pop {r4, r5}
	pop {r0}
	bx r0
_08020290:
	ldr r1, [r2, #4]
	cmp r5, r1
	beq _0802028A
	movs r3, #0x87
	lsls r1, r3, #1
	adds r3, r0, r1
	ldrh r1, [r3]
	cmp r1, #0
	beq _080202B2
	cmp r1, #1
	bne _0802028A
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl gamesfx_play_voice
	b _0802028A
_080202B2:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl gamesfx_play_voice
	b _0802028A
_080202BE:
	adds r2, r0, #0
	adds r2, #0xa0
	b _08020290
_080202C4:
	.4byte gLocalPlayerIndex
