org $028000

;===================================================================================================

routine028000:
#_028000: PHP
#_028001: SEP #$20
#_028003: STZ.w $0C4F
#_028006: LDA.b #$FF
#_028008: STA.w $0F7F
#_02800B: JSL routine008F57
#_02800F: JSR Module_Overworld

.return
#_028012: SEP #$20
#_028014: LDA.w $0C4F
#_028017: BPL .branch028025

#_028019: STZ.w $0C4F

#_02801C: REP #$20
#_02801E: LDA.w #.return-1
#_028021: PHA
#_028022: JMP Module_Overworld_loop

.branch028025
#_028025: SEP #$20
#_028027: JSL DarkenScreen
#_02802B: LDA.b #$FF
#_02802D: STA.w $0A71
#_028030: PLP
#_028031: RTL

;===================================================================================================

; TODO overworld module?
Module_Overworld:
#_028032: SEP #$30

#_028034: LDA.b #Module_Overworld>>16
#_028036: PHA
#_028037: PLB

#_028038: LDA.w $040F
#_02803B: AND.b #$F0
#_02803D: STA.w $040F

#_028040: STZ.w $070C
#_028043: STZ.w $070D
#_028046: STZ.w $0EEF

#_028049: LDA.b #$00
#_02804B: STA.w NMITIMEN
#_02804E: STA.w $0F00
#_028051: STA.w $0F7E

#_028054: LDA.b #$80
#_028056: STA.w INIDISP
#_028059: STA.w $0F43

#_02805C: LDA.b #$FE
#_02805E: JSL ClearGameProgressBit_long

#_028062: LDA.b #$FF
#_028064: STA.w $0B35

#_028067: LDA.b #$01
#_028069: JSR routine02C10F

#_02806C: STZ.w $0B36

#_02806F: JSL Reset_OAMrelatedWRAM
#_028073: JSL ZeroVRAM_02
#_028077: JSL routine028DB7
#_02807B: JSL routine028A36

#_02807F: REP #$20
#_028081: LDA.w #$0078
#_028084: STA.w $0B00
#_028087: LDA.w #$005F
#_02808A: STA.w $0B02

#_02808D: SEP #$20
#_02808F: STZ.w $07F1
#_028092: LDA.b #$81
#_028094: STA.w NMITIMEN
#_028097: STA.w $0F00
#_02809A: JSR routine02B8D8

#_02809D: SEP #$20
#_02809F: STZ.w $0B3B
#_0280A2: LDA.b #$FF
#_0280A4: STA.w $0B3A
#_0280A7: JSR routine028659
#_0280AA: JSL BrightenScreen
#_0280AE: JSL routine02813F
#_0280B2: JSR routine02BC34
#_0280B5: JSR routine02B8D8
#_0280B8: JSL AddSelfAsVectorAndMakeSpace

#_0280BC: SEP #$20
#_0280BE: STZ.w $0B34
#_0280C1: STZ.w $0F06
#_0280C4: JSR routine02B75C
#_0280C7: JSR routine02B999
#_0280CA: JSR routine02AF6A

.loop
#_0280CD: SEP #$30
#_0280CF: JSR routine02868A
#_0280D2: JSL AddSelfAsVector

#_0280D6: INC.w $0B2D
#_0280D9: JSL routine0F8399
#_0280DD: JSR routine02B7E4
#_0280E0: JSR routine02AF6A
#_0280E3: JSR routine02821F
#_0280E6: JSL routine028172
#_0280EA: JSR routine028FAF

#_0280ED: SEP #$20
#_0280EF: LDA.w $0C4F
#_0280F2: BEQ .branch0280F5
#_0280F4: RTS

.branch0280F5
#_0280F5: REP #$20
#_0280F7: LDA.w $0F2D
#_0280FA: BEQ .branch02810B

#_0280FC: SEP #$20
#_0280FE: STZ.w $0B3B
#_028101: LDA.w $0B3A
#_028104: BMI .branch028125

#_028106: JSR routine02BCCE
#_028109: BRA .branch028125

.branch02810B
#_02810B: SEP #$20
#_02810D: INC.w $0B3B
#_028110: LDA.w $0B3B
#_028113: CMP.b #$78
#_028115: BCC .branch028125

#_028117: DEC.w $0B3B
#_02811A: LDA.w $0B3A
#_02811D: BPL .branch028122

#_02811F: STZ.w $0B3A

.branch028122
#_028122: JSR Handle_IdleHUD

.branch028125
#_028125: REP #$30

#_028127: LDA.w $0F2B
#_02812A: AND.w #$0080 ; Checks for A button press
#_02812D: BEQ .branch02813C

#_02812F: SEP #$20

#_028131: LDA.w $0B14
#_028134: BNE .branch02813C

#_028136: JSR routine02BF91
#_028139: JMP .loop

.branch02813C
#_02813C: JMP .loop

;===================================================================================================

routine02813F:
#_02813F: PHP
#_028140: SEP #$30

#_028142: LDA.b #$2F
#_028144: JSL TestGameProgressBit
#_028148: BCS .branch02814E

#_02814A: LDA.b #$4E ; SONG 4E
#_02814C: BRA .branch028150

.branch02814E
#_02814E: LDA.b #$4F ; SONG 4F

.branch028150
#_028150: JSL WriteAPUCareful
#_028154: BRA .branch02816B

routine028156:
#_028156: PHP
#_028157: SEP #$30

#_028159: LDA.b #$2F
#_02815B: JSL TestGameProgressBit
#_02815F: BCS .branch028165

#_028161: LDA.b #$4E ; SONG 4E
#_028163: BRA .branch028167

.branch028165
#_028165: LDA.b #$4F ; SONG 4F

.branch028167
#_028167: JSL WriteAPU

.branch02816B
#_02816B: LDA.b #$01
#_02816D: STA.w $0EFE
#_028170: PLP
#_028171: RTL

;===================================================================================================

routine028172:
#_028172: PHP
#_028173: PHB
#_028174: PHK
#_028175: PLB

#_028176: SEP #$30
#_028178: LDA.w $0404
#_02817B: BEQ .branch028185

#_02817D: LDA.w $0B14
#_028180: BEQ .branch028185
#_028182: JMP .branch028200

.branch028185
#_028185: LDA.w $07F1
#_028188: BMI .branch02818D
#_02818A: JMP .branch028200

.branch02818D
#_02818D: AND.b #$0F
#_02818F: BEQ .branch0281CF

#_028191: STZ.w $07F1

#_028194: REP #$30
#_028196: LDA.w $1002
#_028199: AND.w #$F640
#_02819C: BNE .branch028200

#_02819E: JSL routine02BE47
#_0281A2: JSL BrightenScreen

#_0281A6: REP #$20
#_0281A8: LDA.w #$02FB
#_0281AB: STA.w $0A12

#_0281AE: SEP #$20
#_0281B0: LDA.b #$03
#_0281B2: JSL InitializeTextBoxToSizeForNewMessage
#_0281B6: JSL routine00A056
#_0281BA: JSL LoadClassyMessage
#_0281BE: JSL routine03837C
#_0281C2: JSR routine028203
#_0281C5: JSL UpdateDialogBox
#_0281C9: JSL routine02BEEB
#_0281CD: BRA .branch028200

.branch0281CF
#_0281CF: STZ.w $07F1

#_0281D2: REP #$20
#_0281D4: LDA.w #$02FC
#_0281D7: STA.w $0A12

#_0281DA: SEP #$20
#_0281DC: LDA.b #$03
#_0281DE: JSL InitializeTextBoxToSizeForNewMessage
#_0281E2: JSL routine00A056
#_0281E6: JSL LoadClassyMessage
#_0281EA: JSL routine03837C
#_0281EE: JSL UpdateDialogBox
#_0281F2: JSR routine028203

#_0281F5: SEP #$20
#_0281F7: LDA.w $0404
#_0281FA: BNE .branch028200

#_0281FC: JSL routine00A17E

.branch028200
#_028200: PLB
#_028201: PLP
#_028202: RTL

;===================================================================================================

routine028203:
#_028203: PHP
#_028204: REP #$30
#_028206: LDA.w $102E
#_028209: LDX.w #$0000
#_02820C: LDY.w #$000A
#_02820F: JSL DivisionBig_XA_by_Y
#_028213: LDA.w $102E
#_028216: SEC
#_028217: SBC.w $0E80
#_02821A: STA.w $102E
#_02821D: PLP
#_02821E: RTS

;===================================================================================================

routine02821F:
#_02821F: SEP #$20
#_028221: LDA.b #$01
#_028223: STA.w $0ED4
#_028226: LDA.w $0B14
#_028229: BNE .branch028251

#_02822B: STZ.w $0B36

#_02822E: REP #$20
#_028230: LDA.w $0F2D
#_028233: AND.w #$0F00
#_028236: BNE .pressed_direction

#_028238: RTS

.pressed_direction
#_028239: SEP #$30
#_02823B: XBA
#_02823C: TAX
#_02823D: LDA.w OverworldMovement_DirectionIndices,X
#_028240: STA.w $0B16

#_028243: LDX.b #$10
#_028245: STX.w $0B14
#_028248: STZ.w $0B15

#_02824B: JSR routine02AEF9
#_02824E: JSR routine028330

.branch028251
#_028251: SEP #$20
#_028253: LDA.w $0B16
#_028256: BPL .branch02825B

#_028258: JMP routine028386

;---------------------------------------------------------------------------------------------------

.branch02825B
#_02825B: LDA.w $0B14
#_02825E: AND.b #$07
#_028260: BNE .branch028265

#_028262: JSR routine0287B1

.branch028265
#_028265: SEP #$30
#_028267: LDA.w $0B16
#_02826A: ASL A
#_02826B: TAX

#_02826C: REP #$20
#_02826E: LDA.w $0F51
#_028271: CLC
#_028272: ADC.w data0282E0,X
#_028275: STA.w $0F51
#_028278: STA.w $0F4D
#_02827B: LDA.w $0F53
#_02827E: CLC
#_02827F: ADC.w data0282F0,X
#_028282: STA.w $0F53
#_028285: STA.w $0F4F

#_028288: SEP #$20
#_02828A: LDA.b #$01
#_02828C: STA.w $0ED4
#_02828F: DEC.w $0B14
#_028292: BEQ .branch028295

#_028294: RTS

.branch028295
#_028295: JSR routine0282C2
#_028298: JSR routine0286E7

#_02829B: SEP #$20
#_02829D: LDA.w $0B34
#_0282A0: INC A
#_0282A1: AND.b #$07
#_0282A3: STA.w $0B34
#_0282A6: BNE .branch0282AB

#_0282A8: JSR routine02B988

.branch0282AB
#_0282AB: JSL routine0F98C4

#_0282AF: SEP #$30
#_0282B1: LDA.w $0B2A
#_0282B4: ASL A
#_0282B5: TAX

#_0282B6: REP #$20
#_0282B8: LDA.w OverworldMovementVectors,X
#_0282BB: STA.w $00E0
#_0282BE: JMP ($00E0)

;===================================================================================================

Overworld_DoNothingNothing:
#_0282C1: RTS

;===================================================================================================

routine0282C2:
#_0282C2: PHP
#_0282C3: SEP #$30
#_0282C5: LDX.w $0B2A
#_0282C8: LDA.w data0282D0,X
#_0282CB: STA.w $0B36
#_0282CE: PLP
#_0282CF: RTS

data0282D0:
#_0282D0: dw $FF00,$FFFF,$FFFF,$FFFF
#_0282D8: dw $0000,$00FF,$0000,$0000

data0282E0:
#_0282E0: dw  0,  1,  1,  1
#_0282E8: dw  0, -1, -1, -1

data0282F0:
#_0282F0: dw -1, -1,  0,  1
#_0282F8: dw  1,  1,  0, -1

;===================================================================================================

OverworldMovement_DirectionIndices:
#_028300: db $FF ; ....
#_028301: db $02 ; ...r
#_028302: db $06 ; ..l.
#_028303: db $FF ; ..lr

#_028304: db $04 ; .d..
#_028305: db $03 ; .d.r
#_028306: db $05 ; .dl.
#_028307: db $FF ; .dlr

#_028308: db $00 ; u...
#_028309: db $01 ; u..r
#_02830A: db $07 ; u.l.
#_02830B: db $FF ; u.lr

#_02830C: db $FF ; ud..
#_02830D: db $FF ; ud.r
#_02830E: db $FF ; udl.
#_02830F: db $FF ; udlr

;---------------------------------------------------------------------------------------------------

OverworldMovementVectors:
#_028310: dw Overworld_DoNothingNothing
#_028312: dw Overworld_DoNothingNothing
#_028314: dw Overworld_DoNothingNothing
#_028316: dw Overworld_DoNothingNothing
#_028318: dw Overworld_DoNothingNothing
#_02831A: dw Overworld_DoNothingNothing
#_02831C: dw Overworld_DoNothingNothing
#_02831E: dw Overworld_DoNothingNothing
#_028320: dw Overworld_EnactInteraction
#_028322: dw Overworld_EnactEntrance
#_028324: dw Overworld_DoNothingNothing
#_028326: dw Overworld_DoNothingNothing
#_028328: dw Overworld_DoNothingNothing
#_02832A: dw Overworld_DoNothingNothing
#_02832C: dw Overworld_DoNothingNothing
#_02832E: dw Overworld_DoNothingNothing

;===================================================================================================

routine028330:
#_028330: SEP #$20
#_028332: STZ.w $0B2A
#_028335: JSL routine028708
#_028339: JSR routine028636

#_02833C: SEP #$20
#_02833E: LDA.w $0B2A
#_028341: CMP.b #$08
#_028343: BEQ .branch028352

#_028345: CMP.b #$09
#_028347: BEQ .branch028352

#_028349: CMP.b #$0A
#_02834B: BEQ .branch028352

#_02834D: CMP.b #$07
#_02834F: BCC .branch028352

#_028351: RTS

.branch028352
#_028352: SEP #$30
#_028354: LDA.w $0B29
#_028357: AND.b #$0F
#_028359: ASL A
#_02835A: TAX

#_02835B: REP #$20
#_02835D: LDA.w .vectors,X
#_028360: STA.w $00E0
#_028363: JMP ($00E0)

.vectors
#_028366: dw routine028386
#_028368: dw routine028394
#_02836A: dw routine0383CB
#_02836C: dw routine028403
#_02836E: dw routine028509
#_028370: dw routine02853E
#_028372: dw routine028571
#_028374: dw routine0285C6
#_028376: dw routine0285F3
#_028378: dw routine028630
#_02837A: dw routine028632
#_02837C: dw routine028635
#_02837E: dw routine028635
#_028380: dw routine028635
#_028382: dw routine028635
#_028384: dw routine028635

;===================================================================================================

routine028386:
#_028386: SEP #$20
#_028388: LDA.b #$FF
#_02838A: STA.w $0B16
#_02838D: STZ.w $0B14
#_028390: STZ.w $0B15
#_028393: RTS

;===================================================================================================

routine028394:
#_028394: SEP #$10
#_028396: SEP #$20
#_028398: LDX.w $0B16
#_02839B: LDA.w data0283BD,X
#_02839E: STA.w $0B16
#_0283A1: TAX
#_0283A2: LDA.w $0B21,X
#_0283A5: AND.b #$0F
#_0283A7: STA.w $0B2A
#_0283AA: LDY.b #$00

.branch0283AC
#_0283AC: LDA.w data0283C5,Y
#_0283AF: BMI .branch0283B9

#_0283B1: CMP.w $0B2A
#_0283B4: BEQ .branch0283BC

#_0283B6: INY
#_0283B7: BRA .branch0283AC

.branch0283B9
#_0283B9: JMP routine028386

.branch0283BC
#_0283BC: RTS

;===================================================================================================

data0283BD:
#_0283BD: db $00,$00,$FF,$04,$04,$04,$FF,$00

data0283C5:
#_0283C5: db $01,$03,$06,$08,$0A,$FF

routine0383CB:
#_0283CB: SEP #$10
#_0283CD: SEP #$20
#_0283CF: LDX.w $0B16
#_0283D2: LDA.w data0283F4,X
#_0283D5: STA.w $0B16
#_0283D8: TAX
#_0283D9: LDA.w $0B21,X
#_0283DC: AND.b #$0F
#_0283DE: STA.w $0B2A
#_0283E1: LDY.b #$00

.branch0283E3
#_0283E3: LDA.w data0283FC,Y
#_0283E6: BMI .branch0283F0

#_0283E8: CMP.w $0B2A
#_0283EB: BEQ .branch0283F3

#_0283ED: INY
#_0283EE: BRA .branch0283E3

.branch0283F0
#_0283F0: JMP routine028386

.branch0283F3
#_0283F3: RTS

data0283F4:
#_0283F4: db $FF,$02,$02,$02,$FF,$06,$06,$06

data0283FC:
#_0283FC: db $02,$03,$06,$08,$09,$0A,$FF

;===================================================================================================

routine028403:
#_028403: SEP #$30
#_028405: LDX.w $0B16
#_028408: LDA.w $0B21,X
#_02840B: AND.b #$0F
#_02840D: STA.w $0B2A
#_028410: CMP.b #$03
#_028412: BNE .branch028415

#_028414: RTS

.branch028415
#_028415: CMP.b #$06
#_028417: BNE .branch02841A

#_028419: RTS

.branch02841A
#_02841A: CMP.w data028501,X
#_02841D: BNE .branch028420

#_02841F: RTS

.branch028420
#_028420: CMP.b #$08
#_028422: BNE .branch02842E

#_028424: LDA.w $0B16
#_028427: AND.b #$01
#_028429: BNE .branch02842C

#_02842B: RTS

.branch02842C
#_02842C: BRA .branch02843A

.branch02842E
#_02842E: CMP.b #$09
#_028430: BNE .branch02843A

#_028432: LDA.w $0B16
#_028435: AND.b #$01
#_028437: BNE .branch02843A

#_028439: RTS

.branch02843A
#_02843A: LDA.w $0B16
#_02843D: ASL A
#_02843E: TAX
#_02843F: LDA.w vectors0284F1+0,X
#_028442: STA.w $00E0
#_028445: LDA.w vectors0284F1+1,X
#_028448: STA.w $00E1
#_02844B: JMP ($00E0)

;===================================================================================================

routine02844E:
#_02844E: LDX.b #$07
#_028450: LDA.w $0B21,X
#_028453: AND.b #$0F
#_028455: STA.w $0B2A
#_028458: CMP.b #$05
#_02845A: BEQ .branch028472

#_02845C: CMP.b #$03
#_02845E: BEQ .branch028472

#_028460: LDX.b #$01
#_028462: LDA.w $0B21,X
#_028465: AND.b #$0F
#_028467: CMP.b #$04
#_028469: BEQ .branch028472

#_02846B: CMP.b #$03
#_02846D: BEQ .branch028472

#_02846F: JMP routine028386

.branch028472
#_028472: STX.w $0B16
#_028475: RTS

;===================================================================================================

routine028476:
#_028476: LDX.b #$01
#_028478: LDA.w $0B21,X
#_02847B: AND.b #$0F
#_02847D: STA.w $0B2A
#_028480: CMP.b #$04
#_028482: BEQ .branch02849A

#_028484: CMP.b #$03
#_028486: BEQ .branch02849A

#_028488: LDX.b #$03
#_02848A: LDA.w $0B21,X
#_02848D: AND.b #$0F
#_02848F: CMP.b #$05
#_028491: BEQ .branch02849A

#_028493: CMP.b #$03
#_028495: BEQ .branch02849A

#_028497: JMP routine028386

.branch02849A
#_02849A: STX.w $0B16
#_02849D: RTS

;===================================================================================================

routine02849E:
#_02849E: LDX.b #$03
#_0284A0: LDA.w $0B21,X
#_0284A3: AND.b #$0F
#_0284A5: STA.w $0B2A
#_0284A8: CMP.b #$05
#_0284AA: BEQ .branch0284C2

#_0284AC: CMP.b #$03
#_0284AE: BEQ .branch0284C2

#_0284B0: LDX.b #$05
#_0284B2: LDA.w $0B21,X
#_0284B5: AND.b #$0F
#_0284B7: CMP.b #$04
#_0284B9: BEQ .branch0284C2

#_0284BB: CMP.b #$03
#_0284BD: BEQ .branch0284C2

#_0284BF: JMP routine028386

.branch0284C2
#_0284C2: STX.w $0B16
#_0284C5: RTS

;===================================================================================================

routine0284C6:
#_0284C6: LDX.b #$05
#_0284C8: LDA.w $0B21,X
#_0284CB: AND.b #$0F
#_0284CD: STA.w $0B2A
#_0284D0: CMP.b #$04
#_0284D2: BEQ .branch0284EA

#_0284D4: CMP.b #$03
#_0284D6: BEQ .branch0284EA

#_0284D8: LDX.b #$07
#_0284DA: LDA.w $0B21,X
#_0284DD: AND.b #$0F
#_0284DF: CMP.b #$05
#_0284E1: BEQ .branch0284EA

#_0284E3: CMP.b #$03
#_0284E5: BEQ .branch0284EA

#_0284E7: JMP routine028386

.branch0284EA
#_0284EA: STX.w $0B16
#_0284ED: RTS

;===================================================================================================

routine0284EE:
#_0284EE: JMP routine028386

vectors0284F1:
#_0284F1: dw routine02844E
#_0284F3: dw routine0284EE
#_0284F5: dw routine028476
#_0284F7: dw routine0284EE
#_0284F9: dw routine02849E
#_0284FB: dw routine0284EE
#_0284FD: dw routine0284C6
#_0284FF: dw routine0284EE

data028501:
#_028501: db $01,$04,$02,$05,$01,$04,$02,$05

;===================================================================================================

routine028509:
#_028509: SEP #$10
#_02850B: SEP #$20
#_02850D: LDX.w $0B16
#_028510: LDA.w data028532,X
#_028513: STA.w $0B16
#_028516: TAX
#_028517: LDA.w $0B21,X
#_02851A: AND.b #$0F
#_02851C: STA.w $0B2A
#_02851F: LDY.b #$00

.branch028521
#_028521: LDA.w data02853A,Y
#_028524: BMI .branch02852E

#_028526: CMP.w $0B2A
#_028529: BEQ .branch028531

#_02852B: INY
#_02852C: BRA .branch028521

.branch02852E
#_02852E: JMP routine028386

.branch028531
#_028531: RTS

data028532:
#_028532: db $01,$01,$01,$FF,$05,$05,$05,$FF

data02853A:
#_02853A: db $04,$03,$0A,$FF

;===================================================================================================

routine02853E:
#_02853E: SEP #$30
#_028540: LDX.w $0B16
#_028543: LDA.w data028565,X
#_028546: STA.w $0B16
#_028549: TAX
#_02854A: LDA.w $0B21,X
#_02854D: AND.b #$0F
#_02854F: STA.w $0B2A
#_028552: LDY.b #$00

.branch028554
#_028554: LDA.w data02856D,Y
#_028557: BMI .branch028561

#_028559: CMP.w $0B2A
#_02855C: BEQ .branch028564

#_02855E: INY
#_02855F: BRA .branch028554

.branch028561
#_028561: JMP routine028386

.branch028564
#_028564: RTS

data028565:
#_028565: db $07,$FF,$03,$03,$03,$FF,$07,$07

data02856D:
#_02856D: db $05,$03,$0A,$FF

;===================================================================================================

routine028571:
#_028571: SEP #$30
#_028573: LDA.w $0B16
#_028576: AND.b #$01
#_028578: BEQ .branch02857D

#_02857A: JMP routine028386

.branch02857D
#_02857D: LDX.w $0B16
#_028580: LDA.w $0B21,X
#_028583: AND.b #$0F
#_028585: STA.w $0B2A
#_028588: CMP.b #$03
#_02858A: BNE .branch02858D

#_02858C: RTS

.branch02858D
#_02858D: CMP.b #$06
#_02858F: BNE .branch028592

#_028591: RTS

.branch028592
#_028592: CMP.b #$0A
#_028594: BEQ .branch0285A3

#_028596: CMP.b #$08
#_028598: BNE .branch02859B

#_02859A: RTS

.branch02859B
#_02859B: CMP.b #$09
#_02859D: BNE .branch0285A0

#_02859F: RTS

.branch0285A0
#_0285A0: JMP routine028386

.branch0285A3
#_0285A3: SEP #$30
#_0285A5: LDA.w $0B29
#_0285A8: AND.b #$0F
#_0285AA: CMP.b #$0A
#_0285AC: BNE .branch0285AF

#_0285AE: RTS

.branch0285AF
#_0285AF: LDA.b #$A2
#_0285B1: JSL TestGameProgressBit
#_0285B5: BCS .branch0285C2

#_0285B7: LDA.b #$A6
#_0285B9: JSL TestGameProgressBit
#_0285BD: BCS .branch0285C2

#_0285BF: JMP routine028386

.branch0285C2
#_0285C2: JSR routine02C74B
#_0285C5: RTS

;===================================================================================================

routine0285C6:
#_0285C6: SEP #$30
#_0285C8: LDA.w $0B16
#_0285CB: AND.b #$FE
#_0285CD: STA.w $0B16
#_0285D0: TAX
#_0285D1: LDA.w $0B21,X
#_0285D4: AND.b #$0F
#_0285D6: STA.w $0B2A
#_0285D9: LDY.b #$00

.branch0285DB
#_0285DB: LDA.w data0285EC,Y
#_0285DE: BMI .branch0285E8

#_0285E0: CMP.w $0B2A
#_0285E3: BEQ .branch0285EB

#_0285E5: INY
#_0285E6: BRA .branch0285DB

.branch0285E8
#_0285E8: JMP routine028386

.branch0285EB
#_0285EB: RTS

data0285EC:
#_0285EC: db $01,$02,$03,$06,$08,$0A,$FF

;===================================================================================================

routine0285F3:
#_0285F3: SEP #$30
#_0285F5: LDA.w $0B16
#_0285F8: AND.b #$FE
#_0285FA: STA.w $0B16
#_0285FD: TAX
#_0285FE: LDA.w $0B21,X
#_028601: AND.b #$0F
#_028603: STA.w $0B2A
#_028606: LDY.b #$00

.branch028608
#_028608: LDA.w data028629,Y
#_02860B: BMI .branch028615

#_02860D: CMP.w $0B2A
#_028610: BEQ .branch028628

#_028612: INY
#_028613: BRA .branch028608

.branch028615
#_028615: LDA.w $0B16
#_028618: LSR A
#_028619: AND.b #$01
#_02861B: TAX
#_02861C: LDA.w data02862E,X
#_02861F: CMP.w $0B2A
#_028622: BNE .branch028625

#_028624: RTS

.branch028625
#_028625: JMP routine028386

.branch028628
#_028628: RTS

data028629:
#_028629: db $03,$06,$07,$0A,$FF

data02862E:
#_02862E: db $01,$02

;===================================================================================================

routine028630:
#_028630: BRA routine0285F3

;===================================================================================================

routine028632:
#_028632: JMP routine028571

;===================================================================================================

routine028635:
#_028635: RTS

;===================================================================================================

routine028636:
#_028636: SEP #$30
#_028638: LDA.w $0B29
#_02863B: AND.b #$0F
#_02863D: CMP.b #$08
#_02863F: BNE .branch028642

#_028641: RTS

.branch028642
#_028642: CMP.b #$09
#_028644: BNE .branch028647

#_028646: RTS

.branch028647
#_028647: LDA.w $0B16
#_02864A: BIT.b #$01
#_02864C: BEQ .branch02864F

#_02864E: RTS

.branch02864F
#_02864F: TAX
#_028650: LDA.w $0B21,X
#_028653: AND.b #$0F
#_028655: STA.w $0B2A
#_028658: RTS

;===================================================================================================

routine028659:
#_028659: PHP
#_02865A: SEP #$20
#_02865C: LDA.b #$17
#_02865E: STA.w $0F74
#_028661: STA.w TM
#_028664: LDA.b #$02
#_028666: STA.w $0F76
#_028669: STA.w TS
#_02866C: LDA.b #$02
#_02866E: STA.w CGWSEL
#_028671: LDA.b #$51
#_028673: STA.w CGADSUB

#_028676: REP #$30
#_028678: JSL routine0286C6
#_02867C: LDX.w $0B04
#_02867F: LDY.w $0B06
#_028682: JSR routine028865
#_028685: JSR routine0286AD
#_028688: PLP
#_028689: RTS

;===================================================================================================

routine02868A:
#_02868A: SEP #$20
#_02868C: LDA.w $0B2B
#_02868F: AND.b #$01
#_028691: BEQ .branch0286A6

#_028693: LDA.w $0B2D
#_028696: AND.b #$01
#_028698: BEQ .branch0286A6

#_02869A: LDA.b #$44
#_02869C: STA.w $0F4B
#_02869F: STA.w BG12NBA
#_0286A2: LDA.b #$00
#_0286A4: BRA .branch0286AB

.branch0286A6
#_0286A6: LDA.b #$07

.branch0286AB
#_0286A8: JSL VRAM_From_7FXXXX
#_0286AC: RTS

;===================================================================================================

routine0286AD:
#_0286AD: PHP
#_0286AE: SEP #$20
#_0286B0: STZ.w $0B2D
#_0286B3: JSR routine02868A
#_0286B6: JSL AddSelfAsVectorAndMakeSpace
#_0286BA: INC.w $0B2D
#_0286BD: JSR routine02868A
#_0286C0: JSL AddSelfAsVectorAndMakeSpace
#_0286C4: PLP
#_0286C5: RTS

;===================================================================================================

routine0286C6:
#_0286C6: PHP
#_0286C7: REP #$20
#_0286C9: LDA.w $07F5
#_0286CC: AND.w #$007F
#_0286CF: ASL A
#_0286D0: SEC
#_0286D1: SBC.w #$000E
#_0286D4: STA.w $0B04
#_0286D7: LDA.w $07F6
#_0286DA: AND.w #$00FF
#_0286DD: ASL A
#_0286DE: SEC
#_0286DF: SBC.w #$000C
#_0286E2: STA.w $0B06
#_0286E5: PLP
#_0286E6: RTL

;===================================================================================================

routine0286E7:
#_0286E7: PHP
#_0286E8: REP #$20
#_0286EA: LDA.w $0B04
#_0286ED: CLC
#_0286EE: ADC.w #$000E
#_0286F1: LSR A

#_0286F2: SEP #$20
#_0286F4: STA.w $07F5

#_0286F7: REP #$20
#_0286F9: LDA.w $0B06
#_0286FC: CLC
#_0286FD: ADC.w #$000C
#_028700: LSR A

#_028701: SEP #$20
#_028703: STA.w $07F6
#_028706: PLP
#_028707: RTS

;===================================================================================================

routine028708:
#_028708: PHP
#_028709: SEP #$30
#_02870B: PHB
#_02870C: PHK
#_02870D: PLB
#_02870E: LDX.b #$00

.branch028710
#_028710: SEP #$10
#_028712: PHX

#_028713: REP #$20
#_028715: LDA.w $0B04
#_028718: CLC
#_028719: ADC.w #$000E
#_02871C: CLC
#_02871D: ADC.w data02875B,X
#_028720: STA.w $0B08
#_028723: LDA.w $0B06
#_028726: CLC
#_028727: ADC.w #$000C
#_02872A: CLC
#_02872B: ADC.w data02876D,X
#_02872E: STA.w $0B0A
#_028731: PHX
#_028732: JSR routine02877F

#_028735: SEP #$10
#_028737: PLX

#_028738: SEP #$20
#_02873A: PHA
#_02873B: TXA
#_02873C: LSR A
#_02873D: TAX
#_02873E: LDA.w data028752,X
#_028741: TAX
#_028742: PLA
#_028743: STA.w $0B21,X
#_028746: AND.b #$0F
#_028748: PLX
#_028749: INX
#_02874A: INX
#_02874B: CPX.b #$12
#_02874D: BNE .branch028710

#_02874F: PLB
#_028750: PLP
#_028751: RTL

data028752:
#_028752: db $07,$00,$01,$06,$08,$02,$05,$04
#_02875A: db $03

data02875B:
#_02875B: dw $FFFF,$0000,$0002,$FFFF
#_028763: dw $0000,$0002,$FFFF,$0000
#_02876B: dw $0002

data02876D:
#_02876D: dw $FFFF,$FFFF,$FFFF,$0000
#_028775: dw $0000,$0000,$0002,$0002
#_02877D: dw $0002

;===================================================================================================

routine02877F:
#_02877F: REP #$20
#_028781: LDA.w $0B2B
#_028784: AND.w #$0003
#_028787: CMP.w #$0003
#_02878A: BEQ .branch02879C

#_02878C: JSR routine0289C7
#_02878F: JSR routine028A01

#_028792: REP #$10
#_028794: TAX

#_028795: SEP #$20
#_028797: LDA.l $7EF000,X
#_02879B: RTS

.branch02879C
#_02879C: JSR routine0289F9
#_02879F: JSR routine028A01

#_0287A2: REP #$10
#_0287A4: TAX

#_0287A5: SEP #$20
#_0287A7: LDA.l $7EF000,X
#_0287AB: RTS

;===================================================================================================
; UNUSED ROUTINE
;===================================================================================================
LoadThree:
#_0287AC: SEP #$20

#_0287AE: LDA.b #$03

#_0287B0: RTS

;===================================================================================================

routine0287B1:
#_0287B1: SEP #$30
#_0287B3: LDA.w $0B16
#_0287B6: BPL .branch0287B9

#_0287B8: RTS

.branch0287B9
#_0287B9: LDA.w $0B16
#_0287BC: ASL A
#_0287BD: TAX

#_0287BE: REP #$20
#_0287C0: LDA.w data028811,X
#_0287C3: BEQ .branch0287e2

#_0287C5: LDA.w $0B04
#_0287C8: STA.w $0B19
#_0287CB: LDA.w $0B06
#_0287CE: CLC
#_0287CF: ADC.w data028811,X
#_0287D2: STA.w $0B1B
#_0287D5: LDA.w $0B06
#_0287D8: CLC
#_0287D9: ADC.w data0282F0,X
#_0287DC: STA.w $0B06
#_0287DF: JSR routine02889F

.branch0287e2
#_0287E2: SEP #$30
#_0287E4: LDA.w $0B16
#_0287E7: ASL A
#_0287E8: TAX

#_0287E9: REP #$20
#_0287EB: LDA.w data028821,X
#_0287EE: BEQ .branch02880D

#_0287F0: LDA.w $0B04
#_0287F3: CLC
#_0287F4: ADC.w data028821,X
#_0287F7: STA.w $0B19
#_0287FA: LDA.w $0B06
#_0287FD: STA.w $0B1B
#_028800: LDA.w $0B04
#_028803: CLC
#_028804: ADC.w data0282E0,X
#_028807: STA.w $0B04
#_02880A: JSR routine02891F

.branch02880D:
#_02880D: JSR routine02868A
#_028810: RTS

;===================================================================================================

data028811:
#_028811: dw $FFFF,$FFFF,$0000,$0020
#_028819: dw $0020,$0020,$0000,$FFFF

data028821:
#_028821: dw $0000,$0020,$0020,$0020
#_028829: dw $0000,$FFFF,$FFFF,$FFFF

;===================================================================================================

EnableNMI:
#_028831: PHA

#_028832: PHP
#_028833: SEP #$20

#_028835: LDA.b #$81
#_028837: STA.w NMITIMEN

#_02883A: PLP

#_02883B: PLA

#_02883C: RTS

;===================================================================================================

DisableNMI:
#_02883D: PHA

#_02883E: PHP

#_02883F: SEP #$20

#_028841: LDA.b #$01
#_028843: STA.w NMITIMEN

#_028846: PLP

#_028847: PLA

#_028848: RTS

;===================================================================================================

RunFramesYTimes:
#_028849: PHP

#_02884A: REP #$30

#_02884C: PHA
#_02884D: PHX
#_02884E: PHY
#_02884F: PHD
#_028850: PHB

#_028851: SEP #$10

.branch028853
#_028853: PHY

#_028854: JSL AddSelfAsVector

#_028858: PLY
#_028859: DEY
#_02885A: BNE .branch028853

#_02885C: REP #$30

#_02885E: PLB
#_02885F: PLD
#_028860: PLY
#_028861: PLX
#_028862: PLA

#_028863: PLP
#_028864: RTL

;===================================================================================================
; Inputs:
;    X - OW X coordinate
;    Y - OW Y coordinate
;===================================================================================================
routine028865:
#_028865: SEP #$20
#_028867: LDA.b #$01
#_028869: STA.w $0ED4

; (X * 8) - 8
#_02886C: REP #$30
#_02886E: TXA
#_02886F: ASL A
#_028870: ASL A
#_028871: ASL A
#_028872: CLC
#_028873: ADC.w #$FFF8
#_028876: STA.w $0F51
#_028879: STA.w $0F4D

; (Y * 8) - 8
#_02887C: TYA
#_02887D: ASL A
#_02887E: ASL A
#_02887F: ASL A
#_028880: CLC
#_028881: ADC.w #$FFF8
#_028884: STA.w $0F53
#_028887: STA.w $0F4F

#_02888A: STX.w $0B19
#_02888D: STY.w $0B1B
#_028890: LDY.w #$0020

.branch028893
#_028893: PHY
#_028894: JSR routine02889F
#_028897: INC.w $0B1B
#_02889A: PLY
#_02889B: DEY
#_02889C: BNE .branch028893

#_02889E: RTS

;===================================================================================================

routine02889F:
#_02889F: REP #$30
#_0288A1: LDA.w $0B19
#_0288A4: STA.w $0B08

#_0288A7: LDA.w $0B1B
#_0288AA: STA.w $0B0A
#_0288AD: LDY.w #$0020

.branch0288B0
#_0288B0: PHY
#_0288B1: JSR routine02899F
#_0288B4: PHA
#_0288B5: LDA.w $0B0A
#_0288B8: AND.w #$001F
#_0288BB: ASL A
#_0288BC: ASL A
#_0288BD: ASL A
#_0288BE: ASL A
#_0288BF: ASL A
#_0288C0: STA.w $0B1F
#_0288C3: LDA.w $0B08
#_0288C6: AND.w #$001F
#_0288C9: CLC
#_0288CA: ADC.w $0B1F
#_0288CD: ASL A
#_0288CE: TAX
#_0288CF: PLA
#_0288D0: STA.l $7F2800,X
#_0288D4: PLY
#_0288D5: INC.w $0B08
#_0288D8: DEY
#_0288D9: BNE .branch0288B0

#_0288DB: LDA.w $0B2B
#_0288DE: AND.w #$0001
#_0288E1: BNE .branch0288E4

#_0288E3: RTS

;---------------------------------------------------------------------------------------------------

.branch0288E4
#_0288E4: LDA.w $0B19
#_0288E7: STA.w $0B08
#_0288EA: LDA.w $0B1B
#_0288ED: STA.w $0B0A
#_0288F0: LDY.w #$0020

.branch0288F3
#_0288F3: PHY
#_0288F4: JSR routine0289C0
#_0288F7: PHA
#_0288F8: LDA.w $0B0A
#_0288FB: AND.w #$001F
#_0288FE: ASL A
#_0288FF: ASL A
#_028900: ASL A
#_028901: ASL A
#_028902: ASL A
#_028903: STA.w $0B1F
#_028906: LDA.w $0B08
#_028909: AND.w #$001F
#_02890C: CLC
#_02890D: ADC.w $0B1F
#_028910: ASL A
#_028911: TAX
#_028912: PLA
#_028913: STA.l $7F7000,X
#_028917: PLY
#_028918: INC.w $0B08
#_02891B: DEY
#_02891C: BNE .branch0288F3

#_02891E: RTS

;===================================================================================================

routine02891F:
#_02891F: REP #$30
#_028921: LDA.w $0B19
#_028924: STA.w $0B08
#_028927: LDA.w $0B1B
#_02892A: STA.w $0B0A
#_02892D: LDY.w #$0020

.branch028930
#_028930: PHY
#_028931: JSR routine02899F
#_028934: PHA
#_028935: LDA.w $0B0A
#_028938: AND.w #$001F
#_02893B: ASL A
#_02893C: ASL A
#_02893D: ASL A
#_02893E: ASL A
#_02893F: ASL A
#_028940: STA.w $0B1F
#_028943: LDA.w $0B08
#_028946: AND.w #$001F
#_028949: CLC
#_02894A: ADC.w $0B1F
#_02894D: ASL A
#_02894E: TAX
#_02894F: PLA
#_028950: STA.l $7F2800,X
#_028954: PLY
#_028955: INC.w $0B0A
#_028958: DEY
#_028959: BNE .branch028930

#_02895B: LDA.w $0B2B
#_02895E: AND.w #$0001
#_028961: BNE .branch028964

#_028963: RTS

;---------------------------------------------------------------------------------------------------

.branch028964
#_028964: LDA.w $0B19
#_028967: STA.w $0B08
#_02896A: LDA.w $0B1B
#_02896D: STA.w $0B0A
#_028970: LDY.w #$0020

.branch028973
#_028973: PHY
#_028974: JSR routine0289C0
#_028977: PHA
#_028978: LDA.w $0B0A
#_02897B: AND.w #$001F
#_02897E: ASL A
#_02897F: ASL A
#_028980: ASL A
#_028981: ASL A
#_028982: ASL A
#_028983: STA.w $0B1F
#_028986: LDA.w $0B08
#_028989: AND.w #$001F
#_02898C: CLC
#_02898D: ADC.w $0B1F
#_028990: ASL A
#_028991: TAX
#_028992: PLA
#_028993: STA.l $7F7000,X
#_028997: PLY
#_028998: INC.w $0B0A
#_02899B: DEY
#_02899C: BNE .branch028973

#_02899E: RTS

;===================================================================================================
; TODO something with tile map drawing
;===================================================================================================
routine02899F:
#_02899F: REP #$30
#_0289A1: JSR routine0289C7

.branch0289A4
#_0289A4: JSR routine028A01
#_0289A7: ASL A
#_0289A8: ASL A
#_0289A9: ASL A
#_0289AA: STA.w $0E00
#_0289AD: LDA.w $0B10
#_0289B0: ASL A
#_0289B1: CLC
#_0289B2: ADC.w $0B12
#_0289B5: ASL A
#_0289B6: CLC
#_0289B7: ADC.w $0E00
#_0289BA: TAX
#_0289BB: LDA.l $7E8000,X
#_0289BF: RTS

;===================================================================================================

routine0289C0:
#_0289C0: REP #$30
#_0289C2: JSR routine0289F9
#_0289C5: BRA .branch0289A4

;===================================================================================================
; Turns overworld camera into stuff
; Index = 2 * ( (Y & 0x03) * 16 + (X / 4) )
; $0B0E = $0B08 & 0x03
; $0B0C = $0B0A & 0x03
;===================================================================================================
routine0289C7:
#_0289C7: REP #$30

#_0289C9: LDA.w $0B08
#_0289CC: LSR A
#_0289CD: LSR A
#_0289CE: STA.w $0B0E

#_0289D1: LDA.w $0B0A
#_0289D4: LSR A ; these cancel out but effectively do AND #$03
#_0289D5: LSR A
#_0289D6: ASL A
#_0289D7: ASL A

#_0289D8: ASL A ; x16
#_0289D9: ASL A
#_0289DA: ASL A
#_0289DB: ASL A

#_0289DC: CLC
#_0289DD: ADC.w $0B0E
#_0289E0: ASL A
#_0289E1: TAX

#_0289E2: LDA.w $0B08
#_0289E5: AND.w #$0003
#_0289E8: STA.w $0B0E

#_0289EB: LDA.w $0B0A
#_0289EE: AND.w #$0003
#_0289F1: STA.w $0B0C

#_0289F4: LDA.l $7EB000,X

#_0289F8: RTS

;===================================================================================================
; Same as above, but different array
;===================================================================================================
routine0289F9:
#_0289F9: JSR routine0289C7
#_0289FC: LDA.l $7ED000,X
#_028A00: RTS

;===================================================================================================
; Turns overworld camera into stuff
; Index = 2 * ( (Y & 0x03) * 16 + (X / 4) )
; $0B0E = $0B08 & 0x03
; $0B0C = $0B0A & 0x03
;===================================================================================================
routine028A01:
#_028A01: REP #$30
#_028A03: ASL A
#_028A04: ASL A
#_028A05: ASL A
#_028A06: STA.w $0B10
#_028A09: LDA.w $0B0E
#_028A0C: LSR A
#_028A0D: STA.w $0B12
#_028A10: LDA.w $0B0C
#_028A13: LSR A
#_028A14: ASL A
#_028A15: CLC
#_028A16: ADC.w $0B12
#_028A19: ASL A
#_028A1A: CLC
#_028A1B: ADC.w $0B10
#_028A1E: TAX
#_028A1F: LDA.w $0B0E
#_028A22: AND.w #$0001
#_028A25: STA.w $0B12
#_028A28: LDA.w $0B0C
#_028A2B: AND.w #$0001
#_028A2E: STA.w $0B10
#_028A31: LDA.l $7E9000,X
#_028A35: RTS

;===================================================================================================

routine028A36:
#_028A36: PHP
#_028A37: PHB
#_028A38: PHK
#_028A39: PLB

#_028A3A: JSR routine028E37

#_028A3D: REP #$30

#_028A3F: LDA.w $0B2B
#_028A42: AND.w #$00FF
#_028A45: ASL A
#_028A46: TAX

#_028A47: SEP #$20

#_028A49: LDA.b #$05
#_028A4B: STA.w $00E2

#_028A4E: LDA.b #$7E
#_028A50: STA.w $00E5

#_028A53: REP #$20

#_028A55: LDA.w data028B41,X
#_028A58: STA.w $00E0

#_028A5B: LDA.w #$7E8000
#_028A5E: STA.w $00E3

#_028A61: LDY.w #$0000

.branch028A64
#_028A64: LDA.b [$E0],Y
#_028A66: STA.b [$E3],Y
#_028A68: INY
#_028A69: INY
#_028A6A: CPY.w #$1000
#_028A6D: BNE .branch028A64

#_028A6F: PHX
#_028A70: LDA.w data028B49,X
#_028A73: STA.w $00E0
#_028A76: LDA.w #$7E9000
#_028A79: STA.w $00E3
#_028A7C: LDA.w #$0009
#_028A7F: STA.w $0E00
#_028A82: JSR routine028CD4
#_028A85: PLX
#_028A86: PHX
#_028A87: LDA.w data028B51,X
#_028A8A: STA.w $00E0
#_028A8D: LDA.w data028B61,X
#_028A90: STA.w $00E3
#_028A93: LDA.w #$000A
#_028A96: STA.w $0E00
#_028A99: JSR routine028D5E
#_028A9C: PLX
#_028A9D: LDA.w data028B59,X
#_028AA0: STA.w $00E0
#_028AA3: LDA.w #$7EF000
#_028AA6: STA.w $00E3
#_028AA9: LDY.w #$0000

.branch028AAC
#_028AAC: LDA.b [$E0],Y
#_028AAE: STA.b [$E3],Y
#_028AB0: INY
#_028AB1: INY
#_028AB2: CPY.w #$0200
#_028AB5: BNE .branch028AAC

#_028AB7: LDA.w $0B2B
#_028ABA: AND.w #$0003
#_028ABD: CMP.w #$0001
#_028AC0: BEQ .branch028AC5

#_028AC2: JMP .branch028B3A

;---------------------------------------------------------------------------------------------------

.branch028AC5
#_028AC5: LDA.w #$0057
#_028AC8: JSL TestGameProgressBit
#_028ACC: BCC .branch028AD1

#_028ACE: JMP .branch028B3A

.branch028AD1
#_028AD1: SEP #$20

#_028AD3: LDA.b #$7E
#_028AD5: STA.w $00E2
#_028AD8: STA.w $00E5

#_028ADB: REP #$20

#_028ADD: LDA.w #data05B000
#_028AE0: STA.w $00E0

#_028AE3: LDA.w #$7DD000
#_028AE6: STA.w $00E3

#_028AE9: LDY.w #$0000

.branch028AEC
#_028AEC: LDA.b [$E0],Y
#_028AEE: STA.b [$E3],Y
#_028AF0: INY
#_028AF1: INY
#_028AF2: CPY.w #$2000
#_028AF5: BNE .branch028AEC

#_028AF7: SEP #$20

#_028AF9: LDA.b #$7E
#_028AFB: STA.w $00E2
#_028AFE: STA.w $00E5

#_028B01: REP #$20

#_028B03: LDA.w #data05B070
#_028B06: STA.w $00E0

#_028B09: LDA.w #$7EE32C
#_028B0C: STA.w $00E3

#_028B0F: LDX.w #$0000

.branch028B12
#_028B12: LDY.w #$0000

.branch028B15
#_028B15: LDA.b [$E0],Y
#_028B17: STA.b [$E3],Y
#_028B19: INY
#_028B1A: INY
#_028B1B: CPY.w #$000A
#_028B1E: BNE .branch028B15

#_028B20: LDA.w $00E0
#_028B23: CLC
#_028B24: ADC.w #$0080
#_028B27: STA.w $00E0
#_028B2A: LDA.w $00E3
#_028B2D: CLC
#_028B2E: ADC.w #$0080
#_028B31: STA.w $00E3
#_028B34: INX
#_028B35: CPX.w #$0005
#_028B38: BNE .branch028B12

.branch028B3A
#_028B3A: JSL routine028B71
#_028B3E: PLB
#_028B3F: PLP
#_028B40: RTL

;---------------------------------------------------------------------------------------------------

; TODO these are pointers in bank05 and some in 7E?
data028B41:
#_028B41: dw data058000
#_028B43: dw data059642
#_028B45: dw data059642
#_028B47: dw data059642

data028B49:
#_028B49: dw data0587E0
#_028B4B: dw data05A830
#_028B4D: dw data05A830
#_028B4F: dw data05A830

data028B51:
#_028B51: dw data058E88
#_028B53: dw data05B668
#_028B55: dw data05B668
#_028B57: dw data05B668

data028B59:
#_028B59: dw data058700
#_028B5B: dw data05A632
#_028B5D: dw data05A632
#_028B5F: dw data05A632

data028B61:
#_028B61: dw $D000,$B000,$B000,$B000
#_028B69: dw $D000,$D000,$D000,$D000

;===================================================================================================

routine028B71:
#_028B71: PHP

#_028B72: PHB
#_028B73: PHK
#_028B74: PLB

#_028B75: REP #$30
#_028B77: JSR routine028E37

#_028B7A: LDA.w $0B2B
#_028B7D: AND.w #$00FF
#_028B80: ASL A
#_028B81: TAY

#_028B82: LDA.w data028C68,Y
#_028B85: STA.w $00E0

#_028B88: LDY.w #$0000

.branch028B8B
#_028B8B: PHY
#_028B8C: LDA.b ($E0),Y
#_028B8E: CMP.w #$FFFF
#_028B91: BEQ .branch028BC3

#_028B93: JSL TestGameProgressBit
#_028B97: PLY
#_028B98: BCC .branch028BBB

#_028B9A: INY
#_028B9B: INY
#_028B9C: LDA.b ($E0),Y
#_028B9E: STA.w $0E00
#_028BA1: INY
#_028BA2: INY
#_028BA3: LDA.b ($E0),Y
#_028BA5: STA.w $0E02
#_028BA8: INY
#_028BA9: INY
#_028BAA: LDA.b ($E0),Y
#_028BAC: STA.w $0E04
#_028BAF: PHY
#_028BB0: JSR routine028BC7
#_028BB3: JSR routine028C10
#_028BB6: PLY
#_028BB7: INY
#_028BB8: INY
#_028BB9: BRA .branch028B8B

.branch028BBB
#_028BBB: TYA
#_028BBC: CLC
#_028BBD: ADC.w #$0008
#_028BC0: TAY
#_028BC1: BRA .branch028B8B

.branch028BC3
#_028BC3: PLY
#_028BC4: PLB
#_028BC5: PLP
#_028BC6: RTL

;===================================================================================================

routine028BC7:
#_028BC7: SEP #$20
#_028BC9: LDA.b #$05
#_028BCB: STA.w $00E4
#_028BCE: LDA.b #$7E
#_028BD0: STA.w $00E7

#_028BD3: REP #$20
#_028BD5: LDA.w $0B2B
#_028BD8: AND.w #$00FF
#_028BDB: ASL A
#_028BDC: TAX
#_028BDD: LDA.w $0E04
#_028BE0: ASL A
#_028BE1: ASL A
#_028BE2: ASL A
#_028BE3: CLC
#_028BE4: ADC.w data028C58,X
#_028BE7: STA.w $00E2
#_028BEA: LDA.w $0E00
#_028BED: ASL A
#_028BEE: ASL A
#_028BEF: TAX
#_028BF0: ASL A
#_028BF1: CLC
#_028BF2: ADC.w #$8000
#_028BF5: STA.w $00E5
#_028BF8: LDA.w $0E02
#_028BFB: ASL A
#_028BFC: ASL A
#_028BFD: STA.w $0E06
#_028C00: LDY.w #$0000

.branch028C03
#_028C03: LDA.b [$E2],Y
#_028C05: STA.b [$E5],Y
#_028C07: INY
#_028C08: INY
#_028C09: INX
#_028C0A: CPX.w $0E06
#_028C0D: BNE .branch028C03

#_028C0F: RTS

;===================================================================================================

routine028C10:
#_028C10: PHP
#_028C11: SEP #$20
#_028C13: LDA.b #$05
#_028C15: STA.w $00E4
#_028C18: LDA.b #$7E
#_028C1A: STA.w $00E7

#_028C1D: REP #$20
#_028C1F: LDA.w $0B2B
#_028C22: AND.w #$00FF
#_028C25: ASL A
#_028C26: TAX
#_028C27: LDA.w data028C60,X
#_028C2A: CLC
#_028C2B: ADC.w $0E04
#_028C2E: STA.w $00E2
#_028C31: LDA.w $0E00
#_028C34: CLC
#_028C35: ADC.w #$F000
#_028C38: STA.w $00E5
#_028C3B: LDY.w #$0000
#_028C3E: LDX.w $0E00

.branch028C41
#_028C41: SEP #$20
#_028C43: LDA.b [$E2],Y
#_028C45: STA.b [$E5],Y
#_028C47: INY
#_028C48: INX
#_028C49: CPX.w $0E02
#_028C4C: BNE .branch028C41

#_028C4E: PLP
#_028C4F: RTS

#_028C50: dw $00DA,$0147,$0147,$0147

; TODO pointers
data028C58:
#_028C58: dw $960C,$DE6C,$DE6C,$DE6C

data028C60:
#_028C60: dw $963C,$E35C,$E35C,$E35C

data028C68:
#_028C68: dw $8C70,$8C8A,$8C8A,$8C8A
#_028C70: dw $0020,$00DB,$00DE,$0001
#_028C78: dw $0006,$00DA,$00DB,$0000
#_028C80: dw $0006,$00DE,$00E0,$0004
#_028C88: dw $FFFF,$008E,$0147,$0179
#_028C90: dw $0000,$0057,$0179,$018A
#_028C98: dw $0032,$008F,$018A,$01A9
#_028CA0: dw $0043,$0090,$01A9,$01D9
#_028CA8: dw $0062,$0065,$01D9,$01DB
#_028CB0: dw $0092,$0066,$01DB,$01E2
#_028CB8: dw $0094,$00EC,$01E3,$01E4
#_028CC0: dw $009C,$00A8,$01E4,$01E5
#_028CC8: dw $009D,$0080,$01E2,$01E3
#_028CD0: dw $009B,$FFFF

;===================================================================================================

routine028CD4:
#_028CD4: REP #$30

#_028CD6: LDY.w #$0000
#_028CD9: LDA.b [$E0],Y
#_028CDB: LSR A
#_028CDC: LSR A
#_028CDD: LSR A
#_028CDE: LSR A
#_028CDF: STA.b $E8

#_028CE1: INC.w $00E0
#_028CE4: INC.w $00E0

#_028CE7: STZ.b $EA

.next
#_028CE9: LDY.b $EA

#_028CEB: LDA.b [$E0],Y
#_028CED: XBA
#_028CEE: LSR A
#_028CEF: LSR A
#_028CF0: LSR A
#_028CF1: LSR A
#_028CF2: LSR A
#_028CF3: LSR A
#_028CF4: LSR A
#_028CF5: PHA

#_028CF6: INY
#_028CF7: LDA.b [$E0],Y
#_028CF9: XBA
#_028CFA: LSR A
#_028CFB: LSR A
#_028CFC: LSR A
#_028CFD: LSR A
#_028CFE: LSR A
#_028CFF: LSR A
#_028D00: AND.w #$01FF
#_028D03: PHA

#_028D04: INY
#_028D05: LDA.b [$E0],Y
#_028D07: XBA
#_028D08: LSR A
#_028D09: LSR A
#_028D0A: LSR A
#_028D0B: LSR A
#_028D0C: LSR A
#_028D0D: AND.w #$01FF
#_028D10: PHA

#_028D11: INY
#_028D12: LDA.b [$E0],Y
#_028D14: XBA
#_028D15: LSR A
#_028D16: LSR A
#_028D17: LSR A
#_028D18: LSR A
#_028D19: AND.w #$01FF
#_028D1C: PHA

#_028D1D: INY
#_028D1E: LDA.b [$E0],Y
#_028D20: XBA
#_028D21: LSR A
#_028D22: LSR A
#_028D23: LSR A
#_028D24: AND.w #$01FF
#_028D27: PHA

#_028D28: INY
#_028D29: LDA.b [$E0],Y
#_028D2B: XBA
#_028D2C: LSR A
#_028D2D: LSR A
#_028D2E: AND.w #$01FF
#_028D31: PHA

#_028D32: INY
#_028D33: LDA.b [$E0],Y
#_028D35: XBA
#_028D36: LSR A
#_028D37: AND.w #$01FF
#_028D3A: PHA

#_028D3B: INY
#_028D3C: LDA.b [$E0],Y
#_028D3E: XBA
#_028D3F: AND.w #$01FF
#_028D42: PHA

#_028D43: INY
#_028D44: INY
#_028D45: STY.b $EA

#_028D47: LDY.w #$000E

.copy_back
#_028D4A: PLA
#_028D4B: STA.b [$E3],Y

#_028D4D: DEY
#_028D4E: DEY
#_028D4F: BPL .copy_back

#_028D51: LDA.b $E3
#_028D53: CLC
#_028D54: ADC.w #$0010
#_028D57: STA.b $E3
#_028D59: DEC.b $E8
#_028D5B: BPL .next

#_028D5D: RTS

;===================================================================================================
; TODO seems to transfer stuff to overworld tile map
;===================================================================================================
routine028D5E:
#_028D5E: REP #$30

#_028D60: LDY.w #$0000

#_028D63: LDA.b [$E0],Y
#_028D65: LSR A
#_028D66: LSR A
#_028D67: LSR A
#_028D68: STA.b $E8

#_028D6A: INC.w $00E0
#_028D6D: INC.w $00E0

#_028D70: STZ.b $EA

.next
#_028D72: LDY.b $EA
#_028D74: LDA.b [$E0],Y
#_028D76: XBA
#_028D77: LSR A
#_028D78: LSR A
#_028D79: LSR A
#_028D7A: LSR A
#_028D7B: LSR A
#_028D7C: LSR A
#_028D7D: PHA

#_028D7E: INY
#_028D7F: LDA.b [$E0],Y
#_028D81: XBA
#_028D82: LSR A
#_028D83: LSR A
#_028D84: LSR A
#_028D85: LSR A
#_028D86: AND.w #$03FF
#_028D89: PHA

#_028D8A: INY
#_028D8B: LDA.b [$E0],Y
#_028D8D: XBA
#_028D8E: LSR A
#_028D8F: LSR A
#_028D90: AND.w #$03FF
#_028D93: PHA

#_028D94: INY
#_028D95: LDA.b [$E0],Y
#_028D97: XBA
#_028D98: AND.w #$03FF
#_028D9B: PHA

#_028D9C: INY
#_028D9D: INY
#_028D9E: STY.b $EA

#_028DA0: LDY.w #$0006

.copy_back
#_028DA3: PLA
#_028DA4: STA.b [$E3],Y

#_028DA6: DEY
#_028DA7: DEY
#_028DA8: BPL .copy_back

#_028DAA: LDA.b $E3
#_028DAC: CLC
#_028DAD: ADC.w #$0008
#_028DB0: STA.b $E3

#_028DB2: DEC.b $E8
#_028DB4: BNE .next

#_028DB6: RTS

;===================================================================================================

routine028DB7:
#_028DB7: PHP
#_028DB8: SEP #$30

#_028DBA: PHB
#_028DBB: PHK
#_028DBC: PLB

#_028DBD: JSR routine028E37

#_028DC0: LDA.w $0B2B
#_028DC3: ASL A
#_028DC4: TAX

#_028DC5: LDA.b #$FF
#_028DC7: STA.w $0A71

#_028DCA: PHX
#_028DCB: PHX

#_028DCC: LDA.w data028E2F,X
#_028DCF: JSL routine02F609

#_028DD3: PLX
#_028DD4: LDA.w data028E30,X
#_028DD7: JSL routine02FC09

#_028DDB: PLX
#_028DDC: LDA.w data028E30,X
#_028DDF: JSL routine02FC6E
#_028DE3: JSL routine0F9AE1

#_028DE7: SEP #$30

#_028DE9: LDA.w $0B2B
#_028DEC: CMP.b #$03
#_028DEE: BNE .exit

#_028DF0: LDA.b #$26
#_028DF2: JSL routine02FC6E

#_028DF6: SEP #$20

#_028DF8: LDA.b #$08
#_028DFA: STA.w $0A79
#_028DFD: STA.w $0A7A
#_028E00: STA.w $0A7B
#_028E03: STA.w $0A7C

#_028E06: LDA.b #$0D
#_028E08: STA.w $0A75

#_028E0B: LDA.b #$13
#_028E0D: STA.w $0A76

#_028E10: LDA.b #$14
#_028E12: STA.w $0A77

#_028E15: LDA.b #$15
#_028E17: STA.w $0A78

#_028E1A: LDA.b #$01
#_028E1C: STA.w $0A72

#_028E1F: LDA.b #$04
#_028E21: STA.w $0A74
#_028E24: STZ.w $0A73

#_028E27: LDA.b #$07
#_028E29: STA.w $0A71

.exit
#_028E2C: PLB

#_028E2D: PLP
#_028E2E: RTL

; TODO make into 2 byte entry table?
data028E2F:
#_028E2F: db $01

data028E30:
#_028E30: db $01,$2A,$25,$2A,$25,$2A,$25

;===================================================================================================

routine028E37:
#_028E37: PHP
#_028E38: SEP #$30

#_028E3A: LDA.b #$2F
#_028E3C: JSL TestGameProgressBit
#_028E40: BCC .city_streets

#_028E42: LDA.b #$57
#_028E44: JSL TestGameProgressBit
#_028E48: BCC .branch028E60

#_028E4A: LDA.b #$9E
#_028E4C: JSL TestGameProgressBit
#_028E50: BCC .branch028E59

#_028E52: LDA.b #$03
#_028E54: STA.w $0B2B

#_028E57: PLP
#_028E58: RTS

.branch028E59
#_028E59: LDA.b #$02
#_028E5B: STA.w $0B2B

#_028E5E: PLP
#_028E5F: RTS

.branch028E60
#_028E60: LDA.b #$01
#_028E62: STA.w $0B2B

#_028E65: PLP
#_028E66: RTS

.city_streets
#_028E67: STZ.w $0B2B

#_028E6A: PLP
#_028E6B: RTS

;===================================================================================================

routine028E6C:
#_028E6C: REP #$20

; all of these except $0A9D are just immediately overwritten...
#_028E6E: LDA.w #$FFFF
#_028E71: STA.w $0A99
#_028E74: STA.w $0A9B
#_028E77: STA.w $0A9D
#_028E7A: STA.w $0A9F

#_028E7D: STZ.w $0A95
#_028E80: STZ.w $0A97
#_028E83: STZ.w $0A99
#_028E86: STZ.w $0A9B

#_028E89: LDA.w #$3C60
#_028E8C: STA.w $0A9F

#_028E8F: SEP #$30

#_028E91: LDA.w $040F
#_028E94: STA.w $07EE
#_028E97: STZ.w $07EF

#_028E9A: STZ.w $07F0
#_028E9D: STZ.w $07F1

#_028EA0: LDA.b #$FF
#_028EA2: STA.w $0A71

#_028EA5: LDX.b #$07
#_028EA7: LDA.b #$00

.clear_next
#_028EA9: STA.w $0A7D,X

#_028EAC: DEX
#_028EAD: BPL .clear_next

.branch028EAF
#_028EAF: JSL AddSelfAsVector

#_028EB3: JSL routine028ECA
#_028EB7: JSL routine028EFD

#_028EBB: JSL routine028F58
#_028EBF: JSL routine0295FA

#_028EC3: JSL routine0FA1A2
#_028EC7: JMP .branch028EAF

;===================================================================================================

routine028ECA:
#_028ECA: SEP #$30

#_028ECC: LDA.w $0A71
#_028ECF: CMP.b #$FF
#_028ED1: BNE .continue_a

#_028ED3: RTL

.continue_a
#_028ED4: DEC.w $0A72
#_028ED7: BEQ .continue_b

#_028ED9: RTL

.continue_b
#_028EDA: INC.w $0A73

#_028EDD: LDA.w $0A73
#_028EE0: CMP.w $0A74
#_028EE3: BNE .continue_c

#_028EE5: STZ.w $0A73

.continue_c
#_028EE8: LDX.w $0A73

#_028EEB: LDA.w $0A79,X
#_028EEE: STA.w $0A72

#_028EF1: LDA.w $0A75,X
#_028EF4: TAX

#_028EF5: LDA.w $0A71
#_028EF8: JSL Transfer16Colors_F9AFA

#_028EFC: RTL

;===================================================================================================

routine028EFD:
#_028EFD: REP #$30

#_028EFF: LDX.w #$0000
#_028F02: LDY.w #$0000

.next
#_028F05: SEP #$20

#_028F07: LDA.w $0A7D,Y
#_028F0A: BEQ .skip

#_028F0C: CMP.b #$FF
#_028F0E: BNE .branch028F3F

#_028F10: REP #$20

#_028F12: LDA.w $0A85,X
#_028F15: PHX
#_028F16: PHA
#_028F17: TXA
#_028F18: ASL A
#_028F19: CLC
#_028F1A: ADC.w #$0020
#_028F1D: TAX
#_028F1E: PLA
#_028F1F: STA.w $0000,X

#_028F22: SEP #$20
#_028F24: LDA.b #$FE
#_028F26: STA.w $0A7D,Y
#_028F29: PLX

.continue_loop
#_028F2A: PHX

#_028F2B: TXA
#_028F2C: CLC
#_028F2D: ADC.b #$10
#_028F2F: TAX

#_028F30: LDA.b #$80
#_028F32: STA.w $1A00,X

#_028F35: PLX

.skip
#_028F36: INX
#_028F37: INX

#_028F38: INY
#_028F39: CPY.w #$0008
#_028F3C: BNE .next

#_028F3E: RTL

;---------------------------------------------------------------------------------------------------

.branch028F3F
#_028F3F: REP #$20
#_028F41: PHX
#_028F42: TXA
#_028F43: ASL A
#_028F44: CLC
#_028F45: ADC.w #$0020
#_028F48: TAX
#_028F49: LDA.w #$0000
#_028F4C: STA.w $0000,X

#_028F4F: SEP #$20
#_028F51: TYX
#_028F52: INC.w $0A7D,X
#_028F55: PLX
#_028F56: BRA .continue_loop

;===================================================================================================

routine028F58:
#_028F58: REP #$30

#_028F5A: INC.w $0A9D

#_028F5D: LDA.w $0A9D
#_028F60: AND.w #$0001
#_028F63: BNE .continue_a

#_028F65: RTL

.continue_a
#_028F66: LDY.w #$0000
#_028F69: TYX

;---------------------------------------------------------------------------------------------------

.next
#_028F6A: LDA.w $0A99,Y
#_028F6D: BMI .skip

#_028F6F: CMP.w #$7FFF
#_028F72: BEQ .continue_b

#_028F74: DEC A
#_028F75: STA.w $0A99,Y

.continue_b
#_028F78: LDA.w $0A95,Y
#_028F7B: XBA
#_028F7C: AND.w #$00FF
#_028F7F: BIT.w #$0080
#_028F82: BEQ .positive_a

#_028F84: ORA.w #$FF00

.positive_a
#_028F87: CLC
#_028F88: ADC.w $0F4F,X
#_028F8B: STA.w $0F4F,X

#_028F8E: LDA.w $0A95,Y
#_028F91: AND.w #$00FF
#_028F94: BIT.w #$0080
#_028F97: BEQ .positive_b

#_028F99: ORA.w #$FF00

.positive_b
#_028F9C: CLC
#_028F9D: ADC.w $0F4D,X
#_028FA0: STA.w $0F4D,X

.skip
#_028FA3: INY
#_028FA4: INY

#_028FA5: INX
#_028FA6: INX
#_028FA7: INX
#_028FA8: INX
#_028FA9: CPY.w #$0004
#_028FAC: BNE .next

#_028FAE: RTL

;===================================================================================================

routine028FAF:
#_028FAF: PHP
#_028FB0: SEP #$30

#_028FB2: LDA.w $0B14
#_028FB5: BNE .exit

#_028FB7: LDA.w $0B36
#_028FBA: BEQ .exit

#_028FBC: LDA.b #$FF
#_028FBE: JSL TestGameProgressBit
#_028FC2: BCS .exit

#_028FC4: JSL TriggerEncounter_Overworld
#_028FC8: BCC .exit

#_028FCA: JSL routine028FEA
#_028FCE: JSL BestRoutineEver

#_028FD2: JSL routine029039
#_028FD6: JSL routine01B263
#_028FDA: JSL routine028156

#_028FDE: STZ.w $045B
#_028FE1: STZ.w $0B32

#_028FE4: JSL routine0290E3

.exit
#_028FE8: PLP
#_028FE9: RTS

;===================================================================================================

routine028FEA:
#_028FEA: PHP
#_028FEB: JSR OverworldMovement_GetIndexFromCoords

#_028FEE: REP #$30

#_028FF0: LDA.w $0B2E
#_028FF3: ASL A
#_028FF4: TAX

#_028FF5: LDA.w $0B2B
#_028FF8: AND.w #$00FF
#_028FFB: BEQ routine029022

#_028FFD: CMP.w #$0003
#_029000: BNE routine029012

#_029002: SEP #$20

#_029004: LDA.w data0293FA,X
#_029007: STA.w $0457

#_02900A: LDA.w data0293FB,X
#_02900D: STA.w $0455

#_029010: PLP
#_029011: RTL

;===================================================================================================

routine029012:
#_029012: SEP #$20

#_029014: LDA.w data02923A,X
#_029017: STA.w $0457

#_02901A: LDA.w data02923B,X
#_02901D: STA.w $0455

#_029020: PLP
#_029021: RTL

;===================================================================================================

routine029022:
#_029022: SEP #$20

#_029024: LDA.w data02917A,X
#_029027: STA.w $0457

#_02902A: LDA.w data02917B,X
#_02902D: STA.w $0455

#_029030: PLP
#_029031: RTL

;===================================================================================================

BestRoutineEver:
#_029032: PHP

#_029033: PHB
#_029034: PHK
#_029035: PLB

#_029036: PLB

#_029037: PLP
#_029038: RTL

;===================================================================================================

routine029039:
#_029039: PHP

#_02903A: PHB
#_02903B: PHK
#_02903C: PLB

#_02903D: SEP #$30

#_02903F: JSL DarkenScreen
#_029043: LDA.b #$FF
#_029045: STA.w $0A71

#_029048: LDA.b #$A1
#_02904A: STA.w $0F00
#_02904D: STA.w NMITIMEN

#_029050: LDA.b #$80
#_029052: STA.w $0F43
#_029055: STA.w INIDISP

#_029058: STZ.w $0F7F
#_02905B: STZ.w $0F80

#_02905E: LDA.b #$20
#_029060: STA.w $0A2C

#_029063: JSL Reset_OAMrelatedWRAM
#_029067: JSR EnableFBlank_02
#_02906A: JSR DisableNMI
#_02906D: JSL ZeroVRAM_02
#_029071: JSL ZeroCGRAM_02

#_029075: LDA.b #$00
#_029077: JSR routine02C10F

#_02907A: LDA.b #$00
#_02907C: JSL routine02F609

#_029080: LDA.b #$00
#_029082: JSL routine02FC6E

#_029086: JSR DisableFBlank_02
#_029089: JSR EnableNMI

#_02908C: LDA.w $0B16
#_02908F: LSR A
#_029090: STA.w $040D

#_029093: STZ.w $0454

#_029096: LDA.b #$01
#_029098: JSL routine02CBD1

#_02909C: LDA.b #$07
#_02909E: JSL routine02CBD1

#_0290A2: JSL routine02E87C
#_0290A6: JSL routine00A17E

;---------------------------------------------------------------------------------------------------

#_0290AA: SEP #$20

#_0290AC: LDA.b #$43
#_0290AE: STA.w $0F4B
#_0290B1: STA.w BG12NBA

#_0290B4: LDA.b #$1F
#_0290B6: STA.w $0F74
#_0290B9: STA.w TM

#_0290BC: LDA.b #$10
#_0290BE: STA.w $0F76
#_0290C1: STA.w TS

#_0290C4: LDA.b #$FF
#_0290C6: STA.w $0F4F
#_0290C9: STZ.w $0F50

#_0290CC: JSL routine0F850B

#_0290D0: JSL BrightenScreen

#_0290D4: JSL routine02BA4C
#_0290D8: JSL routine00A840

#_0290DC: JSL UpdateDirTilemap

#_0290E0: PLB

#_0290E1: PLP
#_0290E2: RTL

;===================================================================================================

routine0290E3:
#_0290E3: PHP

#_0290E4: PHB
#_0290E5: PHK
#_0290E6: PLB

#_0290E7: JSL DarkenScreen
#_0290EB: JSL Reset_OAMrelatedWRAM

#_0290EF: SEP #$30
#_0290F1: JSR routine02C07B
#_0290F4: JSR EnableFBlank_02
#_0290F7: JSR DisableNMI
#_0290FA: LDA.b #$81
#_0290FC: STA.w $0F00
#_0290FF: STA.w NMITIMEN
#_029102: LDA.b #$FF
#_029104: STA.w $0F7F
#_029107: LDA.b #$01
#_029109: JSR routine02C10F
#_02910C: LDA.b #$16
#_02910E: STA.w TM
#_029111: LDA.b #$02
#_029113: STA.w TS
#_029116: JSL routine028DB7
#_02911A: JSR EnableNMI
#_02911D: JSR routine02B75C
#_029120: JSR routine02BC34
#_029123: JSR routine028659
#_029126: JSL AddSelfAsVectorAndMakeSpace
#_02912A: JSL BrightenScreen
#_02912E: JSR routine02B999

#_029131: SEP #$20
#_029133: LDA.b #$FF
#_029135: STA.w $0B35
#_029138: JSR routine02AF6A
#_02913B: PLB
#_02913C: PLP
#_02913D: RTL

;===================================================================================================

routine02913E:
#_02913E: PHP
#_02913F: REP #$20
#_029141: LDA.w $07F5
#_029144: CMP.w #$5F27
#_029147: BEQ .branch029151

.branch029149
#_029149: SEP #$30
#_02914B: JSL routine02E87C
#_02914F: PLP
#_029150: RTL

.branch029151
#_029151: SEP #$30
#_029153: LDA.w $0400
#_029156: AND.b #$40
#_029158: BEQ .branch029149

#_02915A: JSL routine02E32D
#_02915E: PLP
#_02915F: RTL

;===================================================================================================

routine029160:
#_029160: PHP
#_029161: SEP #$30
#_029163: LDA.b #$04
#_029165: LDX.b #$00
#_029167: LDY.b #$01
#_029169: JSL GraduallyFadeStuff
#_02916D: LDA.w $0F74
#_029170: ORA.b #$02
#_029172: STA.w $0F74
#_029175: STA.w TM
#_029178: PLP
#_029179: RTL

; TODO make into 2 byte entry table?
data02917A:
#_02917A: db $00

data02917B:
#_02917B: db $00,$00,$00,$00,$00,$00,$00,$00
#_029183: db $00,$00,$01,$00,$01,$00,$02,$00
#_02918B: db $02,$06,$02,$06,$02,$06,$02,$06
#_029193: db $03,$06,$03,$06,$03,$00,$00,$00
#_02919B: db $00,$00,$00,$00,$00,$00,$00,$00
#_0291A3: db $00,$00,$01,$00,$01,$00,$02,$00
#_0291AB: db $02,$06,$02,$06,$02,$06,$02,$06
#_0291B3: db $03,$06,$03,$06,$03,$00,$00,$00
#_0291BB: db $00,$00,$00,$00,$00,$00,$00,$00
#_0291C3: db $00,$00,$01,$00,$01,$00,$02,$00
#_0291CB: db $02,$06,$02,$06,$02,$06,$02,$06
#_0291D3: db $03,$06,$03,$06,$03,$00,$00,$00
#_0291DB: db $00,$00,$00,$00,$00,$00,$00,$00
#_0291E3: db $00,$00,$01,$00,$02,$00,$02,$00
#_0291EB: db $02,$05,$02,$05,$02,$05,$02,$05
#_0291F3: db $02,$06,$02,$06,$02,$00,$00,$00
#_0291FB: db $00,$00,$00,$00,$00,$00,$00,$00
#_029203: db $00,$00,$00,$00,$00,$00,$00,$00
#_02920B: db $00,$05,$02,$05,$02,$05,$02,$06
#_029213: db $02,$06,$02,$06,$02,$00,$00,$00
#_02921B: db $00,$00,$00,$00,$00,$00,$00,$00
#_029223: db $00,$00,$00,$00,$00,$00,$00,$00
#_02922B: db $00,$05,$02,$05,$02,$05,$02,$06
#_029233: db $02,$06,$02,$06,$02,$00,$00

data02923A:
#_02923A: db $1E

data02923B:
#_02923B: db $06,$1E,$06,$1D,$08,$1D,$08,$1D
#_029243: db $08,$1D,$08,$1D,$08,$1D,$08,$20
#_02924B: db $0C,$20,$0C,$20,$0C,$20,$0C,$20
#_029253: db $0C,$20,$0C,$00,$00,$00,$00,$1E
#_02925B: db $06,$1E,$06,$1E,$06,$1D,$08,$1D
#_029263: db $08,$1D,$08,$1D,$08,$1D,$08,$20
#_02926B: db $0C,$20,$0C,$20,$0C,$20,$0C,$20
#_029273: db $0C,$20,$0C,$00,$00,$00,$00,$1E
#_02927B: db $06,$1E,$06,$1E,$06,$1D,$08,$1D
#_029283: db $08,$1D,$08,$1D,$08,$1D,$08,$20
#_02928B: db $0C,$20,$0C,$20,$0C,$20,$0C,$20
#_029293: db $0C,$20,$0C,$00,$00,$00,$00,$0D
#_02929B: db $07,$0D,$07,$0D,$07,$0D,$07,$0D
#_0292A3: db $07,$0D,$07,$16,$09,$16,$09,$20
#_0292AB: db $09,$20,$0C,$20,$0C,$20,$0C,$20
#_0292B3: db $0C,$20,$0C,$00,$00,$00,$00,$0D
#_0292BB: db $06,$0D,$06,$0D,$06,$0D,$06,$0D
#_0292C3: db $06,$0D,$07,$16,$09,$16,$09,$20
#_0292CB: db $09,$20,$0C,$20,$0C,$20,$0C,$20
#_0292D3: db $0C,$20,$0C,$00,$00,$00,$00,$0D
#_0292DB: db $06,$0D,$06,$0D,$06,$0D,$06,$0E
#_0292E3: db $06,$0E,$08,$16,$09,$16,$09,$16
#_0292EB: db $09,$16,$0A,$16,$0A,$16,$0A,$1E
#_0292F3: db $0A,$1E,$0A,$00,$00,$00,$00,$0F
#_0292FB: db $06,$0F,$06,$0F,$06,$0F,$06,$0E
#_029303: db $06,$0E,$08,$16,$09,$16,$09,$16
#_02930B: db $09,$16,$09,$16,$0A,$16,$0A,$1E
#_029313: db $0A,$1E,$0A,$00,$00,$00,$00,$0F
#_02931B: db $06,$0F,$06,$0F,$06,$0F,$06,$0F
#_029323: db $08,$0E,$08,$16,$08,$16,$09,$16
#_02932B: db $09,$16,$09,$16,$0A,$16,$0A,$1E
#_029333: db $0A,$1E,$0A,$00,$00,$00,$00,$0F
#_02933B: db $06,$0F,$06,$0F,$06,$0F,$06,$0F
#_029343: db $07,$0F,$08,$0F,$08,$16,$08,$16
#_02934B: db $09,$16,$09,$16,$0A,$1E,$0A,$1E
#_029353: db $0A,$1E,$0A,$00,$00,$00,$00,$0F
#_02935B: db $07,$0F,$07,$0F,$07,$0F,$07,$0F
#_029363: db $07,$0F,$08,$0F,$08,$16,$0C,$16
#_02936B: db $0C,$2B,$0D,$2B,$0D,$2B,$0D,$2B
#_029373: db $0D,$2B,$0D,$00,$00,$00,$00,$0F
#_02937B: db $08,$0F,$08,$0F,$08,$0F,$08,$0F
#_029383: db $08,$0F,$08,$0F,$08,$17,$0A,$17
#_02938B: db $0A,$2B,$0D,$2B,$0D,$2B,$0D,$2B
#_029393: db $0D,$2B,$0D,$00,$00,$00,$00,$17
#_02939B: db $0A,$17,$0A,$17,$0A,$17,$0D,$17
#_0293A3: db $0D,$17,$0A,$17,$0A,$17,$0A,$17
#_0293AB: db $0A,$2B,$0D,$2B,$0D,$2B,$0D,$2B
#_0293B3: db $0D,$2B,$0D,$00,$00,$00,$00,$17
#_0293BB: db $0A,$17,$0A,$17,$0A,$17,$0D,$17
#_0293C3: db $0D,$17,$0A,$17,$0A,$17,$0A,$17
#_0293CB: db $0A,$2B,$0D,$2B,$0D,$2B,$0D,$2B
#_0293D3: db $0D,$2B,$0D,$00,$00,$00,$00,$17
#_0293DB: db $0A,$17,$0A,$17,$0A,$17,$0D,$17
#_0293E3: db $0D,$17,$0A,$17,$0A,$17,$0A,$17
#_0293EB: db $0A,$2B,$0D,$2B,$0D,$2B,$0D,$2B
#_0293F3: db $0D,$2B,$0D,$00,$00,$00,$00

data0293FA:
#_0293FA: db $2C

data0293FB:
#_0293FB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029403: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02940B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029413: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02941B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029423: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02942B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029433: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02943B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029443: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02944B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029453: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02945B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029463: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02946B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029473: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02947B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029483: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02948B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029493: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02949B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294A3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294AB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294B3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294BB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294C3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294CB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294D3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294DB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294E3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294EB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294F3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0294FB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029503: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02950B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029513: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02951B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029523: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02952B: db $02,$2B,$02,$2B,$02,$2B,$02,$2C
#_029533: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02953B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029543: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02954B: db $02,$2B,$02,$2B,$02,$2B,$02,$2B
#_029553: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02955B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029563: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02956B: db $02,$2B,$02,$2B,$02,$2B,$02,$2B
#_029573: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02957B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_029583: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02958B: db $02,$2C,$02,$2B,$02,$2B,$02,$2C
#_029593: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_02959B: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295A3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295AB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295B3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295BB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295C3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295CB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295D3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295DB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295E3: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295EB: db $02,$2C,$02,$2C,$02,$2C,$02,$2C
#_0295F3: db $02,$2C,$02,$2C,$02,$2C,$02

routine0295FA:
#_0295FA: SEP #$30
#_0295FC: LDA.b #$E6
#_0295FE: JSL TestGameProgressBit
#_029602: BCS .branch029605

#_029604: RTL

.branch029605
#_029605: LDA.w $0AA0
#_029608: AND.b #$03
#_02960A: ASL A
#_02960B: TAX

#_02960C: REP #$20
#_02960E: LDA.w $0F53
#_029611: CLC
#_029612: ADC.w data029648,X
#_029615: STA.w $0F53

#_029618: SEP #$20
#_02961A: DEC.w $0AA0
#_02961D: BMI .branch029620

#_02961F: RTL

.branch029620
#_029620: DEC.w $0A9F
#_029623: LDA.w $0A9F
#_029626: BPL .branch02962B
#_029628: JMP .branch0296EB

.branch02962B
#_02962B: LDA.b #$3B
#_02962D: STA.w $0AA0
#_029630: LDA.w $0A9F
#_029633: AND.b #$0F
#_029635: CMP.b #$0F
#_029637: BNE .branch029643

#_029639: LDA.w $0A9F
#_02963C: AND.b #$F0
#_02963E: ORA.b #$09
#_029640: STA.w $0A9F

.branch029643
#_029643: JSL routine029650
#_029647: RTL

data029648:
#_029648: dw -1, 1, 1, -1

routine029650:
#_029650: PHP
#_029651: PHB
#_029652: PHK
#_029653: PLB

#_029654: REP #$30
#_029656: LDA.w $0A9F
#_029659: LSR A
#_02965A: LSR A
#_02965B: LSR A
#_02965C: LSR A
#_02965D: AND.w #$000F
#_029660: ASL A
#_029661: TAY
#_029662: LDA.w data0296D7,Y
#_029665: STA.w $0002
#_029668: LDA.w $0A9F
#_02966B: AND.w #$000F
#_02966E: ASL A
#_02966F: TAY
#_029670: LDA.w data0296D7,Y
#_029673: STA.w $0004
#_029676: LDA.w #$0020
#_029679: STA.w $0006
#_02967C: LDA.w #$001F
#_02967F: STA.w $0008
#_029682: LDA.w #$0054
#_029685: STA.w $1A62
#_029688: LDA.w #$0068
#_02968B: STA.w $1A64
#_02968E: LDA.w #$0088
#_029691: STA.w $1A66
#_029694: LDA.w #$009C
#_029697: STA.w $1A68
#_02969A: LDA.w #$0030
#_02969D: STA.w $1AA2
#_0296A0: STA.w $1AA4
#_0296A3: STA.w $1AA6
#_0296A6: STA.w $1AA8
#_0296A9: LDA.w #$0000
#_0296AC: STA.w $0042
#_0296AF: STA.w $0044
#_0296B2: STA.w $0046
#_0296B5: STA.w $0048

#_0296B8: SEP #$20
#_0296BA: LDA.b #$80
#_0296BC: STA.w $1A01
#_0296BF: STA.w $1A02
#_0296C2: STA.w $1A03
#_0296C5: STA.w $1A04
#_0296C8: STA.w $1A21
#_0296CB: STA.w $1A22
#_0296CE: STA.w $1A23
#_0296D1: STA.w $1A24
#_0296D4: PLB
#_0296D5: PLP
#_0296D6: RTL

data0296D7:
#_0296D7: dw $0015,$0016,$0017,$0018
#_0296DF: dw $0019,$001A,$001B,$001C
#_0296E7: dw $001D,$001E

.branch0296EB
#_0296EB: PHB
#_0296EC: PHK
#_0296ED: PLB
#_0296EE: JSL routine02981B

#_0296F2: SEP #$20
#_0296F4: LDA.b #$FD ; SONG COMMAND FD - FADE
#_0296F6: JSL WriteAPUCareful

#_0296FA: REP #$20
#_0296FC: LDA.w $0400
#_0296FF: AND.w #$FF7F
#_029702: STA.w $0400
#_029705: LDA.w #$00AA
#_029708: STA.w $0004
#_02970B: STA.w $0006

#_02970E: SEP #$30
#_029710: LDA.b #$80
#_029712: STA.w $1A02
#_029715: STA.w $1A03
#_029718: LDA.b #$FF
#_02971A: STA.w $0A71
#_02971D: LDA.b #$E6
#_02971F: JSL ClearGameProgressBit_long
#_029723: LDA.b #$E5
#_029725: JSL SetGameProgressBit_long
#_029729: STZ.w $0A9F
#_02972C: LDA.b #$3C
#_02972E: STZ.w $0AA0
#_029731: JSL Reset_OAMrelatedWRAM
#_029735: LDA.b #$FF
#_029737: LDX.b #$00
#_029739: LDY.b #$01
#_02973B: JSL routine009443
#_02973F: LDA.b #$FF
#_029741: LDX.b #$00
#_029743: LDY.b #$04
#_029745: JSL routine009508
#_029749: LDA.b #$52 ; SONG 52
#_02974B: JSL WriteAPUCareful
#_02974F: JSR routine02997B
#_029752: JSL DarkenScreen
#_029756: JSL Reset_OAMrelatedWRAM
#_02975A: JSR routine02983D

#_02975D: SEP #$20
#_02975F: LDA.b #$FF
#_029761: STA.w $0F7F
#_029764: LDA.b #$FF
#_029766: STA.w $0F0E
#_029769: STZ.w $0F0D
#_02976C: JSL routine029A3A

#_029770: SEP #$20
#_029772: STZ.w $0CF2
#_029775: JSR routine02987B
#_029778: JSR EnableFBlank_02
#_02977B: JSR DisableNMI
#_02977E: STZ.w $0F00
#_029781: JSL ZeroVRAM_02
#_029785: JSL ZeroCGRAM_02
#_029789: LDA.b #$00
#_02978B: JSR routine02C10F
#_02978E: JSR EnableNMI
#_029791: JSR DisableFBlank_02
#_029794: LDA.b #$A1
#_029796: STA.w $0F00

#_029799: SEP #$30
#_02979B: LDA.b #$FD ; SONG COMMAND FD - FADE
#_02979D: JSL WriteAPUCareful
#_0297A1: LDY.b #$78
#_0297A3: JSL RunFramesYTimes

#_0297A7: REP #$30
#_0297A9: STZ.w $0A33
#_0297AC: LDA.w $0A1A
#_0297AF: STA.w $0980
#_0297B2: LDA.w #$033C
#_0297B5: STA.w $0A12
#_0297B8: JSL LoadClassyMessage

#_0297BC: SEP #$20
#_0297BE: LDA.b #$2F
#_0297C0: JSL SetGameProgressBit_long
#_0297C4: LDA.b #$00
#_0297C6: STA.w $1EFF

#_0297C9: REP #$20
#_0297CB: LDA.w #$B2E4 ; TODO
#_0297CE: STA.w $1EFD
#_0297D1: LDA.w #$0000
#_0297D4: STA.w $1060
#_0297D7: LDX.w #$0060
#_0297DA: JSL routine0F853F
#_0297DE: LDX.w #$0000

.branch0297E1
#_0297E1: LDA.w #$0000
#_0297E4: STA.w $1002,X
#_0297E7: LDA.w $1030,X
#_0297EA: STA.w $102E,X
#_0297ED: LDA.w $1034,X
#_0297F0: STA.w $1032,X
#_0297F3: TXA
#_0297F4: CLC
#_0297F5: ADC.w #$0060
#_0297F8: TAX
#_0297F9: CPX.w #$0180
#_0297FC: BNE .branch0297E1

#_0297FE: SEP #$20
#_029800: LDA.b #$03
#_029802: STA.w $1901
#_029805: STA.w $1905
#_029808: STZ.w $1909

#_02980B: REP #$20
#_02980D: LDA.w #routine03837C ; TODO
#_029810: STA.w $190E
#_029813: LDA.w #$1EFC
#_029816: STA.w $1916
#_029819: PLB
#_02981A: RTL

;===================================================================================================

routine02981B:
#_02981B: SEP #$20
#_02981D: LDA.b #$02
#_02981F: STA.w $1901
#_029822: STA.w $1905
#_029825: STZ.w $1909

#_029828: REP #$20
#_02982A: LDA.w #.branch029837
#_02982D: STA.w $190E
#_029830: LDA.w #$1EFC
#_029833: STA.w $1916
#_029836: RTL

.branch029837
#_029837: JSL AddSelfAsVector
#_02983B: BRA .branch029837

routine02983D:
#_02983D: REP #$30
#_02983F: LDY.w #$0180
#_029842: LDX.w #$0000

.branch029845
#_029845: LDA.w $1000,Y
#_029848: BPL .branch029865

#_02984A: LDA.w #$0000
#_02984D: STA.w $1000,Y
#_029850: PHY
#_029851: PHX
#_029852: PHP
#_029853: TYX
#_029854: JSL routine0F853F
#_029858: PLP
#_029859: PLX
#_02985A: PLY

#_02985B: SEP #$20
#_02985D: LDA.w $1004,Y
#_029860: STA.w $07E2,X
#_029863: BRA .branch02986C

.branch029865
#_029865: SEP #$20
#_029867: LDA.b #$FF
#_029869: STA.w $07E2,X

.branch02986C
#_02986C: REP #$20
#_02986E: TYA
#_02986F: CLC
#_029870: ADC.w #$0060
#_029873: TAY
#_029874: INX
#_029875: CPX.w #$000C
#_029878: BNE .branch029845

#_02987A: RTS

;===================================================================================================

routine02987B:
#_02987B: PHP
#_02987C: SEP #$10
#_02987E: REP #$20
#_029880: LDA.w #$2100
#_029883: TCD
#_029884: LDX.b #$60 ; object sizes 16x16 and 32x32
#_029886: STX.b OBSEL
#_029888: STX.w $0F44
#_02988B: LDA.w #$0000
#_02988E: STA.b OAMADDR
#_029890: LDX.b #$01
#_029892: STX.b BGMODE
#_029894: STX.w $0F45
#_029897: LDX.b #$00
#_029899: STX.b MOSAIC
#_02989B: STX.w $0F46
#_02989E: LDX.b #$38
#_0298A0: STX.b BG1SC
#_0298A2: STX.w $0F47
#_0298A5: LDX.b #$29
#_0298A7: STX.b BG2SC
#_0298A9: STX.w $0F48
#_0298AC: LDX.b #$3C
#_0298AE: STX.b BG3SC
#_0298B0: STX.w $0F49
#_0298B3: LDX.b #$34
#_0298B5: STX.b BG4SC
#_0298B7: STX.w $0F4A
#_0298BA: LDX.b #$43
#_0298BC: STX.b BG12NBA
#_0298BE: STX.w $0F4B
#_0298C1: LDX.b #$22
#_0298C3: STX.b BG34NBA
#_0298C5: STX.w $0F4C
#_0298C8: LDX.b #$00
#_0298CA: STX.b BG1HOFS
#_0298CC: STX.w $0F4D
#_0298CF: STX.b BG1HOFS
#_0298D1: STX.w $0F4E
#_0298D4: STX.b BG1VOFS
#_0298D6: STX.w $0F4F
#_0298D9: STX.b BG1VOFS
#_0298DB: STX.w $0F50
#_0298DE: STX.b BG2HOFS
#_0298E0: STX.w $0F51
#_0298E3: STX.b BG2HOFS
#_0298E5: STX.w $0F52
#_0298E8: STX.b BG2VOFS
#_0298EA: STX.w $0F53
#_0298ED: STX.b BG2VOFS
#_0298EF: STX.w $0F54
#_0298F2: STX.b BG3HOFS
#_0298F4: STX.w $0F55
#_0298F7: STX.b BG3HOFS
#_0298F9: STX.w $0F56
#_0298FC: STX.b BG3VOFS
#_0298FE: STX.w $0F57
#_029901: STX.b BG3VOFS
#_029903: STX.w $0F58
#_029906: STX.b BG4HOFS
#_029908: STX.w $0F59
#_02990B: STX.b BG4HOFS
#_02990D: STX.w $0F5A
#_029910: STX.b BG4VOFS
#_029912: STX.w $0F5B
#_029915: STX.b BG4VOFS
#_029917: STX.w $0F50
#_02991A: LDX.b #$80
#_02991C: STX.b VMAIN
#_02991E: STX.w $0F5D
#_029921: LDX.b #$1F
#_029923: STX.b TM
#_029925: STX.w $0F74
#_029928: LDX.b #$03
#_02992A: STX.b TS
#_02992C: STX.w $0F76
#_02992F: LDX.b #$00
#_029931: STX.b TMW
#_029933: STX.w $0F78
#_029936: STX.b TSW
#_029938: STX.w $0F79
#_02993B: LDX.b #$02
#_02993D: STX.b CGWSEL
#_02993F: LDX.b #$50
#_029941: STX.b CGADSUB
#_029943: LDX.b #$E0
#_029945: STX.b COLDATA
#_029947: STX.w $0F7D
#_02994A: LDX.b #$00
#_02994C: STX.b SETINI
#_02994E: LDA.w #$4200
#_029951: TCD
#_029952: LDX.b #$FF
#_029954: STX.b WRIO
#_029956: LDA.w #$0000
#_029959: STA.b HTIMEL
#_02995B: STA.w $0F01
#_02995E: STA.b VTIMEL
#_029960: STA.w $0F03
#_029963: LDX.b #$00
#_029965: STX.b MDMAEN
#_029967: STX.w $0F05
#_02996A: STX.w $0F06
#_02996D: STX.b HDMAEN
#_02996F: STX.w $0F0D
#_029972: STX.w $0F0E
#_029975: LDA.w #$0000
#_029978: TCD
#_029979: PLP
#_02997A: RTS

;===================================================================================================

routine02997B:
#_02997B: PHP
#_02997C: SEP #$30
#_02997E: LDA.b #$14
#_029980: STA.w $0F74
#_029983: STA.w TM
#_029986: LDA.b #$FF
#_029988: STA.w $0F7F
#_02998B: LDA.b #$80
#_02998D: STA.w $0F0E
#_029990: STZ.w $0F0D
#_029993: LDA.b #$00

.branch029995
#_029995: PHA
#_029996: PHA
#_029997: JSL ClearSomeBank7FBuffers
#_02999B: PLA
#_02999C: JSL VRAM_From_7FXXXX
#_0299A0: JSL AddSelfAsVectorAndMakeSpace
#_0299A4: PLA
#_0299A5: INC A
#_0299A6: CMP.b #$03
#_0299A8: BNE .branch029995

#_0299AA: LDA.b #$2F
#_0299AC: JSL routine02F609
#_0299B0: LDA.b #$00
#_0299B2: JSL routine02FC09
#_0299B6: LDA.b #$FF
#_0299B8: STA.l $7E2500
#_0299BC: AND.b #$7F
#_0299BE: STA.l $7E2501
#_0299C2: LDA.b #$07
#_0299C4: JSL routine02BA74
#_0299C8: LDA.b #$01
#_0299CA: JSL routine02CBD1

#_0299CE: REP #$30
#_0299D0: LDA.w #$3DC4
#_0299D3: STA.w $0A1A
#_0299D6: LDA.w #$0018
#_0299D9: STA.w $0A1E
#_0299DC: LDA.w #$000C
#_0299DF: STA.w $0A20
#_0299E2: LDA.w #$0002
#_0299E5: STA.w $0A1C
#_0299E8: LDA.w #$035B
#_0299EB: STA.w $0A12
#_0299EE: JSL LoadClassyMessage
#_0299F2: JSL routine03837C

#_0299F6: SEP #$30
#_0299F8: LDA.b #$09
#_0299FA: STA.w $0F45
#_0299FD: STA.w BGMODE

#_029A00: REP #$30
#_029A02: LDY.w #$0120
#_029A05: JSL RunFramesYTimes

#_029A09: SEP #$30
#_029A0B: LDA.b #$14
#_029A0D: STA.w $0F74
#_029A10: STA.w TM
#_029A13: LDA.b #$02
#_029A15: LDX.b #$80
#_029A17: LDY.b #$04
#_029A19: JSL routine009508
#_029A1D: LDA.b #$01
#_029A1F: LDX.b #$00
#_029A21: LDY.b #$04
#_029A23: JSL routine009508
#_029A27: JSL routine02E835
#_029A2B: JSL AddSelfAsVectorAndMakeSpace

#_029A2F: REP #$30
#_029A31: LDY.w #$0040
#_029A34: JSL RunFramesYTimes
#_029A38: PLP
#_029A39: RTS

;===================================================================================================

routine029A3A:
#_029A3A: SEP #$20
#_029A3C: REP #$10
#_029A3E: STZ.w $0CF2
#_029A41: INC.w $0CF2
#_029A44: JSR routine029A6D
#_029A47: JSR routine029A7E
#_029A4A: JSR routine029B2E
#_029A4D: JSR routine029C83
#_029A50: JSR routine029A5A
#_029A53: JSR routine029BE5
#_029A56: JSR routine029A6D
#_029A59: RTL

;===================================================================================================

routine029A5A:
#_029A5A: LDX.w #$0000
#_029A5D: STX.w INIDISP
#_029A60: STX.w $0F43
#_029A63: LDX.w #$0080
#_029A66: STX.w NMITIMEN
#_029A69: STX.w $0F00
#_029A6C: RTS

;===================================================================================================

routine029A6D:
#_029A6D: LDA.b #$80
#_029A6F: STA.w INIDISP
#_029A72: STA.w $0F43
#_029A75: LDA.b #$00
#_029A77: STA.w NMITIMEN
#_029A7A: STA.w $0F00
#_029A7D: RTS

;===================================================================================================

routine029A7E:
#_029A7E: SEP #$20
#_029A80: REP #$10
#_029A82: LDA.b #$63
#_029A84: STA.w OBSEL
#_029A87: LDA.b #$00
#_029A89: STA.w OAMADDL
#_029A8C: STA.w OAMADDH
#_029A8F: LDA.b #$07
#_029A91: STA.w BGMODE
#_029A94: LDA.b #$00
#_029A96: STA.w MOSAIC
#_029A99: LDA.b #$80
#_029A9B: STA.w VMAIN
#_029A9E: LDA.b #$00
#_029AA0: STA.w CGADD
#_029AA3: STA.w W12SEL
#_029AA6: STA.w W34SEL
#_029AA9: STA.w WOBJSEL
#_029AAC: STA.w WINDOW1L
#_029AAF: STA.w WINDOW1R
#_029AB2: STA.w WINDOW2L
#_029AB5: STA.w WINDOW2R
#_029AB8: STA.w WBGLOG
#_029ABB: STA.w WOBJLOG
#_029ABE: LDA.b #$13
#_029AC0: STA.w TM
#_029AC3: STA.w TS
#_029AC6: LDA.b #$00
#_029AC8: STA.w TMW
#_029ACB: STA.w TSW
#_029ACE: LDA.b #$30
#_029AD0: STA.w CGWSEL
#_029AD3: LDA.b #$00
#_029AD5: STA.w CGADSUB
#_029AD8: LDA.b #$E0
#_029ADA: STA.w COLDATA
#_029ADD: LDA.b #$00
#_029ADF: STA.w SETINI
#_029AE2: STA.w NMITIMEN
#_029AE5: LDA.b #$FF
#_029AE7: STA.w WRIO
#_029AEA: LDA.b #$00
#_029AEC: STA.w WRMPYA
#_029AEF: STA.w WRMPYB
#_029AF2: STA.w WRDIVL
#_029AF5: STA.w WRDIVH
#_029AF8: STA.w WRDIVB
#_029AFB: STA.w HTIMEL
#_029AFE: STA.w HTIMEH
#_029B01: STA.w VTIMEL
#_029B04: STA.w VTIMEH
#_029B07: STA.w MDMAEN
#_029B0A: STA.w HDMAEN
#_029B0D: LDA.b #$07
#_029B0F: STA.w BGMODE
#_029B12: LDA.b #$40
#_029B14: STA.w BG12NBA
#_029B17: LDA.b #$13
#_029B19: STA.w TM
#_029B1C: STA.w TS
#_029B1F: RTS

;===================================================================================================

routine029B20:
#_029B20: PHA
#_029B21: STZ.w $0CF2
#_029B24: INC.w $0CF2

.branch029B27
#_029B27: LDA.w $0CF2
#_029B2A: BNE .branch029B27

#_029B2C: PLA
#_029B2D: RTS

;===================================================================================================

routine029B2E:
#_029B2E: LDA.b #$80
#_029B30: STA.w VMAIN
#_029B33: LDA.b #$00
#_029B35: STA.w VMADDL
#_029B38: STA.w VMADDH
#_029B3B: LDY.w #$1F00
#_029B3E: LDX.w #$0000

.branch029B41
#_029B41: LDA.l UNREACH_228000,X
#_029B45: LSR A
#_029B46: LSR A
#_029B47: LSR A
#_029B48: LSR A
#_029B49: AND.b #$0F
#_029B4B: STA.w VMDATAH
#_029B4E: LDA.l UNREACH_228000,X
#_029B52: AND.b #$0F
#_029B54: STA.w VMDATAH
#_029B57: INX
#_029B58: DEY
#_029B59: BNE .branch029B41

#_029B5B: LDA.b #$00
#_029B5D: STA.w VMAIN
#_029B60: LDA.b #$00
#_029B62: STA.w VMADDL
#_029B65: STA.w VMADDH
#_029B68: LDY.w #$0010

.branch029B6B
#_029B6B: PHY
#_029B6C: LDY.w #$0010

.branch029B6F
#_029B6F: LDA.l UNREACH_228000,X
#_029B73: STA.w VMDATAL
#_029B76: INX
#_029B77: DEY
#_029B78: BNE .branch029B6F

#_029B7A: LDY.w #$0070
#_029B7D: LDA.b #$00

.branch029B7F
#_029B7F: STA.w VMDATAL
#_029B82: DEY
#_029B83: BNE .branch029B7F

#_029B85: PLY
#_029B86: DEY
#_029B87: BNE .branch029B6B

#_029B89: LDX.w #$3800
#_029B8C: LDA.b #$00

.branch029B8E
#_029B8E: STA.w VMDATAL
#_029B91: DEX
#_029B92: BNE .branch029B8E

#_029B94: LDA.b #$00
#_029B96: STA.w CGADD
#_029B99: LDX.w #$0010
#_029B9C: LDY.w #$0000

.branch029B9F
#_029B9F: LDA.w data029E77,Y
#_029BA2: STA.w CGDATA
#_029BA5: INY
#_029BA6: LDA.w data029E77,Y
#_029BA9: STA.w CGDATA
#_029BAC: INY
#_029BAD: DEX
#_029BAE: BNE .branch029B9F

#_029BB0: RTS

;===================================================================================================

routine029BB1:
#_029BB1: LDX.w #$0000
#_029BB4: LDY.w #$0010

.branch029BB7
#_029BB7: JSR routine029B20
#_029BBA: JSR routine029B20
#_029BBD: JSR routine029B20
#_029BC0: JSR routine029B20
#_029BC3: STX.w INIDISP
#_029BC6: INX
#_029BC7: DEY
#_029BC8: BNE .branch029BB7

#_029BCA: RTS

;===================================================================================================

routine029BCB:
#_029BCB: LDX.w #$000F
#_029BCE: LDY.w #$0010

.branch029BD1
#_029BD1: JSR routine029B20
#_029BD4: JSR routine029B20
#_029BD7: JSR routine029B20
#_029BDA: JSR routine029B20
#_029BDD: STX.w INIDISP
#_029BE0: DEX
#_029BE1: DEY
#_029BE2: BNE .branch029BD1

#_029BE4: RTS

;===================================================================================================

routine029BE5:
#_029BE5: JSR routine029BB1

.branch029BE8
#_029BE8: JSR routine029C5B
#_029BEB: JSR routine029C0E
#_029BEE: JSR routine029D02
#_029BF1: JSR routine029B20
#_029BF4: JSR routine029CBD
#_029BF7: LDA.w $0D01
#_029BFA: BNE .branch029BE8

#_029BFC: LDA.w $0D02
#_029BFF: BNE .branch029BE8

#_029C01: LDX.w #$0040

.branch029C04
#_029C04: JSR routine029B20
#_029C07: DEX
#_029C08: BNE .branch029C04

#_029C0A: JSR routine029BCB
#_029C0D: RTS

;===================================================================================================

routine029C0E:
#_029C0E: SEC
#_029C0F: LDA.w $0D01
#_029C12: SBC.w $0D0C
#_029C15: STA.w $0D01
#_029C18: LDA.w $0D02
#_029C1B: SBC.b #$00
#_029C1D: STA.w $0D02
#_029C20: BCC .branch029C55

#_029C22: SEC
#_029C23: LDA.w $0D0B
#_029C26: SBC.w $0D0C
#_029C29: STA.w $0D0B
#_029C2C: LDA.w $0D0C
#_029C2F: SBC.b #$00
#_029C31: STA.w $0D0C
#_029C34: BEQ .branch029C4B

#_029C36: SEC
#_029C37: LDA.w $0D0B
#_029C3A: SBC.w $0D0C
#_029C3D: STA.w $0D0B
#_029C40: LDA.w $0D0C
#_029C43: SBC.b #$00
#_029C45: STA.w $0D0C
#_029C48: BEQ .branch029C4B

#_029C4A: RTS

.branch029C4B
#_029C4B: LDA.b #$00
#_029C4D: STA.w $0D01
#_029C50: LDA.b #$00
#_029C52: STA.w $0D02

.branch029C55
#_029C55: LDA.b #$01
#_029C57: STA.w $0D0C
#_029C5A: RTS

;===================================================================================================

routine029C5B:
#_029C5B: CLC
#_029C5C: LDA.w $0CFF
#_029C5F: ADC.b #$04
#_029C61: STA.w $0CFF
#_029C64: LDA.w $0D00
#_029C67: ADC.b #$00
#_029C69: STA.w $0D00
#_029C6C: LDA.w $0CFF
#_029C6F: CMP.b #$68
#_029C71: BNE .branch029C82

#_029C73: LDA.w $0D00
#_029C76: CMP.b #$01
#_029C78: BNE .branch029C82

#_029C7A: LDA.b #$00
#_029C7C: STA.w $0CFF
#_029C7F: STA.w $0D00

.branch029C82
#_029C82: RTS

;===================================================================================================

routine029C83:
#_029C83: LDA.b #$00
#_029C85: STA.w $0CFF
#_029C88: STA.w $0D00
#_029C8B: LDA.b #$00
#_029C8D: STA.w $0D01
#_029C90: STA.w $0D0B
#_029C93: LDA.b #$20
#_029C95: STA.w $0D02
#_029C98: ASL A
#_029C99: INC A
#_029C9A: STA.w $0D0C
#_029C9D: JSR routine029D02
#_029CA0: JSR routine029CBD
#_029CA3: LDA.b #$C0
#_029CA5: STA.w BG1HOFS
#_029CA8: LDA.b #$FF
#_029CAA: STA.w BG1HOFS
#_029CAD: LDA.b #$D0
#_029CAF: STA.w BG1VOFS
#_029CB2: LDA.b #$FF
#_029CB4: STA.w BG1VOFS
#_029CB7: LDA.b #$C0
#_029CB9: STA.w M7SEL
#_029CBC: RTS

;===================================================================================================

routine029CBD:
#_029CBD: LDA.b #$40
#_029CBF: STA.w M7X
#_029CC2: LDA.b #$00
#_029CC4: STA.w M7X
#_029CC7: LDA.b #$40
#_029CC9: STA.w M7Y
#_029CCC: LDA.b #$00
#_029CCE: STA.w M7Y
#_029CD1: LDA.w $0D03
#_029CD4: STA.w M7A
#_029CD7: LDA.w $0D04
#_029CDA: STA.w M7A
#_029CDD: LDA.w $0D05
#_029CE0: STA.w M7B
#_029CE3: LDA.w $0D06
#_029CE6: STA.w M7B
#_029CE9: LDA.w $0D07
#_029CEC: STA.w M7C
#_029CEF: LDA.w $0D08
#_029CF2: STA.w M7C
#_029CF5: LDA.w $0D09
#_029CF8: STA.w M7D
#_029CFB: LDA.w $0D0A
#_029CFE: STA.w M7D
#_029D01: RTS

;===================================================================================================

routine029D02:
#_029D02: PHP
#_029D03: REP #$30
#_029D05: LDA.w $0D01
#_029D08: STA.w $0CFD
#_029D0B: JSL routine029DAF
#_029D0F: JSR routine029D45
#_029D12: TAX
#_029D13: STA.w $0D09
#_029D16: LDA.w #$0120
#_029D19: STA.w $0CFD
#_029D1C: JSR routine029D45
#_029D1F: STA.w $0D03
#_029D22: LDA.w $0D01
#_029D25: STA.w $0CFD
#_029D28: JSL routine029DBD
#_029D2C: JSR routine029D45
#_029D2F: STA.w $0D05
#_029D32: TAX
#_029D33: LDA.w #$0120
#_029D36: STA.w $0CFD
#_029D39: JSR routine029D45
#_029D3C: EOR.w #$FFFF
#_029D3F: INC A
#_029D40: STA.w $0D07
#_029D43: PLP
#_029D44: RTS

;===================================================================================================

routine029D45:
#_029D45: REP #$20
#_029D47: STZ.w $0CFB
#_029D4A: TXA
#_029D4B: BPL .branch029D54

#_029D4D: STA.w $0CFB
#_029D50: DEC A
#_029D51: EOR.w #$FFFF

.branch029D54
#_029D54: STA.w $0CF3

#_029D57: SEP #$20
#_029D59: LDA.w $0CFD
#_029D5C: STA.w WRMPYA
#_029D5F: LDA.w $0CF3
#_029D62: STA.w WRMPYB
#_029D65: PHB
#_029D66: PLB
#_029D67: LDA.w RDMPYH
#_029D6A: STA.w $0CF5
#_029D6D: LDA.w $0CF4
#_029D70: STA.w WRMPYB
#_029D73: PHB
#_029D74: PLB
#_029D75: LDX.w RDMPYL
#_029D78: STX.w $0CF7
#_029D7B: LDA.w $0CFE
#_029D7E: STA.w WRMPYA
#_029D81: LDA.w $0CF3
#_029D84: STA.w WRMPYB
#_029D87: PHB
#_029D88: PLB
#_029D89: LDX.w RDMPYL
#_029D8C: LDA.w $0CF4
#_029D8F: STA.w WRMPYB
#_029D92: PHB
#_029D93: PLB
#_029D94: LDA.w RDMPYL
#_029D97: STA.w $0CF6

#_029D9A: REP #$20
#_029D9C: TXA
#_029D9D: CLC
#_029D9E: ADC.w $0CF5
#_029DA1: CLC
#_029DA2: ADC.w $0CF7
#_029DA5: LDX.w $0CFB
#_029DA8: BEQ .branch029DAE

#_029DAA: EOR.w #$FFFF
#_029DAD: INC A

.branch029DAE
#_029DAE: RTS

;===================================================================================================

routine029DAF:
#_029DAF: REP #$30
#_029DB1: LDX.w #$0000
#_029DB4: LDA.w $0CFF
#_029DB7: CLC
#_029DB8: ADC.w #$005A
#_029DBB: BRA .branch029DC5

routine029DBD:
#_029DBD: REP #$30
#_029DBF: LDX.w #$0000
#_029DC2: LDA.w $0CFF

.branch029DC5
#_029DC5: BPL .branch029DCB

#_029DC7: CLC
#_029DC8: ADC.w #$0168

.branch029DCB
#_029DCB: CMP.w #$0168
#_029DCE: BCC .branch029DD3

#_029DD0: SBC.w #$0168

.branch029DD3
#_029DD3: TAY
#_029DD4: BEQ .branch029E1C

#_029DD6: STZ.w $0CF3
#_029DD9: SEC
#_029DDA: SBC.w #$005A
#_029DDD: BNE .branch029DE4

#_029DDF: LDX.w #$0100
#_029DE2: BRA .branch029E1C

.branch029DE4
#_029DE4: BCC .branch029E0A

#_029DE6: TAY
#_029DE7: SBC.w #$005A
#_029DEA: BEQ .branch029E1C

#_029DEC: BCC .branch029DFF

#_029DEE: STA.w $0CF3
#_029DF1: TAY
#_029DF2: SBC.w #$005A
#_029DF5: BNE .branch029DFC

#_029DF7: LDX.w #$FF00
#_029DFA: BRA .branch029E1C

.branch029DFC
#_029DFC: BCC .branch029E0A

#_029DFE: TAY

.branch029DFF
#_029DFF: STY.w $0CF5
#_029E02: LDA.w #$005A
#_029E05: SEC
#_029E06: SBC.w $0CF5
#_029E09: TAY

.branch029E0A
#_029E0A: LDA.w data029E1D,Y
#_029E0D: AND.w #$00FF
#_029E10: TAX
#_029E11: LDA.w $0CF3
#_029E14: BEQ .branch029E1C

#_029E16: TXA
#_029E17: EOR.w #$FFFF
#_029E1A: INC A
#_029E1B: TAX

.branch029E1C
#_029E1C: RTL

data029E1D:
#_029E1D: dw $0400,$0D08,$1611,$1F1A
#_029E25: dw $2723,$302C,$3935,$423D
#_029E2D: dw $4A46,$534F,$5B57,$645F
#_029E35: dw $6C68,$7470,$7C78,$8380
#_029E3D: dw $8B87,$928F,$9A96,$A19D
#_029E45: dw $A7A4,$AEAB,$B5B1,$BBB8
#_029E4D: dw $C1BE,$C6C4,$CCC9,$D1CF
#_029E55: dw $D6D4,$DBD9,$DFDD,$E4E2
#_029E5D: dw $E8E6,$EBE9,$EFED,$F2F0
#_029E65: dw $F4F3,$F7F6,$F9F8,$FBFA
#_029E6D: dw $FDFC,$FEFD,$FFFE,$FFFF
#_029E75: dw $FFFF

data029E77:
#_029E77: db $00,$00,$00,$00,$00,$10,$84,$10
#_029E7F: db $08,$11,$8C,$11,$10,$12,$94,$12
#_029E87: db $18,$23,$9C,$33,$00,$00,$00,$00
#_029E8F: db $00,$00,$00,$00,$00,$00,$9C,$73

routine029E97:
#_029E97: SEP #$30
#_029E99: PHB
#_029E9A: PHK
#_029E9B: PLB
#_029E9C: JSL DarkenScreen
#_029EA0: JSL routine02A450
#_029EA4: JSL Reset_OAMrelatedWRAM
#_029EA8: LDA.b #$07
#_029EAA: STA.w $0A2A

#_029EAD: SEP #$30
#_029EAF: LDA.b #$00
#_029EB1: JSL ClearSomeBank7FBuffers
#_029EB5: JSL ZeroVRAM_02
#_029EB9: LDA.b #$FF
#_029EBB: STA.w $0F7F
#_029EBE: STA.w $0A71
#_029EC1: LDA.b #$44
#_029EC3: STA.w BG12NBA
#_029EC6: STA.w $0F4B
#_029EC9: LDA.b #$12
#_029ECB: STA.w TM
#_029ECE: STA.w $0F74
#_029ED1: LDA.b #$01
#_029ED3: STA.w TS
#_029ED6: STA.w $0F76
#_029ED9: LDA.b #$12
#_029EDB: STA.w CGADSUB
#_029EDE: STA.w $0F7B
#_029EE1: LDA.b #$09
#_029EE3: STA.w BGMODE
#_029EE6: STA.w $0F45
#_029EE9: LDA.b #$00
#_029EEB: STA.w HDMAEN
#_029EEE: STA.w $0F0D
#_029EF1: STA.w $0F0E
#_029EF4: JSL routine02A43B
#_029EF8: LDA.b #$2B
#_029EFA: JSL routine02F609
#_029EFE: LDA.b #$27
#_029F00: JSL routine02FC6E
#_029F04: LDA.w $0A3B
#_029F07: AND.b #$01
#_029F09: CLC
#_029F0A: ADC.b #$2C
#_029F0C: JSL routine02F609
#_029F10: JSR routine02A267
#_029F13: JSL AddSelfAsVectorAndMakeSpace

#_029F17: REP #$30
#_029F19: STZ.w $0F4D
#_029F1C: STZ.w $0F4F
#_029F1F: STZ.w $0F51
#_029F22: STZ.w $0F53
#_029F25: JSR routine02A0D9
#_029F28: LDA.w #$0027
#_029F2B: JSL routine02FC6E
#_029F2F: JSL BrightenScreen
#_029F33: LDA.w #$0040 ; SONG 40
#_029F36: JSL WriteAPUCareful
#_029F3A: LDY.w #$0028
#_029F3D: JSL RunFramesYTimes
#_029F41: LDA.w #$0027
#_029F44: JSL routine02FC09
#_029F48: LDX.w #$0000

.branch029F4B
#_029F4B: PHX
#_029F4C: LDA.w #$0032 ; SFX 32
#_029F4F: JSL WriteAPUCareful
#_029F53: JSR routine02A163
#_029F56: JSR routine02A18E
#_029F59: JSR routine02A177
#_029F5C: PLX
#_029F5D: INX
#_029F5E: CPX.w $0A3B
#_029F61: BNE .branch029F4B

#_029F63: LDA.w #$0033 ; SFX 33
#_029F66: JSL WriteAPUCareful
#_029F6A: JSR routine02A465
#_029F6D: JSR routine02A51F
#_029F70: JSR routine02A10D

#_029F73: REP #$20
#_029F75: LDA.w #$003C
#_029F78: JSL Update19xxVecUntilInputOrAPasses

#_029F7C: SEP #$20
#_029F7E: LDA.b #$2F
#_029F80: JSL routine02F609
#_029F84: LDA.b #$28
#_029F86: JSL routine02FC6E
#_029F8A: LDA.b #$05
#_029F8C: JSL routine02CBD1

#_029F90: REP #$20
#_029F92: LDA.w #$3E83
#_029F95: STA.w $0A0B
#_029F98: LDA.w #$3EC4
#_029F9B: STA.w $0A1A
#_029F9E: STA.w $0980
#_029FA1: CLC
#_029FA2: ADC.w #$0040
#_029FA5: STA.w $0A2F
#_029FA8: STZ.w $0A33
#_029FAB: LDA.w #$001A
#_029FAE: STA.w $0A0D
#_029FB1: LDA.w #$0008
#_029FB4: STA.w $0A0F

#_029FB7: SEP #$20
#_029FB9: LDA.b #$11
#_029FBB: STA.w $0A11
#_029FBE: JSL routine02BA95
#_029FC2: LDA.b #$16
#_029FC4: STA.w TM
#_029FC7: STA.w $0F74
#_029FCA: PLB
#_029FCB: RTL

;===================================================================================================

routine029FCC:
#_029FCC: REP #$30
#_029FCE: PHB
#_029FCF: PHK
#_029FD0: PLB
#_029FD1: JSR routine02A021

#_029FD4: SEP #$30
#_029FD6: LDA.b #$00
#_029FD8: JSL routine02FC6E
#_029FDC: LDA.b #$00
#_029FDE: STA.w $0A59
#_029FE1: JSL routine02E32D
#_029FE5: LDA.b #$34
#_029FE7: STA.w $0A69
#_029FEA: STZ.w $0A6A
#_029FED: LDA.b #$70
#_029FEF: STA.w $0A6B
#_029FF2: LDA.b #$28
#_029FF4: STA.w $0A6D
#_029FF7: JSL routine02E6C9

.branch029FFB
#_029FFB: JSL BrightenScreen
#_029FFF: JSL routine0F84F6

#_02A003: SEP #$30
#_02A005: LDA.b #$44 ; SONG 44
#_02A007: JSL WriteAPU
#_02A00B: LDA.b #$07
#_02A00D: JSL InitializeTextBoxToSizeForNewMessage
#_02A011: JSL routine00A056
#_02A015: PLB
#_02A016: RTL

;===================================================================================================

routine02A017:
#_02A017: REP #$30
#_02A019: PHB
#_02A01A: PHK
#_02A01B: PLB
#_02A01C: JSR routine02A021
#_02A01F: BRA .branch029FFB

routine02A021:
#_02A021: REP #$30
#_02A023: JSL DarkenScreen
#_02A027: JSL Reset_OAMrelatedWRAM

#_02A02B: SEP #$20
#_02A02D: LDA.b #$00
#_02A02F: JSL ClearSomeBank7FBuffers
#_02A033: LDA.b #$00
#_02A035: JSL VRAM_From_7FXXXX
#_02A039: JSL AddSelfAsVectorAndMakeSpace

#_02A03D: SEP #$20
#_02A03F: LDA.b #$01
#_02A041: JSL ClearSomeBank7FBuffers
#_02A045: LDA.b #$01
#_02A047: JSL VRAM_From_7FXXXX
#_02A04B: JSL AddSelfAsVectorAndMakeSpace

#_02A04F: REP #$20
#_02A051: LDA.w #$3DC4
#_02A054: STA.w $0A1A
#_02A057: STA.w $0980
#_02A05A: STZ.w $0A33
#_02A05D: LDA.w #$00F8
#_02A060: STA.w $0F53
#_02A063: STZ.w $0F51
#_02A066: STZ.w $0F4F
#_02A069: STZ.w $0F4D
#_02A06C: LDA.w #$FFFF
#_02A06F: STA.w $0A99
#_02A072: STA.w $0A9A
#_02A075: STA.w $0A9B
#_02A078: STA.w $0A9C
#_02A07B: STZ.w $0A95
#_02A07E: STZ.w $0A96
#_02A081: STZ.w $0A97
#_02A084: STZ.w $0A98

#_02A087: SEP #$30
#_02A089: STZ.w $0F7F
#_02A08C: STZ.w $0F80
#_02A08F: LDA.b #$FF
#_02A091: STA.w $0EEF
#_02A094: LDA.b #$00
#_02A096: JSL routine02F609
#_02A09A: LDA.b #$00
#_02A09C: JSL routine02FC6E
#_02A0A0: JSL routine00A17E
#_02A0A4: LDA.b #$01
#_02A0A6: JSL routine02CBD1
#_02A0AA: LDA.b #$07
#_02A0AC: JSL routine02CBD1
#_02A0B0: LDA.b #$1F
#_02A0B2: STA.w $0F74
#_02A0B5: STA.w TM
#_02A0B8: LDA.b #$03
#_02A0BA: STA.w $0F76
#_02A0BD: STA.w TS
#_02A0C0: LDA.b #$50
#_02A0C2: STA.w CGADSUB
#_02A0C5: STA.w $0F7B
#_02A0C8: LDA.b #$43
#_02A0CA: STA.w BG12NBA
#_02A0CD: STA.w $0F4B
#_02A0D0: LDA.b #$3C
#_02A0D2: STA.w $0F49
#_02A0D5: STA.w BG3SC
#_02A0D8: RTS

;===================================================================================================

routine02A0D9:
#_02A0D9: PHP
#_02A0DA: REP #$30
#_02A0DC: LDA.w $0BED
#_02A0DF: STA.w $050A
#_02A0E2: LDA.w #$0008
#_02A0E5: JSL LoadDemonEverything
#_02A0E9: LDA.w $0BEF
#_02A0EC: STA.w $050A
#_02A0EF: LDA.w #$000A
#_02A0F2: JSL LoadDemonEverything
#_02A0F6: LDA.w $0A3B
#_02A0F9: AND.w #$0001
#_02A0FC: BEQ .branch02A10B

#_02A0FE: LDA.w $0BF1
#_02A101: STA.w $050A
#_02A104: LDA.w #$000C
#_02A107: JSL LoadDemonEverything

.branch02A10B
#_02A10B: PLP
#_02A10C: RTS

;===================================================================================================

routine02A10D:
#_02A10D: PHP
#_02A10E: SEP #$30
#_02A110: LDA.b #$02
#_02A112: STA.w $0F74
#_02A115: STA.w TM
#_02A118: LDA.b #$35 ; SFX 35
#_02A11A: JSL WriteAPUCareful

#_02A11E: REP #$30
#_02A120: LDA.w $0C0B
#_02A123: STA.w $050A
#_02A126: LDA.w #$000E
#_02A129: JSL LoadDemonEverything
#_02A12D: LDA.w #$00A0
#_02A130: LDX.w #$00AF
#_02A133: LDY.w #$0020
#_02A136: JSL routine0F85AF
#_02A13A: JSL AddSelfAsVectorAndMakeSpace

#_02A13E: SEP #$30
#_02A140: LDA.b #$12
#_02A142: STA.w $0F74
#_02A145: STA.w TM
#_02A148: LDY.b #$14
#_02A14A: JSL RunFramesYTimes
#_02A14E: LDY.b #$20

.branch02A150
#_02A150: PHY
#_02A151: LDA.b #$A0
#_02A153: LDX.b #$AF
#_02A155: JSL routine0F85AF
#_02A159: JSL AddSelfAsVectorAndMakeSpace
#_02A15D: PLY
#_02A15E: DEY
#_02A15F: BPL .branch02A150

#_02A161: PLP
#_02A162: RTS

;===================================================================================================

routine02A163:
#_02A163: PHP
#_02A164: REP #$30
#_02A166: LDA.w #$0000

.branch02A169
#_02A169: LDY.w #$0001
#_02A16C: JSR routine02A23E
#_02A16F: INC A
#_02A170: CMP.w #$000B
#_02A173: BNE .branch02A169

#_02A175: PLP
#_02A176: RTS

;===================================================================================================

routine02A177:
#_02A177: PHX
#_02A178: PHP
#_02A179: REP #$30
#_02A17B: LDA.w #$0009

.branch02A17E
#_02A17E: LDY.w #$0001
#_02A181: JSR routine02A23E
#_02A184: DEC A
#_02A185: BPL .branch02A17E

#_02A187: JSL AddSelfAsVectorAndMakeSpace
#_02A18B: PLP
#_02A18C: PLX
#_02A18D: RTS

;===================================================================================================

routine02A18E:
#_02A18E: PHX
#_02A18F: PHP
#_02A190: SEP #$30
#_02A192: STX.w $0E10
#_02A195: JSL Clearout_0AAB

#_02A199: SEP #$30
#_02A19B: STZ.w $0E12
#_02A19E: STZ.w $0E13
#_02A1A1: LDA.b #$0B
#_02A1A3: STA.w $0E11

.branch02A1A6
#_02A1A6: LDA.w $0E12
#_02A1A9: AND.b #$03
#_02A1AB: BNE .branch02A1D5

#_02A1AD: REP #$30
#_02A1AF: JSR routine02A267
#_02A1B2: LDA.w $0E11
#_02A1B5: AND.w #$00FF
#_02A1B8: PHA
#_02A1B9: LDA.w $0E10
#_02A1BC: AND.w #$00FF
#_02A1BF: TAX
#_02A1C0: PLA
#_02A1C1: JSR routine02A2E1

#_02A1C4: SEP #$30
#_02A1C6: INC.w $0E11
#_02A1C9: LDA.w $0E11
#_02A1CC: CMP.b #$0E
#_02A1CE: BNE .branch02A1D5

#_02A1D0: LDA.b #$0B
#_02A1D2: STA.w $0E11

.branch02A1D5
#_02A1D5: JSL AddSelfAsVectorAndMakeSpace
#_02A1D9: LDA.w $0E12
#_02A1DC: CMP.b #$20
#_02A1DE: BCS .branch02A1F6

#_02A1E0: LDX.w $0E10
#_02A1E3: LDA.w data02A23B,X
#_02A1E6: JSL routine02AC4B
#_02A1EA: LDX.w $0E10
#_02A1ED: LDA.w data02A23B,X
#_02A1F0: JSL routine02AC4B
#_02A1F4: BRA .branch02A224

.branch02A1F6
#_02A1F6: LDA.w $0E13
#_02A1F9: CMP.b #$21
#_02A1FB: BCS .branch02A224

#_02A1FD: CMP.b #$10
#_02A1FF: BCC .branch02A207

#_02A201: LDA.b #$20
#_02A203: SEC
#_02A204: SBC.w $0E13

.branch02A207
#_02A207: ASL A
#_02A208: PHA
#_02A209: TAY
#_02A20A: LDA.b #$30
#_02A20C: LDX.b #$36
#_02A20E: JSL routine0F85AF
#_02A212: JSL AddSelfAsVectorAndMakeSpace
#_02A216: PLY
#_02A217: LDA.b #$30
#_02A219: LDX.b #$36
#_02A21B: JSL routine0F85AF
#_02A21F: INC.w $0E13
#_02A222: BRA .branch02A228

.branch02A224
#_02A224: JSL AddSelfAsVectorAndMakeSpace

.branch02A228
#_02A228: INC.w $0E12
#_02A22B: LDA.w $0E12
#_02A22E: CMP.b #$48
#_02A230: BEQ .branch02A235

#_02A232: JMP .branch02A1A6

.branch02A235
#_02A235: JSR routine02A267
#_02A238: PLP
#_02A239: PLX
#_02A23A: RTS

data02A23B:
#_02A23B: db 2, 3, 1

routine02A23E:
#_02A23E: REP #$30
#_02A240: PHX
#_02A241: PHA
#_02A242: PHA
#_02A243: PHY
#_02A244: PHP
#_02A245: JSR routine02A2E1
#_02A248: PLP
#_02A249: PLY
#_02A24A: CPY.w #$0000
#_02A24D: BEQ .branch02A255

#_02A24F: PLY
#_02A250: LDA.w data02A61D,Y
#_02A253: BRA .branch02A259

.branch02A255
#_02A255: PLY
#_02A256: LDA.w data02A60F,Y

.branch02A259
#_02A259: AND.w #$00FF
#_02A25C: TAY
#_02A25D: JSL RunFramesYTimes
#_02A261: JSR routine02A267
#_02A264: PLA
#_02A265: PLX
#_02A266: RTS

;===================================================================================================

routine02A267:
#_02A267: PHP
#_02A268: REP #$30
#_02A26A: LDA.w #data02A6D7
#_02A26D: STA.w $00E0
#_02A270: LDA.w #$0002
#_02A273: STA.w $00E2
#_02A276: LDA.w #$7F72C2
#_02A279: STA.w $00E3
#_02A27C: LDA.w #$007F
#_02A27F: STA.w $00E5
#_02A282: LDX.w #$0008
#_02A285: LDY.w #$000E
#_02A288: JSL routine02A30A
#_02A28C: LDA.w #data02A6D7
#_02A28F: STA.w $00E0
#_02A292: LDA.w #$0002
#_02A295: STA.w $00E2
#_02A298: LDA.w #$7F72EC
#_02A29B: STA.w $00E3
#_02A29E: LDA.w #$007F
#_02A2A1: STA.w $00E5
#_02A2A4: LDX.w #$0088
#_02A2A7: LDY.w #$000E
#_02A2AA: JSL routine02A30A
#_02A2AE: LDA.w $0A3B
#_02A2B1: AND.w #$0001
#_02A2B4: BEQ .branch02A2D8

#_02A2B6: LDA.w #data02A7B7
#_02A2B9: STA.w $00E0
#_02A2BC: LDA.w #$0002
#_02A2BF: STA.w $00E2
#_02A2C2: LDA.w #$70D8
#_02A2C5: STA.w $00E3
#_02A2C8: LDA.w #$007F
#_02A2CB: STA.w $00E5
#_02A2CE: LDX.w #$0008
#_02A2D1: LDY.w #$000E
#_02A2D4: JSL routine02A30A

.branch02A2D8
#_02A2D8: LDA.w #$0000
#_02A2DB: JSL VRAM_From_7FXXXX
#_02A2DF: PLP
#_02A2E0: RTS

;===================================================================================================

routine02A2E1:
#_02A2E1: PHP
#_02A2E2: REP #$30
#_02A2E4: CMP.w #$0003
#_02A2E7: BCC .branch02A2F8

#_02A2E9: PHA
#_02A2EA: PHX
#_02A2EB: SEC
#_02A2EC: SBC.w #$0003
#_02A2EF: CLC
#_02A2F0: ADC.w #$000E
#_02A2F3: JSR routine02A304
#_02A2F6: PLX
#_02A2F7: PLA

.branch02A2F8
#_02A2F8: JSR routine02A304
#_02A2FB: LDA.w #$0000
#_02A2FE: JSL VRAM_From_7FXXXX
#_02A302: PLP
#_02A303: RTS

;===================================================================================================

routine02A304:
#_02A304: PHP
#_02A305: REP #$30
#_02A307: PHA
#_02A308: STZ.w $0E00
#_02A30B: CPX.w #$0002
#_02A30E: BEQ .branch02A370

#_02A310: CPX.w #$0001
#_02A313: BNE .branch02A31B

#_02A315: LDA.w #$0080
#_02A318: STA.w $0E00

.branch02A31B
#_02A31B: PLA
#_02A31C: ASL A
#_02A31D: TAY
#_02A31E: PHY
#_02A31F: LDA.w data02A5DD,Y
#_02A322: AND.w #$00FF
#_02A325: ASL A
#_02A326: ASL A
#_02A327: TAY
#_02A328: LDA.w data02A667,Y
#_02A32B: STA.w $00E0
#_02A32E: LDA.w #$0002
#_02A331: STA.w $00E2
#_02A334: LDA.w data02A669,Y
#_02A337: STA.w $0E02
#_02A33A: PLY
#_02A33B: LDA.w data02A5DE,Y
#_02A33E: AND.w #$00FF
#_02A341: ASL A
#_02A342: TAY
#_02A343: CPX.w #$0001
#_02A346: BNE .branch02A34D

#_02A348: LDA.w data02A63F,Y
#_02A34B: BRA .branch02A350

.branch02A34D
#_02A34D: LDA.w data02A62B,Y

.branch02A350
#_02A350: STA.w $00E3
#_02A353: LDA.w #$007F
#_02A356: STA.w $00E5

.branch02A359
#_02A359: LDA.w $0E02
#_02A35C: ORA.w $0E00
#_02A35F: AND.w #$00FF
#_02A362: TAX
#_02A363: LDA.w $0E03
#_02A366: AND.w #$00FF
#_02A369: TAY
#_02A36A: JSL routine02A30A
#_02A36E: PLP
#_02A36F: RTS

.branch02A370
#_02A370: PLA
#_02A371: ASL A
#_02A372: TAY
#_02A373: PHY
#_02A374: LDA.w data02A5DD,Y
#_02A377: AND.w #$00FF
#_02A37A: ASL A
#_02A37B: ASL A
#_02A37C: TAY
#_02A37D: LDA.w data02A69F,Y
#_02A380: STA.w $00E0
#_02A383: LDA.w data02A6A1,Y
#_02A386: STA.w $0E02
#_02A389: PLY
#_02A38A: LDA.w data02A5DE,Y
#_02A38D: AND.w #$00FF
#_02A390: ASL A
#_02A391: TAY
#_02A392: LDA.w data02A653,Y
#_02A395: STA.w $00E3
#_02A398: LDA.w #$007F
#_02A39B: STA.w $00E5
#_02A39E: BRA .branch02A359

routine02A30A:
#_02A3A0: PHP
#_02A3A1: PHB
#_02A3A2: PHK
#_02A3A3: PLB

#_02A3A4: REP #$30
#_02A3A6: TXA
#_02A3A7: BIT.w #$0080
#_02A3AA: BNE routine02A3E9

#_02A3AC: ASL A
#_02A3AD: STA.w $0E00
#_02A3B0: STY.w $0E02
#_02A3B3: STZ.w $0E04

.branch02A3B6
#_02A3B6: PHY
#_02A3B7: STZ.w $0E06

.branch02A3BA
#_02A3BA: LDY.w $0E04
#_02A3BD: LDA.b [$E0],Y
#_02A3BF: LDY.w $0E06
#_02A3C2: STA.b [$E3],Y
#_02A3C4: INC.w $0E04
#_02A3C7: INC.w $0E04
#_02A3CA: INC.w $0E06
#_02A3CD: INC.w $0E06
#_02A3D0: LDA.w $0E06
#_02A3D3: CMP.w $0E00
#_02A3D6: BNE .branch02A3BA

#_02A3D8: LDA.w $00E3
#_02A3DB: CLC
#_02A3DC: ADC.w #$0040
#_02A3DF: STA.w $00E3
#_02A3E2: PLY
#_02A3E3: DEY
#_02A3E4: BNE .branch02A3B6

#_02A3E6: PLB
#_02A3E7: PLP
#_02A3E8: RTL

;===================================================================================================

routine02A3E9:
#_02A3E9: TXA
#_02A3EA: AND.w #$007F
#_02A3ED: ASL A
#_02A3EE: STA.w $0E00
#_02A3F1: STY.w $0E02
#_02A3F4: STZ.w $0E04

.branch02A3F7
#_02A3F7: PHY
#_02A3F8: LDA.w $0E00
#_02A3FB: STA.w $0E06

.branch02A3FE
#_02A3FE: LDY.w $0E04
#_02A401: LDA.b [$E0],Y
#_02A403: AND.w #$BFFF
#_02A406: STA.w $0E08
#_02A409: LDA.b [$E0],Y
#_02A40B: EOR.w #$FFFF
#_02A40E: AND.w #$4000
#_02A411: ORA.w $0E08
#_02A414: LDY.w $0E06
#_02A417: STA.b [$E3],Y
#_02A419: INC.w $0E04
#_02A41C: INC.w $0E04
#_02A41F: DEC.w $0E06
#_02A422: DEC.w $0E06
#_02A425: LDA.w $0E06
#_02A428: BNE .branch02A3FE

#_02A42A: LDA.w $00E3
#_02A42D: CLC
#_02A42E: ADC.w #$0040
#_02A431: STA.w $00E3
#_02A434: PLY
#_02A435: DEY
#_02A436: BNE .branch02A3F7

#_02A438: PLB
#_02A439: PLP
#_02A43A: RTL

;===================================================================================================

routine02A43B:
#_02A43B: PHP
#_02A43C: SEP #$20
#_02A43E: LDA.b #$A1
#_02A440: STA.w NMITIMEN
#_02A443: STA.w $0F00
#_02A446: LDA.b #$00
#_02A448: STA.w INIDISP
#_02A44B: STA.w $0F43
#_02A44E: PLP
#_02A44F: RTL

;===================================================================================================

routine02A450:
#_02A450: PHP
#_02A451: SEP #$20
#_02A453: LDA.b #$01
#_02A455: STA.w NMITIMEN
#_02A458: STA.w $0F00
#_02A45B: LDA.b #$80
#_02A45D: STA.w INIDISP
#_02A460: STA.w $0F43
#_02A463: PLP
#_02A464: RTL

;===================================================================================================

routine02A465:
#_02A465: PHP
#_02A466: REP #$30
#_02A468: LDA.w #$0002
#_02A46B: STA.w $0E10
#_02A46E: LDA.w #$0001
#_02A471: STA.w $0E12

.branch02A474
#_02A474: STZ.w $0E14

.branch02A477
#_02A477: LDA.w $0E14
#_02A47A: CMP.w #$0020
#_02A47D: BCC .branch02A486

#_02A47F: LDA.w #$0040
#_02A482: SEC
#_02A483: SBC.w $0E14

.branch02A486
#_02A486: TAY
#_02A487: LDA.w #$0030
#_02A48A: LDX.w #$0036
#_02A48D: JSL routine0F85AF
#_02A491: LDY.w $0E10
#_02A494: JSL RunFramesYTimes
#_02A498: LDA.w $0E14
#_02A49B: CLC
#_02A49C: ADC.w $0E12
#_02A49F: STA.w $0E14
#_02A4A2: CMP.w #$0040
#_02A4A5: BCC .branch02A477

#_02A4A7: DEC.w $0E10
#_02A4AA: LDA.w $0E10
#_02A4AD: BNE .branch02A4B5

#_02A4AF: INC.w $0E10
#_02A4B2: INC.w $0E12

.branch02A4B5
#_02A4B5: LDA.w $0E12
#_02A4B8: CMP.w #$0010
#_02A4BB: BCC .branch02A474

#_02A4BD: STZ.w $0E12

.branch02A4C0
#_02A4C0: LDA.w $0E12
#_02A4C3: LSR A
#_02A4C4: TAY
#_02A4C5: LDA.w #$0030
#_02A4C8: LDX.w #$0036
#_02A4CB: JSL routine0F85AF
#_02A4CF: JSL AddSelfAsVectorAndMakeSpace
#_02A4D3: LDY.w #$0020
#_02A4D6: LDA.w #$0030
#_02A4D9: LDX.w #$0036
#_02A4DC: JSL routine0F85AF
#_02A4E0: JSL AddSelfAsVectorAndMakeSpace
#_02A4E4: INC.w $0E12
#_02A4E7: LDA.w $0E12
#_02A4EA: CMP.w #$003C
#_02A4ED: BNE .branch02A4C0

#_02A4EF: LDY.w #$0020
#_02A4F2: LDA.w #$0030
#_02A4F5: LDX.w #$0036
#_02A4F8: JSL routine0F85AF
#_02A4FC: LDY.w #$001E
#_02A4FF: JSL RunFramesYTimes
#_02A503: LDY.w #$001F

.branch02A506
#_02A506: PHY
#_02A507: LDA.w #$0030
#_02A50A: LDX.w #$0036
#_02A50D: JSL routine0F85AF
#_02A511: JSL AddSelfAsVectorAndMakeSpace
#_02A515: JSL AddSelfAsVectorAndMakeSpace
#_02A519: PLY
#_02A51A: DEY
#_02A51B: BPL .branch02A506

#_02A51D: PLP
#_02A51E: RTS

;===================================================================================================

routine02A51F:
#_02A51F: PHP
#_02A520: JSL Reset_OAMrelatedWRAM

#_02A524: SEP #$30
#_02A526: LDA.b #$34 ; SFX 34
#_02A528: JSL WriteAPUCareful
#_02A52C: LDA.b #$2E
#_02A52E: JSL routine02F609
#_02A532: LDA.b #$28
#_02A534: JSL routine02FC6E

#_02A538: REP #$30
#_02A53A: LDA.w #$0026
#_02A53D: STA.w $0000
#_02A540: STA.w $0010
#_02A543: INC A
#_02A544: STA.w $0020
#_02A547: STA.w $0030
#_02A54A: LDA.w #$0050
#_02A54D: STA.w $1A60
#_02A550: STA.w $1A80
#_02A553: LDA.w #$0080
#_02A556: STA.w $1A70
#_02A559: STA.w $1A90
#_02A55C: LDA.w #$0087
#_02A55F: STA.w $1AA0
#_02A562: STA.w $1AB0
#_02A565: LDA.w #$0000
#_02A568: STA.w $1AC0
#_02A56B: STA.w $1AD0

#_02A56E: SEP #$20
#_02A570: LDA.b #$80
#_02A572: STA.w $1A00
#_02A575: STA.w $1A10
#_02A578: LDA.b #$90
#_02A57A: STA.w $1A08
#_02A57D: STA.w $1A18
#_02A580: LDY.w #$0050
#_02A583: JSL RunFramesYTimes
#_02A587: JSL Reset_OAMrelatedWRAM
#_02A58B: PLP
#_02A58C: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine02A58D:
#_02A58D: PHP
#_02A58E: PHB
#_02A58F: PHK
#_02A590: PLB

#_02A591: SEP #$30
#_02A593: STA.w $0E10
#_02A596: STX.w $0E11
#_02A599: STY.w $0E12
#_02A59C: LDY.b #$00

.branch02A59E
#_02A59E: LDA.w $0E10
#_02A5A1: LDX.w $0E11
#_02A5A4: PHY
#_02A5A5: JSL routine0F85AF
#_02A5A9: JSL AddSelfAsVectorAndMakeSpace
#_02A5AD: PLY
#_02A5AE: INY
#_02A5AF: CPY.b #$20
#_02A5B1: BNE .branch02A59E

#_02A5B3: PLB
#_02A5B4: PLP
#_02A5B5: RTL

; TODO POSSIBLY UNUSED ROUTINE
routine02A5B6:
#_02A5B6: PHP
#_02A5B7: PHB
#_02A5B8: PHK
#_02A5B9: PLB

#_02A5BA: SEP #$30
#_02A5BC: STA.w $0E10
#_02A5BF: STX.w $0E11
#_02A5C2: STY.w $0E12
#_02A5C5: LDY.b #$1F

.branch02A5C7
#_02A5C7: LDA.w $0E10
#_02A5CA: LDX.w $0E11
#_02A5CD: PHY
#_02A5CE: JSL routine0F85AF
#_02A5D2: JSL AddSelfAsVectorAndMakeSpace
#_02A5D6: PLY
#_02A5D7: DEY
#_02A5D8: BPL .branch02A5C7

#_02A5DA: PLB
#_02A5DB: PLP
#_02A5DC: RTL

data02A5DD:
#_02A5DD: dw $0800,$0801,$0802,$0705
#_02A5E5: dw $0604,$0503,$0405,$0304
#_02A5ED: dw $0203,$0105,$0004,$0003
#_02A5F5: dw $0005,$0004,$0906,$0807
#_02A5FD: dw $0708,$0609,$050A,$040B
#_02A605: dw $030C,$020D,$020D,$020D
#_02A60D: dw $020

data02A60F:
#_02A60F: dw $0A0A,$0909,$0909
#_02A615: dw $0909,$0A09,$090B,$0909

data02A61D:
#_02A61D: dw $0707,$0707,$0707,$0707
#_02A625: dw $0707,$0707,$0707

data02A62B:
#_02A62B: dw $7342,$7382,$73C2,$7402
#_02A633: dw $7442,$7482,$74C2,$7502
#_02A63B: dw $7542,$7582

data02A63F:
#_02A63F: dw $736C,$73AC,$73EC,$742C
#_02A647: dw $746C,$74AC,$74EC,$752C
#_02A64F: dw $756C,$75AC

data02A653:
#_02A653: dw $7158,$7198,$71D8,$7218
#_02A65B: dw $7258,$7298,$72D8,$7318
#_02A663: dw $7358,$7398

data02A667:
#_02A667: dw $A9D7

data02A669:
#_02A669: dw $0408,$AA17,$0408,$AA57
#_02A671: dw $0408,$AA97,$0208,$AAB7
#_02A679: dw $0208,$AAD7,$0208,$A907
#_02A681: dw $0308,$A8F7,$0408,$A8E7
#_02A689: dw $0508,$A8D7,$0608,$A8C7
#_02A691: dw $0708,$A8B7,$0808,$A8A7
#_02A699: dw $0908,$A897,$0A08

data02A69F:
#_02A69F: dw $AAF7

data02A6A1:
#_02A6A1: dw $0408,$AB37,$0408,$AB77
#_02A6A9: dw $0408,$ABB7,$0208,$ABD7
#_02A6B1: dw $0208,$ABF7,$0208,$A9A7
#_02A6B9: dw $0308,$A997,$0408,$A987
#_02A6C1: dw $0508,$A977,$0608,$A967
#_02A6C9: dw $0708,$A957,$0808,$A947

; TODO label data02A6D7
#_02A6D1: dw $0908,$A937,$0A08,$2A00
#_02A6D9: dw $2C00,$2C00,$2C00,$2C00
#_02A6E1: dw $2C00,$2C00,$2A01,$2A02
#_02A6E9: dw $2A03,$2A04,$2A05,$2A05
#_02A6F1: dw $2A06,$2A07,$2A08,$2A09
#_02A6F9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A701: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A709: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A711: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A719: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A721: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A729: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A731: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A739: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A741: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A749: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A751: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A759: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A761: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A769: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A771: dw $2A0A,$2A0B,$2A0C,$2A09
#_02A779: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A781: dw $2A0A,$2A0B,$2A0C,$2A0D
#_02A789: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A791: dw $2A0A,$2A0B,$2A0E,$2A0F
#_02A799: dw $2A0A,$2A10,$2A11,$2A0A
#_02A7A1: dw $2A0A,$2A12,$2A13,$2A14
#_02A7A9: dw $2A15,$2A16,$2A17,$2A18
#_02A7B1: dw $2A19,$2A1A,$2A1B

;===================================================================================================

data02A7B7:
#_02A7B7: dw $2A1C
#_02A7B9: dw $2C00,$2C00,$2C00,$2C00
#_02A7C1: dw $2C00,$2C00,$4A1C,$2A1D
#_02A7C9: dw $2A1E,$2A1F,$2A20,$4A20
#_02A7D1: dw $4A1F,$4A1E,$4A1D,$2A21
#_02A7D9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A7E1: dw $2A0A,$2A0A,$4A21,$2A21
#_02A7E9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A7F1: dw $2A0A,$2A0A,$4A21,$2A21
#_02A7F9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A801: dw $2A0A,$2A0A,$4A21,$2A21
#_02A809: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A811: dw $2A0A,$2A0A,$4A21,$2A21
#_02A819: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A821: dw $2A0A,$2A0A,$4A21,$2A21
#_02A829: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A831: dw $2A0A,$2A0A,$4A21,$2A21
#_02A839: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A841: dw $2A0A,$2A0A,$4A21,$2A21
#_02A849: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A851: dw $2A0A,$2A0A,$4A21,$2A21
#_02A859: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A861: dw $2A0A,$2A0A,$4A21,$2A22
#_02A869: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A871: dw $2A0A,$2A0A,$4A22,$2A23
#_02A879: dw $2A24,$2A0A,$2A25,$4A25
#_02A881: dw $2A0A,$4A24,$4A23,$2A26
#_02A889: dw $2A27,$2A28,$2A29,$4A29
#_02A891: dw $4A28,$4A27,$4A26,$2A2A
#_02A899: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8A1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8A9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8B1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8B9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8C1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8C9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8D1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8D9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8E1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8E9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A8F1: dw $2A2B,$2A2C,$2A2D,$2A2A
#_02A8F9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A901: dw $2A2B,$2A2C,$2A2D,$2A2E
#_02A909: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A911: dw $2A2B,$2A2C,$2A2F,$2A30
#_02A919: dw $2A2B,$2A31,$2A32,$2A2B
#_02A921: dw $2A2B,$2A33,$2A34,$2A35
#_02A929: dw $2A36,$2A37,$2A38,$2A39
#_02A931: dw $2A3A,$2A3B,$2A3C,$2A3D
#_02A939: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A941: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A949: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A951: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A959: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A961: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A969: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A971: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A979: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A981: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A989: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A991: dw $2A2B,$2A2B,$4A3D,$2A3D
#_02A999: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A9A1: dw $2A2B,$2A2B,$4A3D,$2A3E
#_02A9A9: dw $2A2B,$2A2B,$2A2B,$2A2B
#_02A9B1: dw $2A2B,$2A2B,$4A3E,$2A3F
#_02A9B9: dw $2A40,$2A2B,$2A41,$4A41
#_02A9C1: dw $2A2B,$4A40,$4A3F,$2A42
#_02A9C9: dw $2A43,$2A44,$2A45,$4A45
#_02A9D1: dw $2A44,$4A43,$4A42,$2A09
#_02A9D9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02A9E1: dw $2A0A,$2A0B,$2A0C,$2A0D
#_02A9E9: dw $2A0A,$2A46,$2A47,$2A48
#_02A9F1: dw $2A49,$2A0B,$2A0E,$2A0F
#_02A9F9: dw $2A4A,$2A4B,$2A4C,$2A4D
#_02AA01: dw $2A4E,$2A12,$2A13,$2A14
#_02AA09: dw $2A15,$2A16,$2A17,$2A4F
#_02AA11: dw $2A19,$2A1A,$2A1B,$2A09
#_02AA19: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02AA21: dw $2A0A,$2A0B,$2A0C,$2A50
#_02AA29: dw $2A51,$2A52,$2A53,$2A54
#_02AA31: dw $2A55,$2A56,$2A57,$2A58
#_02AA39: dw $2A59,$2A5A,$2A5B,$2A5C
#_02AA41: dw $2A5D,$2A5E,$2A5F,$2A14
#_02AA49: dw $2A60,$2A16,$2A61,$2A62
#_02AA51: dw $2A63,$2A1A,$2A1B,$2A09
#_02AA59: dw $2A64,$2A65,$2A66,$2A67
#_02AA61: dw $2A68,$2A69,$2A0C,$2A6A
#_02AA69: dw $2A6B,$2A6C,$2A6D,$2A6E
#_02AA71: dw $2A6F,$2A70,$2A71,$2A72
#_02AA79: dw $2A73,$2A74,$2A75,$2A76
#_02AA81: dw $2A77,$2A78,$2A79,$2A14
#_02AA89: dw $2A7A,$2A7B,$2A7C,$2A7D
#_02AA91: dw $2A63,$2A1A,$2A1B,$2AA2
#_02AA99: dw $2AA3,$2AA4,$2AA5,$2AA6
#_02AAA1: dw $2AA7,$2AA8,$2AA9,$2AAA
#_02AAA9: dw $2AAB,$2AAC,$2AAD,$2AAE
#_02AAB1: dw $2AAF,$2AB0,$2AB1,$2AB2
#_02AAB9: dw $2AB3,$2AB4,$2AB5,$2AB6
#_02AAC1: dw $2AB7,$2AB8,$2AB9,$2ABA
#_02AAC9: dw $2ABB,$2ABC,$2ABD,$2ABE
#_02AAD1: dw $2ABF,$2AC0,$2AC1,$2AC2
#_02AAD9: dw $2AC3,$2AC4,$2AC5,$2AC6
#_02AAE1: dw $2AC7,$2AC8,$2AC9,$2ACA
#_02AAE9: dw $2ACB,$2ACC,$2ACD,$2ACE
#_02AAF1: dw $2ACF,$2AD0,$2AD1,$2A21
#_02AAF9: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02AB01: dw $2A0A,$2A0A,$4A21,$2A22
#_02AB09: dw $2A0A,$2A0A,$2A0A,$2A7E
#_02AB11: dw $2A0A,$2A0A,$4A22,$2A23
#_02AB19: dw $2A24,$2A7F,$2A80,$2A81
#_02AB21: dw $2A82,$4A24,$4A23,$2A26
#_02AB29: dw $2A27,$2A28,$2A29,$4A29
#_02AB31: dw $4A28,$4A27,$4A26,$2A21
#_02AB39: dw $2A0A,$2A0A,$2A0A,$2A0A
#_02AB41: dw $2A0A,$2A0A,$4A21,$2A22
#_02AB49: dw $2A83,$2A84,$2A85,$2A86
#_02AB51: dw $2A87,$2A88,$4A22,$2A23
#_02AB59: dw $2A89,$2A8A,$2A8B,$2A8C
#_02AB61: dw $2A8D,$2A8E,$4A23,$2A26
#_02AB69: dw $2A27,$2A28,$2A29,$4A29
#_02AB71: dw $4A28,$4A27,$4A26,$2A21
#_02AB79: dw $2A0A,$2A0A,$2A8F,$2A90
#_02AB81: dw $2A0A,$2A91,$4A21,$2A92
#_02AB89: dw $2A93,$2A94,$2A95,$2A96
#_02AB91: dw $2A97,$2A98,$2A99,$2A9A
#_02AB99: dw $2A9B,$2A9C,$2A9D,$2A9E
#_02ABA1: dw $2A9F,$2AA0,$2AA1,$2A26
#_02ABA9: dw $2A27,$2A28,$2A29,$4A29
#_02ABB1: dw $4A28,$4A27,$4A26,$2AD2
#_02ABB9: dw $2AA3,$2AA4,$2AA5,$2AA6
#_02ABC1: dw $2AA7,$2AD3,$2AD4,$2AD5
#_02ABC9: dw $2AAB,$2AAC,$2AAD,$2AAE
#_02ABD1: dw $2AAF,$2AD6,$2AD7,$2AD8
#_02ABD9: dw $2AB3,$2AB4,$2AB5,$2AB6
#_02ABE1: dw $2AB7,$2AD9,$2ADA,$2ADB
#_02ABE9: dw $2ABB,$2ABC,$2ABD,$2ABE
#_02ABF1: dw $2ABF,$2ADC,$2ADD,$2ADE
#_02ABF9: dw $2AC3,$2AC4,$2AC5,$2AC6
#_02AC01: dw $2AC7,$2ADF,$2AE0,$2AE1
#_02AC09: dw $2ACB,$2ACC,$2ACD,$2ACE
#_02AC11: dw $2ACF,$2AE2,$2AE3

; TODO POSSIBLY UNUSED ROUTINE
routine02AC17:
#_02AC17: PHP
#_02AC18: REP #$30
#_02AC1A: STA.w $0E00
#_02AC1D: PHB
#_02AC1E: PHK
#_02AC1F: PLB
#_02AC20: JSL Clearout_0AAB
#_02AC24: LDX.w #$003F
#_02AC27: LDA.w $0E00

.branch02AC2A
#_02AC2A: PHX
#_02AC2B: PHA
#_02AC2C: JSL routine02AC4B
#_02AC30: JSL AddSelfAsVectorAndMakeSpace
#_02AC34: PLA
#_02AC35: PLX
#_02AC36: DEX
#_02AC37: BPL .branch02AC2A

#_02AC39: PLB
#_02AC3A: PLP
#_02AC3B: RTL

Clearout_0AAB:
#_02AC3C: PHP
#_02AC3D: SEP #$30
#_02AC3F: LDX.b #$07
#_02AC41: LDA.b #$FF

.loop
#_02AC43: STA.w $0AAB,X
#_02AC46: DEX
#_02AC47: BPL .loop

#_02AC49: PLP
#_02AC4A: RTL

; TODO some sort of math
routine02AC4B:
#_02AC4B: PHP
#_02AC4C: REP #$30
#_02AC4E: STA.w $0E00
#_02AC51: PHB
#_02AC52: PHK
#_02AC53: PLB
#_02AC54: LDA.w $0E00
#_02AC57: XBA
#_02AC58: ASL A
#_02AC59: ASL A
#_02AC5A: ASL A
#_02AC5B: ASL A
#_02AC5C: AND.w #$F000
#_02AC5F: STA.w $0E02

.branch02AC62
#_02AC62: REP #$30
#_02AC64: JSL GetRandomInt
#_02AC68: LDA.w $0ED5
#_02AC6B: AND.w #$0077
#_02AC6E: STA.w $0E04
#_02AC71: AND.w #$0007
#_02AC74: TAY
#_02AC75: LDA.w $0AAB,Y
#_02AC78: STA.w $0E06
#_02AC7B: LDA.w $0E04
#_02AC7E: LSR A
#_02AC7F: LSR A
#_02AC80: LSR A
#_02AC81: LSR A
#_02AC82: AND.w #$0007
#_02AC85: TAX

#_02AC86: SEP #$20
#_02AC88: LDA.w data02AD05,X
#_02AC8B: AND.w $0E06
#_02AC8E: BEQ .branch02AC62

#_02AC90: SEP #$20
#_02AC92: LDA.w data02ACFD,X
#_02AC95: AND.w $0E06
#_02AC98: STA.w $0AAB,Y

#_02AC9B: REP #$20
#_02AC9D: LDA.w data02ACFD,X
#_02ACA0: STA.w $0E06
#_02ACA3: LDA.w $0E04
#_02ACA6: AND.w #$0007
#_02ACA9: ASL A
#_02ACAA: CLC
#_02ACAB: ADC.w $0E02
#_02ACAE: TAX
#_02ACAF: LDA.w #$007F

.branch02ACB2
#_02ACB2: PHA
#_02ACB3: PHP
#_02ACB4: SEP #$20
#_02ACB6: LDA.l $7F0000,X
#_02ACBA: AND.w $0E06
#_02ACBD: STA.l $7F0000,X
#_02ACC1: LDA.l $7F0001,X
#_02ACC5: AND.w $0E06
#_02ACC8: STA.l $7F0001,X
#_02ACCC: LDA.l $7F0010,X
#_02ACD0: AND.w $0E06
#_02ACD3: STA.l $7F0010,X
#_02ACD7: LDA.l $7F0011,X
#_02ACDB: AND.w $0E06
#_02ACDE: STA.l $7F0011,X

#_02ACE2: REP #$20
#_02ACE4: TXA
#_02ACE5: CLC
#_02ACE6: ADC.w #$0020
#_02ACE9: TAX
#_02ACEA: PLP
#_02ACEB: PLA
#_02ACEC: DEC A
#_02ACED: BPL .branch02ACB2

#_02ACEF: LDA.w $0E00
#_02ACF2: CLC
#_02ACF3: ADC.w #$0009
#_02ACF6: JSL VRAM_From_7FXXXX
#_02ACFA: PLB
#_02ACFB: PLP
#_02ACFC: RTL

; TODO powers of 2 for some reason...
data02ACFD:
#_02ACFD: db -2, -3, -5, -9, -17, -33, -66, 127

data02AD05:
#_02AD05: db 1, 2, 4, 8, 16, 32, 64, -128

routine02AD0D:
#_02AD0D: SEP #$20
#_02AD0F: STA.w $0B79
#_02AD12: STZ.w $0B7A
#_02AD15: STZ.w $09F2
#_02AD18: STZ.w $09F3
#_02AD1B: LDA.b #$47
#_02AD1D: JSL routine02FC6E

#_02AD21: REP #$30
#_02AD23: LDA.w #$00FF
#_02AD26: STA.w $0C39
#_02AD29: STA.w $0C3B
#_02AD2C: STA.w $0C3D
#_02AD2F: LDX.w #$0016
#_02AD32: LDA.w #$0000

.branch02AD35
#_02AD35: STA.w $0B61,X
#_02AD38: DEX
#_02AD39: DEX
#_02AD3A: BPL .branch02AD35

#_02AD3C: LDX.w #$0000
#_02AD3F: TXY

.branch02AD40
#_02AD40: PHX
#_02AD41: LDA.w $0780,X
#_02AD44: BIT.w #$FF00
#_02AD47: BEQ .branch02AD6A

#_02AD49: AND.w #$00FF
#_02AD4C: CMP.w #$00E4
#_02AD4F: BCC .branch02AD6A

#_02AD51: CMP.w #$00F0
#_02AD54: BCS .branch02AD6A

#_02AD56: SEC
#_02AD57: SBC.w #$00E4
#_02AD5A: ASL A
#_02AD5B: TAY
#_02AD5C: LDA.w $0781,X
#_02AD5F: AND.w #$00FF
#_02AD62: TYX
#_02AD63: CLC
#_02AD64: ADC.w $0B61,X
#_02AD67: STA.w $0B61,X

.branch02AD6A
#_02AD6A: PLX
#_02AD6B: INX
#_02AD6C: INX
#_02AD6D: CPX.w #$0040
#_02AD70: BNE .branch02AD40

.branch02AD72
#_02AD72: REP #$30
#_02AD74: LDA.w $0A1A
#_02AD77: CLC
#_02AD78: ADC.w #$0041
#_02AD7B: STA.w $0980
#_02AD7E: LDX.w #$0000

.branch02AD81
#_02AD81: PHX
#_02AD82: PHX
#_02AD83: PHX
#_02AD84: PHX
#_02AD85: JSL ClearTextBuffer_long
#_02AD89: STZ.w $0A33
#_02AD8C: TXA
#_02AD8D: LSR A
#_02AD8E: CLC
#_02AD8F: ADC.w #$00E4
#_02AD92: STA.w $0A50
#_02AD95: JSR routine02AE93
#_02AD98: JSL TextCommand_WriteItemName_long
#_02AD9C: LDA.w #$000E
#_02AD9F: STA.w $0A33
#_02ADA2: LDA.w #$0022
#_02ADA5: JSL WriteNextMessageChar
#_02ADA9: PLX
#_02ADAA: LDA.w $0B61,X
#_02ADAD: STA.w $0E10
#_02ADB0: STZ.w $0E12
#_02ADB3: LDX.w #$0008
#_02ADB6: LDY.w #$0002
#_02ADB9: JSL routine03D775
#_02ADBD: LDA.w #$00CF
#_02ADC0: JSL WriteNextMessageChar
#_02ADC4: PLX
#_02ADC5: TXA
#_02ADC6: LSR A
#_02ADC7: CLC
#_02ADC8: ADC.w #$00E5
#_02ADCB: STA.w $0A50
#_02ADCE: INX
#_02ADCF: INX
#_02ADD0: JSR routine02AE93
#_02ADD3: JSL TextCommand_WriteItemName_long
#_02ADD7: LDA.w #$0026
#_02ADDA: STA.w $0A33
#_02ADDD: LDA.w #$0022
#_02ADE0: JSL WriteNextMessageChar
#_02ADE4: PLX
#_02ADE5: LDA.w $0B63,X
#_02ADE8: STA.w $0E10
#_02ADEB: STZ.w $0E12
#_02ADEE: LDX.w #$0014
#_02ADF1: LDY.w #$0002
#_02ADF4: JSL routine03D775
#_02ADF8: JSL routine0384F9_long
#_02ADFC: JSL RunFramesUntil0100IsFlagged
#_02AE00: LDA.w $0980
#_02AE03: CLC
#_02AE04: ADC.w #$0040
#_02AE07: STA.w $0980
#_02AE0A: PLX
#_02AE0B: INX
#_02AE0C: INX
#_02AE0D: INX
#_02AE0E: INX
#_02AE0F: CPX.w #$0018
#_02AE12: BEQ .branch02AE17

#_02AE14: JMP .branch02AD81

.branch02AE17
#_02AE17: SEP #$20
#_02AE19: LDA.b #$01
#_02AE1B: STA.w $09F0
#_02AE1E: LDA.b #$05
#_02AE20: STA.w $09F1
#_02AE23: STA.w $09FB
#_02AE26: STA.w $09FC
#_02AE29: LDA.b #$0F
#_02AE2B: STA.w $09F4
#_02AE2E: JSL routine02C8E9

#_02AE32: SEP #$20
#_02AE34: LDA.w $0A58
#_02AE37: BMI .branch02AE86

#_02AE39: LDA.w $0B7A
#_02AE3C: ASL A
#_02AE3D: TAX
#_02AE3E: LDA.w $09F3
#_02AE41: ASL A
#_02AE42: CLC
#_02AE43: ADC.w $09F2
#_02AE46: STA.w $0E00
#_02AE49: ASL A
#_02AE4A: TAY

#_02AE4B: REP #$20
#_02AE4D: LDA.w $0B61,Y
#_02AE50: BNE .branch02AE55

#_02AE52: JMP .branch02AD72

.branch02AE55
#_02AE55: SEP #$20
#_02AE57: LDA.w $0E00
#_02AE5A: CLC
#_02AE5B: ADC.b #$E4
#_02AE5D: CMP.w $0C39
#_02AE60: BNE .branch02AE65

#_02AE62: JMP .branch02AD72

.branch02AE65
#_02AE65: CMP.w $0C3B
#_02AE68: BNE .branch02AE6D

#_02AE6A: JMP .branch02AD72

.branch02AE6D
#_02AE6D: CMP.w $0C3D
#_02AE70: BNE .branch02AE75

#_02AE72: JMP .branch02AD72

.branch02AE75
#_02AE75: STA.w $0C39,X
#_02AE78: INC.w $0B7A
#_02AE7B: LDA.w $0B7A
#_02AE7E: CMP.w $0B79
#_02AE81: BEQ .branch02AE86

#_02AE83: JMP .branch02AD72

.branch02AE86
#_02AE86: LDA.b #$20
#_02AE88: STA.w $0A2C
#_02AE8B: STZ.w $0A33
#_02AE8E: JSL ClearTextBuffer_long
#_02AE92: RTL

;===================================================================================================

routine02AE93:
#_02AE93: PHP
#_02AE94: REP #$30
#_02AE96: STA.w $0E00
#_02AE99: CMP.w $0C39
#_02AE9C: BEQ .branch02AEB6

#_02AE9E: CMP.w $0C3B
#_02AEA1: BEQ .branch02AEB6

#_02AEA3: CMP.w $0C3D
#_02AEA6: BEQ .branch02AEB6

#_02AEA8: LDA.w $0B61,X
#_02AEAB: BEQ .branch02AEBF

#_02AEAD: SEP #$20
#_02AEAF: LDA.b #$20
#_02AEB1: STA.w $0A2C
#_02AEB4: PLP
#_02AEB5: RTS

.branch02AEB6
#_02AEB6: SEP #$20
#_02AEB8: LDA.b #$30
#_02AEBA: STA.w $0A2C
#_02AEBD: PLP
#_02AEBE: RTS

.branch02AEBF
#_02AEBF: SEP #$20
#_02AEC1: LDA.b #$28
#_02AEC3: STA.w $0A2C
#_02AEC6: PLP
#_02AEC7: RTS

;===================================================================================================
; TODO more analysis
;===================================================================================================
OverworldMovement_GetIndexFromCoords:
#_02AEC8: PHP
#_02AEC9: REP #$20

#_02AECB: LDA.w $07F6 ; get Y coordinate
#_02AECE: AND.w #$00F8 ; 2*(Y%8)
#_02AED1: ASL A
#_02AED2: STA.w $0E00

#_02AED5: LDA.w $07F5
#_02AED8: AND.w #$00FF
#_02AEDB: LSR A
#_02AEDC: LSR A
#_02AEDD: LSR A
#_02AEDE: CLC
#_02AEDF: ADC.w $0E00
#_02AEE2: STA.w $0B2E

#_02AEE5: LDA.w $0B2B
#_02AEE8: AND.w #$00FF
#_02AEEB: BNE .branch02AEF7

#_02AEED: LDA.w $0B2E ; minus 256 for some reason?
#_02AEF0: SEC
#_02AEF1: SBC.w #$0100
#_02AEF4: STA.w $0B2E

.branch02AEF7
#_02AEF7: PLP
#_02AEF8: RTS

;===================================================================================================
; TODO
;===================================================================================================
routine02AEF9:
#_02AEF9: PHP
#_02AEFA: REP #$30

#_02AEFC: JSR OverworldMovement_GetIndexFromCoords

#_02AEFF: LDA.w $0B2B
#_02AF02: AND.w #$00FF
#_02AF05: BEQ .branch02AF16

#_02AF07: CMP.w #$0003
#_02AF0A: BNE .branch02AF20

#_02AF0C: LDA.w $0B2E
#_02AF0F: LSR A
#_02AF10: TAX
#_02AF11: LDA.w data02B4C7,X
#_02AF14: BRA .branch02AF28

.branch02AF16
#_02AF16: LDA.w $0B2E
#_02AF19: LSR A
#_02AF1A: TAX
#_02AF1B: LDA.w data02B417,X
#_02AF1E: BRA .branch02AF28

.branch02AF20
#_02AF20: LDA.w $0B2E
#_02AF23: LSR A
#_02AF24: TAX
#_02AF25: LDA.w data02B447,X

.branch02AF28
#_02AF28: STA.w $0B30
#_02AF2B: LDA.w $0B2E
#_02AF2E: AND.w #$0001
#_02AF31: BNE .branch02AF3F

#_02AF33: LSR.w $0B30
#_02AF36: LSR.w $0B30
#_02AF39: LSR.w $0B30
#_02AF3C: LSR.w $0B30

.branch02AF3F
#_02AF3F: LDA.w $0B30
#_02AF42: AND.w #$000F
#_02AF45: ASL A
#_02AF46: TAX
#_02AF47: LDA.w data02B3F7,X
#_02AF4A: STA.w $0B30
#_02AF4D: STA.w $0453
#_02AF50: CLC
#_02AF51: ADC.w $0B32
#_02AF54: STA.w $0B32
#_02AF57: STA.w $045B
#_02AF5A: CMP.w #$03E8
#_02AF5D: BCC .branch02AF68

#_02AF5F: LDA.w #$03E7
#_02AF62: STA.w $0B32
#_02AF65: STA.w $045B

.branch02AF68
#_02AF68: PLP
#_02AF69: RTS

;===================================================================================================

routine02AF6A:
#_02AF6A: REP #$30
#_02AF6C: LDA.w $0C60
#_02AF6F: CMP.w #$00FF
#_02AF72: BEQ .branch02AF75
#_02AF74: RTS

.branch02AF75
#_02AF75: JSR OverworldMovement_GetIndexFromCoords
#_02AF78: LDA.w $0B2B
#_02AF7B: AND.w #$00FF
#_02AF7E: BNE .branch02AF8A

#_02AF80: LDA.w $0B2E
#_02AF83: CLC
#_02AF84: ADC.w #$0100
#_02AF87: TAX
#_02AF88: BRA .branch02AF8D

.branch02AF8A
#_02AF8A: LDX.w $0B2E

.branch02AF8D
#_02AF8D: SEP #$20
#_02AF8F: LDA.w LocationToAreaName,X
#_02AF92: CMP.w $0B35
#_02AF95: BEQ .branch02AFD2

#_02AF97: STA.w $0B35

#_02AF9A: REP #$20
#_02AF9C: AND.w #$00FF
#_02AF9F: ASL A
#_02AFA0: ASL A
#_02AFA1: STA.w $0E00
#_02AFA4: ASL A
#_02AFA5: CLC
#_02AFA6: ADC.w $0E00
#_02AFA9: TAY
#_02AFAA: LDX.w #$0000

.branch02AFAD
#_02AFAD: SEP #$20
#_02AFAF: LDA.w LocationNames,Y
#_02AFB2: STA.w $0C86,X
#_02AFB5: INY
#_02AFB6: INX
#_02AFB7: CPX.w #$000C
#_02AFBA: BNE .branch02AFAD

#_02AFBC: LDA.b #$FF
#_02AFBE: STA.w $0C86,X

#_02AFC1: REP #$20
#_02AFC3: STZ.w $0C60
#_02AFC6: LDA.w #$000D
#_02AFC9: STA.w $0CE8
#_02AFCC: LDA.w #$3F10
#_02AFCF: STA.w $0C58

.branch02AFD2
#_02AFD2: RTS

;===================================================================================================

LocationToAreaName:
#_02AFD3: db $0E,$0E,$0A,$0A,$0A,$0A,$0B,$0B
#_02AFDB: db $0C,$0D,$0D,$0F,$10,$10,$00,$00
#_02AFE3: db $0E,$0E,$0A,$0A,$0A,$0A,$0B,$0B
#_02AFEB: db $0C,$0D,$0D,$0F,$10,$10,$00,$00
#_02AFF3: db $11,$11,$11,$12,$12,$13,$14,$15
#_02AFFB: db $16,$0D,$0D,$17,$17,$17,$00,$00
#_02B003: db $18,$18,$18,$19,$1A,$1B,$1C,$1C
#_02B00B: db $1D,$1E,$1F,$17,$17,$17,$00,$00
#_02B013: db $01,$01,$01,$01,$06,$06,$06,$1C
#_02B01B: db $20,$21,$22,$17,$17,$17,$00,$00
#_02B023: db $01,$01,$01,$01,$06,$05,$23,$24
#_02B02B: db $25,$26,$27,$27,$27,$27,$00,$00
#_02B033: db $02,$02,$02,$03,$04,$05,$23,$23
#_02B03B: db $25,$25,$28,$29,$29,$29,$00,$00
#_02B043: db $02,$02,$02,$03,$07,$08,$08,$2A
#_02B04B: db $2A,$25,$2C,$2C,$2D,$2D,$00,$00
#_02B053: db $2E,$2E,$2E,$2F,$2F,$08,$08,$08
#_02B05B: db $30,$2B,$2C,$2C,$2D,$2D,$00,$00
#_02B063: db $2E,$2E,$2E,$2E,$2F,$31,$32,$33
#_02B06B: db $33,$33,$3A,$3A,$3A,$3A,$3A,$3A
#_02B073: db $2E,$2E,$2E,$34,$34,$31,$32,$35
#_02B07B: db $35,$3A,$3A,$3A,$3A,$3A,$3A,$3A
#_02B083: db $36,$36,$37,$38,$38,$35,$39,$35
#_02B08B: db $35,$3A,$3A,$3A,$3A,$3A,$3A,$3A
#_02B093: db $37,$37,$37,$38,$38,$35,$35,$35
#_02B09B: db $35,$3A,$3A,$3A,$3A,$3A,$3A,$3A
#_02B0A3: db $37,$37,$37,$38,$38,$35,$35,$35
#_02B0AB: db $35,$33,$33,$33,$33,$33,$00,$00
#_02B0B3: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B0BB: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B0C3: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B0CB: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B0D3: db $00,$00,$00,$00,$00,$09,$09,$09
#_02B0DB: db $09,$01,$01,$01,$06,$06,$06,$00
#_02B0E3: db $00,$00,$00,$00,$00,$09,$09,$09
#_02B0EB: db $09,$01,$01,$01,$06,$06,$06,$00
#_02B0F3: db $00,$00,$00,$00,$00,$09,$09,$09
#_02B0FB: db $09,$01,$01,$01,$06,$05,$05,$00
#_02B103: db $00,$00,$00,$00,$00,$09,$09,$09
#_02B10B: db $09,$02,$02,$03,$04,$05,$05,$00
#_02B113: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B11B: db $00,$02,$02,$03,$07,$08,$05,$00
#_02B123: db $00,$00,$00,$00,$00,$00,$00,$00
#_02B12B: db $00,$02,$02,$03,$07,$08,$05,$00

;===================================================================================================

LocationNames:
#_02B133: db $00, $00, $00, $00, $00, $18, $19, $9C, $0E, $0B, $1E, $0B ;      NO DATA
#_02B13F: db $00, $00, $00, $00, $1D, $12, $13, $18, $14, $1F, $15, $1F ;     SHINJUKU
#_02B14B: db $00, $00, $00, $00, $00, $00, $23, $19, $23, $19, $11, $13 ;       YOYOGI
#_02B157: db $00, $00, $00, $1D, $0F, $18, $0E, $0B, $11, $0B, $23, $0B ;    SENDAGAYA
#_02B163: db $1D, $12, $13, $18, $0B, $18, $19, $17, $0B, $0D, $12, $13 ; SHINANOMACHI
#_02B16F: db $00, $00, $00, $00, $00, $23, $19, $1E, $1D, $1F, $23, $0B ;      YOTSUYA
#_02B17B: db $00, $00, $00, $00, $13, $0D, $12, $13, $11, $0B, $23, $0B ;     ICHIGAYA
#_02B187: db $00, $14, $13, $18, $11, $1F, $00, $11, $0B, $13, $0F, $18 ;  JINGU GAIEN
#_02B193: db $00, $00, $00, $00, $00, $0B, $15, $0B, $1D, $0B, $15, $0B ;      AKASAKA
#_02B19F: db $00, $00, $00, $15, $13, $0D, $12, $13, $14, $19, $14, $13 ;    KICHIJOJI
#_02B1AB: db $00, $00, $00, $13, $15, $0F, $0C, $1F, $15, $1F, $1C, $19 ;    IKEBUKURO
#_02B1B7: db $00, $00, $00, $00, $00, $00, $1D, $1F, $11, $0B, $17, $19 ;       SUGAMO
#_02B1C3: db $00, $00, $00, $00, $00, $00, $1E, $0B, $0C, $0B, $1E, $0B ;       TABATA
#_02B1CF: db $00, $00, $00, $00, $00, $00, $00, $00, $1F, $0F, $18, $19 ;         UENO
#_02B1DB: db $00, $00, $00, $00, $13, $1E, $0B, $0C, $0B, $1D, $12, $13 ;     ITABASHI
#_02B1E7: db $00, $00, $00, $00, $00, $18, $13, $1A, $1A, $19, $1C, $13 ;      NIPPORI
#_02B1F3: db $00, $17, $13, $18, $0B, $17, $13, $1D, $0F, $18, $14, $1F ;  MINAMISENJU
#_02B1FF: db $00, $00, $00, $00, $00, $00, $19, $0D, $12, $13, $0B, $13 ;       OCHIAI
#_02B20B: db $00, $00, $00, $00, $00, $00, $17, $0F, $14, $13, $1C, $19 ;       MEJIRO
#_02B217: db $00, $00, $24, $19, $12, $1D, $12, $13, $11, $0B, $23, $0B ;   ZOHSHIGAYA
#_02B223: db $00, $00, $00, $00, $00, $19, $12, $1E, $1D, $1F, $15, $0B ;      OHTSUKA
#_02B22F: db $00, $00, $15, $19, $13, $1D, $12, $13, $15, $0B, $21, $0B ;   KOISHIKAWA
#_02B23B: db $00, $00, $00, $00, $15, $19, $17, $0B, $11, $19, $17, $0F ;     KOMAGOME
#_02B247: db $00, $00, $00, $00, $00, $0B, $1D, $0B, $15, $1F, $1D, $0B ;      ASAKUSA
#_02B253: db $00, $00, $00, $00, $00, $00, $19, $12, $15, $1F, $0C, $19 ;       OHKUBO
#_02B25F: db $1E, $0B, $15, $0B, $0E, $0B, $18, $19, $0C, $0B, $0C, $0B ; TAKADANOBABA
#_02B26B: db $00, $00, $00, $00, $00, $00, $21, $0B, $1D, $0F, $0E, $0B ;       WASEDA
#_02B277: db $00, $00, $15, $0B, $11, $1F, $1C, $0B, $24, $0B, $15, $0B ;   KAGURAZAKA
#_02B283: db $00, $00, $00, $13, $13, $0E, $0B, $0C, $0B, $1D, $12, $13 ;    IIDABASHI
#_02B28F: db $00, $00, $00, $15, $19, $12, $1C, $0B, $15, $1F, $0F, $18 ;    KOHRAKUEN
#_02B29B: db $00, $00, $00, $00, $00, $23, $1F, $1D, $12, $13, $17, $0B ;      YUSHIMA
#_02B2A7: db $00, $19, $15, $0B, $0D, $12, $13, $17, $0B, $0D, $12, $13 ;  OKACHIMACHI
#_02B2B3: db $00, $1D, $1F, $13, $0E, $19, $1F, $0C, $0B, $1D, $12, $13 ;  SUIDOUBASHI
#_02B2BF: db $00, $00, $19, $0D, $12, $0B, $18, $19, $17, $13, $24, $1F ;   OCHANOMIZU
#_02B2CB: db $00, $00, $00, $0B, $15, $13, $12, $0B, $0C, $0B, $1C, $0B ;    AKIHABARA
#_02B2D7: db $00, $00, $15, $19, $12, $14, $13, $17, $0B, $0D, $12, $13 ;   KOHJIMACHI
#_02B2E3: db $00, $00, $00, $00, $00, $00, $00, $15, $1F, $0E, $0B, $18 ;        KUDAN
#_02B2EF: db $00, $00, $00, $00, $00, $00, $15, $19, $12, $15, $23, $19 ;       KOHKYO
#_02B2FB: db $00, $00, $00, $14, $13, $18, $0C, $19, $12, $0D, $12, $19 ;    JINBOHCHO
#_02B307: db $00, $00, $00, $00, $00, $00, $00, $15, $0B, $18, $0E, $0B ;        KANDA
#_02B313: db $00, $00, $17, $0B, $1C, $1F, $18, $19, $1F, $0D, $12, $13 ;   MARUNOUCHI
#_02B31F: db $00, $00, $18, $13, $12, $19, $18, $0C, $0B, $1D, $12, $13 ;   NIHONBASHI
#_02B32B: db $00, $00, $00, $18, $0B, $11, $0B, $1E, $0B, $0D, $12, $19 ;    NAGATACHO
#_02B337: db $15, $0B, $1D, $1F, $17, $13, $11, $0B, $1D, $0F, $15, $13 ; KASUMIGASEKI
#_02B343: db $00, $00, $00, $00, $00, $00, $00, $11, $13, $18, $24, $0B ;        GINZA
#_02B34F: db $00, $00, $00, $00, $00, $00, $1E, $9B, $0E, $9B, $16, $9B ;       T.D.L.
#_02B35B: db $00, $00, $00, $00, $00, $1D, $12, $13, $0C, $1F, $23, $0B ;      SHIBUYA
#_02B367: db $00, $00, $00, $00, $00, $00, $0B, $19, $23, $0B, $17, $0B ;       AOYAMA
#_02B373: db $00, $00, $00, $1E, $19, $1C, $0B, $18, $19, $17, $19, $18 ;    TORANOMON
#_02B37F: db $00, $00, $00, $00, $00, $00, $00, $0B, $24, $0B, $0C, $1F ;        AZABU
#_02B38B: db $00, $00, $00, $00, $1C, $19, $1A, $1A, $19, $18, $11, $13 ;     ROPPONGI
#_02B397: db $00, $00, $00, $00, $00, $00, $00, $1D, $12, $13, $0C, $0B ;        SHIBA
#_02B3A3: db $00, $00, $00, $00, $00, $00, $00, $12, $13, $1C, $19, $19 ;        HIROO
#_02B3AF: db $00, $00, $00, $1D, $12, $13, $18, $0B, $11, $0B, $21, $0B ;    SHINAGAWA
#_02B3BB: db $00, $00, $00, $00, $00, $00, $17, $0F, $11, $1F, $1C, $19 ;       MEGURO
#_02B3C7: db $00, $00, $00, $00, $00, $00, $00, $0F, $0C, $13, $1D, $1F ;        EBISU
#_02B3D3: db $1D, $12, $13, $1C, $19, $11, $0B, $18, $0F, $0E, $0B, $13 ; SHIROGANEDAI
#_02B3DF: db $00, $00, $00, $00, $1E, $0B, $15, $0B, $18, $0B, $21, $0B ;     TAKANAWA
#_02B3EB: db $00, $00, $00, $0D, $0B, $1E, $12, $0F, $0E, $1C, $0B, $16 ;    CATHEDRAL

;===================================================================================================

data02B3F7:
#_02B3F7: dw $0000,$0002,$0004,$0008
#_02B3FF: dw $0010,$0020,$0080,$00C0
#_02B407: dw $0100,$0180,$0200,$0200
#_02B40F: dw $0200,$0200,$0200,$0200

data02B417:
#_02B417: db $11,$11,$11,$12,$11,$11,$22,$22
#_02B41F: db $11,$11,$11,$33,$33,$11,$22,$22
#_02B427: db $11,$11,$11,$44,$22,$11,$22,$22
#_02B42F: db $11,$11,$11,$11,$11,$11,$22,$22
#_02B437: db $11,$11,$11,$11,$11,$11,$22,$22
#_02B43F: db $11,$11,$11,$11,$11,$11,$22,$22

data02B447:
#_02B447: db $44,$44,$11,$11,$11,$11,$22,$11
#_02B44F: db $44,$44,$11,$11,$11,$11,$22,$11
#_02B457: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B45F: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B467: db $11,$11,$44,$11,$11,$11,$22,$11
#_02B46F: db $11,$11,$44,$11,$11,$11,$22,$11
#_02B477: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B47F: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B487: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B48F: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B497: db $11,$11,$11,$11,$11,$11,$22,$11
#_02B49F: db $22,$22,$11,$11,$33,$33,$33,$11
#_02B4A7: db $44,$44,$11,$22,$33,$33,$33,$11
#_02B4AF: db $44,$44,$11,$22,$33,$33,$33,$11
#_02B4B7: db $33,$33,$11,$22,$33,$33,$33,$11
#_02B4BF: db $33,$33,$11,$22,$33,$33,$33,$11

data02B4C7:
#_02B4C7: db $22,$23,$33,$33,$33,$22,$22,$22
#_02B4CF: db $22,$23,$33,$33,$33,$22,$22,$22
#_02B4D7: db $22,$23,$33,$33,$33,$22,$22,$22
#_02B4DF: db $33,$32,$22,$22,$22,$22,$22,$22
#_02B4E7: db $33,$32,$22,$22,$22,$22,$33,$22
#_02B4EF: db $33,$32,$22,$22,$22,$22,$33,$22
#_02B4F7: db $33,$32,$22,$22,$22,$22,$33,$22
#_02B4FF: db $33,$32,$22,$22,$22,$22,$22,$22
#_02B507: db $22,$22,$22,$22,$22,$22,$22,$22
#_02B50F: db $22,$22,$22,$22,$22,$22,$22,$22
#_02B517: db $22,$22,$22,$22,$22,$22,$22,$22
#_02B51F: db $22,$22,$22,$22,$22,$22,$22,$22
#_02B527: db $22,$22,$33,$22,$22,$22,$22,$22
#_02B52F: db $22,$22,$33,$33,$32,$22,$22,$22
#_02B537: db $22,$22,$33,$33,$32,$22,$22,$22
#_02B53F: db $22,$22,$33,$33,$32,$22,$22,$22

;===================================================================================================

Overworld_EnactEntrance:
#_02B547: SEP #$20
#_02B549: REP #$10
#_02B54B: LDX.w #$0000
#_02B54E: LDY.w #$0000

.next_entrance_check
#_02B551: LDA.w DungeonEntranceData+0,Y
#_02B554: CMP.b #$FF
#_02B556: BEQ .end_of_the_line

#_02B558: CMP.w $07F5
#_02B55B: BNE .not_this_entrance

#_02B55D: LDA.w DungeonEntranceData+1,Y
#_02B560: CMP.w $07F6
#_02B563: BEQ .branch02B56D

.not_this_entrance
#_02B565: INY ; why is this +4? Entrances are 8 bytes
#_02B566: INY
#_02B567: INY
#_02B568: INY
#_02B569: BRA .next_entrance_check

; DUMB! infinite loop if no entrance found
.end_of_the_line
#_02B56B: BRA .next_entrance_check

.branch02B56D
#_02B56D: LDA.w DungeonEntranceData+2,Y

; this branch seems completely unused
#_02B570: BMI .to_overworld_area

#_02B572: STA.w $070C
#_02B575: LDA.w DungeonEntranceData+3,Y
#_02B578: PHA
#_02B579: AND.b #$3F
#_02B57B: STA.w $070D
#_02B57E: PLA
#_02B57F: ASL A
#_02B580: ROL A
#_02B581: ROL A
#_02B582: AND.b #$03
#_02B584: STA.w $040D
#_02B587: LDA.w DungeonEntranceData+4,Y ; WTF!?
#_02B58A: STA.w $0710
#_02B58D: LDA.w DungeonEntranceData+5,Y
#_02B590: LDA.w DungeonEntranceData+6,Y
#_02B593: LDA.w DungeonEntranceData+7,Y

#_02B596: SEP #$20
#_02B598: LDA.b #$01
#_02B59A: STA.w $0C4F
#_02B59D: RTS

.to_overworld_area
#_02B59E: AND.b #$7F
#_02B5A0: STA.w $07F5
#_02B5A3: LDA.w DungeonEntranceData+3,Y
#_02B5A6: STA.w $07F6
#_02B5A9: LDA.w DungeonEntranceData+4,Y ; WTF again!?
#_02B5AC: STA.w $045B
#_02B5AF: LDA.w DungeonEntranceData+5,Y
#_02B5B2: LDA.w DungeonEntranceData+6,Y
#_02B5B5: LDA.w DungeonEntranceData+7,Y
#_02B5B8: JSR routine028659

#_02B5BB: SEP #$20
#_02B5BD: LDA.b #$81
#_02B5BF: STZ.w $0C4F
#_02B5C2: RTS

;===================================================================================================
; TODO need to know what these are more
DungeonEntranceData:
; owx, owy, uwt, theme
; top 2 bits of uwt determine direction faced
#_02B5C3: db $31, $88 : dw $C102 : db $1A, $00, $00, $00 ; W - Home
#_02B5CB: db $31, $89 : dw $C302 : db $1A, $00, $00, $00 ; W - Momo's house
#_02B5D3: db $36, $8A : dw $4501 : db $07, $00, $00, $00 ; E - Kichijoji mall west
#_02B5DB: db $39, $88 : dw $8107 : db $07, $00, $00, $00 ; S - Kichijoji mall north
#_02B5E3: db $39, $8B : dw $0607 : db $07, $00, $00, $00 ; N - Kichijoji mall south
#_02B5EB: db $38, $95 : dw $4309 : db $02, $00, $00, $00 ; E - Kichijoji park building
#_02B5F3: db $3A, $8F : dw $0212 : db $00, $00, $00, $00 ; N - Kichijoji hospital
#_02B5FB: db $3E, $8F : dw $061B : db $01, $00, $00, $00 ; N - Kichijoji underground mall
#_02B603: db $5B, $A5 : dw $0E10 : db $04, $00, $00, $00 ; N - Sendagaya underground mall
#_02B60B: db $70, $96 : dw $0F1F : db $09, $00, $00, $00 ; N - Yotsuya bunker
#_02B613: db $6D, $88 : dw $022B : db $01, $00, $00, $00 ; N - Ichigaya long building
#_02B61B: db $5A, $8E : dw $C156 : db $08, $00, $00, $00 ; W - Shinjuku TODO
#_02B623: db $54, $8F : dw $4151 : db $08, $00, $00, $00 ; E - Shinjuku TODO
#_02B62B: db $15, $2A : dw $C756 : db $0B, $00, $00, $00 ; W - Shinjuku TODO
#_02B633: db $10, $2B : dw $4751 : db $0B, $00, $00, $00 ; E - Shinjuku TODO
#_02B63B: db $4F, $94 : dw $CB26 : db $08, $00, $00, $00 ; W - Shinjuku TODO
#_02B643: db $4F, $89 : dw $CF2A : db $02, $00, $00, $00 ; W - Shinjuku TODO
#_02B64B: db $13, $4D : dw $0E54 : db $06, $00, $00, $00 ; N - Shibuya TODO
#_02B653: db $31, $51 : dw $CB6E : db $08, $00, $00, $00 ; W - Roppongi south
#_02B65B: db $25, $55 : dw $3250 : db $04, $00, $00, $00 ; N - Hiroo
#_02B663: db $2E, $51 : dw $3253 : db $04, $00, $00, $00 ; N - Azabu
#_02B66B: db $4D, $3F : dw $1606 : db $0C, $00, $00, $00 ; N - Kasumigaseki
#_02B673: db $2C, $13 : dw $5809 : db $06, $00, $00, $00 ; E - Zoshigaya east
#_02B67B: db $37, $49 : dw $F342 : db $06, $00, $00, $00 ; W - Roppongi north
#_02B683: db $55, $3B : dw $D212 : db $08, $00, $00, $00 ; W - Ginza north west
#_02B68B: db $57, $3B : dw $5315 : db $08, $00, $00, $00 ; E - Ginza north east
#_02B693: db $55, $3E : dw $D612 : db $08, $00, $00, $00 ; W - Ginza south west
#_02B69B: db $57, $3E : dw $1616 : db $08, $00, $00, $00 ; N - Ginza south east
#_02B6A3: db $3C, $57 : dw $5E3D : db $06, $00, $00, $00 ; E - Shinagawa north
#_02B6AB: db $3D, $5D : dw $1E49 : db $0E, $00, $00, $00 ; N - Shinagawa south
#_02B6B3: db $25, $0C : dw $D466 : db $0F, $00, $00, $00 ; W - Ikebukoro nuked
#_02B6BB: db $55, $13 : dw $5571 : db $10, $00, $00, $00 ; E - Ueno
#_02B6C3: db $55, $22 : dw $1E74 : db $10, $00, $00, $00 ; N - Akihabara
#_02B6CB: db $66, $41 : dw $2E08 : db $11, $00, $00, $00 ; N - T.D.L.
#_02B6D3: db $48, $49 : dw $2E19 : db $0B, $00, $00, $00 ; N - Shiba - Tokyo Tower nuked
#_02B6DB: db $48, $48 : dw $E81E : db $07, $00, $00, $00 ; W - Shiba - Tokyo Tower flooded
#_02B6E3: db $56, $4C : dw $A92C : db $13, $00, $00, $00 ; S - Cathedral north
#_02B6EB: db $57, $62 : dw $3E2B : db $13, $00, $00, $00 ; N - Cathedral south
#_02B6F3: db $57, $52 : dw $B54A : db $13, $00, $00, $00 ; S - Cathedral center north
#_02B6FB: db $5B, $56 : dw $FA4E : db $13, $00, $00, $00 ; W - Cathedral center east
#_02B703: db $56, $5B : dw $3E49 : db $13, $00, $00, $00 ; N - Cathedral center south
#_02B70B: db $52, $56 : dw $7945 : db $13, $00, $00, $00 ; E - Cathedral center west
#_02B713: db $43, $0C : dw $F25D : db $02, $00, $00, $00 ; W - Tabata nuked - passage to Sugamo
#_02B71B: db $36, $0C : dw $7156 : db $02, $00, $00, $00 ; E - Sugamo nuked - passage to Tabata
#_02B723: db $60, $1A : dw $B541 : db $02, $00, $00, $00 ; S - Asakusa - Jikokuten passage to Kanda
#_02B72B: db $63, $29 : dw $3A42 : db $02, $00, $00, $00 ; N - Kanda - Jikokuten passage to Asakusa
#_02B733: db $31, $64 : dw $B148 : db $02, $00, $00, $00 ; S - Shinagawa - Komokuten building
#_02B73B: db $0A, $3E : dw $F75E : db $02, $00, $00, $00 ; W - Yoyogi - Zochoten building
#_02B743: db $0B, $2D : dw $363A : db $08, $00, $00, $00 ; N - Shinjuku flooded - government office
#_02B74B: db $25, $0B : dw $3E3B : db $03, $00, $00, $00 ; N - Ikubukuro - dark building TODO
#_02B753: db $49, $35 : dw $1E13 : db $12, $00, $00, $00 ; N - Kokyo Tokyo Imperial Palace
#_02B75B: db $FF ; end of data


;===================================================================================================

routine02B75C:
#_02B75C: JSR routine02B8D8

#_02B75F: REP #$30
#_02B761: LDY.w #$0000
#_02B764: STZ.w $0E00
#_02B767: STZ.w $0E02

.branch02B76A
#_02B76A: REP #$20
#_02B76C: LDA.w data02B7C7,Y
#_02B76F: CMP.w #$FFFF
#_02B772: BEQ .branch02B7AF

#_02B774: LDX.w $0E02
#_02B777: STA.w $0C56,X
#_02B77A: LDA.w #$0000
#_02B77D: STA.w $0C5E,X
#_02B780: INY
#_02B781: INY
#_02B782: LDA.w data02B7C7,Y
#_02B785: STA.w $0CE6,X
#_02B788: LDA.w $0E00
#_02B78B: ASL A
#_02B78C: ASL A
#_02B78D: ASL A
#_02B78E: ASL A
#_02B78F: ASL A
#_02B790: TAX
#_02B791: INY
#_02B792: INY

#_02B793: SEP #$20

.branch02B795
#_02B795: LDA.w data02B7C7,Y
#_02B798: STA.w $0C66,X
#_02B79B: CMP.b #$FF
#_02B79D: BEQ .branch02B7A3

#_02B79F: INY
#_02B7A0: INX
#_02B7A1: BRA .branch02B795

.branch02B7A3
#_02B7A3: INC.w $0E00
#_02B7A6: INC.w $0E02
#_02B7A9: INC.w $0E02
#_02B7AC: INY
#_02B7AD: BRA .branch02B76A

.branch02B7AF
#_02B7AF: JSR routine02868A
#_02B7B2: JSL AddSelfAsVectorAndMakeSpace
#_02B7B6: JSR routine02B7E4

#_02B7B9: REP #$20
#_02B7BB: INC.w $0B2D
#_02B7BE: LDA.w $0C5E
#_02B7C1: CMP.w #$00FF
#_02B7C4: BNE .branch02B7AF

#_02B7C6: RTS

data02B7C7:
#_02B7C7: db $63,$3C,$0C,$00
#_02B7CB: db $17, $19, $19, $18, $99, $1D, $00, $0B, $11, $0F, $9A ; MOON'S AGE:
#_02B7D6: db $FF

#_02B7D7: db $F7,$3E,$06,$00
#_02B7DB: db $1A, $16, $0B, $0D, $0F, $9A ; PLACE:
#_02B7E1: db $FF

#_02B7E2: db $FF, $FF

;===================================================================================================

routine02B7E4:
#_02B7E4: SEP #$20
#_02B7E6: LDA.w $0B2D
#_02B7E9: AND.b #$01
#_02B7EB: BNE .branch02B7F0

#_02B7ED: JMP .branch02B90E

.branch02B7F0
#_02B7F0: REP #$30
#_02B7F2: STZ.w $0E00
#_02B7F5: STZ.w $0E02
#_02B7F8: STZ.w $0E04
#_02B7FB: STZ.w $0E08

.branch02B7FE
#_02B7FE: LDX.w $0E02
#_02B801: LDA.w $0CE6,X
#_02B804: BEQ .branch02B809

#_02B806: JMP .branch02B8AC

.branch02B809
#_02B809: LDA.w $0C5E,X
#_02B80C: CMP.w #$00FF
#_02B80F: BEQ .branch02B864

#_02B811: STA.w $0E06
#_02B814: CLC
#_02B815: ADC.w $0C56,X
#_02B818: LDX.w $0E04
#_02B81B: STA.w $0102,X
#_02B81E: LDA.w #$0002
#_02B821: STA.w $0104,X
#_02B824: LDA.w $0E00
#_02B827: ASL A
#_02B828: ASL A
#_02B829: ASL A
#_02B82A: ASL A
#_02B82B: ASL A
#_02B82C: CLC
#_02B82D: ADC.w $0E06
#_02B830: TAX
#_02B831: LDA.w $0C66,X
#_02B834: AND.w #$00FF
#_02B837: CMP.w #$00FF
#_02B83A: BEQ .branch02B87F

#_02B83C: ORA.w #$2000
#_02B83F: LDX.w $0E04
#_02B842: STA.w $0106,X
#_02B845: LDA.w #$209C
#_02B848: STA.w $0108,X
#_02B84B: LDX.w $0E02
#_02B84E: INC.w $0C5E,X
#_02B851: LDA.w $0E04
#_02B854: CLC
#_02B855: ADC.w #$0008
#_02B858: STA.w $0E04
#_02B85B: LDA.w #$FFFF
#_02B85E: STA.w $0CEE
#_02B861: INC.w $0E08

.branch02B864
#_02B864: INC.w $0E02
#_02B867: INC.w $0E02
#_02B86A: INC.w $0E00
#_02B86D: LDA.w $0E00
#_02B870: CMP.w #$0004
#_02B873: BEQ .branch02B878

#_02B875: JMP .branch02B7FE

.branch02B878
#_02B878: LDA.w $0E08
#_02B87B: STA.w $0100
#_02B87E: RTS

.branch02B87F
#_02B87F: LDX.w $0E02
#_02B882: LDA.w #$00FF
#_02B885: STA.w $0C5E,X
#_02B888: LDX.w $0E04
#_02B88B: LDA.w $0102,X
#_02B88E: STA.w $0CEE
#_02B891: LDA.w #$0000
#_02B894: STA.w $0106,X
#_02B897: LDA.w #$0001
#_02B89A: STA.w $0104,X
#_02B89D: LDA.w $0E04
#_02B8A0: CLC
#_02B8A1: ADC.w #$0006
#_02B8A4: STA.w $0E04
#_02B8A7: INC.w $0E08
#_02B8AA: BRA .branch02B864

.branch02B8AC
#_02B8AC: TAY
#_02B8AD: LDA.w #$0000
#_02B8B0: STA.w $0CE6,X
#_02B8B3: LDA.w $0C56,X
#_02B8B6: LDX.w $0E04
#_02B8B9: STA.w $0102,X
#_02B8BC: TYA
#_02B8BD: STA.w $0104,X

.branch02B8C0
#_02B8C0: LDA.w #$0000
#_02B8C3: STA.w $0106,X
#_02B8C6: INX
#_02B8C7: INX
#_02B8C8: DEY
#_02B8C9: BNE .branch02B8C0

#_02B8CB: TXA
#_02B8CC: CLC
#_02B8CD: ADC.w #$0004
#_02B8D0: STA.w $0E04
#_02B8D3: INC.w $0E08
#_02B8D6: BRA .branch02B864

routine02B8D8:
#_02B8D8: REP #$30
#_02B8DA: LDA.w #$0000
#_02B8DD: STA.w $0CE6
#_02B8E0: STA.w $0CE8
#_02B8E3: STA.w $0CEA
#_02B8E6: STA.w $0CEC
#_02B8E9: LDA.w #$00FF
#_02B8EC: STA.w $0C5E
#_02B8EF: STA.w $0C60
#_02B8F2: STA.w $0C62
#_02B8F5: STA.w $0C64
#_02B8F8: LDA.w #$FFFF
#_02B8FB: STA.w $0C56
#_02B8FE: STA.w $0C58
#_02B901: STA.w $0C5A
#_02B904: STA.w $0C5C
#_02B907: STA.w $0CEE
#_02B90A: STA.w $0CF0
#_02B90D: RTS

.branch02B90E
#_02B90E: REP #$30
#_02B910: STZ.w $0E00
#_02B913: STZ.w $0E02
#_02B916: LDA.w $0CEE
#_02B919: CMP.w #$FFFF
#_02B91C: BEQ .branch02B953

#_02B91E: CMP.w $0CF0
#_02B921: BEQ .branch02B926

#_02B923: JSR routine02B966

.branch02B926
#_02B926: LDX.w $0E00
#_02B929: LDA.w $0CEE
#_02B92C: STA.w $0102,X
#_02B92F: LDA.w #$0001
#_02B932: STA.w $0104,X
#_02B935: LDA.w #$0000
#_02B938: STA.w $0106,X
#_02B93B: LDA.w $0B2D
#_02B93E: AND.w #$0010
#_02B941: BNE .branch02B949

#_02B943: LDA.w #$209C
#_02B946: STA.w $0106,X

.branch02B949
#_02B949: INC.w $0E02
#_02B94C: LDA.w $0E02
#_02B94F: STA.w $0100
#_02B952: RTS

.branch02B953
#_02B953: LDA.w $0CF0
#_02B956: CMP.w #$FFFF
#_02B959: BNE .branch02B95C

#_02B95B: RTS

.branch02B95C
#_02B95C: JSR routine02B966
#_02B95F: LDA.w #$0001
#_02B962: STA.w $0100
#_02B965: RTS

;===================================================================================================

routine02B966:
#_02B966: LDA.w $0CF0
#_02B969: STA.w $0102
#_02B96C: LDA.w #$0001
#_02B96F: STA.w $0104
#_02B972: LDA.w #$0000
#_02B975: STA.w $0106
#_02B978: INC.w $0E02
#_02B97B: LDA.w #$0006
#_02B97E: STA.w $0E00
#_02B981: LDA.w $0CEE
#_02B984: STA.w $0CF0
#_02B987: RTS

;===================================================================================================

routine02B988:
#_02B988: SEP #$20
#_02B98A: LDA.w $040F
#_02B98D: CLC
#_02B98E: ADC.b #$10
#_02B990: AND.b #$F0
#_02B992: STA.w $040F
#_02B995: JSR routine02B999
#_02B998: RTS

;===================================================================================================

routine02B999:
#_02B999: PHP
#_02B99A: SEP #$30
#_02B99C: LDA.w $040F
#_02B99F: AND.b #$F0
#_02B9A1: LSR A
#_02B9A2: TAY
#_02B9A3: LDX.b #$00

.branch02B9A5
#_02B9A5: LDA.w data02B9CC,Y
#_02B9A8: STA.w $0C66,X
#_02B9AB: INY
#_02B9AC: INX
#_02B9AD: CPX.b #$08
#_02B9AF: BNE .branch02B9A5

#_02B9B1: LDA.b #$FF
#_02B9B3: STA.w $0C6E

#_02B9B6: REP #$20
#_02B9B8: LDA.w #$3C83
#_02B9BB: STA.w $0C56
#_02B9BE: LDA.w #$0000
#_02B9C1: STA.w $0C5E
#_02B9C4: LDA.w #$000A
#_02B9C7: STA.w $0CE6
#_02B9CA: PLP
#_02B9CB: RTS

data02B9CC:
#_02B9CC: db $18,$0F,$21,$00,$17,$19,$19,$18
#_02B9D4: db $02,$98,$09,$00,$17,$19,$19,$18
#_02B9DC: db $03,$98,$09,$00,$17,$19,$19,$18
#_02B9E4: db $04,$98,$09,$00,$17,$19,$19,$18
#_02B9EC: db $12,$0B,$16,$10,$17,$19,$19,$18
#_02B9F4: db $06,$98,$09,$00,$17,$19,$19,$18
#_02B9FC: db $07,$98,$09,$00,$17,$19,$19,$18
#_02BA04: db $08,$98,$09,$00,$17,$19,$19,$18
#_02BA0C: db $10,$1F,$16,$16,$17,$19,$19,$18
#_02BA14: db $08,$98,$09,$00,$17,$19,$19,$18
#_02BA1C: db $07,$98,$09,$00,$17,$19,$19,$18
#_02BA24: db $06,$98,$09,$00,$17,$19,$19,$18
#_02BA2C: db $12,$0B,$16,$10,$17,$19,$19,$18
#_02BA34: db $04,$98,$09,$00,$17,$19,$19,$18
#_02BA3C: db $03,$98,$09,$00,$17,$19,$19,$18
#_02BA44: db $02,$98,$09,$00,$17,$19,$19,$18

routine02BA4C:
#_02BA4C: PHP
#_02BA4D: PHB
#_02BA4E: PHK
#_02BA4F: PLB

#_02BA50: SEP #$30
#_02BA52: LDA.w $040F
#_02BA55: AND.b #$F0
#_02BA57: STA.w $0E00
#_02BA5A: CMP.b #$90
#_02BA5C: BCC .branch02Ba66

#_02BA5E: LDA.b #$80
#_02BA60: SEC
#_02BA61: SBC.w $0E00
#_02BA64: AND.b #$70

.branch02Ba66
#_02BA66: LSR A
#_02BA67: LSR A
#_02BA68: LSR A
#_02BA69: LSR A
#_02BA6A: STA.w $0714
#_02BA6D: JSL routine00A63C
#_02BA71: PLB
#_02BA72: PLP
#_02BA73: RTL

;===================================================================================================

routine02BA74:
#_02BA74: PHP
#_02BA75: SEP #$20
#_02BA77: ASL A
#_02BA78: INC A
#_02BA79: INC A
#_02BA7A: STA.w $0A0F
#_02BA7D: LDA.b #$1A
#_02BA7F: STA.w $0A0D
#_02BA82: LDA.b #$11
#_02BA84: STA.w $0A11

#_02BA87: REP #$20
#_02BA89: LDA.w #$3D83
#_02BA8C: STA.w $0A0B
#_02BA8F: JSL routine02BA95
#_02BA93: PLP
#_02BA94: RTL

;===================================================================================================

routine02BA95:
#_02BA95: PHP
#_02BA96: REP #$20
#_02BA98: PHB

#_02BA99: SEP #$20
#_02BA9B: LDA.b #routine02BA95>>16
#_02BA9D: PHA

#_02BA9E: REP #$20
#_02BAA0: PLB
#_02BAA1: LDA.w $0A0B
#_02BAA4: STA.w $0102
#_02BAA7: LDA.w $0A0D
#_02BAAA: STA.w $0104

#_02BAAD: SEP #$30
#_02BAAF: LDA.w $0A11
#_02BAB2: AND.b #$F0
#_02BAB4: LSR A
#_02BAB5: LSR A
#_02BAB6: LSR A
#_02BAB7: TAX

#_02BAB8: REP #$20
#_02BABA: LDA.w #.return-1
#_02BABD: PHA
#_02BABE: LDA.w .vectors,X
#_02BAC1: STA.w $00E0
#_02BAC4: JMP ($00E0)

.return
#_02BAC7: PLB
#_02BAC8: PLP
#_02BAC9: RTL

.vectors
#_02BACA: dw routine02BACE
#_02BACC: dw routine02BACF

routine02BACE:
#_02BACE: RTS

;===================================================================================================

routine02BACF:
#_02BACF: REP #$30
#_02BAD1: LDX.w #$0000
#_02BAD4: JSR routine02BB25
#_02BAD7: LDA.w #$0001
#_02BADA: STA.w $0100
#_02BADD: JSL AddSelfAsVectorAndMakeSpace
#_02BAE1: JSR routine02BB16
#_02BAE4: LDY.w $0A0F
#_02BAE7: DEY
#_02BAE8: DEY

.branch02BAE9
#_02BAE9: JSL RunFramesUntil0100IsFlagged
#_02BAED: PHY
#_02BAEE: LDX.w #$0001
#_02BAF1: JSR routine02BB25
#_02BAF4: LDA.w #$0001
#_02BAF7: STA.w $0100
#_02BAFA: JSL AddSelfAsVectorAndMakeSpace
#_02BAFE: JSR routine02BB16
#_02BB01: PLY
#_02BB02: DEY
#_02BB03: BNE .branch02BAE9

#_02BB05: LDX.w #$0002
#_02BB08: JSR routine02BB25
#_02BB0B: LDA.w #$0001
#_02BB0E: STA.w $0100
#_02BB11: JSL AddSelfAsVectorAndMakeSpace
#_02BB15: RTS

;===================================================================================================

routine02BB16:
#_02BB16: PHP
#_02BB17: REP #$20
#_02BB19: LDA.w $0102
#_02BB1C: CLC
#_02BB1D: ADC.w #$0020
#_02BB20: STA.w $0102
#_02BB23: PLP
#_02BB24: RTS

;===================================================================================================

routine02BB25:
#_02BB25: PHP
#_02BB26: REP #$20
#_02BB28: SEP #$10
#_02BB2A: TXA
#_02BB2B: STA.w $0E02
#_02BB2E: ASL A
#_02BB2F: CLC
#_02BB30: ADC.w $0E02
#_02BB33: TAY
#_02BB34: LDX.b #$00

.branch02BB36
#_02BB36: PHX

#_02BB37: SEP #$20
#_02BB39: LDA.w data02BB91,Y
#_02BB3C: AND.b #$F0
#_02BB3E: STA.w $0E03,X
#_02BB41: LDA.b #$00
#_02BB43: STA.w $0E02,X
#_02BB46: LDA.w data02BB91,Y
#_02BB49: AND.b #$0F
#_02BB4B: STA.w $0E08
#_02BB4E: LDA.w $0A11
#_02BB51: AND.b #$0F
#_02BB53: ASL A
#_02BB54: ASL A
#_02BB55: ASL A
#_02BB56: CLC
#_02BB57: ADC.w $0E08
#_02BB5A: TAX

#_02BB5B: REP #$20
#_02BB5D: LDA.w data02BB9A,X
#_02BB60: PLX
#_02BB61: ORA.w $0E02,X
#_02BB64: STA.w $0E02,X
#_02BB67: INY
#_02BB68: INX
#_02BB69: INX
#_02BB6A: CPX.b #$06
#_02BB6C: BNE .branch02BB36

#_02BB6E: REP #$30
#_02BB70: LDA.w $0E02
#_02BB73: STA.w $0106
#_02BB76: LDY.w $0A0D
#_02BB79: DEY
#_02BB7A: DEY
#_02BB7B: LDX.w #$0000

.branch02BB7E
#_02BB7E: LDA.w $0E04
#_02BB81: STA.w $0108,X
#_02BB84: INX
#_02BB85: INX
#_02BB86: DEY
#_02BB87: BNE .branch02BB7E

#_02BB89: LDA.w $0E06
#_02BB8C: STA.w $0108,X
#_02BB8F: PLP
#_02BB90: RTS

data02BB91:
#_02BB91: db $20,$22,$60,$24,$26,$64,$A0,$A2
#_02BB99: db $E0

data02BB9A:
#_02BB9A: dw $0000,$0000,$0000,$0000
#_02BBA2: dw $00D8,$00D9,$00DA,$00CF
#_02BBAA: dw $00D0,$00D1,$00D3,$00CF
#_02BBB2: dw $00D8,$00D9,$00DA,$00CF

; TODO POSSIBLY UNUSED ROUTINE
routine02BBBA:
#_02BBBA: PHP
#_02BBBB: JSL RunFramesUntil0100IsFlagged

#_02BBBF: SEP #$20
#_02BBC1: LDA.b #$10
#_02BBC3: STA.w $0A11
#_02BBC6: JSL routine02BA95
#_02BBCA: PLP
#_02BBCB: RTL

#_02BBCC: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine02BBCD:
#_02BBCD: PHP
#_02BBCE: REP #$30
#_02BBD0: LDA.w $0B32
#_02BBD3: STA.w $0E10
#_02BBD6: STZ.w $0E12
#_02BBD9: JSL HEXtoDEC_rightaligned_tiles_rtl
#_02BBDD: LDY.w #$0002
#_02BBE0: LDX.w #$0000

.branch02BBE3
#_02BBE3: SEP #$20
#_02BBE5: LDA.w $0E00,Y
#_02BBE8: CMP.b #$CF
#_02BBEA: BNE .branch02BBEE

#_02BBEC: LDA.b #$01

.branch02BBEE
#_02BBEE: STA.w $0CA6,X
#_02BBF1: INX
#_02BBF2: DEY
#_02BBF3: BPL .branch02BBE3

#_02BBF5: LDA.b #$FF
#_02BBF7: STA.w $0CA9

#_02BBFA: REP #$20
#_02BBFC: LDA.w #$3F05
#_02BBFF: STA.w $0C5A
#_02BC02: LDA.w #$0003
#_02BC05: STA.w $0CEA
#_02BC08: STZ.w $0C62
#_02BC0B: PLP
#_02BC0C: RTS

;===================================================================================================

routine02BC0D:
#_02BC0D: REP #$30
#_02BC0F: LDA.w $0405
#_02BC12: STA.w $0E10
#_02BC15: LDA.w $0407
#_02BC18: STA.w $0E12
#_02BC1B: JSL HEXtoDEC_rightaligned_tiles_rtl
#_02BC1F: LDY.w #$0005

.branch02BC22
#_02BC22: LDA.w $0E00,Y
#_02BC25: AND.w #$00FF
#_02BC28: ORA.w #$2000
#_02BC2B: STA.w $0100,X
#_02BC2E: INX
#_02BC2F: INX
#_02BC30: DEY
#_02BC31: BPL .branch02BC22

#_02BC33: RTL

;===================================================================================================

routine02BC34:
#_02BC34: SEP #$20
#_02BC36: LDA.b #$17
#_02BC38: STA.w $0F74
#_02BC3B: STA.w TM
#_02BC3E: LDA.b #$02
#_02BC40: STA.w $0F76
#_02BC43: STA.w TS
#_02BC46: LDA.b #$02
#_02BC48: STA.w CGWSEL
#_02BC4B: LDA.b #$51
#_02BC4D: STA.w CGADSUB

#_02BC50: REP #$30
#_02BC52: LDA.w #$0001
#_02BC55: STA.w $0E00
#_02BC58: LDY.w #$0000

.branch02BC5B
#_02BC5B: REP #$30
#_02BC5D: LDA.w $0E00
#_02BC60: ASL A
#_02BC61: CLC
#_02BC62: ADC.w #$0020
#_02BC65: TAX
#_02BC66: LDA.w data02BCBC,Y
#_02BC69: CMP.w #$FFFF
#_02BC6C: BEQ .branch02BCBB

#_02BC6E: STA.w $1A60,X
#_02BC71: LDA.w data02BCBE,Y
#_02BC74: STA.w $1AA0,X
#_02BC77: LDA.w data02BCC0,Y
#_02BC7A: STA.w $0000,X
#_02BC7D: LDA.w data02BCC2,Y
#_02BC80: STA.w $0040,X

#_02BC83: SEP #$30
#_02BC85: LDA.w $0E00
#_02BC88: CLC
#_02BC89: ADC.b #$10
#_02BC8B: TAX
#_02BC8C: LDA.b #$80
#_02BC8E: STA.w $1A00,X
#_02BC91: STA.w $1A20,X
#_02BC94: TYA
#_02BC95: CLC
#_02BC96: ADC.b #$08
#_02BC98: TAY
#_02BC99: INC.w $0E00
#_02BC9C: INC.w $0E00
#_02BC9F: INC.w $0E00
#_02BCA2: INC.w $0E00
#_02BCA5: PHP
#_02BCA6: REP #$30
#_02BCA8: PHA
#_02BCA9: PHX
#_02BCAA: PHY
#_02BCAB: PHD
#_02BCAC: PHB
#_02BCAD: JSL routine008838

#_02BCB1: REP #$30
#_02BCB3: PLB
#_02BCB4: PLD
#_02BCB5: PLY
#_02BCB6: PLX
#_02BCB7: PLA
#_02BCB8: PLP
#_02BCB9: BRA .branch02BC5B

.branch02BCBB
#_02BCBB: RTS

data02BCBC:
#_02BCBC: dw $0008

data02BCBE:
#_02BCBE: dw $00EF

data02BCC0:
#_02BCC0: dw $0005

data02BCC2:
#_02BCC2: dw $0028,$0078,$00CF,$0007
#_02BCCA: dw $0029,$FFFF

routine02BCCE:
#_02BCCE: REP #$30
#_02BCD0: JSL RunFramesUntil0100IsFlagged
#_02BCD4: LDA.w #$3F1C
#_02BCD7: STA.w $0CEE
#_02BCDA: LDA.w #$00FF
#_02BCDD: STA.w $0C64
#_02BCE0: LDA.w #$3C76
#_02BCE3: STA.w $0102
#_02BCE6: CLC
#_02BCE7: ADC.w #$0020
#_02BCEA: STA.w $0116
#_02BCED: LDA.w #$0008
#_02BCF0: STA.w $0104
#_02BCF3: STA.w $0118
#_02BCF6: LDX.w #$0000
#_02BCF9: LDA.w #$0000

.branch02BCFC
#_02BCFC: STA.w $0106,X
#_02BCFF: STA.w $011A,X
#_02BD02: INX
#_02BD03: INX
#_02BD04: CPX.w #$0010
#_02BD07: BNE .branch02BCFC

#_02BD09: LDA.w #$0002
#_02BD0C: STA.w $0100
#_02BD0F: LDA.w #$0029
#_02BD12: STA.w $007A

#_02BD15: SEP #$20
#_02BD17: LDA.b #$80
#_02BD19: STA.w $1A3D
#_02BD1C: LDA.b #$FF
#_02BD1E: STA.w $0B3A
#_02BD21: RTS

;===================================================================================================
; TODO more to figure out
;===================================================================================================
Handle_IdleHUD:
#_02BD22: REP #$30

#_02BD24: LDA.w $0B3A
#_02BD27: AND.w #$0080
#_02BD2A: BEQ .active

#_02BD2C: RTS

.active
#_02BD2D: LDA.w $0B3A
#_02BD30: AND.w #$00FF
#_02BD33: ASL A
#_02BD34: TAY

#_02BD35: LDA.w .slide_vectors,Y
#_02BD38: STA.w $00E0

#_02BD3B: JMP ($00E0)

.slide_vectors
#_02BD3E: dw IdleHUD_StartSlide_and_Money
#_02BD40: dw IdleHUD_StartSlide_and_MAG
#_02BD42: dw IdleHUD_AllOpen

;===================================================================================================

; TODO figure this out more
; 194X stuff seems related to OAM
IdleHUD_StartSlide_and_Money:
#_02BD44: SEP #$20

#_02BD46: LDA.b #$5B ; Yen symbol
#_02BD48: STA.w $0CC6

#_02BD4B: LDA.b #$EC
#_02BD4D: JSL TestGameProgressBit
#_02BD51: BCC .yen

#_02BD53: INC.w $0CC6

.yen
#_02BD56: REP #$20

#_02BD58: LDA.w #$3C76 ; $78EC VRAM
#_02BD5B: STA.w $0C5C

#_02BD5E: LDA.w $0405 ; 32 bit money
#_02BD61: STA.w $0E10

#_02BD64: LDA.w $0407
#_02BD67: STA.w $0E12

#_02BD6A: LDX.w #$0001
#_02BD6D: JSR Draw_MoneyMagCount_toHUD

#_02BD70: LDA.w #$00FF
#_02BD73: STA.w $0CCD

#_02BD76: LDA.w #$0007
#_02BD79: STA.w $0CEC
#_02BD7C: STZ.w $0C64

#_02BD7F: INC.w $0B3A

#_02BD82: LDA.w #$00A8
#_02BD85: STA.w $1A9A

#_02BD88: LDA.w #$00EF
#_02BD8B: STA.w $1ADA

#_02BD8E: LDA.w #$0007
#_02BD91: STA.w $003A

#_02BD94: LDA.w #$0028
#_02BD97: STA.w $007A

#_02BD9A: SEP #$20

#_02BD9C: LDA.b #$80
#_02BD9E: STA.w $1A3D

#_02BDA1: ORA.b #$20
#_02BDA3: STA.w $1A1D

#_02BDA6: RTS

;===================================================================================================

IdleHUD_StartSlide_and_MAG:
#_02BDA7: REP #$20

#_02BDA9: LDA.w $0C64
#_02BDAC: CMP.w #$00FF
#_02BDAF: BEQ .continue

#_02BDB1: RTS

.continue
#_02BDB2: SEP #$20 ; !WTF
#_02BDB4: REP #$20

#_02BDB6: LDA.w #$3C96 ; $792C VRAM
#_02BDB9: STA.w $0C5C

#_02BDBC: LDA.w $0409
#_02BDBF: STA.w $0E10

#_02BDC2: LDA.w $040B
#_02BDC5: STA.w $0E12

#_02BDC8: LDX.w #$0001
#_02BDCB: JSR Draw_MoneyMagCount_toHUD

#_02BDCE: LDA.w #$00FF
#_02BDD1: STA.w $0CCD

#_02BDD4: LDA.w #$0007
#_02BDD7: STA.w $0CEC
#_02BDDA: STZ.w $0C64

#_02BDDD: SEP #$20

#_02BDDF: LDA.b #$A7
#_02BDE1: STA.w $0CC6

#_02BDE4: INC A
#_02BDE5: STA.w $0CC7

#_02BDE8: INC.w $0B3A

#_02BDEB: RTS

;===================================================================================================

IdleHUD_AllOpen:
#_02BDEC: RTS

;===================================================================================================
; Input of X is offset into $0CC6
;===================================================================================================
Draw_MoneyMagCount_toHUD:
#_02BDED: PHP

#_02BDEE: SEP #$30

#_02BDF0: PHX
#_02BDF1: JSL HEXtoDEC_rightaligned_tiles_rtl
#_02BDF5: PLX

#_02BDF6: LDY.b #$05

.next_tile
#_02BDF8: SEP #$20

#_02BDFA: LDA.w $0E00,Y
#_02BDFD: CMP.b #$CF
#_02BDFF: BNE .nonempty_tile

#_02BE01: LDA.b #$00

.nonempty_tile
#_02BE03: STA.w $0CC6,X

#_02BE06: INX
#_02BE07: DEY
#_02BE08: BPL .next_tile

#_02BE0A: PLP
#_02BE0B: RTS

;===================================================================================================

routine02BE0C:
#_02BE0C: PHP

#_02BE0D: SEP #$20
#_02BE0F: REP #$10

#_02BE11: PHB
#_02BE12: PHK
#_02BE13: PLB

#_02BE14: LDX.w #$0000

.next
#_02BE17: LDA.w data02C824,X
#_02BE1A: CMP.b #$FF
#_02BE1C: BEQ .branch02BE3C

#_02BE1E: CMP.w $07F5
#_02BE21: BNE .skip

#_02BE23: LDA.w data02C825,X
#_02BE26: CMP.w $07F6
#_02BE29: BEQ .branch02BE31

.skip
#_02BE2B: INX
#_02BE2C: INX
#_02BE2D: INX
#_02BE2E: INX
#_02BE2F: BRA .next

;---------------------------------------------------------------------------------------------------

.branch02BE31
#_02BE31: REP #$20

#_02BE33: LDA.w data02C826,X
#_02BE36: STA.w $0A12

#_02BE39: PLB

#_02BE3A: PLP
#_02BE3B: RTS

;---------------------------------------------------------------------------------------------------

.branch02BE3C
#_02BE3C: REP #$20

#_02BE3E: LDA.w #$0000
#_02BE41: STA.w $0A12

#_02BE44: PLB

#_02BE45: PLP
#_02BE46: RTS

;===================================================================================================

routine02BE47:
#_02BE47: PHP
#_02BE48: PHB
#_02BE49: PHK
#_02BE4A: PLB

#_02BE4B: SEP #$30
#_02BE4D: JSL DarkenScreen
#_02BE51: LDA.b #$FF
#_02BE53: STA.w $0A71
#_02BE56: LDA.b #$1E
#_02BE58: STA.w $0F74
#_02BE5B: STA.w TM
#_02BE5E: LDA.b #$03
#_02BE60: STA.w $0F76
#_02BE63: STA.w TS
#_02BE66: LDA.b #$50
#_02BE68: STA.w $0F7B
#_02BE6B: STA.w CGADSUB
#_02BE6E: LDA.b #$A1
#_02BE70: STA.w $0F00
#_02BE73: STA.w NMITIMEN
#_02BE76: LDA.b #$80
#_02BE78: STA.w $0F43
#_02BE7B: STA.w INIDISP
#_02BE7E: STZ.w $0F7F
#_02BE81: STZ.w $0F80
#_02BE84: LDA.b #$20
#_02BE86: STA.w $0A2C
#_02BE89: JSL Reset_OAMrelatedWRAM
#_02BE8D: JSR EnableFBlank_02
#_02BE90: JSR DisableNMI
#_02BE93: JSL ZeroVRAM_02
#_02BE97: JSL ZeroCGRAM_02

#_02BE9B: LDA.b #$00
#_02BE9D: JSR routine02C10F

#_02BEA0: LDA.b #$00
#_02BEA2: JSL routine02F609

#_02BEA6: LDA.b #$00
#_02BEA8: JSL routine02FC6E
#_02BEAC: JSL routine0F9AE1

;---------------------------------------------------------------------------------------------------

#_02BEB0: REP #$20

#_02BEB2: LDA.w #$3D83
#_02BEB5: STA.w $0A0B

#_02BEB8: LDA.w #$3DC4
#_02BEBB: STA.w $0A1A

#_02BEBE: LDA.w #$0018
#_02BEC1: STA.w $0A1E

#_02BEC4: LDA.w #$000C
#_02BEC7: STA.w $0A20

#_02BECA: LDA.w #$0002
#_02BECD: STA.w $0A1C

#_02BED0: JSR DisableFBlank_02
#_02BED3: JSR EnableNMI

#_02BED6: LDA.w #$0001
#_02BED9: JSL routine02CBD1

#_02BEDD: LDA.w #$0007
#_02BEE0: JSL routine02CBD1
#_02BEE4: JSL routine00A17E

#_02BEE8: PLB

#_02BEE9: PLP
#_02BEEA: RTL

;===================================================================================================

routine02BEEB:
#_02BEEB: PHP
#_02BEEC: PHB
#_02BEED: PHK
#_02BEEE: PLB
#_02BEEF: JSL DarkenScreen
#_02BEF3: JSL Reset_OAMrelatedWRAM

#_02BEF7: SEP #$30
#_02BEF9: JSR routine02C07B
#_02BEFC: JSR EnableFBlank_02
#_02BEFF: JSR DisableNMI
#_02BF02: LDA.b #$81
#_02BF04: STA.w $0F00
#_02BF07: STA.w NMITIMEN
#_02BF0A: LDA.b #$FF
#_02BF0C: STA.w $0F7F
#_02BF0F: LDA.b #$01
#_02BF11: JSR routine02C10F
#_02BF14: JSL routine028DB7
#_02BF18: JSR Desi_TM23O_TS2
#_02BF1B: JSR EnableNMI
#_02BF1E: JSR routine02B75C
#_02BF21: JSR routine02BC34
#_02BF24: JSL routine028A36
#_02BF28: JSR routine028659
#_02BF2B: JSL AddSelfAsVectorAndMakeSpace
#_02BF2F: JSL routine02813F
#_02BF33: JSL BrightenScreen
#_02BF37: JSR routine02B999

#_02BF3A: SEP #$20
#_02BF3C: LDA.b #$FF
#_02BF3E: STA.w $0B35
#_02BF41: JSR routine02AF6A
#_02BF44: PLB
#_02BF45: PLP
#_02BF46: RTL

;===================================================================================================

Overworld_EnactInteraction:
#_02BF47: REP #$30
#_02BF49: JSL routine02BE47
#_02BF4D: JSR routine02BE0C
#_02BF50: LDA.w $0A12
#_02BF53: CMP.w #$FFFF
#_02BF56: BNE .branch02BF5B

#_02BF58: JMP .branch02BF63

.branch02BF5B
#_02BF5B: JSL LoadClassyMessage
#_02BF5F: JSL routine038204

.branch02BF63
#_02BF63: SEP #$30
#_02BF65: LDA.w $0C4F
#_02BF68: BEQ .branch02BF6C

#_02BF6A: BPL .branch02BF71

.branch02BF6C
#_02BF6C: JSL routine02BEEB
#_02BF70: RTS

.branch02BF71
#_02BF71: JSL DarkenScreen
#_02BF75: JSL Reset_OAMrelatedWRAM

#_02BF79: SEP #$30
#_02BF7B: JSR routine02C07B
#_02BF7E: JSR EnableFBlank_02
#_02BF81: JSR DisableNMI
#_02BF84: LDA.b #$81
#_02BF86: STA.w $0F00
#_02BF89: STA.w NMITIMEN
#_02BF8C: JSL ZeroVRAM_02
#_02BF90: RTS

;===================================================================================================

routine02BF91:
#_02BF91: SEP #$30
#_02BF93: JSL DarkenScreen
#_02BF97: LDA.b #$20
#_02BF99: STA.w $0A2C
#_02BF9C: LDA.b #$1E
#_02BF9E: STA.w $0F74
#_02BFA1: STA.w TM
#_02BFA4: LDA.b #$FF
#_02BFA6: STA.w $0A71
#_02BFA9: JSL Reset_OAMrelatedWRAM
#_02BFAD: JSR EnableFBlank_02
#_02BFB0: JSR DisableNMI
#_02BFB3: JSL ZeroVRAM_02
#_02BFB7: LDA.b #$00
#_02BFB9: JSR routine02C10F
#_02BFBC: LDA.b #$00
#_02BFBE: JSL routine02F609
#_02BFC2: LDA.b #$00
#_02BFC4: JSL routine02FC6E
#_02BFC8: JSL routine0F9AE1
#_02BFCC: JSR EnableNMI
#_02BFCF: JSR DisableFBlank_02
#_02BFD2: STZ.w $0F7F
#_02BFD5: STZ.w $0F80
#_02BFD8: JSL routine02E87C
#_02BFDC: LDA.b #$01
#_02BFDE: JSL routine02CBD1
#_02BFE2: LDA.b #$07
#_02BFE4: JSL routine02CBD1
#_02BFE8: JSL routine00A17E
#_02BFEC: JSL BrightenScreen
#_02BFF0: JSL routine02C03A
#_02BFF4: JSL DarkenScreen

#_02BFF8: SEP #$30
#_02BFFA: LDA.b #$FF
#_02BFFC: STA.w $0F7F
#_02BFFF: JSL Reset_OAMrelatedWRAM
#_02C003: JSR routine02C07B
#_02C006: JSR EnableFBlank_02
#_02C009: JSR DisableNMI
#_02C00C: LDA.b #$01
#_02C00E: JSR routine02C10F
#_02C011: JSL routine028DB7
#_02C015: JSR Desi_TM23O_TS2
#_02C018: JSR EnableNMI
#_02C01B: JSR routine02B75C
#_02C01E: JSR routine02BC34
#_02C021: JSR routine028659
#_02C024: JSL AddSelfAsVectorAndMakeSpace
#_02C028: JSL BrightenScreen
#_02C02C: JSR routine02B999

#_02C02F: SEP #$20
#_02C031: LDA.b #$FF
#_02C033: STA.w $0B35
#_02C036: JSR routine02AF6A
#_02C039: RTS

;===================================================================================================

routine02C03A:
#_02C03A: PHP
#_02C03B: SEP #$30
#_02C03D: LDA.w $0B16
#_02C040: LSR A
#_02C041: STA.w $040D
#_02C044: STZ.w $0454
#_02C047: LDA.w $040F
#_02C04A: AND.b #$F0
#_02C04C: CMP.b #$90
#_02C04E: BCC .branch02C058

#_02C050: LDA.b #$80
#_02C052: SEC
#_02C053: SBC.w $040F
#_02C056: AND.b #$70

.branch02C058
#_02C058: LSR A
#_02C059: LSR A
#_02C05A: LSR A
#_02C05B: LSR A
#_02C05C: STA.w $0714
#_02C05F: PHB
#_02C060: LDA.b #$01 ; TODO make label
#_02C062: PHA
#_02C063: PLB
#_02C064: JSL routine0F850B
#_02C068: JSL routine00A63C
#_02C06C: JSL routine00A840
#_02C070: JSL UpdateDirTilemap
#_02C074: JSL GameMenu
#_02C078: PLB
#_02C079: PLP
#_02C07A: RTL

;===================================================================================================

routine02C07B:
#_02C07B: SEP #$20
#_02C07D: LDA.b #$80
#_02C07F: STA.w $0F0E
#_02C082: JSL AddSelfAsVector
#_02C086: JSL AddSelfAsVector
#_02C08A: JSL AddSelfAsVector
#_02C08E: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine02C08F:
#_02C08F: REP #$30
#_02C091: LDA.w #$0800
#_02C094: STA.w VMADDL
#_02C097: LDX.w #$0000

.branch02C09A
#_02C09A: LDA.w #$2000
#_02C09D: STA.w VMDATAL
#_02C0A0: INX
#_02C0A1: INX
#_02C0A2: CPX.w #$1000
#_02C0A5: BCC .branch02C09A

#_02C0A7: LDA.w #$001F
#_02C0AA: STA.w TM
#_02C0AD: RTS

EnableFBlank_02:
#_02C0AE: PHA
#_02C0AF: PHP
#_02C0B0: SEP #$20
#_02C0B2: LDA.b #$80
#_02C0B4: STA.w INIDISP
#_02C0B7: STA.w $0F43
#_02C0BA: PLP
#_02C0BB: PLA
#_02C0BC: RTS

DisableFBlank_02:
#_02C0BD: PHA
#_02C0BE: PHP
#_02C0BF: SEP #$20
#_02C0C1: LDA.b #$00
#_02C0C3: STA.w INIDISP
#_02C0C6: STA.w $0F43
#_02C0C9: PLP
#_02C0CA: PLA
#_02C0CB: RTS

Desi_TM23O_TS2:
#_02C0CC: PHP ; Sets these to main/subscreen

#_02C0CD: SEP #$30
#_02C0CF: LDA.b #$16
#_02C0D1: STA.w TM
#_02C0D4: LDA.b #$02
#_02C0D6: STA.w TS
#_02C0D9: PLP
#_02C0DA: RTS

ZeroVRAM_02:
#_02C0DB: PHP
#_02C0DC: REP #$30
#_02C0DE: LDA.w #$0000
#_02C0E1: STA.w VMADDL
#_02C0E4: LDX.w #$7FFF

.branch02C0E7
#_02C0E7: LDA.w #$0000
#_02C0EA: STA.w VMDATAL
#_02C0ED: DEX
#_02C0EE: BPL .branch02C0E7

#_02C0F0: PLP
#_02C0F1: RTL

ZeroCGRAM_02:
#_02C0F2: PHP
#_02C0F3: SEP #$30
#_02C0F5: LDA.b #$00
#_02C0F7: STA.w CGADD
#_02C0FA: LDX.b #$00

.branch02C0FC
#_02C0FC: LDA.b #$00
#_02C0FE: STA.w CGDATA
#_02C101: LDA.b #$00
#_02C103: STA.w CGDATA
#_02C106: INX
#_02C107: BNE .branch02C0FC

#_02C109: PLP
#_02C10A: RTL

;===================================================================================================

routine02C10F_long:
#_02C10B: JSR routine02C10F
#_02C10E: RTL

;===================================================================================================

routine02C10F:
#_02C10F: PHP
#_02C110: REP #$30
#_02C112: AND.w #$00FF
#_02C115: ASL A
#_02C116: STA.w $0E00
#_02C119: ASL A
#_02C11A: ASL A
#_02C11B: CLC
#_02C11C: ADC.w $0E00
#_02C11F: TAY
#_02C120: LDA.w data02C1BF,Y
#_02C123: STA.w OAMADDR

#_02C126: SEP #$20
#_02C128: LDA.w data02C1C1,Y
#_02C12B: STA.w OBSEL
#_02C12E: STA.w $0F44
#_02C131: LDA.w data02C1C2,Y
#_02C134: STA.w BGMODE
#_02C137: STA.w $0F45
#_02C13A: LDA.w data02C1C3,Y
#_02C13D: STA.w BG12NBA
#_02C140: STA.w $0F4B
#_02C143: LDA.w data02C1C4,Y
#_02C146: STA.w BG34NBA
#_02C149: STA.w $0F4C
#_02C14C: LDA.w data02C1C5,Y
#_02C14F: STA.w BG1SC
#_02C152: STA.w $0F47
#_02C155: LDA.w data02C1C6,Y
#_02C158: STA.w BG2SC
#_02C15B: STA.w $0F48
#_02C15E: LDA.w data02C1C7,Y
#_02C161: STA.w BG3SC
#_02C164: STA.w $0F49
#_02C167: LDA.w data02C1C8,Y
#_02C16A: STA.w BG4SC
#_02C16D: STA.w $0F4A
#_02C170: LDA.b #$00
#_02C172: STA.w BG1HOFS
#_02C175: STA.w BG1HOFS
#_02C178: STA.w BG2HOFS
#_02C17B: STA.w BG2HOFS
#_02C17E: STA.w BG3HOFS
#_02C181: STA.w BG3HOFS
#_02C184: STA.w BG4HOFS
#_02C187: STA.w BG4HOFS
#_02C18A: STA.w BG1VOFS
#_02C18D: STA.w BG1VOFS
#_02C190: STA.w BG2VOFS
#_02C193: STA.w BG2VOFS
#_02C196: STA.w BG3VOFS
#_02C199: STA.w BG3VOFS
#_02C19C: STA.w BG4VOFS
#_02C19F: STA.w BG4VOFS
#_02C1A2: LDX.w #$0000
#_02C1A5: STX.w $0F4D
#_02C1A8: STX.w $0F4F
#_02C1AB: STX.w $0F51
#_02C1AE: STX.w $0F53
#_02C1B1: STX.w $0F55
#_02C1B4: STX.w $0F57
#_02C1B7: STX.w $0F59
#_02C1BA: STX.w $0F5B
#_02C1BD: PLP
#_02C1BE: RTS

data02C1BF:
#_02C1BF: dw $0000

data02C1C1:
#_02C1C1: db $60

data02C1C2:
#_02C1C2: db $09

data02C1C3:
#_02C1C3: db $44

data02C1C4:
#_02C1C4: db $22

data02C1C5:
#_02C1C5: db $38

data02C1C6:
#_02C1C6: db $28

data02C1C7:
#_02C1C7: db $3C

data02C1C8:
#_02C1C8: db $34,$00,$00,$60,$09,$43,$22,$38
#_02C1D0: db $28,$3C,$34

; TODO POSSIBLY UNUSED ROUTINE
routine02C1D3:
#_02C1D3: JSL Reset_OAMrelatedWRAM

#_02C1D7: REP #$30
#_02C1D9: LDA.w #$3D83
#_02C1DC: STA.w $0A0B

#_02C1DF: SEP #$20
#_02C1E1: LDA.b #$1A
#_02C1E3: STA.w $0A0D
#_02C1E6: LDA.b #$10
#_02C1E8: STA.w $0A0F
#_02C1EB: LDA.b #$11
#_02C1ED: STA.w $0A11
#_02C1F0: LDA.b #$01
#_02C1F2: JSL routine02CBD1
#_02C1F6: LDA.b #$07
#_02C1F8: JSL routine02CBD1
#_02C1FC: LDA.b #$03
#_02C1FE: JSL InitializeTextBoxToSizeForNewMessage
#_02C202: JSL routine00A056

#_02C206: REP #$30
#_02C208: LDA.w $0A0B
#_02C20B: CLC
#_02C20C: ADC.w #$0042
#_02C20F: STA.w $0102
#_02C212: CLC
#_02C213: ADC.w #$0040
#_02C216: STA.w $011C
#_02C219: CLC
#_02C21A: ADC.w #$0040
#_02C21D: STA.w $0136
#_02C220: LDA.w #$000B
#_02C223: STA.w $0104
#_02C226: STA.w $011E
#_02C229: STA.w $0138
#_02C22C: LDY.w #$0000
#_02C22F: LDX.w #$0000

.branch02C232
#_02C232: LDA.w data02C3CB,Y
#_02C235: AND.w #$00FF
#_02C238: ORA.w #$2000
#_02C23B: STA.w $0106,X
#_02C23E: LDA.w data02C3D6,Y
#_02C241: AND.w #$00FF
#_02C244: ORA.w #$2000
#_02C247: STA.w $0120,X
#_02C24A: LDA.w data02C3E1,Y
#_02C24D: AND.w #$00FF
#_02C250: ORA.w #$2000
#_02C253: STA.w $013A,X
#_02C256: INY
#_02C257: INX
#_02C258: INX
#_02C259: CPY.w #$000B
#_02C25C: BNE .branch02C232

#_02C25E: JSL AddSelfAsVectorAndMakeSpace
#_02C262: LDA.w $07F5
#_02C265: STA.w $0E10
#_02C268: STZ.w $0E12
#_02C26B: JSL routine03D7D3
#_02C26F: LDA.w $0E01
#_02C272: AND.w #$00FF
#_02C275: ORA.w #$2000
#_02C278: STA.w $012C
#_02C27B: LDA.w $0E00
#_02C27E: AND.w #$00FF
#_02C281: ORA.w #$2000
#_02C284: STA.w $012E
#_02C287: LDA.w $07F6
#_02C28A: STA.w $0E10
#_02C28D: STZ.w $0E12
#_02C290: JSL routine03D7D3
#_02C294: LDA.w $0E01
#_02C297: AND.w #$00FF
#_02C29A: ORA.w #$2000
#_02C29D: STA.w $0132
#_02C2A0: LDA.w $0E00
#_02C2A3: AND.w #$00FF
#_02C2A6: ORA.w #$2000
#_02C2A9: STA.w $0134
#_02C2AC: JSR OverworldMovement_GetIndexFromCoords
#_02C2AF: LDA.w $0B2E
#_02C2B2: STA.w $0E10
#_02C2B5: STZ.w $0E12
#_02C2B8: JSL routine03D7D3
#_02C2BC: LDA.w $0E01
#_02C2BF: AND.w #$00FF
#_02C2C2: ORA.w #$2000
#_02C2C5: STA.w $0146
#_02C2C8: LDA.w $0E00
#_02C2CB: AND.w #$00FF
#_02C2CE: ORA.w #$2000
#_02C2D1: STA.w $0148
#_02C2D4: LDA.w #$0003
#_02C2D7: STA.w $0100
#_02C2DA: JSL RunFramesUntil0100IsFlagged
#_02C2DE: STZ.w $0E00

.branch02C2E1
#_02C2E1: REP #$20
#_02C2E3: JSL AddSelfAsVectorAndMakeSpace
#_02C2E7: LDA.w $0F2D
#_02C2EA: BEQ .branch02C31A

#_02C2EC: LDA.w $0F2D
#_02C2EF: AND.w #$0200
#_02C2F2: BEQ .branch02C2F7

#_02C2F4: DEC.w $0E0C

.branch02C2F7
#_02C2F7: LDA.w $0F2D
#_02C2FA: AND.w #$0100
#_02C2FD: BEQ .branch02C302

#_02C2FF: INC.w $0E0C

.branch02C302
#_02C302: LDA.w $0F2B
#_02C305: AND.w #$0800
#_02C308: BEQ .branch02C30F

#_02C30A: INC.w $0E0C
#_02C30D: BRA .branch02C31A

.branch02C30F
#_02C30F: LDA.w $0F2B
#_02C312: AND.w #$0400
#_02C315: BEQ .branch02C31A

#_02C317: DEC.w $0E0C

.branch02C31A
#_02C31A: LDA.w $0F2B
#_02C31D: AND.w #$8000
#_02C320: BEQ .branch02C323

#_02C322: RTS

.branch02C323
#_02C323: LDA.w $0F2B
#_02C326: AND.w #$0080
#_02C329: BEQ .branch02C359

#_02C32B: LDA.w $0E0C
#_02C32E: AND.w #$00FF
#_02C331: PHA
#_02C332: AND.w #$0007
#_02C335: TAX
#_02C336: PLA
#_02C337: LSR A
#_02C338: LSR A
#_02C339: LSR A
#_02C33A: TAY
#_02C33B: LDA.w $07C0,Y
#_02C33E: EOR.w data02C3EC,X
#_02C341: AND.w data02C3EC,X
#_02C344: STA.w $0E0E
#_02C347: LDA.w $07C0,Y
#_02C34A: AND.w data02C3F4,X
#_02C34D: ORA.w $0E0E
#_02C350: PHA
#_02C351: TYA
#_02C352: TAX
#_02C353: PLA

#_02C354: SEP #$20
#_02C356: STA.w $07C0,X

.branch02C359
#_02C359: REP #$20
#_02C35B: LDA.w $0E0C
#_02C35E: STA.w $0E10
#_02C361: STZ.w $0E12
#_02C364: JSL routine03D7D3
#_02C368: LDA.w $0E01
#_02C36B: AND.w #$00FF
#_02C36E: ORA.w #$2000
#_02C371: STA.w $010C
#_02C374: LDA.w $0E00
#_02C377: AND.w #$00FF
#_02C37A: ORA.w #$2000
#_02C37D: STA.w $010E
#_02C380: LDA.w $0E0C
#_02C383: AND.w #$0007
#_02C386: TAX
#_02C387: LDA.w $0E0C
#_02C38A: AND.w #$00FF
#_02C38D: LSR A
#_02C38E: LSR A
#_02C38F: LSR A
#_02C390: TAY
#_02C391: LDA.w $07C0,Y
#_02C394: AND.w data02C3EC,X
#_02C397: AND.w #$00FF
#_02C39A: BEQ .branch02C3B0

#_02C39C: LDA.w #$2019
#_02C39F: STA.w $0112
#_02C3A2: LDA.w #$2018
#_02C3A5: STA.w $0114
#_02C3A8: LDA.w #$20CF
#_02C3AB: STA.w $0116
#_02C3AE: BRA .branch02C3C2

.branch02C3B0
#_02C3B0: LDA.w #$2019
#_02C3B3: STA.w $0112
#_02C3B6: LDA.w #$2010
#_02C3B9: STA.w $0114
#_02C3BC: LDA.w #$2010
#_02C3BF: STA.w $0116

.branch02C3C2
#_02C3C2: LDA.w #$0001
#_02C3C5: STA.w $0100
#_02C3C8: JMP .branch02C2E1

data02C3CB:
#_02C3CB: db $0C,$13,$1E,$CF,$CF,$9A,$CF,$CF
#_02C3D3: db $CF,$CF,$CF

data02C3D6:
#_02C3D6: db $0B,$0E,$1C,$1D,$CF,$9A,$01,$01
#_02C3DE: db $93,$01,$01

data02C3E1:
#_02C3E1: db $0B,$1C,$0F,$0B,$CF,$9A,$01,$01
#_02C3E9: db $CF,$CF,$CF

data02C3EC:
#_02C3EC: db $01,$02,$04,$08,$10,$20,$40,$80

data02C3F4:
#_02C3F4: db $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F

routine02C3FC:
#_02C3FC: SEP #$20
#_02C3FE: REP #$10
#_02C400: PHB
#_02C401: PHK
#_02C402: PLB
#_02C403: JSL DarkenScreen
#_02C407: LDA.b #$04
#_02C409: STA.w $0F74
#_02C40C: STA.w TM
#_02C40F: LDA.b #$FF
#_02C411: STA.w $0F7F
#_02C414: JSR routine02C07B
#_02C417: JSR EnableFBlank_02
#_02C41A: JSR DisableNMI
#_02C41D: JSL Reset_OAMrelatedWRAM

#_02C421: REP #$20
#_02C423: LDA.w #$3C00
#_02C426: STA.w VMADDL
#_02C429: LDA.w #$0000
#_02C42C: LDX.w #$03FF

.branch02C42F
#_02C42F: STA.w VMDATAL
#_02C432: DEX
#_02C433: BPL .branch02C42F

#_02C435: SEP #$20
#_02C437: LDA.b #$A1
#_02C439: STA.w $0F00
#_02C43C: JSR DisableFBlank_02
#_02C43F: JSR EnableNMI

#_02C442: REP #$20
#_02C444: LDA.w #$3CC5
#_02C447: STA.w $0A0B

#_02C44A: SEP #$20
#_02C44C: LDA.b #$16
#_02C44E: STA.w $0A0D
#_02C451: LDA.b #$16
#_02C453: STA.w $0A0F
#_02C456: LDA.b #$11
#_02C458: STA.w $0A11
#_02C45B: JSL routine02BA95

#_02C45F: REP #$30
#_02C461: LDA.w #$3D07
#_02C464: STA.w $0A0B

#_02C467: SEP #$20
#_02C469: LDA.b #$12
#_02C46B: STA.w $0A0D
#_02C46E: LDA.b #$12
#_02C470: STA.w $0A0F
#_02C473: LDA.b #$12
#_02C475: STA.w $0A11
#_02C478: JSL routine02BA95
#_02C47C: JSL BrightenScreen

#_02C480: REP #$30
#_02C482: JSR routine02C72C
#_02C485: LDA.w #$3CE8
#_02C488: STA.w $0102
#_02C48B: LDA.w #$0001
#_02C48E: STA.w $0100
#_02C491: JSL AddSelfAsVectorAndMakeSpace
#_02C495: JSR routine02C72C
#_02C498: LDA.w #$3D26
#_02C49B: STA.w $0102
#_02C49E: LDA.w #$8001
#_02C4A1: STA.w $0100
#_02C4A4: JSL AddSelfAsVectorAndMakeSpace
#_02C4A8: LDY.w #$0000
#_02C4AB: LDX.w #$0000

.branch02C4AE
#_02C4AE: LDA.w data02C722,Y
#_02C4B1: AND.w #$00FF
#_02C4B4: ORA.w #$2000
#_02C4B7: STA.w $0106,X
#_02C4BA: INX
#_02C4BB: INX
#_02C4BC: INY
#_02C4BD: CPY.w #$000A
#_02C4C0: BNE .branch02C4AE

#_02C4C2: LDA.w #$3F48
#_02C4C5: STA.w $0102
#_02C4C8: LDA.w #$000A
#_02C4CB: STA.w $0104
#_02C4CE: LDA.w #$0001
#_02C4D1: STA.w $0100
#_02C4D4: JSL AddSelfAsVectorAndMakeSpace
#_02C4D8: LDA.w #$3D08
#_02C4DB: STA.w $0102
#_02C4DE: LDA.w #$0010
#_02C4E1: STA.w $0104
#_02C4E4: LDY.w #$0000

.branch02C4E7
#_02C4E7: PHY
#_02C4E8: LDA.w $07C0,Y
#_02C4EB: STA.w $0E00
#_02C4EE: LDA.w $07C1,Y
#_02C4F1: STA.w $0E02
#_02C4F4: LDX.w #$0000

.branch02C4F7
#_02C4F7: LSR.w $0E02
#_02C4FA: ROR.w $0E00
#_02C4FD: BCC .branch02C504

#_02C4FF: LDA.w #$20B1
#_02C502: BRA .branch02C507

.branch02C504
#_02C504: LDA.w #$2093

.branch02C507
#_02C507: STA.w $0106,X
#_02C50A: INX
#_02C50B: INX
#_02C50C: CPX.w #$0020
#_02C50F: BNE .branch02C4F7

#_02C511: LDA.w $0102
#_02C514: CLC
#_02C515: ADC.w #$0020
#_02C518: STA.w $0102
#_02C51B: LDA.w #$0001
#_02C51E: STA.w $0100
#_02C521: JSL AddSelfAsVectorAndMakeSpace
#_02C525: PLY
#_02C526: INY
#_02C527: INY
#_02C528: CPY.w #$0020
#_02C52B: BNE .branch02C4E7

#_02C52D: SEP #$20
#_02C52F: LDA.b #$06
#_02C531: STA.w $09F4
#_02C534: LDA.b #$0F
#_02C536: STA.w $09F0
#_02C539: STA.w $09F1
#_02C53C: STA.w $09FB
#_02C53F: STA.w $09FC
#_02C542: STA.w $09FD
#_02C545: STA.w $09FE
#_02C548: STA.w $09FF
#_02C54B: STA.w $0A00
#_02C54E: STA.w $0A01
#_02C551: STA.w $0A02
#_02C554: STA.w $0A03
#_02C557: STA.w $0A04
#_02C55A: STA.w $0A05
#_02C55D: STA.w $0A06
#_02C560: STA.w $0A07
#_02C563: STA.w $0A08
#_02C566: STA.w $0A09
#_02C569: STA.w $0A0A
#_02C56C: STZ.w $09F3
#_02C56F: STZ.w $09F2
#_02C572: LDA.b #$14
#_02C574: STA.w $0F74
#_02C577: STA.w TM
#_02C57A: LDA.b #$10
#_02C57C: STA.w $0F76
#_02C57F: STA.w TS
#_02C582: LDA.b #$02
#_02C584: STA.w CGWSEL
#_02C587: LDA.b #$04
#_02C589: STA.w CGADSUB
#_02C58C: JSL routine02C98F
#_02C590: JSL routine02C9D5

#_02C594: REP #$20

.branch02C596
#_02C596: JSL AddSelfAsVectorAndMakeSpace
#_02C59A: JSL routine02CA4B

#_02C59E: REP #$20
#_02C5A0: JSR routine02C61F
#_02C5A3: LDA.w $0F2B
#_02C5A6: AND.w #$0080
#_02C5A9: BEQ .branch02C5AE

#_02C5AB: JSR routine02C68B

.branch02C5AE
#_02C5AE: LDA.w $0F2D
#_02C5B1: AND.w #$8000
#_02C5B4: BEQ .branch02C596

#_02C5B6: JSL DarkenScreen

#_02C5BA: SEP #$20
#_02C5BC: LDA.b #$1E
#_02C5BE: STA.w $0F74
#_02C5C1: STA.w TM
#_02C5C4: LDA.b #$16
#_02C5C6: JSL routine02F609

#_02C5CA: REP #$20
#_02C5CC: LDA.w #$0003
#_02C5CF: STA.w $0A2A
#_02C5D2: LDA.w #$3D83
#_02C5D5: STA.w $0A0B
#_02C5D8: LDA.w #$3DC4
#_02C5DB: STA.w $0A1A
#_02C5DE: LDA.w #$001A
#_02C5E1: STA.w $0A0D
#_02C5E4: LDA.w #$0010
#_02C5E7: STA.w $0A0F

#_02C5EA: SEP #$20
#_02C5EC: LDA.b #$11
#_02C5EE: STA.w $0A11
#_02C5F1: STZ.w $0F7F
#_02C5F4: STZ.w $0F80
#_02C5F7: LDA.b #$01
#_02C5F9: JSL routine02CBD1
#_02C5FD: LDA.b #$07
#_02C5FF: JSL routine02CBD1
#_02C603: JSL Reset_OAMrelatedWRAM
#_02C607: JSL BrightenScreen
#_02C60B: JSL routine00A17E
#_02C60F: JSL routine0F84F6
#_02C613: LDA.b #$03
#_02C615: JSL InitializeTextBoxToSizeForNewMessage
#_02C619: JSL routine00A056
#_02C61D: PLB
#_02C61E: RTL

;===================================================================================================

routine02C61F:
#_02C61F: REP #$30
#_02C621: LDA.w #$3F4F
#_02C624: STA.w $0102
#_02C627: LDA.w #$0006
#_02C62A: STA.w $0104
#_02C62D: LDA.w $09F3
#_02C630: AND.w #$000F
#_02C633: INC A
#_02C634: ORA.w #$2000
#_02C637: STA.w $0106
#_02C63A: LDA.w $09F2
#_02C63D: AND.w #$000F
#_02C640: INC A
#_02C641: ORA.w #$2000
#_02C644: STA.w $0108
#_02C647: LDA.w #$209A
#_02C64A: STA.w $010A
#_02C64D: LDA.w $09F2
#_02C650: AND.w #$000F
#_02C653: ASL A
#_02C654: TAX
#_02C655: LDA.w $09F3
#_02C658: AND.w #$000F
#_02C65B: ASL A
#_02C65C: TAY
#_02C65D: LDA.w $07C0,Y
#_02C660: AND.w data02C702,X
#_02C663: BEQ .branch02C66A

#_02C665: LDY.w #$0000
#_02C668: BRA .branch02C66D

.branch02C66A
#_02C66A: LDY.w #$0003

.branch02C66D
#_02C66D: LDX.w #$0000

.branch02C670
#_02C670: LDA.w data02C6FC,Y
#_02C673: AND.w #$00FF
#_02C676: ORA.w #$2000
#_02C679: STA.w $010C,X
#_02C67C: INY
#_02C67D: INX
#_02C67E: INX
#_02C67F: CPX.w #$0006
#_02C682: BNE .branch02C670

#_02C684: LDA.w #$0001
#_02C687: STA.w $0100
#_02C68A: RTS

;===================================================================================================

routine02C68B:
#_02C68B: LDA.w $09F3
#_02C68E: AND.w #$000F
#_02C691: ASL A
#_02C692: ASL A
#_02C693: ASL A
#_02C694: ASL A
#_02C695: ASL A
#_02C696: CLC
#_02C697: ADC.w #$3D28
#_02C69A: STA.w $0E02
#_02C69D: LDA.w $09F2
#_02C6A0: AND.w #$000F
#_02C6A3: CLC
#_02C6A4: ADC.w $0E02
#_02C6A7: STA.w $0102
#_02C6AA: LDA.w #$0001
#_02C6AD: STA.w $0104
#_02C6B0: LDA.w $09F3
#_02C6B3: AND.w #$000F
#_02C6B6: ASL A
#_02C6B7: TAY
#_02C6B8: LDA.w $09F2
#_02C6BB: AND.w #$000F
#_02C6BE: ASL A
#_02C6BF: TAX
#_02C6C0: LDA.w $07C0,Y
#_02C6C3: EOR.w #$FFFF
#_02C6C6: AND.w data02C702,X
#_02C6C9: STA.w $0E00
#_02C6CC: LDA.w data02C702,X
#_02C6CF: EOR.w #$FFFF
#_02C6D2: STA.w $0E02
#_02C6D5: LDA.w $07C0,Y
#_02C6D8: AND.w $0E02
#_02C6DB: ORA.w $0E00
#_02C6DE: PHX
#_02C6DF: TYX
#_02C6E0: STA.w $07C0,X
#_02C6E3: TXY
#_02C6E4: PLX
#_02C6E5: AND.w data02C702,X
#_02C6E8: BEQ .branch02C6EF

#_02C6EA: LDA.w #$20B1
#_02C6ED: BRA .branch02C6F2

.branch02C6EF
#_02C6EF: LDA.w #$2093

.branch02C6F2
#_02C6F2: STA.w $0106
#_02C6F5: LDA.w #$0001
#_02C6F8: STA.w $0100
#_02C6FB: RTS

data02C6FC:
#_02C6FC: dw $1819,$19CF,$1010

data02C702:
#_02C702: dw $0001,$0002,$0004,$0008
#_02C70A: dw $0010,$0020,$0040,$0080
#_02C712: dw $0100,$0200,$0400,$0800
#_02C71A: dw $1000,$2000,$4000,$8000

data02C722:
#_02C722: dw $130C,$CF1E,$1918,$CF9B
#_02C72A: dw $9ACF

routine02C72C:
#_02C72C: REP #$30
#_02C72E: LDA.w #$0010
#_02C731: STA.w $0104
#_02C734: LDX.w #$0000
#_02C737: LDY.w #$0000

.branch02C73A
#_02C73A: TYA
#_02C73B: INC A
#_02C73C: ORA.w #$2000
#_02C73F: STA.w $0106,X
#_02C742: INX
#_02C743: INX
#_02C744: INY
#_02C745: CPY.w #$0010
#_02C748: BNE .branch02C73A

#_02C74A: RTS

;===================================================================================================

routine02C74B:
#_02C74B: SEP #$30
#_02C74D: JSL DarkenScreen
#_02C751: STZ.w $0F7F
#_02C754: LDA.b #$02
#_02C756: STA.w $0F80
#_02C759: LDA.b #$FF
#_02C75B: STA.w $0A71
#_02C75E: LDA.b #$20
#_02C760: STA.w $0A2C
#_02C763: LDA.b #$1E
#_02C765: STA.w $0F74
#_02C768: STA.w TM
#_02C76B: JSL Reset_OAMrelatedWRAM
#_02C76F: JSR EnableFBlank_02
#_02C772: JSR DisableNMI
#_02C775: JSL ZeroVRAM_02
#_02C779: LDA.b #$00
#_02C77B: JSR routine02C10F
#_02C77E: LDA.b #$00
#_02C780: JSL routine02F609
#_02C784: LDA.b #$00
#_02C786: JSL routine02FC6E
#_02C78A: JSL routine0F9AE1
#_02C78E: JSR EnableNMI
#_02C791: JSR DisableFBlank_02

#_02C794: SEP #$30
#_02C796: LDA.b #$00
#_02C798: STA.w $0A6B
#_02C79B: LDA.b #$FF
#_02C79D: STA.w $0A6D
#_02C7A0: LDA.b #$0A
#_02C7A2: STA.w $0B29
#_02C7A5: JSL routine02E90D

#_02C7A9: SEP #$30
#_02C7AB: LDA.b #$01
#_02C7AD: JSL VRAM_From_7FXXXX
#_02C7B1: JSL AddSelfAsVectorAndMakeSpace
#_02C7B5: LDA.b #$19
#_02C7B7: JSL routine02FC6E
#_02C7BB: LDA.b #$01
#_02C7BD: JSL routine02CBD1
#_02C7C1: LDA.b #$07
#_02C7C3: JSL routine02CBD1
#_02C7C7: JSL routine00A17E

#_02C7CB: REP #$30
#_02C7CD: LDA.w #$8076
#_02C7D0: STA.w $0A12
#_02C7D3: JSL LoadClassyMessage
#_02C7D7: JSL routine038204
#_02C7DB: JSL DarkenScreen

#_02C7DF: SEP #$30
#_02C7E1: LDA.b #$FF
#_02C7E3: STA.w $0F7F
#_02C7E6: STZ.w $0F80
#_02C7E9: JSL Reset_OAMrelatedWRAM
#_02C7ED: JSR routine02C07B
#_02C7F0: JSR EnableFBlank_02
#_02C7F3: JSR DisableNMI
#_02C7F6: LDA.b #$01
#_02C7F8: JSR routine02C10F
#_02C7FB: JSL routine028DB7
#_02C7FF: JSR Desi_TM23O_TS2
#_02C802: JSR EnableNMI
#_02C805: JSR routine02B75C
#_02C808: JSR routine02BC34
#_02C80B: JSR routine028659
#_02C80E: JSL AddSelfAsVectorAndMakeSpace
#_02C812: JSL BrightenScreen
#_02C816: JSR routine02B999

#_02C819: SEP #$20
#_02C81B: LDA.b #$FF
#_02C81D: STA.w $0B35
#_02C820: JSR routine02AF6A
#_02C823: RTS

data02C824:
#_02C824: db $2F

data02C825:
#_02C825: db $87

data02C826:
#_02C826: db $C7,$02,$32,$86,$C7,$02,$35,$86
#_02C82E: db $C7,$02,$3C,$86,$C7,$02,$3F,$86
#_02C836: db $C7,$02,$2F,$8C,$C7,$02,$40,$89
#_02C83E: db $C7,$02,$2F,$93,$C7,$02,$40,$90
#_02C846: db $C7,$02,$3B,$94,$C7,$02,$32,$8A
#_02C84E: db $C8,$02,$34,$94,$C4,$02,$39,$8D
#_02C856: db $C6,$02,$3A,$8F,$C9,$02,$3E,$8F
#_02C85E: db $CC,$02,$4F,$87,$C7,$02,$4F,$8C
#_02C866: db $C7,$02,$59,$86,$C7,$02,$62,$86
#_02C86E: db $C7,$02,$69,$86,$C7,$02,$6F,$91
#_02C876: db $C7,$02,$70,$94,$C7,$02,$70,$97
#_02C87E: db $C7,$02,$62,$A6,$C7,$02,$70,$A4
#_02C886: db $71,$40,$6D,$A9,$71,$40,$68,$A9
#_02C88E: db $71,$40,$65,$A9,$C7,$02,$56,$A9
#_02C896: db $C7,$02,$55,$90,$C6,$02,$6F,$8B
#_02C89E: db $F4,$02,$58,$8B,$F2,$02,$2B,$14
#_02C8A6: db $17,$40,$62,$37,$53,$C0,$17,$33
#_02C8AE: db $F5,$02,$17,$31,$F9,$02,$13,$27
#_02C8B6: db $73,$40,$27,$5F,$3B,$C0,$0B,$48
#_02C8BE: db $35,$03,$1D,$4B,$36,$03,$27,$09
#_02C8C6: db $37,$03,$27,$13,$38,$03,$4D,$1C
#_02C8CE: db $39,$03,$59,$31,$3A,$03,$53,$41
#_02C8D6: db $3B,$03,$36,$0C,$3E,$C0,$0A,$3E
#_02C8DE: db $41,$C0,$31,$64,$40,$C0,$60,$1A
#_02C8E6: db $3F,$C0,$FF

;===================================================================================================

; Equipment screen? TODO
routine02C8E9:
#_02C8E9: SEP #$30
#_02C8EB: PHB
#_02C8EC: PHK
#_02C8ED: PLB
#_02C8EE: LDA.w $09F1
#_02C8F1: STA.w $09FB
#_02C8F4: STZ.w $09F8
#_02C8F7: STZ.w $0A58
#_02C8FA: JSL routine02C98F
#_02C8FE: JSL routine02C9D5

.branch02C902
#_02C902: SEP #$30
#_02C904: JSL routine02CA4B
#_02C908: JSL AddSelfAsVector

#_02C90C: SEP #$30
#_02C90E: LDA.w $09F8
#_02C911: BNE .selection

#_02C913: REP #$20
#_02C915: LDA.w $0F2B
#_02C918: BIT.w #$0080 ; Look for A button
#_02C91B: BNE .selection

#_02C91D: BIT.w #$8000 ; Look for B button
#_02C920: BEQ .branch02C902

#_02C922: SEP #$20
#_02C924: LDA.w $0A3C
#_02C927: BEQ .branch02C92E

routine02C929:
#_02C929: LDA.w $09F4
#_02C92C: BNE .branch02C902

.branch02C92E
#_02C92E: LDA.b #$03 ; SFX 03
#_02C930: JSL WriteAPUCareful
#_02C934: LDA.b #$FF
#_02C936: STA.w $0A58
#_02C939: STA.w $09F2
#_02C93C: STA.w $09F3
#_02C93F: BRA .branch02C949

.selection:
#_02C941: SEP #$20
#_02C943: LDA.b #$02 ; SFX 02
#_02C945: JSL WriteAPUCareful

.branch02C949
#_02C949: JSL routine02CBA4
#_02C94D: PLB
#_02C94E: RTL

data02C94F:
#_02C94F: db $A8

data02C950:
#_02C950: db $9A

data02C951:
#_02C951: db $00

data02C952:
#_02C952: db $0E,$08,$44,$00,$0C,$08,$44,$00
#_02C95A: db $0C,$24,$79,$58,$0E,$20,$79,$00
#_02C962: db $0E,$20,$79,$00,$0E,$40,$28,$08
#_02C96A: db $08,$00,$00,$00,$00,$08,$50,$00
#_02C972: db $0C,$08,$5C,$00,$0C,$08,$8C,$00
#_02C97A: db $0C,$20,$78,$00,$0E,$18,$1C,$00
#_02C982: db $0C,$20,$78,$60,$0E,$20,$20,$00
#_02C98A: db $20,$28,$71,$60,$0E

routine02C98F:
#_02C98F: SEP #$30
#_02C991: PHB
#_02C992: PHK
#_02C993: PLB
#_02C994: LDA.w $09F4
#_02C997: AND.b #$7F
#_02C999: ASL A
#_02C99A: ASL A
#_02C99B: TAY
#_02C99C: LDA.w $09F2
#_02C99F: STA.w $0E10
#_02C9A2: LDA.w data02C951,Y
#_02C9A5: STA.w $0E11
#_02C9A8: JSL SmallMultiplication_long
#_02C9AC: LDA.w data02C94F,Y
#_02C9AF: CLC
#_02C9B0: ADC.w $0E12
#_02C9B3: SEC
#_02C9B4: SBC.b #$04
#_02C9B6: STA.w $09F6
#_02C9B9: LDA.w $09F3
#_02C9BC: STA.w $0E10
#_02C9BF: LDA.w data02C952,Y
#_02C9C2: STA.w $0E11
#_02C9C5: JSL SmallMultiplication_long
#_02C9C9: LDA.w data02C950,Y
#_02C9CC: CLC
#_02C9CD: ADC.w $0E12
#_02C9D0: STA.w $09F7
#_02C9D3: PLB
#_02C9D4: RTL

;===================================================================================================

routine02C9D5:
#_02C9D5: REP #$30
#_02C9D7: PHB

#_02C9D8: SEP #$20
#_02C9DA: LDA.b #data02CA3A>>16
#_02C9DC: PHA

#_02C9DD: REP #$20
#_02C9DF: PLB
#_02C9E0: LDA.w $09F4
#_02C9E3: AND.w #$007F
#_02C9E6: TAY
#_02C9E7: LDA.w data02CA3A,Y
#_02C9EA: AND.w #$00FF
#_02C9ED: PHA
#_02C9EE: ASL A
#_02C9EF: TAX
#_02C9F0: LDA.w $09F6
#_02C9F3: AND.w #$00FF
#_02C9F6: STA.w $1A60,X
#_02C9F9: LDA.w $09F7
#_02C9FC: AND.w #$00FF
#_02C9FF: STA.w $1AA0,X
#_02CA02: LDA.w $09F4
#_02CA05: AND.w #$007F
#_02CA08: ASL A
#_02CA09: TAY
#_02CA0A: LDA.w data02CA1A,Y
#_02CA0D: STA.w $0000,X

#_02CA10: SEP #$20
#_02CA12: PLX
#_02CA13: LDA.b #$80
#_02CA15: STA.w $1A00,X
#_02CA18: PLB
#_02CA19: RTL

data02CA1A:
#_02CA1A: dw $0008,$0009,$0009,$000A
#_02CA22: dw $000B,$000B,$000C,$000D
#_02CA2A: dw $0009,$0009,$0009,$000B
#_02CA32: dw $000A,$000A,$0008,$0008

data02CA3A:
#_02CA3A: db $0E,$0C,$0C,$0D,$0D,$0C,$0F,$0F
#_02CA42: db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
#_02CA4A: db $00

;===================================================================================================

routine02CA4B:
#_02CA4B: REP #$30

#_02CA4D: LDA.w $09F9
#_02CA50: BEQ .branch02CA73

#_02CA52: CMP.w $0F2D
#_02CA55: BNE .branch02CA73

#_02CA57: SEP #$20

#_02CA59: INC.w $09F5
#_02CA5C: LDA.w $09F5
#_02CA5F: CMP.b #$20
#_02CA61: BNE .branch02CA78

#_02CA63: SEC
#_02CA64: SBC.b #$05
#_02CA66: STA.w $09F5

#_02CA69: REP #$20
#_02CA6B: LDA.w $0F2D
#_02CA6E: STA.w $0F2B
#_02CA71: BRA .branch02CA78

.branch02CA73
#_02CA73: SEP #$20
#_02CA75: STZ.w $09F5

.branch02CA78
#_02CA78: REP #$20

#_02CA7A: LDA.w $09F3
#_02CA7D: STA.w $0E00

#_02CA80: LDA.w $09F2
#_02CA83: STA.w $0E02

#_02CA86: LDA.w $0F2D
#_02CA89: STA.w $09F9

#_02CA8C: LDA.w $0F2B
#_02CA8F: AND.w #$0800
#_02CA92: BEQ .branch02CA9F

#_02CA94: SEP #$20

#_02CA96: DEC.w $09F3
#_02CA99: LDA.b #$01 ; SFX 01
#_02CA9B: JSL WriteAPUCareful

.branch02CA9F
#_02CA9F: REP #$20
#_02CAA1: LDA.w $0F2B
#_02CAA4: AND.w #$0400
#_02CAA7: BEQ .branch02CAB4

#_02CAA9: SEP #$20
#_02CAAB: INC.w $09F3
#_02CAAE: LDA.b #$01 ; SFX 01
#_02CAB0: JSL WriteAPUCareful

.branch02CAB4
#_02CAB4: REP #$20
#_02CAB6: LDA.w $0F2B
#_02CAB9: AND.w #$0200
#_02CABC: BEQ .branch02CAC9

#_02CABE: SEP #$20
#_02CAC0: DEC.w $09F2
#_02CAC3: LDA.b #$01 ; SFX 01
#_02CAC5: JSL WriteAPUCareful

.branch02CAC9
#_02CAC9: REP #$20
#_02CACB: LDA.w $0F2B
#_02CACE: AND.w #$0100
#_02CAD1: BEQ .branch02CADE

#_02CAD3: SEP #$20
#_02CAD5: INC.w $09F2
#_02CAD8: LDA.b #$01 ; SFX 01
#_02CADA: JSL WriteAPUCareful

.branch02CADE
#_02CADE: REP #$20
#_02CAE0: LDA.w $0F2B
#_02CAE3: AND.w #$0300
#_02CAE6: BEQ .branch02CB22

#_02CAE8: SEP #$30
#_02CAEA: LDA.w $09F2
#_02CAED: BMI .branch02CB0B

#_02CAEF: LDA.w $09F0
#_02CAF2: CMP.w $09F2
#_02CAF5: BCS .branch02CB14

#_02CAF7: STZ.w $09F2
#_02CAFA: JSR routine02CB8A
#_02CAFD: LDA.w $09F8
#_02CB00: CMP.b #$3F
#_02CB02: BNE .branch02CB14

#_02CB04: ORA.b #$40
#_02CB06: STA.w $09F8
#_02CB09: BRA .branch02CB14

.branch02CB0B
#_02CB0B: LDA.w $09F0
#_02CB0E: STA.w $09F2
#_02CB11: JSR routine02CB8A

.branch02CB14
#_02CB14: LDX.w $09F2
#_02CB17: LDA.w $09FB,X
#_02CB1A: CMP.w $09F3
#_02CB1D: BCS .branch02CB22

#_02CB1F: STA.w $09F3

.branch02CB22
#_02CB22: REP #$20
#_02CB24: LDA.w $0F2B
#_02CB27: AND.w #$0C00
#_02CB2A: BEQ .branch02CB68

#_02CB2C: SEP #$30
#_02CB2E: LDA.w $09F3
#_02CB31: BMI .branch02CB57

#_02CB33: LDX.w $09F2
#_02CB36: LDA.w $09FB,X
#_02CB39: CMP.w $09F3
#_02CB3C: BCS .branch02CB68

#_02CB3E: STZ.w $09F3
#_02CB41: JSR routine02CB8A
#_02CB44: LDA.w $09F8
#_02CB47: AND.b #$3F
#_02CB49: CMP.b #$3F
#_02CB4B: BNE .branch02CB68

#_02CB4D: LDA.w $09F8
#_02CB50: ORA.b #$80
#_02CB52: STA.w $09F8
#_02CB55: BRA .branch02CB68

.branch02CB57
#_02CB57: JSR routine02CB8A
#_02CB5A: LDA.w $09F8
#_02CB5D: BNE .branch02CB68

#_02CB5F: LDX.w $09F2
#_02CB62: LDA.w $09FB,X
#_02CB65: STA.w $09F3

.branch02CB68
#_02CB68: SEP #$30
#_02CB6A: LDA.w $0E00
#_02CB6D: CMP.w $09F3
#_02CB70: BNE .branch02CB7B

#_02CB72: LDA.w $0E02
#_02CB75: CMP.w $09F2
#_02CB78: BNE .branch02CB7B

#_02CB7A: RTL

.branch02CB7B
#_02CB7B: LDA.w $09F8
#_02CB7E: BEQ .branch02CB81

#_02CB80: RTL

.branch02CB81
#_02CB81: JSL routine02C98F
#_02CB85: JSL routine02C9D5
#_02CB89: RTL

;===================================================================================================

routine02CB8A:
#_02CB8A: LDA.w $09F4
#_02CB8D: BMI .branch02CB90

#_02CB8F: RTS

.branch02CB90
#_02CB90: LDA.w $09F8
#_02CB93: ORA.b #$3F
#_02CB95: STA.w $09F8
#_02CB98: RTS

;===================================================================================================

routine02CB99:
#_02CB99: PHP
#_02CB9A: SEP #$20
#_02CB9C: STZ.w $09F3
#_02CB9F: STZ.w $09F2
#_02CBA2: PLP
#_02CBA3: RTL

;===================================================================================================
; TODO something with selecting in menu
;===================================================================================================
routine02CBA4:
#_02CBA4: REP #$30
#_02CBA6: LDA.w $09F4
#_02CBA9: AND.w #$007F
#_02CBAC: TAY
#_02CBAD: LDA.w data02CA3A,Y
#_02CBB0: AND.w #$00FF
#_02CBB3: PHA
#_02CBB4: ASL A
#_02CBB5: TAX
#_02CBB6: LDA.w #$00F0
#_02CBB9: STA.w $1A60,X
#_02CBBC: LDA.w #$00F0
#_02CBBF: STA.w $1AA0,X
#_02CBC2: LDA.w #$0000
#_02CBC5: STA.w $0000,X

#_02CBC8: SEP #$20
#_02CBCA: PLX
#_02CBCB: LDA.b #$80
#_02CBCD: STA.w $1A00,X
#_02CBD0: RTL

;===================================================================================================

routine02CBD1:
#_02CBD1: PHP
#_02CBD2: REP #$30
#_02CBD4: PHA
#_02CBD5: PHX
#_02CBD6: PHY
#_02CBD7: PHD
#_02CBD8: PHB

#_02CBD9: REP #$30
#_02CBDB: AND.w #$00FF
#_02CBDE: STA.w $0E02
#_02CBE1: ASL A
#_02CBE2: ASL A
#_02CBE3: CLC
#_02CBE4: ADC.w $0E02
#_02CBE7: TAY
#_02CBE8: PHB

#_02CBE9: SEP #$20
#_02CBEB: LDA.b #data02CC3C>>16
#_02CBED: PHA

#_02CBEE: REP #$20
#_02CBF0: PLB
#_02CBF1: LDA.w data02CC3C,Y
#_02CBF4: AND.w #$00FF
#_02CBF7: STA.w $0E00
#_02CBFA: ASL A
#_02CBFB: ASL A
#_02CBFC: TAX
#_02CBFD: LDA.w data02CC3F,Y
#_02CC00: STA.w $0F10,X

#_02CC03: SEP #$20
#_02CC05: LDA.w data02CC3D,Y
#_02CC08: STA.w $0F0F,X
#_02CC0B: LDA.w data02CC3E,Y
#_02CC0E: STA.w $0F12,X

#_02CC11: REP #$20
#_02CC13: TXA
#_02CC14: ASL A
#_02CC15: ASL A
#_02CC16: TAX

#_02CC17: SEP #$20
#_02CC19: LDA.b #$02
#_02CC1B: STA.w DMAXMODE,X
#_02CC1E: LDX.w $0E00
#_02CC21: LDA.w data02CC34,X
#_02CC24: ORA.w $0F0E
#_02CC27: STA.w $0F0E
#_02CC2A: PLB

#_02CC2B: REP #$30
#_02CC2D: PLB
#_02CC2E: PLD
#_02CC2F: PLY
#_02CC30: PLX
#_02CC31: PLA
#_02CC32: PLP
#_02CC33: RTL

data02CC34:
#_02CC34: db $01,$02,$04,$08,$10,$20,$40,$80

data02CC3C:
#_02CC3C: db $06

data02CC3D:
#_02CC3D: db $12

data02CC3E:
#_02CC3E: db $02

data02CC3F:
#_02CC3F: db $64,$CC,$06,$12,$02,$8C,$CC,$06
#_02CC47: db $12,$02,$B4,$CC,$06,$12,$02,$DF
#_02CC4F: db $CC,$06,$12,$02,$0D,$CD,$06,$12
#_02CC57: db $02,$3B,$CD,$06,$12,$02,$6C,$CD
#_02CC5F: db $05,$14,$02,$9D,$CD,$81,$00,$00
#_02CC67: db $03,$00,$00,$08,$FC,$01,$01,$FB
#_02CC6F: db $01,$01,$FA,$01,$01,$F9,$01,$57
#_02CC77: db $F8,$01,$0A,$F4,$01,$0C,$FC,$01
#_02CC7F: db $0E,$FE,$01,$25,$50,$00,$20,$30
#_02CC87: db $00,$11,$10,$00,$00,$81,$00,$00
#_02CC8F: db $03,$00,$00,$08,$FC,$01,$01,$FB
#_02CC97: db $01,$01,$FA,$01,$01,$F9,$01,$57
#_02CC9F: db $F8,$01,$0A,$F4,$01,$0C,$FC,$01
#_02CCA7: db $0E,$FE,$01,$0E,$00,$00,$25,$42
#_02CCAF: db $00,$23,$22,$00,$00,$81,$00,$00
#_02CCB7: db $03,$00,$00,$08,$FC,$01,$01,$FB
#_02CCBF: db $01,$01,$FA,$01,$01,$F9,$01,$57
#_02CCC7: db $F8,$01,$0A,$F4,$01,$0C,$FC,$01
#_02CCCF: db $0E,$FE,$01,$0E,$00,$00,$0E,$02
#_02CCD7: db $00,$25,$34,$00,$15,$14,$00,$00
#_02CCDF: db $81,$00,$00,$03,$00,$00,$08,$FC
#_02CCE7: db $01,$01,$FB,$01,$01,$FA,$01,$01
#_02CCEF: db $F9,$01,$57,$F8,$01,$0A,$F4,$01
#_02CCF7: db $0C,$FC,$01,$0E,$FE,$01,$0E,$00
#_02CCFF: db $00,$0E,$02,$00,$0E,$04,$00,$25
#_02CD07: db $26,$00,$07,$06,$00,$00,$81,$00
#_02CD0F: db $00,$03,$00,$00,$08,$FC,$01,$01
#_02CD17: db $FB,$01,$01,$FA,$01,$01,$F9,$01
#_02CD1F: db $57,$F8,$01,$0A,$F4,$01,$0C,$FC
#_02CD27: db $01,$0E,$FE,$01,$0E,$00,$00,$0E
#_02CD2F: db $02,$00,$0E,$04,$00,$0E,$06,$00
#_02CD37: db $1E,$18,$00,$00,$81,$00,$00,$03
#_02CD3F: db $00,$00,$08,$FC,$01,$01,$FB,$01
#_02CD47: db $01,$FA,$01,$01,$F9,$01,$57,$F8
#_02CD4F: db $01,$0A,$F4,$01,$0C,$FC,$01,$0E
#_02CD57: db $FE,$01,$0E,$00,$00,$0E,$02,$00
#_02CD5F: db $0E,$04,$00,$0E,$06,$00,$10,$08
#_02CD67: db $00,$0E,$0A,$00,$00,$81,$00,$00
#_02CD6F: db $03,$00,$00,$0C,$FC,$01,$38,$00
#_02CD77: db $00,$0C,$04,$00,$0C,$08,$00,$0C
#_02CD7F: db $0C,$00,$0C,$10,$00,$0C,$14,$00
#_02CD87: db $0C,$18,$00,$0C,$1C,$00,$0C,$20
#_02CD8F: db $00,$0C,$24,$00,$0C,$28,$00,$0C
#_02CD97: db $2C,$00,$15,$2F,$00,$00,$81,$00
#_02CD9F: db $00,$7E,$00,$00,$01,$80,$00,$10
#_02CDA7: db $80,$00,$0C,$84,$00,$0C,$88,$00
#_02CDAF: db $0C,$8C,$00,$0C,$90,$00,$0C,$94
#_02CDB7: db $00,$14,$98,$00,$00

routine02CDBC:
#_02CDBC: SEP #$30
#_02CDBE: PHB
#_02CDBF: PHK
#_02CDC0: PLB
#_02CDC1: JSL UpdateDialogBox
#_02CDC5: LDA.b #$80
#_02CDC7: STA.w $0F0E
#_02CDCA: LDX.b #$7F
#_02CDCC: LDA.b #$0F

.branch02CDCE
#_02CDCE: STA.l $7F0001,X
#_02CDD2: STA.l $7F0081,X
#_02CDD6: DEX
#_02CDD7: BPL .branch02CDCE

#_02CDD9: LDA.b #$00
#_02CDDB: STA.l $7F0000
#_02CDDF: STA.l $7F0080
#_02CDE3: STZ.w $0E00
#_02CDE6: LDY.b #$03

.branch02CDE8
#_02CDE8: LDX.b #$0F

.branch02CDEA
#_02CDEA: JSR routine02CE20
#_02CDED: DEX
#_02CDEE: BPL .branch02CDEA

#_02CDF0: INC.w $0E00
#_02CDF3: DEY
#_02CDF4: BPL .branch02CDE8

#_02CDF6: STZ.w INIDISP
#_02CDF9: LDA.b #$FF
#_02CDFB: STA.w $0F7F
#_02CDFE: JSL Reset_OAMrelatedWRAM
#_02CE02: LDA.b #$01
#_02CE04: JSL ClearSomeBank7FBuffers
#_02CE08: LDA.b #$01
#_02CE0A: JSL VRAM_From_7FXXXX
#_02CE0E: JSL AddSelfAsVectorAndMakeSpace
#_02CE12: LDA.b #$80
#_02CE14: STA.w $0F0E
#_02CE17: STZ.w $0F0D
#_02CE1A: JSL AddSelfAsVectorAndMakeSpace
#_02CE1E: PLB
#_02CE1F: RTL

;===================================================================================================

routine02CE20:
#_02CE20: PHX
#_02CE21: PHY
#_02CE22: PHP
#_02CE23: LDA.b #$00

.branch02CE25
#_02CE25: PHA
#_02CE26: CLC
#_02CE27: ADC.w $0E00
#_02CE2A: TAX
#_02CE2B: LDA.l $7F0001,X
#_02CE2F: DEC A
#_02CE30: BMI .branch02CE41

#_02CE32: STA.l $7F0001,X
#_02CE36: LDA.l $7F0081,X
#_02CE3A: DEC A
#_02CE3B: BMI .branch02CE41

#_02CE3D: STA.l $7F0081,X

.branch02CE41
#_02CE41: PLA
#_02CE42: CLC
#_02CE43: ADC.b #$04
#_02CE45: CMP.b #$80
#_02CE47: BNE .branch02CE25

#_02CE49: LDA.b #$FF
#_02CE4B: STA.l $7F0000
#_02CE4F: LDA.b #$FF
#_02CE51: STA.l $7F0080
#_02CE55: LDA.b #$00
#_02CE57: STA.l $7F0100
#_02CE5B: LDA.b #$00
#_02CE5D: STA.w DMA3MODE

#_02CE60: LDA.b #$00
#_02CE62: STA.w $0F1B

#_02CE65: LDA.b #$7F
#_02CE67: STA.w $0F1E

#_02CE6A: REP #$20
#_02CE6C: LDA.w #$0000
#_02CE6F: STA.w $0F1C

#_02CE72: SEP #$20
#_02CE74: LDA.w $0F0D
#_02CE77: ORA.b #$08
#_02CE79: STA.w $0F0D
#_02CE7C: STA.w $0F0E
#_02CE7F: JSL AddSelfAsVectorAndMakeSpace
#_02CE83: PLP
#_02CE84: PLY
#_02CE85: PLX
#_02CE86: RTS

;===================================================================================================

routine02CE87:
#_02CE87: SEP #$30
#_02CE89: PHB
#_02CE8A: PHK
#_02CE8B: PLB
#_02CE8C: LDA.b #$01
#_02CE8E: STA.w NMITIMEN
#_02CE91: STA.w $0F00
#_02CE94: LDA.b #$80
#_02CE96: STA.w INIDISP
#_02CE99: STA.w $0F43
#_02CE9C: JSL ZeroVRAM_02
#_02CEA0: LDA.b #$00
#_02CEA2: JSL routine0F8000
#_02CEA6: LDA.b #$00
#_02CEA8: JSL routine0F8075
#_02CEAC: LDA.b #$07
#_02CEAE: STA.w BGMODE
#_02CEB1: STA.w $0F45
#_02CEB4: LDA.b #$80
#_02CEB6: STA.w M7SEL
#_02CEB9: LDA.b #$00
#_02CEBB: STA.w M7A
#_02CEBE: LDA.b #$20
#_02CEC0: STA.w M7A
#_02CEC3: LDA.b #$00
#_02CEC5: STA.w M7B
#_02CEC8: STA.w M7B
#_02CECB: LDA.b #$00
#_02CECD: STA.w M7C
#_02CED0: STA.w M7C
#_02CED3: LDA.b #$00
#_02CED5: STA.w M7D
#_02CED8: LDA.b #$20
#_02CEDA: STA.w M7D
#_02CEDD: LDA.b #$58
#_02CEDF: STA.w M7X
#_02CEE2: LDA.b #$00
#_02CEE4: STA.w M7X
#_02CEE7: LDA.b #$30
#_02CEE9: STA.w M7Y
#_02CEEC: LDA.b #$00
#_02CEEE: STA.w M7Y
#_02CEF1: LDA.b #$D8
#_02CEF3: STA.w $0F4D
#_02CEF6: LDA.b #$C0
#_02CEF8: STA.w $0F4F
#_02CEFB: LDA.b #$FF
#_02CEFD: STA.w $0F4E
#_02CF00: STA.w $0F50
#_02CF03: LDA.b #$01
#_02CF05: STA.w TM
#_02CF08: STA.w $0F74
#_02CF0B: LDA.b #$81
#_02CF0D: STA.w NMITIMEN
#_02CF10: STA.w $0F00
#_02CF13: LDA.b #$00
#_02CF15: STA.w INIDISP
#_02CF18: STA.w $0F43
#_02CF1B: JSL BrightenScreen

#_02CF1F: SEP #$20
#_02CF21: LDA.b #$01
#_02CF23: STA.w $0CF2
#_02CF26: LDA.b #$0D ; SFX 0D
#_02CF28: JSL WriteAPUCareful
#_02CF2C: LDA.b #$01
#_02CF2E: STA.w $0EFE

#_02CF31: REP #$30
#_02CF33: JSR routine02CFCC
#_02CF36: JSR routine02D00B
#_02CF39: JSR routine02D047

#_02CF3C: SEP #$20
#_02CF3E: STZ.w $0CF2
#_02CF41: JSL DarkenScreen

#_02CF45: SEP #$30
#_02CF47: LDA.b #$09
#_02CF49: STA.w BGMODE
#_02CF4C: STA.w $0F45
#_02CF4F: LDA.b #$01
#_02CF51: STA.w NMITIMEN
#_02CF54: STA.w $0F00
#_02CF57: LDA.b #$80
#_02CF59: STA.w INIDISP
#_02CF5C: STA.w $0F43
#_02CF5F: STZ.w $0F7F
#_02CF62: JSL ZeroVRAM_02
#_02CF66: LDA.b #$81
#_02CF68: STA.w NMITIMEN
#_02CF6B: STA.w $0F00
#_02CF6E: LDA.b #$00
#_02CF70: STA.w INIDISP
#_02CF73: STA.w $0F43
#_02CF76: LDA.b #$01
#_02CF78: JSL ClearSomeBank7FBuffers
#_02CF7C: LDA.b #$01
#_02CF7E: JSL VRAM_From_7FXXXX
#_02CF82: LDA.b #$00
#_02CF84: JSL routine02F609
#_02CF88: LDA.b #$00
#_02CF8A: JSL routine02FC6E
#_02CF8E: JSL routine00A17E
#_02CF92: LDA.b #$01
#_02CF94: JSL routine02CBD1
#_02CF98: LDA.b #$07
#_02CF9A: JSL routine02CBD1
#_02CF9E: LDA.b #$1F
#_02CFA0: STA.w TM
#_02CFA3: STA.w $0F74
#_02CFA6: JSL BrightenScreen
#_02CFAA: LDA.b #$04
#_02CFAC: STA.w $0A59
#_02CFAF: JSL routine02E32D

#_02CFB3: SEP #$30
#_02CFB5: LDA.b #$07
#_02CFB7: JSL InitializeTextBoxToSizeForNewMessage
#_02CFBB: JSL routine00A056

#_02CFBF: REP #$20
#_02CFC1: LDA.w $0A1A
#_02CFC4: STA.w $0980
#_02CFC7: STZ.w $0A33
#_02CFCA: PLB
#_02CFCB: RTL

;===================================================================================================

routine02CFCC:
#_02CFCC: REP #$30
#_02CFCE: LDA.w #$1D20
#_02CFD1: STA.w $0E00
#_02CFD4: LSR A
#_02CFD5: STA.w $0E02

.branch02CFD8
#_02CFD8: SEP #$30
#_02CFDA: JSR routine02D06C

#_02CFDD: REP #$30
#_02CFDF: LDA.w $0E01
#_02CFE2: AND.w #$00FE
#_02CFE5: TAX
#_02CFE6: LDA.w data02D08B,X
#_02CFE9: STA.w $0E04
#_02CFEC: ASL A
#_02CFED: STA.w $0E06
#_02CFF0: LDA.w $0E02
#_02CFF3: SEC
#_02CFF4: SBC.w $0E04
#_02CFF7: STA.w $0E02
#_02CFFA: LDA.w $0E00
#_02CFFD: SEC
#_02CFFE: SBC.w $0E06
#_02D001: STA.w $0E00
#_02D004: SEC
#_02D005: SBC.w #$0400
#_02D008: BPL .branch02CFD8

#_02D00A: RTS

;===================================================================================================

routine02D00B:
#_02D00B: SEP #$30
#_02D00D: JSR routine02D06C

#_02D010: REP #$30
#_02D012: LDA.w $0E03
#_02D015: AND.w #$00FE
#_02D018: TAX
#_02D019: LDA.w data02D08B,X
#_02D01C: LSR A
#_02D01D: STA.w $0E04
#_02D020: LDA.w #$0010
#_02D023: STA.w $0E06
#_02D026: LDA.w $0E02
#_02D029: SEC
#_02D02A: SBC.w $0E04
#_02D02D: STA.w $0E02
#_02D030: LDA.w $0E00
#_02D033: SEC
#_02D034: SBC.w $0E06
#_02D037: STA.w $0E00
#_02D03A: SEC
#_02D03B: SBC.w $0E02
#_02D03E: BPL routine02D00B

#_02D040: LDA.w $0E00
#_02D043: STA.w $0E02
#_02D046: RTS

;===================================================================================================

routine02D047:
#_02D047: SEP #$30
#_02D049: JSR routine02D06C

#_02D04C: REP #$30
#_02D04E: LDA.w $0E01
#_02D051: AND.w #$00FE
#_02D054: TAX
#_02D055: LDA.w $0E00
#_02D058: SEC
#_02D059: SBC.w data02D08B,X
#_02D05C: STA.w $0E00
#_02D05F: LDA.w $0E02
#_02D062: SEC
#_02D063: SBC.w data02D08B,X
#_02D066: STA.w $0E02
#_02D069: BPL routine02D047

#_02D06B: RTS

;===================================================================================================

routine02D06C:
#_02D06C: SEP #$30
#_02D06E: JSL routine02D0AB
#_02D072: LDA.w $0E00
#_02D075: STA.w M7A
#_02D078: LDA.w $0E01
#_02D07B: STA.w M7A
#_02D07E: LDA.w $0E02
#_02D081: STA.w M7D
#_02D084: LDA.w $0E03
#_02D087: STA.w M7D
#_02D08A: RTS

data02D08B:
#_02D08B: dw $0004,$0010,$0020,$0030
#_02D093: dw $0040,$0060,$0080,$00A0
#_02D09B: dw $00C0,$00E0,$0100,$0120
#_02D0A3: dw $0140,$0160,$0180,$0200

routine02D0AB:
#_02D0AB: PHP
#_02D0AC: SEP #$20

.branch02D0AE
#_02D0AE: LDA.w $0CF2
#_02D0B1: BNE .branch02D0AE

#_02D0B3: INC.w $0CF2
#_02D0B6: PLP
#_02D0B7: RTL

;===================================================================================================

routine02D0B8:
#_02D0B8: PHP
#_02D0B9: PHB
#_02D0BA: PHK
#_02D0BB: PLB

#_02D0BC: SEP #$30
#_02D0BE: JSL DarkenScreen
#_02D0C2: LDA.b #$80
#_02D0C4: STA.w $0F0E
#_02D0C7: STZ.w $0F0D
#_02D0CA: STZ.w HDMAEN
#_02D0CD: LDA.b #$FF
#_02D0CF: STA.w $0F7F
#_02D0D2: LDA.b #$01
#_02D0D4: STA.w NMITIMEN
#_02D0D7: STA.w $0F00
#_02D0DA: LDA.b #$80
#_02D0DC: STA.w INIDISP
#_02D0DF: STA.w $0F43
#_02D0E2: JSL ZeroVRAM_02
#_02D0E6: JSL ZeroCGRAM_02
#_02D0EA: JSL Reset_OAMrelatedWRAM
#_02D0EE: LDA.b #$01
#_02D0F0: JSL routine0F8000
#_02D0F4: JSL routine0F827A
#_02D0F8: LDA.b #$07
#_02D0FA: STA.w BGMODE
#_02D0FD: STA.w $0F45
#_02D100: LDA.b #$62
#_02D102: STA.w OBSEL
#_02D105: STA.w $0F44
#_02D108: LDA.b #$00
#_02D10A: STA.w M7SEL
#_02D10D: LDA.b #$80
#_02D10F: STA.w M7A
#_02D112: STA.w $0F5F
#_02D115: LDA.b #$05
#_02D117: STA.w M7A
#_02D11A: STA.w $0F60
#_02D11D: LDA.b #$00
#_02D11F: STA.w M7B
#_02D122: STA.w M7B
#_02D125: STA.w $0F61
#_02D128: STA.w $0F62
#_02D12B: LDA.b #$00
#_02D12D: STA.w M7C
#_02D130: STA.w M7C
#_02D133: STA.w $0F63
#_02D136: STA.w $0F64
#_02D139: LDA.b #$80
#_02D13B: STA.w M7D
#_02D13E: STA.w $0F65
#_02D141: LDA.b #$05
#_02D143: STA.w M7D
#_02D146: STA.w $0F66
#_02D149: LDA.b #$80
#_02D14B: STA.w M7X
#_02D14E: STA.w $0F67
#_02D151: LDA.b #$00
#_02D153: STA.w M7X
#_02D156: STA.w $0F68
#_02D159: LDA.b #$60
#_02D15B: STA.w M7Y
#_02D15E: STA.w $0F69
#_02D161: LDA.b #$00
#_02D163: STA.w M7Y
#_02D166: STA.w $0F6A
#_02D169: STZ.w $0F4D
#_02D16C: STZ.w $0F4E
#_02D16F: STZ.w $0F50
#_02D172: LDA.b #$28
#_02D174: STA.w $0F4F
#_02D177: JSR routine02D279
#_02D17A: LDA.b #$01
#_02D17C: STA.w TM
#_02D17F: STA.w $0F74
#_02D182: LDA.b #$81
#_02D184: STA.w NMITIMEN
#_02D187: STA.w $0F00
#_02D18A: LDA.b #$00
#_02D18C: STA.w INIDISP
#_02D18F: STA.w $0F43
#_02D192: LDA.b #$00
#_02D194: JSL routine02FC6E
#_02D198: LDA.b #$44
#_02D19A: JSL routine02FC6E
#_02D19E: LDA.b #$43
#_02D1A0: JSL routine02FC09
#_02D1A4: JSR routine02D375
#_02D1A7: JSL BrightenScreen

#_02D1AB: SEP #$20
#_02D1AD: LDA.b #$56 ; SONG 56
#_02D1AF: JSL WriteAPUCareful
#_02D1B3: LDA.b #$01
#_02D1B5: STA.w $0CF2

.branch02D1B8
#_02D1B8: JSR routine02D391

#_02D1BB: REP #$30
#_02D1BD: DEC.w $0F5F
#_02D1C0: DEC.w $0F5F
#_02D1C3: DEC.w $0F5F
#_02D1C6: DEC.w $0F65
#_02D1C9: DEC.w $0F65
#_02D1CC: DEC.w $0F65
#_02D1CF: LDA.w $0F5F
#_02D1D2: SEC
#_02D1D3: SBC.w #$0180
#_02D1D6: LSR A
#_02D1D7: LSR A
#_02D1D8: LSR A
#_02D1D9: LSR A
#_02D1DA: LSR A
#_02D1DB: CMP.w #$0005
#_02D1DE: BCC .branch02D1E6

#_02D1E0: DEC A
#_02D1E1: DEC A
#_02D1E2: DEC A
#_02D1E3: DEC A
#_02D1E4: BRA .branch02D1E9

.branch02D1E6
#_02D1E6: LDA.w #$0000

.branch02D1E9
#_02D1E9: TAY
#_02D1EA: LDA.w #$0020
#_02D1ED: LDX.w #$002F
#_02D1F0: JSL routine0F8677
#_02D1F4: LDA.w $0F5F
#_02D1F7: CMP.w #$0180
#_02D1FA: BCS .branch02D1B8

#_02D1FC: SEP #$30
#_02D1FE: LDY.b #$1E
#_02D200: JSR routine02D26D
#_02D203: LDA.b #$11
#_02D205: STA.w TM
#_02D208: STA.w $0F74
#_02D20B: LDY.b #$78
#_02D20D: JSR routine02D26D
#_02D210: LDY.b #$78
#_02D212: JSR routine02D26D
#_02D215: LDA.b #$01
#_02D217: STA.w TM
#_02D21A: STA.w $0F74
#_02D21D: LDY.b #$0A
#_02D21F: JSR routine02D26D
#_02D222: LDA.b #$00
#_02D224: STA.l $7E22FD

.branch02D228
#_02D228: JSR routine02D391

#_02D22B: REP #$30
#_02D22D: DEC.w $0F5F
#_02D230: DEC.w $0F5F
#_02D233: DEC.w $0F65
#_02D236: DEC.w $0F65
#_02D239: LDA.w #$0180
#_02D23C: SEC
#_02D23D: SBC.w $0F5F
#_02D240: LSR A
#_02D241: LSR A
#_02D242: LSR A
#_02D243: LSR A
#_02D244: TAY
#_02D245: LDA.w #$0020
#_02D248: LDX.w #$002F
#_02D24B: JSL routine0F85AF
#_02D24F: LDA.w $0F5F
#_02D252: BPL .branch02D228

#_02D254: LDY.w #$003C
#_02D257: JSR routine02D26D
#_02D25A: JSL DarkenScreen

#_02D25E: SEP #$20
#_02D260: LDA.b #$81
#_02D262: STA.w $0F00
#_02D265: LDA.b #$FF
#_02D267: STA.w $0F7F
#_02D26A: PLB
#_02D26B: PLP
#_02D26C: RTL

;===================================================================================================

routine02D26D:
#_02D26D: PHY
#_02D26E: PHP
#_02D26F: JSL routine02D0AB
#_02D273: PLP
#_02D274: PLY
#_02D275: DEY
#_02D276: BPL routine02D26D

#_02D278: RTS

;===================================================================================================

routine02D279:
#_02D279: PHP
#_02D27A: REP #$30
#_02D27C: LDA.w #$5200
#_02D27F: STA.w VMADDL
#_02D282: LDY.w #$0000

.branch02D285
#_02D285: PHY
#_02D286: LDA.w data02D2B5,Y
#_02D289: AND.w #$00FF
#_02D28C: ASL A
#_02D28D: ASL A
#_02D28E: ASL A
#_02D28F: ASL A
#_02D290: TAX
#_02D291: LDY.w #$0007

.branch02D294
#_02D294: LDA.l Font_2BPP,X
#_02D298: STA.w VMDATAL
#_02D29B: INX
#_02D29C: INX
#_02D29D: DEY
#_02D29E: BPL .branch02D294

#_02D2A0: LDY.w #$0007

.branch02D2A3
#_02D2A3: LDA.w #$0000
#_02D2A6: STA.w VMDATAL
#_02D2A9: DEY
#_02D2AA: BPL .branch02D2A3

#_02D2AC: PLY
#_02D2AD: INY
#_02D2AE: CPY.w #$00C0
#_02D2B1: BNE .branch02D285

#_02D2B3: PLP
#_02D2B4: RTS

; TODO text
data02D2B5:
#_02D2B5: db $CF,$CF,$CF,$CF,$CF,$9E,$CF,$CF
#_02D2BD: db $CF,$9E,$9E,$CF,$CF,$CF,$CF,$CF
#_02D2C5: db $CF,$CF,$2E,$2E,$4F,$2F,$30,$39
#_02D2CD: db $2A,$3E,$37,$CF,$35,$2A,$4B,$36
#_02D2D5: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D2DD: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D2E5: db $2B,$30,$47,$3D,$4A,$CF,$CF,$CF
#_02D2ED: db $CF,$CF,$2E,$4E,$4A,$4C,$2F,$2B
#_02D2F5: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D2FD: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D305: db $3E,$CF,$34,$43,$30,$26,$3D,$2A
#_02D30D: db $28,$4D,$38,$2E,$4F,$CF,$CF,$CF
#_02D315: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D31D: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D325: db $CF,$CF,$29,$33,$4E,$4D,$2E,$38
#_02D32D: db $3E,$39,$26,$93,$93,$93,$CF,$CF
#_02D335: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D33D: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D345: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D34D: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF
#_02D355: db $00,$00,$00,$00,$00,$DA,$00,$00
#_02D35D: db $00,$00,$00,$00,$00,$00,$00,$00
#_02D365: db $00,$D8,$D9,$D9,$00,$DA,$00,$00
#_02D36D: db $00,$00,$00,$00,$00,$00,$00,$00

;===================================================================================================

routine02D375:
#_02D375: REP #$20
#_02D377: LDA.w #$0028
#_02D37A: STA.w $0000
#_02D37D: STZ.w $0040
#_02D380: STZ.w $1A60
#_02D383: STZ.w $1AA0

#_02D386: SEP #$20
#_02D388: LDA.b #$80
#_02D38A: STA.w $1A00
#_02D38D: STA.w $1A20
#_02D390: RTS

;===================================================================================================

routine02D391:
#_02D391: PHP
#_02D392: SEP #$30
#_02D394: JSL routine02D0AB
#_02D398: JSL routine02D3AA

#_02D39C: SEP #$20
#_02D39E: LDA.l $7E22FD
#_02D3A2: BEQ .branch02D3A8

#_02D3A4: JSL UpdateCGRAMArb

.branch02D3A8
#_02D3A8: PLP
#_02D3A9: RTS

;===================================================================================================

routine02D3AA:
#_02D3AA: PHP
#_02D3AB: SEP #$20

#_02D3AD: LDA.w $0F5F
#_02D3B0: STA.w M7A

#_02D3B3: LDA.w $0F60
#_02D3B6: STA.w M7A

#_02D3B9: LDA.w $0F61
#_02D3BC: STA.w M7B

#_02D3BF: LDA.w $0F62
#_02D3C2: STA.w M7B

#_02D3C5: LDA.w $0F63
#_02D3C8: STA.w M7C

#_02D3CB: LDA.w $0F64
#_02D3CE: STA.w M7C

#_02D3D1: LDA.w $0F65
#_02D3D4: STA.w M7D

#_02D3D7: LDA.w $0F66
#_02D3DA: STA.w M7D

#_02D3DD: LDA.w $0F67
#_02D3E0: STA.w M7X

#_02D3E3: LDA.w $0F68
#_02D3E6: STA.w M7X

#_02D3E9: LDA.w $0F69
#_02D3EC: STA.w M7Y

#_02D3EF: LDA.w $0F6A
#_02D3F2: STA.w M7Y

#_02D3F5: PLP
#_02D3F6: RTL

;===================================================================================================

routine02D3F7:
#_02D3F7: PHP
#_02D3F8: PHB
#_02D3F9: PHK
#_02D3FA: PLB

#_02D3FB: REP #$30
#_02D3FD: STZ.w $0E02
#_02D400: AND.w #$0001
#_02D403: STA.w $0E04
#_02D406: BEQ .branch02D40E

#_02D408: LDA.w #$1000
#_02D40B: STA.w $0E02

.branch02D40E
#_02D40E: LDA.w $0400
#_02D411: AND.w #$FEFF
#_02D414: STA.w $0400
#_02D417: JSL routine02D518
#_02D41B: LDX.w #$0000

.branch02D41E
#_02D41E: PHX
#_02D41F: LDA.w SRAMtoWRAM_offset,X
#_02D422: CMP.w #$FFFF
#_02D425: BEQ .branch02D450

#_02D427: CLC
#_02D428: ADC.w $0E02
#_02D42B: STA.w $00E0
#_02D42E: LDA.w #$0070
#_02D431: STA.w $00E2
#_02D434: LDA.w SRAMtoWRAM_target,X
#_02D437: STA.w $00E3
#_02D43A: LDA.w SRAMtoWRAM_targetBnk,X
#_02D43D: STA.w $00E5
#_02D440: LDY.w SRAMtoWRAM_size,X
#_02D443: JSL WriteSRAMtoWRAM
#_02D447: PLX
#_02D448: TXA
#_02D449: CLC
#_02D44A: ADC.w #$0008
#_02D44D: TAX
#_02D44E: BRA .branch02D41E

.branch02D450
#_02D450: JSL SRAMAddCheckSum
#_02D454: PLX
#_02D455: PLB
#_02D456: PLP
#_02D457: RTL

;===================================================================================================

LoadSaveFile:
#_02D458: PHP
#_02D459: PHB
#_02D45A: PHK
#_02D45B: PLB

#_02D45C: SEP #$20
#_02D45E: STZ.w $0A58

#_02D461: REP #$30
#_02D463: STZ.w $0E02
#_02D466: AND.w #$0001
#_02D469: STA.w $0E04
#_02D46C: BEQ .branch02D474

#_02D46E: LDA.w #$1000
#_02D471: STA.w $0E02

.branch02D474
#_02D474: JSL SRAM_VerifyChecksum
#_02D478: BCS .branch02D4B3

#_02D47A: LDX.w #$0000

.branch02D47D
#_02D47D: PHX
#_02D47E: LDA.w SRAMtoWRAM_target,X
#_02D481: STA.w $00E0
#_02D484: LDA.w SRAMtoWRAM_targetBnk,X
#_02D487: STA.w $00E2
#_02D48A: LDY.w SRAMtoWRAM_size,X
#_02D48D: LDA.w SRAMtoWRAM_offset,X
#_02D490: CMP.w #$FFFF
#_02D493: BEQ .branch02D4AF

#_02D495: CLC
#_02D496: ADC.w $0E02
#_02D499: STA.w $00E3
#_02D49C: LDA.w #$0070
#_02D49F: STA.w $00E5
#_02D4A2: JSL WriteSRAMtoWRAM
#_02D4A6: PLX
#_02D4A7: TXA
#_02D4A8: CLC
#_02D4A9: ADC.w #$0008
#_02D4AC: TAX
#_02D4AD: BRA .branch02D47D

.branch02D4AF
#_02D4AF: PLX
#_02D4B0: PLB
#_02D4B1: PLP
#_02D4B2: RTL

.branch02D4B3
#_02D4B3: LDA.w #$FFFF
#_02D4B6: STA.w $0A58
#_02D4B9: PLB
#_02D4BA: PLP
#_02D4BB: RTL

;===================================================================================================

WriteSRAMtoWRAM:
#_02D4BC: PHP
#_02D4BD: PHB
#_02D4BE: PHK
#_02D4BF: PLB

#_02D4C0: SEP #$20
#_02D4C2: REP #$10
#_02D4C4: DEY

.branch02D4C5
#_02D4C5: LDA.b [$E3],Y
#_02D4C7: STA.b [$E0],Y
#_02D4C9: DEY
#_02D4CA: BPL .branch02D4C5

#_02D4CC: PLB
#_02D4CD: PLP
#_02D4CE: RTL

;===================================================================================================

SRAMAddCheckSum:
#_02D4CF: PHP
#_02D4D0: REP #$10
#_02D4D2: SEP #$20
#_02D4D4: LDX.w $0E02
#_02D4D7: LDY.w #$0000

.branch02D4DA
#_02D4DA: LDA.w SRAM_CheckSumTarget,Y
#_02D4DD: STA.l $700FF8,X
#_02D4E1: INX
#_02D4E2: INY
#_02D4E3: CPY.w #$0008
#_02D4E6: BNE .branch02D4DA

#_02D4E8: PLP
#_02D4E9: RTL

;===================================================================================================

SRAM_CheckSumTarget:
#_02D4EA: db $0E,$0E,$1D,$5A,$10,$13,$16,$0F

;===================================================================================================

SRAM_VerifyChecksum:
#_02D4F2: PHP
#_02D4F3: PHB
#_02D4F4: PHK
#_02D4F5: PLB

#_02D4F6: REP #$10
#_02D4F8: SEP #$20
#_02D4FA: LDX.w $0E02
#_02D4FD: LDY.w #$0000

.branch02D500
#_02D500: LDA.l $700FF8,X
#_02D504: CMP.w SRAM_CheckSumTarget,Y
#_02D507: BNE .branch02D514

#_02D509: INX
#_02D50A: INY
#_02D50B: CPY.w #$0008
#_02D50E: BNE .branch02D500

#_02D510: PLB
#_02D511: PLP
#_02D512: CLC
#_02D513: RTL

.branch02D514
#_02D514: PLB
#_02D515: PLP
#_02D516: SEC
#_02D517: RTL

;===================================================================================================

routine02D518:
#_02D518: PHP
#_02D519: PHB
#_02D51A: PHK
#_02D51B: PLB

#_02D51C: SEP #$30
#_02D51E: LDX.b #$00

.branch02D520
#_02D520: LDA.w data02D548,X
#_02D523: CMP.b #$FF
#_02D525: BEQ .branch02D540

#_02D527: CMP.w $070C
#_02D52A: BNE .branch02D534

#_02D52C: LDA.w data02D549,X
#_02D52F: CMP.w $070D
#_02D532: BEQ .branch02D538

.branch02D534
#_02D534: INX
#_02D535: INX
#_02D536: BRA .branch02D520

.branch02D538
#_02D538: TXA
#_02D539: LSR A
#_02D53A: STA.w $07E1
#_02D53D: PLB
#_02D53E: PLP
#_02D53F: RTL

.branch02D540
#_02D540: LDA.b #$12
#_02D542: STA.w $07E1
#_02D545: PLB
#_02D546: PLP
#_02D547: RTL

data02D548:
#_02D548: db $17

data02D549:
#_02D549: db $04,$12,$0A,$3F,$06,$67,$10,$27
#_02D551: db $18,$4C,$1D,$71,$18,$2A,$2B,$2F
#_02D559: db $3C,$6D,$0E,$06,$2D,$53,$0C,$1E
#_02D561: db $2D,$3A,$34,$00,$00,$48,$07,$19
#_02D569: db $06,$67,$1D,$FF

; TODO merge these tables into logical segments
SRAMtoWRAM_offset:
#_02D56D: dw $0000

SRAMtoWRAM_target:
#_02D56F: dd $000700

SRAMtoWRAM_size:
#_02D573: dw $0100

#_02D575: dw $0100
#_02D577: dd $001000
#_02D57B: dw $0600

#_02D57D: dw $0700
#_02D57F: dd $000400
#_02D583: dw $0100

#_02D585: dw $0800
#_02D587: dd $7E3000
#_02D58B: dw $0400

#_02D58D: dw $0C00
#_02D58F: dd $7E3400
#_02D593: dw $0100

#_02D595: dw $0D00
#_02D597: dd $7E3500
#_02D59B: dw $0100

#_02D59D: dw $FFFF

;===================================================================================================

routine02D59F:
#_02D59F: SEP #$20
#_02D5A1: PHB
#_02D5A2: PHK
#_02D5A3: PLB
#_02D5A4: JSL GetNextTextByte_long
#_02D5A8: STA.w $0993

.branch02D5AB
#_02D5AB: SEP #$20
#_02D5AD: REP #$10
#_02D5AF: JSR routine02E001
#_02D5B2: LDA.b #$00
#_02D5B4: JSR routine02DF8D
#_02D5B7: JSR routine02E197
#_02D5BA: JSR OhHeyAnotherRoutineThatJustRTS
#_02D5BD: JSR routine02D7A9

#_02D5C0: SEP #$30
#_02D5C2: STZ.w $098E
#_02D5C5: STZ.w $098C
#_02D5C8: STZ.w $098D
#_02D5CB: STZ.w $09F9
#_02D5CE: STZ.w $09FA
#_02D5D1: STZ.w $09F5
#_02D5D4: STZ.w $098F
#_02D5D7: STZ.w $0990
#_02D5DA: LDA.b #$00
#_02D5DC: LDX.b #$07

.branch02D5DE
#_02D5DE: STA.w $09AC,X
#_02D5E1: STA.w $09A4,X
#_02D5E4: STA.w $09E4,X
#_02D5E7: STA.w $09DC,X
#_02D5EA: STA.w $09D4,X
#_02D5ED: STA.w $09CC,X
#_02D5F0: STA.w $09C4,X
#_02D5F3: STA.w $09BC,X
#_02D5F6: STA.w $09B4,X
#_02D5F9: STA.w $099C,X
#_02D5FC: STA.w $0994,X
#_02D5FF: DEX
#_02D600: BPL .branch02D5DE

#_02D602: LDA.b #$FF
#_02D604: STA.w $0991
#_02D607: STA.w $0992
#_02D60A: JSR routine02D855
#_02D60D: JSR routine02DB81

.branch02D610
#_02D610: SEP #$20
#_02D612: INC.w $0B2D
#_02D615: JSL AddSelfAsVector
#_02D619: JSR routine02D7C0
#_02D61C: JSR routine02DBBE
#_02D61F: JSR routine02D9DF

#_02D622: SEP #$20
#_02D624: LDA.w $098F
#_02D627: BEQ .branch02D610

#_02D629: JSR routine02DBA5
#_02D62C: JSR routine02D699

#_02D62F: SEP #$20
#_02D631: LDA.w $098F
#_02D634: BNE .branch02D639

#_02D636: JMP .branch02D5AB

.branch02D639
#_02D639: JSR routine02DBA5
#_02D63C: JSR routine02E001
#_02D63F: JSL routine02CBA4
#_02D643: JSL routine02D65F

#_02D647: SEP #$20
#_02D649: LDA.b #$FF
#_02D64B: JSR routine02DF8D
#_02D64E: JSL routine00A17E
#_02D652: JSR routine02E197

#_02D655: SEP #$20
#_02D657: LDA.b #$07
#_02D659: JSL routine02CBD1
#_02D65D: PLB
#_02D65E: RTL

;===================================================================================================

routine02D65F:
#_02D65F: SEP #$30
#_02D661: LDX.b #$00
#_02D663: LDY.b #$00
#_02D665: LDA.b #$00

.branch02D667
#_02D667: LDA.b #$00
#_02D669: STA.w $0000,X
#_02D66C: STA.w $0001,X
#_02D66F: LDA.b #$80
#_02D671: STA.w $1A00,Y
#_02D674: INY
#_02D675: INX
#_02D676: INX
#_02D677: CPY.b #$0A
#_02D679: BNE .branch02D667

#_02D67B: RTL

;===================================================================================================

routine02D67C:
#_02D67C: SEP #$30
#_02D67E: LDX.b #$00
#_02D680: LDY.b #$00
#_02D682: LDA.b #$00

.branch02D684
#_02D684: LDA.b #$00
#_02D686: STA.w $0000,X
#_02D689: STA.w $0001,X
#_02D68C: LDA.b #$80
#_02D68E: STA.w $1A00,Y
#_02D691: INY
#_02D692: INX
#_02D693: INX
#_02D694: CPY.b #$10
#_02D696: BNE .branch02D684

#_02D698: RTL

;===================================================================================================

routine02D699:
#_02D699: SEP #$30
#_02D69B: LDY.b #$00
#_02D69D: LDX.b #$07

.branch02D69F
#_02D69F: LDA.w $09A4,X
#_02D6A2: BEQ .branch02D6A8

#_02D6A4: CMP.b #$CF
#_02D6A6: BNE .branch02D6A9

.branch02D6A8
#_02D6A8: INY

.branch02D6A9
#_02D6A9: DEX
#_02D6AA: BPL .branch02D69F

#_02D6AC: STY.w $0E00
#_02D6AF: CPY.b #$08
#_02D6B1: BEQ routine02D6FE

#_02D6B3: LDX.b #$07

.branch02D6B5
#_02D6B5: LDA.w $09A4,X
#_02D6B8: BEQ .branch02D6BE

#_02D6BA: CMP.b #$CF
#_02D6BC: BNE .branch02D6C6

.branch02D6BE
#_02D6BE: LDA.b #$FF
#_02D6C0: STA.w $09A4,X
#_02D6C3: DEX
#_02D6C4: BPL .branch02D6B5

.branch02D6C6
#_02D6C6: JSR routine02D77A
#_02D6C9: BCS routine02D6FE

#_02D6CB: LDX.b #$07
#_02D6CD: LDY.b #$00

.branch02D6CF
#_02D6CF: LDA.w $09A4,X
#_02D6D2: BEQ .branch02D6D7

#_02D6D4: INY
#_02D6D5: BRA .branch02D6E5

.branch02D6D7
#_02D6D7: LDA.b #$FF
#_02D6D9: STA.w $09A4,X
#_02D6DC: CPY.b #$00
#_02D6DE: BEQ .branch02D6E5

#_02D6E0: LDA.b #$CF
#_02D6E2: STA.w $09A4,X

.branch02D6E5
#_02D6E5: DEX
#_02D6E6: BPL .branch02D6CF

#_02D6E8: LDA.w $0993
#_02D6EB: ASL A
#_02D6EC: ASL A
#_02D6ED: ASL A
#_02D6EE: TAX
#_02D6EF: LDY.b #$00

.branch02D6F1
#_02D6F1: LDA.w $09A4,Y
#_02D6F4: STA.w $0410,X
#_02D6F7: INX
#_02D6F8: INY
#_02D6F9: CPY.b #$08
#_02D6FB: BNE .branch02D6F1

#_02D6FD: RTS

;===================================================================================================

routine02D6FE:
#_02D6FE: JSL routine02D65F
#_02D702: JSR routine02D70A
#_02D705: JSL AddSelfAsVector
#_02D709: RTS

;===================================================================================================

routine02D70A:
#_02D70A: SEP #$30
#_02D70C: STZ.w $098F

#_02D70F: REP #$30
#_02D711: LDX.w #$0000

.branch02D714
#_02D714: REP #$30
#_02D716: PHX
#_02D717: PHP
#_02D718: TXA
#_02D719: ASL A
#_02D71A: TAY
#_02D71B: LDA.w data02DCFC,Y
#_02D71E: STA.w $0102
#_02D721: LDA.w #$0002
#_02D724: STA.w $0104

#_02D727: SEP #$20
#_02D729: LDA.w $0A2C
#_02D72C: STA.w $0107
#_02D72F: STA.w $0109
#_02D732: LDA.b #$CF
#_02D734: STA.w $0106
#_02D737: LDA.w data02D772,X
#_02D73A: STA.w $0108

#_02D73D: REP #$20
#_02D73F: LDA.w #$8001
#_02D742: STA.w $0100
#_02D745: JSL AddSelfAsVector
#_02D749: PLP
#_02D74A: PLX
#_02D74B: LDA.w $0F2B
#_02D74E: BEQ .branch02D751
#_02D750: RTS

.branch02D751
#_02D751: INX
#_02D752: CPX.w #$0008
#_02D755: BNE .branch02D714

#_02D757: REP #$20
#_02D759: LDY.w #$0014

#_02D75C: REP #$20
#_02D75E: PHY
#_02D75F: PHP
#_02D760: JSL AddSelfAsVector
#_02D764: PLP
#_02D765: PLY
#_02D766: LDA.w $0F2B
#_02D769: BEQ .branch02D76C
#_02D76B: RTS

.branch02D76C
#_02D76C: JSR routine02D7A9
#_02D76F: JMP routine02D70A

data02D772:
#_02D772: db $18,$19,$CF,$11,$19,$19,$0E,$94

routine02D77A:
#_02D77A: PHP
#_02D77B: SEP #$30
#_02D77D: LDX.b #$00

.branch02D77F
#_02D77F: PHX
#_02D780: CPX.w $0993
#_02D783: BEQ .branch02D79E

#_02D785: TXA
#_02D786: ASL A
#_02D787: ASL A
#_02D788: ASL A
#_02D789: TAX
#_02D78A: LDY.b #$00

.branch02D78C
#_02D78C: LDA.w $09A4,Y
#_02D78F: CMP.w $0410,X
#_02D792: BNE .branch02D79E

#_02D794: INY
#_02D795: INX
#_02D796: CPY.b #$08
#_02D798: BNE .branch02D78C

#_02D79A: PLX
#_02D79B: PLP
#_02D79C: SEC
#_02D79D: RTS

.branch02D79E
#_02D79E: PLX
#_02D79F: INX
#_02D7A0: CPX.b #$04
#_02D7A2: BNE .branch02D77F

#_02D7A4: PLP
#_02D7A5: CLC
#_02D7A6: RTS

#_02D7A7: RTS

OhHeyAnotherRoutineThatJustRTS:
#_02D7A8: RTS

;===================================================================================================

routine02D7A9:
#_02D7A9: SEP #$30
#_02D7AB: LDX.b #$00
#_02D7AD: STX.w $098E

.branch02D7B0
#_02D7B0: JSR routine02DAC2
#_02D7B3: INC.w $098E
#_02D7B6: INX
#_02D7B7: CPX.b #$08
#_02D7B9: BNE .branch02D7B0

#_02D7BB: JSL AddSelfAsVector
#_02D7BF: RTS

;===================================================================================================

routine02D7C0:
#_02D7C0: SEP #$20
#_02D7C2: REP #$10
#_02D7C4: LDA.w $098C
#_02D7C7: STA.w $0991
#_02D7CA: LDA.w $098D
#_02D7CD: STA.w $0992
#_02D7D0: LDX.w $0F2D
#_02D7D3: BEQ .branch02D7F2

#_02D7D5: CPX.w $09F9
#_02D7D8: BNE .branch02D7F2

#_02D7DA: INC.w $09F5
#_02D7DD: LDA.w $09F5
#_02D7E0: CMP.b #$20
#_02D7E2: BNE .branch02D7F5

#_02D7E4: SEC
#_02D7E5: SBC.b #$05
#_02D7E7: STA.w $09F5
#_02D7EA: LDX.w $0F2D
#_02D7ED: STX.w $0F2B
#_02D7F0: BRA .branch02D7F5

.branch02D7F2
#_02D7F2: STZ.w $09F5

.branch02D7F5
#_02D7F5: LDX.w $0F2D
#_02D7F8: STX.w $09F9

#_02D7FB: REP #$20
#_02D7FD: LDA.w $0F2B
#_02D800: AND.w #$0800
#_02D803: BEQ .branch02D810

#_02D805: SEP #$20
#_02D807: DEC.w $098D
#_02D80A: LDA.b #$01 ; SFX 01
#_02D80C: JSL WriteAPUCareful

.branch02D810
#_02D810: REP #$20
#_02D812: LDA.w $0F2B
#_02D815: AND.w #$0400
#_02D818: BEQ .branch02D825

#_02D81A: SEP #$20
#_02D81C: INC.w $098D
#_02D81F: LDA.b #$01 ; SFX 01
#_02D821: JSL WriteAPUCareful

.branch02D825
#_02D825: REP #$20
#_02D827: LDA.w $0F2B
#_02D82A: AND.w #$0200
#_02D82D: BEQ .branch02D83A

#_02D82F: SEP #$20
#_02D831: DEC.w $098C
#_02D834: LDA.b #$01 ; SFX 01
#_02D836: JSL WriteAPUCareful

.branch02D83A
#_02D83A: REP #$20
#_02D83C: LDA.w $0F2B
#_02D83F: AND.w #$0100
#_02D842: BEQ .branch02D84F

#_02D844: SEP #$20
#_02D846: INC.w $098C
#_02D849: LDA.b #$01 ; SFX 01
#_02D84B: JSL WriteAPUCareful

.branch02D84F
#_02D84F: JSR routine02D897
#_02D852: JSR routine02D8AC

routine02D855:
#_02D855: SEP #$30
#_02D857: LDA.w $098C
#_02D85A: CMP.w $0991
#_02D85D: BNE .branch02D868

#_02D85F: LDA.w $098D
#_02D862: CMP.w $0992
#_02D865: BNE .branch02D868

#_02D867: RTS

.branch02D868
#_02D868: LDY.w $098C
#_02D86B: LDA.w data02D884,Y
#_02D86E: STA.w $09F6
#_02D871: LDY.w $098D
#_02D874: LDA.w data02D891,Y
#_02D877: STA.w $09F7
#_02D87A: LDA.b #$07
#_02D87C: STA.w $09F4
#_02D87F: JSL routine02C9D5
#_02D883: RTS

data02D884:
#_02D884: db $14,$24,$34,$44,$54,$6C,$7C,$8C
#_02D88C: db $9C,$AC,$C4,$D4,$E4

data02D891:
#_02D891: db $90,$9C,$A8,$B4,$C0,$CC

routine02D897:
#_02D897: SEP #$30
#_02D899: LDA.w $098D
#_02D89C: BPL .branch02D8A3

#_02D89E: LDA.b #$05
#_02D8A0: STA.w $098D

.branch02D8A3
#_02D8A3: CMP.b #$06
#_02D8A5: BCS .branch02D8A8
#_02D8A7: RTS

.branch02D8A8
#_02D8A8: STZ.w $098D
#_02D8AB: RTS

;===================================================================================================

routine02D8AC:
#_02D8AC: SEP #$30
#_02D8AE: LDA.w $098C
#_02D8B1: BPL .branch02D8B8

#_02D8B3: LDA.b #$0C
#_02D8B5: STA.w $098C

.branch02D8B8
#_02D8B8: LDA.w $098C
#_02D8BB: CMP.b #$0A
#_02D8BD: BCS .branch02D8C0

#_02D8BF: RTS

.branch02D8C0
#_02D8C0: STZ.w $0E00
#_02D8C3: LDA.w $0990
#_02D8C6: AND.b #$01
#_02D8C8: BEQ .branch02D8CF

#_02D8CA: LDA.b #$12
#_02D8CC: STA.w $0E00

.branch02D8CF
#_02D8CF: LDA.w $098D
#_02D8D2: ASL A
#_02D8D3: CLC
#_02D8D4: ADC.w $098D
#_02D8D7: CLC
#_02D8D8: ADC.w $098C
#_02D8DB: SEC
#_02D8DC: SBC.b #$0A
#_02D8DE: CLC
#_02D8DF: ADC.w $0E00
#_02D8E2: TAX
#_02D8E3: LDA.w $0F2C
#_02D8E6: AND.b #$08
#_02D8E8: BEQ .branch02D8ED

#_02D8EA: JSR routine02D917

.branch02D8ED
#_02D8ED: LDA.w $0F2C
#_02D8F0: AND.b #$04
#_02D8F2: BEQ .branch02D8F7

#_02D8F4: JSR routine02D936

.branch02D8F7
#_02D8F7: LDA.w $0F2C
#_02D8FA: AND.b #$02
#_02D8FC: BEQ .branch02D901

#_02D8FE: JSR routine02D910

.branch02D901
#_02D901: LDA.w $0F2C
#_02D904: AND.b #$01
#_02D906: BNE .branch02D909
#_02D908: RTS

.branch02D909
#_02D909: LDA.w data02D9BB,X
#_02D90C: STA.w $098C
#_02D90F: RTS

;===================================================================================================

routine02D910:
#_02D910: LDA.w data02D997,X
#_02D913: STA.w $098C
#_02D916: RTS

;===================================================================================================

routine02D917:
#_02D917: LDA.w data02D94F,X
#_02D91A: STA.w $098C
#_02D91D: LDA.w $098D
#_02D920: CMP.b #$05
#_02D922: BNE .branch02D925

#_02D924: RTS

.branch02D925
#_02D925: LDA.w $0990
#_02D928: AND.b #$01
#_02D92A: BEQ .branch02D930

#_02D92C: STZ.w $098D
#_02D92F: RTS

.branch02D930
#_02D930: LDA.b #$05
#_02D932: STA.w $098D
#_02D935: RTS

;===================================================================================================

routine02D936:
#_02D936: LDA.w data02D973,X
#_02D939: STA.w $098C
#_02D93C: LDA.w $0990
#_02D93F: AND.b #$01
#_02D941: BEQ .branch02D949

#_02D943: LDA.w $098D
#_02D946: BNE .branch02D949

#_02D948: RTS

.branch02D949
#_02D949: LDA.b #$05
#_02D94B: STA.w $098D
#_02D94E: RTS

data02D94F:
#_02D94F: db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
#_02D957: db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
#_02D95F: db $0B,$0B,$0A,$0B,$0C,$0A,$0B,$0C
#_02D967: db $0A,$0B,$0C,$0A,$0B,$0C,$0A,$0B
#_02D96F: db $0C,$0B,$0B,$0B

data02D973:
#_02D973: db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
#_02D97B: db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
#_02D983: db $0B,$0B,$0A,$0B,$0C,$0B,$0B,$0B
#_02D98B: db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
#_02D993: db $0B,$0B,$0B,$0B

data02D997:
#_02D997: db $09,$09,$09,$09,$09,$09,$09,$09
#_02D99F: db $09,$09,$09,$09,$09,$09,$09,$09
#_02D9A7: db $0B,$0B,$0A,$0B,$0C,$09,$09,$09
#_02D9AF: db $09,$09,$09,$09,$09,$09,$09,$09
#_02D9B7: db $09,$09,$0B,$0B

data02D9BB:
#_02D9BB: db $00,$00,$00,$00,$00,$00,$00,$00
#_02D9C3: db $00,$00,$00,$00,$00,$00,$00,$0B
#_02D9CB: db $0B,$00,$0A,$0B,$0C,$00,$00,$00
#_02D9D3: db $00,$00,$00,$00,$00,$00,$00,$00
#_02D9DB: db $00,$0B,$0B,$00

routine02D9DF:
#_02D9DF: REP #$30
#_02D9E1: LDA.w $0F2B
#_02D9E4: BIT.w #$0080
#_02D9E7: BEQ .branch02D9EC

#_02D9E9: JMP .branch02DA30

.branch02D9EC
#_02D9EC: BIT.w #$8000
#_02D9EF: BEQ .branch02D9F4

#_02D9F1: JMP .branch02DA8C

.branch02D9F4
#_02D9F4: BIT.w #$0040
#_02D9F7: BEQ .branch02D9FC

#_02D9F9: JMP routine02DB45

.branch02D9FC
#_02D9FC: BIT.w #$4000
#_02D9FF: BEQ .branch02DA04

#_02DA01: JMP routine02DB59

.branch02DA04
#_02DA04: BIT.w #$0020
#_02DA07: BEQ .branch02DA0C

#_02DA09: JMP routine02DB0A

.branch02DA0C
#_02DA0C: BIT.w #$0010
#_02DA0F: BEQ .branch02DA14

#_02DA11: JMP routine02DB1B

.branch02DA14
#_02DA14: BIT.w #$1000
#_02DA17: BNE .branch02DA1A

#_02DA19: RTS

.branch02DA1A
#_02DA1A: LDA.w #$0002 ; SFX 02
#_02DA1D: JSL WriteAPUCareful

#_02DA21: SEP #$30
#_02DA23: LDA.b #$0B
#_02DA25: STA.w $098C

#_02DA28: LDA.b #$05
#_02DA2A: STA.w $098D
#_02DA2D: JMP routine02D855

.branch02DA30
#_02DA30: SEP #$30
#_02DA32: LDA.b #$02 ; SFX 02
#_02DA34: JSL WriteAPUCareful
#_02DA38: LDX.w $098E
#_02DA3B: LDA.w $09AC,X
#_02DA3E: BNE .branch02DA75

#_02DA40: LDA.w $098E
#_02DA43: INC A
#_02DA44: STA.w $09AC,X
#_02DA47: LDA.w $09F6
#_02DA4A: STA.w $0994,X
#_02DA4D: STA.w $09C4,X
#_02DA50: LDA.w $09F7
#_02DA53: STA.w $099C,X
#_02DA56: STA.w $09CC,X
#_02DA59: LDA.b #$07
#_02DA5B: STA.w $09E4,X
#_02DA5E: LDA.b #$00
#_02DA60: STA.w $09DC,X
#_02DA63: LDA.w $0B2D
#_02DA66: AND.b #$0F
#_02DA68: SEC
#_02DA69: SBC.b #$07
#_02DA6B: STA.w $09D4,X
#_02DA6E: PHX
#_02DA6F: PHP
#_02DA70: JSR routine02DDFD
#_02DA73: PLP
#_02DA74: PLX

.branch02DA75
#_02DA75: LDA.w data02DA84,X
#_02DA78: STA.w $09B4,X
#_02DA7B: LDA.b #$7C
#_02DA7D: STA.w $09BC,X
#_02DA80: JSR routine02DB1B
#_02DA83: RTS

data02DA84:
#_02DA84: db $3C,$4C,$5C,$6C,$7C,$8C,$9C,$AC

.branch02DA8C
#_02DA8C: SEP #$30
#_02DA8E: LDA.b #$03 ; SFX 03
#_02DA90: JSL WriteAPUCareful
#_02DA94: JSR routine02DB0A
#_02DA97: LDX.w $098E
#_02DA9A: LDA.w $09C4,X
#_02DA9D: STA.w $09B4,X
#_02DAA0: LDA.w $09CC,X
#_02DAA3: STA.w $09BC,X
#_02DAA6: LDA.b #$07
#_02DAA8: STA.w $09E4,X
#_02DAAB: LDA.w $09AC,X
#_02DAAE: BNE .branch02DAB3

#_02DAB0: JSR routine02DAC2

.branch02DAB3
#_02DAB3: LDA.w $099C,X
#_02DAB6: CMP.b #$7C
#_02DAB8: BNE .branch02DAC1

#_02DABA: LDA.w $098E
#_02DABD: INC A
#_02DABE: STA.w $09AC,X

.branch02DAC1
#_02DAC1: RTS

;===================================================================================================

routine02DAC2:
#_02DAC2: PHX
#_02DAC3: PHP
#_02DAC4: LDA.b #$07
#_02DAC6: STA.w $09E4,X

#_02DAC9: REP #$20
#_02DACB: LDA.w $0100
#_02DACE: BEQ .branch02DAD4

#_02DAD0: JSL AddSelfAsVector

.branch02DAD4
#_02DAD4: SEP #$20
#_02DAD6: LDA.w $0A2C
#_02DAD9: STA.w $0107
#_02DADC: STA.w $0109
#_02DADF: LDA.b #$CF
#_02DAE1: STA.w $0106
#_02DAE4: LDA.b #$9C
#_02DAE6: STA.w $0108

#_02DAE9: REP #$20
#_02DAEB: LDA.w $098E
#_02DAEE: AND.w #$00FF
#_02DAF1: ASL A
#_02DAF2: TAX
#_02DAF3: LDA.w data02DCFC,X
#_02DAF6: STA.w $0102
#_02DAF9: LDA.w #$0002
#_02DAFC: STA.w $0104
#_02DAFF: LDA.w #$8002
#_02DB02: STA.w $0100

#_02DB05: SEP #$20
#_02DB07: PLP
#_02DB08: PLX
#_02DB09: RTS

;===================================================================================================

routine02DB0A:
#_02DB0A: SEP #$30
#_02DB0C: DEC.w $098E
#_02DB0F: LDA.w $098E
#_02DB12: AND.b #$07
#_02DB14: STA.w $098E
#_02DB17: JSR routine02DB81
#_02DB1A: RTS

;===================================================================================================

routine02DB1B:
#_02DB1B: SEP #$30
#_02DB1D: INC.w $098E
#_02DB20: LDA.w $098E
#_02DB23: AND.b #$07
#_02DB25: STA.w $098E
#_02DB28: JSR routine02DB81
#_02DB2B: RTS

;===================================================================================================

routine02DB2C:
#_02DB2C: PHP
#_02DB2D: LDA.w $0990
#_02DB30: AND.b #$01
#_02DB32: BNE .branch02DB43

#_02DB34: LDA.w $098C
#_02DB37: CMP.b #$0A
#_02DB39: BCC .branch02DB43

#_02DB3B: LDA.b #$09
#_02DB3D: STA.w $098C
#_02DB40: JSR routine02D855

.branch02DB43
#_02DB43: PLP
#_02DB44: RTS

;===================================================================================================

routine02DB45:
#_02DB45: PHP
#_02DB46: SEP #$20
#_02DB48: LDA.b #$02 ; SFX 02
#_02DB4A: JSL WriteAPUCareful
#_02DB4E: INC.w $0990
#_02DB51: JSR routine02DB6D
#_02DB54: JSR routine02DB2C
#_02DB57: PLP
#_02DB58: RTS

;===================================================================================================

routine02DB59:
#_02DB59: PHP
#_02DB5A: SEP #$20
#_02DB5C: LDA.b #$02 ; SFX 02
#_02DB5E: JSL WriteAPUCareful
#_02DB62: DEC.w $0990
#_02DB65: JSR routine02DB6D
#_02DB68: JSR routine02DB2C
#_02DB6B: PLP
#_02DB6C: RTS

;===================================================================================================

routine02DB6D:
#_02DB6D: JSR routine02E001

#_02DB70: SEP #$20
#_02DB72: LDA.w $0990
#_02DB75: AND.b #$03
#_02DB77: STA.w $0990
#_02DB7A: JSR routine02DF8D
#_02DB7D: JSR routine02E197
#_02DB80: RTS

;===================================================================================================

routine02DB81:
#_02DB81: REP #$20
#_02DB83: SEP #$10
#_02DB85: LDX.w $098E
#_02DB88: LDA.w data02DA84,X
#_02DB8B: AND.w #$00FF
#_02DB8E: STA.w $1A72
#_02DB91: LDA.w #$007A
#_02DB94: STA.w $1AB2
#_02DB97: LDA.w #$000E
#_02DB9A: STA.w $0012

#_02DB9D: SEP #$20
#_02DB9F: LDA.b #$80
#_02DBA1: STA.w $1A09
#_02DBA4: RTS

;===================================================================================================

routine02DBA5:
#_02DBA5: REP #$20
#_02DBA7: LDA.w #$00F0
#_02DBAA: STA.w $1A72
#_02DBAD: STA.w $1AB2
#_02DBB0: LDA.w #$0000
#_02DBB3: STA.w $0012

#_02DBB6: SEP #$20
#_02DBB8: LDA.b #$80
#_02DBBA: STA.w $1A09
#_02DBBD: RTS

;===================================================================================================

routine02DBBE:
#_02DBBE: SEP #$30
#_02DBC0: LDX.b #$00

.branch02DBC2
#_02DBC2: LDA.w $09AC,X
#_02DBC5: BNE .branch02DBCA

#_02DBC7: JMP routine02DBF5

.branch02DBCA
#_02DBCA: LDA.w $0994,X
#_02DBCD: SEC
#_02DBCE: SBC.w $09B4,X
#_02DBD1: BEQ .branch02DBDB

#_02DBD3: CMP.b #$01
#_02DBD5: BEQ .branch02DBDB

#_02DBD7: CMP.b #$FF
#_02DBD9: BNE .branch02DBEF

.branch02DBDB
#_02DBDB: LDA.w $099C,X
#_02DBDE: SEC
#_02DBDF: SBC.w $09BC,X
#_02DBE2: BEQ .branch02DBEC

#_02DBE4: CMP.b #$01
#_02DBE6: BEQ .branch02DBEC

#_02DBE8: CMP.b #$FF
#_02DBEA: BNE .branch02DBEF

.branch02DBEC
#_02DBEC: JMP .branch02DBFE

.branch02DBEF
#_02DBEF: JSR routine02DD68
#_02DBF2: JSR routine02DC25

routine02DBF5:
#_02DBF5: INX
#_02DBF6: CPX.b #$08
#_02DBF8: BEQ .branch02DBFD

#_02DBFA: JMP .branch02DBC2

.branch02DBFD
#_02DBFD: RTS

.branch02DBFE
#_02DBFE: LDA.w $09BC,X
#_02DC01: STA.w $099C,X
#_02DC04: LDA.w $09B4,X
#_02DC07: STA.w $0994,X
#_02DC0A: JSR routine02DC52
#_02DC0D: LDA.b #$00
#_02DC0F: STA.w $09AC,X
#_02DC12: LDA.w $099C,X
#_02DC15: CMP.b #$7C
#_02DC17: BEQ .branch02DC20

#_02DC19: LDA.b #$00
#_02DC1B: STA.w $09A4,X
#_02DC1E: BRA routine02DBF5

.branch02DC20
#_02DC20: JSR routine02DC7F
#_02DC23: BRA routine02DBF5

routine02DC25:
#_02DC25: SEP #$30
#_02DC27: PHX
#_02DC28: TXY
#_02DC29: LDA.w $09AC,X
#_02DC2C: DEC A
#_02DC2D: ASL A
#_02DC2E: TAX

#_02DC2F: REP #$20
#_02DC31: LDA.w $0994,Y
#_02DC34: AND.w #$00FF
#_02DC37: STA.w $1A62,X
#_02DC3A: LDA.w $099C,Y
#_02DC3D: AND.w #$00FF
#_02DC40: STA.w $1AA2,X
#_02DC43: LDA.w #$000F
#_02DC46: STA.w $0002,X
#_02DC49: PLX

#_02DC4A: SEP #$20
#_02DC4C: LDA.b #$80
#_02DC4E: STA.w $1A01,X
#_02DC51: RTS

;===================================================================================================

routine02DC52:
#_02DC52: SEP #$30
#_02DC54: PHX
#_02DC55: TXY
#_02DC56: LDA.w $09AC,X
#_02DC59: DEC A
#_02DC5A: ASL A
#_02DC5B: TAX

#_02DC5C: REP #$20
#_02DC5E: LDA.w $0994,Y
#_02DC61: AND.w #$00FF
#_02DC64: STA.w $1A62,X
#_02DC67: LDA.w $099C,Y
#_02DC6A: AND.w #$00FF
#_02DC6D: STA.w $1AA2,X
#_02DC70: LDA.w #$0010
#_02DC73: STA.w $0002,X
#_02DC76: PLX

#_02DC77: SEP #$20
#_02DC79: LDA.b #$80
#_02DC7B: STA.w $1A01,X
#_02DC7E: RTS

;===================================================================================================

routine02DC7F:
#_02DC7F: PHX
#_02DC80: PHP
#_02DC81: SEP #$30
#_02DC83: LDA.w $0A2C
#_02DC86: STA.w $0109
#_02DC89: STA.w $0107
#_02DC8C: LDA.w $09A4,X
#_02DC8F: CMP.b #$CF
#_02DC91: BEQ .branch02DCD3

#_02DC93: CMP.b #$9C
#_02DC95: BCC .branch02DCD3

#_02DC97: CMP.b #$B5
#_02DC99: BCC .branch02DCB7

#_02DC9B: SEC
#_02DC9C: SBC.b #$B5
#_02DC9E: TAY
#_02DC9F: LDA.b #$9E
#_02DCA1: STA.w $0106
#_02DCA4: LDA.w data02DD25,Y
#_02DCA7: STA.w $0108
#_02DCAA: CPY.b #$14
#_02DCAC: BCC .branch02DCDB

#_02DCAE: LDA.w $0106
#_02DCB1: INC A
#_02DCB2: STA.w $0106
#_02DCB5: BRA .branch02DCDB

.branch02DCB7
#_02DCB7: SEC
#_02DCB8: SBC.b #$9C
#_02DCBA: TAY
#_02DCBB: LDA.b #$9E
#_02DCBD: STA.w $0106
#_02DCC0: LDA.w data02DD0C,Y
#_02DCC3: STA.w $0108
#_02DCC6: CPY.b #$14
#_02DCC8: BCC .branch02DCDB

#_02DCCA: LDA.w $0106
#_02DCCD: INC A
#_02DCCE: STA.w $0106
#_02DCD1: BRA .branch02DCDB

.branch02DCD3
#_02DCD3: STA.w $0108
#_02DCD6: LDA.b #$CF
#_02DCD8: STA.w $0106

.branch02DCDB
#_02DCDB: REP #$20
#_02DCDD: TXA
#_02DCDE: AND.w #$00FF
#_02DCE1: ASL A
#_02DCE2: TAX
#_02DCE3: LDA.w data02DCFC,X
#_02DCE6: STA.w $0102
#_02DCE9: LDA.w #$0002
#_02DCEC: STA.w $0104
#_02DCEF: LDA.w #$8001
#_02DCF2: STA.w $0100
#_02DCF5: JSL AddSelfAsVector
#_02DCF9: PLP
#_02DCFA: PLX
#_02DCFB: RTS

data02DCFC:
#_02DCFC: dw $3DE8,$3DEA,$3DEC,$3DEE
#_02DD04: dw $3DF0,$3DF2,$3DF4,$3DF6

data02DD0C:
#_02DD0C: db $2A,$2B,$2C,$2D,$2E,$2F,$30,$31
#_02DD14: db $32,$33,$34,$35,$36,$37,$38,$3E
#_02DD1C: db $3F,$40,$41,$42,$3E,$3F,$40,$41
#_02DD24: db $42

data02DD25:
#_02DD25: db $62,$63,$64,$65,$66,$67,$68,$69
#_02DD2D: db $6A,$6B,$6C,$6D,$6E,$6F,$70,$76
#_02DD35: db $77,$78,$79,$7A,$76,$77,$78,$79
#_02DD3D: db $7A

data02DD3E:
#_02DD3E: SEP #$30
#_02DD40: LDA.w $0994,X
#_02DD43: CMP.w $09B4,X
#_02DD46: BNE .branch02DD49

#_02DD48: RTS

.branch02DD49
#_02DD49: BCC .branch02DD4F

#_02DD4B: DEC.w $0994,X
#_02DD4E: RTS

.branch02DD4F
#_02DD4F: INC.w $0994,X
#_02DD52: RTS

; TODO POSSIBLY UNUSED ROUTINE
routine02DD53:
#_02DD53: SEP #$30
#_02DD55: LDA.w $099C,X
#_02DD58: CMP.w $09BC,X
#_02DD5B: BNE .branch02DD5E

#_02DD5D: RTS

.branch02DD5E
#_02DD5E: BCC .branch02DD64

#_02DD60: DEC.w $099C,X
#_02DD63: RTS

.branch02DD64
#_02DD64: INC.w $099C,X
#_02DD67: RTS

;===================================================================================================

routine02DD68:
#_02DD68: PHX
#_02DD69: PHP
#_02DD6A: LDA.w $09DC,X
#_02DD6D: BNE .branch02DD77

#_02DD6F: DEC.w $09E4,X
#_02DD72: BNE .branch02DD77

#_02DD74: INC.w $09E4,X

.branch02DD77
#_02DD77: LDA.w $09D4,X
#_02DD7A: BNE .branch02DD84

#_02DD7C: DEC.w $09E4,X
#_02DD7F: BNE .branch02DD84

#_02DD81: INC.w $09E4,X

.branch02DD84
#_02DD84: LDA.w $099C,X
#_02DD87: CMP.w $09BC,X
#_02DD8A: BCC .branch02DD91

#_02DD8C: DEC.w $09DC,X
#_02DD8F: BRA .branch02DD94

.branch02DD91
#_02DD91: INC.w $09DC,X

.branch02DD94
#_02DD94: LDA.w $0994,X
#_02DD97: CMP.w $09B4,X
#_02DD9A: BCC .branch02DDA1

#_02DD9C: DEC.w $09D4,X
#_02DD9F: BRA .branch02DDA4

.branch02DDA1
#_02DDA1: INC.w $09D4,X

.branch02DDA4
#_02DDA4: LDA.w $09DC,X
#_02DDA7: BMI .branch02DDB6

#_02DDA9: CMP.w $09E4,X
#_02DDAC: BCC .branch02DDC5

#_02DDAE: LDA.w $09E4,X
#_02DDB1: STA.w $09DC,X
#_02DDB4: BRA .branch02DDC5

.branch02DDB6
#_02DDB6: CLC
#_02DDB7: ADC.w $09E4,X
#_02DDBA: BPL .branch02DDC5

#_02DDBC: LDA.w $09E4,X
#_02DDBF: EOR.w #$1AFF
#_02DDC2: STA.w $09DC,X

.branch02DDC5
#_02DDC5: LDA.w $09D4,X
#_02DDC8: BMI .branch02DDD7

#_02DDCA: CMP.w $09E4,X
#_02DDCD: BCC .branch02DDE6

#_02DDCF: LDA.w $09E4,X
#_02DDD2: STA.w $09D4,X
#_02DDD5: BRA .branch02DDE6

.branch02DDD7
#_02DDD7: CLC
#_02DDD8: ADC.w $09E4,X
#_02DDDB: BPL .branch02DDE6

#_02DDDD: LDA.w $09E4,X
#_02DDE0: EOR.w #$1AFF
#_02DDE3: STA.w $09D4,X

.branch02DDE6
#_02DDE6: LDA.w $099C,X
#_02DDE9: CLC
#_02DDEA: ADC.w $09DC,X
#_02DDED: STA.w $099C,X
#_02DDF0: LDA.w $0994,X
#_02DDF3: CLC
#_02DDF4: ADC.w $09D4,X
#_02DDF7: STA.w $0994,X
#_02DDFA: PLP
#_02DDFB: PLX
#_02DDFC: RTS

;===================================================================================================

routine02DDFD:
#_02DDFD: REP #$30
#_02DDFF: LDA.w $0990
#_02DE02: AND.w #$00FF
#_02DE05: STA.w $0E10
#_02DE08: LDA.w #$004E
#_02DE0B: STA.w $0E12
#_02DE0E: JSL BigMultiplication_long
#_02DE12: LDA.w $0E14
#_02DE15: STA.w $0E00
#_02DE18: LDA.w $098D
#_02DE1B: AND.w #$00FF
#_02DE1E: STA.w $0E10
#_02DE21: LDA.w #$000D
#_02DE24: STA.w $0E12
#_02DE27: JSL BigMultiplication_long
#_02DE2B: LDA.w $098C
#_02DE2E: AND.w #$00FF
#_02DE31: CLC
#_02DE32: ADC.w $0E14
#_02DE35: CLC
#_02DE36: ADC.w $0E00
#_02DE39: TAY
#_02DE3A: LDA.w $098E
#_02DE3D: AND.w #$00FF
#_02DE40: TAX

#_02DE41: SEP #$20
#_02DE43: LDA.w NameEntryCharacterTable,Y
#_02DE46: CMP.b #$FF
#_02DE48: BNE .branch02DE51

#_02DE4A: LDA.b #$01
#_02DE4C: STA.w $098F
#_02DE4F: DEC A
#_02DE50: RTS

.branch02DE51
#_02DE51: STA.w $09A4,X
#_02DE54: RTS

;===================================================================================================

NameEntryCharacterTable:
#_02DE55: db $5D,$5E,$5F,$60,$61 : db $7B,$7C,$7D,$7E,$7F : db $CF,$CF,$CF
#_02DE62: db $62,$63,$64,$65,$66 : db $80,$CF,$81,$CF,$82 : db $00,$00,$00
#_02DE6F: db $67,$68,$69,$6A,$6B : db $83,$84,$85,$86,$87 : db $00,$00,$00
#_02DE7C: db $6C,$6D,$6E,$6F,$70 : db $88,$CF,$89,$CF,$8A : db $00,$00,$00
#_02DE89: db $71,$72,$73,$74,$75 : db $8B,$8C,$8D,$8E,$92 : db $00,$00,$00
#_02DE96: db $76,$77,$78,$79,$7A : db $8F,$90,$91,$5A,$9B : db $FF,$FF,$FF
#_02DEA3: db $B5,$B6,$B7,$B8,$B9 : db $06,$07,$08,$09,$0A : db $24,$94,$95
#_02DEB0: db $BA,$BB,$BC,$BD,$BE : db $0B,$0C,$0D,$0E,$0F : db $00,$00,$00
#_02DEBD: db $BF,$C0,$C1,$C2,$C3 : db $10,$11,$12,$13,$14 : db $00,$00,$00
#_02DECA: db $C4,$C5,$C6,$C7,$C8 : db $15,$16,$17,$18,$19 : db $00,$00,$00
#_02DED7: db $C9,$CA,$CB,$CC,$CD : db $1A,$1B,$1C,$1D,$1E : db $00,$00,$00
#_02DEE4: db $01,$02,$03,$04,$05 : db $1F,$20,$21,$22,$23 : db $FF,$FF,$FF
#_02DEF1: db $25,$26,$27,$28,$29 : db $43,$44,$45,$46,$47 : db $CF,$CF,$CF
#_02DEFE: db $2A,$2B,$2C,$2D,$2E : db $48,$CF,$49,$CF,$4A : db $00,$00,$00
#_02DF0B: db $2F,$30,$31,$32,$33 : db $4B,$4C,$4D,$4E,$4F : db $00,$00,$00
#_02DF18: db $34,$35,$36,$37,$38 : db $50,$CF,$51,$CF,$52 : db $00,$00,$00
#_02DF25: db $39,$3A,$3B,$3C,$3D : db $53,$59,$54,$58,$93 : db $00,$00,$00
#_02DF32: db $3E,$3F,$40,$41,$42 : db $55,$56,$57,$5A,$9B : db $FF,$FF,$FF
#_02DF3F: db $9C,$9D,$9E,$9F,$A0 : db $06,$07,$08,$09,$0A : db $24,$94,$95
#_02DF4C: db $A1,$A2,$A3,$A4,$A5 : db $0B,$0C,$0D,$0E,$0F : db $00,$00,$00
#_02DF59: db $A6,$A7,$A8,$A9,$AA : db $10,$11,$12,$13,$14 : db $00,$00,$00
#_02DF66: db $AB,$AC,$AD,$AE,$AF : db $15,$16,$17,$18,$19 : db $00,$00,$00
#_02DF73: db $B0,$B1,$B2,$B3,$B4 : db $1A,$1B,$1C,$1D,$1E : db $00,$00,$00
#_02DF80: db $01,$02,$03,$04,$05 : db $1F,$20,$21,$22,$23 : db $FF,$FF,$FF

;===================================================================================================

routine02DF8D:
#_02DF8D: REP #$30
#_02DF8F: AND.w #$00FF
#_02DF92: CMP.w #$00FF
#_02DF95: BEQ .branch02DFC9

#_02DF97: ASL A
#_02DF98: TAX
#_02DF99: LDA.w #$3400
#_02DF9C: STA.w $0F07
#_02DF9F: LDA.w data02DFF9,X
#_02DFA2: STA.w DMA0ADDRL
#_02DFA5: LDA.w #$0400
#_02DFA8: STA.w DMA0SIZEL

#_02DFAB: SEP #$20
#_02DFAD: LDA.b #$01
#_02DFAF: STA.w DMA0MODE
#_02DFB2: LDA.b #$18
#_02DFB4: STA.w DMA0PORT
#_02DFB7: LDA.b #$10
#_02DFB9: STA.w DMA0ADDRB
#_02DFBC: LDA.b #$01
#_02DFBE: STA.w $0F06
#_02DFC1: JSL AddSelfAsVector
#_02DFC5: STZ.w $0F06
#_02DFC8: RTS

.branch02DFC9
#_02DFC9: LDA.w #$3400
#_02DFCC: STA.w $0F07
#_02DFCF: LDA.w #$9800
#_02DFD2: STA.w DMA0ADDRL
#_02DFD5: LDA.w #$0400
#_02DFD8: STA.w DMA0SIZEL

#_02DFDB: SEP #$20
#_02DFDD: LDA.b #$01
#_02DFDF: STA.w DMA0MODE
#_02DFE2: LDA.b #$18
#_02DFE4: STA.w DMA0PORT
#_02DFE7: LDA.b #$10
#_02DFE9: STA.w DMA0ADDRB
#_02DFEC: LDA.b #$01
#_02DFEE: STA.w $0F06
#_02DFF1: JSL AddSelfAsVector
#_02DFF5: STZ.w $0F06
#_02DFF8: RTS

data02DFF9:
#_02DFF9: dw $E800,$EC00,$F000,$F400

routine02E001:
#_02E001: SEP #$20
#_02E003: REP #$10
#_02E005: LDX.w #$0000

.branch02E008
#_02E008: LDA.w data02E0B2,X
#_02E00B: STA.l $7E2700,X
#_02E00F: BEQ .branch02E024

#_02E011: LDA.w data02E0B3,X
#_02E014: STA.l $7E2701,X
#_02E018: LDA.w data02E0B4,X
#_02E01B: STA.l $7E2702,X
#_02E01F: INX
#_02E020: INX
#_02E021: INX
#_02E022: BRA .branch02E008

.branch02E024
#_02E024: LDA.b #$14
#_02E026: STA.w $0F23
#_02E029: LDA.b #$7E
#_02E02B: STA.w $0F26
#_02E02E: LDX.w #$2700
#_02E031: STX.w $0F24
#_02E034: LDA.b #$02
#_02E036: STA.w DMA5MODE
#_02E039: LDA.w $0F0E
#_02E03C: ORA.b #$20
#_02E03E: STA.w $0F0E
#_02E041: LDX.w #$0000

.branch02E044
#_02E044: PHX

#_02E045: REP #$20
#_02E047: TXA
#_02E048: ASL A
#_02E049: TAX
#_02E04A: LDY.w data02E09A,X
#_02E04D: LDX.w #$0021

#_02E050: SEP #$20

.branch02E052
#_02E052: LDA.l $7E270A,X
#_02E056: DEC A
#_02E057: STA.l $7E270A,X
#_02E05B: LDA.l $7E272E,X
#_02E05F: DEC A
#_02E060: STA.l $7E272E,X
#_02E064: LDA.l $7E2752,X
#_02E068: DEC A
#_02E069: STA.l $7E2752,X
#_02E06D: LDA.l $7E2776,X
#_02E071: DEC A
#_02E072: STA.l $7E2776,X
#_02E076: LDA.l $7E279A,X
#_02E07A: DEC A
#_02E07B: STA.l $7E279A,X
#_02E07F: LDA.l $7E27BE,X
#_02E083: DEC A
#_02E084: STA.l $7E27BE,X
#_02E088: DEX
#_02E089: DEX
#_02E08A: DEX
#_02E08B: DEY
#_02E08C: BNE .branch02E052

#_02E08E: JSL AddSelfAsVector
#_02E092: PLX
#_02E093: INX
#_02E094: CPX.w #$000C
#_02E097: BNE .branch02E044

#_02E099: RTS

data02E09A:
#_02E09A: dw $000C,$000C,$000C,$000C
#_02E0A2: dw $000B,$000A,$0009,$0008
#_02E0AA: dw $0007,$0006,$0005,$0004

data02E0B2:
#_02E0B2: dw $0081

data02E0B4:
#_02E0B4: dw $7E00,$0000,$8010,$0100
#_02E0BC: dw $0084,$8401,$0100,$0084
#_02E0C4: dw $8401,$0100,$0084,$8401
#_02E0CC: dw $0100,$0084,$8401,$0100
#_02E0D4: dw $0084,$8401,$0100,$0084
#_02E0DC: dw $8401,$0100,$0088,$8801
#_02E0E4: dw $0100,$0088,$8801,$0100
#_02E0EC: dw $0088,$8801,$0100,$0088
#_02E0F4: dw $8801,$0100,$0088,$8801
#_02E0FC: dw $0100,$0088,$8801,$0100
#_02E104: dw $008C,$8C01,$0100,$008C
#_02E10C: dw $8C01,$0100,$008C,$8C01
#_02E114: dw $0100,$008C,$8C01,$0100
#_02E11C: dw $008C,$8C01,$0100,$008C
#_02E124: dw $8C01,$0100,$0090,$9001
#_02E12C: dw $0100,$0090,$9001,$0100
#_02E134: dw $0090,$9001,$0100,$0090
#_02E13C: dw $9001,$0100,$0090,$9001
#_02E144: dw $0100,$0090,$9001,$0100
#_02E14C: dw $0094,$9401,$0100,$0094
#_02E154: dw $9401,$0100,$0094,$9401
#_02E15C: dw $0100,$0094,$9401,$0100
#_02E164: dw $0094,$9401,$0100,$0094
#_02E16C: dw $9401,$0100,$0098,$9801
#_02E174: dw $0100,$0098,$9801,$0100
#_02E17C: dw $0098,$9801,$0100,$0098
#_02E184: dw $9801,$0100,$0098,$9801
#_02E18C: dw $0100,$0098,$9801,$0800
#_02E194: dw $0098
#_02E196: db $00

routine02E197:
#_02E197: SEP #$20
#_02E199: REP #$10
#_02E19B: LDX.w #$0000

.branch02E19E
#_02E19E: LDA.w data02E248,X
#_02E1A1: STA.l $7E2700,X
#_02E1A5: BEQ .branch02E1BA

#_02E1A7: LDA.w data02E249,X
#_02E1AA: STA.l $7E2701,X
#_02E1AE: LDA.w data02E24A,X
#_02E1B1: STA.l $7E2702,X
#_02E1B5: INX
#_02E1B6: INX
#_02E1B7: INX
#_02E1B8: BRA .branch02E19E

.branch02E1BA
#_02E1BA: LDA.b #$14
#_02E1BC: STA.w $0F23
#_02E1BF: LDA.b #$7E
#_02E1C1: STA.w $0F26
#_02E1C4: LDX.w #$2700
#_02E1C7: STX.w $0F24
#_02E1CA: LDA.b #$02
#_02E1CC: STA.w DMA5MODE
#_02E1CF: LDA.w $0F0E
#_02E1D2: ORA.b #$20
#_02E1D4: STA.w $0F0E
#_02E1D7: LDX.w #$0000

.branch02E1DA
#_02E1DA: PHX

#_02E1DB: REP #$20
#_02E1DD: TXA
#_02E1DE: ASL A
#_02E1DF: TAX
#_02E1E0: LDY.w data02E230,X
#_02E1E3: LDX.w #$0021

#_02E1E6: SEP #$20

.branch02E1E8
#_02E1E8: LDA.l $7E270A,X
#_02E1EC: INC A
#_02E1ED: STA.l $7E270A,X
#_02E1F1: LDA.l $7E272E,X
#_02E1F5: INC A
#_02E1F6: STA.l $7E272E,X
#_02E1FA: LDA.l $7E2752,X
#_02E1FE: INC A
#_02E1FF: STA.l $7E2752,X
#_02E203: LDA.l $7E2776,X
#_02E207: INC A
#_02E208: STA.l $7E2776,X
#_02E20C: LDA.l $7E279A,X
#_02E210: INC A
#_02E211: STA.l $7E279A,X
#_02E215: LDA.l $7E27BE,X
#_02E219: INC A
#_02E21A: STA.l $7E27BE,X
#_02E21E: DEX
#_02E21F: DEX
#_02E220: DEX
#_02E221: DEY
#_02E222: BNE .branch02E1E8

#_02E224: JSL AddSelfAsVector
#_02E228: PLX
#_02E229: INX
#_02E22A: CPX.w #$000C
#_02E22D: BNE .branch02E1DA

#_02E22F: RTS

data02E230:
#_02E230: dw $0001,$0002,$0003,$0004
#_02E238: dw $0005,$0006,$0007,$0008
#_02E240: dw $0009,$000A,$000B,$000C

data02E248:
#_02E248: dw $0081

data02E24A:
#_02E24A: dw $7E00,$0000,$8010,$0100
#_02E252: dw $0083,$8201,$0100,$0081
#_02E25A: dw $8001,$0100,$007F,$7E01
#_02E262: dw $0100,$007D,$7C01,$0100
#_02E26A: dw $007B,$7A01,$0100,$0079
#_02E272: dw $7801,$0100,$0087,$8601
#_02E27A: dw $0100,$0085,$8401,$0100
#_02E282: dw $0083,$8201,$0100,$0081
#_02E28A: dw $8001,$0100,$007F,$7E01
#_02E292: dw $0100,$007D,$7C01,$0100
#_02E29A: dw $008B,$8A01,$0100,$0089
#_02E2A2: dw $8801,$0100,$0087,$8601
#_02E2AA: dw $0100,$0085,$8401,$0100
#_02E2B2: dw $0083,$8201,$0100,$0081
#_02E2BA: dw $8001,$0100,$008F,$8E01
#_02E2C2: dw $0100,$008D,$8C01,$0100
#_02E2CA: dw $008B,$8A01,$0100,$0089
#_02E2D2: dw $8801,$0100,$0087,$8601
#_02E2DA: dw $0100,$0085,$8401,$0100
#_02E2E2: dw $0093,$9201,$0100,$0091
#_02E2EA: dw $9001,$0100,$008F,$8E01
#_02E2F2: dw $0100,$008D,$8C01,$0100
#_02E2FA: dw $008B,$8A01,$0100,$0089
#_02E302: dw $8801,$0100,$0097,$9601
#_02E30A: dw $0100,$0095,$9401,$0100
#_02E312: dw $0093,$9201,$0100,$0091
#_02E31A: dw $9001,$0100,$008F,$8E01
#_02E322: dw $0100,$008D,$8C01,$0800
#_02E32A: dw $0098,$0800
#_02E32C: db $00

routine02E32D:
#_02E32D: PHP
#_02E32E: PHB
#_02E32F: PHK
#_02E330: PLB

#_02E331: SEP #$30
#_02E333: JSR routine02E60A
#_02E336: JSL routine02E350

#_02E33A: SEP #$20
#_02E33C: LDA.w $00E1
#_02E33F: CMP.b #$60
#_02E341: BCC .branch02E349

#_02E343: JSL routine02E5C2
#_02E347: BRA .branch02E34D

.branch02E349
#_02E349: JSL routine02E57B

.branch02E34D
#_02E34D: PLB
#_02E34E: PLP
#_02E34F: RTL

;===================================================================================================

routine02E350:
#_02E350: SEP #$20
#_02E352: PHB
#_02E353: PHK
#_02E354: PLB

#_02E355: SEP #$30
#_02E357: LDA.w $0EEF
#_02E35A: ORA.b #$F0
#_02E35C: STA.w $0EEF
#_02E35F: LDA.b #$FF
#_02E361: STA.w $0A6D
#_02E364: STZ.w $0A6B

#_02E367: REP #$30
#_02E369: LDA.w $0A59
#_02E36C: AND.w #$007F
#_02E36F: STA.w $0A59
#_02E372: ASL A
#_02E373: ASL A
#_02E374: ASL A
#_02E375: TAY
#_02E376: LDA.w SomeAddresses_02F38A,Y
#_02E379: PHY
#_02E37A: PHP
#_02E37B: CMP.w #$6000
#_02E37E: BCC .branch02E385

#_02E380: LDA.w #$0000
#_02E383: BRA .branch02E388

.branch02E385
#_02E385: LDA.w #$0001

.branch02E388
#_02E388: JSL ClearSomeBank7FBuffers
#_02E38C: PLP
#_02E38D: PLY
#_02E38E: LDA.w SomeAddresses_02F38A,Y
#_02E391: STA.w $00E0
#_02E394: INY
#_02E395: INY

#_02E396: SEP #$20
#_02E398: LDA.b #$7F
#_02E39A: STA.w $00E2
#_02E39D: LDA.w SomeAddresses_02F38A,Y
#_02E3A0: STA.w $0A65
#_02E3A3: INY
#_02E3A4: LDA.w SomeAddresses_02F38A,Y
#_02E3A7: STA.w $0A66
#_02E3AA: INY
#_02E3AB: LDA.w SomeAddresses_02F38A,Y
#_02E3AE: STA.w $0A5F
#_02E3B1: BEQ .branch02E3DD

#_02E3B3: INY
#_02E3B4: LDA.w SomeAddresses_02F38A,Y
#_02E3B7: PHA
#_02E3B8: AND.b #$0F
#_02E3BA: STA.w $0A61
#_02E3BD: PLA

#_02E3BE: REP #$20
#_02E3C0: AND.w #$00F0
#_02E3C3: LSR A
#_02E3C4: LSR A
#_02E3C5: LSR A
#_02E3C6: LSR A
#_02E3C7: STA.w $0A63

#_02E3CA: SEP #$20
#_02E3CC: INY
#_02E3CD: LDA.w SomeAddresses_02F38A,Y
#_02E3D0: STA.w $0A6B
#_02E3D3: INY
#_02E3D4: LDA.w SomeAddresses_02F38A,Y
#_02E3D7: STA.w $0A6D
#_02E3DA: JMP routine02E468

.branch02E3DD
#_02E3DD: REP #$30
#_02E3DF: LDA.w #$0000
#_02E3E2: STA.w $0E06
#_02E3E5: LDA.w #$0901
#_02E3E8: STA.w $0E04
#_02E3EB: LDY.w #$000E

.branch02E3EE
#_02E3EE: PHY
#_02E3EF: LDA.w #$0004
#_02E3F2: STA.w $0E02
#_02E3F5: LDX.w #$000E

.branch02E3F8
#_02E3F8: PHX
#_02E3F9: LDA.w $0E06
#_02E3FC: CLC
#_02E3FD: ADC.w $0E02
#_02E400: TAX
#_02E401: LDA.w $0E04
#_02E404: STA.l $7F5000,X
#_02E408: PHA
#_02E409: LDA.w #$0040
#_02E40C: CLC
#_02E40D: ADC.w $0E06
#_02E410: SEC
#_02E411: SBC.w $0E02
#_02E414: DEC A
#_02E415: DEC A
#_02E416: TAX
#_02E417: PLA
#_02E418: ORA.w #$4000
#_02E41B: STA.l $7F5000,X
#_02E41F: INC.w $0E02
#_02E422: INC.w $0E02
#_02E425: INC.w $0E04
#_02E428: PLX
#_02E429: DEX
#_02E42A: BNE .branch02E3F8

#_02E42C: LDA.w $0E06
#_02E42F: CLC
#_02E430: ADC.w #$0040
#_02E433: STA.w $0E06
#_02E436: PLY
#_02E437: DEY
#_02E438: BNE .branch02E3EE

#_02E43A: SEP #$30
#_02E43C: LDA.b #$F8
#_02E43E: STA.w $0A6D
#_02E441: LDA.w $0A65
#_02E444: JSL routine02F609
#_02E448: LDA.w $0A66
#_02E44B: JSL routine02FC09
#_02E44F: LDA.b #$50
#_02E451: STA.w $00E1
#_02E454: PLB
#_02E455: RTL

data02E456:
#_02E456: db $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
#_02E45E: db $20,$21,$22,$24,$25,$30,$31,$32
#_02E466: db $33,$34,$26,$35,$36

;===================================================================================================

routine02E468:
#_02E46B: SEP #$20

#_02E46D: LDA.w $0A5F
#_02E470: AND.b #$3F
#_02E472: DEC A
#_02E473: STA.w $0E00

#_02E476: ASL A
#_02E477: CLC
#_02E478: ADC.w $0E00
#_02E47B: TAY

#_02E47C: LDA.w data02F56A+0,Y
#_02E47F: STA.w $00C6
#_02E482: LDA.w data02F56A+1,Y
#_02E485: STA.w $00C7
#_02E488: LDA.w data02F56A+2,Y
#_02E48B: STA.w $00C8

#_02E48E: LDA.w $0A5F
#_02E491: AND.b #$C0
#_02E493: LSR A
#_02E494: LSR A
#_02E495: LSR A
#_02E496: LSR A
#_02E497: LSR A
#_02E498: TAY

#_02E499: REP #$20

#_02E49B: LDA.w data02E573,Y
#_02E49E: STA.w $0E0C

#_02E4A1: REP #$30

#_02E4A3: LDY.w #$0000

#_02E4A6: LDA.b [$C6],Y
#_02E4A8: STA.w $00C9

#_02E4AB: INY
#_02E4AC: INY

#_02E4AD: LDA.b [$C6],Y
#_02E4AF: STA.w $00CC

#_02E4B2: SEP #$20

#_02E4B4: LDA.w $00C8
#_02E4B7: STA.w $00CB
#_02E4BA: STA.w $00CE

#_02E4BD: REP #$20
#_02E4BF: LDX.w #$0000
#_02E4C2: LDY.w #$0000
#_02E4C5: STZ.w $0E0A

.branch02E4C8
#_02E4C8: PHX

#_02E4C9: STZ.w $0E08

.branch02E4CC
#_02E4CC: REP #$30

#_02E4CE: PHY

#_02E4CF: LDA.b [$CC],Y
#_02E4D1: AND.w #$00FF
#_02E4D4: ASL A
#_02E4D5: ASL A
#_02E4D6: ASL A
#_02E4D7: TAY

#_02E4D8: PHY
#_02E4D9: LDA.b [$C9],Y
#_02E4DB: ORA.w $0E0C
#_02E4DE: STA.w $0E00
#_02E4E1: INY
#_02E4E2: INY
#_02E4E3: LDA.b [$C9],Y
#_02E4E5: ORA.w $0E0C
#_02E4E8: STA.w $0E02
#_02E4EB: INY
#_02E4EC: INY
#_02E4ED: LDA.b [$C9],Y
#_02E4EF: ORA.w $0E0C
#_02E4F2: STA.w $0E04
#_02E4F5: INY
#_02E4F6: INY
#_02E4F7: LDA.b [$C9],Y
#_02E4F9: ORA.w $0E0C
#_02E4FC: STA.w $0E06
#_02E4FF: TXY
#_02E500: LDA.w $0E00
#_02E503: STA.b [$E0],Y
#_02E505: INY
#_02E506: INY
#_02E507: LDA.w $0E02
#_02E50A: STA.b [$E0],Y
#_02E50C: TYA
#_02E50D: CLC
#_02E50E: ADC.w #$003E
#_02E511: TAY
#_02E512: LDA.w $0E04
#_02E515: STA.b [$E0],Y
#_02E517: INY
#_02E518: INY
#_02E519: LDA.w $0E06
#_02E51C: STA.b [$E0],Y
#_02E51E: PLY
#_02E51F: PLY
#_02E520: INY
#_02E521: INX
#_02E522: INX
#_02E523: INX
#_02E524: INX

#_02E525: SEP #$20

#_02E527: INC.w $0E08

#_02E52A: LDA.w $0E08
#_02E52D: CMP.w $0A61
#_02E530: BNE .branch02E535

#_02E532: JMP .branch02E4CC

.branch02E535
#_02E535: BCS .branch02E53A

#_02E537: JMP .branch02E4CC

;---------------------------------------------------------------------------------------------------

.branch02E53A
#_02E53A: REP #$20
#_02E53C: PLA
#_02E53D: CLC
#_02E53E: ADC.w #$0080
#_02E541: TAX

#_02E542: SEP #$20
#_02E544: INC.w $0E0A
#_02E547: LDA.w $0E0A
#_02E54A: CMP.w $0A63
#_02E54D: BNE .branch02E552

#_02E54F: JMP .branch02E4C8

.branch02E552
#_02E552: BCS .branch02E557

#_02E554: JMP .branch02E4C8

.branch02E557
#_02E557: LDA.w $00E1
#_02E55A: PHA

#_02E55B: SEP #$30
#_02E55D: LDA.w $0A65
#_02E560: JSL routine02F609
#_02E564: LDA.w $0A66
#_02E567: JSL routine02FC09

#_02E56B: SEP #$20
#_02E56D: PLA
#_02E56E: STA.w $00E1
#_02E571: PLB
#_02E572: RTL

;---------------------------------------------------------------------------------------------------

data02E573:
#_02E573: dw $0900,$0F00,$0E00,$2E00

;===================================================================================================

routine02E57B:
#_02E57B: REP #$30
#_02E57D: LDA.w $0A6B
#_02E580: AND.w #$00FF
#_02E583: STA.w $0F51
#_02E586: LDA.w $0A6D
#_02E589: AND.w #$00FF
#_02E58C: STA.w $0F53
#_02E58F: LDA.w #$FFFF
#_02E592: STA.w $0A9B

#_02E595: SEP #$30
#_02E597: LDA.b #$01
#_02E599: JSL VRAM_From_7FXXXX
#_02E59D: JSL AddSelfAsVectorAndMakeSpace
#_02E5A1: LDA.b #$29
#_02E5A3: STA.w $0F48
#_02E5A6: STA.w BG2SC
#_02E5A9: LDA.b #$44
#_02E5AB: STA.w $0F4B
#_02E5AE: STA.w BG12NBA
#_02E5B1: LDA.w $0EEF
#_02E5B4: ORA.b #$04
#_02E5B6: STA.w $0EEF
#_02E5B9: LDA.b #$04
#_02E5BB: STA.w $0E00
#_02E5BE: JSR routine02E64F
#_02E5C1: RTL

;===================================================================================================

routine02E5C2:
#_02E5C2: REP #$30
#_02E5C4: LDA.w $0A6B
#_02E5C7: AND.w #$00FF
#_02E5CA: STA.w $0F4D
#_02E5CD: LDA.w $0A6D
#_02E5D0: AND.w #$00FF
#_02E5D3: STA.w $0F4F
#_02E5D6: LDA.w #$FFFF
#_02E5D9: STA.w $0A99

#_02E5DC: SEP #$30
#_02E5DE: LDA.b #$00
#_02E5E0: JSL VRAM_From_7FXXXX
#_02E5E4: JSL AddSelfAsVectorAndMakeSpace
#_02E5E8: LDA.b #$44
#_02E5EA: STA.w $0F4B
#_02E5ED: STA.w BG12NBA
#_02E5F0: LDA.w $0EEF
#_02E5F3: ORA.b #$08
#_02E5F5: STA.w $0EEF

#_02E5F8: SEP #$30
#_02E5FA: LDA.w $0A66
#_02E5FD: JSL routine02FC6E
#_02E601: LDA.b #$1F
#_02E603: STA.w $0F74
#_02E606: STA.w TM
#_02E609: RTL

;===================================================================================================

routine02E60A:
#_02E60A: REP #$30
#_02E60C: LDA.w $0CF3
#_02E60F: BNE .disable_layer_2

#_02E611: LDA.w $0A59
#_02E614: AND.w #$003F
#_02E617: ASL A
#_02E618: ASL A
#_02E619: ASL A
#_02E61A: TAY
#_02E61B: LDA.w SomeAddresses_02F38A,Y
#_02E61E: CMP.w #$6000
#_02E621: BCC .branch02E624

#_02E623: RTS

.branch02E624
#_02E624: SEP #$30
#_02E626: LDA.b #$04
#_02E628: STA.w $0E00
#_02E62B: LDA.w $0EEF
#_02E62E: AND.b #$0C
#_02E630: BEQ .branch02E635

#_02E632: STA.w $0E00

.branch02E635
#_02E635: LDA.w $0E00
#_02E638: LDX.b #$00
#_02E63A: LDY.b #$01
#_02E63C: JSL GraduallyFadeStuff
#_02E640: RTS

.disable_layer_2
#_02E641: SEP #$30
#_02E643: LDA.w $0F74
#_02E646: AND.b #$FD
#_02E648: STA.w $0F74
#_02E64B: STA.w TM
#_02E64E: RTS

;===================================================================================================

routine02E64F:
#_02E64F: REP #$20
#_02E651: LDA.w $0CF3
#_02E654: BNE .branch02E66C

#_02E656: SEP #$30
#_02E658: LDA.b #$1E
#_02E65A: STA.w $0F74
#_02E65D: STA.w TM
#_02E660: LDA.w $0E00
#_02E663: LDX.b #$00
#_02E665: LDY.b #$01
#_02E667: JSL routine0091A1
#_02E66B: RTS

.branch02E66C
#_02E66C: SEP #$30
#_02E66E: LDA.w $0A66
#_02E671: JSL routine02FC6E
#_02E675: LDA.b #$1E
#_02E677: STA.w $0F74
#_02E67A: STA.w TM
#_02E67D: RTS

ClearSomeBank7FBuffers:
#_02E67E: PHP
#_02E67F: PHB
#_02E680: PHK
#_02E681: PLB

#_02E682: REP #$30
#_02E684: AND.w #$00FF
#_02E687: ASL A
#_02E688: TAY

#_02E689: LDX.w Bank7FTileMapsStuff,Y
#_02E68C: LDY.w #$0400
#_02E68F: LDA.w #$0000

.next
#_02E692: STA.l $7F0000,X
#_02E696: INX
#_02E697: INX
#_02E698: DEY
#_02E699: BNE .next

#_02E69B: PLB
#_02E69C: PLP
#_02E69D: RTL

;===================================================================================================

routine02E69E:
#_02E69E: PHP
#_02E69F: PHB
#_02E6A0: PHK
#_02E6A1: PLB

#_02E6A2: REP #$30
#_02E6A4: STX.w $0E00
#_02E6A7: AND.w #$00FF
#_02E6AA: ASL A
#_02E6AB: TAY
#_02E6AC: LDX.w Bank7FTileMapsStuff,Y
#_02E6AF: LDY.w #$0400
#_02E6B2: LDA.w $0E00

.branch02E6B5
#_02E6B5: STA.l $7F0000,X
#_02E6B9: INX
#_02E6BA: INX
#_02E6BB: DEY
#_02E6BC: BNE .branch02E6B5

#_02E6BE: PLB
#_02E6BF: PLP
#_02E6C0: RTL

Bank7FTileMapsStuff:
#_02E6C1: dw $7F7000, $7F5000, $7F7800, $7F6800

;===================================================================================================

routine02E6C9:
#_02E6C9: REP #$30
#_02E6CB: PHB
#_02E6CC: PHK
#_02E6CD: PLB
#_02E6CE: LDA.w $0A6A
#_02E6D1: AND.w #$0007
#_02E6D4: ASL A
#_02E6D5: CLC
#_02E6D6: ADC.w #$0010
#_02E6D9: ASL A
#_02E6DA: TAX
#_02E6DB: LDA.w $0A69
#_02E6DE: AND.w #$00FF
#_02E6E1: BNE .branch02E6E6

#_02E6E3: JMP routine02E7F2

.branch02E6E6
#_02E6E6: DEC A
#_02E6E7: ASL A
#_02E6E8: STA.w $0E00
#_02E6EB: ASL A
#_02E6EC: ASL A
#_02E6ED: CLC
#_02E6EE: ADC.w $0E00
#_02E6F1: TAY
#_02E6F2: LDA.w data02EB6A,Y
#_02E6F5: CLC
#_02E6F6: ADC.w #$002C
#_02E6F9: PHA
#_02E6FA: PHX
#_02E6FB: PHA
#_02E6FC: TXA
#_02E6FD: LSR A
#_02E6FE: SEC
#_02E6FF: SBC.w #$0010
#_02E702: TAX
#_02E703: PLA
#_02E704: STA.w $0A85,X
#_02E707: INY
#_02E708: INY

#_02E709: SEP #$20
#_02E70B: LDX.w #$0002

.branch02E70E
#_02E70E: LDA.w data02EB6A,Y
#_02E711: CMP.b #$FF
#_02E713: BEQ .branch02E71D

#_02E715: PHX
#_02E716: PHY
#_02E717: JSL routine0F9FF3
#_02E71B: PLY
#_02E71C: PLX

.branch02E71D
#_02E71D: INY
#_02E71E: INX
#_02E71F: CPX.w #$0008
#_02E722: BNE .branch02E70E

#_02E724: REP #$20
#_02E726: LDA.w data02EB6A,Y
#_02E729: PHA
#_02E72A: AND.w #$0FFF
#_02E72D: CLC
#_02E72E: ADC.w #$0060
#_02E731: STA.w $0E00
#_02E734: PLA
#_02E735: XBA
#_02E736: LSR A
#_02E737: LSR A
#_02E738: LSR A
#_02E739: LSR A
#_02E73A: AND.w #$0007
#_02E73D: STA.w $0E0E

#_02E740: SEP #$30
#_02E742: LDA.w $0A6A
#_02E745: BMI .branch02E763

#_02E747: LDA.w $0E0E
#_02E74A: CLC
#_02E74B: ADC.b #$08
#_02E74D: LDX.w $0E00
#_02E750: JSL Transfer16Colors_F9AFA
#_02E754: LDA.w $0E0E
#_02E757: CLC
#_02E758: ADC.b #$08
#_02E75A: LDX.w $0E00
#_02E75D: JSL routine0F9B47
#_02E761: BRA .branch02E76D

.branch02E763
#_02E763: LDA.w $0E0E
#_02E766: LDX.w $0E00
#_02E769: JSL routine0F9B47

.branch02E76D
#_02E76D: REP #$30
#_02E76F: PLX
#_02E770: PLA
#_02E771: STA.w $0000,X
#_02E774: LDA.w $0A6B
#_02E777: AND.w #$00FF
#_02E77A: STA.w $1A60,X
#_02E77D: LDA.w $0A6D
#_02E780: AND.w #$00FF
#_02E783: STA.w $1AA0,X
#_02E786: LDA.w #$0000
#_02E789: STA.w $0040,X
#_02E78C: LDA.w $0A6A
#_02E78F: AND.w #$0007
#_02E792: ASL A
#_02E793: CLC
#_02E794: ADC.w #$0010
#_02E797: TAX

#_02E798: SEP #$20
#_02E79A: LDA.w $0A6A
#_02E79D: AND.b #$30
#_02E79F: ORA.b #$80
#_02E7A1: STA.w $1A00,X
#_02E7A4: LDA.b #$80
#_02E7A6: STA.w $1A20,X
#_02E7A9: LDA.w $0A6A
#_02E7AC: BPL .branch02E7E8

#_02E7AE: AND.b #$40
#_02E7B0: BEQ .branch02E7CE

#_02E7B2: SEP #$30
#_02E7B4: LDA.w $0E0E
#_02E7B7: CLC
#_02E7B8: ADC.b #$08
#_02E7BA: JSL routine0F9A9D
#_02E7BE: LDX.w $0E0E
#_02E7C1: LDA.w data02E7EA,X
#_02E7C4: LDX.b #$80
#_02E7C6: LDY.b #$01
#_02E7C8: JSL routine0091A1
#_02E7CC: BRA .branch02E7E8

.branch02E7CE
#_02E7CE: SEP #$30
#_02E7D0: LDA.w $0E0E
#_02E7D3: CLC
#_02E7D4: ADC.b #$08
#_02E7D6: JSL routine0F9A59
#_02E7DA: LDX.w $0E0E
#_02E7DD: LDA.w data02E7EA,X
#_02E7E0: LDX.b #$80
#_02E7E2: LDY.b #$01
#_02E7E4: JSL routine009443

.branch02E7E8
#_02E7E8: PLB
#_02E7E9: RTL

data02E7EA:
#_02E7EA: db $01,$02,$04,$08,$10,$20,$40,$80

;===================================================================================================

routine02E7F2:
#_02E7F2: JSR routine02E7F7
#_02E7F5: PLB
#_02E7F6: RTL

;===================================================================================================

routine02E7F7:
#_02E7F7: PHX
#_02E7F8: TXA
#_02E7F9: LSR A
#_02E7FA: SEC
#_02E7FB: SBC.w #$0010
#_02E7FE: TAX
#_02E7FF: LDA.w #$0000
#_02E802: STA.w $0A85,X

#_02E805: SEP #$30
#_02E807: LDA.w $0A6A
#_02E80A: AND.b #$07
#_02E80C: TAX
#_02E80D: LDA.b #$00
#_02E80F: STA.w $0A7D,X

#_02E812: REP #$30
#_02E814: PLX
#_02E815: STA.w $0000,X
#_02E818: STA.w $1A60,X
#_02E81B: LDA.w #$00F0
#_02E81E: STA.w $1AA0,X
#_02E821: LDA.w $0A6A
#_02E824: AND.w #$0007
#_02E827: ASL A
#_02E828: CLC
#_02E829: ADC.w #$0010
#_02E82C: TAX

#_02E82D: SEP #$20
#_02E82F: LDA.b #$80
#_02E831: STA.w $1A00,X
#_02E834: RTS

;===================================================================================================

routine02E835:
#_02E835: REP #$30
#_02E837: PHB
#_02E838: PHK
#_02E839: PLB
#_02E83A: LDA.w $0A69
#_02E83D: PHA
#_02E83E: LDA.w $0A6A
#_02E841: PHA
#_02E842: LDA.w $0A6B
#_02E845: PHA
#_02E846: LDA.w $0A6D
#_02E849: PHA
#_02E84A: STZ.w $0A69
#_02E84D: LDX.w #$0000

.branch02E850
#_02E850: PHX
#_02E851: PHP
#_02E852: TXA
#_02E853: ASL A
#_02E854: CLC
#_02E855: ADC.w #$0010
#_02E858: ASL A
#_02E859: TAX
#_02E85A: JSR routine02E7F7
#_02E85D: PLP
#_02E85E: PLX
#_02E85F: INC.w $0A6A
#_02E862: INX
#_02E863: CPX.w #$0008
#_02E866: BNE .branch02E850

#_02E868: REP #$20
#_02E86A: PLA
#_02E86B: STA.w $0A6D
#_02E86E: PLA
#_02E86F: STA.w $0A6B
#_02E872: PLA
#_02E873: STA.w $0A6A
#_02E876: PLA
#_02E877: STA.w $0A69
#_02E87A: PLB
#_02E87B: RTL

;===================================================================================================

routine02E87C:
#_02E87C: PHP
#_02E87D: PHB
#_02E87E: PHK
#_02E87F: PLB

#_02E880: SEP #$30
#_02E882: LDA.b #$04
#_02E884: LDX.b #$00
#_02E886: LDY.b #$01
#_02E888: JSL GraduallyFadeStuff
#_02E88C: JSL routine02E8FB
#_02E890: JSL routine02E57B
#_02E894: PLB
#_02E895: PLP
#_02E896: RTL

;===================================================================================================

routine02E897:
#_02E897: PHP

#_02E898: PHB
#_02E899: PHK
#_02E89A: PLB

#_02E89B: SEP #$30

#_02E89D: LDA.b #$04
#_02E89F: LDX.b #$00
#_02E8A1: LDY.b #$01
#_02E8A3: JSL routine009508

#_02E8A7: JSL routine028A36
#_02E8AB: JSL routine0286C6
#_02E8AF: JSL routine028708

#_02E8B3: REP #$10
#_02E8B5: LDX.w #$0901
#_02E8B8: LDA.b #$01
#_02E8BA: JSL routine02E69E

#_02E8BE: SEP #$10
#_02E8C0: LDA.b #$01
#_02E8C2: JSL VRAM_From_7FXXXX
#_02E8C6: JSL AddSelfAsVectorAndMakeSpace
#_02E8CA: JSL routine02E8FB

#_02E8CE: REP #$30
#_02E8D0: LDA.w $0A6B
#_02E8D3: AND.w #$00FF
#_02E8D6: STA.w $0F51
#_02E8D9: LDA.w $0A6D
#_02E8DC: AND.w #$00FF
#_02E8DF: STA.w $0F53

#_02E8E2: SEP #$30
#_02E8E4: LDA.b #$01
#_02E8E6: JSL VRAM_From_7FXXXX
#_02E8EA: JSL AddSelfAsVectorAndMakeSpace
#_02E8EE: LDA.b #$04
#_02E8F0: LDX.b #$00
#_02E8F2: LDY.b #$01
#_02E8F4: JSL routine009443
#_02E8F8: PLB
#_02E8F9: PLP
#_02E8FA: RTL

;===================================================================================================

routine02E8FB:
#_02E8FB: SEP #$30
#_02E8FD: LDA.b #$00
#_02E8FF: STA.w $0A6B
#_02E902: LDA.b #$FF
#_02E904: STA.w $0A6D

#_02E907: SEP #$30
#_02E909: JSL routine028708

routine02E90D:
#_02E90D: SEP #$30
#_02E90F: PHB
#_02E910: PHK
#_02E911: PLB
#_02E912: LDA.w $0B29
#_02E915: AND.b #$0F
#_02E917: CMP.b #$0A
#_02E919: BNE .branch02E925

#_02E91B: LDA.b #$0B
#_02E91D: STA.w $0A67
#_02E920: STA.w $0A68
#_02E923: BRA .branch02E94A

.branch02E925
#_02E925: LDA.w $0B16
#_02E928: AND.b #$07
#_02E92A: ASL A
#_02E92B: TAY
#_02E92C: LDX.w data02E97E,Y
#_02E92F: LDA.w $0B21,X
#_02E932: AND.b #$F0
#_02E934: LSR A
#_02E935: LSR A
#_02E936: LSR A
#_02E937: LSR A
#_02E938: STA.w $0A67
#_02E93B: LDX.w data02E97F,Y
#_02E93E: LDA.w $0B21,X
#_02E941: AND.b #$F0
#_02E943: LSR A
#_02E944: LSR A
#_02E945: LSR A
#_02E946: LSR A
#_02E947: STA.w $0A68

.branch02E94A
#_02E94A: SEP #$30
#_02E94C: LDY.w $0A67
#_02E94F: LDA.w data02E972,Y
#_02E952: STA.w $0A59
#_02E955: JSR routine02EA1E

#_02E958: SEP #$30
#_02E95A: LDY.w $0A68
#_02E95D: LDA.w data02E972,Y
#_02E960: ORA.b #$80
#_02E962: INC A
#_02E963: STA.w $0A59
#_02E966: JSR routine02EA1E
#_02E969: LDA.w $0A66
#_02E96C: JSL routine02FC09
#_02E970: PLB
#_02E971: RTL

data02E972:
#_02E972: db $00,$02,$04,$06,$08,$0A,$0C,$0E
#_02E97A: db $10,$12,$14,$16

data02E97E:
#_02E97E: db $06

data02E97F:
#_02E97F: db $02,$07,$03,$00,$04,$01,$05,$02
#_02E987: db $06,$03,$07,$04,$00,$05,$01

;===================================================================================================

routine02E98E:
#_02E98E: PHP
#_02E98F: PHB
#_02E990: PHK
#_02E991: PLB

#_02E992: SEP #$30
#_02E994: AND.b #$01
#_02E996: ASL A
#_02E997: CLC
#_02E998: ADC.b #$1C
#_02E99A: STA.w $0A59
#_02E99D: LDX.w $0710
#_02E9A0: CPX.b #$05
#_02E9A2: BNE .branch02E9AD

#_02E9A4: LDA.w $0A59
#_02E9A7: SEC
#_02E9A8: SBC.b #$04
#_02E9AA: STA.w $0A59

.branch02E9AD
#_02E9AD: STZ.w $0A5A
#_02E9B0: LDA.w data02E9FE,X
#_02E9B3: STA.w $0A66
#_02E9B6: LDA.b #$04
#_02E9B8: LDX.b #$00
#_02E9BA: LDY.b #$01
#_02E9BC: JSL GraduallyFadeStuff

#_02E9C0: SEP #$30
#_02E9C2: LDA.b #$00
#_02E9C4: STA.w $0A6B
#_02E9C7: STA.w $0F51
#_02E9CA: LDA.b #$F8
#_02E9CC: STA.w $0A6D
#_02E9CF: STA.w $0F53
#_02E9D2: LDA.w $0A66
#_02E9D5: CMP.b #$FF
#_02E9D7: BEQ .branch02E9E1

#_02E9D9: TAX
#_02E9DA: LDA.w data02EA16,X
#_02E9DD: JSL routine02FC09

.branch02E9E1
#_02E9E1: JSR routine02EA1E

#_02E9E4: SEP #$30
#_02E9E6: LDA.w $0A59
#_02E9E9: ORA.b #$80
#_02E9EB: INC A
#_02E9EC: STA.w $0A59
#_02E9EF: JSR routine02EA1E
#_02E9F2: JSL routine02E57B
#_02E9F6: LDA.b #$FF
#_02E9F8: STA.w $0EEF
#_02E9FB: PLB
#_02E9FC: PLP
#_02E9FD: RTL

data02E9FE:
#_02E9FE: db $FF,$FF,$FF,$FF,$FF,$FF,$01,$FF
#_02EA06: db $FF,$00,$FF,$FF,$FF,$02,$FF,$FF
#_02EA0E: db $03,$FF,$FF,$04,$05,$06,$07,$FF

data02EA16:
#_02EA16: db $3B,$3C,$3D,$3E,$3F,$40,$41,$42

;===================================================================================================

routine02EA1E:
#_02EA1E: SEP #$30

#_02EA20: LDA.b #$00
#_02EA22: STA.w $0A6B
#_02EA25: STA.w $0F51

#_02EA28: LDA.b #$F8
#_02EA2A: STA.w $0A6D
#_02EA2D: STA.w $0F53

#_02EA30: REP #$30

#_02EA32: LDA.w #$0002
#_02EA35: STA.w $0E00

#_02EA38: LDA.w #$0000
#_02EA3B: STA.w $0E02

#_02EA3E: STZ.w $0E0A

#_02EA41: LDA.w #$0900
#_02EA44: STA.w $0E04

#_02EA47: LDA.w $0A59
#_02EA4A: AND.w #$0080
#_02EA4D: BEQ .branch02EA55

#_02EA4F: LDA.w #$4A00
#_02EA52: STA.w $0E04

.branch02EA55
#_02EA55: SEP #$20

#_02EA57: LDA.b #data10F800>>16
#_02EA59: STA.w $00C8

#_02EA5C: REP #$20

#_02EA5E: LDA.w $0A59
#_02EA61: AND.w #$007F
#_02EA64: ASL A
#_02EA65: TAY

#_02EA66: LDA.w pointers02EB2A,Y
#_02EA69: STA.w $00C6

#_02EA6C: LDY.w #$0000

#_02EA6F: LDA.b [$C6],Y
#_02EA71: STA.w $0A65

#_02EA74: INY
#_02EA75: INY

#_02EA76: REP #$20

#_02EA78: LDA.b [$C6],Y
#_02EA7A: STA.w $00C6

;---------------------------------------------------------------------------------------------------

#_02EA7D: LDY.w #$0000

.next_item
#_02EA80: SEP #$20
#_02EA82: REP #$10

#_02EA84: LDA.b [$C6],Y
#_02EA86: CMP.b #$FF
#_02EA88: BEQ .sequential_rle

#_02EA8A: CMP.b #$FE
#_02EA8C: BEQ .straight_rle

#_02EA8E: JSR routine02EADB

.done_rle
#_02EA91: REP #$20

#_02EA93: INY

#_02EA94: LDA.w $0E0A
#_02EA97: CMP.w #$00D2
#_02EA9A: BNE .next_item

#_02EA9C: SEP #$20

#_02EA9E: LDA.w $0A65
#_02EAA1: JSL routine02F609

#_02EAA5: RTS

;---------------------------------------------------------------------------------------------------

.straight_rle
#_02EAA6: INY
#_02EAA7: LDA.b [$C6],Y
#_02EAA9: STA.w $0E06

#_02EAAC: INY
#_02EAAD: LDA.b [$C6],Y
#_02EAAF: STA.w $0E08

.next_straight_rle
#_02EAB2: LDA.w $0E06
#_02EAB5: JSR routine02EADB

#_02EAB8: DEC.w $0E08
#_02EABB: BNE .next_straight_rle

#_02EABD: BRA .done_rle

;---------------------------------------------------------------------------------------------------

.sequential_rle
#_02EABF: INY
#_02EAC0: LDA.b [$C6],Y
#_02EAC2: STA.w $0E06

#_02EAC5: INY
#_02EAC6: LDA.b [$C6],Y
#_02EAC8: STA.w $0E08

.next_sequential_rle
#_02EACB: LDA.w $0E06
#_02EACE: JSR routine02EADB

#_02EAD1: INC.w $0E06

#_02EAD4: DEC.w $0E08
#_02EAD7: BNE .next_sequential_rle

#_02EAD9: BRA .done_rle

;===================================================================================================

routine02EADB:
#_02EADB: PHP
#_02EADC: REP #$30

#_02EADE: PHA

#_02EADF: LDA.w $0A59
#_02EAE2: AND.w #$0080
#_02EAE5: BEQ .branch02EAF4

#_02EAE7: LDA.w $0E02
#_02EAEA: CLC
#_02EAEB: ADC.w #$003E
#_02EAEE: SEC
#_02EAEF: SBC.w $0E00

#_02EAF2: BRA .branch02EAFB

.branch02EAF4
#_02EAF4: LDA.w $0E02
#_02EAF7: CLC
#_02EAF8: ADC.w $0E00

.branch02EAFB
#_02EAFB: TAX

#_02EAFC: PLA
#_02EAFD: AND.w #$00FF
#_02EB00: ORA.w $0E04
#_02EB03: STA.l $7F5000,X

#_02EB07: INC.w $0E0A

#_02EB0A: INC.w $0E00
#_02EB0D: INC.w $0E00

#_02EB10: LDA.w $0E00
#_02EB13: AND.w #$0020
#_02EB16: BEQ .exit

#_02EB18: LDA.w #$0002
#_02EB1B: STA.w $0E00

#_02EB1E: LDA.w $0E02
#_02EB21: CLC
#_02EB22: ADC.w #$0040
#_02EB25: STA.w $0E02

.exit
#_02EB28: PLP
#_02EB29: RTS

;===================================================================================================

pointers02EB2A:
#_02EB2A: dw data10F800+$00, data10F800+$04
#_02EB2E: dw data10F800+$08, data10F800+$0C
#_02EB32: dw data10F800+$10, data10F800+$14
#_02EB36: dw data10F800+$18, data10F800+$1C
#_02EB3A: dw data10F800+$20, data10F800+$24
#_02EB3E: dw data10F800+$28, data10F800+$2C
#_02EB42: dw data10F800+$30, data10F800+$34
#_02EB46: dw data10F800+$38, data10F800+$3C
#_02EB4A: dw data10F800+$40, data10F800+$44
#_02EB4E: dw data10F800+$48, data10F800+$4C
#_02EB52: dw data10F800+$50, data10F800+$54
#_02EB56: dw data10F800+$58, data10F800+$5C
#_02EB5A: dw data10F800+$60, data10F800+$64
#_02EB5E: dw data10F800+$68, data10F800+$6C
#_02EB62: dw data10F800+$70, data10F800+$74
#_02EB66: dw data10F800+$78, data10F800+$7C

data02EB6A:
#_02EB6A: dw $0000,$00FF,$FFFF,$FFFF
#_02EB72: dw $1000,$0001,$0100,$FFFF
#_02EB7A: dw $FFFF,$1000,$0002,$0100
#_02EB82: dw $FFFF,$FFFF,$1000,$0003
#_02EB8A: dw $0100,$FFFF,$FFFF,$1000
#_02EB92: dw $0004,$00FF,$FFFF,$FFFF
#_02EB9A: dw $1000,$007A,$2D2C,$FFFF
#_02EBA2: dw $FFFF,$1000,$007B,$2D2C
#_02EBAA: dw $FFFF,$FFFF,$1000,$0079
#_02EBB2: dw $2D2C,$FFFF,$FFFF,$1000
#_02EBBA: dw $0008,$0100,$FFFF,$FFFF
#_02EBC2: dw $1000,$0009,$FF21,$FFFF
#_02EBCA: dw $FFFF,$1001,$000A,$0100
#_02EBD2: dw $FFFF,$FFFF,$1000,$000B
#_02EBDA: dw $FFFF,$1506,$FFFF,$2002
#_02EBE2: dw $000C,$0100,$FFFF,$FFFF
#_02EBEA: dw $1000,$000D,$FF14,$FFFF
#_02EBF2: dw $FFFF,$1000,$000F,$FF01
#_02EBFA: dw $FFFF,$FFFF,$1000,$0010
#_02EC02: dw $FF01,$FFFF,$FFFF,$1000
#_02EC0A: dw $0011,$0302,$FFFF,$FFFF
#_02EC12: dw $1000,$0012,$0302,$FFFF
#_02EC1A: dw $FFFF,$1000,$0013,$0302
#_02EC22: dw $FFFF,$FFFF,$1000,$0015
#_02EC2A: dw $0302,$FFFF,$FFFF,$1000
#_02EC32: dw $0016,$0302,$FFFF,$FFFF
#_02EC3A: dw $1000,$0017,$0302,$FFFF
#_02EC42: dw $FFFF,$1000,$0018,$0302
#_02EC4A: dw $FFFF,$FFFF,$1000,$0019
#_02EC52: dw $0504,$FFFF,$FFFF,$1000
#_02EC5A: dw $001A,$0504,$FFFF,$FFFF
#_02EC62: dw $1000,$001B,$0504,$FF06
#_02EC6A: dw $FFFF,$1000,$001C,$0504
#_02EC72: dw $FF06,$FFFF,$1000,$001D
#_02EC7A: dw $1816,$FFFF,$FFFF,$1000
#_02EC82: dw $001E,$0504,$FF06,$FFFF
#_02EC8A: dw $1000,$0027,$FFFF,$0605
#_02EC92: dw $FFFF,$1000,$0020,$FF06
#_02EC9A: dw $FFFF,$FFFF,$1000,$0021
#_02ECA2: dw $FF06,$FFFF,$FFFF,$1000
#_02ECAA: dw $0022,$FFFF,$FFFF,$06FF
#_02ECB2: dw $300D,$0023,$FFFF,$FFFF
#_02ECBA: dw $06FF,$3000,$0024,$1816
#_02ECC2: dw $FF26,$FFFF,$1000,$0025
#_02ECCA: dw $FFFF,$FFFF,$06FF,$3000
#_02ECD2: dw $0026,$0C17,$FFFF,$FFFF
#_02ECDA: dw $1000,$0028,$1107,$FFFF
#_02ECE2: dw $FFFF,$2001,$0029,$1107
#_02ECEA: dw $FFFF,$FFFF,$1000,$002A
#_02ECF2: dw $1107,$FFFF,$FFFF,$1000
#_02ECFA: dw $002B,$1107,$FFFF,$FFFF
#_02ED02: dw $2001,$002C,$1107,$FFFF
#_02ED0A: dw $FFFF,$2001,$002C,$10FF
#_02ED12: dw $FFFF,$FFFF,$2000,$001F
#_02ED1A: dw $FFFF,$FF08,$FFFF,$3000
#_02ED22: dw $0029,$FF0A,$FFFF,$FFFF
#_02ED2A: dw $1001,$0029,$FF0B,$FFFF
#_02ED32: dw $FFFF,$1000,$0029,$FF0D
#_02ED3A: dw $FFFF,$FFFF,$1007,$0029
#_02ED42: dw $FF0E,$FFFF,$FFFF,$1000
#_02ED4A: dw $002D,$0D06,$FFFF,$FFFF
#_02ED52: dw $1000,$002E,$0E06,$FFFF
#_02ED5A: dw $FFFF,$1000,$002E,$0D06
#_02ED62: dw $FFFF,$FFFF,$1000,$002F
#_02ED6A: dw $FF08,$FFFF,$FFFF,$1000
#_02ED72: dw $002F,$FF09,$FFFF,$FFFF
#_02ED7A: dw $1001,$002F,$FF0A,$FFFF
#_02ED82: dw $FFFF,$1000,$002F,$FF0B
#_02ED8A: dw $FFFF,$FFFF,$100C,$002F
#_02ED92: dw $FF0C,$FFFF,$FFFF,$1000
#_02ED9A: dw $0030,$FF08,$FFFF,$FFFF
#_02EDA2: dw $1000,$0030,$FF09,$FFFF
#_02EDAA: dw $FFFF,$1002,$0030,$FF0A
#_02EDB2: dw $FFFF,$FFFF,$1000,$0030
#_02EDBA: dw $FF0B,$FFFF,$FFFF,$1000
#_02EDC2: dw $0030,$FF0D,$FFFF,$FFFF
#_02EDCA: dw $1000,$0030,$FF0E,$FFFF
#_02EDD2: dw $FFFF,$1000,$0031,$FF09
#_02EDDA: dw $FFFF,$FFFF,$1000,$0032
#_02EDE2: dw $FF0C,$FFFF,$FFFF,$1000
#_02EDEA: dw $0033,$FF0C,$FFFF,$FFFF
#_02EDF2: dw $1002,$0034,$FF0C,$FFFF
#_02EDFA: dw $FFFF,$1000,$0035,$FF0D
#_02EE02: dw $FFFF,$FFFF,$100E,$0035
#_02EE0A: dw $FF0E,$FFFF,$FFFF,$1000
#_02EE12: dw $0035,$FF18,$FFFF,$FFFF
#_02EE1A: dw $1000,$0035,$FF19,$FFFF
#_02EE22: dw $FFFF,$100C,$0035,$FF1A
#_02EE2A: dw $FFFF,$FFFF,$1002,$0035
#_02EE32: dw $FF1B,$FFFF,$FFFF,$1000
#_02EE3A: dw $0035,$FF1C,$FFFF,$FFFF
#_02EE42: dw $1000,$0035,$FF1D,$FFFF
#_02EE4A: dw $FFFF,$1000,$0035,$FF1E
#_02EE52: dw $FFFF,$FFFF,$1000,$0035
#_02EE5A: dw $FF1F,$FFFF,$FFFF,$1000
#_02EE62: dw $0035,$FF20,$FFFF,$FFFF
#_02EE6A: dw $1000,$002F,$FF17,$FFFF
#_02EE72: dw $FFFF,$1007,$0036,$0F17
#_02EE7A: dw $FFFF,$FFFF,$1000,$0037
#_02EE82: dw $0F17,$FFFF,$FFFF,$1000
#_02EE8A: dw $0038,$0F17,$FFFF,$FFFF
#_02EE92: dw $1000,$0039,$0F17,$FFFF
#_02EE9A: dw $FFFF,$200A,$003A,$FF17
#_02EEA2: dw $FFFF,$FFFF,$1000,$003B
#_02EEAA: dw $150F,$FFFF,$FFFF,$1000
#_02EEB2: dw $003C,$FF14,$FFFF,$FFFF
#_02EEBA: dw $3000,$000E,$FFFF,$15FF
#_02EEC2: dw $FFFF,$2009,$000E,$FFFF
#_02EECA: dw $16FF,$FFFF,$2008,$003C
#_02EED2: dw $FF12,$FFFF,$FFFF,$3002
#_02EEDA: dw $003C,$FF13,$FFFF,$FFFF
#_02EEE2: dw $3001,$003D,$FF10,$FFFF
#_02EEEA: dw $FFFF,$100C,$003E,$FF10
#_02EEF2: dw $FFFF,$FFFF,$100C,$003F
#_02EEFA: dw $FF10,$FFFF,$FFFF,$100C
#_02EF02: dw $0040,$FF10,$FFFF,$FFFF
#_02EF0A: dw $100C,$0041,$FF10,$FFFF
#_02EF12: dw $FFFF,$100E,$0042,$12FF
#_02EF1A: dw $FFFF,$FFFF,$2000,$0043
#_02EF22: dw $FF13,$FFFF,$FFFF,$1000
#_02EF2A: dw $0044,$FF13,$FFFF,$FFFF
#_02EF32: dw $1000,$0045,$FF13,$FFFF
#_02EF3A: dw $FFFF,$1000,$0046,$27FF
#_02EF42: dw $FFFF,$FFFF,$200A,$0045
#_02EF4A: dw $FF12,$FFFF,$FFFF,$1000
#_02EF52: dw $0045,$FF14,$FFFF,$FFFF
#_02EF5A: dw $1000,$0014,$FF13,$FFFF
#_02EF62: dw $FFFF,$1002,$0047,$1715
#_02EF6A: dw $FFFF,$FFFF,$1000,$0047
#_02EF72: dw $1716,$FFFF,$FFFF,$1002
#_02EF7A: dw $0047,$1718,$FFFF,$FFFF
#_02EF82: dw $100C,$0047,$1719,$FFFF
#_02EF8A: dw $FFFF,$1002,$0048,$FF1A
#_02EF92: dw $FFFF,$FFFF,$200D,$0048
#_02EF9A: dw $FF1B,$FFFF,$FFFF,$200D
#_02EFA2: dw $0048,$FF1C,$FFFF,$FFFF
#_02EFAA: dw $200B,$0048,$FF1D,$FFFF
#_02EFB2: dw $FFFF,$2008,$0048,$FF1E
#_02EFBA: dw $FFFF,$FFFF,$200F,$0048
#_02EFC2: dw $FF1F,$FFFF,$FFFF,$200F
#_02EFCA: dw $0048,$FF21,$FFFF,$FFFF
#_02EFD2: dw $200F,$0048,$FF22,$FFFF
#_02EFDA: dw $FFFF,$2008,$0048,$FF23
#_02EFE2: dw $FFFF,$FFFF,$200F,$0049
#_02EFEA: dw $FF1A,$FFFF,$FFFF,$200D
#_02EFF2: dw $0049,$FF1B,$FFFF,$FFFF
#_02EFFA: dw $200D,$0049,$FF1C,$FFFF
#_02F002: dw $FFFF,$200B,$0049,$FF1D
#_02F00A: dw $FFFF,$FFFF,$2008,$0049
#_02F012: dw $FF1E,$FFFF,$FFFF,$200F
#_02F01A: dw $0049,$FF1F,$FFFF,$FFFF
#_02F022: dw $200F,$0049,$FF21,$FFFF
#_02F02A: dw $FFFF,$200F,$0049,$FF22
#_02F032: dw $FFFF,$FFFF,$2008,$0049
#_02F03A: dw $FF23,$FFFF,$FFFF,$200F
#_02F042: dw $004A,$FF20,$FFFF,$FFFF
#_02F04A: dw $1000,$004B,$FF20,$FFFF
#_02F052: dw $FFFF,$1000,$0052,$FF12
#_02F05A: dw $FFFF,$FFFF,$1000,$0078
#_02F062: dw $2D2C,$FFFF,$FFFF,$1000
#_02F06A: dw $007C,$0906,$FFFF,$FFFF
#_02F072: dw $1011,$0029,$FF24,$FFFF
#_02F07A: dw $FFFF,$100C,$0029,$FF25
#_02F082: dw $FFFF,$FFFF,$100E,$0009
#_02F08A: dw $FF22,$FFFF,$FFFF,$1001
#_02F092: dw $0009,$FF23,$FFFF,$FFFF
#_02F09A: dw $1000,$007D,$0100,$140F
#_02F0A2: dw $2820,$1007,$0009,$FF24
#_02F0AA: dw $FFFF,$FFFF,$100C,$0009
#_02F0B2: dw $FF25,$FFFF,$FFFF,$100E
#_02F0BA: dw $0009,$FF26,$FFFF,$FFFF
#_02F0C2: dw $1002,$0054,$FF29,$FFFF
#_02F0CA: dw $FFFF,$1001,$0055,$2B26
#_02F0D2: dw $FFFF,$FFFF,$1000,$0056
#_02F0DA: dw $FF30,$FFFF,$FFFF,$2000
#_02F0E2: dw $0057,$2D30,$FFFF,$FFFF
#_02F0EA: dw $300C,$0058,$2430,$2625
#_02F0F2: dw $FFFF,$300C,$0059,$2430
#_02F0FA: dw $2625,$FFFF,$300C,$005A
#_02F102: dw $2730,$FFFF,$FFFF,$3000
#_02F10A: dw $005B,$3709,$FFFF,$FFFF
#_02F112: dw $1001,$005C,$3709,$FFFF
#_02F11A: dw $FFFF,$1001,$005D,$3709
#_02F122: dw $FFFF,$FFFF,$1000,$005E
#_02F12A: dw $3709,$FFFF,$FFFF,$1000
#_02F132: dw $005F,$FF35,$FFFF,$FFFF
#_02F13A: dw $1003,$005F,$FF36,$FFFF
#_02F142: dw $FFFF,$1003,$0066,$FF35
#_02F14A: dw $FFFF,$FFFF,$1003,$0060
#_02F152: dw $FFFF,$FFFF,$2AFF,$3000
#_02F15A: dw $0061,$2F2E,$FFFF,$FFFF
#_02F162: dw $100D,$007E,$0100,$140F
#_02F16A: dw $2820,$1007,$007F,$0100
#_02F172: dw $140F,$2820,$1007,$0080
#_02F17A: dw $0100,$140F,$2820,$1007
#_02F182: dw $0062,$FFFF,$FFFF,$2AFF
#_02F18A: dw $3000,$0063,$FFFF,$FFFF
#_02F192: dw $2AFF,$3000,$0064,$FFFF
#_02F19A: dw $FFFF,$2AFF,$3000,$0065
#_02F1A2: dw $FFFF,$FFFF,$2AFF,$3000
#_02F1AA: dw $0048,$FF1C,$FFFF,$FFFF
#_02F1B2: dw $200D,$0049,$FF1C,$FFFF
#_02F1BA: dw $FFFF,$200D,$0009,$FF28
#_02F1C2: dw $FFFF,$FFFF,$1000,$0009
#_02F1CA: dw $FF29,$FFFF,$FFFF,$1000
#_02F1D2: dw $0009,$FF2B,$FFFF,$FFFF
#_02F1DA: dw $1001,$0009,$FF30,$FFFF
#_02F1E2: dw $FFFF,$100C,$004C,$FF28
#_02F1EA: dw $FFFF,$FFFF,$1000,$0029
#_02F1F2: dw $FF26,$FFFF,$FFFF,$100C
#_02F1FA: dw $0029,$FF27,$FFFF,$FFFF
#_02F202: dw $1000,$0081,$0100,$140F
#_02F20A: dw $2820,$1007,$003B,$1629
#_02F212: dw $FFFF,$FFFF,$1000,$0030
#_02F21A: dw $FF14,$FFFF,$FFFF,$100C
#_02F222: dw $0030,$FF15,$FFFF,$FFFF
#_02F22A: dw $1000,$0030,$FF16,$FFFF
#_02F232: dw $FFFF,$1007,$0030,$FF18
#_02F23A: dw $FFFF,$FFFF,$1002,$000B
#_02F242: dw $FFFF,$1606,$FFFF,$200E
#_02F24A: dw $000B,$FFFF,$1806,$FFFF
#_02F252: dw $2007,$000D,$FF15,$FFFF
#_02F25A: dw $FFFF,$1007,$0054,$FF2B
#_02F262: dw $FFFF,$FFFF,$1001,$0010
#_02F26A: dw $FF30,$FFFF,$FFFF,$100E
#_02F272: dw $0066,$FF36,$FFFF,$FFFF
#_02F27A: dw $1003,$0030,$FF34,$FFFF
#_02F282: dw $FFFF,$1003,$0067,$3534
#_02F28A: dw $FFFF,$FFFF,$1003,$0068
#_02F292: dw $FFFF,$FFFF,$31FF,$1003
#_02F29A: dw $0069,$FF35,$FFFF,$FFFF
#_02F2A2: dw $1010,$006A,$FF31,$FFFF
#_02F2AA: dw $FFFF,$1001,$006B,$2A35
#_02F2B2: dw $FFFF,$FFFF,$1007,$006C
#_02F2BA: dw $FF29,$FFFF,$FFFF,$1007
#_02F2C2: dw $006D,$FF36,$FFFF,$FFFF
#_02F2CA: dw $1007,$006E,$3332,$FFFF
#_02F2D2: dw $FFFF,$1004,$006F,$3332
#_02F2DA: dw $FFFF,$FFFF,$1004,$0070
#_02F2E2: dw $3332,$FFFF,$FFFF,$1004
#_02F2EA: dw $0071,$3332,$FFFF,$FFFF
#_02F2F2: dw $1004,$0072,$3332,$FFFF
#_02F2FA: dw $FFFF,$2000,$0073,$3134
#_02F302: dw $FF33,$FFFF,$100D,$0074
#_02F30A: dw $3134,$FF33,$FFFF,$100D
#_02F312: dw $0053,$1328,$FFFF,$FFFF
#_02F31A: dw $1005,$0075,$1420,$FF36
#_02F322: dw $FFFF,$100D,$0076,$FFFF
#_02F32A: dw $FF20,$FFFF,$100D,$0077
#_02F332: dw $3519,$FFFF,$FFFF,$1006
#_02F33A: dw $004D,$FF28,$FFFF,$FFFF
#_02F342: dw $1000,$004E,$FF28,$FFFF
#_02F34A: dw $FFFF,$1000,$004F,$FF28
#_02F352: dw $FFFF,$FFFF,$1000,$0050
#_02F35A: dw $FF28,$FFFF,$FFFF,$1000
#_02F362: dw $0051,$FF28,$FFFF,$FFFF
#_02F36A: dw $1000,$007A,$2D2C,$FFFF
#_02F372: dw $FFFF,$1000,$007B,$2D2C
#_02F37A: dw $FFFF,$FFFF,$1000,$0000
#_02F382: dw $FFFF,$FFFF,$FFFF,$0000

; TODO fix whole thing into groups of 2
; last byte isn't part of this
SomeAddresses_02F38A:
#_02F38A: db $04,$50,$18,$05,$00,$00,$00,$F7
#_02F392: db $04,$50,$19,$06,$00,$00,$00,$F7
#_02F39A: db $04,$50,$1A,$07,$00,$00,$00,$F7
#_02F3A2: db $04,$50,$1B,$08,$00,$00,$00,$F7
#_02F3AA: db $04,$50,$1C,$09,$00,$00,$00,$F7
#_02F3B2: db $04,$50,$1D,$0B,$01,$6D,$00,$F7
#_02F3BA: db $04,$50,$1D,$0C,$02,$6D,$00,$F7
#_02F3C2: db $04,$50,$1D,$0C,$03,$6D,$00,$F7
#_02F3CA: db $04,$50,$1D,$0C,$04,$6D,$00
#_02F3D1: dw $04F7,$1D50,$050C,$006D
#_02F3D9: dw $02F7,$1D50,$060C,$006E
#_02F3E1: dw $44F7,$1E50,$070A,$00FD
#_02F3E9: dw $44FF,$2070,$8816,$006D
#_02F3F1: dw $44FF,$1E50,$090B,$006D
#_02F3F9: dw $04FF,$1E50,$0A0B,$006D
#_02F401: dw $02F7,$1E50,$0B10,$006E
#_02F409: dw $02F7,$1E50,$0C11,$006E
#_02F411: dw $04F7,$1F50,$0D0D,$006D
#_02F419: dw $04F7,$1F50,$0E0E,$006D
#_02F421: dw $04F7,$1F50,$0F0F,$006D
#_02F429: dw $04F7,$2070,$9018,$006D
#_02F431: dw $04F7,$2070,$9117,$006D
#_02F439: dw $04F7,$2070,$9217,$006D
#_02F441: dw $04F7,$2070,$9315,$006D
#_02F449: dw $04F7,$2070,$9415,$006D
#_02F451: dw $04F7,$2070,$9517,$006D
#_02F459: dw $04F7,$2070,$9615,$006D
#_02F461: dw $04F7,$2070,$9714,$006D
#_02F469: dw $04F7,$2070,$9813,$006D
#_02F471: dw $04F7,$2070,$9913,$006D
#_02F479: dw $04F7,$1850,$1A39,$006D
#_02F481: dw $04F7,$1850,$1B39,$006D
#_02F489: dw $44F7,$2150,$1C1C,$00DD
#_02F491: dw $046F,$2250,$1D1B,$006D
#_02F499: dw $02F7,$2350,$1E1A,$006E
#_02F4A1: dw $44F7,$2350,$1F1E,$00DD
#_02F4A9: dw $046F,$2450,$2030,$006D
#_02F4B1: dw $04F7,$3170,$A131,$006D
#_02F4B9: dw $04F7,$3170,$A231,$006D
#_02F4C1: dw $04F7,$3170,$A331,$006D
#_02F4C9: dw $04F7,$3170,$A431,$006D
#_02F4D1: dw $02F7,$2350,$2521,$006E
#_02F4D9: dw $04F7,$3050,$261A,$006D
#_02F4E1: dw $04F7,$3270,$A729,$006D
#_02F4E9: dw $02F7,$2250,$2833,$006E
#_02F4F1: dw $02F7,$2650,$2932,$009E
#_02F4F9: dw $02F7,$2550,$2A07,$009E
#_02F501: dw $02F7,$2650,$2B2D,$006E
#_02F509: dw $02F8,$2450,$2C2E,$006E
#_02F511: dw $04F7,$1F50,$2D2F,$006D
#_02F519: dw $04F7,$2450,$2E30,$006D
#_02F521: dw $04F7,$3170,$EF34,$006D
#_02F529: dw $04F7,$2150,$3035,$006D
#_02F531: dw $04F7,$1850,$3136,$006D
#_02F539: dw $04F7,$3370,$B218,$006D
#_02F541: dw $02F7,$2250,$3337,$006E
#_02F549: dw $44F7,$3470,$7445,$006D
#_02F551: dw $44D0,$3570,$7546,$006D
#_02F559: dw $02D0,$2650,$2932,$009E
#_02F561: dw $0228,$2550,$2A07,$009E
#_02F569: db $28


;===================================================================================================

data02F56A:

#_02F56A: dl pointers1CC000+$00
#_02F56D: dl pointers1CC000+$04
#_02F570: dl pointers1CC000+$08
#_02F573: dl pointers1CC000+$0C
#_02F576: dl pointers1CC000+$10
#_02F579: dl pointers1CC000+$14
#_02F57C: dl pointers1CC000+$18
#_02F57F: dl pointers1CC000+$1C
#_02F582: dl pointers1CC000+$20
#_02F585: dl pointers1CC000+$24
#_02F588: dl pointers1CC000+$28
#_02F58B: dl pointers1CC000+$2C
#_02F58E: dl pointers1CC000+$30
#_02F591: dl pointers1CC000+$34
#_02F594: dl pointers1CC000+$38
#_02F597: dl pointers1CC000+$3C
#_02F59A: dl pointers1CC000+$40
#_02F59D: dl pointers1CC000+$44
#_02F5A0: dl pointers1CC000+$48
#_02F5A3: dl pointers1CC000+$4C
#_02F5A6: dl pointers1CC000+$50
#_02F5A9: dl pointers1CC000+$54
#_02F5AC: dl pointers1CC000+$58
#_02F5AF: dl pointers1CC000+$5C
#_02F5B2: dl pointers1CC000+$60
#_02F5B5: dl pointers1CC000+$64
#_02F5B8: dl pointers1CC000+$64
#_02F5BB: dl pointers1CC000+$64
#_02F5BE: dl pointers1CC000+$68
#_02F5C1: dl pointers1CC000+$6C
#_02F5C4: dl pointers1CC000+$70
#_02F5C7: dl pointers1CC000+$74
#_02F5CA: dl pointers1CC000+$78
#_02F5CD: dl pointers1CC000+$7C
#_02F5D0: dl pointers1CC000+$80
#_02F5D3: dl pointers1CC000+$84
#_02F5D6: dl pointers0FA56E+$00
#_02F5D9: dl pointers0FA56E+$04
#_02F5DC: dl pointers0FA56E+$08
#_02F5DF: dl pointers0FA56E+$0C
#_02F5E2: dl pointers0FA56E+$10
#_02F5E5: dl pointers0FA56E+$14
#_02F5E8: dl pointers0FA56E+$18
#_02F5EB: dl pointers0FA56E+$1C
#_02F5EE: dl pointers0FA56E+$20
#_02F5F1: dl pointers0FA56E+$24
#_02F5F4: dl pointers0FA56E+$28
#_02F5F7: dl pointers0FA56E+$2C
#_02F5FA: dl pointers0FA56E+$30
#_02F5FD: dl pointers0FA56E+$30
#_02F600: dl pointers0FA56E+$34
#_02F603: dl pointers0FA56E+$38
#_02F606: dl pointers0FA56E+$3C

;===================================================================================================

routine02F609:
#_02F609: PHP
#_02F60A: SEP #$20
#_02F60C: STA.w $0E00
#_02F60F: LDA.w $0F43
#_02F612: BMI .branch02F66B

#_02F614: REP #$30
#_02F616: LDA.w $0E00
#_02F619: AND.w #$00FF
#_02F61C: ASL A
#_02F61D: TAY
#_02F61E: PHB
#_02F61F: PHK
#_02F620: PLB
#_02F621: LDA.w data02F6B9,Y
#_02F624: STA.w $00E0
#_02F627: LDY.w #$0000

.branch02F62A
#_02F62A: REP #$30
#_02F62C: LDA.b ($E0),Y
#_02F62E: CMP.w #$FFFF
#_02F631: BEQ .branch02F668

#_02F633: STA.w $0F07
#_02F636: INY
#_02F637: INY
#_02F638: LDA.b ($E0),Y
#_02F63A: STA.w DMA0ADDRL
#_02F63D: INY
#_02F63E: INY
#_02F63F: LDA.b ($E0),Y
#_02F641: STA.w DMA0SIZEL
#_02F644: INY
#_02F645: INY

#_02F646: SEP #$20
#_02F648: LDA.b ($E0),Y
#_02F64A: STA.w DMA0ADDRB
#_02F64D: INY
#_02F64E: INY
#_02F64F: LDA.b #$01
#_02F651: STA.w DMA0MODE
#_02F654: LDA.b #$18
#_02F656: STA.w DMA0PORT
#_02F659: LDA.b #$01
#_02F65B: STA.w $0F06
#_02F65E: PHY
#_02F65F: PHP
#_02F660: JSL AddSelfAsVectorAndMakeSpace
#_02F664: PLP
#_02F665: PLY
#_02F666: BRA .branch02F62A

.branch02F668
#_02F668: PLB
#_02F669: PLP
#_02F66A: RTL

;---------------------------------------------------------------------------------------------------

.branch02F66B
#_02F66B: REP #$30

#_02F66D: LDA.w $0E00
#_02F670: AND.w #$00FF
#_02F673: ASL A
#_02F674: TAY

#_02F675: PHB
#_02F676: PHK
#_02F677: PLB

#_02F678: LDA.w data02F6B9,Y
#_02F67B: STA.w $00E0

#_02F67E: LDY.w #$0000

.branch02F681
#_02F681: LDA.b ($E0),Y
#_02F683: CMP.w #$FFFF
#_02F686: BEQ .done

#_02F688: STA.w VMADDL

#_02F68B: INY
#_02F68C: INY
#_02F68D: LDA.b ($E0),Y
#_02F68F: STA.w $00E2

#_02F692: INY
#_02F693: INY
#_02F694: LDA.b ($E0),Y
#_02F696: TAX

#_02F697: INY
#_02F698: INY
#_02F699: LDA.b ($E0),Y

#_02F69B: INY
#_02F69C: INY

#_02F69D: SEP #$20
#_02F69F: STA.w $00E4

#_02F6A2: REP #$20
#_02F6A4: PHY
#_02F6A5: LDY.w #$0000

.branch02F6A8
#_02F6A8: LDA.b [$E2],Y
#_02F6AA: STA.w VMDATAL
#_02F6AD: INY
#_02F6AE: INY
#_02F6AF: DEX
#_02F6B0: DEX
#_02F6B1: BNE .branch02F6A8

#_02F6B3: PLY
#_02F6B4: BRA .branch02F681

.done
#_02F6B6: PLB
#_02F6B7: PLP
#_02F6B8: RTL

;---------------------------------------------------------------------------------------------------

data02F6B9:
#_02F6B9: dw data02F739
#_02F6BB: dw data02F75B
#_02F6BD: dw data02F795
#_02F6BF: dw data02F7AF
#_02F6C1: dw data02F7C9
#_02F6C3: dw data02F7E3
#_02F6C5: dw data02F7FD
#_02F6C7: dw data02F817
#_02F6C9: dw data02F831
#_02F6CB: dw data02F843
#_02F6CD: dw data02F855
#_02F6CF: dw data02F86F
#_02F6D1: dw data02F889
#_02F6D3: dw data02F89B
#_02F6D5: dw data02F8AD
#_02F6D7: dw data02F8C7
#_02F6D9: dw data02F8E1
#_02F6DB: dw data02F8FB
#_02F6DD: dw data02F915
#_02F6DF: dw data02F927
#_02F6E1: dw data02F939
#_02F6E3: dw data02F94B
#_02F6E5: dw data02F749
#_02F6E7: dw data02F95D
#_02F6E9: dw data02F967
#_02F6EB: dw data02F981
#_02F6ED: dw data02F99B
#_02F6EF: dw data02F9B5
#_02F6F1: dw data02F9CF
#_02F6F3: dw data02F9E9
#_02F6F5: dw data02F9FB
#_02F6F7: dw data02FA0D
#_02F6F9: dw data02FA1F
#_02F6FB: dw data02FA31
#_02F6FD: dw data02FA43
#_02F6FF: dw data02FA55
#_02F701: dw data02FA67
#_02F703: dw data02FA79
#_02F705: dw data02FA8B
#_02F707: dw data02FA9D
#_02F709: dw data02FAAF
#_02F70B: dw data02F751
#_02F70D: dw data02FAB9
#_02F70F: dw data02FB13
#_02F711: dw data02FB45
#_02F713: dw data02FB4F
#_02F715: dw data02FB59
#_02F717: dw data02FB63
#_02F719: dw data02FB6D
#_02F71B: dw data02FB7F
#_02F71D: dw data02FB91
#_02F71F: dw data02FBA3
#_02F721: dw data02FBB5
#_02F723: dw data02FBC7
#_02F725: dw data02FBD1
#_02F727: dw data02FBD1
#_02F729: dw data02FBD1
#_02F72B: dw data02FBD1
#_02F72D: dw data02FBDB
#_02F72F: dw data02FBE5
#_02F731: dw data02FBFF
#_02F733: dw data02FB4F
#_02F735: dw data02FB59
#_02F737: dw data02FB63

;---------------------------------------------------------------------------------------------------
; dw <vram>, <address>, <size>, <bank>
;---------------------------------------------------------------------------------------------------
data02F739:
#_02F739: dw $2000, GFX108000, $1000, GFX108000>>16
#_02F741: dw $0000, GFX27E000, $1000, GFX27E000>>16

;---------------------------------------------------------------------------------------------------

data02F749:
#_02F749: dw $3400, GFX109800, $0800, GFX109800>>16

;---------------------------------------------------------------------------------------------------

data02F751:
#_02F751: dw $3C00, GFX10A000, $0800, GFX10A000>>16
#_02F759: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F75B:
#_02F75B: dw $2000, MoreFontGFX, $1000, MoreFontGFX>>16
#_02F763: dw $4000, GFX1A8000, $1000, GFX1A8000>>16
#_02F76B: dw $4800, GFX1A9000, $1000, GFX1A9000>>16
#_02F773: dw $5000, GFX1AA000, $1000, GFX1AA000>>16
#_02F77B: dw $5800, GFX1AB000, $1000, GFX1AB000>>16
#_02F783: dw $0000, GFX27E000, $1800, GFX27E000>>16
#_02F78B: dw $3C00, GFX10E000, $0800, GFX10E000>>16
#_02F793: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F795:
#_02F795: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F79D: dw $5010, GFX1BBF60, $1000, GFX1BBF60>>16
#_02F7A5: dw $5810, GFX1BCF60, $0FE0, GFX1BCF60>>16
#_02F7AD: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F7AF:
#_02F7AF: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F7B7: dw $6010, GFX1BBF60, $1000, GFX1BBF60>>16
#_02F7BF: dw $6810, GFX1BCF60, $0FE0, GFX1BCF60>>16
#_02F7C7: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F7C9:
#_02F7C9: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F7D1: dw $5010, GFX1B93E0, $1000, GFX1B93E0>>16
#_02F7D9: dw $5810, GFX1BA3E0, $0FE0, GFX1BA3E0>>16
#_02F7E1: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F7E3:
#_02F7E3: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F7EB: dw $6010, GFX1B93E0, $1000, GFX1B93E0>>16
#_02F7F3: dw $6810, GFX1BA3E0, $0FE0, GFX1BA3E0>>16
#_02F7FB: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F7FD:
#_02F7FD: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F805: dw $5010, GFX1BB140, $1000, GFX1BB140>>16
#_02F80D: dw $5810, GFX1BC140, $0FE0, GFX1BC140>>16
#_02F815: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F817:
#_02F817: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F81F: dw $6010, GFX1BB140, $1000, GFX1BB140>>16
#_02F827: dw $6810, GFX1BC140, $0FE0, GFX1BC140>>16
#_02F82F: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F831:
#_02F831: dw $5000, GFX1B8000, $1000, GFX1B8000>>16
#_02F839: dw $5800, GFX1B9000, $1000, GFX1B9000>>16
#_02F841: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F843:
#_02F843: dw $6000, GFX1B8000, $1000, GFX1B8000>>16
#_02F84B: dw $6800, GFX1B9000, $1000, GFX1B9000>>16
#_02F853: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F855:
#_02F855: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F85D: dw $5010, GFX1BCB60, $1000, GFX1BCB60>>16
#_02F865: dw $5810, GFX1BDB60, $0FE0, GFX1BDB60>>16
#_02F86D: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F86F:
#_02F86F: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F877: dw $6010, GFX1BCB60, $1000, GFX1BCB60>>16
#_02F87F: dw $6810, GFX1BDB60, $0FE0, GFX1BDB60>>16
#_02F887: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F889:
#_02F889: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F891: dw $5010, GFX1BF980, $0680, GFX1BF980>>16
#_02F899: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F89B:
#_02F89B: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F8A3: dw $6010, GFX1BF980, $0680, GFX1BF980>>16
#_02F8AB: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F8AD:
#_02F8AD: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F8B5: dw $5010, GFX1BEC00, $1000, GFX1BEC00>>16
#_02F8BD: dw $5810, GFX1BFC00, $0720, GFX1BFC00>>16
#_02F8C5: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F8C7:
#_02F8C7: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F8CF: dw $6010, GFX1BEC00, $1000, GFX1BEC00>>16
#_02F8D7: dw $6810, GFX1BFC00, $0720, GFX1BFC00>>16
#_02F8DF: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F8E1:
#_02F8E1: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F8E9: dw $5010, GFX1BD7E0, $1000, GFX1BD7E0>>16
#_02F8F1: dw $5810, GFX1BE7E0, $0FE0, GFX1BE7E0>>16
#_02F8F9: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F8FB:
#_02F8FB: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F903: dw $6010, GFX1BD7E0, $1000, GFX1BD7E0>>16
#_02F90B: dw $6810, GFX1BE7E0, $0FE0, GFX1BE7E0>>16
#_02F913: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F915:
#_02F915: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F91D: dw $5010, GFX1C94E0, $1000, GFX1C94E0>>16
#_02F925: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F927:
#_02F927: dw $6000, GFX1E8000, $0020, GFX1E8000>>16
#_02F92F: dw $6010, GFX1C94E0, $1000, GFX1C94E0>>16
#_02F937: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F939:
#_02F939: dw $5000, GFX1C8000, $1000, GFX1C8000>>16
#_02F941: dw $5800, GFX1C9000, $1000, GFX1C9000>>16
#_02F949: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F94B:
#_02F94B: dw $6000, GFX1C8000, $1000, GFX1C8000>>16
#_02F953: dw $6800, GFX1C9000, $1000, GFX1C9000>>16
#_02F95B: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F95D:
#_02F95D: dw $3000, GFX1FC000, $0800, GFX1FC000>>16
#_02F965: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F967:
#_02F967: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F96F: dw $5010, GFX1E8020, $1000, GFX1E8020>>16
#_02F977: dw $5810, GFX1E9020, $0FE0, GFX1E9020>>16
#_02F97F: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F981:
#_02F981: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F989: dw $5010, GFX1E98A0, $1000, GFX1E98A0>>16
#_02F991: dw $5810, GFX1EA8A0, $0FE0, GFX1EA8A0>>16
#_02F999: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F99B:
#_02F99B: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F9A3: dw $5010, GFX1EB120, $1000, GFX1EB120>>16
#_02F9AB: dw $5810, GFX1EC120, $0FE0, GFX1EC120>>16
#_02F9B3: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F9B5:
#_02F9B5: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F9BD: dw $5010, GFX1EC9A0, $1000, GFX1EC9A0>>16
#_02F9C5: dw $5810, GFX1ED9A0, $0FE0, GFX1ED9A0>>16
#_02F9CD: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F9CF:
#_02F9CF: dw $5000, GFX1E8000, $0020, GFX1E8000>>16
#_02F9D7: dw $5010, GFX1EE220, $1000, GFX1EE220>>16
#_02F9DF: dw $5810, GFX1EF220, $0FE0, GFX1EF220>>16
#_02F9E7: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F9E9:
#_02F9E9: dw $5000, GFX1F8000, $1000, GFX1F8000>>16
#_02F9F1: dw $5800, GFX1F9000, $1000, GFX1F9000>>16
#_02F9F9: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02F9FB:
#_02F9FB: dw $5000, GFX1FA000, $1000, GFX1FA000>>16
#_02FA03: dw $5800, GFX1FB000, $1000, GFX1FB000>>16
#_02FA0B: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA0D:
#_02FA0D: dw $5000, GFX1FC000, $1000, GFX1FC000>>16
#_02FA15: dw $5800, GFX1FD000, $1000, GFX1FD000>>16
#_02FA1D: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA1F:
#_02FA1F: dw $6000, GFX1FE000, $1000, GFX1FE000>>16
#_02FA27: dw $6800, GFX1FF000, $1000, GFX1FF000>>16
#_02FA2F: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA31:
#_02FA31: dw $5000, GFX208000, $1000, GFX208000>>16
#_02FA39: dw $5800, GFX209000, $1000, GFX209000>>16
#_02FA41: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA43:
#_02FA43: dw $5000, GFX20A000, $1000, GFX20A000>>16
#_02FA4B: dw $5800, GFX20B000, $1000, GFX20B000>>16
#_02FA53: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA55:
#_02FA55: dw $5000, GFX20C000, $1000, GFX20C000>>16
#_02FA5D: dw $5800, GFX20D000, $1000, GFX20D000>>16
#_02FA65: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA67:
#_02FA67: dw $5000, GFX20E000, $1000, GFX20E000>>16
#_02FA6F: dw $5800, GFX20F000, $1000, GFX20F000>>16
#_02FA77: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA79:
#_02FA79: dw $5000, GFX218000, $1000, GFX218000>>16
#_02FA81: dw $5800, GFX219000, $1000, GFX219000>>16
#_02FA89: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA8B:
#_02FA8B: dw $5000, GFX21A000, $1000, GFX21A000>>16
#_02FA93: dw $5800, GFX21B000, $1000, GFX21B000>>16
#_02FA9B: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FA9D:
#_02FA9D: dw $4000, GFX1E8000, $0020, GFX1E8000>>16
#_02FAA5: dw $4800, GFX1E8000, $0020, GFX1E8000>>16
#_02FAAD: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FAAF:
#_02FAAF: dw $0600, GFX27F000, $0400, GFX27F000>>16
#_02FAB7: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FAB9:
#_02FAB9: dw $2000, MoreFontGFX, $1000, MoreFontGFX>>16
#_02FAC1: dw $4000, GFX1E8000, $0020, GFX1E8000>>16
#_02FAC9: dw $4010, GFX1A9440, $1000, GFX1A9440>>16
#_02FAD1: dw $4810, GFX1AA440, $1000, GFX1AA440>>16
#_02FAD9: dw $5010, GFX1AB440, $1000, GFX1AB440>>16
#_02FAE1: dw $5810, GFX1AC440, $1000, GFX1AC440>>16
#_02FAE9: dw $6010, GFX1AD440, $1000, GFX1AD440>>16
#_02FAF1: dw $6810, GFX1AE440, $1000, GFX1AE440>>16
#_02FAF9: dw $7010, GFX1AF440, $1000, GFX1AF440>>16
#_02FB01: dw $0000, GFX27E000, $1800, GFX27E000>>16
#_02FB09: dw $3C00, GFX10E000, $0800, GFX10E000>>16
#_02FB11: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB13:
#_02FB13: dw $4000, GFX239000, $1000, GFX239000>>16
#_02FB1B: dw $4800, GFX23A000, $1000, GFX23A000>>16
#_02FB23: dw $5000, GFX23B000, $1000, GFX23B000>>16
#_02FB2B: dw $5800, GFX23C000, $1000, GFX23C000>>16
#_02FB33: dw $6000, GFX23C160, $1000, GFX23C160>>16
#_02FB3B: dw $6800, GFX23D160, $1000, GFX23D160>>16
#_02FB43: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB45:
#_02FB45: dw $2800, GFX238000, $0800, GFX238000>>16
#_02FB4D: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB4F:
#_02FB4F: dw $2800, GFX238800, $0800, GFX238800>>16
#_02FB57: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB59:
#_02FB59: dw $0800, GFX23DDE0, $1000, GFX23DDE0>>16
#_02FB61: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB63:
#_02FB63: dw $2000, GFX108000, $1000, GFX108000>>16
#_02FB6B: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB6D:
#_02FB6D: dw $5000, GFX21C000, $1000, GFX21C000>>16
#_02FB75: dw $5800, GFX21D000, $1000, GFX21D000>>16
#_02FB7D: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB7F:
#_02FB7F: dw $6000, GFX20E000, $1000, GFX20E000>>16
#_02FB87: dw $6800, GFX20F000, $1000, GFX20F000>>16
#_02FB8F: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FB91:
#_02FB91: dw $6000, GFX218000, $1000, GFX218000>>16
#_02FB99: dw $6800, GFX219000, $1000, GFX219000>>16
#_02FBA1: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBA3:
#_02FBA3: dw $6000, GFX20A000, $1000, GFX20A000>>16
#_02FBAB: dw $6800, GFX20B000, $1000, GFX20B000>>16
#_02FBB3: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBB5:
#_02FBB5: dw $7400, GFX2BA000, $0800, GFX2BA000>>16
#_02FBBD: dw $7800, GFX2BD800, $0800, GFX2BD800>>16
#_02FBC5: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBC7:
#_02FBC7: dw $7400, GFX2CB000, $1000, GFX2CB000>>16
#_02FBCF: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBD1:
#_02FBD1: dw $5000, GFX1CA000, $1000, GFX1CA000>>16
#_02FBD9: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBDB:
#_02FBDB: dw $6000, GFX1CA000, $1000, GFX1CA000>>16
#_02FBE3: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBE5:
#_02FBE5: dw $2000, GFX108000, $1000, GFX108000>>16
#_02FBED: dw $0000, GFX27E000, $1000, GFX27E000>>16
#_02FBF5: dw $3C00, GFX10E000, $0800, GFX10E000>>16
#_02FBFD: dw $FFFF

;---------------------------------------------------------------------------------------------------

data02FBFF:
#_02FBFF: dw $06C0, GFX27F500, $0400, GFX27F500>>16
#_02FC07: dw $FFFF

;===================================================================================================

routine02FC09:
#_02FC09: PHP
#_02FC0A: REP #$30
#_02FC0C: AND.w #$00FF
#_02FC0F: ASL A
#_02FC10: TAY
#_02FC11: PHB

#_02FC12: SEP #$20
#_02FC14: LDA.b #data02FD4D>>16
#_02FC16: PHA

#_02FC17: REP #$20
#_02FC19: PLB
#_02FC1A: LDA.w data02FD4D,Y
#_02FC1D: STA.w $00E0
#_02FC20: LDY.w #$0000

.branch02FC23
#_02FC23: LDA.b ($E0),Y
#_02FC25: AND.w #$00FF
#_02FC28: CMP.w #$00FF
#_02FC2B: BEQ .branch02FC6B

#_02FC2D: ASL A
#_02FC2E: ASL A
#_02FC2F: ASL A
#_02FC30: ASL A
#_02FC31: ASL A
#_02FC32: STA.w $0E04
#_02FC35: INY
#_02FC36: LDA.b ($E0),Y
#_02FC38: AND.w #$00FF
#_02FC3B: ASL A
#_02FC3C: ASL A
#_02FC3D: ASL A
#_02FC3E: ASL A
#_02FC3F: ASL A
#_02FC40: STA.w $0E06
#_02FC43: LDA.w #$000F
#_02FC46: STA.w $0E02

.branch02FC49
#_02FC49: LDX.w $0E06
#_02FC4C: LDA.l SomePalette1CB000,X
#_02FC50: LDX.w $0E04
#_02FC53: STA.l $7E2500,X
#_02FC57: INC.w $0E04
#_02FC5A: INC.w $0E04
#_02FC5D: INC.w $0E06
#_02FC60: INC.w $0E06
#_02FC63: DEC.w $0E02
#_02FC66: BPL .branch02FC49

#_02FC68: INY
#_02FC69: BRA .branch02FC23

.branch02FC6B
#_02FC6B: PLB
#_02FC6C: PLP
#_02FC6D: RTL

;===================================================================================================

routine02FC6E:
#_02FC6E: PHP
#_02FC6F: REP #$20
#_02FC71: STA.w $0E00
#_02FC74: PHB

#_02FC75: SEP #$20
#_02FC77: LDA.b #data02FD4D>>16
#_02FC79: PHA

#_02FC7A: REP #$20
#_02FC7C: PLB

#_02FC7D: SEP #$20
#_02FC7F: LDA.w $0F43
#_02FC82: BMI .branch02FD03

#_02FC84: REP #$30
#_02FC86: LDA.w $0E00
#_02FC89: AND.w #$00FF
#_02FC8C: ASL A
#_02FC8D: TAY
#_02FC8E: LDA.w data02FD4D,Y
#_02FC91: STA.w $00E0
#_02FC94: STZ.w $0E00
#_02FC97: STZ.w $0E02
#_02FC9A: STZ.w $0E04

.branch02FC9D
#_02FC9D: SEP #$20
#_02FC9F: LDY.w $0E00
#_02FCA2: LDX.w $0E02
#_02FCA5: LDA.b ($E0),Y
#_02FCA7: CMP.b #$FF
#_02FCA9: BEQ .branch02FCF3

#_02FCAB: ASL A
#_02FCAC: ASL A
#_02FCAD: ASL A
#_02FCAE: ASL A
#_02FCAF: STA.l $7E22FE,X
#_02FCB3: LDA.b #$10
#_02FCB5: STA.l $7E22FF,X
#_02FCB9: INC.w $0E02
#_02FCBC: INY
#_02FCBD: LDA.b ($E0),Y

#_02FCBF: REP #$20
#_02FCC1: AND.w #$00FF
#_02FCC4: ASL A
#_02FCC5: ASL A
#_02FCC6: ASL A
#_02FCC7: ASL A
#_02FCC8: ASL A
#_02FCC9: TAX
#_02FCCA: INC.w $0E02
#_02FCCD: LDY.w #$001F

.branch02FCD0
#_02FCD0: SEP #$20
#_02FCD2: LDA.l SomePalette1CB000,X
#_02FCD6: PHX
#_02FCD7: LDX.w $0E02
#_02FCDA: STA.l $7E22FE,X
#_02FCDE: PLX

#_02FCDF: REP #$20
#_02FCE1: INX
#_02FCE2: INC.w $0E02
#_02FCE5: DEY
#_02FCE6: BPL .branch02FCD0

#_02FCE8: INC.w $0E04
#_02FCEB: INC.w $0E00
#_02FCEE: INC.w $0E00
#_02FCF1: BRA .branch02FC9D

.branch02FCF3
#_02FCF3: SEP #$20
#_02FCF5: LDA.w $0E04
#_02FCF8: STA.l $7E22FD
#_02FCFC: PLB
#_02FCFD: PLP
#_02FCFE: JSL AddSelfAsVectorAndMakeSpace
#_02FD02: RTL

.branch02FD03
#_02FD03: REP #$30
#_02FD05: LDA.w $0E00
#_02FD08: AND.w #$00FF
#_02FD0B: ASL A
#_02FD0C: TAY
#_02FD0D: LDA.w data02FD4D,Y
#_02FD10: STA.w $00E0
#_02FD13: LDY.w #$0000

.branch02FD16
#_02FD16: SEP #$20
#_02FD18: LDA.b ($E0),Y
#_02FD1A: CMP.b #$FF
#_02FD1C: BEQ .branch02FD48

#_02FD1E: ASL A
#_02FD1F: ASL A
#_02FD20: ASL A
#_02FD21: ASL A
#_02FD22: STA.w CGADD
#_02FD25: INY
#_02FD26: LDA.b ($E0),Y

#_02FD28: REP #$20
#_02FD2A: AND.w #$00FF
#_02FD2D: ASL A
#_02FD2E: ASL A
#_02FD2F: ASL A
#_02FD30: ASL A
#_02FD31: ASL A
#_02FD32: TAX
#_02FD33: PHY
#_02FD34: LDY.w #$001F

.branch02FD37
#_02FD37: SEP #$20
#_02FD39: LDA.l SomePalette1CB000,X
#_02FD3D: STA.w CGDATA
#_02FD40: INX
#_02FD41: DEY
#_02FD42: BPL .branch02FD37

#_02FD44: PLY
#_02FD45: INY
#_02FD46: BRA .branch02FD16

.branch02FD48
#_02FD48: SEP #$20
#_02FD4A: PLB
#_02FD4B: PLP
#_02FD4C: RTL

data02FD4D:
#_02FD4D: dw data02FDDD
#_02FD4F: dw data02FDEE
#_02FD51: dw data02FDFE
#_02FD53: dw data02FE03
#_02FD55: dw data02FE06
#_02FD57: dw data02FE09
#_02FD59: dw data02FE0C
#_02FD5B: dw data02FE0F
#_02FD5D: dw data02FE12
#_02FD5F: dw data02FE15
#_02FD61: dw data02FE18
#_02FD63: dw data02FE1B
#_02FD65: dw data02FE1E
#_02FD67: dw data02FE21
#_02FD69: dw data02FE24
#_02FD6B: dw data02FE27
#_02FD6D: dw data02FE2A
#_02FD6F: dw data02FE2D
#_02FD71: dw data02FE30
#_02FD73: dw data02FE33
#_02FD75: dw data02FE36
#_02FD77: dw data02FE39
#_02FD79: dw data02FE3C
#_02FD7B: dw data02FE3F
#_02FD7D: dw data02FE42
#_02FD7F: dw data02FE45
#_02FD81: dw data02FE48
#_02FD83: dw data02FE4B
#_02FD85: dw data02FE4E
#_02FD87: dw data02FE51
#_02FD89: dw data02FE54
#_02FD8B: dw data02FE57
#_02FD8D: dw data02FE5A
#_02FD8F: dw data02FE5D
#_02FD91: dw data02FE60
#_02FD93: dw data02FE63
#_02FD95: dw data02FE66
#_02FD97: dw data02FE69
#_02FD99: dw data02FE7E
#_02FD9B: dw data02FE81
#_02FD9D: dw data02FE8C
#_02FD9F: dw data02FE8F
#_02FDA1: dw data02FE92
#_02FDA3: dw data02FE95
#_02FDA5: dw data02FE98
#_02FDA7: dw data02FE9B
#_02FDA9: dw data02FE9E
#_02FDAB: dw data02FEA1
#_02FDAD: dw data02FEA4
#_02FDAF: dw data02FEA7
#_02FDB1: dw data02FEAA
#_02FDB3: dw data02FEAD
#_02FDB5: dw data02FEB0
#_02FDB7: dw data02FEB3
#_02FDB9: dw data02FEB6
#_02FDBB: dw data02FEB9
#_02FDBD: dw data02FEBC
#_02FDBF: dw data02FEBF
#_02FDC1: dw data02FEC2
#_02FDC3: dw data02FEC5
#_02FDC5: dw data02FEC8
#_02FDC7: dw data02FECB
#_02FDC9: dw data02FECE
#_02FDCB: dw data02FED1
#_02FDCD: dw data02FED4
#_02FDCF: dw data02FED7
#_02FDD1: dw data02FEDA
#_02FDD3: dw data02FEDD
#_02FDD5: dw data02FEE0
#_02FDD7: dw data02FEE3
#_02FDD9: dw data02FEE6
#_02FDDB: dw data02FEE9
data02FDDD:
#_02FDDD: dw $0000,$0004,$0101,$5905
#_02FDE5: dw $5A06,$5B07,$0208,$020C
#_02FDED: dw $00FF,$0100,$0201,$0303
#_02FDF5: dw $0404,$0505,$0606,$0707
#_02FDFD: dw $0808,$0C02,$FF02
data02FE03:
#_02FE03: dw $0E02,$02FF,$FF0F
data02FE09:
#_02FE09: dw $2002,$02FF,$FF21
data02FE0F:
#_02FE0F: dw $2202,$02FF,$FF23
data02FE15:
#_02FE15: dw $2402,$02FF,$FF25
data02FE1B:
#_02FE1B: dw $2602,$02FF,$FF27
data02FE21:
#_02FE21: dw $2803,$02FF,$FF29
data02FE27:
#_02FE27: dw $2A02,$02FF,$FF2C
data02FE2D:
#_02FE2D: dw $2D02,$03FF,$FF2E
data02FE33:
#_02FE33: dw $2F03,$03FF,$FF30
data02FE39:
#_02FE39: dw $3103,$03FF,$FF32
data02FE3F:
#_02FE3F: dw $3303,$03FF,$FF34
data02FE45:
#_02FE45: dw $1002,$02FF,$FF35
data02FE4B:
#_02FE4B: dw $3602,$02FF,$FF37
data02FE51:
#_02FE51: dw $3802,$02FF,$FF39
data02FE57:
#_02FE57: dw $3A02,$03FF,$FF3B
data02FE5D:
#_02FE5D: dw $3C02,$02FF,$FF3D
data02FE63:
#_02FE63: dw $5101,$07FF,$FF11
data02FE69:
#_02FE69: dw $0000,$0101,$0802,$0903
#_02FE71: dw $0A04,$0B05,$0C06,$0D07
#_02FE79: dw $0208,$020C,$06FF,$FF12
data02FE81:
#_02FE81: dw $0000,$5301,$5402,$5503
#_02FE89: dw $5204,$0BFF,$FF56
data02FE8F:
#_02FE8F: dw $3E03,$02FF,$FF45
data02FE95:
#_02FE95: dw $4602,$02FF,$FF47
data02FE9B:
#_02FE9B: dw $4202,$02FF,$FF43
data02FEA1:
#_02FEA1: dw $4402,$02FF,$FF45
data02FEA7:
#_02FEA7: dw $4603,$02FF,$FF47
data02FEAD:
#_02FEAD: dw $4D02,$03FF,$FF2D
data02FEB3:
#_02FEB3: dw $4A02,$02FF,$FF4B
data02FEB9:
#_02FEB9: dw $4C02,$02FF,$FF4E
data02FEBF:
#_02FEBF: dw $4F02,$02FF,$FF50
data02FEC5:
#_02FEC5: dw $1602,$02FF,$FF17
data02FECB:
#_02FECB: dw $1802,$02FF,$FF19
data02FED1:
#_02FED1: dw $1A02,$02FF,$FF1B
data02FED7:
#_02FED7: dw $1C02,$02FF,$FF1D
data02FEDD:
#_02FEDD: dw $1E02,$08FF,$FF00
data02FEE3:
#_02FEE3: dw $5703,$03FF,$FF58
data02FEE9:
#_02FEE9: dw $5901,$5905,$23FF,$02FF
#_02FEF1: dw $FF24,$2502,$02FF,$FF26
#_02FEF9: dw $2702,$03FF,$FF28,$2902
#_02FF01: dw $02FF,$FF2A,$2C02,$02FF
#_02FF09: dw $FF2D,$2E03,$03FF,$FF2F
#_02FF11: dw $3003,$03FF,$FF31,$3203
#_02FF19: dw $03FF,$FF33,$3403,$02FF
#_02FF21: dw $FF10,$3502,$02FF,$FF36
#_02FF29: dw $3702,$02FF,$FF38,$3902
#_02FF31: dw $02FF,$FF3A,$3B03,$02FF
#_02FF39: dw $FF3C,$3D02,$01FF,$FF51
#_02FF41: dw $1107,$00FF,$0100,$0201
#_02FF49: dw $0308,$0409,$050A,$060B
#_02FF51: dw $070C,$080D,$0C02,$FF02
#_02FF59: dw $1206,$00FF,$0100,$0253
#_02FF61: dw $0354,$0455,$FF52,$560B
#_02FF69: dw $03FF,$FF3E,$4502,$02FF
#_02FF71: dw $FF46,$4702,$02FF,$FF42
#_02FF79: dw $4302,$02FF,$FF44,$4502
#_02FF81: dw $03FF,$FF46,$4702,$02FF
#_02FF89: dw $FF4D,$2D03,$02FF,$FF4A
#_02FF91: dw $4B02,$02FF,$FF4C,$4E02
#_02FF99: dw $02FF,$FF4F,$5002,$02FF
#_02FFA1: dw $FF16,$1702,$02FF,$FF18
#_02FFA9: dw $1902,$02FF,$FF1A,$1B02
#_02FFB1: dw $02FF,$FF1C,$1D02,$02FF
#_02FFB9: dw $FF1E,$0008,$03FF,$FF57
#_02FFC1: dw $5803,$01FF,$0559,$FF59
#_02FFC9: dw $FF1B,$1C02,$02FF,$FF1D
#_02FFD1: dw $1E02,$08FF,$FF00,$5703
#_02FFD9: dw $03FF,$FF58,$5901,$5905
#_02FFE1: dw $FFFF,$1B02,$02FF,$FF1C
#_02FFE9: dw $1D02,$02FF,$FF1E,$0008
#_02FFF1: dw $03FF,$FF57,$5803,$01FF
#_02FFF9: dw $0559,$FF59,$EBA3
#_02FFFF: db $00
