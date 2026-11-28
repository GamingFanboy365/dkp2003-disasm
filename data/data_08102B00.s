@ data/data_08102B00.s: ROM 0x102B00-0x293500 (rom, VMA 0x08102B00)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x102B00, 0x2258
	.global gUnk_08104D58
gUnk_08104D58:
	.incbin "baserom.gba", 0x104D58, 0x6100
	.global gUnk_0810AE58
gUnk_0810AE58:
	.incbin "build/assets/levels/25/bg_a.bin"   @ from assets/levels/25/bg_a.png
	.balign 2
	.global gUnk_0810AF5A
gUnk_0810AF5A:
	.incbin "build/assets/levels/25/bg_c.bin"   @ from assets/levels/25/bg_c.png
	.balign 4
	.global gUnk_0810C99C
gUnk_0810C99C:
	.incbin "build/assets/levels/25/bg_d.bin"   @ from assets/levels/25/bg_d.png
	.balign 2
	.byte 0x00, 0x00
	.global gUnk_081108A0
gUnk_081108A0:
	.incbin "baserom.gba", 0x1108A0, 0x2E40
	.global gGroundBlocks
gGroundBlocks:
	.incbin "baserom.gba", 0x1136E0, 0x8D90
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0x0A, 0x0D, 0x11, 0x00, 0x07, 0x05, 0x12, 0x10
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0x0A, 0x0D, 0x11, 0x00, 0x07, 0x05, 0x12, 0xEF
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0x0A, 0x0D, 0x11, 0x00, 0xF0, 0x05, 0x12, 0x10
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0x0A, 0x0D, 0x11, 0x00, 0xF1, 0xF5, 0xF0, 0x10
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0x0A, 0x0D, 0x11, 0x00, 0xF1, 0xF5, 0xF1, 0xF5
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0xEF, 0xF1, 0xF5, 0xF1, 0xF4, 0xBF, 0xB5, 0xA8
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0xF5, 0xF0, 0x11, 0x00, 0xB5, 0xE8, 0xF1, 0xF5
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0x13, 0xF5, 0xF1, 0xF5, 0xF0, 0xB5, 0xA8, 0xBF, 0xE8
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0xEF, 0x0A, 0x0D, 0x11, 0xF2, 0x07, 0x05, 0x12, 0xF6
	.4byte gUnk_080F0C0E
	.byte 0x09, 0x03, 0x04, 0xEF, 0x0A, 0x0D, 0xEF, 0xF4, 0x07, 0x05, 0xF2, 0xA8
	.4byte gUnk_080F0C0E
	.incbin "baserom.gba", 0x11C514, 0x122C
	.4byte gUnk_081B0E12
	.byte 0xE3, 0x46, 0x1B, 0x2C, 0xE7, 0xF6, 0x29, 0x43, 0xE2, 0xE4, 0xEA, 0xDF
	.4byte gUnk_081B0E12
	.byte 0xE3, 0x46, 0x1B, 0x2C, 0xF3, 0xF6, 0x29, 0x43, 0xDF, 0xE1, 0xE2, 0xE4
	.4byte gUnk_081B0E12
	.incbin "baserom.gba", 0x11D764, 0x936AE
	.global gUnk_081B0E12
gUnk_081B0E12:
	.incbin "baserom.gba", 0x1B0E12, 0x7232
	.global gUnk_081B8044
gUnk_081B8044:
	.incbin "build/assets/graphics/debug_menu/beach_tilemap.bin"   @ from assets/graphics/debug_menu/beach_tilemap.bin
	.balign 4
	.global gUnk_081B8544
gUnk_081B8544:
	.incbin "build/assets/levels/06/horizon_b.bin"   @ from assets/levels/06/horizon_b.txt
	.balign 8
	.global gUnk_081B85A8
gUnk_081B85A8:
	.incbin "build/assets/levels/06/horizon_c.bin"   @ from assets/levels/06/horizon_c.txt
	.balign 4
	.global gUnk_081B866C
gUnk_081B866C:
	.incbin "build/assets/levels/06/horizon_a.bin"   @ from assets/levels/06/horizon_a.txt
	.balign 16
	.global gUnk_081B8700
gUnk_081B8700:
	.incbin "build/assets/levels/17/horizon_b.bin"   @ from assets/levels/17/horizon_b.txt
	.balign 4
	.global gUnk_081B8794
gUnk_081B8794:
	.incbin "build/assets/levels/17/horizon_a.bin"   @ from assets/levels/17/horizon_a.txt
	.balign 8
	.byte 0x20, 0x00, 0x14, 0x00
	.global gUnk_081B885C
