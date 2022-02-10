.p816
.smart

.include "macros.inc"
.include "registers.inc"

.include "header.asm"

.segment "ZEROPAGE"
nmi_count: .res 2

.segment "BSS"
oam_lo_buffer: .res 512
oam_hi_buffer: .res 32
oam_buffer_end:

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

	; Set up sprite palette
	lda #128
	sta CGADD
	stz CGDATA
	stz CGDATA
	lda #$1f
	sta CGDATA
	stz CGDATA

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

	; Show BG1 + sprites
	lda #%00010001
	sta TM

	lda #$0f
	sta INIDISP

	lda #%0000000
	sta OBSEL

	ldx #0
@zero_oam:
	stz oam_lo_buffer, x
	inx
	cpx #(oam_buffer_end - oam_lo_buffer)
	bne @zero_oam

	lda #%10000001
	sta NMITIMEN

mainloop:

	lda nmi_count
@nmi_check:
	wai
	cmp nmi_count
	beq @nmi_check

	; Set sprite 0 X position
	ldx #$42
	stx oam_lo_buffer
	; Set sprite 0 Y position
	ldx #$69
	stx oam_lo_buffer + 1
	; Set sprite 0 to priority 3 and tile 0x01
	ldx #((%00110000 << 8) | $0001)
	stx oam_lo_buffer + 2

	; Set sprite 0 to be large (16x16)
	lda #%00000010
	sta oam_hi_buffer

	; Copy OAM data via DMA
	stz OAMADDL
	lda #%00000000
	sta DMAP1
	lda #<OAMDATA
	sta BBAD1
	ldx #.loword(oam_lo_buffer)
	stx A1T1L
	lda #^oam_lo_buffer
	sta A1B1
	ldx #(oam_buffer_end - oam_lo_buffer)
	stx DAS1L
	lda #%00000010
	sta MDMAEN

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
