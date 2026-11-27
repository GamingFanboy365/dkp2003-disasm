@ data/data_08102B00.s: ROM 0x102B00-0x200000 (rom, VMA 0x08102B00)

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
	.global gUnk_0810AF5A
gUnk_0810AF5A:
	.incbin "build/assets/levels/25/bg_c.bin"   @ from assets/levels/25/bg_c.png
	.global gUnk_0810C99C
gUnk_0810C99C:
	.incbin "build/assets/levels/25/bg_d.bin"   @ from assets/levels/25/bg_d.png
	.byte 0x00, 0x00
	.global gUnk_081108A0
gUnk_081108A0:
	.incbin "baserom.gba", 0x1108A0, 0x2E40
	.global gUnk_081136E0
gUnk_081136E0:
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
	.incbin "baserom.gba", 0x1B8044, 0x500
	.global gUnk_081B8544
gUnk_081B8544:
	.incbin "build/assets/levels/06/data_20.bin"   @ from assets/levels/06/data_20.bin
	.global gUnk_081B85A8
gUnk_081B85A8:
	.incbin "build/assets/levels/06/data_24.bin"   @ from assets/levels/06/data_24.bin
	.global gUnk_081B866C
gUnk_081B866C:
	.incbin "build/assets/levels/06/data_1c.bin"   @ from assets/levels/06/data_1c.bin
	.global gUnk_081B8700
gUnk_081B8700:
	.incbin "build/assets/levels/17/data_20.bin"   @ from assets/levels/17/data_20.bin
	.global gUnk_081B8794
gUnk_081B8794:
	.incbin "build/assets/levels/17/data_1c.bin"   @ from assets/levels/17/data_1c.bin
	.global gUnk_081B885C
gUnk_081B885C:
	.incbin "build/assets/graphics/frontend/tilemap_1b885c.bin"   @ from assets/graphics/frontend/tilemap_1b885c.bin
	.global gUnk_081B8D60
	.set gUnk_081B8D60, gUnk_081B885C + 0x504
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
	.incbin "baserom.gba", 0x1BF714, 0x208
	.global gUnk_081BF91C
gUnk_081BF91C:
	.incbin "baserom.gba", 0x1BF91C, 0x500
	.global gUnk_081BFE1C
gUnk_081BFE1C:
	.incbin "build/assets/levels/03/data_24.bin"   @ from assets/levels/03/data_24.bin
	.global gUnk_081BFE80
gUnk_081BFE80:
	.incbin "build/assets/levels/03/data_1c.bin"   @ from assets/levels/03/data_1c.bin
	.global gUnk_081BFF44
gUnk_081BFF44:
	.incbin "build/assets/levels/03/data_20.bin"   @ from assets/levels/03/data_20.bin
	.global gUnk_081BFFD8
gUnk_081BFFD8:
	.incbin "build/assets/levels/02/data_20.bin"   @ from assets/levels/02/data_20.bin
	.global gUnk_081C007C
gUnk_081C007C:
	.incbin "build/assets/levels/02/data_1c.bin"   @ from assets/levels/02/data_1c.bin
	.global gUnk_081C01C0
gUnk_081C01C0:
	.incbin "build/assets/levels/02/data_24.bin"   @ from assets/levels/02/data_24.bin
	.global gUnk_081C0254
gUnk_081C0254:
	.incbin "build/assets/levels/13/data_20.bin"   @ from assets/levels/13/data_20.bin
	.global gUnk_081C02B8
gUnk_081C02B8:
	.incbin "build/assets/levels/13/data_1c.bin"   @ from assets/levels/13/data_1c.bin
	.global gUnk_081C037C
gUnk_081C037C:
	.incbin "build/assets/levels/13/data_24.bin"   @ from assets/levels/13/data_24.bin
	.global gUnk_081C0410
gUnk_081C0410:
	.incbin "build/assets/levels/01/data_14.bin"   @ from assets/levels/01/data_14.bin
	.global gUnk_081C4294
gUnk_081C4294:
	.incbin "build/assets/levels/02/data_14.bin"   @ from assets/levels/02/data_14.bin
	.global gUnk_081C8CD8
gUnk_081C8CD8:
	.incbin "build/assets/levels/03/data_14.bin"   @ from assets/levels/03/data_14.bin
	.global gUnk_081CCDDC
gUnk_081CCDDC:
	.incbin "build/assets/levels/04/data_14.bin"   @ from assets/levels/04/data_14.bin
	.global gUnk_081D0810
gUnk_081D0810:
	.incbin "baserom.gba", 0x1D0810, 0xCB0
	.global gUnk_081D14C0
gUnk_081D14C0:
	.incbin "build/assets/levels/05/data_14.bin"   @ from assets/levels/05/data_14.bin
	.global gUnk_081D5344
gUnk_081D5344:
	.incbin "build/assets/levels/06/data_14.bin"   @ from assets/levels/06/data_14.bin
	.global gUnk_081D80C8
gUnk_081D80C8:
	.incbin "build/assets/levels/07/data_14.bin"   @ from assets/levels/07/data_14.bin
	.global gUnk_081DAECC
gUnk_081DAECC:
	.incbin "build/assets/levels/08/data_14.bin"   @ from assets/levels/08/data_14.bin
	.global gUnk_081DF310
gUnk_081DF310:
	.incbin "build/assets/levels/09/data_14.bin"   @ from assets/levels/09/data_14.bin
	.global gUnk_081E23F4
gUnk_081E23F4:
	.incbin "build/assets/levels/10/data_14.bin"   @ from assets/levels/10/data_14.bin
	.global gUnk_081E6B38
gUnk_081E6B38:
	.incbin "build/assets/levels/11/data_14.bin"   @ from assets/levels/11/data_14.bin
	.global gUnk_081EBBBC
gUnk_081EBBBC:
	.incbin "build/assets/levels/12/data_14.bin"   @ from assets/levels/12/data_14.bin
	.global gUnk_081EF400
gUnk_081EF400:
	.incbin "build/assets/levels/13/data_14.bin"   @ from assets/levels/13/data_14.bin
	.global gUnk_081F3004
gUnk_081F3004:
	.incbin "build/assets/levels/14/data_14.bin"   @ from assets/levels/14/data_14.bin
	.global gUnk_081F7388
gUnk_081F7388:
	.incbin "build/assets/levels/15/data_14.bin"   @ from assets/levels/15/data_14.bin
	.global gUnk_081FABCC
gUnk_081FABCC:
	.incbin "build/assets/levels/16/data_14.bin"   @ from assets/levels/16/data_14.bin
	.global gUnk_081FD8D0
gUnk_081FD8D0:
	.incbin "build/assets/levels/17/data_24.bin"   @ from assets/levels/17/data_24.bin
	.global gUnk_081FE0D4
gUnk_081FE0D4:
	.incbin "build/assets/levels/17/data_14.bin"   @ from assets/levels/17/data_14.bin