gUnk_081B885C:
	.incbin "build/assets/graphics/frontend/tilemap_1b885c.bin"   @ from assets/graphics/frontend/tilemap_1b885c.bin
	.global gUnk_081B8D60
	.set gUnk_081B8D60, gUnk_081B885C + 0x504
	.balign 4
	.incbin "baserom.gba", 0x1B905C, 0x208
	.global gUnk_081B9264
gUnk_081B9264:
	.incbin "baserom.gba", 0x1B9264, 0x504
	.global gUnk_081B9768
gUnk_081B9768:
	.4byte gUnk_089D089D
	.incbin "baserom.gba", 0x1B976C, 0x500
	.global gUnk_081B9C6C
gUnk_081B9C6C:
	.incbin "baserom.gba", 0x1B9C6C, 0x504
	.global gUnk_081BA170
gUnk_081BA170:
	.incbin "baserom.gba", 0x1BA170, 0x504
	.global gUnk_081BA674
gUnk_081BA674:
	.incbin "baserom.gba", 0x1BA674, 0x15C
	.4byte gUnk_08030000
	.4byte gUnk_08100810
	.4byte gUnk_081D0810
	.byte 0x1F, 0x08, 0x2D, 0x08
	.4byte gUnk_083D0830
	.incbin "baserom.gba", 0x1BA7E4, 0x390
	.global gUnk_081BAB74
gUnk_081BAB74:
	.incbin "baserom.gba", 0x1BAB74, 0x964
	.global gUnk_081BB4D8
gUnk_081BB4D8:
	.incbin "baserom.gba", 0x1BB4D8, 0x964
	.global gUnk_081BBE3C
gUnk_081BBE3C:
	.incbin "baserom.gba", 0x1BBE3C, 0x8C8
	.global gUnk_081BC704
gUnk_081BC704:
	.incbin "baserom.gba", 0x1BC704, 0x504
	.global gUnk_081BCC08
gUnk_081BCC08:
	.incbin "baserom.gba", 0x1BCC08, 0x500
	.global gUnk_081BD108
gUnk_081BD108:
	.incbin "baserom.gba", 0x1BD108, 0x1404
	.global gUnk_081BE50C
gUnk_081BE50C:
	.incbin "baserom.gba", 0x1BE50C, 0xA08
	.global gUnk_081BEF14
gUnk_081BEF14:
	.incbin "build/assets/graphics/frontend/tilemap_1bef14.bin"   @ from assets/graphics/frontend/tilemap_1bef14.bin
	.global gUnk_081BF418
	.set gUnk_081BF418, gUnk_081BEF14 + 0x504
	.balign 4
	.incbin "baserom.gba", 0x1BF714, 0x208
	.global gUnk_081BF91C
gUnk_081BF91C:
	.incbin "baserom.gba", 0x1BF91C, 0x500
	.global gUnk_081BFE1C
gUnk_081BFE1C:
	.incbin "build/assets/levels/03/horizon_c.bin"   @ from assets/levels/03/horizon_c.txt
	.balign 16
	.global gUnk_081BFE80
gUnk_081BFE80:
	.incbin "build/assets/levels/03/horizon_a.bin"   @ from assets/levels/03/horizon_a.txt
	.balign 4
	.global gUnk_081BFF44
gUnk_081BFF44:
	.incbin "build/assets/levels/03/horizon_b.bin"   @ from assets/levels/03/horizon_b.txt
	.balign 8
	.global gUnk_081BFFD8
gUnk_081BFFD8:
	.incbin "build/assets/levels/02/horizon_b.bin"   @ from assets/levels/02/horizon_b.txt
	.balign 4
	.global gUnk_081C007C
gUnk_081C007C:
	.incbin "build/assets/levels/02/horizon_a.bin"   @ from assets/levels/02/horizon_a.txt
	.balign 16
	.global gUnk_081C01C0
gUnk_081C01C0:
	.incbin "build/assets/levels/02/horizon_c.bin"   @ from assets/levels/02/horizon_c.txt
	.balign 4
	.global gUnk_081C0254
gUnk_081C0254:
	.incbin "build/assets/levels/13/horizon_b.bin"   @ from assets/levels/13/horizon_b.txt
	.balign 8
	.global gUnk_081C02B8
gUnk_081C02B8:
	.incbin "build/assets/levels/13/horizon_a.bin"   @ from assets/levels/13/horizon_a.txt
	.balign 4
	.global gUnk_081C037C
gUnk_081C037C:
	.incbin "build/assets/levels/13/horizon_c.bin"   @ from assets/levels/13/horizon_c.txt
	.balign 16
	.global gUnk_081C0410
gUnk_081C0410:
	.incbin "build/assets/levels/01/ground.bin"   @ from assets/levels/01/ground.txt
	.balign 4
	.global gUnk_081C4294
