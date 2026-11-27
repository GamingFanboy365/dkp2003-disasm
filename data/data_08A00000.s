@ data/data_08A00000.s: ROM 0xA00000-0xB00000 (rom, VMA 0x08A00000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0xA00000, 0xDE8
	.4byte act_hud_map
	.incbin "baserom.gba", 0xA00DEC, 0x2F58
	.global gUnk_08A03D44
gUnk_08A03D44:
	.byte 0x00
	.global gUnk_08A03D45
gUnk_08A03D45:
	.incbin "baserom.gba", 0xA03D45, 0x367B
	.global gUnk_08A073C0
gUnk_08A073C0:
	.byte 0x00
	.global gUnk_08A073C1
gUnk_08A073C1:
	.incbin "baserom.gba", 0xA073C1, 0x31E9
	.global gUnk_08A0A5AA
gUnk_08A0A5AA:
	.byte 0x00
	.global gUnk_08A0A5AB
gUnk_08A0A5AB:
	.incbin "baserom.gba", 0xA0A5AB, 0x3EDC
	.global gUnk_08A0E487
gUnk_08A0E487:
	.byte 0x00
	.global gUnk_08A0E488
gUnk_08A0E488:
	.incbin "baserom.gba", 0xA0E488, 0x3BD8
	.global gUnk_08A12060
gUnk_08A12060:
	.byte 0x00
	.global gUnk_08A12061
gUnk_08A12061:
	.incbin "baserom.gba", 0xA12061, 0x49B4
	.global gUnk_08A16A15
gUnk_08A16A15:
	.byte 0x00
	.global gUnk_08A16A16
gUnk_08A16A16:
	.incbin "baserom.gba", 0xA16A16, 0x4BAA
	.global gUnk_08A1B5C0
gUnk_08A1B5C0:
	.byte 0x00
	.global gUnk_08A1B5C1
gUnk_08A1B5C1:
	.incbin "baserom.gba", 0xA1B5C1, 0x1C53
	.4byte sub_08020204
	.incbin "baserom.gba", 0xA1D218, 0x2C36
	.global gUnk_08A1FE4E
gUnk_08A1FE4E:
	.byte 0x00
	.global gUnk_08A1FE4F
gUnk_08A1FE4F:
	.incbin "baserom.gba", 0xA1FE4F, 0x34A9
	.global gUnk_08A232F8
gUnk_08A232F8:
	.byte 0x00
	.global gUnk_08A232F9
gUnk_08A232F9:
	.incbin "baserom.gba", 0xA232F9, 0x17AF
	.4byte sub_08020204
	.incbin "baserom.gba", 0xA24AAC, 0x2A28
	.global gUnk_08A274D4
gUnk_08A274D4:
	.byte 0x00
	.global gUnk_08A274D5
gUnk_08A274D5:
	.incbin "baserom.gba", 0xA274D5, 0x1F83
	.global gUnk_08A29458
gUnk_08A29458:
	.byte 0x00
	.global gUnk_08A29459
gUnk_08A29459:
	.incbin "baserom.gba", 0xA29459, 0x3FB1
	.global gUnk_08A2D40A
gUnk_08A2D40A:
	.byte 0x00
	.global gUnk_08A2D40B
gUnk_08A2D40B:
	.incbin "baserom.gba", 0xA2D40B, 0x2491
	.global gUnk_08A2F89C
gUnk_08A2F89C:
	.byte 0x00
	.global gUnk_08A2F89D
gUnk_08A2F89D:
	.incbin "baserom.gba", 0xA2F89D, 0x3AD3
	.global gUnk_08A33370
gUnk_08A33370:
	.byte 0x00
	.global gUnk_08A33371
gUnk_08A33371:
	.incbin "baserom.gba", 0xA33371, 0x3274
	.global gUnk_08A365E5
gUnk_08A365E5:
	.byte 0x00
	.global gUnk_08A365E6
gUnk_08A365E6:
	.incbin "baserom.gba", 0xA365E6, 0x3A9A
	.global gUnk_08A3A080
gUnk_08A3A080:
	.byte 0x00
	.global gUnk_08A3A081
gUnk_08A3A081:
	.incbin "baserom.gba", 0xA3A081, 0x369C
	.global gUnk_08A3D71D
gUnk_08A3D71D:
	.byte 0x00
	.global gUnk_08A3D71E
gUnk_08A3D71E:
	.incbin "baserom.gba", 0xA3D71E, 0x1685
	.global gUnk_08A3EDA3
gUnk_08A3EDA3:
	.byte 0x00
	.global gUnk_08A3EDA4
gUnk_08A3EDA4:
	.incbin "baserom.gba", 0xA3EDA4, 0x12E8
	.global gUnk_08A4008C
gUnk_08A4008C:
	.incbin "baserom.gba", 0xA4008C, 0x1477
	.global gUnk_08A41503
gUnk_08A41503:
	.byte 0x00
	.global gUnk_08A41504
gUnk_08A41504:
	.incbin "baserom.gba", 0xA41504, 0x36E6
	.global gUnk_08A44BEA
gUnk_08A44BEA:
	.byte 0x00
	.global gUnk_08A44BEB
gUnk_08A44BEB:
	.incbin "baserom.gba", 0xA44BEB, 0x41D7
	.global gUnk_08A48DC2
gUnk_08A48DC2:
	.byte 0x00
	.global gUnk_08A48DC3
gUnk_08A48DC3:
	.incbin "baserom.gba", 0xA48DC3, 0x348D
	.global gUnk_08A4C250
gUnk_08A4C250:
	.byte 0x00
	.global gUnk_08A4C251
gUnk_08A4C251:
	.incbin "baserom.gba", 0xA4C251, 0x561F
	.global gUnk_08A51870
gUnk_08A51870:
	.byte 0x00
	.global gUnk_08A51871
gUnk_08A51871:
	.incbin "baserom.gba", 0xA51871, 0x2330
	.global gUnk_08A53BA1
gUnk_08A53BA1:
	.byte 0x00
	.global gUnk_08A53BA2
gUnk_08A53BA2:
	.incbin "baserom.gba", 0xA53BA2, 0x42E5
	.global gUnk_08A57E87
gUnk_08A57E87:
	.byte 0x00
	.global gUnk_08A57E88
gUnk_08A57E88:
	.incbin "baserom.gba", 0xA57E88, 0x3D51
	.global gUnk_08A5BBD9
gUnk_08A5BBD9:
	.byte 0x00
	.global gUnk_08A5BBDA
gUnk_08A5BBDA:
	.incbin "baserom.gba", 0xA5BBDA, 0x1A29
	.global gUnk_08A5D603
gUnk_08A5D603:
	.byte 0x00
	.global gUnk_08A5D604
gUnk_08A5D604:
	.incbin "baserom.gba", 0xA5D604, 0x18DF
	.global gUnk_08A5EEE3
gUnk_08A5EEE3:
	.byte 0x00
	.global gUnk_08A5EEE4
gUnk_08A5EEE4:
	.incbin "baserom.gba", 0xA5EEE4, 0x2DCD
	.global gUnk_08A61CB1
gUnk_08A61CB1:
	.byte 0x00
	.global gUnk_08A61CB2
gUnk_08A61CB2:
	.incbin "baserom.gba", 0xA61CB2, 0x2D90
	.global gUnk_08A64A42
gUnk_08A64A42:
	.byte 0x00
	.global gUnk_08A64A43
gUnk_08A64A43:
	.incbin "baserom.gba", 0xA64A43, 0x2E16
	.global gUnk_08A67859
gUnk_08A67859:
	.byte 0x00
	.global gUnk_08A6785A
gUnk_08A6785A:
	.incbin "baserom.gba", 0xA6785A, 0x2D94
	.global gUnk_08A6A5EE
gUnk_08A6A5EE:
	.byte 0x00
	.global gUnk_08A6A5EF
gUnk_08A6A5EF:
	.incbin "baserom.gba", 0xA6A5EF, 0x4849
	.global gUnk_08A6EE38
gUnk_08A6EE38:
	.byte 0x00
	.global gUnk_08A6EE39
gUnk_08A6EE39:
	.incbin "baserom.gba", 0xA6EE39, 0x358F
	.global gUnk_08A723C8
gUnk_08A723C8:
	.byte 0x00
	.global gUnk_08A723C9
gUnk_08A723C9:
	.incbin "baserom.gba", 0xA723C9, 0x33E2
	.global gUnk_08A757AB
gUnk_08A757AB:
	.byte 0x00
	.global gUnk_08A757AC
gUnk_08A757AC:
	.incbin "baserom.gba", 0xA757AC, 0x2CC0
	.global gUnk_08A7846C
gUnk_08A7846C:
	.byte 0x00
	.global gUnk_08A7846D
gUnk_08A7846D:
	.incbin "baserom.gba", 0xA7846D, 0x3ECC
	.global gUnk_08A7C339
gUnk_08A7C339:
	.byte 0x00
	.global gUnk_08A7C33A
gUnk_08A7C33A:
	.incbin "baserom.gba", 0xA7C33A, 0x1600
	.global gUnk_08A7D93A
gUnk_08A7D93A:
	.byte 0x00
	.global gUnk_08A7D93B
gUnk_08A7D93B:
	.incbin "baserom.gba", 0xA7D93B, 0x16B3
	.global gUnk_08A7EFEE
gUnk_08A7EFEE:
	.incbin "baserom.gba", 0xA7EFEE, 0x3B23
	.global gUnk_08A82B11
gUnk_08A82B11:
	.incbin "baserom.gba", 0xA82B11, 0x35CB
	.4byte init_hud_finish
	.incbin "baserom.gba", 0xA860E0, 0x2E3B
	.global gUnk_08A88F1B
gUnk_08A88F1B:
	.byte 0x00
	.global gUnk_08A88F1C
gUnk_08A88F1C:
	.incbin "baserom.gba", 0xA88F1C, 0x1D1C
	.global gUnk_08A8AC38
gUnk_08A8AC38:
	.byte 0x00
	.global gUnk_08A8AC39
gUnk_08A8AC39:
	.incbin "baserom.gba", 0xA8AC39, 0x1866
	.global gUnk_08A8C49F
gUnk_08A8C49F:
	.byte 0x00
	.global gUnk_08A8C4A0
gUnk_08A8C4A0:
	.incbin "baserom.gba", 0xA8C4A0, 0x3B9
	.global gUnk_08A8C859
gUnk_08A8C859:
	.byte 0x00
	.global gUnk_08A8C85A
gUnk_08A8C85A:
	.incbin "baserom.gba", 0xA8C85A, 0x6A6
	.global gUnk_08A8CF00
gUnk_08A8CF00:
	.byte 0x00
	.global gUnk_08A8CF01
gUnk_08A8CF01:
	.incbin "baserom.gba", 0xA8CF01, 0xFE2
	.global gUnk_08A8DEE3
gUnk_08A8DEE3:
	.byte 0x00
	.global gUnk_08A8DEE4
gUnk_08A8DEE4:
	.incbin "baserom.gba", 0xA8DEE4, 0x5C0C
	.global gUnk_08A93AF0
gUnk_08A93AF0:
	.byte 0x00
	.global gUnk_08A93AF1
gUnk_08A93AF1:
	.incbin "baserom.gba", 0xA93AF1, 0x1823
	.global gUnk_08A95314
gUnk_08A95314:
	.byte 0x00
	.global gUnk_08A95315
gUnk_08A95315:
	.incbin "baserom.gba", 0xA95315, 0x27BF
	.global gUnk_08A97AD4
gUnk_08A97AD4:
	.byte 0x00
	.global gUnk_08A97AD5
gUnk_08A97AD5:
	.incbin "baserom.gba", 0xA97AD5, 0x26A0
	.global gUnk_08A9A175
gUnk_08A9A175:
	.byte 0x00
	.global gUnk_08A9A176
gUnk_08A9A176:
	.incbin "baserom.gba", 0xA9A176, 0x3200
	.global gUnk_08A9D376
gUnk_08A9D376:
	.byte 0x00
	.global gUnk_08A9D377
gUnk_08A9D377:
	.incbin "baserom.gba", 0xA9D377, 0x2A00
	.global gUnk_08A9FD77
gUnk_08A9FD77:
	.byte 0xF1
	.global gUnk_08A9FD78
gUnk_08A9FD78:
	.incbin "baserom.gba", 0xA9FD78, 0x2480
	.global gUnk_08AA21F8
gUnk_08AA21F8:
	.byte 0x00
	.global gUnk_08AA21F9
gUnk_08AA21F9:
	.incbin "baserom.gba", 0xAA21F9, 0x5B80
	.global gUnk_08AA7D79
gUnk_08AA7D79:
	.byte 0x00
	.global gUnk_08AA7D7A
gUnk_08AA7D7A:
	.incbin "baserom.gba", 0xAA7D7A, 0x3DA0
	.global gUnk_08AABB1A
gUnk_08AABB1A:
	.byte 0x00
	.global gUnk_08AABB1B
gUnk_08AABB1B:
	.incbin "baserom.gba", 0xAABB1B, 0x19F9
	.global gUnk_08AAD514
gUnk_08AAD514:
	.byte 0x00
	.global gUnk_08AAD515
gUnk_08AAD515:
	.incbin "baserom.gba", 0xAAD515, 0x1E40
	.global gUnk_08AAF355
gUnk_08AAF355:
	.byte 0x00
	.global gUnk_08AAF356
gUnk_08AAF356:
	.incbin "baserom.gba", 0xAAF356, 0x1E56
	.global gUnk_08AB11AC
gUnk_08AB11AC:
	.byte 0x00
	.global gUnk_08AB11AD
gUnk_08AB11AD:
	.incbin "baserom.gba", 0xAB11AD, 0x18F1
	.global gUnk_08AB2A9E
gUnk_08AB2A9E:
	.byte 0x00
	.global gUnk_08AB2A9F
gUnk_08AB2A9F:
	.incbin "baserom.gba", 0xAB2A9F, 0x14D3
	.global gUnk_08AB3F72
gUnk_08AB3F72:
	.byte 0x00
	.global gUnk_08AB3F73
gUnk_08AB3F73:
	.incbin "baserom.gba", 0xAB3F73, 0x118D
	.global gUnk_08AB5100
gUnk_08AB5100:
	.byte 0x00
	.global gUnk_08AB5101
gUnk_08AB5101:
	.incbin "baserom.gba", 0xAB5101, 0xE90
	.global gUnk_08AB5F91
gUnk_08AB5F91:
	.byte 0x00
	.global gUnk_08AB5F92
gUnk_08AB5F92:
	.incbin "baserom.gba", 0xAB5F92, 0xB3C
	.global gUnk_08AB6ACE
gUnk_08AB6ACE:
	.byte 0x00
	.global gUnk_08AB6ACF
gUnk_08AB6ACF:
	.incbin "baserom.gba", 0xAB6ACF, 0x63E
	.global gUnk_08AB710D
gUnk_08AB710D:
	.byte 0x00
	.global gUnk_08AB710E
gUnk_08AB710E:
	.incbin "baserom.gba", 0xAB710E, 0x51A
	.global gUnk_08AB7628
gUnk_08AB7628:
	.byte 0x00
	.global gUnk_08AB7629
gUnk_08AB7629:
	.incbin "baserom.gba", 0xAB7629, 0x648
	.global gUnk_08AB7C71
gUnk_08AB7C71:
	.byte 0x00
	.global gUnk_08AB7C72
gUnk_08AB7C72:
	.incbin "baserom.gba", 0xAB7C72, 0x1E32
	.global gUnk_08AB9AA4
gUnk_08AB9AA4:
	.byte 0x00
	.global gUnk_08AB9AA5
gUnk_08AB9AA5:
	.incbin "baserom.gba", 0xAB9AA5, 0x2317
	.4byte gUnk_08050B08
	.incbin "baserom.gba", 0xABBDC0, 0x109E
	.global gUnk_08ABCE5E
gUnk_08ABCE5E:
	.byte 0x00
	.global gUnk_08ABCE5F
gUnk_08ABCE5F:
	.incbin "baserom.gba", 0xABCE5F, 0x24F1
	.global gUnk_08ABF350
gUnk_08ABF350:
	.byte 0x00
	.global gUnk_08ABF351
gUnk_08ABF351:
	.incbin "baserom.gba", 0xABF351, 0x9DA
	.global gUnk_08ABFD2B
gUnk_08ABFD2B:
	.byte 0x00
	.global gUnk_08ABFD2C
gUnk_08ABFD2C:
	.incbin "baserom.gba", 0xABFD2C, 0x96E
	.global gUnk_08AC069A
gUnk_08AC069A:
	.byte 0x00
	.global gUnk_08AC069B
gUnk_08AC069B:
	.incbin "baserom.gba", 0xAC069B, 0x1D5F
	.global gUnk_08AC23FA
gUnk_08AC23FA:
	.byte 0x00
	.global gUnk_08AC23FB
gUnk_08AC23FB:
	.incbin "baserom.gba", 0xAC23FB, 0x2DF
	.global gUnk_08AC26DA
gUnk_08AC26DA:
	.byte 0x00
	.global gUnk_08AC26DB
gUnk_08AC26DB:
	.incbin "baserom.gba", 0xAC26DB, 0x10C
	.global gUnk_08AC27E7
gUnk_08AC27E7:
	.byte 0x00
	.global gUnk_08AC27E8
gUnk_08AC27E8:
	.incbin "baserom.gba", 0xAC27E8, 0x21F
	.global gUnk_08AC2A07
gUnk_08AC2A07:
	.incbin "baserom.gba", 0xAC2A07, 0x2FDF
	.global gUnk_08AC59E6
gUnk_08AC59E6:
	.incbin "baserom.gba", 0xAC59E6, 0xBA2
	.4byte gUnk_08050C0C
	.incbin "baserom.gba", 0xAC658C, 0x5BE
	.global gUnk_08AC6B4A
gUnk_08AC6B4A:
	.byte 0x00
	.global gUnk_08AC6B4B
gUnk_08AC6B4B:
	.incbin "baserom.gba", 0xAC6B4B, 0x63F5
	.global gUnk_08ACCF40
gUnk_08ACCF40:
	.byte 0x01
	.global gUnk_08ACCF41
gUnk_08ACCF41:
	.incbin "baserom.gba", 0xACCF41, 0x1019
	.global gUnk_08ACDF5A
gUnk_08ACDF5A:
	.byte 0xFE
	.global gUnk_08ACDF5B
gUnk_08ACDF5B:
	.incbin "baserom.gba", 0xACDF5B, 0x274E
	.global gUnk_08AD06A9
gUnk_08AD06A9:
	.byte 0x00
	.global gUnk_08AD06AA
gUnk_08AD06AA:
	.incbin "baserom.gba", 0xAD06AA, 0x2E8E
	.global gUnk_08AD3538
gUnk_08AD3538:
	.byte 0x00
	.global gUnk_08AD3539
gUnk_08AD3539:
	.incbin "baserom.gba", 0xAD3539, 0x147A
	.global gUnk_08AD49B3
gUnk_08AD49B3:
	.byte 0x02
	.global gUnk_08AD49B4
gUnk_08AD49B4:
	.incbin "baserom.gba", 0xAD49B4, 0x3640
	.global gUnk_08AD7FF4
gUnk_08AD7FF4:
	.byte 0x00
	.global gUnk_08AD7FF5
gUnk_08AD7FF5:
	.incbin "baserom.gba", 0xAD7FF5, 0x4D6
	.global gUnk_08AD84CB
gUnk_08AD84CB:
	.byte 0x00
	.global gUnk_08AD84CC
gUnk_08AD84CC:
	.incbin "baserom.gba", 0xAD84CC, 0x671
	.global gUnk_08AD8B3D
gUnk_08AD8B3D:
	.byte 0x00
	.global gUnk_08AD8B3E
gUnk_08AD8B3E:
	.incbin "baserom.gba", 0xAD8B3E, 0xB84
	.global gUnk_08AD96C2
gUnk_08AD96C2:
	.byte 0x00
	.global gUnk_08AD96C3
gUnk_08AD96C3:
	.incbin "baserom.gba", 0xAD96C3, 0x3A40
	.global gUnk_08ADD103
gUnk_08ADD103:
	.byte 0x00
	.global gUnk_08ADD104
gUnk_08ADD104:
	.incbin "baserom.gba", 0xADD104, 0x482E
	.global gUnk_08AE1932
gUnk_08AE1932:
	.byte 0x00
	.global gUnk_08AE1933
gUnk_08AE1933:
	.incbin "baserom.gba", 0xAE1933, 0x6767
	.global gUnk_08AE809A
gUnk_08AE809A:
	.byte 0x00
	.global gUnk_08AE809B
gUnk_08AE809B:
	.incbin "baserom.gba", 0xAE809B, 0x5B80
	.global gUnk_08AEDC1B
gUnk_08AEDC1B:
	.byte 0x00
	.global gUnk_08AEDC1C
gUnk_08AEDC1C:
	.incbin "baserom.gba", 0xAEDC1C, 0x259
	.global gUnk_08AEDE75
gUnk_08AEDE75:
	.byte 0x00
	.global gUnk_08AEDE76
gUnk_08AEDE76:
	.incbin "baserom.gba", 0xAEDE76, 0x1DED
	.global gUnk_08AEFC63
gUnk_08AEFC63:
	.byte 0x00
	.global gUnk_08AEFC64
gUnk_08AEFC64:
	.incbin "baserom.gba", 0xAEFC64, 0xDA7
	.global gUnk_08AF0A0B
gUnk_08AF0A0B:
	.byte 0x00
	.global gUnk_08AF0A0C
gUnk_08AF0A0C:
	.incbin "baserom.gba", 0xAF0A0C, 0xD38
	.global gUnk_08AF1744
gUnk_08AF1744:
	.byte 0x00
	.global gUnk_08AF1745
gUnk_08AF1745:
	.incbin "baserom.gba", 0xAF1745, 0x49A
	.global gUnk_08AF1BDF
gUnk_08AF1BDF:
	.byte 0x00
	.global gUnk_08AF1BE0
gUnk_08AF1BE0:
	.incbin "baserom.gba", 0xAF1BE0, 0x51F
	.global gUnk_08AF20FF
gUnk_08AF20FF:
	.byte 0x00
	.global gUnk_08AF2100
gUnk_08AF2100:
	.incbin "baserom.gba", 0xAF2100, 0x14A9
	.global gUnk_08AF35A9
gUnk_08AF35A9:
	.byte 0x00
	.global gUnk_08AF35AA
gUnk_08AF35AA:
	.incbin "baserom.gba", 0xAF35AA, 0x82E6
	.global gUnk_08AFB890
gUnk_08AFB890:
	.byte 0x00
	.global gUnk_08AFB891
gUnk_08AFB891:
	.incbin "baserom.gba", 0xAFB891, 0x3965
	.global gUnk_08AFF1F6
gUnk_08AFF1F6:
	.byte 0x00
	.global gUnk_08AFF1F7
gUnk_08AFF1F7:
	.incbin "baserom.gba", 0xAFF1F7, 0xE09
