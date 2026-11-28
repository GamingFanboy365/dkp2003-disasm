@ asm/game.s: ROM 0x0004B8-0x0013D8 (rom, VMA 0x080004B8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global game_init
	.thumb_func
	.type game_init, %function
game_init: @ 080004B8
	push {r4, r5, lr}
	ldr r5, _0800052C
	ldr r4, _08000530
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, _08000534
	adds r1, r4, #0
	sub sp, #8
	bl AGBPrintf
	bl AGBPrintFlush
	adds r2, r5, #0
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _080004E2
	b _080007FC
_080004E2:
	ldr r0, _0800051C
	ldr r1, _08000538
	ldr r3, _08000520
	strh r0, [r1]
	adds r1, #4
	strh r3, [r1]
	ldr r4, _08000524
	mov r1, sp
	adds r1, #6
	movs r0, #0xc0
	strh r4, [r1]
	lsls r2, r0, #0x13
	ldr r4, _0800053C
	ldr r0, _08000540
	str r1, [r4]
	str r2, [r4, #4]
	str r0, [r4, #8]
	ldr r2, _08000528
	ldr r3, [r4, #8]
	movs r0, #0xe0
	strh r2, [r1]
	ldr r2, _08000544
	str r1, [r4]
	lsls r1, r0, #0x13
	str r1, [r4, #4]
	str r2, [r4, #8]
	ldr r3, [r4, #8]
	b _08000548
	.byte 0x00, 0x00
_0800051C:
	.4byte 0x0000FFFF
_08000520:
	.4byte 0x00000010
_08000524:
	.4byte 0x00000000
_08000528:
	.4byte 0x0000F8F8
_0800052C:
	.4byte gGameSetup
_08000530:
	.4byte gUnk_0804F5A0
_08000534:
	.4byte gUnk_0804F5AC
_08000538:
	.4byte 0x04000050
_0800053C:
	.4byte 0x040000D4
_08000540:
	.4byte 0x81008000
_08000544:
	.4byte 0x81000200
_08000548:
	bl music_stop
	bl snd_stop_all
	bl sound_disable
	ldr r4, _080005C8
	ldr r3, _080005CC
	ldr r0, [r4]
	ands r0, r3
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	cmp r1, #3
	bne _08000568
	b _080007F0
_08000568:
	ldr r1, _080005D0
	movs r3, #9
	str r3, [r1]
	bl obj_reset_all
	movs r5, #0x80
	ldr r0, [r4]
	lsls r4, r5, #6
	ands r0, r4
	cmp r0, #0
	bne _08000580
	b _080007EA
_08000580:
	bl race_setup_ovl_b
_08000584:
	bl spr_init
	bl particles_init
	bl anims_clear
	ldr r3, _080005BC
	ldr r1, _080005D4
	ldr r5, _080005D8
	strh r3, [r1]
	ldr r4, _080005C0
	ldrh r0, [r5]
	orrs r0, r4
	strh r0, [r5]
	ldr r4, _080005DC
	ldr r3, _080005C4
	ldrh r1, [r4]
	orrs r1, r3
	strh r1, [r4]
	ldr r0, _080005E0
	ldr r1, _080005E4
	ldr r2, _080005C8
	str r0, [r1]
	movs r5, #0x80
	ldr r0, [r2]
	lsls r4, r5, #6
	ands r0, r4
	b _080005E8
_080005BC:
	.4byte 0x00000000
_080005C0:
	.4byte 0x00000002
_080005C4:
	.4byte 0x00000010
_080005C8:
	.4byte gModeFlags
_080005CC:
	.4byte 0xFFFFDDCC
_080005D0:
	.4byte gFrameCount
_080005D4:
	.4byte 0x04000208
_080005D8:
	.4byte 0x04000200
_080005DC:
	.4byte 0x04000004
_080005E0:
	.4byte race_vblank
_080005E4:
	.4byte gIrqHandler
_080005E8:
	cmp r0, #0
	bne _080005EE
	b _080007E4
_080005EE:
	ldr r2, _08000630
	str r2, [r1, #4]
_080005F2:
	ldr r2, _08000634
	ldr r4, _0800062C
	ldr r5, _08000638
	strh r4, [r2]
	ldr r0, [r5]
	movs r3, #0x40
	orrs r0, r3
	str r0, [r5]
	movs r1, #0x80
	ldr r0, [r5]
	lsls r3, r1, #7
	orrs r0, r3
	str r0, [r5]
	ldr r1, _0800063C
	ldr r0, _08000640
	str r1, [r0]
	bl sound_enable
	ldr r5, _08000644
	movs r0, #0
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bne _08000622
	b _080007CC
_08000622:
	cmp r3, #1
	bne _08000628
	b _080007A6
_08000628:
	b _08000648
	.byte 0x00, 0x00
_0800062C:
	.4byte 0x00000001
_08000630:
	.4byte 0x03004DA0
_08000634:
	.4byte 0x04000208
_08000638:
	.4byte gModeFlags
_0800063C:
	.4byte game_process
_08000640:
	.4byte gStateFunc
_08000644:
	.4byte gGameSetup
_08000648:
	cmp r3, #2
	bne _0800064E
	b _0800078E
_0800064E:
	cmp r3, #3
	bne _08000654
	b _08000778
_08000654:
	cmp r3, #4
	bne _0800065A
	b _08000760
_0800065A:
	cmp r3, #5
	bne _08000660
	b _08000772
_08000660:
	cmp r3, #6
	bne _08000666
	b _0800075A
_08000666:
	adds r2, r5, #0
	adds r2, #0x88
	movs r0, #0
	ldrsh r5, [r2, r0]
	movs r1, #0
	cmp r1, r5
	bge _08000688
	adds r0, r2, #0
	movs r4, #1
	adds r2, #8
_0800067A:
	strb r4, [r2]
	movs r5, #0
	ldrsh r3, [r0, r5]
	adds r1, #1
	adds r2, #1
	cmp r1, r3
	blt _0800067A
_08000688:
	bl hits_find_play_area
	ldr r1, _080007B4
	movs r0, #0
	ldrsh r2, [r1, r0]
	cmp r2, #3
	beq _0800074C
	bl aiPlayerInit
	bl playerInit
	bl weaponInit
_080006A2:
	bl ghost_start
	bl gamesfx_init
	bl music_queue_reset
	ldr r4, _080007B4
	adds r2, r4, #0
	adds r2, #0x86
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r5, #0x94
	muls r5, r0, r5
	ldr r3, _080007B8
	adds r5, #0x34
	ldr r0, [r3, r5]
	bl obj_spawn_level_object
	movs r0, #0x19
	bl obj_new
	movs r1, #4
	bl obj_initialise
	ldr r5, _080007BC
	ldr r1, [r5]
	movs r2, #3
	strb r2, [r1, #2]
	movs r1, #5
	ldr r0, [r5]
	bl obj_initialise
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #3
	beq _0800073E
	movs r0, #0x27
	bl obj_new
	movs r1, #6
	bl obj_initialise
_080006F6:
	ldr r1, _080007B4
	movs r5, #0
	ldrsh r3, [r1, r5]
	cmp r3, #6
	beq _08000730
	cmp r3, #3
	beq _0800072C
	cmp r3, #7
	beq _08000728
	movs r0, #6
	bl obj_new
	movs r1, #7
	bl obj_initialise
_08000714:
	ldr r0, _080007C0
	ldr r1, _080007C4
	bl AGBPrintf
	bl AGBPrintFlush
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
_08000728:
	movs r0, #0x2f
	b _08000732
_0800072C:
	movs r0, #0x33
	b _08000732
_08000730:
	movs r0, #0x28
_08000732:
	bl obj_new
	movs r1, #7
	bl obj_initialise
	b _08000714
_0800073E:
	movs r0, #0x36
	bl obj_new
	movs r1, #6
	bl obj_initialise
	b _080006F6
_0800074C:
	bl ai_boss_init_1
	bl ai_boss_init_2
	bl weaponbossInit
	b _080006A2
_0800075A:
	bl race_grid_setup
	b _08000666
_08000760:
	movs r0, #0x2a
	ldrsh r4, [r5, r0]
	cmp r4, #0
	beq _0800076A
	b _08000666
_0800076A:
	bl assign_cpu_characters
	bl char_bias_random
_08000772:
	bl race_grid_setup
	b _08000666
_08000778:
	movs r3, #0x28
	ldrsh r0, [r5, r3]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _080007C8
	adds r1, #0x14
	ldr r0, [r3, r1]
	strh r0, [r5, #6]
	bl clear_char_bias
	b _08000796
_0800078E:
	ldr r0, _080007B0
	strh r0, [r5, #6]
	bl setup_char_bias
_08000796:
	adds r1, r5, #0
	adds r1, #0x3e
	strb r4, [r1]
	adds r4, r5, #0
	adds r4, #0x3f
	movs r2, #0
	strb r2, [r4]
	b _08000666
_080007A6:
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _08000666
_080007B0:
	.4byte 0x00000008
_080007B4:
	.4byte gGameSetup
_080007B8:
	.4byte gUnk_087146C0
_080007BC:
	.4byte 0x0200436C
_080007C0:
	.4byte gUnk_0804F5C0
_080007C4:
	.4byte gUnk_0804F5A0
_080007C8:
	.4byte gCups
_080007CC:
	movs r1, #0x2a
	ldrsh r4, [r5, r1]
	cmp r4, #0
	beq _080007D6
	b _08000666
_080007D6:
	bl assign_cpu_characters
	bl setup_char_bias
	bl race_grid_setup_cup
	b _08000666
_080007E4:
	ldr r5, _08000814
	str r5, [r1, #4]
	b _080005F2
_080007EA:
	bl race_setup_ovl_a
	b _08000584
_080007F0:
	ldr r5, [r4]
	movs r3, #0x80
	lsls r1, r3, #6
	orrs r5, r1
	str r5, [r4]
	b _08000568
_080007FC:
	ldr r0, _08000818
	ldr r1, _0800081C
	str r0, [sp]
	adds r2, r4, #0
	ldr r0, _08000820
	movs r3, #0xc0
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080004E2
_08000814:
	.4byte 0x030055A4
_08000818:
	.4byte gUnk_0804F5CC
_0800081C:
	.4byte gUnk_0804F5E0
_08000820:
	.4byte gUnk_0804F5EC

	.global game_process
	.thumb_func
	.type game_process, %function
game_process: @ 08000824
	push {r4, r5, r6, lr}
	ldr r5, _0800087C
	bl _call_via_r5
	bl particles_update
	bl anims_update
	ldr r4, _08000880
	bl _call_via_r4
	ldr r5, _08000874
	bl obj_flush_deletes
	bl music_jingle_update
	bl gamesfx_update
	ldr r0, _08000884
	ldr r4, _08000888
	strh r5, [r0]
	ldr r2, [r4]
	movs r1, #0x80
	orrs r2, r1
	str r2, [r4]
	ldr r6, [r4]
	lsls r3, r1, #2
	ldr r1, _08000878
	eors r6, r3
	str r6, [r4]
	strh r1, [r0]
	bl rspr_queue_reset
	bl pal_slots_reset
	ldr r1, _0800088C
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08000890
	.byte 0x00, 0x00
_08000874:
	.4byte 0x00000000
_08000878:
	.4byte 0x00000001
_0800087C:
	.4byte obj_process_staggered
_08000880:
	.4byte obj_draw_all
_08000884:
	.4byte 0x04000208
_08000888:
	.4byte gModeFlags
_0800088C:
	.4byte gGameSetup
_08000890:
	cmp r0, #2
	bne _08000896
	b _080009B8
_08000896:
	ldr r6, _0800093C
	ldr r0, [r6]
	movs r1, #0x31
	ands r0, r1
	cmp r0, #0
	beq _08000964
	bl obj_free_all
	bl gamesfx_stop_all
	ldr r4, _08000940
	ldr r5, _08000944
	str r5, [r4]
	ldr r5, _08000948
	ldr r0, _0800094C
	str r5, [r4, #4]
	movs r3, #3
	ldrh r2, [r0]
	rsbs r1, r3, #0
	ands r1, r2
	strh r1, [r0]
	ldr r1, _08000950
	movs r3, #0x11
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	str r5, [r4, #8]
	movs r3, #5
	ldrh r2, [r0]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r0]
	movs r3, #0x21
	ldrh r2, [r1]
	rsbs r0, r3, #0
	ands r0, r2
	strh r0, [r1]
	movs r1, #0x80
	ldr r0, [r6]
	lsls r3, r1, #6
	ands r0, r3
	cmp r0, #0
	beq _080009B2
	bl dma0_stop_2
_080008F2:
	bl ghost_reset
	ldr r1, _0800093C
	ldr r3, _08000954
	ldr r0, [r1]
	ands r0, r3
	str r0, [r1]
	ldr r3, _08000934
	ldr r0, _08000958
	strh r3, [r0]
	ldr r3, _08000938
	adds r0, #4
	strh r3, [r0]
	ldr r0, [r1]
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _0800096A
	ldr r0, [r1]
	subs r2, #3
	ands r0, r2
	str r0, [r1]
	ldr r0, _0800095C
	ldr r1, _08000960
	bl AGBPrintf
	bl AGBPrintFlush
	movs r0, #0
_0800092C:
	bl mcp_process
	b _08000964
	.byte 0x00, 0x00
_08000934:
	.4byte 0x000000FF
_08000938:
	.4byte 0x00000010
_0800093C:
	.4byte gModeFlags
_08000940:
	.4byte gIrqHandler
_08000944:
	.4byte vblank_handler
_08000948:
	.4byte irq_null
_0800094C:
	.4byte 0x04000200
_08000950:
	.4byte 0x04000004
_08000954:
	.4byte 0xFFFFBFFF
_08000958:
	.4byte 0x04000050
_0800095C:
	.4byte gUnk_0804F628
_08000960:
	.4byte gUnk_0804F634
_08000964:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800096A:
	ldr r0, [r1]
	movs r2, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800098C
	ldr r0, [r1]
	subs r2, #0x41
	ands r0, r2
	str r0, [r1]
	ldr r0, _080009D4
	ldr r1, _080009D8
	bl AGBPrintf
	bl AGBPrintFlush
	movs r0, #1
	b _0800092C
_0800098C:
	ldr r0, [r1]
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08000964
	ldr r0, [r1]
	subs r2, #0x21
	ands r0, r2
	str r0, [r1]
	ldr r0, _080009DC
	ldr r1, _080009D8
	bl AGBPrintf
	bl AGBPrintFlush
	movs r0, #2
	bl mcp_process
	b _08000964
_080009B2:
	bl dma0_stop
	b _080008F2
_080009B8:
	ldr r2, _080009E0
	ldr r0, _080009E4
	ldrh r6, [r2]
	ands r0, r6
	cmp r0, #0
	bne _080009C6
	b _08000896
_080009C6:
	strh r5, [r1, #2]
	ldr r1, [r4]
	movs r3, #1
	orrs r1, r3
	str r1, [r4]
	b _08000896
	.byte 0x00, 0x00
_080009D4:
	.4byte gUnk_0804F644
_080009D8:
	.4byte gUnk_0804F634
_080009DC:
	.4byte gUnk_0804F654
_080009E0:
	.4byte gKeysHeld
_080009E4:
	.4byte 0x0000030F

	.global race_vblank
	.thumb_func
	.type race_vblank, %function
race_vblank: @ 080009E8
	push {r4, lr}
	bl vblank_handler_noaudio
	ldr r2, _08000A74
	movs r4, #0x80
	ldr r0, [r2]
	lsls r1, r4, #6
	ands r0, r1
	cmp r0, #0
	beq _08000A6C
	bl race_regs_commit_b
_08000A00:
	ldr r4, _08000A74
	movs r1, #0x80
	ldr r0, [r4]
	lsls r3, r1, #8
	ands r0, r3
	cmp r0, #0
	beq _08000A54
	ldr r1, [r4]
	ldr r0, _08000A78
	ands r1, r0
	str r1, [r4]
	ldr r0, [r4]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08000A54
	ldr r1, [r4]
	movs r0, #0x81
	rsbs r3, r0, #0
	ldr r0, _08000A7C
	ands r1, r3
	str r1, [r4]
	ldr r1, [r0]
	adds r1, #0xa0
	ldr r2, [r1, #4]
	cmp r2, #4
	beq _08000A66
_08000A36:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r3, r0, #6
	ands r1, r3
	cmp r1, #0
	beq _08000A5E
	ldr r2, _08000A80
	bl _call_via_r2
_08000A48:
	ldr r2, _08000A84
	bl _call_via_r2
	ldr r0, _08000A88
	bl _call_via_r0
_08000A54:
	bl snd_update_if_enabled
	pop {r4}
	pop {r0}
	bx r0
_08000A5E:
	ldr r1, _08000A8C
	bl _call_via_r1
	b _08000A48
_08000A66:
	bl camera_follow_vblank
	b _08000A36
_08000A6C:
	bl race_regs_commit_a
	b _08000A00
	.byte 0x00, 0x00
_08000A74:
	.4byte gModeFlags
_08000A78:
	.4byte 0xFFFF7FFF
_08000A7C:
	.4byte 0x0200436C
_08000A80:
	.4byte 0x03004378
_08000A84:
	.4byte rspr_upload_frames
_08000A88:
	.4byte pal_flush
_08000A8C:
	.4byte 0x03004668

	.global race_audio_update
	.thumb_func
	.type race_audio_update, %function
race_audio_update: @ 08000A90
	push {lr}
	bl snd_update
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global race_shutdown
	.thumb_func
	.type race_shutdown, %function
race_shutdown: @ 08000A9C
	push {r4, r5, lr}
	bl obj_free_all
	bl gamesfx_stop_all
	ldr r4, _08000AFC
	ldr r5, _08000B00
	str r5, [r4]
	ldr r5, _08000B04
	ldr r0, _08000B08
	str r5, [r4, #4]
	movs r3, #3
	ldrh r2, [r0]
	rsbs r1, r3, #0
	ands r1, r2
	strh r1, [r0]
	ldr r1, _08000B0C
	movs r3, #0x11
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	str r5, [r4, #8]
	movs r3, #5
	ldrh r2, [r0]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r0]
	movs r3, #0x21
	ldrh r2, [r1]
	rsbs r0, r3, #0
	ands r0, r2
	strh r0, [r1]
	ldr r2, _08000B10
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #6
	ands r0, r1
	cmp r0, #0
	beq _08000AF6
	bl dma0_stop_2
_08000AF0:
	pop {r4, r5}
	pop {r0}
	bx r0
_08000AF6:
	bl dma0_stop
	b _08000AF0
_08000AFC:
	.4byte gIrqHandler
_08000B00:
	.4byte vblank_handler
_08000B04:
	.4byte irq_null
_08000B08:
	.4byte 0x04000200
_08000B0C:
	.4byte 0x04000004
_08000B10:
	.4byte gModeFlags

	.global lfsr_next
	.thumb_func
	.type lfsr_next, %function
lfsr_next: @ 08000B14
	push {r4, lr}
	ldr r4, _08000B50
	ldr r2, [r4]
	lsrs r1, r2, #0x1b
	lsrs r3, r2, #6
	eors r3, r1
	lsrs r1, r2, #0x1c
	eors r3, r1
	lsrs r1, r2, #0x1d
	eors r3, r1
	movs r1, #1
	lsls r0, r2, #1
	ands r3, r1
	orrs r0, r3
	str r0, [r4]
	cmp r0, #0
	beq _08000B58
_08000B36:
	ldr r2, [r4]
	ldr r0, _08000B54
	lsrs r1, r2, #0x10
	ands r0, r2
	ldr r2, _08000B4C
	ands r1, r2
	orrs r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08000B4C:
	.4byte 0x0000EACE
_08000B50:
	.4byte 0x0200429C
_08000B54:
	.4byte 0x00001531
_08000B58:
	ldr r1, _08000B6C
	ldr r0, _08000B70
	str r1, [r4]
	bl AGBPrintf
	ldr r0, _08000B74
	bl AGBPrintf
	b _08000B36
	.byte 0x00, 0x00
_08000B6C:
	.4byte 0x45535241
_08000B70:
	.4byte gUnk_0804F664
_08000B74:
	.4byte gUnk_0804F674

	.global multi_lfsr_next
	.thumb_func
	.type multi_lfsr_next, %function
multi_lfsr_next: @ 08000B78
	push {r4, lr}
	ldr r4, _08000BB4
	ldr r2, [r4]
	lsrs r1, r2, #0x1b
	lsrs r3, r2, #6
	eors r3, r1
	lsrs r1, r2, #0x1c
	eors r3, r1
	lsrs r1, r2, #0x1d
	eors r3, r1
	movs r1, #1
	lsls r0, r2, #1
	ands r3, r1
	orrs r0, r3
	str r0, [r4]
	cmp r0, #0
	beq _08000BBC
_08000B9A:
	ldr r2, [r4]
	ldr r0, _08000BB8
	lsrs r1, r2, #0x10
	ands r0, r2
	ldr r2, _08000BB0
	ands r1, r2
	orrs r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08000BB0:
	.4byte 0x0000EACE
_08000BB4:
	.4byte 0x020042A0
_08000BB8:
	.4byte 0x00001531
_08000BBC:
	ldr r1, _08000BD0
	ldr r0, _08000BD4
	str r1, [r4]
	bl AGBPrintf
	ldr r0, _08000BD8
	bl AGBPrintf
	b _08000B9A
	.byte 0x00, 0x00
_08000BD0:
	.4byte 0x45535241
_08000BD4:
	.4byte gUnk_0804F690
_08000BD8:
	.4byte gUnk_0804F6A8

	.global lfsr_seed
	.thumb_func
	.type lfsr_seed, %function
lfsr_seed: @ 08000BDC
	push {lr}
	ldr r1, _08000BF0
	ldr r0, _08000BF4
	str r1, [r0]
	ldr r0, _08000BF8
	bl AGBPrintf
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08000BF0:
	.4byte 0x45535241
_08000BF4:
	.4byte 0x0200429C
_08000BF8:
	.4byte gUnk_0804F664

	.global multi_lfsr_seed
	.thumb_func
	.type multi_lfsr_seed, %function
multi_lfsr_seed: @ 08000BFC
	push {lr}
	ldr r1, _08000C10
	ldr r0, _08000C14
	str r1, [r0]
	ldr r0, _08000C18
	bl AGBPrintf
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08000C10:
	.4byte 0x45535241
_08000C14:
	.4byte 0x020042A0
_08000C18:
	.4byte gUnk_0804F690

	.global level_anim_tiles_update
	.thumb_func
	.type level_anim_tiles_update, %function
level_anim_tiles_update: @ 08000C1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08000CA8
	ldr r2, [r1, #0x50]
	cmp r2, #0
	beq _08000C54
	movs r3, #0
	ldr r0, [r2]
	mov ip, r3
	cmp ip, r0
	bhs _08000C54
	ldr r7, _08000CAC
	ldr r5, _08000CB0
	mov r8, r1
	mov lr, r2
_08000C3C:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08000C5E
	subs r3, #1
	str r3, [r5, #4]
_08000C46:
	movs r1, #1
	add ip, r1
	mov r1, lr
	ldr r0, [r1]
	adds r5, #8
	cmp ip, r0
	blo _08000C3C
_08000C54:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08000C5E:
	mov r1, r8
	ldr r0, [r1, #0x50]
	mov r1, ip
	lsls r6, r1, #2
	ldr r3, [r5]
	adds r4, r6, r0
	ldr r2, [r4, #4]
	lsls r3, r3, #2
	adds r3, r3, r2
	ldrh r0, [r2, #2]
	ldrh r1, [r2]
	ldrh r4, [r2, #4]
	ldrh r6, [r2, #6]
	ldr r2, [r3, #8]
	str r2, [r7]
	ldr r2, _08000CB4
	lsls r1, r1, #5
	adds r3, r1, r2
	str r3, [r7, #4]
	movs r3, #0x80
	lsls r1, r0, #5
	lsls r2, r3, #0x18
	orrs r1, r2
	str r1, [r7, #8]
	ldr r0, [r5]
	adds r0, #1
	ldr r3, [r7, #8]
	str r0, [r5]
	cmp r0, r4
	beq _08000CA0
_08000C9A:
	subs r2, r6, #1
	str r2, [r5, #4]
	b _08000C46
_08000CA0:
	movs r1, #0
	str r1, [r5]
	b _08000C9A
	.byte 0x00, 0x00
_08000CA8:
	.4byte 0x020042A4
_08000CAC:
	.4byte 0x040000D4
_08000CB0:
	.4byte 0x020042F8
_08000CB4:
	.4byte 0x0600C000

	.global race_setup_ovl_a
	.thumb_func
	.type race_setup_ovl_a, %function
race_setup_ovl_a: @ 08000CB8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r6, _08000D1C
	movs r5, #0x80
	ldr r4, _08000D20
	ldr r2, _08000D24
	ldr r0, _08000D28
	lsrs r7, r6, #1
	lsls r6, r5, #0x18
	orrs r7, r6
	sub sp, #4
	str r2, [r4]
	ldr r1, _08000D14
	str r0, [r4, #4]
	mov r2, sp
	str r7, [r4, #8]
	adds r2, #2
	ldr r3, [r4, #8]
	ldr r0, _08000D2C
	strh r1, [r2]
	str r2, [r4]
	ldr r2, _08000D30
	str r2, [r4, #4]
	lsls r1, r5, #0x13
	str r0, [r4, #8]
	ldr r5, _08000D34
	ldr r7, _08000D18
	ldr r3, [r4, #8]
	adds r2, r5, #0
	strh r7, [r1]
	adds r2, #0x84
	ldrh r0, [r2]
	movs r3, #0x2c
	muls r3, r0, r3
	ldr r1, _08000D38
	adds r2, r3, #0
	adds r2, #0xc
	adds r3, #0x10
	ldr r7, _08000D3C
	ldr r0, [r1, r2]
	b _08000D40
	.byte 0x00, 0x00
_08000D14:
	.4byte 0x00000000
_08000D18:
	.4byte 0x00001741
_08000D1C:
	.4byte __ovl_a_size
_08000D20:
	.4byte 0x040000D4
_08000D24:
	.4byte __ovl_a_lma
_08000D28:
	.4byte 0x03003FC8
_08000D2C:
	.4byte 0x81000A00
_08000D30:
	.4byte 0x02000820
_08000D34:
	.4byte gGameSetup
_08000D38:
	.4byte gCourses
_08000D3C:
	.4byte 0x020042A4
_08000D40:
	ldr r2, [r1, r3]
	str r0, [r7]
	str r2, [r7, #4]
	adds r5, #0x86
	bl pal_load
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r0, #0x94
	muls r2, r0, r2
	ldr r1, _08000E70
	adds r5, r2, #4
	ldr r0, [r1, r5]
	adds r5, r0, #2
	str r5, [r4]
	ldr r5, _08000E74
	str r5, [r4, #4]
	ldrh r5, [r0]
	lsls r0, r5, #5
	adds r5, r2, #0
	orrs r0, r6
	adds r5, #0xc
	str r0, [r4, #8]
	ldr r0, [r1, r5]
	adds r5, r0, #2
	ldr r3, [r4, #8]
	str r5, [r4]
	ldr r5, _08000E78
	str r5, [r4, #4]
	ldrh r5, [r0]
	lsls r0, r5, #4
	adds r5, r2, #0
	orrs r0, r6
	adds r5, #0x10
	str r0, [r4, #8]
	ldr r0, [r1, r5]
	adds r5, r0, #2
	ldr r3, [r4, #8]
	str r5, [r4]
	ldr r5, _08000E7C
	str r5, [r4, #4]
	ldrh r5, [r0]
	lsls r0, r5, #5
	orrs r0, r6
	str r0, [r4, #8]
	adds r6, r2, #0
	adds r6, #8
	ldr r3, [r4, #8]
	adds r5, r2, #0
	ldr r4, [r1, r6]
	adds r6, r2, #0
	adds r5, #0x14
	adds r6, #0x1c
	ldr r0, [r1, r5]
	str r4, [r7, #0x50]
	adds r5, r2, #0
	ldr r4, [r1, r6]
	adds r6, r2, #0
	adds r5, #0x24
	adds r6, #0x20
	str r0, [r7, #8]
	str r4, [r7, #0xc]
	ldr r0, [r1, r5]
	ldr r4, [r1, r6]
	adds r5, r2, #0
	adds r5, #0x18
	str r4, [r7, #0x10]
	ldr r4, [r1, r5]
	adds r5, #0x10
	str r0, [r7, #0x14]
	adds r6, r2, #0
	ldr r0, [r1, r5]
	adds r6, #0x2c
	adds r2, #0x30
	str r4, [r7, #0x24]
	str r0, [r7, #0x28]
	ldr r5, [r1, r6]
	ldr r0, [r1, r2]
	str r5, [r7, #0x2c]
	str r0, [r7, #0x30]
	cmp r4, #0
	bne _08000DE6
	b _08000FB0
_08000DE6:
	movs r4, #0xa0
	lsls r3, r4, #8
_08000DEA:
	str r3, [r7, #0x18]
	ldr r2, _08000E80
	ldr r1, [r2, #0x24]
	cmp r1, #2
	bne _08000DF6
	b _08000FAC
_08000DF6:
	ldr r3, _08000E84
_08000DF8:
	ldr r7, _08000E80
	str r3, [r2, #0x1c]
	ldr r6, [r7, #0x24]
	ldr r3, _08000E88
	ldr r2, [r7, #0x50]
	movs r5, #0
	orrs r6, r3
	str r6, [r7, #0x20]
	str r5, [r7, #0x4c]
	str r5, [r7, #0x48]
	str r5, [r7, #0x44]
	str r5, [r7, #0x40]
	str r5, [r7, #0x3c]
	str r5, [r7, #0x38]
	str r5, [r7, #0x34]
	cmp r2, #0
	beq _08000E36
	ldr r0, [r2]
	movs r1, #0
	cmp r1, r0
	bhs _08000E36
	adds r4, r2, #0
	ldr r2, _08000E8C
	movs r0, #0
_08000E28:
	str r0, [r2]
	str r0, [r2, #4]
	ldr r7, [r4]
	adds r1, #1
	adds r2, #8
	cmp r1, r7
	blo _08000E28
_08000E36:
	ldr r2, _08000E6C
	ldr r3, _08000E90
	movs r0, #0x1f
_08000E3C:
	subs r0, #1
	strh r2, [r3]
	adds r3, #2
	cmp r0, #0
	bge _08000E3C
	movs r7, #3
	mov sl, r7
	ldr r7, _08000E80
	ldr r2, _08000E94
	mov sb, r7
	mov r8, r2
	ldr r3, _08000E98
	mov r2, sb
	ldr r7, [r2, #0x14]
	movs r6, #0
	mov lr, r3
_08000E5C:
	asrs r3, r6, #2
	adds r5, r6, #0
	mov r2, sl
	movs r0, #0
	mov ip, r3
	ands r5, r2
	lsls r4, r6, #5
	b _08000E9C
_08000E6C:
	.4byte 0x00000000
_08000E70:
	.4byte gUnk_087146C0
_08000E74:
	.4byte 0x0600C000
_08000E78:
	.4byte 0x06000C80
_08000E7C:
	.4byte 0x06004000
_08000E80:
	.4byte 0x020042A4
_08000E84:
	.4byte 0x0000A002
_08000E88:
	.4byte 0x00006084
_08000E8C:
	.4byte 0x020042F8
_08000E90:
	.4byte 0x06000640
_08000E94:
	.4byte gGroundBlocks
_08000E98:
	.4byte 0x06000040
_08000E9C:
	mov r3, lr
	adds r1, r4, r3
	ldrh r3, [r7]
	mov r2, ip
	muls r2, r3, r2
	adds r3, r2, #0
	asrs r2, r0, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	adds r2, r3, r7
	ldrh r3, [r2, #4]
	lsls r2, r3, #2
	adds r3, r2, r5
	movs r2, #1
	ands r2, r0
	lsls r3, r3, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, r8
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0xf
	ble _08000E9C
	adds r6, #1
	cmp r6, #9
	ble _08000E5C
	movs r3, #3
	ldr r7, _08000FB4
	mov lr, r3
	ldr r2, _08000FB8
	mov r3, sb
	mov r8, r7
	ldr r7, [r3, #0xc]
	movs r6, #0
	mov sl, r2
	mov sb, r8
_08000EE8:
	adds r5, r6, #0
	mov r2, lr
	asrs r3, r6, #2
	movs r0, #0
	ands r5, r2
	lsls r4, r6, #6
	mov ip, r3
_08000EF6:
	ldrh r3, [r7]
	mov r2, sl
	adds r1, r4, r2
	mov r2, ip
	muls r2, r3, r2
	adds r3, r2, #0
	asrs r2, r0, #2
	adds r3, r3, r2
	lsls r3, r3, #1
	adds r2, r3, r7
	ldrh r3, [r2, #4]
	lsls r2, r3, #2
	adds r3, r2, r5
	mov fp, r3
	adds r2, r0, #0
	mov r3, lr
	ands r2, r3
	mov r3, fp
	lsls r3, r3, #2
	mov fp, r3
	add r2, fp
	lsls r3, r2, #1
	mov r2, r8
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0x1f
	ble _08000EF6
	adds r6, #1
	cmp r6, #9
	ble _08000EE8
	ldr r4, _08000FBC
	ldr r3, [r4, #0x10]
	ldr r7, _08000FC0
	movs r6, #0
	mov ip, r3
	movs r3, #3
	mov lr, sb
	mov sl, r3
	mov r8, r6
	mov sb, r7
_08000F4A:
	adds r5, r6, #0
	mov r2, sl
	mov r3, r8
	asrs r7, r6, #2
	movs r0, #0
	ands r5, r2
	lsls r4, r3, #1
	mov fp, r7
_08000F5A:
	mov r7, ip
	ldrh r3, [r7]
	mov r2, sb
	adds r1, r4, r2
	mov r2, fp
	muls r2, r3, r2
	adds r7, r2, #0
	asrs r2, r0, #2
	adds r3, r7, r2
	lsls r7, r3, #1
	add r7, ip
	ldrh r2, [r7, #4]
	lsls r7, r2, #2
	adds r3, r7, r5
	adds r2, r0, #0
	mov r7, sl
	ands r2, r7
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, lr
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0x1f
	ble _08000F5A
	movs r1, #0x20
	adds r6, #1
	add r8, r1
	cmp r6, #9
	ble _08000F4A
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08000FAC:
	ldr r3, _08000FC4
	b _08000DF8
_08000FB0:
	ldr r3, _08000FC4
	b _08000DEA
_08000FB4:
	.4byte gUnk_081108A0
_08000FB8:
	.4byte 0x06000180
_08000FBC:
	.4byte 0x020042A4
_08000FC0:
	.4byte 0x06000400
_08000FC4:
	.4byte 0x0000A001

	.global dma0_stop
	.thumb_func
	.type dma0_stop, %function
dma0_stop: @ 08000FC8
	ldr r0, _08000FD0
	movs r1, #0
	str r1, [r0]
	bx lr
_08000FD0:
	.4byte 0x040000B8

	.global race_regs_commit_a
	.thumb_func
	.type race_regs_commit_a, %function
race_regs_commit_a: @ 08000FD4
	ldr r0, _08001018
	ldr r2, _0800101C
	ldr r3, [r0]
	str r3, [r2]
	ldrh r3, [r0, #4]
	adds r2, #4
	strh r3, [r2]
	ldr r3, [r0, #8]
	adds r2, #4
	str r3, [r2]
	ldr r3, [r0, #0xc]
	adds r2, #4
	str r3, [r2]
	ldrh r3, [r0, #0x10]
	adds r2, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #0x12]
	adds r2, #4
	strh r3, [r2]
	ldr r3, [r0, #0x14]
	adds r2, #4
	str r3, [r2]
	ldr r3, [r0, #0x18]
	adds r2, #4
	str r3, [r2]
	ldr r3, [r0, #0x1c]
	adds r2, #0x24
	str r3, [r2]
	movs r3, #0xa0
	ldrh r1, [r0, #6]
	lsls r0, r3, #0x13
	strh r1, [r0]
	bx lr
	.byte 0x00, 0x00
_08001018:
	.4byte 0x02000820
_0800101C:
	.4byte 0x04000008

	.global race_setup_ovl_b
	.thumb_func
	.type race_setup_ovl_b, %function
race_setup_ovl_b: @ 08001020
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r2, _08001080
	movs r0, #0x80
	ldr r4, _08001084
	lsls r1, r0, #0x18
	ldr r5, _08001088
	ldr r6, _0800108C
	lsrs r7, r2, #1
	orrs r7, r1
	str r5, [r4]
	mov sb, r1
	str r6, [r4, #4]
	ldr r5, _0800107C
	str r7, [r4, #8]
	movs r1, #0x80
	lsls r6, r1, #0x13
	ldr r3, [r4, #8]
	strh r5, [r6]
	ldr r5, _08001090
	adds r2, r5, #0
	adds r2, #0x84
	ldrh r0, [r2]
	movs r3, #0x2c
	muls r3, r0, r3
	ldr r1, _08001094
	adds r7, r3, #0
	adds r7, #0xc
	adds r3, #0x10
	ldr r6, _08001098
	ldr r0, [r1, r7]
	ldr r7, [r1, r3]
	str r0, [r6]
	str r7, [r6, #4]
	adds r5, #0x86
	sub sp, #4
	bl pal_load
	movs r3, #0
	ldrsh r7, [r5, r3]
	movs r0, #0x94
	b _0800109C
_0800107C:
	.4byte 0x00001C42
_08001080:
	.4byte __ovl_b_size
_08001084:
	.4byte 0x040000D4
_08001088:
	.4byte __ovl_b_lma
_0800108C:
	.4byte 0x03003FC8
_08001090:
	.4byte gGameSetup
_08001094:
	.4byte gCourses
_08001098:
	.4byte 0x02004320
_0800109C:
	muls r7, r0, r7
	ldr r2, _08001274
	adds r1, r7, #4
	ldr r0, [r2, r1]
	adds r5, r0, #2
	str r5, [r4]
	ldr r1, _08001278
	ldrh r5, [r0]
	str r1, [r4, #4]
	lsls r0, r5, #5
	mov r1, sb
	orrs r0, r1
	adds r1, r7, #0
	adds r1, #0x10
	str r0, [r4, #8]
	ldr r0, [r2, r1]
	adds r5, r0, #2
	ldr r3, [r4, #8]
	ldr r1, _0800127C
	str r5, [r4]
	ldrh r5, [r0]
	str r1, [r4, #4]
	lsls r0, r5, #5
	mov r1, sb
	orrs r0, r1
	adds r5, r7, #0
	str r0, [r4, #8]
	adds r5, #0x14
	ldr r1, [r2, r5]
	adds r5, #0x10
	ldr r3, [r4, #8]
	adds r0, r7, #0
	ldr r4, [r2, r5]
	adds r0, #0x1c
	adds r7, #0x20
	ldr r5, [r2, r0]
	str r4, [r6, #0xc]
	movs r0, #0
	ldr r4, [r2, r7]
	ldr r3, _08001280
	movs r2, #3
	str r0, [r6, #0x24]
	str r0, [r6, #0x20]
	movs r0, #0xc0
	mov sl, r2
	mov lr, r3
	lsls r2, r0, #0x13
	str r1, [r6, #8]
	str r5, [r6, #0x10]
	str r4, [r6, #0x14]
	movs r7, #0
	mov r8, r2
	mov fp, r6
	mov ip, r1
	mov sb, lr
_0800110A:
	adds r5, r7, #0
	mov r3, sl
	movs r0, #0
	asrs r6, r7, #2
	ands r5, r3
	lsls r4, r7, #7
_08001116:
	mov r2, r8
	adds r1, r4, r2
	mov r2, ip
	ldrh r3, [r2]
	muls r3, r6, r3
	asrs r2, r0, #1
	adds r3, r3, r2
	lsls r2, r3, #1
	add r2, ip
	ldrh r3, [r2, #4]
	lsls r2, r3, #2
	adds r3, r2, r5
	movs r2, #1
	ands r2, r0
	lsls r3, r3, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, lr
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0x3f
	ble _08001116
	adds r7, #1
	cmp r7, #0x7f
	ble _0800110A
	mov r1, fp
	ldr r6, _08001284
	ldr r1, [r1, #0xc]
	movs r3, #3
	movs r7, #0
	mov sl, r3
	mov lr, sb
	mov r8, r6
	mov ip, r1
_0800115E:
	adds r5, r7, #0
	mov r2, sl
	movs r0, #0
	asrs r6, r7, #2
	ands r5, r2
	lsls r4, r7, #7
_0800116A:
	mov r3, r8
	mov r2, ip
	adds r1, r4, r3
	ldrh r3, [r2]
	muls r3, r6, r3
	asrs r2, r0, #1
	adds r3, r3, r2
	lsls r2, r3, #1
	add r2, ip
	ldrh r3, [r2, #4]
	lsls r2, r3, #2
	adds r3, r2, r5
	movs r2, #1
	ands r2, r0
	lsls r3, r3, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, lr
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0x3f
	ble _0800116A
	adds r7, #1
	cmp r7, #0x7f
	ble _0800115E
	ldr r4, _08001288
	movs r3, #3
	mov sl, r3
	ldr r6, _08001280
	ldr r1, _0800128C
	ldr r3, [r4, #0x10]
	movs r7, #0
	mov lr, r6
	mov r8, r1
	mov ip, r3
_080011B4:
	adds r5, r7, #0
	mov r2, sl
	movs r0, #0
	asrs r6, r7, #2
	ands r5, r2
	lsls r4, r7, #5
_080011C0:
	mov r3, r8
	mov r2, ip
	adds r1, r4, r3
	ldrh r3, [r2]
	muls r3, r6, r3
	asrs r2, r0, #1
	adds r3, r3, r2
	lsls r2, r3, #1
	add r2, ip
	ldrh r3, [r2, #4]
	lsls r2, r3, #2
	adds r3, r2, r5
	movs r2, #1
	ands r2, r0
	lsls r3, r3, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, lr
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0xf
	ble _080011C0
	adds r7, #1
	cmp r7, #9
	ble _080011B4
	ldr r1, _08001288
	ldr r3, [r1, #0x14]
	ldr r2, _08001290
	mov ip, r3
	ldr r1, _08001280
	movs r3, #3
	mov fp, r3
	movs r6, #0
	movs r3, #1
	movs r7, #0
	mov r8, r6
	mov lr, r1
	mov sb, r2
	mov sl, r3
_08001212:
	asrs r3, r7, #2
	adds r5, r7, #0
	mov r6, fp
	mov r1, r8
	str r3, [sp]
	movs r0, #0
	ands r5, r6
	lsls r4, r1, #1
_08001222:
	mov r3, sb
	mov r6, ip
	adds r1, r4, r3
	ldrh r3, [r6]
	ldr r6, [sp]
	muls r3, r6, r3
	asrs r6, r0, #1
	adds r3, r3, r6
	lsls r6, r3, #1
	add r6, ip
	ldrh r2, [r6, #4]
	lsls r6, r2, #2
	adds r3, r6, r5
	adds r2, r0, #0
	mov r6, sl
	ands r2, r6
	lsls r3, r3, #1
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r2, lr
	ldrh r3, [r3, r2]
	adds r0, #1
	strh r3, [r1]
	adds r4, #2
	cmp r0, #0xf
	ble _08001222
	movs r0, #0x10
	adds r7, #1
	add r8, r0
	cmp r7, #9
	ble _08001212
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08001274:
	.4byte gUnk_087146C0
_08001278:
	.4byte 0x0600C000
_0800127C:
	.4byte 0x06008280
_08001280:
	.4byte gGroundBlocks
_08001284:
	.4byte 0x06004000
_08001288:
	.4byte 0x02004320
_0800128C:
	.4byte 0x06008000
_08001290:
	.4byte 0x06008140

	.global dma0_stop_2
	.thumb_func
	.type dma0_stop_2, %function
dma0_stop_2: @ 08001294
	ldr r0, _0800129C
	movs r1, #0
	str r1, [r0]
	bx lr
_0800129C:
	.4byte 0x040000B8

	.global race_regs_commit_b
	.thumb_func
	.type race_regs_commit_b, %function
race_regs_commit_b: @ 080012A0
	ldr r2, _080012EC
	ldr r0, _080012F0
	ldr r3, [r2]
	str r3, [r0]
	ldrh r3, [r2, #8]
	adds r0, #0x14
	strh r3, [r0]
	ldrh r3, [r2, #0xa]
	adds r0, #4
	strh r3, [r0]
	ldr r3, [r2, #0xc]
	adds r0, #4
	str r3, [r0]
	ldr r3, [r2, #0x10]
	adds r0, #4
	str r3, [r0]
	ldrh r3, [r2, #0x14]
	adds r0, #4
	strh r3, [r0]
	ldrh r3, [r2, #0x16]
	adds r0, #4
	strh r3, [r0]
	ldr r3, [r2, #0x18]
	adds r0, #4
	str r3, [r0]
	ldr r3, [r2, #0x1c]
	adds r0, #4
	str r3, [r0]
	ldr r3, [r2, #4]
	adds r0, #0x14
	str r3, [r0]
	ldr r0, _080012F4
	movs r2, #0xa0
	ldrh r1, [r0]
	lsls r0, r2, #0x13
	strh r1, [r0]
	bx lr
	.byte 0x00, 0x00
_080012EC:
	.4byte 0x02001C20
_080012F0:
	.4byte 0x0400000C
_080012F4:
	.4byte 0x02023FA4

	.global obj_reset_all
	.thumb_func
	.type obj_reset_all, %function
obj_reset_all: @ 080012F8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _0800133C
	mov r0, sp
	ldr r2, _08001338
	adds r0, #2
	strh r2, [r0]
	adds r1, r4, #0
	ldr r2, _08001340
	bl CpuSet
	ldr r1, _08001344
	movs r2, #0
	ldr r0, _08001348
	str r2, [r1]
	ldr r6, _0800134C
	ldr r5, _08001350
	ldr r1, _08001354
	str r2, [r0]
	ldr r0, _08001358
	str r2, [r6]
	str r2, [r5]
	ldr r6, _0800135C
	str r2, [r1]
	movs r1, #0xa0
	str r2, [r0]
	adds r5, r4, #0
	movs r0, #0
	lsls r4, r1, #1
	movs r1, #7
	b _08001360
	.byte 0x00, 0x00
_08001338:
	.4byte 0x00000000
_0800133C:
	.4byte gObjRacerPool
_08001340:
	.4byte 0x0100A000
_08001344:
	.4byte gObjProcessList
_08001348:
	.4byte gObjDrawList
_0800134C:
	.4byte gObjDrawList2
_08001350:
	.4byte gObjFreeList
_08001354:
	.4byte gObjStaticHitList
_08001358:
	.4byte gObjVectorHitList
_0800135C:
	.4byte gRacerObjects
_08001360:
	adds r3, r0, r5
	subs r1, #1
	str r3, [r2, r6]
	adds r0, r0, r4
	adds r2, #4
	cmp r1, #0
	bge _08001360
	ldr r0, _080013BC
	ldr r2, _080013C0
	movs r4, #0xa0
	lsls r1, r4, #1
	ldr r4, _080013C4
	str r0, [r2]
	adds r2, r0, r1
	str r2, [r4]
	movs r2, #0xa0
	ldr r4, _080013C8
	lsls r1, r2, #2
	movs r3, #0xa0
	adds r2, r0, r1
	lsls r0, r3, #1
	ldr r3, [r4]
	movs r1, #0xf5
_0800138E:
	str r3, [r2, #4]
	subs r1, #1
	adds r3, r2, #0
	adds r2, r3, r0
	cmp r1, #0
	bge _0800138E
	ldr r0, _080013CC
	movs r2, #0
	str r3, [r4]
	str r2, [r0]
	ldr r3, _080013D0
	movs r1, #0x7f
_080013A6:
	subs r1, #1
	stm r3!, {r2}
	cmp r1, #0
	bge _080013A6
	ldr r1, _080013D4
	movs r3, #0xa
	str r3, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_080013BC:
	.4byte 0x02004D8C
_080013C0:
	.4byte 0x0200436C
_080013C4:
	.4byte 0x02004370
_080013C8:
	.4byte gObjFreeList
_080013CC:
	.4byte gObjDeleteCount
_080013D0:
	.4byte gObjDeleteList
_080013D4:
	.4byte 0x02018390