gUnk_081C4294:
	.incbin "build/assets/levels/02/ground.bin"   @ from assets/levels/02/ground.txt
	.balign 8
	.global gUnk_081C8CD8
gUnk_081C8CD8:
	.incbin "build/assets/levels/03/ground.bin"   @ from assets/levels/03/ground.txt
	.balign 4
	.global gUnk_081CCDDC
gUnk_081CCDDC:
	.incbin "build/assets/levels/04/ground.bin"   @ from assets/levels/04/ground.txt
	.global gUnk_081D0810
	.set gUnk_081D0810, gUnk_081CCDDC + 0x3A34
	.balign 16
	.global gUnk_081D14C0
gUnk_081D14C0:
	.incbin "build/assets/levels/05/ground.bin"   @ from assets/levels/05/ground.txt
	.balign 4
	.global gUnk_081D5344
gUnk_081D5344:
	.incbin "build/assets/levels/06/ground.bin"   @ from assets/levels/06/ground.txt
	.balign 8
	.global gUnk_081D80C8
gUnk_081D80C8:
	.incbin "build/assets/levels/07/ground.bin"   @ from assets/levels/07/ground.txt
	.balign 4
	.global gUnk_081DAECC
gUnk_081DAECC:
	.incbin "build/assets/levels/08/ground.bin"   @ from assets/levels/08/ground.txt
	.balign 16
	.global gUnk_081DF310
gUnk_081DF310:
	.incbin "build/assets/levels/09/ground.bin"   @ from assets/levels/09/ground.txt
	.balign 4
	.global gUnk_081E23F4
gUnk_081E23F4:
	.incbin "build/assets/levels/10/ground.bin"   @ from assets/levels/10/ground.txt
	.balign 8
	.global gUnk_081E6B38
gUnk_081E6B38:
	.incbin "build/assets/levels/11/ground.bin"   @ from assets/levels/11/ground.txt
	.balign 4
	.global gUnk_081EBBBC
gUnk_081EBBBC:
	.incbin "build/assets/levels/12/ground.bin"   @ from assets/levels/12/ground.txt
	.balign 16
	.global gUnk_081EF400
gUnk_081EF400:
	.incbin "build/assets/levels/13/ground.bin"   @ from assets/levels/13/ground.txt
	.balign 4
	.global gUnk_081F3004
gUnk_081F3004:
	.incbin "build/assets/levels/14/ground.bin"   @ from assets/levels/14/ground.txt
	.balign 8
	.global gUnk_081F7388
gUnk_081F7388:
	.incbin "build/assets/levels/15/ground.bin"   @ from assets/levels/15/ground.txt
	.balign 4
	.global gUnk_081FABCC
gUnk_081FABCC:
	.incbin "build/assets/levels/16/ground.bin"   @ from assets/levels/16/ground.txt
	.balign 16
	.global gUnk_081FD8D0
gUnk_081FD8D0:
	.incbin "build/assets/levels/17/horizon_c.bin"   @ from assets/levels/17/horizon_c.txt
	.balign 4
	.global gUnk_081FE0D4
gUnk_081FE0D4:
	.incbin "build/assets/levels/17/ground.bin"   @ from assets/levels/17/ground.txt
	.balign 8
	.global gUnk_0821E0D8
gUnk_0821E0D8:
	.incbin "build/assets/levels/18/ground.bin"   @ from assets/levels/18/ground.txt
	.global gUnk_0822008C
	.set gUnk_0822008C, gUnk_0821E0D8 + 0x1FB4
	.balign 4
	.global gUnk_0823E0DC
gUnk_0823E0DC:
	.incbin "build/assets/levels/19/ground.bin"   @ from assets/levels/19/ground.txt
	.balign 16
	.global gUnk_0825E0E0
gUnk_0825E0E0:
	.incbin "build/assets/levels/20/ground.bin"   @ from assets/levels/20/ground.txt
	.balign 4
	.global gUnk_0827E0E4
gUnk_0827E0E4:
	.incbin "build/assets/levels/21/ground.bin"   @ from assets/levels/21/ground.txt
	.balign 8
	.global gUnk_082828E8
gUnk_082828E8:
	.incbin "build/assets/levels/22/ground.bin"   @ from assets/levels/22/ground.txt
	.balign 4
	.global gUnk_08288AEC
gUnk_08288AEC:
	.incbin "build/assets/levels/23/ground.bin"   @ from assets/levels/23/ground.txt
	.balign 16
	.global gUnk_0828D2F0
gUnk_0828D2F0:
	.incbin "build/assets/levels/24/ground.bin"   @ from assets/levels/24/ground.txt
	.balign 4
	.byte 0x20, 0x00, 0x14, 0x00
	.global gUnk_082934F8
gUnk_082934F8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
