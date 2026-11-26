@ data/data_08100000.s: ROM 0x100000-0x200000 (rom, VMA 0x08100000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x100000, 0x6A4
	.global gUnk_081006A4
gUnk_081006A4:
	.incbin "baserom.gba", 0x1006A4, 0x164
	.global gUnk_08100808
gUnk_08100808:
	.byte 0xB7, 0xB6, 0xAF, 0xAA, 0xA8, 0xB7, 0xB7, 0xA8
	.global gUnk_08100810
gUnk_08100810:
	.incbin "baserom.gba", 0x100810, 0xD0C
	.global gUnk_0810151C
gUnk_0810151C:
	.incbin "baserom.gba", 0x10151C, 0x153A
	.global gUnk_08102A56
gUnk_08102A56:
	.incbin "baserom.gba", 0x102A56, 0x2302
	.global gUnk_08104D58
gUnk_08104D58:
	.incbin "baserom.gba", 0x104D58, 0x6100
	.global gUnk_0810AE58
gUnk_0810AE58:
	.incbin "baserom.gba", 0x10AE58, 0x102
	.global gUnk_0810AF5A
gUnk_0810AF5A:
	.incbin "baserom.gba", 0x10AF5A, 0x1A42
	.global gUnk_0810C99C
gUnk_0810C99C:
	.incbin "baserom.gba", 0x10C99C, 0x3664
	.global gUnk_08110000
gUnk_08110000:
	.incbin "baserom.gba", 0x110000, 0x800
	.global gUnk_08110800
gUnk_08110800:
	.incbin "baserom.gba", 0x110800, 0xA0
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
	.incbin "baserom.gba", 0x11D764, 0x2289C
	.global gUnk_08140000
gUnk_08140000:
	.incbin "baserom.gba", 0x140000, 0x10000
	.global gUnk_08150000
gUnk_08150000:
	.incbin "baserom.gba", 0x150000, 0x20000
	.global gUnk_08170000
gUnk_08170000:
	.incbin "baserom.gba", 0x170000, 0x40000
	.global gUnk_081B0000
gUnk_081B0000:
	.incbin "baserom.gba", 0x1B0000, 0xE12
	.global gUnk_081B0E12
gUnk_081B0E12:
	.incbin "baserom.gba", 0x1B0E12, 0x7232
	.global gUnk_081B8044
gUnk_081B8044:
	.incbin "baserom.gba", 0x1B8044, 0x500
	.global gUnk_081B8544
gUnk_081B8544:
	.incbin "baserom.gba", 0x1B8544, 0x64
	.global gUnk_081B85A8
gUnk_081B85A8:
	.incbin "baserom.gba", 0x1B85A8, 0xC4
	.global gUnk_081B866C
gUnk_081B866C:
	.incbin "baserom.gba", 0x1B866C, 0x94
	.global gUnk_081B8700
gUnk_081B8700:
	.incbin "baserom.gba", 0x1B8700, 0x94
	.global gUnk_081B8794
gUnk_081B8794:
	.incbin "baserom.gba", 0x1B8794, 0xC8
	.global gUnk_081B885C
gUnk_081B885C:
	.incbin "baserom.gba", 0x1B885C, 0x504
	.global gUnk_081B8D60
gUnk_081B8D60:
	.incbin "baserom.gba", 0x1B8D60, 0x504
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
	.incbin "baserom.gba", 0x1BEF14, 0x504
	.global gUnk_081BF418
gUnk_081BF418:
	.4byte gUnk_089D0C7C
	.incbin "baserom.gba", 0x1BF41C, 0x500
	.global gUnk_081BF91C
gUnk_081BF91C:
	.incbin "baserom.gba", 0x1BF91C, 0x500
	.global gUnk_081BFE1C
gUnk_081BFE1C:
	.incbin "baserom.gba", 0x1BFE1C, 0x64
	.global gUnk_081BFE80
gUnk_081BFE80:
	.incbin "baserom.gba", 0x1BFE80, 0xC4
	.global gUnk_081BFF44
gUnk_081BFF44:
	.incbin "baserom.gba", 0x1BFF44, 0x94
	.global gUnk_081BFFD8
gUnk_081BFFD8:
	.incbin "baserom.gba", 0x1BFFD8, 0xA4
	.global gUnk_081C007C
gUnk_081C007C:
	.incbin "baserom.gba", 0x1C007C, 0x144
	.global gUnk_081C01C0
gUnk_081C01C0:
	.incbin "baserom.gba", 0x1C01C0, 0x94
	.global gUnk_081C0254
gUnk_081C0254:
	.incbin "baserom.gba", 0x1C0254, 0x64
	.global gUnk_081C02B8
gUnk_081C02B8:
	.incbin "baserom.gba", 0x1C02B8, 0xC4
	.global gUnk_081C037C
gUnk_081C037C:
	.incbin "baserom.gba", 0x1C037C, 0x94
	.global gUnk_081C0410
gUnk_081C0410:
	.incbin "baserom.gba", 0x1C0410, 0x3E84
	.global gUnk_081C4294
gUnk_081C4294:
	.incbin "baserom.gba", 0x1C4294, 0x4A44
	.global gUnk_081C8CD8
gUnk_081C8CD8:
	.incbin "baserom.gba", 0x1C8CD8, 0x4104
	.global gUnk_081CCDDC
gUnk_081CCDDC:
	.incbin "baserom.gba", 0x1CCDDC, 0x3224
	.global gUnk_081D0000
gUnk_081D0000:
	.incbin "baserom.gba", 0x1D0000, 0x810
	.global gUnk_081D0810
gUnk_081D0810:
	.incbin "baserom.gba", 0x1D0810, 0xCB0
	.global gUnk_081D14C0
gUnk_081D14C0:
	.incbin "baserom.gba", 0x1D14C0, 0x3E84
	.global gUnk_081D5344
gUnk_081D5344:
	.incbin "baserom.gba", 0x1D5344, 0x2D84
	.global gUnk_081D80C8
gUnk_081D80C8:
	.incbin "baserom.gba", 0x1D80C8, 0x2E04
	.global gUnk_081DAECC
gUnk_081DAECC:
	.incbin "baserom.gba", 0x1DAECC, 0x4444
	.global gUnk_081DF310
gUnk_081DF310:
	.incbin "baserom.gba", 0x1DF310, 0x30E4
	.global gUnk_081E23F4
gUnk_081E23F4:
	.incbin "baserom.gba", 0x1E23F4, 0x4744
	.global gUnk_081E6B38
gUnk_081E6B38:
	.incbin "baserom.gba", 0x1E6B38, 0x5084
	.global gUnk_081EBBBC
gUnk_081EBBBC:
	.incbin "baserom.gba", 0x1EBBBC, 0x3844
	.global gUnk_081EF400
gUnk_081EF400:
	.incbin "baserom.gba", 0x1EF400, 0x3C04
	.global gUnk_081F3004
gUnk_081F3004:
	.incbin "baserom.gba", 0x1F3004, 0x4384
	.global gUnk_081F7388
gUnk_081F7388:
	.incbin "baserom.gba", 0x1F7388, 0x3844
	.global gUnk_081FABCC
gUnk_081FABCC:
	.incbin "baserom.gba", 0x1FABCC, 0x2D04
	.global gUnk_081FD8D0
gUnk_081FD8D0:
	.incbin "baserom.gba", 0x1FD8D0, 0x804
	.global gUnk_081FE0D4
gUnk_081FE0D4:
	.incbin "baserom.gba", 0x1FE0D4, 0x1F2C
