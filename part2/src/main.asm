.p816
.smart

.include "macros.inc"
.include "registers.inc"

.include "header.asm"

.segment "CODE"

start:
	.include "init.asm"

	; Set up the color palette
	stz CGADD
	; Set color zero to red
	; $001f = %0000000000011111
	;           bbbbbgggggrrrrr
	lda #$1f
	sta CGDATA
	lda #$00
	sta CGDATA

	lda #$0f
	sta INIDISP

busywait:
	bra busywait

nmi:
	bit RDNMI
_rti:
	rti
