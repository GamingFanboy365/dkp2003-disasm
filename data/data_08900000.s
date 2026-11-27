@ data/data_08900000.s: ROM 0x900000-0xA00000 (rom, VMA 0x08900000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x900000, 0x80
	.global gUnk_08900080
gUnk_08900080:
	.incbin "baserom.gba", 0x900080, 0x1F97
	.global gUnk_08902017
gUnk_08902017:
	.byte 0x00
	.global gUnk_08902018
gUnk_08902018:
	.incbin "baserom.gba", 0x902018, 0x33BD
	.global gUnk_089053D5
gUnk_089053D5:
	.byte 0x00
	.global gUnk_089053D6
gUnk_089053D6:
	.incbin "baserom.gba", 0x9053D6, 0x1BFA
	.global gUnk_08906FD0
gUnk_08906FD0:
	.byte 0x00
	.global gUnk_08906FD1
gUnk_08906FD1:
	.incbin "baserom.gba", 0x906FD1, 0x14FF
	.global gUnk_089084D0
gUnk_089084D0:
	.byte 0x00
	.global gUnk_089084D1
gUnk_089084D1:
	.incbin "baserom.gba", 0x9084D1, 0x3777
	.global gUnk_0890BC48
gUnk_0890BC48:
	.byte 0x00
	.global gUnk_0890BC49
gUnk_0890BC49:
	.incbin "baserom.gba", 0x90BC49, 0x2632
	.global gUnk_0890E27B
gUnk_0890E27B:
	.byte 0x00
	.global gUnk_0890E27C
gUnk_0890E27C:
	.incbin "baserom.gba", 0x90E27C, 0x2BAE
	.global gUnk_08910E2A
gUnk_08910E2A:
	.byte 0x00
	.global gUnk_08910E2B
gUnk_08910E2B:
	.incbin "baserom.gba", 0x910E2B, 0x3DF6
	.global gUnk_08914C21
gUnk_08914C21:
	.byte 0x00
	.global gUnk_08914C22
gUnk_08914C22:
	.incbin "baserom.gba", 0x914C22, 0x3746
	.global gUnk_08918368
gUnk_08918368:
	.byte 0x00
	.global gUnk_08918369
gUnk_08918369:
	.incbin "baserom.gba", 0x918369, 0x46FC
	.global gUnk_0891CA65
gUnk_0891CA65:
	.byte 0x00
	.global gUnk_0891CA66
gUnk_0891CA66:
	.incbin "baserom.gba", 0x91CA66, 0x26ED
	.global gUnk_0891F153
gUnk_0891F153:
	.byte 0x00
	.global gUnk_0891F154
gUnk_0891F154:
	.incbin "baserom.gba", 0x91F154, 0x2C28
	.global gUnk_08921D7C
gUnk_08921D7C:
	.byte 0x00
	.global gUnk_08921D7D
gUnk_08921D7D:
	.incbin "baserom.gba", 0x921D7D, 0xADB
	.4byte sub_080000FC
	.incbin "baserom.gba", 0x92285C, 0x1465
	.global gUnk_08923CC1
gUnk_08923CC1:
	.byte 0x00
	.global gUnk_08923CC2
gUnk_08923CC2:
	.incbin "baserom.gba", 0x923CC2, 0x3069
	.global gUnk_08926D2B
gUnk_08926D2B:
	.byte 0x00
	.global gUnk_08926D2C
gUnk_08926D2C:
	.incbin "baserom.gba", 0x926D2C, 0x21AF
	.global gUnk_08928EDB
gUnk_08928EDB:
	.byte 0x00
	.global gUnk_08928EDC
gUnk_08928EDC:
	.incbin "baserom.gba", 0x928EDC, 0x3107
	.global gUnk_0892BFE3
gUnk_0892BFE3:
	.byte 0x00
	.global gUnk_0892BFE4
gUnk_0892BFE4:
	.incbin "baserom.gba", 0x92BFE4, 0x2CF2
	.global gUnk_0892ECD6
gUnk_0892ECD6:
	.byte 0x00
	.global gUnk_0892ECD7
gUnk_0892ECD7:
	.incbin "baserom.gba", 0x92ECD7, 0x1B85
	.4byte gUnk_0804FEFC
	.incbin "baserom.gba", 0x930860, 0x1B7D
	.global gUnk_089323DD
gUnk_089323DD:
	.byte 0x00
	.global gUnk_089323DE
gUnk_089323DE:
	.incbin "baserom.gba", 0x9323DE, 0x20D0
	.global gUnk_089344AE
gUnk_089344AE:
	.byte 0x00
	.global gUnk_089344AF
gUnk_089344AF:
	.incbin "baserom.gba", 0x9344AF, 0x34E1
	.global gUnk_08937990
gUnk_08937990:
	.byte 0x00
	.global gUnk_08937991
gUnk_08937991:
	.incbin "baserom.gba", 0x937991, 0x1648
	.global gUnk_08938FD9
gUnk_08938FD9:
	.byte 0x00
	.global gUnk_08938FDA
gUnk_08938FDA:
	.incbin "baserom.gba", 0x938FDA, 0x26A2
	.global gUnk_0893B67C
gUnk_0893B67C:
	.byte 0x00
	.global gUnk_0893B67D
gUnk_0893B67D:
	.incbin "baserom.gba", 0x93B67D, 0x299F
	.4byte sub_080200F8
	.incbin "baserom.gba", 0x93E020, 0xF52
	.global gUnk_0893EF72
gUnk_0893EF72:
	.byte 0x00
	.global gUnk_0893EF73
gUnk_0893EF73:
	.incbin "baserom.gba", 0x93EF73, 0x28AE
	.global gUnk_08941821
gUnk_08941821:
	.byte 0x00
	.global gUnk_08941822
gUnk_08941822:
	.incbin "baserom.gba", 0x941822, 0x1C2A
	.global gUnk_0894344C
gUnk_0894344C:
	.byte 0x00
	.global gUnk_0894344D
gUnk_0894344D:
	.incbin "baserom.gba", 0x94344D, 0x317F
	.global gUnk_089465CC
gUnk_089465CC:
	.byte 0x00
	.global gUnk_089465CD
gUnk_089465CD:
	.incbin "baserom.gba", 0x9465CD, 0x203C
	.global gUnk_08948609
gUnk_08948609:
	.byte 0x00
	.global gUnk_0894860A
gUnk_0894860A:
	.incbin "baserom.gba", 0x94860A, 0x27D5
	.global gUnk_0894ADDF
gUnk_0894ADDF:
	.byte 0x00
	.global gUnk_0894ADE0
gUnk_0894ADE0:
	.incbin "baserom.gba", 0x94ADE0, 0x233B
	.global gUnk_0894D11B
gUnk_0894D11B:
	.byte 0x00
	.global gUnk_0894D11C
gUnk_0894D11C:
	.incbin "baserom.gba", 0x94D11C, 0x1CF8
	.global gUnk_0894EE14
gUnk_0894EE14:
	.byte 0x00
	.global gUnk_0894EE15
gUnk_0894EE15:
	.incbin "baserom.gba", 0x94EE15, 0x282A
	.global gUnk_0895163F
gUnk_0895163F:
	.byte 0x00
	.global gUnk_08951640
gUnk_08951640:
	.incbin "baserom.gba", 0x951640, 0x2E4F
	.global gUnk_0895448F
gUnk_0895448F:
	.byte 0x00
	.global gUnk_08954490
gUnk_08954490:
	.incbin "baserom.gba", 0x954490, 0x2DC4
	.global gUnk_08957254
gUnk_08957254:
	.byte 0x00
	.global gUnk_08957255
gUnk_08957255:
	.incbin "baserom.gba", 0x957255, 0x22D8
	.global gUnk_0895952D
gUnk_0895952D:
	.incbin "baserom.gba", 0x95952D, 0x2604
	.global gUnk_0895BB31
gUnk_0895BB31:
	.incbin "baserom.gba", 0x95BB31, 0x28BB
	.global gUnk_0895E3EC
gUnk_0895E3EC:
	.byte 0x00
	.global gUnk_0895E3ED
gUnk_0895E3ED:
	.incbin "baserom.gba", 0x95E3ED, 0x25C4
	.global gUnk_089609B1
gUnk_089609B1:
	.byte 0x00
	.global gUnk_089609B2
gUnk_089609B2:
	.incbin "baserom.gba", 0x9609B2, 0x2184
	.global gUnk_08962B36
gUnk_08962B36:
	.byte 0x00
	.global gUnk_08962B37
gUnk_08962B37:
	.incbin "baserom.gba", 0x962B37, 0x2817
	.global gUnk_0896534E
gUnk_0896534E:
	.byte 0x00
	.global gUnk_0896534F
gUnk_0896534F:
	.incbin "baserom.gba", 0x96534F, 0x2CC6
	.global gUnk_08968015
gUnk_08968015:
	.byte 0x00
	.global gUnk_08968016
gUnk_08968016:
	.incbin "baserom.gba", 0x968016, 0x1DE6
	.global gUnk_08969DFC
gUnk_08969DFC:
	.byte 0x00
	.global gUnk_08969DFD
gUnk_08969DFD:
	.incbin "baserom.gba", 0x969DFD, 0x1C05
	.global gUnk_0896BA02
gUnk_0896BA02:
	.byte 0x00
	.global gUnk_0896BA03
gUnk_0896BA03:
	.incbin "baserom.gba", 0x96BA03, 0x17F9
	.global gUnk_0896D1FC
gUnk_0896D1FC:
	.byte 0x00
	.global gUnk_0896D1FD
gUnk_0896D1FD:
	.incbin "baserom.gba", 0x96D1FD, 0x21EA
	.global gUnk_0896F3E7
gUnk_0896F3E7:
	.byte 0x00
	.global gUnk_0896F3E8
gUnk_0896F3E8:
	.incbin "baserom.gba", 0x96F3E8, 0x19F0
	.4byte gUnk_0804FFF8
	.incbin "baserom.gba", 0x970DDC, 0x270
	.global gUnk_0897104C
gUnk_0897104C:
	.byte 0x00
	.global gUnk_0897104D
gUnk_0897104D:
	.incbin "baserom.gba", 0x97104D, 0x2ED1
	.global gUnk_08973F1E
gUnk_08973F1E:
	.byte 0x00
	.global gUnk_08973F1F
gUnk_08973F1F:
	.incbin "baserom.gba", 0x973F1F, 0x1C45
	.global gUnk_08975B64
gUnk_08975B64:
	.byte 0x00
	.global gUnk_08975B65
gUnk_08975B65:
	.incbin "baserom.gba", 0x975B65, 0x183D
	.global gUnk_089773A2
gUnk_089773A2:
	.byte 0x00
	.global gUnk_089773A3
gUnk_089773A3:
	.incbin "baserom.gba", 0x9773A3, 0x4588
	.global gUnk_0897B92B
gUnk_0897B92B:
	.byte 0x00
	.global gUnk_0897B92C
gUnk_0897B92C:
	.incbin "baserom.gba", 0x97B92C, 0x273E
	.global gUnk_0897E06A
gUnk_0897E06A:
	.byte 0x00
	.global gUnk_0897E06B
gUnk_0897E06B:
	.incbin "baserom.gba", 0x97E06B, 0x2015
	.global gUnk_08980080
gUnk_08980080:
	.incbin "baserom.gba", 0x980080, 0x8B8
	.global gUnk_08980938
gUnk_08980938:
	.incbin "baserom.gba", 0x980938, 0x1BB
	.global gUnk_08980AF3
gUnk_08980AF3:
	.byte 0x00
	.global gUnk_08980AF4
gUnk_08980AF4:
	.incbin "baserom.gba", 0x980AF4, 0x1E9E
	.global gUnk_08982992
gUnk_08982992:
	.byte 0x00
	.global gUnk_08982993
gUnk_08982993:
	.incbin "baserom.gba", 0x982993, 0x23F3
	.global gUnk_08984D86
gUnk_08984D86:
	.byte 0x00
	.global gUnk_08984D87
gUnk_08984D87:
	.incbin "baserom.gba", 0x984D87, 0x2E00
	.global gUnk_08987B87
gUnk_08987B87:
	.byte 0x00
	.global gUnk_08987B88
gUnk_08987B88:
	.incbin "baserom.gba", 0x987B88, 0x1D71
	.global gUnk_089898F9
gUnk_089898F9:
	.incbin "baserom.gba", 0x9898F9, 0x24C0
	.global gUnk_0898BDB9
gUnk_0898BDB9:
	.incbin "baserom.gba", 0x98BDB9, 0x1D70
	.global gUnk_0898DB29
gUnk_0898DB29:
	.byte 0x00
	.global gUnk_0898DB2A
gUnk_0898DB2A:
	.incbin "baserom.gba", 0x98DB2A, 0x16A
	.4byte act_hud_lapfinal
	.incbin "baserom.gba", 0x98DC98, 0x15BA
	.global gUnk_0898F252
gUnk_0898F252:
	.byte 0x00
	.global gUnk_0898F253
gUnk_0898F253:
	.incbin "baserom.gba", 0x98F253, 0x2110
	.global gUnk_08991363
gUnk_08991363:
	.byte 0x00
	.global gUnk_08991364
gUnk_08991364:
	.incbin "baserom.gba", 0x991364, 0x1C9E
	.global gUnk_08993002
gUnk_08993002:
	.byte 0x00
	.global gUnk_08993003
gUnk_08993003:
	.incbin "baserom.gba", 0x993003, 0x5D9
	.4byte gUnk_0804F8F8
	.incbin "baserom.gba", 0x9935E0, 0x20F8
	.global gUnk_089956D8
gUnk_089956D8:
	.byte 0x00
	.global gUnk_089956D9
gUnk_089956D9:
	.incbin "baserom.gba", 0x9956D9, 0x1D08
	.global gUnk_089973E1
gUnk_089973E1:
	.byte 0x00
	.global gUnk_089973E2
gUnk_089973E2:
	.incbin "baserom.gba", 0x9973E2, 0x279E
	.global gUnk_08999B80
gUnk_08999B80:
	.byte 0x00
	.global gUnk_08999B81
gUnk_08999B81:
	.incbin "baserom.gba", 0x999B81, 0x425F
	.global gUnk_0899DDE0
gUnk_0899DDE0:
	.byte 0x00
	.global gUnk_0899DDE1
gUnk_0899DDE1:
	.incbin "baserom.gba", 0x99DDE1, 0x27C0
	.global gUnk_089A05A1
gUnk_089A05A1:
	.byte 0x00
	.global gUnk_089A05A2
gUnk_089A05A2:
	.incbin "baserom.gba", 0x9A05A2, 0x2FB7
	.global gUnk_089A3559
gUnk_089A3559:
	.byte 0x00
	.global gUnk_089A355A
gUnk_089A355A:
	.incbin "baserom.gba", 0x9A355A, 0x2A1F
	.global gUnk_089A5F79
gUnk_089A5F79:
	.byte 0x00
	.global gUnk_089A5F7A
gUnk_089A5F7A:
	.incbin "baserom.gba", 0x9A5F7A, 0x31CC
	.global gUnk_089A9146
gUnk_089A9146:
	.byte 0x00
	.global gUnk_089A9147
gUnk_089A9147:
	.incbin "baserom.gba", 0x9A9147, 0x4626
	.global gUnk_089AD76D
gUnk_089AD76D:
	.byte 0x00
	.global gUnk_089AD76E
gUnk_089AD76E:
	.incbin "baserom.gba", 0x9AD76E, 0x302F
	.global gUnk_089B079D
gUnk_089B079D:
	.byte 0x00
	.global gUnk_089B079E
gUnk_089B079E:
	.incbin "baserom.gba", 0x9B079E, 0x2663
	.global gUnk_089B2E01
gUnk_089B2E01:
	.byte 0x00
	.global gUnk_089B2E02
gUnk_089B2E02:
	.incbin "baserom.gba", 0x9B2E02, 0x3201
	.global gUnk_089B6003
gUnk_089B6003:
	.byte 0x00
	.global gUnk_089B6004
gUnk_089B6004:
	.incbin "baserom.gba", 0x9B6004, 0x300A
	.global gUnk_089B900E
gUnk_089B900E:
	.byte 0x00
	.global gUnk_089B900F
gUnk_089B900F:
	.incbin "baserom.gba", 0x9B900F, 0x4862
	.global gUnk_089BD871
gUnk_089BD871:
	.byte 0x00
	.global gUnk_089BD872
gUnk_089BD872:
	.incbin "baserom.gba", 0x9BD872, 0x3C28
	.global gUnk_089C149A
gUnk_089C149A:
	.byte 0x00
	.global gUnk_089C149B
gUnk_089C149B:
	.incbin "baserom.gba", 0x9C149B, 0x4A9B
	.global gUnk_089C5F36
gUnk_089C5F36:
	.byte 0x00
	.global gUnk_089C5F37
gUnk_089C5F37:
	.incbin "baserom.gba", 0x9C5F37, 0x3B0E
	.global gUnk_089C9A45
gUnk_089C9A45:
	.byte 0x00
	.global gUnk_089C9A46
gUnk_089C9A46:
	.incbin "baserom.gba", 0x9C9A46, 0x317B
	.global gUnk_089CCBC1
gUnk_089CCBC1:
	.byte 0x00
	.global gUnk_089CCBC2
gUnk_089CCBC2:
	.incbin "baserom.gba", 0x9CCBC2, 0x3CDB
	.global gUnk_089D089D
gUnk_089D089D:
	.incbin "baserom.gba", 0x9D089D, 0x1E3
	.global gUnk_089D0A80
gUnk_089D0A80:
	.byte 0x00
	.global gUnk_089D0A81
gUnk_089D0A81:
	.incbin "baserom.gba", 0x9D0A81, 0x1EC6
	.global gUnk_089D2947
gUnk_089D2947:
	.byte 0x00
	.global gUnk_089D2948
gUnk_089D2948:
	.incbin "baserom.gba", 0x9D2948, 0x25C9
	.global gUnk_089D4F11
gUnk_089D4F11:
	.byte 0x00
	.global gUnk_089D4F12
gUnk_089D4F12:
	.incbin "baserom.gba", 0x9D4F12, 0x1026
	.4byte gUnk_0804FFF8
	.incbin "baserom.gba", 0x9D5F3C, 0x19A6
	.global gUnk_089D78E2
gUnk_089D78E2:
	.byte 0x00
	.global gUnk_089D78E3
gUnk_089D78E3:
	.incbin "baserom.gba", 0x9D78E3, 0x237E
	.global gUnk_089D9C61
gUnk_089D9C61:
	.byte 0x00
	.global gUnk_089D9C62
gUnk_089D9C62:
	.incbin "baserom.gba", 0x9D9C62, 0x31E9
	.global gUnk_089DCE4B
gUnk_089DCE4B:
	.byte 0x00
	.global gUnk_089DCE4C
gUnk_089DCE4C:
	.incbin "baserom.gba", 0x9DCE4C, 0x164A
	.global gUnk_089DE496
gUnk_089DE496:
	.byte 0x00
	.global gUnk_089DE497
gUnk_089DE497:
	.incbin "baserom.gba", 0x9DE497, 0x1B0E
	.global gUnk_089DFFA5
gUnk_089DFFA5:
	.byte 0x00
	.global gUnk_089DFFA6
gUnk_089DFFA6:
	.incbin "baserom.gba", 0x9DFFA6, 0x1476
	.global gUnk_089E141C
gUnk_089E141C:
	.byte 0x00
	.global gUnk_089E141D
gUnk_089E141D:
	.incbin "baserom.gba", 0x9E141D, 0x2C79
	.global gUnk_089E4096
gUnk_089E4096:
	.byte 0x00
	.global gUnk_089E4097
gUnk_089E4097:
	.incbin "baserom.gba", 0x9E4097, 0x2424
	.global gUnk_089E64BB
gUnk_089E64BB:
	.byte 0x00
	.global gUnk_089E64BC
gUnk_089E64BC:
	.incbin "baserom.gba", 0x9E64BC, 0x23BA
	.global gUnk_089E8876
gUnk_089E8876:
	.byte 0x00
	.global gUnk_089E8877
gUnk_089E8877:
	.incbin "baserom.gba", 0x9E8877, 0x21E1
	.global gUnk_089EAA58
gUnk_089EAA58:
	.byte 0x00
	.global gUnk_089EAA59
gUnk_089EAA59:
	.incbin "baserom.gba", 0x9EAA59, 0x29BA
	.global gUnk_089ED413
gUnk_089ED413:
	.byte 0x00
	.global gUnk_089ED414
gUnk_089ED414:
	.incbin "baserom.gba", 0x9ED414, 0x2817
	.global gUnk_089EFC2B
gUnk_089EFC2B:
	.byte 0x00
	.global gUnk_089EFC2C
gUnk_089EFC2C:
	.incbin "baserom.gba", 0x9EFC2C, 0x2D93
	.global gUnk_089F29BF
gUnk_089F29BF:
	.byte 0x00
	.global gUnk_089F29C0
gUnk_089F29C0:
	.incbin "baserom.gba", 0x9F29C0, 0x344B
	.global gUnk_089F5E0B
gUnk_089F5E0B:
	.byte 0x00
	.global gUnk_089F5E0C
gUnk_089F5E0C:
	.incbin "baserom.gba", 0x9F5E0C, 0x3055
	.global gUnk_089F8E61
gUnk_089F8E61:
	.byte 0x00
	.global gUnk_089F8E62
gUnk_089F8E62:
	.incbin "baserom.gba", 0x9F8E62, 0x3CD9
	.global gUnk_089FCB3B
gUnk_089FCB3B:
	.byte 0x00
	.global gUnk_089FCB3C
gUnk_089FCB3C:
	.incbin "baserom.gba", 0x9FCB3C, 0x31F7
	.global gUnk_089FFD33
gUnk_089FFD33:
	.byte 0x00
	.global gUnk_089FFD34
gUnk_089FFD34:
	.incbin "baserom.gba", 0x9FFD34, 0x2CC
