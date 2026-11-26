@ data/data_08500000.s: ROM 0x500000-0x600000 (rom, VMA 0x08500000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x500000, 0x848
	.global gUnk_08500848
gUnk_08500848:
	.incbin "baserom.gba", 0x500848, 0x4DC8
	.global gUnk_08505610
gUnk_08505610:
	.incbin "baserom.gba", 0x505610, 0x198
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
	.incbin "baserom.gba", 0x5057D4, 0xA82C
	.global gUnk_08510000
gUnk_08510000:
	.incbin "baserom.gba", 0x510000, 0x33628
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
	.incbin "baserom.gba", 0x543654, 0xC9AC
	.global gUnk_08550000
gUnk_08550000:
	.incbin "baserom.gba", 0x550000, 0x8DB8
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
	.incbin "baserom.gba", 0x558DE4, 0x884C
	.global gUnk_08561630
gUnk_08561630:
	.incbin "baserom.gba", 0x561630, 0x3670
	.global gUnk_08564CA0
gUnk_08564CA0:
	.incbin "baserom.gba", 0x564CA0, 0x198
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
	.incbin "baserom.gba", 0x564E64, 0xB19C
	.global gUnk_08570000
gUnk_08570000:
	.incbin "baserom.gba", 0x570000, 0xB414
	.4byte gUnk_08550000
	.4byte gUnk_08880000
	.4byte gUnk_08980000
	.incbin "baserom.gba", 0x57B420, 0x4C60
	.global gUnk_08580080
gUnk_08580080:
	.incbin "baserom.gba", 0x580080, 0x3A50
	.4byte gUnk_08870000
	.4byte gUnk_08850000
	.4byte gUnk_08850000
	.4byte gUnk_08570000
	.4byte gUnk_08550000
	.incbin "baserom.gba", 0x583AE4, 0x1E574
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
	.incbin "baserom.gba", 0x5A2084, 0x15BA4
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
	.incbin "baserom.gba", 0x5B7C54, 0x7D6C
	.global gUnk_085BF9C0
gUnk_085BF9C0:
	.incbin "baserom.gba", 0x5BF9C0, 0x35A0
	.global gUnk_085C2F60
gUnk_085C2F60:
	.incbin "baserom.gba", 0x5C2F60, 0xA60
	.global gUnk_085C39C0
gUnk_085C39C0:
	.incbin "baserom.gba", 0x5C39C0, 0x810
	.global gUnk_085C41D0
gUnk_085C41D0:
	.incbin "baserom.gba", 0x5C41D0, 0xBB0
	.global gUnk_085C4D80
gUnk_085C4D80:
	.incbin "baserom.gba", 0x5C4D80, 0xA60
	.global gUnk_085C57E0
gUnk_085C57E0:
	.incbin "baserom.gba", 0x5C57E0, 0x9B0
	.global gUnk_085C6190
gUnk_085C6190:
	.incbin "baserom.gba", 0x5C6190, 0x920
	.global gUnk_085C6AB0
gUnk_085C6AB0:
	.incbin "baserom.gba", 0x5C6AB0, 0xA70
	.global gUnk_085C7520
gUnk_085C7520:
	.incbin "baserom.gba", 0x5C7520, 0xA10
	.global gUnk_085C7F30
gUnk_085C7F30:
	.incbin "baserom.gba", 0x5C7F30, 0x830
	.global gUnk_085C8760
gUnk_085C8760:
	.incbin "baserom.gba", 0x5C8760, 0x740
	.global gUnk_085C8EA0
gUnk_085C8EA0:
	.incbin "baserom.gba", 0x5C8EA0, 0x830
	.global gUnk_085C96D0
gUnk_085C96D0:
	.incbin "baserom.gba", 0x5C96D0, 0x15B0
	.global gUnk_085CAC80
gUnk_085CAC80:
	.incbin "baserom.gba", 0x5CAC80, 0x198
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
	.incbin "baserom.gba", 0x5CAE44, 0x351BC
