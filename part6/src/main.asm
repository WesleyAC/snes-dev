.p816
.smart

.include "macros.inc"
.include "registers.inc"

.include "header.asm"

.segment "ZEROPAGE"
nmi_count: .res 2

.segment "CODE"

VRAM_CHARS = $0000
VRAM_BG1   = $1000

start:
	.include "init.asm"

	; Set up the color palette
	stz CGADD
	; Color 0 = black
	lda #$00
	sta CGDATA
	lda #$00
	sta CGDATA
	; Color 1 = red
	lda #$1f
	sta CGDATA
	lda #$00
	sta CGDATA
	; Color 2 = blue
	lda #$e0
	sta CGDATA
	lda #$03
	sta CGDATA
	; Color 3 = green
	lda #$00
	sta CGDATA
	lda #$7c
	sta CGDATA

	; Set Graphics Mode 0, 8x8 tiles
	stz BGMODE

	; Set BG1 and tile map and character data
	lda #>VRAM_BG1
	sta BG1SC
	lda #VRAM_CHARS
	sta BG12NBA

	; Load character data into VRAM
	lda #$80
	sta VMAIN
	ldx #VRAM_CHARS
	stx VMADDL
	lda #%00000001
	sta DMAP0
	lda #<VMDATAL
	sta BBAD0
	ldx #.loword(charset)
	stx A1T0L
	lda #^charset
	sta A1B0
	ldx #(charset_end - charset)
	stx DAS0L
	lda #1
	sta MDMAEN

	; Show BG1
	lda #%00000001
	sta TM

	lda #$0f
	sta INIDISP

	lda #%10000001
	sta NMITIMEN

mainloop:

	lda nmi_count
@nmi_check:
	wai
	cmp nmi_count
	beq @nmi_check

	lda JOY1H
	bit #%00000100 ; Down button
	beq @down_not_pressed
		ldx #(VRAM_BG1 + (1 * 32) + 1)
		stx VMADDL
		lda #$01 ; tile number
		sta VMDATAL
		stz VMDATAH
	@down_not_pressed:

	bra mainloop

nmi:
	bit RDNMI
	inc nmi_count
_rti:
	rti

.include "charset.asm"
