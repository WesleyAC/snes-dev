.segment "HEADER"

.byte "EXAMPLE ROM          " ; ROM name, must be 21 chars
.byte $30   ; Map Mode: 3.58MHz LoROM
.byte $00   ; Cartridge Type: ROM only
.byte $08   ; ROM Size
.byte $00   ; RAM size
.byte $01   ; Destination Code: USA
.byte $33   ; Fixed value
.byte $00   ; Mask ROM Version
.word $0000 ; Complement Check
.word $0000 ; Check Sum

; native mode vectors
.word 0, 0
.addr _rti  ; COP
.addr _rti  ; BRK
.addr _rti  ; ABORT
.addr nmi   ; NMI
.addr start ; RST
.addr _rti  ; IRQ

; emulation mode vectors - largely unused, since we run in native mode
.word 0, 0
.addr 0
.addr 0
.addr 0
.addr 0
.addr start ; RST
.addr 0
