@ data/data_0803EC00.s: ROM 0x03EC00-0xBB56E0 (rom, VMA 0x0803EC00)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.incbin "baserom.gba", 0x3EC00, 0xB76AE0
