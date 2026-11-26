@ data/data_08200000.s: ROM 0x200000-0x300000 (rom, VMA 0x08200000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x200000, 0x818
	.global gUnk_08200818
gUnk_08200818:
	.incbin "baserom.gba", 0x200818, 0x1D8C0
	.global gUnk_0821E0D8
gUnk_0821E0D8:
	.incbin "baserom.gba", 0x21E0D8, 0x1FB4
	.global gUnk_0822008C
gUnk_0822008C:
	.incbin "baserom.gba", 0x22008C, 0x1E050
	.global gUnk_0823E0DC
gUnk_0823E0DC:
	.incbin "baserom.gba", 0x23E0DC, 0x20004
	.global gUnk_0825E0E0
gUnk_0825E0E0:
	.incbin "baserom.gba", 0x25E0E0, 0x20004
	.global gUnk_0827E0E4
gUnk_0827E0E4:
	.incbin "baserom.gba", 0x27E0E4, 0x4804
	.global gUnk_082828E8
gUnk_082828E8:
	.incbin "baserom.gba", 0x2828E8, 0x6204
	.global gUnk_08288AEC
gUnk_08288AEC:
	.incbin "baserom.gba", 0x288AEC, 0x4804
	.global gUnk_0828D2F0
gUnk_0828D2F0:
	.incbin "baserom.gba", 0x28D2F0, 0x6208
	.global gUnk_082934F8
gUnk_082934F8:
	.incbin "baserom.gba", 0x2934F8, 0x504
	.global gUnk_082939FC
gUnk_082939FC:
	.incbin "baserom.gba", 0x2939FC, 0x500
	.global gUnk_08293EFC
gUnk_08293EFC:
	.incbin "baserom.gba", 0x293EFC, 0x64
	.global gUnk_08293F60
gUnk_08293F60:
	.incbin "baserom.gba", 0x293F60, 0xC4
	.global gUnk_08294024
gUnk_08294024:
	.incbin "baserom.gba", 0x294024, 0x94
	.global gUnk_082940B8
gUnk_082940B8:
	.incbin "baserom.gba", 0x2940B8, 0x64
	.global gUnk_0829411C
gUnk_0829411C:
	.incbin "baserom.gba", 0x29411C, 0xC4
	.global gUnk_082941E0
gUnk_082941E0:
	.incbin "baserom.gba", 0x2941E0, 0x94
	.global gUnk_08294274
gUnk_08294274:
	.incbin "baserom.gba", 0x294274, 0x64
	.global gUnk_082942D8
gUnk_082942D8:
	.incbin "baserom.gba", 0x2942D8, 0xC4
	.global gUnk_0829439C
gUnk_0829439C:
	.incbin "baserom.gba", 0x29439C, 0x94
	.global gUnk_08294430
gUnk_08294430:
	.incbin "baserom.gba", 0x294430, 0x804
	.global gUnk_08294C34
gUnk_08294C34:
	.incbin "baserom.gba", 0x294C34, 0x64
	.global gUnk_08294C98
gUnk_08294C98:
	.incbin "baserom.gba", 0x294C98, 0xC4
	.global gUnk_08294D5C
gUnk_08294D5C:
	.incbin "baserom.gba", 0x294D5C, 0x94
	.global gUnk_08294DF0
gUnk_08294DF0:
	.incbin "baserom.gba", 0x294DF0, 0xD0
	.global gUnk_08294EC0
gUnk_08294EC0:
	.incbin "baserom.gba", 0x294EC0, 0x1330
	.global gUnk_082961F0
gUnk_082961F0:
	.incbin "baserom.gba", 0x2961F0, 0xB0
	.global gUnk_082962A0
gUnk_082962A0:
	.incbin "baserom.gba", 0x2962A0, 0xD0
	.global gUnk_08296370
gUnk_08296370:
	.incbin "baserom.gba", 0x296370, 0x190
	.global gUnk_08296500
gUnk_08296500:
	.incbin "baserom.gba", 0x296500, 0x640
	.global gUnk_08296B40
gUnk_08296B40:
	.incbin "baserom.gba", 0x296B40, 0x8890
	.global gUnk_0829F3D0
gUnk_0829F3D0:
	.incbin "baserom.gba", 0x29F3D0, 0x4E0
	.global gUnk_0829F8B0
gUnk_0829F8B0:
	.incbin "baserom.gba", 0x29F8B0, 0x198
	.4byte gUnk_08100808
	.4byte gUnk_08200818
	.4byte gUnk_08300828
	.4byte gUnk_08400838
	.4byte gUnk_08500848
	.4byte gUnk_08600858
	.4byte gUnk_08700868
	.4byte gUnk_08800878
	.4byte gUnk_08900888
	.4byte gUnk_08A00898
	.4byte gUnk_08B008A8
	.incbin "baserom.gba", 0x29FA74, 0x41994
	.4byte gUnk_08866666
	.4byte gUnk_08866866
	.4byte gUnk_08868866
	.incbin "baserom.gba", 0x2E1414, 0xE364
	.4byte gUnk_08100808
	.4byte gUnk_08200818
	.4byte gUnk_08300828
	.4byte gUnk_08400838
	.4byte gUnk_08500848
	.4byte gUnk_08600858
	.4byte gUnk_08700868
	.4byte gUnk_08800878
	.4byte gUnk_08900888
	.4byte gUnk_08A00898
	.4byte gUnk_08B008A8
	.incbin "baserom.gba", 0x2EF7A4, 0xE364
	.4byte gUnk_08300038
	.incbin "baserom.gba", 0x2FDB0C, 0x24F4
