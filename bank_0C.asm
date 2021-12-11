org $0C8000

;===================================================================================================

InitializeSPC:
#_0C8000: PHP
#_0C8001: REP #$30

#_0C8003: LDA.w #InitialAPUData>>0
#_0C8006: STA.w $0090

#_0C8009: LDA.w #InitialAPUData>>16
#_0C800C: STA.w $0092

#_0C800F: LDY.w #$0000
#_0C8012: LDA.w #$BBAA

.wait_for_apu_ready
#_0C8015: CMP.w APUIO0
#_0C8018: BNE .wait_for_apu_ready

#_0C801A: SEP #$20

#_0C801C: LDA.b #$CC
#_0C801E: BRA .first_transfer

.next_transfer
#_0C8020: LDA.b [$90],Y
#_0C8022: INY

#_0C8023: XBA
#_0C8024: LDA.b #$00
#_0C8026: BRA .first_byte

.next_byte
#_0C8028: XBA
#_0C8029: LDA.b [$90],Y
#_0C802B: INY
#_0C802C: XBA

.sync_a
#_0C802D: CMP.w APUIO0
#_0C8030: BNE .sync_a

#_0C8032: INC A

.first_byte
#_0C8033: REP #$20

#_0C8035: STA.w APUIO0

#_0C8038: SEP #$20
#_0C803A: DEX
#_0C803B: BNE .next_byte

.sync_b
#_0C803D: CMP.w APUIO0
#_0C8040: BNE .sync_b

.dont_be_zero
#_0C8042: ADC.b #$03
#_0C8044: BEQ .dont_be_zero

.first_transfer
#_0C8046: PHA
#_0C8047: REP #$20

#_0C8049: LDA.b [$90],Y
#_0C804B: INY
#_0C804C: INY
#_0C804D: TAX

#_0C804E: LDA.b [$90],Y
#_0C8050: INY
#_0C8051: INY
#_0C8052: STA.w APUIO2

#_0C8055: SEP #$20

#_0C8057: CPX.w #$0001

#_0C805A: LDA.b #$00
#_0C805C: ROL A
#_0C805D: STA.w APUIO1

#_0C8060: ADC.b #$7F
#_0C8062: PLA
#_0C8063: STA.w APUIO0

.sync_c
#_0C8066: CMP.w APUIO0
#_0C8069: BNE .sync_c
#_0C806B: BVS .next_transfer

#_0C806D: PLP

#_0C806E: RTL

;===================================================================================================

Write_to_APU:
#_0C806F: PHP

#_0C8070: SEP #$30

#_0C8072: LDY.w $0F83

#_0C8075: STA.w $0F84,Y

#_0C8078: BRA SyncAPUPort1

;===================================================================================================

; This APU write can initiate a music transfer
Write_to_APU_transferrable:
#_0C807A: PHP

#_0C807B: SEP #$30

#_0C807D: LDY.w $0F83

#_0C8080: STA.w $0F84,Y
#_0C8083: TAY
#_0C8084: BMI SyncAPUPort1

; these songs need to transfer data
#_0C8086: CMP.b #$44
#_0C8088: BCS MusicTransferCommand

;===================================================================================================

SyncAPUPort1:
#_0C808A: SEP #$30

.sync
#_0C808C: LDA.w APUIO1
#_0C808F: BNE .sync

#_0C8091: LDY.w $0F83
#_0C8094: LDA.w $0F84,Y
#_0C8097: STA.w APUIO,Y

#_0C809A: INY
#_0C809B: STY.w $0F83

#_0C809E: CPY.b #$04
#_0C80A0: BCC .no_reset

#_0C80A2: STZ.w $0F83

.no_reset
#_0C80A5: PLP

#_0C80A6: RTL

;===================================================================================================

MusicTransferCommand:
#_0C80A7: SEC
#_0C80A8: SBC.b #$44
#_0C80AA: ASL A
#_0C80AB: TAX

#_0C80AC: LDA.l MusicPackage_Pointers+0,X
#_0C80B0: STA.w $0090

#_0C80B3: LDA.l MusicPackage_Pointers+1,X
#_0C80B7: STA.w $0091

#_0C80BA: LDA.b #MusicPackage_Pointers>>16
#_0C80BC: STA.w $0092

.sync_a
#_0C80BF: LDA.w APUIO1
#_0C80C2: BNE .sync_a

#_0C80C4: LDA.b #$FE ; send magic FE to APU
#_0C80C6: STA.w APUIO0

.next_transfer
#_0C80C9: SEP #$20

.sync_b
#_0C80CB: LDA.w APUIO1
#_0C80CE: CMP.b #$EE ; wait for APU to reply with EE
#_0C80D0: BNE .sync_b

#_0C80D2: REP #$30

#_0C80D4: LDA.b [$90] ; load location of pointers
#_0C80D6: STA.w $0094

#_0C80D9: INC.w $0090 ; increment for bank
#_0C80DC: INC.w $0090

#_0C80DF: LDA.b [$90] ; load bank
#_0C80E1: STA.w $0096

#_0C80E4: LDA.b [$94] ; load address of transfer
#_0C80E6: STA.w APUIO0

#_0C80E9: AND.w #$3FFF
#_0C80EC: STA.w $0F8C

#_0C80EF: LDY.w #$0002

#_0C80F2: LDA.b [$94],Y
#_0C80F4: STA.w APUIO2

.sync_c
#_0C80F7: LDA.w APUIO0
#_0C80FA: BNE ..sync_c

#_0C80FC: STA.w $0F88

#_0C80FF: LDY.w #$0004

.next_byte
#_0C8102: LDA.b [$94],Y
#_0C8104: STA.w APUIO2

#_0C8107: LDA.w $0F88
#_0C810A: STA.w APUIO0

#_0C810D: INC A
#_0C810E: STA.w $0F8A

.sync_d
#_0C8111: LDA.w APUIO0
#_0C8114: CMP.w $0F8A
#_0C8117: BNE .sync_d

#_0C8119: STA.w $0F88

#_0C811C: INY
#_0C811D: INY
#_0C811E: DEC.w $0F8C
#_0C8121: BEQ ..done_transfer

#_0C8123: DEC.w $0F8C
#_0C8126: BNE .next_byte

..done_transfer
#_0C8128: INC.w $0090
#_0C812B: INC.w $0090

#_0C812E: LDA.b [$90]
#_0C8130: BEQ .no_more_transfers

#_0C8132: STA.w $0094

#_0C8135: LDA.w #$FFFF
#_0C8138: STA.w APUIO0
#_0C813B: BRA .next_transfer

.no_more_transfers
#_0C813D: LDA.w #$0000
#_0C8140: STA.w APUIO0

#_0C8143: LDX.w #$0020

.sync_e
#_0C8146: DEX
#_0C8147: BNE .sync_e

#_0C8149: JMP SyncAPUPort1

;===================================================================================================

MusicPackage_Pointers:
#_0C814C: dw Jakyou_APU_Package                  ; 44
#_0C814E: dw Law_APU_Package                     ; 45 "Law"
#_0C8150: dw Chaos_APU_Package                   ; 46 "Chaos"
#_0C8152: dw Neutral_APU_Package                 ; 47 "Neutral"
#_0C8154: dw Ginza_APU_Package                   ; 48 "Ginza"
#_0C8156: dw Cathedral_APU_Package               ; 49 "Cathedral"
#_0C8158: dw Shibuya_APU_Package                 ; 4A "Shibuya"
#_0C815A: dw Shitenou_APU_Package                ; 4B "Shitenou's Lair"
#_0C815C: dw Embassy_APU_Package                 ; 4C "Embassy"
#_0C815E: dw Arcade_APU_Package                  ; 4D "Arcade"
#_0C8160: dw Kichijoi_APU_Package                ; 4E "Kichijoi"
#_0C8162: dw Ruins_APU_Package                   ; 4F "Ruins"
#_0C8164: dw Shop_APU_Package                    ; 50 "Shop"
#_0C8166: dw Boss_APU_Package                    ; 51 "Boss Battle"
#_0C8168: dw Dream_APU_Package                   ; 52 "Dream"
#_0C816A: dw Home_APU_Package                    ; 53 "Home"
#_0C816C: dw Pascal_APU_Package                  ; 54 "Pascal's Theme"
#_0C816E: dw NaturalCyborgKiller_APU_Package     ; 55 Unused song
#_0C8170: dw GameOver_APU_Package                ; 56 "Game Over"
#_0C8172: dw Terminal_APU_Package                ; 57 "Terminal"
#_0C8174: dw Epilogue_APU_Package                ; 58 "Epilogue"
#_0C8176: dw Ginza_APU_Package                   ; 59 "Ginza"
#_0C8178: dw Ginza_APU_Package                   ; 5A "Ginza"
#_0C817A: dw Ginza_APU_Package                   ; 5B "Ginza"
#_0C817C: dw Ginza_APU_Package                   ; 5C "Ginza"
#_0C817E: dw Opening_APU_Package                 ; 5D "Title" - opening
#_0C8180: dw Title_APU_Package                   ; 5E Title screen
#_0C8182: dw Ending_APU_Package                  ; 5F "Ending"

;===================================================================================================

; TODO look at both songs one is probably fusion
Jakyou_APU_Package:
#_0C8184: dd Jakyou_SPC_Data
#_0C8188: dd Fusion_SPC_Data
#_0C818C: dd Sample_0DAA3A
#_0C8190: dd Sample_0DA90D
#_0C8194: dw $0000

Law_APU_Package:
#_0C8196: dd Law_SPC_Data
#_0C819A: dd Sample_0DBDD9
#_0C819E: dd Sample_0DDAB1
#_0C81A2: dw $0000

Chaos_APU_Package:
#_0C81A4: dd Chaos_SPC_Data
#_0C81A8: dd Sample_0DBDD9
#_0C81AC: dd Sample_0DDAB1
#_0C81B0: dw $0000

Neutral_APU_Package:
#_0C81B2: dd Neutral_SPC_Data
#_0C81B6: dd Sample_0DBDD9
#_0C81BA: dw $0000

Ginza_APU_Package:
#_0C81BC: dd Ginza_SPC_Data
#_0C81C0: dd Sample_0D88E4
#_0C81C4: dd Sample_0D883E
#_0C81C8: dw $0000

Cathedral_APU_Package:
#_0C81CA: dd Cathedral_SPC_Data
#_0C81CE: dd Sample_0DBDD9
#_0C81D2: dw $0000

Shibuya_APU_Package:
#_0C81D4: dd Shibuya_SPC_Data
#_0C81D8: dd Sample_0DB353
#_0C81DC: dd Sample_0DBDD9
#_0C81E0: dd Sample_0DB9E1
#_0C81E4: dw $0000

Shitenou_APU_Package:
#_0C81E6: dd Shitenou_SPC_Data
#_0C81EA: dd Sample_0DA774
#_0C81EE: dd Sample_0DBDD9
#_0C81F2: dw $0000

Embassy_APU_Package:
#_0C81F4: dd Embassy_SPC_Data
#_0C81F8: dd Sample_0D8A11
#_0C81FC: dw $0000

Arcade_APU_Package:
#_0C81FE: dd Arcade_SPC_Data
#_0C8202: dd Sample_0D8000
#_0C8206: dd Sample_0DA774
#_0C820A: dw $0000

Kichijoi_APU_Package:
#_0C820C: dd Kichijoi_SPC_Data
#_0C8210: dd Sample_0DB1C8
#_0C8214: dd Sample_0E8000
#_0C8218: dw $0000

Ruins_APU_Package:
#_0C821A: dd Ruins_SPC_Data
#_0C821E: dd Sample_0D8A11
#_0C8222: dd Sample_0DA774
#_0C8226: dw $0000

Shop_APU_Package:
#_0C8228: dd Shop_SPC_Data
#_0C822C: dd Sample_0DB2F5
#_0C8230: dd Sample_0DEB29
#_0C8234: dw $0000

Boss_APU_Package:
#_0C8236: dd Boss_SPC_Data
#_0C823A: dd Sample_0D8A66
#_0C823E: dd Sample_0DB353
#_0C8242: dw $0000

Dream_APU_Package:
#_0C8244: dd Dream_SPC_Data
#_0C8248: dw $0000

Home_APU_Package:
#_0C824A: dd Home_SPC_Data
#_0C824E: dd Sample_0D8000
#_0C8252: dd Sample_0D8A11
#_0C8256: dw $0000

Pascal_APU_Package:
#_0C8258: dd Pascal_SPC_Data
#_0C825C: dd Sample_0D8A11
#_0C8260: dd Sample_0DA774
#_0C8264: dw $0000

NaturalCyborgKiller_APU_Package:
#_0C8266: dd NaturalCyborgKiller_SPC_Data
#_0C826A: dd Sample_0EA3BC
#_0C826E: dd Sample_0D8A66
#_0C8272: dw $0000

GameOver_APU_Package:
#_0C8274: dd Gameover_SPC_Data
#_0C8278: dd Sample_0D8000
#_0C827C: dd Sample_0DBDD9
#_0C8280: dw $0000

Terminal_APU_Package:
#_0C8282: dd Terminal_SPC_Data
#_0C8286: dw $0000

Epilogue_APU_Package:
#_0C8288: dd Epilogue_SPC_Data
#_0C828C: dd Sample_0DBDD9
#_0C8290: dd Sample_0DDAB1
#_0C8294: dd Sample_0D8000
#_0C8298: dd Sample_0DA774
#_0C829C: dw $0000

Opening_APU_Package:
#_0C829E: dd Opening_SPC_Data
#_0C82A2: dd Sample_0DBDD9
#_0C82A6: dw $0000

Title_APU_Package:
#_0C82A8: dd Title_SPC_Data
#_0C82AC: dd Sample_0DAACE
#_0C82B0: dw $0000

Ending_APU_Package:
#_0C82B2: dd Ending_SPC_Data
#_0C82B6: dd Sample_0D8000
#_0C82BA: dd Sample_0D8A11
#_0C82BE: dd Sample_0DB9E1
#_0C82C2: dd Sample_0DBDD9
#_0C82C6: dd Sample_0DA774
#_0C82CA: dw $0000

;===================================================================================================
; 
;===================================================================================================
Jakyou_SPC_Data:
#_0C82CC: dw $036F, $0000

SONG_JAKYOU:
#_0C82D0: #_JAKYOU_7800: db $F1, $00 ; Set control
#_0C82D2: #_JAKYOU_7802: db $00 : dw JAKYOU_SEGMENT_781B ; Music channel 0
#_0C82D5: #_JAKYOU_7805: db $01 : dw JAKYOU_SEGMENT_791D ; Music channel 1
#_0C82D8: #_JAKYOU_7808: db $02 : dw JAKYOU_SEGMENT_7923 ; Music channel 2
#_0C82DB: #_JAKYOU_780B: db $03 : dw JAKYOU_SEGMENT_79A9 ; Music channel 3
#_0C82DE: #_JAKYOU_780E: db $04 : dw JAKYOU_SEGMENT_7AAE ; Music channel 4
#_0C82E1: #_JAKYOU_7811: db $05 : dw JAKYOU_SEGMENT_7ABB ; Music channel 5
#_0C82E4: #_JAKYOU_7814: db $06 : dw JAKYOU_SEGMENT_7A2B ; Music channel 6
#_0C82E7: #_JAKYOU_7817: db $07 : dw JAKYOU_SEGMENT_7AC8 ; Music channel 7
#_0C82EA: #_JAKYOU_781A: db $FF ; end of header

JAKYOU_SEGMENT_781B:
#_0C82EB: #_JAKYOU_781B: db $72 ; vol 0x12

JAKYOU_SEGMENT_781C:
#_0C82EC: #_JAKYOU_781C: db $F2, $6A ; set panning
#_0C82EE: #_JAKYOU_781E: db $F0, $FE, $E2 ; set ADSR

JAKYOU_SEGMENT_7821:
#_0C82F1: #_JAKYOU_7821: db $F1, $08 ; set SRCN
#_0C82F3: #_JAKYOU_7823: db $FB, $30 ; set note length page
#_0C82F5: #_JAKYOU_7825: db $F3, $00 ; transpose +0
#_0C82F7: #_JAKYOU_7827: db $86 ; dur 0x06

JAKYOU_SEGMENT_7828:
#_0C82F8: #_JAKYOU_7828: db $1A ; play note D4
#_0C82F9: #_JAKYOU_7829: db $1D ; play note F4
#_0C82FA: #_JAKYOU_782A: db $22 ; play note As4
#_0C82FB: #_JAKYOU_782B: db $19 ; play note Cs4
#_0C82FC: #_JAKYOU_782C: db $21 ; play note A4
#_0C82FD: #_JAKYOU_782D: db $1C ; play note E4
#_0C82FE: #_JAKYOU_782E: db $1F ; play note G4
#_0C82FF: #_JAKYOU_782F: db $1A ; play note D4
#_0C8300: #_JAKYOU_7830: db $1D ; play note F4
#_0C8301: #_JAKYOU_7831: db $1A ; play note D4
#_0C8302: #_JAKYOU_7832: db $1F ; play note G4
#_0C8303: #_JAKYOU_7833: db $1C ; play note E4
#_0C8304: #_JAKYOU_7834: db $1D ; play note F4
#_0C8305: #_JAKYOU_7835: db $1A ; play note D4
#_0C8306: #_JAKYOU_7836: db $1C ; play note E4
#_0C8307: #_JAKYOU_7837: db $19 ; play note Cs4
#_0C8308: #_JAKYOU_7838: db $1D ; play note F4
#_0C8309: #_JAKYOU_7839: db $1A ; play note D4
#_0C830A: #_JAKYOU_783A: db $1F ; play note G4
#_0C830B: #_JAKYOU_783B: db $1C ; play note E4
#_0C830C: #_JAKYOU_783C: db $21 ; play note A4
#_0C830D: #_JAKYOU_783D: db $1D ; play note F4
#_0C830E: #_JAKYOU_783E: db $1F ; play note G4
#_0C830F: #_JAKYOU_783F: db $1C ; play note E4
#_0C8310: #_JAKYOU_7840: db $1D ; play note F4
#_0C8311: #_JAKYOU_7841: db $1A ; play note D4
#_0C8312: #_JAKYOU_7842: db $1F ; play note G4
#_0C8313: #_JAKYOU_7843: db $1C ; play note E4
#_0C8314: #_JAKYOU_7844: db $1D ; play note F4
#_0C8315: #_JAKYOU_7845: db $1A ; play note D4
#_0C8316: #_JAKYOU_7846: db $1C ; play note E4
#_0C8317: #_JAKYOU_7847: db $19 ; play note Cs4
#_0C8318: #_JAKYOU_7848: db $1A ; play note D4
#_0C8319: #_JAKYOU_7849: db $1D ; play note F4
#_0C831A: #_JAKYOU_784A: db $22 ; play note As4
#_0C831B: #_JAKYOU_784B: db $24 ; play note C5
#_0C831C: #_JAKYOU_784C: db $22 ; play note As4
#_0C831D: #_JAKYOU_784D: db $21 ; play note A4
#_0C831E: #_JAKYOU_784E: db $1F ; play note G4
#_0C831F: #_JAKYOU_784F: db $22 ; play note As4
#_0C8320: #_JAKYOU_7850: db $21 ; play note A4
#_0C8321: #_JAKYOU_7851: db $1F ; play note G4
#_0C8322: #_JAKYOU_7852: db $1D ; play note F4
#_0C8323: #_JAKYOU_7853: db $21 ; play note A4
#_0C8324: #_JAKYOU_7854: db $1F ; play note G4
#_0C8325: #_JAKYOU_7855: db $1D ; play note F4
#_0C8326: #_JAKYOU_7856: db $1C ; play note E4
#_0C8327: #_JAKYOU_7857: db $1F ; play note G4
#_0C8328: #_JAKYOU_7858: db $1D ; play note F4
#_0C8329: #_JAKYOU_7859: db $1C ; play note E4
#_0C832A: #_JAKYOU_785A: db $1A ; play note D4
#_0C832B: #_JAKYOU_785B: db $1D ; play note F4
#_0C832C: #_JAKYOU_785C: db $1C ; play note E4
#_0C832D: #_JAKYOU_785D: db $1A ; play note D4
#_0C832E: #_JAKYOU_785E: db $19 ; play note Cs4
#_0C832F: #_JAKYOU_785F: db $1C ; play note E4
#_0C8330: #_JAKYOU_7860: db $1A ; play note D4
#_0C8331: #_JAKYOU_7861: db $19 ; play note Cs4
#_0C8332: #_JAKYOU_7862: db $1A ; play note D4
#_0C8333: #_JAKYOU_7863: db $1C ; play note E4
#_0C8334: #_JAKYOU_7864: db $1D ; play note F4
#_0C8335: #_JAKYOU_7865: db $1A ; play note D4
#_0C8336: #_JAKYOU_7866: db $1F ; play note G4
#_0C8337: #_JAKYOU_7867: db $1C ; play note E4
#_0C8338: #_JAKYOU_7868: db $1A ; play note D4
#_0C8339: #_JAKYOU_7869: db $1D ; play note F4
#_0C833A: #_JAKYOU_786A: db $22 ; play note As4
#_0C833B: #_JAKYOU_786B: db $24 ; play note C5
#_0C833C: #_JAKYOU_786C: db $22 ; play note As4
#_0C833D: #_JAKYOU_786D: db $21 ; play note A4
#_0C833E: #_JAKYOU_786E: db $1F ; play note G4
#_0C833F: #_JAKYOU_786F: db $22 ; play note As4
#_0C8340: #_JAKYOU_7870: db $21 ; play note A4
#_0C8341: #_JAKYOU_7871: db $1F ; play note G4
#_0C8342: #_JAKYOU_7872: db $1D ; play note F4
#_0C8343: #_JAKYOU_7873: db $21 ; play note A4
#_0C8344: #_JAKYOU_7874: db $1F ; play note G4
#_0C8345: #_JAKYOU_7875: db $1D ; play note F4
#_0C8346: #_JAKYOU_7876: db $1C ; play note E4
#_0C8347: #_JAKYOU_7877: db $1F ; play note G4
#_0C8348: #_JAKYOU_7878: db $1D ; play note F4
#_0C8349: #_JAKYOU_7879: db $1C ; play note E4
#_0C834A: #_JAKYOU_787A: db $1A ; play note D4
#_0C834B: #_JAKYOU_787B: db $1D ; play note F4
#_0C834C: #_JAKYOU_787C: db $1C ; play note E4
#_0C834D: #_JAKYOU_787D: db $1A ; play note D4
#_0C834E: #_JAKYOU_787E: db $19 ; play note Cs4
#_0C834F: #_JAKYOU_787F: db $1C ; play note E4
#_0C8350: #_JAKYOU_7880: db $E0, $04 ; set tempo
#_0C8352: #_JAKYOU_7882: db $1A ; play note D4
#_0C8353: #_JAKYOU_7883: db $E0, $08 ; set tempo
#_0C8355: #_JAKYOU_7885: db $15 ; play note A3
#_0C8356: #_JAKYOU_7886: db $E0, $0C ; set tempo
#_0C8358: #_JAKYOU_7888: db $16 ; play note As3
#_0C8359: #_JAKYOU_7889: db $E0, $10 ; set tempo
#_0C835B: #_JAKYOU_788B: db $13 ; play note G3
#_0C835C: #_JAKYOU_788C: db $E0, $18 ; set tempo
#_0C835E: #_JAKYOU_788E: db $8A ; dur 0x0A
#_0C835F: #_JAKYOU_788F: db $15 ; play note A3
#_0C8360: #_JAKYOU_7890: db $E0, $00 ; set tempo
#_0C8362: #_JAKYOU_7892: db $86 ; dur 0x06
#_0C8363: #_JAKYOU_7893: db $F4, $02 ; set loop point B
#_0C8365: #_JAKYOU_7895: db $21 ; play note A4
#_0C8366: #_JAKYOU_7896: db $1A ; play note D4
#_0C8367: #_JAKYOU_7897: db $1D ; play note F4
#_0C8368: #_JAKYOU_7898: db $22 ; play note As4
#_0C8369: #_JAKYOU_7899: db $19 ; play note Cs4
#_0C836A: #_JAKYOU_789A: db $1C ; play note E4
#_0C836B: #_JAKYOU_789B: db $21 ; play note A4
#_0C836C: #_JAKYOU_789C: db $19 ; play note Cs4
#_0C836D: #_JAKYOU_789D: db $1F ; play note G4
#_0C836E: #_JAKYOU_789E: db $16 ; play note As3
#_0C836F: #_JAKYOU_789F: db $1A ; play note D4
#_0C8370: #_JAKYOU_78A0: db $21 ; play note A4
#_0C8371: #_JAKYOU_78A1: db $19 ; play note Cs4
#_0C8372: #_JAKYOU_78A2: db $15 ; play note A3
#_0C8373: #_JAKYOU_78A3: db $1C ; play note E4
#_0C8374: #_JAKYOU_78A4: db $1F ; play note G4
#_0C8375: #_JAKYOU_78A5: db $21 ; play note A4
#_0C8376: #_JAKYOU_78A6: db $1A ; play note D4
#_0C8377: #_JAKYOU_78A7: db $1D ; play note F4
#_0C8378: #_JAKYOU_78A8: db $22 ; play note As4
#_0C8379: #_JAKYOU_78A9: db $19 ; play note Cs4
#_0C837A: #_JAKYOU_78AA: db $1C ; play note E4
#_0C837B: #_JAKYOU_78AB: db $21 ; play note A4
#_0C837C: #_JAKYOU_78AC: db $19 ; play note Cs4
#_0C837D: #_JAKYOU_78AD: db $16 ; play note As3
#_0C837E: #_JAKYOU_78AE: db $1A ; play note D4
#_0C837F: #_JAKYOU_78AF: db $24 ; play note C5
#_0C8380: #_JAKYOU_78B0: db $22 ; play note As4
#_0C8381: #_JAKYOU_78B1: db $21 ; play note A4
#_0C8382: #_JAKYOU_78B2: db $19 ; play note Cs4
#_0C8383: #_JAKYOU_78B3: db $1C ; play note E4
#_0C8384: #_JAKYOU_78B4: db $21 ; play note A4
#_0C8385: #_JAKYOU_78B5: db $22 ; play note As4
#_0C8386: #_JAKYOU_78B6: db $1A ; play note D4
#_0C8387: #_JAKYOU_78B7: db $24 ; play note C5
#_0C8388: #_JAKYOU_78B8: db $22 ; play note As4
#_0C8389: #_JAKYOU_78B9: db $21 ; play note A4
#_0C838A: #_JAKYOU_78BA: db $22 ; play note As4
#_0C838B: #_JAKYOU_78BB: db $1F ; play note G4
#_0C838C: #_JAKYOU_78BC: db $21 ; play note A4
#_0C838D: #_JAKYOU_78BD: db $1F ; play note G4
#_0C838E: #_JAKYOU_78BE: db $22 ; play note As4
#_0C838F: #_JAKYOU_78BF: db $21 ; play note A4
#_0C8390: #_JAKYOU_78C0: db $1F ; play note G4
#_0C8391: #_JAKYOU_78C1: db $1D ; play note F4
#_0C8392: #_JAKYOU_78C2: db $15 ; play note A3
#_0C8393: #_JAKYOU_78C3: db $1A ; play note D4
#_0C8394: #_JAKYOU_78C4: db $21 ; play note A4
#_0C8395: #_JAKYOU_78C5: db $1F ; play note G4
#_0C8396: #_JAKYOU_78C6: db $19 ; play note Cs4
#_0C8397: #_JAKYOU_78C7: db $22 ; play note As4
#_0C8398: #_JAKYOU_78C8: db $21 ; play note A4
#_0C8399: #_JAKYOU_78C9: db $1D ; play note F4
#_0C839A: #_JAKYOU_78CA: db $15 ; play note A3
#_0C839B: #_JAKYOU_78CB: db $1A ; play note D4
#_0C839C: #_JAKYOU_78CC: db $21 ; play note A4
#_0C839D: #_JAKYOU_78CD: db $1C ; play note E4
#_0C839E: #_JAKYOU_78CE: db $1D ; play note F4
#_0C839F: #_JAKYOU_78CF: db $1F ; play note G4
#_0C83A0: #_JAKYOU_78D0: db $20 ; play note Gs4
#_0C83A1: #_JAKYOU_78D1: db $21 ; play note A4
#_0C83A2: #_JAKYOU_78D2: db $19 ; play note Cs4
#_0C83A3: #_JAKYOU_78D3: db $15 ; play note A3
#_0C83A4: #_JAKYOU_78D4: db $21 ; play note A4
#_0C83A5: #_JAKYOU_78D5: db $F5 ; run loop B
#_0C83A6: #_JAKYOU_78D6: db $F4, $02 ; set loop point B
#_0C83A8: #_JAKYOU_78D8: db $1D ; play note F4
#_0C83A9: #_JAKYOU_78D9: db $31 ; tie
#_0C83AA: #_JAKYOU_78DA: db $1F ; play note G4
#_0C83AB: #_JAKYOU_78DB: db $31 ; tie
#_0C83AC: #_JAKYOU_78DC: db $22 ; play note As4
#_0C83AD: #_JAKYOU_78DD: db $21 ; play note A4
#_0C83AE: #_JAKYOU_78DE: db $1F ; play note G4
#_0C83AF: #_JAKYOU_78DF: db $1D ; play note F4
#_0C83B0: #_JAKYOU_78E0: db $21 ; play note A4
#_0C83B1: #_JAKYOU_78E1: db $22 ; play note As4
#_0C83B2: #_JAKYOU_78E2: db $24 ; play note C5
#_0C83B3: #_JAKYOU_78E3: db $22 ; play note As4
#_0C83B4: #_JAKYOU_78E4: db $21 ; play note A4
#_0C83B5: #_JAKYOU_78E5: db $1F ; play note G4
#_0C83B6: #_JAKYOU_78E6: db $1D ; play note F4
#_0C83B7: #_JAKYOU_78E7: db $21 ; play note A4
#_0C83B8: #_JAKYOU_78E8: db $1F ; play note G4
#_0C83B9: #_JAKYOU_78E9: db $31 ; tie
#_0C83BA: #_JAKYOU_78EA: db $1C ; play note E4
#_0C83BB: #_JAKYOU_78EB: db $31 ; tie
#_0C83BC: #_JAKYOU_78EC: db $19 ; play note Cs4
#_0C83BD: #_JAKYOU_78ED: db $22 ; play note As4
#_0C83BE: #_JAKYOU_78EE: db $21 ; play note A4
#_0C83BF: #_JAKYOU_78EF: db $1F ; play note G4
#_0C83C0: #_JAKYOU_78F0: db $1D ; play note F4
#_0C83C1: #_JAKYOU_78F1: db $1C ; play note E4
#_0C83C2: #_JAKYOU_78F2: db $1D ; play note F4
#_0C83C3: #_JAKYOU_78F3: db $1F ; play note G4
#_0C83C4: #_JAKYOU_78F4: db $1D ; play note F4
#_0C83C5: #_JAKYOU_78F5: db $1C ; play note E4
#_0C83C6: #_JAKYOU_78F6: db $1A ; play note D4
#_0C83C7: #_JAKYOU_78F7: db $18 ; play note C4
#_0C83C8: #_JAKYOU_78F8: db $16 ; play note As3
#_0C83C9: #_JAKYOU_78F9: db $1F ; play note G4
#_0C83CA: #_JAKYOU_78FA: db $1C ; play note E4
#_0C83CB: #_JAKYOU_78FB: db $1D ; play note F4
#_0C83CC: #_JAKYOU_78FC: db $1A ; play note D4
#_0C83CD: #_JAKYOU_78FD: db $1C ; play note E4
#_0C83CE: #_JAKYOU_78FE: db $18 ; play note C4
#_0C83CF: #_JAKYOU_78FF: db $1A ; play note D4
#_0C83D0: #_JAKYOU_7900: db $16 ; play note As3
#_0C83D1: #_JAKYOU_7901: db $21 ; play note A4
#_0C83D2: #_JAKYOU_7902: db $1D ; play note F4
#_0C83D3: #_JAKYOU_7903: db $1F ; play note G4
#_0C83D4: #_JAKYOU_7904: db $1C ; play note E4
#_0C83D5: #_JAKYOU_7905: db $1D ; play note F4
#_0C83D6: #_JAKYOU_7906: db $1A ; play note D4
#_0C83D7: #_JAKYOU_7907: db $1C ; play note E4
#_0C83D8: #_JAKYOU_7908: db $19 ; play note Cs4
#_0C83D9: #_JAKYOU_7909: db $21 ; play note A4
#_0C83DA: #_JAKYOU_790A: db $1F ; play note G4
#_0C83DB: #_JAKYOU_790B: db $21 ; play note A4
#_0C83DC: #_JAKYOU_790C: db $1D ; play note F4
#_0C83DD: #_JAKYOU_790D: db $21 ; play note A4
#_0C83DE: #_JAKYOU_790E: db $1C ; play note E4
#_0C83DF: #_JAKYOU_790F: db $21 ; play note A4
#_0C83E0: #_JAKYOU_7910: db $19 ; play note Cs4
#_0C83E1: #_JAKYOU_7911: db $1F ; play note G4
#_0C83E2: #_JAKYOU_7912: db $1C ; play note E4
#_0C83E3: #_JAKYOU_7913: db $22 ; play note As4
#_0C83E4: #_JAKYOU_7914: db $21 ; play note A4
#_0C83E5: #_JAKYOU_7915: db $1D ; play note F4
#_0C83E6: #_JAKYOU_7916: db $1F ; play note G4
#_0C83E7: #_JAKYOU_7917: db $1C ; play note E4
#_0C83E8: #_JAKYOU_7918: db $F5 ; run loop B
#_0C83E9: #_JAKYOU_7919: db $F8 : dw JAKYOU_SEGMENT_7828 ; goto location
#_0C83EC: #_JAKYOU_791C: db $FF ; end track

JAKYOU_SEGMENT_791D:
#_0C83ED: #_JAKYOU_791D: db $62 ; vol 0x02
#_0C83EE: #_JAKYOU_791E: db $F9, $20 ; set fine tuning
#_0C83F0: #_JAKYOU_7920: db $F8 : dw JAKYOU_SEGMENT_781C ; goto location

JAKYOU_SEGMENT_7923:
#_0C83F3: #_JAKYOU_7923: db $F0, $FE, $E2 ; set ADSR
#_0C83F6: #_JAKYOU_7926: db $F2, $6A ; set panning

JAKYOU_SEGMENT_7928:
#_0C83F8: #_JAKYOU_7928: db $70 ; vol 0x10
#_0C83F9: #_JAKYOU_7929: db $FB, $30 ; set note length page
#_0C83FB: #_JAKYOU_792B: db $8C ; dur 0x0C
#_0C83FC: #_JAKYOU_792C: db $30 ; rest
#_0C83FD: #_JAKYOU_792D: db $30 ; rest
#_0C83FE: #_JAKYOU_792E: db $30 ; rest
#_0C83FF: #_JAKYOU_792F: db $30 ; rest
#_0C8400: #_JAKYOU_7930: db $30 ; rest
#_0C8401: #_JAKYOU_7931: db $30 ; rest
#_0C8402: #_JAKYOU_7932: db $30 ; rest
#_0C8403: #_JAKYOU_7933: db $30 ; rest
#_0C8404: #_JAKYOU_7934: db $F1, $08 ; set SRCN
#_0C8406: #_JAKYOU_7936: db $1A ; play note D4
#_0C8407: #_JAKYOU_7937: db $18 ; play note C4
#_0C8408: #_JAKYOU_7938: db $8A ; dur 0x0A
#_0C8409: #_JAKYOU_7939: db $1D ; play note F4
#_0C840A: #_JAKYOU_793A: db $1C ; play note E4
#_0C840B: #_JAKYOU_793B: db $8C ; dur 0x0C
#_0C840C: #_JAKYOU_793C: db $1A ; play note D4

JAKYOU_SEGMENT_793D:
#_0C840D: #_JAKYOU_793D: db $8C ; dur 0x0C
#_0C840E: #_JAKYOU_793E: db $30 ; rest
#_0C840F: #_JAKYOU_793F: db $30 ; rest
#_0C8410: #_JAKYOU_7940: db $30 ; rest
#_0C8411: #_JAKYOU_7941: db $30 ; rest
#_0C8412: #_JAKYOU_7942: db $29 ; play note F5
#_0C8413: #_JAKYOU_7943: db $8A ; dur 0x0A
#_0C8414: #_JAKYOU_7944: db $28 ; play note E5
#_0C8415: #_JAKYOU_7945: db $26 ; play note D5
#_0C8416: #_JAKYOU_7946: db $25 ; play note Cs5
#_0C8417: #_JAKYOU_7947: db $26 ; play note D5
#_0C8418: #_JAKYOU_7948: db $28 ; play note E5
#_0C8419: #_JAKYOU_7949: db $25 ; play note Cs5
#_0C841A: #_JAKYOU_794A: db $8A ; dur 0x0A
#_0C841B: #_JAKYOU_794B: db $1A ; play note D4
#_0C841C: #_JAKYOU_794C: db $30 ; rest
#_0C841D: #_JAKYOU_794D: db $1D ; play note F4
#_0C841E: #_JAKYOU_794E: db $30 ; rest
#_0C841F: #_JAKYOU_794F: db $1A ; play note D4
#_0C8420: #_JAKYOU_7950: db $30 ; rest
#_0C8421: #_JAKYOU_7951: db $1D ; play note F4
#_0C8422: #_JAKYOU_7952: db $1C ; play note E4
#_0C8423: #_JAKYOU_7953: db $22 ; play note As4
#_0C8424: #_JAKYOU_7954: db $21 ; play note A4
#_0C8425: #_JAKYOU_7955: db $1F ; play note G4
#_0C8426: #_JAKYOU_7956: db $21 ; play note A4
#_0C8427: #_JAKYOU_7957: db $1F ; play note G4
#_0C8428: #_JAKYOU_7958: db $1D ; play note F4
#_0C8429: #_JAKYOU_7959: db $1C ; play note E4
#_0C842A: #_JAKYOU_795A: db $21 ; play note A4
#_0C842B: #_JAKYOU_795B: db $8C ; dur 0x0C
#_0C842C: #_JAKYOU_795C: db $1D ; play note F4
#_0C842D: #_JAKYOU_795D: db $21 ; play note A4
#_0C842E: #_JAKYOU_795E: db $1F ; play note G4
#_0C842F: #_JAKYOU_795F: db $1D ; play note F4
#_0C8430: #_JAKYOU_7960: db $1D ; play note F4
#_0C8431: #_JAKYOU_7961: db $1F ; play note G4
#_0C8432: #_JAKYOU_7962: db $1C ; play note E4
#_0C8433: #_JAKYOU_7963: db $21 ; play note A4
#_0C8434: #_JAKYOU_7964: db $88 ; dur 0x08
#_0C8435: #_JAKYOU_7965: db $22 ; play note As4
#_0C8436: #_JAKYOU_7966: db $24 ; play note C5
#_0C8437: #_JAKYOU_7967: db $22 ; play note As4
#_0C8438: #_JAKYOU_7968: db $1F ; play note G4
#_0C8439: #_JAKYOU_7969: db $8C ; dur 0x0C
#_0C843A: #_JAKYOU_796A: db $21 ; play note A4
#_0C843B: #_JAKYOU_796B: db $88 ; dur 0x08
#_0C843C: #_JAKYOU_796C: db $1F ; play note G4
#_0C843D: #_JAKYOU_796D: db $21 ; play note A4
#_0C843E: #_JAKYOU_796E: db $1D ; play note F4
#_0C843F: #_JAKYOU_796F: db $1C ; play note E4
#_0C8440: #_JAKYOU_7970: db $8C ; dur 0x0C
#_0C8441: #_JAKYOU_7971: db $1D ; play note F4
#_0C8442: #_JAKYOU_7972: db $8A ; dur 0x0A
#_0C8443: #_JAKYOU_7973: db $22 ; play note As4
#_0C8444: #_JAKYOU_7974: db $21 ; play note A4
#_0C8445: #_JAKYOU_7975: db $1F ; play note G4
#_0C8446: #_JAKYOU_7976: db $1D ; play note F4
#_0C8447: #_JAKYOU_7977: db $25 ; play note Cs5
#_0C8448: #_JAKYOU_7978: db $21 ; play note A4
#_0C8449: #_JAKYOU_7979: db $1F ; play note G4
#_0C844A: #_JAKYOU_797A: db $21 ; play note A4
#_0C844B: #_JAKYOU_797B: db $86 ; dur 0x06
#_0C844C: #_JAKYOU_797C: db $1D ; play note F4
#_0C844D: #_JAKYOU_797D: db $30 ; rest
#_0C844E: #_JAKYOU_797E: db $22 ; play note As4
#_0C844F: #_JAKYOU_797F: db $30 ; rest
#_0C8450: #_JAKYOU_7980: db $21 ; play note A4
#_0C8451: #_JAKYOU_7981: db $30 ; rest
#_0C8452: #_JAKYOU_7982: db $1F ; play note G4
#_0C8453: #_JAKYOU_7983: db $30 ; rest
#_0C8454: #_JAKYOU_7984: db $1D ; play note F4
#_0C8455: #_JAKYOU_7985: db $30 ; rest
#_0C8456: #_JAKYOU_7986: db $1C ; play note E4
#_0C8457: #_JAKYOU_7987: db $30 ; rest
#_0C8458: #_JAKYOU_7988: db $1D ; play note F4
#_0C8459: #_JAKYOU_7989: db $30 ; rest
#_0C845A: #_JAKYOU_798A: db $1C ; play note E4
#_0C845B: #_JAKYOU_798B: db $30 ; rest
#_0C845C: #_JAKYOU_798C: db $8A ; dur 0x0A
#_0C845D: #_JAKYOU_798D: db $1D ; play note F4
#_0C845E: #_JAKYOU_798E: db $21 ; play note A4
#_0C845F: #_JAKYOU_798F: db $1D ; play note F4
#_0C8460: #_JAKYOU_7990: db $21 ; play note A4
#_0C8461: #_JAKYOU_7991: db $8A ; dur 0x0A
#_0C8462: #_JAKYOU_7992: db $22 ; play note As4
#_0C8463: #_JAKYOU_7993: db $1F ; play note G4
#_0C8464: #_JAKYOU_7994: db $21 ; play note A4
#_0C8465: #_JAKYOU_7995: db $1D ; play note F4
#_0C8466: #_JAKYOU_7996: db $1D ; play note F4
#_0C8467: #_JAKYOU_7997: db $1C ; play note E4
#_0C8468: #_JAKYOU_7998: db $88 ; dur 0x08
#_0C8469: #_JAKYOU_7999: db $1A ; play note D4
#_0C846A: #_JAKYOU_799A: db $1C ; play note E4
#_0C846B: #_JAKYOU_799B: db $1D ; play note F4
#_0C846C: #_JAKYOU_799C: db $21 ; play note A4
#_0C846D: #_JAKYOU_799D: db $8A ; dur 0x0A
#_0C846E: #_JAKYOU_799E: db $22 ; play note As4
#_0C846F: #_JAKYOU_799F: db $1F ; play note G4
#_0C8470: #_JAKYOU_79A0: db $21 ; play note A4
#_0C8471: #_JAKYOU_79A1: db $1D ; play note F4
#_0C8472: #_JAKYOU_79A2: db $1D ; play note F4
#_0C8473: #_JAKYOU_79A3: db $1C ; play note E4
#_0C8474: #_JAKYOU_79A4: db $8C ; dur 0x0C
#_0C8475: #_JAKYOU_79A5: db $1A ; play note D4
#_0C8476: #_JAKYOU_79A6: db $F8 : dw JAKYOU_SEGMENT_793D ; goto location

JAKYOU_SEGMENT_79A9:
#_0C8479: #_JAKYOU_79A9: db $62 ; vol 0x02
#_0C847A: #_JAKYOU_79AA: db $FB, $30 ; set note length page
#_0C847C: #_JAKYOU_79AC: db $8C ; dur 0x0C
#_0C847D: #_JAKYOU_79AD: db $30 ; rest
#_0C847E: #_JAKYOU_79AE: db $30 ; rest
#_0C847F: #_JAKYOU_79AF: db $30 ; rest
#_0C8480: #_JAKYOU_79B0: db $30 ; rest
#_0C8481: #_JAKYOU_79B1: db $30 ; rest
#_0C8482: #_JAKYOU_79B2: db $30 ; rest
#_0C8483: #_JAKYOU_79B3: db $30 ; rest
#_0C8484: #_JAKYOU_79B4: db $30 ; rest
#_0C8485: #_JAKYOU_79B5: db $F0, $FE, $E2 ; set ADSR
#_0C8488: #_JAKYOU_79B8: db $F1, $08 ; set SRCN
#_0C848A: #_JAKYOU_79BA: db $F2, $6A ; set panning
#_0C848C: #_JAKYOU_79BC: db $16 ; play note As3
#_0C848D: #_JAKYOU_79BD: db $15 ; play note A3
#_0C848E: #_JAKYOU_79BE: db $8A ; dur 0x0A
#_0C848F: #_JAKYOU_79BF: db $1A ; play note D4
#_0C8490: #_JAKYOU_79C0: db $19 ; play note Cs4
#_0C8491: #_JAKYOU_79C1: db $8C ; dur 0x0C
#_0C8492: #_JAKYOU_79C2: db $15 ; play note A3

JAKYOU_SEGMENT_79C3:
#_0C8493: #_JAKYOU_79C3: db $8C ; dur 0x0C
#_0C8494: #_JAKYOU_79C4: db $30 ; rest
#_0C8495: #_JAKYOU_79C5: db $30 ; rest
#_0C8496: #_JAKYOU_79C6: db $30 ; rest
#_0C8497: #_JAKYOU_79C7: db $30 ; rest
#_0C8498: #_JAKYOU_79C8: db $30 ; rest
#_0C8499: #_JAKYOU_79C9: db $30 ; rest
#_0C849A: #_JAKYOU_79CA: db $30 ; rest
#_0C849B: #_JAKYOU_79CB: db $30 ; rest
#_0C849C: #_JAKYOU_79CC: db $8A ; dur 0x0A
#_0C849D: #_JAKYOU_79CD: db $15 ; play note A3
#_0C849E: #_JAKYOU_79CE: db $30 ; rest
#_0C849F: #_JAKYOU_79CF: db $1A ; play note D4
#_0C84A0: #_JAKYOU_79D0: db $30 ; rest
#_0C84A1: #_JAKYOU_79D1: db $15 ; play note A3
#_0C84A2: #_JAKYOU_79D2: db $30 ; rest
#_0C84A3: #_JAKYOU_79D3: db $1A ; play note D4
#_0C84A4: #_JAKYOU_79D4: db $19 ; play note Cs4
#_0C84A5: #_JAKYOU_79D5: db $1D ; play note F4
#_0C84A6: #_JAKYOU_79D6: db $31 ; tie
#_0C84A7: #_JAKYOU_79D7: db $1C ; play note E4
#_0C84A8: #_JAKYOU_79D8: db $1D ; play note F4
#_0C84A9: #_JAKYOU_79D9: db $1C ; play note E4
#_0C84AA: #_JAKYOU_79DA: db $1A ; play note D4
#_0C84AB: #_JAKYOU_79DB: db $19 ; play note Cs4
#_0C84AC: #_JAKYOU_79DC: db $1C ; play note E4
#_0C84AD: #_JAKYOU_79DD: db $8C ; dur 0x0C
#_0C84AE: #_JAKYOU_79DE: db $18 ; play note C4
#_0C84AF: #_JAKYOU_79DF: db $1D ; play note F4
#_0C84B0: #_JAKYOU_79E0: db $1C ; play note E4
#_0C84B1: #_JAKYOU_79E1: db $1A ; play note D4
#_0C84B2: #_JAKYOU_79E2: db $1A ; play note D4
#_0C84B3: #_JAKYOU_79E3: db $31 ; tie
#_0C84B4: #_JAKYOU_79E4: db $19 ; play note Cs4
#_0C84B5: #_JAKYOU_79E5: db $1C ; play note E4
#_0C84B6: #_JAKYOU_79E6: db $88 ; dur 0x08
#_0C84B7: #_JAKYOU_79E7: db $1D ; play note F4
#_0C84B8: #_JAKYOU_79E8: db $1F ; play note G4
#_0C84B9: #_JAKYOU_79E9: db $1D ; play note F4
#_0C84BA: #_JAKYOU_79EA: db $1A ; play note D4
#_0C84BB: #_JAKYOU_79EB: db $8C ; dur 0x0C
#_0C84BC: #_JAKYOU_79EC: db $1D ; play note F4
#_0C84BD: #_JAKYOU_79ED: db $88 ; dur 0x08
#_0C84BE: #_JAKYOU_79EE: db $1C ; play note E4
#_0C84BF: #_JAKYOU_79EF: db $1C ; play note E4
#_0C84C0: #_JAKYOU_79F0: db $19 ; play note Cs4
#_0C84C1: #_JAKYOU_79F1: db $19 ; play note Cs4
#_0C84C2: #_JAKYOU_79F2: db $8C ; dur 0x0C
#_0C84C3: #_JAKYOU_79F3: db $1A ; play note D4
#_0C84C4: #_JAKYOU_79F4: db $8A ; dur 0x0A
#_0C84C5: #_JAKYOU_79F5: db $1D ; play note F4
#_0C84C6: #_JAKYOU_79F6: db $31 ; tie
#_0C84C7: #_JAKYOU_79F7: db $1A ; play note D4
#_0C84C8: #_JAKYOU_79F8: db $31 ; tie
#_0C84C9: #_JAKYOU_79F9: db $1F ; play note G4
#_0C84CA: #_JAKYOU_79FA: db $1C ; play note E4
#_0C84CB: #_JAKYOU_79FB: db $19 ; play note Cs4
#_0C84CC: #_JAKYOU_79FC: db $1C ; play note E4
#_0C84CD: #_JAKYOU_79FD: db $86 ; dur 0x06
#_0C84CE: #_JAKYOU_79FE: db $1A ; play note D4
#_0C84CF: #_JAKYOU_79FF: db $30 ; rest
#_0C84D0: #_JAKYOU_7A00: db $1D ; play note F4
#_0C84D1: #_JAKYOU_7A01: db $30 ; rest
#_0C84D2: #_JAKYOU_7A02: db $1D ; play note F4
#_0C84D3: #_JAKYOU_7A03: db $30 ; rest
#_0C84D4: #_JAKYOU_7A04: db $1C ; play note E4
#_0C84D5: #_JAKYOU_7A05: db $30 ; rest
#_0C84D6: #_JAKYOU_7A06: db $1A ; play note D4
#_0C84D7: #_JAKYOU_7A07: db $30 ; rest
#_0C84D8: #_JAKYOU_7A08: db $1C ; play note E4
#_0C84D9: #_JAKYOU_7A09: db $30 ; rest
#_0C84DA: #_JAKYOU_7A0A: db $1A ; play note D4
#_0C84DB: #_JAKYOU_7A0B: db $30 ; rest
#_0C84DC: #_JAKYOU_7A0C: db $19 ; play note Cs4
#_0C84DD: #_JAKYOU_7A0D: db $30 ; rest
#_0C84DE: #_JAKYOU_7A0E: db $8A ; dur 0x0A
#_0C84DF: #_JAKYOU_7A0F: db $1A ; play note D4
#_0C84E0: #_JAKYOU_7A10: db $1D ; play note F4
#_0C84E1: #_JAKYOU_7A11: db $1A ; play note D4
#_0C84E2: #_JAKYOU_7A12: db $1C ; play note E4
#_0C84E3: #_JAKYOU_7A13: db $8A ; dur 0x0A
#_0C84E4: #_JAKYOU_7A14: db $1D ; play note F4
#_0C84E5: #_JAKYOU_7A15: db $1A ; play note D4
#_0C84E6: #_JAKYOU_7A16: db $1D ; play note F4
#_0C84E7: #_JAKYOU_7A17: db $1A ; play note D4
#_0C84E8: #_JAKYOU_7A18: db $1A ; play note D4
#_0C84E9: #_JAKYOU_7A19: db $19 ; play note Cs4
#_0C84EA: #_JAKYOU_7A1A: db $88 ; dur 0x08
#_0C84EB: #_JAKYOU_7A1B: db $15 ; play note A3
#_0C84EC: #_JAKYOU_7A1C: db $19 ; play note Cs4
#_0C84ED: #_JAKYOU_7A1D: db $1A ; play note D4
#_0C84EE: #_JAKYOU_7A1E: db $1C ; play note E4
#_0C84EF: #_JAKYOU_7A1F: db $8A ; dur 0x0A
#_0C84F0: #_JAKYOU_7A20: db $1D ; play note F4
#_0C84F1: #_JAKYOU_7A21: db $1A ; play note D4
#_0C84F2: #_JAKYOU_7A22: db $1D ; play note F4
#_0C84F3: #_JAKYOU_7A23: db $1A ; play note D4
#_0C84F4: #_JAKYOU_7A24: db $1A ; play note D4
#_0C84F5: #_JAKYOU_7A25: db $19 ; play note Cs4
#_0C84F6: #_JAKYOU_7A26: db $8C ; dur 0x0C
#_0C84F7: #_JAKYOU_7A27: db $15 ; play note A3
#_0C84F8: #_JAKYOU_7A28: db $F8 : dw JAKYOU_SEGMENT_79C3 ; goto location

JAKYOU_SEGMENT_7A2B:
#_0C84FB: #_JAKYOU_7A2B: db $72 ; vol 0x12
#_0C84FC: #_JAKYOU_7A2C: db $FB, $30 ; set note length page
#_0C84FE: #_JAKYOU_7A2E: db $8C ; dur 0x0C
#_0C84FF: #_JAKYOU_7A2F: db $30 ; rest
#_0C8500: #_JAKYOU_7A30: db $30 ; rest
#_0C8501: #_JAKYOU_7A31: db $30 ; rest
#_0C8502: #_JAKYOU_7A32: db $30 ; rest
#_0C8503: #_JAKYOU_7A33: db $30 ; rest
#_0C8504: #_JAKYOU_7A34: db $30 ; rest
#_0C8505: #_JAKYOU_7A35: db $30 ; rest
#_0C8506: #_JAKYOU_7A36: db $30 ; rest
#_0C8507: #_JAKYOU_7A37: db $F0, $FE, $E2 ; set ADSR
#_0C850A: #_JAKYOU_7A3A: db $F1, $08 ; set SRCN
#_0C850C: #_JAKYOU_7A3C: db $F2, $6A ; set panning
#_0C850E: #_JAKYOU_7A3E: db $11 ; play note F3
#_0C850F: #_JAKYOU_7A3F: db $11 ; play note F3
#_0C8510: #_JAKYOU_7A40: db $8A ; dur 0x0A
#_0C8511: #_JAKYOU_7A41: db $16 ; play note As3
#_0C8512: #_JAKYOU_7A42: db $15 ; play note A3
#_0C8513: #_JAKYOU_7A43: db $8C ; dur 0x0C
#_0C8514: #_JAKYOU_7A44: db $11 ; play note F3

JAKYOU_SEGMENT_7A45:
#_0C8515: #_JAKYOU_7A45: db $8C ; dur 0x0C
#_0C8516: #_JAKYOU_7A46: db $30 ; rest
#_0C8517: #_JAKYOU_7A47: db $30 ; rest
#_0C8518: #_JAKYOU_7A48: db $30 ; rest
#_0C8519: #_JAKYOU_7A49: db $30 ; rest
#_0C851A: #_JAKYOU_7A4A: db $30 ; rest
#_0C851B: #_JAKYOU_7A4B: db $30 ; rest
#_0C851C: #_JAKYOU_7A4C: db $30 ; rest
#_0C851D: #_JAKYOU_7A4D: db $30 ; rest
#_0C851E: #_JAKYOU_7A4E: db $8A ; dur 0x0A
#_0C851F: #_JAKYOU_7A4F: db $11 ; play note F3
#_0C8520: #_JAKYOU_7A50: db $30 ; rest
#_0C8521: #_JAKYOU_7A51: db $16 ; play note As3
#_0C8522: #_JAKYOU_7A52: db $30 ; rest
#_0C8523: #_JAKYOU_7A53: db $11 ; play note F3
#_0C8524: #_JAKYOU_7A54: db $30 ; rest
#_0C8525: #_JAKYOU_7A55: db $16 ; play note As3
#_0C8526: #_JAKYOU_7A56: db $15 ; play note A3
#_0C8527: #_JAKYOU_7A57: db $1A ; play note D4
#_0C8528: #_JAKYOU_7A58: db $31 ; tie
#_0C8529: #_JAKYOU_7A59: db $19 ; play note Cs4
#_0C852A: #_JAKYOU_7A5A: db $1A ; play note D4
#_0C852B: #_JAKYOU_7A5B: db $19 ; play note Cs4
#_0C852C: #_JAKYOU_7A5C: db $15 ; play note A3
#_0C852D: #_JAKYOU_7A5D: db $15 ; play note A3
#_0C852E: #_JAKYOU_7A5E: db $19 ; play note Cs4
#_0C852F: #_JAKYOU_7A5F: db $8C ; dur 0x0C
#_0C8530: #_JAKYOU_7A60: db $15 ; play note A3
#_0C8531: #_JAKYOU_7A61: db $18 ; play note C4
#_0C8532: #_JAKYOU_7A62: db $19 ; play note Cs4
#_0C8533: #_JAKYOU_7A63: db $15 ; play note A3
#_0C8534: #_JAKYOU_7A64: db $16 ; play note As3
#_0C8535: #_JAKYOU_7A65: db $31 ; tie
#_0C8536: #_JAKYOU_7A66: db $15 ; play note A3
#_0C8537: #_JAKYOU_7A67: db $19 ; play note Cs4
#_0C8538: #_JAKYOU_7A68: db $88 ; dur 0x08
#_0C8539: #_JAKYOU_7A69: db $1A ; play note D4
#_0C853A: #_JAKYOU_7A6A: db $1C ; play note E4
#_0C853B: #_JAKYOU_7A6B: db $1A ; play note D4
#_0C853C: #_JAKYOU_7A6C: db $16 ; play note As3
#_0C853D: #_JAKYOU_7A6D: db $8C ; dur 0x0C
#_0C853E: #_JAKYOU_7A6E: db $18 ; play note C4
#_0C853F: #_JAKYOU_7A6F: db $88 ; dur 0x08
#_0C8540: #_JAKYOU_7A70: db $19 ; play note Cs4
#_0C8541: #_JAKYOU_7A71: db $19 ; play note Cs4
#_0C8542: #_JAKYOU_7A72: db $13 ; play note G3
#_0C8543: #_JAKYOU_7A73: db $15 ; play note A3
#_0C8544: #_JAKYOU_7A74: db $8A ; dur 0x0A
#_0C8545: #_JAKYOU_7A75: db $15 ; play note A3
#_0C8546: #_JAKYOU_7A76: db $13 ; play note G3
#_0C8547: #_JAKYOU_7A77: db $8A ; dur 0x0A
#_0C8548: #_JAKYOU_7A78: db $1A ; play note D4
#_0C8549: #_JAKYOU_7A79: db $1A ; play note D4
#_0C854A: #_JAKYOU_7A7A: db $18 ; play note C4
#_0C854B: #_JAKYOU_7A7B: db $16 ; play note As3
#_0C854C: #_JAKYOU_7A7C: db $1C ; play note E4
#_0C854D: #_JAKYOU_7A7D: db $17 ; play note B3
#_0C854E: #_JAKYOU_7A7E: db $15 ; play note A3
#_0C854F: #_JAKYOU_7A7F: db $19 ; play note Cs4
#_0C8550: #_JAKYOU_7A80: db $86 ; dur 0x06
#_0C8551: #_JAKYOU_7A81: db $15 ; play note A3
#_0C8552: #_JAKYOU_7A82: db $30 ; rest
#_0C8553: #_JAKYOU_7A83: db $0D ; play note Cs3
#_0C8554: #_JAKYOU_7A84: db $30 ; rest
#_0C8555: #_JAKYOU_7A85: db $1A ; play note D4
#_0C8556: #_JAKYOU_7A86: db $30 ; rest
#_0C8557: #_JAKYOU_7A87: db $18 ; play note C4
#_0C8558: #_JAKYOU_7A88: db $30 ; rest
#_0C8559: #_JAKYOU_7A89: db $15 ; play note A3
#_0C855A: #_JAKYOU_7A8A: db $30 ; rest
#_0C855B: #_JAKYOU_7A8B: db $18 ; play note C4
#_0C855C: #_JAKYOU_7A8C: db $30 ; rest
#_0C855D: #_JAKYOU_7A8D: db $16 ; play note As3
#_0C855E: #_JAKYOU_7A8E: db $30 ; rest
#_0C855F: #_JAKYOU_7A8F: db $15 ; play note A3
#_0C8560: #_JAKYOU_7A90: db $30 ; rest
#_0C8561: #_JAKYOU_7A91: db $8A ; dur 0x0A
#_0C8562: #_JAKYOU_7A92: db $15 ; play note A3
#_0C8563: #_JAKYOU_7A93: db $1A ; play note D4
#_0C8564: #_JAKYOU_7A94: db $16 ; play note As3
#_0C8565: #_JAKYOU_7A95: db $19 ; play note Cs4
#_0C8566: #_JAKYOU_7A96: db $8A ; dur 0x0A
#_0C8567: #_JAKYOU_7A97: db $1A ; play note D4
#_0C8568: #_JAKYOU_7A98: db $16 ; play note As3
#_0C8569: #_JAKYOU_7A99: db $1A ; play note D4
#_0C856A: #_JAKYOU_7A9A: db $15 ; play note A3
#_0C856B: #_JAKYOU_7A9B: db $16 ; play note As3
#_0C856C: #_JAKYOU_7A9C: db $15 ; play note A3
#_0C856D: #_JAKYOU_7A9D: db $88 ; dur 0x08
#_0C856E: #_JAKYOU_7A9E: db $11 ; play note F3
#_0C856F: #_JAKYOU_7A9F: db $13 ; play note G3
#_0C8570: #_JAKYOU_7AA0: db $15 ; play note A3
#_0C8571: #_JAKYOU_7AA1: db $19 ; play note Cs4
#_0C8572: #_JAKYOU_7AA2: db $8A ; dur 0x0A
#_0C8573: #_JAKYOU_7AA3: db $1A ; play note D4
#_0C8574: #_JAKYOU_7AA4: db $16 ; play note As3
#_0C8575: #_JAKYOU_7AA5: db $1A ; play note D4
#_0C8576: #_JAKYOU_7AA6: db $15 ; play note A3
#_0C8577: #_JAKYOU_7AA7: db $16 ; play note As3
#_0C8578: #_JAKYOU_7AA8: db $15 ; play note A3
#_0C8579: #_JAKYOU_7AA9: db $8C ; dur 0x0C
#_0C857A: #_JAKYOU_7AAA: db $11 ; play note F3
#_0C857B: #_JAKYOU_7AAB: db $F8 : dw JAKYOU_SEGMENT_7A45 ; goto location

JAKYOU_SEGMENT_7AAE:
#_0C857E: #_JAKYOU_7AAE: db $87 ; dur 0x07
#_0C857F: #_JAKYOU_7AAF: db $30 ; rest
#_0C8580: #_JAKYOU_7AB0: db $70 ; vol 0x10
#_0C8581: #_JAKYOU_7AB1: db $F9, $20 ; set fine tuning
#_0C8583: #_JAKYOU_7AB3: db $F0, $FA, $E2 ; set ADSR
#_0C8586: #_JAKYOU_7AB6: db $F2, $72 ; set panning
#_0C8588: #_JAKYOU_7AB8: db $F8 : dw JAKYOU_SEGMENT_7821 ; goto location

JAKYOU_SEGMENT_7ABB:
#_0C858B: #_JAKYOU_7ABB: db $87 ; dur 0x07
#_0C858C: #_JAKYOU_7ABC: db $30 ; rest
#_0C858D: #_JAKYOU_7ABD: db $F0, $FA, $E2 ; set ADSR
#_0C8590: #_JAKYOU_7AC0: db $F2, $72 ; set panning
#_0C8592: #_JAKYOU_7AC2: db $F9, $30 ; set fine tuning
#_0C8594: #_JAKYOU_7AC4: db $F8 : dw JAKYOU_SEGMENT_7928 ; goto location
#_0C8597: #_JAKYOU_7AC7: db $FF ; end track

JAKYOU_SEGMENT_7AC8:
#_0C8598: #_JAKYOU_7AC8: db $70 ; vol 0x10
#_0C8599: #_JAKYOU_7AC9: db $FB, $30 ; set note length page
#_0C859B: #_JAKYOU_7ACB: db $8C ; dur 0x0C
#_0C859C: #_JAKYOU_7ACC: db $30 ; rest
#_0C859D: #_JAKYOU_7ACD: db $30 ; rest
#_0C859E: #_JAKYOU_7ACE: db $30 ; rest
#_0C859F: #_JAKYOU_7ACF: db $30 ; rest
#_0C85A0: #_JAKYOU_7AD0: db $F2, $54 ; set panning
#_0C85A2: #_JAKYOU_7AD2: db $F0, $FD, $E2 ; set ADSR
#_0C85A5: #_JAKYOU_7AD5: db $F1, $09 ; set SRCN
#_0C85A7: #_JAKYOU_7AD7: db $F3, $00 ; transpose +0
#_0C85A9: #_JAKYOU_7AD9: db $8C ; dur 0x0C
#_0C85AA: #_JAKYOU_7ADA: db $22 ; play note As4
#_0C85AB: #_JAKYOU_7ADB: db $21 ; play note A4
#_0C85AC: #_JAKYOU_7ADC: db $1F ; play note G4
#_0C85AD: #_JAKYOU_7ADD: db $21 ; play note A4
#_0C85AE: #_JAKYOU_7ADE: db $22 ; play note As4
#_0C85AF: #_JAKYOU_7ADF: db $21 ; play note A4
#_0C85B0: #_JAKYOU_7AE0: db $8A ; dur 0x0A
#_0C85B1: #_JAKYOU_7AE1: db $1F ; play note G4
#_0C85B2: #_JAKYOU_7AE2: db $21 ; play note A4
#_0C85B3: #_JAKYOU_7AE3: db $8C ; dur 0x0C
#_0C85B4: #_JAKYOU_7AE4: db $1A ; play note D4

JAKYOU_SEGMENT_7AE5:
#_0C85B5: #_JAKYOU_7AE5: db $F4, $02 ; set loop point B
#_0C85B7: #_JAKYOU_7AE7: db $8A ; dur 0x0A
#_0C85B8: #_JAKYOU_7AE8: db $1A ; play note D4
#_0C85B9: #_JAKYOU_7AE9: db $19 ; play note Cs4
#_0C85BA: #_JAKYOU_7AEA: db $16 ; play note As3
#_0C85BB: #_JAKYOU_7AEB: db $15 ; play note A3
#_0C85BC: #_JAKYOU_7AEC: db $1A ; play note D4
#_0C85BD: #_JAKYOU_7AED: db $19 ; play note Cs4
#_0C85BE: #_JAKYOU_7AEE: db $1A ; play note D4
#_0C85BF: #_JAKYOU_7AEF: db $1C ; play note E4
#_0C85C0: #_JAKYOU_7AF0: db $1D ; play note F4
#_0C85C1: #_JAKYOU_7AF1: db $21 ; play note A4
#_0C85C2: #_JAKYOU_7AF2: db $1F ; play note G4
#_0C85C3: #_JAKYOU_7AF3: db $1D ; play note F4
#_0C85C4: #_JAKYOU_7AF4: db $1C ; play note E4
#_0C85C5: #_JAKYOU_7AF5: db $1D ; play note F4
#_0C85C6: #_JAKYOU_7AF6: db $88 ; dur 0x08
#_0C85C7: #_JAKYOU_7AF7: db $1F ; play note G4
#_0C85C8: #_JAKYOU_7AF8: db $20 ; play note Gs4
#_0C85C9: #_JAKYOU_7AF9: db $21 ; play note A4
#_0C85CA: #_JAKYOU_7AFA: db $15 ; play note A3
#_0C85CB: #_JAKYOU_7AFB: db $F5 ; run loop B
#_0C85CC: #_JAKYOU_7AFC: db $88 ; dur 0x08
#_0C85CD: #_JAKYOU_7AFD: db $1D ; play note F4
#_0C85CE: #_JAKYOU_7AFE: db $1C ; play note E4
#_0C85CF: #_JAKYOU_7AFF: db $1D ; play note F4
#_0C85D0: #_JAKYOU_7B00: db $1F ; play note G4
#_0C85D1: #_JAKYOU_7B01: db $21 ; play note A4
#_0C85D2: #_JAKYOU_7B02: db $31 ; tie
#_0C85D3: #_JAKYOU_7B03: db $1F ; play note G4
#_0C85D4: #_JAKYOU_7B04: db $1D ; play note F4
#_0C85D5: #_JAKYOU_7B05: db $1C ; play note E4
#_0C85D6: #_JAKYOU_7B06: db $1F ; play note G4
#_0C85D7: #_JAKYOU_7B07: db $19 ; play note Cs4
#_0C85D8: #_JAKYOU_7B08: db $1C ; play note E4
#_0C85D9: #_JAKYOU_7B09: db $1D ; play note F4
#_0C85DA: #_JAKYOU_7B0A: db $1C ; play note E4
#_0C85DB: #_JAKYOU_7B0B: db $1A ; play note D4
#_0C85DC: #_JAKYOU_7B0C: db $18 ; play note C4
#_0C85DD: #_JAKYOU_7B0D: db $8A ; dur 0x0A
#_0C85DE: #_JAKYOU_7B0E: db $16 ; play note As3
#_0C85DF: #_JAKYOU_7B0F: db $1A ; play note D4
#_0C85E0: #_JAKYOU_7B10: db $1D ; play note F4
#_0C85E1: #_JAKYOU_7B11: db $1C ; play note E4
#_0C85E2: #_JAKYOU_7B12: db $19 ; play note Cs4
#_0C85E3: #_JAKYOU_7B13: db $1C ; play note E4
#_0C85E4: #_JAKYOU_7B14: db $15 ; play note A3
#_0C85E5: #_JAKYOU_7B15: db $19 ; play note Cs4
#_0C85E6: #_JAKYOU_7B16: db $88 ; dur 0x08
#_0C85E7: #_JAKYOU_7B17: db $1D ; play note F4
#_0C85E8: #_JAKYOU_7B18: db $1C ; play note E4
#_0C85E9: #_JAKYOU_7B19: db $1D ; play note F4
#_0C85EA: #_JAKYOU_7B1A: db $1F ; play note G4
#_0C85EB: #_JAKYOU_7B1B: db $21 ; play note A4
#_0C85EC: #_JAKYOU_7B1C: db $31 ; tie
#_0C85ED: #_JAKYOU_7B1D: db $1F ; play note G4
#_0C85EE: #_JAKYOU_7B1E: db $1D ; play note F4
#_0C85EF: #_JAKYOU_7B1F: db $1C ; play note E4
#_0C85F0: #_JAKYOU_7B20: db $1F ; play note G4
#_0C85F1: #_JAKYOU_7B21: db $19 ; play note Cs4
#_0C85F2: #_JAKYOU_7B22: db $1C ; play note E4
#_0C85F3: #_JAKYOU_7B23: db $1D ; play note F4
#_0C85F4: #_JAKYOU_7B24: db $1C ; play note E4
#_0C85F5: #_JAKYOU_7B25: db $1A ; play note D4
#_0C85F6: #_JAKYOU_7B26: db $18 ; play note C4
#_0C85F7: #_JAKYOU_7B27: db $16 ; play note As3
#_0C85F8: #_JAKYOU_7B28: db $1A ; play note D4
#_0C85F9: #_JAKYOU_7B29: db $1D ; play note F4
#_0C85FA: #_JAKYOU_7B2A: db $1C ; play note E4
#_0C85FB: #_JAKYOU_7B2B: db $16 ; play note As3
#_0C85FC: #_JAKYOU_7B2C: db $1F ; play note G4
#_0C85FD: #_JAKYOU_7B2D: db $1C ; play note E4
#_0C85FE: #_JAKYOU_7B2E: db $1D ; play note F4
#_0C85FF: #_JAKYOU_7B2F: db $E0, $04 ; set tempo
#_0C8601: #_JAKYOU_7B31: db $19 ; play note Cs4
#_0C8602: #_JAKYOU_7B32: db $E0, $08 ; set tempo
#_0C8604: #_JAKYOU_7B34: db $15 ; play note A3
#_0C8605: #_JAKYOU_7B35: db $E0, $0C ; set tempo
#_0C8607: #_JAKYOU_7B37: db $1C ; play note E4
#_0C8608: #_JAKYOU_7B38: db $E0, $10 ; set tempo
#_0C860A: #_JAKYOU_7B3A: db $19 ; play note Cs4
#_0C860B: #_JAKYOU_7B3B: db $E0, $20 ; set tempo
#_0C860D: #_JAKYOU_7B3D: db $15 ; play note A3
#_0C860E: #_JAKYOU_7B3E: db $E0, $30 ; set tempo
#_0C8610: #_JAKYOU_7B40: db $19 ; play note Cs4
#_0C8611: #_JAKYOU_7B41: db $E0, $40 ; set tempo
#_0C8613: #_JAKYOU_7B43: db $1C ; play note E4
#_0C8614: #_JAKYOU_7B44: db $E0, $60 ; set tempo
#_0C8616: #_JAKYOU_7B46: db $19 ; play note Cs4
#_0C8617: #_JAKYOU_7B47: db $E0, $00 ; set tempo
#_0C8619: #_JAKYOU_7B49: db $88 ; dur 0x08
#_0C861A: #_JAKYOU_7B4A: db $1A ; play note D4
#_0C861B: #_JAKYOU_7B4B: db $1C ; play note E4
#_0C861C: #_JAKYOU_7B4C: db $19 ; play note Cs4
#_0C861D: #_JAKYOU_7B4D: db $16 ; play note As3
#_0C861E: #_JAKYOU_7B4E: db $1D ; play note F4
#_0C861F: #_JAKYOU_7B4F: db $1C ; play note E4
#_0C8620: #_JAKYOU_7B50: db $1A ; play note D4
#_0C8621: #_JAKYOU_7B51: db $19 ; play note Cs4
#_0C8622: #_JAKYOU_7B52: db $8A ; dur 0x0A
#_0C8623: #_JAKYOU_7B53: db $1A ; play note D4
#_0C8624: #_JAKYOU_7B54: db $18 ; play note C4
#_0C8625: #_JAKYOU_7B55: db $16 ; play note As3
#_0C8626: #_JAKYOU_7B56: db $15 ; play note A3
#_0C8627: #_JAKYOU_7B57: db $16 ; play note As3
#_0C8628: #_JAKYOU_7B58: db $1C ; play note E4
#_0C8629: #_JAKYOU_7B59: db $1D ; play note F4
#_0C862A: #_JAKYOU_7B5A: db $1A ; play note D4
#_0C862B: #_JAKYOU_7B5B: db $16 ; play note As3
#_0C862C: #_JAKYOU_7B5C: db $19 ; play note Cs4
#_0C862D: #_JAKYOU_7B5D: db $88 ; dur 0x08
#_0C862E: #_JAKYOU_7B5E: db $1A ; play note D4
#_0C862F: #_JAKYOU_7B5F: db $1C ; play note E4
#_0C8630: #_JAKYOU_7B60: db $1D ; play note F4
#_0C8631: #_JAKYOU_7B61: db $1F ; play note G4
#_0C8632: #_JAKYOU_7B62: db $8A ; dur 0x0A
#_0C8633: #_JAKYOU_7B63: db $16 ; play note As3
#_0C8634: #_JAKYOU_7B64: db $1C ; play note E4
#_0C8635: #_JAKYOU_7B65: db $1D ; play note F4
#_0C8636: #_JAKYOU_7B66: db $1A ; play note D4
#_0C8637: #_JAKYOU_7B67: db $16 ; play note As3
#_0C8638: #_JAKYOU_7B68: db $19 ; play note Cs4
#_0C8639: #_JAKYOU_7B69: db $8C ; dur 0x0C
#_0C863A: #_JAKYOU_7B6A: db $1A ; play note D4
#_0C863B: #_JAKYOU_7B6B: db $F8 : dw JAKYOU_SEGMENT_7AE5 ; goto location
#_0C863E: #_JAKYOU_7B6E: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Law_SPC_Data:
#_0C863F: dw $0126, $0000

SONG_LAW:
#_0C8643: #_LAW_7800: db $F1, $00 ; Set control
#_0C8645: #_LAW_7802: db $00 : dw LAW_SEGMENT_781B ; Music channel 0
#_0C8648: #_LAW_7805: db $01 : dw LAW_SEGMENT_785B ; Music channel 1
#_0C864B: #_LAW_7808: db $02 : dw LAW_SEGMENT_7880 ; Music channel 2
#_0C864E: #_LAW_780B: db $03 : dw LAW_SEGMENT_7886 ; Music channel 3
#_0C8651: #_LAW_780E: db $04 : dw LAW_SEGMENT_78AC ; Music channel 4
#_0C8654: #_LAW_7811: db $05 : dw LAW_SEGMENT_78B5 ; Music channel 5
#_0C8657: #_LAW_7814: db $06 : dw LAW_SEGMENT_78DB ; Music channel 6
#_0C865A: #_LAW_7817: db $07 : dw LAW_SEGMENT_7901 ; Music channel 7
#_0C865D: #_LAW_781A: db $FF ; end of header

LAW_SEGMENT_781B:
#_0C865E: #_LAW_781B: db $F2, $54 ; set panning

LAW_SEGMENT_781D:
#_0C8660: #_LAW_781D: db $70 ; vol 0x10
#_0C8661: #_LAW_781E: db $F0, $FA, $E4 ; set ADSR
#_0C8664: #_LAW_7821: db $F1, $08 ; set SRCN
#_0C8666: #_LAW_7823: db $FB, $20 ; set note length page

LAW_SEGMENT_7825:
#_0C8668: #_LAW_7825: db $8A ; dur 0x0A
#_0C8669: #_LAW_7826: db $1A ; play note D4
#_0C866A: #_LAW_7827: db $21 ; play note A4
#_0C866B: #_LAW_7828: db $24 ; play note C5
#_0C866C: #_LAW_7829: db $23 ; play note B4
#_0C866D: #_LAW_782A: db $88 ; dur 0x08
#_0C866E: #_LAW_782B: db $1F ; play note G4
#_0C866F: #_LAW_782C: db $1D ; play note F4
#_0C8670: #_LAW_782D: db $1C ; play note E4
#_0C8671: #_LAW_782E: db $1D ; play note F4
#_0C8672: #_LAW_782F: db $8C ; dur 0x0C
#_0C8673: #_LAW_7830: db $1F ; play note G4
#_0C8674: #_LAW_7831: db $8A ; dur 0x0A
#_0C8675: #_LAW_7832: db $1A ; play note D4
#_0C8676: #_LAW_7833: db $21 ; play note A4
#_0C8677: #_LAW_7834: db $24 ; play note C5
#_0C8678: #_LAW_7835: db $88 ; dur 0x08
#_0C8679: #_LAW_7836: db $23 ; play note B4
#_0C867A: #_LAW_7837: db $1F ; play note G4
#_0C867B: #_LAW_7838: db $8C ; dur 0x0C
#_0C867C: #_LAW_7839: db $21 ; play note A4
#_0C867D: #_LAW_783A: db $8A ; dur 0x0A
#_0C867E: #_LAW_783B: db $1A ; play note D4
#_0C867F: #_LAW_783C: db $21 ; play note A4
#_0C8680: #_LAW_783D: db $24 ; play note C5
#_0C8681: #_LAW_783E: db $23 ; play note B4
#_0C8682: #_LAW_783F: db $88 ; dur 0x08
#_0C8683: #_LAW_7840: db $1F ; play note G4
#_0C8684: #_LAW_7841: db $1D ; play note F4
#_0C8685: #_LAW_7842: db $1C ; play note E4
#_0C8686: #_LAW_7843: db $1D ; play note F4
#_0C8687: #_LAW_7844: db $8C ; dur 0x0C
#_0C8688: #_LAW_7845: db $1F ; play note G4
#_0C8689: #_LAW_7846: db $88 ; dur 0x08
#_0C868A: #_LAW_7847: db $1D ; play note F4
#_0C868B: #_LAW_7848: db $1F ; play note G4
#_0C868C: #_LAW_7849: db $8A ; dur 0x0A
#_0C868D: #_LAW_784A: db $1D ; play note F4
#_0C868E: #_LAW_784B: db $88 ; dur 0x08
#_0C868F: #_LAW_784C: db $1C ; play note E4
#_0C8690: #_LAW_784D: db $1A ; play note D4
#_0C8691: #_LAW_784E: db $F0, $FA, $F2 ; set ADSR
#_0C8694: #_LAW_7851: db $8A ; dur 0x0A
#_0C8695: #_LAW_7852: db $18 ; play note C4
#_0C8696: #_LAW_7853: db $F0, $FA, $E4 ; set ADSR
#_0C8699: #_LAW_7856: db $8C ; dur 0x0C
#_0C869A: #_LAW_7857: db $1A ; play note D4
#_0C869B: #_LAW_7858: db $F8 : dw LAW_SEGMENT_7825 ; goto location

LAW_SEGMENT_785B:
#_0C869E: #_LAW_785B: db $72 ; vol 0x12

LAW_SEGMENT_785C:
#_0C869F: #_LAW_785C: db $F0, $FA, $E4 ; set ADSR
#_0C86A2: #_LAW_785F: db $F1, $09 ; set SRCN
#_0C86A4: #_LAW_7861: db $F2, $68 ; set panning
#_0C86A6: #_LAW_7863: db $FB, $20 ; set note length page
#_0C86A8: #_LAW_7865: db $8A ; dur 0x0A
#_0C86A9: #_LAW_7866: db $30 ; rest

LAW_SEGMENT_7867:
#_0C86AA: #_LAW_7867: db $8C ; dur 0x0C
#_0C86AB: #_LAW_7868: db $24 ; play note C5
#_0C86AC: #_LAW_7869: db $23 ; play note B4
#_0C86AD: #_LAW_786A: db $21 ; play note A4
#_0C86AE: #_LAW_786B: db $23 ; play note B4
#_0C86AF: #_LAW_786C: db $24 ; play note C5
#_0C86B0: #_LAW_786D: db $8A ; dur 0x0A
#_0C86B1: #_LAW_786E: db $23 ; play note B4
#_0C86B2: #_LAW_786F: db $8D ; dur 0x0D
#_0C86B3: #_LAW_7870: db $21 ; play note A4
#_0C86B4: #_LAW_7871: db $8C ; dur 0x0C
#_0C86B5: #_LAW_7872: db $24 ; play note C5
#_0C86B6: #_LAW_7873: db $23 ; play note B4
#_0C86B7: #_LAW_7874: db $21 ; play note A4
#_0C86B8: #_LAW_7875: db $23 ; play note B4
#_0C86B9: #_LAW_7876: db $21 ; play note A4
#_0C86BA: #_LAW_7877: db $8A ; dur 0x0A
#_0C86BB: #_LAW_7878: db $1F ; play note G4
#_0C86BC: #_LAW_7879: db $8C ; dur 0x0C
#_0C86BD: #_LAW_787A: db $21 ; play note A4
#_0C86BE: #_LAW_787B: db $8A ; dur 0x0A
#_0C86BF: #_LAW_787C: db $31 ; tie
#_0C86C0: #_LAW_787D: db $F8 : dw LAW_SEGMENT_7867 ; goto location

LAW_SEGMENT_7880:
#_0C86C3: #_LAW_7880: db $62 ; vol 0x02
#_0C86C4: #_LAW_7881: db $F9, $20 ; set fine tuning
#_0C86C6: #_LAW_7883: db $F8 : dw LAW_SEGMENT_785C ; goto location

LAW_SEGMENT_7886:
#_0C86C9: #_LAW_7886: db $71 ; vol 0x11
#_0C86CA: #_LAW_7887: db $F0, $FA, $E4 ; set ADSR
#_0C86CD: #_LAW_788A: db $F1, $09 ; set SRCN
#_0C86CF: #_LAW_788C: db $F2, $66 ; set panning
#_0C86D1: #_LAW_788E: db $FB, $20 ; set note length page
#_0C86D3: #_LAW_7890: db $8A ; dur 0x0A
#_0C86D4: #_LAW_7891: db $30 ; rest

LAW_SEGMENT_7892:
#_0C86D5: #_LAW_7892: db $8C ; dur 0x0C
#_0C86D6: #_LAW_7893: db $21 ; play note A4
#_0C86D7: #_LAW_7894: db $1F ; play note G4
#_0C86D8: #_LAW_7895: db $1D ; play note F4
#_0C86D9: #_LAW_7896: db $1F ; play note G4
#_0C86DA: #_LAW_7897: db $21 ; play note A4
#_0C86DB: #_LAW_7898: db $8A ; dur 0x0A
#_0C86DC: #_LAW_7899: db $1F ; play note G4
#_0C86DD: #_LAW_789A: db $8D ; dur 0x0D
#_0C86DE: #_LAW_789B: db $1D ; play note F4
#_0C86DF: #_LAW_789C: db $8C ; dur 0x0C
#_0C86E0: #_LAW_789D: db $21 ; play note A4
#_0C86E1: #_LAW_789E: db $1F ; play note G4
#_0C86E2: #_LAW_789F: db $1D ; play note F4
#_0C86E3: #_LAW_78A0: db $1F ; play note G4
#_0C86E4: #_LAW_78A1: db $1D ; play note F4
#_0C86E5: #_LAW_78A2: db $8A ; dur 0x0A
#_0C86E6: #_LAW_78A3: db $1C ; play note E4
#_0C86E7: #_LAW_78A4: db $8C ; dur 0x0C
#_0C86E8: #_LAW_78A5: db $1D ; play note F4
#_0C86E9: #_LAW_78A6: db $8A ; dur 0x0A
#_0C86EA: #_LAW_78A7: db $31 ; tie
#_0C86EB: #_LAW_78A8: db $F8 : dw LAW_SEGMENT_7892 ; goto location
#_0C86EE: #_LAW_78AB: db $FF ; end track

LAW_SEGMENT_78AC:
#_0C86EF: #_LAW_78AC: db $87 ; dur 0x07
#_0C86F0: #_LAW_78AD: db $30 ; rest
#_0C86F1: #_LAW_78AE: db $F2, $68 ; set panning
#_0C86F3: #_LAW_78B0: db $F9, $20 ; set fine tuning
#_0C86F5: #_LAW_78B2: db $F8 : dw LAW_SEGMENT_781D ; goto location

LAW_SEGMENT_78B5:
#_0C86F8: #_LAW_78B5: db $70 ; vol 0x10
#_0C86F9: #_LAW_78B6: db $F0, $FA, $E4 ; set ADSR
#_0C86FC: #_LAW_78B9: db $F1, $09 ; set SRCN
#_0C86FE: #_LAW_78BB: db $F2, $66 ; set panning
#_0C8700: #_LAW_78BD: db $FB, $20 ; set note length page
#_0C8702: #_LAW_78BF: db $8A ; dur 0x0A
#_0C8703: #_LAW_78C0: db $30 ; rest

LAW_SEGMENT_78C1:
#_0C8704: #_LAW_78C1: db $8C ; dur 0x0C
#_0C8705: #_LAW_78C2: db $1A ; play note D4
#_0C8706: #_LAW_78C3: db $18 ; play note C4
#_0C8707: #_LAW_78C4: db $15 ; play note A3
#_0C8708: #_LAW_78C5: db $17 ; play note B3
#_0C8709: #_LAW_78C6: db $1A ; play note D4
#_0C870A: #_LAW_78C7: db $8A ; dur 0x0A
#_0C870B: #_LAW_78C8: db $18 ; play note C4
#_0C870C: #_LAW_78C9: db $8D ; dur 0x0D
#_0C870D: #_LAW_78CA: db $15 ; play note A3
#_0C870E: #_LAW_78CB: db $8C ; dur 0x0C
#_0C870F: #_LAW_78CC: db $1A ; play note D4
#_0C8710: #_LAW_78CD: db $18 ; play note C4
#_0C8711: #_LAW_78CE: db $15 ; play note A3
#_0C8712: #_LAW_78CF: db $17 ; play note B3
#_0C8713: #_LAW_78D0: db $15 ; play note A3
#_0C8714: #_LAW_78D1: db $8A ; dur 0x0A
#_0C8715: #_LAW_78D2: db $13 ; play note G3
#_0C8716: #_LAW_78D3: db $8C ; dur 0x0C
#_0C8717: #_LAW_78D4: db $15 ; play note A3
#_0C8718: #_LAW_78D5: db $8A ; dur 0x0A
#_0C8719: #_LAW_78D6: db $31 ; tie
#_0C871A: #_LAW_78D7: db $F8 : dw LAW_SEGMENT_78C1 ; goto location
#_0C871D: #_LAW_78DA: db $FF ; end track

LAW_SEGMENT_78DB:
#_0C871E: #_LAW_78DB: db $61 ; vol 0x01
#_0C871F: #_LAW_78DC: db $F0, $FA, $E4 ; set ADSR
#_0C8722: #_LAW_78DF: db $F1, $09 ; set SRCN
#_0C8724: #_LAW_78E1: db $F2, $66 ; set panning
#_0C8726: #_LAW_78E3: db $FB, $20 ; set note length page
#_0C8728: #_LAW_78E5: db $8A ; dur 0x0A
#_0C8729: #_LAW_78E6: db $30 ; rest

LAW_SEGMENT_78E7:
#_0C872A: #_LAW_78E7: db $8C ; dur 0x0C
#_0C872B: #_LAW_78E8: db $1D ; play note F4
#_0C872C: #_LAW_78E9: db $1C ; play note E4
#_0C872D: #_LAW_78EA: db $1A ; play note D4
#_0C872E: #_LAW_78EB: db $1C ; play note E4
#_0C872F: #_LAW_78EC: db $1D ; play note F4
#_0C8730: #_LAW_78ED: db $8A ; dur 0x0A
#_0C8731: #_LAW_78EE: db $1C ; play note E4
#_0C8732: #_LAW_78EF: db $8D ; dur 0x0D
#_0C8733: #_LAW_78F0: db $1A ; play note D4
#_0C8734: #_LAW_78F1: db $8C ; dur 0x0C
#_0C8735: #_LAW_78F2: db $1D ; play note F4
#_0C8736: #_LAW_78F3: db $1C ; play note E4
#_0C8737: #_LAW_78F4: db $1A ; play note D4
#_0C8738: #_LAW_78F5: db $1C ; play note E4
#_0C8739: #_LAW_78F6: db $1A ; play note D4
#_0C873A: #_LAW_78F7: db $8A ; dur 0x0A
#_0C873B: #_LAW_78F8: db $18 ; play note C4
#_0C873C: #_LAW_78F9: db $8C ; dur 0x0C
#_0C873D: #_LAW_78FA: db $1A ; play note D4
#_0C873E: #_LAW_78FB: db $8A ; dur 0x0A
#_0C873F: #_LAW_78FC: db $31 ; tie
#_0C8740: #_LAW_78FD: db $F8 : dw LAW_SEGMENT_78E7 ; goto location
#_0C8743: #_LAW_7900: db $FF ; end track

LAW_SEGMENT_7901:
#_0C8744: #_LAW_7901: db $70 ; vol 0x10
#_0C8745: #_LAW_7902: db $F0, $FA, $E4 ; set ADSR
#_0C8748: #_LAW_7905: db $F1, $08 ; set SRCN
#_0C874A: #_LAW_7907: db $F2, $58 ; set panning
#_0C874C: #_LAW_7909: db $FB, $20 ; set note length page

LAW_SEGMENT_790B:
#_0C874E: #_LAW_790B: db $8A ; dur 0x0A
#_0C874F: #_LAW_790C: db $30 ; rest
#_0C8750: #_LAW_790D: db $8C ; dur 0x0C
#_0C8751: #_LAW_790E: db $0E ; play note D3
#_0C8752: #_LAW_790F: db $13 ; play note G3
#_0C8753: #_LAW_7910: db $11 ; play note F3
#_0C8754: #_LAW_7911: db $10 ; play note E3
#_0C8755: #_LAW_7912: db $0E ; play note D3
#_0C8756: #_LAW_7913: db $8A ; dur 0x0A
#_0C8757: #_LAW_7914: db $13 ; play note G3
#_0C8758: #_LAW_7915: db $11 ; play note F3
#_0C8759: #_LAW_7916: db $10 ; play note E3
#_0C875A: #_LAW_7917: db $0A ; play note As2
#_0C875B: #_LAW_7918: db $8C ; dur 0x0C
#_0C875C: #_LAW_7919: db $0E ; play note D3
#_0C875D: #_LAW_791A: db $13 ; play note G3
#_0C875E: #_LAW_791B: db $11 ; play note F3
#_0C875F: #_LAW_791C: db $10 ; play note E3
#_0C8760: #_LAW_791D: db $0E ; play note D3
#_0C8761: #_LAW_791E: db $8A ; dur 0x0A
#_0C8762: #_LAW_791F: db $10 ; play note E3
#_0C8763: #_LAW_7920: db $8C ; dur 0x0C
#_0C8764: #_LAW_7921: db $0A ; play note As2
#_0C8765: #_LAW_7922: db $F8 : dw LAW_SEGMENT_790B ; goto location
#_0C8768: #_LAW_7925: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Chaos_SPC_Data:
#_0C8769: dw $0069, $0000

SONG_CHAOS:
#_0C876D: #_CHAOS_7800: db $F1, $00 ; Set control
#_0C876F: #_CHAOS_7802: db $00 : dw CHAOS_SEGMENT_781B ; Music channel 0
#_0C8772: #_CHAOS_7805: db $01 : dw CHAOS_SEGMENT_7830 ; Music channel 1
#_0C8775: #_CHAOS_7808: db $02 : dw CHAOS_SEGMENT_7837 ; Music channel 2
#_0C8778: #_CHAOS_780B: db $03 : dw CHAOS_SEGMENT_784C ; Music channel 3
#_0C877B: #_CHAOS_780E: db $04 : dw CHAOS_SEGMENT_784D ; Music channel 4
#_0C877E: #_CHAOS_7811: db $05 : dw CHAOS_SEGMENT_7855 ; Music channel 5
#_0C8781: #_CHAOS_7814: db $06 : dw CHAOS_SEGMENT_7856 ; Music channel 6
#_0C8784: #_CHAOS_7817: db $07 : dw CHAOS_SEGMENT_7867 ; Music channel 7
#_0C8787: #_CHAOS_781A: db $FF ; end of header

CHAOS_SEGMENT_781B:
#_0C8788: #_CHAOS_781B: db $72 ; vol 0x12

CHAOS_SEGMENT_781C:
#_0C8789: #_CHAOS_781C: db $F0, $8C, $E2 ; set ADSR
#_0C878C: #_CHAOS_781F: db $F1, $09 ; set SRCN
#_0C878E: #_CHAOS_7821: db $F2, $64 ; set panning
#_0C8790: #_CHAOS_7823: db $8E ; dur 0x0E

CHAOS_SEGMENT_7824:
#_0C8791: #_CHAOS_7824: db $1D ; play note F4
#_0C8792: #_CHAOS_7825: db $31 ; tie
#_0C8793: #_CHAOS_7826: db $31 ; tie
#_0C8794: #_CHAOS_7827: db $31 ; tie
#_0C8795: #_CHAOS_7828: db $1C ; play note E4
#_0C8796: #_CHAOS_7829: db $31 ; tie
#_0C8797: #_CHAOS_782A: db $31 ; tie
#_0C8798: #_CHAOS_782B: db $31 ; tie
#_0C8799: #_CHAOS_782C: db $F8 : dw CHAOS_SEGMENT_7824 ; goto location
#_0C879C: #_CHAOS_782F: db $FF ; end track

CHAOS_SEGMENT_7830:
#_0C879D: #_CHAOS_7830: db $62 ; vol 0x02
#_0C879E: #_CHAOS_7831: db $F9, $20 ; set fine tuning
#_0C87A0: #_CHAOS_7833: db $F8 : dw CHAOS_SEGMENT_781C ; goto location
#_0C87A3: #_CHAOS_7836: db $FF ; end track

CHAOS_SEGMENT_7837:
#_0C87A4: #_CHAOS_7837: db $70 ; vol 0x10
#_0C87A5: #_CHAOS_7838: db $F0, $8C, $E2 ; set ADSR
#_0C87A8: #_CHAOS_783B: db $F1, $09 ; set SRCN
#_0C87AA: #_CHAOS_783D: db $F2, $62 ; set panning
#_0C87AC: #_CHAOS_783F: db $8E ; dur 0x0E

CHAOS_SEGMENT_7840:
#_0C87AD: #_CHAOS_7840: db $13 ; play note G3
#_0C87AE: #_CHAOS_7841: db $31 ; tie
#_0C87AF: #_CHAOS_7842: db $31 ; tie
#_0C87B0: #_CHAOS_7843: db $31 ; tie
#_0C87B1: #_CHAOS_7844: db $12 ; play note Fs3
#_0C87B2: #_CHAOS_7845: db $31 ; tie
#_0C87B3: #_CHAOS_7846: db $31 ; tie
#_0C87B4: #_CHAOS_7847: db $31 ; tie
#_0C87B5: #_CHAOS_7848: db $F8 : dw CHAOS_SEGMENT_7840 ; goto location
#_0C87B8: #_CHAOS_784B: db $FF ; end track

CHAOS_SEGMENT_784C:
#_0C87B9: #_CHAOS_784C: db $FF ; end track

CHAOS_SEGMENT_784D:
#_0C87BA: #_CHAOS_784D: db $89 ; dur 0x09
#_0C87BB: #_CHAOS_784E: db $30 ; rest
#_0C87BC: #_CHAOS_784F: db $F2, $60 ; set panning
#_0C87BE: #_CHAOS_7851: db $F8 : dw CHAOS_SEGMENT_7858 ; goto location
#_0C87C1: #_CHAOS_7854: db $FF ; end track

CHAOS_SEGMENT_7855:
#_0C87C2: #_CHAOS_7855: db $FF ; end track

CHAOS_SEGMENT_7856:
#_0C87C3: #_CHAOS_7856: db $F2, $48 ; set panning

CHAOS_SEGMENT_7858:
#_0C87C5: #_CHAOS_7858: db $70 ; vol 0x10
#_0C87C6: #_CHAOS_7859: db $F0, $AC, $F0 ; set ADSR
#_0C87C9: #_CHAOS_785C: db $F1, $08 ; set SRCN
#_0C87CB: #_CHAOS_785E: db $8A ; dur 0x0A

CHAOS_SEGMENT_785F:
#_0C87CC: #_CHAOS_785F: db $0A ; play note As2
#_0C87CD: #_CHAOS_7860: db $0E ; play note D3
#_0C87CE: #_CHAOS_7861: db $0D ; play note Cs3
#_0C87CF: #_CHAOS_7862: db $07 ; play note G2
#_0C87D0: #_CHAOS_7863: db $F8 : dw CHAOS_SEGMENT_785F ; goto location
#_0C87D3: #_CHAOS_7866: db $FF ; end track

CHAOS_SEGMENT_7867:
#_0C87D4: #_CHAOS_7867: db $70 ; vol 0x10
#_0C87D5: #_CHAOS_7868: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Neutral_SPC_Data:
#_0C87D6: dw $0092, $0000

SONG_NEUTRAL:
#_0C87DA: #_NEUTRAL_7800: db $F1, $00 ; Set control
#_0C87DC: #_NEUTRAL_7802: db $00 : dw NEUTRAL_SEGMENT_781B ; Music channel 0
#_0C87DF: #_NEUTRAL_7805: db $01 : dw NEUTRAL_SEGMENT_7826 ; Music channel 1
#_0C87E2: #_NEUTRAL_7808: db $02 : dw NEUTRAL_SEGMENT_7853 ; Music channel 2
#_0C87E5: #_NEUTRAL_780B: db $03 : dw NEUTRAL_SEGMENT_785A ; Music channel 3
#_0C87E8: #_NEUTRAL_780E: db $04 : dw NEUTRAL_SEGMENT_7864 ; Music channel 4
#_0C87EB: #_NEUTRAL_7811: db $05 : dw NEUTRAL_SEGMENT_7865 ; Music channel 5
#_0C87EE: #_NEUTRAL_7814: db $06 : dw NEUTRAL_SEGMENT_7866 ; Music channel 6
#_0C87F1: #_NEUTRAL_7817: db $07 : dw NEUTRAL_SEGMENT_787D ; Music channel 7
#_0C87F4: #_NEUTRAL_781A: db $FF ; end of header

NEUTRAL_SEGMENT_781B:
#_0C87F5: #_NEUTRAL_781B: db $87 ; dur 0x07
#_0C87F6: #_NEUTRAL_781C: db $30 ; rest
#_0C87F7: #_NEUTRAL_781D: db $70 ; vol 0x10
#_0C87F8: #_NEUTRAL_781E: db $F2, $68 ; set panning
#_0C87FA: #_NEUTRAL_7820: db $F9, $10 ; set fine tuning
#_0C87FC: #_NEUTRAL_7822: db $F8 : dw NEUTRAL_SEGMENT_7829 ; goto location
#_0C87FF: #_NEUTRAL_7825: db $FF ; end track

NEUTRAL_SEGMENT_7826:
#_0C8800: #_NEUTRAL_7826: db $74 ; vol 0x14

NEUTRAL_SEGMENT_7827:
#_0C8801: #_NEUTRAL_7827: db $F2, $50 ; set panning

NEUTRAL_SEGMENT_7829:
#_0C8803: #_NEUTRAL_7829: db $F0, $FA, $F0 ; set ADSR
#_0C8806: #_NEUTRAL_782C: db $F1, $08 ; set SRCN
#_0C8808: #_NEUTRAL_782E: db $88 ; dur 0x08

NEUTRAL_SEGMENT_782F:
#_0C8809: #_NEUTRAL_782F: db $24 ; play note C5
#_0C880A: #_NEUTRAL_7830: db $26 ; play note D5
#_0C880B: #_NEUTRAL_7831: db $23 ; play note B4
#_0C880C: #_NEUTRAL_7832: db $24 ; play note C5
#_0C880D: #_NEUTRAL_7833: db $21 ; play note A4
#_0C880E: #_NEUTRAL_7834: db $23 ; play note B4
#_0C880F: #_NEUTRAL_7835: db $1F ; play note G4
#_0C8810: #_NEUTRAL_7836: db $21 ; play note A4
#_0C8811: #_NEUTRAL_7837: db $24 ; play note C5
#_0C8812: #_NEUTRAL_7838: db $26 ; play note D5
#_0C8813: #_NEUTRAL_7839: db $23 ; play note B4
#_0C8814: #_NEUTRAL_783A: db $24 ; play note C5
#_0C8815: #_NEUTRAL_783B: db $21 ; play note A4
#_0C8816: #_NEUTRAL_783C: db $23 ; play note B4
#_0C8817: #_NEUTRAL_783D: db $1F ; play note G4
#_0C8818: #_NEUTRAL_783E: db $21 ; play note A4
#_0C8819: #_NEUTRAL_783F: db $24 ; play note C5
#_0C881A: #_NEUTRAL_7840: db $26 ; play note D5
#_0C881B: #_NEUTRAL_7841: db $23 ; play note B4
#_0C881C: #_NEUTRAL_7842: db $24 ; play note C5
#_0C881D: #_NEUTRAL_7843: db $21 ; play note A4
#_0C881E: #_NEUTRAL_7844: db $23 ; play note B4
#_0C881F: #_NEUTRAL_7845: db $1F ; play note G4
#_0C8820: #_NEUTRAL_7846: db $21 ; play note A4
#_0C8821: #_NEUTRAL_7847: db $1E ; play note Fs4
#_0C8822: #_NEUTRAL_7848: db $1F ; play note G4
#_0C8823: #_NEUTRAL_7849: db $1C ; play note E4
#_0C8824: #_NEUTRAL_784A: db $1E ; play note Fs4
#_0C8825: #_NEUTRAL_784B: db $1A ; play note D4
#_0C8826: #_NEUTRAL_784C: db $1C ; play note E4
#_0C8827: #_NEUTRAL_784D: db $18 ; play note C4
#_0C8828: #_NEUTRAL_784E: db $1A ; play note D4
#_0C8829: #_NEUTRAL_784F: db $F8 : dw NEUTRAL_SEGMENT_782F ; goto location
#_0C882C: #_NEUTRAL_7852: db $FF ; end track

NEUTRAL_SEGMENT_7853:
#_0C882D: #_NEUTRAL_7853: db $64 ; vol 0x04
#_0C882E: #_NEUTRAL_7854: db $F9, $30 ; set fine tuning
#_0C8830: #_NEUTRAL_7856: db $F8 : dw NEUTRAL_SEGMENT_7827 ; goto location
#_0C8833: #_NEUTRAL_7859: db $FF ; end track

NEUTRAL_SEGMENT_785A:
#_0C8834: #_NEUTRAL_785A: db $87 ; dur 0x07
#_0C8835: #_NEUTRAL_785B: db $30 ; rest
#_0C8836: #_NEUTRAL_785C: db $F2, $68 ; set panning
#_0C8838: #_NEUTRAL_785E: db $F9, $10 ; set fine tuning
#_0C883A: #_NEUTRAL_7860: db $F8 : dw NEUTRAL_SEGMENT_7868 ; goto location
#_0C883D: #_NEUTRAL_7863: db $FF ; end track

NEUTRAL_SEGMENT_7864:
#_0C883E: #_NEUTRAL_7864: db $FF ; end track

NEUTRAL_SEGMENT_7865:
#_0C883F: #_NEUTRAL_7865: db $FF ; end track

NEUTRAL_SEGMENT_7866:
#_0C8840: #_NEUTRAL_7866: db $F2, $50 ; set panning

NEUTRAL_SEGMENT_7868:
#_0C8842: #_NEUTRAL_7868: db $70 ; vol 0x10
#_0C8843: #_NEUTRAL_7869: db $F0, $FA, $E6 ; set ADSR
#_0C8846: #_NEUTRAL_786C: db $F1, $03 ; set SRCN
#_0C8848: #_NEUTRAL_786E: db $F3, $FC ; transpose -4

NEUTRAL_SEGMENT_7870:
#_0C884A: #_NEUTRAL_7870: db $8E ; dur 0x0E
#_0C884B: #_NEUTRAL_7871: db $13 ; play note G3
#_0C884C: #_NEUTRAL_7872: db $12 ; play note Fs3
#_0C884D: #_NEUTRAL_7873: db $13 ; play note G3
#_0C884E: #_NEUTRAL_7874: db $8B ; dur 0x0B
#_0C884F: #_NEUTRAL_7875: db $12 ; play note Fs3
#_0C8850: #_NEUTRAL_7876: db $0E ; play note D3
#_0C8851: #_NEUTRAL_7877: db $8A ; dur 0x0A
#_0C8852: #_NEUTRAL_7878: db $31 ; tie
#_0C8853: #_NEUTRAL_7879: db $F8 : dw NEUTRAL_SEGMENT_7870 ; goto location
#_0C8856: #_NEUTRAL_787C: db $FF ; end track

NEUTRAL_SEGMENT_787D:
#_0C8857: #_NEUTRAL_787D: db $70 ; vol 0x10
#_0C8858: #_NEUTRAL_787E: db $F0, $FF, $E2 ; set ADSR
#_0C885B: #_NEUTRAL_7881: db $F1, $02 ; set SRCN
#_0C885D: #_NEUTRAL_7883: db $F2, $52 ; set panning
#_0C885F: #_NEUTRAL_7885: db $8E ; dur 0x0E

NEUTRAL_SEGMENT_7886:
#_0C8860: #_NEUTRAL_7886: db $18 ; play note C4
#_0C8861: #_NEUTRAL_7887: db $31 ; tie
#_0C8862: #_NEUTRAL_7888: db $1A ; play note D4
#_0C8863: #_NEUTRAL_7889: db $31 ; tie
#_0C8864: #_NEUTRAL_788A: db $18 ; play note C4
#_0C8865: #_NEUTRAL_788B: db $31 ; tie
#_0C8866: #_NEUTRAL_788C: db $1A ; play note D4
#_0C8867: #_NEUTRAL_788D: db $31 ; tie
#_0C8868: #_NEUTRAL_788E: db $F8 : dw NEUTRAL_SEGMENT_7886 ; goto location
#_0C886B: #_NEUTRAL_7891: db $FF ; end track


;===================================================================================================
; 
;===================================================================================================
Ginza_SPC_Data:
#_0C886C: dw $0446, $0000

SONG_GINZA:
#_0C8870: #_GINZA_7800: db $F1, $00 ; Set control
#_0C8872: #_GINZA_7802: db $00 : dw GINZA_SEGMENT_781B ; Music channel 0
#_0C8875: #_GINZA_7805: db $01 : dw GINZA_SEGMENT_78DF ; Music channel 1
#_0C8878: #_GINZA_7808: db $02 : dw GINZA_SEGMENT_78E5 ; Music channel 2
#_0C887B: #_GINZA_780B: db $03 : dw GINZA_SEGMENT_7A1B ; Music channel 3
#_0C887E: #_GINZA_780E: db $04 : dw GINZA_SEGMENT_7A23 ; Music channel 4
#_0C8881: #_GINZA_7811: db $05 : dw GINZA_SEGMENT_7A2D ; Music channel 5
#_0C8884: #_GINZA_7814: db $06 : dw GINZA_SEGMENT_7A93 ; Music channel 6
#_0C8887: #_GINZA_7817: db $07 : dw GINZA_SEGMENT_7B4F ; Music channel 7
#_0C888A: #_GINZA_781A: db $FF ; end of header

GINZA_SEGMENT_781B:
#_0C888B: #_GINZA_781B: db $64 ; vol 0x04

GINZA_SEGMENT_781C:
#_0C888C: #_GINZA_781C: db $F2, $58 ; set panning

GINZA_SEGMENT_781E:
#_0C888E: #_GINZA_781E: db $F0, $EF, $A4 ; set ADSR
#_0C8891: #_GINZA_7821: db $F1, $04 ; set SRCN
#_0C8893: #_GINZA_7823: db $F3, $0C ; transpose +12
#_0C8895: #_GINZA_7825: db $F6 : dw GINZA_SEGMENT_7887 ; subroutine B
#_0C8898: #_GINZA_7828: db $98 ; dur 0x18
#_0C8899: #_GINZA_7829: db $15 ; play note A3
#_0C889A: #_GINZA_782A: db $96 ; dur 0x16
#_0C889B: #_GINZA_782B: db $30 ; rest
#_0C889C: #_GINZA_782C: db $99 ; dur 0x19
#_0C889D: #_GINZA_782D: db $15 ; play note A3
#_0C889E: #_GINZA_782E: db $98 ; dur 0x18
#_0C889F: #_GINZA_782F: db $16 ; play note As3
#_0C88A0: #_GINZA_7830: db $F6 : dw GINZA_SEGMENT_7887 ; subroutine B
#_0C88A3: #_GINZA_7833: db $9C ; dur 0x1C
#_0C88A4: #_GINZA_7834: db $15 ; play note A3
#_0C88A5: #_GINZA_7835: db $9A ; dur 0x1A
#_0C88A6: #_GINZA_7836: db $31 ; tie
#_0C88A7: #_GINZA_7837: db $E3, $F0 ; pitch bend on
#_0C88A9: #_GINZA_7839: db $31 ; tie
#_0C88AA: #_GINZA_783A: db $E2 ; pitch bend off

GINZA_SEGMENT_783B:
#_0C88AB: #_GINZA_783B: db $F4, $04 ; set loop point B
#_0C88AD: #_GINZA_783D: db $96 ; dur 0x16
#_0C88AE: #_GINZA_783E: db $30 ; rest
#_0C88AF: #_GINZA_783F: db $30 ; rest
#_0C88B0: #_GINZA_7840: db $17 ; play note B3
#_0C88B1: #_GINZA_7841: db $30 ; rest
#_0C88B2: #_GINZA_7842: db $30 ; rest
#_0C88B3: #_GINZA_7843: db $17 ; play note B3
#_0C88B4: #_GINZA_7844: db $30 ; rest
#_0C88B5: #_GINZA_7845: db $30 ; rest
#_0C88B6: #_GINZA_7846: db $15 ; play note A3
#_0C88B7: #_GINZA_7847: db $30 ; rest
#_0C88B8: #_GINZA_7848: db $30 ; rest
#_0C88B9: #_GINZA_7849: db $15 ; play note A3
#_0C88BA: #_GINZA_784A: db $30 ; rest
#_0C88BB: #_GINZA_784B: db $14 ; play note Gs3
#_0C88BC: #_GINZA_784C: db $15 ; play note A3
#_0C88BD: #_GINZA_784D: db $16 ; play note As3
#_0C88BE: #_GINZA_784E: db $30 ; rest
#_0C88BF: #_GINZA_784F: db $30 ; rest
#_0C88C0: #_GINZA_7850: db $17 ; play note B3
#_0C88C1: #_GINZA_7851: db $30 ; rest
#_0C88C2: #_GINZA_7852: db $30 ; rest
#_0C88C3: #_GINZA_7853: db $15 ; play note A3
#_0C88C4: #_GINZA_7854: db $30 ; rest
#_0C88C5: #_GINZA_7855: db $30 ; rest
#_0C88C6: #_GINZA_7856: db $99 ; dur 0x19
#_0C88C7: #_GINZA_7857: db $13 ; play note G3
#_0C88C8: #_GINZA_7858: db $15 ; play note A3
#_0C88C9: #_GINZA_7859: db $98 ; dur 0x18
#_0C88CA: #_GINZA_785A: db $31 ; tie
#_0C88CB: #_GINZA_785B: db $F5 ; run loop B
#_0C88CC: #_GINZA_785C: db $F6 : dw GINZA_SEGMENT_78A4 ; subroutine B
#_0C88CF: #_GINZA_785F: db $99 ; dur 0x19
#_0C88D0: #_GINZA_7860: db $10 ; play note E3
#_0C88D1: #_GINZA_7861: db $10 ; play note E3
#_0C88D2: #_GINZA_7862: db $98 ; dur 0x18
#_0C88D3: #_GINZA_7863: db $11 ; play note F3
#_0C88D4: #_GINZA_7864: db $F6 : dw GINZA_SEGMENT_78A4 ; subroutine B
#_0C88D7: #_GINZA_7867: db $9B ; dur 0x1B
#_0C88D8: #_GINZA_7868: db $12 ; play note Fs3
#_0C88D9: #_GINZA_7869: db $E3, $F0 ; pitch bend on
#_0C88DB: #_GINZA_786B: db $98 ; dur 0x18
#_0C88DC: #_GINZA_786C: db $31 ; tie
#_0C88DD: #_GINZA_786D: db $E2 ; pitch bend off
#_0C88DE: #_GINZA_786E: db $F6 : dw GINZA_SEGMENT_7887 ; subroutine B
#_0C88E1: #_GINZA_7871: db $98 ; dur 0x18
#_0C88E2: #_GINZA_7872: db $15 ; play note A3
#_0C88E3: #_GINZA_7873: db $96 ; dur 0x16
#_0C88E4: #_GINZA_7874: db $30 ; rest
#_0C88E5: #_GINZA_7875: db $99 ; dur 0x19
#_0C88E6: #_GINZA_7876: db $15 ; play note A3
#_0C88E7: #_GINZA_7877: db $98 ; dur 0x18
#_0C88E8: #_GINZA_7878: db $16 ; play note As3
#_0C88E9: #_GINZA_7879: db $F6 : dw GINZA_SEGMENT_7887 ; subroutine B
#_0C88EC: #_GINZA_787C: db $9C ; dur 0x1C
#_0C88ED: #_GINZA_787D: db $15 ; play note A3
#_0C88EE: #_GINZA_787E: db $9A ; dur 0x1A
#_0C88EF: #_GINZA_787F: db $31 ; tie
#_0C88F0: #_GINZA_7880: db $E3, $F0 ; pitch bend on
#_0C88F2: #_GINZA_7882: db $31 ; tie
#_0C88F3: #_GINZA_7883: db $E2 ; pitch bend off
#_0C88F4: #_GINZA_7884: db $F8 : dw GINZA_SEGMENT_783B ; goto location

GINZA_SEGMENT_7887:
#_0C88F7: #_GINZA_7887: db $96 ; dur 0x16
#_0C88F8: #_GINZA_7888: db $30 ; rest
#_0C88F9: #_GINZA_7889: db $30 ; rest
#_0C88FA: #_GINZA_788A: db $17 ; play note B3
#_0C88FB: #_GINZA_788B: db $30 ; rest
#_0C88FC: #_GINZA_788C: db $30 ; rest
#_0C88FD: #_GINZA_788D: db $17 ; play note B3
#_0C88FE: #_GINZA_788E: db $30 ; rest
#_0C88FF: #_GINZA_788F: db $30 ; rest
#_0C8900: #_GINZA_7890: db $99 ; dur 0x19
#_0C8901: #_GINZA_7891: db $1C ; play note E4
#_0C8902: #_GINZA_7892: db $98 ; dur 0x18
#_0C8903: #_GINZA_7893: db $1A ; play note D4
#_0C8904: #_GINZA_7894: db $96 ; dur 0x16
#_0C8905: #_GINZA_7895: db $1C ; play note E4
#_0C8906: #_GINZA_7896: db $FC ; fade out
#_0C8907: #_GINZA_7897: db $98 ; dur 0x18
#_0C8908: #_GINZA_7898: db $1A ; play note D4
#_0C8909: #_GINZA_7899: db $FD ; disable fade
#_0C890A: #_GINZA_789A: db $96 ; dur 0x16
#_0C890B: #_GINZA_789B: db $30 ; rest
#_0C890C: #_GINZA_789C: db $30 ; rest
#_0C890D: #_GINZA_789D: db $17 ; play note B3
#_0C890E: #_GINZA_789E: db $30 ; rest
#_0C890F: #_GINZA_789F: db $30 ; rest
#_0C8910: #_GINZA_78A0: db $17 ; play note B3
#_0C8911: #_GINZA_78A1: db $30 ; rest
#_0C8912: #_GINZA_78A2: db $30 ; rest
#_0C8913: #_GINZA_78A3: db $F7 ; return from routine B

GINZA_SEGMENT_78A4:
#_0C8914: #_GINZA_78A4: db $96 ; dur 0x16
#_0C8915: #_GINZA_78A5: db $30 ; rest
#_0C8916: #_GINZA_78A6: db $30 ; rest
#_0C8917: #_GINZA_78A7: db $12 ; play note Fs3
#_0C8918: #_GINZA_78A8: db $30 ; rest
#_0C8919: #_GINZA_78A9: db $30 ; rest
#_0C891A: #_GINZA_78AA: db $12 ; play note Fs3
#_0C891B: #_GINZA_78AB: db $30 ; rest
#_0C891C: #_GINZA_78AC: db $30 ; rest
#_0C891D: #_GINZA_78AD: db $13 ; play note G3
#_0C891E: #_GINZA_78AE: db $30 ; rest
#_0C891F: #_GINZA_78AF: db $30 ; rest
#_0C8920: #_GINZA_78B0: db $13 ; play note G3
#_0C8921: #_GINZA_78B1: db $30 ; rest
#_0C8922: #_GINZA_78B2: db $30 ; rest
#_0C8923: #_GINZA_78B3: db $12 ; play note Fs3
#_0C8924: #_GINZA_78B4: db $13 ; play note G3
#_0C8925: #_GINZA_78B5: db $30 ; rest
#_0C8926: #_GINZA_78B6: db $30 ; rest
#_0C8927: #_GINZA_78B7: db $12 ; play note Fs3
#_0C8928: #_GINZA_78B8: db $30 ; rest
#_0C8929: #_GINZA_78B9: db $30 ; rest
#_0C892A: #_GINZA_78BA: db $12 ; play note Fs3
#_0C892B: #_GINZA_78BB: db $30 ; rest
#_0C892C: #_GINZA_78BC: db $30 ; rest
#_0C892D: #_GINZA_78BD: db $12 ; play note Fs3
#_0C892E: #_GINZA_78BE: db $15 ; play note A3
#_0C892F: #_GINZA_78BF: db $30 ; rest
#_0C8930: #_GINZA_78C0: db $14 ; play note Gs3
#_0C8931: #_GINZA_78C1: db $30 ; rest
#_0C8932: #_GINZA_78C2: db $13 ; play note G3
#_0C8933: #_GINZA_78C3: db $30 ; rest
#_0C8934: #_GINZA_78C4: db $10 ; play note E3
#_0C8935: #_GINZA_78C5: db $96 ; dur 0x16
#_0C8936: #_GINZA_78C6: db $30 ; rest
#_0C8937: #_GINZA_78C7: db $30 ; rest
#_0C8938: #_GINZA_78C8: db $12 ; play note Fs3
#_0C8939: #_GINZA_78C9: db $30 ; rest
#_0C893A: #_GINZA_78CA: db $30 ; rest
#_0C893B: #_GINZA_78CB: db $12 ; play note Fs3
#_0C893C: #_GINZA_78CC: db $30 ; rest
#_0C893D: #_GINZA_78CD: db $30 ; rest
#_0C893E: #_GINZA_78CE: db $13 ; play note G3
#_0C893F: #_GINZA_78CF: db $30 ; rest
#_0C8940: #_GINZA_78D0: db $30 ; rest
#_0C8941: #_GINZA_78D1: db $13 ; play note G3
#_0C8942: #_GINZA_78D2: db $30 ; rest
#_0C8943: #_GINZA_78D3: db $30 ; rest
#_0C8944: #_GINZA_78D4: db $12 ; play note Fs3
#_0C8945: #_GINZA_78D5: db $13 ; play note G3
#_0C8946: #_GINZA_78D6: db $30 ; rest
#_0C8947: #_GINZA_78D7: db $30 ; rest
#_0C8948: #_GINZA_78D8: db $12 ; play note Fs3
#_0C8949: #_GINZA_78D9: db $30 ; rest
#_0C894A: #_GINZA_78DA: db $30 ; rest
#_0C894B: #_GINZA_78DB: db $12 ; play note Fs3
#_0C894C: #_GINZA_78DC: db $30 ; rest
#_0C894D: #_GINZA_78DD: db $30 ; rest
#_0C894E: #_GINZA_78DE: db $F7 ; return from routine B

GINZA_SEGMENT_78DF:
#_0C894F: #_GINZA_78DF: db $74 ; vol 0x14
#_0C8950: #_GINZA_78E0: db $F9, $30 ; set fine tuning
#_0C8952: #_GINZA_78E2: db $F8 : dw GINZA_SEGMENT_781C ; goto location

GINZA_SEGMENT_78E5:
#_0C8955: #_GINZA_78E5: db $74 ; vol 0x14
#_0C8956: #_GINZA_78E6: db $F2, $66 ; set panning

GINZA_SEGMENT_78E8:
#_0C8958: #_GINZA_78E8: db $9E ; dur 0x1E
#_0C8959: #_GINZA_78E9: db $30 ; rest
#_0C895A: #_GINZA_78EA: db $30 ; rest
#_0C895B: #_GINZA_78EB: db $30 ; rest
#_0C895C: #_GINZA_78EC: db $30 ; rest
#_0C895D: #_GINZA_78ED: db $9C ; dur 0x1C
#_0C895E: #_GINZA_78EE: db $30 ; rest

GINZA_SEGMENT_78EF:
#_0C895F: #_GINZA_78EF: db $F6 : dw GINZA_SEGMENT_7924 ; subroutine B
#_0C8962: #_GINZA_78F2: db $2D ; play note A5
#_0C8963: #_GINZA_78F3: db $2F ; play note B5
#_0C8964: #_GINZA_78F4: db $F0, $FF, $EA ; set ADSR
#_0C8967: #_GINZA_78F7: db $96 ; dur 0x16
#_0C8968: #_GINZA_78F8: db $2B ; play note G5
#_0C8969: #_GINZA_78F9: db $9B ; dur 0x1B
#_0C896A: #_GINZA_78FA: db $28 ; play note E5
#_0C896B: #_GINZA_78FB: db $31 ; tie
#_0C896C: #_GINZA_78FC: db $96 ; dur 0x16
#_0C896D: #_GINZA_78FD: db $31 ; tie
#_0C896E: #_GINZA_78FE: db $98 ; dur 0x18
#_0C896F: #_GINZA_78FF: db $28 ; play note E5
#_0C8970: #_GINZA_7900: db $2B ; play note G5
#_0C8971: #_GINZA_7901: db $28 ; play note E5
#_0C8972: #_GINZA_7902: db $99 ; dur 0x19
#_0C8973: #_GINZA_7903: db $2D ; play note A5
#_0C8974: #_GINZA_7904: db $96 ; dur 0x16
#_0C8975: #_GINZA_7905: db $2B ; play note G5
#_0C8976: #_GINZA_7906: db $2A ; play note Fs5
#_0C8977: #_GINZA_7907: db $28 ; play note E5
#_0C8978: #_GINZA_7908: db $9A ; dur 0x1A
#_0C8979: #_GINZA_7909: db $26 ; play note D5
#_0C897A: #_GINZA_790A: db $98 ; dur 0x18
#_0C897B: #_GINZA_790B: db $28 ; play note E5
#_0C897C: #_GINZA_790C: db $96 ; dur 0x16
#_0C897D: #_GINZA_790D: db $2B ; play note G5
#_0C897E: #_GINZA_790E: db $9B ; dur 0x1B
#_0C897F: #_GINZA_790F: db $28 ; play note E5
#_0C8980: #_GINZA_7910: db $31 ; tie
#_0C8981: #_GINZA_7911: db $96 ; dur 0x16
#_0C8982: #_GINZA_7912: db $31 ; tie
#_0C8983: #_GINZA_7913: db $98 ; dur 0x18
#_0C8984: #_GINZA_7914: db $28 ; play note E5
#_0C8985: #_GINZA_7915: db $2B ; play note G5
#_0C8986: #_GINZA_7916: db $28 ; play note E5
#_0C8987: #_GINZA_7917: db $99 ; dur 0x19
#_0C8988: #_GINZA_7918: db $2D ; play note A5
#_0C8989: #_GINZA_7919: db $96 ; dur 0x16
#_0C898A: #_GINZA_791A: db $2B ; play note G5
#_0C898B: #_GINZA_791B: db $9C ; dur 0x1C
#_0C898C: #_GINZA_791C: db $2A ; play note Fs5
#_0C898D: #_GINZA_791D: db $9B ; dur 0x1B
#_0C898E: #_GINZA_791E: db $31 ; tie
#_0C898F: #_GINZA_791F: db $98 ; dur 0x18
#_0C8990: #_GINZA_7920: db $31 ; tie
#_0C8991: #_GINZA_7921: db $F8 : dw GINZA_SEGMENT_78EF ; goto location

GINZA_SEGMENT_7924:
#_0C8994: #_GINZA_7924: db $F0, $FF, $EC ; set ADSR
#_0C8997: #_GINZA_7927: db $F1, $09 ; set SRCN
#_0C8999: #_GINZA_7929: db $96 ; dur 0x16
#_0C899A: #_GINZA_792A: db $23 ; play note B4
#_0C899B: #_GINZA_792B: db $1F ; play note G4
#_0C899C: #_GINZA_792C: db $9B ; dur 0x1B
#_0C899D: #_GINZA_792D: db $1C ; play note E4
#_0C899E: #_GINZA_792E: db $9C ; dur 0x1C
#_0C899F: #_GINZA_792F: db $31 ; tie
#_0C89A0: #_GINZA_7930: db $96 ; dur 0x16
#_0C89A1: #_GINZA_7931: db $23 ; play note B4
#_0C89A2: #_GINZA_7932: db $1F ; play note G4
#_0C89A3: #_GINZA_7933: db $9A ; dur 0x1A
#_0C89A4: #_GINZA_7934: db $1C ; play note E4
#_0C89A5: #_GINZA_7935: db $98 ; dur 0x18
#_0C89A6: #_GINZA_7936: db $23 ; play note B4
#_0C89A7: #_GINZA_7937: db $96 ; dur 0x16
#_0C89A8: #_GINZA_7938: db $21 ; play note A4
#_0C89A9: #_GINZA_7939: db $1E ; play note Fs4
#_0C89AA: #_GINZA_793A: db $9B ; dur 0x1B
#_0C89AB: #_GINZA_793B: db $1A ; play note D4
#_0C89AC: #_GINZA_793C: db $96 ; dur 0x16
#_0C89AD: #_GINZA_793D: db $23 ; play note B4
#_0C89AE: #_GINZA_793E: db $1F ; play note G4
#_0C89AF: #_GINZA_793F: db $9A ; dur 0x1A
#_0C89B0: #_GINZA_7940: db $1C ; play note E4
#_0C89B1: #_GINZA_7941: db $98 ; dur 0x18
#_0C89B2: #_GINZA_7942: db $26 ; play note D5
#_0C89B3: #_GINZA_7943: db $96 ; dur 0x16
#_0C89B4: #_GINZA_7944: db $25 ; play note Cs5
#_0C89B5: #_GINZA_7945: db $21 ; play note A4
#_0C89B6: #_GINZA_7946: db $9A ; dur 0x1A
#_0C89B7: #_GINZA_7947: db $1C ; play note E4
#_0C89B8: #_GINZA_7948: db $98 ; dur 0x18
#_0C89B9: #_GINZA_7949: db $25 ; play note Cs5
#_0C89BA: #_GINZA_794A: db $96 ; dur 0x16
#_0C89BB: #_GINZA_794B: db $24 ; play note C5
#_0C89BC: #_GINZA_794C: db $1F ; play note G4
#_0C89BD: #_GINZA_794D: db $9A ; dur 0x1A
#_0C89BE: #_GINZA_794E: db $1C ; play note E4
#_0C89BF: #_GINZA_794F: db $98 ; dur 0x18
#_0C89C0: #_GINZA_7950: db $24 ; play note C5
#_0C89C1: #_GINZA_7951: db $96 ; dur 0x16
#_0C89C2: #_GINZA_7952: db $23 ; play note B4
#_0C89C3: #_GINZA_7953: db $1F ; play note G4
#_0C89C4: #_GINZA_7954: db $99 ; dur 0x19
#_0C89C5: #_GINZA_7955: db $1C ; play note E4
#_0C89C6: #_GINZA_7956: db $96 ; dur 0x16
#_0C89C7: #_GINZA_7957: db $1A ; play note D4
#_0C89C8: #_GINZA_7958: db $1C ; play note E4
#_0C89C9: #_GINZA_7959: db $1E ; play note Fs4
#_0C89CA: #_GINZA_795A: db $26 ; play note D5
#_0C89CB: #_GINZA_795B: db $1F ; play note G4
#_0C89CC: #_GINZA_795C: db $1C ; play note E4
#_0C89CD: #_GINZA_795D: db $26 ; play note D5
#_0C89CE: #_GINZA_795E: db $1F ; play note G4
#_0C89CF: #_GINZA_795F: db $1C ; play note E4
#_0C89D0: #_GINZA_7960: db $26 ; play note D5
#_0C89D1: #_GINZA_7961: db $1F ; play note G4
#_0C89D2: #_GINZA_7962: db $25 ; play note Cs5
#_0C89D3: #_GINZA_7963: db $1F ; play note G4
#_0C89D4: #_GINZA_7964: db $1C ; play note E4
#_0C89D5: #_GINZA_7965: db $25 ; play note Cs5
#_0C89D6: #_GINZA_7966: db $1F ; play note G4
#_0C89D7: #_GINZA_7967: db $1C ; play note E4
#_0C89D8: #_GINZA_7968: db $25 ; play note Cs5
#_0C89D9: #_GINZA_7969: db $1F ; play note G4
#_0C89DA: #_GINZA_796A: db $24 ; play note C5
#_0C89DB: #_GINZA_796B: db $1F ; play note G4
#_0C89DC: #_GINZA_796C: db $1C ; play note E4
#_0C89DD: #_GINZA_796D: db $24 ; play note C5
#_0C89DE: #_GINZA_796E: db $1F ; play note G4
#_0C89DF: #_GINZA_796F: db $1C ; play note E4
#_0C89E0: #_GINZA_7970: db $24 ; play note C5
#_0C89E1: #_GINZA_7971: db $1F ; play note G4
#_0C89E2: #_GINZA_7972: db $23 ; play note B4
#_0C89E3: #_GINZA_7973: db $1F ; play note G4
#_0C89E4: #_GINZA_7974: db $1C ; play note E4
#_0C89E5: #_GINZA_7975: db $23 ; play note B4
#_0C89E6: #_GINZA_7976: db $1F ; play note G4
#_0C89E7: #_GINZA_7977: db $1C ; play note E4
#_0C89E8: #_GINZA_7978: db $23 ; play note B4
#_0C89E9: #_GINZA_7979: db $1F ; play note G4
#_0C89EA: #_GINZA_797A: db $26 ; play note D5
#_0C89EB: #_GINZA_797B: db $1F ; play note G4
#_0C89EC: #_GINZA_797C: db $1C ; play note E4
#_0C89ED: #_GINZA_797D: db $26 ; play note D5
#_0C89EE: #_GINZA_797E: db $1F ; play note G4
#_0C89EF: #_GINZA_797F: db $1C ; play note E4
#_0C89F0: #_GINZA_7980: db $26 ; play note D5
#_0C89F1: #_GINZA_7981: db $1F ; play note G4
#_0C89F2: #_GINZA_7982: db $25 ; play note Cs5
#_0C89F3: #_GINZA_7983: db $1F ; play note G4
#_0C89F4: #_GINZA_7984: db $1C ; play note E4
#_0C89F5: #_GINZA_7985: db $25 ; play note Cs5
#_0C89F6: #_GINZA_7986: db $1F ; play note G4
#_0C89F7: #_GINZA_7987: db $1C ; play note E4
#_0C89F8: #_GINZA_7988: db $25 ; play note Cs5
#_0C89F9: #_GINZA_7989: db $1F ; play note G4
#_0C89FA: #_GINZA_798A: db $24 ; play note C5
#_0C89FB: #_GINZA_798B: db $1F ; play note G4
#_0C89FC: #_GINZA_798C: db $1C ; play note E4
#_0C89FD: #_GINZA_798D: db $24 ; play note C5
#_0C89FE: #_GINZA_798E: db $1F ; play note G4
#_0C89FF: #_GINZA_798F: db $1C ; play note E4
#_0C8A00: #_GINZA_7990: db $24 ; play note C5
#_0C8A01: #_GINZA_7991: db $1F ; play note G4
#_0C8A02: #_GINZA_7992: db $23 ; play note B4
#_0C8A03: #_GINZA_7993: db $1F ; play note G4
#_0C8A04: #_GINZA_7994: db $9B ; dur 0x1B
#_0C8A05: #_GINZA_7995: db $1C ; play note E4
#_0C8A06: #_GINZA_7996: db $F0, $FF, $F2 ; set ADSR
#_0C8A09: #_GINZA_7999: db $F1, $08 ; set SRCN
#_0C8A0B: #_GINZA_799B: db $96 ; dur 0x16
#_0C8A0C: #_GINZA_799C: db $17 ; play note B3
#_0C8A0D: #_GINZA_799D: db $18 ; play note C4
#_0C8A0E: #_GINZA_799E: db $1A ; play note D4
#_0C8A0F: #_GINZA_799F: db $1C ; play note E4
#_0C8A10: #_GINZA_79A0: db $1E ; play note Fs4
#_0C8A11: #_GINZA_79A1: db $1F ; play note G4
#_0C8A12: #_GINZA_79A2: db $21 ; play note A4
#_0C8A13: #_GINZA_79A3: db $23 ; play note B4
#_0C8A14: #_GINZA_79A4: db $24 ; play note C5
#_0C8A15: #_GINZA_79A5: db $23 ; play note B4
#_0C8A16: #_GINZA_79A6: db $21 ; play note A4
#_0C8A17: #_GINZA_79A7: db $1F ; play note G4
#_0C8A18: #_GINZA_79A8: db $1E ; play note Fs4
#_0C8A19: #_GINZA_79A9: db $1C ; play note E4
#_0C8A1A: #_GINZA_79AA: db $1A ; play note D4
#_0C8A1B: #_GINZA_79AB: db $18 ; play note C4
#_0C8A1C: #_GINZA_79AC: db $17 ; play note B3
#_0C8A1D: #_GINZA_79AD: db $18 ; play note C4
#_0C8A1E: #_GINZA_79AE: db $1A ; play note D4
#_0C8A1F: #_GINZA_79AF: db $1C ; play note E4
#_0C8A20: #_GINZA_79B0: db $1E ; play note Fs4
#_0C8A21: #_GINZA_79B1: db $1F ; play note G4
#_0C8A22: #_GINZA_79B2: db $21 ; play note A4
#_0C8A23: #_GINZA_79B3: db $23 ; play note B4
#_0C8A24: #_GINZA_79B4: db $24 ; play note C5
#_0C8A25: #_GINZA_79B5: db $26 ; play note D5
#_0C8A26: #_GINZA_79B6: db $24 ; play note C5
#_0C8A27: #_GINZA_79B7: db $23 ; play note B4
#_0C8A28: #_GINZA_79B8: db $24 ; play note C5
#_0C8A29: #_GINZA_79B9: db $23 ; play note B4
#_0C8A2A: #_GINZA_79BA: db $21 ; play note A4
#_0C8A2B: #_GINZA_79BB: db $1F ; play note G4
#_0C8A2C: #_GINZA_79BC: db $1E ; play note Fs4
#_0C8A2D: #_GINZA_79BD: db $1C ; play note E4
#_0C8A2E: #_GINZA_79BE: db $1A ; play note D4
#_0C8A2F: #_GINZA_79BF: db $1C ; play note E4
#_0C8A30: #_GINZA_79C0: db $1E ; play note Fs4
#_0C8A31: #_GINZA_79C1: db $1F ; play note G4
#_0C8A32: #_GINZA_79C2: db $21 ; play note A4
#_0C8A33: #_GINZA_79C3: db $1F ; play note G4
#_0C8A34: #_GINZA_79C4: db $21 ; play note A4
#_0C8A35: #_GINZA_79C5: db $23 ; play note B4
#_0C8A36: #_GINZA_79C6: db $21 ; play note A4
#_0C8A37: #_GINZA_79C7: db $1F ; play note G4
#_0C8A38: #_GINZA_79C8: db $1E ; play note Fs4
#_0C8A39: #_GINZA_79C9: db $1C ; play note E4
#_0C8A3A: #_GINZA_79CA: db $1A ; play note D4
#_0C8A3B: #_GINZA_79CB: db $18 ; play note C4
#_0C8A3C: #_GINZA_79CC: db $17 ; play note B3
#_0C8A3D: #_GINZA_79CD: db $18 ; play note C4
#_0C8A3E: #_GINZA_79CE: db $1A ; play note D4
#_0C8A3F: #_GINZA_79CF: db $1C ; play note E4
#_0C8A40: #_GINZA_79D0: db $1E ; play note Fs4
#_0C8A41: #_GINZA_79D1: db $1F ; play note G4
#_0C8A42: #_GINZA_79D2: db $21 ; play note A4
#_0C8A43: #_GINZA_79D3: db $23 ; play note B4
#_0C8A44: #_GINZA_79D4: db $24 ; play note C5
#_0C8A45: #_GINZA_79D5: db $26 ; play note D5
#_0C8A46: #_GINZA_79D6: db $28 ; play note E5
#_0C8A47: #_GINZA_79D7: db $26 ; play note D5
#_0C8A48: #_GINZA_79D8: db $28 ; play note E5
#_0C8A49: #_GINZA_79D9: db $2A ; play note Fs5
#_0C8A4A: #_GINZA_79DA: db $2B ; play note G5
#_0C8A4B: #_GINZA_79DB: db $2D ; play note A5
#_0C8A4C: #_GINZA_79DC: db $2F ; play note B5
#_0C8A4D: #_GINZA_79DD: db $2A ; play note Fs5
#_0C8A4E: #_GINZA_79DE: db $26 ; play note D5
#_0C8A4F: #_GINZA_79DF: db $2F ; play note B5
#_0C8A50: #_GINZA_79E0: db $2A ; play note Fs5
#_0C8A51: #_GINZA_79E1: db $26 ; play note D5
#_0C8A52: #_GINZA_79E2: db $2F ; play note B5
#_0C8A53: #_GINZA_79E3: db $2A ; play note Fs5
#_0C8A54: #_GINZA_79E4: db $2B ; play note G5
#_0C8A55: #_GINZA_79E5: db $28 ; play note E5
#_0C8A56: #_GINZA_79E6: db $24 ; play note C5
#_0C8A57: #_GINZA_79E7: db $2B ; play note G5
#_0C8A58: #_GINZA_79E8: db $28 ; play note E5
#_0C8A59: #_GINZA_79E9: db $24 ; play note C5
#_0C8A5A: #_GINZA_79EA: db $2B ; play note G5
#_0C8A5B: #_GINZA_79EB: db $28 ; play note E5
#_0C8A5C: #_GINZA_79EC: db $2A ; play note Fs5
#_0C8A5D: #_GINZA_79ED: db $26 ; play note D5
#_0C8A5E: #_GINZA_79EE: db $23 ; play note B4
#_0C8A5F: #_GINZA_79EF: db $2A ; play note Fs5
#_0C8A60: #_GINZA_79F0: db $26 ; play note D5
#_0C8A61: #_GINZA_79F1: db $23 ; play note B4
#_0C8A62: #_GINZA_79F2: db $2A ; play note Fs5
#_0C8A63: #_GINZA_79F3: db $26 ; play note D5
#_0C8A64: #_GINZA_79F4: db $2F ; play note B5
#_0C8A65: #_GINZA_79F5: db $2B ; play note G5
#_0C8A66: #_GINZA_79F6: db $30 ; rest
#_0C8A67: #_GINZA_79F7: db $2D ; play note A5
#_0C8A68: #_GINZA_79F8: db $30 ; rest
#_0C8A69: #_GINZA_79F9: db $2B ; play note G5
#_0C8A6A: #_GINZA_79FA: db $30 ; rest
#_0C8A6B: #_GINZA_79FB: db $2A ; play note Fs5
#_0C8A6C: #_GINZA_79FC: db $23 ; play note B4
#_0C8A6D: #_GINZA_79FD: db $24 ; play note C5
#_0C8A6E: #_GINZA_79FE: db $26 ; play note D5
#_0C8A6F: #_GINZA_79FF: db $24 ; play note C5
#_0C8A70: #_GINZA_7A00: db $26 ; play note D5
#_0C8A71: #_GINZA_7A01: db $28 ; play note E5
#_0C8A72: #_GINZA_7A02: db $2A ; play note Fs5
#_0C8A73: #_GINZA_7A03: db $28 ; play note E5
#_0C8A74: #_GINZA_7A04: db $23 ; play note B4
#_0C8A75: #_GINZA_7A05: db $24 ; play note C5
#_0C8A76: #_GINZA_7A06: db $26 ; play note D5
#_0C8A77: #_GINZA_7A07: db $28 ; play note E5
#_0C8A78: #_GINZA_7A08: db $2A ; play note Fs5
#_0C8A79: #_GINZA_7A09: db $2B ; play note G5
#_0C8A7A: #_GINZA_7A0A: db $2D ; play note A5
#_0C8A7B: #_GINZA_7A0B: db $2F ; play note B5
#_0C8A7C: #_GINZA_7A0C: db $2D ; play note A5
#_0C8A7D: #_GINZA_7A0D: db $2F ; play note B5
#_0C8A7E: #_GINZA_7A0E: db $2D ; play note A5
#_0C8A7F: #_GINZA_7A0F: db $2B ; play note G5
#_0C8A80: #_GINZA_7A10: db $2A ; play note Fs5
#_0C8A81: #_GINZA_7A11: db $28 ; play note E5
#_0C8A82: #_GINZA_7A12: db $26 ; play note D5
#_0C8A83: #_GINZA_7A13: db $24 ; play note C5
#_0C8A84: #_GINZA_7A14: db $23 ; play note B4
#_0C8A85: #_GINZA_7A15: db $24 ; play note C5
#_0C8A86: #_GINZA_7A16: db $26 ; play note D5
#_0C8A87: #_GINZA_7A17: db $28 ; play note E5
#_0C8A88: #_GINZA_7A18: db $2A ; play note Fs5
#_0C8A89: #_GINZA_7A19: db $2B ; play note G5
#_0C8A8A: #_GINZA_7A1A: db $F7 ; return from routine B

GINZA_SEGMENT_7A1B:
#_0C8A8B: #_GINZA_7A1B: db $64 ; vol 0x04
#_0C8A8C: #_GINZA_7A1C: db $F2, $66 ; set panning
#_0C8A8E: #_GINZA_7A1E: db $F9, $20 ; set fine tuning
#_0C8A90: #_GINZA_7A20: db $F8 : dw GINZA_SEGMENT_78E8 ; goto location

GINZA_SEGMENT_7A23:
#_0C8A93: #_GINZA_7A23: db $70 ; vol 0x10
#_0C8A94: #_GINZA_7A24: db $97 ; dur 0x17
#_0C8A95: #_GINZA_7A25: db $30 ; rest
#_0C8A96: #_GINZA_7A26: db $F2, $6B ; set panning
#_0C8A98: #_GINZA_7A28: db $F9, $18 ; set fine tuning
#_0C8A9A: #_GINZA_7A2A: db $F8 : dw GINZA_SEGMENT_781E ; goto location

GINZA_SEGMENT_7A2D:
#_0C8A9D: #_GINZA_7A2D: db $86 ; dur 0x06
#_0C8A9E: #_GINZA_7A2E: db $30 ; rest
#_0C8A9F: #_GINZA_7A2F: db $9E ; dur 0x1E
#_0C8AA0: #_GINZA_7A30: db $30 ; rest
#_0C8AA1: #_GINZA_7A31: db $30 ; rest
#_0C8AA2: #_GINZA_7A32: db $30 ; rest
#_0C8AA3: #_GINZA_7A33: db $9C ; dur 0x1C
#_0C8AA4: #_GINZA_7A34: db $30 ; rest
#_0C8AA5: #_GINZA_7A35: db $70 ; vol 0x10
#_0C8AA6: #_GINZA_7A36: db $F0, $FF, $EA ; set ADSR
#_0C8AA9: #_GINZA_7A39: db $F1, $01 ; set SRCN
#_0C8AAB: #_GINZA_7A3B: db $F2, $66 ; set panning
#_0C8AAD: #_GINZA_7A3D: db $F4, $04 ; set loop point B
#_0C8AAF: #_GINZA_7A3F: db $94 ; dur 0x14
#_0C8AB0: #_GINZA_7A40: db $18 ; play note C4
#_0C8AB1: #_GINZA_7A41: db $18 ; play note C4
#_0C8AB2: #_GINZA_7A42: db $98 ; dur 0x18
#_0C8AB3: #_GINZA_7A43: db $18 ; play note C4
#_0C8AB4: #_GINZA_7A44: db $F5 ; run loop B
#_0C8AB5: #_GINZA_7A45: db $96 ; dur 0x16
#_0C8AB6: #_GINZA_7A46: db $30 ; rest
#_0C8AB7: #_GINZA_7A47: db $F1, $00 ; set SRCN
#_0C8AB9: #_GINZA_7A49: db $94 ; dur 0x14
#_0C8ABA: #_GINZA_7A4A: db $18 ; play note C4
#_0C8ABB: #_GINZA_7A4B: db $18 ; play note C4
#_0C8ABC: #_GINZA_7A4C: db $F1, $01 ; set SRCN
#_0C8ABE: #_GINZA_7A4E: db $98 ; dur 0x18
#_0C8ABF: #_GINZA_7A4F: db $18 ; play note C4
#_0C8AC0: #_GINZA_7A50: db $82 ; dur 0x02
#_0C8AC1: #_GINZA_7A51: db $30 ; rest
#_0C8AC2: #_GINZA_7A52: db $94 ; dur 0x14
#_0C8AC3: #_GINZA_7A53: db $30 ; rest

GINZA_SEGMENT_7A54:
#_0C8AC4: #_GINZA_7A54: db $F2, $70 ; set panning
#_0C8AC6: #_GINZA_7A56: db $F9, $10 ; set fine tuning
#_0C8AC8: #_GINZA_7A58: db $F6 : dw GINZA_SEGMENT_7924 ; subroutine B
#_0C8ACB: #_GINZA_7A5B: db $94 ; dur 0x14
#_0C8ACC: #_GINZA_7A5C: db $2D ; play note A5
#_0C8ACD: #_GINZA_7A5D: db $F0, $FF, $EA ; set ADSR
#_0C8AD0: #_GINZA_7A60: db $F2, $66 ; set panning
#_0C8AD2: #_GINZA_7A62: db $F9, $00 ; set fine tuning
#_0C8AD4: #_GINZA_7A64: db $96 ; dur 0x16
#_0C8AD5: #_GINZA_7A65: db $28 ; play note E5
#_0C8AD6: #_GINZA_7A66: db $9B ; dur 0x1B
#_0C8AD7: #_GINZA_7A67: db $23 ; play note B4
#_0C8AD8: #_GINZA_7A68: db $31 ; tie
#_0C8AD9: #_GINZA_7A69: db $96 ; dur 0x16
#_0C8ADA: #_GINZA_7A6A: db $31 ; tie
#_0C8ADB: #_GINZA_7A6B: db $98 ; dur 0x18
#_0C8ADC: #_GINZA_7A6C: db $23 ; play note B4
#_0C8ADD: #_GINZA_7A6D: db $28 ; play note E5
#_0C8ADE: #_GINZA_7A6E: db $23 ; play note B4
#_0C8ADF: #_GINZA_7A6F: db $99 ; dur 0x19
#_0C8AE0: #_GINZA_7A70: db $2A ; play note Fs5
#_0C8AE1: #_GINZA_7A71: db $96 ; dur 0x16
#_0C8AE2: #_GINZA_7A72: db $28 ; play note E5
#_0C8AE3: #_GINZA_7A73: db $26 ; play note D5
#_0C8AE4: #_GINZA_7A74: db $23 ; play note B4
#_0C8AE5: #_GINZA_7A75: db $9A ; dur 0x1A
#_0C8AE6: #_GINZA_7A76: db $21 ; play note A4
#_0C8AE7: #_GINZA_7A77: db $98 ; dur 0x18
#_0C8AE8: #_GINZA_7A78: db $23 ; play note B4
#_0C8AE9: #_GINZA_7A79: db $96 ; dur 0x16
#_0C8AEA: #_GINZA_7A7A: db $28 ; play note E5
#_0C8AEB: #_GINZA_7A7B: db $9B ; dur 0x1B
#_0C8AEC: #_GINZA_7A7C: db $23 ; play note B4
#_0C8AED: #_GINZA_7A7D: db $31 ; tie
#_0C8AEE: #_GINZA_7A7E: db $96 ; dur 0x16
#_0C8AEF: #_GINZA_7A7F: db $31 ; tie
#_0C8AF0: #_GINZA_7A80: db $98 ; dur 0x18
#_0C8AF1: #_GINZA_7A81: db $23 ; play note B4
#_0C8AF2: #_GINZA_7A82: db $28 ; play note E5
#_0C8AF3: #_GINZA_7A83: db $23 ; play note B4
#_0C8AF4: #_GINZA_7A84: db $99 ; dur 0x19
#_0C8AF5: #_GINZA_7A85: db $2A ; play note Fs5
#_0C8AF6: #_GINZA_7A86: db $96 ; dur 0x16
#_0C8AF7: #_GINZA_7A87: db $28 ; play note E5
#_0C8AF8: #_GINZA_7A88: db $9C ; dur 0x1C
#_0C8AF9: #_GINZA_7A89: db $26 ; play note D5
#_0C8AFA: #_GINZA_7A8A: db $9B ; dur 0x1B
#_0C8AFB: #_GINZA_7A8B: db $31 ; tie
#_0C8AFC: #_GINZA_7A8C: db $98 ; dur 0x18
#_0C8AFD: #_GINZA_7A8D: db $31 ; tie
#_0C8AFE: #_GINZA_7A8E: db $97 ; dur 0x17
#_0C8AFF: #_GINZA_7A8F: db $30 ; rest
#_0C8B00: #_GINZA_7A90: db $F8 : dw GINZA_SEGMENT_7A54 ; goto location

GINZA_SEGMENT_7A93:
#_0C8B03: #_GINZA_7A93: db $70 ; vol 0x10
#_0C8B04: #_GINZA_7A94: db $F0, $FF, $F2 ; set ADSR
#_0C8B07: #_GINZA_7A97: db $F1, $08 ; set SRCN
#_0C8B09: #_GINZA_7A99: db $F2, $4C ; set panning
#_0C8B0B: #_GINZA_7A9B: db $F4, $04 ; set loop point B
#_0C8B0D: #_GINZA_7A9D: db $96 ; dur 0x16
#_0C8B0E: #_GINZA_7A9E: db $10 ; play note E3
#_0C8B0F: #_GINZA_7A9F: db $98 ; dur 0x18
#_0C8B10: #_GINZA_7AA0: db $10 ; play note E3
#_0C8B11: #_GINZA_7AA1: db $96 ; dur 0x16
#_0C8B12: #_GINZA_7AA2: db $10 ; play note E3
#_0C8B13: #_GINZA_7AA3: db $98 ; dur 0x18
#_0C8B14: #_GINZA_7AA4: db $10 ; play note E3
#_0C8B15: #_GINZA_7AA5: db $96 ; dur 0x16
#_0C8B16: #_GINZA_7AA6: db $10 ; play note E3
#_0C8B17: #_GINZA_7AA7: db $10 ; play note E3
#_0C8B18: #_GINZA_7AA8: db $9C ; dur 0x1C
#_0C8B19: #_GINZA_7AA9: db $30 ; rest
#_0C8B1A: #_GINZA_7AAA: db $F5 ; run loop B
#_0C8B1B: #_GINZA_7AAB: db $F1, $02 ; set SRCN
#_0C8B1D: #_GINZA_7AAD: db $F2, $50 ; set panning
#_0C8B1F: #_GINZA_7AAF: db $9B ; dur 0x1B
#_0C8B20: #_GINZA_7AB0: db $30 ; rest
#_0C8B21: #_GINZA_7AB1: db $E3, $D8 ; pitch bend on
#_0C8B23: #_GINZA_7AB3: db $98 ; dur 0x18
#_0C8B24: #_GINZA_7AB4: db $1C ; play note E4
#_0C8B25: #_GINZA_7AB5: db $E2 ; pitch bend off

GINZA_SEGMENT_7AB6:
#_0C8B26: #_GINZA_7AB6: db $96 ; dur 0x16
#_0C8B27: #_GINZA_7AB7: db $E4, $04 ; set loop point A
#_0C8B29: #_GINZA_7AB9: db $F4, $08 ; set loop point B
#_0C8B2B: #_GINZA_7ABB: db $1C ; play note E4
#_0C8B2C: #_GINZA_7ABC: db $F5 ; run loop B
#_0C8B2D: #_GINZA_7ABD: db $1A ; play note D4
#_0C8B2E: #_GINZA_7ABE: db $1A ; play note D4
#_0C8B2F: #_GINZA_7ABF: db $1A ; play note D4
#_0C8B30: #_GINZA_7AC0: db $1A ; play note D4
#_0C8B31: #_GINZA_7AC1: db $1A ; play note D4
#_0C8B32: #_GINZA_7AC2: db $19 ; play note Cs4
#_0C8B33: #_GINZA_7AC3: db $1A ; play note D4
#_0C8B34: #_GINZA_7AC4: db $1B ; play note Ds4
#_0C8B35: #_GINZA_7AC5: db $1C ; play note E4
#_0C8B36: #_GINZA_7AC6: db $1C ; play note E4
#_0C8B37: #_GINZA_7AC7: db $1C ; play note E4
#_0C8B38: #_GINZA_7AC8: db $1C ; play note E4
#_0C8B39: #_GINZA_7AC9: db $1C ; play note E4
#_0C8B3A: #_GINZA_7ACA: db $98 ; dur 0x18
#_0C8B3B: #_GINZA_7ACB: db $1A ; play note D4
#_0C8B3C: #_GINZA_7ACC: db $18 ; play note C4
#_0C8B3D: #_GINZA_7ACD: db $96 ; dur 0x16
#_0C8B3E: #_GINZA_7ACE: db $18 ; play note C4
#_0C8B3F: #_GINZA_7ACF: db $18 ; play note C4
#_0C8B40: #_GINZA_7AD0: db $18 ; play note C4
#_0C8B41: #_GINZA_7AD1: db $1A ; play note D4
#_0C8B42: #_GINZA_7AD2: db $1A ; play note D4
#_0C8B43: #_GINZA_7AD3: db $1A ; play note D4
#_0C8B44: #_GINZA_7AD4: db $1A ; play note D4
#_0C8B45: #_GINZA_7AD5: db $E5 ; run loop A
#_0C8B46: #_GINZA_7AD6: db $F6 : dw GINZA_SEGMENT_7B25 ; subroutine B
#_0C8B49: #_GINZA_7AD9: db $17 ; play note B3
#_0C8B4A: #_GINZA_7ADA: db $98 ; dur 0x18
#_0C8B4B: #_GINZA_7ADB: db $1A ; play note D4
#_0C8B4C: #_GINZA_7ADC: db $19 ; play note Cs4
#_0C8B4D: #_GINZA_7ADD: db $18 ; play note C4
#_0C8B4E: #_GINZA_7ADE: db $96 ; dur 0x16
#_0C8B4F: #_GINZA_7ADF: db $15 ; play note A3
#_0C8B50: #_GINZA_7AE0: db $F6 : dw GINZA_SEGMENT_7B25 ; subroutine B
#_0C8B53: #_GINZA_7AE3: db $15 ; play note A3
#_0C8B54: #_GINZA_7AE4: db $14 ; play note Gs3
#_0C8B55: #_GINZA_7AE5: db $15 ; play note A3
#_0C8B56: #_GINZA_7AE6: db $14 ; play note Gs3
#_0C8B57: #_GINZA_7AE7: db $15 ; play note A3
#_0C8B58: #_GINZA_7AE8: db $14 ; play note Gs3
#_0C8B59: #_GINZA_7AE9: db $15 ; play note A3
#_0C8B5A: #_GINZA_7AEA: db $16 ; play note As3
#_0C8B5B: #_GINZA_7AEB: db $F6 : dw GINZA_SEGMENT_7B25 ; subroutine B
#_0C8B5E: #_GINZA_7AEE: db $17 ; play note B3
#_0C8B5F: #_GINZA_7AEF: db $98 ; dur 0x18
#_0C8B60: #_GINZA_7AF0: db $1A ; play note D4
#_0C8B61: #_GINZA_7AF1: db $19 ; play note Cs4
#_0C8B62: #_GINZA_7AF2: db $18 ; play note C4
#_0C8B63: #_GINZA_7AF3: db $96 ; dur 0x16
#_0C8B64: #_GINZA_7AF4: db $15 ; play note A3
#_0C8B65: #_GINZA_7AF5: db $F6 : dw GINZA_SEGMENT_7B25 ; subroutine B
#_0C8B68: #_GINZA_7AF8: db $F0, $FF, $E8 ; set ADSR
#_0C8B6B: #_GINZA_7AFB: db $9B ; dur 0x1B
#_0C8B6C: #_GINZA_7AFC: db $17 ; play note B3
#_0C8B6D: #_GINZA_7AFD: db $E3, $F0 ; pitch bend on
#_0C8B6F: #_GINZA_7AFF: db $98 ; dur 0x18
#_0C8B70: #_GINZA_7B00: db $31 ; tie
#_0C8B71: #_GINZA_7B01: db $E2 ; pitch bend off
#_0C8B72: #_GINZA_7B02: db $F0, $FF, $F2 ; set ADSR
#_0C8B75: #_GINZA_7B05: db $96 ; dur 0x16
#_0C8B76: #_GINZA_7B06: db $F6 : dw GINZA_SEGMENT_7B3E ; subroutine B
#_0C8B79: #_GINZA_7B09: db $19 ; play note Cs4
#_0C8B7A: #_GINZA_7B0A: db $1A ; play note D4
#_0C8B7B: #_GINZA_7B0B: db $1A ; play note D4
#_0C8B7C: #_GINZA_7B0C: db $19 ; play note Cs4
#_0C8B7D: #_GINZA_7B0D: db $1A ; play note D4
#_0C8B7E: #_GINZA_7B0E: db $1A ; play note D4
#_0C8B7F: #_GINZA_7B0F: db $1B ; play note Ds4
#_0C8B80: #_GINZA_7B10: db $1B ; play note Ds4
#_0C8B81: #_GINZA_7B11: db $F6 : dw GINZA_SEGMENT_7B3E ; subroutine B
#_0C8B84: #_GINZA_7B14: db $F0, $FF, $E8 ; set ADSR
#_0C8B87: #_GINZA_7B17: db $9C ; dur 0x1C
#_0C8B88: #_GINZA_7B18: db $1A ; play note D4
#_0C8B89: #_GINZA_7B19: db $9A ; dur 0x1A
#_0C8B8A: #_GINZA_7B1A: db $31 ; tie
#_0C8B8B: #_GINZA_7B1B: db $E3, $F0 ; pitch bend on
#_0C8B8D: #_GINZA_7B1D: db $31 ; tie
#_0C8B8E: #_GINZA_7B1E: db $E2 ; pitch bend off
#_0C8B8F: #_GINZA_7B1F: db $F0, $FF, $F2 ; set ADSR
#_0C8B92: #_GINZA_7B22: db $F8 : dw GINZA_SEGMENT_7AB6 ; goto location

GINZA_SEGMENT_7B25:
#_0C8B95: #_GINZA_7B25: db $16 ; play note As3
#_0C8B96: #_GINZA_7B26: db $17 ; play note B3
#_0C8B97: #_GINZA_7B27: db $17 ; play note B3
#_0C8B98: #_GINZA_7B28: db $16 ; play note As3
#_0C8B99: #_GINZA_7B29: db $17 ; play note B3
#_0C8B9A: #_GINZA_7B2A: db $17 ; play note B3
#_0C8B9B: #_GINZA_7B2B: db $16 ; play note As3
#_0C8B9C: #_GINZA_7B2C: db $17 ; play note B3
#_0C8B9D: #_GINZA_7B2D: db $17 ; play note B3
#_0C8B9E: #_GINZA_7B2E: db $18 ; play note C4
#_0C8B9F: #_GINZA_7B2F: db $18 ; play note C4
#_0C8BA0: #_GINZA_7B30: db $17 ; play note B3
#_0C8BA1: #_GINZA_7B31: db $18 ; play note C4
#_0C8BA2: #_GINZA_7B32: db $18 ; play note C4
#_0C8BA3: #_GINZA_7B33: db $17 ; play note B3
#_0C8BA4: #_GINZA_7B34: db $18 ; play note C4
#_0C8BA5: #_GINZA_7B35: db $16 ; play note As3
#_0C8BA6: #_GINZA_7B36: db $17 ; play note B3
#_0C8BA7: #_GINZA_7B37: db $17 ; play note B3
#_0C8BA8: #_GINZA_7B38: db $16 ; play note As3
#_0C8BA9: #_GINZA_7B39: db $17 ; play note B3
#_0C8BAA: #_GINZA_7B3A: db $17 ; play note B3
#_0C8BAB: #_GINZA_7B3B: db $16 ; play note As3
#_0C8BAC: #_GINZA_7B3C: db $17 ; play note B3
#_0C8BAD: #_GINZA_7B3D: db $F7 ; return from routine B

GINZA_SEGMENT_7B3E:
#_0C8BAE: #_GINZA_7B3E: db $F4, $08 ; set loop point B
#_0C8BB0: #_GINZA_7B40: db $1C ; play note E4
#_0C8BB1: #_GINZA_7B41: db $F5 ; run loop B
#_0C8BB2: #_GINZA_7B42: db $15 ; play note A3
#_0C8BB3: #_GINZA_7B43: db $15 ; play note A3
#_0C8BB4: #_GINZA_7B44: db $15 ; play note A3
#_0C8BB5: #_GINZA_7B45: db $15 ; play note A3
#_0C8BB6: #_GINZA_7B46: db $15 ; play note A3
#_0C8BB7: #_GINZA_7B47: db $15 ; play note A3
#_0C8BB8: #_GINZA_7B48: db $17 ; play note B3
#_0C8BB9: #_GINZA_7B49: db $17 ; play note B3
#_0C8BBA: #_GINZA_7B4A: db $F4, $08 ; set loop point B
#_0C8BBC: #_GINZA_7B4C: db $1C ; play note E4
#_0C8BBD: #_GINZA_7B4D: db $F5 ; run loop B
#_0C8BBE: #_GINZA_7B4E: db $F7 ; return from routine B

GINZA_SEGMENT_7B4F:
#_0C8BBF: #_GINZA_7B4F: db $F2, $44 ; set panning
#_0C8BC1: #_GINZA_7B51: db $9E ; dur 0x1E
#_0C8BC2: #_GINZA_7B52: db $30 ; rest
#_0C8BC3: #_GINZA_7B53: db $30 ; rest
#_0C8BC4: #_GINZA_7B54: db $30 ; rest
#_0C8BC5: #_GINZA_7B55: db $9C ; dur 0x1C
#_0C8BC6: #_GINZA_7B56: db $30 ; rest
#_0C8BC7: #_GINZA_7B57: db $70 ; vol 0x10
#_0C8BC8: #_GINZA_7B58: db $F0, $FF, $E0 ; set ADSR
#_0C8BCB: #_GINZA_7B5B: db $F1, $01 ; set SRCN
#_0C8BCD: #_GINZA_7B5D: db $F4, $04 ; set loop point B
#_0C8BCF: #_GINZA_7B5F: db $94 ; dur 0x14
#_0C8BD0: #_GINZA_7B60: db $18 ; play note C4
#_0C8BD1: #_GINZA_7B61: db $18 ; play note C4
#_0C8BD2: #_GINZA_7B62: db $98 ; dur 0x18
#_0C8BD3: #_GINZA_7B63: db $18 ; play note C4
#_0C8BD4: #_GINZA_7B64: db $F5 ; run loop B
#_0C8BD5: #_GINZA_7B65: db $96 ; dur 0x16
#_0C8BD6: #_GINZA_7B66: db $30 ; rest
#_0C8BD7: #_GINZA_7B67: db $F1, $00 ; set SRCN
#_0C8BD9: #_GINZA_7B69: db $94 ; dur 0x14
#_0C8BDA: #_GINZA_7B6A: db $18 ; play note C4
#_0C8BDB: #_GINZA_7B6B: db $18 ; play note C4
#_0C8BDC: #_GINZA_7B6C: db $F1, $01 ; set SRCN
#_0C8BDE: #_GINZA_7B6E: db $98 ; dur 0x18
#_0C8BDF: #_GINZA_7B6F: db $18 ; play note C4

GINZA_SEGMENT_7B70:
#_0C8BE0: #_GINZA_7B70: db $F4, $0F ; set loop point B
#_0C8BE2: #_GINZA_7B72: db $F1, $00 ; set SRCN
#_0C8BE4: #_GINZA_7B74: db $98 ; dur 0x18
#_0C8BE5: #_GINZA_7B75: db $18 ; play note C4
#_0C8BE6: #_GINZA_7B76: db $F1, $01 ; set SRCN
#_0C8BE8: #_GINZA_7B78: db $18 ; play note C4
#_0C8BE9: #_GINZA_7B79: db $F1, $00 ; set SRCN
#_0C8BEB: #_GINZA_7B7B: db $96 ; dur 0x16
#_0C8BEC: #_GINZA_7B7C: db $18 ; play note C4
#_0C8BED: #_GINZA_7B7D: db $18 ; play note C4
#_0C8BEE: #_GINZA_7B7E: db $F1, $01 ; set SRCN
#_0C8BF0: #_GINZA_7B80: db $98 ; dur 0x18
#_0C8BF1: #_GINZA_7B81: db $18 ; play note C4
#_0C8BF2: #_GINZA_7B82: db $F5 ; run loop B
#_0C8BF3: #_GINZA_7B83: db $96 ; dur 0x16
#_0C8BF4: #_GINZA_7B84: db $F4, $04 ; set loop point B
#_0C8BF6: #_GINZA_7B86: db $F1, $01 ; set SRCN
#_0C8BF8: #_GINZA_7B88: db $18 ; play note C4
#_0C8BF9: #_GINZA_7B89: db $F1, $00 ; set SRCN
#_0C8BFB: #_GINZA_7B8B: db $18 ; play note C4
#_0C8BFC: #_GINZA_7B8C: db $F5 ; run loop B
#_0C8BFD: #_GINZA_7B8D: db $F6 : dw GINZA_SEGMENT_7C30 ; subroutine B
#_0C8C00: #_GINZA_7B90: db $18 ; play note C4
#_0C8C01: #_GINZA_7B91: db $F1, $01 ; set SRCN
#_0C8C03: #_GINZA_7B93: db $98 ; dur 0x18
#_0C8C04: #_GINZA_7B94: db $18 ; play note C4
#_0C8C05: #_GINZA_7B95: db $18 ; play note C4
#_0C8C06: #_GINZA_7B96: db $18 ; play note C4
#_0C8C07: #_GINZA_7B97: db $96 ; dur 0x16
#_0C8C08: #_GINZA_7B98: db $18 ; play note C4
#_0C8C09: #_GINZA_7B99: db $F1, $00 ; set SRCN
#_0C8C0B: #_GINZA_7B9B: db $F6 : dw GINZA_SEGMENT_7C30 ; subroutine B
#_0C8C0E: #_GINZA_7B9E: db $F4, $02 ; set loop point B
#_0C8C10: #_GINZA_7BA0: db $F1, $01 ; set SRCN
#_0C8C12: #_GINZA_7BA2: db $18 ; play note C4
#_0C8C13: #_GINZA_7BA3: db $F1, $00 ; set SRCN
#_0C8C15: #_GINZA_7BA5: db $18 ; play note C4
#_0C8C16: #_GINZA_7BA6: db $18 ; play note C4
#_0C8C17: #_GINZA_7BA7: db $F5 ; run loop B
#_0C8C18: #_GINZA_7BA8: db $F1, $01 ; set SRCN
#_0C8C1A: #_GINZA_7BAA: db $18 ; play note C4
#_0C8C1B: #_GINZA_7BAB: db $F1, $00 ; set SRCN
#_0C8C1D: #_GINZA_7BAD: db $18 ; play note C4
#_0C8C1E: #_GINZA_7BAE: db $F6 : dw GINZA_SEGMENT_7C30 ; subroutine B
#_0C8C21: #_GINZA_7BB1: db $18 ; play note C4
#_0C8C22: #_GINZA_7BB2: db $F1, $01 ; set SRCN
#_0C8C24: #_GINZA_7BB4: db $98 ; dur 0x18
#_0C8C25: #_GINZA_7BB5: db $18 ; play note C4
#_0C8C26: #_GINZA_7BB6: db $18 ; play note C4
#_0C8C27: #_GINZA_7BB7: db $18 ; play note C4
#_0C8C28: #_GINZA_7BB8: db $96 ; dur 0x16
#_0C8C29: #_GINZA_7BB9: db $18 ; play note C4
#_0C8C2A: #_GINZA_7BBA: db $F1, $00 ; set SRCN
#_0C8C2C: #_GINZA_7BBC: db $F6 : dw GINZA_SEGMENT_7C30 ; subroutine B
#_0C8C2F: #_GINZA_7BBF: db $30 ; rest
#_0C8C30: #_GINZA_7BC0: db $F1, $01 ; set SRCN
#_0C8C32: #_GINZA_7BC2: db $18 ; play note C4
#_0C8C33: #_GINZA_7BC3: db $18 ; play note C4
#_0C8C34: #_GINZA_7BC4: db $F1, $00 ; set SRCN
#_0C8C36: #_GINZA_7BC6: db $18 ; play note C4
#_0C8C37: #_GINZA_7BC7: db $F1, $01 ; set SRCN
#_0C8C39: #_GINZA_7BC9: db $18 ; play note C4
#_0C8C3A: #_GINZA_7BCA: db $F1, $00 ; set SRCN
#_0C8C3C: #_GINZA_7BCC: db $18 ; play note C4
#_0C8C3D: #_GINZA_7BCD: db $F1, $01 ; set SRCN
#_0C8C3F: #_GINZA_7BCF: db $18 ; play note C4
#_0C8C40: #_GINZA_7BD0: db $F1, $00 ; set SRCN
#_0C8C42: #_GINZA_7BD2: db $18 ; play note C4
#_0C8C43: #_GINZA_7BD3: db $96 ; dur 0x16
#_0C8C44: #_GINZA_7BD4: db $F4, $03 ; set loop point B
#_0C8C46: #_GINZA_7BD6: db $F1, $00 ; set SRCN
#_0C8C48: #_GINZA_7BD8: db $98 ; dur 0x18
#_0C8C49: #_GINZA_7BD9: db $18 ; play note C4
#_0C8C4A: #_GINZA_7BDA: db $F1, $01 ; set SRCN
#_0C8C4C: #_GINZA_7BDC: db $18 ; play note C4
#_0C8C4D: #_GINZA_7BDD: db $F1, $00 ; set SRCN
#_0C8C4F: #_GINZA_7BDF: db $96 ; dur 0x16
#_0C8C50: #_GINZA_7BE0: db $18 ; play note C4
#_0C8C51: #_GINZA_7BE1: db $18 ; play note C4
#_0C8C52: #_GINZA_7BE2: db $F1, $01 ; set SRCN
#_0C8C54: #_GINZA_7BE4: db $18 ; play note C4
#_0C8C55: #_GINZA_7BE5: db $F1, $00 ; set SRCN
#_0C8C57: #_GINZA_7BE7: db $18 ; play note C4
#_0C8C58: #_GINZA_7BE8: db $18 ; play note C4
#_0C8C59: #_GINZA_7BE9: db $18 ; play note C4
#_0C8C5A: #_GINZA_7BEA: db $F1, $01 ; set SRCN
#_0C8C5C: #_GINZA_7BEC: db $18 ; play note C4
#_0C8C5D: #_GINZA_7BED: db $F1, $00 ; set SRCN
#_0C8C5F: #_GINZA_7BEF: db $18 ; play note C4
#_0C8C60: #_GINZA_7BF0: db $18 ; play note C4
#_0C8C61: #_GINZA_7BF1: db $F1, $01 ; set SRCN
#_0C8C63: #_GINZA_7BF3: db $18 ; play note C4
#_0C8C64: #_GINZA_7BF4: db $F1, $00 ; set SRCN
#_0C8C66: #_GINZA_7BF6: db $18 ; play note C4
#_0C8C67: #_GINZA_7BF7: db $F1, $01 ; set SRCN
#_0C8C69: #_GINZA_7BF9: db $18 ; play note C4
#_0C8C6A: #_GINZA_7BFA: db $F5 ; run loop B
#_0C8C6B: #_GINZA_7BFB: db $F1, $00 ; set SRCN
#_0C8C6D: #_GINZA_7BFD: db $18 ; play note C4
#_0C8C6E: #_GINZA_7BFE: db $18 ; play note C4
#_0C8C6F: #_GINZA_7BFF: db $F1, $01 ; set SRCN
#_0C8C71: #_GINZA_7C01: db $18 ; play note C4
#_0C8C72: #_GINZA_7C02: db $F1, $00 ; set SRCN
#_0C8C74: #_GINZA_7C04: db $18 ; play note C4
#_0C8C75: #_GINZA_7C05: db $18 ; play note C4
#_0C8C76: #_GINZA_7C06: db $F1, $01 ; set SRCN
#_0C8C78: #_GINZA_7C08: db $18 ; play note C4
#_0C8C79: #_GINZA_7C09: db $F1, $00 ; set SRCN
#_0C8C7B: #_GINZA_7C0B: db $18 ; play note C4
#_0C8C7C: #_GINZA_7C0C: db $F1, $01 ; set SRCN
#_0C8C7E: #_GINZA_7C0E: db $18 ; play note C4
#_0C8C7F: #_GINZA_7C0F: db $F4, $04 ; set loop point B
#_0C8C81: #_GINZA_7C11: db $F1, $01 ; set SRCN
#_0C8C83: #_GINZA_7C13: db $18 ; play note C4
#_0C8C84: #_GINZA_7C14: db $F1, $00 ; set SRCN
#_0C8C86: #_GINZA_7C16: db $18 ; play note C4
#_0C8C87: #_GINZA_7C17: db $F5 ; run loop B
#_0C8C88: #_GINZA_7C18: db $F1, $01 ; set SRCN
#_0C8C8A: #_GINZA_7C1A: db $94 ; dur 0x14
#_0C8C8B: #_GINZA_7C1B: db $18 ; play note C4
#_0C8C8C: #_GINZA_7C1C: db $18 ; play note C4
#_0C8C8D: #_GINZA_7C1D: db $98 ; dur 0x18
#_0C8C8E: #_GINZA_7C1E: db $18 ; play note C4
#_0C8C8F: #_GINZA_7C1F: db $94 ; dur 0x14
#_0C8C90: #_GINZA_7C20: db $18 ; play note C4
#_0C8C91: #_GINZA_7C21: db $18 ; play note C4
#_0C8C92: #_GINZA_7C22: db $96 ; dur 0x16
#_0C8C93: #_GINZA_7C23: db $18 ; play note C4
#_0C8C94: #_GINZA_7C24: db $F1, $00 ; set SRCN
#_0C8C96: #_GINZA_7C26: db $94 ; dur 0x14
#_0C8C97: #_GINZA_7C27: db $18 ; play note C4
#_0C8C98: #_GINZA_7C28: db $18 ; play note C4
#_0C8C99: #_GINZA_7C29: db $F1, $01 ; set SRCN
#_0C8C9B: #_GINZA_7C2B: db $98 ; dur 0x18
#_0C8C9C: #_GINZA_7C2C: db $18 ; play note C4
#_0C8C9D: #_GINZA_7C2D: db $F8 : dw GINZA_SEGMENT_7B70 ; goto location

GINZA_SEGMENT_7C30:
#_0C8CA0: #_GINZA_7C30: db $F4, $03 ; set loop point B
#_0C8CA2: #_GINZA_7C32: db $98 ; dur 0x18
#_0C8CA3: #_GINZA_7C33: db $18 ; play note C4
#_0C8CA4: #_GINZA_7C34: db $F1, $01 ; set SRCN
#_0C8CA6: #_GINZA_7C36: db $96 ; dur 0x16
#_0C8CA7: #_GINZA_7C37: db $18 ; play note C4
#_0C8CA8: #_GINZA_7C38: db $F1, $00 ; set SRCN
#_0C8CAA: #_GINZA_7C3A: db $98 ; dur 0x18
#_0C8CAB: #_GINZA_7C3B: db $18 ; play note C4
#_0C8CAC: #_GINZA_7C3C: db $96 ; dur 0x16
#_0C8CAD: #_GINZA_7C3D: db $18 ; play note C4
#_0C8CAE: #_GINZA_7C3E: db $F1, $01 ; set SRCN
#_0C8CB0: #_GINZA_7C40: db $18 ; play note C4
#_0C8CB1: #_GINZA_7C41: db $F1, $00 ; set SRCN
#_0C8CB3: #_GINZA_7C43: db $18 ; play note C4
#_0C8CB4: #_GINZA_7C44: db $F5 ; run loop B
#_0C8CB5: #_GINZA_7C45: db $F7 ; return from routine B

;===================================================================================================
; 
;===================================================================================================
Cathedral_SPC_Data:
#_0C8CB6: dw $0113, $0000

SONG_CATHEDRAL:
#_0C8CBA: #_CATHEDRAL_7800: db $F1, $00 ; Set control
#_0C8CBC: #_CATHEDRAL_7802: db $00 : dw CATHEDRAL_SEGMENT_781B ; Music channel 0
#_0C8CBF: #_CATHEDRAL_7805: db $01 : dw CATHEDRAL_SEGMENT_782C ; Music channel 1
#_0C8CC2: #_CATHEDRAL_7808: db $02 : dw CATHEDRAL_SEGMENT_784B ; Music channel 2
#_0C8CC5: #_CATHEDRAL_780B: db $03 : dw CATHEDRAL_SEGMENT_7872 ; Music channel 3
#_0C8CC8: #_CATHEDRAL_780E: db $04 : dw CATHEDRAL_SEGMENT_7883 ; Music channel 4
#_0C8CCB: #_CATHEDRAL_7811: db $05 : dw CATHEDRAL_SEGMENT_7898 ; Music channel 5
#_0C8CCE: #_CATHEDRAL_7814: db $06 : dw CATHEDRAL_SEGMENT_78A9 ; Music channel 6
#_0C8CD1: #_CATHEDRAL_7817: db $07 : dw CATHEDRAL_SEGMENT_78CD ; Music channel 7
#_0C8CD4: #_CATHEDRAL_781A: db $FF ; end of header

CATHEDRAL_SEGMENT_781B:
#_0C8CD5: #_CATHEDRAL_781B: db $73 ; vol 0x13
#_0C8CD6: #_CATHEDRAL_781C: db $F0, $F1, $E0 ; set ADSR
#_0C8CD9: #_CATHEDRAL_781F: db $F1, $08 ; set SRCN
#_0C8CDB: #_CATHEDRAL_7821: db $F2, $50 ; set panning
#_0C8CDD: #_CATHEDRAL_7823: db $8E ; dur 0x0E
#_0C8CDE: #_CATHEDRAL_7824: db $1B ; play note Ds4
#_0C8CDF: #_CATHEDRAL_7825: db $72 ; vol 0x12
#_0C8CE0: #_CATHEDRAL_7826: db $F9, $20 ; set fine tuning
#_0C8CE2: #_CATHEDRAL_7828: db $F8 : dw CATHEDRAL_SEGMENT_783B ; goto location
#_0C8CE5: #_CATHEDRAL_782B: db $FF ; end track

CATHEDRAL_SEGMENT_782C:
#_0C8CE6: #_CATHEDRAL_782C: db $63 ; vol 0x03
#_0C8CE7: #_CATHEDRAL_782D: db $F0, $F1, $E0 ; set ADSR
#_0C8CEA: #_CATHEDRAL_7830: db $F1, $08 ; set SRCN
#_0C8CEC: #_CATHEDRAL_7832: db $F2, $50 ; set panning
#_0C8CEE: #_CATHEDRAL_7834: db $F9, $20 ; set fine tuning
#_0C8CF0: #_CATHEDRAL_7836: db $8E ; dur 0x0E
#_0C8CF1: #_CATHEDRAL_7837: db $1B ; play note Ds4
#_0C8CF2: #_CATHEDRAL_7838: db $F9, $00 ; set fine tuning
#_0C8CF4: #_CATHEDRAL_783A: db $62 ; vol 0x02

CATHEDRAL_SEGMENT_783B:
#_0C8CF5: #_CATHEDRAL_783B: db $F0, $FF, $E4 ; set ADSR
#_0C8CF8: #_CATHEDRAL_783E: db $F1, $04 ; set SRCN
#_0C8CFA: #_CATHEDRAL_7840: db $F2, $60 ; set panning
#_0C8CFC: #_CATHEDRAL_7842: db $8E ; dur 0x0E

CATHEDRAL_SEGMENT_7843:
#_0C8CFD: #_CATHEDRAL_7843: db $1F ; play note G4
#_0C8CFE: #_CATHEDRAL_7844: db $31 ; tie
#_0C8CFF: #_CATHEDRAL_7845: db $1D ; play note F4
#_0C8D00: #_CATHEDRAL_7846: db $31 ; tie
#_0C8D01: #_CATHEDRAL_7847: db $F8 : dw CATHEDRAL_SEGMENT_7843 ; goto location
#_0C8D04: #_CATHEDRAL_784A: db $FF ; end track

CATHEDRAL_SEGMENT_784B:
#_0C8D05: #_CATHEDRAL_784B: db $72 ; vol 0x12
#_0C8D06: #_CATHEDRAL_784C: db $F0, $F1, $E0 ; set ADSR
#_0C8D09: #_CATHEDRAL_784F: db $F1, $08 ; set SRCN
#_0C8D0B: #_CATHEDRAL_7851: db $F2, $50 ; set panning
#_0C8D0D: #_CATHEDRAL_7853: db $8E ; dur 0x0E
#_0C8D0E: #_CATHEDRAL_7854: db $18 ; play note C4
#_0C8D0F: #_CATHEDRAL_7855: db $73 ; vol 0x13

CATHEDRAL_SEGMENT_7856:
#_0C8D10: #_CATHEDRAL_7856: db $F2, $60 ; set panning

CATHEDRAL_SEGMENT_7858:
#_0C8D12: #_CATHEDRAL_7858: db $F0, $FF, $F4 ; set ADSR
#_0C8D15: #_CATHEDRAL_785B: db $F1, $05 ; set SRCN
#_0C8D17: #_CATHEDRAL_785D: db $86 ; dur 0x06

CATHEDRAL_SEGMENT_785E:
#_0C8D18: #_CATHEDRAL_785E: db $18 ; play note C4
#_0C8D19: #_CATHEDRAL_785F: db $13 ; play note G3
#_0C8D1A: #_CATHEDRAL_7860: db $16 ; play note As3
#_0C8D1B: #_CATHEDRAL_7861: db $11 ; play note F3
#_0C8D1C: #_CATHEDRAL_7862: db $14 ; play note Gs3
#_0C8D1D: #_CATHEDRAL_7863: db $13 ; play note G3
#_0C8D1E: #_CATHEDRAL_7864: db $0F ; play note Ds3
#_0C8D1F: #_CATHEDRAL_7865: db $18 ; play note C4
#_0C8D20: #_CATHEDRAL_7866: db $13 ; play note G3
#_0C8D21: #_CATHEDRAL_7867: db $16 ; play note As3
#_0C8D22: #_CATHEDRAL_7868: db $14 ; play note Gs3
#_0C8D23: #_CATHEDRAL_7869: db $13 ; play note G3
#_0C8D24: #_CATHEDRAL_786A: db $18 ; play note C4
#_0C8D25: #_CATHEDRAL_786B: db $16 ; play note As3
#_0C8D26: #_CATHEDRAL_786C: db $14 ; play note Gs3
#_0C8D27: #_CATHEDRAL_786D: db $13 ; play note G3
#_0C8D28: #_CATHEDRAL_786E: db $F8 : dw CATHEDRAL_SEGMENT_785E ; goto location
#_0C8D2B: #_CATHEDRAL_7871: db $FF ; end track

CATHEDRAL_SEGMENT_7872:
#_0C8D2C: #_CATHEDRAL_7872: db $62 ; vol 0x02
#_0C8D2D: #_CATHEDRAL_7873: db $F0, $F1, $E0 ; set ADSR
#_0C8D30: #_CATHEDRAL_7876: db $F1, $08 ; set SRCN
#_0C8D32: #_CATHEDRAL_7878: db $F2, $50 ; set panning
#_0C8D34: #_CATHEDRAL_787A: db $8E ; dur 0x0E
#_0C8D35: #_CATHEDRAL_787B: db $16 ; play note As3
#_0C8D36: #_CATHEDRAL_787C: db $63 ; vol 0x03
#_0C8D37: #_CATHEDRAL_787D: db $F9, $20 ; set fine tuning
#_0C8D39: #_CATHEDRAL_787F: db $F8 : dw CATHEDRAL_SEGMENT_7856 ; goto location
#_0C8D3C: #_CATHEDRAL_7882: db $FF ; end track

CATHEDRAL_SEGMENT_7883:
#_0C8D3D: #_CATHEDRAL_7883: db $70 ; vol 0x10
#_0C8D3E: #_CATHEDRAL_7884: db $F0, $F1, $E0 ; set ADSR
#_0C8D41: #_CATHEDRAL_7887: db $F1, $08 ; set SRCN
#_0C8D43: #_CATHEDRAL_7889: db $F2, $50 ; set panning
#_0C8D45: #_CATHEDRAL_788B: db $8E ; dur 0x0E
#_0C8D46: #_CATHEDRAL_788C: db $0F ; play note Ds3
#_0C8D47: #_CATHEDRAL_788D: db $87 ; dur 0x07
#_0C8D48: #_CATHEDRAL_788E: db $30 ; rest
#_0C8D49: #_CATHEDRAL_788F: db $70 ; vol 0x10
#_0C8D4A: #_CATHEDRAL_7890: db $F2, $6C ; set panning
#_0C8D4C: #_CATHEDRAL_7892: db $F9, $10 ; set fine tuning
#_0C8D4E: #_CATHEDRAL_7894: db $F8 : dw CATHEDRAL_SEGMENT_7858 ; goto location
#_0C8D51: #_CATHEDRAL_7897: db $FF ; end track

CATHEDRAL_SEGMENT_7898:
#_0C8D52: #_CATHEDRAL_7898: db $70 ; vol 0x10
#_0C8D53: #_CATHEDRAL_7899: db $F0, $F1, $E0 ; set ADSR
#_0C8D56: #_CATHEDRAL_789C: db $F1, $08 ; set SRCN
#_0C8D58: #_CATHEDRAL_789E: db $F2, $50 ; set panning
#_0C8D5A: #_CATHEDRAL_78A0: db $8E ; dur 0x0E
#_0C8D5B: #_CATHEDRAL_78A1: db $0C ; play note C3
#_0C8D5C: #_CATHEDRAL_78A2: db $FF ; end track
#_0C8D5D: #_CATHEDRAL_78A3: db $F1, $08 ; set SRCN
#_0C8D5F: #_CATHEDRAL_78A5: db $F8 : dw CATHEDRAL_SEGMENT_78B5 ; goto location
#_0C8D62: #_CATHEDRAL_78A8: db $FF ; end track

CATHEDRAL_SEGMENT_78A9:
#_0C8D63: #_CATHEDRAL_78A9: db $76 ; vol 0x16
#_0C8D64: #_CATHEDRAL_78AA: db $F0, $F1, $E0 ; set ADSR
#_0C8D67: #_CATHEDRAL_78AD: db $F1, $08 ; set SRCN
#_0C8D69: #_CATHEDRAL_78AF: db $F2, $50 ; set panning
#_0C8D6B: #_CATHEDRAL_78B1: db $8E ; dur 0x0E
#_0C8D6C: #_CATHEDRAL_78B2: db $14 ; play note Gs3
#_0C8D6D: #_CATHEDRAL_78B3: db $F1, $02 ; set SRCN

CATHEDRAL_SEGMENT_78B5:
#_0C8D6F: #_CATHEDRAL_78B5: db $70 ; vol 0x10
#_0C8D70: #_CATHEDRAL_78B6: db $F0, $AF, $F2 ; set ADSR
#_0C8D73: #_CATHEDRAL_78B9: db $F2, $48 ; set panning

CATHEDRAL_SEGMENT_78BB:
#_0C8D75: #_CATHEDRAL_78BB: db $88 ; dur 0x08
#_0C8D76: #_CATHEDRAL_78BC: db $13 ; play note G3
#_0C8D77: #_CATHEDRAL_78BD: db $16 ; play note As3
#_0C8D78: #_CATHEDRAL_78BE: db $18 ; play note C4
#_0C8D79: #_CATHEDRAL_78BF: db $86 ; dur 0x06
#_0C8D7A: #_CATHEDRAL_78C0: db $13 ; play note G3
#_0C8D7B: #_CATHEDRAL_78C1: db $88 ; dur 0x08
#_0C8D7C: #_CATHEDRAL_78C2: db $16 ; play note As3
#_0C8D7D: #_CATHEDRAL_78C3: db $18 ; play note C4
#_0C8D7E: #_CATHEDRAL_78C4: db $86 ; dur 0x06
#_0C8D7F: #_CATHEDRAL_78C5: db $13 ; play note G3
#_0C8D80: #_CATHEDRAL_78C6: db $88 ; dur 0x08
#_0C8D81: #_CATHEDRAL_78C7: db $16 ; play note As3
#_0C8D82: #_CATHEDRAL_78C8: db $18 ; play note C4
#_0C8D83: #_CATHEDRAL_78C9: db $F8 : dw CATHEDRAL_SEGMENT_78BB ; goto location
#_0C8D86: #_CATHEDRAL_78CC: db $FF ; end track

CATHEDRAL_SEGMENT_78CD:
#_0C8D87: #_CATHEDRAL_78CD: db $66 ; vol 0x06
#_0C8D88: #_CATHEDRAL_78CE: db $F0, $F1, $E0 ; set ADSR
#_0C8D8B: #_CATHEDRAL_78D1: db $F1, $08 ; set SRCN
#_0C8D8D: #_CATHEDRAL_78D3: db $F2, $50 ; set panning
#_0C8D8F: #_CATHEDRAL_78D5: db $8E ; dur 0x0E
#_0C8D90: #_CATHEDRAL_78D6: db $11 ; play note F3
#_0C8D91: #_CATHEDRAL_78D7: db $70 ; vol 0x10
#_0C8D92: #_CATHEDRAL_78D8: db $F0, $FF, $E0 ; set ADSR
#_0C8D95: #_CATHEDRAL_78DB: db $F2, $44 ; set panning

CATHEDRAL_SEGMENT_78DD:
#_0C8D97: #_CATHEDRAL_78DD: db $F1, $00 ; set SRCN
#_0C8D99: #_CATHEDRAL_78DF: db $88 ; dur 0x08
#_0C8D9A: #_CATHEDRAL_78E0: db $18 ; play note C4
#_0C8D9B: #_CATHEDRAL_78E1: db $18 ; play note C4
#_0C8D9C: #_CATHEDRAL_78E2: db $F1, $01 ; set SRCN
#_0C8D9E: #_CATHEDRAL_78E4: db $18 ; play note C4
#_0C8D9F: #_CATHEDRAL_78E5: db $F1, $00 ; set SRCN
#_0C8DA1: #_CATHEDRAL_78E7: db $86 ; dur 0x06
#_0C8DA2: #_CATHEDRAL_78E8: db $18 ; play note C4
#_0C8DA3: #_CATHEDRAL_78E9: db $88 ; dur 0x08
#_0C8DA4: #_CATHEDRAL_78EA: db $18 ; play note C4
#_0C8DA5: #_CATHEDRAL_78EB: db $F1, $01 ; set SRCN
#_0C8DA7: #_CATHEDRAL_78ED: db $18 ; play note C4
#_0C8DA8: #_CATHEDRAL_78EE: db $F1, $00 ; set SRCN
#_0C8DAA: #_CATHEDRAL_78F0: db $86 ; dur 0x06
#_0C8DAB: #_CATHEDRAL_78F1: db $18 ; play note C4
#_0C8DAC: #_CATHEDRAL_78F2: db $88 ; dur 0x08
#_0C8DAD: #_CATHEDRAL_78F3: db $18 ; play note C4
#_0C8DAE: #_CATHEDRAL_78F4: db $F1, $01 ; set SRCN
#_0C8DB0: #_CATHEDRAL_78F6: db $18 ; play note C4
#_0C8DB1: #_CATHEDRAL_78F7: db $F1, $00 ; set SRCN
#_0C8DB3: #_CATHEDRAL_78F9: db $88 ; dur 0x08
#_0C8DB4: #_CATHEDRAL_78FA: db $18 ; play note C4
#_0C8DB5: #_CATHEDRAL_78FB: db $18 ; play note C4
#_0C8DB6: #_CATHEDRAL_78FC: db $F1, $01 ; set SRCN
#_0C8DB8: #_CATHEDRAL_78FE: db $18 ; play note C4
#_0C8DB9: #_CATHEDRAL_78FF: db $F1, $00 ; set SRCN
#_0C8DBB: #_CATHEDRAL_7901: db $86 ; dur 0x06
#_0C8DBC: #_CATHEDRAL_7902: db $18 ; play note C4
#_0C8DBD: #_CATHEDRAL_7903: db $88 ; dur 0x08
#_0C8DBE: #_CATHEDRAL_7904: db $18 ; play note C4
#_0C8DBF: #_CATHEDRAL_7905: db $18 ; play note C4
#_0C8DC0: #_CATHEDRAL_7906: db $86 ; dur 0x06
#_0C8DC1: #_CATHEDRAL_7907: db $18 ; play note C4
#_0C8DC2: #_CATHEDRAL_7908: db $F1, $01 ; set SRCN
#_0C8DC4: #_CATHEDRAL_790A: db $88 ; dur 0x08
#_0C8DC5: #_CATHEDRAL_790B: db $18 ; play note C4
#_0C8DC6: #_CATHEDRAL_790C: db $F1, $00 ; set SRCN
#_0C8DC8: #_CATHEDRAL_790E: db $18 ; play note C4
#_0C8DC9: #_CATHEDRAL_790F: db $F8 : dw CATHEDRAL_SEGMENT_78DD ; goto location
#_0C8DCC: #_CATHEDRAL_7912: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Shibuya_SPC_Data:
#_0C8DCD: dw $016A, $0000

SONG_SHIBUYA:
#_0C8DD1: #_SHIBUYA_7800: db $F1, $08 ; Set control
#_0C8DD3: #_SHIBUYA_7802: db $00 : dw SHIBUYA_SEGMENT_781B ; Music channel 0
#_0C8DD6: #_SHIBUYA_7805: db $01 : dw SHIBUYA_SEGMENT_7835 ; Music channel 1
#_0C8DD9: #_SHIBUYA_7808: db $02 : dw SHIBUYA_SEGMENT_7850 ; Music channel 2
#_0C8DDC: #_SHIBUYA_780B: db $03 : dw SHIBUYA_SEGMENT_786B ; Music channel 3
#_0C8DDF: #_SHIBUYA_780E: db $04 : dw SHIBUYA_SEGMENT_78B3 ; Music channel 4
#_0C8DE2: #_SHIBUYA_7811: db $05 : dw SHIBUYA_SEGMENT_78A7 ; Music channel 5
#_0C8DE5: #_SHIBUYA_7814: db $06 : dw SHIBUYA_SEGMENT_78BB ; Music channel 6
#_0C8DE8: #_SHIBUYA_7817: db $07 : dw SHIBUYA_SEGMENT_78EB ; Music channel 7
#_0C8DEB: #_SHIBUYA_781A: db $FF ; end of header

SHIBUYA_SEGMENT_781B:
#_0C8DEC: #_SHIBUYA_781B: db $8E ; dur 0x0E
#_0C8DED: #_SHIBUYA_781C: db $30 ; rest
#_0C8DEE: #_SHIBUYA_781D: db $30 ; rest
#_0C8DEF: #_SHIBUYA_781E: db $30 ; rest
#_0C8DF0: #_SHIBUYA_781F: db $30 ; rest
#_0C8DF1: #_SHIBUYA_7820: db $70 ; vol 0x10
#_0C8DF2: #_SHIBUYA_7821: db $F0, $FA, $E6 ; set ADSR
#_0C8DF5: #_SHIBUYA_7824: db $F1, $09 ; set SRCN
#_0C8DF7: #_SHIBUYA_7826: db $F2, $6C ; set panning
#_0C8DF9: #_SHIBUYA_7828: db $F3, $FA ; transpose -6

SHIBUYA_SEGMENT_782A:
#_0C8DFB: #_SHIBUYA_782A: db $24 ; play note C5
#_0C8DFC: #_SHIBUYA_782B: db $31 ; tie
#_0C8DFD: #_SHIBUYA_782C: db $23 ; play note B4
#_0C8DFE: #_SHIBUYA_782D: db $31 ; tie
#_0C8DFF: #_SHIBUYA_782E: db $22 ; play note As4
#_0C8E00: #_SHIBUYA_782F: db $31 ; tie
#_0C8E01: #_SHIBUYA_7830: db $21 ; play note A4
#_0C8E02: #_SHIBUYA_7831: db $31 ; tie
#_0C8E03: #_SHIBUYA_7832: db $F8 : dw SHIBUYA_SEGMENT_782A ; goto location

SHIBUYA_SEGMENT_7835:
#_0C8E06: #_SHIBUYA_7835: db $8E ; dur 0x0E
#_0C8E07: #_SHIBUYA_7836: db $30 ; rest
#_0C8E08: #_SHIBUYA_7837: db $30 ; rest
#_0C8E09: #_SHIBUYA_7838: db $30 ; rest
#_0C8E0A: #_SHIBUYA_7839: db $30 ; rest
#_0C8E0B: #_SHIBUYA_783A: db $62 ; vol 0x02
#_0C8E0C: #_SHIBUYA_783B: db $F0, $FA, $E6 ; set ADSR
#_0C8E0F: #_SHIBUYA_783E: db $F1, $09 ; set SRCN
#_0C8E11: #_SHIBUYA_7840: db $F2, $6C ; set panning
#_0C8E13: #_SHIBUYA_7842: db $F3, $FA ; transpose -6

SHIBUYA_SEGMENT_7844:
#_0C8E15: #_SHIBUYA_7844: db $21 ; play note A4
#_0C8E16: #_SHIBUYA_7845: db $31 ; tie
#_0C8E17: #_SHIBUYA_7846: db $20 ; play note Gs4
#_0C8E18: #_SHIBUYA_7847: db $31 ; tie
#_0C8E19: #_SHIBUYA_7848: db $1D ; play note F4
#_0C8E1A: #_SHIBUYA_7849: db $31 ; tie
#_0C8E1B: #_SHIBUYA_784A: db $1D ; play note F4
#_0C8E1C: #_SHIBUYA_784B: db $31 ; tie
#_0C8E1D: #_SHIBUYA_784C: db $F8 : dw SHIBUYA_SEGMENT_7844 ; goto location
#_0C8E20: #_SHIBUYA_784F: db $FF ; end track

SHIBUYA_SEGMENT_7850:
#_0C8E21: #_SHIBUYA_7850: db $8E ; dur 0x0E
#_0C8E22: #_SHIBUYA_7851: db $30 ; rest
#_0C8E23: #_SHIBUYA_7852: db $30 ; rest
#_0C8E24: #_SHIBUYA_7853: db $30 ; rest
#_0C8E25: #_SHIBUYA_7854: db $30 ; rest
#_0C8E26: #_SHIBUYA_7855: db $72 ; vol 0x12
#_0C8E27: #_SHIBUYA_7856: db $F0, $FA, $E6 ; set ADSR
#_0C8E2A: #_SHIBUYA_7859: db $F1, $09 ; set SRCN
#_0C8E2C: #_SHIBUYA_785B: db $F2, $6C ; set panning
#_0C8E2E: #_SHIBUYA_785D: db $F3, $FA ; transpose -6

SHIBUYA_SEGMENT_785F:
#_0C8E30: #_SHIBUYA_785F: db $1D ; play note F4
#_0C8E31: #_SHIBUYA_7860: db $31 ; tie
#_0C8E32: #_SHIBUYA_7861: db $1D ; play note F4
#_0C8E33: #_SHIBUYA_7862: db $31 ; tie
#_0C8E34: #_SHIBUYA_7863: db $1A ; play note D4
#_0C8E35: #_SHIBUYA_7864: db $31 ; tie
#_0C8E36: #_SHIBUYA_7865: db $1A ; play note D4
#_0C8E37: #_SHIBUYA_7866: db $31 ; tie
#_0C8E38: #_SHIBUYA_7867: db $F8 : dw SHIBUYA_SEGMENT_785F ; goto location
#_0C8E3B: #_SHIBUYA_786A: db $FF ; end track

SHIBUYA_SEGMENT_786B:
#_0C8E3C: #_SHIBUYA_786B: db $70 ; vol 0x10
#_0C8E3D: #_SHIBUYA_786C: db $F0, $FF, $FE ; set ADSR
#_0C8E40: #_SHIBUYA_786F: db $F1, $00 ; set SRCN
#_0C8E42: #_SHIBUYA_7871: db $86 ; dur 0x06

SHIBUYA_SEGMENT_7872:
#_0C8E43: #_SHIBUYA_7872: db $F4, $02 ; set loop point B
#_0C8E45: #_SHIBUYA_7874: db $F2, $7A ; set panning
#_0C8E47: #_SHIBUYA_7876: db $5E ; Noise 0x1E
#_0C8E48: #_SHIBUYA_7877: db $F2, $7D ; set panning
#_0C8E4A: #_SHIBUYA_7879: db $5E ; Noise 0x1E
#_0C8E4B: #_SHIBUYA_787A: db $F2, $7B ; set panning
#_0C8E4D: #_SHIBUYA_787C: db $5E ; Noise 0x1E
#_0C8E4E: #_SHIBUYA_787D: db $F2, $7D ; set panning
#_0C8E50: #_SHIBUYA_787F: db $5E ; Noise 0x1E
#_0C8E51: #_SHIBUYA_7880: db $F5 ; run loop B
#_0C8E52: #_SHIBUYA_7881: db $F2, $7B ; set panning
#_0C8E54: #_SHIBUYA_7883: db $85 ; dur 0x05
#_0C8E55: #_SHIBUYA_7884: db $5E ; Noise 0x1E
#_0C8E56: #_SHIBUYA_7885: db $F2, $7D ; set panning
#_0C8E58: #_SHIBUYA_7887: db $94 ; dur 0x14
#_0C8E59: #_SHIBUYA_7888: db $5E ; Noise 0x1E
#_0C8E5A: #_SHIBUYA_7889: db $5E ; Noise 0x1E
#_0C8E5B: #_SHIBUYA_788A: db $F2, $7B ; set panning
#_0C8E5D: #_SHIBUYA_788C: db $85 ; dur 0x05
#_0C8E5E: #_SHIBUYA_788D: db $5E ; Noise 0x1E
#_0C8E5F: #_SHIBUYA_788E: db $F2, $7D ; set panning
#_0C8E61: #_SHIBUYA_7890: db $94 ; dur 0x14
#_0C8E62: #_SHIBUYA_7891: db $5E ; Noise 0x1E
#_0C8E63: #_SHIBUYA_7892: db $5E ; Noise 0x1E
#_0C8E64: #_SHIBUYA_7893: db $86 ; dur 0x06
#_0C8E65: #_SHIBUYA_7894: db $F4, $05 ; set loop point B
#_0C8E67: #_SHIBUYA_7896: db $F2, $7A ; set panning
#_0C8E69: #_SHIBUYA_7898: db $5E ; Noise 0x1E
#_0C8E6A: #_SHIBUYA_7899: db $F2, $7D ; set panning
#_0C8E6C: #_SHIBUYA_789B: db $5E ; Noise 0x1E
#_0C8E6D: #_SHIBUYA_789C: db $F2, $7B ; set panning
#_0C8E6F: #_SHIBUYA_789E: db $5E ; Noise 0x1E
#_0C8E70: #_SHIBUYA_789F: db $F2, $7D ; set panning
#_0C8E72: #_SHIBUYA_78A1: db $5E ; Noise 0x1E
#_0C8E73: #_SHIBUYA_78A2: db $F5 ; run loop B
#_0C8E74: #_SHIBUYA_78A3: db $F8 : dw SHIBUYA_SEGMENT_7872 ; goto location
#_0C8E77: #_SHIBUYA_78A6: db $FF ; end track

SHIBUYA_SEGMENT_78A7:
#_0C8E78: #_SHIBUYA_78A7: db $85 ; dur 0x05
#_0C8E79: #_SHIBUYA_78A8: db $30 ; rest
#_0C8E7A: #_SHIBUYA_78A9: db $F1, $08 ; set SRCN
#_0C8E7C: #_SHIBUYA_78AB: db $F2, $68 ; set panning
#_0C8E7E: #_SHIBUYA_78AD: db $F9, $10 ; set fine tuning
#_0C8E80: #_SHIBUYA_78AF: db $F8 : dw SHIBUYA_SEGMENT_78BF ; goto location
#_0C8E83: #_SHIBUYA_78B2: db $FF ; end track

SHIBUYA_SEGMENT_78B3:
#_0C8E84: #_SHIBUYA_78B3: db $F1, $02 ; set SRCN
#_0C8E86: #_SHIBUYA_78B5: db $F2, $50 ; set panning
#_0C8E88: #_SHIBUYA_78B7: db $F8 : dw SHIBUYA_SEGMENT_78BF ; goto location
#_0C8E8B: #_SHIBUYA_78BA: db $FF ; end track

SHIBUYA_SEGMENT_78BB:
#_0C8E8C: #_SHIBUYA_78BB: db $F1, $08 ; set SRCN
#_0C8E8E: #_SHIBUYA_78BD: db $F2, $40 ; set panning

SHIBUYA_SEGMENT_78BF:
#_0C8E90: #_SHIBUYA_78BF: db $70 ; vol 0x10
#_0C8E91: #_SHIBUYA_78C0: db $F0, $FF, $EC ; set ADSR
#_0C8E94: #_SHIBUYA_78C3: db $F3, $06 ; transpose +6

SHIBUYA_SEGMENT_78C5:
#_0C8E96: #_SHIBUYA_78C5: db $86 ; dur 0x06
#_0C8E97: #_SHIBUYA_78C6: db $0E ; play note D3
#_0C8E98: #_SHIBUYA_78C7: db $30 ; rest
#_0C8E99: #_SHIBUYA_78C8: db $30 ; rest
#_0C8E9A: #_SHIBUYA_78C9: db $0E ; play note D3
#_0C8E9B: #_SHIBUYA_78CA: db $8A ; dur 0x0A
#_0C8E9C: #_SHIBUYA_78CB: db $30 ; rest
#_0C8E9D: #_SHIBUYA_78CC: db $30 ; rest
#_0C8E9E: #_SHIBUYA_78CD: db $30 ; rest
#_0C8E9F: #_SHIBUYA_78CE: db $30 ; rest
#_0C8EA0: #_SHIBUYA_78CF: db $30 ; rest
#_0C8EA1: #_SHIBUYA_78D0: db $30 ; rest
#_0C8EA2: #_SHIBUYA_78D1: db $30 ; rest
#_0C8EA3: #_SHIBUYA_78D2: db $88 ; dur 0x08
#_0C8EA4: #_SHIBUYA_78D3: db $30 ; rest
#_0C8EA5: #_SHIBUYA_78D4: db $86 ; dur 0x06
#_0C8EA6: #_SHIBUYA_78D5: db $0E ; play note D3
#_0C8EA7: #_SHIBUYA_78D6: db $30 ; rest
#_0C8EA8: #_SHIBUYA_78D7: db $88 ; dur 0x08
#_0C8EA9: #_SHIBUYA_78D8: db $30 ; rest
#_0C8EAA: #_SHIBUYA_78D9: db $86 ; dur 0x06
#_0C8EAB: #_SHIBUYA_78DA: db $0C ; play note C3
#_0C8EAC: #_SHIBUYA_78DB: db $30 ; rest
#_0C8EAD: #_SHIBUYA_78DC: db $86 ; dur 0x06
#_0C8EAE: #_SHIBUYA_78DD: db $0E ; play note D3
#_0C8EAF: #_SHIBUYA_78DE: db $30 ; rest
#_0C8EB0: #_SHIBUYA_78DF: db $88 ; dur 0x08
#_0C8EB1: #_SHIBUYA_78E0: db $30 ; rest
#_0C8EB2: #_SHIBUYA_78E1: db $8A ; dur 0x0A
#_0C8EB3: #_SHIBUYA_78E2: db $30 ; rest
#_0C8EB4: #_SHIBUYA_78E3: db $30 ; rest
#_0C8EB5: #_SHIBUYA_78E4: db $30 ; rest
#_0C8EB6: #_SHIBUYA_78E5: db $30 ; rest
#_0C8EB7: #_SHIBUYA_78E6: db $30 ; rest
#_0C8EB8: #_SHIBUYA_78E7: db $F8 : dw SHIBUYA_SEGMENT_78C5 ; goto location
#_0C8EBB: #_SHIBUYA_78EA: db $FF ; end track

SHIBUYA_SEGMENT_78EB:
#_0C8EBC: #_SHIBUYA_78EB: db $70 ; vol 0x10
#_0C8EBD: #_SHIBUYA_78EC: db $F2, $44 ; set panning
#_0C8EBF: #_SHIBUYA_78EE: db $F1, $00 ; set SRCN
#_0C8EC1: #_SHIBUYA_78F0: db $F0, $FF, $E0 ; set ADSR
#_0C8EC4: #_SHIBUYA_78F3: db $89 ; dur 0x09
#_0C8EC5: #_SHIBUYA_78F4: db $18 ; play note C4
#_0C8EC6: #_SHIBUYA_78F5: db $86 ; dur 0x06
#_0C8EC7: #_SHIBUYA_78F6: db $18 ; play note C4
#_0C8EC8: #_SHIBUYA_78F7: db $8D ; dur 0x0D
#_0C8EC9: #_SHIBUYA_78F8: db $30 ; rest
#_0C8ECA: #_SHIBUYA_78F9: db $8E ; dur 0x0E
#_0C8ECB: #_SHIBUYA_78FA: db $30 ; rest
#_0C8ECC: #_SHIBUYA_78FB: db $88 ; dur 0x08
#_0C8ECD: #_SHIBUYA_78FC: db $30 ; rest
#_0C8ECE: #_SHIBUYA_78FD: db $86 ; dur 0x06
#_0C8ECF: #_SHIBUYA_78FE: db $18 ; play note C4
#_0C8ED0: #_SHIBUYA_78FF: db $30 ; rest
#_0C8ED1: #_SHIBUYA_7900: db $88 ; dur 0x08
#_0C8ED2: #_SHIBUYA_7901: db $30 ; rest
#_0C8ED3: #_SHIBUYA_7902: db $86 ; dur 0x06
#_0C8ED4: #_SHIBUYA_7903: db $18 ; play note C4
#_0C8ED5: #_SHIBUYA_7904: db $30 ; rest
#_0C8ED6: #_SHIBUYA_7905: db $86 ; dur 0x06
#_0C8ED7: #_SHIBUYA_7906: db $18 ; play note C4
#_0C8ED8: #_SHIBUYA_7907: db $30 ; rest
#_0C8ED9: #_SHIBUYA_7908: db $88 ; dur 0x08
#_0C8EDA: #_SHIBUYA_7909: db $30 ; rest
#_0C8EDB: #_SHIBUYA_790A: db $8A ; dur 0x0A
#_0C8EDC: #_SHIBUYA_790B: db $30 ; rest
#_0C8EDD: #_SHIBUYA_790C: db $8D ; dur 0x0D
#_0C8EDE: #_SHIBUYA_790D: db $30 ; rest
#_0C8EDF: #_SHIBUYA_790E: db $F1, $0A ; set SRCN
#_0C8EE1: #_SHIBUYA_7910: db $F0, $FF, $F4 ; set ADSR
#_0C8EE4: #_SHIBUYA_7913: db $86 ; dur 0x06
#_0C8EE5: #_SHIBUYA_7914: db $1C ; play note E4
#_0C8EE6: #_SHIBUYA_7915: db $1C ; play note E4
#_0C8EE7: #_SHIBUYA_7916: db $88 ; dur 0x08
#_0C8EE8: #_SHIBUYA_7917: db $18 ; play note C4

SHIBUYA_SEGMENT_7918:
#_0C8EE9: #_SHIBUYA_7918: db $F1, $00 ; set SRCN
#_0C8EEB: #_SHIBUYA_791A: db $F0, $FF, $E0 ; set ADSR
#_0C8EEE: #_SHIBUYA_791D: db $89 ; dur 0x09
#_0C8EEF: #_SHIBUYA_791E: db $18 ; play note C4
#_0C8EF0: #_SHIBUYA_791F: db $86 ; dur 0x06
#_0C8EF1: #_SHIBUYA_7920: db $18 ; play note C4
#_0C8EF2: #_SHIBUYA_7921: db $8C ; dur 0x0C
#_0C8EF3: #_SHIBUYA_7922: db $30 ; rest
#_0C8EF4: #_SHIBUYA_7923: db $F1, $01 ; set SRCN
#_0C8EF6: #_SHIBUYA_7925: db $8A ; dur 0x0A
#_0C8EF7: #_SHIBUYA_7926: db $18 ; play note C4
#_0C8EF8: #_SHIBUYA_7927: db $F1, $00 ; set SRCN
#_0C8EFA: #_SHIBUYA_7929: db $F0, $FF, $E0 ; set ADSR
#_0C8EFD: #_SHIBUYA_792C: db $89 ; dur 0x09
#_0C8EFE: #_SHIBUYA_792D: db $18 ; play note C4
#_0C8EFF: #_SHIBUYA_792E: db $86 ; dur 0x06
#_0C8F00: #_SHIBUYA_792F: db $18 ; play note C4
#_0C8F01: #_SHIBUYA_7930: db $8C ; dur 0x0C
#_0C8F02: #_SHIBUYA_7931: db $30 ; rest
#_0C8F03: #_SHIBUYA_7932: db $F1, $0A ; set SRCN
#_0C8F05: #_SHIBUYA_7934: db $F0, $FF, $F4 ; set ADSR
#_0C8F08: #_SHIBUYA_7937: db $8A ; dur 0x0A
#_0C8F09: #_SHIBUYA_7938: db $18 ; play note C4
#_0C8F0A: #_SHIBUYA_7939: db $F1, $00 ; set SRCN
#_0C8F0C: #_SHIBUYA_793B: db $F0, $FF, $E0 ; set ADSR
#_0C8F0F: #_SHIBUYA_793E: db $88 ; dur 0x08
#_0C8F10: #_SHIBUYA_793F: db $30 ; rest
#_0C8F11: #_SHIBUYA_7940: db $86 ; dur 0x06
#_0C8F12: #_SHIBUYA_7941: db $18 ; play note C4
#_0C8F13: #_SHIBUYA_7942: db $30 ; rest
#_0C8F14: #_SHIBUYA_7943: db $88 ; dur 0x08
#_0C8F15: #_SHIBUYA_7944: db $30 ; rest
#_0C8F16: #_SHIBUYA_7945: db $86 ; dur 0x06
#_0C8F17: #_SHIBUYA_7946: db $18 ; play note C4
#_0C8F18: #_SHIBUYA_7947: db $30 ; rest
#_0C8F19: #_SHIBUYA_7948: db $86 ; dur 0x06
#_0C8F1A: #_SHIBUYA_7949: db $18 ; play note C4
#_0C8F1B: #_SHIBUYA_794A: db $30 ; rest
#_0C8F1C: #_SHIBUYA_794B: db $88 ; dur 0x08
#_0C8F1D: #_SHIBUYA_794C: db $30 ; rest
#_0C8F1E: #_SHIBUYA_794D: db $F1, $01 ; set SRCN
#_0C8F20: #_SHIBUYA_794F: db $8A ; dur 0x0A
#_0C8F21: #_SHIBUYA_7950: db $18 ; play note C4
#_0C8F22: #_SHIBUYA_7951: db $F1, $00 ; set SRCN
#_0C8F24: #_SHIBUYA_7953: db $F0, $FF, $E0 ; set ADSR
#_0C8F27: #_SHIBUYA_7956: db $89 ; dur 0x09
#_0C8F28: #_SHIBUYA_7957: db $18 ; play note C4
#_0C8F29: #_SHIBUYA_7958: db $86 ; dur 0x06
#_0C8F2A: #_SHIBUYA_7959: db $18 ; play note C4
#_0C8F2B: #_SHIBUYA_795A: db $8C ; dur 0x0C
#_0C8F2C: #_SHIBUYA_795B: db $30 ; rest
#_0C8F2D: #_SHIBUYA_795C: db $F1, $0A ; set SRCN
#_0C8F2F: #_SHIBUYA_795E: db $F0, $FF, $F4 ; set ADSR
#_0C8F32: #_SHIBUYA_7961: db $86 ; dur 0x06
#_0C8F33: #_SHIBUYA_7962: db $1C ; play note E4
#_0C8F34: #_SHIBUYA_7963: db $1C ; play note E4
#_0C8F35: #_SHIBUYA_7964: db $88 ; dur 0x08
#_0C8F36: #_SHIBUYA_7965: db $18 ; play note C4
#_0C8F37: #_SHIBUYA_7966: db $F8 : dw SHIBUYA_SEGMENT_7918 ; goto location
#_0C8F3A: #_SHIBUYA_7969: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Shitenou_SPC_Data:
#_0C8F3B: dw $0128, $0000

SONG_SHITENOU:
#_0C8F3F: #_SHITENOU_7800: db $F1, $00 ; Set control
#_0C8F41: #_SHITENOU_7802: db $00 : dw SHITENOU_SEGMENT_781B ; Music channel 0
#_0C8F44: #_SHITENOU_7805: db $01 : dw SHITENOU_SEGMENT_788B ; Music channel 1
#_0C8F47: #_SHITENOU_7808: db $02 : dw SHITENOU_SEGMENT_7895 ; Music channel 2
#_0C8F4A: #_SHITENOU_780B: db $03 : dw SHITENOU_SEGMENT_789C ; Music channel 3
#_0C8F4D: #_SHITENOU_780E: db $04 : dw SHITENOU_SEGMENT_78C6 ; Music channel 4
#_0C8F50: #_SHITENOU_7811: db $05 : dw SHITENOU_SEGMENT_78F0 ; Music channel 5
#_0C8F53: #_SHITENOU_7814: db $06 : dw SHITENOU_SEGMENT_78FD ; Music channel 6
#_0C8F56: #_SHITENOU_7817: db $07 : dw SHITENOU_SEGMENT_791A ; Music channel 7
#_0C8F59: #_SHITENOU_781A: db $FF ; end of header

SHITENOU_SEGMENT_781B:
#_0C8F5A: #_SHITENOU_781B: db $F2, $60 ; set panning

SHITENOU_SEGMENT_781D:
#_0C8F5C: #_SHITENOU_781D: db $70 ; vol 0x10
#_0C8F5D: #_SHITENOU_781E: db $F0, $FA, $E8 ; set ADSR
#_0C8F60: #_SHITENOU_7821: db $F1, $08 ; set SRCN

SHITENOU_SEGMENT_7823:
#_0C8F62: #_SHITENOU_7823: db $8E ; dur 0x0E
#_0C8F63: #_SHITENOU_7824: db $30 ; rest
#_0C8F64: #_SHITENOU_7825: db $30 ; rest
#_0C8F65: #_SHITENOU_7826: db $30 ; rest
#_0C8F66: #_SHITENOU_7827: db $30 ; rest
#_0C8F67: #_SHITENOU_7828: db $8C ; dur 0x0C
#_0C8F68: #_SHITENOU_7829: db $30 ; rest
#_0C8F69: #_SHITENOU_782A: db $29 ; play note F5
#_0C8F6A: #_SHITENOU_782B: db $31 ; tie
#_0C8F6B: #_SHITENOU_782C: db $E3, $E0 ; pitch bend on
#_0C8F6D: #_SHITENOU_782E: db $31 ; tie
#_0C8F6E: #_SHITENOU_782F: db $E2 ; pitch bend off
#_0C8F6F: #_SHITENOU_7830: db $86 ; dur 0x06
#_0C8F70: #_SHITENOU_7831: db $1B ; play note Ds4
#_0C8F71: #_SHITENOU_7832: db $1D ; play note F4
#_0C8F72: #_SHITENOU_7833: db $8D ; dur 0x0D
#_0C8F73: #_SHITENOU_7834: db $1B ; play note Ds4
#_0C8F74: #_SHITENOU_7835: db $31 ; tie
#_0C8F75: #_SHITENOU_7836: db $E3, $F0 ; pitch bend on
#_0C8F77: #_SHITENOU_7838: db $8B ; dur 0x0B
#_0C8F78: #_SHITENOU_7839: db $31 ; tie
#_0C8F79: #_SHITENOU_783A: db $E2 ; pitch bend off
#_0C8F7A: #_SHITENOU_783B: db $8B ; dur 0x0B
#_0C8F7B: #_SHITENOU_783C: db $1A ; play note D4
#_0C8F7C: #_SHITENOU_783D: db $1B ; play note Ds4
#_0C8F7D: #_SHITENOU_783E: db $8A ; dur 0x0A
#_0C8F7E: #_SHITENOU_783F: db $31 ; tie
#_0C8F7F: #_SHITENOU_7840: db $8B ; dur 0x0B
#_0C8F80: #_SHITENOU_7841: db $1D ; play note F4
#_0C8F81: #_SHITENOU_7842: db $1B ; play note Ds4
#_0C8F82: #_SHITENOU_7843: db $8A ; dur 0x0A
#_0C8F83: #_SHITENOU_7844: db $31 ; tie
#_0C8F84: #_SHITENOU_7845: db $8B ; dur 0x0B
#_0C8F85: #_SHITENOU_7846: db $1A ; play note D4
#_0C8F86: #_SHITENOU_7847: db $8E ; dur 0x0E
#_0C8F87: #_SHITENOU_7848: db $1B ; play note Ds4
#_0C8F88: #_SHITENOU_7849: db $88 ; dur 0x08
#_0C8F89: #_SHITENOU_784A: db $22 ; play note As4
#_0C8F8A: #_SHITENOU_784B: db $8B ; dur 0x0B
#_0C8F8B: #_SHITENOU_784C: db $29 ; play note F5
#_0C8F8C: #_SHITENOU_784D: db $86 ; dur 0x06
#_0C8F8D: #_SHITENOU_784E: db $27 ; play note Ds5
#_0C8F8E: #_SHITENOU_784F: db $26 ; play note D5
#_0C8F8F: #_SHITENOU_7850: db $8E ; dur 0x0E
#_0C8F90: #_SHITENOU_7851: db $27 ; play note Ds5
#_0C8F91: #_SHITENOU_7852: db $8B ; dur 0x0B
#_0C8F92: #_SHITENOU_7853: db $31 ; tie
#_0C8F93: #_SHITENOU_7854: db $88 ; dur 0x08
#_0C8F94: #_SHITENOU_7855: db $22 ; play note As4
#_0C8F95: #_SHITENOU_7856: db $8B ; dur 0x0B
#_0C8F96: #_SHITENOU_7857: db $29 ; play note F5
#_0C8F97: #_SHITENOU_7858: db $86 ; dur 0x06
#_0C8F98: #_SHITENOU_7859: db $27 ; play note Ds5
#_0C8F99: #_SHITENOU_785A: db $26 ; play note D5
#_0C8F9A: #_SHITENOU_785B: db $86 ; dur 0x06
#_0C8F9B: #_SHITENOU_785C: db $27 ; play note Ds5
#_0C8F9C: #_SHITENOU_785D: db $26 ; play note D5
#_0C8F9D: #_SHITENOU_785E: db $8A ; dur 0x0A
#_0C8F9E: #_SHITENOU_785F: db $24 ; play note C5
#_0C8F9F: #_SHITENOU_7860: db $8E ; dur 0x0E
#_0C8FA0: #_SHITENOU_7861: db $31 ; tie
#_0C8FA1: #_SHITENOU_7862: db $88 ; dur 0x08
#_0C8FA2: #_SHITENOU_7863: db $22 ; play note As4
#_0C8FA3: #_SHITENOU_7864: db $8B ; dur 0x0B
#_0C8FA4: #_SHITENOU_7865: db $29 ; play note F5
#_0C8FA5: #_SHITENOU_7866: db $86 ; dur 0x06
#_0C8FA6: #_SHITENOU_7867: db $27 ; play note Ds5
#_0C8FA7: #_SHITENOU_7868: db $26 ; play note D5
#_0C8FA8: #_SHITENOU_7869: db $8B ; dur 0x0B
#_0C8FA9: #_SHITENOU_786A: db $27 ; play note Ds5
#_0C8FAA: #_SHITENOU_786B: db $88 ; dur 0x08
#_0C8FAB: #_SHITENOU_786C: db $24 ; play note C5
#_0C8FAC: #_SHITENOU_786D: db $8C ; dur 0x0C
#_0C8FAD: #_SHITENOU_786E: db $31 ; tie
#_0C8FAE: #_SHITENOU_786F: db $8E ; dur 0x0E
#_0C8FAF: #_SHITENOU_7870: db $31 ; tie
#_0C8FB0: #_SHITENOU_7871: db $8B ; dur 0x0B
#_0C8FB1: #_SHITENOU_7872: db $22 ; play note As4
#_0C8FB2: #_SHITENOU_7873: db $88 ; dur 0x08
#_0C8FB3: #_SHITENOU_7874: db $24 ; play note C5
#_0C8FB4: #_SHITENOU_7875: db $8C ; dur 0x0C
#_0C8FB5: #_SHITENOU_7876: db $31 ; tie
#_0C8FB6: #_SHITENOU_7877: db $29 ; play note F5
#_0C8FB7: #_SHITENOU_7878: db $8B ; dur 0x0B
#_0C8FB8: #_SHITENOU_7879: db $31 ; tie
#_0C8FB9: #_SHITENOU_787A: db $86 ; dur 0x06
#_0C8FBA: #_SHITENOU_787B: db $27 ; play note Ds5
#_0C8FBB: #_SHITENOU_787C: db $26 ; play note D5
#_0C8FBC: #_SHITENOU_787D: db $8E ; dur 0x0E
#_0C8FBD: #_SHITENOU_787E: db $24 ; play note C5
#_0C8FBE: #_SHITENOU_787F: db $31 ; tie
#_0C8FBF: #_SHITENOU_7880: db $31 ; tie
#_0C8FC0: #_SHITENOU_7881: db $31 ; tie
#_0C8FC1: #_SHITENOU_7882: db $8E ; dur 0x0E
#_0C8FC2: #_SHITENOU_7883: db $F4, $10 ; set loop point B
#_0C8FC4: #_SHITENOU_7885: db $30 ; rest
#_0C8FC5: #_SHITENOU_7886: db $F5 ; run loop B
#_0C8FC6: #_SHITENOU_7887: db $F8 : dw SHITENOU_SEGMENT_7823 ; goto location
#_0C8FC9: #_SHITENOU_788A: db $FF ; end track

SHITENOU_SEGMENT_788B:
#_0C8FCA: #_SHITENOU_788B: db $87 ; dur 0x07
#_0C8FCB: #_SHITENOU_788C: db $30 ; rest
#_0C8FCC: #_SHITENOU_788D: db $F2, $68 ; set panning
#_0C8FCE: #_SHITENOU_788F: db $F9, $20 ; set fine tuning
#_0C8FD0: #_SHITENOU_7891: db $F8 : dw SHITENOU_SEGMENT_781D ; goto location
#_0C8FD3: #_SHITENOU_7894: db $FF ; end track

SHITENOU_SEGMENT_7895:
#_0C8FD4: #_SHITENOU_7895: db $72 ; vol 0x12
#_0C8FD5: #_SHITENOU_7896: db $F9, $20 ; set fine tuning
#_0C8FD7: #_SHITENOU_7898: db $F8 : dw SHITENOU_SEGMENT_789D ; goto location
#_0C8FDA: #_SHITENOU_789B: db $FF ; end track

SHITENOU_SEGMENT_789C:
#_0C8FDB: #_SHITENOU_789C: db $62 ; vol 0x02

SHITENOU_SEGMENT_789D:
#_0C8FDC: #_SHITENOU_789D: db $8E ; dur 0x0E
#_0C8FDD: #_SHITENOU_789E: db $30 ; rest
#_0C8FDE: #_SHITENOU_789F: db $30 ; rest
#_0C8FDF: #_SHITENOU_78A0: db $30 ; rest
#_0C8FE0: #_SHITENOU_78A1: db $30 ; rest
#_0C8FE1: #_SHITENOU_78A2: db $F1, $09 ; set SRCN
#_0C8FE3: #_SHITENOU_78A4: db $F2, $6C ; set panning

SHITENOU_SEGMENT_78A6:
#_0C8FE5: #_SHITENOU_78A6: db $F0, $FA, $E2 ; set ADSR
#_0C8FE8: #_SHITENOU_78A9: db $8E ; dur 0x0E
#_0C8FE9: #_SHITENOU_78AA: db $1F ; play note G4
#_0C8FEA: #_SHITENOU_78AB: db $31 ; tie
#_0C8FEB: #_SHITENOU_78AC: db $20 ; play note Gs4
#_0C8FEC: #_SHITENOU_78AD: db $31 ; tie
#_0C8FED: #_SHITENOU_78AE: db $21 ; play note A4
#_0C8FEE: #_SHITENOU_78AF: db $31 ; tie
#_0C8FEF: #_SHITENOU_78B0: db $20 ; play note Gs4
#_0C8FF0: #_SHITENOU_78B1: db $31 ; tie
#_0C8FF1: #_SHITENOU_78B2: db $1F ; play note G4
#_0C8FF2: #_SHITENOU_78B3: db $31 ; tie
#_0C8FF3: #_SHITENOU_78B4: db $20 ; play note Gs4
#_0C8FF4: #_SHITENOU_78B5: db $31 ; tie
#_0C8FF5: #_SHITENOU_78B6: db $21 ; play note A4
#_0C8FF6: #_SHITENOU_78B7: db $31 ; tie
#_0C8FF7: #_SHITENOU_78B8: db $20 ; play note Gs4
#_0C8FF8: #_SHITENOU_78B9: db $31 ; tie
#_0C8FF9: #_SHITENOU_78BA: db $F0, $FA, $F0 ; set ADSR
#_0C8FFC: #_SHITENOU_78BD: db $8E ; dur 0x0E
#_0C8FFD: #_SHITENOU_78BE: db $24 ; play note C5
#_0C8FFE: #_SHITENOU_78BF: db $31 ; tie
#_0C8FFF: #_SHITENOU_78C0: db $31 ; tie
#_0C9000: #_SHITENOU_78C1: db $31 ; tie
#_0C9001: #_SHITENOU_78C2: db $F8 : dw SHITENOU_SEGMENT_78A6 ; goto location
#_0C9004: #_SHITENOU_78C5: db $FF ; end track

SHITENOU_SEGMENT_78C6:
#_0C9005: #_SHITENOU_78C6: db $70 ; vol 0x10
#_0C9006: #_SHITENOU_78C7: db $8E ; dur 0x0E
#_0C9007: #_SHITENOU_78C8: db $30 ; rest
#_0C9008: #_SHITENOU_78C9: db $30 ; rest
#_0C9009: #_SHITENOU_78CA: db $30 ; rest
#_0C900A: #_SHITENOU_78CB: db $30 ; rest
#_0C900B: #_SHITENOU_78CC: db $F1, $09 ; set SRCN
#_0C900D: #_SHITENOU_78CE: db $F2, $6C ; set panning

SHITENOU_SEGMENT_78D0:
#_0C900F: #_SHITENOU_78D0: db $F0, $FA, $E2 ; set ADSR
#_0C9012: #_SHITENOU_78D3: db $8E ; dur 0x0E
#_0C9013: #_SHITENOU_78D4: db $1B ; play note Ds4
#_0C9014: #_SHITENOU_78D5: db $31 ; tie
#_0C9015: #_SHITENOU_78D6: db $1B ; play note Ds4
#_0C9016: #_SHITENOU_78D7: db $31 ; tie
#_0C9017: #_SHITENOU_78D8: db $1B ; play note Ds4
#_0C9018: #_SHITENOU_78D9: db $31 ; tie
#_0C9019: #_SHITENOU_78DA: db $1B ; play note Ds4
#_0C901A: #_SHITENOU_78DB: db $31 ; tie
#_0C901B: #_SHITENOU_78DC: db $1B ; play note Ds4
#_0C901C: #_SHITENOU_78DD: db $31 ; tie
#_0C901D: #_SHITENOU_78DE: db $1B ; play note Ds4
#_0C901E: #_SHITENOU_78DF: db $31 ; tie
#_0C901F: #_SHITENOU_78E0: db $1B ; play note Ds4
#_0C9020: #_SHITENOU_78E1: db $31 ; tie
#_0C9021: #_SHITENOU_78E2: db $1B ; play note Ds4
#_0C9022: #_SHITENOU_78E3: db $31 ; tie
#_0C9023: #_SHITENOU_78E4: db $F0, $FA, $F0 ; set ADSR
#_0C9026: #_SHITENOU_78E7: db $8E ; dur 0x0E
#_0C9027: #_SHITENOU_78E8: db $1F ; play note G4
#_0C9028: #_SHITENOU_78E9: db $31 ; tie
#_0C9029: #_SHITENOU_78EA: db $31 ; tie
#_0C902A: #_SHITENOU_78EB: db $31 ; tie
#_0C902B: #_SHITENOU_78EC: db $F8 : dw SHITENOU_SEGMENT_78D0 ; goto location
#_0C902E: #_SHITENOU_78EF: db $FF ; end track

SHITENOU_SEGMENT_78F0:
#_0C902F: #_SHITENOU_78F0: db $87 ; dur 0x07
#_0C9030: #_SHITENOU_78F1: db $30 ; rest
#_0C9031: #_SHITENOU_78F2: db $F0, $FA, $F4 ; set ADSR
#_0C9034: #_SHITENOU_78F5: db $F2, $70 ; set panning
#_0C9036: #_SHITENOU_78F7: db $F9, $10 ; set fine tuning
#_0C9038: #_SHITENOU_78F9: db $F8 : dw SHITENOU_SEGMENT_7902 ; goto location
#_0C903B: #_SHITENOU_78FC: db $FF ; end track

SHITENOU_SEGMENT_78FD:
#_0C903C: #_SHITENOU_78FD: db $F0, $FF, $F4 ; set ADSR
#_0C903F: #_SHITENOU_7900: db $F2, $4C ; set panning

SHITENOU_SEGMENT_7902:
#_0C9041: #_SHITENOU_7902: db $70 ; vol 0x10
#_0C9042: #_SHITENOU_7903: db $F1, $02 ; set SRCN
#_0C9044: #_SHITENOU_7905: db $86 ; dur 0x06

SHITENOU_SEGMENT_7906:
#_0C9045: #_SHITENOU_7906: db $18 ; play note C4
#_0C9046: #_SHITENOU_7907: db $13 ; play note G3
#_0C9047: #_SHITENOU_7908: db $1F ; play note G4
#_0C9048: #_SHITENOU_7909: db $1D ; play note F4
#_0C9049: #_SHITENOU_790A: db $1B ; play note Ds4
#_0C904A: #_SHITENOU_790B: db $18 ; play note C4
#_0C904B: #_SHITENOU_790C: db $1A ; play note D4
#_0C904C: #_SHITENOU_790D: db $16 ; play note As3
#_0C904D: #_SHITENOU_790E: db $18 ; play note C4
#_0C904E: #_SHITENOU_790F: db $14 ; play note Gs3
#_0C904F: #_SHITENOU_7910: db $16 ; play note As3
#_0C9050: #_SHITENOU_7911: db $13 ; play note G3
#_0C9051: #_SHITENOU_7912: db $1B ; play note Ds4
#_0C9052: #_SHITENOU_7913: db $18 ; play note C4
#_0C9053: #_SHITENOU_7914: db $1A ; play note D4
#_0C9054: #_SHITENOU_7915: db $16 ; play note As3
#_0C9055: #_SHITENOU_7916: db $F8 : dw SHITENOU_SEGMENT_7906 ; goto location
#_0C9058: #_SHITENOU_7919: db $FF ; end track

SHITENOU_SEGMENT_791A:
#_0C9059: #_SHITENOU_791A: db $70 ; vol 0x10
#_0C905A: #_SHITENOU_791B: db $F0, $FF, $E0 ; set ADSR
#_0C905D: #_SHITENOU_791E: db $F2, $44 ; set panning
#_0C905F: #_SHITENOU_7920: db $F1, $00 ; set SRCN

SHITENOU_SEGMENT_7922:
#_0C9061: #_SHITENOU_7922: db $8A ; dur 0x0A
#_0C9062: #_SHITENOU_7923: db $18 ; play note C4
#_0C9063: #_SHITENOU_7924: db $F8 : dw SHITENOU_SEGMENT_7922 ; goto location
#_0C9066: #_SHITENOU_7927: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Embassy_SPC_Data:
#_0C9067: dw $00A6, $0000

SONG_EMBASSY:
#_0C906B: #_EMBASSY_7800: db $F1, $08 ; Set control
#_0C906D: #_EMBASSY_7802: db $00 : dw EMBASSY_SEGMENT_781B ; Music channel 0
#_0C9070: #_EMBASSY_7805: db $01 : dw EMBASSY_SEGMENT_7822 ; Music channel 1
#_0C9073: #_EMBASSY_7808: db $02 : dw EMBASSY_SEGMENT_785B ; Music channel 2
#_0C9076: #_EMBASSY_780B: db $03 : dw EMBASSY_SEGMENT_785D ; Music channel 3
#_0C9079: #_EMBASSY_780E: db $04 : dw EMBASSY_SEGMENT_7872 ; Music channel 4
#_0C907C: #_EMBASSY_7811: db $05 : dw EMBASSY_SEGMENT_7873 ; Music channel 5
#_0C907F: #_EMBASSY_7814: db $06 : dw EMBASSY_SEGMENT_7874 ; Music channel 6
#_0C9082: #_EMBASSY_7817: db $07 : dw EMBASSY_SEGMENT_788E ; Music channel 7
#_0C9085: #_EMBASSY_781A: db $FF ; end of header

EMBASSY_SEGMENT_781B:
#_0C9086: #_EMBASSY_781B: db $73 ; vol 0x13
#_0C9087: #_EMBASSY_781C: db $F9, $10 ; set fine tuning
#_0C9089: #_EMBASSY_781E: db $F8 : dw EMBASSY_SEGMENT_7823 ; goto location
#_0C908C: #_EMBASSY_7821: db $FF ; end track

EMBASSY_SEGMENT_7822:
#_0C908D: #_EMBASSY_7822: db $63 ; vol 0x03

EMBASSY_SEGMENT_7823:
#_0C908E: #_EMBASSY_7823: db $F2, $64 ; set panning
#_0C9090: #_EMBASSY_7825: db $F0, $FF, $F2 ; set ADSR
#_0C9093: #_EMBASSY_7828: db $F1, $08 ; set SRCN
#_0C9095: #_EMBASSY_782A: db $F3, $01 ; transpose +1
#_0C9097: #_EMBASSY_782C: db $86 ; dur 0x06

EMBASSY_SEGMENT_782D:
#_0C9098: #_EMBASSY_782D: db $F4, $04 ; set loop point B
#_0C909A: #_EMBASSY_782F: db $0B ; play note B2
#_0C909B: #_EMBASSY_7830: db $0E ; play note D3
#_0C909C: #_EMBASSY_7831: db $10 ; play note E3
#_0C909D: #_EMBASSY_7832: db $13 ; play note G3
#_0C909E: #_EMBASSY_7833: db $12 ; play note Fs3
#_0C909F: #_EMBASSY_7834: db $10 ; play note E3
#_0C90A0: #_EMBASSY_7835: db $0E ; play note D3
#_0C90A1: #_EMBASSY_7836: db $10 ; play note E3
#_0C90A2: #_EMBASSY_7837: db $0B ; play note B2
#_0C90A3: #_EMBASSY_7838: db $0E ; play note D3
#_0C90A4: #_EMBASSY_7839: db $10 ; play note E3
#_0C90A5: #_EMBASSY_783A: db $13 ; play note G3
#_0C90A6: #_EMBASSY_783B: db $F5 ; run loop B
#_0C90A7: #_EMBASSY_783C: db $F4, $03 ; set loop point B
#_0C90A9: #_EMBASSY_783E: db $09 ; play note A2
#_0C90AA: #_EMBASSY_783F: db $0C ; play note C3
#_0C90AB: #_EMBASSY_7840: db $0E ; play note D3
#_0C90AC: #_EMBASSY_7841: db $12 ; play note Fs3
#_0C90AD: #_EMBASSY_7842: db $10 ; play note E3
#_0C90AE: #_EMBASSY_7843: db $0E ; play note D3
#_0C90AF: #_EMBASSY_7844: db $0C ; play note C3
#_0C90B0: #_EMBASSY_7845: db $0E ; play note D3
#_0C90B1: #_EMBASSY_7846: db $09 ; play note A2
#_0C90B2: #_EMBASSY_7847: db $0C ; play note C3
#_0C90B3: #_EMBASSY_7848: db $0E ; play note D3
#_0C90B4: #_EMBASSY_7849: db $10 ; play note E3
#_0C90B5: #_EMBASSY_784A: db $F5 ; run loop B
#_0C90B6: #_EMBASSY_784B: db $09 ; play note A2
#_0C90B7: #_EMBASSY_784C: db $0C ; play note C3
#_0C90B8: #_EMBASSY_784D: db $0E ; play note D3
#_0C90B9: #_EMBASSY_784E: db $12 ; play note Fs3
#_0C90BA: #_EMBASSY_784F: db $10 ; play note E3
#_0C90BB: #_EMBASSY_7850: db $0E ; play note D3
#_0C90BC: #_EMBASSY_7851: db $0C ; play note C3
#_0C90BD: #_EMBASSY_7852: db $0E ; play note D3
#_0C90BE: #_EMBASSY_7853: db $09 ; play note A2
#_0C90BF: #_EMBASSY_7854: db $0C ; play note C3
#_0C90C0: #_EMBASSY_7855: db $0E ; play note D3
#_0C90C1: #_EMBASSY_7856: db $10 ; play note E3
#_0C90C2: #_EMBASSY_7857: db $F8 : dw EMBASSY_SEGMENT_782D ; goto location
#_0C90C5: #_EMBASSY_785A: db $FF ; end track

EMBASSY_SEGMENT_785B:
#_0C90C6: #_EMBASSY_785B: db $F9, $20 ; set fine tuning

EMBASSY_SEGMENT_785D:
#_0C90C8: #_EMBASSY_785D: db $70 ; vol 0x10
#_0C90C9: #_EMBASSY_785E: db $F0, $FF, $E4 ; set ADSR
#_0C90CC: #_EMBASSY_7861: db $F1, $04 ; set SRCN
#_0C90CE: #_EMBASSY_7863: db $F2, $60 ; set panning
#_0C90D0: #_EMBASSY_7865: db $8D ; dur 0x0D

EMBASSY_SEGMENT_7866:
#_0C90D1: #_EMBASSY_7866: db $17 ; play note B3
#_0C90D2: #_EMBASSY_7867: db $31 ; tie
#_0C90D3: #_EMBASSY_7868: db $31 ; tie
#_0C90D4: #_EMBASSY_7869: db $31 ; tie
#_0C90D5: #_EMBASSY_786A: db $15 ; play note A3
#_0C90D6: #_EMBASSY_786B: db $31 ; tie
#_0C90D7: #_EMBASSY_786C: db $31 ; tie
#_0C90D8: #_EMBASSY_786D: db $31 ; tie
#_0C90D9: #_EMBASSY_786E: db $F8 : dw EMBASSY_SEGMENT_7866 ; goto location
#_0C90DC: #_EMBASSY_7871: db $FF ; end track

EMBASSY_SEGMENT_7872:
#_0C90DD: #_EMBASSY_7872: db $FF ; end track

EMBASSY_SEGMENT_7873:
#_0C90DE: #_EMBASSY_7873: db $FF ; end track

EMBASSY_SEGMENT_7874:
#_0C90DF: #_EMBASSY_7874: db $70 ; vol 0x10
#_0C90E0: #_EMBASSY_7875: db $F0, $FF, $F2 ; set ADSR
#_0C90E3: #_EMBASSY_7878: db $F1, $02 ; set SRCN
#_0C90E5: #_EMBASSY_787A: db $F2, $4C ; set panning

EMBASSY_SEGMENT_787C:
#_0C90E7: #_EMBASSY_787C: db $F4, $10 ; set loop point B
#_0C90E9: #_EMBASSY_787E: db $88 ; dur 0x08
#_0C90EA: #_EMBASSY_787F: db $1C ; play note E4
#_0C90EB: #_EMBASSY_7880: db $86 ; dur 0x06
#_0C90EC: #_EMBASSY_7881: db $1C ; play note E4
#_0C90ED: #_EMBASSY_7882: db $F5 ; run loop B
#_0C90EE: #_EMBASSY_7883: db $F4, $10 ; set loop point B
#_0C90F0: #_EMBASSY_7885: db $88 ; dur 0x08
#_0C90F1: #_EMBASSY_7886: db $1A ; play note D4
#_0C90F2: #_EMBASSY_7887: db $86 ; dur 0x06
#_0C90F3: #_EMBASSY_7888: db $1A ; play note D4
#_0C90F4: #_EMBASSY_7889: db $F5 ; run loop B
#_0C90F5: #_EMBASSY_788A: db $F8 : dw EMBASSY_SEGMENT_787C ; goto location
#_0C90F8: #_EMBASSY_788D: db $FF ; end track

EMBASSY_SEGMENT_788E:
#_0C90F9: #_EMBASSY_788E: db $70 ; vol 0x10
#_0C90FA: #_EMBASSY_788F: db $F0, $FF, $E0 ; set ADSR
#_0C90FD: #_EMBASSY_7892: db $F2, $44 ; set panning

EMBASSY_SEGMENT_7894:
#_0C90FF: #_EMBASSY_7894: db $F1, $00 ; set SRCN
#_0C9101: #_EMBASSY_7896: db $88 ; dur 0x08
#_0C9102: #_EMBASSY_7897: db $18 ; play note C4
#_0C9103: #_EMBASSY_7898: db $86 ; dur 0x06
#_0C9104: #_EMBASSY_7899: db $18 ; play note C4
#_0C9105: #_EMBASSY_789A: db $F1, $01 ; set SRCN
#_0C9107: #_EMBASSY_789C: db $88 ; dur 0x08
#_0C9108: #_EMBASSY_789D: db $18 ; play note C4
#_0C9109: #_EMBASSY_789E: db $F1, $00 ; set SRCN
#_0C910B: #_EMBASSY_78A0: db $86 ; dur 0x06
#_0C910C: #_EMBASSY_78A1: db $18 ; play note C4
#_0C910D: #_EMBASSY_78A2: db $F8 : dw EMBASSY_SEGMENT_7894 ; goto location
#_0C9110: #_EMBASSY_78A5: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Arcade_SPC_Data:
#_0C9111: dw $0216, $0000

SONG_ARCADE:
#_0C9115: #_ARCADE_7800: db $F1, $00 ; Set control
#_0C9117: #_ARCADE_7802: db $00 : dw ARCADE_SEGMENT_781B ; Music channel 0
#_0C911A: #_ARCADE_7805: db $01 : dw ARCADE_SEGMENT_7894 ; Music channel 1
#_0C911D: #_ARCADE_7808: db $02 : dw ARCADE_SEGMENT_78C4 ; Music channel 2
#_0C9120: #_ARCADE_780B: db $03 : dw ARCADE_SEGMENT_78F2 ; Music channel 3
#_0C9123: #_ARCADE_780E: db $04 : dw ARCADE_SEGMENT_7920 ; Music channel 4
#_0C9126: #_ARCADE_7811: db $05 : dw ARCADE_SEGMENT_7941 ; Music channel 5
#_0C9129: #_ARCADE_7814: db $06 : dw ARCADE_SEGMENT_796F ; Music channel 6
#_0C912C: #_ARCADE_7817: db $07 : dw ARCADE_SEGMENT_79C5 ; Music channel 7
#_0C912F: #_ARCADE_781A: db $FF ; end of header

ARCADE_SEGMENT_781B:
#_0C9130: #_ARCADE_781B: db $73 ; vol 0x13
#_0C9131: #_ARCADE_781C: db $F0, $FF, $E8 ; set ADSR
#_0C9134: #_ARCADE_781F: db $F1, $08 ; set SRCN
#_0C9136: #_ARCADE_7821: db $F2, $68 ; set panning
#_0C9138: #_ARCADE_7823: db $F3, $04 ; transpose +4
#_0C913A: #_ARCADE_7825: db $86 ; dur 0x06
#_0C913B: #_ARCADE_7826: db $30 ; rest
#_0C913C: #_ARCADE_7827: db $8E ; dur 0x0E
#_0C913D: #_ARCADE_7828: db $30 ; rest
#_0C913E: #_ARCADE_7829: db $30 ; rest
#_0C913F: #_ARCADE_782A: db $30 ; rest
#_0C9140: #_ARCADE_782B: db $8D ; dur 0x0D
#_0C9141: #_ARCADE_782C: db $30 ; rest

ARCADE_SEGMENT_782D:
#_0C9142: #_ARCADE_782D: db $F4, $02 ; set loop point B
#_0C9144: #_ARCADE_782F: db $89 ; dur 0x09
#_0C9145: #_ARCADE_7830: db $1C ; play note E4
#_0C9146: #_ARCADE_7831: db $1A ; play note D4
#_0C9147: #_ARCADE_7832: db $8D ; dur 0x0D
#_0C9148: #_ARCADE_7833: db $31 ; tie
#_0C9149: #_ARCADE_7834: db $8E ; dur 0x0E
#_0C914A: #_ARCADE_7835: db $31 ; tie
#_0C914B: #_ARCADE_7836: db $1A ; play note D4
#_0C914C: #_ARCADE_7837: db $8D ; dur 0x0D
#_0C914D: #_ARCADE_7838: db $31 ; tie
#_0C914E: #_ARCADE_7839: db $88 ; dur 0x08
#_0C914F: #_ARCADE_783A: db $31 ; tie
#_0C9150: #_ARCADE_783B: db $F5 ; run loop B
#_0C9151: #_ARCADE_783C: db $F8 : dw ARCADE_SEGMENT_782D ; goto location

ARCADE_UNUSED_SEGMENT_783F: ; unused segment
#_0C9154: #_ARCADE_783F: db $70 ; vol 0x10
#_0C9155: #_ARCADE_7840: db $F0, $FE, $E2 ; set ADSR
#_0C9158: #_ARCADE_7843: db $F2, $60 ; set panning
#_0C915A: #_ARCADE_7845: db $F6 : dw ARCADE_SEGMENT_7849 ; subroutine B
#_0C915D: #_ARCADE_7848: db $FF ; end track

ARCADE_SEGMENT_7849:
#_0C915E: #_ARCADE_7849: db $F1, $09 ; set SRCN
#_0C9160: #_ARCADE_784B: db $86 ; dur 0x06
#_0C9161: #_ARCADE_784C: db $15 ; play note A3
#_0C9162: #_ARCADE_784D: db $30 ; rest
#_0C9163: #_ARCADE_784E: db $17 ; play note B3
#_0C9164: #_ARCADE_784F: db $30 ; rest
#_0C9165: #_ARCADE_7850: db $8A ; dur 0x0A
#_0C9166: #_ARCADE_7851: db $19 ; play note Cs4
#_0C9167: #_ARCADE_7852: db $86 ; dur 0x06
#_0C9168: #_ARCADE_7853: db $1A ; play note D4
#_0C9169: #_ARCADE_7854: db $30 ; rest
#_0C916A: #_ARCADE_7855: db $8A ; dur 0x0A
#_0C916B: #_ARCADE_7856: db $1C ; play note E4
#_0C916C: #_ARCADE_7857: db $86 ; dur 0x06
#_0C916D: #_ARCADE_7858: db $1A ; play note D4
#_0C916E: #_ARCADE_7859: db $30 ; rest
#_0C916F: #_ARCADE_785A: db $88 ; dur 0x08
#_0C9170: #_ARCADE_785B: db $19 ; play note Cs4
#_0C9171: #_ARCADE_785C: db $17 ; play note B3
#_0C9172: #_ARCADE_785D: db $89 ; dur 0x09
#_0C9173: #_ARCADE_785E: db $19 ; play note Cs4
#_0C9174: #_ARCADE_785F: db $86 ; dur 0x06
#_0C9175: #_ARCADE_7860: db $15 ; play note A3
#_0C9176: #_ARCADE_7861: db $8C ; dur 0x0C
#_0C9177: #_ARCADE_7862: db $30 ; rest
#_0C9178: #_ARCADE_7863: db $89 ; dur 0x09
#_0C9179: #_ARCADE_7864: db $1C ; play note E4
#_0C917A: #_ARCADE_7865: db $86 ; dur 0x06
#_0C917B: #_ARCADE_7866: db $1A ; play note D4
#_0C917C: #_ARCADE_7867: db $8D ; dur 0x0D
#_0C917D: #_ARCADE_7868: db $30 ; rest
#_0C917E: #_ARCADE_7869: db $89 ; dur 0x09
#_0C917F: #_ARCADE_786A: db $19 ; play note Cs4
#_0C9180: #_ARCADE_786B: db $86 ; dur 0x06
#_0C9181: #_ARCADE_786C: db $1A ; play note D4
#_0C9182: #_ARCADE_786D: db $8D ; dur 0x0D
#_0C9183: #_ARCADE_786E: db $30 ; rest
#_0C9184: #_ARCADE_786F: db $86 ; dur 0x06
#_0C9185: #_ARCADE_7870: db $19 ; play note Cs4
#_0C9186: #_ARCADE_7871: db $30 ; rest
#_0C9187: #_ARCADE_7872: db $1A ; play note D4
#_0C9188: #_ARCADE_7873: db $30 ; rest
#_0C9189: #_ARCADE_7874: db $8A ; dur 0x0A
#_0C918A: #_ARCADE_7875: db $1C ; play note E4
#_0C918B: #_ARCADE_7876: db $86 ; dur 0x06
#_0C918C: #_ARCADE_7877: db $1E ; play note Fs4
#_0C918D: #_ARCADE_7878: db $30 ; rest
#_0C918E: #_ARCADE_7879: db $8A ; dur 0x0A
#_0C918F: #_ARCADE_787A: db $1F ; play note G4
#_0C9190: #_ARCADE_787B: db $86 ; dur 0x06
#_0C9191: #_ARCADE_787C: db $1E ; play note Fs4
#_0C9192: #_ARCADE_787D: db $30 ; rest
#_0C9193: #_ARCADE_787E: db $88 ; dur 0x08
#_0C9194: #_ARCADE_787F: db $1C ; play note E4
#_0C9195: #_ARCADE_7880: db $1A ; play note D4
#_0C9196: #_ARCADE_7881: db $89 ; dur 0x09
#_0C9197: #_ARCADE_7882: db $1C ; play note E4
#_0C9198: #_ARCADE_7883: db $86 ; dur 0x06
#_0C9199: #_ARCADE_7884: db $19 ; play note Cs4
#_0C919A: #_ARCADE_7885: db $8C ; dur 0x0C
#_0C919B: #_ARCADE_7886: db $30 ; rest
#_0C919C: #_ARCADE_7887: db $89 ; dur 0x09
#_0C919D: #_ARCADE_7888: db $1C ; play note E4
#_0C919E: #_ARCADE_7889: db $86 ; dur 0x06
#_0C919F: #_ARCADE_788A: db $1A ; play note D4
#_0C91A0: #_ARCADE_788B: db $8D ; dur 0x0D
#_0C91A1: #_ARCADE_788C: db $30 ; rest
#_0C91A2: #_ARCADE_788D: db $89 ; dur 0x09
#_0C91A3: #_ARCADE_788E: db $20 ; play note Gs4
#_0C91A4: #_ARCADE_788F: db $86 ; dur 0x06
#_0C91A5: #_ARCADE_7890: db $1E ; play note Fs4
#_0C91A6: #_ARCADE_7891: db $8D ; dur 0x0D
#_0C91A7: #_ARCADE_7892: db $30 ; rest
#_0C91A8: #_ARCADE_7893: db $F7 ; return from routine B

ARCADE_SEGMENT_7894:
#_0C91A9: #_ARCADE_7894: db $63 ; vol 0x03
#_0C91AA: #_ARCADE_7895: db $F0, $FF, $E8 ; set ADSR
#_0C91AD: #_ARCADE_7898: db $F1, $08 ; set SRCN
#_0C91AF: #_ARCADE_789A: db $F2, $68 ; set panning
#_0C91B1: #_ARCADE_789C: db $F3, $04 ; transpose +4
#_0C91B3: #_ARCADE_789E: db $F9, $20 ; set fine tuning
#_0C91B5: #_ARCADE_78A0: db $86 ; dur 0x06
#_0C91B6: #_ARCADE_78A1: db $30 ; rest
#_0C91B7: #_ARCADE_78A2: db $8E ; dur 0x0E
#_0C91B8: #_ARCADE_78A3: db $30 ; rest
#_0C91B9: #_ARCADE_78A4: db $30 ; rest
#_0C91BA: #_ARCADE_78A5: db $30 ; rest
#_0C91BB: #_ARCADE_78A6: db $8D ; dur 0x0D
#_0C91BC: #_ARCADE_78A7: db $30 ; rest

ARCADE_SEGMENT_78A8:
#_0C91BD: #_ARCADE_78A8: db $89 ; dur 0x09
#_0C91BE: #_ARCADE_78A9: db $1C ; play note E4
#_0C91BF: #_ARCADE_78AA: db $1A ; play note D4
#_0C91C0: #_ARCADE_78AB: db $8D ; dur 0x0D
#_0C91C1: #_ARCADE_78AC: db $31 ; tie
#_0C91C2: #_ARCADE_78AD: db $8E ; dur 0x0E
#_0C91C3: #_ARCADE_78AE: db $31 ; tie
#_0C91C4: #_ARCADE_78AF: db $1A ; play note D4
#_0C91C5: #_ARCADE_78B0: db $8D ; dur 0x0D
#_0C91C6: #_ARCADE_78B1: db $31 ; tie
#_0C91C7: #_ARCADE_78B2: db $88 ; dur 0x08
#_0C91C8: #_ARCADE_78B3: db $31 ; tie
#_0C91C9: #_ARCADE_78B4: db $F8 : dw ARCADE_SEGMENT_78A8 ; goto location

ARCADE_UNUSED_SEGMENT_78B7: ; unused segment
#_0C91CC: #_ARCADE_78B7: db $89 ; dur 0x09
#_0C91CD: #_ARCADE_78B8: db $1C ; play note E4
#_0C91CE: #_ARCADE_78B9: db $1A ; play note D4
#_0C91CF: #_ARCADE_78BA: db $8D ; dur 0x0D
#_0C91D0: #_ARCADE_78BB: db $31 ; tie
#_0C91D1: #_ARCADE_78BC: db $8E ; dur 0x0E
#_0C91D2: #_ARCADE_78BD: db $31 ; tie
#_0C91D3: #_ARCADE_78BE: db $1A ; play note D4
#_0C91D4: #_ARCADE_78BF: db $8D ; dur 0x0D
#_0C91D5: #_ARCADE_78C0: db $31 ; tie
#_0C91D6: #_ARCADE_78C1: db $8B ; dur 0x0B
#_0C91D7: #_ARCADE_78C2: db $31 ; tie
#_0C91D8: #_ARCADE_78C3: db $FF ; end track

ARCADE_SEGMENT_78C4:
#_0C91D9: #_ARCADE_78C4: db $73 ; vol 0x13
#_0C91DA: #_ARCADE_78C5: db $F0, $FF, $E8 ; set ADSR
#_0C91DD: #_ARCADE_78C8: db $F1, $08 ; set SRCN
#_0C91DF: #_ARCADE_78CA: db $F2, $68 ; set panning
#_0C91E1: #_ARCADE_78CC: db $F3, $04 ; transpose +4
#_0C91E3: #_ARCADE_78CE: db $86 ; dur 0x06
#_0C91E4: #_ARCADE_78CF: db $30 ; rest
#_0C91E5: #_ARCADE_78D0: db $8E ; dur 0x0E
#_0C91E6: #_ARCADE_78D1: db $30 ; rest
#_0C91E7: #_ARCADE_78D2: db $30 ; rest
#_0C91E8: #_ARCADE_78D3: db $30 ; rest
#_0C91E9: #_ARCADE_78D4: db $8D ; dur 0x0D
#_0C91EA: #_ARCADE_78D5: db $30 ; rest

ARCADE_SEGMENT_78D6:
#_0C91EB: #_ARCADE_78D6: db $89 ; dur 0x09
#_0C91EC: #_ARCADE_78D7: db $19 ; play note Cs4
#_0C91ED: #_ARCADE_78D8: db $17 ; play note B3
#_0C91EE: #_ARCADE_78D9: db $8D ; dur 0x0D
#_0C91EF: #_ARCADE_78DA: db $31 ; tie
#_0C91F0: #_ARCADE_78DB: db $8E ; dur 0x0E
#_0C91F1: #_ARCADE_78DC: db $31 ; tie
#_0C91F2: #_ARCADE_78DD: db $17 ; play note B3
#_0C91F3: #_ARCADE_78DE: db $8D ; dur 0x0D
#_0C91F4: #_ARCADE_78DF: db $31 ; tie
#_0C91F5: #_ARCADE_78E0: db $88 ; dur 0x08
#_0C91F6: #_ARCADE_78E1: db $31 ; tie
#_0C91F7: #_ARCADE_78E2: db $F8 : dw ARCADE_SEGMENT_78D6 ; goto location

ARCADE_UNUSED_SEGMENT_78E5: ; unused segment
#_0C91FA: #_ARCADE_78E5: db $89 ; dur 0x09
#_0C91FB: #_ARCADE_78E6: db $19 ; play note Cs4
#_0C91FC: #_ARCADE_78E7: db $17 ; play note B3
#_0C91FD: #_ARCADE_78E8: db $8D ; dur 0x0D
#_0C91FE: #_ARCADE_78E9: db $31 ; tie
#_0C91FF: #_ARCADE_78EA: db $8E ; dur 0x0E
#_0C9200: #_ARCADE_78EB: db $31 ; tie
#_0C9201: #_ARCADE_78EC: db $17 ; play note B3
#_0C9202: #_ARCADE_78ED: db $8D ; dur 0x0D
#_0C9203: #_ARCADE_78EE: db $31 ; tie
#_0C9204: #_ARCADE_78EF: db $8B ; dur 0x0B
#_0C9205: #_ARCADE_78F0: db $31 ; tie
#_0C9206: #_ARCADE_78F1: db $FF ; end track

ARCADE_SEGMENT_78F2:
#_0C9207: #_ARCADE_78F2: db $63 ; vol 0x03
#_0C9208: #_ARCADE_78F3: db $F0, $FF, $E8 ; set ADSR
#_0C920B: #_ARCADE_78F6: db $F1, $08 ; set SRCN
#_0C920D: #_ARCADE_78F8: db $F2, $68 ; set panning
#_0C920F: #_ARCADE_78FA: db $F3, $04 ; transpose +4
#_0C9211: #_ARCADE_78FC: db $86 ; dur 0x06
#_0C9212: #_ARCADE_78FD: db $30 ; rest
#_0C9213: #_ARCADE_78FE: db $8E ; dur 0x0E
#_0C9214: #_ARCADE_78FF: db $30 ; rest
#_0C9215: #_ARCADE_7900: db $30 ; rest
#_0C9216: #_ARCADE_7901: db $30 ; rest
#_0C9217: #_ARCADE_7902: db $8D ; dur 0x0D
#_0C9218: #_ARCADE_7903: db $30 ; rest

ARCADE_SEGMENT_7904:
#_0C9219: #_ARCADE_7904: db $89 ; dur 0x09
#_0C921A: #_ARCADE_7905: db $15 ; play note A3
#_0C921B: #_ARCADE_7906: db $15 ; play note A3
#_0C921C: #_ARCADE_7907: db $8D ; dur 0x0D
#_0C921D: #_ARCADE_7908: db $31 ; tie
#_0C921E: #_ARCADE_7909: db $8E ; dur 0x0E
#_0C921F: #_ARCADE_790A: db $31 ; tie
#_0C9220: #_ARCADE_790B: db $14 ; play note Gs3
#_0C9221: #_ARCADE_790C: db $8D ; dur 0x0D
#_0C9222: #_ARCADE_790D: db $31 ; tie
#_0C9223: #_ARCADE_790E: db $88 ; dur 0x08
#_0C9224: #_ARCADE_790F: db $31 ; tie
#_0C9225: #_ARCADE_7910: db $F8 : dw ARCADE_SEGMENT_7904 ; goto location

ARCADE_UNUSED_SEGMENT_7913: ; unused segment
#_0C9228: #_ARCADE_7913: db $89 ; dur 0x09
#_0C9229: #_ARCADE_7914: db $15 ; play note A3
#_0C922A: #_ARCADE_7915: db $15 ; play note A3
#_0C922B: #_ARCADE_7916: db $8D ; dur 0x0D
#_0C922C: #_ARCADE_7917: db $31 ; tie
#_0C922D: #_ARCADE_7918: db $8E ; dur 0x0E
#_0C922E: #_ARCADE_7919: db $31 ; tie
#_0C922F: #_ARCADE_791A: db $14 ; play note Gs3
#_0C9230: #_ARCADE_791B: db $8D ; dur 0x0D
#_0C9231: #_ARCADE_791C: db $31 ; tie
#_0C9232: #_ARCADE_791D: db $8D ; dur 0x0D
#_0C9233: #_ARCADE_791E: db $31 ; tie
#_0C9234: #_ARCADE_791F: db $FF ; end track

ARCADE_SEGMENT_7920:
#_0C9235: #_ARCADE_7920: db $70 ; vol 0x10
#_0C9236: #_ARCADE_7921: db $F0, $FF, $E8 ; set ADSR
#_0C9239: #_ARCADE_7924: db $F1, $08 ; set SRCN
#_0C923B: #_ARCADE_7926: db $F2, $68 ; set panning
#_0C923D: #_ARCADE_7928: db $F3, $04 ; transpose +4
#_0C923F: #_ARCADE_792A: db $FF ; end track
#_0C9240: #_ARCADE_792B: db $86 ; dur 0x06
#_0C9241: #_ARCADE_792C: db $30 ; rest
#_0C9242: #_ARCADE_792D: db $8E ; dur 0x0E
#_0C9243: #_ARCADE_792E: db $F4, $0B ; set loop point B
#_0C9245: #_ARCADE_7930: db $30 ; rest
#_0C9246: #_ARCADE_7931: db $F5 ; run loop B
#_0C9247: #_ARCADE_7932: db $8D ; dur 0x0D
#_0C9248: #_ARCADE_7933: db $30 ; rest
#_0C9249: #_ARCADE_7934: db $87 ; dur 0x07
#_0C924A: #_ARCADE_7935: db $30 ; rest
#_0C924B: #_ARCADE_7936: db $F0, $FA, $E2 ; set ADSR
#_0C924E: #_ARCADE_7939: db $F2, $6C ; set panning
#_0C9250: #_ARCADE_793B: db $F9, $18 ; set fine tuning
#_0C9252: #_ARCADE_793D: db $F6 : dw ARCADE_SEGMENT_7849 ; subroutine B
#_0C9255: #_ARCADE_7940: db $FF ; end track

ARCADE_SEGMENT_7941:
#_0C9256: #_ARCADE_7941: db $70 ; vol 0x10
#_0C9257: #_ARCADE_7942: db $F0, $FF, $E8 ; set ADSR
#_0C925A: #_ARCADE_7945: db $F1, $08 ; set SRCN
#_0C925C: #_ARCADE_7947: db $F2, $68 ; set panning
#_0C925E: #_ARCADE_7949: db $F3, $04 ; transpose +4
#_0C9260: #_ARCADE_794B: db $86 ; dur 0x06
#_0C9261: #_ARCADE_794C: db $30 ; rest
#_0C9262: #_ARCADE_794D: db $8E ; dur 0x0E
#_0C9263: #_ARCADE_794E: db $30 ; rest
#_0C9264: #_ARCADE_794F: db $30 ; rest
#_0C9265: #_ARCADE_7950: db $30 ; rest
#_0C9266: #_ARCADE_7951: db $8D ; dur 0x0D
#_0C9267: #_ARCADE_7952: db $30 ; rest

ARCADE_SEGMENT_7953:
#_0C9268: #_ARCADE_7953: db $89 ; dur 0x09
#_0C9269: #_ARCADE_7954: db $12 ; play note Fs3
#_0C926A: #_ARCADE_7955: db $12 ; play note Fs3
#_0C926B: #_ARCADE_7956: db $8D ; dur 0x0D
#_0C926C: #_ARCADE_7957: db $31 ; tie
#_0C926D: #_ARCADE_7958: db $8E ; dur 0x0E
#_0C926E: #_ARCADE_7959: db $31 ; tie
#_0C926F: #_ARCADE_795A: db $10 ; play note E3
#_0C9270: #_ARCADE_795B: db $8D ; dur 0x0D
#_0C9271: #_ARCADE_795C: db $31 ; tie
#_0C9272: #_ARCADE_795D: db $88 ; dur 0x08
#_0C9273: #_ARCADE_795E: db $31 ; tie
#_0C9274: #_ARCADE_795F: db $F8 : dw ARCADE_SEGMENT_7953 ; goto location

ARCADE_UNUSED_SEGMENT_7962: ; unused segment
#_0C9277: #_ARCADE_7962: db $89 ; dur 0x09
#_0C9278: #_ARCADE_7963: db $12 ; play note Fs3
#_0C9279: #_ARCADE_7964: db $12 ; play note Fs3
#_0C927A: #_ARCADE_7965: db $8D ; dur 0x0D
#_0C927B: #_ARCADE_7966: db $31 ; tie
#_0C927C: #_ARCADE_7967: db $8E ; dur 0x0E
#_0C927D: #_ARCADE_7968: db $31 ; tie
#_0C927E: #_ARCADE_7969: db $10 ; play note E3
#_0C927F: #_ARCADE_796A: db $8D ; dur 0x0D
#_0C9280: #_ARCADE_796B: db $31 ; tie
#_0C9281: #_ARCADE_796C: db $8D ; dur 0x0D
#_0C9282: #_ARCADE_796D: db $31 ; tie
#_0C9283: #_ARCADE_796E: db $FF ; end track

ARCADE_SEGMENT_796F:
#_0C9284: #_ARCADE_796F: db $70 ; vol 0x10
#_0C9285: #_ARCADE_7970: db $F0, $DF, $F2 ; set ADSR
#_0C9288: #_ARCADE_7973: db $F1, $02 ; set SRCN
#_0C928A: #_ARCADE_7975: db $F2, $4C ; set panning
#_0C928C: #_ARCADE_7977: db $F3, $04 ; transpose +4
#_0C928E: #_ARCADE_7979: db $86 ; dur 0x06
#_0C928F: #_ARCADE_797A: db $F6 : dw ARCADE_SEGMENT_79A4 ; subroutine B
#_0C9292: #_ARCADE_797D: db $17 ; play note B3
#_0C9293: #_ARCADE_797E: db $30 ; rest
#_0C9294: #_ARCADE_797F: db $17 ; play note B3
#_0C9295: #_ARCADE_7980: db $15 ; play note A3
#_0C9296: #_ARCADE_7981: db $12 ; play note Fs3
#_0C9297: #_ARCADE_7982: db $15 ; play note A3
#_0C9298: #_ARCADE_7983: db $12 ; play note Fs3
#_0C9299: #_ARCADE_7984: db $10 ; play note E3
#_0C929A: #_ARCADE_7985: db $0E ; play note D3
#_0C929B: #_ARCADE_7986: db $12 ; play note Fs3
#_0C929C: #_ARCADE_7987: db $10 ; play note E3
#_0C929D: #_ARCADE_7988: db $0E ; play note D3
#_0C929E: #_ARCADE_7989: db $0B ; play note B2
#_0C929F: #_ARCADE_798A: db $30 ; rest
#_0C92A0: #_ARCADE_798B: db $30 ; rest
#_0C92A1: #_ARCADE_798C: db $30 ; rest
#_0C92A2: #_ARCADE_798D: db $17 ; play note B3
#_0C92A3: #_ARCADE_798E: db $30 ; rest
#_0C92A4: #_ARCADE_798F: db $17 ; play note B3
#_0C92A5: #_ARCADE_7990: db $15 ; play note A3
#_0C92A6: #_ARCADE_7991: db $12 ; play note Fs3
#_0C92A7: #_ARCADE_7992: db $15 ; play note A3
#_0C92A8: #_ARCADE_7993: db $12 ; play note Fs3
#_0C92A9: #_ARCADE_7994: db $10 ; play note E3
#_0C92AA: #_ARCADE_7995: db $0E ; play note D3
#_0C92AB: #_ARCADE_7996: db $10 ; play note E3
#_0C92AC: #_ARCADE_7997: db $12 ; play note Fs3
#_0C92AD: #_ARCADE_7998: db $30 ; rest
#_0C92AE: #_ARCADE_7999: db $13 ; play note G3
#_0C92AF: #_ARCADE_799A: db $30 ; rest
#_0C92B0: #_ARCADE_799B: db $15 ; play note A3
#_0C92B1: #_ARCADE_799C: db $30 ; rest

ARCADE_SEGMENT_799D:
#_0C92B2: #_ARCADE_799D: db $F6 : dw ARCADE_SEGMENT_79A4 ; subroutine B
#_0C92B5: #_ARCADE_79A0: db $F8 : dw ARCADE_SEGMENT_799D ; goto location
#_0C92B8: #_ARCADE_79A3: db $FF ; end track

ARCADE_SEGMENT_79A4:
#_0C92B9: #_ARCADE_79A4: db $17 ; play note B3
#_0C92BA: #_ARCADE_79A5: db $30 ; rest
#_0C92BB: #_ARCADE_79A6: db $17 ; play note B3
#_0C92BC: #_ARCADE_79A7: db $15 ; play note A3
#_0C92BD: #_ARCADE_79A8: db $12 ; play note Fs3
#_0C92BE: #_ARCADE_79A9: db $15 ; play note A3
#_0C92BF: #_ARCADE_79AA: db $12 ; play note Fs3
#_0C92C0: #_ARCADE_79AB: db $10 ; play note E3
#_0C92C1: #_ARCADE_79AC: db $0E ; play note D3
#_0C92C2: #_ARCADE_79AD: db $12 ; play note Fs3
#_0C92C3: #_ARCADE_79AE: db $10 ; play note E3
#_0C92C4: #_ARCADE_79AF: db $0E ; play note D3
#_0C92C5: #_ARCADE_79B0: db $0B ; play note B2
#_0C92C6: #_ARCADE_79B1: db $30 ; rest
#_0C92C7: #_ARCADE_79B2: db $30 ; rest
#_0C92C8: #_ARCADE_79B3: db $30 ; rest
#_0C92C9: #_ARCADE_79B4: db $17 ; play note B3
#_0C92CA: #_ARCADE_79B5: db $30 ; rest
#_0C92CB: #_ARCADE_79B6: db $17 ; play note B3
#_0C92CC: #_ARCADE_79B7: db $15 ; play note A3
#_0C92CD: #_ARCADE_79B8: db $12 ; play note Fs3
#_0C92CE: #_ARCADE_79B9: db $15 ; play note A3
#_0C92CF: #_ARCADE_79BA: db $12 ; play note Fs3
#_0C92D0: #_ARCADE_79BB: db $10 ; play note E3
#_0C92D1: #_ARCADE_79BC: db $0E ; play note D3
#_0C92D2: #_ARCADE_79BD: db $10 ; play note E3
#_0C92D3: #_ARCADE_79BE: db $12 ; play note Fs3
#_0C92D4: #_ARCADE_79BF: db $30 ; rest
#_0C92D5: #_ARCADE_79C0: db $30 ; rest
#_0C92D6: #_ARCADE_79C1: db $30 ; rest
#_0C92D7: #_ARCADE_79C2: db $30 ; rest
#_0C92D8: #_ARCADE_79C3: db $30 ; rest
#_0C92D9: #_ARCADE_79C4: db $F7 ; return from routine B

ARCADE_SEGMENT_79C5:
#_0C92DA: #_ARCADE_79C5: db $70 ; vol 0x10
#_0C92DB: #_ARCADE_79C6: db $F0, $FF, $E0 ; set ADSR
#_0C92DE: #_ARCADE_79C9: db $F2, $44 ; set panning
#_0C92E0: #_ARCADE_79CB: db $86 ; dur 0x06
#_0C92E1: #_ARCADE_79CC: db $30 ; rest
#_0C92E2: #_ARCADE_79CD: db $F1, $00 ; set SRCN
#_0C92E4: #_ARCADE_79CF: db $8A ; dur 0x0A
#_0C92E5: #_ARCADE_79D0: db $F4, $0E ; set loop point B
#_0C92E7: #_ARCADE_79D2: db $18 ; play note C4
#_0C92E8: #_ARCADE_79D3: db $F5 ; run loop B
#_0C92E9: #_ARCADE_79D4: db $86 ; dur 0x06
#_0C92EA: #_ARCADE_79D5: db $18 ; play note C4
#_0C92EB: #_ARCADE_79D6: db $F1, $01 ; set SRCN
#_0C92ED: #_ARCADE_79D8: db $88 ; dur 0x08
#_0C92EE: #_ARCADE_79D9: db $18 ; play note C4
#_0C92EF: #_ARCADE_79DA: db $18 ; play note C4
#_0C92F0: #_ARCADE_79DB: db $18 ; play note C4

ARCADE_SEGMENT_79DC:
#_0C92F1: #_ARCADE_79DC: db $F1, $00 ; set SRCN
#_0C92F3: #_ARCADE_79DE: db $88 ; dur 0x08
#_0C92F4: #_ARCADE_79DF: db $18 ; play note C4
#_0C92F5: #_ARCADE_79E0: db $18 ; play note C4
#_0C92F6: #_ARCADE_79E1: db $86 ; dur 0x06
#_0C92F7: #_ARCADE_79E2: db $18 ; play note C4
#_0C92F8: #_ARCADE_79E3: db $F1, $01 ; set SRCN
#_0C92FA: #_ARCADE_79E5: db $89 ; dur 0x09
#_0C92FB: #_ARCADE_79E6: db $18 ; play note C4
#_0C92FC: #_ARCADE_79E7: db $F1, $00 ; set SRCN
#_0C92FE: #_ARCADE_79E9: db $86 ; dur 0x06
#_0C92FF: #_ARCADE_79EA: db $18 ; play note C4
#_0C9300: #_ARCADE_79EB: db $18 ; play note C4
#_0C9301: #_ARCADE_79EC: db $88 ; dur 0x08
#_0C9302: #_ARCADE_79ED: db $18 ; play note C4
#_0C9303: #_ARCADE_79EE: db $86 ; dur 0x06
#_0C9304: #_ARCADE_79EF: db $18 ; play note C4
#_0C9305: #_ARCADE_79F0: db $F1, $01 ; set SRCN
#_0C9307: #_ARCADE_79F2: db $88 ; dur 0x08
#_0C9308: #_ARCADE_79F3: db $18 ; play note C4
#_0C9309: #_ARCADE_79F4: db $F1, $00 ; set SRCN
#_0C930B: #_ARCADE_79F6: db $86 ; dur 0x06
#_0C930C: #_ARCADE_79F7: db $18 ; play note C4
#_0C930D: #_ARCADE_79F8: db $F1, $00 ; set SRCN
#_0C930F: #_ARCADE_79FA: db $88 ; dur 0x08
#_0C9310: #_ARCADE_79FB: db $18 ; play note C4
#_0C9311: #_ARCADE_79FC: db $18 ; play note C4
#_0C9312: #_ARCADE_79FD: db $86 ; dur 0x06
#_0C9313: #_ARCADE_79FE: db $18 ; play note C4
#_0C9314: #_ARCADE_79FF: db $F1, $01 ; set SRCN
#_0C9316: #_ARCADE_7A01: db $89 ; dur 0x09
#_0C9317: #_ARCADE_7A02: db $18 ; play note C4
#_0C9318: #_ARCADE_7A03: db $F1, $00 ; set SRCN
#_0C931A: #_ARCADE_7A05: db $86 ; dur 0x06
#_0C931B: #_ARCADE_7A06: db $18 ; play note C4
#_0C931C: #_ARCADE_7A07: db $18 ; play note C4
#_0C931D: #_ARCADE_7A08: db $89 ; dur 0x09
#_0C931E: #_ARCADE_7A09: db $18 ; play note C4
#_0C931F: #_ARCADE_7A0A: db $F1, $01 ; set SRCN
#_0C9321: #_ARCADE_7A0C: db $88 ; dur 0x08
#_0C9322: #_ARCADE_7A0D: db $18 ; play note C4
#_0C9323: #_ARCADE_7A0E: db $F1, $00 ; set SRCN
#_0C9325: #_ARCADE_7A10: db $86 ; dur 0x06
#_0C9326: #_ARCADE_7A11: db $18 ; play note C4
#_0C9327: #_ARCADE_7A12: db $F8 : dw ARCADE_SEGMENT_79DC ; goto location
#_0C932A: #_ARCADE_7A15: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Kichijoi_SPC_Data:
#_0C932B: dw $012E, $0000

SONG_KICHIJOI:
#_0C932F: #_KICHIJOI_7800: db $F1, $00 ; Set control
#_0C9331: #_KICHIJOI_7802: db $00 : dw KICHIJOI_SEGMENT_781B ; Music channel 0
#_0C9334: #_KICHIJOI_7805: db $01 : dw KICHIJOI_SEGMENT_7822 ; Music channel 1
#_0C9337: #_KICHIJOI_7808: db $02 : dw KICHIJOI_SEGMENT_783E ; Music channel 2
#_0C933A: #_KICHIJOI_780B: db $03 : dw KICHIJOI_SEGMENT_785B ; Music channel 3
#_0C933D: #_KICHIJOI_780E: db $04 : dw KICHIJOI_SEGMENT_7878 ; Music channel 4
#_0C9340: #_KICHIJOI_7811: db $05 : dw KICHIJOI_SEGMENT_78BB ; Music channel 5
#_0C9343: #_KICHIJOI_7814: db $06 : dw KICHIJOI_SEGMENT_78C0 ; Music channel 6
#_0C9346: #_KICHIJOI_7817: db $07 : dw KICHIJOI_SEGMENT_78EE ; Music channel 7
#_0C9349: #_KICHIJOI_781A: db $FF ; end of header

KICHIJOI_SEGMENT_781B:
#_0C934A: #_KICHIJOI_781B: db $62 ; vol 0x02
#_0C934B: #_KICHIJOI_781C: db $F9, $20 ; set fine tuning
#_0C934D: #_KICHIJOI_781E: db $F8 : dw KICHIJOI_SEGMENT_7823 ; goto location
#_0C9350: #_KICHIJOI_7821: db $FF ; end track

KICHIJOI_SEGMENT_7822:
#_0C9351: #_KICHIJOI_7822: db $72 ; vol 0x12

KICHIJOI_SEGMENT_7823:
#_0C9352: #_KICHIJOI_7823: db $F0, $FE, $EB ; set ADSR
#_0C9355: #_KICHIJOI_7826: db $F1, $09 ; set SRCN
#_0C9357: #_KICHIJOI_7828: db $F2, $50 ; set panning
#_0C9359: #_KICHIJOI_782A: db $8C ; dur 0x0C

KICHIJOI_SEGMENT_782B:
#_0C935A: #_KICHIJOI_782B: db $18 ; play note C4
#_0C935B: #_KICHIJOI_782C: db $31 ; tie
#_0C935C: #_KICHIJOI_782D: db $31 ; tie
#_0C935D: #_KICHIJOI_782E: db $31 ; tie
#_0C935E: #_KICHIJOI_782F: db $17 ; play note B3
#_0C935F: #_KICHIJOI_7830: db $31 ; tie
#_0C9360: #_KICHIJOI_7831: db $31 ; tie
#_0C9361: #_KICHIJOI_7832: db $31 ; tie
#_0C9362: #_KICHIJOI_7833: db $16 ; play note As3
#_0C9363: #_KICHIJOI_7834: db $31 ; tie
#_0C9364: #_KICHIJOI_7835: db $31 ; tie
#_0C9365: #_KICHIJOI_7836: db $31 ; tie
#_0C9366: #_KICHIJOI_7837: db $17 ; play note B3
#_0C9367: #_KICHIJOI_7838: db $31 ; tie
#_0C9368: #_KICHIJOI_7839: db $31 ; tie
#_0C9369: #_KICHIJOI_783A: db $31 ; tie
#_0C936A: #_KICHIJOI_783B: db $F8 : dw KICHIJOI_SEGMENT_782B ; goto location

KICHIJOI_SEGMENT_783E:
#_0C936D: #_KICHIJOI_783E: db $70 ; vol 0x10
#_0C936E: #_KICHIJOI_783F: db $F0, $FE, $EB ; set ADSR
#_0C9371: #_KICHIJOI_7842: db $F1, $09 ; set SRCN
#_0C9373: #_KICHIJOI_7844: db $F2, $50 ; set panning
#_0C9375: #_KICHIJOI_7846: db $8C ; dur 0x0C

KICHIJOI_SEGMENT_7847:
#_0C9376: #_KICHIJOI_7847: db $15 ; play note A3
#_0C9377: #_KICHIJOI_7848: db $31 ; tie
#_0C9378: #_KICHIJOI_7849: db $31 ; tie
#_0C9379: #_KICHIJOI_784A: db $31 ; tie
#_0C937A: #_KICHIJOI_784B: db $14 ; play note Gs3
#_0C937B: #_KICHIJOI_784C: db $31 ; tie
#_0C937C: #_KICHIJOI_784D: db $31 ; tie
#_0C937D: #_KICHIJOI_784E: db $31 ; tie
#_0C937E: #_KICHIJOI_784F: db $11 ; play note F3
#_0C937F: #_KICHIJOI_7850: db $31 ; tie
#_0C9380: #_KICHIJOI_7851: db $31 ; tie
#_0C9381: #_KICHIJOI_7852: db $31 ; tie
#_0C9382: #_KICHIJOI_7853: db $11 ; play note F3
#_0C9383: #_KICHIJOI_7854: db $31 ; tie
#_0C9384: #_KICHIJOI_7855: db $31 ; tie
#_0C9385: #_KICHIJOI_7856: db $31 ; tie
#_0C9386: #_KICHIJOI_7857: db $F8 : dw KICHIJOI_SEGMENT_7847 ; goto location
#_0C9389: #_KICHIJOI_785A: db $FF ; end track

KICHIJOI_SEGMENT_785B:
#_0C938A: #_KICHIJOI_785B: db $70 ; vol 0x10
#_0C938B: #_KICHIJOI_785C: db $F0, $FE, $EB ; set ADSR
#_0C938E: #_KICHIJOI_785F: db $F1, $09 ; set SRCN
#_0C9390: #_KICHIJOI_7861: db $F2, $50 ; set panning
#_0C9392: #_KICHIJOI_7863: db $8C ; dur 0x0C

KICHIJOI_SEGMENT_7864:
#_0C9393: #_KICHIJOI_7864: db $11 ; play note F3
#_0C9394: #_KICHIJOI_7865: db $31 ; tie
#_0C9395: #_KICHIJOI_7866: db $31 ; tie
#_0C9396: #_KICHIJOI_7867: db $31 ; tie
#_0C9397: #_KICHIJOI_7868: db $11 ; play note F3
#_0C9398: #_KICHIJOI_7869: db $31 ; tie
#_0C9399: #_KICHIJOI_786A: db $31 ; tie
#_0C939A: #_KICHIJOI_786B: db $31 ; tie
#_0C939B: #_KICHIJOI_786C: db $0E ; play note D3
#_0C939C: #_KICHIJOI_786D: db $31 ; tie
#_0C939D: #_KICHIJOI_786E: db $31 ; tie
#_0C939E: #_KICHIJOI_786F: db $31 ; tie
#_0C939F: #_KICHIJOI_7870: db $0E ; play note D3
#_0C93A0: #_KICHIJOI_7871: db $31 ; tie
#_0C93A1: #_KICHIJOI_7872: db $31 ; tie
#_0C93A2: #_KICHIJOI_7873: db $31 ; tie
#_0C93A3: #_KICHIJOI_7874: db $F8 : dw KICHIJOI_SEGMENT_7864 ; goto location
#_0C93A6: #_KICHIJOI_7877: db $FF ; end track

KICHIJOI_SEGMENT_7878:
#_0C93A7: #_KICHIJOI_7878: db $70 ; vol 0x10
#_0C93A8: #_KICHIJOI_7879: db $F0, $FF, $FE ; set ADSR

KICHIJOI_SEGMENT_787C:
#_0C93AB: #_KICHIJOI_787C: db $86 ; dur 0x06
#_0C93AC: #_KICHIJOI_787D: db $F4, $06 ; set loop point B
#_0C93AE: #_KICHIJOI_787F: db $F2, $79 ; set panning
#_0C93B0: #_KICHIJOI_7881: db $5E ; Noise 0x1E
#_0C93B1: #_KICHIJOI_7882: db $F2, $7B ; set panning
#_0C93B3: #_KICHIJOI_7884: db $5E ; Noise 0x1E
#_0C93B4: #_KICHIJOI_7885: db $F5 ; run loop B
#_0C93B5: #_KICHIJOI_7886: db $F2, $79 ; set panning
#_0C93B7: #_KICHIJOI_7888: db $5E ; Noise 0x1E
#_0C93B8: #_KICHIJOI_7889: db $F0, $FF, $EE ; set ADSR
#_0C93BB: #_KICHIJOI_788C: db $F2, $7C ; set panning
#_0C93BD: #_KICHIJOI_788E: db $5E ; Noise 0x1E
#_0C93BE: #_KICHIJOI_788F: db $F0, $FF, $FE ; set ADSR
#_0C93C1: #_KICHIJOI_7892: db $F4, $05 ; set loop point B
#_0C93C3: #_KICHIJOI_7894: db $F2, $79 ; set panning
#_0C93C5: #_KICHIJOI_7896: db $5E ; Noise 0x1E
#_0C93C6: #_KICHIJOI_7897: db $F2, $7B ; set panning
#_0C93C8: #_KICHIJOI_7899: db $5E ; Noise 0x1E
#_0C93C9: #_KICHIJOI_789A: db $F5 ; run loop B
#_0C93CA: #_KICHIJOI_789B: db $F4, $02 ; set loop point B
#_0C93CC: #_KICHIJOI_789D: db $F2, $79 ; set panning
#_0C93CE: #_KICHIJOI_789F: db $85 ; dur 0x05
#_0C93CF: #_KICHIJOI_78A0: db $5E ; Noise 0x1E
#_0C93D0: #_KICHIJOI_78A1: db $F2, $7C ; set panning
#_0C93D2: #_KICHIJOI_78A3: db $94 ; dur 0x14
#_0C93D3: #_KICHIJOI_78A4: db $5E ; Noise 0x1E
#_0C93D4: #_KICHIJOI_78A5: db $5E ; Noise 0x1E
#_0C93D5: #_KICHIJOI_78A6: db $F5 ; run loop B
#_0C93D6: #_KICHIJOI_78A7: db $F4, $02 ; set loop point B
#_0C93D8: #_KICHIJOI_78A9: db $86 ; dur 0x06
#_0C93D9: #_KICHIJOI_78AA: db $F2, $79 ; set panning
#_0C93DB: #_KICHIJOI_78AC: db $5E ; Noise 0x1E
#_0C93DC: #_KICHIJOI_78AD: db $F0, $FF, $EE ; set ADSR
#_0C93DF: #_KICHIJOI_78B0: db $F2, $7C ; set panning
#_0C93E1: #_KICHIJOI_78B2: db $5E ; Noise 0x1E
#_0C93E2: #_KICHIJOI_78B3: db $F0, $FF, $FE ; set ADSR
#_0C93E5: #_KICHIJOI_78B6: db $F5 ; run loop B
#_0C93E6: #_KICHIJOI_78B7: db $F8 : dw KICHIJOI_SEGMENT_787C ; goto location
#_0C93E9: #_KICHIJOI_78BA: db $FF ; end track

KICHIJOI_SEGMENT_78BB:
#_0C93EA: #_KICHIJOI_78BB: db $F1, $08 ; set SRCN
#_0C93EC: #_KICHIJOI_78BD: db $F8 : dw KICHIJOI_SEGMENT_78C4 ; goto location

KICHIJOI_SEGMENT_78C0:
#_0C93EF: #_KICHIJOI_78C0: db $F1, $02 ; set SRCN
#_0C93F1: #_KICHIJOI_78C2: db $F3, $0C ; transpose +12

KICHIJOI_SEGMENT_78C4:
#_0C93F3: #_KICHIJOI_78C4: db $70 ; vol 0x10
#_0C93F4: #_KICHIJOI_78C5: db $F0, $FF, $F2 ; set ADSR
#_0C93F7: #_KICHIJOI_78C8: db $F2, $50 ; set panning

KICHIJOI_SEGMENT_78CA:
#_0C93F9: #_KICHIJOI_78CA: db $F4, $03 ; set loop point B
#_0C93FB: #_KICHIJOI_78CC: db $88 ; dur 0x08
#_0C93FC: #_KICHIJOI_78CD: db $0E ; play note D3
#_0C93FD: #_KICHIJOI_78CE: db $0E ; play note D3
#_0C93FE: #_KICHIJOI_78CF: db $11 ; play note F3
#_0C93FF: #_KICHIJOI_78D0: db $84 ; dur 0x04
#_0C9400: #_KICHIJOI_78D1: db $0E ; play note D3
#_0C9401: #_KICHIJOI_78D2: db $30 ; rest
#_0C9402: #_KICHIJOI_78D3: db $0E ; play note D3
#_0C9403: #_KICHIJOI_78D4: db $31 ; tie
#_0C9404: #_KICHIJOI_78D5: db $8C ; dur 0x0C
#_0C9405: #_KICHIJOI_78D6: db $30 ; rest
#_0C9406: #_KICHIJOI_78D7: db $F5 ; run loop B
#_0C9407: #_KICHIJOI_78D8: db $88 ; dur 0x08
#_0C9408: #_KICHIJOI_78D9: db $0E ; play note D3
#_0C9409: #_KICHIJOI_78DA: db $0E ; play note D3
#_0C940A: #_KICHIJOI_78DB: db $11 ; play note F3
#_0C940B: #_KICHIJOI_78DC: db $84 ; dur 0x04
#_0C940C: #_KICHIJOI_78DD: db $0E ; play note D3
#_0C940D: #_KICHIJOI_78DE: db $30 ; rest
#_0C940E: #_KICHIJOI_78DF: db $0E ; play note D3
#_0C940F: #_KICHIJOI_78E0: db $31 ; tie
#_0C9410: #_KICHIJOI_78E1: db $86 ; dur 0x06
#_0C9411: #_KICHIJOI_78E2: db $30 ; rest
#_0C9412: #_KICHIJOI_78E3: db $14 ; play note Gs3
#_0C9413: #_KICHIJOI_78E4: db $15 ; play note A3
#_0C9414: #_KICHIJOI_78E5: db $13 ; play note G3
#_0C9415: #_KICHIJOI_78E6: db $11 ; play note F3
#_0C9416: #_KICHIJOI_78E7: db $13 ; play note G3
#_0C9417: #_KICHIJOI_78E8: db $11 ; play note F3
#_0C9418: #_KICHIJOI_78E9: db $10 ; play note E3
#_0C9419: #_KICHIJOI_78EA: db $F8 : dw KICHIJOI_SEGMENT_78CA ; goto location
#_0C941C: #_KICHIJOI_78ED: db $FF ; end track

KICHIJOI_SEGMENT_78EE:
#_0C941D: #_KICHIJOI_78EE: db $70 ; vol 0x10
#_0C941E: #_KICHIJOI_78EF: db $F0, $FF, $E0 ; set ADSR
#_0C9421: #_KICHIJOI_78F2: db $F2, $44 ; set panning

KICHIJOI_SEGMENT_78F4:
#_0C9423: #_KICHIJOI_78F4: db $F4, $07 ; set loop point B
#_0C9425: #_KICHIJOI_78F6: db $F1, $00 ; set SRCN
#_0C9427: #_KICHIJOI_78F8: db $88 ; dur 0x08
#_0C9428: #_KICHIJOI_78F9: db $18 ; play note C4
#_0C9429: #_KICHIJOI_78FA: db $18 ; play note C4
#_0C942A: #_KICHIJOI_78FB: db $F1, $01 ; set SRCN
#_0C942C: #_KICHIJOI_78FD: db $18 ; play note C4
#_0C942D: #_KICHIJOI_78FE: db $F1, $00 ; set SRCN
#_0C942F: #_KICHIJOI_7900: db $86 ; dur 0x06
#_0C9430: #_KICHIJOI_7901: db $18 ; play note C4
#_0C9431: #_KICHIJOI_7902: db $18 ; play note C4
#_0C9432: #_KICHIJOI_7903: db $8A ; dur 0x0A
#_0C9433: #_KICHIJOI_7904: db $30 ; rest
#_0C9434: #_KICHIJOI_7905: db $F1, $01 ; set SRCN
#_0C9436: #_KICHIJOI_7907: db $18 ; play note C4
#_0C9437: #_KICHIJOI_7908: db $F5 ; run loop B
#_0C9438: #_KICHIJOI_7909: db $F1, $00 ; set SRCN
#_0C943A: #_KICHIJOI_790B: db $88 ; dur 0x08
#_0C943B: #_KICHIJOI_790C: db $18 ; play note C4
#_0C943C: #_KICHIJOI_790D: db $18 ; play note C4
#_0C943D: #_KICHIJOI_790E: db $F1, $01 ; set SRCN
#_0C943F: #_KICHIJOI_7910: db $18 ; play note C4
#_0C9440: #_KICHIJOI_7911: db $F1, $00 ; set SRCN
#_0C9442: #_KICHIJOI_7913: db $86 ; dur 0x06
#_0C9443: #_KICHIJOI_7914: db $18 ; play note C4
#_0C9444: #_KICHIJOI_7915: db $18 ; play note C4
#_0C9445: #_KICHIJOI_7916: db $18 ; play note C4
#_0C9446: #_KICHIJOI_7917: db $F1, $01 ; set SRCN
#_0C9448: #_KICHIJOI_7919: db $18 ; play note C4
#_0C9449: #_KICHIJOI_791A: db $18 ; play note C4
#_0C944A: #_KICHIJOI_791B: db $F1, $00 ; set SRCN
#_0C944C: #_KICHIJOI_791D: db $18 ; play note C4
#_0C944D: #_KICHIJOI_791E: db $F1, $01 ; set SRCN
#_0C944F: #_KICHIJOI_7920: db $18 ; play note C4
#_0C9450: #_KICHIJOI_7921: db $F1, $00 ; set SRCN
#_0C9452: #_KICHIJOI_7923: db $18 ; play note C4
#_0C9453: #_KICHIJOI_7924: db $F1, $01 ; set SRCN
#_0C9455: #_KICHIJOI_7926: db $18 ; play note C4
#_0C9456: #_KICHIJOI_7927: db $F1, $00 ; set SRCN
#_0C9458: #_KICHIJOI_7929: db $18 ; play note C4
#_0C9459: #_KICHIJOI_792A: db $F8 : dw KICHIJOI_SEGMENT_78F4 ; goto location
#_0C945C: #_KICHIJOI_792D: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Ruins_SPC_Data:
#_0C945D: dw $06DE, $0000

SONG_RUINS:
#_0C9461: #_RUINS_7800: db $F1, $04 ; Set control
#_0C9463: #_RUINS_7802: db $00 : dw RUINS_SEGMENT_7853 ; Music channel 0
#_0C9466: #_RUINS_7805: db $01 : dw RUINS_SEGMENT_7934 ; Music channel 1
#_0C9469: #_RUINS_7808: db $02 : dw RUINS_SEGMENT_7A8E ; Music channel 2
#_0C946C: #_RUINS_780B: db $03 : dw RUINS_SEGMENT_7BE8 ; Music channel 3
#_0C946F: #_RUINS_780E: db $04 : dw RUINS_SEGMENT_7D38 ; Music channel 4
#_0C9472: #_RUINS_7811: db $05 : dw RUINS_SEGMENT_781B ; Music channel 5
#_0C9475: #_RUINS_7814: db $06 : dw RUINS_SEGMENT_7E17 ; Music channel 6
#_0C9478: #_RUINS_7817: db $07 : dw RUINS_SEGMENT_7EC7 ; Music channel 7
#_0C947B: #_RUINS_781A: db $FF ; end of header

RUINS_SEGMENT_781B:
#_0C947C: #_RUINS_781B: db $97 ; dur 0x17
#_0C947D: #_RUINS_781C: db $30 ; rest
#_0C947E: #_RUINS_781D: db $F2, $6C ; set panning
#_0C9480: #_RUINS_781F: db $F0, $F9, $E8 ; set ADSR
#_0C9483: #_RUINS_7822: db $F9, $20 ; set fine tuning
#_0C9485: #_RUINS_7824: db $F6 : dw RUINS_SEGMENT_7883 ; subroutine B

RUINS_SEGMENT_7827:
#_0C9488: #_RUINS_7827: db $F0, $FA, $EC ; set ADSR
#_0C948B: #_RUINS_782A: db $F6 : dw RUINS_SEGMENT_78D0 ; subroutine B
#_0C948E: #_RUINS_782D: db $F9, $30 ; set fine tuning
#_0C9490: #_RUINS_782F: db $F0, $F9, $E8 ; set ADSR
#_0C9493: #_RUINS_7832: db $F1, $09 ; set SRCN
#_0C9495: #_RUINS_7834: db $89 ; dur 0x09
#_0C9496: #_RUINS_7835: db $28 ; play note E5
#_0C9497: #_RUINS_7836: db $E3, $E0 ; pitch bend on
#_0C9499: #_RUINS_7838: db $E2 ; pitch bend off
#_0C949A: #_RUINS_7839: db $31 ; tie
#_0C949B: #_RUINS_783A: db $88 ; dur 0x08
#_0C949C: #_RUINS_783B: db $24 ; play note C5
#_0C949D: #_RUINS_783C: db $86 ; dur 0x06
#_0C949E: #_RUINS_783D: db $2B ; play note G5
#_0C949F: #_RUINS_783E: db $30 ; rest
#_0C94A0: #_RUINS_783F: db $8C ; dur 0x0C
#_0C94A1: #_RUINS_7840: db $2B ; play note G5
#_0C94A2: #_RUINS_7841: db $88 ; dur 0x08
#_0C94A3: #_RUINS_7842: db $31 ; tie
#_0C94A4: #_RUINS_7843: db $8C ; dur 0x0C
#_0C94A5: #_RUINS_7844: db $31 ; tie
#_0C94A6: #_RUINS_7845: db $86 ; dur 0x06
#_0C94A7: #_RUINS_7846: db $29 ; play note F5
#_0C94A8: #_RUINS_7847: db $28 ; play note E5
#_0C94A9: #_RUINS_7848: db $F9, $20 ; set fine tuning
#_0C94AB: #_RUINS_784A: db $F6 : dw RUINS_SEGMENT_7911 ; subroutine B
#_0C94AE: #_RUINS_784D: db $F6 : dw RUINS_SEGMENT_7888 ; subroutine B
#_0C94B1: #_RUINS_7850: db $F8 : dw RUINS_SEGMENT_7827 ; goto location

RUINS_SEGMENT_7853:
#_0C94B4: #_RUINS_7853: db $F0, $FC, $E8 ; set ADSR
#_0C94B7: #_RUINS_7856: db $F2, $60 ; set panning
#_0C94B9: #_RUINS_7858: db $F6 : dw RUINS_SEGMENT_7883 ; subroutine B

RUINS_SEGMENT_785B:
#_0C94BC: #_RUINS_785B: db $F0, $FE, $EC ; set ADSR
#_0C94BF: #_RUINS_785E: db $F6 : dw RUINS_SEGMENT_78D0 ; subroutine B
#_0C94C2: #_RUINS_7861: db $F0, $FC, $E8 ; set ADSR
#_0C94C5: #_RUINS_7864: db $F1, $09 ; set SRCN
#_0C94C7: #_RUINS_7866: db $89 ; dur 0x09
#_0C94C8: #_RUINS_7867: db $28 ; play note E5
#_0C94C9: #_RUINS_7868: db $E3, $E0 ; pitch bend on
#_0C94CB: #_RUINS_786A: db $E2 ; pitch bend off
#_0C94CC: #_RUINS_786B: db $31 ; tie
#_0C94CD: #_RUINS_786C: db $88 ; dur 0x08
#_0C94CE: #_RUINS_786D: db $24 ; play note C5
#_0C94CF: #_RUINS_786E: db $86 ; dur 0x06
#_0C94D0: #_RUINS_786F: db $2B ; play note G5
#_0C94D1: #_RUINS_7870: db $30 ; rest
#_0C94D2: #_RUINS_7871: db $8C ; dur 0x0C
#_0C94D3: #_RUINS_7872: db $2B ; play note G5
#_0C94D4: #_RUINS_7873: db $88 ; dur 0x08
#_0C94D5: #_RUINS_7874: db $31 ; tie
#_0C94D6: #_RUINS_7875: db $8C ; dur 0x0C
#_0C94D7: #_RUINS_7876: db $31 ; tie
#_0C94D8: #_RUINS_7877: db $86 ; dur 0x06
#_0C94D9: #_RUINS_7878: db $29 ; play note F5
#_0C94DA: #_RUINS_7879: db $28 ; play note E5
#_0C94DB: #_RUINS_787A: db $F6 : dw RUINS_SEGMENT_7911 ; subroutine B
#_0C94DE: #_RUINS_787D: db $F6 : dw RUINS_SEGMENT_7888 ; subroutine B
#_0C94E1: #_RUINS_7880: db $F8 : dw RUINS_SEGMENT_785B ; goto location

RUINS_SEGMENT_7883:
#_0C94E4: #_RUINS_7883: db $70 ; vol 0x10
#_0C94E5: #_RUINS_7884: db $F1, $09 ; set SRCN
#_0C94E7: #_RUINS_7886: db $FB, $10 ; set note length page

RUINS_SEGMENT_7888:
#_0C94E9: #_RUINS_7888: db $8B ; dur 0x0B
#_0C94EA: #_RUINS_7889: db $1A ; play note D4
#_0C94EB: #_RUINS_788A: db $88 ; dur 0x08
#_0C94EC: #_RUINS_788B: db $21 ; play note A4
#_0C94ED: #_RUINS_788C: db $24 ; play note C5
#_0C94EE: #_RUINS_788D: db $8B ; dur 0x0B
#_0C94EF: #_RUINS_788E: db $23 ; play note B4
#_0C94F0: #_RUINS_788F: db $88 ; dur 0x08
#_0C94F1: #_RUINS_7890: db $1F ; play note G4
#_0C94F2: #_RUINS_7891: db $1D ; play note F4
#_0C94F3: #_RUINS_7892: db $8B ; dur 0x0B
#_0C94F4: #_RUINS_7893: db $1A ; play note D4
#_0C94F5: #_RUINS_7894: db $88 ; dur 0x08
#_0C94F6: #_RUINS_7895: db $21 ; play note A4
#_0C94F7: #_RUINS_7896: db $24 ; play note C5
#_0C94F8: #_RUINS_7897: db $8B ; dur 0x0B
#_0C94F9: #_RUINS_7898: db $26 ; play note D5
#_0C94FA: #_RUINS_7899: db $88 ; dur 0x08
#_0C94FB: #_RUINS_789A: db $23 ; play note B4
#_0C94FC: #_RUINS_789B: db $1F ; play note G4
#_0C94FD: #_RUINS_789C: db $8B ; dur 0x0B
#_0C94FE: #_RUINS_789D: db $1A ; play note D4
#_0C94FF: #_RUINS_789E: db $88 ; dur 0x08
#_0C9500: #_RUINS_789F: db $21 ; play note A4
#_0C9501: #_RUINS_78A0: db $24 ; play note C5
#_0C9502: #_RUINS_78A1: db $8B ; dur 0x0B
#_0C9503: #_RUINS_78A2: db $23 ; play note B4
#_0C9504: #_RUINS_78A3: db $88 ; dur 0x08
#_0C9505: #_RUINS_78A4: db $24 ; play note C5
#_0C9506: #_RUINS_78A5: db $26 ; play note D5
#_0C9507: #_RUINS_78A6: db $8D ; dur 0x0D
#_0C9508: #_RUINS_78A7: db $21 ; play note A4
#_0C9509: #_RUINS_78A8: db $8C ; dur 0x0C
#_0C950A: #_RUINS_78A9: db $31 ; tie
#_0C950B: #_RUINS_78AA: db $8B ; dur 0x0B
#_0C950C: #_RUINS_78AB: db $1A ; play note D4
#_0C950D: #_RUINS_78AC: db $88 ; dur 0x08
#_0C950E: #_RUINS_78AD: db $21 ; play note A4
#_0C950F: #_RUINS_78AE: db $24 ; play note C5
#_0C9510: #_RUINS_78AF: db $8B ; dur 0x0B
#_0C9511: #_RUINS_78B0: db $26 ; play note D5
#_0C9512: #_RUINS_78B1: db $88 ; dur 0x08
#_0C9513: #_RUINS_78B2: db $23 ; play note B4
#_0C9514: #_RUINS_78B3: db $1F ; play note G4
#_0C9515: #_RUINS_78B4: db $24 ; play note C5
#_0C9516: #_RUINS_78B5: db $21 ; play note A4
#_0C9517: #_RUINS_78B6: db $1D ; play note F4
#_0C9518: #_RUINS_78B7: db $1F ; play note G4
#_0C9519: #_RUINS_78B8: db $21 ; play note A4
#_0C951A: #_RUINS_78B9: db $8B ; dur 0x0B
#_0C951B: #_RUINS_78BA: db $23 ; play note B4
#_0C951C: #_RUINS_78BB: db $8A ; dur 0x0A
#_0C951D: #_RUINS_78BC: db $1F ; play note G4
#_0C951E: #_RUINS_78BD: db $8B ; dur 0x0B
#_0C951F: #_RUINS_78BE: db $1D ; play note F4
#_0C9520: #_RUINS_78BF: db $88 ; dur 0x08
#_0C9521: #_RUINS_78C0: db $1F ; play note G4
#_0C9522: #_RUINS_78C1: db $21 ; play note A4
#_0C9523: #_RUINS_78C2: db $8B ; dur 0x0B
#_0C9524: #_RUINS_78C3: db $23 ; play note B4
#_0C9525: #_RUINS_78C4: db $88 ; dur 0x08
#_0C9526: #_RUINS_78C5: db $1F ; play note G4
#_0C9527: #_RUINS_78C6: db $26 ; play note D5
#_0C9528: #_RUINS_78C7: db $86 ; dur 0x06
#_0C9529: #_RUINS_78C8: db $24 ; play note C5
#_0C952A: #_RUINS_78C9: db $23 ; play note B4
#_0C952B: #_RUINS_78CA: db $8C ; dur 0x0C
#_0C952C: #_RUINS_78CB: db $21 ; play note A4
#_0C952D: #_RUINS_78CC: db $31 ; tie
#_0C952E: #_RUINS_78CD: db $88 ; dur 0x08
#_0C952F: #_RUINS_78CE: db $31 ; tie
#_0C9530: #_RUINS_78CF: db $F7 ; return from routine B

RUINS_SEGMENT_78D0:
#_0C9531: #_RUINS_78D0: db $F1, $06 ; set SRCN
#_0C9533: #_RUINS_78D2: db $88 ; dur 0x08
#_0C9534: #_RUINS_78D3: db $1A ; play note D4
#_0C9535: #_RUINS_78D4: db $1C ; play note E4
#_0C9536: #_RUINS_78D5: db $1D ; play note F4
#_0C9537: #_RUINS_78D6: db $1F ; play note G4
#_0C9538: #_RUINS_78D7: db $21 ; play note A4
#_0C9539: #_RUINS_78D8: db $8B ; dur 0x0B
#_0C953A: #_RUINS_78D9: db $23 ; play note B4
#_0C953B: #_RUINS_78DA: db $88 ; dur 0x08
#_0C953C: #_RUINS_78DB: db $1F ; play note G4
#_0C953D: #_RUINS_78DC: db $26 ; play note D5
#_0C953E: #_RUINS_78DD: db $86 ; dur 0x06
#_0C953F: #_RUINS_78DE: db $24 ; play note C5
#_0C9540: #_RUINS_78DF: db $23 ; play note B4
#_0C9541: #_RUINS_78E0: db $8C ; dur 0x0C
#_0C9542: #_RUINS_78E1: db $21 ; play note A4
#_0C9543: #_RUINS_78E2: db $8B ; dur 0x0B
#_0C9544: #_RUINS_78E3: db $23 ; play note B4
#_0C9545: #_RUINS_78E4: db $8A ; dur 0x0A
#_0C9546: #_RUINS_78E5: db $1F ; play note G4
#_0C9547: #_RUINS_78E6: db $86 ; dur 0x06
#_0C9548: #_RUINS_78E7: db $1D ; play note F4
#_0C9549: #_RUINS_78E8: db $1F ; play note G4
#_0C954A: #_RUINS_78E9: db $21 ; play note A4
#_0C954B: #_RUINS_78EA: db $1F ; play note G4
#_0C954C: #_RUINS_78EB: db $1D ; play note F4
#_0C954D: #_RUINS_78EC: db $1C ; play note E4
#_0C954E: #_RUINS_78ED: db $1A ; play note D4
#_0C954F: #_RUINS_78EE: db $18 ; play note C4
#_0C9550: #_RUINS_78EF: db $1C ; play note E4
#_0C9551: #_RUINS_78F0: db $1A ; play note D4
#_0C9552: #_RUINS_78F1: db $1C ; play note E4
#_0C9553: #_RUINS_78F2: db $1D ; play note F4
#_0C9554: #_RUINS_78F3: db $1F ; play note G4
#_0C9555: #_RUINS_78F4: db $21 ; play note A4
#_0C9556: #_RUINS_78F5: db $89 ; dur 0x09
#_0C9557: #_RUINS_78F6: db $1F ; play note G4
#_0C9558: #_RUINS_78F7: db $E3, $E8 ; pitch bend on
#_0C955A: #_RUINS_78F9: db $31 ; tie
#_0C955B: #_RUINS_78FA: db $E2 ; pitch bend off
#_0C955C: #_RUINS_78FB: db $86 ; dur 0x06
#_0C955D: #_RUINS_78FC: db $1A ; play note D4
#_0C955E: #_RUINS_78FD: db $1C ; play note E4
#_0C955F: #_RUINS_78FE: db $1D ; play note F4
#_0C9560: #_RUINS_78FF: db $1F ; play note G4
#_0C9561: #_RUINS_7900: db $21 ; play note A4
#_0C9562: #_RUINS_7901: db $1F ; play note G4
#_0C9563: #_RUINS_7902: db $23 ; play note B4
#_0C9564: #_RUINS_7903: db $21 ; play note A4
#_0C9565: #_RUINS_7904: db $24 ; play note C5
#_0C9566: #_RUINS_7905: db $23 ; play note B4
#_0C9567: #_RUINS_7906: db $1F ; play note G4
#_0C9568: #_RUINS_7907: db $21 ; play note A4
#_0C9569: #_RUINS_7908: db $23 ; play note B4
#_0C956A: #_RUINS_7909: db $24 ; play note C5
#_0C956B: #_RUINS_790A: db $26 ; play note D5
#_0C956C: #_RUINS_790B: db $24 ; play note C5
#_0C956D: #_RUINS_790C: db $26 ; play note D5
#_0C956E: #_RUINS_790D: db $28 ; play note E5
#_0C956F: #_RUINS_790E: db $29 ; play note F5
#_0C9570: #_RUINS_790F: db $2B ; play note G5
#_0C9571: #_RUINS_7910: db $F7 ; return from routine B

RUINS_SEGMENT_7911:
#_0C9572: #_RUINS_7911: db $8C ; dur 0x0C
#_0C9573: #_RUINS_7912: db $23 ; play note B4
#_0C9574: #_RUINS_7913: db $88 ; dur 0x08
#_0C9575: #_RUINS_7914: db $31 ; tie
#_0C9576: #_RUINS_7915: db $86 ; dur 0x06
#_0C9577: #_RUINS_7916: db $1D ; play note F4
#_0C9578: #_RUINS_7917: db $1F ; play note G4
#_0C9579: #_RUINS_7918: db $21 ; play note A4
#_0C957A: #_RUINS_7919: db $1F ; play note G4
#_0C957B: #_RUINS_791A: db $23 ; play note B4
#_0C957C: #_RUINS_791B: db $21 ; play note A4
#_0C957D: #_RUINS_791C: db $24 ; play note C5
#_0C957E: #_RUINS_791D: db $23 ; play note B4
#_0C957F: #_RUINS_791E: db $21 ; play note A4
#_0C9580: #_RUINS_791F: db $23 ; play note B4
#_0C9581: #_RUINS_7920: db $1C ; play note E4
#_0C9582: #_RUINS_7921: db $1F ; play note G4
#_0C9583: #_RUINS_7922: db $23 ; play note B4
#_0C9584: #_RUINS_7923: db $26 ; play note D5
#_0C9585: #_RUINS_7924: db $23 ; play note B4
#_0C9586: #_RUINS_7925: db $1F ; play note G4
#_0C9587: #_RUINS_7926: db $23 ; play note B4
#_0C9588: #_RUINS_7927: db $1F ; play note G4
#_0C9589: #_RUINS_7928: db $26 ; play note D5
#_0C958A: #_RUINS_7929: db $31 ; tie
#_0C958B: #_RUINS_792A: db $8B ; dur 0x0B
#_0C958C: #_RUINS_792B: db $24 ; play note C5
#_0C958D: #_RUINS_792C: db $88 ; dur 0x08
#_0C958E: #_RUINS_792D: db $23 ; play note B4
#_0C958F: #_RUINS_792E: db $24 ; play note C5
#_0C9590: #_RUINS_792F: db $8C ; dur 0x0C
#_0C9591: #_RUINS_7930: db $20 ; play note Gs4
#_0C9592: #_RUINS_7931: db $88 ; dur 0x08
#_0C9593: #_RUINS_7932: db $31 ; tie
#_0C9594: #_RUINS_7933: db $F7 ; return from routine B

RUINS_SEGMENT_7934:
#_0C9595: #_RUINS_7934: db $70 ; vol 0x10
#_0C9596: #_RUINS_7935: db $F0, $FF, $F0 ; set ADSR
#_0C9599: #_RUINS_7938: db $F1, $08 ; set SRCN
#_0C959B: #_RUINS_793A: db $F2, $68 ; set panning
#_0C959D: #_RUINS_793C: db $F3, $01 ; transpose +1
#_0C959F: #_RUINS_793E: db $FB, $10 ; set note length page

RUINS_SEGMENT_7940:
#_0C95A1: #_RUINS_7940: db $86 ; dur 0x06
#_0C95A2: #_RUINS_7941: db $1A ; play note D4
#_0C95A3: #_RUINS_7942: db $31 ; tie
#_0C95A4: #_RUINS_7943: db $31 ; tie
#_0C95A5: #_RUINS_7944: db $24 ; play note C5
#_0C95A6: #_RUINS_7945: db $31 ; tie
#_0C95A7: #_RUINS_7946: db $31 ; tie
#_0C95A8: #_RUINS_7947: db $21 ; play note A4
#_0C95A9: #_RUINS_7948: db $31 ; tie
#_0C95AA: #_RUINS_7949: db $31 ; tie
#_0C95AB: #_RUINS_794A: db $21 ; play note A4
#_0C95AC: #_RUINS_794B: db $31 ; tie
#_0C95AD: #_RUINS_794C: db $31 ; tie
#_0C95AE: #_RUINS_794D: db $1F ; play note G4
#_0C95AF: #_RUINS_794E: db $31 ; tie
#_0C95B0: #_RUINS_794F: db $31 ; tie
#_0C95B1: #_RUINS_7950: db $1C ; play note E4
#_0C95B2: #_RUINS_7951: db $31 ; tie
#_0C95B3: #_RUINS_7952: db $31 ; tie
#_0C95B4: #_RUINS_7953: db $23 ; play note B4
#_0C95B5: #_RUINS_7954: db $31 ; tie
#_0C95B6: #_RUINS_7955: db $31 ; tie
#_0C95B7: #_RUINS_7956: db $1D ; play note F4
#_0C95B8: #_RUINS_7957: db $31 ; tie
#_0C95B9: #_RUINS_7958: db $31 ; tie
#_0C95BA: #_RUINS_7959: db $21 ; play note A4
#_0C95BB: #_RUINS_795A: db $31 ; tie
#_0C95BC: #_RUINS_795B: db $31 ; tie
#_0C95BD: #_RUINS_795C: db $1D ; play note F4
#_0C95BE: #_RUINS_795D: db $31 ; tie
#_0C95BF: #_RUINS_795E: db $31 ; tie
#_0C95C0: #_RUINS_795F: db $1C ; play note E4
#_0C95C1: #_RUINS_7960: db $31 ; tie
#_0C95C2: #_RUINS_7961: db $31 ; tie
#_0C95C3: #_RUINS_7962: db $26 ; play note D5
#_0C95C4: #_RUINS_7963: db $31 ; tie
#_0C95C5: #_RUINS_7964: db $31 ; tie
#_0C95C6: #_RUINS_7965: db $23 ; play note B4
#_0C95C7: #_RUINS_7966: db $31 ; tie
#_0C95C8: #_RUINS_7967: db $31 ; tie
#_0C95C9: #_RUINS_7968: db $23 ; play note B4
#_0C95CA: #_RUINS_7969: db $31 ; tie
#_0C95CB: #_RUINS_796A: db $31 ; tie
#_0C95CC: #_RUINS_796B: db $21 ; play note A4
#_0C95CD: #_RUINS_796C: db $31 ; tie
#_0C95CE: #_RUINS_796D: db $31 ; tie
#_0C95CF: #_RUINS_796E: db $1D ; play note F4
#_0C95D0: #_RUINS_796F: db $31 ; tie
#_0C95D1: #_RUINS_7970: db $31 ; tie
#_0C95D2: #_RUINS_7971: db $24 ; play note C5
#_0C95D3: #_RUINS_7972: db $31 ; tie
#_0C95D4: #_RUINS_7973: db $31 ; tie
#_0C95D5: #_RUINS_7974: db $1C ; play note E4
#_0C95D6: #_RUINS_7975: db $31 ; tie
#_0C95D7: #_RUINS_7976: db $31 ; tie
#_0C95D8: #_RUINS_7977: db $1F ; play note G4
#_0C95D9: #_RUINS_7978: db $31 ; tie
#_0C95DA: #_RUINS_7979: db $31 ; tie
#_0C95DB: #_RUINS_797A: db $1C ; play note E4
#_0C95DC: #_RUINS_797B: db $31 ; tie
#_0C95DD: #_RUINS_797C: db $31 ; tie
#_0C95DE: #_RUINS_797D: db $1A ; play note D4
#_0C95DF: #_RUINS_797E: db $31 ; tie
#_0C95E0: #_RUINS_797F: db $31 ; tie
#_0C95E1: #_RUINS_7980: db $24 ; play note C5
#_0C95E2: #_RUINS_7981: db $31 ; tie
#_0C95E3: #_RUINS_7982: db $31 ; tie
#_0C95E4: #_RUINS_7983: db $21 ; play note A4
#_0C95E5: #_RUINS_7984: db $31 ; tie
#_0C95E6: #_RUINS_7985: db $31 ; tie
#_0C95E7: #_RUINS_7986: db $21 ; play note A4
#_0C95E8: #_RUINS_7987: db $31 ; tie
#_0C95E9: #_RUINS_7988: db $31 ; tie
#_0C95EA: #_RUINS_7989: db $23 ; play note B4
#_0C95EB: #_RUINS_798A: db $31 ; tie
#_0C95EC: #_RUINS_798B: db $31 ; tie
#_0C95ED: #_RUINS_798C: db $1F ; play note G4
#_0C95EE: #_RUINS_798D: db $31 ; tie
#_0C95EF: #_RUINS_798E: db $31 ; tie
#_0C95F0: #_RUINS_798F: db $26 ; play note D5
#_0C95F1: #_RUINS_7990: db $31 ; tie
#_0C95F2: #_RUINS_7991: db $31 ; tie
#_0C95F3: #_RUINS_7992: db $1D ; play note F4
#_0C95F4: #_RUINS_7993: db $31 ; tie
#_0C95F5: #_RUINS_7994: db $31 ; tie
#_0C95F6: #_RUINS_7995: db $21 ; play note A4
#_0C95F7: #_RUINS_7996: db $31 ; tie
#_0C95F8: #_RUINS_7997: db $31 ; tie
#_0C95F9: #_RUINS_7998: db $1D ; play note F4
#_0C95FA: #_RUINS_7999: db $31 ; tie
#_0C95FB: #_RUINS_799A: db $31 ; tie
#_0C95FC: #_RUINS_799B: db $18 ; play note C4
#_0C95FD: #_RUINS_799C: db $31 ; tie
#_0C95FE: #_RUINS_799D: db $31 ; tie
#_0C95FF: #_RUINS_799E: db $23 ; play note B4
#_0C9600: #_RUINS_799F: db $31 ; tie
#_0C9601: #_RUINS_79A0: db $31 ; tie
#_0C9602: #_RUINS_79A1: db $1F ; play note G4
#_0C9603: #_RUINS_79A2: db $31 ; tie
#_0C9604: #_RUINS_79A3: db $31 ; tie
#_0C9605: #_RUINS_79A4: db $1F ; play note G4
#_0C9606: #_RUINS_79A5: db $31 ; tie
#_0C9607: #_RUINS_79A6: db $31 ; tie
#_0C9608: #_RUINS_79A7: db $21 ; play note A4
#_0C9609: #_RUINS_79A8: db $31 ; tie
#_0C960A: #_RUINS_79A9: db $31 ; tie
#_0C960B: #_RUINS_79AA: db $1D ; play note F4
#_0C960C: #_RUINS_79AB: db $31 ; tie
#_0C960D: #_RUINS_79AC: db $31 ; tie
#_0C960E: #_RUINS_79AD: db $24 ; play note C5
#_0C960F: #_RUINS_79AE: db $31 ; tie
#_0C9610: #_RUINS_79AF: db $31 ; tie
#_0C9611: #_RUINS_79B0: db $1F ; play note G4
#_0C9612: #_RUINS_79B1: db $31 ; tie
#_0C9613: #_RUINS_79B2: db $31 ; tie
#_0C9614: #_RUINS_79B3: db $23 ; play note B4
#_0C9615: #_RUINS_79B4: db $31 ; tie
#_0C9616: #_RUINS_79B5: db $31 ; tie
#_0C9617: #_RUINS_79B6: db $1F ; play note G4
#_0C9618: #_RUINS_79B7: db $31 ; tie
#_0C9619: #_RUINS_79B8: db $31 ; tie
#_0C961A: #_RUINS_79B9: db $1A ; play note D4
#_0C961B: #_RUINS_79BA: db $31 ; tie
#_0C961C: #_RUINS_79BB: db $31 ; tie
#_0C961D: #_RUINS_79BC: db $24 ; play note C5
#_0C961E: #_RUINS_79BD: db $31 ; tie
#_0C961F: #_RUINS_79BE: db $31 ; tie
#_0C9620: #_RUINS_79BF: db $21 ; play note A4
#_0C9621: #_RUINS_79C0: db $31 ; tie
#_0C9622: #_RUINS_79C1: db $31 ; tie
#_0C9623: #_RUINS_79C2: db $21 ; play note A4
#_0C9624: #_RUINS_79C3: db $31 ; tie
#_0C9625: #_RUINS_79C4: db $31 ; tie
#_0C9626: #_RUINS_79C5: db $1F ; play note G4
#_0C9627: #_RUINS_79C6: db $31 ; tie
#_0C9628: #_RUINS_79C7: db $31 ; tie
#_0C9629: #_RUINS_79C8: db $1C ; play note E4
#_0C962A: #_RUINS_79C9: db $31 ; tie
#_0C962B: #_RUINS_79CA: db $31 ; tie
#_0C962C: #_RUINS_79CB: db $23 ; play note B4
#_0C962D: #_RUINS_79CC: db $31 ; tie
#_0C962E: #_RUINS_79CD: db $31 ; tie
#_0C962F: #_RUINS_79CE: db $1D ; play note F4
#_0C9630: #_RUINS_79CF: db $31 ; tie
#_0C9631: #_RUINS_79D0: db $31 ; tie
#_0C9632: #_RUINS_79D1: db $21 ; play note A4
#_0C9633: #_RUINS_79D2: db $31 ; tie
#_0C9634: #_RUINS_79D3: db $31 ; tie
#_0C9635: #_RUINS_79D4: db $1D ; play note F4
#_0C9636: #_RUINS_79D5: db $31 ; tie
#_0C9637: #_RUINS_79D6: db $31 ; tie
#_0C9638: #_RUINS_79D7: db $1C ; play note E4
#_0C9639: #_RUINS_79D8: db $31 ; tie
#_0C963A: #_RUINS_79D9: db $31 ; tie
#_0C963B: #_RUINS_79DA: db $26 ; play note D5
#_0C963C: #_RUINS_79DB: db $31 ; tie
#_0C963D: #_RUINS_79DC: db $31 ; tie
#_0C963E: #_RUINS_79DD: db $23 ; play note B4
#_0C963F: #_RUINS_79DE: db $31 ; tie
#_0C9640: #_RUINS_79DF: db $31 ; tie
#_0C9641: #_RUINS_79E0: db $23 ; play note B4
#_0C9642: #_RUINS_79E1: db $31 ; tie
#_0C9643: #_RUINS_79E2: db $31 ; tie
#_0C9644: #_RUINS_79E3: db $21 ; play note A4
#_0C9645: #_RUINS_79E4: db $31 ; tie
#_0C9646: #_RUINS_79E5: db $31 ; tie
#_0C9647: #_RUINS_79E6: db $1D ; play note F4
#_0C9648: #_RUINS_79E7: db $31 ; tie
#_0C9649: #_RUINS_79E8: db $31 ; tie
#_0C964A: #_RUINS_79E9: db $24 ; play note C5
#_0C964B: #_RUINS_79EA: db $31 ; tie
#_0C964C: #_RUINS_79EB: db $31 ; tie
#_0C964D: #_RUINS_79EC: db $1F ; play note G4
#_0C964E: #_RUINS_79ED: db $31 ; tie
#_0C964F: #_RUINS_79EE: db $31 ; tie
#_0C9650: #_RUINS_79EF: db $23 ; play note B4
#_0C9651: #_RUINS_79F0: db $31 ; tie
#_0C9652: #_RUINS_79F1: db $31 ; tie
#_0C9653: #_RUINS_79F2: db $1F ; play note G4
#_0C9654: #_RUINS_79F3: db $31 ; tie
#_0C9655: #_RUINS_79F4: db $31 ; tie
#_0C9656: #_RUINS_79F5: db $1D ; play note F4
#_0C9657: #_RUINS_79F6: db $31 ; tie
#_0C9658: #_RUINS_79F7: db $31 ; tie
#_0C9659: #_RUINS_79F8: db $28 ; play note E5
#_0C965A: #_RUINS_79F9: db $31 ; tie
#_0C965B: #_RUINS_79FA: db $31 ; tie
#_0C965C: #_RUINS_79FB: db $24 ; play note C5
#_0C965D: #_RUINS_79FC: db $31 ; tie
#_0C965E: #_RUINS_79FD: db $31 ; tie
#_0C965F: #_RUINS_79FE: db $24 ; play note C5
#_0C9660: #_RUINS_79FF: db $31 ; tie
#_0C9661: #_RUINS_7A00: db $31 ; tie
#_0C9662: #_RUINS_7A01: db $23 ; play note B4
#_0C9663: #_RUINS_7A02: db $31 ; tie
#_0C9664: #_RUINS_7A03: db $31 ; tie
#_0C9665: #_RUINS_7A04: db $1F ; play note G4
#_0C9666: #_RUINS_7A05: db $31 ; tie
#_0C9667: #_RUINS_7A06: db $31 ; tie
#_0C9668: #_RUINS_7A07: db $26 ; play note D5
#_0C9669: #_RUINS_7A08: db $31 ; tie
#_0C966A: #_RUINS_7A09: db $31 ; tie
#_0C966B: #_RUINS_7A0A: db $1D ; play note F4
#_0C966C: #_RUINS_7A0B: db $31 ; tie
#_0C966D: #_RUINS_7A0C: db $31 ; tie
#_0C966E: #_RUINS_7A0D: db $21 ; play note A4
#_0C966F: #_RUINS_7A0E: db $31 ; tie
#_0C9670: #_RUINS_7A0F: db $31 ; tie
#_0C9671: #_RUINS_7A10: db $1D ; play note F4
#_0C9672: #_RUINS_7A11: db $31 ; tie
#_0C9673: #_RUINS_7A12: db $31 ; tie
#_0C9674: #_RUINS_7A13: db $1C ; play note E4
#_0C9675: #_RUINS_7A14: db $31 ; tie
#_0C9676: #_RUINS_7A15: db $31 ; tie
#_0C9677: #_RUINS_7A16: db $26 ; play note D5
#_0C9678: #_RUINS_7A17: db $31 ; tie
#_0C9679: #_RUINS_7A18: db $31 ; tie
#_0C967A: #_RUINS_7A19: db $23 ; play note B4
#_0C967B: #_RUINS_7A1A: db $31 ; tie
#_0C967C: #_RUINS_7A1B: db $31 ; tie
#_0C967D: #_RUINS_7A1C: db $23 ; play note B4
#_0C967E: #_RUINS_7A1D: db $31 ; tie
#_0C967F: #_RUINS_7A1E: db $31 ; tie
#_0C9680: #_RUINS_7A1F: db $24 ; play note C5
#_0C9681: #_RUINS_7A20: db $31 ; tie
#_0C9682: #_RUINS_7A21: db $31 ; tie
#_0C9683: #_RUINS_7A22: db $21 ; play note A4
#_0C9684: #_RUINS_7A23: db $31 ; tie
#_0C9685: #_RUINS_7A24: db $31 ; tie
#_0C9686: #_RUINS_7A25: db $28 ; play note E5
#_0C9687: #_RUINS_7A26: db $31 ; tie
#_0C9688: #_RUINS_7A27: db $31 ; tie
#_0C9689: #_RUINS_7A28: db $23 ; play note B4
#_0C968A: #_RUINS_7A29: db $31 ; tie
#_0C968B: #_RUINS_7A2A: db $31 ; tie
#_0C968C: #_RUINS_7A2B: db $26 ; play note D5
#_0C968D: #_RUINS_7A2C: db $31 ; tie
#_0C968E: #_RUINS_7A2D: db $31 ; tie
#_0C968F: #_RUINS_7A2E: db $23 ; play note B4
#_0C9690: #_RUINS_7A2F: db $31 ; tie
#_0C9691: #_RUINS_7A30: db $31 ; tie
#_0C9692: #_RUINS_7A31: db $1D ; play note F4
#_0C9693: #_RUINS_7A32: db $31 ; tie
#_0C9694: #_RUINS_7A33: db $31 ; tie
#_0C9695: #_RUINS_7A34: db $28 ; play note E5
#_0C9696: #_RUINS_7A35: db $31 ; tie
#_0C9697: #_RUINS_7A36: db $31 ; tie
#_0C9698: #_RUINS_7A37: db $24 ; play note C5
#_0C9699: #_RUINS_7A38: db $31 ; tie
#_0C969A: #_RUINS_7A39: db $31 ; tie
#_0C969B: #_RUINS_7A3A: db $24 ; play note C5
#_0C969C: #_RUINS_7A3B: db $31 ; tie
#_0C969D: #_RUINS_7A3C: db $31 ; tie
#_0C969E: #_RUINS_7A3D: db $23 ; play note B4
#_0C969F: #_RUINS_7A3E: db $31 ; tie
#_0C96A0: #_RUINS_7A3F: db $31 ; tie
#_0C96A1: #_RUINS_7A40: db $1F ; play note G4
#_0C96A2: #_RUINS_7A41: db $31 ; tie
#_0C96A3: #_RUINS_7A42: db $31 ; tie
#_0C96A4: #_RUINS_7A43: db $26 ; play note D5
#_0C96A5: #_RUINS_7A44: db $31 ; tie
#_0C96A6: #_RUINS_7A45: db $31 ; tie
#_0C96A7: #_RUINS_7A46: db $1D ; play note F4
#_0C96A8: #_RUINS_7A47: db $31 ; tie
#_0C96A9: #_RUINS_7A48: db $31 ; tie
#_0C96AA: #_RUINS_7A49: db $21 ; play note A4
#_0C96AB: #_RUINS_7A4A: db $31 ; tie
#_0C96AC: #_RUINS_7A4B: db $31 ; tie
#_0C96AD: #_RUINS_7A4C: db $1D ; play note F4
#_0C96AE: #_RUINS_7A4D: db $31 ; tie
#_0C96AF: #_RUINS_7A4E: db $31 ; tie
#_0C96B0: #_RUINS_7A4F: db $1C ; play note E4
#_0C96B1: #_RUINS_7A50: db $31 ; tie
#_0C96B2: #_RUINS_7A51: db $31 ; tie
#_0C96B3: #_RUINS_7A52: db $26 ; play note D5
#_0C96B4: #_RUINS_7A53: db $31 ; tie
#_0C96B5: #_RUINS_7A54: db $31 ; tie
#_0C96B6: #_RUINS_7A55: db $23 ; play note B4
#_0C96B7: #_RUINS_7A56: db $31 ; tie
#_0C96B8: #_RUINS_7A57: db $31 ; tie
#_0C96B9: #_RUINS_7A58: db $23 ; play note B4
#_0C96BA: #_RUINS_7A59: db $31 ; tie
#_0C96BB: #_RUINS_7A5A: db $31 ; tie
#_0C96BC: #_RUINS_7A5B: db $24 ; play note C5
#_0C96BD: #_RUINS_7A5C: db $31 ; tie
#_0C96BE: #_RUINS_7A5D: db $31 ; tie
#_0C96BF: #_RUINS_7A5E: db $21 ; play note A4
#_0C96C0: #_RUINS_7A5F: db $31 ; tie
#_0C96C1: #_RUINS_7A60: db $31 ; tie
#_0C96C2: #_RUINS_7A61: db $28 ; play note E5
#_0C96C3: #_RUINS_7A62: db $31 ; tie
#_0C96C4: #_RUINS_7A63: db $31 ; tie
#_0C96C5: #_RUINS_7A64: db $1F ; play note G4
#_0C96C6: #_RUINS_7A65: db $31 ; tie
#_0C96C7: #_RUINS_7A66: db $31 ; tie
#_0C96C8: #_RUINS_7A67: db $23 ; play note B4
#_0C96C9: #_RUINS_7A68: db $31 ; tie
#_0C96CA: #_RUINS_7A69: db $31 ; tie
#_0C96CB: #_RUINS_7A6A: db $1F ; play note G4
#_0C96CC: #_RUINS_7A6B: db $31 ; tie
#_0C96CD: #_RUINS_7A6C: db $31 ; tie
#_0C96CE: #_RUINS_7A6D: db $1A ; play note D4
#_0C96CF: #_RUINS_7A6E: db $31 ; tie
#_0C96D0: #_RUINS_7A6F: db $31 ; tie
#_0C96D1: #_RUINS_7A70: db $24 ; play note C5
#_0C96D2: #_RUINS_7A71: db $31 ; tie
#_0C96D3: #_RUINS_7A72: db $31 ; tie
#_0C96D4: #_RUINS_7A73: db $21 ; play note A4
#_0C96D5: #_RUINS_7A74: db $31 ; tie
#_0C96D6: #_RUINS_7A75: db $31 ; tie
#_0C96D7: #_RUINS_7A76: db $21 ; play note A4
#_0C96D8: #_RUINS_7A77: db $31 ; tie
#_0C96D9: #_RUINS_7A78: db $31 ; tie
#_0C96DA: #_RUINS_7A79: db $23 ; play note B4
#_0C96DB: #_RUINS_7A7A: db $31 ; tie
#_0C96DC: #_RUINS_7A7B: db $31 ; tie
#_0C96DD: #_RUINS_7A7C: db $20 ; play note Gs4
#_0C96DE: #_RUINS_7A7D: db $31 ; tie
#_0C96DF: #_RUINS_7A7E: db $31 ; tie
#_0C96E0: #_RUINS_7A7F: db $26 ; play note D5
#_0C96E1: #_RUINS_7A80: db $31 ; tie
#_0C96E2: #_RUINS_7A81: db $31 ; tie
#_0C96E3: #_RUINS_7A82: db $1D ; play note F4
#_0C96E4: #_RUINS_7A83: db $31 ; tie
#_0C96E5: #_RUINS_7A84: db $31 ; tie
#_0C96E6: #_RUINS_7A85: db $21 ; play note A4
#_0C96E7: #_RUINS_7A86: db $31 ; tie
#_0C96E8: #_RUINS_7A87: db $31 ; tie
#_0C96E9: #_RUINS_7A88: db $1D ; play note F4
#_0C96EA: #_RUINS_7A89: db $31 ; tie
#_0C96EB: #_RUINS_7A8A: db $31 ; tie
#_0C96EC: #_RUINS_7A8B: db $F8 : dw RUINS_SEGMENT_7AA5 ; goto location

RUINS_SEGMENT_7A8E:
#_0C96EF: #_RUINS_7A8E: db $72 ; vol 0x12
#_0C96F0: #_RUINS_7A8F: db $F0, $FF, $F0 ; set ADSR
#_0C96F3: #_RUINS_7A92: db $F1, $08 ; set SRCN
#_0C96F5: #_RUINS_7A94: db $F2, $68 ; set panning
#_0C96F7: #_RUINS_7A96: db $F3, $01 ; transpose +1
#_0C96F9: #_RUINS_7A98: db $FB, $10 ; set note length page
#_0C96FB: #_RUINS_7A9A: db $86 ; dur 0x06
#_0C96FC: #_RUINS_7A9B: db $30 ; rest
#_0C96FD: #_RUINS_7A9C: db $1D ; play note F4
#_0C96FE: #_RUINS_7A9D: db $31 ; tie
#_0C96FF: #_RUINS_7A9E: db $31 ; tie
#_0C9700: #_RUINS_7A9F: db $21 ; play note A4
#_0C9701: #_RUINS_7AA0: db $31 ; tie
#_0C9702: #_RUINS_7AA1: db $31 ; tie
#_0C9703: #_RUINS_7AA2: db $1D ; play note F4
#_0C9704: #_RUINS_7AA3: db $31 ; tie
#_0C9705: #_RUINS_7AA4: db $31 ; tie

RUINS_SEGMENT_7AA5:
#_0C9706: #_RUINS_7AA5: db $18 ; play note C4
#_0C9707: #_RUINS_7AA6: db $31 ; tie
#_0C9708: #_RUINS_7AA7: db $31 ; tie
#_0C9709: #_RUINS_7AA8: db $23 ; play note B4
#_0C970A: #_RUINS_7AA9: db $31 ; tie
#_0C970B: #_RUINS_7AAA: db $31 ; tie
#_0C970C: #_RUINS_7AAB: db $1F ; play note G4
#_0C970D: #_RUINS_7AAC: db $31 ; tie
#_0C970E: #_RUINS_7AAD: db $31 ; tie
#_0C970F: #_RUINS_7AAE: db $1F ; play note G4
#_0C9710: #_RUINS_7AAF: db $31 ; tie
#_0C9711: #_RUINS_7AB0: db $31 ; tie
#_0C9712: #_RUINS_7AB1: db $21 ; play note A4
#_0C9713: #_RUINS_7AB2: db $31 ; tie
#_0C9714: #_RUINS_7AB3: db $31 ; tie
#_0C9715: #_RUINS_7AB4: db $1D ; play note F4
#_0C9716: #_RUINS_7AB5: db $31 ; tie
#_0C9717: #_RUINS_7AB6: db $31 ; tie
#_0C9718: #_RUINS_7AB7: db $24 ; play note C5
#_0C9719: #_RUINS_7AB8: db $31 ; tie
#_0C971A: #_RUINS_7AB9: db $31 ; tie
#_0C971B: #_RUINS_7ABA: db $1F ; play note G4
#_0C971C: #_RUINS_7ABB: db $31 ; tie
#_0C971D: #_RUINS_7ABC: db $31 ; tie
#_0C971E: #_RUINS_7ABD: db $23 ; play note B4
#_0C971F: #_RUINS_7ABE: db $31 ; tie
#_0C9720: #_RUINS_7ABF: db $31 ; tie
#_0C9721: #_RUINS_7AC0: db $1F ; play note G4
#_0C9722: #_RUINS_7AC1: db $31 ; tie
#_0C9723: #_RUINS_7AC2: db $31 ; tie
#_0C9724: #_RUINS_7AC3: db $1A ; play note D4
#_0C9725: #_RUINS_7AC4: db $31 ; tie
#_0C9726: #_RUINS_7AC5: db $31 ; tie
#_0C9727: #_RUINS_7AC6: db $24 ; play note C5
#_0C9728: #_RUINS_7AC7: db $31 ; tie
#_0C9729: #_RUINS_7AC8: db $31 ; tie
#_0C972A: #_RUINS_7AC9: db $21 ; play note A4
#_0C972B: #_RUINS_7ACA: db $31 ; tie
#_0C972C: #_RUINS_7ACB: db $31 ; tie
#_0C972D: #_RUINS_7ACC: db $21 ; play note A4
#_0C972E: #_RUINS_7ACD: db $31 ; tie
#_0C972F: #_RUINS_7ACE: db $31 ; tie
#_0C9730: #_RUINS_7ACF: db $1F ; play note G4
#_0C9731: #_RUINS_7AD0: db $31 ; tie
#_0C9732: #_RUINS_7AD1: db $31 ; tie
#_0C9733: #_RUINS_7AD2: db $1C ; play note E4
#_0C9734: #_RUINS_7AD3: db $31 ; tie
#_0C9735: #_RUINS_7AD4: db $31 ; tie
#_0C9736: #_RUINS_7AD5: db $23 ; play note B4
#_0C9737: #_RUINS_7AD6: db $31 ; tie
#_0C9738: #_RUINS_7AD7: db $31 ; tie
#_0C9739: #_RUINS_7AD8: db $1D ; play note F4
#_0C973A: #_RUINS_7AD9: db $31 ; tie
#_0C973B: #_RUINS_7ADA: db $31 ; tie
#_0C973C: #_RUINS_7ADB: db $21 ; play note A4
#_0C973D: #_RUINS_7ADC: db $31 ; tie
#_0C973E: #_RUINS_7ADD: db $31 ; tie
#_0C973F: #_RUINS_7ADE: db $1D ; play note F4
#_0C9740: #_RUINS_7ADF: db $31 ; tie
#_0C9741: #_RUINS_7AE0: db $31 ; tie
#_0C9742: #_RUINS_7AE1: db $1C ; play note E4
#_0C9743: #_RUINS_7AE2: db $31 ; tie
#_0C9744: #_RUINS_7AE3: db $31 ; tie
#_0C9745: #_RUINS_7AE4: db $26 ; play note D5
#_0C9746: #_RUINS_7AE5: db $31 ; tie
#_0C9747: #_RUINS_7AE6: db $31 ; tie
#_0C9748: #_RUINS_7AE7: db $23 ; play note B4
#_0C9749: #_RUINS_7AE8: db $31 ; tie
#_0C974A: #_RUINS_7AE9: db $31 ; tie
#_0C974B: #_RUINS_7AEA: db $23 ; play note B4
#_0C974C: #_RUINS_7AEB: db $31 ; tie
#_0C974D: #_RUINS_7AEC: db $31 ; tie
#_0C974E: #_RUINS_7AED: db $21 ; play note A4
#_0C974F: #_RUINS_7AEE: db $31 ; tie
#_0C9750: #_RUINS_7AEF: db $31 ; tie
#_0C9751: #_RUINS_7AF0: db $1D ; play note F4
#_0C9752: #_RUINS_7AF1: db $31 ; tie
#_0C9753: #_RUINS_7AF2: db $31 ; tie
#_0C9754: #_RUINS_7AF3: db $24 ; play note C5
#_0C9755: #_RUINS_7AF4: db $31 ; tie
#_0C9756: #_RUINS_7AF5: db $31 ; tie
#_0C9757: #_RUINS_7AF6: db $1C ; play note E4
#_0C9758: #_RUINS_7AF7: db $31 ; tie
#_0C9759: #_RUINS_7AF8: db $31 ; tie
#_0C975A: #_RUINS_7AF9: db $1F ; play note G4
#_0C975B: #_RUINS_7AFA: db $31 ; tie
#_0C975C: #_RUINS_7AFB: db $31 ; tie
#_0C975D: #_RUINS_7AFC: db $1C ; play note E4
#_0C975E: #_RUINS_7AFD: db $31 ; tie
#_0C975F: #_RUINS_7AFE: db $31 ; tie
#_0C9760: #_RUINS_7AFF: db $1A ; play note D4
#_0C9761: #_RUINS_7B00: db $31 ; tie
#_0C9762: #_RUINS_7B01: db $31 ; tie
#_0C9763: #_RUINS_7B02: db $24 ; play note C5
#_0C9764: #_RUINS_7B03: db $31 ; tie
#_0C9765: #_RUINS_7B04: db $31 ; tie
#_0C9766: #_RUINS_7B05: db $21 ; play note A4
#_0C9767: #_RUINS_7B06: db $31 ; tie
#_0C9768: #_RUINS_7B07: db $31 ; tie
#_0C9769: #_RUINS_7B08: db $21 ; play note A4
#_0C976A: #_RUINS_7B09: db $31 ; tie
#_0C976B: #_RUINS_7B0A: db $31 ; tie
#_0C976C: #_RUINS_7B0B: db $23 ; play note B4
#_0C976D: #_RUINS_7B0C: db $31 ; tie
#_0C976E: #_RUINS_7B0D: db $31 ; tie
#_0C976F: #_RUINS_7B0E: db $1F ; play note G4
#_0C9770: #_RUINS_7B0F: db $31 ; tie
#_0C9771: #_RUINS_7B10: db $31 ; tie
#_0C9772: #_RUINS_7B11: db $26 ; play note D5
#_0C9773: #_RUINS_7B12: db $31 ; tie
#_0C9774: #_RUINS_7B13: db $31 ; tie
#_0C9775: #_RUINS_7B14: db $1D ; play note F4
#_0C9776: #_RUINS_7B15: db $31 ; tie
#_0C9777: #_RUINS_7B16: db $31 ; tie
#_0C9778: #_RUINS_7B17: db $21 ; play note A4
#_0C9779: #_RUINS_7B18: db $31 ; tie
#_0C977A: #_RUINS_7B19: db $31 ; tie
#_0C977B: #_RUINS_7B1A: db $1D ; play note F4
#_0C977C: #_RUINS_7B1B: db $31 ; tie
#_0C977D: #_RUINS_7B1C: db $31 ; tie
#_0C977E: #_RUINS_7B1D: db $18 ; play note C4
#_0C977F: #_RUINS_7B1E: db $31 ; tie
#_0C9780: #_RUINS_7B1F: db $31 ; tie
#_0C9781: #_RUINS_7B20: db $23 ; play note B4
#_0C9782: #_RUINS_7B21: db $31 ; tie
#_0C9783: #_RUINS_7B22: db $31 ; tie
#_0C9784: #_RUINS_7B23: db $1F ; play note G4
#_0C9785: #_RUINS_7B24: db $31 ; tie
#_0C9786: #_RUINS_7B25: db $31 ; tie
#_0C9787: #_RUINS_7B26: db $1F ; play note G4
#_0C9788: #_RUINS_7B27: db $31 ; tie
#_0C9789: #_RUINS_7B28: db $31 ; tie
#_0C978A: #_RUINS_7B29: db $21 ; play note A4
#_0C978B: #_RUINS_7B2A: db $31 ; tie
#_0C978C: #_RUINS_7B2B: db $31 ; tie
#_0C978D: #_RUINS_7B2C: db $1D ; play note F4
#_0C978E: #_RUINS_7B2D: db $31 ; tie
#_0C978F: #_RUINS_7B2E: db $31 ; tie
#_0C9790: #_RUINS_7B2F: db $24 ; play note C5
#_0C9791: #_RUINS_7B30: db $31 ; tie
#_0C9792: #_RUINS_7B31: db $31 ; tie
#_0C9793: #_RUINS_7B32: db $1F ; play note G4
#_0C9794: #_RUINS_7B33: db $31 ; tie
#_0C9795: #_RUINS_7B34: db $31 ; tie
#_0C9796: #_RUINS_7B35: db $23 ; play note B4
#_0C9797: #_RUINS_7B36: db $31 ; tie
#_0C9798: #_RUINS_7B37: db $31 ; tie
#_0C9799: #_RUINS_7B38: db $1F ; play note G4
#_0C979A: #_RUINS_7B39: db $31 ; tie
#_0C979B: #_RUINS_7B3A: db $31 ; tie
#_0C979C: #_RUINS_7B3B: db $1A ; play note D4
#_0C979D: #_RUINS_7B3C: db $31 ; tie
#_0C979E: #_RUINS_7B3D: db $31 ; tie
#_0C979F: #_RUINS_7B3E: db $24 ; play note C5
#_0C97A0: #_RUINS_7B3F: db $31 ; tie
#_0C97A1: #_RUINS_7B40: db $31 ; tie
#_0C97A2: #_RUINS_7B41: db $21 ; play note A4
#_0C97A3: #_RUINS_7B42: db $31 ; tie
#_0C97A4: #_RUINS_7B43: db $31 ; tie
#_0C97A5: #_RUINS_7B44: db $21 ; play note A4
#_0C97A6: #_RUINS_7B45: db $31 ; tie
#_0C97A7: #_RUINS_7B46: db $31 ; tie
#_0C97A8: #_RUINS_7B47: db $23 ; play note B4
#_0C97A9: #_RUINS_7B48: db $31 ; tie
#_0C97AA: #_RUINS_7B49: db $31 ; tie
#_0C97AB: #_RUINS_7B4A: db $1F ; play note G4
#_0C97AC: #_RUINS_7B4B: db $31 ; tie
#_0C97AD: #_RUINS_7B4C: db $31 ; tie
#_0C97AE: #_RUINS_7B4D: db $26 ; play note D5
#_0C97AF: #_RUINS_7B4E: db $31 ; tie
#_0C97B0: #_RUINS_7B4F: db $31 ; tie
#_0C97B1: #_RUINS_7B50: db $21 ; play note A4
#_0C97B2: #_RUINS_7B51: db $31 ; tie
#_0C97B3: #_RUINS_7B52: db $31 ; tie
#_0C97B4: #_RUINS_7B53: db $24 ; play note C5
#_0C97B5: #_RUINS_7B54: db $31 ; tie
#_0C97B6: #_RUINS_7B55: db $31 ; tie
#_0C97B7: #_RUINS_7B56: db $21 ; play note A4
#_0C97B8: #_RUINS_7B57: db $31 ; tie
#_0C97B9: #_RUINS_7B58: db $31 ; tie
#_0C97BA: #_RUINS_7B59: db $1C ; play note E4
#_0C97BB: #_RUINS_7B5A: db $31 ; tie
#_0C97BC: #_RUINS_7B5B: db $31 ; tie
#_0C97BD: #_RUINS_7B5C: db $26 ; play note D5
#_0C97BE: #_RUINS_7B5D: db $31 ; tie
#_0C97BF: #_RUINS_7B5E: db $31 ; tie
#_0C97C0: #_RUINS_7B5F: db $23 ; play note B4
#_0C97C1: #_RUINS_7B60: db $31 ; tie
#_0C97C2: #_RUINS_7B61: db $31 ; tie
#_0C97C3: #_RUINS_7B62: db $23 ; play note B4
#_0C97C4: #_RUINS_7B63: db $31 ; tie
#_0C97C5: #_RUINS_7B64: db $31 ; tie
#_0C97C6: #_RUINS_7B65: db $21 ; play note A4
#_0C97C7: #_RUINS_7B66: db $31 ; tie
#_0C97C8: #_RUINS_7B67: db $31 ; tie
#_0C97C9: #_RUINS_7B68: db $1D ; play note F4
#_0C97CA: #_RUINS_7B69: db $31 ; tie
#_0C97CB: #_RUINS_7B6A: db $31 ; tie
#_0C97CC: #_RUINS_7B6B: db $24 ; play note C5
#_0C97CD: #_RUINS_7B6C: db $31 ; tie
#_0C97CE: #_RUINS_7B6D: db $31 ; tie
#_0C97CF: #_RUINS_7B6E: db $1F ; play note G4
#_0C97D0: #_RUINS_7B6F: db $31 ; tie
#_0C97D1: #_RUINS_7B70: db $31 ; tie
#_0C97D2: #_RUINS_7B71: db $23 ; play note B4
#_0C97D3: #_RUINS_7B72: db $31 ; tie
#_0C97D4: #_RUINS_7B73: db $31 ; tie
#_0C97D5: #_RUINS_7B74: db $1F ; play note G4
#_0C97D6: #_RUINS_7B75: db $31 ; tie
#_0C97D7: #_RUINS_7B76: db $31 ; tie
#_0C97D8: #_RUINS_7B77: db $1D ; play note F4
#_0C97D9: #_RUINS_7B78: db $31 ; tie
#_0C97DA: #_RUINS_7B79: db $31 ; tie
#_0C97DB: #_RUINS_7B7A: db $28 ; play note E5
#_0C97DC: #_RUINS_7B7B: db $31 ; tie
#_0C97DD: #_RUINS_7B7C: db $31 ; tie
#_0C97DE: #_RUINS_7B7D: db $24 ; play note C5
#_0C97DF: #_RUINS_7B7E: db $31 ; tie
#_0C97E0: #_RUINS_7B7F: db $31 ; tie
#_0C97E1: #_RUINS_7B80: db $24 ; play note C5
#_0C97E2: #_RUINS_7B81: db $31 ; tie
#_0C97E3: #_RUINS_7B82: db $31 ; tie
#_0C97E4: #_RUINS_7B83: db $26 ; play note D5
#_0C97E5: #_RUINS_7B84: db $31 ; tie
#_0C97E6: #_RUINS_7B85: db $31 ; tie
#_0C97E7: #_RUINS_7B86: db $23 ; play note B4
#_0C97E8: #_RUINS_7B87: db $31 ; tie
#_0C97E9: #_RUINS_7B88: db $31 ; tie
#_0C97EA: #_RUINS_7B89: db $29 ; play note F5
#_0C97EB: #_RUINS_7B8A: db $31 ; tie
#_0C97EC: #_RUINS_7B8B: db $31 ; tie
#_0C97ED: #_RUINS_7B8C: db $21 ; play note A4
#_0C97EE: #_RUINS_7B8D: db $31 ; tie
#_0C97EF: #_RUINS_7B8E: db $31 ; tie
#_0C97F0: #_RUINS_7B8F: db $24 ; play note C5
#_0C97F1: #_RUINS_7B90: db $31 ; tie
#_0C97F2: #_RUINS_7B91: db $31 ; tie
#_0C97F3: #_RUINS_7B92: db $21 ; play note A4
#_0C97F4: #_RUINS_7B93: db $31 ; tie
#_0C97F5: #_RUINS_7B94: db $31 ; tie
#_0C97F6: #_RUINS_7B95: db $1C ; play note E4
#_0C97F7: #_RUINS_7B96: db $31 ; tie
#_0C97F8: #_RUINS_7B97: db $31 ; tie
#_0C97F9: #_RUINS_7B98: db $26 ; play note D5
#_0C97FA: #_RUINS_7B99: db $31 ; tie
#_0C97FB: #_RUINS_7B9A: db $31 ; tie
#_0C97FC: #_RUINS_7B9B: db $23 ; play note B4
#_0C97FD: #_RUINS_7B9C: db $31 ; tie
#_0C97FE: #_RUINS_7B9D: db $31 ; tie
#_0C97FF: #_RUINS_7B9E: db $23 ; play note B4
#_0C9800: #_RUINS_7B9F: db $31 ; tie
#_0C9801: #_RUINS_7BA0: db $31 ; tie
#_0C9802: #_RUINS_7BA1: db $21 ; play note A4
#_0C9803: #_RUINS_7BA2: db $31 ; tie
#_0C9804: #_RUINS_7BA3: db $31 ; tie
#_0C9805: #_RUINS_7BA4: db $1D ; play note F4
#_0C9806: #_RUINS_7BA5: db $31 ; tie
#_0C9807: #_RUINS_7BA6: db $31 ; tie
#_0C9808: #_RUINS_7BA7: db $24 ; play note C5
#_0C9809: #_RUINS_7BA8: db $31 ; tie
#_0C980A: #_RUINS_7BA9: db $31 ; tie
#_0C980B: #_RUINS_7BAA: db $1F ; play note G4
#_0C980C: #_RUINS_7BAB: db $31 ; tie
#_0C980D: #_RUINS_7BAC: db $31 ; tie
#_0C980E: #_RUINS_7BAD: db $23 ; play note B4
#_0C980F: #_RUINS_7BAE: db $31 ; tie
#_0C9810: #_RUINS_7BAF: db $31 ; tie
#_0C9811: #_RUINS_7BB0: db $1F ; play note G4
#_0C9812: #_RUINS_7BB1: db $31 ; tie
#_0C9813: #_RUINS_7BB2: db $31 ; tie
#_0C9814: #_RUINS_7BB3: db $1D ; play note F4
#_0C9815: #_RUINS_7BB4: db $31 ; tie
#_0C9816: #_RUINS_7BB5: db $31 ; tie
#_0C9817: #_RUINS_7BB6: db $28 ; play note E5
#_0C9818: #_RUINS_7BB7: db $31 ; tie
#_0C9819: #_RUINS_7BB8: db $31 ; tie
#_0C981A: #_RUINS_7BB9: db $24 ; play note C5
#_0C981B: #_RUINS_7BBA: db $31 ; tie
#_0C981C: #_RUINS_7BBB: db $31 ; tie
#_0C981D: #_RUINS_7BBC: db $24 ; play note C5
#_0C981E: #_RUINS_7BBD: db $31 ; tie
#_0C981F: #_RUINS_7BBE: db $31 ; tie
#_0C9820: #_RUINS_7BBF: db $23 ; play note B4
#_0C9821: #_RUINS_7BC0: db $31 ; tie
#_0C9822: #_RUINS_7BC1: db $31 ; tie
#_0C9823: #_RUINS_7BC2: db $1F ; play note G4
#_0C9824: #_RUINS_7BC3: db $31 ; tie
#_0C9825: #_RUINS_7BC4: db $31 ; tie
#_0C9826: #_RUINS_7BC5: db $26 ; play note D5
#_0C9827: #_RUINS_7BC6: db $31 ; tie
#_0C9828: #_RUINS_7BC7: db $31 ; tie
#_0C9829: #_RUINS_7BC8: db $1D ; play note F4
#_0C982A: #_RUINS_7BC9: db $31 ; tie
#_0C982B: #_RUINS_7BCA: db $31 ; tie
#_0C982C: #_RUINS_7BCB: db $21 ; play note A4
#_0C982D: #_RUINS_7BCC: db $31 ; tie
#_0C982E: #_RUINS_7BCD: db $31 ; tie
#_0C982F: #_RUINS_7BCE: db $1D ; play note F4
#_0C9830: #_RUINS_7BCF: db $31 ; tie
#_0C9831: #_RUINS_7BD0: db $31 ; tie
#_0C9832: #_RUINS_7BD1: db $1C ; play note E4
#_0C9833: #_RUINS_7BD2: db $31 ; tie
#_0C9834: #_RUINS_7BD3: db $31 ; tie
#_0C9835: #_RUINS_7BD4: db $26 ; play note D5
#_0C9836: #_RUINS_7BD5: db $31 ; tie
#_0C9837: #_RUINS_7BD6: db $31 ; tie
#_0C9838: #_RUINS_7BD7: db $23 ; play note B4
#_0C9839: #_RUINS_7BD8: db $31 ; tie
#_0C983A: #_RUINS_7BD9: db $31 ; tie
#_0C983B: #_RUINS_7BDA: db $23 ; play note B4
#_0C983C: #_RUINS_7BDB: db $31 ; tie
#_0C983D: #_RUINS_7BDC: db $31 ; tie
#_0C983E: #_RUINS_7BDD: db $21 ; play note A4
#_0C983F: #_RUINS_7BDE: db $31 ; tie
#_0C9840: #_RUINS_7BDF: db $31 ; tie
#_0C9841: #_RUINS_7BE0: db $1D ; play note F4
#_0C9842: #_RUINS_7BE1: db $31 ; tie
#_0C9843: #_RUINS_7BE2: db $31 ; tie
#_0C9844: #_RUINS_7BE3: db $24 ; play note C5
#_0C9845: #_RUINS_7BE4: db $31 ; tie
#_0C9846: #_RUINS_7BE5: db $F8 : dw RUINS_SEGMENT_7BFF ; goto location

RUINS_SEGMENT_7BE8:
#_0C9849: #_RUINS_7BE8: db $62 ; vol 0x02
#_0C984A: #_RUINS_7BE9: db $F0, $FF, $F0 ; set ADSR
#_0C984D: #_RUINS_7BEC: db $F1, $08 ; set SRCN
#_0C984F: #_RUINS_7BEE: db $F2, $68 ; set panning
#_0C9851: #_RUINS_7BF0: db $F3, $01 ; transpose +1
#_0C9853: #_RUINS_7BF2: db $FB, $10 ; set note length page
#_0C9855: #_RUINS_7BF4: db $86 ; dur 0x06
#_0C9856: #_RUINS_7BF5: db $30 ; rest
#_0C9857: #_RUINS_7BF6: db $30 ; rest
#_0C9858: #_RUINS_7BF7: db $21 ; play note A4
#_0C9859: #_RUINS_7BF8: db $31 ; tie
#_0C985A: #_RUINS_7BF9: db $31 ; tie
#_0C985B: #_RUINS_7BFA: db $1D ; play note F4
#_0C985C: #_RUINS_7BFB: db $31 ; tie
#_0C985D: #_RUINS_7BFC: db $31 ; tie
#_0C985E: #_RUINS_7BFD: db $24 ; play note C5
#_0C985F: #_RUINS_7BFE: db $31 ; tie

RUINS_SEGMENT_7BFF:
#_0C9860: #_RUINS_7BFF: db $31 ; tie
#_0C9861: #_RUINS_7C00: db $1C ; play note E4
#_0C9862: #_RUINS_7C01: db $31 ; tie
#_0C9863: #_RUINS_7C02: db $31 ; tie
#_0C9864: #_RUINS_7C03: db $1F ; play note G4
#_0C9865: #_RUINS_7C04: db $31 ; tie
#_0C9866: #_RUINS_7C05: db $31 ; tie
#_0C9867: #_RUINS_7C06: db $1C ; play note E4
#_0C9868: #_RUINS_7C07: db $31 ; tie
#_0C9869: #_RUINS_7C08: db $31 ; tie
#_0C986A: #_RUINS_7C09: db $1A ; play note D4
#_0C986B: #_RUINS_7C0A: db $31 ; tie
#_0C986C: #_RUINS_7C0B: db $31 ; tie
#_0C986D: #_RUINS_7C0C: db $24 ; play note C5
#_0C986E: #_RUINS_7C0D: db $31 ; tie
#_0C986F: #_RUINS_7C0E: db $31 ; tie
#_0C9870: #_RUINS_7C0F: db $21 ; play note A4
#_0C9871: #_RUINS_7C10: db $31 ; tie
#_0C9872: #_RUINS_7C11: db $31 ; tie
#_0C9873: #_RUINS_7C12: db $21 ; play note A4
#_0C9874: #_RUINS_7C13: db $31 ; tie
#_0C9875: #_RUINS_7C14: db $31 ; tie
#_0C9876: #_RUINS_7C15: db $23 ; play note B4
#_0C9877: #_RUINS_7C16: db $31 ; tie
#_0C9878: #_RUINS_7C17: db $31 ; tie
#_0C9879: #_RUINS_7C18: db $1F ; play note G4
#_0C987A: #_RUINS_7C19: db $31 ; tie
#_0C987B: #_RUINS_7C1A: db $31 ; tie
#_0C987C: #_RUINS_7C1B: db $26 ; play note D5
#_0C987D: #_RUINS_7C1C: db $31 ; tie
#_0C987E: #_RUINS_7C1D: db $31 ; tie
#_0C987F: #_RUINS_7C1E: db $1D ; play note F4
#_0C9880: #_RUINS_7C1F: db $31 ; tie
#_0C9881: #_RUINS_7C20: db $31 ; tie
#_0C9882: #_RUINS_7C21: db $21 ; play note A4
#_0C9883: #_RUINS_7C22: db $31 ; tie
#_0C9884: #_RUINS_7C23: db $31 ; tie
#_0C9885: #_RUINS_7C24: db $1D ; play note F4
#_0C9886: #_RUINS_7C25: db $31 ; tie
#_0C9887: #_RUINS_7C26: db $31 ; tie
#_0C9888: #_RUINS_7C27: db $18 ; play note C4
#_0C9889: #_RUINS_7C28: db $31 ; tie
#_0C988A: #_RUINS_7C29: db $31 ; tie
#_0C988B: #_RUINS_7C2A: db $23 ; play note B4
#_0C988C: #_RUINS_7C2B: db $31 ; tie
#_0C988D: #_RUINS_7C2C: db $31 ; tie
#_0C988E: #_RUINS_7C2D: db $1F ; play note G4
#_0C988F: #_RUINS_7C2E: db $31 ; tie
#_0C9890: #_RUINS_7C2F: db $31 ; tie
#_0C9891: #_RUINS_7C30: db $1F ; play note G4
#_0C9892: #_RUINS_7C31: db $31 ; tie
#_0C9893: #_RUINS_7C32: db $31 ; tie
#_0C9894: #_RUINS_7C33: db $21 ; play note A4
#_0C9895: #_RUINS_7C34: db $31 ; tie
#_0C9896: #_RUINS_7C35: db $31 ; tie
#_0C9897: #_RUINS_7C36: db $1D ; play note F4
#_0C9898: #_RUINS_7C37: db $31 ; tie
#_0C9899: #_RUINS_7C38: db $31 ; tie
#_0C989A: #_RUINS_7C39: db $24 ; play note C5
#_0C989B: #_RUINS_7C3A: db $31 ; tie
#_0C989C: #_RUINS_7C3B: db $31 ; tie
#_0C989D: #_RUINS_7C3C: db $1F ; play note G4
#_0C989E: #_RUINS_7C3D: db $31 ; tie
#_0C989F: #_RUINS_7C3E: db $31 ; tie
#_0C98A0: #_RUINS_7C3F: db $23 ; play note B4
#_0C98A1: #_RUINS_7C40: db $31 ; tie
#_0C98A2: #_RUINS_7C41: db $31 ; tie
#_0C98A3: #_RUINS_7C42: db $1F ; play note G4
#_0C98A4: #_RUINS_7C43: db $31 ; tie
#_0C98A5: #_RUINS_7C44: db $31 ; tie
#_0C98A6: #_RUINS_7C45: db $1A ; play note D4
#_0C98A7: #_RUINS_7C46: db $31 ; tie
#_0C98A8: #_RUINS_7C47: db $31 ; tie
#_0C98A9: #_RUINS_7C48: db $24 ; play note C5
#_0C98AA: #_RUINS_7C49: db $31 ; tie
#_0C98AB: #_RUINS_7C4A: db $31 ; tie
#_0C98AC: #_RUINS_7C4B: db $21 ; play note A4
#_0C98AD: #_RUINS_7C4C: db $31 ; tie
#_0C98AE: #_RUINS_7C4D: db $31 ; tie
#_0C98AF: #_RUINS_7C4E: db $21 ; play note A4
#_0C98B0: #_RUINS_7C4F: db $31 ; tie
#_0C98B1: #_RUINS_7C50: db $31 ; tie
#_0C98B2: #_RUINS_7C51: db $1F ; play note G4
#_0C98B3: #_RUINS_7C52: db $31 ; tie
#_0C98B4: #_RUINS_7C53: db $31 ; tie
#_0C98B5: #_RUINS_7C54: db $1C ; play note E4
#_0C98B6: #_RUINS_7C55: db $31 ; tie
#_0C98B7: #_RUINS_7C56: db $31 ; tie
#_0C98B8: #_RUINS_7C57: db $23 ; play note B4
#_0C98B9: #_RUINS_7C58: db $31 ; tie
#_0C98BA: #_RUINS_7C59: db $31 ; tie
#_0C98BB: #_RUINS_7C5A: db $1D ; play note F4
#_0C98BC: #_RUINS_7C5B: db $31 ; tie
#_0C98BD: #_RUINS_7C5C: db $31 ; tie
#_0C98BE: #_RUINS_7C5D: db $21 ; play note A4
#_0C98BF: #_RUINS_7C5E: db $31 ; tie
#_0C98C0: #_RUINS_7C5F: db $31 ; tie
#_0C98C1: #_RUINS_7C60: db $1D ; play note F4
#_0C98C2: #_RUINS_7C61: db $31 ; tie
#_0C98C3: #_RUINS_7C62: db $31 ; tie
#_0C98C4: #_RUINS_7C63: db $1C ; play note E4
#_0C98C5: #_RUINS_7C64: db $31 ; tie
#_0C98C6: #_RUINS_7C65: db $31 ; tie
#_0C98C7: #_RUINS_7C66: db $26 ; play note D5
#_0C98C8: #_RUINS_7C67: db $31 ; tie
#_0C98C9: #_RUINS_7C68: db $31 ; tie
#_0C98CA: #_RUINS_7C69: db $23 ; play note B4
#_0C98CB: #_RUINS_7C6A: db $31 ; tie
#_0C98CC: #_RUINS_7C6B: db $31 ; tie
#_0C98CD: #_RUINS_7C6C: db $23 ; play note B4
#_0C98CE: #_RUINS_7C6D: db $31 ; tie
#_0C98CF: #_RUINS_7C6E: db $31 ; tie
#_0C98D0: #_RUINS_7C6F: db $21 ; play note A4
#_0C98D1: #_RUINS_7C70: db $31 ; tie
#_0C98D2: #_RUINS_7C71: db $31 ; tie
#_0C98D3: #_RUINS_7C72: db $1D ; play note F4
#_0C98D4: #_RUINS_7C73: db $31 ; tie
#_0C98D5: #_RUINS_7C74: db $31 ; tie
#_0C98D6: #_RUINS_7C75: db $24 ; play note C5
#_0C98D7: #_RUINS_7C76: db $31 ; tie
#_0C98D8: #_RUINS_7C77: db $31 ; tie
#_0C98D9: #_RUINS_7C78: db $1C ; play note E4
#_0C98DA: #_RUINS_7C79: db $31 ; tie
#_0C98DB: #_RUINS_7C7A: db $31 ; tie
#_0C98DC: #_RUINS_7C7B: db $1F ; play note G4
#_0C98DD: #_RUINS_7C7C: db $31 ; tie
#_0C98DE: #_RUINS_7C7D: db $31 ; tie
#_0C98DF: #_RUINS_7C7E: db $1C ; play note E4
#_0C98E0: #_RUINS_7C7F: db $31 ; tie
#_0C98E1: #_RUINS_7C80: db $31 ; tie
#_0C98E2: #_RUINS_7C81: db $1A ; play note D4
#_0C98E3: #_RUINS_7C82: db $31 ; tie
#_0C98E4: #_RUINS_7C83: db $31 ; tie
#_0C98E5: #_RUINS_7C84: db $24 ; play note C5
#_0C98E6: #_RUINS_7C85: db $31 ; tie
#_0C98E7: #_RUINS_7C86: db $31 ; tie
#_0C98E8: #_RUINS_7C87: db $21 ; play note A4
#_0C98E9: #_RUINS_7C88: db $31 ; tie
#_0C98EA: #_RUINS_7C89: db $31 ; tie
#_0C98EB: #_RUINS_7C8A: db $21 ; play note A4
#_0C98EC: #_RUINS_7C8B: db $31 ; tie
#_0C98ED: #_RUINS_7C8C: db $31 ; tie
#_0C98EE: #_RUINS_7C8D: db $23 ; play note B4
#_0C98EF: #_RUINS_7C8E: db $31 ; tie
#_0C98F0: #_RUINS_7C8F: db $31 ; tie
#_0C98F1: #_RUINS_7C90: db $1F ; play note G4
#_0C98F2: #_RUINS_7C91: db $31 ; tie
#_0C98F3: #_RUINS_7C92: db $31 ; tie
#_0C98F4: #_RUINS_7C93: db $26 ; play note D5
#_0C98F5: #_RUINS_7C94: db $31 ; tie
#_0C98F6: #_RUINS_7C95: db $31 ; tie
#_0C98F7: #_RUINS_7C96: db $1D ; play note F4
#_0C98F8: #_RUINS_7C97: db $31 ; tie
#_0C98F9: #_RUINS_7C98: db $31 ; tie
#_0C98FA: #_RUINS_7C99: db $21 ; play note A4
#_0C98FB: #_RUINS_7C9A: db $31 ; tie
#_0C98FC: #_RUINS_7C9B: db $31 ; tie
#_0C98FD: #_RUINS_7C9C: db $1D ; play note F4
#_0C98FE: #_RUINS_7C9D: db $31 ; tie
#_0C98FF: #_RUINS_7C9E: db $31 ; tie
#_0C9900: #_RUINS_7C9F: db $1C ; play note E4
#_0C9901: #_RUINS_7CA0: db $31 ; tie
#_0C9902: #_RUINS_7CA1: db $31 ; tie
#_0C9903: #_RUINS_7CA2: db $26 ; play note D5
#_0C9904: #_RUINS_7CA3: db $31 ; tie
#_0C9905: #_RUINS_7CA4: db $31 ; tie
#_0C9906: #_RUINS_7CA5: db $23 ; play note B4
#_0C9907: #_RUINS_7CA6: db $31 ; tie
#_0C9908: #_RUINS_7CA7: db $31 ; tie
#_0C9909: #_RUINS_7CA8: db $23 ; play note B4
#_0C990A: #_RUINS_7CA9: db $31 ; tie
#_0C990B: #_RUINS_7CAA: db $31 ; tie
#_0C990C: #_RUINS_7CAB: db $24 ; play note C5
#_0C990D: #_RUINS_7CAC: db $31 ; tie
#_0C990E: #_RUINS_7CAD: db $31 ; tie
#_0C990F: #_RUINS_7CAE: db $21 ; play note A4
#_0C9910: #_RUINS_7CAF: db $31 ; tie
#_0C9911: #_RUINS_7CB0: db $31 ; tie
#_0C9912: #_RUINS_7CB1: db $28 ; play note E5
#_0C9913: #_RUINS_7CB2: db $31 ; tie
#_0C9914: #_RUINS_7CB3: db $31 ; tie
#_0C9915: #_RUINS_7CB4: db $1F ; play note G4
#_0C9916: #_RUINS_7CB5: db $31 ; tie
#_0C9917: #_RUINS_7CB6: db $31 ; tie
#_0C9918: #_RUINS_7CB7: db $23 ; play note B4
#_0C9919: #_RUINS_7CB8: db $31 ; tie
#_0C991A: #_RUINS_7CB9: db $31 ; tie
#_0C991B: #_RUINS_7CBA: db $1F ; play note G4
#_0C991C: #_RUINS_7CBB: db $31 ; tie
#_0C991D: #_RUINS_7CBC: db $31 ; tie
#_0C991E: #_RUINS_7CBD: db $1A ; play note D4
#_0C991F: #_RUINS_7CBE: db $31 ; tie
#_0C9920: #_RUINS_7CBF: db $31 ; tie
#_0C9921: #_RUINS_7CC0: db $24 ; play note C5
#_0C9922: #_RUINS_7CC1: db $31 ; tie
#_0C9923: #_RUINS_7CC2: db $31 ; tie
#_0C9924: #_RUINS_7CC3: db $21 ; play note A4
#_0C9925: #_RUINS_7CC4: db $31 ; tie
#_0C9926: #_RUINS_7CC5: db $31 ; tie
#_0C9927: #_RUINS_7CC6: db $21 ; play note A4
#_0C9928: #_RUINS_7CC7: db $31 ; tie
#_0C9929: #_RUINS_7CC8: db $31 ; tie
#_0C992A: #_RUINS_7CC9: db $23 ; play note B4
#_0C992B: #_RUINS_7CCA: db $31 ; tie
#_0C992C: #_RUINS_7CCB: db $31 ; tie
#_0C992D: #_RUINS_7CCC: db $1F ; play note G4
#_0C992E: #_RUINS_7CCD: db $31 ; tie
#_0C992F: #_RUINS_7CCE: db $31 ; tie
#_0C9930: #_RUINS_7CCF: db $26 ; play note D5
#_0C9931: #_RUINS_7CD0: db $31 ; tie
#_0C9932: #_RUINS_7CD1: db $31 ; tie
#_0C9933: #_RUINS_7CD2: db $21 ; play note A4
#_0C9934: #_RUINS_7CD3: db $31 ; tie
#_0C9935: #_RUINS_7CD4: db $31 ; tie
#_0C9936: #_RUINS_7CD5: db $24 ; play note C5
#_0C9937: #_RUINS_7CD6: db $31 ; tie
#_0C9938: #_RUINS_7CD7: db $31 ; tie
#_0C9939: #_RUINS_7CD8: db $21 ; play note A4
#_0C993A: #_RUINS_7CD9: db $31 ; tie
#_0C993B: #_RUINS_7CDA: db $31 ; tie
#_0C993C: #_RUINS_7CDB: db $1F ; play note G4
#_0C993D: #_RUINS_7CDC: db $31 ; tie
#_0C993E: #_RUINS_7CDD: db $31 ; tie
#_0C993F: #_RUINS_7CDE: db $29 ; play note F5
#_0C9940: #_RUINS_7CDF: db $31 ; tie
#_0C9941: #_RUINS_7CE0: db $31 ; tie
#_0C9942: #_RUINS_7CE1: db $26 ; play note D5
#_0C9943: #_RUINS_7CE2: db $31 ; tie
#_0C9944: #_RUINS_7CE3: db $31 ; tie
#_0C9945: #_RUINS_7CE4: db $26 ; play note D5
#_0C9946: #_RUINS_7CE5: db $31 ; tie
#_0C9947: #_RUINS_7CE6: db $31 ; tie
#_0C9948: #_RUINS_7CE7: db $24 ; play note C5
#_0C9949: #_RUINS_7CE8: db $31 ; tie
#_0C994A: #_RUINS_7CE9: db $31 ; tie
#_0C994B: #_RUINS_7CEA: db $21 ; play note A4
#_0C994C: #_RUINS_7CEB: db $31 ; tie
#_0C994D: #_RUINS_7CEC: db $31 ; tie
#_0C994E: #_RUINS_7CED: db $28 ; play note E5
#_0C994F: #_RUINS_7CEE: db $31 ; tie
#_0C9950: #_RUINS_7CEF: db $31 ; tie
#_0C9951: #_RUINS_7CF0: db $1F ; play note G4
#_0C9952: #_RUINS_7CF1: db $31 ; tie
#_0C9953: #_RUINS_7CF2: db $31 ; tie
#_0C9954: #_RUINS_7CF3: db $23 ; play note B4
#_0C9955: #_RUINS_7CF4: db $31 ; tie
#_0C9956: #_RUINS_7CF5: db $31 ; tie
#_0C9957: #_RUINS_7CF6: db $1F ; play note G4
#_0C9958: #_RUINS_7CF7: db $31 ; tie
#_0C9959: #_RUINS_7CF8: db $31 ; tie
#_0C995A: #_RUINS_7CF9: db $1A ; play note D4
#_0C995B: #_RUINS_7CFA: db $31 ; tie
#_0C995C: #_RUINS_7CFB: db $31 ; tie
#_0C995D: #_RUINS_7CFC: db $24 ; play note C5
#_0C995E: #_RUINS_7CFD: db $31 ; tie
#_0C995F: #_RUINS_7CFE: db $31 ; tie
#_0C9960: #_RUINS_7CFF: db $21 ; play note A4
#_0C9961: #_RUINS_7D00: db $31 ; tie
#_0C9962: #_RUINS_7D01: db $31 ; tie
#_0C9963: #_RUINS_7D02: db $21 ; play note A4
#_0C9964: #_RUINS_7D03: db $31 ; tie
#_0C9965: #_RUINS_7D04: db $31 ; tie
#_0C9966: #_RUINS_7D05: db $23 ; play note B4
#_0C9967: #_RUINS_7D06: db $31 ; tie
#_0C9968: #_RUINS_7D07: db $31 ; tie
#_0C9969: #_RUINS_7D08: db $1F ; play note G4
#_0C996A: #_RUINS_7D09: db $31 ; tie
#_0C996B: #_RUINS_7D0A: db $31 ; tie
#_0C996C: #_RUINS_7D0B: db $26 ; play note D5
#_0C996D: #_RUINS_7D0C: db $31 ; tie
#_0C996E: #_RUINS_7D0D: db $31 ; tie
#_0C996F: #_RUINS_7D0E: db $21 ; play note A4
#_0C9970: #_RUINS_7D0F: db $31 ; tie
#_0C9971: #_RUINS_7D10: db $31 ; tie
#_0C9972: #_RUINS_7D11: db $24 ; play note C5
#_0C9973: #_RUINS_7D12: db $31 ; tie
#_0C9974: #_RUINS_7D13: db $31 ; tie
#_0C9975: #_RUINS_7D14: db $21 ; play note A4
#_0C9976: #_RUINS_7D15: db $31 ; tie
#_0C9977: #_RUINS_7D16: db $31 ; tie
#_0C9978: #_RUINS_7D17: db $1C ; play note E4
#_0C9979: #_RUINS_7D18: db $31 ; tie
#_0C997A: #_RUINS_7D19: db $31 ; tie
#_0C997B: #_RUINS_7D1A: db $26 ; play note D5
#_0C997C: #_RUINS_7D1B: db $31 ; tie
#_0C997D: #_RUINS_7D1C: db $31 ; tie
#_0C997E: #_RUINS_7D1D: db $23 ; play note B4
#_0C997F: #_RUINS_7D1E: db $31 ; tie
#_0C9980: #_RUINS_7D1F: db $31 ; tie
#_0C9981: #_RUINS_7D20: db $23 ; play note B4
#_0C9982: #_RUINS_7D21: db $31 ; tie
#_0C9983: #_RUINS_7D22: db $31 ; tie
#_0C9984: #_RUINS_7D23: db $21 ; play note A4
#_0C9985: #_RUINS_7D24: db $31 ; tie
#_0C9986: #_RUINS_7D25: db $31 ; tie
#_0C9987: #_RUINS_7D26: db $1D ; play note F4
#_0C9988: #_RUINS_7D27: db $31 ; tie
#_0C9989: #_RUINS_7D28: db $31 ; tie
#_0C998A: #_RUINS_7D29: db $24 ; play note C5
#_0C998B: #_RUINS_7D2A: db $31 ; tie
#_0C998C: #_RUINS_7D2B: db $31 ; tie
#_0C998D: #_RUINS_7D2C: db $20 ; play note Gs4
#_0C998E: #_RUINS_7D2D: db $31 ; tie
#_0C998F: #_RUINS_7D2E: db $31 ; tie
#_0C9990: #_RUINS_7D2F: db $23 ; play note B4
#_0C9991: #_RUINS_7D30: db $31 ; tie
#_0C9992: #_RUINS_7D31: db $31 ; tie
#_0C9993: #_RUINS_7D32: db $20 ; play note Gs4
#_0C9994: #_RUINS_7D33: db $31 ; tie
#_0C9995: #_RUINS_7D34: db $31 ; tie
#_0C9996: #_RUINS_7D35: db $F8 : dw RUINS_SEGMENT_7940 ; goto location

RUINS_SEGMENT_7D38:
#_0C9999: #_RUINS_7D38: db $87 ; dur 0x07
#_0C999A: #_RUINS_7D39: db $30 ; rest
#_0C999B: #_RUINS_7D3A: db $70 ; vol 0x10
#_0C999C: #_RUINS_7D3B: db $F0, $FF, $F0 ; set ADSR
#_0C999F: #_RUINS_7D3E: db $F1, $08 ; set SRCN
#_0C99A1: #_RUINS_7D40: db $F2, $72 ; set panning
#_0C99A3: #_RUINS_7D42: db $F3, $01 ; transpose +1
#_0C99A5: #_RUINS_7D44: db $F9, $20 ; set fine tuning
#_0C99A7: #_RUINS_7D46: db $FB, $10 ; set note length page
#_0C99A9: #_RUINS_7D48: db $86 ; dur 0x06

RUINS_SEGMENT_7D49:
#_0C99AA: #_RUINS_7D49: db $F4, $04 ; set loop point B
#_0C99AC: #_RUINS_7D4B: db $1A ; play note D4
#_0C99AD: #_RUINS_7D4C: db $1D ; play note F4
#_0C99AE: #_RUINS_7D4D: db $21 ; play note A4
#_0C99AF: #_RUINS_7D4E: db $24 ; play note C5
#_0C99B0: #_RUINS_7D4F: db $21 ; play note A4
#_0C99B1: #_RUINS_7D50: db $1D ; play note F4
#_0C99B2: #_RUINS_7D51: db $21 ; play note A4
#_0C99B3: #_RUINS_7D52: db $1D ; play note F4
#_0C99B4: #_RUINS_7D53: db $24 ; play note C5
#_0C99B5: #_RUINS_7D54: db $21 ; play note A4
#_0C99B6: #_RUINS_7D55: db $18 ; play note C4
#_0C99B7: #_RUINS_7D56: db $1C ; play note E4
#_0C99B8: #_RUINS_7D57: db $1F ; play note G4
#_0C99B9: #_RUINS_7D58: db $23 ; play note B4
#_0C99BA: #_RUINS_7D59: db $1F ; play note G4
#_0C99BB: #_RUINS_7D5A: db $1C ; play note E4
#_0C99BC: #_RUINS_7D5B: db $1F ; play note G4
#_0C99BD: #_RUINS_7D5C: db $1C ; play note E4
#_0C99BE: #_RUINS_7D5D: db $23 ; play note B4
#_0C99BF: #_RUINS_7D5E: db $1F ; play note G4
#_0C99C0: #_RUINS_7D5F: db $1A ; play note D4
#_0C99C1: #_RUINS_7D60: db $1D ; play note F4
#_0C99C2: #_RUINS_7D61: db $21 ; play note A4
#_0C99C3: #_RUINS_7D62: db $24 ; play note C5
#_0C99C4: #_RUINS_7D63: db $21 ; play note A4
#_0C99C5: #_RUINS_7D64: db $1D ; play note F4
#_0C99C6: #_RUINS_7D65: db $21 ; play note A4
#_0C99C7: #_RUINS_7D66: db $1D ; play note F4
#_0C99C8: #_RUINS_7D67: db $24 ; play note C5
#_0C99C9: #_RUINS_7D68: db $21 ; play note A4
#_0C99CA: #_RUINS_7D69: db $1C ; play note E4
#_0C99CB: #_RUINS_7D6A: db $1F ; play note G4
#_0C99CC: #_RUINS_7D6B: db $23 ; play note B4
#_0C99CD: #_RUINS_7D6C: db $26 ; play note D5
#_0C99CE: #_RUINS_7D6D: db $23 ; play note B4
#_0C99CF: #_RUINS_7D6E: db $1F ; play note G4
#_0C99D0: #_RUINS_7D6F: db $23 ; play note B4
#_0C99D1: #_RUINS_7D70: db $1F ; play note G4
#_0C99D2: #_RUINS_7D71: db $26 ; play note D5
#_0C99D3: #_RUINS_7D72: db $23 ; play note B4
#_0C99D4: #_RUINS_7D73: db $F5 ; run loop B
#_0C99D5: #_RUINS_7D74: db $1A ; play note D4
#_0C99D6: #_RUINS_7D75: db $1D ; play note F4
#_0C99D7: #_RUINS_7D76: db $21 ; play note A4
#_0C99D8: #_RUINS_7D77: db $24 ; play note C5
#_0C99D9: #_RUINS_7D78: db $21 ; play note A4
#_0C99DA: #_RUINS_7D79: db $1D ; play note F4
#_0C99DB: #_RUINS_7D7A: db $21 ; play note A4
#_0C99DC: #_RUINS_7D7B: db $1D ; play note F4
#_0C99DD: #_RUINS_7D7C: db $24 ; play note C5
#_0C99DE: #_RUINS_7D7D: db $21 ; play note A4
#_0C99DF: #_RUINS_7D7E: db $1C ; play note E4
#_0C99E0: #_RUINS_7D7F: db $1F ; play note G4
#_0C99E1: #_RUINS_7D80: db $23 ; play note B4
#_0C99E2: #_RUINS_7D81: db $26 ; play note D5
#_0C99E3: #_RUINS_7D82: db $23 ; play note B4
#_0C99E4: #_RUINS_7D83: db $1F ; play note G4
#_0C99E5: #_RUINS_7D84: db $23 ; play note B4
#_0C99E6: #_RUINS_7D85: db $1F ; play note G4
#_0C99E7: #_RUINS_7D86: db $26 ; play note D5
#_0C99E8: #_RUINS_7D87: db $23 ; play note B4
#_0C99E9: #_RUINS_7D88: db $1D ; play note F4
#_0C99EA: #_RUINS_7D89: db $21 ; play note A4
#_0C99EB: #_RUINS_7D8A: db $24 ; play note C5
#_0C99EC: #_RUINS_7D8B: db $28 ; play note E5
#_0C99ED: #_RUINS_7D8C: db $24 ; play note C5
#_0C99EE: #_RUINS_7D8D: db $21 ; play note A4
#_0C99EF: #_RUINS_7D8E: db $24 ; play note C5
#_0C99F0: #_RUINS_7D8F: db $21 ; play note A4
#_0C99F1: #_RUINS_7D90: db $28 ; play note E5
#_0C99F2: #_RUINS_7D91: db $24 ; play note C5
#_0C99F3: #_RUINS_7D92: db $1C ; play note E4
#_0C99F4: #_RUINS_7D93: db $1F ; play note G4
#_0C99F5: #_RUINS_7D94: db $23 ; play note B4
#_0C99F6: #_RUINS_7D95: db $26 ; play note D5
#_0C99F7: #_RUINS_7D96: db $23 ; play note B4
#_0C99F8: #_RUINS_7D97: db $1F ; play note G4
#_0C99F9: #_RUINS_7D98: db $23 ; play note B4
#_0C99FA: #_RUINS_7D99: db $1F ; play note G4
#_0C99FB: #_RUINS_7D9A: db $26 ; play note D5
#_0C99FC: #_RUINS_7D9B: db $23 ; play note B4
#_0C99FD: #_RUINS_7D9C: db $1A ; play note D4
#_0C99FE: #_RUINS_7D9D: db $1D ; play note F4
#_0C99FF: #_RUINS_7D9E: db $21 ; play note A4
#_0C9A00: #_RUINS_7D9F: db $24 ; play note C5
#_0C9A01: #_RUINS_7DA0: db $21 ; play note A4
#_0C9A02: #_RUINS_7DA1: db $1D ; play note F4
#_0C9A03: #_RUINS_7DA2: db $21 ; play note A4
#_0C9A04: #_RUINS_7DA3: db $1D ; play note F4
#_0C9A05: #_RUINS_7DA4: db $24 ; play note C5
#_0C9A06: #_RUINS_7DA5: db $21 ; play note A4
#_0C9A07: #_RUINS_7DA6: db $1C ; play note E4
#_0C9A08: #_RUINS_7DA7: db $1F ; play note G4
#_0C9A09: #_RUINS_7DA8: db $23 ; play note B4
#_0C9A0A: #_RUINS_7DA9: db $26 ; play note D5
#_0C9A0B: #_RUINS_7DAA: db $23 ; play note B4
#_0C9A0C: #_RUINS_7DAB: db $1F ; play note G4
#_0C9A0D: #_RUINS_7DAC: db $23 ; play note B4
#_0C9A0E: #_RUINS_7DAD: db $1F ; play note G4
#_0C9A0F: #_RUINS_7DAE: db $26 ; play note D5
#_0C9A10: #_RUINS_7DAF: db $23 ; play note B4
#_0C9A11: #_RUINS_7DB0: db $1D ; play note F4
#_0C9A12: #_RUINS_7DB1: db $21 ; play note A4
#_0C9A13: #_RUINS_7DB2: db $24 ; play note C5
#_0C9A14: #_RUINS_7DB3: db $28 ; play note E5
#_0C9A15: #_RUINS_7DB4: db $24 ; play note C5
#_0C9A16: #_RUINS_7DB5: db $21 ; play note A4
#_0C9A17: #_RUINS_7DB6: db $24 ; play note C5
#_0C9A18: #_RUINS_7DB7: db $21 ; play note A4
#_0C9A19: #_RUINS_7DB8: db $28 ; play note E5
#_0C9A1A: #_RUINS_7DB9: db $24 ; play note C5
#_0C9A1B: #_RUINS_7DBA: db $1F ; play note G4
#_0C9A1C: #_RUINS_7DBB: db $23 ; play note B4
#_0C9A1D: #_RUINS_7DBC: db $26 ; play note D5
#_0C9A1E: #_RUINS_7DBD: db $29 ; play note F5
#_0C9A1F: #_RUINS_7DBE: db $26 ; play note D5
#_0C9A20: #_RUINS_7DBF: db $23 ; play note B4
#_0C9A21: #_RUINS_7DC0: db $26 ; play note D5
#_0C9A22: #_RUINS_7DC1: db $23 ; play note B4
#_0C9A23: #_RUINS_7DC2: db $29 ; play note F5
#_0C9A24: #_RUINS_7DC3: db $26 ; play note D5
#_0C9A25: #_RUINS_7DC4: db $1D ; play note F4
#_0C9A26: #_RUINS_7DC5: db $21 ; play note A4
#_0C9A27: #_RUINS_7DC6: db $24 ; play note C5
#_0C9A28: #_RUINS_7DC7: db $28 ; play note E5
#_0C9A29: #_RUINS_7DC8: db $24 ; play note C5
#_0C9A2A: #_RUINS_7DC9: db $21 ; play note A4
#_0C9A2B: #_RUINS_7DCA: db $24 ; play note C5
#_0C9A2C: #_RUINS_7DCB: db $21 ; play note A4
#_0C9A2D: #_RUINS_7DCC: db $28 ; play note E5
#_0C9A2E: #_RUINS_7DCD: db $24 ; play note C5
#_0C9A2F: #_RUINS_7DCE: db $1C ; play note E4
#_0C9A30: #_RUINS_7DCF: db $1F ; play note G4
#_0C9A31: #_RUINS_7DD0: db $23 ; play note B4
#_0C9A32: #_RUINS_7DD1: db $26 ; play note D5
#_0C9A33: #_RUINS_7DD2: db $23 ; play note B4
#_0C9A34: #_RUINS_7DD3: db $1F ; play note G4
#_0C9A35: #_RUINS_7DD4: db $23 ; play note B4
#_0C9A36: #_RUINS_7DD5: db $1F ; play note G4
#_0C9A37: #_RUINS_7DD6: db $26 ; play note D5
#_0C9A38: #_RUINS_7DD7: db $23 ; play note B4
#_0C9A39: #_RUINS_7DD8: db $1A ; play note D4
#_0C9A3A: #_RUINS_7DD9: db $1D ; play note F4
#_0C9A3B: #_RUINS_7DDA: db $21 ; play note A4
#_0C9A3C: #_RUINS_7DDB: db $24 ; play note C5
#_0C9A3D: #_RUINS_7DDC: db $21 ; play note A4
#_0C9A3E: #_RUINS_7DDD: db $1D ; play note F4
#_0C9A3F: #_RUINS_7DDE: db $21 ; play note A4
#_0C9A40: #_RUINS_7DDF: db $1D ; play note F4
#_0C9A41: #_RUINS_7DE0: db $24 ; play note C5
#_0C9A42: #_RUINS_7DE1: db $21 ; play note A4
#_0C9A43: #_RUINS_7DE2: db $1C ; play note E4
#_0C9A44: #_RUINS_7DE3: db $1F ; play note G4
#_0C9A45: #_RUINS_7DE4: db $23 ; play note B4
#_0C9A46: #_RUINS_7DE5: db $26 ; play note D5
#_0C9A47: #_RUINS_7DE6: db $23 ; play note B4
#_0C9A48: #_RUINS_7DE7: db $1F ; play note G4
#_0C9A49: #_RUINS_7DE8: db $23 ; play note B4
#_0C9A4A: #_RUINS_7DE9: db $1F ; play note G4
#_0C9A4B: #_RUINS_7DEA: db $26 ; play note D5
#_0C9A4C: #_RUINS_7DEB: db $23 ; play note B4
#_0C9A4D: #_RUINS_7DEC: db $1D ; play note F4
#_0C9A4E: #_RUINS_7DED: db $21 ; play note A4
#_0C9A4F: #_RUINS_7DEE: db $24 ; play note C5
#_0C9A50: #_RUINS_7DEF: db $28 ; play note E5
#_0C9A51: #_RUINS_7DF0: db $24 ; play note C5
#_0C9A52: #_RUINS_7DF1: db $21 ; play note A4
#_0C9A53: #_RUINS_7DF2: db $24 ; play note C5
#_0C9A54: #_RUINS_7DF3: db $21 ; play note A4
#_0C9A55: #_RUINS_7DF4: db $28 ; play note E5
#_0C9A56: #_RUINS_7DF5: db $24 ; play note C5
#_0C9A57: #_RUINS_7DF6: db $1C ; play note E4
#_0C9A58: #_RUINS_7DF7: db $1F ; play note G4
#_0C9A59: #_RUINS_7DF8: db $23 ; play note B4
#_0C9A5A: #_RUINS_7DF9: db $26 ; play note D5
#_0C9A5B: #_RUINS_7DFA: db $23 ; play note B4
#_0C9A5C: #_RUINS_7DFB: db $1F ; play note G4
#_0C9A5D: #_RUINS_7DFC: db $23 ; play note B4
#_0C9A5E: #_RUINS_7DFD: db $1F ; play note G4
#_0C9A5F: #_RUINS_7DFE: db $26 ; play note D5
#_0C9A60: #_RUINS_7DFF: db $23 ; play note B4
#_0C9A61: #_RUINS_7E00: db $1A ; play note D4
#_0C9A62: #_RUINS_7E01: db $1D ; play note F4
#_0C9A63: #_RUINS_7E02: db $21 ; play note A4
#_0C9A64: #_RUINS_7E03: db $24 ; play note C5
#_0C9A65: #_RUINS_7E04: db $21 ; play note A4
#_0C9A66: #_RUINS_7E05: db $1D ; play note F4
#_0C9A67: #_RUINS_7E06: db $21 ; play note A4
#_0C9A68: #_RUINS_7E07: db $1D ; play note F4
#_0C9A69: #_RUINS_7E08: db $24 ; play note C5
#_0C9A6A: #_RUINS_7E09: db $21 ; play note A4
#_0C9A6B: #_RUINS_7E0A: db $1C ; play note E4
#_0C9A6C: #_RUINS_7E0B: db $20 ; play note Gs4
#_0C9A6D: #_RUINS_7E0C: db $23 ; play note B4
#_0C9A6E: #_RUINS_7E0D: db $26 ; play note D5
#_0C9A6F: #_RUINS_7E0E: db $23 ; play note B4
#_0C9A70: #_RUINS_7E0F: db $20 ; play note Gs4
#_0C9A71: #_RUINS_7E10: db $23 ; play note B4
#_0C9A72: #_RUINS_7E11: db $20 ; play note Gs4
#_0C9A73: #_RUINS_7E12: db $26 ; play note D5
#_0C9A74: #_RUINS_7E13: db $23 ; play note B4
#_0C9A75: #_RUINS_7E14: db $F8 : dw RUINS_SEGMENT_7D49 ; goto location

RUINS_SEGMENT_7E17:
#_0C9A78: #_RUINS_7E17: db $70 ; vol 0x10
#_0C9A79: #_RUINS_7E18: db $F0, $FE, $F2 ; set ADSR
#_0C9A7C: #_RUINS_7E1B: db $F1, $02 ; set SRCN
#_0C9A7E: #_RUINS_7E1D: db $F2, $4C ; set panning
#_0C9A80: #_RUINS_7E1F: db $FB, $10 ; set note length page

RUINS_SEGMENT_7E21:
#_0C9A82: #_RUINS_7E21: db $F4, $04 ; set loop point B
#_0C9A84: #_RUINS_7E23: db $89 ; dur 0x09
#_0C9A85: #_RUINS_7E24: db $1A ; play note D4
#_0C9A86: #_RUINS_7E25: db $86 ; dur 0x06
#_0C9A87: #_RUINS_7E26: db $1A ; play note D4
#_0C9A88: #_RUINS_7E27: db $88 ; dur 0x08
#_0C9A89: #_RUINS_7E28: db $1A ; play note D4
#_0C9A8A: #_RUINS_7E29: db $21 ; play note A4
#_0C9A8B: #_RUINS_7E2A: db $1D ; play note F4
#_0C9A8C: #_RUINS_7E2B: db $89 ; dur 0x09
#_0C9A8D: #_RUINS_7E2C: db $18 ; play note C4
#_0C9A8E: #_RUINS_7E2D: db $86 ; dur 0x06
#_0C9A8F: #_RUINS_7E2E: db $18 ; play note C4
#_0C9A90: #_RUINS_7E2F: db $88 ; dur 0x08
#_0C9A91: #_RUINS_7E30: db $18 ; play note C4
#_0C9A92: #_RUINS_7E31: db $1F ; play note G4
#_0C9A93: #_RUINS_7E32: db $1C ; play note E4
#_0C9A94: #_RUINS_7E33: db $89 ; dur 0x09
#_0C9A95: #_RUINS_7E34: db $1A ; play note D4
#_0C9A96: #_RUINS_7E35: db $86 ; dur 0x06
#_0C9A97: #_RUINS_7E36: db $1A ; play note D4
#_0C9A98: #_RUINS_7E37: db $88 ; dur 0x08
#_0C9A99: #_RUINS_7E38: db $1A ; play note D4
#_0C9A9A: #_RUINS_7E39: db $21 ; play note A4
#_0C9A9B: #_RUINS_7E3A: db $1D ; play note F4
#_0C9A9C: #_RUINS_7E3B: db $89 ; dur 0x09
#_0C9A9D: #_RUINS_7E3C: db $1C ; play note E4
#_0C9A9E: #_RUINS_7E3D: db $86 ; dur 0x06
#_0C9A9F: #_RUINS_7E3E: db $1C ; play note E4
#_0C9AA0: #_RUINS_7E3F: db $88 ; dur 0x08
#_0C9AA1: #_RUINS_7E40: db $1C ; play note E4
#_0C9AA2: #_RUINS_7E41: db $23 ; play note B4
#_0C9AA3: #_RUINS_7E42: db $1F ; play note G4
#_0C9AA4: #_RUINS_7E43: db $F5 ; run loop B
#_0C9AA5: #_RUINS_7E44: db $89 ; dur 0x09
#_0C9AA6: #_RUINS_7E45: db $1A ; play note D4
#_0C9AA7: #_RUINS_7E46: db $86 ; dur 0x06
#_0C9AA8: #_RUINS_7E47: db $1A ; play note D4
#_0C9AA9: #_RUINS_7E48: db $88 ; dur 0x08
#_0C9AAA: #_RUINS_7E49: db $1A ; play note D4
#_0C9AAB: #_RUINS_7E4A: db $21 ; play note A4
#_0C9AAC: #_RUINS_7E4B: db $1D ; play note F4
#_0C9AAD: #_RUINS_7E4C: db $89 ; dur 0x09
#_0C9AAE: #_RUINS_7E4D: db $1C ; play note E4
#_0C9AAF: #_RUINS_7E4E: db $86 ; dur 0x06
#_0C9AB0: #_RUINS_7E4F: db $1C ; play note E4
#_0C9AB1: #_RUINS_7E50: db $88 ; dur 0x08
#_0C9AB2: #_RUINS_7E51: db $1C ; play note E4
#_0C9AB3: #_RUINS_7E52: db $23 ; play note B4
#_0C9AB4: #_RUINS_7E53: db $1F ; play note G4
#_0C9AB5: #_RUINS_7E54: db $89 ; dur 0x09
#_0C9AB6: #_RUINS_7E55: db $1D ; play note F4
#_0C9AB7: #_RUINS_7E56: db $86 ; dur 0x06
#_0C9AB8: #_RUINS_7E57: db $1D ; play note F4
#_0C9AB9: #_RUINS_7E58: db $88 ; dur 0x08
#_0C9ABA: #_RUINS_7E59: db $1D ; play note F4
#_0C9ABB: #_RUINS_7E5A: db $24 ; play note C5
#_0C9ABC: #_RUINS_7E5B: db $21 ; play note A4
#_0C9ABD: #_RUINS_7E5C: db $89 ; dur 0x09
#_0C9ABE: #_RUINS_7E5D: db $1C ; play note E4
#_0C9ABF: #_RUINS_7E5E: db $86 ; dur 0x06
#_0C9AC0: #_RUINS_7E5F: db $1C ; play note E4
#_0C9AC1: #_RUINS_7E60: db $88 ; dur 0x08
#_0C9AC2: #_RUINS_7E61: db $1C ; play note E4
#_0C9AC3: #_RUINS_7E62: db $23 ; play note B4
#_0C9AC4: #_RUINS_7E63: db $1F ; play note G4
#_0C9AC5: #_RUINS_7E64: db $89 ; dur 0x09
#_0C9AC6: #_RUINS_7E65: db $1A ; play note D4
#_0C9AC7: #_RUINS_7E66: db $86 ; dur 0x06
#_0C9AC8: #_RUINS_7E67: db $1A ; play note D4
#_0C9AC9: #_RUINS_7E68: db $88 ; dur 0x08
#_0C9ACA: #_RUINS_7E69: db $1A ; play note D4
#_0C9ACB: #_RUINS_7E6A: db $21 ; play note A4
#_0C9ACC: #_RUINS_7E6B: db $1D ; play note F4
#_0C9ACD: #_RUINS_7E6C: db $89 ; dur 0x09
#_0C9ACE: #_RUINS_7E6D: db $1C ; play note E4
#_0C9ACF: #_RUINS_7E6E: db $86 ; dur 0x06
#_0C9AD0: #_RUINS_7E6F: db $1C ; play note E4
#_0C9AD1: #_RUINS_7E70: db $88 ; dur 0x08
#_0C9AD2: #_RUINS_7E71: db $1C ; play note E4
#_0C9AD3: #_RUINS_7E72: db $23 ; play note B4
#_0C9AD4: #_RUINS_7E73: db $1F ; play note G4
#_0C9AD5: #_RUINS_7E74: db $89 ; dur 0x09
#_0C9AD6: #_RUINS_7E75: db $1D ; play note F4
#_0C9AD7: #_RUINS_7E76: db $86 ; dur 0x06
#_0C9AD8: #_RUINS_7E77: db $1D ; play note F4
#_0C9AD9: #_RUINS_7E78: db $88 ; dur 0x08
#_0C9ADA: #_RUINS_7E79: db $1D ; play note F4
#_0C9ADB: #_RUINS_7E7A: db $24 ; play note C5
#_0C9ADC: #_RUINS_7E7B: db $21 ; play note A4
#_0C9ADD: #_RUINS_7E7C: db $89 ; dur 0x09
#_0C9ADE: #_RUINS_7E7D: db $1F ; play note G4
#_0C9ADF: #_RUINS_7E7E: db $86 ; dur 0x06
#_0C9AE0: #_RUINS_7E7F: db $1F ; play note G4
#_0C9AE1: #_RUINS_7E80: db $88 ; dur 0x08
#_0C9AE2: #_RUINS_7E81: db $1F ; play note G4
#_0C9AE3: #_RUINS_7E82: db $1A ; play note D4
#_0C9AE4: #_RUINS_7E83: db $17 ; play note B3
#_0C9AE5: #_RUINS_7E84: db $89 ; dur 0x09
#_0C9AE6: #_RUINS_7E85: db $1D ; play note F4
#_0C9AE7: #_RUINS_7E86: db $86 ; dur 0x06
#_0C9AE8: #_RUINS_7E87: db $1D ; play note F4
#_0C9AE9: #_RUINS_7E88: db $88 ; dur 0x08
#_0C9AEA: #_RUINS_7E89: db $1D ; play note F4
#_0C9AEB: #_RUINS_7E8A: db $24 ; play note C5
#_0C9AEC: #_RUINS_7E8B: db $21 ; play note A4
#_0C9AED: #_RUINS_7E8C: db $89 ; dur 0x09
#_0C9AEE: #_RUINS_7E8D: db $1C ; play note E4
#_0C9AEF: #_RUINS_7E8E: db $86 ; dur 0x06
#_0C9AF0: #_RUINS_7E8F: db $1C ; play note E4
#_0C9AF1: #_RUINS_7E90: db $88 ; dur 0x08
#_0C9AF2: #_RUINS_7E91: db $1C ; play note E4
#_0C9AF3: #_RUINS_7E92: db $23 ; play note B4
#_0C9AF4: #_RUINS_7E93: db $1F ; play note G4
#_0C9AF5: #_RUINS_7E94: db $89 ; dur 0x09
#_0C9AF6: #_RUINS_7E95: db $1A ; play note D4
#_0C9AF7: #_RUINS_7E96: db $86 ; dur 0x06
#_0C9AF8: #_RUINS_7E97: db $1A ; play note D4
#_0C9AF9: #_RUINS_7E98: db $88 ; dur 0x08
#_0C9AFA: #_RUINS_7E99: db $1A ; play note D4
#_0C9AFB: #_RUINS_7E9A: db $21 ; play note A4
#_0C9AFC: #_RUINS_7E9B: db $1D ; play note F4
#_0C9AFD: #_RUINS_7E9C: db $89 ; dur 0x09
#_0C9AFE: #_RUINS_7E9D: db $1C ; play note E4
#_0C9AFF: #_RUINS_7E9E: db $86 ; dur 0x06
#_0C9B00: #_RUINS_7E9F: db $1C ; play note E4
#_0C9B01: #_RUINS_7EA0: db $88 ; dur 0x08
#_0C9B02: #_RUINS_7EA1: db $1C ; play note E4
#_0C9B03: #_RUINS_7EA2: db $23 ; play note B4
#_0C9B04: #_RUINS_7EA3: db $1F ; play note G4
#_0C9B05: #_RUINS_7EA4: db $89 ; dur 0x09
#_0C9B06: #_RUINS_7EA5: db $1D ; play note F4
#_0C9B07: #_RUINS_7EA6: db $86 ; dur 0x06
#_0C9B08: #_RUINS_7EA7: db $1D ; play note F4
#_0C9B09: #_RUINS_7EA8: db $88 ; dur 0x08
#_0C9B0A: #_RUINS_7EA9: db $1D ; play note F4
#_0C9B0B: #_RUINS_7EAA: db $24 ; play note C5
#_0C9B0C: #_RUINS_7EAB: db $21 ; play note A4
#_0C9B0D: #_RUINS_7EAC: db $89 ; dur 0x09
#_0C9B0E: #_RUINS_7EAD: db $1C ; play note E4
#_0C9B0F: #_RUINS_7EAE: db $86 ; dur 0x06
#_0C9B10: #_RUINS_7EAF: db $1C ; play note E4
#_0C9B11: #_RUINS_7EB0: db $88 ; dur 0x08
#_0C9B12: #_RUINS_7EB1: db $1C ; play note E4
#_0C9B13: #_RUINS_7EB2: db $23 ; play note B4
#_0C9B14: #_RUINS_7EB3: db $1F ; play note G4
#_0C9B15: #_RUINS_7EB4: db $89 ; dur 0x09
#_0C9B16: #_RUINS_7EB5: db $1A ; play note D4
#_0C9B17: #_RUINS_7EB6: db $86 ; dur 0x06
#_0C9B18: #_RUINS_7EB7: db $1A ; play note D4
#_0C9B19: #_RUINS_7EB8: db $88 ; dur 0x08
#_0C9B1A: #_RUINS_7EB9: db $1A ; play note D4
#_0C9B1B: #_RUINS_7EBA: db $21 ; play note A4
#_0C9B1C: #_RUINS_7EBB: db $1D ; play note F4
#_0C9B1D: #_RUINS_7EBC: db $89 ; dur 0x09
#_0C9B1E: #_RUINS_7EBD: db $1C ; play note E4
#_0C9B1F: #_RUINS_7EBE: db $86 ; dur 0x06
#_0C9B20: #_RUINS_7EBF: db $1C ; play note E4
#_0C9B21: #_RUINS_7EC0: db $88 ; dur 0x08
#_0C9B22: #_RUINS_7EC1: db $1C ; play note E4
#_0C9B23: #_RUINS_7EC2: db $23 ; play note B4
#_0C9B24: #_RUINS_7EC3: db $20 ; play note Gs4
#_0C9B25: #_RUINS_7EC4: db $F8 : dw RUINS_SEGMENT_7E21 ; goto location

RUINS_SEGMENT_7EC7:
#_0C9B28: #_RUINS_7EC7: db $70 ; vol 0x10
#_0C9B29: #_RUINS_7EC8: db $F0, $FF, $E0 ; set ADSR
#_0C9B2C: #_RUINS_7ECB: db $F2, $44 ; set panning
#_0C9B2E: #_RUINS_7ECD: db $FB, $10 ; set note length page

RUINS_SEGMENT_7ECF:
#_0C9B30: #_RUINS_7ECF: db $F1, $00 ; set SRCN
#_0C9B32: #_RUINS_7ED1: db $89 ; dur 0x09
#_0C9B33: #_RUINS_7ED2: db $18 ; play note C4
#_0C9B34: #_RUINS_7ED3: db $86 ; dur 0x06
#_0C9B35: #_RUINS_7ED4: db $18 ; play note C4
#_0C9B36: #_RUINS_7ED5: db $88 ; dur 0x08
#_0C9B37: #_RUINS_7ED6: db $18 ; play note C4
#_0C9B38: #_RUINS_7ED7: db $F1, $01 ; set SRCN
#_0C9B3A: #_RUINS_7ED9: db $18 ; play note C4
#_0C9B3B: #_RUINS_7EDA: db $18 ; play note C4
#_0C9B3C: #_RUINS_7EDB: db $F8 : dw RUINS_SEGMENT_7ECF ; goto location

;===================================================================================================
; 
;===================================================================================================
Shop_SPC_Data:
#_0C9B3F: dw $01E7, $0000

SONG_SHOP:
#_0C9B43: #_SHOP_7800: db $F1, $00 ; Set control
#_0C9B45: #_SHOP_7802: db $00 : dw SHOP_SEGMENT_781B ; Music channel 0
#_0C9B48: #_SHOP_7805: db $01 : dw SHOP_SEGMENT_7866 ; Music channel 1
#_0C9B4B: #_SHOP_7808: db $02 : dw SHOP_SEGMENT_788C ; Music channel 2
#_0C9B4E: #_SHOP_780B: db $03 : dw SHOP_SEGMENT_78B2 ; Music channel 3
#_0C9B51: #_SHOP_780E: db $04 : dw SHOP_SEGMENT_78D8 ; Music channel 4
#_0C9B54: #_SHOP_7811: db $05 : dw SHOP_SEGMENT_7927 ; Music channel 5
#_0C9B57: #_SHOP_7814: db $06 : dw SHOP_SEGMENT_7931 ; Music channel 6
#_0C9B5A: #_SHOP_7817: db $07 : dw SHOP_SEGMENT_7972 ; Music channel 7
#_0C9B5D: #_SHOP_781A: db $FF ; end of header

SHOP_SEGMENT_781B:
#_0C9B5E: #_SHOP_781B: db $F2, $58 ; set panning
#_0C9B60: #_SHOP_781D: db $70 ; vol 0x10
#_0C9B61: #_SHOP_781E: db $F0, $FF, $F2 ; set ADSR
#_0C9B64: #_SHOP_7821: db $F1, $09 ; set SRCN
#_0C9B66: #_SHOP_7823: db $8E ; dur 0x0E
#_0C9B67: #_SHOP_7824: db $F4, $10 ; set loop point B
#_0C9B69: #_SHOP_7826: db $30 ; rest
#_0C9B6A: #_SHOP_7827: db $F5 ; run loop B

SHOP_SEGMENT_7828:
#_0C9B6B: #_SHOP_7828: db $F3, $00 ; transpose +0
#_0C9B6D: #_SHOP_782A: db $F6 : dw SHOP_SEGMENT_7835 ; subroutine B
#_0C9B70: #_SHOP_782D: db $F3, $0C ; transpose +12
#_0C9B72: #_SHOP_782F: db $F6 : dw SHOP_SEGMENT_7835 ; subroutine B
#_0C9B75: #_SHOP_7832: db $F8 : dw SHOP_SEGMENT_7828 ; goto location

SHOP_SEGMENT_7835:
#_0C9B78: #_SHOP_7835: db $E4, $02 ; set loop point A
#_0C9B7A: #_SHOP_7837: db $F4, $02 ; set loop point B
#_0C9B7C: #_SHOP_7839: db $88 ; dur 0x08
#_0C9B7D: #_SHOP_783A: db $13 ; play note G3
#_0C9B7E: #_SHOP_783B: db $16 ; play note As3
#_0C9B7F: #_SHOP_783C: db $18 ; play note C4
#_0C9B80: #_SHOP_783D: db $86 ; dur 0x06
#_0C9B81: #_SHOP_783E: db $13 ; play note G3
#_0C9B82: #_SHOP_783F: db $88 ; dur 0x08
#_0C9B83: #_SHOP_7840: db $16 ; play note As3
#_0C9B84: #_SHOP_7841: db $18 ; play note C4
#_0C9B85: #_SHOP_7842: db $86 ; dur 0x06
#_0C9B86: #_SHOP_7843: db $13 ; play note G3
#_0C9B87: #_SHOP_7844: db $88 ; dur 0x08
#_0C9B88: #_SHOP_7845: db $16 ; play note As3
#_0C9B89: #_SHOP_7846: db $18 ; play note C4
#_0C9B8A: #_SHOP_7847: db $F5 ; run loop B
#_0C9B8B: #_SHOP_7848: db $F0, $FF, $E4 ; set ADSR
#_0C9B8E: #_SHOP_784B: db $89 ; dur 0x09
#_0C9B8F: #_SHOP_784C: db $1D ; play note F4
#_0C9B90: #_SHOP_784D: db $F0, $FF, $F2 ; set ADSR
#_0C9B93: #_SHOP_7850: db $86 ; dur 0x06
#_0C9B94: #_SHOP_7851: db $1C ; play note E4
#_0C9B95: #_SHOP_7852: db $8C ; dur 0x0C
#_0C9B96: #_SHOP_7853: db $31 ; tie
#_0C9B97: #_SHOP_7854: db $F0, $FF, $E4 ; set ADSR
#_0C9B9A: #_SHOP_7857: db $89 ; dur 0x09
#_0C9B9B: #_SHOP_7858: db $18 ; play note C4
#_0C9B9C: #_SHOP_7859: db $F0, $FF, $F2 ; set ADSR
#_0C9B9F: #_SHOP_785C: db $86 ; dur 0x06
#_0C9BA0: #_SHOP_785D: db $16 ; play note As3
#_0C9BA1: #_SHOP_785E: db $8E ; dur 0x0E
#_0C9BA2: #_SHOP_785F: db $31 ; tie
#_0C9BA3: #_SHOP_7860: db $E5 ; run loop A
#_0C9BA4: #_SHOP_7861: db $F4, $08 ; set loop point B
#_0C9BA6: #_SHOP_7863: db $30 ; rest
#_0C9BA7: #_SHOP_7864: db $F5 ; run loop B
#_0C9BA8: #_SHOP_7865: db $F7 ; return from routine B

SHOP_SEGMENT_7866:
#_0C9BA9: #_SHOP_7866: db $F2, $64 ; set panning

SHOP_SEGMENT_7868:
#_0C9BAB: #_SHOP_7868: db $8E ; dur 0x0E
#_0C9BAC: #_SHOP_7869: db $30 ; rest
#_0C9BAD: #_SHOP_786A: db $30 ; rest
#_0C9BAE: #_SHOP_786B: db $30 ; rest
#_0C9BAF: #_SHOP_786C: db $30 ; rest
#_0C9BB0: #_SHOP_786D: db $70 ; vol 0x10
#_0C9BB1: #_SHOP_786E: db $F1, $08 ; set SRCN
#_0C9BB3: #_SHOP_7870: db $F3, $FF ; transpose -1
#_0C9BB5: #_SHOP_7872: db $F0, $FD, $F2 ; set ADSR

SHOP_SEGMENT_7875:
#_0C9BB8: #_SHOP_7875: db $F4, $04 ; set loop point B
#_0C9BBA: #_SHOP_7877: db $8A ; dur 0x0A
#_0C9BBB: #_SHOP_7878: db $24 ; play note C5
#_0C9BBC: #_SHOP_7879: db $F0, $FD, $E4 ; set ADSR
#_0C9BBF: #_SHOP_787C: db $89 ; dur 0x09
#_0C9BC0: #_SHOP_787D: db $24 ; play note C5
#_0C9BC1: #_SHOP_787E: db $F0, $FD, $F2 ; set ADSR
#_0C9BC4: #_SHOP_7881: db $86 ; dur 0x06
#_0C9BC5: #_SHOP_7882: db $22 ; play note As4
#_0C9BC6: #_SHOP_7883: db $8C ; dur 0x0C
#_0C9BC7: #_SHOP_7884: db $31 ; tie
#_0C9BC8: #_SHOP_7885: db $8E ; dur 0x0E
#_0C9BC9: #_SHOP_7886: db $31 ; tie
#_0C9BCA: #_SHOP_7887: db $F5 ; run loop B
#_0C9BCB: #_SHOP_7888: db $F8 : dw SHOP_SEGMENT_7875 ; goto location
#_0C9BCE: #_SHOP_788B: db $FF ; end track

SHOP_SEGMENT_788C:
#_0C9BCF: #_SHOP_788C: db $8E ; dur 0x0E
#_0C9BD0: #_SHOP_788D: db $30 ; rest
#_0C9BD1: #_SHOP_788E: db $30 ; rest
#_0C9BD2: #_SHOP_788F: db $30 ; rest
#_0C9BD3: #_SHOP_7890: db $30 ; rest
#_0C9BD4: #_SHOP_7891: db $62 ; vol 0x02
#_0C9BD5: #_SHOP_7892: db $F1, $08 ; set SRCN
#_0C9BD7: #_SHOP_7894: db $F2, $64 ; set panning
#_0C9BD9: #_SHOP_7896: db $F3, $FF ; transpose -1
#_0C9BDB: #_SHOP_7898: db $F0, $FD, $F2 ; set ADSR

SHOP_SEGMENT_789B:
#_0C9BDE: #_SHOP_789B: db $F4, $04 ; set loop point B
#_0C9BE0: #_SHOP_789D: db $8A ; dur 0x0A
#_0C9BE1: #_SHOP_789E: db $1F ; play note G4
#_0C9BE2: #_SHOP_789F: db $F0, $FD, $E4 ; set ADSR
#_0C9BE5: #_SHOP_78A2: db $89 ; dur 0x09
#_0C9BE6: #_SHOP_78A3: db $1F ; play note G4
#_0C9BE7: #_SHOP_78A4: db $F0, $FD, $F2 ; set ADSR
#_0C9BEA: #_SHOP_78A7: db $86 ; dur 0x06
#_0C9BEB: #_SHOP_78A8: db $1D ; play note F4
#_0C9BEC: #_SHOP_78A9: db $8C ; dur 0x0C
#_0C9BED: #_SHOP_78AA: db $31 ; tie
#_0C9BEE: #_SHOP_78AB: db $8E ; dur 0x0E
#_0C9BEF: #_SHOP_78AC: db $31 ; tie
#_0C9BF0: #_SHOP_78AD: db $F5 ; run loop B
#_0C9BF1: #_SHOP_78AE: db $F8 : dw SHOP_SEGMENT_789B ; goto location
#_0C9BF4: #_SHOP_78B1: db $FF ; end track

SHOP_SEGMENT_78B2:
#_0C9BF5: #_SHOP_78B2: db $8E ; dur 0x0E
#_0C9BF6: #_SHOP_78B3: db $30 ; rest
#_0C9BF7: #_SHOP_78B4: db $30 ; rest
#_0C9BF8: #_SHOP_78B5: db $30 ; rest
#_0C9BF9: #_SHOP_78B6: db $30 ; rest
#_0C9BFA: #_SHOP_78B7: db $72 ; vol 0x12
#_0C9BFB: #_SHOP_78B8: db $F1, $08 ; set SRCN
#_0C9BFD: #_SHOP_78BA: db $F2, $64 ; set panning
#_0C9BFF: #_SHOP_78BC: db $F3, $FF ; transpose -1
#_0C9C01: #_SHOP_78BE: db $F0, $FD, $F2 ; set ADSR

SHOP_SEGMENT_78C1:
#_0C9C04: #_SHOP_78C1: db $F4, $04 ; set loop point B
#_0C9C06: #_SHOP_78C3: db $8A ; dur 0x0A
#_0C9C07: #_SHOP_78C4: db $1C ; play note E4
#_0C9C08: #_SHOP_78C5: db $F0, $FD, $E4 ; set ADSR
#_0C9C0B: #_SHOP_78C8: db $89 ; dur 0x09
#_0C9C0C: #_SHOP_78C9: db $1C ; play note E4
#_0C9C0D: #_SHOP_78CA: db $F0, $FD, $F2 ; set ADSR
#_0C9C10: #_SHOP_78CD: db $86 ; dur 0x06
#_0C9C11: #_SHOP_78CE: db $1A ; play note D4
#_0C9C12: #_SHOP_78CF: db $8C ; dur 0x0C
#_0C9C13: #_SHOP_78D0: db $31 ; tie
#_0C9C14: #_SHOP_78D1: db $8E ; dur 0x0E
#_0C9C15: #_SHOP_78D2: db $31 ; tie
#_0C9C16: #_SHOP_78D3: db $F5 ; run loop B
#_0C9C17: #_SHOP_78D4: db $F8 : dw SHOP_SEGMENT_78C1 ; goto location
#_0C9C1A: #_SHOP_78D7: db $FF ; end track

SHOP_SEGMENT_78D8:
#_0C9C1B: #_SHOP_78D8: db $87 ; dur 0x07
#_0C9C1C: #_SHOP_78D9: db $30 ; rest
#_0C9C1D: #_SHOP_78DA: db $F9, $20 ; set fine tuning
#_0C9C1F: #_SHOP_78DC: db $F2, $6C ; set panning
#_0C9C21: #_SHOP_78DE: db $70 ; vol 0x10
#_0C9C22: #_SHOP_78DF: db $F0, $FA, $F2 ; set ADSR
#_0C9C25: #_SHOP_78E2: db $F1, $09 ; set SRCN
#_0C9C27: #_SHOP_78E4: db $8E ; dur 0x0E
#_0C9C28: #_SHOP_78E5: db $F4, $10 ; set loop point B
#_0C9C2A: #_SHOP_78E7: db $30 ; rest
#_0C9C2B: #_SHOP_78E8: db $F5 ; run loop B
#_0C9C2C: #_SHOP_78E9: db $F3, $00 ; transpose +0
#_0C9C2E: #_SHOP_78EB: db $F6 : dw SHOP_SEGMENT_78F6 ; subroutine B
#_0C9C31: #_SHOP_78EE: db $F3, $0C ; transpose +12
#_0C9C33: #_SHOP_78F0: db $F6 : dw SHOP_SEGMENT_78F6 ; subroutine B
#_0C9C36: #_SHOP_78F3: db $F8 : dw SHOP_SEGMENT_7828 ; goto location

SHOP_SEGMENT_78F6:
#_0C9C39: #_SHOP_78F6: db $E4, $02 ; set loop point A
#_0C9C3B: #_SHOP_78F8: db $F4, $02 ; set loop point B
#_0C9C3D: #_SHOP_78FA: db $88 ; dur 0x08
#_0C9C3E: #_SHOP_78FB: db $13 ; play note G3
#_0C9C3F: #_SHOP_78FC: db $16 ; play note As3
#_0C9C40: #_SHOP_78FD: db $18 ; play note C4
#_0C9C41: #_SHOP_78FE: db $86 ; dur 0x06
#_0C9C42: #_SHOP_78FF: db $13 ; play note G3
#_0C9C43: #_SHOP_7900: db $88 ; dur 0x08
#_0C9C44: #_SHOP_7901: db $16 ; play note As3
#_0C9C45: #_SHOP_7902: db $18 ; play note C4
#_0C9C46: #_SHOP_7903: db $86 ; dur 0x06
#_0C9C47: #_SHOP_7904: db $13 ; play note G3
#_0C9C48: #_SHOP_7905: db $88 ; dur 0x08
#_0C9C49: #_SHOP_7906: db $16 ; play note As3
#_0C9C4A: #_SHOP_7907: db $18 ; play note C4
#_0C9C4B: #_SHOP_7908: db $F5 ; run loop B
#_0C9C4C: #_SHOP_7909: db $F0, $FA, $E4 ; set ADSR
#_0C9C4F: #_SHOP_790C: db $89 ; dur 0x09
#_0C9C50: #_SHOP_790D: db $1D ; play note F4
#_0C9C51: #_SHOP_790E: db $F0, $FA, $F2 ; set ADSR
#_0C9C54: #_SHOP_7911: db $86 ; dur 0x06
#_0C9C55: #_SHOP_7912: db $1C ; play note E4
#_0C9C56: #_SHOP_7913: db $8C ; dur 0x0C
#_0C9C57: #_SHOP_7914: db $31 ; tie
#_0C9C58: #_SHOP_7915: db $F0, $FA, $E4 ; set ADSR
#_0C9C5B: #_SHOP_7918: db $89 ; dur 0x09
#_0C9C5C: #_SHOP_7919: db $18 ; play note C4
#_0C9C5D: #_SHOP_791A: db $F0, $FA, $F2 ; set ADSR
#_0C9C60: #_SHOP_791D: db $86 ; dur 0x06
#_0C9C61: #_SHOP_791E: db $16 ; play note As3
#_0C9C62: #_SHOP_791F: db $8E ; dur 0x0E
#_0C9C63: #_SHOP_7920: db $31 ; tie
#_0C9C64: #_SHOP_7921: db $E5 ; run loop A
#_0C9C65: #_SHOP_7922: db $F4, $08 ; set loop point B
#_0C9C67: #_SHOP_7924: db $30 ; rest
#_0C9C68: #_SHOP_7925: db $F5 ; run loop B
#_0C9C69: #_SHOP_7926: db $F7 ; return from routine B

SHOP_SEGMENT_7927:
#_0C9C6A: #_SHOP_7927: db $87 ; dur 0x07
#_0C9C6B: #_SHOP_7928: db $30 ; rest
#_0C9C6C: #_SHOP_7929: db $F2, $6C ; set panning
#_0C9C6E: #_SHOP_792B: db $F9, $10 ; set fine tuning
#_0C9C70: #_SHOP_792D: db $F8 : dw SHOP_SEGMENT_7868 ; goto location
#_0C9C73: #_SHOP_7930: db $FF ; end track

SHOP_SEGMENT_7931:
#_0C9C74: #_SHOP_7931: db $70 ; vol 0x10
#_0C9C75: #_SHOP_7932: db $F0, $FF, $F2 ; set ADSR
#_0C9C78: #_SHOP_7935: db $F1, $02 ; set SRCN
#_0C9C7A: #_SHOP_7937: db $F2, $4C ; set panning

SHOP_SEGMENT_7939:
#_0C9C7C: #_SHOP_7939: db $F4, $03 ; set loop point B
#_0C9C7E: #_SHOP_793B: db $88 ; dur 0x08
#_0C9C7F: #_SHOP_793C: db $18 ; play note C4
#_0C9C80: #_SHOP_793D: db $30 ; rest
#_0C9C81: #_SHOP_793E: db $89 ; dur 0x09
#_0C9C82: #_SHOP_793F: db $18 ; play note C4
#_0C9C83: #_SHOP_7940: db $86 ; dur 0x06
#_0C9C84: #_SHOP_7941: db $16 ; play note As3
#_0C9C85: #_SHOP_7942: db $8C ; dur 0x0C
#_0C9C86: #_SHOP_7943: db $30 ; rest
#_0C9C87: #_SHOP_7944: db $88 ; dur 0x08
#_0C9C88: #_SHOP_7945: db $18 ; play note C4
#_0C9C89: #_SHOP_7946: db $30 ; rest
#_0C9C8A: #_SHOP_7947: db $89 ; dur 0x09
#_0C9C8B: #_SHOP_7948: db $18 ; play note C4
#_0C9C8C: #_SHOP_7949: db $86 ; dur 0x06
#_0C9C8D: #_SHOP_794A: db $16 ; play note As3
#_0C9C8E: #_SHOP_794B: db $86 ; dur 0x06
#_0C9C8F: #_SHOP_794C: db $31 ; tie
#_0C9C90: #_SHOP_794D: db $13 ; play note G3
#_0C9C91: #_SHOP_794E: db $30 ; rest
#_0C9C92: #_SHOP_794F: db $13 ; play note G3
#_0C9C93: #_SHOP_7950: db $16 ; play note As3
#_0C9C94: #_SHOP_7951: db $16 ; play note As3
#_0C9C95: #_SHOP_7952: db $88 ; dur 0x08
#_0C9C96: #_SHOP_7953: db $17 ; play note B3
#_0C9C97: #_SHOP_7954: db $F5 ; run loop B
#_0C9C98: #_SHOP_7955: db $88 ; dur 0x08
#_0C9C99: #_SHOP_7956: db $18 ; play note C4
#_0C9C9A: #_SHOP_7957: db $30 ; rest
#_0C9C9B: #_SHOP_7958: db $89 ; dur 0x09
#_0C9C9C: #_SHOP_7959: db $18 ; play note C4
#_0C9C9D: #_SHOP_795A: db $86 ; dur 0x06
#_0C9C9E: #_SHOP_795B: db $16 ; play note As3
#_0C9C9F: #_SHOP_795C: db $8C ; dur 0x0C
#_0C9CA0: #_SHOP_795D: db $30 ; rest
#_0C9CA1: #_SHOP_795E: db $88 ; dur 0x08
#_0C9CA2: #_SHOP_795F: db $18 ; play note C4
#_0C9CA3: #_SHOP_7960: db $30 ; rest
#_0C9CA4: #_SHOP_7961: db $89 ; dur 0x09
#_0C9CA5: #_SHOP_7962: db $18 ; play note C4
#_0C9CA6: #_SHOP_7963: db $86 ; dur 0x06
#_0C9CA7: #_SHOP_7964: db $16 ; play note As3
#_0C9CA8: #_SHOP_7965: db $86 ; dur 0x06
#_0C9CA9: #_SHOP_7966: db $31 ; tie
#_0C9CAA: #_SHOP_7967: db $1D ; play note F4
#_0C9CAB: #_SHOP_7968: db $1F ; play note G4
#_0C9CAC: #_SHOP_7969: db $1B ; play note Ds4
#_0C9CAD: #_SHOP_796A: db $1A ; play note D4
#_0C9CAE: #_SHOP_796B: db $1B ; play note Ds4
#_0C9CAF: #_SHOP_796C: db $16 ; play note As3
#_0C9CB0: #_SHOP_796D: db $17 ; play note B3
#_0C9CB1: #_SHOP_796E: db $F8 : dw SHOP_SEGMENT_7939 ; goto location
#_0C9CB4: #_SHOP_7971: db $FF ; end track

SHOP_SEGMENT_7972:
#_0C9CB5: #_SHOP_7972: db $70 ; vol 0x10
#_0C9CB6: #_SHOP_7973: db $F0, $FF, $E0 ; set ADSR
#_0C9CB9: #_SHOP_7976: db $F2, $44 ; set panning
#_0C9CBB: #_SHOP_7978: db $F1, $00 ; set SRCN
#_0C9CBD: #_SHOP_797A: db $8A ; dur 0x0A
#_0C9CBE: #_SHOP_797B: db $F4, $1E ; set loop point B
#_0C9CC0: #_SHOP_797D: db $18 ; play note C4
#_0C9CC1: #_SHOP_797E: db $F5 ; run loop B
#_0C9CC2: #_SHOP_797F: db $86 ; dur 0x06
#_0C9CC3: #_SHOP_7980: db $18 ; play note C4
#_0C9CC4: #_SHOP_7981: db $F1, $01 ; set SRCN
#_0C9CC6: #_SHOP_7983: db $18 ; play note C4
#_0C9CC7: #_SHOP_7984: db $18 ; play note C4
#_0C9CC8: #_SHOP_7985: db $31 ; tie
#_0C9CC9: #_SHOP_7986: db $18 ; play note C4
#_0C9CCA: #_SHOP_7987: db $18 ; play note C4
#_0C9CCB: #_SHOP_7988: db $18 ; play note C4
#_0C9CCC: #_SHOP_7989: db $18 ; play note C4

SHOP_SEGMENT_798A:
#_0C9CCD: #_SHOP_798A: db $F4, $03 ; set loop point B
#_0C9CCF: #_SHOP_798C: db $F1, $00 ; set SRCN
#_0C9CD1: #_SHOP_798E: db $8A ; dur 0x0A
#_0C9CD2: #_SHOP_798F: db $18 ; play note C4
#_0C9CD3: #_SHOP_7990: db $F1, $01 ; set SRCN
#_0C9CD5: #_SHOP_7992: db $89 ; dur 0x09
#_0C9CD6: #_SHOP_7993: db $18 ; play note C4
#_0C9CD7: #_SHOP_7994: db $F1, $00 ; set SRCN
#_0C9CD9: #_SHOP_7996: db $86 ; dur 0x06
#_0C9CDA: #_SHOP_7997: db $18 ; play note C4
#_0C9CDB: #_SHOP_7998: db $8A ; dur 0x0A
#_0C9CDC: #_SHOP_7999: db $30 ; rest
#_0C9CDD: #_SHOP_799A: db $F1, $01 ; set SRCN
#_0C9CDF: #_SHOP_799C: db $18 ; play note C4
#_0C9CE0: #_SHOP_799D: db $F1, $00 ; set SRCN
#_0C9CE2: #_SHOP_799F: db $8A ; dur 0x0A
#_0C9CE3: #_SHOP_79A0: db $18 ; play note C4
#_0C9CE4: #_SHOP_79A1: db $F1, $01 ; set SRCN
#_0C9CE6: #_SHOP_79A3: db $89 ; dur 0x09
#_0C9CE7: #_SHOP_79A4: db $18 ; play note C4
#_0C9CE8: #_SHOP_79A5: db $F1, $00 ; set SRCN
#_0C9CEA: #_SHOP_79A7: db $86 ; dur 0x06
#_0C9CEB: #_SHOP_79A8: db $18 ; play note C4
#_0C9CEC: #_SHOP_79A9: db $30 ; rest
#_0C9CED: #_SHOP_79AA: db $18 ; play note C4
#_0C9CEE: #_SHOP_79AB: db $30 ; rest
#_0C9CEF: #_SHOP_79AC: db $18 ; play note C4
#_0C9CF0: #_SHOP_79AD: db $F1, $01 ; set SRCN
#_0C9CF2: #_SHOP_79AF: db $18 ; play note C4
#_0C9CF3: #_SHOP_79B0: db $F1, $00 ; set SRCN
#_0C9CF5: #_SHOP_79B2: db $18 ; play note C4
#_0C9CF6: #_SHOP_79B3: db $F1, $01 ; set SRCN
#_0C9CF8: #_SHOP_79B5: db $88 ; dur 0x08
#_0C9CF9: #_SHOP_79B6: db $18 ; play note C4
#_0C9CFA: #_SHOP_79B7: db $F5 ; run loop B
#_0C9CFB: #_SHOP_79B8: db $F1, $00 ; set SRCN
#_0C9CFD: #_SHOP_79BA: db $8A ; dur 0x0A
#_0C9CFE: #_SHOP_79BB: db $18 ; play note C4
#_0C9CFF: #_SHOP_79BC: db $F1, $01 ; set SRCN
#_0C9D01: #_SHOP_79BE: db $89 ; dur 0x09
#_0C9D02: #_SHOP_79BF: db $18 ; play note C4
#_0C9D03: #_SHOP_79C0: db $F1, $00 ; set SRCN
#_0C9D05: #_SHOP_79C2: db $86 ; dur 0x06
#_0C9D06: #_SHOP_79C3: db $18 ; play note C4
#_0C9D07: #_SHOP_79C4: db $8A ; dur 0x0A
#_0C9D08: #_SHOP_79C5: db $30 ; rest
#_0C9D09: #_SHOP_79C6: db $F1, $01 ; set SRCN
#_0C9D0B: #_SHOP_79C8: db $18 ; play note C4
#_0C9D0C: #_SHOP_79C9: db $F1, $00 ; set SRCN
#_0C9D0E: #_SHOP_79CB: db $8A ; dur 0x0A
#_0C9D0F: #_SHOP_79CC: db $18 ; play note C4
#_0C9D10: #_SHOP_79CD: db $F1, $01 ; set SRCN
#_0C9D12: #_SHOP_79CF: db $89 ; dur 0x09
#_0C9D13: #_SHOP_79D0: db $18 ; play note C4
#_0C9D14: #_SHOP_79D1: db $F1, $00 ; set SRCN
#_0C9D16: #_SHOP_79D3: db $86 ; dur 0x06
#_0C9D17: #_SHOP_79D4: db $18 ; play note C4
#_0C9D18: #_SHOP_79D5: db $18 ; play note C4
#_0C9D19: #_SHOP_79D6: db $F1, $01 ; set SRCN
#_0C9D1B: #_SHOP_79D8: db $18 ; play note C4
#_0C9D1C: #_SHOP_79D9: db $18 ; play note C4
#_0C9D1D: #_SHOP_79DA: db $F1, $00 ; set SRCN
#_0C9D1F: #_SHOP_79DC: db $18 ; play note C4
#_0C9D20: #_SHOP_79DD: db $F1, $01 ; set SRCN
#_0C9D22: #_SHOP_79DF: db $18 ; play note C4
#_0C9D23: #_SHOP_79E0: db $18 ; play note C4
#_0C9D24: #_SHOP_79E1: db $18 ; play note C4
#_0C9D25: #_SHOP_79E2: db $31 ; tie
#_0C9D26: #_SHOP_79E3: db $F8 : dw SHOP_SEGMENT_798A ; goto location
#_0C9D29: #_SHOP_79E6: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Boss_SPC_Data:
#_0C9D2A: dw $02AC, $0000

SONG_BOSS:
#_0C9D2E: #_BOSS_7800: db $F1, $00 ; Set control
#_0C9D30: #_BOSS_7802: db $00 : dw BOSS_SEGMENT_781B ; Music channel 0
#_0C9D33: #_BOSS_7805: db $01 : dw BOSS_SEGMENT_785B ; Music channel 1
#_0C9D36: #_BOSS_7808: db $02 : dw BOSS_SEGMENT_7862 ; Music channel 2
#_0C9D39: #_BOSS_780B: db $03 : dw BOSS_SEGMENT_78A4 ; Music channel 3
#_0C9D3C: #_BOSS_780E: db $05 : dw BOSS_SEGMENT_78AF ; Music channel 5
#_0C9D3F: #_BOSS_7811: db $06 : dw BOSS_SEGMENT_78B0 ; Music channel 6
#_0C9D42: #_BOSS_7814: db $04 : dw BOSS_SEGMENT_7964 ; Music channel 4
#_0C9D45: #_BOSS_7817: db $07 : dw BOSS_SEGMENT_79ED ; Music channel 7
#_0C9D48: #_BOSS_781A: db $FF ; end of header

BOSS_SEGMENT_781B:
#_0C9D49: #_BOSS_781B: db $73 ; vol 0x13

BOSS_SEGMENT_781C:
#_0C9D4A: #_BOSS_781C: db $FB, $30 ; set note length page

BOSS_SEGMENT_781E:
#_0C9D4C: #_BOSS_781E: db $F0, $FE, $E4 ; set ADSR
#_0C9D4F: #_BOSS_7821: db $F1, $04 ; set SRCN
#_0C9D51: #_BOSS_7823: db $F2, $5C ; set panning
#_0C9D53: #_BOSS_7825: db $F3, $FE ; transpose -2
#_0C9D55: #_BOSS_7827: db $87 ; dur 0x07
#_0C9D56: #_BOSS_7828: db $21 ; play note A4
#_0C9D57: #_BOSS_7829: db $1F ; play note G4
#_0C9D58: #_BOSS_782A: db $86 ; dur 0x06
#_0C9D59: #_BOSS_782B: db $31 ; tie
#_0C9D5A: #_BOSS_782C: db $8D ; dur 0x0D
#_0C9D5B: #_BOSS_782D: db $31 ; tie
#_0C9D5C: #_BOSS_782E: db $87 ; dur 0x07
#_0C9D5D: #_BOSS_782F: db $1F ; play note G4
#_0C9D5E: #_BOSS_7830: db $1D ; play note F4
#_0C9D5F: #_BOSS_7831: db $86 ; dur 0x06
#_0C9D60: #_BOSS_7832: db $31 ; tie
#_0C9D61: #_BOSS_7833: db $8D ; dur 0x0D
#_0C9D62: #_BOSS_7834: db $31 ; tie
#_0C9D63: #_BOSS_7835: db $87 ; dur 0x07
#_0C9D64: #_BOSS_7836: db $21 ; play note A4
#_0C9D65: #_BOSS_7837: db $1F ; play note G4
#_0C9D66: #_BOSS_7838: db $86 ; dur 0x06
#_0C9D67: #_BOSS_7839: db $31 ; tie
#_0C9D68: #_BOSS_783A: db $8D ; dur 0x0D
#_0C9D69: #_BOSS_783B: db $31 ; tie
#_0C9D6A: #_BOSS_783C: db $87 ; dur 0x07
#_0C9D6B: #_BOSS_783D: db $1F ; play note G4
#_0C9D6C: #_BOSS_783E: db $1D ; play note F4
#_0C9D6D: #_BOSS_783F: db $86 ; dur 0x06
#_0C9D6E: #_BOSS_7840: db $31 ; tie
#_0C9D6F: #_BOSS_7841: db $8D ; dur 0x0D
#_0C9D70: #_BOSS_7842: db $31 ; tie
#_0C9D71: #_BOSS_7843: db $F0, $FF, $E0 ; set ADSR
#_0C9D74: #_BOSS_7846: db $F1, $08 ; set SRCN
#_0C9D76: #_BOSS_7848: db $F2, $50 ; set panning
#_0C9D78: #_BOSS_784A: db $F4, $02 ; set loop point B
#_0C9D7A: #_BOSS_784C: db $8B ; dur 0x0B
#_0C9D7B: #_BOSS_784D: db $0E ; play note D3
#_0C9D7C: #_BOSS_784E: db $84 ; dur 0x04
#_0C9D7D: #_BOSS_784F: db $30 ; rest
#_0C9D7E: #_BOSS_7850: db $86 ; dur 0x06
#_0C9D7F: #_BOSS_7851: db $0E ; play note D3
#_0C9D80: #_BOSS_7852: db $8C ; dur 0x0C
#_0C9D81: #_BOSS_7853: db $0E ; play note D3
#_0C9D82: #_BOSS_7854: db $84 ; dur 0x04
#_0C9D83: #_BOSS_7855: db $31 ; tie
#_0C9D84: #_BOSS_7856: db $F5 ; run loop B
#_0C9D85: #_BOSS_7857: db $F8 : dw BOSS_SEGMENT_781E ; goto location
#_0C9D88: #_BOSS_785A: db $FF ; end track

BOSS_SEGMENT_785B:
#_0C9D89: #_BOSS_785B: db $63 ; vol 0x03
#_0C9D8A: #_BOSS_785C: db $F9, $18 ; set fine tuning
#_0C9D8C: #_BOSS_785E: db $F8 : dw BOSS_SEGMENT_781C ; goto location
#_0C9D8F: #_BOSS_7861: db $FF ; end track

BOSS_SEGMENT_7862:
#_0C9D90: #_BOSS_7862: db $70 ; vol 0x10
#_0C9D91: #_BOSS_7863: db $F0, $FF, $F5 ; set ADSR
#_0C9D94: #_BOSS_7866: db $F1, $05 ; set SRCN
#_0C9D96: #_BOSS_7868: db $F2, $60 ; set panning
#_0C9D98: #_BOSS_786A: db $F3, $F2 ; transpose -14
#_0C9D9A: #_BOSS_786C: db $FB, $30 ; set note length page

BOSS_SEGMENT_786E:
#_0C9D9C: #_BOSS_786E: db $84 ; dur 0x04
#_0C9D9D: #_BOSS_786F: db $F4, $04 ; set loop point B
#_0C9D9F: #_BOSS_7871: db $24 ; play note C5
#_0C9DA0: #_BOSS_7872: db $26 ; play note D5
#_0C9DA1: #_BOSS_7873: db $22 ; play note As4
#_0C9DA2: #_BOSS_7874: db $24 ; play note C5
#_0C9DA3: #_BOSS_7875: db $21 ; play note A4
#_0C9DA4: #_BOSS_7876: db $22 ; play note As4
#_0C9DA5: #_BOSS_7877: db $1F ; play note G4
#_0C9DA6: #_BOSS_7878: db $21 ; play note A4
#_0C9DA7: #_BOSS_7879: db $F5 ; run loop B
#_0C9DA8: #_BOSS_787A: db $F4, $04 ; set loop point B
#_0C9DAA: #_BOSS_787C: db $22 ; play note As4
#_0C9DAB: #_BOSS_787D: db $24 ; play note C5
#_0C9DAC: #_BOSS_787E: db $21 ; play note A4
#_0C9DAD: #_BOSS_787F: db $22 ; play note As4
#_0C9DAE: #_BOSS_7880: db $1F ; play note G4
#_0C9DAF: #_BOSS_7881: db $21 ; play note A4
#_0C9DB0: #_BOSS_7882: db $1D ; play note F4
#_0C9DB1: #_BOSS_7883: db $1F ; play note G4
#_0C9DB2: #_BOSS_7884: db $F5 ; run loop B
#_0C9DB3: #_BOSS_7885: db $F4, $04 ; set loop point B
#_0C9DB5: #_BOSS_7887: db $24 ; play note C5
#_0C9DB6: #_BOSS_7888: db $26 ; play note D5
#_0C9DB7: #_BOSS_7889: db $22 ; play note As4
#_0C9DB8: #_BOSS_788A: db $24 ; play note C5
#_0C9DB9: #_BOSS_788B: db $21 ; play note A4
#_0C9DBA: #_BOSS_788C: db $22 ; play note As4
#_0C9DBB: #_BOSS_788D: db $1F ; play note G4
#_0C9DBC: #_BOSS_788E: db $21 ; play note A4
#_0C9DBD: #_BOSS_788F: db $F5 ; run loop B
#_0C9DBE: #_BOSS_7890: db $F4, $04 ; set loop point B
#_0C9DC0: #_BOSS_7892: db $22 ; play note As4
#_0C9DC1: #_BOSS_7893: db $24 ; play note C5
#_0C9DC2: #_BOSS_7894: db $21 ; play note A4
#_0C9DC3: #_BOSS_7895: db $22 ; play note As4
#_0C9DC4: #_BOSS_7896: db $1F ; play note G4
#_0C9DC5: #_BOSS_7897: db $21 ; play note A4
#_0C9DC6: #_BOSS_7898: db $1D ; play note F4
#_0C9DC7: #_BOSS_7899: db $1F ; play note G4
#_0C9DC8: #_BOSS_789A: db $F5 ; run loop B
#_0C9DC9: #_BOSS_789B: db $8C ; dur 0x0C
#_0C9DCA: #_BOSS_789C: db $30 ; rest
#_0C9DCB: #_BOSS_789D: db $30 ; rest
#_0C9DCC: #_BOSS_789E: db $30 ; rest
#_0C9DCD: #_BOSS_789F: db $30 ; rest
#_0C9DCE: #_BOSS_78A0: db $F8 : dw BOSS_SEGMENT_786E ; goto location
#_0C9DD1: #_BOSS_78A3: db $FF ; end track

BOSS_SEGMENT_78A4:
#_0C9DD2: #_BOSS_78A4: db $70 ; vol 0x10
#_0C9DD3: #_BOSS_78A5: db $F0, $FF, $F5 ; set ADSR
#_0C9DD6: #_BOSS_78A8: db $F1, $03 ; set SRCN
#_0C9DD8: #_BOSS_78AA: db $F2, $5C ; set panning
#_0C9DDA: #_BOSS_78AC: db $FB, $30 ; set note length page
#_0C9DDC: #_BOSS_78AE: db $FF ; end track

BOSS_SEGMENT_78AF:
#_0C9DDD: #_BOSS_78AF: db $FF ; end track

BOSS_SEGMENT_78B0:
#_0C9DDE: #_BOSS_78B0: db $70 ; vol 0x10
#_0C9DDF: #_BOSS_78B1: db $F0, $FF, $F2 ; set ADSR
#_0C9DE2: #_BOSS_78B4: db $FB, $30 ; set note length page

BOSS_SEGMENT_78B6:
#_0C9DE4: #_BOSS_78B6: db $F1, $05 ; set SRCN
#_0C9DE6: #_BOSS_78B8: db $F2, $70 ; set panning
#_0C9DE8: #_BOSS_78BA: db $F3, $F2 ; transpose -14
#_0C9DEA: #_BOSS_78BC: db $F9, $20 ; set fine tuning
#_0C9DEC: #_BOSS_78BE: db $85 ; dur 0x05
#_0C9DED: #_BOSS_78BF: db $30 ; rest
#_0C9DEE: #_BOSS_78C0: db $84 ; dur 0x04
#_0C9DEF: #_BOSS_78C1: db $F4, $04 ; set loop point B
#_0C9DF1: #_BOSS_78C3: db $24 ; play note C5
#_0C9DF2: #_BOSS_78C4: db $26 ; play note D5
#_0C9DF3: #_BOSS_78C5: db $22 ; play note As4
#_0C9DF4: #_BOSS_78C6: db $24 ; play note C5
#_0C9DF5: #_BOSS_78C7: db $21 ; play note A4
#_0C9DF6: #_BOSS_78C8: db $22 ; play note As4
#_0C9DF7: #_BOSS_78C9: db $1F ; play note G4
#_0C9DF8: #_BOSS_78CA: db $21 ; play note A4
#_0C9DF9: #_BOSS_78CB: db $F5 ; run loop B
#_0C9DFA: #_BOSS_78CC: db $F4, $04 ; set loop point B
#_0C9DFC: #_BOSS_78CE: db $22 ; play note As4
#_0C9DFD: #_BOSS_78CF: db $24 ; play note C5
#_0C9DFE: #_BOSS_78D0: db $21 ; play note A4
#_0C9DFF: #_BOSS_78D1: db $22 ; play note As4
#_0C9E00: #_BOSS_78D2: db $1F ; play note G4
#_0C9E01: #_BOSS_78D3: db $21 ; play note A4
#_0C9E02: #_BOSS_78D4: db $1D ; play note F4
#_0C9E03: #_BOSS_78D5: db $1F ; play note G4
#_0C9E04: #_BOSS_78D6: db $F5 ; run loop B
#_0C9E05: #_BOSS_78D7: db $F4, $04 ; set loop point B
#_0C9E07: #_BOSS_78D9: db $24 ; play note C5
#_0C9E08: #_BOSS_78DA: db $26 ; play note D5
#_0C9E09: #_BOSS_78DB: db $22 ; play note As4
#_0C9E0A: #_BOSS_78DC: db $24 ; play note C5
#_0C9E0B: #_BOSS_78DD: db $21 ; play note A4
#_0C9E0C: #_BOSS_78DE: db $22 ; play note As4
#_0C9E0D: #_BOSS_78DF: db $1F ; play note G4
#_0C9E0E: #_BOSS_78E0: db $21 ; play note A4
#_0C9E0F: #_BOSS_78E1: db $F5 ; run loop B
#_0C9E10: #_BOSS_78E2: db $F4, $03 ; set loop point B
#_0C9E12: #_BOSS_78E4: db $22 ; play note As4
#_0C9E13: #_BOSS_78E5: db $24 ; play note C5
#_0C9E14: #_BOSS_78E6: db $21 ; play note A4
#_0C9E15: #_BOSS_78E7: db $22 ; play note As4
#_0C9E16: #_BOSS_78E8: db $1F ; play note G4
#_0C9E17: #_BOSS_78E9: db $21 ; play note A4
#_0C9E18: #_BOSS_78EA: db $1D ; play note F4
#_0C9E19: #_BOSS_78EB: db $1F ; play note G4
#_0C9E1A: #_BOSS_78EC: db $F5 ; run loop B
#_0C9E1B: #_BOSS_78ED: db $22 ; play note As4
#_0C9E1C: #_BOSS_78EE: db $24 ; play note C5
#_0C9E1D: #_BOSS_78EF: db $21 ; play note A4
#_0C9E1E: #_BOSS_78F0: db $22 ; play note As4
#_0C9E1F: #_BOSS_78F1: db $1F ; play note G4
#_0C9E20: #_BOSS_78F2: db $21 ; play note A4
#_0C9E21: #_BOSS_78F3: db $83 ; dur 0x03
#_0C9E22: #_BOSS_78F4: db $1D ; play note F4
#_0C9E23: #_BOSS_78F5: db $F1, $09 ; set SRCN
#_0C9E25: #_BOSS_78F7: db $F2, $40 ; set panning
#_0C9E27: #_BOSS_78F9: db $F9, $00 ; set fine tuning
#_0C9E29: #_BOSS_78FB: db $84 ; dur 0x04
#_0C9E2A: #_BOSS_78FC: db $1A ; play note D4
#_0C9E2B: #_BOSS_78FD: db $24 ; play note C5
#_0C9E2C: #_BOSS_78FE: db $FC ; fade out
#_0C9E2D: #_BOSS_78FF: db $26 ; play note D5
#_0C9E2E: #_BOSS_7900: db $FD ; disable fade
#_0C9E2F: #_BOSS_7901: db $1A ; play note D4
#_0C9E30: #_BOSS_7902: db $1F ; play note G4
#_0C9E31: #_BOSS_7903: db $FC ; fade out
#_0C9E32: #_BOSS_7904: db $21 ; play note A4
#_0C9E33: #_BOSS_7905: db $FD ; disable fade
#_0C9E34: #_BOSS_7906: db $1A ; play note D4
#_0C9E35: #_BOSS_7907: db $FC ; fade out
#_0C9E36: #_BOSS_7908: db $1D ; play note F4
#_0C9E37: #_BOSS_7909: db $FD ; disable fade
#_0C9E38: #_BOSS_790A: db $1A ; play note D4
#_0C9E39: #_BOSS_790B: db $1F ; play note G4
#_0C9E3A: #_BOSS_790C: db $FC ; fade out
#_0C9E3B: #_BOSS_790D: db $21 ; play note A4
#_0C9E3C: #_BOSS_790E: db $FD ; disable fade
#_0C9E3D: #_BOSS_790F: db $1D ; play note F4
#_0C9E3E: #_BOSS_7910: db $FC ; fade out
#_0C9E3F: #_BOSS_7911: db $1F ; play note G4
#_0C9E40: #_BOSS_7912: db $FD ; disable fade
#_0C9E41: #_BOSS_7913: db $1F ; play note G4
#_0C9E42: #_BOSS_7914: db $FC ; fade out
#_0C9E43: #_BOSS_7915: db $21 ; play note A4
#_0C9E44: #_BOSS_7916: db $FD ; disable fade
#_0C9E45: #_BOSS_7917: db $1A ; play note D4
#_0C9E46: #_BOSS_7918: db $1A ; play note D4
#_0C9E47: #_BOSS_7919: db $24 ; play note C5
#_0C9E48: #_BOSS_791A: db $FC ; fade out
#_0C9E49: #_BOSS_791B: db $26 ; play note D5
#_0C9E4A: #_BOSS_791C: db $FD ; disable fade
#_0C9E4B: #_BOSS_791D: db $1A ; play note D4
#_0C9E4C: #_BOSS_791E: db $1F ; play note G4
#_0C9E4D: #_BOSS_791F: db $FC ; fade out
#_0C9E4E: #_BOSS_7920: db $21 ; play note A4
#_0C9E4F: #_BOSS_7921: db $FD ; disable fade
#_0C9E50: #_BOSS_7922: db $1A ; play note D4
#_0C9E51: #_BOSS_7923: db $FC ; fade out
#_0C9E52: #_BOSS_7924: db $1D ; play note F4
#_0C9E53: #_BOSS_7925: db $FD ; disable fade
#_0C9E54: #_BOSS_7926: db $18 ; play note C4
#_0C9E55: #_BOSS_7927: db $19 ; play note Cs4
#_0C9E56: #_BOSS_7928: db $31 ; tie
#_0C9E57: #_BOSS_7929: db $1A ; play note D4
#_0C9E58: #_BOSS_792A: db $31 ; tie
#_0C9E59: #_BOSS_792B: db $1B ; play note Ds4
#_0C9E5A: #_BOSS_792C: db $31 ; tie
#_0C9E5B: #_BOSS_792D: db $1C ; play note E4
#_0C9E5C: #_BOSS_792E: db $1A ; play note D4
#_0C9E5D: #_BOSS_792F: db $24 ; play note C5
#_0C9E5E: #_BOSS_7930: db $FC ; fade out
#_0C9E5F: #_BOSS_7931: db $26 ; play note D5
#_0C9E60: #_BOSS_7932: db $FD ; disable fade
#_0C9E61: #_BOSS_7933: db $1A ; play note D4
#_0C9E62: #_BOSS_7934: db $1F ; play note G4
#_0C9E63: #_BOSS_7935: db $FC ; fade out
#_0C9E64: #_BOSS_7936: db $21 ; play note A4
#_0C9E65: #_BOSS_7937: db $FD ; disable fade
#_0C9E66: #_BOSS_7938: db $1A ; play note D4
#_0C9E67: #_BOSS_7939: db $FC ; fade out
#_0C9E68: #_BOSS_793A: db $1D ; play note F4
#_0C9E69: #_BOSS_793B: db $FD ; disable fade
#_0C9E6A: #_BOSS_793C: db $1A ; play note D4
#_0C9E6B: #_BOSS_793D: db $1F ; play note G4
#_0C9E6C: #_BOSS_793E: db $FC ; fade out
#_0C9E6D: #_BOSS_793F: db $21 ; play note A4
#_0C9E6E: #_BOSS_7940: db $FD ; disable fade
#_0C9E6F: #_BOSS_7941: db $1D ; play note F4
#_0C9E70: #_BOSS_7942: db $FC ; fade out
#_0C9E71: #_BOSS_7943: db $1F ; play note G4
#_0C9E72: #_BOSS_7944: db $FD ; disable fade
#_0C9E73: #_BOSS_7945: db $1F ; play note G4
#_0C9E74: #_BOSS_7946: db $FC ; fade out
#_0C9E75: #_BOSS_7947: db $21 ; play note A4
#_0C9E76: #_BOSS_7948: db $FD ; disable fade
#_0C9E77: #_BOSS_7949: db $1A ; play note D4
#_0C9E78: #_BOSS_794A: db $1A ; play note D4
#_0C9E79: #_BOSS_794B: db $24 ; play note C5
#_0C9E7A: #_BOSS_794C: db $FC ; fade out
#_0C9E7B: #_BOSS_794D: db $26 ; play note D5
#_0C9E7C: #_BOSS_794E: db $FD ; disable fade
#_0C9E7D: #_BOSS_794F: db $1A ; play note D4
#_0C9E7E: #_BOSS_7950: db $1F ; play note G4
#_0C9E7F: #_BOSS_7951: db $FC ; fade out
#_0C9E80: #_BOSS_7952: db $21 ; play note A4
#_0C9E81: #_BOSS_7953: db $FD ; disable fade
#_0C9E82: #_BOSS_7954: db $1A ; play note D4
#_0C9E83: #_BOSS_7955: db $FC ; fade out
#_0C9E84: #_BOSS_7956: db $1D ; play note F4
#_0C9E85: #_BOSS_7957: db $FD ; disable fade
#_0C9E86: #_BOSS_7958: db $1A ; play note D4
#_0C9E87: #_BOSS_7959: db $1A ; play note D4
#_0C9E88: #_BOSS_795A: db $21 ; play note A4
#_0C9E89: #_BOSS_795B: db $1A ; play note D4
#_0C9E8A: #_BOSS_795C: db $1A ; play note D4
#_0C9E8B: #_BOSS_795D: db $24 ; play note C5
#_0C9E8C: #_BOSS_795E: db $1A ; play note D4
#_0C9E8D: #_BOSS_795F: db $24 ; play note C5
#_0C9E8E: #_BOSS_7960: db $F8 : dw BOSS_SEGMENT_78B6 ; goto location
#_0C9E91: #_BOSS_7963: db $FF ; end track

BOSS_SEGMENT_7964:
#_0C9E92: #_BOSS_7964: db $70 ; vol 0x10
#_0C9E93: #_BOSS_7965: db $F0, $FF, $F2 ; set ADSR
#_0C9E96: #_BOSS_7968: db $F1, $02 ; set SRCN
#_0C9E98: #_BOSS_796A: db $F2, $50 ; set panning
#_0C9E9A: #_BOSS_796C: db $FB, $30 ; set note length page

BOSS_SEGMENT_796E:
#_0C9E9C: #_BOSS_796E: db $F3, $FE ; transpose -2
#_0C9E9E: #_BOSS_7970: db $84 ; dur 0x04
#_0C9E9F: #_BOSS_7971: db $16 ; play note As3
#_0C9EA0: #_BOSS_7972: db $16 ; play note As3
#_0C9EA1: #_BOSS_7973: db $16 ; play note As3
#_0C9EA2: #_BOSS_7974: db $F4, $20 ; set loop point B
#_0C9EA4: #_BOSS_7976: db $18 ; play note C4
#_0C9EA5: #_BOSS_7977: db $F5 ; run loop B
#_0C9EA6: #_BOSS_7978: db $F4, $20 ; set loop point B
#_0C9EA8: #_BOSS_797A: db $16 ; play note As3
#_0C9EA9: #_BOSS_797B: db $F5 ; run loop B
#_0C9EAA: #_BOSS_797C: db $F4, $20 ; set loop point B
#_0C9EAC: #_BOSS_797E: db $18 ; play note C4
#_0C9EAD: #_BOSS_797F: db $F5 ; run loop B
#_0C9EAE: #_BOSS_7980: db $F4, $1D ; set loop point B
#_0C9EB0: #_BOSS_7982: db $16 ; play note As3
#_0C9EB1: #_BOSS_7983: db $F5 ; run loop B
#_0C9EB2: #_BOSS_7984: db $84 ; dur 0x04
#_0C9EB3: #_BOSS_7985: db $1A ; play note D4
#_0C9EB4: #_BOSS_7986: db $24 ; play note C5
#_0C9EB5: #_BOSS_7987: db $FC ; fade out
#_0C9EB6: #_BOSS_7988: db $26 ; play note D5
#_0C9EB7: #_BOSS_7989: db $FD ; disable fade
#_0C9EB8: #_BOSS_798A: db $1A ; play note D4
#_0C9EB9: #_BOSS_798B: db $1F ; play note G4
#_0C9EBA: #_BOSS_798C: db $FC ; fade out
#_0C9EBB: #_BOSS_798D: db $21 ; play note A4
#_0C9EBC: #_BOSS_798E: db $FD ; disable fade
#_0C9EBD: #_BOSS_798F: db $1A ; play note D4
#_0C9EBE: #_BOSS_7990: db $FC ; fade out
#_0C9EBF: #_BOSS_7991: db $1D ; play note F4
#_0C9EC0: #_BOSS_7992: db $FD ; disable fade
#_0C9EC1: #_BOSS_7993: db $1A ; play note D4
#_0C9EC2: #_BOSS_7994: db $1F ; play note G4
#_0C9EC3: #_BOSS_7995: db $FC ; fade out
#_0C9EC4: #_BOSS_7996: db $21 ; play note A4
#_0C9EC5: #_BOSS_7997: db $FD ; disable fade
#_0C9EC6: #_BOSS_7998: db $1D ; play note F4
#_0C9EC7: #_BOSS_7999: db $FC ; fade out
#_0C9EC8: #_BOSS_799A: db $1F ; play note G4
#_0C9EC9: #_BOSS_799B: db $FD ; disable fade
#_0C9ECA: #_BOSS_799C: db $1F ; play note G4
#_0C9ECB: #_BOSS_799D: db $FC ; fade out
#_0C9ECC: #_BOSS_799E: db $21 ; play note A4
#_0C9ECD: #_BOSS_799F: db $FD ; disable fade
#_0C9ECE: #_BOSS_79A0: db $1A ; play note D4
#_0C9ECF: #_BOSS_79A1: db $1A ; play note D4
#_0C9ED0: #_BOSS_79A2: db $24 ; play note C5
#_0C9ED1: #_BOSS_79A3: db $FC ; fade out
#_0C9ED2: #_BOSS_79A4: db $26 ; play note D5
#_0C9ED3: #_BOSS_79A5: db $FD ; disable fade
#_0C9ED4: #_BOSS_79A6: db $1A ; play note D4
#_0C9ED5: #_BOSS_79A7: db $1F ; play note G4
#_0C9ED6: #_BOSS_79A8: db $FC ; fade out
#_0C9ED7: #_BOSS_79A9: db $21 ; play note A4
#_0C9ED8: #_BOSS_79AA: db $FD ; disable fade
#_0C9ED9: #_BOSS_79AB: db $1A ; play note D4
#_0C9EDA: #_BOSS_79AC: db $FC ; fade out
#_0C9EDB: #_BOSS_79AD: db $1D ; play note F4
#_0C9EDC: #_BOSS_79AE: db $FD ; disable fade
#_0C9EDD: #_BOSS_79AF: db $18 ; play note C4
#_0C9EDE: #_BOSS_79B0: db $19 ; play note Cs4
#_0C9EDF: #_BOSS_79B1: db $31 ; tie
#_0C9EE0: #_BOSS_79B2: db $1A ; play note D4
#_0C9EE1: #_BOSS_79B3: db $31 ; tie
#_0C9EE2: #_BOSS_79B4: db $1B ; play note Ds4
#_0C9EE3: #_BOSS_79B5: db $31 ; tie
#_0C9EE4: #_BOSS_79B6: db $1C ; play note E4
#_0C9EE5: #_BOSS_79B7: db $1A ; play note D4
#_0C9EE6: #_BOSS_79B8: db $24 ; play note C5
#_0C9EE7: #_BOSS_79B9: db $FC ; fade out
#_0C9EE8: #_BOSS_79BA: db $26 ; play note D5
#_0C9EE9: #_BOSS_79BB: db $FD ; disable fade
#_0C9EEA: #_BOSS_79BC: db $1A ; play note D4
#_0C9EEB: #_BOSS_79BD: db $1F ; play note G4
#_0C9EEC: #_BOSS_79BE: db $FC ; fade out
#_0C9EED: #_BOSS_79BF: db $21 ; play note A4
#_0C9EEE: #_BOSS_79C0: db $FD ; disable fade
#_0C9EEF: #_BOSS_79C1: db $1A ; play note D4
#_0C9EF0: #_BOSS_79C2: db $FC ; fade out
#_0C9EF1: #_BOSS_79C3: db $1D ; play note F4
#_0C9EF2: #_BOSS_79C4: db $FD ; disable fade
#_0C9EF3: #_BOSS_79C5: db $1A ; play note D4
#_0C9EF4: #_BOSS_79C6: db $1F ; play note G4
#_0C9EF5: #_BOSS_79C7: db $FC ; fade out
#_0C9EF6: #_BOSS_79C8: db $21 ; play note A4
#_0C9EF7: #_BOSS_79C9: db $FD ; disable fade
#_0C9EF8: #_BOSS_79CA: db $1D ; play note F4
#_0C9EF9: #_BOSS_79CB: db $FC ; fade out
#_0C9EFA: #_BOSS_79CC: db $1F ; play note G4
#_0C9EFB: #_BOSS_79CD: db $FD ; disable fade
#_0C9EFC: #_BOSS_79CE: db $1F ; play note G4
#_0C9EFD: #_BOSS_79CF: db $FC ; fade out
#_0C9EFE: #_BOSS_79D0: db $21 ; play note A4
#_0C9EFF: #_BOSS_79D1: db $FD ; disable fade
#_0C9F00: #_BOSS_79D2: db $1A ; play note D4
#_0C9F01: #_BOSS_79D3: db $1A ; play note D4
#_0C9F02: #_BOSS_79D4: db $24 ; play note C5
#_0C9F03: #_BOSS_79D5: db $FC ; fade out
#_0C9F04: #_BOSS_79D6: db $26 ; play note D5
#_0C9F05: #_BOSS_79D7: db $FD ; disable fade
#_0C9F06: #_BOSS_79D8: db $1A ; play note D4
#_0C9F07: #_BOSS_79D9: db $1F ; play note G4
#_0C9F08: #_BOSS_79DA: db $FC ; fade out
#_0C9F09: #_BOSS_79DB: db $21 ; play note A4
#_0C9F0A: #_BOSS_79DC: db $FD ; disable fade
#_0C9F0B: #_BOSS_79DD: db $1A ; play note D4
#_0C9F0C: #_BOSS_79DE: db $FC ; fade out
#_0C9F0D: #_BOSS_79DF: db $1D ; play note F4
#_0C9F0E: #_BOSS_79E0: db $FD ; disable fade
#_0C9F0F: #_BOSS_79E1: db $1A ; play note D4
#_0C9F10: #_BOSS_79E2: db $1A ; play note D4
#_0C9F11: #_BOSS_79E3: db $21 ; play note A4
#_0C9F12: #_BOSS_79E4: db $1A ; play note D4
#_0C9F13: #_BOSS_79E5: db $1A ; play note D4
#_0C9F14: #_BOSS_79E6: db $24 ; play note C5
#_0C9F15: #_BOSS_79E7: db $1A ; play note D4
#_0C9F16: #_BOSS_79E8: db $24 ; play note C5
#_0C9F17: #_BOSS_79E9: db $F8 : dw BOSS_SEGMENT_796E ; goto location
#_0C9F1A: #_BOSS_79EC: db $FF ; end track

BOSS_SEGMENT_79ED:
#_0C9F1B: #_BOSS_79ED: db $70 ; vol 0x10
#_0C9F1C: #_BOSS_79EE: db $F0, $FF, $E0 ; set ADSR
#_0C9F1F: #_BOSS_79F1: db $F2, $44 ; set panning
#_0C9F21: #_BOSS_79F3: db $FB, $30 ; set note length page

BOSS_SEGMENT_79F5:
#_0C9F23: #_BOSS_79F5: db $F4, $0F ; set loop point B
#_0C9F25: #_BOSS_79F7: db $F1, $00 ; set SRCN
#_0C9F27: #_BOSS_79F9: db $86 ; dur 0x06
#_0C9F28: #_BOSS_79FA: db $18 ; play note C4
#_0C9F29: #_BOSS_79FB: db $F1, $01 ; set SRCN
#_0C9F2B: #_BOSS_79FD: db $18 ; play note C4
#_0C9F2C: #_BOSS_79FE: db $F1, $00 ; set SRCN
#_0C9F2E: #_BOSS_7A00: db $84 ; dur 0x04
#_0C9F2F: #_BOSS_7A01: db $18 ; play note C4
#_0C9F30: #_BOSS_7A02: db $18 ; play note C4
#_0C9F31: #_BOSS_7A03: db $F1, $01 ; set SRCN
#_0C9F33: #_BOSS_7A05: db $86 ; dur 0x06
#_0C9F34: #_BOSS_7A06: db $18 ; play note C4
#_0C9F35: #_BOSS_7A07: db $F5 ; run loop B
#_0C9F36: #_BOSS_7A08: db $F1, $00 ; set SRCN
#_0C9F38: #_BOSS_7A0A: db $84 ; dur 0x04
#_0C9F39: #_BOSS_7A0B: db $18 ; play note C4
#_0C9F3A: #_BOSS_7A0C: db $F1, $01 ; set SRCN
#_0C9F3C: #_BOSS_7A0E: db $18 ; play note C4
#_0C9F3D: #_BOSS_7A0F: db $18 ; play note C4
#_0C9F3E: #_BOSS_7A10: db $F1, $00 ; set SRCN
#_0C9F40: #_BOSS_7A12: db $18 ; play note C4
#_0C9F41: #_BOSS_7A13: db $F1, $01 ; set SRCN
#_0C9F43: #_BOSS_7A15: db $18 ; play note C4
#_0C9F44: #_BOSS_7A16: db $F1, $00 ; set SRCN
#_0C9F46: #_BOSS_7A18: db $18 ; play note C4
#_0C9F47: #_BOSS_7A19: db $F1, $01 ; set SRCN
#_0C9F49: #_BOSS_7A1B: db $18 ; play note C4
#_0C9F4A: #_BOSS_7A1C: db $F1, $00 ; set SRCN
#_0C9F4C: #_BOSS_7A1E: db $18 ; play note C4
#_0C9F4D: #_BOSS_7A1F: db $F1, $01 ; set SRCN
#_0C9F4F: #_BOSS_7A21: db $18 ; play note C4
#_0C9F50: #_BOSS_7A22: db $F1, $00 ; set SRCN
#_0C9F52: #_BOSS_7A24: db $18 ; play note C4
#_0C9F53: #_BOSS_7A25: db $F1, $01 ; set SRCN
#_0C9F55: #_BOSS_7A27: db $86 ; dur 0x06
#_0C9F56: #_BOSS_7A28: db $18 ; play note C4
#_0C9F57: #_BOSS_7A29: db $F1, $00 ; set SRCN
#_0C9F59: #_BOSS_7A2B: db $84 ; dur 0x04
#_0C9F5A: #_BOSS_7A2C: db $18 ; play note C4
#_0C9F5B: #_BOSS_7A2D: db $18 ; play note C4
#_0C9F5C: #_BOSS_7A2E: db $F1, $01 ; set SRCN
#_0C9F5E: #_BOSS_7A30: db $86 ; dur 0x06
#_0C9F5F: #_BOSS_7A31: db $18 ; play note C4
#_0C9F60: #_BOSS_7A32: db $F1, $00 ; set SRCN
#_0C9F62: #_BOSS_7A34: db $84 ; dur 0x04
#_0C9F63: #_BOSS_7A35: db $18 ; play note C4
#_0C9F64: #_BOSS_7A36: db $18 ; play note C4
#_0C9F65: #_BOSS_7A37: db $F1, $01 ; set SRCN
#_0C9F67: #_BOSS_7A39: db $18 ; play note C4
#_0C9F68: #_BOSS_7A3A: db $F1, $00 ; set SRCN
#_0C9F6A: #_BOSS_7A3C: db $86 ; dur 0x06
#_0C9F6B: #_BOSS_7A3D: db $18 ; play note C4
#_0C9F6C: #_BOSS_7A3E: db $F1, $01 ; set SRCN
#_0C9F6E: #_BOSS_7A40: db $18 ; play note C4
#_0C9F6F: #_BOSS_7A41: db $84 ; dur 0x04
#_0C9F70: #_BOSS_7A42: db $18 ; play note C4
#_0C9F71: #_BOSS_7A43: db $F1, $00 ; set SRCN
#_0C9F73: #_BOSS_7A45: db $86 ; dur 0x06
#_0C9F74: #_BOSS_7A46: db $18 ; play note C4
#_0C9F75: #_BOSS_7A47: db $F1, $01 ; set SRCN
#_0C9F77: #_BOSS_7A49: db $18 ; play note C4
#_0C9F78: #_BOSS_7A4A: db $F1, $00 ; set SRCN
#_0C9F7A: #_BOSS_7A4C: db $84 ; dur 0x04
#_0C9F7B: #_BOSS_7A4D: db $18 ; play note C4
#_0C9F7C: #_BOSS_7A4E: db $18 ; play note C4
#_0C9F7D: #_BOSS_7A4F: db $F1, $01 ; set SRCN
#_0C9F7F: #_BOSS_7A51: db $86 ; dur 0x06
#_0C9F80: #_BOSS_7A52: db $18 ; play note C4
#_0C9F81: #_BOSS_7A53: db $F1, $00 ; set SRCN
#_0C9F83: #_BOSS_7A55: db $84 ; dur 0x04
#_0C9F84: #_BOSS_7A56: db $18 ; play note C4
#_0C9F85: #_BOSS_7A57: db $18 ; play note C4
#_0C9F86: #_BOSS_7A58: db $F1, $01 ; set SRCN
#_0C9F88: #_BOSS_7A5A: db $18 ; play note C4
#_0C9F89: #_BOSS_7A5B: db $F1, $00 ; set SRCN
#_0C9F8B: #_BOSS_7A5D: db $86 ; dur 0x06
#_0C9F8C: #_BOSS_7A5E: db $18 ; play note C4
#_0C9F8D: #_BOSS_7A5F: db $84 ; dur 0x04
#_0C9F8E: #_BOSS_7A60: db $18 ; play note C4
#_0C9F8F: #_BOSS_7A61: db $F1, $01 ; set SRCN
#_0C9F91: #_BOSS_7A63: db $18 ; play note C4
#_0C9F92: #_BOSS_7A64: db $F1, $00 ; set SRCN
#_0C9F94: #_BOSS_7A66: db $18 ; play note C4
#_0C9F95: #_BOSS_7A67: db $F1, $01 ; set SRCN
#_0C9F97: #_BOSS_7A69: db $18 ; play note C4
#_0C9F98: #_BOSS_7A6A: db $F1, $00 ; set SRCN
#_0C9F9A: #_BOSS_7A6C: db $18 ; play note C4
#_0C9F9B: #_BOSS_7A6D: db $F1, $01 ; set SRCN
#_0C9F9D: #_BOSS_7A6F: db $86 ; dur 0x06
#_0C9F9E: #_BOSS_7A70: db $18 ; play note C4
#_0C9F9F: #_BOSS_7A71: db $F1, $00 ; set SRCN
#_0C9FA1: #_BOSS_7A73: db $84 ; dur 0x04
#_0C9FA2: #_BOSS_7A74: db $18 ; play note C4
#_0C9FA3: #_BOSS_7A75: db $18 ; play note C4
#_0C9FA4: #_BOSS_7A76: db $F1, $01 ; set SRCN
#_0C9FA6: #_BOSS_7A78: db $86 ; dur 0x06
#_0C9FA7: #_BOSS_7A79: db $18 ; play note C4
#_0C9FA8: #_BOSS_7A7A: db $F1, $00 ; set SRCN
#_0C9FAA: #_BOSS_7A7C: db $84 ; dur 0x04
#_0C9FAB: #_BOSS_7A7D: db $18 ; play note C4
#_0C9FAC: #_BOSS_7A7E: db $18 ; play note C4
#_0C9FAD: #_BOSS_7A7F: db $F1, $01 ; set SRCN
#_0C9FAF: #_BOSS_7A81: db $18 ; play note C4
#_0C9FB0: #_BOSS_7A82: db $F1, $00 ; set SRCN
#_0C9FB2: #_BOSS_7A84: db $86 ; dur 0x06
#_0C9FB3: #_BOSS_7A85: db $18 ; play note C4
#_0C9FB4: #_BOSS_7A86: db $F1, $01 ; set SRCN
#_0C9FB6: #_BOSS_7A88: db $18 ; play note C4
#_0C9FB7: #_BOSS_7A89: db $84 ; dur 0x04
#_0C9FB8: #_BOSS_7A8A: db $18 ; play note C4
#_0C9FB9: #_BOSS_7A8B: db $F1, $00 ; set SRCN
#_0C9FBB: #_BOSS_7A8D: db $86 ; dur 0x06
#_0C9FBC: #_BOSS_7A8E: db $18 ; play note C4
#_0C9FBD: #_BOSS_7A8F: db $F1, $01 ; set SRCN
#_0C9FBF: #_BOSS_7A91: db $18 ; play note C4
#_0C9FC0: #_BOSS_7A92: db $F1, $00 ; set SRCN
#_0C9FC2: #_BOSS_7A94: db $84 ; dur 0x04
#_0C9FC3: #_BOSS_7A95: db $18 ; play note C4
#_0C9FC4: #_BOSS_7A96: db $18 ; play note C4
#_0C9FC5: #_BOSS_7A97: db $F1, $01 ; set SRCN
#_0C9FC7: #_BOSS_7A99: db $86 ; dur 0x06
#_0C9FC8: #_BOSS_7A9A: db $18 ; play note C4
#_0C9FC9: #_BOSS_7A9B: db $F1, $00 ; set SRCN
#_0C9FCB: #_BOSS_7A9D: db $84 ; dur 0x04
#_0C9FCC: #_BOSS_7A9E: db $18 ; play note C4
#_0C9FCD: #_BOSS_7A9F: db $F1, $01 ; set SRCN
#_0C9FCF: #_BOSS_7AA1: db $18 ; play note C4
#_0C9FD0: #_BOSS_7AA2: db $18 ; play note C4
#_0C9FD1: #_BOSS_7AA3: db $18 ; play note C4
#_0C9FD2: #_BOSS_7AA4: db $18 ; play note C4
#_0C9FD3: #_BOSS_7AA5: db $18 ; play note C4
#_0C9FD4: #_BOSS_7AA6: db $18 ; play note C4
#_0C9FD5: #_BOSS_7AA7: db $18 ; play note C4
#_0C9FD6: #_BOSS_7AA8: db $F8 : dw BOSS_SEGMENT_79F5 ; goto location
#_0C9FD9: #_BOSS_7AAB: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Opening_SPC_Data:
#_0C9FDA: dw $00AF, $0000

SONG_OPENING:
#_0C9FDE: #_OPENING_7800: db $F1, $00 ; Set control
#_0C9FE0: #_OPENING_7802: db $00 : dw OPENING_SEGMENT_781B ; Music channel 0
#_0C9FE3: #_OPENING_7805: db $01 : dw OPENING_SEGMENT_782D ; Music channel 1
#_0C9FE6: #_OPENING_7808: db $02 : dw OPENING_SEGMENT_7841 ; Music channel 2
#_0C9FE9: #_OPENING_780B: db $03 : dw OPENING_SEGMENT_7853 ; Music channel 3
#_0C9FEC: #_OPENING_780E: db $04 : dw OPENING_SEGMENT_7865 ; Music channel 4
#_0C9FEF: #_OPENING_7811: db $05 : dw OPENING_SEGMENT_7877 ; Music channel 5
#_0C9FF2: #_OPENING_7814: db $06 : dw OPENING_SEGMENT_7889 ; Music channel 6
#_0C9FF5: #_OPENING_7817: db $07 : dw OPENING_SEGMENT_789D ; Music channel 7
#_0C9FF8: #_OPENING_781A: db $FF ; end of header

OPENING_SEGMENT_781B:
#_0C9FF9: #_OPENING_781B: db $73 ; vol 0x13
#_0C9FFA: #_OPENING_781C: db $F0, $F0, $E0 ; set ADSR
#_0C9FFD: #_OPENING_781F: db $F1, $08 ; set SRCN
#_0C9FFF: #_OPENING_7821: db $F2, $60 ; set panning
#_0CA001: #_OPENING_7823: db $8E ; dur 0x0E
#_0CA002: #_OPENING_7824: db $30 ; rest
#_0CA003: #_OPENING_7825: db $30 ; rest
#_0CA004: #_OPENING_7826: db $30 ; rest
#_0CA005: #_OPENING_7827: db $30 ; rest
#_0CA006: #_OPENING_7828: db $1E ; play note Fs4
#_0CA007: #_OPENING_7829: db $31 ; tie
#_0CA008: #_OPENING_782A: db $31 ; tie
#_0CA009: #_OPENING_782B: db $31 ; tie
#_0CA00A: #_OPENING_782C: db $FF ; end track

OPENING_SEGMENT_782D:
#_0CA00B: #_OPENING_782D: db $63 ; vol 0x03
#_0CA00C: #_OPENING_782E: db $F0, $F0, $E0 ; set ADSR
#_0CA00F: #_OPENING_7831: db $F1, $08 ; set SRCN
#_0CA011: #_OPENING_7833: db $F2, $60 ; set panning
#_0CA013: #_OPENING_7835: db $F9, $20 ; set fine tuning
#_0CA015: #_OPENING_7837: db $8E ; dur 0x0E
#_0CA016: #_OPENING_7838: db $30 ; rest
#_0CA017: #_OPENING_7839: db $30 ; rest
#_0CA018: #_OPENING_783A: db $30 ; rest
#_0CA019: #_OPENING_783B: db $30 ; rest
#_0CA01A: #_OPENING_783C: db $1E ; play note Fs4
#_0CA01B: #_OPENING_783D: db $31 ; tie
#_0CA01C: #_OPENING_783E: db $31 ; tie
#_0CA01D: #_OPENING_783F: db $31 ; tie
#_0CA01E: #_OPENING_7840: db $FF ; end track

OPENING_SEGMENT_7841:
#_0CA01F: #_OPENING_7841: db $72 ; vol 0x12
#_0CA020: #_OPENING_7842: db $F0, $F0, $E0 ; set ADSR
#_0CA023: #_OPENING_7845: db $F1, $08 ; set SRCN
#_0CA025: #_OPENING_7847: db $F2, $60 ; set panning
#_0CA027: #_OPENING_7849: db $8E ; dur 0x0E
#_0CA028: #_OPENING_784A: db $30 ; rest
#_0CA029: #_OPENING_784B: db $30 ; rest
#_0CA02A: #_OPENING_784C: db $30 ; rest
#_0CA02B: #_OPENING_784D: db $30 ; rest
#_0CA02C: #_OPENING_784E: db $1B ; play note Ds4
#_0CA02D: #_OPENING_784F: db $31 ; tie
#_0CA02E: #_OPENING_7850: db $31 ; tie
#_0CA02F: #_OPENING_7851: db $31 ; tie
#_0CA030: #_OPENING_7852: db $FF ; end track

OPENING_SEGMENT_7853:
#_0CA031: #_OPENING_7853: db $62 ; vol 0x02
#_0CA032: #_OPENING_7854: db $F0, $F0, $E0 ; set ADSR
#_0CA035: #_OPENING_7857: db $F1, $08 ; set SRCN
#_0CA037: #_OPENING_7859: db $F2, $60 ; set panning
#_0CA039: #_OPENING_785B: db $8E ; dur 0x0E
#_0CA03A: #_OPENING_785C: db $30 ; rest
#_0CA03B: #_OPENING_785D: db $30 ; rest
#_0CA03C: #_OPENING_785E: db $30 ; rest
#_0CA03D: #_OPENING_785F: db $30 ; rest
#_0CA03E: #_OPENING_7860: db $1A ; play note D4
#_0CA03F: #_OPENING_7861: db $31 ; tie
#_0CA040: #_OPENING_7862: db $31 ; tie
#_0CA041: #_OPENING_7863: db $31 ; tie
#_0CA042: #_OPENING_7864: db $FF ; end track

OPENING_SEGMENT_7865:
#_0CA043: #_OPENING_7865: db $70 ; vol 0x10
#_0CA044: #_OPENING_7866: db $F0, $F0, $E0 ; set ADSR
#_0CA047: #_OPENING_7869: db $F1, $08 ; set SRCN
#_0CA049: #_OPENING_786B: db $F2, $60 ; set panning
#_0CA04B: #_OPENING_786D: db $8E ; dur 0x0E
#_0CA04C: #_OPENING_786E: db $30 ; rest
#_0CA04D: #_OPENING_786F: db $30 ; rest
#_0CA04E: #_OPENING_7870: db $30 ; rest
#_0CA04F: #_OPENING_7871: db $30 ; rest
#_0CA050: #_OPENING_7872: db $18 ; play note C4
#_0CA051: #_OPENING_7873: db $31 ; tie
#_0CA052: #_OPENING_7874: db $31 ; tie
#_0CA053: #_OPENING_7875: db $31 ; tie
#_0CA054: #_OPENING_7876: db $FF ; end track

OPENING_SEGMENT_7877:
#_0CA055: #_OPENING_7877: db $70 ; vol 0x10
#_0CA056: #_OPENING_7878: db $F0, $F0, $E0 ; set ADSR
#_0CA059: #_OPENING_787B: db $F1, $08 ; set SRCN
#_0CA05B: #_OPENING_787D: db $F2, $60 ; set panning
#_0CA05D: #_OPENING_787F: db $8E ; dur 0x0E
#_0CA05E: #_OPENING_7880: db $30 ; rest
#_0CA05F: #_OPENING_7881: db $30 ; rest
#_0CA060: #_OPENING_7882: db $30 ; rest
#_0CA061: #_OPENING_7883: db $30 ; rest
#_0CA062: #_OPENING_7884: db $15 ; play note A3
#_0CA063: #_OPENING_7885: db $31 ; tie
#_0CA064: #_OPENING_7886: db $31 ; tie
#_0CA065: #_OPENING_7887: db $31 ; tie
#_0CA066: #_OPENING_7888: db $FF ; end track

OPENING_SEGMENT_7889:
#_0CA067: #_OPENING_7889: db $76 ; vol 0x16
#_0CA068: #_OPENING_788A: db $F0, $F0, $E0 ; set ADSR
#_0CA06B: #_OPENING_788D: db $F1, $02 ; set SRCN
#_0CA06D: #_OPENING_788F: db $F2, $58 ; set panning
#_0CA06F: #_OPENING_7891: db $F9, $10 ; set fine tuning
#_0CA071: #_OPENING_7893: db $8E ; dur 0x0E
#_0CA072: #_OPENING_7894: db $15 ; play note A3
#_0CA073: #_OPENING_7895: db $31 ; tie
#_0CA074: #_OPENING_7896: db $31 ; tie
#_0CA075: #_OPENING_7897: db $31 ; tie
#_0CA076: #_OPENING_7898: db $31 ; tie
#_0CA077: #_OPENING_7899: db $31 ; tie
#_0CA078: #_OPENING_789A: db $31 ; tie
#_0CA079: #_OPENING_789B: db $31 ; tie
#_0CA07A: #_OPENING_789C: db $FF ; end track

OPENING_SEGMENT_789D:
#_0CA07B: #_OPENING_789D: db $66 ; vol 0x06
#_0CA07C: #_OPENING_789E: db $F0, $F0, $E0 ; set ADSR
#_0CA07F: #_OPENING_78A1: db $F1, $02 ; set SRCN
#_0CA081: #_OPENING_78A3: db $F2, $58 ; set panning
#_0CA083: #_OPENING_78A5: db $8E ; dur 0x0E
#_0CA084: #_OPENING_78A6: db $15 ; play note A3
#_0CA085: #_OPENING_78A7: db $31 ; tie
#_0CA086: #_OPENING_78A8: db $31 ; tie
#_0CA087: #_OPENING_78A9: db $31 ; tie
#_0CA088: #_OPENING_78AA: db $31 ; tie
#_0CA089: #_OPENING_78AB: db $31 ; tie
#_0CA08A: #_OPENING_78AC: db $31 ; tie
#_0CA08B: #_OPENING_78AD: db $31 ; tie
#_0CA08C: #_OPENING_78AE: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Dream_SPC_Data:
#_0CA08D: dw $00CB, $0000

SONG_DREAM:
#_0CA091: #_DREAM_7800: db $F1, $00 ; Set control
#_0CA093: #_DREAM_7802: db $00 : dw DREAM_SEGMENT_781B ; Music channel 0
#_0CA096: #_DREAM_7805: db $01 : dw DREAM_SEGMENT_782A ; Music channel 1
#_0CA099: #_DREAM_7808: db $02 : dw DREAM_SEGMENT_783B ; Music channel 2
#_0CA09C: #_DREAM_780B: db $03 : dw DREAM_SEGMENT_784C ; Music channel 3
#_0CA09F: #_DREAM_780E: db $04 : dw DREAM_SEGMENT_785D ; Music channel 4
#_0CA0A2: #_DREAM_7811: db $05 : dw DREAM_SEGMENT_7876 ; Music channel 5
#_0CA0A5: #_DREAM_7814: db $06 : dw DREAM_SEGMENT_7877 ; Music channel 6
#_0CA0A8: #_DREAM_7817: db $07 : dw DREAM_SEGMENT_7884 ; Music channel 7
#_0CA0AB: #_DREAM_781A: db $FF ; end of header

DREAM_SEGMENT_781B:
#_0CA0AC: #_DREAM_781B: db $74 ; vol 0x14
#_0CA0AD: #_DREAM_781C: db $F0, $FC, $EB ; set ADSR
#_0CA0B0: #_DREAM_781F: db $F1, $03 ; set SRCN
#_0CA0B2: #_DREAM_7821: db $F2, $60 ; set panning
#_0CA0B4: #_DREAM_7823: db $8C ; dur 0x0C

DREAM_SEGMENT_7824:
#_0CA0B5: #_DREAM_7824: db $0C ; play note C3
#_0CA0B6: #_DREAM_7825: db $0D ; play note Cs3
#_0CA0B7: #_DREAM_7826: db $F8 : dw DREAM_SEGMENT_7824 ; goto location
#_0CA0BA: #_DREAM_7829: db $FF ; end track

DREAM_SEGMENT_782A:
#_0CA0BB: #_DREAM_782A: db $64 ; vol 0x04
#_0CA0BC: #_DREAM_782B: db $F0, $FC, $EB ; set ADSR
#_0CA0BF: #_DREAM_782E: db $F1, $03 ; set SRCN
#_0CA0C1: #_DREAM_7830: db $F2, $60 ; set panning
#_0CA0C3: #_DREAM_7832: db $88 ; dur 0x08
#_0CA0C4: #_DREAM_7833: db $30 ; rest
#_0CA0C5: #_DREAM_7834: db $8C ; dur 0x0C

DREAM_SEGMENT_7835:
#_0CA0C6: #_DREAM_7835: db $10 ; play note E3
#_0CA0C7: #_DREAM_7836: db $17 ; play note B3
#_0CA0C8: #_DREAM_7837: db $F8 : dw DREAM_SEGMENT_7835 ; goto location
#_0CA0CB: #_DREAM_783A: db $FF ; end track

DREAM_SEGMENT_783B:
#_0CA0CC: #_DREAM_783B: db $72 ; vol 0x12
#_0CA0CD: #_DREAM_783C: db $F0, $FC, $EB ; set ADSR
#_0CA0D0: #_DREAM_783F: db $F1, $03 ; set SRCN
#_0CA0D2: #_DREAM_7841: db $F2, $60 ; set panning
#_0CA0D4: #_DREAM_7843: db $8A ; dur 0x0A
#_0CA0D5: #_DREAM_7844: db $30 ; rest
#_0CA0D6: #_DREAM_7845: db $8C ; dur 0x0C

DREAM_SEGMENT_7846:
#_0CA0D7: #_DREAM_7846: db $14 ; play note Gs3
#_0CA0D8: #_DREAM_7847: db $14 ; play note Gs3
#_0CA0D9: #_DREAM_7848: db $F8 : dw DREAM_SEGMENT_7846 ; goto location
#_0CA0DC: #_DREAM_784B: db $FF ; end track

DREAM_SEGMENT_784C:
#_0CA0DD: #_DREAM_784C: db $62 ; vol 0x02
#_0CA0DE: #_DREAM_784D: db $F0, $FC, $EB ; set ADSR
#_0CA0E1: #_DREAM_7850: db $F1, $03 ; set SRCN
#_0CA0E3: #_DREAM_7852: db $F2, $60 ; set panning
#_0CA0E5: #_DREAM_7854: db $8B ; dur 0x0B
#_0CA0E6: #_DREAM_7855: db $30 ; rest
#_0CA0E7: #_DREAM_7856: db $8C ; dur 0x0C

DREAM_SEGMENT_7857:
#_0CA0E8: #_DREAM_7857: db $18 ; play note C4
#_0CA0E9: #_DREAM_7858: db $11 ; play note F3
#_0CA0EA: #_DREAM_7859: db $F8 : dw DREAM_SEGMENT_7857 ; goto location
#_0CA0ED: #_DREAM_785C: db $FF ; end track

DREAM_SEGMENT_785D:
#_0CA0EE: #_DREAM_785D: db $70 ; vol 0x10
#_0CA0EF: #_DREAM_785E: db $F0, $FA, $EB ; set ADSR
#_0CA0F2: #_DREAM_7861: db $F1, $03 ; set SRCN
#_0CA0F4: #_DREAM_7863: db $F2, $6C ; set panning
#_0CA0F6: #_DREAM_7865: db $F9, $10 ; set fine tuning
#_0CA0F8: #_DREAM_7867: db $87 ; dur 0x07
#_0CA0F9: #_DREAM_7868: db $30 ; rest
#_0CA0FA: #_DREAM_7869: db $88 ; dur 0x08

DREAM_SEGMENT_786A:
#_0CA0FB: #_DREAM_786A: db $0C ; play note C3
#_0CA0FC: #_DREAM_786B: db $10 ; play note E3
#_0CA0FD: #_DREAM_786C: db $14 ; play note Gs3
#_0CA0FE: #_DREAM_786D: db $18 ; play note C4
#_0CA0FF: #_DREAM_786E: db $0D ; play note Cs3
#_0CA100: #_DREAM_786F: db $17 ; play note B3
#_0CA101: #_DREAM_7870: db $14 ; play note Gs3
#_0CA102: #_DREAM_7871: db $11 ; play note F3
#_0CA103: #_DREAM_7872: db $F8 : dw DREAM_SEGMENT_786A ; goto location
#_0CA106: #_DREAM_7875: db $FF ; end track

DREAM_SEGMENT_7876:
#_0CA107: #_DREAM_7876: db $FF ; end track

DREAM_SEGMENT_7877:
#_0CA108: #_DREAM_7877: db $89 ; dur 0x09
#_0CA109: #_DREAM_7878: db $30 ; rest
#_0CA10A: #_DREAM_7879: db $F0, $FA, $E8 ; set ADSR
#_0CA10D: #_DREAM_787C: db $F2, $6E ; set panning
#_0CA10F: #_DREAM_787E: db $F9, $40 ; set fine tuning
#_0CA111: #_DREAM_7880: db $F8 : dw DREAM_SEGMENT_7889 ; goto location
#_0CA114: #_DREAM_7883: db $FF ; end track

DREAM_SEGMENT_7884:
#_0CA115: #_DREAM_7884: db $F0, $FE, $E8 ; set ADSR
#_0CA118: #_DREAM_7887: db $F2, $64 ; set panning

DREAM_SEGMENT_7889:
#_0CA11A: #_DREAM_7889: db $8E ; dur 0x0E
#_0CA11B: #_DREAM_788A: db $30 ; rest
#_0CA11C: #_DREAM_788B: db $30 ; rest
#_0CA11D: #_DREAM_788C: db $30 ; rest
#_0CA11E: #_DREAM_788D: db $8D ; dur 0x0D
#_0CA11F: #_DREAM_788E: db $30 ; rest
#_0CA120: #_DREAM_788F: db $70 ; vol 0x10
#_0CA121: #_DREAM_7890: db $F1, $06 ; set SRCN
#_0CA123: #_DREAM_7892: db $8A ; dur 0x0A
#_0CA124: #_DREAM_7893: db $21 ; play note A4
#_0CA125: #_DREAM_7894: db $8E ; dur 0x0E
#_0CA126: #_DREAM_7895: db $28 ; play note E5
#_0CA127: #_DREAM_7896: db $E8, $00 ; enable vibrato
#_0CA129: #_DREAM_7898: db $31 ; tie
#_0CA12A: #_DREAM_7899: db $31 ; tie
#_0CA12B: #_DREAM_789A: db $31 ; tie
#_0CA12C: #_DREAM_789B: db $8D ; dur 0x0D
#_0CA12D: #_DREAM_789C: db $31 ; tie
#_0CA12E: #_DREAM_789D: db $E9 ; disable vibrato
#_0CA12F: #_DREAM_789E: db $8A ; dur 0x0A
#_0CA130: #_DREAM_789F: db $21 ; play note A4
#_0CA131: #_DREAM_78A0: db $2B ; play note G5
#_0CA132: #_DREAM_78A1: db $8D ; dur 0x0D
#_0CA133: #_DREAM_78A2: db $2A ; play note Fs5
#_0CA134: #_DREAM_78A3: db $E8, $00 ; enable vibrato
#_0CA136: #_DREAM_78A5: db $8E ; dur 0x0E
#_0CA137: #_DREAM_78A6: db $31 ; tie
#_0CA138: #_DREAM_78A7: db $31 ; tie
#_0CA139: #_DREAM_78A8: db $31 ; tie
#_0CA13A: #_DREAM_78A9: db $8D ; dur 0x0D
#_0CA13B: #_DREAM_78AA: db $31 ; tie
#_0CA13C: #_DREAM_78AB: db $E9 ; disable vibrato
#_0CA13D: #_DREAM_78AC: db $8A ; dur 0x0A
#_0CA13E: #_DREAM_78AD: db $21 ; play note A4
#_0CA13F: #_DREAM_78AE: db $8B ; dur 0x0B
#_0CA140: #_DREAM_78AF: db $2B ; play note G5
#_0CA141: #_DREAM_78B0: db $2D ; play note A5
#_0CA142: #_DREAM_78B1: db $8A ; dur 0x0A
#_0CA143: #_DREAM_78B2: db $2A ; play note Fs5
#_0CA144: #_DREAM_78B3: db $8B ; dur 0x0B
#_0CA145: #_DREAM_78B4: db $2B ; play note G5
#_0CA146: #_DREAM_78B5: db $29 ; play note F5
#_0CA147: #_DREAM_78B6: db $8A ; dur 0x0A
#_0CA148: #_DREAM_78B7: db $31 ; tie
#_0CA149: #_DREAM_78B8: db $E8, $00 ; enable vibrato
#_0CA14B: #_DREAM_78BA: db $8E ; dur 0x0E
#_0CA14C: #_DREAM_78BB: db $31 ; tie
#_0CA14D: #_DREAM_78BC: db $31 ; tie
#_0CA14E: #_DREAM_78BD: db $31 ; tie
#_0CA14F: #_DREAM_78BE: db $E9 ; disable vibrato
#_0CA150: #_DREAM_78BF: db $28 ; play note E5
#_0CA151: #_DREAM_78C0: db $31 ; tie
#_0CA152: #_DREAM_78C1: db $31 ; tie
#_0CA153: #_DREAM_78C2: db $E3, $F8 ; pitch bend on
#_0CA155: #_DREAM_78C4: db $31 ; tie
#_0CA156: #_DREAM_78C5: db $31 ; tie
#_0CA157: #_DREAM_78C6: db $E2 ; pitch bend off
#_0CA158: #_DREAM_78C7: db $F8 : dw DREAM_SEGMENT_7889 ; goto location
#_0CA15B: #_DREAM_78CA: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Title_SPC_Data:
#_0CA15C: dw $0083, $0000

SONG_TITLE:
#_0CA160: #_TITLE_7800: db $F1, $00 ; Set control
#_0CA162: #_TITLE_7802: db $00 : dw TITLE_SEGMENT_781B ; Music channel 0
#_0CA165: #_TITLE_7805: db $01 : dw TITLE_SEGMENT_782D ; Music channel 1
#_0CA168: #_TITLE_7808: db $02 : dw TITLE_SEGMENT_783D ; Music channel 2
#_0CA16B: #_TITLE_780B: db $03 : dw TITLE_SEGMENT_784D ; Music channel 3
#_0CA16E: #_TITLE_780E: db $04 : dw TITLE_SEGMENT_785D ; Music channel 4
#_0CA171: #_TITLE_7811: db $05 : dw TITLE_SEGMENT_785E ; Music channel 5
#_0CA174: #_TITLE_7814: db $06 : dw TITLE_SEGMENT_785F ; Music channel 6
#_0CA177: #_TITLE_7817: db $07 : dw TITLE_SEGMENT_786F ; Music channel 7
#_0CA17A: #_TITLE_781A: db $FF ; end of header

TITLE_SEGMENT_781B:
#_0CA17B: #_TITLE_781B: db $74 ; vol 0x14
#_0CA17C: #_TITLE_781C: db $F0, $FF, $EB ; set ADSR
#_0CA17F: #_TITLE_781F: db $F1, $08 ; set SRCN
#_0CA181: #_TITLE_7821: db $F2, $54 ; set panning
#_0CA183: #_TITLE_7823: db $F9, $10 ; set fine tuning
#_0CA185: #_TITLE_7825: db $8E ; dur 0x0E

TITLE_SEGMENT_7826:
#_0CA186: #_TITLE_7826: db $10 ; play note E3
#_0CA187: #_TITLE_7827: db $31 ; tie
#_0CA188: #_TITLE_7828: db $31 ; tie
#_0CA189: #_TITLE_7829: db $F8 : dw TITLE_SEGMENT_7826 ; goto location
#_0CA18C: #_TITLE_782C: db $FF ; end track

TITLE_SEGMENT_782D:
#_0CA18D: #_TITLE_782D: db $64 ; vol 0x04
#_0CA18E: #_TITLE_782E: db $F0, $FF, $EB ; set ADSR
#_0CA191: #_TITLE_7831: db $F1, $08 ; set SRCN
#_0CA193: #_TITLE_7833: db $F2, $54 ; set panning
#_0CA195: #_TITLE_7835: db $8E ; dur 0x0E

TITLE_SEGMENT_7836:
#_0CA196: #_TITLE_7836: db $10 ; play note E3
#_0CA197: #_TITLE_7837: db $31 ; tie
#_0CA198: #_TITLE_7838: db $31 ; tie
#_0CA199: #_TITLE_7839: db $F8 : dw TITLE_SEGMENT_7836 ; goto location
#_0CA19C: #_TITLE_783C: db $FF ; end track

TITLE_SEGMENT_783D:
#_0CA19D: #_TITLE_783D: db $70 ; vol 0x10
#_0CA19E: #_TITLE_783E: db $F0, $FF, $EB ; set ADSR
#_0CA1A1: #_TITLE_7841: db $F1, $08 ; set SRCN
#_0CA1A3: #_TITLE_7843: db $F2, $54 ; set panning
#_0CA1A5: #_TITLE_7845: db $8E ; dur 0x0E

TITLE_SEGMENT_7846:
#_0CA1A6: #_TITLE_7846: db $0C ; play note C3
#_0CA1A7: #_TITLE_7847: db $31 ; tie
#_0CA1A8: #_TITLE_7848: db $31 ; tie
#_0CA1A9: #_TITLE_7849: db $F8 : dw TITLE_SEGMENT_7846 ; goto location
#_0CA1AC: #_TITLE_784C: db $FF ; end track

TITLE_SEGMENT_784D:
#_0CA1AD: #_TITLE_784D: db $70 ; vol 0x10
#_0CA1AE: #_TITLE_784E: db $F0, $FF, $EB ; set ADSR
#_0CA1B1: #_TITLE_7851: db $F1, $08 ; set SRCN
#_0CA1B3: #_TITLE_7853: db $F2, $54 ; set panning
#_0CA1B5: #_TITLE_7855: db $8E ; dur 0x0E

TITLE_SEGMENT_7856:
#_0CA1B6: #_TITLE_7856: db $09 ; play note A2
#_0CA1B7: #_TITLE_7857: db $31 ; tie
#_0CA1B8: #_TITLE_7858: db $31 ; tie
#_0CA1B9: #_TITLE_7859: db $F8 : dw TITLE_SEGMENT_7856 ; goto location
#_0CA1BC: #_TITLE_785C: db $FF ; end track

TITLE_SEGMENT_785D:
#_0CA1BD: #_TITLE_785D: db $FF ; end track

TITLE_SEGMENT_785E:
#_0CA1BE: #_TITLE_785E: db $FF ; end track

TITLE_SEGMENT_785F:
#_0CA1BF: #_TITLE_785F: db $70 ; vol 0x10
#_0CA1C0: #_TITLE_7860: db $F0, $FF, $EB ; set ADSR
#_0CA1C3: #_TITLE_7863: db $F1, $02 ; set SRCN
#_0CA1C5: #_TITLE_7865: db $F2, $58 ; set panning
#_0CA1C7: #_TITLE_7867: db $8E ; dur 0x0E

TITLE_SEGMENT_7868:
#_0CA1C8: #_TITLE_7868: db $15 ; play note A3
#_0CA1C9: #_TITLE_7869: db $31 ; tie
#_0CA1CA: #_TITLE_786A: db $31 ; tie
#_0CA1CB: #_TITLE_786B: db $F8 : dw TITLE_SEGMENT_7868 ; goto location
#_0CA1CE: #_TITLE_786E: db $FF ; end track

TITLE_SEGMENT_786F:
#_0CA1CF: #_TITLE_786F: db $70 ; vol 0x10
#_0CA1D0: #_TITLE_7870: db $F0, $FA, $EC ; set ADSR
#_0CA1D3: #_TITLE_7873: db $F1, $00 ; set SRCN
#_0CA1D5: #_TITLE_7875: db $F2, $48 ; set panning

TITLE_SEGMENT_7877:
#_0CA1D7: #_TITLE_7877: db $84 ; dur 0x04
#_0CA1D8: #_TITLE_7878: db $09 ; play note A2
#_0CA1D9: #_TITLE_7879: db $87 ; dur 0x07
#_0CA1DA: #_TITLE_787A: db $30 ; rest
#_0CA1DB: #_TITLE_787B: db $8B ; dur 0x0B
#_0CA1DC: #_TITLE_787C: db $09 ; play note A2
#_0CA1DD: #_TITLE_787D: db $8C ; dur 0x0C
#_0CA1DE: #_TITLE_787E: db $30 ; rest
#_0CA1DF: #_TITLE_787F: db $F8 : dw TITLE_SEGMENT_7877 ; goto location
#_0CA1E2: #_TITLE_7882: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Fusion_SPC_Data:
#_0CA1E3: dw $4044, $0000

SONG_FUSION:
#_0CA1E7: #_FUSION_7000: db $F0 ; reset DSP
#_0CA1E8: #_FUSION_7001: db $F1, $00 ; Set control
#_0CA1EA: #_FUSION_7003: db $00 : dw FUSION_SEGMENT_7010 ; Music channel 0
#_0CA1ED: #_FUSION_7006: db $01 : dw FUSION_SEGMENT_7016 ; Music channel 1
#_0CA1F0: #_FUSION_7009: db $02 : dw FUSION_SEGMENT_7030 ; Music channel 2
#_0CA1F3: #_FUSION_700C: db $03 : dw FUSION_SEGMENT_7036 ; Music channel 3
#_0CA1F6: #_FUSION_700F: db $FF ; end of header

FUSION_SEGMENT_7010:
#_0CA1F7: #_FUSION_7010: db $62 ; vol 0x02
#_0CA1F8: #_FUSION_7011: db $F9, $20 ; set fine tuning
#_0CA1FA: #_FUSION_7013: db $F8 : dw FUSION_SEGMENT_7017 ; goto location

FUSION_SEGMENT_7016:
#_0CA1FD: #_FUSION_7016: db $72 ; vol 0x12

FUSION_SEGMENT_7017:
#_0CA1FE: #_FUSION_7017: db $F2, $6F ; set panning
#_0CA200: #_FUSION_7019: db $F0, $FF, $E0 ; set ADSR
#_0CA203: #_FUSION_701C: db $F1, $08 ; set SRCN
#_0CA205: #_FUSION_701E: db $FB, $30 ; set note length page
#_0CA207: #_FUSION_7020: db $8E ; dur 0x0E
#_0CA208: #_FUSION_7021: db $30 ; rest
#_0CA209: #_FUSION_7022: db $30 ; rest
#_0CA20A: #_FUSION_7023: db $30 ; rest
#_0CA20B: #_FUSION_7024: db $30 ; rest

FUSION_SEGMENT_7025:
#_0CA20C: #_FUSION_7025: db $1B ; play note Ds4
#_0CA20D: #_FUSION_7026: db $31 ; tie
#_0CA20E: #_FUSION_7027: db $1C ; play note E4
#_0CA20F: #_FUSION_7028: db $31 ; tie
#_0CA210: #_FUSION_7029: db $1A ; play note D4
#_0CA211: #_FUSION_702A: db $31 ; tie
#_0CA212: #_FUSION_702B: db $1C ; play note E4
#_0CA213: #_FUSION_702C: db $31 ; tie
#_0CA214: #_FUSION_702D: db $F8 : dw FUSION_SEGMENT_7025 ; goto location

FUSION_SEGMENT_7030:
#_0CA217: #_FUSION_7030: db $64 ; vol 0x04
#_0CA218: #_FUSION_7031: db $F9, $20 ; set fine tuning
#_0CA21A: #_FUSION_7033: db $F8 : dw FUSION_SEGMENT_7037 ; goto location

FUSION_SEGMENT_7036:
#_0CA21D: #_FUSION_7036: db $74 ; vol 0x14

FUSION_SEGMENT_7037:
#_0CA21E: #_FUSION_7037: db $F2, $5C ; set panning
#_0CA220: #_FUSION_7039: db $F0, $FF, $E0 ; set ADSR
#_0CA223: #_FUSION_703C: db $F1, $09 ; set SRCN
#_0CA225: #_FUSION_703E: db $8F ; dur 0x0F
#_0CA226: #_FUSION_703F: db $15 ; play note A3

FUSION_SEGMENT_7040:
#_0CA227: #_FUSION_7040: db $31 ; tie
#_0CA228: #_FUSION_7041: db $F8 : dw FUSION_SEGMENT_7040 ; goto location

;===================================================================================================
; 
;===================================================================================================
Home_SPC_Data:
#_0CA22B: dw $0342, $0000

SONG_HOME:
#_0CA22F: #_HOME_7800: db $F1, $D8 ; Set control
#_0CA231: #_HOME_7802: db $00 : dw HOME_SEGMENT_7827 ; Music channel 0
#_0CA234: #_HOME_7805: db $01 : dw HOME_SEGMENT_782D ; Music channel 1
#_0CA237: #_HOME_7808: db $02 : dw HOME_SEGMENT_794B ; Music channel 2
#_0CA23A: #_HOME_780B: db $03 : dw HOME_SEGMENT_79DE ; Music channel 3
#_0CA23D: #_HOME_780E: db $04 : dw HOME_SEGMENT_781B ; Music channel 4
#_0CA240: #_HOME_7811: db $05 : dw HOME_SEGMENT_78B9 ; Music channel 5
#_0CA243: #_HOME_7814: db $06 : dw HOME_SEGMENT_7A71 ; Music channel 6
#_0CA246: #_HOME_7817: db $07 : dw HOME_SEGMENT_7B00 ; Music channel 7
#_0CA249: #_HOME_781A: db $FF ; end of header

HOME_SEGMENT_781B:
#_0CA24A: #_HOME_781B: db $89 ; dur 0x09
#_0CA24B: #_HOME_781C: db $30 ; rest
#_0CA24C: #_HOME_781D: db $F0, $F9, $F0 ; set ADSR
#_0CA24F: #_HOME_7820: db $F2, $6C ; set panning
#_0CA251: #_HOME_7822: db $F9, $10 ; set fine tuning
#_0CA253: #_HOME_7824: db $F8 : dw HOME_SEGMENT_7833 ; goto location

HOME_SEGMENT_7827:
#_0CA256: #_HOME_7827: db $63 ; vol 0x03
#_0CA257: #_HOME_7828: db $F9, $20 ; set fine tuning
#_0CA259: #_HOME_782A: db $F8 : dw HOME_SEGMENT_782E ; goto location

HOME_SEGMENT_782D:
#_0CA25C: #_HOME_782D: db $73 ; vol 0x13

HOME_SEGMENT_782E:
#_0CA25D: #_HOME_782E: db $F0, $FE, $F0 ; set ADSR
#_0CA260: #_HOME_7831: db $F2, $58 ; set panning

HOME_SEGMENT_7833:
#_0CA262: #_HOME_7833: db $F1, $08 ; set SRCN
#_0CA264: #_HOME_7835: db $F3, $0C ; transpose +12

HOME_SEGMENT_7837:
#_0CA266: #_HOME_7837: db $8C ; dur 0x0C
#_0CA267: #_HOME_7838: db $1A ; play note D4
#_0CA268: #_HOME_7839: db $FC ; fade out
#_0CA269: #_HOME_783A: db $88 ; dur 0x08
#_0CA26A: #_HOME_783B: db $19 ; play note Cs4
#_0CA26B: #_HOME_783C: db $18 ; play note C4
#_0CA26C: #_HOME_783D: db $FD ; disable fade
#_0CA26D: #_HOME_783E: db $8D ; dur 0x0D
#_0CA26E: #_HOME_783F: db $17 ; play note B3
#_0CA26F: #_HOME_7840: db $8C ; dur 0x0C
#_0CA270: #_HOME_7841: db $13 ; play note G3
#_0CA271: #_HOME_7842: db $8A ; dur 0x0A
#_0CA272: #_HOME_7843: db $10 ; play note E3
#_0CA273: #_HOME_7844: db $0D ; play note Cs3
#_0CA274: #_HOME_7845: db $0E ; play note D3
#_0CA275: #_HOME_7846: db $10 ; play note E3
#_0CA276: #_HOME_7847: db $11 ; play note F3
#_0CA277: #_HOME_7848: db $13 ; play note G3
#_0CA278: #_HOME_7849: db $15 ; play note A3
#_0CA279: #_HOME_784A: db $17 ; play note B3
#_0CA27A: #_HOME_784B: db $18 ; play note C4
#_0CA27B: #_HOME_784C: db $1A ; play note D4
#_0CA27C: #_HOME_784D: db $1C ; play note E4
#_0CA27D: #_HOME_784E: db $1A ; play note D4
#_0CA27E: #_HOME_784F: db $18 ; play note C4
#_0CA27F: #_HOME_7850: db $8D ; dur 0x0D
#_0CA280: #_HOME_7851: db $17 ; play note B3
#_0CA281: #_HOME_7852: db $8A ; dur 0x0A
#_0CA282: #_HOME_7853: db $13 ; play note G3
#_0CA283: #_HOME_7854: db $1A ; play note D4
#_0CA284: #_HOME_7855: db $18 ; play note C4
#_0CA285: #_HOME_7856: db $8D ; dur 0x0D
#_0CA286: #_HOME_7857: db $17 ; play note B3
#_0CA287: #_HOME_7858: db $8C ; dur 0x0C
#_0CA288: #_HOME_7859: db $13 ; play note G3
#_0CA289: #_HOME_785A: db $8A ; dur 0x0A
#_0CA28A: #_HOME_785B: db $1A ; play note D4
#_0CA28B: #_HOME_785C: db $8D ; dur 0x0D
#_0CA28C: #_HOME_785D: db $17 ; play note B3
#_0CA28D: #_HOME_785E: db $13 ; play note G3
#_0CA28E: #_HOME_785F: db $8A ; dur 0x0A
#_0CA28F: #_HOME_7860: db $11 ; play note F3
#_0CA290: #_HOME_7861: db $13 ; play note G3
#_0CA291: #_HOME_7862: db $15 ; play note A3
#_0CA292: #_HOME_7863: db $17 ; play note B3
#_0CA293: #_HOME_7864: db $18 ; play note C4
#_0CA294: #_HOME_7865: db $1A ; play note D4
#_0CA295: #_HOME_7866: db $1D ; play note F4
#_0CA296: #_HOME_7867: db $1C ; play note E4
#_0CA297: #_HOME_7868: db $1A ; play note D4
#_0CA298: #_HOME_7869: db $17 ; play note B3
#_0CA299: #_HOME_786A: db $18 ; play note C4
#_0CA29A: #_HOME_786B: db $1A ; play note D4
#_0CA29B: #_HOME_786C: db $88 ; dur 0x08
#_0CA29C: #_HOME_786D: db $13 ; play note G3
#_0CA29D: #_HOME_786E: db $18 ; play note C4
#_0CA29E: #_HOME_786F: db $1D ; play note F4
#_0CA29F: #_HOME_7870: db $18 ; play note C4
#_0CA2A0: #_HOME_7871: db $1D ; play note F4
#_0CA2A1: #_HOME_7872: db $18 ; play note C4
#_0CA2A2: #_HOME_7873: db $8C ; dur 0x0C
#_0CA2A3: #_HOME_7874: db $1F ; play note G4
#_0CA2A4: #_HOME_7875: db $88 ; dur 0x08
#_0CA2A5: #_HOME_7876: db $1D ; play note F4
#_0CA2A6: #_HOME_7877: db $1C ; play note E4
#_0CA2A7: #_HOME_7878: db $8D ; dur 0x0D
#_0CA2A8: #_HOME_7879: db $17 ; play note B3
#_0CA2A9: #_HOME_787A: db $8C ; dur 0x0C
#_0CA2AA: #_HOME_787B: db $13 ; play note G3
#_0CA2AB: #_HOME_787C: db $88 ; dur 0x08
#_0CA2AC: #_HOME_787D: db $15 ; play note A3
#_0CA2AD: #_HOME_787E: db $17 ; play note B3
#_0CA2AE: #_HOME_787F: db $8A ; dur 0x0A
#_0CA2AF: #_HOME_7880: db $11 ; play note F3
#_0CA2B0: #_HOME_7881: db $15 ; play note A3
#_0CA2B1: #_HOME_7882: db $18 ; play note C4
#_0CA2B2: #_HOME_7883: db $88 ; dur 0x08
#_0CA2B3: #_HOME_7884: db $1C ; play note E4
#_0CA2B4: #_HOME_7885: db $1B ; play note Ds4
#_0CA2B5: #_HOME_7886: db $1A ; play note D4
#_0CA2B6: #_HOME_7887: db $18 ; play note C4
#_0CA2B7: #_HOME_7888: db $17 ; play note B3
#_0CA2B8: #_HOME_7889: db $15 ; play note A3
#_0CA2B9: #_HOME_788A: db $8A ; dur 0x0A
#_0CA2BA: #_HOME_788B: db $13 ; play note G3
#_0CA2BB: #_HOME_788C: db $17 ; play note B3
#_0CA2BC: #_HOME_788D: db $1A ; play note D4
#_0CA2BD: #_HOME_788E: db $8C ; dur 0x0C
#_0CA2BE: #_HOME_788F: db $1D ; play note F4
#_0CA2BF: #_HOME_7890: db $88 ; dur 0x08
#_0CA2C0: #_HOME_7891: db $1C ; play note E4
#_0CA2C1: #_HOME_7892: db $1A ; play note D4
#_0CA2C2: #_HOME_7893: db $88 ; dur 0x08
#_0CA2C3: #_HOME_7894: db $13 ; play note G3
#_0CA2C4: #_HOME_7895: db $18 ; play note C4
#_0CA2C5: #_HOME_7896: db $1D ; play note F4
#_0CA2C6: #_HOME_7897: db $13 ; play note G3
#_0CA2C7: #_HOME_7898: db $18 ; play note C4
#_0CA2C8: #_HOME_7899: db $1D ; play note F4
#_0CA2C9: #_HOME_789A: db $8C ; dur 0x0C
#_0CA2CA: #_HOME_789B: db $1F ; play note G4
#_0CA2CB: #_HOME_789C: db $88 ; dur 0x08
#_0CA2CC: #_HOME_789D: db $1D ; play note F4
#_0CA2CD: #_HOME_789E: db $18 ; play note C4
#_0CA2CE: #_HOME_789F: db $8A ; dur 0x0A
#_0CA2CF: #_HOME_78A0: db $1C ; play note E4
#_0CA2D0: #_HOME_78A1: db $1D ; play note F4
#_0CA2D1: #_HOME_78A2: db $1F ; play note G4
#_0CA2D2: #_HOME_78A3: db $8C ; dur 0x0C
#_0CA2D3: #_HOME_78A4: db $17 ; play note B3
#_0CA2D4: #_HOME_78A5: db $88 ; dur 0x08
#_0CA2D5: #_HOME_78A6: db $13 ; play note G3
#_0CA2D6: #_HOME_78A7: db $1A ; play note D4
#_0CA2D7: #_HOME_78A8: db $18 ; play note C4
#_0CA2D8: #_HOME_78A9: db $17 ; play note B3
#_0CA2D9: #_HOME_78AA: db $15 ; play note A3
#_0CA2DA: #_HOME_78AB: db $17 ; play note B3
#_0CA2DB: #_HOME_78AC: db $18 ; play note C4
#_0CA2DC: #_HOME_78AD: db $1A ; play note D4
#_0CA2DD: #_HOME_78AE: db $8A ; dur 0x0A
#_0CA2DE: #_HOME_78AF: db $1C ; play note E4
#_0CA2DF: #_HOME_78B0: db $1A ; play note D4
#_0CA2E0: #_HOME_78B1: db $18 ; play note C4
#_0CA2E1: #_HOME_78B2: db $8C ; dur 0x0C
#_0CA2E2: #_HOME_78B3: db $17 ; play note B3
#_0CA2E3: #_HOME_78B4: db $8A ; dur 0x0A
#_0CA2E4: #_HOME_78B5: db $18 ; play note C4
#_0CA2E5: #_HOME_78B6: db $F8 : dw HOME_SEGMENT_7837 ; goto location

HOME_SEGMENT_78B9:
#_0CA2E8: #_HOME_78B9: db $8D ; dur 0x0D
#_0CA2E9: #_HOME_78BA: db $30 ; rest
#_0CA2EA: #_HOME_78BB: db $89 ; dur 0x09
#_0CA2EB: #_HOME_78BC: db $30 ; rest
#_0CA2EC: #_HOME_78BD: db $8A ; dur 0x0A
#_0CA2ED: #_HOME_78BE: db $30 ; rest
#_0CA2EE: #_HOME_78BF: db $F0, $FA, $F0 ; set ADSR
#_0CA2F1: #_HOME_78C2: db $F1, $09 ; set SRCN
#_0CA2F3: #_HOME_78C4: db $F2, $70 ; set panning
#_0CA2F5: #_HOME_78C6: db $F3, $01 ; transpose +1
#_0CA2F7: #_HOME_78C8: db $F9, $18 ; set fine tuning
#_0CA2F9: #_HOME_78CA: db $F4, $04 ; set loop point B
#_0CA2FB: #_HOME_78CC: db $8A ; dur 0x0A
#_0CA2FC: #_HOME_78CD: db $17 ; play note B3
#_0CA2FD: #_HOME_78CE: db $8C ; dur 0x0C
#_0CA2FE: #_HOME_78CF: db $17 ; play note B3
#_0CA2FF: #_HOME_78D0: db $F5 ; run loop B
#_0CA300: #_HOME_78D1: db $F4, $03 ; set loop point B
#_0CA302: #_HOME_78D3: db $8A ; dur 0x0A
#_0CA303: #_HOME_78D4: db $18 ; play note C4
#_0CA304: #_HOME_78D5: db $8C ; dur 0x0C
#_0CA305: #_HOME_78D6: db $18 ; play note C4
#_0CA306: #_HOME_78D7: db $F5 ; run loop B
#_0CA307: #_HOME_78D8: db $8A ; dur 0x0A
#_0CA308: #_HOME_78D9: db $1A ; play note D4
#_0CA309: #_HOME_78DA: db $8C ; dur 0x0C
#_0CA30A: #_HOME_78DB: db $1A ; play note D4
#_0CA30B: #_HOME_78DC: db $F4, $04 ; set loop point B
#_0CA30D: #_HOME_78DE: db $8A ; dur 0x0A
#_0CA30E: #_HOME_78DF: db $17 ; play note B3
#_0CA30F: #_HOME_78E0: db $8C ; dur 0x0C
#_0CA310: #_HOME_78E1: db $17 ; play note B3
#_0CA311: #_HOME_78E2: db $F5 ; run loop B
#_0CA312: #_HOME_78E3: db $F4, $03 ; set loop point B
#_0CA314: #_HOME_78E5: db $8A ; dur 0x0A
#_0CA315: #_HOME_78E6: db $18 ; play note C4
#_0CA316: #_HOME_78E7: db $8C ; dur 0x0C
#_0CA317: #_HOME_78E8: db $18 ; play note C4
#_0CA318: #_HOME_78E9: db $F5 ; run loop B
#_0CA319: #_HOME_78EA: db $8A ; dur 0x0A
#_0CA31A: #_HOME_78EB: db $1A ; play note D4
#_0CA31B: #_HOME_78EC: db $1A ; play note D4
#_0CA31C: #_HOME_78ED: db $88 ; dur 0x08
#_0CA31D: #_HOME_78EE: db $11 ; play note F3
#_0CA31E: #_HOME_78EF: db $15 ; play note A3
#_0CA31F: #_HOME_78F0: db $18 ; play note C4
#_0CA320: #_HOME_78F1: db $1C ; play note E4
#_0CA321: #_HOME_78F2: db $18 ; play note C4
#_0CA322: #_HOME_78F3: db $15 ; play note A3
#_0CA323: #_HOME_78F4: db $11 ; play note F3
#_0CA324: #_HOME_78F5: db $15 ; play note A3
#_0CA325: #_HOME_78F6: db $18 ; play note C4
#_0CA326: #_HOME_78F7: db $1C ; play note E4
#_0CA327: #_HOME_78F8: db $18 ; play note C4
#_0CA328: #_HOME_78F9: db $15 ; play note A3
#_0CA329: #_HOME_78FA: db $10 ; play note E3
#_0CA32A: #_HOME_78FB: db $13 ; play note G3
#_0CA32B: #_HOME_78FC: db $17 ; play note B3
#_0CA32C: #_HOME_78FD: db $1A ; play note D4
#_0CA32D: #_HOME_78FE: db $17 ; play note B3
#_0CA32E: #_HOME_78FF: db $13 ; play note G3
#_0CA32F: #_HOME_7900: db $10 ; play note E3
#_0CA330: #_HOME_7901: db $13 ; play note G3
#_0CA331: #_HOME_7902: db $17 ; play note B3
#_0CA332: #_HOME_7903: db $1A ; play note D4
#_0CA333: #_HOME_7904: db $17 ; play note B3
#_0CA334: #_HOME_7905: db $13 ; play note G3
#_0CA335: #_HOME_7906: db $0E ; play note D3
#_0CA336: #_HOME_7907: db $11 ; play note F3
#_0CA337: #_HOME_7908: db $15 ; play note A3
#_0CA338: #_HOME_7909: db $18 ; play note C4
#_0CA339: #_HOME_790A: db $15 ; play note A3
#_0CA33A: #_HOME_790B: db $11 ; play note F3
#_0CA33B: #_HOME_790C: db $0E ; play note D3
#_0CA33C: #_HOME_790D: db $11 ; play note F3
#_0CA33D: #_HOME_790E: db $15 ; play note A3
#_0CA33E: #_HOME_790F: db $18 ; play note C4
#_0CA33F: #_HOME_7910: db $15 ; play note A3
#_0CA340: #_HOME_7911: db $11 ; play note F3
#_0CA341: #_HOME_7912: db $10 ; play note E3
#_0CA342: #_HOME_7913: db $13 ; play note G3
#_0CA343: #_HOME_7914: db $17 ; play note B3
#_0CA344: #_HOME_7915: db $1A ; play note D4
#_0CA345: #_HOME_7916: db $17 ; play note B3
#_0CA346: #_HOME_7917: db $13 ; play note G3
#_0CA347: #_HOME_7918: db $10 ; play note E3
#_0CA348: #_HOME_7919: db $13 ; play note G3
#_0CA349: #_HOME_791A: db $17 ; play note B3
#_0CA34A: #_HOME_791B: db $1A ; play note D4
#_0CA34B: #_HOME_791C: db $17 ; play note B3
#_0CA34C: #_HOME_791D: db $13 ; play note G3
#_0CA34D: #_HOME_791E: db $11 ; play note F3
#_0CA34E: #_HOME_791F: db $15 ; play note A3
#_0CA34F: #_HOME_7920: db $18 ; play note C4
#_0CA350: #_HOME_7921: db $1C ; play note E4
#_0CA351: #_HOME_7922: db $18 ; play note C4
#_0CA352: #_HOME_7923: db $15 ; play note A3
#_0CA353: #_HOME_7924: db $11 ; play note F3
#_0CA354: #_HOME_7925: db $15 ; play note A3
#_0CA355: #_HOME_7926: db $18 ; play note C4
#_0CA356: #_HOME_7927: db $1C ; play note E4
#_0CA357: #_HOME_7928: db $18 ; play note C4
#_0CA358: #_HOME_7929: db $15 ; play note A3
#_0CA359: #_HOME_792A: db $10 ; play note E3
#_0CA35A: #_HOME_792B: db $13 ; play note G3
#_0CA35B: #_HOME_792C: db $17 ; play note B3
#_0CA35C: #_HOME_792D: db $1A ; play note D4
#_0CA35D: #_HOME_792E: db $17 ; play note B3
#_0CA35E: #_HOME_792F: db $13 ; play note G3
#_0CA35F: #_HOME_7930: db $10 ; play note E3
#_0CA360: #_HOME_7931: db $13 ; play note G3
#_0CA361: #_HOME_7932: db $17 ; play note B3
#_0CA362: #_HOME_7933: db $1A ; play note D4
#_0CA363: #_HOME_7934: db $17 ; play note B3
#_0CA364: #_HOME_7935: db $13 ; play note G3
#_0CA365: #_HOME_7936: db $0E ; play note D3
#_0CA366: #_HOME_7937: db $11 ; play note F3
#_0CA367: #_HOME_7938: db $15 ; play note A3
#_0CA368: #_HOME_7939: db $18 ; play note C4
#_0CA369: #_HOME_793A: db $15 ; play note A3
#_0CA36A: #_HOME_793B: db $11 ; play note F3
#_0CA36B: #_HOME_793C: db $0E ; play note D3
#_0CA36C: #_HOME_793D: db $11 ; play note F3
#_0CA36D: #_HOME_793E: db $15 ; play note A3
#_0CA36E: #_HOME_793F: db $18 ; play note C4
#_0CA36F: #_HOME_7940: db $15 ; play note A3
#_0CA370: #_HOME_7941: db $11 ; play note F3
#_0CA371: #_HOME_7942: db $10 ; play note E3
#_0CA372: #_HOME_7943: db $13 ; play note G3
#_0CA373: #_HOME_7944: db $17 ; play note B3
#_0CA374: #_HOME_7945: db $1A ; play note D4
#_0CA375: #_HOME_7946: db $17 ; play note B3
#_0CA376: #_HOME_7947: db $13 ; play note G3
#_0CA377: #_HOME_7948: db $8D ; dur 0x0D
#_0CA378: #_HOME_7949: db $1A ; play note D4
#_0CA379: #_HOME_794A: db $FF ; end track

HOME_SEGMENT_794B:
#_0CA37A: #_HOME_794B: db $8D ; dur 0x0D
#_0CA37B: #_HOME_794C: db $30 ; rest
#_0CA37C: #_HOME_794D: db $70 ; vol 0x10
#_0CA37D: #_HOME_794E: db $F0, $FE, $F0 ; set ADSR
#_0CA380: #_HOME_7951: db $F1, $09 ; set SRCN
#_0CA382: #_HOME_7953: db $F2, $68 ; set panning
#_0CA384: #_HOME_7955: db $F3, $01 ; transpose +1
#_0CA386: #_HOME_7957: db $8A ; dur 0x0A
#_0CA387: #_HOME_7958: db $30 ; rest

HOME_SEGMENT_7959:
#_0CA388: #_HOME_7959: db $F4, $04 ; set loop point B
#_0CA38A: #_HOME_795B: db $8A ; dur 0x0A
#_0CA38B: #_HOME_795C: db $17 ; play note B3
#_0CA38C: #_HOME_795D: db $8C ; dur 0x0C
#_0CA38D: #_HOME_795E: db $17 ; play note B3
#_0CA38E: #_HOME_795F: db $F5 ; run loop B
#_0CA38F: #_HOME_7960: db $F4, $03 ; set loop point B
#_0CA391: #_HOME_7962: db $8A ; dur 0x0A
#_0CA392: #_HOME_7963: db $18 ; play note C4
#_0CA393: #_HOME_7964: db $8C ; dur 0x0C
#_0CA394: #_HOME_7965: db $18 ; play note C4
#_0CA395: #_HOME_7966: db $F5 ; run loop B
#_0CA396: #_HOME_7967: db $8A ; dur 0x0A
#_0CA397: #_HOME_7968: db $1A ; play note D4
#_0CA398: #_HOME_7969: db $8C ; dur 0x0C
#_0CA399: #_HOME_796A: db $1A ; play note D4
#_0CA39A: #_HOME_796B: db $F4, $04 ; set loop point B
#_0CA39C: #_HOME_796D: db $8A ; dur 0x0A
#_0CA39D: #_HOME_796E: db $17 ; play note B3
#_0CA39E: #_HOME_796F: db $8C ; dur 0x0C
#_0CA39F: #_HOME_7970: db $17 ; play note B3
#_0CA3A0: #_HOME_7971: db $F5 ; run loop B
#_0CA3A1: #_HOME_7972: db $F4, $03 ; set loop point B
#_0CA3A3: #_HOME_7974: db $8A ; dur 0x0A
#_0CA3A4: #_HOME_7975: db $18 ; play note C4
#_0CA3A5: #_HOME_7976: db $8C ; dur 0x0C
#_0CA3A6: #_HOME_7977: db $18 ; play note C4
#_0CA3A7: #_HOME_7978: db $F5 ; run loop B
#_0CA3A8: #_HOME_7979: db $8A ; dur 0x0A
#_0CA3A9: #_HOME_797A: db $1A ; play note D4
#_0CA3AA: #_HOME_797B: db $1A ; play note D4
#_0CA3AB: #_HOME_797C: db $88 ; dur 0x08
#_0CA3AC: #_HOME_797D: db $11 ; play note F3
#_0CA3AD: #_HOME_797E: db $31 ; tie
#_0CA3AE: #_HOME_797F: db $31 ; tie
#_0CA3AF: #_HOME_7980: db $1C ; play note E4
#_0CA3B0: #_HOME_7981: db $31 ; tie
#_0CA3B1: #_HOME_7982: db $31 ; tie
#_0CA3B2: #_HOME_7983: db $11 ; play note F3
#_0CA3B3: #_HOME_7984: db $31 ; tie
#_0CA3B4: #_HOME_7985: db $31 ; tie
#_0CA3B5: #_HOME_7986: db $1C ; play note E4
#_0CA3B6: #_HOME_7987: db $31 ; tie
#_0CA3B7: #_HOME_7988: db $31 ; tie
#_0CA3B8: #_HOME_7989: db $10 ; play note E3
#_0CA3B9: #_HOME_798A: db $31 ; tie
#_0CA3BA: #_HOME_798B: db $31 ; tie
#_0CA3BB: #_HOME_798C: db $1A ; play note D4
#_0CA3BC: #_HOME_798D: db $31 ; tie
#_0CA3BD: #_HOME_798E: db $31 ; tie
#_0CA3BE: #_HOME_798F: db $10 ; play note E3
#_0CA3BF: #_HOME_7990: db $31 ; tie
#_0CA3C0: #_HOME_7991: db $31 ; tie
#_0CA3C1: #_HOME_7992: db $1A ; play note D4
#_0CA3C2: #_HOME_7993: db $31 ; tie
#_0CA3C3: #_HOME_7994: db $31 ; tie
#_0CA3C4: #_HOME_7995: db $0E ; play note D3
#_0CA3C5: #_HOME_7996: db $31 ; tie
#_0CA3C6: #_HOME_7997: db $31 ; tie
#_0CA3C7: #_HOME_7998: db $18 ; play note C4
#_0CA3C8: #_HOME_7999: db $31 ; tie
#_0CA3C9: #_HOME_799A: db $31 ; tie
#_0CA3CA: #_HOME_799B: db $0E ; play note D3
#_0CA3CB: #_HOME_799C: db $31 ; tie
#_0CA3CC: #_HOME_799D: db $31 ; tie
#_0CA3CD: #_HOME_799E: db $18 ; play note C4
#_0CA3CE: #_HOME_799F: db $31 ; tie
#_0CA3CF: #_HOME_79A0: db $31 ; tie
#_0CA3D0: #_HOME_79A1: db $10 ; play note E3
#_0CA3D1: #_HOME_79A2: db $31 ; tie
#_0CA3D2: #_HOME_79A3: db $31 ; tie
#_0CA3D3: #_HOME_79A4: db $1A ; play note D4
#_0CA3D4: #_HOME_79A5: db $31 ; tie
#_0CA3D5: #_HOME_79A6: db $31 ; tie
#_0CA3D6: #_HOME_79A7: db $10 ; play note E3
#_0CA3D7: #_HOME_79A8: db $31 ; tie
#_0CA3D8: #_HOME_79A9: db $31 ; tie
#_0CA3D9: #_HOME_79AA: db $1A ; play note D4
#_0CA3DA: #_HOME_79AB: db $31 ; tie
#_0CA3DB: #_HOME_79AC: db $31 ; tie
#_0CA3DC: #_HOME_79AD: db $11 ; play note F3
#_0CA3DD: #_HOME_79AE: db $31 ; tie
#_0CA3DE: #_HOME_79AF: db $31 ; tie
#_0CA3DF: #_HOME_79B0: db $1C ; play note E4
#_0CA3E0: #_HOME_79B1: db $31 ; tie
#_0CA3E1: #_HOME_79B2: db $31 ; tie
#_0CA3E2: #_HOME_79B3: db $11 ; play note F3
#_0CA3E3: #_HOME_79B4: db $31 ; tie
#_0CA3E4: #_HOME_79B5: db $31 ; tie
#_0CA3E5: #_HOME_79B6: db $1C ; play note E4
#_0CA3E6: #_HOME_79B7: db $31 ; tie
#_0CA3E7: #_HOME_79B8: db $31 ; tie
#_0CA3E8: #_HOME_79B9: db $10 ; play note E3
#_0CA3E9: #_HOME_79BA: db $31 ; tie
#_0CA3EA: #_HOME_79BB: db $31 ; tie
#_0CA3EB: #_HOME_79BC: db $1A ; play note D4
#_0CA3EC: #_HOME_79BD: db $31 ; tie
#_0CA3ED: #_HOME_79BE: db $31 ; tie
#_0CA3EE: #_HOME_79BF: db $10 ; play note E3
#_0CA3EF: #_HOME_79C0: db $31 ; tie
#_0CA3F0: #_HOME_79C1: db $31 ; tie
#_0CA3F1: #_HOME_79C2: db $1A ; play note D4
#_0CA3F2: #_HOME_79C3: db $31 ; tie
#_0CA3F3: #_HOME_79C4: db $31 ; tie
#_0CA3F4: #_HOME_79C5: db $0E ; play note D3
#_0CA3F5: #_HOME_79C6: db $31 ; tie
#_0CA3F6: #_HOME_79C7: db $31 ; tie
#_0CA3F7: #_HOME_79C8: db $18 ; play note C4
#_0CA3F8: #_HOME_79C9: db $31 ; tie
#_0CA3F9: #_HOME_79CA: db $31 ; tie
#_0CA3FA: #_HOME_79CB: db $0E ; play note D3
#_0CA3FB: #_HOME_79CC: db $31 ; tie
#_0CA3FC: #_HOME_79CD: db $31 ; tie
#_0CA3FD: #_HOME_79CE: db $18 ; play note C4
#_0CA3FE: #_HOME_79CF: db $31 ; tie
#_0CA3FF: #_HOME_79D0: db $31 ; tie
#_0CA400: #_HOME_79D1: db $10 ; play note E3
#_0CA401: #_HOME_79D2: db $31 ; tie
#_0CA402: #_HOME_79D3: db $31 ; tie
#_0CA403: #_HOME_79D4: db $1A ; play note D4
#_0CA404: #_HOME_79D5: db $31 ; tie
#_0CA405: #_HOME_79D6: db $31 ; tie
#_0CA406: #_HOME_79D7: db $8D ; dur 0x0D
#_0CA407: #_HOME_79D8: db $1A ; play note D4
#_0CA408: #_HOME_79D9: db $8A ; dur 0x0A
#_0CA409: #_HOME_79DA: db $31 ; tie
#_0CA40A: #_HOME_79DB: db $F8 : dw HOME_SEGMENT_7959 ; goto location

HOME_SEGMENT_79DE:
#_0CA40D: #_HOME_79DE: db $8D ; dur 0x0D
#_0CA40E: #_HOME_79DF: db $30 ; rest
#_0CA40F: #_HOME_79E0: db $8A ; dur 0x0A
#_0CA410: #_HOME_79E1: db $30 ; rest
#_0CA411: #_HOME_79E2: db $74 ; vol 0x14
#_0CA412: #_HOME_79E3: db $F0, $FE, $F0 ; set ADSR
#_0CA415: #_HOME_79E6: db $F2, $68 ; set panning
#_0CA417: #_HOME_79E8: db $F1, $09 ; set SRCN
#_0CA419: #_HOME_79EA: db $F3, $01 ; transpose +1

HOME_SEGMENT_79EC:
#_0CA41B: #_HOME_79EC: db $F4, $04 ; set loop point B
#_0CA41D: #_HOME_79EE: db $8A ; dur 0x0A
#_0CA41E: #_HOME_79EF: db $13 ; play note G3
#_0CA41F: #_HOME_79F0: db $8C ; dur 0x0C
#_0CA420: #_HOME_79F1: db $13 ; play note G3
#_0CA421: #_HOME_79F2: db $F5 ; run loop B
#_0CA422: #_HOME_79F3: db $F4, $03 ; set loop point B
#_0CA424: #_HOME_79F5: db $8A ; dur 0x0A
#_0CA425: #_HOME_79F6: db $15 ; play note A3
#_0CA426: #_HOME_79F7: db $8C ; dur 0x0C
#_0CA427: #_HOME_79F8: db $15 ; play note A3
#_0CA428: #_HOME_79F9: db $F5 ; run loop B
#_0CA429: #_HOME_79FA: db $8A ; dur 0x0A
#_0CA42A: #_HOME_79FB: db $17 ; play note B3
#_0CA42B: #_HOME_79FC: db $8C ; dur 0x0C
#_0CA42C: #_HOME_79FD: db $17 ; play note B3
#_0CA42D: #_HOME_79FE: db $F4, $04 ; set loop point B
#_0CA42F: #_HOME_7A00: db $8A ; dur 0x0A
#_0CA430: #_HOME_7A01: db $13 ; play note G3
#_0CA431: #_HOME_7A02: db $8C ; dur 0x0C
#_0CA432: #_HOME_7A03: db $13 ; play note G3
#_0CA433: #_HOME_7A04: db $F5 ; run loop B
#_0CA434: #_HOME_7A05: db $F4, $03 ; set loop point B
#_0CA436: #_HOME_7A07: db $8A ; dur 0x0A
#_0CA437: #_HOME_7A08: db $15 ; play note A3
#_0CA438: #_HOME_7A09: db $8C ; dur 0x0C
#_0CA439: #_HOME_7A0A: db $15 ; play note A3
#_0CA43A: #_HOME_7A0B: db $F5 ; run loop B
#_0CA43B: #_HOME_7A0C: db $8A ; dur 0x0A
#_0CA43C: #_HOME_7A0D: db $17 ; play note B3
#_0CA43D: #_HOME_7A0E: db $17 ; play note B3
#_0CA43E: #_HOME_7A0F: db $88 ; dur 0x08
#_0CA43F: #_HOME_7A10: db $31 ; tie
#_0CA440: #_HOME_7A11: db $15 ; play note A3
#_0CA441: #_HOME_7A12: db $31 ; tie
#_0CA442: #_HOME_7A13: db $31 ; tie
#_0CA443: #_HOME_7A14: db $18 ; play note C4
#_0CA444: #_HOME_7A15: db $31 ; tie
#_0CA445: #_HOME_7A16: db $31 ; tie
#_0CA446: #_HOME_7A17: db $15 ; play note A3
#_0CA447: #_HOME_7A18: db $31 ; tie
#_0CA448: #_HOME_7A19: db $31 ; tie
#_0CA449: #_HOME_7A1A: db $18 ; play note C4
#_0CA44A: #_HOME_7A1B: db $31 ; tie
#_0CA44B: #_HOME_7A1C: db $31 ; tie
#_0CA44C: #_HOME_7A1D: db $13 ; play note G3
#_0CA44D: #_HOME_7A1E: db $31 ; tie
#_0CA44E: #_HOME_7A1F: db $31 ; tie
#_0CA44F: #_HOME_7A20: db $17 ; play note B3
#_0CA450: #_HOME_7A21: db $31 ; tie
#_0CA451: #_HOME_7A22: db $31 ; tie
#_0CA452: #_HOME_7A23: db $13 ; play note G3
#_0CA453: #_HOME_7A24: db $31 ; tie
#_0CA454: #_HOME_7A25: db $31 ; tie
#_0CA455: #_HOME_7A26: db $17 ; play note B3
#_0CA456: #_HOME_7A27: db $31 ; tie
#_0CA457: #_HOME_7A28: db $31 ; tie
#_0CA458: #_HOME_7A29: db $11 ; play note F3
#_0CA459: #_HOME_7A2A: db $31 ; tie
#_0CA45A: #_HOME_7A2B: db $31 ; tie
#_0CA45B: #_HOME_7A2C: db $15 ; play note A3
#_0CA45C: #_HOME_7A2D: db $31 ; tie
#_0CA45D: #_HOME_7A2E: db $31 ; tie
#_0CA45E: #_HOME_7A2F: db $11 ; play note F3
#_0CA45F: #_HOME_7A30: db $31 ; tie
#_0CA460: #_HOME_7A31: db $31 ; tie
#_0CA461: #_HOME_7A32: db $15 ; play note A3
#_0CA462: #_HOME_7A33: db $31 ; tie
#_0CA463: #_HOME_7A34: db $31 ; tie
#_0CA464: #_HOME_7A35: db $13 ; play note G3
#_0CA465: #_HOME_7A36: db $31 ; tie
#_0CA466: #_HOME_7A37: db $31 ; tie
#_0CA467: #_HOME_7A38: db $17 ; play note B3
#_0CA468: #_HOME_7A39: db $31 ; tie
#_0CA469: #_HOME_7A3A: db $31 ; tie
#_0CA46A: #_HOME_7A3B: db $13 ; play note G3
#_0CA46B: #_HOME_7A3C: db $31 ; tie
#_0CA46C: #_HOME_7A3D: db $31 ; tie
#_0CA46D: #_HOME_7A3E: db $17 ; play note B3
#_0CA46E: #_HOME_7A3F: db $31 ; tie
#_0CA46F: #_HOME_7A40: db $31 ; tie
#_0CA470: #_HOME_7A41: db $15 ; play note A3
#_0CA471: #_HOME_7A42: db $31 ; tie
#_0CA472: #_HOME_7A43: db $31 ; tie
#_0CA473: #_HOME_7A44: db $18 ; play note C4
#_0CA474: #_HOME_7A45: db $31 ; tie
#_0CA475: #_HOME_7A46: db $31 ; tie
#_0CA476: #_HOME_7A47: db $15 ; play note A3
#_0CA477: #_HOME_7A48: db $31 ; tie
#_0CA478: #_HOME_7A49: db $31 ; tie
#_0CA479: #_HOME_7A4A: db $18 ; play note C4
#_0CA47A: #_HOME_7A4B: db $31 ; tie
#_0CA47B: #_HOME_7A4C: db $31 ; tie
#_0CA47C: #_HOME_7A4D: db $13 ; play note G3
#_0CA47D: #_HOME_7A4E: db $31 ; tie
#_0CA47E: #_HOME_7A4F: db $31 ; tie
#_0CA47F: #_HOME_7A50: db $17 ; play note B3
#_0CA480: #_HOME_7A51: db $31 ; tie
#_0CA481: #_HOME_7A52: db $31 ; tie
#_0CA482: #_HOME_7A53: db $13 ; play note G3
#_0CA483: #_HOME_7A54: db $31 ; tie
#_0CA484: #_HOME_7A55: db $31 ; tie
#_0CA485: #_HOME_7A56: db $17 ; play note B3
#_0CA486: #_HOME_7A57: db $31 ; tie
#_0CA487: #_HOME_7A58: db $31 ; tie
#_0CA488: #_HOME_7A59: db $11 ; play note F3
#_0CA489: #_HOME_7A5A: db $31 ; tie
#_0CA48A: #_HOME_7A5B: db $31 ; tie
#_0CA48B: #_HOME_7A5C: db $15 ; play note A3
#_0CA48C: #_HOME_7A5D: db $31 ; tie
#_0CA48D: #_HOME_7A5E: db $31 ; tie
#_0CA48E: #_HOME_7A5F: db $11 ; play note F3
#_0CA48F: #_HOME_7A60: db $31 ; tie
#_0CA490: #_HOME_7A61: db $31 ; tie
#_0CA491: #_HOME_7A62: db $15 ; play note A3
#_0CA492: #_HOME_7A63: db $31 ; tie
#_0CA493: #_HOME_7A64: db $31 ; tie
#_0CA494: #_HOME_7A65: db $13 ; play note G3
#_0CA495: #_HOME_7A66: db $31 ; tie
#_0CA496: #_HOME_7A67: db $31 ; tie
#_0CA497: #_HOME_7A68: db $17 ; play note B3
#_0CA498: #_HOME_7A69: db $31 ; tie
#_0CA499: #_HOME_7A6A: db $8D ; dur 0x0D
#_0CA49A: #_HOME_7A6B: db $17 ; play note B3
#_0CA49B: #_HOME_7A6C: db $8A ; dur 0x0A
#_0CA49C: #_HOME_7A6D: db $31 ; tie
#_0CA49D: #_HOME_7A6E: db $F8 : dw HOME_SEGMENT_79EC ; goto location

HOME_SEGMENT_7A71:
#_0CA4A0: #_HOME_7A71: db $8D ; dur 0x0D
#_0CA4A1: #_HOME_7A72: db $30 ; rest
#_0CA4A2: #_HOME_7A73: db $8A ; dur 0x0A
#_0CA4A3: #_HOME_7A74: db $30 ; rest
#_0CA4A4: #_HOME_7A75: db $64 ; vol 0x04
#_0CA4A5: #_HOME_7A76: db $F0, $FE, $F0 ; set ADSR
#_0CA4A8: #_HOME_7A79: db $F2, $68 ; set panning
#_0CA4AA: #_HOME_7A7B: db $F1, $09 ; set SRCN
#_0CA4AC: #_HOME_7A7D: db $F3, $01 ; transpose +1

HOME_SEGMENT_7A7F:
#_0CA4AE: #_HOME_7A7F: db $F4, $04 ; set loop point B
#_0CA4B0: #_HOME_7A81: db $8A ; dur 0x0A
#_0CA4B1: #_HOME_7A82: db $10 ; play note E3
#_0CA4B2: #_HOME_7A83: db $8C ; dur 0x0C
#_0CA4B3: #_HOME_7A84: db $10 ; play note E3
#_0CA4B4: #_HOME_7A85: db $F5 ; run loop B
#_0CA4B5: #_HOME_7A86: db $F4, $04 ; set loop point B
#_0CA4B7: #_HOME_7A88: db $8A ; dur 0x0A
#_0CA4B8: #_HOME_7A89: db $11 ; play note F3
#_0CA4B9: #_HOME_7A8A: db $8C ; dur 0x0C
#_0CA4BA: #_HOME_7A8B: db $11 ; play note F3
#_0CA4BB: #_HOME_7A8C: db $F5 ; run loop B
#_0CA4BC: #_HOME_7A8D: db $F4, $04 ; set loop point B
#_0CA4BE: #_HOME_7A8F: db $8A ; dur 0x0A
#_0CA4BF: #_HOME_7A90: db $10 ; play note E3
#_0CA4C0: #_HOME_7A91: db $8C ; dur 0x0C
#_0CA4C1: #_HOME_7A92: db $10 ; play note E3
#_0CA4C2: #_HOME_7A93: db $F5 ; run loop B
#_0CA4C3: #_HOME_7A94: db $F4, $03 ; set loop point B
#_0CA4C5: #_HOME_7A96: db $8A ; dur 0x0A
#_0CA4C6: #_HOME_7A97: db $11 ; play note F3
#_0CA4C7: #_HOME_7A98: db $8C ; dur 0x0C
#_0CA4C8: #_HOME_7A99: db $11 ; play note F3
#_0CA4C9: #_HOME_7A9A: db $F5 ; run loop B
#_0CA4CA: #_HOME_7A9B: db $8A ; dur 0x0A
#_0CA4CB: #_HOME_7A9C: db $11 ; play note F3
#_0CA4CC: #_HOME_7A9D: db $11 ; play note F3
#_0CA4CD: #_HOME_7A9E: db $88 ; dur 0x08
#_0CA4CE: #_HOME_7A9F: db $31 ; tie
#_0CA4CF: #_HOME_7AA0: db $31 ; tie
#_0CA4D0: #_HOME_7AA1: db $18 ; play note C4
#_0CA4D1: #_HOME_7AA2: db $31 ; tie
#_0CA4D2: #_HOME_7AA3: db $31 ; tie
#_0CA4D3: #_HOME_7AA4: db $15 ; play note A3
#_0CA4D4: #_HOME_7AA5: db $31 ; tie
#_0CA4D5: #_HOME_7AA6: db $31 ; tie
#_0CA4D6: #_HOME_7AA7: db $18 ; play note C4
#_0CA4D7: #_HOME_7AA8: db $31 ; tie
#_0CA4D8: #_HOME_7AA9: db $31 ; tie
#_0CA4D9: #_HOME_7AAA: db $15 ; play note A3
#_0CA4DA: #_HOME_7AAB: db $31 ; tie
#_0CA4DB: #_HOME_7AAC: db $31 ; tie
#_0CA4DC: #_HOME_7AAD: db $17 ; play note B3
#_0CA4DD: #_HOME_7AAE: db $31 ; tie
#_0CA4DE: #_HOME_7AAF: db $31 ; tie
#_0CA4DF: #_HOME_7AB0: db $13 ; play note G3
#_0CA4E0: #_HOME_7AB1: db $31 ; tie
#_0CA4E1: #_HOME_7AB2: db $31 ; tie
#_0CA4E2: #_HOME_7AB3: db $17 ; play note B3
#_0CA4E3: #_HOME_7AB4: db $31 ; tie
#_0CA4E4: #_HOME_7AB5: db $31 ; tie
#_0CA4E5: #_HOME_7AB6: db $13 ; play note G3
#_0CA4E6: #_HOME_7AB7: db $31 ; tie
#_0CA4E7: #_HOME_7AB8: db $31 ; tie
#_0CA4E8: #_HOME_7AB9: db $15 ; play note A3
#_0CA4E9: #_HOME_7ABA: db $31 ; tie
#_0CA4EA: #_HOME_7ABB: db $31 ; tie
#_0CA4EB: #_HOME_7ABC: db $11 ; play note F3
#_0CA4EC: #_HOME_7ABD: db $31 ; tie
#_0CA4ED: #_HOME_7ABE: db $31 ; tie
#_0CA4EE: #_HOME_7ABF: db $15 ; play note A3
#_0CA4EF: #_HOME_7AC0: db $31 ; tie
#_0CA4F0: #_HOME_7AC1: db $31 ; tie
#_0CA4F1: #_HOME_7AC2: db $11 ; play note F3
#_0CA4F2: #_HOME_7AC3: db $31 ; tie
#_0CA4F3: #_HOME_7AC4: db $31 ; tie
#_0CA4F4: #_HOME_7AC5: db $17 ; play note B3
#_0CA4F5: #_HOME_7AC6: db $31 ; tie
#_0CA4F6: #_HOME_7AC7: db $31 ; tie
#_0CA4F7: #_HOME_7AC8: db $13 ; play note G3
#_0CA4F8: #_HOME_7AC9: db $31 ; tie
#_0CA4F9: #_HOME_7ACA: db $31 ; tie
#_0CA4FA: #_HOME_7ACB: db $17 ; play note B3
#_0CA4FB: #_HOME_7ACC: db $31 ; tie
#_0CA4FC: #_HOME_7ACD: db $31 ; tie
#_0CA4FD: #_HOME_7ACE: db $13 ; play note G3
#_0CA4FE: #_HOME_7ACF: db $31 ; tie
#_0CA4FF: #_HOME_7AD0: db $31 ; tie
#_0CA500: #_HOME_7AD1: db $18 ; play note C4
#_0CA501: #_HOME_7AD2: db $31 ; tie
#_0CA502: #_HOME_7AD3: db $31 ; tie
#_0CA503: #_HOME_7AD4: db $15 ; play note A3
#_0CA504: #_HOME_7AD5: db $31 ; tie
#_0CA505: #_HOME_7AD6: db $31 ; tie
#_0CA506: #_HOME_7AD7: db $18 ; play note C4
#_0CA507: #_HOME_7AD8: db $31 ; tie
#_0CA508: #_HOME_7AD9: db $31 ; tie
#_0CA509: #_HOME_7ADA: db $15 ; play note A3
#_0CA50A: #_HOME_7ADB: db $31 ; tie
#_0CA50B: #_HOME_7ADC: db $31 ; tie
#_0CA50C: #_HOME_7ADD: db $17 ; play note B3
#_0CA50D: #_HOME_7ADE: db $31 ; tie
#_0CA50E: #_HOME_7ADF: db $31 ; tie
#_0CA50F: #_HOME_7AE0: db $13 ; play note G3
#_0CA510: #_HOME_7AE1: db $31 ; tie
#_0CA511: #_HOME_7AE2: db $31 ; tie
#_0CA512: #_HOME_7AE3: db $17 ; play note B3
#_0CA513: #_HOME_7AE4: db $31 ; tie
#_0CA514: #_HOME_7AE5: db $31 ; tie
#_0CA515: #_HOME_7AE6: db $13 ; play note G3
#_0CA516: #_HOME_7AE7: db $31 ; tie
#_0CA517: #_HOME_7AE8: db $31 ; tie
#_0CA518: #_HOME_7AE9: db $15 ; play note A3
#_0CA519: #_HOME_7AEA: db $31 ; tie
#_0CA51A: #_HOME_7AEB: db $31 ; tie
#_0CA51B: #_HOME_7AEC: db $11 ; play note F3
#_0CA51C: #_HOME_7AED: db $31 ; tie
#_0CA51D: #_HOME_7AEE: db $31 ; tie
#_0CA51E: #_HOME_7AEF: db $15 ; play note A3
#_0CA51F: #_HOME_7AF0: db $31 ; tie
#_0CA520: #_HOME_7AF1: db $31 ; tie
#_0CA521: #_HOME_7AF2: db $11 ; play note F3
#_0CA522: #_HOME_7AF3: db $31 ; tie
#_0CA523: #_HOME_7AF4: db $31 ; tie
#_0CA524: #_HOME_7AF5: db $17 ; play note B3
#_0CA525: #_HOME_7AF6: db $31 ; tie
#_0CA526: #_HOME_7AF7: db $31 ; tie
#_0CA527: #_HOME_7AF8: db $13 ; play note G3
#_0CA528: #_HOME_7AF9: db $8D ; dur 0x0D
#_0CA529: #_HOME_7AFA: db $13 ; play note G3
#_0CA52A: #_HOME_7AFB: db $8A ; dur 0x0A
#_0CA52B: #_HOME_7AFC: db $31 ; tie
#_0CA52C: #_HOME_7AFD: db $F8 : dw HOME_SEGMENT_7A7F ; goto location

HOME_SEGMENT_7B00:
#_0CA52F: #_HOME_7B00: db $70 ; vol 0x10
#_0CA530: #_HOME_7B01: db $F0, $FE, $F0 ; set ADSR
#_0CA533: #_HOME_7B04: db $F1, $02 ; set SRCN
#_0CA535: #_HOME_7B06: db $F2, $44 ; set panning
#_0CA537: #_HOME_7B08: db $8D ; dur 0x0D
#_0CA538: #_HOME_7B09: db $30 ; rest

HOME_SEGMENT_7B0A:
#_0CA539: #_HOME_7B0A: db $8D ; dur 0x0D
#_0CA53A: #_HOME_7B0B: db $18 ; play note C4
#_0CA53B: #_HOME_7B0C: db $18 ; play note C4
#_0CA53C: #_HOME_7B0D: db $19 ; play note Cs4
#_0CA53D: #_HOME_7B0E: db $19 ; play note Cs4
#_0CA53E: #_HOME_7B0F: db $1A ; play note D4
#_0CA53F: #_HOME_7B10: db $8C ; dur 0x0C
#_0CA540: #_HOME_7B11: db $1A ; play note D4
#_0CA541: #_HOME_7B12: db $88 ; dur 0x08
#_0CA542: #_HOME_7B13: db $15 ; play note A3
#_0CA543: #_HOME_7B14: db $14 ; play note Gs3
#_0CA544: #_HOME_7B15: db $8D ; dur 0x0D
#_0CA545: #_HOME_7B16: db $13 ; play note G3
#_0CA546: #_HOME_7B17: db $8A ; dur 0x0A
#_0CA547: #_HOME_7B18: db $13 ; play note G3
#_0CA548: #_HOME_7B19: db $15 ; play note A3
#_0CA549: #_HOME_7B1A: db $17 ; play note B3
#_0CA54A: #_HOME_7B1B: db $8D ; dur 0x0D
#_0CA54B: #_HOME_7B1C: db $18 ; play note C4
#_0CA54C: #_HOME_7B1D: db $18 ; play note C4
#_0CA54D: #_HOME_7B1E: db $19 ; play note Cs4
#_0CA54E: #_HOME_7B1F: db $19 ; play note Cs4
#_0CA54F: #_HOME_7B20: db $1A ; play note D4
#_0CA550: #_HOME_7B21: db $8C ; dur 0x0C
#_0CA551: #_HOME_7B22: db $1A ; play note D4
#_0CA552: #_HOME_7B23: db $88 ; dur 0x08
#_0CA553: #_HOME_7B24: db $15 ; play note A3
#_0CA554: #_HOME_7B25: db $14 ; play note Gs3
#_0CA555: #_HOME_7B26: db $8D ; dur 0x0D
#_0CA556: #_HOME_7B27: db $13 ; play note G3
#_0CA557: #_HOME_7B28: db $13 ; play note G3
#_0CA558: #_HOME_7B29: db $8D ; dur 0x0D
#_0CA559: #_HOME_7B2A: db $1D ; play note F4
#_0CA55A: #_HOME_7B2B: db $1D ; play note F4
#_0CA55B: #_HOME_7B2C: db $1C ; play note E4
#_0CA55C: #_HOME_7B2D: db $1C ; play note E4
#_0CA55D: #_HOME_7B2E: db $1A ; play note D4
#_0CA55E: #_HOME_7B2F: db $1A ; play note D4
#_0CA55F: #_HOME_7B30: db $1C ; play note E4
#_0CA560: #_HOME_7B31: db $1C ; play note E4
#_0CA561: #_HOME_7B32: db $1D ; play note F4
#_0CA562: #_HOME_7B33: db $1D ; play note F4
#_0CA563: #_HOME_7B34: db $1C ; play note E4
#_0CA564: #_HOME_7B35: db $1C ; play note E4
#_0CA565: #_HOME_7B36: db $1A ; play note D4
#_0CA566: #_HOME_7B37: db $1A ; play note D4
#_0CA567: #_HOME_7B38: db $8C ; dur 0x0C
#_0CA568: #_HOME_7B39: db $1C ; play note E4
#_0CA569: #_HOME_7B3A: db $8A ; dur 0x0A
#_0CA56A: #_HOME_7B3B: db $1D ; play note F4
#_0CA56B: #_HOME_7B3C: db $8D ; dur 0x0D
#_0CA56C: #_HOME_7B3D: db $1F ; play note G4
#_0CA56D: #_HOME_7B3E: db $F8 : dw HOME_SEGMENT_7B0A ; goto location
#_0CA570: #_HOME_7B41: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Pascal_SPC_Data:
#_0CA571: dw $012D, $0000

SONG_PASCAL:
#_0CA575: #_PASCAL_7800: db $F1, $F8 ; Set control
#_0CA577: #_PASCAL_7802: db $00 : dw PASCAL_SEGMENT_781B ; Music channel 0
#_0CA57A: #_PASCAL_7805: db $01 : dw PASCAL_SEGMENT_7831 ; Music channel 1
#_0CA57D: #_PASCAL_7808: db $02 : dw PASCAL_SEGMENT_7848 ; Music channel 2
#_0CA580: #_PASCAL_780B: db $03 : dw PASCAL_SEGMENT_785F ; Music channel 3
#_0CA583: #_PASCAL_780E: db $04 : dw PASCAL_SEGMENT_78B7 ; Music channel 4
#_0CA586: #_PASCAL_7811: db $05 : dw PASCAL_SEGMENT_78C3 ; Music channel 5
#_0CA589: #_PASCAL_7814: db $06 : dw PASCAL_SEGMENT_78CF ; Music channel 6
#_0CA58C: #_PASCAL_7817: db $07 : dw PASCAL_SEGMENT_7926 ; Music channel 7
#_0CA58F: #_PASCAL_781A: db $FF ; end of header

PASCAL_SEGMENT_781B:
#_0CA590: #_PASCAL_781B: db $70 ; vol 0x10
#_0CA591: #_PASCAL_781C: db $F0, $DD, $F6 ; set ADSR
#_0CA594: #_PASCAL_781F: db $F2, $64 ; set panning

PASCAL_SEGMENT_7821:
#_0CA596: #_PASCAL_7821: db $F1, $08 ; set SRCN
#_0CA598: #_PASCAL_7823: db $F3, $01 ; transpose +1
#_0CA59A: #_PASCAL_7825: db $A8 ; dur 0x28

PASCAL_SEGMENT_7826:
#_0CA59B: #_PASCAL_7826: db $30 ; rest
#_0CA59C: #_PASCAL_7827: db $1F ; play note G4
#_0CA59D: #_PASCAL_7828: db $30 ; rest
#_0CA59E: #_PASCAL_7829: db $1F ; play note G4
#_0CA59F: #_PASCAL_782A: db $30 ; rest
#_0CA5A0: #_PASCAL_782B: db $1E ; play note Fs4
#_0CA5A1: #_PASCAL_782C: db $30 ; rest
#_0CA5A2: #_PASCAL_782D: db $1E ; play note Fs4
#_0CA5A3: #_PASCAL_782E: db $F8 : dw PASCAL_SEGMENT_7826 ; goto location

PASCAL_SEGMENT_7831:
#_0CA5A6: #_PASCAL_7831: db $63 ; vol 0x03
#_0CA5A7: #_PASCAL_7832: db $F0, $DD, $F6 ; set ADSR
#_0CA5AA: #_PASCAL_7835: db $F1, $08 ; set SRCN
#_0CA5AC: #_PASCAL_7837: db $F2, $64 ; set panning
#_0CA5AE: #_PASCAL_7839: db $F3, $01 ; transpose +1
#_0CA5B0: #_PASCAL_783B: db $A8 ; dur 0x28

PASCAL_SEGMENT_783C:
#_0CA5B1: #_PASCAL_783C: db $30 ; rest
#_0CA5B2: #_PASCAL_783D: db $1C ; play note E4
#_0CA5B3: #_PASCAL_783E: db $30 ; rest
#_0CA5B4: #_PASCAL_783F: db $1C ; play note E4
#_0CA5B5: #_PASCAL_7840: db $30 ; rest
#_0CA5B6: #_PASCAL_7841: db $1A ; play note D4
#_0CA5B7: #_PASCAL_7842: db $30 ; rest
#_0CA5B8: #_PASCAL_7843: db $1A ; play note D4
#_0CA5B9: #_PASCAL_7844: db $F8 : dw PASCAL_SEGMENT_783C ; goto location
#_0CA5BC: #_PASCAL_7847: db $FF ; end track

PASCAL_SEGMENT_7848:
#_0CA5BD: #_PASCAL_7848: db $73 ; vol 0x13
#_0CA5BE: #_PASCAL_7849: db $F0, $DD, $F6 ; set ADSR
#_0CA5C1: #_PASCAL_784C: db $F1, $08 ; set SRCN
#_0CA5C3: #_PASCAL_784E: db $F2, $64 ; set panning
#_0CA5C5: #_PASCAL_7850: db $F3, $01 ; transpose +1
#_0CA5C7: #_PASCAL_7852: db $A8 ; dur 0x28

PASCAL_SEGMENT_7853:
#_0CA5C8: #_PASCAL_7853: db $30 ; rest
#_0CA5C9: #_PASCAL_7854: db $17 ; play note B3
#_0CA5CA: #_PASCAL_7855: db $30 ; rest
#_0CA5CB: #_PASCAL_7856: db $17 ; play note B3
#_0CA5CC: #_PASCAL_7857: db $30 ; rest
#_0CA5CD: #_PASCAL_7858: db $15 ; play note A3
#_0CA5CE: #_PASCAL_7859: db $30 ; rest
#_0CA5CF: #_PASCAL_785A: db $15 ; play note A3
#_0CA5D0: #_PASCAL_785B: db $F8 : dw PASCAL_SEGMENT_7853 ; goto location
#_0CA5D3: #_PASCAL_785E: db $FF ; end track

PASCAL_SEGMENT_785F:
#_0CA5D4: #_PASCAL_785F: db $F0, $FE, $E8 ; set ADSR
#_0CA5D7: #_PASCAL_7862: db $F2, $60 ; set panning

PASCAL_SEGMENT_7864:
#_0CA5D9: #_PASCAL_7864: db $F1, $09 ; set SRCN

PASCAL_SEGMENT_7866:
#_0CA5DB: #_PASCAL_7866: db $AC ; dur 0x2C
#_0CA5DC: #_PASCAL_7867: db $F4, $07 ; set loop point B
#_0CA5DE: #_PASCAL_7869: db $30 ; rest
#_0CA5DF: #_PASCAL_786A: db $F5 ; run loop B
#_0CA5E0: #_PASCAL_786B: db $AA ; dur 0x2A
#_0CA5E1: #_PASCAL_786C: db $30 ; rest
#_0CA5E2: #_PASCAL_786D: db $A8 ; dur 0x28
#_0CA5E3: #_PASCAL_786E: db $1C ; play note E4
#_0CA5E4: #_PASCAL_786F: db $1E ; play note Fs4
#_0CA5E5: #_PASCAL_7870: db $A9 ; dur 0x29
#_0CA5E6: #_PASCAL_7871: db $1F ; play note G4
#_0CA5E7: #_PASCAL_7872: db $21 ; play note A4
#_0CA5E8: #_PASCAL_7873: db $A8 ; dur 0x28
#_0CA5E9: #_PASCAL_7874: db $1E ; play note Fs4
#_0CA5EA: #_PASCAL_7875: db $A9 ; dur 0x29
#_0CA5EB: #_PASCAL_7876: db $1F ; play note G4
#_0CA5EC: #_PASCAL_7877: db $1C ; play note E4
#_0CA5ED: #_PASCAL_7878: db $A8 ; dur 0x28
#_0CA5EE: #_PASCAL_7879: db $1E ; play note Fs4
#_0CA5EF: #_PASCAL_787A: db $A9 ; dur 0x29
#_0CA5F0: #_PASCAL_787B: db $1A ; play note D4
#_0CA5F1: #_PASCAL_787C: db $1C ; play note E4
#_0CA5F2: #_PASCAL_787D: db $A8 ; dur 0x28
#_0CA5F3: #_PASCAL_787E: db $18 ; play note C4
#_0CA5F4: #_PASCAL_787F: db $A9 ; dur 0x29
#_0CA5F5: #_PASCAL_7880: db $1A ; play note D4
#_0CA5F6: #_PASCAL_7881: db $17 ; play note B3
#_0CA5F7: #_PASCAL_7882: db $A8 ; dur 0x28
#_0CA5F8: #_PASCAL_7883: db $18 ; play note C4
#_0CA5F9: #_PASCAL_7884: db $A9 ; dur 0x29
#_0CA5FA: #_PASCAL_7885: db $17 ; play note B3
#_0CA5FB: #_PASCAL_7886: db $13 ; play note G3
#_0CA5FC: #_PASCAL_7887: db $A8 ; dur 0x28
#_0CA5FD: #_PASCAL_7888: db $31 ; tie
#_0CA5FE: #_PASCAL_7889: db $AC ; dur 0x2C
#_0CA5FF: #_PASCAL_788A: db $31 ; tie
#_0CA600: #_PASCAL_788B: db $31 ; tie
#_0CA601: #_PASCAL_788C: db $AA ; dur 0x2A
#_0CA602: #_PASCAL_788D: db $31 ; tie
#_0CA603: #_PASCAL_788E: db $A8 ; dur 0x28
#_0CA604: #_PASCAL_788F: db $1C ; play note E4
#_0CA605: #_PASCAL_7890: db $1E ; play note Fs4
#_0CA606: #_PASCAL_7891: db $A9 ; dur 0x29
#_0CA607: #_PASCAL_7892: db $1F ; play note G4
#_0CA608: #_PASCAL_7893: db $21 ; play note A4
#_0CA609: #_PASCAL_7894: db $A8 ; dur 0x28
#_0CA60A: #_PASCAL_7895: db $23 ; play note B4
#_0CA60B: #_PASCAL_7896: db $A9 ; dur 0x29
#_0CA60C: #_PASCAL_7897: db $21 ; play note A4
#_0CA60D: #_PASCAL_7898: db $1E ; play note Fs4
#_0CA60E: #_PASCAL_7899: db $A8 ; dur 0x28
#_0CA60F: #_PASCAL_789A: db $1F ; play note G4
#_0CA610: #_PASCAL_789B: db $A9 ; dur 0x29
#_0CA611: #_PASCAL_789C: db $1C ; play note E4
#_0CA612: #_PASCAL_789D: db $1E ; play note Fs4
#_0CA613: #_PASCAL_789E: db $A8 ; dur 0x28
#_0CA614: #_PASCAL_789F: db $1A ; play note D4
#_0CA615: #_PASCAL_78A0: db $A9 ; dur 0x29
#_0CA616: #_PASCAL_78A1: db $1C ; play note E4
#_0CA617: #_PASCAL_78A2: db $18 ; play note C4
#_0CA618: #_PASCAL_78A3: db $A8 ; dur 0x28
#_0CA619: #_PASCAL_78A4: db $1A ; play note D4
#_0CA61A: #_PASCAL_78A5: db $AC ; dur 0x2C
#_0CA61B: #_PASCAL_78A6: db $17 ; play note B3
#_0CA61C: #_PASCAL_78A7: db $31 ; tie
#_0CA61D: #_PASCAL_78A8: db $31 ; tie
#_0CA61E: #_PASCAL_78A9: db $31 ; tie
#_0CA61F: #_PASCAL_78AA: db $AC ; dur 0x2C
#_0CA620: #_PASCAL_78AB: db $15 ; play note A3
#_0CA621: #_PASCAL_78AC: db $1A ; play note D4
#_0CA622: #_PASCAL_78AD: db $17 ; play note B3
#_0CA623: #_PASCAL_78AE: db $31 ; tie
#_0CA624: #_PASCAL_78AF: db $31 ; tie
#_0CA625: #_PASCAL_78B0: db $31 ; tie
#_0CA626: #_PASCAL_78B1: db $31 ; tie
#_0CA627: #_PASCAL_78B2: db $31 ; tie
#_0CA628: #_PASCAL_78B3: db $F8 : dw PASCAL_SEGMENT_7866 ; goto location
#_0CA62B: #_PASCAL_78B6: db $FF ; end track

PASCAL_SEGMENT_78B7:
#_0CA62C: #_PASCAL_78B7: db $A7 ; dur 0x27
#_0CA62D: #_PASCAL_78B8: db $30 ; rest
#_0CA62E: #_PASCAL_78B9: db $F0, $F9, $E8 ; set ADSR
#_0CA631: #_PASCAL_78BC: db $F2, $6F ; set panning
#_0CA633: #_PASCAL_78BE: db $F9, $20 ; set fine tuning
#_0CA635: #_PASCAL_78C0: db $F8 : dw PASCAL_SEGMENT_7864 ; goto location

PASCAL_SEGMENT_78C3:
#_0CA638: #_PASCAL_78C3: db $70 ; vol 0x10
#_0CA639: #_PASCAL_78C4: db $F0, $DA, $F6 ; set ADSR
#_0CA63C: #_PASCAL_78C7: db $F2, $70 ; set panning
#_0CA63E: #_PASCAL_78C9: db $F9, $20 ; set fine tuning
#_0CA640: #_PASCAL_78CB: db $F8 : dw PASCAL_SEGMENT_7821 ; goto location
#_0CA643: #_PASCAL_78CE: db $FF ; end track

PASCAL_SEGMENT_78CF:
#_0CA644: #_PASCAL_78CF: db $70 ; vol 0x10
#_0CA645: #_PASCAL_78D0: db $F1, $02 ; set SRCN
#_0CA647: #_PASCAL_78D2: db $F2, $4C ; set panning
#_0CA649: #_PASCAL_78D4: db $F0, $FE, $F2 ; set ADSR

PASCAL_SEGMENT_78D7:
#_0CA64C: #_PASCAL_78D7: db $A8 ; dur 0x28
#_0CA64D: #_PASCAL_78D8: db $1C ; play note E4
#_0CA64E: #_PASCAL_78D9: db $30 ; rest
#_0CA64F: #_PASCAL_78DA: db $1C ; play note E4
#_0CA650: #_PASCAL_78DB: db $30 ; rest
#_0CA651: #_PASCAL_78DC: db $1A ; play note D4
#_0CA652: #_PASCAL_78DD: db $30 ; rest
#_0CA653: #_PASCAL_78DE: db $1A ; play note D4
#_0CA654: #_PASCAL_78DF: db $30 ; rest
#_0CA655: #_PASCAL_78E0: db $F6 : dw PASCAL_SEGMENT_78F8 ; subroutine B
#_0CA658: #_PASCAL_78E3: db $1A ; play note D4
#_0CA659: #_PASCAL_78E4: db $30 ; rest
#_0CA65A: #_PASCAL_78E5: db $1A ; play note D4
#_0CA65B: #_PASCAL_78E6: db $30 ; rest
#_0CA65C: #_PASCAL_78E7: db $1C ; play note E4
#_0CA65D: #_PASCAL_78E8: db $30 ; rest
#_0CA65E: #_PASCAL_78E9: db $1C ; play note E4
#_0CA65F: #_PASCAL_78EA: db $30 ; rest
#_0CA660: #_PASCAL_78EB: db $F6 : dw PASCAL_SEGMENT_790E ; subroutine B
#_0CA663: #_PASCAL_78EE: db $F6 : dw PASCAL_SEGMENT_78F8 ; subroutine B
#_0CA666: #_PASCAL_78F1: db $1A ; play note D4
#_0CA667: #_PASCAL_78F2: db $30 ; rest
#_0CA668: #_PASCAL_78F3: db $1A ; play note D4
#_0CA669: #_PASCAL_78F4: db $30 ; rest
#_0CA66A: #_PASCAL_78F5: db $F8 : dw PASCAL_SEGMENT_78D7 ; goto location

PASCAL_SEGMENT_78F8:
#_0CA66D: #_PASCAL_78F8: db $A8 ; dur 0x28
#_0CA66E: #_PASCAL_78F9: db $1C ; play note E4
#_0CA66F: #_PASCAL_78FA: db $A6 ; dur 0x26
#_0CA670: #_PASCAL_78FB: db $30 ; rest
#_0CA671: #_PASCAL_78FC: db $1C ; play note E4
#_0CA672: #_PASCAL_78FD: db $F0, $FE, $EC ; set ADSR
#_0CA675: #_PASCAL_7900: db $82 ; dur 0x02
#_0CA676: #_PASCAL_7901: db $1C ; play note E4
#_0CA677: #_PASCAL_7902: db $FC ; fade out
#_0CA678: #_PASCAL_7903: db $1D ; play note F4
#_0CA679: #_PASCAL_7904: db $1E ; play note Fs4
#_0CA67A: #_PASCAL_7905: db $A7 ; dur 0x27
#_0CA67B: #_PASCAL_7906: db $1F ; play note G4
#_0CA67C: #_PASCAL_7907: db $FD ; disable fade
#_0CA67D: #_PASCAL_7908: db $F0, $FE, $F2 ; set ADSR
#_0CA680: #_PASCAL_790B: db $A8 ; dur 0x28
#_0CA681: #_PASCAL_790C: db $1C ; play note E4
#_0CA682: #_PASCAL_790D: db $F7 ; return from routine B

PASCAL_SEGMENT_790E:
#_0CA683: #_PASCAL_790E: db $A8 ; dur 0x28
#_0CA684: #_PASCAL_790F: db $1A ; play note D4
#_0CA685: #_PASCAL_7910: db $A6 ; dur 0x26
#_0CA686: #_PASCAL_7911: db $30 ; rest
#_0CA687: #_PASCAL_7912: db $1A ; play note D4
#_0CA688: #_PASCAL_7913: db $F0, $FE, $EC ; set ADSR
#_0CA68B: #_PASCAL_7916: db $82 ; dur 0x02
#_0CA68C: #_PASCAL_7917: db $1A ; play note D4
#_0CA68D: #_PASCAL_7918: db $FC ; fade out
#_0CA68E: #_PASCAL_7919: db $1B ; play note Ds4
#_0CA68F: #_PASCAL_791A: db $1C ; play note E4
#_0CA690: #_PASCAL_791B: db $A7 ; dur 0x27
#_0CA691: #_PASCAL_791C: db $1E ; play note Fs4
#_0CA692: #_PASCAL_791D: db $FD ; disable fade
#_0CA693: #_PASCAL_791E: db $F0, $FE, $F2 ; set ADSR
#_0CA696: #_PASCAL_7921: db $A8 ; dur 0x28
#_0CA697: #_PASCAL_7922: db $1A ; play note D4
#_0CA698: #_PASCAL_7923: db $FD ; disable fade
#_0CA699: #_PASCAL_7924: db $F7 ; return from routine B
#_0CA69A: #_PASCAL_7925: db $FF ; end track

PASCAL_SEGMENT_7926:
#_0CA69B: #_PASCAL_7926: db $70 ; vol 0x10
#_0CA69C: #_PASCAL_7927: db $F0, $FF, $E0 ; set ADSR
#_0CA69F: #_PASCAL_792A: db $F2, $44 ; set panning
#_0CA6A1: #_PASCAL_792C: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
NaturalCyborgKiller_SPC_Data:
#_0CA6A2: dw $0199, $0000

SONG_CYBORG:
#_0CA6A6: #_CYBORG_7800: db $F1, $00 ; Set control
#_0CA6A8: #_CYBORG_7802: db $00 : dw CYBORG_SEGMENT_781B ; Music channel 0
#_0CA6AB: #_CYBORG_7805: db $01 : dw CYBORG_SEGMENT_7821 ; Music channel 1
#_0CA6AE: #_CYBORG_7808: db $02 : dw CYBORG_SEGMENT_7851 ; Music channel 2
#_0CA6B1: #_CYBORG_780B: db $03 : dw CYBORG_SEGMENT_7884 ; Music channel 3
#_0CA6B4: #_CYBORG_780E: db $04 : dw CYBORG_SEGMENT_78BD ; Music channel 4
#_0CA6B7: #_CYBORG_7811: db $05 : dw CYBORG_SEGMENT_78F4 ; Music channel 5
#_0CA6BA: #_CYBORG_7814: db $06 : dw CYBORG_SEGMENT_7931 ; Music channel 6
#_0CA6BD: #_CYBORG_7817: db $07 : dw CYBORG_SEGMENT_7961 ; Music channel 7
#_0CA6C0: #_CYBORG_781A: db $FF ; end of header

CYBORG_SEGMENT_781B:
#_0CA6C1: #_CYBORG_781B: db $66 ; vol 0x06
#_0CA6C2: #_CYBORG_781C: db $F9, $20 ; set fine tuning
#_0CA6C4: #_CYBORG_781E: db $F8 : dw CYBORG_SEGMENT_7822 ; goto location

CYBORG_SEGMENT_7821:
#_0CA6C7: #_CYBORG_7821: db $76 ; vol 0x16

CYBORG_SEGMENT_7822:
#_0CA6C8: #_CYBORG_7822: db $9C ; dur 0x1C
#_0CA6C9: #_CYBORG_7823: db $30 ; rest
#_0CA6CA: #_CYBORG_7824: db $F0, $FF, $E0 ; set ADSR
#_0CA6CD: #_CYBORG_7827: db $F1, $09 ; set SRCN
#_0CA6CF: #_CYBORG_7829: db $F2, $50 ; set panning
#_0CA6D1: #_CYBORG_782B: db $9D ; dur 0x1D
#_0CA6D2: #_CYBORG_782C: db $0E ; play note D3
#_0CA6D3: #_CYBORG_782D: db $96 ; dur 0x16
#_0CA6D4: #_CYBORG_782E: db $31 ; tie
#_0CA6D5: #_CYBORG_782F: db $0E ; play note D3
#_0CA6D6: #_CYBORG_7830: db $10 ; play note E3
#_0CA6D7: #_CYBORG_7831: db $11 ; play note F3

CYBORG_SEGMENT_7832:
#_0CA6D8: #_CYBORG_7832: db $9D ; dur 0x1D
#_0CA6D9: #_CYBORG_7833: db $31 ; tie
#_0CA6DA: #_CYBORG_7834: db $96 ; dur 0x16
#_0CA6DB: #_CYBORG_7835: db $09 ; play note A2
#_0CA6DC: #_CYBORG_7836: db $09 ; play note A2
#_0CA6DD: #_CYBORG_7837: db $0B ; play note B2
#_0CA6DE: #_CYBORG_7838: db $0C ; play note C3
#_0CA6DF: #_CYBORG_7839: db $9D ; dur 0x1D
#_0CA6E0: #_CYBORG_783A: db $31 ; tie
#_0CA6E1: #_CYBORG_783B: db $96 ; dur 0x16
#_0CA6E2: #_CYBORG_783C: db $0C ; play note C3
#_0CA6E3: #_CYBORG_783D: db $0B ; play note B2
#_0CA6E4: #_CYBORG_783E: db $0A ; play note As2
#_0CA6E5: #_CYBORG_783F: db $09 ; play note A2
#_0CA6E6: #_CYBORG_7840: db $9D ; dur 0x1D
#_0CA6E7: #_CYBORG_7841: db $31 ; tie
#_0CA6E8: #_CYBORG_7842: db $96 ; dur 0x16
#_0CA6E9: #_CYBORG_7843: db $31 ; tie
#_0CA6EA: #_CYBORG_7844: db $0C ; play note C3
#_0CA6EB: #_CYBORG_7845: db $31 ; tie
#_0CA6EC: #_CYBORG_7846: db $0E ; play note D3
#_0CA6ED: #_CYBORG_7847: db $9D ; dur 0x1D
#_0CA6EE: #_CYBORG_7848: db $31 ; tie
#_0CA6EF: #_CYBORG_7849: db $96 ; dur 0x16
#_0CA6F0: #_CYBORG_784A: db $31 ; tie
#_0CA6F1: #_CYBORG_784B: db $0E ; play note D3
#_0CA6F2: #_CYBORG_784C: db $10 ; play note E3
#_0CA6F3: #_CYBORG_784D: db $11 ; play note F3
#_0CA6F4: #_CYBORG_784E: db $F8 : dw CYBORG_SEGMENT_7832 ; goto location

CYBORG_SEGMENT_7851:
#_0CA6F7: #_CYBORG_7851: db $9C ; dur 0x1C
#_0CA6F8: #_CYBORG_7852: db $30 ; rest
#_0CA6F9: #_CYBORG_7853: db $71 ; vol 0x11
#_0CA6FA: #_CYBORG_7854: db $F0, $FE, $E8 ; set ADSR
#_0CA6FD: #_CYBORG_7857: db $F2, $66 ; set panning
#_0CA6FF: #_CYBORG_7859: db $96 ; dur 0x16

CYBORG_SEGMENT_785A:
#_0CA700: #_CYBORG_785A: db $F1, $08 ; set SRCN
#_0CA702: #_CYBORG_785C: db $F4, $03 ; set loop point B
#_0CA704: #_CYBORG_785E: db $30 ; rest
#_0CA705: #_CYBORG_785F: db $30 ; rest
#_0CA706: #_CYBORG_7860: db $24 ; play note C5
#_0CA707: #_CYBORG_7861: db $30 ; rest
#_0CA708: #_CYBORG_7862: db $24 ; play note C5
#_0CA709: #_CYBORG_7863: db $21 ; play note A4
#_0CA70A: #_CYBORG_7864: db $31 ; tie
#_0CA70B: #_CYBORG_7865: db $31 ; tie
#_0CA70C: #_CYBORG_7866: db $24 ; play note C5
#_0CA70D: #_CYBORG_7867: db $30 ; rest
#_0CA70E: #_CYBORG_7868: db $24 ; play note C5
#_0CA70F: #_CYBORG_7869: db $21 ; play note A4
#_0CA710: #_CYBORG_786A: db $31 ; tie
#_0CA711: #_CYBORG_786B: db $31 ; tie
#_0CA712: #_CYBORG_786C: db $31 ; tie
#_0CA713: #_CYBORG_786D: db $31 ; tie
#_0CA714: #_CYBORG_786E: db $F5 ; run loop B
#_0CA715: #_CYBORG_786F: db $30 ; rest
#_0CA716: #_CYBORG_7870: db $30 ; rest
#_0CA717: #_CYBORG_7871: db $24 ; play note C5
#_0CA718: #_CYBORG_7872: db $30 ; rest
#_0CA719: #_CYBORG_7873: db $24 ; play note C5
#_0CA71A: #_CYBORG_7874: db $21 ; play note A4
#_0CA71B: #_CYBORG_7875: db $31 ; tie
#_0CA71C: #_CYBORG_7876: db $31 ; tie
#_0CA71D: #_CYBORG_7877: db $F1, $06 ; set SRCN
#_0CA71F: #_CYBORG_7879: db $22 ; play note As4
#_0CA720: #_CYBORG_787A: db $26 ; play note D5
#_0CA721: #_CYBORG_787B: db $29 ; play note F5
#_0CA722: #_CYBORG_787C: db $24 ; play note C5
#_0CA723: #_CYBORG_787D: db $28 ; play note E5
#_0CA724: #_CYBORG_787E: db $29 ; play note F5
#_0CA725: #_CYBORG_787F: db $28 ; play note E5
#_0CA726: #_CYBORG_7880: db $24 ; play note C5
#_0CA727: #_CYBORG_7881: db $F8 : dw CYBORG_SEGMENT_785A ; goto location

CYBORG_SEGMENT_7884:
#_0CA72A: #_CYBORG_7884: db $61 ; vol 0x01
#_0CA72B: #_CYBORG_7885: db $F0, $FE, $E8 ; set ADSR
#_0CA72E: #_CYBORG_7888: db $F2, $66 ; set panning
#_0CA730: #_CYBORG_788A: db $F3, $F4 ; transpose -12
#_0CA732: #_CYBORG_788C: db $9C ; dur 0x1C
#_0CA733: #_CYBORG_788D: db $30 ; rest
#_0CA734: #_CYBORG_788E: db $96 ; dur 0x16

CYBORG_SEGMENT_788F:
#_0CA735: #_CYBORG_788F: db $F1, $08 ; set SRCN
#_0CA737: #_CYBORG_7891: db $F4, $03 ; set loop point B
#_0CA739: #_CYBORG_7893: db $30 ; rest
#_0CA73A: #_CYBORG_7894: db $30 ; rest
#_0CA73B: #_CYBORG_7895: db $24 ; play note C5
#_0CA73C: #_CYBORG_7896: db $30 ; rest
#_0CA73D: #_CYBORG_7897: db $24 ; play note C5
#_0CA73E: #_CYBORG_7898: db $21 ; play note A4
#_0CA73F: #_CYBORG_7899: db $31 ; tie
#_0CA740: #_CYBORG_789A: db $31 ; tie
#_0CA741: #_CYBORG_789B: db $24 ; play note C5
#_0CA742: #_CYBORG_789C: db $30 ; rest
#_0CA743: #_CYBORG_789D: db $24 ; play note C5
#_0CA744: #_CYBORG_789E: db $21 ; play note A4
#_0CA745: #_CYBORG_789F: db $31 ; tie
#_0CA746: #_CYBORG_78A0: db $31 ; tie
#_0CA747: #_CYBORG_78A1: db $31 ; tie
#_0CA748: #_CYBORG_78A2: db $31 ; tie
#_0CA749: #_CYBORG_78A3: db $F5 ; run loop B
#_0CA74A: #_CYBORG_78A4: db $30 ; rest
#_0CA74B: #_CYBORG_78A5: db $30 ; rest
#_0CA74C: #_CYBORG_78A6: db $24 ; play note C5
#_0CA74D: #_CYBORG_78A7: db $30 ; rest
#_0CA74E: #_CYBORG_78A8: db $24 ; play note C5
#_0CA74F: #_CYBORG_78A9: db $21 ; play note A4
#_0CA750: #_CYBORG_78AA: db $31 ; tie
#_0CA751: #_CYBORG_78AB: db $31 ; tie
#_0CA752: #_CYBORG_78AC: db $F1, $06 ; set SRCN
#_0CA754: #_CYBORG_78AE: db $F3, $00 ; transpose +0
#_0CA756: #_CYBORG_78B0: db $1D ; play note F4
#_0CA757: #_CYBORG_78B1: db $22 ; play note As4
#_0CA758: #_CYBORG_78B2: db $26 ; play note D5
#_0CA759: #_CYBORG_78B3: db $1F ; play note G4
#_0CA75A: #_CYBORG_78B4: db $24 ; play note C5
#_0CA75B: #_CYBORG_78B5: db $26 ; play note D5
#_0CA75C: #_CYBORG_78B6: db $24 ; play note C5
#_0CA75D: #_CYBORG_78B7: db $1F ; play note G4
#_0CA75E: #_CYBORG_78B8: db $F3, $F4 ; transpose -12
#_0CA760: #_CYBORG_78BA: db $F8 : dw CYBORG_SEGMENT_788F ; goto location

CYBORG_SEGMENT_78BD:
#_0CA763: #_CYBORG_78BD: db $97 ; dur 0x17
#_0CA764: #_CYBORG_78BE: db $30 ; rest
#_0CA765: #_CYBORG_78BF: db $9C ; dur 0x1C
#_0CA766: #_CYBORG_78C0: db $30 ; rest
#_0CA767: #_CYBORG_78C1: db $60 ; vol 0x00
#_0CA768: #_CYBORG_78C2: db $F0, $FE, $E8 ; set ADSR
#_0CA76B: #_CYBORG_78C5: db $F2, $73 ; set panning
#_0CA76D: #_CYBORG_78C7: db $F9, $30 ; set fine tuning
#_0CA76F: #_CYBORG_78C9: db $96 ; dur 0x16

CYBORG_SEGMENT_78CA:
#_0CA770: #_CYBORG_78CA: db $F1, $08 ; set SRCN
#_0CA772: #_CYBORG_78CC: db $F4, $03 ; set loop point B
#_0CA774: #_CYBORG_78CE: db $30 ; rest
#_0CA775: #_CYBORG_78CF: db $30 ; rest
#_0CA776: #_CYBORG_78D0: db $24 ; play note C5
#_0CA777: #_CYBORG_78D1: db $30 ; rest
#_0CA778: #_CYBORG_78D2: db $24 ; play note C5
#_0CA779: #_CYBORG_78D3: db $21 ; play note A4
#_0CA77A: #_CYBORG_78D4: db $31 ; tie
#_0CA77B: #_CYBORG_78D5: db $31 ; tie
#_0CA77C: #_CYBORG_78D6: db $24 ; play note C5
#_0CA77D: #_CYBORG_78D7: db $30 ; rest
#_0CA77E: #_CYBORG_78D8: db $24 ; play note C5
#_0CA77F: #_CYBORG_78D9: db $21 ; play note A4
#_0CA780: #_CYBORG_78DA: db $31 ; tie
#_0CA781: #_CYBORG_78DB: db $31 ; tie
#_0CA782: #_CYBORG_78DC: db $31 ; tie
#_0CA783: #_CYBORG_78DD: db $31 ; tie
#_0CA784: #_CYBORG_78DE: db $F5 ; run loop B
#_0CA785: #_CYBORG_78DF: db $30 ; rest
#_0CA786: #_CYBORG_78E0: db $30 ; rest
#_0CA787: #_CYBORG_78E1: db $24 ; play note C5
#_0CA788: #_CYBORG_78E2: db $30 ; rest
#_0CA789: #_CYBORG_78E3: db $24 ; play note C5
#_0CA78A: #_CYBORG_78E4: db $21 ; play note A4
#_0CA78B: #_CYBORG_78E5: db $31 ; tie
#_0CA78C: #_CYBORG_78E6: db $31 ; tie
#_0CA78D: #_CYBORG_78E7: db $F1, $06 ; set SRCN
#_0CA78F: #_CYBORG_78E9: db $22 ; play note As4
#_0CA790: #_CYBORG_78EA: db $26 ; play note D5
#_0CA791: #_CYBORG_78EB: db $29 ; play note F5
#_0CA792: #_CYBORG_78EC: db $24 ; play note C5
#_0CA793: #_CYBORG_78ED: db $28 ; play note E5
#_0CA794: #_CYBORG_78EE: db $29 ; play note F5
#_0CA795: #_CYBORG_78EF: db $28 ; play note E5
#_0CA796: #_CYBORG_78F0: db $24 ; play note C5
#_0CA797: #_CYBORG_78F1: db $F8 : dw CYBORG_SEGMENT_78CA ; goto location

CYBORG_SEGMENT_78F4:
#_0CA79A: #_CYBORG_78F4: db $97 ; dur 0x17
#_0CA79B: #_CYBORG_78F5: db $30 ; rest
#_0CA79C: #_CYBORG_78F6: db $9C ; dur 0x1C
#_0CA79D: #_CYBORG_78F7: db $30 ; rest
#_0CA79E: #_CYBORG_78F8: db $70 ; vol 0x10
#_0CA79F: #_CYBORG_78F9: db $F0, $FA, $E8 ; set ADSR
#_0CA7A2: #_CYBORG_78FC: db $F2, $72 ; set panning
#_0CA7A4: #_CYBORG_78FE: db $F3, $F4 ; transpose -12
#_0CA7A6: #_CYBORG_7900: db $96 ; dur 0x16

CYBORG_SEGMENT_7901:
#_0CA7A7: #_CYBORG_7901: db $F1, $08 ; set SRCN
#_0CA7A9: #_CYBORG_7903: db $F9, $20 ; set fine tuning
#_0CA7AB: #_CYBORG_7905: db $F4, $03 ; set loop point B
#_0CA7AD: #_CYBORG_7907: db $30 ; rest
#_0CA7AE: #_CYBORG_7908: db $30 ; rest
#_0CA7AF: #_CYBORG_7909: db $24 ; play note C5
#_0CA7B0: #_CYBORG_790A: db $30 ; rest
#_0CA7B1: #_CYBORG_790B: db $24 ; play note C5
#_0CA7B2: #_CYBORG_790C: db $21 ; play note A4
#_0CA7B3: #_CYBORG_790D: db $31 ; tie
#_0CA7B4: #_CYBORG_790E: db $31 ; tie
#_0CA7B5: #_CYBORG_790F: db $24 ; play note C5
#_0CA7B6: #_CYBORG_7910: db $30 ; rest
#_0CA7B7: #_CYBORG_7911: db $24 ; play note C5
#_0CA7B8: #_CYBORG_7912: db $21 ; play note A4
#_0CA7B9: #_CYBORG_7913: db $31 ; tie
#_0CA7BA: #_CYBORG_7914: db $31 ; tie
#_0CA7BB: #_CYBORG_7915: db $31 ; tie
#_0CA7BC: #_CYBORG_7916: db $31 ; tie
#_0CA7BD: #_CYBORG_7917: db $F5 ; run loop B
#_0CA7BE: #_CYBORG_7918: db $30 ; rest
#_0CA7BF: #_CYBORG_7919: db $30 ; rest
#_0CA7C0: #_CYBORG_791A: db $24 ; play note C5
#_0CA7C1: #_CYBORG_791B: db $30 ; rest
#_0CA7C2: #_CYBORG_791C: db $24 ; play note C5
#_0CA7C3: #_CYBORG_791D: db $21 ; play note A4
#_0CA7C4: #_CYBORG_791E: db $31 ; tie
#_0CA7C5: #_CYBORG_791F: db $31 ; tie
#_0CA7C6: #_CYBORG_7920: db $F1, $06 ; set SRCN
#_0CA7C8: #_CYBORG_7922: db $F3, $00 ; transpose +0
#_0CA7CA: #_CYBORG_7924: db $1D ; play note F4
#_0CA7CB: #_CYBORG_7925: db $21 ; play note A4
#_0CA7CC: #_CYBORG_7926: db $24 ; play note C5
#_0CA7CD: #_CYBORG_7927: db $1F ; play note G4
#_0CA7CE: #_CYBORG_7928: db $23 ; play note B4
#_0CA7CF: #_CYBORG_7929: db $24 ; play note C5
#_0CA7D0: #_CYBORG_792A: db $23 ; play note B4
#_0CA7D1: #_CYBORG_792B: db $1F ; play note G4
#_0CA7D2: #_CYBORG_792C: db $F3, $F4 ; transpose -12
#_0CA7D4: #_CYBORG_792E: db $F8 : dw CYBORG_SEGMENT_7901 ; goto location

CYBORG_SEGMENT_7931:
#_0CA7D7: #_CYBORG_7931: db $9C ; dur 0x1C
#_0CA7D8: #_CYBORG_7932: db $30 ; rest
#_0CA7D9: #_CYBORG_7933: db $70 ; vol 0x10
#_0CA7DA: #_CYBORG_7934: db $F0, $FF, $F4 ; set ADSR
#_0CA7DD: #_CYBORG_7937: db $F1, $02 ; set SRCN
#_0CA7DF: #_CYBORG_7939: db $F2, $4C ; set panning
#_0CA7E1: #_CYBORG_793B: db $96 ; dur 0x16

CYBORG_SEGMENT_793C:
#_0CA7E2: #_CYBORG_793C: db $F4, $0E ; set loop point B
#_0CA7E4: #_CYBORG_793E: db $1A ; play note D4
#_0CA7E5: #_CYBORG_793F: db $F5 ; run loop B
#_0CA7E6: #_CYBORG_7940: db $1C ; play note E4
#_0CA7E7: #_CYBORG_7941: db $1D ; play note F4
#_0CA7E8: #_CYBORG_7942: db $F4, $0C ; set loop point B
#_0CA7EA: #_CYBORG_7944: db $1D ; play note F4
#_0CA7EB: #_CYBORG_7945: db $F5 ; run loop B
#_0CA7EC: #_CYBORG_7946: db $15 ; play note A3
#_0CA7ED: #_CYBORG_7947: db $15 ; play note A3
#_0CA7EE: #_CYBORG_7948: db $17 ; play note B3
#_0CA7EF: #_CYBORG_7949: db $18 ; play note C4
#_0CA7F0: #_CYBORG_794A: db $F4, $0D ; set loop point B
#_0CA7F2: #_CYBORG_794C: db $18 ; play note C4
#_0CA7F3: #_CYBORG_794D: db $F5 ; run loop B
#_0CA7F4: #_CYBORG_794E: db $17 ; play note B3
#_0CA7F5: #_CYBORG_794F: db $16 ; play note As3
#_0CA7F6: #_CYBORG_7950: db $15 ; play note A3
#_0CA7F7: #_CYBORG_7951: db $F4, $08 ; set loop point B
#_0CA7F9: #_CYBORG_7953: db $15 ; play note A3
#_0CA7FA: #_CYBORG_7954: db $F5 ; run loop B
#_0CA7FB: #_CYBORG_7955: db $16 ; play note As3
#_0CA7FC: #_CYBORG_7956: db $1A ; play note D4
#_0CA7FD: #_CYBORG_7957: db $1D ; play note F4
#_0CA7FE: #_CYBORG_7958: db $18 ; play note C4
#_0CA7FF: #_CYBORG_7959: db $1C ; play note E4
#_0CA800: #_CYBORG_795A: db $1D ; play note F4
#_0CA801: #_CYBORG_795B: db $1C ; play note E4
#_0CA802: #_CYBORG_795C: db $18 ; play note C4
#_0CA803: #_CYBORG_795D: db $F8 : dw CYBORG_SEGMENT_793C ; goto location
#_0CA806: #_CYBORG_7960: db $FF ; end track

CYBORG_SEGMENT_7961:
#_0CA807: #_CYBORG_7961: db $70 ; vol 0x10
#_0CA808: #_CYBORG_7962: db $F0, $FF, $E0 ; set ADSR
#_0CA80B: #_CYBORG_7965: db $F2, $44 ; set panning
#_0CA80D: #_CYBORG_7967: db $96 ; dur 0x16
#_0CA80E: #_CYBORG_7968: db $F4, $04 ; set loop point B
#_0CA810: #_CYBORG_796A: db $F1, $01 ; set SRCN
#_0CA812: #_CYBORG_796C: db $18 ; play note C4
#_0CA813: #_CYBORG_796D: db $F1, $00 ; set SRCN
#_0CA815: #_CYBORG_796F: db $18 ; play note C4
#_0CA816: #_CYBORG_7970: db $F5 ; run loop B

CYBORG_SEGMENT_7971:
#_0CA817: #_CYBORG_7971: db $F4, $07 ; set loop point B
#_0CA819: #_CYBORG_7973: db $F1, $00 ; set SRCN
#_0CA81B: #_CYBORG_7975: db $18 ; play note C4
#_0CA81C: #_CYBORG_7976: db $31 ; tie
#_0CA81D: #_CYBORG_7977: db $F1, $01 ; set SRCN
#_0CA81F: #_CYBORG_7979: db $18 ; play note C4
#_0CA820: #_CYBORG_797A: db $31 ; tie
#_0CA821: #_CYBORG_797B: db $F1, $00 ; set SRCN
#_0CA823: #_CYBORG_797D: db $18 ; play note C4
#_0CA824: #_CYBORG_797E: db $18 ; play note C4
#_0CA825: #_CYBORG_797F: db $F1, $01 ; set SRCN
#_0CA827: #_CYBORG_7981: db $18 ; play note C4
#_0CA828: #_CYBORG_7982: db $31 ; tie
#_0CA829: #_CYBORG_7983: db $F5 ; run loop B
#_0CA82A: #_CYBORG_7984: db $18 ; play note C4
#_0CA82B: #_CYBORG_7985: db $F1, $00 ; set SRCN
#_0CA82D: #_CYBORG_7987: db $18 ; play note C4
#_0CA82E: #_CYBORG_7988: db $18 ; play note C4
#_0CA82F: #_CYBORG_7989: db $F1, $01 ; set SRCN
#_0CA831: #_CYBORG_798B: db $18 ; play note C4
#_0CA832: #_CYBORG_798C: db $F1, $00 ; set SRCN
#_0CA834: #_CYBORG_798E: db $18 ; play note C4
#_0CA835: #_CYBORG_798F: db $18 ; play note C4
#_0CA836: #_CYBORG_7990: db $F1, $01 ; set SRCN
#_0CA838: #_CYBORG_7992: db $18 ; play note C4
#_0CA839: #_CYBORG_7993: db $F1, $00 ; set SRCN
#_0CA83B: #_CYBORG_7995: db $18 ; play note C4
#_0CA83C: #_CYBORG_7996: db $F8 : dw CYBORG_SEGMENT_7971 ; goto location

;===================================================================================================
; 
;===================================================================================================
Gameover_SPC_Data:
#_0CA83F: dw $01F8, $0000

SONG_GAMEOVER:
#_0CA843: #_GAMEOVER_7800: db $F1, $00 ; Set control
#_0CA845: #_GAMEOVER_7802: db $00 : dw GAMEOVER_SEGMENT_786E ; Music channel 0
#_0CA848: #_GAMEOVER_7805: db $01 : dw GAMEOVER_SEGMENT_78AF ; Music channel 1
#_0CA84B: #_GAMEOVER_7808: db $02 : dw GAMEOVER_SEGMENT_78F0 ; Music channel 2
#_0CA84E: #_GAMEOVER_780B: db $03 : dw GAMEOVER_SEGMENT_792F ; Music channel 3
#_0CA851: #_GAMEOVER_780E: db $04 : dw GAMEOVER_SEGMENT_7970 ; Music channel 4
#_0CA854: #_GAMEOVER_7811: db $05 : dw GAMEOVER_SEGMENT_781B ; Music channel 5
#_0CA857: #_GAMEOVER_7814: db $06 : dw GAMEOVER_SEGMENT_797D ; Music channel 6
#_0CA85A: #_GAMEOVER_7817: db $07 : dw GAMEOVER_SEGMENT_7997 ; Music channel 7
#_0CA85D: #_GAMEOVER_781A: db $FF ; end of header

GAMEOVER_SEGMENT_781B:
#_0CA85E: #_GAMEOVER_781B: db $89 ; dur 0x09
#_0CA85F: #_GAMEOVER_781C: db $30 ; rest
#_0CA860: #_GAMEOVER_781D: db $70 ; vol 0x10
#_0CA861: #_GAMEOVER_781E: db $F0, $FE, $F0 ; set ADSR
#_0CA864: #_GAMEOVER_7821: db $F1, $08 ; set SRCN
#_0CA866: #_GAMEOVER_7823: db $F9, $30 ; set fine tuning
#_0CA868: #_GAMEOVER_7825: db $88 ; dur 0x08
#_0CA869: #_GAMEOVER_7826: db $F2, $7E ; set panning
#_0CA86B: #_GAMEOVER_7828: db $1E ; play note Fs4
#_0CA86C: #_GAMEOVER_7829: db $1F ; play note G4
#_0CA86D: #_GAMEOVER_782A: db $F2, $7D ; set panning
#_0CA86F: #_GAMEOVER_782C: db $26 ; play note D5
#_0CA870: #_GAMEOVER_782D: db $28 ; play note E5
#_0CA871: #_GAMEOVER_782E: db $F2, $7C ; set panning
#_0CA873: #_GAMEOVER_7830: db $1E ; play note Fs4
#_0CA874: #_GAMEOVER_7831: db $1F ; play note G4
#_0CA875: #_GAMEOVER_7832: db $F2, $7B ; set panning
#_0CA877: #_GAMEOVER_7834: db $26 ; play note D5
#_0CA878: #_GAMEOVER_7835: db $28 ; play note E5
#_0CA879: #_GAMEOVER_7836: db $F2, $7A ; set panning
#_0CA87B: #_GAMEOVER_7838: db $1E ; play note Fs4
#_0CA87C: #_GAMEOVER_7839: db $1F ; play note G4
#_0CA87D: #_GAMEOVER_783A: db $F2, $79 ; set panning
#_0CA87F: #_GAMEOVER_783C: db $26 ; play note D5
#_0CA880: #_GAMEOVER_783D: db $28 ; play note E5
#_0CA881: #_GAMEOVER_783E: db $F2, $78 ; set panning
#_0CA883: #_GAMEOVER_7840: db $1E ; play note Fs4
#_0CA884: #_GAMEOVER_7841: db $1F ; play note G4
#_0CA885: #_GAMEOVER_7842: db $F2, $77 ; set panning
#_0CA887: #_GAMEOVER_7844: db $26 ; play note D5
#_0CA888: #_GAMEOVER_7845: db $28 ; play note E5
#_0CA889: #_GAMEOVER_7846: db $F2, $76 ; set panning
#_0CA88B: #_GAMEOVER_7848: db $1E ; play note Fs4
#_0CA88C: #_GAMEOVER_7849: db $1F ; play note G4
#_0CA88D: #_GAMEOVER_784A: db $F2, $75 ; set panning
#_0CA88F: #_GAMEOVER_784C: db $26 ; play note D5
#_0CA890: #_GAMEOVER_784D: db $28 ; play note E5
#_0CA891: #_GAMEOVER_784E: db $F2, $74 ; set panning
#_0CA893: #_GAMEOVER_7850: db $1E ; play note Fs4
#_0CA894: #_GAMEOVER_7851: db $1F ; play note G4
#_0CA895: #_GAMEOVER_7852: db $F2, $73 ; set panning
#_0CA897: #_GAMEOVER_7854: db $26 ; play note D5
#_0CA898: #_GAMEOVER_7855: db $28 ; play note E5
#_0CA899: #_GAMEOVER_7856: db $F2, $72 ; set panning
#_0CA89B: #_GAMEOVER_7858: db $1E ; play note Fs4
#_0CA89C: #_GAMEOVER_7859: db $1F ; play note G4
#_0CA89D: #_GAMEOVER_785A: db $F2, $71 ; set panning
#_0CA89F: #_GAMEOVER_785C: db $26 ; play note D5
#_0CA8A0: #_GAMEOVER_785D: db $28 ; play note E5
#_0CA8A1: #_GAMEOVER_785E: db $F2, $70 ; set panning
#_0CA8A3: #_GAMEOVER_7860: db $1E ; play note Fs4
#_0CA8A4: #_GAMEOVER_7861: db $1F ; play note G4
#_0CA8A5: #_GAMEOVER_7862: db $F2, $6F ; set panning
#_0CA8A7: #_GAMEOVER_7864: db $26 ; play note D5
#_0CA8A8: #_GAMEOVER_7865: db $28 ; play note E5

GAMEOVER_SEGMENT_7866:
#_0CA8A9: #_GAMEOVER_7866: db $1E ; play note Fs4
#_0CA8AA: #_GAMEOVER_7867: db $1F ; play note G4
#_0CA8AB: #_GAMEOVER_7868: db $26 ; play note D5
#_0CA8AC: #_GAMEOVER_7869: db $28 ; play note E5
#_0CA8AD: #_GAMEOVER_786A: db $F8 : dw GAMEOVER_SEGMENT_7866 ; goto location
#_0CA8B0: #_GAMEOVER_786D: db $FF ; end track

GAMEOVER_SEGMENT_786E:
#_0CA8B1: #_GAMEOVER_786E: db $72 ; vol 0x12
#_0CA8B2: #_GAMEOVER_786F: db $F0, $FE, $F0 ; set ADSR
#_0CA8B5: #_GAMEOVER_7872: db $F1, $08 ; set SRCN
#_0CA8B7: #_GAMEOVER_7874: db $88 ; dur 0x08
#_0CA8B8: #_GAMEOVER_7875: db $F2, $7E ; set panning
#_0CA8BA: #_GAMEOVER_7877: db $1E ; play note Fs4
#_0CA8BB: #_GAMEOVER_7878: db $31 ; tie
#_0CA8BC: #_GAMEOVER_7879: db $31 ; tie
#_0CA8BD: #_GAMEOVER_787A: db $31 ; tie
#_0CA8BE: #_GAMEOVER_787B: db $F2, $7A ; set panning
#_0CA8C0: #_GAMEOVER_787D: db $1E ; play note Fs4
#_0CA8C1: #_GAMEOVER_787E: db $31 ; tie
#_0CA8C2: #_GAMEOVER_787F: db $31 ; tie
#_0CA8C3: #_GAMEOVER_7880: db $31 ; tie
#_0CA8C4: #_GAMEOVER_7881: db $F2, $76 ; set panning
#_0CA8C6: #_GAMEOVER_7883: db $1E ; play note Fs4
#_0CA8C7: #_GAMEOVER_7884: db $31 ; tie
#_0CA8C8: #_GAMEOVER_7885: db $31 ; tie
#_0CA8C9: #_GAMEOVER_7886: db $31 ; tie
#_0CA8CA: #_GAMEOVER_7887: db $F2, $72 ; set panning
#_0CA8CC: #_GAMEOVER_7889: db $1E ; play note Fs4
#_0CA8CD: #_GAMEOVER_788A: db $31 ; tie
#_0CA8CE: #_GAMEOVER_788B: db $31 ; tie
#_0CA8CF: #_GAMEOVER_788C: db $31 ; tie
#_0CA8D0: #_GAMEOVER_788D: db $F2, $6E ; set panning
#_0CA8D2: #_GAMEOVER_788F: db $1E ; play note Fs4
#_0CA8D3: #_GAMEOVER_7890: db $31 ; tie
#_0CA8D4: #_GAMEOVER_7891: db $31 ; tie
#_0CA8D5: #_GAMEOVER_7892: db $31 ; tie
#_0CA8D6: #_GAMEOVER_7893: db $F2, $6A ; set panning
#_0CA8D8: #_GAMEOVER_7895: db $1E ; play note Fs4
#_0CA8D9: #_GAMEOVER_7896: db $31 ; tie
#_0CA8DA: #_GAMEOVER_7897: db $31 ; tie
#_0CA8DB: #_GAMEOVER_7898: db $31 ; tie
#_0CA8DC: #_GAMEOVER_7899: db $F2, $66 ; set panning
#_0CA8DE: #_GAMEOVER_789B: db $1E ; play note Fs4
#_0CA8DF: #_GAMEOVER_789C: db $31 ; tie
#_0CA8E0: #_GAMEOVER_789D: db $31 ; tie
#_0CA8E1: #_GAMEOVER_789E: db $31 ; tie
#_0CA8E2: #_GAMEOVER_789F: db $F2, $62 ; set panning
#_0CA8E4: #_GAMEOVER_78A1: db $1E ; play note Fs4
#_0CA8E5: #_GAMEOVER_78A2: db $31 ; tie
#_0CA8E6: #_GAMEOVER_78A3: db $31 ; tie
#_0CA8E7: #_GAMEOVER_78A4: db $31 ; tie
#_0CA8E8: #_GAMEOVER_78A5: db $F2, $60 ; set panning

GAMEOVER_SEGMENT_78A7:
#_0CA8EA: #_GAMEOVER_78A7: db $1E ; play note Fs4
#_0CA8EB: #_GAMEOVER_78A8: db $31 ; tie
#_0CA8EC: #_GAMEOVER_78A9: db $31 ; tie
#_0CA8ED: #_GAMEOVER_78AA: db $31 ; tie
#_0CA8EE: #_GAMEOVER_78AB: db $F8 : dw GAMEOVER_SEGMENT_78A7 ; goto location
#_0CA8F1: #_GAMEOVER_78AE: db $FF ; end track

GAMEOVER_SEGMENT_78AF:
#_0CA8F2: #_GAMEOVER_78AF: db $64 ; vol 0x04
#_0CA8F3: #_GAMEOVER_78B0: db $F0, $FE, $F0 ; set ADSR
#_0CA8F6: #_GAMEOVER_78B3: db $F1, $08 ; set SRCN
#_0CA8F8: #_GAMEOVER_78B5: db $88 ; dur 0x08
#_0CA8F9: #_GAMEOVER_78B6: db $F2, $7D ; set panning
#_0CA8FB: #_GAMEOVER_78B8: db $30 ; rest
#_0CA8FC: #_GAMEOVER_78B9: db $1F ; play note G4
#_0CA8FD: #_GAMEOVER_78BA: db $31 ; tie
#_0CA8FE: #_GAMEOVER_78BB: db $31 ; tie
#_0CA8FF: #_GAMEOVER_78BC: db $F2, $79 ; set panning
#_0CA901: #_GAMEOVER_78BE: db $31 ; tie
#_0CA902: #_GAMEOVER_78BF: db $1F ; play note G4
#_0CA903: #_GAMEOVER_78C0: db $31 ; tie
#_0CA904: #_GAMEOVER_78C1: db $31 ; tie
#_0CA905: #_GAMEOVER_78C2: db $F2, $75 ; set panning
#_0CA907: #_GAMEOVER_78C4: db $31 ; tie
#_0CA908: #_GAMEOVER_78C5: db $1F ; play note G4
#_0CA909: #_GAMEOVER_78C6: db $31 ; tie
#_0CA90A: #_GAMEOVER_78C7: db $31 ; tie
#_0CA90B: #_GAMEOVER_78C8: db $F2, $71 ; set panning
#_0CA90D: #_GAMEOVER_78CA: db $31 ; tie
#_0CA90E: #_GAMEOVER_78CB: db $1F ; play note G4
#_0CA90F: #_GAMEOVER_78CC: db $31 ; tie
#_0CA910: #_GAMEOVER_78CD: db $31 ; tie
#_0CA911: #_GAMEOVER_78CE: db $F2, $6D ; set panning
#_0CA913: #_GAMEOVER_78D0: db $31 ; tie
#_0CA914: #_GAMEOVER_78D1: db $1F ; play note G4
#_0CA915: #_GAMEOVER_78D2: db $31 ; tie
#_0CA916: #_GAMEOVER_78D3: db $31 ; tie
#_0CA917: #_GAMEOVER_78D4: db $F2, $69 ; set panning
#_0CA919: #_GAMEOVER_78D6: db $31 ; tie
#_0CA91A: #_GAMEOVER_78D7: db $1F ; play note G4
#_0CA91B: #_GAMEOVER_78D8: db $31 ; tie
#_0CA91C: #_GAMEOVER_78D9: db $31 ; tie
#_0CA91D: #_GAMEOVER_78DA: db $F2, $65 ; set panning
#_0CA91F: #_GAMEOVER_78DC: db $31 ; tie
#_0CA920: #_GAMEOVER_78DD: db $1F ; play note G4
#_0CA921: #_GAMEOVER_78DE: db $31 ; tie
#_0CA922: #_GAMEOVER_78DF: db $31 ; tie
#_0CA923: #_GAMEOVER_78E0: db $F2, $61 ; set panning
#_0CA925: #_GAMEOVER_78E2: db $31 ; tie
#_0CA926: #_GAMEOVER_78E3: db $1F ; play note G4
#_0CA927: #_GAMEOVER_78E4: db $31 ; tie
#_0CA928: #_GAMEOVER_78E5: db $31 ; tie
#_0CA929: #_GAMEOVER_78E6: db $F2, $60 ; set panning

GAMEOVER_SEGMENT_78E8:
#_0CA92B: #_GAMEOVER_78E8: db $31 ; tie
#_0CA92C: #_GAMEOVER_78E9: db $1F ; play note G4
#_0CA92D: #_GAMEOVER_78EA: db $31 ; tie
#_0CA92E: #_GAMEOVER_78EB: db $31 ; tie
#_0CA92F: #_GAMEOVER_78EC: db $F8 : dw GAMEOVER_SEGMENT_78E8 ; goto location
#_0CA932: #_GAMEOVER_78EF: db $FF ; end track

GAMEOVER_SEGMENT_78F0:
#_0CA933: #_GAMEOVER_78F0: db $62 ; vol 0x02
#_0CA934: #_GAMEOVER_78F1: db $F0, $FE, $F0 ; set ADSR
#_0CA937: #_GAMEOVER_78F4: db $F1, $08 ; set SRCN
#_0CA939: #_GAMEOVER_78F6: db $88 ; dur 0x08
#_0CA93A: #_GAMEOVER_78F7: db $F2, $7C ; set panning
#_0CA93C: #_GAMEOVER_78F9: db $30 ; rest
#_0CA93D: #_GAMEOVER_78FA: db $30 ; rest
#_0CA93E: #_GAMEOVER_78FB: db $26 ; play note D5
#_0CA93F: #_GAMEOVER_78FC: db $31 ; tie
#_0CA940: #_GAMEOVER_78FD: db $F2, $78 ; set panning
#_0CA942: #_GAMEOVER_78FF: db $31 ; tie
#_0CA943: #_GAMEOVER_7900: db $31 ; tie
#_0CA944: #_GAMEOVER_7901: db $26 ; play note D5
#_0CA945: #_GAMEOVER_7902: db $31 ; tie
#_0CA946: #_GAMEOVER_7903: db $F2, $74 ; set panning
#_0CA948: #_GAMEOVER_7905: db $31 ; tie
#_0CA949: #_GAMEOVER_7906: db $31 ; tie
#_0CA94A: #_GAMEOVER_7907: db $26 ; play note D5
#_0CA94B: #_GAMEOVER_7908: db $31 ; tie
#_0CA94C: #_GAMEOVER_7909: db $F2, $70 ; set panning
#_0CA94E: #_GAMEOVER_790B: db $31 ; tie
#_0CA94F: #_GAMEOVER_790C: db $31 ; tie
#_0CA950: #_GAMEOVER_790D: db $26 ; play note D5
#_0CA951: #_GAMEOVER_790E: db $31 ; tie
#_0CA952: #_GAMEOVER_790F: db $F2, $6C ; set panning
#_0CA954: #_GAMEOVER_7911: db $31 ; tie
#_0CA955: #_GAMEOVER_7912: db $31 ; tie
#_0CA956: #_GAMEOVER_7913: db $26 ; play note D5
#_0CA957: #_GAMEOVER_7914: db $31 ; tie
#_0CA958: #_GAMEOVER_7915: db $F2, $68 ; set panning
#_0CA95A: #_GAMEOVER_7917: db $31 ; tie
#_0CA95B: #_GAMEOVER_7918: db $31 ; tie
#_0CA95C: #_GAMEOVER_7919: db $26 ; play note D5
#_0CA95D: #_GAMEOVER_791A: db $31 ; tie
#_0CA95E: #_GAMEOVER_791B: db $F2, $64 ; set panning
#_0CA960: #_GAMEOVER_791D: db $31 ; tie
#_0CA961: #_GAMEOVER_791E: db $31 ; tie
#_0CA962: #_GAMEOVER_791F: db $26 ; play note D5
#_0CA963: #_GAMEOVER_7920: db $31 ; tie
#_0CA964: #_GAMEOVER_7921: db $F2, $60 ; set panning
#_0CA966: #_GAMEOVER_7923: db $31 ; tie
#_0CA967: #_GAMEOVER_7924: db $31 ; tie
#_0CA968: #_GAMEOVER_7925: db $26 ; play note D5
#_0CA969: #_GAMEOVER_7926: db $31 ; tie

GAMEOVER_SEGMENT_7927:
#_0CA96A: #_GAMEOVER_7927: db $31 ; tie
#_0CA96B: #_GAMEOVER_7928: db $31 ; tie
#_0CA96C: #_GAMEOVER_7929: db $26 ; play note D5
#_0CA96D: #_GAMEOVER_792A: db $31 ; tie
#_0CA96E: #_GAMEOVER_792B: db $F8 : dw GAMEOVER_SEGMENT_7927 ; goto location
#_0CA971: #_GAMEOVER_792E: db $FF ; end track

GAMEOVER_SEGMENT_792F:
#_0CA972: #_GAMEOVER_792F: db $74 ; vol 0x14
#_0CA973: #_GAMEOVER_7930: db $F0, $FE, $F0 ; set ADSR
#_0CA976: #_GAMEOVER_7933: db $F1, $08 ; set SRCN
#_0CA978: #_GAMEOVER_7935: db $88 ; dur 0x08
#_0CA979: #_GAMEOVER_7936: db $F2, $7B ; set panning
#_0CA97B: #_GAMEOVER_7938: db $30 ; rest
#_0CA97C: #_GAMEOVER_7939: db $30 ; rest
#_0CA97D: #_GAMEOVER_793A: db $30 ; rest
#_0CA97E: #_GAMEOVER_793B: db $28 ; play note E5
#_0CA97F: #_GAMEOVER_793C: db $F2, $77 ; set panning
#_0CA981: #_GAMEOVER_793E: db $31 ; tie
#_0CA982: #_GAMEOVER_793F: db $31 ; tie
#_0CA983: #_GAMEOVER_7940: db $31 ; tie
#_0CA984: #_GAMEOVER_7941: db $28 ; play note E5
#_0CA985: #_GAMEOVER_7942: db $F2, $73 ; set panning
#_0CA987: #_GAMEOVER_7944: db $31 ; tie
#_0CA988: #_GAMEOVER_7945: db $31 ; tie
#_0CA989: #_GAMEOVER_7946: db $31 ; tie
#_0CA98A: #_GAMEOVER_7947: db $28 ; play note E5
#_0CA98B: #_GAMEOVER_7948: db $F2, $6F ; set panning
#_0CA98D: #_GAMEOVER_794A: db $31 ; tie
#_0CA98E: #_GAMEOVER_794B: db $31 ; tie
#_0CA98F: #_GAMEOVER_794C: db $31 ; tie
#_0CA990: #_GAMEOVER_794D: db $28 ; play note E5
#_0CA991: #_GAMEOVER_794E: db $F2, $6B ; set panning
#_0CA993: #_GAMEOVER_7950: db $31 ; tie
#_0CA994: #_GAMEOVER_7951: db $31 ; tie
#_0CA995: #_GAMEOVER_7952: db $31 ; tie
#_0CA996: #_GAMEOVER_7953: db $28 ; play note E5
#_0CA997: #_GAMEOVER_7954: db $F2, $67 ; set panning
#_0CA999: #_GAMEOVER_7956: db $31 ; tie
#_0CA99A: #_GAMEOVER_7957: db $31 ; tie
#_0CA99B: #_GAMEOVER_7958: db $31 ; tie
#_0CA99C: #_GAMEOVER_7959: db $28 ; play note E5
#_0CA99D: #_GAMEOVER_795A: db $F2, $63 ; set panning
#_0CA99F: #_GAMEOVER_795C: db $31 ; tie
#_0CA9A0: #_GAMEOVER_795D: db $31 ; tie
#_0CA9A1: #_GAMEOVER_795E: db $31 ; tie
#_0CA9A2: #_GAMEOVER_795F: db $28 ; play note E5
#_0CA9A3: #_GAMEOVER_7960: db $F2, $5F ; set panning
#_0CA9A5: #_GAMEOVER_7962: db $31 ; tie
#_0CA9A6: #_GAMEOVER_7963: db $31 ; tie
#_0CA9A7: #_GAMEOVER_7964: db $31 ; tie
#_0CA9A8: #_GAMEOVER_7965: db $28 ; play note E5
#_0CA9A9: #_GAMEOVER_7966: db $F2, $60 ; set panning

GAMEOVER_SEGMENT_7968:
#_0CA9AB: #_GAMEOVER_7968: db $31 ; tie
#_0CA9AC: #_GAMEOVER_7969: db $31 ; tie
#_0CA9AD: #_GAMEOVER_796A: db $31 ; tie
#_0CA9AE: #_GAMEOVER_796B: db $28 ; play note E5
#_0CA9AF: #_GAMEOVER_796C: db $F8 : dw GAMEOVER_SEGMENT_7968 ; goto location
#_0CA9B2: #_GAMEOVER_796F: db $FF ; end track

GAMEOVER_SEGMENT_7970:
#_0CA9B3: #_GAMEOVER_7970: db $89 ; dur 0x09
#_0CA9B4: #_GAMEOVER_7971: db $30 ; rest
#_0CA9B5: #_GAMEOVER_7972: db $F0, $F9, $EC ; set ADSR
#_0CA9B8: #_GAMEOVER_7975: db $F2, $68 ; set panning
#_0CA9BA: #_GAMEOVER_7977: db $F9, $28 ; set fine tuning
#_0CA9BC: #_GAMEOVER_7979: db $F8 : dw GAMEOVER_SEGMENT_7982 ; goto location
#_0CA9BF: #_GAMEOVER_797C: db $FF ; end track

GAMEOVER_SEGMENT_797D:
#_0CA9C0: #_GAMEOVER_797D: db $F0, $FB, $F0 ; set ADSR
#_0CA9C3: #_GAMEOVER_7980: db $F2, $60 ; set panning

GAMEOVER_SEGMENT_7982:
#_0CA9C5: #_GAMEOVER_7982: db $8C ; dur 0x0C
#_0CA9C6: #_GAMEOVER_7983: db $30 ; rest
#_0CA9C7: #_GAMEOVER_7984: db $30 ; rest
#_0CA9C8: #_GAMEOVER_7985: db $30 ; rest
#_0CA9C9: #_GAMEOVER_7986: db $30 ; rest
#_0CA9CA: #_GAMEOVER_7987: db $30 ; rest
#_0CA9CB: #_GAMEOVER_7988: db $30 ; rest
#_0CA9CC: #_GAMEOVER_7989: db $30 ; rest
#_0CA9CD: #_GAMEOVER_798A: db $30 ; rest
#_0CA9CE: #_GAMEOVER_798B: db $70 ; vol 0x10
#_0CA9CF: #_GAMEOVER_798C: db $F1, $09 ; set SRCN

GAMEOVER_SEGMENT_798E:
#_0CA9D1: #_GAMEOVER_798E: db $8B ; dur 0x0B
#_0CA9D2: #_GAMEOVER_798F: db $21 ; play note A4
#_0CA9D3: #_GAMEOVER_7990: db $1F ; play note G4
#_0CA9D4: #_GAMEOVER_7991: db $8A ; dur 0x0A
#_0CA9D5: #_GAMEOVER_7992: db $1E ; play note Fs4
#_0CA9D6: #_GAMEOVER_7993: db $F8 : dw GAMEOVER_SEGMENT_798E ; goto location
#_0CA9D9: #_GAMEOVER_7996: db $FF ; end track

GAMEOVER_SEGMENT_7997:
#_0CA9DA: #_GAMEOVER_7997: db $70 ; vol 0x10
#_0CA9DB: #_GAMEOVER_7998: db $F0, $FA, $EA ; set ADSR
#_0CA9DE: #_GAMEOVER_799B: db $F1, $02 ; set SRCN
#_0CA9E0: #_GAMEOVER_799D: db $F2, $4C ; set panning
#_0CA9E2: #_GAMEOVER_799F: db $8C ; dur 0x0C
#_0CA9E3: #_GAMEOVER_79A0: db $30 ; rest
#_0CA9E4: #_GAMEOVER_79A1: db $30 ; rest
#_0CA9E5: #_GAMEOVER_79A2: db $30 ; rest
#_0CA9E6: #_GAMEOVER_79A3: db $30 ; rest
#_0CA9E7: #_GAMEOVER_79A4: db $30 ; rest
#_0CA9E8: #_GAMEOVER_79A5: db $30 ; rest
#_0CA9E9: #_GAMEOVER_79A6: db $30 ; rest
#_0CA9EA: #_GAMEOVER_79A7: db $8A ; dur 0x0A
#_0CA9EB: #_GAMEOVER_79A8: db $1C ; play note E4
#_0CA9EC: #_GAMEOVER_79A9: db $E3, $E0 ; pitch bend on
#_0CA9EE: #_GAMEOVER_79AB: db $31 ; tie
#_0CA9EF: #_GAMEOVER_79AC: db $E2 ; pitch bend off

GAMEOVER_SEGMENT_79AD:
#_0CA9F0: #_GAMEOVER_79AD: db $8C ; dur 0x0C
#_0CA9F1: #_GAMEOVER_79AE: db $18 ; play note C4
#_0CA9F2: #_GAMEOVER_79AF: db $31 ; tie
#_0CA9F3: #_GAMEOVER_79B0: db $31 ; tie
#_0CA9F4: #_GAMEOVER_79B1: db $8B ; dur 0x0B
#_0CA9F5: #_GAMEOVER_79B2: db $31 ; tie
#_0CA9F6: #_GAMEOVER_79B3: db $88 ; dur 0x08
#_0CA9F7: #_GAMEOVER_79B4: db $1E ; play note Fs4
#_0CA9F8: #_GAMEOVER_79B5: db $8C ; dur 0x0C
#_0CA9F9: #_GAMEOVER_79B6: db $1F ; play note G4
#_0CA9FA: #_GAMEOVER_79B7: db $31 ; tie
#_0CA9FB: #_GAMEOVER_79B8: db $21 ; play note A4
#_0CA9FC: #_GAMEOVER_79B9: db $E3, $F0 ; pitch bend on
#_0CA9FE: #_GAMEOVER_79BB: db $8A ; dur 0x0A
#_0CA9FF: #_GAMEOVER_79BC: db $31 ; tie
#_0CAA00: #_GAMEOVER_79BD: db $E2 ; pitch bend off
#_0CAA01: #_GAMEOVER_79BE: db $88 ; dur 0x08
#_0CAA02: #_GAMEOVER_79BF: db $1E ; play note Fs4
#_0CAA03: #_GAMEOVER_79C0: db $1F ; play note G4
#_0CAA04: #_GAMEOVER_79C1: db $8C ; dur 0x0C
#_0CAA05: #_GAMEOVER_79C2: db $18 ; play note C4
#_0CAA06: #_GAMEOVER_79C3: db $31 ; tie
#_0CAA07: #_GAMEOVER_79C4: db $31 ; tie
#_0CAA08: #_GAMEOVER_79C5: db $31 ; tie
#_0CAA09: #_GAMEOVER_79C6: db $1A ; play note D4
#_0CAA0A: #_GAMEOVER_79C7: db $31 ; tie
#_0CAA0B: #_GAMEOVER_79C8: db $31 ; tie
#_0CAA0C: #_GAMEOVER_79C9: db $E3, $F8 ; pitch bend on
#_0CAA0E: #_GAMEOVER_79CB: db $31 ; tie
#_0CAA0F: #_GAMEOVER_79CC: db $E2 ; pitch bend off
#_0CAA10: #_GAMEOVER_79CD: db $8C ; dur 0x0C
#_0CAA11: #_GAMEOVER_79CE: db $18 ; play note C4
#_0CAA12: #_GAMEOVER_79CF: db $31 ; tie
#_0CAA13: #_GAMEOVER_79D0: db $31 ; tie
#_0CAA14: #_GAMEOVER_79D1: db $88 ; dur 0x08
#_0CAA15: #_GAMEOVER_79D2: db $31 ; tie
#_0CAA16: #_GAMEOVER_79D3: db $1E ; play note Fs4
#_0CAA17: #_GAMEOVER_79D4: db $FC ; fade out
#_0CAA18: #_GAMEOVER_79D5: db $1F ; play note G4
#_0CAA19: #_GAMEOVER_79D6: db $1E ; play note Fs4
#_0CAA1A: #_GAMEOVER_79D7: db $FD ; disable fade
#_0CAA1B: #_GAMEOVER_79D8: db $8C ; dur 0x0C
#_0CAA1C: #_GAMEOVER_79D9: db $18 ; play note C4
#_0CAA1D: #_GAMEOVER_79DA: db $31 ; tie
#_0CAA1E: #_GAMEOVER_79DB: db $31 ; tie
#_0CAA1F: #_GAMEOVER_79DC: db $88 ; dur 0x08
#_0CAA20: #_GAMEOVER_79DD: db $31 ; tie
#_0CAA21: #_GAMEOVER_79DE: db $1E ; play note Fs4
#_0CAA22: #_GAMEOVER_79DF: db $FC ; fade out
#_0CAA23: #_GAMEOVER_79E0: db $1F ; play note G4
#_0CAA24: #_GAMEOVER_79E1: db $1E ; play note Fs4
#_0CAA25: #_GAMEOVER_79E2: db $FD ; disable fade
#_0CAA26: #_GAMEOVER_79E3: db $8C ; dur 0x0C
#_0CAA27: #_GAMEOVER_79E4: db $1A ; play note D4
#_0CAA28: #_GAMEOVER_79E5: db $31 ; tie
#_0CAA29: #_GAMEOVER_79E6: db $31 ; tie
#_0CAA2A: #_GAMEOVER_79E7: db $31 ; tie
#_0CAA2B: #_GAMEOVER_79E8: db $8C ; dur 0x0C
#_0CAA2C: #_GAMEOVER_79E9: db $1E ; play note Fs4
#_0CAA2D: #_GAMEOVER_79EA: db $31 ; tie
#_0CAA2E: #_GAMEOVER_79EB: db $88 ; dur 0x08
#_0CAA2F: #_GAMEOVER_79EC: db $31 ; tie
#_0CAA30: #_GAMEOVER_79ED: db $1A ; play note D4
#_0CAA31: #_GAMEOVER_79EE: db $1E ; play note Fs4
#_0CAA32: #_GAMEOVER_79EF: db $1F ; play note G4
#_0CAA33: #_GAMEOVER_79F0: db $21 ; play note A4
#_0CAA34: #_GAMEOVER_79F1: db $1F ; play note G4
#_0CAA35: #_GAMEOVER_79F2: db $1E ; play note Fs4
#_0CAA36: #_GAMEOVER_79F3: db $1A ; play note D4
#_0CAA37: #_GAMEOVER_79F4: db $F8 : dw GAMEOVER_SEGMENT_79AD ; goto location
#_0CAA3A: #_GAMEOVER_79F7: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Terminal_SPC_Data:
#_0CAA3B: dw $0076, $0000

SONG_TERMINAL:
#_0CAA3F: #_TERMINAL_7800: db $F1, $00 ; Set control
#_0CAA41: #_TERMINAL_7802: db $00 : dw TERMINAL_SEGMENT_781B ; Music channel 0
#_0CAA44: #_TERMINAL_7805: db $01 : dw TERMINAL_SEGMENT_7821 ; Music channel 1
#_0CAA47: #_TERMINAL_7808: db $02 : dw TERMINAL_SEGMENT_7838 ; Music channel 2
#_0CAA4A: #_TERMINAL_780B: db $03 : dw TERMINAL_SEGMENT_784D ; Music channel 3
#_0CAA4D: #_TERMINAL_780E: db $04 : dw TERMINAL_SEGMENT_784E ; Music channel 4
#_0CAA50: #_TERMINAL_7811: db $05 : dw TERMINAL_SEGMENT_785B ; Music channel 5
#_0CAA53: #_TERMINAL_7814: db $06 : dw TERMINAL_SEGMENT_785C ; Music channel 6
#_0CAA56: #_TERMINAL_7817: db $07 : dw TERMINAL_SEGMENT_786F ; Music channel 7
#_0CAA59: #_TERMINAL_781A: db $FF ; end of header

TERMINAL_SEGMENT_781B:
#_0CAA5A: #_TERMINAL_781B: db $64 ; vol 0x04
#_0CAA5B: #_TERMINAL_781C: db $F9, $20 ; set fine tuning
#_0CAA5D: #_TERMINAL_781E: db $F8 : dw TERMINAL_SEGMENT_7822 ; goto location

TERMINAL_SEGMENT_7821:
#_0CAA60: #_TERMINAL_7821: db $74 ; vol 0x14

TERMINAL_SEGMENT_7822:
#_0CAA61: #_TERMINAL_7822: db $F1, $04 ; set SRCN
#_0CAA63: #_TERMINAL_7824: db $F2, $60 ; set panning
#_0CAA65: #_TERMINAL_7826: db $F0, $80, $E0 ; set ADSR
#_0CAA68: #_TERMINAL_7829: db $8E ; dur 0x0E
#_0CAA69: #_TERMINAL_782A: db $21 ; play note A4
#_0CAA6A: #_TERMINAL_782B: db $31 ; tie
#_0CAA6B: #_TERMINAL_782C: db $8A ; dur 0x0A
#_0CAA6C: #_TERMINAL_782D: db $30 ; rest
#_0CAA6D: #_TERMINAL_782E: db $F0, $FE, $E8 ; set ADSR
#_0CAA70: #_TERMINAL_7831: db $8E ; dur 0x0E

TERMINAL_SEGMENT_7832:
#_0CAA71: #_TERMINAL_7832: db $21 ; play note A4
#_0CAA72: #_TERMINAL_7833: db $31 ; tie
#_0CAA73: #_TERMINAL_7834: db $F8 : dw TERMINAL_SEGMENT_7832 ; goto location
#_0CAA76: #_TERMINAL_7837: db $FF ; end track

TERMINAL_SEGMENT_7838:
#_0CAA77: #_TERMINAL_7838: db $F0, $FE, $F0 ; set ADSR
#_0CAA7A: #_TERMINAL_783B: db $F2, $60 ; set panning

TERMINAL_SEGMENT_783D:
#_0CAA7C: #_TERMINAL_783D: db $8E ; dur 0x0E
#_0CAA7D: #_TERMINAL_783E: db $30 ; rest
#_0CAA7E: #_TERMINAL_783F: db $30 ; rest
#_0CAA7F: #_TERMINAL_7840: db $8A ; dur 0x0A
#_0CAA80: #_TERMINAL_7841: db $30 ; rest
#_0CAA81: #_TERMINAL_7842: db $F1, $03 ; set SRCN
#_0CAA83: #_TERMINAL_7844: db $8A ; dur 0x0A

TERMINAL_SEGMENT_7845:
#_0CAA84: #_TERMINAL_7845: db $18 ; play note C4
#_0CAA85: #_TERMINAL_7846: db $13 ; play note G3
#_0CAA86: #_TERMINAL_7847: db $17 ; play note B3
#_0CAA87: #_TERMINAL_7848: db $11 ; play note F3
#_0CAA88: #_TERMINAL_7849: db $F8 : dw TERMINAL_SEGMENT_7845 ; goto location
#_0CAA8B: #_TERMINAL_784C: db $FF ; end track

TERMINAL_SEGMENT_784D:
#_0CAA8C: #_TERMINAL_784D: db $FF ; end track

TERMINAL_SEGMENT_784E:
#_0CAA8D: #_TERMINAL_784E: db $89 ; dur 0x09
#_0CAA8E: #_TERMINAL_784F: db $30 ; rest
#_0CAA8F: #_TERMINAL_7850: db $F0, $FE, $F0 ; set ADSR
#_0CAA92: #_TERMINAL_7853: db $F2, $70 ; set panning
#_0CAA94: #_TERMINAL_7855: db $F9, $20 ; set fine tuning
#_0CAA96: #_TERMINAL_7857: db $F8 : dw TERMINAL_SEGMENT_783D ; goto location
#_0CAA99: #_TERMINAL_785A: db $FF ; end track

TERMINAL_SEGMENT_785B:
#_0CAA9A: #_TERMINAL_785B: db $FF ; end track

TERMINAL_SEGMENT_785C:
#_0CAA9B: #_TERMINAL_785C: db $8E ; dur 0x0E
#_0CAA9C: #_TERMINAL_785D: db $30 ; rest
#_0CAA9D: #_TERMINAL_785E: db $30 ; rest
#_0CAA9E: #_TERMINAL_785F: db $8A ; dur 0x0A
#_0CAA9F: #_TERMINAL_7860: db $30 ; rest
#_0CAAA0: #_TERMINAL_7861: db $70 ; vol 0x10
#_0CAAA1: #_TERMINAL_7862: db $F0, $FE, $E8 ; set ADSR
#_0CAAA4: #_TERMINAL_7865: db $F1, $02 ; set SRCN
#_0CAAA6: #_TERMINAL_7867: db $F2, $4C ; set panning
#_0CAAA8: #_TERMINAL_7869: db $8E ; dur 0x0E

TERMINAL_SEGMENT_786A:
#_0CAAA9: #_TERMINAL_786A: db $1A ; play note D4
#_0CAAAA: #_TERMINAL_786B: db $31 ; tie
#_0CAAAB: #_TERMINAL_786C: db $F8 : dw TERMINAL_SEGMENT_786A ; goto location

TERMINAL_SEGMENT_786F:
#_0CAAAE: #_TERMINAL_786F: db $70 ; vol 0x10
#_0CAAAF: #_TERMINAL_7870: db $F0, $FF, $E0 ; set ADSR
#_0CAAB2: #_TERMINAL_7873: db $F2, $44 ; set panning
#_0CAAB4: #_TERMINAL_7875: db $FF ; end track

;===================================================================================================
; 
;===================================================================================================
Ending_SPC_Data:
#_0CAAB5: dw $469E, $0000

SONG_ENDING:
#_0CAAB9: #_ENDING_7000: db $F1, $20 ; Set control
#_0CAABB: #_ENDING_7002: db $00 : dw ENDING_SEGMENT_701B ; Music channel 0
#_0CAABE: #_ENDING_7005: db $01 : dw ENDING_SEGMENT_7067 ; Music channel 1
#_0CAAC1: #_ENDING_7008: db $02 : dw ENDING_SEGMENT_72B9 ; Music channel 2
#_0CAAC4: #_ENDING_700B: db $03 : dw ENDING_SEGMENT_735E ; Music channel 3
#_0CAAC7: #_ENDING_700E: db $04 : dw ENDING_SEGMENT_7401 ; Music channel 4
#_0CAACA: #_ENDING_7011: db $05 : dw ENDING_SEGMENT_74C2 ; Music channel 5
#_0CAACD: #_ENDING_7014: db $06 : dw ENDING_SEGMENT_7586 ; Music channel 6
#_0CAAD0: #_ENDING_7017: db $07 : dw ENDING_SEGMENT_7600 ; Music channel 7
#_0CAAD3: #_ENDING_701A: db $FF ; end of header

ENDING_SEGMENT_701B:
#_0CAAD4: #_ENDING_701B: db $63 ; vol 0x03
#_0CAAD5: #_ENDING_701C: db $F0, $F1, $EC ; set ADSR
#_0CAAD8: #_ENDING_701F: db $F1, $0B ; set SRCN
#_0CAADA: #_ENDING_7021: db $F2, $60 ; set panning
#_0CAADC: #_ENDING_7023: db $F9, $30 ; set fine tuning
#_0CAADE: #_ENDING_7025: db $8E ; dur 0x0E
#_0CAADF: #_ENDING_7026: db $30 ; rest
#_0CAAE0: #_ENDING_7027: db $30 ; rest
#_0CAAE1: #_ENDING_7028: db $30 ; rest
#_0CAAE2: #_ENDING_7029: db $30 ; rest
#_0CAAE3: #_ENDING_702A: db $30 ; rest
#_0CAAE4: #_ENDING_702B: db $30 ; rest
#_0CAAE5: #_ENDING_702C: db $30 ; rest
#_0CAAE6: #_ENDING_702D: db $20 ; play note Gs4
#_0CAAE7: #_ENDING_702E: db $31 ; tie
#_0CAAE8: #_ENDING_702F: db $87 ; dur 0x07
#_0CAAE9: #_ENDING_7030: db $30 ; rest
#_0CAAEA: #_ENDING_7031: db $F0, $F9, $E8 ; set ADSR
#_0CAAED: #_ENDING_7034: db $F2, $6E ; set panning
#_0CAAEF: #_ENDING_7036: db $F9, $20 ; set fine tuning
#_0CAAF1: #_ENDING_7038: db $F6 : dw ENDING_SEGMENT_70A8 ; subroutine B
#_0CAAF4: #_ENDING_703B: db $F0, $FA, $EE ; set ADSR
#_0CAAF7: #_ENDING_703E: db $F6 : dw ENDING_SEGMENT_715F ; subroutine B
#_0CAAFA: #_ENDING_7041: db $F0, $FA, $E6 ; set ADSR
#_0CAAFD: #_ENDING_7044: db $F2, $70 ; set panning
#_0CAAFF: #_ENDING_7046: db $F9, $30 ; set fine tuning
#_0CAB01: #_ENDING_7048: db $F6 : dw ENDING_SEGMENT_71B6 ; subroutine B

ENDING_SEGMENT_704B:
#_0CAB04: #_ENDING_704B: db $F0, $F9, $E8 ; set ADSR
#_0CAB07: #_ENDING_704E: db $F2, $6E ; set panning
#_0CAB09: #_ENDING_7050: db $F6 : dw ENDING_SEGMENT_720C ; subroutine B
#_0CAB0C: #_ENDING_7053: db $F0, $FA, $EE ; set ADSR
#_0CAB0F: #_ENDING_7056: db $F6 : dw ENDING_SEGMENT_725C ; subroutine B
#_0CAB12: #_ENDING_7059: db $EC, $0A, $01 ; master volume fade
#_0CAB15: #_ENDING_705C: db $F0, $FA, $E6 ; set ADSR
#_0CAB18: #_ENDING_705F: db $F2, $70 ; set panning
#_0CAB1A: #_ENDING_7061: db $F6 : dw ENDING_SEGMENT_71C3 ; subroutine B
#_0CAB1D: #_ENDING_7064: db $F8 : dw ENDING_SEGMENT_704B ; goto location

ENDING_SEGMENT_7067:
#_0CAB20: #_ENDING_7067: db $73 ; vol 0x13
#_0CAB21: #_ENDING_7068: db $F0, $F1, $EC ; set ADSR
#_0CAB24: #_ENDING_706B: db $F1, $0B ; set SRCN
#_0CAB26: #_ENDING_706D: db $F2, $60 ; set panning
#_0CAB28: #_ENDING_706F: db $8E ; dur 0x0E
#_0CAB29: #_ENDING_7070: db $30 ; rest
#_0CAB2A: #_ENDING_7071: db $30 ; rest
#_0CAB2B: #_ENDING_7072: db $30 ; rest
#_0CAB2C: #_ENDING_7073: db $30 ; rest
#_0CAB2D: #_ENDING_7074: db $30 ; rest
#_0CAB2E: #_ENDING_7075: db $30 ; rest
#_0CAB2F: #_ENDING_7076: db $30 ; rest
#_0CAB30: #_ENDING_7077: db $20 ; play note Gs4
#_0CAB31: #_ENDING_7078: db $31 ; tie
#_0CAB32: #_ENDING_7079: db $F0, $FF, $E8 ; set ADSR
#_0CAB35: #_ENDING_707C: db $F2, $64 ; set panning
#_0CAB37: #_ENDING_707E: db $F6 : dw ENDING_SEGMENT_70A8 ; subroutine B
#_0CAB3A: #_ENDING_7081: db $F0, $FE, $EE ; set ADSR
#_0CAB3D: #_ENDING_7084: db $F6 : dw ENDING_SEGMENT_715F ; subroutine B
#_0CAB40: #_ENDING_7087: db $F0, $FE, $E6 ; set ADSR
#_0CAB43: #_ENDING_708A: db $F2, $66 ; set panning
#_0CAB45: #_ENDING_708C: db $F6 : dw ENDING_SEGMENT_71B6 ; subroutine B

ENDING_SEGMENT_708F:
#_0CAB48: #_ENDING_708F: db $F0, $FF, $E8 ; set ADSR
#_0CAB4B: #_ENDING_7092: db $F2, $64 ; set panning
#_0CAB4D: #_ENDING_7094: db $F6 : dw ENDING_SEGMENT_720C ; subroutine B
#_0CAB50: #_ENDING_7097: db $F0, $FE, $EE ; set ADSR
#_0CAB53: #_ENDING_709A: db $F6 : dw ENDING_SEGMENT_725C ; subroutine B
#_0CAB56: #_ENDING_709D: db $F0, $FE, $E6 ; set ADSR
#_0CAB59: #_ENDING_70A0: db $F2, $66 ; set panning
#_0CAB5B: #_ENDING_70A2: db $F6 : dw ENDING_SEGMENT_71C3 ; subroutine B
#_0CAB5E: #_ENDING_70A5: db $F8 : dw ENDING_SEGMENT_708F ; goto location

ENDING_SEGMENT_70A8:
#_0CAB61: #_ENDING_70A8: db $70 ; vol 0x10
#_0CAB62: #_ENDING_70A9: db $F1, $0C ; set SRCN
#_0CAB64: #_ENDING_70AB: db $8E ; dur 0x0E
#_0CAB65: #_ENDING_70AC: db $1C ; play note E4
#_0CAB66: #_ENDING_70AD: db $8D ; dur 0x0D
#_0CAB67: #_ENDING_70AE: db $18 ; play note C4
#_0CAB68: #_ENDING_70AF: db $88 ; dur 0x08
#_0CAB69: #_ENDING_70B0: db $1A ; play note D4
#_0CAB6A: #_ENDING_70B1: db $1C ; play note E4
#_0CAB6B: #_ENDING_70B2: db $8E ; dur 0x0E
#_0CAB6C: #_ENDING_70B3: db $1D ; play note F4
#_0CAB6D: #_ENDING_70B4: db $8C ; dur 0x0C
#_0CAB6E: #_ENDING_70B5: db $18 ; play note C4
#_0CAB6F: #_ENDING_70B6: db $1A ; play note D4
#_0CAB70: #_ENDING_70B7: db $8A ; dur 0x0A
#_0CAB71: #_ENDING_70B8: db $1C ; play note E4
#_0CAB72: #_ENDING_70B9: db $18 ; play note C4
#_0CAB73: #_ENDING_70BA: db $8C ; dur 0x0C
#_0CAB74: #_ENDING_70BB: db $1F ; play note G4
#_0CAB75: #_ENDING_70BC: db $8D ; dur 0x0D
#_0CAB76: #_ENDING_70BD: db $31 ; tie
#_0CAB77: #_ENDING_70BE: db $88 ; dur 0x08
#_0CAB78: #_ENDING_70BF: db $1D ; play note F4
#_0CAB79: #_ENDING_70C0: db $1C ; play note E4
#_0CAB7A: #_ENDING_70C1: db $8E ; dur 0x0E
#_0CAB7B: #_ENDING_70C2: db $18 ; play note C4
#_0CAB7C: #_ENDING_70C3: db $31 ; tie
#_0CAB7D: #_ENDING_70C4: db $89 ; dur 0x09
#_0CAB7E: #_ENDING_70C5: db $1C ; play note E4
#_0CAB7F: #_ENDING_70C6: db $1D ; play note F4
#_0CAB80: #_ENDING_70C7: db $88 ; dur 0x08
#_0CAB81: #_ENDING_70C8: db $1F ; play note G4
#_0CAB82: #_ENDING_70C9: db $8C ; dur 0x0C
#_0CAB83: #_ENDING_70CA: db $18 ; play note C4
#_0CAB84: #_ENDING_70CB: db $89 ; dur 0x09
#_0CAB85: #_ENDING_70CC: db $1C ; play note E4
#_0CAB86: #_ENDING_70CD: db $1D ; play note F4
#_0CAB87: #_ENDING_70CE: db $88 ; dur 0x08
#_0CAB88: #_ENDING_70CF: db $1F ; play note G4
#_0CAB89: #_ENDING_70D0: db $89 ; dur 0x09
#_0CAB8A: #_ENDING_70D1: db $21 ; play note A4
#_0CAB8B: #_ENDING_70D2: db $1F ; play note G4
#_0CAB8C: #_ENDING_70D3: db $88 ; dur 0x08
#_0CAB8D: #_ENDING_70D4: db $1C ; play note E4
#_0CAB8E: #_ENDING_70D5: db $1D ; play note F4
#_0CAB8F: #_ENDING_70D6: db $31 ; tie
#_0CAB90: #_ENDING_70D7: db $1C ; play note E4
#_0CAB91: #_ENDING_70D8: db $18 ; play note C4
#_0CAB92: #_ENDING_70D9: db $8C ; dur 0x0C
#_0CAB93: #_ENDING_70DA: db $31 ; tie
#_0CAB94: #_ENDING_70DB: db $88 ; dur 0x08
#_0CAB95: #_ENDING_70DC: db $31 ; tie
#_0CAB96: #_ENDING_70DD: db $14 ; play note Gs3
#_0CAB97: #_ENDING_70DE: db $18 ; play note C4
#_0CAB98: #_ENDING_70DF: db $1D ; play note F4
#_0CAB99: #_ENDING_70E0: db $8A ; dur 0x0A
#_0CAB9A: #_ENDING_70E1: db $1F ; play note G4
#_0CAB9B: #_ENDING_70E2: db $1D ; play note F4
#_0CAB9C: #_ENDING_70E3: db $8D ; dur 0x0D
#_0CAB9D: #_ENDING_70E4: db $1C ; play note E4
#_0CAB9E: #_ENDING_70E5: db $88 ; dur 0x08
#_0CAB9F: #_ENDING_70E6: db $1A ; play note D4
#_0CABA0: #_ENDING_70E7: db $1C ; play note E4
#_0CABA1: #_ENDING_70E8: db $1D ; play note F4
#_0CABA2: #_ENDING_70E9: db $8A ; dur 0x0A
#_0CABA3: #_ENDING_70EA: db $1C ; play note E4
#_0CABA4: #_ENDING_70EB: db $8B ; dur 0x0B
#_0CABA5: #_ENDING_70EC: db $18 ; play note C4
#_0CABA6: #_ENDING_70ED: db $8A ; dur 0x0A
#_0CABA7: #_ENDING_70EE: db $15 ; play note A3
#_0CABA8: #_ENDING_70EF: db $8B ; dur 0x0B
#_0CABA9: #_ENDING_70F0: db $1F ; play note G4
#_0CABAA: #_ENDING_70F1: db $1C ; play note E4
#_0CABAB: #_ENDING_70F2: db $88 ; dur 0x08
#_0CABAC: #_ENDING_70F3: db $1A ; play note D4
#_0CABAD: #_ENDING_70F4: db $1C ; play note E4
#_0CABAE: #_ENDING_70F5: db $1D ; play note F4
#_0CABAF: #_ENDING_70F6: db $8A ; dur 0x0A
#_0CABB0: #_ENDING_70F7: db $1F ; play note G4
#_0CABB1: #_ENDING_70F8: db $1C ; play note E4
#_0CABB2: #_ENDING_70F9: db $88 ; dur 0x08
#_0CABB3: #_ENDING_70FA: db $18 ; play note C4
#_0CABB4: #_ENDING_70FB: db $8A ; dur 0x0A
#_0CABB5: #_ENDING_70FC: db $1A ; play note D4
#_0CABB6: #_ENDING_70FD: db $89 ; dur 0x09
#_0CABB7: #_ENDING_70FE: db $1C ; play note E4
#_0CABB8: #_ENDING_70FF: db $1D ; play note F4
#_0CABB9: #_ENDING_7100: db $88 ; dur 0x08
#_0CABBA: #_ENDING_7101: db $1F ; play note G4
#_0CABBB: #_ENDING_7102: db $8C ; dur 0x0C
#_0CABBC: #_ENDING_7103: db $24 ; play note C5
#_0CABBD: #_ENDING_7104: db $8E ; dur 0x0E
#_0CABBE: #_ENDING_7105: db $31 ; tie
#_0CABBF: #_ENDING_7106: db $89 ; dur 0x09
#_0CABC0: #_ENDING_7107: db $1C ; play note E4
#_0CABC1: #_ENDING_7108: db $1D ; play note F4
#_0CABC2: #_ENDING_7109: db $88 ; dur 0x08
#_0CABC3: #_ENDING_710A: db $1F ; play note G4
#_0CABC4: #_ENDING_710B: db $89 ; dur 0x09
#_0CABC5: #_ENDING_710C: db $24 ; play note C5
#_0CABC6: #_ENDING_710D: db $26 ; play note D5
#_0CABC7: #_ENDING_710E: db $88 ; dur 0x08
#_0CABC8: #_ENDING_710F: db $24 ; play note C5
#_0CABC9: #_ENDING_7110: db $8E ; dur 0x0E
#_0CABCA: #_ENDING_7111: db $31 ; tie
#_0CABCB: #_ENDING_7112: db $89 ; dur 0x09
#_0CABCC: #_ENDING_7113: db $1C ; play note E4
#_0CABCD: #_ENDING_7114: db $1D ; play note F4
#_0CABCE: #_ENDING_7115: db $88 ; dur 0x08
#_0CABCF: #_ENDING_7116: db $1F ; play note G4
#_0CABD0: #_ENDING_7117: db $8A ; dur 0x0A
#_0CABD1: #_ENDING_7118: db $18 ; play note C4
#_0CABD2: #_ENDING_7119: db $1A ; play note D4
#_0CABD3: #_ENDING_711A: db $89 ; dur 0x09
#_0CABD4: #_ENDING_711B: db $1D ; play note F4
#_0CABD5: #_ENDING_711C: db $1C ; play note E4
#_0CABD6: #_ENDING_711D: db $88 ; dur 0x08
#_0CABD7: #_ENDING_711E: db $18 ; play note C4
#_0CABD8: #_ENDING_711F: db $8C ; dur 0x0C
#_0CABD9: #_ENDING_7120: db $1F ; play note G4
#_0CABDA: #_ENDING_7121: db $31 ; tie
#_0CABDB: #_ENDING_7122: db $8A ; dur 0x0A
#_0CABDC: #_ENDING_7123: db $1D ; play note F4
#_0CABDD: #_ENDING_7124: db $1C ; play note E4
#_0CABDE: #_ENDING_7125: db $8E ; dur 0x0E
#_0CABDF: #_ENDING_7126: db $18 ; play note C4
#_0CABE0: #_ENDING_7127: db $F3, $0C ; transpose +12
#_0CABE2: #_ENDING_7129: db $8A ; dur 0x0A
#_0CABE3: #_ENDING_712A: db $30 ; rest
#_0CABE4: #_ENDING_712B: db $18 ; play note C4
#_0CABE5: #_ENDING_712C: db $15 ; play note A3
#_0CABE6: #_ENDING_712D: db $18 ; play note C4
#_0CABE7: #_ENDING_712E: db $89 ; dur 0x09
#_0CABE8: #_ENDING_712F: db $17 ; play note B3
#_0CABE9: #_ENDING_7130: db $86 ; dur 0x06
#_0CABEA: #_ENDING_7131: db $13 ; play note G3
#_0CABEB: #_ENDING_7132: db $8C ; dur 0x0C
#_0CABEC: #_ENDING_7133: db $31 ; tie
#_0CABED: #_ENDING_7134: db $88 ; dur 0x08
#_0CABEE: #_ENDING_7135: db $11 ; play note F3
#_0CABEF: #_ENDING_7136: db $13 ; play note G3
#_0CABF0: #_ENDING_7137: db $8A ; dur 0x0A
#_0CABF1: #_ENDING_7138: db $15 ; play note A3
#_0CABF2: #_ENDING_7139: db $88 ; dur 0x08
#_0CABF3: #_ENDING_713A: db $18 ; play note C4
#_0CABF4: #_ENDING_713B: db $8A ; dur 0x0A
#_0CABF5: #_ENDING_713C: db $17 ; play note B3
#_0CABF6: #_ENDING_713D: db $88 ; dur 0x08
#_0CABF7: #_ENDING_713E: db $13 ; play note G3
#_0CABF8: #_ENDING_713F: db $15 ; play note A3
#_0CABF9: #_ENDING_7140: db $10 ; play note E3
#_0CABFA: #_ENDING_7141: db $8E ; dur 0x0E
#_0CABFB: #_ENDING_7142: db $31 ; tie
#_0CABFC: #_ENDING_7143: db $8A ; dur 0x0A
#_0CABFD: #_ENDING_7144: db $30 ; rest
#_0CABFE: #_ENDING_7145: db $1C ; play note E4
#_0CABFF: #_ENDING_7146: db $18 ; play note C4
#_0CAC00: #_ENDING_7147: db $1C ; play note E4
#_0CAC01: #_ENDING_7148: db $89 ; dur 0x09
#_0CAC02: #_ENDING_7149: db $1A ; play note D4
#_0CAC03: #_ENDING_714A: db $86 ; dur 0x06
#_0CAC04: #_ENDING_714B: db $17 ; play note B3
#_0CAC05: #_ENDING_714C: db $8C ; dur 0x0C
#_0CAC06: #_ENDING_714D: db $31 ; tie
#_0CAC07: #_ENDING_714E: db $88 ; dur 0x08
#_0CAC08: #_ENDING_714F: db $15 ; play note A3
#_0CAC09: #_ENDING_7150: db $17 ; play note B3
#_0CAC0A: #_ENDING_7151: db $8A ; dur 0x0A
#_0CAC0B: #_ENDING_7152: db $18 ; play note C4
#_0CAC0C: #_ENDING_7153: db $88 ; dur 0x08
#_0CAC0D: #_ENDING_7154: db $1C ; play note E4
#_0CAC0E: #_ENDING_7155: db $8A ; dur 0x0A
#_0CAC0F: #_ENDING_7156: db $1A ; play note D4
#_0CAC10: #_ENDING_7157: db $88 ; dur 0x08
#_0CAC11: #_ENDING_7158: db $17 ; play note B3
#_0CAC12: #_ENDING_7159: db $18 ; play note C4
#_0CAC13: #_ENDING_715A: db $17 ; play note B3
#_0CAC14: #_ENDING_715B: db $8C ; dur 0x0C
#_0CAC15: #_ENDING_715C: db $1A ; play note D4
#_0CAC16: #_ENDING_715D: db $13 ; play note G3
#_0CAC17: #_ENDING_715E: db $F7 ; return from routine B

ENDING_SEGMENT_715F:
#_0CAC18: #_ENDING_715F: db $F1, $09 ; set SRCN
#_0CAC1A: #_ENDING_7161: db $F3, $01 ; transpose +1
#_0CAC1C: #_ENDING_7163: db $88 ; dur 0x08
#_0CAC1D: #_ENDING_7164: db $1C ; play note E4
#_0CAC1E: #_ENDING_7165: db $18 ; play note C4
#_0CAC1F: #_ENDING_7166: db $8C ; dur 0x0C
#_0CAC20: #_ENDING_7167: db $1F ; play note G4
#_0CAC21: #_ENDING_7168: db $88 ; dur 0x08
#_0CAC22: #_ENDING_7169: db $31 ; tie
#_0CAC23: #_ENDING_716A: db $86 ; dur 0x06
#_0CAC24: #_ENDING_716B: db $1D ; play note F4
#_0CAC25: #_ENDING_716C: db $1C ; play note E4
#_0CAC26: #_ENDING_716D: db $8C ; dur 0x0C
#_0CAC27: #_ENDING_716E: db $17 ; play note B3
#_0CAC28: #_ENDING_716F: db $86 ; dur 0x06
#_0CAC29: #_ENDING_7170: db $31 ; tie
#_0CAC2A: #_ENDING_7171: db $13 ; play note G3
#_0CAC2B: #_ENDING_7172: db $15 ; play note A3
#_0CAC2C: #_ENDING_7173: db $17 ; play note B3
#_0CAC2D: #_ENDING_7174: db $18 ; play note C4
#_0CAC2E: #_ENDING_7175: db $17 ; play note B3
#_0CAC2F: #_ENDING_7176: db $18 ; play note C4
#_0CAC30: #_ENDING_7177: db $1A ; play note D4
#_0CAC31: #_ENDING_7178: db $86 ; dur 0x06
#_0CAC32: #_ENDING_7179: db $18 ; play note C4
#_0CAC33: #_ENDING_717A: db $17 ; play note B3
#_0CAC34: #_ENDING_717B: db $18 ; play note C4
#_0CAC35: #_ENDING_717C: db $1A ; play note D4
#_0CAC36: #_ENDING_717D: db $31 ; tie
#_0CAC37: #_ENDING_717E: db $31 ; tie
#_0CAC38: #_ENDING_717F: db $18 ; play note C4
#_0CAC39: #_ENDING_7180: db $17 ; play note B3
#_0CAC3A: #_ENDING_7181: db $18 ; play note C4
#_0CAC3B: #_ENDING_7182: db $1A ; play note D4
#_0CAC3C: #_ENDING_7183: db $31 ; tie
#_0CAC3D: #_ENDING_7184: db $31 ; tie
#_0CAC3E: #_ENDING_7185: db $18 ; play note C4
#_0CAC3F: #_ENDING_7186: db $17 ; play note B3
#_0CAC40: #_ENDING_7187: db $18 ; play note C4
#_0CAC41: #_ENDING_7188: db $1A ; play note D4
#_0CAC42: #_ENDING_7189: db $18 ; play note C4
#_0CAC43: #_ENDING_718A: db $17 ; play note B3
#_0CAC44: #_ENDING_718B: db $15 ; play note A3
#_0CAC45: #_ENDING_718C: db $31 ; tie
#_0CAC46: #_ENDING_718D: db $8D ; dur 0x0D
#_0CAC47: #_ENDING_718E: db $31 ; tie
#_0CAC48: #_ENDING_718F: db $86 ; dur 0x06
#_0CAC49: #_ENDING_7190: db $11 ; play note F3
#_0CAC4A: #_ENDING_7191: db $13 ; play note G3
#_0CAC4B: #_ENDING_7192: db $15 ; play note A3
#_0CAC4C: #_ENDING_7193: db $17 ; play note B3
#_0CAC4D: #_ENDING_7194: db $15 ; play note A3
#_0CAC4E: #_ENDING_7195: db $17 ; play note B3
#_0CAC4F: #_ENDING_7196: db $18 ; play note C4
#_0CAC50: #_ENDING_7197: db $1A ; play note D4
#_0CAC51: #_ENDING_7198: db $8C ; dur 0x0C
#_0CAC52: #_ENDING_7199: db $1C ; play note E4
#_0CAC53: #_ENDING_719A: db $8B ; dur 0x0B
#_0CAC54: #_ENDING_719B: db $1A ; play note D4
#_0CAC55: #_ENDING_719C: db $86 ; dur 0x06
#_0CAC56: #_ENDING_719D: db $31 ; tie
#_0CAC57: #_ENDING_719E: db $1F ; play note G4
#_0CAC58: #_ENDING_719F: db $8C ; dur 0x0C
#_0CAC59: #_ENDING_71A0: db $1F ; play note G4
#_0CAC5A: #_ENDING_71A1: db $86 ; dur 0x06
#_0CAC5B: #_ENDING_71A2: db $11 ; play note F3
#_0CAC5C: #_ENDING_71A3: db $10 ; play note E3
#_0CAC5D: #_ENDING_71A4: db $11 ; play note F3
#_0CAC5E: #_ENDING_71A5: db $13 ; play note G3
#_0CAC5F: #_ENDING_71A6: db $15 ; play note A3
#_0CAC60: #_ENDING_71A7: db $13 ; play note G3
#_0CAC61: #_ENDING_71A8: db $11 ; play note F3
#_0CAC62: #_ENDING_71A9: db $13 ; play note G3
#_0CAC63: #_ENDING_71AA: db $15 ; play note A3
#_0CAC64: #_ENDING_71AB: db $17 ; play note B3
#_0CAC65: #_ENDING_71AC: db $18 ; play note C4
#_0CAC66: #_ENDING_71AD: db $17 ; play note B3
#_0CAC67: #_ENDING_71AE: db $1A ; play note D4
#_0CAC68: #_ENDING_71AF: db $18 ; play note C4
#_0CAC69: #_ENDING_71B0: db $1C ; play note E4
#_0CAC6A: #_ENDING_71B1: db $1A ; play note D4
#_0CAC6B: #_ENDING_71B2: db $8A ; dur 0x0A
#_0CAC6C: #_ENDING_71B3: db $17 ; play note B3
#_0CAC6D: #_ENDING_71B4: db $1A ; play note D4
#_0CAC6E: #_ENDING_71B5: db $F7 ; return from routine B

ENDING_SEGMENT_71B6:
#_0CAC6F: #_ENDING_71B6: db $F3, $0C ; transpose +12
#_0CAC71: #_ENDING_71B8: db $F1, $06 ; set SRCN
#_0CAC73: #_ENDING_71BA: db $86 ; dur 0x06
#_0CAC74: #_ENDING_71BB: db $30 ; rest
#_0CAC75: #_ENDING_71BC: db $10 ; play note E3
#_0CAC76: #_ENDING_71BD: db $11 ; play note F3
#_0CAC77: #_ENDING_71BE: db $13 ; play note G3
#_0CAC78: #_ENDING_71BF: db $15 ; play note A3
#_0CAC79: #_ENDING_71C0: db $17 ; play note B3
#_0CAC7A: #_ENDING_71C1: db $18 ; play note C4
#_0CAC7B: #_ENDING_71C2: db $0E ; play note D3

ENDING_SEGMENT_71C3:
#_0CAC7C: #_ENDING_71C3: db $F3, $0C ; transpose +12
#_0CAC7E: #_ENDING_71C5: db $F1, $06 ; set SRCN
#_0CAC80: #_ENDING_71C7: db $8D ; dur 0x0D
#_0CAC81: #_ENDING_71C8: db $1C ; play note E4
#_0CAC82: #_ENDING_71C9: db $E3, $F0 ; pitch bend on
#_0CAC84: #_ENDING_71CB: db $8A ; dur 0x0A
#_0CAC85: #_ENDING_71CC: db $31 ; tie
#_0CAC86: #_ENDING_71CD: db $E2 ; pitch bend off
#_0CAC87: #_ENDING_71CE: db $8A ; dur 0x0A
#_0CAC88: #_ENDING_71CF: db $1D ; play note F4
#_0CAC89: #_ENDING_71D0: db $E3, $E0 ; pitch bend on
#_0CAC8B: #_ENDING_71D2: db $88 ; dur 0x08
#_0CAC8C: #_ENDING_71D3: db $31 ; tie
#_0CAC8D: #_ENDING_71D4: db $E2 ; pitch bend off
#_0CAC8E: #_ENDING_71D5: db $8A ; dur 0x0A
#_0CAC8F: #_ENDING_71D6: db $1D ; play note F4
#_0CAC90: #_ENDING_71D7: db $E3, $E0 ; pitch bend on
#_0CAC92: #_ENDING_71D9: db $88 ; dur 0x08
#_0CAC93: #_ENDING_71DA: db $31 ; tie
#_0CAC94: #_ENDING_71DB: db $E2 ; pitch bend off
#_0CAC95: #_ENDING_71DC: db $88 ; dur 0x08
#_0CAC96: #_ENDING_71DD: db $1D ; play note F4
#_0CAC97: #_ENDING_71DE: db $E3, $E0 ; pitch bend on
#_0CAC99: #_ENDING_71E0: db $88 ; dur 0x08
#_0CAC9A: #_ENDING_71E1: db $31 ; tie
#_0CAC9B: #_ENDING_71E2: db $E2 ; pitch bend off
#_0CAC9C: #_ENDING_71E3: db $8E ; dur 0x0E
#_0CAC9D: #_ENDING_71E4: db $18 ; play note C4
#_0CAC9E: #_ENDING_71E5: db $8C ; dur 0x0C
#_0CAC9F: #_ENDING_71E6: db $14 ; play note Gs3
#_0CACA0: #_ENDING_71E7: db $E3, $E0 ; pitch bend on
#_0CACA2: #_ENDING_71E9: db $31 ; tie
#_0CACA3: #_ENDING_71EA: db $E2 ; pitch bend off
#_0CACA4: #_ENDING_71EB: db $86 ; dur 0x06
#_0CACA5: #_ENDING_71EC: db $F4, $0A ; set loop point B
#_0CACA7: #_ENDING_71EE: db $1D ; play note F4
#_0CACA8: #_ENDING_71EF: db $1C ; play note E4
#_0CACA9: #_ENDING_71F0: db $18 ; play note C4
#_0CACAA: #_ENDING_71F1: db $F5 ; run loop B
#_0CACAB: #_ENDING_71F2: db $1C ; play note E4
#_0CACAC: #_ENDING_71F3: db $1D ; play note F4
#_0CACAD: #_ENDING_71F4: db $8C ; dur 0x0C
#_0CACAE: #_ENDING_71F5: db $1F ; play note G4
#_0CACAF: #_ENDING_71F6: db $E3, $E0 ; pitch bend on
#_0CACB1: #_ENDING_71F8: db $31 ; tie
#_0CACB2: #_ENDING_71F9: db $E2 ; pitch bend off
#_0CACB3: #_ENDING_71FA: db $86 ; dur 0x06
#_0CACB4: #_ENDING_71FB: db $14 ; play note Gs3
#_0CACB5: #_ENDING_71FC: db $18 ; play note C4
#_0CACB6: #_ENDING_71FD: db $1A ; play note D4
#_0CACB7: #_ENDING_71FE: db $18 ; play note C4
#_0CACB8: #_ENDING_71FF: db $1A ; play note D4
#_0CACB9: #_ENDING_7200: db $1C ; play note E4
#_0CACBA: #_ENDING_7201: db $1D ; play note F4
#_0CACBB: #_ENDING_7202: db $1C ; play note E4
#_0CACBC: #_ENDING_7203: db $1D ; play note F4
#_0CACBD: #_ENDING_7204: db $1C ; play note E4
#_0CACBE: #_ENDING_7205: db $1A ; play note D4
#_0CACBF: #_ENDING_7206: db $1C ; play note E4
#_0CACC0: #_ENDING_7207: db $1D ; play note F4
#_0CACC1: #_ENDING_7208: db $1F ; play note G4
#_0CACC2: #_ENDING_7209: db $21 ; play note A4
#_0CACC3: #_ENDING_720A: db $23 ; play note B4
#_0CACC4: #_ENDING_720B: db $F7 ; return from routine B

ENDING_SEGMENT_720C:
#_0CACC5: #_ENDING_720C: db $F1, $0C ; set SRCN
#_0CACC7: #_ENDING_720E: db $F3, $00 ; transpose +0
#_0CACC9: #_ENDING_7210: db $8C ; dur 0x0C
#_0CACCA: #_ENDING_7211: db $1C ; play note E4
#_0CACCB: #_ENDING_7212: db $86 ; dur 0x06
#_0CACCC: #_ENDING_7213: db $31 ; tie
#_0CACCD: #_ENDING_7214: db $13 ; play note G3
#_0CACCE: #_ENDING_7215: db $18 ; play note C4
#_0CACCF: #_ENDING_7216: db $1C ; play note E4
#_0CACD0: #_ENDING_7217: db $1D ; play note F4
#_0CACD1: #_ENDING_7218: db $1C ; play note E4
#_0CACD2: #_ENDING_7219: db $1A ; play note D4
#_0CACD3: #_ENDING_721A: db $1C ; play note E4
#_0CACD4: #_ENDING_721B: db $8C ; dur 0x0C
#_0CACD5: #_ENDING_721C: db $1D ; play note F4
#_0CACD6: #_ENDING_721D: db $86 ; dur 0x06
#_0CACD7: #_ENDING_721E: db $31 ; tie
#_0CACD8: #_ENDING_721F: db $13 ; play note G3
#_0CACD9: #_ENDING_7220: db $16 ; play note As3
#_0CACDA: #_ENDING_7221: db $1A ; play note D4
#_0CACDB: #_ENDING_7222: db $1D ; play note F4
#_0CACDC: #_ENDING_7223: db $1C ; play note E4
#_0CACDD: #_ENDING_7224: db $1A ; play note D4
#_0CACDE: #_ENDING_7225: db $1D ; play note F4
#_0CACDF: #_ENDING_7226: db $8C ; dur 0x0C
#_0CACE0: #_ENDING_7227: db $1C ; play note E4
#_0CACE1: #_ENDING_7228: db $86 ; dur 0x06
#_0CACE2: #_ENDING_7229: db $31 ; tie
#_0CACE3: #_ENDING_722A: db $15 ; play note A3
#_0CACE4: #_ENDING_722B: db $18 ; play note C4
#_0CACE5: #_ENDING_722C: db $1C ; play note E4
#_0CACE6: #_ENDING_722D: db $1D ; play note F4
#_0CACE7: #_ENDING_722E: db $1C ; play note E4
#_0CACE8: #_ENDING_722F: db $18 ; play note C4
#_0CACE9: #_ENDING_7230: db $15 ; play note A3
#_0CACEA: #_ENDING_7231: db $8B ; dur 0x0B
#_0CACEB: #_ENDING_7232: db $14 ; play note Gs3
#_0CACEC: #_ENDING_7233: db $8A ; dur 0x0A
#_0CACED: #_ENDING_7234: db $1F ; play note G4
#_0CACEE: #_ENDING_7235: db $88 ; dur 0x08
#_0CACEF: #_ENDING_7236: db $1D ; play note F4
#_0CACF0: #_ENDING_7237: db $18 ; play note C4
#_0CACF1: #_ENDING_7238: db $1A ; play note D4
#_0CACF2: #_ENDING_7239: db $88 ; dur 0x08
#_0CACF3: #_ENDING_723A: db $1C ; play note E4
#_0CACF4: #_ENDING_723B: db $1F ; play note G4
#_0CACF5: #_ENDING_723C: db $26 ; play note D5
#_0CACF6: #_ENDING_723D: db $24 ; play note C5
#_0CACF7: #_ENDING_723E: db $8C ; dur 0x0C
#_0CACF8: #_ENDING_723F: db $31 ; tie
#_0CACF9: #_ENDING_7240: db $88 ; dur 0x08
#_0CACFA: #_ENDING_7241: db $1C ; play note E4
#_0CACFB: #_ENDING_7242: db $1F ; play note G4
#_0CACFC: #_ENDING_7243: db $26 ; play note D5
#_0CACFD: #_ENDING_7244: db $24 ; play note C5
#_0CACFE: #_ENDING_7245: db $8B ; dur 0x0B
#_0CACFF: #_ENDING_7246: db $31 ; tie
#_0CAD00: #_ENDING_7247: db $88 ; dur 0x08
#_0CAD01: #_ENDING_7248: db $26 ; play note D5
#_0CAD02: #_ENDING_7249: db $88 ; dur 0x08
#_0CAD03: #_ENDING_724A: db $28 ; play note E5
#_0CAD04: #_ENDING_724B: db $24 ; play note C5
#_0CAD05: #_ENDING_724C: db $26 ; play note D5
#_0CAD06: #_ENDING_724D: db $24 ; play note C5
#_0CAD07: #_ENDING_724E: db $8C ; dur 0x0C
#_0CAD08: #_ENDING_724F: db $31 ; tie
#_0CAD09: #_ENDING_7250: db $88 ; dur 0x08
#_0CAD0A: #_ENDING_7251: db $28 ; play note E5
#_0CAD0B: #_ENDING_7252: db $24 ; play note C5
#_0CAD0C: #_ENDING_7253: db $26 ; play note D5
#_0CAD0D: #_ENDING_7254: db $24 ; play note C5
#_0CAD0E: #_ENDING_7255: db $8A ; dur 0x0A
#_0CAD0F: #_ENDING_7256: db $31 ; tie
#_0CAD10: #_ENDING_7257: db $E3, $E0 ; pitch bend on
#_0CAD12: #_ENDING_7259: db $31 ; tie
#_0CAD13: #_ENDING_725A: db $E2 ; pitch bend off
#_0CAD14: #_ENDING_725B: db $F7 ; return from routine B

ENDING_SEGMENT_725C:
#_0CAD15: #_ENDING_725C: db $F1, $09 ; set SRCN
#_0CAD17: #_ENDING_725E: db $F3, $01 ; transpose +1
#_0CAD19: #_ENDING_7260: db $F4, $08 ; set loop point B
#_0CAD1B: #_ENDING_7262: db $94 ; dur 0x14
#_0CAD1C: #_ENDING_7263: db $28 ; play note E5
#_0CAD1D: #_ENDING_7264: db $29 ; play note F5
#_0CAD1E: #_ENDING_7265: db $85 ; dur 0x05
#_0CAD1F: #_ENDING_7266: db $2B ; play note G5
#_0CAD20: #_ENDING_7267: db $94 ; dur 0x14
#_0CAD21: #_ENDING_7268: db $29 ; play note F5
#_0CAD22: #_ENDING_7269: db $28 ; play note E5
#_0CAD23: #_ENDING_726A: db $85 ; dur 0x05
#_0CAD24: #_ENDING_726B: db $24 ; play note C5
#_0CAD25: #_ENDING_726C: db $F5 ; run loop B
#_0CAD26: #_ENDING_726D: db $8B ; dur 0x0B
#_0CAD27: #_ENDING_726E: db $21 ; play note A4
#_0CAD28: #_ENDING_726F: db $88 ; dur 0x08
#_0CAD29: #_ENDING_7270: db $21 ; play note A4
#_0CAD2A: #_ENDING_7271: db $86 ; dur 0x06
#_0CAD2B: #_ENDING_7272: db $2B ; play note G5
#_0CAD2C: #_ENDING_7273: db $88 ; dur 0x08
#_0CAD2D: #_ENDING_7274: db $29 ; play note F5
#_0CAD2E: #_ENDING_7275: db $89 ; dur 0x09
#_0CAD2F: #_ENDING_7276: db $24 ; play note C5
#_0CAD30: #_ENDING_7277: db $88 ; dur 0x08
#_0CAD31: #_ENDING_7278: db $21 ; play note A4
#_0CAD32: #_ENDING_7279: db $88 ; dur 0x08
#_0CAD33: #_ENDING_727A: db $20 ; play note Gs4
#_0CAD34: #_ENDING_727B: db $24 ; play note C5
#_0CAD35: #_ENDING_727C: db $8D ; dur 0x0D
#_0CAD36: #_ENDING_727D: db $2B ; play note G5
#_0CAD37: #_ENDING_727E: db $86 ; dur 0x06
#_0CAD38: #_ENDING_727F: db $28 ; play note E5
#_0CAD39: #_ENDING_7280: db $88 ; dur 0x08
#_0CAD3A: #_ENDING_7281: db $29 ; play note F5
#_0CAD3B: #_ENDING_7282: db $2B ; play note G5
#_0CAD3C: #_ENDING_7283: db $29 ; play note F5
#_0CAD3D: #_ENDING_7284: db $28 ; play note E5
#_0CAD3E: #_ENDING_7285: db $24 ; play note C5
#_0CAD3F: #_ENDING_7286: db $86 ; dur 0x06
#_0CAD40: #_ENDING_7287: db $24 ; play note C5
#_0CAD41: #_ENDING_7288: db $88 ; dur 0x08
#_0CAD42: #_ENDING_7289: db $28 ; play note E5
#_0CAD43: #_ENDING_728A: db $2B ; play note G5
#_0CAD44: #_ENDING_728B: db $86 ; dur 0x06
#_0CAD45: #_ENDING_728C: db $29 ; play note F5
#_0CAD46: #_ENDING_728D: db $88 ; dur 0x08
#_0CAD47: #_ENDING_728E: db $28 ; play note E5
#_0CAD48: #_ENDING_728F: db $8B ; dur 0x0B
#_0CAD49: #_ENDING_7290: db $24 ; play note C5
#_0CAD4A: #_ENDING_7291: db $86 ; dur 0x06
#_0CAD4B: #_ENDING_7292: db $29 ; play note F5
#_0CAD4C: #_ENDING_7293: db $28 ; play note E5
#_0CAD4D: #_ENDING_7294: db $24 ; play note C5
#_0CAD4E: #_ENDING_7295: db $29 ; play note F5
#_0CAD4F: #_ENDING_7296: db $28 ; play note E5
#_0CAD50: #_ENDING_7297: db $24 ; play note C5
#_0CAD51: #_ENDING_7298: db $22 ; play note As4
#_0CAD52: #_ENDING_7299: db $21 ; play note A4
#_0CAD53: #_ENDING_729A: db $24 ; play note C5
#_0CAD54: #_ENDING_729B: db $2B ; play note G5
#_0CAD55: #_ENDING_729C: db $29 ; play note F5
#_0CAD56: #_ENDING_729D: db $8A ; dur 0x0A
#_0CAD57: #_ENDING_729E: db $31 ; tie
#_0CAD58: #_ENDING_729F: db $86 ; dur 0x06
#_0CAD59: #_ENDING_72A0: db $21 ; play note A4
#_0CAD5A: #_ENDING_72A1: db $24 ; play note C5
#_0CAD5B: #_ENDING_72A2: db $2B ; play note G5
#_0CAD5C: #_ENDING_72A3: db $88 ; dur 0x08
#_0CAD5D: #_ENDING_72A4: db $29 ; play note F5
#_0CAD5E: #_ENDING_72A5: db $89 ; dur 0x09
#_0CAD5F: #_ENDING_72A6: db $24 ; play note C5
#_0CAD60: #_ENDING_72A7: db $86 ; dur 0x06
#_0CAD61: #_ENDING_72A8: db $20 ; play note Gs4
#_0CAD62: #_ENDING_72A9: db $24 ; play note C5
#_0CAD63: #_ENDING_72AA: db $2B ; play note G5
#_0CAD64: #_ENDING_72AB: db $88 ; dur 0x08
#_0CAD65: #_ENDING_72AC: db $29 ; play note F5
#_0CAD66: #_ENDING_72AD: db $89 ; dur 0x09
#_0CAD67: #_ENDING_72AE: db $24 ; play note C5
#_0CAD68: #_ENDING_72AF: db $86 ; dur 0x06
#_0CAD69: #_ENDING_72B0: db $31 ; tie
#_0CAD6A: #_ENDING_72B1: db $1C ; play note E4
#_0CAD6B: #_ENDING_72B2: db $1D ; play note F4
#_0CAD6C: #_ENDING_72B3: db $1F ; play note G4
#_0CAD6D: #_ENDING_72B4: db $21 ; play note A4
#_0CAD6E: #_ENDING_72B5: db $23 ; play note B4
#_0CAD6F: #_ENDING_72B6: db $24 ; play note C5
#_0CAD70: #_ENDING_72B7: db $1A ; play note D4
#_0CAD71: #_ENDING_72B8: db $F7 ; return from routine B

ENDING_SEGMENT_72B9:
#_0CAD72: #_ENDING_72B9: db $70 ; vol 0x10
#_0CAD73: #_ENDING_72BA: db $F0, $FE, $EC ; set ADSR
#_0CAD76: #_ENDING_72BD: db $F1, $03 ; set SRCN
#_0CAD78: #_ENDING_72BF: db $F2, $60 ; set panning
#_0CAD7A: #_ENDING_72C1: db $F3, $FC ; transpose -4
#_0CAD7C: #_ENDING_72C3: db $F6 : dw ENDING_SEGMENT_7323 ; subroutine B
#_0CAD7F: #_ENDING_72C6: db $8C ; dur 0x0C
#_0CAD80: #_ENDING_72C7: db $31 ; tie
#_0CAD81: #_ENDING_72C8: db $31 ; tie
#_0CAD82: #_ENDING_72C9: db $31 ; tie
#_0CAD83: #_ENDING_72CA: db $F6 : dw ENDING_SEGMENT_7323 ; subroutine B
#_0CAD86: #_ENDING_72CD: db $8C ; dur 0x0C
#_0CAD87: #_ENDING_72CE: db $31 ; tie
#_0CAD88: #_ENDING_72CF: db $F6 : dw ENDING_SEGMENT_7323 ; subroutine B
#_0CAD8B: #_ENDING_72D2: db $8C ; dur 0x0C
#_0CAD8C: #_ENDING_72D3: db $31 ; tie
#_0CAD8D: #_ENDING_72D4: db $F6 : dw ENDING_SEGMENT_7323 ; subroutine B
#_0CAD90: #_ENDING_72D7: db $F0, $F2, $F0 ; set ADSR
#_0CAD93: #_ENDING_72DA: db $F1, $0B ; set SRCN
#_0CAD95: #_ENDING_72DC: db $F2, $58 ; set panning
#_0CAD97: #_ENDING_72DE: db $F3, $00 ; transpose +0
#_0CAD99: #_ENDING_72E0: db $8B ; dur 0x0B
#_0CAD9A: #_ENDING_72E1: db $1F ; play note G4
#_0CAD9B: #_ENDING_72E2: db $84 ; dur 0x04
#_0CAD9C: #_ENDING_72E3: db $31 ; tie
#_0CAD9D: #_ENDING_72E4: db $31 ; tie
#_0CAD9E: #_ENDING_72E5: db $FC ; fade out
#_0CAD9F: #_ENDING_72E6: db $1E ; play note Fs4
#_0CADA0: #_ENDING_72E7: db $1D ; play note F4
#_0CADA1: #_ENDING_72E8: db $8A ; dur 0x0A
#_0CADA2: #_ENDING_72E9: db $1C ; play note E4
#_0CADA3: #_ENDING_72EA: db $FD ; disable fade
#_0CADA4: #_ENDING_72EB: db $F0, $FC, $F0 ; set ADSR
#_0CADA7: #_ENDING_72EE: db $1C ; play note E4
#_0CADA8: #_ENDING_72EF: db $1C ; play note E4
#_0CADA9: #_ENDING_72F0: db $1C ; play note E4
#_0CADAA: #_ENDING_72F1: db $1A ; play note D4
#_0CADAB: #_ENDING_72F2: db $1A ; play note D4
#_0CADAC: #_ENDING_72F3: db $1A ; play note D4
#_0CADAD: #_ENDING_72F4: db $1A ; play note D4
#_0CADAE: #_ENDING_72F5: db $18 ; play note C4
#_0CADAF: #_ENDING_72F6: db $18 ; play note C4
#_0CADB0: #_ENDING_72F7: db $18 ; play note C4
#_0CADB1: #_ENDING_72F8: db $18 ; play note C4
#_0CADB2: #_ENDING_72F9: db $1A ; play note D4
#_0CADB3: #_ENDING_72FA: db $1A ; play note D4
#_0CADB4: #_ENDING_72FB: db $1A ; play note D4
#_0CADB5: #_ENDING_72FC: db $1A ; play note D4
#_0CADB6: #_ENDING_72FD: db $F4, $03 ; set loop point B
#_0CADB8: #_ENDING_72FF: db $1C ; play note E4
#_0CADB9: #_ENDING_7300: db $1C ; play note E4
#_0CADBA: #_ENDING_7301: db $1C ; play note E4
#_0CADBB: #_ENDING_7302: db $1C ; play note E4
#_0CADBC: #_ENDING_7303: db $1A ; play note D4
#_0CADBD: #_ENDING_7304: db $1A ; play note D4
#_0CADBE: #_ENDING_7305: db $1A ; play note D4
#_0CADBF: #_ENDING_7306: db $1A ; play note D4
#_0CADC0: #_ENDING_7307: db $18 ; play note C4
#_0CADC1: #_ENDING_7308: db $18 ; play note C4
#_0CADC2: #_ENDING_7309: db $18 ; play note C4
#_0CADC3: #_ENDING_730A: db $18 ; play note C4
#_0CADC4: #_ENDING_730B: db $1A ; play note D4
#_0CADC5: #_ENDING_730C: db $1A ; play note D4
#_0CADC6: #_ENDING_730D: db $1A ; play note D4
#_0CADC7: #_ENDING_730E: db $1A ; play note D4
#_0CADC8: #_ENDING_730F: db $F5 ; run loop B
#_0CADC9: #_ENDING_7310: db $73 ; vol 0x13
#_0CADCA: #_ENDING_7311: db $F0, $FD, $E8 ; set ADSR
#_0CADCD: #_ENDING_7314: db $F1, $04 ; set SRCN
#_0CADCF: #_ENDING_7316: db $F2, $64 ; set panning
#_0CADD1: #_ENDING_7318: db $F9, $20 ; set fine tuning
#_0CADD3: #_ENDING_731A: db $8E ; dur 0x0E
#_0CADD4: #_ENDING_731B: db $F4, $FF ; set loop point B
#_0CADD6: #_ENDING_731D: db $1F ; play note G4
#_0CADD7: #_ENDING_731E: db $1D ; play note F4
#_0CADD8: #_ENDING_731F: db $1C ; play note E4
#_0CADD9: #_ENDING_7320: db $1B ; play note Ds4
#_0CADDA: #_ENDING_7321: db $F5 ; run loop B
#_0CADDB: #_ENDING_7322: db $FF ; end track

ENDING_SEGMENT_7323:
#_0CADDC: #_ENDING_7323: db $88 ; dur 0x08
#_0CADDD: #_ENDING_7324: db $10 ; play note E3
#_0CADDE: #_ENDING_7325: db $31 ; tie
#_0CADDF: #_ENDING_7326: db $31 ; tie
#_0CADE0: #_ENDING_7327: db $18 ; play note C4
#_0CADE1: #_ENDING_7328: db $8C ; dur 0x0C
#_0CADE2: #_ENDING_7329: db $31 ; tie
#_0CADE3: #_ENDING_732A: db $88 ; dur 0x08
#_0CADE4: #_ENDING_732B: db $10 ; play note E3
#_0CADE5: #_ENDING_732C: db $31 ; tie
#_0CADE6: #_ENDING_732D: db $31 ; tie
#_0CADE7: #_ENDING_732E: db $18 ; play note C4
#_0CADE8: #_ENDING_732F: db $8C ; dur 0x0C
#_0CADE9: #_ENDING_7330: db $31 ; tie
#_0CADEA: #_ENDING_7331: db $88 ; dur 0x08
#_0CADEB: #_ENDING_7332: db $10 ; play note E3
#_0CADEC: #_ENDING_7333: db $31 ; tie
#_0CADED: #_ENDING_7334: db $31 ; tie
#_0CADEE: #_ENDING_7335: db $18 ; play note C4
#_0CADEF: #_ENDING_7336: db $8A ; dur 0x0A
#_0CADF0: #_ENDING_7337: db $31 ; tie
#_0CADF1: #_ENDING_7338: db $31 ; tie
#_0CADF2: #_ENDING_7339: db $88 ; dur 0x08
#_0CADF3: #_ENDING_733A: db $1C ; play note E4
#_0CADF4: #_ENDING_733B: db $31 ; tie
#_0CADF5: #_ENDING_733C: db $31 ; tie
#_0CADF6: #_ENDING_733D: db $18 ; play note C4
#_0CADF7: #_ENDING_733E: db $8C ; dur 0x0C
#_0CADF8: #_ENDING_733F: db $31 ; tie
#_0CADF9: #_ENDING_7340: db $88 ; dur 0x08
#_0CADFA: #_ENDING_7341: db $10 ; play note E3
#_0CADFB: #_ENDING_7342: db $31 ; tie
#_0CADFC: #_ENDING_7343: db $31 ; tie
#_0CADFD: #_ENDING_7344: db $18 ; play note C4
#_0CADFE: #_ENDING_7345: db $31 ; tie
#_0CADFF: #_ENDING_7346: db $31 ; tie
#_0CAE00: #_ENDING_7347: db $31 ; tie
#_0CAE01: #_ENDING_7348: db $31 ; tie
#_0CAE02: #_ENDING_7349: db $10 ; play note E3
#_0CAE03: #_ENDING_734A: db $31 ; tie
#_0CAE04: #_ENDING_734B: db $31 ; tie
#_0CAE05: #_ENDING_734C: db $18 ; play note C4
#_0CAE06: #_ENDING_734D: db $31 ; tie
#_0CAE07: #_ENDING_734E: db $31 ; tie
#_0CAE08: #_ENDING_734F: db $31 ; tie
#_0CAE09: #_ENDING_7350: db $31 ; tie
#_0CAE0A: #_ENDING_7351: db $1C ; play note E4
#_0CAE0B: #_ENDING_7352: db $31 ; tie
#_0CAE0C: #_ENDING_7353: db $31 ; tie
#_0CAE0D: #_ENDING_7354: db $18 ; play note C4
#_0CAE0E: #_ENDING_7355: db $31 ; tie
#_0CAE0F: #_ENDING_7356: db $31 ; tie
#_0CAE10: #_ENDING_7357: db $31 ; tie
#_0CAE11: #_ENDING_7358: db $31 ; tie
#_0CAE12: #_ENDING_7359: db $1C ; play note E4
#_0CAE13: #_ENDING_735A: db $31 ; tie
#_0CAE14: #_ENDING_735B: db $31 ; tie
#_0CAE15: #_ENDING_735C: db $18 ; play note C4
#_0CAE16: #_ENDING_735D: db $F7 ; return from routine B

ENDING_SEGMENT_735E:
#_0CAE17: #_ENDING_735E: db $73 ; vol 0x13
#_0CAE18: #_ENDING_735F: db $F0, $FE, $EC ; set ADSR
#_0CAE1B: #_ENDING_7362: db $F1, $03 ; set SRCN
#_0CAE1D: #_ENDING_7364: db $F2, $60 ; set panning
#_0CAE1F: #_ENDING_7366: db $F3, $FC ; transpose -4
#_0CAE21: #_ENDING_7368: db $F6 : dw ENDING_SEGMENT_73C6 ; subroutine B
#_0CAE24: #_ENDING_736B: db $8C ; dur 0x0C
#_0CAE25: #_ENDING_736C: db $31 ; tie
#_0CAE26: #_ENDING_736D: db $31 ; tie
#_0CAE27: #_ENDING_736E: db $31 ; tie
#_0CAE28: #_ENDING_736F: db $F6 : dw ENDING_SEGMENT_73C6 ; subroutine B
#_0CAE2B: #_ENDING_7372: db $8C ; dur 0x0C
#_0CAE2C: #_ENDING_7373: db $31 ; tie
#_0CAE2D: #_ENDING_7374: db $F6 : dw ENDING_SEGMENT_73C6 ; subroutine B
#_0CAE30: #_ENDING_7377: db $8C ; dur 0x0C
#_0CAE31: #_ENDING_7378: db $31 ; tie
#_0CAE32: #_ENDING_7379: db $F6 : dw ENDING_SEGMENT_73C6 ; subroutine B
#_0CAE35: #_ENDING_737C: db $F0, $F2, $F0 ; set ADSR
#_0CAE38: #_ENDING_737F: db $F1, $0B ; set SRCN
#_0CAE3A: #_ENDING_7381: db $F2, $58 ; set panning
#_0CAE3C: #_ENDING_7383: db $F3, $00 ; transpose +0
#_0CAE3E: #_ENDING_7385: db $8B ; dur 0x0B
#_0CAE3F: #_ENDING_7386: db $1C ; play note E4
#_0CAE40: #_ENDING_7387: db $84 ; dur 0x04
#_0CAE41: #_ENDING_7388: db $31 ; tie
#_0CAE42: #_ENDING_7389: db $FC ; fade out
#_0CAE43: #_ENDING_738A: db $1B ; play note Ds4
#_0CAE44: #_ENDING_738B: db $1A ; play note D4
#_0CAE45: #_ENDING_738C: db $19 ; play note Cs4
#_0CAE46: #_ENDING_738D: db $8A ; dur 0x0A
#_0CAE47: #_ENDING_738E: db $18 ; play note C4
#_0CAE48: #_ENDING_738F: db $FD ; disable fade
#_0CAE49: #_ENDING_7390: db $F0, $FC, $F0 ; set ADSR
#_0CAE4C: #_ENDING_7393: db $18 ; play note C4
#_0CAE4D: #_ENDING_7394: db $18 ; play note C4
#_0CAE4E: #_ENDING_7395: db $18 ; play note C4
#_0CAE4F: #_ENDING_7396: db $17 ; play note B3
#_0CAE50: #_ENDING_7397: db $17 ; play note B3
#_0CAE51: #_ENDING_7398: db $17 ; play note B3
#_0CAE52: #_ENDING_7399: db $17 ; play note B3
#_0CAE53: #_ENDING_739A: db $15 ; play note A3
#_0CAE54: #_ENDING_739B: db $15 ; play note A3
#_0CAE55: #_ENDING_739C: db $15 ; play note A3
#_0CAE56: #_ENDING_739D: db $15 ; play note A3
#_0CAE57: #_ENDING_739E: db $17 ; play note B3
#_0CAE58: #_ENDING_739F: db $17 ; play note B3
#_0CAE59: #_ENDING_73A0: db $17 ; play note B3
#_0CAE5A: #_ENDING_73A1: db $17 ; play note B3
#_0CAE5B: #_ENDING_73A2: db $F4, $03 ; set loop point B
#_0CAE5D: #_ENDING_73A4: db $18 ; play note C4
#_0CAE5E: #_ENDING_73A5: db $18 ; play note C4
#_0CAE5F: #_ENDING_73A6: db $18 ; play note C4
#_0CAE60: #_ENDING_73A7: db $18 ; play note C4
#_0CAE61: #_ENDING_73A8: db $17 ; play note B3
#_0CAE62: #_ENDING_73A9: db $17 ; play note B3
#_0CAE63: #_ENDING_73AA: db $17 ; play note B3
#_0CAE64: #_ENDING_73AB: db $17 ; play note B3
#_0CAE65: #_ENDING_73AC: db $15 ; play note A3
#_0CAE66: #_ENDING_73AD: db $15 ; play note A3
#_0CAE67: #_ENDING_73AE: db $15 ; play note A3
#_0CAE68: #_ENDING_73AF: db $15 ; play note A3
#_0CAE69: #_ENDING_73B0: db $17 ; play note B3
#_0CAE6A: #_ENDING_73B1: db $17 ; play note B3
#_0CAE6B: #_ENDING_73B2: db $17 ; play note B3
#_0CAE6C: #_ENDING_73B3: db $17 ; play note B3
#_0CAE6D: #_ENDING_73B4: db $F5 ; run loop B
#_0CAE6E: #_ENDING_73B5: db $63 ; vol 0x03
#_0CAE6F: #_ENDING_73B6: db $F0, $FD, $E8 ; set ADSR
#_0CAE72: #_ENDING_73B9: db $F1, $04 ; set SRCN
#_0CAE74: #_ENDING_73BB: db $F2, $64 ; set panning
#_0CAE76: #_ENDING_73BD: db $8E ; dur 0x0E
#_0CAE77: #_ENDING_73BE: db $F4, $FF ; set loop point B
#_0CAE79: #_ENDING_73C0: db $1F ; play note G4
#_0CAE7A: #_ENDING_73C1: db $1D ; play note F4
#_0CAE7B: #_ENDING_73C2: db $1C ; play note E4
#_0CAE7C: #_ENDING_73C3: db $1B ; play note Ds4
#_0CAE7D: #_ENDING_73C4: db $F5 ; run loop B
#_0CAE7E: #_ENDING_73C5: db $FF ; end track

ENDING_SEGMENT_73C6:
#_0CAE7F: #_ENDING_73C6: db $88 ; dur 0x08
#_0CAE80: #_ENDING_73C7: db $30 ; rest
#_0CAE81: #_ENDING_73C8: db $13 ; play note G3
#_0CAE82: #_ENDING_73C9: db $31 ; tie
#_0CAE83: #_ENDING_73CA: db $31 ; tie
#_0CAE84: #_ENDING_73CB: db $8C ; dur 0x0C
#_0CAE85: #_ENDING_73CC: db $31 ; tie
#_0CAE86: #_ENDING_73CD: db $88 ; dur 0x08
#_0CAE87: #_ENDING_73CE: db $31 ; tie
#_0CAE88: #_ENDING_73CF: db $13 ; play note G3
#_0CAE89: #_ENDING_73D0: db $31 ; tie
#_0CAE8A: #_ENDING_73D1: db $31 ; tie
#_0CAE8B: #_ENDING_73D2: db $8C ; dur 0x0C
#_0CAE8C: #_ENDING_73D3: db $31 ; tie
#_0CAE8D: #_ENDING_73D4: db $88 ; dur 0x08
#_0CAE8E: #_ENDING_73D5: db $31 ; tie
#_0CAE8F: #_ENDING_73D6: db $13 ; play note G3
#_0CAE90: #_ENDING_73D7: db $31 ; tie
#_0CAE91: #_ENDING_73D8: db $31 ; tie
#_0CAE92: #_ENDING_73D9: db $8A ; dur 0x0A
#_0CAE93: #_ENDING_73DA: db $31 ; tie
#_0CAE94: #_ENDING_73DB: db $1A ; play note D4
#_0CAE95: #_ENDING_73DC: db $88 ; dur 0x08
#_0CAE96: #_ENDING_73DD: db $31 ; tie
#_0CAE97: #_ENDING_73DE: db $18 ; play note C4
#_0CAE98: #_ENDING_73DF: db $31 ; tie
#_0CAE99: #_ENDING_73E0: db $31 ; tie
#_0CAE9A: #_ENDING_73E1: db $8C ; dur 0x0C
#_0CAE9B: #_ENDING_73E2: db $31 ; tie
#_0CAE9C: #_ENDING_73E3: db $88 ; dur 0x08
#_0CAE9D: #_ENDING_73E4: db $31 ; tie
#_0CAE9E: #_ENDING_73E5: db $13 ; play note G3
#_0CAE9F: #_ENDING_73E6: db $31 ; tie
#_0CAEA0: #_ENDING_73E7: db $31 ; tie
#_0CAEA1: #_ENDING_73E8: db $31 ; tie
#_0CAEA2: #_ENDING_73E9: db $31 ; tie
#_0CAEA3: #_ENDING_73EA: db $17 ; play note B3
#_0CAEA4: #_ENDING_73EB: db $31 ; tie
#_0CAEA5: #_ENDING_73EC: db $31 ; tie
#_0CAEA6: #_ENDING_73ED: db $13 ; play note G3
#_0CAEA7: #_ENDING_73EE: db $31 ; tie
#_0CAEA8: #_ENDING_73EF: db $31 ; tie
#_0CAEA9: #_ENDING_73F0: db $31 ; tie
#_0CAEAA: #_ENDING_73F1: db $31 ; tie
#_0CAEAB: #_ENDING_73F2: db $18 ; play note C4
#_0CAEAC: #_ENDING_73F3: db $31 ; tie
#_0CAEAD: #_ENDING_73F4: db $31 ; tie
#_0CAEAE: #_ENDING_73F5: db $18 ; play note C4
#_0CAEAF: #_ENDING_73F6: db $31 ; tie
#_0CAEB0: #_ENDING_73F7: db $31 ; tie
#_0CAEB1: #_ENDING_73F8: db $31 ; tie
#_0CAEB2: #_ENDING_73F9: db $31 ; tie
#_0CAEB3: #_ENDING_73FA: db $15 ; play note A3
#_0CAEB4: #_ENDING_73FB: db $31 ; tie
#_0CAEB5: #_ENDING_73FC: db $31 ; tie
#_0CAEB6: #_ENDING_73FD: db $18 ; play note C4
#_0CAEB7: #_ENDING_73FE: db $31 ; tie
#_0CAEB8: #_ENDING_73FF: db $31 ; tie
#_0CAEB9: #_ENDING_7400: db $F7 ; return from routine B

ENDING_SEGMENT_7401:
#_0CAEBA: #_ENDING_7401: db $64 ; vol 0x04
#_0CAEBB: #_ENDING_7402: db $F0, $FE, $EC ; set ADSR
#_0CAEBE: #_ENDING_7405: db $F1, $03 ; set SRCN
#_0CAEC0: #_ENDING_7407: db $F2, $60 ; set panning
#_0CAEC2: #_ENDING_7409: db $F3, $FC ; transpose -4
#_0CAEC4: #_ENDING_740B: db $F6 : dw ENDING_SEGMENT_7487 ; subroutine B
#_0CAEC7: #_ENDING_740E: db $8C ; dur 0x0C
#_0CAEC8: #_ENDING_740F: db $31 ; tie
#_0CAEC9: #_ENDING_7410: db $31 ; tie
#_0CAECA: #_ENDING_7411: db $31 ; tie
#_0CAECB: #_ENDING_7412: db $F6 : dw ENDING_SEGMENT_7487 ; subroutine B
#_0CAECE: #_ENDING_7415: db $8C ; dur 0x0C
#_0CAECF: #_ENDING_7416: db $31 ; tie
#_0CAED0: #_ENDING_7417: db $F6 : dw ENDING_SEGMENT_7487 ; subroutine B
#_0CAED3: #_ENDING_741A: db $8C ; dur 0x0C
#_0CAED4: #_ENDING_741B: db $31 ; tie
#_0CAED5: #_ENDING_741C: db $F6 : dw ENDING_SEGMENT_7487 ; subroutine B
#_0CAED8: #_ENDING_741F: db $F0, $F2, $F0 ; set ADSR
#_0CAEDB: #_ENDING_7422: db $F1, $0B ; set SRCN
#_0CAEDD: #_ENDING_7424: db $F2, $58 ; set panning
#_0CAEDF: #_ENDING_7426: db $F3, $00 ; transpose +0
#_0CAEE1: #_ENDING_7428: db $8B ; dur 0x0B
#_0CAEE2: #_ENDING_7429: db $18 ; play note C4
#_0CAEE3: #_ENDING_742A: db $84 ; dur 0x04
#_0CAEE4: #_ENDING_742B: db $31 ; tie
#_0CAEE5: #_ENDING_742C: db $31 ; tie
#_0CAEE6: #_ENDING_742D: db $FC ; fade out
#_0CAEE7: #_ENDING_742E: db $17 ; play note B3
#_0CAEE8: #_ENDING_742F: db $16 ; play note As3
#_0CAEE9: #_ENDING_7430: db $8A ; dur 0x0A
#_0CAEEA: #_ENDING_7431: db $15 ; play note A3
#_0CAEEB: #_ENDING_7432: db $FD ; disable fade
#_0CAEEC: #_ENDING_7433: db $F0, $FC, $F0 ; set ADSR
#_0CAEEF: #_ENDING_7436: db $15 ; play note A3
#_0CAEF0: #_ENDING_7437: db $15 ; play note A3
#_0CAEF1: #_ENDING_7438: db $15 ; play note A3
#_0CAEF2: #_ENDING_7439: db $13 ; play note G3
#_0CAEF3: #_ENDING_743A: db $13 ; play note G3
#_0CAEF4: #_ENDING_743B: db $13 ; play note G3
#_0CAEF5: #_ENDING_743C: db $13 ; play note G3
#_0CAEF6: #_ENDING_743D: db $11 ; play note F3
#_0CAEF7: #_ENDING_743E: db $11 ; play note F3
#_0CAEF8: #_ENDING_743F: db $11 ; play note F3
#_0CAEF9: #_ENDING_7440: db $11 ; play note F3
#_0CAEFA: #_ENDING_7441: db $13 ; play note G3
#_0CAEFB: #_ENDING_7442: db $13 ; play note G3
#_0CAEFC: #_ENDING_7443: db $13 ; play note G3
#_0CAEFD: #_ENDING_7444: db $13 ; play note G3
#_0CAEFE: #_ENDING_7445: db $F4, $03 ; set loop point B
#_0CAF00: #_ENDING_7447: db $15 ; play note A3
#_0CAF01: #_ENDING_7448: db $15 ; play note A3
#_0CAF02: #_ENDING_7449: db $15 ; play note A3
#_0CAF03: #_ENDING_744A: db $15 ; play note A3
#_0CAF04: #_ENDING_744B: db $13 ; play note G3
#_0CAF05: #_ENDING_744C: db $13 ; play note G3
#_0CAF06: #_ENDING_744D: db $13 ; play note G3
#_0CAF07: #_ENDING_744E: db $13 ; play note G3
#_0CAF08: #_ENDING_744F: db $11 ; play note F3
#_0CAF09: #_ENDING_7450: db $11 ; play note F3
#_0CAF0A: #_ENDING_7451: db $11 ; play note F3
#_0CAF0B: #_ENDING_7452: db $11 ; play note F3
#_0CAF0C: #_ENDING_7453: db $13 ; play note G3
#_0CAF0D: #_ENDING_7454: db $13 ; play note G3
#_0CAF0E: #_ENDING_7455: db $13 ; play note G3
#_0CAF0F: #_ENDING_7456: db $13 ; play note G3
#_0CAF10: #_ENDING_7457: db $F5 ; run loop B
#_0CAF11: #_ENDING_7458: db $70 ; vol 0x10
#_0CAF12: #_ENDING_7459: db $F0, $FE, $F2 ; set ADSR
#_0CAF15: #_ENDING_745C: db $F1, $09 ; set SRCN
#_0CAF17: #_ENDING_745E: db $F2, $64 ; set panning
#_0CAF19: #_ENDING_7460: db $F3, $01 ; transpose +1
#_0CAF1B: #_ENDING_7462: db $88 ; dur 0x08
#_0CAF1C: #_ENDING_7463: db $F4, $FF ; set loop point B
#_0CAF1E: #_ENDING_7465: db $18 ; play note C4
#_0CAF1F: #_ENDING_7466: db $1C ; play note E4
#_0CAF20: #_ENDING_7467: db $1F ; play note G4
#_0CAF21: #_ENDING_7468: db $1C ; play note E4
#_0CAF22: #_ENDING_7469: db $18 ; play note C4
#_0CAF23: #_ENDING_746A: db $1C ; play note E4
#_0CAF24: #_ENDING_746B: db $1F ; play note G4
#_0CAF25: #_ENDING_746C: db $1C ; play note E4
#_0CAF26: #_ENDING_746D: db $16 ; play note As3
#_0CAF27: #_ENDING_746E: db $1C ; play note E4
#_0CAF28: #_ENDING_746F: db $1F ; play note G4
#_0CAF29: #_ENDING_7470: db $1C ; play note E4
#_0CAF2A: #_ENDING_7471: db $16 ; play note As3
#_0CAF2B: #_ENDING_7472: db $1C ; play note E4
#_0CAF2C: #_ENDING_7473: db $1F ; play note G4
#_0CAF2D: #_ENDING_7474: db $1C ; play note E4
#_0CAF2E: #_ENDING_7475: db $15 ; play note A3
#_0CAF2F: #_ENDING_7476: db $18 ; play note C4
#_0CAF30: #_ENDING_7477: db $1F ; play note G4
#_0CAF31: #_ENDING_7478: db $18 ; play note C4
#_0CAF32: #_ENDING_7479: db $15 ; play note A3
#_0CAF33: #_ENDING_747A: db $18 ; play note C4
#_0CAF34: #_ENDING_747B: db $1F ; play note G4
#_0CAF35: #_ENDING_747C: db $18 ; play note C4
#_0CAF36: #_ENDING_747D: db $14 ; play note Gs3
#_0CAF37: #_ENDING_747E: db $18 ; play note C4
#_0CAF38: #_ENDING_747F: db $1F ; play note G4
#_0CAF39: #_ENDING_7480: db $18 ; play note C4
#_0CAF3A: #_ENDING_7481: db $14 ; play note Gs3
#_0CAF3B: #_ENDING_7482: db $18 ; play note C4
#_0CAF3C: #_ENDING_7483: db $1F ; play note G4
#_0CAF3D: #_ENDING_7484: db $18 ; play note C4
#_0CAF3E: #_ENDING_7485: db $F5 ; run loop B
#_0CAF3F: #_ENDING_7486: db $FF ; end track

ENDING_SEGMENT_7487:
#_0CAF40: #_ENDING_7487: db $88 ; dur 0x08
#_0CAF41: #_ENDING_7488: db $30 ; rest
#_0CAF42: #_ENDING_7489: db $30 ; rest
#_0CAF43: #_ENDING_748A: db $1A ; play note D4
#_0CAF44: #_ENDING_748B: db $31 ; tie
#_0CAF45: #_ENDING_748C: db $8C ; dur 0x0C
#_0CAF46: #_ENDING_748D: db $31 ; tie
#_0CAF47: #_ENDING_748E: db $88 ; dur 0x08
#_0CAF48: #_ENDING_748F: db $31 ; tie
#_0CAF49: #_ENDING_7490: db $31 ; tie
#_0CAF4A: #_ENDING_7491: db $1A ; play note D4
#_0CAF4B: #_ENDING_7492: db $31 ; tie
#_0CAF4C: #_ENDING_7493: db $8C ; dur 0x0C
#_0CAF4D: #_ENDING_7494: db $31 ; tie
#_0CAF4E: #_ENDING_7495: db $88 ; dur 0x08
#_0CAF4F: #_ENDING_7496: db $31 ; tie
#_0CAF50: #_ENDING_7497: db $31 ; tie
#_0CAF51: #_ENDING_7498: db $1A ; play note D4
#_0CAF52: #_ENDING_7499: db $31 ; tie
#_0CAF53: #_ENDING_749A: db $8A ; dur 0x0A
#_0CAF54: #_ENDING_749B: db $31 ; tie
#_0CAF55: #_ENDING_749C: db $31 ; tie
#_0CAF56: #_ENDING_749D: db $88 ; dur 0x08
#_0CAF57: #_ENDING_749E: db $31 ; tie
#_0CAF58: #_ENDING_749F: db $31 ; tie
#_0CAF59: #_ENDING_74A0: db $1A ; play note D4
#_0CAF5A: #_ENDING_74A1: db $31 ; tie
#_0CAF5B: #_ENDING_74A2: db $8C ; dur 0x0C
#_0CAF5C: #_ENDING_74A3: db $31 ; tie
#_0CAF5D: #_ENDING_74A4: db $88 ; dur 0x08
#_0CAF5E: #_ENDING_74A5: db $31 ; tie
#_0CAF5F: #_ENDING_74A6: db $31 ; tie
#_0CAF60: #_ENDING_74A7: db $1A ; play note D4
#_0CAF61: #_ENDING_74A8: db $31 ; tie
#_0CAF62: #_ENDING_74A9: db $31 ; tie
#_0CAF63: #_ENDING_74AA: db $31 ; tie
#_0CAF64: #_ENDING_74AB: db $31 ; tie
#_0CAF65: #_ENDING_74AC: db $18 ; play note C4
#_0CAF66: #_ENDING_74AD: db $31 ; tie
#_0CAF67: #_ENDING_74AE: db $31 ; tie
#_0CAF68: #_ENDING_74AF: db $1A ; play note D4
#_0CAF69: #_ENDING_74B0: db $31 ; tie
#_0CAF6A: #_ENDING_74B1: db $31 ; tie
#_0CAF6B: #_ENDING_74B2: db $31 ; tie
#_0CAF6C: #_ENDING_74B3: db $31 ; tie
#_0CAF6D: #_ENDING_74B4: db $1A ; play note D4
#_0CAF6E: #_ENDING_74B5: db $31 ; tie
#_0CAF6F: #_ENDING_74B6: db $31 ; tie
#_0CAF70: #_ENDING_74B7: db $1A ; play note D4
#_0CAF71: #_ENDING_74B8: db $31 ; tie
#_0CAF72: #_ENDING_74B9: db $31 ; tie
#_0CAF73: #_ENDING_74BA: db $31 ; tie
#_0CAF74: #_ENDING_74BB: db $31 ; tie
#_0CAF75: #_ENDING_74BC: db $18 ; play note C4
#_0CAF76: #_ENDING_74BD: db $31 ; tie
#_0CAF77: #_ENDING_74BE: db $31 ; tie
#_0CAF78: #_ENDING_74BF: db $1A ; play note D4
#_0CAF79: #_ENDING_74C0: db $31 ; tie
#_0CAF7A: #_ENDING_74C1: db $F7 ; return from routine B

ENDING_SEGMENT_74C2:
#_0CAF7B: #_ENDING_74C2: db $89 ; dur 0x09
#_0CAF7C: #_ENDING_74C3: db $30 ; rest
#_0CAF7D: #_ENDING_74C4: db $70 ; vol 0x10
#_0CAF7E: #_ENDING_74C5: db $F0, $FA, $EC ; set ADSR
#_0CAF81: #_ENDING_74C8: db $F1, $03 ; set SRCN
#_0CAF83: #_ENDING_74CA: db $F2, $6C ; set panning
#_0CAF85: #_ENDING_74CC: db $F3, $FC ; transpose -4
#_0CAF87: #_ENDING_74CE: db $F9, $20 ; set fine tuning
#_0CAF89: #_ENDING_74D0: db $F6 : dw ENDING_SEGMENT_754B ; subroutine B
#_0CAF8C: #_ENDING_74D3: db $8C ; dur 0x0C
#_0CAF8D: #_ENDING_74D4: db $31 ; tie
#_0CAF8E: #_ENDING_74D5: db $31 ; tie
#_0CAF8F: #_ENDING_74D6: db $31 ; tie
#_0CAF90: #_ENDING_74D7: db $F6 : dw ENDING_SEGMENT_754B ; subroutine B
#_0CAF93: #_ENDING_74DA: db $8C ; dur 0x0C
#_0CAF94: #_ENDING_74DB: db $31 ; tie
#_0CAF95: #_ENDING_74DC: db $F6 : dw ENDING_SEGMENT_754B ; subroutine B
#_0CAF98: #_ENDING_74DF: db $8C ; dur 0x0C
#_0CAF99: #_ENDING_74E0: db $31 ; tie
#_0CAF9A: #_ENDING_74E1: db $F6 : dw ENDING_SEGMENT_754B ; subroutine B
#_0CAF9D: #_ENDING_74E4: db $F0, $F2, $F0 ; set ADSR
#_0CAFA0: #_ENDING_74E7: db $F1, $0B ; set SRCN
#_0CAFA2: #_ENDING_74E9: db $F2, $68 ; set panning
#_0CAFA4: #_ENDING_74EB: db $F3, $00 ; transpose +0
#_0CAFA6: #_ENDING_74ED: db $8B ; dur 0x0B
#_0CAFA7: #_ENDING_74EE: db $1F ; play note G4
#_0CAFA8: #_ENDING_74EF: db $84 ; dur 0x04
#_0CAFA9: #_ENDING_74F0: db $31 ; tie
#_0CAFAA: #_ENDING_74F1: db $31 ; tie
#_0CAFAB: #_ENDING_74F2: db $FC ; fade out
#_0CAFAC: #_ENDING_74F3: db $1E ; play note Fs4
#_0CAFAD: #_ENDING_74F4: db $1D ; play note F4
#_0CAFAE: #_ENDING_74F5: db $8A ; dur 0x0A
#_0CAFAF: #_ENDING_74F6: db $1C ; play note E4
#_0CAFB0: #_ENDING_74F7: db $FD ; disable fade
#_0CAFB1: #_ENDING_74F8: db $F0, $F9, $F0 ; set ADSR
#_0CAFB4: #_ENDING_74FB: db $1C ; play note E4
#_0CAFB5: #_ENDING_74FC: db $1C ; play note E4
#_0CAFB6: #_ENDING_74FD: db $1C ; play note E4
#_0CAFB7: #_ENDING_74FE: db $1A ; play note D4
#_0CAFB8: #_ENDING_74FF: db $1A ; play note D4
#_0CAFB9: #_ENDING_7500: db $1A ; play note D4
#_0CAFBA: #_ENDING_7501: db $1A ; play note D4
#_0CAFBB: #_ENDING_7502: db $18 ; play note C4
#_0CAFBC: #_ENDING_7503: db $18 ; play note C4
#_0CAFBD: #_ENDING_7504: db $18 ; play note C4
#_0CAFBE: #_ENDING_7505: db $18 ; play note C4
#_0CAFBF: #_ENDING_7506: db $1A ; play note D4
#_0CAFC0: #_ENDING_7507: db $1A ; play note D4
#_0CAFC1: #_ENDING_7508: db $1A ; play note D4
#_0CAFC2: #_ENDING_7509: db $1A ; play note D4
#_0CAFC3: #_ENDING_750A: db $F4, $03 ; set loop point B
#_0CAFC5: #_ENDING_750C: db $1C ; play note E4
#_0CAFC6: #_ENDING_750D: db $1C ; play note E4
#_0CAFC7: #_ENDING_750E: db $1C ; play note E4
#_0CAFC8: #_ENDING_750F: db $1C ; play note E4
#_0CAFC9: #_ENDING_7510: db $1A ; play note D4
#_0CAFCA: #_ENDING_7511: db $1A ; play note D4
#_0CAFCB: #_ENDING_7512: db $1A ; play note D4
#_0CAFCC: #_ENDING_7513: db $1A ; play note D4
#_0CAFCD: #_ENDING_7514: db $18 ; play note C4
#_0CAFCE: #_ENDING_7515: db $18 ; play note C4
#_0CAFCF: #_ENDING_7516: db $18 ; play note C4
#_0CAFD0: #_ENDING_7517: db $18 ; play note C4
#_0CAFD1: #_ENDING_7518: db $1A ; play note D4
#_0CAFD2: #_ENDING_7519: db $1A ; play note D4
#_0CAFD3: #_ENDING_751A: db $1A ; play note D4
#_0CAFD4: #_ENDING_751B: db $1A ; play note D4
#_0CAFD5: #_ENDING_751C: db $F5 ; run loop B
#_0CAFD6: #_ENDING_751D: db $F0, $FA, $F2 ; set ADSR
#_0CAFD9: #_ENDING_7520: db $F1, $09 ; set SRCN
#_0CAFDB: #_ENDING_7522: db $F2, $70 ; set panning
#_0CAFDD: #_ENDING_7524: db $F3, $01 ; transpose +1
#_0CAFDF: #_ENDING_7526: db $88 ; dur 0x08
#_0CAFE0: #_ENDING_7527: db $F4, $FF ; set loop point B
#_0CAFE2: #_ENDING_7529: db $18 ; play note C4
#_0CAFE3: #_ENDING_752A: db $1C ; play note E4
#_0CAFE4: #_ENDING_752B: db $1F ; play note G4
#_0CAFE5: #_ENDING_752C: db $1C ; play note E4
#_0CAFE6: #_ENDING_752D: db $18 ; play note C4
#_0CAFE7: #_ENDING_752E: db $1C ; play note E4
#_0CAFE8: #_ENDING_752F: db $1F ; play note G4
#_0CAFE9: #_ENDING_7530: db $1C ; play note E4
#_0CAFEA: #_ENDING_7531: db $16 ; play note As3
#_0CAFEB: #_ENDING_7532: db $1C ; play note E4
#_0CAFEC: #_ENDING_7533: db $1F ; play note G4
#_0CAFED: #_ENDING_7534: db $1C ; play note E4
#_0CAFEE: #_ENDING_7535: db $16 ; play note As3
#_0CAFEF: #_ENDING_7536: db $1C ; play note E4
#_0CAFF0: #_ENDING_7537: db $1F ; play note G4
#_0CAFF1: #_ENDING_7538: db $1C ; play note E4
#_0CAFF2: #_ENDING_7539: db $15 ; play note A3
#_0CAFF3: #_ENDING_753A: db $18 ; play note C4
#_0CAFF4: #_ENDING_753B: db $1F ; play note G4
#_0CAFF5: #_ENDING_753C: db $18 ; play note C4
#_0CAFF6: #_ENDING_753D: db $15 ; play note A3
#_0CAFF7: #_ENDING_753E: db $18 ; play note C4
#_0CAFF8: #_ENDING_753F: db $1F ; play note G4
#_0CAFF9: #_ENDING_7540: db $18 ; play note C4
#_0CAFFA: #_ENDING_7541: db $14 ; play note Gs3
#_0CAFFB: #_ENDING_7542: db $18 ; play note C4
#_0CAFFC: #_ENDING_7543: db $1F ; play note G4
#_0CAFFD: #_ENDING_7544: db $18 ; play note C4
#_0CAFFE: #_ENDING_7545: db $14 ; play note Gs3
#_0CAFFF: #_ENDING_7546: db $18 ; play note C4
#_0CB000: #_ENDING_7547: db $1F ; play note G4
#_0CB001: #_ENDING_7548: db $18 ; play note C4
#_0CB002: #_ENDING_7549: db $F5 ; run loop B
#_0CB003: #_ENDING_754A: db $FF ; end track

ENDING_SEGMENT_754B:
#_0CB004: #_ENDING_754B: db $88 ; dur 0x08
#_0CB005: #_ENDING_754C: db $10 ; play note E3
#_0CB006: #_ENDING_754D: db $13 ; play note G3
#_0CB007: #_ENDING_754E: db $1A ; play note D4
#_0CB008: #_ENDING_754F: db $18 ; play note C4
#_0CB009: #_ENDING_7550: db $8C ; dur 0x0C
#_0CB00A: #_ENDING_7551: db $31 ; tie
#_0CB00B: #_ENDING_7552: db $88 ; dur 0x08
#_0CB00C: #_ENDING_7553: db $10 ; play note E3
#_0CB00D: #_ENDING_7554: db $13 ; play note G3
#_0CB00E: #_ENDING_7555: db $1A ; play note D4
#_0CB00F: #_ENDING_7556: db $18 ; play note C4
#_0CB010: #_ENDING_7557: db $8C ; dur 0x0C
#_0CB011: #_ENDING_7558: db $31 ; tie
#_0CB012: #_ENDING_7559: db $88 ; dur 0x08
#_0CB013: #_ENDING_755A: db $10 ; play note E3
#_0CB014: #_ENDING_755B: db $13 ; play note G3
#_0CB015: #_ENDING_755C: db $1A ; play note D4
#_0CB016: #_ENDING_755D: db $18 ; play note C4
#_0CB017: #_ENDING_755E: db $8A ; dur 0x0A
#_0CB018: #_ENDING_755F: db $31 ; tie
#_0CB019: #_ENDING_7560: db $1A ; play note D4
#_0CB01A: #_ENDING_7561: db $88 ; dur 0x08
#_0CB01B: #_ENDING_7562: db $1C ; play note E4
#_0CB01C: #_ENDING_7563: db $18 ; play note C4
#_0CB01D: #_ENDING_7564: db $1A ; play note D4
#_0CB01E: #_ENDING_7565: db $18 ; play note C4
#_0CB01F: #_ENDING_7566: db $8C ; dur 0x0C
#_0CB020: #_ENDING_7567: db $31 ; tie
#_0CB021: #_ENDING_7568: db $88 ; dur 0x08
#_0CB022: #_ENDING_7569: db $10 ; play note E3
#_0CB023: #_ENDING_756A: db $13 ; play note G3
#_0CB024: #_ENDING_756B: db $1A ; play note D4
#_0CB025: #_ENDING_756C: db $18 ; play note C4
#_0CB026: #_ENDING_756D: db $31 ; tie
#_0CB027: #_ENDING_756E: db $31 ; tie
#_0CB028: #_ENDING_756F: db $17 ; play note B3
#_0CB029: #_ENDING_7570: db $18 ; play note C4
#_0CB02A: #_ENDING_7571: db $10 ; play note E3
#_0CB02B: #_ENDING_7572: db $13 ; play note G3
#_0CB02C: #_ENDING_7573: db $1A ; play note D4
#_0CB02D: #_ENDING_7574: db $18 ; play note C4
#_0CB02E: #_ENDING_7575: db $31 ; tie
#_0CB02F: #_ENDING_7576: db $31 ; tie
#_0CB030: #_ENDING_7577: db $18 ; play note C4
#_0CB031: #_ENDING_7578: db $1A ; play note D4
#_0CB032: #_ENDING_7579: db $1C ; play note E4
#_0CB033: #_ENDING_757A: db $18 ; play note C4
#_0CB034: #_ENDING_757B: db $1A ; play note D4
#_0CB035: #_ENDING_757C: db $18 ; play note C4
#_0CB036: #_ENDING_757D: db $31 ; tie
#_0CB037: #_ENDING_757E: db $31 ; tie
#_0CB038: #_ENDING_757F: db $15 ; play note A3
#_0CB039: #_ENDING_7580: db $18 ; play note C4
#_0CB03A: #_ENDING_7581: db $1C ; play note E4
#_0CB03B: #_ENDING_7582: db $18 ; play note C4
#_0CB03C: #_ENDING_7583: db $1A ; play note D4
#_0CB03D: #_ENDING_7584: db $18 ; play note C4
#_0CB03E: #_ENDING_7585: db $F7 ; return from routine B

ENDING_SEGMENT_7586:
#_0CB03F: #_ENDING_7586: db $70 ; vol 0x10
#_0CB040: #_ENDING_7587: db $F0, $FE, $EC ; set ADSR
#_0CB043: #_ENDING_758A: db $F1, $03 ; set SRCN
#_0CB045: #_ENDING_758C: db $F2, $5A ; set panning
#_0CB047: #_ENDING_758E: db $F3, $FC ; transpose -4
#_0CB049: #_ENDING_7590: db $8E ; dur 0x0E
#_0CB04A: #_ENDING_7591: db $0C ; play note C3
#_0CB04B: #_ENDING_7592: db $0A ; play note As2
#_0CB04C: #_ENDING_7593: db $09 ; play note A2
#_0CB04D: #_ENDING_7594: db $08 ; play note Gs2
#_0CB04E: #_ENDING_7595: db $0C ; play note C3
#_0CB04F: #_ENDING_7596: db $0A ; play note As2
#_0CB050: #_ENDING_7597: db $09 ; play note A2
#_0CB051: #_ENDING_7598: db $08 ; play note Gs2
#_0CB052: #_ENDING_7599: db $31 ; tie
#_0CB053: #_ENDING_759A: db $0C ; play note C3
#_0CB054: #_ENDING_759B: db $0A ; play note As2
#_0CB055: #_ENDING_759C: db $09 ; play note A2
#_0CB056: #_ENDING_759D: db $08 ; play note Gs2
#_0CB057: #_ENDING_759E: db $0C ; play note C3
#_0CB058: #_ENDING_759F: db $0A ; play note As2
#_0CB059: #_ENDING_75A0: db $09 ; play note A2
#_0CB05A: #_ENDING_75A1: db $08 ; play note Gs2
#_0CB05B: #_ENDING_75A2: db $F1, $02 ; set SRCN
#_0CB05D: #_ENDING_75A4: db $F2, $48 ; set panning
#_0CB05F: #_ENDING_75A6: db $F3, $00 ; transpose +0
#_0CB061: #_ENDING_75A8: db $18 ; play note C4
#_0CB062: #_ENDING_75A9: db $16 ; play note As3
#_0CB063: #_ENDING_75AA: db $15 ; play note A3
#_0CB064: #_ENDING_75AB: db $14 ; play note Gs3
#_0CB065: #_ENDING_75AC: db $18 ; play note C4
#_0CB066: #_ENDING_75AD: db $16 ; play note As3
#_0CB067: #_ENDING_75AE: db $15 ; play note A3
#_0CB068: #_ENDING_75AF: db $14 ; play note Gs3
#_0CB069: #_ENDING_75B0: db $8B ; dur 0x0B
#_0CB06A: #_ENDING_75B1: db $18 ; play note C4
#_0CB06B: #_ENDING_75B2: db $18 ; play note C4
#_0CB06C: #_ENDING_75B3: db $8A ; dur 0x0A
#_0CB06D: #_ENDING_75B4: db $31 ; tie
#_0CB06E: #_ENDING_75B5: db $8B ; dur 0x0B
#_0CB06F: #_ENDING_75B6: db $16 ; play note As3
#_0CB070: #_ENDING_75B7: db $16 ; play note As3
#_0CB071: #_ENDING_75B8: db $8A ; dur 0x0A
#_0CB072: #_ENDING_75B9: db $31 ; tie
#_0CB073: #_ENDING_75BA: db $8B ; dur 0x0B
#_0CB074: #_ENDING_75BB: db $15 ; play note A3
#_0CB075: #_ENDING_75BC: db $15 ; play note A3
#_0CB076: #_ENDING_75BD: db $8A ; dur 0x0A
#_0CB077: #_ENDING_75BE: db $31 ; tie
#_0CB078: #_ENDING_75BF: db $8B ; dur 0x0B
#_0CB079: #_ENDING_75C0: db $14 ; play note Gs3
#_0CB07A: #_ENDING_75C1: db $14 ; play note Gs3
#_0CB07B: #_ENDING_75C2: db $8A ; dur 0x0A
#_0CB07C: #_ENDING_75C3: db $31 ; tie
#_0CB07D: #_ENDING_75C4: db $8B ; dur 0x0B
#_0CB07E: #_ENDING_75C5: db $18 ; play note C4
#_0CB07F: #_ENDING_75C6: db $18 ; play note C4
#_0CB080: #_ENDING_75C7: db $8A ; dur 0x0A
#_0CB081: #_ENDING_75C8: db $31 ; tie
#_0CB082: #_ENDING_75C9: db $8B ; dur 0x0B
#_0CB083: #_ENDING_75CA: db $16 ; play note As3
#_0CB084: #_ENDING_75CB: db $16 ; play note As3
#_0CB085: #_ENDING_75CC: db $8A ; dur 0x0A
#_0CB086: #_ENDING_75CD: db $31 ; tie
#_0CB087: #_ENDING_75CE: db $8B ; dur 0x0B
#_0CB088: #_ENDING_75CF: db $15 ; play note A3
#_0CB089: #_ENDING_75D0: db $15 ; play note A3
#_0CB08A: #_ENDING_75D1: db $8A ; dur 0x0A
#_0CB08B: #_ENDING_75D2: db $31 ; tie
#_0CB08C: #_ENDING_75D3: db $8E ; dur 0x0E
#_0CB08D: #_ENDING_75D4: db $14 ; play note Gs3
#_0CB08E: #_ENDING_75D5: db $F0, $FE, $F2 ; set ADSR
#_0CB091: #_ENDING_75D8: db $88 ; dur 0x08
#_0CB092: #_ENDING_75D9: db $E4, $04 ; set loop point A
#_0CB094: #_ENDING_75DB: db $F4, $08 ; set loop point B
#_0CB096: #_ENDING_75DD: db $1D ; play note F4
#_0CB097: #_ENDING_75DE: db $F5 ; run loop B
#_0CB098: #_ENDING_75DF: db $F4, $08 ; set loop point B
#_0CB09A: #_ENDING_75E1: db $1C ; play note E4
#_0CB09B: #_ENDING_75E2: db $F5 ; run loop B
#_0CB09C: #_ENDING_75E3: db $F4, $08 ; set loop point B
#_0CB09E: #_ENDING_75E5: db $1A ; play note D4
#_0CB09F: #_ENDING_75E6: db $F5 ; run loop B
#_0CB0A0: #_ENDING_75E7: db $F4, $08 ; set loop point B
#_0CB0A2: #_ENDING_75E9: db $1C ; play note E4
#_0CB0A3: #_ENDING_75EA: db $F5 ; run loop B
#_0CB0A4: #_ENDING_75EB: db $E5 ; run loop A
#_0CB0A5: #_ENDING_75EC: db $E4, $FF ; set loop point A
#_0CB0A7: #_ENDING_75EE: db $F4, $08 ; set loop point B
#_0CB0A9: #_ENDING_75F0: db $18 ; play note C4
#_0CB0AA: #_ENDING_75F1: db $F5 ; run loop B
#_0CB0AB: #_ENDING_75F2: db $F4, $08 ; set loop point B
#_0CB0AD: #_ENDING_75F4: db $16 ; play note As3
#_0CB0AE: #_ENDING_75F5: db $F5 ; run loop B
#_0CB0AF: #_ENDING_75F6: db $F4, $08 ; set loop point B
#_0CB0B1: #_ENDING_75F8: db $15 ; play note A3
#_0CB0B2: #_ENDING_75F9: db $F5 ; run loop B
#_0CB0B3: #_ENDING_75FA: db $F4, $08 ; set loop point B
#_0CB0B5: #_ENDING_75FC: db $14 ; play note Gs3
#_0CB0B6: #_ENDING_75FD: db $F5 ; run loop B
#_0CB0B7: #_ENDING_75FE: db $E5 ; run loop A
#_0CB0B8: #_ENDING_75FF: db $FF ; end track

ENDING_SEGMENT_7600:
#_0CB0B9: #_ENDING_7600: db $8E ; dur 0x0E
#_0CB0BA: #_ENDING_7601: db $F4, $11 ; set loop point B
#_0CB0BC: #_ENDING_7603: db $30 ; rest
#_0CB0BD: #_ENDING_7604: db $F5 ; run loop B
#_0CB0BE: #_ENDING_7605: db $70 ; vol 0x10
#_0CB0BF: #_ENDING_7606: db $F0, $FF, $FD ; set ADSR
#_0CB0C2: #_ENDING_7609: db $F1, $00 ; set SRCN
#_0CB0C4: #_ENDING_760B: db $F2, $7A ; set panning
#_0CB0C6: #_ENDING_760D: db $8A ; dur 0x0A
#_0CB0C7: #_ENDING_760E: db $F4, $20 ; set loop point B
#_0CB0C9: #_ENDING_7610: db $5E ; Noise 0x1E
#_0CB0CA: #_ENDING_7611: db $F5 ; run loop B
#_0CB0CB: #_ENDING_7612: db $F0, $FF, $E0 ; set ADSR
#_0CB0CE: #_ENDING_7615: db $F2, $44 ; set panning
#_0CB0D0: #_ENDING_7617: db $F4, $07 ; set loop point B
#_0CB0D2: #_ENDING_7619: db $8B ; dur 0x0B
#_0CB0D3: #_ENDING_761A: db $18 ; play note C4
#_0CB0D4: #_ENDING_761B: db $18 ; play note C4
#_0CB0D5: #_ENDING_761C: db $8A ; dur 0x0A
#_0CB0D6: #_ENDING_761D: db $30 ; rest
#_0CB0D7: #_ENDING_761E: db $F5 ; run loop B
#_0CB0D8: #_ENDING_761F: db $8C ; dur 0x0C
#_0CB0D9: #_ENDING_7620: db $18 ; play note C4
#_0CB0DA: #_ENDING_7621: db $F0, $F2, $E8 ; set ADSR
#_0CB0DD: #_ENDING_7624: db $F1, $02 ; set SRCN
#_0CB0DF: #_ENDING_7626: db $F2, $7A ; set panning
#_0CB0E1: #_ENDING_7628: db $5E ; Noise 0x1E
#_0CB0E2: #_ENDING_7629: db $F0, $FF, $E0 ; set ADSR
#_0CB0E5: #_ENDING_762C: db $F2, $44 ; set panning
#_0CB0E7: #_ENDING_762E: db $8A ; dur 0x0A
#_0CB0E8: #_ENDING_762F: db $F4, $0F ; set loop point B
#_0CB0EA: #_ENDING_7631: db $F1, $00 ; set SRCN
#_0CB0EC: #_ENDING_7633: db $18 ; play note C4
#_0CB0ED: #_ENDING_7634: db $F1, $01 ; set SRCN
#_0CB0EF: #_ENDING_7636: db $18 ; play note C4
#_0CB0F0: #_ENDING_7637: db $F5 ; run loop B
#_0CB0F1: #_ENDING_7638: db $88 ; dur 0x08
#_0CB0F2: #_ENDING_7639: db $F1, $00 ; set SRCN
#_0CB0F4: #_ENDING_763B: db $18 ; play note C4
#_0CB0F5: #_ENDING_763C: db $F1, $01 ; set SRCN
#_0CB0F7: #_ENDING_763E: db $18 ; play note C4
#_0CB0F8: #_ENDING_763F: db $F1, $0A ; set SRCN
#_0CB0FA: #_ENDING_7641: db $86 ; dur 0x06
#_0CB0FB: #_ENDING_7642: db $1F ; play note G4
#_0CB0FC: #_ENDING_7643: db $1F ; play note G4
#_0CB0FD: #_ENDING_7644: db $88 ; dur 0x08
#_0CB0FE: #_ENDING_7645: db $18 ; play note C4
#_0CB0FF: #_ENDING_7646: db $8A ; dur 0x0A
#_0CB100: #_ENDING_7647: db $F4, $0F ; set loop point B
#_0CB102: #_ENDING_7649: db $F1, $00 ; set SRCN
#_0CB104: #_ENDING_764B: db $18 ; play note C4
#_0CB105: #_ENDING_764C: db $F1, $01 ; set SRCN
#_0CB107: #_ENDING_764E: db $18 ; play note C4
#_0CB108: #_ENDING_764F: db $F5 ; run loop B
#_0CB109: #_ENDING_7650: db $86 ; dur 0x06
#_0CB10A: #_ENDING_7651: db $F1, $00 ; set SRCN
#_0CB10C: #_ENDING_7653: db $18 ; play note C4
#_0CB10D: #_ENDING_7654: db $F1, $01 ; set SRCN
#_0CB10F: #_ENDING_7656: db $18 ; play note C4
#_0CB110: #_ENDING_7657: db $F1, $00 ; set SRCN
#_0CB112: #_ENDING_7659: db $18 ; play note C4
#_0CB113: #_ENDING_765A: db $18 ; play note C4
#_0CB114: #_ENDING_765B: db $F1, $0A ; set SRCN
#_0CB116: #_ENDING_765D: db $1F ; play note G4
#_0CB117: #_ENDING_765E: db $1F ; play note G4
#_0CB118: #_ENDING_765F: db $1C ; play note E4
#_0CB119: #_ENDING_7660: db $18 ; play note C4

ENDING_SEGMENT_7661:
#_0CB11A: #_ENDING_7661: db $8A ; dur 0x0A
#_0CB11B: #_ENDING_7662: db $F4, $07 ; set loop point B
#_0CB11D: #_ENDING_7664: db $F1, $00 ; set SRCN
#_0CB11F: #_ENDING_7666: db $18 ; play note C4
#_0CB120: #_ENDING_7667: db $F1, $01 ; set SRCN
#_0CB122: #_ENDING_7669: db $18 ; play note C4
#_0CB123: #_ENDING_766A: db $F5 ; run loop B
#_0CB124: #_ENDING_766B: db $86 ; dur 0x06
#_0CB125: #_ENDING_766C: db $F1, $00 ; set SRCN
#_0CB127: #_ENDING_766E: db $18 ; play note C4
#_0CB128: #_ENDING_766F: db $F1, $01 ; set SRCN
#_0CB12A: #_ENDING_7671: db $18 ; play note C4
#_0CB12B: #_ENDING_7672: db $F1, $00 ; set SRCN
#_0CB12D: #_ENDING_7674: db $18 ; play note C4
#_0CB12E: #_ENDING_7675: db $18 ; play note C4
#_0CB12F: #_ENDING_7676: db $F1, $01 ; set SRCN
#_0CB131: #_ENDING_7678: db $18 ; play note C4
#_0CB132: #_ENDING_7679: db $F1, $00 ; set SRCN
#_0CB134: #_ENDING_767B: db $18 ; play note C4
#_0CB135: #_ENDING_767C: db $F1, $01 ; set SRCN
#_0CB137: #_ENDING_767E: db $18 ; play note C4
#_0CB138: #_ENDING_767F: db $18 ; play note C4
#_0CB139: #_ENDING_7680: db $8A ; dur 0x0A
#_0CB13A: #_ENDING_7681: db $F4, $07 ; set loop point B
#_0CB13C: #_ENDING_7683: db $F1, $00 ; set SRCN
#_0CB13E: #_ENDING_7685: db $18 ; play note C4
#_0CB13F: #_ENDING_7686: db $F1, $01 ; set SRCN
#_0CB141: #_ENDING_7688: db $18 ; play note C4
#_0CB142: #_ENDING_7689: db $F5 ; run loop B
#_0CB143: #_ENDING_768A: db $86 ; dur 0x06
#_0CB144: #_ENDING_768B: db $F1, $00 ; set SRCN
#_0CB146: #_ENDING_768D: db $18 ; play note C4
#_0CB147: #_ENDING_768E: db $F1, $01 ; set SRCN
#_0CB149: #_ENDING_7690: db $18 ; play note C4
#_0CB14A: #_ENDING_7691: db $F1, $00 ; set SRCN
#_0CB14C: #_ENDING_7693: db $18 ; play note C4
#_0CB14D: #_ENDING_7694: db $18 ; play note C4
#_0CB14E: #_ENDING_7695: db $F1, $0A ; set SRCN
#_0CB150: #_ENDING_7697: db $1F ; play note G4
#_0CB151: #_ENDING_7698: db $1F ; play note G4
#_0CB152: #_ENDING_7699: db $1C ; play note E4
#_0CB153: #_ENDING_769A: db $18 ; play note C4
#_0CB154: #_ENDING_769B: db $F8 : dw ENDING_SEGMENT_7661 ; goto location

;===================================================================================================
; 
;===================================================================================================
Epilogue_SPC_Data:
#_0CB157: dw $03AD, $0000

SONG_EPILOGUE:
#_0CB15B: #_EPILOGUE_7800: db $F1, $00 ; Set control
#_0CB15D: #_EPILOGUE_7802: db $00 : dw EPILOGUE_SEGMENT_781B ; Music channel 0
#_0CB160: #_EPILOGUE_7805: db $01 : dw EPILOGUE_SEGMENT_78D6 ; Music channel 1
#_0CB163: #_EPILOGUE_7808: db $02 : dw EPILOGUE_SEGMENT_7974 ; Music channel 2
#_0CB166: #_EPILOGUE_780B: db $03 : dw EPILOGUE_SEGMENT_79FC ; Music channel 3
#_0CB169: #_EPILOGUE_780E: db $04 : dw EPILOGUE_SEGMENT_78C4 ; Music channel 4
#_0CB16C: #_EPILOGUE_7811: db $05 : dw EPILOGUE_SEGMENT_7AA0 ; Music channel 5
#_0CB16F: #_EPILOGUE_7814: db $06 : dw EPILOGUE_SEGMENT_7B89 ; Music channel 6
#_0CB172: #_EPILOGUE_7817: db $07 : dw EPILOGUE_SEGMENT_7B42 ; Music channel 7
#_0CB175: #_EPILOGUE_781A: db $FF ; end of header

EPILOGUE_SEGMENT_781B:
#_0CB176: #_EPILOGUE_781B: db $F2, $54 ; set panning
#_0CB178: #_EPILOGUE_781D: db $F6 : dw EPILOGUE_SEGMENT_782C ; subroutine B
#_0CB17B: #_EPILOGUE_7820: db $F0, $FE, $E8 ; set ADSR
#_0CB17E: #_EPILOGUE_7823: db $F2, $60 ; set panning
#_0CB180: #_EPILOGUE_7825: db $F6 : dw EPILOGUE_SEGMENT_7868 ; subroutine B
#_0CB183: #_EPILOGUE_7828: db $FF ; end track
#_0CB184: #_EPILOGUE_7829: db $F8 : dw EPILOGUE_SEGMENT_7870 ; goto location

EPILOGUE_SEGMENT_782C:
#_0CB187: #_EPILOGUE_782C: db $70 ; vol 0x10
#_0CB188: #_EPILOGUE_782D: db $F0, $FA, $E4 ; set ADSR
#_0CB18B: #_EPILOGUE_7830: db $F1, $08 ; set SRCN
#_0CB18D: #_EPILOGUE_7832: db $FB, $10 ; set note length page
#_0CB18F: #_EPILOGUE_7834: db $8A ; dur 0x0A
#_0CB190: #_EPILOGUE_7835: db $1A ; play note D4
#_0CB191: #_EPILOGUE_7836: db $21 ; play note A4
#_0CB192: #_EPILOGUE_7837: db $24 ; play note C5
#_0CB193: #_EPILOGUE_7838: db $23 ; play note B4
#_0CB194: #_EPILOGUE_7839: db $88 ; dur 0x08
#_0CB195: #_EPILOGUE_783A: db $1F ; play note G4
#_0CB196: #_EPILOGUE_783B: db $1D ; play note F4
#_0CB197: #_EPILOGUE_783C: db $1C ; play note E4
#_0CB198: #_EPILOGUE_783D: db $1D ; play note F4
#_0CB199: #_EPILOGUE_783E: db $8C ; dur 0x0C
#_0CB19A: #_EPILOGUE_783F: db $1F ; play note G4
#_0CB19B: #_EPILOGUE_7840: db $8A ; dur 0x0A
#_0CB19C: #_EPILOGUE_7841: db $1A ; play note D4
#_0CB19D: #_EPILOGUE_7842: db $21 ; play note A4
#_0CB19E: #_EPILOGUE_7843: db $24 ; play note C5
#_0CB19F: #_EPILOGUE_7844: db $88 ; dur 0x08
#_0CB1A0: #_EPILOGUE_7845: db $23 ; play note B4
#_0CB1A1: #_EPILOGUE_7846: db $1F ; play note G4
#_0CB1A2: #_EPILOGUE_7847: db $8C ; dur 0x0C
#_0CB1A3: #_EPILOGUE_7848: db $21 ; play note A4
#_0CB1A4: #_EPILOGUE_7849: db $8A ; dur 0x0A
#_0CB1A5: #_EPILOGUE_784A: db $1A ; play note D4
#_0CB1A6: #_EPILOGUE_784B: db $21 ; play note A4
#_0CB1A7: #_EPILOGUE_784C: db $24 ; play note C5
#_0CB1A8: #_EPILOGUE_784D: db $23 ; play note B4
#_0CB1A9: #_EPILOGUE_784E: db $88 ; dur 0x08
#_0CB1AA: #_EPILOGUE_784F: db $1F ; play note G4
#_0CB1AB: #_EPILOGUE_7850: db $1D ; play note F4
#_0CB1AC: #_EPILOGUE_7851: db $1C ; play note E4
#_0CB1AD: #_EPILOGUE_7852: db $1D ; play note F4
#_0CB1AE: #_EPILOGUE_7853: db $8C ; dur 0x0C
#_0CB1AF: #_EPILOGUE_7854: db $1F ; play note G4
#_0CB1B0: #_EPILOGUE_7855: db $88 ; dur 0x08
#_0CB1B1: #_EPILOGUE_7856: db $1D ; play note F4
#_0CB1B2: #_EPILOGUE_7857: db $1F ; play note G4
#_0CB1B3: #_EPILOGUE_7858: db $8A ; dur 0x0A
#_0CB1B4: #_EPILOGUE_7859: db $1D ; play note F4
#_0CB1B5: #_EPILOGUE_785A: db $88 ; dur 0x08
#_0CB1B6: #_EPILOGUE_785B: db $1C ; play note E4
#_0CB1B7: #_EPILOGUE_785C: db $1A ; play note D4
#_0CB1B8: #_EPILOGUE_785D: db $F0, $FA, $F2 ; set ADSR
#_0CB1BB: #_EPILOGUE_7860: db $8A ; dur 0x0A
#_0CB1BC: #_EPILOGUE_7861: db $18 ; play note C4
#_0CB1BD: #_EPILOGUE_7862: db $F0, $FA, $E4 ; set ADSR
#_0CB1C0: #_EPILOGUE_7865: db $8D ; dur 0x0D
#_0CB1C1: #_EPILOGUE_7866: db $1A ; play note D4
#_0CB1C2: #_EPILOGUE_7867: db $F7 ; return from routine B

EPILOGUE_SEGMENT_7868:
#_0CB1C3: #_EPILOGUE_7868: db $8D ; dur 0x0D
#_0CB1C4: #_EPILOGUE_7869: db $30 ; rest
#_0CB1C5: #_EPILOGUE_786A: db $30 ; rest
#_0CB1C6: #_EPILOGUE_786B: db $30 ; rest
#_0CB1C7: #_EPILOGUE_786C: db $8C ; dur 0x0C
#_0CB1C8: #_EPILOGUE_786D: db $30 ; rest
#_0CB1C9: #_EPILOGUE_786E: db $F1, $0B ; set SRCN

EPILOGUE_SEGMENT_7870:
#_0CB1CB: #_EPILOGUE_7870: db $8A ; dur 0x0A
#_0CB1CC: #_EPILOGUE_7871: db $1A ; play note D4
#_0CB1CD: #_EPILOGUE_7872: db $21 ; play note A4
#_0CB1CE: #_EPILOGUE_7873: db $24 ; play note C5
#_0CB1CF: #_EPILOGUE_7874: db $88 ; dur 0x08
#_0CB1D0: #_EPILOGUE_7875: db $23 ; play note B4
#_0CB1D1: #_EPILOGUE_7876: db $1F ; play note G4
#_0CB1D2: #_EPILOGUE_7877: db $8C ; dur 0x0C
#_0CB1D3: #_EPILOGUE_7878: db $21 ; play note A4
#_0CB1D4: #_EPILOGUE_7879: db $8A ; dur 0x0A
#_0CB1D5: #_EPILOGUE_787A: db $1A ; play note D4
#_0CB1D6: #_EPILOGUE_787B: db $21 ; play note A4
#_0CB1D7: #_EPILOGUE_787C: db $24 ; play note C5
#_0CB1D8: #_EPILOGUE_787D: db $88 ; dur 0x08
#_0CB1D9: #_EPILOGUE_787E: db $26 ; play note D5
#_0CB1DA: #_EPILOGUE_787F: db $24 ; play note C5
#_0CB1DB: #_EPILOGUE_7880: db $8C ; dur 0x0C
#_0CB1DC: #_EPILOGUE_7881: db $23 ; play note B4
#_0CB1DD: #_EPILOGUE_7882: db $8A ; dur 0x0A
#_0CB1DE: #_EPILOGUE_7883: db $1A ; play note D4
#_0CB1DF: #_EPILOGUE_7884: db $21 ; play note A4
#_0CB1E0: #_EPILOGUE_7885: db $24 ; play note C5
#_0CB1E1: #_EPILOGUE_7886: db $88 ; dur 0x08
#_0CB1E2: #_EPILOGUE_7887: db $23 ; play note B4
#_0CB1E3: #_EPILOGUE_7888: db $1F ; play note G4
#_0CB1E4: #_EPILOGUE_7889: db $8C ; dur 0x0C
#_0CB1E5: #_EPILOGUE_788A: db $21 ; play note A4
#_0CB1E6: #_EPILOGUE_788B: db $88 ; dur 0x08
#_0CB1E7: #_EPILOGUE_788C: db $1F ; play note G4
#_0CB1E8: #_EPILOGUE_788D: db $21 ; play note A4
#_0CB1E9: #_EPILOGUE_788E: db $1F ; play note G4
#_0CB1EA: #_EPILOGUE_788F: db $31 ; tie
#_0CB1EB: #_EPILOGUE_7890: db $1D ; play note F4
#_0CB1EC: #_EPILOGUE_7891: db $1C ; play note E4
#_0CB1ED: #_EPILOGUE_7892: db $1A ; play note D4
#_0CB1EE: #_EPILOGUE_7893: db $18 ; play note C4
#_0CB1EF: #_EPILOGUE_7894: db $8D ; dur 0x0D
#_0CB1F0: #_EPILOGUE_7895: db $1A ; play note D4
#_0CB1F1: #_EPILOGUE_7896: db $88 ; dur 0x08
#_0CB1F2: #_EPILOGUE_7897: db $1A ; play note D4
#_0CB1F3: #_EPILOGUE_7898: db $1D ; play note F4
#_0CB1F4: #_EPILOGUE_7899: db $21 ; play note A4
#_0CB1F5: #_EPILOGUE_789A: db $24 ; play note C5
#_0CB1F6: #_EPILOGUE_789B: db $23 ; play note B4
#_0CB1F7: #_EPILOGUE_789C: db $21 ; play note A4
#_0CB1F8: #_EPILOGUE_789D: db $1F ; play note G4
#_0CB1F9: #_EPILOGUE_789E: db $31 ; tie
#_0CB1FA: #_EPILOGUE_789F: db $8C ; dur 0x0C
#_0CB1FB: #_EPILOGUE_78A0: db $1C ; play note E4
#_0CB1FC: #_EPILOGUE_78A1: db $88 ; dur 0x08
#_0CB1FD: #_EPILOGUE_78A2: db $1A ; play note D4
#_0CB1FE: #_EPILOGUE_78A3: db $1D ; play note F4
#_0CB1FF: #_EPILOGUE_78A4: db $21 ; play note A4
#_0CB200: #_EPILOGUE_78A5: db $24 ; play note C5
#_0CB201: #_EPILOGUE_78A6: db $26 ; play note D5
#_0CB202: #_EPILOGUE_78A7: db $24 ; play note C5
#_0CB203: #_EPILOGUE_78A8: db $8A ; dur 0x0A
#_0CB204: #_EPILOGUE_78A9: db $23 ; play note B4
#_0CB205: #_EPILOGUE_78AA: db $1F ; play note G4
#_0CB206: #_EPILOGUE_78AB: db $88 ; dur 0x08
#_0CB207: #_EPILOGUE_78AC: db $1D ; play note F4
#_0CB208: #_EPILOGUE_78AD: db $1F ; play note G4
#_0CB209: #_EPILOGUE_78AE: db $21 ; play note A4
#_0CB20A: #_EPILOGUE_78AF: db $1A ; play note D4
#_0CB20B: #_EPILOGUE_78B0: db $1D ; play note F4
#_0CB20C: #_EPILOGUE_78B1: db $24 ; play note C5
#_0CB20D: #_EPILOGUE_78B2: db $23 ; play note B4
#_0CB20E: #_EPILOGUE_78B3: db $1F ; play note G4
#_0CB20F: #_EPILOGUE_78B4: db $21 ; play note A4
#_0CB210: #_EPILOGUE_78B5: db $1A ; play note D4
#_0CB211: #_EPILOGUE_78B6: db $8A ; dur 0x0A
#_0CB212: #_EPILOGUE_78B7: db $1D ; play note F4
#_0CB213: #_EPILOGUE_78B8: db $1F ; play note G4
#_0CB214: #_EPILOGUE_78B9: db $1D ; play note F4
#_0CB215: #_EPILOGUE_78BA: db $21 ; play note A4
#_0CB216: #_EPILOGUE_78BB: db $88 ; dur 0x08
#_0CB217: #_EPILOGUE_78BC: db $24 ; play note C5
#_0CB218: #_EPILOGUE_78BD: db $23 ; play note B4
#_0CB219: #_EPILOGUE_78BE: db $8C ; dur 0x0C
#_0CB21A: #_EPILOGUE_78BF: db $21 ; play note A4
#_0CB21B: #_EPILOGUE_78C0: db $F8 : dw EPILOGUE_SEGMENT_7870 ; goto location

EPILOGUE_UNUSED_BYTE_78C3: ; unreachable
#_0CB21E: #_EPILOGUE_78C3: db $F7

EPILOGUE_SEGMENT_78C4:
#_0CB21F: #_EPILOGUE_78C4: db $87 ; dur 0x07
#_0CB220: #_EPILOGUE_78C5: db $30 ; rest
#_0CB221: #_EPILOGUE_78C6: db $F2, $68 ; set panning
#_0CB223: #_EPILOGUE_78C8: db $F9, $20 ; set fine tuning
#_0CB225: #_EPILOGUE_78CA: db $F6 : dw EPILOGUE_SEGMENT_782C ; subroutine B
#_0CB228: #_EPILOGUE_78CD: db $F0, $FD, $E8 ; set ADSR
#_0CB22B: #_EPILOGUE_78D0: db $F2, $70 ; set panning
#_0CB22D: #_EPILOGUE_78D2: db $F6 : dw EPILOGUE_SEGMENT_7868 ; subroutine B
#_0CB230: #_EPILOGUE_78D5: db $FF ; end track

EPILOGUE_SEGMENT_78D6:
#_0CB231: #_EPILOGUE_78D6: db $72 ; vol 0x12
#_0CB232: #_EPILOGUE_78D7: db $F6 : dw EPILOGUE_SEGMENT_7952 ; subroutine B
#_0CB235: #_EPILOGUE_78DA: db $F0, $FE, $EB ; set ADSR
#_0CB238: #_EPILOGUE_78DD: db $F1, $0A ; set SRCN
#_0CB23A: #_EPILOGUE_78DF: db $F2, $60 ; set panning
#_0CB23C: #_EPILOGUE_78E1: db $88 ; dur 0x08
#_0CB23D: #_EPILOGUE_78E2: db $F4, $02 ; set loop point B
#_0CB23F: #_EPILOGUE_78E4: db $1A ; play note D4
#_0CB240: #_EPILOGUE_78E5: db $31 ; tie
#_0CB241: #_EPILOGUE_78E6: db $31 ; tie
#_0CB242: #_EPILOGUE_78E7: db $1D ; play note F4
#_0CB243: #_EPILOGUE_78E8: db $31 ; tie
#_0CB244: #_EPILOGUE_78E9: db $31 ; tie
#_0CB245: #_EPILOGUE_78EA: db $18 ; play note C4
#_0CB246: #_EPILOGUE_78EB: db $31 ; tie
#_0CB247: #_EPILOGUE_78EC: db $31 ; tie
#_0CB248: #_EPILOGUE_78ED: db $31 ; tie
#_0CB249: #_EPILOGUE_78EE: db $31 ; tie
#_0CB24A: #_EPILOGUE_78EF: db $31 ; tie
#_0CB24B: #_EPILOGUE_78F0: db $F5 ; run loop B

EPILOGUE_SEGMENT_78F1:
#_0CB24C: #_EPILOGUE_78F1: db $1A ; play note D4
#_0CB24D: #_EPILOGUE_78F2: db $31 ; tie
#_0CB24E: #_EPILOGUE_78F3: db $31 ; tie
#_0CB24F: #_EPILOGUE_78F4: db $1D ; play note F4
#_0CB250: #_EPILOGUE_78F5: db $31 ; tie
#_0CB251: #_EPILOGUE_78F6: db $31 ; tie
#_0CB252: #_EPILOGUE_78F7: db $21 ; play note A4
#_0CB253: #_EPILOGUE_78F8: db $31 ; tie
#_0CB254: #_EPILOGUE_78F9: db $31 ; tie
#_0CB255: #_EPILOGUE_78FA: db $21 ; play note A4
#_0CB256: #_EPILOGUE_78FB: db $31 ; tie
#_0CB257: #_EPILOGUE_78FC: db $31 ; tie
#_0CB258: #_EPILOGUE_78FD: db $1A ; play note D4
#_0CB259: #_EPILOGUE_78FE: db $31 ; tie
#_0CB25A: #_EPILOGUE_78FF: db $31 ; tie
#_0CB25B: #_EPILOGUE_7900: db $1D ; play note F4
#_0CB25C: #_EPILOGUE_7901: db $31 ; tie
#_0CB25D: #_EPILOGUE_7902: db $31 ; tie
#_0CB25E: #_EPILOGUE_7903: db $18 ; play note C4
#_0CB25F: #_EPILOGUE_7904: db $31 ; tie
#_0CB260: #_EPILOGUE_7905: db $31 ; tie
#_0CB261: #_EPILOGUE_7906: db $31 ; tie
#_0CB262: #_EPILOGUE_7907: db $31 ; tie
#_0CB263: #_EPILOGUE_7908: db $31 ; tie
#_0CB264: #_EPILOGUE_7909: db $1A ; play note D4
#_0CB265: #_EPILOGUE_790A: db $31 ; tie
#_0CB266: #_EPILOGUE_790B: db $31 ; tie
#_0CB267: #_EPILOGUE_790C: db $1D ; play note F4
#_0CB268: #_EPILOGUE_790D: db $31 ; tie
#_0CB269: #_EPILOGUE_790E: db $31 ; tie
#_0CB26A: #_EPILOGUE_790F: db $21 ; play note A4
#_0CB26B: #_EPILOGUE_7910: db $31 ; tie
#_0CB26C: #_EPILOGUE_7911: db $31 ; tie
#_0CB26D: #_EPILOGUE_7912: db $21 ; play note A4
#_0CB26E: #_EPILOGUE_7913: db $31 ; tie
#_0CB26F: #_EPILOGUE_7914: db $31 ; tie
#_0CB270: #_EPILOGUE_7915: db $1A ; play note D4
#_0CB271: #_EPILOGUE_7916: db $31 ; tie
#_0CB272: #_EPILOGUE_7917: db $31 ; tie
#_0CB273: #_EPILOGUE_7918: db $1D ; play note F4
#_0CB274: #_EPILOGUE_7919: db $31 ; tie
#_0CB275: #_EPILOGUE_791A: db $31 ; tie
#_0CB276: #_EPILOGUE_791B: db $1A ; play note D4
#_0CB277: #_EPILOGUE_791C: db $31 ; tie
#_0CB278: #_EPILOGUE_791D: db $8C ; dur 0x0C
#_0CB279: #_EPILOGUE_791E: db $31 ; tie
#_0CB27A: #_EPILOGUE_791F: db $88 ; dur 0x08
#_0CB27B: #_EPILOGUE_7920: db $1A ; play note D4
#_0CB27C: #_EPILOGUE_7921: db $31 ; tie
#_0CB27D: #_EPILOGUE_7922: db $31 ; tie
#_0CB27E: #_EPILOGUE_7923: db $1D ; play note F4
#_0CB27F: #_EPILOGUE_7924: db $31 ; tie
#_0CB280: #_EPILOGUE_7925: db $31 ; tie
#_0CB281: #_EPILOGUE_7926: db $21 ; play note A4
#_0CB282: #_EPILOGUE_7927: db $31 ; tie
#_0CB283: #_EPILOGUE_7928: db $31 ; tie
#_0CB284: #_EPILOGUE_7929: db $21 ; play note A4
#_0CB285: #_EPILOGUE_792A: db $31 ; tie
#_0CB286: #_EPILOGUE_792B: db $31 ; tie
#_0CB287: #_EPILOGUE_792C: db $1A ; play note D4
#_0CB288: #_EPILOGUE_792D: db $31 ; tie
#_0CB289: #_EPILOGUE_792E: db $31 ; tie
#_0CB28A: #_EPILOGUE_792F: db $1D ; play note F4
#_0CB28B: #_EPILOGUE_7930: db $31 ; tie
#_0CB28C: #_EPILOGUE_7931: db $31 ; tie
#_0CB28D: #_EPILOGUE_7932: db $18 ; play note C4
#_0CB28E: #_EPILOGUE_7933: db $31 ; tie
#_0CB28F: #_EPILOGUE_7934: db $31 ; tie
#_0CB290: #_EPILOGUE_7935: db $31 ; tie
#_0CB291: #_EPILOGUE_7936: db $31 ; tie
#_0CB292: #_EPILOGUE_7937: db $31 ; tie
#_0CB293: #_EPILOGUE_7938: db $1A ; play note D4
#_0CB294: #_EPILOGUE_7939: db $31 ; tie
#_0CB295: #_EPILOGUE_793A: db $31 ; tie
#_0CB296: #_EPILOGUE_793B: db $1D ; play note F4
#_0CB297: #_EPILOGUE_793C: db $31 ; tie
#_0CB298: #_EPILOGUE_793D: db $31 ; tie
#_0CB299: #_EPILOGUE_793E: db $21 ; play note A4
#_0CB29A: #_EPILOGUE_793F: db $31 ; tie
#_0CB29B: #_EPILOGUE_7940: db $31 ; tie
#_0CB29C: #_EPILOGUE_7941: db $21 ; play note A4
#_0CB29D: #_EPILOGUE_7942: db $31 ; tie
#_0CB29E: #_EPILOGUE_7943: db $31 ; tie
#_0CB29F: #_EPILOGUE_7944: db $1A ; play note D4
#_0CB2A0: #_EPILOGUE_7945: db $31 ; tie
#_0CB2A1: #_EPILOGUE_7946: db $31 ; tie
#_0CB2A2: #_EPILOGUE_7947: db $1D ; play note F4
#_0CB2A3: #_EPILOGUE_7948: db $31 ; tie
#_0CB2A4: #_EPILOGUE_7949: db $31 ; tie
#_0CB2A5: #_EPILOGUE_794A: db $19 ; play note Cs4
#_0CB2A6: #_EPILOGUE_794B: db $31 ; tie
#_0CB2A7: #_EPILOGUE_794C: db $8C ; dur 0x0C
#_0CB2A8: #_EPILOGUE_794D: db $31 ; tie
#_0CB2A9: #_EPILOGUE_794E: db $88 ; dur 0x08
#_0CB2AA: #_EPILOGUE_794F: db $F8 : dw EPILOGUE_SEGMENT_78F1 ; goto location

EPILOGUE_SEGMENT_7952:
#_0CB2AD: #_EPILOGUE_7952: db $F0, $FA, $E4 ; set ADSR
#_0CB2B0: #_EPILOGUE_7955: db $F1, $09 ; set SRCN
#_0CB2B2: #_EPILOGUE_7957: db $F2, $68 ; set panning
#_0CB2B4: #_EPILOGUE_7959: db $FB, $10 ; set note length page
#_0CB2B6: #_EPILOGUE_795B: db $8A ; dur 0x0A
#_0CB2B7: #_EPILOGUE_795C: db $30 ; rest
#_0CB2B8: #_EPILOGUE_795D: db $8C ; dur 0x0C
#_0CB2B9: #_EPILOGUE_795E: db $24 ; play note C5
#_0CB2BA: #_EPILOGUE_795F: db $23 ; play note B4
#_0CB2BB: #_EPILOGUE_7960: db $21 ; play note A4
#_0CB2BC: #_EPILOGUE_7961: db $23 ; play note B4
#_0CB2BD: #_EPILOGUE_7962: db $24 ; play note C5
#_0CB2BE: #_EPILOGUE_7963: db $8A ; dur 0x0A
#_0CB2BF: #_EPILOGUE_7964: db $23 ; play note B4
#_0CB2C0: #_EPILOGUE_7965: db $8D ; dur 0x0D
#_0CB2C1: #_EPILOGUE_7966: db $21 ; play note A4
#_0CB2C2: #_EPILOGUE_7967: db $8C ; dur 0x0C
#_0CB2C3: #_EPILOGUE_7968: db $24 ; play note C5
#_0CB2C4: #_EPILOGUE_7969: db $23 ; play note B4
#_0CB2C5: #_EPILOGUE_796A: db $21 ; play note A4
#_0CB2C6: #_EPILOGUE_796B: db $23 ; play note B4
#_0CB2C7: #_EPILOGUE_796C: db $21 ; play note A4
#_0CB2C8: #_EPILOGUE_796D: db $8A ; dur 0x0A
#_0CB2C9: #_EPILOGUE_796E: db $1F ; play note G4
#_0CB2CA: #_EPILOGUE_796F: db $8C ; dur 0x0C
#_0CB2CB: #_EPILOGUE_7970: db $21 ; play note A4
#_0CB2CC: #_EPILOGUE_7971: db $8A ; dur 0x0A
#_0CB2CD: #_EPILOGUE_7972: db $31 ; tie
#_0CB2CE: #_EPILOGUE_7973: db $F7 ; return from routine B

EPILOGUE_SEGMENT_7974:
#_0CB2CF: #_EPILOGUE_7974: db $62 ; vol 0x02
#_0CB2D0: #_EPILOGUE_7975: db $F9, $20 ; set fine tuning
#_0CB2D2: #_EPILOGUE_7977: db $F6 : dw EPILOGUE_SEGMENT_7952 ; subroutine B
#_0CB2D5: #_EPILOGUE_797A: db $F0, $FE, $EB ; set ADSR
#_0CB2D8: #_EPILOGUE_797D: db $F1, $0A ; set SRCN
#_0CB2DA: #_EPILOGUE_797F: db $F2, $60 ; set panning
#_0CB2DC: #_EPILOGUE_7981: db $88 ; dur 0x08
#_0CB2DD: #_EPILOGUE_7982: db $30 ; rest
#_0CB2DE: #_EPILOGUE_7983: db $1D ; play note F4
#_0CB2DF: #_EPILOGUE_7984: db $31 ; tie
#_0CB2E0: #_EPILOGUE_7985: db $31 ; tie
#_0CB2E1: #_EPILOGUE_7986: db $21 ; play note A4
#_0CB2E2: #_EPILOGUE_7987: db $31 ; tie
#_0CB2E3: #_EPILOGUE_7988: db $31 ; tie
#_0CB2E4: #_EPILOGUE_7989: db $1C ; play note E4
#_0CB2E5: #_EPILOGUE_798A: db $31 ; tie
#_0CB2E6: #_EPILOGUE_798B: db $31 ; tie
#_0CB2E7: #_EPILOGUE_798C: db $31 ; tie
#_0CB2E8: #_EPILOGUE_798D: db $31 ; tie
#_0CB2E9: #_EPILOGUE_798E: db $31 ; tie
#_0CB2EA: #_EPILOGUE_798F: db $1D ; play note F4
#_0CB2EB: #_EPILOGUE_7990: db $31 ; tie
#_0CB2EC: #_EPILOGUE_7991: db $31 ; tie
#_0CB2ED: #_EPILOGUE_7992: db $21 ; play note A4
#_0CB2EE: #_EPILOGUE_7993: db $31 ; tie
#_0CB2EF: #_EPILOGUE_7994: db $31 ; tie
#_0CB2F0: #_EPILOGUE_7995: db $1C ; play note E4
#_0CB2F1: #_EPILOGUE_7996: db $31 ; tie
#_0CB2F2: #_EPILOGUE_7997: db $31 ; tie
#_0CB2F3: #_EPILOGUE_7998: db $31 ; tie
#_0CB2F4: #_EPILOGUE_7999: db $31 ; tie

EPILOGUE_SEGMENT_799A:
#_0CB2F5: #_EPILOGUE_799A: db $31 ; tie
#_0CB2F6: #_EPILOGUE_799B: db $1D ; play note F4
#_0CB2F7: #_EPILOGUE_799C: db $31 ; tie
#_0CB2F8: #_EPILOGUE_799D: db $31 ; tie
#_0CB2F9: #_EPILOGUE_799E: db $23 ; play note B4
#_0CB2FA: #_EPILOGUE_799F: db $31 ; tie
#_0CB2FB: #_EPILOGUE_79A0: db $31 ; tie
#_0CB2FC: #_EPILOGUE_79A1: db $1A ; play note D4
#_0CB2FD: #_EPILOGUE_79A2: db $31 ; tie
#_0CB2FE: #_EPILOGUE_79A3: db $31 ; tie
#_0CB2FF: #_EPILOGUE_79A4: db $24 ; play note C5
#_0CB300: #_EPILOGUE_79A5: db $31 ; tie
#_0CB301: #_EPILOGUE_79A6: db $31 ; tie
#_0CB302: #_EPILOGUE_79A7: db $1D ; play note F4
#_0CB303: #_EPILOGUE_79A8: db $31 ; tie
#_0CB304: #_EPILOGUE_79A9: db $31 ; tie
#_0CB305: #_EPILOGUE_79AA: db $21 ; play note A4
#_0CB306: #_EPILOGUE_79AB: db $31 ; tie
#_0CB307: #_EPILOGUE_79AC: db $31 ; tie
#_0CB308: #_EPILOGUE_79AD: db $1C ; play note E4
#_0CB309: #_EPILOGUE_79AE: db $31 ; tie
#_0CB30A: #_EPILOGUE_79AF: db $31 ; tie
#_0CB30B: #_EPILOGUE_79B0: db $31 ; tie
#_0CB30C: #_EPILOGUE_79B1: db $31 ; tie
#_0CB30D: #_EPILOGUE_79B2: db $31 ; tie
#_0CB30E: #_EPILOGUE_79B3: db $1D ; play note F4
#_0CB30F: #_EPILOGUE_79B4: db $31 ; tie
#_0CB310: #_EPILOGUE_79B5: db $31 ; tie
#_0CB311: #_EPILOGUE_79B6: db $23 ; play note B4
#_0CB312: #_EPILOGUE_79B7: db $31 ; tie
#_0CB313: #_EPILOGUE_79B8: db $31 ; tie
#_0CB314: #_EPILOGUE_79B9: db $1A ; play note D4
#_0CB315: #_EPILOGUE_79BA: db $31 ; tie
#_0CB316: #_EPILOGUE_79BB: db $31 ; tie
#_0CB317: #_EPILOGUE_79BC: db $24 ; play note C5
#_0CB318: #_EPILOGUE_79BD: db $31 ; tie
#_0CB319: #_EPILOGUE_79BE: db $31 ; tie
#_0CB31A: #_EPILOGUE_79BF: db $1D ; play note F4
#_0CB31B: #_EPILOGUE_79C0: db $31 ; tie
#_0CB31C: #_EPILOGUE_79C1: db $31 ; tie
#_0CB31D: #_EPILOGUE_79C2: db $1F ; play note G4
#_0CB31E: #_EPILOGUE_79C3: db $31 ; tie
#_0CB31F: #_EPILOGUE_79C4: db $31 ; tie
#_0CB320: #_EPILOGUE_79C5: db $1D ; play note F4
#_0CB321: #_EPILOGUE_79C6: db $8C ; dur 0x0C
#_0CB322: #_EPILOGUE_79C7: db $31 ; tie
#_0CB323: #_EPILOGUE_79C8: db $88 ; dur 0x08
#_0CB324: #_EPILOGUE_79C9: db $31 ; tie
#_0CB325: #_EPILOGUE_79CA: db $1D ; play note F4
#_0CB326: #_EPILOGUE_79CB: db $31 ; tie
#_0CB327: #_EPILOGUE_79CC: db $31 ; tie
#_0CB328: #_EPILOGUE_79CD: db $23 ; play note B4
#_0CB329: #_EPILOGUE_79CE: db $31 ; tie
#_0CB32A: #_EPILOGUE_79CF: db $31 ; tie
#_0CB32B: #_EPILOGUE_79D0: db $1A ; play note D4
#_0CB32C: #_EPILOGUE_79D1: db $31 ; tie
#_0CB32D: #_EPILOGUE_79D2: db $31 ; tie
#_0CB32E: #_EPILOGUE_79D3: db $24 ; play note C5
#_0CB32F: #_EPILOGUE_79D4: db $31 ; tie
#_0CB330: #_EPILOGUE_79D5: db $31 ; tie
#_0CB331: #_EPILOGUE_79D6: db $1D ; play note F4
#_0CB332: #_EPILOGUE_79D7: db $31 ; tie
#_0CB333: #_EPILOGUE_79D8: db $31 ; tie
#_0CB334: #_EPILOGUE_79D9: db $21 ; play note A4
#_0CB335: #_EPILOGUE_79DA: db $31 ; tie
#_0CB336: #_EPILOGUE_79DB: db $31 ; tie
#_0CB337: #_EPILOGUE_79DC: db $1C ; play note E4
#_0CB338: #_EPILOGUE_79DD: db $31 ; tie
#_0CB339: #_EPILOGUE_79DE: db $31 ; tie
#_0CB33A: #_EPILOGUE_79DF: db $31 ; tie
#_0CB33B: #_EPILOGUE_79E0: db $31 ; tie
#_0CB33C: #_EPILOGUE_79E1: db $31 ; tie
#_0CB33D: #_EPILOGUE_79E2: db $1D ; play note F4
#_0CB33E: #_EPILOGUE_79E3: db $31 ; tie
#_0CB33F: #_EPILOGUE_79E4: db $31 ; tie
#_0CB340: #_EPILOGUE_79E5: db $23 ; play note B4
#_0CB341: #_EPILOGUE_79E6: db $31 ; tie
#_0CB342: #_EPILOGUE_79E7: db $31 ; tie
#_0CB343: #_EPILOGUE_79E8: db $1A ; play note D4
#_0CB344: #_EPILOGUE_79E9: db $31 ; tie
#_0CB345: #_EPILOGUE_79EA: db $31 ; tie
#_0CB346: #_EPILOGUE_79EB: db $24 ; play note C5
#_0CB347: #_EPILOGUE_79EC: db $31 ; tie
#_0CB348: #_EPILOGUE_79ED: db $31 ; tie
#_0CB349: #_EPILOGUE_79EE: db $1D ; play note F4
#_0CB34A: #_EPILOGUE_79EF: db $31 ; tie
#_0CB34B: #_EPILOGUE_79F0: db $31 ; tie
#_0CB34C: #_EPILOGUE_79F1: db $1F ; play note G4
#_0CB34D: #_EPILOGUE_79F2: db $31 ; tie
#_0CB34E: #_EPILOGUE_79F3: db $31 ; tie
#_0CB34F: #_EPILOGUE_79F4: db $1D ; play note F4
#_0CB350: #_EPILOGUE_79F5: db $8C ; dur 0x0C
#_0CB351: #_EPILOGUE_79F6: db $21 ; play note A4
#_0CB352: #_EPILOGUE_79F7: db $88 ; dur 0x08
#_0CB353: #_EPILOGUE_79F8: db $F8 : dw EPILOGUE_SEGMENT_799A ; goto location
#_0CB356: #_EPILOGUE_79FB: db $FF ; end track

EPILOGUE_SEGMENT_79FC:
#_0CB357: #_EPILOGUE_79FC: db $71 ; vol 0x11
#_0CB358: #_EPILOGUE_79FD: db $F0, $FA, $E4 ; set ADSR
#_0CB35B: #_EPILOGUE_7A00: db $F1, $09 ; set SRCN
#_0CB35D: #_EPILOGUE_7A02: db $F2, $66 ; set panning
#_0CB35F: #_EPILOGUE_7A04: db $FB, $10 ; set note length page
#_0CB361: #_EPILOGUE_7A06: db $8A ; dur 0x0A
#_0CB362: #_EPILOGUE_7A07: db $30 ; rest
#_0CB363: #_EPILOGUE_7A08: db $8C ; dur 0x0C
#_0CB364: #_EPILOGUE_7A09: db $21 ; play note A4
#_0CB365: #_EPILOGUE_7A0A: db $1F ; play note G4
#_0CB366: #_EPILOGUE_7A0B: db $1D ; play note F4
#_0CB367: #_EPILOGUE_7A0C: db $1F ; play note G4
#_0CB368: #_EPILOGUE_7A0D: db $21 ; play note A4
#_0CB369: #_EPILOGUE_7A0E: db $8A ; dur 0x0A
#_0CB36A: #_EPILOGUE_7A0F: db $1F ; play note G4
#_0CB36B: #_EPILOGUE_7A10: db $8D ; dur 0x0D
#_0CB36C: #_EPILOGUE_7A11: db $1D ; play note F4
#_0CB36D: #_EPILOGUE_7A12: db $8C ; dur 0x0C
#_0CB36E: #_EPILOGUE_7A13: db $21 ; play note A4
#_0CB36F: #_EPILOGUE_7A14: db $1F ; play note G4
#_0CB370: #_EPILOGUE_7A15: db $1D ; play note F4
#_0CB371: #_EPILOGUE_7A16: db $1F ; play note G4
#_0CB372: #_EPILOGUE_7A17: db $1D ; play note F4
#_0CB373: #_EPILOGUE_7A18: db $8A ; dur 0x0A
#_0CB374: #_EPILOGUE_7A19: db $1C ; play note E4
#_0CB375: #_EPILOGUE_7A1A: db $8C ; dur 0x0C
#_0CB376: #_EPILOGUE_7A1B: db $1D ; play note F4
#_0CB377: #_EPILOGUE_7A1C: db $8A ; dur 0x0A
#_0CB378: #_EPILOGUE_7A1D: db $31 ; tie
#_0CB379: #_EPILOGUE_7A1E: db $F0, $FE, $EC ; set ADSR
#_0CB37C: #_EPILOGUE_7A21: db $F1, $0A ; set SRCN
#_0CB37E: #_EPILOGUE_7A23: db $F2, $60 ; set panning
#_0CB380: #_EPILOGUE_7A25: db $88 ; dur 0x08
#_0CB381: #_EPILOGUE_7A26: db $30 ; rest
#_0CB382: #_EPILOGUE_7A27: db $30 ; rest
#_0CB383: #_EPILOGUE_7A28: db $21 ; play note A4
#_0CB384: #_EPILOGUE_7A29: db $31 ; tie
#_0CB385: #_EPILOGUE_7A2A: db $31 ; tie
#_0CB386: #_EPILOGUE_7A2B: db $1D ; play note F4
#_0CB387: #_EPILOGUE_7A2C: db $31 ; tie
#_0CB388: #_EPILOGUE_7A2D: db $31 ; tie
#_0CB389: #_EPILOGUE_7A2E: db $1F ; play note G4
#_0CB38A: #_EPILOGUE_7A2F: db $31 ; tie
#_0CB38B: #_EPILOGUE_7A30: db $31 ; tie
#_0CB38C: #_EPILOGUE_7A31: db $31 ; tie
#_0CB38D: #_EPILOGUE_7A32: db $31 ; tie
#_0CB38E: #_EPILOGUE_7A33: db $31 ; tie
#_0CB38F: #_EPILOGUE_7A34: db $21 ; play note A4
#_0CB390: #_EPILOGUE_7A35: db $31 ; tie
#_0CB391: #_EPILOGUE_7A36: db $31 ; tie
#_0CB392: #_EPILOGUE_7A37: db $1D ; play note F4
#_0CB393: #_EPILOGUE_7A38: db $31 ; tie
#_0CB394: #_EPILOGUE_7A39: db $31 ; tie
#_0CB395: #_EPILOGUE_7A3A: db $1F ; play note G4
#_0CB396: #_EPILOGUE_7A3B: db $31 ; tie
#_0CB397: #_EPILOGUE_7A3C: db $31 ; tie
#_0CB398: #_EPILOGUE_7A3D: db $31 ; tie

EPILOGUE_SEGMENT_7A3E:
#_0CB399: #_EPILOGUE_7A3E: db $31 ; tie
#_0CB39A: #_EPILOGUE_7A3F: db $31 ; tie
#_0CB39B: #_EPILOGUE_7A40: db $21 ; play note A4
#_0CB39C: #_EPILOGUE_7A41: db $31 ; tie
#_0CB39D: #_EPILOGUE_7A42: db $31 ; tie
#_0CB39E: #_EPILOGUE_7A43: db $21 ; play note A4
#_0CB39F: #_EPILOGUE_7A44: db $31 ; tie
#_0CB3A0: #_EPILOGUE_7A45: db $31 ; tie
#_0CB3A1: #_EPILOGUE_7A46: db $1D ; play note F4
#_0CB3A2: #_EPILOGUE_7A47: db $31 ; tie
#_0CB3A3: #_EPILOGUE_7A48: db $31 ; tie
#_0CB3A4: #_EPILOGUE_7A49: db $23 ; play note B4
#_0CB3A5: #_EPILOGUE_7A4A: db $31 ; tie
#_0CB3A6: #_EPILOGUE_7A4B: db $31 ; tie
#_0CB3A7: #_EPILOGUE_7A4C: db $21 ; play note A4
#_0CB3A8: #_EPILOGUE_7A4D: db $31 ; tie
#_0CB3A9: #_EPILOGUE_7A4E: db $31 ; tie
#_0CB3AA: #_EPILOGUE_7A4F: db $1D ; play note F4
#_0CB3AB: #_EPILOGUE_7A50: db $31 ; tie
#_0CB3AC: #_EPILOGUE_7A51: db $31 ; tie
#_0CB3AD: #_EPILOGUE_7A52: db $1F ; play note G4
#_0CB3AE: #_EPILOGUE_7A53: db $31 ; tie
#_0CB3AF: #_EPILOGUE_7A54: db $31 ; tie
#_0CB3B0: #_EPILOGUE_7A55: db $31 ; tie
#_0CB3B1: #_EPILOGUE_7A56: db $31 ; tie
#_0CB3B2: #_EPILOGUE_7A57: db $31 ; tie
#_0CB3B3: #_EPILOGUE_7A58: db $21 ; play note A4
#_0CB3B4: #_EPILOGUE_7A59: db $31 ; tie
#_0CB3B5: #_EPILOGUE_7A5A: db $31 ; tie
#_0CB3B6: #_EPILOGUE_7A5B: db $21 ; play note A4
#_0CB3B7: #_EPILOGUE_7A5C: db $31 ; tie
#_0CB3B8: #_EPILOGUE_7A5D: db $31 ; tie
#_0CB3B9: #_EPILOGUE_7A5E: db $1D ; play note F4
#_0CB3BA: #_EPILOGUE_7A5F: db $31 ; tie
#_0CB3BB: #_EPILOGUE_7A60: db $31 ; tie
#_0CB3BC: #_EPILOGUE_7A61: db $23 ; play note B4
#_0CB3BD: #_EPILOGUE_7A62: db $31 ; tie
#_0CB3BE: #_EPILOGUE_7A63: db $31 ; tie
#_0CB3BF: #_EPILOGUE_7A64: db $21 ; play note A4
#_0CB3C0: #_EPILOGUE_7A65: db $31 ; tie
#_0CB3C1: #_EPILOGUE_7A66: db $31 ; tie
#_0CB3C2: #_EPILOGUE_7A67: db $1C ; play note E4
#_0CB3C3: #_EPILOGUE_7A68: db $31 ; tie
#_0CB3C4: #_EPILOGUE_7A69: db $31 ; tie
#_0CB3C5: #_EPILOGUE_7A6A: db $8C ; dur 0x0C
#_0CB3C6: #_EPILOGUE_7A6B: db $22 ; play note As4
#_0CB3C7: #_EPILOGUE_7A6C: db $88 ; dur 0x08
#_0CB3C8: #_EPILOGUE_7A6D: db $31 ; tie
#_0CB3C9: #_EPILOGUE_7A6E: db $31 ; tie
#_0CB3CA: #_EPILOGUE_7A6F: db $21 ; play note A4
#_0CB3CB: #_EPILOGUE_7A70: db $31 ; tie
#_0CB3CC: #_EPILOGUE_7A71: db $31 ; tie
#_0CB3CD: #_EPILOGUE_7A72: db $21 ; play note A4
#_0CB3CE: #_EPILOGUE_7A73: db $31 ; tie
#_0CB3CF: #_EPILOGUE_7A74: db $31 ; tie
#_0CB3D0: #_EPILOGUE_7A75: db $1D ; play note F4
#_0CB3D1: #_EPILOGUE_7A76: db $31 ; tie
#_0CB3D2: #_EPILOGUE_7A77: db $31 ; tie
#_0CB3D3: #_EPILOGUE_7A78: db $23 ; play note B4
#_0CB3D4: #_EPILOGUE_7A79: db $31 ; tie
#_0CB3D5: #_EPILOGUE_7A7A: db $31 ; tie
#_0CB3D6: #_EPILOGUE_7A7B: db $21 ; play note A4
#_0CB3D7: #_EPILOGUE_7A7C: db $31 ; tie
#_0CB3D8: #_EPILOGUE_7A7D: db $31 ; tie
#_0CB3D9: #_EPILOGUE_7A7E: db $1D ; play note F4
#_0CB3DA: #_EPILOGUE_7A7F: db $31 ; tie
#_0CB3DB: #_EPILOGUE_7A80: db $31 ; tie
#_0CB3DC: #_EPILOGUE_7A81: db $1F ; play note G4
#_0CB3DD: #_EPILOGUE_7A82: db $31 ; tie
#_0CB3DE: #_EPILOGUE_7A83: db $31 ; tie
#_0CB3DF: #_EPILOGUE_7A84: db $31 ; tie
#_0CB3E0: #_EPILOGUE_7A85: db $31 ; tie
#_0CB3E1: #_EPILOGUE_7A86: db $31 ; tie
#_0CB3E2: #_EPILOGUE_7A87: db $21 ; play note A4
#_0CB3E3: #_EPILOGUE_7A88: db $31 ; tie
#_0CB3E4: #_EPILOGUE_7A89: db $31 ; tie
#_0CB3E5: #_EPILOGUE_7A8A: db $21 ; play note A4
#_0CB3E6: #_EPILOGUE_7A8B: db $31 ; tie
#_0CB3E7: #_EPILOGUE_7A8C: db $31 ; tie
#_0CB3E8: #_EPILOGUE_7A8D: db $1D ; play note F4
#_0CB3E9: #_EPILOGUE_7A8E: db $31 ; tie
#_0CB3EA: #_EPILOGUE_7A8F: db $31 ; tie
#_0CB3EB: #_EPILOGUE_7A90: db $23 ; play note B4
#_0CB3EC: #_EPILOGUE_7A91: db $31 ; tie
#_0CB3ED: #_EPILOGUE_7A92: db $31 ; tie
#_0CB3EE: #_EPILOGUE_7A93: db $21 ; play note A4
#_0CB3EF: #_EPILOGUE_7A94: db $31 ; tie
#_0CB3F0: #_EPILOGUE_7A95: db $31 ; tie
#_0CB3F1: #_EPILOGUE_7A96: db $1C ; play note E4
#_0CB3F2: #_EPILOGUE_7A97: db $31 ; tie
#_0CB3F3: #_EPILOGUE_7A98: db $31 ; tie
#_0CB3F4: #_EPILOGUE_7A99: db $8C ; dur 0x0C
#_0CB3F5: #_EPILOGUE_7A9A: db $21 ; play note A4
#_0CB3F6: #_EPILOGUE_7A9B: db $88 ; dur 0x08
#_0CB3F7: #_EPILOGUE_7A9C: db $F8 : dw EPILOGUE_SEGMENT_7A3E ; goto location
#_0CB3FA: #_EPILOGUE_7A9F: db $FF ; end track

EPILOGUE_SEGMENT_7AA0:
#_0CB3FB: #_EPILOGUE_7AA0: db $70 ; vol 0x10
#_0CB3FC: #_EPILOGUE_7AA1: db $F0, $FA, $E4 ; set ADSR
#_0CB3FF: #_EPILOGUE_7AA4: db $F1, $09 ; set SRCN
#_0CB401: #_EPILOGUE_7AA6: db $F2, $66 ; set panning
#_0CB403: #_EPILOGUE_7AA8: db $FB, $10 ; set note length page
#_0CB405: #_EPILOGUE_7AAA: db $8A ; dur 0x0A
#_0CB406: #_EPILOGUE_7AAB: db $30 ; rest
#_0CB407: #_EPILOGUE_7AAC: db $8C ; dur 0x0C
#_0CB408: #_EPILOGUE_7AAD: db $1A ; play note D4
#_0CB409: #_EPILOGUE_7AAE: db $18 ; play note C4
#_0CB40A: #_EPILOGUE_7AAF: db $15 ; play note A3
#_0CB40B: #_EPILOGUE_7AB0: db $17 ; play note B3
#_0CB40C: #_EPILOGUE_7AB1: db $1A ; play note D4
#_0CB40D: #_EPILOGUE_7AB2: db $8A ; dur 0x0A
#_0CB40E: #_EPILOGUE_7AB3: db $18 ; play note C4
#_0CB40F: #_EPILOGUE_7AB4: db $8D ; dur 0x0D
#_0CB410: #_EPILOGUE_7AB5: db $15 ; play note A3
#_0CB411: #_EPILOGUE_7AB6: db $8C ; dur 0x0C
#_0CB412: #_EPILOGUE_7AB7: db $1A ; play note D4
#_0CB413: #_EPILOGUE_7AB8: db $18 ; play note C4
#_0CB414: #_EPILOGUE_7AB9: db $15 ; play note A3
#_0CB415: #_EPILOGUE_7ABA: db $17 ; play note B3
#_0CB416: #_EPILOGUE_7ABB: db $15 ; play note A3
#_0CB417: #_EPILOGUE_7ABC: db $8A ; dur 0x0A
#_0CB418: #_EPILOGUE_7ABD: db $13 ; play note G3
#_0CB419: #_EPILOGUE_7ABE: db $8C ; dur 0x0C
#_0CB41A: #_EPILOGUE_7ABF: db $15 ; play note A3
#_0CB41B: #_EPILOGUE_7AC0: db $8A ; dur 0x0A
#_0CB41C: #_EPILOGUE_7AC1: db $31 ; tie
#_0CB41D: #_EPILOGUE_7AC2: db $87 ; dur 0x07
#_0CB41E: #_EPILOGUE_7AC3: db $30 ; rest
#_0CB41F: #_EPILOGUE_7AC4: db $F0, $FA, $EC ; set ADSR
#_0CB422: #_EPILOGUE_7AC7: db $F1, $0A ; set SRCN
#_0CB424: #_EPILOGUE_7AC9: db $F2, $6F ; set panning
#_0CB426: #_EPILOGUE_7ACB: db $F9, $20 ; set fine tuning
#_0CB428: #_EPILOGUE_7ACD: db $88 ; dur 0x08
#_0CB429: #_EPILOGUE_7ACE: db $F4, $02 ; set loop point B
#_0CB42B: #_EPILOGUE_7AD0: db $1A ; play note D4
#_0CB42C: #_EPILOGUE_7AD1: db $1D ; play note F4
#_0CB42D: #_EPILOGUE_7AD2: db $21 ; play note A4
#_0CB42E: #_EPILOGUE_7AD3: db $1D ; play note F4
#_0CB42F: #_EPILOGUE_7AD4: db $21 ; play note A4
#_0CB430: #_EPILOGUE_7AD5: db $1D ; play note F4
#_0CB431: #_EPILOGUE_7AD6: db $18 ; play note C4
#_0CB432: #_EPILOGUE_7AD7: db $1C ; play note E4
#_0CB433: #_EPILOGUE_7AD8: db $1F ; play note G4
#_0CB434: #_EPILOGUE_7AD9: db $31 ; tie
#_0CB435: #_EPILOGUE_7ADA: db $31 ; tie
#_0CB436: #_EPILOGUE_7ADB: db $31 ; tie
#_0CB437: #_EPILOGUE_7ADC: db $F5 ; run loop B

EPILOGUE_SEGMENT_7ADD:
#_0CB438: #_EPILOGUE_7ADD: db $1A ; play note D4
#_0CB439: #_EPILOGUE_7ADE: db $1D ; play note F4
#_0CB43A: #_EPILOGUE_7ADF: db $21 ; play note A4
#_0CB43B: #_EPILOGUE_7AE0: db $1D ; play note F4
#_0CB43C: #_EPILOGUE_7AE1: db $23 ; play note B4
#_0CB43D: #_EPILOGUE_7AE2: db $21 ; play note A4
#_0CB43E: #_EPILOGUE_7AE3: db $21 ; play note A4
#_0CB43F: #_EPILOGUE_7AE4: db $1A ; play note D4
#_0CB440: #_EPILOGUE_7AE5: db $1D ; play note F4
#_0CB441: #_EPILOGUE_7AE6: db $21 ; play note A4
#_0CB442: #_EPILOGUE_7AE7: db $24 ; play note C5
#_0CB443: #_EPILOGUE_7AE8: db $23 ; play note B4
#_0CB444: #_EPILOGUE_7AE9: db $1A ; play note D4
#_0CB445: #_EPILOGUE_7AEA: db $1D ; play note F4
#_0CB446: #_EPILOGUE_7AEB: db $21 ; play note A4
#_0CB447: #_EPILOGUE_7AEC: db $1D ; play note F4
#_0CB448: #_EPILOGUE_7AED: db $21 ; play note A4
#_0CB449: #_EPILOGUE_7AEE: db $1D ; play note F4
#_0CB44A: #_EPILOGUE_7AEF: db $18 ; play note C4
#_0CB44B: #_EPILOGUE_7AF0: db $1C ; play note E4
#_0CB44C: #_EPILOGUE_7AF1: db $1F ; play note G4
#_0CB44D: #_EPILOGUE_7AF2: db $31 ; tie
#_0CB44E: #_EPILOGUE_7AF3: db $31 ; tie
#_0CB44F: #_EPILOGUE_7AF4: db $31 ; tie
#_0CB450: #_EPILOGUE_7AF5: db $1A ; play note D4
#_0CB451: #_EPILOGUE_7AF6: db $1D ; play note F4
#_0CB452: #_EPILOGUE_7AF7: db $21 ; play note A4
#_0CB453: #_EPILOGUE_7AF8: db $1D ; play note F4
#_0CB454: #_EPILOGUE_7AF9: db $23 ; play note B4
#_0CB455: #_EPILOGUE_7AFA: db $21 ; play note A4
#_0CB456: #_EPILOGUE_7AFB: db $21 ; play note A4
#_0CB457: #_EPILOGUE_7AFC: db $1A ; play note D4
#_0CB458: #_EPILOGUE_7AFD: db $1D ; play note F4
#_0CB459: #_EPILOGUE_7AFE: db $21 ; play note A4
#_0CB45A: #_EPILOGUE_7AFF: db $24 ; play note C5
#_0CB45B: #_EPILOGUE_7B00: db $23 ; play note B4
#_0CB45C: #_EPILOGUE_7B01: db $1A ; play note D4
#_0CB45D: #_EPILOGUE_7B02: db $1D ; play note F4
#_0CB45E: #_EPILOGUE_7B03: db $21 ; play note A4
#_0CB45F: #_EPILOGUE_7B04: db $1D ; play note F4
#_0CB460: #_EPILOGUE_7B05: db $1F ; play note G4
#_0CB461: #_EPILOGUE_7B06: db $1C ; play note E4
#_0CB462: #_EPILOGUE_7B07: db $1A ; play note D4
#_0CB463: #_EPILOGUE_7B08: db $1D ; play note F4
#_0CB464: #_EPILOGUE_7B09: db $8C ; dur 0x0C
#_0CB465: #_EPILOGUE_7B0A: db $22 ; play note As4
#_0CB466: #_EPILOGUE_7B0B: db $88 ; dur 0x08
#_0CB467: #_EPILOGUE_7B0C: db $1A ; play note D4
#_0CB468: #_EPILOGUE_7B0D: db $1D ; play note F4
#_0CB469: #_EPILOGUE_7B0E: db $21 ; play note A4
#_0CB46A: #_EPILOGUE_7B0F: db $1D ; play note F4
#_0CB46B: #_EPILOGUE_7B10: db $23 ; play note B4
#_0CB46C: #_EPILOGUE_7B11: db $21 ; play note A4
#_0CB46D: #_EPILOGUE_7B12: db $21 ; play note A4
#_0CB46E: #_EPILOGUE_7B13: db $1A ; play note D4
#_0CB46F: #_EPILOGUE_7B14: db $1D ; play note F4
#_0CB470: #_EPILOGUE_7B15: db $21 ; play note A4
#_0CB471: #_EPILOGUE_7B16: db $24 ; play note C5
#_0CB472: #_EPILOGUE_7B17: db $23 ; play note B4
#_0CB473: #_EPILOGUE_7B18: db $1A ; play note D4
#_0CB474: #_EPILOGUE_7B19: db $1D ; play note F4
#_0CB475: #_EPILOGUE_7B1A: db $21 ; play note A4
#_0CB476: #_EPILOGUE_7B1B: db $1D ; play note F4
#_0CB477: #_EPILOGUE_7B1C: db $21 ; play note A4
#_0CB478: #_EPILOGUE_7B1D: db $1D ; play note F4
#_0CB479: #_EPILOGUE_7B1E: db $18 ; play note C4
#_0CB47A: #_EPILOGUE_7B1F: db $1C ; play note E4
#_0CB47B: #_EPILOGUE_7B20: db $1F ; play note G4
#_0CB47C: #_EPILOGUE_7B21: db $31 ; tie
#_0CB47D: #_EPILOGUE_7B22: db $31 ; tie
#_0CB47E: #_EPILOGUE_7B23: db $31 ; tie
#_0CB47F: #_EPILOGUE_7B24: db $1A ; play note D4
#_0CB480: #_EPILOGUE_7B25: db $1D ; play note F4
#_0CB481: #_EPILOGUE_7B26: db $21 ; play note A4
#_0CB482: #_EPILOGUE_7B27: db $1D ; play note F4
#_0CB483: #_EPILOGUE_7B28: db $23 ; play note B4
#_0CB484: #_EPILOGUE_7B29: db $21 ; play note A4
#_0CB485: #_EPILOGUE_7B2A: db $21 ; play note A4
#_0CB486: #_EPILOGUE_7B2B: db $1A ; play note D4
#_0CB487: #_EPILOGUE_7B2C: db $1D ; play note F4
#_0CB488: #_EPILOGUE_7B2D: db $21 ; play note A4
#_0CB489: #_EPILOGUE_7B2E: db $24 ; play note C5
#_0CB48A: #_EPILOGUE_7B2F: db $23 ; play note B4
#_0CB48B: #_EPILOGUE_7B30: db $1A ; play note D4
#_0CB48C: #_EPILOGUE_7B31: db $1D ; play note F4
#_0CB48D: #_EPILOGUE_7B32: db $21 ; play note A4
#_0CB48E: #_EPILOGUE_7B33: db $1D ; play note F4
#_0CB48F: #_EPILOGUE_7B34: db $1F ; play note G4
#_0CB490: #_EPILOGUE_7B35: db $1C ; play note E4
#_0CB491: #_EPILOGUE_7B36: db $19 ; play note Cs4
#_0CB492: #_EPILOGUE_7B37: db $1D ; play note F4
#_0CB493: #_EPILOGUE_7B38: db $8C ; dur 0x0C
#_0CB494: #_EPILOGUE_7B39: db $21 ; play note A4
#_0CB495: #_EPILOGUE_7B3A: db $88 ; dur 0x08
#_0CB496: #_EPILOGUE_7B3B: db $F8 : dw EPILOGUE_SEGMENT_7ADD ; goto location
#_0CB499: #_EPILOGUE_7B3E: db $FF ; end track

EPILOGUE_UNUSED_SEGMENT_7B3F: ; unused segment
#_0CB49A: #_EPILOGUE_7B3F: db $F8 : dw EPILOGUE_SEGMENT_7ADD ; goto location

EPILOGUE_SEGMENT_7B42:
#_0CB49D: #_EPILOGUE_7B42: db $70 ; vol 0x10
#_0CB49E: #_EPILOGUE_7B43: db $F0, $FA, $E4 ; set ADSR
#_0CB4A1: #_EPILOGUE_7B46: db $F1, $08 ; set SRCN
#_0CB4A3: #_EPILOGUE_7B48: db $F2, $58 ; set panning
#_0CB4A5: #_EPILOGUE_7B4A: db $FB, $10 ; set note length page
#_0CB4A7: #_EPILOGUE_7B4C: db $8A ; dur 0x0A
#_0CB4A8: #_EPILOGUE_7B4D: db $30 ; rest
#_0CB4A9: #_EPILOGUE_7B4E: db $8C ; dur 0x0C
#_0CB4AA: #_EPILOGUE_7B4F: db $0E ; play note D3
#_0CB4AB: #_EPILOGUE_7B50: db $13 ; play note G3
#_0CB4AC: #_EPILOGUE_7B51: db $11 ; play note F3
#_0CB4AD: #_EPILOGUE_7B52: db $10 ; play note E3
#_0CB4AE: #_EPILOGUE_7B53: db $0E ; play note D3
#_0CB4AF: #_EPILOGUE_7B54: db $8A ; dur 0x0A
#_0CB4B0: #_EPILOGUE_7B55: db $13 ; play note G3
#_0CB4B1: #_EPILOGUE_7B56: db $11 ; play note F3
#_0CB4B2: #_EPILOGUE_7B57: db $10 ; play note E3
#_0CB4B3: #_EPILOGUE_7B58: db $0A ; play note As2
#_0CB4B4: #_EPILOGUE_7B59: db $8C ; dur 0x0C
#_0CB4B5: #_EPILOGUE_7B5A: db $0E ; play note D3
#_0CB4B6: #_EPILOGUE_7B5B: db $13 ; play note G3
#_0CB4B7: #_EPILOGUE_7B5C: db $11 ; play note F3
#_0CB4B8: #_EPILOGUE_7B5D: db $10 ; play note E3
#_0CB4B9: #_EPILOGUE_7B5E: db $0E ; play note D3
#_0CB4BA: #_EPILOGUE_7B5F: db $8A ; dur 0x0A
#_0CB4BB: #_EPILOGUE_7B60: db $10 ; play note E3
#_0CB4BC: #_EPILOGUE_7B61: db $8C ; dur 0x0C
#_0CB4BD: #_EPILOGUE_7B62: db $0A ; play note As2
#_0CB4BE: #_EPILOGUE_7B63: db $F0, $FE, $E8 ; set ADSR
#_0CB4C1: #_EPILOGUE_7B66: db $F1, $02 ; set SRCN
#_0CB4C3: #_EPILOGUE_7B68: db $F2, $4C ; set panning
#_0CB4C5: #_EPILOGUE_7B6A: db $88 ; dur 0x08
#_0CB4C6: #_EPILOGUE_7B6B: db $1D ; play note F4
#_0CB4C7: #_EPILOGUE_7B6C: db $E3, $F0 ; pitch bend on
#_0CB4C9: #_EPILOGUE_7B6E: db $31 ; tie
#_0CB4CA: #_EPILOGUE_7B6F: db $E2 ; pitch bend off
#_0CB4CB: #_EPILOGUE_7B70: db $8D ; dur 0x0D
#_0CB4CC: #_EPILOGUE_7B71: db $1A ; play note D4
#_0CB4CD: #_EPILOGUE_7B72: db $18 ; play note C4
#_0CB4CE: #_EPILOGUE_7B73: db $1A ; play note D4
#_0CB4CF: #_EPILOGUE_7B74: db $18 ; play note C4

EPILOGUE_SEGMENT_7B75:
#_0CB4D0: #_EPILOGUE_7B75: db $1A ; play note D4
#_0CB4D1: #_EPILOGUE_7B76: db $18 ; play note C4
#_0CB4D2: #_EPILOGUE_7B77: db $1A ; play note D4
#_0CB4D3: #_EPILOGUE_7B78: db $18 ; play note C4
#_0CB4D4: #_EPILOGUE_7B79: db $1A ; play note D4
#_0CB4D5: #_EPILOGUE_7B7A: db $18 ; play note C4
#_0CB4D6: #_EPILOGUE_7B7B: db $1A ; play note D4
#_0CB4D7: #_EPILOGUE_7B7C: db $16 ; play note As3
#_0CB4D8: #_EPILOGUE_7B7D: db $1A ; play note D4
#_0CB4D9: #_EPILOGUE_7B7E: db $18 ; play note C4
#_0CB4DA: #_EPILOGUE_7B7F: db $1A ; play note D4
#_0CB4DB: #_EPILOGUE_7B80: db $18 ; play note C4
#_0CB4DC: #_EPILOGUE_7B81: db $1A ; play note D4
#_0CB4DD: #_EPILOGUE_7B82: db $18 ; play note C4
#_0CB4DE: #_EPILOGUE_7B83: db $1A ; play note D4
#_0CB4DF: #_EPILOGUE_7B84: db $19 ; play note Cs4
#_0CB4E0: #_EPILOGUE_7B85: db $F8 : dw EPILOGUE_SEGMENT_7B75 ; goto location
#_0CB4E3: #_EPILOGUE_7B88: db $FF ; end track

EPILOGUE_SEGMENT_7B89:
#_0CB4E4: #_EPILOGUE_7B89: db $61 ; vol 0x01
#_0CB4E5: #_EPILOGUE_7B8A: db $F0, $FA, $E4 ; set ADSR
#_0CB4E8: #_EPILOGUE_7B8D: db $F1, $09 ; set SRCN
#_0CB4EA: #_EPILOGUE_7B8F: db $F2, $66 ; set panning
#_0CB4EC: #_EPILOGUE_7B91: db $FB, $10 ; set note length page
#_0CB4EE: #_EPILOGUE_7B93: db $8A ; dur 0x0A
#_0CB4EF: #_EPILOGUE_7B94: db $30 ; rest

EPILOGUE_SEGMENT_7B95:
#_0CB4F0: #_EPILOGUE_7B95: db $8C ; dur 0x0C
#_0CB4F1: #_EPILOGUE_7B96: db $1D ; play note F4
#_0CB4F2: #_EPILOGUE_7B97: db $1C ; play note E4
#_0CB4F3: #_EPILOGUE_7B98: db $1A ; play note D4
#_0CB4F4: #_EPILOGUE_7B99: db $1C ; play note E4
#_0CB4F5: #_EPILOGUE_7B9A: db $1D ; play note F4
#_0CB4F6: #_EPILOGUE_7B9B: db $8A ; dur 0x0A
#_0CB4F7: #_EPILOGUE_7B9C: db $1C ; play note E4
#_0CB4F8: #_EPILOGUE_7B9D: db $8D ; dur 0x0D
#_0CB4F9: #_EPILOGUE_7B9E: db $1A ; play note D4
#_0CB4FA: #_EPILOGUE_7B9F: db $8C ; dur 0x0C
#_0CB4FB: #_EPILOGUE_7BA0: db $1D ; play note F4
#_0CB4FC: #_EPILOGUE_7BA1: db $1C ; play note E4
#_0CB4FD: #_EPILOGUE_7BA2: db $1A ; play note D4
#_0CB4FE: #_EPILOGUE_7BA3: db $1C ; play note E4
#_0CB4FF: #_EPILOGUE_7BA4: db $1A ; play note D4
#_0CB500: #_EPILOGUE_7BA5: db $8A ; dur 0x0A
#_0CB501: #_EPILOGUE_7BA6: db $18 ; play note C4
#_0CB502: #_EPILOGUE_7BA7: db $8D ; dur 0x0D
#_0CB503: #_EPILOGUE_7BA8: db $1A ; play note D4
#_0CB504: #_EPILOGUE_7BA9: db $FF ; end track
#_0CB505: #_EPILOGUE_7BAA: db $F8 : dw EPILOGUE_SEGMENT_7B95 ; goto location

;===================================================================================================
; 
;===================================================================================================
InitialAPUData:
#_0CB508: dw $3795
#_0CB50A: dw $0300

incsrc "spc.asm"

EndInitialAPUBanks:
#_0CECA1: dw $0000
#_0CECA3: dw $0300

;===================================================================================================

#_0CECA5: db $26,$2D,$E2,$0B,$D4,$5F,$DF,$74
#_0CECAD: db $FE,$E2,$52,$CC,$EF,$23,$FB,$CF
#_0CECB5: db $74,$0F,$DD,$F2,$1E,$F1,$0E,$03
#_0CECBD: db $2F,$78,$EF,$F0,$42,$AB,$65,$A9
#_0CECC5: db $03,$2E,$78,$EE,$12,$0C,$B2,$3E
#_0CECCD: db $F2,$0C,$C0,$74,$E0,$33,$1F,$FD
#_0CECD5: db $C0,$67,$1A,$B3,$78,$3B,$D2,$2F
#_0CECDD: db $DF,$25,$1F,$0E,$F4,$78,$1B,$E5
#_0CECE5: db $51,$FE,$FE,$13,$20,$12,$74,$1F
#_0CECED: db $02,$20,$EF,$23,$FE,$04,$2F,$74
#_0CECF5: db $14,$2F,$E0,$FF,$F1,$41,$AA,$16
#_0CECFD: db $74,$61,$CC,$F0,$0F,$DF,$43,$CB
#_0CED05: db $02,$64,$EE,$33,$DA,$03,$0D,$BF
#_0CED0D: db $3F,$AF,$78,$2E,$F2,$DC,$34,$EC
#_0CED15: db $22,$E0,$1E,$74,$CE,$32,$BC,$33
#_0CED1D: db $B9,$F3,$2E,$AD,$74,$33,$FF,$11
#_0CED25: db $DC,$06,$3D,$E3,$3D,$78,$E3,$5F
#_0CED2D: db $CF,$41,$D0,$10,$11,$FF,$68,$1F
#_0CED35: db $E3,$43,$0C,$B2,$52,$10,$CF,$64
#_0CED3D: db $06,$61,$D1,$62,$DE,$EB,$C0,$21
#_0CED45: db $68,$C1,$4F,$B0,$20,$F0,$11,$1F
#_0CED4D: db $CD,$74,$E0,$00,$20,$CF,$44,$ED
#_0CED55: db $FF,$DF,$78,$4F,$D1,$3F,$D1,$32
#_0CED5D: db $ED,$D0,$53,$78,$ED,$43,$CB,$34
#_0CED65: db $0F,$2E,$D3,$5F,$74,$F0,$0D,$D0
#_0CED6D: db $21,$12,$00,$0F,$F2,$78,$0D,$01
#_0CED75: db $00,$10,$E0,$31,$CC,$25,$74,$30
#_0CED7D: db $E0,$20,$DE,$12,$FD,$F1,$00,$78
#_0CED85: db $20,$DF,$20,$CF,$32,$00,$F1,$FE
#_0CED8D: db $78,$E1,$22,$FD,$E1,$33,$0C,$D2
#_0CED95: db $2F,$64,$F1,$12,$31,$DF,$01,$43
#_0CED9D: db $ED,$44,$74,$EE,$02,$20,$03,$3F
#_0CEDA5: db $F4,$5F,$BF,$64,$53,$FD,$CD,$13
#_0CEDAD: db $00,$34,$FE,$57,$64,$EB,$13,$CB
#_0CEDB5: db $F0,$E2,$4F,$C0,$41,$60,$22,$31
#_0CEDBD: db $FF,$11,$DC,$26,$2E,$DD,$74,$EE
#_0CEDC5: db $FF,$EE,$00,$02,$1C,$C1,$30,$64
#_0CEDCD: db $AA,$CE,$04,$3F,$DC,$9B,$34,$DC
#_0CEDD5: db $68,$21,$01,$FC,$F1,$1E,$14,$2B
#_0CEDDD: db $C3,$68,$4F,$F2,$DB,$16,$3F,$E0
#_0CEDE5: db $51,$E0,$74,$0F,$12,$0F,$02,$1E
#_0CEDED: db $F4,$40,$E1,$64,$51,$EF,$12,$0F
#_0CEDF5: db $14,$2D,$DF,$23,$68,$EF,$31,$E0
#_0CEDFD: db $1D,$F4,$1D,$12,$FC,$64,$D1,$1C
#_0CEE05: db $D1,$FE,$24,$0D,$FF,$EE,$74,$01
#_0CEE0D: db $FD,$E1,$FC,$E3,$2E,$E0,$1F,$74
#_0CEE15: db $D0,$30,$CC,$F0,$00,$FE,$EF,$12
#_0CEE1D: db $68,$BB,$F2,$40,$9C,$44,$EE,$20
#_0CEE25: db $CD,$68,$33,$ED,$02,$20,$EE,$11
#_0CEE2D: db $11,$20,$68,$E0,$20,$F1,$02,$51
#_0CEE35: db $CF,$22,$12,$64,$20,$23,$F0,$66
#_0CEE3D: db $0F,$20,$F2,$54,$64,$10,$0E,$C0
#_0CEE45: db $3D,$A0,$40,$E1,$1F,$68,$F1,$23
#_0CEE4D: db $ED,$11,$E0,$3F,$C0,$32,$54,$55
#_0CEE55: db $1C,$BB,$AA,$D0,$E9,$D6,$4C,$68
#_0CEE5D: db $E1,$11,$0C,$E0,$02,$2D,$E1,$2D
#_0CEE65: db $64,$CC,$F1,$2F,$BC,$24,$1E,$DC
#_0CEE6D: db $F2,$58,$E9,$21,$BF,$40,$BB,$25
#_0CEE75: db $FE,$0D,$68,$D2,$51,$CD,$01,$01
#_0CEE7D: db $10,$E0,$21,$68,$DE,$25,$2D,$E1
#_0CEE85: db $20,$F0,$01,$11,$58,$2F,$05,$2E
#_0CEE8D: db $F2,$53,$EF,$F1,$3F,$68,$04,$31
#_0CEE95: db $CB,$25,$2F,$F0,$12,$0E,$68,$F0
#_0CEE9D: db $11,$0D,$03,$4E,$DF,$0F,$12,$54
#_0CEEA5: db $42,$DB,$D0,$FE,$F0,$11,$44,$FE
#_0CEEAD: db $54,$1F,$AB,$00,$E2,$53,$CB,$26
#_0CEEB5: db $3E,$64,$ED,$D1,$41,$DD,$12,$10
#_0CEEBD: db $0F,$E2,$54,$4C,$B1,$2F,$EE,$02
#_0CEEC5: db $31,$12,$FD,$58,$23,$0E,$FE,$12
#_0CEECD: db $FE,$14,$0D,$CF,$54,$E4,$3F,$05
#_0CEED5: db $3C,$9B,$06,$5F,$CF,$54,$2F,$D0
#_0CEEDD: db $41,$EE,$F2,$42,$DC,$02,$58,$FF
#_0CEEE5: db $10,$01,$0C,$D1,$45,$3B,$90,$58
#_0CEEED: db $31,$FF,$00,$43,$CB,$25,$0B,$F1
#_0CEEF5: db $58,$21,$2F,$CF,$63,$ED,$11,$FF
#_0CEEFD: db $24,$54,$40,$02,$23,$62,$BC,$45
#_0CEF05: db $1E,$F4,$58,$2D,$E3,$1F,$1F,$E3
#_0CEF0D: db $40,$10,$CE,$58,$32,$E0,$21,$ED
#_0CEF15: db $E3,$4F,$D0,$1E,$58,$02,$FB,$C2
#_0CEF1D: db $41,$ED,$01,$FD,$E1,$48,$20,$D9
#_0CEF25: db $A0,$74,$C9,$C1,$0D,$DD,$58,$11
#_0CEF2D: db $0F,$13,$EB,$E4,$2D,$E0,$21,$58
#_0CEF35: db $EF,$23,$EC,$15,$2F,$BE,$24,$21
#_0CEF3D: db $54,$54,$0D,$03,$2E,$F3,$30,$DF
#_0CEF45: db $01,$48,$34,$FB,$01,$E3,$51,$03
#_0CEF4D: db $EC,$33,$58,$EF,$34,$1F,$EE,$13
#_0CEF55: db $2F,$E0,$22,$44,$55,$0B,$B1,$54
#_0CEF5D: db $0B,$AE,$22,$FB,$58,$F0,$31,$EF
#_0CEF65: db $21,$EC,$03,$0D,$EF,$58,$E1,$3F
#_0CEF6D: db $D1,$2F,$DE,$F0,$0F,$E1,$44,$2F
#_0CEF75: db $AF,$63,$D0,$3E,$9E,$76,$CB,$54
#_0CEF7D: db $23,$24,$62,$EF,$21,$E0,$54,$EB
#_0CEF85: db $54,$05,$41,$01,$10,$F0,$13,$21
#_0CEF8D: db $FE,$48,$25,$62,$DC,$F2,$30,$01
#_0CEF95: db $01,$03,$48,$2E,$02,$FF,$04,$53
#_0CEF9D: db $BB,$25,$0F,$54,$F0,$10,$DD,$F0
#_0CEFA5: db $24,$1C,$C0,$01,$44,$42,$BA,$DE
#_0CEFAD: db $D9,$B3,$4E,$AD,$10,$48,$9F,$45
#_0CEFB5: db $EB,$C1,$30,$ED,$01,$FC,$48,$E3
#_0CEFBD: db $2E,$D0,$2F,$CD,$21,$00,$EF,$38
#_0CEFC5: db $F0,$0E,$C5,$6A,$A0,$FD,$11,$FF
#_0CEFCD: db $48,$11,$12,$0C,$C2,$64,$EB,$F5
#_0CEFD5: db $3E,$48,$D5,$60,$AE,$43,$FD,$47
#_0CEFDD: db $FA,$05,$48,$2F,$23,$1F,$EE,$F2
#_0CEFE5: db $50,$D1,$4F,$44,$BC,$23,$DB,$EF
#_0CEFED: db $DE,$0F,$DD,$F0,$48,$0F,$FE,$F0
#_0CEFF5: db $11,$FE,$F2,$1B,$D5,$44,$61,$BF
#_0CEFFD: db $54,$00,$22,$1E,$EF,$11,$38,$2F
#_0CF005: db $CD,$31,$13,$3D,$C0,$02,$0D,$44
#_0CF00D: db $F2,$31,$00,$00,$22,$FD,$13,$FC
#_0CF015: db $38,$65,$EF,$42,$BB,$16,$5F,$AE
#_0CF01D: db $57,$44,$2D,$C0,$31,$11,$FD,$E1
#_0CF025: db $44,$0F,$34,$FF,$DE,$22,$DC,$F0
#_0CF02D: db $FE,$03,$09,$48,$02,$1E,$F1,$1E
#_0CF035: db $E1,$40,$CB,$13,$24,$4E,$F0,$0B
#_0CF03D: db $AE,$0F,$CB,$DF,$30,$44,$F1,$43
#_0CF045: db $ED,$24,$0C,$E1,$20,$FF,$48,$20
#_0CF04D: db $F1,$2F,$D1,$32,$0D,$D1,$42,$44
#_0CF055: db $21,$02,$30,$DF,$34,$20,$00,$12
#_0CF05D: db $34,$51,$FF,$FE,$F3,$52,$CB,$F3
#_0CF065: db $31,$28,$D3,$5C,$94,$3F,$33,$ED
#_0CF06D: db $02,$10,$38,$0E,$F3,$1B,$E4,$0D
#_0CF075: db $31,$CE,$21,$38,$01,$EB,$F3,$20
#_0CF07D: db $EE,$F2,$0E,$F1,$34,$FE,$00,$EE
#_0CF085: db $2F,$AB,$14,$3F,$BC,$34,$14,$2E
#_0CF08D: db $DE,$F0,$23,$0F,$FE,$DF,$38,$30
#_0CF095: db $F0,$FD,$06,$3C,$C1,$01,$0C,$34
#_0CF09D: db $C3,$61,$EF,$13,$31,$F0,$10,$E0
#_0CF0A5: db $38,$50,$D0,$10,$01,$10,$00,$10
#_0CF0AD: db $11,$24,$1A,$B2,$54,$10,$34,$23
#_0CF0B5: db $43,$30,$38,$E3,$3E,$D1,$21,$FF
#_0CF0BD: db $43,$EB,$D3,$34,$22,$DB,$F1,$00
#_0CF0C5: db $0F,$E0,$0F,$F1,$34,$FC,$E2,$20
#_0CF0CD: db $FF,$EE,$00,$EE,$00,$28,$E1,$2E
#_0CF0D5: db $DF,$20,$CD,$12,$10,$FF,$24,$13
#_0CF0DD: db $1E,$E0,$33,$1F,$E1,$41,$D0,$28
#_0CF0E5: db $4D,$D2,$4F,$CF,$45,$EE,$FF,$31
#_0CF0ED: db $28,$FE,$23,$1E,$E1,$20,$02,$0F
#_0CF0F5: db $24,$34,$1D,$C0,$31,$F1,$20,$F1
#_0CF0FD: db $0E,$03,$24,$3D,$CD,$EE,$01,$34
#_0CF105: db $2E,$BD,$11,$18,$BF,$41,$CD,$20
#_0CF10D: db $00,$ED,$E3,$52,$14,$4D,$CF,$00
#_0CF115: db $0E,$E3,$3D,$C0,$30,$14,$F0,$EF
#_0CF11D: db $20,$E0,$22,$55,$0E,$02,$14,$21
#_0CF125: db $00,$0F,$F2,$44,$10,$EC,$03,$14
#_0CF12D: db $FC,$01,$03,$0C,$06,$51,$02,$3F
#_0CF135: db $24,$F1,$2F,$E1,$40,$BC,$13,$20
#_0CF13D: db $FE,$14,$E0,$10,$0F,$BA,$D4,$52
#_0CF145: db $FC,$CE,$14,$00,$00,$FC,$F2,$0F
#_0CF14D: db $00,$12,$0D,$18,$22,$DB,$35,$FE
#_0CF155: db $21,$EF,$0F,$F0,$24,$24,$2E,$03
#_0CF15D: db $1E,$F1,$0F,$02,$21,$04,$F0,$FF
#_0CF165: db $00,$0F,$0B,$CF,$35,$0E,$18,$03
#_0CF16D: db $4F,$DF,$1F,$F4,$3C,$C3,$6E,$14
#_0CF175: db $FE,$00,$00,$55,$1E,$ED,$E0,$22
#_0CF17D: db $04,$01,$10,$EE,$01,$0C,$CB,$E0
#_0CF185: db $32,$04,$0E,$F0,$FA,$DC,$CC,$E0
#_0CF18D: db $0F,$F0,$04,$1F,$DD,$FE,$AB,$EF
#_0CF195: db $01,$0B,$B5,$14,$61,$CD,$23,$FD
#_0CF19D: db $F0,$00,$00,$10,$04,$02,$22,$21
#_0CF1A5: db $00,$11,$34,$41,$D0,$14,$43,$00
#_0CF1AD: db $20,$03,$20,$F1,$00,$12,$14,$20
#_0CF1B5: db $00,$0E,$D0,$42,$FF,$24,$1F,$04
#_0CF1BD: db $01,$10,$FE,$02,$00,$F0,$01,$01
#_0CF1C5: db $04,$20,$CD,$04,$10,$01,$0D,$D0
#_0CF1CD: db $00,$04,$FD,$00,$0F,$DD,$FF,$DC
#_0CF1D5: db $E0,$0E,$14,$DE,$00,$0F,$0F,$FF
#_0CF1DD: db $00,$00,$F0,$04,$0F,$FF,$00,$CD
#_0CF1E5: db $00,$00,$01,$1F,$04,$F0,$10,$10
#_0CF1ED: db $00,$13,$10,$00,$22,$04,$30,$00
#_0CF1F5: db $00,$E0,$33,$0F,$01,$21,$04,$0F
#_0CF1FD: db $03,$10,$12,$00,$00,$00,$00,$04
#_0CF205: db $02,$10,$02,$00,$01,$00,$00,$00
#_0CF20D: db $04,$0F,$F0,$00,$00,$00,$E0,$00
#_0CF215: db $00,$00,$00,$0F,$EE,$ED,$CB,$BC
#_0CF21D: db $CB,$BC,$04,$0D,$F0,$0F,$00,$00
#_0CF225: db $00,$00,$00,$00,$DD,$F0,$FE,$00
#_0CF22D: db $FF,$0F,$EE,$F0,$00,$00,$FF,$F0
#_0CF235: db $00,$00,$00,$00,$00,$00,$00,$00
#_0CF23D: db $00,$00,$00,$00,$F0,$0F,$00,$00
#_0CF245: db $00,$00,$00,$00,$00,$01,$00,$00
#_0CF24D: db $11,$11,$10,$00,$00,$00,$00,$00
#_0CF255: db $01,$00,$00,$00,$00,$00,$00,$00
#_0CF25D: db $00,$0A,$00,$A1,$A2,$8A,$A2,$41
#_0CF265: db $20,$22,$22,$A2,$2A,$22,$08,$22
#_0CF26D: db $00,$A8,$02,$A0,$A0,$82,$88,$A0
#_0CF275: db $22,$28,$28,$A0,$AA,$00,$A2,$22
#_0CF27D: db $A2,$AA,$00,$AF,$EA,$BF,$EA,$BA
#_0CF285: db $AA,$FF,$BE,$AA,$AB,$AA,$EF,$B2
#_0CF28D: db $AF,$FE,$AB,$EB,$AE,$A2,$AF,$BB
#_0CF295: db $EF,$BF,$AA,$AA,$EF,$BF,$FB,$FA
#_0CF29D: db $BA,$EE,$FA,$FF,$BA,$A7,$EA,$AF
#_0CF2A5: db $EB,$BF,$AF,$BB,$AA,$BE,$AB,$BE
#_0CF2AD: db $EA,$AB,$AF,$FA,$AB,$BA,$AE,$BA
#_0CF2B5: db $AB,$FA,$EE,$EB,$BF,$BA,$AB,$AA
#_0CF2BD: db $AB,$BA,$FF,$BF,$AE,$AE,$BF,$ED
#_0CF2C5: db $AE,$AF,$AA,$2E,$EE,$BB,$EE,$EF
#_0CF2CD: db $BE,$AA,$AF,$EE,$EE,$AF,$EE,$8E
#_0CF2D5: db $EE,$FE,$AF,$88,$EB,$EE,$AA,$3A
#_0CF2DD: db $EB,$BE,$FE,$E2,$AF,$B3,$BE,$B2
#_0CF2E5: db $EA,$BE,$BB,$BB,$EB,$AE,$BB,$AE
#_0CF2ED: db $AE,$F7,$AE,$FA,$EE,$EA,$AE,$BF
#_0CF2F5: db $AB,$BB,$AB,$A3,$AA,$AE,$BB,$AF
#_0CF2FD: db $AF,$AF,$EF,$21,$83,$09,$A0,$60
#_0CF305: db $20,$00,$80,$83,$80,$00,$20,$21
#_0CF30D: db $20,$20,$00,$8A,$01,$04,$20,$26
#_0CF315: db $04,$00,$08,$00,$00,$20,$00,$01
#_0CF31D: db $02,$A0,$20,$2D,$20,$84,$A0,$29
#_0CF325: db $28,$08,$21,$10,$88,$00,$82,$04
#_0CF32D: db $88,$02,$20,$A8,$A0,$A8,$00,$A2
#_0CF335: db $22,$00,$80,$A0,$20,$02,$00,$A0
#_0CF33D: db $08,$22,$02,$22,$22,$00,$00,$26
#_0CF345: db $A0,$24,$22,$2C,$00,$62,$02,$00
#_0CF34D: db $20,$20,$02,$A6,$A8,$80,$02,$88
#_0CF355: db $00,$80,$08,$48,$0A,$A8,$20,$92
#_0CF35D: db $28,$20,$00,$AA,$00,$09,$20,$01
#_0CF365: db $20,$8C,$80,$75,$02,$04,$A0,$21
#_0CF36D: db $A0,$00,$20,$08,$22,$00,$28,$80
#_0CF375: db $82,$82,$00,$A2,$82,$02,$00,$09
#_0CF37D: db $20,$A0,$A2,$E3,$EB,$AF,$EE,$67
#_0CF385: db $BF,$BF,$FF,$FF,$FE,$6A,$AE,$5A
#_0CF38D: db $AB,$2F,$BE,$A9,$BB,$BF,$FF,$BD
#_0CF395: db $AF,$FB,$BF,$2F,$BA,$A6,$BF,$FE
#_0CF39D: db $EB,$EE,$BF,$EF,$B9,$FD,$A7,$A7
#_0CF3A5: db $A6,$FF,$FE,$6F,$F3,$BF,$AF,$A5
#_0CF3AD: db $F7,$53,$AF,$EE,$FB,$3A,$FB,$E3
#_0CF3B5: db $BF,$BB,$FF,$EE,$FF,$31,$BF,$AA
#_0CF3BD: db $FF,$2F,$FF,$6F,$B6,$AE,$EF,$A3
#_0CF3C5: db $EB,$ED,$BF,$FB,$AF,$FE,$EE,$EF
#_0CF3CD: db $AF,$BF,$3F,$FB,$EF,$B6,$EB,$BE
#_0CF3D5: db $BE,$B3,$AF,$BF,$AE,$A7,$FF,$3F
#_0CF3DD: db $BB,$BF,$EF,$9A,$A7,$B5,$E7,$F2
#_0CF3E5: db $F4,$EB,$F7,$B8,$BF,$FD,$FE,$B7
#_0CF3ED: db $EF,$EE,$B7,$65,$BD,$F7,$A7,$E3
#_0CF3F5: db $AF,$FE,$FF,$EF,$FA,$F6,$BF,$B7
#_0CF3FD: db $AE,$6B,$FF,$A9,$A8,$A8,$A2,$8A
#_0CF405: db $A0,$88,$88,$88,$A2,$20,$A8,$A2
#_0CF40D: db $08,$88,$22,$A4,$20,$A8,$80,$24
#_0CF415: db $22,$28,$A8,$A0,$88,$80,$20,$A4
#_0CF41D: db $AA,$20,$A0,$A0,$A0,$84,$A0,$A8
#_0CF425: db $A0,$28,$20,$20,$28,$A0,$A0,$AA
#_0CF42D: db $A0,$80,$A0,$23,$80,$A2,$80,$20
#_0CF435: db $0A,$80,$A0,$22,$2A,$A8,$A2,$82
#_0CF43D: db $A0,$A0,$86,$22,$A0,$0A,$00,$2A
#_0CF445: db $A0,$A4,$22,$81,$A0,$A9,$00,$A0
#_0CF44D: db $A0,$00,$00,$8A,$A0,$A0,$A0,$82
#_0CF455: db $88,$28,$80,$A8,$20,$A3,$0A,$80
#_0CF45D: db $20,$80,$00,$08,$A8,$20,$02,$A0
#_0CF465: db $20,$A0,$80,$30,$88,$80,$A0,$A0
#_0CF46D: db $84,$A0,$80,$80,$A0,$A0,$A8,$0A
#_0CF475: db $80,$00,$20,$2A,$00,$84,$A0,$20
#_0CF47D: db $A0,$AA,$20,$F3,$EF,$E3,$FB,$B8
#_0CF485: db $FB,$EF,$AE,$3E,$AD,$BF,$FA,$AE
#_0CF48D: db $AB,$AA,$BE,$AE,$AE,$AE,$AE,$EE
#_0CF495: db $AF,$A2,$FA,$FC,$EB,$AB,$BF,$EF
#_0CF49D: db $AF,$EA,$BE,$AA,$BF,$A7,$BE,$E7
#_0CF4A5: db $EB,$BF,$AE,$BA,$AF,$AE,$BE,$AB
#_0CF4AD: db $AE,$FE,$AF,$BF,$BE,$AE,$AA,$AA
#_0CF4B5: db $EF,$BA,$EE,$AE,$AE,$FA,$EB,$2A
#_0CF4BD: db $AA,$EE,$AA,$AE,$FE,$AE,$AE,$AF
#_0CF4C5: db $EF,$B6,$AA,$66,$AE,$AE,$AF,$FA
#_0CF4CD: db $BB,$AB,$AB,$AE,$BB,$AB,$BF,$A3
#_0CF4D5: db $AF,$AE,$A6,$EB,$BE,$AB,$AE,$A2
#_0CF4DD: db $BF,$AE,$BE,$AB,$FE,$F6,$AF,$E6
#_0CF4E5: db $EE,$A5,$9E,$EE,$AF,$AF,$EA,$AF
#_0CF4ED: db $FF,$AC,$BE,$EF,$AE,$AE,$AA,$AF
#_0CF4F5: db $AE,$AD,$BF,$A7,$AF,$AF,$AE,$A6
#_0CF4FD: db $AE,$EF,$AB,$28,$A0,$88,$A8,$82
#_0CF505: db $A2,$82,$80,$88,$22,$2A,$00,$80
#_0CF50D: db $A0,$80,$20,$8A,$88,$20,$22,$A2
#_0CF515: db $00,$88,$8A,$28,$A0,$A0,$20,$32
#_0CF51D: db $20,$0A,$28,$A8,$01,$AA,$20,$0A
#_0CF525: db $80,$08,$80,$CA,$20,$AC,$82,$EA
#_0CF52D: db $A8,$A2,$00,$28,$22,$8A,$00,$8A
#_0CF535: db $80,$2A,$00,$AA,$02,$A0,$28,$A2
#_0CF53D: db $8A,$20,$A0,$28,$02,$A0,$02,$A8
#_0CF545: db $88,$02,$02,$02,$00,$80,$A8,$A2
#_0CF54D: db $AA,$00,$A8,$0A,$00,$A8,$A2,$A8
#_0CF555: db $A0,$08,$01,$AA,$A2,$3A,$00,$6A
#_0CF55D: db $A2,$0A,$20,$33,$0A,$0A,$28,$54
#_0CF565: db $08,$68,$08,$A0,$8A,$20,$80,$A2
#_0CF56D: db $08,$C0,$0A,$88,$A8,$28,$20,$18
#_0CF575: db $A0,$20,$80,$C8,$80,$A8,$80,$8A
#_0CF57D: db $8A,$AA,$88,$AF,$EA,$EE,$BB,$B7
#_0CF585: db $BF,$FB,$BF,$FB,$AF,$E6,$AB,$FA
#_0CF58D: db $EB,$F8,$AB,$6E,$AE,$A2,$BF,$E3
#_0CF595: db $BA,$BB,$EB,$AA,$AE,$A7,$AE,$AE
#_0CF59D: db $AA,$EF,$EB,$AA,$FB,$BE,$FA,$FF
#_0CF5A5: db $FB,$6C,$BA,$6A,$AF,$BB,$EF,$BB
#_0CF5AD: db $BB,$BB,$EB,$B9,$BA,$AE,$EE,$EA
#_0CF5B5: db $AF,$EE,$E7,$AE,$BF,$BB,$EA,$AB
#_0CF5BD: db $AA,$AB,$FB,$EA,$F7,$BF,$FF,$FF
#_0CF5C5: db $FB,$EA,$AF,$7E,$FB,$BB,$BB,$BB
#_0CF5CD: db $EE,$EA,$AF,$AA,$FE,$EA,$FA,$63
#_0CF5D5: db $BB,$E3,$AF,$B2,$AA,$CE,$AF,$E6
#_0CF5DD: db $EB,$BA,$EB,$A9,$EA,$AE,$B3,$CF
#_0CF5E5: db $BE,$EF,$EF,$ED,$BF,$66,$BE,$BD
#_0CF5ED: db $EF,$DE,$AF,$3B,$AB,$AF,$EE,$BB
#_0CF5F5: db $BE,$BE,$FF,$AA,$BA,$FB,$FB,$EA
#_0CF5FD: db $FE,$FA,$AE,$CA,$48,$8B,$00,$E2
#_0CF605: db $28,$23,$A0,$22,$00,$28,$22,$02
#_0CF60D: db $88,$00,$00,$AC,$A0,$08,$82,$A2
#_0CF615: db $A0,$E0,$88,$A8,$88,$80,$22,$A0
#_0CF61D: db $20,$80,$A0,$88,$A0,$0A,$02,$8E
#_0CF625: db $88,$80,$06,$0A,$A8,$08,$28,$A2
#_0CF62D: db $28,$08,$A2,$23,$A8,$A0,$2A,$A1
#_0CF635: db $A0,$08,$00,$A8,$28,$00,$22,$AA
#_0CF63D: db $A2,$28,$A0,$8A,$A2,$08,$A2,$AA
#_0CF645: db $90,$A2,$22,$A2,$28,$0B,$A2,$A8
#_0CF64D: db $80,$B8,$08,$AA,$A2,$A8,$AA,$22
#_0CF655: db $A0,$A2,$80,$A8,$02,$8B,$00,$2A
#_0CF65D: db $08,$22,$00,$49,$8C,$AA,$80,$A8
#_0CF665: db $20,$A0,$A1,$08,$20,$A2,$A0,$88
#_0CF66D: db $02,$A0,$20,$AA,$A0,$0A,$22,$8A
#_0CF675: db $AA,$A2,$2A,$A3,$80,$AA,$A8,$A2
#_0CF67D: db $AA,$20,$A0,$BE,$FB,$AE,$AE,$A2
#_0CF685: db $AB,$BF,$AA,$A2,$AA,$AF,$EE,$AA
#_0CF68D: db $EF,$FE,$BF,$AE,$EA,$AB,$EE,$AA
#_0CF695: db $AE,$BB,$AA,$BF,$AA,$FA,$AE,$F5
#_0CF69D: db $AE,$AE,$EF,$BA,$F8,$AA,$EF,$EE
#_0CF6A5: db $AE,$AF,$EB,$FD,$F7,$EC,$AB,$EB
#_0CF6AD: db $AE,$AF,$BF,$BB,$BE,$BE,$A8,$BF
#_0CF6B5: db $EB,$EA,$AE,$AA,$AA,$BE,$AF,$AA
#_0CF6BD: db $3A,$BF,$EE,$9B,$AB,$BF,$BE,$AA
#_0CF6C5: db $AB,$B2,$AB,$FA,$FA,$AB,$BF,$BF
#_0CF6CD: db $FF,$AB,$FE,$FF,$BB,$FD,$BB,$EE
#_0CF6D5: db $FE,$9B,$AA,$7A,$AF,$B9,$AF,$AB
#_0CF6DD: db $AB,$EA,$FF,$AA,$EB,$AE,$FB,$6F
#_0CF6E5: db $FE,$F3,$BA,$FB,$EF,$FB,$AB,$AB
#_0CF6ED: db $BF,$AE,$BF,$AB,$AA,$EE,$AA,$AE
#_0CF6F5: db $AF,$EF,$AF,$AF,$EB,$BA,$AB,$AA
#_0CF6FD: db $EE,$AF,$EE,$12,$80,$2E,$20,$CC
#_0CF705: db $29,$20,$00,$20,$A2,$80,$88,$81
#_0CF70D: db $88,$21,$00,$02,$81,$80,$00,$A0
#_0CF715: db $04,$60,$08,$64,$80,$20,$20,$02
#_0CF71D: db $88,$42,$88,$A0,$0B,$20,$80,$04
#_0CF725: db $00,$A1,$20,$28,$A4,$21,$A0,$A1
#_0CF72D: db $20,$20,$82,$22,$A8,$08,$00,$00
#_0CF735: db $08,$A0,$2A,$AC,$20,$80,$88,$80
#_0CF73D: db $23,$82,$B0,$80,$A0,$A6,$A0,$C8
#_0CF745: db $0A,$80,$A0,$8A,$04,$20,$A8,$88
#_0CF74D: db $84,$80,$02,$E0,$8A,$20,$00,$28
#_0CF755: db $A4,$80,$00,$2C,$88,$08,$A0,$20
#_0CF75D: db $28,$00,$88,$8F,$A0,$00,$00,$33
#_0CF765: db $24,$22,$82,$61,$80,$22,$00,$00
#_0CF76D: db $80,$C1,$00,$2A,$20,$98,$80,$02
#_0CF775: db $80,$20,$88,$A0,$2A,$A1,$00,$AC
#_0CF77D: db $20,$20,$08,$2C,$EB,$EF,$AF,$AB
#_0CF785: db $AF,$BF,$EF,$C8,$EF,$A7,$DF,$BF
#_0CF78D: db $AD,$AC,$BB,$CA,$FB,$EF,$E7,$FF
#_0CF795: db $BE,$E2,$FF,$2E,$F7,$EF,$FC,$D7
#_0CF79D: db $BF,$FD,$FF,$F4,$FD,$7F,$BD,$7F
#_0CF7A5: db $FF,$B3,$FB,$BD,$FD,$FB,$AB,$FF
#_0CF7AD: db $BE,$FB,$FF,$AA,$AB,$AF,$AE,$E0
#_0CF7B5: db $AA,$EE,$FF,$EB,$EA,$E5,$AE,$B1
#_0CF7BD: db $AA,$BB,$FB,$B5,$BA,$EE,$BF,$A6
#_0CF7C5: db $FF,$FE,$BB,$FE,$FE,$F5,$E5,$BB
#_0CF7CD: db $AF,$BE,$AF,$EF,$B5,$BF,$AA,$F8
#_0CF7D5: db $AF,$FA,$BB,$E4,$EF,$EF,$EF,$BA
#_0CF7DD: db $FF,$EE,$EB,$B9,$EF,$9A,$FF,$DA
#_0CF7E5: db $AF,$FE,$EA,$FD,$BB,$FB,$FF,$FF
#_0CF7ED: db $AF,$FE,$EF,$BF,$EF,$FF,$AF,$EF
#_0CF7F5: db $EF,$EF,$AF,$FF,$AF,$EF,$EF,$BF
#_0CF7FD: db $FF,$AF,$FF,$AA,$A2,$28,$AA,$32
#_0CF805: db $8A,$A8,$A0,$A2,$AA,$A2,$0A,$AA
#_0CF80D: db $A8,$80,$82,$A2,$A0,$20,$80,$02
#_0CF815: db $A8,$88,$A2,$AA,$B0,$0A,$02,$88
#_0CF81D: db $A0,$22,$24,$2A,$A8,$AA,$28,$A0
#_0CF825: db $A2,$80,$22,$A0,$8A,$A8,$A0,$0A
#_0CF82D: db $A0,$88,$A8,$28,$A8,$A2,$A0,$A8
#_0CF835: db $AA,$A0,$80,$AA,$20,$2A,$02,$A8
#_0CF83D: db $82,$AA,$20,$AC,$20,$00,$AA,$02
#_0CF845: db $A0,$82,$80,$A8,$AA,$80,$A0,$20
#_0CF84D: db $00,$28,$82,$A3,$A0,$2E,$A2,$2A
#_0CF855: db $A8,$0A,$20,$4A,$A2,$A0,$20,$A0
#_0CF85D: db $A0,$28,$22,$A0,$A0,$A0,$2A,$AA
#_0CF865: db $AA,$82,$80,$AA,$A2,$A0,$A2,$20
#_0CF86D: db $22,$82,$A0,$A8,$A2,$A2,$A2,$AA
#_0CF875: db $82,$0A,$AA,$20,$AA,$A0,$A8,$0A
#_0CF87D: db $82,$80,$A8,$EA,$AE,$BF,$EF,$AF
#_0CF885: db $AF,$EB,$BB,$B7,$AA,$EB,$EA,$F7
#_0CF88D: db $AB,$EB,$BE,$EA,$FF,$EB,$AF,$BA
#_0CF895: db $AE,$AB,$FA,$A3,$BA,$AF,$EB,$FA
#_0CF89D: db $AA,$EE,$BF,$BE,$AB,$FE,$EB,$EA
#_0CF8A5: db $AB,$BA,$FF,$AF,$AB,$FE,$EB,$AF
#_0CF8AD: db $AF,$BB,$EF,$AA,$EA,$A8,$EE,$EB
#_0CF8B5: db $AF,$AB,$AE,$AA,$BA,$EF,$EA,$AB
#_0CF8BD: db $BA,$EA,$AF,$EF,$AB,$EA,$AE,$AB
#_0CF8C5: db $BE,$AE,$EA,$AB,$BE,$BF,$AB,$EF
#_0CF8CD: db $AF,$FA,$EE,$EB,$BF,$BB,$AA,$BE
#_0CF8D5: db $BB,$FA,$AF,$BB,$EF,$BF,$AF,$FA
#_0CF8DD: db $AE,$EF,$EB,$AB,$EB,$AA,$AB,$BE
#_0CF8E5: db $EE,$FA,$FE,$AE,$BA,$B8,$BB,$AA
#_0CF8ED: db $AE,$FF,$DB,$EB,$EB,$BB,$BA,$AB
#_0CF8F5: db $FB,$BB,$FB,$AE,$BE,$AE,$EA,$FE
#_0CF8FD: db $EA,$AA,$EF,$2A,$02,$89,$A0,$81
#_0CF905: db $A2,$21,$20,$80,$20,$80,$02,$02
#_0CF90D: db $82,$AA,$00,$EB,$28,$00,$80,$02
#_0CF915: db $02,$04,$80,$40,$20,$01,$A8,$40
#_0CF91D: db $A2,$00,$A2,$2B,$A8,$00,$88,$AC
#_0CF925: db $A8,$02,$00,$88,$0A,$B7,$82,$28
#_0CF92D: db $88,$A0,$A0,$AE,$AA,$82,$22,$21
#_0CF935: db $20,$2A,$A8,$22,$AA,$A0,$28,$8A
#_0CF93D: db $22,$28,$A0,$28,$20,$80,$82,$A2
#_0CF945: db $AA,$A3,$02,$38,$00,$28,$22,$A2
#_0CF94D: db $20,$03,$00,$A4,$84,$28,$A0,$A8
#_0CF955: db $82,$2A,$00,$AE,$A8,$88,$A0,$07
#_0CF95D: db $82,$A0,$80,$85,$A1,$22,$88,$06
#_0CF965: db $88,$C0,$80,$80,$24,$A1,$80,$AA
#_0CF96D: db $80,$00,$00,$2A,$A2,$08,$02,$02
#_0CF975: db $28,$4A,$28,$AA,$82,$A8,$00,$AA
#_0CF97D: db $A8,$A2,$88,$AA,$FB,$FD,$FA,$AA
#_0CF985: db $AF,$EF,$AA,$92,$AB,$FB,$E2,$FE
#_0CF98D: db $AA,$EB,$BF,$A5,$FF,$FB,$BE,$AB
#_0CF995: db $AE,$EF,$AE,$FE,$EF,$EE,$BB,$BF
#_0CF99D: db $BF,$E6,$EB,$AB,$EF,$AE,$A9,$CF
#_0CF9A5: db $AF,$EE,$FE,$EE,$2B,$FF,$EE,$FF
#_0CF9AD: db $EB,$FF,$EF,$FA,$BF,$BE,$FB,$EF
#_0CF9B5: db $6A,$AB,$BF,$AA,$FA,$EF,$AB,$BE
#_0CF9BD: db $AA,$AE,$FB,$A6,$FB,$BF,$BE,$FF
#_0CF9C5: db $EA,$2F,$FF,$FE,$BB,$FA,$FF,$9B
#_0CF9CD: db $2E,$EE,$AB,$C3,$AB,$AB,$AA,$EA
#_0CF9D5: db $BF,$AC,$AF,$BF,$BF,$CC,$BA,$EF
#_0CF9DD: db $AB,$FA,$FB,$FD,$EE,$F8,$FB,$3F
#_0CF9E5: db $FE,$EF,$EF,$BF,$E3,$F9,$BF,$EB
#_0CF9ED: db $EF,$DB,$FA,$CF,$BF,$AE,$AA,$2F
#_0CF9F5: db $AA,$FB,$BA,$EE,$EE,$EF,$AE,$EA
#_0CF9FD: db $AF,$EE,$BA,$0B,$08,$00,$00,$E8
#_0CFA05: db $22,$08,$80,$82,$00,$AA,$2A,$AA
#_0CFA0D: db $A0,$A0,$8A,$22,$80,$68,$A8,$A4
#_0CFA15: db $A0,$80,$A8,$2A,$80,$8C,$A6,$03
#_0CFA1D: db $A0,$08,$20,$A4,$A2,$A8,$88,$A8
#_0CFA25: db $82,$A0,$00,$0B,$60,$A8,$82,$8A
#_0CFA2D: db $AA,$88,$22,$86,$80,$84,$82,$AA
#_0CFA35: db $80,$C0,$09,$2A,$2A,$8C,$00,$88
#_0CFA3D: db $A8,$02,$00,$A8,$A0,$8A,$AA,$A9
#_0CFA45: db $82,$A8,$20,$AB,$20,$AA,$80,$28
#_0CFA4D: db $A8,$A8,$22,$2A,$A2,$A8,$28,$AA
#_0CFA55: db $A4,$A8,$20,$A0,$20,$A0,$A8,$22
#_0CFA5D: db $8A,$20,$00,$86,$A8,$A4,$0A,$2A
#_0CFA65: db $80,$28,$A0,$88,$20,$A2,$00,$8A
#_0CFA6D: db $A0,$A0,$02,$A8,$89,$80,$AA,$22
#_0CFA75: db $20,$82,$80,$A9,$A0,$88,$A0,$AA
#_0CFA7D: db $AA,$A2,$28,$FB,$BF,$BA,$AE,$FA
#_0CFA85: db $AE,$BE,$BB,$AF,$EB,$AE,$BB,$AA
#_0CFA8D: db $BA,$EF,$AA,$7B,$BE,$B7,$AE,$AB
#_0CFA95: db $BA,$EE,$AB,$FF,$EB,$B3,$BB,$BA
#_0CFA9D: db $EB,$FB,$EF,$BB,$EF,$AB,$E7,$BE
#_0CFAA5: db $BF,$AB,$BF,$F3,$AF,$E7,$EF,$F0
#_0CFAAD: db $EB,$BF,$AE,$BE,$FF,$BF,$EA,$EA
#_0CFAB5: db $EA,$FA,$BE,$AF,$AB,$AE,$EE,$EE
#_0CFABD: db $AE,$AA,$BA,$8E,$AF,$AC,$A8,$EB
#_0CFAC5: db $AE,$EC,$BF,$AB,$AF,$A4,$AA,$AE
#_0CFACD: db $AF,$EE,$AE,$FB,$BB,$BA,$AF,$BE
#_0CFAD5: db $AF,$BF,$EF,$AE,$AE,$2A,$BF,$AD
#_0CFADD: db $AF,$AA,$BB,$FF,$FB,$BB,$AB,$6D
#_0CFAE5: db $AB,$EE,$FB,$AE,$BF,$BE,$EB,$FB
#_0CFAED: db $BB,$AA,$AE,$AE,$EF,$CA,$FA,$AE
#_0CFAF5: db $EE,$A9,$AA,$AD,$AB,$AA,$AF,$EA
#_0CFAFD: db $EE,$AE,$AE,$A2,$08,$00,$AA,$10
#_0CFB05: db $88,$A0,$A0,$80,$22,$80,$02,$30
#_0CFB0D: db $00,$80,$20,$AA,$00,$C0,$00,$20
#_0CFB15: db $00,$28,$08,$80,$08,$08,$0E,$58
#_0CFB1D: db $00,$C0,$00,$AE,$00,$0A,$00,$04
#_0CFB25: db $00,$20,$82,$8D,$00,$00,$2A,$21
#_0CFB2D: db $80,$81,$00,$01,$20,$88,$80,$20
#_0CFB35: db $20,$02,$40,$A6,$12,$A4,$80,$8A
#_0CFB3D: db $86,$66,$20,$84,$A6,$8B,$8A,$00
#_0CFB45: db $88,$84,$02,$86,$80,$80,$80,$20
#_0CFB4D: db $00,$02,$00,$13,$88,$00,$00,$00
#_0CFB55: db $08,$40,$30,$12,$88,$08,$00,$16
#_0CFB5D: db $00,$00,$20,$A4,$04,$09,$80,$B4
#_0CFB65: db $08,$40,$02,$92,$00,$20,$80,$10
#_0CFB6D: db $20,$02,$00,$08,$20,$80,$2A,$AE
#_0CFB75: db $A0,$00,$00,$A0,$88,$80,$81,$A0
#_0CFB7D: db $80,$A4,$22,$FA,$EE,$8F,$AA,$0F
#_0CFB85: db $FB,$BD,$EE,$AF,$FF,$BF,$BF,$F5
#_0CFB8D: db $FF,$FB,$FF,$C0,$EF,$FD,$FF,$B5
#_0CFB95: db $EF,$DF,$BF,$BB,$9D,$B7,$EF,$BF
#_0CFB9D: db $FF,$ED,$FF,$AE,$F7,$D7,$BF,$AF
#_0CFBA5: db $EF,$CF,$AF,$B7,$E4,$FC,$FB,$FF
#_0CFBAD: db $AF,$FB,$EF,$7F,$AE,$FE,$FF,$E9
#_0CFBB5: db $EF,$FF,$EE,$FE,$FA,$A7,$AB,$B3
#_0CFBBD: db $AF,$AB,$BB,$FB,$BF,$AF,$AE,$4F
#_0CFBC5: db $FB,$DA,$AF,$BD,$FF,$CF,$EF,$EE
#_0CFBCD: db $BE,$DC,$EF,$96,$FE,$BF,$AE,$EB
#_0CFBD5: db $AB,$BF,$FF,$ED,$FE,$DB,$BF,$5B
#_0CFBDD: db $FE,$FA,$FF,$BC,$F7,$D7,$BF,$DF
#_0CFBE5: db $B7,$FA,$FF,$0A,$FB,$DF,$EF,$AF
#_0CFBED: db $FB,$FF,$FF,$A7,$FF,$FF,$BE,$FF
#_0CFBF5: db $AF,$E9,$BF,$BB,$F8,$BF,$FE,$B0
#_0CFBFD: db $AF,$AB,$FE,$AE,$AA,$20,$82,$AE
#_0CFC05: db $80,$A2,$20,$AA,$A0,$A0,$88,$A0
#_0CFC0D: db $A0,$28,$82,$22,$2A,$A8,$80,$80
#_0CFC15: db $A8,$A8,$A2,$AC,$A0,$29,$20,$00
#_0CFC1D: db $80,$AA,$28,$A2,$AA,$AA,$A8,$08
#_0CFC25: db $A8,$A8,$22,$AA,$A0,$A0,$20,$88
#_0CFC2D: db $A0,$A4,$A8,$28,$A2,$A2,$20,$22
#_0CFC35: db $A8,$22,$22,$82,$00,$08,$AA,$A2
#_0CFC3D: db $A8,$A8,$00,$22,$E6,$00,$A0,$22
#_0CFC45: db $20,$20,$80,$81,$82,$A6,$82,$A8
#_0CFC4D: db $AA,$20,$00,$A2,$A0,$20,$A0,$A8
#_0CFC55: db $88,$A8,$A2,$AA,$20,$A8,$20,$8A
#_0CFC5D: db $22,$AA,$C8,$AA,$22,$80,$A8,$08
#_0CFC65: db $2A,$02,$A0,$A8,$A8,$B8,$00,$8C
#_0CFC6D: db $0A,$20,$B0,$AA,$A8,$AA,$28,$A8
#_0CFC75: db $A0,$A0,$8A,$AA,$A2,$AA,$A2,$A8
#_0CFC7D: db $A2,$AA,$80,$BB,$EF,$AF,$AA,$BE
#_0CFC85: db $AB,$FA,$EE,$AE,$AA,$AE,$EE,$AA
#_0CFC8D: db $BA,$FE,$EE,$AA,$EE,$EB,$AE,$B7
#_0CFC95: db $BA,$BE,$EF,$BF,$B8,$AE,$AB,$EC
#_0CFC9D: db $AA,$EA,$EF,$73,$EA,$FA,$BA,$AD
#_0CFCA5: db $EB,$AA,$EF,$7A,$AA,$EB,$AF,$EB
#_0CFCAD: db $EE,$BE,$AE,$EB,$AF,$AE,$AA,$AA
#_0CFCB5: db $AB,$AA,$EB,$7A,$FE,$AB,$AA,$EE
#_0CFCBD: db $EB,$6A,$AE,$AE,$FA,$EE,$AA,$FE
#_0CFCC5: db $EA,$AA,$AE,$FB,$AA,$AE,$BE,$EE
#_0CFCCD: db $AF,$AA,$AE,$EB,$EB,$ED,$EA,$FA
#_0CFCD5: db $AA,$EA,$7E,$AE,$AE,$A9,$AF,$AA
#_0CFCDD: db $AE,$FB,$EF,$EE,$BA,$AE,$AF,$FA
#_0CFCE5: db $B8,$AF,$EA,$AF,$EB,$FE,$AB,$BE
#_0CFCED: db $BB,$AA,$FB,$AA,$BF,$EA,$AB,$FB
#_0CFCF5: db $AB,$AF,$FA,$AE,$AF,$AB,$EA,$AB
#_0CFCFD: db $AB,$EB,$EB,$E0,$80,$04,$22,$AE
#_0CFD05: db $00,$A0,$00,$2C,$80,$08,$88,$00
#_0CFD0D: db $08,$20,$80,$88,$04,$00,$A0,$0E
#_0CFD15: db $00,$88,$00,$22,$02,$A2,$00,$0A
#_0CFD1D: db $30,$80,$88,$C0,$20,$00,$A0,$22
#_0CFD25: db $82,$22,$80,$00,$A0,$90,$04,$87
#_0CFD2D: db $00,$E2,$A0,$A8,$80,$A0,$A8,$4A
#_0CFD35: db $20,$A8,$20,$A4,$02,$20,$00,$A2
#_0CFD3D: db $A0,$80,$00,$AA,$02,$84,$A8,$18
#_0CFD45: db $08,$AA,$20,$A8,$02,$A2,$A0,$20
#_0CFD4D: db $20,$00,$88,$21,$08,$20,$B2,$00
#_0CFD55: db $2A,$60,$02,$86,$00,$80,$02,$82
#_0CFD5D: db $88,$62,$08,$A0,$2C,$A4,$A0,$08
#_0CFD65: db $20,$A0,$80,$AC,$A4,$04,$02,$05
#_0CFD6D: db $25,$21,$00,$AB,$A2,$90,$22,$8C
#_0CFD75: db $8A,$2A,$80,$A0,$A0,$30,$80,$02
#_0CFD7D: db $82,$82,$00,$AE,$E2,$CC,$8E,$AA
#_0CFD85: db $AA,$FF,$EA,$F2,$EE,$8A,$B7,$DE
#_0CFD8D: db $BA,$6F,$BF,$BF,$FA,$EE,$BF,$EB
#_0CFD95: db $EE,$EE,$BB,$32,$EA,$EF,$EA,$EC
#_0CFD9D: db $EE,$EA,$BE,$AF,$8F,$FF,$FF,$AD
#_0CFDA5: db $BD,$ED,$EE,$AB,$AF,$EF,$AF,$2D
#_0CFDAD: db $EB,$EF,$AE,$AE,$BF,$AA,$AB,$BE
#_0CFDB5: db $FA,$8C,$FB,$BF,$AE,$AE,$AB,$2B
#_0CFDBD: db $AE,$EF,$BB,$F8,$2C,$E0,$EE,$AC
#_0CFDC5: db $FC,$73,$BB,$AF,$2A,$4F,$EF,$EF
#_0CFDCD: db $BE,$EE,$AF,$AB,$E6,$AE,$AF,$B7
#_0CFDD5: db $FF,$E2,$AF,$EF,$AF,$CF,$AA,$BA
#_0CFDDD: db $AA,$EB,$EE,$EF,$EE,$7F,$EB,$D3
#_0CFDE5: db $EA,$FF,$BF,$FA,$AB,$EA,$BB,$AF
#_0CFDED: db $BB,$FF,$EE,$6B,$BF,$EB,$AF,$E7
#_0CFDF5: db $BF,$9F,$FF,$EF,$AF,$AE,$EF,$BF
#_0CFDFD: db $EF,$EE,$AF,$88,$A0,$A8,$00,$00
#_0CFE05: db $08,$0A,$20,$29,$88,$AA,$20,$28
#_0CFE0D: db $A0,$A8,$2E,$2A,$00,$28,$22,$A2
#_0CFE15: db $A2,$A2,$A0,$26,$20,$A2,$A0,$2A
#_0CFE1D: db $82,$82,$22,$67,$A8,$22,$AA,$A8
#_0CFE25: db $AA,$2A,$82,$AA,$A0,$A0,$A2,$80
#_0CFE2D: db $28,$20,$A0,$88,$82,$AA,$00,$2A
#_0CFE35: db $A0,$A0,$A0,$28,$28,$04,$28,$82
#_0CFE3D: db $A2,$00,$20,$00,$A2,$A2,$AA,$8A
#_0CFE45: db $80,$2B,$A2,$A2,$2A,$2A,$80,$82
#_0CFE4D: db $88,$82,$00,$A8,$0A,$01,$88,$A8
#_0CFE55: db $20,$00,$02,$A8,$20,$A8,$AA,$A0
#_0CFE5D: db $20,$A8,$A2,$A8,$20,$88,$BA,$2A
#_0CFE65: db $10,$06,$82,$20,$2A,$AA,$00,$A8
#_0CFE6D: db $80,$A0,$00,$2A,$80,$A2,$80,$2B
#_0CFE75: db $00,$A8,$82,$A2,$20,$20,$AA,$AA
#_0CFE7D: db $AA,$AA,$8A,$AF,$EE,$FA,$AE,$AB
#_0CFE85: db $AB,$FB,$FA,$FA,$AE,$EA,$BF,$EE
#_0CFE8D: db $AA,$FA,$EE,$7F,$EA,$AE,$BF,$AC
#_0CFE95: db $FE,$EE,$AE,$AA,$EB,$FF,$BF,$AF
#_0CFE9D: db $AA,$BC,$AF,$EF,$AE,$A2,$FB,$AF
#_0CFEA5: db $BA,$AA,$BB,$AA,$BF,$AF,$EB,$FE
#_0CFEAD: db $AB,$EA,$AF,$FE,$BB,$AA,$AE,$FA
#_0CFEB5: db $FE,$BB,$AA,$BF,$AF,$AE,$AF,$AB
#_0CFEBD: db $EE,$AA,$AE,$EE,$EE,$E4,$FA,$2A
#_0CFEC5: db $B6,$A7,$EB,$EE,$AB,$F1,$EA,$A6
#_0CFECD: db $A2,$EF,$9A,$A4,$FA,$EA,$BA,$E1
#_0CFED5: db $AF,$EE,$AE,$BF,$FB,$AB,$EB,$BB
#_0CFEDD: db $EA,$BF,$AE,$EE,$EB,$E2,$EF,$BF
#_0CFEE5: db $EA,$BF,$BF,$E6,$AA,$EE,$EF,$BF
#_0CFEED: db $BE,$BE,$AB,$BE,$AB,$AF,$EE,$EA
#_0CFEF5: db $AA,$3F,$AB,$AA,$AE,$AA,$AB,$AE
#_0CFEFD: db $BA,$AA,$FA,$2A,$A0,$20,$00,$A2
#_0CFF05: db $A8,$11,$00,$0C,$80,$04,$00,$20
#_0CFF0D: db $28,$80,$20,$40,$08,$84,$24,$13
#_0CFF15: db $10,$80,$20,$84,$00,$00,$00,$10
#_0CFF1D: db $20,$04,$00,$85,$22,$8C,$88,$86
#_0CFF25: db $00,$A4,$20,$80,$90,$80,$80,$10
#_0CFF2D: db $20,$41,$00,$AA,$A0,$20,$A0,$48
#_0CFF35: db $A0,$00,$2A,$0A,$20,$A0,$00,$84
#_0CFF3D: db $A0,$08,$A0,$46,$80,$00,$82,$49
#_0CFF45: db $20,$08,$A4,$EC,$00,$08,$08,$A0
#_0CFF4D: db $A0,$00,$08,$00,$04,$04,$80,$30
#_0CFF55: db $00,$50,$00,$00,$00,$C0,$00,$00
#_0CFF5D: db $44,$26,$A0,$29,$08,$00,$00,$00
#_0CFF65: db $20,$60,$28,$88,$00,$64,$A0,$81
#_0CFF6D: db $20,$00,$42,$00,$A0,$00,$A8,$00
#_0CFF75: db $A0,$82,$42,$01,$08,$80,$00,$0B
#_0CFF7D: db $A8,$00,$00,$EF,$BB,$FD,$FF,$E2
#_0CFF85: db $EF,$9F,$EF,$BF,$FF,$FB,$EF,$BB
#_0CFF8D: db $FF,$BD,$BF,$C7,$FF,$A7,$F7,$77
#_0CFF95: db $B7,$BF,$FD,$E6,$FF,$FE,$EF,$BB
#_0CFF9D: db $BF,$FF,$AF,$77,$F3,$FA,$BF,$EB
#_0CFFA5: db $AE,$DF,$A7,$EE,$FF,$6F,$BF,$FF
#_0CFFAD: db $EA,$FB,$EE,$BE,$BB,$EF,$BB,$AF
#_0CFFB5: db $AE,$AE,$FF,$66,$AB,$FF,$EF,$FE
#_0CFFBD: db $AF,$EA,$FF,$FF,$BF,$A1,$FF,$FF
#_0CFFC5: db $AE,$AB,$FF,$9B,$A7,$9E,$FF,$9F
#_0CFFCD: db $EE,$BF,$BF,$BB,$E2,$BA,$ED,$B7
#_0CFFD5: db $AF,$AF,$FE,$AB,$FF,$EB,$FE,$BF
#_0CFFDD: db $BF,$FF,$FB,$DF,$EE,$B5,$EF,$FF
#_0CFFE5: db $BF,$BD,$FF,$DB,$FE,$6B,$FF,$FF
#_0CFFED: db $EB,$7E,$AF,$FF,$FB,$ED,$FF,$BB
#_0CFFF5: db $BF,$73,$FF,$1C,$AE,$FF,$EF,$FF
#_0CFFFD: db $BB,$EB,$BB
