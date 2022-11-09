org $0F8000

;===================================================================================================

routine0F8000:
#_0F8000: PHP
#_0F8001: REP #$30

#_0F8003: AND.w #$00FF
#_0F8006: ASL A
#_0F8007: STA.w $0E00

#_0F800A: ASL A
#_0F800B: CLC
#_0F800C: ADC.w $0E00
#_0F800F: TAY

#_0F8010: PHB
#_0F8011: PHK
#_0F8012: PLB

#_0F8013: LDA.w data0F8069,Y
#_0F8016: AND.w #$00FF
#_0F8019: STA.w $00E2

#_0F801C: LDA.w data0F806A,Y
#_0F801F: STA.w $00E0

#_0F8022: LDA.w data0F806C,Y
#_0F8025: ASL A
#_0F8026: ASL A
#_0F8027: ASL A
#_0F8028: ASL A
#_0F8029: STA.w $0E00

#_0F802C: LDA.w data0F806D,Y
#_0F802F: STA.w $0E02

#_0F8032: SEP #$20

#_0F8034: LDA.b #$80
#_0F8036: STA.w VMAIN
#_0F8039: STZ.w VMADDL
#_0F803C: STZ.w VMADDH

#_0F803F: LDY.w #$0000

.branch0F8042
#_0F8042: LDA.b [$E0],Y
#_0F8044: AND.b #$F0
#_0F8046: LSR A
#_0F8047: LSR A
#_0F8048: LSR A
#_0F8049: LSR A
#_0F804A: BEQ .branch0F8050

#_0F804C: CLC
#_0F804D: ADC.w $0E00

.branch0F8050
#_0F8050: STA.w VMDATAH

#_0F8053: LDA.b [$E0],Y
#_0F8055: AND.b #$0F
#_0F8057: BEQ .branch0F805D

#_0F8059: CLC
#_0F805A: ADC.w $0E00

.branch0F805D
#_0F805D: STA.w VMDATAH

#_0F8060: INY
#_0F8061: CPY.w $0E02
#_0F8064: BNE .branch0F8042

#_0F8066: PLB
#_0F8067: PLP
#_0F8068: RTL

; TODO merge
data0F8069:
#_0F8069: db $22

data0F806A:
#_0F806A: db $00,$A0

data0F806C:
#_0F806C: db $02

data0F806D:
#_0F806D: db $00,$20,$27,$00,$C0,$02,$00,$10

;===================================================================================================

routine0F8075:
#_0F8075: PHP
#_0F8076: REP #$30

#_0F8078: AND.w #$00FF
#_0F807B: STA.w $0E00
#_0F807E: ASL A
#_0F807F: ASL A
#_0F8080: CLC
#_0F8081: ADC.w $0E00
#_0F8084: TAY

#_0F8085: PHB
#_0F8086: PHK
#_0F8087: PLB

#_0F8088: LDA.w .tiles+0,Y
#_0F808B: AND.w #$00FF
#_0F808E: STA.w $00E2

#_0F8091: LDA.w .tiles+1,Y
#_0F8094: STA.w $00E0

#_0F8097: LDA.w .tiles+3,Y
#_0F809A: AND.w #$00FF
#_0F809D: STA.w $0E00

#_0F80A0: LDA.w .tiles+4,Y
#_0F80A3: AND.w #$00FF
#_0F80A6: STA.w $0E02

#_0F80A9: STZ.w $0E04

#_0F80AC: SEP #$20

#_0F80AE: LDA.b #$00
#_0F80B0: STA.w VMAIN

#_0F80B3: LDX.w $0E02

.next_chunk
#_0F80B6: PHX

#_0F80B7: LDA.w $0E04
#_0F80BA: STA.w VMADDL

#_0F80BD: LDA.w $0E05
#_0F80C0: STA.w VMADDH

#_0F80C3: LDY.w #$0000

.next_char
#_0F80C6: LDA.b [$E0],Y
#_0F80C8: STA.w VMDATAL

#_0F80CB: INY
#_0F80CC: CPY.w $0E00
#_0F80CF: BNE .next_char

;---------------------------------------------------------------------------------------------------

#_0F80D1: REP #$20

#_0F80D3: LDA.w $0E04
#_0F80D6: CLC
#_0F80D7: ADC.w #$0080
#_0F80DA: STA.w $0E04

#_0F80DD: LDA.w $00E0
#_0F80E0: CLC
#_0F80E1: ADC.w $0E00
#_0F80E4: STA.w $00E0

#_0F80E7: SEP #$20

#_0F80E9: PLX
#_0F80EA: DEX
#_0F80EB: BNE .next_chunk

;---------------------------------------------------------------------------------------------------

#_0F80ED: LDA.b #$80
#_0F80EF: STA.w VMAIN

#_0F80F2: PLB
#_0F80F3: PLP

#_0F80F4: RTL

;---------------------------------------------------------------------------------------------------

; TODO verify the 0xD0+ chars?
.tiles
#_0F80F5: db $0F : dw $80FA : db $20, $0C

#_0F80FA: db $00, $00, $00, $00, $00, $01, $02, $03 ; "     012"
#_0F8102: db $04, $05, $06, $75, $76, $77, $78, $79 ; "345ノハヒフヘ"
#_0F810A: db $7A, $00, $00, $00, $00, $00, $00, $00 ; "ホ       "
#_0F8112: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F811A: db $00, $00, $07, $08, $09, $0A, $0B, $0C ; "  6789AB"
#_0F8122: db $0D, $0E, $0F, $7B, $7C, $7D, $7E, $7F ; "CDEマミムメモ"
#_0F812A: db $80, $81, $82, $83, $00, $00, $00, $00 ; "ヤユヨラ    "
#_0F8132: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F813A: db $00, $10, $11, $12, $13, $14, $15, $16 ; " FGHIJKL"
#_0F8142: db $17, $18, $19, $84, $85, $86, $87, $88 ; "MNOリルレロワ"
#_0F814A: db $89, $8A, $8B, $8C, $8D, $00, $00, $00 ; "ヲンァィェ   "
#_0F8152: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F815A: db $1A, $1B, $1C, $1D, $1E, $1F, $20, $21 ; "PQRSTUVW"
#_0F8162: db $22, $23, $24, $8E, $8F, $90, $91, $92 ; "XYZォャュョッ"
#_0F816A: db $93, $94, $95, $96, $97, $98, $00, $00 ; "・!?&>/  "
#_0F8172: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F817A: db $25, $26, $27, $28, $29, $2A, $2B, $2C ; "あいうえおかきく"
#_0F8182: db $2D, $2E, $2F, $99, $9A, $9B, $9C, $9D ; "けこさ':.がぎ"
#_0F818A: db $9E, $9F, $A0, $A1, $A2, $A3, $00, $00 ; "ぐげござじず  "
#_0F8192: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F819A: db $30, $31, $32, $33, $34, $35, $36, $37 ; "しすせそたちつて"
#_0F81A2: db $38, $39, $3A, $A4, $A5, $A6, $A7, $A8 ; "となにぜぞだぢづ"
#_0F81AA: db $A9, $AA, $AB, $AC, $AD, $AE, $00, $00 ; "でどばびぶべ  "
#_0F81B2: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F81BA: db $3B, $3C, $3D, $3E, $3F, $40, $41, $42 ; "ぬねのはひふへほ"
#_0F81C2: db $43, $44, $45, $AF, $B0, $B1, $B2, $B3 ; "まみむぼぱぴぷぺ"
#_0F81CA: db $B4, $B5, $B6, $B7, $B8, $B9, $00, $00 ; "ぽガギグゲゴ  "
#_0F81D2: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F81DA: db $46, $47, $48, $49, $4A, $4B, $4C, $4D ; "めもやゆよらりる"
#_0F81E2: db $4E, $4F, $50, $BA, $BB, $BC, $BD, $BE ; "れろわザジズゼゾ"
#_0F81EA: db $BF, $C0, $C1, $C2, $C3, $C4, $00, $00 ; "ダヂヅデドバ  "
#_0F81F2: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F81FA: db $51, $52, $53, $54, $55, $56, $57, $58 ; "をんぁぉゃゅょっ"
#_0F8202: db $59, $5A, $5B, $C5, $C6, $C7, $C8, $C9 ; "ぅー￥ビブベボパ"
#_0F820A: db $CA, $CB, $CC, $CD, $CE, $CF, $00, $00 ; "ピプペポヴ   "
#_0F8212: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F821A: db $00, $5C, $5D, $5E, $5F, $60, $61, $62 ; " ℏアイウエオカ"
#_0F8222: db $63, $64, $65, $D0, $D1, $D2, $D3, $D4 ; "キクケ     "
#_0F822A: db $D5, $D6, $D7, $D8, $D9, $00, $00, $00 ; "        "
#_0F8232: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F823A: db $00, $00, $66, $67, $68, $69, $6A, $6B ; "  コサシスセソ"
#_0F8242: db $6C, $6D, $6E, $DA, $DB, $DC, $DD, $DE ; "タチツ     "
#_0F824A: db $DF, $E0, $E1, $E2, $00, $00, $00, $00 ; "        "
#_0F8252: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

#_0F825A: db $00, $00, $00, $00, $00, $6F, $70, $71 ; "     テトナ"
#_0F8262: db $72, $73, $74, $E3, $E4, $E5, $E6, $E7 ; "ニヌネ     "
#_0F826A: db $E8, $E9, $00, $00, $00, $00, $00, $00 ; "        "
#_0F8272: db $00, $00, $00, $00, $00, $00, $00, $00 ; "        "

;===================================================================================================

routine0F827A:
#_0F827A: PHP

#_0F827B: PHB
#_0F827C: PHK
#_0F827D: PLB

#_0F827E: SEP #$20

#_0F8280: LDA.b #$00
#_0F8282: STA.w VMAIN

#_0F8285: REP #$30

#_0F8287: LDY.w #$002D

.next_chunk
#_0F828A: REP #$20

#_0F828C: PHY

#_0F828D: TYA
#_0F828E: ASL A
#_0F828F: ASL A
#_0F8290: TAX

#_0F8291: ASL A
#_0F8292: ASL A
#_0F8293: ASL A
#_0F8294: ASL A
#_0F8295: ASL A
#_0F8296: STA.w VMADDL

#_0F8299: SEP #$20

#_0F829B: LDA.w data0F82DD+0,X
#_0F829E: STA.w $0E00

#_0F82A1: LDA.w data0F82DD+1,X
#_0F82A4: STA.w $0E02

#_0F82A7: LDA.w data0F82DD+2,X
#_0F82AA: STA.w $0E04

#_0F82AD: LDA.w data0F82DD+3,X
#_0F82B0: STA.w $0E06

#_0F82B3: LDY.w #$001F

.next_tile
#_0F82B6: LDA.w $0E00
#_0F82B9: STA.w VMDATAL

#_0F82BC: LDA.w $0E02
#_0F82BF: STA.w VMDATAL

#_0F82C2: LDA.w $0E04
#_0F82C5: STA.w VMDATAL

#_0F82C8: LDA.w $0E06
#_0F82CB: STA.w VMDATAL

#_0F82CE: DEY
#_0F82CF: BPL .next_tile

#_0F82D1: PLY
#_0F82D2: DEY
#_0F82D3: BPL .next_chunk

#_0F82D5: LDA.b #$80
#_0F82D7: STA.w VMAIN

#_0F82DA: PLB
#_0F82DB: PLP

#_0F82DC: RTL

;---------------------------------------------------------------------------------------------------

data0F82DD:
#_0F82DD: db $01, $01, $01, $01
#_0F82E1: db $01, $01, $01, $01
#_0F82E5: db $01, $01, $01, $01
#_0F82E9: db $01, $01, $01, $01
#_0F82ED: db $01, $01, $01, $01
#_0F82F1: db $02, $02, $02, $02
#_0F82F5: db $03, $03, $03, $03
#_0F82F9: db $04, $04, $04, $04
#_0F82FD: db $05, $05, $05, $05
#_0F8301: db $06, $06, $06, $06
#_0F8305: db $07, $07, $07, $07
#_0F8309: db $07, $07, $07, $07
#_0F830D: db $07, $07, $07, $07
#_0F8311: db $07, $07, $07, $07
#_0F8315: db $07, $07, $07, $07
#_0F8319: db $07, $07, $07, $07
#_0F831D: db $08, $08, $08, $08
#_0F8321: db $09, $0A, $0B, $09
#_0F8325: db $0C, $0D, $0E, $0C
#_0F8329: db $0F, $10, $11, $0F
#_0F832D: db $12, $13, $14, $12
#_0F8331: db $15, $16, $17, $15
#_0F8335: db $18, $19, $1A, $18
#_0F8339: db $1B, $1C, $1D, $1B
#_0F833D: db $1E, $1F, $20, $21
#_0F8341: db $22, $23, $24, $25
#_0F8345: db $26, $27, $28, $29
#_0F8349: db $2A, $2B, $2C, $2D
#_0F834D: db $2E, $2F, $30, $31
#_0F8351: db $32, $33, $34, $35
#_0F8355: db $36, $37, $38, $39
#_0F8359: db $3A, $3B, $3C, $3D
#_0F835D: db $3E, $3F, $40, $41
#_0F8361: db $42, $43, $44, $45
#_0F8365: db $46, $47, $48, $49
#_0F8369: db $4A, $4B, $4C, $4D
#_0F836D: db $4E, $4F, $50, $51
#_0F8371: db $52, $53, $54, $55
#_0F8375: db $56, $56, $56, $56
#_0F8379: db $56, $56, $56, $56
#_0F837D: db $56, $56, $56, $56
#_0F8381: db $57, $58, $59, $5A
#_0F8385: db $5B, $5C, $5D, $5E
#_0F8389: db $5F, $60, $61, $62
#_0F838D: db $57, $58, $59, $5A
#_0F8391: db $5B, $5C, $5D, $5E
#_0F8395: db $5F, $60, $61, $62

;===================================================================================================

routine0F8399:
#_0F8399: PHP
#_0F839A: REP #$30

#_0F839C: PHA
#_0F839D: PHX
#_0F839E: PHY

#_0F839F: PHD
#_0F83A0: PHB

#_0F83A1: PHB
#_0F83A2: PHK
#_0F83A3: PLB

#_0F83A4: SEP #$20

#_0F83A6: LDA.b #$E5
#_0F83A8: JSL TestGameProgressBit
#_0F83AC: BCC .continue

#_0F83AE: JMP .exit

;---------------------------------------------------------------------------------------------------

.continue
#_0F83B1: REP #$20

#_0F83B3: LDA.w $0B00
#_0F83B6: AND.w #$00FF
#_0F83B9: STA.w $1A80

#_0F83BC: LDA.w $0B02
#_0F83BF: AND.w #$00FF
#_0F83C2: STA.w $1AC0

#_0F83C5: SEP #$30

#_0F83C7: LDA.w $101C
#_0F83CA: LSR A
#_0F83CB: LSR A
#_0F83CC: LSR A
#_0F83CD: TAX

#_0F83CE: INC.w $0B39

#_0F83D1: LDA.w $0B39
#_0F83D4: CMP.w data0F8448,X
#_0F83D7: BCC .branch0F83EA

#_0F83D9: INC.w $0B38
#_0F83DC: INC.w $0B38

#_0F83DF: LDA.w $0B38
#_0F83E2: AND.b #$07
#_0F83E4: STA.w $0B38

#_0F83E7: STZ.w $0B39

.branch0F83EA
#_0F83EA: STZ.w $0E00

#_0F83ED: LDA.w $101C
#_0F83F0: CMP.b #$70
#_0F83F2: BCC .branch0F83FE

#_0F83F4: INC.w $0E00

#_0F83F7: CMP.b #$90
#_0F83F9: BCC .branch0F83FE

#_0F83FB: INC.w $0E00

;---------------------------------------------------------------------------------------------------

.branch0F83FE
#_0F83FE: LDA.w $0E00
#_0F8401: ASL A
#_0F8402: ASL A
#_0F8403: ASL A
#_0F8404: ASL A
#_0F8405: PHA

#_0F8406: JSL routine028708

#_0F840A: PLA
#_0F840B: STA.w $0E00

#_0F840E: LDA.w $0B29
#_0F8411: AND.b #$0F
#_0F8413: CMP.b #$0A
#_0F8415: BNE .branch0F8420

#_0F8417: LDA.w $0E00
#_0F841A: CLC
#_0F841B: ADC.b #$08
#_0F841D: STA.w $0E00

.branch0F8420
#_0F8420: LDA.w $0B37
#_0F8423: ASL A
#_0F8424: ASL A
#_0F8425: ASL A
#_0F8426: CLC
#_0F8427: ADC.w $0B38
#_0F842A: CLC
#_0F842B: ADC.w $0E00
#_0F842E: TAX

#_0F842F: REP #$20

#_0F8431: LDA.w data0F8468,X
#_0F8434: STA.w $0020

#_0F8437: SEP #$20

#_0F8439: LDA.b #$80
#_0F843B: STA.w $1A10

;---------------------------------------------------------------------------------------------------

.exit
#_0F843E: PLB

#_0F843F: REP #$30

#_0F8441: PLB
#_0F8442: PLD

#_0F8443: PLY
#_0F8444: PLX
#_0F8445: PLA

#_0F8446: PLP
#_0F8447: RTL

data0F8448:
#_0F8448: db $03,$04,$05,$06,$07,$08,$09,$0A
#_0F8450: db $0B,$0C,$0D,$0E,$0F,$10,$08,$08
#_0F8458: db $08,$08,$10,$0F,$0E,$0D,$0C,$0B
#_0F8460: db $0A,$09,$08,$07,$06,$05,$04,$03

data0F8468:
#_0F8468: dw $0001,$0002,$0003,$0004
#_0F8470: dw $0021,$0022,$0023,$0024
#_0F8478: dw $0001,$0002,$0001,$0004
#_0F8480: dw $0021,$0022,$0021,$0023
#_0F8488: dw $0004,$0003,$0002,$0001
#_0F8490: dw $0024,$0023,$0022,$0021

;===================================================================================================
; Enters with:
;    A = item ID
; Exits with:
;    carry - set on success
;===================================================================================================
LookForItemInInventory:
#_0F8498: PHX
#_0F8499: PHP

#_0F849A: SEP #$30

#_0F849C: STA.w $0E00

#_0F849F: PHB
#_0F84A0: PHK
#_0F84A1: PLB

#_0F84A2: LDX.b #$00

.keep_looking
#_0F84A4: LDA.w $0781,X
#_0F84A7: BEQ .have_none_of_item

#_0F84A9: LDA.w $0780,X
#_0F84AC: CMP.w $0E00
#_0F84AF: BEQ .have_item

.have_none_of_item
#_0F84B1: INX
#_0F84B2: INX
#_0F84B3: CPX.b #$3C
#_0F84B5: BNE .keep_looking

; Boo!
#_0F84B7: PLB
#_0F84B8: PLP
#_0F84B9: PLX

#_0F84BA: CLC

#_0F84BB: RTL

; Yay!
.have_item
#_0F84BC: PLB
#_0F84BD: PLP
#_0F84BE: PLX

#_0F84BF: SEC

#_0F84C0: RTL

;===================================================================================================

routine0F84C1:
#_0F84C1: PHP
#_0F84C2: REP #$30

#_0F84C4: STA.w $0E00

#_0F84C7: LDX.w #$0180

.next_teammate
#_0F84CA: LDA.w $1000,X
#_0F84CD: BPL .skip_teammate

#_0F84CF: LDA.w $1004,X
#_0F84D2: CMP.w $0E00
#_0F84D5: BNE .skip_teammate

#_0F84D7: LDA.w $1000,X
#_0F84DA: AND.w #$4000
#_0F84DD: BEQ .branch0F84E3

#_0F84DF: JSL routine0F853F

.branch0F84E3
#_0F84E3: LDA.w #$0000
#_0F84E6: STA.w $1000,X

.skip_teammate
#_0F84E9: TXA
#_0F84EA: CLC
#_0F84EB: ADC.w #$0060
#_0F84EE: TAX

#_0F84EF: CPX.w #$0600
#_0F84F2: BNE .next_teammate

#_0F84F4: PLP
#_0F84F5: RTL

;===================================================================================================

routine0F84F6:
#_0F84F6: PHP
#_0F84F7: SEP #$20

#_0F84F9: JSL routine0F850B

#_0F84FD: JSL routine02BA4C

#_0F8501: JSL routine00A840

#_0F8505: JSL UpdateDirTilemap

#_0F8509: PLP
#_0F850A: RTL

;===================================================================================================

routine0F850B:
#_0F850B: PHP
#_0F850C: REP #$30

#_0F850E: LDY.w #$000A
#_0F8511: LDX.w #$0014

#_0F8514: LDA.w #$0008
#_0F8517: STA.w $1A60,X

#_0F851A: LDA.w #$00F0
#_0F851D: STA.w $1AA0,X

#_0F8520: LDA.w #$0011
#_0F8523: STA.w $0000,X

#_0F8526: SEP #$20

#_0F8528: LDA.b #$80
#_0F852A: STA.w $1A00,Y

#_0F852D: LDA.b #$03
#_0F852F: STA.w $0F76
#_0F8532: STA.w TS

#_0F8535: LDA.b #$50
#_0F8537: STA.w $0F7B
#_0F853A: STA.w CGADSUB

#_0F853D: PLP
#_0F853E: RTL

;===================================================================================================

routine0F853F:
#_0F853F: PHX

#_0F8540: PHP

#_0F8541: PHB
#_0F8542: PHK
#_0F8543: PLB

#_0F8544: REP #$30

#_0F8546: STX.w $0E00
#_0F8549: LDX.w #$0000

.next_teammate
#_0F854C: LDA.w $0700,X
#_0F854F: CMP.w $0E00
#_0F8552: BEQ .shift_teammates

#_0F8554: INX
#_0F8555: INX
#_0F8556: CPX.w #$000C
#_0F8559: BNE .next_teammate

#_0F855B: SEP #$20

#_0F855D: LDA.b #$FF
#_0F855F: STA.w $0A58

#_0F8562: PLB

#_0F8563: PLP

#_0F8564: PLX

#_0F8565: RTL

;---------------------------------------------------------------------------------------------------

.shift_teammates
#_0F8566: LDA.w $0702,X
#_0F8569: STA.w $0700,X

#_0F856C: INX
#_0F856D: INX
#_0F856E: CPX.w #$000C
#_0F8571: BNE .shift_teammates

#_0F8573: LDA.w #$FFFF
#_0F8576: STA.w $070A

#_0F8579: SEP #$20

#_0F857B: STZ.w $0A58

#_0F857E: PLB

#_0F857F: PLP

#_0F8580: PLX

#_0F8581: RTL

;===================================================================================================
; TODO chaos alignment check?
routine0F8582:
#_0F8582: PHP

#_0F8583: PHB
#_0F8584: PHK
#_0F8585: PLB

#_0F8586: REP #$30

#_0F8588: LDA.w $101C
#_0F858B: CMP.w #$0070
#_0F858E: BCC .branch0F859F

#_0F8590: CMP.w #$0090
#_0F8593: BCC .branch0F85A7

#_0F8595: LDA.w $101C,X
#_0F8598: CMP.w #$0070
#_0F859B: BCC .branch0F85AB

#_0F859D: BRA .branch0F85A7

.branch0F859F
#_0F859F: LDA.w $101C,X
#_0F85A2: CMP.w #$0090
#_0F85A5: BCS .branch0F85AB

.branch0F85A7
#_0F85A7: PLB
#_0F85A8: PLP

#_0F85A9: CLC

#_0F85AA: RTL

.branch0F85AB
#_0F85AB: PLB

#_0F85AC: PLP
#_0F85AD: SEC

#_0F85AE: RTL

;===================================================================================================

routine0F85AF:
#_0F85AF: PHP
#_0F85B0: SEP #$30

#_0F85B2: STA.w $0E02
#_0F85B5: STX.w $0E04
#_0F85B8: STY.w $0E00

#_0F85BB: PHB
#_0F85BC: PHK
#_0F85BD: PLB

#_0F85BE: LDA.w $0E04
#_0F85C1: SEC
#_0F85C2: SBC.w $0E02
#_0F85C5: INC A
#_0F85C6: STA.l $7E22FF

#_0F85CA: LDA.w $0E02
#_0F85CD: STA.l $7E22FE

#_0F85D1: REP #$30

#_0F85D3: LDA.w $0E00
#_0F85D6: AND.w #$00FF
#_0F85D9: STA.w $0E00

#_0F85DC: ASL A
#_0F85DD: ASL A
#_0F85DE: ASL A
#_0F85DF: ASL A
#_0F85E0: ASL A
#_0F85E1: STA.w $0E06

#_0F85E4: ASL A
#_0F85E5: ASL A
#_0F85E6: ASL A
#_0F85E7: ASL A
#_0F85E8: ASL A
#_0F85E9: STA.w $0E08

#_0F85EC: LDA.w $0E02
#_0F85EF: AND.w #$00FF
#_0F85F2: ASL A
#_0F85F3: STA.w $0E02

#_0F85F6: LDA.w $0E04
#_0F85F9: AND.w #$00FF
#_0F85FC: ASL A
#_0F85FD: STA.w $0E04

#_0F8600: STZ.w $0E0C

;---------------------------------------------------------------------------------------------------

.branch0F8603
#_0F8603: LDX.w $0E02

#_0F8606: LDA.l $7E2500,X
#_0F860A: AND.w #$001F
#_0F860D: CLC
#_0F860E: ADC.w $0E00
#_0F8611: CMP.w #$001F
#_0F8614: BCC .branch0F8619

;---------------------------------------------------------------------------------------------------

#_0F8616: LDA.w #$001F

.branch0F8619
#_0F8619: STA.w $0E0A

#_0F861C: LDX.w $0E02

#_0F861F: LDA.l $7E2500,X
#_0F8623: AND.w #$03E0
#_0F8626: CLC
#_0F8627: ADC.w $0E06
#_0F862A: CMP.w #$03E0
#_0F862D: BCC .branch0F8632

;---------------------------------------------------------------------------------------------------

#_0F862F: LDA.w #$03E0

.branch0F8632
#_0F8632: ORA.w $0E0A
#_0F8635: STA.w $0E0A

#_0F8638: LDX.w $0E02

#_0F863B: LDA.l $7E2500,X
#_0F863F: AND.w #$7C00
#_0F8642: CLC
#_0F8643: ADC.w $0E08
#_0F8646: CMP.w #$7C00
#_0F8649: BCC .branch0F864E

;---------------------------------------------------------------------------------------------------

#_0F864B: LDA.w #$7C00

.branch0F864E
#_0F864E: ORA.w $0E0A

#_0F8651: LDX.w $0E0C

#_0F8654: STA.l $7E2300,X
#_0F8658: INC.w $0E0C
#_0F865B: INC.w $0E0C

#_0F865E: INC.w $0E02
#_0F8661: INC.w $0E02

#_0F8664: LDA.w $0E04
#_0F8667: CMP.w $0E02
#_0F866A: BCS .branch0F8603

;---------------------------------------------------------------------------------------------------

#_0F866C: SEP #$20

#_0F866E: LDA.b #$01
#_0F8670: STA.l $7E22FD

#_0F8674: PLB

#_0F8675: PLP
#_0F8676: RTL

;===================================================================================================

routine0F8677:
#_0F8677: PHP
#_0F8678: SEP #$30

#_0F867A: STA.w $0E02
#_0F867D: STX.w $0E04
#_0F8680: STY.w $0E00

#_0F8683: PHB
#_0F8684: PHK
#_0F8685: PLB

#_0F8686: LDA.w $0E04
#_0F8689: SEC
#_0F868A: SBC.w $0E02
#_0F868D: INC A
#_0F868E: STA.l $7E22FF

#_0F8692: LDA.w $0E02
#_0F8695: STA.l $7E22FE

#_0F8699: REP #$30

#_0F869B: LDA.w $0E00

#_0F869E: AND.w #$00FF
#_0F86A1: STA.w $0E00

#_0F86A4: ASL A
#_0F86A5: ASL A
#_0F86A6: ASL A
#_0F86A7: ASL A
#_0F86A8: ASL A
#_0F86A9: STA.w $0E06

#_0F86AC: ASL A
#_0F86AD: ASL A
#_0F86AE: ASL A
#_0F86AF: ASL A
#_0F86B0: ASL A
#_0F86B1: STA.w $0E08

#_0F86B4: LDA.w $0E02
#_0F86B7: AND.w #$00FF
#_0F86BA: ASL A
#_0F86BB: STA.w $0E02

#_0F86BE: LDA.w $0E04
#_0F86C1: AND.w #$00FF
#_0F86C4: ASL A
#_0F86C5: STA.w $0E04

#_0F86C8: STZ.w $0E0C

;---------------------------------------------------------------------------------------------------

.next
#_0F86CB: LDX.w $0E02

#_0F86CE: LDA.l $7E2500,X
#_0F86D2: AND.w #$001F
#_0F86D5: SEC
#_0F86D6: SBC.w $0E00
#_0F86D9: BPL .positive_a

#_0F86DB: LDA.w #$0000

.positive_a
#_0F86DE: STA.w $0E0A

#_0F86E1: LDX.w $0E02

#_0F86E4: LDA.l $7E2500,X
#_0F86E8: AND.w #$03E0
#_0F86EB: SEC
#_0F86EC: SBC.w $0E06
#_0F86EF: BPL .positive_b

#_0F86F1: LDA.w #$0000

.positive_b
#_0F86F4: ORA.w $0E0A
#_0F86F7: STA.w $0E0A

#_0F86FA: LDX.w $0E02

#_0F86FD: LDA.l $7E2500,X
#_0F8701: AND.w #$7C00
#_0F8704: SEC
#_0F8705: SBC.w $0E08
#_0F8708: BPL .positive_c

#_0F870A: LDA.w #$0000

.positive_c
#_0F870D: ORA.w $0E0A
#_0F8710: LDX.w $0E0C
#_0F8713: STA.l $7E2300,X

#_0F8717: INC.w $0E0C
#_0F871A: INC.w $0E0C

#_0F871D: INC.w $0E02
#_0F8720: INC.w $0E02

#_0F8723: LDA.w $0E04
#_0F8726: CMP.w $0E02
#_0F8729: BCS .next

;---------------------------------------------------------------------------------------------------

#_0F872B: SEP #$20

#_0F872D: LDA.b #$01
#_0F872F: STA.l $7E22FD

#_0F8733: PLB

#_0F8734: PLP
#_0F8735: RTL

;===================================================================================================

routine0F8736:
#_0F8736: REP #$20

#_0F8738: LDA.w $0F2D
#_0F873B: AND.w #$0040
#_0F873E: BNE .loop

#_0F8740: RTL

;---------------------------------------------------------------------------------------------------

.loop
#_0F8741: REP #$30

#_0F8743: LDA.w #$3DC4
#_0F8746: STA.w $0102

#_0F8749: LDA.w #$0004
#_0F874C: STA.w $0104

#_0F874F: LDA.w $0A13
#_0F8752: LSR A
#_0F8753: LSR A
#_0F8754: LSR A
#_0F8755: LSR A
#_0F8756: AND.w #$000F
#_0F8759: INC A
#_0F875A: ORA.w #$2000
#_0F875D: STA.w $0106

#_0F8760: LDA.w $0A13
#_0F8763: AND.w #$000F
#_0F8766: INC A
#_0F8767: ORA.w #$2000
#_0F876A: STA.w $0108

#_0F876D: LDA.w $0A12
#_0F8770: LSR A
#_0F8771: LSR A
#_0F8772: LSR A
#_0F8773: LSR A
#_0F8774: AND.w #$000F
#_0F8777: INC A
#_0F8778: ORA.w #$2000
#_0F877B: STA.w $010A

#_0F877E: LDA.w $0A12
#_0F8781: AND.w #$000F
#_0F8784: INC A
#_0F8785: ORA.w #$2000
#_0F8788: STA.w $010C

#_0F878B: LDA.w #$0001
#_0F878E: STA.w $0100
#_0F8791: JSL AddSelfAsVector

#_0F8795: LDA.w $0F2B
#_0F8798: BIT.w #$0040
#_0F879B: BNE .pressed_x

#_0F879D: BIT.w #$0080
#_0F87A0: BNE .pressed_a

#_0F87A2: BIT.w #$0800
#_0F87A5: BEQ .didnt_press_up

#_0F87A7: INC.w $0A12

.didnt_press_up
#_0F87AA: BIT.w #$0400
#_0F87AD: BEQ .didnt_press_down

#_0F87AF: DEC.w $0A12

.didnt_press_down
#_0F87B2: BIT.w #$0200
#_0F87B5: BEQ .didnt_press_left

#_0F87B7: LDA.w $0A12
#_0F87BA: CLC
#_0F87BB: ADC.w #$0010
#_0F87BE: STA.w $0A12

.didnt_press_left
#_0F87C1: LDA.w $0F2B
#_0F87C4: BIT.w #$0100
#_0F87C7: BEQ .didnt_press_right

#_0F87C9: LDA.w $0A12
#_0F87CC: SEC
#_0F87CD: SBC.w #$0010
#_0F87D0: STA.w $0A12

#_0F87D3: JMP .loop

;---------------------------------------------------------------------------------------------------

.didnt_press_right
#_0F87D6: LDA.w $0F2B
#_0F87D9: BIT.w #$0020
#_0F87DC: BEQ .didnt_press_left_shoulder

#_0F87DE: LDA.w $0A12
#_0F87E1: SEC
#_0F87E2: SBC.w #$4000
#_0F87E5: STA.w $0A12

#_0F87E8: JMP .loop

;---------------------------------------------------------------------------------------------------

.didnt_press_left_shoulder
#_0F87EB: LDA.w $0F2B
#_0F87EE: BIT.w #$0010
#_0F87F1: BNE .didnt_press_right_shoulder

#_0F87F3: JMP .loop

;---------------------------------------------------------------------------------------------------

.didnt_press_right_shoulder
#_0F87F6: LDA.w $0A12
#_0F87F9: CLC
#_0F87FA: ADC.w #$4000
#_0F87FD: STA.w $0A12

#_0F8800: JMP .loop

;---------------------------------------------------------------------------------------------------

.pressed_a
#_0F8803: JSL LoadClassyMessage

#_0F8807: RTL

;---------------------------------------------------------------------------------------------------

.pressed_x
#_0F8808: JSL DarkenScreen
#_0F880C: JSL routine02C3FC
#_0F8810: JSL BrightenScreen

#_0F8814: JSL LoadClassyMessage

#_0F8818: RTL

;===================================================================================================

routine0F8819:
#_0F8819: PHP

#_0F881A: PHB
#_0F881B: PHK
#_0F881C: PLB

#_0F881D: SEP #$20

#_0F881F: LDA.w $0CF3
#_0F8822: BEQ .continue

#_0F8824: JMP .exit

.continue
#_0F8827: LDA.b #$00
#_0F8829: JSL routine02C10F_long

#_0F882D: LDA.b #$00
#_0F882F: JSL routine0F8836

.exit
#_0F8833: PLB

#_0F8834: PLP
#_0F8835: RTL

;===================================================================================================

routine0F8836:
#_0F8836: PHP

#_0F8837: PHB
#_0F8838: PHK
#_0F8839: PLB

#_0F883A: SEP #$30
#_0F883C: STA.w $0E0E
#_0F883F: STZ.w $0E0F

#_0F8842: STZ.w $0A58

#_0F8845: LDA.b #$80
#_0F8847: STA.w $0F0E
#_0F884A: STZ.w $0F0D

#_0F884D: LDA.b #$FF
#_0F884F: STA.w $0F7F

#_0F8852: LDA.b #$01
#_0F8854: STA.w NMITIMEN
#_0F8857: STA.w $0F00

#_0F885A: LDA.b #$80
#_0F885C: STA.w INIDISP
#_0F885F: STA.w $0F43

#_0F8862: JSL Reset_OAMrelatedWRAM

#_0F8866: LDA.b #$3B
#_0F8868: JSL routine02F609
#_0F886C: JSR routine0F8B94

;---------------------------------------------------------------------------------------------------

#_0F886F: LDA.b #$60
#_0F8871: STA.w OBSEL
#_0F8874: STA.w $0F44

#_0F8877: LDA.b #$09
#_0F8879: STA.w BGMODE

#_0F887C: LDA.b #$22
#_0F887E: STA.w BG34NBA

#_0F8881: LDA.b #$3C
#_0F8883: STA.w BG3SC

#_0F8886: LDA.b #$14
#_0F8888: STA.w TM

#_0F888B: LDA.b #$04
#_0F888D: STA.w TS

#_0F8890: LDA.b #$02
#_0F8892: STA.w CGWSEL

#_0F8895: LDA.b #$10
#_0F8897: STA.w CGADSUB
#_0F889A: STA.w $0F74

#_0F889D: LDA.b #$81
#_0F889F: STA.w NMITIMEN
#_0F88A2: STA.w $0F00

#_0F88A5: LDA.b #$00
#_0F88A7: STA.w INIDISP
#_0F88AA: STA.w $0F43

#_0F88AD: LDA.b #$00
#_0F88AF: JSL routine02FC6E

;---------------------------------------------------------------------------------------------------

#_0F88B3: SEP #$20

#_0F88B5: STZ.w BG3HOFS
#_0F88B8: STZ.w BG3HOFS
#_0F88BB: STZ.w BG3VOFS
#_0F88BE: STZ.w BG3VOFS

#_0F88C1: JSL BrightenScreen

#_0F88C5: LDA.b #$50 ; SONG 50
#_0F88C7: JSL Write_to_APU_transferrable

#_0F88CB: LDA.b #$01
#_0F88CD: STA.w $0EFE

#_0F88D0: SEP #$30

#_0F88D2: STZ.w $09F3

;---------------------------------------------------------------------------------------------------

.loop
#_0F88D5: JSL AddSelfAsVectorAndMakeSpace

#_0F88D9: SEP #$10

#_0F88DB: LDY.w $09F3

#_0F88DE: REP #$20

#_0F88E0: LDA.w data0F89B1,Y
#_0F88E3: AND.w #$00FF
#_0F88E6: STA.w $1AA0

#_0F88E9: LDA.w #$0014
#_0F88EC: STA.w $1A60

#_0F88EF: LDA.w #$0008
#_0F88F2: STA.w $0000
#_0F88F5: STZ.w $0040

#_0F88F8: SEP #$20

#_0F88FA: LDA.b #$80
#_0F88FC: STA.w $1A00
#_0F88FF: STA.w $1A20

#_0F8902: REP #$20

#_0F8904: LDA.w $0F2B
#_0F8907: BIT.w #$1080
#_0F890A: BNE .pressed_start_or_a

#_0F890C: BIT.w #$8000
#_0F890F: BEQ .didnt_press_b

#_0F8911: JMP .branch0F899D

;---------------------------------------------------------------------------------------------------

.didnt_press_b
; test for select, up, down
#_0F8914: BIT.w #$2C00
#_0F8917: BEQ .loop

#_0F8919: SEP #$20

#_0F891B: LDA.b #$01 ; SFX 01
#_0F891D: JSL Write_to_APU_transferrable

#_0F8921: LDA.w $09F3
#_0F8924: INC A
#_0F8925: AND.b #$01
#_0F8927: STA.w $09F3

#_0F892A: BRA .loop

;---------------------------------------------------------------------------------------------------

.pressed_start_or_a
#_0F892C: LDA.w $09F3
#_0F892F: STA.w $0E0C

#_0F8932: JSL routine0F89B3

#_0F8936: SEP #$20

#_0F8938: LDA.w $0A58
#_0F893B: BEQ .branch0F8946

#_0F893D: LDA.w $0E02
#_0F8940: STA.w $09F3

#_0F8943: JMP .loop

;---------------------------------------------------------------------------------------------------

.branch0F8946
#_0F8946: LDA.w $0E0E
#_0F8949: BNE .branch0F896B

#_0F894B: LDA.w $0E0C
#_0F894E: STA.w $09F3

#_0F8951: JSL LoadSaveFile
#_0F8955: JSL routine00D2C8_long

#_0F8959: LDA.w $07E1
#_0F895C: CMP.b #$12
#_0F895E: BCS .branch0F8965

#_0F8960: LDA.w $0A58
#_0F8963: BEQ .branch0F8996

.branch0F8965
#_0F8965: JSR routine0F8D97

#_0F8968: JMP .loop

;---------------------------------------------------------------------------------------------------

.branch0F896B
#_0F896B: PHP

#_0F896C: JSL routine00D2C8_long

#_0F8970: SEP #$20
#_0F8972: LDA.w $070C
#_0F8975: STA.w $046C

#_0F8978: LDA.w $070D
#_0F897B: STA.w $046D

#_0F897E: LDA.w $0710
#_0F8981: STA.w $046B

#_0F8984: LDA.w $040D
#_0F8987: STA.w $046A

#_0F898A: JSL routine00D2C8_long

#_0F898E: PLP

#_0F898F: LDA.w $0E0C
#_0F8992: JSL routine02D3F7

;---------------------------------------------------------------------------------------------------

.branch0F8996
#_0F8996: JSL DarkenScreen

#_0F899A: PLB

#_0F899B: PLP
#_0F899C: RTL

;---------------------------------------------------------------------------------------------------

.branch0F899D
#_0F899D: SEP #$20

#_0F899F: LDA.b #$FF
#_0F89A1: STA.w $0A58

#_0F89A4: LDA.b #$01
#_0F89A6: STA.w $0CF3

#_0F89A9: LDA.b #$03 ; SFX 03
#_0F89AB: JSL Write_to_APU_transferrable
#_0F89AF: BRA .branch0F8996

;---------------------------------------------------------------------------------------------------

data0F89B1:
#_0F89B1: db $1F, $6F

;===================================================================================================

routine0F89B3:
#_0F89B3: PHP

#_0F89B4: PHB
#_0F89B5: PHK
#_0F89B6: PLB

#_0F89B7: JSL Reset_OAMrelatedWRAM

#_0F89BB: SEP #$20

#_0F89BD: LDA.b #$02 ; SFX 02
#_0F89BF: JSL Write_to_APU_transferrable

#_0F89C3: STZ.w $0A58

#_0F89C6: REP #$30

#_0F89C8: LDA.w $09F3
#_0F89CB: AND.w #$00FF
#_0F89CE: STA.w $0E02

#_0F89D1: ASL A
#_0F89D2: TAY

#_0F89D3: LDA.w SaveOrLoadPickVRAM,Y
#_0F89D6: STA.w $0E00

#_0F89D9: LDY.w #$0000

.branch0F89DC
#_0F89DC: LDX.w #$0000

.branch0F89DF
#_0F89DF: LDA.w data0F8B02,Y
#_0F89E2: STA.w $0106,X

#_0F89E5: INX
#_0F89E6: INX

#_0F89E7: INY
#_0F89E8: INY
#_0F89E9: CPX.w #$0010
#_0F89EC: BNE .branch0F89DF

#_0F89EE: CPY.w #$0010
#_0F89F1: BNE .branch0F89FB

#_0F89F3: LDA.w $0E02
#_0F89F6: INC A
#_0F89F7: INC A
#_0F89F8: STA.w $0112

.branch0F89FB
#_0F89FB: LDA.w $0E00
#_0F89FE: STA.w $0102

#_0F8A01: LDA.w #$0008
#_0F8A04: STA.w $0104

#_0F8A07: LDA.w #$0001
#_0F8A0A: STA.w $0100

#_0F8A0D: PHY
#_0F8A0E: JSL AddSelfAsVectorAndMakeSpace
#_0F8A12: PLY

#_0F8A13: LDA.w $0E00
#_0F8A16: CLC
#_0F8A17: ADC.w #$0020
#_0F8A1A: STA.w $0E00

#_0F8A1D: CPY.w #$0080
#_0F8A20: BNE .branch0F89DC

;---------------------------------------------------------------------------------------------------

#_0F8A22: SEP #$30

#_0F8A24: STZ.w $09F3

.loop
#_0F8A27: JSL AddSelfAsVectorAndMakeSpace

#_0F8A2B: SEP #$10

#_0F8A2D: LDY.w $09F3

#_0F8A30: REP #$20

#_0F8A32: LDA.w data0F8B92,Y
#_0F8A35: AND.w #$00FF
#_0F8A38: STA.w $1AA0

#_0F8A3B: LDA.w $0E02
#_0F8A3E: BEQ .branch0F8A4A

#_0F8A40: LDA.w $1AA0
#_0F8A43: CLC
#_0F8A44: ADC.w #$0050
#_0F8A47: STA.w $1AA0

.branch0F8A4A
#_0F8A4A: LDA.w #$0014
#_0F8A4D: STA.w $1A60

#_0F8A50: LDA.w #$0008
#_0F8A53: STA.w $0000
#_0F8A56: STZ.w $0040

#_0F8A59: SEP #$20

#_0F8A5B: LDA.b #$80
#_0F8A5D: STA.w $1A00
#_0F8A60: STA.w $1A20

#_0F8A63: REP #$20

#_0F8A65: LDA.w $0F2B
#_0F8A68: BIT.w #$1080
#_0F8A6B: BNE .pressed_start_or_a

#_0F8A6D: BIT.w #$8000
#_0F8A70: BNE .pressed_b

; test for select, up, down
#_0F8A72: BIT.w #$2C00
#_0F8A75: BEQ .loop

#_0F8A77: SEP #$20

#_0F8A79: LDA.b #$01 ; SFX 01
#_0F8A7B: JSL Write_to_APU_transferrable

#_0F8A7F: LDA.w $09F3
#_0F8A82: INC A
#_0F8A83: AND.b #$01
#_0F8A85: STA.w $09F3

#_0F8A88: BRA .loop

;---------------------------------------------------------------------------------------------------

.pressed_start_or_a
#_0F8A8A: SEP #$20

#_0F8A8C: LDA.w $09F3
#_0F8A8F: BEQ .branch0F8A9E

.pressed_b
#_0F8A91: SEP #$20

#_0F8A93: LDA.b #$FF
#_0F8A95: STA.w $0A58

#_0F8A98: LDA.b #$03 ; SFX 03
#_0F8A9A: JSL Write_to_APU_transferrable

.branch0F8A9E
#_0F8A9E: JSL Reset_OAMrelatedWRAM

#_0F8AA2: REP #$30
#_0F8AA4: LDX.w #$0000
#_0F8AA7: LDA.w #$00CF

.branch0F8AAA
#_0F8AAA: STA.w $0106,X

#_0F8AAD: INX
#_0F8AAE: INX

#_0F8AAF: CPX.w #$0010
#_0F8AB2: BNE .branch0F8AAA

#_0F8AB4: LDY.w #$0006

;---------------------------------------------------------------------------------------------------

.branch0F8AB7
#_0F8AB7: PHY

#_0F8AB8: LDA.w #$0001
#_0F8ABB: STA.w $0100

#_0F8ABE: JSL AddSelfAsVectorAndMakeSpace

#_0F8AC2: LDA.w $0102
#_0F8AC5: SEC
#_0F8AC6: SBC.w #$0020
#_0F8AC9: STA.w $0102

#_0F8ACC: PLY
#_0F8ACD: DEY
#_0F8ACE: BPL .branch0F8AB7

;---------------------------------------------------------------------------------------------------

#_0F8AD0: LDX.w #$0000

.branch0F8AD3
#_0F8AD3: LDA.w data0F8B82,X
#_0F8AD6: STA.w $0106,X

#_0F8AD9: INX
#_0F8ADA: INX
#_0F8ADB: CPX.w #$0010
#_0F8ADE: BNE .branch0F8AD3

;---------------------------------------------------------------------------------------------------

#_0F8AE0: LDA.w $0E02
#_0F8AE3: INC A
#_0F8AE4: INC A
#_0F8AE5: STA.w $0112

#_0F8AE8: LDA.w #$0001
#_0F8AEB: STA.w $0100

#_0F8AEE: JSL AddSelfAsVectorAndMakeSpace

#_0F8AF2: SEP #$20

#_0F8AF4: LDA.w $0A58
#_0F8AF7: BNE .exit_silently

#_0F8AF9: LDA.b #$02 ; SFX 02
#_0F8AFB: JSL Write_to_APU_transferrable

.exit_silently
#_0F8AFF: PLB

#_0F8B00: PLP
#_0F8B01: RTL

data0F8B02:
#_0F8B02: dw $00D8, $0010, $0013, $0016, $000F, $00CF, $00CF, $40D8 ; " FILE   "
#_0F8B12: dw $00DA, $00CF, $00CF, $009E, $00CF, $00CF, $00CF, $40DA ; "   ゛    "
#_0F8B22: dw $00DA, $0026, $0026, $0037, $0031, $002A, $0095, $40DA ; " いいてすか? "
#_0F8B32: dw $00DA, $00CF, $00CF, $00CF, $00CF, $00CF, $00CF, $40DA ; "        "
#_0F8B42: dw $00DA, $00CF, $00CF, $003E, $0026, $00CF, $00CF, $40DA ; "   はい   "
#_0F8B52: dw $00DA, $00CF, $00CF, $00CF, $00CF, $00CF, $00CF, $40DA ; "        "
#_0F8B62: dw $00DA, $00CF, $00CF, $0026, $0026, $0028, $00CF, $40DA ; "   いいえ  "
#_0F8B72: dw $80D8, $80D9, $80D9, $80D9, $80D9, $80D9, $80D9, $C0D8 ; "        "


data0F8B82:
#_0F8B82: dw $00CF, $0010, $0013, $0016, $000F, $00CF, $00CF, $00CF ; " FILE   "

data0F8B92:
#_0F8B92: db $3F, $4F

;===================================================================================================

routine0F8B94:
#_0F8B94: PHP
#_0F8B95: REP #$30

#_0F8B97: LDA.w #$3C43 ; $7886 in VRAM
#_0F8B9A: STA.w VMADDL

#_0F8B9D: LDA.w #$009E ; TODO dakuten?
#_0F8BA0: STA.w VMDATAL

#_0F8BA3: LDA.w #$3C63 ; $78C6 in VRAM
#_0F8BA6: STA.w VMADDL

#_0F8BA9: LDA.w $0E0E
#_0F8BAC: ASL A
#_0F8BAD: ASL A
#_0F8BAE: ASL A
#_0F8BAF: ASL A
#_0F8BB0: TAX

#_0F8BB1: LDY.w #$0000

.next_character
#_0F8BB4: LDA.w SaveOrLoadPickText,X
#_0F8BB7: AND.w #$00FF
#_0F8BBA: STA.w VMDATAL

#_0F8BBD: INX
#_0F8BBE: INY
#_0F8BBF: CPY.w #$0010
#_0F8BC2: BNE .next_character

#_0F8BC4: JSR routine0F8E09

;---------------------------------------------------------------------------------------------------

#_0F8BC7: LDX.w #$0000
#_0F8BCA: LDY.w #$0000

.branch0F8BCD
#_0F8BCD: PHX
#_0F8BCE: PHY

#_0F8BCF: LDA.w data0F8D93,Y
#_0F8BD2: STA.w $0E02

#_0F8BD5: LDA.w SaveOrLoadPickVRAM,Y
#_0F8BD8: INC A
#_0F8BD9: STA.w VMADDL
#_0F8BDC: STA.w $0E04

#_0F8BDF: LDA.w #$0010
#_0F8BE2: STA.w VMDATAL

#_0F8BE5: LDA.w #$0013
#_0F8BE8: STA.w VMDATAL

#_0F8BEB: LDA.w #$0016
#_0F8BEE: STA.w VMDATAL

#_0F8BF1: LDA.w #$000F
#_0F8BF4: STA.w VMDATAL

#_0F8BF7: LDA.w #$00CF
#_0F8BFA: STA.w VMDATAL

#_0F8BFD: TXA
#_0F8BFE: INC A
#_0F8BFF: INC A
#_0F8C00: STA.w VMDATAL
#_0F8C03: JSL SRAM_VerifyChecksum
#_0F8C07: BCC .branch0F8C0C

#_0F8C09: JMP .branch0F8D16

.branch0F8C0C
#_0F8C0C: STZ.w $0A33
#_0F8C0F: LDX.w $0E02

#_0F8C12: LDA.l $7000E1,X
#_0F8C16: AND.w #$00FF
#_0F8C19: CMP.w #$0012
#_0F8C1C: BCC .branch0F8C21

#_0F8C1E: JMP .branch0F8D25

.branch0F8C21
#_0F8C21: STA.w $0A39

#_0F8C24: SEP #$20
#_0F8C26: LDA.b #$08
#_0F8C28: STA.w $00C5

; TODO label for this
#_0F8C2B: REP #$20
#_0F8C2D: LDA.w #TerminalDestinationNamePointers
#_0F8C30: STA.w $00C3
#_0F8C33: JSL WriteIndexedEntityNameToBuffer_long

#_0F8C37: LDA.w $0E04
#_0F8C3A: CLC
#_0F8C3B: ADC.w #$0009
#_0F8C3E: STA.w VMADDL
#_0F8C41: PHA
#_0F8C42: LDA.w #$00CF
#_0F8C45: STA.w VMDATAL
#_0F8C48: PLA
#_0F8C49: INC A
#_0F8C4A: JSR routine0F8D2E
#_0F8C4D: LDA.w #$0049
#_0F8C50: STA.w $0E06
#_0F8C53: LDA.w $0E02
#_0F8C56: CLC
#_0F8C57: ADC.w #$0100
#_0F8C5A: TAX
#_0F8C5B: LDY.w #$0000

.branch0F85CE
#_0F8C5E: LDA.l $700000,X
#_0F8C62: AND.w #$4000
#_0F8C65: BNE .branch0F8C6A

#_0F8C67: JMP .branch0F8D07

.branch0F8C6A
#_0F8C6A: PHY
#_0F8C6B: PHX
#_0F8C6C: STZ.w $0A33
#_0F8C6F: PHY
#_0F8C70: PHX
#_0F8C71: PHP
#_0F8C72: TYA
#_0F8C73: ASL A
#_0F8C74: ASL A
#_0F8C75: ASL A
#_0F8C76: CLC
#_0F8C77: ADC.w $0E02
#_0F8C7A: TAX
#_0F8C7B: LDY.w #$0008

.branch0F8C7E
#_0F8C7E: LDA.l $700710,X
#_0F8C82: AND.w #$00FF
#_0F8C85: CMP.w #$00FF
#_0F8C88: BEQ .branch0F8C92

#_0F8C8A: JSL WriteNextMessageChar
#_0F8C8E: INX
#_0F8C8F: DEY
#_0F8C90: BNE .branch0F8C7E

.branch0F8C92
#_0F8C92: PLP
#_0F8C93: PLX
#_0F8C94: PLY
#_0F8C95: LDA.w $0E04
#_0F8C98: CLC
#_0F8C99: ADC.w $0E06
#_0F8C9C: JSR routine0F8D2E

#_0F8C9F: LDA.w $0E04
#_0F8CA2: CLC
#_0F8CA3: ADC.w $0E06
#_0F8CA6: CLC
#_0F8CA7: ADC.w #$000A
#_0F8CAA: PHA
#_0F8CAB: INC A
#_0F8CAC: SEC
#_0F8CAD: SBC.w #$0020
#_0F8CB0: STA.w VMADDL

; Hard coded write for レベル:
#_0F8CB3: LDA.w #$009E
#_0F8CB6: STA.w VMDATAL

#_0F8CB9: PLA
#_0F8CBA: STA.w VMADDL

#_0F8CBD: LDA.w #$0086
#_0F8CC0: STA.w VMDATAL

#_0F8CC3: LDA.w #$0079
#_0F8CC6: STA.w VMDATAL

#_0F8CC9: LDA.w #$0085
#_0F8CCC: STA.w VMDATAL

#_0F8CCF: LDA.w #$009A
#_0F8CD2: STA.w VMDATAL

#_0F8CD5: PHY
#_0F8CD6: PHX
#_0F8CD7: LDA.l $70000A,X

#_0F8CDB: LDX.w #$0000
#_0F8CDE: LDY.w #$000A
#_0F8CE1: JSL DivisionBig_XA_by_Y

#_0F8CE5: LDA.w $0E80
#_0F8CE8: AND.w #$00FF
#_0F8CEB: INC A
#_0F8CEC: STA.w VMDATAL

#_0F8CEF: LDA.w $0E86
#_0F8CF2: AND.w #$00FF
#_0F8CF5: INC A
#_0F8CF6: STA.w VMDATAL

#_0F8CF9: PLX
#_0F8CFA: PLY

#_0F8CFB: LDA.w $0E06
#_0F8CFE: CLC
#_0F8CFF: ADC.w #$0040
#_0F8D02: STA.w $0E06

#_0F8D05: PLX
#_0F8D06: PLY

.branch0F8D07
#_0F8D07: TXA
#_0F8D08: CLC
#_0F8D09: ADC.w #$0060
#_0F8D0C: TAX
#_0F8D0D: INY
#_0F8D0E: CPY.w #$0004
#_0F8D11: BEQ .branch0F8D16
#_0F8D13: JMP .branch0F85CE

.branch0F8D16
#_0F8D16: PLY
#_0F8D17: PLX

#_0F8D18: INX
#_0F8D19: INY
#_0F8D1A: INY
#_0F8D1B: CPX.w #$0002
#_0F8D1E: BEQ .exit

#_0F8D20: JMP .branch0F8BCD

.exit
#_0F8D23: PLP
#_0F8D24: RTS

.branch0F8D25
#_0F8D25: LDA.w #$00FF
#_0F8D28: STA.l $700FFF,X
#_0F8D2C: BRA .branch0F8D16

routine0F8D2E:
#_0F8D2E: PHX
#_0F8D2F: PHY
#_0F8D30: PHP
#_0F8D31: STA.w VMADDL
#_0F8D34: STA.w $0E00
#_0F8D37: LDX.w #$0000
#_0F8D3A: TXY

.branch0F8D3B
#_0F8D3B: LDA.w $0900,X
#_0F8D3E: STA.w VMDATAL
#_0F8D41: INX
#_0F8D42: INX
#_0F8D43: INY
#_0F8D44: CPX.w $0A33
#_0F8D47: BNE .branch0F8D3B

#_0F8D49: LDA.w #$00CF
#_0F8D4C: STA.w VMDATAL
#_0F8D4F: LDA.w $0E00
#_0F8D52: SEC
#_0F8D53: SBC.w #$0020
#_0F8D56: STA.w VMADDL
#_0F8D59: LDX.w #$0000
#_0F8D5C: TXY

.branch0F8D5D
#_0F8D5D: LDA.w $0940,X
#_0F8D60: STA.w VMDATAL

#_0F8D63: INX
#_0F8D64: INX
#_0F8D65: INY
#_0F8D66: CPX.w $0A33
#_0F8D69: BNE .branch0F8D5D

#_0F8D6B: PLP

#_0F8D6C: PLY
#_0F8D6D: PLX

#_0F8D6E: RTS

;===================================================================================================

SaveOrLoadPickText:
#_0F8D6F: db $38, $3D, $78, $8B, $5E, $85, $51, $CF ; "とのファイルを "
#_0F8D77: db $4A, $44, $2E, $44, $43, $31, $2A, $95 ; "よみこみますか?"

#_0F8D7F: db $38, $3D, $78, $8B, $5E, $85, $3A, $CF ; "とのファイルに "
#_0F8D87: db $2B, $4F, $2C, $30, $43, $31, $2A, $95 ; "きろくしますか?"

;---------------------------------------------------------------------------------------------------

SaveOrLoadPickVRAM:
#_0F8D8F: dw $3CC2 ; $7984 in VRAM
#_0F8D8F: dw $3E02 ; $7C04 in VRAM

;---------------------------------------------------------------------------------------------------

data0F8D93:
#_0F8D93: db $00,$00,$00,$10

;===================================================================================================

routine0F8D97:
#_0F8D97: SEP #$20

#_0F8D99: LDA.b #$04 ; SFX 04
#_0F8D9B: JSL Write_to_APU_transferrable

#_0F8D9F: REP #$30

#_0F8DA1: LDA.w $09F3
#_0F8DA4: AND.w #$00FF
#_0F8DA7: ASL A
#_0F8DA8: TAY

#_0F8DA9: LDA.w .vram_address,Y
#_0F8DAC: STA.w $0102

#_0F8DAF: LDA.w #$0007
#_0F8DB2: STA.w $0104

#_0F8DB5: LDY.w #$0000
#_0F8DB8: TYX

.next_char
#_0F8DB9: LDA.w .text,Y
#_0F8DBC: AND.w #$00FF
#_0F8DBF: STA.w $0106,X
#_0F8DC2: INX
#_0F8DC3: INX
#_0F8DC4: INY
#_0F8DC5: CPY.w #$0007
#_0F8DC8: BNE .next_char

#_0F8DCA: LDA.w #$0001
#_0F8DCD: STA.w $0100

.wait
#_0F8DD0: JSL AddSelfAsVectorAndMakeSpace

#_0F8DD4: LDA.w $0F2B
#_0F8DD7: BEQ .wait

#_0F8DD9: SEP #$20
#_0F8DDB: LDA.b #$02 ; SFX 02
#_0F8DDD: JSL Write_to_APU_transferrable

#_0F8DE1: REP #$20
#_0F8DE3: LDX.w #$0000

.next_clear
#_0F8DE6: LDA.w #$00CF
#_0F8DE9: STA.w $0106,X

#_0F8DEC: INX
#_0F8DED: INX
#_0F8DEE: CPX.w #$000E
#_0F8DF1: BNE .next_clear

#_0F8DF3: LDA.w #$0001
#_0F8DF6: STA.w $0100
#_0F8DF9: JSL AddSelfAsVectorAndMakeSpace
#_0F8DFD: RTS

.vram_address
#_0F8DFE: dw $3D0C ; $7A18 in VRAM
#_0F8E00: dw $3E4C ; $7C98 in VRAM

.text
#_0F8E02: db $18, $19, $CF, $0E, $0B, $1E, $0B ; "NO DATA"

;===================================================================================================

routine0F8E09:
#_0F8E09: REP #$30

#_0F8E0B: LDA.w #$3CCA
#_0F8E0E: STA.w $0E00

#_0F8E11: JSR routine0F8E1E

#_0F8E14: LDA.w #$3E0A
#_0F8E17: STA.w $0E00

#_0F8E1A: JSR routine0F8E1E

#_0F8E1D: RTS

;===================================================================================================

routine0F8E1E:
#_0F8E1E: LDX.w #$0000

.next_chunk
#_0F8E21: LDA.w $0E00
#_0F8E24: STA.w VMADDL

#_0F8E27: LDA.w data0F8E61,X
#_0F8E2A: CMP.w #$FFFF
#_0F8E2D: BNE .valid

#_0F8E2F: RTS

.valid
#_0F8E30: LDY.w data0F8E61+2,X
#_0F8E33: JSR .transfer_y_copies

#_0F8E36: LDA.w data0F8E61+4,X
#_0F8E39: LDY.w data0F8E61+6,X
#_0F8E3C: JSR .transfer_y_copies

#_0F8E3F: LDA.w data0F8E61+8,X
#_0F8E42: LDY.w data0F8E61+10,X
#_0F8E45: JSR .transfer_y_copies

#_0F8E48: LDA.w $0E00
#_0F8E4B: CLC
#_0F8E4C: ADC.w #$0020
#_0F8E4F: STA.w $0E00

#_0F8E52: TXA
#_0F8E53: CLC
#_0F8E54: ADC.w #$000C
#_0F8E57: TAX

#_0F8E58: BRA .next_chunk

;===================================================================================================

.transfer_y_copies
#_0F8E5A: STA.w VMDATAL

#_0F8E5D: DEY
#_0F8E5E: BNE .transfer_y_copies

#_0F8E60: RTS

;---------------------------------------------------------------------------------------------------

; groups of 3 sets of 4 bytes
data0F8E61:
#_0F8E61: dw $00D8, $0001
#_0F8E65: dw $00D9, $0011
#_0F8E69: dw $40D8, $0001

#_0F8E6D: dw $00DA, $0001
#_0F8E71: dw $00CF, $0011
#_0F8E75: dw $40DA, $0001

#_0F8E79: dw $00DA, $0001
#_0F8E7D: dw $00CF, $0011
#_0F8E81: dw $40DA, $0001

#_0F8E85: dw $00DA, $0001
#_0F8E89: dw $00CF, $0011
#_0F8E8D: dw $40DA, $0001

#_0F8E91: dw $00DA, $0001
#_0F8E95: dw $00CF, $0011
#_0F8E99: dw $40DA, $

#_0F8E9D: dw $00DA, $0001
#_0F8EA1: dw $00CF, $0011
#_0F8EA5: dw $40DA, $0001

#_0F8EA9: dw $00DA, $0001
#_0F8EAD: dw $00CF, $0011
#_0F8EB1: dw $40DA, $0001

#_0F8EB5: dw $80D8, $0001
#_0F8EB9: dw $80D9, $0011
#_0F8EBD: dw $C0D8, $0001

#_0F8EC1: dw $FFFF

;===================================================================================================
; This takes a single input A and turns it into a game state check
; xxxxxyyy
; y - bit to set [0-7]
; x - offset into $07C0 [0-31]
;
; returns with carry set to either true or false
;===================================================================================================
TestGameProgressBit:
#_0F8EC3: PHX
#_0F8EC4: PHP

#_0F8EC5: SEP #$30

#_0F8EC7: PHA
#_0F8EC8: AND.b #$07
#_0F8ECA: TAY

#_0F8ECB: PLA
#_0F8ECC: LSR A
#_0F8ECD: LSR A
#_0F8ECE: LSR A
#_0F8ECF: TAX

#_0F8ED0: PHB
#_0F8ED1: PHK
#_0F8ED2: PLB

#_0F8ED3: LDA.w $07C0,X
#_0F8ED6: AND.w .bits,Y
#_0F8ED9: BEQ .false

.true
#_0F8EDB: PLB
#_0F8EDC: PLP

#_0F8EDD: PLX

#_0F8EDE: SEC

#_0F8EDF: RTL

.false
#_0F8EE0: PLB
#_0F8EE1: PLP

#_0F8EE2: PLX

#_0F8EE3: CLC

#_0F8EE4: RTL

.bits
#_0F8EE5: db $01, $02, $04, $08, $10, $20, $40, $80

;===================================================================================================

WriteCharacterName:
#_0F8EED: SEP #$30

#_0F8EEF: ASL A
#_0F8EF0: ASL A
#_0F8EF1: ASL A
#_0F8EF2: TAY

#_0F8EF3: LDX.b #$08

.next_character
#_0F8EF5: LDA.w $0410,Y
#_0F8EF8: CMP.b #$FF
#_0F8EFA: BEQ .done

#_0F8EFC: JSL WriteNextMessageChar

#_0F8F00: INY

#_0F8F01: DEX
#_0F8F02: BNE .next_character

.done
#_0F8F04: RTL

;===================================================================================================

routine0F8F05:
#_0F8F05: PHP
#_0F8F06: SEP #$30

#_0F8F08: LDA.b #$1C
#_0F8F0A: JSL TestGameProgressBit
#_0F8F0E: BCS .branch0F8F23

#_0F8F10: LDA.b #$1B
#_0F8F12: JSL TestGameProgressBit
#_0F8F16: BCS .branch0F8F23

#_0F8F18: LDA.b #$19
#_0F8F1A: JSL TestGameProgressBit
#_0F8F1E: BCC .branch0F8F23

#_0F8F20: PLP
#_0F8F21: SEC

#_0F8F22: RTL

.branch0F8F23
#_0F8F23: PLP
#_0F8F24: CLC

#_0F8F25: RTL

;===================================================================================================

routine0F8F26:
#_0F8F26: PHP
#_0F8F27: SEP #$30

#_0F8F29: JSL routine0F8F05
#_0F8F2D: BCC .branch0F8F32

#_0F8F2F: INC.w $0B5F

.branch0F8F32
#_0F8F32: PLP
#_0F8F33: RTL

;===================================================================================================

routine0F8F34:
#_0F8F34: PHP
#_0F8F35: REP #$30

#_0F8F37: PHY

#_0F8F38: JSL routine0F8F05

#_0F8F3C: PLY
#_0F8F3D: BCC .fail

#_0F8F3F: LDA.w #$0134
#_0F8F42: STA.w $098C,Y

#_0F8F45: LDA.w #$0024
#_0F8F48: STA.w $09AC,Y

#_0F8F4B: LDA.w #$FFFF
#_0F8F4E: STA.w $0C13,Y

#_0F8F51: INY
#_0F8F52: INY

.fail
#_0F8F53: PLP
#_0F8F54: RTL

;===================================================================================================
; TODO is this checking for pascal?
routine0F8F55:
#_0F8F55: PHP
#_0F8F56: REP #$30

#_0F8F58: LDA.w $0BED
#_0F8F5B: CMP.w #$0134
#_0F8F5E: BEQ .succeed

#_0F8F60: LDA.w $0BEF
#_0F8F63: CMP.w #$0134
#_0F8F66: BEQ .succeed

#_0F8F68: PLP
#_0F8F69: CLC

#_0F8F6A: RTL

.succeed
#_0F8F6B: LDA.w #$008B
#_0F8F6E: STA.w $0C0B

#_0F8F71: LDA.w #$0012
#_0F8F74: STA.w $0C0D

#_0F8F77: LDA.w #$0037
#_0F8F7A: STA.w $0C0F

#_0F8F7D: STZ.w $0C11

#_0F8F80: PLP
#_0F8F81: SEC

#_0F8F82: RTL

;===================================================================================================
; TODO related to above
#routine0F8F83:
#_0F8F83: PHP
#_0F8F84: REP #$30

#_0F8F86: LDA.w $0BED
#_0F8F89: CMP.w #$0134
#_0F8F8C: BEQ .succeed

#_0F8F8E: LDA.w $0BEF
#_0F8F91: CMP.w #$0134
#_0F8F94: BEQ .succeed

#_0F8F96: LDA.w $0BF1
#_0F8F99: CMP.w #$0134
#_0F8F9C: BEQ .succeed

#_0F8F9E: PLP
#_0F8F9F: CLC

#_0F8FA0: RTL

;===================================================================================================
; TODO more pascal stuff?
routine0F8FA1:
#_0F8FA1: PHP
#_0F8FA2: REP #$30

#_0F8FA4: LDA.w $0BED
#_0F8FA7: CMP.w #$0134
#_0F8FAA: BEQ .succeed

#_0F8FAC: LDA.w $0BEF
#_0F8FAF: CMP.w #$0134
#_0F8FB2: BEQ .succeed

#_0F8FB4: LDA.w $0A3B
#_0F8FB7: AND.w #$0001
#_0F8FBA: BEQ .fail

#_0F8FBC: LDA.w $0BF1
#_0F8FBF: CMP.w #$0134
#_0F8FC2: BEQ .succeed

.fail
#_0F8FC4: PLP
#_0F8FC5: RTL

.succeed
#_0F8FC6: LDA.w #$001B
#_0F8FC9: JSL SetGameProgressBit_long

#_0F8FCD: PLP
#_0F8FCE: RTL

;===================================================================================================

routine0F8FCF:
#_0F8FCF: PHP

#_0F8FD0: PHB
#_0F8FD1: PHK
#_0F8FD2: PLB

#_0F8FD3: SEP #$30

#_0F8FD5: LDA.w $07E1
#_0F8FD8: ASL A
#_0F8FD9: CLC
#_0F8FDA: ADC.w $07E1
#_0F8FDD: CLC
#_0F8FDE: ADC.w $09F3
#_0F8FE1: TAY

#_0F8FE2: LDA.w $07E1
#_0F8FE5: ASL A
#_0F8FE6: TAX

#_0F8FE7: LDA.w $040F
#_0F8FEA: AND.b #$F0
#_0F8FEC: CMP.w data0F9007,X
#_0F8FEF: BEQ .branch0F8FF6

#_0F8FF1: CMP.w data0F9008,X
#_0F8FF4: BNE .branch0F8FFB

.branch0F8FF6
#_0F8FF6: LDA.w data0F9015,Y

#_0F8FF9: BRA .branch9F8FFE

.branch0F8FFB
#_0F8FFB: LDA.w data0F902A,Y

.branch9F8FFE
#_0F8FFE: STA.w $0A50
#_0F9001: STZ.w $0A51

#_0F9004: PLB

#_0F9005: PLP
#_0F9006: RTL

data0F9007:
#_0F9007: db $30

data0F9008:
#_0F9008: db $D0,$40,$C0,$50,$B0,$10,$F0,$80
#_0F9010: db $80,$20,$E0,$00,$00

data0F9015:
#_0F9015: db $1A,$1B,$2A,$1C,$1F,$2D,$20,$25
#_0F901D: db $21,$2A,$26,$33,$72,$73,$74,$34
#_0F9025: db $35,$24,$28,$31,$36

data0F902A:
#_0F902A: db $BC,$B5,$B9,$C3,$C4,$C5,$C5,$C6
#_0F9032: db $C7,$1E,$2B,$2C,$D2,$D3,$D9,$22
#_0F903A: db $29,$2A,$72,$73,$74

;===================================================================================================

routine0F903F:
#_0F903F: REP #$30

#_0F9041: LDA.w #$0000
#_0F9044: JSL routine02E98E

#_0F9048: LDY.w #$003C
#_0F904B: JSL RunFramesYTimes

#_0F904F: LDA.w #$0009 ; SFX 09
#_0F9052: JSL Write_to_APU_transferrable

#_0F9056: SEP #$20

#_0F9058: LDA.b #$0F

.darken
#_0F905A: STA.w INIDISP
#_0F905D: STA.w $0F43

#_0F9060: PHA

#_0F9061: LDY.w #$0003
#_0F9064: JSL RunFramesYTimes

#_0F9068: PLA
#_0F9069: DEC A
#_0F906A: BPL .darken

#_0F906C: REP #$20

#_0F906E: JSL GetNextTextByte_long
#_0F9072: AND.w #$00FF
#_0F9075: JSL routine0FE7FD

#_0F9079: RTL

;===================================================================================================

CheckInventoryForCoolSwordOrVase:
#_0F907A: REP #$30

#_0F907C: JSL routine03E0C5_long

#_0F9080: LDA.w $0B5F
#_0F9083: CMP.w #$000C
#_0F9086: BEQ .dont_relocate

#_0F9088: CMP.w #$000B
#_0F908B: BNE .dont_check_inventory

#_0F908D: LDA.w #$00FC ; belial's vase
#_0F9090: JSL LookForItemInInventory
#_0F9094: BCS .dont_relocate

.dont_check_inventory
#_0F9096: SEP #$30

#_0F9098: LDX.b #$00

.sword_swearch
#_0F909A: LDA.w $0781,X
#_0F909D: BEQ .nothing_in_slot

#_0F909F: LDA.w $0780,X
#_0F90A2: CMP.b #$19 ; hina tsurugi's sword
#_0F90A4: BEQ .have_valid_sword

#_0F90A6: CMP.b #$1D ; futsu-no-mitama
#_0F90A8: BEQ .have_valid_sword

#_0F90AA: CMP.b #$38 ; ame-no-murakumo
#_0F90AC: BEQ .have_valid_sword

#_0F90AE: CMP.b #$2A ; renki-no-ken
#_0F90B0: BEQ .have_valid_sword

.nothing_in_slot
#_0F90B2: INX
#_0F90B3: INX
#_0F90B4: CPX.b #$3C
#_0F90B6: BNE .sword_swearch

;---------------------------------------------------------------------------------------------------

.dont_relocate
#_0F90B8: JSL GetNextTextByte_long
#_0F90BC: RTL

.have_valid_sword
#_0F90BD: JSL GetNextTextByte_long
#_0F90C1: JSL RelocateTextPointer_long

#_0F90C5: RTL

;===================================================================================================

routine0F90C6:
#_0F90C6: SEP #$20

#_0F90C8: STZ.w $0A58

#_0F90CB: JSL routine03FB45

#_0F90CF: SEP #$20

#_0F90D1: LDA.w $0A58
#_0F90D4: BEQ .clear_value_that_is_obviously_already_zero

#_0F90D6: CMP.b #$FF
#_0F90D8: BEQ .dont_relocate

#_0F90DA: JSL GetNextTextByte_long
#_0F90DE: JSL RelocateTextPointer_long

#_0F90E2: RTL

.clear_value_that_is_obviously_already_zero
#_0F90E3: STZ.w $0A58

.dont_relocate
#_0F90E6: JSL GetNextTextByte_long

#_0F90EA: RTL

;===================================================================================================

routine0F90EB:
#_0F90EB: PHP

#_0F90EC: PHB
#_0F90ED: PHK
#_0F90EE: PLB

#_0F90EF: SEP #$30

#_0F90F1: LDA.w $0A50
#_0F90F4: PHA

#_0F90F5: LDX.b #$00

.check_next
#_0F90F7: LDA.w .sword_trades+0,X
#_0F90FA: CMP.b #$FF
#_0F90FC: BEQ .take_it

#_0F90FE: CMP.w $0BED
#_0F9101: BNE .branch0F9108

#_0F9103: LDA.w .sword_trades+1,X
#_0F9106: BRA .take_it

.branch0F9108
#_0F9108: INX
#_0F9109: INX
#_0F910A: BRA .check_next

;---------------------------------------------------------------------------------------------------

.take_it
#_0F910C: STA.w $0A50
#_0F910F: STZ.w $0A51
#_0F9112: JSL TakeItemFromSomewhere_long

#_0F9116: PLA

#_0F9117: STA.w $0A50
#_0F911A: STZ.w $0A51
#_0F911D: JSL AddItemToInventory_long

#_0F9121: LDA.w $0A58
#_0F9124: BNE .item_not_found

#_0F9126: REP #$30

#_0F9128: LDA.w $0BEF
#_0F912B: CMP.w #$0109 ; demon 0109
#_0F912E: BEQ .take_vase

#_0F9130: JSL routine0F84C1
#_0F9134: JSL GetNextTextByte_long

#_0F9138: PLB
#_0F9139: PLP
#_0F913A: RTL

;---------------------------------------------------------------------------------------------------

.item_not_found
#_0F913B: REP #$30

#_0F913D: LDA.w $0BED
#_0F9140: STA.w $0A50

#_0F9143: JSL AddItemToInventory_long
#_0F9147: JSL GetNextTextByte_long
#_0F914B: JSL RelocateTextPointer_long

#_0F914F: PLB

#_0F9150: PLP
#_0F9151: RTL

;---------------------------------------------------------------------------------------------------

.take_vase
#_0F9152: LDA.w #$00FC
#_0F9155: STA.w $0A50
#_0F9158: STZ.w $0A51
#_0F915B: JSL TakeItemFromSomewhere_long

#_0F915F: JSL GetNextTextByte_long

#_0F9163: PLB

#_0F9164: PLP
#_0F9165: RTL

.sword_trades
#_0F9166: db $2F, $19 ; hades hazuki for hina tsurugi's sword
#_0F9168: db $30, $1D ; angel's trumpet for futsu-no-mitama
#_0F916A: db $31, $38 ; luna blade for ame-no-murakumo
#_0F916C: db $2B, $2A ; ame-no-nuboko for renki-no-ken
#_0F916E: db $FF

;===================================================================================================
; 00 - status
; other - equip
;===================================================================================================
routine0F916F:
#_0F916F: SEP #$30

#_0F9171: LDA.w $0A3D
#_0F9174: PHA

#_0F9175: JSL TextCommand_ClearMessageBox_long

#_0F9179: JSL GetNextTextByte_long
#_0F917D: STA.w $0E00

#_0F9180: REP #$30

#_0F9182: LDA.w $0A22
#_0F9185: PHA

#_0F9186: LDA.w $0A24
#_0F9189: PHA

#_0F918A: LDA.w $0A26
#_0F918D: PHA

#_0F918E: LDA.w $00C2
#_0F9191: PHA

#_0F9192: LDA.w $00C0
#_0F9195: PHA

#_0F9196: JSR routine0F922C

#_0F9199: SEP #$30

#_0F919B: LDA.b #$1E
#_0F919D: STA.w $0F74
#_0F91A0: STA.w TM

#_0F91A3: LDA.b #$00
#_0F91A5: JSL ClearSomeBank7FBuffers

#_0F91A9: LDA.b #$00
#_0F91AB: JSL VRAM_From_7FXXXX

#_0F91AF: JSL AddSelfAsVectorAndMakeSpace

;---------------------------------------------------------------------------------------------------

#_0F91B3: LDA.w $0EEF
#_0F91B6: PHA
#_0F91B7: PHP

#_0F91B8: LDA.w $0E00
#_0F91BB: BNE .branch0F91C3

#_0F91BD: JSL routine01832A
#_0F91C1: BRA .branch0F91C7

.branch0F91C3
#_0F91C3: JSL routine01A176

.branch0F91C7
#_0F91C7: PLP

#_0F91C8: PLA
#_0F91C9: STA.w $0EEF

#_0F91CC: JSR routine0F92A6

#_0F91CF: LDA.b #$1F
#_0F91D1: STA.w $0F74
#_0F91D4: STA.w TM

#_0F91D7: JSL routine0F945E
#_0F91DB: JSL UpdateDialogBox

#_0F91DF: LDA.b #$07
#_0F91E1: STA.w $0A2A

#_0F91E4: JSL InitializeTextBoxToSizeForNewMessage
#_0F91E8: JSL routine00A056

#_0F91EC: REP #$20

#_0F91EE: LDA.w #$0018
#_0F91F1: STA.w $0A1E

#_0F91F4: LDA.w #$000C
#_0F91F7: STA.w $0A20

#_0F91FA: LDA.w #$0002
#_0F91FD: STA.w $0A1C

#_0F9200: LDA.w #$3DC4
#_0F9203: STA.w $0A1A

#_0F9206: STA.w $0980

#_0F9209: STZ.w $0A33

;---------------------------------------------------------------------------------------------------

#_0F920C: PLA
#_0F920D: STA.w $00C0

#_0F9210: PLA
#_0F9211: STA.w $00C2

#_0F9214: PLA
#_0F9215: STA.w $0A26

#_0F9218: PLA
#_0F9219: STA.w $0A24

#_0F921C: PLA
#_0F921D: STA.w $0A22

#_0F9220: SEP #$20

#_0F9222: PLA
#_0F9223: STA.w $0A3D

#_0F9226: LDA.b #$01
#_0F9228: STA.w $0A18

#_0F922B: RTL

;===================================================================================================

routine0F922C:
#_0F922C: PHP

#_0F922D: PHB
#_0F922E: PHK
#_0F922F: PLB

#_0F9230: REP #$30

#_0F9232: LDX.w #$0000

.next_chunk
#_0F9235: LDA.w data0F928C+0,X
#_0F9238: CMP.w #$FFFF
#_0F923B: BEQ .end_of_chunks

#_0F923D: STA.w $00D0

#_0F9240: LDA.w data0F928C+2,X
#_0F9243: STA.w $00D2

#_0F9246: LDA.w data0F928C+4,X
#_0F9249: STA.w $0E0E

#_0F924C: LDA.w data0F928C+6,X
#_0F924F: STA.w $00D4

#_0F9252: LDA.w #$007E
#_0F9255: STA.w $00D6

#_0F9258: SEP #$20

#_0F925A: LDY.w #$0000

.copy_next
#_0F925D: LDA.b [$D0],Y
#_0F925F: STA.b [$D4],Y

#_0F9261: INY
#_0F9262: CPY.w $0E0E
#_0F9265: BNE .copy_next

#_0F9267: REP #$20

#_0F9269: TXA
#_0F926A: CLC
#_0F926B: ADC.w #$0008
#_0F926E: TAX

#_0F926F: BRA .next_chunk

;---------------------------------------------------------------------------------------------------

.end_of_chunks
#_0F9271: JSL routine02E835

#_0F9275: REP #$30

#_0F9277: LDX.w #$0000

.copy_next_cgram
#_0F927A: LDA.l $7E2500,X
#_0F927E: STA.l $7E9800,X

#_0F9282: INX
#_0F9283: INX
#_0F9284: CPX.w #$0200
#_0F9287: BNE .copy_next_cgram

;---------------------------------------------------------------------------------------------------

#_0F9289: PLB

#_0F928A: PLP
#_0F928B: RTS

;===================================================================================================

data0F928C:
#_0F928C: dd $7E2000 : dw $0220, $7E8000
#_0F9294: dd $000000 : dw $0080, $7E8800
#_0F929C: dd $001A00 : dw $02C0, $7E9000
#_0F92A4: dw $FFFF

;===================================================================================================

routine0F92A6:
#_0F92A6: PHP
#_0F92A7: PHB
#_0F92A8: PHK
#_0F92A9: PLB

#_0F92AA: SEP #$30

#_0F92AC: LDA.b #$00
#_0F92AE: STZ.w $0F09

#_0F92B1: LDA.b #$00
#_0F92B3: STA.w DMA1MODE

#_0F92B6: LDA.b #CGDATA
#_0F92B8: STA.w DMA1PORT

#_0F92BB: LDA.b #$7E9800>>0
#_0F92BD: STA.w DMA1ADDRL
#_0F92C0: LDA.b #$7E9800>>8
#_0F92C2: STA.w DMA1ADDRH
#_0F92C5: LDA.b #$7E9800>>16
#_0F92C7: STA.w DMA1ADDRB

; $0200
#_0F92CA: LDA.b #$00
#_0F92CC: STA.w DMA1SIZEL
#_0F92CF: LDA.b #$02
#_0F92D1: STA.w DMA1SIZEH

#_0F92D4: LDA.b #$02
#_0F92D6: ORA.w $0F06
#_0F92D9: STA.w $0F06

#_0F92DC: JSL AddSelfAsVectorAndMakeSpace

;---------------------------------------------------------------------------------------------------

#_0F92E0: REP #$30

#_0F92E2: LDX.w #$0000

.next_chunk
#_0F92E5: LDA.w data0F928C+0,X
#_0F92E8: CMP.w #$FFFF
#_0F92EB: BEQ .end_of_chunks

#_0F92ED: STA.w $00D4

#_0F92F0: LDA.w data0F928C+2,X
#_0F92F3: STA.w $00D6

#_0F92F6: LDA.w data0F928C+4,X
#_0F92F9: STA.w $0E0E

#_0F92FC: LDA.w data0F928C+6,X
#_0F92FF: STA.w $00D0

#_0F9302: LDA.w #$007E
#_0F9305: STA.w $00D2

#_0F9308: SEP #$20
#_0F930A: LDY.w #$0000

.copy_next
#_0F930D: LDA.b [$D0],Y
#_0F930F: STA.b [$D4],Y

#_0F9311: INY
#_0F9312: CPY.w $0E0E
#_0F9315: BNE .copy_next

#_0F9317: REP #$20

#_0F9319: TXA
#_0F931A: CLC
#_0F931B: ADC.w #$0008
#_0F931E: TAX

#_0F931F: BRA .next_chunk

;---------------------------------------------------------------------------------------------------

.end_of_chunks
#_0F9321: SEP #$30

#_0F9323: LDA.w $0EEF
#_0F9326: BEQ .no_wait

#_0F9328: JSL routine02E32D

#_0F932C: JSL AddSelfAsVectorAndMakeSpace

#_0F9330: LDA.b #$FF
#_0F9332: STA.w $0EEF

.no_wait
#_0F9335: SEP #$20

#_0F9337: LDA.b #$1F
#_0F9339: STA.w TM
#_0F933C: STA.w $0F74

#_0F933F: PLB

#_0F9340: PLP
#_0F9341: RTS

;===================================================================================================

routine0F9342:
#_0F9342: PHP
#_0F9343: SEP #$20

#_0F9345: LDA.w $0F74
#_0F9348: CMP.b #$14
#_0F934A: BEQ .exit

#_0F934C: JSL routine02E835
#_0F9350: JSL AddSelfAsVectorAndMakeSpace

#_0F9354: SEP #$30

#_0F9356: LDA.b #$FF
#_0F9358: STA.w $0A71

#_0F935B: LDA.b #$1F
#_0F935D: STA.w $0F74
#_0F9360: STA.w TM

#_0F9363: LDA.b #$43
#_0F9365: STA.w $0F4B
#_0F9368: STA.w BG12NBA

#_0F936B: LDA.b #$38
#_0F936D: STA.w BG1SC
#_0F9370: STA.w $0F47

#_0F9373: LDA.b #$00
#_0F9375: JSL routine02FC6E

#_0F9379: REP #$20

#_0F937B: LDA.w #$FFFF
#_0F937E: STA.w $0A99
#_0F9381: STA.w $0A9A
#_0F9384: STA.w $0A9B
#_0F9387: STA.w $0A9C

#_0F938A: STZ.w $0A95
#_0F938D: STZ.w $0A96
#_0F9390: STZ.w $0A97
#_0F9393: STZ.w $0A98

#_0F9396: JSL routine0F9493

.exit
#_0F939A: PLP
#_0F939B: RTL

;===================================================================================================

routine0F939C:
#_0F939C: PHP

#_0F939D: JSL routine02E835
#_0F93A1: JSL AddSelfAsVectorAndMakeSpace

#_0F93A5: SEP #$30

#_0F93A7: LDA.b #$FF
#_0F93A9: STA.w $0A71

#_0F93AC: LDA.w $0EEF
#_0F93AF: AND.b #$0C
#_0F93B1: CMP.b #$08
#_0F93B3: BEQ .branch0F9414

#_0F93B5: LDX.b #$00
#_0F93B7: LDY.b #$01
#_0F93B9: JSL GraduallyFadeStuff

#_0F93BD: LDA.b #$FF
#_0F93BF: STA.w $0EEF

#_0F93C2: LDA.b #$43
#_0F93C4: STA.w $0F4B
#_0F93C7: STA.w BG12NBA

#_0F93CA: LDA.b #$38
#_0F93CC: STA.w BG1SC
#_0F93CF: STA.w $0F47

;---------------------------------------------------------------------------------------------------

#_0F93D2: LDA.b #$00
#_0F93D4: JSL ClearSomeBank7FBuffers

#_0F93D8: LDA.b #$00
#_0F93DA: JSL VRAM_From_7FXXXX
#_0F93DE: JSL AddSelfAsVectorAndMakeSpace

#_0F93E2: LDA.b #$01
#_0F93E4: JSL ClearSomeBank7FBuffers

#_0F93E8: LDA.b #$01
#_0F93EA: JSL VRAM_From_7FXXXX
#_0F93EE: JSL AddSelfAsVectorAndMakeSpace

;---------------------------------------------------------------------------------------------------

.clean_up
#_0F93F2: REP #$20

#_0F93F4: LDA.w #$FFFF
#_0F93F7: STA.w $0A99
#_0F93FA: STA.w $0A9A
#_0F93FD: STA.w $0A9B
#_0F9400: STA.w $0A9C

#_0F9403: STZ.w $0A95
#_0F9406: STZ.w $0A96
#_0F9409: STZ.w $0A97
#_0F940C: STZ.w $0A98
#_0F940F: STZ.w $0F4F

#_0F9412: PLP
#_0F9413: RTL

;---------------------------------------------------------------------------------------------------

.branch0F9414
#_0F9414: SEP #$20

#_0F9416: LDA.w $0F74
#_0F9419: AND.b #$FE
#_0F941B: STA.w $0F74
#_0F941E: STA.w TM

#_0F9421: LDA.b #$02
#_0F9423: STA.w $0F76
#_0F9426: STA.w TS

#_0F9429: LDA.b #$43
#_0F942B: STA.w $0F4B
#_0F942E: STA.w BG12NBA

#_0F9431: LDA.b #$38
#_0F9433: STA.w BG1SC
#_0F9436: STA.w $0F47

#_0F9439: LDA.b #$00
#_0F943B: JSL ClearSomeBank7FBuffers

#_0F943F: LDA.b #$00
#_0F9441: JSL VRAM_From_7FXXXX
#_0F9445: JSL AddSelfAsVectorAndMakeSpace

#_0F9449: LDA.w $0F74
#_0F944C: ORA.b #$01
#_0F944E: STA.w $0F74
#_0F9451: STA.w TM

#_0F9454: LDA.b #$03
#_0F9456: STA.w $0F76
#_0F9459: STA.w TS

#_0F945C: BRA .clean_up

;===================================================================================================

routine0F945E:
#_0F945E: PHP
#_0F945F: SEP #$20

#_0F9461: LDA.w $0404
#_0F9464: BEQ .branch0F946F

#_0F9466: LDA.w $0A18
#_0F9469: BNE .branch0F946F

#_0F946B: JSL routine0F84F6

.branch0F946F
#_0F946F: REP #$20

#_0F9471: LDA.w $1A74
#_0F9474: CMP.w #$0010
#_0F9477: BEQ .no_menu

#_0F9479: SEP #$30
#_0F947B: LDA.w $0A18
#_0F947E: BNE .no_menu

#_0F9480: JSL TriggerMenuGrow

.no_menu
#_0F9484: LDA.b #$01
#_0F9486: STA.w $0A18

#_0F9489: JSL WriteMoneyToHUD
#_0F948D: JSL WriteMAGToHUD

#_0F9491: PLP
#_0F9492: RTL

;===================================================================================================

routine0F9493:
#_0F9493: PHP
#_0F9494: REP #$20

#_0F9496: LDA.w $1A74
#_0F9499: CMP.w #$0010
#_0F949C: BNE .no_menu

#_0F949E: SEP #$20

#_0F94A0: LDA.w $0A18
#_0F94A3: BEQ .no_menu

#_0F94A5: JSL TriggerMenuShrink
#_0F94A9: JSL BringUpAMenu

.no_menu
#_0F94AD: STZ.w $0A18

#_0F94B0: PLP
#_0F94B1: RTL

;===================================================================================================

routine0F94B2:
#_0F94B2: PHP

#_0F94B3: PHB
#_0F94B4: PHK
#_0F94B5: PLB

#_0F94B6: SEP #$20

#_0F94B8: STA.w $098D

#_0F94BB: PHA

#_0F94BC: STY.w $098C

#_0F94BF: REP #$20

#_0F94C1: LDX.b #$30
#_0F94C3: LDA.w #$20CF

.clear_next
#_0F94C6: STA.w $0900,X
#_0F94C9: STA.w $0940,X

#_0F94CC: DEX
#_0F94CD: DEX
#_0F94CE: BPL .clear_next

;---------------------------------------------------------------------------------------------------

#_0F94D0: SEP #$20

#_0F94D2: STZ.w $0A33

#_0F94D5: LDA.b #$CF ; space
#_0F94D7: JSL WriteSingleTileToMessageBuffer

#_0F94DB: LDA.b #ItemNamePointers>>16
#_0F94DD: STA.w $00C5

#_0F94E0: PLA

#_0F94E1: REP #$20

#_0F94E3: AND.w #$00FF
#_0F94E6: STA.w $0A39

#_0F94E9: LDA.w #ItemNamePointers
#_0F94EC: STA.w $00C3
#_0F94EF: JSL WriteIndexedEntityNameToBuffer_long

#_0F94F3: SEP #$30

#_0F94F5: LDA.w $0A2D
#_0F94F8: CMP.b #$E3
#_0F94FA: BNE .branch0F9542

#_0F94FC: LDA.b #$14
#_0F94FE: STA.w $0A33

#_0F9501: LDA.b #$22 ; X
#_0F9503: JSL WriteSingleTileToMessageBuffer

#_0F9507: LDY.w $098C

#_0F950A: LDA.w $098E,Y
#_0F950D: PHA

#_0F950E: AND.b #$0F ; number
#_0F9510: INC A
#_0F9511: JSL WriteSingleTileToMessageBuffer

#_0F9515: LDA.b #$CF ; E
#_0F9517: JSL WriteSingleTileToMessageBuffer

#_0F951B: PLA
#_0F951C: AND.b #$F0
#_0F951E: BEQ .exit

;---------------------------------------------------------------------------------------------------

#_0F9520: PHA

#_0F9521: LSR A
#_0F9522: LSR A
#_0F9523: LSR A
#_0F9524: LSR A
#_0F9525: DEC A
#_0F9526: TAY

#_0F9527: LDA.w .sex_symbols,Y
#_0F952A: JSL WriteSingleTileToMessageBuffer

#_0F952E: PLA
#_0F952F: SEC
#_0F9530: SBC.b #$10
#_0F9532: LSR A
#_0F9533: TAY

#_0F9534: LDA.w $0410,Y
#_0F9537: JSL WriteNextMessageChar

.exit
#_0F953B: PLB

#_0F953C: PLP
#_0F953D: RTL

;---------------------------------------------------------------------------------------------------

.sex_symbols
#_0F953E: db $A1 ; ♂
#_0F953F: db $9D ; ♀
#_0F9540: db $A1 ; ♂
#_0F9541: db $A1 ; ♂

;---------------------------------------------------------------------------------------------------

.branch0F9542
#_0F9542: REP #$30

#_0F9544: LDA.w $098D
#_0F9547: AND.w #$00FF
#_0F954A: CMP.w #$00B0
#_0F954D: BCS .branch0F9599

#_0F954F: ASL A
#_0F9550: ASL A
#_0F9551: STA.w $0E00
#_0F9554: ASL A
#_0F9555: CLC
#_0F9556: ADC.w $0E00
#_0F9559: TAX

#_0F955A: LDA.l EquipmentStats,X
#_0F955E: STA.w $0E00

#_0F9561: LDA.w #$0014
#_0F9564: STA.w $0A33

#_0F9567: LDA.w $0E00
#_0F956A: BIT.w #$0080
#_0F956D: BEQ .no_boys_allowed

#_0F956F: LDA.w #$00A1 ; ♂
#_0F9572: JSL WriteSingleTileToMessageBuffer

.no_boys_allowed
#_0F9576: LDA.w $0E00
#_0F9579: BIT.w #$0040
#_0F957C: BEQ .no_girls_allowed

#_0F957E: LDA.w #$009D ; ♀
#_0F9581: JSL WriteSingleTileToMessageBuffer

.no_girls_allowed
#_0F9585: LDA.w #$001A
#_0F9588: STA.w $0A33

#_0F958B: LDA.w $0E00
#_0F958E: AND.w #$0007
#_0F9591: TAY

#_0F9592: LDA.w EquipmentAlignmentLetters,Y
#_0F9595: JSL WriteSingleTileToMessageBuffer

.branch0F9599
#_0F9599: PLB

#_0F959A: PLP
#_0F959B: RTL

;===================================================================================================

EquipmentAlignmentLetters:
#_0F959C: db $CF ; 000 - " "
#_0F959D: db $16 ; 001 - "L"
#_0F959E: db $18 ; 010 - "N"
#_0F959F: db $CF ; 011 - " "
#_0F95A0: db $0D ; 100 - "C"
#_0F95A1: db $CF ; 101 - " "
#_0F95A2: db $CF ; 110 - " "
#_0F95A3: db $0B ; 111 - "A"

;===================================================================================================

ProbablyTriesToUnequipAnItem:
#_0F95A4: PHP

#_0F95A5: PHB
#_0F95A6: PHK
#_0F95A7: PLB

#_0F95A8: REP #$30

#_0F95AA: LDX.w $0BA1
#_0F95AD: LDY.w #$0006

.check_next
#_0F95B0: LDA.w $1042,X
#_0F95B3: JSL CheckItemForCurses
#_0F95B7: BCS .cursed

#_0F95B9: INX
#_0F95BA: INX

#_0F95BB: DEY
#_0F95BC: BPL .check_next

#_0F95BE: PLB

#_0F95BF: PLP
#_0F95C0: CLC

#_0F95C1: RTL

;---------------------------------------------------------------------------------------------------

.cursed
#_0F95C2: PHX

#_0F95C3: LDA.w $1042,X
#_0F95C6: STA.w $0A50

#_0F95C9: JSL LookForEmptyInventorySpace
#_0F95CD: BCS .no_space

#_0F95CF: PLX

#_0F95D0: LDA.w #$FFFF
#_0F95D3: STA.w $1042,X
#_0F95D6: JSL AddItemToInventory_long

#_0F95DA: REP #$30

#_0F95DC: LDA.w #$FFFF
#_0F95DF: STA.w $0692

#_0F95E2: LDA.w $0BA1
#_0F95E5: STA.w $0715

#_0F95E8: JSL routine01A700

#_0F95EC: LDX.w $0715
#_0F95EF: JSL UpdatePlayerStats

#_0F95F3: PLB

#_0F95F4: PLP
#_0F95F5: CLC

#_0F95F6: RTL

;---------------------------------------------------------------------------------------------------

.no_space
#_0F95F7: PLX

#_0F95F8: PLB

#_0F95F9: PLP
#_0F95FA: SEC

#_0F95FB: RTL

;===================================================================================================

CheckItemForCurses:
#_0F95FC: PHP
#_0F95FD: REP #$30

#_0F95FF: PHA
#_0F9600: PHX
#_0F9601: PHY

#_0F9602: PHD
#_0F9603: PHB

#_0F9604: CMP.w #$FFFF
#_0F9607: BEQ .everything_fine

#_0F9609: CMP.w #$0050
#_0F960C: BCC .weapon

#_0F960E: CMP.w #$0060
#_0F9611: BCC .everything_fine

.weapon
#_0F9613: ASL A
#_0F9614: ASL A
#_0F9615: STA.w $0E02
#_0F9618: ASL A
#_0F9619: CLC
#_0F961A: ADC.w $0E02
#_0F961D: TAX

; check for curse, frog, fly
#_0F961E: LDA.l EquipmentStats+8,X
#_0F9622: AND.w #$0700
#_0F9625: BEQ .everything_fine

#_0F9627: REP #$30

#_0F9629: PLB
#_0F962A: PLD

#_0F962B: PLY
#_0F962C: PLX
#_0F962D: PLA

#_0F962E: PLP
#_0F962F: SEC

#_0F9630: RTL

;---------------------------------------------------------------------------------------------------

.everything_fine
#_0F9631: REP #$30

#_0F9633: PLB
#_0F9634: PLD

#_0F9635: PLY
#_0F9636: PLX
#_0F9637: PLA

#_0F9638: PLP
#_0F9639: CLC

#_0F963A: RTL

;===================================================================================================

routine0F963B:
#_0F963B: PHP

#_0F963C: PHB
#_0F963D: PHK
#_0F963E: PLB

#_0F963F: REP #$30

#_0F9641: LDX.w $0BA1

#_0F9644: LDA.w $1002,X
#_0F9647: BIT.w #$8000
#_0F964A: BNE .dead

#_0F964C: BIT.w #$4000
#_0F964F: BEQ .fail

#_0F9651: LDA.w #$003F
#_0F9654: STA.w $0E00

#_0F9657: BRA .roll_dice

.dead
#_0F9659: LDA.w #$007F
#_0F965C: STA.w $0E00

;---------------------------------------------------------------------------------------------------

.roll_dice
#_0F965F: JSL GetRandomInt
#_0F9663: AND.w $0E00
#_0F9666: BNE .fail

#_0F9668: LDX.w $0BA1

#_0F966B: LDA.w $1004,X
#_0F966E: CMP.w #$008B ; demon 08B - Cerberus
#_0F9671: BEQ .fail

#_0F9673: CMP.w #$0020 ; demon 020 - Gabriel
#_0F9676: BEQ .fail

#_0F9678: CMP.w #$0021 ; demon 021 - Raphael
#_0F967B: BEQ .fail

#_0F967D: CMP.w #$0022 ; demon 022 - Uriel
#_0F9680: BEQ .fail

#_0F9682: SEP #$20

#_0F9684: LDA.b #$FF
#_0F9686: STA.w $0A58

#_0F9689: PLB

#_0F968A: PLP
#_0F968B: SEC

#_0F968C: RTL

;---------------------------------------------------------------------------------------------------

.fail
#_0F968D: SEP #$20

#_0F968F: STZ.w $0A58

#_0F9692: PLB

#_0F9693: PLP
#_0F9694: CLC

#_0F9695: RTL

;===================================================================================================

routine0F9696:
#_0F9696: PHP

#_0F9697: PHB
#_0F9698: PHK
#_0F9699: PLB

#_0F969A: SEP #$20

#_0F969C: LDA.b #$20
#_0F969E: STA.w $0A2C

#_0F96A1: LDA.b #$04 ; SFX 04
#_0F96A3: JSL Write_to_APU_transferrable

#_0F96A7: REP #$20

#_0F96A9: STZ.w $0A33

#_0F96AC: LDA.w #$3CC8 ; TODO vram address
#_0F96AF: STA.w $0980

#_0F96B2: SEP #$30

#_0F96B4: LDX.b #$00
#_0F96B6: TXY

.next_char
#_0F96B7: LDA.w .char,Y
#_0F96BA: JSL WriteNextMessageChar

#_0F96BE: INY

#_0F96BF: INX
#_0F96C0: CPX.b #$0F
#_0F96C2: BNE .next_char

#_0F96C4: LDA.w .char,Y
#_0F96C7: JSL WriteSingleTileToMessageBuffer

#_0F96CB: JSL routine0384F9_long

#_0F96CF: JSL RunFramesUntil0100IsFlagged
#_0F96D3: JSL Update19XXUntilInput

#_0F96D7: JSL routine0F9720

#_0F96DB: PLB

#_0F96DC: PLP
#_0F96DD: RTL

;---------------------------------------------------------------------------------------------------

; "すまない しっぱいしたようだ ⏷"
.char
#_0F96DE: db $31, $43, $39, $26, $CF, $30, $58, $B0 ; "すまない しっぱ"
#_0F96E6: db $26, $30, $34, $4A, $27, $A6, $CF ; "いしたようだ "
#_0F96ED: db $AB ; ⏷

;===================================================================================================

routine0F96EE:
#_0F96EE: PHP

#_0F96EF: PHB
#_0F96F0: PHK
#_0F96F1: PLB

#_0F96F2: SEP #$30

#_0F96F4: LDA.w $0BA3
#_0F96F7: CMP.b #$02
#_0F96F9: BCC .branch0F971C

#_0F96FB: CMP.b #$03
#_0F96FD: BEQ .branch0F9709

#_0F96FF: REP #$20
#_0F9701: JSL ProbablyTriesToUnequipAnItem
#_0F9705: BCS .branch0F9714

#_0F9707: BRA .branch0F971C

.branch0F9709
#_0F9709: REP #$20
#_0F970B: LDA.w $09F3
#_0F970E: JSL routine0F963B
#_0F9712: BCC .branch0F971C

.branch0F9714
#_0F9714: JSL routine0F9696

#_0F9718: PLB

#_0F9719: PLP
#_0F971A: SEC

#_0F971B: RTL

.branch0F971C
#_0F971C: PLB

#_0F971D: PLP
#_0F971E: CLC

#_0F971F: RTL

;===================================================================================================

routine0F9720:
#_0F9720: PHP

#_0F9721: PHB
#_0F9722: PHK
#_0F9723: PLB

#_0F9724: REP #$30

#_0F9726: LDA.w $0A33
#_0F9729: PHA

#_0F972A: STZ.w $0A33

#_0F972D: LDA.w #$3CC8 ; TODO vram address
#_0F9730: STA.w $0980

#_0F9733: LDA.w $07E1
#_0F9736: AND.w #$00FF
#_0F9739: ASL A
#_0F973A: ASL A
#_0F973B: ASL A
#_0F973C: ASL A
#_0F973D: ASL A
#_0F973E: ASL A
#_0F973F: STA.w $0E00

#_0F9742: LDA.w $0BA3
#_0F9745: AND.w #$00FF
#_0F9748: ASL A
#_0F9749: ASL A
#_0F974A: ASL A
#_0F974B: ASL A
#_0F974C: CLC
#_0F974D: ADC.w $0E00
#_0F9750: TAY

#_0F9751: LDX.w #$0000

.next_char
#_0F9754: LDA.w .chars,Y
#_0F9757: JSL WriteNextMessageChar

#_0F975B: INY

#_0F975C: INX
#_0F975D: CPX.w #$0010
#_0F9760: BNE .next_char

#_0F9762: JSL routine0384F9_long
#_0F9766: JSL RunFramesUntil0100IsFlagged

#_0F976A: REP #$20

#_0F976C: PLA
#_0F976D: STA.w $0A33

#_0F9770: PLB

#_0F9771: PLP
#_0F9772: RTL

;---------------------------------------------------------------------------------------------------

.chars
; "だれを かいふくさせるのか?  "
#_0F9773: db $A6, $4E, $51, $CF, $2A, $26, $40, $2C ; "だれを かいふく"
#_0F977B: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

; "だれを ちりょうするのか?   "
#_0F9783: db $A6, $4E, $51, $CF, $35, $4C, $57, $27 ; "だれを ちりょう"
#_0F978B: db $31, $4D, $3D, $2A, $95, $CF, $CF, $CF ; "するのか?   "

; "だれの のろいをとくのか?   "
#_0F9793: db $A6, $4E, $3D, $CF, $3D, $4F, $26, $51 ; "だれの のろいを"
#_0F979B: db $38, $2C, $3D, $2A, $95, $CF, $CF, $CF ; "とくのか?   "

; "だれを ふっかつさせるのか?  "
#_0F97A3: db $A6, $4E, $51, $CF, $40, $58, $2A, $36 ; "だれを ふっかつ"
#_0F97AB: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

; "だれを かいふくさせるのか?  "
#_0F97B3: db $A6, $4E, $51, $CF, $2A, $26, $40, $2C ; "だれを かいふく"
#_0F97BB: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

; "だれを ちりょうするのか?   "
#_0F97C3: db $A6, $4E, $51, $CF, $35, $4C, $57, $27 ; "だれを ちりょう"
#_0F97CB: db $31, $4D, $3D, $2A, $95, $CF, $CF, $CF ; "するのか?   "

; "だれの のろいをとくのか?   "
#_0F97D3: db $A6, $4E, $3D, $CF, $3D, $4F, $26, $51 ; "だれの のろいを"
#_0F97DB: db $38, $2C, $3D, $2A, $95, $CF, $CF, $CF ; "とくのか?   "

; "だれを ふっかつさせるのか?  "
#_0F97E3: db $A6, $4E, $51, $CF, $40, $58, $2A, $36 ; "だれを ふっかつ"
#_0F97EB: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

; "だれを かいふくさせるのか?  "
#_0F97F3: db $A6, $4E, $51, $CF, $2A, $26, $40, $2C ; "だれを かいふく"
#_0F97FB: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

; "だれを ちりょうするのか?   "
#_0F9803: db $A6, $4E, $51, $CF, $35, $4C, $57, $27 ; "だれを ちりょう"
#_0F980B: db $31, $4D, $3D, $2A, $95, $CF, $CF, $CF ; "するのか?   "

; "だれの のろいをとくのか?   "
#_0F9813: db $A6, $4E, $3D, $CF, $3D, $4F, $26, $51 ; "だれの のろいを"
#_0F981B: db $38, $2C, $3D, $2A, $95, $CF, $CF, $CF ; "とくのか?   "

; "だれを ふっかつさせるのか?  "
#_0F9823: db $A6, $4E, $51, $CF, $40, $58, $2A, $36 ; "だれを ふっかつ"
#_0F982B: db $2F, $32, $4D, $3D, $2A, $95, $CF, $CF ; "させるのか?  "

;===================================================================================================
; TODO these are teleport locations
routine0F9833:
#_0F9833: PHP

#_0F9834: PHB
#_0F9835: PHK
#_0F9836: PLB

#_0F9837: REP #$30

#_0F9839: LDA.w $0F53
#_0F983C: PHA

#_0F983D: LDA.w #$00B4

.next_shake
#_0F9840: PHA

#_0F9841: AND.w #$0003
#_0F9844: ASL A
#_0F9845: TAX

#_0F9846: LDA.w .bg_offset,X
#_0F9849: CLC
#_0F984A: ADC.w $0F53
#_0F984D: STA.w $0F53

#_0F9850: JSL AddSelfAsVectorAndMakeSpace

#_0F9854: PLA
#_0F9855: DEC A
#_0F9856: BPL .next_shake

#_0F9858: PLA
#_0F9859: STA.w $0F53

;---------------------------------------------------------------------------------------------------

#_0F985C: SEP #$20

; TODO sets overworld coordinates
#_0F985E: LDA.w $101C
#_0F9861: BMI .branch0F986F

#_0F9863: LDA.b #$57
#_0F9865: STA.w $07F5

#_0F9868: LDA.b #$63
#_0F986A: STA.w $07F6

#_0F986D: BRA .set_underworld_coordinates

.branch0F986F
#_0F986F: LDA.b #$56
#_0F9871: STA.w $07F5

#_0F9874: LDA.b #$4D
#_0F9876: STA.w $07F6

.set_underworld_coordinates
#_0F9879: REP #$20

; TODO these seem to be places in the cathedral
#_0F987B: LDA.w $046C
#_0F987E: CMP.w #$3C2E
#_0F9881: BEQ .exit

#_0F9883: CMP.w #$2A2A
#_0F9886: BEQ .exit

#_0F9888: SEP #$20

#_0F988A: LDA.w $101C
#_0F988D: BMI .branch0F98A5

#_0F988F: LDA.b #$2E
#_0F9891: STA.w $046C

#_0F9894: LDA.b #$3C
#_0F9896: STA.w $046D

#_0F9899: LDA.b #$13
#_0F989B: STA.w $046B

#_0F989E: LDA.b #$03
#_0F98A0: STA.w $046A

#_0F98A3: BRA .exit

;---------------------------------------------------------------------------------------------------

.branch0F98A5
#_0F98A5: LDA.b #$2A
#_0F98A7: STA.w $046C

#_0F98AA: LDA.b #$2A
#_0F98AC: STA.w $046D

#_0F98AF: LDA.b #$13
#_0F98B1: STA.w $046B

#_0F98B4: LDA.b #$00
#_0F98B6: STA.w $046A

.exit
#_0F98B9: PLB
#_0F98BA: PLP

#_0F98BB: RTL

;---------------------------------------------------------------------------------------------------

.bg_offset
#_0F98BC: dw $FFFF, $0001, $0001, $FFFF

;===================================================================================================

routine0F98C4:
#_0F98C4: PHP

#_0F98C5: PHB
#_0F98C6: PHK
#_0F98C7: PLB

#_0F98C8: REP #$30

#_0F98CA: STZ.w $0E00

#_0F98CD: LDX.w #$0000

.next_party_member_a
#_0F98D0: LDA.w $1000,X
#_0F98D3: AND.w #$4000
#_0F98D6: BEQ .skip_party_member_a

#_0F98D8: LDA.w $1002,X
#_0F98DB: AND.w #$1100
#_0F98DE: BEQ .skip_party_member_a

#_0F98E0: LDA.w $102E,X
#_0F98E3: BEQ .skip_party_member_a

#_0F98E5: DEC A
#_0F98E6: STA.w $102E,X

#_0F98E9: INC.w $0E00

.skip_party_member_a
#_0F98EC: TXA
#_0F98ED: CLC
#_0F98EE: ADC.w #$0060
#_0F98F1: TAX

#_0F98F2: CPX.w #$0600
#_0F98F5: BNE .next_party_member_a

;---------------------------------------------------------------------------------------------------

#_0F98F7: LDA.w $0B34
#_0F98FA: AND.w #$0003
#_0F98FD: BNE .branch0F9929

#_0F98FF: LDX.w #$0000

.next_party_member_b
#_0F9902: LDA.w $1000,X
#_0F9905: AND.w #$4000
#_0F9908: BEQ .skip_party_member_b

#_0F990A: LDA.w $1002,X
#_0F990D: AND.w #$0800
#_0F9910: BEQ .skip_party_member_b

#_0F9912: LDA.w $102E,X
#_0F9915: BEQ .skip_party_member_b

#_0F9917: DEC A
#_0F9918: STA.w $102E,X
#_0F991B: INC.w $0E00

.skip_party_member_b
#_0F991E: TXA
#_0F991F: CLC
#_0F9920: ADC.w #$0060
#_0F9923: TAX
#_0F9924: CPX.w #$0600
#_0F9927: BNE .next_party_member_b

;---------------------------------------------------------------------------------------------------

.branch0F9929
#_0F9929: LDA.w $0E00
#_0F992C: BNE .branch0F9931

#_0F992E: JMP .exit

.branch0F9931
#_0F9931: LDA.w $0A71
#_0F9934: PHA

#_0F9935: PHP

#_0F9936: LDA.w #$00FF
#_0F9939: STA.w $0A71

#_0F993C: LDA.w #$002D ; SFX 2D
#_0F993F: JSL Write_to_APU_transferrable

#_0F9943: LDA.w #$00FC
#_0F9946: LDX.w #$0000
#_0F9949: LDY.w #$0001
#_0F994C: JSL routine009443

#_0F9950: PLP

#_0F9951: PLA
#_0F9952: STA.w $0A71

#_0F9955: LDX.w #$0000

.next_party_member_c
#_0F9958: LDA.w $1000,X
#_0F995B: AND.w #$4000
#_0F995E: BEQ .skip_party_member_c

#_0F9960: LDA.w $102E,X
#_0F9963: BNE .skip_party_member_c

#_0F9965: LDA.w #$4000
#_0F9968: STA.w $1002,X

#_0F996B: PHP
#_0F996C: REP #$30

#_0F996E: PHA
#_0F996F: PHX
#_0F9970: PHY

#_0F9971: PHD
#_0F9972: PHB

#_0F9973: JSL routine00AB74

#_0F9977: REP #$30

#_0F9979: PLB
#_0F997A: PLD

#_0F997B: PLY
#_0F997C: PLX
#_0F997D: PLA

#_0F997E: PLP

.skip_party_member_c
#_0F997F: TXA
#_0F9980: CLC
#_0F9981: ADC.w #$0060
#_0F9984: TAX

#_0F9985: CMP.w #$0600
#_0F9988: BNE .next_party_member_c

;---------------------------------------------------------------------------------------------------

#_0F998A: STZ.w $0E00

#_0F998D: LDX.w #$0000

.next_human
#_0F9990: LDA.w $1000,X
#_0F9993: BPL .skip_human

#_0F9995: LDA.w $102E,X
#_0F9998: ORA.w $0E00
#_0F999B: STA.w $0E00

.skip_human
#_0F999E: TXA
#_0F999F: CLC
#_0F99A0: ADC.w #$0060
#_0F99A3: TAX

#_0F99A4: CPX.w #$0180
#_0F99A7: BNE .next_human

;---------------------------------------------------------------------------------------------------

#_0F99A9: LDA.w $0E00
#_0F99AC: BNE .exit

#_0F99AE: LDA.w $0400
#_0F99B1: ORA.w #$8000
#_0F99B4: STA.w $0400

#_0F99B7: JSL routine02D0B8
#_0F99BB: JSL AddSelfAsVector

.exit
#_0F99BF: PLB

#_0F99C0: PLP
#_0F99C1: RTL

;===================================================================================================

routine0F99C2:
#_0F99C2: PHP

#_0F99C3: PHB
#_0F99C4: PHK
#_0F99C5: PLB

#_0F99C6: REP #$30

; chase level - momo level
#_0F99C8: LDA.w $100A
#_0F99CB: SEC
#_0F99CC: SBC.w $106A
#_0F99CF: STA.w $0E00

#_0F99D2: STZ.w $0E02

#_0F99D5: LDX.w #$000A

.momos_next_stat
#_0F99D8: LDA.w $1070,X
#_0F99DB: CLC
#_0F99DC: ADC.w $0E02
#_0F99DF: STA.w $0E02

#_0F99E2: DEX
#_0F99E3: DEX
#_0F99E4: BPL .momos_next_stat

;---------------------------------------------------------------------------------------------------

#_0F99E6: LDX.w #$0000

.give_momo_points
#_0F99E9: PHX

#_0F99EA: LDA.w $1070,X
#_0F99ED: STA.w $0E10

#_0F99F0: LDA.w $0E00
#_0F99F3: STA.w $0E12

#_0F99F6: JSL BigMultiplication_long

#_0F99FA: LDA.w $0E14
#_0F99FD: LDX.w #$0000
#_0F9A00: LDY.w $0E02
#_0F9A03: JSL DivisionBig_XA_by_Y

#_0F9A07: PLX

#_0F9A08: LDA.w $0E80
#_0F9A0B: CLC
#_0F9A0C: ADC.w $1070,X
#_0F9A0F: STA.w $1070,X

#_0F9A12: INX
#_0F9A13: INX
#_0F9A14: CPX.w #$000C
#_0F9A17: BNE .give_momo_points

;---------------------------------------------------------------------------------------------------

#_0F9A19: LDA.w $100A
#_0F9A1C: STA.w $106A

#_0F9A1F: REP #$30

#_0F9A21: LDX.w #$0060
#_0F9A24: JSL UpdatePlayerStats

#_0F9A28: LDA.w $1090
#_0F9A2B: STA.w $108E

#_0F9A2E: LDA.w $1094
#_0F9A31: STA.w $1092

#_0F9A34: LDA.w $106A
#_0F9A37: DEC A
#_0F9A38: ASL A
#_0F9A39: CLC
#_0F9A3A: ADC.w $106A
#_0F9A3D: DEC A
#_0F9A3E: TAX

#_0F9A3F: LDA.l ExperienceTable+0,X
#_0F9A43: STA.w $106C

#_0F9A46: LDA.l ExperienceTable+2,X
#_0F9A4A: AND.w #$00FF
#_0F9A4D: STA.w $106E

#_0F9A50: LDA.w $101C
#_0F9A53: STA.w $107C

#_0F9A56: PLB

#_0F9A57: PLP
#_0F9A58: RTL

;===================================================================================================

routine0F9A59:
#_0F9A59: PHP
#_0F9A5A: SEP #$20
#_0F9A5C: REP #$10

#_0F9A5E: PHA

#_0F9A5F: LDA.l $7E22FD
#_0F9A63: BEQ .no_wait

#_0F9A65: JSL AddSelfAsVectorAndMakeSpace

.no_wait
#_0F9A69: PLA
#_0F9A6A: ASL A
#_0F9A6B: ASL A
#_0F9A6C: ASL A
#_0F9A6D: ASL A
#_0F9A6E: STA.l $7E22FE

#_0F9A72: LDA.b #$10
#_0F9A74: STA.l $7E22FF

#_0F9A78: PHB
#_0F9A79: PHK
#_0F9A7A: PLB

#_0F9A7B: REP #$20

#_0F9A7D: LDX.w #$0000
#_0F9A80: LDA.w #$7FFF

.clear_next
#_0F9A83: STA.l $7E2300,X

#_0F9A87: INX
#_0F9A88: INX
#_0F9A89: CPX.w #$0020
#_0F9A8C: BNE .clear_next

#_0F9A8E: SEP #$20

#_0F9A90: LDA.b #$01
#_0F9A92: STA.l $7E22FD

#_0F9A96: JSL AddSelfAsVectorAndMakeSpace

#_0F9A9A: PLB

#_0F9A9B: PLP
#_0F9A9C: RTL

;===================================================================================================

routine0F9A9D:
#_0F9A9D: PHP
#_0F9A9E: SEP #$20
#_0F9AA0: REP #$10

#_0F9AA2: PHA

#_0F9AA3: LDA.l $7E22FD
#_0F9AA7: BEQ .no_wait

#_0F9AA9: JSL AddSelfAsVectorAndMakeSpace

.no_wait
#_0F9AAD: PLA
#_0F9AAE: ASL A
#_0F9AAF: ASL A
#_0F9AB0: ASL A
#_0F9AB1: ASL A
#_0F9AB2: STA.l $7E22FE

#_0F9AB6: LDA.b #$10
#_0F9AB8: STA.l $7E22FF

#_0F9ABC: PHB
#_0F9ABD: PHK
#_0F9ABE: PLB

#_0F9ABF: REP #$20
#_0F9AC1: LDX.w #$0000
#_0F9AC4: LDA.w #$0000

.clear_next
#_0F9AC7: STA.l $7E2300,X

#_0F9ACB: INX
#_0F9ACC: INX
#_0F9ACD: CPX.w #$0020
#_0F9AD0: BNE .clear_next

#_0F9AD2: SEP #$20

#_0F9AD4: LDA.b #$01
#_0F9AD6: STA.l $7E22FD

#_0F9ADA: JSL AddSelfAsVectorAndMakeSpace

#_0F9ADE: PLB

#_0F9ADF: PLP
#_0F9AE0: RTL

;===================================================================================================

routine0F9AE1:
#_0F9AE1: PHP

#_0F9AE2: PHB
#_0F9AE3: PHK
#_0F9AE4: PLB

#_0F9AE5: REP #$30

#_0F9AE7: LDA.w #$00E6
#_0F9AEA: JSL TestGameProgressBit
#_0F9AEE: BCC .exit

#_0F9AF0: LDA.w #$0028
#_0F9AF3: JSL routine02F609

.exit
#_0F9AF7: PLB

#_0F9AF8: PLP
#_0F9AF9: RTL

;===================================================================================================

Transfer16Colors_F9AFA:
#_0F9AFA: PHP
#_0F9AFB: SEP #$20
#_0F9AFD: REP #$10

#_0F9AFF: PHA

#_0F9B00: LDA.l $7E22FD
#_0F9B04: BEQ .no_wait

#_0F9B06: JSL AddSelfAsVectorAndMakeSpace

.no_wait
#_0F9B0A: PLA ; A holds 4bpp palette number I think
#_0F9B0B: ASL A
#_0F9B0C: ASL A
#_0F9B0D: ASL A
#_0F9B0E: ASL A
#_0F9B0F: STA.l $7E22FE

#_0F9B13: LDA.b #$10 ; 16 colors
#_0F9B15: STA.l $7E22FF

;---------------------------------------------------------------------------------------------------

#_0F9B19: PHB
#_0F9B1A: PHK
#_0F9B1B: PLB

#_0F9B1C: REP #$20

#_0F9B1E: TXA
#_0F9B1F: ASL A
#_0F9B20: ASL A
#_0F9B21: ASL A
#_0F9B22: ASL A
#_0F9B23: ASL A
#_0F9B24: TAX

#_0F9B25: LDY.w #$0000

.next_color
#_0F9B28: LDA.l SomePalette1CB000,X

#_0F9B2C: PHX
#_0F9B2D: TYX

#_0F9B2E: STA.l $7E2300,X ; Also to the wram buffer

#_0F9B32: PLX

#_0F9B33: INX
#_0F9B34: INX

#_0F9B35: INY
#_0F9B36: INY
#_0F9B37: CPY.w #$0020
#_0F9B3A: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_0F9B3C: SEP #$20

#_0F9B3E: LDA.b #$01
#_0F9B40: STA.l $7E22FD

#_0F9B44: PLB

#_0F9B45: PLP
#_0F9B46: RTL

;===================================================================================================

routine0F9B47:
#_0F9B47: PHP
#_0F9B48: REP #$30

#_0F9B4A: AND.w #$00FF
#_0F9B4D: ASL A
#_0F9B4E: ASL A
#_0F9B4F: ASL A
#_0F9B50: ASL A
#_0F9B51: ASL A
#_0F9B52: STA.w $0E00

#_0F9B55: TXA
#_0F9B56: AND.w #$00FF
#_0F9B59: ASL A
#_0F9B5A: ASL A
#_0F9B5B: ASL A
#_0F9B5C: ASL A
#_0F9B5D: ASL A
#_0F9B5E: STA.w $0E02

#_0F9B61: PHB
#_0F9B62: PHK
#_0F9B63: PLB

#_0F9B64: LDY.w #$0000

.next_color
#_0F9B67: LDX.w $0E02
#_0F9B6A: LDA.l SomePalette1CB000,X

#_0F9B6E: LDX.w $0E00
#_0F9B71: STA.l $7E2500,X

#_0F9B75: INC.w $0E00
#_0F9B78: INC.w $0E00

#_0F9B7B: INC.w $0E02
#_0F9B7E: INC.w $0E02

#_0F9B81: INY
#_0F9B82: CPY.w #$0010
#_0F9B85: BNE .next_color

#_0F9B87: PLB

#_0F9B88: PLP
#_0F9B89: RTL

;===================================================================================================

routine0F9B8A:
#_0F9B8A: REP #$30

#_0F9B8C: LDY.w #$0002

#_0F9B8F: LDA.w $0A3B
#_0F9B92: AND.w #$0001
#_0F9B95: BEQ .loop

#_0F9B97: LDY.w #$0004

.loop
#_0F9B9A: LDX.w $0C05,Y
#_0F9B9D: CPX.w #$FFFF
#_0F9BA0: BEQ .skip

#_0F9BA2: LDA.w #$0000
#_0F9BA5: STA.w $1000,X

#_0F9BA8: JSL routine0F853F

.skip
#_0F9BAC: DEY
#_0F9BAD: DEY
#_0F9BAE: BPL .loop

#_0F9BB0: RTL

;===================================================================================================

routine0F9BB1:
#_0F9BB1: REP #$30

#_0F9BB3: LDX.w #$0180

.next_party_member_check
#_0F9BB6: LDA.w $1000,X
#_0F9BB9: AND.w #$8000
#_0F9BBC: BEQ .branch0F9BCA

#_0F9BBE: TXA
#_0F9BBF: CLC
#_0F9BC0: ADC.w #$0060
#_0F9BC3: TAX
#_0F9BC4: CPX.w #$0600
#_0F9BC7: BNE .next_party_member_check

#_0F9BC9: RTS

;---------------------------------------------------------------------------------------------------

.branch0F9BCA
#_0F9BCA: STX.w $0E00

#_0F9BCD: LDA.w $0C0B
#_0F9BD0: STA.w $050A

#_0F9BD3: STZ.w $0524

#_0F9BD6: LDA.w #$0001
#_0F9BD9: STA.w $050E

#_0F9BDC: JSL LoadDemonStats

#_0F9BE0: LDX.w #$0600
#_0F9BE3: LDY.w $0E00

.branch0F9BE6
#_0F9BE6: LDA.w $1000,X
#_0F9BE9: STA.w $1000,Y

#_0F9BEC: INY
#_0F9BED: INY

#_0F9BEE: INX
#_0F9BEF: INX
#_0F9BF0: CPX.w #$0660
#_0F9BF3: BNE .branch0F9BE6

#_0F9BF5: LDY.w $0E00

#_0F9BF8: LDA.w $101C,Y
#_0F9BFB: CMP.w #$0070
#_0F9BFE: BCC .branch0F9C0E

#_0F9C00: CMP.w #$0090
#_0F9C03: BCC .exit

#_0F9C05: LDA.w #$199A
#_0F9C08: JSL routine0F9C16

#_0F9C0C: BRA .exit

.branch0F9C0E
#_0F9C0E: LDA.w #$199A
#_0F9C11: JSL routine0F9C48

.exit
#_0F9C15: RTL

;===================================================================================================

routine0F9C16:
#_0F9C16: PHP
#_0F9C17: REP #$20

#_0F9C19: STA.w $0E00

#_0F9C1C: LDA.w $0726
#_0F9C1F: AND.w #$00FF
#_0F9C22: CMP.w #$00FF
#_0F9C25: BEQ .exit

#_0F9C27: LDA.w #$00FB
#_0F9C2A: JSL TestGameProgressBit
#_0F9C2E: BCS .exit

#_0F9C30: LDA.w $0E00
#_0F9C33: CLC
#_0F9C34: ADC.w $0726
#_0F9C37: STA.w $0726

#_0F9C3A: LDA.w $101C
#_0F9C3D: ADC.w #$0000
#_0F9C40: STA.w $101C
#_0F9C43: STA.w $107C

.exit
#_0F9C46: PLP
#_0F9C47: RTL

;===================================================================================================

routine0F9C48:
#_0F9C48: PHP
#_0F9C49: REP #$20

#_0F9C4B: STA.w $0E00

#_0F9C4E: LDA.w $0726
#_0F9C51: AND.w #$00FF
#_0F9C54: BEQ .exit

#_0F9C56: LDA.w #$00FB
#_0F9C59: JSL TestGameProgressBit
#_0F9C5D: BCS .exit

#_0F9C5F: LDA.w $0726
#_0F9C62: SEC
#_0F9C63: SBC.w $0E00
#_0F9C66: STA.w $0726

#_0F9C69: LDA.w $101C
#_0F9C6C: SBC.w #$0000
#_0F9C6F: STA.w $101C
#_0F9C72: STA.w $107C

.exit
#_0F9C75: PLP
#_0F9C76: RTL

;===================================================================================================

routine0F9C77:
#_0F9C77: REP #$20

#_0F9C79: LDA.w #$00F8
#_0F9C7C: STA.w $0F53
#_0F9C7F: STZ.w $0F51
#_0F9C82: STZ.w $0F4F
#_0F9C85: STZ.w $0F4D

#_0F9C88: LDA.w #$FFFF
#_0F9C8B: STA.w $0A99
#_0F9C8E: STA.w $0A9A
#_0F9C91: STA.w $0A9B
#_0F9C94: STA.w $0A9C

#_0F9C97: STZ.w $0A95
#_0F9C9A: STZ.w $0A96
#_0F9C9D: STZ.w $0A97
#_0F9CA0: STZ.w $0A98

;---------------------------------------------------------------------------------------------------

#_0F9CA3: SEP #$30

#_0F9CA5: LDA.b #$FF
#_0F9CA7: STA.w $0A71

#_0F9CAA: LDA.b #$48
#_0F9CAC: STA.w $046C
#_0F9CAF: LDA.b #$08
#_0F9CB1: STA.w $046D

#_0F9CB4: LDA.b #$0A
#_0F9CB6: STA.w $046B
#_0F9CB9: LDA.b #$02
#_0F9CBB: STA.w $046A

#_0F9CBE: LDA.b #$47
#_0F9CC0: STA.w $070C
#_0F9CC3: LDA.b #$07
#_0F9CC5: STA.w $070D

#_0F9CC8: LDA.b #$0A
#_0F9CCA: STA.w $0710

#_0F9CCD: LDA.b #$00
#_0F9CCF: STA.w $040D

#_0F9CD2: LDA.b #$01
#_0F9CD4: STA.w $0C4F

#_0F9CD7: LDA.b #$FF
#_0F9CD9: STA.w $0EEF

#_0F9CDC: STZ.w $0F7F
#_0F9CDF: STZ.w $0F80

;---------------------------------------------------------------------------------------------------

#_0F9CE2: JSL routine009BDE
#_0F9CE6: STA.w $0711

#_0F9CE9: LDA.b #$00
#_0F9CEB: JSL routine02F609

#_0F9CEF: LDA.b #$00
#_0F9CF1: JSL routine02FC6E
#_0F9CF5: JSL routine00A17E

#_0F9CF9: LDA.b #$01
#_0F9CFB: JSL routine02CBD1

#_0F9CFF: LDA.b #$07
#_0F9D01: JSL routine02CBD1

#_0F9D05: LDA.b #$1F
#_0F9D07: STA.w $0F74
#_0F9D0A: STA.w TM

#_0F9D0D: JSL BrightenScreen

#_0F9D11: JSL routine00A17E
#_0F9D15: JSL routine00C7AA
#_0F9D19: JSL routine0F84F6

#_0F9D1D: SEP #$30

#_0F9D1F: LDA.b #$03
#_0F9D21: JSL InitializeTextBoxToSizeForNewMessage
#_0F9D25: JSL routine00A056

#_0F9D29: LDA.b #$E5
#_0F9D2B: JSL ClearGameProgressBit_long

#_0F9D2F: RTL

;===================================================================================================

routine0F9D30:
#_0F9D30: REP #$30

#_0F9D32: LDX.w #$0180

.next_party_member
#_0F9D35: LDA.w $1000,X
#_0F9D38: BPL .skip

#_0F9D3A: LDA.w $1004,X
#_0F9D3D: CMP.w #$008B ; demon 08B - Cerberus
#_0F9D40: BNE .skip

#_0F9D42: LDA.w $1002,X
#_0F9D45: AND.w #$F640
#_0F9D48: BNE .demon_badly_afflicted

#_0F9D4A: BRA .dont_relocate

.skip
#_0F9D4C: TXA
#_0F9D4D: CLC
#_0F9D4E: ADC.w #$0060
#_0F9D51: TAX

#_0F9D52: CPX.w #$0600
#_0F9D55: BNE .next_party_member

;---------------------------------------------------------------------------------------------------

.demon_badly_afflicted
#_0F9D57: JSL GetNextTextByte_long
#_0F9D5B: JSL RelocateTextPointer_long

#_0F9D5F: RTL

.dont_relocate
#_0F9D60: JSL GetNextTextByte_long

#_0F9D64: RTL

;===================================================================================================

routine0F9D65:
#_0F9D65: REP #$30

#_0F9D67: LDX.w #$0180
#_0F9D6A: LDY.w #$0000

.next_party_member
#_0F9D6D: LDA.w $1000,X
#_0F9D70: BPL .skip_party_member

#_0F9D72: LDA.w $1002,X
#_0F9D75: AND.w #$F640
#_0F9D78: BNE .skip_party_member

#_0F9D7A: INY

.skip_party_member
#_0F9D7B: TXA
#_0F9D7C: CLC
#_0F9D7D: ADC.w #$0060
#_0F9D80: TAX

#_0F9D81: CMP.w #$0600
#_0F9D84: BNE .next_party_member

;---------------------------------------------------------------------------------------------------

#_0F9D86: CPY.w #$0000
#_0F9D89: BEQ .no_one_afflicted

#_0F9D8B: JSL GetNextTextByte_long

#_0F9D8F: RTL

.no_one_afflicted
#_0F9D90: JSL GetNextTextByte_long
#_0F9D94: JSL RelocateTextPointer_long

#_0F9D98: RTL

;===================================================================================================

routine0F9D99:
#_0F9D99: SEP #$20

#_0F9D9B: LDA.b #$16
#_0F9D9D: STA.w $0F74
#_0F9DA0: STA.w TM

#_0F9DA3: LDA.b #$02
#_0F9DA5: STA.w $0A3B

#_0F9DA8: REP #$30

#_0F9DAA: LDA.w #$0135
#_0F9DAD: STA.w $0BED

#_0F9DB0: LDA.w #$011C
#_0F9DB3: STA.w $0C0B

#_0F9DB6: LDA.w #$0025
#_0F9DB9: STA.w $0BF3

#_0F9DBC: JSL routine03F9B7

#_0F9DC0: REP #$30

#_0F9DC2: STZ.w $0E00
#_0F9DC5: STZ.w $0E02
#_0F9DC8: STZ.w $0E04
#_0F9DCB: STZ.w $0E06
#_0F9DCE: STZ.w $0E08
#_0F9DD1: STZ.w $0E0A

#_0F9DD4: LDX.w #$0180

.branch0F9DD7
#_0F9DD7: LDA.w $1000,X
#_0F9DDA: BPL .branch0F9E0D

#_0F9DDC: LDA.w $1002,X
#_0F9DDF: AND.w #$F640
#_0F9DE2: BNE .branch0F9E0D

#_0F9DE4: INC.w $0E08
#_0F9DE7: LDA.w $101C,X
#_0F9DEA: CMP.w $0E00
#_0F9DED: BNE .branch0F9DF2

#_0F9DEF: JMP .branch0F9F09

.branch0F9DF2
#_0F9DF2: BCC .branch0F9E0D

.branch0F9DF4
#_0F9DF4: STA.w $0E00
#_0F9DF7: LDA.w $1004,X
#_0F9DFA: STA.w $0E02
#_0F9DFD: LDA.w $100A,X
#_0F9E00: STA.w $0E04
#_0F9E03: STX.w $0E06
#_0F9E06: LDA.w $0E08
#_0F9E09: DEC A
#_0F9E0A: STA.w $0E0A

.branch0F9E0D
#_0F9E0D: TXA
#_0F9E0E: CLC
#_0F9E0F: ADC.w #$0060
#_0F9E12: TAX
#_0F9E13: CMP.w #$0600
#_0F9E16: BNE .branch0F9DD7

#_0F9E18: LDA.w $0E02
#_0F9E1B: STA.w $0BEF
#_0F9E1E: LDX.w $0E06
#_0F9E21: LDA.w #$0000
#_0F9E24: STA.w $1000,X
#_0F9E27: JSL routine0F853F

#_0F9E2B: SEP #$30
#_0F9E2D: LDA.b #$10
#_0F9E2F: STA.w $0F76
#_0F9E32: STA.w TS
#_0F9E35: LDA.b #$04
#_0F9E37: STA.w $0F7B
#_0F9E3A: STA.w CGADSUB
#_0F9E3D: LDA.b #$08
#_0F9E3F: STA.w $09F4
#_0F9E42: STZ.w $09F2
#_0F9E45: STZ.w $09F0
#_0F9E48: LDA.w $0B5F
#_0F9E4B: DEC A
#_0F9E4C: STA.w $09F1
#_0F9E4F: BEQ .branch0F9E7D

#_0F9E51: STZ.w $09F3
#_0F9E54: LDX.b #$0A

.branch0F9E56
#_0F9E56: PHX
#_0F9E57: PHP
#_0F9E58: JSL routine02C98F
#_0F9E5C: JSL routine02C9D5

#_0F9E60: SEP #$30
#_0F9E62: LDY.b #$05
#_0F9E64: JSL RunFramesYTimes
#_0F9E68: PLP
#_0F9E69: PLX
#_0F9E6A: LDA.w $09F3
#_0F9E6D: CMP.w $09F1
#_0F9E70: BEQ .branch0F9E77

#_0F9E72: INC.w $09F3
#_0F9E75: BRA .branch0F9E56

.branch0F9E77
#_0F9E77: STZ.w $09F3
#_0F9E7A: DEX
#_0F9E7B: BPL .branch0F9E56

.branch0F9E7D
#_0F9E7D: STZ.w $09F3
#_0F9E80: LDA.w $0E0A

.branch0F9E83
#_0F9E83: PHA
#_0F9E84: PHP
#_0F9E85: JSL routine02C98F
#_0F9E89: JSL routine02C9D5

#_0F9E8D: SEP #$30
#_0F9E8F: LDY.b #$0A
#_0F9E91: JSL RunFramesYTimes
#_0F9E95: PLP
#_0F9E96: PLA
#_0F9E97: CMP.w $09F3
#_0F9E9A: BEQ .branch0F9EA1

#_0F9E9C: INC.w $09F3
#_0F9E9F: BRA .branch0F9E83

.branch0F9EA1
#_0F9EA1: LDA.b #$78
#_0F9EA3: JSL Update19xxVecUntilInputOrAPasses

#_0F9EA7: REP #$30
#_0F9EA9: LDA.w #$0135
#_0F9EAC: STA.w $0BED
#_0F9EAF: LDA.w #$011C
#_0F9EB2: STA.w $0C0B
#_0F9EB5: JSL routine029E97

#_0F9EB9: REP #$30
#_0F9EBB: LDX.w #$0000

.branch0F9EBE
#_0F9EBE: LDA.w $1130,X
#_0F9EC1: CLC
#_0F9EC2: ADC.w #$0005
#_0F9EC5: STA.w $1130,X
#_0F9EC8: INX
#_0F9EC9: INX
#_0F9ECA: CPX.w #$000C
#_0F9ECD: BNE .branch0F9EBE

#_0F9ECF: LDA.w $112A
#_0F9ED2: CLC
#_0F9ED3: ADC.w #$000A
#_0F9ED6: STA.w $112A
#_0F9ED9: LDX.w #$0120
#_0F9EDC: JSL UpdatePlayerStats
#_0F9EE0: LDA.w $1150
#_0F9EE3: STA.w $114E
#_0F9EE6: LDA.w $1154
#_0F9EE9: STA.w $1152
#_0F9EEC: LDA.w $112A
#_0F9EEF: DEC A
#_0F9EF0: ASL A
#_0F9EF1: CLC
#_0F9EF2: ADC.w $112A
#_0F9EF5: DEC A
#_0F9EF6: TAX
#_0F9EF7: LDA.l ExperienceTable,X
#_0F9EFB: STA.w $112C
#_0F9EFE: LDA.l UNREACH_078C02,X
#_0F9F02: AND.w #$00FF
#_0F9F05: STA.w $112E
#_0F9F08: RTL

.branch0F9F09
#_0F9F09: LDA.w $100A,X
#_0F9F0C: CMP.w $0E04
#_0F9F0F: BCS .branch0F9F14

#_0F9F11: JMP .branch0F9E0D

.branch0F9F14
#_0F9F14: JMP .branch0F9DF4

;===================================================================================================

; TODO is it really?
CountAndArrangeGemsOrSomething:
#_0F9F17: PHP
#_0F9F18: PHB
#_0F9F19: PHK
#_0F9F1A: PLB

#_0F9F1B: SEP #$30

#_0F9F1D: STZ.w $0E00

#_0F9F20: LDX.b #$00
#_0F9F22: LDY.b #$00

.next_cleanse
#_0F9F24: LDA.w $0781,Y
#_0F9F27: BEQ .to_next_slot

#_0F9F29: LDA.w $0780,Y
#_0F9F2C: CMP.b #$E4
#_0F9F2E: BCC .not_gem

#_0F9F30: PHX

#_0F9F31: LDX.w $0E00

#_0F9F34: STA.w $098C,X

#_0F9F37: LDA.w $0781,Y
#_0F9F3A: STA.w $098D,X

#_0F9F3D: LDA.b #$00
#_0F9F3F: STA.w $0780,Y
#_0F9F42: STA.w $0781,Y

#_0F9F45: INC.w $0E00
#_0F9F48: INC.w $0E00

#_0F9F4B: PLX
#_0F9F4C: BRA .to_next_slot

.not_gem
#_0F9F4E: STA.w $0780,X

#_0F9F51: LDA.w $0781,Y
#_0F9F54: STA.w $0781,X

#_0F9F57: STX.w $0E02

#_0F9F5A: CPY.w $0E02
#_0F9F5D: BEQ .same_slot

#_0F9F5F: LDA.b #$00
#_0F9F61: STA.w $0780,Y
#_0F9F64: STA.w $0781,Y

.same_slot
#_0F9F67: INX
#_0F9F68: INX

.to_next_slot
#_0F9F69: INY
#_0F9F6A: INY
#_0F9F6B: CPY.b #$3C
#_0F9F6D: BNE .next_cleanse

;---------------------------------------------------------------------------------------------------

#_0F9F6F: LDY.b #$00

.copy_next_gem
#_0F9F71: CPY.w $0E00
#_0F9F74: BEQ .done

#_0F9F76: LDA.w $098C,Y
#_0F9F79: STA.w $0780,X

#_0F9F7C: LDA.w $098D,Y
#_0F9F7F: STA.w $0781,X

#_0F9F82: INY
#_0F9F83: INY

#_0F9F84: INX
#_0F9F85: INX
#_0F9F86: BRA .copy_next_gem

.done
#_0F9F88: CPX.b #$3C
#_0F9F8A: BEQ .exit

#_0F9F8C: LDA.b #$00
#_0F9F8E: STA.w $0780,X
#_0F9F91: STA.w $0781,X

.exit
#_0F9F94: PLB

#_0F9F95: PLP
#_0F9F96: RTL

;===================================================================================================
; Clips 32-bit money at $0405 to the range [0,999999]
; Clips 32-bit MAG at $0409 to the range [0,99999]
;===================================================================================================
ClampMoneyAndMAG:
#_0F9F97: PHP

#_0F9F98: PHB
#_0F9F99: PHK
#_0F9F9A: PLB

#_0F9F9B: REP #$30

#_0F9F9D: LDA.w $0407
#_0F9FA0: BPL .moneypositive

#_0F9FA2: STZ.w $0405
#_0F9FA5: STZ.w $0407
#_0F9FA8: BRA .clipMAG

.moneypositive
#_0F9FAA: CMP.w #$0F ; 1,000,000 >> 16
#_0F9FAD: BCC .clipMAG
#_0F9FAF: BCS .toomuchmoney

; unreachable code
; anything 983,040 or above will become 999,999
#_0F9FB1: LDA.w $0405
#_0F9FB4: CMP.w #$4240 ; 1,000,000 & 0xFFFF
#_0F9FB7: BCC .clipMAG

.toomuchmoney
#_0F9FB9: LDA.w #$0F ; 999,999 >> 16
#_0F9FBC: STA.w $0407
#_0F9FBF: LDA.w #$423F ; 999,999 & 0xFFFF
#_0F9FC2: STA.w $0405

.clipMAG
#_0F9FC5: LDA.w $040B
#_0F9FC8: BPL .magpositive

#_0F9FCA: STZ.w $0409
#_0F9FCD: STZ.w $040B

#_0F9FD0: BRA .done

.magpositive
#_0F9FD2: LDA.w $040B
#_0F9FD5: BEQ .done

#_0F9FD7: CMP.w #$01 ; 100,000 >> 16
#_0F9FDA: BNE .checkmaglow

#_0F9FDC: LDA.w $0409
#_0F9FDF: CMP.w #$86A0 ; 100,000 & 0xFFFF
#_0F9FE2: BCC .done

.checkmaglow
#_0F9FE4: LDA.w #$01 ; 99,999 >> 16
#_0F9FE7: STA.w $0407
#_0F9FEA: LDA.w #$869F ; 99,999 & 0xFFFF
#_0F9FED: STA.w $0405

.done
#_0F9FF0: PLB

#_0F9FF1: PLP
#_0F9FF2: RTL

;===================================================================================================
; TODO document calculations
routine0F9FF3:
#_0F9FF3: PHP

#_0F9FF4: PHB
#_0F9FF5: PHK
#_0F9FF6: PLB

#_0F9FF7: REP #$30

#_0F9FF9: PHA
#_0F9FFA: PHX

#_0F9FFB: LDA.w DMA0SIZEL
#_0F9FFE: BEQ .no_pending_dma

#_0FA000: JSL AddSelfAsVectorAndMakeSpace

.no_pending_dma
#_0FA004: SEP #$30

#_0FA006: STZ.w MDMAEN

#_0FA009: LDA.w $0F06
#_0FA00C: AND.b #$FE
#_0FA00E: STA.w $0F06

#_0FA011: REP #$30

#_0FA013: PLX

#_0FA014: PLA
#_0FA015: PHA

#_0FA016: AND.w #$000F
#_0FA019: XBA
#_0FA01A: ASL A
#_0FA01B: ASL A
#_0FA01C: ASL A
#_0FA01D: CLC
#_0FA01E: ADC.w #$8000
#_0FA021: STA.w DMA0ADDRL

#_0FA024: PLA
#_0FA025: LSR A
#_0FA026: LSR A
#_0FA027: LSR A
#_0FA028: LSR A
#_0FA029: AND.w #$000F
#_0FA02C: CLC
#_0FA02D: ADC.w #$0024

#_0FA030: SEP #$20

#_0FA032: STA.w DMA0ADDRB

#_0FA035: REP #$20

#_0FA037: TXA
#_0FA038: AND.w #$00FF
#_0FA03B: XBA
#_0FA03C: ASL A
#_0FA03D: ASL A
#_0FA03E: STA.w $0F07

#_0FA041: LDA.w #$0800
#_0FA044: STA.w DMA0SIZEL

#_0FA047: SEP #$20

#_0FA049: LDA.b #$01
#_0FA04B: STA.w DMA0MODE

#_0FA04E: LDA.b #VMDATA
#_0FA050: STA.w DMA0PORT

#_0FA053: LDA.b #$01
#_0FA055: STA.w $0F06

#_0FA058: JSL AddSelfAsVectorAndMakeSpace

#_0FA05C: PLB

#_0FA05D: PLP
#_0FA05E: RTL

;===================================================================================================

R0FA05F_DoesVRAMDMAs:
#_0FA05F: PHP

#_0FA060: PHB
#_0FA061: PHK
#_0FA062: PLB

#_0FA063: SEP #$30

#_0FA065: LDA.b #$0C
#_0FA067: LDX.b #$00
#_0FA069: LDY.b #$01
#_0FA06B: JSL GraduallyFadeStuff

#_0FA06F: JSL routine02E350

#_0FA073: LDA.b #$01
#_0FA075: JSL VRAM_From_7FXXXX

#_0FA079: JSL AddSelfAsVectorAndMakeSpace

#_0FA07D: SEP #$30

#_0FA07F: LDA.w $0A6B
#_0FA082: AND.b #$FF ; why?
#_0FA084: STA.w $0F51

#_0FA087: LDA.w $0A6D
#_0FA08A: AND.b #$FF ; seriously? why?
#_0FA08C: STA.w $0F53

#_0FA08F: LDA.w $0A5B
#_0FA092: STA.w $0A59

#_0FA095: JSL routine02E350

#_0FA099: LDA.b #$00
#_0FA09B: JSL VRAM_From_7FXXXX

#_0FA09F: JSL AddSelfAsVectorAndMakeSpace

;---------------------------------------------------------------------------------------------------

#_0FA0A3: REP #$20

#_0FA0A5: LDA.w #$FFFF
#_0FA0A8: STA.w $0A9B

#_0FA0AB: SEP #$30

#_0FA0AD: LDA.w $0A6B
#_0FA0B0: AND.b #$FF ; you keep doing this
#_0FA0B2: STA.w $0F4D

#_0FA0B5: LDA.w $0A6D
#_0FA0B8: AND.b #$FF ; why do you keep doing this?
#_0FA0BA: STA.w $0F4F

#_0FA0BD: LDA.w $0F74
#_0FA0C0: ORA.b #$01
#_0FA0C2: STA.w $0F74
#_0FA0C5: STA.w TM

#_0FA0C8: LDA.b #$29
#_0FA0CA: STA.w $0F48
#_0FA0CD: STA.w BG2SC

#_0FA0D0: LDA.b #$44
#_0FA0D2: STA.w $0F4B
#_0FA0D5: STA.w BG12NBA

#_0FA0D8: LDA.b #$0C
#_0FA0DA: LDX.b #$00
#_0FA0DC: LDY.b #$01
#_0FA0DE: JSL routine0091A1

#_0FA0E2: SEP #$20

#_0FA0E4: LDA.b #$FF
#_0FA0E6: STA.w $0EEF

#_0FA0E9: PLB

#_0FA0EA: PLP
#_0FA0EB: RTL

;===================================================================================================

routine0FA0EC:
#_0FA0EC: PHP

#_0FA0ED: PHB
#_0FA0EE: PHK
#_0FA0EF: PLB

#_0FA0F0: REP #$30

#_0FA0F2: STZ.w $0E00

#_0FA0F5: LDA.w #$00EC
#_0FA0F8: JSL TestGameProgressBit
#_0FA0FC: BCC .branch0FA104

#_0FA0FE: INC.w $0E00
#_0FA101: INC.w $0E00

.branch0FA104
#_0FA104: LDY.w $0E00

#_0FA107: LDA.w .multiplicand,Y
#_0FA10A: STA.w $0E10

#_0FA10D: LDA.w $0A14
#_0FA110: STA.w $0E12

#_0FA113: JSL BigMultiplication_long

#_0FA117: LDA.w $0E14
#_0FA11A: STA.w $0E02

#_0FA11D: LDA.w $0E16
#_0FA120: STA.w $0E04

#_0FA123: LDY.w $0E00
#_0FA126: LDA.w .multiplicand,Y
#_0FA129: STA.w $0E10

#_0FA12C: LDA.w $0A16
#_0FA12F: STA.w $0E12
#_0FA132: JSL BigMultiplication_long

#_0FA136: LDA.w $0E02
#_0FA139: STA.w $0A14
#_0FA13C: LDA.w $0E04

#_0FA13F: CLC
#_0FA140: ADC.w $0E14
#_0FA143: STA.w $0A16

#_0FA146: PLB
#_0FA147: PLP
#_0FA148: RTL

.multiplicand:
#_0FA149: dw $000A
#_0FA14B: dw $0001

;===================================================================================================
; TODO seems to be seraph angel deletion
routine0FA14D:
#_0FA14D: SEP #$20

#_0FA14F: LDA.b #$03
#_0FA151: STA.w $0A3B

#_0FA154: REP #$30

#_0FA156: LDA.w #$0020
#_0FA159: STA.w $0BED

#_0FA15C: LDA.w #$0021
#_0FA15F: STA.w $0BEF

#_0FA162: LDA.w #$0022
#_0FA165: STA.w $0BF1

#_0FA168: LDA.w #$0133
#_0FA16B: STA.w $0C0B

#_0FA16E: LDX.w #$0180

.next
#_0FA171: LDA.w $1000,X
#_0FA174: BPL .skip

#_0FA176: LDA.w $1004,X
#_0FA179: CMP.w #$0020 ; Gabriel
#_0FA17C: BEQ .is_seraph_angel

#_0FA17E: CMP.w #$0021 ; Raphael
#_0FA181: BEQ .is_seraph_angel

#_0FA183: CMP.w #$0022 ; Uriel
#_0FA186: BNE .skip

.is_seraph_angel
#_0FA188: LDA.w #$0000
#_0FA18B: STA.w $1000,X

#_0FA18E: JSL routine0F853F

.skip
#_0FA192: TXA
#_0FA193: CLC
#_0FA194: ADC.w #$0060
#_0FA197: TAX

#_0FA198: CMP.w #$0600
#_0FA19B: BNE .next

#_0FA19D: JSL routine029E97

#_0FA1A1: RTL

;===================================================================================================

routine0FA1A2:
#_0FA1A2: PHP

#_0FA1A3: PHB
#_0FA1A4: PHK
#_0FA1A5: PLB

#_0FA1A6: SEP #$30

#_0FA1A8: LDA.b #$51
#_0FA1AA: JSL TestGameProgressBit
#_0FA1AE: BCC .branch0FA1D2

#_0FA1B0: LDA.b #$55
#_0FA1B2: JSL TestGameProgressBit
#_0FA1B6: BCS .branch0FA1D2

; TODO make sure mirror moon phase matches?
#_0FA1B8: LDA.w $040F
#_0FA1BB: EOR.w $07EE
#_0FA1BE: AND.b #$F0
#_0FA1C0: BEQ .branch0FA1D2

#_0FA1C2: INC.w $07EF

#_0FA1C5: LDA.w $07EF
#_0FA1C8: CMP.b #$20
#_0FA1CA: BNE .branch0FA1D2

#_0FA1CC: LDA.b #$55
#_0FA1CE: JSL SetGameProgressBit_long

;---------------------------------------------------------------------------------------------------

.branch0FA1D2
#_0FA1D2: LDA.b #$52
#_0FA1D4: JSL TestGameProgressBit
#_0FA1D8: BCS .branch0FA202

#_0FA1DA: LDA.b #$4B
#_0FA1DC: JSL TestGameProgressBit
#_0FA1E0: BCC .branch0FA202

#_0FA1E2: LDA.w $040F
#_0FA1E5: EOR.w $07EE
#_0FA1E8: AND.b #$F0
#_0FA1EA: BEQ .branch0FA202

#_0FA1EC: LDA.w $040F
#_0FA1EF: AND.b #$F0
#_0FA1F1: CMP.b #$80
#_0FA1F3: BNE .branch0FA202

#_0FA1F5: LDA.b #$80
#_0FA1F7: STA.w $07F1
#_0FA1FA: LDA.w $0404
#_0FA1FD: BEQ .branch0FA202

#_0FA1FF: INC.w $07F1

;---------------------------------------------------------------------------------------------------

.branch0FA202
#_0FA202: SEP #$30

#_0FA204: LDA.b #$58
#_0FA206: JSL TestGameProgressBit
#_0FA20A: BCS .branch0FA22E

#_0FA20C: LDA.b #$57
#_0FA20E: JSL TestGameProgressBit
#_0FA212: BCC .branch0FA22E

#_0FA214: LDA.w $040F
#_0FA217: EOR.w $07EE
#_0FA21A: AND.b #$F0
#_0FA21C: BEQ .branch0FA22E

#_0FA21E: INC.w $07F0
#_0FA221: LDA.w $07F0
#_0FA224: CMP.b #$50
#_0FA226: BNE .branch0FA22E

#_0FA228: LDA.b #$58
#_0FA22A: JSL SetGameProgressBit_long

;---------------------------------------------------------------------------------------------------

.branch0FA22E
#_0FA22E: LDA.w $0404
#_0FA231: BEQ .branch0FA253

#_0FA233: LDA.w $040F
#_0FA236: AND.b #$F0
#_0FA238: BNE .branch0FA247

#_0FA23A: REP #$20

#_0FA23C: LDA.w $0400
#_0FA23F: AND.w #$FF7F
#_0FA242: STA.w $0400

#_0FA245: BRA .branch0FA253

.branch0FA247
#_0FA247: SEP #$20

#_0FA249: CMP.b #$80
#_0FA24B: BNE .branch0FA253

#_0FA24D: STZ.w $0588
#_0FA250: STZ.w $0589

.branch0FA253
#_0FA253: SEP #$20

#_0FA255: LDA.w $040F
#_0FA258: STA.w $07EE

#_0FA25B: PLB

#_0FA25C: PLP
#_0FA25D: RTL

;===================================================================================================

routine0FA25E:
#_0FA25E: PHP

#_0FA25F: PHB
#_0FA260: PHK
#_0FA261: PLB

#_0FA262: REP #$20

#_0FA264: LDA.w #$0007
#_0FA267: STA.w $0E00
#_0FA26A: JSL routine0392C1_long

#_0FA26E: REP #$20

#_0FA270: JSL GetNextTextByte_long
#_0FA274: AND.w #$00FF
#_0FA277: JSL routine02AD0D

#_0FA27B: SEP #$20
#_0FA27D: LDA.w $0A58
#_0FA280: BMI .branch0FA2A9

#_0FA282: LDA.w $0B79
#_0FA285: CMP.b #$01
#_0FA287: BEQ .branch0FA28F

#_0FA289: JSL routine0FA2B4
#_0FA28D: BRA .branch0FA2A2

.branch0FA28F
#_0FA28F: SEP #$30
#_0FA291: LDA.w $0C39
#_0FA294: SEC
#_0FA295: SBC.b #$E4
#_0FA297: TAX
#_0FA298: LDA.l RagsGemToItemTrades,X
#_0FA29C: STA.w $0A50
#_0FA29F: STZ.w $0A51

.branch0FA2A2
#_0FA2A2: JSL GetNextTextByte_long
#_0FA2A6: PLB
#_0FA2A7: PLP
#_0FA2A8: RTL

.branch0FA2A9
#_0FA2A9: JSL GetNextTextByte_long
#_0FA2AD: JSL RelocateTextPointer_long
#_0FA2B1: PLB
#_0FA2B2: PLP
#_0FA2B3: RTL

;===================================================================================================

routine0FA2B4:
#_0FA2B4: PHP
#_0FA2B5: PHB
#_0FA2B6: PHK
#_0FA2B7: PLB

#_0FA2B8: SEP #$30
#_0FA2BA: LDY.b #$00

.branch0FA2BC
#_0FA2BC: LDA.w data0FA313,Y
#_0FA2BF: JSR routine0FA2FE
#_0FA2C2: BCC .branch0FA2D4

#_0FA2C4: LDA.w data0FA314,Y
#_0FA2C7: JSR routine0FA2FE
#_0FA2CA: BCC .branch0FA2D4

#_0FA2CC: LDA.w data0FA315,Y
#_0FA2CF: JSR routine0FA2FE
#_0FA2D2: BCS .branch0FA2E4

.branch0FA2D4
#_0FA2D4: INY
#_0FA2D5: INY
#_0FA2D6: INY
#_0FA2D7: INY
#_0FA2D8: CPY.b #$20
#_0FA2DA: BNE .branch0FA2BC

#_0FA2DC: LDA.b #$FF
#_0FA2DE: STA.w $050A
#_0FA2E1: PLB
#_0FA2E2: PLP
#_0FA2E3: RTL

.branch0FA2E4
#_0FA2E4: LDA.w data0FA316,Y
#_0FA2E7: STA.w $050A
#_0FA2EA: STA.w $0BED
#_0FA2ED: STZ.w $050B
#_0FA2F0: STA.w $0BEE
#_0FA2F3: LDA.b #$0A
#_0FA2F5: STA.w $0506
#_0FA2F8: STZ.w $0507
#_0FA2FB: PLB
#_0FA2FC: PLP
#_0FA2FD: RTL

;===================================================================================================

routine0FA2FE:
#_0FA2FE: SEP #$20
#_0FA300: CMP.w $0C39
#_0FA303: BEQ .EXIT_SEC_0FA311

#_0FA305: CMP.w $0C3B
#_0FA308: BEQ .EXIT_SEC_0FA311

#_0FA30A: CMP.w $0C3D
#_0FA30D: BEQ .EXIT_SEC_0FA311

#_0FA30F: CLC
#_0FA310: RTS

.EXIT_SEC_0FA311
#_0FA311: SEC
#_0FA312: RTS

; TODO MERGE
data0FA313:
#_0FA313: db $E7

data0FA314:
#_0FA314: db $EA

data0FA315:
#_0FA315: db $E4

data0FA316:
#_0FA316: db $3E,$E8,$E9,$E6,$3F,$EC,$ED,$EF
#_0FA31E: db $40,$E8,$EE,$EB,$41,$E9,$E4,$E5
#_0FA326: db $42,$E9,$EF,$E6,$43,$EE,$ED,$EF
#_0FA32E: db $44,$ED,$E5,$EB,$45

;===================================================================================================

routine0FA333:
#_0FA333: PHB
#_0FA334: PHK
#_0FA335: PLB

#_0FA336: SEP #$30
#_0FA338: LDX.w $07E1
#_0FA33B: LDA.w data0FA369,X
#_0FA33E: ORA.w $07F2
#_0FA341: STA.w $07F2
#_0FA344: PLB
#_0FA345: RTL

;===================================================================================================

routine0FA346:
#_0FA346: PHP
#_0FA347: PHB
#_0FA348: PHK
#_0FA349: PLB

#_0FA34A: SEP #$30
#_0FA34C: LDX.w $07E1
#_0FA34F: LDA.w data0FA369,X
#_0FA352: AND.w $07F2
#_0FA355: BNE .branch0FA35E

#_0FA357: JSL GetNextTextByte_long
#_0FA35B: PLB
#_0FA35C: PLP
#_0FA35D: RTL

.branch0FA35E
#_0FA35E: JSL GetNextTextByte_long
#_0FA362: JSL RelocateTextPointer_long

#_0FA366: PLB
#_0FA367: PLP
#_0FA368: RTL

data0FA369:
#_0FA369: db $01,$02,$04,$08,$10,$20,$40,$80

;===================================================================================================

routine0FA371:
#_0FA371: REP #$30
#_0FA373: LDX.w #$0000

.branch0FA376
#_0FA376: PHX
#_0FA377: PHP
#_0FA378: LDA.w $0F4D
#_0FA37B: AND.w #$0007
#_0FA37E: BNE .branch0FA383

#_0FA380: JSR routine0FA397

.branch0FA383
#_0FA383: INC.w $0F4D
#_0FA386: INC.w $0F4D
#_0FA389: JSL AddSelfAsVector
#_0FA38D: PLP
#_0FA38E: PLX
#_0FA38F: INX
#_0FA390: INX
#_0FA391: CPX.w #$0100
#_0FA394: BNE .branch0FA376

#_0FA396: RTL

;===================================================================================================

routine0FA397:
#_0FA397: LDA.w $0F4D
#_0FA39A: LSR A
#_0FA39B: LSR A
#_0FA39C: LSR A
#_0FA39D: AND.w #$001F
#_0FA3A0: ASL A
#_0FA3A1: TAX
#_0FA3A2: LDY.w #$001F

.branch0FA3A5
#_0FA3A5: LDA.w #$0000
#_0FA3A8: STA.l $7F7000,X
#_0FA3AC: TXA
#_0FA3AD: CLC
#_0FA3AE: ADC.w #$0040
#_0FA3B1: TAX
#_0FA3B2: DEY
#_0FA3B3: BPL .branch0FA3A5

#_0FA3B5: LDA.w #$0000
#_0FA3B8: JSL VRAM_From_7FXXXX
#_0FA3BC: RTS

;===================================================================================================

routine0FA3BD:
#_0FA3BD: PHP
#_0FA3BE: JSL Reset_OAMrelatedWRAM

#_0FA3C2: REP #$30
#_0FA3C4: LDA.w #$0027
#_0FA3C7: JSL routine02F609
#_0FA3CB: STZ.w $0578
#_0FA3CE: LDA.w $0C0B
#_0FA3D1: STA.w $050A
#_0FA3D4: STZ.w $0524
#_0FA3D7: LDA.w #$0001
#_0FA3DA: STA.w $050E
#_0FA3DD: JSL LoadDemonStats
#_0FA3E1: LDA.w #$0600
#_0FA3E4: STA.w $0715
#_0FA3E7: JSL routine0183E5

#_0FA3EB: SEP #$30
#_0FA3ED: LDA.b #$07
#_0FA3EF: JSL InitializeTextBoxToSizeForNewMessage
#_0FA3F3: JSL routine00A056
#_0FA3F7: PLP
#_0FA3F8: RTL

;===================================================================================================

routine0FAEF9:
#_0FA3F9: JSL routine0380FA

#_0FA3FD: REP #$20
#_0FA3FF: AND.w #$FFFF
#_0FA402: BEQ .branch0FA409

#_0FA404: JSL GetNextTextByte_long
#_0FA408: RTL

.branch0FA409
#_0FA409: JSL GetNextTextByte_long
#_0FA40D: JSL RelocateTextPointer_long
#_0FA411: RTL

;===================================================================================================

; TODO stat creation?
routine0FA412:
#_0FA412: SEP #$20
#_0FA414: REP #$10
#_0FA416: LDX.w #$0000
#_0FA419: LDY.w #$0000

.branch0FA41C
#_0FA41C: LDA.w $0781,X
#_0FA41F: BEQ .branch0FA429

#_0FA421: LDA.w $0780,X
#_0FA424: CMP.b #$F0
#_0FA426: BCS .branch0FA429

#_0FA428: INY

.branch0FA429
#_0FA429: INX
#_0FA42A: INX
#_0FA42B: CPX.w #$003C
#_0FA42E: BNE .branch0FA41C

#_0FA430: REP #$30
#_0FA432: STY.w $0E00
#_0FA435: LDX.w #$0000

.branch0FA438
#_0FA438: PHX
#_0FA439: LDA.w $1000,X
#_0FA43C: BPL .branch0FA451

#_0FA43E: LDY.w #$0006

.branch0FA441
#_0FA441: LDA.w $1042,X
#_0FA444: CMP.w #$FFFF
#_0FA447: BEQ .branch0FA44C

#_0FA449: INC.w $0E00

.branch0FA44C
#_0FA44C: INX
#_0FA44D: INX
#_0FA44E: DEY
#_0FA44F: BPL .branch0FA441

.branch0FA451
#_0FA451: PLX
#_0FA452: TXA
#_0FA453: CLC
#_0FA454: ADC.w #$0060
#_0FA457: TAX
#_0FA458: CMP.w #$0180
#_0FA45B: BNE .branch0FA438

#_0FA45D: LDA.w $0E00
#_0FA460: BEQ .branch0FA467

#_0FA462: JSL GetNextTextByte_long
#_0FA466: RTL

.branch0FA467
#_0FA467: JSL GetNextTextByte_long
#_0FA46B: JSL RelocateTextPointer_long
#_0FA46F: RTL

;===================================================================================================

routine0FA470:
#_0FA470: PHP
#_0FA471: PHB
#_0FA472: PHK
#_0FA473: PLB
#_0FA474: JSL routine0FA4FB

#_0FA478: REP #$30
#_0FA47A: LDA.w $0A3B
#_0FA47D: AND.w #$00FF
#_0FA480: BNE .branch0FA4B5

#_0FA482: SEP #$30
#_0FA484: LDY.b #$00

.branch0FA486
#_0FA486: TYX
#_0FA487: INX
#_0FA488: INX

.branch0FA489
#_0FA489: LDA.w $0780,Y
#_0FA48C: CMP.b #$E4
#_0FA48E: BCS .branch0FA4AE

#_0FA490: STA.w $0E00
#_0FA493: LDA.w $0780,X
#_0FA496: CMP.b #$E4
#_0FA498: BCS .branch0FA4A8

#_0FA49A: CMP.w $0E00
#_0FA49D: BCS .branch0FA4A2

#_0FA49F: JSR routine0FA4E8

.branch0FA4A2
#_0FA4A2: INX
#_0FA4A3: INX
#_0FA4A4: CPX.b #$3C
#_0FA4A6: BNE .branch0FA489

.branch0FA4A8
#_0FA4A8: INY
#_0FA4A9: INY
#_0FA4AA: CPY.b #$3A
#_0FA4AC: BNE .branch0FA486

.branch0FA4AE
#_0FA4AE: JSL CountAndArrangeGemsOrSomething
#_0FA4B2: PLB
#_0FA4B3: PLP
#_0FA4B4: RTL

.branch0FA4B5
#_0FA4B5: SEP #$30
#_0FA4B7: LDY.b #$00

.branch0FA4B9
#_0FA4B9: TYX
#_0FA4BA: INX
#_0FA4BB: INX

.branch0FA4BC
#_0FA4BC: LDA.w $0780,Y
#_0FA4BF: CMP.b #$E4
#_0FA4C1: BCS .branch0FA4E1

#_0FA4C3: STA.w $0E00
#_0FA4C6: LDA.w $0780,X
#_0FA4C9: CMP.b #$E4
#_0FA4CB: BCS .branch0FA4DB

#_0FA4CD: CMP.w $0E00
#_0FA4D0: BCC .branch0FA4D5

#_0FA4D2: JSR routine0FA4E8

.branch0FA4D5
#_0FA4D5: INX
#_0FA4D6: INX
#_0FA4D7: CPX.b #$3C
#_0FA4D9: BNE .branch0FA4BC

.branch0FA4DB
#_0FA4DB: INY
#_0FA4DC: INY
#_0FA4DD: CPY.b #$3A
#_0FA4DF: BNE .branch0FA4B9

.branch0FA4E1
#_0FA4E1: JSL CountAndArrangeGemsOrSomething
#_0FA4E5: PLB
#_0FA4E6: PLP
#_0FA4E7: RTL

;===================================================================================================

; TODO some item swap routine
routine0FA4E8:
#_0FA4E8: PHP
#_0FA4E9: REP #$20
#_0FA4EB: LDA.w $0780,X
#_0FA4EE: PHA
#_0FA4EF: LDA.w $0780,Y
#_0FA4F2: STA.w $0780,X
#_0FA4F5: PLA
#_0FA4F6: STA.w $0780,Y
#_0FA4F9: PLP
#_0FA4FA: RTS

;===================================================================================================

routine0FA4FB:
#_0FA4FB: PHP
#_0FA4FC: PHB
#_0FA4FD: PHK
#_0FA4FE: PLB
#_0FA4FF: JSL CountAndArrangeGemsOrSomething

#_0FA503: SEP #$30
#_0FA505: LDY.b #$00

.branch0FA507
#_0FA507: TYX
#_0FA508: INX
#_0FA509: INX

.branch0FA50A
#_0FA50A: LDA.w $0780,Y
#_0FA50D: CMP.b #$E4
#_0FA50F: BCS .branch0FA542

#_0FA511: CMP.w $0780,X
#_0FA514: BNE .branch0FA536

#_0FA516: LDA.w $0781,Y
#_0FA519: CLC
#_0FA51A: ADC.w $0781,X
#_0FA51D: CMP.b #$09
#_0FA51F: BCC .branch0FA52E

#_0FA521: SEC
#_0FA522: SBC.b #$09
#_0FA524: STA.w $0781,X
#_0FA527: LDA.b #$09
#_0FA529: STA.w $0781,Y
#_0FA52C: BRA .branch0FA536

.branch0FA52E
#_0FA52E: STA.w $0781,Y
#_0FA531: LDA.b #$00
#_0FA533: STA.w $0781,X

.branch0FA536
#_0FA536: INX
#_0FA537: INX
#_0FA538: CPX.b #$3C
#_0FA53A: BNE .branch0FA50A

#_0FA53C: INY
#_0FA53D: INY
#_0FA53E: CPY.b #$3A
#_0FA540: BNE .branch0FA507

.branch0FA542
#_0FA542: JSL CountAndArrangeGemsOrSomething
#_0FA546: PLB
#_0FA547: PLP
#_0FA548: RTL

; TODO POSSIBLY UNUSED ROUTINE
routine0FA549:
#_0FA549: PHP
#_0FA54A: PHB
#_0FA54B: PHK
#_0FA54C: PLB

#_0FA54D: SEP #$30
#_0FA54F: LDX.b #$00

.branch0FA551
#_0FA551: LDA.w $0410,X
#_0FA554: CMP.w data0FA566,X
#_0FA557: BNE .exit_clc

#_0FA559: INX
#_0FA55A: CPX.b #$08
#_0FA55C: BNE .branch0FA551

#_0FA55E: PLB
#_0FA55F: PLP
#_0FA560: SEC
#_0FA561: RTL

.exit_clc
#_0FA562: PLB
#_0FA563: PLP
#_0FA564: CLC
#_0FA565: RTL

; TODO map squares?
data0FA566:
#_0FA566: db $12,$13,$0E,$0F,$17,$19,$0E,$0F
#_0FA56E: db $44,$A7,$AE,$A5,$44,$A7,$17,$A6
#_0FA576: db $44,$A7,$79,$A6,$44,$A7,$DB,$A6
#_0FA57E: db $1B,$AF,$1C,$AE,$4A,$B6,$4B,$B5
#_0FA586: db $1B,$AF,$B2,$AE,$4A,$B6,$E1,$B5
#_0FA58E: db $54,$BF,$6A,$BD,$54,$BF,$CC,$BD
#_0FA596: db $54,$BF,$2E,$BE,$54,$BF,$90,$BE
#_0FA59E: db $54,$BF,$F2,$BE,$29,$C6,$FC,$C4
#_0FA5A6: db $29,$C6,$65,$C5,$29,$C6,$C7,$C5
#_0FA5AE: db $00,$01,$02,$03,$00,$01,$02,$03
#_0FA5B6: db $00,$01,$02,$03,$00,$01,$02,$04
#_0FA5BE: db $01,$05,$06,$04,$01,$05,$06,$04
#_0FA5C6: db $01,$05,$06,$04,$01,$05,$07,$01
#_0FA5CE: db $08,$09,$07,$01,$08,$09,$07,$01
#_0FA5D6: db $08,$09,$07,$01,$08,$0A,$0B,$0C
#_0FA5DE: db $0D,$0A,$0B,$0C,$0D,$0A,$0E,$0C
#_0FA5E6: db $0D,$0A,$0B,$0C,$0F,$10,$11,$12
#_0FA5EE: db $0F,$10,$11,$12,$0F,$10,$11,$12
#_0FA5F6: db $0F,$10,$11,$13,$14,$15,$16,$17
#_0FA5FE: db $18,$19,$1A,$1B,$18,$1C,$1D,$1E
#_0FA606: db $1F,$20,$21,$22,$23,$24,$24,$25
#_0FA60E: db $26,$26,$26,$27,$24,$24,$28,$29
#_0FA616: db $2A,$2B,$2C,$2D,$2E,$2F,$30,$31
#_0FA61E: db $32,$30,$33,$34,$35,$36,$37,$38
#_0FA626: db $39,$3A,$3B,$3C,$3D,$31,$32,$3D
#_0FA62E: db $3E,$3F,$40,$41,$42,$43,$44,$45
#_0FA636: db $46,$47,$48,$31,$32,$48,$49,$4A
#_0FA63E: db $4B,$4C,$4D,$4E,$4F,$50,$51,$52
#_0FA646: db $53,$31,$32,$53,$54,$55,$56,$57
#_0FA64E: db $58,$2B,$2C,$2D,$2E,$2F,$30,$31
#_0FA656: db $32,$30,$33,$34,$35,$36,$37,$59
#_0FA65E: db $5A,$5B,$5C,$5D,$5E,$5F,$60,$5E
#_0FA666: db $61,$62,$63,$64,$65,$66,$66,$66
#_0FA66E: db $66,$66,$66,$66,$66,$66,$66,$66
#_0FA676: db $66,$66,$66,$67,$67,$68,$69,$67
#_0FA67E: db $67,$67,$67,$67,$67,$6A,$6B,$67
#_0FA686: db $67,$67,$67,$6C,$69,$67,$67,$67
#_0FA68E: db $67,$67,$67,$6A,$6D,$67,$67,$6E
#_0FA696: db $67,$6C,$6D,$67,$67,$67,$67,$67
#_0FA69E: db $67,$6C,$6D,$67,$6F,$70,$67,$6C
#_0FA6A6: db $71,$67,$67,$67,$67,$67,$72,$73
#_0FA6AE: db $6D,$67,$74,$75,$76,$77,$78,$79
#_0FA6B6: db $7A,$7B,$7C,$7D,$7E,$7F,$80,$81
#_0FA6BE: db $82,$83,$84,$85,$86,$87,$87,$87
#_0FA6C6: db $87,$87,$87,$88,$89,$8A,$8B,$8C
#_0FA6CE: db $87,$87,$87,$87,$87,$87,$87,$87
#_0FA6D6: db $87,$87,$87,$87,$8D,$8E,$8F,$90
#_0FA6DE: db $91,$92,$93,$94,$95,$96,$93,$97
#_0FA6E6: db $98,$99,$8F,$9A,$9B,$9C,$9D,$9E
#_0FA6EE: db $9F,$A0,$A1,$A2,$A3,$A4,$A5,$A6
#_0FA6F6: db $A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE
#_0FA6FE: db $AF,$B0,$B1,$B2,$B3,$B4,$B5,$B6
#_0FA706: db $B7,$B8,$AA,$B9,$AC,$AD,$AE,$BA
#_0FA70E: db $BB,$B1,$BC,$BD,$B4,$B5,$B6,$BE
#_0FA716: db $B8,$AA,$BF,$AC,$AD,$AE,$C0,$C1
#_0FA71E: db $C2,$C3,$C4,$B4,$B5,$B6,$C5,$B8
#_0FA726: db $C6,$AB,$C7,$C8,$C9,$CA,$CB,$93
#_0FA72E: db $CC,$CD,$CE,$CF,$D0,$B7,$D1,$D2
#_0FA736: db $D3,$D4,$D5,$D6,$D6,$D6,$D6,$D6
#_0FA73E: db $D6,$D6,$D7,$D8,$D9,$DA,$83,$48
#_0FA746: db $85,$08,$87,$48,$89,$08,$80,$08
#_0FA74E: db $81,$08,$80,$08,$81,$08,$82,$08
#_0FA756: db $83,$08,$86,$08,$87,$08,$84,$08
#_0FA75E: db $84,$48,$88,$08,$88,$08,$8B,$48
#_0FA766: db $8D,$08,$8F,$48,$91,$08,$8A,$08
#_0FA76E: db $8B,$08,$8E,$08,$8F,$08,$8C,$08
#_0FA776: db $8C,$48,$90,$08,$90,$48,$8F,$48
#_0FA77E: db $91,$08,$8F,$48,$91,$08,$8E,$08
#_0FA786: db $8F,$08,$8E,$08,$8F,$08,$92,$08
#_0FA78E: db $92,$48,$88,$08,$88,$08,$96,$48
#_0FA796: db $98,$08,$9B,$08,$9C,$08,$93,$08
#_0FA79E: db $94,$08,$88,$08,$99,$08,$95,$08
#_0FA7A6: db $96,$08,$9A,$08,$9B,$08,$97,$08
#_0FA7AE: db $97,$08,$9B,$08,$9B,$08,$80,$08
#_0FA7B6: db $81,$08,$88,$08,$99,$08,$9E,$48
#_0FA7BE: db $A3,$08,$A1,$48,$A4,$08,$88,$08
#_0FA7C6: db $99,$08,$88,$08,$99,$08,$9D,$08
#_0FA7CE: db $9E,$08,$A0,$08,$A1,$08,$9F,$08
#_0FA7D6: db $9F,$08,$A2,$08,$A2,$08,$A6,$08
#_0FA7DE: db $A7,$08,$B0,$48,$AF,$48,$88,$08
#_0FA7E6: db $99,$08,$B8,$48,$AE,$48,$A5,$08
#_0FA7EE: db $A6,$08,$AD,$48,$AC,$48,$A6,$08
#_0FA7F6: db $A6,$08,$AB,$48,$AA,$48,$A6,$08
#_0FA7FE: db $A7,$08,$A9,$08,$A9,$08,$88,$08
#_0FA806: db $99,$08,$A9,$08,$A9,$08,$A5,$08
#_0FA80E: db $A6,$08,$A8,$48,$B7,$08,$A6,$08
#_0FA816: db $A6,$08,$B7,$08,$B7,$08,$A6,$08
#_0FA81E: db $A7,$08,$B7,$08,$A8,$08,$A5,$08
#_0FA826: db $A6,$08,$A9,$08,$A9,$08,$A6,$08
#_0FA82E: db $A6,$08,$AA,$08,$AB,$08,$A6,$08
#_0FA836: db $A7,$08,$AC,$08,$AD,$08,$88,$08
#_0FA83E: db $99,$08,$AE,$08,$B8,$08,$A5,$08
#_0FA846: db $A6,$08,$AF,$08,$B0,$08,$A9,$48
#_0FA84E: db $A9,$48,$B6,$48,$B5,$48,$B4,$48
#_0FA856: db $B6,$48,$B9,$48,$B7,$08,$B5,$48
#_0FA85E: db $AD,$48,$B7,$08,$B7,$08,$B7,$08
#_0FA866: db $B7,$08,$B7,$08,$B7,$08,$B7,$08
#_0FA86E: db $B1,$48,$B1,$48,$A9,$08,$A9,$08
#_0FA876: db $A9,$08,$A9,$08,$A9,$08,$B1,$08
#_0FA87E: db $B7,$08,$A9,$08,$B1,$08,$AD,$08
#_0FA886: db $B5,$08,$B7,$08,$B7,$08,$B6,$08
#_0FA88E: db $B4,$08,$B7,$08,$B9,$08,$A9,$48
#_0FA896: db $A9,$48,$B5,$08,$B6,$08,$CF,$08
#_0FA89E: db $D0,$08,$CF,$08,$D0,$08,$D0,$08
#_0FA8A6: db $D1,$08,$D0,$08,$D1,$08,$D2,$08
#_0FA8AE: db $D3,$08,$D2,$08,$D3,$08,$D0,$08
#_0FA8B6: db $E9,$08,$D0,$08,$E9,$08,$D1,$08
#_0FA8BE: db $CF,$08,$D1,$08,$CF,$08,$D0,$08
#_0FA8C6: db $D0,$08,$D0,$08,$D0,$08,$D1,$08
#_0FA8CE: db $D4,$08,$D1,$08,$D4,$08,$D4,$48
#_0FA8D6: db $D1,$08,$D4,$48,$D1,$08,$CF,$48
#_0FA8DE: db $D1,$08,$CF,$48,$D1,$08,$E9,$48
#_0FA8E6: db $D0,$08,$E9,$48,$D0,$08,$D0,$08
#_0FA8EE: db $D2,$48,$D0,$08,$D2,$48,$D1,$08
#_0FA8F6: db $D0,$08,$D1,$08,$D0,$08,$D0,$08
#_0FA8FE: db $CF,$48,$D0,$08,$CF,$48,$CF,$08
#_0FA906: db $D0,$08,$D5,$08,$D6,$08,$D0,$08
#_0FA90E: db $D1,$08,$D6,$08,$D1,$08,$D2,$08
#_0FA916: db $D3,$08,$D2,$08,$D7,$08,$D0,$08
#_0FA91E: db $E9,$08,$D6,$08,$D8,$08,$D1,$08
#_0FA926: db $CF,$08,$D1,$08,$D5,$08,$D0,$08
#_0FA92E: db $D0,$08,$D6,$08,$D6,$08,$CF,$48
#_0FA936: db $D1,$08,$D5,$48,$D1,$08,$E9,$48
#_0FA93E: db $D0,$08,$D8,$48,$D6,$08,$D0,$08
#_0FA946: db $D2,$48,$D6,$08,$D2,$48,$D1,$08
#_0FA94E: db $D0,$08,$D1,$08,$D6,$08,$D0,$08
#_0FA956: db $CF,$48,$D6,$08,$D5,$48,$D9,$08
#_0FA95E: db $DA,$08,$D9,$08,$DA,$08,$DA,$08
#_0FA966: db $D1,$08,$DA,$08,$D1,$08,$D2,$08
#_0FA96E: db $DA,$08,$D2,$08,$DA,$08,$DA,$08
#_0FA976: db $DB,$08,$DA,$08,$DB,$08,$D1,$08
#_0FA97E: db $D9,$08,$D1,$08,$D9,$08,$DA,$08
#_0FA986: db $DA,$08,$DA,$08,$DA,$08,$D9,$48
#_0FA98E: db $D1,$08,$D9,$48,$D1,$08,$DB,$48
#_0FA996: db $DA,$08,$DB,$48,$DA,$08,$DA,$08
#_0FA99E: db $D2,$48,$DA,$08,$D2,$48,$D1,$08
#_0FA9A6: db $DA,$08,$D1,$08,$DA,$08,$DA,$08
#_0FA9AE: db $D9,$48,$DA,$08,$D9,$48,$DC,$08
#_0FA9B6: db $DD,$08,$CF,$08,$D0,$08,$DD,$08
#_0FA9BE: db $D1,$08,$D0,$08,$D1,$08,$D2,$08
#_0FA9C6: db $EA,$08,$D2,$08,$D3,$08,$DD,$08
#_0FA9CE: db $DE,$08,$D0,$08,$E9,$08,$D1,$08
#_0FA9D6: db $DC,$08,$D1,$08,$CF,$08,$DD,$08
#_0FA9DE: db $DD,$08,$D0,$08,$D0,$08,$DC,$48
#_0FA9E6: db $D1,$08,$CF,$48,$D1,$08,$DE,$48
#_0FA9EE: db $DD,$08,$E9,$48,$D0,$08,$DD,$08
#_0FA9F6: db $D2,$48,$D0,$08,$D2,$48,$D1,$08
#_0FA9FE: db $DD,$08,$D1,$08,$D0,$08,$DD,$08
#_0FAA06: db $DC,$48,$D0,$08,$CF,$48,$DF,$08
#_0FAA0E: db $E0,$08,$E2,$08,$E3,$08,$E0,$08
#_0FAA16: db $D1,$08,$E3,$08,$E4,$08,$D2,$08
#_0FAA1E: db $E1,$08,$EC,$08,$E5,$08,$E0,$08
#_0FAA26: db $EB,$08,$E3,$08,$E6,$08,$D1,$08
#_0FAA2E: db $DF,$08,$E4,$08,$E2,$08,$E0,$08
#_0FAA36: db $E0,$08,$E3,$08,$E3,$08,$D1,$08
#_0FAA3E: db $D4,$08,$E4,$08,$E7,$08,$D4,$48
#_0FAA46: db $D1,$08,$E7,$48,$E4,$08,$DF,$48
#_0FAA4E: db $D1,$08,$E2,$48,$E4,$08,$EB,$48
#_0FAA56: db $E0,$08,$E6,$48,$E3,$08,$E1,$48
#_0FAA5E: db $D2,$48,$E5,$48,$EC,$48,$D1,$08
#_0FAA66: db $E0,$08,$E4,$08,$E3,$08,$E0,$08
#_0FAA6E: db $DF,$48,$E3,$08,$E2,$48,$E8,$08
#_0FAA76: db $E8,$08,$E8,$08,$E8,$08,$E9,$0C
#_0FAA7E: db $E9,$0C,$E9,$0C,$E9,$0C,$E9,$0C
#_0FAA86: db $EA,$0C,$E9,$0C,$C3,$4C,$EA,$4C
#_0FAA8E: db $E9,$0C,$EA,$4C,$E9,$0C,$E9,$0C
#_0FAA96: db $EA,$0C,$E9,$0C,$EA,$0C,$EA,$4C
#_0FAA9E: db $E9,$0C,$C3,$0C,$E9,$0C,$E9,$0C
#_0FAAA6: db $C3,$4C,$E9,$0C,$C3,$4C,$C3,$0C
#_0FAAAE: db $E9,$0C,$C3,$0C,$E9,$0C,$E9,$0C
#_0FAAB6: db $E9,$0C,$C4,$4C,$E9,$0C,$E9,$0C
#_0FAABE: db $E9,$0C,$E9,$0C,$C4,$0C,$E5,$4C
#_0FAAC6: db $E9,$0C,$C7,$4C,$E9,$0C,$C3,$0C
#_0FAACE: db $E7,$4C,$E6,$4C,$C6,$4C,$E9,$0C
#_0FAAD6: db $E8,$0C,$E9,$0C,$C5,$0C,$E7,$0C
#_0FAADE: db $C3,$4C,$C6,$0C,$E6,$0C,$E9,$0C
#_0FAAE6: db $E5,$0C,$E9,$0C,$C7,$0C,$CD,$4C
#_0FAAEE: db $CC,$4C,$D8,$4C,$D7,$4C,$E9,$0C
#_0FAAF6: db $E9,$0C,$D6,$4C,$E9,$0C,$E9,$0C
#_0FAAFE: db $EA,$0C,$E9,$0C,$E9,$0C,$CB,$4C
#_0FAB06: db $CA,$4C,$D5,$4C,$D4,$4C,$C9,$4C
#_0FAB0E: db $C8,$4C,$D3,$4C,$D2,$4C,$E9,$0C
#_0FAB16: db $E9,$0C,$D1,$4C,$D0,$4C,$E9,$0C
#_0FAB1E: db $E9,$0C,$CF,$4C,$CE,$0C,$E9,$0C
#_0FAB26: db $E9,$0C,$CE,$0C,$CF,$0C,$E9,$0C
#_0FAB2E: db $E9,$0C,$D0,$0C,$D1,$0C,$C8,$0C
#_0FAB36: db $C9,$0C,$D2,$0C,$D3,$0C,$CA,$0C
#_0FAB3E: db $CB,$0C,$D4,$0C,$D5,$0C,$EA,$4C
#_0FAB46: db $E9,$0C,$E9,$0C,$E9,$0C,$E9,$0C
#_0FAB4E: db $E9,$0C,$E9,$0C,$D6,$0C,$CC,$0C
#_0FAB56: db $CD,$0C,$D7,$0C,$D8,$0C,$DE,$4C
#_0FAB5E: db $E9,$0C,$E9,$0C,$E2,$4C,$DD,$4C
#_0FAB66: db $DC,$4C,$E1,$4C,$E0,$4C,$DB,$4C
#_0FAB6E: db $DA,$4C,$DF,$4C,$00,$0C,$D9,$4C
#_0FAB76: db $00,$0C,$00,$0C,$00,$0C,$00,$0C
#_0FAB7E: db $00,$0C,$00,$0C,$00,$0C,$00,$0C
#_0FAB86: db $D9,$0C,$00,$0C,$00,$0C,$DA,$0C
#_0FAB8E: db $DB,$0C,$00,$0C,$DF,$0C,$DC,$0C
#_0FAB96: db $DD,$0C,$E0,$0C,$E1,$0C,$E9,$0C
#_0FAB9E: db $DE,$0C,$E2,$0C,$E9,$0C,$E4,$4C
#_0FABA6: db $E3,$4C,$00,$0C,$00,$0C,$E3,$0C
#_0FABAE: db $E4,$0C,$00,$0C,$00,$0C,$AE,$08
#_0FABB6: db $B0,$48,$AE,$08,$B4,$48,$AF,$08
#_0FABBE: db $AF,$08,$B3,$48,$B3,$08,$B0,$08
#_0FABC6: db $B1,$08,$B4,$08,$B5,$08,$AE,$08
#_0FABCE: db $AF,$08,$AE,$08,$B3,$08,$B0,$08
#_0FABD6: db $B2,$08,$B4,$08,$B6,$08,$AF,$08
#_0FABDE: db $AF,$08,$AF,$08,$AF,$08,$AF,$08
#_0FABE6: db $AF,$08,$AF,$08,$B7,$08,$AF,$08
#_0FABEE: db $AF,$08,$B8,$08,$B8,$48,$AF,$08
#_0FABF6: db $AF,$08,$B7,$48,$AF,$08,$B2,$48
#_0FABFE: db $B0,$48,$B6,$48,$B4,$48,$AF,$08
#_0FAC06: db $AE,$48,$B3,$48,$AE,$48,$B1,$48
#_0FAC0E: db $B0,$48,$B5,$48,$B4,$48,$B0,$08
#_0FAC16: db $AE,$48,$B4,$08,$AE,$48,$AE,$08
#_0FAC1E: db $BA,$48,$AE,$08,$C1,$08,$B9,$08
#_0FAC26: db $B9,$08,$C2,$08,$C3,$08,$BA,$08
#_0FAC2E: db $BB,$08,$C1,$08,$C4,$08,$AE,$08
#_0FAC36: db $B9,$08,$AE,$08,$C1,$08,$BA,$08
#_0FAC3E: db $BC,$08,$C2,$08,$C5,$08,$BD,$08
#_0FAC46: db $BE,$08,$CF,$08,$C7,$08,$AF,$08
#_0FAC4E: db $BF,$08,$AF,$08,$C8,$08,$C0,$08
#_0FAC56: db $C0,$48,$C9,$08,$C9,$08,$BF,$48
#_0FAC5E: db $AF,$08,$C8,$48,$AF,$08,$C7,$48
#_0FAC66: db $BD,$48,$C7,$48,$CF,$48,$BC,$48
#_0FAC6E: db $BA,$48,$C5,$48,$C2,$48,$B9,$08
#_0FAC76: db $AE,$48,$C1,$08,$AE,$48,$BB,$48
#_0FAC7E: db $BA,$48,$C4,$48,$C1,$08,$B9,$08
#_0FAC86: db $B9,$08,$C3,$48,$C2,$48,$BA,$08
#_0FAC8E: db $AE,$48,$C1,$08,$AE,$48,$AE,$08
#_0FAC96: db $CA,$08,$AE,$08,$D0,$08,$CB,$08
#_0FAC9E: db $CC,$08,$CB,$08,$CC,$08,$CA,$08
#_0FACA6: db $CD,$08,$D0,$08,$CD,$08,$AE,$08
#_0FACAE: db $CE,$08,$AE,$08,$D0,$08,$CB,$08
#_0FACB6: db $C5,$08,$CB,$08,$C5,$08,$CF,$08
#_0FACBE: db $C7,$08,$CF,$08,$C7,$08,$AF,$08
#_0FACC6: db $C8,$08,$AF,$08,$C8,$08,$C9,$08
#_0FACCE: db $C9,$08,$C9,$08,$C9,$08,$C8,$48
#_0FACD6: db $AF,$08,$C8,$48,$AF,$08,$C7,$48
#_0FACDE: db $CF,$48,$C7,$48,$CF,$48,$C5,$48
#_0FACE6: db $CB,$08,$C5,$48,$CB,$08,$CE,$48
#_0FACEE: db $AE,$48,$D0,$48,$AE,$48,$CD,$48
#_0FACF6: db $CA,$48,$CD,$48,$D0,$48,$CC,$48
#_0FACFE: db $CB,$48,$CC,$48,$CB,$48,$CA,$48
#_0FAD06: db $AE,$48,$D0,$48,$AE,$48,$CB,$08
#_0FAD0E: db $CC,$08,$D1,$08,$D2,$08,$CF,$08
#_0FAD16: db $C7,$08,$CF,$08,$D3,$08,$AF,$08
#_0FAD1E: db $C8,$08,$D4,$08,$C8,$08,$C8,$48
#_0FAD26: db $AF,$08,$C8,$48,$D4,$48,$C7,$48
#_0FAD2E: db $CF,$48,$D3,$48,$CF,$48,$CC,$48
#_0FAD36: db $CB,$48,$D2,$48,$D1,$48,$D5,$08
#_0FAD3E: db $D6,$08,$CB,$08,$CC,$08,$CF,$08
#_0FAD46: db $D9,$08,$CF,$08,$DB,$08,$DA,$08
#_0FAD4E: db $C8,$08,$DC,$08,$DD,$08,$C9,$08
#_0FAD56: db $C9,$08,$DD,$08,$DD,$08,$C8,$48
#_0FAD5E: db $DA,$48,$DD,$08,$DC,$48,$D9,$48
#_0FAD66: db $CF,$48,$DB,$48,$CF,$48,$D6,$48
#_0FAD6E: db $D5,$48,$CC,$48,$CB,$48,$AE,$08
#_0FAD76: db $CA,$08,$E0,$08,$D0,$08,$CA,$08
#_0FAD7E: db $CD,$08,$D0,$08,$E1,$08,$AE,$08
#_0FAD86: db $CE,$08,$E0,$08,$D0,$08,$CB,$08
#_0FAD8E: db $C5,$08,$CB,$08,$E3,$08,$CF,$08
#_0FAD96: db $DB,$08,$CF,$08,$E4,$08,$DE,$08
#_0FAD9E: db $DF,$08,$E5,$08,$E6,$08,$DF,$48
#_0FADA6: db $DE,$48,$E6,$48,$E5,$48,$DB,$48
#_0FADAE: db $CF,$48,$E4,$48,$CF,$48,$C5,$48
#_0FADB6: db $CB,$08,$E3,$48,$CB,$08,$CE,$48
#_0FADBE: db $AE,$48,$D0,$48,$E0,$48,$CD,$48
#_0FADC6: db $CA,$48,$E1,$48,$D0,$48,$CA,$48
#_0FADCE: db $AE,$48,$D0,$48,$E0,$48,$E7,$08
#_0FADD6: db $E8,$08,$EF,$08,$F0,$08,$E9,$08
#_0FADDE: db $EA,$08,$F1,$08,$F2,$08,$EB,$08
#_0FADE6: db $EC,$08,$EC,$08,$ED,$08,$ED,$08
#_0FADEE: db $EE,$08,$EE,$08,$EE,$08,$EE,$08
#_0FADF6: db $EE,$08,$EE,$08,$EE,$08,$EE,$08
#_0FADFE: db $ED,$48,$EE,$08,$EE,$08,$EC,$08
#_0FAE06: db $EB,$48,$ED,$48,$EC,$08,$EA,$48
#_0FAE0E: db $E9,$48,$F2,$48,$F1,$48,$E8,$48
#_0FAE16: db $E7,$48,$F0,$48,$EF,$48,$00,$01
#_0FAE1E: db $02,$03,$04,$05,$05,$05,$05,$05
#_0FAE26: db $06,$07,$08,$09,$0A,$0B,$0C,$0D
#_0FAE2E: db $0E,$0F,$05,$05,$05,$05,$05,$10
#_0FAE36: db $11,$12,$13,$14,$15,$16,$17,$18
#_0FAE3E: db $19,$1A,$05,$05,$05,$1B,$1C,$1D
#_0FAE46: db $1E,$1F,$20,$21,$22,$23,$24,$25
#_0FAE4E: db $26,$27,$28,$29,$2A,$2B,$2C,$2D
#_0FAE56: db $2E,$2F,$30,$31,$32,$33,$34,$35
#_0FAE5E: db $36,$37,$38,$39,$3A,$3B,$3C,$3D
#_0FAE66: db $3E,$3F,$40,$41,$03,$42,$43,$44
#_0FAE6E: db $45,$46,$47,$48,$07,$49,$4A,$4B
#_0FAE76: db $4C,$4D,$4E,$03,$4F,$50,$51,$52
#_0FAE7E: db $53,$54,$55,$07,$56,$57,$58,$4C
#_0FAE86: db $59,$4E,$5A,$5B,$5C,$5D,$5E,$5F
#_0FAE8E: db $60,$61,$62,$56,$63,$58,$64,$65
#_0FAE96: db $66,$67,$68,$69,$6A,$6B,$6C,$6D
#_0FAE9E: db $6E,$6F,$70,$71,$72,$73,$74,$75
#_0FAEA6: db $76,$77,$78,$79,$7A,$7B,$7C,$7D
#_0FAEAE: db $7E,$7F,$80,$81,$82,$83,$84,$85
#_0FAEB6: db $86,$86,$86,$86,$86,$86,$86,$87
#_0FAEBE: db $88,$89,$8A,$8B,$8C,$8D,$8E,$86
#_0FAEC6: db $86,$86,$86,$86,$86,$86,$8F,$90
#_0FAECE: db $91,$92,$93,$94,$95,$96,$86,$86
#_0FAED6: db $86,$86,$86,$86,$86,$97,$98,$99
#_0FAEDE: db $9A,$9B,$94,$9C,$9D,$86,$86,$86
#_0FAEE6: db $86,$86,$86,$86,$9E,$9F,$99,$A0
#_0FAEEE: db $9B,$A1,$A2,$A3,$A4,$A5,$86,$86
#_0FAEF6: db $86,$A6,$A7,$A8,$A9,$AA,$A0,$AB
#_0FAEFE: db $AC,$AD,$AE,$AF,$B0,$86,$86,$86
#_0FAF06: db $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8
#_0FAF0E: db $B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0
#_0FAF16: db $C1,$C2,$C3,$C4,$C5,$03,$48,$01
#_0FAF1E: db $08,$0A,$48,$08,$08,$01,$08,$02
#_0FAF26: db $08,$08,$08,$09,$08,$03,$08,$04
#_0FAF2E: db $08,$0A,$08,$0B,$08,$01,$08,$05
#_0FAF36: db $08,$01,$08,$05,$08,$06,$08,$07
#_0FAF3E: db $08,$06,$08,$0C,$08,$01,$08,$01
#_0FAF46: db $08,$01,$08,$01,$08,$07,$48,$06
#_0FAF4E: db $48,$0C,$48,$06,$48,$05,$48,$01
#_0FAF56: db $08,$05,$48,$01,$08,$04,$48,$03
#_0FAF5E: db $48,$0B,$48,$0A,$48,$02,$48,$01
#_0FAF66: db $08,$09,$48,$08,$08,$01,$08,$03
#_0FAF6E: db $08,$08,$08,$0A,$08,$0D,$08,$0D
#_0FAF76: db $08,$13,$08,$14,$08,$0D,$08,$0E
#_0FAF7E: db $08,$15,$08,$16,$08,$0F,$08,$10
#_0FAF86: db $08,$17,$08,$18,$08,$11,$08,$05
#_0FAF8E: db $08,$19,$08,$05,$08,$06,$08,$12
#_0FAF96: db $08,$06,$08,$1A,$08,$12,$48,$06
#_0FAF9E: db $48,$1A,$48,$06,$48,$05,$48,$11
#_0FAFA6: db $48,$05,$48,$19,$48,$10,$48,$0F
#_0FAFAE: db $48,$18,$48,$17,$48,$0E,$48,$0D
#_0FAFB6: db $48,$16,$48,$15,$48,$0D,$48,$0D
#_0FAFBE: db $48,$14,$48,$13,$48,$1B,$08,$1C
#_0FAFC6: db $08,$23,$08,$24,$08,$1D,$08,$1E
#_0FAFCE: db $08,$25,$08,$26,$08,$1F,$08,$04
#_0FAFD6: db $08,$27,$08,$04,$08,$20,$08,$21
#_0FAFDE: db $08,$28,$08,$29,$08,$06,$08,$22
#_0FAFE6: db $08,$2A,$08,$2B,$08,$65,$48,$01
#_0FAFEE: db $08,$2C,$08,$01,$08,$01,$08,$65
#_0FAFF6: db $08,$01,$08,$2C,$48,$22,$48,$06
#_0FAFFE: db $48,$2B,$48,$2A,$48,$21,$48,$20
#_0FB006: db $48,$29,$48,$28,$48,$04,$48,$1F
#_0FB00E: db $48,$04,$48,$27,$48,$1E,$48,$1D
#_0FB016: db $48,$26,$48,$25,$48,$1C,$48,$1B
#_0FB01E: db $48,$24,$48,$23,$48,$2D,$08,$2E
#_0FB026: db $08,$37,$08,$2C,$48,$2F,$08,$30
#_0FB02E: db $08,$38,$08,$01,$08,$31,$08,$04
#_0FB036: db $08,$39,$08,$3A,$08,$32,$08,$33
#_0FB03E: db $08,$3B,$08,$3C,$08,$34,$08,$35
#_0FB046: db $08,$3D,$08,$3E,$08,$2C,$08,$01
#_0FB04E: db $08,$3F,$08,$01,$08,$36,$08,$01
#_0FB056: db $08,$40,$08,$01,$08,$01,$08,$01
#_0FB05E: db $08,$41,$08,$41,$48,$01,$08,$01
#_0FB066: db $08,$01,$08,$40,$48,$01,$08,$2C
#_0FB06E: db $48,$01,$08,$3F,$48,$35,$48,$34
#_0FB076: db $48,$3E,$48,$3D,$48,$33,$48,$32
#_0FB07E: db $48,$3C,$48,$3B,$48,$04,$48,$31
#_0FB086: db $48,$3A,$48,$39,$48,$30,$48,$2F
#_0FB08E: db $48,$01,$08,$38,$48,$2E,$48,$2D
#_0FB096: db $48,$2C,$08,$37,$48,$03,$48,$2C
#_0FB09E: db $48,$03,$48,$4B,$08,$42,$08,$01
#_0FB0A6: db $08,$4C,$08,$4D,$08,$03,$08,$04
#_0FB0AE: db $08,$4E,$08,$04,$08,$01,$08,$43
#_0FB0B6: db $08,$01,$08,$4F,$08,$44,$08,$45
#_0FB0BE: db $08,$50,$08,$51,$08,$46,$08,$47
#_0FB0C6: db $08,$52,$08,$53,$08,$48,$08,$49
#_0FB0CE: db $08,$54,$08,$55,$08,$4A,$08,$4A
#_0FB0D6: db $48,$56,$08,$56,$48,$49,$48,$48
#_0FB0DE: db $48,$55,$48,$54,$48,$47,$48,$46
#_0FB0E6: db $48,$53,$48,$52,$48,$45,$48,$44
#_0FB0EE: db $48,$51,$48,$50,$48,$43,$48,$01
#_0FB0F6: db $08,$4F,$48,$01,$08,$04,$48,$03
#_0FB0FE: db $48,$04,$48,$4E,$48,$01,$08,$42
#_0FB106: db $48,$4D,$48,$4C,$48,$2C,$08,$03
#_0FB10E: db $08,$4B,$48,$03,$08,$03,$48,$57
#_0FB116: db $08,$03,$48,$61,$08,$58,$08,$59
#_0FB11E: db $08,$62,$08,$63,$08,$5A,$08,$04
#_0FB126: db $08,$64,$08,$04,$08,$5B,$08,$5C
#_0FB12E: db $08,$06,$08,$65,$08,$5D,$08,$01
#_0FB136: db $08,$5E,$08,$01,$08,$5E,$08,$5F
#_0FB13E: db $08,$66,$08,$5F,$08,$60,$08,$60
#_0FB146: db $48,$67,$08,$67,$48,$5F,$48,$5E
#_0FB14E: db $48,$5F,$48,$66,$48,$01,$08,$5D
#_0FB156: db $48,$01,$08,$5E,$48,$5C,$48,$5B
#_0FB15E: db $48,$65,$48,$06,$48,$04,$48,$5A
#_0FB166: db $48,$04,$48,$64,$48,$59,$48,$58
#_0FB16E: db $48,$63,$48,$62,$48,$57,$48,$03
#_0FB176: db $08,$61,$48,$03,$08,$03,$48,$2C
#_0FB17E: db $48,$03,$48,$2C,$48,$68,$08,$69
#_0FB186: db $08,$6C,$08,$6D,$08,$03,$08,$04
#_0FB18E: db $08,$03,$08,$04,$08,$06,$08,$65
#_0FB196: db $08,$06,$08,$6E,$08,$66,$08,$6A
#_0FB19E: db $08,$66,$08,$66,$08,$66,$08,$5F
#_0FB1A6: db $08,$66,$08,$5F,$08,$6B,$08,$6B
#_0FB1AE: db $48,$6B,$08,$6B,$48,$5F,$48,$66
#_0FB1B6: db $48,$5F,$48,$66,$48,$6A,$48,$66
#_0FB1BE: db $48,$66,$48,$66,$48,$65,$48,$06
#_0FB1C6: db $48,$6E,$48,$06,$48,$04,$48,$03
#_0FB1CE: db $48,$04,$48,$03,$48,$69,$48,$68
#_0FB1D6: db $48,$6D,$48,$6C,$48,$2C,$08,$03
#_0FB1DE: db $08,$2C,$08,$03,$08,$6F,$08,$70
#_0FB1E6: db $08,$73,$08,$74,$08,$01,$08,$05
#_0FB1EE: db $08,$01,$08,$75,$08,$06,$08,$71
#_0FB1F6: db $08,$76,$08,$77,$08,$66,$08,$66
#_0FB1FE: db $08,$77,$08,$77,$08,$66,$08,$5F
#_0FB206: db $08,$77,$08,$78,$08,$72,$08,$72
#_0FB20E: db $48,$79,$08,$79,$48,$5F,$48,$66
#_0FB216: db $48,$78,$48,$77,$48,$66,$48,$66
#_0FB21E: db $48,$77,$48,$77,$48,$71,$48,$06
#_0FB226: db $48,$77,$48,$76,$48,$05,$48,$01
#_0FB22E: db $08,$75,$48,$01,$08,$70,$48,$6F
#_0FB236: db $48,$74,$48,$73,$48,$7D,$48,$7A
#_0FB23E: db $08,$88,$08,$88,$08,$7B,$08,$7C
#_0FB246: db $08,$88,$08,$88,$08,$7D,$08,$7E
#_0FB24E: db $08,$89,$08,$8A,$08,$7F,$08,$80
#_0FB256: db $08,$8B,$08,$8C,$08,$81,$08,$82
#_0FB25E: db $08,$8D,$08,$8E,$08,$83,$08,$84
#_0FB266: db $08,$8F,$08,$90,$08,$85,$08,$86
#_0FB26E: db $08,$91,$08,$92,$08,$87,$08,$87
#_0FB276: db $48,$93,$08,$93,$48,$86,$48,$85
#_0FB27E: db $48,$92,$48,$91,$48,$84,$48,$83
#_0FB286: db $48,$90,$48,$8F,$48,$82,$48,$81
#_0FB28E: db $48,$8E,$48,$8D,$48,$80,$08,$7F
#_0FB296: db $48,$8C,$48,$8B,$48,$7E,$48,$7D
#_0FB29E: db $48,$8A,$48,$89,$48,$7C,$48,$7B
#_0FB2A6: db $48,$88,$08,$88,$08,$7A,$08,$7D
#_0FB2AE: db $08,$88,$08,$88,$08,$89,$08,$8A
#_0FB2B6: db $08,$A0,$08,$A1,$08,$8B,$08,$94
#_0FB2BE: db $08,$96,$08,$97,$08,$95,$08,$96
#_0FB2C6: db $08,$A2,$08,$A3,$08,$97,$08,$98
#_0FB2CE: db $08,$A4,$08,$A5,$08,$99,$08,$9A
#_0FB2D6: db $08,$A6,$08,$9C,$08,$9B,$08,$9C
#_0FB2DE: db $08,$9C,$08,$A7,$08,$9D,$08,$9E
#_0FB2E6: db $08,$A8,$08,$A9,$08,$9F,$08,$9F
#_0FB2EE: db $48,$AA,$08,$AA,$48,$9E,$48,$9D
#_0FB2F6: db $48,$A9,$48,$A8,$48,$9C,$08,$9B
#_0FB2FE: db $48,$A7,$48,$9C,$08,$9A,$48,$99
#_0FB306: db $48,$9C,$08,$A6,$48,$98,$48,$97
#_0FB30E: db $48,$A5,$48,$A4,$48,$96,$48,$95
#_0FB316: db $48,$A3,$48,$A2,$48,$94,$48,$8B
#_0FB31E: db $48,$97,$48,$96,$48,$8A,$48,$89
#_0FB326: db $48,$A1,$48,$A0,$48,$AB,$08,$AC
#_0FB32E: db $08,$B1,$08,$B2,$08,$BB,$08,$AD
#_0FB336: db $08,$B3,$08,$B4,$08,$AE,$08,$AF
#_0FB33E: db $08,$B5,$08,$AF,$08,$C0,$08,$C0
#_0FB346: db $08,$EB,$08,$B6,$08,$C0,$08,$C0
#_0FB34E: db $08,$C0,$08,$C0,$08,$C0,$08,$C0
#_0FB356: db $48,$B6,$48,$EB,$48,$AF,$48,$AE
#_0FB35E: db $48,$AF,$48,$B5,$48,$AD,$48,$BB
#_0FB366: db $48,$B4,$48,$B3,$48,$AC,$48,$AB
#_0FB36E: db $48,$B2,$48,$B1,$48,$B1,$08,$B2
#_0FB376: db $08,$B1,$08,$B2,$08,$B7,$08,$B8
#_0FB37E: db $08,$BB,$08,$BC,$08,$B9,$08,$AF
#_0FB386: db $08,$BD,$08,$BE,$08,$EB,$08,$BA
#_0FB38E: db $08,$BF,$08,$BA,$08,$BA,$48,$EB
#_0FB396: db $48,$BA,$48,$BF,$48,$AF,$48,$B9
#_0FB39E: db $48,$BE,$48,$BD,$48,$B8,$48,$B7
#_0FB3A6: db $48,$BC,$48,$BB,$48,$B2,$48,$B1
#_0FB3AE: db $48,$B2,$48,$B1,$48,$B1,$08,$C0
#_0FB3B6: db $08,$B1,$08,$B2,$08,$BB,$08,$BC
#_0FB3BE: db $08,$BB,$08,$BC,$08,$C1,$08,$C2
#_0FB3C6: db $08,$C1,$08,$AF,$08,$C3,$08,$BA
#_0FB3CE: db $08,$EB,$08,$BA,$08,$BA,$48,$C3
#_0FB3D6: db $48,$BA,$48,$EB,$48,$C2,$48,$C1
#_0FB3DE: db $48,$AF,$48,$C1,$48,$BC,$48,$BB
#_0FB3E6: db $48,$BC,$48,$BB,$48,$C0,$48,$B1
#_0FB3EE: db $48,$B2,$48,$B1,$48,$B1,$08,$C0
#_0FB3F6: db $08,$B1,$08,$C0,$08,$BD,$08,$AF
#_0FB3FE: db $08,$BD,$08,$AF,$08,$EB,$08,$EC
#_0FB406: db $08,$EB,$08,$ED,$08,$EC,$48,$EB
#_0FB40E: db $48,$ED,$48,$EB,$48,$AF,$48,$BD
#_0FB416: db $48,$AF,$48,$BD,$48,$C0,$48,$B1
#_0FB41E: db $48,$C0,$48,$B1,$48,$C5,$08,$BC
#_0FB426: db $08,$C7,$08,$BC,$08,$BD,$08,$AF
#_0FB42E: db $08,$D8,$08,$BE,$08,$EB,$08,$C6
#_0FB436: db $08,$C9,$08,$BA,$08,$C0,$08,$C0
#_0FB43E: db $08,$CA,$08,$C0,$08,$C0,$08,$C0
#_0FB446: db $08,$C0,$08,$CB,$08,$C0,$08,$C0
#_0FB44E: db $08,$CB,$48,$C0,$08,$C0,$08,$C0
#_0FB456: db $08,$C0,$08,$CA,$48,$C6,$48,$EB
#_0FB45E: db $48,$BA,$48,$C9,$48,$AF,$48,$BD
#_0FB466: db $48,$BE,$48,$C8,$48,$BC,$48,$C5
#_0FB46E: db $48,$BC,$48,$C7,$48,$CC,$08,$CD
#_0FB476: db $08,$D7,$08,$D8,$08,$CE,$08,$CF
#_0FB47E: db $08,$D9,$08,$B8,$08,$D0,$08,$D1
#_0FB486: db $08,$B9,$08,$AF,$08,$D2,$08,$D3
#_0FB48E: db $08,$DA,$08,$BA,$08,$D4,$08,$D5
#_0FB496: db $08,$DB,$08,$C0,$08,$D5,$08,$D6
#_0FB49E: db $08,$C0,$08,$DC,$08,$D6,$48,$D5
#_0FB4A6: db $48,$DC,$48,$C0,$08,$D5,$48,$D4
#_0FB4AE: db $48,$C0,$08,$DB,$48,$D3,$48,$D2
#_0FB4B6: db $48,$BA,$48,$DA,$48,$D1,$48,$D0
#_0FB4BE: db $48,$AF,$48,$B9,$48,$CF,$48,$CE
#_0FB4C6: db $48,$B8,$48,$D9,$48,$CD,$48,$CC
#_0FB4CE: db $48,$D8,$48,$D7,$48,$AB,$08,$C0
#_0FB4D6: db $08,$B1,$08,$C0,$08,$DD,$08,$BC
#_0FB4DE: db $08,$DD,$08,$BC,$08,$BD,$08,$AF
#_0FB4E6: db $08,$BD,$08,$E5,$08,$DA,$08,$DE
#_0FB4EE: db $08,$E6,$08,$E7,$08,$DF,$08,$E0
#_0FB4F6: db $08,$E7,$08,$E8,$08,$E1,$08,$E2
#_0FB4FE: db $08,$E9,$08,$E7,$08,$E3,$08,$E4
#_0FB506: db $08,$E7,$08,$EA,$08,$E3,$08,$E3
#_0FB50E: db $08,$E7,$08,$E7,$08,$E4,$48,$E3
#_0FB516: db $08,$EA,$48,$E7,$08,$E2,$48,$E1
#_0FB51E: db $48,$E7,$08,$E9,$48,$E0,$48,$DF
#_0FB526: db $48,$E8,$48,$E7,$08,$DE,$48,$DA
#_0FB52E: db $48,$E7,$08,$E6,$48,$AF,$48,$BD
#_0FB536: db $48,$E5,$48,$BD,$48,$BC,$48,$DD
#_0FB53E: db $48,$BC,$48,$DD,$48,$C0,$48,$AB
#_0FB546: db $48,$C0,$48,$B1,$48,$00,$01,$02
#_0FB54E: db $03,$04,$05,$06,$06,$06,$07,$08
#_0FB556: db $09,$0A,$0B,$0C,$0D,$0E,$0F,$10
#_0FB55E: db $11,$12,$13,$14,$15,$16,$17,$18
#_0FB566: db $19,$1A,$1B,$1C,$1D,$1E,$1F,$20
#_0FB56E: db $21,$22,$23,$24,$25,$26,$27,$28
#_0FB576: db $29,$2A,$2B,$2C,$2D,$2E,$2F,$30
#_0FB57E: db $22,$31,$24,$32,$33,$34,$35,$36
#_0FB586: db $37,$38,$39,$3A,$3B,$3C,$3D,$3E
#_0FB58E: db $3F,$40,$41,$42,$43,$44,$45,$46
#_0FB596: db $47,$48,$49,$4A,$4B,$4C,$4D,$4E
#_0FB59E: db $4F,$50,$51,$52,$53,$54,$55,$56
#_0FB5A6: db $57,$58,$59,$5A,$5A,$5B,$5C,$5D
#_0FB5AE: db $5E,$5E,$5F,$60,$61,$62,$63,$64
#_0FB5B6: db $65,$66,$67,$68,$69,$6A,$6B,$6C
#_0FB5BE: db $6D,$6E,$6F,$70,$71,$72,$73,$74
#_0FB5C6: db $75,$76,$77,$78,$79,$7A,$7B,$7C
#_0FB5CE: db $7D,$7E,$7F,$80,$81,$82,$83,$84
#_0FB5D6: db $85,$86,$87,$87,$87,$88,$89,$8A
#_0FB5DE: db $8B,$8C,$8D,$8E,$8F,$90,$91,$92
#_0FB5E6: db $93,$94,$95,$96,$97,$98,$99,$9A
#_0FB5EE: db $9B,$9C,$9D,$9E,$9F,$A0,$A1,$A2
#_0FB5F6: db $A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA
#_0FB5FE: db $9D,$AB,$AC,$AD,$AE,$AF,$B0,$A3
#_0FB606: db $B1,$A5,$B2,$B3,$B4,$B5,$B6,$AB
#_0FB60E: db $AB,$AC,$B7,$B8,$B9,$BA,$BB,$BC
#_0FB616: db $BD,$BE,$BF,$C0,$C1,$B6,$AB,$AB
#_0FB61E: db $AC,$C2,$C3,$C4,$C5,$C6,$C7,$C8
#_0FB626: db $C9,$C4,$CA,$CB,$B6,$AB,$CC,$CD
#_0FB62E: db $CE,$CF,$D0,$D1,$D2,$D0,$D3,$D4
#_0FB636: db $D0,$D5,$D6,$D7,$D8,$D9,$DA,$DB
#_0FB63E: db $DC,$DD,$DE,$DE,$DE,$DE,$DE,$DF
#_0FB646: db $E0,$E1,$E2,$E3,$0A,$48,$09,$48
#_0FB64E: db $11,$48,$10,$48,$08,$48,$01,$08
#_0FB656: db $0F,$48,$01,$08,$07,$48,$06,$48
#_0FB65E: db $0E,$48,$0D,$48,$05,$08,$04,$48
#_0FB666: db $0C,$48,$0B,$48,$02,$08,$03,$48
#_0FB66E: db $02,$08,$03,$48,$02,$48,$01,$08
#_0FB676: db $02,$48,$01,$08,$01,$08,$01,$08
#_0FB67E: db $01,$08,$01,$08,$01,$08,$02,$08
#_0FB686: db $01,$08,$02,$08,$03,$08,$02,$48
#_0FB68E: db $03,$08,$02,$48,$04,$08,$05,$08
#_0FB696: db $0B,$08,$0C,$08,$06,$08,$07,$08
#_0FB69E: db $0D,$08,$0E,$08,$01,$08,$08,$08
#_0FB6A6: db $01,$08,$0F,$08,$09,$08,$0A,$08
#_0FB6AE: db $10,$08,$11,$08,$1F,$48,$1E,$48
#_0FB6B6: db $2B,$48,$2A,$48,$1D,$48,$1C,$48
#_0FB6BE: db $29,$48,$01,$08,$1B,$48,$1A,$48
#_0FB6C6: db $1B,$48,$28,$48,$19,$48,$18,$48
#_0FB6CE: db $27,$48,$26,$48,$17,$48,$16,$48
#_0FB6D6: db $25,$48,$24,$48,$15,$48,$14,$48
#_0FB6DE: db $23,$48,$22,$48,$13,$48,$12,$48
#_0FB6E6: db $21,$48,$20,$48,$12,$48,$12,$08
#_0FB6EE: db $20,$48,$20,$08,$12,$08,$13,$08
#_0FB6F6: db $20,$08,$21,$08,$14,$08,$15,$08
#_0FB6FE: db $22,$08,$23,$08,$16,$08,$17,$08
#_0FB706: db $24,$08,$25,$08,$18,$08,$19,$08
#_0FB70E: db $26,$08,$27,$08,$1A,$08,$1B,$08
#_0FB716: db $28,$08,$1B,$08,$1C,$08,$1D,$08
#_0FB71E: db $01,$08,$29,$08,$1E,$08,$1F,$08
#_0FB726: db $2A,$08,$2B,$08,$31,$48,$2A,$48
#_0FB72E: db $39,$48,$2A,$48,$30,$48,$2F,$48
#_0FB736: db $38,$48,$37,$48,$1B,$48,$06,$48
#_0FB73E: db $1B,$48,$36,$48,$2E,$48,$0B,$48
#_0FB746: db $35,$48,$34,$48,$2D,$48,$2C,$48
#_0FB74E: db $33,$48,$32,$48,$23,$48,$22,$48
#_0FB756: db $23,$48,$22,$48,$21,$48,$20,$48
#_0FB75E: db $21,$48,$20,$48,$20,$48,$20,$08
#_0FB766: db $20,$48,$20,$08,$20,$08,$21,$08
#_0FB76E: db $20,$08,$21,$08,$22,$08,$23,$08
#_0FB776: db $22,$08,$23,$08,$2C,$08,$2D,$08
#_0FB77E: db $32,$08,$33,$08,$0B,$08,$2E,$08
#_0FB786: db $34,$08,$35,$08,$06,$08,$1B,$08
#_0FB78E: db $36,$08,$1B,$08,$2F,$08,$30,$08
#_0FB796: db $37,$08,$38,$08,$2A,$08,$31,$08
#_0FB79E: db $2A,$08,$39,$08,$45,$48,$44,$48
#_0FB7A6: db $52,$48,$51,$48,$43,$48,$42,$48
#_0FB7AE: db $50,$48,$4F,$48,$41,$48,$40,$48
#_0FB7B6: db $4E,$48,$4D,$48,$3F,$48,$3E,$48
#_0FB7BE: db $4C,$48,$4B,$48,$3D,$48,$3C,$48
#_0FB7C6: db $4A,$48,$49,$48,$3B,$48,$22,$48
#_0FB7CE: db $48,$48,$47,$48,$3A,$48,$3A,$08
#_0FB7D6: db $46,$48,$46,$08,$22,$08,$3B,$08
#_0FB7DE: db $47,$08,$48,$08,$3C,$08,$3D,$08
#_0FB7E6: db $49,$08,$4A,$08,$3E,$08,$3F,$08
#_0FB7EE: db $4B,$08,$4C,$08,$40,$08,$41,$08
#_0FB7F6: db $4D,$08,$4E,$08,$42,$08,$43,$08
#_0FB7FE: db $4F,$08,$50,$08,$44,$08,$45,$08
#_0FB806: db $51,$08,$52,$08,$52,$48,$60,$48
#_0FB80E: db $52,$48,$6A,$48,$5F,$48,$5E,$48
#_0FB816: db $69,$48,$68,$48,$5D,$48,$5C,$48
#_0FB81E: db $67,$48,$66,$48,$5B,$48,$5A,$48
#_0FB826: db $65,$48,$01,$48,$59,$48,$58,$48
#_0FB82E: db $01,$48,$58,$48,$57,$48,$56,$48
#_0FB836: db $64,$48,$64,$48,$55,$48,$54,$48
#_0FB83E: db $63,$48,$62,$48,$53,$48,$53,$08
#_0FB846: db $61,$48,$61,$08,$54,$08,$55,$08
#_0FB84E: db $62,$08,$63,$08,$56,$08,$57,$08
#_0FB856: db $64,$08,$64,$08,$58,$08,$59,$08
#_0FB85E: db $58,$08,$01,$08,$5A,$08,$5B,$08
#_0FB866: db $01,$08,$65,$08,$5C,$08,$5D,$08
#_0FB86E: db $66,$08,$67,$08,$5E,$08,$5F,$08
#_0FB876: db $68,$08,$69,$08,$60,$08,$52,$08
#_0FB87E: db $6A,$08,$52,$08,$52,$48,$73,$48
#_0FB886: db $52,$48,$80,$48,$72,$48,$71,$48
#_0FB88E: db $7F,$48,$7E,$48,$70,$48,$6F,$48
#_0FB896: db $70,$48,$7D,$48,$6E,$48,$01,$48
#_0FB89E: db $7C,$48,$7B,$48,$01,$48,$58,$48
#_0FB8A6: db $7A,$48,$79,$48,$64,$48,$64,$48
#_0FB8AE: db $78,$48,$77,$48,$6D,$48,$6C,$48
#_0FB8B6: db $76,$48,$75,$48,$6B,$48,$6B,$08
#_0FB8BE: db $74,$48,$74,$08,$6C,$08,$6D,$08
#_0FB8C6: db $75,$08,$76,$08,$64,$08,$64,$08
#_0FB8CE: db $77,$08,$78,$08,$58,$08,$01,$08
#_0FB8D6: db $79,$08,$7A,$08,$01,$08,$6E,$08
#_0FB8DE: db $7B,$08,$7C,$08,$6F,$08,$70,$08
#_0FB8E6: db $7D,$08,$70,$08,$71,$08,$72,$08
#_0FB8EE: db $7E,$08,$7F,$08,$73,$08,$52,$08
#_0FB8F6: db $80,$08,$52,$08,$52,$48,$86,$48
#_0FB8FE: db $52,$48,$8D,$48,$85,$48,$84,$48
#_0FB906: db $8C,$48,$8B,$48,$70,$48,$83,$48
#_0FB90E: db $70,$48,$8A,$48,$82,$48,$81,$48
#_0FB916: db $89,$48,$87,$48,$01,$48,$01,$48
#_0FB91E: db $88,$08,$88,$08,$01,$48,$81,$48
#_0FB926: db $88,$08,$87,$48,$01,$48,$01,$08
#_0FB92E: db $01,$48,$01,$08,$81,$08,$01,$08
#_0FB936: db $87,$08,$88,$08,$01,$08,$01,$08
#_0FB93E: db $88,$08,$88,$08,$81,$08,$82,$08
#_0FB946: db $87,$08,$89,$08,$83,$08,$70,$08
#_0FB94E: db $8A,$08,$70,$08,$84,$08,$85,$08
#_0FB956: db $8B,$08,$8C,$08,$86,$08,$52,$08
#_0FB95E: db $8D,$08,$52,$08,$52,$48,$96,$48
#_0FB966: db $52,$48,$9E,$48,$95,$48,$94,$48
#_0FB96E: db $9D,$48,$9C,$48,$70,$48,$93,$48
#_0FB976: db $70,$48,$9B,$48,$92,$48,$91,$48
#_0FB97E: db $9A,$48,$99,$08,$90,$48,$8F,$48
#_0FB986: db $99,$08,$99,$08,$91,$48,$90,$48
#_0FB98E: db $99,$08,$99,$08,$8F,$48,$8E,$48
#_0FB996: db $99,$08,$98,$48,$01,$48,$01,$08
#_0FB99E: db $97,$48,$97,$08,$8E,$08,$8F,$08
#_0FB9A6: db $98,$08,$99,$08,$90,$08,$91,$08
#_0FB9AE: db $99,$08,$99,$08,$8F,$08,$90,$08
#_0FB9B6: db $99,$08,$99,$08,$91,$08,$92,$08
#_0FB9BE: db $99,$08,$9A,$08,$93,$08,$70,$08
#_0FB9C6: db $9B,$08,$70,$08,$94,$08,$95,$08
#_0FB9CE: db $9C,$08,$9D,$08,$96,$08,$52,$08
#_0FB9D6: db $9E,$48,$52,$08,$52,$48,$AC,$48
#_0FB9DE: db $B7,$48,$B6,$48,$AB,$48,$AA,$48
#_0FB9E6: db $B5,$48,$B4,$48,$A9,$48,$A8,$48
#_0FB9EE: db $B3,$48,$B2,$48,$A7,$48,$A6,$48
#_0FB9F6: db $B1,$48,$B0,$48,$A5,$48,$A4,$48
#_0FB9FE: db $AF,$48,$AD,$08,$A3,$48,$A3,$48
#_0FBA06: db $AD,$08,$AE,$48,$A2,$48,$A0,$48
#_0FBA0E: db $AD,$08,$AD,$08,$9F,$48,$9F,$08
#_0FBA16: db $AD,$08,$AD,$08,$A0,$08,$A2,$08
#_0FBA1E: db $AD,$08,$AD,$08,$A3,$08,$A3,$08
#_0FBA26: db $AE,$08,$AD,$08,$A4,$08,$A5,$08
#_0FBA2E: db $AD,$08,$AF,$08,$A6,$08,$A7,$08
#_0FBA36: db $B0,$08,$B1,$08,$A8,$08,$A9,$08
#_0FBA3E: db $B2,$08,$B3,$08,$AA,$08,$AB,$08
#_0FBA46: db $B4,$08,$B5,$08,$AC,$08,$52,$08
#_0FBA4E: db $B6,$08,$B7,$08,$BF,$48,$BE,$48
#_0FBA56: db $C2,$48,$C1,$48,$BD,$48,$BC,$48
#_0FBA5E: db $C0,$48,$AD,$08,$BB,$48,$BA,$48
#_0FBA66: db $AD,$08,$AD,$08,$B9,$48,$B8,$08
#_0FBA6E: db $AD,$08,$AD,$08,$B8,$08,$B8,$08
#_0FBA76: db $AD,$08,$AE,$48,$A1,$48,$B8,$08
#_0FBA7E: db $AD,$08,$AD,$08,$B8,$08,$B8,$08
#_0FBA86: db $AD,$08,$AD,$08,$B8,$08,$A1,$08
#_0FBA8E: db $AD,$08,$AD,$08,$B8,$08,$B8,$08
#_0FBA96: db $AE,$08,$AD,$08,$B8,$08,$B9,$08
#_0FBA9E: db $AD,$08,$AD,$08,$BA,$08,$BB,$08
#_0FBAA6: db $AD,$08,$AD,$08,$BC,$08,$BD,$08
#_0FBAAE: db $AD,$08,$C0,$08,$BE,$08,$BF,$08
#_0FBAB6: db $C1,$08,$C2,$08,$9C,$08,$9D,$08
#_0FBABE: db $AA,$08,$AB,$08,$9E,$08,$9F,$08
#_0FBAC6: db $AC,$08,$AD,$08,$A0,$08,$A1,$08
#_0FBACE: db $AE,$08,$AF,$08,$A2,$08,$A3,$08
#_0FBAD6: db $A2,$08,$A2,$08,$A4,$08,$A5,$08
#_0FBADE: db $A3,$08,$B0,$08,$A2,$08,$A6,$08
#_0FBAE6: db $A2,$08,$A6,$08,$A7,$08,$A8,$08
#_0FBAEE: db $A7,$08,$B1,$08,$A9,$08,$A9,$48
#_0FBAF6: db $B2,$08,$B2,$48,$A8,$48,$A7,$48
#_0FBAFE: db $B1,$48,$A7,$48,$A6,$48,$A2,$08
#_0FBB06: db $A6,$48,$A2,$08,$A5,$48,$A4,$48
#_0FBB0E: db $B0,$48,$A3,$48,$A3,$48,$A2,$08
#_0FBB16: db $A2,$08,$A2,$08,$A1,$48,$A0,$48
#_0FBB1E: db $AF,$48,$AE,$48,$9F,$48,$9E,$48
#_0FBB26: db $AD,$48,$AC,$48,$9D,$48,$9C,$08
#_0FBB2E: db $AB,$48,$AA,$48,$B3,$08,$B3,$08
#_0FBB36: db $9C,$08,$9C,$08,$B3,$08,$B4,$08
#_0FBB3E: db $9C,$08,$A2,$08,$B5,$08,$B6,$08
#_0FBB46: db $A2,$08,$BB,$08,$A2,$08,$A2,$08
#_0FBB4E: db $BC,$08,$BD,$08,$A2,$08,$B7,$08
#_0FBB56: db $BD,$08,$BE,$08,$B8,$08,$A6,$08
#_0FBB5E: db $BF,$08,$A6,$08,$A7,$08,$B9,$08
#_0FBB66: db $A7,$08,$B9,$08,$BA,$08,$BA,$48
#_0FBB6E: db $BA,$08,$BA,$48,$B9,$08,$A7,$48
#_0FBB76: db $B9,$08,$A7,$48,$A6,$48,$B8,$48
#_0FBB7E: db $A6,$48,$BF,$48,$B7,$48,$A2,$08
#_0FBB86: db $BE,$48,$BD,$48,$A2,$08,$A2,$08
#_0FBB8E: db $BD,$48,$BC,$48,$B6,$48,$B5,$48
#_0FBB96: db $BB,$48,$A2,$08,$B4,$48,$B3,$08
#_0FBB9E: db $A2,$08,$9C,$08,$9C,$08,$9C,$08
#_0FBBA6: db $9C,$08,$9C,$08,$9C,$08,$A2,$08
#_0FBBAE: db $9C,$08,$A2,$08,$C0,$08,$C1,$08
#_0FBBB6: db $C6,$08,$C7,$08,$C2,$08,$C3,$08
#_0FBBBE: db $C8,$08,$C9,$08,$C3,$08,$C4,$08
#_0FBBC6: db $C9,$08,$CA,$08,$C5,$08,$A6,$08
#_0FBBCE: db $CB,$08,$A6,$08,$BA,$08,$BA,$48
#_0FBBD6: db $CC,$08,$CC,$48,$A6,$48,$C5,$48
#_0FBBDE: db $A6,$48,$CB,$48,$C4,$48,$C3,$08
#_0FBBE6: db $CA,$48,$C9,$08,$C3,$08,$C2,$48
#_0FBBEE: db $C9,$08,$C8,$48,$C1,$48,$C0,$48
#_0FBBF6: db $C7,$48,$C6,$48,$A2,$08,$9C,$08
#_0FBBFE: db $A2,$08,$9C,$08,$CD,$08,$CE,$08
#_0FBC06: db $A2,$08,$D5,$08,$CF,$08,$D0,$08
#_0FBC0E: db $D6,$08,$D7,$08,$D1,$08,$D2,$08
#_0FBC16: db $D8,$08,$A2,$08,$D3,$08,$A6,$08
#_0FBC1E: db $A2,$08,$A6,$08,$A7,$08,$B9,$08
#_0FBC26: db $A7,$08,$D4,$08,$D4,$08,$D4,$48
#_0FBC2E: db $D9,$08,$D9,$48,$B9,$08,$A7,$48
#_0FBC36: db $D4,$48,$A7,$48,$A6,$48,$D3,$48
#_0FBC3E: db $A6,$48,$A2,$08,$D2,$48,$D1,$48
#_0FBC46: db $A2,$08,$D8,$48,$D0,$48,$CF,$48
#_0FBC4E: db $D7,$48,$D6,$48,$CE,$48,$CD,$48
#_0FBC56: db $D5,$48,$A2,$08,$DA,$08,$DB,$08
#_0FBC5E: db $A2,$08,$E0,$08,$DC,$08,$DD,$08
#_0FBC66: db $E1,$08,$E2,$08,$A2,$08,$A2,$08
#_0FBC6E: db $A2,$08,$A2,$08,$A2,$08,$A6,$08
#_0FBC76: db $A2,$08,$E3,$08,$DE,$08,$D9,$08
#_0FBC7E: db $D9,$08,$DF,$08,$DF,$08,$DF,$48
#_0FBC86: db $A2,$08,$A2,$08,$D9,$48,$DE,$48
#_0FBC8E: db $DF,$48,$D9,$48,$A6,$48,$A2,$08
#_0FBC96: db $E3,$48,$A2,$08,$DD,$48,$DC,$48
#_0FBC9E: db $E2,$48,$E1,$48,$DB,$48,$DA,$48
#_0FBCA6: db $E0,$48,$A2,$08,$E8,$08,$E9,$08
#_0FBCAE: db $EB,$08,$EB,$08,$EA,$08,$A2,$08
#_0FBCB6: db $EB,$08,$EB,$08,$A2,$08,$E4,$08
#_0FBCBE: db $EB,$08,$EC,$08,$E5,$08,$E6,$08
#_0FBCC6: db $ED,$08,$EE,$08,$A2,$08,$A2,$08
#_0FBCCE: db $EB,$08,$EB,$08,$A2,$08,$E7,$08
#_0FBCD6: db $EB,$08,$EB,$08,$DF,$08,$A2,$08
#_0FBCDE: db $EB,$08,$EB,$08,$A2,$08,$DF,$48
#_0FBCE6: db $EB,$08,$EB,$08,$E7,$48,$A2,$08
#_0FBCEE: db $EB,$08,$EB,$08,$E6,$48,$E5,$48
#_0FBCF6: db $EE,$48,$ED,$48,$E4,$48,$A2,$08
#_0FBCFE: db $EC,$48,$EB,$08,$A2,$08,$EA,$48
#_0FBD06: db $EB,$08,$EB,$08,$E9,$48,$E8,$48
#_0FBD0E: db $EB,$08,$EB,$08,$EF,$08,$EF,$08
#_0FBD16: db $F5,$08,$F6,$08,$EF,$08,$EF,$08
#_0FBD1E: db $F7,$08,$F8,$08,$F0,$08,$F1,$08
#_0FBD26: db $F9,$08,$FA,$08,$F2,$08,$F3,$08
#_0FBD2E: db $FB,$08,$FB,$48,$F4,$08,$EF,$08
#_0FBD36: db $FC,$08,$EF,$08,$EF,$08,$EF,$08
#_0FBD3E: db $EF,$08,$EF,$08,$EF,$08,$F4,$48
#_0FBD46: db $EF,$08,$FC,$48,$F3,$48,$F2,$48
#_0FBD4E: db $FB,$08,$FB,$48,$F1,$48,$F0,$48
#_0FBD56: db $FA,$48,$F9,$48,$EF,$08,$EF,$08
#_0FBD5E: db $F8,$48,$F7,$48,$EF,$08,$EF,$08
#_0FBD66: db $F6,$48,$F5,$48,$00,$01,$02,$03
#_0FBD6E: db $04,$04,$04,$04,$04,$04,$05,$02
#_0FBD76: db $06,$00,$07,$08,$02,$03,$04,$04
#_0FBD7E: db $04,$04,$04,$04,$05,$02,$09,$07
#_0FBD86: db $0A,$0B,$02,$0C,$0D,$04,$0E,$0F
#_0FBD8E: db $04,$10,$11,$02,$12,$13,$14,$15
#_0FBD96: db $16,$17,$15,$16,$17,$18,$19,$1A
#_0FBD9E: db $18,$19,$1A,$1B,$1C,$1D,$1E,$1C
#_0FBDA6: db $1D,$1E,$1C,$1F,$1E,$20,$1F,$1E
#_0FBDAE: db $20,$1F,$21,$22,$23,$21,$22,$23
#_0FBDB6: db $21,$22,$23,$21,$22,$23,$21,$22
#_0FBDBE: db $24,$24,$24,$24,$24,$24,$24,$24
#_0FBDC6: db $24,$24,$24,$24,$24,$24,$25,$26
#_0FBDCE: db $27,$28,$29,$2A,$28,$28,$2B,$2C
#_0FBDD6: db $2D,$2E,$2F,$30,$31,$32,$33,$34
#_0FBDDE: db $35,$36,$35,$35,$37,$35,$38,$39
#_0FBDE6: db $3A,$3B,$3C,$3D,$3E,$35,$35,$3F
#_0FBDEE: db $35,$35,$40,$35,$35,$41,$42,$43
#_0FBDF6: db $31,$44,$45,$46,$35,$3F,$35,$35
#_0FBDFE: db $40,$35,$47,$48,$49,$3B,$3C,$4A
#_0FBE06: db $4B,$4C,$35,$3F,$35,$35,$40,$35
#_0FBE0E: db $4D,$4E,$4F,$43,$31,$50,$51,$52
#_0FBE16: db $52,$53,$52,$52,$54,$52,$52,$55
#_0FBE1E: db $56,$3B,$57,$58,$59,$59,$59,$59
#_0FBE26: db $59,$59,$59,$59,$59,$59,$5A,$5B
#_0FBE2E: db $5C,$5D,$5D,$5E,$5D,$5C,$5D,$5D
#_0FBE36: db $5E,$5D,$5C,$5D,$5D,$5E,$5C,$5D
#_0FBE3E: db $5D,$5E,$5D,$5C,$5D,$5D,$5E,$5D
#_0FBE46: db $5C,$5D,$5D,$5E,$5C,$5D,$5D,$5E
#_0FBE4E: db $5D,$5C,$5D,$5D,$5E,$5D,$5C,$5D
#_0FBE56: db $5D,$5E,$5C,$5D,$5D,$5E,$5D,$5C
#_0FBE5E: db $5D,$5D,$5E,$5D,$5C,$5D,$5D,$5E
#_0FBE66: db $5C,$5D,$5D,$5E,$5D,$5C,$5D,$5D
#_0FBE6E: db $5E,$5D,$5C,$5D,$5D,$5E,$5C,$5D
#_0FBE76: db $5D,$5E,$5D,$5C,$5D,$5D,$5E,$5D
#_0FBE7E: db $5C,$5D,$5D,$5E,$5C,$5D,$5D,$5E
#_0FBE86: db $5D,$5C,$5D,$5D,$5E,$5D,$5C,$5D
#_0FBE8E: db $5D,$5E,$5F,$60,$61,$61,$62,$63
#_0FBE96: db $64,$64,$65,$66,$61,$61,$67,$68
#_0FBE9E: db $69,$6A,$6B,$6C,$6D,$6E,$6F,$70
#_0FBEA6: db $71,$72,$73,$74,$75,$76,$77,$78
#_0FBEAE: db $79,$7A,$7B,$7C,$7D,$7E,$7F,$66
#_0FBEB6: db $80,$81,$82,$83,$84,$85,$86,$61
#_0FBEBE: db $7B,$87,$88,$89,$8A,$66,$61,$8B
#_0FBEC6: db $8C,$84,$84,$85,$86,$61,$7B,$8D
#_0FBECE: db $8E,$8F,$90,$66,$61,$8B,$8C,$84
#_0FBED6: db $84,$91,$92,$93,$94,$95,$96,$97
#_0FBEDE: db $98,$99,$9A,$9B,$9C,$84,$9D,$9E
#_0FBEE6: db $9F,$A0,$A1,$A2,$A3,$A4,$A5,$A6
#_0FBEEE: db $A7,$A8,$A9,$AA,$5D,$5D,$5D,$5D
#_0FBEF6: db $5D,$5D,$5D,$5D,$5D,$5D,$5D,$5D
#_0FBEFE: db $5D,$5D,$5D,$5D,$5D,$5D,$AB,$AC
#_0FBF06: db $AC,$AC,$AC,$AD,$5D,$5D,$5D,$5D
#_0FBF0E: db $5D,$5D,$5D,$5D,$AE,$AF,$AF,$AF
#_0FBF16: db $AF,$B0,$5D,$5D,$5D,$5D,$5D,$5D
#_0FBF1E: db $5D,$5D,$AE,$AF,$AF,$AF,$AF,$B0
#_0FBF26: db $5D,$5D,$5D,$5D,$5D,$5D,$5D,$5D
#_0FBF2E: db $AE,$B1,$B1,$B1,$B1,$B0,$5D,$5D
#_0FBF36: db $5D,$5D,$5D,$5D,$5D,$5D,$B2,$B3
#_0FBF3E: db $B3,$B3,$B3,$B4,$5D,$5D,$5D,$5D
#_0FBF46: db $5D,$5D,$5D,$5D,$5D,$5D,$5D,$5D
#_0FBF4E: db $5D,$5D,$5D,$5D,$5D,$5D,$D2,$08
#_0FBF56: db $D2,$08,$D5,$08,$D5,$08,$D2,$08
#_0FBF5E: db $D3,$08,$D5,$08,$D6,$08,$D4,$08
#_0FBF66: db $D4,$08,$D4,$08,$D4,$08,$D4,$08
#_0FBF6E: db $F5,$08,$D4,$08,$D7,$08,$F5,$48
#_0FBF76: db $F5,$08,$D8,$08,$D7,$08,$F5,$48
#_0FBF7E: db $D4,$08,$D8,$08,$D4,$08,$D3,$48
#_0FBF86: db $D2,$08,$D6,$48,$D5,$08,$D5,$08
#_0FBF8E: db $D5,$08,$D5,$08,$D5,$08,$D5,$08
#_0FBF96: db $F4,$08,$D5,$08,$F4,$88,$F4,$48
#_0FBF9E: db $D5,$08,$F4,$C8,$D5,$08,$D5,$08
#_0FBFA6: db $D5,$08,$D2,$88,$D9,$08,$D5,$08
#_0FBFAE: db $D6,$08,$DA,$08,$D3,$88,$D4,$08
#_0FBFB6: db $F5,$08,$D4,$08,$DB,$08,$F5,$48
#_0FBFBE: db $F5,$08,$DC,$08,$D7,$08,$F5,$48
#_0FBFC6: db $F5,$08,$D8,$08,$DB,$08,$F5,$48
#_0FBFCE: db $F5,$08,$DB,$48,$D7,$08,$F5,$48
#_0FBFD6: db $F5,$08,$D8,$08,$DC,$48,$F5,$48
#_0FBFDE: db $D4,$08,$DB,$48,$D4,$08,$D6,$48
#_0FBFE6: db $D5,$08,$D3,$C8,$DA,$48,$D5,$08
#_0FBFEE: db $D5,$08,$D9,$48,$D2,$88,$DD,$08
#_0FBFF6: db $DE,$08,$E1,$08,$E2,$08,$DF,$08
#_0FBFFE: db $E0,$08,$E3,$08,$E1,$08,$DD,$08
#_0FC006: db $DD,$08,$E4,$08,$E5,$08,$E0,$08
#_0FC00E: db $DE,$08,$E1,$08,$E2,$08,$DE,$48
#_0FC016: db $E0,$48,$E2,$48,$E1,$48,$DD,$48
#_0FC01E: db $DD,$48,$E5,$48,$E4,$48,$E0,$48
#_0FC026: db $DF,$48,$E1,$48,$E3,$48,$DE,$48
#_0FC02E: db $DD,$48,$E2,$48,$E1,$48,$E6,$08
#_0FC036: db $E7,$08,$EA,$08,$EB,$08,$E8,$08
#_0FC03E: db $E6,$48,$EB,$48,$EA,$48,$E9,$08
#_0FC046: db $E9,$08,$EC,$08,$EC,$08,$E7,$48
#_0FC04E: db $E6,$48,$EB,$48,$EA,$48,$E6,$08
#_0FC056: db $E8,$48,$EA,$08,$EB,$08,$ED,$08
#_0FC05E: db $EE,$08,$F0,$08,$F1,$08,$EF,$08
#_0FC066: db $ED,$08,$F1,$48,$F0,$48,$ED,$08
#_0FC06E: db $ED,$08,$F2,$08,$F2,$08,$F3,$08
#_0FC076: db $F3,$08,$F3,$08,$F3,$08,$01,$08
#_0FC07E: db $02,$08,$01,$08,$0A,$08,$02,$08
#_0FC086: db $03,$08,$02,$08,$0B,$08,$04,$08
#_0FC08E: db $05,$08,$0C,$08,$0D,$08,$06,$08
#_0FC096: db $06,$08,$0E,$08,$0E,$08,$07,$08
#_0FC09E: db $08,$08,$0E,$08,$0F,$08,$09,$08
#_0FC0A6: db $06,$08,$10,$08,$0E,$08,$06,$08
#_0FC0AE: db $09,$48,$0E,$08,$10,$48,$08,$48
#_0FC0B6: db $07,$48,$0F,$48,$0E,$08,$06,$08
#_0FC0BE: db $06,$48,$0E,$08,$0E,$08,$05,$48
#_0FC0C6: db $04,$48,$0D,$48,$0C,$48,$03,$48
#_0FC0CE: db $02,$08,$0B,$48,$02,$08,$02,$08
#_0FC0D6: db $01,$08,$0A,$48,$01,$08,$01,$08
#_0FC0DE: db $02,$08,$01,$08,$02,$08,$02,$08
#_0FC0E6: db $11,$08,$02,$08,$0B,$08,$12,$08
#_0FC0EE: db $13,$08,$15,$08,$16,$08,$14,$08
#_0FC0F6: db $14,$08,$14,$08,$17,$08,$14,$08
#_0FC0FE: db $14,$08,$14,$08,$14,$08,$29,$08
#_0FC106: db $14,$08,$94,$08,$95,$08,$14,$08
#_0FC10E: db $29,$48,$95,$48,$94,$48,$14,$08
#_0FC116: db $14,$08,$17,$48,$14,$08,$13,$48
#_0FC11E: db $12,$48,$16,$48,$15,$48,$11,$48
#_0FC126: db $02,$08,$03,$48,$02,$08,$02,$08
#_0FC12E: db $01,$08,$02,$08,$01,$08,$01,$08
#_0FC136: db $02,$08,$01,$08,$18,$08,$02,$08
#_0FC13E: db $0B,$08,$02,$08,$19,$08,$12,$08
#_0FC146: db $13,$08,$12,$08,$13,$08,$96,$08
#_0FC14E: db $97,$08,$94,$08,$98,$08,$97,$48
#_0FC156: db $96,$48,$98,$48,$94,$48,$13,$48
#_0FC15E: db $12,$48,$13,$48,$12,$48,$03,$48
#_0FC166: db $02,$08,$19,$48,$02,$08,$02,$08
#_0FC16E: db $01,$08,$18,$48,$01,$08,$02,$08
#_0FC176: db $1A,$08,$02,$08,$0B,$08,$15,$08
#_0FC17E: db $1B,$08,$12,$08,$13,$08,$14,$08
#_0FC186: db $1C,$08,$14,$08,$14,$08,$1C,$48
#_0FC18E: db $14,$08,$14,$08,$14,$08,$1B,$48
#_0FC196: db $15,$48,$13,$48,$12,$48,$1A,$48
#_0FC19E: db $02,$08,$03,$48,$02,$08,$02,$08
#_0FC1A6: db $0B,$08,$02,$08,$1D,$08,$12,$08
#_0FC1AE: db $13,$08,$1E,$08,$1F,$08,$14,$08
#_0FC1B6: db $14,$08,$14,$08,$17,$88,$14,$08
#_0FC1BE: db $14,$08,$17,$C8,$14,$08,$13,$48
#_0FC1C6: db $12,$48,$1F,$48,$1E,$48,$03,$48
#_0FC1CE: db $02,$08,$1D,$48,$02,$08,$02,$08
#_0FC1D6: db $0B,$08,$02,$08,$20,$08,$12,$08
#_0FC1DE: db $13,$08,$21,$08,$22,$08,$14,$08
#_0FC1E6: db $14,$08,$23,$08,$23,$08,$96,$08
#_0FC1EE: db $97,$08,$99,$08,$9A,$08,$97,$48
#_0FC1F6: db $96,$48,$9A,$48,$99,$48,$13,$48
#_0FC1FE: db $12,$48,$22,$48,$21,$48,$03,$48
#_0FC206: db $02,$08,$20,$48,$02,$08,$24,$08
#_0FC20E: db $25,$08,$28,$08,$27,$08,$22,$08
#_0FC216: db $26,$08,$27,$08,$27,$08,$27,$08
#_0FC21E: db $27,$08,$27,$08,$27,$08,$26,$48
#_0FC226: db $22,$48,$27,$08,$27,$08,$25,$48
#_0FC22E: db $24,$48,$27,$48,$28,$48,$00,$0C
#_0FC236: db $9B,$0C,$00,$0C,$9B,$0C,$00,$0C
#_0FC23E: db $00,$0C,$00,$0C,$00,$0C,$9B,$0C
#_0FC246: db $00,$0C,$9B,$0C,$00,$0C,$89,$08
#_0FC24E: db $8A,$08,$93,$08,$94,$08,$8B,$08
#_0FC256: db $8C,$08,$95,$08,$96,$08,$8D,$08
#_0FC25E: db $8D,$08,$8D,$08,$8D,$08,$8E,$08
#_0FC266: db $8F,$08,$8E,$08,$97,$08,$90,$08
#_0FC26E: db $91,$08,$98,$08,$99,$08,$92,$08
#_0FC276: db $92,$08,$92,$08,$92,$08,$91,$48
#_0FC27E: db $90,$48,$99,$48,$98,$48,$8F,$48
#_0FC286: db $8E,$48,$97,$48,$8E,$48,$8C,$48
#_0FC28E: db $8B,$48,$96,$48,$95,$48,$8A,$48
#_0FC296: db $89,$48,$94,$48,$93,$48,$9A,$08
#_0FC29E: db $9B,$08,$A4,$08,$A5,$08,$9C,$08
#_0FC2A6: db $9D,$08,$A6,$08,$A7,$08,$9E,$08
#_0FC2AE: db $9F,$08,$A8,$08,$A9,$08,$A0,$08
#_0FC2B6: db $A1,$08,$AA,$08,$AB,$08,$A2,$08
#_0FC2BE: db $8F,$08,$AC,$08,$97,$08,$A3,$08
#_0FC2C6: db $99,$08,$AD,$08,$99,$08,$92,$08
#_0FC2CE: db $92,$08,$92,$08,$AE,$08,$92,$08
#_0FC2D6: db $92,$08,$AE,$48,$92,$08,$99,$48
#_0FC2DE: db $A3,$48,$99,$48,$AD,$48,$8F,$48
#_0FC2E6: db $A2,$48,$97,$48,$AC,$48,$A1,$48
#_0FC2EE: db $A0,$48,$AB,$48,$AA,$48,$9F,$48
#_0FC2F6: db $9E,$48,$A9,$48,$A8,$48,$9D,$48
#_0FC2FE: db $9C,$48,$A7,$48,$A6,$48,$9B,$48
#_0FC306: db $9A,$48,$A5,$48,$A4,$48,$AF,$08
#_0FC30E: db $B0,$08,$9B,$08,$9B,$08,$B1,$08
#_0FC316: db $A7,$08,$9B,$08,$A7,$08,$B2,$08
#_0FC31E: db $B3,$08,$B2,$08,$8D,$08,$B4,$08
#_0FC326: db $B5,$08,$8D,$08,$8D,$08,$B6,$08
#_0FC32E: db $8F,$08,$B6,$08,$97,$08,$B7,$08
#_0FC336: db $99,$08,$F2,$08,$99,$08,$B8,$08
#_0FC33E: db $B9,$08,$F0,$08,$F1,$08,$B9,$48
#_0FC346: db $B8,$48,$F1,$48,$F0,$48,$99,$48
#_0FC34E: db $B7,$48,$99,$48,$F2,$48,$B5,$48
#_0FC356: db $B4,$48,$8D,$08,$8D,$08,$B3,$48
#_0FC35E: db $B2,$48,$8D,$08,$B2,$48,$A7,$48
#_0FC366: db $B1,$48,$A7,$48,$9B,$08,$B0,$48
#_0FC36E: db $AF,$48,$9B,$08,$9B,$08,$9B,$08
#_0FC376: db $9B,$08,$9B,$08,$9B,$08,$9B,$08
#_0FC37E: db $A7,$08,$9B,$08,$A7,$08,$B2,$08
#_0FC386: db $8D,$08,$B2,$08,$8D,$08,$F2,$08
#_0FC38E: db $99,$08,$BB,$08,$BC,$08,$F0,$08
#_0FC396: db $F1,$08,$BD,$08,$BE,$08,$F1,$48
#_0FC39E: db $F0,$48,$EA,$08,$EB,$08,$99,$48
#_0FC3A6: db $F2,$48,$EC,$08,$BB,$48,$8D,$08
#_0FC3AE: db $B2,$48,$8D,$08,$B2,$48,$A7,$48
#_0FC3B6: db $9B,$08,$A7,$48,$9B,$08,$BF,$08
#_0FC3BE: db $C0,$08,$C3,$08,$C4,$08,$C1,$08
#_0FC3C6: db $C2,$08,$F3,$08,$F1,$08,$ED,$08
#_0FC3CE: db $EE,$08,$F1,$48,$F3,$48,$EF,$08
#_0FC3D6: db $BF,$48,$C4,$48,$C3,$48,$9B,$08
#_0FC3DE: db $A7,$08,$CE,$08,$CF,$08,$C5,$08
#_0FC3E6: db $C6,$08,$D0,$08,$D1,$08,$C7,$08
#_0FC3EE: db $C8,$08,$D2,$08,$D3,$08,$C9,$08
#_0FC3F6: db $8F,$08,$D4,$08,$D5,$08,$CA,$08
#_0FC3FE: db $CB,$08,$D6,$08,$D7,$08,$CC,$08
#_0FC406: db $CD,$08,$D8,$08,$D9,$08,$CD,$48
#_0FC40E: db $CC,$48,$D9,$48,$D8,$48,$CB,$48
#_0FC416: db $CA,$48,$D7,$48,$D6,$48,$8F,$48
#_0FC41E: db $C9,$48,$D5,$48,$D4,$48,$C8,$48
#_0FC426: db $C7,$48,$D3,$48,$D2,$48,$C6,$48
#_0FC42E: db $C5,$48,$D1,$48,$D0,$48,$A7,$48
#_0FC436: db $9B,$08,$CF,$48,$CE,$48,$DA,$08
#_0FC43E: db $DB,$08,$E3,$08,$E4,$08,$DC,$08
#_0FC446: db $DD,$08,$E5,$08,$E5,$08,$DE,$08
#_0FC44E: db $DF,$08,$E5,$08,$E5,$08,$DF,$08
#_0FC456: db $DF,$08,$E6,$08,$E7,$08,$E0,$08
#_0FC45E: db $E1,$08,$E5,$08,$E5,$08,$DF,$08
#_0FC466: db $DF,$08,$E5,$08,$E8,$08,$E2,$08
#_0FC46E: db $DF,$08,$E9,$08,$E5,$08,$DF,$08
#_0FC476: db $E2,$48,$E5,$08,$E9,$48,$DF,$08
#_0FC47E: db $DF,$08,$E8,$48,$E5,$08,$E1,$48
#_0FC486: db $E0,$48,$E5,$08,$E5,$08,$DF,$08
#_0FC48E: db $DF,$08,$E7,$48,$E6,$48,$DF,$08
#_0FC496: db $DE,$48,$E5,$08,$E5,$08,$DD,$48
#_0FC49E: db $DC,$48,$E5,$08,$E5,$08,$DB,$48
#_0FC4A6: db $DA,$48,$E4,$48,$E3,$48,$00,$0C
#_0FC4AE: db $00,$0C,$00,$0C,$A8,$0C,$A7,$0C
#_0FC4B6: db $A7,$0C,$A9,$0C,$A9,$4C,$00,$0C
#_0FC4BE: db $00,$0C,$A8,$4C,$00,$0C,$00,$0C
#_0FC4C6: db $A8,$0C,$00,$0C,$A8,$0C,$AA,$0C
#_0FC4CE: db $AA,$4C,$A9,$0C,$A9,$4C,$A8,$4C
#_0FC4D6: db $00,$0C,$A8,$4C,$00,$0C,$AA,$0C
#_0FC4DE: db $AA,$4C,$AB,$0C,$AB,$0C,$00,$0C
#_0FC4E6: db $A8,$0C,$00,$0C,$AD,$0C,$AC,$0C
#_0FC4EE: db $AC,$0C,$AB,$8C,$AB,$8C,$A8,$4C
#_0FC4F6: db $00,$0C,$AD,$4C,$00,$0C,$00,$01
#_0FC4FE: db $01,$02,$03,$04,$05,$06,$07,$08
#_0FC506: db $09,$0A,$0B,$0B,$0C,$0D,$01,$0E
#_0FC50E: db $0F,$10,$11,$12,$13,$14,$15,$16
#_0FC516: db $17,$18,$0B,$19,$1A,$1B,$1C,$1D
#_0FC51E: db $1E,$1F,$20,$21,$22,$23,$24,$1D
#_0FC526: db $25,$26,$27,$28,$29,$1D,$1D,$2A
#_0FC52E: db $2B,$2C,$2D,$2E,$2F,$30,$1D,$1D
#_0FC536: db $31,$32,$33,$34,$1D,$1D,$35,$36
#_0FC53E: db $37,$38,$39,$3A,$3B,$1D,$1D,$3C
#_0FC546: db $3D,$3E,$3F,$40,$41,$42,$43,$44
#_0FC54E: db $43,$45,$43,$46,$41,$47,$48,$49
#_0FC556: db $4A,$4B,$4C,$4D,$4D,$4D,$4D,$4D
#_0FC55E: db $4D,$4D,$4D,$4D,$4E,$4F,$50,$51
#_0FC566: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC56E: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC576: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC57E: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC586: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC58E: db $51,$51,$51,$51,$51,$51,$51,$52
#_0FC596: db $53,$51,$51,$51,$51,$51,$51,$51
#_0FC59E: db $51,$51,$51,$51,$54,$55,$56,$57
#_0FC5A6: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5AE: db $51,$51,$58,$59,$5A,$5B,$51,$51
#_0FC5B6: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5BE: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5C6: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5CE: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5D6: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5DE: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5E6: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5EE: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC5F6: db $54,$55,$56,$57,$51,$51,$51,$51
#_0FC5FE: db $51,$51,$51,$51,$51,$51,$58,$59
#_0FC606: db $5A,$5B,$51,$51,$51,$51,$51,$51
#_0FC60E: db $51,$51,$51,$51,$5C,$5D,$5E,$5F
#_0FC616: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC61E: db $51,$51,$51,$51,$51,$51,$51,$51
#_0FC626: db $51,$51,$51,$46,$08,$47,$08,$49
#_0FC62E: db $08,$47,$08,$47,$48,$47,$48,$47
#_0FC636: db $48,$47,$48,$48,$48,$53,$88,$4A
#_0FC63E: db $48,$4A,$08,$54,$88,$55,$88,$48
#_0FC646: db $08,$4C,$08,$56,$88,$57,$88,$4D
#_0FC64E: db $88,$4E,$88,$58,$88,$59,$88,$4F
#_0FC656: db $88,$50,$88,$5A,$88,$5A,$C8,$51
#_0FC65E: db $88,$51,$C8,$59,$C8,$58,$C8,$55
#_0FC666: db $C8,$4F,$C8,$60,$C8,$56,$C8,$4E
#_0FC66E: db $C8,$4D,$C8,$55,$C8,$54,$C8,$4C
#_0FC676: db $48,$48,$48,$53,$C8,$48,$08,$4A
#_0FC67E: db $48,$4A,$08,$47,$08,$47,$08,$47
#_0FC686: db $08,$47,$08,$47,$48,$46,$48,$47
#_0FC68E: db $48,$49,$48,$4B,$08,$47,$08,$52
#_0FC696: db $08,$47,$08,$47,$48,$48,$48,$47
#_0FC69E: db $48,$4A,$48,$0B,$08,$4A,$08,$0B
#_0FC6A6: db $08,$53,$08,$48,$08,$4C,$08,$54
#_0FC6AE: db $08,$55,$08,$4D,$08,$4E,$08,$56
#_0FC6B6: db $08,$57,$08,$4F,$08,$50,$08,$58
#_0FC6BE: db $08,$59,$08,$51,$08,$51,$48,$5A
#_0FC6C6: db $08,$5A,$48,$50,$48,$4F,$48,$59
#_0FC6CE: db $48,$58,$48,$4E,$48,$4D,$48,$57
#_0FC6D6: db $48,$56,$48,$4C,$48,$48,$48,$55
#_0FC6DE: db $48,$54,$48,$4A,$48,$0B,$08,$53
#_0FC6E6: db $48,$0B,$08,$48,$08,$47,$08,$4A
#_0FC6EE: db $08,$47,$08,$47,$48,$4B,$48,$47
#_0FC6F6: db $48,$52,$48,$5B,$08,$5C,$08,$64
#_0FC6FE: db $08,$65,$08,$48,$48,$47,$48,$4A
#_0FC706: db $48,$47,$48,$48,$48,$0B,$08,$4A
#_0FC70E: db $48,$0B,$08,$0B,$08,$0B,$08,$0B
#_0FC716: db $08,$0B,$08,$5D,$08,$5E,$08,$66
#_0FC71E: db $08,$67,$08,$5F,$08,$60,$08,$68
#_0FC726: db $08,$69,$08,$61,$08,$62,$08,$6A
#_0FC72E: db $08,$6B,$08,$63,$08,$63,$48,$6C
#_0FC736: db $08,$6C,$48,$62,$48,$61,$48,$6B
#_0FC73E: db $48,$6A,$48,$60,$48,$5F,$48,$69
#_0FC746: db $48,$68,$48,$5E,$48,$5D,$48,$67
#_0FC74E: db $48,$66,$48,$0B,$08,$48,$08,$0B
#_0FC756: db $08,$4A,$08,$47,$08,$48,$08,$47
#_0FC75E: db $08,$4A,$08,$5C,$48,$5B,$48,$65
#_0FC766: db $48,$64,$48,$6D,$08,$6E,$08,$75
#_0FC76E: db $08,$76,$08,$6F,$08,$48,$48,$77
#_0FC776: db $08,$4A,$48,$0B,$08,$5D,$08,$0B
#_0FC77E: db $08,$78,$08,$70,$08,$71,$08,$79
#_0FC786: db $08,$7A,$08,$72,$08,$73,$08,$7B
#_0FC78E: db $08,$7C,$08,$74,$08,$74,$48,$7D
#_0FC796: db $08,$7D,$08,$73,$48,$72,$48,$7C
#_0FC79E: db $48,$7B,$48,$71,$48,$70,$48,$7A
#_0FC7A6: db $48,$79,$48,$5D,$48,$0B,$08,$78
#_0FC7AE: db $48,$0B,$08,$48,$08,$6F,$48,$4A
#_0FC7B6: db $08,$77,$48,$6E,$48,$6D,$48,$76
#_0FC7BE: db $48,$75,$48,$7E,$08,$7F,$08,$86
#_0FC7C6: db $08,$87,$08,$80,$08,$0B,$08,$88
#_0FC7CE: db $08,$89,$08,$81,$08,$0B,$08,$0B
#_0FC7D6: db $08,$0B,$08,$0B,$08,$82,$08,$0B
#_0FC7DE: db $08,$0B,$08,$83,$08,$84,$08,$8A
#_0FC7E6: db $08,$8B,$08,$85,$08,$85,$08,$8C
#_0FC7EE: db $08,$8C,$48,$84,$48,$83,$48,$8B
#_0FC7F6: db $48,$8A,$48,$82,$48,$0B,$08,$0B
#_0FC7FE: db $08,$0B,$08,$0B,$08,$81,$48,$0B
#_0FC806: db $08,$0B,$08,$0B,$08,$80,$48,$89
#_0FC80E: db $48,$88,$48,$7F,$48,$7E,$48,$87
#_0FC816: db $48,$86,$48,$8D,$08,$8E,$08,$92
#_0FC81E: db $08,$93,$08,$8F,$08,$90,$08,$94
#_0FC826: db $08,$95,$08,$0B,$08,$0B,$08,$96
#_0FC82E: db $08,$97,$08,$0B,$08,$0B,$08,$97
#_0FC836: db $08,$97,$08,$0B,$08,$0B,$08,$98
#_0FC83E: db $08,$99,$08,$0B,$08,$0B,$08,$99
#_0FC846: db $08,$99,$08,$91,$08,$0B,$08,$99
#_0FC84E: db $08,$99,$08,$0B,$08,$91,$48,$99
#_0FC856: db $08,$99,$08,$0B,$08,$0B,$08,$99
#_0FC85E: db $08,$98,$48,$0B,$08,$0B,$08,$97
#_0FC866: db $08,$96,$48,$90,$48,$8F,$48,$95
#_0FC86E: db $48,$94,$48,$8E,$48,$8D,$48,$93
#_0FC876: db $48,$92,$48,$9A,$08,$9B,$08,$A0
#_0FC87E: db $08,$A1,$08,$9C,$08,$9D,$08,$A2
#_0FC886: db $08,$A3,$08,$9E,$08,$9F,$08,$A4
#_0FC88E: db $08,$A5,$08,$9F,$08,$9F,$08,$A6
#_0FC896: db $08,$A6,$08,$9F,$08,$9E,$48,$A5
#_0FC89E: db $48,$A4,$48,$9D,$48,$9C,$48,$A3
#_0FC8A6: db $48,$A2,$48,$9B,$48,$9A,$48,$A1
#_0FC8AE: db $48,$A0,$48,$00,$0C,$00,$0C,$00
#_0FC8B6: db $0C,$00,$0C,$6C,$0C,$6D,$0C,$7C
#_0FC8BE: db $0C,$7D,$0C,$6E,$0C,$6F,$0C,$7E
#_0FC8C6: db $0C,$7F,$0C,$80,$0C,$81,$0C,$90
#_0FC8CE: db $0C,$91,$0C,$82,$0C,$83,$0C,$92
#_0FC8D6: db $0C,$93,$0C,$84,$0C,$85,$0C,$94
#_0FC8DE: db $0C,$95,$0C,$86,$0C,$87,$0C,$96
#_0FC8E6: db $0C,$97,$0C,$88,$0C,$89,$0C,$98
#_0FC8EE: db $0C,$99,$0C,$8A,$0C,$8B,$0C,$9A
#_0FC8F6: db $0C,$9B,$0C,$8C,$0C,$8D,$0C,$9C
#_0FC8FE: db $0C,$9D,$0C,$8E,$0C,$8F,$0C,$9E
#_0FC906: db $0C,$9F,$0C,$A0,$0C,$A1,$0C,$B0
#_0FC90E: db $0C,$B1,$0C,$A2,$0C,$A3,$0C,$B2
#_0FC916: db $0C,$B3,$0C,$A4,$0C,$A5,$0C,$B4
#_0FC91E: db $0C,$B5,$0C,$A6,$0C,$A7,$0C,$B6
#_0FC926: db $0C,$B7,$0C

routine0FC929:
#_0FC929: PHP
#_0FC92A: CLC

#_0FC92B: REP #$30
#_0FC92D: PHA

#_0FC92E: SEP #$20
#_0FC930: LDA.b #$FF
#_0FC932: STA.w $0F7F

#_0FC935: REP #$20
#_0FC937: JSL PPUSettings_00C409
#_0FC93B: PLA
#_0FC93C: TSX
#_0FC93D: STX.w $0D17
#_0FC940: CMP.w #$0000
#_0FC943: BNE .branch0FC9A6

.branch0FC945
#_0FC945: REP #$30
#_0FC947: LDA.w #$0000
#_0FC94A: STA.w $0D19
#_0FC94D: LDA.w #$0000
#_0FC950: STA.w $0F4F

#_0FC953: SEP #$20
#_0FC955: LDA.b #$5D ; SONG 5D
#_0FC957: JSL Write_to_APU_transferrable
#_0FC95B: JSR routine0FCA3C
#_0FC95E: JSR routine0FCA1B
#_0FC961: JSR routine0FCA0A
#_0FC964: JSR routine0FCA0A
#_0FC967: JSR routine0FD1A7
#_0FC96A: LDA.b #$FF ; SONG FF COMMAND
#_0FC96C: JSL Write_to_APU_transferrable
#_0FC970: JSR routine0FCA0A
#_0FC973: JSR routine0FCA0A
#_0FC976: JSR routine0FCA0A
#_0FC979: JSR routine0FD081
#_0FC97C: JSR routine0FCC11
#_0FC97F: JSR routine0FD4FF
#_0FC982: LDA.b #$5E ; SONG 5E
#_0FC984: JSL Write_to_APU_transferrable
#_0FC988: JSR routine0FD843
#_0FC98B: JSR routine0FD4DA
#_0FC98E: JSR routine0FD807
#_0FC991: JSR routine0FD081

#_0FC994: REP #$20
#_0FC996: LDX.w #$0018
#_0FC999: STX.w $0CF3
#_0FC99C: JSR routine0FE773

#_0FC99F: REP #$30
#_0FC9A1: LDY.w #$0708
#_0FC9A4: BRA .branch0FC9DB

.branch0FC9A6
#_0FC9A6: LDA.w #$0081
#_0FC9A9: STA.w NMITIMEN
#_0FC9AC: STA.w $0F00

#branch0FC9AF:
#_0FC9AF: REP #$30
#_0FC9B1: LDX.w $0D17
#_0FC9B4: TXS
#_0FC9B5: JSR routine0FCC11
#_0FC9B8: JSR routine0FD081
#_0FC9BB: LDA.w #$005E ; SONG 5E
#_0FC9BE: JSL Write_to_APU_transferrable
#_0FC9C2: JSR routine0FD4DA
#_0FC9C5: JSR routine0FD807
#_0FC9C8: JSR routine0FD081

#_0FC9CB: REP #$20
#_0FC9CD: LDX.w #$0018
#_0FC9D0: STX.w $0CF3
#_0FC9D3: JSR routine0FE773

#_0FC9D6: REP #$30
#_0FC9D8: LDY.w #$0708

.branch0FC9DB
#_0FC9DB: PHY
#_0FC9DC: JSL AddSelfAsVectorAndMakeSpace

#_0FC9E0: REP #$20
#_0FC9E2: PLY
#_0FC9E3: LDA.w $0F2B
#_0FC9E6: AND.w #$D0C0
#_0FC9E9: BNE .branch0FC9FA

#_0FC9EB: JSR routine0FE77C
#_0FC9EE: DEY
#_0FC9EF: BNE .branch0FC9DB

#_0FC9F1: JSR routine0FD1A7
#_0FC9F4: JSR routine0FCC11
#_0FC9F7: JMP .branch0FC945

.branch0FC9FA
#_0FC9FA: SEP #$20
#_0FC9FC: LDA.b #$02 ; SFX 02
#_0FC9FE: JSL Write_to_APU_transferrable
#_0FCA02: JSR routine0FD1A7
#_0FCA05: JSR routine0FCC11
#_0FCA08: PLP
#_0FCA09: RTL

;===================================================================================================

routine0FCA0A:
#_0FCA0A: PHP
#_0FCA0B: REP #$10
#_0FCA0D: LDY.w #$0020

.branch0FCA10
#_0FCA10: PHY
#_0FCA11: JSL AddSelfAsVectorAndMakeSpace
#_0FCA15: PLY
#_0FCA16: DEY
#_0FCA17: BNE .branch0FCA10

#_0FCA19: PLP
#_0FCA1A: RTS

;===================================================================================================

routine0FCA1B:
#_0FCA1B: PHP
#_0FCA1C: REP #$30
#_0FCA1E: LDY.w #$0100

.branch0FCA21
#_0FCA21: PHY
#_0FCA22: JSL AddSelfAsVectorAndMakeSpace
#_0FCA26: PLY
#_0FCA27: LDA.w $0D19
#_0FCA2A: BNE .branch0FCA34

#_0FCA2C: LDA.w $0F2B
#_0FCA2F: AND.w #$1000
#_0FCA32: BNE .branch0FCA39

.branch0FCA34
#_0FCA34: DEY
#_0FCA35: BNE .branch0FCA21

#_0FCA37: PLP
#_0FCA38: RTS

.branch0FCA39
#_0FCA39: JMP branch0FC9AF

routine0FCA3C:
#_0FCA3C: PHP
#_0FCA3D: REP #$30
#_0FCA3F: JSR PPUSettings_0FCAB6
#_0FCA42: JSR DisableNMI_B0F
#_0FCA45: JSR routine0FCB50
#_0FCA48: JSR routine0FCC57
#_0FCA4B: JSR routine0FCDE8
#_0FCA4E: JSR EnableNMI_B0F

#_0FCA51: REP #$20
#_0FCA53: LDA.w #$0130
#_0FCA56: STA.w $0CFF
#_0FCA59: JSR routine0FD006
#_0FCA5C: JSR routine0FD1FF
#_0FCA5F: JSR routine0FD054

.branch0FCA62
#_0FCA62: JSR INC_CFF_Max168
#_0FCA65: PHA
#_0FCA66: JSR routine0FCE4E
#_0FCA69: JSL AddSelfAsVectorAndMakeSpace
#_0FCA6D: JSR routine0FCE05
#_0FCA70: PLA
#_0FCA71: CMP.w #$0000
#_0FCA74: BEQ .branch0FCA62

#_0FCA76: JSR routine0FCA0A
#_0FCA79: JSR routine0FD2AA
#_0FCA7C: PLP
#_0FCA7D: RTS

EnableNMI_B0F:
#_0FCA7E: PHP
#_0FCA7F: SEP #$20
#_0FCA81: LDA.b #$00
#_0FCA83: STA.w INIDISP
#_0FCA86: STA.w $0F43
#_0FCA89: LDA.b #$81
#_0FCA8B: STA.w NMITIMEN
#_0FCA8E: STA.w $0F00
#_0FCA91: PLP
#_0FCA92: RTS

DisableNMI_B0F:
#_0FCA93: PHP
#_0FCA94: SEP #$20

#_0FCA96: LDA.b #$80
#_0FCA98: STA.w INIDISP
#_0FCA9B: STA.w $0F43

#_0FCA9E: LDA.b #$00
#_0FCAA0: STA.w NMITIMEN
#_0FCAA3: STA.w $0F00

#_0FCAA6: PLP
#_0FCAA7: RTS

ASL_A_Y_Times_0F:
#_0FCAA8: REP #$30
#_0FCAAA: ASL A
#_0FCAAB: DEY
#_0FCAAC: BNE ASL_A_Y_Times_0F
#_0FCAAE: RTS

LSR_A_Y_Times_0F:
#_0FCAAF: REP #$30
#_0FCAB1: LSR A
#_0FCAB2: DEY
#_0FCAB3: BNE LSR_A_Y_Times_0F

#_0FCAB5: RTS

PPUSettings_0FCAB6:
#_0FCAB6: REP #$10
#_0FCAB8: SEP #$20
#_0FCABA: LDA.b #$62
#_0FCABC: STA.w OBSEL

#_0FCABF: LDA.b #$00
#_0FCAC1: STA.w OAMADDL
#_0FCAC4: STA.w OAMADDH

#_0FCAC7: LDA.b #$07
#_0FCAC9: STA.w BGMODE
#_0FCACC: STA.w $0F45

#_0FCACF: LDA.b #$00
#_0FCAD1: STA.w MOSAIC

#_0FCAD4: LDA.b #$80
#_0FCAD6: STA.w VMAIN

#_0FCAD9: LDA.b #$C0
#_0FCADB: STA.w M7SEL

#_0FCADE: LDA.b #$00
#_0FCAE0: STA.w CGADD
#_0FCAE3: STA.w W34SEL
#_0FCAE6: STA.w WOBJSEL
#_0FCAE9: STA.w WINDOW1L
#_0FCAEC: STA.w WINDOW1R
#_0FCAEF: STA.w WINDOW2L
#_0FCAF2: STA.w WINDOW2R
#_0FCAF5: STA.w WBGLOG
#_0FCAF8: STA.w WOBJLOG

#_0FCAFB: LDA.b #$13
#_0FCAFD: STA.w TM
#_0FCB00: STA.w TS

#_0FCB03: LDA.b #$00
#_0FCB05: STA.w TMW
#_0FCB08: STA.w TSW

#_0FCB0B: LDA.b #$30
#_0FCB0D: STA.w CGWSEL

#_0FCB10: LDA.b #$00
#_0FCB12: STA.w CGADSUB

#_0FCB15: LDA.b #$E0
#_0FCB17: STA.w COLDATA

#_0FCB1A: LDA.b #$00
#_0FCB1C: STA.w SETINI
#_0FCB1F: STA.w NMITIMEN

#_0FCB22: LDA.b #$FF
#_0FCB24: STA.w JOYPADIO

#_0FCB27: LDA.b #$00
#_0FCB29: STA.w WRMPYA
#_0FCB2C: STA.w WRMPYB
#_0FCB2F: STA.w WRDIVL
#_0FCB32: STA.w WRDIVH
#_0FCB35: STA.w WRDIVB
#_0FCB38: STA.w HTIMEL
#_0FCB3B: STA.w HTIMEH
#_0FCB3E: STA.w VTIMEL
#_0FCB41: STA.w VTIMEH
#_0FCB44: STA.w MDMAEN
#_0FCB47: STA.w HDMAEN

#_0FCB4A: LDA.b #$40
#_0FCB4C: STA.w BG12NBA
#_0FCB4F: RTS

;===================================================================================================

routine0FCB50:
#_0FCB50: PHP
#_0FCB51: SEP #$20
#_0FCB53: REP #$10

#_0FCB55: JSR routine0FCC37

#_0FCB58: LDA.b #$80
#_0FCB5A: STA.w VMAIN

#_0FCB5D: LDA.b #$00
#_0FCB5F: STA.w VMADDL
#_0FCB62: STA.w VMADDH

#_0FCB65: LDY.w #$1F00
#_0FCB68: LDX.w #$0000

; TODO mode 7?
.branch0FCB6B
#_0FCB6B: LDA.l GFX_2FC000,X
#_0FCB6F: LSR A
#_0FCB70: LSR A
#_0FCB71: LSR A
#_0FCB72: LSR A
#_0FCB73: AND.b #$0F
#_0FCB75: STA.w VMDATAH
#_0FCB78: LDA.l GFX_2FC000,X
#_0FCB7C: AND.b #$0F
#_0FCB7E: STA.w VMDATAH
#_0FCB81: INX
#_0FCB82: DEY
#_0FCB83: BNE .branch0FCB6B

#_0FCB85: LDA.b #$00
#_0FCB87: STA.w VMAIN
#_0FCB8A: LDA.b #$08
#_0FCB8C: STA.w VMADDL
#_0FCB8F: LDA.b #$02
#_0FCB91: STA.w VMADDH
#_0FCB94: LDY.w #$0010

.branch0FCB97
#_0FCB97: PHY
#_0FCB98: LDY.w #$0010

.branch0FCB98
#_0FCB9B: LDA.l GFX_2FC000,X
#_0FCB9F: STA.w VMDATAL
#_0FCBA2: INX
#_0FCBA3: DEY
#_0FCBA4: BNE .branch0FCB98

#_0FCBA6: LDY.w #$0070
#_0FCBA9: LDA.b #$00

.branch0FCBAB
#_0FCBAB: STA.w VMDATAL
#_0FCBAE: DEY
#_0FCBAF: BNE .branch0FCBAB

#_0FCBB1: PLY
#_0FCBB2: DEY
#_0FCBB3: BNE .branch0FCB97

#_0FCBB5: LDX.w #$3800
#_0FCBB8: LDA.b #$00

.branch0FCBBA
#_0FCBBA: STA.w VMDATAL
#_0FCBBD: DEX
#_0FCBBE: BNE .branch0FCBBA

#_0FCBC0: REP #$30
#_0FCBC2: LDA.w #$4040
#_0FCBC5: STA.w $0CF3
#_0FCBC8: LDY.w #$0004

.branch0FCBCB
#_0FCBCB: SEP #$20
#_0FCBCD: PHY
#_0FCBCE: LDA.b #$80
#_0FCBD0: STA.w VMAIN
#_0FCBD3: LDA.w $0CF3
#_0FCBD6: STA.w VMADDL
#_0FCBD9: LDA.w $0CF4
#_0FCBDC: STA.w VMADDH
#_0FCBDF: LDY.w #$0040
#_0FCBE2: LDX.w #$0000
#_0FCBE5: JSR routine0FCBFD

#_0FCBE8: REP #$20
#_0FCBEA: CLC
#_0FCBEB: LDA.w $0CF3
#_0FCBEE: ADC.w #$00F0
#_0FCBF1: STA.w $0CF3
#_0FCBF4: PLY
#_0FCBF5: DEY
#_0FCBF6: BNE .branch0FCBCB

#_0FCBF8: JSR routine0FCC11
#_0FCBFB: PLP
#_0FCBFC: RTS

;===================================================================================================

routine0FCBFD:
#_0FCBFD: LDA.l data0FD22A+0,X
#_0FCC01: STA.w VMDATAL
#_0FCC04: LDA.l data0FD22A+1,X
#_0FCC08: STA.w VMDATAH
#_0FCC0B: INX
#_0FCC0C: INX
#_0FCC0D: DEY
#_0FCC0E: BNE routine0FCBFD

#_0FCC10: RTS

;===================================================================================================

routine0FCC11:
#_0FCC11: PHP
#_0FCC12: REP #$30
#_0FCC14: LDX.w #$0000
#_0FCC17: LDA.w #$E000
#_0FCC1A: LDY.w #$0100

.branch0FCC1D
#_0FCC1D: STA.l $7E2000,X
#_0FCC21: INX
#_0FCC22: INX
#_0FCC23: DEY
#_0FCC24: BNE .branch0FCC1D

#_0FCC26: LDY.w #$0010
#_0FCC29: LDA.w #$AAAA

.branch0FCC2C
#_0FCC2C: STA.l $7E2000,X
#_0FCC30: INX
#_0FCC31: INX
#_0FCC32: DEY
#_0FCC33: BNE .branch0FCC2C

#_0FCC35: PLP
#_0FCC36: RTS

;===================================================================================================

routine0FCC37:
#_0FCC37: PHP
#_0FCC38: SEP #$20
#_0FCC3A: REP #$10
#_0FCC3C: LDA.b #$80
#_0FCC3E: STA.w VMAIN
#_0FCC41: LDA.b #$00
#_0FCC43: STA.w VMADDL
#_0FCC46: STA.w VMADDH
#_0FCC49: LDY.w #$8000

.branch0FCC4C
#_0FCC4C: STA.w VMDATAL
#_0FCC4F: STA.w VMDATAH
#_0FCC52: DEY
#_0FCC53: BNE .branch0FCC4C

#_0FCC55: PLP
#_0FCC56: RTS

;===================================================================================================

routine0FCC57:
#_0FCC57: PHP
#_0FCC58: SEP #$20
#_0FCC5A: REP #$10
#_0FCC5C: LDA.b #$00
#_0FCC5E: STA.w CGADD
#_0FCC61: LDX.w #$0000
#_0FCC64: LDY.w #$0020

.branch0FCC67
#_0FCC67: LDA.l data0FCCC6,X
#_0FCC6B: STA.w CGDATA
#_0FCC6E: INX
#_0FCC6F: DEY
#_0FCC70: BNE .branch0FCC67

#_0FCC72: LDA.b #$80
#_0FCC74: STA.w CGADD
#_0FCC77: LDX.w #$0000
#_0FCC7A: LDY.w #$0020

.branch0FCC7D
#_0FCC7D: LDA.l data0FCCC6,X
#_0FCC81: STA.w CGDATA
#_0FCC84: INX
#_0FCC85: DEY
#_0FCC86: BNE .branch0FCC7D

#_0FCC88: PLP
#_0FCC89: RTS

;===================================================================================================

routine0FCC8A:
#_0FCC8A: PHP
#_0FCC8B: PHX
#_0FCC8C: PHY

#_0FCC8D: SEP #$20
#_0FCC8F: LDA.b #$00
#_0FCC91: STA.l $7E22FE
#_0FCC95: LDA.b #$10
#_0FCC97: STA.l $7E22FF

#_0FCC9B: REP #$20
#_0FCC9D: LDX.w #$0000
#_0FCCA0: LDY.w #$0010

.branch0FCCA3
#_0FCCA3: PHX
#_0FCCA4: LDX.w $0D13
#_0FCCA7: LDA.l data0FCCC6,X
#_0FCCAB: INX
#_0FCCAC: INX
#_0FCCAD: STX.w $0D13
#_0FCCB0: PLX
#_0FCCB1: STA.l $7E2300,X
#_0FCCB5: INX
#_0FCCB6: INX
#_0FCCB7: DEY
#_0FCCB8: BNE .branch0FCCA3

#_0FCCBA: SEP #$20
#_0FCCBC: LDA.b #$01
#_0FCCBE: STA.l $7E22FD
#_0FCCC2: PLY
#_0FCCC3: PLX
#_0FCCC4: PLP
#_0FCCC5: RTS

data0FCCC6:
#_0FCCC6: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCCCE: db $00,$61,$80,$61,$04,$62,$0C,$73
#_0FCCD6: db $80,$30,$80,$40,$00,$61,$04,$72
#_0FCCDE: db $80,$30,$80,$40,$00,$61,$04,$72
#_0FCCE6: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCCEE: db $00,$61,$80,$61,$04,$62,$0C,$73
#_0FCCF6: db $80,$30,$80,$40,$00,$61,$18,$61
#_0FCCFE: db $80,$30,$80,$40,$00,$61,$04,$72
#_0FCD06: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCD0E: db $00,$61,$80,$61,$04,$62,$9C,$73
#_0FCD16: db $80,$30,$80,$40,$14,$40,$18,$61
#_0FCD1E: db $80,$30,$80,$40,$00,$61,$04,$72
#_0FCD26: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCD2E: db $00,$61,$80,$61,$8C,$73,$9C,$73
#_0FCD36: db $80,$30,$0C,$30,$14,$40,$18,$61
#_0FCD3E: db $80,$30,$80,$40,$00,$61,$04,$72
#_0FCD46: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCD4E: db $00,$61,$04,$72,$8C,$73,$9C,$73
#_0FCD56: db $08,$10,$0C,$30,$14,$40,$18,$61
#_0FCD5E: db $80,$30,$80,$40,$00,$61,$18,$33
#_0FCD66: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCD6E: db $00,$61,$04,$72,$8C,$73,$9C,$73
#_0FCD76: db $08,$10,$0C,$30,$14,$40,$18,$61
#_0FCD7E: db $80,$30,$80,$40,$90,$12,$18,$33
#_0FCD86: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCD8E: db $00,$61,$04,$72,$8C,$73,$9C,$73
#_0FCD96: db $08,$10,$0C,$30,$14,$40,$18,$61
#_0FCD9E: db $80,$30,$84,$01,$90,$12,$18,$33
#_0FCDA6: db $00,$00,$00,$10,$80,$30,$80,$40
#_0FCDAE: db $00,$61,$04,$72,$8C,$73,$9C,$73
#_0FCDB6: db $08,$10,$0C,$30,$14,$40,$18,$61
#_0FCDBE: db $00,$21,$84,$01,$90,$12,$18,$33

INC_CFF_Max168:
#_0FCDC6: PHP
#_0FCDC7: REP #$30
#_0FCDC9: CLC
#_0FCDCA: LDA.w $0CFF
#_0FCDCD: ADC.w #$0001
#_0FCDD0: STA.w $0CFF
#_0FCDD3: CMP.w #$0168
#_0FCDD6: BNE .branch0FCDE3

#_0FCDD8: LDA.w #$0000
#_0FCDDB: STA.w $0CFF
#_0FCDDE: LDA.w #$00FF
#_0FCDE1: PLP
#_0FCDE2: RTS

.branch0FCDE3
#_0FCDE3: LDA.w #$0000
#_0FCDE6: PLP
#_0FCDE7: RTS

;===================================================================================================

routine0FCDE8:
#_0FCDE8: PHP
#_0FCDE9: SEP #$20
#_0FCDEB: LDA.b #$00
#_0FCDED: STA.w $0CFF
#_0FCDF0: STA.w $0D00
#_0FCDF3: LDA.b #$E7
#_0FCDF5: STA.w $0D01
#_0FCDF8: LDA.b #$00
#_0FCDFA: STA.w $0D02
#_0FCDFD: JSR routine0FCE4E
#_0FCE00: JSR routine0FCE05
#_0FCE03: PLP
#_0FCE04: RTS

;===================================================================================================

routine0FCE05:
#_0FCE05: PHP
#_0FCE06: SEP #$20

#_0FCE08: LDA.b #$80
#_0FCE0A: STA.w M7X

#_0FCE0D: LDA.b #$00
#_0FCE0F: STA.w M7X

#_0FCE12: LDA.b #$60
#_0FCE14: STA.w M7Y

#_0FCE17: LDA.b #$00
#_0FCE19: STA.w M7Y

#_0FCE1C: LDA.w $0D03
#_0FCE1F: STA.w M7A

#_0FCE22: LDA.w $0D04
#_0FCE25: STA.w M7A

#_0FCE28: LDA.w $0D05
#_0FCE2B: STA.w M7B

#_0FCE2E: LDA.w $0D06
#_0FCE31: STA.w M7B

#_0FCE34: LDA.w $0D07
#_0FCE37: STA.w M7C

#_0FCE3A: LDA.w $0D08
#_0FCE3D: STA.w M7C

#_0FCE40: LDA.w $0D09
#_0FCE43: STA.w M7D

#_0FCE46: LDA.w $0D0A
#_0FCE49: STA.w M7D

#_0FCE4C: PLP
#_0FCE4D: RTS

;===================================================================================================

routine0FCE4E:
#_0FCE4E: PHP
#_0FCE4F: REP #$30
#_0FCE51: LDA.w $0D01
#_0FCE54: STA.w $0CFD
#_0FCE57: JSR routine0FCF3A
#_0FCE5A: JSR routine0FCED0
#_0FCE5D: TAX
#_0FCE5E: STA.w $0D09
#_0FCE61: LDA.w #$0120
#_0FCE64: STA.w $0CFD
#_0FCE67: JSR routine0FCED0
#_0FCE6A: STA.w $0D03
#_0FCE6D: LDA.w $0D01
#_0FCE70: STA.w $0CFD
#_0FCE73: JSR routine0FCF48
#_0FCE76: JSR routine0FCED0
#_0FCE79: STA.w $0D05
#_0FCE7C: TAX
#_0FCE7D: LDA.w #$0120
#_0FCE80: STA.w $0CFD
#_0FCE83: JSR routine0FCED0
#_0FCE86: EOR.w #$FFFF
#_0FCE89: INC A
#_0FCE8A: STA.w $0D07
#_0FCE8D: PLP
#_0FCE8E: RTS

;===================================================================================================

routine0FCE8F:
#_0FCE8F: PHP
#_0FCE90: REP #$30
#_0FCE92: LDA.w $0D01
#_0FCE95: STA.w $0CFD
#_0FCE98: JSR routine0FCF3A
#_0FCE9B: JSR routine0FCED0
#_0FCE9E: TAX
#_0FCE9F: STA.w $0D09
#_0FCEA2: LDA.w #$0100
#_0FCEA5: STA.w $0CFD
#_0FCEA8: JSR routine0FCED0
#_0FCEAB: STA.w $0D03
#_0FCEAE: LDA.w $0D01
#_0FCEB1: STA.w $0CFD
#_0FCEB4: JSR routine0FCF48
#_0FCEB7: JSR routine0FCED0
#_0FCEBA: STA.w $0D05
#_0FCEBD: TAX
#_0FCEBE: LDA.w #$0100
#_0FCEC1: STA.w $0CFD
#_0FCEC4: JSR routine0FCED0
#_0FCEC7: EOR.w #$FFFF
#_0FCECA: INC A
#_0FCECB: STA.w $0D07
#_0FCECE: PLP
#_0FCECF: RTS

;===================================================================================================

routine0FCED0:
#_0FCED0: REP #$20
#_0FCED2: STZ.w $0CFB
#_0FCED5: TXA
#_0FCED6: BPL .branch0FCEDF

#_0FCED8: STA.w $0CFB
#_0FCEDB: DEC A
#_0FCEDC: EOR.w #$FFFF

.branch0FCEDF
#_0FCEDF: STA.w $0CF3

#_0FCEE2: SEP #$20
#_0FCEE4: LDA.w $0CFD
#_0FCEE7: STA.w WRMPYA
#_0FCEEA: LDA.w $0CF3
#_0FCEED: STA.w WRMPYB
#_0FCEF0: PHB
#_0FCEF1: PLB
#_0FCEF2: LDA.w RDMPYH
#_0FCEF5: STA.w $0CF5
#_0FCEF8: LDA.w $0CF4
#_0FCEFB: STA.w WRMPYB
#_0FCEFE: PHB
#_0FCEFF: PLB
#_0FCF00: LDX.w RDMPYL
#_0FCF03: STX.w $0CF7
#_0FCF06: LDA.w $0CFE
#_0FCF09: STA.w WRMPYA
#_0FCF0C: LDA.w $0CF3
#_0FCF0F: STA.w WRMPYB
#_0FCF12: PHB
#_0FCF13: PLB
#_0FCF14: LDX.w RDMPYL
#_0FCF17: LDA.w $0CF4
#_0FCF1A: STA.w WRMPYB
#_0FCF1D: PHB
#_0FCF1E: PLB
#_0FCF1F: LDA.w RDMPYL
#_0FCF22: STA.w $0CF6

#_0FCF25: REP #$20
#_0FCF27: TXA
#_0FCF28: CLC
#_0FCF29: ADC.w $0CF5
#_0FCF2C: CLC
#_0FCF2D: ADC.w $0CF7
#_0FCF30: LDX.w $0CFB
#_0FCF33: BEQ .EXIT_0FCF39

#_0FCF35: EOR.w #$FFFF
#_0FCF38: INC A

.EXIT_0FCF39
#_0FCF39: RTS

;===================================================================================================

routine0FCF3A:
#_0FCF3A: REP #$30
#_0FCF3C: LDX.w #$0000
#_0FCF3F: LDA.w $0CFF
#_0FCF42: CLC
#_0FCF43: ADC.w #$005A
#_0FCF46: BRA .branch0FCF50

routine0FCF48:
#_0FCF48: REP #$30
#_0FCF4A: LDX.w #$0000
#_0FCF4D: LDA.w $0CFF

.branch0FCF50
#_0FCF50: BPL .branch0FCF56

#_0FCF52: CLC
#_0FCF53: ADC.w #$0168

.branch0FCF56
#_0FCF56: CMP.w #$0168
#_0FCF59: BCC .branch0FCF5E

#_0FCF5B: SBC.w #$0168

.branch0FCF5E
#_0FCF5E: TAY
#_0FCF5F: BEQ .EXIT_0FCFAB

#_0FCF61: STZ.w $0CF3
#_0FCF64: SEC
#_0FCF65: SBC.w #$005A
#_0FCF68: BNE .branch0FCF6F

#_0FCF6A: LDX.w #$0100
#_0FCF6D: BRA .EXIT_0FCFAB

.branch0FCF6F
#_0FCF6F: BCC .branch0FCF95

#_0FCF71: TAY
#_0FCF72: SBC.w #$005A
#_0FCF75: BEQ .EXIT_0FCFAB

#_0FCF77: BCC .branch0FCF8A

#_0FCF79: STA.w $0CF3
#_0FCF7C: TAY
#_0FCF7D: SBC.w #$005A
#_0FCF80: BNE .branch0FCF87

#_0FCF82: LDX.w #$FF00
#_0FCF85: BRA .EXIT_0FCFAB

.branch0FCF87
#_0FCF87: BCC .branch0FCF95

#_0FCF89: TAY

.branch0FCF8A
#_0FCF8A: STY.w $0CF5
#_0FCF8D: LDA.w #$005A
#_0FCF90: SEC
#_0FCF91: SBC.w $0CF5
#_0FCF94: TAY

.branch0FCF95
#_0FCF95: PHX
#_0FCF96: TYX
#_0FCF97: LDA.l data0FCFAC,X
#_0FCF9B: PLX
#_0FCF9C: AND.w #$00FF
#_0FCF9F: TAX
#_0FCFA0: LDA.w $0CF3
#_0FCFA3: BEQ .EXIT_0FCFAB

#_0FCFA5: TXA
#_0FCFA6: EOR.w #$FFFF
#_0FCFA9: INC A
#_0FCFAA: TAX

.EXIT_0FCFAB
#_0FCFAB: RTS

data0FCFAC:
#_0FCFAC: db $00,$04,$08,$0D,$11,$16,$1A,$1F
#_0FCFB4: db $23,$27,$2C,$30,$35,$39,$3D,$42
#_0FCFBC: db $46,$4A,$4F,$53,$57,$5B,$5F,$64
#_0FCFC4: db $68,$6C,$70,$74,$78,$7C,$80,$83
#_0FCFCC: db $87,$8B,$8F,$92,$96,$9A,$9D,$A1
#_0FCFD4: db $A4,$A7,$AB,$AE,$B1,$B5,$B8,$BB
#_0FCFDC: db $BE,$C1,$C4,$C6,$C9,$CC,$CF,$D1
#_0FCFE4: db $D4,$D6,$D9,$DB,$DD,$DF,$E2,$E4
#_0FCFEC: db $E6,$E8,$E9,$EB,$ED,$EF,$F0,$F2
#_0FCFF4: db $F3,$F4,$F6,$F7,$F8,$F9,$FA,$FB
#_0FCFFC: db $FC,$FD,$FD,$FE,$FE,$FF,$FF,$FF
#_0FD004: db $FF,$FF

routine0FD006:
#_0FD006: PHP
#_0FD007: SEP #$20
#_0FD009: LDA.b #$C0
#_0FD00B: STA.l $7E2800

#_0FD00F: REP #$30
#_0FD011: LDA.w #$FF00
#_0FD014: LDX.w #$0001
#_0FD017: LDY.w #$0004

.branch0FD01A
#_0FD01A: PHY
#_0FD01B: LDY.w #$0040

.branch0FD01E
#_0FD01E: STA.l $7E2800,X
#_0FD022: INX
#_0FD023: INX
#_0FD024: DEY
#_0FD025: BNE .branch0FD01E

#_0FD027: SEP #$20
#_0FD029: PHA
#_0FD02A: LDA.b #$C0
#_0FD02C: STA.l $7E2800,X
#_0FD030: PLA

#_0FD031: REP #$20
#_0FD033: INX
#_0FD034: PLY
#_0FD035: DEY
#_0FD036: BNE .branch0FD01A

#_0FD038: LDX.w #$0161
#_0FD03B: LDY.w #$0100
#_0FD03E: LDA.w #$0000

.branch0FD041
#_0FD041: STA.l $7E2800,X
#_0FD045: INX
#_0FD046: INX
#_0FD047: DEY
#_0FD048: BNE .branch0FD041

#_0FD04A: SEP #$30
#_0FD04C: LDA.b #$0E
#_0FD04E: JSL PrepHDMAtypeFromA
#_0FD052: PLP
#_0FD053: RTS

;===================================================================================================

routine0FD054:
#_0FD054: PHP
#_0FD055: REP #$30
#_0FD057: LDX.w #$0032
#_0FD05A: LDY.w #$005E
#_0FD05D: JSR routine0FD098
#_0FD060: LDY.w #$0100

.branch0FD063
#_0FD063: PHY
#_0FD064: JSR routine0FD0ED
#_0FD067: PLY
#_0FD068: DEY
#_0FD069: BNE .branch0FD063

#_0FD06B: LDX.w #$0032
#_0FD06E: LDY.w #$005E

.branch0FD071
#_0FD071: PHY
#_0FD072: PHX
#_0FD073: JSR routine0FD098
#_0FD076: JSR routine0FD0ED
#_0FD079: PLX
#_0FD07A: PLY
#_0FD07B: INX
#_0FD07C: DEY
#_0FD07D: BNE .branch0FD071

#_0FD07F: PLP
#_0FD080: RTS

;===================================================================================================

routine0FD081:
#_0FD081: PHP
#_0FD082: SEP #$20
#_0FD084: LDA.b #$00
#_0FD086: STA.l $7E2800

#_0FD08A: SEP #$30
#_0FD08C: LDA.b #$0E
#_0FD08E: JSL PrepHDMAtypeFromA
#_0FD092: JSL AddSelfAsVectorAndMakeSpace
#_0FD096: PLP
#_0FD097: RTS

;===================================================================================================

routine0FD098:
#_0FD098: PHP
#_0FD099: REP #$30
#_0FD09B: PHY
#_0FD09C: PHX
#_0FD09D: TXA
#_0FD09E: JSR Divide144_by_A
#_0FD0A1: LDA.w #$0000
#_0FD0A4: STA.w $0CF7
#_0FD0A7: TXA
#_0FD0A8: INC A
#_0FD0A9: STA.w $0CF5
#_0FD0AC: SEC
#_0FD0AD: LDA.w #$0090
#_0FD0B0: SBC.w $0CF5
#_0FD0B3: STA.w $0CF5
#_0FD0B6: TXY

.branch0FD0B7
#_0FD0B7: PHY
#_0FD0B8: LDA.w $0CF5
#_0FD0BB: PHA
#_0FD0BC: LDA.w $0CF7
#_0FD0BF: PHA
#_0FD0C0: JSR routine0FD120
#_0FD0C3: JSR routine0FD146
#_0FD0C6: PLA
#_0FD0C7: STA.w $0CF7
#_0FD0CA: PLA
#_0FD0CB: STA.w $0CF5
#_0FD0CE: CLC
#_0FD0CF: LDA.w $0CF7
#_0FD0D2: ADC.w $0CF3
#_0FD0D5: STA.w $0CF7
#_0FD0D8: INC.w $0CF5
#_0FD0DB: PLY
#_0FD0DC: DEY
#_0FD0DD: BNE .branch0FD0B7

#_0FD0DF: LDA.w #$0000
#_0FD0E2: LDX.w #$0161
#_0FD0E5: STA.l $7E2800,X
#_0FD0E9: PLX
#_0FD0EA: PLY
#_0FD0EB: PLP
#_0FD0EC: RTS

;===================================================================================================

routine0FD0ED:
#_0FD0ED: PHP
#_0FD0EE: SEP #$30
#_0FD0F0: LDA.b #$0E
#_0FD0F2: JSL PrepHDMAtypeFromA
#_0FD0F6: JSR INC_CFF_Max168
#_0FD0F9: JSR routine0FCE4E
#_0FD0FC: JSL AddSelfAsVectorAndMakeSpace
#_0FD100: JSR routine0FCE05

#_0FD103: REP #$20
#_0FD105: LDA.w $0D19
#_0FD108: BNE .branch0FD112

#_0FD10A: LDA.w $0F2B
#_0FD10D: AND.w #$1000
#_0FD110: BNE .branch0FD116

.branch0FD112
#_0FD112: SEP #$20
#_0FD114: PLP
#_0FD115: RTS

.branch0FD116
#_0FD116: SEP #$20
#_0FD118: LDA.b #$80
#_0FD11A: STA.w INIDISP
#_0FD11D: JMP branch0FC9AF

routine0FD120:
#_0FD120: PHP
#_0FD121: SEP #$20
#_0FD123: REP #$10
#_0FD125: LDA.w $0CF8

#_0FD128: REP #$20
#_0FD12A: AND.w #$00FF
#_0FD12D: STA.w $0CF9
#_0FD130: SEC
#_0FD131: LDA.w $0CF5
#_0FD134: SBC.w $0CF9
#_0FD137: STA.w $0CF7
#_0FD13A: SEC
#_0FD13B: LDA.w #$0000
#_0FD13E: SBC.w $0CF7
#_0FD141: STA.w $0CF7
#_0FD144: PLP
#_0FD145: RTS

;===================================================================================================

routine0FD146:
#_0FD146: PHP
#_0FD147: PHX

#_0FD148: SEP #$20
#_0FD14A: REP #$10
#_0FD14C: LDA.w $0CF5
#_0FD14F: CLC
#_0FD150: ADC.b #$18

#_0FD152: REP #$20
#_0FD154: AND.w #$00FF
#_0FD157: PHA
#_0FD158: ASL A
#_0FD159: STA.w $0CF5
#_0FD15C: PLA
#_0FD15D: LSR A
#_0FD15E: LSR A
#_0FD15F: LSR A
#_0FD160: LSR A
#_0FD161: LSR A
#_0FD162: LSR A
#_0FD163: AND.w #$0003
#_0FD166: INC A
#_0FD167: CLC
#_0FD168: ADC.w $0CF5
#_0FD16B: STA.w $0CF5
#_0FD16E: TAX

#_0FD16F: REP #$20
#_0FD171: LDA.w $0CF7
#_0FD174: STA.l $7E2800,X
#_0FD178: PLX
#_0FD179: PLP
#_0FD17A: RTS

Divide144_by_A:
#_0FD17B: PHP
#_0FD17C: SEP #$30
#_0FD17E: PHA
#_0FD17F: LDA.b #$00
#_0FD181: STA.w WRDIVL
#_0FD184: LDA.b #$90
#_0FD186: STA.w WRDIVH
#_0FD189: PLA
#_0FD18A: STA.w WRDIVB
#_0FD18D: NOP
#_0FD18E: NOP
#_0FD18F: NOP
#_0FD190: NOP
#_0FD191: NOP
#_0FD192: NOP
#_0FD193: NOP
#_0FD194: NOP
#_0FD195: NOP
#_0FD196: NOP
#_0FD197: NOP
#_0FD198: NOP
#_0FD199: LDA.w RDDIVL
#_0FD19C: STA.w $0CF3
#_0FD19F: LDA.w RDDIVH
#_0FD1A2: STA.w $0CF4
#_0FD1A5: PLP
#_0FD1A6: RTS

;===================================================================================================

routine0FD1A7:
#_0FD1A7: PHP
#_0FD1A8: REP #$10
#_0FD1AA: SEP #$20
#_0FD1AC: LDA.b #$0F
#_0FD1AE: LDY.w #$0010

.branch0FD1B1
#_0FD1B1: STA.w INIDISP
#_0FD1B4: STA.w $0F43
#_0FD1B7: PHY
#_0FD1B8: PHA
#_0FD1B9: LDY.w #$0004

.branch0FD1BC
#_0FD1BC: PHY
#_0FD1BD: JSL AddSelfAsVectorAndMakeSpace
#_0FD1C1: JSL AddSelfAsVectorAndMakeSpace

#_0FD1C5: SEP #$20
#_0FD1C7: PLY
#_0FD1C8: DEY
#_0FD1C9: BNE .branch0FD1BC

#_0FD1CB: PLA
#_0FD1CC: DEC A
#_0FD1CD: PLY
#_0FD1CE: DEY
#_0FD1CF: BNE .branch0FD1B1

#_0FD1D1: PLP
#_0FD1D2: RTS

;===================================================================================================

routine0FD1D3:
#_0FD1D3: PHP
#_0FD1D4: REP #$10
#_0FD1D6: SEP #$20
#_0FD1D8: LDA.b #$00
#_0FD1DA: LDY.w #$0010

.branch0FD1DD
#_0FD1DD: STA.w INIDISP
#_0FD1E0: STA.w $0F43
#_0FD1E3: PHY
#_0FD1E4: PHA
#_0FD1E5: LDY.w #$0004

.branch0FD1E8
#_0FD1E8: PHY
#_0FD1E9: JSL AddSelfAsVectorAndMakeSpace
#_0FD1ED: JSL AddSelfAsVectorAndMakeSpace

#_0FD1F1: SEP #$20
#_0FD1F3: PLY
#_0FD1F4: DEY
#_0FD1F5: BNE .branch0FD1E8

#_0FD1F7: PLA
#_0FD1F8: INC A
#_0FD1F9: PLY
#_0FD1FA: DEY
#_0FD1FB: BNE .branch0FD1DD

#_0FD1FD: PLP
#_0FD1FE: RTS

;===================================================================================================

routine0FD1FF:
#_0FD1FF: PHP
#_0FD200: REP #$30
#_0FD202: LDX.w #$0032
#_0FD205: LDY.w #$005E
#_0FD208: JSR routine0FD098

#_0FD20B: SEP #$20
#_0FD20D: LDA.b #$00
#_0FD20F: LDY.w #$0010

.branch0FD212
#_0FD212: STA.w INIDISP
#_0FD215: PHY
#_0FD216: PHA
#_0FD217: LDY.w #$0004

.branch0FD21A
#_0FD21A: PHY
#_0FD21B: JSR routine0FD0ED
#_0FD21E: PLY
#_0FD21F: DEY
#_0FD220: BNE .branch0FD21A

#_0FD222: PLA
#_0FD223: INC A
#_0FD224: PLY
#_0FD225: DEY
#_0FD226: BNE .branch0FD212

#_0FD228: PLP
#_0FD229: RTS

; TODO merge
; graphics tiles
data0FD22A:
#_0FD22A: db $01
#_0FD22B: db $00,$03,$00,$07,$00,$0F,$00,$1E
#_0FD233: db $01,$3C,$03,$78,$07,$F1,$0F,$00
#_0FD23B: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD243: db $00,$00,$00,$00,$00,$00,$00,$E2
#_0FD24B: db $1E,$C4,$3C,$89,$78,$13,$F1,$27
#_0FD253: db $E2,$4F,$C4,$9E,$88,$3C,$10,$01
#_0FD25B: db $00,$03,$00,$07,$00,$0F,$00,$1F
#_0FD263: db $00,$3F,$00,$7F,$00,$FF,$00,$79
#_0FD26B: db $21,$F3,$43,$E6,$87,$CC,$0F,$99
#_0FD273: db $1E,$33,$3C,$67,$78,$CF,$F0,$FE
#_0FD27B: db $00,$FC,$00,$F8,$00,$F0,$00,$E0
#_0FD283: db $00,$C0,$00,$80,$00,$00,$00,$9F
#_0FD28B: db $E0,$3E,$C0,$7C,$80,$F8,$00,$F0
#_0FD293: db $00,$E0,$00,$C0,$00,$80,$00,$00
#_0FD29B: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD2A3: db $00,$00,$00,$00,$00,$00,$00

routine0FD2AA:
#_0FD2AA: PHP
#_0FD2AB: REP #$30
#_0FD2AD: LDA.w #$AEAA
#_0FD2B0: STA.l $7E2202

#_0FD2B4: SEP #$20
#_0FD2B6: LDX.w #$0000
#_0FD2B9: STX.w $0D13
#_0FD2BC: LDA.b #$CC
#_0FD2BE: STA.w $0D11
#_0FD2C1: LDA.b #$00
#_0FD2C3: STA.w $0D12
#_0FD2C6: LDY.w #$0007
#_0FD2C9: LDX.w #$0000

.branch0FD2CC
#_0FD2CC: PHY
#_0FD2CD: JSR routine0FD340
#_0FD2D0: JSR routine0FD331
#_0FD2D3: JSR routine0FD351
#_0FD2D6: PHX
#_0FD2D7: JSL AddSelfAsVectorAndMakeSpace
#_0FD2DB: PLX

#_0FD2DC: REP #$20
#_0FD2DE: LDA.w $0D19
#_0FD2E1: BNE .branch0FD2EB

#_0FD2E3: LDA.w $0F2B
#_0FD2E6: AND.w #$1000
#_0FD2E9: BNE .branch0FD321

.branch0FD2EB
#_0FD2EB: SEP #$20
#_0FD2ED: JSR routine0FD340
#_0FD2F0: JSR routine0FD324
#_0FD2F3: JSR routine0FD35B
#_0FD2F6: PHX
#_0FD2F7: JSR routine0FCC8A
#_0FD2FA: JSL AddSelfAsVectorAndMakeSpace
#_0FD2FE: PLX

#_0FD2FF: REP #$20
#_0FD301: LDA.w $0D19
#_0FD304: BNE .branch0FD30E

#_0FD306: LDA.w $0F2B
#_0FD309: AND.w #$1000
#_0FD30C: BNE .branch0FD321

.branch0FD30E
#_0FD30E: SEP #$20
#_0FD310: PLY
#_0FD311: DEY
#_0FD312: BNE .branch0FD2CC

#_0FD314: SEP #$20
#_0FD316: LDX.w #$0203
#_0FD319: LDA.b #$FE
#_0FD31B: STA.l $7E2000,X
#_0FD31F: PLP
#_0FD320: RTS

.branch0FD321
#_0FD321: JMP branch0FC9AF

; TODO oam related or something
routine0FD324:
#_0FD324: LDA.b #$00
#_0FD326: STA.l $7E2000,X
#_0FD32A: INX
#_0FD32B: STA.l $7E2000,X
#_0FD32F: INX
#_0FD330: RTS

;===================================================================================================

routine0FD331:
#_0FD331: LDA.b #$04
#_0FD333: STA.l $7E2000,X
#_0FD337: INX
#_0FD338: LDA.b #$00
#_0FD33A: STA.l $7E2000,X
#_0FD33E: INX
#_0FD33F: RTS

;===================================================================================================

routine0FD340:
#_0FD340: LDA.w $0D11
#_0FD343: STA.l $7E2000,X
#_0FD347: INX
#_0FD348: LDA.w $0D12
#_0FD34B: STA.l $7E2000,X
#_0FD34F: INX
#_0FD350: RTS

;===================================================================================================

routine0FD351:
#_0FD351: SEC
#_0FD352: LDA.w $0D11
#_0FD355: SBC.b #$20
#_0FD357: STA.w $0D11
#_0FD35A: RTS

;===================================================================================================

routine0FD35B:
#_0FD35B: CLC
#_0FD35C: LDA.w $0D12
#_0FD35F: ADC.b #$20
#_0FD361: STA.w $0D12
#_0FD364: RTS

;===================================================================================================

routine0FD365:
#_0FD365: PHP
#_0FD366: SEP #$20
#_0FD368: REP #$10

#_0FD36A: JSR routine0FD418
#_0FD36D: JSR routine0FCC37

#_0FD370: LDA.b #$80
#_0FD372: STA.w VMAIN

#_0FD375: LDA.b #$00
#_0FD377: STA.w VMADDL
#_0FD37A: STA.w VMADDH

#_0FD37D: LDY.w #$1000
#_0FD380: LDX.w #$0000

.branch0FD383
#_0FD383: LDA.l GFX_2FE000,X
#_0FD387: STA.w VMDATAL
#_0FD38A: LDA.l GFX_2FE001,X
#_0FD38E: STA.w VMDATAH
#_0FD391: INX
#_0FD392: INX
#_0FD393: DEY
#_0FD394: BNE .branch0FD383

#_0FD396: SEP #$20
#_0FD398: LDA.b #$00
#_0FD39A: STA.w CGADD
#_0FD39D: LDX.w #$0000
#_0FD3A0: LDY.w #$0040

; TODO look at this palette
.branch0FD3A3
#_0FD3A3: LDA.l DATA8_0FD529,X
#_0FD3A7: STA.w CGDATA
#_0FD3AA: INX
#_0FD3AB: DEY
#_0FD3AC: BNE .branch0FD3A3

#_0FD3AE: LDY.w #$0020
#_0FD3B1: LDA.b #$00

.branch0FD3B3
#_0FD3B3: STA.w CGDATA
#_0FD3B6: INX
#_0FD3B7: DEY
#_0FD3B8: BNE .branch0FD3B3

#_0FD3BA: LDA.b #$00
#_0FD3BC: STA.w VMADDL
#_0FD3BF: LDA.b #$40
#_0FD3C1: STA.w VMADDH

#_0FD3C4: LDX.w #$0000
#_0FD3C7: LDY.w #$0040

.branch0FD3CA
#_0FD3CA: LDA.l CursorGFX,X
#_0FD3CE: STA.w VMDATAL
#_0FD3D1: INX
#_0FD3D2: LDA.l CursorGFX,X
#_0FD3D6: STA.w VMDATAH
#_0FD3D9: INX
#_0FD3DA: DEY
#_0FD3DB: BNE .branch0FD3CA

#_0FD3DD: LDA.b #$00
#_0FD3DF: STA.w VMADDL
#_0FD3E2: LDA.b #$41
#_0FD3E4: STA.w VMADDH
#_0FD3E7: LDX.w #$0200
#_0FD3EA: LDY.w #$0040

.branch0FD3ED
#_0FD3ED: LDA.l CursorGFX,X
#_0FD3F1: STA.w VMDATAL
#_0FD3F4: INX
#_0FD3F5: LDA.l CursorGFX,X
#_0FD3F9: STA.w VMDATAH
#_0FD3FC: INX
#_0FD3FD: DEY
#_0FD3FE: BNE .branch0FD3ED

#_0FD400: LDA.b #$80
#_0FD402: STA.w CGADD
#_0FD405: LDX.w #$0000
#_0FD408: LDY.w #$0020

.branch0FD40B
#_0FD40B: LDA.l SomePalette1CB040,X
#_0FD40F: STA.w CGDATA
#_0FD412: INX
#_0FD413: DEY
#_0FD414: BNE .branch0FD40B

#_0FD416: PLP
#_0FD417: RTS

;===================================================================================================

routine0FD418:
#_0FD418: PHP
#_0FD419: SEP #$20
#_0FD41B: LDA.b #$80
#_0FD41D: STA.w INIDISP
#_0FD420: LDA.b #$01
#_0FD422: STA.w BGMODE
#_0FD425: STA.w $0F45
#_0FD428: LDA.b #$22
#_0FD42A: STA.w BG1SC
#_0FD42D: STA.w $0F47
#_0FD430: LDA.b #$60
#_0FD432: STA.w BG2SC
#_0FD435: STA.w $0F48
#_0FD438: LDA.b #$00
#_0FD43A: STA.w BG12NBA
#_0FD43D: STA.w $0F4B
#_0FD440: LDA.b #$00
#_0FD442: STA.w BG1HOFS
#_0FD445: STA.w BG1VOFS
#_0FD448: LDA.b #$02
#_0FD44A: STA.w OBSEL
#_0FD44D: STA.w $0F44
#_0FD450: LDA.b #$0F
#_0FD452: STA.w TM
#_0FD455: STA.w $0F74
#_0FD458: LDA.b #$10
#_0FD45A: STA.w TS
#_0FD45D: STA.w $0F76
#_0FD460: LDA.b #$02
#_0FD462: STA.w CGWSEL
#_0FD465: STA.w $0F7A
#_0FD468: LDA.b #$03
#_0FD46A: STA.w CGADSUB
#_0FD46D: STA.w $0F7B

#_0FD470: REP #$20
#_0FD472: LDA.w #$0000
#_0FD475: STA.w $0F53

#_0FD478: SEP #$20
#_0FD47A: STA.w BG2VOFS
#_0FD47D: STA.w BG2VOFS
#_0FD480: PLP
#_0FD481: RTS

;===================================================================================================

routine0FD482:
#_0FD482: PHP
#_0FD483: JSR routine0FD365

#_0FD486: REP #$10
#_0FD488: SEP #$20
#_0FD48A: LDX.w #$0046
#_0FD48D: LDA.b #$80
#_0FD48F: STA.w VMAIN
#_0FD492: BRA .branch0FD4A4

routine0FD494:
#_0FD494: PHP
#_0FD495: JSR routine0FD365

#_0FD498: REP #$10
#_0FD49A: SEP #$20
#_0FD49C: LDX.w #$0000
#_0FD49F: LDA.b #$80
#_0FD4A1: STA.w VMAIN

.branch0FD4A4
#_0FD4A4: REP #$20
#_0FD4A6: LDA.l DATA8_0FD624+0,X
#_0FD4AA: CMP.w #$FFFF
#_0FD4AD: BEQ .branch0FD4D8

#_0FD4AF: SEP #$20
#_0FD4B1: LDA.l DATA8_0FD624+0,X
#_0FD4B5: STA.w VMADDL
#_0FD4B8: LDA.l DATA8_0FD624+1,X
#_0FD4BC: ORA.b #$20
#_0FD4BE: STA.w VMADDH
#_0FD4C1: INX
#_0FD4C2: INX
#_0FD4C3: LDY.w #$0020

.branch0FD4C6
#_0FD4C6: LDA.l DATA8_0FD624+0,X
#_0FD4CA: STA.w VMDATAL
#_0FD4CD: LDA.b #$20
#_0FD4CF: STA.w VMDATAH
#_0FD4D2: INX
#_0FD4D3: DEY
#_0FD4D4: BNE .branch0FD4C6

#_0FD4D6: BRA .branch0FD4A4

.branch0FD4D8
#_0FD4D8: PLP
#_0FD4D9: RTS

;===================================================================================================

routine0FD4DA:
#_0FD4DA: PHP
#_0FD4DB: JSR routine0FD482
#_0FD4DE: JSR routine0FE040

#_0FD4E1: SEP #$20
#_0FD4E3: LDA.b #$00
#_0FD4E5: STA.w INIDISP

#_0FD4E8: REP #$30
#_0FD4EA: JSR routine0FD7C0
#_0FD4ED: JSR EnableNMI_B0F
#_0FD4F0: JSR routine0FD82E

#_0FD4F3: SEP #$20
#_0FD4F5: LDA.b #$0F
#_0FD4F7: STA.w INIDISP
#_0FD4FA: STA.w $0F43
#_0FD4FD: PLP
#_0FD4FE: RTS

;===================================================================================================

routine0FD4FF:
#_0FD4FF: PHP
#_0FD500: REP #$30
#_0FD502: JSR routine0FD494
#_0FD505: JSR routine0FD1D3
#_0FD508: JSR routine0FCA1B
#_0FD50B: LDY.w #$0030

.branch0FD50E
#_0FD50E: PHY
#_0FD50F: JSL AddSelfAsVectorAndMakeSpace
#_0FD513: PLY

#_0FD514: REP #$20
#_0FD516: LDA.w $0F2B
#_0FD519: AND.w #$1000
#_0FD51C: BEQ .branch0FD521

#_0FD51E: JMP branch0FC9AF

.branch0FD521
#_0FD521: DEY
#_0FD522: BNE .branch0FD50E

#_0FD524: JSR routine0FD1A7
#_0FD527: PLP
#_0FD528: RTS

DATA8_0FD529:
#_0FD529: db $00,$00,$00,$00,$8C,$31,$9C,$73
#_0FD531: db $DF,$52,$A5,$6C,$42,$44,$CE,$7D
#_0FD539: db $9A,$79,$0C,$00,$14,$00,$1F,$00
#_0FD541: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD549: db $08,$22,$A0,$16,$E0,$5B,$9C,$73
#_0FD551: db $60,$11,$00,$4D,$40,$69,$8C,$02
#_0FD559: db $11,$2B,$78,$2F,$9A,$63,$A0,$16
#_0FD561: db $E5,$3F,$9C,$73,$60,$11,$FF,$7F

DATA16_0FD569:
#_0FD569: dw $0000,$0020,$0002,$0023
#_0FD571: dw $0422,$0443,$0443,$0863
#_0FD579: dw $0022,$0023,$0043,$0000
#_0FD581: dw $0042,$0002,$0440,$0400

routine0FD859:
#_0FD589: PHP
#_0FD58A: PHY
#_0FD58B: PHX

#_0FD58C: REP #$30
#_0FD58E: LSR A
#_0FD58F: SEC
#_0FD590: SBC.w #$001C
#_0FD593: BCS .branch0FD598

#_0FD595: LDA.w #$0000

.branch0FD598
#_0FD598: STA.w $0CFF

#_0FD59B: SEP #$20
#_0FD59D: LDA.b #$20
#_0FD59F: STA.l $7E22FE
#_0FD5A3: LDA.b #$10
#_0FD5A5: STA.l $7E22FF

#_0FD5A9: REP #$20
#_0FD5AB: LDX.w #$0000
#_0FD5AE: LDY.w #$0010

.branch0FD5B1
#_0FD5B1: LDA.w $0CFF
#_0FD5B4: STA.w $0CFB
#_0FD5B7: LDA.l DATA16_0FD569,X
#_0FD5BB: AND.w #$001F
#_0FD5BE: SEC
#_0FD5BF: SBC.w $0CFB
#_0FD5C2: BCS .branch0FD5C7

#_0FD5C4: LDA.w #$0000

.branch0FD5C7
#_0FD5C7: STA.w $0CFD
#_0FD5CA: LDA.w $0CFB
#_0FD5CD: ASL A
#_0FD5CE: ASL A
#_0FD5CF: ASL A
#_0FD5D0: ASL A
#_0FD5D1: ASL A
#_0FD5D2: STA.w $0CFB
#_0FD5D5: LDA.l DATA16_0FD569,X
#_0FD5D9: AND.w #$03E0
#_0FD5DC: SEC
#_0FD5DD: SBC.w $0CFB
#_0FD5E0: BCS .branch0FD5E5

#_0FD5E2: LDA.w #$0000

.branch0FD5E5
#_0FD5E5: ORA.w $0CFD
#_0FD5E8: STA.w $0CFD
#_0FD5EB: LDA.w $0CFB
#_0FD5EE: ASL A
#_0FD5EF: ASL A
#_0FD5F0: ASL A
#_0FD5F1: ASL A
#_0FD5F2: ASL A
#_0FD5F3: STA.w $0CFB
#_0FD5F6: LDA.l DATA16_0FD569,X
#_0FD5FA: AND.w #$7C00
#_0FD5FD: SEC
#_0FD5FE: SBC.w $0CFB
#_0FD601: BCS .branch0FD606

#_0FD603: LDA.w #$0000

.branch0FD606
#_0FD606: ORA.w $0CFD
#_0FD609: STA.w $0CFD
#_0FD60C: LDA.w $0CFD
#_0FD60F: STA.l $7E2300,X
#_0FD613: INX
#_0FD614: INX
#_0FD615: DEY
#_0FD616: BNE .branch0FD5B1

#_0FD618: SEP #$20
#_0FD61A: LDA.b #$01
#_0FD61C: STA.l $7E22FD
#_0FD620: PLX
#_0FD621: PLY
#_0FD622: PLP
#_0FD623: RTS

; TODO merge graphics
DATA8_0FD624:
#_0FD624: db $80
#_0FD625: db $01,$00,$00,$00,$00,$00,$00,$00
#_0FD62D: db $00,$80,$81,$81,$82,$83,$84,$85
#_0FD635: db $86,$87,$88,$89,$8A,$8B,$8C,$8D
#_0FD63D: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD645: db $00,$A0,$01,$00,$00,$00,$00,$00
#_0FD64D: db $00,$00,$00,$90,$91,$91,$92,$93
#_0FD655: db $94,$95,$96,$97,$98,$99,$9A,$9B
#_0FD65D: db $9C,$9D,$00,$00,$00,$00,$00,$00
#_0FD665: db $00,$00,$00,$FF,$FF,$80,$00,$00
#_0FD66D: db $00,$00,$00,$01,$02,$03,$04,$05
#_0FD675: db $00,$00,$06,$07,$00,$08,$09,$0A
#_0FD67D: db $0B,$0C,$0D,$0E,$00,$00,$00,$00
#_0FD685: db $00,$10,$11,$12,$13,$00,$00,$A0
#_0FD68D: db $00,$00,$00,$00,$00,$14,$15,$16
#_0FD695: db $17,$18,$19,$1A,$1B,$1C,$1D,$1E
#_0FD69D: db $1F,$20,$21,$22,$23,$24,$00,$00
#_0FD6A5: db $00,$00,$25,$26,$27,$28,$29,$00
#_0FD6AD: db $00,$C0,$00,$00,$00,$00,$2A,$2B
#_0FD6B5: db $2C,$2D,$2E,$2F,$30,$31,$32,$33
#_0FD6BD: db $00,$34,$35,$36,$37,$38,$39,$3A
#_0FD6C5: db $3B,$3C,$3D,$3E,$3F,$40,$41,$42
#_0FD6CD: db $43,$00,$00,$E0,$00,$00,$00,$44
#_0FD6D5: db $45,$46,$47,$48,$49,$00,$4A,$4B
#_0FD6DD: db $4C,$4D,$4E,$4F,$50,$51,$52,$53
#_0FD6E5: db $54,$55,$56,$57,$58,$59,$5A,$5B
#_0FD6ED: db $5C,$00,$00,$00,$00,$00,$01,$00
#_0FD6F5: db $00,$5D,$5E,$5F,$60,$61,$00,$62
#_0FD6FD: db $63,$64,$65,$66,$67,$68,$00,$69
#_0FD705: db $6A,$00,$6B,$6C,$6D,$6E,$6F,$70
#_0FD70D: db $40,$71,$40,$72,$00,$00,$00,$20
#_0FD715: db $01,$00,$00,$00,$00,$00,$00,$00
#_0FD71D: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD725: db $00,$00,$00,$73,$74,$75,$76,$77
#_0FD72D: db $78,$79,$00,$00,$00,$00,$00,$00
#_0FD735: db $00,$40,$01,$00,$00,$00,$00,$00
#_0FD73D: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD745: db $00,$00,$00,$00,$00,$00,$7A,$7B
#_0FD74D: db $7C,$7D,$7E,$7F,$00,$00,$00,$00
#_0FD755: db $00,$00,$00,$60,$02,$00,$00,$00
#_0FD75D: db $00,$00,$00,$00,$00,$00,$C8,$C9
#_0FD765: db $CA,$CB,$C9,$00,$00,$00,$00,$CC
#_0FD76D: db $CD,$D0,$C9,$D1,$D0,$CE,$CF,$00
#_0FD775: db $00,$00,$00,$00,$00,$C0,$02,$00
#_0FD77D: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD785: db $00,$00,$00,$00,$00,$00,$A0,$A1
#_0FD78D: db $A2,$A3,$A4,$A5,$A6,$A7,$00,$00
#_0FD795: db $00,$00,$00,$00,$00,$00,$00,$E0
#_0FD79D: db $02,$00,$00,$00,$00,$00,$00,$00
#_0FD7A5: db $00,$00,$9E,$D2,$D3,$D3,$D4,$00
#_0FD7AD: db $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7
#_0FD7B5: db $00,$00,$00,$00,$00,$00,$00,$00
#_0FD7BD: db $00,$FF,$FF

routine0FD7C0:
#_0FD7C0: PHP
#_0FD7C1: SEP #$20
#_0FD7C3: LDA.b #$E0
#_0FD7C5: STA.l $7E2800

#_0FD7C9: REP #$30
#_0FD7CB: LDA.w #$FF00
#_0FD7CE: LDX.w #$0001
#_0FD7D1: LDY.w #$0003

.branch0FD7D4
#_0FD7D4: PHY
#_0FD7D5: LDY.w #$0060

.branch0FD7D8
#_0FD7D8: REP #$20
#_0FD7DA: STA.l $7E2800,X
#_0FD7DE: INX
#_0FD7DF: INX
#_0FD7E0: DEY
#_0FD7E1: BNE .branch0FD7D8

#_0FD7E3: SEP #$20
#_0FD7E5: PHA
#_0FD7E6: LDA.b #$E0
#_0FD7E8: STA.l $7E2800,X
#_0FD7EC: PLA

#_0FD7ED: REP #$20
#_0FD7EF: INX
#_0FD7F0: PLY
#_0FD7F1: DEY
#_0FD7F2: BNE .branch0FD7D4

#_0FD7F4: DEX
#_0FD7F5: LDA.w #$0000
#_0FD7F8: STA.l $7E2800,X
#_0FD7FC: INX
#_0FD7FD: INX
#_0FD7FE: LDA.w #$0000
#_0FD801: STA.l $7E2800,X
#_0FD805: PLP
#_0FD806: RTS

;===================================================================================================

routine0FD807:
#_0FD807: PHP
#_0FD808: REP #$30
#_0FD80A: LDY.w #$0044
#_0FD80D: LDX.w #$00BF

.branch0FD810
#_0FD810: LDA.w #$0000
#_0FD813: STA.l $7E2800,X
#_0FD817: TYA
#_0FD818: JSR routine0FD859
#_0FD81B: JSR routine0FD82E
#_0FD81E: JSR routine0FD82E
#_0FD821: JSR routine0FD82E
#_0FD824: DEX
#_0FD825: DEX
#_0FD826: DEY
#_0FD827: BNE .branch0FD810

#_0FD829: JSR routine0FD081
#_0FD82C: PLP
#_0FD82D: RTS

;===================================================================================================

routine0FD82E:
#_0FD82E: PHP
#_0FD82F: PHY
#_0FD830: PHX

#_0FD831: SEP #$30
#_0FD833: LDA.b #$0E
#_0FD835: JSL PrepHDMAtypeFromA
#_0FD839: JSL AddSelfAsVectorAndMakeSpace

#_0FD83D: REP #$30
#_0FD83F: PLX
#_0FD840: PLY
#_0FD841: PLP
#_0FD842: RTS

;===================================================================================================

routine0FD843:
#_0FD843: PHP
#_0FD844: REP #$30
#_0FD846: JSR DisableNMI_B0F
#_0FD849: JSR routine0FCC37
#_0FD84C: JSL PPUSettings_00C409
#_0FD850: JSR DisableNMI_B0F
#_0FD853: JSR routine0FD938
#_0FD856: JSR routine0FCC37
#_0FD859: JSR routine0FD8DF

#_0FD85C: SEP #$20
#_0FD85E: LDA.b #$01
#_0FD860: STA.w $0CF2

#_0FD863: REP #$20
#_0FD865: JSR EnableNMI_B0F

#_0FD868: SEP #$20
#_0FD86A: LDA.b #$0F
#_0FD86C: STA.w INIDISP

#_0FD86F: REP #$20
#_0FD871: JSR SomeGuyInTheIntroTypingCode
#_0FD874: PLP
#_0FD875: RTS

;===================================================================================================

routine0FD876:
#_0FD876: PHP
#_0FD877: SEP #$20
#_0FD879: PHY
#_0FD87A: PHX
#_0FD87B: PHA

#_0FD87C: SEP #$20
#_0FD87E: LDA.b #$01
#_0FD880: STA.w $0CF2

.branch0FD883
#_0FD883: LDA.w $0CF2
#_0FD886: BNE .branch0FD883

#_0FD888: LDA.b #$01
#_0FD88A: STA.w $0CF2
#_0FD88D: PLA
#_0FD88E: PLX
#_0FD88F: PLY
#_0FD890: PLP
#_0FD891: RTS

;===================================================================================================
; $0CF2 is a flag that will cause NMI to skip transfers
; Looks like this waits for the next NMI and then also
; prevents the NMI after that from happening
;===================================================================================================
WaitForNMI_then_PreventTheNext:
#_0FD892: PHP
#_0FD893: SEP #$20
#_0FD895: PHY
#_0FD896: PHX
#_0FD897: PHA

#_0FD898: SEP #$20
#_0FD89A: LDA.w $0D19
#_0FD89D: BNE .noskip

#_0FD89F: LDA.w JOY1H
#_0FD8A2: AND.b #$FF
#_0FD8A4: BEQ .noskip

#_0FD8A6: JMP branch0FC9AF

.noskip
#_0FD8A9: LDA.b #$01
#_0FD8AB: STA.w $0CF2

.wait_for_nmi
#_0FD8AE: LDA.w $0CF2
#_0FD8B1: BNE .wait_for_nmi

#_0FD8B3: LDA.b #$01
#_0FD8B5: STA.w $0CF2

#_0FD8B8: PLA
#_0FD8B9: PLX
#_0FD8BA: PLY
#_0FD8BB: PLP
#_0FD8BC: RTS

WaitForNMI_variable_X:
#_0FD8BD: PHP
#_0FD8BE: REP #$30

#_0FD8C0: PHY
#_0FD8C1: LDA.l routine0FC929,X

#_0FD8C5: AND.w #$0003
#_0FD8C8: CLC
#_0FD8C9: ADC.w #$0002
#_0FD8CC: TAY

.keep_waiting
#_0FD8CD: JSR WaitForNMI_then_PreventTheNext
#_0FD8D0: DEY
#_0FD8D1: BNE .keep_waiting

#_0FD8D3: PLY
#_0FD8D4: PLP
#_0FD8D5: RTS

;===================================================================================================

routine0FD8D6:
#_0FD8D6: PHP
#_0FD8D7: REP #$30
#_0FD8D9: PHY
#_0FD8DA: LDY.w #$0020
#_0FD8DD: BRA .branch0FD8CD

routine0FD8DF:
#_0FD8DF: PHP
#_0FD8E0: SEP #$20
#_0FD8E2: LDA.b #$80
#_0FD8E4: STA.w VMAIN

#_0FD8E7: REP #$30
#_0FD8E9: LDA.w #$0002
#_0FD8EC: STA.w $0D11
#_0FD8EF: LDX.w #$0000

.branch0FD8F2
#_0FD8F2: LDA.l data0FDB59,X
#_0FD8F6: CMP.w #$FFFF
#_0FD8F9: BEQ .EXIT_0FD936

#_0FD8FB: SEP #$20
#_0FD8FD: LDA.l data0FDB59,X
#_0FD901: STA.w VMADDL
#_0FD904: INX
#_0FD905: CLC
#_0FD906: LDA.l data0FDB59,X
#_0FD90A: ADC.b #$20
#_0FD90C: STA.w VMADDH
#_0FD90F: INX
#_0FD910: LDA.l data0FDB59,X

#_0FD914: REP #$20
#_0FD916: AND.w #$00FF
#_0FD919: INX
#_0FD91A: TAY

.branch0FD91B
#_0FD91B: SEP #$20
#_0FD91D: LDA.w $0D11
#_0FD920: STA.w VMDATAL
#_0FD923: LDA.w $0D12
#_0FD926: STA.w VMDATAH

#_0FD929: REP #$20
#_0FD92B: INC.w $0D11
#_0FD92E: INC.w $0D11
#_0FD931: DEY
#_0FD932: BNE .branch0FD91B

#_0FD934: BRA .branch0FD8F2

.EXIT_0FD936
#_0FD936: PLP
#_0FD937: RTS

;===================================================================================================

routine0FD938:
#_0FD938: PHP
#_0FD939: SEP #$20
#_0FD93B: LDA.b #$05
#_0FD93D: STA.w BGMODE
#_0FD940: LDA.b #$70
#_0FD942: STA.w BG1SC
#_0FD945: LDA.b #$22
#_0FD947: STA.w BG2SC
#_0FD94A: LDA.b #$70
#_0FD94C: STA.w BG3SC
#_0FD94F: LDA.b #$70
#_0FD951: STA.w BG4SC
#_0FD954: LDA.b #$37
#_0FD956: STA.w BG12NBA
#_0FD959: LDA.b #$77
#_0FD95B: STA.w BG34NBA

routine0FD95E:
#_0FD95E: LDA.b #$00
#_0FD960: STA.w BG2HOFS
#_0FD963: STA.w BG2VOFS
#_0FD966: PLP
#_0FD967: RTS

AttemptIntroSequenceCreepShots:
#_0FD968: PHP
#_0FD969: REP #$30

#_0FD96B: PHY
#_0FD96C: PHX
#_0FD96D: TXA
#_0FD96E: LDX.w $0D15
#_0FD971: CMP.l IntroSequenceCreepShotIndices,X
#_0FD975: BEQ .do_shot

.exit
#_0FD977: PLX
#_0FD978: PLY
#_0FD979: PLP
#_0FD97A: RTS

.do_shot
#_0FD97B: PHP
#_0FD97C: PHX
#_0FD97D: JSL PPUSettings_00C409
#_0FD981: PLX
#_0FD982: PLP

#_0FD983: SEP #$20
#_0FD985: INX
#_0FD986: INX
#_0FD987: LDA.l IntroSequenceCreepShotIndices,X
#_0FD98B: STA.w $0A59
#_0FD98E: PHP
#_0FD98F: REP #$20
#_0FD991: LDA.w #$FFFF
#_0FD994: STA.w $0CF3
#_0FD997: PHX
#_0FD998: JSL routine02E32D

#_0FD99C: REP #$10
#_0FD99E: PLX
#_0FD99F: PLP
#_0FD9A0: INX

.branch0FD9A1
#_0FD9A1: SEP #$20
#_0FD9A3: REP #$10
#_0FD9A5: LDY.w #$0020
#_0FD9A8: LDA.l IntroSequenceCreepShotIndices,X
#_0FD9AC: CMP.b #$FF
#_0FD9AE: BEQ .branch0FD9D8

#_0FD9B0: STA.w $0A6A
#_0FD9B3: INX
#_0FD9B4: LDA.l IntroSequenceCreepShotIndices,X
#_0FD9B8: STA.w $0A69
#_0FD9BB: INX
#_0FD9BC: LDA.l IntroSequenceCreepShotIndices,X
#_0FD9C0: STA.w $0A6B
#_0FD9C3: INX
#_0FD9C4: LDA.l IntroSequenceCreepShotIndices,X
#_0FD9C8: STA.w $0A6D
#_0FD9CB: INX
#_0FD9CC: PHP
#_0FD9CD: PHX
#_0FD9CE: JSL routine02E6C9

#_0FD9D2: REP #$10
#_0FD9D4: PLX
#_0FD9D5: PLP
#_0FD9D6: BRA .branch0FD9A1

.branch0FD9D8
#_0FD9D8: PHY
#_0FD9D9: PHX
#_0FD9DA: JSL AddSelfAsVectorAndMakeSpace
#_0FD9DE: PLX
#_0FD9DF: PLY
#_0FD9E0: DEY
#_0FD9E1: BNE .branch0FD9D8

#_0FD9E3: JSR routine0FD876
#_0FD9E6: INX
#_0FD9E7: STX.w $0D15
#_0FD9EA: JSL PPUSettings_00C409
#_0FD9EE: JSL Reset_OAMrelatedWRAM
#_0FD9F2: JSR routine0FD876
#_0FD9F5: JSR routine0FDA19
#_0FD9F8: JSR routine0FCC11
#_0FD9FB: JSR WaitForNMI_then_PreventTheNext
#_0FD9FE: JSR routine0FD938

#_0FDA01: REP #$20
#_0FDA03: JSR WaitForNMI_then_PreventTheNext
#_0FDA06: JSR Add_GrayScale_Text_Palette
#_0FDA09: JSR EnableNMI_B0F

#_0FDA0C: SEP #$20
#_0FDA0E: LDA.b #$0F
#_0FDA10: STA.w INIDISP
#_0FDA13: STA.w $0F43
#_0FDA16: JMP .exit

routine0FDA19:
#_0FDA19: PHP
#_0FDA1A: SEP #$20
#_0FDA1C: LDA.b #$00
#_0FDA1E: STA.w OAMADDL
#_0FDA21: STA.w OAMADDH

#_0FDA24: REP #$10
#_0FDA26: LDY.w #$0100

.branch0FDA29
#_0FDA29: LDA.b #$00
#_0FDA2B: STA.w OAMDATA
#_0FDA2E: LDA.b #$F0
#_0FDA30: STA.w OAMDATA
#_0FDA33: DEY
#_0FDA34: BNE .branch0FDA29

#_0FDA36: PLP
#_0FDA37: RTS

IntroSequenceCreepShotIndices:
#_0FDA38: db $20, $00, $04, $00, $50, $70, $28, $03
#_0FDA40: db $52, $50, $08, $FF, $58, $00, $22, $00
#_0FDA48: db $2C, $70, $28, $FF, $90, $00, $07, $00
#_0FDA50: db $4D, $78, $28, $FF, $B0, $00, $10, $07
#_0FDA58: db $4E, $70, $28, $FF, $D0, $00, $32, $00
#_0FDA60: db $AB, $68, $18, $FF, $00, $02

Add_GrayScale_Text_Palette:
#_0FDA66: PHP
#_0FDA67: REP #$10
#_0FDA69: SEP #$20

#_0FDA6B: LDA.b #$00
#_0FDA6D: STA.w CGADD
#_0FDA70: LDY.w #$0008
#_0FDA73: LDX.w #$0000

.next_color
#_0FDA76: LDA.l UNREACH_078000,X
#_0FDA7A: STA.w CGDATA
#_0FDA7D: INX
#_0FDA7E: DEY
#_0FDA7F: BNE .next_color

#_0FDA81: PLP
#_0FDA82: RTS

SomeGuyInTheIntroTypingCode:
#_0FDA83: PHP
#_0FDA84: REP #$30

#_0FDA86: JSR WaitForNMI_then_PreventTheNext
#_0FDA89: JSR Add_GrayScale_Text_Palette

#_0FDA8C: LDX.w #$0000
#_0FDA8F: STX.w $0D15
#_0FDA92: LDA.w #$3000
#_0FDA95: STA.w $0D11

.branch0FDA98
#_0FDA98: SEP #$20
#_0FDA9A: LDA.l IntroResetVector_text,X
#_0FDA9E: CMP.b #$FF
#_0FDAA0: BEQ .done_intro_code_text

#_0FDAA2: JSR AttemptIntroSequenceCreepShots
#_0FDAA5: JSR WaitForNMI_variable_X
#_0FDAA8: JSR AnimateIntroCursorBlink
#_0FDAAB: LDA.l IntroResetVector_text,X
#_0FDAAF: CMP.b #$FF
#_0FDAB1: BEQ .done_intro_code_text

#_0FDAB3: JSR WriteNextCodeCharacter
#_0FDAB6: BRA .branch0FDA98

.done_intro_code_text
#_0FDAB8: REP #$30
#_0FDABA: LDA.w #$0000
#_0FDABD: STA.w $0D15

#_0FDAC0: JSR routine0FE017
#_0FDAC3: JSR routine0FDC9E
#_0FDAC6: JSR routine0FD8D6
#_0FDAC9: JSR routine0FDCD2
#_0FDACC: JSR routine0FD8D6
#_0FDACF: JSR routine0FD8D6
#_0FDAD2: JSR routine0FE00F

#_0FDAD5: PLP
#_0FDAD6: RTS

WriteNextCodeCharacter:
#_0FDAD7: PHP
#_0FDAD8: PHX
#_0FDAD9: REP #$20

#_0FDADB: AND.w #$00FF
#_0FDADE: ASL A
#_0FDADF: ASL A
#_0FDAE0: ASL A
#_0FDAE1: ASL A
#_0FDAE2: TAX
#_0FDAE3: JSR WaitForNMI_variable_X

#_0FDAE6: SEP #$20
#_0FDAE8: LDA.b #$80
#_0FDAEA: STA.w VMAIN

#_0FDAED: LDA.w $0D11
#_0FDAF0: STA.w VMADDL

#_0FDAF3: LDA.w $0D12
#_0FDAF6: STA.w VMADDH
#_0FDAF9: LDY.w #$0008

.nextbyte
#_0FDAFC: LDA.l Font_2BPP+0,X
#_0FDB00: STA.w VMDATAL
#_0FDB03: LDA.l Font_2BPP+1,X
#_0FDB07: STA.w VMDATAH
#_0FDB0A: INX
#_0FDB0B: INX
#_0FDB0C: DEY
#_0FDB0D: BNE .nextbyte

#_0FDB0F: PLX
#_0FDB10: INX

; add 8 to the address
#_0FDB11: REP #$20
#_0FDB13: CLC
#_0FDB14: LDA.w $0D11
#_0FDB17: ADC.w #$0008
#_0FDB1A: STA.w $0D11
#_0FDB1D: PLP
#_0FDB1E: RTS

AnimateIntroCursorBlink:
#_0FDB1F: PHP
#_0FDB20: PHY
#_0FDB21: REP #$20

#_0FDB23: LDA.w $0D11
#_0FDB26: CMP.w #$3000
#_0FDB29: BEQ .exit

#_0FDB2B: LDA.w $0D11
#_0FDB2E: CMP.w #$3008
#_0FDB31: BEQ .exit

#_0FDB33: SEP #$20
#_0FDB35: LDA.b #$80
#_0FDB37: STA.w VMAIN

#_0FDB3A: LDA.w $0D11
#_0FDB3D: STA.w VMADDL

#_0FDB40: LDA.w $0D12
#_0FDB43: STA.w VMADDH

#_0FDB46: LDY.w #$0008

.clearnext
#_0FDB49: LDA.b #$FF
#_0FDB4B: STA.w VMDATAL
#_0FDB4E: LDA.b #$FF
#_0FDB50: STA.w VMDATAH
#_0FDB53: DEY
#_0FDB54: BNE .clearnext

.exit
#_0FDB56: PLY
#_0FDB57: PLP
#_0FDB58: RTS

data0FDB59:
#_0FDB59: dw $0024,$4803,$0200,$0068
#_0FDB61: dw $8802,$0200,$00A8,$E802
#_0FDB69: dw $0200,$0108,$4801,$0201
#_0FDB71: dw $014B,$6803,$0201,$01A8
#_0FDB79: dw $AB02,$0401,$01C8,$CB02
#_0FDB81: dw $0501,$01E8,$EB02,$0301
#_0FDB89: dw $0228,$2B02,$0302,$0268
#_0FDB91: dw $7008,$0802,$0288,$9008
#_0FDB99: dw $0802,$02A8,$B008,$0802
#_0FDBA1: dw $02C8,$D008,$0802,$02D8
#_0FDBA9: dw $E801,$0602,$0328,$4806
#_0FDBB1: dw $0D03,$FFFF

; Spaces here because we're in MODE 5
; Small tiles are 16 wide, so we need groups of 2
IntroResetVector_text:
#_0FDBB5: db " ", " RESET:" ; separated so I can't accidentally remove the double
#_0FDBBD: db "SEI "
#_0FDBC1: db "CLC "
#_0FDBC5: db "XCE "
#_0FDBC9: db "CLD "
#_0FDBCD: db "X16 "
#_0FDBD1: db "M8"
#_0FDBD3: db "LDX #1FFFH"
#_0FDBDD: db "TXS "
#_0FDBE1: db "STZ NMITIME "
#_0FDBED: db "LDA #BLANKING "
#_0FDBFB: db "STA INIDSP"
#_0FDC05: db "BJSR", "ATLUS "
#_0FDC0F: db "'EL ELOHIM ELOHO ELOHIM SEBAOTH'"
#_0FDC2F: db "'ELION EIECH ADIER EIECH ADONAI'"
#_0FDC4F: db "'JAH SADAI TETRAGRAMMATON SADAI'"
#_0FDC6F: db "'AGIOS O THEOS ISCHIROS ATHANATOS'"
#_0FDC91: db "'AGLA AMEN' "
#_0FDC9D: db $FF

routine0FDC9E:
#_0FDC9E: PHP
#_0FDC9F: REP #$30
#_0FDCA1: JSR routine0FD8D6
#_0FDCA4: LDA.w #$37A0
#_0FDCA7: STA.w $0D11
#_0FDCAA: LDX.w #$0000
#_0FDCAD: LDY.w #$0005

.branch0FDCB0
#_0FDCB0: PHY
#_0FDCB1: JSR AnimateIntroCursorBlink
#_0FDCB4: LDA.l data0FDCCD,X
#_0FDCB8: JSR WriteNextCodeCharacter
#_0FDCBB: JSR routine0FD8D6
#_0FDCBE: PLY
#_0FDCBF: DEY
#_0FDCC0: BNE .branch0FDCB0

#_0FDCC2: JSR routine0FD8D6
#_0FDCC5: JSR routine0FDFD4
#_0FDCC8: JSR routine0FDD17
#_0FDCCB: PLP
#_0FDCCC: RTS

data0FDCCD:
#_0FDCCD: db $1D,$12,$13,$18,$9B

routine0FDCD2:
#_0FDCD2: PHP
#_0FDCD3: REP #$30
#_0FDCD5: JSR routine0FD8D6
#_0FDCD8: LDA.w #$37B8
#_0FDCDB: STA.w $0D11
#_0FDCDE: LDX.w #$0000
#_0FDCE1: LDY.w #$0013

.branch0FDCE4
#_0FDCE4: PHY
#_0FDCE5: JSR AnimateIntroCursorBlink
#_0FDCE8: LDA.l data0FDD04,X
#_0FDCEC: JSR WriteNextCodeCharacter
#_0FDCEF: JSR WaitForNMI_variable_X
#_0FDCF2: JSR WaitForNMI_variable_X
#_0FDCF5: PLY
#_0FDCF6: DEY
#_0FDCF7: BNE .branch0FDCE4

#_0FDCF9: JSR routine0FD8D6
#_0FDCFC: JSR routine0FDFF6
#_0FDCFF: JSR routine0FDE8A
#_0FDD02: PLP
#_0FDD03: RTS

data0FDD04:
#_0FDD04: db $0E,$13,$11,$13,$1E,$0B,$16,$00
#_0FDD0C: db $0E,$0F,$20,$13,$16,$00,$1D,$1E
#_0FDD14: db $19,$1C,$23

routine0FDD17:
#_0FDD17: PHP
#_0FDD18: REP #$10
#_0FDD1A: SEP #$20

#_0FDD1C: JSR WaitForNMI_then_PreventTheNext
#_0FDD1F: LDA.b #$40
#_0FDD21: STA.w VMADDL
#_0FDD24: LDA.b #$37
#_0FDD26: STA.w VMADDH
#_0FDD29: LDX.w #$0000
#_0FDD2C: LDY.w #$0010
#_0FDD2F: JSR routine0FDDA4

#_0FDD32: REP #$10
#_0FDD34: SEP #$20
#_0FDD36: LDA.b #$A0
#_0FDD38: STA.w VMADDL
#_0FDD3B: LDA.b #$37
#_0FDD3D: STA.w VMADDH
#_0FDD40: LDY.w #$0018
#_0FDD43: JSR routine0FDDA4

#_0FDD46: REP #$10
#_0FDD48: SEP #$20
#_0FDD4A: JSR routine0FD8D6
#_0FDD4D: JSR routine0FD8D6
#_0FDD50: LDA.b #$40
#_0FDD52: STA.w VMADDL
#_0FDD55: LDA.b #$37
#_0FDD57: STA.w VMADDH
#_0FDD5A: LDY.w #$0010
#_0FDD5D: JSR routine0FDDA4

#_0FDD60: REP #$10
#_0FDD62: SEP #$20
#_0FDD64: LDA.b #$A0
#_0FDD66: STA.w VMADDL
#_0FDD69: LDA.b #$37
#_0FDD6B: STA.w VMADDH
#_0FDD6E: LDY.w #$0010
#_0FDD71: JSR routine0FDDA4

#_0FDD74: REP #$10
#_0FDD76: SEP #$20
#_0FDD78: JSR routine0FD8D6
#_0FDD7B: JSR routine0FD8D6
#_0FDD7E: LDA.b #$40
#_0FDD80: STA.w VMADDL
#_0FDD83: LDA.b #$37
#_0FDD85: STA.w VMADDH
#_0FDD88: LDY.w #$0010
#_0FDD8B: JSR routine0FDDA4

#_0FDD8E: REP #$10
#_0FDD90: SEP #$20
#_0FDD92: LDA.b #$A0
#_0FDD94: STA.w VMADDL
#_0FDD97: LDA.b #$37
#_0FDD99: STA.w VMADDH
#_0FDD9C: LDY.w #$0010
#_0FDD9F: JSR routine0FDDA4
#_0FDDA2: PLP
#_0FDDA3: RTS

;===================================================================================================

routine0FDDA4:
.loop

#_0FDDA4: SEP #$20
#_0FDDA6: LDA.l IntroCharCycle+0,X
#_0FDDAA: STA.w VMDATAL
#_0FDDAD: LDA.l IntroCharCycle+1,X
#_0FDDB1: STA.w VMDATAH
#_0FDDB4: INX
#_0FDDB5: INX
#_0FDDB6: DEY
#_0FDDB7: BNE .loop

#_0FDDB9: RTS

; TODO
IntroCharCycle:
#_0FDDBA: db $FF
#_0FDDBB: db $00,$FF,$00,$FF,$00,$EB,$18,$0B
#_0FDDC3: db $18,$FE,$FF,$A5,$66,$A5,$66,$FF
#_0FDDCB: db $00,$FF,$00,$FF,$00,$FB,$06,$CD
#_0FDDD3: db $3C,$F7,$F8,$BF,$C0,$FF,$FE,$FF
#_0FDDDB: db $7E,$89,$18,$FF,$7E,$DF,$3E,$3A
#_0FDDE3: db $7F,$4D,$FB,$AF,$D9,$EE,$1B,$90
#_0FDDEB: db $D8,$90,$D8,$96,$D8,$B7,$D8,$B7
#_0FDDF3: db $D8,$F7,$98,$77,$98,$F7,$18,$FF
#_0FDDFB: db $18,$FF,$18,$FF,$00,$CE,$00,$C7
#_0FDE03: db $00,$D6,$00,$FF,$00,$FF,$00,$FF
#_0FDE0B: db $00,$FF,$00,$FF,$00,$EF,$30,$EF
#_0FDE13: db $30,$FF,$FD,$EF,$0D,$8B,$1D,$FF
#_0FDE1B: db $00,$FF,$00,$FF,$00,$EF,$30,$EF
#_0FDE23: db $30,$FF,$FE,$6B,$B6,$6B,$B6,$1F
#_0FDE2B: db $39,$37,$7D,$6F,$F5,$AF,$F5,$6F
#_0FDE33: db $B4,$EB,$34,$EF,$30,$EF,$30,$FF
#_0FDE3B: db $FE,$7B,$B6,$7B,$B6,$FF,$FE,$EF
#_0FDE43: db $30,$EF,$30,$E8,$30,$EF,$30,$FF
#_0FDE4B: db $00,$FF,$00,$3F,$00,$FD,$01,$FF
#_0FDE53: db $7F,$BD,$01,$FF,$3F,$FF,$30,$FF
#_0FDE5B: db $00,$FF,$00,$FF,$00,$7F,$80,$FF
#_0FDE63: db $FE,$7F,$80,$FF,$FC,$FF,$0C,$FF
#_0FDE6B: db $3F,$FF,$30,$FF,$3F,$DF,$30,$FF
#_0FDE73: db $FF,$83,$00,$1B,$1C,$6F,$70,$FF
#_0FDE7B: db $FC,$FF,$0C,$FF,$FC,$FB,$0C,$FF
#_0FDE83: db $FF,$FB,$04,$FF,$3C,$FD,$0E

routine0FDE8A:
#_0FDE8A: PHP
#_0FDE8B: REP #$10
#_0FDE8D: SEP #$20

#_0FDE8F: JSR WaitForNMI_then_PreventTheNext
#_0FDE92: LDA.b #$58
#_0FDE94: STA.w VMADDL
#_0FDE97: LDA.b #$37
#_0FDE99: STA.w VMADDH
#_0FDE9C: LDX.w #$0000
#_0FDE9F: LDY.w #$0040
#_0FDEA2: JSR SomeTileMapThingMayb
#_0FDEA5: JSR WaitForNMI_then_PreventTheNext

#_0FDEA8: REP #$10
#_0FDEAA: SEP #$20
#_0FDEAC: LDA.b #$B8
#_0FDEAE: STA.w VMADDL
#_0FDEB1: LDA.b #$37
#_0FDEB3: STA.w VMADDH
#_0FDEB6: LDY.w #$0040
#_0FDEB9: JSR SomeTileMapThingMayb
#_0FDEBC: PLP
#_0FDEBD: RTS

SomeTileMapThingMayb:
#_0FDEBE: SEP #$20
#_0FDEC0: LDA.l data0FDED4,X
#_0FDEC4: STA.w VMDATAL
#_0FDEC7: LDA.l data0FDED5,X
#_0FDECB: STA.w VMDATAH
#_0FDECE: INX
#_0FDECF: INX
#_0FDED0: DEY
#_0FDED1: BNE SomeTileMapThingMayb

#_0FDED3: RTS

; TODO graphics data; maybe 2 byte entry table
data0FDED4:
#_0FDED4: db $FE ; Tile map?

data0FDED5:
#_0FDED5: db $00,$FA,$00,$F9,$00,$FD,$03,$FF
#_0FDEDD: db $03,$FF,$7F,$E5,$0E,$EF,$0C,$7F
#_0FDEE5: db $00,$3F,$00,$BF,$00,$67,$80,$FE
#_0FDEED: db $00,$FF,$FE,$BB,$70,$AF,$70,$FF
#_0FDEF5: db $00,$FF,$00,$FF,$00,$EF,$30,$EF
#_0FDEFD: db $30,$FF,$FD,$EF,$0D,$8B,$1D,$FF
#_0FDF05: db $00,$FF,$00,$FF,$00,$EF,$30,$EF
#_0FDF0D: db $30,$FF,$FE,$6B,$B6,$6B,$B6,$FF
#_0FDF15: db $00,$07,$00,$06,$00,$09,$18,$08
#_0FDF1D: db $18,$7E,$FE,$09,$18,$FF,$7E,$FF
#_0FDF25: db $00,$FF,$00,$FF,$00,$FF,$00,$7F
#_0FDF2D: db $7C,$FE,$00,$01,$00,$FF,$FE,$FB
#_0FDF35: db $00,$E7,$00,$E7,$00,$FF,$01,$FF
#_0FDF3D: db $31,$FF,$31,$7F,$3F,$EF,$31,$BF
#_0FDF45: db $00,$FF,$00,$FF,$00,$7F,$80,$7F
#_0FDF4D: db $80,$7F,$80,$FF,$F8,$7F,$80,$CB
#_0FDF55: db $1C,$DB,$1C,$DC,$3F,$3F,$33,$7E
#_0FDF5D: db $01,$1D,$03,$F6,$0F,$FB,$3C,$AF
#_0FDF65: db $70,$FF,$60,$7B,$E0,$DF,$E0,$DF
#_0FDF6D: db $E0,$27,$F0,$D7,$38,$E8,$18,$1F
#_0FDF75: db $39,$37,$7D,$6F,$F5,$AF,$F5,$6F
#_0FDF7D: db $B4,$EB,$34,$EF,$30,$EF,$30,$FF
#_0FDF85: db $FE,$7B,$B6,$7B,$B6,$FF,$FE,$EF
#_0FDF8D: db $30,$EF,$30,$E8,$30,$EF,$30,$EB
#_0FDF95: db $5A,$FF,$7E,$EF,$5A,$FF,$7E,$EF
#_0FDF9D: db $18,$7F,$FE,$EF,$18,$EF,$19,$F7
#_0FDFA5: db $38,$FF,$30,$BF,$70,$EF,$70,$FF
#_0FDFAD: db $64,$E5,$66,$7F,$FE,$9F,$E2,$B9
#_0FDFB5: db $61,$DF,$61,$7F,$CF,$7F,$81,$FF
#_0FDFBD: db $01,$FF,$01,$FF,$01,$FF,$3F,$7F
#_0FDFC5: db $80,$7F,$80,$FF,$F0,$7F,$80,$7F
#_0FDFCD: db $80,$7F,$80,$7F,$80,$FF,$FC

routine0FDFD4:
#_0FDFD4: PHP
#_0FDFD5: REP #$10
#_0FDFD7: SEP #$20
#_0FDFD9: JSR WaitForNMI_then_PreventTheNext
#_0FDFDC: LDA.b #$A0
#_0FDFDE: STA.w VMADDL
#_0FDFE1: LDA.b #$37
#_0FDFE3: STA.w VMADDH
#_0FDFE6: LDY.w #$0028
#_0FDFE9: LDA.b #$00

.branch0FDFEB
#_0FDFEB: STA.w VMDATAL
#_0FDFEE: STA.w VMDATAH
#_0FDFF1: DEY
#_0FDFF2: BNE .branch0FDFEB

#_0FDFF4: PLP
#_0FDFF5: RTS

;===================================================================================================

routine0FDFF6:
#_0FDFF6: PHP
#_0FDFF7: REP #$10
#_0FDFF9: SEP #$20
#_0FDFFB: JSR WaitForNMI_then_PreventTheNext
#_0FDFFE: LDA.b #$B8
#_0FE000: STA.w VMADDL
#_0FE003: LDA.b #$37
#_0FE005: STA.w VMADDH
#_0FE008: LDY.w #$00A0
#_0FE00B: LDA.b #$00
#_0FE00D: BRA .branch0FDFEB

routine0FE00F:
#_0FE00F: PHP
#_0FE010: REP #$30
#_0FE012: LDY.w #$007A
#_0FE015: BRA .branch0FE01D

routine0FE017:
#_0FE017: PHP
#_0FE018: REP #$30
#_0FE01A: LDY.w #$0062

.branch0FE01D
#_0FE01D: SEP #$20
#_0FE01F: LDA.w $0D15
#_0FE022: STA.w BG2VOFS
#_0FE025: LDA.w $0D16
#_0FE028: STA.w BG2VOFS
#_0FE02B: JSR WaitForNMI_then_PreventTheNext

#_0FE02E: REP #$20
#_0FE030: INC.w $0D15
#_0FE033: DEY
#_0FE034: BNE .branch0FE01D

#_0FE036: REP #$20
#_0FE038: LDA.w $0D15
#_0FE03B: STA.w $0F53
#_0FE03E: PLP
#_0FE03F: RTS

;===================================================================================================

routine0FE040:
#_0FE040: PHP
#_0FE041: REP #$10
#_0FE043: SEP #$20
#_0FE045: LDA.b #$80
#_0FE047: STA.w VMAIN
#_0FE04A: LDA.b #$00
#_0FE04C: STA.w VMADDL
#_0FE04F: LDA.b #$60
#_0FE051: STA.w VMADDH
#_0FE054: LDX.w #$0000

.branch0FE057
#_0FE057: REP #$30
#_0FE059: LDA.l data0FE071,X
#_0FE05D: CMP.w #$FFFF
#_0FE060: BEQ .branch0FE06F

#_0FE062: SEP #$20
#_0FE064: STA.w VMDATAL
#_0FE067: XBA
#_0FE068: STA.w VMDATAH
#_0FE06B: INX
#_0FE06C: INX
#_0FE06D: BRA .branch0FE057

.branch0FE06F
#_0FE06F: PLP
#_0FE070: RTS

; TODO graphics data
data0FE071:
#_0FE071: dw $0C00,$0C00,$0C00,$08D5
#_0FE079: dw $08E0,$08E1,$C8E1,$C8E0
#_0FE081: dw $08D5,$08E0,$08E1,$C8E1
#_0FE089: dw $C8E0,$08D5,$08E0,$08E1
#_0FE091: dw $C8E1,$C8E0,$08D5,$08E0
#_0FE099: dw $08E1,$C8E1,$C8E0,$08D5
#_0FE0A1: dw $08E0,$08E1,$C8E1,$C8E0
#_0FE0A9: dw $08D5,$0C00,$0C00,$0C00
#_0FE0B1: dw $0C00,$0C00,$0C00,$08E1
#_0FE0B9: dw $C8E1,$C8E0,$08D5,$08E0
#_0FE0C1: dw $08E1,$C8E1,$C8E0,$08D5
#_0FE0C9: dw $08E0,$08E1,$C8E1,$C8E0
#_0FE0D1: dw $08D5,$08E0,$08E1,$C8E1
#_0FE0D9: dw $C8E0,$08D5,$08E0,$08E1
#_0FE0E1: dw $C8E1,$C8E0,$08D5,$08E0
#_0FE0E9: dw $08E1,$0C00,$0C00,$0C00
#_0FE0F1: dw $0C00,$0C00,$0C00,$C8E0
#_0FE0F9: dw $08E0,$08E2,$08E3,$48E3
#_0FE101: dw $48E2,$08E2,$08E3,$48E3
#_0FE109: dw $48E2,$08E2,$08E3,$48E3
#_0FE111: dw $48E2,$08E2,$08E3,$48E3
#_0FE119: dw $48E2,$08E2,$08E3,$48E3
#_0FE121: dw $48E2,$08E2,$08E3,$C8E1
#_0FE129: dw $C8E0,$0C00,$0C00,$0C00
#_0FE131: dw $0C00,$0C00,$0C00,$08D5
#_0FE139: dw $C8E1,$08F2,$08F3,$48F3
#_0FE141: dw $48F2,$08F2,$08F3,$48F3
#_0FE149: dw $48F2,$08F2,$08F3,$48F3
#_0FE151: dw $48F2,$08F2,$08F3,$48F3
#_0FE159: dw $48F2,$08F2,$08F3,$48F3
#_0FE161: dw $48F2,$08F2,$08F3,$08E1
#_0FE169: dw $08D5,$0C00,$0C00,$0C00
#_0FE171: dw $0C00,$0C00,$0C00,$08E0
#_0FE179: dw $08E1,$48E3,$48E2,$08E4
#_0FE181: dw $08E5,$48E5,$48E4,$08E4
#_0FE189: dw $08E5,$48E5,$48E4,$08E4
#_0FE191: dw $08E5,$48E5,$48E4,$08E4
#_0FE199: dw $08E5,$48E5,$48E4,$08E4
#_0FE1A1: dw $08E5,$48E3,$48E2,$C8E0
#_0FE1A9: dw $08E0,$0C00,$0C00,$0C00
#_0FE1B1: dw $0C00,$0C00,$0C00,$C8E1
#_0FE1B9: dw $C8E0,$48F3,$48F2,$08F4
#_0FE1C1: dw $08F5,$48F5,$48F4,$08F4
#_0FE1C9: dw $08F5,$48F5,$48F4,$08F4
#_0FE1D1: dw $08F5,$48F5,$48F4,$08F4
#_0FE1D9: dw $08F5,$48F5,$48F4,$08F4
#_0FE1E1: dw $08F5,$48F3,$48F2,$08D5
#_0FE1E9: dw $C8E1,$0C00,$0C00,$0C00
#_0FE1F1: dw $0C00,$0C00,$0C00,$08E1
#_0FE1F9: dw $08D5,$08E2,$08E3,$08D6
#_0FE201: dw $08D6,$08E6,$08E7,$08E8
#_0FE209: dw $48E8,$48E7,$08E7,$08E8
#_0FE211: dw $48E8,$48E7,$08E7,$08E8
#_0FE219: dw $48E8,$48E7,$08E6,$08D6
#_0FE221: dw $08D6,$08E2,$08E3,$08E0
#_0FE229: dw $08E1,$0C00,$0C00,$0C00
#_0FE231: dw $0C00,$0C00,$0C00,$C8E0
#_0FE239: dw $08E0,$08F2,$08F3,$48E5
#_0FE241: dw $48E4,$08F6,$08F7,$08F8
#_0FE249: dw $48F8,$48F7,$08F7,$08F8
#_0FE251: dw $48F8,$48F7,$08F7,$08F8
#_0FE259: dw $48F8,$48F7,$08F6,$48E5
#_0FE261: dw $48E4,$08F2,$08F3,$C8E1
#_0FE269: dw $C8E0,$0C00,$0C00,$0C00
#_0FE271: dw $0C00,$0C00,$0C00,$08D5
#_0FE279: dw $C8E1,$48E3,$48E2,$48F5
#_0FE281: dw $48F4,$08D7,$48E8,$48E7
#_0FE289: dw $08E6,$08D7,$48E6,$08D7
#_0FE291: dw $08D7,$48E6,$08D7,$08E6
#_0FE299: dw $08E7,$08E8,$08D7,$48F5
#_0FE2A1: dw $48F4,$48E3,$48E2,$08E1
#_0FE2A9: dw $08D5,$0C00,$0C00,$0C00
#_0FE2B1: dw $0C00,$0C00,$0C00,$08E0
#_0FE2B9: dw $08E1,$48F3,$48F2,$08D6
#_0FE2C1: dw $08D6,$08D7,$48F8,$48F7
#_0FE2C9: dw $08F6,$08D7,$48F6,$08D7
#_0FE2D1: dw $08D7,$48F6,$08D7,$08F6
#_0FE2D9: dw $08F7,$08F8,$08D7,$08D6
#_0FE2E1: dw $08D6,$48F3,$48F2,$C8E0
#_0FE2E9: dw $08E0,$0C00,$0C00,$0C00
#_0FE2F1: dw $0C00,$0C00,$0C00,$C8E1
#_0FE2F9: dw $C8E0,$08E2,$08E3,$08E4
#_0FE301: dw $08E5,$48E6,$08E7,$08E8
#_0FE309: dw $08D6,$08D6,$08D6,$08D8
#_0FE311: dw $48D8,$08D6,$08D6,$08D6
#_0FE319: dw $48E8,$48E7,$48E6,$08E4
#_0FE321: dw $08E5,$08E2,$08E3,$08D5
#_0FE329: dw $C8E1,$0C00,$0C00,$0C00
#_0FE331: dw $0C00,$0C00,$0C00,$08E1
#_0FE339: dw $08D5,$08F2,$08F3,$08F4
#_0FE341: dw $08F5,$48F6,$08F7,$08F8
#_0FE349: dw $08D6,$08D9,$08DA,$08DB
#_0FE351: dw $08DC,$48DA,$48D9,$48D6
#_0FE359: dw $48F8,$48F7,$48F6,$08F4
#_0FE361: dw $08F5,$08F2,$08F3,$08E0
#_0FE369: dw $08E1,$0C00,$0C00,$0C00
#_0FE371: dw $0C00,$0C00,$0C00,$C8E0
#_0FE379: dw $08E0,$48E3,$48E2,$08D6
#_0FE381: dw $08D6,$08D7,$48E8,$48E7
#_0FE389: dw $08D6,$08E9,$08EA,$08EB
#_0FE391: dw $48EB,$48EA,$48E9,$48D6
#_0FE399: dw $08E7,$08E8,$08D7,$08D6
#_0FE3A1: dw $08D6,$48E3,$48E2,$C8E1
#_0FE3A9: dw $C8E0,$0C00,$0C00,$0C00
#_0FE3B1: dw $0C00,$0C00,$0C00,$08D5
#_0FE3B9: dw $C8E1,$48F3,$48F2,$48E5
#_0FE3C1: dw $48E4,$08E6,$48F8,$48F7
#_0FE3C9: dw $08F9,$08FA,$08FB,$08FC
#_0FE3D1: dw $48FC,$48FB,$48FA,$48F9
#_0FE3D9: dw $08F7,$08F8,$08E6,$48E5
#_0FE3E1: dw $48E4,$48F3,$48F2,$08E1
#_0FE3E9: dw $08D5,$0C00,$0C00,$0C00
#_0FE3F1: dw $0C00,$0C00,$0C00,$08E0
#_0FE3F9: dw $08E1,$08E2,$08E3,$48F5
#_0FE401: dw $48F4,$08F6,$08E7,$08E8
#_0FE409: dw $88F9,$08DD,$08DE,$08DF
#_0FE411: dw $48DF,$48DE,$48DD,$C8F9
#_0FE419: dw $48E8,$48E7,$08F6,$48F5
#_0FE421: dw $48F4,$08E2,$08E3,$C8E0
#_0FE429: dw $08E0,$0C00,$0C00,$0C00
#_0FE431: dw $0C00,$0C00,$0C00,$C8E1
#_0FE439: dw $C8E0,$08F2,$08F3,$08D6
#_0FE441: dw $08D6,$08D7,$08F7,$08F8
#_0FE449: dw $08D6,$08ED,$08EE,$08EF
#_0FE451: dw $48EF,$48EE,$48ED,$48D6
#_0FE459: dw $48F8,$48F7,$08D7,$08D6
#_0FE461: dw $08D6,$08F2,$08F3,$08D5
#_0FE469: dw $C8E1,$0C00,$0C00,$0C00
#_0FE471: dw $0C00,$0C00,$0C00,$08E1
#_0FE479: dw $08D5,$48E3,$48E2,$08E4
#_0FE481: dw $08E5,$48E6,$48E8,$48E7
#_0FE489: dw $08D6,$08FD,$08FE,$48DC
#_0FE491: dw $48DB,$48FE,$48FD,$48D6
#_0FE499: dw $08E7,$08E8,$48E6,$08E4
#_0FE4A1: dw $08E5,$48E3,$48E2,$08E0
#_0FE4A9: dw $08E1,$0C00,$0C00,$0C00
#_0FE4B1: dw $0C00,$0C00,$0C00,$C8E0
#_0FE4B9: dw $08E0,$48F3,$48F2,$08F4
#_0FE4C1: dw $08F5,$48F6,$48F8,$48F7
#_0FE4C9: dw $08D6,$08D6,$08D6,$08EC
#_0FE4D1: dw $48EC,$08D6,$08D6,$08D6
#_0FE4D9: dw $08F7,$08F8,$48F6,$08F4
#_0FE4E1: dw $08F5,$48F3,$48F2,$C8E1
#_0FE4E9: dw $C8E0,$0C00,$0C00,$0C00
#_0FE4F1: dw $0C00,$0C00,$0C00,$08D5
#_0FE4F9: dw $C8E1,$08E2,$08E3,$08D6
#_0FE501: dw $08D6,$08D7,$08E7,$08E8
#_0FE509: dw $48E6,$08D7,$08E6,$08D7
#_0FE511: dw $08D7,$08E6,$08D7,$48E6
#_0FE519: dw $48E8,$48E7,$08D7,$08D6
#_0FE521: dw $08D6,$08E2,$08E3,$08E1
#_0FE529: dw $08D5,$0C00,$0C00,$0C00
#_0FE531: dw $0C00,$0C00,$0C00,$08E0
#_0FE539: dw $08E1,$08F2,$08F3,$48E5
#_0FE541: dw $48E4,$08D7,$08F7,$08F8
#_0FE549: dw $48F6,$08D7,$08F6,$08D7
#_0FE551: dw $08D7,$08F6,$08D7,$48F6
#_0FE559: dw $48F8,$48F7,$08D7,$48E5
#_0FE561: dw $48E4,$08F2,$08F3,$C8E0
#_0FE569: dw $08E0,$0C00,$0C00,$0C00
#_0FE571: dw $0C00,$0C00,$0C00,$C8E1
#_0FE579: dw $C8E0,$48E3,$48E2,$48F5
#_0FE581: dw $48F4,$08E6,$48E8,$48E7
#_0FE589: dw $08E7,$08E8,$48E8,$48E7
#_0FE591: dw $08E7,$08E8,$48E8,$48E7
#_0FE599: dw $08E7,$08E8,$08E6,$48F5
#_0FE5A1: dw $48F4,$48E3,$48E2,$08D5
#_0FE5A9: dw $C8E1,$0C00,$0C00,$0C00
#_0FE5B1: dw $0C00,$0C00,$0C00,$08E1
#_0FE5B9: dw $08D5,$48F3,$48F2,$08D6
#_0FE5C1: dw $08D6,$08F6,$48F8,$48F7
#_0FE5C9: dw $08F7,$08F8,$48F8,$48F7
#_0FE5D1: dw $08F7,$08F8,$48F8,$48F7
#_0FE5D9: dw $08F7,$08F8,$08F6,$08D6
#_0FE5E1: dw $08D6,$48F3,$48F2,$08E0
#_0FE5E9: dw $08E1,$0C00,$0C00,$0C00
#_0FE5F1: dw $0C00,$0C00,$0C00,$C8E0
#_0FE5F9: dw $08E0,$08E2,$08E3,$08E4
#_0FE601: dw $08E5,$48E5,$48E4,$08E4
#_0FE609: dw $08E5,$48E5,$48E4,$08E4
#_0FE611: dw $08E5,$48E5,$48E4,$08E4
#_0FE619: dw $08E5,$48E5,$48E4,$08E4
#_0FE621: dw $08E5,$08E2,$08E3,$C8E1
#_0FE629: dw $C8E0,$0C00,$0C00,$0C00
#_0FE631: dw $0C00,$0C00,$0C00,$08D5
#_0FE639: dw $C8E1,$08F2,$08F3,$08F4
#_0FE641: dw $08F5,$48F5,$48F4,$08F4
#_0FE649: dw $08F5,$48F5,$48F4,$08F4
#_0FE651: dw $08F5,$48F5,$48F4,$08F4
#_0FE659: dw $08F5,$48F5,$48F4,$08F4
#_0FE661: dw $08F5,$08F2,$08F3,$08E1
#_0FE669: dw $08D5,$0C00,$0C00,$0C00
#_0FE671: dw $0C00,$0C00,$0C00,$08E0
#_0FE679: dw $08E1,$48E3,$48E2,$08E2
#_0FE681: dw $08E3,$48E3,$48E2,$08E2
#_0FE689: dw $08E3,$48E3,$48E2,$08E2
#_0FE691: dw $08E3,$48E3,$48E2,$08E2
#_0FE699: dw $08E3,$48E3,$48E2,$08E2
#_0FE6A1: dw $08E3,$48E3,$48E2,$C8E0
#_0FE6A9: dw $08E0,$0C00,$0C00,$0C00
#_0FE6B1: dw $0C00,$0C00,$0C00,$C8E1
#_0FE6B9: dw $C8E0,$48F3,$48F2,$08F2
#_0FE6C1: dw $08F3,$48F3,$48F2,$08F2
#_0FE6C9: dw $08F3,$48F3,$48F2,$08F2
#_0FE6D1: dw $08F3,$48F3,$48F2,$08F2
#_0FE6D9: dw $08F3,$48F3,$48F2,$08F2
#_0FE6E1: dw $08F3,$48F3,$48F2,$08D5
#_0FE6E9: dw $C8E1,$0C00,$0C00,$0C00
#_0FE6F1: dw $0C00,$0C00,$0C00,$08E1
#_0FE6F9: dw $08D5,$08D5,$08D5,$08E0
#_0FE701: dw $08E1,$C8E1,$C8E0,$08D5
#_0FE709: dw $08E0,$08E1,$C8E1,$C8E0
#_0FE711: dw $08D5,$08E0,$08E1,$C8E1
#_0FE719: dw $C8E0,$08D5,$08E0,$08E1
#_0FE721: dw $C8E1,$C8E0,$08D5,$08E0
#_0FE729: dw $08E1,$0C00,$0C00,$0C00
#_0FE731: dw $0C00,$0C00,$0C00,$C8E0
#_0FE739: dw $08D5,$08E0,$08E1,$C8E1
#_0FE741: dw $C8E0,$08D5,$08E0,$08E1
#_0FE749: dw $C8E1,$C8E0,$08D5,$08E0
#_0FE751: dw $08E1,$C8E1,$C8E0,$08D5
#_0FE759: dw $08E0,$08E1,$C8E1,$C8E0
#_0FE761: dw $08D5,$08E0,$08E1,$C8E1
#_0FE769: dw $C8E0,$0C00,$0C00,$0C00
#_0FE771: dw $FFFF

routine0FE773:
#_0FE773: PHP
#_0FE774: PHY
#_0FE775: PHX

#_0FE776: REP #$10
#_0FE778: SEP #$20
#_0FE77A: BRA .branch0FE79C

routine0FE77C:
#_0FE77C: PHP
#_0FE77D: PHY
#_0FE77E: PHX

#_0FE77F: REP #$30
#_0FE781: LDA.w $0F2B
#_0FE784: AND.w #$2F30
#_0FE787: BEQ .EXIT_0FE7A2

#_0FE789: SEP #$20
#_0FE78B: LDA.b #$01 ; SFX 01
#_0FE78D: JSL Write_to_APU_transferrable

#_0FE791: REP #$20
#_0FE793: LDA.w $0CF3
#_0FE796: EOR.w #$0018
#_0FE799: STA.w $0CF3

.branch0FE79C
#_0FE79C: LDX.w $0CF3
#_0FE79F: JSR routine0FE7A6

.EXIT_0FE7A2
#_0FE7A2: PLX
#_0FE7A3: PLY
#_0FE7A4: PLP
#_0FE7A5: RTS

;===================================================================================================

routine0FE7A6:
#_0FE7A6: PHP
#_0FE7A7: SEP #$20
#_0FE7A9: REP #$10
#_0FE7AB: PHX
#_0FE7AC: LDX.w #$0000
#_0FE7AF: STX.w $0D19
#_0FE7B2: PLX
#_0FE7B3: LDY.w #$0018

.branch0FE7B6
#_0FE7B6: LDA.l data0FE7CD,X
#_0FE7BA: PHX
#_0FE7BB: LDX.w $0D19
#_0FE7BE: STA.l $7E2000,X
#_0FE7C2: INX
#_0FE7C3: STX.w $0D19
#_0FE7C6: PLX
#_0FE7C7: INX
#_0FE7C8: DEY
#_0FE7C9: BNE .branch0FE7B6

#_0FE7CB: PLP
#_0FE7CC: RTS

data0FE7CD:
#_0FE7CD: db $80,$90,$00,$00,$90,$90,$02,$00
#_0FE7D5: db $A0,$90,$02,$00,$B0,$90,$02,$00
#_0FE7DD: db $C0,$90,$02,$00,$D0,$90,$00,$70
#_0FE7E5: db $38,$90,$00,$00,$48,$90,$02,$00
#_0FE7ED: db $58,$90,$02,$00,$60,$90,$02,$00
#_0FE7F5: db $70,$90,$00,$70,$00,$E0,$00,$E0

routine0FE7FD:
#_0FE7FD: PHP
#_0FE7FE: PHA
#_0FE7FF: CLC

#_0FE800: REP #$30
#_0FE802: LDA.w #$0001
#_0FE805: STA.w $0D19
#_0FE808: JSL PPUSettings_00C409
#_0FE80C: JSL Reset_OAMrelatedWRAM
#_0FE810: LDA.w #$00FF
#_0FE813: STA.w $0F7F
#_0FE816: PLA
#_0FE817: CMP.w #$0001
#_0FE81A: BEQ .branch0FE835

#_0FE81C: CMP.w #$0002
#_0FE81F: BEQ .branch0FE849

#_0FE821: REP #$10
#_0FE823: SEP #$20
#_0FE825: JSR DisableNMI_B0F
#_0FE828: JSR routine0FE9F8
#_0FE82B: JSR routine0FEA48

#_0FE82E: REP #$20
#_0FE830: JSR routine0FE880
#_0FE833: BRA .branch0FE85B

.branch0FE835
#_0FE835: REP #$10
#_0FE837: SEP #$20
#_0FE839: JSR DisableNMI_B0F
#_0FE83C: JSR routine0FE9F8
#_0FE83F: JSR routine0FEA48

#_0FE842: REP #$20
#_0FE844: JSR routine0FE8DC
#_0FE847: BRA .branch0FE85B

.branch0FE849
#_0FE849: REP #$10
#_0FE84B: SEP #$20
#_0FE84D: JSR DisableNMI_B0F
#_0FE850: JSR routine0FE9F8
#_0FE853: JSR routine0FEA48

#_0FE856: REP #$20
#_0FE858: JSR routine0FE968

.branch0FE85B
#_0FE85B: JSL PPUSettings_00C409
#_0FE85F: JSL Reset_OAMrelatedWRAM

#_0FE863: SEP #$20
#_0FE865: LDA.b #$5F ; SONG 5F
#_0FE867: JSL Write_to_APU_transferrable

#_0FE86B: REP #$20
#_0FE86D: LDA.w #$0000
#_0FE870: STA.w $0CF7
#_0FE873: JSR routine0FF5B0
#_0FE876: JSR routine0FF9A0

.branch0FE879
#_0FE879: JSR WaitForNMI_then_PreventTheNext
#_0FE87C: BRA .branch0FE879

#_0FE87E: PLP
#_0FE87F: RTL

;===================================================================================================

routine0FE880:
#_0FE880: PHP
#_0FE881: REP #$30
#_0FE883: SEP #$20
#_0FE885: LDA.b #$56 ; SONG 56
#_0FE887: JSL Write_to_APU_transferrable
#_0FE88B: JSR routine0FE9BC

#_0FE88E: REP #$20
#_0FE890: LDA.w #$0020
#_0FE893: STA.w $0F4F

#_0FE896: SEP #$20
#_0FE898: STA.w BG1VOFS
#_0FE89B: XBA
#_0FE89C: STA.w BG1VOFS

#_0FE89F: REP #$20
#_0FE8A1: LDA.w #$FFC0
#_0FE8A4: STA.w $0F53

#_0FE8A7: SEP #$20
#_0FE8A9: STA.w BG2VOFS
#_0FE8AC: XBA
#_0FE8AD: STA.w BG2VOFS
#_0FE8B0: JSR EnableNMI_B0F
#_0FE8B3: JSR routine0FD1D3

#_0FE8B6: REP #$20
#_0FE8B8: LDA.w #$0000
#_0FE8BB: STA.w $0CF7
#_0FE8BE: LDA.w #$0000
#_0FE8C1: STA.w $0D0F
#_0FE8C4: JSR routine0FEBAD
#_0FE8C7: JSR routine0FD1A7

#_0FE8CA: REP #$30
#_0FE8CC: JSR DisableNMI_B0F
#_0FE8CF: JSL PPUSettings_00C409
#_0FE8D3: JSL Reset_OAMrelatedWRAM
#_0FE8D7: JSR routine0FF01A
#_0FE8DA: PLP
#_0FE8DB: RTS

;===================================================================================================

routine0FE8DC:
#_0FE8DC: PHP
#_0FE8DD: REP #$30
#_0FE8DF: SEP #$20
#_0FE8E1: LDA.b #$46 ; SONG 46
#_0FE8E3: JSL Write_to_APU_transferrable

#_0FE8E7: REP #$20
#_0FE8E9: LDA.w #$003E
#_0FE8EC: STA.w $0CF3
#_0FE8EF: JSR routine0FEA77
#_0FE8F2: LDX.w #$0000
#_0FE8F5: LDA.w #$0008
#_0FE8F8: STA.w $0CF3
#_0FE8FB: LDA.w #$2800
#_0FE8FE: JSR routine0FEB3B
#_0FE901: LDX.w #$0800
#_0FE904: LDA.w #$000C
#_0FE907: STA.w $0CF3
#_0FE90A: LDA.w #$3000
#_0FE90D: JSR routine0FEB3B
#_0FE910: LDX.w #$0020
#_0FE913: LDA.w #$0020
#_0FE916: JSR routine0FEB92
#_0FE919: LDX.w #$0020
#_0FE91C: LDA.w #$0030
#_0FE91F: JSR routine0FEB92

#_0FE922: REP #$20
#_0FE924: LDA.w #$0020
#_0FE927: STA.w $0F4F

#_0FE92A: SEP #$20
#_0FE92C: STA.w BG1VOFS
#_0FE92F: XBA
#_0FE930: STA.w BG1VOFS

#_0FE933: REP #$20
#_0FE935: LDA.w #$00E0
#_0FE938: STA.w $0F53

#_0FE93B: SEP #$20
#_0FE93D: STA.w BG2VOFS
#_0FE940: XBA
#_0FE941: STA.w BG2VOFS
#_0FE944: JSR EnableNMI_B0F
#_0FE947: JSR routine0FD1D3

#_0FE94A: REP #$20
#_0FE94C: LDA.w #$0000
#_0FE94F: STA.w $0CF7
#_0FE952: LDA.w #$0400
#_0FE955: STA.w $0D0F
#_0FE958: JSR routine0FEBAD

#_0FE95B: SEP #$20
#_0FE95D: LDA.b #$FD ; SONG FD COMMAND
#_0FE95F: JSL Write_to_APU_transferrable
#_0FE963: JSR routine0FD1A7
#_0FE966: PLP
#_0FE967: RTS

;===================================================================================================

routine0FE968:
#_0FE968: PHP
#_0FE969: REP #$30
#_0FE96B: SEP #$20
#_0FE96D: LDA.b #$58 ; SONG 58
#_0FE96F: JSL Write_to_APU_transferrable
#_0FE973: JSR routine0FE9BC

#_0FE976: REP #$20
#_0FE978: LDA.w #$0020
#_0FE97B: STA.w $0F4F

#_0FE97E: SEP #$20
#_0FE980: STA.w BG1VOFS
#_0FE983: XBA
#_0FE984: STA.w BG1VOFS

#_0FE987: REP #$20
#_0FE989: LDA.w #$FFC0
#_0FE98C: STA.w $0F53

#_0FE98F: SEP #$20
#_0FE991: STA.w BG2VOFS
#_0FE994: XBA
#_0FE995: STA.w BG2VOFS
#_0FE998: JSR EnableNMI_B0F
#_0FE99B: JSR routine0FD1D3

#_0FE99E: REP #$20
#_0FE9A0: LDA.w #$0000
#_0FE9A3: STA.w $0CF7
#_0FE9A6: LDA.w #$0200
#_0FE9A9: STA.w $0D0F
#_0FE9AC: JSR routine0FEBAD

#_0FE9AF: SEP #$20
#_0FE9B1: LDA.b #$FD ; SONG FD COMMAND
#_0FE9B3: JSL Write_to_APU_transferrable
#_0FE9B7: JSR routine0FD1A7
#_0FE9BA: PLP
#_0FE9BB: RTS

;===================================================================================================

routine0FE9BC:
#_0FE9BC: REP #$30
#_0FE9BE: LDA.w #$0000
#_0FE9C1: STA.w $0CF3
#_0FE9C4: JSR routine0FEA77
#_0FE9C7: LDX.w #$0000
#_0FE9CA: LDA.w #$0008
#_0FE9CD: STA.w $0CF3
#_0FE9D0: LDA.w #$2800
#_0FE9D3: JSR routine0FEB3B
#_0FE9D6: LDX.w #$0400
#_0FE9D9: LDA.w #$000C
#_0FE9DC: STA.w $0CF3
#_0FE9DF: LDA.w #$3000
#_0FE9E2: JSR routine0FEB3B
#_0FE9E5: LDX.w #$0000
#_0FE9E8: LDA.w #$0020
#_0FE9EB: JSR routine0FEB92
#_0FE9EE: LDX.w #$0000
#_0FE9F1: LDA.w #$0030
#_0FE9F4: JSR routine0FEB92
#_0FE9F7: RTS

;===================================================================================================

routine0FE9F8:
#_0FE9F8: PHP
#_0FE9F9: REP #$10
#_0FE9FB: SEP #$20
#_0FE9FD: LDA.b #$09
#_0FE9FF: STA.w BGMODE
#_0FEA02: STA.w $0F45
#_0FEA05: LDA.b #$44
#_0FEA07: STA.w BG12NBA
#_0FEA0A: STA.w $0F4B
#_0FEA0D: LDA.b #$22
#_0FEA0F: STA.w BG34NBA
#_0FEA12: STA.w $0F4C
#_0FEA15: LDA.b #$2A
#_0FEA17: STA.w BG1SC
#_0FEA1A: LDA.b #$32
#_0FEA1C: STA.w BG2SC
#_0FEA1F: LDA.b #$38
#_0FEA21: STA.w BG3SC
#_0FEA24: LDA.b #$00
#_0FEA26: STA.w BG1HOFS
#_0FEA29: STA.w BG1VOFS
#_0FEA2C: STA.w BG2HOFS
#_0FEA2F: STA.w BG2VOFS
#_0FEA32: STA.w BG3HOFS
#_0FEA35: STA.w BG3VOFS
#_0FEA38: STA.w BG4HOFS
#_0FEA3B: STA.w BG4VOFS
#_0FEA3E: LDA.b #$00
#_0FEA40: STA.w MDMAEN
#_0FEA43: STA.w HDMAEN
#_0FEA46: PLP
#_0FEA47: RTS

;===================================================================================================

routine0FEA48:
#_0FEA48: PHP
#_0FEA49: REP #$10
#_0FEA4B: SEP #$20
#_0FEA4D: LDA.b #$80
#_0FEA4F: STA.w VMAIN
#_0FEA52: LDA.b #$00
#_0FEA54: STA.w VMADDL
#_0FEA57: LDA.b #$40
#_0FEA59: STA.w VMADDH
#_0FEA5C: LDX.w #$0000
#_0FEA5F: LDY.w #$1000

.branch0FEA62
#_0FEA62: LDA.l GFX_21C000,X
#_0FEA66: STA.w VMDATAL
#_0FEA69: INX
#_0FEA6A: LDA.l GFX_21C000,X
#_0FEA6E: STA.w VMDATAH
#_0FEA71: INX
#_0FEA72: DEY
#_0FEA73: BNE .branch0FEA62

#_0FEA75: JSR routine0FEA7A
#_0FEA78: PLP
#_0FEA79: RTS

;===================================================================================================

routine0FEA7A:
#_0FEA7A: PHP
#_0FEA7B: SEP #$20
#_0FEA7D: LDA.b #$80
#_0FEA7F: STA.w VMAIN
#_0FEA82: LDA.b #$00
#_0FEA84: STA.w VMADDL
#_0FEA87: LDA.b #$20
#_0FEA89: STA.w VMADDH
#_0FEA8C: LDX.w #$0000
#_0FEA8F: LDY.w #$0800

.branch0FEA92
#_0FEA92: LDA.l Font_2BPP,X
#_0FEA96: STA.w VMDATAL
#_0FEA99: INX
#_0FEA9A: LDA.l Font_2BPP,X
#_0FEA9E: STA.w VMDATAH
#_0FEAA1: INX
#_0FEAA2: DEY
#_0FEAA3: BNE .branch0FEA92

#_0FEAA5: PLP
#_0FEAA6: RTS

;===================================================================================================

routine0FEA77:
#_0FEAA7: PHP
#_0FEAA8: REP #$10
#_0FEAAA: SEP #$20
#_0FEAAC: CLC
#_0FEAAD: ADC.b #$8D
#_0FEAAF: STA.w $0CF3
#_0FEAB2: LDA.b #$80
#_0FEAB4: STA.w VMAIN
#_0FEAB7: LDA.b #$00
#_0FEAB9: STA.w VMADDL
#_0FEABC: LDA.b #$30
#_0FEABE: STA.w VMADDH
#_0FEAC1: LDY.w #$0800

.branch0FEAC4
#_0FEAC4: LDA.w $0CF3
#_0FEAC7: STA.w VMDATAL
#_0FEACA: LDA.b #$0C
#_0FEACC: STA.w VMDATAH
#_0FEACF: DEY
#_0FEAD0: BNE .branch0FEAC4

#_0FEAD2: LDA.b #$80
#_0FEAD4: STA.w VMAIN
#_0FEAD7: LDA.b #$00
#_0FEAD9: STA.w VMADDL
#_0FEADC: LDA.b #$28
#_0FEADE: STA.w VMADDH
#_0FEAE1: LDY.w #$0800

.branch0FEAE4
#_0FEAE4: LDA.b #$00
#_0FEAE6: STA.w VMDATAL
#_0FEAE9: LDA.b #$00
#_0FEAEB: STA.w VMDATAH
#_0FEAEE: DEY
#_0FEAEF: BNE .branch0FEAE4

#_0FEAF1: LDA.b #$80
#_0FEAF3: STA.w VMAIN
#_0FEAF6: LDA.b #$00
#_0FEAF8: STA.w VMADDL
#_0FEAFB: LDA.b #$38
#_0FEAFD: STA.w VMADDH
#_0FEB00: LDY.w #$0240

.branch0FEB03
#_0FEB03: LDA.b #$00
#_0FEB05: STA.w VMDATAL
#_0FEB08: LDA.b #$20
#_0FEB0A: STA.w VMDATAH
#_0FEB0D: DEY
#_0FEB0E: BNE .branch0FEB03

#_0FEB10: LDY.w #$01C0

.branch0FEB13
#_0FEB13: LDA.b #$CF
#_0FEB15: STA.w VMDATAL
#_0FEB18: LDA.b #$20
#_0FEB1A: STA.w VMDATAH
#_0FEB1D: DEY
#_0FEB1E: BNE .branch0FEB13

#_0FEB20: PLP
#_0FEB21: RTS

;===================================================================================================

routine0FEB22:
#_0FEB22: PHP
#_0FEB23: SEP #$20
#_0FEB25: REP #$10
#_0FEB27: LDA.b #$80
#_0FEB29: STA.w VMAIN
#_0FEB2C: LDA.b #$44
#_0FEB2E: STA.w VMADDL
#_0FEB31: LDA.b #$3A
#_0FEB33: STA.w VMADDH
#_0FEB36: LDY.w #$0100
#_0FEB39: BRA .branch0FEB13

routine0FEB3B:
#_0FEB3B: PHP
#_0FEB3C: REP #$30
#_0FEB3E: PHA

#_0FEB3F: SEP #$20
#_0FEB41: STA.w VMADDL
#_0FEB44: XBA
#_0FEB45: STA.w VMADDH
#_0FEB48: LDA.b #$00
#_0FEB4A: STA.w VMAIN
#_0FEB4D: PHX
#_0FEB4E: LDY.w #$0380

.branch0FEB51
#_0FEB51: LDA.l UNREACH_1AE000,X
#_0FEB55: STA.w VMDATAL
#_0FEB58: INX
#_0FEB59: DEY
#_0FEB5A: BNE .branch0FEB51

#_0FEB5C: PLX

#_0FEB5D: REP #$20
#_0FEB5F: PLA

#_0FEB60: SEP #$20
#_0FEB62: STA.w VMADDL
#_0FEB65: XBA
#_0FEB66: STA.w VMADDH
#_0FEB69: LDA.b #$80
#_0FEB6B: STA.w VMAIN
#_0FEB6E: LDY.w #$0070

.branch0FEB71
#_0FEB71: PHY
#_0FEB72: LDA.l UNREACH_1AE380,X
#_0FEB76: LDY.w #$0008

.branch0FEB79
#_0FEB79: ASL A
#_0FEB7A: PHA
#_0FEB7B: LDA.b #$00
#_0FEB7D: ROR A
#_0FEB7E: LSR A
#_0FEB7F: AND.b #$40
#_0FEB81: ORA.w $0CF3
#_0FEB84: STA.w VMDATAH
#_0FEB87: PLA
#_0FEB88: DEY
#_0FEB89: BNE .branch0FEB79

#_0FEB8B: PLY
#_0FEB8C: INX
#_0FEB8D: DEY
#_0FEB8E: BNE .branch0FEB71

#_0FEB90: PLP
#_0FEB91: RTS

;===================================================================================================

routine0FEB92:
#_0FEB92: PHP
#_0FEB93: REP #$10
#_0FEB95: SEP #$20
#_0FEB97: STA.w CGADD
#_0FEB9A: LDY.w #$0020

.branch0FEB9D
#_0FEB9D: LDA.l data0FEE9A,X
#_0FEBA1: STA.w CGDATA
#_0FEBA4: INX
#_0FEBA5: DEY
#_0FEBA6: BNE .branch0FEB9D

#_0FEBA8: JSR Add_GrayScale_Text_Palette
#_0FEBAB: PLP
#_0FEBAC: RTS

;===================================================================================================

routine0FEBAD:
#_0FEBAD: PHP
#_0FEBAE: REP #$30
#_0FEBB0: LDA.w #$1000
#_0FEBB3: STA.w $0D11
#_0FEBB6: STA.w $0D13

.branch0FEBB9
#_0FEBB9: REP #$10
#_0FEBBB: SEP #$20
#_0FEBBD: LDX.w $0D0F
#_0FEBC0: LDA.l UNREACH_1AF002,X
#_0FEBC4: CMP.b #$FC
#_0FEBC6: BEQ .branch0FEBFA

#_0FEBC8: CMP.b #$F9
#_0FEBCA: BEQ .branch0FEC0E

#_0FEBCC: CMP.b #$FA

#_0FEBCE: BEQ .branch0FEBFA

#_0FEBD0: CMP.b #$FF
#_0FEBD2: BEQ .branch0FEC20

#_0FEBD4: CMP.b #$ED
#_0FEBD6: BEQ .branch0FEC3B

#_0FEBD8: CMP.b #$EE
#_0FEBDA: BEQ .branch0FEC3B

#_0FEBDC: CMP.b #$EF
#_0FEBDE: BEQ .branch0FEC3B

#_0FEBE0: CMP.b #$F0
#_0FEBE2: BEQ .branch0FEC3B

#_0FEBE4: CMP.b #$CF
#_0FEBE6: BEQ .branch0FEBF2

#_0FEBE8: CMP.b #$D6
#_0FEBEA: BEQ .branch0FEC6A

#_0FEBEC: JMP .branch0FEC9F

.branch0FEBEF
#_0FEBEF: JSR routine0FEDE5

.branch0FEBF2
#_0FEBF2: REP #$20
#_0FEBF4: INC.w $0CF5
#_0FEBF7: JMP .branch0FED44

.branch0FEBFA
#_0FEBFA: REP #$20
#_0FEBFC: JSR WaitForNMI_then_PreventTheNext
#_0FEBFF: JSR routine0FEB22
#_0FEC02: LDA.w #$3A64
#_0FEC05: STA.w $0CF5
#_0FEC08: JSR WaitForNMI_then_PreventTheNext
#_0FEC0B: JMP .branch0FED47

.branch0FEC0E
#_0FEC0E: REP #$20
#_0FEC10: LDA.w $0CF5
#_0FEC13: AND.w #$FFE0
#_0FEC16: CLC
#_0FEC17: ADC.w #$0044
#_0FEC1A: STA.w $0CF5
#_0FEC1D: JMP .branch0FED47

.branch0FEC20
#_0FEC20: REP #$20
#_0FEC22: LDA.w $0CF7
#_0FEC25: BEQ .branch0FEC33

.branch0FEC27
#_0FEC27: REP #$20
#_0FEC29: LDA.w $0F53
#_0FEC2C: BEQ .branch0FEC33

#_0FEC2E: JSR routine0FED63
#_0FEC31: BRA .branch0FEC27

.branch0FEC33
#_0FEC33: JSR WaitForNMI_then_PreventTheNext
#_0FEC36: JSR routine0FEB22
#_0FEC39: PLP
#_0FEC3A: RTS

.branch0FEC3B
#_0FEC3B: REP #$20
#_0FEC3D: AND.w #$00FF

#_0FEC40: SEP #$20
#_0FEC42: AND.b #$03
#_0FEC44: ASL A
#_0FEC45: ASL A
#_0FEC46: ASL A
#_0FEC47: TAX
#_0FEC48: LDY.w #$0008

.branch0FEC4B
#_0FEC4B: LDA.w $0410,X
#_0FEC4E: CMP.b #$FF
#_0FEC50: BEQ .branch0FEC67

#_0FEC52: PHY
#_0FEC53: PHX
#_0FEC54: JSR routine0FEDE5
#_0FEC57: JSR routine0FED4F

#_0FEC5A: REP #$20
#_0FEC5C: INC.w $0CF5

#_0FEC5F: SEP #$20
#_0FEC61: PLX
#_0FEC62: PLY
#_0FEC63: INX
#_0FEC64: DEY
#_0FEC65: BNE .branch0FEC4B

.branch0FEC67
#_0FEC67: JMP .branch0FED47

.branch0FEC6A
#_0FEC6A: SEP #$20
#_0FEC6C: REP #$10
#_0FEC6E: LDX.w $0D0F
#_0FEC71: INX
#_0FEC72: LDA.l UNREACH_1AF002,X
#_0FEC76: STA.w $0A6A
#_0FEC79: INX
#_0FEC7A: LDA.l UNREACH_1AF002,X
#_0FEC7E: STA.w $0A69
#_0FEC81: INX
#_0FEC82: LDA.l UNREACH_1AF002,X
#_0FEC86: STA.w $0A6B
#_0FEC89: INX
#_0FEC8A: LDA.l UNREACH_1AF002,X
#_0FEC8E: STA.w $0A6D
#_0FEC91: PHX
#_0FEC92: PHY
#_0FEC93: JSL routine02E6C9
#_0FEC97: PLY
#_0FEC98: PLX
#_0FEC99: STX.w $0D0F
#_0FEC9C: JMP .branch0FED47

.branch0FEC9F
#_0FEC9F: CMP.b #$D1
#_0FECA1: BEQ .branch0FECF9

#_0FECA3: CMP.b #$D0
#_0FECA5: BEQ .branch0FED04

#_0FECA7: CMP.b #$E1
#_0FECA9: BEQ .branch0FED18

#_0FECAB: CMP.b #$EA
#_0FECAD: BEQ .branch0FED2C

#_0FECAF: CMP.b #$D7
#_0FECB1: BEQ .branch0FECD0

#_0FECB3: CMP.b #$DF
#_0FECB5: BEQ .branch0FECBA

#_0FECB7: JMP .branch0FEBEF

.branch0FECBA
#_0FECBA: REP #$20
#_0FECBC: LDA.w $0CF7
#_0FECBF: BEQ .branch0FECCD

.branch0FECC1
#_0FECC1: REP #$20
#_0FECC3: LDA.w $0F53
#_0FECC6: BEQ .branch0FECCD

#_0FECC8: JSR routine0FED63
#_0FECCB: BRA .branch0FECC1

.branch0FECCD
#_0FECCD: JMP .branch0FED47

.branch0FECD0
#_0FECD0: SEP #$20
#_0FECD2: JSR WaitForNMI_then_PreventTheNext
#_0FECD5: INX
#_0FECD6: STX.w $0D0F
#_0FECD9: LDA.l UNREACH_1AF002,X

#_0FECDD: REP #$20
#_0FECDF: AND.w #$00FF
#_0FECE2: ASL A
#_0FECE3: ASL A
#_0FECE4: ASL A
#_0FECE5: ASL A
#_0FECE6: ASL A
#_0FECE7: CLC
#_0FECE8: ADC.w #$0000
#_0FECEB: TAX
#_0FECEC: LDA.w #$0020
#_0FECEF: JSR routine0FEB92
#_0FECF2: JSR WaitForNMI_then_PreventTheNext
#_0FECF5: JMP .branch0FED47

.branch0FECF9
#_0FECF8: SEP #$20
#_0FECFA: INX
#_0FECFB: LDA.l UNREACH_1AF002,X
#_0FECFF: STA.w $0D12
#_0FED02: BRA .branch0FED0E

.branch0FED04
#_0FED04: SEP #$20
#_0FED06: INX
#_0FED07: LDA.l UNREACH_1AF002,X
#_0FED0B: STA.w $0CF7

.branch0FED0E
#_0FED0E: LDA.b #$00
#_0FED10: STA.w $0D11
#_0FED13: STX.w $0D0F
#_0FED16: BRA .branch0FED47

.branch0FED18
#_0FED18: SEP #$20
#_0FED1A: INX
#_0FED1B: LDA.l UNREACH_1AF002,X
#_0FED1F: STA.w $0D14
#_0FED22: LDA.b #$00
#_0FED24: STA.w $0D13
#_0FED27: STX.w $0D0F
#_0FED2A: BRA .branch0FED47

.branch0FED2C
#_0FED2C: SEP #$20
#_0FED2E: INX
#_0FED2F: LDA.l UNREACH_1AF002,X

#_0FED33: REP #$20
#_0FED35: AND.w #$00FF
#_0FED38: TAY

.branch0FED39
#_0FED39: JSR routine0FED4F
#_0FED3C: DEY
#_0FED3D: BNE .branch0FED39

#_0FED3F: STX.w $0D0F
#_0FED42: BRA .branch0FED47

.branch0FED44
#_0FED44: JSR routine0FED4F

.branch0FED47
#_0FED47: REP #$20
#_0FED49: INC.w $0D0F
#_0FED4C: JMP .branch0FEBB9

routine0FED4F:
#_0FED4F: SEP #$20
#_0FED51: PHY
#_0FED52: LDA.w $0D14

#_0FED55: REP #$20
#_0FED57: AND.w #$00FF
#_0FED5A: TAY

.branch0FED5B
#_0FED5B: JSR routine0FED63
#_0FED5E: DEY
#_0FED5F: BNE .branch0FED5B

#_0FED61: PLY
#_0FED62: RTS

;===================================================================================================

routine0FED63:
#_0FED63: PHP
#_0FED64: REP #$10
#_0FED66: SEP #$20
#_0FED68: PHY
#_0FED69: PHX
#_0FED6A: INC.w $0D11
#_0FED6D: SEC
#_0FED6E: LDA.w $0D12
#_0FED71: SBC.w $0D11
#_0FED74: BCS .branch0FED7E

#_0FED76: LDA.b #$00
#_0FED78: STA.w $0D11
#_0FED7B: JSR routine0FED89

.branch0FED7E
#_0FED7E: JSR routine0FFA55
#_0FED81: JSL AddSelfAsVectorAndMakeSpace
#_0FED85: PLX
#_0FED86: PLY
#_0FED87: PLP
#_0FED88: RTS

;===================================================================================================

routine0FED89:
#_0FED89: PHP
#_0FED8A: REP #$20
#_0FED8C: LDA.w $0CF7
#_0FED8F: BEQ .EXIT_0FEDCA

#_0FED91: LDA.w $0F53
#_0FED94: BEQ .EXIT_0FEDCA

#_0FED96: LDA.w $0CF7
#_0FED99: CMP.w #$0001
#_0FED9C: BEQ routine0FEDCC

#_0FED9E: REP #$20
#_0FEDA0: SEC
#_0FEDA1: LDA.w $0F4F
#_0FEDA4: SBC.w #$0001
#_0FEDA7: STA.w $0F4F

#_0FEDAA: SEP #$20
#_0FEDAC: STA.w BG1VOFS
#_0FEDAF: XBA
#_0FEDB0: STA.w BG1VOFS

#_0FEDB3: REP #$20
#_0FEDB5: LDA.w $0F53
#_0FEDB8: BEQ .EXIT_0FEDCA

#_0FEDBA: SEC
#_0FEDBB: SBC.w #$0001
#_0FEDBE: STA.w $0F53

#_0FEDC1: SEP #$20
#_0FEDC3: STA.w BG2VOFS
#_0FEDC6: XBA
#_0FEDC7: STA.w BG2VOFS

.EXIT_0FEDCA
#_0FEDCA: PLP
#_0FEDCB: RTS

;===================================================================================================

routine0FEDCC:
#_0FEDCC: REP #$20
#_0FEDCE: LDA.w $0F53
#_0FEDD1: BEQ .exit

#_0FEDD3: CLC
#_0FEDD4: ADC.w #$0001
#_0FEDD7: STA.w $0F53

#_0FEDDA: SEP #$20
#_0FEDDC: STA.w BG2VOFS
#_0FEDDF: XBA
#_0FEDE0: STA.w BG2VOFS

.exit
#_0FEDE3: PLP
#_0FEDE4: RTS

;===================================================================================================

routine0FEDE5:
#_0FEDE5: PHP
#_0FEDE6: SEP #$20
#_0FEDE8: REP #$10
#_0FEDEA: PHA
#_0FEDEB: CMP.b #$CF
#_0FEDED: BEQ .branch0FEDF4

#_0FEDEF: SEC
#_0FEDF0: SBC.b #$9C
#_0FEDF2: BCS .branch0FEE08

.branch0FEDF4
#_0FEDF4: REP #$20
#_0FEDF6: LDA.w $0CF5

#_0FEDF9: SEP #$20
#_0FEDFB: STA.w VMADDL
#_0FEDFE: XBA
#_0FEDFF: STA.w VMADDH
#_0FEE02: PLA
#_0FEE03: STA.w VMDATAL

.EXIT_0FEE06
#_0FEE06: PLP
#_0FEE07: RTS

.branch0FEE08
#_0FEE08: PHX

#_0FEE09: REP #$20
#_0FEE0B: AND.w #$00FF
#_0FEE0E: TAX

#_0FEE0F: SEP #$20
#_0FEE11: LDA.l data0FEE68,X
#_0FEE15: PHA
#_0FEE16: AND.b #$80
#_0FEE18: BNE .branch0FEE33

#_0FEE1A: REP #$20
#_0FEE1C: SEC
#_0FEE1D: LDA.w $0CF5
#_0FEE20: SBC.w #$0020

#_0FEE23: SEP #$20
#_0FEE25: STA.w VMADDL
#_0FEE28: XBA
#_0FEE29: STA.w VMADDH
#_0FEE2C: LDA.b #$9E
#_0FEE2E: STA.w VMDATAL
#_0FEE31: BRA .branch0FEE4A

.branch0FEE33
#_0FEE33: REP #$20
#_0FEE35: SEC
#_0FEE36: LDA.w $0CF5
#_0FEE39: SBC.w #$0020

#_0FEE3C: SEP #$20
#_0FEE3E: STA.w VMADDL
#_0FEE41: XBA
#_0FEE42: STA.w VMADDH
#_0FEE45: LDA.b #$9F
#_0FEE47: STA.w VMDATAL

.branch0FEE4A
#_0FEE4A: SEP #$20
#_0FEE4C: PLA

#_0FEE4D: REP #$20
#_0FEE4F: LDA.w $0CF5

#_0FEE52: SEP #$20
#_0FEE54: STA.w VMADDL
#_0FEE57: XBA
#_0FEE58: STA.w VMADDH
#_0FEE5B: LDA.l data0FEE68,X
#_0FEE5F: AND.b #$7F
#_0FEE61: STA.w VMDATAL
#_0FEE64: PLX
#_0FEE65: PLA
#_0FEE66: BRA .EXIT_0FEE06

data0FEE68:
#_0FEE68: db $2A,$2B,$2C,$2D,$2E,$2F,$30,$31
#_0FEE70: db $32,$33,$34,$35,$36,$37,$38,$3E
#_0FEE78: db $3F,$40,$41,$42,$BE,$BF,$C0,$C1
#_0FEE80: db $C2,$62,$63,$64,$65,$66,$67,$68
#_0FEE88: db $69,$6A,$6B,$6C,$6D,$6E,$6F,$70
#_0FEE90: db $76,$77,$78,$79,$7A,$F6,$F7,$F8
#_0FEE98: db $F9,$FA

data0FEE9A:
#_0FEE9A: db $84,$20,$00,$00,$04,$10,$08,$10
#_0FEEA2: db $8C,$00,$10,$01,$94,$00,$9C,$00
#_0FEEAA: db $9C,$01,$9C,$12,$1C,$33,$80,$10
#_0FEEB2: db $84,$10,$04,$11,$08,$21,$0C,$21
#_0FEEBA: db $84,$10,$00,$00,$00,$10,$00,$20
#_0FEEC2: db $00,$30,$00,$41,$00,$20,$00,$50
#_0FEECA: db $88,$40,$0C,$12,$98,$63,$80,$10
#_0FEED2: db $04,$20,$84,$20,$04,$21,$08,$21
#_0FEEDA: db $94,$00,$00,$00,$04,$10,$08,$10
#_0FEEE2: db $8C,$00,$18,$21,$94,$00,$9C,$00
#_0FEEEA: db $9C,$01,$9C,$12,$1C,$33,$80,$10
#_0FEEF2: db $04,$10,$8C,$10,$0C,$21,$10,$21
#_0FEEFA: db $00,$00,$00,$00,$84,$10,$8A,$10
#_0FEF02: db $8E,$00,$1A,$21,$95,$00,$9C,$10
#_0FEF0A: db $DC,$09,$BC,$16,$3C,$33,$82,$10
#_0FEF12: db $24,$10,$AD,$14,$0E,$21,$32,$25
#_0FEF1A: db $00,$00,$00,$00,$86,$10,$8C,$10
#_0FEF22: db $8F,$00,$5C,$29,$D6,$00,$DC,$10
#_0FEF2A: db $FC,$11,$DC,$1A,$5C,$3B,$84,$10
#_0FEF32: db $64,$10,$CD,$18,$30,$25,$54,$29
#_0FEF3A: db $00,$00,$00,$00,$88,$10,$8E,$10
#_0FEF42: db $90,$00,$9E,$31,$B6,$08,$FC,$18
#_0FEF4A: db $1C,$1A,$1C,$1F,$7C,$43,$87,$10
#_0FEF52: db $84,$10,$EF,$1C,$52,$29,$76,$2D
#_0FEF5A: db $00,$00,$00,$04,$89,$10,$8F,$10
#_0FEF62: db $92,$00,$DF,$39,$B7,$0C,$1C,$21
#_0FEF6A: db $1C,$22,$3C,$23,$7C,$4B,$8A,$10
#_0FEF72: db $84,$14,$0F,$21,$74,$2D,$98,$31
#_0FEF7A: db $00,$00,$00,$08,$8A,$10,$90,$10
#_0FEF82: db $94,$00,$3F,$46,$B9,$14,$5C,$21
#_0FEF8A: db $1C,$2A,$9C,$27,$7C,$4F,$8C,$10
#_0FEF92: db $84,$14,$10,$25,$97,$31,$BA,$35
#_0FEF9A: db $00,$00,$00,$0C,$8A,$10,$92,$10
#_0FEFA2: db $96,$00,$7F,$4E,$DB,$18,$7C,$21
#_0FEFAA: db $1C,$2E,$9C,$2B,$9C,$53,$8E,$10
#_0FEFB2: db $84,$18,$10,$29,$99,$31,$DB,$39
#_0FEFBA: db $00,$00,$00,$10,$8B,$10,$94,$10
#_0FEFC2: db $98,$00,$BF,$56,$1C,$21,$9C,$21
#_0FEFCA: db $1C,$32,$9C,$33,$9C,$5B,$90,$10
#_0FEFD2: db $84,$20,$10,$31,$9C,$31,$1C,$42
#_0FEFDA: db $00,$00,$00,$10,$AC,$10,$96,$10
#_0FEFE2: db $9A,$00,$FF,$5E,$1D,$21,$BC,$21
#_0FEFEA: db $1C,$36,$9C,$3B,$9C,$63,$92,$10
#_0FEFF2: db $84,$28,$10,$39,$9D,$31,$3D,$46
#_0FEFFA: db $00,$00,$00,$10,$AD,$10,$98,$10
#_0FF002: db $9C,$00,$3F,$67,$1E,$21,$DC,$21
#_0FF00A: db $1C,$3A,$9C,$43,$9C,$6B,$94,$10
#_0FF012: db $84,$30,$10,$41,$9F,$31,$5E,$4A

routine0FF01A:
#_0FF01A: PHP
#_0FF01B: REP #$30
#_0FF01D: JSR routine0FCC37
#_0FF020: JSR PPUSettings_0FCAB6
#_0FF023: LDX.w #$0000
#_0FF026: JSR routine0FF0A0
#_0FF029: JSR routine0FF10C
#_0FF02C: JSR routine0FF146
#_0FF02F: JSR routine0FCC11
#_0FF032: JSR routine0FF210
#_0FF035: JSR routine0FF1A3
#_0FF038: JSR EnableNMI_B0F
#_0FF03B: JSR routine0FCDE8

#_0FF03E: REP #$20
#_0FF040: LDA.w #$0000
#_0FF043: STA.w $0D01
#_0FF046: JSR routine0FCE8F
#_0FF049: JSR routine0FCE05
#_0FF04C: JSR routine0FF273
#_0FF04F: JSR routine0FF2EB
#_0FF052: JSR routine0FF2C7
#_0FF055: JSR DisableNMI_B0F
#_0FF058: JSR routine0FCC37
#_0FF05B: JSR PPUSettings_0FCAB6
#_0FF05E: LDX.w #$2000
#_0FF061: JSR routine0FF0A0
#_0FF064: LDX.w #$3F00
#_0FF067: JSR routine0FF0D3
#_0FF06A: JSR routine0FF146
#_0FF06D: JSR routine0FCC11
#_0FF070: JSR routine0FF210
#_0FF073: JSR routine0FF1A3
#_0FF076: JSR EnableNMI_B0F
#_0FF079: JSR routine0FCDE8

#_0FF07C: REP #$20
#_0FF07E: LDA.w #$0000
#_0FF081: STA.w $0D01
#_0FF084: JSR routine0FCE8F
#_0FF087: JSR routine0FCE05
#_0FF08A: JSR routine0FF544
#_0FF08D: JSR routine0FF297
#_0FF090: JSR routine0FF30B

#_0FF093: SEP #$20
#_0FF095: LDA.b #$FD ; SONG FD COMMAND
#_0FF097: JSL Write_to_APU_transferrable
#_0FF09B: JSR routine0FF2C7
#_0FF09E: PLP
#_0FF09F: RTS

;===================================================================================================

routine0FF0A0:
#_0FF0A0: PHP
#_0FF0A1: SEP #$20
#_0FF0A3: REP #$10
#_0FF0A5: PHX
#_0FF0A6: LDA.b #$80
#_0FF0A8: STA.w VMAIN
#_0FF0AB: LDA.b #$00
#_0FF0AD: STA.w VMADDL
#_0FF0B0: STA.w VMADDH
#_0FF0B3: LDY.w #$1F00
#_0FF0B6: PLX

.branch0FF0B7
#_0FF0B7: LDA.l UNREACH_22C000,X
#_0FF0BB: LSR A
#_0FF0BC: LSR A
#_0FF0BD: LSR A
#_0FF0BE: LSR A
#_0FF0BF: AND.b #$0F
#_0FF0C1: STA.w VMDATAH
#_0FF0C4: LDA.l UNREACH_22C000,X
#_0FF0C8: AND.b #$0F
#_0FF0CA: STA.w VMDATAH
#_0FF0CD: INX
#_0FF0CE: DEY
#_0FF0CF: BNE .branch0FF0B7

#_0FF0D1: PLP
#_0FF0D2: RTS

;===================================================================================================

routine0FF0D3:
#_0FF0D3: PHP
#_0FF0D4: SEP #$20
#_0FF0D6: REP #$10
#_0FF0D8: PHX
#_0FF0D9: LDA.b #$00
#_0FF0DB: STA.w VMAIN
#_0FF0DE: LDA.b #$08
#_0FF0E0: STA.w VMADDL
#_0FF0E3: LDA.b #$02
#_0FF0E5: STA.w VMADDH
#_0FF0E8: PLX
#_0FF0E9: LDY.w #$0010

.branch0FF0EC
#_0FF0EC: PHY
#_0FF0ED: LDY.w #$0010

.branch0FF0F0
#_0FF0F0: LDA.l UNREACH_22C000,X
#_0FF0F4: STA.w VMDATAL
#_0FF0F7: INX
#_0FF0F8: DEY
#_0FF0F9: BNE .branch0FF0F0

#_0FF0FB: LDY.w #$0070
#_0FF0FE: LDA.b #$00

.branch0FF100
#_0FF100: STA.w VMDATAL
#_0FF103: DEY
#_0FF104: BNE .branch0FF100

#_0FF106: PLY
#_0FF107: DEY
#_0FF108: BNE .branch0FF0EC

#_0FF10A: PLP
#_0FF10B: RTS

;===================================================================================================

routine0FF10C:
#_0FF10C: PHP
#_0FF10D: SEP #$20
#_0FF10F: REP #$10
#_0FF111: LDA.b #$00
#_0FF113: STA.w VMAIN
#_0FF116: LDA.b #$00
#_0FF118: STA.w VMADDL
#_0FF11B: LDA.b #$00
#_0FF11D: STA.w VMADDH
#_0FF120: LDY.w #$001C
#_0FF123: LDX.w #$0000

.branch0FF126
#_0FF126: PHY
#_0FF127: LDY.w #$0020

.branch0FF12A
#_0FF12A: LDA.l UNREACH_1AEC00,X
#_0FF12E: STA.w VMDATAL
#_0FF131: INX
#_0FF132: DEY
#_0FF133: BNE .branch0FF12A

#_0FF135: LDY.w #$0060
#_0FF138: LDA.b #$00

.branch0FF13A
#_0FF13A: STA.w VMDATAL
#_0FF13D: DEY
#_0FF13E: BNE .branch0FF13A

#_0FF140: PLY
#_0FF141: DEY
#_0FF142: BNE .branch0FF126

#_0FF144: PLP
#_0FF145: RTS

;===================================================================================================

routine0FF146:
#_0FF146: PHP
#_0FF147: SEP #$20
#_0FF149: REP #$10
#_0FF14B: LDA.b #$00
#_0FF14D: STA.w CGADD
#_0FF150: LDX.w #$0000
#_0FF153: LDY.w #$0020

.branch0FF156
#_0FF156: LDA.l data0FF166,X
#_0FF15A: STA.w CGDATA
#_0FF15D: INX
#_0FF15E: DEY
#_0FF15F: BNE .branch0FF156

#_0FF161: JSR routine0FF186
#_0FF164: PLP
#_0FF165: RTS

data0FF166:
#_0FF166: db $00,$00,$00,$00,$00,$20,$04,$30
#_0FF16E: db $04,$50,$80,$70,$04,$61,$88,$71
#_0FF176: db $0C,$72,$10,$72,$00,$11,$80,$11
#_0FF17E: db $00,$12,$84,$22,$08,$43,$98,$63

routine0FF186:
#_0FF186: PHP
#_0FF187: REP #$10
#_0FF189: SEP #$20

#_0FF18B: LDA.b #$80
#_0FF18D: STA.w CGADD
#_0FF190: LDY.w #$0008
#_0FF193: LDX.w #$0000

.branch0FF196
#_0FF196: LDA.l UNREACH_078000,X
#_0FF19A: STA.w CGDATA
#_0FF19D: INX
#_0FF19E: DEY
#_0FF19F: BNE .branch0FF196

#_0FF1A1: PLP
#_0FF1A2: RTS

;===================================================================================================

routine0FF1A3:
#_0FF1A3: PHP
#_0FF1A4: REP #$10
#_0FF1A6: SEP #$20

#_0FF1A8: LDA.b #$A2
#_0FF1AA: STA.w OBSEL
#_0FF1AD: LDA.b #$00
#_0FF1AF: STA.w OAMADDL
#_0FF1B2: STA.w OAMADDH
#_0FF1B5: LDX.w #$0000
#_0FF1B8: LDY.w #$0020

.branch0FF1BB
#_0FF1BB: LDA.l data0FF1F0,X
#_0FF1BF: STA.w OAMDATA
#_0FF1C2: INX
#_0FF1C3: DEY
#_0FF1C4: BNE .branch0FF1BB

#_0FF1C6: LDY.w #$01E0

.branch0FF1C9
#_0FF1C9: LDA.b #$E0
#_0FF1CB: STA.w OAMDATA
#_0FF1CE: DEY
#_0FF1CF: BNE .branch0FF1C9

#_0FF1D1: LDY.w #$0020

.branch0FF1D4
#_0FF1D4: LDA.b #$00
#_0FF1D6: STA.w OAMDATA
#_0FF1D9: DEY
#_0FF1DA: BNE .branch0FF1D4

#_0FF1DC: LDA.b #$00
#_0FF1DE: STA.w OAMADDL
#_0FF1E1: LDA.b #$01
#_0FF1E3: STA.w OAMADDH
#_0FF1E6: LDA.b #$AA
#_0FF1E8: STA.w OAMDATA
#_0FF1EB: STA.w OAMDATA
#_0FF1EE: PLP
#_0FF1EF: RTS

data0FF1F0:
#_0FF1F0: db $00,$90,$00,$30,$40,$90,$08,$30
#_0FF1F8: db $80,$90,$80,$30,$C0,$90,$88,$30
#_0FF200: db $00,$D0,$00,$31,$40,$D0,$08,$31
#_0FF208: db $80,$D0,$80,$31,$C0,$D0,$88,$31

routine0FF210:
#_0FF210: PHP
#_0FF211: REP #$10
#_0FF213: SEP #$20

#_0FF215: LDA.b #$80
#_0FF217: STA.w VMAIN

#_0FF21A: LDA.b #$00
#_0FF21C: STA.w VMADDL

#_0FF21F: LDA.b #$40
#_0FF221: STA.w VMADDH

#_0FF224: LDY.w #$0200

.branch0FF227
#_0FF227: LDA.b #$CF
#_0FF229: JSR routine0FF231
#_0FF22C: DEY
#_0FF22D: BNE .branch0FF227

#_0FF22F: PLP
#_0FF230: RTS

;===================================================================================================

routine0FF231:
#_0FF231: PHP
#_0FF232: PHX
#_0FF233: PHY

#_0FF234: REP #$30
#_0FF236: AND.w #$00FF
#_0FF239: ASL A
#_0FF23A: ASL A
#_0FF23B: ASL A
#_0FF23C: ASL A
#_0FF23D: TAX

#_0FF23E: SEP #$20
#_0FF240: LDY.w #$0008

.branch0FF243
#_0FF243: LDA.l Font_2BPP,X
#_0FF247: STA.w VMDATAL
#_0FF24A: INX
#_0FF24B: LDA.l Font_2BPP,X
#_0FF24F: STA.w VMDATAH
#_0FF252: INX
#_0FF253: DEY
#_0FF254: BNE .branch0FF243

#_0FF256: LDY.w #$0008
#_0FF259: LDX.w #$0000

.branch0FF25C
#_0FF25C: LDA.l Font_2BPP,X
#_0FF260: STA.w VMDATAL
#_0FF263: INX
#_0FF264: LDA.l Font_2BPP,X
#_0FF268: STA.w VMDATAH
#_0FF26B: INX
#_0FF26C: DEY
#_0FF26D: BNE .branch0FF25C

#_0FF26F: PLY
#_0FF270: PLX
#_0FF271: PLP
#_0FF272: RTS

;===================================================================================================

routine0FF273:
#_0FF273: PHP
#_0FF274: REP #$10
#_0FF276: SEP #$20

#_0FF278: LDA.b #$00
#_0FF27A: LDY.w #$0010

.branch0FF27D
#_0FF27D: STA.w INIDISP
#_0FF280: PHY
#_0FF281: PHA
#_0FF282: LDY.w #$0008

.branch0FF285
#_0FF285: PHY
#_0FF286: JSR WaitForNMI_then_PreventTheNext

#_0FF289: SEP #$20
#_0FF28B: PLY
#_0FF28C: DEY
#_0FF28D: BNE .branch0FF285

#_0FF28F: PLA
#_0FF290: INC A
#_0FF291: PLY
#_0FF292: DEY
#_0FF293: BNE .branch0FF27D

#_0FF295: PLP
#_0FF296: RTS

;===================================================================================================

routine0FF297:
#_0FF297: PHP
#_0FF298: REP #$10
#_0FF29A: SEP #$20

#_0FF29C: LDA.b #$00
#_0FF29E: LDY.w #$0010

.branch0FF2A1
#_0FF2A1: STA.w INIDISP
#_0FF2A4: PHY
#_0FF2A5: PHA
#_0FF2A6: LDY.w #$0008

.branch0FF2A9
#_0FF2A9: PHY
#_0FF2AA: JSR INC_CFF_Max168
#_0FF2AD: JSR routine0FCE8F
#_0FF2B0: JSR routine0FCE05
#_0FF2B3: JSR WaitForNMI_then_PreventTheNext
#_0FF2B6: JSR routine0FF581

#_0FF2B9: SEP #$20
#_0FF2BB: PLY
#_0FF2BC: DEY
#_0FF2BD: BNE .branch0FF2A9

#_0FF2BF: PLA
#_0FF2C0: INC A
#_0FF2C1: PLY
#_0FF2C2: DEY
#_0FF2C3: BNE .branch0FF2A1

#_0FF2C5: PLP
#_0FF2C6: RTS

;===================================================================================================

routine0FF2C7:
#_0FF2C7: PHP
#_0FF2C8: REP #$10
#_0FF2CA: SEP #$20

#_0FF2CC: LDA.b #$0F
#_0FF2CE: LDY.w #$0010

.branch0FF2D1
#_0FF2D1: STA.w INIDISP
#_0FF2D4: PHY
#_0FF2D5: PHA
#_0FF2D6: LDY.w #$0008

.branch0FF2D9
#_0FF2D9: PHY
#_0FF2DA: JSR WaitForNMI_then_PreventTheNext

#_0FF2DD: SEP #$20
#_0FF2DF: PLY
#_0FF2E0: DEY
#_0FF2E1: BNE .branch0FF2D9

#_0FF2E3: PLA
#_0FF2E4: DEC A
#_0FF2E5: PLY
#_0FF2E6: DEY
#_0FF2E7: BNE .branch0FF2D1

#_0FF2E9: PLP
#_0FF2EA: RTS

;===================================================================================================

routine0FF2EB:
#_0FF2EB: PHP
#_0FF2EC: REP #$30
#_0FF2EE: SEC
#_0FF2EF: LDA.w #$F3A0
#_0FF2F2: SBC.w #$F3A0
#_0FF2F5: STA.w $0D0F
#_0FF2F8: LDA.w #$4140
#_0FF2FB: STA.w $0D11
#_0FF2FE: LDY.w #$0058

.branch0FF301
#_0FF301: PHY
#_0FF302: JSR routine0FF323
#_0FF305: PLY
#_0FF306: DEY
#_0FF307: BNE .branch0FF301

#_0FF309: PLP
#_0FF30A: RTS

;===================================================================================================

routine0FF30B:
#_0FF30B: PHP
#_0FF30C: REP #$30
#_0FF30E: SEC
#_0FF30F: LDA.w #$F3E8
#_0FF312: SBC.w #$F3A0
#_0FF315: STA.w $0D0F
#_0FF318: LDA.w #$4140
#_0FF31B: STA.w $0D11
#_0FF31E: JSR routine0FF361
#_0FF321: PLP
#_0FF322: RTS

;===================================================================================================

routine0FF323:
#_0FF323: PHP
#_0FF324: PHY

#_0FF325: REP #$30
#_0FF327: TYA
#_0FF328: STA.w $0CF3
#_0FF32B: SEC
#_0FF32C: LDA.w #$0058
#_0FF32F: SBC.w $0CF3
#_0FF332: LSR A
#_0FF333: LSR A
#_0FF334: LSR A
#_0FF335: LSR A
#_0FF336: INC A
#_0FF337: STA.w $0D1D
#_0FF33A: LDY.w #$0010

.branch0FF33D
#_0FF33D: JSR routine0FF34C
#_0FF340: JSR WaitForNMI_then_PreventTheNext
#_0FF343: DEY
#_0FF344: BNE .branch0FF33D

#_0FF346: JSR routine0FF42E
#_0FF349: PLY
#_0FF34A: PLP
#_0FF34B: RTS

;===================================================================================================

routine0FF34C:
#_0FF34C: PHY

#_0FF34D: REP #$20
#_0FF34F: CLC
#_0FF350: LDA.w $0D01
#_0FF353: ADC.w $0D1D
#_0FF356: STA.w $0D01
#_0FF359: JSR routine0FCE8F
#_0FF35C: JSR routine0FCE05
#_0FF35F: PLY
#_0FF360: RTS

;===================================================================================================

routine0FF361:
#_0FF361: PHP
#_0FF362: REP #$30

#_0FF364: LDA.w #$0000
#_0FF367: STA.w $0D15
#_0FF36A: LDY.w #$0058

.branch0FF36D
#_0FF36D: PHY

#_0FF36E: REP #$30
#_0FF370: TYA
#_0FF371: STA.w $0CF3
#_0FF374: SEC
#_0FF375: LDA.w #$0058
#_0FF378: SBC.w $0CF3
#_0FF37B: LSR A
#_0FF37C: LSR A
#_0FF37D: LSR A
#_0FF37E: LSR A
#_0FF37F: INC A
#_0FF380: STA.w $0D1D
#_0FF383: LDY.w #$0010

.branch0FF386
#_0FF386: PHY
#_0FF387: JSR INC_CFF_Max168
#_0FF38A: JSR routine0FF34C
#_0FF38D: JSR WaitForNMI_then_PreventTheNext
#_0FF390: JSR routine0FF581
#_0FF393: PLY
#_0FF394: DEY
#_0FF395: BNE .branch0FF386

#_0FF397: JSR routine0FF42E
#_0FF39A: PLY
#_0FF39B: DEY
#_0FF39C: BNE .branch0FF36D

#_0FF39E: PLP
#_0FF39F: RTS

data0FF3A0:
#_0FF3A0: db $2A,$52,$A2,$4D,$2A,$95,$F9,$32
#_0FF3A8: db $2A,$26,$51,$93,$93,$93,$CF,$27
#_0FF3B0: db $35,$56,$27,$51,$93,$93,$93,$F9
#_0FF3B8: db $29,$43,$28,$34,$35,$3E,$CF,$33
#_0FF3C0: db $3D,$26,$35,$AD,$A9,$25,$4C,$CF
#_0FF3C8: db $31,$AE,$37,$A9,$25,$4D,$F9,$42
#_0FF3D0: db $27,$47,$CF,$2E,$52,$38,$52,$47
#_0FF3D8: db $CF,$33,$3D,$39,$2A,$3A,$CF,$40
#_0FF3E0: db $2C,$43,$4E,$4D,$3D,$A2,$55,$FF
#_0FF3E8: db $2A,$52,$A2,$4D,$93,$93,$93,$F9
#_0FF3F0: db $31,$AE,$37,$3D,$CF,$33,$52,$A1
#_0FF3F8: db $26,$38,$3D,$CF,$36,$39,$9C,$4C
#_0FF400: db $51,$93,$93,$93,$F9,$33,$4C,$56
#_0FF408: db $27,$30,$3D,$CF,$30,$52,$AA,$27
#_0FF410: db $47,$CF,$9D,$52,$9C,$3D,$CF,$27
#_0FF418: db $3C,$4C,$47,$F9,$ED,$3D,$CF,$45
#_0FF420: db $3C,$3D,$CF,$2E,$AA,$27,$47,$CF
#_0FF428: db $44,$39,$93,$93,$93,$FF

routine0FF42E:
#_0FF42E: PHP
#_0FF42F: REP #$10
#_0FF431: SEP #$20
#_0FF433: LDX.w $0D0F
#_0FF436: LDA.l data0FF3A0,X
#_0FF43A: CMP.b #$F9
#_0FF43C: BEQ .branch0FF484

#_0FF43E: CMP.b #$CF
#_0FF440: BEQ .branch0FF493

#_0FF442: CMP.b #$FF
#_0FF444: BEQ .EXIT_0FF4AD

#_0FF446: CMP.b #$ED
#_0FF448: BEQ .branch0FF44F

#_0FF44A: JSR routine0FF4C1
#_0FF44D: BRA .branch0FF493

.branch0FF44F
#_0FF44F: SEP #$20
#_0FF451: REP #$10
#_0FF453: LDX.w $0D15
#_0FF456: LDA.w $0418,X
#_0FF459: CMP.b #$FF
#_0FF45B: BEQ .branch0FF482

#_0FF45D: JSR routine0FF4C1

#_0FF460: REP #$20
#_0FF462: LDA.w $0D11
#_0FF465: AND.w #$00F0
#_0FF468: CMP.w #$00F0
#_0FF46B: BEQ .branch0FF4AF

#_0FF46D: CLC
#_0FF46E: LDA.w $0D11
#_0FF471: ADC.w #$0010
#_0FF474: STA.w $0D11
#_0FF477: INC.w $0D15
#_0FF47A: LDA.w $0D15
#_0FF47D: CMP.w #$0008
#_0FF480: BNE .EXIT_0FF4AD

.branch0FF482
#_0FF482: BRA .branch0FF493

.branch0FF484
#_0FF484: REP #$20
#_0FF486: LDA.w $0D11
#_0FF489: AND.w #$F700
#_0FF48C: CLC
#_0FF48D: ADC.w #$0230
#_0FF490: STA.w $0D11

.branch0FF493
#_0FF493: REP #$20
#_0FF495: LDA.w $0D11
#_0FF498: AND.w #$00F0
#_0FF49B: CMP.w #$00F0
#_0FF49E: BEQ .branch0FF4AF

#_0FF4A0: CLC
#_0FF4A1: LDA.w $0D11
#_0FF4A4: ADC.w #$0010
#_0FF4A7: STA.w $0D11
#_0FF4AA: INC.w $0D0F

.EXIT_0FF4AD
#_0FF4AD: PLP
#_0FF4AE: RTS

.branch0FF4AF
#_0FF4AF: LDA.w $0D11
#_0FF4B2: AND.w #$FF00
#_0FF4B5: CLC
#_0FF4B6: ADC.w #$0800
#_0FF4B9: STA.w $0D11
#_0FF4BC: INC.w $0D0F
#_0FF4BF: PLP
#_0FF4C0: RTS

;===================================================================================================

routine0FF4C1:
#_0FF4C1: PHP
#_0FF4C2: SEP #$20
#_0FF4C4: REP #$10
#_0FF4C6: PHA
#_0FF4C7: CMP.b #$CF
#_0FF4C9: BEQ .branch0FF4D0

#_0FF4CB: SEC
#_0FF4CC: SBC.b #$9C
#_0FF4CE: BCS .branch0FF4E4

.branch0FF4D0
#_0FF4D0: REP #$20
#_0FF4D2: LDA.w $0D11

#_0FF4D5: SEP #$20
#_0FF4D7: STA.w VMADDL
#_0FF4DA: XBA
#_0FF4DB: STA.w VMADDH
#_0FF4DE: PLA
#_0FF4DF: JSR routine0FF231

.branch0FF4E2
#_0FF4E2: PLP
#_0FF4E3: RTS

.branch0FF4E4
#_0FF4E4: PHX

#_0FF4E5: REP #$20
#_0FF4E7: AND.w #$00FF
#_0FF4EA: TAX

#_0FF4EB: SEP #$20
#_0FF4ED: LDA.l data0FEE68,X
#_0FF4F1: PHA
#_0FF4F2: AND.b #$80
#_0FF4F4: BNE .branch0FF509

#_0FF4F6: JSR routine0FF538

#_0FF4F9: SEP #$20
#_0FF4FB: STA.w VMADDL
#_0FF4FE: XBA
#_0FF4FF: STA.w VMADDH
#_0FF502: LDA.b #$9E
#_0FF504: JSR routine0FF231
#_0FF507: BRA .branch0FF51A

.branch0FF509
#_0FF509: JSR routine0FF538

#_0FF50C: SEP #$20
#_0FF50E: STA.w VMADDL
#_0FF511: XBA
#_0FF512: STA.w VMADDH
#_0FF515: LDA.b #$9F
#_0FF517: JSR routine0FF231

.branch0FF51A
#_0FF51A: SEP #$20
#_0FF51C: PLA

#_0FF51D: REP #$20
#_0FF51F: LDA.w $0D11

#_0FF522: SEP #$20
#_0FF524: STA.w VMADDL
#_0FF527: XBA
#_0FF528: STA.w VMADDH
#_0FF52B: LDA.l data0FEE68,X
#_0FF52F: AND.b #$7F
#_0FF531: JSR routine0FF231
#_0FF534: PLX
#_0FF535: PLA
#_0FF536: BRA .branch0FF4E2

routine0FF538:
#_0FF538: PHP
#_0FF539: REP #$30
#_0FF53B: SEC
#_0FF53C: LDA.w $0D11
#_0FF53F: SBC.w #$0100
#_0FF542: PLP
#_0FF543: RTS

;===================================================================================================

routine0FF544:
#_0FF544: PHP
#_0FF545: SEP #$20
#_0FF547: LDA.b #$C0
#_0FF549: STA.l $7E2800

#_0FF54D: REP #$30
#_0FF54F: LDA.w #$FFB0
#_0FF552: LDX.w #$0001
#_0FF555: LDY.w #$0004

.branch0FF558
#_0FF558: PHY
#_0FF559: LDY.w #$0040

.branch0FF55C
#_0FF55C: STA.l $7E2800,X
#_0FF560: INC A
#_0FF561: INX
#_0FF562: INX
#_0FF563: DEY
#_0FF564: BNE .branch0FF55C

#_0FF566: SEP #$20
#_0FF568: PHA
#_0FF569: LDA.b #$C0
#_0FF56B: STA.l $7E2800,X
#_0FF56F: PLA

#_0FF570: REP #$20
#_0FF572: INX
#_0FF573: PLY
#_0FF574: DEY
#_0FF575: BNE .branch0FF558

#_0FF577: DEX
#_0FF578: LDA.w #$0000
#_0FF57B: STA.l $7E2800,X
#_0FF57F: PLP
#_0FF580: RTS

;===================================================================================================

routine0FF581:
#_0FF581: PHP
#_0FF582: REP #$10
#_0FF584: SEP #$20
#_0FF586: LDA.b #$00
#_0FF588: STA.w HDMAEN
#_0FF58B: LDA.b #$02

routine0FF58D:
#_0FF58D: STA.w DMA0MODE
#_0FF590: LDA.b #$0E
#_0FF592: STA.w DMA0PORT
#_0FF595: LDA.b #$0E
#_0FF597: STA.w HDMA0INDIRECTB
#_0FF59A: LDA.b #$7E
#_0FF59C: STA.w DMA0ADDRB
#_0FF59F: LDA.b #$28
#_0FF5A1: STA.w DMA0ADDRH
#_0FF5A4: LDA.b #$00
#_0FF5A6: STA.w DMA0ADDRL
#_0FF5A9: LDA.b #$01
#_0FF5AB: STA.w HDMAEN
#_0FF5AE: PLP
#_0FF5AF: RTS

;===================================================================================================

routine0FF5B0:
#_0FF5B0: PHP
#_0FF5B1: REP #$30
#_0FF5B3: JSR DisableNMI_B0F
#_0FF5B6: JSR routine0FCC37
#_0FF5B9: LDA.w #$1000
#_0FF5BC: STA.w $0D11
#_0FF5BF: STA.w $0D13
#_0FF5C2: LDA.w #$0000
#_0FF5C5: STA.w $0D0F
#_0FF5C8: JSR EnableNMI_B0F
#_0FF5CB: JSR Add_GrayScale_Text_Palette

.branch0FF5CE
#_0FF5CE: REP #$10
#_0FF5D0: SEP #$20
#_0FF5D2: LDX.w $0D0F
#_0FF5D5: LDA.l UNREACH_1AF802,X
#_0FF5D9: CMP.b #$F9
#_0FF5DB: BEQ .branch0FF632

#_0FF5DD: CMP.b #$FA
#_0FF5DF: BEQ .branch0FF607

#_0FF5E1: CMP.b #$FF
#_0FF5E3: BEQ .branch0FF644

#_0FF5E5: CMP.b #$ED
#_0FF5E7: BEQ .branch0FF65F

#_0FF5E9: CMP.b #$EE
#_0FF5EB: BEQ .branch0FF65F

#_0FF5ED: CMP.b #$EF
#_0FF5EF: BEQ .branch0FF65F

#_0FF5F1: CMP.b #$F0
#_0FF5F3: BEQ .branch0FF65F

#_0FF5F5: CMP.b #$CF
#_0FF5F7: BEQ .branch0FF5FF

#_0FF5F9: JMP .branch0FF6CB

.branch0FF5FC
#_0FF5FC: JSR routine0FEDE5

.branch0FF5FF
#_0FF5FF: REP #$20
#_0FF601: INC.w $0CF5
#_0FF604: JMP .branch0FF810

.branch0FF607
#_0FF607: SEP #$20
#_0FF609: LDA.w $0D13
#_0FF60C: BEQ .branch0FF622

#_0FF60E: REP #$20
#_0FF610: JSR WaitForNMI_then_PreventTheNext
#_0FF613: JSR routine0FF855
#_0FF616: LDA.w #$3D04
#_0FF619: STA.w $0CF5
#_0FF61C: JSR WaitForNMI_then_PreventTheNext
#_0FF61F: JMP .branch0FF813

.branch0FF622
#_0FF622: SEP #$20
#_0FF624: JSR routine0FF86F

#_0FF627: REP #$20
#_0FF629: LDA.w #$3E04
#_0FF62C: STA.w $0CF5
#_0FF62F: JMP .branch0FF813

.branch0FF632
#_0FF632: REP #$20
#_0FF634: LDA.w $0CF5
#_0FF637: AND.w #$FFE0
#_0FF63A: CLC
#_0FF63B: ADC.w #$0044
#_0FF63E: STA.w $0CF5
#_0FF641: JMP .branch0FF813

.branch0FF644
#_0FF644: REP #$20
#_0FF646: LDA.w $0CF7
#_0FF649: BEQ .branch0FF657

.branch0FF64B
#_0FF64B: REP #$20
#_0FF64D: LDA.w $0F53
#_0FF650: BEQ .branch0FF657

#_0FF652: JSR routine0FED63
#_0FF655: BRA .branch0FF64B

.branch0FF657
#_0FF657: JSR WaitForNMI_then_PreventTheNext
#_0FF65A: JSR routine0FEB22
#_0FF65D: PLP
#_0FF65E: RTS

.branch0FF65F
#_0FF65F: REP #$20
#_0FF661: AND.w #$00FF

#_0FF664: SEP #$20
#_0FF666: AND.b #$03

routine0FF668:
#_0FF668: ASL A
#_0FF669: ASL A
#_0FF66A: ASL A
#_0FF66B: TAX
#_0FF66C: LDY.w #$0008

.branch0FF66F
#_0FF66F: LDA.w $0410,X
#_0FF672: CMP.b #$FF
#_0FF674: BEQ .branch0FF68B

#_0FF676: PHY
#_0FF677: PHX
#_0FF678: JSR routine0FEDE5
#_0FF67B: JSR routine0FF81B

#_0FF67E: REP #$20
#_0FF680: INC.w $0CF5

#_0FF683: SEP #$20
#_0FF685: PLX
#_0FF686: PLY
#_0FF687: INX
#_0FF688: DEY
#_0FF689: BNE .branch0FF66F

.branch0FF68B
#_0FF68B: JMP .branch0FF813

.branch0FF68E
#_0FF68E: SEP #$20
#_0FF690: REP #$10
#_0FF692: LDX.w $0D0F
#_0FF695: INX
#_0FF696: LDA.l UNREACH_1AF802,X
#_0FF69A: STA.w $0A6A
#_0FF69D: INX
#_0FF69E: LDA.l UNREACH_1AF802,X
#_0FF6A2: STA.w $0A69
#_0FF6A5: INX
#_0FF6A6: LDA.l UNREACH_1AF802,X
#_0FF6AA: STA.w $0A6B
#_0FF6AD: INX
#_0FF6AE: LDA.l UNREACH_1AF802,X
#_0FF6B2: STA.w $0A6D
#_0FF6B5: PHX
#_0FF6B6: PHY

#_0FF6B7: REP #$20
#_0FF6B9: LDA.w #$FFFF
#_0FF6BC: STA.w $0CF3
#_0FF6BF: JSL routine02E6C9
#_0FF6C3: PLY
#_0FF6C4: PLX
#_0FF6C5: STX.w $0D0F
#_0FF6C8: JMP .branch0FF813

.branch0FF6CB
#_0FF6CB: SEP #$20
#_0FF6CD: CMP.b #$D6
#_0FF6CF: BEQ .branch0FF68E

#_0FF6D1: CMP.b #$D7
#_0FF6D3: BEQ .branch0FF740

#_0FF6D5: CMP.b #$DF
#_0FF6D7: BEQ .branch0FF714

#_0FF6D9: CMP.b #$E6
#_0FF6DB: BEQ .branch0FF6E0

#_0FF6DD: JMP .branch0FF7D9

.branch0FF6E0
#_0FF6E0: JSR EnableNMI_B0F

#_0FF6E3: SEP #$20
#_0FF6E5: LDX.w $0D0F
#_0FF6E8: INX
#_0FF6E9: LDA.l UNREACH_1AF802,X
#_0FF6ED: STA.w $040D
#_0FF6F0: INX
#_0FF6F1: LDA.l UNREACH_1AF802,X
#_0FF6F5: STA.w $0710
#_0FF6F8: INX
#_0FF6F9: LDA.l UNREACH_1AF802,X
#_0FF6FD: STA.w $070C
#_0FF700: INX
#_0FF701: LDA.l UNREACH_1AF802,X
#_0FF705: STA.w $070D
#_0FF708: STX.w $0D0F
#_0FF70B: PHP
#_0FF70C: JSL routine00C7AA
#_0FF710: PLP
#_0FF711: JMP .branch0FF813

.branch0FF714
#_0FF714: SEP #$20
#_0FF716: LDX.w $0D0F
#_0FF719: INX
#_0FF71A: STX.w $0D0F
#_0FF71D: LDA.l UNREACH_1AF802,X

#_0FF721: REP #$20
#_0FF723: AND.w #$00FF
#_0FF726: TAY

.branch0FF727
#_0FF727: SEP #$20
#_0FF729: PHY
#_0FF72A: LDA.b #$CF
#_0FF72C: JSR routine0FEDE5
#_0FF72F: JSR routine0FF81B

#_0FF732: REP #$20
#_0FF734: INC.w $0CF5

#_0FF737: SEP #$20
#_0FF739: PLY
#_0FF73A: DEY
#_0FF73B: BNE .branch0FF727

#_0FF73D: JMP .branch0FF813

.branch0FF740
#_0FF740: JSR EnableNMI_B0F

#_0FF743: SEP #$20
#_0FF745: LDX.w $0D0F
#_0FF748: INX
#_0FF749: STX.w $0D0F
#_0FF74C: LDA.l UNREACH_1AF802,X
#_0FF750: STA.w $0A59

#_0FF753: REP #$20
#_0FF755: LDA.w #$FFFF
#_0FF758: STA.w $0CF3
#_0FF75B: JSL routine02E32D

#_0FF75F: REP #$30
#_0FF761: JMP .branch0FF813

.branch0FF764
#_0FF764: JSR routine0FD1A7

.branch0FF767
#_0FF767: SEP #$20
#_0FF769: JSR DisableNMI_B0F
#_0FF76C: LDA.b #$01
#_0FF76E: STA.w $0D13
#_0FF771: JSR routine0FCC37
#_0FF774: JSR routine0FCC11
#_0FF777: JSL Reset_OAMrelatedWRAM
#_0FF77B: JSL PPUSettings_00C409
#_0FF77F: LDA.b #$00
#_0FF781: STA.w MDMAEN
#_0FF784: STA.w HDMAEN
#_0FF787: JSR routine0FEA7A
#_0FF78A: JSR EnableNMI_B0F
#_0FF78D: LDA.b #$0F
#_0FF78F: STA.w INIDISP
#_0FF792: STA.w $0F43
#_0FF795: JSR WaitForNMI_then_PreventTheNext

#_0FF798: REP #$20
#_0FF79A: LDA.w #$3D04
#_0FF79D: STA.w $0CF5
#_0FF7A0: JMP .branch0FF813

.branch0FF7A3
#_0FF7A3: SEP #$20
#_0FF7A5: JSR DisableNMI_B0F
#_0FF7A8: LDA.b #$00
#_0FF7AA: STA.w $0D13
#_0FF7AD: JSR routine0FF82F
#_0FF7B0: JSR routine0FEA7A
#_0FF7B3: JSR Add_GrayScale_Text_Palette
#_0FF7B6: JSR EnableNMI_B0F
#_0FF7B9: JSR routine0FF86F
#_0FF7BC: JSR routine0FD1D3

#_0FF7BF: REP #$20
#_0FF7C1: LDA.w #$3E04
#_0FF7C4: STA.w $0CF5
#_0FF7C7: JMP .branch0FF813

.branch0FF7CA
#_0FF7CA: SEP #$20
#_0FF7CC: INX
#_0FF7CD: LDA.l UNREACH_1AF802,X
#_0FF7D1: STA.w $0D14
#_0FF7D4: STX.w $0D0F
#_0FF7D7: BRA .branch0FF813

.branch0FF7D9
#_0FF7D9: SEP #$20
#_0FF7DB: CMP.b #$D1
#_0FF7DD: BNE .branch0FF7E2

#_0FF7DF: JMP .branch0FF764

.branch0FF7E2
#_0FF7E2: CMP.b #$D0
#_0FF7E4: BEQ .branch0FF7A3

#_0FF7E6: CMP.b #$D2
#_0FF7E8: BNE .branch0FF7ED

#_0FF7EA: JMP .branch0FF767

.branch0FF7ED
#_0FF7ED: CMP.b #$E1
#_0FF7EF: BEQ .branch0FF7CA

#_0FF7F1: CMP.b #$EA
#_0FF7F3: BEQ .branch0FF7F8

#_0FF7F5: JMP .branch0FF5FC

.branch0FF7F8
#_0FF7F8: SEP #$20
#_0FF7FA: INX
#_0FF7FB: LDA.l UNREACH_1AF802,X

#_0FF7FF: REP #$20
#_0FF801: AND.w #$00FF
#_0FF804: TAY

.branch0FF805
#_0FF805: JSR routine0FF81B
#_0FF808: DEY
#_0FF809: BNE .branch0FF805

#_0FF80B: STX.w $0D0F
#_0FF80E: BRA .branch0FF813

.branch0FF810
#_0FF810: JSR routine0FF81B

.branch0FF813
#_0FF813: REP #$20
#_0FF815: INC.w $0D0F
#_0FF818: JMP .branch0FF5CE

routine0FF81B:
#_0FF81B: SEP #$20
#_0FF81D: PHY
#_0FF81E: LDA.w $0D14

#_0FF821: REP #$20
#_0FF823: AND.w #$00FF
#_0FF826: TAY

.branch0FF827
#_0FF827: JSR routine0FED63
#_0FF82A: DEY
#_0FF82B: BNE .branch0FF827

#_0FF82D: PLY
#_0FF82E: RTS

;===================================================================================================

routine0FF82F:
#_0FF82F: PHP
#_0FF830: SEP #$20
#_0FF832: REP #$10
#_0FF834: LDA.b #$80
#_0FF836: STA.w VMAIN
#_0FF839: LDA.b #$00
#_0FF83B: STA.w VMADDL
#_0FF83E: LDA.b #$3C
#_0FF840: STA.w VMADDH
#_0FF843: LDY.w #$0200

.branch0FF846
#_0FF846: LDA.b #$00
#_0FF848: STA.w VMDATAL
#_0FF84B: LDA.b #$00
#_0FF84D: STA.w VMDATAH
#_0FF850: DEY
#_0FF851: BNE .branch0FF846

#_0FF853: PLP
#_0FF854: RTS

;===================================================================================================

routine0FF855:
#_0FF855: PHP
#_0FF856: SEP #$20
#_0FF858: REP #$10
#_0FF85A: LDA.b #$80
#_0FF85C: STA.w VMAIN
#_0FF85F: LDA.b #$00
#_0FF861: STA.w VMADDL
#_0FF864: LDA.b #$3C
#_0FF866: STA.w VMADDH
#_0FF869: LDY.w #$0200
#_0FF86C: JMP .branch0FEB13

routine0FF86F:
#_0FF86F: PHP
#_0FF870: REP #$30
#_0FF872: JSR WaitForNMI_then_PreventTheNext
#_0FF875: JSR routine0FF93C
#_0FF878: JSR WaitForNMI_then_PreventTheNext

#_0FF87B: SEP #$20
#_0FF87D: LDA.b #$80
#_0FF87F: STA.w VMAIN
#_0FF882: LDA.b #$C3
#_0FF884: STA.w VMADDL
#_0FF887: LDA.b #$3D
#_0FF889: STA.w VMADDH
#_0FF88C: LDA.b #$E0
#_0FF88E: STA.w VMDATAL
#_0FF891: LDA.b #$20
#_0FF893: STA.w VMDATAH
#_0FF896: LDY.w #$0018

.branch0FF899
#_0FF899: LDA.b #$E9
#_0FF89B: STA.w VMDATAL
#_0FF89E: LDA.b #$20
#_0FF8A0: STA.w VMDATAH
#_0FF8A3: DEY
#_0FF8A4: BNE .branch0FF899

#_0FF8A6: LDA.b #$E0
#_0FF8A8: STA.w VMDATAL
#_0FF8AB: LDA.b #$60
#_0FF8AD: STA.w VMDATAH

#_0FF8B0: REP #$20
#_0FF8B2: LDA.w #$3DE3
#_0FF8B5: STA.w $0CF3
#_0FF8B8: LDX.w #$0008

.branch0FF8BB
#_0FF8BB: SEP #$20
#_0FF8BD: LDA.b #$80
#_0FF8BF: STA.w VMAIN
#_0FF8C2: LDA.w $0CF3
#_0FF8C5: STA.w VMADDL
#_0FF8C8: LDA.w $0CF4
#_0FF8CB: STA.w VMADDH
#_0FF8CE: LDA.b #$E8
#_0FF8D0: STA.w VMDATAL
#_0FF8D3: LDA.b #$60
#_0FF8D5: STA.w VMDATAH
#_0FF8D8: LDY.w #$0018

.branch0FF8DB
#_0FF8DB: LDA.b #$CF
#_0FF8DD: STA.w VMDATAL
#_0FF8E0: LDA.b #$20
#_0FF8E2: STA.w VMDATAH
#_0FF8E5: DEY
#_0FF8E6: BNE .branch0FF8DB

#_0FF8E8: LDA.b #$E8
#_0FF8EA: STA.w VMDATAL
#_0FF8ED: LDA.b #$20
#_0FF8EF: STA.w VMDATAH

#_0FF8F2: REP #$20
#_0FF8F4: CLC
#_0FF8F5: LDA.w $0CF3
#_0FF8F8: ADC.w #$0020
#_0FF8FB: STA.w $0CF3

#_0FF8FE: SEP #$20
#_0FF900: DEX
#_0FF901: BNE .branch0FF8BB

#_0FF903: SEP #$20
#_0FF905: LDA.b #$80
#_0FF907: STA.w VMAIN
#_0FF90A: LDA.w $0CF3
#_0FF90D: STA.w VMADDL
#_0FF910: LDA.w $0CF4
#_0FF913: STA.w VMADDH
#_0FF916: LDA.b #$E0
#_0FF918: STA.w VMDATAL
#_0FF91B: LDA.b #$A0
#_0FF91D: STA.w VMDATAH
#_0FF920: LDY.w #$0018

.branch0FF923
#_0FF923: LDA.b #$E9
#_0FF925: STA.w VMDATAL
#_0FF928: LDA.b #$A0
#_0FF92A: STA.w VMDATAH
#_0FF92D: DEY
#_0FF92E: BNE .branch0FF923

#_0FF930: LDA.b #$E0
#_0FF932: STA.w VMDATAL
#_0FF935: LDA.b #$E0
#_0FF937: STA.w VMDATAH
#_0FF93A: PLP
#_0FF93B: RTS

;===================================================================================================

routine0FF93C:
#_0FF93C: PHP
#_0FF93D: REP #$20
#_0FF93F: LDA.w #$3C00
#_0FF942: STA.w $0CF3

#_0FF945: SEP #$20
#_0FF947: LDY.w #$0010

.branch0FF94A
#_0FF94A: PHY
#_0FF94B: LDA.b #$80
#_0FF94D: STA.w VMAIN
#_0FF950: LDA.w $0CF3
#_0FF953: STA.w VMADDL
#_0FF956: LDA.w $0CF4
#_0FF959: STA.w VMADDH
#_0FF95C: JSR routine0FF933
#_0FF95F: JSR routine0FF933
#_0FF962: LDA.b #$80
#_0FF964: STA.w VMAIN

#_0FF967: REP #$20
#_0FF969: CLC
#_0FF96A: LDA.w $0CF3
#_0FF96D: ADC.w #$001E

#_0FF970: SEP #$20
#_0FF972: STA.w VMADDL
#_0FF975: XBA
#_0FF976: STA.w VMADDH
#_0FF979: JSR routine0FF933
#_0FF97C: JSR routine0FF933

#_0FF97F: REP #$20
#_0FF981: CLC
#_0FF982: LDA.w $0CF3
#_0FF985: ADC.w #$0020
#_0FF988: STA.w $0CF3

#_0FF98B: SEP #$20
#_0FF98D: PLY
#_0FF98E: DEY
#_0FF98F: BNE .branch0FF94A

#_0FF991: PLP
#_0FF992: RTS

;===================================================================================================

routine0FF933:
#_0FF993: SEP #$20
#_0FF995: LDA.b #$CF
#_0FF997: STA.w VMDATAL
#_0FF99A: LDA.b #$20
#_0FF99C: STA.w VMDATAH
#_0FF99F: RTS

;===================================================================================================

routine0FF9A0:
#_0FF9A0: PHP
#_0FF9A1: REP #$30
#_0FF9A3: LDA.w #$0001
#_0FF9A6: STA.w $0D19
#_0FF9A9: JSR DisableNMI_B0F
#_0FF9AC: JSR routine0FCC37
#_0FF9AF: JSR routine0FCC11
#_0FF9B2: JSR EnableNMI_B0F
#_0FF9B5: JSR routine0FCA3C
#_0FF9B8: JSR routine0FF9BD
#_0FF9BB: PLP
#_0FF9BC: RTS

;===================================================================================================

routine0FF9BD:
#_0FF9BD: PHP
#_0FF9BE: REP #$30
#_0FF9C0: JSR WaitForNMI_then_PreventTheNext
#_0FF9C3: JSR routine0FFA42
#_0FF9C6: JSR WaitForNMI_then_PreventTheNext

#_0FF9C9: SEP #$20
#_0FF9CB: LDA.b #$80
#_0FF9CD: STA.w OAMADDL
#_0FF9D0: LDA.b #$00
#_0FF9D2: STA.w OAMADDH
#_0FF9D5: LDA.b #$74
#_0FF9D7: STA.w OAMDATA
#_0FF9DA: LDA.b #$B0
#_0FF9DC: STA.w OAMDATA
#_0FF9DF: LDA.b #$00
#_0FF9E1: STA.w OAMDATA
#_0FF9E4: LDA.b #$03
#_0FF9E6: STA.w OAMDATA
#_0FF9E9: JSR routine0FFA36
#_0FF9EC: JSR routine0FFA36

#_0FF9EF: REP #$20
#_0FF9F1: LDA.w #$5000
#_0FF9F4: STA.w $0D11

#_0FF9F7: SEP #$20
#_0FF9F9: LDA.b #$0F
#_0FF9FB: JSR routine0FF4C1
#_0FF9FE: JSR routine0FFA36

#_0FFA01: REP #$20
#_0FFA03: LDA.w #$5010
#_0FFA06: STA.w $0D11

#_0FFA09: SEP #$20
#_0FFA0B: LDA.b #$18
#_0FFA0D: JSR routine0FF4C1
#_0FFA10: JSR routine0FFA36

#_0FFA13: REP #$20
#_0FFA15: LDA.w #$5020
#_0FFA18: STA.w $0D11

#_0FFA1B: SEP #$20
#_0FFA1D: LDA.b #$0E
#_0FFA1F: JSR routine0FF4C1
#_0FFA22: JSR routine0FFA36

#_0FFA25: REP #$20
#_0FFA27: LDA.w #$5030
#_0FFA2A: STA.w $0D11

#_0FFA2D: SEP #$20
#_0FFA2F: LDA.b #$9B
#_0FFA31: JSR routine0FF4C1
#_0FFA34: PLP
#_0FFA35: RTS

;===================================================================================================

routine0FFA36:
#_0FFA36: REP #$10
#_0FFA38: LDY.w #$0060

.branch0FFA3B
#_0FFA3B: JSR WaitForNMI_then_PreventTheNext
#_0FFA3E: DEY
#_0FFA3F: BNE .branch0FFA3B

#_0FFA41: RTS

;===================================================================================================

routine0FFA42:
#_0FFA42: PHP
#_0FFA43: REP #$10
#_0FFA45: SEP #$20
#_0FFA47: LDA.b #$90
#_0FFA49: STA.w CGADD
#_0FFA4C: LDY.w #$0008
#_0FFA4F: LDX.w #$0000
#_0FFA52: JMP .branch0FF196

routine0FFA55:
#_0FFA55: PHP
#_0FFA56: PHX
#_0FFA57: PHY
#_0FFA58: LDA.w $0CF7
#_0FFA5B: CMP.b #$01
#_0FFA5D: BNE .branch0FFA93

#_0FFA5F: SEP #$20
#_0FFA61: LDA.b #$38
#_0FFA63: STA.l $7E22FE
#_0FFA67: LDA.b #$02
#_0FFA69: STA.l $7E22FF

#_0FFA6D: REP #$20
#_0FFA6F: LDA.w $0D03
#_0FFA72: INC A
#_0FFA73: STA.w $0D03
#_0FFA76: AND.w #$0008
#_0FFA79: LSR A
#_0FFA7A: TAX
#_0FFA7B: LDA.l data0FFA97,X
#_0FFA7F: STA.l $7E2300
#_0FFA83: LDA.l data0FFA99,X
#_0FFA87: STA.l $7E2302

#_0FFA8B: SEP #$20
#_0FFA8D: LDA.b #$01
#_0FFA8F: STA.l $7E22FD

.branch0FFA93
#_0FFA93: PLY
#_0FFA94: PLX
#_0FFA95: PLP
#_0FFA96: RTS

data0FFA97:
#_0FFA97: db $9C,$01

data0FFA99:
#_0FFA99: db $9C,$12,$9C,$12,$9C,$01,$03,$21
#_0FFAA1: db $A9,$74,$8D,$04,$21,$A9,$B0,$8D
#_0FFAA9: db $04,$21,$A9,$00,$8D,$04,$21,$A9
#_0FFAB1: db $03,$8D,$04,$21,$20,$02,$FB,$20
#_0FFAB9: db $02,$FB,$C2,$20,$A9,$00,$50,$8D
#_0FFAC1: db $11,$0D,$E2,$20,$A9,$0F,$20,$8D
#_0FFAC9: db $F5,$20,$02,$FB,$C2,$20,$A9,$10
#_0FFAD1: db $50,$8D,$11,$0D,$E2,$20,$A9,$18
#_0FFAD9: db $20,$8D,$F5,$20,$02,$FB,$C2,$20
#_0FFAE1: db $A9,$20,$50,$8D,$11,$0D,$E2,$20
#_0FFAE9: db $A9,$0E,$20,$8D,$F5,$20,$02,$FB

; TODO POSSIBLY UNUSED ROUTINE
routine0FFAF1:
#_0FFAF1: REP #$20 ; I think these are all scrapped routines
#_0FFAF3: LDA.w #$5030
#_0FFAF6: STA.w $0D11

#_0FFAF9: SEP #$20
#_0FFAFB: LDA.b #$9B
#_0FFAFD: JSR routine0FF58D
#_0FFB00: PLP
#_0FFB01: RTS

#_0FFB02: REP #$10
#_0FFB04: LDY.w #$0060

.branch0FFB07
#_0FFB07: JSR routine0FD95E
#_0FFB0A: DEY
#_0FFB0B: BNE .branch0FFB07

#_0FFB0D: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine0FFB0E:
#_0FFB0E: PHP
#_0FFB0F: REP #$10
#_0FFB11: SEP #$20
#_0FFB13: LDA.b #$90
#_0FFB15: STA.w CGADD
#_0FFB18: LDY.w #$0008
#_0FFB1B: LDX.w #$0000
#_0FFB1E: JMP.w $0FF262 ; loose op

; TODO POSSIBLY UNUSED ROUTINE
routine0FFB21:
#_0FFB21: PHP
#_0FFB22: PHX
#_0FFB23: PHY
#_0FFB24: LDA.w $0CF7
#_0FFB27: CMP.b #$01
#_0FFB29: BNE .branch0FFB5F

#_0FFB2B: SEP #$20
#_0FFB2D: LDA.b #$38
#_0FFB2F: STA.l $7E22FE
#_0FFB33: LDA.b #$02
#_0FFB35: STA.l $7E22FF

#_0FFB39: REP #$20
#_0FFB3B: LDA.w $0D03
#_0FFB3E: INC A
#_0FFB3F: STA.w $0D03
#_0FFB42: AND.w #$0008
#_0FFB45: LSR A
#_0FFB46: TAX
#_0FFB47: LDA.l data0FFB63,X
#_0FFB4B: STA.l $7E2300
#_0FFB4F: LDA.l data0FFB65,X
#_0FFB53: STA.l $7E2302

#_0FFB57: SEP #$20
#_0FFB59: LDA.b #$01
#_0FFB5B: STA.l $7E22FD

.branch0FFB5F
#_0FFB5F: PLY
#_0FFB60: PLX
#_0FFB61: PLP
#_0FFB62: RTS

data0FFB63:
#_0FFB63: db $9C,$01

data0FFB65:
#_0FFB65: db $9C,$12,$9C,$12,$9C,$01,$E9,$FB
#_0FFB6D: db $20,$39,$DA

; TODO POSSIBLY UNUSED ROUTINE
routine0FFB70:
#_0FFB70: SEP #$20
#_0FFB72: LDA.b #$80
#_0FFB74: STA.w OAMADDL
#_0FFB77: LDA.b #$00
#_0FFB79: STA.w OAMADDH
#_0FFB7C: LDA.b #$74
#_0FFB7E: STA.w OAMDATA
#_0FFB81: LDA.b #$B0
#_0FFB83: STA.w OAMDATA
#_0FFB86: LDA.b #$00
#_0FFB88: STA.w OAMDATA
#_0FFB8B: LDA.b #$03
#_0FFB8D: STA.w OAMDATA
#_0FFB90: JSR routine0FFBDD
#_0FFB93: JSR routine0FFBDD

#_0FFB96: REP #$20
#_0FFB98: LDA.w #$5000
#_0FFB9B: STA.w $0D11

#_0FFB9E: SEP #$20
#_0FFBA0: LDA.b #$0F
#_0FFBA2: JSR routine0FF668
#_0FFBA5: JSR routine0FFBDD

#_0FFBA8: REP #$20
#_0FFBAA: LDA.w #$5010
#_0FFBAD: STA.w $0D11

#_0FFBB0: SEP #$20
#_0FFBB2: LDA.b #$18
#_0FFBB4: JSR routine0FF668
#_0FFBB7: JSR routine0FFBDD

#_0FFBBA: REP #$20
#_0FFBBC: LDA.w #$5020
#_0FFBBF: STA.w $0D11

#_0FFBC2: SEP #$20
#_0FFBC4: LDA.b #$0E
#_0FFBC6: JSR routine0FF668
#_0FFBC9: JSR routine0FFBDD

#_0FFBCC: REP #$20

#_0FFBCE: LDA.w #$5030
#_0FFBD1: STA.w $0D11

#_0FFBD4: SEP #$20
#_0FFBD6: LDA.b #$9B
#_0FFBD8: JSR routine0FF668
#_0FFBDB: PLP
#_0FFBDC: RTS

;===================================================================================================

routine0FFBDD:
#_0FFBDD: REP #$10
#_0FFBDF: LDY.w #$0060

.branch0FFBE2
#_0FFBE2: JSR DATA16_0FDA39
#_0FFBE5: DEY
#_0FFBE6: BNE .branch0FFBE2

#_0FFBE8: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine0FFBE9:
#_0FFBE9: PHP
#_0FFBEA: REP #$10
#_0FFBEC: SEP #$20
#_0FFBEE: LDA.b #$90
#_0FFBF0: STA.w CGADD
#_0FFBF3: LDY.w #$0008
#_0FFBF6: LDX.w #$0000
#_0FFBF9: JMP .branch0FF33D

; TODO POSSIBLY UNUSED ROUTINE
routine0FFBFC:
#_0FFBFC: PHP
#_0FFBFD: PHX
#_0FFBFE: PHY
#_0FFBFF: LDA.w $0CF7
#_0FFC02: CMP.b #$01
#_0FFC04: BNE .branch0FFC3A

#_0FFC06: SEP #$20
#_0FFC08: LDA.b #$38
#_0FFC0A: STA.l $7E22FE
#_0FFC0E: LDA.b #$02
#_0FFC10: STA.l $7E22FF

#_0FFC14: REP #$20
#_0FFC16: LDA.w $0D03
#_0FFC19: INC A
#_0FFC1A: STA.w $0D03
#_0FFC1D: AND.w #$0008
#_0FFC20: LSR A
#_0FFC21: TAX
#_0FFC22: LDA.l DATA8_0FFC3E,X
#_0FFC26: STA.l $7E2300
#_0FFC2A: LDA.l DATA8_0FFC40,X
#_0FFC2E: STA.l $7E2302

#_0FFC32: SEP #$20
#_0FFC34: LDA.b #$01
#_0FFC36: STA.l $7E22FD

.branch0FFC3A
#_0FFC3A: PLY
#_0FFC3B: PLX
#_0FFC3C: PLP
#_0FFC3D: RTS

; TODO POSSIBLY UNUSED DATA
; TODO MERGE
; looks like X can be 0-4 so those AA AA go
DATA8_0FFC3E:
#_0FFC3E: db $9C,$01

DATA8_0FFC40:
#_0FFC40: db $9C,$12,$9C,$12,$9C,$01,$AA,$AA
#_0FFC48: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFC50: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFC58: db $AA,$AA,$AA,$AA,$AA,$AA,$2A,$AA
#_0FFC60: db $AA,$AA,$AA,$AA,$AA,$AA,$8A,$8A
#_0FFC68: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFC70: db $AA,$AA,$AA,$AA,$AA,$A8,$AA,$AA
#_0FFC78: db $2A,$AA,$AA,$AA,$A2,$AA,$8A,$AA
#_0FFC80: db $AE,$AA,$AE,$AA,$AA,$AA,$AA,$AA
#_0FFC88: db $AA,$AA,$AB,$AA,$EE,$AA,$AA,$AA
#_0FFC90: db $AE,$AA,$AA,$AB,$AA,$AA,$AA,$AA
#_0FFC98: db $BE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFCA0: db $AA,$AA,$FA,$BE,$AA,$AE,$AA,$AA
#_0FFCA8: db $AB,$AA,$AA,$AA,$EE,$AA,$AA,$AA
#_0FFCB0: db $EA,$EA,$AA,$EA,$AA,$EA,$AE,$AA
#_0FFCB8: db $AA,$AA,$EA,$AA,$AA,$AA,$AA,$AA
#_0FFCC0: db $AA,$AA,$AA,$AA,$AA,$BE,$AA,$AE
#_0FFCC8: db $AE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFCD0: db $AA,$AA,$AF,$AA,$AA,$AA,$AF,$EA
#_0FFCD8: db $AA,$AA,$EA,$AA,$AA,$AA,$AE,$EA
#_0FFCE0: db $AA,$AE,$EA,$AE,$AA,$AA,$AA,$AA
#_0FFCE8: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFCF0: db $AA,$AE,$AE,$AA,$AA,$AB,$AB,$AA
#_0FFCF8: db $AA,$AA,$AA,$AA,$BA,$AA,$AA,$AA
#_0FFD00: db $AA,$AA,$AA,$AA,$BA,$8A,$AA,$8A
#_0FFD08: db $AA,$AA,$AA,$A8,$AA,$AA,$AA,$AA
#_0FFD10: db $AA,$2A,$AA,$2A,$AA,$AA,$A8,$AA
#_0FFD18: db $A6,$AA,$AA,$AA,$EA,$AA,$AA,$AA
#_0FFD20: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFD28: db $AA,$AA,$A2,$AA,$AA,$AA,$EA,$AA
#_0FFD30: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFD38: db $AA,$AA,$AA,$AA,$A2,$AA,$AA,$A8
#_0FFD40: db $AA,$AA,$A2,$8A,$2A,$AA,$AA,$2A
#_0FFD48: db $8A,$AA,$AA,$2A,$8A,$AA,$AA,$AA
#_0FFD50: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFD58: db $A2,$AA,$8A,$AA,$8A,$AA,$8A,$AA
#_0FFD60: db $AA,$AA,$A2,$AA,$22,$2A,$AA,$AA
#_0FFD68: db $2C,$AA,$A2,$8A,$AA,$AA,$A2,$A8
#_0FFD70: db $AA,$AA,$8A,$AA,$AA,$A0,$A2,$AA
#_0FFD78: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFD80: db $EA,$AA,$AA,$AA,$AA,$AA,$AA,$AF
#_0FFD88: db $AA,$AA,$AE,$AA,$AA,$AA,$AA,$AA
#_0FFD90: db $AA,$AA,$AA,$AA,$AA,$AA,$FE,$AA
#_0FFD98: db $AA,$EA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFDA0: db $AA,$EE,$FA,$EA,$AA,$AA,$A8,$AA
#_0FFDA8: db $AF,$AA,$AE,$AA,$FA,$EA,$AA,$AA
#_0FFDB0: db $AA,$AA,$BA,$AA,$AA,$EA,$AA,$AA
#_0FFDB8: db $AA,$AA,$EB,$AA,$AA,$AA,$AA,$AA
#_0FFDC0: db $AA,$AA,$AA,$AA,$E8,$AA,$AE,$AE
#_0FFDC8: db $EA,$AA,$FA,$AA,$AA,$EA,$EA,$AA
#_0FFDD0: db $AA,$EA,$AE,$AA,$AB,$AE,$AA,$AA
#_0FFDD8: db $AB,$AA,$AB,$AA,$AA,$AA,$AA,$AA
#_0FFDE0: db $AE,$AA,$BA,$EA,$E8,$AA,$BE,$AF
#_0FFDE8: db $AE,$AA,$AA,$AB,$AA,$AA,$AA,$EA
#_0FFDF0: db $AA,$AA,$AA,$AA,$FA,$AA,$AA,$AA
#_0FFDF8: db $BE,$AA,$AA,$AB,$AA,$AA,$AA,$AE
#_0FFE00: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE08: db $2A,$8A,$8A,$AA,$AA,$AA,$AA,$AA
#_0FFE10: db $AA,$AA,$8A,$AA,$A2,$AA,$A8,$AA
#_0FFE18: db $A8,$AA,$AA,$AA,$AA,$AA,$AA,$8A
#_0FFE20: db $AA,$AA,$A2,$AA,$AA,$AA,$AA,$AA
#_0FFE28: db $AA,$AA,$A8,$AA,$AA,$AA,$AA,$AA
#_0FFE30: db $AA,$AA,$A2,$8A,$AA,$AA,$AA,$AA
#_0FFE38: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE40: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE48: db $2A,$AA,$A8,$AA,$A2,$2A,$AA,$AA
#_0FFE50: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE58: db $AA,$AA,$AA,$AA,$AA,$AA,$8A,$AA
#_0FFE60: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE68: db $A2,$AA,$8A,$AA,$2A,$AA,$AA,$AA
#_0FFE70: db $AA,$AA,$AA,$AA,$A8,$AA,$AA,$AA
#_0FFE78: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFE80: db $AB,$AA,$BA,$AA,$BA,$AA,$AA,$AA
#_0FFE88: db $2A,$BA,$FA,$AA,$AA,$AA,$AB,$AA
#_0FFE90: db $AA,$AA,$AA,$AB,$AA,$EA,$AA,$AA
#_0FFE98: db $AA,$AA,$AA,$AA,$BA,$AA,$AA,$AA
#_0FFEA0: db $EE,$EA,$AA,$AA,$AE,$AE,$AA,$AA
#_0FFEA8: db $AA,$AA,$AA,$AA,$AA,$AA,$AB,$AA
#_0FFEB0: db $AF,$AA,$AA,$AA,$AB,$AA,$AA,$AA
#_0FFEB8: db $AB,$EA,$AA,$AB,$EA,$AA,$AA,$AA
#_0FFEC0: db $AE,$AA,$A6,$BE,$AA,$AA,$AA,$AA
#_0FFEC8: db $AA,$AE,$AA,$AA,$AE,$EA,$AB,$AA
#_0FFED0: db $AA,$EA,$AA,$AA,$AE,$AA,$AB,$AA
#_0FFED8: db $AE,$AA,$BA,$AE,$B3,$AA,$AA,$AA
#_0FFEE0: db $EA,$AE,$AA,$AA,$AB,$AA,$AA,$AA
#_0FFEE8: db $8A,$AA,$AA,$EB,$EA,$AA,$AA,$AA
#_0FFEF0: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AE
#_0FFEF8: db $AA,$AA,$AA,$AA,$AA,$AB,$AE,$AA
#_0FFF00: db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFF08: db $A8,$AA,$AA,$AA,$A2,$AA,$AA,$2A
#_0FFF10: db $A7,$AA,$2A,$AA,$2A,$AA,$AA,$A8
#_0FFF18: db $24,$A2,$2A,$AB,$88,$AA,$AA,$AA
#_0FFF20: db $AA,$BA,$AA,$8A,$8A,$AA,$AA,$AA
#_0FFF28: db $A6,$AA,$A8,$AA,$A2,$2A,$AA,$2A
#_0FFF30: db $A8,$AA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFF38: db $AA,$A2,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFF40: db $AA,$AA,$A2,$AA,$A6,$AA,$AA,$AA
#_0FFF48: db $AE,$A2,$AA,$AA,$AA,$AA,$AA,$A2
#_0FFF50: db $AA,$20,$AA,$A2,$A2,$AA,$AA,$AA
#_0FFF58: db $AA,$A8,$2A,$AA,$8A,$AA,$AA,$A8
#_0FFF60: db $A2,$AA,$AA,$AA,$8A,$AA,$AA,$AA
#_0FFF68: db $AA,$AA,$AA,$AA,$AA,$A8,$AE,$AA
#_0FFF70: db $2A,$EA,$AA,$AA,$AA,$AA,$AA,$AA
#_0FFF78: db $AA,$8A,$2A,$AA,$8A,$AA,$AA,$AA
#_0FFF80: db $AA,$AB,$AA,$AE,$AE,$AA,$AE,$EA
#_0FFF88: db $EA,$AB,$AA,$AA,$EA,$AA,$AA,$AA
#_0FFF90: db $AA,$AA,$AA,$AA,$AB,$8A,$BE,$EA
#_0FFF98: db $AE,$AA,$AA,$AA,$BE,$AA,$BA,$AE
#_0FFFA0: db $EA,$AA,$EA,$EA,$AA,$EA,$AA,$AA
#_0FFFA8: db $AA,$AE,$AA,$AA,$AA,$AA,$BA,$BA
#_0FFFB0: db $AA,$AA,$AA,$EA,$AB,$BE,$BA,$AA
#_0FFFB8: db $BE,$AA,$BB,$AA,$BE,$EA,$AE,$AA
#_0FFFC0: db $E2,$AE,$AA,$AE,$A0,$AA,$EA,$AA
#_0FFFC8: db $EA,$AE,$BA,$AA,$A2,$AA,$AA,$EA
#_0FFFD0: db $AA,$AA,$AA,$AA,$AA,$AA,$EA,$EA
#_0FFFD8: db $AA,$AA,$AA,$AA,$BA,$AA,$AA,$AA
#_0FFFE0: db $AA,$AA,$EA,$AE,$EE,$AA,$AA,$AA
#_0FFFE8: db $AA,$AA,$AA,$AA,$AA,$AE,$EA,$BA
#_0FFFF0: db $FE,$EA,$AA,$AA,$EB,$AE,$AE,$AA
#_0FFFF8: db $EC,$AA,$AA,$AA,$BA,$BE,$AA,$AA
