org $038000

;===================================================================================================

routine038000:
#_038000: SEP #$30

#_038002: STZ.w $0A58
#_038005: STZ.w $0C4E

#_038008: JSR routine0384F9
#_03800B: JSL RunFramesUntilDrawBufferEmpties
#_03800F: JSL ResetMenuRowAndColumn
#_038013: JSL routine0380FA

#_038017: REP #$20
#_038019: SEP #$10

#_03801B: LDX.b #$00
#_03801D: LDY.b #$00
#_03801F: LDA.w $0E00
#_038022: BNE .branch038027

#_038024: JMP .branch0380C5

.branch038027
#_038027: ROR A
#_038028: BCC .branch038038

#_03802A: PHA

#_03802B: PHP
#_03802C: SEP #$20

#_03802E: TYA
#_03802F: STA.w $0C44,X

#_038032: PLP
#_038033: PLA

#_038034: JSR routine038176

#_038037: INX

.branch038038
#_038038: INY
#_038039: CPY.b #$0E
#_03803B: BNE .branch038027

;---------------------------------------------------------------------------------------------------

#_03803D: SEP #$30
#_03803F: TXA
#_038040: LSR A
#_038041: STA.w $09FB
#_038044: STA.w $09FC
#_038047: BCC .branch03804C

#_038049: INC.w $09FB

.branch03804C
#_03804C: LDA.b #$01
#_03804E: STA.w $09F0
#_038051: DEC.w $09FB
#_038054: DEC.w $09FC
#_038057: BPL .branch03805C

#_038059: DEC.w $09F0

.branch03805C
#_03805C: LDA.w $09FB
#_03805F: STA.w $09F1

#_038062: LDA.b #$03
#_038064: STA.w $09F4

#_038067: STZ.w $09F2
#_03806A: STZ.w $09F3
#_03806D: JSL routine02C8E9

#_038071: SEP #$30

#_038073: LDA.w $09F3
#_038076: BMI .branch0380BB

#_038078: ASL A
#_038079: CLC
#_03807A: ADC.w $09F2
#_03807D: TAX

#_03807E: LDA.w $0C44,X
#_038081: STA.w $0C4E
#_038084: STA.w $0BE2
#_038087: STA.w $07E1

#_03808A: ASL A
#_03808B: CLC
#_03808C: ADC.w $0BE2
#_03808F: TAY

#_038090: LDA.w .terminals+0,Y
#_038093: STA.w $070C

#_038096: LDA.w .terminals+1,Y
#_038099: PHA

#_03809A: AND.b #$3F
#_03809C: STA.w $070D

#_03809F: PLA
#_0380A0: ASL A
#_0380A1: ROL A
#_0380A2: ROL A
#_0380A3: AND.b #$03
#_0380A5: STA.w $040D

#_0380A8: LDA.w .terminals+2,Y
#_0380AB: STA.w $0710

#_0380AE: STZ.w $05A6
#_0380B1: STZ.w $05A7

#_0380B4: JSR routine038B8E
#_0380B7: JSR GetNextTextByte

#_0380BA: RTS

;---------------------------------------------------------------------------------------------------

.branch0380BB
#_0380BB: JSR routine038B8E

#_0380BE: JSR GetNextTextByte
#_0380C1: JSR ChangeMessageID

#_0380C4: RTS

;---------------------------------------------------------------------------------------------------

.branch0380C5
#_0380C5: SEP #$30

#_0380C7: JSR GetNextTextByte

#_0380CA: LDA.b #$FF
#_0380CC: STA.w $0A58

#_0380CF: RTS

;---------------------------------------------------------------------------------------------------

; TODO bit 6/7 of Y
.terminals
#_0380D0: db $17, $04, $00 ; Echo building
#_0380D3: db $12, $0A, $04 ; Laboratory
#_0380D6: db $3F, $86, $08 ; Shinjuku
#_0380D9: db $67, $50, $0F ; Ikebukuro
#_0380DC: db $27, $58, $0B ; Ginza
#_0380DF: db $4C, $1D, $0E ; Shinagawa
#_0380E2: db $71, $98, $10 ; Ueno
#_0380E5: db $2A, $AB, $13 ; Cathedral Chaos
#_0380E8: db $2F, $7C, $13 ; Cathedral Law
#_0380EB: db $6D, $0E, $08 ; Roppongi
#_0380EE: db $06, $ED, $11 ; T.D.L.
#_0380F1: db $53, $0C, $06 ; Shibuya
#_0380F4: db $1E, $2D, $07 ; Tokyo tower
#_0380F7: db $3A, $34, $08 ; Government Office

;===================================================================================================

routine0380FA:
#_0380FA: PHP

#_0380FB: PHB
#_0380FC: PHK
#_0380FD: PLB

#_0380FE: REP #$30

#_038100: LDA.w $0BE2
#_038103: AND.w #$00FF
#_038106: ASL A
#_038107: TAY

#_038108: LDA.w .bits,Y
#_03810B: ORA.w $07F3
#_03810E: AND.w #$3FFF
#_038111: STA.w $07F3

#_038114: LDA.w .bits,Y
#_038117: EOR.w #$FFFF
#_03811A: STA.w $0E02

#_03811D: LDA.w #$002F
#_038120: JSL TestGameProgressBit
#_038124: BCS .nuked

; flag echo building and lab
#_038126: LDA.w $07F3
#_038129: ORA.w #$0003
#_03812C: STA.w $0E00

#_03812F: BRA .unflag_terminals

;---------------------------------------------------------------------------------------------------

.nuked
#_038131: LDA.w #$009E
#_038134: JSL TestGameProgressBit
#_038138: BCS .flooded

; removes echo building and lab
#_03813A: LDA.w $07F3
#_03813D: AND.w #$FFFC
#_038140: STA.w $0E00

#_038143: BRA .unflag_terminals

.flooded
#_038145: LDA.w $07F3
#_038148: AND.w #$3180
#_03814B: STA.w $0E00

.unflag_terminals
#_03814E: LDA.w $0E00
#_038151: AND.w $0E02
#_038154: STA.w $0E00

#_038157: PLB
#_038158: PLP
#_038159: RTL

;---------------------------------------------------------------------------------------------------

.bits
#_03815A: dw $0001 ; Echo building
#_03815C: dw $0002 ; Laboratory
#_03815E: dw $0004 ; Shinjuku
#_038160: dw $0008 ; Ikebukuro
#_038162: dw $0010 ; Ginza
#_038164: dw $0020 ; Shinagawa
#_038166: dw $0040 ; Ueno
#_038168: dw $0080 ; Cathedral Chaos
#_03816A: dw $0100 ; Cathedral Law
#_03816C: dw $0200 ; Roppongi
#_03816E: dw $0400 ; T.D.L.
#_038170: dw $0800 ; Shibuya
#_038172: dw $1000 ; Tokyo tower
#_038174: dw $2000 ; Government Office

;===================================================================================================

routine038176:
#_038176: PHP

#_038177: REP #$30

#_038179: PHA
#_03817A: PHX
#_03817B: PHY

#_03817C: PHD
#_03817D: PHB

; redundant
#_03817E: REP #$30

#_038180: TXA
#_038181: AND.w #$00FF
#_038184: ASL A
#_038185: TAX

#_038186: LDA.w $0A1A
#_038189: CLC
#_03818A: ADC.w .positions,X
#_03818D: STA.w $0980

#_038190: SEP #$20

#_038192: STZ.w $0A33

#_038195: LDA.b #$08
#_038197: STA.w $00C5

#_03819A: REP #$20

#_03819C: TYA
#_03819D: AND.w #$00FF
#_0381A0: STA.w $0A39

#_0381A3: LDA.w #TerminalDestinationNamePointers
#_0381A6: STA.w $00C3

#_0381A9: JSR WriteIndexedEntityName
#_0381AC: JSR routine0384F9
#_0381AF: JSL RunFramesUntilDrawBufferEmpties

#_0381B3: REP #$30

#_0381B5: PLB
#_0381B6: PLD

#_0381B7: PLY
#_0381B8: PLX
#_0381B9: PLA

#_0381BA: PLP
#_0381BB: RTS

.positions
#_0381BC: dw $0041, $004C
#_0381C0: dw $0081, $008C
#_0381C4: dw $00C1, $00CC
#_0381C8: dw $0101, $010C
#_0381CC: dw $0141, $014C
#_0381D0: dw $0181, $018C

;===================================================================================================

WriteCurrentTerminalName:
#_0381D4: SEP #$20

#_0381D6: LDA.w $07E1
#_0381D9: STA.w $0C4E

;===================================================================================================

WriteTerminalName:
#_0381DC: REP #$20

#_0381DE: LDA.w $0C4E
#_0381E1: AND.w #$00FF
#_0381E4: STA.w $0A39

#_0381E7: LDA.w #TerminalDestinationNamePointers
#_0381EA: STA.w $00C3

#_0381ED: LDA.w #TerminalDestinationNamePointers>>4
#_0381F0: STA.w $00C5

#_0381F3: JSR WriteIndexedEntityName

#_0381F6: RTS

;===================================================================================================

TextExtCMD_5D:
#_0381F7: JSL routine02CDBC
#_0381FB: JSL routine02CE87
#_0381FF: JSL routine0F84F6

#_038203: RTS

;===================================================================================================

routine038204:
#_038204: PHP

#_038205: JSL RunFramesUntilDrawBufferEmpties

#_038209: REP #$20
#_03820B: PHB

#_03820C: SEP #$20

#_03820E: LDA.b #routine038204>>16
#_038210: PHA

#_038211: REP #$20
#_038213: PLB

#_038214: LDA.w #$0003
#_038217: STA.w $0A2A

#_03821A: LDA.w #$3D83
#_03821D: STA.w $0A0B

#_038220: LDA.w #$3DC4
#_038223: STA.w $0A1A

#_038226: LDA.w #$001A
#_038229: STA.w $0A0D

#_03822C: LDA.w #$0010
#_03822F: STA.w $0A0F

#_038232: SEP #$20

#_038234: LDA.b #$11
#_038236: STA.w $0A11

#_038239: LDA.b #$00
#_03823B: STA.w INIDISP

#_03823E: STA.w $0F43
#_038241: JSL BrightenScreen

#_038245: LDA.b #$03
#_038247: JSL InitializeTextBoxToSizeForNewMessage
#_03824B: JSL routine00A056
#_03824F: JSL routine03837C

#_038253: PLB

#_038254: PLP
#_038255: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine0F8736_bounce:
#_038256: JSL routine0F8736
#_03825A: RTS

;===================================================================================================

RunFramesUntilDrawBufferEmpties:
#_03825B: PHP

#_03825C: REP #$30

#_03825E: PHA
#_03825F: PHX
#_038260: PHY

#_038261: PHD
#_038262: PHB

.loop
#_038263: SEP #$20

#_038265: JSL AddSelfAsVector

#_038269: LDA.w $0100
#_03826C: BNE .loop

#_03826E: REP #$30

#_038270: PLB
#_038271: PLD

#_038272: PLY
#_038273: PLX
#_038274: PLA

#_038275: PLP
#_038276: RTL

;===================================================================================================

routine038277:
#_038277: PHP

#_038278: REP #$30
#_03827A: STA.w $0E00

#_03827D: PHB
#_03827E: PHK
#_03827F: PLB

#_038280: JSL RunFramesUntilDrawBufferEmpties

#_038284: LDY.w #$0000

.loop
#_038287: PHY

#_038288: TYA
#_038289: ASL A ; x32
#_03828A: ASL A
#_03828B: ASL A
#_03828C: ASL A
#_03828D: ASL A
#_03828E: CLC
#_03828F: ADC.w $0A1A
#_038292: SEC
#_038293: SBC.w #$0020
#_038296: STA.w $0102

#_038299: LDA.w $0A1E
#_03829C: STA.w $0104
#_03829F: TAY

#_0382A0: LDX.w #$0000

.copy_next
#_0382A3: LDA.w $0E00
#_0382A6: STA.w $0106,X

#_0382A9: INX
#_0382AA: INX

#_0382AB: DEY
#_0382AC: BPL .copy_next

#_0382AE: LDA.w #$0001
#_0382B1: STA.w $0100

#_0382B4: JSL RunFramesUntilDrawBufferEmpties

#_0382B8: PLY
#_0382B9: INY
#_0382BA: CPY.w #$000E
#_0382BD: BNE .loop

#_0382BF: PLB
#_0382C0: PLP

#_0382C1: RTL

;===================================================================================================

; TODO
SetTextPointerFromMessageID:
#_0382C2: PHA
#_0382C3: PHX
#_0382C4: PHY

#_0382C5: PHP

#_0382C6: SEP #$20

#_0382C8: LDY.w $0A26

#_0382CB: LDA.w TextDataBanks,Y
#_0382CE: STA.w $00C2

#_0382D1: REP #$30

#_0382D3: LDA.w $0A26
#_0382D6: AND.w #$00FF
#_0382D9: ASL A
#_0382DA: TAX

; !WTF this tends to read from bank 07 when called via some menus
; Making this, generally, open bus then
; it doesn't matter though, as it shortly thereafter reads the correct values
; from bank03 when called again
#_0382DB: LDA.w TextDataBankStarts,X 
#_0382DE: STA.w $00C0

#_0382E1: LDA.w $0A24
#_0382E4: AND.w #$00FF
#_0382E7: ASL A
#_0382E8: TAY

#_0382E9: LDA.b [$C0],Y
#_0382EB: STA.w $00C0

#_0382EE: LDA.w $0A22
#_0382F1: ASL A
#_0382F2: TAY

#_0382F3: LDA.b [$C0],Y
#_0382F5: STA.w $00C0

#_0382F8: PLP

#_0382F9: PLY
#_0382FA: PLX
#_0382FB: PLA

#_0382FC: RTS

;===================================================================================================

ChangeMessageID_long:
#_0382FD: JSR ChangeMessageID

#_038300: RTL

;===================================================================================================
; 
;===================================================================================================
ChangeMessageID:
#_038301: PHP ; input: A for message ID in bank

#_038302: PHB
#_038303: PHK
#_038304: PLB

#_038305: SEP #$20

#_038307: PHA

#_038308: LDY.w $0A26

#_03830B: LDA.w TextDataBanks,Y
#_03830E: STA.w $00C2

#_038311: REP #$30

#_038313: LDA.w $0A26
#_038316: AND.w #$00FF
#_038319: ASL A
#_03831A: TAX

#_03831B: LDA.w TextDataBankStarts,X
#_03831E: STA.w $00C0

#_038321: LDA.w $0A24
#_038324: AND.w #$00FF
#_038327: ASL A
#_038328: TAY

#_038329: LDA.b [$C0],Y
#_03832B: STA.w $00C0

#_03832E: SEP #$20

#_038330: PLA

#_038331: REP #$20

#_038333: AND.w #$00FF
#_038336: ASL A
#_038337: TAY

#_038338: LDA.b [$C0],Y
#_03833A: STA.w $00C0

#_03833D: PLB
#_03833E: PLP

#_03833F: RTS

;===================================================================================================

TextDataBanks:
#_038340: db Message_00_Pointers>>16
#_038341: db Message_01_Pointers>>16
#_038342: db Message_02_Pointers>>16
#_038343: db Message_03_Pointers>>16

TextDataBankStarts:
#_038344: dw Message_00_Pointers
#_038346: dw Message_01_Pointers
#_038348: dw Message_02_Pointers
#_03834A: dw Message_03_Pointers

;===================================================================================================

routine03834C:
#_03834C: PHP

#_03834D: SEP #$20

#_03834F: PHB
#_038350: PHK
#_038351: PLB

#_038352: BRA HandleNextTextByte

;===================================================================================================
; Used for TALK in COMBAT
; 
;===================================================================================================
routine038354:
#_038354: PHP

#_038355: SEP #$20

#_038357: LDA.b #$01
#_038359: STA.w $0A3C
#_03835C: STZ.w $0A3D

#_03835F: STZ.w $0A4C

#_038362: LDA.w $0A22
#_038365: STA.w $0A4A

#_038368: LDA.b #$00
#_03836A: STA.w $0A22

#_03836D: LDA.b #$01
#_03836F: STA.w $0A24

#_038372: LDA.b #$02
#_038374: STA.w $0A26

#_038377: JSR SetTextPointerFromMessageID

#_03837A: BRA routine038358

;===================================================================================================

routine03837C:
#_03837C: PHP

#_03837D: SEP #$20

#_03837F: STZ.w $0A3C
#_038382: STZ.w $0A3D

;===================================================================================================

routine038358:
#_038385: STZ.w $0C4F

#_038388: PHB
#_038389: PHK
#_03838A: PLB

#_03838B: REP #$30

#_03838D: STZ.w $0CF3

#_038390: LDA.w $0A1A
#_038393: STA.w $0A2F

#_038396: LDA.w #$0003
#_038399: STA.w $0A2A

#_03839C: STZ.w $0A28

#_03839F: JSR SetTextPointerFromMessageID

#_0383A2: STZ.w $0A31

;===================================================================================================

routine0383A5:
#_0383A5: REP #$20

#_0383A7: LDA.w $0A2F
#_0383AA: STA.w $0980

#_0383AD: LDA.w $0A1C
#_0383B0: AND.w #$00FF
#_0383B3: ASL A ; x32
#_0383B4: ASL A
#_0383B5: ASL A
#_0383B6: ASL A
#_0383B7: ASL A
#_0383B8: CLC
#_0383B9: ADC.w $0A2F
#_0383BC: STA.w $0A2F

#_0383BF: SEP #$20

#_0383C1: STZ.w $0A33

;===================================================================================================

HandleNextTextByte:
#_0383C4: SEP #$30

#_0383C6: LDY.b #$00

#_0383C8: LDA.b [$C0],Y
#_0383CA: STA.w $0A2D

#_0383CD: REP #$20

#_0383CF: INC.w $00C0

#_0383D2: SEP #$20

#_0383D4: CMP.b #$D0
#_0383D6: BCS .command

#_0383D8: JSL WriteNextMessageChar

#_0383DC: BRA HandleNextTextByte

;---------------------------------------------------------------------------------------------------

.command
#_0383DE: REP #$20

#_0383E0: LDA.w #.return-1
#_0383E3: PHA

#_0383E4: SEP #$20

#_0383E6: LDY.w $0A3C

#_0383E9: LDA.w $0A2D
#_0383EC: SEC
#_0383ED: SBC.b #$D0
#_0383EF: ASL A
#_0383F0: CLC
#_0383F1: ADC.w .command_offset,Y
#_0383F4: TAX

#_0383F5: SEP #$10
#_0383F7: REP #$20

#_0383F9: LDA.w TextCommands,X
#_0383FC: STA.w $00E2

#_0383FF: JMP ($00E2)

;---------------------------------------------------------------------------------------------------

.return
#_038402: JSL RunFramesUntilDrawBufferEmpties

#_038406: SEP #$30

#_038408: LDY.w $0A3C
#_03840B: LDX.w .growth_check_offset,Y

.not_this_command
#_03840E: LDA.w TextboxAdjustingCommands,X

#_038411: CMP.b #$FF
#_038413: BNE .end_of_list

#_038415: JMP HandleNextTextByte

.end_of_list
#_038418: INX

#_038419: CMP.w $0A2D
#_03841C: BNE .not_this_command

#_03841E: JMP routine0383A5

;---------------------------------------------------------------------------------------------------

.command_offset
#_038421: db $00, $60

.growth_check_offset
#_038423: db $00, $09

;===================================================================================================

TextCommands:
#_038425: dw TextCommand_SetProgressBit             ; 0xD0
#_038427: dw TextCommand_ClearProgressBit           ; 0xD1
#_038429: dw TextCommand_RelocateIfProgressFlag     ; 0xD2
#_03842B: dw TextCommand_ChangeMessageID            ; 0xD3
#_03842D: dw TextCommand_SetTextBoxSize             ; 0xD4
#_03842F: dw TextCommand_WriteToAPU                 ; 0xD5
#_038431: dw TextCommand_AddOrRemoveSprite          ; 0xD6
#_038433: dw TextCommand_LoadScene                  ; 0xD7
#_038435: dw TextCommand_OptionsList                ; 0xD8
#_038437: dw TextCommand_CheckYENForNextMessage     ; 0xD9
#_038439: dw TextCommand_GiveMoney                  ; 0xDA
#_03843B: dw TextCommand_CheckMAGForNextMessage     ; 0xDB
#_03843D: dw TextCommand_AddMAG                     ; 0xDC
#_03843F: dw TextCommand_ChangeMessageIfMissingItem ; 0xDD
#_038441: dw TextCommand_LoadDemonSlot0             ; 0xDE
#_038443: dw TextCommand_Wait7Frames                ; 0xDF
#_038445: dw TextCommand_SetSpellID                 ; 0xE0
#_038447: dw TextCommand_SetItemID                  ; 0xE1
#_038449: dw TextCommand_12                         ; 0xE2
#_03844B: dw TextCommand_13                         ; 0xE3
#_03844D: dw TextCommand_LoadDemonData              ; 0xE4
#_03844F: dw TextCommand_15                         ; 0xE5
#_038451: dw TextCommand_16                         ; 0xE6
#_038453: dw TextCommand_17                         ; 0xE7
#_038455: dw TextCommand_WriteDemon1Name            ; 0xE8
#_038457: dw TextCommand_ChangeMessageByStatus      ; 0xE9
#_038459: dw TextCommand_DisplayShop                ; 0xEA
#_03845B: dw TextCommand_LoadDemonSlot1             ; 0xEB
#_03845D: dw TextCommand_WriteSelectedName          ; 0xEC
#_03845F: dw TextCommand_WriteMomoName              ; 0xED
#_038461: dw TextCommand_WriteJimmyName             ; 0xEE
#_038463: dw TextCommand_Write_him_Name             ; 0xEF
#_038465: dw TextCommand_WriteChaseName             ; 0xF0
#_038467: dw TextCommand_WriteTeamRepresentative    ; 0xF1
#_038469: dw TextCommand_WriteCommonPhrase          ; 0xF2
#_03846B: dw TextCommand_WriteItemName              ; 0xF3
#_03846D: dw TextCommand_WriteSpellName             ; 0xF4
#_03846F: dw TextCommand_WriteDemon0Name            ; 0xF5
#_038471: dw TextCommand_WriteClassName             ; 0xF6
#_038473: dw TextCommand_RNGDecision                ; 0xF7
#_038475: dw TextCommand_YesOrNoPrompt              ; 0xF8
#_038477: dw TextCommand_NewLine                    ; 0xF9
#_038479: dw TextCommand_ClearMessageBox            ; 0xFA
#_03847B: dw TextCommand_Write32BitInteger          ; 0xFB
#_03847D: dw TextCommand_WaitForKey                 ; 0xFC
#_03847F: dw TextCommand_2D                         ; 0xFD
#_038481: dw TextCommand_ExtendedTextCommand        ; 0xFE
#_038483: dw TerminateMessage                       ; 0xFF

;---------------------------------------------------------------------------------------------------
; Battle message commands
;---------------------------------------------------------------------------------------------------
#_038485: dw TextCommand_30                         ; 0xD0
#_038487: dw TextCommand_31                         ; 0xD1
#_038489: dw TextCommand_32                         ; 0xD2
#_03848B: dw TextCommand_33                         ; 0xD3
#_03848D: dw TextCommand_34                         ; 0xD4
#_03848F: dw TextCommand_35                         ; 0xD5
#_038491: dw TextCommand_36                         ; 0xD6
#_038493: dw TextCommand_37                         ; 0xD7
#_038495: dw TextCommand_38                         ; 0xD8
#_038497: dw TextCommand_39                         ; 0xD9
#_038499: dw TextCommand_ExtendedTextCommand        ; 0xDA
#_03849B: dw TextCommand_3B                         ; 0xDB
#_03849D: dw TextCommand_3C                         ; 0xDC
#_03849F: dw TextCommand_3D                         ; 0xDD
#_0384A1: dw TextCommand_3E                         ; 0xDE
#_0384A3: dw TextCommand_InflictStatus              ; 0xDF
#_0384A5: dw TextCommand_40                         ; 0xE0
#_0384A7: dw TextCommand_RemoveFractionOfHP         ; 0xE1
#_0384A9: dw TextCommand_42                         ; 0xE2
#_0384AB: dw TextCommand_43                         ; 0xE3
#_0384AD: dw TextCommand_44                         ; 0xE4
#_0384AF: dw TextCommand_45                         ; 0xE5
#_0384B1: dw TextCommand_46                         ; 0xE6
#_0384B3: dw TextCommand_PickRandomOf4Messages      ; 0xE7
#_0384B5: dw TextCommand_48                         ; 0xE8
#_0384B7: dw TextCommand_ChangeMessageID            ; 0xE9
#_0384B9: dw TextCommand_WriteToAPU                 ; 0xEA
#_0384BB: dw TextCommand_WriteCommonPhrase          ; 0xEB
#_0384BD: dw TextCommand_WriteItemName              ; 0xEC
#_0384BF: dw TextCommand_WriteSpeakerName           ; 0xED
#_0384C1: dw TextCommand_WriteSpeakerClass          ; 0xEE
#_0384C3: dw TextCommand_YesOrNoPrompt              ; 0xEF
#_0384C5: dw TextCommand_NewLine                    ; 0xF0
#_0384C7: dw TextCommand_ClearMessageBox            ; 0xF1
#_0384C9: dw TextCommand_OptionsList                ; 0xF2
#_0384CB: dw TextCommand_WaitForKey                 ; 0xF3
#_0384CD: dw TextCommand_Write32BitInteger          ; 0xF4
#_0384CF: dw TextCommand_55                         ; 0xF5
#_0384D1: dw TextCommand_AskForItemOrMoney          ; 0xF6
#_0384D3: dw TextCommand_57                         ; 0xF7
#_0384D5: dw TextCommand_WriteChaseName             ; 0xF8
#_0384D7: dw TextCommand_59                         ; 0xF9
#_0384D9: dw TextCommand_5A                         ; 0xFA
#_0384DB: dw TextCommand_SetOrClearProgressFlag     ; 0xFB
#_0384DD: dw TextCommand_RelocateIfProgressFlag     ; 0xFC
#_0384DF: dw TextCommand_5D                         ; 0xFD
#_0384E1: dw TextCommand_5E                         ; 0xFE
#_0384E3: dw TerminateMessage                       ; 0xFF

;===================================================================================================

TextboxAdjustingCommands:
#_0384E5: db $D4, $D8, $E2, $E3, $F8, $F9, $FA, $FC
#_0384ED: db $FF

#_0384EE: db $F2, $EF, $F0, $F1, $F3
#_0384F3: db $FF

;===================================================================================================

WhyDoesThisEvenExist:
#_0384F4: RTS

;===================================================================================================

routine0384F9_long:
#_0384F5: JSR routine0384F9
#_0384F8: RTL

;===================================================================================================

routine0384F9:
#_0384F9: PHP

#_0384FA: REP #$30

#_0384FC: PHA
#_0384FD: PHX
#_0384FE: PHY

#_0384FF: PHD
#_038500: PHB

#_038501: SEP #$20

#_038503: LDA.w $0A33
#_038506: BEQ .never_mind

#_038508: JSR R039653_SomeTextPars

.never_mind
#_03850B: REP #$30

#_03850D: PLB
#_03850E: PLD

#_03850F: PLY
#_038510: PLX
#_038511: PLA

#_038512: PLP

#_038513: RTS

;===================================================================================================

MessageTooLong:
#_038514: PLA

#_038515: PLP

#_038516: PLX
#_038517: PLY

#_038518: RTL

;===================================================================================================

WriteNextMessageChar:
#_038519: PHY
#_03851A: PHX

#_03851B: PHP
#_03851C: SEP #$30

#_03851E: PHA

#_03851F: LDA.w $0A33 ; index into array
#_038522: CMP.b #$40 ; max value

;===================================================================================================

routine038524:
#_038524: BEQ MessageTooLong

#_038526: PLA
#_038527: CMP.b #$CF ; space
#_038529: BEQ .is_space

#_03852B: CMP.b #$9C
#_03852D: BCS .has_dakuten

.is_space
#_03852F: LDX.w $0A33

#_038532: STA.w $0900,X

#_038535: LDA.b #$CF ; space
#_038537: STA.w $0940,X

#_03853A: LDA.w $0A2C
#_03853D: STA.w $0901,X
#_038540: STA.w $0941,X

#_038543: INC.w $0A33
#_038546: INC.w $0A33

#_038549: PLP
#_03854A: PLX
#_03854B: PLY

#_03854C: RTL

;---------------------------------------------------------------------------------------------------

.has_dakuten
#_03854D: CMP.b #$B5
#_03854F: BCS .is_katakana

#_038551: SEC
#_038552: SBC.b #$9C
#_038554: TAY

#_038555: PHB
#_038556: PHK
#_038557: PLB

#_038558: LDA.w DakutenBaseHiragana,Y
#_03855B: PLB

.add_character
#_03855C: LDX.w $0A33

#_03855F: STA.w $0900,X

#_038562: LDA.b #$9E ; dakuten

#_038564: CPY.b #$14
#_038566: BCC .use_dakuten

#_038568: INC A ; #$9F handakuten

.use_dakuten
#_038569: STA.w $0940,X

#_03856C: LDA.w $0A2C
#_03856F: STA.w $0901,X
#_038572: STA.w $0941,X

#_038575: INC.w $0A33
#_038578: INC.w $0A33

#_03857B: PLP
#_03857C: PLX
#_03857D: PLY

#_03857E: RTL

;---------------------------------------------------------------------------------------------------

.is_katakana
#_03857F: CMP.b #$CE
#_038581: BEQ .never_mind_it_is_vu

#_038583: SEC
#_038584: SBC.b #$B5
#_038586: TAY

#_038587: PHB
#_038588: PHK
#_038589: PLB

#_03858A: LDA.w DakutenBaseKatakana,Y

#_03858D: PLB
#_03858E: BRA .add_character

;---------------------------------------------------------------------------------------------------

.never_mind_it_is_vu
#_038590: LDA.b #$5F
#_038592: LDY.b #$00

#_038594: BRA .add_character

;===================================================================================================
; How/why is this different from 00AB42?
;===================================================================================================
DakutenBaseHiragana:
#_038596: db $2A, $2B, $2C, $2D, $2E, $2F, $30, $31
#_03859E: db $32, $33, $34, $35, $36, $37, $38, $3E
#_0385A6: db $3F, $40, $41, $42, $3E, $3F, $40, $41
#_0385AE: db $42

;---------------------------------------------------------------------------------------------------

DakutenBaseKatakana:
#_0385AF: db $62, $63, $64, $65, $66, $67, $68, $69
#_0385B7: db $6A, $6B, $6C, $6D, $6E, $6F, $70, $76
#_0385BF: db $77, $78, $79, $7A, $76, $77, $78, $79
#_0385C7: db $7A

;===================================================================================================
; Writes unencoded tiles
;===================================================================================================
WriteSingleTileToMessageBuffer:
#_0385C8: PHX
#_0385C9: PHP

#_0385CA: SEP #$30

#_0385CC: LDX.w $0A33
#_0385CF: STA.w $0900,X

#_0385D2: LDA.b #$CF
#_0385D4: STA.w $0940,X

#_0385D7: LDA.w $0A2C
#_0385DA: STA.w $0901,X
#_0385DD: STA.w $0941,X

#_0385E0: INC.w $0A33
#_0385E3: INC.w $0A33

#_0385E6: PLP
#_0385E7: PLX

#_0385E8: RTL

;===================================================================================================

GetNextTextByte_long:
#_0385E9: JSR GetNextTextByte
#_0385EC: RTL

;===================================================================================================

GetNextTextByte:
#_0385ED: PHY
#_0385EE: PHP

#_0385EF: SEP #$30

#_0385F1: LDY.b #$00
#_0385F3: LDA.b [$C0],Y

#_0385F5: REP #$20

#_0385F7: INC.w $00C0

#_0385FA: PLP
#_0385FB: PLY

#_0385FC: RTS

;===================================================================================================

TextCommand_SetProgressBit:
#_0385FD: SEP #$30

#_0385FF: JSR GetNextTextByte

;===================================================================================================

SetGameProgressBit:
#_038602: PHP

#_038603: SEP #$30

#_038605: PHA

#_038606: AND.b #$07
#_038608: TAY

#_038609: PLA

#_03860A: LSR A ; /8
#_03860B: LSR A
#_03860C: LSR A
#_03860D: TAX

#_03860E: PHB
#_03860F: PHK
#_038610: PLB

#_038611: LDA.w $07C0,X
#_038614: ORA.w TextCommand_SetBit,Y
#_038617: STA.w $07C0,X

#_03861A: PLB
#_03861B: PLP

#_03861C: RTS

;===================================================================================================

SetGameProgressBit_long:
#_03861D: JSR SetGameProgressBit
#_038620: RTL

;===================================================================================================

TextCommand_SetBit:
#_038621: db $01, $02, $04, $08, $10, $20, $40, $80

;---------------------------------------------------------------------------------------------------

TextCommand_ResetBit:
#_038629: db $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F

;===================================================================================================

TextCommand_ClearProgressBit:
#_038631: SEP #$30

#_038633: JSR GetNextTextByte

;===================================================================================================

ClearGameProgressBit:
#_038636: PHA

#_038637: AND.b #$07
#_038639: TAY

#_03863A: PLA

#_03863B: LSR A ; /8
#_03863C: LSR A
#_03863D: LSR A
#_03863E: TAX

#_03863F: PHB
#_038640: PHK
#_038641: PLB

#_038642: LDA.w $07C0,X
#_038645: AND.w TextCommand_ResetBit,Y
#_038648: STA.w $07C0,X

#_03864B: PLB

#_03864C: RTS

;===================================================================================================

ClearGameProgressBit_long:
#_03864D: PHP

#_03864E: JSR ClearGameProgressBit

#_038651: PLP

#_038652: RTL

;===================================================================================================
; relocate text pointer if condition met
;===================================================================================================
TextCommand_RelocateIfProgressFlag:
#_038653: SEP #$30

#_038655: JSR GetNextTextByte

#_038658: JSL TestGameProgressBit
#_03865C: BCC .dont_relocate

#_03865E: JSR GetNextTextByte
#_038661: JSR ChangeMessageID

#_038664: RTS

.dont_relocate
#_038665: JSR GetNextTextByte

#_038668: RTS

;===================================================================================================
; relocate text pointer always
;===================================================================================================
TextCommand_ChangeMessageID:
#_038669: SEP #$20 ; SEP #$30
#_03866B: SEP #$10

#_03866D: JSR GetNextTextByte
#_038670: JSR ChangeMessageID

#_038673: RTS

;===================================================================================================

TextCommand_SetTextBoxSize:
#_038674: PHP
#_038675: REP #$30

#_038677: JSR GetNextTextByte
#_03867A: AND.w #$00FF

.loop
#_03867D: PHA
#_03867E: PHP

#_03867F: CMP.w $0A2A
#_038682: BCS .done

#_038684: DEC.w $0A2A

#_038687: LDA.w $0A2A

#_03868A: JSL routine00BAC0
#_03868E: JSL AddSelfAsVector

#_038692: PLP
#_038693: PLA
#_038694: BRA .loop

;---------------------------------------------------------------------------------------------------

.done
#_038696: PLP
#_038697: PLA

#_038698: STA.w $0A2A

#_03869B: DEC A
#_03869C: DEC A

#_03869D: JSL SomeDMAPrep_02CBD1
#_0386A1: JSR TextCommand_ClearMessageBox

#_0386A4: PLP

#_0386A5: RTS

;===================================================================================================

TextCommand_WriteToAPU:
#_0386A6: SEP #$30

#_0386A8: JSR GetNextTextByte
#_0386AB: PHA

#_0386AC: JSL WriteAPUCareful

#_0386B0: PLA
#_0386B1: CMP.b #$38
#_0386B3: BCS .music

#_0386B5: RTS

.music
#_0386B6: CMP.b #$44
#_0386B8: BCC .permloadedsong

#_0386BA: LDA.b #$FF
#_0386BC: STA.w $0EFE

#_0386BF: RTS

.permloadedsong
#_0386C0: LDA.b #$FF
#_0386C2: STA.w $05BA

#_0386C5: RTS

;===================================================================================================

TextCommand_AddOrRemoveSprite:
#_0386C6: SEP #$20

#_0386C8: JSR GetNextTextByte
#_0386CB: STA.w $0A6A

#_0386CE: JSR GetNextTextByte
#_0386D1: STA.w $0A69

#_0386D4: AND.b #$FF
#_0386D6: BEQ .deleting_sprite

#_0386D8: JSR GetNextTextByte
#_0386DB: STA.w $0A6B

#_0386DE: JSR GetNextTextByte
#_0386E1: STA.w $0A6D

.deleting_sprite
#_0386E4: JSL routine02E6C9

#_0386E8: RTS

;===================================================================================================

TextCommand_LoadScene:
#_0386E9: SEP #$30

#_0386EB: STZ.w $0CF3
#_0386EE: STZ.w $0CF4

#_0386F1: LDA.b #$FF
#_0386F3: STA.w $0A71

#_0386F6: JSR GetNextTextByte
#_0386F9: STA.w $0A59

#_0386FC: CMP.b #$FF
#_0386FE: BNE .branch038703

#_038700: JMP .branch03871C

.branch038703
#_038703: AND.b #$FF
#_038705: BMI .branch03870C

#_038707: JSL routine02E32D
#_03870B: RTS

.branch03870C
#_03870C: AND.b #$7F
#_03870E: STA.w $0A59

#_038711: JSR GetNextTextByte
#_038714: STA.w $0A5B

#_038717: JSL R0FA05F_DoesVRAMDMAs

#_03871B: RTS

.branch03871C
#_03871C: JSL routine0F939C

#_038720: RTS

;===================================================================================================

TextCommand_OptionsList:
#_038721: SEP #$30

#_038723: JSR routine0384F9
#_038726: JSL RunFramesUntilDrawBufferEmpties
#_03872A: JSL ResetMenuRowAndColumn

#_03872E: REP #$30

#_038730: LDA.w #$0007
#_038733: STA.w $0E00

#_038736: JSR routine0392C1

#_038739: SEP #$30

#_03873B: LDA.b #$06
#_03873D: STA.w $0B3D

#_038740: STZ.w $0A33
#_038743: STZ.w $0B3C

#_038746: JSR GetNextTextByte
#_038749: STA.w $0B5F

#_03874C: JSR routine038883

#_03874F: SEP #$30

#_038751: LDA.w $0B5F
#_038754: STA.w $0E00

#_038757: LDX.b #$00
#_038759: STX.w $0E04

.branch03875C
#_03875C: CPX.w $0B3E
#_03875F: BEQ .handle_buffer

#_038761: LDA.w $0B3D
#_038764: STA.w $0B4F,X

#_038767: LDA.w $0E00
#_03876A: SEC
#_03876B: SBC.w $0B3D
#_03876E: STA.w $0E00

#_038771: LDA.w $0E04
#_038774: STA.w $0B3F,X

#_038777: CLC
#_038778: ADC.w $0B3D
#_03877B: STA.w $0E04

#_03877E: INX
#_03877F: BRA .branch03875C

;---------------------------------------------------------------------------------------------------

.handle_buffer
#_038781: LDA.w $0E00
#_038784: INC A
#_038785: STA.w $0B4F,X

#_038788: LDA.w $0E04
#_03878B: STA.w $0B3F,X

#_03878E: SEP #$20

#_038790: LDA.w $00C2
#_038793: STA.w $00E2

#_038796: REP #$20

#_038798: LDA.w $00C0
#_03879B: STA.w $00E0

#_03879E: LDY.w $0B5F
#_0387A1: LDX.b #$00

.add_to_buffer
#_0387A3: SEP #$20
#_0387A5: JSR GetNextTextByte
#_0387A8: JSR GetNextTextByte
#_0387AB: STA.w $0B61,X

#_0387AE: INX
#_0387AF: DEY
#_0387B0: BPL .add_to_buffer

;---------------------------------------------------------------------------------------------------

.branch0387B2
#_0387B2: JSR routine038B8E

#_0387B5: SEP #$30

#_0387B7: LDX.w $0B3C

#_0387BA: LDA.w $0B3F,X
#_0387BD: ASL A
#_0387BE: TAY

#_0387BF: LDA.w $0B4F,X
#_0387C2: TAX

#_0387C3: INC.w $0980

.branch0387C6
#_0387C6: PHY
#_0387C7: PHX
#_0387C8: PHP

#_0387C9: REP #$20

#_0387CB: LDA.w $0980
#_0387CE: CLC
#_0387CF: ADC.w #$0040
#_0387D2: STA.w $0980

#_0387D5: LDA.b [$E0],Y
#_0387D7: JSR routine0388AD
#_0387DA: JSR TextCommand_NewLine
#_0387DD: JSR Add_0x20_to_0A2F
#_0387E0: JSR Add_0x20_to_0A2F

#_0387E3: PLP

#_0387E4: PLX
#_0387E5: PLY

#_0387E6: INY
#_0387E7: INY

#_0387E8: DEX
#_0387E9: BNE .branch0387C6

#_0387EB: JSR routine038C0E
#_0387EE: JSR routine038CF4
#_0387F1: JSR routine0387FF

#_0387F4: SEP #$20
#_0387F6: AND.b #$FF
#_0387F8: BEQ .branch0387B2

#_0387FA: JSL RunFramesUntilDrawBufferEmpties

#_0387FE: RTS

;===================================================================================================

routine0387FF:
#_0387FF: REP #$20
#_038801: LDA.w $0F2B

#_038804: BIT.w #$0080
#_038807: BNE .branch038846

#_038809: BIT.w #$8000
#_03880C: BNE .branch038873

#_03880E: BIT.w #$0800
#_038811: BNE .branch038822

#_038813: BIT.w #$0400
#_038816: BNE .branch038831

#_038818: BIT.w #$0200
#_03881B: BNE .branch038822

#_03881D: BIT.w #$0100
#_038820: BNE .branch038831

;---------------------------------------------------------------------------------------------------

.branch038822
#_038822: SEP #$20
#_038824: DEC.w $0B3C
#_038827: BPL .exit_false

#_038829: LDA.w $0B3E
#_03882C: STA.w $0B3C
#_03882F: BRA .exit_false

;---------------------------------------------------------------------------------------------------

.branch038831
#_038831: SEP #$20
#_038833: INC.w $0B3C
#_038836: LDA.w $0B3C
#_038839: CMP.w $0B3E
#_03883C: BCC .exit_false

#_03883E: BEQ .exit_false

#_038840: STZ.w $0B3C

;---------------------------------------------------------------------------------------------------

.exit_false
#_038843: LDA.b #$00

#_038845: RTS

;---------------------------------------------------------------------------------------------------

.branch038846
#_038846: SEP #$20

#_038848: LDA.w $0B3C
#_03884B: STA.w $0E10

#_03884E: LDA.w $0B3D
#_038851: STA.w $0E11

#_038854: JSR SmallMultiplication

#_038857: LDA.w $0E12
#_03885A: CLC
#_03885B: ADC.w $09F3
#_03885E: TAY

#_03885F: LDA.w $0B61,Y
#_038862: JSR ChangeMessageID
#_038865: JSR routine038B8E
#_038868: JSR TextCommand_ClearMessageBox

#_03886B: SEP #$20
#_03886D: STZ.w $0A33
#_038870: LDA.b #$01
#_038872: RTS

.branch038873
#_038873: JSR routine038B8E

#_038876: SEP #$20
#_038878: JSR TextCommand_ClearMessageBox

#_03887B: SEP #$20

#_03887D: STZ.w $0A33

#_038880: LDA.b #$FF

#_038882: RTS

;===================================================================================================

routine038883:
#_038883: PHP

#_038884: LDA.w $0B5F
#_038887: STA.w $0E10
#_03888A: STZ.w $0E11

#_03888D: LDA.w $0B3D
#_038890: STA.w $0E12

#_038893: JSR routine039600

#_038896: LDA.w $0E13
#_038899: STA.w $0B3E

#_03889C: PLP
#_03889D: RTS

;===================================================================================================
; Why? Lol
;===================================================================================================
Add_0x20_to_0A2F:
#_03889E: PHP

#_03889F: REP #$20

#_0388A1: LDA.w $0A2F
#_0388A4: CLC
#_0388A5: ADC.w #$0020
#_0388A8: STA.w $0A2F

#_0388AB: PLP
#_0388AC: RTS

;===================================================================================================

routine0388AD:
#_0388AD: PHP

#_0388AE: SEP #$20
#_0388B0: PHA

#_0388B1: LDA.b #MessageSelectionPointers>>16
#_0388B3: STA.w $00C5

#_0388B6: STZ.w $0A33
#_0388B9: PLA

#_0388BA: REP #$20

#_0388BC: AND.w #$00FF
#_0388BF: STA.w $0A39

#_0388C2: LDA.w $0A3C
#_0388C5: AND.w #$0001
#_0388C8: ASL A
#_0388C9: TAY

#_0388CA: LDA.w .pointers,Y
#_0388CD: STA.w $00C3

#_0388D0: JSR WriteIndexedEntityName

#_0388D3: PLP
#_0388D4: RTS

.pointers
#_0388D5: dw MessageSelectionPointers
#_0388D7: dw BattleSelectionPointers

;===================================================================================================
; Read a 24 bit number
; if N > Money
;   relocate
;===================================================================================================
TextCommand_CheckYENForNextMessage:
#_0388D9: REP #$20

#_0388DB: JSR TextRead32bitfrom24

#_0388DE: LDA.w $0E02
#_0388E1: CMP.w $0407
#_0388E4: BCC .dont_relocate

#_0388E6: LDA.w $0405
#_0388E9: CMP.w $0E00
#_0388EC: BCS .dont_relocate

#_0388EE: JSR GetNextTextByte
#_0388F1: JSR ChangeMessageID

#_0388F4: RTS

.dont_relocate
#_0388F5: JSR GetNextTextByte

#_0388F8: RTS

;===================================================================================================
; Read a 24 bit number, then add that to money
;===================================================================================================
TextCommand_GiveMoney:
#_0388F9: SEP #$20

#_0388FB: JSR TextRead32bitfrom24

#_0388FE: REP #$20

#_038900: LDA.w $0405
#_038903: CLC
#_038904: ADC.w $0E00
#_038907: STA.w $0405

#_03890A: LDA.w $0407
#_03890D: ADC.w $0E02
#_038910: STA.w $0407

#_038913: JSL ClampMoneyAndMAG
#_038917: JSL routine0F945E ; TODO ?

#_03891B: RTS

;===================================================================================================
; Reads the next 3 bytes of text and stores it to $0E00[4]
; $0E03 is the sign extension of the 24-bit number (bit 23)
;===================================================================================================
TextRead32bitfrom24:
#_03891C: PHP

#_03891D: SEP #$20

#_03891F: STZ.w $0E03

#_038922: JSR GetNextTextByte
#_038925: STA.w $0E00

#_038928: JSR GetNextTextByte
#_03892B: STA.w $0E01

#_03892E: JSR GetNextTextByte
#_038931: STA.w $0E02

#_038934: AND.b #$FF
#_038936: BPL .nosignextension

#_038938: DEC.w $0E03

.nosignextension
#_03893B: PLP

#_03893C: RTS

;===================================================================================================
; Read a 24 bit number
; If MAG<X
;   relocate
;===================================================================================================
TextCommand_CheckMAGForNextMessage:
#_03893D: REP #$20

#_03893F: JSR TextRead32bitfrom24

#_038942: LDA.w $040B
#_038945: CMP.w $0E02
#_038948: BCS .dont_relocate

#_03894A: LDA.w $0409
#_03894D: CMP.w $0E00
#_038950: BCS .dont_relocate

#_038952: SEP #$20

#_038954: JSR GetNextTextByte
#_038957: JSR ChangeMessageID

#_03895A: RTS

.dont_relocate
#_03895B: JSR GetNextTextByte

#_03895E: RTS

;===================================================================================================
; 
;===================================================================================================
TextCommand_AddMAG:
#_03895F: REP #$20

#_038961: JSR TextRead32bitfrom24

#_038964: LDA.w $0409
#_038967: CLC
#_038968: ADC.w $0E00
#_03896B: STA.w $0409

#_03896E: LDA.w $040B
#_038971: ADC.w $0E02
#_038974: STA.w $040B

#_038977: JSL ClampMoneyAndMAG

#_03897B: RTS

;===================================================================================================

TextCommand_ChangeMessageIfMissingItem:
#_03897C: SEP #$30

#_03897E: JSR GetNextTextByte
#_038981: JSL LookForItemInInventory
#_038985: BCS .have_item

#_038987: JSR GetNextTextByte
#_03898A: JSR ChangeMessageID
#_03898D: RTS

.have_item
#_03898E: JSR GetNextTextByte
#_038991: RTS

;===================================================================================================

TextCommand_LoadDemonSlot0:
#_038992: SEP #$20

#_038994: JSR GetNextTextByte
#_038997: STA.w $050B
#_03899A: STA.w $0BEE

#_03899D: JSR GetNextTextByte
#_0389A0: JSR GetNextTextByte
#_0389A3: STA.w $0BED
#_0389A6: STA.w $050A

#_0389A9: LDA.b #$00
#_0389AB: JSR GetDemonXClass

#_0389AE: LDA.w $0BF3
#_0389B1: STA.w $0506

#_0389B4: JSR GetNextTextByte
#_0389B7: STA.w $050E
#_0389BA: STZ.w $0524

#_0389BD: RTS

;===================================================================================================

TextCommand_Wait7Frames:
#_0389BE: JSR routine0384F9

#_0389C1: SEP #$30

#_0389C3: LDY.b #$07
#_0389C5: JSL RunFramesYTimes

#_0389C9: RTS

;===================================================================================================
; TODO
;===================================================================================================
TextCommand_SetSpellID:
#_0389CA: SEP #$20

#_0389CC: JSR GetNextTextByte
#_0389CF: STA.w $0A52

#_0389D2: RTS

;===================================================================================================
; 
;===================================================================================================
TextCommand_SetItemID:
#_0389D3: REP #$20

#_0389D5: JSR GetNextTextByte
#_0389D8: AND.w #$00FF
#_0389DB: STA.w $0A50

#_0389DE: RTS

;===================================================================================================

TextCommand_12:
#_0389DF: JSR TextCommand_NewLine
#_0389E2: JSL ResetMenuRowAndColumn

#_0389E6: SEP #$20
#_0389E8: STZ.w $0A33

#_0389EB: REP #$10
#_0389ED: JSR GetNextTextByte

;===================================================================================================

routine0389F0:
#_0389F0: REP #$20
#_0389F2: AND.w #$00FF
#_0389F5: ASL A
#_0389F6: TAX

#_0389F7: REP #$20
#_0389F9: LDA.w ShopStockPointers,X
#_0389FC: STA.w $00E0

#_0389FF: SEP #$30
#_038A01: LDY.b #$00
#_038A03: LDA.b ($E0),Y
#_038A05: STA.w $0B5F
#_038A08: TAY

#_038A09: REP #$20
#_038A0B: INC.w $00E0

#_038A0E: SEP #$30
#_038A10: LDA.b #$05
#_038A12: STA.w $0B3D
#_038A15: LDA.w $0B5F
#_038A18: STA.w $0E10
#_038A1B: STZ.w $0E11
#_038A1E: LDA.w $0B3D
#_038A21: STA.w $0E12
#_038A24: JSR routine039600
#_038A27: LDA.w $0E13
#_038A2A: STA.w $0B3E
#_038A2D: STZ.w $0B3C
#_038A30: LDA.w $0B5F
#_038A33: STA.w $0E00
#_038A36: LDX.b #$00
#_038A38: STX.w $0E04

.branch038A3B
#_038A3B: CPX.w $0B3E
#_038A3E: BEQ .branch038A60

#_038A40: LDA.w $0B3D
#_038A43: STA.w $0B4F,X
#_038A46: LDA.w $0E00
#_038A49: SEC
#_038A4A: SBC.w $0B3D
#_038A4D: STA.w $0E00
#_038A50: LDA.w $0E04
#_038A53: STA.w $0B3F,X
#_038A56: CLC
#_038A57: ADC.w $0B3D
#_038A5A: STA.w $0E04
#_038A5D: INX
#_038A5E: BRA .branch038A3B

;---------------------------------------------------------------------------------------------------

.branch038A60
#_038A60: LDA.w $0E00
#_038A63: INC A
#_038A64: STA.w $0B4F,X
#_038A67: LDA.w $0E04
#_038A6A: STA.w $0B3F,X

#_038A6D: SEP #$30
#_038A6F: LDX.b #$1F
#_038A71: LDA.b #$00

.branch038A73
#_038A73: STA.w $098E,X
#_038A76: DEX
#_038A77: BPL .branch038A73

#_038A79: STZ.w $09F2
#_038A7C: STZ.w $09F3

; this handles shop input
.branch038A7F
#_038A7F: JSR routine038C87
#_038A82: JSR routine038B8E

#_038A85: REP #$20

#_038A87: JSR routine038BBF
#_038A8A: JSR routine038C0E
#_038A8D: JSR routine038CF4
#_038A90: JSR routine038A9A

#_038A93: SEP #$20

#_038A95: AND.b #$FF
#_038A97: BEQ .branch038A7F

#_038A99: RTS

;===================================================================================================

routine038A9A:
#_038A9A: REP #$20

#_038A9C: LDA.w $0F2D
#_038A9F: BIT.w #$0080
#_038AA2: BNE .pressed_A

#_038AA4: BIT.w #$8000
#_038AA7: BEQ .didnt_press_b

#_038AA9: JMP .pressed_b

.didnt_press_b
#_038AAC: BIT.w #$0800
#_038AAF: BNE .pressed_up_or_left

#_038AB1: BIT.w #$0400
#_038AB4: BNE .pressed_right_or_down

#_038AB6: BIT.w #$0200
#_038AB9: BNE .pressed_up_or_left

#_038ABB: BIT.w #$0100
#_038ABE: BNE .pressed_right_or_down

;---------------------------------------------------------------------------------------------------

.pressed_up_or_left
#_038AC0: SEP #$20

#_038AC2: DEC.w $0B3C
#_038AC5: BPL .no_wrap

#_038AC7: LDA.w $0B3E
#_038ACA: STA.w $0B3C

.no_wrap
#_038ACD: SEP #$10

#_038ACF: LDX.w $0B3C

#_038AD2: LDA.w $0B4F,X
#_038AD5: DEC A
#_038AD6: STA.w $09F3

#_038AD9: BRA .finished_dpad

;---------------------------------------------------------------------------------------------------

.pressed_right_or_down
#_038ADB: SEP #$20

#_038ADD: STZ.w $09F3

#_038AE0: INC.w $0B3C

#_038AE3: LDA.w $0B3C
#_038AE6: CMP.w $0B3E
#_038AE9: BCC .finished_dpad
#_038AEB: BEQ .finished_dpad

#_038AED: STZ.w $0B3C

.finished_dpad
#_038AF0: LDA.b #$00

#_038AF2: RTS

;---------------------------------------------------------------------------------------------------

.pressed_A
#_038AF3: SEP #$20
#_038AF5: LDA.w $0B3C
#_038AF8: STA.w $0E10
#_038AFB: LDA.w $0B3D
#_038AFE: STA.w $0E11
#_038B01: JSR SmallMultiplication
#_038B04: LDA.w $0E12
#_038B07: CLC
#_038B08: ADC.w $09F3
#_038B0B: TAY
#_038B0C: LDA.b ($E0),Y
#_038B0E: STA.w $0A50
#_038B11: STZ.w $0A51
#_038B14: LDA.w $098E,Y
#_038B17: AND.b #$F0
#_038B19: BEQ .branch038B26

#_038B1B: LSR A
#_038B1C: LSR A
#_038B1D: LSR A
#_038B1E: LSR A
#_038B1F: ORA.b #$80
#_038B21: STA.w $0A51
#_038B24: BRA .branch038B29

.branch038B26
#_038B26: STY.w $0A51

.branch038B29
#_038B29: REP #$20
#_038B2B: LDA.w $0A50
#_038B2E: JSL routine038D8F
#_038B32: JSL routine0FA0EC
#_038B36: ASL.w $0A14
#_038B39: ROL.w $0A16
#_038B3C: LDA.w $0A14
#_038B3F: STA.w $0E00
#_038B42: LDA.w $0A16
#_038B45: STA.w $0E02
#_038B48: ASL.w $0A14
#_038B4B: ROL.w $0A16
#_038B4E: ASL.w $0A14
#_038B51: ROL.w $0A16
#_038B54: LDA.w $0A14
#_038B57: CLC
#_038B58: ADC.w $0E00
#_038B5B: STA.w $0A14
#_038B5E: STA.w $0A54
#_038B61: LDA.w $0A16
#_038B64: ADC.w $0E02
#_038B67: STA.w $0A16
#_038B6A: STA.w $0A56
#_038B6D: JSR routine038B8E
#_038B70: JSR GetNextTextByte
#_038B73: JSR TextCommand_ClearMessageBox

#_038B76: SEP #$20

#_038B78: LDA.b #$01

#_038B7A: RTS

;---------------------------------------------------------------------------------------------------

.pressed_b
#_038B7B: JSR routine038B8E

#_038B7E: SEP #$20

#_038B80: JSR GetNextTextByte
#_038B83: JSR ChangeMessageID
#_038B86: JSR TextCommand_ClearMessageBox

#_038B89: SEP #$20

#_038B8B: LDA.b #$FF

#_038B8D: RTS

;===================================================================================================

routine038B8E:
#_038B8E: JSL RunFramesUntilDrawBufferEmpties

#_038B92: REP #$20

#_038B94: LDA.w $0A1A
#_038B97: CLC
#_038B98: ADC.w #$0040
#_038B9B: STA.w $0980

#_038B9E: LDA.w $0A20
#_038BA1: LSR A
#_038BA2: TAX

.loop
#_038BA3: REP #$20

#_038BA5: LDA.w $0980
#_038BA8: JSR routine038CBC

#_038BAB: CLC
#_038BAC: ADC.w #$0040
#_038BAF: STA.w $0980

#_038BB2: DEX
#_038BB3: BNE .loop

#_038BB5: LDA.w $0A1A
#_038BB8: STA.w $0980
#_038BBB: STA.w $0A2F

#_038BBE: RTS

;===================================================================================================

routine038BBF:
#_038BBF: REP #$20

#_038BC1: LDA.w $0A1A
#_038BC4: CLC
#_038BC5: ADC.w #$0040
#_038BC8: STA.w $0980

#_038BCB: SEP #$30

#_038BCD: LDX.w $0B3C

#_038BD0: LDA.w $0B3F,X
#_038BD3: TAY

#_038BD4: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.loop
#_038BD6: SEP #$30

#_038BD8: PHY
#_038BD9: PHX

#_038BDA: LDA.b ($E0),Y
#_038BDC: PHA

#_038BDD: JSL routine0F94B2
#_038BE1: JSR routine038D1C

#_038BE4: PLA

#_038BE5: JSR routine038D53
#_038BE8: JSR TextCommand_NewLine

#_038BEB: REP #$20

#_038BED: LDA.w $0980
#_038BF0: CLC
#_038BF1: ADC.w #$0040
#_038BF4: STA.w $0980

#_038BF7: SEP #$30

#_038BF9: PLX
#_038BFA: PLY

#_038BFB: INY
#_038BFC: PHY

#_038BFD: LDY.w $0B3C

#_038C00: LDA.w $0B4F,Y

#_038C03: PLY

#_038C04: STA.w $0E00

#_038C07: INX
#_038C08: CPX.w $0E00
#_038C0B: BNE .loop

#_038C0D: RTS

;===================================================================================================

routine038C0E:
#_038C0E: SEP #$20

#_038C10: LDA.w $0B3E
#_038C13: BNE .branch038C16

#_038C15: RTS

.branch038C16
#_038C16: LDA.w $0B3C
#_038C19: BEQ routine038C4B

#_038C1B: CMP.w $0B3E
#_038C1E: BEQ .branch038C23

#_038C20: JSR routine038C4B

.branch038C23
#_038C23: REP #$20

#_038C25: LDA.w $0A1E
#_038C28: AND.w #$00FF
#_038C2B: DEC A
#_038C2C: DEC A
#_038C2D: CLC
#_038C2E: ADC.w $0A1A
#_038C31: STA.w $0102

#_038C34: LDA.w #$0001
#_038C37: STA.w $0104

#_038C3A: LDA.w #$A0AB
#_038C3D: STA.w $0106

#_038C40: LDA.w #$0001
#_038C43: STA.w $0100
#_038C46: JSL RunFramesUntilDrawBufferEmpties

#_038C4A: RTS

;===================================================================================================

routine038C4B:
#_038C4B: REP #$20

#_038C4D: LDA.w $0A20
#_038C50: INC A
#_038C51: AND.w #$00FF
#_038C54: DEC A

#_038C55: ASL A ; x32
#_038C56: ASL A
#_038C57: ASL A
#_038C58: ASL A
#_038C59: ASL A

#_038C5A: CLC
#_038C5B: ADC.w $0A1A
#_038C5E: STA.w $0E00

#_038C61: LDA.w $0A1E
#_038C64: AND.w #$00FF
#_038C67: DEC A
#_038C68: DEC A
#_038C69: CLC
#_038C6A: ADC.w $0E00
#_038C6D: STA.w $0102

#_038C70: LDA.w #$0001
#_038C73: STA.w $0104

#_038C76: LDA.w #$20AB
#_038C79: STA.w $0106

#_038C7C: LDA.w #$0001
#_038C7F: STA.w $0100

#_038C82: JSL RunFramesUntilDrawBufferEmpties

#_038C86: RTS

;===================================================================================================

routine038C87:
#_038C87: REP #$20
#_038C89: LDA.w $0A1E
#_038C8C: AND.w #$00FF
#_038C8F: DEC A
#_038C90: DEC A
#_038C91: CLC
#_038C92: ADC.w $0A1A
#_038C95: STA.w $0102
#_038C98: CLC
#_038C99: ADC.w #$0180
#_038C9C: STA.w $0108
#_038C9F: LDA.w #$0001
#_038CA2: STA.w $0104
#_038CA5: STA.w $010A
#_038CA8: LDA.w #$20CF
#_038CAB: STA.w $0106
#_038CAE: STA.w $010C
#_038CB1: LDA.w #$0002
#_038CB4: STA.w $0100
#_038CB7: JSL RunFramesUntilDrawBufferEmpties
#_038CBB: RTS

;===================================================================================================

routine038CBC:
#_038CBC: PHP

#_038CBD: REP #$30

#_038CBF: PHA
#_038CC0: PHX
#_038CC1: PHY
#_038CC2: PHD
#_038CC3: PHB

#_038CC4: REP #$20
#_038CC6: STA.w $0980

#_038CC9: SEP #$30

#_038CCB: LDA.w $0A1E
#_038CCE: ASL A
#_038CCF: STA.w $0A33

#_038CD2: TAX

#_038CD3: DEX
#_038CD4: DEX

.branch038CD5
#_038CD5: REP #$20

#_038CD7: LDA.w #$20CF
#_038CDA: STA.w $0900,X
#_038CDD: STA.w $0940,X

#_038CE0: DEX
#_038CE1: DEX
#_038CE2: BPL .branch038CD5

#_038CE4: JSR routine0384F9
#_038CE7: JSL RunFramesUntilDrawBufferEmpties

#_038CEB: REP #$30

#_038CED: PLB
#_038CEE: PLD
#_038CEF: PLY
#_038CF0: PLX
#_038CF1: PLA
#_038CF2: PLP

#_038CF3: RTS

;===================================================================================================

routine038CF4:
#_038CF4: SEP #$30
#_038CF6: LDA.b #$05
#_038CF8: STA.w $09F4
#_038CFB: LDX.w $0B3C
#_038CFE: LDA.w $0B4F,X
#_038D01: AND.b #$0F
#_038D03: DEC A
#_038D04: STA.w $09F1
#_038D07: STZ.w $09F0
#_038D0A: LDA.w $0B3E
#_038D0D: BEQ .branch038D17

#_038D0F: LDA.w $09F4
#_038D12: ORA.b #$80
#_038D14: STA.w $09F4

.branch038D17
#_038D17: JSL routine02C8E9
#_038D1B: RTS

;===================================================================================================

routine038D1C:
#_038D1C: SEP #$30
#_038D1E: LDA.w $0A33
#_038D21: LSR A
#_038D22: STA.w $0E00
#_038D25: LDA.w $0A1E
#_038D28: SEC
#_038D29: SBC.w $0E00
#_038D2C: SEC
#_038D2D: SBC.b #$06
#_038D2F: TAY
#_038D30: DEY
#_038D31: DEY

.branch038D32
#_038D32: SEP #$20
#_038D34: LDA.b #$CF ; space
#_038D36: JSL WriteSingleTileToMessageBuffer
#_038D3A: DEY
#_038D3B: BNE .branch038D32

#_038D3D: LDA.b #$EC
#_038D3F: JSL TestGameProgressBit
#_038D43: BCC .branch038D4C

#_038D45: LDA.b #$5C ; Macca symbol
#_038D47: JSL WriteSingleTileToMessageBuffer
#_038D4B: RTS

.branch038D4C
#_038D4C: LDA.b #$5B ; Yen symbol
#_038D4E: JSL WriteSingleTileToMessageBuffer
#_038D52: RTS

;===================================================================================================

routine038D53:
#_038D53: PHP
#_038D54: REP #$30
#_038D56: PHA
#_038D57: PHX
#_038D58: PHY
#_038D59: PHD
#_038D5A: PHB

#_038D5B: REP #$30
#_038D5D: JSL routine038D8F
#_038D61: JSL routine0FA0EC
#_038D65: LDA.w $0A14
#_038D68: STA.w $0E10
#_038D6B: LDA.w $0A16
#_038D6E: STA.w $0E12

#_038D71: SEP #$30
#_038D73: LDA.w $0A33
#_038D76: LSR A
#_038D77: TAX
#_038D78: LDY.b #$04
#_038D7A: JSL routine03D775

#_038D7E: SEP #$20
#_038D80: LDA.b #$01 ; 0
#_038D82: JSL WriteSingleTileToMessageBuffer

#_038D86: REP #$30
#_038D88: PLB
#_038D89: PLD
#_038D8A: PLY
#_038D8B: PLX
#_038D8C: PLA
#_038D8D: PLP
#_038D8E: RTS

;===================================================================================================

routine038D8F:
#_038D8F: PHP
#_038D90: PHB
#_038D91: PHK
#_038D92: PLB

#_038D93: REP #$30
#_038D95: AND.w #$00FF
#_038D98: ASL A
#_038D99: ASL A
#_038D9A: TAY
#_038D9B: LDA.w $0A2D
#_038D9E: AND.w #$00FF
#_038DA1: CMP.w #$00E3
#_038DA4: BNE .not_selling

#_038DA6: INY
#_038DA7: INY

.not_selling
#_038DA8: LDA.w #ItemShopPrices
#_038DAB: STA.w $00E2
#_038DAE: LDA.b ($E2),Y
#_038DB0: STA.w $0A14
#_038DB3: STZ.w $0A16
#_038DB6: PLB
#_038DB7: PLP
#_038DB8: RTL

;===================================================================================================
; TODO
;===================================================================================================
TextCommand_13:
#_038DB9: SEP #$30

#_038DBB: JSL CountAndArrangeGemsOrSomething
#_038DBF: LDX.b #$00
#_038DC1: STX.w $0C51

.branch038DC4
#_038DC4: LDA.w $0781,X
#_038DC7: BEQ .branch038DE3

#_038DC9: PHX
#_038DCA: LDA.w $0780,X
#_038DCD: CMP.b #$E4
#_038DCF: BCS .branch038DE2

#_038DD1: PHA
#_038DD2: LDA.w $0781,X
#_038DD5: LDX.w $0C51
#_038DD8: STA.w $098E,X
#_038DDB: PLA
#_038DDC: STA.w $0BA4,X
#_038DDF: INC.w $0C51

.branch038DE2
#_038DE2: PLX

.branch038DE3
#_038DE3: INX
#_038DE4: INX
#_038DE5: CPX.b #$3C
#_038DE7: BNE .branch038DC4

#_038DE9: REP #$30
#_038DEB: LDA.w #$0011
#_038DEE: STA.w $0E00
#_038DF1: LDX.w #$0000

.branch038DF4
#_038DF4: PHX
#_038DF5: LDA.w $1000,X
#_038DF8: BPL .branch038E25

#_038DFA: LDY.w #$0006

.branch038DFD
#_038DFD: LDA.w $1042,X
#_038E00: CMP.w #$FFFF
#_038E03: BEQ .branch038E20

#_038E05: JSL CheckItemForCurses
#_038E09: BCS .branch038E20

#_038E0B: PHX
#_038E0C: PHP
#_038E0D: SEP #$30
#_038E0F: LDX.w $0C51
#_038E12: STA.w $0BA4,X
#_038E15: LDA.w $0E00
#_038E18: STA.w $098E,X
#_038E1B: INC.w $0C51
#_038E1E: PLP
#_038E1F: PLX

.branch038E20
#_038E20: INX
#_038E21: INX
#_038E22: DEY
#_038E23: BPL .branch038DFD

.branch038E25
#_038E25: PLX
#_038E26: LDA.w $0E00
#_038E29: CLC
#_038E2A: ADC.w #$0010
#_038E2D: STA.w $0E00
#_038E30: TXA
#_038E31: CLC
#_038E32: ADC.w #$0060
#_038E35: TAX
#_038E36: CMP.w #$0180
#_038E39: BNE .branch038DF4

#_038E3B: SEP #$30
#_038E3D: LDA.w $0C51
#_038E40: BEQ .branch038E64

#_038E42: JSL ResetMenuRowAndColumn
#_038E46: JSR routine038E6D

.branch038E49
#_038E49: JSR routine038B8E
#_038E4C: JSR routine038C87

#_038E4F: REP #$20
#_038E51: JSR routine038BBF
#_038E54: JSR routine038C0E
#_038E57: JSR routine038CF4
#_038E5A: JSR routine038A9A

#_038E5D: SEP #$20
#_038E5F: AND.b #$FF
#_038E61: BEQ .branch038E49

#_038E63: RTS

.branch038E64
#_038E64: SEP #$20
#_038E66: JSR GetNextTextByte
#_038E69: JSR ChangeMessageID
#_038E6C: RTS

;===================================================================================================

routine038E6D:
#_038E6D: JSR TextCommand_NewLine

#_038E70: SEP #$20
#_038E72: STZ.w $0A33

#_038E75: REP #$20
#_038E77: LDA.w #$0BA4
#_038E7A: STA.w $00E0

#_038E7D: SEP #$30
#_038E7F: LDA.w $0C51
#_038E82: DEC A
#_038E83: STA.w $0B5F
#_038E86: TAY
#_038E87: LDA.b #$05
#_038E89: STA.w $0B3D
#_038E8C: LDA.w $0B5F
#_038E8F: STA.w $0E10
#_038E92: STZ.w $0E11
#_038E95: LDA.w $0B3D
#_038E98: STA.w $0E12
#_038E9B: JSR routine039600
#_038E9E: LDA.w $0E13
#_038EA1: STA.w $0B3E
#_038EA4: STZ.w $0B3C
#_038EA7: LDA.w $0B5F
#_038EAA: STA.w $0E00
#_038EAD: LDX.b #$00
#_038EAF: STX.w $0E04

.branch038EB2
#_038EB2: CPX.w $0B3E
#_038EB5: BEQ .branch038ED7

#_038EB7: LDA.w $0B3D
#_038EBA: STA.w $0B4F,X
#_038EBD: LDA.w $0E00
#_038EC0: SEC
#_038EC1: SBC.w $0B3D
#_038EC4: STA.w $0E00
#_038EC7: LDA.w $0E04
#_038ECA: STA.w $0B3F,X
#_038ECD: CLC
#_038ECE: ADC.w $0B3D
#_038ED1: STA.w $0E04
#_038ED4: INX
#_038ED5: BRA .branch038EB2

.branch038ED7
#_038ED7: LDA.w $0E00
#_038EDA: INC A
#_038EDB: STA.w $0B4F,X
#_038EDE: LDA.w $0E04
#_038EE1: STA.w $0B3F,X
#_038EE4: RTS

;===================================================================================================

TextCommand_LoadDemonData:
#_038EE5: SEP #$20

#_038EE7: JSR GetNextTextByte
#_038EEA: ASL A
#_038EEB: JSL LoadDemonEverything

#_038EEF: RTS

;===================================================================================================

TextCommand_15:
#_038EF0: REP #$30
#_038EF2: JSR GetNextTextByte
#_038EF5: AND.w #$007F
#_038EF8: ASL A
#_038EF9: TAX
#_038EFA: LDA.w .vectors,X
#_038EFD: STA.w $00E0

#_038F00: REP #$20
#_038F02: LDA.w $0A22
#_038F05: PHA
#_038F06: LDA.w $0A24
#_038F09: PHA
#_038F0A: LDA.w $0A26
#_038F0D: PHA
#_038F0E: LDA.w $00C0
#_038F11: PHA
#_038F12: LDA.w $00C2
#_038F15: PHA
#_038F16: PHP
#_038F17: REP #$30
#_038F19: JMP ($00E0)

.vectors
#_038F1C: dw routine038F56
#_038F1E: dw routine038F3A
#_038F20: dw routine038F40
#_038F22: dw routine038F4C
#_038F24: dw routine038F26

;===================================================================================================

routine038F26:
#_038F26: JSL routine01B4EA
#_038F2A: LDA.w #$4000
#_038F2D: STA.w $0528
#_038F30: JSL routine01B51F
#_038F34: JSL routine01B647
#_038F38: BRA .branch038F5A

;===================================================================================================

routine038F3A:
#_038F3A: JSL routine01B4EA
#_038F3E: BRA routine038F56

;===================================================================================================

routine038F40:
#_038F40: JSL routine01B4EA
#_038F44: LDA.w #$4000
#_038F47: STA.w $0528
#_038F4A: BRA routine038F56

;===================================================================================================

routine038F4C:
#_038F4C: JSL routine01B4EA
#_038F50: LDA.w #$8000
#_038F53: STA.w $0528

;===================================================================================================

routine038F56:
#_038F56: JSL routine01B51F

.branch038F5A
#_038F5A: PLP
#_038F5B: PLA
#_038F5C: STA.w $00C2
#_038F5F: PLA
#_038F60: STA.w $00C0
#_038F63: PLA
#_038F64: STA.w $0A26
#_038F67: PLA
#_038F68: STA.w $0A24
#_038F6B: PLA
#_038F6C: STA.w $0A22

#_038F6F: SEP #$20
#_038F71: STZ.w $0A3C
#_038F74: LDA.w $0566
#_038F77: BNE .branch038F7D

#_038F79: JSR GetNextTextByte
#_038F7C: RTS

.branch038F7D
#_038F7D: REP #$30
#_038F7F: LDA.w #$3D83
#_038F82: STA.w $0A0B
#_038F85: LDA.w #$3DC4
#_038F88: STA.w $0A1A
#_038F8B: LDA.w #$0018
#_038F8E: STA.w $0A1E
#_038F91: LDA.w #$000C
#_038F94: STA.w $0A20
#_038F97: LDA.w #$0002
#_038F9A: STA.w $0A1C
#_038F9D: STZ.w $0A28
#_038FA0: JSR TextCommand_ClearMessageBox
#_038FA3: LDA.w #$0003
#_038FA6: STA.w $0A2A
#_038FA9: STA.w $0E00
#_038FAC: JSR routine0392C1
#_038FAF: DEC.w $0A2A
#_038FB2: JSR GetNextTextByte
#_038FB5: JSR ChangeMessageID
#_038FB8: LDA.w $0A1A
#_038FBB: CLC
#_038FBC: ADC.w #$0040
#_038FBF: STA.w $0A2F
#_038FC2: RTS

;===================================================================================================

TextCommand_16:
#_038FC3: SEP #$20
#_038FC5: JSR GetNextTextByte
#_038FC8: LDA.w $0A22
#_038FCB: PHA
#_038FCC: LDA.w $0A24
#_038FCF: PHA
#_038FD0: LDA.w $0A26
#_038FD3: PHA
#_038FD4: LDA.w $00C0
#_038FD7: PHA
#_038FD8: LDA.w $00C1
#_038FDB: PHA
#_038FDC: LDA.w $00C2
#_038FDF: PHA
#_038FE0: PHP
#_038FE1: JSL routine01B5AE
#_038FE5: PLP
#_038FE6: PLA
#_038FE7: STA.w $00C2
#_038FEA: PLA
#_038FEB: STA.w $00C1
#_038FEE: PLA
#_038FEF: STA.w $00C0
#_038FF2: PLA
#_038FF3: STA.w $0A26
#_038FF6: PLA
#_038FF7: STA.w $0A24
#_038FFA: PLA
#_038FFB: STA.w $0A22
#_038FFE: JMP .branch038F7D

;===================================================================================================

TextCommand_17:
#_039001: REP #$20

#_039003: JSR GetNextTextByte
#_039006: AND.w #$0001
#_039009: ASL A
#_03900A: JSL routine01E5CD

#_03900E: SEP #$20
#_039010: STZ.w $0524
#_039013: RTS

;===================================================================================================

TextCommand_WriteDemon1Name:
#_039014: REP #$20

#_039016: LDA.w $050C
#_039019: JMP WriteDemonNameToBuffer

;===================================================================================================

TextCommand_ChangeMessageByStatus:
#_03901C: SEP #$30
#_03901E: JSR GetNextTextByte
#_039021: TAX
#_039022: LDA.w data03905A,X
#_039025: STA.w $0E00

#_039028: REP #$30
#_03902A: LDX.w #$0000
#_03902D: LDY.w #$0003

.branch039030
#_039030: LSR.w $0E00
#_039033: BCC .branch039042

#_039035: LDA.w $1000,X
#_039038: BEQ .branch039051

#_03903A: LDA.w $1002,X
#_03903D: AND.w #$F640
#_039040: BNE .branch039051

.branch039042
#_039042: TXA
#_039043: CLC
#_039044: ADC.w #$0060
#_039047: TAX
#_039048: DEY
#_039049: BPL .branch039030

#_03904B: SEP #$20
#_03904D: JSR GetNextTextByte
#_039050: RTS

.branch039051
#_039051: SEP #$20
#_039053: JSR GetNextTextByte
#_039056: JSR ChangeMessageID
#_039059: RTS

data03905A:
#_03905A: db $01,$02,$04,$08,$03,$05,$09,$06
#_039062: db $0A,$0C,$07,$0B,$0D,$0E,$0F

;===================================================================================================

TextCommand_DisplayShop:
#_039069: JSL routine0F945E

#_03906D: REP #$20
#_03906F: LDA.w #$0007
#_039072: STA.w $0E00
#_039075: JSR routine0392C1

#_039078: SEP #$30
#_03907A: INC.w $0A3D
#_03907D: JSR GetNextTextByte
#_039080: STA.w $0C41

#_039083: REP #$30
#_039085: LDA.w $0A22
#_039088: PHA
#_039089: LDA.w $0A24
#_03908C: PHA
#_03908D: LDA.w $0A26
#_039090: PHA
#_039091: LDA.w $00C2
#_039094: PHA
#_039095: LDA.w $00C0
#_039098: PHA
#_039099: STZ.w $0A22
#_03909C: STZ.w $0A26
#_03909F: LDA.w #$0001
#_0390A2: STA.w $0A24
#_0390A5: JSR SetTextPointerFromMessageID
#_0390A8: JSL routine03834C

#_0390AC: REP #$30
#_0390AE: PLA
#_0390AF: STA.w $00C0
#_0390B2: PLA
#_0390B3: STA.w $00C2
#_0390B6: PLA
#_0390B7: STA.w $0A26
#_0390BA: PLA
#_0390BB: STA.w $0A24
#_0390BE: PLA
#_0390BF: STA.w $0A22

#_0390C2: SEP #$20
#_0390C4: DEC.w $0A3D
#_0390C7: RTS

;===================================================================================================

TextCommand_LoadDemonSlot1:
#_0390C8: SEP #$20

#_0390CA: JSR GetNextTextByte
#_0390CD: STA.w $050D
#_0390D0: STA.w $0BEE

#_0390D3: JSR GetNextTextByte

#_0390D6: JSR GetNextTextByte
#_0390D9: STA.w $0BED
#_0390DC: STA.w $050C

#_0390DF: LDA.b #$00
#_0390E1: JSR GetDemonXClass

#_0390E4: LDA.w $0BF3
#_0390E7: STA.w $0508

#_0390EA: JSR GetNextTextByte

#_0390ED: STA.w $0510

#_0390F0: REP #$20

#_0390F2: LDA.w #$FFFF
#_0390F5: STA.w $0524

#_0390F8: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine0390F9:
#_0390F9: SEP #$20

#_0390FB: LDA.w $1002
#_0390FE: BEQ .healthy

#_039100: JSR GetNextTextByte
#_039103: JSR ChangeMessageID

#_039106: RTS

.healthy
#_039107: JSR GetNextTextByte

#_03910A: RTS

;===================================================================================================

TextCommand_WriteSelectedName:
#_03910B: REP #$30

#_03910D: LDA.w $0A3E
#_039110: BMI .human

#_039112: PHA

#_039113: SEP #$20

#_039115: LDA.b #DemonNamePointers>>16
#_039117: STA.w $00C5

#_03911A: REP #$20

#_03911C: PLA
#_03911D: JMP WriteDemonNameToBuffer

.human
#_039120: AND.w #$000F
#_039123: JSL WriteCharacterName

#_039127: RTS

;===================================================================================================

TextCommand_WriteMomoName:
#_039128: SEP #$20

#_03912A: LDA.b #$01
#_03912C: JSL WriteCharacterName

#_039130: RTS

;===================================================================================================

TextCommand_WriteJimmyName:
#_039131: SEP #$20

#_039133: LDA.b #$02
#_039135: JSL WriteCharacterName

#_039139: RTS

;===================================================================================================

TextCommand_Write_him_Name_long:
#_03913A: JSR TextCommand_Write_him_Name

#_03913D: RTL

;===================================================================================================

TextCommand_Write_him_Name:
#_03913E: SEP #$20

#_039140: LDA.b #$03
#_039142: JSL WriteCharacterName

#_039146: RTS

;===================================================================================================

TextCommand_WriteChaseName:
#_039147: SEP #$20

#_039149: LDA.b #$00
#_03914B: JSL WriteCharacterName

#_03914F: RTS

;===================================================================================================

TextCommand_WriteTeamRepresentative:
#_039150: REP #$30

#_039152: LDX.w #$0000
#_039155: TXY

.next_person
#_039156: LDA.w $1000,X
#_039159: BPL .status_fine

#_03915B: INY

.status_fine
#_03915C: TXA
#_03915D: CLC
#_03915E: ADC.w #$0060
#_039161: TAX
#_039162: CPX.w #$0180
#_039165: BNE .next_person

;---------------------------------------------------------------------------------------------------

#_039167: STY.w $0E00
#_03916A: LDX.w #$0000

.check_next_name
#_03916D: LDA.w $1000,X
#_039170: BPL .skip_this_name

#_039172: LDA.w $1002,X
#_039175: AND.w #$C000
#_039178: BNE .skip_this_name

#_03917A: LDA.w $1004,X
#_03917D: STA.w $0E02
#_039180: BRA .write_name

.skip_this_name
#_039182: TXA
#_039183: CLC
#_039184: ADC.w #$0060
#_039187: TAX
#_039188: CPX.w #$0180
#_03918B: BNE .check_next_name

.write_name
#_03918D: LDA.w $0E00

#_039190: PHA
#_039191: PHP

#_039192: LDA.w $0E02
#_039195: JSL WriteCharacterName

#_039199: PLP
#_03919A: PLA

#_03919B: CMP.w #$0001
#_03919E: BNE .not_plural

#_0391A0: RTS

.not_plural
#_0391A1: SEP #$20

#_0391A3: LDA.b #$34
#_0391A5: JSL WriteNextMessageChar

#_0391A9: LDA.b #$35
#_0391AB: JSL WriteNextMessageChar

#_0391AF: RTS

;===================================================================================================

TextCommand_WriteCommonPhrase:
#_0391B0: SEP #$30
#_0391B2: INC.w $0A3D
#_0391B5: JSR GetNextTextByte
#_0391B8: STA.w $0E00

#_0391BB: REP #$30
#_0391BD: LDA.w $0A22
#_0391C0: PHA
#_0391C1: LDA.w $0A24
#_0391C4: PHA
#_0391C5: LDA.w $0A26
#_0391C8: PHA
#_0391C9: LDA.w $00C2
#_0391CC: PHA
#_0391CD: LDA.w $00C0
#_0391D0: PHA
#_0391D1: LDA.w $0E00
#_0391D4: AND.w #$00FF
#_0391D7: STA.w $0A22
#_0391DA: LDA.w $0E00
#_0391DD: STZ.w $0A24
#_0391E0: STZ.w $0A26
#_0391E3: LDA.w $0A3C
#_0391E6: AND.w #$00FF
#_0391E9: BEQ .branch0391F1

#_0391EB: LDA.w #$0002
#_0391EE: STA.w $0A26

.branch0391F1
#_0391F1: JSR SetTextPointerFromMessageID
#_0391F4: JSL routine03834C

#_0391F8: REP #$30
#_0391FA: PLA
#_0391FB: STA.w $00C0
#_0391FE: PLA
#_0391FF: STA.w $00C2
#_039202: PLA
#_039203: STA.w $0A26
#_039206: PLA
#_039207: STA.w $0A24
#_03920A: PLA
#_03920B: STA.w $0A22

#_03920E: SEP #$20
#_039210: DEC.w $0A3D
#_039213: RTS

;===================================================================================================

TextCommand_WriteItemName_long:
#_039214: JSR TextCommand_WriteItemName
#_039217: RTL

;===================================================================================================

TextCommand_WriteItemName:
#_039218: SEP #$20
#_03921A: LDA.b #ItemNamePointers>>16
#_03921C: STA.w $00C5

#_03921F: REP #$20
#_039221: LDA.w $0A50
#_039224: AND.w #$00FF
#_039227: STA.w $0A39
#_03922A: LDA.w #ItemNamePointers>>0
#_03922D: STA.w $00C3
#_039230: JSR WriteIndexedEntityName
#_039233: RTS

;===================================================================================================

TextCommand_WriteSpellName:
#_039234: SEP #$20
#_039236: LDA.b #SkillNamePointers>>16
#_039238: STA.w $00C5

#_03923B: REP #$20
#_03923D: LDA.w $0A52
#_039240: AND.w #$00FF
#_039243: STA.w $0A39
#_039246: LDA.w #SkillNamePointers>>0
#_039249: STA.w $00C3
#_03924C: JSR WriteIndexedEntityName
#_03924F: RTS

;===================================================================================================

TextCommand_WriteDemon0Name:
#_039250: SEP #$20
#_039252: LDA.b #DemonNamePointers>>16
#_039254: STA.w $00C5

#_039257: REP #$20
#_039259: LDA.w $050A

;---------------------------------------------------------------------------------------------------

WriteDemonNameToBuffer:
#_03925C: STA.w $0A39

#_03925F: CMP.w #$0100
#_039262: BCS .boss_name

#_039264: LDA.w #DemonNamePointers>>0

.branch039267
#_039267: STA.w $00C3

#_03926A: JSR WriteIndexedEntityName

#_03926D: RTS

.boss_name
#_03926E: AND.w #$00FF
#_039271: STA.w $0A39

#_039274: LDA.w #BossNamePointers>>0
#_039277: BRA .branch039267

;===================================================================================================

TextCommand_WriteClassName:
#_039279: SEP #$20
#_03927B: LDA.b #ClassNamePointers>>16
#_03927D: STA.w $00C5

#_039280: REP #$20
#_039282: LDA.w $0506
#_039285: AND.w #$00FF
#_039288: STA.w $0A39
#_03928B: LDA.w #ClassNamePointers>>0
#_03928E: STA.w $00C3
#_039291: JSR WriteIndexedEntityName
#_039294: RTS

;===================================================================================================
; Uses RNG to determine if there should be a change
;===================================================================================================
TextCommand_RNGDecision:
#_039295: SEP #$20
#_039297: SEP #$10

#_039299: JSR GetNextTextByte
#_03929C: STA.w $0E00

#_03929F: JSR GetNextTextByte

#CODE_0392A2:
#_0392A2: STA.w $0E02
#_0392A5: JSL GetRandomInt

#_0392A9: SEP #$20
#_0392AB: LDA.w $0ED5
#_0392AE: CMP.w $0E00
#_0392B1: BEQ .success
#_0392B3: BCS .fail

.success
#_0392B5: LDA.w $0E02
#_0392B8: JSR ChangeMessageID
#_0392BB: RTS

.fail
#_0392BC: RTS

;===================================================================================================

routine0392C1_long:
#_0392BD: JSR routine0392C1
#_0392C0: RTL

;===================================================================================================

routine0392C1:
#_0392C1: REP #$30

#_0392C3: INC.w $0E00

.wait
#_0392C6: REP #$30

#_0392C8: LDA.w $0A2A
#_0392CB: CMP.w $0E00
#_0392CE: BCC .continue

#_0392D0: RTS

.continue
#_0392D1: LDA.w $0A2A

#_0392D4: JSL routine00BA70
#_0392D8: JSL AddSelfAsVector

#_0392DC: INC.w $0A2A

#_0392DF: BRA .wait

;===================================================================================================

TextCommand_YesOrNoPrompt:
#_0392E1: JSR routine0384F9
#_0392E4: JSL RunFramesUntilDrawBufferEmpties
#_0392E8: JSL ResetMenuRowAndColumn

#_0392EC: REP #$30
#_0392EE: LDA.w #$0007
#_0392F1: STA.w $0E00
#_0392F4: JSR routine0392C1

#_0392F7: SEP #$20
#_0392F9: STZ.w $0A33

#_0392FC: REP #$30
#_0392FE: LDA.w $0A1A
#_039301: CLC
#_039302: ADC.w #$0112
#_039305: STA.w $0980
#_039308: LDX.w #$0000

.branch03930B
#_03930B: LDA.w YesText,X
#_03930E: JSL WriteNextMessageChar
#_039312: INX
#_039313: INX
#_039314: CPX.w #$0006
#_039317: BNE .branch03930B

#_039319: JSR routine0384F9
#_03931C: JSL RunFramesUntilDrawBufferEmpties

#_039320: SEP #$20
#_039322: STZ.w $0A33

#_039325: REP #$20
#_039327: LDA.w $0980
#_03932A: CLC
#_03932B: ADC.w #$0040
#_03932E: STA.w $0980
#_039331: LDX.w #$0000

.branch039334
#_039334: LDA.w NoText,X
#_039337: JSL WriteNextMessageChar
#_03933B: INX
#_03933C: INX
#_03933D: CPX.w #$0006
#_039340: BNE .branch039334

#_039342: JSR routine0384F9
#_039345: JSL RunFramesUntilDrawBufferEmpties
#_039349: LDA.w $0980
#_03934C: SEC
#_03934D: SBC.w #$0040
#_039350: STA.w $0980

#_039353: SEP #$20
#_039355: LDA.b #$00
#_039357: STA.w $09F4
#_03935A: STZ.w $09F3
#_03935D: STZ.w $09F2
#_039360: STZ.w $09F0
#_039363: LDA.b #$01
#_039365: STA.w $09F1
#_039368: LDA.b #$FE
#_03936A: JSL TestGameProgressBit
#_03936E: BCC .branch03937C

#_039370: LDA.w $0A26
#_039373: CMP.b #$03
#_039375: BNE .branch03937C

#_039377: LDA.w $0A24
#_03937A: BEQ .branch0393A1

.branch03937C
#_03937C: JSL routine02C8E9

#_039380: SEP #$30
#_039382: LDA.w $09F3
#_039385: BPL .branch03938C

#_039387: LDA.b #$02
#_039389: STA.w $09F3

.branch03938C
#_03938C: JSR GetNextTextByte
#_03938F: STA.w $0E00

#_039392: LDA.w $09F3
#_039395: BNE .branch03939D

#_039397: LDA.w $0E00
#_03939A: JSR ChangeMessageID

.branch03939D
#_03939D: JSR routine039406
#_0393A0: RTS

.branch0393A1
#_0393A1: JSR GetNextTextByte
#_0393A4: JSR ChangeMessageID
#_0393A7: RTS

YesText:
#_0393A8: dw $203E,$2026,$20CF

NoText:
#_0393AE: dw $2026,$2026,$2028

;===================================================================================================

TextCommand_NewLine:
#_0393B4: JSR routine0384F9
#_0393B7: JSL RunFramesUntilDrawBufferEmpties

#_0393BB: REP #$20

#_0393BD: INC.w $0A28
#_0393C0: JSR routine0393C4

#_0393C3: RTS

;===================================================================================================

routine0393C4:
#_0393C4: REP #$20
#_0393C6: LDA.w $0A28
#_0393C9: CMP.w $0A2A
#_0393CC: BCS .branch0393CF

#_0393CE: RTS

.branch0393CF
#_0393CF: LDA.w $0A2A
#_0393D2: CMP.w #$0007
#_0393D5: BCS .branch0393EB

#_0393D7: INC.w $0A2A
#_0393DA: LDA.w $0A2A
#_0393DD: JSL routine00BA70
#_0393E1: LDA.w $0A2A
#_0393E4: DEC A
#_0393E5: DEC A
#_0393E6: JSL SomeDMAPrep_02CBD1
#_0393EA: RTS

.branch0393EB
#_0393EB: LDA.w #$0007
#_0393EE: STA.w $0A2A
#_0393F1: STA.w $0A28
#_0393F4: RTS

;===================================================================================================

TextCommand_ClearMessageBox_long:
#_0393F5: PHP

#_0393F6: PHB
#_0393F7: PHK
#_0393F8: PLB

#_0393F9: JSR TextCommand_ClearMessageBox

#_0393FC: PLB
#_0393FD: PLP

#_0393FE: RTL

;===================================================================================================

TextCommand_ClearMessageBox:
#_0393FF: JSR routine0384F9
#_039402: JSL RunFramesUntilDrawBufferEmpties

;===================================================================================================

routine039406:
#_039406: REP #$20
#_039408: STZ.w $0A28
#_03940B: LDA.w #$20CF
#_03940E: JSL routine038277
#_039412: LDA.w $0A1A
#_039415: STA.w $0A2F
#_039418: RTS

;===================================================================================================

TextCommand_Write32BitInteger:
#_039419: REP #$30
#_03941B: LDA.w $0A54
#_03941E: STA.w $0E00
#_039421: LDA.w $0A56
#_039424: STA.w $0E02
#_039427: LDX.w #$0009

.branch0394A2
#_03942A: PHX
#_03942B: LDA.w $0E00
#_03942E: LDX.w $0E02
#_039431: LDY.w #$000A
#_039434: JSL DivisionBig_XA_by_Y
#_039438: PLX

#_039439: SEP #$20
#_03943B: LDA.w $0E86
#_03943E: INC A
#_03943F: STA.w $0E04,X

#_039442: REP #$20
#_039444: LDA.w $0E80
#_039447: STA.w $0E00
#_03944A: LDA.w $0E82
#_03944D: STA.w $0E02
#_039450: DEX
#_039451: BPL .branch0394A2

#_039453: SEP #$30
#_039455: STZ.w $0E0E
#_039458: LDY.b #$00

.branch03945A
#_03945A: LDX.w $0A33
#_03945D: LDA.w $0E04,Y
#_039460: CMP.b #$01
#_039462: BNE .branch039474

#_039464: LDA.w $0E0E
#_039467: BNE .branch039477

#_039469: CPY.b #$09
#_03946B: BEQ .branch039477

#_03946D: LDA.b #$CF
#_03946F: STA.w $0E04,Y
#_039472: BRA .branch039481

.branch039474
#_039474: INC.w $0E0E

.branch039477
#_039477: LDA.w $0E04,Y
#_03947A: STA.w $0904,X
#_03947D: JSL WriteSingleTileToMessageBuffer

.branch039481
#_039481: INY
#_039482: CPY.b #$0A
#_039484: BNE .branch03945A

#_039486: RTS

;===================================================================================================

TextCommand_WaitForKey:
#_039487: REP #$20
#_039489: JSR routine0393C4
#_03948C: INC.w $0A28

.branch03948F
#_03948F: SEP #$30
#_039491: LDA.w $0A33
#_039494: LSR A
#_039495: CMP.w $0A1E
#_039498: BCS .branch0394B6

#_03949A: LDX.w $0A33
#_03949D: LDA.b #$CF
#_03949F: STA.w $0900,X
#_0394A2: STA.w $0940,X
#_0394A5: LDA.w $0A2C
#_0394A8: STA.w $0901,X
#_0394AB: STA.w $0941,X
#_0394AE: INC.w $0A33
#_0394B1: INC.w $0A33
#_0394B4: BRA .branch03948F

.branch0394B6
#_0394B6: JSR routine0384F9
#_0394B9: JSL RunFramesUntilDrawBufferEmpties

#_0394BD: REP #$20
#_0394BF: LDA.w $0F2B
#_0394C2: BNE .branch0394F8

#_0394C4: SEP #$30
#_0394C6: LDX.w $0A33
#_0394C9: DEX
#_0394CA: DEX
#_0394CB: LDA.b #$AB
#_0394CD: STA.w $0900,X
#_0394D0: LDA.b #$20
#_0394D2: STA.w $0901,X
#_0394D5: INC.w $0A35
#_0394D8: LDA.w $0A35
#_0394DB: AND.b #$10
#_0394DD: BEQ .branch0394E9

#_0394DF: LDA.b #$CF
#_0394E1: STA.w $0900,X
#_0394E4: LDA.b #$20
#_0394E6: STA.w $0901,X

.branch0394E9
#_0394E9: JSR routine0384F9
#_0394EC: BRA .branch0394B6

;===================================================================================================

; TODO confirm unreachable?
UNREACHABLE_0394EE:
#_0394EE: SEP #$30
#_0394F0: JSR GetNextTextByte
#_0394F3: JSR ChangeMessageID
#_0394F6: BRA .branch0394F8

.branch0394F8
#_0394F8: SEP #$30
#_0394FA: LDA.b #$02 ; SFX 02
#_0394FC: JSL WriteAPUCareful
#_039500: LDX.w $0A33
#_039503: DEX
#_039504: DEX
#_039505: LDA.b #$CF
#_039507: STA.w $0900,X
#_03950A: LDA.b #$20
#_03950C: STA.w $0901,X
#_03950F: JSR routine0384F9
#_039512: JSL RunFramesUntilDrawBufferEmpties
#_039516: RTS

;===================================================================================================
; ???
;===================================================================================================
TextCommand_2D:
#_039517: SEP #$20

#_039519: JSR GetNextTextByte
#_03951C: STA.w $0A3B

#_03951F: RTS

;===================================================================================================

TextCommand_ExtendedTextCommand:
#_039520: JSR ExtendedTextCommand

#_039523: RTS

;===================================================================================================

TerminateMessage:
#_039524: JSR routine0384F9

#_039527: SEP #$20
#_039529: LDA.w $0A3D
#_03952C: BNE .branch039552

#_03952E: REP #$20
#_039530: LDA.w #$3DC4
#_039533: STA.w $0A1A
#_039536: STA.w $0980
#_039539: STZ.w $0A33

#_03953C: SEP #$20
#_03953E: LDA.w $0400
#_039541: AND.b #$40
#_039543: BNE .branch039552

#_039545: LDA.w $0EEF
#_039548: BPL .branch03954E

#_03954A: JSL routine0F939C

.branch03954E
#_03954E: JSL routine0F9342

.branch039552
#_039552: REP #$20
#_039554: PLA
#_039555: PLB
#_039556: PLP
#_039557: RTL

;===================================================================================================

SmallMultiplication_long:
#_039558: JSR SmallMultiplication

#_03955B: RTL

;===================================================================================================
; Multiplies 2 8-bit numbers
;===================================================================================================
SmallMultiplication:
#_03955C: PHP
#_03955D: SEP #$30

#_03955F: LDA.w $0E10
#_039562: STA.w WRMPYA

#_039565: LDA.w $0E11
#_039568: STA.w WRMPYB

#_03956B: LDX.b #$08

.wait
#_03956D: DEX
#_03956E: BNE .wait

#_039570: REP #$20

#_039572: LDA.w RDMPYL
#_039575: STA.w $0E12

#_039578: PLP
#_039579: RTS

;===================================================================================================

BigMultiplication_long:
#_03957A: JSR BigMultiplication

#_03957D: RTL

;===================================================================================================
; Multiplies two 16-bit numbers
;===================================================================================================
BigMultiplication:
#_03957E: PHP

#_03957F: SEP #$20
#_039581: SEP #$10

#_039583: LDA.w $0E10
#_039586: LDX.w $0E12
#_039589: JSR .a_times_x

#_03958C: LDA.w RDMPYL
#_03958F: STA.w $0E14
#_039592: LDA.w RDMPYH

#_039595: STA.w $0E15

;---------------------------------------------------------------------------------------------------

#_039598: LDA.w $0E10
#_03959B: LDX.w $0E13
#_03959E: JSR .a_times_x

#_0395A1: LDA.w RDMPYL
#_0395A4: CLC
#_0395A5: ADC.w $0E15
#_0395A8: STA.w $0E15

#_0395AB: LDA.w RDMPYH
#_0395AE: ADC.b #$00
#_0395B0: STA.w $0E16

;---------------------------------------------------------------------------------------------------

#_0395B3: LDA.w $0E11
#_0395B6: LDX.w $0E12
#_0395B9: JSR .a_times_x

#_0395BC: LDA.w RDMPYL
#_0395BF: CLC
#_0395C0: ADC.w $0E15
#_0395C3: STA.w $0E15

#_0395C6: LDA.w RDMPYH
#_0395C9: ADC.w $0E16
#_0395CC: STA.w $0E16

#_0395CF: LDA.b #$00
#_0395D1: ADC.b #$00
#_0395D3: STA.w $0E17

;---------------------------------------------------------------------------------------------------

#_0395D6: LDA.w $0E11
#_0395D9: LDX.w $0E13

#_0395DC: JSR .a_times_x

#_0395DF: LDA.w RDMPYL
#_0395E2: CLC
#_0395E3: ADC.w $0E16
#_0395E6: STA.w $0E16

#_0395E9: LDA.w RDMPYH
#_0395EC: ADC.w $0E17
#_0395EF: STA.w $0E17

#_0395F2: PLP
#_0395F3: RTS

;---------------------------------------------------------------------------------------------------

.a_times_x
#_0395F4: STA.w WRMPYA
#_0395F7: STX.w WRMPYB

#_0395FA: LDX.b #$08

.wait
#_0395FC: DEX
#_0395FD: BNE .wait

#_0395FF: RTS

;===================================================================================================

routine039600:
#_039600: PHX
#_039601: PHP
#_039602: SEP #$20
#_039604: SEP #$10
#_039606: LDA.w $0E10
#_039609: STA.w WRDIVL
#_03960C: LDA.w $0E11
#_03960F: STA.w WRDIVH
#_039612: LDA.w $0E12
#_039615: STA.w WRDIVB
#_039618: LDX.b #$10

.branch03961A
#_03961A: DEX
#_03961B: BNE .branch03961A

#_03961D: REP #$20
#_03961F: LDA.w RDDIVL
#_039622: STA.w $0E13
#_039625: LDA.w RDMPYL
#_039628: STA.w $0E15
#_03962B: PLP
#_03962C: PLX
#_03962D: RTS

;===================================================================================================

WriteIndexedEntityName_long:
#_03962E: JSR WriteIndexedEntityName
#_039631: RTL

;===================================================================================================

WriteIndexedEntityName:
#_039632: PHP
#_039633: REP #$30

#_039635: LDA.w $0A39
#_039638: ASL A
#_039639: TAY

#_03963A: LDA.b [$C3],Y
#_03963C: STA.w $00C3

#_03963F: LDY.w #$0000

.next_character
#_039642: SEP #$30

#_039644: LDA.b [$C3],Y
#_039646: CMP.b #$FF
#_039648: BEQ .end

#_03964A: JSL WriteNextMessageChar

#_03964E: INY
#_03964F: BRA .next_character

.end
#_039651: PLP
#_039652: RTS

;===================================================================================================

R039653_SomeTextPars:
#_039653: REP #$30

#_039655: LDA.w $0A33
#_039658: CLC
#_039659: ADC.w #$0004
#_03965C: TAX

#_03965D: LDA.w $0980
#_039660: STA.w $0102

#_039663: SEC
#_039664: SBC.w #$0020
#_039667: STA.w $0102,X

#_03966A: LDA.w $0A33
#_03966D: LSR A
#_03966E: STA.w $0104
#_039671: STA.w $0104,X

#_039674: STA.w $0E00
#_039677: STZ.w $0E02

#_03967A: STX.w $0E04

;---------------------------------------------------------------------------------------------------

#_03967D: LDY.w #$0000

.next
#_039680: LDX.w $0E02

#_039683: LDA.w $0900,Y
#_039686: STA.w $0106,X

#_039689: LDX.w $0E04
#_03968C: LDA.w $0940,Y
#_03968F: STA.w $0106,X

#_039692: INC.w $0E02
#_039695: INC.w $0E02

#_039698: INC.w $0E04
#_03969B: INC.w $0E04

#_03969E: INY
#_03969F: INY
#_0396A0: DEC.w $0E00
#_0396A3: BNE .next

#_0396A5: LDA.w #$0002
#_0396A8: STA.w $0100

#_0396AB: RTS

;===================================================================================================

ClearTextBuffer_long:
#_0396AC: JSR ClearTextBuffer
#_0396AF: RTL

;===================================================================================================

ClearTextBuffer:
#_0396B0: PHX
#_0396B1: PHA

#_0396B2: PHP

#_0396B3: REP #$30

#_0396B5: LDX.w #$0000
#_0396B8: LDA.w #$20CF

.next
#_0396BB: STA.w $0900,X

#_0396BE: INX
#_0396BF: INX
#_0396C0: CPX.w #$0080
#_0396C3: BNE .next

#_0396C5: PLP

#_0396C6: PLA
#_0396C7: PLX

#_0396C8: RTS

;===================================================================================================
; I called these classy messages for some reason
;===================================================================================================
LoadClassyMessage:
#_0396C9: REP #$30

#_0396CB: PHB
#_0396CC: PHK
#_0396CD: PLB

#_0396CE: LDA.w $0A12
#_0396D1: PHA
#_0396D2: AND.w #$C000
#_0396D5: XBA
#_0396D6: LSR A
#_0396D7: LSR A
#_0396D8: LSR A
#_0396D9: LSR A
#_0396DA: LSR A
#_0396DB: LSR A
#_0396DC: STA.w $0A26

#_0396DF: ASL A
#_0396E0: TAY

#_0396E1: LDA.w .pointers,Y
#_0396E4: STA.w $00E0

#_0396E7: PLA
#_0396E8: AND.w #$3FFF
#_0396EB: ASL A
#_0396EC: TAY

#_0396ED: LDA.b ($E0),Y

#_0396EF: SEP #$20

#_0396F1: STA.w $0A24

#_0396F4: XBA

#_0396F5: REP #$20

#_0396F7: AND.w #$00FF
#_0396FA: STA.w $0A22

#_0396FD: PLB
#_0396FE: RTL

;---------------------------------------------------------------------------------------------------

.pointers
#_0396FF: dw .set_0_message_ids
#_039701: dw .set_1_message_ids
#_039703: dw .set_2_message_ids
#_039705: dw .set_3_message_ids

;---------------------------------------------------------------------------------------------------

.set_0_message_ids
#_039707: dw $0000, $0100, $0200, $0300
#_03970F: dw $0400, $0500, $0600, $0700
#_039717: dw $0800, $0900, $0A00, $0B00
#_03971F: dw $0C00, $0D00, $0E00, $0F00
#_039727: dw $1000, $1100, $1200, $1300
#_03972F: dw $1400, $1500, $1600, $1700
#_039737: dw $1800, $1900, $1A00, $1B00
#_03973F: dw $1C00, $1D00, $1E00, $1F00
#_039747: dw $2000, $2100, $2200, $2300
#_03974F: dw $2400, $2500, $2600, $2700
#_039757: dw $2800, $2900, $2A00, $2B00
#_03975F: dw $2C00, $2D00, $2E00, $2F00
#_039767: dw $3000, $3100, $3200, $3300
#_03976F: dw $3400, $3500, $3600, $3700
#_039777: dw $3800, $3900, $3A00, $3B00
#_03977F: dw $3C00, $3D00, $3E00, $3F00
#_039787: dw $4000, $4100, $4200, $4300
#_03978F: dw $4400, $4500, $4600, $4700
#_039797: dw $4800, $4900, $4A00, $4B00
#_03979F: dw $4C00, $4D00, $4E00, $4F00
#_0397A7: dw $5000, $5100, $5200, $5300
#_0397AF: dw $5400, $5500, $5600, $5700
#_0397B7: dw $5800, $5900, $5A00, $5B00
#_0397BF: dw $5C00, $5D00, $5E00, $5F00
#_0397C7: dw $6000, $6100, $6200, $6300
#_0397CF: dw $6400, $6500, $6600, $6700
#_0397D7: dw $6800, $6900, $6A00, $6B00
#_0397DF: dw $6C00, $6D00, $6E00, $6F00
#_0397E7: dw $7000, $7100, $7200, $7300
#_0397EF: dw $7400, $7500, $7600, $7700
#_0397F7: dw $7800, $7900, $7A00, $7B00
#_0397FF: dw $7C00, $7D00, $7E00, $7F00
#_039807: dw $8000, $8100, $8200, $8300
#_03980F: dw $8400, $8500, $8600, $8700
#_039817: dw $8800, $8900, $8A00, $8B00
#_03981F: dw $8C00, $8D00, $8E00, $8F00
#_039827: dw $9000, $9100, $0001, $0002
#_03982F: dw $0102, $0202, $0302, $0402
#_039837: dw $0502, $0602, $0702, $0802
#_03983F: dw $0902, $0A02, $0B02, $0C02
#_039847: dw $0D02, $0E02, $0F02, $1002
#_03984F: dw $1102, $1202, $1302, $1402
#_039857: dw $1502, $1602, $1702, $1802
#_03985F: dw $1902, $1A02, $1B02, $1C02
#_039867: dw $1D02, $1E02, $1F02, $2002
#_03986F: dw $2102, $2202, $2302, $2402
#_039877: dw $2502, $2602, $2702, $2802
#_03987F: dw $2902, $2A02, $2B02, $2C02
#_039887: dw $2D02, $2E02, $2F02, $3002
#_03988F: dw $3102, $3202, $3302, $3402
#_039897: dw $3502, $3602, $3702, $3802
#_03989F: dw $3902, $3A02, $3B02, $3C02
#_0398A7: dw $3D02, $3E02, $3F02, $4002
#_0398AF: dw $4102, $4202, $4302, $4402
#_0398B7: dw $4502, $4602, $4702, $4802
#_0398BF: dw $4902, $4A02, $4B02, $4C02
#_0398C7: dw $4D02, $4E02, $4F02, $5002
#_0398CF: dw $5102, $5202, $5302, $5402
#_0398D7: dw $5502, $5602, $5702, $5802
#_0398DF: dw $5902, $5A02, $5B02, $5C02
#_0398E7: dw $5D02, $5E02, $5F02, $6002
#_0398EF: dw $6102, $6202, $6302, $6402
#_0398F7: dw $6502, $6602, $6702, $6802
#_0398FF: dw $6902, $6A02, $6B02, $6C02
#_039907: dw $6D02, $6E02, $6F02, $7002
#_03990F: dw $7102, $7202, $7302, $7402
#_039917: dw $7502, $7602, $7702, $7802
#_03991F: dw $7902, $7A02, $7B02, $7C02
#_039927: dw $7D02, $7E02, $7F02, $8002
#_03992F: dw $8102, $8202, $8302, $8402
#_039937: dw $8502, $8602, $8702, $8802
#_03993F: dw $8902, $8A02, $8B02, $8C02
#_039947: dw $8D02, $8E02, $8F02, $9002
#_03994F: dw $9102, $9202, $9302, $9402
#_039957: dw $9502, $9602, $9702, $9802
#_03995F: dw $9902, $9A02, $9B02, $9C02
#_039967: dw $9D02, $9E02, $9F02, $A002
#_03996F: dw $A102, $A202, $A302, $A402
#_039977: dw $A502, $A602, $A702, $A802
#_03997F: dw $A902, $AA02, $AB02, $AC02
#_039987: dw $AD02, $AE02, $AF02, $B002
#_03998F: dw $B102, $B202, $B302, $B402
#_039997: dw $B502, $B602, $B702, $B802
#_03999F: dw $B902, $BA02, $BB02, $BC02
#_0399A7: dw $BD02, $BE02, $BF02, $C002
#_0399AF: dw $C102, $C202, $C302, $C402
#_0399B7: dw $C502, $C602, $C702, $C802
#_0399BF: dw $C902, $CA02, $CB02, $CC02
#_0399C7: dw $CD02, $CE02, $CF02, $D002
#_0399CF: dw $D102, $D202, $D302, $D402
#_0399D7: dw $D502, $D602, $D702, $D802
#_0399DF: dw $D902, $DA02, $DB02, $DC02
#_0399E7: dw $DD02, $DE02, $DF02, $E002
#_0399EF: dw $E102, $E202, $E302, $E402
#_0399F7: dw $E502, $E602, $E702, $E802
#_0399FF: dw $E902, $EA02, $EB02, $EC02
#_039A07: dw $ED02, $EE02, $EF02, $F002
#_039A0F: dw $F102, $F202, $F302, $F402
#_039A17: dw $F502, $F602, $F702, $F802
#_039A1F: dw $F902, $FA02, $FB02, $0003
#_039A27: dw $0103, $0203, $0303, $0403
#_039A2F: dw $0503, $0603, $0703, $0803
#_039A37: dw $0903, $0A03, $0B03, $0C03
#_039A3F: dw $0D03, $0E03, $0F03, $1003
#_039A47: dw $1103, $1203, $1303, $1403
#_039A4F: dw $1503, $1603, $1703, $1803
#_039A57: dw $1903, $1A03, $1B03, $1C03
#_039A5F: dw $1D03, $1E03, $1F03, $2003
#_039A67: dw $2103, $2203, $2303, $2403
#_039A6F: dw $2503, $2603, $2703, $2803
#_039A77: dw $2903, $2A03, $2B03, $2C03
#_039A7F: dw $2D03, $2E03, $2F03, $3003
#_039A87: dw $3103, $3203, $3303, $3403
#_039A8F: dw $3503, $3603, $3703, $3803
#_039A97: dw $3903, $3A03, $3B03, $3C03
#_039A9F: dw $3D03, $3E03, $3F03, $4003
#_039AA7: dw $4103, $4203, $4303, $4403
#_039AAF: dw $4503, $4603, $4703, $4803
#_039AB7: dw $4903, $4A03, $4B03, $4C03
#_039ABF: dw $4D03, $4E03, $4F03, $5003
#_039AC7: dw $5103, $5203, $5303, $5403
#_039ACF: dw $5503, $5603, $5703, $5803
#_039AD7: dw $5903, $5A03, $5B03, $5C03
#_039ADF: dw $5D03, $5E03, $5F03, $6003
#_039AE7: dw $6103, $6203, $6303, $6403
#_039AEF: dw $6503, $6603, $6703, $6803
#_039AF7: dw $6903, $6A03, $6B03, $6C03
#_039AFF: dw $6D03, $6E03, $6F03, $7003
#_039B07: dw $7103, $7203, $7303, $7403
#_039B0F: dw $7503, $7603, $7703, $7803
#_039B17: dw $7903, $7A03, $7B03, $7C03
#_039B1F: dw $7D03, $7E03, $7F03, $8003
#_039B27: dw $8103, $8203, $8303, $8403
#_039B2F: dw $8503, $8603, $8703, $8803
#_039B37: dw $8903, $8A03, $8B03, $8C03
#_039B3F: dw $8D03, $8E03, $8F03, $9003
#_039B47: dw $9103, $9203, $9303, $9403
#_039B4F: dw $9503, $9603, $9703, $9803
#_039B57: dw $9903, $9A03, $9B03, $9C03
#_039B5F: dw $9D03, $9E03, $9F03, $A003
#_039B67: dw $A103, $A203, $A303, $A403
#_039B6F: dw $A503, $A603, $A703, $A803
#_039B77: dw $A903, $AA03, $AB03, $AC03
#_039B7F: dw $AD03, $AE03, $AF03, $B003
#_039B87: dw $B103, $B203, $B303, $B403
#_039B8F: dw $B503, $B603, $B703, $B803
#_039B97: dw $B903, $BA03, $BB03, $BC03
#_039B9F: dw $BD03, $BE03, $BF03, $C003
#_039BA7: dw $C103, $C203, $C303, $C403
#_039BAF: dw $C503, $C603, $C703, $C803
#_039BB7: dw $C903, $CA03, $CB03, $CC03
#_039BBF: dw $CD03, $CE03, $CF03, $D003
#_039BC7: dw $D103, $D203, $D303, $D403
#_039BCF: dw $D503, $D603, $D703, $D803
#_039BD7: dw $D903, $DA03, $DB03, $DC03
#_039BDF: dw $DD03, $DE03, $DF03, $E003
#_039BE7: dw $E103, $E203, $E303, $0004
#_039BEF: dw $0005, $0105, $0205, $0305
#_039BF7: dw $0405, $0505, $0605, $0705
#_039BFF: dw $0805, $0905, $0A05, $0B05
#_039C07: dw $0C05, $0D05, $0E05, $0F05
#_039C0F: dw $1005, $1105, $1205, $1305
#_039C17: dw $1405, $1505, $1605, $1705
#_039C1F: dw $1805, $1905, $1A05, $1B05
#_039C27: dw $1C05, $1D05, $1E05, $1F05
#_039C2F: dw $2005, $2105, $2205, $2305
#_039C37: dw $2405, $2505, $2605, $2705
#_039C3F: dw $2805, $2905, $2A05, $2B05
#_039C47: dw $2C05, $2D05, $2E05, $2F05
#_039C4F: dw $3005, $3105, $3205, $3305
#_039C57: dw $3405, $3505, $3605, $3705
#_039C5F: dw $3805, $3905, $3A05, $3B05
#_039C67: dw $3C05, $3D05, $3E05, $3F05
#_039C6F: dw $4005, $4105, $4205, $4305
#_039C77: dw $4405, $4505, $4605, $4705
#_039C7F: dw $4805, $4905, $4A05, $4B05
#_039C87: dw $4C05, $4D05, $4E05, $4F05
#_039C8F: dw $0006, $0206, $0406, $0606
#_039C97: dw $0906, $0B06, $0D06, $0E06
#_039C9F: dw $0F06, $1206, $1706, $1A06
#_039CA7: dw $1C06, $1F06, $2406, $2706
#_039CAF: dw $2A06, $2B06, $0007, $0207
#_039CB7: dw $0F07, $1007, $1107, $1207
#_039CBF: dw $1307, $1C07, $1F07, $2607
#_039CC7: dw $0008, $1208, $1D08, $1E08
#_039CCF: dw $2D08, $3008, $3108, $3608
#_039CD7: dw $3908, $0009, $0109, $0A09
#_039CDF: dw $0D09, $1609, $1809, $1B09
#_039CE7: dw $1F09, $2109, $2A09, $2C09
#_039CEF: dw $2D09, $3209, $3809, $4D09
#_039CF7: dw $4F09, $5209, $5309, $5409
#_039CFF: dw $5509, $5C09, $5E09, $6109
#_039D07: dw $6409, $000A, $020A, $030A
#_039D0F: dw $040A, $050A, $060A, $070A
#_039D17: dw $090A, $0B0A, $0C0A, $0D0A
#_039D1F: dw $0E0A, $0F0A, $100A, $120A
#_039D27: dw $130A, $140A, $150A, $160A
#_039D2F: dw $170A, $1C0A, $1D0A, $1E0A
#_039D37: dw $1F0A, $200A, $210A, $220A
#_039D3F: dw $230A, $240A, $250A, $290A
#_039D47: dw $000B, $010B, $020B, $040B
#_039D4F: dw $070B, $080B, $0A0B, $0E0B
#_039D57: dw $0F0B, $100B, $110B, $120B
#_039D5F: dw $130B, $140B, $150B, $160B
#_039D67: dw $170B, $180B, $190B, $1A0B
#_039D6F: dw $1B0B, $1C0B, $1D0B, $1E0B
#_039D77: dw $1F0B, $200B, $210B, $220B
#_039D7F: dw $000C, $010C, $160C, $1C0C
#_039D87: dw $1F0C, $210C, $230C, $290C
#_039D8F: dw $2D0C, $2E0C, $310C, $340C
#_039D97: dw $370C, $3A0C, $3D0C, $400C
#_039D9F: dw $430C, $470C, $480C, $490C
#_039DA7: dw $4A0C, $4B0C, $4C0C, $4D0C
#_039DAF: dw $4E0C, $500C, $520C, $5D0C
#_039DB7: dw $5F0C, $6A0C, $6E0C, $720C

;---------------------------------------------------------------------------------------------------

.set_1_message_ids
#_039DBF: dw $0000, $0100, $0A00, $1300
#_039DC7: dw $1500, $1600, $1B00, $1C00
#_039DCF: dw $2000, $2300, $2400, $2500
#_039DD7: dw $2700, $2900, $2A00, $2C00
#_039DDF: dw $2E00, $3000, $3200, $3400
#_039DE7: dw $3600, $3800, $3A00, $0001
#_039DEF: dw $0201, $0601, $0901, $1901
#_039DF7: dw $1C01, $1F01, $2301, $2D01
#_039DFF: dw $2E01, $2F01, $3001, $3101
#_039E07: dw $3201, $3301, $3401, $3601
#_039E0F: dw $3801, $3901, $3A01, $3B01
#_039E17: dw $0002, $0A02, $1202, $1302
#_039E1F: dw $1402, $1502, $1602, $1702
#_039E27: dw $1802, $1C02, $1D02, $1F02
#_039E2F: dw $2302, $2F02, $0003, $0703
#_039E37: dw $1403, $2803, $2F03, $3703
#_039E3F: dw $3A03, $3E03, $4203, $4603
#_039E47: dw $4A03, $4F03, $5303, $5703
#_039E4F: dw $5B03, $5D03, $5F03, $6103
#_039E57: dw $6603, $6703, $6903, $6A03
#_039E5F: dw $0004, $1004, $2004, $2B04
#_039E67: dw $2C04, $2D04, $2E04, $2F04
#_039E6F: dw $3004, $3104, $3204, $3304
#_039E77: dw $3404, $3504, $4304, $4404
#_039E7F: dw $0005, $1E05, $2205, $2505
#_039E87: dw $2705, $2805, $2905, $2A05
#_039E8F: dw $2B05, $2C05, $2D05, $3705
#_039E97: dw $3C05, $4105, $4605, $0006
#_039E9F: dw $0306, $1506, $1606, $0007
#_039EA7: dw $0807, $1407, $1607, $1807
#_039EAF: dw $0008, $0408, $0508, $0808
#_039EB7: dw $0908, $0B08, $1608, $0009
#_039EBF: dw $000A, $010A, $020A, $030A
#_039EC7: dw $040A, $050A, $060A, $070A
#_039ECF: dw $080A, $090A, $0A0A, $0B0A
#_039ED7: dw $0C0A

;---------------------------------------------------------------------------------------------------

.set_2_message_ids
#_039ED9: dw $0001, $0002, $1702, $0003
#_039EE1: dw $0004, $0005, $0006, $0007
#_039EE9: dw $0008, $0009, $0409, $000A
#_039EF1: dw $210A, $000B, $1F0B, $000C
#_039EF9: dw $770C, $780C, $000D, $000E
#_039F01: dw $080E, $090E, $4F0E, $840E
#_039F09: dw $850E, $000F, $0010, $0110
#_039F11: dw $0210, $0310, $0F10, $2310
#_039F19: dw $0011, $0111, $0211, $0012
#_039F21: dw $0612, $0812, $0013, $0113
#_039F29: dw $0A13, $0014, $0214, $0914
#_039F31: dw $0D14, $0F14, $0015, $0115
#_039F39: dw $0016, $0116, $001D, $011D
#_039F41: dw $021D, $031D, $041D, $051D
#_039F49: dw $061D, $071D, $081D, $091D
#_039F51: dw $0A1D, $111D, $141D, $151D
#_039F59: dw $171D, $181D, $191D, $1A1D
#_039F61: dw $1B1D, $1C1D, $1D1D, $1E1D
#_039F69: dw $201D, $211D, $221D, $231D
#_039F71: dw $241D, $251D, $261D, $271D
#_039F79: dw $281D, $2A1D, $2B1D, $2C1D
#_039F81: dw $2D1D, $2E1D, $2F1D, $001E
#_039F89: dw $041E, $081E, $0C1E, $0D1E
#_039F91: dw $0E1E, $0F1E, $101E, $111E
#_039F99: dw $1C1E, $201E, $231E, $001F
#_039FA1: dw $021F, $031F, $041F, $061F
#_039FA9: dw $081F, $0A1F, $101F, $131F
#_039FB1: dw $1A1F, $1C1F, $201F, $221F
#_039FB9: dw $241F, $251F, $271F, $291F
#_039FC1: dw $2B1F, $2D1F, $311F

;---------------------------------------------------------------------------------------------------

.set_3_message_ids
#_039FC7: dw $0000, $0001, $0002, $0102
#_039FCF: dw $1202, $1302, $1402, $1502
#_039FD7: dw $2702, $2802, $2902, $2A02
#_039FDF: dw $2F02, $3502, $3602, $3C02
#_039FE7: dw $4202, $4702, $4C02, $5102
#_039FEF: dw $5502, $5902, $5E02, $6002
#_039FF7: dw $6902, $6B02, $7402, $7602
#_039FFF: dw $7F02, $9302, $9502, $A002
#_03A007: dw $A202, $AD02, $AF02, $BA02
#_03A00F: dw $C002, $DB02, $DD02, $E902
#_03A017: dw $EB02, $0003, $0103, $0303
#_03A01F: dw $0503, $0603, $0703, $0903
#_03A027: dw $0A03, $0B03, $0D03, $0F03
#_03A02F: dw $1803, $1A03, $1C03, $0004
#_03A037: dw $0404, $1104, $1504, $2604
#_03A03F: dw $3404, $3604, $4104, $4404
#_03A047: dw $4704, $4A04, $0005, $0205
#_03A04F: dw $0F05, $1105, $1E05, $2005
#_03A057: dw $2D05, $2F05, $4205, $4A05
#_03A05F: dw $4C05, $0006, $0106, $0506
#_03A067: dw $0F06, $1206, $1406, $0007
#_03A06F: dw $0C07, $1407, $2507, $2D07
#_03A077: dw $3607, $3907, $3D07, $4007
#_03A07F: dw $4207, $4607, $0008, $0B08
#_03A087: dw $1F08, $0009, $0209, $1209
#_03A08F: dw $1309, $1409, $1509, $1709
#_03A097: dw $1909, $1B09, $000A

;===================================================================================================

ShopActionMessagePointers:
#_03A09D: dw data03A0ED
#_03A09F: dw data03A0F4
#_03A0A1: dw data03A0FB
#_03A0A3: dw data03A101
#_03A0A5: dw data03A107
#_03A0A7: dw data03A10E
#_03A0A9: dw data03A115
#_03A0AB: dw data03A11C
#_03A0AD: dw data03A121
#_03A0AF: dw data03A126
#_03A0B1: dw data03A12B
#_03A0B3: dw data03A130
#_03A0B5: dw data03A137
#_03A0B7: dw data03A13E
#_03A0B9: dw data03A144
#_03A0BB: dw data03A14A
#_03A0BD: dw data03A151
#_03A0BF: dw data03A158
#_03A0C1: dw data03A15E
#_03A0C3: dw data03A165
#_03A0C5: dw data03A16C
#_03A0C7: dw data03A172
#_03A0C9: dw data03A179
#_03A0CB: dw data03A17F
#_03A0CD: dw data03A186
#_03A0CF: dw data03A18D
#_03A0D1: dw data03A193
#_03A0D3: dw data03A19A
#_03A0D5: dw data03A1A1
#_03A0D7: dw data03A1A7
#_03A0D9: dw data03A1AE
#_03A0DB: dw data03A1B5
#_03A0DD: dw data03A1BC
#_03A0DF: dw data03A1C3
#_03A0E1: dw data03A1CA
#_03A0E3: dw data03A1D0
#_03A0E5: dw data03A1D6
#_03A0E7: dw data03A1DB
#_03A0E9: dw data03A1E0
#_03A0EB: dw data03A1E5

;---------------------------------------------------------------------------------------------------

data03A0ED:
#_03A0ED: db $05 ; message count
#_03A0EE: db $00 ; Buy
#_03A0EF: db $01 ; Sell
#_03A0F0: db $02 ; Equip
#_03A0F1: db $03 ; Check status
#_03A0F2: db $07 ; Sort items
#_03A0F3: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A0F4:
#_03A0F4: db $05 ; message count
#_03A0F5: db $00 ; Buy
#_03A0F6: db $01 ; Sell
#_03A0F7: db $02 ; Equip
#_03A0F8: db $03 ; Check status
#_03A0F9: db $07 ; Sort items
#_03A0FA: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A0FB:
#_03A0FB: db $04 ; message count
#_03A0FC: db $00 ; Buy
#_03A0FD: db $01 ; Sell
#_03A0FE: db $03 ; Check status
#_03A0FF: db $07 ; Sort items
#_03A100: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A101:
#_03A101: db $04 ; message count
#_03A102: db $00 ; Buy
#_03A103: db $01 ; Sell
#_03A104: db $03 ; Check status
#_03A105: db $07 ; Sort items
#_03A106: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A107:
#_03A107: db $05 ; message count
#_03A108: db $00 ; Buy
#_03A109: db $01 ; Sell
#_03A10A: db $02 ; Equip
#_03A10B: db $03 ; Check status
#_03A10C: db $07 ; Sort items
#_03A10D: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A10E:
#_03A10E: db $05 ; message count
#_03A10F: db $00 ; Buy
#_03A110: db $01 ; Sell
#_03A111: db $02 ; Equip
#_03A112: db $03 ; Check status
#_03A113: db $07 ; Sort items
#_03A114: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A115:
#_03A115: db $05 ; message count
#_03A116: db $00 ; Buy
#_03A117: db $01 ; Sell
#_03A118: db $02 ; Equip
#_03A119: db $03 ; Check status
#_03A11A: db $07 ; Sort items
#_03A11B: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A11C:
#_03A11C: db $03 ; message count
#_03A11D: db $00 ; Buy
#_03A11E: db $03 ; Check status
#_03A11F: db $07 ; Sort items
#_03A120: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A121:
#_03A121: db $03 ; message count
#_03A122: db $00 ; Buy
#_03A123: db $03 ; Check status
#_03A124: db $07 ; Sort items
#_03A125: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A126:
#_03A126: db $03 ; message count
#_03A127: db $00 ; Buy
#_03A128: db $03 ; Check status
#_03A129: db $07 ; Sort items
#_03A12A: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A12B:
#_03A12B: db $03 ; message count
#_03A12C: db $00 ; Buy
#_03A12D: db $03 ; Check status
#_03A12E: db $07 ; Sort items
#_03A12F: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A130:
#_03A130: db $05 ; message count
#_03A131: db $00 ; Buy
#_03A132: db $01 ; Sell
#_03A133: db $02 ; Equip
#_03A134: db $03 ; Check status
#_03A135: db $07 ; Sort items
#_03A136: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A137:
#_03A137: db $05 ; message count
#_03A138: db $00 ; Buy
#_03A139: db $01 ; Sell
#_03A13A: db $02 ; Equip
#_03A13B: db $03 ; Check status
#_03A13C: db $07 ; Sort items
#_03A13D: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A13E:
#_03A13E: db $04 ; message count
#_03A13F: db $00 ; Buy
#_03A140: db $01 ; Sell
#_03A141: db $03 ; Check status
#_03A142: db $07 ; Sort items
#_03A143: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A144:
#_03A144: db $04 ; message count
#_03A145: db $00 ; Buy
#_03A146: db $01 ; Sell
#_03A147: db $03 ; Check status
#_03A148: db $07 ; Sort items
#_03A149: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A14A:
#_03A14A: db $05 ; message count
#_03A14B: db $00 ; Buy
#_03A14C: db $01 ; Sell
#_03A14D: db $02 ; Equip
#_03A14E: db $03 ; Check status
#_03A14F: db $07 ; Sort items
#_03A150: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A151:
#_03A151: db $05 ; message count
#_03A152: db $00 ; Buy
#_03A153: db $01 ; Sell
#_03A154: db $02 ; Equip
#_03A155: db $03 ; Check status
#_03A156: db $07 ; Sort items
#_03A157: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A158:
#_03A158: db $04 ; message count
#_03A159: db $00 ; Buy
#_03A15A: db $01 ; Sell
#_03A15B: db $03 ; Check status
#_03A15C: db $07 ; Sort items
#_03A15D: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A15E:
#_03A15E: db $05 ; message count
#_03A15F: db $00 ; Buy
#_03A160: db $01 ; Sell
#_03A161: db $02 ; Equip
#_03A162: db $03 ; Check status
#_03A163: db $07 ; Sort items
#_03A164: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A165:
#_03A165: db $05 ; message count
#_03A166: db $00 ; Buy
#_03A167: db $01 ; Sell
#_03A168: db $02 ; Equip
#_03A169: db $03 ; Check status
#_03A16A: db $07 ; Sort items
#_03A16B: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A16C:
#_03A16C: db $04 ; message count
#_03A16D: db $00 ; Buy
#_03A16E: db $01 ; Sell
#_03A16F: db $03 ; Check status
#_03A170: db $07 ; Sort items
#_03A171: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A172:
#_03A172: db $05 ; message count
#_03A173: db $00 ; Buy
#_03A174: db $01 ; Sell
#_03A175: db $02 ; Equip
#_03A176: db $03 ; Check status
#_03A177: db $07 ; Sort items
#_03A178: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A179:
#_03A179: db $04 ; message count
#_03A17A: db $00 ; Buy
#_03A17B: db $01 ; Sell
#_03A17C: db $03 ; Check status
#_03A17D: db $07 ; Sort items
#_03A17E: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A17F:
#_03A17F: db $05 ; message count
#_03A180: db $00 ; Buy
#_03A181: db $01 ; Sell
#_03A182: db $02 ; Equip
#_03A183: db $03 ; Check status
#_03A184: db $07 ; Sort items
#_03A185: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A186:
#_03A186: db $05 ; message count
#_03A187: db $00 ; Buy
#_03A188: db $01 ; Sell
#_03A189: db $02 ; Equip
#_03A18A: db $03 ; Check status
#_03A18B: db $07 ; Sort items
#_03A18C: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A18D:
#_03A18D: db $04 ; message count
#_03A18E: db $00 ; Buy
#_03A18F: db $01 ; Sell
#_03A190: db $03 ; Check status
#_03A191: db $07 ; Sort items
#_03A192: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A193:
#_03A193: db $05 ; message count
#_03A194: db $00 ; Buy
#_03A195: db $01 ; Sell
#_03A196: db $02 ; Equip
#_03A197: db $03 ; Check status
#_03A198: db $07 ; Sort items
#_03A199: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A19A:
#_03A19A: db $05 ; message count
#_03A19B: db $00 ; Buy
#_03A19C: db $01 ; Sell
#_03A19D: db $02 ; Equip
#_03A19E: db $03 ; Check status
#_03A19F: db $07 ; Sort items
#_03A1A0: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1A1:
#_03A1A1: db $04 ; message count
#_03A1A2: db $00 ; Buy
#_03A1A3: db $01 ; Sell
#_03A1A4: db $03 ; Check status
#_03A1A5: db $07 ; Sort items
#_03A1A6: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1A7:
#_03A1A7: db $05 ; message count
#_03A1A8: db $00 ; Buy
#_03A1A9: db $01 ; Sell
#_03A1AA: db $02 ; Equip
#_03A1AB: db $03 ; Check status
#_03A1AC: db $07 ; Sort items
#_03A1AD: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1AE:
#_03A1AE: db $05 ; message count
#_03A1AF: db $00 ; Buy
#_03A1B0: db $01 ; Sell
#_03A1B1: db $02 ; Equip
#_03A1B2: db $03 ; Check status
#_03A1B3: db $07 ; Sort items
#_03A1B4: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1B5:
#_03A1B5: db $05 ; message count
#_03A1B6: db $00 ; Buy
#_03A1B7: db $01 ; Sell
#_03A1B8: db $02 ; Equip
#_03A1B9: db $03 ; Check status
#_03A1BA: db $07 ; Sort items
#_03A1BB: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1BC:
#_03A1BC: db $05 ; message count
#_03A1BD: db $00 ; Buy
#_03A1BE: db $01 ; Sell
#_03A1BF: db $02 ; Equip
#_03A1C0: db $03 ; Check status
#_03A1C1: db $07 ; Sort items
#_03A1C2: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1C3:
#_03A1C3: db $05 ; message count
#_03A1C4: db $00 ; Buy
#_03A1C5: db $01 ; Sell
#_03A1C6: db $02 ; Equip
#_03A1C7: db $03 ; Check status
#_03A1C8: db $07 ; Sort items
#_03A1C9: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1CA:
#_03A1CA: db $04 ; message count
#_03A1CB: db $00 ; Buy
#_03A1CC: db $01 ; Sell
#_03A1CD: db $03 ; Check status
#_03A1CE: db $07 ; Sort items
#_03A1CF: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1D0:
#_03A1D0: db $04 ; message count
#_03A1D1: db $00 ; Buy
#_03A1D2: db $01 ; Sell
#_03A1D3: db $03 ; Check status
#_03A1D4: db $07 ; Sort items
#_03A1D5: db $04 ; Exit store

;---------------------------------------------------------------------------------------------------

data03A1D6:
#_03A1D6: db $03 ; message count
#_03A1D7: db $00 ; Buy
#_03A1D8: db $03 ; Check status
#_03A1D9: db $07 ; Sort items
#_03A1DA: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A1DB:
#_03A1DB: db $03 ; message count
#_03A1DC: db $00 ; Buy
#_03A1DD: db $03 ; Check status
#_03A1DE: db $07 ; Sort items
#_03A1DF: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A1E0:
#_03A1E0: db $03 ; message count
#_03A1E1: db $00 ; Buy
#_03A1E2: db $03 ; Check status
#_03A1E3: db $07 ; Sort items
#_03A1E4: db $06 ; Don't buy

;---------------------------------------------------------------------------------------------------

data03A1E5:
#_03A1E5: db $03 ; message count
#_03A1E6: db $00 ; Buy
#_03A1E7: db $03 ; Check status
#_03A1E8: db $07 ; Sort items
#_03A1E9: db $06 ; Don't buy

;===================================================================================================

ShopStockPointers:
#_03A1EA: dw ShopStock00
#_03A1EC: dw ShopStock01
#_03A1EE: dw ShopStock02
#_03A1F0: dw ShopStock03
#_03A1F2: dw ShopStock04
#_03A1F4: dw ShopStock05
#_03A1F6: dw ShopStock06
#_03A1F8: dw ShopStock07
#_03A1FA: dw ShopStock08
#_03A1FC: dw ShopStock09
#_03A1FE: dw ShopStock0A
#_03A200: dw ShopStock0B
#_03A202: dw ShopStock0C
#_03A204: dw ShopStock0D
#_03A206: dw ShopStock0E
#_03A208: dw ShopStock0F
#_03A20A: dw ShopStock10
#_03A20C: dw ShopStock11
#_03A20E: dw ShopStock12
#_03A210: dw ShopStock13
#_03A212: dw ShopStock14
#_03A214: dw ShopStock15
#_03A216: dw ShopStock16
#_03A218: dw ShopStock17
#_03A21A: dw ShopStock18
#_03A21C: dw ShopStock19
#_03A21E: dw ShopStock1A
#_03A220: dw ShopStock1B
#_03A222: dw ShopStock1C
#_03A224: dw ShopStock1D
#_03A226: dw ShopStock1E
#_03A228: dw ShopStock1F
#_03A22A: dw ShopStock20
#_03A22C: dw ShopStock21
#_03A22E: dw ShopStock22
#_03A230: dw ShopStock23
#_03A232: dw ShopStock24
#_03A234: dw ShopStock25
#_03A236: dw ShopStock26
#_03A238: dw ShopStock27

;---------------------------------------------------------------------------------------------------

ShopStock00:
#_03A23A: db $03 ; 4 items
#_03A23B: db $60 ; item 60
#_03A23C: db $78 ; item 78
#_03A23D: db $90 ; item 90
#_03A23E: db $A0 ; item A0

;---------------------------------------------------------------------------------------------------

ShopStock01:
#_03A23F: db $04 ; 5 items
#_03A240: db $61 ; item 61
#_03A241: db $79 ; item 79
#_03A242: db $91 ; item 91
#_03A243: db $A1 ; item A1
#_03A244: db $A2 ; item A2

;---------------------------------------------------------------------------------------------------

ShopStock02:
#_03A245: db $02 ; 3 items
#_03A246: db $B0 ; item B0
#_03A247: db $B1 ; item B1
#_03A248: db $B3 ; item B3

;---------------------------------------------------------------------------------------------------

ShopStock03:
#_03A249: db $02 ; 3 items
#_03A24A: db $B0 ; item B0
#_03A24B: db $B1 ; item B1
#_03A24C: db $B3 ; item B3

;---------------------------------------------------------------------------------------------------

ShopStock04:
#_03A24D: db $04 ; 5 items
#_03A24E: db $00 ; item 00
#_03A24F: db $01 ; item 01
#_03A250: db $02 ; item 02
#_03A251: db $04 ; item 04
#_03A252: db $05 ; item 05

;---------------------------------------------------------------------------------------------------

ShopStock05:
#_03A253: db $04 ; 5 items
#_03A254: db $02 ; item 02
#_03A255: db $03 ; item 03
#_03A256: db $04 ; item 04
#_03A257: db $06 ; item 06
#_03A258: db $09 ; item 09

;---------------------------------------------------------------------------------------------------

ShopStock06:
#_03A259: db $04 ; 5 items
#_03A25A: db $40 ; item 40
#_03A25B: db $41 ; item 41
#_03A25C: db $42 ; item 42
#_03A25D: db $50 ; item 50
#_03A25E: db $51 ; item 51

;---------------------------------------------------------------------------------------------------

ShopStock07:
#_03A25F: db $04 ; 5 items
#_03A260: db $CD ; item CD
#_03A261: db $D1 ; item D1
#_03A262: db $D7 ; item D7
#_03A263: db $DC ; item DC
#_03A264: db $E3 ; item E3

;---------------------------------------------------------------------------------------------------

ShopStock08:
#_03A265: db $04 ; 5 items
#_03A266: db $D1 ; item D1
#_03A267: db $D7 ; item D7
#_03A268: db $DC ; item DC
#_03A269: db $BB ; item BB
#_03A26A: db $E3 ; item E3

;---------------------------------------------------------------------------------------------------

ShopStock09:
#_03A26B: db $04 ; 5 items
#_03A26C: db $D6 ; item D6
#_03A26D: db $D8 ; item D8
#_03A26E: db $D0 ; item D0
#_03A26F: db $DD ; item DD
#_03A270: db $DE ; item DE

;---------------------------------------------------------------------------------------------------

ShopStock0A:
#_03A271: db $04 ; 5 items
#_03A272: db $CE ; item CE
#_03A273: db $CF ; item CF
#_03A274: db $DA ; item DA
#_03A275: db $DB ; item DB
#_03A276: db $E2 ; item E2

;---------------------------------------------------------------------------------------------------

ShopStock0B:
#_03A277: db $03 ; 4 items
#_03A278: db $43 ; item 43
#_03A279: db $44 ; item 44
#_03A27A: db $52 ; item 52
#_03A27B: db $53 ; item 53

;---------------------------------------------------------------------------------------------------

ShopStock0C:
#_03A27C: db $09 ; 10 items
#_03A27D: db $62 ; item 62
#_03A27E: db $63 ; item 63
#_03A27F: db $7A ; item 7A
#_03A280: db $7B ; item 7B
#_03A281: db $7C ; item 7C
#_03A282: db $92 ; item 92
#_03A283: db $93 ; item 93
#_03A284: db $94 ; item 94
#_03A285: db $A3 ; item A3
#_03A286: db $A4 ; item A4

;---------------------------------------------------------------------------------------------------

ShopStock0D:
#_03A287: db $04 ; 5 items
#_03A288: db $B5 ; item B5
#_03A289: db $B6 ; item B6
#_03A28A: db $B7 ; item B7
#_03A28B: db $B8 ; item B8
#_03A28C: db $BA ; item BA

;---------------------------------------------------------------------------------------------------

ShopStock0E:
#_03A28D: db $03 ; 4 items
#_03A28E: db $B6 ; item B6
#_03A28F: db $B7 ; item B7
#_03A290: db $B8 ; item B8
#_03A291: db $BA ; item BA

;---------------------------------------------------------------------------------------------------

ShopStock0F:
#_03A292: db $03 ; 4 items
#_03A293: db $44 ; item 44
#_03A294: db $45 ; item 45
#_03A295: db $52 ; item 52
#_03A296: db $53 ; item 53

;---------------------------------------------------------------------------------------------------

ShopStock10:
#_03A297: db $09 ; 10 items
#_03A298: db $64 ; item 64
#_03A299: db $65 ; item 65
#_03A29A: db $68 ; item 68
#_03A29B: db $7D ; item 7D
#_03A29C: db $81 ; item 81
#_03A29D: db $94 ; item 94
#_03A29E: db $95 ; item 95
#_03A29F: db $A3 ; item A3
#_03A2A0: db $A5 ; item A5
#_03A2A1: db $A6 ; item A6

;---------------------------------------------------------------------------------------------------

ShopStock11:
#_03A2A2: db $04 ; 5 items
#_03A2A3: db $C3 ; item C3
#_03A2A4: db $C4 ; item C4
#_03A2A5: db $C5 ; item C5
#_03A2A6: db $C6 ; item C6
#_03A2A7: db $C7 ; item C7

;---------------------------------------------------------------------------------------------------

ShopStock12:
#_03A2A8: db $09 ; 10 items
#_03A2A9: db $43 ; item 43
#_03A2AA: db $44 ; item 44
#_03A2AB: db $45 ; item 45
#_03A2AC: db $46 ; item 46
#_03A2AD: db $47 ; item 47
#_03A2AE: db $53 ; item 53
#_03A2AF: db $54 ; item 54
#_03A2B0: db $55 ; item 55
#_03A2B1: db $56 ; item 56
#_03A2B2: db $57 ; item 57

;---------------------------------------------------------------------------------------------------

ShopStock13:
#_03A2B3: db $09 ; 10 items
#_03A2B4: db $66 ; item 66
#_03A2B5: db $67 ; item 67
#_03A2B6: db $7E ; item 7E
#_03A2B7: db $7F ; item 7F
#_03A2B8: db $80 ; item 80
#_03A2B9: db $95 ; item 95
#_03A2BA: db $96 ; item 96
#_03A2BB: db $97 ; item 97
#_03A2BC: db $A4 ; item A4
#_03A2BD: db $A5 ; item A5

;---------------------------------------------------------------------------------------------------

ShopStock14:
#_03A2BE: db $09 ; 10 items
#_03A2BF: db $B6 ; item B6
#_03A2C0: db $B7 ; item B7
#_03A2C1: db $B8 ; item B8
#_03A2C2: db $BA ; item BA
#_03A2C3: db $BC ; item BC
#_03A2C4: db $C8 ; item C8
#_03A2C5: db $C9 ; item C9
#_03A2C6: db $CA ; item CA
#_03A2C7: db $CB ; item CB
#_03A2C8: db $CC ; item CC

;---------------------------------------------------------------------------------------------------

ShopStock15:
#_03A2C9: db $09 ; 10 items
#_03A2CA: db $69 ; item 69
#_03A2CB: db $82 ; item 82
#_03A2CC: db $98 ; item 98
#_03A2CD: db $A7 ; item A7
#_03A2CE: db $81 ; item 81
#_03A2CF: db $6A ; item 6A
#_03A2D0: db $83 ; item 83
#_03A2D1: db $99 ; item 99
#_03A2D2: db $A9 ; item A9
#_03A2D3: db $6C ; item 6C

;---------------------------------------------------------------------------------------------------

ShopStock16:
#_03A2D4: db $04 ; 5 items
#_03A2D5: db $B6 ; item B6
#_03A2D6: db $B7 ; item B7
#_03A2D7: db $B8 ; item B8
#_03A2D8: db $BA ; item BA
#_03A2D9: db $BC ; item BC

;---------------------------------------------------------------------------------------------------

ShopStock17:
#_03A2DA: db $04 ; 5 items
#_03A2DB: db $47 ; item 47
#_03A2DC: db $48 ; item 48
#_03A2DD: db $49 ; item 49
#_03A2DE: db $58 ; item 58
#_03A2DF: db $59 ; item 59

;---------------------------------------------------------------------------------------------------

ShopStock18:
#_03A2E0: db $09 ; 10 items
#_03A2E1: db $6B ; item 6B
#_03A2E2: db $6D ; item 6D
#_03A2E3: db $85 ; item 85
#_03A2E4: db $86 ; item 86
#_03A2E5: db $87 ; item 87
#_03A2E6: db $6F ; item 6F
#_03A2E7: db $88 ; item 88
#_03A2E8: db $9A ; item 9A
#_03A2E9: db $AA ; item AA
#_03A2EA: db $A8 ; item A8

;---------------------------------------------------------------------------------------------------

ShopStock19:
#_03A2EB: db $04 ; 5 items
#_03A2EC: db $C4 ; item C4
#_03A2ED: db $C5 ; item C5
#_03A2EE: db $C6 ; item C6
#_03A2EF: db $D2 ; item D2
#_03A2F0: db $D3 ; item D3

;---------------------------------------------------------------------------------------------------

ShopStock1A:
#_03A2F1: db $04 ; 5 items
#_03A2F2: db $49 ; item 49
#_03A2F3: db $4A ; item 4A
#_03A2F4: db $4B ; item 4B
#_03A2F5: db $5A ; item 5A
#_03A2F6: db $5B ; item 5B

;---------------------------------------------------------------------------------------------------

ShopStock1B:
#_03A2F7: db $03 ; 4 items
#_03A2F8: db $70 ; item 70
#_03A2F9: db $89 ; item 89
#_03A2FA: db $9B ; item 9B
#_03A2FB: db $AB ; item AB

;---------------------------------------------------------------------------------------------------

ShopStock1C:
#_03A2FC: db $07 ; 8 items
#_03A2FD: db $C8 ; item C8
#_03A2FE: db $C9 ; item C9
#_03A2FF: db $CA ; item CA
#_03A300: db $CB ; item CB
#_03A301: db $CC ; item CC
#_03A302: db $D2 ; item D2
#_03A303: db $D3 ; item D3
#_03A304: db $D9 ; item D9

;---------------------------------------------------------------------------------------------------

ShopStock1D:
#_03A305: db $04 ; 5 items
#_03A306: db $4A ; item 4A
#_03A307: db $4B ; item 4B
#_03A308: db $4C ; item 4C
#_03A309: db $5C ; item 5C
#_03A30A: db $5D ; item 5D

;---------------------------------------------------------------------------------------------------

ShopStock1E:
#_03A30B: db $09 ; 10 items
#_03A30C: db $47 ; item 47
#_03A30D: db $49 ; item 49
#_03A30E: db $4A ; item 4A
#_03A30F: db $4C ; item 4C
#_03A310: db $4D ; item 4D
#_03A311: db $59 ; item 59
#_03A312: db $5A ; item 5A
#_03A313: db $5B ; item 5B
#_03A314: db $5C ; item 5C
#_03A315: db $5D ; item 5D

;---------------------------------------------------------------------------------------------------

ShopStock1F:
#_03A316: db $04 ; 5 items
#_03A317: db $4C ; item 4C
#_03A318: db $4D ; item 4D
#_03A319: db $5A ; item 5A
#_03A31A: db $5B ; item 5B
#_03A31B: db $5C ; item 5C

;---------------------------------------------------------------------------------------------------

ShopStock20:
#_03A31C: db $13 ; 20 items
#_03A31D: db $6C ; item 6C
#_03A31E: db $6E ; item 6E
#_03A31F: db $6F ; item 6F
#_03A320: db $70 ; item 70
#_03A321: db $71 ; item 71
#_03A322: db $87 ; item 87
#_03A323: db $88 ; item 88
#_03A324: db $89 ; item 89
#_03A325: db $8A ; item 8A
#_03A326: db $8B ; item 8B
#_03A327: db $96 ; item 96
#_03A328: db $97 ; item 97
#_03A329: db $9A ; item 9A
#_03A32A: db $9B ; item 9B
#_03A32B: db $9C ; item 9C
#_03A32C: db $A5 ; item A5
#_03A32D: db $A8 ; item A8
#_03A32E: db $AA ; item AA
#_03A32F: db $AB ; item AB
#_03A330: db $AC ; item AC

;---------------------------------------------------------------------------------------------------

ShopStock21:
#_03A331: db $04 ; 5 items
#_03A332: db $71 ; item 71
#_03A333: db $8A ; item 8A
#_03A334: db $9C ; item 9C
#_03A335: db $AC ; item AC
#_03A336: db $8C ; item 8C

;---------------------------------------------------------------------------------------------------

ShopStock22:
#_03A337: db $0E ; 15 items
#_03A338: db $B6 ; item B6
#_03A339: db $B7 ; item B7
#_03A33A: db $B8 ; item B8
#_03A33B: db $BA ; item BA
#_03A33C: db $BC ; item BC
#_03A33D: db $C8 ; item C8
#_03A33E: db $C9 ; item C9
#_03A33F: db $CA ; item CA
#_03A340: db $CB ; item CB
#_03A341: db $CC ; item CC
#_03A342: db $C5 ; item C5
#_03A343: db $C6 ; item C6
#_03A344: db $D2 ; item D2
#_03A345: db $D3 ; item D3
#_03A346: db $D9 ; item D9

;---------------------------------------------------------------------------------------------------

ShopStock23:
#_03A347: db $07 ; 8 items
#_03A348: db $B6 ; item B6
#_03A349: db $B7 ; item B7
#_03A34A: db $B8 ; item B8
#_03A34B: db $D2 ; item D2
#_03A34C: db $D3 ; item D3
#_03A34D: db $C9 ; item C9
#_03A34E: db $CA ; item CA
#_03A34F: db $CB ; item CB

;---------------------------------------------------------------------------------------------------

ShopStock24:
#_03A350: db $04 ; 5 items
#_03A351: db $CD ; item CD
#_03A352: db $D1 ; item D1
#_03A353: db $D7 ; item D7
#_03A354: db $DC ; item DC
#_03A355: db $E3 ; item E3

;---------------------------------------------------------------------------------------------------

ShopStock25:
#_03A356: db $04 ; 5 items
#_03A357: db $D6 ; item D6
#_03A358: db $D8 ; item D8
#_03A359: db $D0 ; item D0
#_03A35A: db $DD ; item DD
#_03A35B: db $DE ; item DE

;---------------------------------------------------------------------------------------------------

ShopStock26:
#_03A35C: db $04 ; 5 items
#_03A35D: db $CE ; item CE
#_03A35E: db $CF ; item CF
#_03A35F: db $DA ; item DA
#_03A360: db $DB ; item DB
#_03A361: db $E2 ; item E2

;---------------------------------------------------------------------------------------------------

ShopStock27:
#_03A362: db $04 ; 5 items
#_03A363: db $D1 ; item D1
#_03A364: db $D7 ; item D7
#_03A365: db $DC ; item DC
#_03A366: db $BB ; item BB
#_03A367: db $E3 ; item E3

;===================================================================================================
; Values here are sometimes /10 actual value
; for various reasons
;===================================================================================================
ItemShopPrices:
#_03A368: dw $0032, $0019 ; item 00: buy      50 | sell      25
#_03A36C: dw $0041, $0020 ; item 01: buy      65 | sell      32
#_03A370: dw $0046, $0023 ; item 02: buy      70 | sell      35
#_03A374: dw $004E, $0027 ; item 03: buy      78 | sell      39
#_03A378: dw $005A, $002D ; item 04: buy      90 | sell      45
#_03A37C: dw $0078, $003C ; item 05: buy     120 | sell      60
#_03A380: dw $00B4, $005A ; item 06: buy     180 | sell      90
#_03A384: dw $0000, $0028 ; item 07: buy       0 | sell      40
#_03A388: dw $0000, $001E ; item 08: buy       0 | sell      30
#_03A38C: dw $00C8, $0064 ; item 09: buy     200 | sell     100
#_03A390: dw $0000, $0050 ; item 0A: buy       0 | sell      80
#_03A394: dw $0000, $000F ; item 0B: buy       0 | sell      15
#_03A398: dw $0000, $0016 ; item 0C: buy       0 | sell      22
#_03A39C: dw $0000, $001B ; item 0D: buy       0 | sell      27
#_03A3A0: dw $0000, $0025 ; item 0E: buy       0 | sell      37
#_03A3A4: dw $0000, $0027 ; item 0F: buy       0 | sell      39
#_03A3A8: dw $0000, $002A ; item 10: buy       0 | sell      42
#_03A3AC: dw $0000, $002D ; item 11: buy       0 | sell      45
#_03A3B0: dw $0000, $002F ; item 12: buy       0 | sell      47
#_03A3B4: dw $0000, $0032 ; item 13: buy       0 | sell      50
#_03A3B8: dw $0000, $0042 ; item 14: buy       0 | sell      66
#_03A3BC: dw $0000, $004B ; item 15: buy       0 | sell      75
#_03A3C0: dw $0000, $005A ; item 16: buy       0 | sell      90
#_03A3C4: dw $0000, $0064 ; item 17: buy       0 | sell     100
#_03A3C8: dw $0000, $0096 ; item 18: buy       0 | sell     150
#_03A3CC: dw $0000, $00B4 ; item 19: buy       0 | sell     180
#_03A3D0: dw $0000, $00CD ; item 1A: buy       0 | sell     205
#_03A3D4: dw $0000, $00D2 ; item 1B: buy       0 | sell     210
#_03A3D8: dw $0000, $00FA ; item 1C: buy       0 | sell     250
#_03A3DC: dw $0000, $0122 ; item 1D: buy       0 | sell     290
#_03A3E0: dw $0000, $0140 ; item 1E: buy       0 | sell     320
#_03A3E4: dw $0000, $0168 ; item 1F: buy       0 | sell     360
#_03A3E8: dw $0000, $01C2 ; item 20: buy       0 | sell     450
#_03A3EC: dw $0000, $01F4 ; item 21: buy       0 | sell     500
#_03A3F0: dw $0000, $026C ; item 22: buy       0 | sell     620
#_03A3F4: dw $0000, $0001 ; item 23: buy       0 | sell       1
#_03A3F8: dw $0000, $02EE ; item 24: buy       0 | sell     750
#_03A3FC: dw $0000, $033E ; item 25: buy       0 | sell     830
#_03A400: dw $0000, $0001 ; item 26: buy       0 | sell       1
#_03A404: dw $0000, $04B0 ; item 27: buy       0 | sell    1200
#_03A408: dw $0000, $0001 ; item 28: buy       0 | sell       1
#_03A40C: dw $0000, $0898 ; item 29: buy       0 | sell    2200
#_03A410: dw $0000, $0A8C ; item 2A: buy       0 | sell    2700
#_03A414: dw $0000, $0CE4 ; item 2B: buy       0 | sell    3300
#_03A418: dw $0000, $0DAC ; item 2C: buy       0 | sell    3500
#_03A41C: dw $0000, $0ED8 ; item 2D: buy       0 | sell    3800
#_03A420: dw $0000, $1004 ; item 2E: buy       0 | sell    4100
#_03A424: dw $0000, $1130 ; item 2F: buy       0 | sell    4400
#_03A428: dw $0000, $1A04 ; item 30: buy       0 | sell    6660
#_03A42C: dw $0000, $125C ; item 31: buy       0 | sell    4700
#_03A430: dw $0000, $1A04 ; item 32: buy       0 | sell    6660
#_03A434: dw $0000, $1324 ; item 33: buy       0 | sell    4900
#_03A438: dw $0000, $13EC ; item 34: buy       0 | sell    5100
#_03A43C: dw $0000, $1450 ; item 35: buy       0 | sell    5200
#_03A440: dw $0000, $157C ; item 36: buy       0 | sell    5500
#_03A444: dw $0000, $1A04 ; item 37: buy       0 | sell    6660
#_03A448: dw $0000, $1644 ; item 38: buy       0 | sell    5700
#_03A44C: dw $0000, $1770 ; item 39: buy       0 | sell    6000
#_03A450: dw $0000, $1770 ; item 3A: buy       0 | sell    6000
#_03A454: dw $0000, $1838 ; item 3B: buy       0 | sell    6200
#_03A458: dw $0000, $1900 ; item 3C: buy       0 | sell    6400
#_03A45C: dw $0000, $1900 ; item 3D: buy       0 | sell    6400
#_03A460: dw $0000, $1900 ; item 3E: buy       0 | sell    6400
#_03A464: dw $0000, $1964 ; item 3F: buy       0 | sell    6500
#_03A468: dw $0078, $003C ; item 40: buy     120 | sell      60
#_03A46C: dw $00B4, $005A ; item 41: buy     180 | sell      90
#_03A470: dw $00FA, $007D ; item 42: buy     250 | sell     125
#_03A474: dw $02BC, $015E ; item 43: buy     700 | sell     350
#_03A478: dw $03E8, $01F4 ; item 44: buy    1000 | sell     500
#_03A47C: dw $05DC, $02EE ; item 45: buy    1500 | sell     750
#_03A480: dw $07D0, $03E8 ; item 46: buy    2000 | sell    1000
#_03A484: dw $0AF0, $0578 ; item 47: buy    2800 | sell    1400
#_03A488: dw $0DAC, $06D6 ; item 48: buy    3500 | sell    1750
#_03A48C: dw $1388, $09C4 ; item 49: buy    5000 | sell    2500
#_03A490: dw $1F40, $0FA0 ; item 4A: buy    8000 | sell    4000
#_03A494: dw $2710, $1388 ; item 4B: buy   10000 | sell    5000
#_03A498: dw $3A98, $1D4C ; item 4C: buy   15000 | sell    7500
#_03A49C: dw $4E20, $2710 ; item 4D: buy   20000 | sell   10000
#_03A4A0: dw $0000, $3A98 ; item 4E: buy       0 | sell   15000
#_03A4A4: dw $0000, $4E20 ; item 4F: buy       0 | sell   20000
#_03A4A8: dw $000F, $0004 ; item 50: buy      15 | sell       4
#_03A4AC: dw $0028, $000A ; item 51: buy      40 | sell      10
#_03A4B0: dw $0019, $0006 ; item 52: buy      25 | sell       6
#_03A4B4: dw $0023, $0008 ; item 53: buy      35 | sell       8
#_03A4B8: dw $0050, $0014 ; item 54: buy      80 | sell      20
#_03A4BC: dw $0046, $0011 ; item 55: buy      70 | sell      17
#_03A4C0: dw $0064, $0019 ; item 56: buy     100 | sell      25
#_03A4C4: dw $00C8, $0032 ; item 57: buy     200 | sell      50
#_03A4C8: dw $012C, $004B ; item 58: buy     300 | sell      75
#_03A4CC: dw $0190, $0064 ; item 59: buy     400 | sell     100
#_03A4D0: dw $0258, $0096 ; item 5A: buy     600 | sell     150
#_03A4D4: dw $0320, $00C8 ; item 5B: buy     800 | sell     200
#_03A4D8: dw $03E8, $00FA ; item 5C: buy    1000 | sell     250
#_03A4DC: dw $05DC, $0177 ; item 5D: buy    1500 | sell     375
#_03A4E0: dw $0000, $0226 ; item 5E: buy       0 | sell     550
#_03A4E4: dw $0000, $0294 ; item 5F: buy       0 | sell     660
#_03A4E8: dw $000F, $0007 ; item 60: buy      15 | sell       7
#_03A4EC: dw $001C, $000E ; item 61: buy      28 | sell      14
#_03A4F0: dw $0028, $0014 ; item 62: buy      40 | sell      20
#_03A4F4: dw $003C, $001E ; item 63: buy      60 | sell      30
#_03A4F8: dw $005A, $002D ; item 64: buy      90 | sell      45
#_03A4FC: dw $0064, $0032 ; item 65: buy     100 | sell      50
#_03A500: dw $00DC, $006E ; item 66: buy     220 | sell     110
#_03A504: dw $00F0, $0078 ; item 67: buy     240 | sell     120
#_03A508: dw $0190, $00C8 ; item 68: buy     400 | sell     200
#_03A50C: dw $0258, $012C ; item 69: buy     600 | sell     300
#_03A510: dw $028A, $0145 ; item 6A: buy     650 | sell     325
#_03A514: dw $0320, $0190 ; item 6B: buy     800 | sell     400
#_03A518: dw $03E8, $01F4 ; item 6C: buy    1000 | sell     500
#_03A51C: dw $0578, $02BC ; item 6D: buy    1400 | sell     700
#_03A520: dw $0708, $0384 ; item 6E: buy    1800 | sell     900
#_03A524: dw $0BB8, $05DC ; item 6F: buy    3000 | sell    1500
#_03A528: dw $0E10, $0708 ; item 70: buy    3600 | sell    1800
#_03A52C: dw $0FA0, $07D0 ; item 71: buy    4000 | sell    2000
#_03A530: dw $0000, $1D4C ; item 72: buy       0 | sell    7500
#_03A534: dw $0000, $07D0 ; item 73: buy       0 | sell    2000
#_03A538: dw $0000, $09C4 ; item 74: buy       0 | sell    2500
#_03A53C: dw $0000, $0BB8 ; item 75: buy       0 | sell    3000
#_03A540: dw $0000, $0FA0 ; item 76: buy       0 | sell    4000
#_03A544: dw $0000, $1388 ; item 77: buy       0 | sell    5000
#_03A548: dw $0019, $000C ; item 78: buy      25 | sell      12
#_03A54C: dw $002D, $0016 ; item 79: buy      45 | sell      22
#_03A550: dw $0064, $0032 ; item 7A: buy     100 | sell      50
#_03A554: dw $008C, $0046 ; item 7B: buy     140 | sell      70
#_03A558: dw $0078, $003C ; item 7C: buy     120 | sell      60
#_03A55C: dw $00FA, $007D ; item 7D: buy     250 | sell     125
#_03A560: dw $0172, $00B9 ; item 7E: buy     370 | sell     185
#_03A564: dw $01F4, $00FA ; item 7F: buy     500 | sell     250
#_03A568: dw $030C, $0186 ; item 80: buy     780 | sell     390
#_03A56C: dw $03D4, $01EA ; item 81: buy     980 | sell     490
#_03A570: dw $04E2, $0271 ; item 82: buy    1250 | sell     625
#_03A574: dw $058C, $02C6 ; item 83: buy    1420 | sell     710
#_03A578: dw $076C, $03B6 ; item 84: buy    1900 | sell     950
#_03A57C: dw $0960, $04B0 ; item 85: buy    2400 | sell    1200
#_03A580: dw $0AF0, $0578 ; item 86: buy    2800 | sell    1400
#_03A584: dw $0BB8, $05DC ; item 87: buy    3000 | sell    1500
#_03A588: dw $0DAC, $06D6 ; item 88: buy    3500 | sell    1750
#_03A58C: dw $0FA0, $07D0 ; item 89: buy    4000 | sell    2000
#_03A590: dw $1388, $09C4 ; item 8A: buy    5000 | sell    2500
#_03A594: dw $1F40, $0FA0 ; item 8B: buy    8000 | sell    4000
#_03A598: dw $2710, $1388 ; item 8C: buy   10000 | sell    5000
#_03A59C: dw $0000, $1770 ; item 8D: buy       0 | sell    6000
#_03A5A0: dw $0000, $1F40 ; item 8E: buy       0 | sell    8000
#_03A5A4: dw $0000, $2710 ; item 8F: buy       0 | sell   10000
#_03A5A8: dw $000A, $0005 ; item 90: buy      10 | sell       5
#_03A5AC: dw $0019, $000C ; item 91: buy      25 | sell      12
#_03A5B0: dw $0028, $0014 ; item 92: buy      40 | sell      20
#_03A5B4: dw $002D, $000F ; item 93: buy      45 | sell      15
#_03A5B8: dw $0078, $003C ; item 94: buy     120 | sell      60
#_03A5BC: dw $00AA, $0055 ; item 95: buy     170 | sell      85
#_03A5C0: dw $00E6, $0073 ; item 96: buy     230 | sell     115
#_03A5C4: dw $01C2, $0113 ; item 97: buy     450 | sell     275
#_03A5C8: dw $01F4, $00FA ; item 98: buy     500 | sell     250
#_03A5CC: dw $03B6, $01DB ; item 99: buy     950 | sell     475
#_03A5D0: dw $04B0, $0258 ; item 9A: buy    1200 | sell     600
#_03A5D4: dw $0578, $02BC ; item 9B: buy    1400 | sell     700
#_03A5D8: dw $07D0, $03E8 ; item 9C: buy    2000 | sell    1000
#_03A5DC: dw $0000, $0384 ; item 9D: buy       0 | sell     900
#_03A5E0: dw $0000, $05DC ; item 9E: buy       0 | sell    1500
#_03A5E4: dw $0000, $0BB8 ; item 9F: buy       0 | sell    3000
#_03A5E8: dw $0012, $0009 ; item A0: buy      18 | sell       9
#_03A5EC: dw $001E, $000F ; item A1: buy      30 | sell      15
#_03A5F0: dw $0046, $0023 ; item A2: buy      70 | sell      35
#_03A5F4: dw $0078, $003C ; item A3: buy     120 | sell      60
#_03A5F8: dw $00A0, $0050 ; item A4: buy     160 | sell      80
#_03A5FC: dw $01F4, $00FA ; item A5: buy     500 | sell     250
#_03A600: dw $0366, $01B3 ; item A6: buy     870 | sell     435
#_03A604: dw $044C, $0226 ; item A7: buy    1100 | sell     550
#_03A608: dw $060E, $0307 ; item A8: buy    1550 | sell     775
#_03A60C: dw $05AA, $02D5 ; item A9: buy    1450 | sell     725
#_03A610: dw $06A4, $0352 ; item AA: buy    1700 | sell     850
#_03A614: dw $0834, $041A ; item AB: buy    2100 | sell    1050
#_03A618: dw $0AF0, $0578 ; item AC: buy    2800 | sell    1400
#_03A61C: dw $0000, $01F4 ; item AD: buy       0 | sell     500
#_03A620: dw $0000, $03E8 ; item AE: buy       0 | sell    1000
#_03A624: dw $0000, $05DC ; item AF: buy       0 | sell    1500
#_03A628: dw $0004, $0001 ; item B0: buy       4 | sell       1
#_03A62C: dw $000A, $0002 ; item B1: buy      10 | sell       2
#_03A630: dw $0000, $0008 ; item B2: buy       0 | sell       8
#_03A634: dw $0028, $000A ; item B3: buy      40 | sell      10
#_03A638: dw $0000, $0032 ; item B4: buy       0 | sell      50
#_03A63C: dw $003C, $000F ; item B5: buy      60 | sell      15
#_03A640: dw $0004, $0001 ; item B6: buy       4 | sell       1
#_03A644: dw $0005, $0001 ; item B7: buy       5 | sell       1
#_03A648: dw $000A, $0002 ; item B8: buy      10 | sell       2
#_03A64C: dw $0000, $0050 ; item B9: buy       0 | sell      80
#_03A650: dw $0046, $0011 ; item BA: buy      70 | sell      17
#_03A654: dw $0190, $0064 ; item BB: buy     400 | sell     100
#_03A658: dw $0030, $000C ; item BC: buy      48 | sell      12
#_03A65C: dw $0000, $0005 ; item BD: buy       0 | sell       5
#_03A660: dw $0000, $0005 ; item BE: buy       0 | sell       5
#_03A664: dw $0000, $0005 ; item BF: buy       0 | sell       5
#_03A668: dw $0000, $0005 ; item C0: buy       0 | sell       5
#_03A66C: dw $0000, $0005 ; item C1: buy       0 | sell       5
#_03A670: dw $0000, $0005 ; item C2: buy       0 | sell       5
#_03A674: dw $0002, $0001 ; item C3: buy       2 | sell       1
#_03A678: dw $000F, $0003 ; item C4: buy      15 | sell       3
#_03A67C: dw $0037, $0012 ; item C5: buy      55 | sell      18
#_03A680: dw $0078, $001E ; item C6: buy     120 | sell      30
#_03A684: dw $000A, $0002 ; item C7: buy      10 | sell       2
#_03A688: dw $0010, $0004 ; item C8: buy      16 | sell       4
#_03A68C: dw $000F, $0003 ; item C9: buy      15 | sell       3
#_03A690: dw $000D, $0003 ; item CA: buy      13 | sell       3
#_03A694: dw $0012, $0005 ; item CB: buy      18 | sell       5
#_03A698: dw $0011, $0004 ; item CC: buy      17 | sell       4
#_03A69C: dw $000B, $0003 ; item CD: buy      11 | sell       3
#_03A6A0: dw $0028, $000A ; item CE: buy      40 | sell      10
#_03A6A4: dw $001E, $0008 ; item CF: buy      30 | sell       8
#_03A6A8: dw $001C, $0007 ; item D0: buy      28 | sell       7
#_03A6AC: dw $0010, $0004 ; item D1: buy      16 | sell       4
#_03A6B0: dw $0009, $0002 ; item D2: buy       9 | sell       2
#_03A6B4: dw $000D, $0004 ; item D3: buy      13 | sell       4
#_03A6B8: dw $0000, $0078 ; item D4: buy       0 | sell     120
#_03A6BC: dw $0000, $0078 ; item D5: buy       0 | sell     120
#_03A6C0: dw $0028, $000A ; item D6: buy      40 | sell      10
#_03A6C4: dw $0024, $0009 ; item D7: buy      36 | sell       9
#_03A6C8: dw $0010, $0004 ; item D8: buy      16 | sell       4
#_03A6CC: dw $0004, $0001 ; item D9: buy       4 | sell       1
#_03A6D0: dw $0078, $001E ; item DA: buy     120 | sell      30
#_03A6D4: dw $0036, $000E ; item DB: buy      54 | sell      14
#_03A6D8: dw $0096, $0026 ; item DC: buy     150 | sell      38
#_03A6DC: dw $0030, $000C ; item DD: buy      48 | sell      12
#_03A6E0: dw $0032, $000C ; item DE: buy      50 | sell      12
#_03A6E4: dw $0000, $000A ; item DF: buy       0 | sell      10
#_03A6E8: dw $0000, $000A ; item E0: buy       0 | sell      10
#_03A6EC: dw $0000, $0064 ; item E1: buy       0 | sell     100
#_03A6F0: dw $0007, $0002 ; item E2: buy       7 | sell       2
#_03A6F4: dw $000C, $0003 ; item E3: buy      12 | sell       3
#_03A6F8: dw $0000, $0000 ; item E4: buy       0 | sell       0
#_03A6FC: dw $0000, $0000 ; item E5: buy       0 | sell       0
#_03A700: dw $0000, $0000 ; item E6: buy       0 | sell       0
#_03A704: dw $0000, $0000 ; item E7: buy       0 | sell       0
#_03A708: dw $0000, $0000 ; item E8: buy       0 | sell       0
#_03A70C: dw $0000, $0000 ; item E9: buy       0 | sell       0
#_03A710: dw $0000, $0000 ; item EA: buy       0 | sell       0
#_03A714: dw $0000, $0000 ; item EB: buy       0 | sell       0
#_03A718: dw $0000, $0000 ; item EC: buy       0 | sell       0
#_03A71C: dw $0000, $0000 ; item ED: buy       0 | sell       0
#_03A720: dw $0000, $0000 ; item EE: buy       0 | sell       0
#_03A724: dw $0000, $0000 ; item EF: buy       0 | sell       0
#_03A728: dw $0000, $0000 ; item F0: buy       0 | sell       0
#_03A72C: dw $0000, $0000 ; item F1: buy       0 | sell       0
#_03A730: dw $0000, $0000 ; item F2: buy       0 | sell       0
#_03A734: dw $0000, $0000 ; item F3: buy       0 | sell       0
#_03A738: dw $0000, $0000 ; item F4: buy       0 | sell       0
#_03A73C: dw $0000, $0000 ; item F5: buy       0 | sell       0
#_03A740: dw $0000, $0000 ; item F6: buy       0 | sell       0
#_03A744: dw $0000, $0000 ; item F7: buy       0 | sell       0
#_03A748: dw $0000, $0000 ; item F8: buy       0 | sell       0
#_03A74C: dw $0000, $0000 ; item F9: buy       0 | sell       0
#_03A750: dw $0000, $0000 ; item FA: buy       0 | sell       0
#_03A754: dw $0000, $0000 ; item FB: buy       0 | sell       0
#_03A758: dw $0000, $0000 ; item FC: buy       0 | sell       0
#_03A75C: dw $0000, $0000 ; item FD: buy       0 | sell       0
#_03A760: dw $0000, $0000 ; item FE: buy       0 | sell       0
#_03A764: dw $0000, $0000 ; item FF: buy       0 | sell       0

;===================================================================================================

ExtendedTextCommand:
#_03A768: SEP #$30

#_03A76A: JSR GetNextTextByte
#_03A76D: ASL A
#_03A76E: TAX

#_03A76F: LDA.w $0A3C
#_03A772: BNE .branch03A772

#_03A774: REP #$20
#_03A776: LDA.w ExtendedTextCommands,X
#_03A779: STA.w $00E0
#_03A77C: LDA.w #.branch03A772-1
#_03A77F: PHA
#_03A780: JMP ($00E0)

.branch03A772
#_03A783: REP #$20

#_03A785: LDA.w ExtendedTextCommandsOfSomeOtherType,X
#_03A788: STA.w $00E0

#_03A78B: LDA.w #.exit-1
#_03A78E: PHA

#_03A78F: JMP ($00E0)

.exit
#_03A792: RTS

;===================================================================================================

ExtendedTextCommands:
#_03A793: dw TextCommand_TestChaseINT             ; 0x00
#_03A795: dw TextCommand_TestChaseINTFor0         ; 0x01
#_03A797: dw TextExtCMD_02                        ; 0x02
#_03A799: dw TextExtCMD_03                        ; 0x03
#_03A79B: dw TextCommand_TestAlignmentForMessage  ; 0x04
#_03A79D: dw TextCommand_TestAlignmentRange       ; 0x05
#_03A79F: dw TextCommand_TestChaseLevel           ; 0x06
#_03A7A1: dw TextCommand_WaitXFrames              ; 0x07
#_03A7A3: dw TextExtCMD_08                        ; 0x08
#_03A7A5: dw TextExtCMD_09                        ; 0x09
#_03A7A7: dw TextCommand_CheckMoonPhase           ; 0x0A
#_03A7A9: dw TextCommand_RemovePercentageOfHP     ; 0x0B
#_03A7AB: dw TextExtCMD_0C                        ; 0x0C
#_03A7AD: dw TextExtCMD_0D                        ; 0x0D
#_03A7AF: dw TextCommand_SEP20                    ; 0x0E
#_03A7B1: dw TextExtCMD_0F                        ; 0x0F
#_03A7B3: dw TextExtCMD_10                        ; 0x10
#_03A7B5: dw TextExtCMD_11                        ; 0x11
#_03A7B7: dw TextExtCMD_12                        ; 0x12
#_03A7B9: dw TextCommand_LookForDyingDemon        ; 0x13
#_03A7BB: dw TextExtCMD_14                        ; 0x14
#_03A7BD: dw TextCommand_TestForStatusCategories  ; 0x15
#_03A7BF: dw TextCommand_TestForMissingHPandMP    ; 0x16
#_03A7C1: dw SetLastTerminal                      ; 0x17
#_03A7C3: dw routine038000                        ; 0x18
#_03A7C5: dw WriteTerminalName                    ; 0x19
#_03A7C7: dw TextExtCMD_1A                        ; 0x1A
#_03A7C9: dw TextExtCMD_1B                        ; 0x1B
#_03A7CB: dw TextExtCMD_1C                        ; 0x1C
#_03A7CD: dw TextCommand_57                       ; 0x1D
#_03A7CF: dw TextExtCMD_1E                        ; 0x1E
#_03A7D1: dw TextExtCMD_1F                        ; 0x1F
#_03A7D3: dw TextExtCMD_20                        ; 0x20
#_03A7D5: dw TextExtCMD_21                        ; 0x21
#_03A7D7: dw TextExtCMD_22                        ; 0x22
#_03A7D9: dw TextExtCMD_23                        ; 0x23
#_03A7DB: dw TextExtCMD_24                        ; 0x24
#_03A7DD: dw TextExtCMD_25                        ; 0x25
#_03A7DF: dw TextExtCMD_26                        ; 0x26
#_03A7E1: dw TextExtCMD_27                        ; 0x27
#_03A7E3: dw AddItemToInventory                   ; 0x28
#_03A7E5: dw TakeItemFromSomewhere                ; 0x29
#_03A7E7: dw TextExtCMD_2A                        ; 0x2A
#_03A7E9: dw TextExtCMD_2B                        ; 0x2B
#_03A7EB: dw TextExtCMD_2C                        ; 0x2C
#_03A7ED: dw TextExtCMD_2D                        ; 0x2D
#_03A7EF: dw TextCommand_TestForStatusMessage     ; 0x2E
#_03A7F1: dw TextExtCMD_2F                        ; 0x2F
#_03A7F3: dw TextExtCMD_30                        ; 0x30
#_03A7F5: dw TextExtCMD_31                        ; 0x31
#_03A7F7: dw TextExtCMD_32                        ; 0x32
#_03A7F9: dw TextExtCMD_33                        ; 0x33
#_03A7FB: dw TextExtCMD_34                        ; 0x34
#_03A7FD: dw TextExtCMD_35                        ; 0x35
#_03A7FF: dw TextExtCMD_36                        ; 0x36
#_03A801: dw TextExtCMD_37                        ; 0x37
#_03A803: dw TextExtCMD_38                        ; 0x38
#_03A805: dw TextExtCMD_39                        ; 0x39
#_03A807: dw TextExtCMD_3A                        ; 0x3A
#_03A809: dw TextExtCMD_3B                        ; 0x3B
#_03A80B: dw TextExtCMD_3C                        ; 0x3C
#_03A80D: dw TextExtCMD_3D                        ; 0x3D
#_03A80F: dw TextCommand_55                       ; 0x3E
#_03A811: dw TextExtCMD_3F                        ; 0x3F
#_03A813: dw TextExtCMD_40                        ; 0x40
#_03A815: dw TextExtCMD_41                        ; 0x41
#_03A817: dw TextExtCMD_42                        ; 0x42
#_03A819: dw TextExtCMD_43                        ; 0x43
#_03A81B: dw TextExtCMD_44                        ; 0x44
#_03A81D: dw TextExtCMD_45                        ; 0x45
#_03A81F: dw TextExtCMD_46                        ; 0x46
#_03A821: dw TextExtCMD_47                        ; 0x47
#_03A823: dw TextCommand_TryToTake1000Money       ; 0x48
#_03A825: dw TextExtCMD_49                        ; 0x49
#_03A827: dw TextExtCMD_4A                        ; 0x4A
#_03A829: dw TextExtCMD_4B                        ; 0x4B
#_03A82B: dw TextExtCMD_4C                        ; 0x4C
#_03A82D: dw TextExtCMD_4D                        ; 0x4D
#_03A82F: dw TextExtCMD_4E                        ; 0x4E
#_03A831: dw TextExtCMD_4F                        ; 0x4F
#_03A833: dw TextExtCMD_50                        ; 0x50
#_03A835: dw TextExtCMD_51                        ; 0x51
#_03A837: dw TextExtCMD_52                        ; 0x52
#_03A839: dw TextExtCMD_53                        ; 0x53
#_03A83B: dw TextExtCMD_53                        ; 0x54
#_03A83D: dw TextExtCMD_55                        ; 0x55
#_03A83F: dw TextExtCMD_56                        ; 0x56
#_03A841: dw TextExtCMD_57                        ; 0x57
#_03A843: dw TextExtCMD_58                        ; 0x58
#_03A845: dw TextCommand_TradeGemForItem          ; 0x59
#_03A847: dw TextCommand_Take3Items               ; 0x5A
#_03A849: dw TextExtCMD_5B                        ; 0x5B
#_03A84B: dw TextExtCMD_5C                        ; 0x5C
#_03A84D: dw TextExtCMD_5D                        ; 0x5D
#_03A84F: dw TextExtCMD_5E                        ; 0x5E
#_03A851: dw TextExtCMD_5F                        ; 0x5F
#_03A853: dw TextExtCMD_60                        ; 0x60
#_03A855: dw TextExtCMD_61                        ; 0x61
#_03A857: dw TextExtCMD_62                        ; 0x62
#_03A859: dw TextExtCMD_63                        ; 0x63
#_03A85B: dw TextExtCMD_64                        ; 0x64
#_03A85D: dw TextExtCMD_65                        ; 0x65
#_03A85F: dw TextExtCMD_66                        ; 0x66
#_03A861: dw TextExtCMD_67                        ; 0x67
#_03A863: dw TextExtCMD_68                        ; 0x68
#_03A865: dw TextExtCMD_69                        ; 0x69
#_03A867: dw TextExtCMD_6A                        ; 0x6A
#_03A869: dw TextExtCMD_6B                        ; 0x6B
#_03A86B: dw TextExtCMD_6C                        ; 0x6C
#_03A86D: dw TextExtCMD_6D                        ; 0x6D
#_03A86F: dw TextExtCMD_6E                        ; 0x6E
#_03A871: dw TextExtCMD_6F                        ; 0x6F
#_03A873: dw TextExtCMD_70                        ; 0x70
#_03A875: dw TextExtCMD_71                        ; 0x71
#_03A877: dw TextExtCMD_72                        ; 0x72
#_03A879: dw TextExtCMD_73                        ; 0x73
#_03A87B: dw WriteCurrentTerminalName             ; 0x74
#_03A87D: dw TextExtCMD_75                        ; 0x75

;---------------------------------------------------------------------------------------------------
; TODO
ExtendedTextCommandsOfSomeOtherType
#_03A87F: dw routine03D2DA
#_03A881: dw routine03D2F7
#_03A883: dw routine03D32B

;---------------------------------------------------------------------------------------------------

TextExtCMD_3F:
#_03A885: RTS

;===================================================================================================

TextCommand_TestChaseINT:
#_03A886: SEP #$20

#_03A888: JSR GetNextTextByte
#_03A88B: CMP.w $1012
#_03A88E: BCS RelocateBecauseOfMyIntelligence

#_03A890: JSR GetNextTextByte

#_03A893: RTS

;===================================================================================================

RelocateBecauseOfMyIntelligence:
#_03A894: JSR GetNextTextByte
#_03A897: JSR ChangeMessageID

#_03A89A: RTS

;===================================================================================================

TextCommand_TestChaseINTFor0:
#_03A89B: SEP #$20

#_03A89D: JSR Load8Bit00
#_03A8A0: CMP.w $1012
#_03A8A3: BCS RelocateBecauseOfMyIntelligence

#_03A8A5: JSR GetNextTextByte

#_03A8A8: RTS

;===================================================================================================

Load8Bit00:
#_03A8A9: SEP #$20

#_03A8AB: LDA.b #$00

#_03A8AD: RTS

;===================================================================================================
; TODO alignment related by have to analyze the bounds
TextExtCMD_02:
#_03A8AE: SEP #$20
#_03A8B0: JSR GetNextTextByte
#_03A8B3: STZ.w $0E01
#_03A8B6: STA.w $0E00
#_03A8B9: AND.b #$FF
#_03A8BB: BPL .positive

#_03A8BD: DEC.w $0E01

.positive
#_03A8C0: LDA.b #$FB
#_03A8C2: JSL TestGameProgressBit
#_03A8C6: BCC .branch03A8C9

#_03A8C8: RTS

.branch03A8C9
#_03A8C9: REP #$20
#_03A8CB: LDA.w $101C
#_03A8CE: CLC
#_03A8CF: ADC.w $0E00
#_03A8D2: STA.w $101C
#_03A8D5: STA.w $107C
#_03A8D8: AND.w #$FF00
#_03A8DB: BNE .branch03A8DE

#_03A8DD: RTS

.branch03A8DE
#_03A8DE: BPL .dont_clear

#_03A8E0: STZ.w $101C
#_03A8E3: STZ.w $107C

#_03A8E6: RTS

.dont_clear
#_03A8E7: LDA.w #$00FF
#_03A8EA: STA.w $101C
#_03A8ED: STA.w $107C

#_03A8F0: RTS

;===================================================================================================

TextExtCMD_03:
#_03A8F1: SEP #$20
#_03A8F3: JSR GetNextTextByte
#_03A8F6: AND.b #$FF
#_03A8F8: BEQ .branch03A921

#_03A8FA: STA.w $0E00
#_03A8FD: LDA.b #$FB
#_03A8FF: JSL TestGameProgressBit
#_03A903: BCC .branch03A906

#_03A905: RTS

.branch03A906
#_03A906: LDA.w $101C
#_03A909: BPL .branch03A916

#_03A90B: SEC
#_03A90C: SBC.w $0E00
#_03A90F: STA.w $101C
#_03A912: STA.w $107C
#_03A915: RTS

.branch03A916
#_03A916: CLC
#_03A917: ADC.w $0E00
#_03A91A: STA.w $101C
#_03A91D: STA.w $107C
#_03A920: RTS

.branch03A921
#_03A921: LDA.b #$80
#_03A923: STA.w $101C
#_03A926: STA.w $107C
#_03A929: RTS

;===================================================================================================

TextCommand_TestAlignmentForMessage:
#_03A92A: SEP #$20

#_03A92C: JSR GetNextTextByte
#_03A92F: STA.w $0E00

#_03A932: JSR GetNextTextByte
#_03A935: STA.w $0E01

#_03A938: LDA.w $101C
#_03A93B: CMP.b #$70
#_03A93D: BCC .branch03A94B

#_03A93F: CMP.b #$90
#_03A941: BCS .branch03A944

#_03A943: RTS

.branch03A944
#_03A944: LDA.w $0E01
#_03A947: JSR ChangeMessageID

#_03A94A: RTS

.branch03A94B
#_03A94B: LDA.w $0E00
#_03A94E: JSR ChangeMessageID

#_03A951: RTS

;===================================================================================================
; TODO need to reparse text banks for this
TextCommand_TestAlignmentRange:
#_03A952: SEP #$20

#_03A954: JSR GetNextTextByte
#_03A957: STA.w $0E00

#_03A95A: JSR GetNextTextByte
#_03A95D: STA.w $0E01

#_03A960: CMP.w $101C
#_03A963: BCC .branch03A973

#_03A965: LDA.w $0E00
#_03A968: CMP.w $101C
#_03A96B: BEQ .branch03A96F

#_03A96D: BCS .branch03A973

.branch03A96F
#_03A96F: JSR GetNextTextByte
#_03A972: RTS

.branch03A973
#_03A973: JSR GetNextTextByte
#_03A976: JSR ChangeMessageID

#_03A979: RTS

;===================================================================================================
; Test MC level
;===================================================================================================
TextCommand_TestChaseLevel:
#_03A97A: SEP #$20

#_03A97C: JSR GetNextTextByte
#_03A97F: DEC A

#_03A980: CMP.w $100A
#_03A983: BCS .weak

#_03A985: JSR GetNextTextByte

#_03A988: RTS

.weak
#_03A989: JSR GetNextTextByte
#_03A98C: JSR ChangeMessageID

#_03A98F: RTS

;===================================================================================================

TextCommand_WaitXFrames:
#_03A990: JSR routine0384F9

#_03A993: SEP #$30

#_03A995: JSR GetNextTextByte
#_03A998: TAY

#_03A999: DEY
#_03A99A: JSL RunFramesYTimes

#_03A99E: RTS

;===================================================================================================

TextExtCMD_08:
#_03A99F: SEP #$30
#_03A9A1: JSR GetNextTextByte
#_03A9A4: CMP.b #$04
#_03A9A6: BCC .branch03A9D9

#_03A9A8: REP #$30
#_03A9AA: AND.w #$0001
#_03A9AD: ASL A
#_03A9AE: TAX
#_03A9AF: LDA.w $050A,X
#_03A9B2: STA.w $0E00
#_03A9B5: LDX.w #$0180

.branch03A9B8
#_03A9B8: LDA.w $1000,X
#_03A9BB: BPL .branch03A9C5

#_03A9BD: LDA.w $1004,X
#_03A9C0: CMP.w $0E00
#_03A9C3: BEQ .branch03A9D9

.branch03A9C5
#_03A9C5: TXA
#_03A9C6: CLC
#_03A9C7: ADC.w #$0060
#_03A9CA: TAX
#_03A9CB: CMP.w #$0600
#_03A9CE: BNE .branch03A9B8

#_03A9D0: SEP #$20
#_03A9D2: JSR GetNextTextByte
#_03A9D5: JSR ChangeMessageID
#_03A9D8: RTS

.branch03A9D9
#_03A9D9: JSR GetNextTextByte
#_03A9DC: RTS

;===================================================================================================

routine03A9DD:
#_03A9DD: PHA
#_03A9DE: PHX
#_03A9DF: PHY
#_03A9E0: PHP
#_03A9E1: REP #$30
#_03A9E3: STZ.w $0C52
#_03A9E6: LDA.w #$00ED

.branch03A9E9
#_03A9E9: PHA
#_03A9EA: JSL TestGameProgressBit
#_03A9EE: BCC .branch03A9F3

#_03A9F0: INC.w $0C52

.branch03A9F3
#_03A9F3: PLA
#_03A9F4: INC A
#_03A9F5: CMP.w #$00F0
#_03A9F8: BNE .branch03A9E9

#_03A9FA: LDA.w $0C52
#_03A9FD: ASL A
#_03A9FE: CLC
#_03A9FF: ADC.w #$0006
#_03AA02: STA.w $0C52
#_03AA05: PLP
#_03AA06: PLY
#_03AA07: PLX
#_03AA08: PLA
#_03AA09: RTS

;===================================================================================================
; TODO counting humans?
TextExtCMD_09:
#_03AA0A: JSR routine03A9DD

#_03AA0D: REP #$30

#_03AA0F: LDX.w #$0180

#_03AA12: STZ.w $0E00

.next_teammate
#_03AA15: LDA.w $1000,X
#_03AA18: BPL .skip

#_03AA1A: INC.w $0E00

.skip
#_03AA1D: TXA
#_03AA1E: CLC
#_03AA1F: ADC.w #$0060
#_03AA22: TAX

#_03AA23: CPX.w #$0600
#_03AA26: BNE .next_teammate

;---------------------------------------------------------------------------------------------------

#_03AA28: SEP #$20

#_03AA2A: LDA.w $0E00
#_03AA2D: CMP.w $0C52
#_03AA30: BCC .not_enough_qualify

#_03AA32: JSR GetNextTextByte
#_03AA35: JSR ChangeMessageID

#_03AA38: RTS

.not_enough_qualify
#_03AA39: JSR GetNextTextByte

#_03AA3C: RTS

;===================================================================================================
; This command actually appears to be unused.
;===================================================================================================
TextCommand_CheckMoonPhase:
#_03AA3D: SEP #$20

#_03AA3F: LDA.w $040F
#_03AA42: LSR A
#_03AA43: LSR A
#_03AA44: LSR A
#_03AA45: LSR A
#_03AA46: STA.w $0E00

#_03AA49: JSR GetNextTextByte
#_03AA4C: CMP.w $0E00
#_03AA4F: BEQ .correct_moon

#_03AA51: JSR GetNextTextByte
#_03AA54: JSR ChangeMessageID

#_03AA57: RTS

.correct_moon
#_03AA58: JSR GetNextTextByte

#_03AA5B: RTS

;===================================================================================================

TextCommand_RemovePercentageOfHP:
#_03AA5C: SEP #$30

#_03AA5E: JSR GetNextTextByte
#_03AA61: CMP.b #$FF
#_03AA63: BEQ .hurt_everyone

#_03AA65: REP #$30
#_03AA67: AND.w #$00FF
#_03AA6A: ASL A
#_03AA6B: TAY

#_03AA6C: LDX.w PartyIDtoOffset,Y

#_03AA6F: JSR GetNextTextByte
#_03AA72: AND.w #$00FF
#_03AA75: JSR .remove_fraction_of_hp
#_03AA78: JSR routine00A17E_bounce

#_03AA7B: RTS

;---------------------------------------------------------------------------------------------------

.remove_fraction_of_hp
#_03AA7C: REP #$30

#_03AA7E: PHX

#_03AA7F: STA.w $0E10

#_03AA82: LDA.w $102E,X
#_03AA85: STA.w $0E12

#_03AA88: JSR BigMultiplication

#_03AA8B: LDX.w $0E16
#_03AA8E: LDA.w $0E14
#_03AA91: LDY.w #$0064
#_03AA94: JSL DivisionBig_XA_by_Y

#_03AA98: PLX

#_03AA99: LDA.w $102E,X
#_03AA9C: SEC
#_03AA9D: SBC.w $0E80
#_03AAA0: STA.w $102E,X

#_03AAA3: RTS

;---------------------------------------------------------------------------------------------------

.hurt_everyone
#_03AAA4: JSR GetNextTextByte

#_03AAA7: REP #$30

#_03AAA9: AND.w #$00FF
#_03AAAC: STA.w $0E00

#_03AAAF: LDX.w #$0000

.next_teammate
#_03AAB2: LDA.w $1000,X
#_03AAB5: AND.w #$4000
#_03AAB8: BEQ .skip

#_03AABA: LDA.w $0E00
#_03AABD: JSR .remove_fraction_of_hp

.skip
#_03AAC0: TXA
#_03AAC1: CLC
#_03AAC2: ADC.w #$0060
#_03AAC5: TAX

#_03AAC6: CPX.w #$0600
#_03AAC9: BNE .next_teammate

#_03AACB: JSR routine00A17E_bounce

#_03AACE: RTS

;===================================================================================================

; TODO stat creation?
TextExtCMD_0C:
#_03AACF: REP #$30

#_03AAD1: JSR GetNextTextByte
#_03AAD4: AND.w #$0003
#_03AAD7: STA.w $0E00

#_03AADA: PHA

#_03AADB: PHP

#_03AADC: ASL A
#_03AADD: TAY

#_03AADE: LDA.w .stat_offsets,Y
#_03AAE1: STA.w $0715

#_03AAE4: LDA.w #$0012
#_03AAE7: STA.w $0578

#_03AAEA: JSR routine03AB0B

#_03AAED: JSL routine0183E5

#_03AAF1: PLP

#_03AAF2: PLA
#_03AAF3: STA.w $0E00

#_03AAF6: CMP.w #$0001
#_03AAF9: BNE .not_momo

#_03AAFB: JSL routine00B465

.not_momo
#_03AAFF: JSR routine03AB3E

#_03AB02: RTS

.stat_offsets
#_03AB03: dw $0000
#_03AB05: dw $0060
#_03AB07: dw $00C0
#_03AB09: dw $0120

;===================================================================================================

routine03AB0B:
#_03AB0B: LDA.w $0E00
#_03AB0E: ASL A
#_03AB0F: TAY

#_03AB10: LDA.w .vectors,Y
#_03AB13: STA.w $00E0

#_03AB16: JMP ($00E0)

.vectors
#_03AB19: dw routine03AB21
#_03AB1B: dw routine03AB33
#_03AB1D: dw routine03AB33
#_03AB1F: dw routine03AB33

;===================================================================================================

routine03AB21:
#_03AB21: LDA.w #$0000
#_03AB24: JSL ClearSomeBank7FBuffers

#_03AB28: LDA.w #$0000
#_03AB2B: JSL VRAM_From_7FXXXX
#_03AB2F: JSL AddSelfAsVectorAndMakeSpace

routine03AB33:
#_03AB33: SEP #$20

#_03AB35: LDA.b #$FF
#_03AB37: STA.w $0A71
#_03AB3A: JSR routine03ABE6

#_03AB3D: RTS

;===================================================================================================

routine03AB3E:
#_03AB3E: LDA.w $0E00
#_03AB41: ASL A
#_03AB42: TAY

#_03AB43: LDA.w .vectors,Y
#_03AB46: STA.w $00E0

#_03AB49: JMP ($00E0)

.vectors
#_03AB4C: dw routine03AB54
#_03AB4E: dw routine03AB72
#_03AB50: dw routine03BA74
#_03AB52: dw routine03BA74

;===================================================================================================

routine03AB54:
#_03AB54: LDA.w $0E00
#_03AB57: PHA
#_03AB58: LDA.w #$0017
#_03AB5B: JSL routine02F609
#_03AB5F: LDA.w #$000D
#_03AB62: JSL routine02FC6E
#_03AB66: LDA.w #$0007
#_03AB69: JSR routine03B4E0
#_03AB6C: PLA
#_03AB6D: STA.w $0E00
#_03AB70: BRA routine03BA74

routine03AB72:
#_03AB72: SEP #$20

routine03BA74:
#_03AB74: LDA.w $0E00
#_03AB77: ASL A
#_03AB78: CLC
#_03AB79: ADC.w $0E00
#_03AB7C: TAY
#_03AB7D: LDX.w #$0000

.branch03AB80
#_03AB80: PHX
#_03AB81: PHY
#_03AB82: PHP
#_03AB83: SEP #$30
#_03AB85: STX.w $0A6A
#_03AB88: LDA.w data03ABB6,Y
#_03AB8B: STA.w $0A69
#_03AB8E: LDA.w data03ABDA,Y
#_03AB91: STA.w $0A7D,X
#_03AB94: TYA
#_03AB95: ASL A
#_03AB96: TAY
#_03AB97: LDA.w data03ABC2,Y
#_03AB9A: STA.w $0A6B

#_03AB9D: LDA.w data03ABC3,Y
#_03ABA0: STA.w $0A6D

#_03ABA3: JSL routine02E6C9

#_03ABA7: PLP
#_03ABA8: PLY
#_03ABA9: PLX

#_03ABAA: INX
#_03ABAB: INY
#_03ABAC: CPX.w #$0003
#_03ABAF: BNE .branch03AB80

#_03ABB1: JSL routine00A056
#_03ABB5: RTS

data03ABB6:
#_03ABB6: db $55,$00,$00,$1E,$00,$00,$16,$15
#_03ABBE: db $17,$19,$18,$00

data03ABC2:
#_03ABC2: db $70

data03ABC3:
#_03ABC3: db $18,$00,$00,$00,$00,$78,$28,$00
#_03ABCB: db $00,$00,$00,$68,$18,$68,$08,$A0
#_03ABD3: db $38,$70,$38,$60,$58,$00,$00

data03ABDA:
#_03ABDA: db $FE,$00,$00,$FE,$00,$00,$FE,$00
#_03ABE2: db $00,$00,$FE,$00

;===================================================================================================

routine03ABE6:
#_03ABE6: PHP
#_03ABE7: SEP #$30
#_03ABE9: LDX.b #$07
#_03ABEB: LDY.b #$3C

.branch03ABED
#_03ABED: LDA.b #$00
#_03ABEF: STA.w $0A7D,X
#_03ABF2: STA.w $0000,Y
#_03ABF5: STA.w $0001,Y
#_03ABF8: STA.w $1A60,Y
#_03ABFB: STA.w $1A61,Y
#_03ABFE: STA.w $1AA1,Y
#_03AC01: LDA.b #$F0
#_03AC03: STA.w $1AA0,Y
#_03AC06: PHY
#_03AC07: TYA
#_03AC08: LSR A
#_03AC09: TAY
#_03AC0A: LDA.b #$80
#_03AC0C: STA.w $1A00,Y
#_03AC0F: PLY
#_03AC10: DEY
#_03AC11: DEY
#_03AC12: DEY
#_03AC13: DEY
#_03AC14: DEX
#_03AC15: BPL .branch03ABED

#_03AC17: PLP
#_03AC18: RTS

;===================================================================================================
; TODO
TextExtCMD_0D:
#_03AC19: SEP #$30

#_03AC1B: JSR GetNextTextByte
#_03AC1E: CMP.b #$FF
#_03AC20: BEQ .hurt_everyone

#_03AC22: REP #$30

#_03AC24: AND.w #$00FF
#_03AC27: ASL A
#_03AC28: TAY

#_03AC29: LDX.w PartyIDtoOffset,Y

#_03AC2C: JSR GetNextTextByte
#_03AC2F: AND.w #$00FF
#_03AC32: ASL A
#_03AC33: TAY

#_03AC34: LDA.w StatusConditionBits,Y
#_03AC37: STA.w $0E00

#_03AC3A: LDA.w $1002,X
#_03AC3D: ORA.w $0E00
#_03AC40: STA.w $1002,X

#_03AC43: JSR routine00A17E_bounce

#_03AC46: RTS

;---------------------------------------------------------------------------------------------------

.hurt_everyone
#_03AC47: REP #$30

#_03AC49: JSR GetNextTextByte
#_03AC4C: AND.w #$00FF
#_03AC4F: ASL A
#_03AC50: TAY

#_03AC51: LDA.w StatusConditionBits,Y
#_03AC54: STA.w $0E00

#_03AC57: LDX.w #$0000

.next_teammate
#_03AC5A: LDA.w $1000,X
#_03AC5D: AND.w #$4000
#_03AC60: BEQ .not_dying

#_03AC62: LDA.w $1002,X
#_03AC65: ORA.w $0E00
#_03AC68: STA.w $1002,X

.not_dying
#_03AC6B: TXA
#_03AC6C: CLC
#_03AC6D: ADC.w #$0060
#_03AC70: TAX

#_03AC71: CPX.w #$0600
#_03AC74: BNE .next_teammate

#_03AC76: JSR routine00A17E_bounce

#_03AC79: RTS

;===================================================================================================

StatusConditionBits:
#_03AC7A: dw $8000 ; 0 - Dead
#_03AC7C: dw $4000 ; 1 - Dying
#_03AC7E: dw $2000 ; 2 - Stone
#_03AC80: dw $1000 ; 3 - Paralysis
#_03AC82: dw $0800 ; 4 - Poison
#_03AC84: dw $0400 ; 5 - Fly
#_03AC86: dw $0200 ; 6 - Frog
#_03AC88: dw $0100 ; 7 - Curse
#_03AC8A: dw $0080 ; 8 - Charm
#_03AC8C: dw $0040 ; 9 - Sleep
#_03AC8E: dw $0020 ; A - Bind
#_03AC90: dw $0010 ; B - Freeze
#_03AC92: dw $0008 ; C - Shock
#_03AC94: dw $0004 ; D - Close
#_03AC96: dw $0002 ; E - Panic
#_03AC98: dw $0001 ; F - Happy

;===================================================================================================

TextCommand_SEP20:
#_03AC9A: SEP #$20

#_03AC9C: RTS

;===================================================================================================

TextExtCMD_0F:
#_03AC9D: SEP #$20

#_03AC9F: LDA.b #$00
#_03ACA1: STA.w $0BA3

#_03ACA4: JMP routine03D893

;===================================================================================================

TextExtCMD_10:
#_03ACA7: SEP #$20

#_03ACA9: LDA.b #$01
#_03ACAB: STA.w $0BA3

#_03ACAE: JMP routine03D893

;===================================================================================================

TextExtCMD_11:
#_03ACB1: SEP #$20

#_03ACB3: LDA.b #$03
#_03ACB5: STA.w $0BA3

#_03ACB8: JMP routine03D893

;===================================================================================================

TextExtCMD_12:
#_03ACBB: SEP #$20

#_03ACBD: LDA.b #$02
#_03ACBF: STA.w $0BA3

#_03ACC2: JMP routine03D893

;===================================================================================================

TextCommand_LookForDyingDemon:
#_03ACC5: REP #$30

#_03ACC7: LDX.w #$0180

.next_teammate
#_03ACCA: LDA.w $1000,X
#_03ACCD: AND.w #$4000
#_03ACD0: BNE .dead

#_03ACD2: TXA
#_03ACD3: CLC
#_03ACD4: ADC.w #$0060
#_03ACD7: TAX

#_03ACD8: CMP.w #$0600
#_03ACDB: BNE .next_teammate

#_03ACDD: JSR GetNextTextByte

#_03ACE0: RTS

.dead
#_03ACE1: JSR GetNextTextByte
#_03ACE4: JSR ChangeMessageID

#_03ACE7: RTS

;===================================================================================================

TextExtCMD_14:
#_03ACE8: SEP #$20

#_03ACEA: JSR GetNextTextByte
#_03ACED: STA.w $0A2C

#_03ACF0: RTS

;===================================================================================================

TextCommand_TestForStatusCategories:
#_03ACF1: REP #$30

#_03ACF3: JSR GetNextTextByte
#_03ACF6: STA.w $0E02

#_03ACF9: AND.w #$000F
#_03ACFC: ASL A
#_03ACFD: TAX

#_03ACFE: LDA.w .status_masks,X
#_03AD01: STA.w $0E00

#_03AD04: LDX.w #$0000

.next_teammate
#_03AD07: LDA.w $1000,X
#_03AD0A: BPL .skip_teammate

#_03AD0C: LDA.w $0E02
#_03AD0F: AND.w #$00F0
#_03AD12: BNE .dont_skip_something

; TODO wtf is this bit? :(
#_03AD14: LDA.w $1000,X
#_03AD17: AND.w #$4000
#_03AD1A: BEQ .skip_teammate

.dont_skip_something
#_03AD1C: LDA.w $1002,X
#_03AD1F: AND.w $0E00
#_03AD22: BNE .someone_afflicted

.skip_teammate
#_03AD24: TXA
#_03AD25: CLC
#_03AD26: ADC.w #$0060
#_03AD29: TAX

#_03AD2A: CMP.w #$0600
#_03AD2D: BNE .next_teammate

#_03AD2F: JSR GetNextTextByte

#_03AD32: RTS

.someone_afflicted
#_03AD33: SEP #$20

#_03AD35: JSR GetNextTextByte
#_03AD38: JSR ChangeMessageID

#_03AD3B: RTS

.status_masks
#_03AD3C: dw $38FF ; everything else
#_03AD3E: dw $0700 ; cursed
#_03AD40: dw $C000 ; dead or dying

;===================================================================================================

TextCommand_TestForMissingHPandMP:
#_03AD42: REP #$30

#_03AD44: LDX.w #$0000

.next_teammate
#_03AD47: LDA.w $1000,X
#_03AD4A: AND.w #$C000
#_03AD4D: BEQ .skip_teammate

#_03AD4F: LDA.w $1002,X
#_03AD52: AND.w #$C000
#_03AD55: BNE .skip_teammate

#_03AD57: LDA.w $102E,X
#_03AD5A: CMP.w $1030,X
#_03AD5D: BCC .someone_drained

#_03AD5F: LDA.w $1032,X
#_03AD62: CMP.w $1034,X
#_03AD65: BCC .someone_drained

.skip_teammate
#_03AD67: TXA
#_03AD68: CLC
#_03AD69: ADC.w #$0060
#_03AD6C: TAX

#_03AD6D: CMP.w #$0600
#_03AD70: BNE .next_teammate

#_03AD72: SEP #$20

#_03AD74: JSR GetNextTextByte
#_03AD77: JSR ChangeMessageID

#_03AD7A: RTS

.someone_drained
#_03AD7B: SEP #$20

#_03AD7D: JSR GetNextTextByte

#_03AD80: RTS

;===================================================================================================

SetLastTerminal:
#_03AD81: SEP #$20

#_03AD83: JSR GetNextTextByte

#_03AD86: STA.w $0BE2
#_03AD89: STA.w $07E1

#_03AD8C: RTS

;===================================================================================================
; TODO changes position
TextExtCMD_1A:
#_03AD8D: SEP #$30
#_03AD8F: JSR GetNextTextByte
#_03AD92: AND.b #$FF
#_03AD94: BMI .branch03ADC4

#_03AD96: STA.w $070C

#_03AD99: JSR GetNextTextByte
#_03AD9C: PHA

#_03AD9D: AND.b #$3F
#_03AD9F: STA.w $070D

#_03ADA2: PLA
#_03ADA3: ASL A
#_03ADA4: ROL A
#_03ADA5: ROL A
#_03ADA6: AND.b #$03
#_03ADA8: STA.w $040D

#_03ADAB: JSR GetNextTextByte

#_03ADAE: STA.w $0710
#_03ADB1: JSR GetNextTextByte
#_03ADB4: JSR GetNextTextByte
#_03ADB7: JSR GetNextTextByte
#_03ADBA: LDA.b #$01
#_03ADBC: STA.w $0C4F
#_03ADBF: JSL UpdateVisitedSquares
#_03ADC3: RTS

.branch03ADC4
#_03ADC4: AND.b #$7F
#_03ADC6: STA.w $07F5
#_03ADC9: JSR GetNextTextByte
#_03ADCC: STA.w $07F6
#_03ADCF: JSR GetNextTextByte
#_03ADD2: STA.w $0B2E
#_03ADD5: JSR GetNextTextByte
#_03ADD8: JSR GetNextTextByte
#_03ADDB: JSR GetNextTextByte
#_03ADDE: LDA.b #$81
#_03ADE0: STA.w $0C4F
#_03ADE3: JSL HideTheMenu

#_03ADE7: REP #$20
#_03ADE9: LDA.w $07F5
#_03ADEC: CMP.w #$3516
#_03ADEF: BEQ .branch03ADF2

#_03ADF1: RTS

.branch03ADF2
#_03ADF2: SEP #$20
#_03ADF4: LDA.b #$3F
#_03ADF6: STA.w $046C
#_03ADF9: LDA.b #$05
#_03ADFB: STA.w $046D
#_03ADFE: LDA.b #$08
#_03AE00: STA.w $046B
#_03AE03: LDA.b #$00
#_03AE05: STA.w $046A
#_03AE08: RTS

;===================================================================================================

TextExtCMD_1B:
#_03AE09: SEP #$30
#_03AE0B: JMP TextExtCMD_1A

;===================================================================================================

TextExtCMD_1C:
#_03AE0E: SEP #$30

#_03AE10: JSR GetNextTextByte
#_03AE13: ASL A
#_03AE14: TAY

#_03AE15: REP #$20

#_03AE17: LDA.w .vectors,Y
#_03AE1A: STA.w $00E0
#_03AE1D: JMP ($00E0)

.vectors
#_03AE20: dw .brightenScreen
#_03AE22: dw .darkenScreen
#_03AE24: dw .routine03AE32
#_03AE26: dw .routine03AE3F

;---------------------------------------------------------------------------------------------------

.brightenScreen
#_03AE28: JSL BrightenScreen
#_03AE2C: RTS

;---------------------------------------------------------------------------------------------------

.darkenScreen
#_03AE2D: JSL DarkenScreen
#_03AE31: RTS

;---------------------------------------------------------------------------------------------------

.routine03AE32
#_03AE32: SEP #$30

#_03AE34: LDA.b #$01
#_03AE36: LDX.b #$00
#_03AE38: LDY.b #$04
#_03AE3A: JSL routine009443

#_03AE3E: RTS

;---------------------------------------------------------------------------------------------------

.routine03AE3F
#_03AE3F: SEP #$30

#_03AE41: LDA.b #$04
#_03AE43: LDX.b #$00
#_03AE45: LDY.b #$01
#_03AE47: JSL routine009443

#_03AE4B: RTS

;===================================================================================================

TextCommand_57:
#_03AE4C: SEP #$20

#_03AE4E: JSR GetNextTextByte
#_03AE51: STA.w $0A12

#_03AE54: JSR GetNextTextByte
#_03AE57: STA.w $0A13

#_03AE5A: JSL LoadClassyMessage

#_03AE5E: JSR SetTextPointerFromMessageID

#_03AE61: RTS

;===================================================================================================

TextExtCMD_1F:
#_03AE62: REP #$30

#_03AE64: LDA.w $0C0B
#_03AE67: STA.w $050A

#_03AE6A: STZ.w $0524

#_03AE6D: LDA.w #$0001
#_03AE70: STA.w $050E
#_03AE73: JSL LoadDemonStats

#_03AE77: LDA.w $050A
#_03AE7A: CMP.w #$008B
#_03AE7D: BEQ .cerberus

.test_level
#_03AE7F: LDA.w $100A
#_03AE82: CMP.w $160A
#_03AE85: BCS .dont_relocate

#_03AE87: JSR GetNextTextByte
#_03AE8A: JSR ChangeMessageID

#_03AE8D: RTS

.dont_relocate
#_03AE8E: JSR GetNextTextByte

#_03AE91: RTS

;---------------------------------------------------------------------------------------------------

.cerberus
#_03AE92: LDA.w $0BED
#_03AE95: CMP.w #$0134
#_03AE98: BEQ .dont_relocate

#_03AE9A: LDA.w $0BEF
#_03AE9D: CMP.w #$0134
#_03AEA0: BEQ .dont_relocate

#_03AEA2: LDA.w $0A3B
#_03AEA5: AND.w #$0001
#_03AEA8: BEQ .test_level

#_03AEAA: LDA.w $0BF1
#_03AEAD: CMP.w #$0134
#_03AEB0: BEQ .dont_relocate

#_03AEB2: BRA .test_level

;===================================================================================================

TextExtCMD_20:
#_03AEB4: REP #$30

#_03AEB6: LDA.w $0C0B
#_03AEB9: STA.w $050A

#_03AEBC: STZ.w $0524

#_03AEBF: LDA.w #$0001
#_03AEC2: STA.w $050E

#_03AEC5: JSL LoadDemonStats

#_03AEC9: LDX.w #$0600
#_03AECC: JSL routine0F8582
#_03AED0: BCC .dont_relocate

#_03AED2: JSR GetNextTextByte
#_03AED5: JSR ChangeMessageID

#_03AED8: RTS

.dont_relocate
#_03AED9: JSR GetNextTextByte

#_03AEDC: RTS

;===================================================================================================

TextExtCMD_21:
#_03AEDD: SEP #$30

#_03AEDF: LDA.w $0A58
#_03AEE2: BNE .fail

#_03AEE4: JSR GetNextTextByte
#_03AEE7: JSR ChangeMessageID

#_03AEEA: RTS

.fail
#_03AEEB: REP #$20

#_03AEED: INC.w $00C0

#_03AEF0: RTS

;===================================================================================================

TextExtCMD_22:
#_03AEF1: SEP #$30

#_03AEF3: LDA.w $0A58
#_03AEF6: BEQ .success

#_03AEF8: JSR GetNextTextByte
#_03AEFB: JSR ChangeMessageID

#_03AEFE: RTS

.success
#_03AEFF: REP #$20

#_03AF01: INC.w $00C0

#_03AF04: RTS

;===================================================================================================

TextExtCMD_23:
#_03AF05: REP #$30

#_03AF07: JSR GetNextTextByte
#_03AF0A: AND.w #$00FF
#_03AF0D: STA.w $0E00

#_03AF10: CMP.w #$00FF
#_03AF13: BEQ .examine_party

#_03AF15: CMP.w #$00FE
#_03AF18: BEQ .examine_party

#_03AF1A: ASL A
#_03AF1B: TAY

#_03AF1C: LDX.w PartyIDtoOffset,Y

#_03AF1F: LDA.w $1002,X
#_03AF22: AND.w #$C000
#_03AF25: BEQ .specific_person_not_dying

#_03AF27: JMP routine00A17E_bounce

.specific_person_not_dying
#_03AF2A: LDA.w $1030,X
#_03AF2D: CMP.w $102E,X
#_03AF30: BCS .no_hp_overflow

#_03AF32: JMP routine00A17E_bounce

.no_hp_overflow
#_03AF35: STA.w $102E,X

#_03AF38: JMP routine00A17E_bounce

;---------------------------------------------------------------------------------------------------

.examine_party
#_03AF3B: LDX.w #$0000

.next_teammate
#_03AF3E: LDA.w $1000,X
#_03AF41: BPL .skip_teammate

#_03AF43: LDA.w $1002,X
#_03AF46: AND.w #$C000
#_03AF49: BNE .skip_teammate

#_03AF4B: LDA.w $0E00
#_03AF4E: CMP.w #$00FE
#_03AF51: BEQ .check_hp

#_03AF53: LDA.w $1000,X
#_03AF56: AND.w #$4000
#_03AF59: BEQ .skip_teammate

.check_hp
#_03AF5B: LDA.w $1030,X
#_03AF5E: CMP.w $102E,X
#_03AF61: BCC .skip_teammate

#_03AF63: STA.w $102E,X

.skip_teammate
#_03AF66: TXA
#_03AF67: CLC
#_03AF68: ADC.w #$0060
#_03AF6B: TAX

#_03AF6C: CMP.w #$0600
#_03AF6F: BNE .next_teammate

#_03AF71: JMP routine00A17E_bounce

;===================================================================================================

TextExtCMD_24:
#_03AF74: REP #$30

#_03AF76: JSR GetNextTextByte
#_03AF79: AND.w #$00FF
#_03AF7C: STA.w $0E00

#_03AF7F: CMP.w #$00FF
#_03AF82: BEQ .examine_party

#_03AF84: CMP.w #$00FE
#_03AF87: BEQ .examine_party

#_03AF89: ASL A
#_03AF8A: TAY

#_03AF8B: LDX.w PartyIDtoOffset,Y

#_03AF8E: LDA.w $1002,X
#_03AF91: AND.w #$C000
#_03AF94: BEQ .branch03AF99

#_03AF96: JMP routine00A17E_bounce

.branch03AF99
#_03AF99: LDA.w $1034,X
#_03AF9C: CMP.w $1032,X
#_03AF9F: BCS .no_overflow

#_03AFA1: JMP routine00A17E_bounce

.no_overflow
#_03AFA4: STA.w $1032,X

#_03AFA7: JMP routine00A17E_bounce

;---------------------------------------------------------------------------------------------------

.examine_party
#_03AFAA: LDX.w #$0000

.next_teammate
#_03AFAD: LDA.w $1000,X
#_03AFB0: BPL .skip_teammate

#_03AFB2: LDA.w $1002,X
#_03AFB5: AND.w #$C000
#_03AFB8: BNE .skip_teammate

#_03AFBA: LDA.w $0E00
#_03AFBD: CMP.w #$00FE
#_03AFC0: BEQ .check_mp

#_03AFC2: LDA.w $1000,X
#_03AFC5: AND.w #$4000
#_03AFC8: BEQ .skip_teammate

.check_mp
#_03AFCA: LDA.w $1034,X
#_03AFCD: CMP.w $1032,X
#_03AFD0: BCC .skip_teammate

#_03AFD2: STA.w $1032,X

.skip_teammate
#_03AFD5: TXA
#_03AFD6: CLC
#_03AFD7: ADC.w #$0060
#_03AFDA: TAX

#_03AFDB: CMP.w #$0600
#_03AFDE: BNE .next_teammate

#_03AFE0: JMP routine00A17E_bounce

;===================================================================================================

TextExtCMD_25:
#_03AFE3: REP #$30

#_03AFE5: JSR GetNextTextByte
#_03AFE8: AND.w #$00FF
#_03AFEB: STA.w $0E00

#_03AFEE: CMP.w #$00FF
#_03AFF1: BEQ .examine_party

#_03AFF3: CMP.w #$00FE
#_03AFF6: BEQ .examine_party

#_03AFF8: ASL A
#_03AFF9: TAY

#_03AFFA: LDX.w PartyIDtoOffset,Y

#_03AFFD: LDA.w #$0000
#_03B000: STA.w $1002,X

#_03B003: JMP routine00A17E_bounce

;---------------------------------------------------------------------------------------------------

.examine_party
#_03B006: LDX.w #$0000

.next_teammate
#_03B009: LDA.w $1000,X
#_03B00C: BPL .skip_teammate

#_03B00E: LDA.w $0E00
#_03B011: CMP.w #$00FE
#_03B014: BEQ .clear_status

#_03B016: LDA.w $1000,X
#_03B019: AND.w #$4000
#_03B01C: BEQ .skip_teammate

.clear_status
#_03B01E: LDA.w #$0000
#_03B021: STA.w $1002,X

.skip_teammate
#_03B024: TXA
#_03B025: CLC
#_03B026: ADC.w #$0060
#_03B029: TAX

#_03B02A: CMP.w #$0600
#_03B02D: BNE .next_teammate

;===================================================================================================

routine00A17E_bounce:
#_03B02F: JSL routine00A17E
#_03B033: RTS

;===================================================================================================
; TODO recruitment?
TextExtCMD_26:
#_03B034: SEP #$20

#_03B036: JSR GetNextTextByte
#_03B039: CMP.b #$04
#_03B03B: BCS .add_demon

#_03B03D: CMP.b #$01
#_03B03F: BNE .not_momo

#_03B041: PHA

#_03B042: JSL routine0F99C2

#_03B046: PLA

;---------------------------------------------------------------------------------------------------

.not_momo
#_03B047: REP #$30

#_03B049: AND.w #$00FF
#_03B04C: ASL A
#_03B04D: TAY

#_03B04E: LDX.w PartyIDtoOffset,Y
#_03B051: STX.w $0E00

#_03B054: LDA.w #$C000
#_03B057: STA.w $1000,X

#_03B05A: LDX.w #$0000

.next_party_slot
#_03B05D: LDA.w $0700,X
#_03B060: CMP.w #$FFFF
#_03B063: BEQ .empty_slot

#_03B065: INX
#_03B066: INX
#_03B067: CPX.w #$000C
#_03B06A: BNE .next_party_slot

.empty_slot
#_03B06C: LDA.w $0E00
#_03B06F: STA.w $0700,X

#_03B072: JMP routine00A17E_bounce

;---------------------------------------------------------------------------------------------------

.add_demon
#_03B075: REP #$30

#_03B077: AND.w #$0001
#_03B07A: ASL A
#_03B07B: TAX

#_03B07C: LDA.w $050A,X
#_03B07F: STA.w $0E00

#_03B082: LDX.w #$0180

.next_teammate
#_03B085: LDA.w $1000,X
#_03B088: BEQ .copy_demon

#_03B08A: TXA
#_03B08B: CLC
#_03B08C: ADC.w #$0060
#_03B08F: TAX

#_03B090: CMP.w #$0600
#_03B093: BNE .next_teammate

;---------------------------------------------------------------------------------------------------

#_03B095: SEP #$20

#_03B097: LDA.b #$FF
#_03B099: STA.w $0A58

#_03B09C: RTS

;---------------------------------------------------------------------------------------------------

.copy_demon
#_03B09D: PHX

#_03B09E: LDA.w $0E00
#_03B0A1: STA.w $050A

#_03B0A4: STZ.w $0524

#_03B0A7: LDA.w #$0001
#_03B0AA: STA.w $050E

#_03B0AD: JSL LoadDemonStats

#_03B0B1: PLX

#_03B0B2: TXA
#_03B0B3: CLC
#_03B0B4: ADC.w #$1000
#_03B0B7: STA.w $00E0

#_03B0BA: LDY.w #$0000

.copy_next_stat
#_03B0BD: LDA.w $1600,Y
#_03B0C0: STA.b ($E0),Y
#_03B0C2: INY
#_03B0C3: CPY.w #$0060
#_03B0C6: BNE .copy_next_stat

#_03B0C8: LDA.w #$8000
#_03B0CB: STA.w $1000,X

#_03B0CE: JMP routine00A17E_bounce

;===================================================================================================

PartyIDtoOffset:
#_03B0D1: dw $0000, $0060, $00C0, $0120
#_03B0D9: dw $0180, $01E0, $0240, $02A0
#_03B0E1: dw $0300, $0360, $03C0, $0420
#_03B0E9: dw $0480, $04E0, $0540, $05A0

;===================================================================================================

TextExtCMD_27:
#_03B0F1: SEP #$20

#_03B0F3: JSR GetNextTextByte
#_03B0F6: CMP.b #$04
#_03B0F8: BCS .demon

#_03B0FA: REP #$30

#_03B0FC: AND.w #$00FF
#_03B0FF: ASL A
#_03B100: TAY

#_03B101: LDX.w PartyIDtoOffset,Y
#_03B104: STX.w $0E00

#_03B107: LDA.w #$0000
#_03B10A: STA.w $1000,X

#_03B10D: LDX.w $0E00
#_03B110: JSL routine0F853F

#_03B114: SEP #$20

#_03B116: LDA.w $0A58
#_03B119: BPL .continue

#_03B11B: RTS

.continue
#_03B11C: JMP routine00A17E_bounce

;===================================================================================================

.demon
#_03B11F: REP #$30

#_03B121: AND.w #$0001
#_03B124: ASL A
#_03B125: TAX

#_03B126: LDA.w $050A,X
#_03B129: JSL routine0F84C1

#_03B12D: JMP routine00A17E_bounce

;===================================================================================================

AddItemToInventory_long:
#_03B130: JSR AddItemToInventory
#_03B133: RTL

;===================================================================================================
; Seems to add an item to inventory
;===================================================================================================
AddItemToInventory:
#_03B134: SEP #$30

#_03B136: STZ.w $0A58

#_03B139: LDX.b #$00

; first look for an existing stack
.next_slot
#_03B13B: LDA.w $0780,X
#_03B13E: CMP.w $0A50
#_03B141: BNE .invalid_slot

#_03B143: LDA.w $0781,X
#_03B146: CMP.b #$09
#_03B148: BEQ .invalid_slot

#_03B14A: INC.w $0781,X

#_03B14D: BRA .exit

.invalid_slot
#_03B14F: INX
#_03B150: INX
#_03B151: CPX.b #$3C
#_03B153: BNE .next_slot

;---------------------------------------------------------------------------------------------------

#_03B155: LDX.b #$00

; now look for an empty slot
.next_slot_2
#_03B157: LDA.w $0781,X
#_03B15A: BNE .slot_taken

#_03B15C: LDA.w $0A50
#_03B15F: STA.w $0780,X
#_03B162: INC.w $0781,X
#_03B165: BRA .exit

.slot_taken
#_03B167: INX
#_03B168: INX
#_03B169: CPX.b #$3C
#_03B16B: BNE .next_slot_2

#_03B16D: LDA.b #$FF
#_03B16F: STA.w $0A58

.exit
#_03B172: RTS

;===================================================================================================

TakeItemFromSomewhere_long:
#_03B173: JSR TakeItemFromSomewhere
#_03B176: RTL

;===================================================================================================
; Seems to take an item from inventory/character
;===================================================================================================
TakeItemFromSomewhere:
#_03B177: SEP #$30

#_03B179: STZ.w $0A58

; $0A51 indicates how the item is being removed
; 0x00         Search inventory
; 0x01 - 0x7F  Take from a specific slot
; 0x80 - 0xFF  Take from a specific character
#_03B17C: LDA.w $0A51
#_03B17F: BMI .take_from_character
#_03B181: BNE .check_specific_slot

; Search the inventory for a matching stack of nonzero
#_03B183: LDX.b #$00

.next_slot
#_03B185: LDA.w $0780,X
#_03B188: CMP.w $0A50
#_03B18B: BNE .not_here

#_03B18D: LDA.w $0781,X
#_03B190: BEQ .not_here

#_03B192: DEC.w $0781,X
#_03B195: BEQ .that_was_the_last_one

#_03B197: RTS

.that_was_the_last_one
#_03B198: JSL CountAndArrangeGemsOrSomething

#_03B19C: RTS

.not_here
#_03B19D: INX
#_03B19E: INX
#_03B19F: CPX.b #$3C
#_03B1A1: BNE .next_slot

#_03B1A3: DEC.w $0A58

#_03B1A6: RTS

;---------------------------------------------------------------------------------------------------

; Look in a specific inventory slot and assume there's nonzero
.check_specific_slot
#_03B1A7: ASL A
#_03B1A8: TAX

#_03B1A9: LDA.w $0781,X
#_03B1AC: DEC A
#_03B1AD: STA.w $0781,X

#_03B1B0: BEQ .now_theres_no_more

#_03B1B2: RTS

.now_theres_no_more
#_03B1B3: JSL CountAndArrangeGemsOrSomething

#_03B1B7: RTS

;---------------------------------------------------------------------------------------------------

; Take from a character, searching all their equipment
.take_from_character
#_03B1B8: REP #$30

#_03B1BA: AND.w #$007F
#_03B1BD: DEC A
#_03B1BE: AND.w #$000F
#_03B1C1: ASL A
#_03B1C2: TAX

#_03B1C3: LDA.l PartyIDtoOffset,X
#_03B1C7: TAX

#_03B1C8: LDA.w $0A50
#_03B1CB: AND.w #$00FF
#_03B1CE: STA.w $0A50

#_03B1D1: LDY.w #$0006

.next_equipment_slot
#_03B1D4: LDA.w $1042,X
#_03B1D7: CMP.w $0A50
#_03B1DA: BEQ .they_were_holding_it

#_03B1DC: INX
#_03B1DD: INX
#_03B1DE: DEY
#_03B1DF: BPL .next_equipment_slot

#_03B1E1: SEP #$30

#_03B1E3: DEC.w $0A58

#_03B1E6: RTS

;---------------------------------------------------------------------------------------------------

.they_were_holding_it
#_03B1E7: LDA.w #$FFFF
#_03B1EA: STA.w $0692
#_03B1ED: STA.w $1042,X

#_03B1F0: TXA
#_03B1F1: AND.w #$FFF0
#_03B1F4: STA.w $0715

#_03B1F7: JSL routine01A700

#_03B1FB: LDX.w $0715
#_03B1FE: JSL UpdatePlayerStats

#_03B202: RTS

;===================================================================================================

TextExtCMD_2A:

#_03B203: SEP #$30

#_03B205: LDA.b #$FF
#_03B207: STA.w $0EEF

#_03B20A: JSL routine02E87C

#_03B20E: REP #$20

#_03B210: LDA.w $0A0B
#_03B213: CLC
#_03B214: ADC.w #$0041
#_03B217: STA.w $0A1A

#_03B21A: RTS

;===================================================================================================

TextExtCMD_2B:
#_03B21B: REP #$30

#_03B21D: JSR GetNextTextByte
#_03B220: AND.w #$00FF
#_03B223: CMP.w #$0004
#_03B226: BCS .demon

#_03B228: ASL A
#_03B229: TAY
#_03B22A: LDX.w PartyIDtoOffset,Y

#_03B22D: LDA.w $1000,X
#_03B230: AND.w #$4000
#_03B233: BEQ .dying_message

; Impossible branch
; should this have been a BRA?
#_03B235: BEQ .dont_relocate

;---------------------------------------------------------------------------------------------------

.demon
#_03B237: AND.w #$0001
#_03B23A: ASL A
#_03B23B: TAY

#_03B23C: LDA.w $050A,Y
#_03B23F: STA.w $0E00

#_03B242: LDX.w #$0180

.next_teammate
#_03B245: LDA.w $1000,X
#_03B248: AND.w #$4000
#_03B24B: BEQ .not_dying

#_03B24D: LDA.w $1004,X
#_03B250: CMP.w $0E00
#_03B253: BEQ .dont_relocate

.not_dying
#_03B255: TXA
#_03B256: CLC
#_03B257: ADC.w #$0060
#_03B25A: TAX

#_03B25B: CMP.w #$0600
#_03B25E: BNE .next_teammate

;---------------------------------------------------------------------------------------------------

.dying_message
#_03B260: SEP #$20

#_03B262: JSR GetNextTextByte
#_03B265: JSR ChangeMessageID

#_03B268: RTS

.dont_relocate
#_03B269: SEP #$20

#_03B26B: JSR GetNextTextByte

#_03B26E: RTS

;===================================================================================================

TextExtCMD_2C:
#_03B26F: JSL routine02D59F
#_03B273: RTS

;===================================================================================================

TextExtCMD_2D:
#_03B274: SEP #$30

#_03B276: JSR GetNextTextByte
#_03B279: JSL InitializeTextBoxToSizeForNewMessage

#_03B27D: RTS

;===================================================================================================

TextCommand_TestForStatusMessage:
#_03B27E: REP #$30

#_03B280: JSR GetNextTextByte
#_03B283: AND.w #$00FF
#_03B286: ASL A
#_03B287: TAY

#_03B288: LDX.w PartyIDtoOffset,Y

#_03B28B: JSR GetNextTextByte
#_03B28E: AND.w #$00FF
#_03B291: ASL A
#_03B292: TAY

#_03B293: LDA.w StatusConditionBits,Y
#_03B296: STA.w $0E00

#_03B299: LDA.w $1002,X
#_03B29C: AND.w $0E00
#_03B29F: BNE .afflicted

#_03B2A1: JSR GetNextTextByte
#_03B2A4: RTS

.afflicted
#_03B2A5: SEP #$20

#_03B2A7: JSR GetNextTextByte
#_03B2AA: JSR ChangeMessageID

#_03B2AD: RTS

;===================================================================================================
; TODO upload palette?
TextExtCMD_2F:
#_03B2AE: SEP #$30

#_03B2B0: LDA.l $0022FD
#_03B2B4: BEQ .no_delay

#_03B2B6: JSL AddSelfAsVectorAndMakeSpace

.no_delay
#_03B2BA: JSR GetNextTextByte

#_03B2BD: REP #$30

#_03B2BF: AND.w #$00FF
#_03B2C2: BIT.w #$0080
#_03B2C5: BNE .back_palette

#_03B2C7: PHA

#_03B2C8: JSR GetNextTextByte
#_03B2CB: AND.w #$00FF
#_03B2CE: TAX

#_03B2CF: PLA
#_03B2D0: JSL Transfer16Colors_F9AFA

#_03B2D4: RTS

;---------------------------------------------------------------------------------------------------

.back_palette
#_03B2D5: AND.w #$007F
#_03B2D8: ORA.w #$0008
#_03B2DB: PHA

#_03B2DC: JSR GetNextTextByte
#_03B2DF: AND.w #$00FF
#_03B2E2: CLC
#_03B2E3: ADC.w #$0100
#_03B2E6: TAX

#_03B2E7: PLA
#_03B2E8: JSL Transfer16Colors_F9AFA

#_03B2EC: RTS

;===================================================================================================

TextExtCMD_30:
#_03B2ED: SEP #$30

#_03B2EF: JSR GetNextTextByte
#_03B2F2: AND.b #$FF
#_03B2F4: BEQ .no_list

#_03B2F6: PHA

#_03B2F7: LDX.b #$00

.next
#_03B2F9: JSR GetNextTextByte
#_03B2FC: CMP.b #$FF
#_03B2FE: BEQ .end_of_list

#_03B300: STA.w $0A75,X

#_03B303: JSR GetNextTextByte
#_03B306: STA.w $0A79,X

#_03B309: INX
#_03B30A: BRA .next

.end_of_list
#_03B30C: TXA
#_03B30D: STA.w $0A74

#_03B310: DEC A
#_03B311: STA.w $0A73

#_03B314: LDA.b #$01
#_03B316: STA.w $0A72

#_03B319: PLA
#_03B31A: STA.w $0A71

#_03B31D: RTS

;---------------------------------------------------------------------------------------------------

.no_list
#_03B31E: LDA.b #$FF
#_03B320: STA.w $0A71

#_03B323: JSL AddSelfAsVector

#_03B327: RTS

;===================================================================================================

TextExtCMD_31:
#_03B328: SEP #$20

#_03B32A: INC.w $0A3D

#_03B32D: JSR GetNextTextByte
#_03B330: STA.w $0E00

#_03B333: REP #$30

#_03B335: LDA.w $0A22
#_03B338: PHA
#_03B339: LDA.w $0A24
#_03B33C: PHA
#_03B33D: LDA.w $0A26
#_03B340: PHA

#_03B341: LDA.w $00C2
#_03B344: PHA
#_03B345: LDA.w $00C0
#_03B348: PHA

#_03B349: LDA.w $0E00
#_03B34C: AND.w #$00FF
#_03B34F: STA.w $0A22

#_03B352: LDA.w #$0002
#_03B355: STA.w $0A24
#_03B358: STZ.w $0A26

#_03B35B: LDA.w $0C41
#_03B35E: AND.w #$00FF
#_03B361: ASL A
#_03B362: ASL A
#_03B363: STA.w $0E00

#_03B366: ASL A
#_03B367: CLC
#_03B368: ADC.w $0E00
#_03B36B: CLC
#_03B36C: ADC.w $0A22
#_03B36F: STA.w $0A22

#_03B372: JSR SetTextPointerFromMessageID
#_03B375: JSL routine03834C

#_03B379: REP #$20

#_03B37B: PLA
#_03B37C: STA.w $00C0
#_03B37F: PLA
#_03B380: STA.w $00C2

#_03B383: PLA
#_03B384: STA.w $0A26
#_03B387: PLA
#_03B388: STA.w $0A24
#_03B38B: PLA
#_03B38C: STA.w $0A22

#_03B38F: SEP #$20

#_03B391: DEC.w $0A3D

#_03B394: RTS

;===================================================================================================

TextExtCMD_32:
#_03B395: REP #$30

#_03B397: LDA.w $0C41
#_03B39A: AND.w #$00FF
#_03B39D: ASL A
#_03B39E: TAY

#_03B39F: PHY

#_03B3A0: LDA.w ShopActionMessagePointers,Y
#_03B3A3: STA.w $00E0

#_03B3A6: LDY.w #$0000

#_03B3A9: SEP #$30

#_03B3AB: LDA.b ($E0),Y
#_03B3AD: TAX

#_03B3AE: STA.w $09F1
#_03B3B1: STZ.w $09F0
#_03B3B4: STZ.w $09F2
#_03B3B7: STZ.w $09F3

#_03B3BA: LDA.b #$04
#_03B3BC: STA.w $09F4

.next_menu_item
#_03B3BF: INY

#_03B3C0: PHX
#_03B3C1: PHY

#_03B3C2: REP #$20

#_03B3C4: LDA.w #ShopActionMessagePointers
#_03B3C7: STA.w $00C3

#_03B3CA: SEP #$20

#_03B3CC: LDA.b #ShopActionMessagePointers>>16
#_03B3CE: STA.w $00C5

#_03B3D1: STZ.w $0A33

#_03B3D4: LDA.b ($E0),Y
#_03B3D6: STA.w $0A39

#_03B3D9: JSR WriteIndexedEntityName
#_03B3DC: JSR TextCommand_NewLine

#_03B3DF: REP #$20

#_03B3E1: LDA.w $0980
#_03B3E4: CLC
#_03B3E5: ADC.w #$0040
#_03B3E8: STA.w $0980

#_03B3EB: PLY
#_03B3EC: PLX

#_03B3ED: DEX
#_03B3EE: BPL .next_menu_item

;---------------------------------------------------------------------------------------------------

#_03B3F0: JSL routine02C8E9

#_03B3F4: REP #$10
#_03B3F6: PLY

#_03B3F7: SEP #$20

#_03B3F9: LDA.w $09F3
#_03B3FC: BMI .branch03B40E

#_03B3FE: REP #$20

#_03B400: LDA.w ShopActionMessagePointers,Y
#_03B403: STA.w $00E0

#_03B406: LDY.w $09F3
#_03B409: INY

#_03B40A: SEP #$30

#_03B40C: LDA.b ($E0),Y

.branch03B40E
#_03B40E: STA.w $0C42

#_03B411: STZ.w $0A33

#_03B414: RTS

;===================================================================================================

TextExtCMD_33:
#_03B415: SEP #$30

#_03B417: JSR GetNextTextByte
#_03B41A: PHA

#_03B41B: JSR GetNextTextByte
#_03B41E: STA.w $0E00

#_03B421: PLA
#_03B422: CMP.w $0C42
#_03B425: BEQ .relocate

#_03B427: RTS

.relocate
#_03B428: LDA.w $0E00
#_03B42B: JSR ChangeMessageID

#_03B42E: RTS

;===================================================================================================

TextExtCMD_34:
#_03B42F: SEP #$30

#_03B431: STZ.w $0A33

#_03B434: LDA.w $0C41

#_03B437: JMP routine0389F0

;===================================================================================================
; TODO cash check
TextExtCMD_35:
#_03B43A: REP #$20

#_03B43C: LDA.w $0407
#_03B43F: CMP.w $0A16
#_03B442: BCC .relocate

#_03B444: BNE .dont_relocate

#_03B446: LDA.w $0405
#_03B449: CMP.w $0A14
#_03B44C: BCC .relocate

.dont_relocate
#_03B44E: SEP #$20
#_03B450: JSR GetNextTextByte

#_03B453: RTS

.relocate
#_03B454: SEP #$20

#_03B456: JSR GetNextTextByte
#_03B459: JSR ChangeMessageID

#_03B45C: RTS

;===================================================================================================

TextExtCMD_36:
#_03B45D: REP #$20

#_03B45F: LDA.w $0A14
#_03B462: STA.w $0E10

#_03B465: LDA.w $0A16
#_03B468: STA.w $0E12

#_03B46B: SEP #$30

#_03B46D: LDA.w $0A33
#_03B470: LSR A
#_03B471: TAX

#_03B472: LDY.b #$05
#_03B474: JSL routine03D775

#_03B478: RTS

;===================================================================================================

TextExtCMD_37:
#_03B479: JSL routine0F9493
#_03B47D: JSL routine00C7AA
#_03B481: JSL routine0F84F6

#_03B485: RTS

;===================================================================================================

TextExtCMD_38:
#_03B486: SEP #$20

#_03B488: LDA.b #$03
#_03B48A: STA.w $0F76
#_03B48D: STA.w TS

#_03B490: LDA.b #$1F
#_03B492: STA.w $0F74
#_03B495: STA.w TM

#_03B498: REP #$30

#_03B49A: LDA.w #$0017
#_03B49D: JSL routine02F609

#_03B4A1: LDA.w #$000D
#_03B4A4: JSL routine02FC6E

#_03B4A8: LDA.w #$0000

.loop
#_03B4AB: PHA

#_03B4AC: JSR routine03B4E0

#_03B4AF: PLA
#_03B4B0: INC A
#_03B4B1: CMP.w #$0008
#_03B4B4: BNE .loop

#_03B4B6: RTS

;===================================================================================================

TextExtCMD_39:
#_03B4B7: REP #$30

#_03B4B9: LDA.w #$0017
#_03B4BC: JSL routine02F609

#_03B4C0: LDA.w #$000D
#_03B4C3: JSL routine02FC6E

#_03B4C7: LDA.w #$0007

.loop
#_03B4CA: PHA

#_03B4CB: JSR routine03B4E0

#_03B4CE: PLA
#_03B4CF: DEC A
#_03B4D0: BPL .loop

#_03B4D2: JSR routine03B4E0

#_03B4D5: SEP #$20

#_03B4D7: LDA.b #$02
#_03B4D9: STA.w $0F76
#_03B4DC: STA.w TS

#_03B4DF: RTS

;===================================================================================================

routine03B4E0:
#_03B4E0: PHP
#_03B4E1: REP #$30

#_03B4E3: STA.w $0E00

#_03B4E6: PHB

#_03B4E7: SEP #$20

#_03B4E9: LDA.b #routine03B4E0>>16
#_03B4EB: PHA

#_03B4EC: REP #$20

#_03B4EE: PLB

#_03B4EF: LDX.w #$0000
#_03B4F2: LDA.w #$0000

.clear_next
#_03B4F5: STA.l $7F7000,X

#_03B4F9: INX
#_03B4FA: INX
#_03B4FB: CPX.w #$0800
#_03B4FE: BNE .clear_next

#_03B500: LDA.w $0E00
#_03B503: BMI .finished

;---------------------------------------------------------------------------------------------------

#_03B505: SEP #$20

#_03B507: LDA.b #$7F
#_03B509: STA.w $00E2
#_03B50C: STA.w $00E5

#_03B50F: REP #$20

#_03B511: LDX.w #$0000

.next_chunk
#_03B514: LDA.w $0E00
#_03B517: INC A
#_03B518: ASL A
#_03B519: TAY

#_03B51A: LDA.w .target,Y
#_03B51D: CMP.w #$FFFF
#_03B520: BEQ .finished

#_03B522: STA.w $00E0

#_03B525: LDA.w $0E00
#_03B528: ASL A
#_03B529: TAY

#_03B52A: LDA.w .increment,Y
#_03B52D: CLC
#_03B52E: ADC.w $00E0
#_03B531: STA.w $00E3

#_03B534: LDY.w #$0000

; TODO groups of 11
.next_copy
#_03B537: LDA.w .tiles,X
#_03B53A: AND.w #$00FF
#_03B53D: ORA.w #$0C00
#_03B540: STA.b [$E0],Y

#_03B542: AND.w #$00FF
#_03B545: ORA.w #$4C00
#_03B548: STA.b [$E3],Y

#_03B54A: INX

#_03B54B: TYA
#_03B54C: CLC
#_03B54D: ADC.w #$0040
#_03B550: TAY

#_03B551: CPY.w #$02C0
#_03B554: BNE .next_copy

#_03B556: DEC.w $0E00
#_03B559: BRA .next_chunk

;---------------------------------------------------------------------------------------------------

.finished
#_03B55B: SEP #$20

#_03B55D: LDA.b #$01
#_03B55F: STA.w $0ED4

#_03B562: REP #$20

#_03B564: STZ.w $0F4D
#_03B567: STZ.w $0F4F

#_03B56A: LDA.w #$0000
#_03B56D: JSL VRAM_From_7FXXXX

#_03B571: JSL AddSelfAsVectorAndMakeSpace

#_03B575: JSL AddSelfAsVector
#_03B579: JSL AddSelfAsVector
#_03B57D: JSL AddSelfAsVector

#_03B581: PLB
#_03B582: PLP

#_03B583: RTS

;---------------------------------------------------------------------------------------------------

.target
#_03B584: dw $FFFF ; done

#_03B586: dw $7F7050
#_03B588: dw $7F7052
#_03B58A: dw $7F7054
#_03B58C: dw $7F7056
#_03B58E: dw $7F7058
#_03B590: dw $7F705A
#_03B592: dw $7F705C
#_03B594: dw $7F705E

.increment
#_03B596: dw $001E
#_03B598: dw $001A
#_03B59A: dw $0016
#_03B59C: dw $0012
#_03B59E: dw $000E
#_03B5A0: dw $000A
#_03B5A2: dw $0006
#_03B5A4: dw $0002

.tiles
#_03B5A6: db $06, $0A, $0E, $13, $18, $1D, $22, $27, $2B, $2F, $31
#_03B5B1: db $05, $09, $0D, $12, $17, $1C, $21, $26, $2A, $2E, $30
#_03B5BC: db $02, $08, $0C, $11, $16, $1B, $20, $25, $29, $2D, $02
#_03B5C7: db $01, $07, $0B, $10, $15, $1A, $1F, $24, $28, $2C, $01
#_03B5D2: db $02, $04, $02, $0F, $14, $19, $1E, $23, $02, $04, $02
#_03B5DD: db $01, $03, $01, $03, $01, $03, $01, $03, $01, $03, $01
#_03B5E8: db $02, $04, $02, $04, $02, $04, $02, $04, $02, $04, $02
#_03B5F3: db $01, $03, $01, $03, $01, $03, $01, $03, $01, $03, $01

;===================================================================================================

routine03B5FE:
#_03B5FE: PHP

#_03B5FF: PHB
#_03B600: PHK
#_03B601: PLB

#_03B602: SEP #$30

#_03B604: STZ.w $0CF3
#_03B607: STZ.w $0CF4

#_03B60A: JSL Reset_OAMrelatedWRAM

#_03B60E: LDA.b #$29
#_03B610: JSL routine02F609

#_03B614: LDA.b #$3C
#_03B616: JSL routine02F609

#_03B61A: REP #$30

#_03B61C: LDA.w $0717
#_03B61F: LSR A
#_03B620: LSR A
#_03B621: LSR A
#_03B622: LSR A
#_03B623: AND.w #$0003
#_03B626: TAX

#_03B627: PHA

#_03B628: LDA.w .data03B639,X
#_03B62B: AND.w #$00FF
#_03B62E: STA.w $0A59

#_03B631: PLA
#_03B632: BEQ .branch03B637

#_03B634: JMP .branch03B6C8

.branch03B637
#_03B637: BRA .branch03B63C

.data03B639
#_03B639: db $0D,$0C,$14

;---------------------------------------------------------------------------------------------------

.branch03B63C
#_03B63C: SEP #$30
#_03B63E: LDA.b #$06
#_03B640: LDX.b #$07
#_03B642: JSL routine0F9FF3
#_03B646: LDA.b #$0B
#_03B648: LDX.b #$00
#_03B64A: JSL Transfer16Colors_F9AFA
#_03B64E: JSL routine02E32D
#_03B652: JSR routine03B6F9
#_03B655: JSR routine03B819

#_03B658: SEP #$30
#_03B65A: LDA.w $09F3
#_03B65D: BMI .branch03B677

#_03B65F: JSR routine03BCFC
#_03B662: JSR routine03B87A
#_03B665: JSR routine03B8E8

#_03B668: SEP #$20
#_03B66A: LDA.b #$FF
#_03B66C: STA.w $0A71
#_03B66F: LDA.b #$04
#_03B671: JSR routine03B9A4
#_03B674: JSR routine03BCD3

.branch03B677
#_03B677: JSL ClearSixteenOAMThings
#_03B67B: JSL UpdateDialogBox
#_03B67F: JSL routine0F84F6

#_03B683: SEP #$30
#_03B685: LDA.b #$0C
#_03B687: LDX.b #$00
#_03B689: LDY.b #$01

#_03B68B: JSL GraduallyFadeStuff
#_03B68F: JSL routine0F9342
#_03B693: JSL routine0F939C

#_03B697: SEP #$20
#_03B699: LDA.w $0F0D
#_03B69C: AND.b #$F7
#_03B69E: STA.w $0F0D
#_03B6A1: STA.w HDMAEN
#_03B6A4: LDA.b #$F8
#_03B6A6: STA.w $0F53
#_03B6A9: STA.w $0ED4
#_03B6AC: LDA.b #$00
#_03B6AE: STA.w $0F53
#_03B6B1: JSL AddSelfAsVectorAndMakeSpace

#_03B6B5: LDA.b #$01
#_03B6B7: JSL ClearSomeBank7FBuffers

#_03B6BB: LDA.b #$01
#_03B6BD: JSL VRAM_From_7FXXXX
#_03B6C1: JSL AddSelfAsVectorAndMakeSpace

#_03B6C5: PLB
#_03B6C6: PLP
#_03B6C7: RTL

.branch03B6C8
#_03B6C8: SEP #$30
#_03B6CA: LDA.w $0A59
#_03B6CD: STA.w $0A5B
#_03B6D0: LDA.b #$0B
#_03B6D2: STA.w $0A59
#_03B6D5: JSL R0FA05F_DoesVRAMDMAs
#_03B6D9: JSR routine03B6F9
#_03B6DC: JSR routine03B819

#_03B6DF: SEP #$20
#_03B6E1: LDA.w $09F3
#_03B6E4: BMI .branch03B677

#_03B6E6: JSR routine03BCFC
#_03B6E9: JSR routine03BA87

#_03B6EC: SEP #$20
#_03B6EE: LDA.b #$00
#_03B6F0: JSR routine03B9A4
#_03B6F3: JSR routine03BCD3
#_03B6F6: JMP .branch03B677

;===================================================================================================

routine03B6F9:
#_03B6F9: SEP #$30
#_03B6FB: LDA.b #$07
#_03B6FD: JSL InitializeTextBoxToSizeForNewMessage
#_03B701: JSL routine00A056

#_03B705: REP #$30
#_03B707: LDX.w #$0000
#_03B70A: LDY.w #$0000

.branch03B70D
#_03B70D: LDA.w ElevatorTextTop,Y
#_03B710: AND.w #$00FF
#_03B713: ORA.w #$2000
#_03B716: STA.w $0106,X
#_03B719: LDA.w ElevatorTextBottom,Y
#_03B71C: AND.w #$00FF
#_03B71F: ORA.w #$2000
#_03B722: STA.w $012E,X
#_03B725: INY
#_03B726: INX
#_03B727: INX
#_03B728: CPX.w #$0024
#_03B72B: BNE .branch03B70D

#_03B72D: LDA.w #$3DA4
#_03B730: STA.w $0102
#_03B733: LDA.w #$3DC4
#_03B736: STA.w $012A
#_03B739: LDA.w #$0012
#_03B73C: STA.w $0104
#_03B73F: STA.w $012C
#_03B742: LDA.w #$0002
#_03B745: STA.w $0100
#_03B748: JSL AddSelfAsVectorAndMakeSpace

#_03B74C: REP #$30
#_03B74E: LDA.w $0717
#_03B751: AND.w #$000F
#_03B754: ASL A
#_03B755: TAX
#_03B756: LDA.l pointers07AA1E,X
#_03B75A: STA.w $00E0

#_03B75D: SEP #$20
#_03B75F: LDA.b #$07
#_03B761: STA.w $00E2
#_03B764: LDY.w #$0000
#_03B767: LDX.w #$0000

.branch03B76A
#_03B76A: LDA.b [$E0],Y
#_03B76C: CMP.b #$FF
#_03B76E: BEQ .branch03B789

#_03B770: STA.w $098C,X

#_03B773: INY
#_03B774: LDA.b [$E0],Y
#_03B776: STA.w $0996,X

#_03B779: INY
#_03B77A: LDA.b [$E0],Y
#_03B77C: STA.w $09A0,X

#_03B77F: INY
#_03B780: LDA.b [$E0],Y
#_03B782: STA.w $09AA,X

#_03B785: INY
#_03B786: INX
#_03B787: BRA .branch03B76A

.branch03B789
#_03B789: STX.w $0E02
#_03B78C: STX.w $0E08

#_03B78F: REP #$20
#_03B791: LDA.w #$3E07
#_03B794: STA.w $0E00
#_03B797: LDY.w #$0000
#_03B79A: LDX.w #$0000
#_03B79D: STZ.w $0E04

.branch03B7A0
#_03B7A0: PHX
#_03B7A1: LDA.w $098C,X
#_03B7A4: STA.w $0E06
#_03B7A7: AND.w #$007F
#_03B7AA: ASL A
#_03B7AB: TAY
#_03B7AC: LDX.w $0E04

#_03B7AF: LDA.w ElevatorFloorNumbers+0,Y
#_03B7B2: AND.w #$00FF
#_03B7B5: ORA.w #$2000
#_03B7B8: STA.w $0106,X

#_03B7BB: LDA.w ElevatorFloorNumbers+1,Y
#_03B7BE: AND.w #$00FF
#_03B7C1: ORA.w #$2000
#_03B7C4: STA.w $0108,X

#_03B7C7: LDA.w #$2010
#_03B7CA: STA.w $010A,X
#_03B7CD: LDA.w $0E06
#_03B7D0: AND.w #$0080
#_03B7D3: BEQ .branch03B7BD

#_03B7D5: LDA.w #$200C
#_03B7D8: STA.w $0106,X

.branch03B7BD
#_03B7DB: LDA.w $0E00
#_03B7DE: STA.w $0102,X
#_03B7E1: LDA.w #$0003
#_03B7E4: STA.w $0104,X
#_03B7E7: LDA.w $0E00
#_03B7EA: CLC
#_03B7EB: ADC.w #$0040
#_03B7EE: STA.w $0E00
#_03B7F1: LDA.w $0E04
#_03B7F4: CLC
#_03B7F5: ADC.w #$000A
#_03B7F8: STA.w $0E04
#_03B7FB: PLX
#_03B7FC: INX
#_03B7FD: DEC.w $0E02
#_03B800: BNE .branch03B7A0

#_03B802: LDA.w $0E08
#_03B805: STA.w $0100
#_03B808: JSL AddSelfAsVectorAndMakeSpace
#_03B80C: DEC.w $0E08
#_03B80F: LDA.w $0E08
#_03B812: STA.w $09F1
#_03B815: STZ.w $09F3
#_03B818: RTS

;===================================================================================================

routine03B819:
#_03B819: JSR routine03B8BC

#_03B81C: SEP #$30

#_03B81E: LDA.b #$05
#_03B820: STA.w $09F4
#_03B823: STZ.w $09F2
#_03B826: STZ.w $09F0

#_03B829: JSL routine02C8E9

#_03B82D: RTS

;===================================================================================================

ElevatorFloorNumbers:
#_03B82E: db $CF, $02 ; " 1"
#_03B830: db $CF, $03 ; " 2"
#_03B832: db $CF, $04 ; " 3"
#_03B834: db $CF, $05 ; " 4"
#_03B836: db $CF, $06 ; " 5"
#_03B838: db $CF, $07 ; " 6"
#_03B83A: db $CF, $08 ; " 7"
#_03B83C: db $CF, $09 ; " 8"
#_03B83E: db $CF, $0A ; " 9"
#_03B840: db $02, $01 ; "10"
#_03B842: db $02, $02 ; "11"
#_03B844: db $02, $03 ; "12"
#_03B846: db $02, $04 ; "13"
#_03B848: db $04, $01 ; "30"
#_03B84A: db $04, $02 ; "31"
#_03B84C: db $04, $03 ; "32"
#_03B84E: db $05, $06 ; "45"
#_03B850: db $05, $07 ; "46"
#_03B852: db $05, $08 ; "47"
#_03B854: db $05, $09 ; "48"

;===================================================================================================

ElevatorTextTop:
#_03B856: db $9E, $CF, $CF, $CF, $CF, $CF, $CF, $CF
#_03B85E: db $CF, $CF, $CF, $CF, $CF, $9E, $CF, $9E
#_03B866: db $CF, $CF

; ごりようかいすうを えらんでください
ElevatorTextBottom:
#_03B868: db $2E, $4C, $4A, $27, $2A, $26, $31, $27 ; こりようかいすう
#_03B870: db $51, $CF, $28, $4B, $52, $37, $2C, $34 ; を⎵えらんてくた
#_03B878: db $2F, $26 ; さい

;===================================================================================================

routine03B87A:
#_03B87A: PHP
#_03B87B: SEP #$30

#_03B87D: JSR routine03B8CD

#_03B880: LDA.w $0E00
#_03B883: CMP.w $09F3
#_03B886: BEQ .exit

#_03B888: BCC .branch03B896

#_03B88A: LDA.b #$26
#_03B88C: STA.w $0A75

#_03B88F: LDA.b #$1F
#_03B891: STA.w $0A76

#_03B894: BRA .branch03B8A0

.branch03B896
#_03B896: LDA.b #$26
#_03B898: STA.w $0A75

#_03B89B: LDA.b #$5C
#_03B89D: STA.w $0A76

.branch03B8A0
#_03B8A0: LDA.b #$10
#_03B8A2: STA.w $0A79
#_03B8A5: STA.w $0A7A

#_03B8A8: LDA.b #$02
#_03B8AA: STA.w $0A74

#_03B8AD: LDA.b #$01
#_03B8AF: STA.w $0A73
#_03B8B2: STA.w $0A72

#_03B8B5: LDA.b #$02
#_03B8B7: STA.w $0A71

.exit
#_03B8BA: PLP
#_03B8BB: RTS

;===================================================================================================

routine03B8BC:
#_03B8BC: SEP #$30

#_03B8BE: JSR routine03B8CD

#_03B8C1: REP #$30

#_03B8C3: LDA.w #$0013
#_03B8C6: STA.w $0E08

#_03B8C9: JSR routine03B93B

#_03B8CC: RTS

;===================================================================================================

routine03B8CD:
#_03B8CD: PHP
#_03B8CE: SEP #$30

#_03B8D0: LDX.b #$00

#_03B8D2: LDA.w $0713

.next
#_03B8D5: CMP.w $098C,X
#_03B8D8: BEQ .found

#_03B8DA: INX
#_03B8DB: BRA .next

.found
#_03B8DD: TXA

#_03B8DE: REP #$20

#_03B8E0: AND.w #$00FF
#_03B8E3: STA.w $0E00

#_03B8E6: PLP
#_03B8E7: RTS

;===================================================================================================

routine03B8E8:
#_03B8E8: SEP #$30

#_03B8EA: JSR routine03B8CD

#_03B8ED: LDA.w $0E00
#_03B8F0: CMP.w $09F3
#_03B8F3: BEQ .equal

#_03B8F5: LDA.b #$0C ; SFX 0C
#_03B8F7: JSL WriteAPUCareful

.next
#_03B8FB: PHP
#_03B8FC: REP #$20

#_03B8FE: LDA.w #$0014
#_03B901: STA.w $0E08

#_03B904: JSR routine03B93B

#_03B907: PLP

#_03B908: LDA.w $0E00
#_03B90B: CMP.w $09F3
#_03B90E: BEQ .equal
#_03B910: BCC .lower

#_03B912: LDY.b #$3C
#_03B914: JSL RunFramesYTimes

#_03B918: DEC.w $0E00
#_03B91B: BRA .next

.lower
#_03B91D: LDY.b #$3C
#_03B91F: JSL RunFramesYTimes

#_03B923: INC.w $0E00

#_03B926: BRA .next

;---------------------------------------------------------------------------------------------------

.equal
#_03B928: REP #$30

#_03B92A: LDY.w #$001E
#_03B92D: JSL RunFramesYTimes

#_03B931: LDA.w #$0013
#_03B934: STA.w $0E08

#_03B937: JSR routine03B93B

#_03B93A: RTS

;===================================================================================================

routine03B93B:
#_03B93B: REP #$30

#_03B93D: LDA.w $0E00
#_03B940: AND.w #$00FF
#_03B943: STA.w $0E00

#_03B946: LDX.w #$0000
#_03B949: LDA.w #$0081
#_03B94C: STA.w $0E06

#_03B94F: LDA.w #$0000
#_03B952: STA.w $0E02

#_03B955: ASL A ; are you okay?
#_03B956: STA.w $0E04

.next
#_03B959: PHX

#_03B95A: LDA.w #$0012

#_03B95D: CPX.w $0E00
#_03B960: BNE .branch03B965

#_03B962: LDA.w $0E08

.branch03B965
#_03B965: LDX.w $0E04

#_03B968: STA.w $0000,X

#_03B96B: LDA.w $0E06
#_03B96E: STA.w $1AA0,X

#_03B971: LDA.w #$0028
#_03B974: STA.w $1A60,X

#_03B977: LDA.w $0E06
#_03B97A: CLC
#_03B97B: ADC.w #$000E
#_03B97E: STA.w $0E06

#_03B981: SEP #$20

#_03B983: LDX.w $0E02

#_03B986: LDA.b #$80
#_03B988: STA.w $1A00,X

#_03B98B: REP #$20

#_03B98D: INC.w $0E02

#_03B990: INC.w $0E04
#_03B993: INC.w $0E04

#_03B996: PLX
#_03B997: INX

#_03B998: CPX.w $09F1
#_03B99B: BCC .next
#_03B99D: BEQ .next

#_03B99F: JSL AddSelfAsVectorAndMakeSpace

#_03B9A3: RTS

;===================================================================================================

routine03B9A4:
#_03B9A4: SEP #$30

#_03B9A6: STA.w $0E02

#_03B9A9: LDX.b #$FF

#_03B9AB: LDA.w $0713

.search
#_03B9AE: INX

#_03B9AF: CMP.w $098C,X
#_03B9B2: BNE .search

#_03B9B4: LDY.b #$00

#_03B9B6: STX.w $0E00

#_03B9B9: CPX.w $09F3
#_03B9BC: BNE .continue

#_03B9BE: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_03B9BF: BCC .lower

#_03B9C1: LDY.b #$32

.lower
#_03B9C3: PHY

#_03B9C4: LDA.b #$30 ; SFX 30
#_03B9C6: JSL WriteAPUCareful

#_03B9CA: PLY

.next
#_03B9CB: PHY

#_03B9CC: REP #$20

#_03B9CE: LDX.w $0E02

#_03B9D1: LDA.w data03BA23+0,Y
#_03B9D4: BEQ .done

#_03B9D6: CLC
#_03B9D7: ADC.w $0F4F,X
#_03B9DA: STA.w $0F4F,X

#_03B9DD: SEP #$20

#_03B9DF: LDA.b #$01
#_03B9E1: STA.w $0ED4

#_03B9E4: LDA.w data03BA23+2,Y
#_03B9E7: TAY

#_03B9E8: JSL RunFramesYTimes

#_03B9EC: PLY

#_03B9ED: INY
#_03B9EE: INY
#_03B9EF: INY
#_03B9F0: INY
#_03B9F1: BRA .next

;---------------------------------------------------------------------------------------------------

.done
#_03B9F3: PLY

#_03B9F4: LDY.b #$0A
#_03B9F6: JSL RunFramesYTimes

#_03B9FA: SEP #$30

#_03B9FC: LDX.w $09F3

#_03B9FF: LDA.w $098C,X
#_03BA02: STA.w $0713

#_03BA05: LDA.w $0996,X
#_03BA08: STA.w $070C

#_03BA0B: LDA.w $09A0,X
#_03BA0E: STA.w $070D

#_03BA11: LDA.w $09AA,X
#_03BA14: STA.w $0710

#_03BA17: LDA.b #$01
#_03BA19: STA.w $0C4F

#_03BA1C: STZ.w $0584
#_03BA1F: STZ.w $0585

#_03BA22: RTS

;---------------------------------------------------------------------------------------------------

data03BA23:
; set 1
#_03BA23: dw $FFFF, $0001
#_03BA27: dw $FFFF, $0001
#_03BA2B: dw $FFFF, $0001
#_03BA2F: dw $FFFF, $0001
#_03BA33: dw $0001, $0001
#_03BA37: dw $0001, $0001
#_03BA3B: dw $0001, $0001
#_03BA3F: dw $0001, $0001
#_03BA43: dw $0001, $0002
#_03BA47: dw $0001, $0002
#_03BA4B: dw $FFFF, $0002
#_03BA4F: dw $FFFF, $0002
#_03BA53: dw $0000 ; done

; set 2
#_03BA55: dw $0001, $0001
#_03BA59: dw $0001, $0001
#_03BA5D: dw $0001, $0001
#_03BA61: dw $0001, $0001
#_03BA65: dw $FFFF, $0001
#_03BA69: dw $FFFF, $0001
#_03BA6D: dw $FFFF, $0001
#_03BA71: dw $FFFF, $0001
#_03BA75: dw $FFFF, $0002
#_03BA79: dw $FFFF, $0002
#_03BA7D: dw $0001, $0002
#_03BA81: dw $0001, $0002
#_03BA85: dw $0000 ; done

;===================================================================================================

routine03BA87:
#_03BA87: SEP #$30

#_03BA89: JSR routine03B8CD

#_03BA8C: LDA.w $0E00
#_03BA8F: CMP.w $09F3
#_03BA92: BEQ .loop

#_03BA94: LDA.b #$0C ; SFX 0C
#_03BA96: JSL WriteAPUCareful

;---------------------------------------------------------------------------------------------------

.loop
#_03BA9A: PHP

#_03BA9B: REP #$20

#_03BA9D: LDA.w #$0014
#_03BAA0: STA.w $0E08

#_03BAA3: JSR routine03B93B

#_03BAA6: PLP

#_03BAA7: LDA.w $0E00
#_03BAAA: CMP.w $09F3
#_03BAAD: BEQ .finished

#_03BAAF: BCC .lower

#_03BAB1: LDA.w $0E00
#_03BAB4: PHA
#_03BAB5: LDA.w $0E02
#_03BAB8: PHA
#_03BAB9: LDA.w $0E04
#_03BABC: PHA

#_03BABD: PHP
#_03BABE: JSR routine03BB01
#_03BAC1: PLP

#_03BAC2: PLA
#_03BAC3: STA.w $0E04
#_03BAC6: PLA
#_03BAC7: STA.w $0E02
#_03BACA: PLA
#_03BACB: STA.w $0E00

#_03BACE: DEC.w $0E00
#_03BAD1: BRA .loop

;---------------------------------------------------------------------------------------------------

.lower
#_03BAD3: LDA.w $0E00
#_03BAD6: PHA
#_03BAD7: LDA.w $0E02
#_03BADA: PHA
#_03BADB: LDA.w $0E04
#_03BADE: PHA

#_03BADF: PHP
#_03BAE0: JSR routine03BBF0
#_03BAE3: PLP

#_03BAE4: PLA
#_03BAE5: STA.w $0E04
#_03BAE8: PLA
#_03BAE9: STA.w $0E02
#_03BAEC: PLA
#_03BAED: STA.w $0E00

#_03BAF0: INC.w $0E00

#_03BAF3: BRA .loop

;---------------------------------------------------------------------------------------------------

.finished
#_03BAF5: REP #$30

#_03BAF7: LDA.w #$0013
#_03BAFA: STA.w $0E08

#_03BAFD: JSR routine03B93B

#_03BB00: RTS

;===================================================================================================

routine03BB01:
#_03BB01: REP #$20
#_03BB03: LDA.w #$2D00
#_03BB06: STA.w $0F1C
#_03BB09: LDA.w #$00DF
#_03BB0C: STA.w $0E00
#_03BB0F: LDA.w #$00FF
#_03BB12: STA.w $0E02
#_03BB15: STZ.w $0E04

#_03BB18: SEP #$30
#_03BB1A: LDA.b #$10
#_03BB1C: STA.w $0F1B
#_03BB1F: LDA.b #$7E
#_03BB21: STA.w $0F1E
#_03BB24: LDA.b #$02
#_03BB26: STA.w DMA3MODE
#_03BB29: LDY.b #$00
#_03BB2B: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.branch03BB2D
#_03BB2D: REP #$20
#_03BB2F: LDA.w #$0000
#_03BB32: STA.l $7E2D01
#_03BB36: LDA.w $0E00
#_03BB39: STA.l $7E2D04
#_03BB3D: LDA.w $0E02
#_03BB40: STA.l $7E2D07

#_03BB44: SEP #$20
#_03BB46: LDA.b #$81
#_03BB48: STA.l $7E2D00
#_03BB4C: LDA.w $0E04
#_03BB4F: CLC
#_03BB50: ADC.b #$07
#_03BB52: CMP.b #$80
#_03BB54: BCC .branch03BB58

#_03BB56: LDA.b #$7F

.branch03BB58
#_03BB58: STA.l $7E2D03
#_03BB5C: LDA.b #$70
#_03BB5E: CMP.w $0E04
#_03BB61: BCS .branch03BB73

#_03BB63: LDA.b #$00
#_03BB65: STA.l $7E2D06
#_03BB69: STA.l $7E2D07
#_03BB6D: STA.l $7E2D08
#_03BB71: BRA .branch03BB7D

.branch03BB73
#_03BB73: SEC
#_03BB74: SBC.w $0E04
#_03BB77: AND.b #$7F
#_03BB79: STA.l $7E2D06

.branch03BB7D
#_03BB7D: LDA.b #$00
#_03BB7F: STA.l $7E2D09
#_03BB83: LDA.w $0F0E
#_03BB86: ORA.b #$08
#_03BB88: STA.w $0F0E
#_03BB8B: JSL AddSelfAsVectorAndMakeSpace

#_03BB8F: SEP #$10
#_03BB91: REP #$20

#_03BB93: DEC.w $0E00
#_03BB96: DEC.w $0E00

#_03BB99: DEC.w $0E02
#_03BB9C: DEC.w $0E02

#_03BB9F: INC.w $0E04
#_03BBA2: INC.w $0E04

#_03BBA5: DEC.w $0E00
#_03BBA8: DEC.w $0E00

#_03BBAB: DEC.w $0E02
#_03BBAE: DEC.w $0E02

#_03BBB1: INC.w $0E04
#_03BBB4: INC.w $0E04

#_03BBB7: LDA.w $0E04
#_03BBBA: CMP.w #$00DC
#_03BBBD: BEQ .branch03BBC2

#_03BBBF: JMP .branch03BB2D

;---------------------------------------------------------------------------------------------------

.branch03BBC2
#_03BBC2: LDA.w #$0081
#_03BBC5: STA.l $7E2D00
#_03BBC9: LDA.w #$0000
#_03BBCC: STA.l $7E2D01

#_03BBD0: LDA.w #$007F
#_03BBD3: STA.l $7E2D03
#_03BBD7: LDA.w #$0000
#_03BBDA: STA.l $7E2D04
#_03BBDE: LDA.w #$0000
#_03BBE1: STA.l $7E2D06

#_03BBE5: SEP #$20
#_03BBE7: LDA.w $0F0E
#_03BBEA: ORA.b #$08
#_03BBEC: STA.w $0F0E
#_03BBEF: RTS

;===================================================================================================

routine03BBF0:
#_03BBF0: REP #$20
#_03BBF2: LDA.w #$2D00
#_03BBF5: STA.w $0F1C

#_03BBF8: LDA.w #$0004
#_03BBFB: STA.w $0E00

#_03BBFE: LDA.w #$0024
#_03BC01: STA.w $0E02
#_03BC04: STZ.w $0E04

#_03BC07: SEP #$30

#_03BC09: LDA.b #$10
#_03BC0B: STA.w $0F1B

#_03BC0E: LDA.b #$7E
#_03BC10: STA.w $0F1E

#_03BC13: LDA.b #$02
#_03BC15: STA.w DMA3MODE

#_03BC18: LDY.b #$00
#_03BC1A: LDX.b #$00

.branch03BC1C
#_03BC1C: REP #$20
#_03BC1E: LDA.w #$0000
#_03BC21: STA.l $7E2D01

#_03BC25: LDA.w $0E00
#_03BC28: STA.l $7E2D04

#_03BC2C: LDA.w $0E02
#_03BC2F: STA.l $7E2D07

#_03BC33: SEP #$20
#_03BC35: LDA.b #$81
#_03BC37: STA.l $7E2D00
#_03BC3B: LDA.w $0E04
#_03BC3E: CMP.b #$78
#_03BC40: BCS .branch03BC50

#_03BC42: LDA.b #$7F
#_03BC44: STA.l $7E2D03

#_03BC48: LDA.b #$00
#_03BC4A: STA.l $7E2D06
#_03BC4E: BRA .branch03BC66

.branch03BC50
#_03BC50: LDA.b #$EA
#_03BC52: SEC
#_03BC53: SBC.w $0E04
#_03BC56: STA.l $7E2D03
#_03BC5A: LDA.b #$7F
#_03BC5C: STA.l $7E2D06
#_03BC60: LDA.b #$00
#_03BC62: STA.l $7E2D09

.branch03BC66
#_03BC66: LDA.w $0F0E
#_03BC69: ORA.b #$08
#_03BC6B: STA.w $0F0E
#_03BC6E: JSL AddSelfAsVectorAndMakeSpace

#_03BC72: SEP #$10
#_03BC74: REP #$20
#_03BC76: INC.w $0E00
#_03BC79: INC.w $0E00

#_03BC7C: INC.w $0E02
#_03BC7F: INC.w $0E02

#_03BC82: INC.w $0E04
#_03BC85: INC.w $0E04

#_03BC88: INC.w $0E00
#_03BC8B: INC.w $0E00

#_03BC8E: INC.w $0E02
#_03BC91: INC.w $0E02

#_03BC94: INC.w $0E04
#_03BC97: INC.w $0E04

#_03BC9A: LDA.w $0E04
#_03BC9D: CMP.w #$00DC
#_03BCA0: BEQ .branch03BCA5

#_03BCA2: JMP .branch03BC1C

.branch03BCA5
#_03BCA5: LDA.w #$0081
#_03BCA8: STA.l $7E2D00

#_03BCAC: LDA.w #$0000
#_03BCAF: STA.l $7E2D01

#_03BCB3: LDA.w #$007F
#_03BCB6: STA.l $7E2D03

#_03BCBA: LDA.w #$0000
#_03BCBD: STA.l $7E2D04

#_03BCC1: LDA.w #$0000
#_03BCC4: STA.l $7E2D06

#_03BCC8: SEP #$20
#_03BCCA: LDA.w $0F0E
#_03BCCD: ORA.b #$08
#_03BCCF: STA.w $0F0E
#_03BCD2: RTS

;===================================================================================================

routine03BCD3:
#_03BCD3: REP #$30

#_03BCD5: LDA.w #$0008 ; SFX 08
#_03BCD8: JSL WriteAPUCareful

#_03BCDC: LDA.w #$0000

.next
#_03BCDF: PHA

#_03BCE0: PHP

#_03BCE1: JSR routine03BD22

#_03BCE4: LDA.w #$0001
#_03BCE7: JSL VRAM_From_7FXXXX

#_03BCEB: SEP #$10

#_03BCED: LDY.b #$03
#_03BCEF: JSL RunFramesYTimes

#_03BCF3: PLP

#_03BCF4: PLA
#_03BCF5: INC A
#_03BCF6: CMP.w #$0005
#_03BCF9: BNE .next

#_03BCFB: RTS

;===================================================================================================

routine03BCFC:
#_03BCFC: REP #$30

#_03BCFE: LDA.w #$0008 ; SFX 08
#_03BD01: JSL WriteAPUCareful

#_03BD05: LDA.w #$0004

.next
#_03BD08: PHA

#_03BD09: PHP

#_03BD0A: JSR routine03BD22

#_03BD0D: LDA.w #$0001
#_03BD10: JSL VRAM_From_7FXXXX

#_03BD14: SEP #$10

#_03BD16: LDY.b #$03
#_03BD18: JSL RunFramesYTimes

#_03BD1C: PLP

#_03BD1D: PLA
#_03BD1E: DEC A
#_03BD1F: BPL .next

#_03BD21: RTS

;===================================================================================================

routine03BD22:
#_03BD22: REP #$30

#_03BD24: AND.w #$00FF
#_03BD27: STA.w $0E00

#_03BD2A: ASL A
#_03BD2B: TAY

#_03BD2C: LDX.w #$0000

.next
#_03BD2F: LDA.w data03BD89+0,Y
#_03BD32: STA.l $7F5158,X

#_03BD36: CLC
#_03BD37: ADC.w #$4000
#_03BD3A: AND.w #$7FFF
#_03BD3D: STA.l $7F5166,X

#_03BD41: LDA.w data03BD89+2,Y
#_03BD44: STA.l $7F515A,X

#_03BD48: CLC
#_03BD49: ADC.w #$4000
#_03BD4C: AND.w #$7FFF
#_03BD4F: STA.l $7F5164,X

#_03BD53: LDA.w data03BD89+4,Y
#_03BD56: STA.l $7F515C,X

#_03BD5A: CLC
#_03BD5B: ADC.w #$4000
#_03BD5E: AND.w #$7FFF
#_03BD61: STA.l $7F5162,X

#_03BD65: LDA.w data03BD89+6,Y
#_03BD68: STA.l $7F515E,X

#_03BD6C: CLC
#_03BD6D: ADC.w #$4000
#_03BD70: AND.w #$7FFF
#_03BD73: STA.l $7F5160,X

#_03BD77: TYA
#_03BD78: CLC
#_03BD79: ADC.w #$0010
#_03BD7C: TAY

#_03BD7D: TXA
#_03BD7E: CLC
#_03BD7F: ADC.w #$0040
#_03BD82: TAX

#_03BD83: CPX.w #$01C0
#_03BD86: BNE .next

#_03BD88: RTS


;---------------------------------------------------------------------------------------------------

data03BD89:
#_03BD89: dw $0933, $0934, $0934, $4933
#_03BD91: dw $0103, $0103, $0103, $0103

#_03BD99: dw $0936, $0937, $0937, $4936
#_03BDA1: dw $0103, $0103, $0103, $0103

#_03BDA9: dw $0936, $0937, $0937, $4936
#_03BDB1: dw $0103, $0103, $0103, $0103

#_03BDB9: dw $0936, $0937, $0937, $4936
#_03BDC1: dw $0103, $0103, $0103, $0103

#_03BDC9: dw $0936, $0937, $0937, $4936
#_03BDD1: dw $0103, $0103, $0103, $0103

#_03BDD9: dw $0936, $0937, $0937, $4936
#_03BDE1: dw $0103, $0103, $0103, $0103

#_03BDE9: dw $0936, $0937, $0937, $4936
#_03BDF1: dw $0103, $0103, $0103, $0103

#_03BDF9: dw $0936, $0937, $0937, $4936
#_03BE01: dw $0103, $0103, $0103, $0103

;===================================================================================================

TextExtCMD_3A:
#_03BE09: REP #$30

#_03BE0B: JSR GetNextTextByte
#_03BE0E: AND.w #$00FF

#_03BE11: DEC A
#_03BE12: ASL A
#_03BE13: STA.w $0E02

#_03BE16: JSR GetNextTextByte
#_03BE19: AND.w #$00FF
#_03BE1C: ASL A
#_03BE1D: ASL A
#_03BE1E: TAY

#_03BE1F: LDX.w $0E02

#_03BE22: LDA.w .some_data+0,Y
#_03BE25: STA.w $0A95,X

#_03BE28: LDA.w .some_data+2,Y
#_03BE2B: STA.w $0A99,X

#_03BE2E: RTS

.some_data
#_03BE2F: dw $FF00, $0070
#_03BE33: dw $0100, $0070
#_03BE37: dw $FF00, $0030
#_03BE3B: dw $0100, $0030

;===================================================================================================

TextExtCMD_3B:
#_03BE3F: SEP #$30

#_03BE41: LDA.b #$28
#_03BE43: JSL routine02F609

#_03BE47: LDA.b #$30
#_03BE49: STA.w $0A9F

#_03BE4C: LDA.b #$3C
#_03BE4E: STA.w $0AA0

#_03BE51: LDA.b #$E6
#_03BE53: JSR SetGameProgressBit

#_03BE56: LDA.b #$FF
#_03BE58: JSR SetGameProgressBit

#_03BE5B: JSL routine029650

#_03BE5F: RTS

;===================================================================================================

TextExtCMD_3C:
#_03BE60: JSL LookForEmptyInventorySpace
#_03BE64: BCC .had_room

#_03BE66: JSR GetNextTextByte
#_03BE69: JSR ChangeMessageID

#_03BE6C: RTS

.had_room
#_03BE6D: JSR GetNextTextByte

#_03BE70: RTS

;===================================================================================================

LookForEmptyInventorySpace:
#_03BE71: PHP
#_03BE72: SEP #$30

#_03BE74: LDX.b #$00

.next_slot
#_03BE76: LDA.w $0781,X
#_03BE79: BEQ .empty_space

#_03BE7B: CMP.b #$09
#_03BE7D: BCS .slot_full

#_03BE7F: LDA.w $0780,X
#_03BE82: CMP.w $0A50
#_03BE85: BEQ .empty_space

.slot_full
#_03BE87: INX
#_03BE88: INX
#_03BE89: CPX.b #$3C
#_03BE8B: BNE .next_slot

#_03BE8D: PLP
#_03BE8E: SEC

#_03BE8F: RTL

.empty_space
#_03BE90: PLP
#_03BE91: CLC

#_03BE92: RTL

;===================================================================================================

TextExtCMD_3D:
#_03BE93: REP #$30

#_03BE95: LDA.w #$000C
#_03BE98: STA.w $0E00

#_03BE9B: LDA.w #$00F0
#_03BE9E: JSL TestGameProgressBit
#_03BEA2: BCS .branch03BEAA

#_03BEA4: DEC.w $0E00
#_03BEA7: DEC.w $0E00

.branch03BEAA
#_03BEAA: LDX.w #$0000

.next
#_03BEAD: LDA.w $0700,X
#_03BEB0: CMP.w #$FFFF
#_03BEB3: BEQ .found_slot

#_03BEB5: INX
#_03BEB6: INX
#_03BEB7: CPX.w $0E00
#_03BEBA: BNE .next

#_03BEBC: JSR GetNextTextByte
#_03BEBF: JSR ChangeMessageID

#_03BEC2: RTS

.found_slot
#_03BEC3: JSR GetNextTextByte

#_03BEC6: RTS

;===================================================================================================

TextCommand_55:
#_03BEC7: SEP #$30

#_03BEC9: JSR GetNextTextByte
#_03BECC: STA.w $0A54

#_03BECF: JSR GetNextTextByte
#_03BED2: STA.w $0A55

#_03BED5: STZ.w $0A56
#_03BED8: STZ.w $0A57

#_03BEDB: RTS

;===================================================================================================

TextExtCMD_40:
#_03BEDC: JSL routine0F9D30

#_03BEE0: RTS

;===================================================================================================

TextExtCMD_41:
#_03BEE1: SEP #$30

#_03BEE3: JSR GetNextTextByte
#_03BEE6: TAX

#_03BEE7: LDA.w $07E2,X
#_03BEEA: CMP.b #$FF
#_03BEEC: BEQ .no_one_here

#_03BEEE: STA.w $050A
#_03BEF1: STA.w $050A
#_03BEF4: STA.w $0BED

#_03BEF7: STZ.w $050B
#_03BEFA: STZ.w $050B
#_03BEFD: STZ.w $0BEE

#_03BF00: STZ.w $0524
#_03BF03: LDA.b #$01

#_03BF05: STA.w $050E
#_03BF08: LDA.b #$00

#_03BF0A: JSR GetDemonXClass

#_03BF0D: LDA.w $0BF3
#_03BF10: STA.w $0506
#_03BF13: STZ.w $0507

#_03BF16: JSR GetNextTextByte

#_03BF19: RTS

.no_one_here
#_03BF1A: JSR GetNextTextByte
#_03BF1D: JSR ChangeMessageID

#_03BF20: RTS

;===================================================================================================

TextExtCMD_42:
#_03BF21: SEP #$30

#_03BF23: JSL DarkenScreen

#_03BF27: LDA.b #$F4
#_03BF29: JSR ClearGameProgressBit

#_03BF2C: STZ.w $0C41

#_03BF2F: LDA.b #$04
#_03BF31: JSL TestGameProgressBit
#_03BF35: BCC .dont_clear

#_03BF37: LDA.b #$04
#_03BF39: JSR ClearGameProgressBit

#_03BF3C: INC.w $0C41

.dont_clear
#_03BF3F: LDA.b #$01
#_03BF41: JSL routine0F8836

#_03BF45: LDA.b #$1F
#_03BF47: STA.w $0F74
#_03BF4A: STA.w TM

#_03BF4D: STZ.w $0F7F
#_03BF50: STZ.w $0F80

#_03BF53: STZ.w $0A33

#_03BF56: LDA.b #$00
#_03BF58: JSL routine02F609
#_03BF5C: JSL routine00A17E

#_03BF60: LDA.b #$01
#_03BF62: JSL SomeDMAPrep_02CBD1

#_03BF66: LDA.b #$07
#_03BF68: JSL SomeDMAPrep_02CBD1

#_03BF6C: JSL Reset_OAMrelatedWRAM
#_03BF70: JSL BrightenScreen
#_03BF74: JSL routine0F84F6

#_03BF78: LDA.b #$07
#_03BF7A: JSL InitializeTextBoxToSizeForNewMessage
#_03BF7E: JSL routine00A056

#_03BF82: SEP #$20

#_03BF84: LDA.w $0C41
#_03BF87: BNE .set_flag_back

#_03BF89: RTS

.set_flag_back
#_03BF8A: LDA.b #$04
#_03BF8C: JSR SetGameProgressBit

#_03BF8F: RTS

;===================================================================================================

TextExtCMD_43:
#_03BF90: SEP #$20

#_03BF92: JSR GetNextTextByte
#_03BF95: STA.w $0453

#_03BF98: RTS

;===================================================================================================

TextExtCMD_44:
#_03BF99: REP #$30

; demon ID * 24
#_03BF9B: LDA.w $050A
#_03BF9E: ASL A
#_03BF9F: ASL A
#_03BFA0: ASL A
#_03BFA1: STA.w $0E00
#_03BFA4: ASL A
#_03BFA5: CLC
#_03BFA6: ADC.w $0E00
#_03BFA9: TAX

#_03BFAA: LDA.l DemonStats+23,X
#_03BFAE: AND.w #$00F0
#_03BFB1: CMP.w #$0020
#_03BFB4: BEQ .change_message

#_03BFB6: CMP.w #$0070
#_03BFB9: BEQ .change_message

#_03BFBB: JSR GetNextTextByte

#_03BFBE: RTS

.change_message
#_03BFBF: JSR GetNextTextByte
#_03BFC2: JSR ChangeMessageID

#_03BFC5: RTS

;===================================================================================================

TextExtCMD_45:
#_03BFC6: SEP #$30

#_03BFC8: JSR GetNextTextByte
#_03BFCB: AND.b #$FF
#_03BFCD: BMI .delete

#_03BFCF: TAX

#_03BFD0: LDA.b #$FF
#_03BFD2: STA.w $0A7D,X

#_03BFD5: JSR GetNextTextByte

#_03BFD8: RTS

.delete
#_03BFD9: AND.b #$0F
#_03BFDB: TAX

#_03BFDC: LDA.b #$00
#_03BFDE: STA.w $0A7D,X

#_03BFE1: JSR GetNextTextByte

#_03BFE4: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine03BFEE_long:
#_03BFE5: JSR routine03BFEE

#_03BFE8: RTL

;===================================================================================================

TextExtCMD_46:
#_03BFE9: SEP #$30

#_03BFEB: JSR GetNextTextByte

routine03BFEE:
#_03BFEE: SEP #$30

#_03BFF0: STA.w $0E00
#_03BFF3: AND.b #$0F
#_03BFF5: ASL A
#_03BFF6: ASL A
#_03BFF7: ASL A
#_03BFF8: ASL A
#_03BFF9: STA.l $7E22FE

#_03BFFD: LDA.b #$10
#_03BFFF: STA.l $7E22FF

#_03C003: REP #$20

#_03C005: LDA.w $0E00
#_03C008: AND.w #$00F0
#_03C00B: BEQ .branch03C012

#_03C00D: LDA.w #$0000
#_03C010: BRA .start_fill

.branch03C012
#_03C012: LDA.w #$FFFF

;---------------------------------------------------------------------------------------------------

.start_fill
#_03C015: LDX.b #$00

.fill_next
#_03C017: STA.l $7E2300,X
#_03C01B: INX
#_03C01C: INX
#_03C01D: CPX.b #$20
#_03C01F: BNE .fill_next

#_03C021: SEP #$20

#_03C023: LDA.b #$01
#_03C025: STA.l $7E22FD

#_03C029: RTS

;===================================================================================================

TextExtCMD_47:
#_03C02A: REP #$30

#_03C02C: JSR GetNextTextByte
#_03C02F: AND.w #$0007
#_03C032: STA.w $0A6A

#_03C035: ASL A
#_03C036: TAY

#_03C037: ASL A
#_03C038: TAX

#_03C039: JSR GetNextTextByte

#_03C03C: RTS

;===================================================================================================

TextCommand_TryToTake1000Money:
#_03C03D: REP #$30

#_03C03F: LDA.w $0405
#_03C042: SEC
#_03C043: SBC.w #$03E8
#_03C046: STA.w $0405

#_03C049: LDA.w $0407
#_03C04C: SBC.w #$0000
#_03C04F: STA.w $0407
#_03C052: BMI .not_enough_money

#_03C054: INC.w $07E0

#_03C057: JSL routine0F945E
#_03C05B: JSR GetNextTextByte

#_03C05E: RTS

.not_enough_money
#_03C05F: LDA.w $0405
#_03C062: CLC
#_03C063: ADC.w #$03E8
#_03C066: STA.w $0405

#_03C069: LDA.w $0407
#_03C06C: ADC.w #$0000
#_03C06F: STA.w $0407

#_03C072: JSR GetNextTextByte
#_03C075: JSR ChangeMessageID

#_03C078: RTS

;===================================================================================================

TextExtCMD_49:
#_03C079: SEP #$30

#_03C07B: LDA.w $07E0
#_03C07E: CMP.b #$0A
#_03C080: BCS .change_message

#_03C082: JSR GetNextTextByte

#_03C085: RTS

.change_message
#_03C086: JSR GetNextTextByte
#_03C089: JSR ChangeMessageID

#_03C08C: RTS

;===================================================================================================

TextExtCMD_4A:
#_03C08D: SEP #$20
#_03C08F: INC.w $0A3D

#_03C092: REP #$20

#_03C094: LDA.w $0A22
#_03C097: PHA
#_03C098: LDA.w $0A24
#_03C09B: PHA
#_03C09C: LDA.w $0A26
#_03C09F: PHA

#_03C0A0: JSR GetNextTextByte
#_03C0A3: AND.w #$00FF
#_03C0A6: STA.w $0A22
#_03C0A9: BNE .branch03C0AE

#_03C0AB: JSR routine03C102

;---------------------------------------------------------------------------------------------------

.branch03C0AE
#_03C0AE: LDA.w $00C2
#_03C0B1: PHA

#_03C0B2: LDA.w $00C0
#_03C0B5: PHA

#_03C0B6: LDA.w $0C41
#_03C0B9: AND.w #$00FF
#_03C0BC: ASL A
#_03C0BD: ASL A
#_03C0BE: ASL A
#_03C0BF: CLC
#_03C0C0: ADC.w $0A22
#_03C0C3: STA.w $0A22

#_03C0C6: LDA.w #$0005
#_03C0C9: STA.w $0A24
#_03C0CC: STZ.w $0A26

#_03C0CF: JSR SetTextPointerFromMessageID
#_03C0D2: JSL routine03834C

#_03C0D6: REP #$20

#_03C0D8: PLA
#_03C0D9: STA.w $00C0

#_03C0DC: PLA
#_03C0DD: STA.w $00C2

;---------------------------------------------------------------------------------------------------

#_03C0E0: PLA
#_03C0E1: STA.w $0A26

#_03C0E4: PLA
#_03C0E5: STA.w $0A24

#_03C0E8: PLA
#_03C0E9: STA.w $0A22

#_03C0EC: SEP #$20

#_03C0EE: DEC.w $0A3D

#_03C0F1: RTS

;===================================================================================================

routine03C0F2:
#_03C0F2: PHP
#_03C0F3: REP #$30

#_03C0F5: PHY

#_03C0F6: TYA
#_03C0F7: AND.w #$00FF
#_03C0FA: ASL A
#_03C0FB: TAY

#_03C0FC: LDX.w PartyIDtoOffset,Y

#_03C0FF: PLY
#_03C100: BRA .loop

;===================================================================================================

#routine03C102:
#_03C102: PHP
#_03C103: REP #$30

#_03C105: LDY.w #$0000
#_03C108: LDX.w #$0000

.loop
#_03C10B: LDA.w $1000,X
#_03C10E: AND.w #$C000
#_03C111: BEQ .skip_party_member

#_03C113: LDA.w $1002,X
#_03C116: AND.w #$E000
#_03C119: BEQ .not_dead_or_stoned

.skip_party_member
#_03C11B: INY

#_03C11C: TXA
#_03C11D: CLC
#_03C11E: ADC.w #$0060
#_03C121: TAX

#_03C122: CPX.w #$0180
#_03C125: BNE .loop

;---------------------------------------------------------------------------------------------------

#_03C127: LDY.w #$FFFF

.not_dead_or_stoned
#_03C12A: STY.w $0C43

#_03C12D: TYA
#_03C12E: ORA.w #$8000
#_03C131: STA.w $0A3E

#_03C134: PLP
#_03C135: RTS

;===================================================================================================

TextExtCMD_4B:
#_03C136: REP #$30

#_03C138: LDA.w #$0007
#_03C13B: STA.w $0E00

#_03C13E: JSR routine0392C1

#_03C141: LDA.w $0A1A
#_03C144: CLC
#_03C145: ADC.w #$0041
#_03C148: STA.w $0980

#_03C14B: LDA.w $0C41
#_03C14E: AND.w #$00FF
#_03C151: STA.w $0E00

#_03C154: ASL A
#_03C155: CLC
#_03C156: ADC.w $0E00
#_03C159: TAY

;---------------------------------------------------------------------------------------------------

#_03C15A: LDX.w #$0000

.next_drink
#_03C15D: JSR routine03E6DF

#_03C160: LDA.w data03C318,Y
#_03C163: AND.w #$00FF
#_03C166: STA.w $0A39
#_03C169: STA.w $0BE5,X

#_03C16C: STZ.w $0A33

#_03C16F: PHX
#_03C170: PHY

#_03C171: TAY

#_03C172: LDA.w data03C336,Y
#_03C175: AND.w #$00FF
#_03C178: ASL A
#_03C179: STA.w $0E00

#_03C17C: ASL A
#_03C17D: ASL A
#_03C17E: CLC
#_03C17F: ADC.w $0E00
#_03C182: STA.w $0A14
#_03C185: STZ.w $0A16

#_03C188: PHP

#_03C189: LDA.w #DrinkNamePointers
#_03C18C: STA.w $00C3

#_03C18F: SEP #$20

#_03C191: LDA.b #DrinkNamePointers>>16
#_03C193: STA.w $00C5

#_03C196: JSR WriteIndexedEntityName

#_03C199: REP #$20

#_03C19B: LDA.w #$001E
#_03C19E: STA.w $0A33

#_03C1A1: JSR routine038D1C
#_03C1A4: JSR TextExtCMD_36
#_03C1A7: JSR routine0384F9
#_03C1AA: JSL RunFramesUntilDrawBufferEmpties

#_03C1AE: PLP

#_03C1AF: PLY
#_03C1B0: PLX

#_03C1B1: LDA.w $0980
#_03C1B4: CLC
#_03C1B5: ADC.w #$0040
#_03C1B8: STA.w $0980

#_03C1BB: INY

#_03C1BC: INX
#_03C1BD: CPX.w #$0003
#_03C1C0: BNE .next_drink

;---------------------------------------------------------------------------------------------------

#_03C1C2: SEP #$20

#_03C1C4: STZ.w $0A58

#_03C1C7: LDA.b #$04
#_03C1C9: STA.w $09F4

#_03C1CC: STZ.w $09F0

#_03C1CF: STZ.w $09F2
#_03C1D2: STZ.w $09F3

#_03C1D5: LDA.b #$02
#_03C1D7: STA.w $09F1

#_03C1DA: JSL routine02C8E9
#_03C1DE: JSR routine03E6DF

#_03C1E1: STZ.w $0A33

#_03C1E4: SEP #$20

#_03C1E6: LDA.w $0A58
#_03C1E9: BMI .branch03C1F5

#_03C1EB: LDA.w $09F3
#_03C1EE: STA.w $0C42

#_03C1F1: JSR GetNextTextByte

#_03C1F4: RTS

;---------------------------------------------------------------------------------------------------

.branch03C1F5
#_03C1F5: JSR GetNextTextByte
#_03C1F8: JSR ChangeMessageID

#_03C1FB: RTS

;===================================================================================================

; TODO something with healing
TextExtCMD_4C:
#_03C1FC: REP #$30
#_03C1FE: JSR GetNextTextByte
#_03C201: AND.w #$00FF
#_03C204: STA.w $0E00
#_03C207: LDA.w $0C42
#_03C20A: AND.w #$00FF
#_03C20D: TAY
#_03C20E: LDA.w $0BE5,Y
#_03C211: AND.w #$00FF
#_03C214: TAX
#_03C215: LDA.w data03C336,X
#_03C218: AND.w #$00FF
#_03C21B: ASL A
#_03C21C: STA.w $0E02
#_03C21F: ASL A
#_03C220: ASL A
#_03C221: CLC
#_03C222: ADC.w $0E02
#_03C225: STA.w $0A14
#_03C228: STZ.w $0A16
#_03C22B: LDA.w $0405
#_03C22E: SEC
#_03C22F: SBC.w $0A14
#_03C232: STA.w $0405
#_03C235: LDA.w $0407
#_03C238: SBC.w $0A16
#_03C23B: BCC .branch03C281

#_03C23D: STA.w $0407
#_03C240: JSL ClampMoneyAndMAG
#_03C244: JSL WriteMoneyToHUD
#_03C248: LDA.w $0C43
#_03C24B: AND.w #$00FF
#_03C24E: ASL A
#_03C24F: TAY
#_03C250: LDX.w PartyIDtoOffset,Y
#_03C253: LDA.w $0C42
#_03C256: BEQ .branch03C26D

#_03C258: CMP.w #$0001
#_03C25B: BEQ .branch03C277

#_03C25D: LDY.w #$0014
#_03C260: JSR HealPercetageOfHP

#_03C263: LDY.w #$0014
#_03C266: JSR HealPercetageOfMP
#_03C269: JSR routine00A17E_bounce
#_03C26C: RTS

.branch03C26D
#_03C26D: LDY.w #$000A
#_03C270: JSR HealPercetageOfHP
#_03C273: JSR routine00A17E_bounce
#_03C276: RTS

.branch03C277
#_03C277: LDY.w #$000A
#_03C27A: JSR HealPercetageOfMP
#_03C27D: JSR routine00A17E_bounce
#_03C280: RTS

.branch03C281
#_03C281: LDA.w $0405
#_03C284: CLC
#_03C285: ADC.w $0A14
#_03C288: STA.w $0405
#_03C28B: LDA.w $0E00
#_03C28E: JSR ChangeMessageID
#_03C291: RTS

;===================================================================================================

HealPercetageOfHP:
#_03C292: PHX

#_03C293: LDA.w $1030,X
#_03C296: LDX.w #$0000
#_03C299: JSL DivisionBig_XA_by_Y

#_03C29D: PLX

#_03C29E: LDA.w $0E80
#_03C2A1: CLC
#_03C2A2: ADC.w $102E,X
#_03C2A5: CMP.w $1030,X
#_03C2A8: BCC .no_overflow

#_03C2AA: LDA.w $1030,X

.no_overflow
#_03C2AD: STA.w $102E,X

#_03C2B0: RTS

;===================================================================================================

HealPercetageOfMP:
#_03C2B1: PHX

#_03C2B2: LDA.w $1034,X
#_03C2B5: LDX.w #$0000
#_03C2B8: JSL DivisionBig_XA_by_Y

#_03C2BC: PLX

#_03C2BD: LDA.w $0E80
#_03C2C0: CLC
#_03C2C1: ADC.w $1032,X
#_03C2C4: CMP.w $1034,X
#_03C2C7: BCC .no_overflow

#_03C2C9: LDA.w $1034,X

.no_overflow
#_03C2CC: STA.w $1032,X

#_03C2CF: RTS

;===================================================================================================

TextExtCMD_4D:
#_03C2D0: SEP #$20

#_03C2D2: LDA.b #DrinkNamePointers>>16
#_03C2D4: STA.w $00C5

#_03C2D7: REP #$30

#_03C2D9: LDA.w $0C42
#_03C2DC: AND.w #$00FF
#_03C2DF: TAY

#_03C2E0: LDA.w $0BE5,Y
#_03C2E3: AND.w #$00FF
#_03C2E6: STA.w $0A39

#_03C2E9: LDA.w #DrinkNamePointers
#_03C2EC: STA.w $00C3

#_03C2EF: JSR WriteIndexedEntityName

#_03C2F2: RTS

;===================================================================================================

TextExtCMD_4E:
#_03C2F3: REP #$30

#_03C2F5: JSR GetNextTextByte
#_03C2F8: STA.w $0E00

#_03C2FB: LDA.w $0C43
#_03C2FE: AND.w #$00FF
#_03C301: TAY

#_03C302: INY
#_03C303: CPY.w #$0004
#_03C306: BEQ .change_message

#_03C308: JSR routine03C0F2

#_03C30B: LDA.w $0C43
#_03C30E: BMI .change_message

#_03C310: RTS

.change_message
#_03C311: LDA.w $0E00
#_03C314: JSR ChangeMessageID

#_03C317: RTS

;===================================================================================================

data03C318:
#_03C318: db $00,$01,$02,$03,$04,$05,$03,$04
#_03C320: db $05,$03,$04,$05,$03,$04,$05,$06
#_03C328: db $07,$08,$06,$07,$08,$06,$07,$08
#_03C330: db $06,$07,$08,$06,$07,$08

data03C336:
#_03C336: db $28,$32,$3C,$46,$4B,$50,$0C,$0F
#_03C33E: db $12

;===================================================================================================

TextExtCMD_4F:
#_03C33F: JSL routine0F945E

#_03C343: REP #$20
#_03C345: LDA.w #$0007
#_03C348: STA.w $0E00
#_03C34B: JSR routine0392C1

#_03C34E: SEP #$20
#_03C350: INC.w $0A3D

#_03C353: REP #$30
#_03C355: JSR GetNextTextByte
#_03C358: AND.w #$00FF
#_03C35B: STA.w $0C41
#_03C35E: LDA.w $0A22
#_03C361: PHA
#_03C362: LDA.w $0A24
#_03C365: PHA
#_03C366: LDA.w $0A26
#_03C369: PHA
#_03C36A: LDA.w $00C2
#_03C36D: PHA
#_03C36E: LDA.w $00C0
#_03C371: PHA
#_03C372: STZ.w $0A22
#_03C375: STZ.w $0A26
#_03C378: LDA.w #$0004
#_03C37B: STA.w $0A24
#_03C37E: JSR SetTextPointerFromMessageID
#_03C381: JSL routine03834C

#_03C385: REP #$20
#_03C387: PLA
#_03C388: STA.w $00C0
#_03C38B: PLA
#_03C38C: STA.w $00C2
#_03C38F: PLA
#_03C390: STA.w $0A26
#_03C393: PLA
#_03C394: STA.w $0A24
#_03C397: PLA
#_03C398: STA.w $0A22

#_03C39B: SEP #$20
#_03C39D: DEC.w $0A3D
#_03C3A0: RTS

;===================================================================================================

TextExtCMD_52:
#_03C3A1: REP #$30
#_03C3A3: LDA.w #$0900
#_03C3A6: STA.w $0E00
#_03C3A9: JSR GetNextTextByte
#_03C3AC: AND.w #$00FF
#_03C3AF: BNE .branch03C3C1

#_03C3B1: LDA.w $0524
#_03C3B4: BEQ .branch03C3C6

#_03C3B6: LDX.w #$0600
#_03C3B9: LDA.w #$0780
#_03C3BC: STA.w $0E00
#_03C3BF: BRA .branch03C3C9

.branch03C3C1
#_03C3C1: LDX.w #$0780
#_03C3C4: BRA .branch03C3C9

.branch03C3C6
#_03C3C6: LDX.w #$0600

.branch03C3C9
#_03C3C9: LDA.w $1000,X
#_03C3CC: AND.w #$8000
#_03C3CF: BNE .branch03C3E3

#_03C3D1: TXA
#_03C3D2: CLC
#_03C3D3: ADC.w #$0060
#_03C3D6: TAX
#_03C3D7: CMP.w $0E00
#_03C3DA: BNE .branch03C3C9

#_03C3DC: JSR GetNextTextByte
#_03C3DF: JSR ChangeMessageID
#_03C3E2: RTS

.branch03C3E3
#_03C3E3: JSR GetNextTextByte
#_03C3E6: RTS

;===================================================================================================

TextExtCMD_53:
#_03C3E7: REP #$30

#_03C3E9: LDA.w $0405
#_03C3EC: SEC
#_03C3ED: SBC.w $0A14
#_03C3F0: STA.w $0405

#_03C3F3: LDA.w $0407
#_03C3F6: SBC.w $0A16
#_03C3F9: STA.w $0407

#_03C3FC: JSL ClampMoneyAndMAG

#_03C400: JSL WriteMoneyToHUD
#_03C404: JSL WriteMAGToHUD

#_03C408: RTS

;===================================================================================================

TextExtCMD_55:
#_03C409: REP #$30

#_03C40B: LDA.w $0405
#_03C40E: CLC
#_03C40F: ADC.w $0A14
#_03C412: STA.w $0405

#_03C415: LDA.w $0407
#_03C418: ADC.w $0A16
#_03C41B: STA.w $0407

#_03C41E: JSL ClampMoneyAndMAG

#_03C422: JSL WriteMoneyToHUD
#_03C426: JSL WriteMAGToHUD

#_03C42A: RTS

;===================================================================================================

TextExtCMD_56:
#_03C42B: JSL routine0FA412
#_03C42F: RTS

;===================================================================================================

TextExtCMD_57:
#_03C430: JSL routine0F9C77
#_03C434: RTS

;===================================================================================================

TextExtCMD_5E:
#_03C435: JSL routine029E97
#_03C439: RTS

;===================================================================================================

TextExtCMD_60:
#_03C43A: JSL routine029FCC
#_03C43E: RTS

;===================================================================================================

TextExtCMD_5F:
#_03C43F: REP #$30
#_03C441: STZ.w $0E00
#_03C444: STZ.w $0E02
#_03C447: LDX.w #$0180

.branch03C44A
#_03C44A: LDA.w $1000,X
#_03C44D: BPL .branch03C45A

#_03C44F: LDA.w $100A,X
#_03C452: CMP.w $0E00
#_03C455: BCC .branch03C45A

#_03C457: STA.w $0E00

.branch03C45A
#_03C45A: TXA
#_03C45B: CLC
#_03C45C: ADC.w #$0060
#_03C45F: TAX
#_03C460: CMP.w #$0600
#_03C463: BNE .branch03C44A

#_03C465: INC.w $0E00
#_03C468: LDA.w #$00FF
#_03C46B: STA.w $0E02
#_03C46E: LDX.w #$0000
#_03C471: LDY.w #$0000

.branch03C474
#_03C474: LDA.l DemonStats,X
#_03C478: AND.w #$00FF
#_03C47B: CMP.w $0E00
#_03C47E: BCC .branch03C48B

#_03C480: CMP.w $0E02
#_03C483: BCS .branch03C48B

#_03C485: STA.w $0E02
#_03C488: STY.w $0E04

.branch03C48B
#_03C48B: INY
#_03C48C: TXA
#_03C48D: CLC
#_03C48E: ADC.w #$0018
#_03C491: TAX
#_03C492: CMP.w #$17E8
#_03C495: BNE .branch03C474

#_03C497: LDA.w $0E04
#_03C49A: STA.w $050A
#_03C49D: STA.w $0C0B
#_03C4A0: STA.w $0BED
#_03C4A3: JSR routine03EFCB
#_03C4A6: BCS .branch03C4C1

#_03C4A8: LDA.w #$0000
#_03C4AB: JSR GetDemonXClass
#_03C4AE: LDA.w $0BF3
#_03C4B1: STA.w $0506
#_03C4B4: LDA.w #$0001
#_03C4B7: STA.w $050E
#_03C4BA: STZ.w $0524
#_03C4BD: JSR GetNextTextByte
#_03C4C0: RTS

.branch03C4C1
#_03C4C1: JSR GetNextTextByte
#_03C4C4: JSR ChangeMessageID
#_03C4C7: RTS

;===================================================================================================

routine03C4C8:
#_03C4C8: PHP
#_03C4C9: SEP #$30
#_03C4CB: LDX.b #$00
#_03C4CD: TXY

.branch03C4CE
#_03C4CE: LDA.w $0780,X
#_03C4D1: CMP.b #$E4
#_03C4D3: BCC .branch03C4DA

#_03C4D5: CMP.b #$F0
#_03C4D7: BCS .branch03C4DA

#_03C4D9: INY

.branch03C4DA
#_03C4DA: INX
#_03C4DB: INX
#_03C4DC: CPX.b #$3C
#_03C4DE: BNE .branch03C4CE

#_03C4E0: PLP
#_03C4E1: RTS

;===================================================================================================

TextExtCMD_58:
#_03C4E2: PHP

#_03C4E3: SEP #$30

#_03C4E5: JSR GetNextTextByte
#_03C4E8: STA.w $0E00

#_03C4EB: JSR routine03C4C8
#_03C4EE: CPY.w $0E00
#_03C4F1: BCS .branch03C4FB

#_03C4F3: JSR GetNextTextByte
#_03C4F6: JSR ChangeMessageID

#_03C4F9: PLP
#_03C4FA: RTS

.branch03C4FB
#_03C4FB: JSR GetNextTextByte

#_03C4FE: PLP
#_03C4FF: RTS

;===================================================================================================

TextCommand_TradeGemForItem:
#_03C500: PHP
#_03C501: SEP #$30

#_03C503: LDA.w $0C39
#_03C506: PHA

#_03C507: STA.w $0A50
#_03C50A: STZ.w $0A51
#_03C50D: JSR TakeItemFromSomewhere

#_03C510: PLA
#_03C511: SEC
#_03C512: SBC.b #$E4
#_03C514: TAX

#_03C515: LDA.w RagsGemToItemTrades,X
#_03C518: STA.w $0A50
#_03C51B: STZ.w $0A51
#_03C51E: JSR AddItemToInventory

#_03C521: PLP
#_03C522: RTS

;---------------------------------------------------------------------------------------------------

RagsGemToItemTrades:
#_03C523: db $CB ; Garnet     => Mahazio stone
#_03C524: db $DF ; Amethyst   => Fuma bell
#_03C525: db $D4 ; Aquamarine => Angel hair
#_03C526: db $BB ; Diamond    => Soul incense
#_03C527: db $E0 ; Emerald    => Core shield
#_03C528: db $B9 ; Pearl      => Soma
#_03C529: db $E1 ; Ruby       => Gushing jar
#_03C52A: db $C9 ; Onyx       => Maha-agi stone
#_03C52B: db $D6 ; Sapphire   => Pentagram
#_03C52C: db $DE ; Opal       => Talisaman
#_03C52D: db $D5 ; Topaz      => Asura hand
#_03C52E: db $BC ; Turquoise  => Magic bottle

;===================================================================================================

TextCommand_Take3Items:
#_03C52F: SEP #$30

#_03C531: LDA.w $0C39
#_03C534: STA.w $0A50
#_03C537: STZ.w $0A51
#_03C53A: JSR TakeItemFromSomewhere

#_03C53D: LDA.w $0C3B
#_03C540: STA.w $0A50
#_03C543: STZ.w $0A51
#_03C546: JSR TakeItemFromSomewhere

#_03C549: LDA.w $0C3D
#_03C54C: STA.w $0A50
#_03C54F: STZ.w $0A51
#_03C552: JSR TakeItemFromSomewhere

#_03C555: RTS

;===================================================================================================

TextExtCMD_5B:
#_03C556: PHP
#_03C557: SEP #$30
#_03C559: JSL routine0FA2B4
#_03C55D: LDA.w $050A
#_03C560: CMP.b #$FF
#_03C562: BEQ .branch03C569

#_03C564: JSR GetNextTextByte
#_03C567: PLP
#_03C568: RTS

.branch03C569
#_03C569: JSR GetNextTextByte
#_03C56C: JSR ChangeMessageID
#_03C56F: PLP
#_03C570: RTS

;===================================================================================================

TextExtCMD_5C:
#_03C571: JSL routine0FA25E
#_03C575: RTS

;===================================================================================================

TextExtCMD_61:
#_03C576: JSL routine0FA3BD
#_03C57A: RTS

;===================================================================================================

TextExtCMD_62:
#_03C57B: JSL routine0FA371
#_03C57F: RTS

;===================================================================================================

TextExtCMD_63:
#_03C580: JSL routine0FA14D
#_03C584: RTS

;===================================================================================================

TextExtCMD_64:
#_03C585: JSL routine0F9D99
#_03C589: RTS

;===================================================================================================

TextExtCMD_65:
#_03C58A: JSL routine029FCC_lite
#_03C58E: RTS

;===================================================================================================

TextExtCMD_66:
#_03C58F: SEP #$30

#_03C591: LDA.b #$A7 ; ᴍ
#_03C593: JSL WriteSingleTileToMessageBuffer

#_03C597: LDA.b #$A8 ; ᴀɢ
#_03C599: JSL WriteSingleTileToMessageBuffer

#_03C59D: RTS

;===================================================================================================

TextExtCMD_67:
#_03C59E: JSL CheckInventoryForCoolSwordOrVase
#_03C5A2: RTS

;===================================================================================================

TextExtCMD_68:
#_03C5A3: JSL routine0F90C6
#_03C5A7: RTS

;===================================================================================================

TextExtCMD_69:
#_03C5A8: JSL routine0F90EB
#_03C5AC: RTS

;===================================================================================================

TextExtCMD_6A:
#_03C5AD: JSL routine0FAEF9
#_03C5B1: RTS

;===================================================================================================

TextExtCMD_6B:
#_03C5B2: JSL routine0F9D65
#_03C5B6: RTS

;===================================================================================================

TextExtCMD_6C:
#_03C5B7: JSL routine0F903F
#_03C5BB: RTS

;===================================================================================================

TextExtCMD_6D:
#_03C5BC: JSL routine0F8FA1
#_03C5C0: RTS

;===================================================================================================

TextExtCMD_6E:
#_03C5C1: JSL routine0F8FCF
#_03C5C5: RTS

;===================================================================================================

TextExtCMD_6F:
#_03C5C6: JSL routine0FA333
#_03C5CA: RTS

;===================================================================================================

TextExtCMD_70:
#_03C5CB: JSL routine0FA346
#_03C5CF: RTS

;===================================================================================================

TextExtCMD_71:
#_03C5D0: JSL routine0380FA
#_03C5D4: RTS

;===================================================================================================

TextExtCMD_72:
#_03C5D5: JSL routine0F916F
#_03C5D9: RTS

;===================================================================================================

TextExtCMD_73:
#_03C5DA: JSL routine0F9833
#_03C5DE: RTS

;===================================================================================================

TextExtCMD_75:
#_03C5DF: JSL routine0FA470
#_03C5E3: RTS

;===================================================================================================

TextCommand_30:
#_03C5E4: SEP #$30
#_03C5E6: LDA.b #$E3
#_03C5E8: JSL ClearGameProgressBit_long

#_03C5EC: REP #$10
#_03C5EE: STZ.w $0A18
#_03C5F1: JSL routine0F945E
#_03C5F5: JSR GetNextTextByte
#_03C5F8: STA.w $0E00

#_03C5FB: REP #$20
#_03C5FD: LDX.w $0526
#_03C600: LDA.w $1004,X
#_03C603: CMP.w #$0100
#_03C606: BCS .branch03C614

#_03C608: SEP #$20
#_03C60A: LDX.w $0526
#_03C60D: LDA.w $1006,X
#_03C610: CMP.b #$0B
#_03C612: BCS .branch03C61B

.branch03C614
#_03C614: LDA.w $0E00
#_03C617: JSR ChangeMessageID
#_03C61A: RTS

.branch03C61B
#_03C61B: LDX.w $0526
#_03C61E: LDA.w $100A
#_03C621: CMP.w $100A,X
#_03C624: BCC .branch03C630

#_03C626: LDX.w $0526
#_03C629: JSL routine0F8582
#_03C62D: BCS .branch03C630

#_03C62F: RTS

.branch03C630
#_03C630: LDA.w $0A4A
#_03C633: AND.b #$F0
#_03C635: CMP.b #$50
#_03C637: BCC .branch03C63A

#_03C639: RTS

.branch03C63A
#_03C63A: LDA.w $0A4A
#_03C63D: CLC
#_03C63E: ADC.b #$50
#_03C640: STA.w $0A4A
#_03C643: RTS

;===================================================================================================

TextCommand_31:
#_03C644: SEP #$30

#_03C646: JSR GetNextTextByte
#_03C649: STA.w $0E00

#_03C64C: JSR GetNextTextByte
#_03C64F: STA.w $0E02

#_03C652: LDA.w $040F
#_03C655: AND.b #$F0
#_03C657: CMP.b #$80
#_03C659: BNE .branch03C662

#_03C65B: LDA.w $0E00
#_03C65E: JSR ChangeMessageID
#_03C661: RTS

.branch03C662
#_03C662: REP #$30
#_03C664: LDX.w $0526
#_03C667: LDA.w $1004,X
#_03C66A: STA.w $0E00
#_03C66D: LDX.w #$0180

.branch03C670
#_03C670: LDA.w $1000,X
#_03C673: BPL .branch03C67D

#_03C675: LDA.w $1004,X
#_03C678: CMP.w $0E00
#_03C67B: BEQ routine03C689

.branch03C67D
#_03C67D: TXA
#_03C67E: CLC
#_03C67F: ADC.w #$0060
#_03C682: TAX
#_03C683: CMP.w #$0600
#_03C686: BNE .branch03C670
#_03C688: RTS

;===================================================================================================

routine03C689:
#_03C689: LDA.w $0E02
#_03C68C: JSR ChangeMessageID
#_03C68F: LDA.w #$199A
#_03C692: JSL routine0F9C48
#_03C696: RTS

TextCommand_32:
#_03C697: JMP TextExtCMD_09

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine03C69A:
#_03C69A: JMP TextExtCMD_08

;===================================================================================================

TextCommand_34:
#_03C69D: SEP #$30

#_03C69F: JSR GetNextTextByte
#_03C6A2: TAY

#_03C6A3: LDA.w data03C6C0,Y
#_03C6A6: STA.w $0E00

#_03C6A9: JSL GetRandomInt

#_03C6AD: LDA.w $0ED5
#_03C6B0: CMP.w $0E00
#_03C6B3: BCS .branch03C6BC

#_03C6B5: JSR GetNextTextByte
#_03C6B8: JSR ChangeMessageID
#_03C6BB: RTS

.branch03C6BC
#_03C6BC: JSR GetNextTextByte
#_03C6BF: RTS

data03C6C0:
#_03C6C0: db $80,$40,$20,$10,$08,$04

;===================================================================================================

TextCommand_35:
#_03C6C6: REP #$30

#_03C6C8: LDX.w $0526
#_03C6CB: LDA.w $100A,X
#_03C6CE: STA.w $0E00

#_03C6D1: JSR GetNextTextByte
#_03C6D4: AND.w #$00FF
#_03C6D7: STA.w $0E02

#_03C6DA: LDA.w $0E02
#_03C6DD: BEQ .branch03C712

#_03C6DF: CMP.w #$0001
#_03C6E2: BEQ .branch03C712

#_03C6E4: CMP.w #$0002
#_03C6E7: BEQ .branch03C6F0

#_03C6E9: CMP.w #$0003
#_03C6EC: BEQ .branch03C726
#_03C6EE: BRA .branch03C733

.branch03C6F0
#_03C6F0: LDA.w $0E00
#_03C6F3: ASL A
#_03C6F4: CLC
#_03C6F5: ADC.w #$0004
#_03C6F8: STA.w $0E00
#_03C6FB: BRA .branch03C712

; TODO POSSIBLY UNUSED BRANCH
.branch03C6FD
#_03C6FD: JSL GetRandomInt
#_03C701: LDA.w $0ED5
#_03C704: AND.w #$0007
#_03C707: CLC
#_03C708: ADC.w $0E00
#_03C70B: CLC
#_03C70C: ADC.w #$0005
#_03C70F: STA.w $0E00

.branch03C712
#_03C712: LDA.w $0E00
#_03C715: DEC A
#_03C716: CMP.w $100A
#_03C719: BCS .branch03C71F

.branch03C71B
#_03C71B: JSR GetNextTextByte
#_03C71E: RTS

.branch03C71F
#_03C71F: JSR GetNextTextByte
#_03C722: JSR ChangeMessageID
#_03C725: RTS

.branch03C726
#_03C726: LDA.w $1006,X
#_03C729: AND.w #$00FF
#_03C72C: CMP.w #$0015
#_03C72F: BNE .branch03C71B

#_03C731: BRA .branch03C71F

.branch03C733
#_03C733: LDA.w $1004,X
#_03C736: STA.w $0E00
#_03C739: LDX.w #$0000

.branch03C73C
#_03C73C: LDA.w data03C74F,X
#_03C73F: CMP.w #$FFFF
#_03C742: BEQ .branch03C71B

#_03C744: AND.w #$00FF
#_03C747: CMP.w $0E00
#_03C74A: BEQ .branch03C71F

#_03C74C: INX
#_03C74D: BRA .branch03C73C

data03C74F:
#_03C74F: dw $B0AF,$B2B1,$B4B3,$B6B5
#_03C757: dw $B8B7,$F8F7,$FFFF

;===================================================================================================

TextCommand_36:
#_03C75D: REP #$30
#_03C75F: LDX.w $0526
#_03C762: LDA.w $1012,X
#_03C765: STA.w $0E00
#_03C768: JSR GetNextTextByte
#_03C76B: AND.w #$00FF
#_03C76E: TAY
#_03C76F: LDA.w TextCommand_SmallMasks,Y
#_03C772: AND.w #$00FF
#_03C775: STA.w $0E02
#_03C778: JSL GetRandomInt
#_03C77C: LDA.w $0ED5
#_03C77F: AND.w $0E02
#_03C782: CLC
#_03C783: ADC.w $0E00
#_03C786: STA.w $0E00
#_03C789: LDA.w $1012
#_03C78C: CMP.w $0E00
#_03C78F: BCC .branch033C95

#_03C791: JSR GetNextTextByte
#_03C794: RTS

.branch033C95
#_03C795: JSR GetNextTextByte
#_03C798: JSR ChangeMessageID
#_03C79B: RTS

;===================================================================================================

TextCommand_37:
#_03C79C: REP #$30

#_03C79E: JSR GetNextTextByte
#_03C7A1: AND.w #$00FF
#_03C7A4: TAY

#_03C7A5: LDA.w .masks,Y
#_03C7A8: AND.w #$00FF
#_03C7AB: STA.w $0E00

#_03C7AE: JSL GetRandomInt

#_03C7B2: LDA.w $0ED5
#_03C7B5: AND.w $0E00
#_03C7B8: STA.w $0E00

#_03C7BB: LDA.w $101A
#_03C7BE: CMP.w $0E00
#_03C7C1: BCC .change_message

#_03C7C3: JSR GetNextTextByte

#_03C7C6: RTS

.change_message
#_03C7C7: JSR GetNextTextByte
#_03C7CA: JSR ChangeMessageID

#_03C7CD: RTS

.masks
#_03C7CE: db $0F, $1F, $3F

;===================================================================================================

TextCommand_38:
#_03C7D1: REP #$30

#_03C7D3: LDX.w $0526

#_03C7D6: LDA.w $1014,X
#_03C7D9: STA.w $0E00

#_03C7DC: JSR GetNextTextByte
#_03C7DF: AND.w #$00FF
#_03C7E2: TAY

#_03C7E3: LDA.w TextCommand_SmallMasks,Y
#_03C7E6: AND.w #$00FF
#_03C7E9: STA.w $0E02

#_03C7EC: JSL GetRandomInt
#_03C7F0: LDA.w $0ED5
#_03C7F3: AND.w $0E02
#_03C7F6: CLC
#_03C7F7: ADC.w $0E00
#_03C7FA: STA.w $0E00

#_03C7FD: LDA.w $1014
#_03C800: CMP.w $0E00
#_03C803: BCC .change_message

#_03C805: JSR GetNextTextByte

#_03C808: RTS

.change_message
#_03C809: JSR GetNextTextByte
#_03C80C: JSR ChangeMessageID

#_03C80F: RTS

;===================================================================================================

TextCommand_SmallMasks:
#_03C810: db $07, $0F, $1F

;===================================================================================================

TextCommand_39:
#_03C813: REP #$30

#_03C815: LDA.w $1010
#_03C818: CLC
#_03C819: ADC.w $1036
#_03C81C: STA.w $0E00

#_03C81F: JSL GetRandomInt

#_03C823: LDA.w $0ED5
#_03C826: AND.w #$001F
#_03C829: CLC
#_03C82A: ADC.w #$0008
#_03C82D: INC A
#_03C82E: CMP.w $0E00
#_03C831: BCS .change_message

#_03C833: JSR GetNextTextByte

#_03C836: RTS

.change_message
#_03C837: JSR GetNextTextByte
#_03C83A: JSR ChangeMessageID

#_03C83D: RTS

;===================================================================================================

TextCommand_3B:
#_03C83E: REP #$30

#_03C840: JSR GetNextTextByte
#_03C843: AND.w #$00FF
#_03C846: STA.w $0E00

#_03C849: LDA.w $0E00
#_03C84C: BEQ .branch03C879

#_03C84E: CMP.w #$0001
#_03C851: BEQ .branch03C866

#_03C853: JSL GetRandomInt
#_03C857: LDA.w $0ED5
#_03C85A: AND.w #$0007
#_03C85D: CLC
#_03C85E: ADC.w #$000E
#_03C861: STA.w $0E00
#_03C864: BRA .branch03C88A

.branch03C866
#_03C866: JSL GetRandomInt
#_03C86A: LDA.w $0ED5
#_03C86D: AND.w #$0003
#_03C870: CLC
#_03C871: ADC.w #$000A
#_03C874: STA.w $0E00
#_03C877: BRA .branch03C88A

.branch03C879
#_03C879: JSL GetRandomInt
#_03C87D: LDA.w $0ED5
#_03C880: AND.w #$0003
#_03C883: CLC
#_03C884: ADC.w #$0006
#_03C887: STA.w $0E00

.branch03C88A
#_03C88A: DEC A
#_03C88B: CMP.w $0A40
#_03C88E: BCS .change_message

#_03C890: JSR GetNextTextByte
#_03C893: RTS

.change_message
#_03C894: JSR GetNextTextByte
#_03C897: JSR ChangeMessageID

#_03C89A: RTS

;===================================================================================================

TextCommand_3C:
#_03C89B: REP #$30
#_03C89D: JSR GetNextTextByte
#_03C8A0: AND.w #$00FF
#_03C8A3: STA.w $0E00
#_03C8A6: LDA.w $0E00
#_03C8A9: BEQ .branch03C8D6

#_03C8AB: CMP.w #$0001
#_03C8AE: BEQ .branch03C8C3

#_03C8B0: JSL GetRandomInt
#_03C8B4: LDA.w $0ED5
#_03C8B7: AND.w #$0007
#_03C8BA: CLC
#_03C8BB: ADC.w #$000F
#_03C8BE: STA.w $0E00
#_03C8C1: BRA .branch03C8E7

.branch03C8C3
#_03C8C3: JSL GetRandomInt
#_03C8C7: LDA.w $0ED5
#_03C8CA: AND.w #$0003
#_03C8CD: CLC
#_03C8CE: ADC.w #$000C
#_03C8D1: STA.w $0E00
#_03C8D4: BRA .branch03C8E7

.branch03C8D6
#_03C8D6: JSL GetRandomInt
#_03C8DA: LDA.w $0ED5
#_03C8DD: AND.w #$0003
#_03C8E0: CLC
#_03C8E1: ADC.w #$0006
#_03C8E4: STA.w $0E00

.branch03C8E7
#_03C8E7: INC A
#_03C8E8: CMP.w $0A42
#_03C8EB: BCS .change_message

#_03C8ED: JSR GetNextTextByte
#_03C8F0: RTS

.change_message
#_03C8F1: JSR GetNextTextByte
#_03C8F4: JSR ChangeMessageID
#_03C8F7: RTS

;===================================================================================================

TextCommand_3D:
#_03C8F8: REP #$30
#_03C8FA: STZ.w $0A44
#_03C8FD: LDA.w #$FFFF
#_03C900: STA.w $0A46
#_03C903: LDX.w $0526
#_03C906: LDA.w $1006,X
#_03C909: JSR routine03D005
#_03C90C: DEC A
#_03C90D: BPL .branch03C910

#_03C90F: RTS

.branch03C910
#_03C910: STA.w $0E00
#_03C913: ASL A
#_03C914: ASL A
#_03C915: CLC
#_03C916: ADC.w $0E00
#_03C919: TAX
#_03C91A: STZ.w $0E00
#_03C91D: JSL GetRandomInt
#_03C921: LDA.w $0ED5
#_03C924: AND.w #$00FF
#_03C927: STA.w $0E02
#_03C92A: LDY.w #$0000

.branch03C92D
#_03C92D: LDA.w data03CC24,X
#_03C930: AND.w #$00FF
#_03C933: CMP.w $0E02
#_03C936: BCS .branch03C945

#_03C938: INC.w $0E00
#_03C93B: INC.w $0E00
#_03C93E: INX
#_03C93F: INY
#_03C940: CPY.w #$0004
#_03C943: BNE .branch03C92D

.branch03C945
#_03C945: LDA.w $0E00
#_03C948: TAY
#_03C949: LDA.w .vectors,Y
#_03C94C: STA.w $00E0
#_03C94F: JMP ($00E0)

.vectors
#_03C952: dw routine03C95C
#_03C954: dw routine03C987
#_03C956: dw routine03C9B2
#_03C958: dw routine03C9CF
#_03C95A: dw routine03C9F2

;===================================================================================================

routine03C95C:
#_03C95C: REP #$30
#_03C95E: JSL routine03C99C
#_03C962: JSR routine03CA0F
#_03C965: STA.w $0A46
#_03C968: CLC
#_03C969: ADC.w $0405
#_03C96C: STA.w $0405
#_03C96F: LDA.w $0407
#_03C972: ADC.w #$0000
#_03C975: STA.w $0407
#_03C978: LDA.w #$0000
#_03C97B: STA.w $0A44
#_03C97E: JSL ClampMoneyAndMAG
#_03C982: JSL routine0F945E
#_03C986: RTS

;===================================================================================================

routine03C987:
#_03C987: REP #$30
#_03C989: JSL routine03CCB1
#_03C98D: JSR routine03CA0F
#_03C990: STA.w $0A46
#_03C993: CLC
#_03C994: ADC.w $0409
#_03C997: STA.w $0409
#_03C99A: LDA.w $040B
#_03C99D: ADC.w #$0000
#_03C9A0: STA.w $040B
#_03C9A3: LDA.w #$0001
#_03C9A6: STA.w $0A44
#_03C9A9: JSL ClampMoneyAndMAG
#_03C9AD: JSL routine0F945E
#_03C9B1: RTS

;===================================================================================================

routine03C9B2:
#_03C9B2: REP #$30
#_03C9B4: LDA.w #$00B2
#_03C9B7: STA.w $0A50
#_03C9BA: LDA.w #$0002
#_03C9BD: STA.w $0A44
#_03C9C0: JSL AddItemToInventory_long

#_03C9C4: SEP #$20
#_03C9C6: LDA.w $0A58
#_03C9C9: BEQ .exit

#_03C9CB: JMP routine03C95C

.exit
#_03C9CE: RTS

;===================================================================================================

routine03C9CF:
#_03C9CF: REP #$30
#_03C9D1: LDA.w #$0004
#_03C9D4: STA.w $0A44
#_03C9D7: LDX.w $0526
#_03C9DA: LDA.w $1046,X
#_03C9DD: STA.w $0A50
#_03C9E0: STA.w $0A46
#_03C9E3: JSL AddItemToInventory_long

#_03C9E7: SEP #$20
#_03C9E9: LDA.w $0A58
#_03C9EC: BEQ .exit

#_03C9EE: JMP routine03C987

.exit
#_03C9F1: RTS

;===================================================================================================

routine03C9F2:
#_03C9F2: REP #$30
#_03C9F4: LDA.w #$00B4
#_03C9F7: STA.w $0A50
#_03C9FA: LDA.w #$0005
#_03C9FD: STA.w $0A44
#_03CA00: JSL AddItemToInventory_long

#_03CA04: SEP #$20
#_03CA06: LDA.w $0A58
#_03CA09: BEQ .exit

#_03CA0B: JMP routine03C95C

.exit
#_03CA0E: RTS

;===================================================================================================

routine03CA0F:
#_03CA0F: REP #$20
#_03CA11: ASL A
#_03CA12: STA.w $0E00
#_03CA15: ASL A
#_03CA16: ASL A
#_03CA17: CLC
#_03CA18: ADC.w $0E00
#_03CA1B: STA.w $0E00
#_03CA1E: JSL GetRandomInt
#_03CA22: LDA.w $0ED5
#_03CA25: AND.w #$000F
#_03CA28: CLC
#_03CA29: ADC.w $0E00
#_03CA2C: BEQ .branch03CA2F

#_03CA2E: RTS

.branch03CA2F
#_03CA2F: INC A
#_03CA30: RTS

;===================================================================================================

TextCommand_3E:
#_03CA31: REP #$30
#_03CA33: JSR GetNextTextByte
#_03CA36: AND.w #$00FF
#_03CA39: BNE .branch03CA3E

#_03CA3B: JMP .branch03CABA

.branch03CA3E
#_03CA3E: CMP.w #$0001
#_03CA41: BNE .branch03CA46

#_03CA43: JMP .branch03CAF7

.branch03CA46
#_03CA46: LDX.w #$0000
#_03CA49: STZ.w $0E00

.branch03CA4C
#_03CA4C: LDA.w $1000,X
#_03CA4F: AND.w #$4000
#_03CA52: BEQ .branch03CA5F

#_03CA54: LDA.w $1002,X
#_03CA57: AND.w #$C000
#_03CA5A: BEQ .branch03CA5F

#_03CA5C: INC.w $0E00

.branch03CA5F
#_03CA5F: TXA
#_03CA60: CLC
#_03CA61: ADC.w #$0060
#_03CA64: TAX
#_03CA65: CMP.w #$0600
#_03CA68: BNE .branch03CA4C

#_03CA6A: LDA.w $0E00
#_03CA6D: BEQ .branch03CA9D

#_03CA6F: LDX.w #$0000

.branch03CA72
#_03CA72: LDA.w $1000,X
#_03CA75: AND.w #$4000
#_03CA78: BEQ .branch03CA91

#_03CA7A: LDA.w $1002,X
#_03CA7D: AND.w #$C000
#_03CA80: BEQ .branch03CA91

#_03CA82: LDA.w #$0000
#_03CA85: STA.w $1002,X
#_03CA88: LDA.w $1030,X
#_03CA8B: LSR A
#_03CA8C: LSR A
#_03CA8D: LSR A
#_03CA8E: STA.w $102E,X

.branch03CA91
#_03CA91: TXA
#_03CA92: CLC
#_03CA93: ADC.w #$0060
#_03CA96: TAX
#_03CA97: CMP.w #$0600
#_03CA9A: BNE .branch03CA72

#_03CA9C: RTS

.branch03CA9D
#_03CA9D: LDX.w #$0000

.branch03CAA0
#_03CAA0: LDA.w $1002,X
#_03CAA3: AND.w #$4000
#_03CAA6: BEQ .branch03CAAE

#_03CAA8: LDA.w #$0000
#_03CAAB: STA.w $1002,X

.branch03CAAE
#_03CAAE: TXA
#_03CAAF: CLC
#_03CAB0: ADC.w #$0060
#_03CAB3: TAX
#_03CAB4: CMP.w #$0600
#_03CAB7: BNE .branch03CAA0

#_03CAB9: RTS

.branch03CABA
#_03CABA: LDX.w #$0000

.branch03CABD
#_03CABD: LDA.w $1000,X
#_03CAC0: AND.w #$0400
#_03CAC3: BEQ .branch03CAEB

#_03CAC5: PHX
#_03CAC6: JSL GetRandomInt
#_03CACA: LDA.w $0ED5
#_03CACD: AND.w #$0003
#_03CAD0: INC A
#_03CAD1: TAY
#_03CAD2: LDA.w $102E,X
#_03CAD5: LDX.w #$0000
#_03CAD8: JSL DivisionBig_XA_by_Y
#_03CADC: PLX
#_03CADD: LDA.w $1030
#_03CAE0: SEC
#_03CAE1: SBC.w $0E80
#_03CAE4: CLC
#_03CAE5: ADC.w $102E,X
#_03CAE8: STA.w $102E,X

.branch03CAEB
#_03CAEB: TXA
#_03CAEC: CLC
#_03CAED: ADC.w #$0060
#_03CAF0: TAX
#_03CAF1: CMP.w #$0600
#_03CAF4: BNE .branch03CABD

#_03CAF6: RTS

.branch03CAF7
#_03CAF7: LDX.w #$0000

.branch03CAFA
#_03CAFA: LDA.w $1000,X
#_03CAFD: AND.w #$0400
#_03CB00: BEQ .branch03CB28

#_03CB02: PHX
#_03CB03: JSL GetRandomInt
#_03CB07: LDA.w $0ED5
#_03CB0A: AND.w #$0003
#_03CB0D: INC A
#_03CB0E: TAY
#_03CB0F: LDA.w $1032,X
#_03CB12: LDX.w #$0000
#_03CB15: JSL DivisionBig_XA_by_Y
#_03CB19: PLX
#_03CB1A: LDA.w $1034
#_03CB1D: SEC
#_03CB1E: SBC.w $0E80
#_03CB21: CLC
#_03CB22: ADC.w $1032,X
#_03CB25: STA.w $1032,X

.branch03CB28
#_03CB28: TXA
#_03CB29: CLC
#_03CB2A: ADC.w #$0060
#_03CB2D: TAX
#_03CB2E: CMP.w #$0600
#_03CB31: BNE .branch03CAFA

#_03CB33: RTS

;===================================================================================================

TextCommand_InflictStatus:
#_03CB34: REP #$30

#_03CB36: JSR GetNextTextByte
#_03CB39: AND.w #$00FF
#_03CB3C: ASL A
#_03CB3D: TAY

#_03CB3E: LDA.w StatusConditionBits,Y
#_03CB41: ORA.w $1002
#_03CB44: STA.w $1002

#_03CB47: JSL routine00A17E

#_03CB4B: RTS

;===================================================================================================

TextCommand_40:
#_03CB4C: REP #$30
#_03CB4E: STZ.w $0A44
#_03CB51: LDA.w #$FFFF
#_03CB54: STA.w $0A46
#_03CB57: LDX.w $0526
#_03CB5A: LDA.w $1006,X
#_03CB5D: JSR routine03D005
#_03CB60: DEC A
#_03CB61: BPL .continue

#_03CB63: RTS

.continue
#_03CB64: STA.w $0E00
#_03CB67: ASL A
#_03CB68: ASL A
#_03CB69: CLC
#_03CB6A: ADC.w $0E00
#_03CB6D: TAX
#_03CB6E: STZ.w $0A44
#_03CB71: JSL GetRandomInt
#_03CB75: LDA.w $0ED5
#_03CB78: AND.w #$00FF
#_03CB7B: STA.w $0E02
#_03CB7E: LDY.w #$0000

.branch03CB81
#_03CB81: LDA.w data03CC60,X
#_03CB84: AND.w #$00FF
#_03CB87: CMP.w $0E02
#_03CB8A: BCS .branch03CB96

#_03CB8C: INC.w $0A44
#_03CB8F: INX
#_03CB90: INY
#_03CB91: CPY.w #$0004
#_03CB94: BNE .branch03CB81

.branch03CB96
#_03CB96: LDA.w $0A44
#_03CB99: ASL A
#_03CB9A: TAY
#_03CB9B: LDA.w .vectors,Y
#_03CB9E: STA.w $00E0
#_03CBA1: JMP ($00E0)

.vectors
#_03CBA4: dw routine03CBAE
#_03CBA6: dw routine03CBB9
#_03CBA8: dw routine03CBFB
#_03CBAA: dw routine03CBFF
#_03CBAC: dw routine03CC12

;===================================================================================================

routine03CBAE:
#_03CBAE: JSL routine03C99C
#_03CBB2: JSR routine03CBC4

#_03CBB5: STA.w $0A46

#_03CBB8: RTS

;===================================================================================================

routine03CBB9:
#_03CBB9: JSL routine03CCB1
#_03CBBD: JSR routine03CBC4

#_03CBC0: STA.w $0A46

#_03CBC3: RTS

;===================================================================================================

routine03CBC4:
#_03CBC4: STA.w $0E10
#_03CBC7: JSL GetRandomInt
#_03CBCB: LDA.w $0ED5
#_03CBCE: AND.w #$0003
#_03CBD1: CLC
#_03CBD2: ADC.w #$0004
#_03CBD5: STA.w $0E12
#_03CBD8: JSL BigMultiplication_long
#_03CBDC: INC.w $0E14
#_03CBDF: LDA.w $0E14
#_03CBE2: STA.w $0E00
#_03CBE5: LDA.w #$00EA
#_03CBE8: JSL TestGameProgressBit
#_03CBEC: BCC .branch03CBF7

#_03CBEE: LDA.w #$00EA
#_03CBF1: JSR ClearGameProgressBit
#_03CBF4: ASL.w $0E00

.branch03CBF7
#_03CBF7: LDA.w $0E00
#_03CBFA: RTS

;===================================================================================================

routine03CBFB:
#_03CBFB: STZ.w $0A46

#_03CBFE: RTS

;===================================================================================================

routine03CBFF:
#_03CBFF: JSL GetRandomInt

#_03CC03: LDA.w $0ED5
#_03CC06: AND.w #$000F
#_03CC09: CMP.w #$000C
#_03CC0C: BCS routine03CBFF

#_03CC0E: STA.w $0A46
#_03CC11: RTS

;===================================================================================================

routine03CC12:
#_03CC12: REP #$30

#_03CC14: LDA.w #$00B4
#_03CC17: STA.w $0A50

#_03CC1A: LDA.w #$0005
#_03CC1D: STA.w $0A44
#_03CC20: STZ.w $0A46

#_03CC23: RTS

;===================================================================================================

data03CC24:
#_03CC24: db $47,$8F,$BF,$DF,$FF,$3F,$8F,$BF
#_03CC2C: db $DF,$FF,$4F,$9F,$CF,$EF,$FF,$3F
#_03CC34: db $7F,$BF,$DF,$FF,$2F,$7F,$AF,$DF
#_03CC3C: db $FF,$1F,$7F,$BF,$DF,$FF,$5F,$6F
#_03CC44: db $AF,$CF,$FF,$3F,$7F,$BF,$DF,$FF
#_03CC4C: db $DF,$E0,$E1,$FF,$FF,$DF,$E0,$E1
#_03CC54: db $FF,$FF,$DF,$E0,$E1,$FF,$FF,$3F
#_03CC5C: db $7F,$BF,$DF,$FF

data03CC60:
#_03CC60: db $5F,$9F,$D7,$EF,$FF,$5F,$AF,$DF
#_03CC68: db $EF,$FF,$4F,$9F,$DF,$EF,$FF,$4F
#_03CC70: db $8F,$AF,$CF,$FF,$1F,$5F,$AF,$D7
#_03CC78: db $FF,$3F,$9F,$DF,$EF,$FF,$6F,$AF
#_03CC80: db $DF,$EF,$FF,$5F,$9F,$DF,$EF,$FF
#_03CC88: db $5F,$9F,$DF,$EF,$FF,$5F,$9F,$DF
#_03CC90: db $EF,$FF,$EF,$F0,$F7,$FF,$FF,$5F
#_03CC98: db $9F,$DF,$EF,$FF

;===================================================================================================

routine03C99C:
#_03CC9C: PHP

#_03CC9D: PHB
#_03CC9E: PHK
#_03CC9F: PLB

#_03CCA0: REP #$30

#_03CCA2: LDX.w $0526

#_03CCA5: LDA.w $100A,X
#_03CCA8: ASL A
#_03CCA9: ASL A
#_03CCAA: ASL A
#_03CCAB: BNE .exit

#_03CCAD: INC A

.exit
#_03CCAE: PLB

#_03CCAF: PLP
#_03CCB0: RTL

;===================================================================================================

routine03CCB1:
#_03CCB1: PHP

#_03CCB2: PHB
#_03CCB3: PHK
#_03CCB4: PLB

#_03CCB5: REP #$30

#_03CCB7: LDX.w $0526

#_03CCBA: LDA.w $100A,X
#_03CCBD: ASL A
#_03CCBE: ASL A

#_03CCBF: PLB

#_03CCC0: PLP
#_03CCC1: RTL

;===================================================================================================

TextCommand_5D:
#_03CCC2: REP #$30

#_03CCC4: LDA.w $0A44
#_03CCC7: AND.w #$0007
#_03CCCA: ASL A
#_03CCCB: TAY

#_03CCCC: LDA.w .vectors,Y
#_03CCCF: STA.w $00E0

#_03CCD2: JMP ($00E0)

.vectors
#_03CCD5: dw routine03CCE1
#_03CCD7: dw routine03CD0D
#_03CCD9: dw CODE_03CD95
#_03CCDB: dw routine03CDB8
#_03CCDD: dw routine03CD72
#_03CCDF: dw routine03CD72

;===================================================================================================

routine03CCE1:
#_03CCE1: LDA.w $0407
#_03CCE4: BNE .branch03CCF1

#_03CCE6: LDA.w $0405
#_03CCE9: CMP.w $0A46
#_03CCEC: BCS .branch03CCF1

#_03CCEE: JMP .branch03CDEA

.branch03CCF1
#_03CCF1: LDA.w $0405
#_03CCF4: SEC
#_03CCF5: SBC.w $0A46
#_03CCF8: STA.w $0405
#_03CCFB: LDA.w $0407
#_03CCFE: SBC.w #$0000
#_03CD01: STA.w $0407
#_03CD04: LDA.w #$0002
#_03CD07: JSR routine03CD39
#_03CD0A: JMP .branch03CDE2

routine03CD0D:
#_03CD0D: LDA.w $040B
#_03CD10: BNE .branch03CD1D

#_03CD12: LDA.w $0409
#_03CD15: CMP.w $0A46
#_03CD18: BCS .branch03CD1D

#_03CD1A: JMP .branch03CDEA

.branch03CD1D
#_03CD1D: LDA.w $0409
#_03CD20: SEC
#_03CD21: SBC.w $0A46
#_03CD24: STA.w $0409
#_03CD27: LDA.w $040B
#_03CD2A: SBC.w #$0000
#_03CD2D: STA.w $040B
#_03CD30: LDA.w #$0002
#_03CD33: JSR routine03CD39
#_03CD36: JMP .branch03CDE2

;---------------------------------------------------------------------------------------------------

routine03CD39:
#_03CD39: PHP
#_03CD3A: REP #$20
#_03CD3C: PHA
#_03CD3D: LDA.w $0A48
#_03CD40: BNE .branch03CD5A

#_03CD42: PLA
#_03CD43: AND.w #$00FF
#_03CD46: CLC
#_03CD47: ADC.w $0A40
#_03CD4A: STA.w $0A40
#_03CD4D: CMP.w #$0020
#_03CD50: BCC .exit

#_03CD52: LDA.w #$001F
#_03CD55: STA.w $0A40
#_03CD58: BRA .exit

.branch03CD5A
#_03CD5A: PLA
#_03CD5B: AND.w #$00FF
#_03CD5E: CLC
#_03CD5F: ADC.w $0A42
#_03CD62: STA.w $0A42
#_03CD65: CMP.w #$0020
#_03CD68: BCC .exit

#_03CD6A: LDA.w #$001F
#_03CD6D: STA.w $0A42

.exit
#_03CD70: PLP
#_03CD71: RTS

;===================================================================================================

routine03CD72:
#_03CD72: SEP #$30
#_03CD74: LDA.b #$B4
#_03CD76: STA.w $0A50
#_03CD79: STZ.w $0A51
#_03CD7C: PHP
#_03CD7D: JSL TakeItemFromSomewhere_long
#_03CD81: PLP
#_03CD82: LDA.w $0A58
#_03CD85: BEQ .branch03CD8A

#_03CD87: JMP .branch03CDEA

.branch03CD8A
#_03CD8A: REP #$20
#_03CD8C: LDA.w #$0005
#_03CD8F: JSR routine03CD39
#_03CD92: JMP .branch03CDE2

#CODE_03CD95:
#_03CD95: SEP #$30
#_03CD97: LDA.b #$B2
#_03CD99: STA.w $0A50
#_03CD9C: STZ.w $0A51
#_03CD9F: PHP
#_03CDA0: JSL TakeItemFromSomewhere_long
#_03CDA4: PLP
#_03CDA5: LDA.w $0A58
#_03CDA8: BEQ .branch03CDAD

#_03CDAA: JMP .branch03CDEA

.branch03CDAD
#_03CDAD: REP #$20
#_03CDAF: LDA.w #$0003
#_03CDB2: JSR routine03CD39
#_03CDB5: JMP .branch03CDE2

routine03CDB8:
#_03CDB8: SEP #$30
#_03CDBA: LDA.w $0A46
#_03CDBD: CLC
#_03CDBE: ADC.b #$E4
#_03CDC0: STA.w $0A50
#_03CDC3: STZ.w $0A51
#_03CDC6: PHP
#_03CDC7: JSL TakeItemFromSomewhere_long
#_03CDCB: PLP
#_03CDCC: LDA.w $0A58
#_03CDCF: BEQ .branch03CDD4

#_03CDD1: JMP .branch03CDEA

.branch03CDD4
#_03CDD4: LDY.w $0A46

#_03CDD7: REP #$20
#_03CDD9: LDA.w data03CDF1,Y
#_03CDDC: AND.w #$00FF
#_03CDDF: JSR routine03CD39

.branch03CDE2
#_03CDE2: JSL routine0F945E
#_03CDE6: JSR GetNextTextByte
#_03CDE9: RTS

.branch03CDEA
#_03CDEA: JSR GetNextTextByte
#_03CDED: JSR ChangeMessageID
#_03CDF0: RTS

data03CDF1:
#_03CDF1: db $07,$05,$04,$0A,$0A,$08,$09,$04
#_03CDF9: db $09,$07,$08,$05

;===================================================================================================

TextCommand_RemoveFractionOfHP:
#_03CDFD: REP #$30

#_03CDFF: JSR GetNextTextByte
#_03CE02: AND.w #$00FF
#_03CE05: ASL A
#_03CE06: TAY

#_03CE07: LDX.w .shifts,Y

#_03CE0A: LDA.w $102E

.shift
#_03CE0D: LSR A

#_03CE0E: DEX
#_03CE0F: BPL .shift

#_03CE11: STA.w $0E00

#_03CE14: LDA.w $102E
#_03CE17: SEC
#_03CE18: SBC.w $0E00
#_03CE1B: STA.w $102E

#_03CE1E: RTS

.shifts
#_03CE1F: dw $0000 ; 1/2
#_03CE21: dw $0001 ; 1/4
#_03CE23: dw $0002 ; 1/8

;===================================================================================================

TextCommand_42:
#_03CE25: REP #$30
#_03CE27: LDX.w #$0060

.branch03CE2A
#_03CE2A: LDA.w $1000,X
#_03CE2D: BEQ .branch03CE43

#_03CE2F: LDA.w $1032,X
#_03CE32: LSR A
#_03CE33: LSR A
#_03CE34: LSR A
#_03CE35: LSR A
#_03CE36: STA.w $0E00
#_03CE39: LDA.w $1032,X
#_03CE3C: SEC
#_03CE3D: SBC.w $0E00
#_03CE40: STA.w $1032,X

.branch03CE43
#_03CE43: TXA
#_03CE44: CLC
#_03CE45: ADC.w #$0060
#_03CE48: TAX
#_03CE49: CMP.w #$0180
#_03CE4C: BNE .branch03CE2A

#_03CE4E: RTS

;===================================================================================================

TextCommand_43:
#_03CE4F: REP #$30

#_03CE51: LDA.w $0409
#_03CE54: STA.w $0E00

#_03CE57: LDA.w $040B
#_03CE5A: STA.w $0E02

#_03CE5D: LDX.w #$0004

.roll
#_03CE60: LSR.w $0E02
#_03CE63: ROR.w $0E00

#_03CE66: DEX
#_03CE67: BPL .roll

#_03CE69: LDA.w $0409
#_03CE6C: SEC
#_03CE6D: SBC.w $0E00
#_03CE70: STA.w $0409

#_03CE73: LDA.w $040B
#_03CE76: SBC.w $0E02
#_03CE79: STA.w $040B

#_03CE7C: RTS

;===================================================================================================

TextCommand_44:
#_03CE7D: REP #$30

#_03CE7F: LDA.w #$0000

.next
#_03CE82: LDA.w $1000,X
#_03CE85: BEQ .skip

#_03CE87: LDA.w $100C,X
#_03CE8A: STA.w $0E00

#_03CE8D: LDA.w $100E,X
#_03CE90: STA.w $0E02

#_03CE93: LDY.w #$0007

.shift
#_03CE96: LSR.w $0E02
#_03CE99: ROR.w $0E00

#_03CE9C: DEY
#_03CE9D: BPL .shift

.skip
#_03CE9F: TXA
#_03CEA0: CLC
#_03CEA1: ADC.w #$0060
#_03CEA4: TAX

#_03CEA5: CMP.w #$0180
#_03CEA8: BNE .next

#_03CEAA: RTS

;===================================================================================================

TextCommand_45:
#_03CEAB: REP #$30

#_03CEAD: JSR GetNextTextByte
#_03CEB0: AND.w #$00FF
#_03CEB3: BIT.w #$0080
#_03CEB6: BEQ .positive

#_03CEB8: ORA.w #$FF00

.positive
#_03CEBB: CLC
#_03CEBC: ADC.w $0A40
#_03CEBF: STA.w $0A40
#_03CEC2: BMI .branch03CED1

#_03CEC4: CMP.w #$0020
#_03CEC7: BCS .branch03CECA

#_03CEC9: RTS

.branch03CECA
#_03CECA: LDA.w #$001F
#_03CECD: STA.w $0A40

#_03CED0: RTS

.branch03CED1
#_03CED1: STZ.w $0A40

#_03CED4: RTS

;===================================================================================================

TextCommand_46:
#_03CED5: REP #$30
#_03CED7: JSR GetNextTextByte
#_03CEDA: AND.w #$00FF
#_03CEDD: BIT.w #$0080
#_03CEE0: BEQ .positive

#_03CEE2: ORA.w #$FF00

.positive
#_03CEE5: CLC
#_03CEE6: ADC.w $0A42
#_03CEE9: STA.w $0A42
#_03CEEC: BMI .branch03CEFB

#_03CEEE: CMP.w #$0020
#_03CEF1: BCS .branch03CEF4

#_03CEF3: RTS

.branch03CEF4
#_03CEF4: LDA.w #$001F
#_03CEF7: STA.w $0A42

#_03CEFA: RTS

.branch03CEFB
#_03CEFB: STZ.w $0A42

#_03CEFE: RTS

;===================================================================================================

TextCommand_PickRandomOf4Messages:
#_03CEFF: REP #$30

#_03CF01: LDX.w #$0000

.next_byte
#_03CF04: JSR GetNextTextByte
#_03CF07: AND.w #$00FF
#_03CF0A: STA.w $0E00,X

#_03CF0D: INX
#_03CF0E: INX
#_03CF0F: CPX.w #$0008
#_03CF12: BNE .next_byte

#_03CF14: JSL GetRandomInt

#_03CF18: LDA.w $0ED5
#_03CF1B: AND.w #$0003
#_03CF1E: ASL A
#_03CF1F: TAX

#_03CF20: LDA.w $0E00,X
#_03CF23: JSR ChangeMessageID

#_03CF26: RTS

;===================================================================================================

TextCommand_48:
#_03CF27: SEP #$20

#_03CF29: INC.w $0A3D

#_03CF2C: JSR GetNextTextByte
#_03CF2F: STA.w $0E00

#_03CF32: REP #$30

#_03CF34: LDA.w $0A22
#_03CF37: PHA

#_03CF38: LDA.w $0A24
#_03CF3B: PHA

#_03CF3C: LDA.w $0A26
#_03CF3F: PHA

#_03CF40: LDA.w $00C2
#_03CF43: PHA

#_03CF44: LDA.w $00C0
#_03CF47: PHA

;---------------------------------------------------------------------------------------------------

#_03CF48: LDA.w $0E00
#_03CF4B: AND.w #$00FF
#_03CF4E: DEC A
#_03CF4F: STA.w $0E00
#_03CF52: STA.w $0E10

#_03CF55: LDA.w $0A4A
#_03CF58: LSR A ; /16
#_03CF59: LSR A
#_03CF5A: LSR A
#_03CF5B: LSR A
#_03CF5C: AND.w #$000F
#_03CF5F: TAY

#_03CF60: LDA.w data03CFC0,Y
#_03CF63: AND.w #$00FF
#_03CF66: STA.w $0E11

#_03CF69: JSR SmallMultiplication

#_03CF6C: LDA.w $0A4A
#_03CF6F: AND.w #$000F
#_03CF72: CLC
#_03CF73: ADC.w $0E12
#_03CF76: STA.w $0A22

#_03CF79: LDA.w $0A4A
#_03CF7C: LSR A ; /16
#_03CF7D: LSR A
#_03CF7E: LSR A
#_03CF7F: LSR A
#_03CF80: AND.w #$000F
#_03CF83: TAY

#_03CF84: LDA.w data03CFB3,Y
#_03CF87: STA.w $0A24

#_03CF8A: LDA.w #$0002
#_03CF8D: STA.w $0A26

#_03CF90: JSR SetTextPointerFromMessageID
#_03CF93: JSL routine03834C

;---------------------------------------------------------------------------------------------------

#_03CF97: REP #$20

#_03CF99: PLA
#_03CF9A: STA.w $00C0

#_03CF9D: PLA
#_03CF9E: STA.w $00C2

#_03CFA1: PLA
#_03CFA2: STA.w $0A26

#_03CFA5: PLA
#_03CFA6: STA.w $0A24

#_03CFA9: PLA
#_03CFAA: STA.w $0A22

#_03CFAD: SEP #$20

#_03CFAF: DEC.w $0A3D

#_03CFB2: RTS

;---------------------------------------------------------------------------------------------------

data03CFB3:
#_03CFB3: db $16,$18,$19,$1A,$1B,$16,$18,$19
#_03CFBB: db $1A,$1B,$1C,$1C,$1C

data03CFC0:
#_03CFC0: db $04,$03,$03,$01,$01,$04,$03,$03
#_03CFC8: db $01,$01,$01,$01,$01

;===================================================================================================

TextCommand_WriteSpeakerName:
#_03CFCD: SEP #$20

#_03CFCF: LDA.b #DemonNamePointers>>16
#_03CFD1: STA.w $00C5

#_03CFD4: REP #$30

#_03CFD6: LDX.w $0526

#_03CFD9: LDA.w $1004,X
#_03CFDC: STA.w $0A39

#_03CFDF: LDA.w #DemonNamePointers>>0
#_03CFE2: STA.w $00C3

#_03CFE5: JSR WriteIndexedEntityName

#_03CFE8: RTS

;===================================================================================================

TextCommand_WriteSpeakerClass:
#_03CFE9: SEP #$20

#_03CFEB: LDA.b #ClassNamePointers>>16
#_03CFED: STA.w $00C5

#_03CFF0: REP #$30

#_03CFF2: LDX.w $0526

#_03CFF5: LDA.w $1006,X
#_03CFF8: STA.w $0A39

#_03CFFB: LDA.w #ClassNamePointers>>0
#_03CFFE: STA.w $00C3

#_03D001: JSR WriteIndexedEntityName

#_03D004: RTS

;===================================================================================================

routine03D005:
#_03D005: PHP

#_03D006: REP #$30

#_03D008: AND.w #$00FF
#_03D00B: TAY

#_03D00C: LDA.w data03D014,Y
#_03D00F: AND.w #$00FF

#_03D012: PLP
#_03D013: RTS

data03D014:
#_03D014: db $00,$00,$01,$01,$01,$03,$03,$04
#_03D01C: db $05,$06,$06,$08,$02,$02,$02,$03
#_03D024: db $04,$05,$06,$07,$07,$07,$0B,$0B
#_03D02C: db $0B,$01,$02,$04,$05,$06,$07,$09
#_03D034: db $09,$09,$0A,$0C

;===================================================================================================

TextCommand_AskForItemOrMoney:
#_03D038: SEP #$30

#_03D03A: LDA.w $0A44
#_03D03D: ASL A
#_03D03E: TAY

#_03D03F: REP #$20

#_03D041: LDA.w .vectors,Y
#_03D044: STA.w $00E0

#_03D047: JMP ($00E0)

.vectors
#_03D04A: dw routine03D056
#_03D04C: dw routine03D05D
#_03D04E: dw routine03D064
#_03D050: dw routine03D072
#_03D052: dw TextCommand_WriteItemName_localbounce
#_03D054: dw routine03D088

;===================================================================================================

routine03D056:
#_03D056: JSR routine03D0BB
#_03D059: JSR routine03D096
#_03D05C: RTS

;===================================================================================================

routine03D05D:
#_03D05D: JSR routine03D096
#_03D060: JSR routine03D0DF
#_03D063: RTS

;===================================================================================================

routine03D064:
#_03D064: SEP #$20
#_03D066: LDA.b #$B2
#_03D068: STA.w $0A50
#_03D06B: STZ.w $0A51
#_03D06E: JSR TextCommand_WriteItemName
#_03D071: RTS

;===================================================================================================

routine03D072:
#_03D072: SEP #$20
#_03D074: LDA.w $0A46
#_03D077: CLC
#_03D078: ADC.b #$E4
#_03D07A: STA.w $0A50
#_03D07D: STZ.w $0A51
#_03D080: JSR TextCommand_WriteItemName
#_03D083: RTS

;===================================================================================================
; Pointless
;===================================================================================================
TextCommand_WriteItemName_localbounce:
#_03D084: JSR TextCommand_WriteItemName
#_03D087: RTS

;===================================================================================================

routine03D088:
#_03D088: SEP #$20
#_03D08A: LDA.b #$B4
#_03D08C: STA.w $0A50
#_03D08F: STZ.w $0A51
#_03D092: JSR TextCommand_WriteItemName
#_03D095: RTS

;===================================================================================================

routine03D096:
#_03D096: REP #$30

#_03D098: LDA.w $0A46
#_03D09B: STA.w $0E10
#_03D09E: STZ.w $0E12

#_03D0A1: JSL HexToDecForHUD

#_03D0A5: LDY.w #$0005

.next_char
#_03D0A8: LDA.w $0E00,Y
#_03D0AB: AND.w #$00FF
#_03D0AE: CMP.w #$00CF
#_03D0B1: BEQ .is_space

#_03D0B3: JSL WriteNextMessageChar

.is_space
#_03D0B7: DEY
#_03D0B8: BPL .next_char

#_03D0BA: RTS

;===================================================================================================

routine03D0BB:
#_03D0BB: LDA.w #$00EC
#_03D0BE: JSL TestGameProgressBit
#_03D0C2: BCC .use_yen

#_03D0C4: LDA.w #$205C ; Macca symbol
#_03D0C7: BRA .draw_char

.use_yen
#_03D0C9: LDA.w #$205B ; Yen symbol

.draw_char
#_03D0CC: LDX.w $0A33

#_03D0CF: STA.w $0900,X

#_03D0D2: LDA.w #$20CF ; space
#_03D0D5: STA.w $0940,X

#_03D0D8: INC.w $0A33
#_03D0DB: INC.w $0A33

#_03D0DE: RTS

;===================================================================================================

routine03D0DF:
#_03D0DF: LDA.w #$20A7 ; ぢ

#_03D0E2: LDX.w $0A33
#_03D0E5: STA.w $0900,X

#_03D0E8: INC A
#_03D0E9: STA.w $0902,X

#_03D0EC: LDA.w #$20CF ; space
#_03D0EF: STA.w $0940,X
#_03D0F2: STA.w $0942,X

#_03D0F5: INC.w $0A33
#_03D0F8: INC.w $0A33
#_03D0FB: INC.w $0A33
#_03D0FE: INC.w $0A33

#_03D101: RTS

;===================================================================================================

TextCommand_59:
#_03D102: REP #$30

#_03D104: LDX.w $0526

#_03D107: LDA.w $1018,X
#_03D10A: STA.w $0E00

#_03D10D: JSR GetNextTextByte
#_03D110: AND.w #$00FF
#_03D113: TAY

#_03D114: LDA.w TextCommand_SmallMasks,Y
#_03D117: AND.w #$00FF
#_03D11A: STA.w $0E02

#_03D11D: JSL GetRandomInt
#_03D121: LDA.w $0ED5
#_03D124: AND.w $0E02
#_03D127: CLC
#_03D128: ADC.w $0E00
#_03D12B: STA.w $0E00

#_03D12E: LDA.w $1018
#_03D131: CMP.w $0E00
#_03D134: BCC .change_message

#_03D136: JSR GetNextTextByte

#_03D139: RTS

.change_message
#_03D13A: JSR GetNextTextByte
#_03D13D: JSR ChangeMessageID

#_03D140: RTS

;===================================================================================================

TextCommand_5A:
#_03D141: REP #$30
#_03D143: JSL routine0F945E
#_03D147: JSR GetNextTextByte
#_03D14A: STA.w $0E00
#_03D14D: AND.w #$000F
#_03D150: BNE .branch03D198

#_03D152: LDA.w #$0000
#_03D155: STA.w $0A44
#_03D158: JSL routine03C99C
#_03D15C: ASL A
#_03D15D: STA.w $0E02
#_03D160: ASL A
#_03D161: ASL A
#_03D162: CLC
#_03D163: ADC.w $0E02
#_03D166: STA.w $0E02
#_03D169: LDA.w $0E00
#_03D16C: AND.w #$00F0
#_03D16F: BEQ .branch03D179

#_03D171: LDA.w $0E02
#_03D174: LSR A
#_03D175: LSR A
#_03D176: INC A
#_03D177: BRA .branch03D17C

.branch03D179
#_03D179: LDA.w $0E02

.branch03D17C
#_03D17C: STA.w $0A46
#_03D17F: CLC
#_03D180: ADC.w $0405
#_03D183: STA.w $0405
#_03D186: LDA.w $0407
#_03D189: ADC.w #$0000
#_03D18C: STA.w $0407
#_03D18F: JSL ClampMoneyAndMAG
#_03D193: JSL routine0F945E
#_03D197: RTS

.branch03D198
#_03D198: LDA.w #$0001
#_03D19B: STA.w $0A44
#_03D19E: JSL routine03CCB1
#_03D1A2: ASL A
#_03D1A3: STA.w $0E02
#_03D1A6: ASL A
#_03D1A7: ASL A
#_03D1A8: CLC
#_03D1A9: ADC.w $0E02
#_03D1AC: STA.w $0E02
#_03D1AF: LDA.w $0E00
#_03D1B2: AND.w #$00F0
#_03D1B5: BEQ .branch03D1BF

#_03D1B7: LDA.w $0E02
#_03D1BA: LSR A
#_03D1BB: LSR A
#_03D1BC: INC A
#_03D1BD: BRA .branch03D1C2

.branch03D1BF
#_03D1BF: LDA.w $0E02

.branch03D1C2
#_03D1C2: STA.w $0A46
#_03D1C5: CLC
#_03D1C6: ADC.w $0409
#_03D1C9: STA.w $0409
#_03D1CC: LDA.w $040B
#_03D1CF: ADC.w #$0000
#_03D1D2: STA.w $040B
#_03D1D5: JSL ClampMoneyAndMAG
#_03D1D9: JSL routine0F945E
#_03D1DD: RTS

;===================================================================================================

TextCommand_SetOrClearProgressFlag:
#_03D1DE: SEP #$30

#_03D1E0: JSR GetNextTextByte
#_03D1E3: AND.b #$FF
#_03D1E5: BNE .set_progress_bit

#_03D1E7: JSR GetNextTextByte
#_03D1EA: JSR ClearGameProgressBit

#_03D1ED: RTS

.set_progress_bit
#_03D1EE: JSR GetNextTextByte
#_03D1F1: JSR SetGameProgressBit

#_03D1F4: RTS

;===================================================================================================

TextCommand_33:
#_03D1F5: SEP #$30

#_03D1F7: LDA.b #$20
#_03D1F9: STA.w $0A2C
#_03D1FC: STZ.w $0A48

#_03D1FF: JSR GetNextTextByte
#_03D202: CMP.b #$00
#_03D204: BEQ .branch03D20B

#_03D206: LDA.b #$0D
#_03D208: INC.w $0A48

.branch03D20B
#_03D20B: STA.w $0E00

#_03D20E: LDA.w $0A4A
#_03D211: LSR A
#_03D212: LSR A
#_03D213: LSR A
#_03D214: LSR A
#_03D215: CLC
#_03D216: ADC.w $0E00
#_03D219: ASL A
#_03D21A: TAY

#_03D21B: REP #$20

#_03D21D: LDA.w data03D429,Y
#_03D220: STA.w $0A12

#_03D223: LDA.w #$0018
#_03D226: STA.w $0A1E

#_03D229: LDA.w #$0004
#_03D22C: STA.w $0A20

#_03D22F: LDA.w #$0002
#_03D232: STA.w $0A1C

#_03D235: LDA.w #$0003
#_03D238: STA.w $0A2A

#_03D23B: LDA.w #$3DC4
#_03D23E: STA.w $0A1A

#_03D241: JSL LoadClassyMessage
#_03D245: JSR SetTextPointerFromMessageID

#_03D248: RTS

data03D429:
#_03D249: dw $800B,$8013,$800F,$8023
#_03D251: dw $8008,$8004,$8004,$8001
#_03D259: dw $8006,$8006,$8029,$802B
#_03D261: dw $802C,$800D,$8019,$8012
#_03D269: dw $8026,$8009,$8005,$8005
#_03D271: dw $8003,$8007,$8007,$802A
#_03D279: dw $802B,$802D

;===================================================================================================

TextCommand_5E:
#_03D27D: SEP #$20

#_03D27F: JSR GetNextTextByte
#_03D282: STA.w $0A4C

#_03D285: CMP.b #$01
#_03D287: BEQ .branch03D28D

#_03D289: CMP.b #$02
#_03D28B: BNE .branch03D29F

;---------------------------------------------------------------------------------------------------

.branch03D28D
#_03D28D: LDA.b #$E9
#_03D28F: JSL TestGameProgressBit
#_03D293: BCC .branch03D29F

#_03D295: LDA.b #$02
#_03D297: STA.w $0A4C

#_03D29A: LDA.b #$E9
#_03D29C: JSR ClearGameProgressBit

;---------------------------------------------------------------------------------------------------

.branch03D29F
#_03D29F: LDA.b #$E4
#_03D2A1: JSR ClearGameProgressBit

#_03D2A4: LDA.w $0A4C
#_03D2A7: CMP.b #$01
#_03D2A9: BEQ .branch03D2B2

#_03D2AB: CMP.b #$02
#_03D2AD: BEQ .branch03D2C6

#_03D2AF: JMP TerminateMessage

.branch03D2B2
#_03D2B2: REP #$20

#_03D2B4: LDA.w $0A40
#_03D2B7: SEC
#_03D2B8: SBC.w #$0002
#_03D2BB: BPL .branch03D2C0

#_03D2BD: LDA.w #$0000

.branch03D2C0
#_03D2C0: STA.w $0A40

#_03D2C3: JMP TerminateMessage

.branch03D2C6
#_03D2C6: REP #$20

#_03D2C8: LDA.w $0A42
#_03D2CB: SEC
#_03D2CC: SBC.w #$0002
#_03D2CF: BPL .branch03D2D4

#_03D2D1: LDA.w #$0000

.branch03D2D4
#_03D2D4: STA.w $0A42

#_03D2D7: JMP TerminateMessage

;===================================================================================================

routine03D2DA:
#_03D2DA: REP #$30

#_03D2DC: LDX.w #$0060

#_03D2DF: LDA.w $1000,X
#_03D2E2: BEQ .change_message

#_03D2E4: LDA.w $1002,X
#_03D2E7: AND.w #$F640
#_03D2EA: BNE .change_message

#_03D2EC: JSR GetNextTextByte

#_03D2EF: RTS

.change_message
#_03D2F0: JSR GetNextTextByte
#_03D2F3: JSR ChangeMessageID

#_03D2F6: RTS

;===================================================================================================

routine03D2F7:
#_03D2F7: REP #$30

#_03D2F9: LDA.w $0524
#_03D2FC: BNE .branch03D30B

#_03D2FE: JSL routine03D31F
#_03D302: CMP.w #$0008
#_03D305: BCS .change_message

#_03D307: JSR GetNextTextByte

#_03D30A: RTS

.branch03D30B
#_03D30B: JSL routine03D31F
#_03D30F: CMP.w #$0004
#_03D312: BCS .change_message

#_03D314: JSR GetNextTextByte

#_03D317: RTS

.change_message
#_03D318: JSR GetNextTextByte
#_03D31B: JSR ChangeMessageID

#_03D31E: RTS

;===================================================================================================

routine03D31F:
#_03D31F: PHP
#_03D320: REP #$30
#_03D322: LDA.w $0512
#_03D325: CLC
#_03D326: ADC.w $0514
#_03D329: PLP
#_03D32A: RTL

;===================================================================================================

routine03D32B:
#_03D32B: REP #$30

#_03D32D: JSL routine03D31F
#_03D331: CMP.w #$0001
#_03D334: BEQ .change_message

#_03D336: JSR GetNextTextByte
#_03D339: RTS

.change_message
#_03D33A: JSR GetNextTextByte
#_03D33D: JSR ChangeMessageID

#_03D340: RTS

;===================================================================================================

routine03D341:
#_03D341: PHP
#_03D342: REP #$10
#_03D344: SEP #$20
#_03D346: LDX.w #$0000
#_03D349: LDY.w #$0000
#_03D34C: STZ.w $0E00
#_03D34F: STZ.w $0E02

.branch03D352
#_03D352: PHX

#_03D353: SEP #$20
#_03D355: JSR routine03D3B2
#_03D358: AND.b #$FF
#_03D35A: BEQ .branch03D377

#_03D35C: REP #$20
#_03D35E: LDA.w $1000,X
#_03D361: BIT.w #$8000
#_03D364: BEQ .branch03D377

#_03D366: BIT.w #$4000
#_03D369: BEQ .branch03D3A4

#_03D36B: SEP #$10
#_03D36D: LDX.w $0E00
#_03D370: TYA
#_03D371: STA.w $0BA4,X
#_03D374: INC.w $0E00

.branch03D377
#_03D377: REP #$30
#_03D379: PLX
#_03D37A: TXA
#_03D37B: CLC
#_03D37C: ADC.w #$0060
#_03D37F: TAX
#_03D380: INY
#_03D381: CPY.w #$0010
#_03D384: BNE .branch03D352

#_03D386: SEP #$30
#_03D388: LDA.b #$FF
#_03D38A: LDX.w $0E00
#_03D38D: STX.w $0BE0
#_03D390: STA.w $0BA4,X
#_03D393: LDX.w $0E02
#_03D396: STX.w $0BE1
#_03D399: STA.w $0BB4,X
#_03D39C: DEC.w $0BE0
#_03D39F: DEC.w $0BE1
#_03D3A2: PLP
#_03D3A3: RTS

.branch03D3A4
#_03D3A4: SEP #$10
#_03D3A6: LDX.w $0E02
#_03D3A9: TYA
#_03D3AA: STA.w $0BB4,X
#_03D3AD: INC.w $0E02
#_03D3B0: BRA .branch03D377

routine03D3B2:
#_03D3B2: SEP #$20
#_03D3B4: LDA.w $0BA3
#_03D3B7: BEQ .branch03D3D5

#_03D3B9: CMP.b #$01
#_03D3BB: BEQ .branch03D3F9

#_03D3BD: CMP.b #$02
#_03D3BF: BEQ .branch03D406

#_03D3C1: REP #$20
#_03D3C3: LDA.w #$C000
#_03D3C6: AND.w $1002,X
#_03D3C9: BEQ .branch03D3D0

.branch03D3CB
#_03D3CB: SEP #$20
#_03D3CD: LDA.b #$FF
#_03D3CF: RTS

.branch03D3D0
#_03D3D0: SEP #$20
#_03D3D2: LDA.b #$00
#_03D3D4: RTS

.branch03D3D5
#_03D3D5: REP #$20
#_03D3D7: LDA.w $1002,X
#_03D3DA: AND.w #$C000
#_03D3DD: BNE .branch03D3EF

#_03D3DF: LDA.w $102E,X
#_03D3E2: CMP.w $1030,X
#_03D3E5: BCC .branch03D3F4

#_03D3E7: LDA.w $1032,X
#_03D3EA: CMP.w $1034,X
#_03D3ED: BCC .branch03D3F4

.branch03D3EF
#_03D3EF: SEP #$20
#_03D3F1: LDA.b #$00
#_03D3F3: RTS

.branch03D3F4
#_03D3F4: SEP #$20
#_03D3F6: LDA.b #$FF
#_03D3F8: RTS

.branch03D3F9
#_03D3F9: REP #$20
#_03D3FB: LDA.w $1002,X
#_03D3FE: AND.w #$38FF
#_03D401: BNE .branch03D3CB

#_03D403: SEP #$20
#_03D405: RTS

.branch03D406
#_03D406: REP #$20
#_03D408: LDA.w $1002,X
#_03D40B: AND.w #$0700
#_03D40E: BNE .branch03D3CB

#_03D410: SEP #$20
#_03D412: RTS

;===================================================================================================

routine03D413:
#_03D413: SEP #$30
#_03D415: LDA.w $0BA3
#_03D418: ASL A
#_03D419: TAY
#_03D41A: LDA.w data03D45C,Y
#_03D41D: STA.w $00E0
#_03D420: LDA.w pointers03D45D,Y
#_03D423: STA.w $00E1
#_03D426: STZ.w $0A33
#_03D429: LDX.b #$00
#_03D42B: LDY.b #$00

.branch03D42D
#_03D42D: LDA.b ($E0),Y
#_03D42F: STA.w $0106,X
#_03D432: LDA.w $0A2C
#_03D435: STA.w $0107,X
#_03D438: INX
#_03D439: INX
#_03D43A: INY
#_03D43B: CPY.b #$1E
#_03D43D: BNE .branch03D42D

#_03D43F: REP #$20
#_03D441: LDA.w $0A0B
#_03D444: CLC
#_03D445: ADC.w #$0021
#_03D448: STA.w $0102
#_03D44B: LDA.w #$001E
#_03D44E: STA.w $0104
#_03D451: LDA.w #$0001
#_03D454: STA.w $0100
#_03D457: JSL RunFramesUntilDrawBufferEmpties
#_03D45B: RTS

data03D45C:
#_03D45C: dw data03D464
#_03D45E: dw data03D482
#_03D460: dw data03D482
#_03D462: dw data03D482

; "#  NAME     HITーPTS  MP  ちりょうひ"
data03D464:
#_03D464: db $A0, $CF, $CF, $18, $0B, $17, $0F, $CF ; "#  NAME "
#_03D46C: db $CF, $CF, $CF, $CF, $12, $13, $1E, $5A ; "    HITー"
#_03D474: db $1A, $1E, $1D, $CF, $CF, $17, $1A, $CF ; "PTS  MP "
#_03D47C: db $CF, $35, $4C, $57, $27, $3F ; " ちりょうひ"

; "#  NAME      STATUS      ちりょうひ  "
data03D482:
#_03D482: db $A0, $CF, $CF, $18, $0B, $17, $0F, $CF ; "#  NAME ""
#_03D48A: db $CF, $CF, $CF, $CF, $CF, $1D, $1E, $0B ; "     STA"
#_03D492: db $1E, $1F, $1D, $CF, $CF, $CF, $CF, $CF ; "TUS     "
#_03D49A: db $CF, $35, $4C, $57, $27, $3F, $CF, $CF ; " ちりょうひ  "

DATA8_03D4A2:
#_03D4A2: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_03D4AA: db $CF,$CF,$CF,$CF,$CF,$5A,$CF,$CF
#_03D4B2: db $CF,$CF,$95,$95,$95,$CF,$CF,$CF
#_03D4BA: db $CF,$CF,$CF,$CF

data03D4BE:
#_03D4BE: db $02,$03,$04,$05,$06,$07,$08,$09
#_03D4C6: db $0A,$A2,$A3,$A4,$A5,$A6

;===================================================================================================

routine03D4CC:
#_03D4CC: PHP
#_03D4CD: REP #$20
#_03D4CF: LDA.w $0A14
#_03D4D2: ORA.w $0A16
#_03D4D5: BEQ .branch03D4F2

#_03D4D7: LDA.w $0407
#_03D4DA: CMP.w $0A16
#_03D4DD: BCC .branch03D4F2

#_03D4DF: BNE .branch03D4E9

#_03D4E1: LDA.w $0405
#_03D4E4: CMP.w $0A14
#_03D4E7: BCC .branch03D4F2

.branch03D4E9
#_03D4E9: SEP #$20
#_03D4EB: LDA.b #$20
#_03D4ED: STA.w $0A2C
#_03D4F0: PLP
#_03D4F1: RTS

.branch03D4F2
#_03D4F2: SEP #$20
#_03D4F4: LDA.b #$24
#_03D4F6: STA.w $0A2C
#_03D4F9: PLP
#_03D4FA: RTS

;===================================================================================================

routine03D4FB:
#_03D4FB: PHP
#_03D4FC: REP #$30
#_03D4FE: LDX.w $0BA1
#_03D501: LDA.w $1002,X
#_03D504: LDY.w #$0000

.branch03D507
#_03D507: ASL A
#_03D508: BCS .branch03D513

#_03D50A: INY
#_03D50B: CPY.w #$0010
#_03D50E: BNE .branch03D507

#_03D510: LDY.w #$00FF

.branch03D513
#_03D513: SEP #$30
#_03D515: TYA
#_03D516: PLP
#_03D517: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
TextWhiteSpaceFill_long:
#_03D518: JSR TextWhiteSpaceFill
#_03D51B: RTL

;===================================================================================================

TextWhiteSpaceFill:
#_03D51C: PHX
#_03D51D: PHY

#_03D51E: PHP

#_03D51F: SEP #$30

#_03D521: LDY.b #$00
#_03D523: STZ.w $0A33

.next_space
#_03D526: LDA.b #$CF
#_03D528: JSL WriteNextMessageChar

#_03D52C: INY
#_03D52D: CPY.b #$20
#_03D52F: BNE .next_space

#_03D531: STZ.w $0A33

#_03D534: PLP

#_03D535: PLY
#_03D536: PLX

#_03D537: RTS

;===================================================================================================

routine03D538:
#_03D538: PHP

#_03D539: SEP #$30

#_03D53B: TXA
#_03D53C: ASL A
#_03D53D: STA.w $0A33

#_03D540: JSR GetCorrectCurrencyCharacter
#_03D543: JSL WriteNextMessageChar

#_03D547: PLP
#_03D548: RTS

;===================================================================================================
; Gets Y-with-= or reduced-planck-constant depending on game state
;===================================================================================================
GetCorrectCurrencyCharacter:
#_03D549: SEP #$30

#_03D54B: LDA.b #$EC
#_03D54D: JSL TestGameProgressBit
#_03D551: BCC .use_yen

#_03D553: LDA.b #$5C ; Macca symbol

#_03D555: RTS

.use_yen
#_03D556: LDA.b #$5B ; Yen symbol

#_03D558: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
UnusedMultipleXBy64:
#_03D559: PHP

#_03D55A: REP #$30

#_03D55C: TXA
#_03D55D: AND.w #$000F
#_03D560: ASL A ; x64
#_03D561: ASL A
#_03D562: ASL A
#_03D563: ASL A
#_03D564: ASL A
#_03D565: ASL A
#_03D566: TAX

#_03D567: PLP

#_03D568: RTS

;===================================================================================================

routine03D569:
#_03D569: PHP
#_03D56A: REP #$30
#_03D56C: STZ.w $0A14
#_03D56F: STZ.w $0A16
#_03D572: LDX.w $0BA1
#_03D575: LDA.w $1030,X
#_03D578: SEC
#_03D579: SBC.w $102E,X
#_03D57C: BMI .branch03D5B4

#_03D57E: STA.w $0E10
#_03D581: LDA.w $07E1
#_03D584: AND.w #$00FF
#_03D587: ASL A
#_03D588: TAX
#_03D589: LDA.w data03D60E,X
#_03D58C: STA.w $0E12
#_03D58F: JSR BigMultiplication
#_03D592: LDA.w $0E14
#_03D595: CLC
#_03D596: ADC.w #$0005
#_03D599: STA.w $0E10
#_03D59C: LDA.w $0E16
#_03D59F: ADC.w #$0000
#_03D5A2: STA.w $0E12
#_03D5A5: JSR Shift_32bit_0E10_Right8Times
#_03D5A8: LDA.w $0E10
#_03D5AB: STA.w $0A14
#_03D5AE: LDA.w $0E12
#_03D5B1: STA.w $0A16

.branch03D5B4
#_03D5B4: LDX.w $0BA1
#_03D5B7: LDA.w $1034,X
#_03D5BA: SEC
#_03D5BB: SBC.w $1032,X
#_03D5BE: BMI .exit

#_03D5C0: STA.w $0E10
#_03D5C3: LDA.w $07E1
#_03D5C6: ASL A
#_03D5C7: AND.w #$01FF
#_03D5CA: TAX
#_03D5CB: LDA.w data03D614,X
#_03D5CE: STA.w $0E12
#_03D5D1: JSR BigMultiplication
#_03D5D4: LDA.w $0E14
#_03D5D7: CLC
#_03D5D8: ADC.w #$0005
#_03D5DB: STA.w $0E10
#_03D5DE: LDA.w $0E16
#_03D5E1: ADC.w #$0000
#_03D5E4: STA.w $0E12
#_03D5E7: JSR Shift_32bit_0E10_Right8Times
#_03D5EA: LDA.w $0E10
#_03D5ED: CLC
#_03D5EE: ADC.w $0A14
#_03D5F1: STA.w $0A14
#_03D5F4: LDA.w $0E12
#_03D5F7: ADC.w $0A16
#_03D5FA: STA.w $0A16

.exit
#_03D5FD: PLP
#_03D5FE: RTS

;===================================================================================================

Shift_32bit_0E10_Right8Times:
#_03D5FF: PHX

#_03D600: LDX.w #$0007

.shift
#_03D603: LSR.w $0E12
#_03D606: ROR.w $0E10

#_03D609: DEX
#_03D60A: BPL .shift

#_03D60C: PLX

#_03D60D: RTS

;===================================================================================================

data03D60E:
#_03D60E: dw $0100,$0180,$0300

data03D614:
#_03D614: dw $014D,$01CD,$0380

;===================================================================================================

routine03D61A:
#_03D61A: PHP
#_03D61B: REP #$20
#_03D61D: LDX.w $0BA1
#_03D620: LDA.w $100A,X
#_03D623: AND.w #$00FF
#_03D626: STA.w $0E00
#_03D629: LDA.w $1002,X
#_03D62C: STA.w $0E02
#_03D62F: STZ.w $0A14
#_03D632: STZ.w $0A16
#_03D635: LDY.w #$0000

.branch03D638
#_03D638: ASL.w $0E02
#_03D63B: BCC .branch03D640

#_03D63D: JSR routine03D648

.branch03D640
#_03D640: INY
#_03D641: CPY.w #$0010
#_03D644: BNE .branch03D638

#_03D646: PLP
#_03D647: RTS

;===================================================================================================

routine03D648:
#_03D648: LDA.w $0E00
#_03D64B: STA.w $0E10
#_03D64E: TYA
#_03D64F: ASL A
#_03D650: TAX
#_03D651: LDA.w data03D69C,X
#_03D654: STA.w $0E12
#_03D657: JSR BigMultiplication
#_03D65A: LDA.w $0E14
#_03D65D: STA.w $0E10
#_03D660: LDA.w $07E1
#_03D663: ASL A
#_03D664: AND.w #$01FF
#_03D667: TAX
#_03D668: LDA.w data03D60E,X
#_03D66B: STA.w $0E12
#_03D66E: JSR BigMultiplication
#_03D671: LDA.w $0E14
#_03D674: CLC
#_03D675: ADC.w #$0005
#_03D678: STA.w $0E10
#_03D67B: LDA.w $0E16
#_03D67E: ADC.w #$0000
#_03D681: STA.w $0E12
#_03D684: JSR Shift_32bit_0E10_Right8Times
#_03D687: LDA.w $0E10
#_03D68A: CLC
#_03D68B: ADC.w $0A14
#_03D68E: STA.w $0A14
#_03D691: LDA.w $0E12
#_03D694: CLC
#_03D695: ADC.w $0A16
#_03D698: STA.w $0A16
#_03D69B: RTS

data03D69C:
#_03D69C: dw $0064,$0032,$0032,$001E
#_03D6A4: dw $000A,$0028,$0028,$0028
#_03D6AC: dw $0000,$0005,$0005,$0000
#_03D6B4: dw $0000,$0005,$0000,$0000

;===================================================================================================

routine03D6BC:
#_03D6BC: PHP

#_03D6BD: SEP #$30

#_03D6BF: AND.b #$0F
#_03D6C1: ASL A
#_03D6C2: STA.w $0E00

#_03D6C5: ASL A
#_03D6C6: CLC
#_03D6C7: ADC.w $0E00
#_03D6CA: TAY

#_03D6CB: SEP #$20

#_03D6CD: TXA
#_03D6CE: ASL A
#_03D6CF: STA.w $0A33
#_03D6D2: LDA.b #$06
#_03D6D4: STA.w $0E10

.next_char
#_03D6D7: LDA.w .texts,Y
#_03D6DA: JSL WriteNextMessageChar

#_03D6DE: INY
#_03D6DF: DEC.w $0E10
#_03D6E2: BNE .next_char

#_03D6E4: PLP
#_03D6E5: RTS

;---------------------------------------------------------------------------------------------------
; Duplicate of StatusConditionsText at $07EE66
;---------------------------------------------------------------------------------------------------
.texts
#_03D6E6: db $0E, $0F, $0B, $0E, $CF, $CF ; "DEAD  "
#_03D6EC: db $0E, $23, $13, $18, $11, $CF ; "DYING "
#_03D6F2: db $1D, $1E, $19, $18, $0F, $CF ; "STONE "
#_03D6F8: db $1A, $0B, $16, $23, $24, $0F ; "PALYZE"
#_03D6FE: db $1A, $19, $13, $1D, $19, $18 ; "POISON"
#_03D704: db $10, $16, $23, $CF, $CF, $CF ; "FLY   "
#_03D70A: db $10, $1C, $19, $11, $CF, $CF ; "FROG  "
#_03D710: db $0D, $1F, $1C, $1D, $0F, $CF ; "CURSE "
#_03D716: db $0D, $12, $0B, $1C, $17, $CF ; "CHARM "
#_03D71C: db $1D, $16, $0F, $0F, $1A, $CF ; "SLEEP "
#_03D722: db $0C, $13, $18, $0E, $CF, $CF ; "BIND  "
#_03D728: db $10, $1C, $0F, $0F, $24, $0F ; "FREEZE"
#_03D72E: db $1D, $12, $19, $0D, $15, $CF ; "SHOCK "
#_03D734: db $0D, $16, $19, $1D, $0F, $CF ; "CLOSE "
#_03D73A: db $1A, $0B, $18, $13, $0D, $CF ; "PANIC "
#_03D740: db $12, $0B, $1A, $1A, $23, $CF ; "HAPPY "

;===================================================================================================

routine03D746:
#_03D746: PHP

#_03D747: REP #$20

#_03D749: STA.w $0E10
#_03D74C: STZ.w $0E12
#_03D74F: JSL routine03D775

#_03D753: PLP
#_03D754: RTS

;===================================================================================================

routine03D775:
#_03D755: PHP
#_03D756: REP #$20
#_03D758: SEP #$10
#_03D75A: PHB

#_03D75B: SEP #$20
#_03D75D: LDA.b #routine03D775>>16
#_03D75F: PHA

#_03D760: REP #$20
#_03D762: PLB
#_03D763: JSL HexToDecForHUD

#_03D767: SEP #$20
#_03D769: TXA
#_03D76A: ASL A
#_03D76B: STA.w $0A33

.branch03D76E
#_03D76E: LDA.w $0E00,Y
#_03D771: JSL WriteSingleTileToMessageBuffer
#_03D775: DEY
#_03D776: BPL .branch03D76E

#_03D778: PLB
#_03D779: PLP
#_03D77A: RTL

;===================================================================================================

HexToDecForHUD:
#_03D77B: PHP
#_03D77C: REP #$30

#_03D77E: PHA
#_03D77F: PHX
#_03D780: PHY

#_03D781: PHD
#_03D782: PHB

#_03D783: REP #$20
#_03D785: SEP #$10

#_03D787: LDA.w #10
#_03D78A: STA.w $0E14
#_03D78D: STZ.w $0E16

#_03D790: LDX.b #$00

.next_digit
#_03D792: SEP #$30
#_03D794: JSR HexToDec32

#_03D797: LDA.w $0E18
#_03D79A: STA.w $0E00,X

#_03D79D: INX
#_03D79E: CPX.b #$06
#_03D7A0: BNE .next_digit

#_03D7A2: SEP #$30

#_03D7A4: STZ.w $0E06 ; tracks number of digits to write

#_03D7A7: LDX.b #$05

; increment digits by 1 to match VRAM character
.next_digit_b
#_03D7A9: LDA.w $0E00,X
#_03D7AC: BEQ .check_if_space

#_03D7AE: INC.w $0E06

.is_character
#_03D7B1: LDA.w $0E00,X
#_03D7B4: INC A

.add_tile
#_03D7B5: STA.w $0E00,X

#_03D7B8: DEX
#_03D7B9: BPL .next_digit_b

;---------------------------------------------------------------------------------------------------

#_03D7BB: REP #$30

#_03D7BD: PLB
#_03D7BE: PLD

#_03D7BF: PLY
#_03D7C0: PLX
#_03D7C1: PLA

#_03D7C2: PLP
#_03D7C3: RTL

;---------------------------------------------------------------------------------------------------

.check_if_space
#_03D7C4: SEP #$30

#_03D7C6: LDA.w $0E06 ; if $0E06 is 0, then we're not at the number yet
#_03D7C9: BNE .is_character

; if X is 0, then it's the 1s place digit, so it counts
#_03D7CB: CPX.b #$00
#_03D7CD: BEQ .is_character

#_03D7CF: LDA.b #$CF

#_03D7D1: BRA .add_tile

;===================================================================================================

routine03D7D3:
#_03D7D3: PHP
#_03D7D4: REP #$30
#_03D7D6: PHA
#_03D7D7: PHX
#_03D7D8: PHY
#_03D7D9: PHD
#_03D7DA: PHB

#_03D7DB: REP #$20
#_03D7DD: SEP #$10
#_03D7DF: LDA.w #$0010
#_03D7E2: STA.w $0E14
#_03D7E5: STZ.w $0E16
#_03D7E8: LDX.b #$00

.branch03D7EA
#_03D7EA: SEP #$30
#_03D7EC: JSR HexToDec32
#_03D7EF: LDA.w $0E18
#_03D7F2: STA.w $0E00,X
#_03D7F5: INX
#_03D7F6: CPX.b #$06
#_03D7F8: BNE .branch03D7EA

#_03D7FA: SEP #$30
#_03D7FC: STZ.w $0E06
#_03D7FF: LDX.b #$05

.branch03D801
#_03D801: LDA.w $0E00,X
#_03D804: BEQ HexToDecForHUD_check_if_space

#_03D806: INC.w $0E06

.branch03D809
#_03D809: LDA.w $0E00,X
#_03D80C: INC A

.branch03D80D
#_03D80D: STA.w $0E00,X
#_03D810: DEX
#_03D811: BPL .branch03D801

#_03D813: REP #$30
#_03D815: PLB
#_03D816: PLD
#_03D817: PLY
#_03D818: PLX
#_03D819: PLA
#_03D81A: PLP
#_03D81B: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED routine
#routine03D81C:
#_03D81C: SEP #$30
#_03D81E: LDA.w $0E06
#_03D821: BNE .branch03D809

#_03D823: CPX.b #$00
#_03D825: BEQ .branch03D809

#_03D827: LDA.b #$CF
#_03D829: BRA .branch03D80D

;===================================================================================================
; TODO figure out how this works probably
;===================================================================================================
HexToDec32:
#_03D82B: PHP
#_03D82C: REP #$30

#_03D82E: PHA
#_03D82F: PHX
#_03D830: PHY
#_03D831: PHD
#_03D832: PHB

#_03D833: REP #$30
#_03D835: LDX.w #$0020

#_03D838: STZ.w $0E18
#_03D83B: STZ.w $0E1A
#_03D83E: LDA.w $0E16
#_03D841: ORA.w $0E14

#_03D844: BEQ .branch03D88A

#_03D846: ROL.w $0E10
#_03D849: ROL.w $0E12

.branch03D84C
#_03D84C: ROL.w $0E18
#_03D84F: ROL.w $0E1A
#_03D852: LDA.w $0E1A
#_03D855: CMP.w $0E16
#_03D858: BCC .branch03D878
#_03D85A: BNE .branch03D864

#_03D85C: LDA.w $0E18
#_03D85F: CMP.w $0E14
#_03D862: BCC .branch03D878

.branch03D864
#_03D864: LDA.w $0E18
#_03D867: SEC
#_03D868: SBC.w $0E14
#_03D86B: STA.w $0E18
#_03D86E: LDA.w $0E1A
#_03D871: SBC.w $0E16
#_03D874: STA.w $0E1A
#_03D877: SEC

.branch03D878
#_03D878: ROL.w $0E10
#_03D87B: ROL.w $0E12
#_03D87E: DEX
#_03D87F: BNE .branch03D84C

#_03D881: REP #$30
#_03D883: PLB
#_03D884: PLD
#_03D885: PLY
#_03D886: PLX
#_03D887: PLA
#_03D888: PLP
#_03D889: RTS

.branch03D88A
#_03D88A: REP #$30
#_03D88C: PLB
#_03D88D: PLD
#_03D88E: PLY
#_03D88F: PLX
#_03D890: PLA
#_03D891: PLP
#_03D892: RTS

;===================================================================================================

routine03D893:
#_03D893: JSL DarkenScreen
#_03D897: JSL Reset_OAMrelatedWRAM

#_03D89B: SEP #$30
#_03D89D: LDA.b #$00
#_03D89F: JSL routine02F609
#_03D8A3: STZ.w $0A18
#_03D8A6: LDA.b #$00
#_03D8A8: STA.w NMITIMEN
#_03D8AB: STA.w $0F00
#_03D8AE: STA.w $0F7E
#_03D8B1: LDA.b #$80
#_03D8B3: STA.w INIDISP
#_03D8B6: STA.w $0F43

#_03D8B9: REP #$30
#_03D8BB: LDA.w #$4000
#_03D8BE: STA.w VMADDL
#_03D8C1: LDX.w #$07FF
#_03D8C4: LDA.w #$0000

.branch03D8C7
#_03D8C7: STA.w VMDATAL
#_03D8CA: DEX
#_03D8CB: BPL .branch03D8C7

#_03D8CD: SEP #$30
#_03D8CF: LDA.b #$3E
#_03D8D1: STA.w BG3SC
#_03D8D4: STA.w $0F49
#_03D8D7: LDA.b #$16
#_03D8D9: STA.w TM
#_03D8DC: STA.w $0F74
#_03D8DF: LDA.b #$FF
#_03D8E1: STA.w $0F7F
#_03D8E4: LDA.b #$81
#_03D8E6: STA.w NMITIMEN
#_03D8E9: STA.w $0F00
#_03D8EC: LDA.b #$06
#_03D8EE: JSL SomeDMAPrep_02CBD1

#_03D8F2: REP #$20
#_03D8F4: LDA.w #$3CE0
#_03D8F7: STA.w $0A0B

#_03D8FA: SEP #$20
#_03D8FC: LDA.b #$20
#_03D8FE: STA.w $0A0D
#_03D901: LDA.b #$1B
#_03D903: STA.w $0A0F
#_03D906: LDA.b #$11
#_03D908: STA.w $0A11
#_03D90B: JSL routine02BA95

#_03D90F: REP #$20
#_03D911: LDA.w #$3C67
#_03D914: STA.w $0A0B

#_03D917: SEP #$20
#_03D919: LDA.b #$12
#_03D91B: STA.w $0A0D
#_03D91E: LDA.b #$05
#_03D920: STA.w $0A0F
#_03D923: LDA.b #$11
#_03D925: STA.w $0A11
#_03D928: JSL routine02BA95

#_03D92C: REP #$20
#_03D92E: LDA.w #$3CE0
#_03D931: STA.w $0A0B
#_03D934: JSR AddTransferForTheWordMoney
#_03D937: JSL routine0F9720
#_03D93B: JSR routine03D413
#_03D93E: JSL BrightenScreen

#_03D942: SEP #$30
#_03D944: STZ.w $0BE0
#_03D947: STZ.w $0BE1
#_03D94A: LDX.b #$00
#_03D94C: LDA.b #$FF

.branch03D94E
#_03D94E: STA.w $0BA4,X
#_03D951: STA.w $0BB4,X
#_03D954: INX
#_03D955: CPX.b #$10
#_03D957: BNE .branch03D94E

#_03D959: JSR routine03D341

#_03D95C: REP #$20
#_03D95E: LDA.w $0405
#_03D961: PHA
#_03D962: LDA.w $0407
#_03D965: PHA

#_03D966: SEP #$20
#_03D968: STZ.w $0B3C
#_03D96B: STZ.w $0A58
#_03D96E: STZ.w $09F3

.branch03D971
#_03D971: SEP #$20
#_03D973: JSR AddTransferForTheWordMoney

#_03D976: REP #$20
#_03D978: LDA.w $0BE0
#_03D97B: CMP.w #$FFFF
#_03D97E: BEQ .branch03D9A1

#_03D980: SEP #$20
#_03D982: JSR routine03DA7B
#_03D985: JSR routine03DC83
#_03D988: JSR routine03DCDB

#_03D98B: REP #$20
#_03D98D: LDA.w $0A3B
#_03D990: BMI .branch03D9A1

#_03D992: BNE .branch03D971

#_03D994: SEP #$20
#_03D996: LDA.w $0B3C
#_03D999: INC A
#_03D99A: AND.b #$01
#_03D99C: STA.w $0B3C
#_03D99F: BRA .branch03D971

.branch03D9A1
#_03D9A1: REP #$20
#_03D9A3: PLA
#_03D9A4: STA.w $0E02
#_03D9A7: PLA
#_03D9A8: STA.w $0E00
#_03D9AB: JSR routine03DA28
#_03D9AE: JSL DarkenScreen
#_03D9B2: JSL routine00AB74

#_03D9B6: SEP #$30
#_03D9B8: LDA.b #$16
#_03D9BA: STA.w TM
#_03D9BD: STA.w $0F74
#_03D9C0: LDA.b #$3C
#_03D9C2: STA.w BG3SC
#_03D9C5: STA.w $0F49
#_03D9C8: STZ.w $0F7F
#_03D9CB: LDA.b #$18
#_03D9CD: STA.w $0A0D
#_03D9D0: LDA.b #$00
#_03D9D2: JSL routine02F609
#_03D9D6: LDA.b #$27
#_03D9D8: JSL routine02F609
#_03D9DC: LDA.b #$05
#_03D9DE: JSL SomeDMAPrep_02CBD1

#_03D9E2: REP #$20
#_03D9E4: LDA.w #$3DC4
#_03D9E7: STA.w $0A1A
#_03D9EA: STA.w $0980
#_03D9ED: LDA.w #$0018
#_03D9F0: STA.w $0A1E
#_03D9F3: LDA.w #$000C
#_03D9F6: STA.w $0A20
#_03D9F9: LDA.w #$0002
#_03D9FC: STA.w $0A1C
#_03D9FF: STZ.w $0A33

#_03DA02: SEP #$20
#_03DA04: LDA.w $07E1
#_03DA07: INC A
#_03DA08: STA.w $0A59
#_03DA0B: JSL routine02E32D
#_03DA0F: JSL routine0F84F6
#_03DA13: JSL routine00A17E
#_03DA17: JSL BrightenScreen

#_03DA1B: SEP #$20
#_03DA1D: LDA.b #$07
#_03DA1F: JSL InitializeTextBoxToSizeForNewMessage
#_03DA23: JSL routine00A056
#_03DA27: RTS

;===================================================================================================

routine03DA28:
#_03DA28: REP #$20
#_03DA2A: LDA.w $0E00
#_03DA2D: CMP.w $0405
#_03DA30: BNE .branch03DA3B

#_03DA32: LDA.w $0E02
#_03DA35: CMP.w $0407
#_03DA38: BNE .branch03DA3B

#_03DA3A: RTS

.branch03DA3B
#_03DA3B: SEP #$20
#_03DA3D: LDA.b #$FB
#_03DA3F: JSL TestGameProgressBit
#_03DA43: BCC .branch03DA46
#_03DA45: RTS

.branch03DA46
#_03DA46: LDA.w $07E1
#_03DA49: AND.b #$03
#_03DA4B: BEQ .branch03DA56

#_03DA4D: CMP.b #$01
#_03DA4F: BEQ .branch03DA68

#_03DA51: LDA.w $101C
#_03DA54: BPL .branch03DA68

.branch03DA56
#_03DA56: DEC.w $101C
#_03DA59: LDA.w $101C
#_03DA5C: CMP.b #$FF
#_03DA5E: BEQ .branch03DA61

#_03DA60: RTS

.branch03DA61
#_03DA61: STZ.w $101C
#_03DA64: STZ.w $107C
#_03DA67: RTS

.branch03DA68
#_03DA68: INC.w $101C
#_03DA6B: INC.w $107C
#_03DA6E: LDA.w $101C
#_03DA71: BEQ .branch03DA74

#_03DA73: RTS

.branch03DA74
#_03DA74: DEC.w $101C
#_03DA77: DEC.w $107C
#_03DA7A: RTS

;===================================================================================================

routine03DA7B:
#_03DA7B: REP #$30
#_03DA7D: LDA.w $0A0B
#_03DA80: CLC
#_03DA81: ADC.w #$0021
#_03DA84: STA.w $0980
#_03DA87: STZ.w $0BE5
#_03DA8A: STZ.w $0BE7
#_03DA8D: STZ.w $0BE9

#_03DA90: SEP #$30
#_03DA92: LDA.w $0B3C
#_03DA95: AND.b #$01
#_03DA97: TAY
#_03DA98: LDA.w $0BE0,Y
#_03DA9B: BPL .branch03DAA0

#_03DA9D: INC.w $0B3C

.branch03DAA0
#_03DAA0: LDA.w $0B3C
#_03DAA3: AND.b #$01
#_03DAA5: STA.w $0B3C
#_03DAA8: ASL A
#_03DAA9: ASL A
#_03DAAA: ASL A
#_03DAAB: ASL A
#_03DAAC: STA.w $0BE5
#_03DAAF: LDA.b #$0B
#_03DAB1: STA.w $0BE7
#_03DAB4: LDA.w $0BA3
#_03DAB7: BNE .branch03DACA

.branch03DAB9
#_03DAB9: JSR routine03DADB

#_03DABC: SEP #$20
#_03DABE: INC.w $0BE5
#_03DAC1: INC.w $0BE9
#_03DAC4: DEC.w $0BE7
#_03DAC7: BPL .branch03DAB9

#_03DAC9: RTS

.branch03DACA
#_03DACA: JSR routine03DBD6

#_03DACD: SEP #$20
#_03DACF: INC.w $0BE5
#_03DAD2: INC.w $0BE9
#_03DAD5: DEC.w $0BE7
#_03DAD8: BPL .branch03DACA

#_03DADA: RTS

;===================================================================================================

routine03DADB:
#_03DADB: JSR TextWhiteSpaceFill

#_03DADE: SEP #$20
#_03DAE0: STZ.w $0A33

#_03DAE3: REP #$30
#_03DAE5: LDA.w $0980
#_03DAE8: CLC
#_03DAE9: ADC.w #$0040
#_03DAEC: STA.w $0980
#_03DAEF: LDY.w $0BE5
#_03DAF2: LDA.w $0BA4,Y
#_03DAF5: AND.w #$00FF
#_03DAF8: CMP.w #$00FF
#_03DAFB: BNE .branch03DB00

#_03DAFD: JMP .branch03DBA2

.branch03DB00
#_03DB00: ASL A
#_03DB01: TAY
#_03DB02: LDA.w data03DBB6,Y
#_03DB05: STA.w $0BA1
#_03DB08: JSR routine03D569
#_03DB0B: JSR routine03D4CC

#_03DB0E: REP #$30
#_03DB10: LDY.w $0BE9
#_03DB13: LDA.w data03D4BE,Y
#_03DB16: JSL WriteSingleTileToMessageBuffer

#_03DB1A: SEP #$20
#_03DB1C: LDA.b #$06
#_03DB1E: STA.w $0A33
#_03DB21: JSR routine03DC5D

#_03DB24: REP #$30
#_03DB26: LDX.w $0BA1
#_03DB29: LDA.w $102E,X
#_03DB2C: LDX.w #$000C
#_03DB2F: LDY.w #$0002
#_03DB32: JSR routine03D746
#_03DB35: LDX.w $0BA1
#_03DB38: LDA.w $1030,X
#_03DB3B: LDX.w #$0010
#_03DB3E: LDY.w #$0002
#_03DB41: JSR routine03D746
#_03DB44: LDA.w #$001E
#_03DB47: STA.w $0A33
#_03DB4A: LDA.w #$005A
#_03DB4D: JSL WriteSingleTileToMessageBuffer
#_03DB51: LDX.w $0BA1
#_03DB54: LDA.w $1034,X
#_03DB57: BEQ .branch03DB67

#_03DB59: LDA.w $1032,X
#_03DB5C: LDX.w #$0014
#_03DB5F: LDY.w #$0002
#_03DB62: JSR routine03D746
#_03DB65: BRA .branch03DB82

.branch03DB67
#_03DB67: LDA.w #$0028
#_03DB6A: STA.w $0A33
#_03DB6D: LDA.w #$0093
#_03DB70: JSL WriteSingleTileToMessageBuffer
#_03DB74: LDA.w #$0093
#_03DB77: JSL WriteSingleTileToMessageBuffer
#_03DB7B: LDA.w #$0093
#_03DB7E: JSL WriteSingleTileToMessageBuffer

.branch03DB82
#_03DB82: REP #$30
#_03DB84: LDX.w #$0018
#_03DB87: JSR routine03D538

#_03DB8A: REP #$30
#_03DB8C: LDA.w $0A14
#_03DB8F: STA.w $0E10
#_03DB92: LDA.w $0A16
#_03DB95: STA.w $0E12
#_03DB98: LDX.w #$0019
#_03DB9B: LDY.w #$0004
#_03DB9E: JSL routine03D775

.branch03DBA2
#_03DBA2: SEP #$20
#_03DBA4: LDA.b #$3C
#_03DBA6: STA.w $0A33
#_03DBA9: JSR routine0384F9
#_03DBAC: JSL RunFramesUntilDrawBufferEmpties
#_03DBB0: LDA.b #$20
#_03DBB2: STA.w $0A2C
#_03DBB5: RTS

data03DBB6:
#_03DBB6: dw $0000,$0060,$00C0,$0120
#_03DBBE: dw $0180,$01E0,$0240,$02A0
#_03DBC6: dw $0300,$0360,$03C0,$0420
#_03DBCE: dw $0480,$04E0,$0540,$05A0

routine03DBD6:
#_03DBD6: JSR TextWhiteSpaceFill

#_03DBD9: SEP #$20
#_03DBDB: STZ.w $0A33

#_03DBDE: REP #$30
#_03DBE0: LDA.w $0980
#_03DBE3: CLC
#_03DBE4: ADC.w #$0040
#_03DBE7: STA.w $0980
#_03DBEA: LDY.w $0BE5
#_03DBED: LDA.w $0BA4,Y
#_03DBF0: AND.w #$00FF
#_03DBF3: CMP.w #$00FF
#_03DBF6: BNE .branch03DBFB

#_03DBF8: JMP .branch03DC49

.branch03DBFB
#_03DBFB: ASL A
#_03DBFC: TAY
#_03DBFD: LDA.w data03DBB6,Y
#_03DC00: STA.w $0BA1
#_03DC03: JSR routine03D61A
#_03DC06: JSR routine03D4CC

#_03DC09: REP #$30
#_03DC0B: LDY.w $0BE9
#_03DC0E: LDA.w data03D4BE,Y
#_03DC11: JSL WriteSingleTileToMessageBuffer

#_03DC15: SEP #$20
#_03DC17: LDA.b #$06
#_03DC19: STA.w $0A33
#_03DC1C: JSR routine03DC5D

#_03DC1F: SEP #$30
#_03DC21: JSR routine03D4FB
#_03DC24: LDX.b #$0D
#_03DC26: JSR routine03D6BC

#_03DC29: REP #$30
#_03DC2B: LDX.w #$0018
#_03DC2E: JSR routine03D538

#_03DC31: REP #$30
#_03DC33: LDA.w $0A14
#_03DC36: STA.w $0E10
#_03DC39: LDA.w $0A16
#_03DC3C: STA.w $0E12
#_03DC3F: LDX.w #$0019
#_03DC42: LDY.w #$0004
#_03DC45: JSL routine03D775

.branch03DC49
#_03DC49: SEP #$20
#_03DC4B: LDA.b #$3C
#_03DC4D: STA.w $0A33
#_03DC50: JSR routine0384F9
#_03DC53: JSL RunFramesUntilDrawBufferEmpties
#_03DC57: LDA.b #$20
#_03DC59: STA.w $0A2C
#_03DC5C: RTS

;===================================================================================================

routine03DC5D:
#_03DC5D: SEP #$20
#_03DC5F: LDA.b #$09
#_03DC61: STA.w $00C5

#_03DC64: REP #$30
#_03DC66: LDX.w $0BA1
#_03DC69: LDA.w $1004,X
#_03DC6C: BMI .branch03DC7B

#_03DC6E: STA.w $0A39
#_03DC71: LDA.w #DemonNamePointers
#_03DC74: STA.w $00C3
#_03DC77: JSR WriteIndexedEntityName
#_03DC7A: RTS

.branch03DC7B
#_03DC7B: AND.w #$0003
#_03DC7E: JSL WriteCharacterName
#_03DC82: RTS

;===================================================================================================

routine03DC83:
#_03DC83: SEP #$30
#_03DC85: LDA.b #$01
#_03DC87: STA.w $09F4
#_03DC8A: LDA.w $0BE0
#_03DC8D: CMP.b #$FF
#_03DC8F: BEQ .branch03DCA0

#_03DC91: LDA.w $0BE1
#_03DC94: CMP.b #$FF
#_03DC96: BEQ .branch03DCA0

#_03DC98: LDA.w $09F4
#_03DC9B: ORA.b #$80
#_03DC9D: STA.w $09F4

.branch03DCA0
#_03DCA0: LDA.b #$10
#_03DCA2: STA.w TS
#_03DCA5: STA.w $0F76
#_03DCA8: LDA.b #$04
#_03DCAA: STA.w CGADSUB
#_03DCAD: LDA.w $0B3C
#_03DCB0: AND.b #$01
#_03DCB2: TAX
#_03DCB3: LDA.w $0BE0,X
#_03DCB6: AND.b #$0F
#_03DCB8: STA.w $09F1
#_03DCBB: STZ.w $09F0
#_03DCBE: STZ.w $09F2
#_03DCC1: LDA.w $09F3
#_03DCC4: BMI .branch03DCD0

#_03DCC6: CMP.w $09F1
#_03DCC9: BCS .branch03DCD0

#_03DCCB: STZ.w $09F3
#_03DCCE: BRA .branch03DCD6

.branch03DCD0
#_03DCD0: LDA.w $09F1
#_03DCD3: STA.w $09F3

.branch03DCD6
#_03DCD6: JSL routine02C8E9
#_03DCDA: RTS

;===================================================================================================

routine03DCDB:
#_03DCDB: SEP #$20
#_03DCDD: STZ.w $0A3B

#_03DCE0: REP #$20
#_03DCE2: LDA.w $0F2B
#_03DCE5: AND.w #$8080
#_03DCE8: BNE .branch03DCEB

#_03DCEA: RTS

.branch03DCEB
#_03DCEB: SEP #$30
#_03DCED: LDA.w $09F3
#_03DCF0: BMI .branch03DD39

#_03DCF2: STZ.w $0A58
#_03DCF5: JSR routine03DD47
#_03DCF8: JSR routine03DDAD

#_03DCFB: SEP #$20
#_03DCFD: LDA.w $0A3B
#_03DD00: BMI .branch03DD21

#_03DD02: JSL routine0F96EE
#_03DD06: BCS .branch03DD2D

#_03DD08: JSR routine03DD6A
#_03DD0B: JSR routine03DDF2

.branch03DD0E
#_03DD0E: REP #$20
#_03DD10: LDA.w $0B3C
#_03DD13: AND.w #$0001
#_03DD16: TAX

#_03DD17: SEP #$20
#_03DD19: DEC.w $0BE0,X
#_03DD1C: BPL .branch03DD1F

#_03DD1E: RTS

.branch03DD1F
#_03DD1F: BRA .branch03DD27

.branch03DD21
#_03DD21: LDA.b #$04 ; SFX 04
#_03DD23: JSL WriteAPUCareful

.branch03DD27
#_03DD27: LDA.b #$01
#_03DD29: STA.w $0A3B
#_03DD2C: RTS

.branch03DD2D
#_03DD2D: SEP #$20
#_03DD2F: LDA.w $0A58
#_03DD32: BEQ .branch03DD27

#_03DD34: JSR routine03DD94
#_03DD37: BRA .branch03DD0E

.branch03DD39
#_03DD39: SEP #$20
#_03DD3B: LDA.b #$FF
#_03DD3D: STA.w $0A3B
#_03DD40: STA.w $0BE0
#_03DD43: STA.w $0BE1
#_03DD46: RTS

;===================================================================================================

routine03DD47:
#_03DD47: REP #$30

#_03DD49: LDA.w $0B3C
#_03DD4C: AND.w #$0001
#_03DD4F: ASL A ; x16
#_03DD50: ASL A
#_03DD51: ASL A
#_03DD52: ASL A
#_03DD53: CLC
#_03DD54: ADC.w $09F3
#_03DD57: AND.w #$001F
#_03DD5A: TAY

#_03DD5B: LDA.w $0BA4,Y
#_03DD5E: AND.w #$00FF
#_03DD61: ASL A
#_03DD62: TAY

#_03DD63: LDA.w data03DBB6,Y
#_03DD66: STA.w $0BA1

#_03DD69: RTS

;===================================================================================================

routine03DD6A:
#_03DD6A: SEP #$30

#_03DD6C: LDA.w $0B3C
#_03DD6F: AND.b #$01
#_03DD71: ASL A ; x16
#_03DD72: ASL A
#_03DD73: ASL A
#_03DD74: ASL A
#_03DD75: CLC
#_03DD76: ADC.w $09F3
#_03DD79: AND.b #$1F
#_03DD7B: TAX

#_03DD7C: LDY.b #$00

.next
#_03DD7E: LDA.w $0BA5,X
#_03DD81: STA.w $0BA4,X

#_03DD84: CMP.b #$FF
#_03DD86: BEQ .exit

#_03DD88: INX
#_03DD89: INY
#_03DD8A: CPY.b #$0C
#_03DD8C: BNE .next

#_03DD8E: LDA.b #$FF
#_03DD90: STA.w $0BA4,X

.exit
#_03DD93: RTS

;===================================================================================================

routine03DD94:
#_03DD94: JSR routine03DD6A

#_03DD97: REP #$30
#_03DD99: LDX.w $0BA1
#_03DD9C: CPX.w #$0180
#_03DD9F: BCS .branch03DDA2

#_03DDA1: RTS

.branch03DDA2
#_03DDA2: LDA.w #$0000
#_03DDA5: STA.w $1000,X
#_03DDA8: JSL routine0F853F

#_03DDAC: RTS

;===================================================================================================

routine03DDAD:
#_03DDAD: REP #$30
#_03DDAF: LDA.w $0BA3
#_03DDB2: AND.w #$000F
#_03DDB5: BNE .branch03DDBC

#_03DDB7: JSR routine03D569
#_03DDBA: BRA .branch03DDBF

.branch03DDBC
#_03DDBC: JSR routine03D61A

.branch03DDBF
#_03DDBF: REP #$30
#_03DDC1: LDA.w $0405
#_03DDC4: SEC
#_03DDC5: SBC.w $0A14
#_03DDC8: STA.w $0405
#_03DDCB: LDA.w $0407
#_03DDCE: SBC.w $0A16
#_03DDD1: STA.w $0407
#_03DDD4: BMI .branch03DDD7

#_03DDD6: RTS

.branch03DDD7
#_03DDD7: LDA.w $0405
#_03DDDA: CLC
#_03DDDB: ADC.w $0A14
#_03DDDE: STA.w $0405
#_03DDE1: LDA.w $0407
#_03DDE4: ADC.w $0A16
#_03DDE7: STA.w $0407

#_03DDEA: SEP #$20
#_03DDEC: LDA.b #$FF
#_03DDEE: STA.w $0A3B
#_03DDF1: RTS

;===================================================================================================

routine03DDF2:
#_03DDF2: REP #$30

#_03DDF4: LDX.w $0BA1

#_03DDF7: LDA.w $0BA3
#_03DDFA: AND.w #$00FF
#_03DDFD: ASL A
#_03DDFE: TAY

#_03DDFF: LDA.w .vectors,Y
#_03DE02: STA.w $00E0

#_03DE05: JMP ($00E0)

.vectors
#_03DE08: dw routine03DE10
#_03DE0A: dw routine03DE2E
#_03DE0C: dw routine03DE38
#_03DE0E: dw routine03DE42

;===================================================================================================

routine03DE10:
#_03DE10: LDA.w $102E,X
#_03DE13: CMP.w $1030,X
#_03DE16: BCS .branch03DE1E

#_03DE18: LDA.w $1030,X
#_03DE1B: STA.w $102E,X

.branch03DE1E
#_03DE1E: LDA.w $1032,X
#_03DE21: CMP.w $1034,X
#_03DE24: BCC .branch03DE27

#_03DE26: RTS

.branch03DE27
#_03DE27: LDA.w $1034,X
#_03DE2A: STA.w $1032,X
#_03DE2D: RTS

;===================================================================================================

routine03DE2E:
#_03DE2E: LDA.w $1002,X
#_03DE31: AND.w #$C700
#_03DE34: STA.w $1002,X
#_03DE37: RTS

;===================================================================================================

routine03DE38:
#_03DE38: LDA.w $1002,X
#_03DE3B: AND.w #$F8FF
#_03DE3E: STA.w $1002,X
#_03DE41: RTS

;===================================================================================================

routine03DE42:
#_03DE42: LDA.w $1002,X
#_03DE45: AND.w #$3FFF
#_03DE48: STA.w $1002,X

#_03DE4B: LDA.w #$0001
#_03DE4E: STA.w $102E,X

#_03DE51: RTS

;===================================================================================================

AddTransferForTheWordMoney:
#_03DE52: REP #$30

#_03DE54: LDA.w #$3C88
#_03DE57: STA.w $0102

#_03DE5A: LDA.w #$000E
#_03DE5D: STA.w $0104

#_03DE60: LDX.w #$0000
#_03DE63: TXY

.next_letter_of_money
#_03DE64: LDA.w TheWordMoney,Y
#_03DE67: AND.w #$00FF
#_03DE6A: ORA.w #$2000
#_03DE6D: STA.w $0106,X

#_03DE70: INX
#_03DE71: INX

#_03DE72: INY
#_03DE73: CPY.w #$0006
#_03DE76: BNE .next_letter_of_money

#_03DE78: JSR GetCorrectCurrencyCharacter

#_03DE7B: REP #$30

#_03DE7D: AND.w #$00FF
#_03DE80: ORA.w #$2000
#_03DE83: STA.w $0112

#_03DE86: LDA.w #$20CF
#_03DE89: STA.w $0114

#_03DE8C: LDX.w #$0016
#_03DE8F: JSL routine02BC0D

#_03DE93: LDA.w #$0001
#_03DE96: STA.w $0100

#_03DE99: JSL RunFramesUntilDrawBufferEmpties

#_03DE9D: RTS

;===================================================================================================

TheWordMoney:
#_03DE9E: db $17, $19, $18, $0F, $23, $9A ; "MONEY:"

;===================================================================================================

TextExtCMD_51:
#_03DEA4: REP #$30
#_03DEA6: STZ.w $0E00
#_03DEA9: STZ.w $0E02
#_03DEAC: STZ.w $0E04
#_03DEAF: LDY.w #$0002
#_03DEB2: LDA.w $0A3B
#_03DEB5: AND.w #$0001
#_03DEB8: BEQ .branch03DEC0

#_03DEBA: LDY.w #$0004
#_03DEBD: LDX.w #$0000

.branch03DEC0
#_03DEC0: LDA.w $0C05,Y
#_03DEC3: STA.w $0E00,X
#_03DEC6: INX
#_03DEC7: INX
#_03DEC8: DEY
#_03DEC9: DEY
#_03DECA: BPL .branch03DEC0

#_03DECC: LDX.w #$0180

.branch03DECF
#_03DECF: CPX.w $0E00
#_03DED2: BEQ .branch03DEEB

#_03DED4: CPX.w $0E02
#_03DED7: BEQ .branch03DEEB

#_03DED9: CPX.w $0E04
#_03DEDC: BEQ .branch03DEEB

#_03DEDE: LDA.w $1000,X
#_03DEE1: BPL .branch03DEEB

#_03DEE3: LDA.w $1004,X
#_03DEE6: CMP.w $050A
#_03DEE9: BEQ .branch03DEFA

.branch03DEEB
#_03DEEB: TXA
#_03DEEC: CLC
#_03DEED: ADC.w #$0060
#_03DEF0: TAX
#_03DEF1: CMP.w #$0600
#_03DEF4: BNE .branch03DECF

.branch03DEF6
#_03DEF6: JSR GetNextTextByte
#_03DEF9: RTS

.branch03DEFA
#_03DEFA: SEP #$30
#_03DEFC: LDA.w $0A3B
#_03DEFF: CMP.b #$02
#_03DF01: BNE .branch03DF11

#_03DF03: LDA.w $0C2B
#_03DF06: CMP.b #$F5
#_03DF08: BEQ .branch03DEF6

#_03DF0A: LDA.w $0C2D
#_03DF0D: CMP.b #$F5
#_03DF0F: BEQ .branch03DEF6

.branch03DF11
#_03DF11: JSR GetNextTextByte
#_03DF14: JSR ChangeMessageID

#_03DF17: RTS

;===================================================================================================

TextExtCMD_50:
#_03DF18: REP #$30

#_03DF1A: JSL routine0F9B8A
#_03DF1E: JSL routine0F9BB1

#_03DF22: RTS

;===================================================================================================

TextExtCMD_1E:
#_03DF23: REP #$30
#_03DF25: LDX.w #$0016
#_03DF28: LDA.w #$0000

.branch03DF2B
#_03DF2B: STA.w $0BED,X
#_03DF2E: DEX
#_03DF2F: DEX
#_03DF30: BPL .branch03DF2B

#_03DF32: JSR routine03DFBD
#_03DF35: BCC .branch03DF45

#_03DF37: SEP #$20
#_03DF39: LDA.b #$FF
#_03DF3B: STA.w $0A58
#_03DF3E: JSR GetNextTextByte
#_03DF41: JSR ChangeMessageID
#_03DF44: RTS

.branch03DF45
#_03DF45: JSR routine03F9F5

.branch03DF48
#_03DF48: JSR routine03E0C5
#_03DF4B: JSR routine03E0F4
#_03DF4E: JSR routine03FB22

#_03DF51: SEP #$30
#_03DF53: LDX.b #$00

.branch03DF55
#_03DF55: PHX
#_03DF56: PHP
#_03DF57: JSR routine03E1AB
#_03DF5A: JSR routine03E369
#_03DF5D: JSR routine03E1E7
#_03DF60: JSR routine03DFF7

#_03DF63: SEP #$30
#_03DF65: INC.w $0B3C
#_03DF68: DEC.w $0B3D
#_03DF6B: PLP
#_03DF6C: PLX
#_03DF6D: LDA.w $0A58
#_03DF70: BEQ .branch03DF75

#_03DF72: JMP .branch03DFB2

.branch03DF75
#_03DF75: INX
#_03DF76: CPX.w $0A3B
#_03DF79: BNE .branch03DF55

#_03DF7B: REP #$30
#_03DF7D: LDX.w #$0004

.branch03DF80
#_03DF80: LDA.w $0C2B,X
#_03DF83: STA.w $0BED,X
#_03DF86: LDA.w $0C31,X
#_03DF89: STA.w $0BF3,X
#_03DF8C: DEX
#_03DF8D: DEX
#_03DF8E: BPL .branch03DF80

#_03DF90: LDA.w #$0001
#_03DF93: STA.w $0C37
#_03DF96: JSR routine03EA77
#_03DF99: LDA.w $0C0B
#_03DF9C: STA.w $050A
#_03DF9F: STA.w $050A
#_03DFA2: LDA.w $0C0D
#_03DFA5: STA.w $0506
#_03DFA8: STA.w $0506

.branch03DFAB
#_03DFAB: JSR routine03FAAE
#_03DFAE: JSR GetNextTextByte
#_03DFB1: RTS

.branch03DFB2
#_03DFB2: SEP #$20
#_03DFB4: LDA.w $0B3C
#_03DFB7: DEC A
#_03DFB8: BEQ .branch03DFAB

#_03DFBA: JMP .branch03DF48

routine03DFBD:
#_03DFBD: REP #$30
#_03DFBF: STZ.w $0E00
#_03DFC2: LDX.w #$0180

.branch03DFC5
#_03DFC5: LDA.w $1000,X
#_03DFC8: AND.w #$8000
#_03DFCB: BEQ .branch03DFD8

#_03DFCD: LDA.w $1002,X
#_03DFD0: AND.w #$F640
#_03DFD3: BNE .branch03DFD8

#_03DFD5: INC.w $0E00

.branch03DFD8
#_03DFD8: TXA
#_03DFD9: CLC
#_03DFDA: ADC.w #$0060
#_03DFDD: TAX
#_03DFDE: CPX.w #$0600
#_03DFE1: BNE .branch03DFC5

#_03DFE3: JSL routine0F8F05
#_03DFE7: BCC .branch03DFEC

#_03DFE9: INC.w $0E00

.branch03DFEC
#_03DFEC: LDA.w $0A3B
#_03DFEF: DEC A
#_03DFF0: AND.w #$00FF
#_03DFF3: CMP.w $0E00

#_03DFF6: RTS

;===================================================================================================

routine03DFF7:
#_03DFF7: SEP #$30
#_03DFF9: LDA.b #$10
#_03DFFB: STA.w TS
#_03DFFE: STA.w $0F76
#_03E001: LDA.b #$04
#_03E003: STA.w CGADSUB
#_03E006: LDX.w $0B3C
#_03E009: LDA.w data03E0BA,X
#_03E00C: STA.w $09F4
#_03E00F: STZ.w $09F2
#_03E012: STZ.w $09F3
#_03E015: STZ.w $09F0
#_03E018: LDA.w $0B5F
#_03E01B: DEC A
#_03E01C: STA.w $09F1
#_03E01F: JSL routine02C8E9

#_03E023: SEP #$30
#_03E025: LDA.w $0A58
#_03E028: BPL .branch03E02B

#_03E02A: RTS

.branch03E02B
#_03E02B: SEP #$30
#_03E02D: LDA.w $0B3C
#_03E030: INC A
#_03E031: CMP.w $0A3B
#_03E034: BNE .branch03E047

#_03E036: LDA.w $09F3
#_03E039: ASL A
#_03E03A: TAY
#_03E03B: LDA.w $0B61,Y
#_03E03E: CMP.b #$06
#_03E040: BNE .branch03E047

#_03E042: LDA.b #$FF
#_03E044: STA.w $0A58

.branch03E047
#_03E047: REP #$20
#_03E049: LDA.w $09F3
#_03E04C: ASL A
#_03E04D: TAY
#_03E04E: LDA.w $0B3C
#_03E051: AND.w #$0003
#_03E054: ASL A
#_03E055: TAX
#_03E056: LDA.w $098C,Y
#_03E059: STA.w $0BED,X
#_03E05C: STA.w $0C2B,X
#_03E05F: LDA.w $09AC,Y
#_03E062: STA.w $0BF3,X
#_03E065: STA.w $0C31,X
#_03E068: LDA.w $0C13,Y
#_03E06B: STA.w $0C05,X

#_03E06E: REP #$30
#_03E070: LDA.w $0B3C
#_03E073: STA.w $0E00

.branch03E076
#_03E076: LDA.w $0E00
#_03E079: AND.w #$0003
#_03E07C: BEQ .branch03E092

#_03E07E: DEC A
#_03E07F: ASL A
#_03E080: TAX
#_03E081: LDA.w $0C2B,X
#_03E084: STA.w $0BED,X
#_03E087: LDA.w $0C31,X
#_03E08A: STA.w $0BF3,X
#_03E08D: DEC.w $0E00
#_03E090: BRA .branch03E076

.branch03E092
#_03E092: REP #$30
#_03E094: TYX
#_03E095: INY
#_03E096: INY

.branch03E097
#_03E097: TYA
#_03E098: LSR A
#_03E099: CMP.w $0B5F
#_03E09C: BEQ .branch03E0B6

#_03E09E: LDA.w $098C,Y
#_03E0A1: STA.w $098C,X
#_03E0A4: LDA.w $09AC,Y
#_03E0A7: STA.w $09AC,X
#_03E0AA: LDA.w $0C13,Y
#_03E0AD: STA.w $0C13,X
#_03E0B0: INY
#_03E0B1: INY
#_03E0B2: INX
#_03E0B3: INX
#_03E0B4: BRA .branch03E097

.branch03E0B6
#_03E0B6: DEC.w $0B5F
#_03E0B9: RTS

data03E0BA:
#_03E0BA: db $02,$08,$09

;---------------------------------------------------------------------------------------------------

routine03E0C5_long:
#_03E0BD: PHB
#_03E0BE: PHK
#_03E0BF: PLB

#_03E0C0: JSR routine03E0C5

#_03E0C3: PLB
#_03E0C4: RTL

;===================================================================================================

routine03E0C5:
#_03E0C5: PHP
#_03E0C6: SEP #$20

#_03E0C8: STZ.w $0B5F

#_03E0CB: REP #$30

#_03E0CD: LDX.w #$0180
#_03E0D0: LDY.w #$0000

.next_teammate
#_03E0D3: LDA.w $1000,X
#_03E0D6: BPL .skip_teammate

#_03E0D8: LDA.w $1002,X
#_03E0DB: AND.w #$F640
#_03E0DE: BNE .skip_teammate

#_03E0E0: INC.w $0B5F

.skip_teammate
#_03E0E3: TXA
#_03E0E4: CLC
#_03E0E5: ADC.w #$0060
#_03E0E8: TAX
#_03E0E9: CPX.w #$0600
#_03E0EC: BNE .next_teammate

#_03E0EE: JSL routine0F8F26

#_03E0F2: PLP
#_03E0F3: RTS

;===================================================================================================

routine03E0F4:
#_03E0F4: PHP
#_03E0F5: REP #$30
#_03E0F7: LDY.w #$0000
#_03E0FA: LDX.w #$0180

.branch03E0FD
#_03E0FD: LDA.w $1000,X
#_03E100: BPL .branch03E11C

#_03E102: LDA.w $1002,X
#_03E105: AND.w #$F640
#_03E108: BNE .branch03E11C

#_03E10A: LDA.w $1004,X
#_03E10D: STA.w $098C,Y
#_03E110: LDA.w $1006,X
#_03E113: STA.w $09AC,Y
#_03E116: TXA
#_03E117: STA.w $0C13,Y
#_03E11A: INY
#_03E11B: INY

.branch03E11C
#_03E11C: TXA
#_03E11D: CLC
#_03E11E: ADC.w #$0060
#_03E121: TAX
#_03E122: CMP.w #$0600
#_03E125: BNE .branch03E0FD

#_03E127: JSL routine0F8F34
#_03E12B: PLP
#_03E12C: RTS

;===================================================================================================

routine03E12D:
#_03E12D: PHP
#_03E12E: SEP #$30
#_03E130: LDX.b #$00
#_03E132: TXY

.branch03E133
#_03E133: SEP #$20
#_03E135: STZ.w $0E00
#_03E138: STZ.w $0E01
#_03E13B: LDA.w $0781,X
#_03E13E: BEQ .branch03E18C

#_03E140: LDA.w $0780,X
#_03E143: CMP.b #$19
#_03E145: BEQ .branch03E15C

#_03E147: INC.w $0E00
#_03E14A: CMP.b #$1D
#_03E14C: BEQ .branch03E15C

#_03E14E: INC.w $0E00
#_03E151: CMP.b #$38
#_03E153: BEQ .branch03E15C

#_03E155: INC.w $0E00
#_03E158: CMP.b #$2A
#_03E15A: BNE .branch03E18C

.branch03E15C
#_03E15C: REP #$20
#_03E15E: PHX
#_03E15F: LDA.w $0E00
#_03E162: ASL A
#_03E163: TAX
#_03E164: LDA.w data03E19B,X
#_03E167: STA.w $0E00
#_03E16A: PLX
#_03E16B: PHY

.branch03E16C
#_03E16C: DEY
#_03E16D: DEY
#_03E16E: BMI .branch03E17D

#_03E170: LDA.w $098C,Y
#_03E173: CMP.w $0E00
#_03E176: BEQ .branch03E17A

#_03E178: BRA .branch03E16C

.branch03E17A
#_03E17A: PLY
#_03E17B: BRA .branch03E18C

.branch03E17D
#_03E17D: PLY
#_03E17E: LDA.w $0E00
#_03E181: STA.w $098C,Y
#_03E184: LDA.w #$0026
#_03E187: STA.w $09AC,Y
#_03E18A: INY
#_03E18B: INY

.branch03E18C
#_03E18C: SEP #$20
#_03E18E: INX
#_03E18F: INX
#_03E190: CPX.b #$40
#_03E192: BNE .branch03E133

#_03E194: TYA
#_03E195: LSR A
#_03E196: STA.w $0B5F
#_03E199: PLP
#_03E19A: RTS

data03E19B:
#_03E19B: dw $012F,$0130,$0131,$012B
#_03E1A3: dw $0132,$012C,$012D,$012E

;===================================================================================================

routine03E1AB:
#_03E1AB: SEP #$10
#_03E1AD: REP #$20

#_03E1AF: LDX.b #$20
#_03E1B1: STX.w $0A2C

#_03E1B4: LDA.w $0B3C
#_03E1B7: AND.w #$00FF
#_03E1BA: STA.w $0A39

#_03E1BD: LDA.w #FusionOptionPointers>>0
#_03E1C0: STA.w $00C3

#_03E1C3: LDA.w #$3CC4
#_03E1C6: STA.w $0980

#_03E1C9: JSR routine03E6DF

#_03E1CC: SEP #$20

#_03E1CE: LDA.b #FusionOptionPointers>>16
#_03E1D0: STA.w $00C5
#_03E1D3: STZ.w $0A33

#_03E1D6: JSR WriteIndexedEntityName

#_03E1D9: LDA.b #$16
#_03E1DB: ASL A
#_03E1DC: STA.w $0A33

#_03E1DF: JSR routine0384F9
#_03E1E2: JSL RunFramesUntilDrawBufferEmpties

#_03E1E6: RTS

;===================================================================================================

routine03E1E7:
#_03E1E7: REP #$20
#_03E1E9: LDA.w $0B5F
#_03E1EC: BNE .branch03E1EF

#_03E1EE: RTS

.branch03E1EF
#_03E1EF: LDA.w $0A0B
#_03E1F2: CLC
#_03E1F3: ADC.w #$0061
#_03E1F6: STA.w $0980

#_03E1F9: SEP #$20
#_03E1FB: LDA.w $0B3C
#_03E1FE: BEQ .branch03E203

#_03E200: JSR routine03E41C

.branch03E203
#_03E203: REP #$30
#_03E205: LDX.w #$0000

.branch03E208
#_03E208: REP #$30
#_03E20A: PHX

#_03E20B: SEP #$20
#_03E20D: LDA.b #$20
#_03E20F: STA.w $0A2C
#_03E212: STZ.w $0A33
#_03E215: JSR routine03E6DF
#_03E218: CPX.w $0B5F
#_03E21B: BCC .branch03E220

#_03E21D: JMP .branch03E342

.branch03E220
#_03E220: REP #$20
#_03E222: LDA.w TheNumbers1Through12,X
#_03E225: JSL WriteSingleTileToMessageBuffer

#_03E229: SEP #$20
#_03E22B: LDA.b #$04
#_03E22D: STA.w $0A33
#_03E230: LDA.b #ClassNamePointers>>16
#_03E232: STA.w $00C5

#_03E235: REP #$20
#_03E237: TXA
#_03E238: ASL A
#_03E239: TAX
#_03E23A: LDA.w #ClassNamePointers>>0
#_03E23D: STA.w $00C3
#_03E240: LDA.w $09AC,X
#_03E243: AND.w #$00FF
#_03E246: STA.w $0506
#_03E249: STA.w $0A39
#_03E24C: PHP
#_03E24D: REP #$30
#_03E24F: PHA
#_03E250: PHX
#_03E251: PHY
#_03E252: PHD
#_03E253: PHB
#_03E254: JSR WriteIndexedEntityName

#_03E257: REP #$30
#_03E259: PLB
#_03E25A: PLD
#_03E25B: PLY
#_03E25C: PLX
#_03E25D: PLA
#_03E25E: PLP

#_03E25F: SEP #$20
#_03E261: LDA.b #$10
#_03E263: STA.w $0A33
#_03E266: LDA.b #$CF
#_03E268: JSL WriteNextMessageChar
#_03E26C: LDA.b #$12
#_03E26E: STA.w $0A33
#_03E271: LDA.b #DemonNamePointers>>16
#_03E273: STA.w $00C5

#_03E276: REP #$20
#_03E278: LDA.w #DemonNamePointers>>0
#_03E27B: STA.w $00C3
#_03E27E: LDA.w $098C,X
#_03E281: STA.w $0A39
#_03E284: PHP
#_03E285: REP #$30
#_03E287: PHA
#_03E288: PHX
#_03E289: PHY
#_03E28A: PHD
#_03E28B: PHB
#_03E28C: JSR WriteIndexedEntityName

#_03E28F: REP #$30
#_03E291: PLB
#_03E292: PLD
#_03E293: PLY
#_03E294: PLX
#_03E295: PLA
#_03E296: PLP
#_03E297: PHP
#_03E298: REP #$30
#_03E29A: PHA
#_03E29B: PHX
#_03E29C: PHY
#_03E29D: PHD
#_03E29E: PHB
#_03E29F: TXA
#_03E2A0: LSR A
#_03E2A1: CMP.w $0B5F
#_03E2A4: BCS .branch03E2A9

#_03E2A6: JSR routine03E51A

.branch03E2A9
#_03E2A9: REP #$30
#_03E2AB: PLB
#_03E2AC: PLD
#_03E2AD: PLY
#_03E2AE: PLX
#_03E2AF: PLA
#_03E2B0: PLP

;---------------------------------------------------------------------------------------------------

#_03E2B1: REP #$20

; TODO secret >+R+A to check for demon preview
#_03E2B3: LDA.w $0F2D
#_03E2B6: AND.w #$0110
#_03E2B9: CMP.w #$0110
#_03E2BC: BNE .branch03E2F7

#_03E2BE: SEP #$20
#_03E2C0: LDA.w $0B3C
#_03E2C3: INC A
#_03E2C4: CMP.w $0A3B
#_03E2C7: BNE .branch03E2F7

#_03E2C9: LDA.b #$28
#_03E2CB: STA.w $0A33

#_03E2CE: LDA.b #DemonNamePointers>>16
#_03E2D0: STA.w $00C5

#_03E2D3: REP #$20
#_03E2D5: LDA.w #DemonNamePointers>>0
#_03E2D8: STA.w $00C3

#_03E2DB: LDA.w $0C0B
#_03E2DE: AND.w #$00FF
#_03E2E1: STA.w $0A39

#_03E2E4: PHP
#_03E2E5: REP #$30
#_03E2E7: PHA
#_03E2E8: PHX
#_03E2E9: PHY
#_03E2EA: PHD
#_03E2EB: PHB

#_03E2EC: JSR WriteIndexedEntityName

#_03E2EF: REP #$30
#_03E2F1: PLB
#_03E2F2: PLD
#_03E2F3: PLY
#_03E2F4: PLX
#_03E2F5: PLA
#_03E2F6: PLP

;---------------------------------------------------------------------------------------------------

.branch03E2F7
#_03E2F7: REP #$20
#_03E2F9: LDA.w $0F2D
#_03E2FC: AND.w #$0220
#_03E2FF: CMP.w #$0220
#_03E302: BNE .branch03E342

#_03E304: SEP #$20
#_03E306: LDA.w $0B3C
#_03E309: INC A
#_03E30A: CMP.w $0A3B
#_03E30D: BNE .branch03E342

#_03E30F: LDA.b #$28
#_03E311: STA.w $0A33
#_03E314: LDA.b #ClassNamePointers>>16
#_03E316: STA.w $00C5

#_03E319: REP #$20
#_03E31B: LDA.w #ClassNamePointers>>0
#_03E31E: STA.w $00C3
#_03E321: LDA.w $0C0D
#_03E324: AND.w #$00FF
#_03E327: CMP.w #$00FF
#_03E32A: BEQ .branch03E342

#_03E32C: STA.w $0A39
#_03E32F: PHP
#_03E330: REP #$30
#_03E332: PHA
#_03E333: PHX
#_03E334: PHY
#_03E335: PHD
#_03E336: PHB
#_03E337: JSR WriteIndexedEntityName

#_03E33A: REP #$30
#_03E33C: PLB
#_03E33D: PLD
#_03E33E: PLY
#_03E33F: PLX
#_03E340: PLA
#_03E341: PLP

.branch03E342
#_03E342: SEP #$20
#_03E344: LDA.b #$3C
#_03E346: STA.w $0A33
#_03E349: JSR routine0384F9
#_03E34C: JSL RunFramesUntilDrawBufferEmpties

#_03E350: REP #$20
#_03E352: LDA.w $0980
#_03E355: CLC
#_03E356: ADC.w #$0040
#_03E359: STA.w $0980
#_03E35C: PLX
#_03E35D: INX

#_03E35E: SEP #$10
#_03E360: CPX.w $0B3D
#_03E363: BEQ .exit

#_03E365: JMP .branch03E208

.exit
#_03E368: RTS

;===================================================================================================

routine03E369:
#_03E369: JSL RunFramesUntilDrawBufferEmpties

#_03E36D: REP #$30
#_03E36F: LDA.w $0A0B
#_03E372: CLC
#_03E373: ADC.w #$0021
#_03E376: STA.w $0102
#_03E379: LDA.w #$001E
#_03E37C: STA.w $0104
#_03E37F: LDY.w #$0000
#_03E382: LDX.w #$0000

.branch03E385
#_03E385: LDA.w data03E3EC,Y
#_03E388: AND.w #$00FF
#_03E38B: ORA.w #$2000
#_03E38E: STA.w $0106,X
#_03E391: INY
#_03E392: INX
#_03E393: INX
#_03E394: CPY.w #$001E
#_03E397: BNE .branch03E385

#_03E399: SEP #$20
#_03E39B: LDA.w $0B3C
#_03E39E: INC A
#_03E39F: CMP.w $0A3B
#_03E3A2: BEQ .branch03E3CF

#_03E3A4: BCS .branch03E3C2

#_03E3A6: REP #$20
#_03E3A8: SEP #$10
#_03E3AA: LDY.b #$00
#_03E3AC: LDX.b #$24

.branch03E3AE
#_03E3AE: LDA.w TheNumbers1Through12,Y
#_03E3B1: AND.w #$00FF
#_03E3B4: ORA.w #$2000
#_03E3B7: STA.w $0106,X
#_03E3BA: INX
#_03E3BB: INX
#_03E3BC: INY
#_03E3BD: CPY.w $0B5F
#_03E3C0: BNE .branch03E3AE

.branch03E3C2
#_03E3C2: REP #$30
#_03E3C4: LDA.w #$0001
#_03E3C7: STA.w $0100
#_03E3CA: JSL RunFramesUntilDrawBufferEmpties
#_03E3CE: RTS

.branch03E3CF
#_03E3CF: REP #$20
#_03E3D1: SEP #$10
#_03E3D3: LDY.b #$00
#_03E3D5: LDX.b #$24

.branch03E3D7
#_03E3D7: LDA.w data03E416,Y
#_03E3DA: AND.w #$00FF
#_03E3DD: ORA.w #$2000
#_03E3E0: STA.w $0106,X
#_03E3E3: INX
#_03E3E4: INX
#_03E3E5: INY
#_03E3E6: CPY.b #$06
#_03E3E8: BNE .branch03E3D7

#_03E3EA: BRA .branch03E3C2

data03E3EC:
#_03E3EC: db $A0,$CF,$0D,$16,$0B,$1D,$1D,$CF
#_03E3F4: db $CF,$18,$0B,$17,$0F,$CF,$CF,$CF
#_03E3FC: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_03E404: db $CF,$CF,$CF,$CF,$CF,$CF

;===================================================================================================

TheNumbers1Through12:
#_03E40A: db $02 ;  1
#_03E40B: db $03 ;  2
#_03E40C: db $04 ;  3
#_03E40D: db $05 ;  4
#_03E40E: db $06 ;  5
#_03E40F: db $07 ;  6
#_03E410: db $08 ;  7
#_03E411: db $09 ;  8
#_03E412: db $0A ;  9
#_03E413: db $A2 ; 10
#_03E414: db $A3 ; 11
#_03E415: db $A4 ; 12

;===================================================================================================

data03E416:
#_03E416: db $1C,$0F,$1D,$1F,$16,$1E

;===================================================================================================

routine03E41C:
#_03E41C: SEP #$30
#_03E41E: LDA.b #$38
#_03E420: STA.w $0A2C
#_03E423: LDX.b #$00
#_03E425: LDY.b #$00

.branch03E427
#_03E427: PHX

#_03E428: SEP #$20

#_03E42A: JSR routine03E6DF
#_03E42D: STZ.w $0A33

#_03E430: LDA.b #$B1 ; ◎
#_03E432: JSL WriteSingleTileToMessageBuffer

#_03E436: LDA.b #$04
#_03E438: STA.w $0A33
#_03E43B: LDA.b #ClassNamePointers>>16
#_03E43D: STA.w $00C5

#_03E440: REP #$20
#_03E442: LDA.w #ClassNamePointers>>0
#_03E445: STA.w $00C3
#_03E448: LDA.w $0BF3,X
#_03E44B: AND.w #$00FF
#_03E44E: STA.w $0A39
#_03E451: PHP
#_03E452: REP #$30
#_03E454: PHA
#_03E455: PHX
#_03E456: PHY
#_03E457: PHD
#_03E458: PHB
#_03E459: JSR WriteIndexedEntityName

#_03E45C: REP #$30
#_03E45E: PLB
#_03E45F: PLD
#_03E460: PLY
#_03E461: PLX
#_03E462: PLA
#_03E463: PLP

#_03E464: SEP #$20
#_03E466: LDA.b #$10
#_03E468: STA.w $0A33
#_03E46B: LDA.b #$CF
#_03E46D: JSL WriteNextMessageChar
#_03E471: LDA.b #$12
#_03E473: STA.w $0A33
#_03E476: LDA.w $0BF3,X
#_03E479: CMP.b #$25
#_03E47B: BEQ .branch03E4A5

#_03E47D: LDA.b #$09
#_03E47F: STA.w $00C5

#_03E482: REP #$20
#_03E484: LDA.w #DemonNamePointers
#_03E487: STA.w $00C3
#_03E48A: LDA.w $0BED,X
#_03E48D: STA.w $0A39
#_03E490: PHP
#_03E491: REP #$30
#_03E493: PHA
#_03E494: PHX
#_03E495: PHY
#_03E496: PHD
#_03E497: PHB
#_03E498: JSR WriteIndexedEntityName

#_03E49B: REP #$30
#_03E49D: PLB
#_03E49E: PLD
#_03E49F: PLY
#_03E4A0: PLX
#_03E4A1: PLA
#_03E4A2: PLP
#_03E4A3: BRA .branch03E4BB

.branch03E4A5
#_03E4A5: REP #$20
#_03E4A7: PHP
#_03E4A8: REP #$30
#_03E4AA: PHA
#_03E4AB: PHX
#_03E4AC: PHY
#_03E4AD: PHD
#_03E4AE: PHB
#_03E4AF: JSL TextCommand_Write_him_Name_long

#_03E4B3: REP #$30
#_03E4B5: PLB
#_03E4B6: PLD
#_03E4B7: PLY
#_03E4B8: PLX
#_03E4B9: PLA
#_03E4BA: PLP

.branch03E4BB
#_03E4BB: SEP #$20
#_03E4BD: LDA.b #FusionOptionPointers>>16
#_03E4BF: STA.w $00C5
#_03E4C2: LDA.b #$24
#_03E4C4: STA.w $0A33
#_03E4C7: TYA
#_03E4C8: CLC
#_03E4C9: ADC.b #$04

#_03E4CB: REP #$20
#_03E4CD: AND.w #$00FF
#_03E4D0: STA.w $0A39
#_03E4D3: LDA.w #FusionOptionPointers>>0
#_03E4D6: STA.w $00C3
#_03E4D9: PHP
#_03E4DA: REP #$30
#_03E4DC: PHA
#_03E4DD: PHX
#_03E4DE: PHY
#_03E4DF: PHD
#_03E4E0: PHB
#_03E4E1: JSR WriteIndexedEntityName

#_03E4E4: REP #$30
#_03E4E6: PLB
#_03E4E7: PLD
#_03E4E8: PLY
#_03E4E9: PLX
#_03E4EA: PLA
#_03E4EB: PLP

#_03E4EC: SEP #$20
#_03E4EE: LDA.b #$3C
#_03E4F0: STA.w $0A33
#_03E4F3: JSR routine0384F9
#_03E4F6: JSL RunFramesUntilDrawBufferEmpties

#_03E4FA: REP #$20
#_03E4FC: LDA.w $0980
#_03E4FF: CLC
#_03E500: ADC.w #$0040
#_03E503: STA.w $0980
#_03E506: PLX
#_03E507: INX
#_03E508: INX
#_03E509: INY
#_03E50A: CPY.w $0B3C
#_03E50D: BEQ .branch03E512

#_03E50F: JMP .branch03E427

.branch03E512
#_03E512: SEP #$20

#_03E514: LDA.b #$20
#_03E516: STA.w $0A2C

#_03E519: RTS

;===================================================================================================
; TODO fusion listings
; 098C = demon ids
;===================================================================================================
routine03E51A:
#_03E51A: SEP #$20
#_03E51C: LDA.w $0A3B
#_03E51F: CMP.b #$03
#_03E521: BNE .branch03E526

#_03E523: JMP .branch03E5A9

.branch03E526
#_03E526: LDA.b #$24
#_03E528: STA.w $0A33
#_03E52B: LDA.w $0B3C
#_03E52E: BNE .branch03E585

#_03E530: REP #$30
#_03E532: LDY.w #$0000
#_03E535: TXA
#_03E536: LSR A
#_03E537: TAX
#_03E538: STX.w $0E00

.branch03E53B
#_03E53B: PHX
#_03E53C: PHY
#_03E53D: LDA.w $0E00
#_03E540: PHA
#_03E541: PHP
#_03E542: CPY.w $0E00
#_03E545: BEQ .skip_self

#_03E547: TXA
#_03E548: ASL A
#_03E549: TAX
#_03E54A: TYA
#_03E54B: ASL A
#_03E54C: TAY

#_03E54D: LDA.w $098C,X
#_03E550: STA.w $0BED

#_03E553: LDA.w $098C,Y
#_03E556: STA.w $0BEF

#_03E559: SEP #$20
#_03E55B: LDA.b #$20
#_03E55D: STA.w $0A2C
#_03E560: JSR DetermineFusionCompatibility

.branch03E563
#_03E563: SEP #$20
#_03E565: JSL WriteSingleTileToMessageBuffer
#_03E569: PLP
#_03E56A: PLA
#_03E56B: STA.w $0E00
#_03E56E: PLY
#_03E56F: PLX
#_03E570: INY
#_03E571: CPY.w $0B5F
#_03E574: BEQ .exit

#_03E576: JMP .branch03E53B

.exit
#_03E579: RTS

;---------------------------------------------------------------------------------------------------

.skip_self
#_03E57A: SEP #$20
#_03E57C: LDA.b #$34
#_03E57E: STA.w $0A2C
#_03E581: LDA.b #$5A
#_03E583: BRA .branch03E563

.branch03E585
#_03E585: PHP
#_03E586: PHX
#_03E587: PHP
#_03E588: REP #$30
#_03E58A: LDA.w $0C2B
#_03E58D: STA.w $0BED
#_03E590: LDA.w $098C,X
#_03E593: STA.w $0BEF
#_03E596: JSR DetermineFusionCompatibility
#_03E599: JSL WriteSingleTileToMessageBuffer
#_03E59D: PLP
#_03E59E: PLX

#_03E59F: SEP #$20
#_03E5A1: LDA.w $0C11
#_03E5A4: STA.w $0B61,X
#_03E5A7: PLP
#_03E5A8: RTS

.branch03E5A9
#_03E5A9: LDA.b #$24
#_03E5AB: STA.w $0A33
#_03E5AE: LDA.w $0B3C
#_03E5B1: BNE .branch03E5B4

#_03E5B3: RTS

.branch03E5B4
#_03E5B4: CMP.b #$01
#_03E5B6: BNE .branch03E616

#_03E5B8: REP #$30
#_03E5BA: LDY.w #$0000
#_03E5BD: TXA
#_03E5BE: LSR A
#_03E5BF: TAX
#_03E5C0: STX.w $0E00

.branch03E5C3
#_03E5C3: PHX
#_03E5C4: PHY
#_03E5C5: LDA.w $0E00
#_03E5C8: PHA
#_03E5C9: PHP
#_03E5CA: CPY.w $0E00
#_03E5CD: BNE .branch03E5D2

#_03E5CF: JMP .branch03E60B

.branch03E5D2
#_03E5D2: TXA
#_03E5D3: ASL A
#_03E5D4: TAX
#_03E5D5: TYA
#_03E5D6: ASL A
#_03E5D7: TAY
#_03E5D8: LDA.w $098C,X
#_03E5DB: STA.w $0BED
#_03E5DE: LDA.w $098C,Y
#_03E5E1: STA.w $0BEF
#_03E5E4: LDA.w $0C2B
#_03E5E7: STA.w $0BF1

#_03E5EA: SEP #$20
#_03E5EC: LDA.b #$20
#_03E5EE: STA.w $0A2C
#_03E5F1: JSR DetermineFusionCompatibility

.branch03E5F4
#_03E5F4: SEP #$20
#_03E5F6: JSL WriteSingleTileToMessageBuffer
#_03E5FA: PLP
#_03E5FB: PLA
#_03E5FC: STA.w $0E00
#_03E5FF: PLY
#_03E600: PLX
#_03E601: INY
#_03E602: CPY.w $0B5F
#_03E605: BEQ .EXIT_03E60A

#_03E607: JMP .branch03E5C3

.EXIT_03E60A
#_03E60A: RTS

.branch03E60B
#_03E60B: SEP #$20
#_03E60D: LDA.b #$34
#_03E60F: STA.w $0A2C
#_03E612: LDA.b #$5A
#_03E614: BRA .branch03E5F4

.branch03E616
#_03E616: PHP
#_03E617: PHX
#_03E618: PHP
#_03E619: REP #$30
#_03E61B: LDA.w $0C2B
#_03E61E: STA.w $0BED
#_03E621: LDA.w $0C2D
#_03E624: STA.w $0BEF
#_03E627: LDA.w $098C,X
#_03E62A: STA.w $0BF1
#_03E62D: JSR DetermineFusionCompatibility
#_03E630: JSL WriteSingleTileToMessageBuffer
#_03E634: PLP
#_03E635: PLX

#_03E636: SEP #$20
#_03E638: LDA.w $0C11
#_03E63B: STA.w $0B61,X
#_03E63E: PLP
#_03E63F: RTS

;===================================================================================================
; TODO
;===================================================================================================
DetermineFusionCompatibility:
#_03E640: REP #$30
#_03E642: LDA.w $0A3B
#_03E645: AND.w #$00FF
#_03E648: CMP.w #$0002
#_03E64B: BEQ .fusing_2

#_03E64D: JSR routine03F258
#_03E650: BRA .get_symbol

.fusing_2
#_03E652: JSR routine03EA83

.get_symbol
#_03E655: JSR routine03E690
#_03E658: LDA.w $0C11
#_03E65B: ASL A
#_03E65C: TAY
#_03E65D: LDA.w .dumb_vectors,Y
#_03E660: STA.w $00E0

#_03E663: SEP #$20
#_03E665: JMP ($00E0)

; Just... why?
.dumb_vectors
#_03E668: dw .load_circle
#_03E66A: dw .load_refmark
#_03E66C: dw .load_numeral_1
#_03E66E: dw .load_numeral_2
#_03E670: dw .load_letter_x
#_03E672: dw .load_question_mark
#_03E674: dw .load_middle_dot
#_03E676: dw .load_letter_D

.load_circle
#_03E678: LDA.b #$A9 ; ⭘
#_03E67A: RTS

.load_refmark
#_03E67B: LDA.b #$AA ; ※
#_03E67D: RTS

.load_numeral_1
#_03E67E: LDA.b #$02 ; 1
#_03E680: RTS

.load_numeral_2
#_03E681: LDA.b #$03 ; 2
#_03E683: RTS

.load_letter_x
#_03E684: LDA.b #$22 ; X
#_03E686: RTS

.load_question_mark
#_03E687: LDA.b #$95 ; ?
#_03E689: RTS

.load_middle_dot
#_03E68A: LDA.b #$93 ; ・
#_03E68C: RTS

.load_letter_D
#_03E68D: LDA.b #$0E ; D
#_03E68F: RTS

;===================================================================================================

routine03E690:
#_03E690: REP #$30
#_03E692: LDA.w $0A3B
#_03E695: AND.w #$00FF
#_03E698: CMP.w #$0002
#_03E69B: BNE .branch03E6AB

#_03E69D: LDA.w $0C11
#_03E6A0: CMP.w #$0002
#_03E6A3: BCC .branch03E6AB

#_03E6A5: CMP.w #$0005
#_03E6A8: BCS .branch03E6AB

#_03E6AA: RTS

.branch03E6AB
#_03E6AB: LDA.w $0C11
#_03E6AE: CMP.w #$0005
#_03E6B1: BNE .branch03E6B4

#_03E6B3: RTS

.branch03E6B4
#_03E6B4: STZ.w $0C11
#_03E6B7: LDA.w $0C0B
#_03E6BA: CMP.w #$FFFF
#_03E6BD: BEQ .branch03E6D8

#_03E6BF: LDA.w $0C0D
#_03E6C2: CMP.w #$0019
#_03E6C5: BCS .branch03E6D1

#_03E6C7: CMP.w #$000A
#_03E6CA: BEQ .branch03E6CD

#_03E6CC: RTS

.branch03E6CD
#_03E6CD: INC.w $0C11
#_03E6D0: RTS

.branch03E6D1
#_03E6D1: LDA.w #$0007
#_03E6D4: STA.w $0C11
#_03E6D7: RTS

.branch03E6D8
#_03E6D8: LDA.w #$0006
#_03E6DB: STA.w $0C11
#_03E6DE: RTS

;===================================================================================================

routine03E6DF:
#_03E6DF: PHP
#_03E6E0: REP #$30

#_03E6E2: PHA
#_03E6E3: PHX
#_03E6E4: PHY
#_03E6E5: PHD
#_03E6E6: PHB

#_03E6E7: SEP #$30

#_03E6E9: LDX.b #$00

#_03E6EB: STZ.w $0A33

.next_space
#_03E6EE: LDA.b #$CF
#_03E6F0: JSL WriteNextMessageChar

#_03E6F4: INX
#_03E6F5: CPX.b #$1E
#_03E6F7: BNE .next_space

#_03E6F9: STZ.w $0A33

#_03E6FC: REP #$30

#_03E6FE: PLB
#_03E6FF: PLD
#_03E700: PLY
#_03E701: PLX
#_03E702: PLA

#_03E703: PLP
#_03E704: RTS

;===================================================================================================

GetDemonXClass:
#_03E705: PHX
#_03E706: PHY

#_03E707: PHP
#_03E708: REP #$30

#_03E70A: AND.w #$00FF
#_03E70D: ASL A
#_03E70E: TAX

#_03E70F: PHX

#_03E710: LDA.w $0BED,X
#_03E713: CMP.w #$0100
#_03E716: BCS .is_boss

#_03E718: LDX.w #$0000

#_03E71B: SEP #$20

.search_for_class
#_03E71D: CMP.w ClassCutoffs,X
#_03E720: BCC .class_discovered

#_03E722: INX
#_03E723: CPX.w #$0024
#_03E726: BNE .search_for_class

.class_discovered
#_03E728: TXA

;---------------------------------------------------------------------------------------------------

.set_class
#_03E729: PLX

#_03E72A: STA.w $0BF3,X
#_03E72D: TAY

#_03E72E: LDA.b #$00
#_03E730: STA.w $0BF4,X
#_03E733: STA.w $0BFA,X

#_03E736: LDA.w data03E7A6,Y
#_03E739: STA.w $0BF9,X

#_03E73C: PLP
#_03E73D: PLY
#_03E73E: PLX

#_03E73F: RTS

;---------------------------------------------------------------------------------------------------

.is_boss
#_03E740: SEC
#_03E741: SBC.w #$0100
#_03E744: TAX

#_03E745: LDA.w BossClasses,X

#_03E748: SEP #$20
#_03E74A: BRA .set_class

;===================================================================================================

; It seems that classes are in order
; So class 00 is from 0 to 5, etc
ClassCutoffs:
#_03E74C: db $06,$0B,$13,$1F,$23,$2A,$30,$35
#_03E754: db $39,$3E,$46,$4E,$59,$62,$72,$80
#_03E75C: db $86,$8A,$94,$9A,$A1,$AC,$AF,$B3
#_03E764: db $B9,$BD,$C2,$C9,$CD,$D3,$DC,$E5
#_03E76C: db $EC,$F3,$F9,$FF

BossClasses:
#_03E770: db $0F,$1E,$25,$25,$00,$25,$25,$03
#_03E778: db $0B,$1A,$0F,$23,$05,$05,$02,$03
#_03E780: db $1B,$19,$00,$02,$02,$04,$04,$04
#_03E788: db $1A,$1A,$1A,$25,$25,$0D,$1A,$04
#_03E790: db $02,$13,$13,$00,$00,$00,$00,$00
#_03E798: db $00,$00,$00,$26,$26,$26,$26,$26
#_03E7A0: db $26,$26,$26,$00,$24,$25

; TODO SOMETHING WITH CLASSES
data03E7A6:
#_03E7A6: db $00,$00,$01,$01,$03,$03,$04,$05
#_03E7AE: db $06,$06,$08,$01,$02,$02,$02,$03
#_03E7B6: db $04,$05,$06,$07,$07,$07,$0B,$0B
#_03E7BE: db $0B,$01,$02,$04,$05,$06,$07,$09
#_03E7C6: db $09,$09,$0A,$0C,$00,$00,$00,$00

;===================================================================================================

data03E7CE:
#_03E7CE: db $FF,$40,$FF,$FF,$FF,$01,$02,$05
#_03E7D6: db $06,$10,$41,$01,$01,$0C,$0D,$02
#_03E7DE: db $03,$0F,$08,$03,$13,$14,$12,$43
#_03E7E6: db $44,$40,$FF,$FF,$FF,$FF,$0F,$0B
#_03E7EE: db $05,$06,$10,$41,$0E,$02,$15,$0C
#_03E7F6: db $02,$06,$0F,$08,$0B,$13,$14,$10
#_03E7FE: db $43,$44,$FF,$FF,$FF,$40,$FF,$22
#_03E806: db $03,$05,$06,$10,$41,$40,$01,$0F
#_03E80E: db $0C,$0C,$06,$0F,$08,$03,$13,$14
#_03E816: db $1B,$43,$44,$FF,$FF,$40,$FF,$02
#_03E81E: db $0B,$02,$10,$06,$10,$41,$40,$0B
#_03E826: db $0F,$0B,$0D,$06,$0B,$08,$06,$10
#_03E82E: db $13,$08,$43,$44,$FF,$FF,$FF,$02
#_03E836: db $FF,$40,$02,$01,$06,$08,$41,$01
#_03E83E: db $00,$00,$05,$40,$06,$07,$09,$0C
#_03E846: db $0C,$0E,$14,$43,$44,$01,$0F,$22
#_03E84E: db $0B,$40,$82,$02,$01,$06,$08,$41
#_03E856: db $01,$0F,$0F,$01,$40,$09,$07,$09
#_03E85E: db $0C,$0C,$0E,$14,$43,$44,$02,$0B
#_03E866: db $03,$02,$02,$02,$FF,$02,$10,$10
#_03E86E: db $41,$03,$0B,$10,$08,$1B,$40,$03
#_03E876: db $10,$03,$13,$1B,$02,$43,$44,$01
#_03E87E: db $05,$22,$10,$01,$01,$02,$82,$06
#_03E886: db $08,$41,$14,$10,$1C,$05,$0C,$06
#_03E88E: db $40,$09,$08,$0D,$1D,$12,$43,$44
#_03E896: db $06,$06,$06,$06,$06,$06,$10,$06
#_03E89E: db $80,$40,$41,$03,$16,$12,$10,$0C
#_03E8A6: db $07,$07,$40,$03,$10,$10,$10,$43
#_03E8AE: db $44,$10,$10,$10,$10,$08,$08,$10
#_03E8B6: db $08,$40,$84,$41,$10,$1B,$16,$12
#_03E8BE: db $12,$08,$07,$40,$08,$12,$12,$1D
#_03E8C6: db $43,$44,$41,$41,$41,$41,$41,$41
#_03E8CE: db $41,$41,$41,$41,$42,$41,$41,$41
#_03E8D6: db $41,$41,$41,$41,$41,$41,$41,$41
#_03E8DE: db $41,$43,$44,$01,$0E,$40,$40,$01
#_03E8E6: db $01,$03,$14,$03,$10,$41,$81,$0D
#_03E8EE: db $0F,$0D,$13,$01,$0C,$08,$10,$13
#_03E8F6: db $14,$1B,$43,$44,$01,$02,$01,$0B
#_03E8FE: db $00,$0F,$0B,$10,$16,$1B,$41,$0D
#_03E906: db $85,$40,$40,$0D,$07,$0F,$14,$0B
#_03E90E: db $13,$14,$12,$43,$44,$0C,$15,$0F
#_03E916: db $0F,$00,$0F,$10,$1C,$12,$16,$41
#_03E91E: db $0F,$40,$87,$40,$0C,$1B,$1C,$1D
#_03E926: db $0B,$1E,$20,$1F,$43,$44,$0D,$0C
#_03E92E: db $0C,$0B,$05,$01,$08,$05,$10,$12
#_03E936: db $41,$0D,$40,$40,$86,$05,$09,$0F
#_03E93E: db $09,$0B,$0C,$14,$14,$43,$44,$02
#_03E946: db $02,$0C,$0D,$40,$40,$1B,$0C,$0C
#_03E94E: db $12,$41,$13,$0D,$0C,$05,$84,$0B
#_03E956: db $0D,$16,$0B,$1F,$1E,$1D,$43,$44
#_03E95E: db $03,$06,$06,$06,$06,$08,$40,$06
#_03E966: db $07,$08,$41,$01,$07,$1B,$09,$0B
#_03E96E: db $81,$0B,$09,$03,$13,$14,$12,$43
#_03E976: db $44,$0F,$0F,$0F,$0B,$07,$07,$03
#_03E97E: db $40,$07,$07,$41,$0C,$0F,$1C,$0F
#_03E986: db $0D,$0B,$86,$14,$0B,$0F,$1C,$14
#_03E98E: db $43,$44,$08,$08,$08,$08,$09,$08
#_03E996: db $10,$09,$40,$40,$41,$08,$14,$1D
#_03E99E: db $09,$16,$09,$14,$84,$16,$13,$09
#_03E9A6: db $09,$43,$44,$03,$0B,$03,$06,$0C
#_03E9AE: db $0C,$03,$08,$03,$08,$41,$10,$0B
#_03E9B6: db $0B,$0B,$0B,$03,$0B,$16,$83,$40
#_03E9BE: db $40,$03,$43,$44,$13,$13,$13,$10
#_03E9C6: db $0C,$0C,$13,$0D,$10,$12,$41,$13
#_03E9CE: db $13,$1E,$0C,$1F,$13,$0F,$13,$40
#_03E9D6: db $83,$40,$0C,$43,$44,$14,$14,$14
#_03E9DE: db $13,$0E,$0E,$1B,$1D,$10,$12,$41
#_03E9E6: db $14,$14,$20,$14,$1E,$14,$1C,$09
#_03E9EE: db $40,$40,$87,$0E,$43,$44,$12,$10
#_03E9F6: db $1B,$08,$14,$14,$02,$12,$10,$1D
#_03E9FE: db $41,$1B,$12,$1F,$14,$1D,$12,$14
#_03EA06: db $09,$03,$0C,$0E,$FF,$43,$44,$43
#_03EA0E: db $43,$43,$43,$43,$43,$43,$43,$43
#_03EA16: db $43,$43,$43,$43,$43,$43,$43,$43
#_03EA1E: db $43,$43,$43,$43,$43,$43,$FF,$FF
#_03EA26: db $44,$44,$44,$44,$44,$44,$44,$44
#_03EA2E: db $44,$44,$44,$44,$44,$44,$44,$44
#_03EA36: db $44,$44,$44,$44,$44,$44,$44,$FF
#_03EA3E: db $FF

;===================================================================================================

GetDemonXLevel:
#_03EA3F: REP #$30

#_03EA41: ASL A
#_03EA42: TAX

#_03EA43: PHX

#_03EA44: LDA.w $0BED,X
#_03EA47: STA.w $0E10

#_03EA4A: LDA.w #$0018
#_03EA4D: STA.w $0E11

#_03EA50: JSR SmallMultiplication

#_03EA53: LDX.w $0E12
#_03EA56: LDA.l DemonStats,X

#_03EA5A: PLX

#_03EA5B: AND.w #$00FF
#_03EA5E: STA.w $0BFF,X

#_03EA61: RTS

;===================================================================================================

routine03EA62:
#_03EA62: REP #$30

#_03EA64: LDA.w #$FFFF
#_03EA67: STA.w $0C0B
#_03EA6A: STA.w $0C0D
#_03EA6D: STA.w $0C0F

#_03EA70: LDA.w #$0006
#_03EA73: STA.w $0C11

#_03EA76: RTS

;===================================================================================================

routine03EA77:
#_03EA77: SEP #$20

#_03EA79: LDA.w $0A3B
#_03EA7C: CMP.b #$03
#_03EA7E: BNE routine03EA83

#_03EA80: JMP routine03F258

;===================================================================================================

routine03EA83:
#_03EA83: LDA.w $0BED
#_03EA86: PHA
#_03EA87: LDA.w $0BEF
#_03EA8A: PHA
#_03EA8B: PHP
#_03EA8C: JSL routine0F8F55
#_03EA90: BCS .branch03EA8D

#_03EA92: JSR routine03EAAA
#_03EA95: JSR routine03EFCB
#_03EA98: BCC .branch03EA8D

#_03EA9A: JSR routine03EA62

.branch03EA8D
#_03EA9D: PLP
#_03EA9E: PLA
#_03EA9F: STA.w $0BEF
#_03EAA2: PLA
#_03EAA3: STA.w $0BED
#_03EAA6: JSR routine03F230
#_03EAA9: RTS

;===================================================================================================

routine03EAAA:
#_03EAAA: REP #$30
#_03EAAC: STZ.w $0B4F
#_03EAAF: STZ.w $0C11
#_03EAB2: JSR routine03F03F
#_03EAB5: CMP.w #$FFFF
#_03EAB8: BEQ routine03EA62

#_03EABA: LDA.w #$0000
#_03EABD: JSR GetDemonXLevel
#_03EAC0: LDA.w #$0001
#_03EAC3: JSR GetDemonXLevel

#_03EAC6: LDA.w #$0000
#_03EAC9: JSR GetDemonXClass
#_03EACC: LDA.w #$0001
#_03EACF: JSR GetDemonXClass

#_03EAD2: JSR routine03F945

#_03EAD5: LDA.w $0BED
#_03EAD8: CMP.w $0BEF
#_03EADB: BNE .different_demons

#_03EADD: JMP routine03F853

.different_demons
#_03EAE0: LDA.w $0BF3
#_03EAE3: CMP.w #$0019
#_03EAE6: BCC .demon1_below_vile

#_03EAE8: JMP FusionWithVilePlus

.demon1_below_vile
#_03EAEB: LDA.w $0BF5
#_03EAEE: CMP.w #$0019
#_03EAF1: BCC .demon2_below_vile

#_03EAF3: JMP FusionWithVilePlus

.demon2_below_vile
#_03EAF6: LDA.w $0BF3
#_03EAF9: STA.w $0E10
#_03EAFC: LDA.w #$0019
#_03EAFF: STA.w $0E11
#_03EB02: JSR SmallMultiplication
#_03EB05: LDA.w $0E12
#_03EB08: CLC
#_03EB09: ADC.w $0BF5
#_03EB0C: TAX

; TODO some fusion table
#_03EB0D: LDA.w data03E7CE,X
#_03EB10: AND.w #$00FF
#_03EB13: STA.w $0C0D
#_03EB16: CMP.w #$00FF
#_03EB19: BNE .branch03EB1E

#_03EB1B: JMP routine03EA62

.branch03EB1E
#_03EB1E: BIT.w #$0040
#_03EB21: BNE .branch03EB52

#_03EB23: BIT.w #$0080
#_03EB26: BNE .branch03EB41

#_03EB28: STA.w $0BF9
#_03EB2B: LDA.w $0BFF
#_03EB2E: CLC
#_03EB2F: ADC.w $0C01
#_03EB32: LSR A
#_03EB33: CLC
#_03EB34: ADC.w #$0002
#_03EB37: STA.w $0C39
#_03EB3A: LDX.w $0C0D
#_03EB3D: JSR routine03EF23
#_03EB40: RTS

.branch03EB41
#_03EB41: AND.w #$000F
#_03EB44: CLC
#_03EB45: ADC.w #$003E
#_03EB48: STA.w $0C0B
#_03EB4B: LDA.w #$000A
#_03EB4E: STA.w $0C0D
#_03EB51: RTS

.branch03EB52
#_03EB52: AND.w #$000F
#_03EB55: ASL A
#_03EB56: TAY

#_03EB57: LDA.w .vectors,Y
#_03EB5A: STA.w $00E0

#_03EB5D: JMP ($00E0)

.vectors
#_03EB60: dw routine03EB6A
#_03EB62: dw routine03EC0C
#_03EB64: dw routine03ED92
#_03EB66: dw routine03EE16
#_03EB68: dw routine00EE9C

;===================================================================================================

routine03EB6A:
#_03EB6A: LDA.w #$FFFF
#_03EB6D: STA.w $0C39
#_03EB70: LDA.w $0BF9
#_03EB73: ASL A
#_03EB74: ASL A
#_03EB75: TAY
#_03EB76: LDX.w #$0000

.branch03EB79
#_03EB79: LDA.w data03EBD8,Y
#_03EB7C: AND.w #$00FF
#_03EB7F: CMP.w #$00FF
#_03EB82: BEQ .branch03EBB8

#_03EB84: PHX
#_03EB85: TAX
#_03EB86: LDA.w $0BFF
#_03EB89: CLC
#_03EB8A: ADC.w $0C01
#_03EB8D: LSR A
#_03EB8E: CLC
#_03EB8F: ADC.w #$0003
#_03EB92: JSR routine03EF6D
#_03EB95: LDA.w $0C0F
#_03EB98: CMP.w #$FFFF
#_03EB9B: BEQ .branch03EBB1

#_03EB9D: CMP.w $0C39
#_03EBA0: BCS .branch03EBB1

#_03EBA2: STA.w $0C39
#_03EBA5: LDA.w $0C0D
#_03EBA8: STA.w $0C3B
#_03EBAB: LDA.w $0C0B
#_03EBAE: STA.w $0C3D

.branch03EBB1
#_03EBB1: PLX
#_03EBB2: LDA.w $0C0F
#_03EBB5: STA.w $0C3F,X

.branch03EBB8
#_03EBB8: INY
#_03EBB9: INX
#_03EBBA: CPX.w #$0004
#_03EBBD: BNE .branch03EB79

#_03EBBF: LDA.w $0C39
#_03EBC2: CMP.w #$FFFF
#_03EBC5: BEQ .exit

#_03EBC7: STA.w $0C0F
#_03EBCA: LDA.w $0C3B
#_03EBCD: STA.w $0C0D
#_03EBD0: LDA.w $0C3D
#_03EBD3: STA.w $0C0B
#_03EBD6: RTS

.exit
#_03EBD7: RTS

data03EBD8:
#_03EBD8: db $00,$01,$FF,$FF,$02,$03,$0B,$19
#_03EBE0: db $1A,$0C,$0D,$0E,$04,$05,$0F,$FF
#_03EBE8: db $06,$10,$1B,$FF,$07,$11,$1C,$FF
#_03EBF0: db $08,$09,$12,$1D,$13,$14,$15,$1E
#_03EBF8: db $0A,$FF,$FF,$FF,$1F,$20,$21,$FF
#_03EC00: db $22,$FF,$FF,$FF,$16,$17,$18,$FF
#_03EC08: db $23,$FF,$FF,$FF

;===================================================================================================

routine03EC0C:
#_03EC0C: LDA.w $0BF3
#_03EC0F: CMP.w #$000A
#_03EC12: BNE .branch03EC2C

#_03EC14: LDA.w $0BED
#_03EC17: SEC
#_03EC18: SBC.w #$003E
#_03EC1B: STA.w $0C39
#_03EC1E: LDA.w $0BF5
#_03EC21: STA.w $0C0D
#_03EC24: LDA.w $0BEF
#_03EC27: STA.w $0C0B
#_03EC2A: BRA .branch03EC3F

.branch03EC2C
#_03EC2C: STA.w $0C0D
#_03EC2F: LDA.w $0BED
#_03EC32: STA.w $0C0B
#_03EC35: LDA.w $0BEF
#_03EC38: SEC
#_03EC39: SBC.w #$003E
#_03EC3C: STA.w $0C39

.branch03EC3F
#_03EC3F: LDA.w $0C0D
#_03EC42: ASL A
#_03EC43: ASL A
#_03EC44: STA.w $0C3B
#_03EC47: LDA.w $0C39
#_03EC4A: AND.w #$0001
#_03EC4D: STA.w $0C3D
#_03EC50: LDA.w $0C39
#_03EC53: LSR A
#_03EC54: CLC
#_03EC55: ADC.w $0C3B
#_03EC58: TAX
#_03EC59: LDA.w data03ECEC,X
#_03EC5C: STA.w $0C39
#_03EC5F: LDA.w $0C3D
#_03EC62: BNE .branch03EC70

#_03EC64: LSR.w $0C39
#_03EC67: LSR.w $0C39
#_03EC6A: LSR.w $0C39
#_03EC6D: LSR.w $0C39

.branch03EC70
#_03EC70: LDA.w $0C39
#_03EC73: AND.w #$000F
#_03EC76: ASL A
#_03EC77: TAX
#_03EC78: LDA.w data03ECE4,X
#_03EC7B: BEQ .branch03EC9F

#_03EC7D: STA.w $0C39
#_03EC80: CLC
#_03EC81: ADC.w #$0001
#_03EC84: STA.w $0C11
#_03EC87: LDA.w $0C39
#_03EC8A: BMI .branch03EC95

.branch03EC8C
#_03EC8C: JSR routine03ECA9
#_03EC8F: DEC.w $0C39
#_03EC92: BNE .branch03EC8C

#_03EC94: RTS

.branch03EC95
#_03EC95: JSR routine03ECCB
#_03EC98: LDA.w #$0004
#_03EC9B: STA.w $0C11
#_03EC9E: RTS

.branch03EC9F
#_03EC9F: LDA.w #$FFFF
#_03ECA2: STA.w $0C0B
#_03ECA5: STA.w $0C0D
#_03ECA8: RTS

;===================================================================================================

routine03ECA9:
#_03ECA9: DEC.w $0C0B
#_03ECAC: LDA.w $0C0D
#_03ECAF: BEQ .branch03ECC5

#_03ECB1: ASL A
#_03ECB2: TAX
#_03ECB3: LDA.w data03ED48,X
#_03ECB6: DEC A
#_03ECB7: CMP.w $0C0B
#_03ECBA: BCS .branch03ECBD

#_03ECBC: RTS

.branch03ECBD
#_03ECBD: LDA.w data03ED4A,X
#_03ECC0: DEC A
#_03ECC1: STA.w $0C0B
#_03ECC4: RTS

.branch03ECC5
#_03ECC5: LDA.w $0C0B
#_03ECC8: BMI .branch03ECBD

#_03ECCA: RTS

;===================================================================================================

routine03ECCB:
#_03ECCB: INC.w $0C0B
#_03ECCE: LDA.w $0C0D
#_03ECD1: ASL A
#_03ECD2: TAX
#_03ECD3: LDA.w data03ED4A,X
#_03ECD6: DEC A
#_03ECD7: CMP.w $0C0B
#_03ECDA: BCC .branch03ECDD

#_03ECDC: RTS

.branch03ECDD
#_03ECDD: LDA.w data03ED48,X
#_03ECE0: STA.w $0C0B
#_03ECE3: RTS

data03ECE4:
#_03ECE4: dw $0000,$FFFF,$0001,$0002

data03ECEC:
#_03ECEC: dw $0000,$0000,$0000,$0000
#_03ECF4: dw $1111,$1111,$1122,$1111
#_03ECFC: dw $2222,$1111,$2222,$1111
#_03ED04: dw $1112,$1111,$3121,$2111
#_03ED0C: dw $1221,$1121,$1222,$1121
#_03ED14: dw $0000,$0000,$1122,$1111
#_03ED1C: dw $3122,$2111,$2312,$1211
#_03ED24: dw $3213,$2112,$2132,$2122
#_03ED2C: dw $2222,$1111,$3121,$2111
#_03ED34: dw $1222,$1121,$1322,$1211
#_03ED3C: dw $1313,$1212,$1312,$1311
#_03ED44: dw $2222,$1122

data03ED48:
#_03ED48: dw $0000

data03ED4A:
#_03ED4A: dw $0006,$000B,$0013,$001F
#_03ED52: dw $0023,$002A,$0030,$0035
#_03ED5A: dw $0039,$003E,$0046,$004E
#_03ED62: dw $0059,$0062,$0072,$0080
#_03ED6A: dw $0086,$008A,$0094,$009A
#_03ED72: dw $00A1,$00AC,$00AF,$00B3
#_03ED7A: dw $00B9,$00BD,$00C2,$00C9
#_03ED82: dw $00CD,$00D3,$00DC,$00E5
#_03ED8A: dw $00EC,$00F3,$00F9,$FFFF

;===================================================================================================

routine03ED92:
#_03ED92: REP #$30

#_03ED94: LDA.w $0BED
#_03ED97: SEC
#_03ED98: SBC.w #$003E
#_03ED9B: STA.w $0C39

#_03ED9E: LDA.w $0BEF
#_03EDA1: SEC
#_03EDA2: SBC.w #$003E
#_03EDA5: ASL A ; x8
#_03EDA6: ASL A
#_03EDA7: ASL A
#_03EDA8: CLC
#_03EDA9: ADC.w $0C39 ; x9 overall?
#_03EDAC: AND.w #$00FF
#_03EDAF: TAX

#_03EDB0: LDA.w data03EDBD,X
#_03EDB3: AND.w #$00FF
#_03EDB6: STA.w $0C0B

#_03EDB9: JSR routine03EDFD

#_03EDBC: RTS

data03EDBD:
#_03EDBD: db $FF,$82,$12,$1D,$D7,$7A,$32,$7C
#_03EDC5: db $82,$FF,$28,$85,$98,$7D,$6C,$6D
#_03EDCD: db $12,$28,$FF,$29,$34,$86,$CB,$53
#_03EDD5: db $1D,$85,$29,$FF,$A5,$3A,$C6,$C8
#_03EDDD: db $D7,$98,$34,$A5,$FF,$3C,$7B,$3D
#_03EDE5: db $7A,$7D,$86,$3A,$3C,$FF,$6F,$9F
#_03EDED: db $32,$6C,$CB,$C6,$7B,$6F,$FF,$A6
#_03EDF5: db $7C,$6D,$53,$C8,$3D,$9F,$A6,$FF

;===================================================================================================

routine03EDFD:
#_03EDFD: REP #$30

#_03EDFF: LDX.w #$0002
#_03EE02: LDY.w #$0000

.branch03EE05
#_03EE05: LDA.w data03ED48,X
#_03EE08: CMP.w $0C0B
#_03EE0B: BCS .branch03EE12

#_03EE0D: INX
#_03EE0E: INX
#_03EE0F: INY
#_03EE10: BRA .branch03EE05

.branch03EE12
#_03EE12: STY.w $0C0D

#_03EE15: RTS

;===================================================================================================

routine03EE16:
#_03EE16: LDA.w $0BF3
#_03EE19: CMP.w #$0017
#_03EE1C: BNE .branch03EE27

#_03EE1E: LDA.w $0C01
#_03EE21: LSR A
#_03EE22: STA.w $0BFF
#_03EE25: BRA .branch03EE2A

.branch03EE27
#_03EE27: LSR.w $0BFF

.branch03EE2A
#_03EE2A: JSL GetRandomInt
#_03EE2E: LDA.w $0ED5
#_03EE31: AND.w #$001F
#_03EE34: CLC
#_03EE35: ADC.w $0BFF
#_03EE38: STA.w $0BFF
#_03EE3B: LDA.w #$FFFF
#_03EE3E: STA.w $0C39
#_03EE41: LDX.w #$0000

.branch03EE44
#_03EE44: LDA.w data03EE90,X
#_03EE47: AND.w #$00FF
#_03EE4A: CMP.w #$00FF
#_03EE4D: BEQ .branch03EE77

#_03EE4F: PHX
#_03EE50: TAX
#_03EE51: LDA.w $0BFF
#_03EE54: JSR routine03EF6D
#_03EE57: LDA.w $0C0F
#_03EE5A: CMP.w #$FFFF
#_03EE5D: BEQ .branch03EE73

#_03EE5F: CMP.w $0C39
#_03EE62: BCS .branch03EE73

#_03EE64: STA.w $0C39
#_03EE67: LDA.w $0C0D
#_03EE6A: STA.w $0C3B
#_03EE6D: LDA.w $0C0B
#_03EE70: STA.w $0C3D

.branch03EE73
#_03EE73: PLX
#_03EE74: INX
#_03EE75: BRA .branch03EE44

.branch03EE77
#_03EE77: LDA.w $0C39
#_03EE7A: STA.w $0C0F
#_03EE7D: LDA.w $0C3B
#_03EE80: STA.w $0C0D
#_03EE83: LDA.w $0C3D
#_03EE86: STA.w $0C0B
#_03EE89: LDA.w #$0005
#_03EE8C: STA.w $0C11
#_03EE8F: RTS

data03EE90:
#_03EE90: db $15,$1E,$0E,$05,$19,$07,$11,$1C
#_03EE98: db $08,$09,$0A,$FF

;===================================================================================================

routine00EE9C:
#_03EE9C: LDA.w $0BF3
#_03EE9F: CMP.w #$0018
#_03EEA2: BNE .branch03EEAD

#_03EEA4: LDA.w $0C01
#_03EEA7: LSR A
#_03EEA8: STA.w $0BFF
#_03EEAB: BRA .branch03EEB0

.branch03EEAD
#_03EEAD: LSR.w $0BFF

.branch03EEB0
#_03EEB0: JSL GetRandomInt
#_03EEB4: LDA.w $0ED5
#_03EEB7: AND.w #$001F
#_03EEBA: CLC
#_03EEBB: ADC.w $0BFF
#_03EEBE: STA.w $0BFF
#_03EEC1: LDA.w #$FFFF
#_03EEC4: STA.w $0C39
#_03EEC7: LDX.w #$0000

.branch03EECA
#_03EECA: LDA.w data03EF16,X
#_03EECD: AND.w #$00FF
#_03EED0: CMP.w #$00FF
#_03EED3: BEQ .branch03EEFD

#_03EED5: PHX
#_03EED6: TAX
#_03EED7: LDA.w $0BFF
#_03EEDA: JSR routine03EF6D
#_03EEDD: LDA.w $0C0F
#_03EEE0: CMP.w #$FFFF
#_03EEE3: BEQ .branch03EEF9

#_03EEE5: CMP.w $0C39
#_03EEE8: BCS .branch03EEF9

#_03EEEA: STA.w $0C39
#_03EEED: LDA.w $0C0D
#_03EEF0: STA.w $0C3B
#_03EEF3: LDA.w $0C0B
#_03EEF6: STA.w $0C3D

.branch03EEF9
#_03EEF9: PLX
#_03EEFA: INX
#_03EEFB: BRA .branch03EECA

.branch03EEFD
#_03EEFD: LDA.w $0C39
#_03EF00: STA.w $0C0F
#_03EF03: LDA.w $0C3B
#_03EF06: STA.w $0C0D
#_03EF09: LDA.w $0C3D
#_03EF0C: STA.w $0C0B
#_03EF0F: LDA.w #$0005
#_03EF12: STA.w $0C11
#_03EF15: RTS

data03EF16:
#_03EF16: db $13,$14,$1A,$0C,$0D,$0F,$0B,$06
#_03EF1E: db $10,$1B,$12,$1D,$FF

;===================================================================================================

routine03EF23:
#_03EF23: STA.w $0E00
#_03EF26: TXA
#_03EF27: STA.w $0C0D
#_03EF2A: ASL A
#_03EF2B: TAX
#_03EF2C: LDA.w data03ED48,X
#_03EF2F: STA.w $0E02
#_03EF32: LDA.w data03ED4A,X
#_03EF35: DEC A
#_03EF36: STA.w $0E04

.branch03EF39
#_03EF39: LDA.w $0E04
#_03EF3C: JSR MultiplyAby24andGiveToX
#_03EF3F: LDA.l DemonStats,X
#_03EF43: AND.w #$00FF
#_03EF46: STA.w $0E06
#_03EF49: CMP.w $0E00
#_03EF4C: BCS .branch03EF60

#_03EF4E: DEC.w $0E04
#_03EF51: LDA.w $0E04
#_03EF54: INC A
#_03EF55: CMP.w $0E02
#_03EF58: BNE .branch03EF39

#_03EF5A: LDA.w $0E02
#_03EF5D: STA.w $0E04

.branch03EF60
#_03EF60: LDA.w $0E06
#_03EF63: STA.w $0C0F

#_03EF66: LDA.w $0E04
#_03EF69: STA.w $0C0B

#_03EF6C: RTS

;===================================================================================================

routine03EF6D:
#_03EF6D: STA.w $0E00
#_03EF70: TXA
#_03EF71: STA.w $0C0D
#_03EF74: ASL A
#_03EF75: TAX
#_03EF76: LDA.w data03ED48,X
#_03EF79: STA.w $0E02
#_03EF7C: LDA.w data03ED4A,X
#_03EF7F: DEC A
#_03EF80: STA.w $0E04

.branch03EF83
#_03EF83: LDA.w $0E04
#_03EF86: JSR MultiplyAby24andGiveToX
#_03EF89: LDA.l DemonStats,X
#_03EF8D: AND.w #$00FF
#_03EF90: STA.w $0E06
#_03EF93: CMP.w $0E00
#_03EF96: BCS .branch03EFAD

#_03EF98: DEC.w $0E04
#_03EF9B: LDA.w $0E04
#_03EF9E: INC A
#_03EF9F: CMP.w $0E02
#_03EFA2: BNE .branch03EF83

#_03EFA4: LDA.w #$FFFF
#_03EFA7: STA.w $0E04
#_03EFAA: STA.w $0E06

.branch03EFAD
#_03EFAD: LDA.w $0E06
#_03EFB0: STA.w $0C0F
#_03EFB3: LDA.w $0E04
#_03EFB6: STA.w $0C0B
#_03EFB9: RTS

;===================================================================================================

MultiplyAby24andGiveToX:
#_03EFBA: PHP

#_03EFBB: REP #$30
#_03EFBD: ASL A ; x8
#_03EFBE: ASL A
#_03EFBF: ASL A
#_03EFC0: STA.w $0E08

#_03EFC3: ASL A ; x16
#_03EFC4: CLC
#_03EFC5: ADC.w $0E08 ; x24 overall
#_03EFC8: TAX

#_03EFC9: PLP
#_03EFCA: RTS

;===================================================================================================

routine03EFCB:
#_03EFCB: REP #$30
#_03EFCD: LDX.w #$0000

.branch03EFD0
#_03EFD0: PHX
#_03EFD1: LDA.w data03F003,X
#_03EFD4: CMP.w #$FFFF
#_03EFD7: BEQ .branch03EFFE

#_03EFD9: AND.w #$FF00
#_03EFDC: BEQ .branch03EFEE

#_03EFDE: PLX
#_03EFDF: LDA.w data03F004,X
#_03EFE2: AND.w #$00FF
#_03EFE5: PHX
#_03EFE6: JSL TestGameProgressBit
#_03EFEA: PLX
#_03EFEB: BCS .branch03EFFA

#_03EFED: PHX

.branch03EFEE
#_03EFEE: PLX
#_03EFEF: LDA.w data03F003,X
#_03EFF2: AND.w #$00FF
#_03EFF5: CMP.w $0C0B
#_03EFF8: BEQ .branch03F001

.branch03EFFA
#_03EFFA: INX
#_03EFFB: INX
#_03EFFC: BRA .branch03EFD0

.branch03EFFE
#_03EFFE: PLX
#_03EFFF: CLC
#_03F000: RTS

.branch03F001
#_03F001: SEC
#_03F002: RTS

data03F003:
#_03F003: db $00

data03F004:
#_03F004: db $C9,$11,$CA,$14,$77,$1B,$47,$20
#_03F00C: db $D5,$21,$D5,$22,$D5,$BD,$D0
#_03F013: dw $000B,$001F,$00C1,$00AF
#_03F01B: dw $00B0,$00B1,$00B2,$00B3
#_03F023: dw $00B4,$00B5,$00B6,$00B7
#_03F02B: dw $00B8,$00F7,$00F8,$00F9
#_03F033: dw $00FA,$00FB,$00FC,$00FD
#_03F03B: dw $00FE,$FFFF

;===================================================================================================

routine03F03F:
#_03F03F: REP #$30

#_03F041: LDX.w #$0002
#_03F044: BRA .branch03F04B

routine03F046:
#_03F046: REP #$30
#_03F048: LDX.w #$0004

.branch03F04B
#_03F04B: LDY.w #$0000

.branch03F04E
#_03F04E: LDA.w data03F07C,Y
#_03F051: AND.w #$00FF
#_03F054: CMP.w #$00FF
#_03F057: BEQ .branch03F062

#_03F059: CMP.w $0BED,X
#_03F05C: BEQ .branch03F06A

#_03F05E: INY
#_03F05F: INY
#_03F060: BRA .branch03F04E

.branch03F062
#_03F062: DEX
#_03F063: DEX
#_03F064: BPL .branch03F04B

#_03F066: LDA.w #$0000
#_03F069: RTS

.branch03F06A
#_03F06A: LDA.w data03F07D,Y
#_03F06D: AND.w #$00FF
#_03F070: BEQ .branch03F078

#_03F072: JSL TestGameProgressBit
#_03F076: BCS .branch03F062

.branch03F078
#_03F078: LDA.w #$FFFF
#_03F07B: RTS

;===================================================================================================

; Some list of demons
data03F07C:
#_03F07C: db $00

data03F07D:
#_03F07D: db $00,$0B,$00,$0C,$00,$8B,$1C,$20
#_03F085: db $C5,$21,$C5,$22,$C5
#_03F08A: dw $00F7,$00F8,$00F9,$00FA
#_03F092: dw $00FB,$00FC,$00FD,$00FE
#_03F09A: dw $00FF

;===================================================================================================

FusionWithVilePlus
#_03F09C: REP #$30
#_03F09E: LDA.w #$00F5
#_03F0A1: CMP.w $0BED
#_03F0A4: BNE .branch03F0A9
#_03F0A6: JMP .branch03F169

.branch03F0A9
#_03F0A9: CMP.w $0BEF
#_03F0AC: BNE .branch03F0B1
#_03F0AE: JMP .branch03F169

.branch03F0B1
#_03F0B1: LDA.w $0BF3
#_03F0B4: CMP.w #$0019
#_03F0B7: BCC .branch03F0C4

#_03F0B9: LDA.w $0BF5
#_03F0BC: CMP.w #$0019
#_03F0BF: BCC .branch03F0C4
#_03F0C1: JMP .branch03F193

.branch03F0C4
#_03F0C4: LDA.w $0BF3
#_03F0C7: CMP.w #$0019
#_03F0CA: BCS .branch03F0F6

#_03F0CC: LDA.w $0BF5
#_03F0CF: PHA

#_03F0D0: LDA.w $0BF3
#_03F0D3: STA.w $0BF5
#_03F0D6: PLA

#_03F0D7: STA.w $0BF3
#_03F0DA: LDA.w $0C01
#_03F0DD: PHA

#_03F0DE: LDA.w $0BFF
#_03F0E1: STA.w $0C01

#_03F0E4: PLA
#_03F0E5: STA.w $0BFF

#_03F0E8: LDA.w $0BEF
#_03F0EB: PHA

#_03F0EC: LDA.w $0BED
#_03F0EF: STA.w $0BEF

#_03F0F2: PLA
#_03F0F3: STA.w $0BED

.branch03F0F6
#_03F0F6: LDA.w $0BFF
#_03F0F9: CMP.w $0C01
#_03F0FC: BCC .branch03F127

#_03F0FE: CLC
#_03F0FF: ADC.w $0C01
#_03F102: STA.w $0C39
#_03F105: LDX.w #$0000
#_03F108: LDY.w #$0003
#_03F10B: JSL DivisionBig_XA_by_Y
#_03F10F: LDA.w $0E86
#_03F112: AND.w #$00FF
#_03F115: BNE .branch03F15C

#_03F117: LDA.w $0BED
#_03F11A: STA.w $0C0B
#_03F11D: LDA.w $0BF3
#_03F120: STA.w $0C0D
#_03F123: JSR routine03ECA9
#_03F126: RTS

.branch03F127
#_03F127: CLC
#_03F128: ADC.w $0C01
#_03F12B: STA.w $0C39
#_03F12E: LDX.w #$0000
#_03F131: LDY.w #$0007
#_03F134: JSL DivisionBig_XA_by_Y
#_03F138: LDA.w $0E86
#_03F13B: AND.w #$00FF
#_03F13E: BNE .branch03F15C

#_03F140: LDA.w $0BEF
#_03F143: STA.w $0C0B
#_03F146: LDA.w $0BF5
#_03F149: STA.w $0C0D
#_03F14C: JSR routine03ECA9
#_03F14F: LDA.w $0C0D
#_03F152: CMP.w #$000A
#_03F155: BEQ .branch03F158

#_03F157: RTS

;---------------------------------------------------------------------------------------------------

.branch03F158
#_03F158: INC.w $0C11
#_03F15B: RTS

.branch03F15C
#_03F15C: LDA.w #$0022
#_03F15F: STA.w $0C0D
#_03F162: LDA.w #$00F5
#_03F165: STA.w $0C0B
#_03F168: RTS

.branch03F169
#_03F169: REP #$30
#_03F16B: LDA.w #$0008
#_03F16E: STA.w $0C11
#_03F171: LDY.w #$0000
#_03F174: LDA.w $0BED
#_03F177: CMP.w #$00F5
#_03F17A: BNE .branch03F17F

#_03F17C: LDY.w #$0002

.branch03F17F
#_03F17F: LDA.w $0BED,Y
#_03F182: STA.w $0C0B
#_03F185: LDA.w $0BF3,Y
#_03F188: STA.w $0C0D
#_03F18B: LDA.w $0BFF,Y
#_03F18E: STA.w $0C0F
#_03F191: RTS

#_03F192: RTS

;---------------------------------------------------------------------------------------------------

.branch03F193
#_03F193: REP #$30
#_03F195: LDA.w $0BF3
#_03F198: CMP.w $0BF5
#_03F19B: BNE .branch03F1A0

#_03F19D: JMP .branch03F1D2

.branch03F1A0
#_03F1A0: LDA.w $0BFF
#_03F1A3: CMP.w $0C01
#_03F1A6: BCS .branch03F1BC

#_03F1A8: LDA.w $0BF5
#_03F1AB: STA.w $0C0D
#_03F1AE: LDA.w $0BEF
#_03F1B1: STA.w $0C0B
#_03F1B4: LDA.w $0C01
#_03F1B7: STA.w $0C0F
#_03F1BA: BRA .branch03F1CE

.branch03F1BC
#_03F1BC: LDA.w $0BF3
#_03F1BF: STA.w $0C0D
#_03F1C2: LDA.w $0BED
#_03F1C5: STA.w $0C0B
#_03F1C8: LDA.w $0BFF
#_03F1CB: STA.w $0C0F

.branch03F1CE
#_03F1CE: JSR routine03ECCB
#_03F1D1: RTS

.branch03F1D2
#_03F1D2: LDA.w $0BF3
#_03F1D5: SEC
#_03F1D6: SBC.w #$0019
#_03F1D9: TAX
#_03F1DA: LDA.w data03F226,X
#_03F1DD: AND.w #$00FF
#_03F1E0: CMP.w #$00FF
#_03F1E3: BEQ .branch03F201

#_03F1E5: STA.w $0C0D
#_03F1E8: LDA.w $0BFF
#_03F1EB: CLC
#_03F1EC: ADC.w $0C01
#_03F1EF: LSR A
#_03F1F0: CLC
#_03F1F1: ADC.w #$0002
#_03F1F4: STA.w $0C0F
#_03F1F7: LDX.w $0C0D
#_03F1FA: LDA.w $0C0F
#_03F1FD: JSR routine03EF23
#_03F200: RTS

.branch03F201
#_03F201: LDA.w $0BED
#_03F204: CMP.w $0BEF
#_03F207: BCS .branch03F20E

#_03F209: STA.w $0C0B
#_03F20C: BRA .branch03F214

.branch03F20E
#_03F20E: LDA.w $0BEF
#_03F211: STA.w $0C0B

.branch03F214
#_03F214: INC.w $0C0B
#_03F217: LDA.w $0C0B
#_03F21A: CMP.w #$00BD
#_03F21D: BNE .exit

#_03F21F: LDA.w #$00B9
#_03F222: STA.w $0C0B

.exit
#_03F225: RTS

data03F226:
#_03F226: db $FF,$00,$06,$07,$09,$13,$20,$21
#_03F22E: db $22,$0E

;===================================================================================================

routine03F230:
#_03F230: REP #$30
#_03F232: LDX.w #$0002
#_03F235: BRA .branch03F23C

routine03F237:
#_03F237: REP #$30
#_03F239: LDX.w #$0004

.branch03F23C
#_03F23C: LDA.w $0C11
#_03F23F: CMP.w #$0008
#_03F242: BNE .branch03F248

#_03F244: STZ.w $0C11
#_03F247: RTS

.branch03F248
#_03F248: LDA.w $0C0B

.branch03F24B
#_03F24B: CMP.w $0BED,X
#_03F24E: BEQ .branch03F255

#_03F250: DEX
#_03F251: DEX
#_03F252: BPL .branch03F24B

#_03F254: RTS

.branch03F255
#_03F255: JMP routine03F853

routine03F258:
#_03F258: LDA.w $0BED
#_03F25B: PHA
#_03F25C: LDA.w $0BEF
#_03F25F: PHA
#_03F260: LDA.w $0BF1
#_03F263: PHA
#_03F264: PHP
#_03F265: JSL routine0F8F83
#_03F269: BCS .branch03F276

#_03F26B: JSR routine03F287
#_03F26E: JSR routine03EFCB
#_03F271: BCC .branch03F276

#_03F273: JSR routine03EA62

.branch03F276
#_03F276: PLP
#_03F277: PLA
#_03F278: STA.w $0BF1
#_03F27B: PLA
#_03F27C: STA.w $0BEF
#_03F27F: PLA
#_03F280: STA.w $0BED
#_03F283: JSR routine03F237
#_03F286: RTS

;===================================================================================================

routine03F287:
#_03F287: REP #$30
#_03F289: STZ.w $0B4F
#_03F28C: STZ.w $0C11
#_03F28F: JSR routine03F046
#_03F292: CMP.w #$FFFF
#_03F295: BNE .branch03F29A

#_03F297: JMP routine03EA62

.branch03F29A
#_03F29A: LDA.w #$0000
#_03F29D: JSR GetDemonXLevel

#_03F2A0: LDA.w #$0001
#_03F2A3: JSR GetDemonXLevel

#_03F2A6: LDA.w #$0002
#_03F2A9: JSR GetDemonXLevel

#_03F2AC: LDA.w #$0000
#_03F2AF: JSR GetDemonXClass

#_03F2B2: LDA.w #$0001
#_03F2B5: JSR GetDemonXClass

#_03F2B8: LDA.w #$0002
#_03F2BB: JSR GetDemonXClass

#_03F2BE: JSR routine03F89F
#_03F2C1: JSR routine03F8E0

#_03F2C4: LDA.w #$0008
#_03F2C7: CMP.w $0BF9
#_03F2CA: BCS .branch03F2CF

#_03F2CC: JMP routine03F853

.branch03F2CF
#_03F2CF: CMP.w $0BFB
#_03F2D2: BCS .branch03F2D7

#_03F2D4: JMP routine03F853

.branch03F2D7
#_03F2D7: CMP.w $0BFD
#_03F2DA: BCS .branch03F2DF

#_03F2DC: JMP routine03F853

.branch03F2DF
#_03F2DF: LDX.w #$0004

.branch03F2E2
#_03F2E2: LDA.w $0BF3,X
#_03F2E5: CMP.w #$0017
#_03F2E8: BNE .branch03F2ED

#_03F2EA: JMP routine03EA62

.branch03F2ED
#_03F2ED: CMP.w #$0018
#_03F2F0: BNE .branch03F2F5

#_03F2F2: JMP routine03EA62

.branch03F2F5
#_03F2F5: DEX
#_03F2F6: DEX
#_03F2F7: BPL .branch03F2E2

#_03F2F9: LDX.w #$0004
#_03F2FC: LDY.w #$0000

.branch03F2FF
#_03F2FF: LDA.w $0BF3,X
#_03F302: CMP.w #$000A
#_03F305: BNE .branch03F308

#_03F307: INY

.branch03F308
#_03F308: DEX
#_03F309: DEX
#_03F30A: BPL .branch03F2FF

#_03F30C: STY.w $0C39

#_03F30F: TYA
#_03F310: ASL A
#_03F311: TAY

#_03F312: LDA.w .vectors,Y
#_03F315: STA.w $00E0

#_03F318: JMP ($00E0)

.vectors
#_03F31B: dw routine03F323
#_03F31D: dw routine03F578
#_03F31F: dw routine03F5D7
#_03F321: dw routine03F711

;===================================================================================================

routine03F323:
#_03F323: LDA.w #$0008
#_03F326: STA.w $0E0E

#_03F329: LDX.w #$0004

.branch03F32C
#_03F32C: LDA.w $0BF3,X
#_03F32F: CMP.w #$0019
#_03F332: BCC .branch03F33E

#_03F334: LDA.w $0E0E
#_03F337: SEC
#_03F338: SBC.w #$0004
#_03F33B: STA.w $0E0E

.branch03F33E
#_03F33E: DEX
#_03F33F: DEX
#_03F340: BPL .branch03F32C

#_03F342: JSR routine03F52B
#_03F345: LDA.w $0BFB
#_03F348: CMP.w #$0008
#_03F34B: BCC .branch03F350

#_03F34D: JMP routine03F853

.branch03F350
#_03F350: LDA.w $0BF9
#_03F353: CMP.w #$0008
#_03F356: BCC .branch03F35B

#_03F358: JMP routine03F853

.branch03F35B
#_03F35B: ASL A
#_03F35C: ASL A
#_03F35D: ASL A
#_03F35E: CLC
#_03F35F: ADC.w $0BFB
#_03F362: TAY
#_03F363: LDA.w data03F434,Y
#_03F366: AND.w #$00FF
#_03F369: STA.w $0C39
#_03F36C: CMP.w #$00FF
#_03F36F: BNE .branch03F374

#_03F371: JMP .branch03F3CA

.branch03F374
#_03F374: LDA.w $0BFD
#_03F377: CMP.w #$0008
#_03F37A: BCC .branch03F37F

#_03F37C: JMP routine03F853

.branch03F37F
#_03F37F: ASL A
#_03F380: STA.w $0E00
#_03F383: ASL A
#_03F384: STA.w $0E02
#_03F387: ASL A
#_03F388: ASL A
#_03F389: CLC
#_03F38A: ADC.w $0E00
#_03F38D: CLC
#_03F38E: ADC.w $0E02
#_03F391: CLC
#_03F392: ADC.w $0C39
#_03F395: TAY
#_03F396: LDA.w data03F474,Y
#_03F399: AND.w #$00FF
#_03F39C: STA.w $0C0D
#_03F39F: CMP.w #$00FF
#_03F3A2: BEQ .branch03F3F3

#_03F3A4: LDA.w $0BFF
#_03F3A7: CLC
#_03F3A8: ADC.w $0C01
#_03F3AB: CLC
#_03F3AC: ADC.w $0C03
#_03F3AF: LDX.w #$0000
#_03F3B2: LDY.w #$0003
#_03F3B5: JSL DivisionBig_XA_by_Y
#_03F3B9: LDA.w $0E80
#_03F3BC: CLC
#_03F3BD: ADC.w $0E0E
#_03F3C0: STA.w $0C0F
#_03F3C3: LDX.w $0C0D
#_03F3C6: JSR routine03EF23
#_03F3C9: RTS

.branch03F3CA
#_03F3CA: JSR routine03EA83
#_03F3CD: LDA.w $0C0B
#_03F3D0: STA.w $0BED
#_03F3D3: CMP.w #$FFFF
#_03F3D6: BNE .branch03F3DB

#_03F3D8: JMP routine03EA62

.branch03F3DB
#_03F3DB: LDA.w $0BF1
#_03F3DE: STA.w $0BEF
#_03F3E1: JSR routine03EA83
#_03F3E4: LDA.w $0C0B
#_03F3E7: CMP.w #$FFFF
#_03F3EA: BNE .branch03F3EF

#_03F3EC: JMP routine03EA62

.branch03F3EF
#_03F3EF: JSR routine03ECA9
#_03F3F2: RTS

.branch03F3F3
#_03F3F3: JSL GetRandomInt
#_03F3F7: LDA.w $0ED5
#_03F3FA: AND.w #$00FF
#_03F3FD: CMP.w #$0046
#_03F400: BCC .branch03F3F3

#_03F402: CMP.w #$00AF
#_03F405: BCS .branch03F3F3

#_03F407: STA.w $0C0B
#_03F40A: JSR routine03EFCB
#_03F40D: BCS .branch03F3F3

#_03F40F: LDA.w $0C0B
#_03F412: STA.w $0BED
#_03F415: LDA.w #$0000
#_03F418: JSR GetDemonXClass
#_03F41B: LDA.w #$0000
#_03F41E: JSR GetDemonXLevel
#_03F421: LDA.w $0BF3
#_03F424: STA.w $0C0D
#_03F427: LDA.w $0BFF
#_03F42A: STA.w $0C0F
#_03F42D: LDA.w #$0005
#_03F430: STA.w $0C11
#_03F433: RTS

data03F434:
#_03F434: db $FF,$00,$01,$02,$03,$04,$05,$06
#_03F43C: db $00,$FF,$06,$07,$08,$09,$0A,$0B
#_03F444: db $01,$06,$FF,$0C,$0D,$0E,$0F,$06
#_03F44C: db $02,$07,$0C,$FF,$10,$11,$12,$07
#_03F454: db $03,$08,$0D,$10,$FF,$13,$14,$0A
#_03F45C: db $04,$09,$0E,$11,$13,$FF,$15,$09
#_03F464: db $05,$0A,$0F,$12,$14,$15,$FF,$0A
#_03F46C: db $06,$0B,$06,$07,$0A,$09,$0A,$FF

data03F474:
#_03F474: db $00,$1A,$04,$06,$07,$08,$06,$03
#_03F47C: db $06,$05,$08,$02,$04,$03,$0D,$0C
#_03F484: db $FF,$01,$03,$05,$06,$0B,$02,$03
#_03F48C: db $0B,$06,$FF,$1B,$14,$01,$13,$01
#_03F494: db $1E,$19,$FF,$01,$05,$06,$07,$01
#_03F49C: db $09,$0B,$06,$09,$1A,$00,$01,$03
#_03F4A4: db $05,$10,$01,$0D,$06,$05,$1B,$1E
#_03F4AC: db $0C,$0C,$0E,$14,$1C,$05,$0C,$0F
#_03F4B4: db $13,$14,$04,$04,$05,$09,$04,$08
#_03F4BC: db $FF,$05,$1B,$05,$09,$1F,$05,$1C
#_03F4C4: db $05,$FF,$0F,$05,$09,$1B,$1B,$0F
#_03F4CC: db $06,$06,$19,$06,$0B,$03,$13,$0C
#_03F4D4: db $06,$01,$08,$03,$11,$06,$01,$03
#_03F4DC: db $1B,$0D,$14,$06,$06,$06,$07,$01
#_03F4E4: db $04,$01,$05,$06,$0D,$05,$0C,$07
#_03F4EC: db $10,$0B,$0C,$0F,$05,$10,$0F,$05
#_03F4F4: db $0C,$07,$10,$07,$08,$06,$09,$08
#_03F4FC: db $06,$08,$13,$12,$09,$10,$09,$16
#_03F504: db $FF,$12,$10,$12,$1D,$09,$09,$09
#_03F50C: db $08,$10,$0B,$03,$03,$03,$0B,$08
#_03F514: db $14,$13,$03,$0B,$16,$1E,$14,$03
#_03F51C: db $0C,$13,$1E,$0B,$FF,$0B,$03,$13

;===================================================================================================

routine03F524:
#_03F524: LDA.w $0BF3,Y
#_03F527: CMP.w $0BF3,X

#_03F52A: RTS

;===================================================================================================

routine03F52B:
#_03F52B: PHX
#_03F52C: PHP

#_03F52D: REP #$30

#_03F52F: LDX.w #$0000
#_03F532: LDY.w #$0002

#_03F535: LDA.w $0BFF
#_03F538: CMP.w $0C01
#_03F53B: BNE .branch03F540

#_03F53D: JSR routine03F524

.branch03F540
#_03F540: BCC .branch03F545

#_03F542: JSR SwapStuffInSlots_X_and_Y_03F866

;---------------------------------------------------------------------------------------------------

.branch03F545
#_03F545: LDX.w #$0000
#_03F548: LDY.w #$0004

#_03F54B: LDA.w $0BFF
#_03F54E: CMP.w $0C03
#_03F551: BCC .branch03F55D

#_03F553: BNE .branch03F558

#_03F555: JSR routine03F524

.branch03F558
#_03F558: BCC .branch03F55D

#_03F55A: JSR SwapStuffInSlots_X_and_Y_03F866

;---------------------------------------------------------------------------------------------------

.branch03F55D
#_03F55D: LDX.w #$0002
#_03F560: LDY.w #$0004

#_03F563: LDA.w $0C01
#_03F566: CMP.w $0C03
#_03F569: BCC .exit

#_03F56B: BNE .branch03F570

#_03F56D: JSR routine03F524

.branch03F570
#_03F570: BCC .exit

#_03F572: JSR SwapStuffInSlots_X_and_Y_03F866

.exit
#_03F575: PLP
#_03F576: PLX

#_03F577: RTS

;===================================================================================================

routine03F578:
#_03F578: REP #$30
#_03F57A: LDA.w #$000A
#_03F57D: CMP.w $0BF7
#_03F580: BEQ .branch03F598

#_03F582: CMP.w $0BF5
#_03F585: BEQ .branch03F58F

#_03F587: LDX.w #$0000
#_03F58A: LDY.w #$0004
#_03F58D: BRA .branch03F595

.branch03F58F
#_03F58F: LDX.w #$0002
#_03F592: LDY.w #$0004

.branch03F595
#_03F595: JSR SwapStuffInSlots_X_and_Y_03F866

.branch03F598
#_03F598: JSR routine03EA83
#_03F59B: LDA.w $0C0B
#_03F59E: CMP.w #$FFFF
#_03F5A1: BNE .branch03F5A6

#_03F5A3: JMP routine03EA62

.branch03F5A6
#_03F5A6: JSR routine03ECA9
#_03F5A9: LDA.w $0C0F
#_03F5AC: STA.w $0BFF
#_03F5AF: LDA.w $0C0B
#_03F5B2: STA.w $0BED
#_03F5B5: LDA.w #$0000
#_03F5B8: JSR GetDemonXClass
#_03F5BB: LDA.w $0BF1
#_03F5BE: STA.w $0BEF
#_03F5C1: LDA.w $0BF7
#_03F5C4: STA.w $0BF5
#_03F5C7: LDA.w $0BFD
#_03F5CA: STA.w $0BFB
#_03F5CD: LDA.w $0C03
#_03F5D0: STA.w $0C01
#_03F5D3: JSR routine03EA83
#_03F5D6: RTS

;===================================================================================================

routine03F5D7:
#_03F5D7: REP #$30
#_03F5D9: LDA.w #$000A
#_03F5DC: CMP.w $0BF7
#_03F5DF: BNE .branch03F5F7

#_03F5E1: CMP.w $0BF5
#_03F5E4: BNE .branch03F5EE

#_03F5E6: LDX.w #$0000
#_03F5E9: LDY.w #$0004
#_03F5EC: BRA .branch03F5F4

.branch03F5EE
#_03F5EE: LDX.w #$0002
#_03F5F1: LDY.w #$0004

.branch03F5F4
#_03F5F4: JSR SwapStuffInSlots_X_and_Y_03F866

.branch03F5F7
#_03F5F7: LDA.w $0BED
#_03F5FA: SEC
#_03F5FB: SBC.w #$003E
#_03F5FE: TAX
#_03F5FF: LDA.w data03F709,X
#_03F602: AND.w #$00FF
#_03F605: CMP.w $0BEF
#_03F608: BNE .branch03F60D

#_03F60A: JMP .branch03F641

.branch03F60D
#_03F60D: JSR routine03EA83
#_03F610: DEC.w $0C0B
#_03F613: LDA.w $0C0B
#_03F616: STA.w $0BED
#_03F619: LDA.w #$0000
#_03F61C: JSR GetDemonXClass
#_03F61F: LDA.w #$0000
#_03F622: JSR GetDemonXLevel
#_03F625: LDA.w $0BF1
#_03F628: STA.w $0BEF
#_03F62B: LDA.w $0BF7
#_03F62E: STA.w $0BF5
#_03F631: LDA.w $0BFD
#_03F634: STA.w $0BFB
#_03F637: LDA.w $0C03
#_03F63A: STA.w $0C01
#_03F63D: JSR routine03EA83
#_03F640: RTS

.branch03F641
#_03F641: STZ.w $0C11
#_03F644: LDA.w $0BF7
#_03F647: CMP.w #$0019
#_03F64A: BCC .branch03F64F

#_03F64C: JMP routine03EA62

.branch03F64F
#_03F64F: STA.w $0C0D
#_03F652: LDA.w $0BF1
#_03F655: STA.w $0C0B
#_03F658: LDA.w $0BED
#_03F65B: SEC
#_03F65C: SBC.w #$003E
#_03F65F: STA.w $0E00
#_03F662: LDA.w $0BEF
#_03F665: SEC
#_03F666: SBC.w #$003E
#_03F669: STA.w $0E02
#_03F66C: LDA.w $0BF7
#_03F66F: ASL A
#_03F670: ASL A
#_03F671: STA.w $0E04
#_03F674: LDA.w $0E00
#_03F677: LSR A
#_03F678: CLC
#_03F679: ADC.w $0E04
#_03F67C: TAY
#_03F67D: LDA.w data03ECEC,Y
#_03F680: AND.w #$00FF
#_03F683: STA.w $0E06
#_03F686: LDA.w $0E00
#_03F689: AND.w #$0001
#_03F68C: BNE .branch03F69A

#_03F68E: LSR.w $0E06
#_03F691: LSR.w $0E06
#_03F694: LSR.w $0E06
#_03F697: LSR.w $0E06

.branch03F69A
#_03F69A: LDA.w $0E06
#_03F69D: AND.w #$000F
#_03F6A0: ASL A
#_03F6A1: TAY
#_03F6A2: LDA.w data03ECE4,Y
#_03F6A5: STA.w $0E06
#_03F6A8: LDA.w $0E02
#_03F6AB: LSR A
#_03F6AC: CLC
#_03F6AD: ADC.w $0E04
#_03F6B0: TAY
#_03F6B1: LDA.w data03ECEC,Y
#_03F6B4: AND.w #$00FF
#_03F6B7: STA.w $0E08
#_03F6BA: LDA.w $0E02
#_03F6BD: AND.w #$0001
#_03F6C0: BNE .branch03F6CE

#_03F6C2: LSR.w $0E08
#_03F6C5: LSR.w $0E08
#_03F6C8: LSR.w $0E08
#_03F6CB: LSR.w $0E08

.branch03F6CE
#_03F6CE: LDA.w $0E08
#_03F6D1: AND.w #$000F
#_03F6D4: ASL A
#_03F6D5: TAY
#_03F6D6: LDA.w data03ECE4,Y
#_03F6D9: CLC
#_03F6DA: ADC.w $0E06
#_03F6DD: STA.w $0E00
#_03F6E0: BNE .branch03F6E5

#_03F6E2: JMP .branch03F15C

.branch03F6E5
#_03F6E5: BMI .branch03F6F8

#_03F6E7: LDX.w $0E00

.branch03F6EA
#_03F6EA: PHX
#_03F6EB: PHP
#_03F6EC: JSR routine03ECA9
#_03F6EF: PLP
#_03F6F0: PLX
#_03F6F1: DEX
#_03F6F2: BNE .branch03F6EA

#_03F6F4: JSR routine03ECA9
#_03F6F7: RTS

.branch03F6F8
#_03F6F8: LDX.w $0E00

.branch03F6FB
#_03F6FB: PHX
#_03F6FC: PHP
#_03F6FD: JSR routine03ECCB
#_03F700: PLP
#_03F701: PLX
#_03F702: INX
#_03F703: BNE .branch03F6FB

#_03F705: JSR routine03ECA9
#_03F708: RTS

data03F709:
#_03F709: db $42,$43,$44,$45,$3E,$3F,$40,$41

;===================================================================================================

routine03F711:
#_03F711: REP #$30
#_03F713: JSR routine03F52B
#_03F716: LDA.w $0BED
#_03F719: CMP.w #$0042
#_03F71C: BCC .branch03F75D

#_03F71E: LDA.w $0BF1
#_03F721: CMP.w #$0042
#_03F724: BCS .branch03F729

#_03F726: JMP .branch03F7AE

.branch03F729
#_03F729: LDA.w $0BED
#_03F72C: SEC
#_03F72D: SBC.w #$0042
#_03F730: ASL A
#_03F731: ASL A
#_03F732: STA.w $0E00
#_03F735: LDA.w $0BEF
#_03F738: SEC
#_03F739: SBC.w #$0042
#_03F73C: CLC
#_03F73D: ADC.w $0E00
#_03F740: TAY
#_03F741: LDA.w data03F803,Y
#_03F744: AND.w #$00FF
#_03F747: ASL A
#_03F748: ASL A
#_03F749: CLC
#_03F74A: ADC.w $0BF1
#_03F74D: SEC
#_03F74E: SBC.w #$0042
#_03F751: TAY
#_03F752: LDA.w data03F813,Y
#_03F755: AND.w #$00FF
#_03F758: STA.w $0C0B
#_03F75B: BRA .branch03F78F

.branch03F75D
#_03F75D: LDA.w $0BED
#_03F760: SEC
#_03F761: SBC.w #$003E
#_03F764: ASL A
#_03F765: ASL A
#_03F766: STA.w $0E00
#_03F769: LDA.w $0BEF
#_03F76C: SEC
#_03F76D: SBC.w #$003E
#_03F770: CLC
#_03F771: ADC.w $0E00
#_03F774: TAY
#_03F775: LDA.w data03F82B,Y
#_03F778: AND.w #$00FF
#_03F77B: ASL A
#_03F77C: ASL A
#_03F77D: CLC
#_03F77E: ADC.w $0BF1
#_03F781: SEC
#_03F782: SBC.w #$003E
#_03F785: TAY
#_03F786: LDA.w data03F83B,Y
#_03F789: AND.w #$00FF
#_03F78C: STA.w $0C0B

.branch03F78F
#_03F78F: LDA.w $0C0B
#_03F792: STA.w $0BED
#_03F795: LDA.w #$0000
#_03F798: JSR GetDemonXClass
#_03F79B: LDA.w #$0000
#_03F79E: JSR GetDemonXLevel
#_03F7A1: LDA.w $0BF3
#_03F7A4: STA.w $0C0D
#_03F7A7: LDA.w $0BFF
#_03F7AA: STA.w $0C0F
#_03F7AD: RTS

.branch03F7AE
#_03F7AE: LDA.w $0BEF
#_03F7B1: CMP.w #$0042
#_03F7B4: BCC .branch03F7F7

.branch03F7B6
#_03F7B6: JSR routine03EA83
#_03F7B9: LDA.w $0C0B
#_03F7BC: STA.w $0BED
#_03F7BF: CMP.w #$FFFF
#_03F7C2: BNE .branch03F7C7

#_03F7C4: JMP routine03EA62

.branch03F7C7
#_03F7C7: LDA.w $0BF1
#_03F7CA: STA.w $0BEF
#_03F7CD: LDA.w #$0000
#_03F7D0: JSR GetDemonXClass
#_03F7D3: LDA.w #$0001
#_03F7D6: JSR GetDemonXClass
#_03F7D9: LDA.w #$0000
#_03F7DC: JSR GetDemonXLevel
#_03F7DF: LDA.w #$0001
#_03F7E2: JSR GetDemonXLevel
#_03F7E5: JSR routine03EA83
#_03F7E8: LDA.w $0C0B
#_03F7EB: CMP.w #$FFFF
#_03F7EE: BNE .branch03F7F3

#_03F7F0: JMP routine03EA62

.branch03F7F3
#_03F7F3: JSR routine03ECA9
#_03F7F6: RTS

.branch03F7F7
#_03F7F7: LDX.w #$0000
#_03F7FA: LDY.w #$0004
#_03F7FD: JSR SwapStuffInSlots_X_and_Y_03F866
#_03F800: JMP .branch03F7B6

data03F803:
#_03F803: db $FF,$00,$01,$02,$00,$FF,$03,$04
#_03F80B: db $01,$03,$FF,$05,$02,$04,$05,$FF

data03F813:
#_03F813: db $FF,$FF,$41,$40,$FF,$41,$FF,$3F
#_03F81B: db $FF,$40,$3F,$FF,$41,$FF,$FF,$3E
#_03F823: db $40,$FF,$3E,$FF,$3F,$3E,$FF,$FF

data03F82B:
#_03F82B: db $FF,$00,$01,$02,$00,$FF,$03,$04
#_03F833: db $01,$03,$FF,$05,$02,$04,$05,$FF

data03F83B:
#_03F83B: db $FF,$FF,$25,$10,$FF,$25,$FF,$36
#_03F843: db $FF,$10,$36,$FF,$25,$FF,$FF,$07
#_03F84B: db $10,$FF,$07,$FF,$36,$07,$FF,$FF

;===================================================================================================

routine03F853:
#_03F853: LDA.w #$00F5
#_03F856: STA.w $0C0B

#_03F859: LDA.w #$0022
#_03F85C: STA.w $0C0D

#_03F85F: LDA.w #$000A
#_03F862: STA.w $0C0F

#_03F865: RTS

;===================================================================================================

SwapStuffInSlots_X_and_Y_03F866:
; TODO
#_03F866: LDA.w $0BF3,X
#_03F869: PHA

#_03F86A: LDA.w $0BF3,Y
#_03F86D: STA.w $0BF3,X

#_03F870: PLA
#_03F871: STA.w $0BF3,Y

; TODO
#_03F874: LDA.w $0BF9,X
#_03F877: PHA

#_03F878: LDA.w $0BF9,Y
#_03F87B: STA.w $0BF9,X

#_03F87E: PLA
#_03F87F: STA.w $0BF9,Y

; TODO
#_03F882: LDA.w $0BED,X
#_03F885: PHA

#_03F886: LDA.w $0BED,Y
#_03F889: STA.w $0BED,X

#_03F88C: PLA
#_03F88D: STA.w $0BED,Y

; TODO
#_03F890: LDA.w $0BFF,X
#_03F893: PHA

#_03F894: LDA.w $0BFF,Y
#_03F897: STA.w $0BFF,X

#_03F89A: PLA
#_03F89B: STA.w $0BFF,Y

#_03F89E: RTS

;===================================================================================================

routine03F89F:
#_03F89F: REP #$30

#_03F8A1: LDA.w #$00EC
#_03F8A4: CMP.w $0BED
#_03F8A7: BCS .exit

#_03F8A9: CMP.w $0BEF
#_03F8AC: BCS .exit

#_03F8AE: CMP.w $0BF1
#_03F8B1: BCS .exit

#_03F8B3: LDA.w #$00F3
#_03F8B6: DEC A
#_03F8B7: CMP.w $0BED
#_03F8BA: BCC .exit

#_03F8BC: CMP.w $0BEF
#_03F8BF: BCC .exit

#_03F8C1: CMP.w $0BF1
#_03F8C4: BCC .exit

#_03F8C6: LDA.w #$00EC
#_03F8C9: STA.w $0C0B
#_03F8CC: STA.w $0BED

#_03F8CF: LDA.w #$0021
#_03F8D2: STA.w $0C0D

#_03F8D5: LDA.w #$0000
#_03F8D8: JSR GetDemonXLevel
#_03F8DB: STA.w $0C0F

#_03F8DE: PLA

.exit
#_03F8DF: RTS

;===================================================================================================

routine03F8E0:
#_03F8E0: REP #$30
#_03F8E2: LDX.w #$0000

.branch03F8E5
#_03F8E5: LDA.w data03F940+0,X
#_03F8E8: AND.w #$00FF
#_03F8EB: CMP.w #$00FF
#_03F8EE: BEQ .exit

#_03F8F0: JSR routine03F9A0
#_03F8F3: AND.w #$FFFF
#_03F8F6: BMI .branch03F914

#_03F8F8: LDA.w data03F940+1,X
#_03F8FB: AND.w #$00FF

#_03F8FE: JSR routine03F9A0
#_03F901: AND.w #$FFFF
#_03F904: BMI .branch03F914

#_03F906: LDA.w data03F940+2,X
#_03F909: AND.w #$00FF

#_03F90C: JSR routine03F9A0
#_03F90F: AND.w #$FFFF
#_03F912: BPL .branch03F91A

.branch03F914
#_03F914: INX
#_03F915: INX
#_03F916: INX
#_03F917: INX
#_03F918: BRA .branch03F8E5

.branch03F91A
#_03F91A: LDA.w data03F940+3,X
#_03F91D: AND.w #$00FF
#_03F920: STA.w $0BED
#_03F923: STA.w $0C0B

#_03F926: LDA.w #$0000
#_03F929: JSR GetDemonXClass

#_03F92C: LDA.w #$0000
#_03F92F: JSR GetDemonXLevel

#_03F932: LDA.w $0BF3
#_03F935: STA.w $0C0D

#_03F938: LDA.w $0BFF
#_03F93B: STA.w $0C0F

#_03F93E: PLA

.exit
#_03F93F: RTS

data03F940:
#_03F940: db $23, $24, $25, $22, $FF

;===================================================================================================

routine03F945:
#_03F945: REP #$30

#_03F947: LDX.w #$0000

.branch03F94A
#_03F94A: LDA.w data03F996,X
#_03F94D: AND.w #$00FF
#_03F950: CMP.w #$00FF
#_03F953: BEQ .exit

#_03F955: JSR routine03F99A
#_03F958: AND.w #$FFFF
#_03F95B: BMI .branch03F96B

#_03F95D: LDA.w data03F997,X
#_03F960: AND.w #$00FF

#_03F963: JSR routine03F99A
#_03F966: AND.w #$FFFF
#_03F969: BPL .branch03F970

.branch03F96B
#_03F96B: INX
#_03F96C: INX
#_03F96D: INX
#_03F96E: BRA .branch03F94A

.branch03F970
#_03F970: LDA.w data03F998,X
#_03F973: AND.w #$00FF
#_03F976: STA.w $0BED
#_03F979: STA.w $0C0B

#_03F97C: LDA.w #$0000
#_03F97F: JSR GetDemonXClass

#_03F982: LDA.w #$0000
#_03F985: JSR GetDemonXLevel

#_03F988: LDA.w $0BF3
#_03F98B: STA.w $0C0D

#_03F98E: LDA.w $0BFF
#_03F991: STA.w $0C0F

#_03F994: PLA

.exit
#_03F995: RTS

; TODO are these demon IDs?
data03F996:
#_03F996: db $48 ; Rangda?

data03F997:
#_03F997: db $35 ; Barong?

data03F998:
#_03F998: db $0C ; Shiva?
#_03F999: db $FF

;===================================================================================================

routine03F99A:
#_03F99A: PHX

#_03F99B: LDX.w #$0002
#_03F99E: BRA .branch03F9A4

;---------------------------------------------------------------------------------------------------

#routine03F9A0:
#_03F9A0: PHX
#_03F9A1: LDX.w #$0004

.branch03F9A4
#_03F9A4: CMP.w $0BED,X
#_03F9A7: BEQ .branch03F9B2

#_03F9A9: DEX
#_03F9AA: DEX
#_03F9AB: BPL .branch03F9A4

#_03F9AD: LDA.w #$FFFF
#_03F9B0: PLX
#_03F9B1: RTS

.branch03F9B2
#_03F9B2: LDA.w #$0000
#_03F9B5: PLX
#_03F9B6: RTS

;===================================================================================================

routine03F9B7:
#_03F9B7: PHP
#_03F9B8: REP #$30
#_03F9BA: PHB
#_03F9BB: PHK
#_03F9BC: PLB
#_03F9BD: JSR routine03DFBD
#_03F9C0: INC.w $0E00
#_03F9C3: LDA.w $0E00
#_03F9C6: CMP.w #$0002
#_03F9C9: BCS .branch03FD95

#_03F9CB: SEP #$20
#_03F9CD: LDA.b #$FF
#_03F9CF: STA.w $0A58
#_03F9D2: PLB
#_03F9D3: PLP
#_03F9D4: RTL

.branch03FD95
#_03F9D5: JSR routine03E0C5
#_03F9D8: JSR routine03F9F5
#_03F9DB: JSR routine03E0F4
#_03F9DE: JSR routine03FB22

#_03F9E1: SEP #$30
#_03F9E3: INC.w $0B3C
#_03F9E6: DEC.w $0B3D
#_03F9E9: JSR routine03E1AB
#_03F9EC: JSR routine03E369
#_03F9EF: JSR routine03E1E7
#_03F9F2: PLB
#_03F9F3: PLP
#_03F9F4: RTL

;===================================================================================================

routine03F9F5:
#_03F9F5: PHP
#_03F9F6: SEP #$30
#_03F9F8: JSL DarkenScreen
#_03F9FC: JSL Reset_OAMrelatedWRAM

#_03FA00: SEP #$20
#_03FA02: LDA.b #$00
#_03FA04: JSL routine02F609
#_03FA08: LDA.b #$23
#_03FA0A: JSL routine02FC6E

#_03FA0E: SEP #$30
#_03FA10: LDA.b #$00
#_03FA12: STA.w NMITIMEN
#_03FA15: STA.w $0F00
#_03FA18: STA.w $0F7E
#_03FA1B: LDA.b #$80
#_03FA1D: STA.w INIDISP
#_03FA20: STA.w $0F43

#_03FA23: REP #$30
#_03FA25: LDA.w #$4000
#_03FA28: STA.w VMADDL
#_03FA2B: LDX.w #$07FF
#_03FA2E: LDA.w #$0000

.branch03FA31
#_03FA31: STA.w VMDATAL
#_03FA34: DEX
#_03FA35: BPL .branch03FA31

#_03FA37: SEP #$30
#_03FA39: LDA.b #$3E
#_03FA3B: STA.w BG3SC
#_03FA3E: STA.w $0F49
#_03FA41: LDA.b #$16
#_03FA43: STA.w TM
#_03FA46: STA.w $0F74
#_03FA49: LDA.b #$FF
#_03FA4B: STA.w $0F7F
#_03FA4E: LDA.b #$81
#_03FA50: STA.w NMITIMEN
#_03FA53: STA.w $0F00
#_03FA56: LDA.b #$06
#_03FA58: JSL SomeDMAPrep_02CBD1

#_03FA5C: REP #$20
#_03FA5E: LDA.w #$3CE0
#_03FA61: STA.w $0A0B

#_03FA64: SEP #$20
#_03FA66: LDA.b #$20
#_03FA68: STA.w $0A0D
#_03FA6B: LDA.b #$1B
#_03FA6D: STA.w $0A0F
#_03FA70: LDA.b #$11
#_03FA72: STA.w $0A11
#_03FA75: JSL routine02BA95

#_03FA79: REP #$20
#_03FA7B: LDA.w #$3C83
#_03FA7E: STA.w $0A0B

#_03FA81: SEP #$20
#_03FA83: LDA.b #$1A
#_03FA85: STA.w $0A0D
#_03FA88: LDA.b #$04
#_03FA8A: STA.w $0A0F
#_03FA8D: LDA.b #$11
#_03FA8F: STA.w $0A11
#_03FA92: JSL routine02BA95

#_03FA96: REP #$20
#_03FA98: LDA.w #$3CE0
#_03FA9B: STA.w $0A0B
#_03FA9E: STZ.w $0C37
#_03FAA1: JSL ResetMenuRowAndColumn
#_03FAA5: JSR routine03E369
#_03FAA8: JSL BrightenScreen
#_03FAAC: PLP
#_03FAAD: RTS

;===================================================================================================

routine03FAAE:
#_03FAAE: PHP
#_03FAAF: JSL DarkenScreen
#_03FAB3: JSR routine03E6DF

#_03FAB6: SEP #$20
#_03FAB8: LDA.b #$1E
#_03FABA: STA.w TM
#_03FABD: STA.w $0F74
#_03FAC0: LDA.b #$3C
#_03FAC2: STA.w BG3SC
#_03FAC5: STA.w $0F49
#_03FAC8: STZ.w $0F7F
#_03FACB: LDA.b #$18
#_03FACD: STA.w $0A0D
#_03FAD0: LDA.b #$00
#_03FAD2: JSL routine02F609
#_03FAD6: LDA.b #$27
#_03FAD8: JSL routine02F609
#_03FADC: LDA.b #$00
#_03FADE: JSL routine02FC6E
#_03FAE2: LDA.b #$05
#_03FAE4: JSL SomeDMAPrep_02CBD1

#_03FAE8: REP #$20
#_03FAEA: LDA.w #$3DC4
#_03FAED: STA.w $0A1A
#_03FAF0: STA.w $0980
#_03FAF3: LDA.w #$0018
#_03FAF6: STA.w $0A1E
#_03FAF9: LDA.w #$000C
#_03FAFC: STA.w $0A20
#_03FAFF: LDA.w #$0002
#_03FB02: STA.w $0A1C
#_03FB05: STZ.w $0A33
#_03FB08: JSL routine00A17E
#_03FB0C: JSL BrightenScreen
#_03FB10: JSL routine0F84F6

#_03FB14: SEP #$20
#_03FB16: LDA.b #$07
#_03FB18: JSL InitializeTextBoxToSizeForNewMessage
#_03FB1C: JSL routine00A056
#_03FB20: PLP
#_03FB21: RTS

;===================================================================================================

routine03FB22:
#_03FB22: PHP
#_03FB23: SEP #$30

#_03FB25: STZ.w $0A58

#_03FB28: STZ.w $0B3C

#_03FB2B: LDA.b #$0C
#_03FB2D: STA.w $0B3D

#_03FB30: REP #$30

#_03FB32: LDA.w $0B5F
#_03FB35: AND.w #$00FF
#_03FB38: ASL A
#_03FB39: TAX

#_03FB3A: LDA.w #$0000

.clear_next
#_03FB3D: STA.w $0B61,X

#_03FB40: DEX
#_03FB41: BPL .clear_next

#_03FB43: PLP
#_03FB44: RTS

;===================================================================================================

routine03FB45:
#_03FB45: PHP
#_03FB46: PHB
#_03FB47: PHK
#_03FB48: PLB

#_03FB49: SEP #$20
#_03FB4B: JSR routine03FBB7
#_03FB4E: LDA.w $0B5F
#_03FB51: CMP.b #$01
#_03FB53: BCS .branch03FB85

#_03FB55: LDA.b #$01
#_03FB57: STA.w $0A58
#_03FB5A: PLB
#_03FB5B: PLP
#_03FB5C: RTL

.branch03FB85
#_03FB5D: SEP #$20
#_03FB5F: LDA.b #$00
#_03FB61: STA.w $0A3B
#_03FB64: JSR routine03F9F5

.branch03FB67
#_03FB67: SEP #$30
#_03FB69: LDA.b #$0C
#_03FB6B: STA.w $0B3D
#_03FB6E: LDA.b #$03
#_03FB70: STA.w $0B3C
#_03FB73: JSR routine03E1AB
#_03FB76: STZ.w $0B3C
#_03FB79: JSR routine03E369
#_03FB7C: JSR routine03E12D
#_03FB7F: JSR routine03FC10

#_03FB82: SEP #$20
#_03FB84: LDA.w $0A58
#_03FB87: BNE .branch03FBB1

#_03FB89: JSR routine03FBB7
#_03FB8C: DEC.w $0B3D
#_03FB8F: LDA.b #$08
#_03FB91: STA.w $0A3B
#_03FB94: STA.w $0B3C
#_03FB97: JSR routine03E1AB
#_03FB9A: LDA.b #$02
#_03FB9C: STA.w $0A3B
#_03FB9F: LDA.b #$01
#_03FBA1: STA.w $0B3C
#_03FBA4: JSR routine03E369
#_03FBA7: JSR routine03FD17

#_03FBAA: SEP #$20
#_03FBAC: LDA.w $0A58
#_03FBAF: BNE .branch03FB67

.branch03FBB1
#_03FBB1: JSR routine03FAAE

#_03FBB4: PLB

#_03FBB5: PLP
#_03FBB6: RTL

;===================================================================================================

routine03FBB7:
#_03FBB7: PHP
#_03FBB8: SEP #$30

#_03FBBA: JSR routine03E0C5
#_03FBBD: JSR routine03E0F4
#_03FBC0: JSR routine03FBE3
#_03FBC3: BCS .exit

#_03FBC5: LDA.b #$FC
#_03FBC7: JSL LookForItemInInventory
#_03FBCB: BCC .exit

#_03FBCD: INC.w $0B5F

#_03FBD0: REP #$20

#_03FBD2: JSR routine03E0F4

#_03FBD5: LDA.w #$0109
#_03FBD8: STA.w $098C,Y

#_03FBDB: LDA.w #$001A
#_03FBDE: STA.w $09AC,Y

.exit
#_03FBE1: PLP
#_03FBE2: RTS

;===================================================================================================

routine03FBE3:
#_03FBE3: PHP
#_03FBE4: REP #$30

#_03FBE6: LDX.w #$0180
#_03FBE9: LDY.w #$0000

.check_next_demon
#_03FBEC: LDA.w $1000,X
#_03FBEF: BPL .not_this_demon

#_03FBF1: LDA.w $1002,X
#_03FBF4: AND.w #$F640
#_03FBF7: BNE .not_this_demon

#_03FBF9: INY

.not_this_demon
#_03FBFA: TXA
#_03FBFB: CLC
#_03FBFC: ADC.w #$0060
#_03FBFF: TAX

#_03FC00: CPX.w #$0600
#_03FC03: BNE .check_next_demon

#_03FC05: CPY.w #$000C
#_03FC08: BNE .fail

#_03FC0A: PLP
#_03FC0B: SEC

#_03FC0C: RTS

.fail
#_03FC0D: PLP
#_03FC0E: CLC

#_03FC0F: RTS

;===================================================================================================

routine03FC10:
#_03FC10: PHP
#_03FC11: REP #$30
#_03FC13: LDA.w $0A0B
#_03FC16: CLC
#_03FC17: ADC.w #$0061
#_03FC1A: STA.w $0980
#_03FC1D: LDX.w #$0000

.branch03FC20
#_03FC20: REP #$30
#_03FC22: PHX
#_03FC23: PHP
#_03FC24: SEP #$20
#_03FC26: LDA.b #$20
#_03FC28: STA.w $0A2C
#_03FC2B: STZ.w $0A33
#_03FC2E: JSR routine03E6DF
#_03FC31: CPX.w $0B5F
#_03FC34: BCS .branch03FCAD

#_03FC36: REP #$20
#_03FC38: LDA.w TheNumbers1Through12,X
#_03FC3B: JSL WriteSingleTileToMessageBuffer

#_03FC3F: SEP #$20
#_03FC41: LDA.b #$04
#_03FC43: STA.w $0A33
#_03FC46: LDA.b #ClassNamePointers>>16
#_03FC48: STA.w $00C5

#_03FC4B: REP #$20
#_03FC4D: TXA
#_03FC4E: ASL A
#_03FC4F: TAX
#_03FC50: LDA.w #ClassNamePointers>>0
#_03FC53: STA.w $00C3
#_03FC56: LDA.w $09AC,X
#_03FC59: AND.w #$00FF
#_03FC5C: STA.w $0506
#_03FC5F: STA.w $0A39
#_03FC62: PHP
#_03FC63: REP #$30
#_03FC65: PHA
#_03FC66: PHX
#_03FC67: PHY
#_03FC68: PHD
#_03FC69: PHB
#_03FC6A: JSR WriteIndexedEntityName

#_03FC6D: REP #$30
#_03FC6F: PLB
#_03FC70: PLD
#_03FC71: PLY
#_03FC72: PLX
#_03FC73: PLA
#_03FC74: PLP

#_03FC75: SEP #$20
#_03FC77: LDA.b #$10
#_03FC79: STA.w $0A33
#_03FC7C: LDA.b #$CF
#_03FC7E: JSL WriteNextMessageChar
#_03FC82: LDA.b #$12
#_03FC84: STA.w $0A33
#_03FC87: LDA.b #$09
#_03FC89: STA.w $00C5

#_03FC8C: REP #$20
#_03FC8E: LDA.w #DemonNamePointers
#_03FC91: STA.w $00C3
#_03FC94: LDA.w $098C,X
#_03FC97: STA.w $0A39

;---------------------------------------------------------------------------------------------------

#_03FC9A: PHP
#_03FC9B: REP #$30
#_03FC9D: PHA
#_03FC9E: PHX
#_03FC9F: PHY
#_03FCA0: PHD
#_03FCA1: PHB

#_03FCA2: JSR WriteIndexedEntityName

#_03FCA5: REP #$30
#_03FCA7: PLB
#_03FCA8: PLD
#_03FCA9: PLY
#_03FCAA: PLX
#_03FCAB: PLA
#_03FCAC: PLP

.branch03FCAD
#_03FCAD: SEP #$20
#_03FCAF: LDA.b #$3C
#_03FCB1: STA.w $0A33
#_03FCB4: JSR routine0384F9
#_03FCB7: JSL RunFramesUntilDrawBufferEmpties

#_03FCBB: REP #$20
#_03FCBD: LDA.w $0980
#_03FCC0: CLC
#_03FCC1: ADC.w #$0040
#_03FCC4: STA.w $0980
#_03FCC7: PLP
#_03FCC8: PLX
#_03FCC9: INX

#_03FCCA: SEP #$10
#_03FCCC: CPX.w $0B3D
#_03FCCF: BEQ .branch03DCD4

#_03FCD1: JMP .branch03FC20

.branch03DCD4
#_03FCD4: SEP #$20
#_03FCD6: LDA.b #$10
#_03FCD8: STA.w $0F76
#_03FCDB: STA.w TS
#_03FCDE: LDA.b #$04
#_03FCE0: STA.w $0F7B
#_03FCE3: STA.w CGADSUB
#_03FCE6: LDA.b #$02
#_03FCE8: STA.w $09F4
#_03FCEB: STZ.w $09F0
#_03FCEE: STZ.w $09F2
#_03FCF1: STZ.w $09F3
#_03FCF4: LDA.w $0B5F
#_03FCF7: DEC A
#_03FCF8: STA.w $09F1
#_03FCFB: JSL routine02C8E9

#_03FCFF: REP #$30
#_03FD01: LDA.w $09F3
#_03FD04: AND.w #$00FF
#_03FD07: ASL A
#_03FD08: TAX
#_03FD09: LDA.w $098C,X
#_03FD0C: STA.w $0BED
#_03FD0F: LDA.w $09AC,X
#_03FD12: STA.w $0BF3
#_03FD15: PLP
#_03FD16: RTS

;===================================================================================================

routine03FD17:
#_03FD17: PHP
#_03FD18: REP #$30
#_03FD1A: LDA.w $0A0B
#_03FD1D: CLC
#_03FD1E: ADC.w #$0061
#_03FD21: STA.w $0980

#_03FD24: SEP #$20
#_03FD26: LDA.b #$01
#_03FD28: STA.w $0B3C
#_03FD2B: JSR routine03E41C

#_03FD2E: REP #$30
#_03FD30: LDX.w #$0000

.branch03FD33
#_03FD33: REP #$30
#_03FD35: PHX
#_03FD36: PHP
#_03FD37: SEP #$20
#_03FD39: LDA.b #$20
#_03FD3B: STA.w $0A2C
#_03FD3E: STZ.w $0A33
#_03FD41: JSR routine03E6DF
#_03FD44: CPX.w $0B5F
#_03FD47: BCC .branch03FD4C

#_03FD49: JMP .branch03FDD1

.branch03FD4C
#_03FD4C: REP #$20
#_03FD4E: LDA.w TheNumbers1Through12,X
#_03FD51: JSL WriteSingleTileToMessageBuffer

#_03FD55: SEP #$20
#_03FD57: LDA.b #$04
#_03FD59: STA.w $0A33
#_03FD5C: LDA.b #ClassNamePointers>>16
#_03FD5E: STA.w $00C5

#_03FD61: REP #$20
#_03FD63: TXA
#_03FD64: ASL A
#_03FD65: TAX
#_03FD66: LDA.w #ClassNamePointers>>0
#_03FD69: STA.w $00C3
#_03FD6C: LDA.w $09AC,X
#_03FD6F: AND.w #$00FF
#_03FD72: STA.w $0506
#_03FD75: STA.w $0A39
#_03FD78: PHP
#_03FD79: REP #$30
#_03FD7B: PHA
#_03FD7C: PHX
#_03FD7D: PHY
#_03FD7E: PHD
#_03FD7F: PHB
#_03FD80: JSR WriteIndexedEntityName

#_03FD83: REP #$30
#_03FD85: PLB
#_03FD86: PLD
#_03FD87: PLY
#_03FD88: PLX
#_03FD89: PLA
#_03FD8A: PLP

#_03FD8B: SEP #$20
#_03FD8D: LDA.b #$10
#_03FD8F: STA.w $0A33
#_03FD92: LDA.b #$CF
#_03FD94: JSL WriteNextMessageChar
#_03FD98: LDA.b #$12
#_03FD9A: STA.w $0A33
#_03FD9D: LDA.b #$09
#_03FD9F: STA.w $00C5

#_03FDA2: REP #$20
#_03FDA4: LDA.w #DemonNamePointers
#_03FDA7: STA.w $00C3
#_03FDAA: LDA.w $098C,X
#_03FDAD: STA.w $0A39
#_03FDB0: PHP
#_03FDB1: REP #$30
#_03FDB3: PHA
#_03FDB4: PHX
#_03FDB5: PHY
#_03FDB6: PHD
#_03FDB7: PHB
#_03FDB8: JSR WriteIndexedEntityName

#_03FDBB: REP #$30
#_03FDBD: PLB
#_03FDBE: PLD
#_03FDBF: PLY
#_03FDC0: PLX
#_03FDC1: PLA
#_03FDC2: PLP

#_03FDC3: SEP #$20
#_03FDC5: LDA.b #$24
#_03FDC7: STA.w $0A33
#_03FDCA: JSR routine03FE3E
#_03FDCD: JSL WriteSingleTileToMessageBuffer

.branch03FDD1
#_03FDD1: SEP #$20
#_03FDD3: LDA.b #$3C
#_03FDD5: STA.w $0A33
#_03FDD8: JSR routine0384F9
#_03FDDB: JSL RunFramesUntilDrawBufferEmpties

#_03FDDF: REP #$20
#_03FDE1: LDA.w $0980
#_03FDE4: CLC
#_03FDE5: ADC.w #$0040
#_03FDE8: STA.w $0980
#_03FDEB: PLP
#_03FDEC: PLX
#_03FDED: INX

#_03FDEE: SEP #$10
#_03FDF0: CPX.w $0B3D
#_03FDF3: BEQ .branch03FDF8

#_03FDF5: JMP .branch03FD33

;---------------------------------------------------------------------------------------------------

.branch03FDF8
#_03FDF8: SEP #$20
#_03FDFA: LDA.b #$10
#_03FDFC: STA.w $0F76
#_03FDFF: STA.w TS
#_03FE02: LDA.b #$04
#_03FE04: STA.w $0F7B
#_03FE07: STA.w CGADSUB
#_03FE0A: LDA.b #$08
#_03FE0C: STA.w $09F4
#_03FE0F: STZ.w $09F0
#_03FE12: STZ.w $09F2
#_03FE15: STZ.w $09F3
#_03FE18: LDA.w $0B5F
#_03FE1B: DEC A
#_03FE1C: STA.w $09F1
#_03FE1F: JSL routine02C8E9

#_03FE23: SEP #$30
#_03FE25: LDA.w $0A58
#_03FE28: BNE .exit

#_03FE2A: LDA.w $09F3
#_03FE2D: ASL A
#_03FE2E: TAX

#_03FE2F: REP #$20
#_03FE31: LDA.w $098C,X
#_03FE34: STA.w $0BEF

#_03FE37: SEP #$20
#_03FE39: JSR routine03FE3E

.exit
#_03FE3C: PLP
#_03FE3D: RTS

;===================================================================================================

routine03FE3E:
#_03FE3E: PHX
#_03FE3F: PHP
#_03FE40: REP #$30
#_03FE42: LDY.w #$0000

.branch03FE45
#_03FE45: LDA.w data03FE84,Y
#_03FE48: CMP.w #$FFFF
#_03FE4B: BEQ .branch03FE78

#_03FE4D: CMP.w $0BED
#_03FE50: BNE .branch03FE70

#_03FE52: LDA.w data03FE86,Y
#_03FE55: CMP.w $098C,X
#_03FE58: BNE .branch03FE70

#_03FE5A: LDA.w data03FE88,Y
#_03FE5D: STA.w $0C0B
#_03FE60: LDA.w data03FE8A,Y
#_03FE63: STA.w $0A50

#_03FE66: SEP #$20
#_03FE68: STZ.w $0A58
#_03FE6B: LDA.b #$A9
#_03FE6D: PLP
#_03FE6E: PLX
#_03FE6F: RTS

.branch03FE70
#_03FE70: TYA
#_03FE71: CLC
#_03FE72: ADC.w #$0008
#_03FE75: TAY
#_03FE76: BRA .branch03FE45

.branch03FE78
#_03FE78: SEP #$20
#_03FE7A: LDA.b #$FF
#_03FE7C: STA.w $0A58
#_03FE7F: LDA.b #$93
#_03FE81: PLP
#_03FE82: PLX
#_03FE83: RTS

data03FE84:
#_03FE84: dw $012F

data03FE86:
#_03FE86: dw $0040

data03FE88:
#_03FE88: dw $0130

data03FE8A:
#_03FE8A: dw $001D,$0130,$003F,$0131
#_03FE92: dw $0038,$0131,$003E,$0132
#_03FE9A: dw $003F,$012B,$0051,$012C
#_03FEA2: dw $0039,$012B,$0015,$012D
#_03FEAA: dw $003A,$012B,$0109,$012E
#_03FEB2: dw $003B,$FFFF

;===================================================================================================

Vestigial_03FEB6:
#_03FEB6: PLB
#_03FEB7: PLD
#_03FEB8: PLY
#_03FEB9: PLX
#_03FEBA: PLA
#_03FEBB: PLP

#_03FEBC: SEP #$20
#_03FEBE: LDA.b #$10
#_03FEC0: STA.w $0A33
#_03FEC3: LDA.b #$CF
#_03FEC5: JSL.l $038524
#_03FEC9: LDA.b #$12
#_03FECB: STA.w $0A33
#_03FECE: LDA.b #$09
#_03FED0: STA.w $00C5

#_03FED3: REP #$20
#_03FED5: LDA.w #DemonNamePointers
#_03FED8: STA.w $00C3
#_03FEDB: LDA.w $098C,X
#_03FEDE: STA.w $0A39
#_03FEE1: PHP
#_03FEE2: REP #$30
#_03FEE4: PHA
#_03FEE5: PHX
#_03FEE6: PHY
#_03FEE7: PHD
#_03FEE8: PHB
#_03FEE9: JSR.w $03963D ; bad call

#_03FEEC: REP #$30
#_03FEEE: PLB
#_03FEEF: PLD
#_03FEF0: PLY
#_03FEF1: PLX
#_03FEF2: PLA
#_03FEF3: PLP

#_03FEF4: SEP #$20
#_03FEF6: LDA.b #$24
#_03FEF8: STA.w $0A33
#_03FEFB: JSR routine03FF6F
#_03FEFE: JSL $0385D3 ; bad call

#_03FF02: SEP #$20
#_03FF04: LDA.b #$3C
#_03FF06: STA.w $0A33
#_03FF09: JSR.w $038504 ; bad call
#_03FF0C: JSL RunFramesUntilDrawBufferEmpties

#_03FF10: REP #$20
#_03FF12: LDA.w $0980
#_03FF15: CLC
#_03FF16: ADC.w #$0040
#_03FF19: STA.w $0980
#_03FF1C: PLP
#_03FF1D: PLX
#_03FF1E: INX

#_03FF1F: SEP #$10
#_03FF21: CPX.w $0B3D
#_03FF24: BEQ .branch03FF29

#_03FF26: JMP.w $03FE64 ; bad call

.branch03FF29
#_03FF29: SEP #$20
#_03FF2B: LDA.b #$10
#_03FF2D: STA.w $0F76
#_03FF30: STA.w TS
#_03FF33: LDA.b #$04
#_03FF35: STA.w $0F7B
#_03FF38: STA.w CGADSUB
#_03FF3B: LDA.b #$08
#_03FF3D: STA.w $09F4
#_03FF40: STZ.w $09F0
#_03FF43: STZ.w $09F2
#_03FF46: STZ.w $09F3
#_03FF49: LDA.w $0B5F
#_03FF4C: DEC A
#_03FF4D: STA.w $09F1
#_03FF50: JSL.l $02C929

#_03FF54: SEP #$30
#_03FF56: LDA.w $0A58
#_03FF59: BNE .exit

#_03FF5B: LDA.w $09F3
#_03FF5E: ASL A
#_03FF5F: TAX

#_03FF60: REP #$20
#_03FF62: LDA.w $098C,X
#_03FF65: STA.w $0BEF

#_03FF68: SEP #$20
#_03FF6A: JSR routine03FF6F

.exit
#_03FF6D: PLP
#_03FF6E: RTS

;===================================================================================================

routine03FF6F:
#_03FF6F: PHX
#_03FF70: PHP
#_03FF71: REP #$30
#_03FF73: LDY.w #$0000

.branch03FF76
#_03FF76: LDA.w data03FFB5+0,Y
#_03FF79: CMP.w #$FFFF
#_03FF7C: BEQ .branch03FFA9

#_03FF7E: CMP.w $0BED
#_03FF81: BNE .branch03FFA1

#_03FF83: LDA.w data03FFB5+2,Y
#_03FF86: CMP.w $098C,X
#_03FF89: BNE .branch03FFA1

#_03FF8B: LDA.w data03FFB5+4,Y
#_03FF8E: STA.w $0C0B
#_03FF91: LDA.w data03FFB5+6,Y
#_03FF94: STA.w $0A50

#_03FF97: SEP #$20
#_03FF99: STZ.w $0A58
#_03FF9C: LDA.b #$A9
#_03FF9E: PLP
#_03FF9F: PLX
#_03FFA0: RTS

.branch03FFA1
#_03FFA1: TYA
#_03FFA2: CLC
#_03FFA3: ADC.w #$0008
#_03FFA6: TAY
#_03FFA7: BRA .branch03FF76

.branch03FFA9
#_03FFA9: SEP #$20
#_03FFAB: LDA.b #$FF
#_03FFAD: STA.w $0A58
#_03FFB0: LDA.b #$93
#_03FFB2: PLP
#_03FFB3: PLX
#_03FFB4: RTS

data03FFB5:
#_03FFB5: dw $012F, $0040, $0130, $001D
#_03FFBD: dw $0130, $003F, $0131, $0038
#_03FFC5: dw $0131, $003E, $0132, $003F
#_03FFCD: dw $012B, $0051, $012C, $0039
#_03FFD5: dw $012B, $0015, $012D, $003A
#_03FFDD: dw $012B, $0109, $012E, $003B
#_03FFE5: dw $FFFF


#_03FFE7: dw $2E01,$3B01
#_03FFEB: dw $FF00,$00FF,$012D,$003A
#_03FFF3: dw $012B,$0109,$012E,$003B
#_03FFFB: dw $FFFF,$FFFF
#_03FFFF: db $56

;===================================================================================================