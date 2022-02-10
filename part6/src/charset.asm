charset:

	; tile 0x00
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000
        .byte   %00000000

	; tile 0x01
        .byte   %11111111 ; row 0, color 0
        .byte   %00000000 ; row 0, color 1
        .byte   %10000001 ; row 1, color 0
        .byte   %00000000 ; row 1, color 1
        .byte   %10000001 ; row 2, color 0
        .byte   %00000000 ; row 2, color 1
        .byte   %10000001 ; row 3, color 0
        .byte   %00001000 ; row 3, color 1
        .byte   %10011001 ; row 4, color 0
        .byte   %00001000 ; row 4, color 1
        .byte   %10000001 ; row 5, color 0
        .byte   %00000000 ; row 5, color 1
        .byte   %10000001 ; row 6, color 0
        .byte   %00000000 ; row 6, color 1
        .byte   %11111111 ; row 7, color 0
        .byte   %00000000 ; row 7, color 1

charset_end:
