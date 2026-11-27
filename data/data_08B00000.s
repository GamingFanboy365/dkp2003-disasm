@ data/data_08B00000.s: ROM 0xB00000-0xBB56E0 (rom, VMA 0x08B00000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0xB00000, 0x8C
	.global gUnk_08B0008C
gUnk_08B0008C:
	.incbin "baserom.gba", 0xB0008C, 0x76AB
	.global gUnk_08B07737
gUnk_08B07737:
	.byte 0x00
	.global gUnk_08B07738
gUnk_08B07738:
	.incbin "baserom.gba", 0xB07738, 0x3DF5
	.global gUnk_08B0B52D
gUnk_08B0B52D:
	.byte 0x00
	.global gUnk_08B0B52E
gUnk_08B0B52E:
	.incbin "baserom.gba", 0xB0B52E, 0xBDA
	.global gUnk_08B0C108
gUnk_08B0C108:
	.byte 0xB0
	.global gUnk_08B0C109
gUnk_08B0C109:
	.incbin "baserom.gba", 0xB0C109, 0x20A0
	.global gUnk_08B0E1A9
gUnk_08B0E1A9:
	.byte 0x00
	.global gUnk_08B0E1AA
gUnk_08B0E1AA:
	.incbin "baserom.gba", 0xB0E1AA, 0x3ED9
	.global gUnk_08B12083
gUnk_08B12083:
	.byte 0x01
	.global gUnk_08B12084
gUnk_08B12084:
	.incbin "baserom.gba", 0xB12084, 0xF0B
	.global gUnk_08B12F8F
gUnk_08B12F8F:
	.byte 0x00
	.global gUnk_08B12F90
gUnk_08B12F90:
	.incbin "baserom.gba", 0xB12F90, 0x3009
	.global gUnk_08B15F99
gUnk_08B15F99:
	.byte 0x00
	.global gUnk_08B15F9A
gUnk_08B15F9A:
	.incbin "baserom.gba", 0xB15F9A, 0x19E4
	.global gUnk_08B1797E
gUnk_08B1797E:
	.byte 0xEC
	.global gUnk_08B1797F
gUnk_08B1797F:
	.incbin "baserom.gba", 0xB1797F, 0x147A
	.global gUnk_08B18DF9
gUnk_08B18DF9:
	.byte 0xD3
	.global gUnk_08B18DFA
gUnk_08B18DFA:
	.incbin "baserom.gba", 0xB18DFA, 0x791
	.global gUnk_08B1958B
gUnk_08B1958B:
	.byte 0xFE
	.global gUnk_08B1958C
gUnk_08B1958C:
	.incbin "baserom.gba", 0xB1958C, 0x3B21
	.global gUnk_08B1D0AD
gUnk_08B1D0AD:
	.byte 0x00
	.global gUnk_08B1D0AE
gUnk_08B1D0AE:
	.incbin "baserom.gba", 0xB1D0AE, 0x274E
	.global gUnk_08B1F7FC
gUnk_08B1F7FC:
	.byte 0x00
	.global gUnk_08B1F7FD
gUnk_08B1F7FD:
	.incbin "baserom.gba", 0xB1F7FD, 0xA03
	.global gUnk_08B20200
gUnk_08B20200:
	.incbin "baserom.gba", 0xB20200, 0x2C3D
	.global gUnk_08B22E3D
gUnk_08B22E3D:
	.byte 0x00
	.global gUnk_08B22E3E
gUnk_08B22E3E:
	.incbin "baserom.gba", 0xB22E3E, 0x2E52
	.global gUnk_08B25C90
gUnk_08B25C90:
	.byte 0x00
	.global gUnk_08B25C91
gUnk_08B25C91:
	.incbin "baserom.gba", 0xB25C91, 0x2CE7
	.global gUnk_08B28978
gUnk_08B28978:
	.byte 0x00
	.global gUnk_08B28979
gUnk_08B28979:
	.incbin "baserom.gba", 0xB28979, 0xC60
	.global gUnk_08B295D9
gUnk_08B295D9:
	.byte 0x00
	.global gUnk_08B295DA
gUnk_08B295DA:
	.incbin "baserom.gba", 0xB295DA, 0x124
	.global gUnk_08B296FE
gUnk_08B296FE:
	.byte 0x04
	.global gUnk_08B296FF
gUnk_08B296FF:
	.incbin "baserom.gba", 0xB296FF, 0x9BC
	.global gUnk_08B2A0BB
gUnk_08B2A0BB:
	.byte 0x00
	.global gUnk_08B2A0BC
gUnk_08B2A0BC:
	.incbin "baserom.gba", 0xB2A0BC, 0x2415
	.global gUnk_08B2C4D1
gUnk_08B2C4D1:
	.byte 0x00
	.global gUnk_08B2C4D2
gUnk_08B2C4D2:
	.incbin "baserom.gba", 0xB2C4D2, 0x2D72
	.4byte gUnk_08050A10
	.incbin "baserom.gba", 0xB2F248, 0x2529
	.global gUnk_08B31771
gUnk_08B31771:
	.byte 0x00
	.global gUnk_08B31772
gUnk_08B31772:
	.incbin "baserom.gba", 0xB31772, 0x6DE
	.4byte gUnk_0804FDF8
	.incbin "baserom.gba", 0xB31E54, 0xE8
	.global gUnk_08B31F3C
gUnk_08B31F3C:
	.byte 0x00
	.global gUnk_08B31F3D
gUnk_08B31F3D:
	.incbin "baserom.gba", 0xB31F3D, 0xC96
	.global gUnk_08B32BD3
gUnk_08B32BD3:
	.byte 0x00
	.global gUnk_08B32BD4
gUnk_08B32BD4:
	.incbin "baserom.gba", 0xB32BD4, 0x14C8
	.global gUnk_08B3409C
gUnk_08B3409C:
	.byte 0x00
	.global gUnk_08B3409D
gUnk_08B3409D:
	.incbin "baserom.gba", 0xB3409D, 0x1D17
	.global gUnk_08B35DB4
gUnk_08B35DB4:
	.byte 0x00
	.global gUnk_08B35DB5
gUnk_08B35DB5:
	.incbin "baserom.gba", 0xB35DB5, 0x1785
	.global gUnk_08B3753A
gUnk_08B3753A:
	.byte 0x00
	.global gUnk_08B3753B
gUnk_08B3753B:
	.incbin "baserom.gba", 0xB3753B, 0x1C1E
	.global gUnk_08B39159
gUnk_08B39159:
	.byte 0x00
	.global gUnk_08B3915A
gUnk_08B3915A:
	.incbin "baserom.gba", 0xB3915A, 0x24EB
	.global gUnk_08B3B645
gUnk_08B3B645:
	.byte 0x00
	.global gUnk_08B3B646
gUnk_08B3B646:
	.incbin "baserom.gba", 0xB3B646, 0x2780
	.global gUnk_08B3DDC6
gUnk_08B3DDC6:
	.byte 0x00
	.global gUnk_08B3DDC7
gUnk_08B3DDC7:
	.incbin "baserom.gba", 0xB3DDC7, 0xA15B
	.global gUnk_08B47F22
gUnk_08B47F22:
	.byte 0x00
	.global gUnk_08B47F23
gUnk_08B47F23:
	.incbin "baserom.gba", 0xB47F23, 0x57FD
	.global gUnk_08B4D720
gUnk_08B4D720:
	.byte 0xFF
	.global gUnk_08B4D721
gUnk_08B4D721:
	.incbin "baserom.gba", 0xB4D721, 0x412
	.global gUnk_08B4DB33
gUnk_08B4DB33:
	.byte 0x00
	.global gUnk_08B4DB34
gUnk_08B4DB34:
	.incbin "baserom.gba", 0xB4DB34, 0x15AA
	.global gUnk_08B4F0DE
gUnk_08B4F0DE:
	.byte 0x00
	.global gUnk_08B4F0DF
gUnk_08B4F0DF:
	.incbin "baserom.gba", 0xB4F0DF, 0xD780
	.global gUnk_08B5C85F
gUnk_08B5C85F:
	.byte 0x00
	.global gUnk_08B5C860
gUnk_08B5C860:
	.incbin "baserom.gba", 0xB5C860, 0x9BA2
	.global gUnk_08B66402
gUnk_08B66402:
	.byte 0xFE
	.global gUnk_08B66403
gUnk_08B66403:
	.incbin "baserom.gba", 0xB66403, 0xA6AC
	.global gUnk_08B70AAF
gUnk_08B70AAF:
	.byte 0x00
	.global gUnk_08B70AB0
gUnk_08B70AB0:
	.incbin "baserom.gba", 0xB70AB0, 0x4D81
	.global gUnk_08B75831
gUnk_08B75831:
	.byte 0x00
	.global gUnk_08B75832
gUnk_08B75832:
	.incbin "baserom.gba", 0xB75832, 0x706
	.4byte gUnk_0804FEFC
	.incbin "baserom.gba", 0xB75F3C, 0x624F
	.global gUnk_08B7C18B
gUnk_08B7C18B:
	.byte 0x00
	.global gUnk_08B7C18C
gUnk_08B7C18C:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x02, 0x80, 0x01, 0x02, 0x00, 0xAE, 0x0B
	.global gUnk_08B7C197
gUnk_08B7C197:
	.incbin "baserom.gba", 0xB7C197, 0x630
	.global gUnk_08B7C7C7
gUnk_08B7C7C7:
	.incbin "baserom.gba", 0xB7C7C7, 0x5DF
	.global gUnk_08B7CDA6
gUnk_08B7CDA6:
	.incbin "baserom.gba", 0xB7CDA6, 0x4DA
	.global gUnk_08B7D280
gUnk_08B7D280:
	.incbin "baserom.gba", 0xB7D280, 0x446
	.global gUnk_08B7D6C6
gUnk_08B7D6C6:
	.incbin "baserom.gba", 0xB7D6C6, 0x453
	.global gUnk_08B7DB19
gUnk_08B7DB19:
	.incbin "baserom.gba", 0xB7DB19, 0x30A
	.global gUnk_08B7DE23
gUnk_08B7DE23:
	.incbin "baserom.gba", 0xB7DE23, 0x221
	.global gUnk_08B7E044
gUnk_08B7E044:
	.incbin "baserom.gba", 0xB7E044, 0x154
	.global gUnk_08B7E198
gUnk_08B7E198:
	.byte 0x08, 0x04, 0x04, 0x07, 0x04, 0x07, 0x7F, 0x02, 0x80, 0x01, 0x07, 0x04, 0x66, 0x00, 0x02, 0x03
	.byte 0x5D, 0x05, 0x04, 0x40, 0x7F, 0x02, 0x3D, 0x02, 0x06, 0x04, 0x40, 0x00, 0x02, 0xC0, 0x48, 0x07
	.byte 0x04, 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B7E1BF
gUnk_08B7E1BF:
	.incbin "baserom.gba", 0xB7E1BF, 0x790
	.global gUnk_08B7E94F
gUnk_08B7E94F:
	.incbin "baserom.gba", 0xB7E94F, 0x2C6
	.global gUnk_08B7EC15
gUnk_08B7EC15:
	.byte 0x00, 0xE2, 0x0A, 0x07, 0x03, 0x00, 0x32, 0x01, 0x0B
	.global gUnk_08B7EC1E
gUnk_08B7EC1E:
	.incbin "baserom.gba", 0xB7EC1E, 0x506
	.global gUnk_08B7F124
gUnk_08B7F124:
	.incbin "baserom.gba", 0xB7F124, 0x35A
	.global gUnk_08B7F47E
gUnk_08B7F47E:
	.incbin "baserom.gba", 0xB7F47E, 0xC02
	.global gUnk_08B80080
gUnk_08B80080:
	.incbin "baserom.gba", 0xB80080, 0x4E3
	.global gUnk_08B80563
gUnk_08B80563:
	.incbin "baserom.gba", 0xB80563, 0x17C3
	.global gUnk_08B81D26
gUnk_08B81D26:
	.incbin "baserom.gba", 0xB81D26, 0x11FA
	.global gUnk_08B82F20
gUnk_08B82F20:
	.incbin "baserom.gba", 0xB82F20, 0x24C
	.global gUnk_08B8316C
gUnk_08B8316C:
	.incbin "baserom.gba", 0xB8316C, 0x30D
	.global gUnk_08B83479
gUnk_08B83479:
	.incbin "baserom.gba", 0xB83479, 0x4CB
	.global gUnk_08B83944
gUnk_08B83944:
	.incbin "baserom.gba", 0xB83944, 0x17B
	.global gUnk_08B83ABF
gUnk_08B83ABF:
	.incbin "baserom.gba", 0xB83ABF, 0x82
	.global gUnk_08B83B41
gUnk_08B83B41:
	.byte 0x00, 0xFB, 0x90, 0x07, 0x02, 0x80, 0x01, 0x02, 0x00, 0xB4, 0x0B
	.global gUnk_08B83B4C
gUnk_08B83B4C:
	.incbin "baserom.gba", 0xB83B4C, 0x166
	.global gUnk_08B83CB2
gUnk_08B83CB2:
	.incbin "baserom.gba", 0xB83CB2, 0x8D2
	.global gUnk_08B84584
gUnk_08B84584:
	.incbin "baserom.gba", 0xB84584, 0x38F
	.global gUnk_08B84913
gUnk_08B84913:
	.incbin "baserom.gba", 0xB84913, 0xD61
	.global gUnk_08B85674
gUnk_08B85674:
	.byte 0x07, 0x03, 0x66, 0x00, 0x08, 0x03, 0x0D, 0x07, 0x03, 0x07, 0x7F, 0x02, 0x4D, 0x01, 0x05, 0x03
	.byte 0x3E, 0x7F, 0x02, 0x30, 0x09, 0x06, 0x03, 0x3E, 0x00, 0x02, 0xA3, 0x50, 0x05, 0x03, 0x3E, 0x7F
	.byte 0x02, 0x30, 0x09, 0x06, 0x03, 0x3E, 0x00, 0x02, 0xB0, 0x4F, 0x07, 0x03, 0x67, 0x00, 0x02, 0x80
	.byte 0x01, 0x0B
	.global gUnk_08B856A6
gUnk_08B856A6:
	.incbin "baserom.gba", 0xB856A6, 0xB34
	.global gUnk_08B861DA
gUnk_08B861DA:
	.incbin "baserom.gba", 0xB861DA, 0xA7F
	.global gUnk_08B86C59
gUnk_08B86C59:
	.byte 0x00, 0xB0, 0x71, 0x0B, 0x02, 0x00, 0x36, 0x0B
	.global gUnk_08B86C61
gUnk_08B86C61:
	.incbin "baserom.gba", 0xB86C61, 0x285
	.global gUnk_08B86EE6
gUnk_08B86EE6:
	.incbin "baserom.gba", 0xB86EE6, 0xD3
	.global gUnk_08B86FB9
gUnk_08B86FB9:
	.incbin "baserom.gba", 0xB86FB9, 0x447
	.global gUnk_08B87400
gUnk_08B87400:
	.byte 0x07, 0x04, 0x66, 0x00, 0x08, 0x04, 0x04, 0x07, 0x04, 0x07, 0x7F, 0x02, 0x00, 0x2A, 0x05, 0x04
	.byte 0x3C, 0x49, 0x02, 0xA0, 0x01, 0x06, 0x04, 0x3C, 0x00, 0x02, 0x60, 0x04, 0x07, 0x04, 0x67, 0x00
	.byte 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B87424
gUnk_08B87424:
	.incbin "baserom.gba", 0xB87424, 0x4AD
	.global gUnk_08B878D1
gUnk_08B878D1:
	.incbin "baserom.gba", 0xB878D1, 0x89
	.global gUnk_08B8795A
gUnk_08B8795A:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x01, 0xC0, 0x02, 0x00, 0x66, 0x0B
	.global gUnk_08B87964
gUnk_08B87964:
	.incbin "baserom.gba", 0xB87964, 0x239
	.global gUnk_08B87B9D
gUnk_08B87B9D:
	.incbin "baserom.gba", 0xB87B9D, 0x357
	.global gUnk_08B87EF4
gUnk_08B87EF4:
	.incbin "baserom.gba", 0xB87EF4, 0x34F
	.global gUnk_08B88243
gUnk_08B88243:
	.incbin "baserom.gba", 0xB88243, 0x1AE
	.global gUnk_08B883F1
gUnk_08B883F1:
	.incbin "baserom.gba", 0xB883F1, 0x7A9
	.global gUnk_08B88B9A
gUnk_08B88B9A:
	.incbin "baserom.gba", 0xB88B9A, 0xD25
	.global gUnk_08B898BF
gUnk_08B898BF:
	.incbin "baserom.gba", 0xB898BF, 0x196
	.global gUnk_08B89A55
gUnk_08B89A55:
	.byte 0x00, 0xC0, 0x27, 0x09, 0x02, 0x00, 0x12, 0x0B
	.global gUnk_08B89A5D
gUnk_08B89A5D:
	.byte 0x07, 0x00, 0x66, 0x00, 0x07, 0x00, 0x07, 0x5A, 0x08, 0x00, 0x11, 0x05, 0x00, 0x3C, 0x6E, 0x02
	.byte 0x00, 0x03, 0x05, 0x00, 0x3C, 0x6E, 0x06, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x03, 0x06, 0x00, 0x3C
	.byte 0x00, 0x07, 0x00, 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B89A86
gUnk_08B89A86:
	.incbin "baserom.gba", 0xB89A86, 0x14B
	.global gUnk_08B89BD1
gUnk_08B89BD1:
	.byte 0x08, 0x02, 0x7F, 0x07, 0x02, 0x07, 0x7F, 0x01, 0x05, 0x05, 0x02, 0x32, 0x72, 0x02, 0x89, 0x02
	.byte 0x06, 0x02, 0x32, 0x00, 0x02, 0x72, 0x03, 0x0B
	.global gUnk_08B89BE9
gUnk_08B89BE9:
	.incbin "baserom.gba", 0xB89BE9, 0x8E
	.global gUnk_08B89C77
gUnk_08B89C77:
	.incbin "baserom.gba", 0xB89C77, 0xDE
	.global gUnk_08B89D55
gUnk_08B89D55:
	.incbin "baserom.gba", 0xB89D55, 0xCC
	.global gUnk_08B89E21
gUnk_08B89E21:
	.byte 0x00, 0x1C, 0xC8, 0x06, 0x02, 0x80, 0x07, 0x02, 0x00, 0xAE, 0x0B
	.global gUnk_08B89E2C
gUnk_08B89E2C:
	.incbin "baserom.gba", 0xB89E2C, 0x630
	.global gUnk_08B8A45C
gUnk_08B8A45C:
	.incbin "baserom.gba", 0xB8A45C, 0x85B
	.global gUnk_08B8ACB7
gUnk_08B8ACB7:
	.incbin "baserom.gba", 0xB8ACB7, 0x4DA
	.global gUnk_08B8B191
gUnk_08B8B191:
	.incbin "baserom.gba", 0xB8B191, 0x446
	.global gUnk_08B8B5D7
gUnk_08B8B5D7:
	.incbin "baserom.gba", 0xB8B5D7, 0x453
	.global gUnk_08B8BA2A
gUnk_08B8BA2A:
	.incbin "baserom.gba", 0xB8BA2A, 0x30A
	.global gUnk_08B8BD34
gUnk_08B8BD34:
	.incbin "baserom.gba", 0xB8BD34, 0x221
	.global gUnk_08B8BF55
gUnk_08B8BF55:
	.incbin "baserom.gba", 0xB8BF55, 0x154
	.global gUnk_08B8C0A9
gUnk_08B8C0A9:
	.byte 0x08, 0x04, 0x04, 0x07, 0x04, 0x07, 0x7F, 0x02, 0x80, 0x07, 0x07, 0x04, 0x66, 0x00, 0x02, 0x03
	.byte 0x5D, 0x05, 0x04, 0x41, 0x7F, 0x02, 0x3D, 0x02, 0x06, 0x04, 0x41, 0x00, 0x02, 0xC0, 0x48, 0x07
	.byte 0x04, 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B8C0D0
gUnk_08B8C0D0:
	.incbin "baserom.gba", 0xB8C0D0, 0x790
	.global gUnk_08B8C860
gUnk_08B8C860:
	.incbin "baserom.gba", 0xB8C860, 0x2C6
	.global gUnk_08B8CB26
gUnk_08B8CB26:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x02, 0x00, 0x1E, 0x0B
	.global gUnk_08B8CB2E
gUnk_08B8CB2E:
	.incbin "baserom.gba", 0xB8CB2E, 0x11B
	.global gUnk_08B8CC49
gUnk_08B8CC49:
	.incbin "baserom.gba", 0xB8CC49, 0x18C
	.global gUnk_08B8CDD5
gUnk_08B8CDD5:
	.incbin "baserom.gba", 0xB8CDD5, 0xED
	.global gUnk_08B8CEC2
gUnk_08B8CEC2:
	.byte 0x00, 0xE2, 0x0A, 0x07, 0x01, 0xC0, 0x02, 0x00, 0x0C, 0x0B
	.global gUnk_08B8CECC
gUnk_08B8CECC:
	.incbin "baserom.gba", 0xB8CECC, 0x2DD
	.global gUnk_08B8D1A9
gUnk_08B8D1A9:
	.incbin "baserom.gba", 0xB8D1A9, 0xAE
	.global gUnk_08B8D257
gUnk_08B8D257:
	.byte 0x00, 0x80, 0x1A, 0x06, 0x02, 0x00, 0x12, 0x0B
	.global gUnk_08B8D25F
gUnk_08B8D25F:
	.incbin "baserom.gba", 0xB8D25F, 0x265
	.global gUnk_08B8D4C4
gUnk_08B8D4C4:
	.incbin "baserom.gba", 0xB8D4C4, 0x18C
	.global gUnk_08B8D650
gUnk_08B8D650:
	.byte 0x08, 0x02, 0x03, 0x07, 0x02, 0x07, 0x7F, 0x02, 0x4A, 0x0D, 0x05, 0x02, 0x1C, 0x7F, 0x01, 0x78
	.byte 0x06, 0x02, 0x1C, 0x00, 0x01, 0x08, 0x05, 0x02, 0x1C, 0x7F, 0x01, 0x7C, 0x06, 0x02, 0x1C, 0x00
	.byte 0x01, 0x04, 0x05, 0x02, 0x1C, 0x7F, 0x01, 0x74, 0x06, 0x02, 0x1C, 0x00, 0x01, 0x0C, 0x05, 0x02
	.byte 0x1C, 0x7F, 0x02, 0xC8, 0x01, 0x06, 0x02, 0x1C, 0x00, 0x02, 0x6E, 0x01, 0x0B
	.global gUnk_08B8D68D
gUnk_08B8D68D:
	.incbin "baserom.gba", 0xB8D68D, 0x44
	.global gUnk_08B8D6D1
gUnk_08B8D6D1:
	.byte 0x00, 0x24, 0xB8, 0x08, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B8D6D9
gUnk_08B8D6D9:
	.incbin "baserom.gba", 0xB8D6D9, 0xC8
	.global gUnk_08B8D7A1
gUnk_08B8D7A1:
	.byte 0x08, 0x01, 0x12, 0x07, 0x01, 0x07, 0x7F, 0x02, 0x83, 0x04, 0x05, 0x01, 0x39, 0x7F, 0x02, 0xFF
	.byte 0x01, 0x06, 0x01, 0x39, 0x00, 0x01, 0x7E, 0x0B
	.global gUnk_08B8D7B9
gUnk_08B8D7B9:
	.incbin "baserom.gba", 0xB8D7B9, 0x5E
	.global gUnk_08B8D817
gUnk_08B8D817:
	.incbin "baserom.gba", 0xB8D817, 0x99
	.global gUnk_08B8D8B0
gUnk_08B8D8B0:
	.byte 0x00, 0xAE, 0x52, 0x08, 0x02, 0x00, 0x0F, 0x0B
	.global gUnk_08B8D8B8
gUnk_08B8D8B8:
	.incbin "baserom.gba", 0xB8D8B8, 0x137
	.global gUnk_08B8D9EF
gUnk_08B8D9EF:
	.incbin "baserom.gba", 0xB8D9EF, 0x6E
	.global gUnk_08B8DA5D
gUnk_08B8DA5D:
	.incbin "baserom.gba", 0xB8DA5D, 0x129
	.global gUnk_08B8DB86
gUnk_08B8DB86:
	.byte 0x00, 0x1B, 0x8A, 0x06, 0x02, 0x80, 0x07, 0x03, 0x00, 0x26, 0x01, 0x0B
	.global gUnk_08B8DB92
gUnk_08B8DB92:
	.incbin "baserom.gba", 0xB8DB92, 0x506
	.global gUnk_08B8E098
gUnk_08B8E098:
	.incbin "baserom.gba", 0xB8E098, 0x360
	.global gUnk_08B8E3F8
gUnk_08B8E3F8:
	.incbin "baserom.gba", 0xB8E3F8, 0x10E7
	.global gUnk_08B8F4DF
gUnk_08B8F4DF:
	.incbin "baserom.gba", 0xB8F4DF, 0x1694
	.global gUnk_08B90B73
gUnk_08B90B73:
	.incbin "baserom.gba", 0xB90B73, 0x13CA
	.global gUnk_08B91F3D
gUnk_08B91F3D:
	.incbin "baserom.gba", 0xB91F3D, 0x397
	.global gUnk_08B922D4
gUnk_08B922D4:
	.incbin "baserom.gba", 0xB922D4, 0x5A7
	.global gUnk_08B9287B
gUnk_08B9287B:
	.incbin "baserom.gba", 0xB9287B, 0x17B
	.global gUnk_08B929F6
gUnk_08B929F6:
	.incbin "baserom.gba", 0xB929F6, 0x82
	.global gUnk_08B92A78
gUnk_08B92A78:
	.incbin "baserom.gba", 0xB92A78, 0x359
	.global gUnk_08B92DD1
gUnk_08B92DD1:
	.byte 0x08, 0x0A, 0x14, 0x01, 0x60, 0x07, 0x0A, 0x07, 0x7F, 0x02, 0x20, 0x07, 0x07, 0x0A, 0x66, 0x00
	.byte 0x02, 0xC0, 0x75, 0x05, 0x0A, 0x3D, 0x51, 0x02, 0x40, 0x02, 0x06, 0x0A, 0x3D, 0x00, 0x02, 0xC0
	.byte 0xA5, 0x05, 0x0A, 0x3D, 0x69, 0x02, 0x38, 0x02, 0x06, 0x0A, 0x3D, 0x00, 0x01, 0x08, 0x07, 0x0A
	.byte 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B92E07
gUnk_08B92E07:
	.incbin "baserom.gba", 0xB92E07, 0x1CA
	.global gUnk_08B92FD1
gUnk_08B92FD1:
	.incbin "baserom.gba", 0xB92FD1, 0x7F
	.4byte gUnk_08B20200
	.byte 0x05, 0x0C, 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D, 0x00, 0x02, 0xB2, 0x08, 0x05, 0x0C
	.byte 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D
	.4byte gUnk_08B20200
	.byte 0x05, 0x0C, 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D, 0x00, 0x02, 0xB2, 0x08, 0x05, 0x0C
	.byte 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D
	.4byte gUnk_08B20200
	.byte 0x05, 0x0C, 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D, 0x00, 0x02, 0xB2, 0x08, 0x05, 0x0C
	.byte 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D
	.4byte gUnk_08B20200
	.byte 0x05, 0x0C, 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D, 0x00, 0x02, 0xB2, 0x08, 0x05, 0x0C
	.byte 0x3D, 0x64, 0x02, 0x4E, 0x03, 0x06, 0x0C, 0x3D, 0x00, 0x02, 0x12, 0x30, 0x07, 0x0C, 0x67, 0x00
	.byte 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08B930CC
gUnk_08B930CC:
	.byte 0x00, 0x1C, 0xC8, 0x06, 0x02, 0x00, 0x09, 0x02, 0x80, 0xB2, 0x0B
	.global gUnk_08B930D7
gUnk_08B930D7:
	.incbin "baserom.gba", 0xB930D7, 0x169
	.global gUnk_08B93240
gUnk_08B93240:
	.incbin "baserom.gba", 0xB93240, 0x8D3
	.global gUnk_08B93B13
gUnk_08B93B13:
	.incbin "baserom.gba", 0xB93B13, 0x392
	.global gUnk_08B93EA5
gUnk_08B93EA5:
	.incbin "baserom.gba", 0xB93EA5, 0xD6A
	.global gUnk_08B94C0F
gUnk_08B94C0F:
	.byte 0x02, 0x00, 0x06, 0x07, 0x03, 0x66, 0x00, 0x08, 0x03, 0x0D, 0x07, 0x03, 0x07, 0x7F, 0x02, 0x85
	.byte 0x01, 0x05, 0x03, 0x3E, 0x7F, 0x02, 0x30, 0x09, 0x06, 0x03, 0x3E, 0x00, 0x02, 0x6B, 0x50, 0x05
	.byte 0x03, 0x3E, 0x7F, 0x02, 0x30, 0x09, 0x06, 0x03, 0x3E, 0x00, 0x02, 0xB0, 0x4F, 0x07, 0x03, 0x67
	.byte 0x00, 0x02, 0x80, 0x01, 0x0B
	.global gUnk_08B94C44
gUnk_08B94C44:
	.incbin "baserom.gba", 0xB94C44, 0xB37
	.global gUnk_08B9577B
gUnk_08B9577B:
	.incbin "baserom.gba", 0xB9577B, 0xA84
	.global gUnk_08B961FF
gUnk_08B961FF:
	.incbin "baserom.gba", 0xB961FF, 0x2EC
	.global gUnk_08B964EB
gUnk_08B964EB:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x02, 0x00, 0xC6, 0x0B
	.global gUnk_08B964F3
gUnk_08B964F3:
	.incbin "baserom.gba", 0xB964F3, 0xBB4
	.global gUnk_08B970A7
gUnk_08B970A7:
	.incbin "baserom.gba", 0xB970A7, 0x1AE
	.global gUnk_08B97255
gUnk_08B97255:
	.incbin "baserom.gba", 0xB97255, 0xA5E
	.global gUnk_08B97CB3
gUnk_08B97CB3:
	.incbin "baserom.gba", 0xB97CB3, 0x2D8
	.global gUnk_08B97F8B
gUnk_08B97F8B:
	.incbin "baserom.gba", 0xB97F8B, 0x2DE
	.global gUnk_08B98269
gUnk_08B98269:
	.incbin "baserom.gba", 0xB98269, 0x28C
	.global gUnk_08B984F5
gUnk_08B984F5:
	.incbin "baserom.gba", 0xB984F5, 0x1AF
	.global gUnk_08B986A4
gUnk_08B986A4:
	.incbin "baserom.gba", 0xB986A4, 0xF1
	.global gUnk_08B98795
gUnk_08B98795:
	.incbin "baserom.gba", 0xB98795, 0xED6
	.global gUnk_08B9966B
gUnk_08B9966B:
	.incbin "baserom.gba", 0xB9966B, 0xB6C
	.global gUnk_08B9A1D7
gUnk_08B9A1D7:
	.byte 0x00, 0x11, 0xD5, 0x06, 0x02, 0x80, 0x07, 0x02, 0x00, 0xC6, 0x0B
	.global gUnk_08B9A1E2
gUnk_08B9A1E2:
	.incbin "baserom.gba", 0xB9A1E2, 0xBB7
	.global gUnk_08B9AD99
gUnk_08B9AD99:
	.incbin "baserom.gba", 0xB9AD99, 0x1B1
	.global gUnk_08B9AF4A
gUnk_08B9AF4A:
	.incbin "baserom.gba", 0xB9AF4A, 0xA61
	.global gUnk_08B9B9AB
gUnk_08B9B9AB:
	.incbin "baserom.gba", 0xB9B9AB, 0x2DB
	.global gUnk_08B9BC86
gUnk_08B9BC86:
	.incbin "baserom.gba", 0xB9BC86, 0x86
	.4byte act_hud_go
	.incbin "baserom.gba", 0xB9BD10, 0x257
	.global gUnk_08B9BF67
gUnk_08B9BF67:
	.incbin "baserom.gba", 0xB9BF67, 0x28F
	.global gUnk_08B9C1F6
gUnk_08B9C1F6:
	.incbin "baserom.gba", 0xB9C1F6, 0x1B2
	.global gUnk_08B9C3A8
gUnk_08B9C3A8:
	.incbin "baserom.gba", 0xB9C3A8, 0xF4
	.global gUnk_08B9C49C
gUnk_08B9C49C:
	.incbin "baserom.gba", 0xB9C49C, 0xED9
	.global gUnk_08B9D375
gUnk_08B9D375:
	.incbin "baserom.gba", 0xB9D375, 0xB64
	.global gUnk_08B9DED9
gUnk_08B9DED9:
	.byte 0x08, 0x08, 0x01, 0x07, 0x08, 0x07, 0x7F, 0x05, 0x08, 0x41, 0x7F, 0x05, 0x08, 0x3E, 0x7F, 0x05
	.byte 0x08, 0x3A, 0x7F
	.4byte gUnk_08068401
	.4byte gUnk_0806003A
	.byte 0x3E, 0x00, 0x01, 0x0C, 0x06, 0x08, 0x41, 0x00
	.4byte gUnk_08053001
	.4byte gUnk_08057F3A
	.4byte gUnk_08057F3E
	.byte 0x41, 0x7F, 0x01, 0x1D, 0x06, 0x08, 0x41, 0x00, 0x01, 0x01, 0x06, 0x08, 0x3E, 0x00, 0x01, 0x01
	.byte 0x06, 0x08, 0x3A, 0x00
	.4byte gUnk_08052101
	.4byte gUnk_0805613A
	.4byte gUnk_0805613E
	.incbin "baserom.gba", 0xB9DF28, 0x44
	.4byte gUnk_08068101
	.4byte gUnk_0806003A
	.4byte gUnk_0806003F
	.byte 0x44, 0x00, 0x01, 0x02, 0x06, 0x08, 0x3D, 0x00
	.4byte gUnk_08053D01
	.4byte gUnk_08057F3A
	.4byte gUnk_08057F3D
	.4byte gUnk_08057F3F
	.byte 0x44, 0x7F, 0x01, 0x21, 0x06, 0x08, 0x3D, 0x00, 0x01, 0x01, 0x06, 0x08
	.4byte gUnk_0806003F
	.byte 0x3A, 0x00, 0x01, 0x04, 0x06, 0x08, 0x44, 0x00
	.4byte gUnk_08051A01
	.4byte gUnk_08055F3A
	.4byte gUnk_08055F3D
	.4byte gUnk_08055F3F
	.byte 0x44, 0x5F, 0x01, 0x20, 0x06, 0x08, 0x3A, 0x00, 0x01, 0x01, 0x06, 0x08, 0x3D, 0x00, 0x01, 0x02
	.byte 0x06, 0x08, 0x3F, 0x00, 0x06, 0x08, 0x44, 0x00
	.4byte gUnk_08051D01
	.4byte gUnk_08057F3A
	.4byte gUnk_08057F3D
	.4byte gUnk_08057F3F
	.byte 0x44, 0x7F, 0x01, 0x1F, 0x06, 0x08, 0x44, 0x00
	.4byte gUnk_08060301
	.byte 0x3D, 0x00, 0x01, 0x02, 0x06, 0x08, 0x3F, 0x00, 0x06, 0x08, 0x3A, 0x00
	.4byte gUnk_08051C01
	.4byte gUnk_08057F41
	.4byte gUnk_08057F45
	.byte 0x48, 0x7F, 0x01, 0x7C, 0x06, 0x08, 0x48, 0x00
	.4byte gUnk_08060201
	.byte 0x41, 0x00, 0x01, 0x02, 0x06, 0x08, 0x45, 0x00, 0x01, 0x40, 0x05, 0x08, 0x46, 0x7F, 0x05, 0x08
	.byte 0x43, 0x7F, 0x05, 0x08, 0x3F, 0x7F, 0x01, 0x7A, 0x06, 0x08, 0x3F, 0x00, 0x06, 0x08, 0x43, 0x00
	.byte 0x06, 0x08, 0x46, 0x00
	.4byte gUnk_08054401
	.4byte gUnk_08057F41
	.4byte gUnk_08057F45
	.byte 0x48, 0x7F, 0x01, 0x0E, 0x07, 0x08, 0x07, 0x7B
	.4byte gUnk_08070C01
	.byte 0x07, 0x77, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x73
	.4byte gUnk_08070C01
	.byte 0x07, 0x6E, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x6A
	.4byte gUnk_08070C01
	.byte 0x07, 0x66, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x62
	.4byte gUnk_08070C01
	.byte 0x07, 0x5D, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x59
	.4byte gUnk_08070C01
	.byte 0x07, 0x55, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x51
	.4byte gUnk_08070C01
	.byte 0x07, 0x4C, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x48
	.4byte gUnk_08070C01
	.byte 0x07, 0x44, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x40
	.4byte gUnk_08070C01
	.byte 0x07, 0x3B, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x37
	.4byte gUnk_08070C01
	.byte 0x07, 0x33, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x2F
	.4byte gUnk_08070C01
	.byte 0x07, 0x2B, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x26
	.4byte gUnk_08070C01
	.byte 0x07, 0x22, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x1E
	.4byte gUnk_08070C01
	.byte 0x07, 0x1A, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x1C
	.4byte gUnk_08070C01
	.byte 0x07, 0x1F, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x21
	.4byte gUnk_08070C01
	.byte 0x07, 0x24, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x26
	.4byte gUnk_08070C01
	.byte 0x07, 0x29, 0x01, 0x18, 0x07, 0x08, 0x07, 0x2E
	.4byte gUnk_08070C01
	.byte 0x07, 0x30, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x33
	.4byte gUnk_08070C01
	.byte 0x07, 0x36, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x38
	.4byte gUnk_08070C01
	.byte 0x07, 0x3B, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x3D
	.4byte gUnk_08070C01
	.byte 0x07, 0x40, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x42
	.4byte gUnk_08070C01
	.byte 0x07, 0x45, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x47
	.4byte gUnk_08070C01
	.byte 0x07, 0x4A, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x4D
	.4byte gUnk_08070C01
	.byte 0x07, 0x4F, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x52
	.4byte gUnk_08070C01
	.byte 0x07, 0x54, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x57
	.4byte gUnk_08070C01
	.byte 0x07, 0x59, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x5C
	.4byte gUnk_08070C01
	.byte 0x07, 0x5E, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x61
	.4byte gUnk_08070C01
	.byte 0x07, 0x63, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x66
	.4byte gUnk_08070C01
	.byte 0x07, 0x69, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x6B
	.4byte gUnk_08070C01
	.byte 0x07, 0x6E, 0x01, 0x0C, 0x07, 0x08, 0x07, 0x70
	.4byte gUnk_08070C01
	.incbin "baserom.gba", 0xB9E19C, 0xC6
	.global gUnk_08B9E262
gUnk_08B9E262:
	.byte 0x00, 0x80, 0x1A, 0x06, 0x02, 0x00, 0x1E, 0x0B
	.global gUnk_08B9E26A
gUnk_08B9E26A:
	.incbin "baserom.gba", 0xB9E26A, 0xE9
	.global gUnk_08B9E353
gUnk_08B9E353:
	.incbin "baserom.gba", 0xB9E353, 0x182
	.global gUnk_08B9E4D5
gUnk_08B9E4D5:
	.incbin "baserom.gba", 0xB9E4D5, 0x313
	.global gUnk_08B9E7E8
gUnk_08B9E7E8:
	.incbin "baserom.gba", 0xB9E7E8, 0x24F
	.global gUnk_08B9EA37
gUnk_08B9EA37:
	.byte 0x00, 0xC0, 0x27, 0x09, 0x02, 0x00, 0xBA, 0x0B
	.global gUnk_08B9EA3F
gUnk_08B9EA3F:
	.incbin "baserom.gba", 0xB9EA3F, 0xA8C
	.global gUnk_08B9F4CB
gUnk_08B9F4CB:
	.incbin "baserom.gba", 0xB9F4CB, 0x62
	.global gUnk_08B9F52D
gUnk_08B9F52D:
	.incbin "baserom.gba", 0xB9F52D, 0x13CE
	.global gUnk_08BA08FB
gUnk_08BA08FB:
	.incbin "baserom.gba", 0xBA08FB, 0x5C0
	.global gUnk_08BA0EBB
gUnk_08BA0EBB:
	.incbin "baserom.gba", 0xBA0EBB, 0x27C
	.global gUnk_08BA1137
gUnk_08BA1137:
	.incbin "baserom.gba", 0xBA1137, 0xE8
	.global gUnk_08BA121F
gUnk_08BA121F:
	.byte 0x08, 0x06, 0x04, 0x07, 0x06, 0x07, 0x7F, 0x02, 0x00, 0x0C, 0x07, 0x06, 0x66, 0x00, 0x02, 0x00
	.byte 0x45, 0x05, 0x06, 0x40, 0x7F, 0x02, 0x68, 0x01, 0x06, 0x06, 0x40, 0x00, 0x02, 0x98, 0x61, 0x07
	.byte 0x06, 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08BA1246
gUnk_08BA1246:
	.incbin "baserom.gba", 0xBA1246, 0x4C
	.global gUnk_08BA1292
gUnk_08BA1292:
	.incbin "baserom.gba", 0xBA1292, 0x6A
	.4byte gUnk_080603FD
	.byte 0x51, 0x00, 0x01, 0x83, 0x05, 0x08, 0x51, 0x7F
	.4byte gUnk_08067101
	.byte 0x51, 0x00, 0x01, 0x0F, 0x05, 0x08, 0x4C, 0x7F
	.4byte gUnk_08062201
	.byte 0x4C, 0x00, 0x01, 0x1E, 0x05, 0x08, 0x4E, 0x7F
	.4byte gUnk_08062701
	.byte 0x4E, 0x00, 0x01, 0x59, 0x05, 0x08, 0x48, 0x7F
	.4byte gUnk_08062501
	.incbin "baserom.gba", 0xBA1330, 0xAC
	.4byte gUnk_08050201
	.byte 0x4F, 0x51, 0x01, 0x0D, 0x06, 0x08, 0x4F, 0x00
	.4byte gUnk_08050301
	.byte 0x50, 0x64, 0x01, 0x0D, 0x06, 0x08, 0x50, 0x00
	.4byte gUnk_08050201
	.byte 0x51, 0x7F, 0x01, 0x3D, 0x06, 0x08, 0x51, 0x00
	.4byte gUnk_08058201
	.byte 0x4C, 0x7F, 0x01, 0x1C, 0x06, 0x08, 0x4C, 0x00
	.4byte gUnk_08052401
	.byte 0x4E, 0x7F, 0x01, 0x63, 0x06, 0x08, 0x4E, 0x00
	.4byte gUnk_08051D01
	.byte 0x45, 0x7F, 0x01, 0x10, 0x06, 0x08, 0x45, 0x00
	.4byte gUnk_08053001
	.incbin "baserom.gba", 0xBA1428, 0x2D4
	.4byte gUnk_08063401
	.byte 0x4F, 0x00, 0x01, 0x0C, 0x05, 0x08, 0x50, 0x7F
	.4byte gUnk_08066301
	.byte 0x50, 0x00, 0x01, 0x1D, 0x05, 0x08, 0x53, 0x7F
	.4byte gUnk_08063401
	.byte 0x53, 0x00, 0x01, 0x0C, 0x05, 0x08, 0x50, 0x7F
	.4byte gUnk_08066C01
	.byte 0x50, 0x00, 0x01, 0x14, 0x05, 0x08, 0x4F, 0x7F
	.4byte gUnk_08063401
	.byte 0x4F, 0x00, 0x01, 0x0C, 0x05, 0x08, 0x4E, 0x7F
	.4byte gUnk_08066601
	.byte 0x4E, 0x00, 0x01, 0x1A, 0x05, 0x08, 0x53, 0x7F
	.4byte gUnk_08063401
	.byte 0x53, 0x00, 0x01, 0x0C, 0x05, 0x08, 0x4B, 0x7F
	.4byte gUnk_08066201
	.byte 0x4B, 0x00, 0x01, 0x1E, 0x05, 0x08, 0x4C, 0x7F
	.4byte gUnk_08065901
	.incbin "baserom.gba", 0xBA1760, 0xCD
	.global gUnk_08BA182D
gUnk_08BA182D:
	.incbin "baserom.gba", 0xBA182D, 0x4A4
	.global gUnk_08BA1CD1
gUnk_08BA1CD1:
	.incbin "baserom.gba", 0xBA1CD1, 0x3A8
	.global gUnk_08BA2079
gUnk_08BA2079:
	.incbin "baserom.gba", 0xBA2079, 0x78
	.global gUnk_08BA20F1
gUnk_08BA20F1:
	.incbin "baserom.gba", 0xBA20F1, 0x61
	.global gUnk_08BA2152
gUnk_08BA2152:
	.incbin "baserom.gba", 0xBA2152, 0x48
	.global gUnk_08BA219A
gUnk_08BA219A:
	.byte 0x00, 0xAE, 0x52, 0x08, 0x02, 0xC0, 0x06, 0x02, 0x00, 0xBA, 0x0B
	.global gUnk_08BA21A5
gUnk_08BA21A5:
	.incbin "baserom.gba", 0xBA21A5, 0xA8F
	.global gUnk_08BA2C34
gUnk_08BA2C34:
	.incbin "baserom.gba", 0xBA2C34, 0x39E
	.global gUnk_08BA2FD2
gUnk_08BA2FD2:
	.incbin "baserom.gba", 0xBA2FD2, 0x13D1
	.global gUnk_08BA43A3
gUnk_08BA43A3:
	.incbin "baserom.gba", 0xBA43A3, 0x5C3
	.global gUnk_08BA4966
gUnk_08BA4966:
	.incbin "baserom.gba", 0xBA4966, 0x27F
	.global gUnk_08BA4BE5
gUnk_08BA4BE5:
	.incbin "baserom.gba", 0xBA4BE5, 0xEB
	.global gUnk_08BA4CD0
gUnk_08BA4CD0:
	.byte 0x02, 0xC0, 0x06, 0x08, 0x06, 0x04, 0x07, 0x06, 0x07, 0x7F, 0x02, 0x00, 0x0C, 0x07, 0x06, 0x66
	.byte 0x00, 0x02, 0x00, 0x45, 0x05, 0x06, 0x42, 0x7F, 0x02, 0x68, 0x01, 0x06, 0x06, 0x42, 0x00, 0x02
	.byte 0x98, 0x61, 0x07, 0x06, 0x67, 0x00, 0x02, 0x00, 0x06, 0x0B
	.global gUnk_08BA4CFA
gUnk_08BA4CFA:
	.incbin "baserom.gba", 0xBA4CFA, 0x4F
	.global gUnk_08BA4D49
gUnk_08BA4D49:
	.incbin "baserom.gba", 0xBA4D49, 0x147
	.4byte gUnk_08060D01
	.byte 0x50, 0x00, 0x01, 0x02, 0x05, 0x08, 0x51, 0x51
	.4byte gUnk_08060D01
	.byte 0x51, 0x00, 0x01, 0x03, 0x05, 0x08, 0x52, 0x64
	.4byte gUnk_08060D01
	.byte 0x52, 0x00, 0x01, 0x02, 0x05, 0x08, 0x53, 0x7F
	.4byte gUnk_08063D01
	.incbin "baserom.gba", 0xBA4EB8, 0x2F8
	.4byte gUnk_08050119
	.byte 0x51, 0x7F, 0x01, 0x34, 0x06, 0x08, 0x51, 0x00
	.4byte gUnk_08050C01
	.byte 0x52, 0x7F, 0x01, 0x63, 0x06, 0x08, 0x52, 0x00
	.4byte gUnk_08051D01
	.incbin "baserom.gba", 0xBA51CC, 0x11B
	.global gUnk_08BA52E7
gUnk_08BA52E7:
	.incbin "baserom.gba", 0xBA52E7, 0x4A7
	.global gUnk_08BA578E
gUnk_08BA578E:
	.incbin "baserom.gba", 0xBA578E, 0x3AB
	.global gUnk_08BA5B39
gUnk_08BA5B39:
	.incbin "baserom.gba", 0xBA5B39, 0x7B
	.global gUnk_08BA5BB4
gUnk_08BA5BB4:
	.incbin "baserom.gba", 0xBA5BB4, 0x64
	.global gUnk_08BA5C18
gUnk_08BA5C18:
	.incbin "baserom.gba", 0xBA5C18, 0x4B
	.global gUnk_08BA5C63
gUnk_08BA5C63:
	.byte 0x00, 0x1A, 0xA3, 0x09, 0x02, 0x00, 0x4E, 0x0B
	.global gUnk_08BA5C6B
gUnk_08BA5C6B:
	.incbin "baserom.gba", 0xBA5C6B, 0x8DD
	.global gUnk_08BA6548
gUnk_08BA6548:
	.incbin "baserom.gba", 0xBA6548, 0x972
	.global gUnk_08BA6EBA
gUnk_08BA6EBA:
	.incbin "baserom.gba", 0xBA6EBA, 0x487
	.global gUnk_08BA7341
gUnk_08BA7341:
	.incbin "baserom.gba", 0xBA7341, 0x363
	.global gUnk_08BA76A4
gUnk_08BA76A4:
	.incbin "baserom.gba", 0xBA76A4, 0x972
	.global gUnk_08BA8016
gUnk_08BA8016:
	.byte 0x00, 0x40, 0x42, 0x0F, 0x02, 0xA0, 0x02, 0x02, 0x60, 0x09, 0x0B
	.global gUnk_08BA8021
gUnk_08BA8021:
	.incbin "baserom.gba", 0xBA8021, 0x17B
	.global gUnk_08BA819C
gUnk_08BA819C:
	.byte 0x08, 0x00, 0x26, 0x07, 0x00, 0x07, 0x7F, 0x05, 0x00, 0x3B, 0x7F, 0x01, 0x04, 0x05, 0x00, 0x3B
	.byte 0x7F, 0x01, 0x5C, 0x05, 0x00, 0x30, 0x50, 0x02, 0xA4, 0x01, 0x06, 0x00, 0x3B, 0x00, 0x01, 0x04
	.byte 0x06, 0x00, 0x3B, 0x00, 0x02, 0xA5, 0x01, 0x06, 0x00, 0x30, 0x00, 0x02, 0xF3, 0x01, 0x0B
	.global gUnk_08BA81CB
gUnk_08BA81CB:
	.byte 0x00, 0xE2, 0x0A, 0x07, 0x02, 0x00, 0xDE, 0x0B
	.global gUnk_08BA81D3
gUnk_08BA81D3:
	.incbin "baserom.gba", 0xBA81D3, 0x2CD
	.global gUnk_08BA84A0
gUnk_08BA84A0:
	.incbin "baserom.gba", 0xBA84A0, 0x4B3
	.global gUnk_08BA8953
gUnk_08BA8953:
	.incbin "baserom.gba", 0xBA8953, 0x20B5
	.global gUnk_08BAAA08
gUnk_08BAAA08:
	.incbin "baserom.gba", 0xBAAA08, 0x330
	.global gUnk_08BAAD38
gUnk_08BAAD38:
	.incbin "baserom.gba", 0xBAAD38, 0x55B
	.global gUnk_08BAB293
gUnk_08BAB293:
	.incbin "baserom.gba", 0xBAB293, 0x889
	.global gUnk_08BABB1C
gUnk_08BABB1C:
	.byte 0x00, 0x1B, 0x8A, 0x06, 0x02, 0x80, 0x07, 0x02, 0x00, 0xDE, 0x0B
	.global gUnk_08BABB27
gUnk_08BABB27:
	.incbin "baserom.gba", 0xBABB27, 0x2D0
	.global gUnk_08BABDF7
gUnk_08BABDF7:
	.incbin "baserom.gba", 0xBABDF7, 0x4B6
	.global gUnk_08BAC2AD
gUnk_08BAC2AD:
	.incbin "baserom.gba", 0xBAC2AD, 0x20B8
	.global gUnk_08BAE365
gUnk_08BAE365:
	.incbin "baserom.gba", 0xBAE365, 0x333
	.global gUnk_08BAE698
gUnk_08BAE698:
	.incbin "baserom.gba", 0xBAE698, 0x55E
	.global gUnk_08BAEBF6
gUnk_08BAEBF6:
	.incbin "baserom.gba", 0xBAEBF6, 0x88C
	.global gUnk_08BAF482
gUnk_08BAF482:
	.incbin "baserom.gba", 0xBAF482, 0x351
	.global gUnk_08BAF7D3
gUnk_08BAF7D3:
	.byte 0x00, 0x40, 0x42, 0x0F, 0x02, 0xA0, 0x02, 0x01, 0x40, 0x0B
	.global gUnk_08BAF7DD
gUnk_08BAF7DD:
	.incbin "baserom.gba", 0xBAF7DD, 0x80
	.global gUnk_08BAF85D
gUnk_08BAF85D:
	.byte 0x08, 0x00, 0x27, 0x07, 0x00, 0x07, 0x7F, 0x05, 0x00, 0x3B, 0x7F, 0x01, 0x05, 0x05, 0x00, 0x3B
	.byte 0x7F, 0x02, 0xDB, 0x01, 0x06, 0x00, 0x3B, 0x00, 0x01, 0x05, 0x06, 0x00, 0x3B, 0x00, 0x01, 0x7B
	.byte 0x0B
	.global gUnk_08BAF87E
gUnk_08BAF87E:
	.byte 0x00, 0xFB, 0x90, 0x07, 0x02, 0x80, 0x0D, 0x0B
	.global gUnk_08BAF886
gUnk_08BAF886:
	.byte 0x07, 0x00, 0x66, 0x00, 0x07, 0x00, 0x07, 0x7F, 0x08, 0x00, 0x0B, 0x05, 0x00, 0x3E, 0x7F, 0x02
	.byte 0x00, 0x06, 0x05, 0x00, 0x3E, 0x7F, 0x06, 0x00, 0x3E, 0x00, 0x02, 0x00, 0x06, 0x06, 0x00, 0x3E
	.byte 0x00, 0x07, 0x00, 0x67, 0x00, 0x02, 0x80, 0x01, 0x0B
	.global gUnk_08BAF8AF
gUnk_08BAF8AF:
	.incbin "baserom.gba", 0xBAF8AF, 0xE1
	.global gUnk_08BAF990
gUnk_08BAF990:
	.byte 0x07, 0x03, 0x66, 0x00, 0x08, 0x03, 0x0D, 0x07, 0x03, 0x07, 0x7F, 0x05, 0x03, 0x3E, 0x7F, 0x02
	.byte 0x30, 0x09, 0x06, 0x03, 0x3E, 0x00, 0x02, 0xD0, 0x02, 0x07, 0x03, 0x67, 0x00, 0x02, 0x80, 0x01
	.byte 0x0B
	.global gUnk_08BAF9B1
gUnk_08BAF9B1:
	.incbin "baserom.gba", 0xBAF9B1, 0x1AF
	.global gUnk_08BAFB60
gUnk_08BAFB60:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x02, 0x00, 0x36, 0x0B
	.global gUnk_08BAFB68
gUnk_08BAFB68:
	.incbin "baserom.gba", 0xBAFB68, 0x6C3
	.global gUnk_08BB022B
gUnk_08BB022B:
	.incbin "baserom.gba", 0xBB022B, 0xE33
	.global gUnk_08BB105E
gUnk_08BB105E:
	.incbin "baserom.gba", 0xBB105E, 0x139
	.global gUnk_08BB1197
gUnk_08BB1197:
	.incbin "baserom.gba", 0xBB1197, 0x140
	.global gUnk_08BB12D7
gUnk_08BB12D7:
	.byte 0x00, 0x1C, 0xC8, 0x06, 0x02, 0x00, 0x96, 0x0B
	.global gUnk_08BB12DF
gUnk_08BB12DF:
	.incbin "baserom.gba", 0xBB12DF, 0x6C9
	.global gUnk_08BB19A8
gUnk_08BB19A8:
	.incbin "baserom.gba", 0xBB19A8, 0x1513
	.global gUnk_08BB2EBB
gUnk_08BB2EBB:
	.incbin "baserom.gba", 0xBB2EBB, 0x951
	.global gUnk_08BB380C
gUnk_08BB380C:
	.incbin "baserom.gba", 0xBB380C, 0x5C2
	.global gUnk_08BB3DCE
gUnk_08BB3DCE:
	.incbin "baserom.gba", 0xBB3DCE, 0x333
	.global gUnk_08BB4101
gUnk_08BB4101:
	.incbin "baserom.gba", 0xBB4101, 0xFE
	.global gUnk_08BB41FF
gUnk_08BB41FF:
	.byte 0x00, 0xD8, 0xB8, 0x05, 0x02, 0x00, 0x09, 0x02, 0x00, 0x36, 0x0B
	.global gUnk_08BB420A
gUnk_08BB420A:
	.incbin "baserom.gba", 0xBB420A, 0x594
	.global gUnk_08BB479E
gUnk_08BB479E:
	.incbin "baserom.gba", 0xBB479E, 0x30E
	.global gUnk_08BB4AAC
gUnk_08BB4AAC:
	.incbin "baserom.gba", 0xBB4AAC, 0x4D8
	.global gUnk_08BB4F84
gUnk_08BB4F84:
	.byte 0x1C, 0x00, 0x00, 0x00
	.global gUnk_08BB4F88
gUnk_08BB4F88:
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB4F90
gUnk_08BB4F90:
	.4byte AGBPrintf
	.global gUnk_08BB4F94
gUnk_08BB4F94:
	.4byte AGBPrintf
	.global gUnk_08BB4F98
gUnk_08BB4F98:
	.byte 0x00, 0x00, 0x00, 0x00
	.4byte gUnk_08BB517C
	.4byte gUnk_08BB51D4
	.4byte gUnk_08BB522C
	.incbin "baserom.gba", 0xBB4FA8, 0x1D4
	.global gUnk_08BB517C
gUnk_08BB517C:
	.incbin "baserom.gba", 0xBB517C, 0x58
	.global gUnk_08BB51D4
gUnk_08BB51D4:
	.incbin "baserom.gba", 0xBB51D4, 0x58
	.global gUnk_08BB522C
gUnk_08BB522C:
	.incbin "baserom.gba", 0xBB522C, 0x58
	.global gUnk_08BB5284
gUnk_08BB5284:
	.4byte gUnk_08BB4F98
	.global gUnk_08BB5288
gUnk_08BB5288:
	.byte 0x01, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB529C
gUnk_08BB529C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB52A4
gUnk_08BB52A4:
	.4byte gUnk_08BB529C
	.4byte gUnk_08BB529C
	.global gUnk_08BB52AC
gUnk_08BB52AC:
	.4byte gUnk_08BB52A4
	.4byte gUnk_08BB52A4
	.global gUnk_08BB52B4
gUnk_08BB52B4:
	.4byte gUnk_08BB52AC
	.4byte gUnk_08BB52AC
	.global gUnk_08BB52BC
gUnk_08BB52BC:
	.4byte gUnk_08BB52B4
	.4byte gUnk_08BB52B4
	.global gUnk_08BB52C4
gUnk_08BB52C4:
	.4byte gUnk_08BB52BC
	.4byte gUnk_08BB52BC
	.global gUnk_08BB52CC
gUnk_08BB52CC:
	.4byte gUnk_08BB52C4
	.4byte gUnk_08BB52C4
	.global gUnk_08BB52D4
gUnk_08BB52D4:
	.4byte gUnk_08BB52CC
	.4byte gUnk_08BB52CC
	.global gUnk_08BB52DC
gUnk_08BB52DC:
	.4byte gUnk_08BB52D4
	.4byte gUnk_08BB52D4
	.global gUnk_08BB52E4
gUnk_08BB52E4:
	.4byte gUnk_08BB52DC
	.4byte gUnk_08BB52DC
	.global gUnk_08BB52EC
gUnk_08BB52EC:
	.4byte gUnk_08BB52E4
	.4byte gUnk_08BB52E4
	.global gUnk_08BB52F4
gUnk_08BB52F4:
	.4byte gUnk_08BB52EC
	.4byte gUnk_08BB52EC
	.global gUnk_08BB52FC
gUnk_08BB52FC:
	.4byte gUnk_08BB52F4
	.4byte gUnk_08BB52F4
	.global gUnk_08BB5304
gUnk_08BB5304:
	.4byte gUnk_08BB52FC
	.4byte gUnk_08BB52FC
	.global gUnk_08BB530C
gUnk_08BB530C:
	.4byte gUnk_08BB5304
	.4byte gUnk_08BB5304
	.global gUnk_08BB5314
gUnk_08BB5314:
	.4byte gUnk_08BB530C
	.4byte gUnk_08BB530C
	.global gUnk_08BB531C
gUnk_08BB531C:
	.4byte gUnk_08BB5314
	.4byte gUnk_08BB5314
	.global gUnk_08BB5324
gUnk_08BB5324:
	.4byte gUnk_08BB531C
	.4byte gUnk_08BB531C
	.global gUnk_08BB532C
gUnk_08BB532C:
	.4byte gUnk_08BB5324
	.4byte gUnk_08BB5324
	.global gUnk_08BB5334
gUnk_08BB5334:
	.4byte gUnk_08BB532C
	.4byte gUnk_08BB532C
	.global gUnk_08BB533C
gUnk_08BB533C:
	.4byte gUnk_08BB5334
	.4byte gUnk_08BB5334
	.global gUnk_08BB5344
gUnk_08BB5344:
	.4byte gUnk_08BB533C
	.4byte gUnk_08BB533C
	.global gUnk_08BB534C
gUnk_08BB534C:
	.4byte gUnk_08BB5344
	.4byte gUnk_08BB5344
	.global gUnk_08BB5354
gUnk_08BB5354:
	.4byte gUnk_08BB534C
	.4byte gUnk_08BB534C
	.global gUnk_08BB535C
gUnk_08BB535C:
	.4byte gUnk_08BB5354
	.4byte gUnk_08BB5354
	.global gUnk_08BB5364
gUnk_08BB5364:
	.4byte gUnk_08BB535C
	.4byte gUnk_08BB535C
	.global gUnk_08BB536C
gUnk_08BB536C:
	.4byte gUnk_08BB5364
	.4byte gUnk_08BB5364
	.global gUnk_08BB5374
gUnk_08BB5374:
	.4byte gUnk_08BB536C
	.4byte gUnk_08BB536C
	.global gUnk_08BB537C
gUnk_08BB537C:
	.4byte gUnk_08BB5374
	.4byte gUnk_08BB5374
	.global gUnk_08BB5384
gUnk_08BB5384:
	.4byte gUnk_08BB537C
	.4byte gUnk_08BB537C
	.global gUnk_08BB538C
gUnk_08BB538C:
	.4byte gUnk_08BB5384
	.4byte gUnk_08BB5384
	.global gUnk_08BB5394
gUnk_08BB5394:
	.4byte gUnk_08BB538C
	.4byte gUnk_08BB538C
	.global gUnk_08BB539C
gUnk_08BB539C:
	.4byte gUnk_08BB5394
	.4byte gUnk_08BB5394
	.global gUnk_08BB53A4
gUnk_08BB53A4:
	.4byte gUnk_08BB539C
	.4byte gUnk_08BB539C
	.global gUnk_08BB53AC
gUnk_08BB53AC:
	.4byte gUnk_08BB53A4
	.4byte gUnk_08BB53A4
	.global gUnk_08BB53B4
gUnk_08BB53B4:
	.4byte gUnk_08BB53AC
	.4byte gUnk_08BB53AC
	.global gUnk_08BB53BC
gUnk_08BB53BC:
	.4byte gUnk_08BB53B4
	.4byte gUnk_08BB53B4
	.global gUnk_08BB53C4
gUnk_08BB53C4:
	.4byte gUnk_08BB53BC
	.4byte gUnk_08BB53BC
	.global gUnk_08BB53CC
gUnk_08BB53CC:
	.4byte gUnk_08BB53C4
	.4byte gUnk_08BB53C4
	.global gUnk_08BB53D4
gUnk_08BB53D4:
	.4byte gUnk_08BB53CC
	.4byte gUnk_08BB53CC
	.global gUnk_08BB53DC
gUnk_08BB53DC:
	.4byte gUnk_08BB53D4
	.4byte gUnk_08BB53D4
	.global gUnk_08BB53E4
gUnk_08BB53E4:
	.4byte gUnk_08BB53DC
	.4byte gUnk_08BB53DC
	.global gUnk_08BB53EC
gUnk_08BB53EC:
	.4byte gUnk_08BB53E4
	.4byte gUnk_08BB53E4
	.global gUnk_08BB53F4
gUnk_08BB53F4:
	.4byte gUnk_08BB53EC
	.4byte gUnk_08BB53EC
	.global gUnk_08BB53FC
gUnk_08BB53FC:
	.4byte gUnk_08BB53F4
	.4byte gUnk_08BB53F4
	.global gUnk_08BB5404
gUnk_08BB5404:
	.4byte gUnk_08BB53FC
	.4byte gUnk_08BB53FC
	.global gUnk_08BB540C
gUnk_08BB540C:
	.4byte gUnk_08BB5404
	.4byte gUnk_08BB5404
	.global gUnk_08BB5414
gUnk_08BB5414:
	.4byte gUnk_08BB540C
	.4byte gUnk_08BB540C
	.global gUnk_08BB541C
gUnk_08BB541C:
	.4byte gUnk_08BB5414
	.4byte gUnk_08BB5414
	.global gUnk_08BB5424
gUnk_08BB5424:
	.4byte gUnk_08BB541C
	.4byte gUnk_08BB541C
	.global gUnk_08BB542C
gUnk_08BB542C:
	.4byte gUnk_08BB5424
	.4byte gUnk_08BB5424
	.global gUnk_08BB5434
gUnk_08BB5434:
	.4byte gUnk_08BB542C
	.4byte gUnk_08BB542C
	.global gUnk_08BB543C
gUnk_08BB543C:
	.4byte gUnk_08BB5434
	.4byte gUnk_08BB5434
	.global gUnk_08BB5444
gUnk_08BB5444:
	.4byte gUnk_08BB543C
	.4byte gUnk_08BB543C
	.global gUnk_08BB544C
gUnk_08BB544C:
	.4byte gUnk_08BB5444
	.4byte gUnk_08BB5444
	.global gUnk_08BB5454
gUnk_08BB5454:
	.4byte gUnk_08BB544C
	.4byte gUnk_08BB544C
	.global gUnk_08BB545C
gUnk_08BB545C:
	.4byte gUnk_08BB5454
	.4byte gUnk_08BB5454
	.global gUnk_08BB5464
gUnk_08BB5464:
	.4byte gUnk_08BB545C
	.4byte gUnk_08BB545C
	.global gUnk_08BB546C
gUnk_08BB546C:
	.4byte gUnk_08BB5464
	.4byte gUnk_08BB5464
	.global gUnk_08BB5474
gUnk_08BB5474:
	.4byte gUnk_08BB546C
	.4byte gUnk_08BB546C
	.global gUnk_08BB547C
gUnk_08BB547C:
	.4byte gUnk_08BB5474
	.4byte gUnk_08BB5474
	.global gUnk_08BB5484
gUnk_08BB5484:
	.4byte gUnk_08BB547C
	.4byte gUnk_08BB547C
	.global gUnk_08BB548C
gUnk_08BB548C:
	.4byte gUnk_08BB5484
	.4byte gUnk_08BB5484
	.global gUnk_08BB5494
gUnk_08BB5494:
	.4byte gUnk_08BB548C
	.4byte gUnk_08BB548C
	.global gUnk_08BB549C
gUnk_08BB549C:
	.4byte gUnk_08BB5494
	.4byte gUnk_08BB5494
	.global gUnk_08BB54A4
gUnk_08BB54A4:
	.4byte gUnk_08BB549C
	.4byte gUnk_08BB549C
	.global gUnk_08BB54AC
gUnk_08BB54AC:
	.4byte gUnk_08BB54A4
	.4byte gUnk_08BB54A4
	.global gUnk_08BB54B4
gUnk_08BB54B4:
	.4byte gUnk_08BB54AC
	.4byte gUnk_08BB54AC
	.global gUnk_08BB54BC
gUnk_08BB54BC:
	.4byte gUnk_08BB54B4
	.4byte gUnk_08BB54B4
	.global gUnk_08BB54C4
gUnk_08BB54C4:
	.4byte gUnk_08BB54BC
	.4byte gUnk_08BB54BC
	.global gUnk_08BB54CC
gUnk_08BB54CC:
	.4byte gUnk_08BB54C4
	.4byte gUnk_08BB54C4
	.global gUnk_08BB54D4
gUnk_08BB54D4:
	.4byte gUnk_08BB54CC
	.4byte gUnk_08BB54CC
	.global gUnk_08BB54DC
gUnk_08BB54DC:
	.4byte gUnk_08BB54D4
	.4byte gUnk_08BB54D4
	.global gUnk_08BB54E4
gUnk_08BB54E4:
	.4byte gUnk_08BB54DC
	.4byte gUnk_08BB54DC
	.global gUnk_08BB54EC
gUnk_08BB54EC:
	.4byte gUnk_08BB54E4
	.4byte gUnk_08BB54E4
	.global gUnk_08BB54F4
gUnk_08BB54F4:
	.4byte gUnk_08BB54EC
	.4byte gUnk_08BB54EC
	.global gUnk_08BB54FC
gUnk_08BB54FC:
	.4byte gUnk_08BB54F4
	.4byte gUnk_08BB54F4
	.global gUnk_08BB5504
gUnk_08BB5504:
	.4byte gUnk_08BB54FC
	.4byte gUnk_08BB54FC
	.global gUnk_08BB550C
gUnk_08BB550C:
	.4byte gUnk_08BB5504
	.4byte gUnk_08BB5504
	.global gUnk_08BB5514
gUnk_08BB5514:
	.4byte gUnk_08BB550C
	.4byte gUnk_08BB550C
	.global gUnk_08BB551C
gUnk_08BB551C:
	.4byte gUnk_08BB5514
	.4byte gUnk_08BB5514
	.global gUnk_08BB5524
gUnk_08BB5524:
	.4byte gUnk_08BB551C
	.4byte gUnk_08BB551C
	.global gUnk_08BB552C
gUnk_08BB552C:
	.4byte gUnk_08BB5524
	.4byte gUnk_08BB5524
	.global gUnk_08BB5534
gUnk_08BB5534:
	.4byte gUnk_08BB552C
	.4byte gUnk_08BB552C
	.global gUnk_08BB553C
gUnk_08BB553C:
	.4byte gUnk_08BB5534
	.4byte gUnk_08BB5534
	.global gUnk_08BB5544
gUnk_08BB5544:
	.4byte gUnk_08BB553C
	.4byte gUnk_08BB553C
	.global gUnk_08BB554C
gUnk_08BB554C:
	.4byte gUnk_08BB5544
	.4byte gUnk_08BB5544
	.global gUnk_08BB5554
gUnk_08BB5554:
	.4byte gUnk_08BB554C
	.4byte gUnk_08BB554C
	.global gUnk_08BB555C
gUnk_08BB555C:
	.4byte gUnk_08BB5554
	.4byte gUnk_08BB5554
	.global gUnk_08BB5564
gUnk_08BB5564:
	.4byte gUnk_08BB555C
	.4byte gUnk_08BB555C
	.global gUnk_08BB556C
gUnk_08BB556C:
	.4byte gUnk_08BB5564
	.4byte gUnk_08BB5564
	.global gUnk_08BB5574
gUnk_08BB5574:
	.4byte gUnk_08BB556C
	.4byte gUnk_08BB556C
	.global gUnk_08BB557C
gUnk_08BB557C:
	.4byte gUnk_08BB5574
	.4byte gUnk_08BB5574
	.global gUnk_08BB5584
gUnk_08BB5584:
	.4byte gUnk_08BB557C
	.4byte gUnk_08BB557C
	.global gUnk_08BB558C
gUnk_08BB558C:
	.4byte gUnk_08BB5584
	.4byte gUnk_08BB5584
	.global gUnk_08BB5594
gUnk_08BB5594:
	.4byte gUnk_08BB558C
	.4byte gUnk_08BB558C
	.global gUnk_08BB559C
gUnk_08BB559C:
	.4byte gUnk_08BB5594
	.4byte gUnk_08BB5594
	.global gUnk_08BB55A4
gUnk_08BB55A4:
	.4byte gUnk_08BB559C
	.4byte gUnk_08BB559C
	.global gUnk_08BB55AC
gUnk_08BB55AC:
	.4byte gUnk_08BB55A4
	.4byte gUnk_08BB55A4
	.global gUnk_08BB55B4
gUnk_08BB55B4:
	.4byte gUnk_08BB55AC
	.4byte gUnk_08BB55AC
	.global gUnk_08BB55BC
gUnk_08BB55BC:
	.4byte gUnk_08BB55B4
	.4byte gUnk_08BB55B4
	.global gUnk_08BB55C4
gUnk_08BB55C4:
	.4byte gUnk_08BB55BC
	.4byte gUnk_08BB55BC
	.global gUnk_08BB55CC
gUnk_08BB55CC:
	.4byte gUnk_08BB55C4
	.4byte gUnk_08BB55C4
	.global gUnk_08BB55D4
gUnk_08BB55D4:
	.4byte gUnk_08BB55CC
	.4byte gUnk_08BB55CC
	.global gUnk_08BB55DC
gUnk_08BB55DC:
	.4byte gUnk_08BB55D4
	.4byte gUnk_08BB55D4
	.global gUnk_08BB55E4
gUnk_08BB55E4:
	.4byte gUnk_08BB55DC
	.4byte gUnk_08BB55DC
	.global gUnk_08BB55EC
gUnk_08BB55EC:
	.4byte gUnk_08BB55E4
	.4byte gUnk_08BB55E4
	.global gUnk_08BB55F4
gUnk_08BB55F4:
	.4byte gUnk_08BB55EC
	.4byte gUnk_08BB55EC
	.global gUnk_08BB55FC
gUnk_08BB55FC:
	.4byte gUnk_08BB55F4
	.4byte gUnk_08BB55F4
	.global gUnk_08BB5604
gUnk_08BB5604:
	.4byte gUnk_08BB55FC
	.4byte gUnk_08BB55FC
	.global gUnk_08BB560C
gUnk_08BB560C:
	.4byte gUnk_08BB5604
	.4byte gUnk_08BB5604
	.global gUnk_08BB5614
gUnk_08BB5614:
	.4byte gUnk_08BB560C
	.4byte gUnk_08BB560C
	.global gUnk_08BB561C
gUnk_08BB561C:
	.4byte gUnk_08BB5614
	.4byte gUnk_08BB5614
	.global gUnk_08BB5624
gUnk_08BB5624:
	.4byte gUnk_08BB561C
	.4byte gUnk_08BB561C
	.global gUnk_08BB562C
gUnk_08BB562C:
	.4byte gUnk_08BB5624
	.4byte gUnk_08BB5624
	.global gUnk_08BB5634
gUnk_08BB5634:
	.4byte gUnk_08BB562C
	.4byte gUnk_08BB562C
	.global gUnk_08BB563C
gUnk_08BB563C:
	.4byte gUnk_08BB5634
	.4byte gUnk_08BB5634
	.global gUnk_08BB5644
gUnk_08BB5644:
	.4byte gUnk_08BB563C
	.4byte gUnk_08BB563C
	.global gUnk_08BB564C
gUnk_08BB564C:
	.4byte gUnk_08BB5644
	.4byte gUnk_08BB5644
	.global gUnk_08BB5654
gUnk_08BB5654:
	.4byte gUnk_08BB564C
	.4byte gUnk_08BB564C
	.global gUnk_08BB565C
gUnk_08BB565C:
	.4byte gUnk_08BB5654
	.4byte gUnk_08BB5654
	.global gUnk_08BB5664
gUnk_08BB5664:
	.4byte gUnk_08BB565C
	.4byte gUnk_08BB565C
	.global gUnk_08BB566C
gUnk_08BB566C:
	.4byte gUnk_08BB5664
	.4byte gUnk_08BB5664
	.global gUnk_08BB5674
gUnk_08BB5674:
	.4byte gUnk_08BB566C
	.4byte gUnk_08BB566C
	.global gUnk_08BB567C
gUnk_08BB567C:
	.4byte gUnk_08BB5674
	.4byte gUnk_08BB5674
	.global gUnk_08BB5684
gUnk_08BB5684:
	.4byte gUnk_08BB567C
	.4byte gUnk_08BB567C
	.global gUnk_08BB568C
gUnk_08BB568C:
	.4byte gUnk_08BB5684
	.4byte gUnk_08BB5684
	.global gUnk_08BB5694
gUnk_08BB5694:
	.4byte gUnk_08BB568C
	.4byte gUnk_08BB568C
	.4byte gUnk_08BB5694
	.4byte gUnk_08BB5694
	.global gUnk_08BB56A4
gUnk_08BB56A4:
	.byte 0x00, 0x00, 0x02, 0x00
	.global gUnk_08BB56A8
gUnk_08BB56A8:
	.byte 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB56AC
gUnk_08BB56AC:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global gUnk_08BB56B0
gUnk_08BB56B0:
	.byte 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB56B4
gUnk_08BB56B4:
	.byte 0x00, 0x00, 0x00, 0x00
	.global gUnk_08BB56B8
gUnk_08BB56B8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
