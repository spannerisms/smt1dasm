org $018000

;===================================================================================================

GameMenu:
#_018000: REP #$30

#_018002: STZ.w $0C4F

#_018005: STZ.w $0715

#_018008: LDA.w #$0000
#_01800B: JSL RunOpenMenuDMA_Xplus6

#_01800F: JSL TriggerMenuGrow

#_018013: JSL WriteMoneyToHUD
#_018017: JSL WriteMAGToHUD

#_01801B: JSR ConfigureGameMenuTextIDs

#_01801E: STZ.w $0ED2

#_018021: LDA.w #$3C58 ; $78B0 in VRAM
#_018024: LDY.w #$0003
#_018027: LDX.w #$1006
#_01802A: JSL CacheCursorPositionAndSet

;---------------------------------------------------------------------------------------------------

.continue_menuing
#_01802E: JSL WaitForMenuChoice_FirstPerson

#_018032: LDA.w $0E9A
#_018035: BMI .close_menu

#_018037: LDA.w #$0002
#_01803A: JSL InitializeTextBoxToSizeForNewMessage

#_01803E: JSL routine00A056

#_018042: LDA.w $0E9A
#_018045: ASL A
#_018046: TAX

#_018047: LDA.l GameMenuOptions,X
#_01804B: STA.w $0690

#_01804E: LDA.w #.return-1
#_018051: PHA

#_018052: JMP ($0690)

.return
#_018055: JSL UpdateDialogBox
#_018059: JSL GoToPreviousMenu

#_01805D: LDA.w $0C4F
#_018060: BPL .continue_menuing

;---------------------------------------------------------------------------------------------------

.close_menu
#_018062: JSL TriggerMenuShrink
#_018066: JSL BringUpAMenu

#_01806A: RTL

;===================================================================================================

ConfigureGameMenuTextIDs:
#_01806B: LDA.w #$0003
#_01806E: STA.w $0A26

#_018071: LDA.w #$0020
#_018074: STA.w $0A2C

#_018077: LDA.w #$0018
#_01807A: STA.w $0A1E

#_01807D: LDA.w #$000C
#_018080: STA.w $0A20

#_018083: LDA.w #$0002
#_018086: STA.w $0A1C

#_018089: RTS

;===================================================================================================

DisplaySystemMessage:
#_01808A: STA.w $0A22

#_01808D: LDA.w $0400
#_018090: AND.w #$0040
#_018093: BEQ .branch01809E

#_018095: LDA.w $052A
#_018098: AND.w #$4000
#_01809B: BEQ .branch01809E

#_01809D: RTL

.branch01809E
#_01809E: LDA.w #$0002
#_0180A1: JSL routine00BAC0
#_0180A5: LDA.w #$0000
#_0180A8: STA.w $0A24
#_0180AB: LDA.w #$3DC4
#_0180AE: STA.w $0A1A
#_0180B1: LDA.w $0400
#_0180B4: AND.w #$0040
#_0180B7: BNE .branch0180BC

#_0180B9: STZ.w $0EEF

.branch0180BC
#_0180BC: JSL routine03837C
#_0180C0: JSL AddSelfAsVector

#_0180C4: RTL

;===================================================================================================

DisplayActionMessage:
#_0180C5: PHA
#_0180C6: LDA.w $0400
#_0180C9: AND.w #$0040
#_0180CC: BEQ .branch0180D8

#_0180CE: LDA.w $052A
#_0180D1: AND.w #$4000
#_0180D4: BEQ .branch0180D8

#_0180D6: PLA
#_0180D7: RTL

.branch0180D8
#_0180D8: LDA.w #$0002
#_0180DB: JSL routine00BAC0
#_0180DF: LDA.w #$0000
#_0180E2: STA.w $0A22
#_0180E5: LDA.w #$0001
#_0180E8: STA.w $0A24
#_0180EB: LDA.w #$3E04
#_0180EE: STA.w $0A1A
#_0180F1: JSL routine03837C
#_0180F5: JSL AddSelfAsVector
#_0180F9: LDA.w #$3E04
#_0180FC: STA.w $0A1A
#_0180FF: LDA.w $0400
#_018102: AND.w #$0040
#_018105: BNE .branch018110

#_018107: LDA.w #$3DC4
#_01810A: STA.w $0A1A
#_01810D: STZ.w $0EEF

.branch018110
#_018110: PLA
#_018111: STA.w $0A22
#_018114: LDA.w #$0000
#_018117: STA.w $0A24
#_01811A: JSL routine03837C
#_01811E: JSL AddSelfAsVector
#_018122: RTL

;===================================================================================================

routine018123:
#_018123: PHA

#_018124: LDA.w $0400
#_018127: AND.w #$0040
#_01812A: BEQ .continue

#_01812C: LDA.w $052A
#_01812F: AND.w #$4000
#_018132: BEQ .continue

#_018134: PLA
#_018135: RTL

;---------------------------------------------------------------------------------------------------

.continue
#_018136: LDA.w #$0000
#_018139: STA.w $0A22
#_01813C: LDA.w #$0001
#_01813F: STA.w $0A24
#_018142: LDA.w #$3E04
#_018145: STA.w $0A1A
#_018148: JSL routine03837C
#_01814C: JSL AddSelfAsVector
#_018150: LDA.w #$0000
#_018153: STA.w $0A22
#_018156: LDA.w #$0001
#_018159: STA.w $0A24
#_01815C: LDA.w #$3E44
#_01815F: STA.w $0A1A
#_018162: JSL routine03837C
#_018166: JSL AddSelfAsVector
#_01816A: LDA.w #$0003
#_01816D: JSL routine00BA70
#_018171: PLA
#_018172: STA.w $0A22
#_018175: LDA.w #$0000
#_018178: STA.w $0A24
#_01817B: LDA.w #$3E04
#_01817E: STA.w $0A1A
#_018181: JSL routine03837C
#_018185: JSL AddSelfAsVector
#_018189: RTL

;===================================================================================================

routine01818A:
#_01818A: STA.w $0A22

#_01818D: TYA
#_01818E: ASL A ; x64
#_01818F: ASL A
#_018190: ASL A
#_018191: ASL A
#_018192: ASL A
#_018193: ASL A
#_018194: CLC
#_018195: ADC.w #$3DC4
#_018198: STA.w $0A1A

#_01819B: LDA.w $0400
#_01819E: AND.w #$0040
#_0181A1: BNE .branch0181A6

#_0181A3: STZ.w $0EEF

.branch0181A6
#_0181A6: JSL routine03837C
#_0181AA: JSL AddSelfAsVector

#_0181AE: RTS

;===================================================================================================
; TODO these are weird and verify
TriggerMenuShrink:
#_0181AF: PHP
#_0181B0: REP #$30

#_0181B2: LDA.w #$0005
#_0181B5: BRA .set_animation

;---------------------------------------------------------------------------------------------------

#TriggerMenuGrow:
#_0181B7: PHP
#_0181B8: REP #$30

#_0181BA: LDA.w #$0004

.set_animation
#_0181BD: LDY.w #$000A

#_0181C0: LDX.w #$0014
#_0181C3: STA.w $0040,X

#_0181C6: SEP #$20

#_0181C8: LDA.b #$80
#_0181CA: STA.w $1A20,Y

#_0181CD: PLP
#_0181CE: RTL

;===================================================================================================

GameMenuOptions:
#_0181CF: dw GameMenu_COMP
#_0181D1: dw GameMenu_MAGIC
#_0181D3: dw GameMenu_ITEM
#_0181D5: dw GameMenu_STATUS

;===================================================================================================

GameMenu_COMP:
#_0181D7: LDA.w #$0005 ; SFX 05
#_0181DA: JSL Write_to_APU_transferrable

; Can't access computer right now
#_0181DE: LDX.w #$0001

#_0181E1: LDA.w $1002
#_0181E4: BIT.w #$F678 ; checking a lot of awful status conditions TODO name them
#_0181E7: BNE .computer_broke

#_0181E9: LDA.w #$0002
#_0181EC: JSL CheckGameProgressFlag

#_0181F0: LDX.w #$0002
#_0181F3: BCS .computer_broke

#_0181F5: JSL GetCurrentRoomFloorAndDungeonID

#_0181F9: LDA.w $045A
#_0181FC: AND.w #$0080
#_0181FF: BEQ .computer_will_work

; Can't access computer here
#_018201: LDX.w #$0003

.computer_broke
#_018204: TXA
#_018205: JSL DisplaySystemMessage

#_018209: RTS

.computer_will_work
#_01820A: STZ.w $06E0

;---------------------------------------------------------------------------------------------------

.next
#_01820D: LDA.w $0E9A
#_018210: JSL DisplaySystemMessage

#_018214: STZ.w $0715
#_018217: STZ.w $0690

.branch01821A
#_01821A: SEP #$20
#_01821C: LDA.w $0690
#_01821F: CLC
#_018220: ADC.b #$02
#_018222: JSL routine00BA70

#_018226: REP #$20
#_018228: LDA.w $0690
#_01822B: CLC
#_01822C: ADC.w #$0001
#_01822F: TAY
#_018230: LDA.w #$000A
#_018233: CLC
#_018234: ADC.w $0690
#_018237: JSR routine01818A
#_01823A: INC.w $0690
#_01823D: LDA.w $0690
#_018240: CMP.w #$0004
#_018243: BCC .branch01821A

#_018245: CMP.w #$0005
#_018248: BCS .branch018255

#_01824A: LDA.w #$0000
#_01824D: JSL CheckGameProgressFlag
#_018251: BCC .branch01821A

#_018253: BRA .branch018263

.branch018255
#_018255: CMP.w #$0006
#_018258: BCS .branch018263

#_01825A: LDA.w #$0001
#_01825D: JSL CheckGameProgressFlag
#_018261: BCC .branch01821A

;---------------------------------------------------------------------------------------------------

.branch018263
#_018263: SEP #$20

#_018265: LDA.w $0690
#_018268: DEC A
#_018269: STA.w $09F1
#_01826C: STZ.w $09F0

#_01826F: LDA.b #$0B
#_018271: STA.w $09F4
#_018274: STZ.w $09F2

#_018277: SEP #$20

#_018279: LDA.w $06E0
#_01827C: STA.w $09F3

#_01827F: JSL routine02C8E9

#_018283: LDA.w $09F3
#_018286: BMI .exit

#_018288: STA.w $06E0

#_01828B: REP #$30

#_01828D: AND.w #$00FF
#_018290: ASL A
#_018291: TAX
#_018292: LDA.l .vectors,X
#_018296: STA.w $0690

#_018299: LDA.w #.next-1 ; all the way at the top here
#_01829C: PHA

#_01829D: JMP ($0690)

.exit
#_0182A0: REP #$30

#_0182A2: RTS

;---------------------------------------------------------------------------------------------------

.vectors
#_0182A3: dw COMP_SummonDemon
#_0182A5: dw COMP_ReturnDemon
#_0182A7: dw COMP_DismissDemon
#_0182A9: dw COMP_ArrangeParty
#_0182AB: dw COMP_Automapper
#_0182AD: dw COMP_Analyzer

;===================================================================================================

GameMenu_MAGIC:
#_0182AF: STZ.w $06E1

.branch0182B2
#_0182B2: JSL routine01AB0B
#_0182B6: BCS .fail

#_0182B8: JSL routine01E95F

#_0182BC: LDA.w $0C4F
#_0182BF: BPL .branch0182B2

.fail
#_0182C1: RTS

;===================================================================================================

GameMenu_ITEM:
#_0182C2: LDY.w #$0000

.look_for_items
#_0182C5: LDA.w $0780,Y
#_0182C8: AND.w #$FF00
#_0182CB: BNE .next

#_0182CD: INY
#_0182CE: INY
#_0182CF: CPY.w #$0040
#_0182D2: BCC .look_for_items

; You have no items.
#_0182D4: LDA.w #$0020
#_0182D7: JSL DisplaySystemMessage

#_0182DB: RTS

;---------------------------------------------------------------------------------------------------

.next
#_0182DC: STZ.w $06E0

#_0182DF: LDA.w #$0004
#_0182E2: JSL DisplaySystemMessage

#_0182E6: SEP #$20

#_0182E8: LDA.b #$02
#_0182EA: STA.w $09F1
#_0182ED: STZ.w $09F0

#_0182F0: LDA.b #$0B
#_0182F2: STA.w $09F4
#_0182F5: STZ.w $09F2

#_0182F8: SEP #$20

#_0182FA: LDA.w $06E0
#_0182FD: STA.w $09F3

#_018300: JSL routine02C8E9

#_018304: LDA.w $09F3
#_018307: BMI .exit

#_018309: STA.w $06E0

#_01830C: REP #$30

#_01830E: AND.w #$00FF
#_018311: ASL A
#_018312: TAX

#_018313: LDA.l .vectors,X
#_018317: STA.w $0690

#_01831A: LDA.w #.next-1 ; look up
#_01831D: PHA

#_01831E: JMP ($0690)

.exit
#_018321: REP #$30
#_018323: RTS

.vectors
#_018324: dw ITEM_Use
#_018326: dw ITEM_Equip
#_018328: dw ITEM_Discard

;===================================================================================================

routine01832A:
#_01832A: PHP

#_01832B: PHB
#_01832C: PHK
#_01832D: PLB

#_01832E: REP #$30

#_018330: LDA.w $0A26
#_018333: PHA

#_018334: LDA.w #$0003
#_018337: STA.w $0A26

#_01833A: JSR GameMenu_STATUS

#_01833D: PLA
#_01833E: STA.w $0A26

#_018341: PLB

#_018342: PLP
#_018343: RTL

;===================================================================================================

GameMenu_STATUS:
#_018344: PHP
#_018345: REP #$30

.back_to_status_select
#_018347: STZ.w $06E1

#_01834A: STZ.w $0688

#_01834D: JSL ClearEntityListBuffer

#_018351: STZ.w $068A

#_018354: LDX.w #$0000

.next_teammate
#_018357: BIT.w $1000,X
#_01835A: BPL .skip

#_01835C: LDA.w $068A
#_01835F: ASL A
#_018360: TAY

#_018361: TXA
#_018362: STA.w $06A0,Y

#_018365: INC.w $068A

.skip
#_018368: TXA
#_018369: CLC
#_01836A: ADC.w #$0060
#_01836D: TAX

#_01836E: CMP.w #$0600
#_018371: BCC .next_teammate

;---------------------------------------------------------------------------------------------------

; Check whom?
#_018373: LDA.w #$0008
#_018376: JSL DisplaySystemMessage

#_01837A: JSL routine0190E6
#_01837E: BCC .made_selection

#_018380: PLP
#_018381: RTS

;---------------------------------------------------------------------------------------------------

.made_selection
#_018382: STA.w $06E1

#_018385: REP #$30

#_018387: AND.w #$00FF

#_01838A: LDX.w $0688
#_01838D: BEQ .top_choice

.add_to_offset
#_01838F: CLC
#_018390: ADC.w #$0006

#_018393: DEX
#_018394: BNE .add_to_offset

.top_choice
#_018396: ASL A
#_018397: TAY

#_018398: LDA.w $06A0,Y
#_01839B: STA.w $0715

#_01839E: STZ.w $0578

#_0183A1: JSL routine0183E5

#_0183A5: REP #$30

#_0183A7: LDA.w $0400
#_0183AA: AND.w #$0100
#_0183AD: BNE .dont_redraw_menu

#_0183AF: LDA.w #$0000
#_0183B2: JSL RunOpenMenuDMA_Xplus6
#_0183B6: JSL TriggerMenuGrow
#_0183BA: JSL WriteMoneyToHUD
#_0183BE: JSL WriteMAGToHUD

.dont_redraw_menu
#_0183C2: JSL routine00A056

;---------------------------------------------------------------------------------------------------

#_0183C6: SEP #$30

#_0183C8: LDA.w $0404
#_0183CB: BNE .dont_show_sign

#_0183CD: LDA.w $0711
#_0183D0: AND.b #$0F
#_0183D2: CMP.b #$0A
#_0183D4: BNE .dont_show_sign

#_0183D6: JSL RoomEvent_0A_SignA_long

.dont_show_sign
#_0183DA: REP #$30

#_0183DC: LDA.w #$0003
#_0183DF: STA.w $0E9A

#_0183E2: JMP .back_to_status_select

;===================================================================================================

routine0183E5:
#_0183E5: PHP
#_0183E6: SEP #$20
#_0183E8: LDA.w $0404
#_0183EB: BEQ .branch0183F1

#_0183ED: JSL routine029160

.branch0183F1
#_0183F1: REP #$30
#_0183F3: JSR CopyFontIntoWRAM

#_0183F6: SEP #$30
#_0183F8: LDA.b #$00
#_0183FA: STA.w $0F07
#_0183FD: LDA.b #$6C
#_0183FF: STA.w $0F08
#_018402: LDA.b #$01
#_018404: JSL SomeOtherDMAsFromE80
#_018408: LDA.b #$50
#_01840A: STA.w $0F09
#_01840D: LDA.b #$19
#_01840F: JSL SomeOtherDMAsFromE80

#_018413: REP #$30
#_018415: JSL HideTheMenu
#_018419: JSL UpdateUWLabel
#_01841D: JSL UpdateDialogBox
#_018421: JSL routine018EAF

#_018425: SEP #$30
#_018427: LDA.b #$0D
#_018429: JSL PrepHDMAtypeFromA
#_01842D: LDA.b #$1D
#_01842F: STA.w TM
#_018432: STA.w $0F74
#_018435: LDA.b #$46
#_018437: STA.w BG12NBA

#_01843A: REP #$30
#_01843C: LDA.w #$00FF
#_01843F: STA.w $0F4F
#_018442: STZ.w $0F4D
#_018445: LDA.w $0715
#_018448: CMP.w #$0180
#_01844B: BCS .branch018459

#_01844D: JSR routine0164AE
#_018450: JSR Module_DistributeStatPoints
#_018453: JSL routine00A17E
#_018457: BRA .branch018472

.branch018459
#_018459: JSR routine0185D8
#_01845C: JSL Update19XXUntilInput
#_018460: LDA.w #$0002 ; SFX 02
#_018463: JSL Write_to_APU_transferrable
#_018467: LDA.w #$0000
#_01846A: JSL routine01E5CD
#_01846E: JSL Write7066VRAM

.branch018472
#_018472: SEP #$30
#_018474: STZ.w BG1VOFS
#_018477: STZ.w BG1VOFS
#_01847A: LDA.b #$1F
#_01847C: STA.w TM
#_01847F: STA.w $0F74
#_018482: JSL routine018F11
#_018486: LDA.w $0F4B
#_018489: STA.w BG12NBA
#_01848C: LDA.w $0F0D
#_01848F: AND.b #$EF
#_018491: STA.w $0F0D
#_018494: STA.w $0F0E
#_018497: JSL routine00CB2F
#_01849B: JSL routine00C51A

#_01849F: SEP #$20
#_0184A1: LDA.w $0404
#_0184A4: BEQ .exit

#_0184A6: JSL routine02913E

.exit
#_0184AA: REP #$30
#_0184AC: PLP
#_0184AD: RTL

;===================================================================================================

routine0164AE:
#_0184AE: REP #$30
#_0184B0: STZ.w $0EFB
#_0184B3: STZ.w $0E88
#_0184B6: LDX.w $0715
#_0184B9: LDA.w $1004,X
#_0184BC: LDX.w #$0014
#_0184BF: LDY.w #$0000
#_0184C2: JSL GetHeroName
#_0184C6: LDA.w #$0000
#_0184C9: LDX.w #$0014
#_0184CC: LDY.w #$0000
#_0184CF: JSR routine018AA7
#_0184D2: JSL AddSelfAsVectorAndMakeSpace
#_0184D6: JSR routine018879
#_0184D9: JSR routine0188A6
#_0184DC: JSR routine0188F2
#_0184DF: LDA.w #$0003
#_0184E2: JSR DrawStatsTextMaybe018A89
#_0184E5: LDX.w $0715
#_0184E8: LDA.w $100C,X
#_0184EB: STA.w $0E80
#_0184EE: LDA.w $100E,X
#_0184F1: STA.w $0E82
#_0184F4: LDY.w #$000E
#_0184F7: LDA.w #$010E
#_0184FA: JSL WriteAmountHEXtoDEC
#_0184FE: LDA.w #$0002
#_018501: LDX.w #$0040
#_018504: LDY.w #$0080
#_018507: JSR routine018AA7
#_01850A: JSL AddSelfAsVectorAndMakeSpace
#_01850E: LDA.w #$0004
#_018511: JSR DrawStatsTextMaybe018A89
#_018514: STZ.w $0E80
#_018517: STZ.w $0E82
#_01851A: LDX.w $0715
#_01851D: LDA.w $100A,X
#_018520: CMP.w #$0063
#_018523: BCS .branch01854A

#_018525: ASL A
#_018526: ADC.w $100A,X
#_018529: TAY
#_01852A: PHB

#_01852B: SEP #$20

#_01852D: LDA.b #ExperienceTable>>16
#_01852F: PHA

#_018530: REP #$20
#_018532: PLB

#_018533: LDA.w ExperienceTable+0,Y
#_018536: SEC
#_018537: SBC.w $100C,X
#_01853A: STA.w $0E80

#_01853D: LDA.w ExperienceTable+2,Y
#_018540: AND.w #$00FF
#_018543: SBC.w $100E,X
#_018546: STA.w $0E82

#_018549: PLB

;---------------------------------------------------------------------------------------------------

.branch01854A
#_01854A: LDY.w #$000E
#_01854D: LDA.w #$010E
#_018550: JSL WriteAmountHEXtoDEC
#_018554: LDA.w #$0002
#_018557: LDX.w #$0040
#_01855A: LDY.w #$00C0
#_01855D: JSR routine018AA7
#_018560: JSL AddSelfAsVectorAndMakeSpace
#_018564: JSR routine018967
#_018567: LDA.w #$0000

.branch01856A
#_01856A: JSR routine01899E
#_01856D: LDA.w $071C
#_018570: INC A
#_018571: CMP.w #$0007
#_018574: BCC .branch01856A

#_018576: LDA.w #$0006
#_018579: JSR DrawStatsTextMaybe018A89

#_01857C: SEP #$30
#_01857E: LDX.b #$1C
#_018580: LDY.b #$00

.branch018582
#_018582: LDA.l StatsScreenWords,X
#_018586: STA.w $010E,Y
#_018589: LDA.w $0EFC
#_01858C: STA.w $010F,Y
#_01858F: INX
#_018590: INY
#_018591: INY
#_018592: CPY.b #$06
#_018594: BCC .branch018582

#_018596: LDA.b #$9E
#_018598: STA.w $0118
#_01859B: LDA.w $0EFC
#_01859E: STA.w $0119

#_0185A1: REP #$30
#_0185A3: LDA.w #$0004
#_0185A6: LDX.w #$0012
#_0185A9: LDY.w #$0000
#_0185AC: JSR routine018AA7
#_0185AF: LDA.w #$0001
#_0185B2: STA.w $0104,X
#_0185B5: JSL AddSelfAsVectorAndMakeSpace
#_0185B9: LDA.w #$0000

.branch0185BC
#_0185BC: JSR routine0189FF
#_0185BF: LDA.w $071C
#_0185C2: INC A
#_0185C3: CMP.w #$0006
#_0185C6: BCC .branch0185BC

#_0185C8: LDA.w #$0000

.branch0185CB
#_0185CB: JSR routine018B30
#_0185CE: LDA.w $071C
#_0185D1: INC A
#_0185D2: CMP.w #$0006
#_0185D5: BCC .branch0185CB

#_0185D7: RTS

;===================================================================================================

; TODO ITEMS
routine0185D8:
#_0185D8: REP #$30
#_0185DA: LDX.w $0715
#_0185DD: LDA.w $1004,X
#_0185E0: STA.w $050A
#_0185E3: LDA.w #$0000
#_0185E6: STA.w $0524
#_0185E9: LDA.w #$0006
#_0185EC: JSL LoadDemonEverything
#_0185F0: LDA.w $1A10
#_0185F3: ORA.w #$0008
#_0185F6: STA.w $1A10
#_0185F9: STA.w $1A14
#_0185FC: LDA.w $1A30
#_0185FF: ORA.w #$0040
#_018602: STA.w $1A30
#_018605: STA.w $1A34
#_018608: LDA.w #$000F
#_01860B: JSL RunOpenMenuDMA_X
#_01860F: STZ.w $0EFB
#_018612: STZ.w $0E88
#_018615: LDX.w $0715
#_018618: LDA.w $1006,X
#_01861B: LDX.w #$0022
#_01861E: LDY.w #$0000
#_018621: JSL GetClassName
#_018625: LDA.w #$009A
#_018628: STA.w $0112
#_01862B: LDA.w #$0000
#_01862E: STA.w $0134
#_018631: LDX.w $0715
#_018634: LDA.w $1004,X
#_018637: LDX.w #$0030
#_01863A: LDY.w #$000E
#_01863D: JSL GetDemonName
#_018641: LDA.w #$0000
#_018644: LDX.w #$0022
#_018647: LDY.w #$0000
#_01864A: JSR routine018AA7
#_01864D: LDA.w #$000F
#_018650: STA.w $0104
#_018653: STA.w $0104,X
#_018656: JSL AddSelfAsVectorAndMakeSpace
#_01865A: JSR routine018879
#_01865D: JSR routine0188A6
#_018660: JSR routine0188F2
#_018663: LDA.w #$001F
#_018666: JSR DrawStatsTextMaybe018A89
#_018669: LDX.w $0715
#_01866C: LDA.w $104A,X
#_01866F: STA.w $0E80
#_018672: LDA.w #$0000
#_018675: STA.w $0E82
#_018678: LDY.w #$0006
#_01867B: LDA.w #$010E
#_01867E: JSL WriteAmountHEXtoDEC
#_018682: LDA.w #$0002
#_018685: LDX.w #$0040
#_018688: LDY.w #$0080
#_01868B: JSR routine018AA7
#_01868E: LDA.w #$0007
#_018691: STA.w $0104
#_018694: JSL AddSelfAsVectorAndMakeSpace
#_018698: LDA.w #$0020
#_01869B: JSR DrawStatsTextMaybe018A89

#_01869E: SEP #$30
#_0186A0: LDX.b #$84
#_0186A2: LDY.b #$00

.branch0186A4
#_0186A4: LDA.l StatsScreenWords,X
#_0186A8: STA.w $010E,Y
#_0186AB: LDA.w $0EFC
#_0186AE: STA.w $010F,Y
#_0186B1: INX
#_0186B2: INY
#_0186B3: INY
#_0186B4: CPY.b #$08
#_0186B6: BCC .branch0186A4

#_0186B8: REP #$30
#_0186BA: LDY.w #$0000
#_0186BD: LDX.w $0715
#_0186C0: LDA.w $101C,X
#_0186C3: CMP.w #$0070
#_0186C6: BCC .branch0186D1

#_0186C8: INY
#_0186C9: INY
#_0186CA: CMP.w #$0091
#_0186CD: BCC .branch0186D1

#_0186CF: INY
#_0186D0: INY

.branch0186D1
#_0186D1: TYA
#_0186D2: CLC
#_0186D3: ADC.w #$0022
#_0186D6: ASL A
#_0186D7: ASL A
#_0186D8: TAX

#_0186D9: SEP #$30
#_0186DB: LDY.b #$00

.branch0186DD
#_0186DD: LDA.l StatsScreenWords,X
#_0186E1: STA.w $0110,Y
#_0186E4: LDA.w $0EFC
#_0186E7: STA.w $0111,Y
#_0186EA: INX
#_0186EB: INY
#_0186EC: INY
#_0186ED: CPY.b #$10
#_0186EF: BCC .branch0186DD

#_0186F1: REP #$30
#_0186F3: LDA.w #$0002
#_0186F6: LDX.w #$0040
#_0186F9: LDY.w #$00C0
#_0186FC: JSR routine018AA7
#_0186FF: LDA.w #$000D
#_018702: STA.w $0104
#_018705: JSL AddSelfAsVectorAndMakeSpace
#_018709: JSR routine018967
#_01870C: JSR routine01872E
#_01870F: LDA.w #$0000

.branch018712
#_018712: JSR routine0189FF
#_018715: LDA.w $071C
#_018718: INC A
#_018719: CMP.w #$0006
#_01871C: BCC .branch018712

#_01871E: LDA.w #$0000

.branch018721
#_018721: JSR routine018B30
#_018724: LDA.w $071C
#_018727: INC A
#_018728: CMP.w #$0006
#_01872B: BCC .branch018721

#_01872D: RTS

;===================================================================================================

routine01872E:
#_01872E: LDA.w #$0000

.branch018731
#_018731: STA.w $071C
#_018734: CLC
#_018735: ADC.w $0715
#_018738: TAX
#_018739: LDA.w $103E,X
#_01873C: AND.w #$00FF
#_01873F: CMP.w #$006A
#_018742: BCS .branch01875D

#_018744: JSR routine01AE96
#_018747: LDA.w $071C
#_01874A: ASL A
#_01874B: ASL A
#_01874C: ASL A
#_01874D: ASL A
#_01874E: ASL A
#_01874F: TAY
#_018750: LDA.w #$000B
#_018753: LDX.w #$001A
#_018756: JSR routine018AA7
#_018759: JSL AddSelfAsVectorAndMakeSpace

.branch01875D
#_01875D: LDA.w $071C
#_018760: INC A
#_018761: INC A
#_018762: CMP.w #$0006
#_018765: BCC .branch018731

#_018767: RTS

;===================================================================================================

routine018768:
#_018768: PHP
#_018769: REP #$30
#_01876B: LDA.w #$0005 ; SFX 05
#_01876E: JSL Write_to_APU_transferrable
#_018772: LDX.w #$0001
#_018775: LDA.w $1002
#_018778: BIT.w #$F678
#_01877B: BNE .branch018798

#_01877D: LDA.w #$0002
#_018780: JSL CheckGameProgressFlag
#_018784: LDX.w #$0002
#_018787: BCS .branch018798

#_018789: JSL GetCurrentRoomFloorAndDungeonID
#_01878D: LDA.w $045A
#_018790: AND.w #$0080
#_018793: BEQ .branch0187A0

#_018795: LDX.w #$0003

.branch018798
#_018798: TXA
#_018799: JSL DisplayActionMessage
#_01879D: PLP
#_01879E: SEC
#_01879F: RTL

;---------------------------------------------------------------------------------------------------

.branch0187A0
#_0187A0: STZ.w $06E0

.branch0187A3
#_0187A3: LDA.w #$0000
#_0187A6: JSL DisplaySystemMessage
#_0187AA: STZ.w $0715
#_0187AD: STZ.w $0690

.branch0187B0
#_0187B0: SEP #$20
#_0187B2: LDA.w $0690
#_0187B5: CLC
#_0187B6: ADC.b #$02
#_0187B8: JSL routine00BA70

#_0187BC: REP #$20
#_0187BE: LDA.w $0690
#_0187C1: TAX
#_0187C2: CLC
#_0187C3: ADC.w #$0001
#_0187C6: TAY
#_0187C7: LDA.l data01885A,X
#_0187CB: AND.w #$00FF
#_0187CE: JSR routine01818A
#_0187D1: INC.w $0690
#_0187D4: LDA.w #$0002
#_0187D7: JSL CheckGameProgressFlag
#_0187DB: BCS .branch0187FB

#_0187DD: LDA.w $0690
#_0187E0: CMP.w #$0002
#_0187E3: BCC .branch0187B0

#_0187E5: CMP.w #$0003
#_0187E8: BCS .branch0187FB

#_0187EA: LDA.w #$0001
#_0187ED: JSL CheckGameProgressFlag
#_0187F1: BCS .branch0187FB

#_0187F3: LDA.w $0690
#_0187F6: CMP.w #$0003
#_0187F9: BCC .branch0187B0

.branch0187FB
#_0187FB: SEP #$20
#_0187FD: LDA.w $0690
#_018800: DEC A
#_018801: STA.w $09F1
#_018804: STZ.w $09F0
#_018807: LDA.b #$0B
#_018809: STA.w $09F4
#_01880C: STZ.w $09F2

#_01880F: SEP #$20
#_018811: LDA.w $06E0
#_018814: STA.w $09F3
#_018817: JSL routine02C8E9
#_01881B: LDA.w $09F3
#_01881E: BMI .EXIT_SEC_01884F

#_018820: STA.w $06E0

#_018823: REP #$30
#_018825: AND.w #$00FF
#_018828: STA.w $1058
#_01882B: ASL A
#_01882C: TAX
#_01882D: LDA.l .vectors,X
#_018831: STA.w $0690
#_018834: PHK
#_018835: LDA.w #.return-1
#_018838: PHA
#_018839: JMP ($0690)

.return
#_01883C: BCC .branch018841

#_01883E: JMP .branch0187A3

;---------------------------------------------------------------------------------------------------

.branch018841
#_018841: STA.w $05B4
#_018844: STY.w $05B6
#_018847: STX.w $05B8

#_01884A: REP #$30
#_01884C: PLP
#_01884D: CLC
#_01884E: RTL

.EXIT_SEC_01884F
#_01884F: REP #$30
#_018851: PLP
#_018852: SEC
#_018853: RTL

;---------------------------------------------------------------------------------------------------

.vectors
#_018854: dw routine0196F0
#_018856: dw routine019239
#_018858: dw routine019C06

data01885A:
#_01885A: db $0D,$0A,$0F

;===================================================================================================

routine01885D:
#_01885D: LDA.w $1058
#_018860: ASL A
#_018861: TAX
#_018862: LDA.l .vectors,X
#_018866: STA.w $0690
#_018869: LDA.w $05B4
#_01886C: LDY.w $05B6
#_01886F: LDX.w $05B8
#_018872: JMP ($0690)

.vectors
#_018875: dw routine019842
#_018877: dw routine01943D

;===================================================================================================

routine018879:
#_018879: LDA.w #$0000
#_01887C: JSR DrawStatsTextMaybe018A89
#_01887F: LDX.w $0715
#_018882: LDA.w $100A,X
#_018885: STA.w $0E80
#_018888: STZ.w $0E82
#_01888B: LDY.w #$0006
#_01888E: LDA.w #$010E
#_018891: JSL WriteAmountHEXtoDEC
#_018895: LDA.w #$0001
#_018898: LDX.w #$0000
#_01889B: LDY.w #$0000
#_01889E: JSR routine018AA7
#_0188A1: JSL AddSelfAsVectorAndMakeSpace
#_0188A5: RTS

;===================================================================================================

routine0188A6:
#_0188A6: LDA.w #$0001
#_0188A9: JSR DrawStatsTextMaybe018A89
#_0188AC: LDX.w $0715
#_0188AF: LDA.w $102E,X
#_0188B2: STA.w $0E80
#_0188B5: STZ.w $0E82
#_0188B8: LDY.w #$0006
#_0188BB: LDA.w #$010E
#_0188BE: JSL WriteAmountHEXtoDEC
#_0188C2: LDA.w #$0098
#_0188C5: ORA.w $0EFB
#_0188C8: STA.w $0114
#_0188CB: LDX.w $0715
#_0188CE: LDA.w $1030,X
#_0188D1: STA.w $0E80
#_0188D4: STZ.w $0E82
#_0188D7: LDY.w #$0006
#_0188DA: LDA.w #$0116
#_0188DD: JSL WriteAmountHEXtoDEC
#_0188E1: LDA.w #$0002
#_0188E4: LDX.w #$0040
#_0188E7: LDY.w #$0000
#_0188EA: JSR routine018AA7
#_0188ED: JSL AddSelfAsVectorAndMakeSpace
#_0188F1: RTS

;===================================================================================================

routine0188F2:
#_0188F2: LDA.w #$0002
#_0188F5: JSR DrawStatsTextMaybe018A89
#_0188F8: LDX.w $0715
#_0188FB: LDA.w $1034,X
#_0188FE: BNE .branch018911

#_018900: LDA.w #$0093
#_018903: ORA.w $0EFB
#_018906: STA.w $010E
#_018909: STA.w $0110
#_01890C: STA.w $0112
#_01890F: BRA .branch018924

.branch018911
#_018911: LDA.w $1032,X
#_018914: STA.w $0E80
#_018917: STZ.w $0E82
#_01891A: LDY.w #$0006
#_01891D: LDA.w #$010E
#_018920: JSL WriteAmountHEXtoDEC

.branch018924
#_018924: LDA.w #$0098
#_018927: ORA.w $0EFB
#_01892A: STA.w $0114
#_01892D: LDX.w $0715
#_018930: LDA.w $1034,X
#_018933: BNE .branch018946

#_018935: LDA.w #$0093
#_018938: ORA.w $0EFB
#_01893B: STA.w $0116
#_01893E: STA.w $0118
#_018941: STA.w $011A
#_018944: BRA .branch018956

.branch018946
#_018946: STA.w $0E80
#_018949: STZ.w $0E82
#_01894C: LDY.w #$0006
#_01894F: LDA.w #$0116
#_018952: JSL WriteAmountHEXtoDEC

.branch018956
#_018956: LDA.w #$0002
#_018959: LDX.w #$0040
#_01895C: LDY.w #$0040
#_01895F: JSR routine018AA7
#_018962: JSL AddSelfAsVectorAndMakeSpace
#_018966: RTS

;===================================================================================================

routine018967:
#_018967: LDA.w $0715
#_01896A: JSL routine00A5EB
#_01896E: LDA.w #$0005
#_018971: JSR DrawStatsTextMaybe018A89
#_018974: LDA.w #$00CF
#_018977: ORA.w $0EFB
#_01897A: STA.w $010E
#_01897D: LDX.w #$0000

.next
#_018980: LDA.w $0118,X
#_018983: STA.w $0110,X
#_018986: INX
#_018987: INX
#_018988: CPX.w #$000C
#_01898B: BCC .next

#_01898D: LDA.w #$0002
#_018990: LDX.w #$0040
#_018993: LDY.w #$0100
#_018996: JSR routine018AA7
#_018999: JSL AddSelfAsVectorAndMakeSpace
#_01899D: RTS

;===================================================================================================

routine01899E:
#_01899E: STA.w $071C
#_0189A1: CLC
#_0189A2: ADC.w #$0006
#_0189A5: JSR DrawStatsTextMaybe018A89
#_0189A8: LDA.w $071C
#_0189AB: CLC
#_0189AC: ADC.w #$0028
#_0189AF: ASL A
#_0189B0: ASL A
#_0189B1: TAX

#_0189B2: SEP #$30
#_0189B4: LDY.b #$00

.next
#_0189B6: LDA.l StatsScreenWords,X
#_0189BA: STA.w $0122,Y
#_0189BD: LDA.w $0EFC
#_0189C0: STA.w $0123,Y
#_0189C3: INX
#_0189C4: INY
#_0189C5: INY
#_0189C6: CPY.b #$08
#_0189C8: BCC .next

#_0189CA: REP #$30
#_0189CC: LDA.w $071C
#_0189CF: ASL A
#_0189D0: CLC
#_0189D1: ADC.w $0715
#_0189D4: TAX
#_0189D5: LDA.w $1042,X
#_0189D8: BPL .branch0189DD

#_0189DA: LDA.w #$0100

.branch0189DD
#_0189DD: LDY.w #$0008
#_0189E0: LDX.w #$0024
#_0189E3: JSL GetItemName
#_0189E7: LDA.w $071C
#_0189EA: ASL A
#_0189EB: ASL A
#_0189EC: ASL A
#_0189ED: ASL A
#_0189EE: ASL A
#_0189EF: ASL A
#_0189F0: TAY
#_0189F1: LDA.w #$0003
#_0189F4: LDX.w #$001C
#_0189F7: JSR routine018AA7
#_0189FA: JSL AddSelfAsVectorAndMakeSpace
#_0189FE: RTS

;===================================================================================================

routine0189FF:
#_0189FF: STA.w $071C
#_018A02: CLC
#_018A03: ADC.w #$000D
#_018A06: JSR DrawStatsTextMaybe018A89
#_018A09: LDA.w $071C
#_018A0C: CLC
#_018A0D: ADC.w #$0013
#_018A10: ASL A
#_018A11: ASL A
#_018A12: TAX

#_018A13: SEP #$30
#_018A15: LDY.b #$00

.branch018A17
#_018A17: LDA.l StatsScreenWords,X
#_018A1B: STA.w $010E,Y
#_018A1E: LDA.w $0EFC
#_018A21: STA.w $010F,Y
#_018A24: INX
#_018A25: INY
#_018A26: INY
#_018A27: CPY.b #$08
#_018A29: BCC .branch018A17

#_018A2B: REP #$30
#_018A2D: LDA.w $071C
#_018A30: CMP.w #$0002
#_018A33: BCS .branch018A56

#_018A35: LDX.w $0715
#_018A38: CPX.w #$0180
#_018A3B: BCS .branch018A56

#_018A3D: ASL A
#_018A3E: CLC
#_018A3F: ADC.w $0715
#_018A42: TAX
#_018A43: LDA.w $101E,X
#_018A46: STA.w $0E80
#_018A49: STZ.w $0E82
#_018A4C: LDY.w #$0006
#_018A4F: LDA.w #$0110
#_018A52: JSL WriteAmountHEXtoDEC

.branch018A56
#_018A56: LDA.w $071C
#_018A59: ASL A
#_018A5A: CLC
#_018A5B: ADC.w $0715
#_018A5E: TAX
#_018A5F: LDA.w $1022,X
#_018A62: STA.w $0E80
#_018A65: STZ.w $0E82
#_018A68: LDY.w #$0008
#_018A6B: LDA.w #$0116
#_018A6E: JSL WriteAmountHEXtoDEC
#_018A72: LDA.w $071C
#_018A75: ASL A
#_018A76: ASL A
#_018A77: ASL A
#_018A78: ASL A
#_018A79: ASL A
#_018A7A: TAY
#_018A7B: LDA.w #$0005
#_018A7E: LDX.w #$0000
#_018A81: JSR routine018AA7
#_018A84: JSL AddSelfAsVectorAndMakeSpace
#_018A88: RTS

;===================================================================================================

DrawStatsTextMaybe018A89:
#_018A89: ASL A
#_018A8A: ASL A
#_018A8B: TAX

#_018A8C: SEP #$30
#_018A8E: LDY.b #$00

.nextchar
#_018A90: LDA.l StatsScreenWords,X
#_018A94: STA.w $0106,Y
#_018A97: LDA.w $0EFC
#_018A9A: STA.w $0107,Y
#_018A9D: INX
#_018A9E: INY
#_018A9F: INY
#_018AA0: CPY.b #$08
#_018AA2: BCC .nextchar

#_018AA4: REP #$30
#_018AA6: RTS

;===================================================================================================

; TODO organize and this is dma related
routine018AA7:
#_018AA7: PHB
#_018AA8: PHK
#_018AA9: PLB
#_018AAA: PHY
#_018AAB: ASL A
#_018AAC: ASL A
#_018AAD: ASL A
#_018AAE: TAY
#_018AAF: PLA
#_018AB0: PHA
#_018AB1: CLC
#_018AB2: ADC.w data018AD0,Y
#_018AB5: STA.w $0102
#_018AB8: PLA
#_018AB9: ADC.w data018AD2,Y
#_018ABC: STA.w $0102,X
#_018ABF: LDA.w data018AD4,Y
#_018AC2: STA.w $0104
#_018AC5: STA.w $0104,X
#_018AC8: LDA.w data018AD6,Y
#_018ACB: STA.w $0100
#_018ACE: PLB
#_018ACF: RTS

data018AD0:
#_018AD0: dw $3C43

data018AD2:
#_018AD2: dw $3C23

data018AD4:
#_018AD4: dw $0008

data018AD6:
#_018AD6: dw $0002,$3C83,$3C83,$0007
#_018ADE: dw $0001,$3CC3,$3CAA,$000B
#_018AE6: dw $0001,$3C50,$3C30,$000C
#_018AEE: dw $0002,$3E16,$3DFA,$0007
#_018AF6: dw $0002,$3E30,$3E30,$000C
#_018AFE: dw $0001,$3F03,$3F03,$0006
#_018B06: dw $0001,$3C4F,$3C2F,$0008
#_018B0E: dw $0002,$3C70,$3C70,$0007
#_018B16: dw $0001,$3C90,$3C90,$000B
#_018B1E: dw $0001,$3D10,$3D10,$0006
#_018B26: dw $0001,$3E23,$3E03,$000B
#_018B2E: dw $0002

;===================================================================================================

routine018B30:
#_018B30: STA.w $071C
#_018B33: CLC
#_018B34: ADC.w #$0019
#_018B37: JSR DrawStatsTextMaybe018A89
#_018B3A: LDA.w $071C
#_018B3D: ASL A
#_018B3E: CLC
#_018B3F: ADC.w $0715
#_018B42: TAX
#_018B43: LDA.w $1010,X
#_018B46: STA.w $0E80
#_018B49: STZ.w $0E82
#_018B4C: LDY.w #$0004
#_018B4F: LDA.w #$010E
#_018B52: JSL WriteAmountHEXtoDEC
#_018B56: LDA.w $071C
#_018B59: ASL A
#_018B5A: ASL A
#_018B5B: ASL A
#_018B5C: ASL A
#_018B5D: ASL A
#_018B5E: TAY
#_018B5F: LDA.w #$0006
#_018B62: LDX.w #$0000
#_018B65: JSR routine018AA7
#_018B68: JSL AddSelfAsVectorAndMakeSpace
#_018B6C: LDA.w $071C
#_018B6F: ASL A
#_018B70: CLC
#_018B71: ADC.w $0715
#_018B74: TAX
#_018B75: CPX.w #$0180
#_018B78: BCC .branch018B82

#_018B7A: STZ.w $071E
#_018B7D: LDA.w $1010,X
#_018B80: BRA .branch018B8F

;---------------------------------------------------------------------------------------------------

.branch018B82
#_018B82: LDA.w $1036,X
#_018B85: STA.w $071E
#_018B88: LDA.w $1010,X
#_018B8B: SEC
#_018B8C: SBC.w $1036,X

.branch018B8F
#_018B8F: LDX.w #$0000
#_018B92: LSR A
#_018B93: TAY
#_018B94: BEQ .branch018BAE

#_018B96: BCC .branch018B99

#_018B98: INC A

.branch018B99
#_018B99: STA.w $0104
#_018B9C: LDA.w #$14C1

.branch018B9F
#_018B9F: STA.w $0106,X
#_018BA2: INX
#_018BA3: INX
#_018BA4: DEY
#_018BA5: BNE .branch018B9F

#_018BA7: TXA
#_018BA8: LSR A
#_018BA9: CMP.w $0104
#_018BAC: BEQ .branch018BC1

.branch018BAE
#_018BAE: LDA.w #$14C5
#_018BB1: LDY.w $071E
#_018BB4: BEQ .branch018BBC

#_018BB6: LDA.w #$14C4
#_018BB9: DEC.w $071E

.branch018BBC
#_018BBC: STA.w $0106,X
#_018BBF: INX
#_018BC0: INX

.branch018BC1
#_018BC1: CPX.w #$0028
#_018BC4: BCS .branch018BFE

#_018BC6: LDA.w $071E
#_018BC9: BEQ .branch018BF9

#_018BCB: LSR A
#_018BCC: TAY

#_018BCD: BCC .branch018BD0

#_018BCF: INC A

.branch018BD0
#_018BD0: CLC
#_018BD1: ADC.w $0104
#_018BD4: STA.w $0104
#_018BD7: TYA
#_018BD8: BEQ .branch018BEC

#_018BDA: LDA.w #$14C2

.branch018BDD
#_018BDD: STA.w $0106,X
#_018BE0: INX
#_018BE1: INX
#_018BE2: DEY
#_018BE3: BNE .branch018BDD

#_018BE5: TXA
#_018BE6: LSR A
#_018BE7: CMP.w $0104
#_018BEA: BEQ .branch018BF9

.branch018BEC
#_018BEC: LDA.w #$14C6

.branch018BEF
#_018BEF: STA.w $0106,X
#_018BF2: INX
#_018BF3: INX
#_018BF4: CPX.w #$0028
#_018BF7: BCS .branch018BFE

.branch018BF9
#_018BF9: LDA.w #$14C3
#_018BFC: BRA .branch018BEF

;---------------------------------------------------------------------------------------------------

.branch018BFE
#_018BFE: LDA.w $071C
#_018C01: ASL A
#_018C02: ASL A
#_018C03: ASL A
#_018C04: ASL A
#_018C05: ASL A
#_018C06: CLC
#_018C07: ADC.w #$0006
#_018C0A: TAY
#_018C0B: LDA.w #$0006
#_018C0E: LDX.w #$0000
#_018C11: JSR routine018AA7
#_018C14: LDA.w $0102
#_018C17: SEC
#_018C18: SBC.w #$03E0
#_018C1B: STA.w $0102
#_018C1E: LDA.w #$0014
#_018C21: STA.w $0104
#_018C24: JSL AddSelfAsVectorAndMakeSpace
#_018C28: RTS

;===================================================================================================

Module_DistributeStatPoints:
#_018C29: LDA.w $0578
#_018C2C: STA.w $0760
#_018C2F: BEQ .configure_distribution

#_018C31: JSR WriteStatPointsLeftMaybe018E52

#_018C34: LDY.w #$0000
#_018C37: LDX.w $0715

.copy
#_018C3A: LDA.w $1010,X ; copies stats
#_018C3D: STA.w $0764,Y
#_018C40: LDA.w $1036,X ; copies stat bonuses
#_018C43: STA.w $0770,Y
#_018C46: INX
#_018C47: INX
#_018C48: INY
#_018C49: INY
#_018C4A: CPY.w #$000C
#_018C4D: BCC .copy

.configure_distribution
#_018C4F: LDA.w #$3F03
#_018C52: LDY.w #$0005
#_018C55: LDX.w #$D406
#_018C58: STA.w $0E8C
#_018C5B: STY.w $0EA8
#_018C5E: STY.w $0EB6
#_018C61: STX.w $0EC4
#_018C64: LDA.w #$0000
#_018C67: STA.w $0E9A
#_018C6A: LDA.w #$1C00
#_018C6D: STA.w $0EFB

.check_points_and_reset
#_018C70: LDA.w $0578
#_018C73: BEQ .branch018C79

#_018C75: JSL PrepCursorMovementDMA

.reset_timer
#_018C79: LDA.w #$0006
#_018C7C: STA.w $0E8A

.next_frame
#_018C7F: JSL AddSelfAsVector
#_018C83: DEC.w $0E8A

; TODO why is this here?
; can we only do stuff every 6 frames?
#_018C86: BNE .skip_debug

#_018C88: LDA.w $0F2D
#_018C8B: AND.w #$8080
#_018C8E: STA.w $0F2D
#_018C91: BRA .reset_timer

.skip_debug
#_018C93: LDA.w $0578
#_018C96: BEQ .try_to_distribute

#_018C98: LDA.w $0760
#_018C9B: BNE .try_to_distribute

#_018C9D: JMP .out_of_points

.try_to_distribute
#_018CA0: LDX.w $0578
#_018CA3: BNE .points_remaining

#_018CA5: LDA.w $0F2B
#_018CA8: BIT.w #$FFFF ; check for input
#_018CAB: BEQ .next_frame

#_018CAD: JMP .branch018D9C

.points_remaining
#_018CB0: LDA.w $0F2B
#_018CB3: BIT.w #$8F80 ; check for ABudlr
#_018CB6: BEQ .next_frame ; no input

 ; blip when moving
#_018CB8: LDA.w #$0001 ; SFX 01
#_018CBB: JSL Write_to_APU_transferrable

#_018CBF: LDA.w $0F2B
#_018CC2: BIT.w #$0C00 ; check for UP/DOWN
#_018CC5: BEQ .pressed_Left_or_Right

.pressed_Up_or_Down
#_018CC7: LDX.w $0E9A ; take current position
#_018CCA: STX.w $0EB6 ; save it here i guess
#_018CCD: BIT.w #$0400 ; check for down
#_018CD0: BNE .pressed_down

.pressed_up
#_018CD2: DEC.w $0E9A
#_018CD5: BPL .check_points_and_reset

.wrap_position_up
#_018CD7: LDA.w $0EA8
#_018CDA: STA.w $0E9A

#_018CDD: BRA .check_points_and_reset

.pressed_down
#_018CDF: INC.w $0E9A
#_018CE2: LDA.w $0E9A
#_018CE5: CMP.w $0EA8
#_018CE8: BCC .check_points_and_reset

#_018CEA: BEQ .check_points_and_reset

.wrap_position_down
#_018CEC: STZ.w $0E9A
#_018CEF: JMP .check_points_and_reset

.pressed_Left_or_Right
#_018CF2: PHA

; turn position in menu into an offset for stats
#_018CF3: LDA.w $0E9A
#_018CF6: ASL A
#_018CF7: TAY
#_018CF8: CLC
#_018CF9: ADC.w $0715
#_018CFC: TAX

#_018CFD: PLA
#_018CFE: BIT.w #$8200 ; check for Left / B
#_018D01: BNE .pressed_left_or_B

.pressed_right_or_A
; load stat and make sure it doesn't go too high
#_018D03: LDA.w $1010,X
#_018D06: SEC
#_018D07: SBC.w $1036,X
#_018D0A: INC A
#_018D0B: CMP.w #41 ; max is 40
#_018D0E: BCC .can_add_points

#_018D10: JMP .check_points_and_reset ; ignore if too high

.can_add_points
#_018D13: CLC
#_018D14: ADC.w $1036,X
#_018D17: CMP.w #41 ; cummulative of stat and bonus can't be 41+ either
#_018D1A: BCC .cummulative_not_too_high

#_018D1C: DEC.w $1036,X ; lose some bonus points
#_018D1F: LDA.w #40

.cummulative_not_too_high
#_018D22: STA.w $1010,X
#_018D25: DEC.w $0760 ; lose distributable points

#_018D28: LDA.w $0578
#_018D2B: BNE .update_added_stats

; this module must be used for level up as well
#_018D2D: LDX.w $0715 ; increment level if we had 0?
#_018D30: INC.w $100A,X
#_018D33: BRA .update_added_stats

.pressed_left_or_B
#_018D35: LDA.w $1010,X
#_018D38: DEC A
#_018D39: BNE .didnt_drop_to_zero

#_018D3B: JMP .check_points_and_reset

.didnt_drop_to_zero
; check against the current level of stat
#_018D3E: CMP.w $0764,Y
#_018D41: BCS .didnt_drop_below_current

#_018D43: JMP .check_points_and_reset

.didnt_drop_below_current
#_018D46: STA.w $1010,X
#_018D49: LDA.w $1036,X
#_018D4C: CMP.w $0770,Y

#_018D4F: BCS .dec_bonus_fine

#_018D51: INC.w $1036,X

.dec_bonus_fine
#_018D54: INC.w $0760 ; add back distributable points

.update_added_stats
#_018D57: LDX.w $0715
#_018D5A: JSL UpdatePlayerStats

; restore HP and MP
#_018D5E: LDA.w $1030,X
#_018D61: STA.w $102E,X
#_018D64: LDA.w $1034,X
#_018D67: STA.w $1032,X
#_018D6A: LDA.w #$0000
#_018D6D: STA.w $0EFB
#_018D70: JSR routine0188A6
#_018D73: JSR routine0188F2
#_018D76: LDA.w #$0000

.branch018D79
#_018D79: JSR routine0189FF
#_018D7C: LDA.w $071C
#_018D7F: INC A
#_018D80: CMP.w #$0006
#_018D83: BCC .branch018D79

#_018D85: LDA.w $0578
#_018D88: BEQ .branch018D8D

#_018D8A: JSR WriteStatPointsLeftMaybe018E52

.branch018D8D
#_018D8D: LDA.w #$1C00
#_018D90: STA.w $0EFB
#_018D93: LDA.w $0E9A
#_018D96: JSR routine018B30
#_018D99: JMP .branch018C79

.branch018D9C
#_018D9C: LDA.w $0F2B
#_018D9F: BIT.w #$8000
#_018DA2: BNE .stat_updates_finished

#_018DA4: LDA.w #$0002 ; SFX 02
#_018DA7: JSL Write_to_APU_transferrable
#_018DAB: LDX.w $0715
#_018DAE: BNE .branch018DB7

#_018DB0: JSR routine01AF11
#_018DB3: BCS .stat_updates_finished

#_018DB5: BRA .branch018DBC

.branch018DB7
#_018DB7: JSR routine01B010
#_018DBA: BCS .stat_updates_finished

.branch018DBC
#_018DBC: JMP .next_frame

;---------------------------------------------------------------------------------------------------

.stat_updates_finished
#_018DBF: LDA.w #$0003 ; SFX 03
#_018DC2: JSL Write_to_APU_transferrable
#_018DC6: RTS

;---------------------------------------------------------------------------------------------------

.out_of_points
#_018DC7: JSL Write7C46VRAM
#_018DCB: LDA.w #$000E
#_018DCE: JSL RunOpenMenuDMA_X
#_018DD2: LDA.w #$1C00
#_018DD5: STA.w $0EFB
#_018DD8: LDA.w #$3E83
#_018DDB: LDY.w #$0001
#_018DDE: LDX.w #$5403
#_018DE1: JSL WaitForMenuChoice_A

#_018DE5: LDA.w $0E9A
#_018DE8: BEQ .stat_updates_finished

.reset_stats
#_018DEA: JSL Write7C46VRAM
#_018DEE: LDY.w #$0000
#_018DF1: LDX.w $0715

.reload_original_stats
#_018DF4: LDA.w $0764,Y
#_018DF7: STA.w $1010,X
#_018DFA: LDA.w $0770,Y
#_018DFD: STA.w $1036,X
#_018E00: INX
#_018E01: INX
#_018E02: INY
#_018E03: INY
#_018E04: CPY.w #$000C
#_018E07: BCC .reload_original_stats

#_018E09: LDX.w $0715
#_018E0C: JSL UpdatePlayerStats
#_018E10: LDA.w $1030,X
#_018E13: STA.w $102E,X
#_018E16: LDA.w $1034,X
#_018E19: STA.w $1032,X
#_018E1C: LDA.w #$0000
#_018E1F: STA.w $0EFB
#_018E22: JSR routine0188A6
#_018E25: JSR routine0188F2
#_018E28: LDA.w #$0000

.branch018E28
#_018E2B: JSR routine0189FF
#_018E2E: LDA.w $071C
#_018E31: INC A
#_018E32: CMP.w #$0006
#_018E35: BCC .branch018E28

#_018E37: LDA.w #$0000

.branch018E3A
#_018E3A: JSR routine018B30
#_018E3D: LDA.w $071C
#_018E40: INC A
#_018E41: CMP.w #$0006
#_018E44: BCC .branch018E3A

#_018E46: LDA.w $0578
#_018E49: STA.w $0760
#_018E4C: JSR WriteStatPointsLeftMaybe018E52
#_018E4F: JMP .configure_distribution

;===================================================================================================

WriteStatPointsLeftMaybe018E52:
#_018E52: LDA.w #$002F ; probably the word "STATS" in japanese
#_018E55: JSR DrawStatsTextMaybe018A89
#_018E58: LDA.w $0760
#_018E5B: STA.w $0E80
#_018E5E: STZ.w $0E82
#_018E61: LDY.w #$0006 ; 2 characters, ugly way of inputting this
#_018E64: LDA.w #$010E ; writing to $010E
#_018E67: JSL WriteAmountHEXtoDEC

#_018E6B: SEP #$30
#_018E6D: LDX.b #$C0
#_018E6F: LDY.b #$00

; seems to be "LEFT" in japanese as in "18 left" or whatever
.nextcharacter
#_018E71: LDA.l StatsScreenWords,X
#_018E75: STA.w $0114,Y
#_018E78: LDA.w $0EFC
#_018E7B: STA.w $0115,Y
#_018E7E: INX
#_018E7F: INY
#_018E80: INY
#_018E81: CPY.b #$08
#_018E83: BCC .nextcharacter

#_018E85: LDA.b #$9F
#_018E87: STA.w $0120
#_018E8A: LDA.w $0EFC
#_018E8D: STA.w $0121

#_018E90: REP #$30
#_018E92: LDA.w #$0002
#_018E95: LDX.w #$001A
#_018E98: LDY.w #$0180
#_018E9B: JSR routine018AA7
#_018E9E: LDA.w #$0001
#_018EA1: STA.w $0104,X
#_018EA4: LDA.w #$0002
#_018EA7: STA.w $0100
#_018EAA: JSL AddSelfAsVectorAndMakeSpace
#_018EAE: RTS

;===================================================================================================

routine018EAF:
#_018EAF: PHP
#_018EB0: SEP #$30
#_018EB2: LDA.b #$04
#_018EB4: LDX.b #$00
#_018EB6: LDY.b #$01
#_018EB8: JSL GraduallyFadeStuff
#_018EBC: LDA.b #$0C
#_018EBE: JSL PrepHDMAtypeFromA
#_018EC2: LDA.b #$01
#_018EC4: STA.w $0F80
#_018EC7: LDA.b #$00
#_018EC9: STA.w $0F81

#_018ECC: REP #$30
#_018ECE: LDA.w #$0000

.branch018ED1
#_018ED1: STA.w $071E
#_018ED4: LDA.w #$000C
#_018ED7: JSL OpenMenuDMA
#_018EDB: LDA.w $071E
#_018EDE: ASL A
#_018EDF: ASL A
#_018EE0: ASL A
#_018EE1: ASL A
#_018EE2: ASL A
#_018EE3: CLC
#_018EE4: ADC.w $0102
#_018EE7: STA.w $0102
#_018EEA: JSL AddSelfAsVector

#_018EEE: SEP #$20
#_018EF0: LDA.w $0F81
#_018EF3: CLC
#_018EF4: ADC.b #$08
#_018EF6: CMP.b #$58
#_018EF8: BCC .branch018F01

#_018EFA: LDA.b #$FF
#_018EFC: STA.w $0F7F
#_018EFF: LDA.b #$60

.branch018F01
#_018F01: STA.w $0F81

#_018F04: REP #$30
#_018F06: LDA.w $071E
#_018F09: INC A
#_018F0A: CMP.w #$000D
#_018F0D: BCC .branch018ED1

#_018F0F: PLP
#_018F10: RTL

;===================================================================================================

routine018F11:
#_018F11: PHP
#_018F12: REP #$30
#_018F14: LDA.w #$3800
#_018F17: STA.w $0F07
#_018F1A: JSL Zero2KBinVRAM_setup
#_018F1E: JSL AddSelfAsVector

#_018F22: SEP #$30
#_018F24: LDA.b #$00
#_018F26: STA.w $0F7F

#_018F29: REP #$30
#_018F2B: LDA.w #$000D

.branch018F2E
#_018F2E: STA.w $071E
#_018F31: LDA.w #$000D
#_018F34: JSL OpenMenuDMA
#_018F38: LDA.w $071E
#_018F3B: ASL A
#_018F3C: ASL A
#_018F3D: ASL A
#_018F3E: ASL A
#_018F3F: ASL A
#_018F40: CLC
#_018F41: ADC.w $0102
#_018F44: STA.w $0102

#_018F47: SEP #$20
#_018F49: LDA.w $0F81
#_018F4C: SEC
#_018F4D: SBC.b #$08
#_018F4F: STA.w $0F81
#_018F52: JSL AddSelfAsVector

#_018F56: REP #$30
#_018F58: LDA.w $071E
#_018F5B: DEC A
#_018F5C: BNE .branch018F2E

#_018F5E: LDA.w #$3C00
#_018F61: STA.w $0F07

#_018F64: SEP #$30
#_018F66: LDA.b #$1C
#_018F68: JSL SomeOtherDMAsFromE80
#_018F6C: LDA.b #$02
#_018F6E: JSL InitializeTextBoxToSizeForNewMessage
#_018F72: LDA.b #$00
#_018F74: STA.w $0F80
#_018F77: LDA.b #$00
#_018F79: STA.w $0F81
#_018F7C: LDA.b #$04
#_018F7E: LDX.b #$00
#_018F80: LDY.b #$01
#_018F82: JSL routine0091A1
#_018F86: PLP
#_018F87: RTL

;===================================================================================================

routine018F88:
#_018F88: REP #$30
#_018F8A: LDY.w #$0000
#_018F8D: STZ.w $0690

.branch018F90
#_018F90: LDX.w $0700,Y
#_018F93: BMI .branch018FA7

#_018F95: LDA.w $1002,X
#_018F98: AND.w #$E000
#_018F9B: BNE .branch018FA0

#_018F9D: INC.w $0690

.branch018FA0
#_018FA0: INY
#_018FA1: INY
#_018FA2: CPY.w #$000C
#_018FA5: BCC .branch018F90

.branch018FA7
#_018FA7: LDA.w $0690
#_018FAA: DEC A

#_018FAB: SEP #$30
#_018FAD: STA.w $09F1
#_018FB0: STZ.w $09F0
#_018FB3: LDA.b #$0A
#_018FB5: STA.w $09F4
#_018FB8: STZ.w $09F2
#_018FBB: STZ.w $09F3
#_018FBE: RTS

;===================================================================================================

routine018FBF:
#_018FBF: JSL routine02C8E9
#_018FC3: LDA.w $09F3
#_018FC6: BMI .branch018FCF

#_018FC8: REP #$30
#_018FCA: AND.w #$00FF
#_018FCD: CLC
#_018FCE: RTS

.branch018FCF
#_018FCF: REP #$30
#_018FD1: SEC
#_018FD2: RTS

;===================================================================================================

; TODO demon costs
routine018FD3:
#_018FD3: PHA
#_018FD4: JSL routine00A3EE
#_018FD8: LDA.w $0690
#_018FDB: CLC
#_018FDC: ADC.w #$0002
#_018FDF: JSL routine00BA70
#_018FE3: LDA.w $0690
#_018FE6: ASL A
#_018FE7: ASL A
#_018FE8: ASL A
#_018FE9: ASL A
#_018FEA: ASL A
#_018FEB: ASL A
#_018FEC: CLC
#_018FED: ADC.w #$3E05
#_018FF0: STA.w $0102
#_018FF3: SEC
#_018FF4: SBC.w #$0020
#_018FF7: STA.w $0126
#_018FFA: LDA.w #$0002
#_018FFD: STA.w $0100
#_019000: JSL AddSelfAsVector
#_019004: PLX
#_019005: LDA.w $100A,X
#_019008: ASL A
#_019009: ASL A
#_01900A: ASL A
#_01900B: ASL A
#_01900C: ASL A
#_01900D: STA.w $0E80
#_019010: STZ.w $0E82
#_019013: LDA.w $0690
#_019016: ASL A
#_019017: ASL A
#_019018: ASL A
#_019019: ASL A
#_01901A: ASL A
#_01901B: ASL A
#_01901C: CLC
#_01901D: ADC.w #$3E17
#_019020: LDY.w #$0004
#_019023: JSL routine008F11
#_019027: RTS

;===================================================================================================

routine019028:
#_019028: JSL routine00A4FE
#_01902C: LDA.w $0690
#_01902F: CLC
#_019030: ADC.w #$0002
#_019033: JSL routine00BA70
#_019037: LDA.w $0690
#_01903A: ASL A
#_01903B: ASL A
#_01903C: ASL A
#_01903D: ASL A
#_01903E: ASL A
#_01903F: ASL A
#_019040: CLC
#_019041: ADC.w #$3E05
#_019044: STA.w $0102
#_019047: SEC
#_019048: SBC.w #$0020
#_01904B: STA.w $0134
#_01904E: LDA.w #$0002
#_019051: STA.w $0100
#_019054: JSL AddSelfAsVector
#_019058: RTS

;===================================================================================================

routine019059:
#_019059: JSL routine00A45E
#_01905D: LDA.w $0690
#_019060: CLC
#_019061: ADC.w #$0002
#_019064: JSL routine00BA70
#_019068: LDA.w $0690
#_01906B: ASL A
#_01906C: ASL A
#_01906D: ASL A
#_01906E: ASL A
#_01906F: ASL A
#_019070: ASL A
#_019071: CLC
#_019072: ADC.w #$3E07
#_019075: STA.w $0102
#_019078: SEC
#_019079: SBC.w #$0020
#_01907C: STA.w $012E
#_01907F: LDA.w #$0002
#_019082: STA.w $0100
#_019085: JSL AddSelfAsVector
#_019089: RTS

;===================================================================================================

routine01908A:
#_01908A: TAY
#_01908B: ASL A
#_01908C: ASL A
#_01908D: ASL A
#_01908E: ASL A
#_01908F: ASL A
#_019090: CLC
#_019091: ADC.w #$3E04
#_019094: STA.w $0102
#_019097: LDA.w $0770,Y
#_01909A: LDY.w #$0000
#_01909D: LDX.w #$2095

.branch0190A0
#_0190A0: CMP.w #$FFFF
#_0190A3: BEQ .branch0190C7

#_0190A5: CMP.w $0764,Y
#_0190A8: BEQ .branch0190B3

#_0190AA: INY
#_0190AB: INY
#_0190AC: CPY.w #$000C
#_0190AF: BCC .branch0190A0

#_0190B1: BCS .branch0190C7

.branch0190B3
#_0190B3: LDX.w #$20CF
#_0190B6: LDA.w $0760
#_0190B9: LSR A
#_0190BA: CLC
#_0190BB: ADC.w #$2002
#_0190BE: CMP.w #$2005
#_0190C1: BCS .branch0190C7

#_0190C3: TAX
#_0190C4: LDA.w #$20CF

.branch0190C7
#_0190C7: STX.w $0106
#_0190CA: CPX.w #$2095
#_0190CD: BNE .branch0190D2

#_0190CF: LDA.w #$20CF

.branch0190D2
#_0190D2: STA.w $0108
#_0190D5: LDA.w #$0002
#_0190D8: STA.w $0104
#_0190DB: LDA.w #$0001
#_0190DE: STA.w $0100
#_0190E1: JSL AddSelfAsVector
#_0190E5: RTS

;===================================================================================================

routine0190E6:
#_0190E6: PHP

.branch0190E7
#_0190E7: REP #$30
#_0190E9: LDA.w #$0002
#_0190EC: JSL routine00BAC0
#_0190F0: JSR routine01AABB
#_0190F3: STZ.w $0690

.branch0190F6
#_0190F6: LDA.w $0688
#_0190F9: BEQ .branch019106

#_0190FB: TAX
#_0190FC: LDA.w #$0000

.branch0190FF
#_0190FF: CLC
#_019100: ADC.w #$0006
#_019103: DEX
#_019104: BNE .branch0190FF

.branch019106
#_019106: CLC
#_019107: ADC.w $0690
#_01910A: ASL A
#_01910B: TAY
#_01910C: LDA.w $06A0,Y
#_01910F: BMI .branch01911F

#_019111: JSR routine019028
#_019114: INC.w $0690
#_019117: LDA.w $0690
#_01911A: CMP.w #$0006
#_01911D: BCC .branch0190F6

.branch01911F
#_01911F: LDA.w $0690
#_019122: DEC A
#_019123: JSR routine0191C9

.branch019126
#_019126: SEP #$20
#_019128: JSL routine02C8E9
#_01912C: LDA.w $09F8
#_01912F: AND.b #$3F
#_019131: BNE .branch01913E

#_019133: LDA.w $09F3
#_019136: BPL .branch01913B

#_019138: PLP
#_019139: SEC
#_01913A: RTL

.branch01913B
#_01913B: PLP
#_01913C: CLC
#_01913D: RTL

.branch01913E
#_01913E: LDA.w $09F3
#_019141: BPL .branch019190

#_019143: LDA.w $09F1
#_019146: STA.w $09F3

#_019149: REP #$20
#_01914B: DEC.w $0688
#_01914E: BPL .branch01916A

#_019150: LDA.w #$0002
#_019153: LDX.w $068A
#_019156: CPX.w #$000D
#_019159: BCS .branch019162

#_01915B: DEC A
#_01915C: CPX.w #$0007
#_01915F: BCS .branch019162

#_019161: DEC A

.branch019162
#_019162: STA.w $0688
#_019165: CMP.w #$0000
#_019168: BEQ .branch019126

.branch01916A
#_01916A: LDA.w #$0005
#_01916D: LDX.w $0688
#_019170: BEQ .branch01918A

#_019172: LDA.w $068A
#_019175: SEC
#_019176: SBC.w #$0007
#_019179: CPX.w #$0001
#_01917C: BEQ .branch019182

#_01917E: SEC
#_01917F: SBC.w #$0006

.branch019182
#_019182: CMP.w #$0006
#_019185: BCC .branch01918A

#_019187: LDA.w #$0005

.branch01918A
#_01918A: STA.w $06E1
#_01918D: JMP .branch0190E7

.branch019190
#_019190: REP #$20
#_019192: LDA.w $068A
#_019195: CMP.w #$0007
#_019198: BCC .branch019126

#_01919A: INC.w $0688
#_01919D: LDA.w $0688
#_0191A0: CMP.w #$0002
#_0191A3: BCC .branch0191B2

#_0191A5: BNE .branch0191AF

#_0191A7: LDX.w $068A
#_0191AA: CPX.w #$000D
#_0191AD: BCS .branch0191B2

.branch0191AF
#_0191AF: STZ.w $0688

.branch0191B2
#_0191B2: STZ.w $06E1
#_0191B5: JMP .branch0190E7

;===================================================================================================
; Used for things like spells and equipment
;===================================================================================================
ClearEntityListBuffer:
#_0191B8: LDY.w #$0000
#_0191BB: LDA.w #$FFFF

.next
#_0191BE: STA.w $06A0,Y
#_0191C1: INY
#_0191C2: INY
#_0191C3: CPY.w #$0040
#_0191C6: BCC .next

#_0191C8: RTL

;===================================================================================================

routine0191C9:
#_0191C9: SEP #$20

#_0191CB: STA.w $09F1
#_0191CE: STZ.w $09F0

#_0191D1: LDA.b #$8B
#_0191D3: STA.w $09F4
#_0191D6: STZ.w $09F2

#_0191D9: LDA.w $06E1
#_0191DC: STA.w $09F3

#_0191DF: RTS

;===================================================================================================

CopyFontIntoWRAM:
#_0191E0: PHP
#_0191E1: REP #$30

#_0191E3: LDA.w #$8000
#_0191E6: STA.w $0090

#_0191E9: LDA.w #$0010
#_0191EC: STA.w $0092

#_0191EF: LDA.w #$C000
#_0191F2: STA.w $0094

#_0191F5: LDA.w #$007F
#_0191F8: STA.w $0096

#_0191FB: LDA.w #$00D0
#_0191FE: STA.w $0476

#_019201: JSL routine009602

#_019205: SEP #$30

#_019207: LDA.b #$08
#_019209: JSL VRAM_From_7FXXXX
#_01920D: JSL AddSelfAsVector

#_019211: PLP
#_019212: RTS

;===================================================================================================

COMP_SummonDemon:
#_019213: JSL routine019239
#_019217: BCS .branch01921D

#_019219: JSL routine01943D

.branch01921D
#_01921D: RTS

;===================================================================================================

COMP_ReturnDemon:
#_01921E: JSL routine0194FE
#_019222: BCS .branch019228

#_019224: JSL routine019581

.branch019228
#_019228: RTS

;===================================================================================================

COMP_DismissDemon:
#_019229: JSL DismissDemon
#_01922D: RTS

;===================================================================================================

COMP_ArrangeParty:
#_01922E: JSL routine0196F0
#_019232: BCS .branch019238

#_019234: JSL routine019842

.branch019238
#_019238: RTS

;===================================================================================================

routine019239:
#_019239: PHP
#_01923A: REP #$30
#_01923C: JSL ClearEntityListBuffer
#_019240: STZ.w $0688
#_019243: JSR routine01936D
#_019246: LDA.w $068A
#_019249: BNE .branch019255

#_01924B: LDA.w #$0019
#_01924E: JSL DisplaySystemMessage
#_019252: PLP
#_019253: SEC
#_019254: RTL

.branch019255
#_019255: REP #$30
#_019257: STZ.w $0680
#_01925A: STZ.w $0682
#_01925D: JSR routine0198AF
#_019260: BCC .branch019284

#_019262: LDA.w $0400
#_019265: AND.w #$0040
#_019268: BEQ .branch019274

#_01926A: LDA.w #$0040
#_01926D: JSL DisplayActionMessage
#_019271: PLP
#_019272: SEC
#_019273: RTL

.branch019274
#_019274: JSL routine01951F
#_019278: BCS .branch0192D5

#_01927A: STX.w $0682
#_01927D: JSL ClearEntityListBuffer
#_019281: JSR routine01936D

.branch019284
#_019284: LDA.w #$0014
#_019287: JSL DisplaySystemMessage
#_01928B: JSR routine0193AF
#_01928E: STZ.w $0690

.branch019291
#_019291: LDA.w $0688
#_019294: BEQ .branch019299

#_019296: LDA.w #$0006

.branch019299
#_019299: CLC
#_01929A: ADC.w $0690
#_01929D: ASL A
#_01929E: TAY
#_01929F: LDA.w $06A0,Y
#_0192A2: BMI .branch0192B2

#_0192A4: JSR routine018FD3
#_0192A7: INC.w $0690
#_0192AA: LDA.w $0690
#_0192AD: CMP.w #$0006
#_0192B0: BCC .branch019291

.branch0192B2
#_0192B2: LDA.w $0690
#_0192B5: DEC A
#_0192B6: JSR routine0191C9

.branch0192B9
#_0192B9: SEP #$20
#_0192BB: JSL routine02C8E9
#_0192BF: LDA.w $09F8
#_0192C2: AND.b #$3F
#_0192C4: BNE .branch0192D8

#_0192C6: LDA.w $09F3
#_0192C9: BPL .branch019322

#_0192CB: REP #$20
#_0192CD: LDA.w $0682
#_0192D0: BEQ .branch0192D5

#_0192D2: JMP .branch019255

.branch0192D5
#_0192D5: PLP
#_0192D6: SEC
#_0192D7: RTL

.branch0192D8
#_0192D8: LDA.w $09F3
#_0192DB: BPL .branch019309

#_0192DD: LDA.w $09F1
#_0192E0: STA.w $09F3

#_0192E3: REP #$20
#_0192E5: LDA.w $068A
#_0192E8: CMP.w #$0007
#_0192EB: BCC .branch0192B9

#_0192ED: LDX.w #$0005
#_0192F0: LDA.w $0688
#_0192F3: EOR.w #$0001
#_0192F6: STA.w $0688
#_0192F9: BEQ .branch019303

#_0192FB: LDA.w $068A
#_0192FE: SEC
#_0192FF: SBC.w #$0007
#_019302: TAX

.branch019303
#_019303: STX.w $06E1
#_019306: JMP .branch019284

.branch019309
#_019309: REP #$20
#_01930B: LDA.w $068A
#_01930E: CMP.w #$0007
#_019311: BCC .branch0192B9

#_019313: LDA.w $0688
#_019316: EOR.w #$0001
#_019319: STA.w $0688
#_01931C: STZ.w $06E1
#_01931F: JMP .branch019284

.branch019322
#_019322: STA.w $06E1

#_019325: REP #$30
#_019327: AND.w #$00FF
#_01932A: LDX.w $0688
#_01932D: BEQ .branch019333

#_01932F: CLC
#_019330: ADC.w #$0006

.branch019333
#_019333: ASL A
#_019334: TAY
#_019335: LDA.w $06A0,Y
#_019338: STA.w $0680
#_01933B: JSR routine0193EE
#_01933E: BCC .branch019343

#_019340: JMP .branch019284

.branch019343
#_019343: LDA.w #$0017
#_019346: JSL DisplaySystemMessage
#_01934A: JSR routine018F88
#_01934D: LDA.w $09F1
#_019350: CMP.b #$05
#_019352: BCS .branch019357

#_019354: INC.w $09F1

.branch019357
#_019357: JSR routine018FBF
#_01935A: BCC .branch01935F

#_01935C: JMP .branch019284

.branch01935F
#_01935F: REP #$30
#_019361: STA.w $0684
#_019364: LDY.w $0682
#_019367: LDX.w $0680
#_01936A: PLP
#_01936B: CLC
#_01936C: RTL

;===================================================================================================

routine01936D:
#_01936D: STZ.w $068A
#_019370: STZ.w $06E1
#_019373: LDX.w #$0180

.branch019376
#_019376: STX.w $0692
#_019379: BIT.w $1000,X
#_01937C: BPL .branch0193A1

#_01937E: BVS .branch0193A1

#_019380: LDA.w $1002,X
#_019383: AND.w #$E000
#_019386: BNE .branch0193A1

#_019388: LDA.w $0400
#_01938B: AND.w #$0040
#_01938E: BEQ .branch019395

#_019390: JSR routine01987B
#_019393: BCS .branch0193A1

.branch019395
#_019395: LDA.w $068A
#_019398: ASL A
#_019399: TAY
#_01939A: TXA
#_01939B: STA.w $06A0,Y
#_01939E: INC.w $068A

.branch0193A1
#_0193A1: LDA.w $0692
#_0193A4: CLC
#_0193A5: ADC.w #$0060
#_0193A8: TAX
#_0193A9: CMP.w #$0600
#_0193AC: BCC .branch019376

#_0193AE: RTS

;===================================================================================================

routine0193AF:
#_0193AF: LDA.w #$205C
#_0193B2: STA.w $0106
#_0193B5: LDA.w #$00EC
#_0193B8: JSL CheckGameProgressFlag
#_0193BC: BCC .branch0193C1

#_0193BE: DEC.w $0106

.branch0193C1
#_0193C1: LDA.w #$3DD4
#_0193C4: STA.w $0102
#_0193C7: LDA.w #$0001
#_0193CA: STA.w $0104
#_0193CD: STA.w $0100
#_0193D0: JSL AddSelfAsVector
#_0193D4: STZ.w $0E88
#_0193D7: LDA.w $0405
#_0193DA: STA.w $0E80
#_0193DD: LDA.w $0407
#_0193E0: STA.w $0E82
#_0193E3: LDA.w #$3DD5
#_0193E6: LDY.w #$0006
#_0193E9: JSL routine008F11
#_0193ED: RTS

;===================================================================================================

routine0193EE:
#_0193EE: TAX
#_0193EF: LDA.w $101C
#_0193F2: CMP.w #$0070
#_0193F5: BCC .branch01940D

#_0193F7: CMP.w #$0091
#_0193FA: BCC .branch019415

#_0193FC: LDA.w $101C,X
#_0193FF: CMP.w #$0070
#_019402: BCS .branch019415

.branch019404
#_019404: LDA.w #$0049
#_019407: JSL DisplaySystemMessage
#_01940B: SEC
#_01940C: RTS

.branch01940D
#_01940D: LDA.w $101C,X
#_019410: CMP.w #$0091
#_019413: BCS .branch019404

.branch019415
#_019415: LDX.w $0680
#_019418: LDA.w $100A,X
#_01941B: ASL A
#_01941C: ASL A
#_01941D: ASL A
#_01941E: ASL A
#_01941F: ASL A
#_019420: STA.w $0684
#_019423: LDA.w $0405
#_019426: SEC
#_019427: SBC.w $0684
#_01942A: LDA.w $0407
#_01942D: SBC.w #$0000
#_019430: BCS .branch01943B

#_019432: LDA.w #$0048
#_019435: JSL DisplaySystemMessage
#_019439: SEC
#_01943A: RTS

.branch01943B
#_01943B: CLC
#_01943C: RTS

;===================================================================================================

routine01943D:
#_01943D: PHP
#_01943E: PHA
#_01943F: PHX
#_019440: TYX
#_019441: BEQ .branch019447

#_019443: JSL routine019581

.branch019447
#_019447: PLX
#_019448: JSR routine019483
#_01944B: JSR routine0194B5
#_01944E: LDA.w $1000,X
#_019451: ORA.w #$4000
#_019454: STA.w $1000,X
#_019457: PLA
#_019458: ASL A
#_019459: TAY
#_01945A: BEQ .branch019465

.branch01945C
#_01945C: DEY
#_01945D: DEY
#_01945E: LDA.w $0700,Y
#_019461: BMI .branch01945C

#_019463: INY
#_019464: INY

.branch019465
#_019465: CPX.w #$FFFF
#_019468: BEQ .branch01947A

#_01946A: LDA.w $0700,Y
#_01946D: PHA
#_01946E: TXA
#_01946F: STA.w $0700,Y
#_019472: PLX
#_019473: INY
#_019474: INY
#_019475: CPY.w #$000C
#_019478: BCC .branch019465

.branch01947A
#_01947A: INC.w $0516
#_01947D: JSL routine00A17E
#_019481: PLP
#_019482: RTL

;===================================================================================================

routine019483:
#_019483: PHX
#_019484: LDA.w $0715
#_019487: BNE .branch0194B3

#_019489: LDA.w $100A,X
#_01948C: ASL A
#_01948D: ASL A
#_01948E: ASL A
#_01948F: ASL A
#_019490: ASL A
#_019491: STA.w $0684
#_019494: LDA.w $0405
#_019497: SEC
#_019498: SBC.w $0684
#_01949B: STA.w $0405
#_01949E: LDA.w $0407
#_0194A1: SBC.w #$0000
#_0194A4: STA.w $0407
#_0194A7: LDA.w $0400
#_0194AA: AND.w #$0040
#_0194AD: BNE .branch0194B3

#_0194AF: JSL WriteMoneyToHUD

.branch0194B3
#_0194B3: PLX
#_0194B4: RTS

;===================================================================================================

routine0194B5:
#_0194B5: LDA.w $101C,X
#_0194B8: CMP.w #$0070
#_0194BB: BCC .branch0194E2

#_0194BD: CMP.w #$0091
#_0194C0: BCS .branch0194C3

.branch0194C2
#_0194C2: RTS

.branch0194C3
#_0194C3: LDA.w $101C
#_0194C6: CMP.w #$00FF
#_0194C9: BCS .branch0194C2

#_0194CB: LDA.w $0726
#_0194CE: CLC
#_0194CF: ADC.w #$199A
#_0194D2: STA.w $0726
#_0194D5: LDA.w $101C
#_0194D8: ADC.w #$0000
#_0194DB: STA.w $101C
#_0194DE: STA.w $107C
#_0194E1: RTS

.branch0194E2
#_0194E2: LDA.w $101C
#_0194E5: BEQ .branch0194C2

#_0194E7: LDA.w $0726
#_0194EA: SEC
#_0194EB: SBC.w #$199A
#_0194EE: STA.w $0726
#_0194F1: LDA.w $101C
#_0194F4: SBC.w #$0000
#_0194F7: STA.w $101C
#_0194FA: STA.w $107C
#_0194FD: RTS

;===================================================================================================

routine0194FE:
#_0194FE: PHP
#_0194FF: REP #$30
#_019501: LDY.w #$0000

.branch019504
#_019504: LDA.w $0700,Y
#_019507: BMI .branch019515

#_019509: CMP.w #$0180
#_01950C: BCS .branch019527

#_01950E: INY
#_01950F: INY
#_019510: CPY.w #$000C
#_019513: BCC .branch019504

.branch019515
#_019515: LDA.w #$001A
#_019518: JSL DisplaySystemMessage
#_01951C: PLP
#_01951D: SEC
#_01951E: RTL

;===================================================================================================

routine01951F:
#_01951F: PHP
#_019520: REP #$30
#_019522: LDA.w #$0018
#_019525: BRA .branch01952A

.branch019527
#_019527: LDA.w #$0015

.branch01952A
#_01952A: JSL DisplaySystemMessage
#_01952E: STZ.w $0690
#_019531: LDY.w #$0000

.branch019534
#_019534: STY.w $0692
#_019537: LDX.w $0700,Y
#_01953A: BMI .branch01955A

#_01953C: CPX.w #$0180
#_01953F: BCC .branch019550

#_019541: LDA.w $0690
#_019544: ASL A
#_019545: TAY
#_019546: TXA
#_019547: STA.w $06A0,Y
#_01954A: JSR routine019028
#_01954D: INC.w $0690

.branch019550
#_019550: LDY.w $0692
#_019553: INY
#_019554: INY
#_019555: CPY.w #$000C
#_019558: BCC .branch019534

.branch01955A
#_01955A: LDA.w $0690
#_01955D: DEC A

#_01955E: SEP #$20
#_019560: STA.w $09F1
#_019563: STZ.w $09F0
#_019566: LDA.b #$0B
#_019568: STA.w $09F4
#_01956B: STZ.w $09F2
#_01956E: STZ.w $09F3
#_019571: JSR routine018FBF
#_019574: BCS .branch01957E

#_019576: ASL A
#_019577: TAY
#_019578: LDX.w $06A0,Y
#_01957B: PLP
#_01957C: CLC
#_01957D: RTL

.branch01957E
#_01957E: PLP
#_01957F: SEC
#_019580: RTL

;===================================================================================================
; TODO party reorganization?
;===================================================================================================
routine019581:
#_019581: LDA.w $1000,X
#_019584: AND.w #$BFFF
#_019587: STA.w $1000,X
#_01958A: LDA.w $1002,X
#_01958D: AND.w #$F000
#_019590: STA.w $1002,X
#_019593: STZ.w $1008,X
#_019596: TXA
#_019597: LDY.w #$0000

.branch01959A
#_01959A: CMP.w $0700,Y
#_01959D: BEQ .branch0195A3

#_01959F: INY
#_0195A0: INY
#_0195A1: BRA .branch01959A

.branch0195A3
#_0195A3: INY
#_0195A4: INY
#_0195A5: LDA.w $0700,Y
#_0195A8: BMI .branch0195B6

#_0195AA: DEY
#_0195AB: DEY
#_0195AC: STA.w $0700,Y
#_0195AF: INY
#_0195B0: INY
#_0195B1: CPY.w #$000C
#_0195B4: BCC .branch0195A3

.branch0195B6
#_0195B6: DEY
#_0195B7: DEY
#_0195B8: LDA.w #$FFFF
#_0195BB: STA.w $0700,Y
#_0195BE: DEC.w $0516
#_0195C1: JSL routine00A17E
#_0195C5: RTL

;===================================================================================================

DismissDemon:
#_0195C6: PHP
#_0195C7: SEP #$20
#_0195C9: LDA.b #$02
#_0195CB: JSL routine00BAC0

#_0195CF: REP #$30
#_0195D1: JSL ClearEntityListBuffer
#_0195D5: STZ.w $0688
#_0195D8: STZ.w $068A
#_0195DB: STZ.w $06E1
#_0195DE: LDX.w #$0180

.branch0195E1
#_0195E1: LDA.w $1000,X
#_0195E4: BPL .branch0195F2

#_0195E6: LDA.w $068A
#_0195E9: ASL A
#_0195EA: TAY
#_0195EB: TXA
#_0195EC: STA.w $06A0,Y
#_0195EF: INC.w $068A

.branch0195F2
#_0195F2: TXA
#_0195F3: CLC
#_0195F4: ADC.w #$0060
#_0195F7: TAX
#_0195F8: CPX.w #$0600
#_0195FB: BCC .branch0195E1

#_0195FD: LDA.w $068A
#_019600: BNE .branch01960C

#_019602: LDA.w #$001B
#_019605: JSL DisplaySystemMessage
#_019609: PLP
#_01960A: SEC
#_01960B: RTL

.branch01960C
#_01960C: REP #$20
#_01960E: LDA.w #$0016
#_019611: JSL DisplaySystemMessage
#_019615: JSL routine0190E6
#_019619: BCC .branch01961D

#_01961B: PLP
#_01961C: RTL

.branch01961D
#_01961D: STA.w $06E1

#_019620: REP #$30
#_019622: AND.w #$00FF
#_019625: LDX.w $0688
#_019628: BEQ .branch01962E

#_01962A: CLC
#_01962B: ADC.w #$0006

.branch01962E
#_01962E: ASL A
#_01962F: TAY
#_019630: LDA.w $06A0,Y
#_019633: STA.w $0680
#_019636: TAX
#_019637: LDA.w $1004,X
#_01963A: STA.w $0A3E
#_01963D: LDX.w #$0000

.branch019640
#_019640: CMP.l data019682,X
#_019644: BEQ .branch01966A

#_019646: INX
#_019647: INX
#_019648: CPX.w #$0008
#_01964B: BCC .branch019640

.branch01964D
#_01964D: LDA.w #$001D
#_019650: JSL DisplaySystemMessage

#_019654: SEP #$20
#_019656: LDA.w $09F3
#_019659: BEQ .branch01965E

#_01965B: JMP .branch01960C

.branch01965E
#_01965E: REP #$20
#_019660: LDX.w $0680
#_019663: JSL routine01968A
#_019667: PLP
#_019668: CLC
#_019669: RTL

.branch01966A
#_01966A: CPX.w #$0006
#_01966D: BNE .branch019678

#_01966F: LDA.w #$001C
#_019672: JSL CheckGameProgressFlag
#_019676: BCC .branch01964D

.branch019678
#_019678: LDA.w #$001C
#_01967B: JSL DisplaySystemMessage
#_01967F: JMP .branch01960C

data019682:
#_019682: dw $0020,$0021,$0022,$008B

routine01968A:
#_01968A: PHP
#_01968B: REP #$30
#_01968D: TXA
#_01968E: LDY.w #$0000

.branch019691
#_019691: CMP.w $0700,Y
#_019694: BEQ .branch01969F

#_019696: INY
#_019697: INY
#_019698: CPY.w #$000C
#_01969B: BCC .branch019691

#_01969D: BCS .branch0196BA

.branch01969F
#_01969F: INY
#_0196A0: INY
#_0196A1: LDA.w $0700,Y
#_0196A4: BMI .branch0196B2

#_0196A6: DEY
#_0196A7: DEY
#_0196A8: STA.w $0700,Y
#_0196AB: INY
#_0196AC: INY
#_0196AD: CPY.w #$000C
#_0196B0: BCC .branch01969F

.branch0196B2
#_0196B2: DEY
#_0196B3: DEY
#_0196B4: LDA.w #$FFFF
#_0196B7: STA.w $0700,Y

.branch0196BA
#_0196BA: STZ.w $1000,X
#_0196BD: JSR routine0196C9
#_0196C0: STZ.w $1002,X
#_0196C3: JSL routine00A17E
#_0196C7: PLP
#_0196C8: RTL

;===================================================================================================

routine0196C9:
#_0196C9: LDA.w $101C
#_0196CC: CMP.w #$00FF
#_0196CF: BCS .branch0196EF

#_0196D1: LDA.w #$199A
#_0196D4: LDY.w $1002,X
#_0196D7: BEQ .branch0196DC

#_0196D9: LDA.w #$6668

.branch0196DC
#_0196DC: CLC
#_0196DD: ADC.w $0726
#_0196E0: STA.w $0726
#_0196E3: LDA.w $101C
#_0196E6: ADC.w #$0000
#_0196E9: STA.w $101C
#_0196EC: STA.w $107C

.branch0196EF
#_0196EF: RTS

;===================================================================================================

routine0196F0:
#_0196F0: PHP
#_0196F1: REP #$30
#_0196F3: STZ.w $0762
#_0196F6: LDY.w #$0000

.branch0196F9
#_0196F9: LDX.w $0700,Y
#_0196FC: BMI .branch019710

#_0196FE: LDA.w $1002,X
#_019701: AND.w #$E000
#_019704: BNE .branch019709

#_019706: INC.w $0762

.branch019709
#_019709: INY
#_01970A: INY
#_01970B: CPY.w #$000C
#_01970E: BCC .branch0196F9

.branch019710
#_019710: LDA.w $0762
#_019713: DEC A
#_019714: BNE .branch019720

#_019716: LDA.w #$001F
#_019719: JSL DisplaySystemMessage
#_01971D: PLP
#_01971E: SEC
#_01971F: RTL

.branch019720
#_019720: LDA.w #$0013
#_019723: JSL DisplaySystemMessage
#_019727: LDY.w #$0000
#_01972A: LDA.w #$FFFF

.branch01972D
#_01972D: STA.w $0764,Y
#_019730: INY
#_019731: INY
#_019732: CPY.w #$0018
#_019735: BCC .branch01972D

#_019737: STZ.w $0762
#_01973A: STZ.w $0690
#_01973D: LDY.w #$0000

.branch019740
#_019740: STY.w $0760
#_019743: LDX.w $0700,Y
#_019746: BMI .branch019773

#_019748: LDA.w $1002,X
#_01974B: AND.w #$E000
#_01974E: BNE .branch019769

#_019750: LDY.w $0760
#_019753: TXA
#_019754: STA.w $0770,Y
#_019757: JSR routine019059
#_01975A: LDA.w $0762
#_01975D: JSR routine01908A
#_019760: INC.w $0690
#_019763: INC.w $0762
#_019766: INC.w $0762

.branch019769
#_019769: LDY.w $0760
#_01976C: INY
#_01976D: INY
#_01976E: CPY.w #$000C
#_019771: BCC .branch019740

.branch019773
#_019773: STZ.w $0760
#_019776: DEC.w $0762
#_019779: DEC.w $0762
#_01977C: LDA.w $0762
#_01977F: LSR A

#_019780: SEP #$20
#_019782: STA.w $09F1
#_019785: STZ.w $09F0
#_019788: LDA.b #$0B
#_01978A: STA.w $09F4
#_01978D: STZ.w $09F2
#_019790: STZ.w $09F3

.branch019793
#_019793: SEP #$30
#_019795: JSR routine018FBF
#_019798: BCS .branch0197D9

#_01979A: STA.w $0690
#_01979D: ASL A
#_01979E: TAY
#_01979F: LDA.w $0770,Y
#_0197A2: LDX.w #$0000

.branch0197A5
#_0197A5: CMP.w $0764,X
#_0197A8: BEQ .branch019793

#_0197AA: INX
#_0197AB: INX
#_0197AC: CPX.w #$000C
#_0197AF: BCC .branch0197A5

#_0197B1: LDX.w $0760
#_0197B4: STA.w $0764,X
#_0197B7: TYA
#_0197B8: JSR routine01908A
#_0197BB: INC.w $0760
#_0197BE: INC.w $0760
#_0197C1: LDA.w $0760
#_0197C4: CMP.w $0762
#_0197C7: BCC .branch019793

#_0197C9: JSR routine019816

#_0197CC: SEP #$30
#_0197CE: JSR routine018FBF
#_0197D1: BCC .branch0197D6

#_0197D3: JMP .branch019720

.branch0197D6
#_0197D6: PLP
#_0197D7: CLC
#_0197D8: RTL

.branch0197D9
#_0197D9: REP #$30
#_0197DB: LDY.w $0760
#_0197DE: BEQ .branch019813

#_0197E0: DEY
#_0197E1: DEY
#_0197E2: STY.w $0760
#_0197E5: LDA.w $0764,Y
#_0197E8: PHA
#_0197E9: LDA.w #$FFFF
#_0197EC: STA.w $0764,Y
#_0197EF: LDX.w #$0000
#_0197F2: PLA

.branch0197F3
#_0197F3: CMP.w $0770,X
#_0197F6: BEQ .branch0197FF

#_0197F8: INX
#_0197F9: INX
#_0197FA: CPX.w #$000C
#_0197FD: BCC .branch0197F3

.branch0197FF
#_0197FF: TXA
#_019800: JSR routine01908A

#_019803: SEP #$20
#_019805: STZ.w $09F2
#_019808: LDA.w $0690
#_01980B: STA.w $09F3

#_01980E: REP #$20
#_019810: JMP .branch019793

.branch019813
#_019813: PLP
#_019814: SEC
#_019815: RTL

;===================================================================================================

routine019816:
#_019816: LDY.w #$0000

.branch019819
#_019819: LDA.w $0770,Y
#_01981C: LDX.w #$0000

.branch01981F
#_01981F: CMP.w $0764,X
#_019822: BEQ .branch01982D

#_019824: INX
#_019825: INX
#_019826: CPX.w $0762
#_019829: BCC .branch01981F

#_01982B: BCS .branch019837

.branch01982D
#_01982D: INY
#_01982E: INY
#_01982F: CPY.w $0762
#_019832: BCC .branch019819

#_019834: LDA.w $0770,Y

.branch019837
#_019837: LDX.w $0760
#_01983A: STA.w $0764,X
#_01983D: TYA
#_01983E: JSR routine01908A
#_019841: RTS

;===================================================================================================

routine019842:
#_019842: PHP
#_019843: REP #$30
#_019845: LDY.w #$0000

.branch019848
#_019848: LDA.w $0764,Y
#_01984B: BMI .branch019857

#_01984D: STA.w $0700,Y
#_019850: INY
#_019851: INY
#_019852: CPY.w #$000C
#_019855: BCC .branch019848

.branch019857
#_019857: LDY.w #$0000

.branch01985A
#_01985A: STY.w $0720
#_01985D: LDX.w $0700,Y
#_019860: BMI .branch019875

#_019862: CPX.w #$0180
#_019865: BCS .branch01986B

#_019867: JSL UpdatePlayerStats

.branch01986B
#_01986B: LDY.w $0720
#_01986E: INY
#_01986F: INY
#_019870: CPY.w #$000C
#_019873: BCC .branch01985A

.branch019875
#_019875: JSL routine00A17E
#_019879: PLP
#_01987A: RTL

;===================================================================================================

routine01987B:
#_01987B: LDY.w #$0000

.branch01987E
#_01987E: PHY
#_01987F: LDA.w $0700,Y
#_019882: BMI .branch0198A9

#_019884: CMP.w $0715
#_019887: BEQ .branch0198A0

#_019889: TAY
#_01988A: LDA.w $1008,Y
#_01988D: AND.w #$0004
#_019890: BEQ .branch0198A0

#_019892: LDA.w $1058,Y
#_019895: CMP.w #$003D
#_019898: BNE .branch0198A0

#_01989A: TXA
#_01989B: CMP.w $105A,Y
#_01989E: BEQ .branch0198AC

.branch0198A0
#_0198A0: PLY
#_0198A1: INY
#_0198A2: INY
#_0198A3: CPY.w #$000C
#_0198A6: BCC .branch01987E

#_0198A8: PHY

.branch0198A9
#_0198A9: PLY
#_0198AA: CLC
#_0198AB: RTS

.branch0198AC
#_0198AC: PLY
#_0198AD: SEC
#_0198AE: RTS

;===================================================================================================

routine0198AF:
#_0198AF: LDY.w #$0000
#_0198B2: TYX

.branch0198B3
#_0198B3: LDA.w $0700,Y
#_0198B6: BMI .branch0198C5

#_0198B8: CMP.w #$0180
#_0198BB: BCC .branch0198BE

#_0198BD: INX

.branch0198BE
#_0198BE: INY
#_0198BF: INY
#_0198C0: CPY.w #$000C
#_0198C3: BCC .branch0198B3

.branch0198C5
#_0198C5: CPX.w #$0004
#_0198C8: BCS .branch01990F

#_0198CA: LDA.w $0400
#_0198CD: AND.w #$0040
#_0198D0: BEQ .branch019901

#_0198D2: LDY.w #$0000

.branch0198D5
#_0198D5: PHY
#_0198D6: LDA.w $0700,Y
#_0198D9: BMI .branch0198FB

#_0198DB: CMP.w $0715
#_0198DE: BEQ .branch0198F2

#_0198E0: TAY
#_0198E1: LDA.w $1008,Y
#_0198E4: AND.w #$0004
#_0198E7: BEQ .branch0198F2

#_0198E9: LDA.w $1058,Y
#_0198EC: CMP.w #$003D
#_0198EF: BNE .branch0198F2

#_0198F1: INX

.branch0198F2
#_0198F2: PLY
#_0198F3: INY
#_0198F4: INY
#_0198F5: CPY.w #$000C
#_0198F8: BCC .branch0198D5

#_0198FA: PHY

.branch0198FB
#_0198FB: PLY
#_0198FC: CPX.w #$0004
#_0198FF: BCS .branch01990F

.branch019901
#_019901: CPX.w #$0003
#_019904: BCC .branch019911

#_019906: LDA.w #$00F0
#_019909: JSL CheckGameProgressFlag
#_01990D: BCC .branch019911

.branch01990F
#_01990F: SEC
#_019910: RTS

.branch019911
#_019911: CLC
#_019912: RTS

;===================================================================================================

; TODO open maps
COMP_Automapper:
#_019913: SEP #$20
#_019915: LDA.w $0404
#_019918: BEQ .can_open_map

#_01991A: REP #$20
#_01991C: LDA.w #$0009
#_01991F: JSL DisplaySystemMessage
#_019923: RTS

.can_open_map
#_019924: JSL HideTheMenu
#_019928: JSL UpdateUWLabel
#_01992C: JSL UpdateDialogBox

#_019930: SEP #$30

#_019932: LDA.b #$04
#_019934: LDX.b #$00
#_019936: LDY.b #$01
#_019938: JSL GraduallyFadeStuff

#_01993C: LDX.b #$1C
#_01993E: STX.w $0F75
#_019941: JSL DisplayUnderworldMap

#_019945: LDX.b #$1D
#_019947: STX.w $0F75
#_01994A: STZ.w $0F4D
#_01994D: STZ.w $0F4E
#_019950: LDA.b #$FF
#_019952: STA.w $0F4F
#_019955: STA.w BG1VOFS
#_019958: STZ.w $0F50
#_01995B: STZ.w BG1VOFS
#_01995E: LDA.b #$A0
#_019960: STA.w $0F0A
#_019963: LDA.b #$25
#_019965: STA.w $0F0B
#_019968: LDA.b #$7E
#_01996A: STA.w $0F0C
#_01996D: LDA.b #$19
#_01996F: JSL routine00BBF4
#_019973: LDA.b #$04
#_019975: LDX.b #$00
#_019977: LDY.b #$01
#_019979: JSL routine0091A1
#_01997D: JSL routine00C51A

#_019981: REP #$30
#_019983: LDA.w #$0000
#_019986: JSL RunOpenMenuDMA_Xplus6
#_01998A: JSL TriggerMenuGrow
#_01998E: JSL WriteMoneyToHUD
#_019992: JSL WriteMAGToHUD
#_019996: LDA.w #$0002
#_019999: JSL InitializeTextBoxToSizeForNewMessage
#_01999D: JSL routine00A056

#_0199A1: SEP #$30
#_0199A3: LDA.w $0711
#_0199A6: AND.b #$0F
#_0199A8: CMP.b #$0A
#_0199AA: BNE .branch0199B0

#_0199AC: JSL RoomEvent_0A_SignA_long

.branch0199B0
#_0199B0: REP #$30
#_0199B2: RTS

;===================================================================================================

COMP_Analyzer:
#_0199B3: PHP
#_0199B4: REP #$30
#_0199B6: STZ.w $0688
#_0199B9: STZ.w $068A
#_0199BC: STZ.w $06E4
#_0199BF: STZ.w $06E8

#_0199C2: SEP #$30
#_0199C4: LDX.b #$00

.branch0199C6
#_0199C6: LDA.l $7E3500,X
#_0199CA: BEQ .branch0199D2

#_0199CC: INC.w $068A
#_0199CF: INX
#_0199D0: BNE .branch0199C6

.branch0199D2
#_0199D2: REP #$30
#_0199D4: LDA.w $068A
#_0199D7: BNE .branch0199E2

#_0199D9: LDA.w #$0010
#_0199DC: JSL DisplaySystemMessage

.branch0199E0
#_0199E0: PLP
#_0199E1: RTS

.branch0199E2
#_0199E2: LDA.w #$0008
#_0199E5: JSL DisplaySystemMessage
#_0199E9: JSR routine019A75
#_0199EC: BCS .branch0199E0

#_0199EE: STA.w $06E4
#_0199F1: ASL A
#_0199F2: CLC
#_0199F3: ADC.w $09F2

#_0199F6: REP #$30
#_0199F8: AND.w #$00FF
#_0199FB: LDX.w $0688
#_0199FE: BEQ .branch019A07

.branch019A00
#_019A00: CLC
#_019A01: ADC.w #$000C
#_019A04: DEX
#_019A05: BNE .branch019A00

.branch019A07
#_019A07: TAX
#_019A08: LDA.l $7E3500,X
#_019A0C: AND.w #$00FF
#_019A0F: STA.w $050A

#_019A12: SEP #$20
#_019A14: LDX.w #$0000

.branch019A17
#_019A17: CMP.l ClassCutoffs,X
#_019A1B: BCC .branch019A23

#_019A1D: INX
#_019A1E: CPX.w #$0024
#_019A21: BCC .branch019A17

.branch019A23
#_019A23: TXA
#_019A24: STA.w $0506

#_019A27: REP #$20
#_019A29: STZ.w $0524
#_019A2C: LDA.w #$0001
#_019A2F: STA.w $050E
#_019A32: JSL LoadDemonStats
#_019A36: LDA.w #$0600
#_019A39: STA.w $0715
#_019A3C: STZ.w $0578
#_019A3F: JSL routine0183E5

#_019A43: REP #$30
#_019A45: LDA.w #$0000
#_019A48: JSL RunOpenMenuDMA_Xplus6
#_019A4C: JSL TriggerMenuGrow
#_019A50: JSL WriteMoneyToHUD
#_019A54: JSL WriteMAGToHUD
#_019A58: JSL routine00A056

#_019A5C: SEP #$30
#_019A5E: LDA.w $0404
#_019A61: BNE .branch019A70

#_019A63: LDA.w $0711
#_019A66: AND.b #$0F
#_019A68: CMP.b #$0A
#_019A6A: BNE .branch019A70

#_019A6C: JSL RoomEvent_0A_SignA_long

.branch019A70
#_019A70: REP #$30
#_019A72: JMP .branch0199E2

routine019A75:
#_019A75: LDA.w #$0002
#_019A78: JSL routine00BAC0
#_019A7C: JSR routine01AABB
#_019A7F: STZ.w $0E88
#_019A82: STZ.w $0690
#_019A85: STZ.w $0692

.branch019A88
#_019A88: LDA.w $0688
#_019A8B: BEQ .branch019A98

#_019A8D: TAX
#_019A8E: LDA.w #$0000

.branch019A91
#_019A91: CLC
#_019A92: ADC.w #$000C
#_019A95: DEX
#_019A96: BNE .branch019A91

.branch019A98
#_019A98: CLC
#_019A99: ADC.w $0690
#_019A9C: TAX
#_019A9D: CPX.w #$0100
#_019AA0: BCS .branch019B11

#_019AA2: LDA.l $7E3500,X
#_019AA6: AND.w #$00FF
#_019AA9: BEQ .branch019B11

#_019AAB: AND.w #$00FF
#_019AAE: LDY.w #$0000
#_019AB1: LDX.w #$0014
#_019AB4: JSL GetDemonName
#_019AB8: LDA.w $0690
#_019ABB: LSR A
#_019ABC: CLC
#_019ABD: ADC.w #$0002
#_019AC0: JSL routine00BA70
#_019AC4: LDA.w $0690
#_019AC7: LSR A
#_019AC8: ASL A
#_019AC9: ASL A
#_019ACA: ASL A
#_019ACB: ASL A
#_019ACC: ASL A
#_019ACD: ASL A
#_019ACE: CLC
#_019ACF: ADC.w #$3E04
#_019AD2: TAX
#_019AD3: LDA.w $0690
#_019AD6: LSR A
#_019AD7: BCC .branch019AE5

#_019AD9: TXA
#_019ADA: CLC
#_019ADB: ADC.w #$000C
#_019ADE: TAX
#_019ADF: LDA.w #$0001
#_019AE2: STA.w $0692

.branch019AE5
#_019AE5: TXA
#_019AE6: STA.w $0102
#_019AE9: SEC
#_019AEA: SBC.w #$0020
#_019AED: STA.w $0116
#_019AF0: LDA.w #$0008
#_019AF3: STA.w $0104
#_019AF6: STA.w $0118
#_019AF9: LDA.w #$0002
#_019AFC: STA.w $0100
#_019AFF: JSL AddSelfAsVector
#_019B03: INC.w $0690
#_019B06: LDA.w $0690
#_019B09: CMP.w #$000C
#_019B0C: BCS .branch019B11

#_019B0E: JMP .branch019A88

.branch019B11
#_019B11: LDA.w $0690
#_019B14: LSR A
#_019B15: BCS .branch019B18

#_019B17: DEC A

.branch019B18
#_019B18: SEP #$20
#_019B1A: STA.w $09F1
#_019B1D: STA.w $09FC
#_019B20: BCC .branch019B25

#_019B22: DEC.w $09FC

.branch019B25
#_019B25: LDA.w $0692
#_019B28: STA.w $09F0
#_019B2B: LDA.b #$8D
#_019B2D: STA.w $09F4
#_019B30: LDA.w $06E8
#_019B33: STA.w $09F2
#_019B36: LDA.w $06E4
#_019B39: STA.w $09F3

.branch019B3C
#_019B3C: SEP #$30
#_019B3E: JSL routine02C8E9

#_019B42: SEP #$30
#_019B44: LDA.w $09F8
#_019B47: AND.b #$3F
#_019B49: BNE .branch019B5C

#_019B4B: LDA.w $09F3
#_019B4E: ORA.w $09F2
#_019B51: BPL .branch019B57

#_019B53: REP #$30
#_019B55: SEC
#_019B56: RTS

.branch019B57
#_019B57: LDA.w $09F3
#_019B5A: CLC
#_019B5B: RTS

.branch019B5C
#_019B5C: BIT.w $09F8
#_019B5F: BVS .branch019B6F

#_019B61: BIT.w $09F2
#_019B64: BPL .branch019B6F

#_019B66: LDA.w $09F0
#_019B69: STA.w $09F2
#_019B6C: STA.w $06E8

.branch019B6F
#_019B6F: BIT.w $09F8
#_019B72: BMI .branch019BD2

#_019B74: BIT.w $09F3
#_019B77: BPL .branch019B3C

#_019B79: LDA.w $09F1
#_019B7C: LDX.w $09F2
#_019B7F: BEQ .branch019B84

#_019B81: LDA.w $09FC

.branch019B84
#_019B84: STA.w $09F3

#_019B87: REP #$30
#_019B89: DEC.w $0688
#_019B8C: BPL .branch019BA8

#_019B8E: LDA.w #$0002
#_019B91: LDX.w $068A
#_019B94: CPX.w #$0019
#_019B97: BCS .branch019BA0

#_019B99: DEC A
#_019B9A: CPX.w #$000D
#_019B9D: BCS .branch019BA0

#_019B9F: DEC A

.branch019BA0
#_019BA0: STA.w $0688
#_019BA3: CMP.w #$0000
#_019BA6: BEQ .branch019B3C

.branch019BA8
#_019BA8: LDA.w #$0005
#_019BAB: LDX.w $0688
#_019BAE: BEQ .branch019BCC


#_019BB0: LDA.w $068A
#_019BB3: LSR A
#_019BB4: ADC.w #$0000
#_019BB7: SEC
#_019BB8: SBC.w #$0007
#_019BBB: CPX.w #$0001
#_019BBE: BEQ .branch019BC4

#_019BC0: SEC
#_019BC1: SBC.w #$0006

.branch019BC4
#_019BC4: CMP.w #$0006
#_019BC7: BCC .branch019BCC

#_019BC9: LDA.w #$0005

.branch019BCC
#_019BCC: STA.w $06E4

#_019BCF: JMP routine019A75

.branch019BD2
#_019BD2: LDA.w $068A
#_019BD5: LSR A
#_019BD6: BCC .branch019BDB

#_019BD8: STZ.w $06E8

.branch019BDB
#_019BDB: REP #$30
#_019BDD: LDA.w $068A
#_019BE0: CMP.w #$000D
#_019BE3: BCS .branch019BE8

#_019BE5: JMP .branch019B3C

.branch019BE8
#_019BE8: INC.w $0688
#_019BEB: LDA.w $0688
#_019BEE: CMP.w #$0002
#_019BF1: BCC .branch019C00

#_019BF3: BNE .branch019BFD

#_019BF5: LDX.w $068A
#_019BF8: CPX.w #$0019
#_019BFB: BCS .branch019C00

.branch019BFD
#_019BFD: STZ.w $0688

.branch019C00
#_019C00: STZ.w $06E4
#_019C03: JMP routine019A75

;===================================================================================================

routine019C06:
#_019C06: PHP
#_019C07: REP #$30
#_019C09: LDX.w #$0000
#_019C0C: LDY.w #$0600
#_019C0F: LDA.w $0524
#_019C12: BEQ .branch019C20

#_019C14: REP #$20
#_019C16: LDA.w #$0012
#_019C19: JSL DisplayActionMessage
#_019C1D: PLP
#_019C1E: SEC
#_019C1F: RTL

.branch019C20
#_019C20: STX.w $0564

.branch019C23
#_019C23: LDA.w $1000,Y
#_019C26: BPL .branch019C30

#_019C28: LDA.w $1002,Y
#_019C2B: AND.w #$C000
#_019C2E: BEQ .branch019C38

.branch019C30
#_019C30: TYA
#_019C31: CLC
#_019C32: ADC.w #$0060
#_019C35: TAY
#_019C36: BRA .branch019C23

.branch019C38
#_019C38: LDA.w $1004,Y
#_019C3B: CMP.w #$0100
#_019C3E: BCC .branch019C4C

.branch019C40
#_019C40: REP #$20
#_019C42: LDA.w #$0011
#_019C45: JSL DisplayActionMessage
#_019C49: PLP
#_019C4A: SEC
#_019C4B: RTL

.branch019C4C
#_019C4C: SEP #$20
#_019C4E: LDX.w #$0000

.branch019C51
#_019C51: LDA.l $7E3500,X
#_019C55: BEQ .branch019C40

#_019C57: CMP.w $1004,Y
#_019C5A: BEQ .branch019C5F

#_019C5C: INX
#_019C5D: BRA .branch019C51

.branch019C5F
#_019C5F: STY.w $0715
#_019C62: JSL UpdateDialogBox
#_019C66: JSL HideTheMenu

#_019C6A: SEP #$30
#_019C6C: LDA.w $0564
#_019C6F: AND.b #$07
#_019C71: BEQ .branch019C76

#_019C73: ASL A
#_019C74: ASL A
#_019C75: DEC A

.branch019C76
#_019C76: EOR.b #$10
#_019C78: TAY
#_019C79: CLC
#_019C7A: ADC.b #$04
#_019C7C: TAX
#_019C7D: LDA.b #$80
#_019C7F: STA.w $1A20,Y
#_019C82: STA.w $1A20,X
#_019C85: LDA.w $1A00,Y
#_019C88: ORA.b #$08
#_019C8A: STA.w $1A00,Y
#_019C8D: LDA.w $1A00,X
#_019C90: ORA.b #$08
#_019C92: STA.w $1A00,X

#_019C95: REP #$30
#_019C97: TYA
#_019C98: ASL A
#_019C99: TAY
#_019C9A: TXA
#_019C9B: ASL A
#_019C9C: TAX
#_019C9D: LDA.w #$002A
#_019CA0: STA.w $0040,Y
#_019CA3: STA.w $0040,X
#_019CA6: JSL ResetSomeTextMaybe
#_019CAA: LDA.w #$2000
#_019CAD: STA.w $0EFB
#_019CB0: STZ.w $0E88
#_019CB3: LDX.w $0715
#_019CB6: LDA.w $1006,X
#_019CB9: LDX.w #$0022
#_019CBC: LDY.w #$0000
#_019CBF: JSL GetClassName
#_019CC3: LDA.w #$209A
#_019CC6: STA.w $0112
#_019CC9: LDA.w #$20CF
#_019CCC: STA.w $0134
#_019CCF: LDX.w $0715
#_019CD2: LDA.w $1004,X
#_019CD5: LDX.w #$0030
#_019CD8: LDY.w #$000E
#_019CDB: JSL GetDemonName
#_019CDF: LDA.w #$0007
#_019CE2: LDX.w #$0022
#_019CE5: LDY.w #$0000
#_019CE8: JSR routine018AA7
#_019CEB: LDA.w #$000F
#_019CEE: STA.w $0104
#_019CF1: STA.w $0104,X
#_019CF4: JSL AddSelfAsVectorAndMakeSpace
#_019CF8: LDA.w #$0000
#_019CFB: JSR DrawStatsTextMaybe018A89
#_019CFE: LDX.w $0715
#_019D01: LDA.w $100A,X
#_019D04: STA.w $0E80
#_019D07: STZ.w $0E82
#_019D0A: LDY.w #$0006
#_019D0D: LDA.w #$010E
#_019D10: JSL WriteAmountHEXtoDEC
#_019D14: LDA.w #$0008
#_019D17: LDX.w #$0000
#_019D1A: LDY.w #$0000
#_019D1D: JSR routine018AA7
#_019D20: JSL AddSelfAsVectorAndMakeSpace
#_019D24: LDA.w #$0001
#_019D27: JSR DrawStatsTextMaybe018A89
#_019D2A: LDX.w $0715
#_019D2D: LDA.w $102E,X
#_019D30: STA.w $0E80
#_019D33: STZ.w $0E82
#_019D36: LDY.w #$0006
#_019D39: LDA.w #$010E
#_019D3C: JSL WriteAmountHEXtoDEC
#_019D40: LDA.w #$0098
#_019D43: ORA.w $0EFB
#_019D46: STA.w $0114
#_019D49: LDX.w $0715
#_019D4C: LDA.w $1030,X
#_019D4F: STA.w $0E80
#_019D52: STZ.w $0E82
#_019D55: LDY.w #$0006
#_019D58: LDA.w #$0116
#_019D5B: JSL WriteAmountHEXtoDEC
#_019D5F: LDA.w #$0009
#_019D62: LDX.w #$0040
#_019D65: LDY.w #$0000
#_019D68: JSR routine018AA7
#_019D6B: JSL AddSelfAsVectorAndMakeSpace
#_019D6F: LDA.w #$0002
#_019D72: JSR DrawStatsTextMaybe018A89
#_019D75: LDX.w $0715
#_019D78: LDA.w $1034,X
#_019D7B: BNE .branch019D8E

#_019D7D: LDA.w #$0093
#_019D80: ORA.w $0EFB
#_019D83: STA.w $010E
#_019D86: STA.w $0110
#_019D89: STA.w $0112
#_019D8C: BRA .branch019DA1

.branch019D8E
#_019D8E: LDA.w $1032,X
#_019D91: STA.w $0E80
#_019D94: STZ.w $0E82
#_019D97: LDY.w #$0006
#_019D9A: LDA.w #$010E
#_019D9D: JSL WriteAmountHEXtoDEC

.branch019DA1
#_019DA1: LDA.w #$0098
#_019DA4: ORA.w $0EFB
#_019DA7: STA.w $0114
#_019DAA: LDX.w $0715
#_019DAD: LDA.w $1034,X
#_019DB0: BNE .branch019DC3

#_019DB2: LDA.w #$0093
#_019DB5: ORA.w $0EFB
#_019DB8: STA.w $0116
#_019DBB: STA.w $0118
#_019DBE: STA.w $011A
#_019DC1: BRA .branch019DD3

.branch019DC3
#_019DC3: STA.w $0E80
#_019DC6: STZ.w $0E82
#_019DC9: LDY.w #$0006
#_019DCC: LDA.w #$0116
#_019DCF: JSL WriteAmountHEXtoDEC

.branch019DD3
#_019DD3: LDA.w #$0009
#_019DD6: LDX.w #$0040
#_019DD9: LDY.w #$0020
#_019DDC: JSR routine018AA7
#_019DDF: JSL AddSelfAsVectorAndMakeSpace
#_019DE3: LDA.w #$0020
#_019DE6: JSR DrawStatsTextMaybe018A89

#_019DE9: SEP #$30
#_019DEB: LDX.b #$84
#_019DED: LDY.b #$00

.branch019DEF
#_019DEF: LDA.l StatsScreenWords,X
#_019DF3: STA.w $010E,Y
#_019DF6: LDA.w $0EFC
#_019DF9: STA.w $010F,Y
#_019DFC: INX
#_019DFD: INY
#_019DFE: INY
#_019DFF: CPY.b #$08
#_019E01: BCC .branch019DEF

#_019E03: REP #$30
#_019E05: LDY.w #$0000
#_019E08: LDX.w $0715
#_019E0B: LDA.w $101C,X
#_019E0E: CMP.w #$0055
#_019E11: BCC .branch019E1C

#_019E13: INY
#_019E14: INY
#_019E15: CMP.w #$00AA
#_019E18: BCC .branch019E1C

#_019E1A: INY
#_019E1B: INY

.branch019E1C
#_019E1C: TYA
#_019E1D: CLC
#_019E1E: ADC.w #$0022
#_019E21: ASL A
#_019E22: ASL A
#_019E23: TAX

#_019E24: SEP #$30
#_019E26: LDY.b #$00

.branch019E28
#_019E28: LDA.l StatsScreenWords,X
#_019E2C: STA.w $0110,Y
#_019E2F: LDA.w $0EFC
#_019E32: STA.w $0111,Y
#_019E35: INX
#_019E36: INY
#_019E37: INY
#_019E38: CPY.b #$10
#_019E3A: BCC .branch019E28

#_019E3C: REP #$30
#_019E3E: LDA.w #$0009
#_019E41: LDX.w #$0040
#_019E44: LDY.w #$0040
#_019E47: JSR routine018AA7
#_019E4A: LDA.w #$000D
#_019E4D: STA.w $0104
#_019E50: JSL AddSelfAsVectorAndMakeSpace
#_019E54: LDA.w #$0000

.branch019E57
#_019E57: STA.w $071C
#_019E5A: CLC
#_019E5B: ADC.w #$0019
#_019E5E: JSR DrawStatsTextMaybe018A89
#_019E61: LDA.w $071C
#_019E64: ASL A
#_019E65: CLC
#_019E66: ADC.w $0715
#_019E69: TAX
#_019E6A: LDA.w $1010,X
#_019E6D: STA.w $0E80
#_019E70: STZ.w $0E82
#_019E73: LDY.w #$0004
#_019E76: LDA.w #$010E
#_019E79: JSL WriteAmountHEXtoDEC
#_019E7D: LDA.w $071C
#_019E80: CMP.w #$0003
#_019E83: BCC .branch019E94

#_019E85: SEC
#_019E86: SBC.w #$0003
#_019E89: ASL A
#_019E8A: ASL A
#_019E8B: ASL A
#_019E8C: ASL A
#_019E8D: ASL A
#_019E8E: CLC
#_019E8F: ADC.w #$0007
#_019E92: BRA .branch019E99

.branch019E94
#_019E94: ASL A
#_019E95: ASL A
#_019E96: ASL A
#_019E97: ASL A
#_019E98: ASL A

.branch019E99
#_019E99: TAY
#_019E9A: LDA.w #$000A
#_019E9D: LDX.w #$0000
#_019EA0: JSR routine018AA7
#_019EA3: JSL AddSelfAsVectorAndMakeSpace
#_019EA7: LDA.w $071C
#_019EAA: INC A
#_019EAB: CMP.w #$0006
#_019EAE: BCC .branch019E57

#_019EB0: JSL Update19XXUntilInput
#_019EB4: JSL Write785CVRAM

#_019EB8: SEP #$30
#_019EBA: LDA.w $0564
#_019EBD: AND.b #$07
#_019EBF: BEQ .branch019EC4

#_019EC1: ASL A
#_019EC2: ASL A
#_019EC3: DEC A

.branch019EC4
#_019EC4: EOR.b #$10
#_019EC6: TAY
#_019EC7: CLC
#_019EC8: ADC.b #$04
#_019ECA: TAX
#_019ECB: LDA.b #$80
#_019ECD: STA.w $1A20,Y
#_019ED0: STA.w $1A20,X

#_019ED3: REP #$30
#_019ED5: TYA
#_019ED6: ASL A
#_019ED7: TAY
#_019ED8: TXA
#_019ED9: ASL A
#_019EDA: TAX
#_019EDB: LDA.w #$002B
#_019EDE: STA.w $0040,Y
#_019EE1: STA.w $0040,X
#_019EE4: JSL routine00C51A
#_019EE8: LDA.w #$0002
#_019EEB: JSL RunOpenMenuDMA_Xplus6
#_019EEF: LDA.w #$0002
#_019EF2: JSL routine00BAC0
#_019EF6: JSL routine00A056
#_019EFA: STZ.w $0564
#_019EFD: JSL routine01E4EF
#_019F01: PLP
#_019F02: SEC
#_019F03: RTL

;===================================================================================================

routine019F04:
#_019F04: STZ.w $06E4
#_019F07: STZ.w $06E8
#_019F0A: STZ.w $0688
#_019F0D: JSR routine019FAF
#_019F10: LDA.w $068A
#_019F13: BNE .branch019F1E

#_019F15: LDA.w #$0021
#_019F18: JSL DisplayActionMessage
#_019F1C: SEC
#_019F1D: RTL

.branch019F1E
#_019F1E: JSR routine01A020
#_019F21: RTL

;===================================================================================================

ITEM_Use:
#_019F22: STZ.w $06E4
#_019F25: STZ.w $06E8
#_019F28: STZ.w $0688
#_019F2B: JSR routine019FAF
#_019F2E: LDA.w $068A
#_019F31: BNE routine019F3B

#_019F33: LDA.w #$0021
#_019F36: JSL DisplayActionMessage
#_019F3A: RTS

;===================================================================================================

routine019F3B:
#_019F3B: LDY.w #$0000

.branch019F3E
#_019F3E: LDX.w $0700,Y
#_019F41: LDA.w $1002,X
#_019F44: AND.w #$F000
#_019F47: BNE .branch019F4E

#_019F49: CPX.w #$0180
#_019F4C: BCC .branch019F5D

.branch019F4E
#_019F4E: INY
#_019F4F: INY
#_019F50: CPY.w #$000C
#_019F53: BCC .branch019F3E

#_019F55: LDA.w #$0022
#_019F58: JSL DisplayActionMessage
#_019F5C: RTS

.branch019F5D
#_019F5D: STX.w $0715
#_019F60: JSR routine01A020
#_019F63: BCC .branch019F66

#_019F65: RTS

;---------------------------------------------------------------------------------------------------

.branch019F66
#_019F66: JSL routine01F672
#_019F6A: LDY.w $0694
#_019F6D: JSL routine01AAFD
#_019F71: JSR routine019FAF
#_019F74: LDA.w $0688
#_019F77: BEQ .branch019F84

#_019F79: TAX
#_019F7A: LDA.w #$0000

.branch019F7D
#_019F7D: CLC
#_019F7E: ADC.w #$000C
#_019F81: DEX
#_019F82: BNE .branch019F7D

.branch019F84
#_019F84: SEP #$20
#_019F86: CLC
#_019F87: ADC.w $06E4
#_019F8A: ADC.w $06E4

#_019F8D: REP #$20
#_019F8F: CMP.w $068A
#_019F92: BCC .branch019FA8

#_019F94: SEP #$20
#_019F96: DEC.w $06E4
#_019F99: BPL .branch019FA8

#_019F9B: REP #$20
#_019F9D: DEC.w $0688
#_019FA0: BMI .branch019FAD

#_019FA2: LDA.w #$0005
#_019FA5: STA.w $06E4

.branch019FA8
#_019FA8: REP #$20
#_019FAA: JMP routine019F3B

.branch019FAD
#_019FAD: CLC
#_019FAE: RTS

;===================================================================================================

routine019FAF:
#_019FAF: JSL ClearEntityListBuffer
#_019FB3: STZ.w $068A
#_019FB6: LDA.w $0400
#_019FB9: AND.w #$0040
#_019FBC: BNE .branch019FF9

#_019FBE: LDY.w #$0000

.branch019FC1
#_019FC1: PHY
#_019FC2: LDA.w $0780,Y
#_019FC5: TAX
#_019FC6: AND.w #$FF00
#_019FC9: BEQ .branch019FF0

#_019FCB: TXA
#_019FCC: AND.w #$00FF
#_019FCF: CMP.w #$00B0
#_019FD2: BCC .branch019FF0

#_019FD4: SEC
#_019FD5: SBC.w #$00B0
#_019FD8: LDY.w #$0000
#_019FDB: JSL GetUseItemStat
#_019FDF: AND.w #$0080
#_019FE2: BEQ .branch019FF0

#_019FE4: LDA.w $068A
#_019FE7: ASL A
#_019FE8: TAY
#_019FE9: TXA
#_019FEA: STA.w $06A0,Y
#_019FED: INC.w $068A

.branch019FF0
#_019FF0: PLY
#_019FF1: INY
#_019FF2: INY
#_019FF3: CPY.w #$003C
#_019FF6: BCC .branch019FC1

#_019FF8: RTS

.branch019FF9
#_019FF9: LDY.w #$0000

.branch019FFC
#_019FFC: PHY
#_019FFD: LDA.w $0780,Y
#_01A000: JSR routine01A106
#_01A003: BCS .branch01A011

#_01A005: LDA.w $068A
#_01A008: ASL A
#_01A009: TAY
#_01A00A: TXA
#_01A00B: STA.w $06A0,Y
#_01A00E: INC.w $068A

.branch01A011
#_01A011: PLY
#_01A012: INY
#_01A013: INY
#_01A014: CPY.w #$003C
#_01A017: BCS .branch01A01C

#_01A019: JMP .branch019FFC

.branch01A01C
#_01A01C: RTS

.branch01A01D
#_01A01D: JSR routine019FAF

;===================================================================================================

routine01A020:
#_01A020: LDA.w #$0025
#_01A023: JSL DisplaySystemMessage
#_01A027: JSR routine01A903
#_01A02A: BCC .branch01A02D

#_01A02C: RTS

.branch01A02D
#_01A02D: STA.w $06E4

#_01A030: ASL A
#_01A031: CLC
#_01A032: ADC.w $09F2

#_01A035: REP #$30

#_01A037: AND.w #$00FF
#_01A03A: LDX.w $0688
#_01A03D: BEQ .branch01A046

.branch01A03F
#_01A03F: CLC
#_01A040: ADC.w #$000C
#_01A043: DEX
#_01A044: BNE .branch01A03F

.branch01A046
; set and get selected index
#_01A046: STA.w $0690

#_01A049: ASL A
#_01A04A: TAY

; get item and quantity
#_01A04B: LDA.w $06A0,Y
#_01A04E: STA.w $0692

#_01A051: STZ.w $0694

#_01A054: LDA.w $0400
#_01A057: AND.w #$0040
#_01A05A: BNE .branch01A097

#_01A05C: LDY.w #$0000

.branch01A05F
#_01A05F: PHY

; check if we have any of item
#_01A060: LDA.w $0780,Y
#_01A063: TAX
#_01A064: AND.w #$FF00
#_01A067: BEQ .dont_use

; check if it's a useable item
#_01A069: TXA
#_01A06A: AND.w #$00FF
#_01A06D: CMP.w #$00B0
#_01A070: BCC .dont_use

; get index of item's 
#_01A072: SEC
#_01A073: SBC.w #$00B0

#_01A076: LDY.w #$0000
#_01A079: JSL GetUseItemStat

#_01A07D: AND.w #$0080
#_01A080: BEQ .dont_use

#_01A082: LDA.w $0694
#_01A085: CMP.w $0690
#_01A088: BEQ .branch01A0B9

#_01A08A: INC.w $0694

.dont_use
#_01A08D: PLY
#_01A08E: INY
#_01A08F: INY
#_01A090: CPY.w #$003C
#_01A093: BCC .branch01A05F

#_01A095: BCS .branch01A0B6

.branch01A097
#_01A097: LDY.w #$0000

.branch010A9A
#_01A09A: PHY

#_01A09B: LDA.w $0780,Y
#_01A09E: JSR routine01A106
#_01A0A1: BCS .branch01A0AE

#_01A0A3: LDA.w $0694
#_01A0A6: CMP.w $0690
#_01A0A9: BEQ .branch01A0B9

#_01A0AB: INC.w $0694

.branch01A0AE
#_01A0AE: PLY
#_01A0AF: INY
#_01A0B0: INY
#_01A0B1: CPY.w #$003C
#_01A0B4: BCC .branch010A9A

.branch01A0B6
#_01A0B6: JMP .branch01A0B6

;---------------------------------------------------------------------------------------------------

.branch01A0B9
#_01A0B9: PLY

#_01A0BA: LDA.w $0780,Y

#_01A0BD: STY.w $0694

#_01A0C0: AND.w #$00FF
#_01A0C3: LDX.w $0715

; Set character to using this item
#_01A0C6: STA.w $1058,X

; Remember the index
#_01A0C9: LDA.w $0694
#_01A0CC: XBA
#_01A0CD: ORA.w $1058,X
#_01A0D0: STA.w $1058,X

; get another stat
#_01A0D3: AND.w #$00FF
#_01A0D6: SEC
#_01A0D7: SBC.w #$00B0
#_01A0DA: LDY.w #$0002
#_01A0DD: JSL GetUseItemStat
#_01A0E1: AND.w #$FF00
#_01A0E4: BPL .branch01A104

#_01A0E6: CMP.w #$FF00
#_01A0E9: BEQ .branch01A104

#_01A0EB: LDX.w $06E1
#_01A0EE: PHX
#_01A0EF: LDY.w $0688
#_01A0F2: PHY
#_01A0F3: JSL routine01FCFC
#_01A0F7: PLY
#_01A0F8: STY.w $0688
#_01A0FB: PLX
#_01A0FC: STX.w $06E1
#_01A0FF: BCC .branch01A104

#_01A101: JMP .branch01A01D

.branch01A104
#_01A104: CLC
#_01A105: RTS

;===================================================================================================

routine01A106:
#_01A106: TAX
#_01A107: AND.w #$FF00
#_01A10A: BEQ .branch01A174

#_01A10C: TXA
#_01A10D: AND.w #$00FF
#_01A110: CMP.w #$00B0
#_01A113: BCC .branch01A174

#_01A115: SEC
#_01A116: SBC.w #$00B0
#_01A119: LDY.w #$0000
#_01A11C: JSL GetUseItemStat
#_01A120: AND.w #$0040
#_01A123: BEQ .branch01A174

#_01A125: LDY.w #$0000

.branch01a128
#_01A128: STY.w $0696
#_01A12B: LDA.w $0700,Y
#_01A12E: BMI .branch01A172

#_01A130: CMP.w #$0180
#_01A133: BCS .branch01A168

#_01A135: CMP.w $0715
#_01A138: BEQ .branch01A168

#_01A13A: TAY
#_01A13B: LDA.w $1008,Y
#_01A13E: AND.w #$0008
#_01A141: BEQ .branch01A168

#_01A143: LDA.w $1058,Y
#_01A146: XBA
#_01A147: AND.w #$00FF
#_01A14A: STA.w $0698
#_01A14D: TSC
#_01A14E: INC A
#_01A14F: INC A
#_01A150: INC A
#_01A151: TAY
#_01A152: LDA.w $0000,Y
#_01A155: CMP.w $0698
#_01A158: BNE .branch01A168

#_01A15A: TXA
#_01A15B: XBA

#_01A15C: SEP #$20
#_01A15E: DEC A

#_01A15F: REP #$20
#_01A161: XBA
#_01A162: TAX
#_01A163: AND.w #$FF00
#_01A166: BEQ .branch01A174

.branch01A168
#_01A168: LDY.w $0696
#_01A16B: INY
#_01A16C: INY
#_01A16D: CPY.w #$000C
#_01A170: BCC .branch01a128

.branch01A172
#_01A172: CLC
#_01A173: RTS

.branch01A174
#_01A174: SEC
#_01A175: RTS

;===================================================================================================

routine01A176:
#_01A176: PHP
#_01A177: PHB
#_01A178: PHK
#_01A179: PLB

#_01A17A: REP #$30
#_01A17C: LDA.w $0A26
#_01A17F: PHA
#_01A180: LDA.w #$0003
#_01A183: STA.w $0A26
#_01A186: JSR ITEM_Equip
#_01A189: PLA
#_01A18A: STA.w $0A26
#_01A18D: PLB
#_01A18E: PLP
#_01A18F: RTL

;===================================================================================================

ITEM_Equip:
#_01A190: STZ.w $06E1

.branch01A193
#_01A193: LDA.w #$0024
#_01A196: JSL DisplaySystemMessage
#_01A19A: STZ.w $0690
#_01A19D: LDX.w #$0000

.branch01A1A0
#_01A1A0: STX.w $0692
#_01A1A3: BIT.w $1000,X
#_01A1A6: BVC .branch01A1FE

#_01A1A8: LDA.w $1002,X
#_01A1AB: AND.w #$E000
#_01A1AE: BNE .branch01A1FE

#_01A1B0: LDA.w $0690
#_01A1B3: ASL A
#_01A1B4: TAY
#_01A1B5: TXA
#_01A1B6: STA.w $0694,Y
#_01A1B9: LDA.w $1004,X
#_01A1BC: LDX.w #$0014
#_01A1BF: LDY.w #$0000
#_01A1C2: JSL GetHeroName
#_01A1C6: LDA.w $0690
#_01A1C9: CLC
#_01A1CA: ADC.w #$0002
#_01A1CD: JSL routine00BA70
#_01A1D1: LDA.w $0690
#_01A1D4: ASL A
#_01A1D5: ASL A
#_01A1D6: ASL A
#_01A1D7: ASL A
#_01A1D8: ASL A
#_01A1D9: ASL A
#_01A1DA: CLC
#_01A1DB: ADC.w #$3E05
#_01A1DE: STA.w $0102
#_01A1E1: SEC
#_01A1E2: SBC.w #$0020
#_01A1E5: STA.w $0116
#_01A1E8: LDA.w #$0008
#_01A1EB: STA.w $0104
#_01A1EE: STA.w $0118
#_01A1F1: LDA.w #$0002
#_01A1F4: STA.w $0100
#_01A1F7: JSL AddSelfAsVector
#_01A1FB: INC.w $0690

.branch01A1FE
#_01A1FE: LDA.w $0692
#_01A201: CLC
#_01A202: ADC.w #$0060
#_01A205: TAX
#_01A206: CMP.w #$0180
#_01A209: BCC .branch01A1A0

#_01A20B: LDA.w $0690
#_01A20E: DEC A

#_01A20F: SEP #$20
#_01A211: STA.w $09F1
#_01A214: STZ.w $09F0
#_01A217: LDA.b #$0B
#_01A219: STA.w $09F4
#_01A21C: STZ.w $09F2
#_01A21F: LDA.w $06E1
#_01A222: STA.w $09F3
#_01A225: JSL routine02C8E9
#_01A229: LDA.w $09F3
#_01A22C: BPL .branch01A231

#_01A22E: REP #$30
#_01A230: RTS

.branch01A231
#_01A231: STA.w $06E1

#_01A234: REP #$30
#_01A236: AND.w #$00FF
#_01A239: ASL A
#_01A23A: TAY
#_01A23B: LDA.w $0694,Y
#_01A23E: STA.w $0715
#_01A241: LDY.w #$0000

.branch01A244
#_01A244: CMP.w $0700,Y
#_01A247: BEQ .branch01A250

#_01A249: INY
#_01A24A: INY
#_01A24B: CPY.w #$000C
#_01A24E: BCC .branch01A244

.branch01A250
#_01A250: STA.w $0720
#_01A253: STZ.w $0688
#_01A256: JSR GetEquippableItems
#_01A259: LDA.w $068A
#_01A25C: BEQ .branch01A29B

#_01A25E: JSR routine01A2A5

#_01A261: REP #$30
#_01A263: LDA.w $0400
#_01A266: AND.w #$0100
#_01A269: BNE .branch01A27E

#_01A26B: LDA.w #$0000
#_01A26E: JSL RunOpenMenuDMA_Xplus6
#_01A272: JSL TriggerMenuGrow
#_01A276: JSL WriteMoneyToHUD
#_01A27A: JSL WriteMAGToHUD

.branch01A27E
#_01A27E: JSL routine00A056

#_01A282: SEP #$30
#_01A284: LDA.w $0404
#_01A287: BNE .branch01A296

#_01A289: LDA.w $0711
#_01A28C: AND.b #$0F
#_01A28E: CMP.b #$0A
#_01A290: BNE .branch01A296

#_01A292: JSL RoomEvent_0A_SignA_long

.branch01A296
#_01A296: REP #$30
#_01A298: JMP .branch01A193

.branch01A29B
#_01A29B: LDA.w #$0023
#_01A29E: JSL DisplaySystemMessage
#_01A2A2: JMP .branch01A193

routine01A2A5:
#_01A2A5: PHP
#_01A2A6: SEP #$20
#_01A2A8: LDA.w $0404
#_01A2AB: BEQ .branch01A2B1

#_01A2AD: JSL routine029160

.branch01A2B1
#_01A2B1: PLP
#_01A2B2: JSR CopyFontIntoWRAM

#_01A2B5: SEP #$30
#_01A2B7: LDA.b #$00
#_01A2B9: STA.w $0F07
#_01A2BC: LDA.b #$6C
#_01A2BE: STA.w $0F08
#_01A2C1: LDA.b #$01
#_01A2C3: JSL SomeOtherDMAsFromE80

#_01A2C7: REP #$30
#_01A2C9: STZ.w $0F4F
#_01A2CC: STZ.w $0F4D
#_01A2CF: JSL HideTheMenu
#_01A2D3: JSL UpdateUWLabel
#_01A2D7: JSL UpdateDialogBox
#_01A2DB: JSL routine018EAF

#_01A2DF: SEP #$30
#_01A2E1: LDA.b #$0D
#_01A2E3: JSL PrepHDMAtypeFromA
#_01A2E7: LDA.b #$1D
#_01A2E9: STA.w TM
#_01A2EC: STA.w $0F74
#_01A2EF: LDA.b #$46
#_01A2F1: STA.w BG12NBA
#_01A2F4: JSR routine0164AE
#_01A2F7: JSR AddEquipmentText

#_01A2FA: SEP #$30
#_01A2FC: STZ.w BG1VOFS
#_01A2FF: STZ.w BG1VOFS
#_01A302: LDA.b #$1F
#_01A304: STA.w TM
#_01A307: STA.w $0F74
#_01A30A: JSL routine018F11
#_01A30E: LDA.w $0F4B
#_01A311: STA.w BG12NBA
#_01A314: LDA.w $0F0D
#_01A317: AND.b #$EF
#_01A319: STA.w $0F0D
#_01A31C: STA.w $0F0E
#_01A31F: JSL routine00C51A
#_01A323: PHP
#_01A324: SEP #$20
#_01A326: LDA.w $0404
#_01A329: BEQ .branch01A32F

#_01A32B: JSL routine02913E

.branch01A32F
#_01A32F: PLP
#_01A330: RTS

;===================================================================================================
; TODO seems more general handling the entire equip menu?
AddEquipmentText:
#_01A331: STZ.w $06E2

.branch01A334
#_01A334: JSR CleanEquipmentVTiles
#_01A337: STZ.w $0690

.branch01A33A
#_01A33A: LDA.w $0688 ; looks like scroll stuff
#_01A33D: BEQ .branch01A34A

#_01A33F: TAX
#_01A340: LDA.w #$0000

.branch01A343
#_01A343: CLC
#_01A344: ADC.w #$000A
#_01A347: DEX
#_01A348: BNE .branch01A343

.branch01A34A
#_01A34A: CLC
#_01A34B: ADC.w $0690
#_01A34E: ASL A
#_01A34F: TAY
#_01A350: LDA.w $06A0,Y
#_01A353: BMI .done ; FFFF = done

#_01A355: JSR WriteItemNameAndAmt
#_01A358: LDA.w $0690
#_01A35B: ASL A
#_01A35C: ASL A
#_01A35D: ASL A
#_01A35E: ASL A
#_01A35F: ASL A
#_01A360: ASL A
#_01A361: CLC
#_01A362: ADC.w #$3883 ; VRAM write address
#_01A365: STA.w $0102
#_01A368: SEC
#_01A369: SBC.w #$0020
#_01A36C: STA.w $011C
#_01A36F: LDA.w #$000B
#_01A372: STA.w $0104
#_01A375: STA.w $011E
#_01A378: LDA.w #$0002
#_01A37B: STA.w $0100
#_01A37E: JSL AddSelfAsVector
#_01A382: INC.w $0690
#_01A385: LDA.w $0690
#_01A388: CMP.w #$000A ; 10 lines max
#_01A38B: BCS .done

#_01A38D: JMP .branch01A33A

.done
#_01A390: LDA.w $0690
#_01A393: DEC A

#_01A394: SEP #$20
#_01A396: STA.w $09F1
#_01A399: STZ.w $09F0
#_01A39C: LDA.b #$8C
#_01A39E: STA.w $09F4
#_01A3A1: STZ.w $09F2
#_01A3A4: LDA.w $06E2
#_01A3A7: STA.w $09F3

.branch01A3AA
#_01A3AA: SEP #$20
#_01A3AC: JSL routine02C8E9
#_01A3B0: LDA.w $09F8
#_01A3B3: AND.b #$3F
#_01A3B5: BNE .branch01A3C0

#_01A3B7: LDA.w $09F3
#_01A3BA: BPL .branch01A43A

#_01A3BC: REP #$30
#_01A3BE: SEC
#_01A3BF: RTS

.branch01A3C0
#_01A3C0: LDA.w $09F3
#_01A3C3: BPL .branch01A412

#_01A3C5: LDA.w $09F1
#_01A3C8: STA.w $09F3

#_01A3CB: REP #$30
#_01A3CD: DEC.w $0688
#_01A3D0: BPL .branch01A3EC

#_01A3D2: LDA.w #$0002
#_01A3D5: LDX.w $068A
#_01A3D8: CPX.w #$0015
#_01A3DB: BCS .branch01A3E4

#_01A3DD: DEC A
#_01A3DE: CPX.w #$000B
#_01A3E1: BCS .branch01A3E4

#_01A3E3: DEC A

.branch01A3E4
#_01A3E4: STA.w $0688
#_01A3E7: CMP.w #$0000
#_01A3EA: BEQ .branch01A3AA

.branch01A3EC
#_01A3EC: LDA.w #$0009
#_01A3EF: LDX.w $0688
#_01A3F2: BEQ .branch01A40C

#_01A3F4: LDA.w $068A
#_01A3F7: SEC
#_01A3F8: SBC.w #$000B
#_01A3FB: CPX.w #$0001
#_01A3FE: BEQ .branch01A404

#_01A400: SEC
#_01A401: SBC.w #$000A

.branch01A404
#_01A404: CMP.w #$000A
#_01A407: BCC .branch01A40C

#_01A409: LDA.w #$0009

.branch01A40C
#_01A40C: STA.w $06E2
#_01A40F: JMP .branch01A334

.branch01A412
#_01A412: REP #$20
#_01A414: LDA.w $068A
#_01A417: CMP.w #$000B
#_01A41A: BCC .branch01A3AA

#_01A41C: INC.w $0688
#_01A41F: LDA.w $0688
#_01A422: CMP.w #$0002
#_01A425: BCC .branch01A434

#_01A427: BNE .branch01A431

#_01A429: LDX.w $068A
#_01A42C: CPX.w #$0015
#_01A42F: BCS .branch01A434

.branch01A431
#_01A431: STZ.w $0688

.branch01A434
#_01A434: STZ.w $06E2
#_01A437: JMP .branch01A334

.branch01A43A
#_01A43A: STA.w $06E2

#_01A43D: REP #$30
#_01A43F: AND.w #$00FF
#_01A442: LDX.w $0688
#_01A445: BEQ .branch01A44E

.branch01A447
#_01A447: CLC
#_01A448: ADC.w #$000A
#_01A44B: DEX
#_01A44C: BNE .branch01A447

.branch01A44E
#_01A44E: STA.w $0690
#_01A451: ASL A
#_01A452: TAY
#_01A453: LDA.w $06A0,Y
#_01A456: STA.w $0692
#_01A459: STZ.w $0694
#_01A45C: LDY.w #$0000

.next_item
#_01A45F: PHY
#_01A460: LDA.w $0780,Y
#_01A463: TAX
#_01A464: AND.w #$FF00
#_01A467: BEQ .to_next_item

#_01A469: TXA
#_01A46A: AND.w #$00FF
#_01A46D: CMP.w #$00B0
#_01A470: BCS .to_next_item

#_01A472: LDY.w #$0000
#_01A475: JSL GetEquipmentStat
#_01A479: LDY.w $0715
#_01A47C: BIT.w #$0080
#_01A47F: BNE .is_male_equipment

#_01A481: CPY.w #$0060
#_01A484: BNE .to_next_item

.is_male_equipment
#_01A486: BIT.w #$0040
#_01A489: BNE .is_female_equipment

#_01A48B: CPY.w #$0060
#_01A48E: BEQ .to_next_item

.is_female_equipment
#_01A490: LDA.w $0694
#_01A493: CMP.w $0690
#_01A496: BEQ .branch01A4A6

#_01A498: INC.w $0694

.to_next_item
#_01A49B: PLY
#_01A49C: INY
#_01A49D: INY
#_01A49E: CPY.w #$003C
#_01A4A1: BCC .next_item

;---------------------------------------------------------------------------------------------------

.branch01A4A3
#_01A4A3: JMP .branch01A4A3

.branch01A4A6
#_01A4A6: PLY
#_01A4A7: STY.w $0690
#_01A4AA: LDA.w $0780,Y
#_01A4AD: CMP.w $0692
#_01A4B0: BNE .branch01A4A3

#_01A4B2: AND.w #$00FF
#_01A4B5: LDX.w #$0000

.branch01A4B8
#_01A4B8: CMP.l EquipmentSlotCutOffs,X
#_01A4BC: BCC .branch01A4C7

#_01A4BE: INX
#_01A4BF: INX
#_01A4C0: CPX.w #$000E
#_01A4C3: BCC .branch01A4B8

#_01A4C5: BCS .branch01A4A3

.branch01A4C7
#_01A4C7: TXA
#_01A4C8: STA.w $0696
#_01A4CB: JSR routine01A62A
#_01A4CE: BCC .branch01A4D3

#_01A4D0: JMP .branch01A334

.branch01A4D3
#_01A4D3: JSR routine01A68B
#_01A4D6: BCC .branch01A4DB

#_01A4D8: JMP .branch01A334

.branch01A4DB
#_01A4DB: JSR routine01A6C1
#_01A4DE: BCC .branch01A4E3

#_01A4E0: JMP .branch01A334

.branch01A4E3
#_01A4E3: LDY.w $0690
#_01A4E6: LDA.w $0696
#_01A4E9: CLC
#_01A4EA: ADC.w $0715
#_01A4ED: TAX
#_01A4EE: LDA.w $1042,X
#_01A4F1: PHA
#_01A4F2: LDA.w $0780,Y
#_01A4F5: AND.w #$00FF
#_01A4F8: STA.w $1042,X
#_01A4FB: JSL routine01AAFD
#_01A4FF: PLA
#_01A500: BMI .branch01A557

#_01A502: STA.w $0694
#_01A505: LDY.w #$0000

.branch01A508
#_01A508: LDA.w $0780,Y
#_01A50B: TAX
#_01A50C: AND.w #$FF00
#_01A50F: BEQ .branch01A52F

#_01A511: TXA
#_01A512: AND.w #$00FF
#_01A515: CMP.w $0694
#_01A518: BNE .branch01A52F

#_01A51A: LDA.w $0780,Y
#_01A51D: XBA

#_01A51E: SEP #$20
#_01A520: CMP.b #$09
#_01A522: BCS .branch01A52D

#_01A524: INC A

#_01A525: REP #$20
#_01A527: XBA
#_01A528: STA.w $0780,Y
#_01A52B: BRA .branch01A557

.branch01A52D
#_01A52D: REP #$20

.branch01A52F
#_01A52F: INY
#_01A530: INY
#_01A531: CPY.w #$003C
#_01A534: BCC .branch01A508

#_01A536: LDY.w #$0000

.branch01A539
#_01A539: LDA.w $0780,Y
#_01A53C: TAX
#_01A53D: AND.w #$FF00
#_01A540: BNE .branch01A54D

#_01A542: LDA.w $0694
#_01A545: ORA.w #$0100
#_01A548: STA.w $0780,Y
#_01A54B: BRA .branch01A557

.branch01A54D
#_01A54D: INY
#_01A54E: INY
#_01A54F: CPY.w #$003C
#_01A552: BCC .branch01A539

#_01A554: JSR ThisRoutineDoesLiterallyNothingButReturn

.branch01A557
#_01A557: JSL routine01A700
#_01A55B: LDA.w $0696
#_01A55E: LSR A
#_01A55F: JSR routine01899E
#_01A562: LDX.w $0715
#_01A565: JSL UpdatePlayerStats
#_01A569: LDA.w #$0000

.branch01A56C
#_01A56C: JSR routine0189FF
#_01A56F: LDA.w $071C
#_01A572: INC A
#_01A573: CMP.w #$0006
#_01A576: BCC .branch01A56C

#_01A578: LDA.w #$0000

.branch01A57B
#_01A57B: JSR routine018B30
#_01A57E: LDA.w $071C
#_01A581: INC A
#_01A582: CMP.w #$0006
#_01A585: BCC .branch01A57B

#_01A587: JSR routine018967
#_01A58A: JSL routine00A17E
#_01A58E: STZ.w $0EFB
#_01A591: JSR GetEquippableItems
#_01A594: LDA.w $0688
#_01A597: BEQ .branch01A5A4

#_01A599: TAX
#_01A59A: LDA.w #$0000

.branch01A59D
#_01A59D: CLC
#_01A59E: ADC.w #$000A
#_01A5A1: DEX
#_01A5A2: BNE .branch01A59D

.branch01A5A4
#_01A5A4: SEP #$20
#_01A5A6: CLC
#_01A5A7: ADC.w $06E2

#_01A5AA: REP #$20
#_01A5AC: CMP.w $068A
#_01A5AF: BCC .branch01A5C5

#_01A5B1: SEP #$20
#_01A5B3: DEC.w $06E2
#_01A5B6: BPL .branch01A5C5

#_01A5B8: REP #$20
#_01A5BA: DEC.w $0688
#_01A5BD: BMI .branch01A5CA

#_01A5BF: LDA.w #$0009
#_01A5C2: STA.w $06E2

.branch01A5C5
#_01A5C5: REP #$20

#_01A5C7: JMP .branch01A334

.branch01A5CA
#_01A5CA: SEC

#_01A5CB: RTS

;===================================================================================================

EquipmentSlotCutOffs:
#_01A5CC: dw $0040 ; sword
#_01A5D4: dw $0050 ; gun
#_01A5D4: dw $0060 ; bullet
#_01A5D4: dw $0078 ; head
#_01A5D4: dw $0090 ; body
#_01A5D4: dw $00A0 ; leg
#_01A5D4: dw $00B0 ; arm

;===================================================================================================

GetEquippableItems:
#_01A5DA: JSL ClearEntityListBuffer
#_01A5DE: STZ.w $068A
#_01A5E1: LDY.w #$0000

.nextitem
#_01A5E4: PHY
#_01A5E5: LDA.w $0780,Y
#_01A5E8: TAX
#_01A5E9: AND.w #$FF00 ; See if we have more than 0 of item
#_01A5EC: BEQ .skipitem

#_01A5EE: TXA
#_01A5EF: AND.w #$00FF ; now check the item ID
#_01A5F2: CMP.w #$00B0 ; Equippable items 00-AF
#_01A5F5: BCS .skipitem

#_01A5F7: LDY.w #$0000
#_01A5FA: JSL GetEquipmentStat
#_01A5FE: LDY.w $0715
#_01A601: BIT.w #$0080 ; these items can definitely be used
#_01A604: BNE .branch01A60B

#_01A606: CPY.w #$0060 ; otherwise they're female mc only
#_01A609: BNE .skipitem

.branch01A60B
#_01A60B: BIT.w #$0040 ; and then of those, these can be used
#_01A60E: BNE .additem

#_01A610: CPY.w #$0060 ; female mc again
#_01A613: BEQ .skipitem ; this time she can't use them

.additem
#_01A615: LDA.w $068A
#_01A618: ASL A
#_01A619: TAY
#_01A61A: TXA
#_01A61B: STA.w $06A0,Y
#_01A61E: INC.w $068A

.skipitem
#_01A621: PLY
#_01A622: INY
#_01A623: INY
#_01A624: CPY.w #$003C
#_01A627: BCC .nextitem

#_01A629: RTS

;===================================================================================================

routine01A62A:
#_01A62A: LDY.w $0690
#_01A62D: LDA.w $0780,Y
#_01A630: AND.w #$FF00
#_01A633: CMP.w #$0100
#_01A636: BEQ .branch01A689

#_01A638: LDA.w $0696
#_01A63B: CLC
#_01A63C: ADC.w $0715
#_01A63F: TAX
#_01A640: LDA.w $1042,X
#_01A643: BMI .branch01A689

#_01A645: STA.w $0694
#_01A648: LDY.w #$0000

.branch01A64B
#_01A64B: LDA.w $0780,Y
#_01A64E: TAX
#_01A64F: AND.w #$FF00
#_01A652: BEQ .branch01A65F

#_01A654: TXA
#_01A655: AND.w #$00FF
#_01A658: CMP.w $0694
#_01A65B: BEQ .branch01A689

#_01A65D: REP #$20

.branch01A65F
#_01A65F: INY
#_01A660: INY
#_01A661: CPY.w #$003C
#_01A664: BCC .branch01A64B

#_01A666: LDY.w #$0000

.branch01A669
#_01A669: LDA.w $0780,Y
#_01A66C: TAX
#_01A66D: AND.w #$FF00
#_01A670: BEQ .branch01A689

#_01A672: INY
#_01A673: INY
#_01A674: CPY.w #$003C
#_01A677: BCC .branch01A669

#_01A679: JSR routine01B10A
#_01A67C: LDA.w #$0010
#_01A67F: JSL RunOpenMenuDMA_X
#_01A683: JSL Update19XXUntilInput
#_01A687: SEC
#_01A688: RTS

.branch01A689
#_01A689: CLC
#_01A68A: RTS

;===================================================================================================

routine01A68B:
#_01A68B: LDA.w $0696
#_01A68E: CLC
#_01A68F: ADC.w $0715
#_01A692: TAX
#_01A693: LDA.w $1042,X
#_01A696: BMI .branch01A6BF

#_01A698: LDY.w #$0008
#_01A69B: JSL GetEquipmentStat
#_01A69F: AND.w #$0100
#_01A6A2: BEQ .branch01A6BF

#_01A6A4: LDX.w $0715
#_01A6A7: LDA.w $1002,X
#_01A6AA: AND.w #$0100
#_01A6AD: BEQ .branch01A6BF

#_01A6AF: JSR routine01B10A
#_01A6B2: LDA.w #$0011
#_01A6B5: JSL RunOpenMenuDMA_X
#_01A6B9: JSL Update19XXUntilInput
#_01A6BD: SEC
#_01A6BE: RTS

.branch01A6BF
#_01A6BF: CLC
#_01A6C0: RTS

;===================================================================================================

routine01A6C1:
#_01A6C1: LDY.w $0690
#_01A6C4: LDA.w $0780,Y
#_01A6C7: AND.w #$00FF
#_01A6CA: LDY.w #$0000
#_01A6CD: JSL GetEquipmentStat
#_01A6D1: PHA
#_01A6D2: LDY.w #$0000
#_01A6D5: LDX.w $0715
#_01A6D8: LDA.w $101C,X
#_01A6DB: CMP.w #$0070
#_01A6DE: BCC .branch01A6E7

#_01A6E0: INY
#_01A6E1: CMP.w #$0091
#_01A6E4: BCC .branch01A6E7

#_01A6E6: INY

.branch01A6E7
#_01A6E7: PLA

.branch01A6E8
#_01A6E8: LSR A
#_01A6E9: DEY
#_01A6EA: BPL .branch01A6E8
#_01A6EC: BCS .branch01A6FE

#_01A6EE: JSR routine01B10A
#_01A6F1: LDA.w #$0012
#_01A6F4: JSL RunOpenMenuDMA_X
#_01A6F8: JSL Update19XXUntilInput
#_01A6FC: SEC
#_01A6FD: RTS

.branch01A6FE
#_01A6FE: CLC
#_01A6FF: RTS

;===================================================================================================
; TODO something with stats and equipment idk
;===================================================================================================
routine01A700:
#_01A700: PHP
#_01A701: REP #$30
#_01A703: LDA.w #$0000

.branch01A706
#_01A706: STA.w $0698
#_01A709: CLC
#_01A70A: ADC.w $0715
#_01A70D: TAX
#_01A70E: LDA.w $1010,X
#_01A711: SEC
#_01A712: SBC.w $1036,X
#_01A715: STA.w $1010,X
#_01A718: STZ.w $1036,X
#_01A71B: LDA.w $0698
#_01A71E: INC A
#_01A71F: INC A
#_01A720: CMP.w #$000C
#_01A723: BCC .branch01A706

#_01A725: LDA.w #$0000

.branch01A728
#_01A728: STA.w $0698
#_01A72B: LDA.w #$0000

.branch01A72E
#_01A72E: STA.w $069A
#_01A731: CLC
#_01A732: ADC.w #$0004
#_01A735: TAY
#_01A736: LDA.w $0698
#_01A739: CLC
#_01A73A: ADC.w $0715
#_01A73D: TAX
#_01A73E: LDA.w $1042,X
#_01A741: BMI .branch01A776

#_01A743: JSL GetEquipmentStat
#_01A747: PHA
#_01A748: LDA.w $069A
#_01A74B: ASL A
#_01A74C: ASL A
#_01A74D: CLC
#_01A74E: ADC.w $0715
#_01A751: TAX
#_01A752: PLA
#_01A753: TAY
#_01A754: LSR A
#_01A755: LSR A
#_01A756: LSR A
#_01A757: LSR A
#_01A758: AND.w #$000F
#_01A75B: CLC
#_01A75C: ADC.w $1036,X
#_01A75F: STA.w $1036,X
#_01A762: TYA
#_01A763: AND.w #$000F
#_01A766: CLC
#_01A767: ADC.w $1038,X
#_01A76A: STA.w $1038,X
#_01A76D: LDA.w $069A
#_01A770: INC A
#_01A771: CMP.w #$0003
#_01A774: BCC .branch01A72E

.branch01A776
#_01A776: LDA.w $0698
#_01A779: INC A
#_01A77A: INC A
#_01A77B: CMP.w #$000E
#_01A77E: BCC .branch01A728

#_01A780: LDA.w #$0000

.branch01A783
#_01A783: STA.w $0698
#_01A786: CLC
#_01A787: ADC.w $0715
#_01A78A: TAX
#_01A78B: LDA.w $1010,X
#_01A78E: CLC
#_01A78F: ADC.w $1036,X
#_01A792: STA.w $1010,X
#_01A795: CMP.w #$0028
#_01A798: BEQ .branch01A7B3

#_01A79A: BCC .branch01A7B3

#_01A79C: SEC
#_01A79D: SBC.w #$0028
#_01A7A0: STA.w $069A
#_01A7A3: LDA.w $1036,X
#_01A7A6: SEC
#_01A7A7: SBC.w $069A
#_01A7AA: STA.w $1036,X
#_01A7AD: LDA.w #$0028
#_01A7B0: STA.w $1010,X

.branch01A7B3
#_01A7B3: LDA.w $0698
#_01A7B6: INC A
#_01A7B7: INC A
#_01A7B8: CMP.w #$000C
#_01A7BB: BCC .branch01A783

#_01A7BD: LDY.w #$0008
#_01A7C0: LDA.w $0692
#_01A7C3: BMI .EXIT_01A7E9

#_01A7C5: AND.w #$00FF
#_01A7C8: CMP.w #$0050
#_01A7CB: BCC .branch01A7D2

#_01A7CD: CMP.w #$0060
#_01A7D0: BCC .EXIT_01A7E9

.branch01A7D2
#_01A7D2: JSL GetEquipmentStat
#_01A7D6: LDX.w $0715
#_01A7D9: BIT.w #$0004
#_01A7DC: BEQ .EXIT_01A7E3

#_01A7DE: LDY.w $1034,X
#_01A7E1: BEQ .EXIT_01A7E9

.EXIT_01A7E3
#_01A7E3: ORA.w $1002,X
#_01A7E6: STA.w $1002,X

.EXIT_01A7E9
#_01A7E9: PLP
#_01A7EA: RTL

ThisRoutineDoesLiterallyNothingButReturn:
#_01A7EB: RTS

;===================================================================================================

ITEM_Discard:
#_01A7EC: STZ.w $06E4
#_01A7EF: STZ.w $06E8
#_01A7F2: STZ.w $0688
#_01A7F5: JSR routine01A8D1
#_01A7F8: LDA.w $068A
#_01A7FB: BNE .branch01A805

#_01A7FD: LDA.w #$0020
#_01A800: JSL DisplaySystemMessage
#_01A804: RTS

.branch01A805
#_01A805: LDA.w #$0026
#_01A808: JSL DisplaySystemMessage
#_01A80C: JSR routine01A903
#_01A80F: BCC .branch01A812

#_01A811: RTS

.branch01A812
#_01A812: STA.w $06E4
#_01A815: ASL A
#_01A816: CLC
#_01A817: ADC.w $09F2

#_01A81A: REP #$30
#_01A81C: AND.w #$00FF
#_01A81F: LDX.w $0688
#_01A822: BEQ .branch01A82B

.branch01A824
#_01A824: CLC
#_01A825: ADC.w #$000C
#_01A828: DEX
#_01A829: BNE .branch01A824

.branch01A82B
#_01A82B: STA.w $0690
#_01A82E: ASL A
#_01A82F: TAY
#_01A830: LDA.w $06A0,Y
#_01A833: STA.w $0692
#_01A836: STZ.w $0694
#_01A839: LDY.w #$0000

.branch01A83C
#_01A83C: PHY
#_01A83D: LDA.w $0780,Y
#_01A840: TAX
#_01A841: AND.w #$FF00
#_01A844: BEQ .branch01A85A

#_01A846: TXA
#_01A847: AND.w #$00FF
#_01A84A: CMP.w #$00F0
#_01A84D: BCS .branch01A85A

#_01A84F: LDA.w $0694
#_01A852: CMP.w $0690
#_01A855: BEQ .branch01A865

#_01A857: INC.w $0694

.branch01A85A
#_01A85A: PLY
#_01A85B: INY
#_01A85C: INY
#_01A85D: CPY.w #$003C
#_01A860: BCC .branch01A83C

.branch01A862
#_01A862: JMP .branch01A862

.branch01A865
#_01A865: PLY
#_01A866: LDA.w $0780,Y
#_01A869: CMP.w $0692
#_01A86C: BNE .branch01A862

#_01A86E: AND.w #$00FF
#_01A871: STA.w $0A50
#_01A874: STY.w $0694
#_01A877: LDA.w #$0028
#_01A87A: JSL DisplaySystemMessage

#_01A87E: SEP #$20
#_01A880: LDA.w $09F3
#_01A883: BNE .branch01A8CA

#_01A885: REP #$20
#_01A887: LDY.w $0694
#_01A88A: LDA.w $0780,Y
#_01A88D: AND.w #$00FF
#_01A890: STA.w $0780,Y
#_01A893: JSR routine01A8D1
#_01A896: LDA.w $0688
#_01A899: BEQ .branch01A8A6

#_01A89B: TAX
#_01A89C: LDA.w #$0000

.branch01A89F
#_01A89F: CLC
#_01A8A0: ADC.w #$000C
#_01A8A3: DEX
#_01A8A4: BNE .branch01A89F

.branch01A8A6
#_01A8A6: SEP #$20
#_01A8A8: CLC
#_01A8A9: ADC.w $06E4
#_01A8AC: ADC.w $06E4

#_01A8AF: REP #$20
#_01A8B1: CMP.w $068A
#_01A8B4: BCC .branch01A8CA

#_01A8B6: SEP #$20
#_01A8B8: DEC.w $06E4
#_01A8BB: BPL .branch01A8CA

#_01A8BD: REP #$20
#_01A8BF: DEC.w $0688
#_01A8C2: BMI .branch01A8CF

#_01A8C4: LDA.w #$0005
#_01A8C7: STA.w $06E4

.branch01A8CA
#_01A8CA: REP #$30
#_01A8CC: JMP .branch01A805

.branch01A8CF
#_01A8CF: SEC
#_01A8D0: RTS

;===================================================================================================

routine01A8D1:
#_01A8D1: JSL ClearEntityListBuffer
#_01A8D5: STZ.w $068A
#_01A8D8: LDY.w #$0000

.branch01A8DB
#_01A8DB: PHY
#_01A8DC: LDA.w $0780,Y
#_01A8DF: TAX
#_01A8E0: AND.w #$FF00
#_01A8E3: BEQ .branch01A8FA

#_01A8E5: TXA
#_01A8E6: AND.w #$00FF
#_01A8E9: CMP.w #$00F0
#_01A8EC: BCS .branch01A8FA

#_01A8EE: LDA.w $068A
#_01A8F1: ASL A
#_01A8F2: TAY
#_01A8F3: TXA
#_01A8F4: STA.w $06A0,Y
#_01A8F7: INC.w $068A

.branch01A8FA
#_01A8FA: PLY
#_01A8FB: INY
#_01A8FC: INY
#_01A8FD: CPY.w #$003C
#_01A900: BCC .branch01A8DB

#_01A902: RTS

;===================================================================================================

routine01A903:
#_01A903: LDA.w #$0002
#_01A906: JSL routine00BAC0
#_01A90A: JSR routine01AABB
#_01A90D: STZ.w $0E88
#_01A910: STZ.w $0690
#_01A913: STZ.w $0692

.branch01A916
#_01A916: LDA.w $0688
#_01A919: BEQ .branch01A926

#_01A91B: TAX
#_01A91C: LDA.w #$0000

.branch01A91F
#_01A91F: CLC
#_01A920: ADC.w #$000C
#_01A923: DEX
#_01A924: BNE .branch01A91F

.branch01A926
#_01A926: CLC
#_01A927: ADC.w $0690
#_01A92A: ASL A
#_01A92B: TAY
#_01A92C: CPY.w #$003C
#_01A92F: BCS .branch01A98F

#_01A931: LDA.w $06A0,Y
#_01A934: BMI .branch01A98F

#_01A936: JSR WriteItemNameAndAmt
#_01A939: LDA.w $0690
#_01A93C: LSR A
#_01A93D: CLC
#_01A93E: ADC.w #$0002
#_01A941: JSL routine00BA70
#_01A945: LDA.w $0690
#_01A948: LSR A
#_01A949: ASL A
#_01A94A: ASL A
#_01A94B: ASL A
#_01A94C: ASL A
#_01A94D: ASL A
#_01A94E: ASL A
#_01A94F: CLC
#_01A950: ADC.w #$3E04
#_01A953: TAX
#_01A954: LDA.w $0690
#_01A957: LSR A
#_01A958: BCC .branch01A966

#_01A95A: TXA
#_01A95B: CLC
#_01A95C: ADC.w #$000C
#_01A95F: TAX
#_01A960: LDA.w #$0001
#_01A963: STA.w $0692

.branch01A966
#_01A966: TXA
#_01A967: STA.w $0102
#_01A96A: SEC
#_01A96B: SBC.w #$0020
#_01A96E: STA.w $011C
#_01A971: LDA.w #$000B
#_01A974: STA.w $0104
#_01A977: STA.w $011E
#_01A97A: LDA.w #$0002
#_01A97D: STA.w $0100
#_01A980: JSL AddSelfAsVector
#_01A984: INC.w $0690
#_01A987: LDA.w $0690
#_01A98A: CMP.w #$000C
#_01A98D: BCC .branch01A916

.branch01A98F
#_01A98F: LDA.w $0690
#_01A992: LSR A
#_01A993: BCS .branch01A996

#_01A995: DEC A

.branch01A996
#_01A996: SEP #$20
#_01A998: STA.w $09F1
#_01A99B: STA.w $09FC
#_01A99E: BCC .branch01A9A3

#_01A9A0: DEC.w $09FC

.branch01A9A3
#_01A9A3: LDA.w $0692
#_01A9A6: STA.w $09F0
#_01A9A9: LDA.b #$8D
#_01A9AB: STA.w $09F4
#_01A9AE: LDA.w $06E8
#_01A9B1: STA.w $09F2
#_01A9B4: LDA.w $06E4
#_01A9B7: STA.w $09F3

.branch01A9BA
#_01A9BA: SEP #$30
#_01A9BC: JSL routine02C8E9

#_01A9C0: SEP #$30
#_01A9C2: LDA.w $09F8
#_01A9C5: AND.b #$3F
#_01A9C7: BNE .branch01A9DA

#_01A9C9: LDA.w $09F3
#_01A9CC: ORA.w $09F2
#_01A9CF: BPL .branch01A9D5

#_01A9D1: REP #$30
#_01A9D3: SEC
#_01A9D4: RTS

.branch01A9D5
#_01A9D5: LDA.w $09F3
#_01A9D8: CLC
#_01A9D9: RTS

.branch01A9DA
#_01A9DA: BIT.w $09F8
#_01A9DD: BVS .branch01A9ED

#_01A9DF: BIT.w $09F2
#_01A9E2: BPL .branch01A9ED

#_01A9E4: LDA.w $09F0
#_01A9E7: STA.w $09F2
#_01A9EA: STA.w $06E8

.branch01A9ED
#_01A9ED: BIT.w $09F8
#_01A9F0: BMI .branch01AA50

#_01A9F2: BIT.w $09F3
#_01A9F5: BPL .branch01A9BA

#_01A9F7: LDA.w $09F1
#_01A9FA: LDX.w $09F2
#_01A9FD: BEQ .branch01AA02

#_01A9FF: LDA.w $09FC

.branch01AA02
#_01AA02: STA.w $09F3

#_01AA05: REP #$30
#_01AA07: DEC.w $0688
#_01AA0A: BPL .branch01AA26

#_01AA0C: LDA.w #$0002
#_01AA0F: LDX.w $068A
#_01AA12: CPX.w #$0019
#_01AA15: BCS .branch01AA1E

#_01AA17: DEC A
#_01AA18: CPX.w #$000D
#_01AA1B: BCS .branch01AA1E

#_01AA1D: DEC A

.branch01AA1E
#_01AA1E: STA.w $0688
#_01AA21: CMP.w #$0000
#_01AA24: BEQ .branch01A9BA

.branch01AA26
#_01AA26: LDA.w #$0005
#_01AA29: LDX.w $0688
#_01AA2C: BEQ .branch01AA4A

#_01AA2E: LDA.w $068A
#_01AA31: LSR A
#_01AA32: ADC.w #$0000
#_01AA35: SEC
#_01AA36: SBC.w #$0007
#_01AA39: CPX.w #$0001
#_01AA3C: BEQ .branch01AA42

#_01AA3E: SEC
#_01AA3F: SBC.w #$0006

.branch01AA42
#_01AA42: CMP.w #$0006
#_01AA45: BCC .branch01AA4A

#_01AA47: LDA.w #$0005

.branch01AA4A
#_01AA4A: STA.w $06E4
#_01AA4D: JMP routine01A903

.branch01AA50
#_01AA50: LDA.w $068A
#_01AA53: LSR A
#_01AA54: BCC .branch01AA59

#_01AA56: STZ.w $06E8

.branch01AA59
#_01AA59: REP #$30
#_01AA5B: LDA.w $068A
#_01AA5E: CMP.w #$000D
#_01AA61: BCS .branch01AA66

#_01AA63: JMP .branch01A9BA

.branch01AA66
#_01AA66: INC.w $0688
#_01AA69: LDA.w $0688
#_01AA6C: CMP.w #$0002
#_01AA6F: BCC .branch01AA7E

#_01AA71: BNE .branch01AA7B

#_01AA73: LDX.w $068A
#_01AA76: CPX.w #$0019
#_01AA79: BCS .branch01AA7E

.branch01AA7B
#_01AA7B: STZ.w $0688

.branch01AA7E
#_01AA7E: STZ.w $06E4
#_01AA81: JMP routine01A903

WriteItemNameAndAmt:
#_01AA84: PHA
#_01AA85: AND.w #$00FF
#_01AA88: LDY.w #$0000
#_01AA8B: LDX.w #$001A
#_01AA8E: JSL GetItemName
#_01AA92: PLA
#_01AA93: XBA
#_01AA94: AND.w #$00FF
#_01AA97: STA.w $0E80
#_01AA9A: LDA.w #$0000
#_01AA9D: STA.w $0E82
#_01AAA0: LDY.w #$0006
#_01AAA3: LDA.w #$0116
#_01AAA6: JSL WriteAmountHEXtoDEC
#_01AAAA: LDY.w #$0006
#_01AAAD: LDA.w #$00CF

.branch01AAB0
#_01AAB0: ORA.w $0EFB
#_01AAB3: STA.w $0130,Y
#_01AAB6: DEY
#_01AAB7: DEY
#_01AAB8: BPL .branch01AAB0

#_01AABA: RTS

;===================================================================================================

routine01AABB:
#_01AABB: LDY.w #$0000
#_01AABE: LDA.w #$00CF

.branch01AAC1
#_01AAC1: ORA.w $0EFB
#_01AAC4: STA.w $0106,Y
#_01AAC7: INY
#_01AAC8: INY
#_01AAC9: CPY.w #$0210
#_01AACC: BCC .branch01AAC1

#_01AACE: REP #$20
#_01AAD0: LDA.w #$000C
#_01AAD3: STA.w $0104
#_01AAD6: LDA.w #$3DE4
#_01AAD9: STA.w $0102
#_01AADC: LDA.w #$8090
#_01AADF: STA.w $0100
#_01AAE2: JSL AddSelfAsVector
#_01AAE6: LDA.w #$000C
#_01AAE9: STA.w $0104
#_01AAEC: LDA.w #$3DF0
#_01AAEF: STA.w $0102
#_01AAF2: LDA.w #$8090
#_01AAF5: STA.w $0100
#_01AAF8: JSL AddSelfAsVector
#_01AAFC: RTS

;===================================================================================================

routine01AAFD:
#_01AAFD: LDA.w $0780,Y
#_01AB00: XBA

#_01AB01: SEP #$20
#_01AB03: DEC A

#_01AB04: REP #$20
#_01AB06: XBA
#_01AB07: STA.w $0780,Y
#_01AB0A: RTL

; TODO need a name, but this seems to handle spells or something
routine01AB0B:
#_01AB0B: LDA.w $0400
#_01AB0E: AND.w #$0040
#_01AB11: BNE .branch01AB7B

.branch01AB13
#_01AB13: STZ.w $0688
#_01AB16: STZ.w $068A
#_01AB19: STZ.w $06E1
#_01AB1C: JSL ClearEntityListBuffer
#_01AB20: LDY.w #$0000

.branch01AB23
#_01AB23: STY.w $0690
#_01AB26: LDX.w $0700,Y
#_01AB29: BMI .branch01AB53

#_01AB2B: BIT.w $1000,X
#_01AB2E: BVC .branch01AB49

#_01AB30: LDA.w $1002,X
#_01AB33: AND.w #$F160
#_01AB36: BNE .branch01AB49

#_01AB38: LDA.w $1034,X
#_01AB3B: BEQ .branch01AB49

#_01AB3D: LDA.w $068A
#_01AB40: ASL A
#_01AB41: TAY
#_01AB42: TXA
#_01AB43: STA.w $06A0,Y
#_01AB46: INC.w $068A

.branch01AB49
#_01AB49: LDY.w $0690
#_01AB4C: INY
#_01AB4D: INY
#_01AB4E: CPY.w #$000C
#_01AB51: BCC .branch01AB23

.branch01AB53
#_01AB53: LDA.w $068A
#_01AB56: BNE .branch01AB61

#_01AB58: LDA.w #$003A
#_01AB5B: JSL DisplaySystemMessage

.branch01AB5F
#_01AB5F: SEC
#_01AB60: RTL

.branch01AB61
#_01AB61: LDA.w #$003B
#_01AB64: JSL DisplaySystemMessage
#_01AB68: JSL routine0190E6
#_01AB6C: BCS .branch01AB5F

#_01AB6E: STA.w $06E1
#_01AB71: ASL A
#_01AB72: TAY

#_01AB73: REP #$30
#_01AB75: LDX.w $06A0,Y
#_01AB78: STX.w $0715

.branch01AB7B
#_01AB7B: STZ.w $068A
#_01AB7E: LDX.w $0715
#_01AB81: LDA.w $1002,X
#_01AB84: AND.w #$0604
#_01AB87: BEQ .branch01ABA3

#_01AB89: LDA.w $1004,X
#_01AB8C: STA.w $0A3E
#_01AB8F: LDA.w #$003E
#_01AB92: JSL DisplayActionMessage

.branch01AB96
#_01AB96: LDA.w $0400
#_01AB99: AND.w #$0040
#_01AB9C: BNE .branch01ABA1
#_01AB9E: JMP .branch01AB13

.branch01ABA1
#_01ABA1: SEC
#_01ABA2: RTL

.branch01ABA3
#_01ABA3: PHX
#_01ABA4: JSL ClearEntityListBuffer
#_01ABA8: PLX

#_01ABA9: CPX.w #$0180
#_01ABAC: BCS .branch01AC01

; Number of spells determined by
; ( (INT / 2) + (Level * 2) + MAG ) / 8
#_01ABAE: LDA.w $1012,X
#_01ABB1: LSR A
#_01ABB2: ADC.w $100A,X
#_01ABB5: ADC.w $100A,X
#_01ABB8: ADC.w $1014,X
#_01ABBB: LSR A
#_01ABBC: LSR A
#_01ABBD: LSR A
#_01ABBE: STA.w $0690
#_01ABC1: LDA.w $1004,X
#_01ABC4: AND.w #$7FFF
#_01ABC7: ASL A
#_01ABC8: TAX
#_01ABC9: LDA.l SkillLearnPointers,X
#_01ABCD: STA.w $00E0

#_01ABD0: PHB
#_01ABD1: PHK
#_01ABD2: PLB

#_01ABD3: LDY.w #$0000

.next_spell
#_01ABD6: STY.w $0692
#_01ABD9: LDA.b ($E0),Y
#_01ABDB: AND.w #$00FF
#_01ABDE: CMP.w #$00FF
#_01ABE1: BEQ .branch01ABFE

#_01ABE3: TAX
#_01ABE4: JSR routine01ACF4
#_01ABE7: BCS .branch01ABF5

#_01ABE9: LDA.w $068A
#_01ABEC: ASL A
#_01ABED: TAY
#_01ABEE: TXA
#_01ABEF: STA.w $06A0,Y
#_01ABF2: INC.w $068A

.branch01ABF5
#_01ABF5: LDY.w $0692
#_01ABF8: INY
#_01ABF9: CPY.w $0690
#_01ABFC: BCC .next_spell

.branch01ABFE
#_01ABFE: PLB
#_01ABFF: BRA .branch01AC33

.branch01AC01
#_01AC01: STX.w $0690
#_01AC04: LDA.w #$0000

.branch01AC07
#_01AC07: STA.w $0692
#_01AC0A: CLC
#_01AC0B: ADC.w $0690
#_01AC0E: TAX
#_01AC0F: LDA.w $103E,X
#_01AC12: CMP.w #$003E
#_01AC15: BCS .branch01AC29

#_01AC17: TAX
#_01AC18: JSR routine01ACF4
#_01AC1B: BCS .branch01AC29

#_01AC1D: LDA.w $068A
#_01AC20: ASL A
#_01AC21: TAY
#_01AC22: TXA
#_01AC23: STA.w $06A0,Y
#_01AC26: INC.w $068A

.branch01AC29
#_01AC29: LDA.w $0692
#_01AC2C: INC A
#_01AC2D: INC A
#_01AC2E: CMP.w #$0006
#_01AC31: BCC .branch01AC07

.branch01AC33
#_01AC33: LDA.w $068A
#_01AC36: BNE .branch01AC42

#_01AC38: LDA.w #$003D
#_01AC3B: JSL DisplayActionMessage
#_01AC3F: JMP .branch01AB96

.branch01AC42
#_01AC42: STZ.w $06E4
#_01AC45: STZ.w $06E8
#_01AC48: STZ.w $0688

#_01AC4B: LDA.w #$003C
#_01AC4E: JSL DisplaySystemMessage
#_01AC52: JSR routine01AD1A
#_01AC55: BCC .valid_selection_made
#_01AC57: JMP .branch01AB96

.valid_selection_made
#_01AC5A: STA.w $06E4
#_01AC5D: ASL A
#_01AC5E: CLC
#_01AC5F: ADC.w $09F2

#_01AC62: REP #$30
#_01AC64: AND.w #$00FF

; Take the inventory page and add 12 for each
; since the menus scroll 12 items at a time
#_01AC67: LDX.w $0688
#_01AC6A: BEQ .no_scroll

.offset_more
#_01AC6C: CLC
#_01AC6D: ADC.w #$000C
#_01AC70: DEX
#_01AC71: BNE .offset_more

.no_scroll
; take item index*2
; put it in the current character's action?
#_01AC73: STA.w $0690
#_01AC76: ASL A
#_01AC77: TAY
#_01AC78: LDA.w $06A0,Y
#_01AC7B: LDX.w $0715
#_01AC7E: STA.w $1058,X

#_01AC81: LDY.w #$0003
#_01AC84: JSL GetSkillProperty
#_01AC88: AND.w #$00FF
#_01AC8B: SEC
#_01AC8C: SBC.w $1032,X
#_01AC8F: EOR.w #$FFFF
#_01AC92: INC A
#_01AC93: BPL .enough_magic

#_01AC95: LDA.w #$0045
#_01AC98: JSL DisplaySystemMessage
#_01AC9C: JMP .branch01AB96

.enough_magic
#_01AC9F: LDX.w $0715
#_01ACA2: LDA.w $1058,X
#_01ACA5: LDY.w #$0001
#_01ACA8: JSL GetSkillProperty
#_01ACAC: AND.w #$FF00
#_01ACAF: BPL .branch01ACCF

#_01ACB1: CMP.w #$FF00
#_01ACB4: BEQ .branch01ACCF

#_01ACB6: LDX.w $06E1
#_01ACB9: PHX
#_01ACBA: LDY.w $0688
#_01ACBD: PHY
#_01ACBE: JSL routine01FCFC
#_01ACC2: PLY
#_01ACC3: STY.w $0688
#_01ACC6: PLX
#_01ACC7: STX.w $06E1
#_01ACCA: BCC .branch01ACCF
#_01ACCC: JMP .branch01AB96

.branch01ACCF
#_01ACCF: LDX.w $0715
#_01ACD2: LDA.w $1058,X
#_01ACD5: CMP.w #$003D ; Spell 3D is something specific?
#_01ACD8: BNE .successful_cast

#_01ACDA: JSL routine019239
#_01ACDE: BCC .branch01ACE3
#_01ACE0: JMP .branch01AB96

.branch01ACE3
#_01ACE3: PHX
#_01ACE4: LDX.w $0715
#_01ACE7: STA.w $105C,X
#_01ACEA: TYA
#_01ACEB: STA.w $105E,X
#_01ACEE: PLA
#_01ACEF: STA.w $105A,X

.successful_cast
#_01ACF2: CLC
#_01ACF3: RTL

;===================================================================================================

routine01ACF4:
#_01ACF4: LDA.w $0400
#_01ACF7: AND.w #$0040
#_01ACFA: BNE .branch01AD0B

#_01ACFC: LDY.w #$0000
#_01ACFF: TXA
#_01AD00: JSL GetSkillProperty
#_01AD04: AND.w #$0080
#_01AD07: BEQ .branch01AD18

.branch01AD09
#_01AD09: CLC
#_01AD0A: RTS

.branch01AD0B
#_01AD0B: LDY.w #$0000
#_01AD0E: TXA
#_01AD0F: JSL GetSkillProperty
#_01AD13: AND.w #$0040
#_01AD16: BNE .branch01AD09

.branch01AD18
#_01AD18: SEC
#_01AD19: RTS

;===================================================================================================

routine01AD1A:
#_01AD1A: LDA.w #$0002
#_01AD1D: JSL routine00BAC0
#_01AD21: JSR routine01AABB
#_01AD24: STZ.w $0E88
#_01AD27: STZ.w $0690
#_01AD2A: STZ.w $0692

.branch01AD2D
#_01AD2D: LDA.w $0688
#_01AD30: BEQ .branch01AD3D

#_01AD32: TAX
#_01AD33: LDA.w #$0000

.branch01AD36
#_01AD36: CLC
#_01AD37: ADC.w #$000C
#_01AD3A: DEX
#_01AD3B: BNE .branch01AD36

.branch01AD3D
#_01AD3D: CLC
#_01AD3E: ADC.w $0690
#_01AD41: ASL A
#_01AD42: TAY
#_01AD43: LDA.w $06A0,Y
#_01AD46: BMI .branch01ADA1

#_01AD48: JSR routine01AE96
#_01AD4B: LDA.w $0690
#_01AD4E: LSR A
#_01AD4F: CLC
#_01AD50: ADC.w #$0002
#_01AD53: JSL routine00BA70
#_01AD57: LDA.w $0690
#_01AD5A: LSR A
#_01AD5B: ASL A
#_01AD5C: ASL A
#_01AD5D: ASL A
#_01AD5E: ASL A
#_01AD5F: ASL A
#_01AD60: ASL A
#_01AD61: CLC
#_01AD62: ADC.w #$3E04
#_01AD65: TAX
#_01AD66: LDA.w $0690
#_01AD69: LSR A
#_01AD6A: BCC .branch01AD78

#_01AD6C: TXA
#_01AD6D: CLC
#_01AD6E: ADC.w #$000C
#_01AD71: TAX
#_01AD72: LDA.w #$0001
#_01AD75: STA.w $0692

.branch01AD78
#_01AD78: TXA
#_01AD79: STA.w $0102
#_01AD7C: SEC
#_01AD7D: SBC.w #$0020
#_01AD80: STA.w $011C
#_01AD83: LDA.w #$000B
#_01AD86: STA.w $0104
#_01AD89: STA.w $011E
#_01AD8C: LDA.w #$0002
#_01AD8F: STA.w $0100
#_01AD92: JSL AddSelfAsVector
#_01AD96: INC.w $0690
#_01AD99: LDA.w $0690
#_01AD9C: CMP.w #$000C
#_01AD9F: BCC .branch01AD2D

.branch01ADA1
#_01ADA1: LDA.w $0690
#_01ADA4: LSR A
#_01ADA5: BCS .branch01ADA8

#_01ADA7: DEC A

.branch01ADA8
#_01ADA8: SEP #$20
#_01ADAA: STA.w $09F1
#_01ADAD: STA.w $09FC
#_01ADB0: BCC .branch01ADB5

#_01ADB2: DEC.w $09FC

.branch01ADB5
#_01ADB5: LDA.w $0692
#_01ADB8: STA.w $09F0
#_01ADBB: LDA.b #$8D
#_01ADBD: STA.w $09F4
#_01ADC0: LDA.w $06E8
#_01ADC3: STA.w $09F2
#_01ADC6: LDA.w $06E4
#_01ADC9: STA.w $09F3

.branch01ADCC
#_01ADCC: SEP #$30
#_01ADCE: JSL routine02C8E9

#_01ADD2: SEP #$30
#_01ADD4: LDA.w $09F8
#_01ADD7: AND.b #$3F
#_01ADD9: BNE .branch01ADEC

#_01ADDB: LDA.w $09F3
#_01ADDE: ORA.w $09F2
#_01ADE1: BPL .valid_inventory_location

#_01ADE3: REP #$30
#_01ADE5: SEC
#_01ADE6: RTS

.valid_inventory_location
#_01ADE7: LDA.w $09F3
#_01ADEA: CLC
#_01ADEB: RTS

.branch01ADEC
#_01ADEC: BIT.w $09F8
#_01ADEF: BVS .branch01ADFF

#_01ADF1: BIT.w $09F2
#_01ADF4: BPL .branch01ADFF

#_01ADF6: LDA.w $09F0
#_01ADF9: STA.w $09F2
#_01ADFC: STA.w $06E8

.branch01ADFF
#_01ADFF: BIT.w $09F8
#_01AE02: BMI .branch01AE62

#_01AE04: BIT.w $09F3
#_01AE07: BPL .branch01ADCC

#_01AE09: LDA.w $09F1
#_01AE0C: LDX.w $09F2
#_01AE0F: BEQ .branch01AE14

#_01AE11: LDA.w $09FC

.branch01AE14
#_01AE14: STA.w $09F3

#_01AE17: REP #$30
#_01AE19: DEC.w $0688
#_01AE1C: BPL .branch01AE38

#_01AE1E: LDA.w #$0002
#_01AE21: LDX.w $068A
#_01AE24: CPX.w #$0019
#_01AE27: BCS .branch01AE30

#_01AE29: DEC A
#_01AE2A: CPX.w #$000D
#_01AE2D: BCS .branch01AE30

#_01AE2F: DEC A

.branch01AE30
#_01AE30: STA.w $0688
#_01AE33: CMP.w #$0000
#_01AE36: BEQ .branch01ADCC

.branch01AE38
#_01AE38: LDA.w #$0005
#_01AE3B: LDX.w $0688
#_01AE3E: BEQ .branch01AE5C

#_01AE40: LDA.w $068A
#_01AE43: LSR A
#_01AE44: ADC.w #$0000
#_01AE47: SEC
#_01AE48: SBC.w #$0007
#_01AE4B: CPX.w #$0001
#_01AE4E: BEQ .branch01AE54

#_01AE50: SEC
#_01AE51: SBC.w #$0006

.branch01AE54
#_01AE54: CMP.w #$0006
#_01AE57: BCC .branch01AE5C

#_01AE59: LDA.w #$0005

.branch01AE5C
#_01AE5C: STA.w $06E4
#_01AE5F: JMP routine01AD1A

.branch01AE62
#_01AE62: LDA.w $068A
#_01AE65: LSR A
#_01AE66: BCC .branch01AE6B

#_01AE68: STZ.w $06E8

.branch01AE6B
#_01AE6B: REP #$30
#_01AE6D: LDA.w $068A
#_01AE70: CMP.w #$000D
#_01AE73: BCS .branch01AE78

#_01AE75: JMP .branch01ADCC

.branch01AE78
#_01AE78: INC.w $0688
#_01AE7B: LDA.w $0688
#_01AE7E: CMP.w #$0002
#_01AE81: BCC .branch01AE90

#_01AE83: BNE .branch01AE8D

#_01AE85: LDX.w $068A
#_01AE88: CPX.w #$0019
#_01AE8B: BCS .branch01AE90

.branch01AE8D
#_01AE8D: STZ.w $0688

.branch01AE90
#_01AE90: STZ.w $06E4
#_01AE93: JMP routine01AD1A

;===================================================================================================

routine01AE96:
#_01AE96: AND.w #$00FF
#_01AE99: PHA
#_01AE9A: LDY.w #$0000
#_01AE9D: LDX.w #$001A
#_01AEA0: JSL GetSkillName
#_01AEA4: LDY.w #$0006
#_01AEA7: LDA.w #$00CF

.branch01AEAA
#_01AEAA: ORA.w $0EFB
#_01AEAD: STA.w $0116,Y
#_01AEB0: STA.w $0130,Y
#_01AEB3: DEY
#_01AEB4: DEY
#_01AEB5: BPL .branch01AEAA

#_01AEB7: PLA
#_01AEB8: CMP.w #$0040
#_01AEBB: BCS .branch01AEDA

#_01AEBD: LDY.w #$0003
#_01AEC0: JSL GetSkillProperty
#_01AEC4: AND.w #$00FF
#_01AEC7: STA.w $0E80
#_01AECA: LDA.w #$0000
#_01AECD: STA.w $0E82
#_01AED0: LDY.w #$0006
#_01AED3: LDA.w #$0116
#_01AED6: JSL WriteAmountHEXtoDEC

.branch01AEDA
#_01AEDA: RTS

;===================================================================================================

; TODO make sure these are indeed for the different characters
SkillLearnPointers:
#_01AEDB: dw $0000
#_01AEDD: dw MomoLearnedSpells
#_01AEDF: dw JimmyLearnedSpells
#_01AEE1: dw himLearnedSpells

; TODO 1 per line
MomoLearnedSpells
#_01AEE3: db $2B,$38,$19,$30,$0A,$31,$1E,$2D
#_01AEEB: db $09,$1D,$2C,$3A,$16,$27,$0B,$39
#_01AEF3: db $34,$11,$36,$12,$FF

JimmyLearnedSpells
#_01AEF8: db $2A,$0C,$38
#_01AEFB: db $0E,$32,$0D,$2B,$1B,$3B,$37,$0F
#_01AF03: db $35,$FF

himLearnedSpells
#_01AF05: db $00,$2F,$02,$31,$1A,$33
#_01AF0B: db $01,$3C,$28,$03,$17,$FF

;===================================================================================================

routine01AF11:
#_01AF11: JSL ClearEntityListBuffer
#_01AF15: STZ.w $0688
#_01AF18: STZ.w $068A
#_01AF1B: LDY.w #$0000

.branch01AF1E
#_01AF1E: PHY
#_01AF1F: LDA.w $0780,Y
#_01AF22: TAX
#_01AF23: AND.w #$FF00
#_01AF26: BEQ .branch01AF34

#_01AF28: LDA.w $068A
#_01AF2B: ASL A
#_01AF2C: TAY
#_01AF2D: TXA
#_01AF2E: STA.w $06A0,Y
#_01AF31: INC.w $068A

.branch01AF34
#_01AF34: PLY
#_01AF35: INY
#_01AF36: INY
#_01AF37: CPY.w #$003C
#_01AF3A: BCC .branch01AF1E

#_01AF3C: LDA.w $068A
#_01AF3F: BNE .branch01AF44

#_01AF41: JMP .branch01B00E

.branch01AF44
#_01AF44: LDA.w #$2000
#_01AF47: STA.w $0EFB
#_01AF4A: JSR CleanEquipmentVTiles
#_01AF4D: STZ.w $0690

.branch01AF50
#_01AF50: LDA.w $0688
#_01AF53: BEQ .branch01AF60

#_01AF55: TAX
#_01AF56: LDA.w #$0000

.branch01AF59
#_01AF59: CLC
#_01AF5A: ADC.w #$000A
#_01AF5D: DEX
#_01AF5E: BNE .branch01AF59

.branch01AF60
#_01AF60: CLC
#_01AF61: ADC.w $0690
#_01AF64: ASL A
#_01AF65: TAY
#_01AF66: CPY.w #$003C
#_01AF69: BCS .branch01AFAB

#_01AF6B: LDA.w $06A0,Y
#_01AF6E: BMI .branch01AFAB

#_01AF70: JSR WriteItemNameAndAmt
#_01AF73: LDA.w $0690
#_01AF76: ASL A
#_01AF77: ASL A
#_01AF78: ASL A
#_01AF79: ASL A
#_01AF7A: ASL A
#_01AF7B: ASL A
#_01AF7C: CLC
#_01AF7D: ADC.w #$3883
#_01AF80: STA.w $0102
#_01AF83: SEC
#_01AF84: SBC.w #$0020
#_01AF87: STA.w $011C
#_01AF8A: LDA.w #$000B
#_01AF8D: STA.w $0104
#_01AF90: STA.w $011E
#_01AF93: LDA.w #$0002
#_01AF96: STA.w $0100
#_01AF99: JSL AddSelfAsVector
#_01AF9D: INC.w $0690
#_01AFA0: LDA.w $0690
#_01AFA3: CMP.w #$000A
#_01AFA6: BCS .branch01AFAB

#_01AFA8: JMP .branch01AF50

.branch01AFAB
#_01AFAB: JSL AddSelfAsVector
#_01AFAF: LDA.w $0F2B
#_01AFB2: BIT.w #$8080
#_01AFB5: BNE .branch01B003

#_01AFB7: BIT.w #$0C00
#_01AFBA: BEQ .branch01AFAB

#_01AFBC: BIT.w #$0400
#_01AFBF: BNE .branch01AFE0

#_01AFC1: DEC.w $0688
#_01AFC4: BPL .branch01B000

#_01AFC6: LDA.w #$0002
#_01AFC9: LDX.w $068A
#_01AFCC: CPX.w #$0015
#_01AFCF: BCS .branch01AFD8

#_01AFD1: DEC A
#_01AFD2: CPX.w #$000B
#_01AFD5: BCS .branch01AFD8

#_01AFD7: DEC A

.branch01AFD8
#_01AFD8: STA.w $0688
#_01AFDB: BEQ .branch01AFAB

#_01AFDD: JMP .branch01AF44

.branch01AFE0
#_01AFE0: LDX.w $068A
#_01AFE3: CPX.w #$000B
#_01AFE6: BCC .branch01AFAB

#_01AFE8: INC.w $0688
#_01AFEB: LDA.w $0688
#_01AFEE: CMP.w #$0002
#_01AFF1: BCC .branch01B000

#_01AFF3: BNE .branch01AFFD

#_01AFF5: LDX.w $068A
#_01AFF8: CPX.w #$0015
#_01AFFB: BCS .branch01B000

.branch01AFFD
#_01AFFD: STZ.w $0688

.branch01B000
#_01B000: JMP .branch01AF44

.branch01B003
#_01B003: PHA
#_01B004: JSR routine01B10A
#_01B007: CLC
#_01B008: PLA
#_01B009: AND.w #$0080
#_01B00C: BNE .branch01B00F

.branch01B00E
#_01B00E: SEC

.branch01B00F
#_01B00F: RTS

;===================================================================================================

routine01B010:
#_01B010: JSL ClearEntityListBuffer
#_01B014: STZ.w $0688
#_01B017: STZ.w $068A
#_01B01A: LDX.w $0715
#_01B01D: LDA.w $1012,X
#_01B020: LSR A
#_01B021: ADC.w $100A,X
#_01B024: ADC.w $100A,X
#_01B027: ADC.w $1014,X
#_01B02A: LSR A
#_01B02B: LSR A
#_01B02C: LSR A
#_01B02D: STA.w $0690
#_01B030: LDA.w $1004,X
#_01B033: AND.w #$7FFF
#_01B036: ASL A
#_01B037: TAX
#_01B038: LDA.l SkillLearnPointers,X
#_01B03C: STA.w $00E0
#_01B03F: PHB
#_01B040: PHK
#_01B041: PLB
#_01B042: LDY.w #$0000

.branch01B045
#_01B045: STY.w $0692
#_01B048: LDA.b ($E0),Y
#_01B04A: AND.w #$00FF
#_01B04D: CMP.w #$00FF
#_01B050: BEQ .branch01B068

#_01B052: TAX
#_01B053: LDA.w $068A
#_01B056: ASL A
#_01B057: TAY
#_01B058: TXA
#_01B059: STA.w $06A0,Y
#_01B05C: INC.w $068A
#_01B05F: LDY.w $0692
#_01B062: INY
#_01B063: CPY.w $0690
#_01B066: BCC .branch01B045

.branch01B068
#_01B068: PLB
#_01B069: LDA.w $068A
#_01B06C: BNE .branch01B071

#_01B06E: JMP .branch01B108

.branch01B071
#_01B071: LDA.w #$2000
#_01B074: STA.w $0EFB
#_01B077: JSR CleanEquipmentVTiles
#_01B07A: STZ.w $0690

.branch01B07D
#_01B07D: LDA.w $0688
#_01B080: BEQ .branch01B08D

#_01B082: TAX
#_01B083: LDA.w #$0000

.branch01B086
#_01B086: CLC
#_01B087: ADC.w #$000A
#_01B08A: DEX
#_01B08B: BNE .branch01B086

.branch01B08D
#_01B08D: CLC
#_01B08E: ADC.w $0690
#_01B091: ASL A
#_01B092: TAY
#_01B093: CPY.w #$003C
#_01B096: BCS .branch01B0D8

#_01B098: LDA.w $06A0,Y
#_01B09B: BMI .branch01B0D8

#_01B09D: JSR routine01AE96
#_01B0A0: LDA.w $0690
#_01B0A3: ASL A
#_01B0A4: ASL A
#_01B0A5: ASL A
#_01B0A6: ASL A
#_01B0A7: ASL A
#_01B0A8: ASL A
#_01B0A9: CLC
#_01B0AA: ADC.w #$3883
#_01B0AD: STA.w $0102
#_01B0B0: SEC
#_01B0B1: SBC.w #$0020
#_01B0B4: STA.w $011C
#_01B0B7: LDA.w #$000B
#_01B0BA: STA.w $0104
#_01B0BD: STA.w $011E
#_01B0C0: LDA.w #$0002
#_01B0C3: STA.w $0100
#_01B0C6: JSL AddSelfAsVector
#_01B0CA: INC.w $0690
#_01B0CD: LDA.w $0690
#_01B0D0: CMP.w #$000A
#_01B0D3: BCS .branch01B0D8

#_01B0D5: JMP .branch01B07D

.branch01B0D8
#_01B0D8: JSL AddSelfAsVector
#_01B0DC: LDA.w $0F2B
#_01B0DF: BIT.w #$8080
#_01B0E2: BNE .branch01B0FD

#_01B0E4: BIT.w #$0C00
#_01B0E7: BEQ .branch01B0D8

#_01B0E9: LDX.w $068A
#_01B0EC: CPX.w #$000B
#_01B0EF: BCC .branch01B0D8

#_01B0F1: LDA.w $0688
#_01B0F4: EOR.w #$0001
#_01B0F7: STA.w $0688
#_01B0FA: JMP .branch01B071

.branch01B0FD
#_01B0FD: PHA
#_01B0FE: JSR routine01B10A
#_01B101: CLC
#_01B102: PLA
#_01B103: AND.w #$0080
#_01B106: BNE .exit

.branch01B108
#_01B108: SEC

.exit
#_01B109: RTS

;===================================================================================================

routine01B10A:
#_01B10A: LDA.w #$0000
#_01B10D: TAY

.branch01B10E
#_01B10E: STA.w $0106,Y
#_01B111: INY
#_01B112: INY
#_01B113: CPY.w #$0210
#_01B116: BCC .branch01B10E

#_01B118: BRA .branch01B12D

CleanEquipmentVTiles:
#_01B11A: LDY.w #$0000
#_01B11D: LDA.w #$00CF

.branch01B120
#_01B120: ORA.w $0EFB
#_01B123: STA.w $0106,Y
#_01B126: INY
#_01B127: INY
#_01B128: CPY.w #$0210
#_01B12B: BCC .branch01B120

.branch01B12D
#_01B12D: LDA.w #$0014
#_01B130: STA.w $0104
#_01B133: LDA.w #$3863
#_01B136: STA.w $0102
#_01B139: LDA.w #$80DC
#_01B13C: STA.w $0100
#_01B13F: JSL AddSelfAsVector
#_01B143: RTS

;===================================================================================================
; TODO triggers encounters
; not sure what the first part does
; but it seems different dungeons do
; a different number of RNG rolls
;===================================================================================================
TriggerEncounter_Dungeon:
#_01B144: PHP

#_01B145: SEP #$30
#_01B147: PHB

#_01B148: LDA.b #UNREACH_07C10F>>16
#_01B14A: PHA
#_01B14B: PLB

#_01B14C: LDA.w $045A
#_01B14F: AND.b #$3F
#_01B151: TAY

#_01B152: LDA.w UNREACH_07C10F,Y

#_01B155: LDX.w $0712
#_01B158: CPX.b #$82
#_01B15A: BCC .dont_add_50percent

#_01B15C: LSR A
#_01B15D: CLC
#_01B15E: ADC.w UNREACH_07C10F,Y

.dont_add_50percent
#_01B161: TAX

#_01B162: PLB

#_01B163: LDA.w $0713
#_01B166: AND.b #$7F
#_01B168: BRA TriggerEncounter

;===================================================================================================

TriggerEncounter_Overworld:
#_01B16A: PHP

#_01B16B: SEP #$30

#_01B16D: LDX.w $045B

#_01B170: LDA.b #$01

;===================================================================================================

TriggerEncounter:
#_01B172: CLC
#_01B173: ADC.b #$03
#_01B175: LSR A
#_01B176: LSR A
#_01B177: ADC.b #$0A
#_01B179: STA.w $00E0
#_01B17C: STX.w $00E1

; RNG based on frame counter
#_01B17F: LDA.w $0451
#_01B182: AND.b #$03
#_01B184: TAX

.tick_rng
#_01B185: JSL GetRandomInt

#_01B189: DEX
#_01B18A: BNE .tick_rng

#_01B18C: AND.b #$0F
#_01B18E: STA.w WRMPYA

#_01B191: LDA.w $00E0
#_01B194: STA.w WRMPYB

#_01B197: NOP
#_01B198: NOP
#_01B199: NOP
#_01B19A: NOP

#_01B19B: LDA.w RDMPYH
#_01B19E: BNE .branch01B1A9

#_01B1A0: LDA.w RDMPYL
#_01B1A3: CLC
#_01B1A4: ADC.w $00E1
#_01B1A7: BCC .branch01B1B4

.branch01B1A9
#_01B1A9: JSR routine01B1B7
#_01B1AC: JSR routine01B221
#_01B1AF: BCS .branch01B1B4

#_01B1B1: PLP
#_01B1B2: SEC
#_01B1B3: RTL

.branch01B1B4
#_01B1B4: PLP
#_01B1B5: CLC
#_01B1B6: RTL

;===================================================================================================
; TODO
routine01B1B7:
#_01B1B7: SEP #$30

#_01B1B9: BIT.w $0404
#_01B1BC: BMI .exit

#_01B1BE: LDA.w $070C
#_01B1C1: AND.b #$FC
#_01B1C3: LSR A
#_01B1C4: STA.w $00E0

#_01B1C7: LDA.w $070D
#_01B1CA: AND.b #$FC
#_01B1CC: ASL A
#_01B1CD: ASL A
#_01B1CE: ASL A
#_01B1CF: ROL.w $00E1
#_01B1D2: ASL A
#_01B1D3: ROL.w $00E1
#_01B1D6: CLC
#_01B1D7: ADC.w $00E0
#_01B1DA: ADC.b #EncounterData>>0
#_01B1DC: STA.w $00E0

#_01B1DF: LDA.w $00E1
#_01B1E2: AND.b #$03
#_01B1E4: ADC.b #EncounterData>>8
#_01B1E6: STA.w $00E1

#_01B1E9: LDA.b #EncounterData>>16
#_01B1EB: STA.w $00E2

#_01B1EE: LDY.b #$00

#_01B1F0: LDA.b [$E0],Y
#_01B1F2: TAX

#_01B1F3: AND.b #$0F
#_01B1F5: STA.w $0455

#_01B1F8: TXA
#_01B1F9: LSR A
#_01B1FA: LSR A
#_01B1FB: LSR A
#_01B1FC: LSR A
#_01B1FD: STA.w $0456

#_01B200: INY

#_01B201: LDA.b [$E0],Y
#_01B203: PHA

#_01B204: LDA.b #$2F
#_01B206: JSL CheckGameProgressFlag
#_01B20A: BCS .branch01B21C

#_01B20C: LDX.w $045A
#_01B20F: CPX.b #$0A
#_01B211: BEQ .branch01B217

#_01B213: CPX.b #$1F
#_01B215: BNE .branch01B21C

.branch01B217
#_01B217: PLA
#_01B218: CLC
#_01B219: ADC.b #$09
#_01B21B: PHA

.branch01B21C
#_01B21C: PLA
#_01B21D: STA.w $0457

.exit
#_01B220: RTS

;===================================================================================================

routine01B221:
#_01B221: PHP

#_01B222: REP #$20

#_01B224: LDA.w $05A6
#_01B227: BEQ .branch01B25D

#_01B229: LDA.w $0457
#_01B22C: AND.w #$00FF
#_01B22F: ASL A
#_01B230: ASL A
#_01B231: ASL A
#_01B232: ASL A
#_01B233: CLC
#_01B234: ADC.w #data07BD49
#_01B237: STA.w $00E0

#_01B23A: LDA.w #data07BD49>>16
#_01B23D: STA.w $00E2

#_01B240: SEP #$30

#_01B242: LDY.b #$00

.branch01B244
#_01B244: STY.w $00E4

#_01B247: LDA.b [$E0],Y
#_01B249: LDY.b #$00
#_01B24B: JSR GetDemonStats

#_01B24E: SEP #$20

#_01B250: CMP.w $100A
#_01B253: BCC .branch01B260

#_01B255: LDY.w $00E4
#_01B258: INY
#_01B259: CPY.b #$10
#_01B25B: BCC .branch01B244

.branch01B25D
#_01B25D: PLP
#_01B25E: CLC
#_01B25F: RTS

.branch01B260
#_01B260: PLP
#_01B261: SEC
#_01B262: RTS

;===================================================================================================

routine01B263:
#_01B263: PHP

#_01B264: SEP #$30
#_01B266: PHB

#_01B267: LDA.b #data07BD09>>16
#_01B269: PHA
#_01B26A: PLB

#_01B26B: REP #$20
#_01B26D: SEP #$10

#_01B26F: LDX.w $0455
#_01B272: LDY.b #$04
#_01B274: LDA.w #data07BD09
#_01B277: JSR GetDynamicSuccessiveHitChances

#_01B27A: STX.w $0504
#_01B27D: STZ.w $0505

#_01B280: REP #$30

#_01B282: STZ.w $0EFE
#_01B285: JSR routine01B90B

#_01B288: LDA.w #$0002
#_01B28B: JSL InitializeTextBoxToSizeForNewMessage
#_01B28F: JSL routine00A056

.branch01B293
#_01B293: JSR routine01DFB8

#_01B296: JSR ChooseNumberOfEnemyCombatants
#_01B299: JSL LoadDemonStats

#_01B29D: STZ.w $052A
#_01B2A0: JSR ClearALotOfBattleStuff
#_01B2A3: JSR routine01E244
#_01B2A6: JSR routine01B34A
#_01B2A9: JSR routine01B9F1
#_01B2AC: BCS .branch01B2B1

#_01B2AE: JSR routine01BAB9

;---------------------------------------------------------------------------------------------------

.branch01B2B1
#_01B2B1: JSR SomethingBattleMenu
#_01B2B4: BCS .branch01B302

#_01B2B6: JSR routine01C3E3

.branch01B2B9
#_01B2B9: JSR routine01CA99
#_01B2BC: BCS .branch01B2DC

#_01B2BE: LDA.w $052A
#_01B2C1: AND.w #$2000
#_01B2C4: BNE .branch01B2DC

#_01B2C6: INC.w $0548
#_01B2C9: INC.w $0548
#_01B2CC: LDY.w $0548
#_01B2CF: CPY.w #$001C
#_01B2D2: BCS .branch01B2DC

#_01B2D4: LDA.w $052C,Y
#_01B2D7: CMP.w #$FFFF
#_01B2DA: BNE .branch01B2B9

.branch01B2DC
#_01B2DC: JSR routine01B477
#_01B2DF: JSR routine01C538
#_01B2E2: JSL routine00AB74
#_01B2E6: LDA.w $052A
#_01B2E9: AND.w #$2000
#_01B2EC: BNE .branch01B302

#_01B2EE: LDA.w $0512
#_01B2F1: ORA.w $0514
#_01B2F4: BNE .branch01B2B1

#_01B2F6: JSR AddEnemyDrop
#_01B2F9: LDA.w #$FFFF
#_01B2FC: STA.w $0566
#_01B2FF: JSR routine01B8A3

.branch01B302
#_01B302: JSL routine01E8F1
#_01B306: LDA.w $0564
#_01B309: JSL routine01E5CD
#_01B30D: LDA.w $0564
#_01B310: EOR.w #$0002
#_01B313: JSL routine01E5CD
#_01B317: JSR routine01B8F5
#_01B31A: DEC.w $0504
#_01B31D: BMI .branch01B322

#_01B31F: JMP .branch01B293

;---------------------------------------------------------------------------------------------------

.branch01B322
#_01B322: JSL Cache_WRAM_CGWRAM_First8
#_01B326: JSL AddSelfAsVector
#_01B32A: JSR routine01C60E
#_01B32D: LDA.w $052A
#_01B330: AND.w #$2400
#_01B333: BEQ .branch01B33D

#_01B335: LDA.w $0512
#_01B338: ORA.w $0514
#_01B33B: BNE .branch01B340

.branch01B33D
#_01B33D: JSR GiveAllLootFromBattle

.branch01B340
#_01B340: JSR routine01B9D6
#_01B343: JSL UpdateDialogBox
#_01B347: PLB
#_01B348: PLP
#_01B349: RTL

;===================================================================================================
; TODO something with text?
;===================================================================================================
routine01B34A:
#_01B34A: LDA.w #$0003
#_01B34D: STA.w $0A26

#_01B350: LDA.w #$0020
#_01B353: STA.w $0A2C

#_01B356: LDA.w #$0018
#_01B359: STA.w $0A1E

#_01B35C: LDA.w #$000C
#_01B35F: STA.w $0A20

#_01B362: LDA.w #$0002
#_01B365: STA.w $0A1C

#_01B368: RTS

;===================================================================================================

routine01B369:
#_01B369: PHA

#_01B36A: LDA.w #$0002
#_01B36D: JSL routine00BAC0

#_01B371: LDA.w #$0000
#_01B374: STA.w $0A22

#_01B377: LDA.w #$0001
#_01B37A: STA.w $0A24

#_01B37D: LDA.w #$3DC4
#_01B380: STA.w $0A1A

#_01B383: JSL routine03837C
#_01B387: JSL AddSelfAsVector

#_01B38B: PLA
#_01B38C: STA.w $0A22

#_01B38F: JSL routine03837C
#_01B393: JSL AddSelfAsVector

#_01B397: RTS

;===================================================================================================

DisplayCombatMessage:
#_01B398: PHA

#_01B399: LDA.w $052A
#_01B39C: AND.w #$4000
#_01B39F: BEQ .show_message

#_01B3A1: PLA
#_01B3A2: RTS

.show_message
#_01B3A3: LDA.w #$0002
#_01B3A6: JSL routine00BAC0

#_01B3AA: LDA.w #$0000
#_01B3AD: STA.w $0A22

#_01B3B0: LDA.w #$0001
#_01B3B3: STA.w $0A24

#_01B3B6: LDA.w #$3E04
#_01B3B9: STA.w $0A1A

#_01B3BC: JSL routine03837C
#_01B3C0: JSL AddSelfAsVector

#_01B3C4: PLA
#_01B3C5: STA.w $0A22

#_01B3C8: LDA.w #$3E04
#_01B3CB: STA.w $0A1A
#_01B3CE: JSL routine03837C
#_01B3D2: JSL AddSelfAsVector

#_01B3D6: RTS

;===================================================================================================

DoTextInCombatMaybe:
#_01B3D7: PHA

#_01B3D8: LDA.w $052A
#_01B3DB: AND.w #$4000
#_01B3DE: BEQ .show_message

#_01B3E0: PLA

#_01B3E1: RTS

.show_message
#_01B3E2: LDA.w #$0000
#_01B3E5: STA.w $0A22

#_01B3E8: LDA.w #$0001
#_01B3EB: STA.w $0A24

#_01B3EE: LDA.w #$3E04
#_01B3F1: STA.w $0A1A

#_01B3F4: JSL routine03837C
#_01B3F8: JSL AddSelfAsVector

#_01B3FC: LDA.w #$0000
#_01B3FF: STA.w $0A22

#_01B402: LDA.w #$0001
#_01B405: STA.w $0A24

#_01B408: LDA.w #$3E44
#_01B40B: STA.w $0A1A

#_01B40E: JSL routine03837C
#_01B412: JSL AddSelfAsVector

#_01B416: LDA.w #$0003
#_01B419: JSL routine00BA70

#_01B41D: PLA
#_01B41E: STA.w $0A22

#_01B421: LDA.w #$3E04
#_01B424: STA.w $0A1A

#_01B427: JSL routine03837C
#_01B42B: JSL AddSelfAsVector

#_01B42F: RTS

;===================================================================================================
; TODO finds a party member for something
routine01B430:
#_01B430: STA.w $0620

#_01B433: LDY.w #$0000
#_01B436: STY.w $0622

.next_check
#_01B439: LDA.w $0700,Y
#_01B43C: BMI .end_of_party

#_01B43E: CLC
#_01B43F: ADC.w $0620
#_01B442: TAX

#_01B443: LDA.w $0000,X
#_01B446: CMP.w $0622
#_01B449: BCC .skip

#_01B44B: STA.w $0622

.skip
#_01B44E: INY
#_01B44F: INY
#_01B450: CPY.w #$000C
#_01B453: BCC .next_check

.end_of_party
#_01B455: LDA.w $0622

#_01B458: RTS

;===================================================================================================

routine01B459:
#_01B459: CLC
#_01B45A: ADC.w #$0600
#_01B45D: TAY

#_01B45E: LDA.w $0000,Y
#_01B461: BIT.w $0524
#_01B464: BPL .branch01B476

#_01B466: PHA

#_01B467: TYA
#_01B468: CLC
#_01B469: ADC.w #$0180
#_01B46C: TAY

#_01B46D: PLA
#_01B46E: CMP.w $0000,Y
#_01B471: BCS .branch01B476

#_01B473: LDA.w $0000,Y

.branch01B476
#_01B476: RTS

;===================================================================================================
; TODO finds a party member for something
routine01B477:
#_01B477: LDY.w #$0000

.next_check
#_01B47A: LDX.w $0700,Y
#_01B47D: BMI .end_of_party

#_01B47F: LDA.w $1008,X
#_01B482: AND.w #$00FF
#_01B485: BEQ .skip

#_01B487: XBA
#_01B488: STA.w $1008,X

.skip
#_01B48B: INY
#_01B48C: INY
#_01B48D: CPY.w #$000C
#_01B490: BCC .next_check

.end_of_party
#_01B492: JSL routine00A17E

#_01B496: RTS

;===================================================================================================
; X = class
; Y = size of classes
; A = bank07 address of classes
;===================================================================================================
GetDynamicSuccessiveHitChances:
#_01B497: PHP

#_01B498: REP #$20
#_01B49A: SEP #$10

#_01B49C: STA.w $00E0

; Remember number we came in with (4 or 9)
#_01B49F: STY.w $00E2

; Get Y * X (highest seems to be 9 * 14?)
#_01B4A2: STX.w WRMPYA
#_01B4A5: STY.w WRMPYB

#_01B4A8: JSL GetRandomInt

#_01B4AC: SEP #$20
#_01B4AE: REP #$10

#_01B4B0: LDY.w RDMPYL
#_01B4B3: LDX.w #$0000

; get a count of how many enemies should be hit
.next_check
#_01B4B6: LDA.b ($E0),Y
#_01B4B8: BEQ .guaranteed_hit

#_01B4BA: CMP.w $0ED5
#_01B4BD: BCS .missed

.guaranteed_hit
#_01B4BF: INY
#_01B4C0: INX
#_01B4C1: CPX.w $00E2
#_01B4C4: BCC .next_check

.missed
#_01B4C6: PLP
#_01B4C7: RTS

;===================================================================================================
; Inputs:
;   A - demon ID
;   Y - stat
;       Demon stats seem to be 24 bytes
;       0x00       Level
;       0x01       HP lo
;       0x02       HP hi
;       0x03       MP lo
;       0x04       MP hi
;       0x05       STR
;       0x06       INT
;       0x07       MAG
;       0x08       STM
;       0x09       SPD
;       0x0A       LUK
;       0x0B       Alignment
;       0x0C       1636
;       0x0D       1638
;       0x0E       163A
;       0x0F       163C
;       0x10       Move 1
;       0x11       Move 2
;       0x12       Move 3
;       0x13       XP / Drop rate
;       0x14       Money / MAG drop rate
;       0x16       CP
;       0x17       164C
;===================================================================================================
GetDemonStats:
#_01B4C8: SEP #$20

#_01B4CA: STA.w PPUMULT16
#_01B4CD: XBA
#_01B4CE: STA.w PPUMULT16

#_01B4D1: LDA.b #$18
#_01B4D3: STA.w PPUMULT8

#_01B4D6: LDA.b #DemonStats>>16
#_01B4D8: STA.w $00B2

#_01B4DB: REP #$20

#_01B4DD: LDA.w MPYL
#_01B4E0: CLC
#_01B4E1: ADC.w #DemonStats
#_01B4E4: STA.w $00B0

#_01B4E7: LDA.b [$B0],Y

#_01B4E9: RTS

;===================================================================================================

routine01B4EA:
#_01B4EA: PHP

#_01B4EB: REP #$30
#_01B4ED: PHB

#_01B4EE: SEP #$20

#_01B4F0: LDA.b #DemonStats>>16
#_01B4F2: PHA

#_01B4F3: REP #$20
#_01B4F5: PLB

#_01B4F6: LDA.w #$0100
#_01B4F9: STA.w $052A

#_01B4FC: STZ.w $0504
#_01B4FF: STZ.w $0528
#_01B502: STZ.w $0566

#_01B505: JSR routine01B90B
#_01B508: JSR ClearALotOfBattleStuff
#_01B50B: JSR routine01B34A

#_01B50E: SEP #$30

#_01B510: LDA.b #$02
#_01B512: JSL InitializeTextBoxToSizeForNewMessage

#_01B516: REP #$30

#_01B518: JSL LoadDemonStats

#_01B51C: PLB

#_01B51D: PLP
#_01B51E: RTL

;===================================================================================================

routine01B51F:
#_01B51F: PHP

#_01B520: REP #$30
#_01B522: PHB

#_01B523: SEP #$20
#_01B525: LDA.b #DemonStats>>16
#_01B527: PHA

#_01B528: REP #$20

#_01B52A: PLB

#_01B52B: JSR routine01B34A
#_01B52E: JSR SomethingBattleMenu
#_01B531: BCS .branch01B57F

#_01B533: JSR routine01C3E3

.branch01B536
#_01B536: JSR routine01CA99
#_01B539: BCS .branch01B561

#_01B53B: LDA.w $052A
#_01B53E: AND.w #$2000
#_01B541: BNE .branch01B57F

#_01B543: INC.w $0548
#_01B546: INC.w $0548

#_01B549: LDY.w $0548
#_01B54C: CPY.w #$001C
#_01B54F: BCS .branch01B561

#_01B551: LDA.w $0512
#_01B554: ORA.w $0514
#_01B557: BEQ .branch01B561

#_01B559: LDA.w $052C,Y
#_01B55C: CMP.w #$FFFF
#_01B55F: BNE .branch01B536

.branch01B561
#_01B561: JSR routine01B477
#_01B564: JSR routine01C538
#_01B567: JSL routine00AB74
#_01B56B: LDA.w $0512
#_01B56E: ORA.w $0514
#_01B571: BNE .exit

#_01B573: JSR AddEnemyDrop

#_01B576: LDA.w #$FFFF
#_01B579: STA.w $0566
#_01B57C: JSR routine01B8A3

.branch01B57F
#_01B57F: JSL routine01E60C
#_01B583: JSL Cache_WRAM_CGWRAM_First8
#_01B587: JSL AddSelfAsVector
#_01B58B: JSL routine01E8F1
#_01B58F: JSR routine01C60E
#_01B592: JSR routine01B8F5
#_01B595: LDA.w $052A
#_01B598: AND.w #$2400
#_01B59B: BEQ .distribute_loot

#_01B59D: LDA.w $0512
#_01B5A0: ORA.w $0514
#_01B5A3: BNE .exit

.distribute_loot
#_01B5A5: JSR GiveAllLootFromBattle
#_01B5A8: JSR routine01B9D6

.exit
#_01B5AB: PLB

#_01B5AC: PLP
#_01B5AD: RTL

;===================================================================================================

routine01B5AE:
#_01B5AE: PHP

#_01B5AF: REP #$30
#_01B5B1: PHB

#_01B5B2: SEP #$20

#_01B5B4: LDA.b #DemonStats>>16
#_01B5B6: PHA

#_01B5B7: REP #$20
#_01B5B9: PLB

#_01B5BA: JSL routine01B4EA

#_01B5BE: STZ.w $052A
#_01B5C1: JSR routine01B34A
#_01B5C4: JSR routine01BAB9

.branch01B5C7
#_01B5C7: JSR SomethingBattleMenu
#_01B5CA: BCS .branch01B618

#_01B5CC: JSR routine01C3E3

.branch01B5CF
#_01B5CF: JSR routine01CA99
#_01B5D2: BCS .branch01B5FA

#_01B5D4: LDA.w $052A
#_01B5D7: AND.w #$2000
#_01B5DA: BNE .branch01B618

#_01B5DC: INC.w $0548
#_01B5DF: INC.w $0548
#_01B5E2: LDY.w $0548
#_01B5E5: CPY.w #$001C
#_01B5E8: BCS .branch01B5FA

#_01B5EA: LDA.w $0512
#_01B5ED: ORA.w $0514
#_01B5F0: BEQ .branch01B5FA

#_01B5F2: LDA.w $052C,Y
#_01B5F5: CMP.w #$FFFF
#_01B5F8: BNE .branch01B5CF

.branch01B5FA
#_01B5FA: JSR routine01B477
#_01B5FD: JSR routine01C538
#_01B600: JSL routine00AB74
#_01B604: LDA.w $0512
#_01B607: ORA.w $0514
#_01B60A: BNE .branch01B5C7

#_01B60C: JSR AddEnemyDrop
#_01B60F: LDA.w #$FFFF
#_01B612: STA.w $0566
#_01B615: JSR routine01B8A3

.branch01B618
#_01B618: JSL routine01E60C
#_01B61C: JSL Cache_WRAM_CGWRAM_First8
#_01B620: JSL AddSelfAsVector
#_01B624: JSL routine01E8F1
#_01B628: JSR routine01C60E
#_01B62B: JSR routine01B8F5
#_01B62E: LDA.w $052A
#_01B631: AND.w #$2400
#_01B634: BEQ .branch01B63E

#_01B636: LDA.w $0512
#_01B639: ORA.w $0514
#_01B63C: BNE .branch01B641

.branch01B63E
#_01B63E: JSR GiveAllLootFromBattle

.branch01B641
#_01B641: JSR routine01B9D6
#_01B644: PLB
#_01B645: PLP
#_01B646: RTL

;===================================================================================================

routine01B647:
#_01B647: PHP

#_01B648: REP #$30
#_01B64A: PHB

#_01B64B: SEP #$20

#_01B64D: LDA.b #DemonStats>>16
#_01B64F: PHA

#_01B650: REP #$20
#_01B652: PLB

#_01B653: JSL routine01E60C
#_01B657: JSL Cache_WRAM_CGWRAM_First8

#_01B65B: JSL AddSelfAsVector

#_01B65F: JSL routine01E8F1
#_01B663: JSR routine01C60E
#_01B666: JSR routine01B8F5
#_01B669: JSR routine01B9D6

#_01B66C: PLB

#_01B66D: PLP
#_01B66E: RTL

;===================================================================================================

AddEnemyDrop:
#_01B66F: JSL DetermineEnemyDrop
#_01B673: BCS .no_drop

#_01B675: PHA

#_01B676: LDA.w $0504
#_01B679: AND.w #$00FF
#_01B67C: ASL A
#_01B67D: ASL A
#_01B67E: TAY

#_01B67F: PLA
#_01B680: STA.w $0568,Y

.no_drop
#_01B683: JSL DetermineEnemyMagicStoneDrops
#_01B687: BCS .no_stones

#_01B689: INC.w $0522

.no_stones
#_01B68C: RTS

;===================================================================================================

DetermineEnemyDrop:
#_01B68D: PHP

#_01B68E: REP #$30

#_01B690: JSL GetRandomInt

#_01B694: LDX.w $0526

#_01B697: LDA.w $1044,X
#_01B69A: AND.w #$000F
#_01B69D: BEQ .no_drop

#_01B69F: SEP #$20

#_01B6A1: STA.w WRMPYA
#_01B6A4: STA.w WRMPYB

#_01B6A7: NOP
#_01B6A8: NOP
#_01B6A9: NOP
#_01B6AA: NOP
#_01B6AB: NOP
#_01B6AC: NOP
#_01B6AD: NOP
#_01B6AE: NOP

#_01B6AF: LDA.w RDMPYL
#_01B6B2: LSR A
#_01B6B3: CMP.w $0ED5
#_01B6B6: BCC .no_drop

#_01B6B8: LDA.w $1046,X

#_01B6BB: PLP
#_01B6BC: CLC

#_01B6BD: RTL

.no_drop
#_01B6BE: PLP
#_01B6BF: SEC

#_01B6C0: RTL

;===================================================================================================

DetermineEnemyMagicStoneDrops:
#_01B6C1: PHP

#_01B6C2: REP #$30

#_01B6C4: JSL GetRandomInt

#_01B6C8: LDX.w $0526

; Demons 0xB9 and above give out MAG instead of magstones
#_01B6CB: LDA.w $1004,X
#_01B6CE: CMP.w #$00B9 ; Demon 0x0B9
#_01B6D1: BCS .no_drop

#_01B6D3: LDA.w $1048,X
#_01B6D6: AND.w #$000F
#_01B6D9: BEQ .no_drop

#_01B6DB: SEP #$20

#_01B6DD: STA.w WRMPYA
#_01B6E0: STA.w WRMPYB

#_01B6E3: NOP
#_01B6E4: NOP
#_01B6E5: NOP
#_01B6E6: NOP
#_01B6E7: NOP
#_01B6E8: NOP
#_01B6E9: NOP
#_01B6EA: NOP

#_01B6EB: LDA.w RDMPYL
#_01B6EE: LSR A
#_01B6EF: CMP.w $0ED5
#_01B6F2: BCC .no_drop

#_01B6F4: PLP
#_01B6F5: CLC

#_01B6F6: RTL

.no_drop
#_01B6F7: PLP
#_01B6F8: SEC

#_01B6F9: RTL

;===================================================================================================
; TODO formula
;===================================================================================================
GiveCharacterExperienceFromBattle:
#_01B6FA: PHP

#_01B6FB: REP #$30

#_01B6FD: LDX.w $0526

; top nibble of XP rate
#_01B700: LDA.w $1044,X
#_01B703: LSR A
#_01B704: LSR A
#_01B705: LSR A
#_01B706: LSR A
#_01B707: TAY

; level * 4
#_01B708: LDA.w $100A,X
#_01B70B: ASL A
#_01B70C: ASL A

#_01B70D: JSR SomeCoolMultiplyAxY

#_01B710: STA.w $0620

; get difference in level
#_01B713: LDY.w $0715
#_01B716: LDX.w $0526
#_01B719: LDA.w $100A,Y
#_01B71C: SEC
#_01B71D: SBC.w $100A,X
#_01B720: BPL .player_was_stronger

#_01B722: EOR.w #$FFFF
#_01B725: INC A
#_01B726: LSR A
#_01B727: LSR A
#_01B728: BEQ .difference_was_small

#_01B72A: TAY
#_01B72B: CPY.w #$0006
#_01B72E: BCC .branch01B733

#_01B730: LDY.w #$0005

.branch01B733
#_01B733: ASL.w $0620
#_01B736: DEY
#_01B737: BNE .branch01B733

#_01B739: BRA .difference_was_small

.player_was_stronger
#_01B73B: LSR A
#_01B73C: LSR A
#_01B73D: BEQ .difference_was_small

#_01B73F: LDY.w $0620
#_01B742: STY.w WRDIVL

#_01B745: SEP #$20

#_01B747: STA.w WRDIVB

#_01B74A: NOP
#_01B74B: NOP
#_01B74C: NOP
#_01B74D: NOP
#_01B74E: NOP
#_01B74F: NOP
#_01B750: NOP
#_01B751: NOP

#_01B752: REP #$20

#_01B754: LDA.w RDDIVL
#_01B757: STA.w $0620

.difference_was_small
#_01B75A: LDA.w $0620
#_01B75D: BNE .not_zero

#_01B75F: INC A

.not_zero
#_01B760: PLP
#_01B761: RTL

;===================================================================================================
; TODO formula
;===================================================================================================
GainMoneyFromKill:
#_01B762: PHP

#_01B763: REP #$30

#_01B765: LDX.w $0526

#_01B768: LDA.w $1048,X
#_01B76B: LSR A
#_01B76C: LSR A
#_01B76D: LSR A
#_01B76E: LSR A
#_01B76F: TAY

#_01B770: LDA.w $100A,X
#_01B773: ASL A
#_01B774: ASL A
#_01B775: ASL A
#_01B776: JSR SomeCoolMultiplyAxY

#_01B779: PLP
#_01B77A: RTL

;===================================================================================================

routine01B77B:
#_01B77B: PHP

#_01B77C: REP #$30

#_01B77E: LDX.w $0526
#_01B781: LDX.w $0526

#_01B784: LDA.w $1004,X
#_01B787: CMP.w #$00B9 ; Demon 0x0B9
#_01B78A: BCC .dont_give_anything

#_01B78C: LDA.w $1048,X
#_01B78F: AND.w #$000F
#_01B792: TAY

#_01B793: LDA.w $100A,X
#_01B796: ASL A
#_01B797: ASL A
#_01B798: JSR SomeCoolMultiplyAxY

#_01B79B: PLP
#_01B79C: RTL

.dont_give_anything
#_01B79D: LDA.w #$0000

#_01B7A0: PLP
#_01B7A1: RTL

;===================================================================================================
; Exits with A = for Y (treated as a signed 4-bit number ones' complement?)
;    0 => 0
;   >0 => A*Y
;   <0 => A*(Y+9)
;===================================================================================================
SomeCoolMultiplyAxY:
#_01B7A2: CPY.w #$0000
#_01B7A5: BEQ .zero

#_01B7A7: CPY.w #$0008
#_01B7AA: BCS .negative

#_01B7AC: SEP #$30

#_01B7AE: STA.w PPUMULT16
#_01B7B1: XBA
#_01B7B2: STA.w PPUMULT16

#_01B7B5: STY.w PPUMULT8

#_01B7B8: NOP
#_01B7B9: NOP
#_01B7BA: NOP
#_01B7BB: NOP
#_01B7BC: NOP
#_01B7BD: NOP
#_01B7BE: NOP
#_01B7BF: NOP

#_01B7C0: REP #$30

#_01B7C2: LDA.w MPYL

#_01B7C5: RTS

;---------------------------------------------------------------------------------------------------

.negative
#_01B7C6: LSR A
#_01B7C7: LSR A
#_01B7C8: LSR A

#_01B7C9: SEP #$30

#_01B7CB: STA.w PPUMULT16
#_01B7CE: XBA
#_01B7CF: STA.w PPUMULT16

#_01B7D2: TYA
#_01B7D3: SEC
#_01B7D4: SBC.b #$07
#_01B7D6: STA.w PPUMULT8

#_01B7D9: NOP
#_01B7DA: NOP
#_01B7DB: NOP
#_01B7DC: NOP
#_01B7DD: NOP
#_01B7DE: NOP
#_01B7DF: NOP
#_01B7E0: NOP

#_01B7E1: REP #$30

#_01B7E3: LDA.w MPYL

#_01B7E6: RTS

;---------------------------------------------------------------------------------------------------

.zero
#_01B7E7: LDA.w #$0000

#_01B7EA: RTS

;===================================================================================================
; TODO after battle stuff
;===================================================================================================
GiveAllLootFromBattle:
#_01B7EB: LDA.w $052A
#_01B7EE: AND.w #$BFFF
#_01B7F1: STA.w $052A

#_01B7F4: JSL TriggerMenuGrow
#_01B7F8: JSL WriteMoneyToHUD
#_01B7FC: JSL WriteMAGToHUD

#_01B800: LDA.w $05D6
#_01B803: ORA.w $05D8
#_01B806: ORA.w $05DA
#_01B809: ORA.w $05DC
#_01B80C: BEQ .branch01B811

#_01B80E: JSR routine01C640

;---------------------------------------------------------------------------------------------------

.branch01B811
#_01B811: LDA.w $051E
#_01B814: BEQ .no_money_gained

#_01B816: JSR GiveMoneyFromBattle

.no_money_gained
#_01B819: LDA.w $0520
#_01B81C: BEQ .no_mag_gained

#_01B81E: JSR GiveMAGFromBattle

.no_mag_gained
#_01B821: LDA.w $0522
#_01B824: BEQ .no_magstones_gained

#_01B826: JSR GiveMagStonesFromBattle

;---------------------------------------------------------------------------------------------------

.no_magstones_gained
#_01B829: LDY.w #$0000

.next_enemy_for_drops
#_01B82C: STY.w $0600

#_01B82F: LDA.w $0568,Y
#_01B832: BMI .skip_drop

#_01B834: JSR AddEnemyDropFromBattleToInventory
#_01B837: BCS .abort_droppings

.skip_drop
#_01B839: LDY.w $0600
#_01B83C: INY
#_01B83D: INY
#_01B83E: CPY.w #$0008
#_01B841: BCC .next_enemy_for_drops

.abort_droppings
#_01B843: JSL TriggerMenuShrink

#_01B847: RTS

;===================================================================================================

TallyNumberOfLevelsGained:
#_01B848: PHP

#_01B849: REP #$30

#_01B84B: STZ.w $0578

#_01B84E: PHB

#_01B84F: SEP #$20

#_01B851: LDA.b #ExperienceTable>>16
#_01B853: PHA

#_01B854: REP #$20
#_01B856: PLB

#_01B857: LDX.w $0715
#_01B85A: BIT.w $1000,X
#_01B85D: BPL .exit

#_01B85F: BVC .exit

#_01B861: LDA.w $1002,X
#_01B864: AND.w #$E000
#_01B867: BNE .exit

.next_level
#_01B869: LDA.w $100A,X
#_01B86C: CMP.w #$0063
#_01B86F: BCS .no_more_levels

#_01B871: ASL A
#_01B872: ADC.w $100A,X
#_01B875: TAY

#_01B876: LDA.w ExperienceTable+0,Y
#_01B879: SEC
#_01B87A: SBC.w $100C,X
#_01B87D: STA.w $0620

#_01B880: LDA.w ExperienceTable+2,Y
#_01B883: AND.w #$00FF
#_01B886: SBC.w $100E,X
#_01B889: BCC .more_experience_to_give

#_01B88B: ORA.w $0620
#_01B88E: BNE .no_more_levels

.more_experience_to_give
#_01B890: INC.w $100A,X

#_01B893: INC.w $0578

#_01B896: BRA .next_level

;---------------------------------------------------------------------------------------------------

.no_more_levels
#_01B898: LDA.w $0578
#_01B89B: BEQ .exit

#_01B89D: JSR LevelUpAfterBattle

.exit
#_01B8A0: PLB

#_01B8A1: PLP
#_01B8A2: RTL

;===================================================================================================

routine01B8A3:
#_01B8A3: LDA.w #$0001
#_01B8A6: JSL CheckGameProgressFlag
#_01B8AA: BCS .exit

#_01B8AC: LDY.w #$0600

.next
#_01B8AF: LDA.w $1004,Y
#_01B8B2: CMP.w #$0100
#_01B8B5: BCS .exit

#_01B8B7: SEP #$20
#_01B8B9: LDX.w #$0000

.branch01B8BC
#_01B8BC: LDA.l $7E3500,X
#_01B8C0: BEQ .branch01B8CA

#_01B8C2: CMP.w $1004,Y
#_01B8C5: BEQ .branch01B8CA

#_01B8C7: INX
#_01B8C8: BNE .branch01B8BC

;---------------------------------------------------------------------------------------------------

.branch01B8CA
#_01B8CA: DEX
#_01B8CB: BMI .branch01B8D9

#_01B8CD: LDA.l $7E3500,X
#_01B8D1: INX
#_01B8D2: STA.l $7E3500,X

#_01B8D6: DEX
#_01B8D7: BPL .branch01B8CA

;---------------------------------------------------------------------------------------------------

.branch01B8D9
#_01B8D9: LDX.w #$0000

#_01B8DC: LDA.w $1004,Y
#_01B8DF: STA.l $7E3500,X

#_01B8E3: REP #$20

#_01B8E5: BIT.w $0524
#_01B8E8: BPL .exit

#_01B8EA: CPY.w #$0780
#_01B8ED: BCS .exit

#_01B8EF: LDY.w #$0780
#_01B8F2: BRA .next

.exit
#_01B8F4: RTS

;===================================================================================================

routine01B8F5:
#_01B8F5: LDA.w $052A
#_01B8F8: AND.w #$0800
#_01B8FB: BEQ .exit

#_01B8FD: JSL routine00C51A

#_01B901: LDA.w $052A
#_01B904: AND.w #$F7FF
#_01B907: STA.w $052A

.exit
#_01B90A: RTS

;===================================================================================================

routine01B90B:
#_01B90B: SEP #$20

#_01B90D: LDA.w $0400
#_01B910: ORA.b #$40
#_01B912: STA.w $0400

#_01B915: LDA.b #$43
#_01B917: STA.w $0F4B

#_01B91A: LDA.b #$1F
#_01B91C: STA.w $0F74

#_01B91F: REP #$30

#_01B921: STZ.w $05D6
#_01B924: STZ.w $05D8
#_01B927: STZ.w $05DA
#_01B92A: STZ.w $05DC

#_01B92D: STZ.w $051E
#_01B930: STZ.w $0520
#_01B933: STZ.w $0522

#_01B936: STZ.w $057C
#_01B939: STZ.w $0580
#_01B93C: STZ.w $0586

#_01B93F: STZ.w $05A8
#_01B942: STZ.w $05AA

#_01B945: STZ.w $05D4

;---------------------------------------------------------------------------------------------------

#_01B948: LDA.w #$0008
#_01B94B: STA.w $0A40
#_01B94E: STA.w $0A42

#_01B951: LDX.w #$0000
#_01B954: LDA.w #$FFFF

.clear_drops
#_01B957: STA.w $0568,X

#_01B95A: INX
#_01B95B: INX
#_01B95C: CPX.w #$0010
#_01B95F: BCC .clear_drops

#_01B961: STZ.w $0564

#_01B964: LDA.w #$0600
#_01B967: STA.w $0526

;---------------------------------------------------------------------------------------------------

#_01B96A: SEP #$30

; TODO menu stuff?
#_01B96C: LDA.b #$04
#_01B96E: LDX.b #$00
#_01B970: LDY.b #$02
#_01B972: STA.w $0EDC
#_01B975: STX.w $0EDF
#_01B978: STY.w $0EDE
#_01B97B: STZ.w $0EDA

.wait
#_01B97E: JSL routine009337

#_01B982: LDA.w $0EDE
#_01B985: JSL Do19XXVectorsATimes

#_01B989: INC.w $0EDA

#_01B98C: LDA.w $0EDA
#_01B98F: CMP.b #$08
#_01B991: BCC .wait

#_01B993: REP #$30

#_01B995: RTS

;===================================================================================================

ClearALotOfBattleStuff:
#_01B996: STZ.w $0566
#_01B999: STZ.w $057A
#_01B99C: STZ.w $05D4
#_01B99F: STZ.w $058A

#_01B9A2: STZ.w $058C
#_01B9A5: STZ.w $058E
#_01B9A8: STZ.w $0590
#_01B9AB: STZ.w $0592

#_01B9AE: STZ.w $0594
#_01B9B1: STZ.w $0596
#_01B9B4: STZ.w $0598
#_01B9B7: STZ.w $059A

#_01B9BA: STZ.w $059C
#_01B9BD: STZ.w $059E
#_01B9C0: STZ.w $05A0
#_01B9C3: STZ.w $05A2

#_01B9C6: STZ.w $05A4
#_01B9C9: STZ.w $05AC
#_01B9CC: STZ.w $05AE
#_01B9CF: STZ.w $05B0

#_01B9D2: STZ.w $05B2

#_01B9D5: RTS

;===================================================================================================

routine01B9D6:
#_01B9D6: JSL BringUpAMenu

#_01B9DA: STZ.w $050E
#_01B9DD: STZ.w $0510
#_01B9E0: STZ.w $05A8
#_01B9E3: STZ.w $0524

#_01B9E6: SEP #$20

#_01B9E8: LDA.w $0400
#_01B9EB: AND.b #$BF
#_01B9ED: STA.w $0400

#_01B9F0: RTS

;===================================================================================================

routine01B9F1:
#_01B9F1: PHP

#_01B9F2: REP #$20

#_01B9F4: LDA.w $0706
#_01B9F7: BMI .branch01BA19

#_01B9F9: SEP #$20
#_01B9FB: LDA.w $0404
#_01B9FE: BNE .branch01BA19

#_01BA00: LDA.w $0711
#_01BA03: CMP.b #$08
#_01BA05: BEQ .branch01BA19

#_01BA07: EOR.b #$07
#_01BA09: STA.w $0600
#_01BA0C: JSL GetRandomInt
#_01BA10: AND.b #$07
#_01BA12: CMP.w $0600
#_01BA15: BEQ .branch01BA1C

#_01BA17: BCC .branch01BA1C

.branch01BA19
#_01BA19: PLP
#_01BA1A: CLC
#_01BA1B: RTS

.branch01BA1C
#_01BA1C: REP #$30
#_01BA1E: LDA.w #$101A
#_01BA21: JSR routine01B430
#_01BA24: ASL A
#_01BA25: STA.w $0600
#_01BA28: LDA.w #$101A
#_01BA2B: JSR routine01B459
#_01BA2E: ASL A
#_01BA2F: STA.w $0602
#_01BA32: LDA.w #$1018
#_01BA35: JSR routine01B430
#_01BA38: STA.w $0604
#_01BA3B: LDA.w #$1018
#_01BA3E: JSR routine01B459
#_01BA41: STA.w $0606
#_01BA44: LDA.w $0602
#_01BA47: SEC
#_01BA48: SBC.w $0600
#_01BA4B: CLC
#_01BA4C: ADC.w $0606
#_01BA4F: SEC
#_01BA50: SBC.w $0604
#_01BA53: BMI .branch01BA19

#_01BA55: LSR A
#_01BA56: LSR A
#_01BA57: BEQ .branch01BA19

#_01BA59: STA.w $0600
#_01BA5C: JSL GetRandomInt
#_01BA60: AND.w #$001F
#_01BA63: CMP.w $0600
#_01BA66: BCS .branch01BA19

#_01BA68: LDX.w #$0000

.branch01BA6B
#_01BA6B: LDA.w $0700,X
#_01BA6E: BMI .branch01BA77

#_01BA70: INX
#_01BA71: INX
#_01BA72: CPX.w #$000C
#_01BA75: BCC .branch01BA6B

.branch01BA77
#_01BA77: TXA
#_01BA78: LSR A
#_01BA79: LSR A
#_01BA7A: STA.w $0600
#_01BA7D: DEX
#_01BA7E: DEX
#_01BA7F: LDY.w #$0000

.branch01BA82
#_01BA82: LDA.w $0700,Y
#_01BA85: PHA
#_01BA86: LDA.w $0700,X
#_01BA89: STA.w $0700,Y
#_01BA8C: PLA
#_01BA8D: STA.w $0700,X
#_01BA90: INY
#_01BA91: INY
#_01BA92: DEC.w $0600
#_01BA95: BEQ .branch01BA9B

#_01BA97: DEX
#_01BA98: DEX
#_01BA99: BPL .branch01BA82

.branch01BA9B
#_01BA9B: LDA.w #$0033
#_01BA9E: JSR routine01B369
#_01BAA1: LDA.w $040D
#_01BAA4: EOR.w #$0002
#_01BAA7: STA.w $040D
#_01BAAA: JSL routine009853
#_01BAAE: JSL UpdateDirTilemap
#_01BAB2: JSL routine00A17E
#_01BAB6: PLP
#_01BAB7: SEC
#_01BAB8: RTS

;===================================================================================================

routine01BAB9:
#_01BAB9: PHP
#_01BABA: REP #$30
#_01BABC: LDA.w #$101A
#_01BABF: JSR routine01B430
#_01BAC2: LSR A
#_01BAC3: STA.w $0600
#_01BAC6: LDA.w #$101A
#_01BAC9: JSR routine01B459
#_01BACC: LSR A
#_01BACD: STA.w $0602
#_01BAD0: LDA.w #$1018
#_01BAD3: JSR routine01B430
#_01BAD6: STA.w $0604
#_01BAD9: LDA.w #$1018
#_01BADC: JSR routine01B459
#_01BADF: STA.w $0606

#_01BAE2: SEP #$20
#_01BAE4: LDA.w $0714
#_01BAE7: STA.w $0608
#_01BAEA: EOR.b #$0F
#_01BAEC: SEC
#_01BAED: SBC.b #$07
#_01BAEF: STA.w $060A
#_01BAF2: LDA.b #$00
#_01BAF4: STA.w $0609
#_01BAF7: STA.w $060B

#_01BAFA: REP #$20
#_01BAFC: CLC
#_01BAFD: LDA.w $0602
#_01BB00: ADC.w $0606
#_01BB03: ADC.w $060A
#_01BB06: STA.w $0602
#_01BB09: CLC
#_01BB0A: LDA.w $0600
#_01BB0D: ADC.w $0604
#_01BB10: ADC.w $0608
#_01BB13: SEC
#_01BB14: SBC.w $0602
#_01BB17: AND.w #$7FFF
#_01BB1A: STA.w $0528
#_01BB1D: BEQ .exit

#_01BB1F: BCS .branch01BB25

#_01BB21: EOR.w #$7FFF
#_01BB24: INC A

.branch01BB25
#_01BB25: STA.w $0600
#_01BB28: JSL GetRandomInt
#_01BB2C: AND.w #$003F
#_01BB2F: CMP.w $0600
#_01BB32: BCS .exit

#_01BB34: LDA.w $0528
#_01BB37: ORA.w #$8000
#_01BB3A: STA.w $0528

.exit
#_01BB3D: PLP
#_01BB3E: RTS

;===================================================================================================
; TODO
;===================================================================================================
SomethingBattleMenu:
#_01BB3F: PHP
#_01BB40: REP #$30

#_01BB42: LDA.w $052A
#_01BB45: AND.w #$DFFF
#_01BB48: STA.w $052A

#_01BB4B: AND.w #$4000
#_01BB4E: BEQ branch01BB64

#_01BB50: LDA.w $0F2D
#_01BB53: BIT.w #$8000
#_01BB56: BNE .branch01BB5B
#_01BB58: JMP branch01BDBE

.branch01BB5B
#_01BB5B: LDA.w $052A
#_01BB5E: AND.w #$BFFF
#_01BB61: STA.w $052A

;===================================================================================================

branch01BB64:
#_01BB64: JSR HandleBattleSong_auto
#_01BB67: JSR routine01C1B9

#_01BB6A: BIT.w $0528
#_01BB6D: BPL branch01BB77
#_01BB6F: BVS branch01BBE5

; caught them off guard
#_01BB71: LDA.w #$002C
#_01BB74: JSR DisplayCombatMessage

;===================================================================================================

branch01BB77:
#_01BB77: LDA.w #$0001 ; so type 7
#_01BB7A: JSL RunOpenMenuDMA_Xplus6

#_01BB7E: LDA.w $052A
#_01BB81: AND.w #$0800
#_01BB84: BEQ .branch01BB93

#_01BB86: JSL routine00C51A

#_01BB8A: LDA.w $052A
#_01BB8D: AND.w #$F7FF
#_01BB90: STA.w $052A

; what will you do??
.branch01BB93
#_01BB93: LDA.w #$0007
#_01BB96: JSR DisplayCombatMessage

;---------------------------------------------------------------------------------------------------

.next
#_01BB99: STZ.w $0ED2

#_01BB9C: LDA.w #$3C58 ; $78B0 VRAM
#_01BB9F: LDY.w #$0003
#_01BBA2: LDX.w #$5006
#_01BBA5: JSL WaitForMenuChoice_A

#_01BBA9: LDA.w $0E9A
#_01BBAC: BPL .done_menu

#_01BBAE: LDA.w #$0001
#_01BBB1: JSL RunOpenMenuDMA_Xplus6
#_01BBB5: BRA .next

;---------------------------------------------------------------------------------------------------

.done_menu
#_01BBB7: ASL A
#_01BBB8: TAX

#_01BBB9: LDA.l .vectors,X
#_01BBBD: STA.w $0600

#_01BBC0: JMP ($0600)

.vectors
#_01BBC3: dw CombatMenu_Fight
#_01BBC5: dw CombatMenu_Escape
#_01BBC7: dw CombatMenu_Talk
#_01BBC9: dw CombatMenu_Auto

;===================================================================================================

CombatMenu_Fight:
#_01BBCB: JSR HandleBattleSong_fight

#_01BBCE: LDA.w $052A
#_01BBD1: ORA.w #$8000
#_01BBD4: STA.w $052A

#_01BBD7: JSR CombatMenu_HandleFightMenu

#_01BBDA: BCC .branch01BBDF
#_01BBDC: JMP branch01BB77

.branch01BBDF
#_01BBDF: JSR routine01C0D0

#_01BBE2: PLP
#_01BBE3: CLC

#_01BBE4: RTS

;===================================================================================================

branch01BBE5:
#_01BBE5: JSR HandleBattleSong_fight

; enemy attacked without warning
#_01BBE8: LDA.w #$002D
#_01BBEB: JSR DisplayCombatMessage

;===================================================================================================

FailedToEscape:
#_01BBEE: JSR routine01C0D0

#_01BBF1: LDA.w $052A
#_01BBF4: ORA.w #$8000
#_01BBF7: STA.w $052A

#_01BBFA: PLP
#_01BBFB: CLC

#_01BBFC: RTS

;===================================================================================================

CombatMenu_Escape:
#_01BBFD: JSR CalculateEscapeSuccess
#_01BC00: BCS FailedToEscape

#_01BC02: LDA.w #$FFFF
#_01BC05: STA.w $0566

#_01BC08: PLP
#_01BC09: SEC

#_01BC0A: RTS

;===================================================================================================

CombatMenu_Talk:
#_01BC0B: LDA.w $052A
#_01BC0E: AND.w #$0100
#_01BC11: BNE .branch01BC1A

#_01BC13: BIT.w $0524
#_01BC16: BPL .branch01BC23
#_01BC18: BVC .branch01BC23

.branch01BC1A
#_01BC1A: LDA.w #$0026

.branch01BC1D
#_01BC1D: JSR DisplayCombatMessage
#_01BC20: JMP branch01BB64

.branch01BC23
#_01BC23: LDA.w $057A
#_01BC26: BNE .branch01BC1A

#_01BC28: LDA.w $1002
#_01BC2B: AND.w #$F070
#_01BC2E: BEQ .branch01BC35

#_01BC30: LDA.w #$0027
#_01BC33: BRA .branch01BC1D

.branch01BC35
#_01BC35: STZ.w $0528
#_01BC38: LDA.w $052A
#_01BC3B: ORA.w #$9000
#_01BC3E: STA.w $052A
#_01BC41: LDA.w #$000D
#_01BC44: JSR DisplayCombatMessage
#_01BC47: LDA.w #$3DC4
#_01BC4A: STA.w $0A1A
#_01BC4D: LDX.w #$0600

.branch01BC50
#_01BC50: LDA.w $1000,X
#_01BC53: BPL .branch01BC5D

#_01BC55: LDA.w $1002,X
#_01BC58: AND.w #$C000
#_01BC5B: BEQ .branch01BC6F

.branch01BC5D
#_01BC5D: TXA
#_01BC5E: CLC
#_01BC5F: ADC.w #$0060
#_01BC62: TAX
#_01BC63: CMP.w #$0900
#_01BC66: BCC .branch01BC50

#_01BC68: JSL routine01CA65
#_01BC6C: LDX.w #$0600

.branch01BC6F
#_01BC6F: LDY.w #$0000
#_01BC72: LDA.w $0524
#_01BC75: BEQ .branch01BC7E

#_01BC77: CPX.w #$0780
#_01BC7A: BCC .branch01BC7E

#_01BC7C: INY
#_01BC7D: INY

.branch01BC7E
#_01BC7E: STY.w $0564
#_01BC81: STX.w $0526

#_01BC84: LDA.w $104C,X
#_01BC87: STA.w $0A22

#_01BC8A: JSL routine038354
#_01BC8E: JSL routine0F9493

#_01BC92: LDA.w #$0002
#_01BC95: JSL InitializeTextBoxToSizeForNewMessage
#_01BC99: JSR routine01B34A

#_01BC9C: LDA.w $052A
#_01BC9F: AND.w #$EFFF
#_01BCA2: STA.w $052A

#_01BCA5: LDA.w $0A4C
#_01BCA8: ASL A
#_01BCA9: TAX

#_01BCAA: LDA.l .vectors,X
#_01BCAE: STA.w $0600

#_01BCB1: JMP ($0600)

.vectors
#_01BCB4: dw branch01BB64_bounce
#_01BCB6: dw branch01BB64_Reset057A
#_01BCB8: dw routine01BCCA
#_01BCBA: dw routine01BCCF
#_01BCBC: dw routine01BD1C
#_01BCBE: dw routine01BCF5
#_01BCC0: dw routine01BD2E
#_01BCC2: dw routine01BD2E
#_01BCC4: dw routine01BCD7
#_01BCC6: dw routine01BD4A
#_01BCC8: dw branch01BB64_bounce

;===================================================================================================

routine01BCCA:
#_01BCCA: LDA.w #$C000
#_01BCCD: BRA branch01BCD2

routine01BCCF:
#_01BCCF: LDA.w #$8000

;===================================================================================================

branch01BCD2:
#_01BCD2: STA.w $0528
#_01BCD5: BRA branch01BB64_bounce

;===================================================================================================

routine01BCD7:
#_01BCD7: LDY.w $0564

#_01BCDA: LDA.w $0512,Y
#_01BCDD: INC A
#_01BCDE: STA.w $0512,Y

#_01BCE1: CMP.w $050E,Y
#_01BCE4: BCC .branch01BCE9

#_01BCE6: STA.w $050E,Y

.branch01BCE9
#_01BCE9: LDY.w $0526

#_01BCEC: LDA.w #$0001
#_01BCEF: JSL routine01F537
#_01BCF3: BRA branch01BD0D

;===================================================================================================

routine01BCF5:
#_01BCF5: LDX.w $0526
#_01BCF8: STZ.w $1000,X

#_01BCFB: LDX.w $0564
#_01BCFE: DEC.w $0512,X
#_01BD01: BEQ routine01BD2E

#_01BD03: LDX.w $0526
#_01BD06: STX.w $051A
#_01BD09: JSL routine01E76D

;===================================================================================================

branch01BD0D:
#_01BD0D: JSR routine01C1B9

;===================================================================================================

branch01BB64_bounce:
#_01BD10: JMP branch01BB64

;===================================================================================================

branch01BB64_Reset057A:
#_01BD13: LDA.w #$FFFF
#_01BD16: STA.w $057A

#_01BD19: JMP branch01BB64

;===================================================================================================

routine01BD1C:
#_01BD1C: LDA.w $052A
#_01BD1F: ORA.w #$2000
#_01BD22: STA.w $052A

#_01BD25: LDA.w #$FFFF
#_01BD28: STA.w $0566

#_01BD2B: PLP
#_01BD2C: SEC

#_01BD2D: RTS

;===================================================================================================

routine01BD2E:
#_01BD2E: LDA.w $052A
#_01BD31: ORA.w #$0200
#_01BD34: STA.w $052A
#_01BD37: STZ.w $0512
#_01BD3A: STZ.w $0514
#_01BD3D: LDA.w #$FFFF
#_01BD40: STA.w $0566
#_01BD43: JSL routine01E60C
#_01BD47: PLP
#_01BD48: SEC
#_01BD49: RTS

;===================================================================================================

routine01BD4A:
#_01BD4A: LDA.w $052A
#_01BD4D: ORA.w #$0400
#_01BD50: STA.w $052A
#_01BD53: LDX.w #$0180

.branch01BD56
#_01BD56: LDA.w $1000,X
#_01BD59: BPL .branch01BD6A

#_01BD5B: TXA
#_01BD5C: CLC
#_01BD5D: ADC.w #$0060
#_01BD60: TAX
#_01BD61: CPX.w #$0600
#_01BD64: BCC .branch01BD56

#_01BD66: JSL routine01CA65

.branch01BD6A
#_01BD6A: LDY.w #$0000

.branch01BD6D
#_01BD6D: PHY
#_01BD6E: LDY.w $0526
#_01BD71: LDA.w $1000,Y
#_01BD74: STA.w $1000,X
#_01BD77: INC.w $0526
#_01BD7A: INX
#_01BD7B: PLY
#_01BD7C: INY
#_01BD7D: CPY.w #$0060
#_01BD80: BCC .branch01BD6D

#_01BD82: TXA
#_01BD83: SEC
#_01BD84: SBC.w #$0060
#_01BD87: TAX
#_01BD88: LDA.w #$0000
#_01BD8B: STA.w $1002,X
#_01BD8E: STA.w $1008,X
#_01BD91: LDA.w $1030,X
#_01BD94: STA.w $102E,X
#_01BD97: LDA.w $1034,X
#_01BD9A: STA.w $1032,X
#_01BD9D: LDA.w #$FFFF
#_01BDA0: STA.w $0566
#_01BDA3: PLP
#_01BDA4: SEC
#_01BDA5: RTS

;===================================================================================================

CombatMenu_Auto:
#_01BDA6: JSR HandleBattleSong_fight

#_01BDA9: LDA.w #$000E
#_01BDAC: JSR DisplayCombatMessage
#_01BDAF: JSR routine01C311

#_01BDB2: LDA.w $052A
#_01BDB5: ORA.w #$C000
#_01BDB8: STA.w $052A

#_01BDBB: JSR routine01C1B9

;===================================================================================================

branch01BDBE:
#_01BDBE: JSR routine01C0D0

#_01BDC1: LDA.w $052A
#_01BDC4: AND.w #$0800
#_01BDC7: BNE .branch01BDD6

#_01BDC9: JSL HideTheMenu

#_01BDCD: LDA.w $052A
#_01BDD0: ORA.w #$0800
#_01BDD3: STA.w $052A

.branch01BDD6
#_01BDD6: PLP
#_01BDD7: CLC

#_01BDD8: RTS

;===================================================================================================
; TODO figure all of this out
;===================================================================================================
CombatMenu_HandleFightMenu:
#_01BDD9: STZ.w $0500
#_01BDDC: STZ.w $0ED2

.branch01BDDF
#_01BDDF: LDA.w #$3C58 ; $78B0 VRAM
#_01BDE2: LDY.w #$0004
#_01BDE5: LDX.w #$1006
#_01BDE8: JSL CacheCursorPositionAndSet

.nextcombatant
#_01BDEC: LDY.w $0500
#_01BDEF: LDX.w $0700,Y
#_01BDF2: BPL .branch01BDF7
#_01BDF4: JMP .branch01BEB8

.branch01BDF7
#_01BDF7: LDA.w $1002,X
#_01BDFA: AND.w #$F070
#_01BDFD: BEQ .notinflicted
#_01BDFF: JMP .branch01BEA5

; is this the stuff that prevents fighting?
.notinflicted
#_01BE02: LDA.w $1008,X
#_01BE05: AND.w #$FF00
#_01BE08: STA.w $1008,X

#_01BE0B: LDY.w #$0002
#_01BE0E: LDA.w $1004,X
#_01BE11: PHA
#_01BE12: BPL .handle_menu_options

#_01BE14: LDY.w #$0000
#_01BE17: AND.w #$7FFF
#_01BE1A: BEQ .handle_menu_options

#_01BE1C: INY

.handle_menu_options
#_01BE1D: TYA
#_01BE1E: CLC
#_01BE1F: ADC.w #$0002
#_01BE22: JSL RunOpenMenuDMA_Xplus6
#_01BE26: PLA
#_01BE27: STA.w $0A3E

.branch01BE2A
#_01BE2A: JSR routine01C1B9
#_01BE2D: LDA.w #$0009
#_01BE30: JSR DisplayCombatMessage
#_01BE33: JSL WaitForMenuChoice_FirstPerson
#_01BE37: LDA.w $0E9A
#_01BE3A: BPL .branch01BE95

.branch01BE3C
#_01BE3C: DEC.w $0500
#_01BE3F: DEC.w $0500
#_01BE42: BPL .branch01BE6F

.branch01BE44
#_01BE44: STZ.w $0500

.branch01BE47
#_01BE47: LDY.w $0500
#_01BE4A: LDX.w $0700,Y
#_01BE4D: BMI .branch01BE6D

#_01BE4F: LDA.w $1008,X
#_01BE52: AND.w #$FF00
#_01BE55: STA.w $1008,X
#_01BE58: JSL routine00A1E7
#_01BE5C: JSL AddSelfAsVector
#_01BE60: LDA.w $0500
#_01BE63: INC A
#_01BE64: INC A
#_01BE65: STA.w $0500
#_01BE68: CMP.w #$000C
#_01BE6B: BCC .branch01BE47

.branch01BE6D
#_01BE6D: SEC
#_01BE6E: RTS

.branch01BE6F
#_01BE6F: LDY.w $0500
#_01BE72: LDX.w $0700,Y
#_01BE75: LDA.w $1002,X
#_01BE78: AND.w #$F070
#_01BE7B: BNE .branch01BE3C

#_01BE7D: LDA.w $1008,X
#_01BE80: AND.w #$FF00
#_01BE83: STA.w $1008,X
#_01BE86: JSL routine00A1E7
#_01BE8A: JSL AddSelfAsVector
#_01BE8E: JSL GoToPreviousMenu
#_01BE92: JMP .nextcombatant

.branch01BE95
#_01BE95: JSR routine01BEF3
#_01BE98: BCS .branch01BE2A

#_01BE9A: LDY.w $0500
#_01BE9D: JSL routine00A1E7
#_01BEA1: JSL AddSelfAsVector

.branch01BEA5
#_01BEA5: STZ.w $0E9A
#_01BEA8: LDA.w $0500
#_01BEAB: INC A
#_01BEAC: INC A
#_01BEAD: STA.w $0500
#_01BEB0: CMP.w #$000C
#_01BEB3: BCS .branch01BEB8
#_01BEB5: JMP .branch01BDDF

.branch01BEB8
#_01BEB8: JSR routine01C1B9
#_01BEBB: LDA.w #$0010
#_01BEBE: JSR DisplayCombatMessage
#_01BEC1: JSL RunOpenMenuDMA_type0B
#_01BEC5: LDA.w #$3C58
#_01BEC8: LDY.w #$0001
#_01BECB: LDX.w #$5003
#_01BECE: JSL WaitForMenuChoice_A
#_01BED2: LDA.w $0E9A
#_01BED5: BEQ .branch01BEDA
#_01BED7: JMP .branch01BE44

.branch01BEDA
#_01BEDA: LDA.w $052A
#_01BEDD: ORA.w #$0800
#_01BEE0: STA.w $052A
#_01BEE3: JSL HideTheMenu
#_01BEE7: CLC
#_01BEE8: RTS

data01BEE9:
#_01BEE9: dw $0001,$0002,$0004,$0008
#_01BEF1: dw $0010

;===================================================================================================
; 
;===================================================================================================
routine01BEF3:
#_01BEF3: PHB
#_01BEF4: PHK
#_01BEF5: PLB
#_01BEF6: LDY.w $0500
#_01BEF9: LDX.w $0700,Y
#_01BEFC: ASL A
#_01BEFD: TAY
#_01BEFE: LDA.w data01BEE9,Y
#_01BF01: ORA.w $1008,X
#_01BF04: STA.w $1008,X
#_01BF07: PLB
#_01BF08: STZ.w $105C,X
#_01BF0B: CPX.w #$0180
#_01BF0E: BCC .branch01BF2D

#_01BF10: BIT.w #$0007
#_01BF13: BNE .branch01BF18
#_01BF15: JMP .branch01BF9C

.branch01BF18
#_01BF18: BIT.w #$0006
#_01BF1B: BNE .branch01BF20
#_01BF1D: JMP .branch01BF97

.branch01BF20
#_01BF20: BIT.w #$0004
#_01BF23: BNE .branch01BF4D

#_01BF25: JSR routine01BFE2
#_01BF28: BCC .branch01BF56
#_01BF2A: JMP .branch01BF9E

.branch01BF2D
#_01BF2D: BIT.w #$0007
#_01BF30: BEQ .branch01BF70

#_01BF32: BIT.w #$0003
#_01BF35: BNE .branch01BF45

#_01BF37: CPX.w #$0060
#_01BF3A: BCS .branch01BF4D

#_01BF3C: JSL routine018768
#_01BF40: BCC .branch01BF9C

#_01BF42: JMP .branch01BF9E

.branch01BF45
#_01BF45: JSR routine01BFB2
#_01BF48: BCC .branch01BF97

#_01BF4A: JMP .branch01BF9E

.branch01BF4D
#_01BF4D: STX.w $0715
#_01BF50: JSL routine01AB0B
#_01BF54: BCS .branch01BF9E

.branch01BF56
#_01BF56: LDY.w $0500
#_01BF59: LDX.w $0700,Y
#_01BF5C: LDA.w $1058,X
#_01BF5F: AND.w #$00FF
#_01BF62: LDY.w #$0001
#_01BF65: JSL GetSkillProperty
#_01BF69: AND.w #$00FF
#_01BF6C: BEQ .branch01BF9C
#_01BF6E: BRA .branch01BF97

.branch01BF70
#_01BF70: BIT.w #$0008
#_01BF73: BEQ .branch01BF9C

#_01BF75: STX.w $0715
#_01BF78: JSL routine019F04
#_01BF7C: BCS .branch01BF9E

#_01BF7E: LDX.w $0715
#_01BF81: LDA.w $1058,X
#_01BF84: AND.w #$00FF
#_01BF87: SEC
#_01BF88: SBC.w #$00B0
#_01BF8B: LDY.w #$0002
#_01BF8E: JSL GetUseItemStat
#_01BF92: AND.w #$FF00
#_01BF95: BMI .branch01BF9C

.branch01BF97
#_01BF97: JSR routine01C04D
#_01BF9A: BCS .branch01BF9E

.branch01BF9C
#_01BF9C: CLC
#_01BF9D: RTS

.branch01BF9E
#_01BF9E: DEC.w $0ED2
#_01BFA1: LDY.w $0500
#_01BFA4: LDX.w $0700,Y
#_01BFA7: LDA.w $1008,X
#_01BFAA: AND.w #$FF00
#_01BFAD: STA.w $1008,X
#_01BFB0: SEC
#_01BFB1: RTS

;===================================================================================================

routine01BFB2:
#_01BFB2: BIT.w #$0001
#_01BFB5: BNE .branch01BFD3

#_01BFB7: LDA.w $1044,X
#_01BFBA: BMI .branch01BFD8

#_01BFBC: LDA.w $1046,X
#_01BFBF: BPL .branch01BFE0

#_01BFC1: LDA.w $1044,X
#_01BFC4: CMP.w #$004E
#_01BFC7: BEQ .branch01BFE0

#_01BFC9: CMP.w #$004F
#_01BFCC: BEQ .branch01BFE0

#_01BFCE: LDA.w #$0029
#_01BFD1: BRA .branch01BFDB

.branch01BFD3
#_01BFD3: LDA.w $1042,X
#_01BFD6: BPL .branch01BFE0

.branch01BFD8
#_01BFD8: LDA.w #$0028

.branch01BFDB
#_01BFDB: JSR DisplayCombatMessage
#_01BFDE: SEC
#_01BFDF: RTS

.branch01BFE0
#_01BFE0: CLC
#_01BFE1: RTS

;===================================================================================================

routine01BFE2:
#_01BFE2: PHX
#_01BFE3: LDY.w #$0000
#_01BFE6: STY.w $0600

.branch01BFE9
#_01BFE9: LDA.w $103E,X
#_01BFEC: CMP.w #$0040
#_01BFEF: BCC .branch01BFFE

#_01BFF1: CMP.w #$00FF
#_01BFF4: BEQ .branch01BFFE

#_01BFF6: CMP.w #$006A
#_01BFF9: BCS .branch01BFFE

#_01BFFB: INC.w $0600

.branch01BFFE
#_01BFFE: INX
#_01BFFF: INX
#_01C000: INY
#_01C001: CPY.w #$0003
#_01C004: BCC .branch01BFE9

#_01C006: LDA.w $0600
#_01C009: BEQ .branch01C044

#_01C00B: DEC.w $0600
#_01C00E: BEQ .branch01C01A

#_01C010: JSL GetRandomInt
#_01C014: AND.w #$0001
#_01C017: STA.w $0600

.branch01C01A
#_01C01A: PLX
#_01C01B: PHX
#_01C01C: LDY.w #$0000

.branch01C01F
#_01C01F: LDA.w $103E,X
#_01C022: CMP.w #$0040
#_01C025: BCC .branch01C037

#_01C027: CMP.w #$00FF
#_01C02A: BEQ .branch01C037

#_01C02C: CMP.w #$006A
#_01C02F: BCS .branch01C037

#_01C031: CPY.w $0600
#_01C034: BEQ .branch01C03E

#_01C036: INY

.branch01C037
#_01C037: INX
#_01C038: INX
#_01C039: CPY.w #$0003
#_01C03C: BCC .branch01C01F

.branch01C03E
#_01C03E: PLX
#_01C03F: STA.w $1058,X
#_01C042: CLC
#_01C043: RTS

.branch01C044
#_01C044: LDA.w #$002B
#_01C047: JSR DisplayCombatMessage
#_01C04A: PLX
#_01C04B: SEC
#_01C04C: RTS

;===================================================================================================

routine01C04D:
#_01C04D: BIT.w $0524
#_01C050: BPL .branch01C0B8

#_01C052: BVC .branch01C0B8

#_01C054: STZ.w $0564
#_01C057: LDA.w #$000F
#_01C05A: JSR routine01B369
#_01C05D: LDA.w #$0006
#_01C060: JSR DisplayCombatMessage

.branch01C063
#_01C063: JSL AddSelfAsVector
#_01C067: LDA.w $0F2B
#_01C06A: BIT.w #$8380
#_01C06D: BEQ .branch01C063

#_01C06F: BIT.w #$8080
#_01C072: BNE .branch01C09D

#_01C074: LDA.w #$0001 ; SFX 01
#_01C077: JSL Write_to_APU_transferrable
#_01C07B: LDA.w $0F2B
#_01C07E: AND.w #$0300
#_01C081: XBA
#_01C082: DEC A
#_01C083: EOR.w #$0001
#_01C086: STA.w $0564
#_01C089: ASL A
#_01C08A: TAY
#_01C08B: LDX.w $0512,Y
#_01C08E: STX.w $0A54
#_01C091: STZ.w $0A56
#_01C094: CLC
#_01C095: ADC.w #$0006
#_01C098: JSR DisplayCombatMessage
#_01C09B: BRA .branch01C063

.branch01C09D
#_01C09D: BIT.w #$0080
#_01C0A0: BNE .branch01C0AB

#_01C0A2: LDA.w #$0003 ; SFX 03
#_01C0A5: JSL Write_to_APU_transferrable
#_01C0A9: SEC
#_01C0AA: RTS

.branch01C0AB
#_01C0AB: LDA.w #$0002 ; SFX 02
#_01C0AE: JSL Write_to_APU_transferrable
#_01C0B2: LDA.w $0564
#_01C0B5: ASL A
#_01C0B6: BRA .branch01C0C5

.branch01C0B8
#_01C0B8: LDA.w #$0000
#_01C0BB: LDX.w $0512
#_01C0BE: BMI .branch01C0C2

#_01C0C0: BNE .branch01C0C5

.branch01C0C2
#_01C0C2: LDA.w #$0002

.branch01C0C5
#_01C0C5: LDY.w $0500
#_01C0C8: LDX.w $0700,Y
#_01C0CB: STA.w $105C,X
#_01C0CE: CLC
#_01C0CF: RTS

;===================================================================================================

routine01C0D0:
#_01C0D0: LDX.w #$0600

.branch01C0D3
#_01C0D3: STX.w $0502
#_01C0D6: LDA.w $1000,X
#_01C0D9: BPL .branch01C14D

#_01C0DB: LDA.w $1002,X
#_01C0DE: BIT.w #$F170
#_01C0E1: BNE .branch01C14D

#_01C0E3: BIT.w #$0604
#_01C0E6: BNE .branch01C144

#_01C0E8: LDA.w $103C,X
#_01C0EB: AND.w #$001F
#_01C0EE: TAX
#_01C0EF: LDY.w #$0004
#_01C0F2: LDA.w #data07CB96
#_01C0F5: JSR GetDynamicSuccessiveHitChances
#_01C0F8: DEX
#_01C0F9: BMI .branch01C144

#_01C0FB: TXA
#_01C0FC: ASL A
#_01C0FD: CLC
#_01C0FE: ADC.w $0502
#_01C101: TAY
#_01C102: LDA.w $103E,Y
#_01C105: CMP.w #$006A
#_01C108: BCC .branch01C114

#_01C10A: CMP.w #$0073
#_01C10D: BCC .branch01C144

#_01C10F: CMP.w #$0076
#_01C112: BCS .branch01C144

.branch01C114
#_01C114: LDX.w $0502
#_01C117: STA.w $1058,X
#_01C11A: CMP.w #$0040
#_01C11D: BCS .branch01C13F

#_01C11F: CMP.w #$003E
#_01C122: BCS .branch01C144

#_01C124: LDY.w #$0001
#_01C127: JSL GetSkillProperty
#_01C12B: AND.w #$FF00
#_01C12E: BPL .branch01C13A

#_01C130: CMP.w #$FF00
#_01C133: BEQ .branch01C13A

#_01C135: JSR routine01C15E
#_01C138: BCS .branch01C144

.branch01C13A
#_01C13A: LDA.w #$0004
#_01C13D: BRA .branch01C147

.branch01C13F
#_01C13F: LDA.w #$0002
#_01C142: BRA .branch01C147

.branch01C144
#_01C144: LDA.w #$0001

.branch01C147
#_01C147: LDX.w $0502
#_01C14A: STA.w $1008,X

.branch01C14D
#_01C14D: LDA.w $0502
#_01C150: CLC
#_01C151: ADC.w #$0060
#_01C154: TAX
#_01C155: CPX.w #$0900
#_01C158: BCS .branch01C15D

#_01C15A: JMP .branch01C0D3

.branch01C15D
#_01C15D: RTS

;===================================================================================================

routine01C15E:
#_01C15E: XBA
#_01C15F: AND.w #$0007
#_01C162: BEQ .branch01C18C

#_01C164: CMP.w #$0002
#_01C167: BEQ .branch01C16B

#_01C169: SEC
#_01C16A: RTS

.branch01C16B
#_01C16B: LDY.w #$0600

.branch01C16E
#_01C16E: LDA.w $1000,Y
#_01C171: BPL .branch01C180

#_01C173: LDA.w $1002,Y
#_01C176: AND.w #$C000
#_01C179: BNE .branch01C180

#_01C17B: LDA.w $1002,Y
#_01C17E: BNE .branch01C1B0

.branch01C180
#_01C180: TYA
#_01C181: CLC
#_01C182: ADC.w #$0060
#_01C185: TAY
#_01C186: CPY.w #$0900
#_01C189: BCC .branch01C16E

#_01C18B: RTS

.branch01C18C
#_01C18C: LDY.w #$0600

.branch01C18F
#_01C18F: LDA.w $1000,Y
#_01C192: BPL .branch01C1A4

#_01C194: LDA.w $1002,Y
#_01C197: AND.w #$C000
#_01C19A: BNE .branch01C1A4

#_01C19C: LDA.w $102E,Y
#_01C19F: CMP.w $1030,Y
#_01C1A2: BCC .branch01C1B0

.branch01C1A4
#_01C1A4: TYA
#_01C1A5: CLC
#_01C1A6: ADC.w #$0060
#_01C1A9: TAY
#_01C1AA: CPY.w #$0900
#_01C1AD: BCC .branch01C18F

#_01C1AF: RTS

.branch01C1B0
#_01C1B0: TYA
#_01C1B1: LDX.w $0502
#_01C1B4: STA.w $105A,X
#_01C1B7: CLC
#_01C1B8: RTS

;===================================================================================================

routine01C1B9:
#_01C1B9: LDA.w #$0001
#_01C1BC: BIT.w $052A
#_01C1BF: BPL .branch01C1C2

#_01C1C1: INC A

.branch01C1C2
#_01C1C2: BIT.w $0524
#_01C1C5: BPL .branch01C1CC

#_01C1C7: BVC .branch01C1E2

#_01C1C9: INC A
#_01C1CA: INC A
#_01C1CB: INC A

.branch01C1CC
#_01C1CC: LDX.w $0512

.branch01C1CF
#_01C1CF: STX.w $0A54
#_01C1D2: STZ.w $0A56
#_01C1D5: JSR routine01B369
#_01C1D8: BIT.w $052A
#_01C1DB: BMI .branch01C1E1

#_01C1DD: JSL routine01E642

.branch01C1E1
#_01C1E1: RTS

.branch01C1E2
#_01C1E2: LDA.w #$0002
#_01C1E5: LDX.w $0512
#_01C1E8: BNE .branch01C1CF

#_01C1EA: INC A
#_01C1EB: LDX.w $0514
#_01C1EE: BRA .branch01C1CF

CalculateEscapeSuccess:
#_01C1F0: LDA.w $052A
#_01C1F3: ORA.w #$2000
#_01C1F6: STA.w $052A

#_01C1F9: LDA.w $050A
#_01C1FC: CMP.w #$0100
#_01C1FF: BCC .notbossbattle
#_01C201: JMP .bossbattle

.notbossbattle
#_01C204: LDA.w $052A
#_01C207: AND.w #$0100
#_01C20A: BEQ .stillnotbossbattle
#_01C20C: JMP .bossbattle

.stillnotbossbattle
#_01C20F: SEP #$20
#_01C211: LDA.w $0404 ; TODO??
#_01C214: BNE .branch01C2CC

; I think this is turning you around?
#_01C216: LDA.w $040D
#_01C219: PHA
#_01C21A: EOR.b #$02
#_01C21C: STA.w $040D
#_01C21F: JSL routine009BDE
#_01C223: PLA
#_01C224: STA.w $040D
#_01C227: BCC .branch01C2CC
#_01C229: JMP .branch01C2F9

.branch01C2CC
#_01C22C: REP #$20
#_01C22E: BIT.w $0528
#_01C231: BPL .branch01C238
#_01C233: BVS .branch01C238
#_01C235: JMP .branch01C2A3

.branch01C238
#_01C238: LDY.w #$0000
#_01C23B: STZ.w $0620
#_01C23E: STZ.w $0622

.branch01C241
#_01C241: LDX.w $0700,Y
#_01C244: BMI .branch01C262

#_01C246: LDA.w $1002,X
#_01C249: AND.w #$C000
#_01C24C: BNE .branch01C25E

#_01C24E: LDA.w $0620
#_01C251: CLC
#_01C252: ADC.w $1018,X
#_01C255: ADC.w $101A,X
#_01C258: STA.w $0620
#_01C25B: INC.w $0622

.branch01C25E
#_01C25E: INY
#_01C25F: INY
#_01C260: BCC .branch01C241

.branch01C262
#_01C262: LDX.w #$0600

.branch01C265
#_01C265: LDA.w $1000,X
#_01C268: BMI .branch01C272

#_01C26A: TXA
#_01C26B: CLC
#_01C26C: ADC.w #$0060
#_01C26F: TAX
#_01C270: BRA .branch01C265

.branch01C272
#_01C272: LDA.w $1018,X
#_01C275: CLC
#_01C276: ADC.w $101A,X

#_01C279: SEP #$20
#_01C27B: STA.w PPUMULT16
#_01C27E: XBA
#_01C27F: STA.w PPUMULT16
#_01C282: LDA.w $0622
#_01C285: STA.w PPUMULT8
#_01C288: JSL GetRandomInt

#_01C28C: REP #$20
#_01C28E: AND.w #$0007
#_01C291: CLC
#_01C292: ADC.w MPYL
#_01C295: CMP.w $0620
#_01C298: BCC .branch01C2A3

#_01C29A: JSL GetRandomInt
#_01C29E: AND.w #$000F
#_01C2A1: BNE .bossbattle

.branch01C2A3
#_01C2A3: LDA.w $052A
#_01C2A6: AND.w #$0100
#_01C2A9: BNE .branch01C2B2

#_01C2AB: SEP #$20
#_01C2AD: LDA.w $0404
#_01C2B0: BNE .branch01C2D6

.branch01C2B2
#_01C2B2: SEP #$30
#_01C2B4: LDA.w $040D
#_01C2B7: ASL A
#_01C2B8: TAX
#_01C2B9: LDA.l data01C309,X
#_01C2BD: CLC
#_01C2BE: ADC.w $070C
#_01C2C1: STA.w $070C
#_01C2C4: LDA.l data01C30A,X
#_01C2C8: CLC
#_01C2C9: ADC.w $070D
#_01C2CC: STA.w $070D
#_01C2CF: JSL routine009BDE
#_01C2D3: STA.w $0711

.branch01C2D6
#_01C2D6: REP #$20
#_01C2D8: LDA.w #$000A
#_01C2DB: JSR DoTextInCombatMaybe

#_01C2DE: SEP #$20
#_01C2E0: LDA.w $0404
#_01C2E3: BNE .branch01C2ED

#_01C2E5: JSL routine009853
#_01C2E9: JSL AddSelfAsVector

.branch01C2ED
#_01C2ED: REP #$20
#_01C2EF: STZ.w $0504
#_01C2F2: CLC
#_01C2F3: RTS

.bossbattle
#_01C2F4: LDA.w #$000B
#_01C2F7: BRA .branch01C2FE

.branch01C2F9
#_01C2F9: REP #$20
#_01C2FB: LDA.w #$000C

.branch01C2FE
#_01C2FE: JSR DoTextInCombatMaybe
#_01C301: LDA.w #$FFFF
#_01C304: STA.w $0528
#_01C307: SEC
#_01C308: RTS

; TODO merge into 2 byte entry table
data01C309:
#_01C309: db $00

data01C30A:
#_01C30A: db $01,$FF,$00,$00,$FF,$01,$00

routine01C311:
#_01C311: STZ.w $0500

.branch01C314
#_01C314: LDY.w $0500
#_01C317: LDX.w $0700,Y
#_01C31A: BPL .branch01C31F

#_01C31C: JMP .branch01C39B

.branch01C31F
#_01C31F: LDA.w $1002,X
#_01C322: AND.w #$F070
#_01C325: BEQ .branch01C32A

#_01C327: JMP .branch01C38B

.branch01C32A
#_01C32A: STZ.w $105C,X
#_01C32D: LDA.w $1008,X
#_01C330: AND.w #$FF00
#_01C333: STA.w $1008,X
#_01C336: XBA
#_01C337: BIT.w #$0003
#_01C33A: BEQ .branch01C348

#_01C33C: CPX.w #$0180
#_01C33F: BCS .branch01C37D

#_01C341: BIT.w #$0001
#_01C344: BNE .branch01C34D

#_01C346: BRA .branch01C352

.branch01C348
#_01C348: CPX.w #$0180
#_01C34B: BCS .branch01C378

.branch01C34D
#_01C34D: LDA.w $1042,X
#_01C350: BPL .branch01C378

.branch01C352
#_01C352: LDA.w $1044,X
#_01C355: BMI .branch01C36E

#_01C357: LDA.w $1046,X
#_01C35A: BPL .branch01C369

#_01C35C: LDA.w $1044,X
#_01C35F: CMP.w #$004E
#_01C362: BEQ .branch01C369

#_01C364: CMP.w #$004F
#_01C367: BNE .branch01C36E

.branch01C369
#_01C369: LDA.w #$0002
#_01C36C: BRA .branch01C387

.branch01C36E
#_01C36E: LDA.w $1042,X
#_01C371: BPL .branch01C378

#_01C373: LDA.w #$0010
#_01C376: BRA .branch01C387

.branch01C378
#_01C378: LDA.w #$0001
#_01C37B: BRA .branch01C387

.branch01C37D
#_01C37D: BIT.w #$0002
#_01C380: BEQ .branch01C387

#_01C382: JSR routine01C39C
#_01C385: BCS .branch01C378

.branch01C387
#_01C387: XBA
#_01C388: STA.w $1008,X

.branch01C38B
#_01C38B: LDA.w $0500
#_01C38E: INC A
#_01C38F: INC A
#_01C390: STA.w $0500
#_01C393: CMP.w #$000C
#_01C396: BCS .branch01C39B

#_01C398: JMP .branch01C314

.branch01C39B
#_01C39B: RTS

;===================================================================================================

routine01C39C:
#_01C39C: LDA.w $1058,X
#_01C39F: CMP.w #$0040
#_01C3A2: BCC .branch01C3A9

#_01C3A4: CMP.w #$006A
#_01C3A7: BCC .branch01C3DC

.branch01C3A9
#_01C3A9: TXY
#_01C3AA: LDA.w $103E,Y
#_01C3AD: CMP.w #$0040
#_01C3B0: BCC .branch01C3B7

#_01C3B2: CMP.w #$006A
#_01C3B5: BCC .branch01C3D9

.branch01C3B7
#_01C3B7: INY
#_01C3B8: INY
#_01C3B9: LDA.w $103E,Y
#_01C3BC: CMP.w #$0040
#_01C3BF: BCC .branch01C3C6

#_01C3C1: CMP.w #$006A
#_01C3C4: BCC .branch01C3D9

.branch01C3C6
#_01C3C6: INY
#_01C3C7: INY
#_01C3C8: LDA.w $103E,Y
#_01C3CB: CMP.w #$0040
#_01C3CE: BCC .branch01C3D5

#_01C3D0: CMP.w #$006A
#_01C3D3: BCC .branch01C3D9

.branch01C3D5
#_01C3D5: INY
#_01C3D6: INY
#_01C3D7: BRA .branch01C3E1

.branch01C3D9
#_01C3D9: STA.w $1058,X

.branch01C3DC
#_01C3DC: LDA.w #$0002
#_01C3DF: CLC
#_01C3E0: RTS

.branch01C3E1
#_01C3E1: SEC
#_01C3E2: RTS

;===================================================================================================

routine01C3E3:
#_01C3E3: REP #$30
#_01C3E5: STZ.w $057A
#_01C3E8: LDY.w #$0000
#_01C3EB: STY.w $0516

.branch01C3EE
#_01C3EE: LDX.w $0700,Y
#_01C3F1: BMI .branch01C405

#_01C3F3: LDA.w $1002,X
#_01C3F6: AND.w #$C000
#_01C3F9: BNE .branch01C3FE

#_01C3FB: INC.w $0516

.branch01C3FE
#_01C3FE: INY
#_01C3FF: INY
#_01C400: CPY.w #$000C
#_01C403: BCC .branch01C3EE

.branch01C405
#_01C405: LDY.w #$0000
#_01C408: STY.w $0500

.branch01C40B
#_01C40B: LDA.w #$FFFF
#_01C40E: STA.w $052C,Y
#_01C411: LDA.w #$0000
#_01C414: STA.w $0600,Y
#_01C417: INY
#_01C418: INY
#_01C419: CPY.w #$001C
#_01C41C: BCC .branch01C40B

#_01C41E: LDA.w $052A
#_01C421: AND.w #$2000
#_01C424: BNE .branch01C461

#_01C426: BIT.w $0528
#_01C429: BPL .branch01C42D

#_01C42B: BVS .branch01C461

.branch01C42D
#_01C42D: LDY.w $0500
#_01C430: LDX.w $0700,Y
#_01C433: BMI .branch01C461

#_01C435: LDA.w $1008,X
#_01C438: BIT.w $052A
#_01C43B: BVC .branch01C33C

#_01C43D: LDA.w $1002,X
#_01C440: AND.w #$F070
#_01C443: BNE .branch01C454

#_01C445: LDA.w $1008,X
#_01C448: XBA
#_01C449: STA.w $1008,X

.branch01C33C
#_01C44C: AND.w #$000F
#_01C44F: BEQ .branch01C454

#_01C451: JSR routine01C4A4

.branch01C454
#_01C454: LDY.w $0500
#_01C457: INY
#_01C458: INY
#_01C459: STY.w $0500
#_01C45C: CPY.w #$000C
#_01C45F: BCC .branch01C42D

.branch01C461
#_01C461: BIT.w $0528
#_01C464: BPL .branch01C468

#_01C466: BVC .branch01C48B

.branch01C468
#_01C468: LDX.w #$0600

.branch01C46B
#_01C46B: STX.w $0502
#_01C46E: LDA.w $1000,X
#_01C471: BPL .branch01C47E

#_01C473: LDA.w $1008,X
#_01C476: AND.w #$0007
#_01C479: BEQ .branch01C47E

#_01C47B: JSR routine01C4A4

.branch01C47E
#_01C47E: LDA.w $0502
#_01C481: CLC
#_01C482: ADC.w #$0060
#_01C485: TAX
#_01C486: CPX.w #$0900
#_01C489: BCC .branch01C46B

.branch01C48B
#_01C48B: STZ.w $0528
#_01C48E: STZ.w $0548
#_01C491: BIT.w $052A
#_01C494: BVC .branch01C49A

#_01C496: JSL routine00A17E

.branch01C49A
#_01C49A: LDA.w $052A
#_01C49D: AND.w #$DFFF
#_01C4A0: STA.w $052A
#_01C4A3: RTS

;===================================================================================================

routine01C4A4:
#_01C4A4: CPX.w #$0060
#_01C4A7: BCS .branch01C4C1

#_01C4A9: LDA.w $1008
#_01C4AC: AND.w #$0004
#_01C4AF: BEQ .branch01C4C1

#_01C4B1: LDA.w $1058
#_01C4B4: BNE .branch01C4C1

#_01C4B6: LDA.w #$FFFF
#_01C4B9: STA.w $0620
#_01C4BC: STX.w $0622
#_01C4BF: BRA .branch01C504

.branch01C4C1
#_01C4C1: LDA.w $1018,X
#_01C4C4: CPX.w #$0600
#_01C4C7: BCS .branch01C4D5

#_01C4C9: LDY.w $0500
#_01C4CC: CPY.w #$0006
#_01C4CF: BCS .branch01C4D5

#_01C4D1: LSR A
#_01C4D2: ADC.w $1018,X

.branch01C4D5
#_01C4D5: ADC.w $1018,X
#_01C4D8: STA.w $0620
#_01C4DB: JSL GetRandomInt
#_01C4DF: AND.w #$000F
#_01C4E2: CLC
#_01C4E3: ADC.w $0620
#_01C4E6: STA.w $0620
#_01C4E9: CPX.w #$0000
#_01C4EC: BEQ .branch01C501

#_01C4EE: LDA.w $1008,X
#_01C4F1: AND.w #$0004
#_01C4F4: BEQ .branch01C501

#_01C4F6: LDA.w $0714
#_01C4F9: LSR A
#_01C4FA: CLC
#_01C4FB: ADC.w $0620
#_01C4FE: STA.w $0620

.branch01C501
#_01C501: STX.w $0622

.branch01C504
#_01C504: LDY.w #$0000

.branch01C507
#_01C507: LDA.w $0622
#_01C50A: CMP.w #$FFFF
#_01C50D: BEQ .branch01C537

#_01C50F: LDA.w $0600,Y
#_01C512: CMP.w $0620
#_01C515: BCS .branch01C530

#_01C517: PHA
#_01C518: LDA.w $052C,Y
#_01C51B: PHA
#_01C51C: LDA.w $0620
#_01C51F: STA.w $0600,Y
#_01C522: LDA.w $0622
#_01C525: STA.w $052C,Y
#_01C528: PLA
#_01C529: STA.w $0622
#_01C52C: PLA
#_01C52D: STA.w $0620

.branch01C530
#_01C530: INY
#_01C531: INY
#_01C532: CPY.w #$001C
#_01C535: BCC .branch01C507

.branch01C537
#_01C537: RTS

;===================================================================================================

routine01C538:
#_01C538: LDX.w #$0000

.branch01C53B
#_01C53B: STX.w $0600
#_01C53E: LDA.l data01C5FE,X
#_01C542: STA.w $0604
#_01C545: LDA.l data01C606,X
#_01C549: STA.w $0602
#_01C54C: LDY.w #$0000

.branch01C54F
#_01C54F: LDX.w $0700,Y
#_01C552: BMI .branch01C570

#_01C554: JSL GetRandomInt
#_01C558: LDA.w $0604
#_01C55B: CMP.w $0ED5
#_01C55E: BCC .branch01C569

#_01C560: LDA.w $1002,X
#_01C563: AND.w $0602
#_01C566: STA.w $1002,X

.branch01C569
#_01C569: INY
#_01C56A: INY
#_01C56B: CPY.w #$000C
#_01C56E: BCC .branch01C54F

.branch01C570
#_01C570: LDX.w $0600
#_01C573: INX
#_01C574: INX
#_01C575: CPX.w #$0008
#_01C578: BCC .branch01C53B

#_01C57A: LDA.w $1002
#_01C57D: AND.w #$FFBF
#_01C580: STA.w $1002
#_01C583: LDA.w $1062
#_01C586: AND.w #$FFBF
#_01C589: STA.w $1062
#_01C58C: LDX.w #$0000

.branch01C58F
#_01C58F: STX.w $0600
#_01C592: LDA.l data01C5FE,X
#_01C596: STA.w $0604
#_01C599: LDA.l data01C606,X
#_01C59D: STA.w $0602
#_01C5A0: LDX.w #$0600

.branch01C5A3
#_01C5A3: JSL GetRandomInt
#_01C5A7: LDA.w $0604
#_01C5AA: CMP.w $0ED5
#_01C5AD: BCC .branch01C5B8

#_01C5AF: LDA.w $1002,X
#_01C5B2: AND.w $0602
#_01C5B5: STA.w $1002,X

.branch01C5B8
#_01C5B8: TXA
#_01C5B9: CLC
#_01C5BA: ADC.w #$0060
#_01C5BD: TAX
#_01C5BE: CPX.w #$0900
#_01C5C1: BCC .branch01C5A3

#_01C5C3: LDX.w $0600
#_01C5C6: INX
#_01C5C7: INX
#_01C5C8: CPX.w #$0008
#_01C5CB: BCC .branch01C58F

#_01C5CD: LDX.w #$0600

.branch01C5D0
#_01C5D0: STX.w $051A
#_01C5D3: LDA.w $1000,X
#_01C5D6: BPL .branch01C5E4

#_01C5D8: LDA.w $1002,X
#_01C5DB: AND.w #$C000
#_01C5DE: BNE .branch01C5E4

#_01C5E0: JSL routine01E76D

.branch01C5E4
#_01C5E4: LDA.w $051A
#_01C5E7: CLC
#_01C5E8: ADC.w #$0060
#_01C5EB: TAX
#_01C5EC: CPX.w #$0900
#_01C5EF: BCC .branch01C5D0

#_01C5F1: STZ.w $059E
#_01C5F4: STZ.w $05A0
#_01C5F7: STZ.w $05A2
#_01C5FA: STZ.w $05A4
#_01C5FD: RTS

data01C5FE:
#_01C5FE: dw $0100,$00A0,$0060,$0020

data01C606:
#_01C606: dw $FFF7,$FFED,$FFBE,$FF5B

routine01C60E:
#_01C60E: LDA.w #$0038 ; SONG 38
#_01C611: JSL Write_to_APU_transferrable
#_01C615: LDY.w #$0000

.branch01C618
#_01C618: LDX.w $0700,Y
#_01C61B: BMI .branch01C63B

#_01C61D: CPX.w #$0180
#_01C620: BCS .branch01C62B

#_01C622: LDA.w $1002,X
#_01C625: AND.w #$FFBF
#_01C628: STA.w $1002,X

.branch01C62B
#_01C62B: LDA.w $1002,X
#_01C62E: AND.w #$FF64
#_01C631: STA.w $1002,X
#_01C634: INY
#_01C635: INY
#_01C636: CPY.w #$000C
#_01C639: BCC .branch01C618

.branch01C63B
#_01C63B: JSL routine00A17E
#_01C63F: RTS

;===================================================================================================

routine01C640:
#_01C640: LDY.w #$0000

.branch01C643
#_01C643: STY.w $0720
#_01C646: LDX.w $0700,Y
#_01C649: BPL .branch01C64E

#_01C64B: JMP .branch01C701

.branch01C64E
#_01C64E: CPX.w #$0180
#_01C651: BCS .branch01C665

#_01C653: STX.w $0715
#_01C656: BIT.w $1000,X
#_01C659: BPL .branch01C665

#_01C65B: BVC .branch01C665

#_01C65D: LDA.w $1002,X
#_01C660: AND.w #$E000
#_01C663: BEQ .branch01C668

.branch01C665
#_01C665: JMP .branch01C6F4

.branch01C668
#_01C668: STX.w WRDIVL

#_01C66B: SEP #$20
#_01C66D: LDA.b #$60
#_01C66F: STA.w WRDIVB
#_01C672: NOP
#_01C673: NOP
#_01C674: NOP
#_01C675: NOP
#_01C676: NOP
#_01C677: NOP
#_01C678: NOP
#_01C679: NOP

#_01C67A: REP #$20
#_01C67C: LDA.w RDDIVL
#_01C67F: ASL A
#_01C680: TAY
#_01C681: LDA.w $05D6,Y
#_01C684: BEQ .branch01C665

#_01C686: STA.w $0620
#_01C689: LDA.w $100C,X
#_01C68C: CLC
#_01C68D: ADC.w $05D6,Y
#_01C690: STA.w $100C,X
#_01C693: LDA.w $100E,X
#_01C696: ADC.w #$0000
#_01C699: STA.w $100E,X
#_01C69C: LDA.w $100C,X
#_01C69F: SEC
#_01C6A0: SBC.w #$967F
#_01C6A3: STA.w $0622
#_01C6A6: LDA.w $100E,X
#_01C6A9: SBC.w #$0098
#_01C6AC: STA.w $0624
#_01C6AF: BCC .branch01C6CC

#_01C6B1: ORA.w $0622
#_01C6B4: BEQ .branch01C6CC

#_01C6B6: LDA.w #$967F
#_01C6B9: STA.w $100C,X
#_01C6BC: LDA.w #$0098
#_01C6BF: STA.w $100E,X
#_01C6C2: LDA.w $05D6,Y
#_01C6C5: SEC
#_01C6C6: SBC.w $0622
#_01C6C9: STA.w $0622

.branch01C6CC
#_01C6CC: LDA.w $0624
#_01C6CF: BMI .branch01C6D8

#_01C6D1: LDA.w $0622
#_01C6D4: BEQ .branch01C6F4

#_01C6D6: BNE .branch01C6DB

.branch01C6D8
#_01C6D8: LDA.w $0620

.branch01C6DB
#_01C6DB: STA.w $0A54
#_01C6DE: STZ.w $0A56
#_01C6E1: LDA.w $1004,X
#_01C6E4: STA.w $0A3E
#_01C6E7: JSR routine01CA14
#_01C6EA: LDA.w #$001F
#_01C6ED: JSR DisplayCombatMessage
#_01C6F0: JSL TallyNumberOfLevelsGained

.branch01C6F4
#_01C6F4: LDY.w $0720
#_01C6F7: INY
#_01C6F8: INY
#_01C6F9: CPY.w #$000C
#_01C6FC: BCS .branch01C701

#_01C6FE: JMP .branch01C643

.branch01C701
#_01C701: RTS

;===================================================================================================

GiveMoneyFromBattle:
; Money += $051E
#_01C702: LDA.w $051E
#_01C705: STA.w $0620

#_01C708: CLC
#_01C709: ADC.w $0405
#_01C70C: STA.w $0405

#_01C70F: LDA.w $0407
#_01C712: ADC.w #$0000
#_01C715: STA.w $0407

; cap money at 999999 (0x0F423F)
#_01C718: LDA.w $0405
#_01C71B: SEC
#_01C71C: SBC.w #$423F
#_01C71F: STA.w $0622

#_01C722: LDA.w $0407
#_01C725: SBC.w #$000F
#_01C728: STA.w $0624
#_01C72B: BCC .no_clamp_needed

#_01C72D: ORA.w $0622
#_01C730: BEQ .no_clamp_needed

#_01C732: LDA.w #$423F
#_01C735: STA.w $0405

#_01C738: LDA.w #$000F
#_01C73B: STA.w $0407

#_01C73E: LDA.w $051E
#_01C741: SEC
#_01C742: SBC.w $0622
#_01C745: STA.w $0622
#_01C748: BEQ .just_leave
#_01C74A: BNE .add_money

.no_clamp_needed
#_01C74C: LDA.w $0620

.add_money
#_01C74F: STA.w $0A54
#_01C752: STZ.w $0A56

#_01C755: LDA.w $1004
#_01C758: STA.w $0A3E

#_01C75B: JSL WriteMoneyToHUD
#_01C75F: JSR routine01CA14

#_01C762: LDA.w #$0020
#_01C765: JSR DisplayCombatMessage

.just_leave
#_01C768: RTS

;===================================================================================================

GiveMAGFromBattle:
#_01C769: LDA.w $0520
#_01C76C: STA.w $0620

#_01C76F: CLC
#_01C770: ADC.w $0409
#_01C773: STA.w $0409

#_01C776: LDA.w $040B
#_01C779: ADC.w #$0000
#_01C77C: STA.w $040B

; cap mag at 99999 (0x01896F)
#_01C77F: LDA.w $0409
#_01C782: SEC
#_01C783: SBC.w #$869F
#_01C786: STA.w $0622

#_01C789: LDA.w $040B
#_01C78C: SBC.w #$0001
#_01C78F: STA.w $0624
#_01C792: BCC .no_clamp_needed

#_01C794: ORA.w $0622
#_01C797: BEQ .no_clamp_needed

#_01C799: LDA.w #$869F
#_01C79C: STA.w $0409

#_01C79F: LDA.w #$0001
#_01C7A2: STA.w $040B

#_01C7A5: LDA.w $0520
#_01C7A8: SEC
#_01C7A9: SBC.w $0622
#_01C7AC: STA.w $0622
#_01C7AF: BEQ .just_leave
#_01C7B1: BNE .add_mag

.no_clamp_needed
#_01C7B3: LDA.w $0620

.add_mag
#_01C7B6: STA.w $0A54
#_01C7B9: STZ.w $0A56

#_01C7BC: LDA.w $1004
#_01C7BF: STA.w $0A3E

#_01C7C2: JSL WriteMAGToHUD
#_01C7C6: JSR routine01CA14

#_01C7C9: LDA.w #$0021
#_01C7CC: JSR DisplayCombatMessage

.just_leave
#_01C7CF: RTS

;===================================================================================================

GiveMagStonesFromBattle:
#_01C7D0: STZ.w $0A54
#_01C7D3: STZ.w $0A56

; magstone
#_01C7D6: LDA.w #$00B2
#_01C7D9: STA.w $0A50

#_01C7DC: JSL GetRandomInt
#_01C7E0: AND.w #$0007
#_01C7E3: BNE .no_upgrade

; orb
#_01C7E5: LDA.w #$00B4
#_01C7E8: STA.w $0A50

;---------------------------------------------------------------------------------------------------
; Ya know... they could have used this first loop to also save the first free slot...
;---------------------------------------------------------------------------------------------------
.no_upgrade
#_01C7EB: LDY.w #$0000

.next_gift_search
#_01C7EE: LDA.w $0780,Y
#_01C7F1: TAX

#_01C7F2: AND.w #$FF00
#_01C7F5: BEQ .skip_slot

#_01C7F7: TXA
#_01C7F8: AND.w #$00FF
#_01C7FB: CMP.w $0A50
#_01C7FE: BNE .skip_slot

#_01C800: LDA.w $0780,Y
#_01C803: XBA

#_01C804: SEP #$20
#_01C806: CMP.b #$09
#_01C808: BCS .too_many_in_slot

#_01C80A: INC A

#_01C80B: REP #$20
#_01C80D: XBA
#_01C80E: STA.w $0780,Y
#_01C811: INC.w $0A54
#_01C814: DEC.w $0522
#_01C817: BEQ .done_handing_out_items

.too_many_in_slot
#_01C819: REP #$20

.skip_slot
#_01C81B: INY
#_01C81C: INY
#_01C81D: CPY.w #$003C
#_01C820: BCC .next_gift_search

;---------------------------------------------------------------------------------------------------

#_01C822: LDY.w #$0000

.next_empty_check
#_01C825: LDA.w $0780,Y
#_01C828: TAX
#_01C829: AND.w #$FF00
#_01C82C: BNE .slot_occupied

#_01C82E: SEP #$20

#_01C830: LDA.w $0522
#_01C833: CMP.b #$0A
#_01C835: BCC .few_gifts_remaining

#_01C837: LDA.w $0522
#_01C83A: SEC
#_01C83B: SBC.b #$09
#_01C83D: STA.w $0522

#_01C840: LDA.b #$09

.few_gifts_remaining
#_01C842: STA.w $0A56

#_01C845: CLC
#_01C846: ADC.w $0A54
#_01C849: STA.w $0A54

#_01C84C: XBA

#_01C84D: LDA.w $0A50

#_01C850: REP #$20

#_01C852: STA.w $0780,Y

#_01C855: LDA.w $0522
#_01C858: SEC
#_01C859: SBC.w $0A56
#_01C85C: STA.w $0522

#_01C85F: BEQ .done_handing_out_items

.slot_occupied
#_01C861: INY
#_01C862: INY
#_01C863: CPY.w #$003C
#_01C866: BCC .next_empty_check

;---------------------------------------------------------------------------------------------------

.done_handing_out_items
#_01C868: LDA.w $0A54
#_01C86B: BEQ .none_received

#_01C86D: STZ.w $0A56

#_01C870: JSR routine01CA14

#_01C873: LDA.w #$0022

#_01C876: LDX.w $0A50
#_01C879: CPX.w #$00B4
#_01C87C: BNE .obtained_magstones

#_01C87E: INC A

.obtained_magstones
#_01C87F: JSR DisplayCombatMessage

.none_received
#_01C882: RTS

;===================================================================================================

AddEnemyDropFromBattleToInventory:
#_01C883: STA.w $0A50

#_01C886: LDY.w #$0000

.check_next
#_01C889: LDA.w $0780,Y
#_01C88C: TAX

#_01C88D: AND.w #$FF00
#_01C890: BEQ .to_next_slot

#_01C892: TXA
#_01C893: AND.w #$00FF
#_01C896: CMP.w $0A50
#_01C899: BNE .to_next_slot

#_01C89B: LDA.w $0780,Y
#_01C89E: XBA

#_01C89F: SEP #$20
#_01C8A1: CMP.b #$09
#_01C8A3: BCS .we_have_too_many

#_01C8A5: INC A

#_01C8A6: REP #$20
#_01C8A8: XBA
#_01C8A9: STA.w $0780,Y

#_01C8AC: BRA .add_item

.we_have_too_many
#_01C8AE: REP #$20

.to_next_slot
#_01C8B0: INY
#_01C8B1: INY
#_01C8B2: CPY.w #$003C
#_01C8B5: BCC .check_next

;---------------------------------------------------------------------------------------------------

#_01C8B7: LDY.w #$0000

.look_for_free_slot
#_01C8BA: LDA.w $0780,Y
#_01C8BD: TAX

#_01C8BE: AND.w #$FF00
#_01C8C1: BNE .occupied

#_01C8C3: LDA.w $0A50
#_01C8C6: ORA.w #$0100
#_01C8C9: STA.w $0780,Y
#_01C8CC: BRA .add_item

.occupied
#_01C8CE: INY
#_01C8CF: INY
#_01C8D0: CPY.w #$003C
#_01C8D3: BCC .look_for_free_slot

#_01C8D5: RTS

;---------------------------------------------------------------------------------------------------

.add_item
#_01C8D6: JSR routine01CA14

#_01C8D9: LDA.w #$0024
#_01C8DC: JSR DisplayCombatMessage

#_01C8DF: CLC
#_01C8E0: RTS

;===================================================================================================

LevelUpAfterBattle:
#_01C8E1: LDX.w $0715

#_01C8E4: LDA.w $1004,X
#_01C8E7: STA.w $0A3E

#_01C8EA: CPX.w #$0060
#_01C8ED: BCC .unmagical_hero

; ((INT/2)+(LEVEL*2)+MAG)/8
#_01C8EF: LDA.w $1012,X
#_01C8F2: LSR A
#_01C8F3: ADC.w $100A,X
#_01C8F6: ADC.w $100A,X
#_01C8F9: ADC.w $1014,X
#_01C8FC: LSR A
#_01C8FD: LSR A
#_01C8FE: LSR A
#_01C8FF: CMP.w #$000B
#_01C902: BCC .set_learn_threshold

#_01C904: CPX.w #$0120
#_01C907: BEQ .you_will_not_learn

#_01C909: CMP.w #$000C
#_01C90C: BCC .set_learn_threshold

#_01C90E: CPX.w #$00C0
#_01C911: BEQ .you_will_not_learn

#_01C913: CMP.w #$0014
#_01C916: BCC .set_learn_threshold

.you_will_not_learn
#_01C918: LDA.w #$FFFF

.set_learn_threshold
#_01C91B: STA.w $0600

.unmagical_hero
#_01C91E: LDA.w #$0025
#_01C921: JSR DisplayCombatMessage

#_01C924: LDA.w $052A
#_01C927: AND.w #$0100
#_01C92A: BEQ .branch01C96F

;---------------------------------------------------------------------------------------------------

#_01C92C: LDX.w #$0000
#_01C92F: TXY

.branch01C930
#_01C930: LDA.w $0020,X
#_01C933: STA.w $0620,X
#_01C936: BEQ .branch01C967

#_01C938: LDA.w $1B00,X
#_01C93B: BNE .branch01C949

#_01C93D: DEC.w $0620,X
#_01C940: DEC.w $0620,X
#_01C943: DEC.w $0620,X
#_01C946: DEC.w $0620,X

.branch01C949
#_01C949: STZ.w $0020,X

#_01C94C: SEP #$20

#_01C94E: LDA.w $1A10,Y
#_01C951: STA.w $05E0,Y

#_01C954: LDA.w $1A30,Y
#_01C957: STA.w $05F0,Y

#_01C95A: LDA.w $1A50,Y
#_01C95D: STA.w $0600,Y

#_01C960: LDA.b #$80
#_01C962: STA.w $1A10,Y

#_01C965: REP #$20

.branch01C967
#_01C967: INY
#_01C968: INX
#_01C969: INX
#_01C96A: CPX.w #$0020
#_01C96D: BCC .branch01C930

;---------------------------------------------------------------------------------------------------

.branch01C96F
#_01C96F: LDX.w $0715

#_01C972: JSL UpdatePlayerStats

#_01C976: LDA.w $1030,X
#_01C979: STA.w $102E,X

#_01C97C: LDA.w $1034,X
#_01C97F: STA.w $1032,X

#_01C982: LDA.w #$003D ; SONG 3D
#_01C985: JSL Write_to_APU_transferrable

#_01C989: JSL routine0183E5

#_01C98D: LDA.w #$0038 ; SONG 38
#_01C990: JSL Write_to_APU_transferrable

#_01C994: SEP #$20

#_01C996: LDA.b #$02
#_01C998: STA.w $0F80

#_01C99B: REP #$20

#_01C99D: LDA.w $052A
#_01C9A0: AND.w #$0100
#_01C9A3: BEQ .branch01C9D5

;---------------------------------------------------------------------------------------------------

#_01C9A5: LDX.w #$0000
#_01C9A8: TXY

.branch01C9A9
#_01C9A9: LDA.w $0620,X
#_01C9AC: BEQ .branch01C9CD

#_01C9AE: STA.w $0020,X

#_01C9B1: LDA.w #$0001
#_01C9B4: STA.w $1B00,X

#_01C9B7: SEP #$20

#_01C9B9: LDA.w $05E0,Y
#_01C9BC: STA.w $1A10,Y

#_01C9BF: LDA.w $05F0,Y
#_01C9C2: STA.w $1A30,Y

#_01C9C5: LDA.w $0600,Y
#_01C9C8: STA.w $1A50,Y

#_01C9CB: REP #$20

.branch01C9CD
#_01C9CD: INY
#_01C9CE: INX
#_01C9CF: INX
#_01C9D0: CPX.w #$0020
#_01C9D3: BCC .branch01C9A9

;---------------------------------------------------------------------------------------------------

.branch01C9D5
#_01C9D5: JSL TriggerMenuGrow

#_01C9D9: JSL WriteMoneyToHUD
#_01C9DD: JSL WriteMAGToHUD
#_01C9E1: JSL routine00A056

#_01C9E5: LDX.w $0715
#_01C9E8: CPX.w #$0060
#_01C9EB: BCC .no_new_spells

#_01C9ED: LDA.w $1004,X
#_01C9F0: STA.w $0A3E

; ((INT/2)+(LEVEL*2)+MAG)/8
#_01C9F3: LDA.w $1012,X
#_01C9F6: LSR A
#_01C9F7: ADC.w $100A,X
#_01C9FA: ADC.w $100A,X
#_01C9FD: ADC.w $1014,X
#_01CA00: LSR A
#_01CA01: LSR A
#_01CA02: LSR A
#_01CA03: CMP.w $0600
#_01CA06: BCC .no_new_spells
#_01CA08: BEQ .no_new_spells

#_01CA0A: JSR routine01CA14

#_01CA0D: LDA.w #$0036
#_01CA10: JSR DisplayCombatMessage

.no_new_spells
#_01CA13: RTS

;===================================================================================================

routine01CA14:
#_01CA14: LDX.w #$001D

#_01CA17: LDA.w $052A
#_01CA1A: AND.w #$0200
#_01CA1D: BNE .branch01CA2C

#_01CA1F: LDA.w $0524
#_01CA22: BNE .branch01CA2C

#_01CA24: LDA.w $0512
#_01CA27: ORA.w $0514
#_01CA2A: BEQ .branch01CA2D

.branch01CA2C
#_01CA2C: INX

.branch01CA2D
#_01CA2D: TXA

#_01CA2E: JSR routine01B369

#_01CA31: RTS

;===================================================================================================
; TODO
;===================================================================================================
HandleBattleSong:
.auto
#_01CA32: LDA.w $052A
#_01CA35: AND.w #$8000
#_01CA38: BEQ .nochange
#_01CA3A: BNE .continue

.fight
#_01CA3C: LDA.w $052A
#_01CA3F: AND.w #$8000
#_01CA42: BEQ .preparesong

.continue
#_01CA44: LDA.w $05D4
#_01CA47: BNE .nochange

.preparesong
#_01CA49: LDA.w #$003C ; SONG 3C
#_01CA4C: LDX.w $1604
#_01CA4F: CPX.w #$0100
#_01CA52: BCC .normalbattle

#_01CA54: DEC.w $0EFE
#_01CA57: LDA.w #$0051 ; SONG 51

.normalbattle
#_01CA5A: JSL Write_to_APU_transferrable
#_01CA5E: DEC.w $05D4
#_01CA61: DEC.w $05BA

.nochange
#_01CA64: RTS

;===================================================================================================

routine01CA65:
#_01CA65: PHP
#_01CA66: LDX.w #$0000

.branch01CA69
#_01CA69: LDA.l data01CA8F,X
#_01CA6D: STA.w $0106,X
#_01CA70: INX
#_01CA71: INX
#_01CA72: CPX.w #$000A
#_01CA75: BCC .branch01CA69

#_01CA77: LDA.w #$3DCC
#_01CA7A: STA.w $0102
#_01CA7D: LDA.w #$0005
#_01CA80: STA.w $0104
#_01CA83: LDA.w #$0001
#_01CA86: STA.w $0100
#_01CA89: JSL AddSelfAsVectorAndMakeSpace
#_01CA8D: PLP
#_01CA8E: RTL

data01CA8F:
#_01CA8F: dw $200F,$201C,$201C,$2019
#_01CA97: dw $201C

routine01CA99:
#_01CA99: REP #$30
#_01CA9B: JSR routine01CC25
#_01CA9E: STZ.w $054C
#_01CAA1: LDY.w $0548
#_01CAA4: LDX.w $052C,Y
#_01CAA7: LDA.w $1004,X
#_01CAAA: STA.w $0A3E
#_01CAAD: STX.w $0518
#_01CAB0: LDA.w $1002,X
#_01CAB3: BIT.w #$F078
#_01CAB6: BEQ .branch01CABB

#_01CAB8: JMP .branch01CBD0

.branch01CABB
#_01CABB: JSR CheckIfHappyOrPanicked
#_01CABE: BCC .branch01CAC3

#_01CAC0: JMP .branch01CBD0

.branch01CAC3
#_01CAC3: CPX.w #$0060
#_01CAC6: BCC .branch01CB01

#_01CAC8: LDA.w $1008,X
#_01CACB: AND.w #$0004
#_01CACE: BEQ .branch01CB01

#_01CAD0: LDA.w $1002,X
#_01CAD3: BIT.w #$0004
#_01CAD6: BEQ .branch01CAED

#_01CAD8: LDA.w $1058,X
#_01CADB: AND.w #$00FF
#_01CADE: STA.w $0A52
#_01CAE1: LDA.w #$0016
#_01CAE4: JSR DoTextInCombatMaybe
#_01CAE7: STZ.w $054A
#_01CAEA: JMP .branch01CBD0

.branch01CAED
#_01CAED: LDA.w $1058,X
#_01CAF0: AND.w #$00FF
#_01CAF3: CMP.w #$0040
#_01CAF6: BCS .branch01CB01

#_01CAF8: JSL AttemptSpellCast
#_01CAFC: BCC .branch01CB1A
#_01CAFE: JMP .branch01CBD0

.branch01CB01
#_01CB01: CPX.w #$0180
#_01CB04: BCS .branch01CB1A

#_01CB06: LDA.w $1008,X
#_01CB09: AND.w #$0008
#_01CB0C: BEQ .branch01CB1A

#_01CB0E: LDA.w $1058,X
#_01CB11: XBA
#_01CB12: AND.w #$00FF
#_01CB15: TAY
#_01CB16: JSL routine01AAFD

.branch01CB1A
#_01CB1A: STZ.w $054C
#_01CB1D: STZ.w $05AA
#_01CB20: STZ.w $05A8

.branch01CB23
#_01CB23: STZ.w $054E
#_01CB26: LDY.w $0548
#_01CB29: LDX.w $052C,Y
#_01CB2C: LDA.w $1004,X
#_01CB2F: STA.w $0A3E
#_01CB32: LDA.w $1058,X
#_01CB35: AND.w #$00FF
#_01CB38: STA.w $0A52
#_01CB3B: STA.w $0A50
#_01CB3E: STX.w $0518
#_01CB41: CPX.w #$0600
#_01CB44: BCS .branch01CB53

#_01CB46: LDA.w $1002,X
#_01CB49: BIT.w #$0080
#_01CB4C: BNE .branch01CB5B

.branch01CB4E
#_01CB4E: JSR routine01CCD7
#_01CB51: BRA .branch01CB5E

.branch01CB53
#_01CB53: LDA.w $1002,X
#_01CB56: BIT.w #$0080
#_01CB59: BNE .branch01CB4E

.branch01CB5B
#_01CB5B: JSR routine01CF23

.branch01CB5E
#_01CB5E: STZ.w $0550

.branch01CB61
#_01CB61: LDX.w $0518
#_01CB64: LDA.w $1000,X
#_01CB67: BPL .branch01CBD0

#_01CB69: LDA.w $1002,X
#_01CB6C: BIT.w #$F078
#_01CB6F: BNE .branch01CBD0

#_01CB71: LDA.w $1008,X
#_01CB74: AND.w #$001F
#_01CB77: BEQ .branch01CBD0

#_01CB79: JSR routine01D708
#_01CB7C: JSR routine01D5D0
#_01CB7F: LDY.w $0550
#_01CB82: LDX.w $0552,Y
#_01CB85: STX.w $051A
#_01CB88: LDA.w #$0000
#_01CB8B: BIT.w $0524
#_01CB8E: BPL .branch01CB98

#_01CB90: CPX.w #$0780
#_01CB93: BCC .branch01CB98

#_01CB95: LDA.w #$0002

.branch01CB98
#_01CB98: STA.w $0564
#_01CB9B: JSR routine01CFF2
#_01CB9E: BCS .branch01CBA3

#_01CBA0: JSR routine01D0C5

.branch01CBA3
#_01CBA3: JSR routine01D543
#_01CBA6: BCS .branch01CBD0

#_01CBA8: LDA.w $0512
#_01CBAB: ORA.w $0514
#_01CBAE: BEQ .branch01CBD0

#_01CBB0: LDX.w $0518
#_01CBB3: CPX.w #$0600
#_01CBB6: BCS .branch01CB61

#_01CBB8: LDY.w $0564
#_01CBBB: LDA.w $0512,Y
#_01CBBE: BNE .branch01CB61

#_01CBC0: TYA
#_01CBC1: EOR.w #$0002
#_01CBC4: STA.w $0564
#_01CBC7: TAY
#_01CBC8: LDA.w $0512,Y
#_01CBCB: BEQ .branch01CBD0

#_01CBCD: JMP .branch01CB23

.branch01CBD0
#_01CBD0: LDX.w $0518
#_01CBD3: LDA.w $1008,X
#_01CBD6: AND.w #$00FF
#_01CBD9: XBA
#_01CBDA: STA.w $1008,X
#_01CBDD: CPX.w #$0600
#_01CBE0: BCC .branch01CBEA

#_01CBE2: LDX.w $051A
#_01CBE5: CPX.w #$0600
#_01CBE8: BCS .branch01CBED

.branch01CBEA
#_01CBEA: JSR routine01D5B5

.branch01CBED
#_01CBED: LDA.w $054C
#_01CBF0: BEQ .branch01CC07

#_01CBF2: STA.w $0A54
#_01CBF5: STZ.w $0A56
#_01CBF8: LDX.w $051A
#_01CBFB: LDA.w $1004,X
#_01CBFE: STA.w $0A3E
#_01CC01: LDA.w #$001C
#_01CC04: JSR DisplayCombatMessage

.branch01CC07
#_01CC07: LDX.w $051A
#_01CC0A: CPX.w #$0600
#_01CC0D: BCC .branch01CC20

#_01CC0F: SEC
#_01CC10: LDA.w $0512
#_01CC13: ORA.w $0514
#_01CC16: BEQ .branch01CC21

#_01CC18: LDA.w $054C
#_01CC1B: BEQ .branch01CC20

#_01CC1D: JSR routine01C1B9

.branch01CC20
#_01CC20: CLC

.branch01CC21
#_01CC21: STZ.w $05A8
#_01CC24: RTS

;===================================================================================================

routine01CC25:
#_01CC25: LDY.w $0548
#_01CC28: LDX.w $052C,Y
#_01CC2B: CPX.w #$0180
#_01CC2E: BCS .branch01CCA3

#_01CC30: LDA.w $1008,X
#_01CC33: BIT.w #$000C
#_01CC36: BEQ .branch01CC7C

#_01CC38: BIT.w #$0008
#_01CC3B: BNE .branch01CC59

#_01CC3D: CPX.w #$0060
#_01CC40: BCC .branch01CC9C

.branch01CC42
#_01CC42: LDA.w $1058,X
#_01CC45: AND.w #$00FF

.branch01CC48
#_01CC48: LDY.w #$0002
#_01CC4B: JSL GetSkillProperty
#_01CC4F: AND.w #$00FF
#_01CC52: CMP.w #$0080
#_01CC55: BCS .branch01CC9C

#_01CC57: BRA .branch01CCBA

.branch01CC59
#_01CC59: LDA.w $1058,X
#_01CC5C: AND.w #$00FF
#_01CC5F: CMP.w #$0040
#_01CC62: BCC .branch01CC95

#_01CC64: SEC
#_01CC65: SBC.w #$00B0
#_01CC68: LDY.w #$0002
#_01CC6B: JSL GetUseItemStat
#_01CC6F: TAX
#_01CC70: BMI .branch01CC9C

#_01CC72: AND.w #$00FF
#_01CC75: CMP.w #$0040
#_01CC78: BCS .branch01CC95

#_01CC7A: BRA .branch01CC48

.branch01CC7C
#_01CC7C: BIT.w #$0010
#_01CC7F: BNE .branch01CC9C

#_01CC81: TXY
#_01CC82: BIT.w #$0001
#_01CC85: BNE .branch01CC89

#_01CC87: INY
#_01CC88: INY

.branch01CC89
#_01CC89: LDA.w $1042,Y
#_01CC8C: LDY.w #$0003
#_01CC8F: JSL GetEquipmentStat
#_01CC93: BRA .branch01CCBA

.branch01CC95
#_01CC95: LDA.w #$0001
#_01CC98: STA.w $054A
#_01CC9B: RTS

.branch01CC9C
#_01CC9C: LDA.w #$FFFF
#_01CC9F: STA.w $054A
#_01CCA2: RTS

.branch01CCA3
#_01CCA3: LDA.w $1008,X
#_01CCA6: AND.w #$000E
#_01CCA9: BEQ .branch01CCB2

#_01CCAB: AND.w #$0008
#_01CCAE: BNE .branch01CC9C

#_01CCB0: BRA .branch01CC42

.branch01CCB2
#_01CCB2: BIT.w #$0010
#_01CCB5: BNE .branch01CC9C

#_01CCB7: LDA.w $103A,X

;---------------------------------------------------------------------------------------------------

.branch01CCBA
#_01CCBA: AND.w #$000F
#_01CCBD: CMP.w #$000F
#_01CCC0: BEQ .branch01CCD0

#_01CCC2: TAX
#_01CCC3: LDY.w #$0009
#_01CCC6: LDA.w #data07CB0F
#_01CCC9: JSR GetDynamicSuccessiveHitChances
#_01CCCC: STX.w $054A

#_01CCCF: RTS

.branch01CCD0
#_01CCD0: LDA.w #$8000
#_01CCD3: STA.w $054A

#_01CCD6: RTS

;===================================================================================================

routine01CCD7:
#_01CCD7: LDY.w #$0000

.branch01CCDA
#_01CCDA: LDA.w #$FFFF
#_01CCDD: STA.w $0552,Y
#_01CCE0: STA.w $0600,Y
#_01CCE3: INY
#_01CCE4: INY
#_01CCE5: CPY.w #$0010
#_01CCE8: BCC .branch01CCDA

#_01CCEA: LDA.w $105C,X
#_01CCED: STA.w $0564
#_01CCF0: TAY
#_01CCF1: LDA.w $0512,Y
#_01CCF4: BNE .branch01CD02

#_01CCF6: LDA.w $105C,X
#_01CCF9: EOR.w #$0002
#_01CCFC: STA.w $105C,X
#_01CCFF: STA.w $0564

.branch01CD02
#_01CD02: LDY.w #$0600
#_01CD05: LDA.w $0564
#_01CD08: BEQ .branch01CD0D

#_01CD0A: LDY.w #$0780

.branch01CD0D
#_01CD0D: STY.w $0526
#_01CD10: STZ.w $0550
#_01CD13: LDA.w $054A
#_01CD16: BEQ .branch01CD50

#_01CD18: CMP.w #$FFFF
#_01CD1B: BEQ .branch01CD50

#_01CD1D: BPL .branch01CD51

#_01CD1F: LDY.w $0564
#_01CD22: LDA.w $050E,Y
#_01CD25: STA.w $0600
#_01CD28: LDX.w $0526

.branch01CD2B
#_01CD2B: LDA.w $1000,X
#_01CD2E: BPL .branch01CD45

#_01CD30: LDA.w $1002,X
#_01CD33: AND.w #$C000
#_01CD36: BNE .branch01CD45

#_01CD38: TXA
#_01CD39: LDY.w $0550
#_01CD3C: STA.w $0552,Y
#_01CD3F: INC.w $0550
#_01CD42: INC.w $0550

.branch01CD45
#_01CD45: TXA
#_01CD46: CLC
#_01CD47: ADC.w #$0060
#_01CD4A: TAX
#_01CD4B: DEC.w $0600
#_01CD4E: BNE .branch01CD2B

.branch01CD50
#_01CD50: RTS

.branch01CD51
#_01CD51: LDY.w $0526
#_01CD54: LDA.w $1012,X
#_01CD57: ASL A
#_01CD58: STA.w $0620
#_01CD5B: LDA.w $1018,X
#_01CD5E: LSR A
#_01CD5F: ADC.w $0620
#_01CD62: STA.w $0620
#_01CD65: LDA.w $101A,X
#_01CD68: LSR A
#_01CD69: LSR A
#_01CD6A: ADC.w $0620
#_01CD6D: STA.w $0620
#_01CD70: CPX.w #$0180
#_01CD73: BCC .branch01CDB2

#_01CD75: JSL GetRandomInt
#_01CD79: AND.w #$0007
#_01CD7C: CLC
#_01CD7D: ADC.w $0620
#_01CD80: STA.w $0620
#_01CD83: LDA.w $1012,Y
#_01CD86: ASL A
#_01CD87: STA.w $0622
#_01CD8A: LDA.w $1018,Y
#_01CD8D: LSR A
#_01CD8E: ADC.w $0622
#_01CD91: STA.w $0622
#_01CD94: LDA.w $101A,Y
#_01CD97: LSR A
#_01CD98: LSR A
#_01CD99: ADC.w $0622
#_01CD9C: STA.w $0622
#_01CD9F: JSL GetRandomInt
#_01CDA3: AND.w #$0007
#_01CDA6: CLC
#_01CDA7: ADC.w $0622
#_01CDAA: CMP.w $0620
#_01CDAD: BCS .branch01CDCF

#_01CDAF: JMP .branch01CE60

.branch01CDB2
#_01CDB2: LDA.w $100A,Y
#_01CDB5: LSR A
#_01CDB6: STA.w $0622
#_01CDB9: JSL GetRandomInt
#_01CDBD: AND.w #$000F
#_01CDC0: CLC
#_01CDC1: ADC.w #$000E
#_01CDC4: ADC.w $0622
#_01CDC7: CMP.w $0620
#_01CDCA: BCS .branch01CDCF

#_01CDCC: JMP .branch01CE60

.branch01CDCF
#_01CDCF: JSL GetRandomInt
#_01CDD3: LDY.w $0564
#_01CDD6: LDA.w $0512,Y
#_01CDD9: BNE .branch01CDDE

#_01CDDB: LDA.w #$0001

.branch01CDDE
#_01CDDE: DEC A
#_01CDDF: ASL A
#_01CDE0: SEC
#_01CDE1: SBC.w $0550
#_01CDE4: TAX
#_01CDE5: LDA.w #$0000
#_01CDE8: TAY

.branch01CDE9
#_01CDE9: CLC
#_01CDEA: ADC.l data01CF0D,X
#_01CDEE: INY
#_01CDEF: CMP.w $0ED5
#_01CDF2: BCC .branch01CDE9

#_01CDF4: TYA
#_01CDF5: CLC
#_01CDF6: ADC.w #$000F
#_01CDF9: LDX.w $0564
#_01CDFC: BEQ .branch01CE01

#_01CDFE: ADC.w #$0004

.branch01CE01
#_01CE01: TAY
#_01CE02: LDA.w #$0060

#_01CE05: SEP #$20
#_01CE07: STA.w PPUMULT16
#_01CE0A: XBA
#_01CE0B: STA.w PPUMULT16
#_01CE0E: TYA
#_01CE0F: STA.w PPUMULT8
#_01CE12: NOP
#_01CE13: NOP
#_01CE14: NOP
#_01CE15: NOP
#_01CE16: NOP
#_01CE17: NOP
#_01CE18: NOP
#_01CE19: NOP

#_01CE1A: REP #$20
#_01CE1C: LDX.w MPYL

.branch01CE1F
#_01CE1F: LDA.w $1000,X
#_01CE22: BPL .branch01CE2C

#_01CE24: LDA.w $1002,X
#_01CE27: AND.w #$C000
#_01CE2A: BEQ .branch01CE34

.branch01CE2C
#_01CE2C: TXA
#_01CE2D: CLC
#_01CE2E: ADC.w #$0060
#_01CE31: TAX
#_01CE32: BRA .branch01CE1F

.branch01CE34
#_01CE34: TXA
#_01CE35: LDY.w #$0000

.branch01CE38
#_01CE38: CMP.w $0552,Y
#_01CE3B: BEQ .branch01CE2C

#_01CE3D: INY
#_01CE3E: INY
#_01CE3F: CPY.w #$0010
#_01CE42: BCC .branch01CE38

#_01CE44: LDY.w $0550
#_01CE47: STA.w $0552,Y
#_01CE4A: INC.w $0550
#_01CE4D: INC.w $0550
#_01CE50: LDY.w $0564
#_01CE53: LDA.w $0512,Y
#_01CE56: ASL A
#_01CE57: CMP.w $0550
#_01CE5A: BEQ .branch01CE5F

#_01CE5C: JMP .branch01CDCF

.branch01CE5F
#_01CE5F: RTS

.branch01CE60
#_01CE60: PHB
#_01CE61: PHK
#_01CE62: PLB
#_01CE63: STZ.w $0620

.branch01CE66
#_01CE66: STZ.w $0624
#_01CE69: LDX.w $0526
#_01CE6C: LDY.w $0620
#_01CE6F: LDA.w data01CF1D,Y
#_01CE72: STA.w $0622

.branch01CE75
#_01CE75: LDA.w $1000,X
#_01CE78: BPL .branch01CED6

#_01CE7A: LDA.w $1002,X
#_01CE7D: AND.w $0622
#_01CE80: BNE .branch01CED6

#_01CE82: LDA.w $102E,X
#_01CE85: STA.w $0626
#_01CE88: STX.w $0628
#_01CE8B: TXA
#_01CE8C: LDY.w #$0000

.branch01CE8F
#_01CE8F: CMP.w $0552,Y
#_01CE92: BEQ .branch01CED6

#_01CE94: INY
#_01CE95: INY
#_01CE96: CPY.w #$0010
#_01CE99: BCC .branch01CE8F

#_01CE9B: LDY.w $0550

.branch01CE9E
#_01CE9E: LDA.w $0628
#_01CEA1: CMP.w #$FFFF
#_01CEA4: BEQ .branch01CED0

#_01CEA6: LDA.w $0600,Y
#_01CEA9: CMP.w $0626
#_01CEAC: BCC .branch01CEC9

#_01CEAE: BEQ .branch01CEC9

#_01CEB0: PHA
#_01CEB1: LDA.w $0552,Y
#_01CEB4: PHA
#_01CEB5: LDA.w $0626
#_01CEB8: STA.w $0600,Y
#_01CEBB: LDA.w $0628
#_01CEBE: STA.w $0552,Y
#_01CEC1: PLA
#_01CEC2: STA.w $0628
#_01CEC5: PLA
#_01CEC6: STA.w $0626

.branch01CEC9
#_01CEC9: INY
#_01CECA: INY
#_01CECB: CPY.w #$0010
#_01CECE: BCC .branch01CE9E

.branch01CED0
#_01CED0: INC.w $0550
#_01CED3: INC.w $0550

.branch01CED6
#_01CED6: TXA
#_01CED7: CLC
#_01CED8: ADC.w #$0060
#_01CEDB: TAX
#_01CEDC: CMP.w #$0900
#_01CEDF: BCS .branch01CEEF

#_01CEE1: INC.w $0624
#_01CEE4: LDA.w $0624
#_01CEE7: LDY.w $0564
#_01CEEA: CMP.w $050E,Y
#_01CEED: BCC .branch01CE75

.branch01CEEF
#_01CEEF: LDY.w $0564
#_01CEF2: LDA.w $0512,Y
#_01CEF5: ASL A
#_01CEF6: CMP.w $0550
#_01CEF9: BEQ .branch01CF0B

#_01CEFB: LDA.w $0620
#_01CEFE: INC A
#_01CEFF: INC A
#_01CF00: STA.w $0620
#_01CF03: CMP.w #$0006
#_01CF06: BCS .branch01CF0B

#_01CF08: JMP .branch01CE66

.branch01CF0B
#_01CF0B: PLB
#_01CF0C: RTS

data01CF0D:
#_01CF0D: dw $0100,$0080,$0056,$0040
#_01CF15: dw $0034,$002B,$0025,$0020

data01CF1D:
#_01CF1D: dw $FFFF,$F160,$C000

routine01CF23:
#_01CF23: LDY.w #$0000

.branch01CF26
#_01CF26: LDA.w #$FFFF
#_01CF29: STA.w $0552,Y
#_01CF2C: LDA.w #$0000
#_01CF2F: STA.w $0600,Y
#_01CF32: INY
#_01CF33: INY
#_01CF34: CPY.w #$0010
#_01CF37: BCC .branch01CF26

#_01CF39: STZ.w $0550
#_01CF3C: LDA.w $054A
#_01CF3F: BEQ .branch01CF71

#_01CF41: CMP.w #$FFFF
#_01CF44: BEQ .branch01CF71

#_01CF46: BPL .branch01CF72

#_01CF48: LDY.w #$0000

.branch01CF4B
#_01CF4B: LDX.w $0700,Y
#_01CF4E: BMI .branch01CF71

#_01CF50: LDA.w $1000,X
#_01CF53: BPL .branch01CF6A

#_01CF55: LDA.w $1002,X
#_01CF58: AND.w #$C000
#_01CF5B: BNE .branch01CF6A

#_01CF5D: TXA
#_01CF5E: LDX.w $0550
#_01CF61: STA.w $0552,X
#_01CF64: INC.w $0550
#_01CF67: INC.w $0550

.branch01CF6A
#_01CF6A: INY
#_01CF6B: INY
#_01CF6C: CPY.w #$000C
#_01CF6F: BCC .branch01CF4B

.branch01CF71
#_01CF71: RTS

.branch01CF72
#_01CF72: JSL GetRandomInt
#_01CF76: LDA.w $0516
#_01CF79: DEC A
#_01CF7A: ASL A
#_01CF7B: SEC
#_01CF7C: SBC.w $0550
#_01CF7F: TAX
#_01CF80: LDA.w #$0000
#_01CF83: TAY

.branch01CF84
#_01CF84: CPY.w #$0006
#_01CF87: BCC .branch01CF96

#_01CF89: CPX.w #$000C
#_01CF8C: BCS .branch01CF96

#_01CF8E: PHA
#_01CF8F: TXA
#_01CF90: CLC
#_01CF91: ADC.w #$0006
#_01CF94: TAX
#_01CF95: PLA

.branch01CF96
#_01CF96: CLC
#_01CF97: ADC.l data01CFE0,X
#_01CF9B: INY
#_01CF9C: INY
#_01CF9D: CMP.w $0ED5
#_01CFA0: BCC .branch01CF84

#_01CFA2: DEY
#_01CFA3: DEY

.branch01CFA4
#_01CFA4: LDX.w $0700,Y
#_01CFA7: BMI .branch01CFDF

#_01CFA9: LDA.w $1000,X
#_01CFAC: BPL .branch01CFB6

#_01CFAE: LDA.w $1002,X
#_01CFB1: AND.w #$C000
#_01CFB4: BEQ .branch01CFBA

.branch01CFB6
#_01CFB6: INY
#_01CFB7: INY
#_01CFB8: BRA .branch01CFA4

.branch01CFBA
#_01CFBA: TXA
#_01CFBB: LDX.w #$0000

.branch01CFBE
#_01CFBE: CMP.w $0552,X
#_01CFC1: BEQ .branch01CFB6

#_01CFC3: INX
#_01CFC4: INX
#_01CFC5: CPX.w #$0010
#_01CFC8: BCC .branch01CFBE

#_01CFCA: LDY.w $0550
#_01CFCD: STA.w $0552,Y
#_01CFD0: INC.w $0550
#_01CFD3: INC.w $0550
#_01CFD6: LDA.w $0516
#_01CFD9: ASL A
#_01CFDA: CMP.w $0550
#_01CFDD: BNE .branch01CF72

.branch01CFDF
#_01CFDF: RTS

data01CFE0:
#_01CFE0: dw $0100,$0080,$0056,$0044
#_01CFE8: dw $003A,$0032,$0034,$002A
#_01CFF0: dw $0024

;===================================================================================================

routine01CFF2:
#_01CFF2: LDA.w $054A
#_01CFF5: BNE .not_complete_miss

#_01CFF7: JMP .enemy_dodged

.not_complete_miss
#_01CFFA: CMP.w #$FFFF
#_01CFFD: BNE .branch01D002

#_01CFFF: JMP .hit_landed

.branch01D002
#_01D002: LDX.w $051A

; check combat status for freeze, bind, sleep, paralysis, petrify
#_01D005: LDA.w $1002,X
#_01D008: AND.w #$3070
#_01D00B: BEQ .enemy_not_stunned

#_01D00D: JMP .hit_landed

.enemy_not_stunned
#_01D010: LDY.w $0518

; check attacker's something
#_01D013: LDA.w $1008,Y
#_01D016: BIT.w #$0006
#_01D019: BEQ .weapons_check

#_01D01B: BIT.w #$0004
#_01D01E: BNE .calc_for_spell

; if demon
#_01D020: CPY.w #$0180
#_01D023: BCS .calc_for_spell

.weapons_check
#_01D025: BIT.w #$0008
#_01D028: BNE .hit_landed

; if demon
#_01D02A: CPY.w #$0180
#_01D02D: BCS .use_gun

#_01D02F: BIT.w #$0001
#_01D032: BNE .dont_use_gun

.use_gun
#_01D034: INY
#_01D035: INY
#_01D036: INY
#_01D037: INY

; Target.Evade - Caster.WeaponAccuracy
.dont_use_gun
#_01D038: LDA.w $1028,X
#_01D03B: SEC
#_01D03C: SBC.w $1020,Y

;---------------------------------------------------------------------------------------------------

.run_calc
#_01D03F: CLC
#_01D040: ADC.w #$0018
#_01D043: BMI .hit_landed

; [(ceil(P/4) mod 256) * ceil(ceil(P/4)/2)] mod 256

#_01D045: LSR A
#_01D046: LSR A
#_01D047: ADC.w #$0000
#_01D04A: TAX

#_01D04B: LSR A
#_01D04C: ADC.w #$0000

#_01D04F: SEP #$20

#_01D051: STA.w PPUMULT16
#_01D054: XBA
#_01D055: STA.w PPUMULT16

#_01D058: TXA
#_01D059: STA.w PPUMULT8

#_01D05C: NOP
#_01D05D: NOP
#_01D05E: NOP
#_01D05F: NOP
#_01D060: NOP
#_01D061: NOP
#_01D062: NOP
#_01D063: NOP

#_01D064: REP #$20

#_01D066: LDA.w MPYL
#_01D069: STA.w $0600

#_01D06C: JSL GetRandomInt
#_01D070: AND.w #$00FF
#_01D073: CMP.w $0600
#_01D076: BCS .hit_landed

.enemy_dodged
#_01D078: JSR HandleDodgedAttackMessages

#_01D07B: SEC
#_01D07C: RTS

.hit_landed
#_01D07D: CLC
#_01D07E: RTS

;---------------------------------------------------------------------------------------------------

; Target.LUK/4 + Target.INT - Caster.MEffect
.calc_for_spell
#_01D07F: LDA.w $101A,X
#_01D082: LSR A
#_01D083: LSR A
#_01D084: ADC.w $1012,X
#_01D087: SEC
#_01D088: SBC.w $102C,Y

#_01D08B: BRA .run_calc

;===================================================================================================

HandleDodgedAttackMessages:
#_01D08D: LDX.w $051A
#_01D090: BPL .party_caster

#_01D092: LDY.w $0518
#_01D095: CPY.w #$0600
#_01D098: BCC .party_caster

#_01D09A: LDY.w #$0000

.next
#_01D09D: LDX.w $0700,Y

#_01D0A0: LDA.w $1002,X
#_01D0A3: AND.w #$C000
#_01D0A6: BEQ .not_dead

#_01D0A8: INY
#_01D0A9: INY

#_01D0AA: BRA .next

.not_dead
#_01D0AC: STX.w $051A

.party_caster
#_01D0AF: LDA.w $1004,X
#_01D0B2: STA.w $0A3E

#_01D0B5: LDA.w #$0012

#_01D0B8: LDX.w $051A
#_01D0BB: CPX.w #$0600
#_01D0BE: BCS .enemy_team

#_01D0C0: INC A

.enemy_team
#_01D0C1: JSR DisplayCombatMessage

#_01D0C4: RTS

;===================================================================================================
; Something to do with damage?
;===================================================================================================
routine01D0C5:
#_01D0C5: STZ.w $0562

#_01D0C8: LDY.w $0518
#_01D0CB: CPY.w #$0180
#_01D0CE: BCC .human_caster

#_01D0D0: LDA.w $1008,Y
#_01D0D3: BIT.w #$000E
#_01D0D6: BEQ .branch01D128

#_01D0D8: BIT.w #$0008
#_01D0DB: BEQ .branch01D0FB

; return to computer
#_01D0DD: TYX
#_01D0DE: JSL routine019581

#_01D0E2: LDA.w #$002A
#_01D0E5: JSR DisplayCombatMessage

#_01D0E8: RTS

;---------------------------------------------------------------------------------------------------

.human_caster
#_01D0E9: LDA.w $1008,Y
#_01D0EC: BIT.w #$000C
#_01D0EF: BEQ .branch01D128

#_01D0F1: BIT.w #$0008
#_01D0F4: BNE .branch01D101

#_01D0F6: CPY.w #$0060
#_01D0F9: BCC .am_chase

.branch01D0FB
#_01D0FB: JSL routine01E95F
#_01D0FF: BRA .branch01D12B

.branch01D101
#_01D101: JSL routine01F672
#_01D105: BRA .branch01D12B

;---------------------------------------------------------------------------------------------------

.am_chase
#_01D107: JSL routine01885D

.branch01D10B
#_01D10B: LDX.w $0518
#_01D10E: CPX.w #$0600
#_01D111: BCC .branch01D127

#_01D113: LDA.w $1000,X
#_01D116: BMI .branch01D127

#_01D118: LDA.w $051A
#_01D11B: PHA
#_01D11C: STX.w $051A
#_01D11F: JSL routine01E76D
#_01D123: PLA
#_01D124: STA.w $051A

.branch01D127
#_01D127: RTS

.branch01D128
#_01D128: JSR CalculateAttackMultiplier

.branch01D12B
#_01D12B: JSR TestIfMoveIsReflected

;---------------------------------------------------------------------------------------------------

#_01D12E: LDA.w $05AA
#_01D131: CMP.w #$FFFF
#_01D134: BEQ .branch01D143

#_01D136: JSR routine01D784

#_01D139: LDA.w $0562
#_01D13C: BNE .branch01D146

#_01D13E: LDA.w $05AA
#_01D141: BNE .branch01D146

.branch01D143
#_01D143: JMP .branch01D1B8

.branch01D146
#_01D146: CMP.w #$FFFF
#_01D149: BEQ .branch01D10B

.branch01D14B
#_01D14B: LDX.w $051A
#_01D14E: LDA.w $05AA
#_01D151: BEQ .branch01D16A

#_01D153: ORA.w $1002,X
#_01D156: STA.w $1002,X
#_01D159: AND.w #$C000
#_01D15C: BEQ .branch01D16A

#_01D15E: LDA.w $102E,X
#_01D161: STA.w $0562
#_01D164: STZ.w $102E,X
#_01D167: STZ.w $1032,X

.branch01D16A
#_01D16A: LDA.w $1008,X
#_01D16D: AND.w #$0010
#_01D170: BEQ .branch01D17D

#_01D172: LSR.w $0562
#_01D175: LSR.w $0562
#_01D178: BNE .branch01D17D

#_01D17A: INC.w $0562

.branch01D17D
#_01D17D: LDA.w $0562
#_01D180: STA.w $0A54
#_01D183: STZ.w $0A56
#_01D186: JSR routine01D408
#_01D189: LDX.w $051A
#_01D18C: LDA.w $102E,X
#_01D18F: BEQ .branch01D19C

#_01D191: SEC
#_01D192: SBC.w $0562
#_01D195: STA.w $102E,X
#_01D198: BCC .branch01D19C

#_01D19A: BNE .branch01D1A6

.branch01D19C
#_01D19C: JSR routine01D2A4
#_01D19F: BCC .branch01D1A6

#_01D1A1: JSR routine01D303
#_01D1A4: BRA .branch01D1A6

.branch01D1A6
#_01D1A6: LDX.w $051A
#_01D1A9: CPX.w #$0600
#_01D1AC: BCS .branch01D1B3

#_01D1AE: JSR routine01D5B5
#_01D1B1: BRA .branch01D1B7

.branch01D1B3
#_01D1B3: JSL routine01E76D

.branch01D1B7
#_01D1B7: RTS

.branch01D1B8
#_01D1B8: LDA.w $052A
#_01D1BB: AND.w #$0200
#_01D1BE: BNE .branch01D1F9

#_01D1C0: LDA.w $054A
#_01D1C3: CMP.w #$FFFF
#_01D1C6: BEQ .branch01D1F9

#_01D1C8: LDA.w $05AA
#_01D1CB: CMP.w #$FFFF
#_01D1CE: BEQ .branch01D1E4

#_01D1D0: BIT.w $05BE
#_01D1D3: BMI .branch01D1FA

#_01D1D5: JSL GetRandomInt
#_01D1D9: AND.w #$0001
#_01D1DC: BEQ .branch01D1E4

#_01D1DE: INC.w $0562
#_01D1E1: JMP .branch01D14B

.branch01D1E4
#_01D1E4: LDX.w $051A
#_01D1E7: LDA.w $1004,X
#_01D1EA: STA.w $0A3E

; it missed message
#_01D1ED: LDA.w #$0017

#_01D1F0: CPX.w #$0600
#_01D1F3: BCS .branch01D1F6

#_01D1F5: INC A

.branch01D1F6
#_01D1F6: JSR DisplayCombatMessage

.branch01D1F9
#_01D1F9: RTS

;---------------------------------------------------------------------------------------------------

.branch01D1FA
#_01D1FA: BVS .branch01D21F

#_01D1FC: BIT.w $05A8
#_01D1FF: BVS .branch01D21F

#_01D201: LDX.w $051A
#_01D204: LDA.w $1004,X
#_01D207: STA.w $0A3E

; no effect message
#_01D20A: LDA.w #$0019
#_01D20D: CPX.w #$0600
#_01D210: BCS .branch01D213

#_01D212: INC A

.branch01D213
#_01D213: JSR DisplayCombatMessage
#_01D216: LDA.w $05A8
#_01D219: ORA.w #$4000
#_01D21C: STA.w $05A8

.branch01D21F
#_01D21F: RTS

;===================================================================================================

CalculateAttackMultiplier:
#_01D220: CPY.w #$0180
#_01D223: BCS .demon_caster

#_01D225: LDA.w $1008,Y
#_01D228: AND.w #$0001
#_01D22B: BNE .not_using_gun

#_01D22D: JSL GetRandomInt
#_01D231: AND.w #$00FF
#_01D234: CMP.w #$0040
#_01D237: BCS .no_bullet_status

#_01D239: LDA.w $1046,Y
#_01D23C: LDY.w #$0008
#_01D23F: JSL GetEquipmentStat
#_01D243: AND.w #$FFFF
#_01D246: BEQ .no_bullet_status

#_01D248: JSL TestIfTargetAlreadyHasAffliction
#_01D24C: BCS .no_bullet_status

#_01D24E: STA.w $05AA

.no_bullet_status
#_01D251: LDY.w $0518

;---------------------------------------------------------------------------------------------------

.demon_caster
#_01D254: INY
#_01D255: INY
#_01D256: INY
#_01D257: INY

.not_using_gun
#_01D258: LDA.w $101E,Y
#_01D25B: LSR A
#_01D25C: LSR A
#_01D25D: ADC.w #$0004
#_01D260: TAX

#_01D261: LDA.w $101E,Y

#_01D264: SEP #$20

#_01D266: STA.w PPUMULT16
#_01D269: XBA
#_01D26A: STA.w PPUMULT16

#_01D26D: TXA
#_01D26E: STA.w PPUMULT8

#_01D271: NOP
#_01D272: NOP
#_01D273: NOP
#_01D274: NOP
#_01D275: NOP
#_01D276: NOP
#_01D277: NOP
#_01D278: NOP

#_01D279: REP #$20

#_01D27B: LDA.w MPYL
#_01D27E: JSR ApplyAttackBuff

#_01D281: LDX.w $051A
#_01D284: LDY.w $1026,X
#_01D287: JSR ApplyDefenseBuff

#_01D28A: LDX.w #$0000
#_01D28D: JSL DivisionBig_XA_by_Y
#_01D291: JSL RoundQuotient

#_01D295: DEC A
#_01D296: BPL .nonzero

#_01D298: LDA.w #$0000

.nonzero
#_01D29B: STA.w $0562
#_01D29E: BNE .exit

; No status effect if no damage is dealt
#_01D2A0: STZ.w $05AA

.exit
#_01D2A3: RTS

;===================================================================================================

routine01D2A4:
#_01D2A4: LDX.w $051A
#_01D2A7: CPX.w #$0600
#_01D2AA: BCS .fail

#_01D2AC: LDA.w $057E
#_01D2AF: BNE .branch01D2F1

#_01D2B1: LDA.w $0582
#_01D2B4: BNE .branch01D2CE

#_01D2B6: LDA.w $05AA
#_01D2B9: AND.w #$C000
#_01D2BC: BEQ .fail

#_01D2BE: LDA.w $0586
#_01D2C1: BEQ .fail

#_01D2C3: STZ.w $0586
#_01D2C6: STZ.w $1002,X

#_01D2C9: LDA.w #$00DE
#_01D2CC: BRA .branch01D2DC

.branch01D2CE
#_01D2CE: LDA.w $101C,X
#_01D2D1: CMP.w #$006F
#_01D2D4: BCS .fail

#_01D2D6: STZ.w $0582
#_01D2D9: LDA.w #$00DC

.branch01D2DC
#_01D2DC: STA.w $0A50
#_01D2DF: LDA.w $102E,X
#_01D2E2: CLC
#_01D2E3: ADC.w $0562
#_01D2E6: STA.w $102E,X

; saved by <item>
#_01D2E9: LDA.w #$0037
#_01D2EC: JSR DisplayCombatMessage
#_01D2EF: CLC
#_01D2F0: RTS

.branch01D2F1
#_01D2F1: LDA.w $101C,X
#_01D2F4: CMP.w #$0091
#_01D2F7: BCC .fail

#_01D2F9: STZ.w $057E
#_01D2FC: LDA.w #$00DA
#_01D2FF: BRA .branch01D2DC

.fail
#_01D301: SEC
#_01D302: RTS

;===================================================================================================

routine01D303:
#_01D303: LDX.w $051A
#_01D306: LDA.w $1002,X
#_01D309: AND.w #$8000
#_01D30C: ORA.w #$4000
#_01D30F: STA.w $1002,X
#_01D312: STZ.w $102E,X
#_01D315: STZ.w $1032,X
#_01D318: LDA.w $1004,X
#_01D31B: STA.w $0A3E
#_01D31E: LDX.w $051A
#_01D321: CPX.w #$0600
#_01D324: BCC .branch01D361

#_01D326: LDA.w #$002C ; SFX 2C
#_01D329: JSL Write_to_APU_transferrable
#_01D32D: JSR DistributeExperiencePointsToTeam
#_01D330: INC.w $054C
#_01D333: LDX.w $0564
#_01D336: DEC.w $0512,X
#_01D339: BNE .branch01D360

#_01D33B: JSR routine01D383
#_01D33E: LDA.w $052A
#_01D341: AND.w #$0100
#_01D344: BNE .branch01D34D

#_01D346: LDA.w $0564
#_01D349: JSL routine01E5CD

.branch01D34D
#_01D34D: LDA.w $0524
#_01D350: BPL .branch01D360

#_01D352: LDY.w $0564
#_01D355: BEQ .branch01D35A

#_01D357: LDA.w #$3FFF

.branch01D35A
#_01D35A: AND.w #$BFFF
#_01D35D: STA.w $0524

.branch01D360
#_01D360: RTS

.branch01D361
#_01D361: LDA.w #$002F ; SFX 2F
#_01D364: JSL Write_to_APU_transferrable

#_01D368: DEC.w $0516

; <guy> collapsed
#_01D36B: LDA.w #$001B
#_01D36E: JSR DisplayCombatMessage

#_01D371: LDX.w $051A
#_01D374: CPX.w #$0180
#_01D377: BCC .branch01D37E

#_01D379: JSL routine019581
#_01D37D: RTS

.branch01D37E
#_01D37E: JSL VerifyTheHumansAreOkay
#_01D382: RTS

;===================================================================================================

routine01D383:
#_01D383: LDX.w $051A

#_01D386: LDY.w #$0180

.next
#_01D389: LDA.w $1000,Y
#_01D38C: BPL .absent

#_01D38E: LDA.w $1004,Y
#_01D391: CMP.w $1004,X
#_01D394: BEQ .branch01D3A2

.absent
#_01D396: TYA
#_01D397: CLC
#_01D398: ADC.w #$0060
#_01D39B: TAY

#_01D39C: CPY.w #$0600
#_01D39F: BCC .next

#_01D3A1: RTS

;---------------------------------------------------------------------------------------------------

.branch01D3A2
#_01D3A2: LDA.w $101C
#_01D3A5: CMP.w #$00FF
#_01D3A8: BCS .exit

#_01D3AA: LDA.w $0726
#_01D3AD: CLC
#_01D3AE: ADC.w #$199A
#_01D3B1: STA.w $0726

#_01D3B4: LDA.w $101C
#_01D3B7: ADC.w #$0000
#_01D3BA: STA.w $101C

.exit
#_01D3BD: RTS

;===================================================================================================

VerifyTheHumansAreOkay:
#_01D3BE: PHP
#_01D3BF: REP #$30

#_01D3C1: LDA.w $1000
#_01D3C4: BPL .not_here_a

#_01D3C6: LDA.w $1002
#_01D3C9: AND.w #$E000
#_01D3CC: BEQ .someone_is_okay_enough

.not_here_a
#_01D3CE: LDA.w $1060
#_01D3D1: BPL .not_here_b

#_01D3D3: LDA.w $1062
#_01D3D6: AND.w #$E000
#_01D3D9: BEQ .someone_is_okay_enough

.not_here_b
#_01D3DB: LDA.w $10C0
#_01D3DE: BPL .not_here_c

#_01D3E0: LDA.w $10C2
#_01D3E3: AND.w #$E000
#_01D3E6: BEQ .someone_is_okay_enough

.not_here_c
#_01D3E8: LDA.w $1120
#_01D3EB: BPL .not_here_d

#_01D3ED: LDA.w $1122
#_01D3F0: AND.w #$E000
#_01D3F3: BEQ .someone_is_okay_enough

.not_here_d
#_01D3F5: LDA.w $0400
#_01D3F8: ORA.w #$8000
#_01D3FB: STA.w $0400

#_01D3FE: JSL routine02D0B8
#_01D402: JSL AddSelfAsVector

.someone_is_okay_enough
#_01D406: PLP
#_01D407: RTL

;===================================================================================================

routine01D408:
#_01D408: LDA.w #$002D ; SFX 2D
#_01D40B: LDX.w $051A
#_01D40E: CPX.w #$0600
#_01D411: BCC .branch01D416

#_01D413: LDA.w #$002B ; SFX 2B

.branch01D416
#_01D416: JSL Write_to_APU_transferrable
#_01D41A: LDX.w $051A
#_01D41D: LDY.w #$0002
#_01D420: LDA.w $1030,X

.branch01D423
#_01D423: LSR A
#_01D424: CMP.w $0A54
#_01D427: BCC .branch01D42C

#_01D429: DEY
#_01D42A: BNE .branch01D423

.branch01D42C
#_01D42C: CPX.w #$0600
#_01D42F: BCS .branch01D438

#_01D431: TYA
#_01D432: CLC
#_01D433: ADC.w #$000C
#_01D436: BRA .branch01D466

.branch01D438
#_01D438: TYA
#_01D439: ASL A
#_01D43A: ASL A
#_01D43B: CLC
#_01D43C: ADC.w #$0003
#_01D43F: TAY
#_01D440: LDX.w $0518
#_01D443: LDA.w $1008,X
#_01D446: AND.w #$0004
#_01D449: BEQ .branch01D465

#_01D44B: LDA.w $1058,X
#_01D44E: CMP.w #$0023
#_01D451: BCS .branch01D483

#_01D453: CMP.w #$000C
#_01D456: BCS .branch01D465

#_01D458: DEY
#_01D459: CMP.w #$0008
#_01D45C: BCS .branch01D465

#_01D45E: DEY
#_01D45F: CMP.w #$0004
#_01D462: BCS .branch01D465

#_01D464: DEY

.branch01D465
#_01D465: TYA

.branch01D466
#_01D466: JSL routine00E522
#_01D46A: LDX.w $051A
#_01D46D: CPX.w #$0600
#_01D470: BCC .branch01D483

#_01D472: LDA.w $050A
#_01D475: ASL A
#_01D476: ASL A
#_01D477: ASL A
#_01D478: TAX
#_01D479: LDA.l DemonLoadInfo,X
#_01D47D: BMI .branch01D483

#_01D47F: JSL routine01E4EF

.branch01D483
#_01D483: LDA.w $0A54
#_01D486: BEQ .branch01D49D

#_01D488: LDX.w $051A
#_01D48B: LDA.w $1004,X
#_01D48E: STA.w $0A3E

; took <x> damage
#_01D491: LDA.w #$0014
#_01D494: CPX.w #$0600
#_01D497: BCC .branch01D49A

#_01D499: INC A

.branch01D49A
#_01D49A: JSR DisplayCombatMessage

;---------------------------------------------------------------------------------------------------

.branch01D49D
#_01D49D: LDA.w $05AA
#_01D4A0: BEQ .branch01D4D6

#_01D4A2: BIT.w #$C000
#_01D4A5: BNE .branch01D4AF

#_01D4A7: LDX.w $051A
#_01D4AA: LDY.w $102E,X
#_01D4AD: BEQ .branch01D4D6

.branch01D4AF
#_01D4AF: LDX.w #$0000

.branch01D4B2
#_01D4B2: ASL A
#_01D4B3: BCS .branch01D4BD

#_01D4B5: INX
#_01D4B6: CPX.w #$0010
#_01D4B9: BCC .branch01D4B2

#_01D4BB: BRA .branch01D4D6

.branch01D4BD
#_01D4BD: LDY.w $051A
#_01D4C0: LDA.w $1004,Y
#_01D4C3: STA.w $0A3E
#_01D4C6: TXA
#_01D4C7: ASL A
#_01D4C8: CPY.w #$0600
#_01D4CB: BCC .branch01D4CE

#_01D4CD: INC A

.branch01D4CE
#_01D4CE: CLC
#_01D4CF: ADC.w #$004A
#_01D4D2: JSL DisplayActionMessage

.branch01D4D6
#_01D4D6: RTS

;===================================================================================================

DistributeExperiencePointsToTeam:
#_01D4D7: LDY.w #$0000

.next_party_member
#_01D4DA: STY.w $0720

#_01D4DD: LDX.w $0700,Y
#_01D4E0: BMI .abort_experience_distribution

#_01D4E2: CPX.w #$0180
#_01D4E5: BCS .demon_character

#_01D4E7: STX.w $0715
#_01D4EA: STX.w WRDIVL

; get slot/size of data
#_01D4ED: SEP #$20

#_01D4EF: LDA.b #$60
#_01D4F1: STA.w WRDIVB

#_01D4F4: NOP
#_01D4F5: NOP
#_01D4F6: NOP
#_01D4F7: NOP
#_01D4F8: NOP
#_01D4F9: NOP
#_01D4FA: NOP
#_01D4FB: NOP

#_01D4FC: REP #$20

#_01D4FE: LDA.w RDDIVL
#_01D501: ASL A
#_01D502: STA.w $0500

#_01D505: JSL GiveCharacterExperienceFromBattle

#_01D509: LDX.w $0500
#_01D50C: CLC
#_01D50D: ADC.w $05D6,X
#_01D510: BCC .no_experience_overflow

; cap at 65535 experience
#_01D512: LDA.w #$FFFF

.no_experience_overflow
#_01D515: STA.w $05D6,X

.demon_character
#_01D518: LDY.w $0720
#_01D51B: INY
#_01D51C: INY
#_01D51D: CPY.w #$000C
#_01D520: BCC .next_party_member

;---------------------------------------------------------------------------------------------------

.abort_experience_distribution
#_01D522: JSL GainMoneyFromKill

#_01D526: CLC
#_01D527: ADC.w $051E
#_01D52A: BCC .no_money_overflow

#_01D52C: LDA.w #$FFFF

.no_money_overflow
#_01D52F: STA.w $051E

;---------------------------------------------------------------------------------------------------

#_01D532: JSL routine01B77B

#_01D536: CLC
#_01D537: ADC.w $0520
#_01D53A: BCC .no_mag_overflow

#_01D53C: LDA.w #$FFFF

.no_mag_overflow
#_01D53F: STA.w $0520

#_01D542: RTS

;===================================================================================================

routine01D543:
#_01D543: LDA.w $054A
#_01D546: BEQ .branch01D5B3

#_01D548: BPL .branch01D563

#_01D54A: CMP.w #$FFFF
#_01D54D: BEQ .branch01D5B3

#_01D54F: LDY.w $0550
#_01D552: INY
#_01D553: INY
#_01D554: STY.w $0550
#_01D557: CPY.w #$0010
#_01D55A: BCS .branch01D5B3

#_01D55C: LDX.w $0552,Y
#_01D55F: BMI .branch01D5B3

.branch01D561
#_01D561: CLC
#_01D562: RTS

.branch01D563
#_01D563: DEC A
#_01D564: STA.w $054A
#_01D567: BEQ .branch01D5B3

#_01D569: LDX.w $0518
#_01D56C: CPX.w #$0180
#_01D56F: BCS .branch01D584

#_01D571: LDA.w $1008,X
#_01D574: AND.w #$0001
#_01D577: BEQ .branch01D584

#_01D579: LDX.w $051A
#_01D57C: LDA.w $1002,X
#_01D57F: AND.w #$C000
#_01D582: BEQ .branch01D561

.branch01D584
#_01D584: LDY.w $0550
#_01D587: INY
#_01D588: INY
#_01D589: CPY.w #$0010
#_01D58C: BCC .branch01D5A1

#_01D58E: LDX.w $0518
#_01D591: CPX.w #$0600
#_01D594: BCS .branch01D59E

#_01D596: LDY.w $0564
#_01D599: LDA.w $0512,Y
#_01D59C: BEQ .branch01D5B3

.branch01D59E
#_01D59E: LDY.w #$0000

.branch01D5A1
#_01D5A1: STY.w $0550
#_01D5A4: LDX.w $0552,Y
#_01D5A7: BMI .branch01D5B3

#_01D5A9: LDA.w $1002,X
#_01D5AC: AND.w #$C000
#_01D5AF: BNE .branch01D584

#_01D5B1: CLC
#_01D5B2: RTS

.branch01D5B3
#_01D5B3: SEC
#_01D5B4: RTS

;===================================================================================================

routine01D5B5:
#_01D5B5: TXA
#_01D5B6: LDY.w #$0000

.branch01D5B9
#_01D5B9: CMP.w $0700,Y
#_01D5BC: BEQ .branch01D5C7

#_01D5BE: INY
#_01D5BF: INY
#_01D5C0: CPY.w #$000C
#_01D5C3: BCC .branch01D5B9

#_01D5C5: BCS .branch01D5CF

.branch01D5C7
#_01D5C7: JSL routine00A1E7
#_01D5CB: JSL AddSelfAsVector

.branch01D5CF
#_01D5CF: RTS

;===================================================================================================

routine01D5D0:
#_01D5D0: LDX.w $0518
#_01D5D3: BIT.w $05A8
#_01D5D6: BPL .branch01D5DB

#_01D5D8: JMP .branch01D707

.branch01D5DB
#_01D5DB: LDA.w $1004,X
#_01D5DE: STA.w $0A3E
#_01D5E1: CPX.w #$0180
#_01D5E4: BCS .branch01D621

#_01D5E6: LDA.w $1008,X
#_01D5E9: BIT.w #$000F
#_01D5EC: BEQ .branch01D640

#_01D5EE: BIT.w #$0003
#_01D5F1: BNE .branch01D615

#_01D5F3: BIT.w #$0004
#_01D5F6: BEQ .branch01D60C

#_01D5F8: CPX.w #$0060
#_01D5FB: BCS .branch01D606

#_01D5FD: LDA.w $1058
#_01D600: CLC
#_01D601: ADC.w #$0030
#_01D604: BRA .branch01D637

.branch01D606
#_01D606: JSL DisplayMessageDescribingAttack
#_01D60A: BRA .branch01D63A

.branch01D60C
#_01D60C: LDA.w #$002A
#_01D60F: JSL DisplayActionMessage
#_01D613: BRA .branch01D63A

.branch01D615
#_01D615: LDY.w #$002E
#_01D618: BIT.w #$0002
#_01D61B: BNE .branch01D61E

#_01D61D: INY

.branch01D61E
#_01D61E: TYA
#_01D61F: BRA .branch01D637

.branch01D621
#_01D621: LDA.w $1008,X
#_01D624: BIT.w #$0007
#_01D627: BEQ .branch01D640

#_01D629: BIT.w #$0006
#_01D62C: BEQ .branch01D634

#_01D62E: JSL DisplayMessageDescribingAttack
#_01D632: BRA .branch01D63A

.branch01D634
#_01D634: LDA.w #$0011

.branch01D637
#_01D637: JSR DisplayCombatMessage

.branch01D63A
#_01D63A: LDA.w #$8000
#_01D63D: STA.w $05A8

.branch01D640
#_01D640: LDY.w $0518
#_01D643: LDA.w $1008,Y
#_01D646: BIT.w #$0003
#_01D649: BNE .branch01D64E

#_01D64B: JMP .branch01D6D4

.branch01D64E
#_01D64E: CPY.w #$0180
#_01D651: BCC .branch01D682

#_01D653: BIT.w #$0002
#_01D656: BNE .branch01D65B

#_01D658: JMP .branch01D707

.branch01D65B
#_01D65B: LDA.w $1058,Y
#_01D65E: AND.w #$00FF
#_01D661: ASL A
#_01D662: TAX
#_01D663: CPY.w #$0600
#_01D666: BCC .branch01D669

#_01D668: INX

.branch01D669
#_01D669: LDA.l data01DAE0,X
#_01D66D: AND.w #$00FF
#_01D670: CMP.w #$00FF
#_01D673: BEQ .branch01D681

#_01D675: LDX.w $050A
#_01D678: CPX.w #$0100
#_01D67B: BCS .branch01D681

#_01D67D: JSL routine00E817

.branch01D681
#_01D681: RTS

.branch01D682
#_01D682: BIT.w #$0001
#_01D685: BEQ .branch01D6BB

#_01D687: LDA.w $1042,Y
#_01D68A: AND.w #$00FF
#_01D68D: TAX
#_01D68E: LDA.l data01D90E,X
#_01D692: JSL Write_to_APU_transferrable
#_01D696: LDY.w $0518
#_01D699: LDA.w $1042,Y
#_01D69C: AND.w #$00FF
#_01D69F: LDY.w #$0001
#_01D6A2: JSL GetEquipmentStat
#_01D6A6: AND.w #$00FF
#_01D6A9: LDY.w #$0037
#_01D6AC: CMP.w #$0050
#_01D6AF: BCS .branch01D6B8

#_01D6B1: INY
#_01D6B2: CMP.w #$001E
#_01D6B5: BCS .branch01D6B8

#_01D6B7: INY

.branch01D6B8
#_01D6B8: TYA
#_01D6B9: BRA .branch01D6FB

.branch01D6BB
#_01D6BB: LDA.w $1044,Y
#_01D6BE: AND.w #$00FF
#_01D6C1: SEC
#_01D6C2: SBC.w #$0040
#_01D6C5: TAX
#_01D6C6: LDA.l data01D94E,X
#_01D6CA: JSL Write_to_APU_transferrable
#_01D6CE: LDA.l data01D9FE,X
#_01D6D2: BRA .branch01D6FB

.branch01D6D4
#_01D6D4: BIT.w #$0004
#_01D6D7: BEQ .branch01D707

#_01D6D9: CPY.w #$0060
#_01D6DC: BCC .branch01D707

#_01D6DE: LDA.w $1058,Y
#_01D6E1: AND.w #$00FF
#_01D6E4: ASL A
#_01D6E5: TAX
#_01D6E6: CPY.w #$0600
#_01D6E9: BCC .branch01D6EC

#_01D6EB: INX

.branch01D6EC
#_01D6EC: LDA.l data01D95E,X
#_01D6F0: AND.w #$00FF
#_01D6F3: JSL Write_to_APU_transferrable
#_01D6F7: LDA.l data01DAE0,X

.branch01D6FB
#_01D6FB: AND.w #$00FF
#_01D6FE: CMP.w #$00FF
#_01D701: BEQ .branch01D707

#_01D703: JSL routine00DB3C

.branch01D707
#_01D707: RTS

;===================================================================================================

routine01D708:
#_01D708: LDX.w $0518
#_01D70B: LDA.w $1008,X
#_01D70E: BIT.w #$000C
#_01D711: BNE .branch01D73C

#_01D713: CPX.w #$0180
#_01D716: BCS .branch01D732

#_01D718: AND.w #$0001
#_01D71B: BNE .branch01D721

#_01D71D: INX
#_01D71E: INX
#_01D71F: INX
#_01D720: INX

.branch01D721
#_01D721: LDA.w $1042,X
#_01D724: LDY.w #$000B
#_01D727: JSL GetEquipmentStat

.branch01D72B
#_01D72B: AND.w #$00FF
#_01D72E: STA.w $05BE
#_01D731: RTS

.branch01D732
#_01D732: AND.w #$0002
#_01D735: BNE .branch01D74D

#_01D737: LDA.w #$0000
#_01D73A: BRA .branch01D72B

.branch01D73C
#_01D73C: AND.w #$0004
#_01D73F: BEQ .branch01D75F

#_01D741: CPX.w #$0060
#_01D744: BCS .branch01D74D

#_01D746: LDA.w #$FFFF
#_01D749: STA.w $05BE
#_01D74C: RTS

.branch01D74D
#_01D74D: LDA.w $1058,X

.branch01D750
#_01D750: AND.w #$00FF
#_01D753: TAX
#_01D754: LDA.l data01DAFE,X
#_01D758: AND.w #$00FF
#_01D75B: STA.w $05BE
#_01D75E: RTS

.branch01D75F
#_01D75F: CPX.w #$0180
#_01D762: BCS .branch01D77D

#_01D764: LDA.w $1058,X
#_01D767: AND.w #$00FF
#_01D76A: SEC
#_01D76B: SBC.w #$00B0
#_01D76E: LDY.w #$0002
#_01D771: JSL GetUseItemStat
#_01D775: AND.w #$00FF
#_01D778: CMP.w #$0080
#_01D77B: BCC .branch01D750

.branch01D77D
#_01D77D: LDA.w #$FFFF
#_01D780: STA.w $05BE
#_01D783: RTS

;===================================================================================================

routine01D784:
#_01D784: LDA.w $0562
#_01D787: STA.w $0A54
#_01D78A: BMI .branch01D7FB

#_01D78C: JSR routine01D87E
#_01D78F: BCS .branch01D7FB

#_01D791: CMP.w #$0000
#_01D794: BNE .branch01D799

#_01D796: JMP .branch01D871

.branch01D799
#_01D799: LDX.w $0562
#_01D79C: BEQ .branch01D7FB

#_01D79E: CMP.w #$0008
#_01D7A1: BCC .branch01D7B4

#_01D7A3: CMP.w #$000D
#_01D7A6: BCS .branch01D7FC

#_01D7A8: SEC
#_01D7A9: SBC.w #$0009
#_01D7AC: BCC .branch01D7FB

#_01D7AE: ASL A
#_01D7AF: ASL A
#_01D7B0: CLC
#_01D7B1: ADC.w #$000C

.branch01D7B4
#_01D7B4: TAX
#_01D7B5: LDA.w $0A54

#_01D7B8: SEP #$30
#_01D7BA: STA.w PPUMULT16
#_01D7BD: XBA
#_01D7BE: STA.w PPUMULT16
#_01D7C1: TXA
#_01D7C2: STA.w PPUMULT8
#_01D7C5: NOP
#_01D7C6: NOP
#_01D7C7: NOP
#_01D7C8: NOP
#_01D7C9: NOP
#_01D7CA: NOP
#_01D7CB: NOP
#_01D7CC: NOP

#_01D7CD: REP #$30
#_01D7CF: LDA.w MPYL
#_01D7D2: STA.w $0A54
#_01D7D5: LDA.w MPYH
#_01D7D8: AND.w #$00FF
#_01D7DB: STA.w $0A56
#_01D7DE: LSR.w $0A56
#_01D7E1: ROR.w $0A54
#_01D7E4: LSR.w $0A56
#_01D7E7: ROR.w $0A54
#_01D7EA: LSR.w $0A56
#_01D7ED: ROR.w $0A54

.branch01D7F0
#_01D7F0: LDA.w $0A54
#_01D7F3: STA.w $0562
#_01D7F6: BNE .branch01D7FB

#_01D7F8: STZ.w $05AA

.branch01D7FB
#_01D7FB: RTS

.branch01D7FC
#_01D7FC: CMP.w #$000F
#_01D7FF: BEQ .branch01D851

#_01D801: CMP.w #$000E
#_01D804: BEQ .branch01D809

#_01D806: LSR.w $0A54

.branch01D809
#_01D809: LDA.w $0A54
#_01D80C: BEQ .branch01D7F0

#_01D80E: LDX.w $051A
#_01D811: LDA.w $1004,X
#_01D814: STA.w $0A3E
#_01D817: LDX.w $0518
#_01D81A: STX.w $051A
#_01D81D: CPX.w #$0600
#_01D820: BCC .branch01D835

#_01D822: LDA.w $0524
#_01D825: BEQ .branch01D835

#_01D827: LDA.w #$0000
#_01D82A: CPX.w #$0780
#_01D82D: BCC .branch01D832

#_01D82F: LDA.w #$0002

.branch01D832
#_01D832: STA.w $0564

.branch01D835
#_01D835: BIT.w $05A8
#_01D838: BVS .branch01D7F0

#_01D83A: LDA.w #$0034
#_01D83D: CPX.w #$0600
#_01D840: BCS .branch01D843

#_01D842: INC A

.branch01D843
#_01D843: JSR DisplayCombatMessage
#_01D846: LDA.w $05A8
#_01D849: ORA.w #$4000
#_01D84C: STA.w $05A8
#_01D84F: BRA .branch01D7F0

.branch01D851
#_01D851: LDA.w $05AA
#_01D854: CMP.w #$FFFF
#_01D857: BEQ .branch01D871

#_01D859: LDX.w $051A
#_01D85C: LDA.w $0562
#_01D85F: CLC
#_01D860: ADC.w $102E,X
#_01D863: STA.w $102E,X
#_01D866: CMP.w $1030,X
#_01D869: BCC .branch01D871

#_01D86B: LDA.w $1030,X
#_01D86E: STA.w $102E,X

.branch01D871
#_01D871: STZ.w $0562
#_01D874: STZ.w $05AA
#_01D877: LDA.w #$8000
#_01D87A: STA.w $05BE
#_01D87D: RTS

;===================================================================================================

routine01D87E:
#_01D87E: BIT.w $05BE
#_01D881: BPL .branch01D885

#_01D883: SEC
#_01D884: RTS

.branch01D885
#_01D885: LDX.w $051A
#_01D888: CPX.w #$0180
#_01D88B: BCS .branch01D8D9

#_01D88D: LDA.w #$FFFF
#_01D890: STA.w $0620
#_01D893: STZ.w $0622
#_01D896: STX.w $0624

.branch01D899
#_01D899: LDX.w $0624
#_01D89C: LDA.w $1048,X
#_01D89F: BMI .branch01D8BC

#_01D8A1: LDY.w #$0003
#_01D8A4: JSL GetEquipmentStat
#_01D8A8: CLC
#_01D8A9: ADC.w #$0024
#_01D8AC: JSR routine01D8E1
#_01D8AF: CMP.w #$000D
#_01D8B2: BCS .branch01D8D7

#_01D8B4: CMP.w $0620
#_01D8B7: BCS .branch01D8BC

#_01D8B9: STA.w $0620

.branch01D8BC
#_01D8BC: INC.w $0624
#_01D8BF: INC.w $0624
#_01D8C2: LDA.w $0622
#_01D8C5: INC A
#_01D8C6: INC A
#_01D8C7: STA.w $0622
#_01D8CA: CMP.w #$0008
#_01D8CD: BCC .branch01D899

#_01D8CF: LDA.w $0620
#_01D8D2: BPL .branch01D8D7

#_01D8D4: LDA.w #$0008

.branch01D8D7
#_01D8D7: CLC
#_01D8D8: RTS

.branch01D8D9
#_01D8D9: LDA.w $1038,X
#_01D8DC: JSR routine01D8E1
#_01D8DF: CLC
#_01D8E0: RTS

;===================================================================================================

routine01D8E1:
#_01D8E1: AND.w #$00FF
#_01D8E4: ASL A
#_01D8E5: ASL A
#_01D8E6: ASL A
#_01D8E7: TAX
#_01D8E8: LDA.w $05BE
#_01D8EB: LSR A
#_01D8EC: STA.w $0626
#_01D8EF: TXA
#_01D8F0: CLC
#_01D8F1: ADC.w $0626
#_01D8F4: TAX
#_01D8F5: LDA.l data01DB7E,X
#_01D8F9: AND.w #$00FF
#_01D8FC: PHA
#_01D8FD: LDA.w $05BE
#_01D900: LSR A
#_01D901: BCS .branch01D909

#_01D903: PLA
#_01D904: LSR A
#_01D905: LSR A
#_01D906: LSR A
#_01D907: LSR A
#_01D908: RTS

.branch01D909
#_01D909: PLA
#_01D90A: AND.w #$000F
#_01D90D: RTS

; TODO these are all SFX (the next 3 tables)
; make 1 byte and turn them into defines
data01D90E:
#_01D90E: dw $1111,$1111,$1211,$1511
#_01D916: dw $1211,$1111,$1112,$1212
#_01D91E: dw $1212,$1514,$1511,$1112
#_01D926: dw $1211,$1211,$1212,$1111
#_01D92E: dw $1212,$1212,$1313,$1312
#_01D936: dw $1513,$1212,$1312,$1412
#_01D93E: dw $1313,$1212,$1313,$1313
#_01D946: dw $1212,$1212,$1212,$1212

data01D94E:
#_01D94E: dw $1717,$1818,$1817,$1718
#_01D956: dw $1717,$1717,$1718,$1717

data01D95E:
#_01D95E: dw $1C1C,$1C1C,$1C1C,$1C1C
#_01D966: dw $1D1D,$1D1D,$1D1D,$1D1D
#_01D96E: dw $1E1E,$1E1E,$1E1E,$1E1E
#_01D976: dw $2020,$2020,$2020,$2020
#_01D97E: dw $2020,$2020,$2020,$2020
#_01D986: dw $2020,$2020,$2020,$2020
#_01D98E: dw $2020,$2222,$2222,$2222
#_01D996: dw $2222,$2222,$2222,$2222
#_01D99E: dw $2323,$2323,$2323,$2323
#_01D9A6: dw $2323,$2323,$2323,$2323
#_01D9AE: dw $2323,$2323,$2121,$2121
#_01D9B6: dw $2121,$2121,$2121,$2121
#_01D9BE: dw $2121,$2121,$2121,$2121
#_01D9C6: dw $2121,$2121,$2121,$2121
#_01D9CE: dw $2020,$2020,$2020,$2020
#_01D9D6: dw $2020,$2020,$2020,$2020
#_01D9DE: dw $2020,$2020,$2020,$2020
#_01D9E6: dw $2020,$2020,$2020,$2020
#_01D9EE: dw $2020,$2020,$2020,$2020
#_01D9F6: dw $2020,$2020,$2020,$2020

data01D9FE:
#_01D9FE: dw $3333,$3434,$3533,$3235
#_01DA06: dw $3232,$3131,$3136,$3131

data01DAE0:
#_01DA0E: db $00,$01,$02,$03,$04,$05,$06,$07
#_01DA16: db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F
#_01DA1E: db $10,$11,$12,$13,$14,$15,$16,$17
#_01DA26: db $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
#_01DA2E: db $FF,$FF,$FF,$FF,$28,$FF,$FF,$29
#_01DA36: db $FF,$FF,$20,$21,$22,$23,$24,$25
#_01DA3E: db $26,$27,$2A,$2B,$2A,$2B,$2A,$2B
#_01DA46: db $2A,$2B,$2A,$2B,$2A,$2B,$2A,$2B
#_01DA4E: db $2A,$2B,$2A,$2B,$2A,$2B,$FF,$FF
#_01DA56: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
#_01DA5E: db $FF,$FF,$FF,$FF,$FF,$2C,$FF,$2C
#_01DA66: db $FF,$2C,$FF,$2D,$FF,$2D,$FF,$2E
#_01DA6E: db $FF,$2E,$FF,$2E,$FF,$2E,$FF,$2E
#_01DA76: db $FF,$2F,$FF,$2F,$FF,$30,$FF,$FF
#_01DA7E: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
#_01DA86: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
#_01DA8E: db $02,$02,$02,$02,$02,$02,$02,$02
#_01DA96: db $02,$02,$02,$02,$02,$02,$02,$02
#_01DA9E: db $02,$02,$02,$02,$02,$02,$02,$02
#_01DAA6: db $02,$02,$02,$02,$02,$02,$02,$02
#_01DAAE: db $02,$02,$02,$02,$02,$02,$02,$02
#_01DAB6: db $02,$02,$03,$04,$03,$04,$00,$01
#_01DABE: db $00,$01,$00,$01,$00,$01,$00,$01
#_01DAC6: db $00,$01,$00,$01,$00,$01,$00,$01
#_01DACE: db $00,$01,$00,$01,$00,$01,$00,$01
#_01DAD6: db $00,$01,$00,$01,$00,$01,$00,$01
#_01DADE: db $00,$01,$00,$01,$00,$01,$00,$01
#_01DAE6: db $00,$01,$00,$01,$FF,$FF,$FF,$FF
#_01DAEE: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
#_01DAF6: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

data01DAFE:
#_01DAFE: db $02,$02,$02,$02,$03,$03,$03,$03
#_01DB06: db $04,$04,$04,$04,$05,$05,$05,$05
#_01DB0E: db $06,$05,$07,$07,$07,$08,$08,$09
#_01DB16: db $09,$06,$0B,$06,$06,$0A,$0A,$0A
#_01DB1E: db $0A,$0A,$0A,$0F,$0F,$0F,$0F,$0F
#_01DB26: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
#_01DB2E: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
#_01DB36: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
#_01DB3E: db $09,$09,$09,$09,$09,$0A,$0A,$0B
#_01DB46: db $0B,$06,$06,$09,$09,$09,$02,$03
#_01DB4E: db $05,$06,$02,$04,$0A,$0F,$0F,$0C
#_01DB56: db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0E
#_01DB5E: db $0E,$0E,$0E,$0C,$0C,$0C,$0C,$0D
#_01DB66: db $0D,$0D,$05,$0F,$0F,$0F,$0F,$0F
#_01DB6E: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
#_01DB76: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F

data01DB7E:
#_01DB7E: db $77,$76,$77,$18,$00,$11,$56,$58
#_01DB86: db $89,$77,$98,$88,$08,$88,$68,$88
#_01DB8E: db $89,$97,$98,$88,$08,$78,$68,$98
#_01DB96: db $49,$87,$79,$68,$08,$66,$28,$88
#_01DB9E: db $84,$A2,$24,$48,$C0,$86,$46,$08
#_01DBA6: db $62,$90,$F6,$18,$A0,$46,$46,$08
#_01DBAE: db $80,$80,$68,$08,$BD,$84,$40,$08
#_01DBB6: db $84,$FB,$68,$48,$36,$82,$48,$68
#_01DBBE: db $86,$47,$D8,$68,$48,$88,$48,$68
#_01DBC6: db $86,$55,$58,$68,$18,$82,$48,$48
#_01DBCE: db $88,$44,$48,$68,$46,$98,$48,$88
#_01DBD6: db $46,$BF,$76,$48,$94,$84,$44,$28
#_01DBDE: db $62,$BA,$26,$28,$80,$42,$24,$18
#_01DBE6: db $62,$22,$B6,$28,$80,$42,$24,$18
#_01DBEE: db $60,$22,$68,$08,$60,$88,$24,$08
#_01DBF6: db $48,$84,$B8,$08,$00,$00,$64,$08
#_01DBFE: db $66,$80,$78,$08,$80,$88,$46,$08
#_01DC06: db $84,$44,$46,$38,$E0,$86,$68,$08
#_01DC0E: db $76,$77,$77,$28,$04,$77,$57,$78
#_01DC16: db $86,$66,$66,$68,$00,$64,$68,$88
#_01DC1E: db $77,$EA,$67,$88,$14,$88,$57,$88
#_01DC26: db $85,$87,$68,$68,$34,$64,$68,$88
#_01DC2E: db $84,$66,$47,$28,$20,$22,$68,$48
#_01DC36: db $86,$46,$68,$68,$6E,$46,$68,$68
#_01DC3E: db $73,$44,$46,$28,$8E,$64,$46,$28
#_01DC46: db $72,$64,$48,$68,$50,$87,$47,$28
#_01DC4E: db $E6,$86,$68,$88,$36,$88,$36,$68
#_01DC56: db $8E,$86,$68,$88,$36,$88,$68,$E8
#_01DC5E: db $84,$84,$68,$28,$00,$62,$68,$28
#_01DC66: db $82,$82,$48,$08,$00,$50,$67,$08
#_01DC6E: db $80,$40,$28,$08,$00,$50,$56,$08
#_01DC76: db $82,$00,$00,$08,$00,$00,$45,$08
#_01DC7E: db $00,$82,$28,$08,$00,$20,$00,$08
#_01DC86: db $82,$FF,$FF,$F8,$0F,$FF,$45,$28
#_01DC8E: db $FF,$81,$28,$08,$0E,$00,$FF,$F8
#_01DC96: db $80,$40,$08,$08,$0E,$00,$86,$08
#_01DC9E: db $88,$87,$78,$88,$08,$88,$67,$88
#_01DCA6: db $88,$27,$78,$88,$08,$88,$47,$88
#_01DCAE: db $88,$82,$78,$88,$08,$88,$67,$88
#_01DCB6: db $88,$87,$78,$08,$00,$88,$67,$48
#_01DCBE: db $88,$87,$28,$88,$06,$66,$67,$88
#_01DCC6: db $88,$87,$78,$28,$04,$24,$67,$86
#_01DCCE: db $88,$47,$48,$88,$08,$88,$66,$88
#_01DCD6: db $88,$66,$66,$88,$06,$66,$66,$68
#_01DCDE: db $84,$87,$74,$88,$08,$88,$24,$48
#_01DCE6: db $88,$44,$78,$88,$08,$88,$67,$88
#_01DCEE: db $88,$47,$78,$88,$08,$88,$67,$68
#_01DCF6: db $88,$84,$78,$88,$08,$88,$66,$68
#_01DCFE: db $88,$47,$44,$44,$CE,$44,$44,$48
#_01DD06: db $88,$87,$F8,$88,$08,$88,$66,$88
#_01DD0E: db $88,$F9,$48,$88,$08,$88,$66,$88
#_01DD16: db $00,$00,$00,$00,$00,$00,$00,$00

;===================================================================================================

ApplyAttackBuff:
#_01DD1E: PHA

#_01DD1F: JSR GetSomeSpecialIndicesForCasterAndTarget

#_01DD22: LDX.w $05D0

#_01DD25: LDA.w $058A,X
#_01DD28: CLC
#_01DD29: ADC.w #$0004
#_01DD2C: TAX

#_01DD2D: LDA.l AttackAndDefenseMultiplicands,X
#_01DD31: AND.w #$00FF
#_01DD34: TAX

#_01DD35: PLA

#_01DD36: SEP #$30

#_01DD38: STA.w PPUMULT16
#_01DD3B: XBA
#_01DD3C: STA.w PPUMULT16

#_01DD3F: TXA
#_01DD40: STA.w PPUMULT8

#_01DD43: NOP
#_01DD44: NOP
#_01DD45: NOP
#_01DD46: NOP
#_01DD47: NOP
#_01DD48: NOP
#_01DD49: NOP
#_01DD4A: NOP

#_01DD4B: REP #$30

#_01DD4D: LDA.w MPYL
#_01DD50: STA.w $0A54

#_01DD53: LDA.w MPYH
#_01DD56: AND.w #$00FF
#_01DD59: STA.w $0A56

#_01DD5C: LSR.w $0A56
#_01DD5F: ROR.w $0A54

#_01DD62: LSR.w $0A56
#_01DD65: ROR.w $0A54

#_01DD68: LSR.w $0A56
#_01DD6B: ROR.w $0A54

#_01DD6E: LDA.w $0A54

#_01DD71: RTS

;===================================================================================================

ApplyDefenseBuff:
#_01DD72: PHA
#_01DD73: PHY

#_01DD74: JSR GetSomeSpecialIndicesForCasterAndTarget

#_01DD77: LDX.w $05D2

#_01DD7A: LDA.w $058E,X
#_01DD7D: CLC
#_01DD7E: ADC.w #$0004
#_01DD81: TAX

#_01DD82: LDA.l AttackAndDefenseMultiplicands,X
#_01DD86: AND.w #$00FF
#_01DD89: TAX

#_01DD8A: PLA

#_01DD8B: SEP #$30

#_01DD8D: STA.w PPUMULT16
#_01DD90: XBA
#_01DD91: STA.w PPUMULT16

#_01DD94: TXA
#_01DD95: STA.w PPUMULT8

#_01DD98: NOP
#_01DD99: NOP
#_01DD9A: NOP
#_01DD9B: NOP
#_01DD9C: NOP
#_01DD9D: NOP
#_01DD9E: NOP
#_01DD9F: NOP

#_01DDA0: REP #$30

#_01DDA2: LDA.w MPYL
#_01DDA5: STA.w $0A54

#_01DDA8: LDA.w MPYH
#_01DDAB: AND.w #$00FF
#_01DDAE: STA.w $0A56

#_01DDB1: LSR.w $0A56
#_01DDB4: ROR.w $0A54

#_01DDB7: LSR.w $0A56
#_01DDBA: ROR.w $0A54

#_01DDBD: LSR.w $0A56
#_01DDC0: ROR.w $0A54

#_01DDC3: LDY.w $0A54

#_01DDC6: PLA
#_01DDC7: RTS

;===================================================================================================

AttackAndDefenseMultiplicands:
#_01DDC8: db $03 ; - 4
#_01DDC9: db $04 ; - 3
#_01DDCA: db $05 ; - 2
#_01DDCB: db $06 ; - 1
#_01DDCC: db $08 ;   0
#_01DDCD: db $0C ; + 1
#_01DDCE: db $10 ; + 2
#_01DDCF: db $12 ; + 3
#_01DDD0: db $14 ; + 4
#_01DDD1: db $16 ; + 5
#_01DDD2: db $18 ; + 6
#_01DDD3: db $1A ; + 7
#_01DDD4: db $1C ; + 8
#_01DDD5: db $1E ; + 9
#_01DDD6: db $20 ; +10

;===================================================================================================

TestIfMoveIsReflected:
#_01DDD7: LDA.w $0562
#_01DDDA: BMI .exit_a

#_01DDDC: LDA.w $05AA
#_01DDDF: CMP.w #$FFFF
#_01DDE2: BEQ .exit_a

#_01DDE4: JSR GetSomeSpecialIndicesForCasterAndTarget

#_01DDE7: LDX.w $05D2
#_01DDEA: LDA.w $059A,X
#_01DDED: BEQ .branch01DE0C

#_01DDEF: LDY.w $0518
#_01DDF2: CPY.w #$0180
#_01DDF5: BCC .branch01DE0C

#_01DDF7: LDA.w $1008,Y
#_01DDFA: AND.w #$0002
#_01DDFD: BEQ .branch01DE0C

#_01DDFF: STZ.w $0562
#_01DE02: STZ.w $05AA
#_01DE05: LDA.w #$8000
#_01DE08: STA.w $05BE

.exit_a
#_01DE0B: RTS

;---------------------------------------------------------------------------------------------------

.branch01DE0C
#_01DE0C: LDA.w $059E,X
#_01DE0F: BEQ .branch01DE5A

#_01DE11: LDY.w $0518
#_01DE14: CPY.w #$0060
#_01DE17: BCC .branch01DE5A

#_01DE19: LDA.w $1008,Y
#_01DE1C: AND.w #$0004
#_01DE1F: BEQ .branch01DE5A

.branch01DE21
#_01DE21: LDY.w $051A
#_01DE24: LDA.w $1004,Y
#_01DE27: STA.w $0A3E
#_01DE2A: LDX.w $0518
#_01DE2D: STX.w $051A
#_01DE30: CPX.w #$0600
#_01DE33: BCC .branch01DE48

#_01DE35: LDA.w $0524
#_01DE38: BEQ .branch01DE48

#_01DE3A: LDA.w #$0000
#_01DE3D: CPX.w #$0780
#_01DE40: BCC .branch01DE45

#_01DE42: LDA.w #$0002

.branch01DE45
#_01DE45: STA.w $0564

.branch01DE48
#_01DE48: BIT.w $05A8
#_01DE4B: BVS .exit_b

#_01DE4D: LDA.w #$0034

#_01DE50: CPX.w #$0600
#_01DE53: BCS .branch01DE56

#_01DE55: INC A

.branch01DE56
#_01DE56: JSR DisplayCombatMessage

.exit_b
#_01DE59: RTS

;---------------------------------------------------------------------------------------------------

.branch01DE5A
#_01DE5A: LDA.w $05A2,X
#_01DE5D: BEQ .branch01DE6A

#_01DE5F: LDY.w $0518
#_01DE62: LDA.w $1008,Y
#_01DE65: AND.w #$0001
#_01DE68: BNE .branch01DE21

.branch01DE6A
#_01DE6A: LDY.w $051A
#_01DE6D: CPY.w #$0600
#_01DE70: BCS .branch01DE87

#_01DE72: LDA.w $057C
#_01DE75: BEQ .branch01DE87

#_01DE77: LDY.w $0518
#_01DE7A: LDA.w $1008,Y
#_01DE7D: AND.w #$0004
#_01DE80: BEQ .branch01DE87

#_01DE82: STZ.w $057C
#_01DE85: BRA .branch01DE21

.branch01DE87
#_01DE87: LDA.w $05AC,X
#_01DE8A: BEQ .branch01DEE1

#_01DE8C: LDY.w $0518
#_01DE8F: LDA.w $1008,Y
#_01DE92: BIT.w #$0006
#_01DE95: BEQ .branch01DEE1

#_01DE97: BIT.w #$0004
#_01DE9A: BNE .branch01DEBC

#_01DE9C: CPY.w #$0180
#_01DE9F: BCS .branch01DEBC

#_01DEA1: LDA.w $1058,Y
#_01DEA4: AND.w #$00FF
#_01DEA7: SEC
#_01DEA8: SBC.w #$00B0
#_01DEAB: LDY.w #$0002
#_01DEAE: JSL GetUseItemStat
#_01DEB2: AND.w #$00FF
#_01DEB5: CMP.w #$0080
#_01DEB8: BCS .branch01DF2E

#_01DEBA: BRA .branch01DEC4

.branch01DEBC
#_01DEBC: CPY.w #$0060
#_01DEBF: BCC .branch01DEE1

#_01DEC1: LDA.w $1058,Y

.branch01DEC4
#_01DEC4: AND.w #$00FF
#_01DEC7: TAX
#_01DEC8: LDA.l data01DAFE,X
#_01DECC: AND.w #$00FF
#_01DECF: CMP.w #$0002
#_01DED2: BNE .branch01DEE1

.branch01DED4
#_01DED4: STZ.w $0562
#_01DED7: STZ.w $05AA
#_01DEDA: LDA.w #$8000
#_01DEDD: STA.w $05BE
#_01DEE0: RTS

.branch01DEE1
#_01DEE1: LDA.w $05B0,X
#_01DEE4: BEQ .branch01DF2E

#_01DEE6: LDY.w $0518
#_01DEE9: LDA.w $1008,Y
#_01DEEC: AND.w #$0006
#_01DEEF: BEQ .branch01DF2E

#_01DEF1: BIT.w #$0004
#_01DEF4: BNE .branch01DF16

#_01DEF6: CPY.w #$0180
#_01DEF9: BCS .branch01DF16

#_01DEFB: LDA.w $1058,Y
#_01DEFE: AND.w #$00FF
#_01DF01: SEC
#_01DF02: SBC.w #$00B0
#_01DF05: LDY.w #$0002
#_01DF08: JSL GetUseItemStat
#_01DF0C: AND.w #$00FF
#_01DF0F: CMP.w #$0080
#_01DF12: BCS .branch01DF2E

#_01DF14: BRA .branch01DF1E

.branch01DF16
#_01DF16: CPY.w #$0060
#_01DF19: BCC .branch01DF2E

#_01DF1B: LDA.w $1058,Y

.branch01DF1E
#_01DF1E: AND.w #$00FF
#_01DF21: TAX
#_01DF22: LDA.l data01DAFE,X
#_01DF26: AND.w #$00FF
#_01DF29: CMP.w #$0003
#_01DF2C: BEQ .branch01DED4

.branch01DF2E
#_01DF2E: RTS

;===================================================================================================

GetSomeSpecialIndicesForCasterAndTarget:
#_01DF2F: LDX.w #$0000

#_01DF32: LDY.w $0518
#_01DF35: CPY.w #$0600
#_01DF38: BCC .player_caster

#_01DF3A: INX
#_01DF3B: INX

.player_caster
#_01DF3C: STX.w $05D0

#_01DF3F: LDX.w #$0000

#_01DF42: LDY.w $051A
#_01DF45: CPY.w #$0600
#_01DF48: BCC .player_target

#_01DF4A: INX
#_01DF4B: INX

.player_target
#_01DF4C: STX.w $05D2

#_01DF4F: RTS

;===================================================================================================

CheckIfHappyOrPanicked:
#_01DF50: BIT.w #$0001
#_01DF53: BEQ .not_happy

#_01DF55: JSL GetRandomInt
#_01DF59: AND.w #$0001
#_01DF5C: BEQ .success

#_01DF5E: LDA.w #$0038
#_01DF61: JSR DisplayCombatMessage

.fail
#_01DF64: SEC
#_01DF65: RTS

;---------------------------------------------------------------------------------------------------

.not_happy
#_01DF66: BIT.w #$0002 ; check panic
#_01DF69: BEQ .success

#_01DF6B: JSL GetRandomInt
#_01DF6F: AND.w #$0011
#_01DF72: BNE .success

#_01DF74: LDA.w #$0010
#_01DF77: STA.w $1008,X

#_01DF7A: LDA.w #$0039
#_01DF7D: JSR DisplayCombatMessage

#_01DF80: BRA .fail

.success
#_01DF82: CLC
#_01DF83: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine01DF84:
#_01DF84: LDX.w #$0000

.next
#_01DF87: LDA.l data01DFAE,X
#_01DF8B: STA.w $0106,X

#_01DF8E: INX
#_01DF8F: INX
#_01DF90: CPX.w #$000A
#_01DF93: BCC .next

#_01DF95: PLB

#_01DF96: LDA.w #$3DCC
#_01DF99: STA.w $0102

#_01DF9C: LDA.w #$0005
#_01DF9F: STA.w $0104

#_01DFA2: LDA.w #$0001
#_01DFA5: STA.w $0100

#_01DFA8: JSL AddSelfAsVectorAndMakeSpace

#_01DFAC: PLP
#_01DFAD: RTL

data01DFAE:
#_01DFAE: dw $200F,$201C,$201C,$2019
#_01DFB6: dw $201C

;===================================================================================================

routine01DFB8:
#_01DFB8: PHP
#_01DFB9: REP #$20
#_01DFBB: LDA.w $0457
#_01DFBE: AND.w #$00FF
#_01DFC1: ASL A
#_01DFC2: ASL A
#_01DFC3: ASL A
#_01DFC4: ASL A
#_01DFC5: CLC
#_01DFC6: ADC.w #data07BD49
#_01DFC9: STA.w $00E0
#_01DFCC: LDA.w #$0007
#_01DFCF: STA.w $00E2
#_01DFD2: JSL GetRandomInt

#_01DFD6: SEP #$30
#_01DFD8: LDX.b #$00
#_01DFDA: AND.b #$0F
#_01DFDC: BEQ .branch01DFED

#_01DFDE: INC A
#_01DFDF: CMP.w $0456
#_01DFE2: BEQ .branch01DFED

#_01DFE4: BCC .branch01DFED

#_01DFE6: LDA.w $0456
#_01DFE9: CMP.b #$0F
#_01DFEB: BNE .branch01DFED

.branch01DFED
#_01DFED: STX.w $0524
#_01DFF0: STX.w $0525
#_01DFF3: JSL GetRandomInt
#_01DFF7: BIT.w $0524
#_01DFFA: BPL .branch01E000

#_01DFFC: AND.b #$06
#_01DFFE: ORA.b #$08

.branch01E000
#_01E000: AND.b #$0F
#_01E002: TAY
#_01E003: LDA.b [$E0],Y
#_01E005: STA.w $050A
#_01E008: STA.w $050A
#_01E00B: INY
#_01E00C: LDA.b [$E0],Y
#_01E00E: STA.w $050C
#_01E011: STA.w $050C
#_01E014: LDA.b #$00
#_01E016: STA.w $050B
#_01E019: STA.w $050D

#_01E01C: REP #$30
#_01E01E: LDY.w #$0000

.branch01E021
#_01E021: LDA.w $050A,Y

#_01E024: SEP #$20
#_01E026: LDX.w #$0000

.branch01E029
#_01E029: CMP.l ClassCutoffs,X
#_01E02D: BCC .branch01E035

#_01E02F: INX
#_01E030: CPX.w #$0024
#_01E033: BCC .branch01E029

.branch01E035
#_01E035: TXA
#_01E036: STA.w $0506,Y

#_01E039: REP #$20
#_01E03B: INY
#_01E03C: INY
#_01E03D: CPY.w #$0004
#_01E040: BCC .branch01E021

#_01E042: PLP
#_01E043: RTS

;===================================================================================================

ChooseNumberOfEnemyCombatants:
#_01E044: REP #$30

#_01E046: STZ.w $050E
#_01E049: STZ.w $0510

#_01E04C: LDX.w #$0000

.next_demon
#_01E04F: LDY.w #$000C
#_01E052: LDA.w $050A,X
#_01E055: JSR GetDemonStats

#_01E058: LSR A
#_01E059: LSR A
#_01E05A: LSR A
#_01E05B: LSR A

#_01E05C: AND.w #$000F
#_01E05F: CMP.w #$0008
#_01E062: BCS .negative

.positive
#_01E064: STA.w $0512

; add random number [-3,+3]
#_01E067: JSL GetRandomInt
#_01E06B: AND.w #$0007
#_01E06E: ASL A
#_01E06F: TAY

#_01E070: PHB
#_01E071: PHK
#_01E072: PLB

#_01E073: LDA.w EncounterSizeAddends,Y

#_01E076: PLB
#_01E077: CLC
#_01E078: ADC.w $0512
#_01E07B: BEQ .zero_enemies

#_01E07D: BPL .positive_enemies

.zero_enemies
#_01E07F: LDA.w #$0001

.positive_enemies
#_01E082: CMP.w #$0009
#_01E085: BCC .not_too_many_enemies

#_01E087: LDA.w #$000F

.negative
#_01E08A: SEC
#_01E08B: SBC.w #$0007

.not_too_many_enemies
#_01E08E: STA.w $050E,X

#_01E091: BIT.w $0524
#_01E094: BPL .done

#_01E096: INX
#_01E097: INX
#_01E098: CPX.w #$0004
#_01E09B: BCC .next_demon

.done
#_01E09D: RTS

;===================================================================================================

LoadDemonStats:
#_01E09E: PHP
#_01E09F: REP #$30
#_01E0A1: LDX.w #$0000
#_01E0A4: STX.w $0512
#_01E0A7: STX.w $0514
#_01E0AA: LDY.w #$0600

.branch01E0AD
#_01E0AD: STY.w $0502

; TODO still not sure what these props are
#_01E0B0: LDA.w #$8000
#_01E0B3: STA.w $1000,Y

#_01E0B6: LDA.w #$0000
#_01E0B9: STA.w $1002,Y
#_01E0BC: STA.w $1008,Y

#_01E0BF: LDA.w $050A,X
#_01E0C2: STA.w $1004,Y

#_01E0C5: LDA.w $0506,X
#_01E0C8: STA.w $1006,Y

#_01E0CB: LDY.w #$0000 ; 0 seems to mean demon level
#_01E0CE: LDA.w $050A,X

#_01E0D1: JSR GetDemonStats

#_01E0D4: LDY.w $0502
#_01E0D7: AND.w #$00FF
#_01E0DA: STA.w $100A,Y

#_01E0DD: LDY.w #$0001
#_01E0E0: LDA.w $050A,X
#_01E0E3: JSR GetDemonStats

#_01E0E6: LDY.w $0502
#_01E0E9: STA.w $102E,Y
#_01E0EC: STA.w $1030,Y

#_01E0EF: LDY.w #$0003
#_01E0F2: LDA.w $050A,X
#_01E0F5: JSR GetDemonStats

#_01E0F8: LDY.w $0502
#_01E0FB: STA.w $1032,Y
#_01E0FE: STA.w $1034,Y

;---------------------------------------------------------------------------------------------------

#_01E101: LDA.w #$0000

.loop_a
#_01E104: PHA
#_01E105: CLC
#_01E106: ADC.w #$0005
#_01E109: TAY

#_01E10A: LDA.w $050A,X
#_01E10D: JSR GetDemonStats
#_01E110: AND.w #$00FF
#_01E113: STA.w $00B4

#_01E116: PLA
#_01E117: PHA

#_01E118: ASL A
#_01E119: ADC.w $0502
#_01E11C: TAY

#_01E11D: LDA.w $00B4
#_01E120: STA.w $1010,Y

#_01E123: PLA
#_01E124: INC A
#_01E125: CMP.w #$0007
#_01E128: BCC .loop_a

#_01E12A: LDA.w #$0000

.loop_b
#_01E12D: PHA
#_01E12E: CLC
#_01E12F: ADC.w #$000C
#_01E132: TAY
#_01E133: LDA.w $050A,X
#_01E136: JSR GetDemonStats
#_01E139: AND.w #$00FF
#_01E13C: STA.w $00B4

#_01E13F: PLA
#_01E140: PHA
#_01E141: ASL A
#_01E142: ADC.w $0502
#_01E145: TAY
#_01E146: LDA.w $00B4
#_01E149: STA.w $1036,Y
#_01E14C: PLA
#_01E14D: INC A
#_01E14E: CMP.w #$000C
#_01E151: BCC .loop_b

#_01E153: LDY.w $0502
#_01E156: LDA.w $1036,Y
#_01E159: AND.w #$000F
#_01E15C: STA.w $1036,Y
#_01E15F: JSR CalculateDemonPower
#_01E162: JSR CalculateDemonAccuracy
#_01E165: JSR CalculateDemonMPower
#_01E168: JSR CalculateDemonMEffect
#_01E16B: JSR CalculateDemonDefense
#_01E16E: JSR CalculateDemonEvade

; TODO what?
; is this doing max
#_01E171: LDA.w $0502
#_01E174: CLC
#_01E175: ADC.w #$0060
#_01E178: TAY
#_01E179: INC.w $0512,X
#_01E17C: LDA.w $0512,X
#_01E17F: CMP.w $050E,X
#_01E182: BCS .branch01E187

#_01E184: JMP .branch01E0AD

.branch01E187
#_01E187: BIT.w $0524
#_01E18A: BPL .branch01E199

#_01E18C: LDY.w #$0780
#_01E18F: INX
#_01E190: INX
#_01E191: CPX.w #$0004
#_01E194: BCS .branch01E199

#_01E196: JMP .branch01E0AD

.branch01E199
#_01E199: PLP
#_01E19A: RTL

;===================================================================================================

EncounterSizeAddends:
#_01E19B: dw -3, -2, -1, 0
#_01E1A3: dw 0, 1, 2, 3

;===================================================================================================
; (STR * 3) + (STM / 4) + max(Level-20, 1)
;===================================================================================================
CalculateDemonPower:
#_01E1AB: PHP
#_01E1AC: REP #$30
#_01E1AE: LDA.w $1010,Y
#_01E1B1: ASL A
#_01E1B2: ADC.w $1010,Y
#_01E1B5: STA.w $1022,Y
#_01E1B8: LDA.w $1016,Y
#_01E1BB: LSR A
#_01E1BC: LSR A
#_01E1BD: ADC.w $1022,Y
#_01E1C0: STA.w $1022,Y
#_01E1C3: LDA.w $100A,Y
#_01E1C6: SEC
#_01E1C7: SBC.w #$0014
#_01E1CA: BCS .level_too_low

#_01E1CC: LDA.w #$0000

.level_too_low
#_01E1CF: ADC.w $1022,Y
#_01E1D2: STA.w $1022,Y
#_01E1D5: PLP
#_01E1D6: RTS

;===================================================================================================
; (STR / 4) + SPD
;===================================================================================================
CalculateDemonAccuracy:
#_01E1D7: PHP
#_01E1D8: REP #$30
#_01E1DA: LDA.w $1010,Y
#_01E1DD: LSR A
#_01E1DE: LSR A
#_01E1DF: ADC.w $1018,Y
#_01E1E2: STA.w $1024,Y
#_01E1E5: PLP
#_01E1E6: RTS

;===================================================================================================
; (MAG / 8) + INT
;===================================================================================================
CalculateDemonMPower:
#_01E1E7: PHP
#_01E1E8: REP #$30
#_01E1EA: LDA.w $1012,Y
#_01E1ED: LSR A
#_01E1EE: LSR A
#_01E1EF: LSR A
#_01E1F0: ADC.w $1014,Y
#_01E1F3: STA.w $102A,Y
#_01E1F6: PLP
#_01E1F7: RTS

;===================================================================================================
; (INT / 8) + MAG
;===================================================================================================
CalculateDemonMEffect:
#_01E1F8: PHP
#_01E1F9: REP #$30
#_01E1FB: LDA.w $1014,Y
#_01E1FE: LSR A
#_01E1FF: LSR A
#_01E200: LSR A
#_01E201: ADC.w $1012,Y
#_01E204: STA.w $102C,Y
#_01E207: PLP
#_01E208: RTS

;===================================================================================================
; (STM * 2) + (STR / 4) + max( (Level / 2) - 10, 1)
;===================================================================================================
CalculateDemonDefense:
#_01E209: PHP
#_01E20A: REP #$30
#_01E20C: LDA.w $1016,Y
#_01E20F: ASL A
#_01E210: STA.w $1026,Y
#_01E213: LDA.w $1010,Y
#_01E216: LSR A
#_01E217: LSR A
#_01E218: ADC.w $1026,Y
#_01E21B: STA.w $1026,Y
#_01E21E: LDA.w $100A,Y
#_01E221: LSR A
#_01E222: SEC
#_01E223: SBC.w #$000A
#_01E226: BCS .level_too_low

#_01E228: LDA.w #$0000

.level_too_low
#_01E22B: ADC.w $1026,Y
#_01E22E: STA.w $1026,Y
#_01E231: PLP
#_01E232: RTS

;===================================================================================================
; (MAX / 8) + SPD
;===================================================================================================
CalculateDemonEvade:
#_01E233: PHP
#_01E234: REP #$30
#_01E236: LDA.w $1012,Y
#_01E239: LSR A
#_01E23A: LSR A
#_01E23B: LSR A
#_01E23C: ADC.w $1018,Y
#_01E23F: STA.w $1028,Y
#_01E242: PLP
#_01E243: RTS

; TODO music stuff?
routine01E244:
#_01E244: PHP
#_01E245: REP #$30
#_01E247: LDA.w $0524
#_01E24A: BNE .branch01E25B

#_01E24C: LDA.w #$0000
#_01E24F: JSR routine01E277
#_01E252: LDA.w #$0000
#_01E255: JSL LoadDemonEverything
#_01E259: BRA .branch01E275

.branch01E25B
#_01E25B: LDA.w #$0000
#_01E25E: JSR routine01E277
#_01E261: LDA.w #$0000
#_01E264: JSL LoadDemonEverything
#_01E268: LDA.w #$0002
#_01E26B: JSR routine01E277
#_01E26E: LDA.w #$0002
#_01E271: JSL LoadDemonEverything

.branch01E275
#_01E275: PLP
#_01E276: RTS

;===================================================================================================

routine01E277:
#_01E277: STZ.w $0524
#_01E27A: STZ.w $05BC

#_01E27D: STA.w $0564
#_01E280: TAY

#_01E281: PHY

#_01E282: LDX.w $0506,Y

#_01E285: LDA.l .songs,X
#_01E289: AND.w #$00FF
#_01E28C: JSL Write_to_APU_transferrable

#_01E290: DEC.w $05BA

#_01E293: PLY

#_01E294: LDX.w $0506,Y

#_01E297: LDA.l data01E2B0,X
#_01E29B: AND.w #$00FF
#_01E29E: BEQ .branch01E2A9

#_01E2A0: CLC
#_01E2A1: ADC.w #$003C
#_01E2A4: JSL routine00DB3C

#_01E2A8: RTS

.branch01E2A9
#_01E2A9: LDA.w #$FFFF
#_01E2AC: STA.w $05BC

#_01E2AF: RTS

data01E2B0:
#_01E2B0: db $00,$00,$00,$00,$00,$00,$00,$00
#_01E2B8: db $00,$00,$00,$00,$07,$07,$07,$05
#_01E2C0: db $06,$03,$04,$02,$02,$01,$00,$00
#_01E2C8: db $00,$02,$04,$06,$03,$04,$02,$05
#_01E2D0: db $05,$00,$01,$00,$00

; TODO these are music tracks
.songs
#_01E2D5: db $38,$38,$38,$38,$38,$38,$38,$38
#_01E2DD: db $38,$38,$38,$39,$42,$42,$42,$3A
#_01E2E5: db $43,$3A,$43,$3B,$3B,$3F,$39,$39
#_01E2ED: db $39,$3B,$43,$43,$3A,$43,$3B,$3A
#_01E2F5: db $3A,$39,$3F,$39,$39

;===================================================================================================

LoadDemonEverything:
#_01E2FA: PHP
#_01E2FB: REP #$30

; TODO not sure what this is for exactly
#_01E2FD: STZ.w $0564
#_01E300: AND.w #$00FF
#_01E303: CMP.w #$0006
#_01E306: BEQ .branch01E319

#_01E308: TAY
#_01E309: CMP.w #$000C
#_01E30C: BCC .branch01E312

#_01E30E: CLC
#_01E30F: ADC.w #$0002

.branch01E312
#_01E312: AND.w #$000F
#_01E315: STA.w $0564
#_01E318: TYA

.branch01E319
#_01E319: ASL A
#_01E31A: BIT.w $0524
#_01E31D: BPL .branch01E323

#_01E31F: CLC
#_01E320: ADC.w #$0004

.branch01E323
#_01E323: TAX

#_01E324: LDA.l data01E5AD,X
#_01E328: STA.w $0620

#_01E32B: LDA.l data01E5AF,X

#_01E32F: BIT.w $05BC
#_01E332: BPL .branch01E338

#_01E334: SEC
#_01E335: SBC.w #$0050

.branch01E338
#_01E338: STA.w $0622
#_01E33B: STZ.w $0624

#_01E33E: SEP #$20
#_01E340: PHB
#_01E341: LDA.b #DemonStats>>16
#_01E343: PHA
#_01E344: PLB

; 28 being the first bank of demon sprites
#_01E345: LDA.b #$28
#_01E347: STA.w $0EFD

#_01E34A: REP #$20
#_01E34C: LDX.w $0564
#_01E34F: CPX.w #$0006
#_01E352: BCC .branch01E357

#_01E354: LDX.w #$0000

.branch01E357
; get demon's idea
#_01E357: LDA.w $050A,X

; multiply by 8 for data
#_01E35A: ASL A
#_01E35B: ASL A
#_01E35C: ASL A

#_01E35D: PHA

#_01E35E: TAY

; next slot?
#_01E35F: LDA.w $0564
#_01E362: CLC
#_01E363: ADC.w #$0004
#_01E366: AND.w #$0007
#_01E369: TAX

#_01E36A: LDA.w DemonLoadInfo,Y
#_01E36D: BPL .not_animated

#_01E36F: AND.w #$7FFF
#_01E372: PHA

#_01E373: PHX

#_01E374: INX
#_01E375: INX

#_01E376: PHY

#_01E377: CLC
#_01E378: ADC.w #$0202
#_01E37B: JSL routine00BC3C

#_01E37F: DEC.w $0624

#_01E382: LDA.w $0622
#_01E385: SEC
#_01E386: SBC.w #$001C
#_01E389: STA.w $0622

#_01E38C: PLY
#_01E38D: PLX
#_01E38E: PLA

;---------------------------------------------------------------------------------------------------

.not_animated
#_01E38F: JSL routine00BC3C

#_01E393: PLY
#_01E394: PHY
#_01E395: LDA.w $0564
#_01E398: LSR A
#_01E399: CLC
#_01E39A: ADC.w #$0002
#_01E39D: AND.w #$0003
#_01E3A0: ORA.w #$0008
#_01E3A3: TAX
#_01E3A4: LDA.w DemonLoadInfo+2,Y
#_01E3A7: CLC
#_01E3A8: ADC.w #$2828
#_01E3AB: JSL routine00BCDB
#_01E3AF: PLY
#_01E3B0: LDA.w $0564
#_01E3B3: AND.w #$0007
#_01E3B6: BEQ .branch01E3BB

#_01E3B8: ASL A
#_01E3B9: ASL A
#_01E3BA: DEC A

.branch01E3BB
#_01E3BB: EOR.w #$0010
#_01E3BE: PHA
#_01E3BF: ASL A
#_01E3C0: TAX
#_01E3C1: LDA.w DemonLoadInfo+4,Y
#_01E3C4: AND.w #$7FFF
#_01E3C7: CLC
#_01E3C8: ADC.w #$00B0
#_01E3CB: STA.w $0000,X
#_01E3CE: LDA.w $0620
#_01E3D1: STA.w $1A60,X
#_01E3D4: LDA.w $0622
#_01E3D7: STA.w $1AA0,X
#_01E3DA: LDA.w DemonLoadInfo+4,Y
#_01E3DD: AND.w #$8000
#_01E3E0: BEQ .branch01E3E5

#_01E3E2: LDA.w #$0024

.branch01E3E5
#_01E3E5: BIT.w $05BC
#_01E3E8: BPL .branch01E3ED

#_01E3EA: LDA.w #$0023

.branch01E3ED
#_01E3ED: STA.w $0040,X
#_01E3F0: PLA
#_01E3F1: CLC
#_01E3F2: ADC.w #$0004
#_01E3F5: ASL A
#_01E3F6: TAX
#_01E3F7: LDA.w DemonLoadInfo+6,Y
#_01E3FA: AND.w #$7FFF
#_01E3FD: BNE .branch01E402

#_01E3FF: LDA.w #$FF50

.branch01E402
#_01E402: CLC
#_01E403: ADC.w #$00B0
#_01E406: STA.w $0000,X
#_01E409: LDA.w $0620
#_01E40C: STA.w $1A60,X
#_01E40F: LDA.w $0622
#_01E412: STA.w $1AA0,X
#_01E415: LDA.w DemonLoadInfo+6,Y
#_01E418: AND.w #$8000
#_01E41B: BEQ .branch01E420

#_01E41D: LDA.w #$0024

.branch01E420
#_01E420: BIT.w $05BC
#_01E423: BPL .branch01E428

#_01E425: LDA.w #$0023

.branch01E428
#_01E428: STA.w $0040,X
#_01E42B: PLB

#_01E42C: SEP #$30
#_01E42E: LDA.w $0564
#_01E431: AND.b #$07
#_01E433: BEQ .branch01E438

#_01E435: ASL A
#_01E436: ASL A
#_01E437: DEC A

.branch01E438
#_01E438: EOR.b #$10
#_01E43A: TAY
#_01E43B: CLC
#_01E43C: ADC.b #$04
#_01E43E: TAX
#_01E43F: LDA.b #$80
#_01E441: STA.w $1A20,Y
#_01E444: LDA.w $0564
#_01E447: CLC
#_01E448: ADC.b #$02
#_01E44A: AND.b #$07
#_01E44C: ORA.b #$80
#_01E44E: STA.w $1A00,Y
#_01E451: STA.w $1A00,X
#_01E454: LDA.b #$80
#_01E456: STA.w $1A20,X
#_01E459: LDA.w $0564
#_01E45C: CMP.b #$08
#_01E45E: BCC .branch01E47E

#_01E460: LDA.b #$E0
#_01E462: STA.w $1A40,Y
#_01E465: STA.w $1A40,X
#_01E468: LDA.w $1A00,Y
#_01E46B: ORA.b #$08
#_01E46D: STA.w $1A00,Y
#_01E470: STA.w $1A00,X
#_01E473: LDA.w $1A20,Y
#_01E476: ORA.b #$40
#_01E478: STA.w $1A20,Y
#_01E47B: STA.w $1A20,X

.branch01E47E
#_01E47E: LDA.w $0564
#_01E481: LSR A
#_01E482: AND.b #$03
#_01E484: ORA.w $1A40,Y
#_01E487: STA.w $1A40,Y
#_01E48A: STA.w $1A40,X

#_01E48D: REP #$30
#_01E48F: BIT.w $05BC
#_01E492: BPL .branch01E49F

#_01E494: LDA.w #$0019
#_01E497: JSL Do19XXVectorsATimes
#_01E49B: JSL routine01E4EF

.branch01E49F
#_01E49F: BIT.w $0624
#_01E4A2: BPL .branch01E4B0

#_01E4A4: SEP #$20
#_01E4A6: LDA.b #$02
#_01E4A8: STA.w $0F80

#_01E4AB: REP #$20
#_01E4AD: JSR routine01E4B9

.branch01E4B0
#_01E4B0: STZ.w $05BC
#_01E4B3: JSL AddSelfAsVector
#_01E4B7: PLP
#_01E4B8: RTL

;===================================================================================================

routine01E4B9:
#_01E4B9: LDA.w #$0028
#_01E4BC: STA.w $0F53
#_01E4BF: LDA.w #$0040
#_01E4C2: JSL Do19XXVectorsATimes
#_01E4C6: LDA.w #$002C
#_01E4C9: STA.w $0060
#_01E4CC: STA.w $0068

#_01E4CF: SEP #$20
#_01E4D1: LDA.b #$80
#_01E4D3: STA.w $1A30
#_01E4D6: STA.w $1A34

#_01E4D9: REP #$20

.branch01E4DB
#_01E4DB: JSL AddSelfAsVector
#_01E4DF: JSL AddSelfAsVector
#_01E4E3: DEC.w $0F53
#_01E4E6: LDA.w $0F53
#_01E4E9: CMP.w #$FFF8
#_01E4EC: BNE .branch01E4DB

#_01E4EE: RTS

;===================================================================================================

routine01E4EF:
#_01E4EF: PHP
#_01E4F0: REP #$30
#_01E4F2: LDA.w $0564
#_01E4F5: ASL A
#_01E4F6: LDX.w $0524
#_01E4F9: BEQ .branch01E4FF

#_01E4FB: CLC
#_01E4FC: ADC.w #$0004

.branch01E4FF
#_01E4FF: TAX
#_01E500: LDA.l data01E5AD,X
#_01E504: STA.w $0620
#_01E507: LDA.l data01E5AF,X
#_01E50B: STA.w $0622

#_01E50E: SEP #$30
#_01E510: PHB
#_01E511: LDA.b #DemonStats>>16
#_01E513: PHA
#_01E514: PLB
#_01E515: LDA.w $0564
#_01E518: AND.b #$07
#_01E51A: BEQ .branch01E51F

#_01E51C: ASL A
#_01E51D: ASL A
#_01E51E: DEC A

.branch01E51F
#_01E51F: EOR.b #$10
#_01E521: TAY
#_01E522: CLC
#_01E523: ADC.b #$04
#_01E525: TAX
#_01E526: LDA.b #$80
#_01E528: STA.w $1A20,Y
#_01E52B: STA.w $1A20,X
#_01E52E: LDA.w $1A00,Y
#_01E531: AND.b #$F7
#_01E533: ORA.b #$80
#_01E535: STA.w $1A00,Y
#_01E538: LDA.w $1A00,X
#_01E53B: ORA.b #$80
#_01E53D: AND.b #$F7
#_01E53F: STA.w $1A00,X

#_01E542: REP #$30
#_01E544: TYA
#_01E545: ASL A
#_01E546: TAX
#_01E547: LDY.w $0564
#_01E54A: LDA.w $050A,Y
#_01E54D: ASL A
#_01E54E: ASL A
#_01E54F: ASL A
#_01E550: TAY
#_01E551: LDA.w DemonLoadInfo+4,Y
#_01E554: AND.w #$7FFF
#_01E557: CLC
#_01E558: ADC.w #$00B0
#_01E55B: STA.w $0000,X
#_01E55E: LDA.w DemonLoadInfo+4,Y
#_01E561: AND.w #$8000
#_01E564: BEQ .branch01E569

#_01E566: LDA.w #$0024

.branch01E569
#_01E569: STA.w $0040,X
#_01E56C: LDA.w $0620
#_01E56F: STA.w $1A60,X
#_01E572: LDA.w $0622
#_01E575: STA.w $1AA0,X
#_01E578: TXA
#_01E579: CLC
#_01E57A: ADC.w #$0008
#_01E57D: TAX
#_01E57E: LDA.w DemonLoadInfo+6,Y
#_01E581: AND.w #$7FFF
#_01E584: BNE .branch01E589

#_01E586: LDA.w #$FF50

.branch01E589
#_01E589: CLC
#_01E58A: ADC.w #$00B0
#_01E58D: STA.w $0000,X
#_01E590: LDA.w DemonLoadInfo+6,Y
#_01E593: AND.w #$8000
#_01E596: BEQ .branch01E59B

#_01E598: LDA.w #$0024

.branch01E59B
#_01E59B: STA.w $0040,X
#_01E59E: LDA.w $0620
#_01E5A1: STA.w $1A60,X
#_01E5A4: LDA.w $0622
#_01E5A7: STA.w $1AA0,X
#_01E5AA: PLB
#_01E5AB: PLP
#_01E5AC: RTL

data01E5AD:
#_01E5AD: dw $0000

data01E5AF:
#_01E5AF: dw $0000,$FFE0,$0000,$0020
#_01E5B7: dw $0000,$0040,$00F8,$FFA8
#_01E5BF: dw $0050,$0058,$0050,$0000
#_01E5C7: dw $0010,$0000,$0030

;===================================================================================================

routine01E5CD:
#_01E5CD: PHP

#_01E5CE: REP #$30

#_01E5D0: CMP.w #$0000
#_01E5D3: BEQ .branch01E5D9

#_01E5D5: CLC
#_01E5D6: ADC.w #$0015

.branch01E5D9
#_01E5D9: ORA.w #$0010
#_01E5DC: AND.w #$001F
#_01E5DF: TAY
#_01E5E0: CLC
#_01E5E1: ADC.w #$0004
#_01E5E4: TAX

#_01E5E5: SEP #$20

#_01E5E7: LDA.b #$80
#_01E5E9: STA.w $1A00,Y
#_01E5EC: STA.w $1A00,X

#_01E5EF: REP #$20

#_01E5F1: TYA
#_01E5F2: ASL A
#_01E5F3: TAY
#_01E5F4: TXA
#_01E5F5: ASL A
#_01E5F6: TAX

#_01E5F7: LDA.w #$0000
#_01E5FA: STA.w $0000,Y
#_01E5FD: STA.w $0000,X
#_01E600: STA.w $0040,Y
#_01E603: STA.w $0040,X

#_01E606: JSL routine01E60C
#_01E60A: PLP

#_01E60B: RTL

;===================================================================================================

routine01E60C:
#_01E60C: PHP

#_01E60D: REP #$30
#_01E60F: LDX.w #$0600
#_01E612: BIT.w $0524
#_01E615: BMI .branch01E619

#_01E617: BVC .branch01E621

.branch01E619
#_01E619: LDY.w $0564
#_01E61C: BEQ .branch01E624

#_01E61E: LDX.w #$0780

.branch01E621
#_01E621: LDY.w $0564

.branch01E624
#_01E624: LDA.w $050E,Y
#_01E627: STA.w $0600

.branch01E62A
#_01E62A: LDA.w #$0000
#_01E62D: STA.w $1000,X
#_01E630: STA.w $1008,X
#_01E633: TXA
#_01E634: CLC
#_01E635: ADC.w #$0060
#_01E638: TAX
#_01E639: DEC.w $0600
#_01E63C: BMI .branch01E640

#_01E63E: BNE .branch01E62A

.branch01E640
#_01E640: PLP
#_01E641: RTL

;===================================================================================================

routine01E642:
#_01E642: PHP
#_01E643: SEP #$20
#_01E645: LDA.b #$FF
#_01E647: STA.w $0F4F
#_01E64A: STA.w BG1VOFS
#_01E64D: STZ.w $0F50
#_01E650: STZ.w BG1VOFS

#_01E653: REP #$30
#_01E655: LDA.w $050A
#_01E658: CMP.w #$0100
#_01E65B: BCC .branch01E660

#_01E65D: JMP .branch01E76B

.branch01E660
#_01E660: LDX.w #$0000

.branch01E663
#_01E663: LDA.l UNREACH_07F98D,X
#_01E667: STA.l $7F7000,X
#_01E66B: INX
#_01E66C: INX
#_01E66D: CPX.w #$00C0
#_01E670: BCC .branch01E663

#_01E672: LDA.w #$0000
#_01E675: JSL VRAM_From_7FXXXX

#_01E679: REP #$30
#_01E67B: LDA.w #$00C0
#_01E67E: STA.w DMA0SIZEL
#_01E681: JSL AddSelfAsVector
#_01E685: LDA.w #$0000
#_01E688: TAX

.branch01E689
#_01E689: STA.l $7F6000,X
#_01E68D: INX
#_01E68E: INX
#_01E68F: CPX.w #$0600
#_01E692: BCC .branch01E689

#_01E694: STZ.w $0620
#_01E697: LDA.w #$0600
#_01E69A: STA.w $0622

.branch01E69D
#_01E69D: LDA.w #$0002
#_01E6A0: STA.w $0476
#_01E6A3: LDA.w #$000E
#_01E6A6: STA.w $0478

.branch01E6A9
#_01E6A9: LDX.w $0622
#_01E6AC: LDA.w $1000,X
#_01E6AF: BPL .branch01E6E8

#_01E6B1: LDA.w $1002,X
#_01E6B4: AND.w #$C000
#_01E6B7: BNE .branch01E6E8

#_01E6B9: LDA.w $0620
#_01E6BC: XBA
#_01E6BD: LSR A
#_01E6BE: JSR routine01E8CE
#_01E6C1: CLC
#_01E6C2: ADC.w #$6200
#_01E6C5: STA.w $0094
#_01E6C8: LDA.w #$007F
#_01E6CB: STA.w $0096
#_01E6CE: LDX.w $0622
#_01E6D1: JSR routine01E93C
#_01E6D4: STA.w $0090
#_01E6D7: LDA.w #$0007
#_01E6DA: STA.w $0092
#_01E6DD: JSR routine01E86E
#_01E6E0: DEC.w $0478
#_01E6E3: DEC.w $0478
#_01E6E6: BPL .branch01E6A9

.branch01E6E8
#_01E6E8: LDA.w $0622
#_01E6EB: CLC
#_01E6EC: ADC.w #$0060
#_01E6EF: STA.w $0622
#_01E6F2: INC.w $0620
#_01E6F5: LDA.w $0620
#_01E6F8: CMP.w $050E
#_01E6FB: BCC .branch01E69D

#_01E6FD: BIT.w $0524
#_01E700: BPL .branch01E76B

#_01E702: STZ.w $0620
#_01E705: LDA.w #$0600
#_01E708: STA.w $0622

.branch01E70B
#_01E70B: LDA.w #$0002
#_01E70E: STA.w $0476
#_01E711: LDA.w #$000E
#_01E714: STA.w $0478

.branch01E717
#_01E717: LDX.w $0622
#_01E71A: LDA.w $1000,X
#_01E71D: BPL .branch01E756

#_01E71F: LDA.w $1002,X
#_01E722: AND.w #$C000
#_01E725: BNE .branch01E756

#_01E727: LDA.w $0620
#_01E72A: XBA
#_01E72B: LSR A
#_01E72C: JSR routine01E8CE
#_01E72F: CLC
#_01E730: ADC.w #$6400
#_01E733: STA.w $0094
#_01E736: LDA.w #$007F
#_01E739: STA.w $0096
#_01E73C: LDX.w $0622
#_01E73F: JSR routine01E93C
#_01E742: STA.w $0090
#_01E745: LDA.w #$0007
#_01E748: STA.w $0092
#_01E74B: JSR routine01E86E
#_01E74E: DEC.w $0478
#_01E751: DEC.w $0478
#_01E754: BPL .branch01E717

.branch01E756
#_01E756: LDA.w $0622
#_01E759: CLC
#_01E75A: ADC.w #$0060
#_01E75D: STA.w $0622
#_01E760: INC.w $0620
#_01E763: LDA.w $0620
#_01E766: CMP.w $0510
#_01E769: BCC .branch01E70B

.branch01E76B
#_01E76B: PLP
#_01E76C: RTL

;===================================================================================================

routine01E76D:
#_01E76D: PHP
#_01E76E: REP #$30

#_01E770: LDX.w $050A
#_01E773: CPX.w #$0100
#_01E776: BCC .branch01E77B

#_01E778: JMP .branch01E86C

.branch01E77B
#_01E77B: LDA.w $051A
#_01E77E: SEC
#_01E77F: SBC.w #$0600
#_01E782: STA.w WRDIVL

#_01E785: SEP #$20
#_01E787: LDA.b #$60
#_01E789: STA.w WRDIVB
#_01E78C: NOP
#_01E78D: NOP
#_01E78E: NOP
#_01E78F: NOP
#_01E790: NOP
#_01E791: NOP
#_01E792: NOP
#_01E793: NOP

#_01E794: REP #$20

#_01E796: LDA.w RDDIVL
#_01E799: XBA
#_01E79A: LSR A
#_01E79B: JSR routine01E8CE
#_01E79E: CLC
#_01E79F: ADC.w #$6200
#_01E7A2: STA.w $0094

#_01E7A5: LDA.w #$007F
#_01E7A8: STA.w $0096
#_01E7AB: LDX.w $051A

#_01E7AE: JSR routine01E93C
#_01E7B1: STA.w $0090

#_01E7B4: LDA.w #pointers07F969>>16
#_01E7B7: STA.w $0092

#_01E7BA: LDA.w #$0002
#_01E7BD: STA.w $0476
#_01E7C0: STZ.w $0478
#_01E7C3: JSR routine01E86E
#_01E7C6: LDX.w $051A
#_01E7C9: LDA.w $1002,X
#_01E7CC: BIT.w #$C000
#_01E7CF: BEQ .branch01E81D

.branch01E7D1
#_01E7D1: LDA.w $051A
#_01E7D4: SEC
#_01E7D5: SBC.w #$0600
#_01E7D8: STA.w WRDIVL

#_01E7DB: SEP #$20
#_01E7DD: LDA.b #$60
#_01E7DF: STA.w WRDIVB
#_01E7E2: NOP
#_01E7E3: NOP
#_01E7E4: NOP
#_01E7E5: NOP
#_01E7E6: NOP
#_01E7E7: NOP
#_01E7E8: NOP
#_01E7E9: NOP

#_01E7EA: REP #$20
#_01E7EC: LDA.w RDDIVL
#_01E7EF: XBA
#_01E7F0: LSR A
#_01E7F1: JSR routine01E8CE
#_01E7F4: CLC
#_01E7F5: ADC.w #$6200
#_01E7F8: STA.w $0094

#_01E7FB: LDA.w #$007F
#_01E7FE: STA.w $0096

#_01E801: LDA.w #data07FE4D
#_01E804: STA.w $0090

#_01E807: LDA.w #data07FE4D>>16
#_01E80A: STA.w $0092

#_01E80D: JSR routine01E89E

#_01E810: INC.w $0478
#_01E813: LDA.w $0478
#_01E816: CMP.w #$0010
#_01E819: BCC .branch01E7D1

#_01E81B: PLP
#_01E81C: RTL

;---------------------------------------------------------------------------------------------------

.branch01E81D
#_01E81D: LDA.w $1000,X
#_01E820: BMI .branch01E86C

.branch01E822
#_01E822: LDA.w $051A
#_01E825: SEC
#_01E826: SBC.w #$0600
#_01E829: STA.w WRDIVL

#_01E82C: SEP #$20
#_01E82E: LDA.b #$60
#_01E830: STA.w WRDIVB
#_01E833: NOP
#_01E834: NOP
#_01E835: NOP
#_01E836: NOP
#_01E837: NOP
#_01E838: NOP
#_01E839: NOP
#_01E83A: NOP

#_01E83B: REP #$20

#_01E83D: LDA.w RDDIVL
#_01E840: XBA
#_01E841: LSR A
#_01E842: JSR routine01E8CE

#_01E845: CLC
#_01E846: ADC.w #$6200
#_01E849: STA.w $0094

#_01E84C: LDA.w #$007F
#_01E84F: STA.w $0096

#_01E852: LDA.w #data07FA4D
#_01E855: STA.w $0090
#_01E858: LDA.w #data07FA4D>>16
#_01E85B: STA.w $0092

#_01E85E: JSR routine01E86E
#_01E861: INC.w $0478
#_01E864: LDA.w $0478
#_01E867: CMP.w #$0010
#_01E86A: BCC .branch01E822

.branch01E86C
#_01E86C: PLP
#_01E86D: RTL

;===================================================================================================

routine01E86E:
#_01E86E: JSL routine06EB63

#_01E872: LDA.w $0094
#_01E875: CLC
#_01E876: ADC.w #$0040
#_01E879: STA.w $0094

#_01E87C: LDA.w $0090
#_01E87F: CLC
#_01E880: ADC.w #$0040
#_01E883: STA.w $0090

#_01E886: JSL routine06EB63

#_01E88A: LDA.w #$0004
#_01E88D: JSL VRAM_From_7FXXXX

#_01E891: REP #$30

#_01E893: LDA.w #$0600
#_01E896: STA.w DMA0SIZEL

#_01E899: JSL AddSelfAsVector

#_01E89D: RTS

;===================================================================================================

routine01E89E:
#_01E89E: JSL routine06EC4A

#_01E8A2: LDA.w $0094
#_01E8A5: CLC
#_01E8A6: ADC.w #$0040
#_01E8A9: STA.w $0094

#_01E8AC: LDA.w $0090
#_01E8AF: CLC
#_01E8B0: ADC.w #$0040
#_01E8B3: STA.w $0090

#_01E8B6: JSL routine06EC4A

#_01E8BA: LDA.w #$0004
#_01E8BD: JSL VRAM_From_7FXXXX

#_01E8C1: REP #$30

#_01E8C3: LDA.w #$0600
#_01E8C6: STA.w DMA0SIZEL

#_01E8C9: JSL AddSelfAsVector

#_01E8CD: RTS

;===================================================================================================

routine01E8CE:
#_01E8CE: LDX.w $0524
#_01E8D1: BNE .exit

#_01E8D3: PHA

#_01E8D4: LDA.w $050E
#_01E8D7: DEC A
#_01E8D8: ASL A
#_01E8D9: TAX

#_01E8DA: PLA
#_01E8DB: CLC
#_01E8DC: ADC.l data01E8E1,X

.exit
#_01E8E0: RTS

data01E8E1:
#_01E8E1: dw $01C0,$0180,$0140,$0100
#_01E8E9: dw $00C0,$0080,$0040,$0000

;---------------------------------------------------------------------------------------------------

routine01E8F1:
#_01E8F1: LDX.w #$0000

.copy_next
#_01E8F4: LDA.l UNREACH_07F98D,X
#_01E8F8: AND.w #$1800
#_01E8FB: STA.l $7F7000,X

#_01E8FF: INX
#_01E900: INX
#_01E901: CPX.w #$00C0
#_01E904: BCC .copy_next

;---------------------------------------------------------------------------------------------------

#_01E906: LDA.w #$0000
#_01E909: JSL VRAM_From_7FXXXX

#_01E90D: REP #$30

#_01E90F: LDA.w #$00C0
#_01E912: STA.w DMA0SIZEL

#_01E915: JSL AddSelfAsVector

;---------------------------------------------------------------------------------------------------

#_01E919: LDA.w #$0000
#_01E91C: TAX

.clear_next
#_01E91D: STA.l $7F6000,X
#_01E921: INX
#_01E922: INX
#_01E923: CPX.w #$0600
#_01E926: BCC .clear_next

#_01E928: LDA.w #$0004
#_01E92B: JSL VRAM_From_7FXXXX

#_01E92F: REP #$30

#_01E931: LDA.w #$0600
#_01E934: STA.w DMA0SIZEL

#_01E937: JSL AddSelfAsVector

#_01E93B: RTL

;===================================================================================================

routine01E93C:
#_01E93C: LDY.w #$0022

#_01E93F: LDA.w $1030,X
#_01E942: LSR A
#_01E943: LSR A
#_01E944: CMP.w $102E,X
#_01E947: BCS .found_hp_threshold

#_01E949: LDY.w #$0000

#_01E94C: LDA.w $1002,X

.look_for_threshold
#_01E94F: ASL A
#_01E950: BCS .found_hp_threshold

#_01E952: INY
#_01E953: INY
#_01E954: CPY.w #$0020
#_01E957: BCC .look_for_threshold

.found_hp_threshold
#_01E959: TYX

#_01E95A: LDA.l pointers07F969,X

#_01E95E: RTS

;===================================================================================================
; TODO MAGIC RELATED
;===================================================================================================
routine01E95F:
#_01E95F: PHP

#_01E960: REP #$30

; get caster
#_01E962: LDX.w $0715
#_01E965: LDA.w $0400
#_01E968: AND.w #$0040
#_01E96B: BEQ .branch01E973 ; not in battle maybe?

; set target for 
#_01E96D: LDX.w $0518
#_01E970: STX.w $0715

.branch01E973
#_01E973: LDA.w $1004,X ; save spell offset
#_01E976: STA.w $0A3E

#_01E979: LDA.w $1058,X ; save action/spell
#_01E97C: AND.w #$00FF
#_01E97F: STA.w $0A52

#_01E982: CMP.w #$0040 ; must be special spells?
#_01E985: BCS .branch01E99B

#_01E987: LDA.w $0400
#_01E98A: AND.w #$0040
#_01E98D: BNE .branch01E9AE

#_01E98F: LDA.w $0A52
#_01E992: JSL AttemptSpellCast
#_01E996: BCC .branch01E99B
#_01E998: JMP .branch01EA31

.branch01E99B
#_01E99B: LDA.w $0400
#_01E99E: AND.w #$0040
#_01E9A1: BNE .branch01E9AE

#_01E9A3: LDA.w #$0021 ; SFX 21
#_01E9A6: JSL Write_to_APU_transferrable
#_01E9AA: JSL DisplayMessageDescribingAttack

; TODO examine logic
.branch01E9AE
#_01E9AE: LDA.w $0A52
#_01E9B1: CMP.w #$0015 ; elemental spells?
#_01E9B4: BCC .cast_now

#_01E9B6: CMP.w #$001F ; effect spells?
#_01E9B9: BCC .deal_effect

#_01E9BB: CMP.w #$0040 ; some other kinda spell?
#_01E9BE: BCC .cast_now

#_01E9C0: CMP.w #$0049 ; some other other kinda spell?
#_01E9C3: BCS .cast_now

.deal_effect
#_01E9C5: JSR routine01EA59
#_01E9C8: BRA .branch01EA31

;---------------------------------------------------------------------------------------------------

.cast_now
#_01E9CA: LDY.w #$0001 ; Get damage
#_01E9CD: JSL GetSkillProperty
#_01E9D1: AND.w #$00FF
#_01E9D4: BNE .deals_damage

#_01E9D6: LDY.w $0A52
#_01E9D9: CPY.w #$0040
#_01E9DC: BCC .branch01E9E6

.deals_damage
#_01E9DE: LDY.w $0A52
#_01E9E1: JSR CastOffensiveSkill
#_01E9E4: BRA .branch01EA31

.branch01E9E6
#_01E9E6: LDA.w $0A52
#_01E9E9: SEC
#_01E9EA: SBC.w #$001F
#_01E9ED: ASL A
#_01E9EE: TAX

#_01E9EF: LDA.l SkillVectors,X
#_01E9F3: STA.w $0E40

#_01E9F6: LDA.w #.return-1
#_01E9F9: PHA

#_01E9FA: JMP ($0E40)

;---------------------------------------------------------------------------------------------------

.return
#_01E9FD: LDA.w #$FFFF
#_01EA00: STA.w $0562

#_01EA03: BCS .cast_failed

#_01EA05: LDA.w $0A52
#_01EA08: SEC
#_01EA09: SBC.w #$001F
#_01EA0C: ASL A
#_01EA0D: ASL A
#_01EA0E: TAX
#_01EA0F: LDY.w $0715
#_01EA12: CPY.w #$0600
#_01EA15: BCC .branch01EA19

#_01EA17: INX
#_01EA18: INX

.branch01EA19
#_01EA19: LDA.l CastDescriptionMessageIDs,X
#_01EA1D: CMP.w #$FFFF
#_01EA20: BEQ .branch01EA31

#_01EA22: BMI .branch01EA2A

#_01EA24: JSL DisplayActionMessage
#_01EA28: BRA .branch01EA31

.branch01EA2A
#_01EA2A: AND.w #$7FFF
#_01EA2D: JSL routine018123

.branch01EA31
#_01EA31: JSL routine00A17E

#_01EA35: PLP
#_01EA36: RTL

;===================================================================================================

.cast_failed
#_01EA37: JSR routine01FEBF

#_01EA3A: PLP
#_01EA3B: RTL

;===================================================================================================

DisplayMessageDescribingAttack:
#_01EA3C: LDA.w #$003F

#_01EA3F: LDX.w $0A52
#_01EA42: CPX.w #$0040
#_01EA45: BCC .normal_skill

#_01EA47: TXA
#_01EA48: SEC
#_01EA49: SBC.w #$0040
#_01EA4C: ASL A
#_01EA4D: TAX

#_01EA4E: LDA.l DemonSkillMessageIDs,X
#_01EA52: BMI .exit

.normal_skill
#_01EA54: JSL DisplayActionMessage

.exit
#_01EA58: RTL

;===================================================================================================

; TODO this must have to do with magic? maybe damage?
routine01EA59:
#_01EA59: LDY.w #$0001
#_01EA5C: JSL GetSkillProperty
#_01EA60: AND.w #$00FF

#_01EA63: LDY.w $0518
#_01EA66: LDX.w $1012,Y

; (Caster.INT * Spell.Damage) / Target.INT
#_01EA69: SEP #$20

#_01EA6B: STA.w PPUMULT16
#_01EA6E: XBA
#_01EA6F: STA.w PPUMULT16

#_01EA72: TXA
#_01EA73: STA.w PPUMULT8

#_01EA76: NOP
#_01EA77: NOP
#_01EA78: NOP
#_01EA79: NOP
#_01EA7A: NOP
#_01EA7B: NOP
#_01EA7C: NOP
#_01EA7D: NOP

#_01EA7E: REP #$20
#_01EA80: LDY.w $051A
#_01EA83: LDA.w $1012,Y
#_01EA86: TAY

#_01EA87: LDA.w MPYL
#_01EA8A: STA.w WRDIVL

#_01EA8D: SEP #$20

#_01EA8F: TYA
#_01EA90: STA.w WRDIVB

#_01EA93: NOP
#_01EA94: NOP
#_01EA95: NOP
#_01EA96: NOP
#_01EA97: NOP
#_01EA98: NOP
#_01EA99: NOP
#_01EA9A: NOP

#_01EA9B: REP #$20

#_01EA9D: LDA.w RDDIVL
#_01EAA0: STA.w $0562

#_01EAA3: LDA.w #$FFFF
#_01EAA6: STA.w $05AA

#_01EAA9: JSR routine01D784

#_01EAAC: LDA.w $0562
#_01EAAF: BEQ .exit

#_01EAB1: JSL GetRandomInt
#_01EAB5: AND.w #$001F
#_01EAB8: CMP.w $0562
#_01EABB: STZ.w $0562

#_01EABE: BCS .exit
#_01EAC0: JMP HandleStatusAffliction

.exit
#_01EAC3: RTS

;===================================================================================================

CastOffensiveSkill:
#_01EAC4: CMP.w #$0000
#_01EAC7: BNE .deals_damage

#_01EAC9: JMP .no_status_affliction

.deals_damage
#_01EACC: CPY.w #$0057 ; Bite
#_01EACF: BCC .not_special_move

#_01EAD1: JSR CalculateAttackDamage

#_01EAD4: LDA.w $0A52
#_01EAD7: LDY.w #$0004
#_01EADA: JSL GetSkillProperty

#_01EADE: AND.w #$FFFF
#_01EAE1: BEQ .dont_apply_status

#_01EAE3: TAY
#_01EAE4: JSL GetRandomInt
#_01EAE8: AND.w #$00FF
#_01EAEB: CMP.w #$0040
#_01EAEE: BCS .dont_apply_status

#_01EAF0: TYA
#_01EAF1: JSL TestIfTargetAlreadyHasAffliction
#_01EAF5: BCS .dont_apply_status

#_01EAF7: STA.w $05AA

.dont_apply_status
#_01EAFA: JMP .no_status_affliction

;---------------------------------------------------------------------------------------------------

.not_special_move
#_01EAFD: JSR ApplyMagicDamageBuff

; round[(Damage * Caster.MPOW) / (round(Target.DEF/8) + Target.MPOW)]
#_01EB00: LDY.w $0518
#_01EB03: LDX.w $102A,Y

#_01EB06: SEP #$20

#_01EB08: STA.w PPUMULT16
#_01EB0B: XBA
#_01EB0C: STA.w PPUMULT16

#_01EB0F: TXA
#_01EB10: STA.w PPUMULT8

#_01EB13: NOP
#_01EB14: NOP
#_01EB15: NOP
#_01EB16: NOP
#_01EB17: NOP
#_01EB18: NOP
#_01EB19: NOP
#_01EB1A: NOP

#_01EB1B: REP #$20

#_01EB1D: LDY.w $051A

#_01EB20: LDA.w $1026,Y
#_01EB23: LSR A
#_01EB24: LSR A
#_01EB25: LSR A
#_01EB26: ADC.w $102A,Y
#_01EB29: TAY

#_01EB2A: LDA.w MPYL
#_01EB2D: LDX.w #$0000
#_01EB30: JSL DivisionBig_XA_by_Y
#_01EB34: JSL RoundQuotient
#_01EB38: DEC A
#_01EB39: BPL .not_negative

#_01EB3B: LDA.w #$0000

.not_negative
#_01EB3E: STA.w $0562
#_01EB41: BEQ .no_damage

;===================================================================================================

#HandleStatusAffliction:
#_01EB43: LDA.w $0A52

#_01EB46: LDY.w #$0004
#_01EB49: JSL GetSkillProperty
#_01EB4D: AND.w #$FFFF
#_01EB50: BEQ .no_status_affliction

#_01EB52: JSL TestIfTargetAlreadyHasAffliction
#_01EB56: BCS .no_status_affliction

#_01EB58: AND.w #$0004
#_01EB5B: BEQ .no_sealing

; check if target has MP to seal
#_01EB5D: LDX.w $051A
#_01EB60: LDA.w $1034,X
#_01EB63: BEQ .no_status_affliction

.no_sealing
#_01EB65: TYA
#_01EB66: STA.w $05AA

.no_status_affliction
#_01EB69: LDX.w #$0000
#_01EB6C: LDA.w $0A52

.test_for_special_effect
#_01EB6F: CMP.l SpecialEffectSkillIDs,X
#_01EB73: BEQ .branch01EB7E

#_01EB75: INX
#_01EB76: INX
#_01EB77: CPX.w #$0014
#_01EB7A: BCC .test_for_special_effect

.no_damage
#_01EB7C: CLC
#_01EB7D: RTS

;---------------------------------------------------------------------------------------------------

.branch01EB7E
#_01EB7E: TXA

#_01EB7F: LDA.l SpecialEffectSkillVectors,X
#_01EB83: STA.w $0E40

#_01EB86: LDA.w #.return-1
#_01EB89: PHA

#_01EB8A: JMP ($0E40)

.return
#_01EB8D: LDA.w #$FFFF
#_01EB90: STA.w $0562

#_01EB93: RTS

;===================================================================================================

CalculateAttackDamage:
#_01EB94: PHA

#_01EB95: LDY.w $0715

#_01EB98: JSR CalculateAttackMultiplier

#_01EB9B: PLX

#_01EB9C: LDA.w $0562

#_01EB9F: SEP #$30

#_01EBA1: STA.w PPUMULT16

#_01EBA4: XBA
#_01EBA5: STA.w PPUMULT16

#_01EBA8: TXA
#_01EBA9: STA.w PPUMULT8

#_01EBAC: NOP
#_01EBAD: NOP
#_01EBAE: NOP
#_01EBAF: NOP
#_01EBB0: NOP
#_01EBB1: NOP
#_01EBB2: NOP
#_01EBB3: NOP

#_01EBB4: REP #$30

#_01EBB6: LDA.w MPYL
#_01EBB9: LSR A
#_01EBBA: STA.w $0562

#_01EBBD: RTS

;===================================================================================================

TestIfTargetAlreadyHasAffliction:
#_01EBBE: TAY

#_01EBBF: LDX.w #$0000

.find_the_bit
#_01EBC2: ASL A
#_01EBC3: BCS .found_the_index

#_01EBC5: INX
#_01EBC6: INX
#_01EBC7: BRA .find_the_bit

.found_the_index
#_01EBC9: LDA.l .status_bits,X

#_01EBCD: LDX.w $051A
#_01EBD0: AND.w $1002,X
#_01EBD3: BNE .fail

#_01EBD5: TYA
#_01EBD6: CLC
#_01EBD7: RTL

.fail
#_01EBD8: SEC
#_01EBD9: RTL

; data is backwards from bit # for whatever reason
.status_bits
#_01EBDA: dw $8000 ; F
#_01EBDC: dw $C000 ; E
#_01EBDE: dw $E000 ; D
#_01EBE0: dw $F000 ; C
#_01EBE2: dw $F800 ; B
#_01EBE4: dw $FC00 ; A
#_01EBE6: dw $FE00 ; 9
#_01EBE8: dw $FF00 ; 8
#_01EBEA: dw $FF80 ; 7
#_01EBEC: dw $FFC0 ; 6
#_01EBEE: dw $FFE0 ; 5
#_01EBF0: dw $FFF0 ; 4
#_01EBF2: dw $FFF8 ; 3
#_01EBF4: dw $FFFC ; 2
#_01EBF6: dw $FFFE ; 1
#_01EBF8: dw $FFFF ; 0

;===================================================================================================

SpecialEffectSkillIDs:
#_01EBFA: dw $004B
#_01EBFC: dw $004C
#_01EBFE: dw $004D
#_01EC00: dw $0051
#_01EC02: dw $0054
#_01EC04: dw $0055
#_01EC06: dw $0056
#_01EC07: dw $0073
#_01EC0A: dw $0074
#_01EC0C: dw $0075

SpecialEffectSkillVectors:
#_01EC0E: dw Cast_KissyMoves  ; 0x4B
#_01EC10: dw Cast_KissyMoves  ; 0x4C
#_01EC12: dw Cast_KissyMoves  ; 0x4D
#_01EC14: dw Cast_FogBreath   ; 0x51
#_01EC16: dw Cast_DeathTouch  ; 0x54
#_01EC18: dw Cast_WaterWall   ; 0x55
#_01EC1A: dw Cast_FireWall    ; 0x56
#_01EC1C: dw Cast_Defend      ; 0x73
#_01EC1E: dw Cast_Retreat     ; 0x74
#_01EC20: dw Cast_Rally       ; 0x75

;===================================================================================================

SkillVectors:
#_01EC22: dw Cast_Makatranda      ; 1F
#_01EC24: dw Cast_Tarunda         ; 20
#_01EC26: dw Cast_Rakunda         ; 21
#_01EC28: dw Cast_Sukunda         ; 22
#_01EC2A: dw Cast_Tarukaja        ; 23
#_01EC2C: dw Cast_Rakukaja        ; 24
#_01EC2E: dw Cast_Sukukaja        ; 25
#_01EC30: dw Cast_Makakaja        ; 26
#_01EC32: dw Cast_Tetoraja        ; 27
#_01EC34: dw Cast_Makarakan       ; 28
#_01EC36: dw Cast_Tetrakarn       ; 29
#_01EC38: dw Cast_Dia             ; 2A - also Ointment
#_01EC3A: dw Cast_Diarama         ; 2B - also Gyoutan
#_01EC3C: dw Cast_Diarahan        ; 2C
#_01EC3E: dw Cast_Media           ; 2D
#_01EC40: dw Cast_Mediarahan      ; 2E
#_01EC42: dw Cast_StatusCure      ; 2F
#_01EC44: dw Cast_Penpatora       ; 30
#_01EC46: dw Cast_StatusCure      ; 31
#_01EC48: dw Cast_StatusCure      ; 32
#_01EC4A: dw Cast_StatusCure      ; 33
#_01EC4C: dw Cast_Recarm          ; 34
#_01EC4E: dw Cast_Samarecarm      ; 35
#_01EC50: dw Cast_Recarmda        ; 36
#_01EC52: dw Cast_Makatora        ; 37
#_01EC54: dw Cast_Mapper          ; 38
#_01EC56: dw Cast_Traesto         ; 39
#_01EC58: dw Cast_Traport         ; 3A
#_01EC5A: dw Cast_Trafuri         ; 3B - also Smoke bomb
#_01EC5C: dw Cast_Estoma          ; 3C - also Fuma bell
#_01EC5E: dw Cast_Sabbatma        ; 3D
#_01EC60: dw Cast_Sabbatmaon      ; 3E
#_01EC62: dw Cast_Sabbatmaon      ; 3F

;===================================================================================================

DemonSkillMessageIDs:
#_01EC64: dw $0099 ; 40
#_01EC66: dw $009A ; 41
#_01EC68: dw $009B ; 42
#_01EC6A: dw $009C ; 43
#_01EC6C: dw $009D ; 44
#_01EC6E: dw $009E ; 45
#_01EC70: dw $009F ; 46
#_01EC72: dw $00A0 ; 47
#_01EC74: dw $00A1 ; 48
#_01EC76: dw $00A2 ; 49
#_01EC78: dw $00A3 ; 4A
#_01EC7A: dw $00A4 ; 4B
#_01EC7C: dw $00A5 ; 4C
#_01EC7E: dw $00A6 ; 4D
#_01EC80: dw $00A7 ; 4E
#_01EC82: dw $00A8 ; 4F
#_01EC84: dw $00A9 ; 50
#_01EC86: dw $00AA ; 51
#_01EC88: dw $00AB ; 52
#_01EC8A: dw $00AC ; 53
#_01EC8C: dw $00AD ; 54
#_01EC8E: dw $00AE ; 55
#_01EC90: dw $00AF ; 56
#_01EC92: dw $00B0 ; 57
#_01EC94: dw $00B1 ; 58
#_01EC96: dw $00B2 ; 59
#_01EC98: dw $00B3 ; 5A
#_01EC9A: dw $00B4 ; 5B
#_01EC9C: dw $00B5 ; 5C
#_01EC9E: dw $00B6 ; 5D
#_01ECA0: dw $00B7 ; 5E
#_01ECA2: dw $00B8 ; 5F
#_01ECA4: dw $00B9 ; 60
#_01ECA6: dw $00BA ; 61
#_01ECA8: dw $00BB ; 62
#_01ECAA: dw $00BC ; 63
#_01ECAC: dw $00BD ; 64
#_01ECAE: dw $00BE ; 65
#_01ECB0: dw $00BF ; 66
#_01ECB2: dw $00C0 ; 67
#_01ECB4: dw $00C1 ; 68
#_01ECB6: dw $00C2 ; 69
#_01ECB8: dw $00C3 ; 6A
#_01ECBA: dw $00C4 ; 6B
#_01ECBC: dw $FFFF ; 6C
#_01ECBE: dw $FFFF ; 6D
#_01ECC0: dw $FFFF ; 6E
#_01ECC2: dw $FFFF ; 6F
#_01ECC4: dw $FFFF ; 70
#_01ECC6: dw $FFFF ; 71
#_01ECC8: dw $FFFF ; 72
#_01ECCA: dw $00C5 ; 73
#_01ECCC: dw $00C6 ; 74
#_01ECCE: dw $00C7 ; 75
#_01ECD0: dw $FFFF ; 76
#_01ECD2: dw $FFFF ; 77

;===================================================================================================

; TODO
; dw <player>, <enemy>
; bit 7 = ???
CastDescriptionMessageIDs:
#_01ECD4: dw $006A, $006B ; 1F
#_01ECD8: dw $806C, $806D ; 20
#_01ECDC: dw $806E, $806F ; 21
#_01ECE0: dw $8070, $8071 ; 22
#_01ECE4: dw $8072, $8073 ; 23
#_01ECE8: dw $8074, $8075 ; 24
#_01ECEC: dw $8076, $8077 ; 25
#_01ECF0: dw $8078, $8079 ; 26
#_01ECF4: dw $FFFF, $FFFF ; 27
#_01ECF8: dw $FFFF, $FFFF ; 28
#_01ECFC: dw $FFFF, $FFFF ; 29
#_01ED00: dw $0080, $0081 ; 2A
#_01ED04: dw $0082, $0083 ; 2B
#_01ED08: dw $0084, $0085 ; 2C
#_01ED0C: dw $0086, $0087 ; 2D
#_01ED10: dw $0088, $0089 ; 2E
#_01ED14: dw $008A, $008B ; 2F
#_01ED18: dw $008C ,$008D ; 30
#_01ED1C: dw $008E, $008F ; 31
#_01ED20: dw $0090, $0091 ; 32
#_01ED24: dw $0092, $0093 ; 33
#_01ED28: dw $FFFF, $FFFF ; 34
#_01ED2C: dw $FFFF, $FFFF ; 35
#_01ED30: dw $FFFF, $FFFF ; 36
#_01ED34: dw $0096, $FFFF ; 37
#_01ED38: dw $FFFF, $FFFF ; 38
#_01ED3C: dw $FFFF, $FFFF ; 39
#_01ED40: dw $FFFF, $FFFF ; 3A
#_01ED44: dw $0097, $FFFF ; 3B
#_01ED48: dw $FFFF, $FFFF ; 3C
#_01ED4C: dw $0098, $FFFF ; 3D
#_01ED50: dw $FFFF, $FFFF ; 3E
#_01ED54: dw $FFFF, $FFFF ; 3F

;===================================================================================================

Cast_Makatranda:
#_01ED58: LDX.w $051A

#_01ED5B: LDA.w $1034,X
#_01ED5E: BEQ .target_is_not_magical

#_01ED60: LDA.w $1032,X
#_01ED63: LSR A
#_01ED64: LSR A
#_01ED65: STA.w $0A54

#_01ED68: SEC
#_01ED69: SBC.w $1032,X
#_01ED6C: EOR.w #$FFFF
#_01ED6F: INC A
#_01ED70: STA.w $1032,X

#_01ED73: LDA.w $1004,X
#_01ED76: STA.w $0A3E

#_01ED79: LDY.w $0518

#_01ED7C: LDA.w $1032,Y
#_01ED7F: CLC
#_01ED80: ADC.w $0A54
#_01ED83: CMP.w $1034,Y
#_01ED86: BCC .no_overflow

#_01ED88: LDA.w $1034,Y

.no_overflow
#_01ED8B: STA.w $1032,Y
#_01ED8E: CLC
#_01ED8F: RTS

.target_is_not_magical
#_01ED90: SEC
#_01ED91: RTS

;===================================================================================================
; TODO is this a bug?
; These status effects use unsigned comparisons instead of signed?
;===================================================================================================
Cast_Tarunda:
#_01ED92: JSR GetBuffIndexForTarget

#_01ED95: LDA.w $058A,X
#_01ED98: DEC A
#_01ED99: CMP.w #$FFFC
#_01ED9C: BCC .already_at_minimum

#_01ED9E: STA.w $058A,X

#_01EDA1: LDX.w $051A

#_01EDA4: LDA.w $1004,X
#_01EDA7: STA.w $0A3E

#_01EDAA: CLC
#_01EDAB: RTS

.already_at_minimum
#_01EDAC: SEC
#_01EDAD: RTS

;===================================================================================================

Cast_Rakunda:
#_01EDAE: JSR GetBuffIndexForTarget

#_01EDB1: LDA.w $058E,X
#_01EDB4: DEC A
#_01EDB5: CMP.w #$FFFC
#_01EDB8: BCC .already_at_minimum

#_01EDBA: STA.w $058E,X

#_01EDBD: LDX.w $051A

#_01EDC0: LDA.w $1004,X
#_01EDC3: STA.w $0A3E

#_01EDC6: CLC
#_01EDC7: RTS

.already_at_minimum
#_01EDC8: SEC
#_01EDC9: RTS

;===================================================================================================

Cast_Sukunda:
#_01EDCA: JSR GetBuffIndexForTarget

#_01EDCD: LDA.w $0592,X
#_01EDD0: DEC A
#_01EDD1: CMP.w #$FFFC
#_01EDD4: BCC .already_at_minimum

#_01EDD6: STA.w $0592,X

#_01EDD9: LDX.w $051A

#_01EDDC: LDA.w $1004,X
#_01EDDF: STA.w $0A3E

#_01EDE2: CLC
#_01EDE3: RTS

.already_at_minimum
#_01EDE4: SEC
#_01EDE5: RTS

;===================================================================================================

Cast_Tarukaja:
#_01EDE6: JSR GetBuffIndexForCaster

#_01EDE9: LDA.w $058A,X
#_01EDEC: INC A
#_01EDED: CMP.w #$0009
#_01EDF0: BCS .already_at_maximum

#_01EDF2: STA.w $058A,X

#_01EDF5: CLC
#_01EDF6: RTS

.already_at_maximum
#_01EDF7: RTS

;===================================================================================================

Cast_Rakukaja:
#_01EDF8: JSR GetBuffIndexForCaster

#_01EDFB: LDA.w $058E,X
#_01EDFE: INC A
#_01EDFF: CMP.w #$0005
#_01EE02: BCS .already_at_maximum

#_01EE04: STA.w $058E,X

#_01EE07: CLC
#_01EE08: RTS

.already_at_maximum
#_01EE09: RTS

;===================================================================================================

Cast_Sukukaja:
#_01EE0A: JSR GetBuffIndexForCaster

#_01EE0D: LDA.w $0592,X
#_01EE10: INC A
#_01EE11: CMP.w #$0009
#_01EE14: BCS .already_at_maximum

#_01EE16: STA.w $0592,X

#_01EE19: CLC
#_01EE1A: RTS

.already_at_maximum
#_01EE1B: RTS

;===================================================================================================

Cast_Makakaja:
#_01EE1C: JSR GetBuffIndexForCaster

#_01EE1F: LDA.w $0596,X
#_01EE22: INC A
#_01EE23: CMP.w #$0009
#_01EE26: BCS .already_at_maximum

#_01EE28: STA.w $0596,X

#_01EE2B: CLC
#_01EE2C: RTS

.already_at_maximum
#_01EE2D: RTS

;===================================================================================================

Cast_Tetoraja:
#_01EE2E: JSR GetBuffIndexForCaster

#_01EE31: LDA.w $059A,X
#_01EE34: BNE .already_active

#_01EE36: DEC.w $059A,X

#_01EE39: LDA.w #$007A
#_01EE3C: CPX.w #$0002
#_01EE3F: BCC .player_team

#_01EE41: INC A

.player_team
#_01EE42: JSL DisplayActionMessage

#_01EE46: CLC
#_01EE47: RTS

.already_active
#_01EE48: LDA.w #$0044
#_01EE4B: JSL DisplayActionMessage

#_01EE4F: CLC
#_01EE50: RTS

;===================================================================================================

Cast_Makarakan:
#_01EE51: JSR GetBuffIndexForCaster

#_01EE54: LDA.w $059E,X
#_01EE57: BNE .already_active

#_01EE59: DEC.w $059E,X

#_01EE5C: LDA.w #$007C
#_01EE5F: CPX.w #$0002
#_01EE62: BCC .player_team

#_01EE64: INC A

.player_team
#_01EE65: JSL DisplayActionMessage

#_01EE69: CLC
#_01EE6A: RTS

.already_active
#_01EE6B: LDA.w #$0044
#_01EE6E: JSL DisplayActionMessage

#_01EE72: CLC
#_01EE73: RTS

;===================================================================================================

Cast_Tetrakarn:
#_01EE74: JSR GetBuffIndexForCaster

#_01EE77: LDA.w $05A2,X
#_01EE7A: BNE .already_active

#_01EE7C: DEC.w $05A2,X

#_01EE7F: LDA.w #$007E
#_01EE82: CPX.w #$0002
#_01EE85: BCC .player_team

#_01EE87: INC A

.player_team
#_01EE88: JSL DisplayActionMessage

#_01EE8C: CLC
#_01EE8D: RTS

.already_active
#_01EE8E: LDA.w #$0044
#_01EE91: JSL DisplayActionMessage

#_01EE95: CLC
#_01EE96: RTS

;===================================================================================================

Cast_Dia:
#_01EE97: JSR VerifyTargetIsAlive
#_01EE9A: BCS SkillFail_01EEB2

#_01EE9C: LDA.w $1004,X
#_01EE9F: STA.w $0A3E

#_01EEA2: LDA.w $102E,X
#_01EEA5: CMP.w $1030,X
#_01EEA8: BCS SkillFail_01EEB2

#_01EEAA: LDA.w #$0000
#_01EEAD: JSR HealHPFromHealing

#_01EEB0: CLC
#_01EEB1: RTS

SkillFail_01EEB2:
#_01EEB2: RTS

;===================================================================================================

Cast_Diarama:
#_01EEB3: JSR VerifyTargetIsAlive
#_01EEB6: BCS .fail

#_01EEB8: LDA.w $1004,X
#_01EEBB: STA.w $0A3E

#_01EEBE: LDA.w $102E,X
#_01EEC1: CMP.w $1030,X
#_01EEC4: BCS .fail

#_01EEC6: LDA.w #$0002
#_01EEC9: JSR HealHPFromHealing

#_01EECC: CLC
#_01EECD: RTS

.fail
#_01EECE: RTS

;===================================================================================================

Cast_Diarahan:
#_01EECF: JSR VerifyTargetIsAlive
#_01EED2: BCS SkillFail_01EEB2 ; why?

#_01EED4: LDA.w $1004,X
#_01EED7: STA.w $0A3E

#_01EEDA: LDA.w $102E,X
#_01EEDD: CMP.w $1030,X
#_01EEE0: BCS .fail

#_01EEE2: LDA.w $1030,X
#_01EEE5: STA.w $102E,X

#_01EEE8: CLC
#_01EEE9: RTS

.fail
#_01EEEA: RTS

;===================================================================================================

Cast_Media:
#_01EEEB: STZ.w $0A56

#_01EEEE: LDX.w $0715
#_01EEF1: CPX.w #$0600
#_01EEF4: BCS .enemy_caster

#_01EEF6: LDY.w #$0000

.next_party_member
#_01EEF9: PHY

#_01EEFA: LDX.w $0700,Y
#_01EEFD: BMI .done_healing

#_01EEFF: LDA.w $1002,X
#_01EF02: AND.w #$C000
#_01EF05: BNE .skip_party_member

#_01EF07: LDA.w $102E,X
#_01EF0A: CMP.w $1030,X
#_01EF0D: BCS .skip_party_member

#_01EF0F: LDY.w $0715
#_01EF12: LDA.w #$0000
#_01EF15: JSR HealHPFromHealing

#_01EF18: INC.w $0A56

.skip_party_member
#_01EF1B: PLY

#_01EF1C: INY
#_01EF1D: INY
#_01EF1E: CPY.w #$000C
#_01EF21: BCC .next_party_member

#_01EF23: PHY

;---------------------------------------------------------------------------------------------------

.done_healing
#_01EF24: PLY

#_01EF25: LDA.w $0A56
#_01EF28: BEQ .cast_failed

#_01EF2A: CLC
#_01EF2B: RTS

.cast_failed
#_01EF2C: SEC
#_01EF2D: RTS

;---------------------------------------------------------------------------------------------------

.enemy_caster
#_01EF2E: LDX.w #$0600

.next_enemy
#_01EF31: PHX
#_01EF32: LDA.w $1000,X
#_01EF35: BPL .skip_enemy

#_01EF37: LDA.w $1002,X
#_01EF3A: AND.w #$C000
#_01EF3D: BNE .skip_enemy

#_01EF3F: LDA.w $102E,X
#_01EF42: CMP.w $1030,X
#_01EF45: BCS .skip_enemy

#_01EF47: LDY.w $0715
#_01EF4A: LDA.w #$0000
#_01EF4D: JSR HealHPFromHealing

#_01EF50: INC.w $0A56

.skip_enemy
#_01EF53: PLX

#_01EF54: TXA
#_01EF55: CLC
#_01EF56: ADC.w #$0060
#_01EF59: TAX

#_01EF5A: CPX.w #$0900
#_01EF5D: BCC .next_enemy

#_01EF5F: PHX
#_01EF60: BRA .done_healing

;===================================================================================================

Cast_Mediarahan:
#_01EF62: STZ.w $0A56

#_01EF65: LDX.w $0715
#_01EF68: CPX.w #$0600
#_01EF6B: BCS .enemy_caster

#_01EF6D: LDY.w #$0000

.next_party_member
#_01EF70: PHY

#_01EF71: LDX.w $0700,Y
#_01EF74: BMI .done_healing

#_01EF76: LDA.w $1002,X
#_01EF79: AND.w #$C000
#_01EF7C: BNE .skip_party_member

#_01EF7E: LDA.w $102E,X
#_01EF81: CMP.w $1030,X
#_01EF84: BCS .skip_party_member

#_01EF86: LDY.w $0715
#_01EF89: LDA.w #$0002
#_01EF8C: JSR HealHPFromHealing

#_01EF8F: INC.w $0A56

.skip_party_member
#_01EF92: PLY

#_01EF93: INY
#_01EF94: INY
#_01EF95: CPY.w #$000C
#_01EF98: BCC .next_party_member

;---------------------------------------------------------------------------------------------------

#_01EF9A: PHY

.done_healing
#_01EF9B: PLY
#_01EF9C: LDA.w $0A56
#_01EF9F: BEQ .branch01EFA3

#_01EFA1: CLC
#_01EFA2: RTS

.branch01EFA3
#_01EFA3: SEC
#_01EFA4: RTS

;---------------------------------------------------------------------------------------------------

.enemy_caster
#_01EFA5: LDX.w #$0600

.next_enemy
#_01EFA8: PHX

#_01EFA9: LDA.w $1000,X
#_01EFAC: BPL .skip_enemy

#_01EFAE: LDA.w $1002,X
#_01EFB1: AND.w #$C000
#_01EFB4: BNE .skip_enemy

#_01EFB6: LDA.w $102E,X
#_01EFB9: CMP.w $1030,X
#_01EFBC: BCS .skip_enemy

#_01EFBE: LDY.w $0715
#_01EFC1: LDA.w #$0002
#_01EFC4: JSR HealHPFromHealing

#_01EFC7: INC.w $0A56

.skip_enemy
#_01EFCA: PLX

#_01EFCB: TXA
#_01EFCC: CLC
#_01EFCD: ADC.w #$0060
#_01EFD0: TAX

#_01EFD1: CPX.w #$0900
#_01EFD4: BCC .next_enemy

#_01EFD6: PHX
#_01EFD7: BRA .done_healing

;===================================================================================================
; Enters with:
;   A - healing (0: weak | 2: strong)
;
; [(TargetLUK/4)+(CasterMAG/2)+(CasterINT/4)*(2 if weak, 8 if strong)]+RNG(0,7)
;===================================================================================================
HealHPFromHealing:
#_01EFD9: PHA

#_01EFDA: LDA.w $101A,X
#_01EFDD: LSR A
#_01EFDE: LSR A
#_01EFDF: STA.w $0A54

#_01EFE2: LDA.w $1014,Y
#_01EFE5: LSR A
#_01EFE6: ADC.w $0A54
#_01EFE9: STA.w $0A54

#_01EFEC: LDA.w $1012,Y
#_01EFEF: LSR A
#_01EFF0: LSR A
#_01EFF1: ADC.w $0A54
#_01EFF4: STA.w $0A54

#_01EFF7: ASL.w $0A54

#_01EFFA: PLA
#_01EFFB: BEQ .weak_heal

#_01EFFD: ASL.w $0A54
#_01F000: ASL.w $0A54

.weak_heal
#_01F003: JSL GetRandomInt
#_01F007: AND.w #$0007
#_01F00A: CLC
#_01F00B: ADC.w $0A54
#_01F00E: ADC.w $102E,X
#_01F011: CMP.w $1030,X
#_01F014: BCC .no_overflow

#_01F016: LDA.w $1030,X

.no_overflow
#_01F019: STA.w $102E,X

#_01F01C: RTS

;===================================================================================================

Cast_StatusCure:
#_01F01D: JSR VerifyTargetIsAlive
#_01F020: BCS .exit

#_01F022: LDA.w $1004,X
#_01F025: STA.w $0A3E

#_01F028: LDY.w #$0004
#_01F02B: LDA.w $0A52
#_01F02E: JSL GetSkillProperty

#_01F032: JSR HealGivenStatusAffliction

#_01F035: BCS .exit
#_01F037: RTS

.exit
#_01F038: RTS

;===================================================================================================

Cast_Penpatora:
#_01F039: STZ.w $0A56

#_01F03C: LDX.w $0715
#_01F03F: CPX.w #$0600
#_01F042: BCS .enemy_caster

#_01F044: LDY.w #$0000

.next_party_member
#_01F047: PHY

#_01F048: LDX.w $0700,Y
#_01F04B: BMI .done_penning

#_01F04D: LDA.w $1002,X
#_01F050: AND.w #$C000
#_01F053: BNE .skip_party_member

#_01F055: LDA.w #$0067
#_01F058: JSR HealGivenStatusAffliction
#_01F05B: BCS .skip_party_member

#_01F05D: INC.w $0A56

.skip_party_member
#_01F060: PLY

#_01F061: INY
#_01F062: INY
#_01F063: CPY.w #$000C
#_01F066: BCC .next_party_member

#_01F068: PHY

;---------------------------------------------------------------------------------------------------

.done_penning
#_01F069: PLY

#_01F06A: LDA.w $0A56
#_01F06D: BEQ .zero_yippee

#_01F06F: CLC
#_01F070: RTS

; Wait! This means it failed.
; Not yippee.
.zero_yippee
#_01F071: SEC
#_01F072: RTS

;---------------------------------------------------------------------------------------------------

.enemy_caster
#_01F073: LDX.w #$0600

.next_enemy
#_01F076: PHX

#_01F077: LDA.w $1000,X
#_01F07A: BPL .skip_enemy

#_01F07C: LDA.w $1002,X
#_01F07F: AND.w #$C000
#_01F082: BNE .skip_enemy

#_01F084: LDA.w #$0067
#_01F087: JSR HealGivenStatusAffliction
#_01F08A: BCS .skip_enemy

#_01F08C: INC.w $0A56

.skip_enemy
#_01F08F: PLX

#_01F090: TXA
#_01F091: CLC
#_01F092: ADC.w #$0060
#_01F095: TAX

#_01F096: CPX.w #$0900
#_01F099: BCC .next_enemy

#_01F09B: PHY

#_01F09C: BRA .done_penning

;===================================================================================================

Cast_Recarm:
#_01F09E: LDY.w $0715

#_01F0A1: LDX.w $105A,Y

#_01F0A4: LDA.w $1002,X
#_01F0A7: BIT.w #$8000
#_01F0AA: BNE .he_dead

#_01F0AC: BIT.w #$4000
#_01F0AF: BEQ .he_dead

#_01F0B1: JSL GetRandomInt
#_01F0B5: AND.w #$001F
#_01F0B8: BEQ .fail

#_01F0BA: STZ.w $1002,X

#_01F0BD: LDA.w $1030,X
#_01F0C0: LSR A
#_01F0C1: LSR A
#_01F0C2: STA.w $102E,X

#_01F0C5: LDA.w $1004,X
#_01F0C8: STA.w $0A3E

#_01F0CB: LDA.w #$0094

#_01F0CE: CPX.w #$0600
#_01F0D1: BCC .player_team

#_01F0D3: INC A

.player_team
#_01F0D4: JSL DisplayActionMessage
#_01F0D8: CLC
#_01F0D9: RTS

.fail
#_01F0DA: LDA.w #$0043
#_01F0DD: JSL DisplayActionMessage

#_01F0E1: LDY.w $0715

#_01F0E4: LDX.w $105A,Y

#_01F0E7: LDA.w #$8000
#_01F0EA: STA.w $1002,X

#_01F0ED: CLC
#_01F0EE: RTS

.he_dead
#_01F0EF: SEC
#_01F0F0: RTS

;===================================================================================================

Cast_Samarecarm:
#_01F0F1: LDY.w $0715

#_01F0F4: LDX.w $105A,Y

#_01F0F7: LDA.w $1002,X
#_01F0FA: AND.w #$C000
#_01F0FD: BEQ .he_alive

#_01F0FF: AND.w #$4000
#_01F102: BNE .he_dying

#_01F104: JSL GetRandomInt
#_01F108: AND.w #$003F
#_01F10B: BEQ .fail

.he_dying
#_01F10D: LDA.w $1002,X
#_01F110: AND.w #$3FFF
#_01F113: STA.w $1002,X

#_01F116: LDA.w $1030,X
#_01F119: STA.w $102E,X

#_01F11C: LDA.w $1004,X
#_01F11F: STA.w $0A3E

#_01F122: LDA.w #$0094

#_01F125: CPX.w #$0600
#_01F128: BCC .player_team

#_01F12A: INC A

.player_team
#_01F12B: JSL DisplayActionMessage
#_01F12F: CLC

#_01F130: RTS

.fail
#_01F131: LDA.w #$0043
#_01F134: JSL DisplayActionMessage

#_01F138: LDY.w $0715
#_01F13B: LDX.w $105A,Y
#_01F13E: JSL routine01968A

#_01F142: CLC
#_01F143: RTS

.he_alive
#_01F144: SEC
#_01F145: RTS

;===================================================================================================

Cast_Recarmda:
#_01F146: STZ.w $0A56

#_01F149: LDX.w $0715
#_01F14C: CPX.w #$0600
#_01F14F: BCC .player_caster

#_01F151: LDX.w #$0600

.next_enemy
#_01F154: LDA.w $1000,X
#_01F157: BPL .skip_enemy

#_01F159: LDA.w $1002,X
#_01F15C: AND.w #$C000
#_01F15F: BNE .skip_enemy

#_01F161: LDA.w $102E,X
#_01F164: CMP.w $1030,X
#_01F167: BCS .enemy_didnt_overflow_hp

#_01F169: LDA.w $1030,X
#_01F16C: STA.w $102E,X

#_01F16F: INC.w $0A56

.enemy_didnt_overflow_hp
#_01F172: LDA.w $1032,X
#_01F175: CMP.w $1034,X
#_01F178: BCS .skip_enemy

#_01F17A: LDA.w $1034,X
#_01F17D: STA.w $1032,X

#_01F180: INC.w $0A56

.skip_enemy
#_01F183: TXA
#_01F184: CLC
#_01F185: ADC.w #$0060
#_01F188: TAX

#_01F189: CPX.w #$0900
#_01F18C: BCC .next_enemy

#_01F18E: BRA .done_healing

;---------------------------------------------------------------------------------------------------

.player_caster
#_01F190: LDY.w #$0000

.next_party_member
#_01F193: LDX.w $0700,Y
#_01F196: BMI .done_healing

#_01F198: LDA.w $1002,X
#_01F19B: AND.w #$C000
#_01F19E: BNE .skip_party_member

#_01F1A0: CPX.w $0715
#_01F1A3: BEQ .skip_party_member

#_01F1A5: LDA.w $102E,X
#_01F1A8: CMP.w $1030,X
#_01F1AB: BCS .party_member_didnt_overflow_hp

#_01F1AD: LDA.w $1030,X
#_01F1B0: STA.w $102E,X

#_01F1B3: INC.w $0A56

.party_member_didnt_overflow_hp
#_01F1B6: LDA.w $1032,X
#_01F1B9: CMP.w $1034,X
#_01F1BC: BCS .skip_party_member

#_01F1BE: LDA.w $1034,X
#_01F1C1: STA.w $1032,X

#_01F1C4: INC.w $0A56

.skip_party_member
#_01F1C7: INY
#_01F1C8: INY
#_01F1C9: CPY.w #$000C
#_01F1CC: BCC .next_party_member

;---------------------------------------------------------------------------------------------------

.done_healing
#_01F1CE: LDA.w $0A56
#_01F1D1: BEQ .no_one_got_healed

#_01F1D3: LDA.w #$0088

#_01F1D6: LDX.w $0715
#_01F1D9: CPX.w #$0600
#_01F1DC: BCC .team_heal

#_01F1DE: INC A

.team_heal
#_01F1DF: JSL DisplayActionMessage

#_01F1E3: LDX.w $0715

#_01F1E6: LDA.w $1004,X
#_01F1E9: STA.w $0A3E

#_01F1EC: LDA.w #$4000
#_01F1EF: STA.w $1002,X

#_01F1F2: STZ.w $102E,X
#_01F1F5: STZ.w $1032,X

#_01F1F8: LDA.w #$00C8
#_01F1FB: JSL DisplayActionMessage

#_01F1FF: JSL VerifyTheHumansAreOkay

#_01F203: LDX.w $0715
#_01F206: CPX.w #$0180
#_01F209: BCC .human

#_01F20B: JSL routine019581

.human
#_01F20F: LDA.w $0400
#_01F212: AND.w #$0040
#_01F215: BNE .everyone_alive

#_01F217: JSL routine00AB74

.everyone_alive
#_01F21B: CLC
#_01F21C: RTS

.no_one_got_healed
#_01F21D: SEC
#_01F21E: RTS

;===================================================================================================

HealGivenStatusAffliction:
#_01F21F: AND.w $1002,X
#_01F222: BEQ .not_afflicted

#_01F224: EOR.w #$FFFF
#_01F227: AND.w $1002,X
#_01F22A: STA.w $1002,X

#_01F22D: CLC
#_01F22E: RTS

.not_afflicted
#_01F22F: SEC
#_01F230: RTS

;===================================================================================================

Cast_Makatora:
#_01F231: JSR VerifyTargetIsAlive
#_01F234: BCS .not_afflicted

#_01F236: LDA.w $1032,X
#_01F239: CMP.w $1034,X
#_01F23C: BCS .not_afflicted

#_01F23E: CLC
#_01F23F: ADC.w #$000A
#_01F242: CMP.w $1034,X
#_01F245: BCC .no_overflow

#_01F247: LDA.w $1034,X

.no_overflow
#_01F24A: STA.w $1032,X

#_01F24D: LDX.w $0715

#_01F250: LDA.w $1004,X
#_01F253: STA.w $0A3E

#_01F256: CLC
#_01F257: RTS

.not_afflicted
#_01F258: RTS

;===================================================================================================

Cast_Mapper:
#_01F259: SEP #$20

#_01F25B: LDA.w $0404
#_01F25E: BNE .failed_to_mapper

#_01F260: LDA.w $0714
#_01F263: BEQ .failed_to_mapper

#_01F265: LDA.w $0400
#_01F268: ORA.b #$80
#_01F26A: STA.w $0400

#_01F26D: REP #$20
#_01F26F: CLC

#_01F270: RTS

.failed_to_mapper
#_01F271: REP #$20
#_01F273: SEC

#_01F274: RTS

;===================================================================================================

Cast_Traesto:
#_01F275: SEP #$20

#_01F277: LDA.w $0404
#_01F27A: BNE .failed

#_01F27C: LDA.w $045A
#_01F27F: AND.b #$3F
#_01F281: CMP.b #$0D
#_01F283: BEQ .failed

#_01F285: CMP.b #$10
#_01F287: BEQ .failed

#_01F289: CMP.b #$14
#_01F28B: BEQ .failed

#_01F28D: CMP.b #$39
#_01F28F: BEQ .failed

#_01F291: CMP.b #$0F
#_01F293: BNE .ignore_this_flag ; TODO what flag??????????????????

#_01F295: LDA.b #$5C
#_01F297: JSL CheckGameProgressFlag
#_01F29B: BCS .failed

.ignore_this_flag
#_01F29D: LDA.b #$E6
#_01F29F: JSL CheckGameProgressFlag
#_01F2A3: BCC .failed

#_01F2A5: REP #$20

#_01F2A7: LDA.w #$FFFF
#_01F2AA: STA.w $0C4F

#_01F2AD: LDA.w #$000C
#_01F2B0: JSL ClearGameProgressFlag

#_01F2B4: LDA.w #$00FF
#_01F2B7: JSL ClearGameProgressFlag

#_01F2BB: STZ.w $05A6

#_01F2BE: REP #$20
#_01F2C0: CLC

#_01F2C1: RTS

.failed
#_01F2C2: REP #$20
#_01F2C4: SEC

#_01F2C5: RTS

;===================================================================================================

Cast_Traport:
#_01F2C6: SEP #$20

#_01F2C8: LDA.w $0404
#_01F2CB: BNE .failed

#_01F2CD: LDA.w $045A
#_01F2D0: AND.b #$3F
#_01F2D2: CMP.b #$10
#_01F2D4: BEQ .failed

#_01F2D6: CMP.b #$14
#_01F2D8: BEQ .failed

#_01F2DA: CMP.b #$39
#_01F2DC: BEQ .failed

#_01F2DE: CMP.b #$0F
#_01F2E0: BNE .ignore_this_flag ; TODO what flag??????????????????

#_01F2E2: LDA.b #$5C
#_01F2E4: JSL CheckGameProgressFlag
#_01F2E8: BCS .failed

.ignore_this_flag
#_01F2EA: LDA.b #$E6
#_01F2EC: JSL CheckGameProgressFlag
#_01F2F0: BCC .failed

#_01F2F2: LDA.w $046B
#_01F2F5: STA.w $0710

#_01F2F8: LDA.w $046A
#_01F2FB: STA.w $040D

#_01F2FE: REP #$20

#_01F300: LDA.w $046C
#_01F303: STA.w $070C

#_01F306: JSL routine009BDE

#_01F30A: SEP #$20

#_01F30C: STA.w $0711

#_01F30F: REP #$20

#_01F311: JSL UpdateUWLabel
#_01F315: JSL routine00C7AA
#_01F319: JSL routine00A840
#_01F31D: JSL UpdateDirTilemap

#_01F321: LDA.w #$000C
#_01F324: JSL ClearGameProgressFlag

#_01F328: LDA.w #$00FF
#_01F32B: JSL ClearGameProgressFlag

#_01F32F: STZ.w $05A6

#_01F332: CLC

#_01F333: RTS

.failed
#_01F334: REP #$20
#_01F336: SEC

#_01F337: RTS

;===================================================================================================

Cast_Trafuri:
#_01F338: LDA.w $052A
#_01F33B: AND.w #$0100
#_01F33E: BNE .failed

#_01F340: LDA.w $052A
#_01F343: ORA.w #$2000
#_01F346: STA.w $052A

#_01F349: LDA.w #$FFFF
#_01F34C: STA.w $0566

#_01F34F: CLC
#_01F350: RTS

.failed
#_01F351: SEC
#_01F352: RTS

;===================================================================================================

Cast_Estoma:
#_01F353: LDA.w $05A6
#_01F356: BNE .active

#_01F358: DEC.w $05A6
#_01F35B: CLC

#_01F35C: RTS

.active
#_01F35D: LDA.w #$0044
#_01F360: JSL DisplayActionMessage

#_01F364: CLC
#_01F365: RTS

;===================================================================================================

Cast_Sabbatma:
#_01F366: LDX.w $0715

#_01F369: LDA.w $105E,X
#_01F36C: TAY

#_01F36D: LDA.w $105C,X
#_01F370: PHA

#_01F371: LDA.w $105A,X
#_01F374: TAX

#_01F375: LDA.w $1004,X
#_01F378: STA.w $0A3E
#_01F37B: PLA

#_01F37C: JSL routine01943D

#_01F380: LDX.w $0715

#_01F383: STZ.w $105C,X
#_01F386: STZ.w $105E,X

#_01F389: CLC
#_01F38A: RTS

;===================================================================================================
; What?
;===================================================================================================
Cast_Sabbatmaon:
#_01F38B: SEC
#_01F38C: RTS

;===================================================================================================

Cast_KissyMoves:
#_01F38D: LDX.w $051A

#_01F390: LDA.w $1002,X
#_01F393: AND.w #$3000
#_01F396: BNE .paralyzed

#_01F398: LDA.w #$1000
#_01F39B: ORA.w $1002,X
#_01F39E: STA.w $1002,X

#_01F3A1: RTS

.paralyzed
#_01F3A2: CPX.w #$0180
#_01F3A5: BCS .exit

#_01F3A7: JSR TestIfBeadsWillProtectMe
#_01F3AA: BCC .exit

; Too low level
#_01F3AC: LDA.w $100A,X
#_01F3AF: SEC
#_01F3B0: SBC.w #$0002
#_01F3B3: BCC .exit

#_01F3B5: DEC.w $100A,X

#_01F3B8: STA.w $0A54
#_01F3BB: ASL A
#_01F3BC: CLC
#_01F3BD: ADC.w $0A54
#_01F3C0: TXY

#_01F3C1: TAX

#_01F3C2: LDA.l ExperienceTable+0,X
#_01F3C6: STA.w $100C,Y

#_01F3C9: LDA.l ExperienceTable+2,X
#_01F3CD: AND.w #$00FF
#_01F3D0: STA.w $100E,Y

#_01F3D3: LDX.w #$0000

#_01F3D6: STZ.w $0A54

.next_stat
#_01F3D9: LDA.w $1010,Y
#_01F3DC: CMP.w $0A54
#_01F3DF: BCC .skip

#_01F3E1: STA.w $0A54
#_01F3E4: STY.w $0A56

.skip
#_01F3E7: INY
#_01F3E8: INY

#_01F3E9: INX
#_01F3EA: INX
#_01F3EB: CPX.w #$000C
#_01F3EE: BCC .next_stat

#_01F3F0: LDX.w $0A56
#_01F3F3: DEC.w $1010,X

#_01F3F6: LDX.w $051A
#_01F3F9: LDA.w $1004,X
#_01F3FC: STA.w $0A3E

#_01F3FF: LDA.w #$00C8
#_01F402: JSL DisplayActionMessage

#_01F406: LDA.w #$FFFF
#_01F409: STA.w $05AA
#_01F40C: STA.w $054A

.exit
#_01F40F: RTS

;===================================================================================================

TestIfBeadsWillProtectMe:
#_01F410: LDA.w $0580
#_01F413: BNE .amida_beads

#_01F415: LDA.w $0582
#_01F418: BEQ .fail

#_01F41A: LDA.w $101C,X
#_01F41D: CMP.w #$006F
#_01F420: BCS .fail

#_01F422: STZ.w $0582

#_01F425: LDA.w #$00DC ; rosary beads

.use_item
#_01F428: STA.w $0A50

#_01F42B: LDA.w #$00E7
#_01F42E: JSL DisplayActionMessage

#_01F432: CLC
#_01F433: RTS

.amida_beads
#_01F434: LDA.w $101C,X
#_01F437: CMP.w #$0091
#_01F43A: BCC .fail

#_01F43C: STZ.w $0580

#_01F43F: LDA.w #$00DB ; amida beads
#_01F442: BRA .use_item

.fail
#_01F444: SEC
#_01F445: RTS

;===================================================================================================
; Lowers accuracy
;===================================================================================================
Cast_FogBreath:
#_01F446: JSR GetBuffIndexForTarget

#_01F449: LDA.w $0592,X
#_01F44C: DEC A
#_01F44D: CMP.w #$FFFC
#_01F450: BCC .already_at_minumum

#_01F452: STA.w $0592,X

#_01F455: LDX.w $051A

#_01F458: LDA.w $1004,X
#_01F45B: STA.w $0A3E

.already_at_minumum
#_01F45E: RTS

;===================================================================================================
; Heals for damage dealt
;===================================================================================================
Cast_DeathTouch:
#_01F45F: LDX.w $0518

#_01F462: LDA.w $102E,X
#_01F465: CLC
#_01F466: ADC.w $0562
#_01F469: CMP.w $1030,X
#_01F46C: BCC .no_overflow

#_01F46E: LDA.w $1030,X

.no_overflow
#_01F471: STA.w $102E,X

#_01F474: PLA
#_01F475: RTS

;===================================================================================================

Cast_WaterWall:
#_01F476: JSR GetBuffIndexForCaster

#_01F479: LDA.w $05AC,X
#_01F47C: BNE .already_active

#_01F47E: DEC.w $05AC,X

#_01F481: CLC
#_01F482: RTS

.already_active
#_01F483: LDA.w #$0044
#_01F486: JSL DisplayActionMessage

#_01F48A: RTS

;===================================================================================================

Cast_FireWall:
#_01F48B: JSR GetBuffIndexForCaster

#_01F48E: LDA.w $05B0,X
#_01F491: BNE .already_active

#_01F493: DEC.w $05B0,X
#_01F496: RTS

.already_active
#_01F497: LDA.w #$0044
#_01F49A: JSL DisplayActionMessage

#_01F49E: RTS

;===================================================================================================

Cast_Defend:
#_01F49F: LDX.w $0518

#_01F4A2: LDA.w $1008,X
#_01F4A5: ORA.w #$0010
#_01F4A8: STA.w $1008,X

#_01F4AB: RTS

;===================================================================================================

Cast_Retreat:
#_01F4AC: LDX.w $0518
#_01F4AF: STZ.w $1000,X

#_01F4B2: LDX.w $0564
#_01F4B5: DEC.w $0512,X
#_01F4B8: BNE .exit

#_01F4BA: LDA.w $0564
#_01F4BD: JSL routine01E5CD

#_01F4C1: LDA.w $0524
#_01F4C4: BPL .branch01F4D4

#_01F4C6: LDY.w $0564
#_01F4C9: BEQ .branch01F4CE

#_01F4CB: LDA.w #$3FFF

.branch01F4CE
#_01F4CE: AND.w #$BFFF
#_01F4D1: STA.w $0524

.branch01F4D4
#_01F4D4: LDA.w $0564
#_01F4D7: EOR.w #$0002
#_01F4DA: TAX

#_01F4DB: LDA.w $0512,X
#_01F4DE: BNE .exit

#_01F4E0: LDA.w $052A
#_01F4E3: ORA.w #$0200
#_01F4E6: STA.w $052A

#_01F4E9: LDA.w #$0000
#_01F4EC: STA.w $0512
#_01F4EF: STA.w $0514

.exit
#_01F4F2: RTS

;===================================================================================================

Cast_Rally:
#_01F4F3: JSL GetRandomInt
#_01F4F7: AND.w #$00FF
#_01F4FA: CMP.w #$0020
#_01F4FD: BCS .no_one_came

#_01F4FF: LDY.w $0564

#_01F502: LDA.w $0512,Y
#_01F505: CMP.w #$0008
#_01F508: BCS .no_one_came

#_01F50A: LDA.w $0524
#_01F50D: BEQ .call_succeeds

#_01F50F: CMP.w #$0004
#_01F512: BCS .no_one_came

.call_succeeds
#_01F514: LDA.w $0512,Y
#_01F517: INC A
#_01F518: STA.w $0512,Y

#_01F51B: CMP.w $050E,Y
#_01F51E: BCC .not_too_many

#_01F520: STA.w $050E,Y

.not_too_many
#_01F523: LDY.w $0518
#_01F526: LDA.w #$0001
#_01F529: JSL routine01F537

#_01F52D: CLC
#_01F52E: RTS

.no_one_came
#_01F52F: LDA.w #$00CB
#_01F532: JSL DisplayActionMessage

#_01F536: RTS

;===================================================================================================
; TODO call enemies into battle?
routine01F537:
#_01F537: STY.w $0518

#_01F53A: LDX.w #$0600

#_01F53D: CPY.w #$0780
#_01F540: BCC .loop

#_01F542: LDY.w $0524
#_01F545: BEQ .loop

#_01F547: LDX.w #$0780

.loop
#_01F54A: PHA

.next_enemy_a
#_01F54B: LDA.w $1000,X
#_01F54E: BPL .done_set

#_01F550: LDA.w $1002,X
#_01F553: AND.w #$C000
#_01F556: BNE .done_set

#_01F558: TXA
#_01F559: CLC
#_01F55A: ADC.w #$0060
#_01F55D: TAX

#_01F55E: BRA .next_enemy_a

;---------------------------------------------------------------------------------------------------

.done_set
#_01F560: LDY.w #$0000

.next_enemy_b
#_01F563: PHY

#_01F564: LDY.w $0518

#_01F567: LDA.w $1000,Y
#_01F56A: STA.w $1000,X

#_01F56D: INC.w $0518

#_01F570: INX

#_01F571: PLY

#_01F572: INY
#_01F573: CPY.w #$0060
#_01F576: BCC .next_enemy_b

;---------------------------------------------------------------------------------------------------

#_01F578: TXA
#_01F579: SEC
#_01F57A: SBC.w #$0060
#_01F57D: TAX

#_01F57E: LDA.w #$0000
#_01F581: STA.w $1002,X
#_01F584: STA.w $1008,X

#_01F587: LDA.w $1030,X
#_01F58A: STA.w $102E,X

#_01F58D: LDA.w $1034,X
#_01F590: STA.w $1032,X

#_01F593: PLA
#_01F594: DEC A
#_01F595: BNE .loop

#_01F597: JSL routine01E642

#_01F59B: RTL

;===================================================================================================

GetBuffIndexForCaster:
#_01F59C: LDX.w #$0000

#_01F59F: LDY.w $0715
#_01F5A2: CPY.w #$0600
#_01F5A5: BCC .player_team

#_01F5A7: INX
#_01F5A8: INX

.player_team
#_01F5A9: RTS

;===================================================================================================

GetBuffIndexForTarget:
#_01F5AA: LDX.w #$0002

#_01F5AD: LDY.w $0715
#_01F5B0: CPY.w #$0600
#_01F5B3: BCC .player_team

#_01F5B5: DEX
#_01F5B6: DEX

.player_team
#_01F5B7: RTS

;===================================================================================================

GetSkillProperty:
#_01F5B8: PHP

#_01F5B9: SEP #$20

#_01F5BB: STA.w WRMPYA
#_01F5BE: LDA.b #$06
#_01F5C0: STA.w WRMPYB

#_01F5C3: PHB

#_01F5C4: LDA.b #SkillData>>16
#_01F5C6: PHA
#_01F5C7: PLB

#_01F5C8: NOP
#_01F5C9: NOP
#_01F5CA: NOP
#_01F5CB: NOP
#_01F5CC: NOP
#_01F5CD: NOP
#_01F5CE: NOP
#_01F5CF: NOP

#_01F5D0: REP #$30

#_01F5D2: TYA
#_01F5D3: CLC
#_01F5D4: ADC.w RDMPYL
#_01F5D7: TAY

#_01F5D8: LDA.w SkillData,Y

#_01F5DB: PLB

#_01F5DC: PLP
#_01F5DD: RTL

;===================================================================================================
; TODO
;===================================================================================================
AttemptSpellCast:
#_01F5DE: CPX.w #$0600
#_01F5E1: BCS .is_enemy

#_01F5E3: LDY.w #$0003
#_01F5E6: JSL GetSkillProperty

#_01F5EA: AND.w #$00FF
#_01F5ED: SEC
#_01F5EE: SBC.w $1032,X
#_01F5F1: EOR.w #$FFFF
#_01F5F4: INC A
#_01F5F5: BPL .enough_magic

#_01F5F7: LDA.w #$0046
#_01F5FA: JSL DisplayActionMessage

#_01F5FE: LDA.w #$FFFF
#_01F601: STA.w $0562

#_01F604: SEC
#_01F605: RTL

.enough_magic
#_01F606: STA.w $1032,X

#_01F609: JSL routine00A17E

.is_enemy
#_01F60D: CLC
#_01F60E: RTL

;===================================================================================================

ApplyMagicDamageBuff:
#_01F60F: PHA

#_01F610: JSR GetSomeSpecialIndicesForCasterAndTarget

#_01F613: LDX.w $05D0

#_01F616: LDA.w $0596,X
#_01F619: CLC
#_01F61A: ADC.w #$0004
#_01F61D: TAX

#_01F61E: LDA.l .multiplicand,X
#_01F622: AND.w #$00FF
#_01F625: TAX

#_01F626: PLA

#_01F627: SEP #$30

#_01F629: STA.w PPUMULT16
#_01F62C: XBA
#_01F62D: STA.w PPUMULT16

#_01F630: TXA
#_01F631: STA.w PPUMULT8

#_01F634: NOP
#_01F635: NOP
#_01F636: NOP
#_01F637: NOP
#_01F638: NOP
#_01F639: NOP
#_01F63A: NOP
#_01F63B: NOP

#_01F63C: REP #$30

#_01F63E: LDA.w MPYL
#_01F641: STA.w $0A54

#_01F644: LDA.w MPYH
#_01F647: AND.w #$00FF
#_01F64A: STA.w $0A56

#_01F64D: LSR.w $0A56
#_01F650: ROR.w $0A54

#_01F653: LSR.w $0A56
#_01F656: ROR.w $0A54

#_01F659: LSR.w $0A56
#_01F65C: ROR.w $0A54

#_01F65F: LDA.w $0A54

#_01F662: RTS

.multiplicand
#_01F663: db $03 ; - 4
#_01F664: db $04 ; - 3
#_01F665: db $05 ; - 2
#_01F666: db $06 ; - 1
#_01F667: db $08 ;   0
#_01F668: db $0C ; + 1
#_01F669: db $10 ; + 2
#_01F66A: db $12 ; + 3
#_01F66B: db $14 ; + 4
#_01F66C: db $16 ; + 5
#_01F66D: db $18 ; + 6
#_01F66E: db $1A ; + 7
#_01F66F: db $1C ; + 8
#_01F670: db $1E ; + 9
#_01F671: db $20 ; +10

;===================================================================================================

routine01F672:
#_01F672: PHP
#_01F673: REP #$30

#_01F675: LDX.w $0715

#_01F678: LDA.w $0400
#_01F67B: AND.w #$0040
#_01F67E: BEQ .branch01F686

#_01F680: LDX.w $0518
#_01F683: STX.w $0715

.branch01F686
#_01F686: LDA.w $1004,X
#_01F689: STA.w $0A3E

#_01F68C: LDA.w $1058,X
#_01F68F: AND.w #$00FF
#_01F692: STA.w $0A50

#_01F695: SEC
#_01F696: SBC.w #$00B0
#_01F699: LDY.w #$0002
#_01F69C: JSL GetUseItemStat

#_01F6A0: PHA

#_01F6A1: LDA.w $0400
#_01F6A4: AND.w #$0040
#_01F6A7: BNE .branch01F6B0

#_01F6A9: LDA.w #$002A
#_01F6AC: JSL DisplayActionMessage

.branch01F6B0
#_01F6B0: PLA
#_01F6B1: AND.w #$00FF
#_01F6B4: STA.w $0A52

#_01F6B7: CMP.w #$00FF
#_01F6BA: BNE .branch01F6BF

#_01F6BC: JMP .branch01F744

.branch01F6BF
#_01F6BF: CMP.w #$0080
#_01F6C2: BCC .branch01F6C7

#_01F6C4: JMP .branch01F747

;---------------------------------------------------------------------------------------------------

.branch01F6C7
#_01F6C7: LDA.w $0A52
#_01F6CA: CMP.w #$0015
#_01F6CD: BCC .branch01F6E3

#_01F6CF: CMP.w #$001F
#_01F6D2: BCC .branch01F6DE

#_01F6D4: CMP.w #$0040
#_01F6D7: BCC .branch01F6E3

#_01F6D9: CMP.w #$0049
#_01F6DC: BCS .branch01F6E3

.branch01F6DE
#_01F6DE: JSR routine01EA59
#_01F6E1: BRA .branch01F740

.branch01F6E3
#_01F6E3: LDY.w #$0001
#_01F6E6: JSL GetSkillProperty
#_01F6EA: AND.w #$00FF
#_01F6ED: BNE .branch01F6F7

#_01F6EF: LDY.w $0A52
#_01F6F2: CPY.w #$0040
#_01F6F5: BCC .branch01F6FF

.branch01F6F7
#_01F6F7: LDY.w $0A52
#_01F6FA: JSR CastOffensiveSkill
#_01F6FD: BRA .branch01F740

.branch01F6FF
#_01F6FF: LDA.w $0A52
#_01F702: SEC
#_01F703: SBC.w #$001F
#_01F706: ASL A
#_01F707: TAX

#_01F708: LDA.l SkillVectors,X
#_01F70C: STA.w $0E40

#_01F70F: LDA.w #.return_a-1
#_01F712: PHA

#_01F713: JMP ($0E40)

;---------------------------------------------------------------------------------------------------

.return_a
#_01F716: LDA.w #$FFFF
#_01F719: STA.w $0562

#_01F71C: BCS .branch01F78B

#_01F71E: LDA.w $0A52
#_01F721: SEC
#_01F722: SBC.w #$001F
#_01F725: ASL A
#_01F726: ASL A
#_01F727: TAX

#_01F728: LDA.l CastDescriptionMessageIDs,X
#_01F72C: CMP.w #$FFFF
#_01F72F: BEQ .branch01F740

#_01F731: BMI .branch01F739

#_01F733: JSL DisplayActionMessage

#_01F737: BRA .branch01F740

.branch01F739
#_01F739: AND.w #$7FFF
#_01F73C: JSL routine018123

.branch01F740
#_01F740: JSL routine00A17E

.branch01F744
#_01F744: PLP
#_01F745: CLC
#_01F746: RTL

;---------------------------------------------------------------------------------------------------

.branch01F747
#_01F747: SEC
#_01F748: SBC.w #$0080
#_01F74B: ASL A
#_01F74C: TAX

#_01F74D: LDA.l MoreItemUseVectors,X
#_01F751: STA.w $0E40

#_01F754: LDA.w #.return_b-1
#_01F757: PHA

#_01F758: JMP ($0E40)

;---------------------------------------------------------------------------------------------------

.return_b
#_01F75B: LDA.w #$FFFF
#_01F75E: STA.w $0562

#_01F761: BCS .branch01F78B

#_01F763: LDA.w $0A52
#_01F766: SEC
#_01F767: SBC.w #$0080
#_01F76A: ASL A
#_01F76B: TAX

#_01F76C: LDA.l data01F791,X
#_01F770: CMP.w #$FFFF
#_01F773: BEQ .branch01F784

#_01F775: BMI .branch01F77D

#_01F777: JSL DisplayActionMessage
#_01F77B: BRA .branch01F784

.branch01F77D
#_01F77D: AND.w #$7FFF
#_01F780: JSL routine018123

.branch01F784
#_01F784: JSL routine00A17E

#_01F788: PLP
#_01F789: CLC
#_01F78A: RTL

.branch01F78B
#_01F78B: JSR routine01FEBF

#_01F78E: PLP
#_01F78F: CLC
#_01F790: RTL

;---------------------------------------------------------------------------------------------------

data01F791:
#_01F791: dw $00CE,$00CF,$00D0,$00D1
#_01F799: dw $00D2,$FFFF,$FFFF,$00D5
#_01F7A1: dw $00D6,$00D7,$00D8,$00D9
#_01F7A9: dw $00DA,$00DB,$00DC,$00DD
#_01F7B1: dw $FFFF,$FFFF,$FFFF,$FFFF
#_01F7B9: dw $FFFF,$FFFF,$FFFF,$80E5
#_01F7C1: dw $FFFF,$00E6

;===================================================================================================

MoreItemUseVectors:
#_01F7C5: dw UseItem_MagStone
#_01F7C7: dw UseItem_MuscleDrink
#_01F7C9: dw UseItem_Orb
#_01F7CB: dw UseItem_Hiranya
#_01F7CD: dw UseItem_Soma
#_01F7CF: dw UseItem_GoldPill
#_01F7D1: dw UseItem_SoulIncense
#_01F7D3: dw UseItem_Bottle
#_01F7D5: dw UseItem_SkillIncense
#_01F7D7: dw UseItem_SkillIncense
#_01F7D9: dw UseItem_SkillIncense
#_01F7DB: dw UseItem_SkillIncense
#_01F7DD: dw UseItem_SkillIncense
#_01F7DF: dw UseItem_SkillIncense
#_01F7E1: dw UseItem_AngelHair
#_01F7E3: dw UseItem_AshuraHand
#_01F7E5: dw UseItem_Pentagram
#_01F7E7: dw UseItem_Nyorai
#_01F7E9: dw UseItem_AmidaBeads
#_01F7EB: dw UseItem_Rosary
#_01F7ED: dw UseItem_Amulet
#_01F7EF: dw UseItem_Talisman
#_01F7F1: dw UseItem_CoreShield
#_01F7F3: dw UseItem_GushingJar
#_01F7F5: dw UseItem_FortuneSlips
#_01F7F7: dw UseItem_Indulgence

;===================================================================================================

UseItem_MagStone:
#_01F7F9: JSR VerifyTargetIsAlive
#_01F7FC: BCS .branch01F81C

#_01F7FE: LDA.w $102E,X
#_01F801: CMP.w $1030,X
#_01F804: BCS .branch01F81C

#_01F806: LDA.w $1030,X
#_01F809: LSR A
#_01F80A: LSR A
#_01F80B: CLC
#_01F80C: ADC.w $102E,X
#_01F80F: CMP.w $1030,X
#_01F812: BCC .branch01F817

#_01F814: LDA.w $1030,X

.branch01F817
#_01F817: STA.w $102E,X
#_01F81A: CLC
#_01F81B: RTS

.branch01F81C
#_01F81C: SEC
#_01F81D: RTS

;===================================================================================================

UseItem_MuscleDrink:
#_01F81E: JSR VerifyTargetIsAlive
#_01F821: BCS .branch01F863

#_01F823: JSL GetRandomInt
#_01F827: AND.w #$0007
#_01F82A: INC A
#_01F82B: ASL A
#_01F82C: CLC
#_01F82D: ADC.w $102E,X
#_01F830: STA.w $0A54
#_01F833: LDA.w $100A,X
#_01F836: LSR A
#_01F837: ADC.w $0A54
#_01F83A: STA.w $0A54
#_01F83D: CMP.w #$03E7
#_01F840: BCS .branch01F84B

#_01F842: LDA.w $1030,X
#_01F845: ASL A
#_01F846: CMP.w $0A54
#_01F849: BCS .branch01F85B

.branch01F84B
#_01F84B: LDA.w $1030,X
#_01F84E: LSR A
#_01F84F: STA.w $0A54
#_01F852: LDA.w $1002,X
#_01F855: ORA.w #$0800
#_01F858: STA.w $1002,X

.branch01F85B
#_01F85B: LDA.w $0A54
#_01F85E: STA.w $102E,X
#_01F861: CLC
#_01F862: RTS

.branch01F863
#_01F863: SEC
#_01F864: RTS

;===================================================================================================

UseItem_Orb:
#_01F865: JSR VerifyTargetIsAlive
#_01F868: BCS .branch01F87A

#_01F86A: LDA.w $102E,X
#_01F86D: CMP.w $1030,X
#_01F870: BCS .branch01F87A

#_01F872: LDA.w $1030,X
#_01F875: STA.w $102E,X
#_01F878: CLC
#_01F879: RTS

.branch01F87A
#_01F87A: SEC
#_01F87B: RTS

;===================================================================================================

UseItem_Hiranya:
#_01F87C: JSR VerifyTargetIsAlive
#_01F87F: BCS .branch01F8D8

#_01F881: LDA.w $102E,X
#_01F884: CMP.w $1030,X
#_01F887: BCS .branch01F8D0

#_01F889: LDA.w $1030,X
#_01F88C: LSR A
#_01F88D: LSR A
#_01F88E: LSR A
#_01F88F: ADC.w #$0008
#_01F892: ADC.w $102E,X
#_01F895: CMP.w $1030,X
#_01F898: BCC .branch01F89D

#_01F89A: LDA.w $1030,X

.branch01F89D
#_01F89D: STA.w $102E,X
#_01F8A0: LDA.w $1032,X
#_01F8A3: CMP.w $1034,X
#_01F8A6: BCS .branch01F8CE

.branch01F8a8
#_01F8A8: JSL GetRandomInt
#_01F8AC: AND.w #$0007
#_01F8AF: INC A
#_01F8B0: ASL A
#_01F8B1: CLC
#_01F8B2: ADC.w $1032,X
#_01F8B5: STA.w $0A54
#_01F8B8: LDA.w $100A,X
#_01F8BB: LSR A
#_01F8BC: LSR A
#_01F8BD: ADC.w $0A54
#_01F8C0: STA.w $0A54
#_01F8C3: CMP.w $1034,X
#_01F8C6: BCC .branch01F8CB

#_01F8C8: LDA.w $1034,X

.branch01F8CB
#_01F8CB: STA.w $1032,X

.branch01F8CE
#_01F8CE: CLC
#_01F8CF: RTS

.branch01F8D0
#_01F8D0: LDA.w $1032,X
#_01F8D3: CMP.w $1034,X
#_01F8D6: BCC .branch01F8a8

.branch01F8D8
#_01F8D8: SEC
#_01F8D9: RTS

;===================================================================================================

UseItem_Soma:
#_01F8DA: JSR VerifyTargetIsAlive
#_01F8DD: BCS .branch01F916

#_01F8DF: LDY.w #$0000
#_01F8E2: LDA.w $102E,X
#_01F8E5: CMP.w $1030,X
#_01F8E8: BCS .branch01F8F1

#_01F8EA: INY
#_01F8EB: LDA.w $1030,X
#_01F8EE: STA.w $102E,X

.branch01F8F1
#_01F8F1: LDA.w $1032,X
#_01F8F4: CMP.w $1034,X
#_01F8F7: BCS .branch01F900

#_01F8F9: LDA.w $1034,X
#_01F8FC: STA.w $1032,X
#_01F8FF: INY

.branch01F900
#_01F900: LDA.w $1002,X
#_01F903: BIT.w #$FEFF
#_01F906: BEQ .branch01F90F

#_01F908: AND.w #$C700
#_01F90B: STA.w $1002,X
#_01F90E: INY

.branch01F90F
#_01F90F: CPY.w #$0000
#_01F912: BEQ .branch01F916

#_01F914: CLC
#_01F915: RTS

.branch01F916
#_01F916: SEC
#_01F917: RTS

;===================================================================================================

UseItem_GoldPill:
#_01F918: LDY.w $0715
#_01F91B: LDX.w $105A,Y
#_01F91E: LDA.w $1002,X
#_01F921: AND.w #$4000
#_01F924: BEQ .branch01F95F

#_01F926: JSL GetRandomInt
#_01F92A: AND.w #$00FF
#_01F92D: CMP.w #$0003
#_01F930: BCC .branch01F950

#_01F932: STZ.w $1002,X
#_01F935: LDA.w $1030,X
#_01F938: LSR A
#_01F939: LSR A
#_01F93A: LSR A
#_01F93B: BNE .branch01F93E

#_01F93D: INC A

.branch01F93E
#_01F93E: STA.w $102E,X
#_01F941: LDA.w $1004,X
#_01F944: STA.w $0A3E
#_01F947: LDA.w #$00D3
#_01F94A: JSL DisplayActionMessage
#_01F94E: CLC
#_01F94F: RTS

.branch01F950
#_01F950: LDA.w #$0043
#_01F953: JSL DisplayActionMessage
#_01F957: LDA.w #$8000
#_01F95A: STA.w $1002,X
#_01F95D: CLC
#_01F95E: RTS

.branch01F95F
#_01F95F: SEC
#_01F960: RTS

;===================================================================================================

UseItem_SoulIncense:
#_01F961: LDY.w $0715
#_01F964: LDX.w $105A,Y
#_01F967: LDA.w $1002,X
#_01F96A: AND.w #$C000
#_01F96D: BEQ .branch01F9BB

#_01F96F: JSL GetRandomInt
#_01F973: AND.w #$00FF
#_01F976: CMP.w #$0001
#_01F979: BCC .branch01F993

#_01F97B: STZ.w $1002,X

#_01F97E: LDA.w $1030,X
#_01F981: STA.w $102E,X

#_01F984: LDA.w $1004,X
#_01F987: STA.w $0A3E

#_01F98A: LDA.w #$00D4
#_01F98D: JSL DisplayActionMessage

#_01F991: CLC
#_01F992: RTS

;---------------------------------------------------------------------------------------------------

.branch01F993
#_01F993: LDA.w #$0043
#_01F996: JSL DisplayActionMessage
#_01F99A: LDY.w $0715
#_01F99D: LDX.w $105A,Y
#_01F9A0: LDA.w $1002,X
#_01F9A3: AND.w #$8000
#_01F9A6: BNE .branch01F9B0

#_01F9A8: LDA.w #$8000
#_01F9AB: STA.w $1002,X
#_01F9AE: CLC
#_01F9AF: RTS

.branch01F9B0
#_01F9B0: CPX.w #$0180
#_01F9B3: BCC .branch01F9B9

#_01F9B5: JSL routine01968A

.branch01F9B9
#_01F9B9: CLC
#_01F9BA: RTS

.branch01F9BB
#_01F9BB: SEC
#_01F9BC: RTS

;===================================================================================================

UseItem_Bottle:
#_01F9BD: LDY.w #$0000
#_01F9C0: STY.w $0A54

.branch01F9C3
#_01F9C3: LDX.w $0700,Y
#_01F9C6: BMI .branch01F9F1

#_01F9C8: LDA.w $1002,X
#_01F9CB: AND.w #$C000
#_01F9CE: BNE .branch01F9EA

#_01F9D0: LDA.w $1032,X
#_01F9D3: CMP.w $1034,X
#_01F9D6: BCS .branch01F9EA

#_01F9D8: CLC
#_01F9D9: ADC.w #$0005
#_01F9DC: CMP.w $1034,X
#_01F9DF: BCC .branch01F9E4

#_01F9E1: LDA.w $1034,X

.branch01F9E4
#_01F9E4: STA.w $1032,X
#_01F9E7: INC.w $0A54

.branch01F9EA
#_01F9EA: INY
#_01F9EB: INY
#_01F9EC: CPY.w #$000C
#_01F9EF: BCC .branch01F9C3

.branch01F9F1
#_01F9F1: LDA.w $0A54
#_01F9F4: BEQ .branch01F9F8

#_01F9F6: CLC
#_01F9F7: RTS

.branch01F9F8
#_01F9F8: SEC
#_01F9F9: RTS

;===================================================================================================

UseItem_SkillIncense:
#_01F9FA: PHX
#_01F9FB: JSR VerifyTargetIsAlive
#_01F9FE: PLX
#_01F9FF: BCS .branch01FA5E

#_01FA01: STZ.w $0A54
#_01FA04: TXA
#_01FA05: SEC
#_01FA06: SBC.w #$0010
#_01FA09: LDY.w $0715
#_01FA0C: CLC
#_01FA0D: ADC.w $105A,Y
#_01FA10: TAX
#_01FA11: LDA.w $1010,X
#_01FA14: SEC
#_01FA15: SBC.w $1036,X
#_01FA18: INC A
#_01FA19: CMP.w #$0029
#_01FA1C: BCS .branch01FA3A

#_01FA1E: CLC
#_01FA1F: ADC.w $1036,X
#_01FA22: CMP.w #$0029
#_01FA25: BCC .branch01FA2D

#_01FA27: DEC.w $1036,X
#_01FA2A: LDA.w #$0028

.branch01FA2D
#_01FA2D: STA.w $1010,X
#_01FA30: LDX.w $0715
#_01FA33: JSL UpdatePlayerStats
#_01FA37: INC.w $0A54

.branch01FA3A
#_01FA3A: LDY.w $0715
#_01FA3D: LDX.w $105A,Y
#_01FA40: LDA.w $1004,X
#_01FA43: STA.w $0A3E
#_01FA46: LDA.w $102E,X
#_01FA49: CMP.w $1030,X
#_01FA4C: BCS .branch01FA57

#_01FA4E: LDA.w $1030,X
#_01FA51: STA.w $102E,X
#_01FA54: INC.w $0A54

.branch01FA57
#_01FA57: LDA.w $0A54
#_01FA5A: BEQ .branch01FA5E

#_01FA5C: CLC
#_01FA5D: RTS

.branch01FA5E
#_01FA5E: SEC
#_01FA5F: RTS

;===================================================================================================

UseItem_AngelHair:
#_01FA60: STZ.w $0A54
#_01FA63: LDY.w #$0000

.branch01FA66
#_01FA66: LDX.w $0700,Y
#_01FA69: BMI .branch01FAb0

#_01FA6B: LDA.w $1002,X
#_01FA6E: AND.w #$C000
#_01FA71: BNE .branch01FAA9

#_01FA73: LDA.w $101C,X
#_01FA76: CMP.w #$0070
#_01FA79: BCS .branch01FA9F

#_01FA7B: LDA.w $102E,X
#_01FA7E: CMP.w $1030,X
#_01FA81: BCS .branch01FA8C

#_01FA83: LDA.w $1030,X
#_01FA86: STA.w $102E,X
#_01FA89: INC.w $0A54

.branch01FA8C
#_01FA8C: LDA.w $1002,X
#_01FA8F: BIT.w #$FEFF
#_01FA92: BEQ .branch01FAA9

#_01FA94: AND.w #$C700
#_01FA97: STA.w $1002,X
#_01FA9A: INC.w $0A54
#_01FA9D: BRA .branch01FAA9

.branch01FA9F
#_01FA9F: LDA.w $102E,X
#_01FAA2: LSR A
#_01FAA3: ADC.w #$0000
#_01FAA6: STA.w $102E,X

.branch01FAA9
#_01FAA9: INY
#_01FAAA: INY
#_01FAAB: CPY.w #$000C
#_01FAAE: BCC .branch01FA66

.branch01FAb0
#_01FAB0: LDA.w $0A54
#_01FAB3: BEQ .branch01FAB7

#_01FAB5: CLC
#_01FAB6: RTS

.branch01FAB7
#_01FAB7: SEC
#_01FAB8: RTS

;===================================================================================================

UseItem_AshuraHand:
#_01FAB9: STZ.w $0A54
#_01FABC: LDY.w #$0000

.branch01FABF
#_01FABF: LDX.w $0700,Y
#_01FAC2: BMI .branch01FB0C

#_01FAC4: LDA.w $1002,X
#_01FAC7: AND.w #$C000
#_01FACA: BNE .branch01FB05

#_01FACC: LDA.w $101C,X
#_01FACF: CMP.w #$0091
#_01FAD2: BCC .branch01FAF8

#_01FAD4: LDA.w $102E,X
#_01FAD7: CMP.w $1030,X
#_01FADA: BCS .branch01FAE5

#_01FADC: LDA.w $1030,X
#_01FADF: STA.w $102E,X
#_01FAE2: INC.w $0A54

.branch01FAE5
#_01FAE5: LDA.w $1002,X
#_01FAE8: BIT.w #$FEFF
#_01FAEB: BEQ .branch01FB05

#_01FAED: AND.w #$C700
#_01FAF0: STA.w $1002,X
#_01FAF3: INC.w $0A54
#_01FAF6: BRA .branch01FB05

.branch01FAF8
#_01FAF8: LDA.w $102E,X
#_01FAFB: LSR A
#_01FAFC: ADC.w #$0000
#_01FAFF: STA.w $102E,X
#_01FB02: INC.w $0A54

.branch01FB05
#_01FB05: INY
#_01FB06: INY
#_01FB07: CPY.w #$000C
#_01FB0A: BCC .branch01FABF

.branch01FB0C
#_01FB0C: LDA.w $0A54
#_01FB0F: BEQ .branch01FB13

#_01FB11: CLC
#_01FB12: RTS

.branch01FB13
#_01FB13: SEC
#_01FB14: RTS

;===================================================================================================

UseItem_Pentagram:
#_01FB15: LDA.w $057C
#_01FB18: BNE .active

#_01FB1A: DEC.w $057C

#_01FB1D: LDA.w #$00DE
#_01FB20: JSL routine018123

#_01FB24: CLC
#_01FB25: RTS

.active
#_01FB26: LDA.w #$0044
#_01FB29: JSL DisplayActionMessage

#_01FB2D: CLC
#_01FB2E: RTS

;===================================================================================================

UseItem_Nyorai:
#_01FB2F: LDA.w $057E
#_01FB32: BNE .active

#_01FB34: DEC.w $057E

#_01FB37: LDA.w #$00DF
#_01FB3A: JSL routine018123

#_01FB3E: CLC
#_01FB3F: RTS

.active
#_01FB40: LDA.w #$0044
#_01FB43: JSL DisplayActionMessage

#_01FB47: CLC
#_01FB48: RTS

;===================================================================================================

UseItem_AmidaBeads:
#_01FB49: LDA.w $0580
#_01FB4C: BNE .active

#_01FB4E: DEC.w $0580

#_01FB51: LDA.w #$00E0
#_01FB54: JSL routine018123

#_01FB58: CLC
#_01FB59: RTS

.active
#_01FB5A: LDA.w #$0044
#_01FB5D: JSL DisplayActionMessage

#_01FB61: CLC
#_01FB62: RTS

;===================================================================================================

UseItem_Rosary:
#_01FB63: LDA.w $0582
#_01FB66: BNE .active

#_01FB68: DEC.w $0582

#_01FB6B: LDA.w #$00E1
#_01FB6E: JSL routine018123

#_01FB72: CLC
#_01FB73: RTS

.active
#_01FB74: LDA.w #$0044
#_01FB77: JSL DisplayActionMessage

#_01FB7B: CLC
#_01FB7C: RTS

;===================================================================================================

UseItem_Amulet:
#_01FB7D: LDA.w $0584
#_01FB80: BNE .active

#_01FB82: DEC.w $0584

#_01FB85: LDA.w #$00E2
#_01FB88: JSL routine018123

#_01FB8C: CLC
#_01FB8D: RTS

.active
#_01FB8E: LDA.w #$0044
#_01FB91: JSL DisplayActionMessage

#_01FB95: CLC
#_01FB96: RTS

;===================================================================================================

UseItem_Talisman:
#_01FB97: LDA.w $0586
#_01FB9A: BNE .active

#_01FB9C: DEC.w $0586

#_01FB9F: LDA.w #$00E3
#_01FBA2: JSL routine018123

#_01FBA6: CLC
#_01FBA7: RTS

.active
#_01FBA8: LDA.w #$0044
#_01FBAB: JSL DisplayActionMessage

#_01FBAF: CLC
#_01FBB0: RTS

;===================================================================================================

UseItem_CoreShield:
#_01FBB1: LDA.w $0588
#_01FBB4: BNE .active

#_01FBB6: DEC.w $0588

#_01FBB9: LDA.w #$00E4
#_01FBBC: JSL routine018123

#_01FBC0: CLC
#_01FBC1: RTS

.active
#_01FBC2: LDA.w #$0044
#_01FBC5: JSL DisplayActionMessage

#_01FBC9: CLC
#_01FBCA: RTS

;===================================================================================================

UseItem_GushingJar:
#_01FBCB: LDA.w $050A
#_01FBCE: CMP.w #$0100
#_01FBD1: BCS .branch01FC29

#_01FBD3: JSL GetRandomInt
#_01FBD7: AND.w #$0001
#_01FBDA: ASL A
#_01FBDB: TAX

#_01FBDC: LDA.w $0512,X
#_01FBDF: BNE .branch01FBE6

#_01FBE1: TXA
#_01FBE2: EOR.w #$0002
#_01FBE5: TAX

.branch01FBE6
#_01FBE6: DEC.w $0512,X
#_01FBE9: LDY.w #$0600
#_01FBEC: CPX.w #$0002
#_01FBEF: BCC .branch01FBF4

#_01FBF1: LDY.w #$0780

.branch01FBF4
#_01FBF4: LDA.w $1000,Y
#_01FBF7: BPL .branch01FC0C

#_01FBF9: LDA.w $1002,Y
#_01FBFC: AND.w #$C000
#_01FBFF: BEQ .branch01FC0C

#_01FC01: TYA
#_01FC02: CLC
#_01FC03: ADC.w #$0060
#_01FC06: TAY
#_01FC07: CPY.w #$0900
#_01FC0A: BCC .branch01FBF4

.branch01FC0C
#_01FC0C: LDA.w $1002,Y
#_01FC0F: AND.w #$8000
#_01FC12: ORA.w #$4000
#_01FC15: STA.w $1002,Y
#_01FC18: LDA.w #$0000
#_01FC1B: STA.w $102E,Y
#_01FC1E: STA.w $1032,Y
#_01FC21: LDA.w $1004,Y
#_01FC24: STA.w $0A3E
#_01FC27: CLC
#_01FC28: RTS

.branch01FC29
#_01FC29: SEC
#_01FC2A: RTS

;===================================================================================================

UseItem_FortuneSlips:
#_01FC2B: JSR VerifyTargetIsAlive
#_01FC2E: BCS .failed_to_use

#_01FC30: JSL GetRandomInt
#_01FC34: LDX.w #$0000

.draw_next_fortune
#_01FC37: LDA.l .luck_rolls,X
#_01FC3B: CMP.w $0ED5
#_01FC3E: BCS .seal_your_fate

#_01FC40: INX
#_01FC41: INX
#_01FC42: CPX.w #$000A
#_01FC45: BCC .draw_next_fortune

.seal_your_fate
#_01FC47: LDA.l .vectors,X
#_01FC4B: STA.w $0E40
#_01FC4E: LDY.w $0715
#_01FC51: LDX.w $105A,Y
#_01FC54: JMP ($0E40)

.failed_to_use
#_01FC57: SEC
#_01FC58: RTS

.luck_rolls
#_01FC59: dw $000F
#_01FC5B: dw $004F
#_01FC5D: dw $00AF
#_01FC5F: dw $00EF
#_01FC61: dw $00FF

.vectors
#_01FC63: dw FortuneSlip_MaxHPandMP
#_01FC65: dw FortuneSlip_LevelBasedHPGain
#_01FC67: dw FortuneSlip_DoNothing
#_01FC69: dw FortuneSlip_QuarterHP
#_01FC6B: dw FortuneSlip_TankHPandMP
#_01FC6D: dw FortuneSlip_1HP

;===================================================================================================
; Tops off HP and MP
;===================================================================================================
FortuneSlip_MaxHPandMP:
#_01FC6F: LDY.w #$0000

#_01FC72: LDA.w $102E,X
#_01FC75: CMP.w $1030,X
#_01FC78: BCS .already_max_hp

#_01FC7A: LDA.w $1030,X
#_01FC7D: STA.w $102E,X

#_01FC80: INY

.already_max_hp
#_01FC81: LDA.w $1032,X
#_01FC84: CMP.w $1034,X
#_01FC87: BCS .already_max_mp

#_01FC89: LDA.w $1034,X
#_01FC8C: STA.w $1032,X
#_01FC8F: INY

.already_max_mp
#_01FC90: CPY.w #$0000
#_01FC93: BEQ FortuneSlip_CannotUse

#_01FC95: CLC
#_01FC96: RTS

;===================================================================================================

FortuneSlip_CannotUse:
#_01FC97: SEC
#_01FC98: RTS

;===================================================================================================
; Adds LVL to HP
;===================================================================================================
FortuneSlip_LevelBasedHPGain:
#_01FC99: LDA.w $102E,X
#_01FC9C: CMP.w $1030,X
#_01FC9F: BCS FortuneSlip_CannotUse

#_01FCA1: CLC
#_01FCA2: ADC.w $100A,X
#_01FCA5: CMP.w $1030,X
#_01FCA8: BCC .no_overflow

#_01FCAA: LDA.w $1030,X

.no_overflow
#_01FCAD: STA.w $102E,X

#_01FCB0: CLC
#_01FCB1: RTS

;===================================================================================================
; Does nothing
;===================================================================================================
FortuneSlip_DoNothing:
#_01FCB2: CLC
#_01FCB3: RTS

;===================================================================================================
; Reduces HP to ceil(1/4)
;===================================================================================================
FortuneSlip_QuarterHP:
#_01FCB4: LDA.w $102E,X
#_01FCB7: LSR A
#_01FCB8: LSR A
#_01FCB9: INC A
#_01FCBA: STA.w $102E,X

#_01FCBD: CLC
#_01FCBE: RTS

;===================================================================================================
; Reduces HP and MP to ceil(1/8)
;===================================================================================================
FortuneSlip_TankHPandMP:
#_01FCBF: LDA.w $102E,X
#_01FCC2: LSR A
#_01FCC3: LSR A
#_01FCC4: LSR A
#_01FCC5: INC A
#_01FCC6: STA.w $102E,X

#_01FCC9: LDA.w $1032,X
#_01FCCC: LSR A
#_01FCCD: LSR A
#_01FCCE: LSR A
#_01FCCF: INC A
#_01FCD0: STA.w $1032,X

#_01FCD3: CLC
#_01FCD4: RTS

;===================================================================================================
; Reduces HP to 1
;===================================================================================================
FortuneSlip_1HP:
#_01FCD5: LDA.w #$0001
#_01FCD8: STA.w $102E,X

#_01FCDB: CLC

#_01FCDC: RTS

;===================================================================================================

UseItem_Indulgence:
#_01FCDD: LDA.w $1604
#_01FCE0: CMP.w #$0100
#_01FCE3: BCS .fail

#_01FCE5: LDA.w $052A
#_01FCE8: ORA.w #$0200
#_01FCEB: STA.w $052A

#_01FCEE: LDA.w #$0000
#_01FCF1: STZ.w $0512
#_01FCF4: STZ.w $0514

#_01FCF7: STZ.w $0524
#_01FCFA: CLC

.fail
#_01FCFB: RTS

;===================================================================================================

routine01FCFC:
#_01FCFC: REP #$30

#_01FCFE: XBA
#_01FCFF: AND.w #$0007
#_01FD02: ASL A
#_01FD03: TAX

#_01FD04: LDA.l .vectors,X
#_01FD08: STA.w $0600

#_01FD0B: JSL ClearEntityListBuffer

#_01FD0F: STZ.w $0688
#_01FD12: STZ.w $068A

#_01FD15: SEP #$20

#_01FD17: STZ.w $06E1

#_01FD1A: REP #$20

#_01FD1C: JMP ($0600)

.vectors
#_01FD1F: dw routine01FD27
#_01FD21: dw routine01FD80
#_01FD23: dw routine01FDD8
#_01FD25: dw routine01FE4D

;===================================================================================================

routine01FD27:
#_01FD27: LDY.w #$0000

.branch01FD2A
#_01FD2A: PHY
#_01FD2B: LDX.w $0700,Y
#_01FD2E: BIT.w $1000,X
#_01FD31: BPL .branch01FD3F

#_01FD33: LDA.w $068A
#_01FD36: ASL A
#_01FD37: TAY
#_01FD38: TXA
#_01FD39: STA.w $06A0,Y
#_01FD3C: INC.w $068A

.branch01FD3F
#_01FD3F: PLY
#_01FD40: INY
#_01FD41: INY
#_01FD42: CPY.w #$000C
#_01FD45: BCC .branch01FD2A

#_01FD47: LDA.w #$002B
#_01FD4A: JSL DisplaySystemMessage
#_01FD4E: JSL routine0190E6
#_01FD52: BCC .branch01FD5F

#_01FD54: LDX.w $0715
#_01FD57: LDA.w #$FFFF
#_01FD5A: STA.w $105A,X
#_01FD5D: SEC
#_01FD5E: RTL

.branch01FD5F
#_01FD5F: STA.w $06E1

#_01FD62: REP #$30
#_01FD64: AND.w #$00FF
#_01FD67: LDX.w $0688
#_01FD6A: BEQ .branch01FD73

.branch01FD6C
#_01FD6C: CLC
#_01FD6D: ADC.w #$0006
#_01FD70: DEX
#_01FD71: BNE .branch01FD6C

.branch01FD73
#_01FD73: ASL A
#_01FD74: TAY
#_01FD75: LDA.w $06A0,Y
#_01FD78: LDX.w $0715
#_01FD7B: STA.w $105A,X
#_01FD7E: CLC
#_01FD7F: RTL

;===================================================================================================

routine01FD80:
#_01FD80: LDX.w #$0000

.branch01FD83
#_01FD83: BIT.w $1000,X
#_01FD86: BPL .branch01FD94

#_01FD88: LDA.w $068A
#_01FD8B: ASL A
#_01FD8C: TAY
#_01FD8D: TXA
#_01FD8E: STA.w $06A0,Y
#_01FD91: INC.w $068A

.branch01FD94
#_01FD94: TXA
#_01FD95: CLC
#_01FD96: ADC.w #$0060
#_01FD99: TAX
#_01FD9A: CMP.w #$0600
#_01FD9D: BCC .branch01FD83

#_01FD9F: LDA.w #$002B
#_01FDA2: JSL DisplaySystemMessage
#_01FDA6: JSL routine0190E6
#_01FDAA: BCC .branch01FDB7

#_01FDAC: LDX.w $0715
#_01FDAF: LDA.w #$FFFF
#_01FDB2: STA.w $105A,X
#_01FDB5: SEC
#_01FDB6: RTL

.branch01FDB7
#_01FDB7: STA.w $06E1

#_01FDBA: REP #$30
#_01FDBC: AND.w #$00FF
#_01FDBF: LDX.w $0688
#_01FDC2: BEQ .branch01FDCB

.branch01FDC4
#_01FDC4: CLC
#_01FDC5: ADC.w #$0006
#_01FDC8: DEX
#_01FDC9: BNE .branch01FDC4

.branch01FDCB
#_01FDCB: ASL A
#_01FDCC: TAY
#_01FDCD: LDA.w $06A0,Y
#_01FDD0: LDX.w $0715
#_01FDD3: STA.w $105A,X
#_01FDD6: CLC
#_01FDD7: RTL

;===================================================================================================

routine01FDD8:
#_01FDD8: LDX.w #$0000

.branch01FDDB
#_01FDDB: BIT.w $1000,X
#_01FDDE: BPL .branch01FDFB

#_01FDE0: BVS .branch01FDEA

#_01FDE2: LDA.w $0400
#_01FDE5: AND.w #$0040
#_01FDE8: BNE .branch01FDFB

.branch01FDEA
#_01FDEA: LDA.w $1002,X
#_01FDED: BEQ .branch01FDFB

#_01FDEF: LDA.w $068A
#_01FDF2: ASL A
#_01FDF3: TAY
#_01FDF4: TXA
#_01FDF5: STA.w $06A0,Y
#_01FDF8: INC.w $068A

.branch01FDFB
#_01FDFB: TXA
#_01FDFC: CLC
#_01FDFD: ADC.w #$0060
#_01FE00: TAX
#_01FE01: CMP.w #$0600
#_01FE04: BCC .branch01FDDB

#_01FE06: LDA.w $068A
#_01FE09: BNE .branch01FE14

#_01FE0B: LDA.w #$0041
#_01FE0E: JSL DisplayActionMessage
#_01FE12: SEC
#_01FE13: RTL

.branch01FE14
#_01FE14: LDA.w #$002B
#_01FE17: JSL DisplaySystemMessage
#_01FE1B: JSL routine0190E6
#_01FE1F: BCC .branch01FE2C

#_01FE21: LDX.w $0715
#_01FE24: LDA.w #$FFFF
#_01FE27: STA.w $105A,X
#_01FE2A: SEC
#_01FE2B: RTL

.branch01FE2C
#_01FE2C: STA.w $06E1

#_01FE2F: REP #$30
#_01FE31: AND.w #$00FF
#_01FE34: LDX.w $0688
#_01FE37: BEQ .branch01FE40

.branch01FE39
#_01FE39: CLC
#_01FE3A: ADC.w #$0006
#_01FE3D: DEX
#_01FE3E: BNE .branch01FE39

.branch01FE40
#_01FE40: ASL A
#_01FE41: TAY
#_01FE42: LDA.w $06A0,Y
#_01FE45: LDX.w $0715
#_01FE48: STA.w $105A,X
#_01FE4B: CLC
#_01FE4C: RTL

;===================================================================================================

routine01FE4D:
#_01FE4D: LDX.w #$0000

.branch01FE50
#_01FE50: BIT.w $1000,X
#_01FE53: BPL .branch01FE63

#_01FE55: BVC .branch01FE63

#_01FE57: LDA.w $068A
#_01FE5A: ASL A
#_01FE5B: TAY
#_01FE5C: TXA
#_01FE5D: STA.w $06A0,Y
#_01FE60: INC.w $068A

.branch01FE63
#_01FE63: TXA
#_01FE64: CLC
#_01FE65: ADC.w #$0060
#_01FE68: TAX
#_01FE69: CMP.w #$0180
#_01FE6C: BCC .branch01FE50

#_01FE6E: LDA.w #$002B
#_01FE71: JSL DisplaySystemMessage
#_01FE75: JSL routine0190E6
#_01FE79: BCC .branch01FE86

#_01FE7B: LDX.w $0715
#_01FE7E: LDA.w #$FFFF
#_01FE81: STA.w $105A,X
#_01FE84: SEC
#_01FE85: RTL

.branch01FE86
#_01FE86: STA.w $06E1

#_01FE89: REP #$30
#_01FE8B: AND.w #$00FF
#_01FE8E: LDX.w $0688
#_01FE91: BEQ .branch01FE9A

.branch01FE93
#_01FE93: CLC
#_01FE94: ADC.w #$0006
#_01FE97: DEX
#_01FE98: BNE .branch01FE93

.branch01FE9A
#_01FE9A: ASL A
#_01FE9B: TAY
#_01FE9C: LDA.w $06A0,Y
#_01FE9F: LDX.w $0715
#_01FEA2: STA.w $105A,X
#_01FEA5: CLC
#_01FEA6: RTL

;===================================================================================================

VerifyTargetIsAlive:
#_01FEA7: LDY.w $0715

#_01FEAA: LDX.w $105A,Y

#_01FEAD: LDA.w $1002,X
#_01FEB0: AND.w #$C000
#_01FEB3: BNE .they_dead

#_01FEB5: LDA.w $1004,X
#_01FEB8: STA.w $0A3E

#_01FEBB: CLC
#_01FEBC: RTS

.they_dead
#_01FEBD: SEC
#_01FEBE: RTS

;===================================================================================================

routine01FEBF:
#_01FEBF: LDA.w #$002C
#_01FEC2: JSL DisplayActionMessage
#_01FEC6: RTS

#_01FEC7: db $10,$38,$6B,$8D,$E1,$06

; TODO POSSIBLY UNUSED ROUTINE
routine01FECD:
#_01FECD: REP #$30
#_01FECF: AND.w #$00FF
#_01FED2: LDX.w $0688
#_01FED5: BEQ .branch01FEDE

.branch01FED7
#_01FED7: CLC
#_01FED8: ADC.w #$0006
#_01FEDB: DEX
#_01FEDC: BNE .branch01FED7

.branch01FEDE
#_01FEDE: ASL A
#_01FEDF: TAY
#_01FEE0: LDA.w $06A0,Y
#_01FEE3: LDX.w $0715
#_01FEE6: STA.w $105A,X
#_01FEE9: CLC
#_01FEEA: RTL

; TODO POSSIBLY UNUSED ROUTINE
routine01FEEB:
#_01FEEB: LDX.w #$0000

.branch01FEEE
#_01FEEE: BIT.w $1000,X
#_01FEF1: BPL .branch01FF0E

#_01FEF3: BVS .branch01FEFD

#_01FEF5: LDA.w $0400
#_01FEF8: AND.w #$0040
#_01FEFB: BNE .branch01FF0E

.branch01FEFD
#_01FEFD: LDA.w $1002,X
#_01FF00: BEQ .branch01FF0E

#_01FF02: LDA.w $068A
#_01FF05: ASL A
#_01FF06: TAY
#_01FF07: TXA
#_01FF08: STA.w $06A0,Y
#_01FF0B: INC.w $068A

.branch01FF0E
#_01FF0E: TXA
#_01FF0F: CLC
#_01FF10: ADC.w #$0060
#_01FF13: TAX
#_01FF14: CMP.w #$0600
#_01FF17: BCC .branch01FEEE

#_01FF19: LDA.w $068A
#_01FF1C: BNE .branch01FF27

#_01FF1E: LDA.w #$0041
#_01FF21: JSL DisplayActionMessage
#_01FF25: SEC
#_01FF26: RTL

.branch01FF27
#_01FF27: LDA.w #$002B
#_01FF2A: JSL DisplaySystemMessage
#_01FF2E: JSL routine0190E6
#_01FF32: BCC .branch01FF3F

#_01FF34: LDX.w $0715
#_01FF37: LDA.w #$FFFF
#_01FF3A: STA.w $105A,X
#_01FF3D: SEC
#_01FF3E: RTL

.branch01FF3F
#_01FF3F: STA.w $06E1

#_01FF42: REP #$30
#_01FF44: AND.w #$00FF
#_01FF47: LDX.w $0688
#_01FF4A: BEQ .branch01FF53

.branch01FF4C
#_01FF4C: CLC
#_01FF4D: ADC.w #$0006
#_01FF50: DEX
#_01FF51: BNE .branch01FF4C

.branch01FF53
#_01FF53: ASL A
#_01FF54: TAY
#_01FF55: LDA.w $06A0,Y
#_01FF58: LDX.w $0715
#_01FF5B: STA.w $105A,X
#_01FF5E: CLC
#_01FF5F: RTL

; TODO POSSIBLY UNUSED ROUTINE
routine01FF60:
#_01FF60: LDX.w #$0000

.branch01FF63
#_01FF63: BIT.w $1000,X
#_01FF66: BPL .branch01FF76
#_01FF68: BVC .branch01FF76

#_01FF6A: LDA.w $068A
#_01FF6D: ASL A
#_01FF6E: TAY
#_01FF6F: TXA
#_01FF70: STA.w $06A0,Y
#_01FF73: INC.w $068A

.branch01FF76
#_01FF76: TXA
#_01FF77: CLC
#_01FF78: ADC.w #$0060
#_01FF7B: TAX
#_01FF7C: CMP.w #$0180
#_01FF7F: BCC .branch01FF63

#_01FF81: LDA.w #$002B
#_01FF84: JSL DisplaySystemMessage
#_01FF88: JSL routine0190E6
#_01FF8C: BCC .branch01FF99

#_01FF8E: LDX.w $0715
#_01FF91: LDA.w #$FFFF
#_01FF94: STA.w $105A,X
#_01FF97: SEC
#_01FF98: RTL

.branch01FF99
#_01FF99: STA.w $06E1

#_01FF9C: REP #$30
#_01FF9E: AND.w #$00FF
#_01FFA1: LDX.w $0688
#_01FFA4: BEQ .branch01FFAD

.branch01FFA6
#_01FFA6: CLC
#_01FFA7: ADC.w #$0006
#_01FFAA: DEX
#_01FFAB: BNE .branch01FFA6

.branch01FFAD
#_01FFAD: ASL A
#_01FFAE: TAY
#_01FFAF: LDA.w $06A0,Y
#_01FFB2: LDX.w $0715
#_01FFB5: STA.w $105A,X
#_01FFB8: CLC
#_01FFB9: RTL

; TODO POSSIBLY UNUSED ROUTINE
routine01FFBA:
#_01FFBA: LDY.w $0715
#_01FFBD: LDX.w $105A,Y
#_01FFC0: LDA.w $1002,X
#_01FFC3: AND.w #$C000
#_01FFC6: BNE .branch01FFD0

#_01FFC8: LDA.w $1004,X
#_01FFCB: STA.w $0A3E
#_01FFCE: CLC
#_01FFCF: RTS

.branch01FFD0
#_01FFD0: SEC
#_01FFD1: RTS

; TODO POSSIBLY UNUSED ROUTINE
; actually, almost certainly
routine01FFD2:
#_01FFD2: LDA.w #$002C
#_01FFD5: JSL DisplayActionMessage
#_01FFD9: RTS

#_01FFDA: db $06

#_01FFDB: REP #$30
#_01FFDD: AND.w #$00FF
#_01FFE0: LDX.w $0688
#_01FFE3: BEQ .branch01FFEC

.branch01FFE5
#_01FFE5: CLC
#_01FFE6: ADC.w #$0006
#_01FFE9: DEX
#_01FFEA: BNE .branch01FFE5

.branch01FFEC
#_01FFEC: ASL A
#_01FFED: TAY
#_01FFEE: LDA.w $06A0,Y
#_01FFF1: LDX.w $0715
#_01FFF4: STA.w $105A,X
#_01FFF7: CLC
#_01FFF8: RTL

#_01FFF9: db $AC,$15,$07,$BE,$5A,$10,$BD
