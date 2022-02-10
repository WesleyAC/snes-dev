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

	; This is tile 0x02 in 2bpp mode (what the background uses), but tile
	; 0x01 in 4bpp mode (what the sprites use). It's very strange to mix
	; these, but my assumption is that by this point you've already got
	; your own graphics pipeline of some sort and probably aren't using
	; 2bpp graphics at all any more, so I'm sure you can figure out what'll
	; work best for you on your own :)
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
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
        .byte   %00000000

        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
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
        .byte   %00000000

	; normally you would put 14 other 8x8 tiles here, but we don't have
	; any, so just fill it with zeros.
	.repeat 14 * 32
		.byte 0
	.endrepeat

        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11100000
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
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
        .byte   %00000000

        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %00000111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
        .byte   %00000000
        .byte   %11111111
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
        .byte   %00000000

charset_end:
