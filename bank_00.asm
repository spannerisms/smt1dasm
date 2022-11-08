org $008000

;===================================================================================================

Vector_Reset:
#_008000: SEI

#_008001: CLC
#_008002: XCE

#_008003: CLD

#_008004: REP #$10
#_008006: SEP #$20

#_008008: LDX.w #$1FFF
#_00800B: TXS

; This operand is used in one place to get a $00 byte for DMA
ZeroLand = $00800C+1

#_00800C: LDA.b #$00
#_00800E: STA.w NMITIMEN

#_008011: LDA.b #$80
#_008013: STA.w INIDISP

;===================================================================================================

CheckForConsoleReset:
#_008016: LDA.b #$00
#_008018: STA.l $7EFFFE
#_00801C: STA.l $7EFFFF

#_008020: LDX.w #$0000

.next_checksum_letter
#_008023: LDA.l TableByCozy,X ; Seems to be some checksum for WRAM
#_008027: CMP.l $7EFFE0,X
#_00802B: BNE .checksum_mismatch

#_00802D: INX
#_00802E: CPX.w #$0014
#_008031: BCC .next_checksum_letter
#_008033: BCS .skip_ATLUS

.checksum_mismatch
#_008035: JSL Animated_ATLUS

#_008039: LDX.w #$0000

.write_checksum
#_00803C: LDA.l TableByCozy,X
#_008040: STA.l $7EFFE0,X

#_008044: INX
#_008045: CPX.w #$0014
#_008048: BCC .write_checksum

.skip_ATLUS
#_00804A: JSL InitializeSPC

;===================================================================================================

ResetMemory:
#_00804E: REP #$30

#_008050: LDX.w #$1FFF
#_008053: TXS

#_008054: LDA.w #$0000
#_008057: TCD
#_008058: PHB

#_008059: LDA.w #$0000
#_00805C: STA.w $0000

#_00805F: LDA.w #$1FFD
#_008062: LDX.w #$0001
#_008065: TXY
#_008066: INY
#_008067: MVN $00, $00

#_00806A: LDA.w #$0000
#_00806D: STA.l $7E2000

#_008071: LDA.w #$CFFD
#_008074: LDX.w #$2001
#_008077: TXY
#_008078: INY
#_008079: MVN $7E, $7E

#_00807C: LDA.w #$0000
#_00807F: STA.l $7F0000

#_008083: LDA.w #$FFFC
#_008086: LDX.w #$0001
#_008089: TXY
#_00808A: INY
#_00808B: MVN $7F, $7F

#_00808E: PLB

; Seed RNG with uninitialize(?) RAM
#_00808F: LDA.l $7FFFFF
#_008093: AND.w #$00FF
#_008096: STA.w $0ED5

;---------------------------------------------------------------------------------------------------

#_008099: SEP #$10
#_00809B: REP #$20

#_00809D: LDA.w #$2100
#_0080A0: TCD

#_0080A1: LDX.b #$60
#_0080A3: STX.b OBSEL
#_0080A5: STX.w $0F44

#_0080A8: LDA.w #$0000
#_0080AB: STA.b OAMADDR

#_0080AD: LDX.b #$01
#_0080AF: STX.b BGMODE
#_0080B1: STX.w $0F45

#_0080B4: LDX.b #$00
#_0080B6: STX.b MOSAIC
#_0080B8: STX.w $0F46

#_0080BB: LDX.b #$38
#_0080BD: STX.b BG1SC
#_0080BF: STX.w $0F47

#_0080C2: LDX.b #$29
#_0080C4: STX.b BG2SC
#_0080C6: STX.w $0F48

#_0080C9: LDX.b #$3C
#_0080CB: STX.b BG3SC
#_0080CD: STX.w $0F49

#_0080D0: LDX.b #$34
#_0080D2: STX.b BG4SC
#_0080D4: STX.w $0F4A

#_0080D7: LDX.b #$43
#_0080D9: STX.b BG12NBA
#_0080DB: STX.w $0F4B

#_0080DE: LDX.b #$22
#_0080E0: STX.b BG34NBA
#_0080E2: STX.w $0F4C

;---------------------------------------------------------------------------------------------------
; This is just zeroing everything
;---------------------------------------------------------------------------------------------------
#_0080E5: LDX.b #$00

#_0080E7: STX.b BG1HOFS
#_0080E9: STX.w $0F4D

#_0080EC: STX.b BG1HOFS
#_0080EE: STX.w $0F4E

#_0080F1: STX.b BG1VOFS
#_0080F3: STX.w $0F4F

#_0080F6: STX.b BG1VOFS
#_0080F8: STX.w $0F50

#_0080FB: STX.b BG2HOFS
#_0080FD: STX.w $0F51

#_008100: STX.b BG2HOFS
#_008102: STX.w $0F52

#_008105: STX.b BG2VOFS
#_008107: STX.w $0F53

#_00810A: STX.b BG2VOFS
#_00810C: STX.w $0F54

#_00810F: STX.b BG3HOFS
#_008111: STX.w $0F55

#_008114: STX.b BG3HOFS
#_008116: STX.w $0F56

#_008119: STX.b BG3VOFS
#_00811B: STX.w $0F57

#_00811E: STX.b BG3VOFS
#_008120: STX.w $0F58

#_008123: STX.b BG4HOFS
#_008125: STX.w $0F59

#_008128: STX.b BG4HOFS
#_00812A: STX.w $0F5A

#_00812D: STX.b BG4VOFS
#_00812F: STX.w $0F5B

#_008132: STX.b BG4VOFS
#_008134: STX.w $0F50

#_008137: LDX.b #$80
#_008139: STX.b VMAIN
#_00813B: STX.w $0F5D

#_00813E: LDX.b #$1F
#_008140: STX.b TM
#_008142: STX.w $0F74

#_008145: LDX.b #$04
#_008147: STX.b TS
#_008149: STX.w $0F76

#_00814C: LDX.b #$00
#_00814E: STX.b TMW
#_008150: STX.w $0F78

#_008153: STX.b TSW
#_008155: STX.w $0F79

#_008158: STX.b CGWSEL
#_00815A: STX.b CGADSUB

#_00815C: LDX.b #$E0
#_00815E: STX.b COLDATA
#_008160: STX.w $0F7D

#_008163: LDX.b #$00
#_008165: STX.b SETINI

;---------------------------------------------------------------------------------------------------

#_008167: LDA.w #$4200
#_00816A: TCD

#_00816B: LDX.b #$FF
#_00816D: STX.b JOYPADIO

#_00816F: LDA.w #$0000
#_008172: STA.b HTIMEL
#_008174: STA.w $0F01

#_008177: STA.b VTIMEL
#_008179: STA.w $0F03

#_00817C: LDX.b #$00
#_00817E: STX.b MDMAEN
#_008180: STX.w $0F05
#_008183: STX.w $0F06

#_008186: STX.b HDMAEN
#_008188: STX.w $0F0D
#_00818B: STX.w $0F0E

#_00818E: LDA.w #$0000
#_008191: TCD

#_008192: JSL ZeroALOTofVRAM
#_008196: JSL Reset_OAMrelatedWRAM

;===================================================================================================

InitializeVector1900:
#_00819A: SEP #$30

#_00819C: LDY.b #$00

.copy_next_vector_K
#_00819E: LDA.w Vector1900_ProgramBank,Y
#_0081A1: STA.w $1900,Y

#_0081A4: INY
#_0081A5: CPY.b #$04
#_0081A7: BCC .copy_next_vector_K

;---------------------------------------------------------------------------------------------------

#_0081A9: LDY.b #$00

.copy_next_vector_B
#_0081AB: LDA.w Vector1900_DataBank,Y
#_0081AE: STA.w $1904,Y

#_0081B1: INY
#_0081B2: CPY.b #$04
#_0081B4: BCC .copy_next_vector_B

;---------------------------------------------------------------------------------------------------

#_0081B6: LDY.b #$00

.copy_next_vector_P
#_0081B8: LDA.w Vector1900_Processor,Y
#_0081BB: STA.w $1908,Y

#_0081BE: INY
#_0081BF: CPY.b #$04
#_0081C1: BCC .copy_next_vector_P

;---------------------------------------------------------------------------------------------------

#_0081C3: REP #$20

#_0081C5: LDX.b #$00

.copy_next_vector_PC
#_0081C7: LDA.w Vector1900_Defaults,X
#_0081CA: STA.w $190C,X

#_0081CD: INX
#_0081CE: INX
#_0081CF: CPX.b #$08
#_0081D1: BCC .copy_next_vector_PC

;---------------------------------------------------------------------------------------------------

#_0081D3: LDY.b #$00

.copy_next_vector_S
#_0081D5: LDA.w Vector1900_StackPointer,Y
#_0081D8: STA.w $1914,Y

#_0081DB: INY
#_0081DC: INY
#_0081DD: CPY.b #$08
#_0081DF: BCC .copy_next_vector_S

;---------------------------------------------------------------------------------------------------

#_0081E1: LDX.b #$00
#_0081E3: STX.w $1925

#_0081E6: LDX.b #$FF
#_0081E8: STX.w $0F7E

;===================================================================================================

MainLoop:
#_0081EB: JSR GetJoypadInput

#_0081EE: JSR PerformNewestVector

#_0081F1: JSL routine008838

#_0081F5: SEP #$20

#_0081F7: LDA.b #$00
#_0081F9: STA.w $0F7E

.wait_for_nmi
#_0081FC: BIT.w $0F7E
#_0081FF: BPL .wait_for_nmi

#_008201: BRA MainLoop

;===================================================================================================
; All these 1900 things are definitely partially related to waiting for NMI
; I'm just not 100% sure how the whole system works yet...
;===================================================================================================
Vector1900_ProgramBank:
#_008203: db routine00ADB8>>16
#_008204: db routine00B2DB>>16
#_008205: db routine028E6C>>16
#_008206: db $00

Vector1900_DataBank:
#_008207: db routine00ADB8>>16
#_008208: db routine00B2DB>>16
#_008209: db routine028E6C>>16
#_00820A: db $00

Vector1900_Processor:
#_00820B: db $00
#_00820C: db $00
#_00820D: db $02 ; zero flag
#_00820E: db $00

Vector1900_Defaults:
#_00820F: dw routine00ADB8>>0
#_008211: dw routine00B2DB>>0
#_008213: dw routine028E6C>>0
#_008215: dw $0000

Vector1900_StackPointer:
#_008217: dw $1F7F
#_008219: dw $1EFF
#_00821B: dw $1E7F
#_00821D: dw $1DFF

;===================================================================================================

GetJoypadInput:
#_00821F: SEP #$20

.wait_for_auto_joypad_read
#_008221: LDA.w HVBJOY
#_008224: LSR A
#_008225: BCS .wait_for_auto_joypad_read

#_008227: REP #$20

#_008229: LDA.w $0F2D
#_00822C: STA.w $0F2F

#_00822F: LDA.w $0F33
#_008232: STA.w $0F35

#_008235: LDA.w JOY1L
#_008238: STA.w $0F2D

#_00823B: LDA.w JOY2L
#_00823E: STA.w $0F33

#_008241: LDA.w $0F2D
#_008244: AND.w $0F2F
#_008247: EOR.w $0F2D
#_00824A: STA.w $0F2B

#_00824D: LDA.w $0F33
#_008250: AND.w $0F35
#_008253: EOR.w $0F33
#_008256: STA.w $0F31

#_008259: RTS

;===================================================================================================
; Takes $1925 and decrements it, so long as it is nonzero
; This value is placed in $191C
; $1925 is reset and the next vector is called
;===================================================================================================
PerformNewestVector:
#_00825A: SEP #$10

#_00825C: LDX.w $1925
#_00825F: BEQ .can_dec

#_008261: DEX

.can_dec
#_008262: STX.w $191C

#_008265: LDX.b #$00
#_008267: STX.w $1925

;===================================================================================================
; $191C is used to index the current vector queue
; The properties are then put in $191E
; The current location of stack is saved to $1921
; the vector queued up is jumped to
;===================================================================================================
Do19xxVectorCall:
#_00826A: SEP #$20

#_00826C: LDA.w $191C
#_00826F: ASL A
#_008270: TAY

#_008271: REP #$20

#_008273: LDA.w $190C,Y ; If no step, do the next one
#_008276: STA.w $191E
#_008279: BEQ IncrementVectorStep

#_00827B: TSC
#_00827C: STA.w $1921

#_00827F: LDA.w $1914,Y
#_008282: TCS

#_008283: SEP #$20

#_008285: LDY.w $191C

#_008288: LDA.w $1900,Y
#_00828B: STA.w $1920

#_00828E: LDA.w $1904,Y
#_008291: PHA
#_008292: PLB

#_008293: PHP
#_008294: PLA
#_008295: AND.b #$04
#_008297: ORA.w $1908,Y

#_00829A: PHA
#_00829B: PLP

#_00829C: JML [$191E]

;===================================================================================================
; Increments $191C and saves it to $1925
;===================================================================================================
AddSelfAsVectorAndMakeSpace:
#_00829F: PHP

#_0082A0: SEP #$10

#_0082A2: LDX.w $191C
#_0082A5: INX
#_0082A6: STX.w $1925

#_0082A9: PLP

;===================================================================================================
; TODO
;===================================================================================================
AddSelfAsVector:
#_0082AA: PHP
#_0082AB: SEP #$30

#_0082AD: LDA.w $191C
#_0082B0: TAY

#_0082B1: ASL A
#_0082B2: TAX

#_0082B3: PLA ; pull processor flag
#_0082B4: AND.b #$FB ; unset I flag
#_0082B6: STA.w $1908,Y ; save it

#_0082B9: PLA ; get low byte of address of where we return to
#_0082BA: STA.w $190C,X

#_0082BD: PLA ; get high byte of address
#_0082BE: STA.w $190D,X

#_0082C1: INC.w $190C,X ; Since it was a return, it was -1; make it exact
#_0082C4: BNE .nocarry

#_0082C6: INC.w $190D,X

.nocarry
#_0082C9: PLA ; get program bank of return address
#_0082CA: STA.w $1900,Y

#_0082CD: PHB ; save databank prior
#_0082CE: PLA
#_0082CF: STA.w $1904,Y

; X had index*2
; not sure why this needed to be with Y though
#_0082D2: TXY

#_0082D3: REP #$20

#_0082D5: TSC ; save stack
#_0082D6: STA.w $1914,Y

#_0082D9: LDA.w $1921 ; get the old stack we had
#_0082DC: TCS

#_0082DD: SEP #$20 ; databank here

#_0082DF: LDA.b #$00
#_0082E1: PHA
#_0082E2: PLB

;===================================================================================================

IncrementVectorStep:
#_0082E3: SEP #$20

#_0082E5: INC.w $191C

#_0082E8: LDA.w $191C
#_0082EB: CMP.w $1925
#_0082EE: BEQ .exit

#_0082F0: CMP.b #$04
#_0082F2: BCS .exit

#_0082F4: JMP Do19xxVectorCall

.exit
#_0082F7: RTS

;===================================================================================================

Native_NMI:
#_0082F8: REP #$30

#_0082FA: PHA
#_0082FB: PHX
#_0082FC: PHY

#_0082FD: PHD
#_0082FE: PHB

#_0082FF: SEP #$30

#_008301: LDA.w $0F00
#_008304: AND.b #$7F
#_008306: STA.w NMITIMEN
#_008309: STA.w $0F00

#_00830C: BIT.w RDNMI

#_00830F: LDA.w $0CF2
#_008312: BNE .skip_all_dma_and_reflag

#_008314: JSR routine0085B0

#_008317: LDA.w $0F7E
#_00831A: BNE .skip_all_dma

#_00831C: JSR TransferOAMfromWRAM

#_00831F: LDA.w $0F06
#_008322: BEQ .branch008372

#_008324: JSR SomeSortOfWRAMDMA

.branch008372
#_008327: LDA.w $0100
#_00832A: BEQ .branch008330

#_00832C: JSL WriteVRAMfrom0100

.branch008330
#_008330: LDA.l $7E22FD
#_008334: BEQ .skip_arb_cgram

#_008336: JSL UpdateCGRAMArb

.skip_arb_cgram
#_00833A: LDA.l $7E2220
#_00833E: BEQ .skip_vram_tile_palettes

#_008340: JSR UpdateVRAMTilePalettes

.skip_vram_tile_palettes
#_008343: JSR UpdateBG12Scroll

#_008346: LDA.w $0F0E
#_008349: BEQ .skip_hdma

#_00834B: JSR SetUpCachedHDMA

.skip_hdma
#_00834E: LDA.w $0F82
#_008351: BEQ .skip_cached_cgram

#_008353: JSL CacheCGRAMinWRAM

.skip_cached_cgram
#_008357: LDA.b #$FF
#_008359: STA.w $0F7E

.skip_all_dma_and_reflag
#_00835C: STZ.w $0CF2

;---------------------------------------------------------------------------------------------------

.skip_all_dma
#_00835F: INC.w $0451

#_008362: LDA.w $0F00
#_008365: ORA.b #$80
#_008367: STA.w NMITIMEN
#_00836A: STA.w $0F00

#_00836D: REP #$30

#_00836F: PLB
#_008370: PLD

#_008371: PLY
#_008372: PLX
#_008373: PLA

#_008374: RTI

;===================================================================================================

TransferOAMfromWRAM:
#_008375: REP #$20

#_008377: LDX.b #$00
#_008379: STX.w MDMAEN

#_00837C: STZ.w OAMADDR

#_00837F: LDX.b #$00
#_008381: STX.w DMA7MODE

#_008384: LDX.b #OAMDATA
#_008386: STX.w DMA7PORT

#_008389: LDA.w #$7E2000 ; $7E2000 seems to be OAM
#_00838C: STA.w DMA7ADDRL

#_00838F: LDX.b #$7E
#_008391: STX.w DMA7ADDRB

#_008394: LDA.w #$0220
#_008397: STA.w DMA7SIZEL

#_00839A: LDX.b #$80
#_00839C: STX.w MDMAEN

#_00839F: SEP #$20

#_0083A1: RTS

;===================================================================================================

SomeSortOfWRAMDMA:
#_0083A2: LDA.w $0F06
#_0083A5: CMP.b #$05
#_0083A7: BCS StartDMA_0083F5

#_0083A9: SEC
#_0083AA: SBC.b #$01
#_0083AC: ASL A
#_0083AD: TAX

#_0083AE: LDA.l .vectors+0,X
#_0083B2: STA.w $1926

#_0083B5: LDA.l .vectors+1,X
#_0083B9: STA.w $1927

#_0083BC: JMP ($1926)

.vectors
#_0083BF: dw VRAMDMAprep
#_0083C1: dw CGRAMDMAprep
#_0083C3: dw CGandVRAMDMAprep
#_0083C5: dw WRAMDMAprep

;===================================================================================================

WRAMDMAprep:
#_0083C7: LDA.w $0F0A
#_0083CA: STA.w WMADDL

#_0083CD: LDA.w $0F0B
#_0083D0: STA.w WMADDM

#_0083D3: LDA.w $0F0C
#_0083D6: STA.w WMADDH

#_0083D9: BRA StartDMA_0083F5

;===================================================================================================

CGRAMDMAprep:
#_0083DB: LDA.w $0F09
#_0083DE: STA.w CGADD

#_0083E1: BRA StartDMA_0083F5

;===================================================================================================

CGandVRAMDMAprep:
#_0083E3: LDA.w $0F09
#_0083E6: STA.w CGADD

;===================================================================================================

VRAMDMAprep:
#_0083E9: LDA.w $0F07
#_0083EC: STA.w VMADDL

#_0083EF: LDA.w $0F08
#_0083F2: STA.w VMADDH

;===================================================================================================

#StartDMA_0083F5:
#_0083F5: LDA.w $0F06
#_0083F8: STA.w MDMAEN

#_0083FB: LDA.b #$00
#_0083FD: STA.w $0F06

#_008400: RTS

;===================================================================================================

SetUpCachedHDMA:
#_008401: LDX.b #$00
#_008403: STX.w HDMAEN
#_008406: STX.w $1926

#_008409: LDA.w $0F0E
#_00840C: AND.b #$80
#_00840E: BMI .branch00844E

#_008410: LDA.b #$01
#_008412: STA.w $1927

;---------------------------------------------------------------------------------------------------

; TODO document these
.branch008415
#_008415: LDA.w $1927
#_008418: AND.w $0F0E
#_00841B: BEQ .branch00843B

#_00841D: LDA.w $1926
#_008420: ASL A
#_008421: ASL A
#_008422: TAY

#_008423: LDA.w $0F0F,Y
#_008426: STA.w DMAXPORT,X

#_008429: LDA.w $0F10,Y
#_00842C: STA.w DMAXADDRL,X

#_00842F: LDA.w $0F11,Y
#_008432: STA.w DMAXADDRH,X

#_008435: LDA.w $0F12,Y
#_008438: STA.w DMAXADDRB,X

.branch00843B
#_00843B: INC.w $1926

#_00843E: TXA
#_00843F: CLC
#_008440: ADC.b #$10
#_008442: TAX

#_008443: ASL.w $1927
#_008446: BNE .branch008415

;---------------------------------------------------------------------------------------------------

#_008448: LDA.w $0F0E
#_00844B: ORA.w $0F0D

.branch00844E
#_00844E: AND.b #$7F
#_008450: STA.w HDMAEN
#_008453: STA.w $0F0D

#_008456: LDA.b #$00
#_008458: STA.w $0F0E

#_00845B: RTS

;===================================================================================================

WriteVRAMfrom0100:
#_00845C: PHP
#_00845D: REP #$30

#_00845F: BIT.w $0100
#_008462: BMI .rle_transfer

;---------------------------------------------------------------------------------------------------

#_008464: LDY.w #$0002

.next_chunked_transfer
#_008467: LDA.w $0100,Y
#_00846A: STA.w VMADDL

#_00846D: INY
#_00846E: INY

#_00846F: LDX.w $0100,Y

#_008472: INY
#_008473: INY

.next_chunk_byte
#_008474: LDA.w $0100,Y
#_008477: STA.w VMDATAL

#_00847A: INY
#_00847B: INY

#_00847C: DEX
#_00847D: BNE .next_chunk_byte

#_00847F: DEC.w $0100
#_008482: BNE .next_chunked_transfer

#_008484: PLP
#_008485: RTL

;---------------------------------------------------------------------------------------------------

.rle_transfer
#_008486: SEP #$20

#_008488: LDA.w $0F5D ; vertical transfer
#_00848B: ORA.b #$01
#_00848D: STA.w VMAIN

#_008490: REP #$20

#_008492: LDA.w $0100
#_008495: AND.w #$7FFF
#_008498: ASL A
#_008499: STA.w $0100

#_00849C: LDY.w #$0000

.next_rle_transfer
#_00849F: LDA.w $0102
#_0084A2: STA.w VMADDL

#_0084A5: LDX.w $0104

.next_rle_byte
#_0084A8: LDA.w $0106,Y
#_0084AB: STA.w VMDATAL

#_0084AE: INY
#_0084AF: INY

#_0084B0: DEX
#_0084B1: BNE .next_rle_byte

#_0084B3: CPY.w $0100
#_0084B6: BCS .done

#_0084B8: INC.w $0102
#_0084BB: BRA .next_rle_transfer

.done
#_0084BD: LDA.w #$0000
#_0084C0: STA.w $0100

#_0084C3: SEP #$30

#_0084C5: LDA.w $0F5D
#_0084C8: STA.w VMAIN

#_0084CB: PLP
#_0084CC: RTL

;===================================================================================================

UpdateCGRAMArb:
#_0084CD: PHP
#_0084CE: PHD

#_0084CF: REP #$20

#_0084D1: LDA.w #$2100
#_0084D4: TCD

#_0084D5: SEP #$20

#_0084D7: PHB
#_0084D8: LDA.b #$7E
#_0084DA: PHA
#_0084DB: PLB

#_0084DC: REP #$10

#_0084DE: LDY.w #$0001

.next_chunk
#_0084E1: LDA.w $7E22FD,Y
#_0084E4: STA.b CGADD

#_0084E6: INY

#_0084E7: LDA.b #$00
#_0084E9: XBA

#_0084EA: LDA.w $7E22FD,Y
#_0084ED: TAX

#_0084EE: INY

.next_color
#_0084EF: LDA.w $7E22FD,Y
#_0084F2: STA.b CGDATA

#_0084F4: INY

#_0084F5: LDA.w $7E22FD,Y
#_0084F8: STA.b CGDATA

#_0084FA: INY

#_0084FB: DEX
#_0084FC: BNE .next_color

#_0084FE: DEC.w $7E22FD
#_008501: BNE .next_chunk

#_008503: PLB
#_008504: PLD
#_008505: PLP

#_008506: RTL

;===================================================================================================

CacheCGRAMinWRAM:
#_008507: PHP
#_008508: PHD

#_008509: REP #$20

#_00850B: LDA.w #$2100
#_00850E: TCD

#_00850F: SEP #$20

#_008511: PHB
#_008512: LDA.b #$7E
#_008514: PHA
#_008515: PLB

#_008516: REP #$10

#_008518: LDA.b #$00
#_00851A: STA.b CGADD

#_00851C: LDY.w #$0000

.next_color
#_00851F: LDA.b CGDATAREAD
#_008521: STA.w $7E2500,Y

#_008524: LDA.b CGDATAREAD
#_008526: STA.w $7E2501,Y

#_008529: INY
#_00852A: INY
#_00852B: CPY.w #$0100
#_00852E: BCC .next_color

#_008530: STZ.w $0F82

#_008533: PLB
#_008534: PLD
#_008535: PLP

#_008536: RTL

;===================================================================================================
; Takes tiles from VRAM and changes their palettes
;===================================================================================================
UpdateVRAMTilePalettes:
#_008537: REP #$30
#_008539: PHD

#_00853A: LDA.w #$2100
#_00853D: TCD
#_00853E: PHB

#_00853F: SEP #$20

#_008541: LDA.b #$7E
#_008543: PHA

#_008544: REP #$20
#_008546: PLB
#_008547: LDY.w #$0002

;---------------------------------------------------------------------------------------------------

.next_entry
#_00854A: LDA.w $7E2220,Y
#_00854D: STA.w $1926

#_008550: INY
#_008551: INY

#_008552: LDX.w $7E2220,Y ; number of consecutive tiles to check

#_008555: INY
#_008556: INY

.next_tile
#_008557: LDA.w $1926 ; set address
#_00855A: STA.b VMADDL

#_00855C: LDA.b VMDATALREAD
#_00855E: AND.w #$E3FF
#_008561: ORA.w $7E2220,Y

#_008564: PHA ; recover address, since it's incremented on read
#_008565: LDA.w $1926
#_008568: STA.b VMADDL
#_00856A: PLA

#_00856B: STA.b VMDATAL ; character with new palette

#_00856D: INC.w $1926
#_008570: INY
#_008571: INY
#_008572: DEX
#_008573: BNE .next_tile

#_008575: DEC.w $7E2220
#_008578: BNE .next_entry

;---------------------------------------------------------------------------------------------------

#_00857A: SEP #$30

#_00857C: PLB

#_00857D: PLD
#_00857E: RTS

;===================================================================================================

UpdateBG12Scroll:
#_00857F: LDA.w $0F4D
#_008582: STA.w BG1HOFS

#_008585: LDA.w $0F4E
#_008588: STA.w BG1HOFS

#_00858B: LDA.w $0F4F
#_00858E: STA.w BG1VOFS

#_008591: LDA.w $0F50
#_008594: STA.w BG1VOFS

#_008597: LDA.w $0F51
#_00859A: STA.w BG2HOFS

#_00859D: LDA.w $0F52
#_0085A0: STA.w BG2HOFS

#_0085A3: LDA.w $0F53
#_0085A6: STA.w BG2VOFS

#_0085A9: LDA.w $0F54
#_0085AC: STA.w BG2VOFS

#_0085AF: RTS

;===================================================================================================

routine0085B0:
#_0085B0: LDA.w $0F7F
#_0085B3: BNE .disable_irq

#_0085B5: PHB
#_0085B6: PHK
#_0085B7: PLB

#_0085B8: LDA.w $0F80
#_0085BB: ASL A
#_0085BC: TAX

#_0085BD: REP #$20

#_0085BF: LDA.l .vectors,X
#_0085C3: STA.w $1926

#_0085C6: LDA.w #.return-1
#_0085C9: PHA

#_0085CA: JMP ($1926)

.return
#_0085CD: SEP #$20

#_0085CF: LDA.w $0F00
#_0085D2: ORA.b #$20
#_0085D4: STA.w $0F00
#_0085D7: PLB

#_0085D8: RTS

;---------------------------------------------------------------------------------------------------

.disable_irq
#_0085D9: LDA.w $0F00
#_0085DC: AND.b #$CF
#_0085DE: STA.w NMITIMEN
#_0085E1: STA.w $0F00

#_0085E4: RTS

.vectors
#_0085E5: dw routine0085B0_SetIRQType1
#_0085E7: dw routine0085B0_SetIRQType2
#_0085E9: dw routine0085B0_SetIRQType1

;===================================================================================================

routine0085B0_SetIRQType1:
#_0085EB: SEP #$20

#_0085ED: LDA.w $0F45
#_0085F0: STA.w BGMODE

#_0085F3: LDA.w $0F4B
#_0085F6: STA.w BG12NBA

#_0085F9: LDA.w $0F76
#_0085FC: STA.w TS

#_0085FF: LDA.w $0F7B
#_008602: STA.w CGADSUB

#_008605: LDA.w $0F74
#_008608: STA.w TM

#_00860B: LDA.w Data_IRQ_Timer6A

#_00860E: STA.w VTIMEL
#_008611: STZ.w VTIMEH

#_008614: LDA.b #$20
#_008616: STA.w HTIMEL
#_008619: STZ.w HTIMEH

#_00861C: STZ.w $0F81

#_00861F: RTS

;===================================================================================================

routine0085B0_SetIRQType2:
#_008620: SEP #$20

#_008622: LDA.w $0F45
#_008625: STA.w BGMODE

#_008628: LDA.w $0F4B
#_00862B: STA.w BG12NBA

#_00862E: LDA.b #$10
#_008630: STA.w TS

#_008633: LDA.b #$01
#_008635: STA.w CGADSUB

#_008638: LDA.w Data_IRQ_Timer7F
#_00863B: CLC
#_00863C: ADC.w $0F81

#_00863F: STA.w VTIMEL
#_008642: STZ.w VTIMEH

#_008645: LDA.b #$20
#_008647: STA.w HTIMEL
#_00864A: STZ.w HTIMEH

#_00864D: RTS

;===================================================================================================

Native_IRQ:
#_00864E: REP #$30

#_008650: PHA
#_008651: PHX
#_008652: PHY
#_008653: PHD
#_008654: PHB

#_008655: SEP #$30

#_008657: PHB
#_008658: PHK
#_008659: PLB

#_00865A: LDA.w TIMEUP
#_00865D: BPL .exit

.wait_for_hblank
#_00865F: BIT.w HVBJOY
#_008662: BVC .wait_for_hblank

#_008664: LDX.b #$14

.wait_99_cycles
#_008666: DEX
#_008667: BNE .wait_99_cycles

#_008669: LDA.w $0F80
#_00866C: ASL A
#_00866D: TAX

; JSR (.vectors,X) next time
#_00866E: REP #$20

#_008670: LDA.l .vectors,X
#_008674: STA.w $1926

#_008677: LDA.w #.exit-1
#_00867A: PHA

#_00867B: JMP ($1926)

.exit
#_00867E: PLB

#_00867F: REP #$30
#_008681: PLB
#_008682: PLD
#_008683: PLY
#_008684: PLX
#_008685: PLA

#_008686: RTI

;---------------------------------------------------------------------------------------------------

.vectors
#_008687: dw IRQ_868D
#_008689: dw IRQ_86EB
#_00868B: dw IRQ_8708

;===================================================================================================

IRQ_868D:
#_00868D: LDA.w $0F81
#_008690: ASL A
#_008691: TAX

#_008692: REP #$20

#_008694: LDA.l .vectors,X
#_008698: STA.w $1928

#_00869B: JMP ($1928)

.vectors
#_00869E: dw IRQ_HandleSubScreen
#_0086A0: dw IRQ_BGMODE0

;===================================================================================================

IRQ_HandleSubScreen:
#_0086A2: SEP #$20

#_0086A4: LDA.w $0F77
#_0086A7: STA.w TS

#_0086AA: LDA.w $0F7C
#_0086AD: STA.w CGADSUB

#_0086B0: LDA.w Data_IRQ_Timer7F
#_0086B3: STA.w VTIMEL
#_0086B6: STZ.w VTIMEH

#_0086B9: LDA.b #$20
#_0086BB: STA.w HTIMEL
#_0086BE: STZ.w HTIMEH

#_0086C1: INC.w $0F81

#_0086C4: RTS

;===================================================================================================

IRQ_BGMODE0:
#_0086C5: SEP #$20

#_0086C7: LDA.b #$00
#_0086C9: STA.w BGMODE

#_0086CC: LDA.b #$42
#_0086CE: STA.w BG12NBA

#_0086D1: LDA.w $0F74
#_0086D4: AND.w $0F75
#_0086D7: STA.w TM

#_0086DA: LDA.w $0F00
#_0086DD: AND.b #$CF
#_0086DF: STA.w NMITIMEN
#_0086E2: STA.w $0F00

#_0086E5: INC.w $0F81

#_0086E8: RTS

;===================================================================================================

Data_IRQ_Timer6A:
#_0086E9: db $6A

Data_IRQ_Timer7F:
#_0086EA: db $7F

;===================================================================================================

IRQ_86EB:
#_0086EB: SEP #$20

#_0086ED: LDA.w $0F7F
#_0086F0: BNE .skip_bg_change

#_0086F2: LDA.b #$00
#_0086F4: STA.w BGMODE

#_0086F7: LDA.b #$42
#_0086F9: STA.w BG12NBA

.skip_bg_change
#_0086FC: LDA.w $0F00
#_0086FF: AND.b #$CF
#_008701: STA.w NMITIMEN
#_008704: STA.w $0F00

#_008707: RTS

;===================================================================================================

IRQ_8708:
#_008708: LDA.w $0F81
#_00870B: ASL A
#_00870C: TAX

#_00870D: REP #$20

#_00870F: LDA.l .vectors,X
#_008713: STA.w $1928

#_008716: JMP ($1928)

.vectors
#_008719: dw IRQ_HandleMainScreen
#_00871B: dw IRQ_BGMODE0_B

;===================================================================================================

IRQ_HandleMainScreen:
#_00871D: SEP #$20

#_00871F: LDA.b #$0E ; BG 2, 3, 4
#_008721: STA.w TM

#_008724: LDA.w Data_IRQ_Timer7F
#_008727: STA.w VTIMEL
#_00872A: STZ.w VTIMEH

#_00872D: LDA.b #$20
#_00872F: STA.w HTIMEL
#_008732: STZ.w HTIMEH

#_008735: INC.w $0F81

#_008738: RTS

;===================================================================================================

IRQ_BGMODE0_B:
#_008739: SEP #$20

#_00873B: LDA.b #$00
#_00873D: STA.w BGMODE

#_008740: LDA.b #$42 ; BG1: $2000 | BG2: $4000
#_008742: STA.w BG12NBA

#_008745: LDA.w $0F77
#_008748: STA.w TS

#_00874B: LDA.w $0F7C
#_00874E: STA.w CGADSUB

#_008751: LDA.b #$0C
#_008753: STA.w TM

#_008756: LDA.w $0F00
#_008759: AND.b #$CF
#_00875B: STA.w NMITIMEN
#_00875E: STA.w $0F00

#_008761: INC.w $0F81

#_008764: RTS

;===================================================================================================

WaitForVBlankExceptItsNotUsed:
#_008765: PHP

#_008766: BIT.w RDNMI

.wait
#_008769: BIT.w RDNMI
#_00876C: BPL .wait

#_00876E: BIT.w RDNMI

#_008771: PLP
#_008772: RTL

;===================================================================================================

TableByCozy:
#_008773: db "programming by cozy!"

;===================================================================================================
; TODO This seems entirely related to OAM
;===================================================================================================
Reset_OAMrelatedWRAM:
#_008787: PHP
#_008788: REP #$30

#_00878A: PHB

#_00878B: SEP #$20

#_00878D: LDA.b #$7E
#_00878F: PHA

#_008790: REP #$20
#_008792: PLB

#_008793: LDY.w #$0000

; Clears out everything objects it seems
.next_object_h
#_008796: LDA.w #$F000
#_008799: STA.w $7E2000,Y

#_00879C: LDA.w #$0000
#_00879F: STA.w $7E2002,Y

#_0087A2: INY
#_0087A3: INY
#_0087A4: INY
#_0087A5: INY
#_0087A6: CPY.w #$0200
#_0087A9: BCC .next_object_h

;---------------------------------------------------------------------------------------------------

#_0087AB: LDA.w #$5555

.next_object_l
#_0087AE: STA.w $7E2000,Y
#_0087B1: INY
#_0087B2: INY
#_0087B3: CPY.w #$0220
#_0087B6: BCC .next_object_l

;---------------------------------------------------------------------------------------------------

#_0087B8: LDX.w #$003E
#_0087BB: LDA.w #$0000

.branch0087BE
#_0087BE: STA.w $0000,X
#_0087C1: STA.w $1A60,X
#_0087C4: STA.w $1AA0,X
#_0087C7: STA.w $1AE0,X
#_0087CA: STA.w $0040,X
#_0087CD: STA.w $1B80,X

#_0087D0: DEX
#_0087D1: DEX
#_0087D2: BPL .branch0087BE

#_0087D4: SEP #$20
#_0087D6: PLB
#_0087D7: LDY.w #$001F

.branch0087DA
#_0087DA: STA.w $1A00,Y
#_0087DD: STA.w $1A20,Y
#_0087E0: STA.w $1A40,Y
#_0087E3: STA.w $1B60,Y
#_0087E6: DEY
#_0087E7: BPL .branch0087DA

#_0087E9: LDX.w #$003F

.branch0087EC
#_0087EC: LDA.l .data,X
#_0087F0: STA.w $1B20,X

#_0087F3: DEX
#_0087F4: BPL .branch0087EC

#_0087F6: PLP
#_0087F7: RTL

; TODO static data of some kind
; probably 16 bit entries
.data
#_0087F8: db $00,$00,$10,$00,$20,$00,$30,$00
#_008800: db $40,$00,$50,$00,$60,$00,$70,$00
#_008808: db $80,$00,$90,$00,$A0,$00,$B0,$00
#_008810: db $C0,$00,$D0,$00,$E0,$00,$F0,$00
#_008818: db $00,$01,$10,$01,$20,$01,$30,$01
#_008820: db $40,$01,$50,$01,$60,$01,$70,$01
#_008828: db $80,$01,$90,$01,$A0,$01,$B0,$01
#_008830: db $C0,$01,$D0,$01,$E0,$01,$E8,$01

;===================================================================================================

routine008838:
#_008838: PHP
#_008839: SEP #$30

#_00883B: PHB

#_00883C: LDA.b #$06
#_00883E: PHA
#_00883F: PLB

#_008840: LDY.b #$1F
#_008842: STY.w $1946

;===================================================================================================
; TODO
; Something with OAM but idk what yet
; In bank06
;===================================================================================================
routine008838_preset:

.next_big_loop
#_008845: LDA.w $1946
#_008848: TAY

#_008849: ASL A
#_00884A: TAX

#_00884B: LDA.w $1A00,Y
#_00884E: BPL .branch008866

#_008850: REP #$20
#_008852: ASL.w $0000,X

#_008855: LDA.w #$8000
#_008858: CLC
#_008859: ADC.w $0000,X
#_00885C: STA.w $0000,X

#_00885F: LDA.b ($00,X)
#_008861: STA.w $0000,X

#_008864: BRA .branch0088AA

.branch008866
#_008866: AND.b #$40
#_008868: BEQ .branch008889

#_00886A: REP #$20
#_00886C: LDA.w $1AE0,X
#_00886F: BEQ .branch008876

#_008871: DEC.w $1AE0,X
#_008874: BEQ .branch0088A4

.branch008876
#_008876: DEC.w $0000,X
#_008879: DEC.w $0000,X
#_00887C: LDA.b ($00,X)

#_00887E: STA.w $1947
#_008881: INC.w $0000,X
#_008884: INC.w $0000,X
#_008887: BRA .branch0088C9

.branch008889
#_008889: LDA.w $1A00,Y
#_00888C: AND.b #$08
#_00888E: BNE .branch0088CC

#_008890: REP #$20
#_008892: LDA.w $0000,X
#_008895: BNE .branch00889A

#_008897: JMP .branch00893D

.branch00889A
#_00889A: LDA.w $1AE0,X
#_00889D: BEQ .branch0088CC

#_00889F: DEC.w $1AE0,X
#_0088A2: BNE .branch0088CC

.branch0088A4
#_0088A4: INC.w $0000,X
#_0088A7: INC.w $0000,X

.branch0088AA
#_0088AA: LDA.b ($00,X)
#_0088AC: BNE .branch0088BB

#_0088AE: INC.w $0000,X
#_0088B1: INC.w $0000,X
#_0088B4: LDA.b ($00,X)
#_0088B6: STA.w $0000,X
#_0088B9: LDA.b ($00,X)

.branch0088BB
#_0088BB: STA.w $1947
#_0088BE: INC.w $0000,X
#_0088C1: INC.w $0000,X
#_0088C4: LDA.b ($00,X)
#_0088C6: STA.w $1AE0,X

.branch0088C9
#_0088C9: JSR routine00894A

.branch0088CC
#_0088CC: SEP #$20
#_0088CE: LDA.w $1A40,Y
#_0088D1: AND.b #$C0
#_0088D3: BEQ .branch0088D8

#_0088D5: JSR routine008C73

.branch0088D8
#_0088D8: TYA
#_0088D9: ASL A
#_0088DA: TAX
#_0088DB: LDA.w $1A20,Y
#_0088DE: BPL .branch0088F6

#_0088E0: REP #$20

#_0088E2: ASL.w $0040,X

#_0088E5: LDA.w #$D901
#_0088E8: CLC
#_0088E9: ADC.w $0040,X
#_0088EC: STA.w $0040,X

#_0088EF: LDA.b ($40,X)
#_0088F1: STA.w $0040,X
#_0088F4: BRA .branch008916

.branch0088F6
#_0088F6: AND.b #$40
#_0088F8: BNE .branch00893D

#_0088FA: REP #$20
#_0088FC: LDA.w $0040,X
#_0088FF: BEQ .branch00893D

#_008901: LDA.w $0000,X
#_008904: BEQ .branch00893D

#_008906: LDA.w $1B80,X
#_008909: BEQ .branch00893A

#_00890B: DEC.w $1B80,X
#_00890E: BNE .branch00893A

#_008910: INC.w $0040,X
#_008913: INC.w $0040,X

.branch008916
#_008916: LDA.b ($40,X)
#_008918: BNE .branch008927

#_00891A: INC.w $0040,X
#_00891D: INC.w $0040,X
#_008920: LDA.b ($40,X)
#_008922: STA.w $0040,X
#_008925: LDA.b ($40,X)

.branch008927
#_008927: STA.w $1960
#_00892A: INC.w $0040,X
#_00892D: INC.w $0040,X
#_008930: LDA.b ($40,X)
#_008932: STA.w $1B80,X
#_008935: JSR routine008CD4
#_008938: BCS .branch00893D

.branch00893A
#_00893A: JSR routine008D25

.branch00893D
#_00893D: SEP #$30
#_00893F: DEC.w $1946
#_008942: BMI .exit

#_008944: JMP .next_big_loop

.exit
#_008947: PLB

#_008948: PLP
#_008949: RTL

;===================================================================================================
; TODO
; something OAM
;===================================================================================================
routine00894A:
#_00894A: LDA.w $1947 ; this is some address
#_00894D: STA.w $009E
#_008950: BNE .valid_address

#_008952: LDA.w $1B20,X
#_008955: LDY.w $1946
#_008958: LDX.w $1B60,Y
#_00895B: BEQ .branch008979

#_00895D: REP #$10
#_00895F: TAY
#_008960: PHB

#_008961: SEP #$20
#_008963: LDA.b #$7E
#_008965: PHA

#_008966: REP #$20
#_008968: PLB
#_008969: LDA.w #$E000

.branch00896C
#_00896C: STA.w $7E2000,Y
#_00896F: INY
#_008970: INY
#_008971: INY
#_008972: INY
#_008973: DEX
#_008974: BNE .branch00896C

#_008976: SEP #$20
#_008978: PLB

.branch008979
#_008979: SEP #$30
#_00897B: LDA.w $1946
#_00897E: TAY
#_00897F: ASL A
#_008980: TAX
#_008981: LDA.b #$00
#_008983: STA.w $0000,X
#_008986: STA.w $0001,X
#_008989: STA.w $1AE0,X
#_00898C: STA.w $1AE1,X
#_00898F: STA.w $1A00,Y
#_008992: STA.w $1A20,Y
#_008995: STA.w $1A40,Y
#_008998: STA.w $1B60,Y
#_00899B: RTS

.valid_address
#_00899C: SEP #$20
#_00899E: LDY.b #$00
#_0089A0: STY.w $194B
#_0089A3: STY.w $194C
#_0089A6: STY.w $1950
#_0089A9: STY.w $1952

; Get object sizes from OBSEL mirror
; TODO why the bitmask?
#_0089AC: LDA.w $0F44
#_0089AF: ROL A
#_0089B0: ROL A
#_0089B1: ROL A
#_0089B2: ROL A
#_0089B3: AND.b #$03
#_0089B5: ASL A
#_0089B6: TAX

#_0089B7: LDA.b ($9E),Y
#_0089B9: STA.w $1959
#_0089BC: BPL .branch0089BF

#_0089BE: INX

.branch0089BF
#_0089BF: LDA.l data008C67,X
#_0089C3: STA.w $194F
#_0089C6: STA.w $1951

#_0089C9: INY
#_0089CA: LDA.b ($9E),Y
#_0089CC: STA.w $1953

#_0089CF: INY
#_0089D0: LDA.b ($9E),Y
#_0089D2: STA.w $1954

#_0089D5: LDX.w $1946
#_0089D8: LDA.w $1A00,X

#_0089DB: ASL A
#_0089DC: ASL A
#_0089DD: AND.b #$C0
#_0089DF: STA.w $195A

#_0089E2: LDA.w $1B60,X
#_0089E5: STA.w $195F

#_0089E8: LDA.b #$00
#_0089EA: STA.w $1B60,X

#_0089ED: LDA.w $1A00,X
#_0089F0: ROR A
#_0089F1: ROR A
#_0089F2: ROR A
#_0089F3: AND.b #$C0
#_0089F5: STA.w $1967

#_0089F8: ROL A
#_0089F9: AND.b #$01
#_0089FB: STA.w $1968

#_0089FE: LDA.w $1A40,X
#_008A01: AND.b #$07
#_008A03: ASL A
#_008A04: STA.w $1969

#_008A07: TXA
#_008A08: ASL A
#_008A09: TAX
#_008A0A: BIT.w $195A
#_008A0D: BVC .branch008A36

#_008A0F: LDA.w $1953
#_008A12: STA.w PPUMULT16
#_008A15: LDA.b #$00
#_008A17: STA.w PPUMULT16
#_008A1A: LDA.w $194F
#_008A1D: STA.w PPUMULT8
#_008A20: LDA.w MPYL
#_008A23: STA.w $194B
#_008A26: LDA.w $194F
#_008A29: EOR.b #$FF
#_008A2B: CLC
#_008A2C: ADC.b #$01
#_008A2E: STA.w $194F
#_008A31: LDA.b #$01
#_008A33: STA.w $1950

.branch008A36
#_008A36: LDA.w $1A60,X
#_008A39: CLC
#_008A3A: ADC.w $194B
#_008A3D: STA.w $194B
#_008A40: LDA.w $1A61,X
#_008A43: ADC.b #$00
#_008A45: STA.w $1955
#_008A48: BIT.w $195A
#_008A4B: BPL .branch008A74

#_008A4D: LDA.w $1954
#_008A50: STA.w PPUMULT16
#_008A53: LDA.b #$00
#_008A55: STA.w PPUMULT16
#_008A58: LDA.w $1951
#_008A5B: STA.w PPUMULT8
#_008A5E: LDA.w MPYL
#_008A61: STA.w $194C
#_008A64: LDA.w $1951
#_008A67: EOR.b #$FF
#_008A69: CLC
#_008A6A: ADC.b #$01
#_008A6C: STA.w $1951
#_008A6F: LDA.b #$01
#_008A71: STA.w $1952

.branch008A74
#_008A74: LDA.w $1AA0,X
#_008A77: CLC
#_008A78: ADC.w $194C
#_008A7B: STA.w $194C
#_008A7E: LDA.w $1AA1,X
#_008A81: ADC.b #$00
#_008A83: STA.w $1957
#_008A86: INY
#_008A87: LDA.w $1959
#_008A8A: LSR A
#_008A8B: ROL.w $1956
#_008A8E: LDA.b ($9E),Y
#_008A90: BIT.w $195A
#_008A93: BVC .branch008A95

.branch008A95
#_008A95: CLC
#_008A96: ADC.w $194B
#_008A99: STA.w $194B
#_008A9C: LDA.w $1956
#_008A9F: AND.b #$01
#_008AA1: ADC.w $1955
#_008AA4: STA.w $1955
#_008AA7: INY
#_008AA8: LDA.w $1959
#_008AAB: LSR A
#_008AAC: LSR A
#_008AAD: ROL.w $1958
#_008AB0: LDA.b ($9E),Y
#_008AB2: BIT.w $195A
#_008AB5: BPL .branch008AC6

#_008AB7: EOR.b #$FF
#_008AB9: CLC
#_008ABA: ADC.b #$01
#_008ABC: PHA
#_008ABD: LDA.w $1958
#_008AC0: EOR.b #$FF
#_008AC2: STA.w $1958
#_008AC5: PLA

.branch008AC6
#_008AC6: CLC
#_008AC7: ADC.w $194C
#_008ACA: STA.w $194C
#_008ACD: STA.w $194E
#_008AD0: LDA.w $1958
#_008AD3: AND.b #$01
#_008AD5: ADC.w $1957
#_008AD8: STA.w $1957

#_008ADB: REP #$20
#_008ADD: LDA.w $1B20,X
#_008AE0: STA.w $195B

#_008AE3: SEP #$20
#_008AE5: INY

;===================================================================================================

routine008AE6:
#_008AE6: LDA.w $1953
#_008AE9: STA.w $195D
#_008AEC: LDA.w $194B
#_008AEF: STA.w $194D
#_008AF2: LDA.w $1955
#_008AF5: STA.w $1956

;===================================================================================================

ThisMightDoArbOAM:
#_008AF8: CPY.b #$06
#_008AFA: BCC .branch008B01

#_008AFC: BIT.w $1959
#_008AFF: BVS .branch008B62

.branch008B01
#_008B01: LDA.b ($9E),Y
#_008B03: STA.w $1949
#_008B06: INY
#_008B07: LDA.b ($9E),Y
#_008B09: STA.w $194A
#_008B0C: INY
#_008B0D: AND.b #$01
#_008B0F: ORA.w $1949
#_008B12: BNE .branch008B6C

#_008B14: LDA.w $194A
#_008B17: LSR A
#_008B18: TAX

.branch008B19
#_008B19: DEC.w $195D
#_008B1C: BMI .branch008B36

#_008B1E: LDA.w $194D
#_008B21: CLC
#_008B22: ADC.w $194F
#_008B25: STA.w $194D
#_008B28: LDA.w $1956
#_008B2B: ADC.w $1950
#_008B2E: STA.w $1956
#_008B31: DEX
#_008B32: BNE .branch008B19
#_008B34: BEQ ThisMightDoArbOAM

.branch008B36
#_008B36: LDA.w $1953
#_008B39: STA.w $195D
#_008B3C: LDA.w $194B
#_008B3F: STA.w $194D
#_008B42: DEC.w $1954
#_008B45: BPL .branch008B4A

#_008B47: JMP .branch008C23

;---------------------------------------------------------------------------------------------------

.branch008B4A
#_008B4A: LDA.w $194E
#_008B4D: CLC
#_008B4E: ADC.w $1951
#_008B51: STA.w $194E
#_008B54: LDA.w $1957
#_008B57: ADC.w $1952
#_008B5A: STA.w $1957
#_008B5D: DEX
#_008B5E: BNE .branch008B19

#_008B60: BEQ ThisMightDoArbOAM

.branch008B62
#_008B62: INC.w $1949
#_008B65: BNE .branch008B6A

#_008B67: INC.w $194A

.branch008B6A
#_008B6A: BRA .branch008B85

.branch008B6C
#_008B6C: LDA.w $1967
#_008B6F: CLC
#_008B70: ADC.w $1949
#_008B73: STA.w $1949
#_008B76: LDA.w $1968
#_008B79: ADC.w $194A
#_008B7C: EOR.w $195A
#_008B7F: EOR.w $1969
#_008B82: STA.w $194A

.branch008B85
#_008B85: REP #$30
#_008B87: PHB

#_008B88: SEP #$20
#_008B8A: LDA.b #$7E
#_008B8C: PHA

#_008B8D: REP #$20
#_008B8F: PLB
#_008B90: LDX.w $195B
#_008B93: LDA.w $194D
#_008B96: STA.w $7E2000,X
#_008B99: LDA.w $1949
#_008B9C: STA.w $7E2002,X
#_008B9F: TXA
#_008BA0: CLC
#_008BA1: ADC.w #$0004
#_008BA4: STA.w $195B
#_008BA7: TXA
#_008BA8: LSR A
#_008BA9: LSR A
#_008BAA: TAX
#_008BAB: LSR A
#_008BAC: LSR A

#_008BAD: SEP #$30
#_008BAF: PHY
#_008BB0: PHA
#_008BB1: TXA
#_008BB2: AND.b #$03
#_008BB4: TAY
#_008BB5: PLX
#_008BB6: LDA.w $1959
#_008BB9: ASL A
#_008BBA: ROL.w $195E
#_008BBD: LDA.w $1956
#_008BC0: LSR A
#_008BC1: ROL.w $195E
#_008BC4: LDA.w $195E
#_008BC7: AND.b #$03
#_008BC9: STA.w $195E
#_008BCC: LDA.b #$FC

.branch008BCE
#_008BCE: DEY
#_008BCF: BMI .branch008BDC

#_008BD1: SEC
#_008BD2: ROL A
#_008BD3: ROL A
#_008BD4: ASL.w $195E
#_008BD7: ASL.w $195E
#_008BDA: BRA .branch008BCE

.branch008BDC
#_008BDC: AND.w $7E2200,X
#_008BDF: ORA.w $195E
#_008BE2: STA.w $7E2200,X
#_008BE5: PLY
#_008BE6: LDX.w $1946
#_008BE9: INC.w $1B60,X
#_008BEC: PLB
#_008BED: DEC.w $195D
#_008BF0: BMI .branch008C08

#_008BF2: LDA.w $194D
#_008BF5: CLC
#_008BF6: ADC.w $194F
#_008BF9: STA.w $194D
#_008BFC: LDA.w $1956
#_008BFF: ADC.w $1950
#_008C02: STA.w $1956
#_008C05: JMP ThisMightDoArbOAM

.branch008C08
#_008C08: DEC.w $1954
#_008C0B: BMI .branch008C23

#_008C0D: LDA.w $194E
#_008C10: CLC
#_008C11: ADC.w $1951
#_008C14: STA.w $194E
#_008C17: LDA.w $1957
#_008C1A: ADC.w $1952
#_008C1D: STA.w $1957
#_008C20: JMP routine008AE6

;---------------------------------------------------------------------------------------------------

.branch008C23
#_008C23: LDX.w $1946
#_008C26: LDA.w $195F
#_008C29: SEC
#_008C2A: SBC.w $1B60,X
#_008C2D: BEQ .branch008C4A

#_008C2F: BCC .branch008C4A

#_008C31: TAX
#_008C32: PHB
#_008C33: LDA.b #$7E
#_008C35: PHA
#_008C36: PLB

#_008C37: REP #$30
#_008C39: LDY.w $195B
#_008C3C: LDA.w #$F000

.branch008C3F
#_008C3F: STA.w $7E2000,Y
#_008C42: INY
#_008C43: INY
#_008C44: INY
#_008C45: INY
#_008C46: DEX
#_008C47: BNE .branch008C3F

#_008C49: PLB

.branch008C4A
#_008C4A: SEP #$30
#_008C4C: LDY.w $1946
#_008C4F: LDA.w $1A00,Y
#_008C52: AND.b #$3F
#_008C54: STA.w $1A00,Y
#_008C57: LDA.w $1A40,Y
#_008C5A: AND.b #$08
#_008C5C: BEQ .exit

#_008C5E: LDA.w $1A40,Y
#_008C61: ORA.b #$40
#_008C63: STA.w $1A40,Y

.exit
#_008C66: RTS

;===================================================================================================

data008C67:
#_008C67: db $08,$10,$08,$20,$08,$40,$10,$20
#_008C6F: db $10,$40,$20,$40

;===================================================================================================

routine008C73:
#_008C73: LDX.b #$FF
#_008C75: LDA.w $1A40,Y
#_008C78: AND.b #$40
#_008C7A: BEQ .branch008C86

#_008C7C: LDX.b #$CF
#_008C7E: LDA.w $1A40,Y
#_008C81: ORA.b #$08
#_008C83: STA.w $1A40,Y

.branch008C86
#_008C86: STX.w $1964
#_008C89: AND.b #$30
#_008C8B: STA.w $1965
#_008C8E: LDA.w $1A40,Y
#_008C91: AND.b #$80
#_008C93: BEQ .branch008C97

#_008C95: LDA.b #$08

.branch008C97
#_008C97: STA.w $1966
#_008C9A: LDX.w $1B60,Y
#_008C9D: BEQ .branch008CC6

#_008C9F: TYA
#_008CA0: ASL A
#_008CA1: TAY

#_008CA2: REP #$30
#_008CA4: LDA.w $1B20,Y
#_008CA7: TAY

#_008CA8: SEP #$20
#_008CAA: PHB
#_008CAB: LDA.b #$7E
#_008CAD: PHA
#_008CAE: PLB

.branch008CAF
#_008CAF: LDA.w $7E2003,Y
#_008CB2: AND.w $1964
#_008CB5: ORA.w $1965
#_008CB8: ORA.w $1966
#_008CBB: STA.w $7E2003,Y
#_008CBE: INY
#_008CBF: INY
#_008CC0: INY
#_008CC1: INY
#_008CC2: DEX
#_008CC3: BNE .branch008CAF

#_008CC5: PLB

.branch008CC6
#_008CC6: SEP #$10

#_008CC8: LDY.w $1946

#_008CCB: LDA.w $1A40,Y
#_008CCE: AND.b #$BF
#_008CD0: STA.w $1A40,Y

#_008CD3: RTS

;===================================================================================================

; TODO i think this is in bank06?
routine008CD4:
#_008CD4: LDA.w $1960
#_008CD7: BEQ .fail

#_008CD9: AND.w #$00FF
#_008CDC: ASL A
#_008CDD: ADC.w #$DFE7
#_008CE0: STA.w $009E

#_008CE3: LDY.b #$00
#_008CE5: LDA.b ($9E),Y
#_008CE7: STA.w $1BC0,X

#_008CEA: LDA.w $1961
#_008CED: AND.w #$00FF
#_008CF0: ASL A
#_008CF1: ADC.w #$E017
#_008CF4: STA.w $009E

#_008CF7: LDY.b #$00
#_008CF9: LDA.b ($9E),Y
#_008CFB: STA.w $1C00,X

#_008CFE: LDA.w #$0000
#_008D01: STA.w $1C40,X
#_008D04: STA.w $1C80,X

#_008D07: LDY.w $1946

#_008D0A: CLC
#_008D0B: RTS

;---------------------------------------------------------------------------------------------------

.fail
#_008D0C: STA.w $0040,X
#_008D0F: STA.w $1B80,X
#_008D12: STA.w $1BC0,X
#_008D15: STA.w $1C00,X
#_008D18: STA.w $1C40,X
#_008D1B: STA.w $1C80,X

#_008D1E: SEP #$20

#_008D20: STA.w $1A20,Y

#_008D23: SEC
#_008D24: RTS

;===================================================================================================

routine008D25:
#_008D25: SEP #$20

#_008D27: PHB

#_008D28: LDA.b #$7E
#_008D2A: PHA
#_008D2B: PLB

#_008D2C: LDA.w $1A20,Y
#_008D2F: ASL A
#_008D30: ASL A
#_008D31: STA.w $195A

#_008D34: ASL A
#_008D35: ASL A
#_008D36: STA.w $1962

#_008D39: BIT.w $1962
#_008D3C: BVS .branch008D5D

#_008D3E: BIT.w $195A
#_008D41: BVS .branch008D51

#_008D43: REP #$20

#_008D45: LDA.w $1C40,X
#_008D48: CLC
#_008D49: ADC.w $1BC0,X
#_008D4C: STA.w $1C40,X

#_008D4F: BRA .branch008D5D

;---------------------------------------------------------------------------------------------------

.branch008D51
#_008D51: REP #$20

#_008D53: LDA.w $1C40,X
#_008D56: SEC
#_008D57: SBC.w $1BC0,X
#_008D5A: STA.w $1C40,X

.branch008D5D
#_008D5D: SEP #$20

#_008D5F: BIT.w $1962
#_008D62: BMI .branch008D83

#_008D64: BIT.w $195A
#_008D67: BMI .branch008D77

#_008D69: REP #$20

#_008D6B: LDA.w $1C80,X
#_008D6E: CLC
#_008D6F: ADC.w $1C00,X
#_008D72: STA.w $1C80,X

#_008D75: BRA .branch008D83

;---------------------------------------------------------------------------------------------------

.branch008D77
#_008D77: REP #$20
#_008D79: LDA.w $1C80,X
#_008D7C: SEC
#_008D7D: SBC.w $1C00,X
#_008D80: STA.w $1C80,X

.branch008D83
#_008D83: SEP #$20
#_008D85: LDA.w $1C41,X
#_008D88: PHA
#_008D89: ASL A
#_008D8A: ROL.w $1956
#_008D8D: PLA
#_008D8E: CLC
#_008D8F: ADC.w $1A60,X
#_008D92: STA.w $1A60,X
#_008D95: LDA.w $1956
#_008D98: ADC.w $1A61,X
#_008D9B: AND.b #$01
#_008D9D: STA.w $1A61,X
#_008DA0: LDA.w $1C81,X
#_008DA3: PHA
#_008DA4: ASL A
#_008DA5: ROL.w $1958
#_008DA8: PLA
#_008DA9: CLC
#_008DAA: ADC.w $1AA0,X
#_008DAD: STA.w $1AA0,X
#_008DB0: LDA.w $1958
#_008DB3: ADC.w $1AA1,X
#_008DB6: AND.b #$01
#_008DB8: STA.w $1AA1,X

#_008DBB: REP #$20
#_008DBD: LDA.w $1B20,X
#_008DC0: STA.w $195B

#_008DC3: SEP #$20
#_008DC5: LDA.w $1B60,Y
#_008DC8: BEQ .branch008E2B

#_008DCA: STA.w $1963

.branch008DCD
#_008DCD: REP #$10
#_008DCF: LDY.w $195B
#_008DD2: LDA.w $1C41,X
#_008DD5: CLC
#_008DD6: ADC.w $7E2000,Y
#_008DD9: STA.w $7E2000,Y
#_008DDC: ROL A
#_008DDD: CLC
#_008DDE: ADC.w $1956
#_008DE1: AND.b #$01
#_008DE3: STA.w $1955
#_008DE6: LDA.w $1C81,X
#_008DE9: CLC
#_008DEA: ADC.w $7E2001,Y
#_008DED: STA.w $7E2001,Y

;---------------------------------------------------------------------------------------------------

#_008DF0: REP #$20
#_008DF2: TYA
#_008DF3: CLC
#_008DF4: ADC.w #$0004
#_008DF7: STA.w $195B
#_008DFA: TYA
#_008DFB: LSR A
#_008DFC: LSR A
#_008DFD: TAY
#_008DFE: LSR A
#_008DFF: LSR A

#_008E00: SEP #$30
#_008E02: PHX
#_008E03: PHA
#_008E04: TYA
#_008E05: AND.b #$03
#_008E07: TAY
#_008E08: PLX
#_008E09: LDA.w $1955
#_008E0C: AND.b #$01
#_008E0E: STA.w $195E

.branch008E11
#_008E11: DEY
#_008E12: BMI .branch008E1C

#_008E14: ASL.w $195E
#_008E17: ASL.w $195E
#_008E1A: BRA .branch008E11

.branch008E1C
#_008E1C: LDA.w $7E2200,X
#_008E1F: EOR.w $195E
#_008E22: STA.w $7E2200,X
#_008E25: PLX
#_008E26: DEC.w $1963
#_008E29: BNE .branch008DCD

.branch008E2B
#_008E2B: LDA.b #$00
#_008E2D: STA.w $1C41,X
#_008E30: STA.w $1C81,X
#_008E33: LDY.w $1946
#_008E36: LDA.w $1A20,Y
#_008E39: AND.b #$7F
#_008E3B: STA.w $1A20,Y
#_008E3E: PLB
#_008E3F: RTS

;===================================================================================================
; Enters with:
; A - low byte of 32-bit dividend
; X - high byte of 32-bit dividend
; Y - 16-bit divisor
;===================================================================================================
DivisionBig_XA_by_Y:
#_008E40: STA.w $0E80
#_008E43: STX.w $0E82
#_008E46: STY.w $0E84

;===================================================================================================
; Enters with:
; $0E80[4] - 32-bit dividend
; $0E84[2] - 16-bit divisor
; Returns with:
; $0E80[4] - 32-bit quotient
; $0E86[2] - Remainder
; A - remainder
;===================================================================================================
DivisionBig_preset:
#_008E49: LDA.w #$0000
#_008E4C: STA.w $0E86

#_008E4F: LDX.w #$0020
#_008E52: ROL.w $0E80
#_008E55: ROL.w $0E82

.bang
#_008E58: ROL.w $0E86

#_008E5B: LDA.w $0E86
#_008E5E: SEC
#_008E5F: SBC.w $0E84
#_008E62: BCC .no_overflow

#_008E64: STA.w $0E86

.no_overflow
#_008E67: ROL.w $0E80
#_008E6A: ROL.w $0E82

#_008E6D: DEX
#_008E6E: BNE .bang

#_008E70: RTL

;===================================================================================================
; After using DivisionBig
; If the remainder is at least 1 half of the divisor
; $0E80[4] is incremented by one
; i.e. rounded up
;===================================================================================================
RoundQuotient:
#_008E71: LDA.w $0E86
#_008E74: ASL A
#_008E75: CMP.w $0E84
#_008E78: BCC .round_down

#_008E7A: INC.w $0E80
#_008E7D: BNE .round_down

#_008E7F: INC.w $0E82

.round_down
#_008E82: LDA.w $0E80
#_008E85: LDX.w $0E82

#_008E88: RTL

;===================================================================================================

WriteAmountHEXtoDEC:
#_008E89: STA.w $0090

#_008E8C: LDX.w #$000A
#_008E8F: STX.w $0E84

#_008E92: DEY
#_008E93: DEY

.branch008E94
#_008E94: PHK ; just JSL there ok?
#_008E95: JSR DivisionBig_preset ; dividing by 10 for hex to dec

#_008E98: LDA.w $0E86
#_008E9B: CLC
#_008E9C: ADC.w #$0001
#_008E9F: BIT.w $0E88
#_008EA2: BPL .branch008EA7

#_008EA4: ADC.w #$00B2

.branch008EA7
#_008EA7: ORA.w $0EFB
#_008EAA: STA.b ($90),Y

#_008EAC: DEY
#_008EAD: DEY
#_008EAE: BMI .exit

#_008EB0: LDA.w $0E80
#_008EB3: ORA.w $0E82
#_008EB6: BNE .branch008E94

#_008EB8: TYA
#_008EB9: BMI .exit

;---------------------------------------------------------------------------------------------------

.branch008EBB
#_008EBB: LDA.w #$0000
#_008EBE: BIT.w $0E88
#_008EC1: BMI .branch008EC6

#_008EC3: ADC.w #$00CF

.branch008EC6
#_008EC6: ORA.w $0EFB
#_008EC9: STA.b ($90),Y
#_008ECB: DEY
#_008ECC: DEY
#_008ECD: BPL .branch008EBB

.exit
#_008ECF: RTL

;===================================================================================================
; TODO POSSIBLY UNUSED ROUTINE
routine008ED0:
#_008ED0: STA.w $0090

#_008ED3: LDX.w #$000A
#_008ED6: STX.w $0E84

#_008ED9: LDY.w #$0000

.branch008EDC
#_008EDC: PHK
#_008EDD: JSR DivisionBig_preset
#_008EE0: LDA.w $0E86
#_008EE3: STA.w $0092,Y
#_008EE6: INY
#_008EE7: INY
#_008EE8: LDA.w $0E80
#_008EEB: ORA.w $0E82
#_008EEE: BNE .branch008EDC

#_008EF0: DEY
#_008EF1: DEY
#_008EF2: TYX
#_008EF3: LDY.w #$0000

.branch008EF6
#_008EF6: LDA.w $0092,X
#_008EF9: CLC
#_008EFA: ADC.w #$0001
#_008EFD: BIT.w $0E88
#_008F00: BPL .branch008F05

#_008F02: ADC.w #$00B2

.branch008F05
#_008F05: ORA.w $0EFB
#_008F08: STA.b ($90),Y
#_008F0A: INY
#_008F0B: INY
#_008F0C: DEX
#_008F0D: DEX
#_008F0E: BPL .branch008EF6
#_008F10: RTL

;===================================================================================================

routine008F11:
#_008F11: STA.w $0102
#_008F14: STY.w $0104

#_008F17: TYA
#_008F18: ASL A
#_008F19: TAY

#_008F1A: LDA.w #$0106

#_008F1D: PHK
#_008F1E: JSR WriteAmountHEXtoDEC

#_008F21: LDA.w #$0001
#_008F24: STA.w $0100
#_008F27: JSL AddSelfAsVector

#_008F2B: RTL

;===================================================================================================

Update19xxVecUntilInputOrAPasses:
#_008F2C: STA.w $0E8A

.wait
#_008F2F: JSL AddSelfAsVector

#_008F33: LDA.w $0F2B
#_008F36: BNE .exit

#_008F38: DEC.w $0E8A
#_008F3B: BNE .wait

.exit
#_008F3D: RTL

;===================================================================================================

Do19XXVectorsATimes:
#_008F3E: STA.w $0E8A

.wait
#_008F41: JSL AddSelfAsVector
#_008F45: DEC.w $0E8A
#_008F48: BNE .wait

#_008F4A: RTL

;===================================================================================================

Update19XXUntilInput:
#_008F4B: REP #$20

.wait
#_008F4D: JSL AddSelfAsVector
#_008F51: LDA.w $0F2B
#_008F54: BEQ .wait

#_008F56: RTL

;===================================================================================================

routine008F57:
#_008F57: PHP
#_008F58: REP #$30
#_008F5A: LDX.w #$003E
#_008F5D: LDA.w #$0000

.branch008F60
#_008F60: STA.w $0000,X
#_008F63: STA.w $1A60,X
#_008F66: STA.w $1AA0,X
#_008F69: STA.w $1AE0,X
#_008F6C: DEX
#_008F6D: DEX
#_008F6E: BPL .branch008F60

#_008F70: SEP #$20
#_008F72: LDY.w #$001F
#_008F75: LDA.b #$80

.branch008F77
#_008F77: STA.w $1A00,Y
#_008F7A: STA.w $1A20,Y
#_008F7D: DEY
#_008F7E: BPL .branch008F77

#_008F80: PLP
#_008F81: RTL

;===================================================================================================

VRAM_From_7FXXXX:
#_008F82: SEP #$30

#_008F84: ASL A
#_008F85: TAX
#_008F86: ASL A
#_008F87: TAY

#_008F88: PHB
#_008F89: PHK
#_008F8A: PLB

#_008F8B: REP #$20

#_008F8D: LDA.w .vram_address,X
#_008F90: STA.w $0F07

#_008F93: LDX.b #$01
#_008F95: STX.w DMA0MODE

#_008F98: LDX.b #VMDATA
#_008F9A: STX.w DMA0PORT

#_008F9D: LDA.w .page_and_size+0,Y
#_008FA0: STA.w DMA0ADDRL

#_008FA3: LDX.b #$7F
#_008FA5: STX.w DMA0ADDRB

#_008FA8: LDA.w .page_and_size+2,Y
#_008FAB: STA.w DMA0SIZEL

#_008FAE: SEP #$20

#_008FB0: LDA.w $0F06
#_008FB3: ORA.b #$01
#_008FB5: STA.w $0F06

#_008FB8: LDX.b #$00
#_008FBA: STX.w MDMAEN

#_008FBD: PLB
#_008FBE: RTL

.page_and_size
#_008FBF: dw $7F7000, $0800
#_008FC3: dw $7F5000, $1000
#_008FC7: dw $7F7800, $0800
#_008FCB: dw $7F6800, $0800
#_008FCF: dw $7F6000, $0800
#_008FD3: dw $7F8000, $8000
#_008FD7: dw $7F4000, $1000
#_008FDB: dw $7F2800, $1000
#_008FDF: dw $7FC000, $1800
#_008FE3: dw $7F0000, $1000
#_008FE7: dw $7F1000, $1000
#_008FEB: dw $7F2000, $1000
#_008FEF: dw $7F3000, $1000

.vram_address
#_008FF3: dw $3800 ; $7000 in VRAM
#_008FF5: dw $2800 ; $5000 in VRAM
#_008FF7: dw $3C00 ; $7800 in VRAM
#_008FF9: dw $3400 ; $6800 in VRAM
#_008FFB: dw $3000 ; $6000 in VRAM
#_008FFD: dw $4000 ; $8000 in VRAM
#_008FFF: dw $2000 ; $4000 in VRAM
#_009001: dw $2800 ; $5000 in VRAM
#_009003: dw $6000 ; $C000 in VRAM
#_009005: dw $0000 ; $0000 in VRAM
#_009007: dw $0800 ; $1000 in VRAM
#_009009: dw $1000 ; $2000 in VRAM
#_00900B: dw $1800 ; $3000 in VRAM

;===================================================================================================

WaitForMenuChoice_A:
#_00900D: STA.w $0E8C

#_009010: STY.w $0EA8
#_009013: STY.w $0EB6

#_009016: STX.w $0EC4

#_009019: LDA.w #$0000
#_00901C: STA.w $0E9A

;===================================================================================================

WaitForMenuChoice_FirstPerson:
#_00901F: REP #$30

.update_and_continue
#_009021: JSL PrepCursorMovementDMA

.reset_debug_timer
#_009025: LDA.w #$0008
#_009028: STA.w $0E8A

.keep_waiting
#_00902B: JSL AddSelfAsVector

#_00902F: DEC.w $0E8A
#_009032: BNE .test_buttons

#_009034: LDA.w #$0000
#_009037: STA.w $0F2D
#_00903A: BRA .reset_debug_timer

.test_buttons
#_00903C: LDA.w $0F2B
#_00903F: BIT.w #$8080
#_009042: BNE .pressed_B_or_A

#_009044: BIT.w #$0C00
#_009047: BEQ .keep_waiting

;---------------------------------------------------------------------------------------------------

.pressed_up_or_down
#_009049: LDX.w $0E9A
#_00904C: STX.w $0EB6

#_00904F: LDA.w #$0001 ; SFX 01
#_009052: JSL Write_to_APU_transferrable

#_009056: LDA.w $0F2B
#_009059: BIT.w #$0400
#_00905C: BNE .pressed_down

.pressed_up
#_00905E: DEC.w $0E9A
#_009061: BPL .update_and_continue

#_009063: LDA.w $0EA8
#_009066: STA.w $0E9A

#_009069: BRA .update_and_continue

.pressed_down
#_00906B: INC.w $0E9A

#_00906E: LDA.w $0E9A
#_009071: CMP.w $0EA8
#_009074: BCC .update_and_continue
#_009076: BEQ .update_and_continue

#_009078: LDA.w #$0000
#_00907B: STA.w $0E9A

#_00907E: BRA .update_and_continue

;---------------------------------------------------------------------------------------------------

.pressed_B_or_A
#_009080: AND.w #$0080
#_009083: BNE .pressed_A

.pressed_B
#_009085: LDX.w $0E9A
#_009088: STX.w $0EB6

#_00908B: LDA.w $0E9A
#_00908E: ORA.w #$8000
#_009091: STA.w $0E9A

#_009094: LDA.w #$0003 ; SFX 03
#_009097: JSL Write_to_APU_transferrable

#_00909B: BRA .exit

;---------------------------------------------------------------------------------------------------

.pressed_A
#_00909D: LDA.w #$0002 ; SFX 02
#_0090A0: JSL Write_to_APU_transferrable

#_0090A4: BIT.w $0EC4
#_0090A7: BVS .exit

#_0090A9: LDA.w $0ED2
#_0090AC: CMP.w #$0005
#_0090AF: BCS .exit

#_0090B1: ASL A
#_0090B2: TAX

#_0090B3: LDA.w $0E8C
#_0090B6: STA.w $0E8E,X

#_0090B9: LDA.w $0E9A
#_0090BC: STA.w $0E9C,X

#_0090BF: LDA.w $0EA8
#_0090C2: STA.w $0EAA,X

#_0090C5: LDA.w $0EB6
#_0090C8: STA.w $0EB8,X

#_0090CB: LDA.w $0EC4
#_0090CE: STA.w $0EC6,X

#_0090D1: INC.w $0ED2

.exit
#_0090D4: RTL

;===================================================================================================
; Appears to move the menu cursor
;===================================================================================================
PrepCursorMovementDMA:
#_0090D5: PHB

#_0090D6: SEP #$20

#_0090D8: LDA.b #$7E
#_0090DA: PHA

#_0090DB: REP #$20

#_0090DD: PLB

#_0090DE: LDX.w #$0002

#_0090E1: LDA.w $0E9A

.next_menu_slot
#_0090E4: ASL A
#_0090E5: ASL A
#_0090E6: ASL A
#_0090E7: ASL A
#_0090E8: ASL A
#_0090E9: BIT.w $0EC4 ; TODO ???
#_0090EC: BMI .branch0090EF

#_0090EE: ASL A

.branch0090EF
#_0090EF: CLC
#_0090F0: ADC.w $0E8C
#_0090F3: STA.w $7E2220,X

#_0090F6: INX
#_0090F7: INX

#_0090F8: LDA.w $0EC4 ; seems to have palette and priority and tile count
#_0090FB: AND.w #$1C00 ; because this masks out palette
#_0090FE: ORA.w #$0800 ; and this changes it to palette+2

#_009101: LDY.w $7E2220 ; see if we're on the second set?
#_009104: BEQ .red_palette

.black_palette
#_009106: LDA.w $0EC4
#_009109: AND.w #$1C00 ; this makes it normal palette

.red_palette
#_00910C: PHA

#_00910D: LDA.w $0EC4 ; number of characters
#_009110: AND.w #$00FF
#_009113: STA.w $7E2220,X

#_009116: TAY

#_009117: PLA

#_009118: INX
#_009119: INX

.next_tile
#_00911A: STA.w $7E2220,X ; property to mask in

#_00911D: INX
#_00911E: INX
#_00911F: DEY
#_009120: BNE .next_tile

#_009122: LDA.w $7E2220 ; exit when on second set
#_009125: BNE .exit

#_009127: LDA.w #$0002
#_00912A: STA.w $7E2220

#_00912D: LDA.w $0EB6 ; previous menu position for writing the off palettes

#_009130: BRA .next_menu_slot

.exit
#_009132: PLB

#_009133: RTL

;===================================================================================================

CacheCursorPositionAndSet:
#_009134: STA.w $0E8C

#_009137: STY.w $0EA8
#_00913A: STY.w $0EB6

#_00913D: STX.w $0EC4

#_009140: LDX.w #$0000
#_009143: STX.w $0E9A

#_009146: RTL

;===================================================================================================

GoToPreviousMenu:
#_009147: LDA.w $0ED2
#_00914A: BEQ .exit

#_00914C: DEC A
#_00914D: STA.w $0ED2

#_009150: ASL A
#_009151: TAX

#_009152: LDA.w $0E8E,X
#_009155: STA.w $0E8C

#_009158: LDA.w $0E9C,X
#_00915B: STA.w $0E9A

#_00915E: LDA.w $0EAA,X
#_009161: STA.w $0EA8

#_009164: LDA.w $0EB8,X
#_009167: STA.w $0EB6

#_00916A: LDA.w $0EC6,X
#_00916D: STA.w $0EC4

.exit
#_009170: RTL

;===================================================================================================

BrightenScreen:
#_009171: PHP
#_009172: SEP #$20

#_009174: LDA.b #$00

.too_dark
#_009176: INC A
#_009177: STA.w INIDISP
#_00917A: STA.w $0F43

#_00917D: JSL AddSelfAsVectorAndMakeSpace

#_009181: LDA.w $0F43
#_009184: CMP.b #$0F
#_009186: BCC .too_dark

#_009188: PLP
#_009189: RTL

;===================================================================================================

DarkenScreen:
#_00918A: PHP
#_00918B: SEP #$20

#_00918D: LDA.b #$0F

.too_bright
#_00918F: DEC A
#_009190: STA.w INIDISP
#_009193: STA.w $0F43

#_009196: JSL AddSelfAsVectorAndMakeSpace

#_00919A: LDA.w $0F43
#_00919D: BNE .too_bright

#_00919F: PLP
#_0091A0: RTL

;===================================================================================================

routine0091A1:
#_0091A1: PHP
#_0091A2: SEP #$30

#_0091A4: STA.w $0EDC

#_0091A7: STX.w $0EDF

#_0091AA: DEY
#_0091AB: STY.w $0EDE

#_0091AE: STZ.w $0EDA

.branch0091B1
#_0091B1: JSL routine0091FD

.next
#_0091B5: LDA.w $0EDE
#_0091B8: BNE .branch0091BB

#_0091BA: INC A

.branch0091BB
#_0091BB: JSL Do19XXVectorsATimes

#_0091BF: LDA.w $0EDA
#_0091C2: INC A
#_0091C3: STA.w $0EDA

#_0091C6: CMP.b #$10
#_0091C8: BEQ .continue

#_0091CA: BCS .exit

#_0091CC: BCC .branch0091B1

.continue
#_0091CE: JSL Cache_WRAM_CGWRAM_First8
#_0091D2: BRA .next

.exit
#_0091D4: PLP
#_0091D5: RTL

;===================================================================================================

Cache_WRAM_CGWRAM_First8:
#_0091D6: PHP

#_0091D7: REP #$30
#_0091D9: PHB

#_0091DA: SEP #$20

#_0091DC: LDA.b #$7E
#_0091DE: PHA

#_0091DF: REP #$20

#_0091E1: PLB

#_0091E2: LDY.w #$0000

.next_color
#_0091E5: LDA.w $7E2500,Y
#_0091E8: STA.w $7E2300,Y

#_0091EB: INY
#_0091EC: INY
#_0091ED: CPY.w #$0100
#_0091F0: BCC .next_color

#_0091F2: SEP #$20

#_0091F4: LDA.w $0EDF
#_0091F7: JSR SetUpCGRAMDMA

#_0091FA: PLB
#_0091FB: PLP
#_0091FC: RTL

;===================================================================================================

routine0091FD:
#_0091FD: SEP #$30

#_0091FF: PHB

#_009200: LDA.b #$7E
#_009202: PHA
#_009203: PLB

#_009204: LDX.b #$00
#_009206: STX.w $0EDB

;---------------------------------------------------------------------------------------------------

.next_loop
#_009209: LDA.w $0EDC
#_00920C: STA.w $0EDD

#_00920F: LDA.b #$E0

.branch009211
#_009211: CLC
#_009212: ADC.b #$20
#_009214: TAY

#_009215: LSR.w $0EDD

#_009218: DEX
#_009219: BPL .branch009211

#_00921B: BCS .branch00922C

.branch00921D
#_00921D: LDA.w $7E2500,Y
#_009220: STA.w $7E2300,Y

#_009223: INY

#_009224: TYA
#_009225: AND.b #$1F
#_009227: BNE .branch00921D

#_009229: JMP .branch0092ED

;---------------------------------------------------------------------------------------------------

.branch00922C
#_00922C: PHY

#_00922D: REP #$20

#_00922F: LDA.w $7E2500,Y
#_009232: ASL A

#_009233: LDX.b #$04

.branch009235
#_009235: LDY.b #$04

.branch009237
#_009237: ASL A
#_009238: ROL.w $0EE0,X

#_00923B: DEY
#_00923C: BPL .branch009237

#_00923E: DEX
#_00923F: DEX
#_009240: BPL .branch009235

;---------------------------------------------------------------------------------------------------

#_009242: SEP #$20

#_009244: PHB
#_009245: PHK
#_009246: PLB

#_009247: LDX.b #$04

.branch009249
#_009249: LDA.w $0EE0,X
#_00924C: AND.b #$1F
#_00924E: STA.w WRDIVL

#_009251: LDA.b #$00
#_009253: STA.w WRDIVH

#_009256: LDA.b #$10
#_009258: STA.w WRDIVB

#_00925B: NOP
#_00925C: NOP
#_00925D: NOP
#_00925E: NOP
#_00925F: NOP
#_009260: NOP
#_009261: NOP
#_009262: NOP

#_009263: LDA.w RDDIVL
#_009266: STA.w $0EE0,X

#_009269: LDA.w RDMPYL
#_00926C: STA.w $0EE6,X

#_00926F: DEX
#_009270: DEX
#_009271: BPL .branch009249

;---------------------------------------------------------------------------------------------------

#_009273: LDX.b #$04

.branch009275
#_009275: LDA.w $0EE0,X
#_009278: STA.w WRMPYA

#_00927B: LDA.w $0EDA
#_00927E: STA.w WRMPYB

#_009281: NOP
#_009282: NOP
#_009283: NOP
#_009284: NOP
#_009285: NOP
#_009286: NOP
#_009287: NOP
#_009288: NOP

#_009289: LDA.w RDMPYL
#_00928C: STA.w $0EE0,X

#_00928F: LDA.w $0EE6,X
#_009292: STA.w WRMPYA

#_009295: LDA.w $0EDA
#_009298: STA.w WRMPYB

#_00929B: NOP
#_00929C: NOP
#_00929D: NOP
#_00929E: NOP
#_00929F: NOP
#_0092A0: NOP
#_0092A1: NOP
#_0092A2: NOP

#_0092A3: LDA.w RDMPYL
#_0092A6: STA.w WRMPYA

#_0092A9: LDA.b #$10
#_0092AB: STA.w WRMPYB

#_0092AE: NOP
#_0092AF: NOP
#_0092B0: NOP
#_0092B1: NOP
#_0092B2: NOP
#_0092B3: NOP
#_0092B4: NOP
#_0092B5: NOP

#_0092B6: LDA.w RDMPYH
#_0092B9: CLC
#_0092BA: ADC.w $0EE0,X
#_0092BD: STA.w $0EE0,X

#_0092C0: DEX
#_0092C1: DEX
#_0092C2: BPL .branch009275

;---------------------------------------------------------------------------------------------------

#_0092C4: PLB

#_0092C5: REP #$20

#_0092C7: LDX.b #$00

.branch0092C9
#_0092C9: LDY.b #$04

.branch0092CB
#_0092CB: LSR.w $0EE0,X
#_0092CE: ROR A

#_0092CF: DEY
#_0092D0: BPL .branch0092CB

#_0092D2: INX
#_0092D3: INX
#_0092D4: CPX.b #$06
#_0092D6: BNE .branch0092C9

;---------------------------------------------------------------------------------------------------

#_0092D8: PLY

#_0092D9: LSR A
#_0092DA: STA.w $7E2300,Y

#_0092DD: SEP #$20

#_0092DF: INY
#_0092E0: INY

#_0092E1: TYA
#_0092E2: AND.b #$1F
#_0092E4: BEQ .branch0092E9

#_0092E6: JMP .branch00922C

;---------------------------------------------------------------------------------------------------

.branch0092E9
#_0092E9: JSL AddSelfAsVectorAndMakeSpace

.branch0092ED
#_0092ED: LDX.w $0EDB
#_0092F0: INX
#_0092F1: STX.w $0EDB

#_0092F4: CPX.b #$08
#_0092F6: BCS .branch0092FB

#_0092F8: JMP .next_loop

.branch0092FB
#_0092FB: LDA.w $0EDF
#_0092FE: JSR SetUpCGRAMDMA

#_009301: PLB
#_009302: RTL

;===================================================================================================
; A = bitfield for what to fade?
; Y = duration?
; X = ??
;===================================================================================================
GraduallyFadeStuff:
#_009303: PHP
#_009304: SEP #$30

#_009306: STA.w $0EDC

#_009309: STX.w $0EDF

#_00930C: DEY
#_00930D: STY.w $0EDE

#_009310: LDA.b #$FF
#_009312: STA.w $0F82

#_009315: JSL AddSelfAsVector

#_009319: STZ.w $0EDA

.next
#_00931C: JSL routine009337

#_009320: LDA.w $0EDE
#_009323: BNE .not_zero

#_009325: INC A

.not_zero
#_009326: JSL Do19XXVectorsATimes

#_00932A: LDA.w $0EDA
#_00932D: INC A
#_00932E: STA.w $0EDA

#_009331: CMP.b #$10
#_009333: BCC .next

#_009335: PLP
#_009336: RTL

;===================================================================================================

routine009337:
#_009337: SEP #$30

#_009339: PHB

#_00933A: LDA.b #$7E
#_00933C: PHA
#_00933D: PLB

#_00933E: LDX.b #$00
#_009340: STX.w $0EDB

.branch009343
#_009343: LDA.w $0EDC
#_009346: STA.w $0EDD
#_009349: LDA.b #$E0

.branch00934B
#_00934B: CLC
#_00934C: ADC.b #$20
#_00934E: TAY

#_00934F: LSR.w $0EDD
#_009352: DEX
#_009353: BPL .branch00934B

#_009355: BCS .branch009366

.branch009357
#_009357: LDA.w $7E2500,Y
#_00935A: STA.w $7E2300,Y

#_00935D: INY

#_00935E: TYA
#_00935F: AND.b #$1F
#_009361: BNE .branch009357

#_009363: JMP .branch00942D

;---------------------------------------------------------------------------------------------------

.branch009366
#_009366: PHY

#_009367: REP #$20

#_009369: LDA.w $7E2500,Y
#_00936C: ASL A
#_00936D: LDX.b #$04

.branch00936F
#_00936F: LDY.b #$04

.branch009371
#_009371: ASL A
#_009372: ROL.w $0EE0,X

#_009375: DEY
#_009376: BPL .branch009371

#_009378: DEX
#_009379: DEX
#_00937A: BPL .branch00936F

;---------------------------------------------------------------------------------------------------

#_00937C: SEP #$20

#_00937E: PHB
#_00937F: PHK
#_009380: PLB

#_009381: LDX.b #$04

.branch009383
#_009383: LDA.w $0EE0,X
#_009386: AND.b #$1F
#_009388: STA.w WRDIVL

#_00938B: LDA.b #$00
#_00938D: STA.w WRDIVH

#_009390: LDA.b #$10
#_009392: STA.w WRDIVB

#_009395: NOP
#_009396: NOP
#_009397: NOP
#_009398: NOP
#_009399: NOP
#_00939A: NOP
#_00939B: NOP
#_00939C: NOP

#_00939D: LDA.w RDDIVL
#_0093A0: STA.w $0EE0,X

#_0093A3: LDA.w RDMPYL
#_0093A6: STA.w $0EE6,X

#_0093A9: DEX
#_0093AA: DEX
#_0093AB: BPL .branch009383

;---------------------------------------------------------------------------------------------------

#_0093AD: LDX.b #$04

.branch0093AF
#_0093AF: LDA.w $0EE0,X
#_0093B2: STA.w WRMPYA

#_0093B5: LDA.b #$0F
#_0093B7: SEC
#_0093B8: SBC.w $0EDA
#_0093BB: STA.w WRMPYB

#_0093BE: NOP
#_0093BF: NOP
#_0093C0: NOP
#_0093C1: NOP
#_0093C2: NOP
#_0093C3: NOP
#_0093C4: NOP
#_0093C5: NOP

#_0093C6: LDA.w RDMPYL
#_0093C9: STA.w $0EE0,X

#_0093CC: LDA.w $0EE6,X
#_0093CF: STA.w WRMPYA

#_0093D2: LDA.b #$0F
#_0093D4: SEC
#_0093D5: SBC.w $0EDA
#_0093D8: STA.w WRMPYB

#_0093DB: NOP
#_0093DC: NOP
#_0093DD: NOP
#_0093DE: NOP
#_0093DF: NOP
#_0093E0: NOP
#_0093E1: NOP
#_0093E2: NOP

#_0093E3: LDA.w RDMPYL
#_0093E6: STA.w WRMPYA

#_0093E9: LDA.b #$10
#_0093EB: STA.w WRMPYB

#_0093EE: NOP
#_0093EF: NOP
#_0093F0: NOP
#_0093F1: NOP
#_0093F2: NOP
#_0093F3: NOP
#_0093F4: NOP
#_0093F5: NOP

#_0093F6: LDA.w RDMPYH
#_0093F9: CLC
#_0093FA: ADC.w $0EE0,X
#_0093FD: STA.w $0EE0,X

#_009400: DEX
#_009401: DEX
#_009402: BPL .branch0093AF

;---------------------------------------------------------------------------------------------------

#_009404: PLB

#_009405: REP #$20

#_009407: LDX.b #$00

.branch009409
#_009409: LDY.b #$04

.branch00940B
#_00940B: LSR.w $0EE0,X
#_00940E: ROR A

#_00940F: DEY
#_009410: BPL .branch00940B

#_009412: INX
#_009413: INX
#_009414: CPX.b #$06
#_009416: BNE .branch009409

;---------------------------------------------------------------------------------------------------

#_009418: PLY

#_009419: LSR A
#_00941A: STA.w $7E2300,Y

#_00941D: SEP #$20

#_00941F: INY
#_009420: INY

#_009421: TYA
#_009422: AND.b #$1F
#_009424: BEQ .branch009429

#_009426: JMP .branch009366

;---------------------------------------------------------------------------------------------------

.branch009429
#_009429: JSL AddSelfAsVectorAndMakeSpace

.branch00942D
#_00942D: LDX.w $0EDB
#_009430: INX
#_009431: STX.w $0EDB

#_009434: CPX.b #$08
#_009436: BCS .branch00943B

#_009438: JMP .branch009343

.branch00943B
#_00943B: LDA.w $0EDF
#_00943E: JSR SetUpCGRAMDMA

#_009441: PLB
#_009442: RTL

;===================================================================================================

routine009443:
#_009443: PHP
#_009444: SEP #$30

#_009446: STA.w $0EDC
#_009449: STX.w $0EDF
#_00944C: STY.w $0EDE

#_00944F: LDA.b #$1F
#_009451: STA.w $0EDA

.next
#_009454: JSL routine00946D

#_009458: LDA.w $0EDE
#_00945B: JSL Do19XXVectorsATimes

#_00945F: LDA.w $0EDA
#_009462: DEC A
#_009463: STA.w $0EDA
#_009466: BMI .exit

; lol why is this a JMP?
#_009468: JMP .next

.exit
#_00946B: PLP
#_00946C: RTL

;===================================================================================================

routine00946D:
#_00946D: SEP #$30

#_00946F: PHB
#_009470: LDA.b #$7E
#_009472: PHA
#_009473: PLB

#_009474: LDX.b #$00
#_009476: STX.w $0EDB

.next_loop
#_009479: LDA.w $0EDC
#_00947C: STA.w $0EDD

#_00947F: LDA.b #$E0

.branch009481
#_009481: CLC
#_009482: ADC.b #$20
#_009484: TAY

#_009485: LSR.w $0EDD

#_009488: DEX
#_009489: BPL .branch009481

#_00948B: BCS .branch00949C

.branch00948D
#_00948D: LDA.w $7E2500,Y
#_009490: STA.w $7E2300,Y

#_009493: INY

#_009494: TYA
#_009495: AND.b #$1F
#_009497: BNE .branch00948D

#_009499: JMP .branch0094F2

;---------------------------------------------------------------------------------------------------

.branch00949C
#_00949C: PHY

#_00949D: REP #$20

#_00949F: LDA.w $7E2500,Y
#_0094A2: ASL A

#_0094A3: LDX.b #$04

.branch0094A5
#_0094A5: LDY.b #$04

.branch0094A7
#_0094A7: ASL A
#_0094A8: ROL.w $0EE0,X

#_0094AB: DEY
#_0094AC: BPL .branch0094A7

#_0094AE: DEX
#_0094AF: DEX
#_0094B0: BPL .branch0094A5

;---------------------------------------------------------------------------------------------------

#_0094B2: SEP #$20

#_0094B4: LDX.b #$04

.branch0094B6
#_0094B6: LDA.w $0EE0,X
#_0094B9: AND.b #$1F
#_0094BB: CMP.w $0EDA
#_0094BE: BCS .branch0094C6

#_0094C0: LDA.w $0EDA
#_0094C3: STA.w $0EE0,X

.branch0094C6
#_0094C6: DEX
#_0094C7: DEX
#_0094C8: BPL .branch0094B6

;---------------------------------------------------------------------------------------------------

#_0094CA: REP #$20

#_0094CC: LDX.b #$00

.branch0094CE
#_0094CE: LDY.b #$04

.branch0094D0
#_0094D0: LSR.w $0EE0,X
#_0094D3: ROR A

#_0094D4: DEY
#_0094D5: BPL .branch0094D0

#_0094D7: INX
#_0094D8: INX
#_0094D9: CPX.b #$06
#_0094DB: BNE .branch0094CE

;---------------------------------------------------------------------------------------------------

#_0094DD: PLY

#_0094DE: LSR A
#_0094DF: STA.w $7E2300,Y

#_0094E2: SEP #$20

#_0094E4: INY
#_0094E5: INY

#_0094E6: TYA
#_0094E7: AND.b #$1F
#_0094E9: BEQ .branch0094EE

#_0094EB: JMP .branch00949C

;---------------------------------------------------------------------------------------------------

.branch0094EE
#_0094EE: JSL AddSelfAsVectorAndMakeSpace

.branch0094F2
#_0094F2: LDX.w $0EDB
#_0094F5: INX
#_0094F6: STX.w $0EDB

#_0094F9: CPX.b #$08
#_0094FB: BCS .branch009500

#_0094FD: JMP .next_loop

.branch009500
#_009500: LDA.w $0EDF
#_009503: JSR SetUpCGRAMDMA

#_009506: PLB
#_009507: RTL

;===================================================================================================

routine009508:
#_009508: PHP
#_009509: SEP #$30

#_00950B: STA.w $0EDC
#_00950E: STX.w $0EDF
#_009511: STY.w $0EDE

#_009514: LDA.b #$01
#_009516: STA.w $0EDA

.next
#_009519: JSL routine009534

#_00951D: LDA.w $0EDE
#_009520: JSL Do19XXVectorsATimes

#_009524: LDA.w $0EDA
#_009527: INC A
#_009528: STA.w $0EDA

#_00952B: CMP.b #$20
#_00952D: BCS .exit

#_00952F: JMP .next

.exit
#_009532: PLP
#_009533: RTL

;===================================================================================================

routine009534:
#_009534: SEP #$30

#_009536: PHB

#_009537: LDA.b #$7E
#_009539: PHA
#_00953A: PLB

#_00953B: STZ.w $0EDB

#_00953E: LDX.b #$00

.next_loop
#_009540: LDA.w $0EDC
#_009543: STA.w $0EDD

#_009546: LDA.b #$E0

.branch009548
#_009548: CLC
#_009549: ADC.b #$20
#_00954B: TAY

#_00954C: LSR.w $0EDD

#_00954F: DEX
#_009550: BPL .branch009548
#_009552: BCS .branch009563

.branch009554
#_009554: LDA.w $7E2500,Y
#_009557: STA.w $7E2300,Y

#_00955A: INY

#_00955B: TYA
#_00955C: AND.b #$1F
#_00955E: BNE .branch009554

#_009560: JMP .branch0095B9

;---------------------------------------------------------------------------------------------------

.branch009563
#_009563: PHY

#_009564: REP #$20

#_009566: LDA.w $7E2500,Y
#_009569: ASL A

#_00956A: LDX.b #$04

.branch00956C
#_00956C: LDY.b #$04

.branch00956E
#_00956E: ASL A
#_00956F: ROL.w $0EE0,X

#_009572: DEY
#_009573: BPL .branch00956E

#_009575: DEX
#_009576: DEX
#_009577: BPL .branch00956C

;---------------------------------------------------------------------------------------------------

#_009579: SEP #$20

#_00957B: LDX.b #$04

.branch00957D
#_00957D: LDA.w $0EE0,X
#_009580: AND.b #$1F
#_009582: CMP.w $0EDA
#_009585: BCS .branch00958D

#_009587: LDA.w $0EDA
#_00958A: STA.w $0EE0,X

.branch00958D
#_00958D: DEX
#_00958E: DEX
#_00958F: BPL .branch00957D

;---------------------------------------------------------------------------------------------------

#_009591: REP #$20

#_009593: LDX.b #$00

.branch009595
#_009595: LDY.b #$04

.branch009597
#_009597: LSR.w $0EE0,X
#_00959A: ROR A

#_00959B: DEY
#_00959C: BPL .branch009597

#_00959E: INX
#_00959F: INX
#_0095A0: CPX.b #$06
#_0095A2: BNE .branch009595

;---------------------------------------------------------------------------------------------------

#_0095A4: PLY

#_0095A5: LSR A
#_0095A6: STA.w $7E2300,Y

#_0095A9: SEP #$20

#_0095AB: INY
#_0095AC: INY

#_0095AD: TYA
#_0095AE: AND.b #$1F
#_0095B0: BEQ .branch0095B5

#_0095B2: JMP .branch009563

.branch0095B5
#_0095B5: JSL AddSelfAsVectorAndMakeSpace

.branch0095B9
#_0095B9: LDX.w $0EDB
#_0095BC: INX
#_0095BD: STX.w $0EDB

#_0095C0: CPX.b #$08
#_0095C2: BCS .branch0095C7

;---------------------------------------------------------------------------------------------------

#_0095C4: JMP .next_loop

.branch0095C7
#_0095C7: LDA.w $0EDF
#_0095CA: JSR SetUpCGRAMDMA

#_0095CD: PLB
#_0095CE: RTL

;===================================================================================================

SetUpCGRAMDMA:
#_0095CF: STA.w $0F09

#_0095D2: PHB
#_0095D3: PHK
#_0095D4: PLB

#_0095D5: LDA.b #$00
#_0095D7: STA.w DMA1MODE

#_0095DA: LDA.b #CGDATA
#_0095DC: STA.w DMA1PORT

#_0095DF: LDA.b #$00
#_0095E1: STA.w DMA1ADDRL

#_0095E4: LDA.b #$23
#_0095E6: STA.w DMA1ADDRH

#_0095E9: LDA.b #$7E
#_0095EB: STA.w DMA1ADDRB

#_0095EE: LDA.b #$00
#_0095F0: STA.w DMA1SIZEL

#_0095F3: LDA.b #$01
#_0095F5: STA.w DMA1SIZEH

#_0095F8: LDA.b #$02
#_0095FA: ORA.w $0F06
#_0095FD: STA.w $0F06

#_009600: PLB
#_009601: RTS

;===================================================================================================

routine009602:
#_009602: PHP
#_009603: REP #$30

#_009605: LDA.w $0090
#_009608: STA.w $0098

#_00960B: LDA.w $0092
#_00960E: STA.w $009A
#_009611: STZ.w $047A

#_009614: LDY.w #$0000

.next_loop
#_009617: LDA.b [$98]
#_009619: STA.b [$94],Y

#_00961B: INC.w $0098
#_00961E: INC.w $0098

#_009621: INY
#_009622: INY

#_009623: TYA
#_009624: AND.w #$000F
#_009627: BNE .next_loop

.branch009629
#_009629: LDA.w #$0000
#_00962C: STA.b [$94],Y

#_00962E: INY
#_00962F: INY

#_009630: TYA
#_009631: AND.w #$001F
#_009634: BNE .branch009629

#_009636: INC.w $047A

#_009639: LDA.w $047A
#_00963C: CMP.w $0476
#_00963F: BCC .next_loop

#_009641: PLP
#_009642: RTL

;===================================================================================================
;  $0ED5      $0ED7      $0ED8      $0ED9
; aaaaaaaa   bbbbbbbb   cccccccc   dddddddd
;
;	// only a rough approximation that ignores some of the carry flag behavior
;	GetRandomInt {
;		S = B.7
;	
;		B <<= 1
;		B |= D.7
;	
;		D <<= 1
;		D |= ~(A.0 ^ 1) & ~(A.1 ^ 1)
;	
;		C += (B + 0x22 + D + S) ^ 0x5A
;	
;		A ^= C
;	
;		return A
;	}
;
; TODO a quick analysis by isofrieze suggests this is an LSFR
; TODO figure out taps, etc.
;===================================================================================================
GetRandomInt:
#_009643: PHP

#_009644: SEP #$20
#_009646: CLC

#_009647: LDA.w $0ED7
#_00964A: AND.b #$03
#_00964C: BEQ .zero

#_00964E: CMP.b #$03
#_009650: BNE .not3

.zero
#_009652: SEC

.not3
#_009653: ROL.w $0ED9
#_009656: ROL.w $0ED7

#_009659: LDA.w $0ED7
#_00965C: ADC.b #$22
#_00965E: ADC.w $0ED9

#_009661: EOR.b #$5A
#_009663: ADC.w $0ED8
#_009666: STA.w $0ED8

#_009669: EOR.w $0ED5
#_00966C: STA.w $0ED5

#_00966F: PLP
#_009670: RTL

;===================================================================================================
; TODO figure out how much and where
ZeroALOTofVRAM:
#_009671: PHP
#_009672: SEP #$30

#_009674: LDA.b #$00
#_009676: STA.w VMADDL

#_009679: LDA.w $0F47
#_00967C: AND.b #$FC
#_00967E: STA.w VMADDH

#_009681: LDX.b #$00
#_009683: LDA.w $0F47

#_009686: AND.b #$03
#_009688: BEQ .branch009691

#_00968A: INX
#_00968B: CMP.b #$03
#_00968D: BNE .branch009691

#_00968F: INX
#_009690: INX

.branch009691
#_009691: STX.w $0E80

.branch009694
#_009694: JSL Zero2KBinVRAM_setup
#_009698: STA.w MDMAEN

#_00969B: DEC.w $0E80
#_00969E: BPL .branch009694

#_0096A0: LDA.b #$00
#_0096A2: STA.w VMADDL

#_0096A5: LDA.w $0F48
#_0096A8: AND.b #$FC
#_0096AA: STA.w VMADDH

#_0096AD: LDX.b #$00
#_0096AF: LDA.w $0F48
#_0096B2: AND.b #$03
#_0096B4: BEQ .branch0096BD

#_0096B6: INX
#_0096B7: CMP.b #$03
#_0096B9: BNE .branch0096BD

#_0096BB: INX
#_0096BC: INX

.branch0096BD
#_0096BD: STX.w $0E80

.branch0096C0
#_0096C0: JSL Zero2KBinVRAM_setup
#_0096C4: STA.w MDMAEN
#_0096C7: DEC.w $0E80
#_0096CA: BPL .branch0096C0

#_0096CC: LDA.b #$00
#_0096CE: STA.w VMADDL

#_0096D1: LDA.w $0F49
#_0096D4: AND.b #$FC
#_0096D6: STA.w VMADDH

#_0096D9: LDX.b #$00
#_0096DB: LDA.w $0F49
#_0096DE: AND.b #$03
#_0096E0: BEQ .branch0096E9

#_0096E2: INX
#_0096E3: CMP.b #$03
#_0096E5: BNE .branch0096E9

#_0096E7: INX
#_0096E8: INX

.branch0096E9
#_0096E9: STX.w $0E80

.branch0096EC
#_0096EC: JSL Zero2KBinVRAM_setup
#_0096F0: STA.w MDMAEN
#_0096F3: DEC.w $0E80
#_0096F6: BPL .branch0096EC

#_0096F8: LDA.b #$00
#_0096FA: STA.w VMADDL
#_0096FD: LDA.w $0F4A
#_009700: AND.b #$FC
#_009702: STA.w VMADDH
#_009705: LDX.b #$00
#_009707: LDA.w $0F4A
#_00970A: AND.b #$03
#_00970C: BEQ .branch009717

#_00970E: INX
#_00970F: CMP.b #$03
#_009711: BNE .branch009717

#_009713: INX
#_009714: INX

.branch009717
#_009715: STX.w $0E80

.branch009718
#_009718: JSL Zero2KBinVRAM_setup
#_00971C: STA.w MDMAEN
#_00971F: DEC.w $0E80
#_009722: BPL .branch009718

#_009724: LDA.b #$00
#_009726: STA.w $0F06
#_009729: PLP
#_00972A: RTL

;===================================================================================================

EmptyFirst4KBin7F0000:
#_00972B: PHP
#_00972C: REP #$30

#_00972E: LDA.w #$0000
#_009731: TAX

.next
#_009732: STA.l $7F0000,X

#_009736: INX
#_009737: INX
#_009738: CPX.w #$1000
#_00973B: BCC .next

#_00973D: PLP
#_00973E: RTL

;===================================================================================================

RunOpenMenuDMA_X:
#_00973F: PHK

#_009740: JSR OpenMenuDMA
#_009743: JSL AddSelfAsVector

#_009747: RTL

;===================================================================================================

OpenMenuDMA:
#_009748: REP #$10

#_00974A: ASL A
#_00974B: TAY

#_00974C: PHB

#_00974D: SEP #$20

#_00974F: LDA.b #data07E78A>>16
#_009751: PHA

#_009752: REP #$20
#_009754: PLB

#_009755: LDA.w data07E78A,Y
#_009758: STA.w $0090

#_00975B: LDY.w #$0000

; copies
;  number of transfers
;  vram location
;  size of transfer
.next_header_byte
#_00975E: LDA.b ($90),Y
#_009760: STA.w $0100,Y

#_009763: INY
#_009764: INY
#_009765: CPY.w #$0006
#_009768: BCC .next_header_byte

;---------------------------------------------------------------------------------------------------

#_00976A: LDX.w #$0000

.branch00976D
#_00976D: LDA.b ($90),Y
#_00976F: CMP.w #$FFFF
#_009772: BNE .branch0097A2

#_009774: INY
#_009775: INY

#_009776: LDA.b ($90),Y
#_009778: STA.w $0E80

#_00977B: INY
#_00977C: INY

.branch00977D
#_00977D: LDA.w $0104
#_009780: STA.w $0E82

#_009783: ASL A
#_009784: STA.w $0E84

.branch009787
#_009787: LDA.b ($90),Y
#_009789: STA.w $0106,X

#_00978C: INY
#_00978D: INY

#_00978E: INX
#_00978F: INX

#_009790: DEC.w $0E82
#_009793: BNE .branch009787

#_009795: DEC.w $0E80
#_009798: BEQ .branch0097A9

#_00979A: TYA
#_00979B: SEC
#_00979C: SBC.w $0E84
#_00979F: TAY

#_0097A0: BRA .branch00977D

;---------------------------------------------------------------------------------------------------

.branch0097A2
#_0097A2: STA.w $0106,X

#_0097A5: INY
#_0097A6: INY

#_0097A7: INX
#_0097A8: INX

.branch0097A9
#_0097A9: TXA
#_0097AA: LSR A ; LSR because X is 2x for character indexing
#_0097AB: CMP.w $0100 ; Compare to number of DMAs
#_0097AE: BCC .branch00976D

#_0097B0: LDA.w $0100
#_0097B3: ORA.w #$8000 ; Flag the DMA as RLE
#_0097B6: STA.w $0100

#_0097B9: PLB
#_0097BA: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine0097BB:
#_0097BB: PHK ; use jsl stupid
#_0097BC: JSR routine0097C4

#_0097BF: JSL AddSelfAsVector

#_0097C3: RTL

;===================================================================================================

routine0097C4:
#_0097C4: REP #$10

#_0097C6: ASL A
#_0097C7: TAY

#_0097C8: PHB

#_0097C9: SEP #$20

#_0097CB: LDA.b #pointers07E7B0>>16
#_0097CD: PHA

#_0097CE: REP #$20

#_0097D0: PLB

#_0097D1: LDA.w pointers07E7B0,Y
#_0097D4: STA.w $0090

#_0097D7: LDY.w #$0000

#_0097DA: LDA.b ($90),Y
#_0097DC: STA.w $0100,Y

#_0097DF: STA.w $0E80

#_0097E2: INY
#_0097E3: INY

;---------------------------------------------------------------------------------------------------

.next_transfer
#_0097E4: LDX.w #$0000

.branch0097E7
#_0097E7: LDA.b ($90),Y
#_0097E9: STA.w $0100,Y

#_0097EC: INY
#_0097ED: INY

#_0097EE: INX
#_0097EF: INX
#_0097F0: CPX.w #$0004
#_0097F3: BCC .branch0097E7

#_0097F5: ASL A
#_0097F6: STA.w $0E82

#_0097F9: LDX.w #$0000

.branch0097FC
#_0097FC: LDA.b ($90),Y
#_0097FE: STA.w $0106,X

#_009801: INY
#_009802: INY

#_009803: INX
#_009804: INX
#_009805: CPX.w $0E82
#_009808: BCC .branch0097FC

#_00980A: DEC.w $0E80
#_00980D: BNE .next_transfer

;---------------------------------------------------------------------------------------------------

#_00980F: PLB
#_009810: RTL

;===================================================================================================

Zero2KBinVRAM_setup:
#_009811: PHP
#_009812: SEP #$30

#_009814: LDA.b #$09 ; Fixed transfer; 2 registers write once
#_009816: STA.w DMA0MODE

#_009819: LDA.b #VMDATA
#_00981B: STA.w DMA0PORT

#_00981E: LDA.b #ZeroLand>>0
#_009820: STA.w DMA0ADDRL

#_009823: LDA.b #ZeroLand>>8
#_009825: STA.w DMA0ADDRH

#_009828: LDA.b #ZeroLand>>16
#_00982A: STA.w DMA0ADDRB
#_00982D: STA.w DMA0SIZEL

#_009830: LDA.b #$08
#_009832: STA.w DMA0SIZEH ; $800 bytes

#_009835: LDA.b #$01
#_009837: STA.w $0F06

#_00983A: PLP
#_00983B: RTL

;===================================================================================================

routine00983C:
#_00983C: PHP
#_00983D: SEP #$30

#_00983F: LDA.b #$01
#_009841: LDX.b #$00
#_009843: JSR PrepareDMAofSomeSort

#_009846: LDA.w $0F48
#_009849: AND.b #$FC
#_00984B: STA.w $0F08

#_00984E: STZ.w $0F07

#_009851: PLP
#_009852: RTL

;===================================================================================================

routine009853:
#_009853: PHP
#_009854: SEP #$30

#_009856: LDA.b #pointers078D2C>>16
#_009858: STA.w $0082
#_00985B: STA.w $0085

#_00985E: LDA.w $040D
#_009861: ASL A
#_009862: TAX

#_009863: REP #$30

#_009865: LDA.l pointers078D2C,X
#_009869: STA.w $0080

#_00986C: PHB
#_00986D: PHK
#_00986E: PLB

#_00986F: STZ.w $0FC4
#_009872: STZ.w $0FC0
#_009875: STZ.w $0FC2

;---------------------------------------------------------------------------------------------------

.next
#_009878: LDA.w $0FC4
#_00987B: ASL A
#_00987C: TAY

#_00987D: LDA.b [$80],Y
#_00987F: STA.w $0083

#_009882: STZ.w $0FC6

.branch009885
#_009885: JSR routine0098C7

#_009888: INC.w $0FC6
#_00988B: BCC .branch009885

#_00988D: INC.w $0FC4

#_009890: LDA.w $0FC4
#_009893: LSR A
#_009894: LSR A
#_009895: LSR A
#_009896: BCC .dont_frame

#_009898: JSL AddSelfAsVector

.dont_frame
#_00989C: LDA.w $0FC4
#_00989F: CMP.w #$0013
#_0098A2: BCC .next

;---------------------------------------------------------------------------------------------------

#_0098A4: LDA.w $0EF5
#_0098A7: AND.w #$8000
#_0098AA: ORA.w #$0008
#_0098AD: STA.w $0EF5

#_0098B0: SEP #$30

#_0098B2: LDA.b #$00
#_0098B4: LDX.b #$00
#_0098B6: JSR PrepareDMAofSomeSort

#_0098B9: LDA.w $0F48
#_0098BC: AND.b #$FC
#_0098BE: STA.w $0F08
#_0098C1: STZ.w $0F07

#_0098C4: PLB

#_0098C5: PLP
#_0098C6: RTL

;===================================================================================================

routine0098C7:
#_0098C7: SEP #$30

#_0098C9: LDA.w $0FC6
#_0098CC: ASL A
#_0098CD: TAY

#_0098CE: LDA.b [$83],Y
#_0098D0: CLC
#_0098D1: ADC.w $070C
#_0098D4: TAX

#_0098D5: INY

#_0098D6: LDA.b [$83],Y
#_0098D8: CLC
#_0098D9: ADC.w $070D
#_0098DC: JSR ReadPage_A_Bank04

#_0098DF: STX.w $0FC8

#_0098E2: TAY
#_0098E3: BPL .branch0098F1

#_0098E5: JSR Reset7F5xxxALOT

#_0098E8: LDA.b #$13
#_0098EA: STA.w $0FC4

#_0098ED: REP #$30

#_0098EF: SEC
#_0098F0: RTS

;---------------------------------------------------------------------------------------------------

.branch0098F1
#_0098F1: AND.b #$40
#_0098F3: BEQ .branch0098F8

#_0098F5: JSR ThisRoutineIsJustAnRTS

.branch0098F8
#_0098F8: LDA.b #pointers0790C4>>16
#_0098FA: STA.w $0088

#_0098FD: LDA.w $0FC4
#_009900: ASL A
#_009901: TAX

#_009902: LDA.l pointers0790C4+0,X
#_009906: STA.w $0086

#_009909: LDA.l pointers0790C4+1,X
#_00990D: STA.w $0087

#_009910: LDY.w $0FC6
#_009913: LDA.b [$86],Y
#_009915: CLC
#_009916: ADC.w $040D
#_009919: AND.b #$03
#_00991B: TAX

#_00991C: LDA.w $0FC8

.roll
#_00991F: ASL A
#_009920: ROL.w $0FC8
#_009923: ASL A
#_009924: ROL.w $0FC8

#_009927: DEX
#_009928: BPL .roll

#_00992A: LDA.w $0FC8
#_00992D: AND.b #$03
#_00992F: BNE .branch00993B

#_009931: LDX.w $0FC6
#_009934: CPX.b #$04
#_009936: BCC .exit

#_009938: STA.w $0FC6

.branch00993B
#_00993B: JSR routine009942

#_00993E: SEC

.exit
#_00993F: REP #$30
#_009941: RTS

;===================================================================================================

; TODO label these pointers
routine009942:
#_009942: ASL A
#_009943: TAY

#_009944: LDA.b #pointers04C400>>16
#_009946: STA.w $0088
#_009949: STA.w $008B
#_00994C: STA.w $008E

#_00994F: REP #$30

#_009951: LDA.w #pointers04C400
#_009954: STA.w $008C

#_009957: LDA.b [$8C],Y
#_009959: STA.w $0086

#_00995C: LDA.w #pointers04C408
#_00995F: STA.w $008C

#_009962: LDA.b [$8C],Y
#_009964: STA.w $0089

#_009967: LDA.w $0FC4
#_00996A: ASL A
#_00996B: TAY

#_00996C: LDA.w data009AD2,Y
#_00996F: ASL A
#_009970: TAY

#_009971: LDA.b [$86],Y
#_009973: STA.w $008C

#_009976: LDA.w $0FC6
#_009979: ASL A
#_00997A: TAY

#_00997B: LDA.b [$8C],Y
#_00997D: STA.w $0086

#_009980: LDA.w $0FC4
#_009983: ASL A
#_009984: TAY

#_009985: LDA.w data009AD2,Y
#_009988: ASL A
#_009989: TAY

#_00998A: LDA.b [$89],Y
#_00998C: STA.w $008C

#_00998F: LDA.w $0FC6
#_009992: ASL A
#_009993: TAY

#_009994: LDA.b [$8C],Y
#_009996: STA.w $0089

#_009999: LDA.w $0FC4
#_00999C: ASL A
#_00999D: TAY

#_00999E: LDA.w data009AF8,Y
#_0099A1: STA.w $0FC9

#_0099A4: LDA.w data009B1E,Y
#_0099A7: STA.w $0FCB

#_0099AA: CPY.w #$0014
#_0099AD: BCC .branch0099B2

#_0099AF: JMP .branch009A37

;---------------------------------------------------------------------------------------------------

.branch0099B2
#_0099B2: LDX.w $0FC0
#_0099B5: LDY.w #$0000

.branch0099B8
#_0099B8: LDA.b [$86],Y
#_0099BA: STA.l $7F5000,X

#_0099BE: INY
#_0099BF: INY
#_0099C0: CPY.w #$001C
#_0099C3: BEQ .branch0099D4

#_0099C5: CPY.w #$0038
#_0099C8: BEQ .branch0099D4

#_0099CA: CPY.w #$0054
#_0099CD: BEQ .branch0099D4

#_0099CF: CPY.w #$0070
#_0099D2: BNE .branch0099DF

.branch0099D4
#_0099D4: INC.w $0FC0
#_0099D7: INC.w $0FC0

#_0099DA: LDX.w $0FC0
#_0099DD: BRA .branch0099E5

;---------------------------------------------------------------------------------------------------

.branch0099DF
#_0099DF: TXA
#_0099E0: CLC
#_0099E1: ADC.w #$0040
#_0099E4: TAX

.branch0099E5
#_0099E5: DEC.w $0FC9
#_0099E8: BNE .branch0099B8

#_0099EA: LDY.w #$0000

.branch0099ED
#_0099ED: LDA.w $0FC4
#_0099F0: CMP.w data009B90,Y
#_0099F3: BEQ .branch0099FE

#_0099F5: INY
#_0099F6: INY
#_0099F7: CPY.w #$0014
#_0099FA: BCC .branch0099ED

#_0099FC: BCS .exit_a

;---------------------------------------------------------------------------------------------------

.branch0099FE
#_0099FE: LDX.w $0FC2
#_009A01: LDY.w #$0000

.branch009A04
#_009A04: LDA.b [$89],Y
#_009A06: STA.l $7F5800,X

#_009A0A: INY
#_009A0B: INY
#_009A0C: CPY.w #$001C
#_009A0F: BEQ .branch009A20

#_009A11: CPY.w #$0038
#_009A14: BEQ .branch009A20

#_009A16: CPY.w #$0054
#_009A19: BEQ .branch009A20

#_009A1B: CPY.w #$0070
#_009A1E: BNE .branch009A2B

.branch009A20
#_009A20: INC.w $0FC2
#_009A23: INC.w $0FC2

#_009A26: LDX.w $0FC2
#_009A29: BRA .branch009A31

.branch009A2B
#_009A2B: TXA
#_009A2C: CLC
#_009A2D: ADC.w #$0040
#_009A30: TAX

.branch009A31
#_009A31: DEC.w $0FCB
#_009A34: BNE .branch009A04

.exit_a
#_009A36: RTS

;---------------------------------------------------------------------------------------------------

.branch009A37
#_009A37: LDX.w $0FC0

#_009A3A: LDA.w data009B44,Y
#_009A3D: TAY

.branch009A3E
#_009A3E: LDA.b [$86],Y
#_009A40: EOR.w #$4000
#_009A43: STA.l $7F5000,X

#_009A47: INY
#_009A48: INY
#_009A49: CPY.w #$001C
#_009A4C: BEQ .branch009A5D

#_009A4E: CPY.w #$0038
#_009A51: BEQ .branch009A5D

#_009A53: CPY.w #$0054
#_009A56: BEQ .branch009A5D

#_009A58: CPY.w #$0070
#_009A5B: BNE .branch009A6E

.branch009A5D
#_009A5D: TYA
#_009A5E: SEC
#_009A5F: SBC.w #$0038
#_009A62: TAY

#_009A63: INC.w $0FC0
#_009A66: INC.w $0FC0

#_009A69: LDX.w $0FC0

#_009A6C: BRA .branch009A74

;---------------------------------------------------------------------------------------------------

.branch009A6E
#_009A6E: TXA
#_009A6F: CLC
#_009A70: ADC.w #$0040
#_009A73: TAX

.branch009A74
#_009A74: DEC.w $0FC9
#_009A77: BNE .branch009A3E

#_009A79: LDY.w #$0000

.branch009A7C
#_009A7C: LDA.w $0FC4
#_009A7F: CMP.w data009B90,Y
#_009A82: BEQ .branch009A8D

#_009A84: INY
#_009A85: INY
#_009A86: CPY.w #$0014
#_009A89: BCC .branch009A7C
#_009A8B: BCS .exit_b

;---------------------------------------------------------------------------------------------------

.branch009A8D
#_009A8D: ASL A
#_009A8E: TAY

#_009A8F: LDA.w data009B6A,Y
#_009A92: TAY

#_009A93: LDX.w $0FC2

.branch009A96
#_009A96: LDA.b [$89],Y
#_009A98: EOR.w #$4000
#_009A9B: STA.l $7F5800,X

#_009A9F: INY
#_009AA0: INY
#_009AA1: CPY.w #$001C
#_009AA4: BEQ .branch009AB5

#_009AA6: CPY.w #$0038
#_009AA9: BEQ .branch009AB5

#_009AAB: CPY.w #$0054
#_009AAE: BEQ .branch009AB5

#_009AB0: CPY.w #$0070
#_009AB3: BNE .branch009AC6

.branch009AB5
#_009AB5: TYA
#_009AB6: SEC
#_009AB7: SBC.w #$0038
#_009ABA: TAY

#_009ABB: INC.w $0FC2
#_009ABE: INC.w $0FC2

#_009AC1: LDX.w $0FC2
#_009AC4: BRA .branch009ACC

.branch009AC6
#_009AC6: TXA
#_009AC7: CLC
#_009AC8: ADC.w #$0040
#_009ACB: TAX

.branch009ACC
#_009ACC: DEC.w $0FCB
#_009ACF: BNE .branch009A96

.exit_b
#_009AD1: RTS

;---------------------------------------------------------------------------------------------------

data009AD2:
#_009AD2: dw $0000,$0001,$0002,$0003
#_009ADA: dw $0004,$0005,$0006,$0007
#_009AE2: dw $0008,$0009,$0008,$0007
#_009AEA: dw $0006,$0005,$0004,$0003
#_009AF2: dw $0002,$0001,$0000

data009AF8:
#_009AF8: dw $0038,$001C,$001C,$001C
#_009B00: dw $000E,$000E,$000E,$000E
#_009B08: dw $000E,$001C,$000E,$000E
#_009B10: dw $000E,$000E,$000E,$001C
#_009B18: dw $001C,$001C,$0038

data009B1E:
#_009B1E: dw $0000,$0000,$0038,$002A
#_009B26: dw $002A,$0000,$002A,$0000
#_009B2E: dw $002A,$0000,$002A,$0000
#_009B36: dw $002A,$0000,$002A,$002A
#_009B3E: dw $0038,$0000,$0000

data009B44:
#_009B44: dw $0000,$0000,$0000,$0000
#_009B4C: dw $0000,$0000,$0000,$0000
#_009B54: dw $0000,$0000,$0000,$0000
#_009B5C: dw $0000,$0000,$0000,$001C
#_009B64: dw $001C,$001C,$0054

data009B6A:
#_009B6A: dw $0000,$0000,$0000,$0000
#_009B72: dw $0000,$0000,$0000,$0000
#_009B7A: dw $0000,$0000,$0038,$0000
#_009B82: dw $0038,$0000,$0038,$0038
#_009B8A: dw $0054,$0000,$0000

data009B90:
#_009B90: dw $0002,$0003,$0004,$0006
#_009B98: dw $0008,$000A,$000C,$000E
#_009BA0: dw $000F,$0010

;===================================================================================================

Reset7F5xxxALOT:
#_009BA4: PHP

#_009BA5: REP #$30

#_009BA7: LDX.w #$0000
#_009BAA: LDA.w #$09B4

.next
#_009BAD: STA.l $7F5000,X
#_009BB1: STA.l $7F5800,X

#_009BB5: INX
#_009BB6: INX
#_009BB7: CPX.w #$0380
#_009BBA: BCC .next

#_009BBC: PLP
#_009BBD: RTS

;===================================================================================================
; Enters with:
; A - page of bank04 to read
; X - offset into page to read
; Returns with:
; X - low byte read
; A - high byte read
;===================================================================================================
ReadPage_A_Bank04:
#_009BBE: CLC
#_009BBF: ADC.l .highbyte80
#_009BC3: STA.w $0087

#_009BC6: LDA.l .lowbyte00
#_009BCA: STA.w $0086

#_009BCD: LDA.b #$04
#_009BCF: STA.w $0088

#_009BD2: TXA
#_009BD3: ASL A
#_009BD4: TAY

#_009BD5: LDA.b [$86],Y
#_009BD7: TAX

#_009BD8: INY
#_009BD9: LDA.b [$86],Y

#_009BDB: RTS

.lowbyte00
#_009BDC: db $00

.highbyte80
#_009BDD: db $80

;===================================================================================================

; TODO something with dungeon events? maybe just getting them
routine009BDE:
#_009BDE: PHP
#_009BDF: SEP #$30

#_009BE1: LDX.w $070C

#_009BE4: LDA.w $070D
#_009BE7: JSR ReadPage_A_Bank04

#_009BEA: TAY ; so give Y the high byte
#_009BEB: TXA ; Give A the low byte

#_009BEC: LDX.w $040D ; number of times to shift A

.rollin_rollin
#_009BEF: ASL A
#_009BF0: ROL.w $0FC8
#_009BF3: ASL A
#_009BF4: ROL.w $0FC8

#_009BF7: DEX
#_009BF8: BPL .rollin_rollin

#_009BFA: LDA.w $0FC8
#_009BFD: AND.b #$03
#_009BFF: TAX

#_009C00: CMP.b #$01
#_009C02: BNE .fail

#_009C04: TYA

#_009C05: PLP

#_009C06: SEC
#_009C07: RTL

.fail
#_009C08: TYA

#_009C09: PLP

#_009C0A: CLC
#_009C0B: RTL

;===================================================================================================
; Nothing special
;===================================================================================================
ThisRoutineIsJustAnRTS:
#_009C0C: RTS

;===================================================================================================

routine009C0D:
#_009C0D: PHP
#_009C0E: SEP #$30

#_009C10: STA.w $0FCD

#_009C13: LDA.b #pointers079149>>16
#_009C15: STA.w $0082
#_009C18: STA.w $0085
#_009C1B: STA.w $0088

#_009C1E: LDA.w $040D
#_009C21: BIT.w $0FCD
#_009C24: BPL .branch009C29

#_009C26: CLC
#_009C27: ADC.b #$03

.branch009C29
#_009C29: AND.b #$03
#_009C2B: ASL A
#_009C2C: TAX

#_009C2D: REP #$30

#_009C2F: LDA.l pointers079149,X
#_009C33: STA.w $0080

#_009C36: PHB
#_009C37: PHK
#_009C38: PLB

#_009C39: STZ.w $0FC4
#_009C3C: STZ.w $0FC0
#_009C3F: STZ.w $0FCE

.branch009C42
#_009C42: LDA.w $0FC4
#_009C45: ASL A
#_009C46: TAY

#_009C47: LDA.b [$80],Y
#_009C49: STA.w $0083

#_009C4C: STZ.w $0FC6

;---------------------------------------------------------------------------------------------------

.branch009C4F
#_009C4F: JSR routine009C9B

#_009C52: INC.w $0FC6
#_009C55: BCC .branch009C4F

#_009C57: INC.w $0FC4

#_009C5A: LDA.w $0FC4
#_009C5D: CMP.w #$0002
#_009C60: BNE .branch009C66

#_009C62: JSL AddSelfAsVector

.branch009C66
#_009C66: LDA.w $0FC4
#_009C69: CMP.w #$0006
#_009C6C: BCC .branch009C42

#_009C6E: LDA.w $0EF5
#_009C71: AND.w #$8000
#_009C74: ORA.w #$000C
#_009C77: STA.w $0EF5

#_009C7A: SEP #$30

#_009C7C: LDA.b #$00
#_009C7E: LDX.b #$00
#_009C80: JSR PrepareDMAofSomeSort

; $1000 byte DMA
#_009C83: LDA.b #$00
#_009C85: STA.w DMA0SIZEL

#_009C88: LDA.b #$10
#_009C8A: STA.w DMA0SIZEH

#_009C8D: LDA.w $0F48
#_009C90: AND.b #$FC
#_009C92: STA.w $0F08

#_009C95: STZ.w $0F07

#_009C98: PLB

#_009C99: PLP
#_009C9A: RTL

;===================================================================================================

routine009C9B:
#_009C9B: SEP #$30

#_009C9D: LDA.w $0FC6
#_009CA0: ASL A
#_009CA1: TAY

#_009CA2: LDA.b [$83],Y
#_009CA4: CLC
#_009CA5: ADC.w $070C
#_009CA8: TAX

#_009CA9: INY

#_009CAA: LDA.b [$83],Y
#_009CAC: CLC
#_009CAD: ADC.w $070D
#_009CB0: JSR ReadPage_A_Bank04
#_009CB3: STX.w $0FC8

#_009CB6: TAY
#_009CB7: BPL .branch009CC5

#_009CB9: JSR Reset7F5xxxALOT

#_009CBC: LDA.b #$06
#_009CBE: STA.w $0FC4

#_009CC1: REP #$30
#_009CC3: SEC

#_009CC4: RTS

;---------------------------------------------------------------------------------------------------

.branch009CC5
#_009CC5: LDA.b #pointers079241>>16
#_009CC7: STA.w $0088

#_009CCA: LDA.w $0FC4
#_009CCD: ASL A
#_009CCE: TAX

#_009CCF: LDA.l pointers079241+0,X
#_009CD3: STA.w $0086

#_009CD6: LDA.l pointers079241+1,X
#_009CDA: STA.w $0087

#_009CDD: LDY.w $0FC6

#_009CE0: LDA.b [$86],Y
#_009CE2: CLC
#_009CE3: ADC.w $040D
#_009CE6: BIT.w $0FCD
#_009CE9: BPL .branch009CED

#_009CEB: ADC.b #$03

.branch009CED
#_009CED: AND.b #$03
#_009CEF: TAX

#_009CF0: LDA.w $0FC8

.roll_more
#_009CF3: ASL A
#_009CF4: ROL.w $0FC8
#_009CF7: ASL A
#_009CF8: ROL.w $0FC8

#_009CFB: DEX
#_009CFC: BPL .roll_more

#_009CFE: LDA.w $0FC8
#_009D01: AND.b #$03
#_009D03: BNE .branch009D0F

#_009D05: LDX.w $0FC6
#_009D08: CPX.b #$03
#_009D0A: BCC .exit

#_009D0C: STA.w $0FC6

.branch009D0F
#_009D0F: JSR Prepare_UW_View_Tilemap_Update

#_009D12: SEC

.exit
#_009D13: REP #$30
#_009D15: RTS

;===================================================================================================
; Input is A, which already has been masked with 0x03
; get pointer P from 04E95A
; then get pointer Q from P
; then pointer R from Q
; then pointer S from R
; please stop thank you
; I think this is a striped format
;===================================================================================================
; TODO analyze more
Prepare_UW_View_Tilemap_Update:
#_009D16: ASL A
#_009D17: TAY

; $04E95A to both
#_009D18: LDA.b #data04E95A>>16
#_009D1A: STA.w $0088
#_009D1D: STA.w $008B

; Use 2*Param to index 04E95A
; that's the next pointer

#_009D20: REP #$30

#_009D22: LDA.w #data04E95A
#_009D25: STA.w $0089

#_009D28: LDA.b [$89],Y
#_009D2A: STA.w $0086

; Use this to index a table of indices
#_009D2D: LDA.w $0FC4
#_009D30: ASL A
#_009D31: TAY

#_009D32: LDA.w .table_indices,Y
#_009D35: ASL A
#_009D36: TAY

; now read the table we got from another table
; and put that in a new table!
#_009D37: LDA.b [$86],Y
#_009D39: STA.w $0089

#_009D3C: LDA.w $0FC6
#_009D3F: ASL A
#_009D40: TAY

#_009D41: LDA.b [$89],Y
#_009D43: STA.w $0086

#_009D46: LDA.w $0FC4
#_009D49: CMP.w #$0003
#_009D4C: BCS .step_3plus

#_009D4E: LDA.w #$0054
#_009D51: STA.w $0FC9

#_009D54: LDX.w $0FC0
#_009D57: LDY.w #$0000

; this one goes left-to-right
.next_tile_a
#_009D5A: LDA.b [$86],Y
#_009D5C: STA.l $7F5000,X

#_009D60: INY
#_009D61: INY

; steps of 28
#_009D62: CPY.w #28
#_009D65: BEQ .next_column_a

#_009D67: CPY.w #56
#_009D6A: BEQ .next_column_a

#_009D6C: CPY.w #84
#_009D6F: BEQ .next_column_a

#_009D71: CPY.w #112
#_009D74: BEQ .next_column_a

#_009D76: CPY.w #140
#_009D79: BEQ .next_column_a

#_009D7B: CPY.w #168
#_009D7E: BNE .same_column_a

.next_column_a
#_009D80: INC.w $0FC0
#_009D83: INC.w $0FC0

#_009D86: LDX.w $0FC0
#_009D89: BRA .continue_a

.same_column_a
#_009D8B: TXA
#_009D8C: CLC
#_009D8D: ADC.w #$0040
#_009D90: TAX

.continue_a
#_009D91: DEC.w $0FC9
#_009D94: BNE .next_tile_a

#_009D96: RTS

;---------------------------------------------------------------------------------------------------

.step_3plus
#_009D97: CMP.w #$0005
#_009D9A: BNE .not_step_5

#_009D9C: LDA.w #$FFFF
#_009D9F: STA.w $0FCE

.not_step_5
#_009DA2: LDA.w #$0054
#_009DA5: STA.w $0FC9
#_009DA8: LDX.w $0FC0
#_009DAB: LDY.w #$008C

; this one seems to go right-to-left
.next_tile_b
#_009DAE: LDA.b [$86],Y
#_009DB0: EOR.w #$4000 ; H flip toggle
#_009DB3: STA.l $7F5000,X
#_009DB7: INY
#_009DB8: INY

#_009DB9: CPY.w #28
#_009DBC: BEQ .next_column_b

#_009DBE: CPY.w #56
#_009DC1: BEQ .next_column_b

#_009DC3: CPY.w #84
#_009DC6: BEQ .next_column_b

#_009DC8: CPY.w #112
#_009DCB: BEQ .next_column_b

#_009DCD: CPY.w #140
#_009DD0: BNE .check_halfway

#_009DD2: BIT.w $0FCE
#_009DD5: BPL .next_column_b

#_009DD7: LDX.w #168
#_009DDA: STX.w $0FC0
#_009DDD: BRA .continue_b

.check_halfway
#_009DDF: CPY.w #$00A8
#_009DE2: BNE .not_halfway

.next_column_b
#_009DE4: INC.w $0FC0
#_009DE7: INC.w $0FC0

#_009DEA: LDX.w $0FC0

.continue_b
#_009DED: TYA
#_009DEE: SEC
#_009DEF: SBC.w #$0038
#_009DF2: TAY
#_009DF3: BRA .continue_c

.not_halfway
#_009DF5: TXA
#_009DF6: CLC
#_009DF7: ADC.w #$0040
#_009DFA: TAX

.continue_c
#_009DFB: DEC.w $0FC9
#_009DFE: BNE .next_tile_b

#_009E00: RTS

.table_indices
#_009E01: dw 0, 1, 2, 2, 1, 0

;===================================================================================================

RunOpenMenuDMA_Xplus6:
#_009E0D: CLC
#_009E0E: ADC.w #$0006
#_009E11: JSL RunOpenMenuDMA_X

#_009E15: RTL

;===================================================================================================

RunOpenMenuDMA_type0B:
#_009E16: LDA.w #$000B
#_009E19: JSL RunOpenMenuDMA_X

#_009E1D: RTL

;===================================================================================================

BringUpAMenu:
#_009E1E: PHP
#_009E1F: REP #$30

#_009E21: JSR Clear0106TextBuffer

#_009E24: LDA.w #$3C38 ; VRAM $7870 - where the menu is
#_009E27: STA.w $0102

#_009E2A: LDA.w #$000B
#_009E2D: STA.w $0104

#_009E30: LDA.w #$8042
#_009E33: STA.w $0100

#_009E36: JSL AddSelfAsVector

#_009E3A: PLP

; Was there a call point at here one time maybe?
#_009E3B: PHP

#_009E3C: REP #$30

#_009E3E: JSR Clear0106TextBuffer

#_009E41: LDA.w #$3CE2 ; $79C4 VRAM - money tile map address
#_009E44: STA.w $0102

#_009E47: LDA.w #$0002
#_009E4A: STA.w $0104

#_009E4D: LDA.w #$800E
#_009E50: STA.w $0100

#_009E53: JSL AddSelfAsVector

#_009E57: PLP
#_009E58: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine009E59:
#_009E59: PHP
#_009E5A: REP #$30

#_009E5C: JSR Clear0106TextBuffer

#_009E5F: LDA.w #$3C83 ; $7906 VRAM
#_009E62: STA.w $0102

#_009E65: LDA.w #$0002
#_009E68: STA.w $0104

#_009E6B: LDA.w #$800C
#_009E6E: STA.w $0100

#_009E71: JSL AddSelfAsVector

#_009E75: PLP
#_009E76: RTL

;===================================================================================================

UpdateMoonPhase:
#_009E77: PHP
#_009E78: REP #$30

#_009E7A: JSR Clear0106TextBuffer
#_009E7D: LDA.w #$3C23 ; $7846 VRAM
#_009E80: STA.w $0102

#_009E83: LDA.w #$0008
#_009E86: STA.w $0104

#_009E89: LDA.w #$8038
#_009E8C: STA.w $0100

#_009E8F: JSL AddSelfAsVector

#_009E93: PLP
#_009E94: RTL

;===================================================================================================

Write7066VRAM:
#_009E95: PHP

#_009E96: REP #$30

#_009E98: JSR Clear0106TextBuffer

#_009E9B: LDA.w #$3833 ; $7066 VRAM
#_009E9E: STA.w $0102

#_009EA1: LDA.w #$000E
#_009EA4: STA.w $0104

#_009EA7: LDA.w #$808C
#_009EAA: STA.w $0100

#_009EAD: JSL AddSelfAsVector

#_009EB1: PLP
#_009EB2: RTL

;===================================================================================================

Write785CVRAM:
#_009EB3: PHP
#_009EB4: REP #$30

#_009EB6: JSR Clear0106TextBuffer

#_009EB9: LDA.w #$000C
#_009EBC: STA.w $0E00

.next
#_009EBF: LDA.w $0E00
#_009EC2: ASL A ; x32
#_009EC3: ASL A
#_009EC4: ASL A
#_009EC5: ASL A
#_009EC6: ASL A
#_009EC7: CLC
#_009EC8: ADC.w #$3C2E ; $785C VRAM
#_009ECB: STA.w $0102

#_009ECE: LDA.w #$0010
#_009ED1: STA.w $0104

#_009ED4: LDA.w #$0001
#_009ED7: STA.w $0100

#_009EDA: JSL AddSelfAsVector

#_009EDE: DEC.w $0E00
#_009EE1: BPL .next

#_009EE3: PLP
#_009EE4: RTL

;===================================================================================================

Write7C46VRAM:
#_009EE5: PHP
#_009EE6: REP #$30

#_009EE8: JSR Clear0106TextBuffer

#_009EEB: LDA.w #$3E23 ; $7C46 VRAM
#_009EEE: STA.w $0102

#_009EF1: LDA.w #$0006
#_009EF4: STA.w $0104

#_009EF7: LDA.w #$8042
#_009EFA: STA.w $0100

#_009EFD: JSL AddSelfAsVector

#_009F01: PLP
#_009F02: RTL

;===================================================================================================

Clear0106TextBuffer:
#_009F03: LDY.w #$0000
#_009F06: LDA.w #$2000

.next
#_009F09: STA.w $0106,Y

#_009F0C: INY
#_009F0D: INY
#_009F0E: CPY.w #$0120
#_009F11: BCC .next

#_009F13: RTS

;===================================================================================================

ResetSomeTextMaybe:
#_009F14: PHP
#_009F15: REP #$30

#_009F17: LDY.w #$0000
#_009F1A: LDA.w #$20CF

.next_space
#_009F1D: STA.w $0106,Y

#_009F20: INY
#_009F21: INY
#_009F22: CPY.w #$0020
#_009F25: BCC .next_space

#_009F27: LDA.w #$0000

.next_line
#_009F2A: STA.w $0E00
#_009F2D: ASL A ; x32
#_009F2E: ASL A
#_009F2F: ASL A
#_009F30: ASL A
#_009F31: ASL A
#_009F32: CLC
#_009F33: ADC.w #$3C2E ; $785C VRAM
#_009F36: STA.w $0102

#_009F39: LDA.w #$0010
#_009F3C: STA.w $0104

#_009F3F: LDA.w #$0001
#_009F42: STA.w $0100

#_009F45: JSL AddSelfAsVector

#_009F49: INC.w $0E00

#_009F4C: LDA.w $0E00
#_009F4F: CMP.w #$000D
#_009F52: BCC .next_line

#_009F54: PLP
#_009F55: RTL

;===================================================================================================

WriteMoneyToHUD:
#_009F56: PHP

#_009F57: JSL routine00A9AD

#_009F5B: REP #$30

#_009F5D: STZ.w $0E00

#_009F60: LDA.w #$2000
#_009F63: STA.w $0EFB

#_009F66: LDA.w #$FFFF
#_009F69: STA.w $0E88

.branch009F6C
#_009F6C: LDA.w $0405
#_009F6F: STA.w $0E80

#_009F72: LDX.w $0407
#_009F75: STX.w $0E82

#_009F78: LDA.w #$3CE2 ; $79C4 VRAM
#_009F7B: STA.w $0102

#_009F7E: LDY.w #$000C
#_009F81: LDA.w #$0108
#_009F84: JSL WriteAmountHEXtoDEC

#_009F88: LDA.w #$20CD
#_009F8B: PHA
#_009F8C: PHY

#_009F8D: SEP #$30

#_009F8F: LDA.b #$EC
#_009F91: JSL CheckGameProgressFlag

#_009F95: REP #$30
#_009F97: BCC .branch009FA0

; this stack juggling was not thought through...
#_009F99: PLY
#_009F9A: PLA

#_009F9B: LDA.w #$20CC
#_009F9E: PHA
#_009F9F: PHY

.branch009FA0
#_009FA0: PLY

#_009FA1: PLA
#_009FA2: STA.w $0106

#_009FA5: LDA.w $0E00
#_009FA8: TAY

#_009FA9: ASL A
#_009FAA: TAX

#_009FAB: LDA.w #$20DE
#_009FAE: STA.w $010A,X

#_009FB1: INY
#_009FB2: INY
#_009FB3: INY
#_009FB4: STY.w $0104

#_009FB7: LDA.w #$0001
#_009FBA: STA.w $0100

#_009FBD: JSL AddSelfAsVector

#_009FC1: INC.w $0E00

#_009FC4: LDA.w $0E00
#_009FC7: CMP.w #$0006
#_009FCA: BCC .branch009F6C

#_009FCC: LDA.w #$0000
#_009FCF: STA.w $0114

#_009FD2: LDA.w #$0001
#_009FD5: STA.w $0100
#_009FD8: JSL AddSelfAsVector

#_009FDC: PLP
#_009FDD: RTL

;===================================================================================================

WriteMAGToHUD:
#_009FDE: PHP

#_009FDF: JSL routine00A9AD

#_009FE3: REP #$30

#_009FE5: STZ.w $0E00

#_009FE8: LDA.w #$2000
#_009FEB: STA.w $0EFB

#_009FEE: LDA.w #$FFFF
#_009FF1: STA.w $0E88

.next
#_009FF4: LDA.w $0409
#_009FF7: STA.w $0E80

#_009FFA: LDX.w $040B
#_009FFD: STX.w $0E82

#_00A000: LDA.w #$3D02 ; $7A04 VRAM
#_00A003: STA.w $0102

#_00A006: LDY.w #$000A
#_00A009: LDA.w #$010A
#_00A00C: JSL WriteAmountHEXtoDEC

#_00A010: LDA.w #$20CE
#_00A013: STA.w $0106

#_00A016: LDA.w #$20DF
#_00A019: STA.w $0108

#_00A01C: LDA.w $0E00
#_00A01F: TAY

#_00A020: ASL A
#_00A021: TAX

#_00A022: LDA.w #$20DE
#_00A025: STA.w $010C,X

#_00A028: INY
#_00A029: INY
#_00A02A: INY
#_00A02B: INY
#_00A02C: STY.w $0104

#_00A02F: LDA.w #$0001
#_00A032: STA.w $0100

#_00A035: JSL AddSelfAsVector

#_00A039: INC.w $0E00

#_00A03C: LDA.w $0E00
#_00A03F: CMP.w #$0005
#_00A042: BCC .next

;---------------------------------------------------------------------------------------------------

#_00A044: LDA.w #$0000
#_00A047: STA.w $0114

#_00A04A: LDA.w #$0001
#_00A04D: STA.w $0100

#_00A050: JSL AddSelfAsVector

#_00A054: PLP
#_00A055: RTL

;===================================================================================================

routine00A056:
#_00A056: PHP
#_00A057: REP #$30
#_00A059: LDA.w #$0000

.branch00A05C
#_00A05C: STA.w $0E00
#_00A05F: LDA.w #$0001
#_00A062: CLC
#_00A063: ADC.w $0E00
#_00A066: JSL RunOpenMenuDMA_X
#_00A06A: LDA.w $0E00
#_00A06D: INC A
#_00A06E: CMP.w #$0004
#_00A071: BCC .branch00A05C

#_00A073: LDA.w #$0000

.branch00A076
#_00A076: STA.w $0E00
#_00A079: LDA.w #$0005
#_00A07C: JSL OpenMenuDMA

#_00A080: SEP #$20
#_00A082: LDA.w $0E00
#_00A085: LSR A
#_00A086: ROR A
#_00A087: ROR A
#_00A088: ROL.w $0E02
#_00A08B: CLC
#_00A08C: ADC.w $0102
#_00A08F: STA.w $0102
#_00A092: LDA.w $0E02
#_00A095: AND.b #$01
#_00A097: ADC.w $0103
#_00A09A: STA.w $0103

#_00A09D: REP #$20
#_00A09F: JSL AddSelfAsVector
#_00A0A3: LDA.w $0E00
#_00A0A6: INC A
#_00A0A7: CMP.w #$0005
#_00A0AA: BCC .branch00A076

#_00A0AC: PLP
#_00A0AD: RTL

;===================================================================================================

UpdateDialogBox:
#_00A0AE: PHP
#_00A0AF: REP #$30

#_00A0B1: LDA.w #$0004

.branch00A0B4
#_00A0B4: STA.w $0E00

#_00A0B7: LDA.w #$0005
#_00A0BA: JSL OpenMenuDMA

#_00A0BE: SEP #$20

#_00A0C0: LDA.w $0E00
#_00A0C3: LSR A
#_00A0C4: ROR A
#_00A0C5: ROR A
#_00A0C6: ROL.w $0E02
#_00A0C9: CLC
#_00A0CA: ADC.w $0102
#_00A0CD: STA.w $0102

#_00A0D0: LDA.w $0E02
#_00A0D3: AND.b #$01
#_00A0D5: ADC.w $0103
#_00A0D8: STA.w $0103

#_00A0DB: REP #$20

#_00A0DD: JSL AddSelfAsVector

#_00A0E1: LDA.w $0E00
#_00A0E4: DEC A
#_00A0E5: BPL .branch00A0B4

;---------------------------------------------------------------------------------------------------

#_00A0E7: LDA.w #$0004

.branch00A0EA
#_00A0EA: STA.w $0E00

#_00A0ED: LDA.w #$0000
#_00A0F0: CLC
#_00A0F1: ADC.w $0E00
#_00A0F4: JSL RunOpenMenuDMA_X

#_00A0F8: LDA.w $0E00

#_00A0FB: DEC A
#_00A0FC: BPL .branch00A0EA

#_00A0FE: PLP
#_00A0FF: RTL

;===================================================================================================

PrepareDMAofSomeSort:
#_00A100: ASL A
#_00A101: ASL A
#_00A102: ASL A
#_00A103: TAY

#_00A104: PHB
#_00A105: PHK
#_00A106: PLB

#_00A107: LDA.w .properties+0,Y
#_00A10A: STA.w DMAXMODE,X

#_00A10D: LDA.w .properties+1,Y
#_00A110: STA.w DMAXPORT,X

#_00A113: LDA.w .properties+2,Y
#_00A116: STA.w DMAXADDRL,X

#_00A119: LDA.w .properties+3,Y
#_00A11C: STA.w DMAXADDRH,X

#_00A11F: LDA.w .properties+4,Y
#_00A122: STA.w DMAXADDRB,X

#_00A125: LDA.w .properties+5,Y
#_00A128: STA.w DMAXSIZEL,X

#_00A12B: LDA.w .properties+6,Y
#_00A12E: STA.w DMAXSIZEH,X

#_00A131: LDA.w .properties+7,Y
#_00A134: ORA.w $0F06
#_00A137: STA.w $0F06

#_00A13A: PLB
#_00A13B: RTS

;---------------------------------------------------------------------------------------------------

.properties
; A
#_00A13C: db $01 ; DMA type
#_00A13D: db VMDATA ; DMA port
#_00A13E: dl $7F5000 ; A bus
#_00A141: dw $0380 ; size
#_00A143: db $01 ; channel bit

; B
#_00A144: db $01 ; DMA type
#_00A145: db VMDATA ; DMA port
#_00A146: dl $7F5800 ; A bus
#_00A149: dw $0380 ; size
#_00A14B: db $01 ; channel bit

;===================================================================================================

routine00A14C:
#_00A14C: PHP
#_00A14D: REP #$30

#_00A14F: LDA.w #$0000
#_00A152: JSL routine0097C4
#_00A156: JSL WriteVRAMfrom0100

#_00A15A: LDA.w #$2000
#_00A15D: STA.w $0EFB

#_00A160: LDY.w #$000A

.next
#_00A163: PHY

#_00A164: LDA.w $0700,Y
#_00A167: BMI .branch00A16F

#_00A169: JSL routine00A1E7
#_00A16D: BRA .branch00A173

.branch00A16F
#_00A16F: JSL routine00A1B0

.branch00A173
#_00A173: JSL WriteVRAMfrom0100

#_00A177: PLY
#_00A178: DEY
#_00A179: DEY
#_00A17A: BPL .next

#_00A17C: PLP
#_00A17D: RTL

;===================================================================================================

; TODO something with inventory?
; seems like a gradual version of the routine above
; maybe updating it in vram?
routine00A17E:
#_00A17E: PHP
#_00A17F: REP #$30

#_00A181: LDA.w #$0000
#_00A184: JSL routine0097C4
#_00A188: JSL AddSelfAsVector

#_00A18C: LDA.w #$2000
#_00A18F: STA.w $0EFB

#_00A192: LDY.w #$000A

.next
#_00A195: PHY

#_00A196: LDA.w $0700,Y
#_00A199: BMI .branch00A1A1

#_00A19B: JSL routine00A1E7
#_00A19F: BRA .branch00A1A5

.branch00A1A1
#_00A1A1: JSL routine00A1B0

.branch00A1A5
#_00A1A5: JSL AddSelfAsVector

#_00A1A9: PLY
#_00A1AA: DEY
#_00A1AB: DEY
#_00A1AC: BPL .next

#_00A1AE: PLP
#_00A1AF: RTL

;===================================================================================================

routine00A1B0:
#_00A1B0: TYA
#_00A1B1: ASL A ; x32
#_00A1B2: ASL A
#_00A1B3: ASL A
#_00A1B4: ASL A
#_00A1B5: ASL A
#_00A1B6: CLC
#_00A1B7: ADC.w #$3461 ; $68C2 VRAM
#_00A1BA: STA.w $0102

#_00A1BD: LDA.w #$00CF
#_00A1C0: LDY.w #$0000

.next
#_00A1C3: STA.w $0106,Y

#_00A1C6: INY
#_00A1C7: INY
#_00A1C8: CPY.w #$0084
#_00A1CB: BCC .next

#_00A1CD: LDA.w $0102
#_00A1D0: SEC
#_00A1D1: SBC.w #$0020
#_00A1D4: STA.w $0142

#_00A1D7: LDA.w #$001E
#_00A1DA: STA.w $0104
#_00A1DD: STA.w $0144

#_00A1E0: LDA.w #$0002
#_00A1E3: STA.w $0100

#_00A1E6: RTL

;===================================================================================================

routine00A1E7:
#_00A1E7: LDA.w $0700,Y
#_00A1EA: PHA

#_00A1EB: TYA
#_00A1EC: ASL A ; x32
#_00A1ED: ASL A
#_00A1EE: ASL A
#_00A1EF: ASL A
#_00A1F0: ASL A
#_00A1F1: CLC
#_00A1F2: ADC.w #$3464 ; $68C8 VRAM
#_00A1F5: STA.w $0102

#_00A1F8: SEC
#_00A1F9: SBC.w #$0020
#_00A1FC: STA.w $0142

#_00A1FF: TYA
#_00A200: LSR A
#_00A201: CLC
#_00A202: ADC.w #$0002
#_00A205: ORA.w $0EFB
#_00A208: STA.w $0140

; why didn't you just LDA later?
#_00A20B: PLA
#_00A20C: JSL routine00A232

#_00A210: LDA.w $0102
#_00A213: SEC
#_00A214: SBC.w #$0002
#_00A217: STA.w $013C

#_00A21A: LDA.w $0140
#_00A21D: CMP.w #$2005
#_00A220: BCS .branch00A225

#_00A222: DEC.w $013C

.branch00A225
#_00A225: LDA.w #$0001
#_00A228: STA.w $013E

#_00A22B: LDA.w #$0003
#_00A22E: STA.w $0100

#_00A231: RTL

;===================================================================================================

routine00A232:
#_00A232: STA.w $00EE

#_00A235: TAX
#_00A236: CPX.w #$0180
#_00A239: BCC .human

#_00A23B: LDA.w $1004,X
#_00A23E: LDX.w #$0040
#_00A241: LDY.w #$0000
#_00A244: JSL GetDemonName
#_00A248: BRA .continue_with_name

.human
#_00A24A: LDA.w $1004,X
#_00A24D: LDX.w #$0040
#_00A250: LDY.w #$0000
#_00A253: JSL GetHeroName

;---------------------------------------------------------------------------------------------------

.continue_with_name
#_00A257: LDA.w #$001B
#_00A25A: STA.w $0104
#_00A25D: STA.w $0144

#_00A260: LDY.w #$0000
#_00A263: LDA.w #$00CF

.branch00A266
#_00A266: ORA.w $0EFB
#_00A269: STA.w $0156,Y
#_00A26C: INY
#_00A26D: INY
#_00A26E: CPY.w #$0026
#_00A271: BCC .branch00A266

#_00A273: STZ.w $0E88
#_00A276: LDY.w $00EE
#_00A279: LDA.w $102E,Y
#_00A27C: STA.w $0E80
#_00A27F: LDA.w #$0000
#_00A282: STA.w $0E82
#_00A285: LDY.w #$0008
#_00A288: LDA.w #$0116
#_00A28B: JSL WriteAmountHEXtoDEC
#_00A28F: LDA.w #$0098
#_00A292: ORA.w $0EFB
#_00A295: STA.w $011E
#_00A298: LDY.w $00EE
#_00A29B: LDA.w $1030,Y
#_00A29E: STA.w $0E80
#_00A2A1: LDA.w #$0000
#_00A2A4: STA.w $0E82
#_00A2A7: LDY.w #$0006
#_00A2AA: LDA.w #$0120
#_00A2AD: JSL WriteAmountHEXtoDEC
#_00A2B1: LDY.w $00EE
#_00A2B4: LDA.w $1032,Y
#_00A2B7: STA.w $0E80
#_00A2BA: LDA.w #$0000
#_00A2BD: STA.w $0E82
#_00A2C0: LDY.w #$0008
#_00A2C3: LDA.w #$0126
#_00A2C6: JSL WriteAmountHEXtoDEC
#_00A2CA: LDY.w $00EE
#_00A2CD: LDA.w $1034,Y
#_00A2D0: BNE .branch00A2E1

#_00A2D2: LDA.w #$0093
#_00A2D5: ORA.w $0EFB
#_00A2D8: STA.w $0128
#_00A2DB: STA.w $012A
#_00A2DE: STA.w $012C

.branch00A2E1
#_00A2E1: LDA.w #$00CF
#_00A2E4: ORA.w $0EFB
#_00A2E7: STA.w $012E
#_00A2EA: LDX.w #$0000
#_00A2ED: LDY.w $00EE
#_00A2F0: LDA.w $1002,Y

.branch00A2F3
#_00A2F3: ASL A
#_00A2F4: BCS .branch00A31C

#_00A2F6: INX
#_00A2F7: CPX.w #$0010
#_00A2FA: BCC .branch00A2F3

#_00A2FC: LDA.w $1008,Y

.branch00A2FF
#_00A2FF: LSR A
#_00A300: BCS .branch00A31C

#_00A302: INX
#_00A303: CPX.w #$0015
#_00A306: BCC .branch00A2FF

#_00A308: LDY.w #$0000
#_00A30B: LDA.w #$0093

.next_party_member_a
#_00A30E: ORA.w $0EFB
#_00A311: STA.w $0130,Y
#_00A314: INY
#_00A315: INY
#_00A316: CPY.w #$000C
#_00A319: BCC .next_party_member_a

#_00A31B: RTL

;---------------------------------------------------------------------------------------------------

.branch00A31C
#_00A31C: PHB

#_00A31D: SEP #$20
#_00A31F: LDA.b #StatusConditionsText>>16
#_00A321: PHA

#_00A322: REP #$20
#_00A324: PLB
#_00A325: CPX.w #$0004
#_00A328: BCC .branch00A33C

#_00A32A: CPX.w #$0009
#_00A32D: BCC .branch00A334

#_00A32F: CPX.w #$000D
#_00A332: BCC .branch00A33C

.branch00A334
#_00A334: LDA.w $1008,Y
#_00A337: AND.w #$001F
#_00A33A: BNE .branch00A364

.branch00A33C
#_00A33C: TXA
#_00A33D: ASL A
#_00A33E: STA.w $00E0
#_00A341: ASL A
#_00A342: CLC
#_00A343: ADC.w $00E0
#_00A346: TAX

#_00A347: SEP #$20
#_00A349: LDY.w #$0000

.branch00A34C
#_00A34C: LDA.w StatusConditionsText,X
#_00A34F: STA.w $0130,Y
#_00A352: LDA.w $0EFC
#_00A355: STA.w $0131,Y
#_00A358: INX
#_00A359: INY
#_00A35A: INY
#_00A35B: CPY.w #$000C
#_00A35E: BCC .branch00A34C

#_00A360: REP #$20
#_00A362: PLB
#_00A363: RTL

.branch00A364
#_00A364: LDX.w #$0000

.branch00A367
#_00A367: LSR A
#_00A368: INX
#_00A369: BCC .branch00A367

#_00A36B: LDA.w #$0000
#_00A36E: LDY.w $00EE
#_00A371: BEQ .branch00A37A

#_00A373: INC A
#_00A374: CPY.w #$0180
#_00A377: BCC .branch00A37A

#_00A379: INC A

.branch00A37A
#_00A37A: ASL A
#_00A37B: TAY
#_00A37C: LDA.w FightOptionTextPointers,Y
#_00A37F: STA.w $00E0
#_00A382: TXA
#_00A383: DEC A
#_00A384: ASL A
#_00A385: STA.w $00E2
#_00A388: ASL A
#_00A389: CLC
#_00A38A: ADC.w $00E2
#_00A38D: TAY
#_00A38E: LDX.w #$0000

#_00A391: SEP #$20

.branch00A393
#_00A393: LDA.b ($E0),Y
#_00A395: STA.w $0130,X
#_00A398: LDA.w $0EFC
#_00A39B: STA.w $0131,X
#_00A39E: INY
#_00A39F: INX
#_00A3A0: INX
#_00A3A1: CPX.w #$000C
#_00A3A4: BCC .branch00A393

#_00A3A6: REP #$20
#_00A3A8: PLB
#_00A3A9: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00A3AA:
#_00A3AA: LDY.w $00EE
#_00A3AD: LDA.w $1058,Y
#_00A3B0: CMP.w #$FFFF
#_00A3B3: LDX.w #$0070
#_00A3B6: LDY.w #$0030
#_00A3B9: JSL GetSkillName
#_00A3BD: PLB
#_00A3BE: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00A3BF:
#_00A3BF: LDX.w #$0000
#_00A3C2: TXY

.nexttile
#_00A3C3: LDA.w MoonPhaseTiles,X
#_00A3C6: STA.w $0130,Y
#_00A3C9: LDA.w $0EFC
#_00A3CC: STA.w $0130,Y
#_00A3CF: INX
#_00A3D0: INY
#_00A3D1: INY
#_00A3D2: CPY.w #$000C
#_00A3D5: BCC .nexttile

#_00A3D7: PLB
#_00A3D8: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00A3D9:
#_00A3D9: LDY.w $00EE
#_00A3DC: LDA.w $1058,Y
#_00A3DF: AND.w #$00FF
#_00A3E2: LDX.w #$0070
#_00A3E5: LDY.w #$0030
#_00A3E8: JSL GetItemName
#_00A3EC: PLB
#_00A3ED: RTL

;===================================================================================================

routine00A3EE:
#_00A3EE: STA.w $00EE
#_00A3F1: TAX
#_00A3F2: CPX.w #$0180
#_00A3F5: BCC .branch00A406

#_00A3F7: LDA.w $1004,X
#_00A3FA: LDX.w #$0024
#_00A3FD: LDY.w #$0000
#_00A400: JSL GetDemonName
#_00A404: BRA .branch00A413

.branch00A406
#_00A406: LDA.w $1004,X
#_00A409: LDX.w #$0024
#_00A40C: LDY.w #$0000
#_00A40F: JSL GetHeroName

.branch00A413
#_00A413: LDA.w #$0010
#_00A416: STA.w $0104
#_00A419: LDA.w #$0008
#_00A41C: STA.w $0128
#_00A41F: STZ.w $0E88
#_00A422: LDY.w $00EE
#_00A425: LDA.w $102E,Y
#_00A428: STA.w $0E80
#_00A42B: LDA.w #$0000
#_00A42E: STA.w $0E82
#_00A431: LDY.w #$0008
#_00A434: LDA.w #$0116
#_00A437: JSL WriteAmountHEXtoDEC
#_00A43B: LDA.w #$0098
#_00A43E: ORA.w $0EFB
#_00A441: STA.w $011E
#_00A444: LDY.w $00EE
#_00A447: LDA.w $1030,Y
#_00A44A: STA.w $0E80
#_00A44D: LDA.w #$0000
#_00A450: STA.w $0E82
#_00A453: LDY.w #$0006
#_00A456: LDA.w #$0120
#_00A459: JSL WriteAmountHEXtoDEC
#_00A45D: RTL

;===================================================================================================

routine00A45E:
#_00A45E: STA.w $00EE
#_00A461: TAX
#_00A462: CPX.w #$0180
#_00A465: BCC .branch00A476

#_00A467: LDA.w $1004,X
#_00A46A: LDX.w #$002C
#_00A46D: LDY.w #$0000
#_00A470: JSL GetDemonName
#_00A474: BRA .branch00A483

.branch00A476
#_00A476: LDA.w $1004,X
#_00A479: LDX.w #$002C
#_00A47C: LDY.w #$0000
#_00A47F: JSL GetHeroName

.branch00A483
#_00A483: LDA.w #$0014
#_00A486: STA.w $0104
#_00A489: LDA.w #$0008
#_00A48C: STA.w $0130
#_00A48F: STZ.w $0E88
#_00A492: LDY.w $00EE
#_00A495: LDA.w $102E,Y
#_00A498: STA.w $0E80
#_00A49B: LDA.w #$0000
#_00A49E: STA.w $0E82
#_00A4A1: LDY.w #$0008
#_00A4A4: LDA.w #$0116
#_00A4A7: JSL WriteAmountHEXtoDEC
#_00A4AB: LDA.w #$0098
#_00A4AE: ORA.w $0EFB
#_00A4B1: STA.w $011E
#_00A4B4: LDY.w $00EE
#_00A4B7: LDA.w $1030,Y
#_00A4BA: STA.w $0E80
#_00A4BD: LDA.w #$0000
#_00A4C0: STA.w $0E82
#_00A4C3: LDY.w #$0006
#_00A4C6: LDA.w #$0120
#_00A4C9: JSL WriteAmountHEXtoDEC
#_00A4CD: LDY.w $00EE
#_00A4D0: LDA.w $1032,Y
#_00A4D3: STA.w $0E80
#_00A4D6: LDA.w #$0000
#_00A4D9: STA.w $0E82
#_00A4DC: LDY.w #$0008
#_00A4DF: LDA.w #$0126
#_00A4E2: JSL WriteAmountHEXtoDEC
#_00A4E6: LDY.w $00EE
#_00A4E9: LDA.w $1034,Y
#_00A4EC: BNE .exit

#_00A4EE: LDA.w #$0093
#_00A4F1: ORA.w $0EFB
#_00A4F4: STA.w $0128
#_00A4F7: STA.w $012A
#_00A4FA: STA.w $012C

.exit
#_00A4FD: RTL

;===================================================================================================

routine00A4FE:
#_00A4FE: STA.w $00EE
#_00A501: TAX
#_00A502: CPX.w #$0180
#_00A505: BCC .branch00A516

#_00A507: LDA.w $1004,X
#_00A50A: LDX.w #$0032
#_00A50D: LDY.w #$0000
#_00A510: JSL GetDemonName
#_00A514: BRA .branch00A523

.branch00A516
#_00A516: LDA.w $1004,X
#_00A519: LDX.w #$0032
#_00A51C: LDY.w #$0000
#_00A51F: JSL GetHeroName

.branch00A523
#_00A523: LDA.w #$0017
#_00A526: STA.w $0104
#_00A529: STA.w $0136
#_00A52C: LDY.w #$0000
#_00A52F: LDA.w #$00CF

.branch00A532
#_00A532: ORA.w $0EFB
#_00A535: STA.w $0148,Y
#_00A538: INY
#_00A539: INY
#_00A53A: CPY.w #$001E
#_00A53D: BCC .branch00A532

#_00A53F: STZ.w $0E88
#_00A542: LDY.w $00EE
#_00A545: LDA.w $102E,Y
#_00A548: STA.w $0E80
#_00A54B: LDA.w #$0000
#_00A54E: STA.w $0E82
#_00A551: LDY.w #$0008
#_00A554: LDA.w #$0116
#_00A557: JSL WriteAmountHEXtoDEC
#_00A55B: LDY.w $00EE
#_00A55E: LDA.w $1032,Y
#_00A561: STA.w $0E80
#_00A564: LDA.w #$0000
#_00A567: STA.w $0E82
#_00A56A: LDY.w #$0008
#_00A56D: LDA.w #$011E
#_00A570: JSL WriteAmountHEXtoDEC
#_00A574: LDY.w $00EE
#_00A577: LDA.w $1034,Y
#_00A57A: BNE .branch00A58B

#_00A57C: LDA.w #$0093
#_00A57F: ORA.w $0EFB
#_00A582: STA.w $0120
#_00A585: STA.w $0122
#_00A588: STA.w $0124

.branch00A58B
#_00A58B: LDA.w #$00CF
#_00A58E: ORA.w $0EFB
#_00A591: STA.w $0126
#_00A594: LDX.w #$0000
#_00A597: LDY.w $00EE
#_00A59A: LDA.w $1002,Y

.branch00A59D
#_00A59D: ASL A
#_00A59E: BCS .branch00A5BA

#_00A5A0: INX
#_00A5A1: CPX.w #$0010
#_00A5A4: BCC .branch00A59D

#_00A5A6: LDY.w #$0000
#_00A5A9: LDA.w #$0093

.branch00A5AC
#_00A5AC: ORA.w $0EFB
#_00A5AF: STA.w $0128,Y
#_00A5B2: INY
#_00A5B3: INY
#_00A5B4: CPY.w #$000C
#_00A5B7: BCC .branch00A5AC

#_00A5B9: RTL

;---------------------------------------------------------------------------------------------------

.branch00A5BA
#_00A5BA: PHB

#_00A5BB: SEP #$20
#_00A5BD: LDA.b #StatusConditionsText>>16
#_00A5BF: PHA

#_00A5C0: REP #$20
#_00A5C2: PLB
#_00A5C3: TXA
#_00A5C4: ASL A
#_00A5C5: STA.w $00E0
#_00A5C8: ASL A
#_00A5C9: CLC
#_00A5CA: ADC.w $00E0
#_00A5CD: TAX

#_00A5CE: SEP #$20
#_00A5D0: LDY.w #$0000

.branch00A5D3
#_00A5D3: LDA.w StatusConditionsText,X
#_00A5D6: STA.w $0128,Y
#_00A5D9: LDA.w $0EFC
#_00A5DC: STA.w $0129,Y
#_00A5DF: INX
#_00A5E0: INY
#_00A5E1: INY
#_00A5E2: CPY.w #$000C
#_00A5E5: BCC .branch00A5D3

#_00A5E7: REP #$20
#_00A5E9: PLB
#_00A5EA: RTL

;===================================================================================================

routine00A5EB:
#_00A5EB: STA.w $00EE
#_00A5EE: TAX
#_00A5EF: CPX.w #$0180
#_00A5F2: BCC .branch00A603

#_00A5F4: LDA.w $1004,X
#_00A5F7: LDX.w #$0022
#_00A5FA: LDY.w #$0000
#_00A5FD: JSL GetDemonName
#_00A601: BRA .branch00A610

.branch00A603
#_00A603: LDA.w $1004,X
#_00A606: LDX.w #$0022
#_00A609: LDY.w #$0000
#_00A60C: JSL GetHeroName

.branch00A610
#_00A610: LDA.w #$000F
#_00A613: STA.w $0104
#_00A616: STA.w $0126
#_00A619: LDY.w #$0000
#_00A61C: LDA.w #$00CF

.branch00A61F
#_00A61F: ORA.w $0EFB
#_00A622: STA.w $0138,Y
#_00A625: INY
#_00A626: INY
#_00A627: CPY.w #$000E
#_00A62A: BCC .branch00A61F

#_00A62C: LDA.w #$00CF
#_00A62F: ORA.w $0EFB
#_00A632: STA.w $0116
#_00A635: LDY.w $00EE
#_00A638: LDX.w #$0000
#_00A63B: LDA.w $1002,Y

.branch00A63E
#_00A63E: ASL A
#_00A63F: BCS .branch00A65B

#_00A641: INX
#_00A642: CPX.w #$0010
#_00A645: BCC .branch00A63E

#_00A647: LDY.w #$0000
#_00A64A: LDA.w #$0093

.branch00A64D
#_00A64D: ORA.w $0EFB
#_00A650: STA.w $0118,Y
#_00A653: INY
#_00A654: INY
#_00A655: CPY.w #$000C
#_00A658: BCC .branch00A64D

#_00A65A: RTL

;---------------------------------------------------------------------------------------------------

.branch00A65B
#_00A65B: PHB

#_00A65C: SEP #$20

#_00A65E: LDA.b #StatusConditionsText>>16
#_00A660: PHA

#_00A661: REP #$20

#_00A663: PLB

#_00A664: TXA
#_00A665: ASL A
#_00A666: STA.w $00E0

#_00A669: ASL A
#_00A66A: CLC
#_00A66B: ADC.w $00E0
#_00A66E: TAX

#_00A66F: LDY.w #$0000

#_00A672: SEP #$20

.branch00A674
#_00A674: LDA.w StatusConditionsText,X
#_00A677: STA.w $0118,Y

#_00A67A: LDA.w $0EFC
#_00A67D: STA.w $0119,Y

#_00A680: INX

#_00A681: INY
#_00A682: INY
#_00A683: CPY.w #$000C
#_00A686: BCC .branch00A674

#_00A688: REP #$20
#_00A68A: PLB

#_00A68B: RTL

;===================================================================================================

routine00A68C:
#_00A68C: SEP #$30
#_00A68E: INC.w $040F
#_00A691: LDA.w $040F
#_00A694: AND.b #$0F
#_00A696: BNE .exit

#_00A698: LDA.w $040F
#_00A69B: AND.b #$F0
#_00A69D: CMP.b #$90
#_00A69F: BCC .branch00A6A9

#_00A6A1: LDA.b #$80
#_00A6A3: SEC
#_00A6A4: SBC.w $040F
#_00A6A7: AND.b #$70

.branch00A6A9
#_00A6A9: LSR A
#_00A6AA: LSR A
#_00A6AB: LSR A
#_00A6AC: LSR A
#_00A6AD: STA.w $0714
#_00A6B0: BNE .branch00A6B7

#_00A6B2: JSR routine00A774
#_00A6B5: BRA .branch00A6BE

.branch00A6B7
#_00A6B7: CMP.b #$08
#_00A6B9: BNE .branch00A6BE

#_00A6BB: JSR routine00A796

.branch00A6BE
#_00A6BE: JSL routine00A63C

.exit
#_00A6C2: RTL

;===================================================================================================

routine00A63C:
#_00A6C3: PHP
#_00A6C4: JSL routine00A9AD

#_00A6C8: SEP #$30
#_00A6CA: LDA.b #$20
#_00A6CC: STA.w $0EFC
#_00A6CF: STZ.w $0E00
#_00A6D2: STZ.w $0E01

.branch00A6D5
#_00A6D5: LDA.w $0714
#_00A6D8: ASL A
#_00A6D9: ASL A
#_00A6DA: CLC
#_00A6DB: ADC.w $0E00
#_00A6DE: TAX
#_00A6DF: LDA.l MoonPhaseTiles,X
#_00A6E3: BEQ .branch00A721

#_00A6E5: STA.w $0106
#_00A6E8: LDA.w $0EFC
#_00A6EB: STA.w $0107
#_00A6EE: LDA.b #$DE
#_00A6F0: STA.w $0108
#_00A6F3: LDA.w $0EFC
#_00A6F6: STA.w $0109

#_00A6F9: REP #$20
#_00A6FB: LDA.w #$3C23 ; $7846 VRAM
#_00A6FE: CLC
#_00A6FF: ADC.w $0E00
#_00A702: STA.w $0102
#_00A705: LDA.w #$0002
#_00A708: STA.w $0104
#_00A70B: LDA.w #$0001
#_00A70E: STA.w $0100

#_00A711: SEP #$20
#_00A713: JSL AddSelfAsVector

#_00A717: INC.w $0E00
#_00A71A: LDA.w $0E00
#_00A71D: CMP.b #$04
#_00A71F: BCC .branch00A6D5

.branch00A721
#_00A721: JSR routine00A9E2
#_00A724: STZ.w $0E00

.branch00A727
#_00A727: LDX.w $0E00
#_00A72A: LDA.l TheWordMOON,X
#_00A72E: STA.w $0106
#_00A731: LDA.w $0EFC
#_00A734: STA.w $0107
#_00A737: LDA.b #$DE
#_00A739: STA.w $0108
#_00A73C: LDA.w $0EFC
#_00A73F: STA.w $0109

#_00A742: REP #$20
#_00A744: LDA.w #$3C44 ; $7888 VRAM
#_00A747: CLC
#_00A748: ADC.w $0E00
#_00A74B: STA.w $0102
#_00A74E: LDA.w #$0002
#_00A751: STA.w $0104
#_00A754: LDA.w #$0001
#_00A757: STA.w $0100

#_00A75A: SEP #$20
#_00A75C: JSL AddSelfAsVector
#_00A760: INC.w $0E00
#_00A763: LDA.w $0E00
#_00A766: CMP.b #$04
#_00A768: BCC .branch00A727

#_00A76A: JSR routine00A9E2
#_00A76D: LDA.b #$01
#_00A76F: STA.w $071A
#_00A772: PLP
#_00A773: RTL

;===================================================================================================

routine00A774:
#_00A774: LDA.w $0400
#_00A777: BPL .EXIT_00A795

#_00A779: JSL routine00C76F
#_00A77D: LDA.b #$05
#_00A77F: JSL routine00C752
#_00A783: JSL UpdateDialogBox

#_00A787: SEP #$20
#_00A789: LDA.w $0400
#_00A78C: AND.b #$7F
#_00A78E: STA.w $0400
#_00A791: JSL routine00AD90

.EXIT_00A795
#_00A795: RTS

;===================================================================================================

routine00A796:
#_00A796: LDA.w $0588
#_00A799: BEQ .exit

#_00A79B: JSL routine00C76F
#_00A79F: LDA.b #$06
#_00A7A1: JSL routine00C752
#_00A7A5: JSL routine00C7A1

#_00A7A9: SEP #$30
#_00A7AB: STZ.w $0588
#_00A7AE: STZ.w $0589

.exit
#_00A7B1: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00A7B2:
#_00A7B2: REP #$20
#_00A7B4: LDA.w $1030,X
#_00A7B7: CMP.w $102E,X
#_00A7BA: BEQ .exit
#_00A7BC: BCC .exit

#_00A7BE: LDA.w #$0002
#_00A7C1: CLC
#_00A7C2: ADC.w $102E,X
#_00A7C5: STA.w $102E,X
#_00A7C8: LDA.w $1030,X
#_00A7CB: CMP.w $102E,X
#_00A7CE: BCS .exit

#_00A7D0: LDA.w $1030,X
#_00A7D3: STA.w $102E,X

.exit
#_00A7D6: RTS

;===================================================================================================

UpdateDirTilemap:
#_00A7D7: PHP
#_00A7D8: JSL routine00A9AD

#_00A7DC: SEP #$30
#_00A7DE: LDA.b #$20
#_00A7E0: STA.w $0EFC
#_00A7E3: STZ.w $0E00
#_00A7E6: STZ.w $0E01

.branch00A7E9
#_00A7E9: LDA.w $040D
#_00A7EC: ASL A
#_00A7ED: STA.w $00E0
#_00A7F0: ASL A
#_00A7F1: CLC
#_00A7F2: ADC.w $00E0
#_00A7F5: ADC.w $0E00
#_00A7F8: TAX ; X=A*6
#_00A7F9: LDA.l CardinalDirections,X
#_00A7FD: BEQ .branch00A83B

#_00A7FF: STA.w $0106
#_00A802: LDA.w $0EFC
#_00A805: STA.w $0107
#_00A808: LDA.b #$DE
#_00A80A: STA.w $0108
#_00A80D: LDA.w $0EFC
#_00A810: STA.w $0109

#_00A813: REP #$20
#_00A815: LDA.w #$3CA3 ; $7946 VRAM
#_00A818: CLC
#_00A819: ADC.w $0E00
#_00A81C: STA.w $0102
#_00A81F: LDA.w #$0002
#_00A822: STA.w $0104
#_00A825: LDA.w #$0001
#_00A828: STA.w $0100

#_00A82B: SEP #$20
#_00A82D: JSL AddSelfAsVector
#_00A831: INC.w $0E00
#_00A834: LDA.w $0E00
#_00A837: CMP.b #$05
#_00A839: BCC .branch00A7E9

.branch00A83B
#_00A83B: JSR routine00A9E2
#_00A83E: PLP
#_00A83F: RTL

;===================================================================================================

routine00A840:
#_00A840: PHP
#_00A841: JSL routine00A9AD
#_00A845: JSL GetCurrentRoomFloorAndDungeonID

#_00A849: SEP #$30
#_00A84B: LDA.b #$20
#_00A84D: STA.w $0EFC
#_00A850: STZ.w $0E00
#_00A853: STZ.w $0E01

.branch00A856
#_00A856: LDA.w $0713
#_00A859: ASL A
#_00A85A: BCC .branch00A85F

#_00A85C: CLC
#_00A85D: ADC.b #$3C

.branch00A85F
#_00A85F: CLC
#_00A860: ADC.w $0713
#_00A863: AND.b #$7F
#_00A865: CLC
#_00A866: ADC.w $0E00
#_00A869: TAX
#_00A86A: LDA.l FloorTextTiles,X
#_00A86E: CMP.b #$FF
#_00A870: BEQ .branch00A8AE

#_00A872: STA.w $0106
#_00A875: LDA.w $0EFC
#_00A878: STA.w $0107
#_00A87B: LDA.b #$DE
#_00A87D: STA.w $0108
#_00A880: LDA.w $0EFC
#_00A883: STA.w $0109

#_00A886: REP #$20
#_00A888: LDA.w #$3C83 ; $7906 VRAM
#_00A88B: CLC
#_00A88C: ADC.w $0E00
#_00A88F: STA.w $0102
#_00A892: LDA.w #$0002
#_00A895: STA.w $0104
#_00A898: LDA.w #$0001
#_00A89B: STA.w $0100

#_00A89E: SEP #$20
#_00A8A0: JSL AddSelfAsVector
#_00A8A4: INC.w $0E00
#_00A8A7: LDA.w $0E00
#_00A8AA: CMP.b #$03
#_00A8AC: BCC .branch00A856

.branch00A8AE
#_00A8AE: JSR routine00A9E2
#_00A8B1: PLP
#_00A8B2: RTL

;===================================================================================================

GetCurrentRoomFloorAndDungeonID:
#_00A8B3: PHP
#_00A8B4: SEP #$30

; x = x coord
; y = y coord
; e = event stuff on turn

; xxxxxxxx -> 0xxxxxx0
#_00A8B6: LDA.w $070C
#_00A8B9: AND.b #$FC
#_00A8BB: LSR A
#_00A8BC: STA.w $00E0

; yyyyyyyy -> yy000000
; eeeeeeee -> eeeeeeyy
#_00A8BF: LDA.w $070D
#_00A8C2: AND.b #$FC
#_00A8C4: ASL A
#_00A8C5: ASL A
#_00A8C6: ASL A
#_00A8C7: ROL.w $00E1
#_00A8CA: ASL A
#_00A8CB: ROL.w $00E1

;   yy000000
; + 0xxxxxx0
#_00A8CE: CLC
#_00A8CF: ADC.w $00E0
#_00A8D2: ADC.b #DungeonIDByBlock>>0
#_00A8D4: STA.w $00E0

; eeeeeeyy -> 110000yy
#_00A8D7: LDA.w $00E1
#_00A8DA: AND.b #$03
#_00A8DC: ADC.b #DungeonIDByBlock>>8
#_00A8DE: STA.w $00E1

; Bank 04
#_00A8E1: LDA.b #DungeonIDByBlock>>16
#_00A8E3: STA.w $00E2

#_00A8E6: LDY.b #$00

#_00A8E8: LDA.b [$E0],Y
#_00A8EA: STA.w $045A

#_00A8ED: INY

#_00A8EE: LDA.b [$E0],Y
#_00A8F0: STA.w $0713

#_00A8F3: PLP
#_00A8F4: RTL

;===================================================================================================

routine00A8F5:
#_00A8F5: SEP #$30

#_00A8F7: STA.w $0E00

#_00A8FA: LDA.b #$2F
#_00A8FC: JSL CheckGameProgressFlag
#_00A900: BCS .branch00A90B

#_00A902: LDA.w $0E00
#_00A905: CLC
#_00A906: ADC.b #$0F
#_00A908: STA.w $0E00

.branch00A90B
#_00A90B: JSL routine00A9AD

#_00A90F: LDA.b #$20
#_00A911: STA.w $0EFC

#_00A914: STZ.w $0E02
#_00A917: STZ.w $0E03

.branch00A91A
#_00A91A: LDA.w $0E00
#_00A91D: ASL A
#_00A91E: ASL A
#_00A91F: ASL A
#_00A920: CLC
#_00A921: ADC.w $0E02
#_00A924: TAX

#_00A925: LDA.l DoorLabels,X
#_00A929: CMP.b #$FF
#_00A92B: BEQ .branch00A969

#_00A92D: STA.w $0106
#_00A930: LDA.w $0EFC
#_00A933: STA.w $0107
#_00A936: LDA.b #$DE
#_00A938: STA.w $0108
#_00A93B: LDA.w $0EFC
#_00A93E: STA.w $0109

#_00A941: REP #$20
#_00A943: LDA.w #$3CCC ; $7998 VRAM
#_00A946: CLC
#_00A947: ADC.w $0E02
#_00A94A: STA.w $0102
#_00A94D: LDA.w #$0002
#_00A950: STA.w $0104
#_00A953: LDA.w #$0001
#_00A956: STA.w $0100

#_00A959: SEP #$20
#_00A95B: JSL AddSelfAsVector
#_00A95F: INC.w $0E02
#_00A962: LDA.w $0E02
#_00A965: CMP.b #$08
#_00A967: BCC .branch00A91A

.branch00A969
#_00A969: REP #$20
#_00A96B: LDA.w $0EF1
#_00A96E: STA.w $0EF3
#_00A971: JSR routine00A9E2
#_00A974: LDA.w $0EF1
#_00A977: ORA.w #$8000
#_00A97A: STA.w $0EF1
#_00A97D: RTL

;===================================================================================================

UpdateUWLabel:
#_00A97E: PHP
#_00A97F: REP #$30

#_00A981: LDA.w #$0000
#_00A984: TAY

.clear_next
#_00A985: STA.w $0106,Y

#_00A988: INY
#_00A989: INY
#_00A98A: CPY.w #$0012
#_00A98D: BCC .clear_next

#_00A98F: LDA.w #$3CCC ; $7998 VRAM
#_00A992: STA.w $0102

#_00A995: LDA.w #$0009
#_00A998: STA.w $0104

#_00A99B: LDA.w #$0001
#_00A99E: STA.w $0100

#_00A9A1: JSL AddSelfAsVector

#_00A9A5: LDA.w $0EF3
#_00A9A8: STA.w $0EF1

#_00A9AB: PLP
#_00A9AC: RTL

;===================================================================================================

routine00A9AD:
#_00A9AD: PHP
#_00A9AE: REP #$20

#_00A9B0: BIT.w $0EF5
#_00A9B3: BPL .exit

#_00A9B5: LDA.w $0100
#_00A9B8: BEQ .no_vector

#_00A9BA: JSL AddSelfAsVector

.no_vector
#_00A9BE: LDA.w #$0000
#_00A9C1: STA.w $0106

#_00A9C4: LDA.w $0EF1
#_00A9C7: STA.w $0102

#_00A9CA: LDA.w #$0001
#_00A9CD: STA.w $0104

#_00A9D0: LDA.w #$0001
#_00A9D3: STA.w $0100

#_00A9D6: LDA.w #$0001
#_00A9D9: STA.w $0EF5

#_00A9DC: JSL AddSelfAsVector

.exit
#_00A9E0: PLP
#_00A9E1: RTL

;===================================================================================================

routine00A9E2:
#_00A9E2: PHP
#_00A9E3: REP #$20

#_00A9E5: LDA.w $0102
#_00A9E8: INC A
#_00A9E9: STA.w $0EF1

#_00A9EC: LDA.w #$0010
#_00A9EF: STA.w $0EF5

#_00A9F2: LDA.w #$0000
#_00A9F5: STA.w $0108

#_00A9F8: LDA.w #$0001
#_00A9FB: STA.w $0100

#_00A9FE: JSL AddSelfAsVector

#_00AA02: PLP
#_00AA03: RTS

;===================================================================================================

GetHeroName:
#_00AA04: PHP

#_00AA05: STX.w $0EF7
#_00AA08: STY.w $0EF9

#_00AA0B: AND.w #$7FFF
#_00AA0E: ASL A
#_00AA0F: ASL A
#_00AA10: ASL A
#_00AA11: TAX

#_00AA12: SEP #$30

#_00AA14: LDY.b #$00

.next_character
#_00AA16: LDA.w $0410,X
#_00AA19: CMP.b #$FF
#_00AA1B: BNE .write_character

.add_spaces
#_00AA1D: LDX.w $0EF9

#_00AA20: LDA.b #$CF
#_00AA22: STA.w $0106,X

#_00AA25: LDA.w $0EFC
#_00AA28: STA.w $0107,X

#_00AA2B: LDX.w $0EF7

#_00AA2E: STA.w $0107,X

#_00AA31: LDA.b #$CF
#_00AA33: STA.w $0106,X

#_00AA36: INC.w $0EF7
#_00AA39: INC.w $0EF7

#_00AA3C: INC.w $0EF9
#_00AA3F: INC.w $0EF9

#_00AA42: INY
#_00AA43: CPY.b #$08
#_00AA45: BCC .add_spaces

#_00AA47: BRA .exit

.write_character
#_00AA49: JSR WriteTextTo0106

#_00AA4C: INX

#_00AA4D: INY
#_00AA4E: CPY.b #$08
#_00AA50: BCC .next_character

.exit
#_00AA52: PLP
#_00AA53: RTL

;===================================================================================================

GetDemonName:
#_00AA54: PHP

#_00AA55: STX.w $0EF7
#_00AA58: STY.w $0EF9

#_00AA5B: LDX.w #DemonNamePointers
#_00AA5E: JSR GetEntityName

#_00AA61: PLP
#_00AA62: RTL

;===================================================================================================

GetClassName:
#_00AA63: PHP

#_00AA64: STX.w $0EF7
#_00AA67: STY.w $0EF9

#_00AA6A: LDX.w #ClassNamePointers
#_00AA6D: JSR GetEntityName

#_00AA70: PLP
#_00AA71: RTL

;===================================================================================================

GetSkillName:
#_00AA72: PHP

#_00AA73: STX.w $0EF7
#_00AA76: STY.w $0EF9

#_00AA79: LDX.w #SkillNamePointers
#_00AA7C: JSR GetEntityName

#_00AA7F: PLP
#_00AA80: RTL

;===================================================================================================

GetItemName:
#_00AA81: PHP

#_00AA82: STX.w $0EF7
#_00AA85: STY.w $0EF9

#_00AA88: LDX.w #ItemNamePointers
#_00AA8B: JSR GetEntityName

#_00AA8E: PLP
#_00AA8F: RTL

;===================================================================================================

GetEntityName:
#_00AA90: PHP

#_00AA91: ASL A
#_00AA92: TAY

#_00AA93: STX.w $0090

#_00AA96: LDA.w #$0009
#_00AA99: STA.w $0092

#_00AA9C: LDA.b [$90],Y
#_00AA9E: STA.w $0090

#_00AAA1: SEP #$30

#_00AAA3: LDY.b #$00

.next_letter
#_00AAA5: LDA.b [$90],Y
#_00AAA7: CMP.b #$FF
#_00AAA9: BNE .not_the_end

.pad_with_spaces
#_00AAAB: LDX.w $0EF9

#_00AAAE: LDA.b #$CF
#_00AAB0: STA.w $0106,X

#_00AAB3: LDA.w $0EFC
#_00AAB6: STA.w $0107,X

#_00AAB9: LDX.w $0EF7
#_00AABC: STA.w $0107,X

#_00AABF: LDA.b #$CF
#_00AAC1: STA.w $0106,X

#_00AAC4: INC.w $0EF7
#_00AAC7: INC.w $0EF7

#_00AACA: INC.w $0EF9
#_00AACD: INC.w $0EF9

#_00AAD0: INY
#_00AAD1: CPY.b #$08
#_00AAD3: BCC .pad_with_spaces

#_00AAD5: BRA .exit

.not_the_end
#_00AAD7: JSR WriteTextTo0106

#_00AADA: INY
#_00AADB: CPY.b #$08
#_00AADD: BCC .next_letter

.exit
#_00AADF: PLP
#_00AAE0: RTS

;===================================================================================================

WriteTextTo0106:
#_00AAE1: PHX
#_00AAE2: PHY

#_00AAE3: CMP.b #$CF
#_00AAE5: BEQ .is_space

#_00AAE7: CMP.b #$9C
#_00AAE9: BCS .has_dakuten

.is_space
#_00AAEB: LDX.w $0EF9

#_00AAEE: STA.w $0106,X

#_00AAF1: LDA.w $0EFC
#_00AAF4: STA.w $0107,X

#_00AAF7: LDX.w $0EF7
#_00AAFA: STA.w $0107,X

#_00AAFD: LDA.b #$CF
#_00AAFF: STA.w $0106,X

#_00AB02: BRA .done_writing

;---------------------------------------------------------------------------------------------------

.has_dakuten
#_00AB04: CMP.b #$CE
#_00AB06: BNE .not_vu

#_00AB08: LDA.b #$5F
#_00AB0A: LDY.b #$9E ; dakuten
#_00AB0C: BRA .write_character

.not_vu
#_00AB0E: SEC
#_00AB0F: SBC.b #$9C
#_00AB11: TAX

#_00AB12: LDY.b #$9E ; dakuten

#_00AB14: LDA.l DakutenBaseLetters,X
#_00AB18: BPL .write_character

#_00AB1A: AND.b #$7F
#_00AB1C: INY ; handakuten

.write_character
#_00AB1D: LDX.w $0EF9

#_00AB20: STA.w $0106,X

#_00AB23: LDA.w $0EFC
#_00AB26: STA.w $0107,X

#_00AB29: LDX.w $0EF7
#_00AB2C: STA.w $0107,X

#_00AB2F: TYA
#_00AB30: STA.w $0106,X

.done_writing
#_00AB33: INC.w $0EF7
#_00AB36: INC.w $0EF7

#_00AB39: INC.w $0EF9
#_00AB3C: INC.w $0EF9

#_00AB3F: PLY
#_00AB40: PLX

#_00AB41: RTS

;===================================================================================================

; and Handakuten
; bit7 => use handakuten
DakutenBaseLetters:
#_00AB42: db $2A, $2B, $2C, $2D, $2E, $2F, $30, $31
#_00AB4A: db $32, $33, $34, $35, $36, $37, $38, $3E
#_00AB52: db $3F, $40, $41, $42, $BE, $BF, $C0, $C1
#_00AB5A: db $C2, $62, $63, $64, $65, $66, $67, $68
#_00AB62: db $69, $6A, $6B, $6C, $6D, $6E, $6F, $70
#_00AB6A: db $76, $77, $78, $79, $7A, $F6, $F7, $F8
#_00AB72: db $F9, $FA

;===================================================================================================
; TODO something with death or game over?
routine00AB74:
#_00AB74: PHP
#_00AB75: REP #$30
#_00AB77: STZ.w $0760
#_00AB7A: STZ.w $0720
#_00AB7D: LDY.w #$0000
#_00AB80: LDA.w #$FFFF

.branch00AB83
#_00AB83: STA.w $0764,Y
#_00AB86: INY
#_00AB87: INY
#_00AB88: CPY.w #$000C
#_00AB8B: BCC .branch00AB83

.branch00AB8D
#_00AB8D: LDY.w $0720
#_00AB90: LDX.w $0700,Y
#_00AB93: BMI .branch00ABF5

#_00AB95: LDA.w $1002,X
#_00AB98: AND.w #$E000
#_00AB9B: BEQ .branch00ABE1

#_00AB9D: CPX.w #$0180
#_00ABA0: BCS .branch00ABCD

#_00ABA2: LDY.w $0760
#_00ABA5: TXA
#_00ABA6: STA.w $0764,Y
#_00ABA9: INC.w $0760
#_00ABAC: INC.w $0760

.branch00ABAF
#_00ABAF: LDY.w $0720

.branch00ABB2
#_00ABB2: INY
#_00ABB3: INY
#_00ABB4: LDA.w $0700,Y
#_00ABB7: CPY.w #$000C
#_00ABBA: BCC .branch00ABBF

#_00ABBC: LDA.w #$FFFF

.branch00ABBF
#_00ABBF: DEY
#_00ABC0: DEY
#_00ABC1: STA.w $0700,Y
#_00ABC4: INY
#_00ABC5: INY
#_00ABC6: CPY.w #$000C
#_00ABC9: BCC .branch00ABB2

#_00ABCB: BRA .branch00ABE7

.branch00ABCD
#_00ABCD: LDA.w $1000,X
#_00ABD0: AND.w #$BFFF
#_00ABD3: STA.w $1000,X
#_00ABD6: LDA.w $1002,X
#_00ABD9: AND.w #$E000
#_00ABDC: STA.w $1002,X
#_00ABDF: BRA .branch00ABAF

.branch00ABE1
#_00ABE1: INC.w $0720
#_00ABE4: INC.w $0720

.branch00ABE7
#_00ABE7: LDY.w $0720
#_00ABEA: CPY.w #$000C
#_00ABED: BCC .branch00AB8D

#_00ABEF: DEC.w $0720
#_00ABF2: DEC.w $0720

.branch00ABF5
#_00ABF5: LDY.w #$0000
#_00ABF8: LDX.w $0720

.branch00ABFB
#_00ABFB: LDA.w $0764,Y
#_00ABFE: BMI .branch00AC0C

#_00AC00: STA.w $0700,X
#_00AC03: INX
#_00AC04: INX
#_00AC05: INY
#_00AC06: INY
#_00AC07: CPY.w #$000C
#_00AC0A: BCC .branch00ABFB

.branch00AC0C
#_00AC0C: JSL routine00A17E
#_00AC10: PLP
#_00AC11: RTL

;===================================================================================================

; TODO handles stuff with dungeons 0FD0/0FD2
routine00AC12:
#_00AC12: PHP

#_00AC13: REP #$30

#_00AC15: LDA.w #$803C
#_00AC18: STA.w $0100

#_00AC1B: LDA.w #$3A19 ; $7432 VRAM
#_00AC1E: STA.w $0102

#_00AC21: LDA.w #$000A
#_00AC24: STA.w $0104

#_00AC27: SEP #$20

#_00AC29: LDA.b #$07
#_00AC2B: STA.w $0082

#_00AC2E: LDA.b #$07
#_00AC30: STA.w $0085

#_00AC33: LDA.w $040D
#_00AC36: ASL A
#_00AC37: TAX

#_00AC38: REP #$20

#_00AC3A: LDA.l pointers079265,X
#_00AC3E: STA.w $0083
#_00AC41: STZ.w $0FC4

#_00AC44: LDA.w #$F169
#_00AC47: STA.w $0080

;---------------------------------------------------------------------------------------------------

.branch00AC4A
#_00AC4A: SEP #$30
#_00AC4C: LDA.w $0FC4
#_00AC4F: ASL A
#_00AC50: TAY
#_00AC51: LDA.b [$83],Y
#_00AC53: CLC
#_00AC54: ADC.w $070C
#_00AC57: BMI .branch00AC6D

#_00AC59: CMP.b #$80
#_00AC5B: BCS .branch00AC6D

#_00AC5D: STA.w $0FD0
#_00AC60: INY
#_00AC61: LDA.b [$83],Y
#_00AC63: CLC
#_00AC64: ADC.w $070D
#_00AC67: BMI .branch00AC6D

#_00AC69: CMP.b #$40
#_00AC6B: BCC .branch00AC73

.branch00AC6D
#_00AC6D: JSR routine00AD44
#_00AC70: JMP .branch00AC7E

.branch00AC73
#_00AC73: STA.w $0FD2
#_00AC76: JSR routine00AC91
#_00AC79: BCS .branch00AC7E

#_00AC7B: JSR routine00ACE3

.branch00AC7E
#_00AC7E: REP #$20
#_00AC80: INC.w $0FC4
#_00AC83: LDA.w $0FC4
#_00AC86: CMP.w #$000F
#_00AC89: BCC .branch00AC4A

#_00AC8B: JSL AddSelfAsVector
#_00AC8F: PLP
#_00AC90: RTL

;===================================================================================================

; TODO sets up some address
routine00AC91:
#_00AC91: LDA.w $0FD0
#_00AC94: AND.b #$FC
#_00AC96: LSR A
#_00AC97: STA.w $0086
#_00AC9A: LDA.w $0FD2
#_00AC9D: AND.b #$FC
#_00AC9F: ASL A
#_00ACA0: ASL A
#_00ACA1: ASL A
#_00ACA2: ROL.w $0087
#_00ACA5: ASL A
#_00ACA6: ROL.w $0087
#_00ACA9: CLC
#_00ACAA: ADC.w $0086
#_00ACAD: ADC.b #$00
#_00ACAF: STA.w $0086
#_00ACB2: LDA.w $0087
#_00ACB5: AND.b #$03
#_00ACB7: ADC.b #$C0
#_00ACB9: STA.w $0087
#_00ACBC: LDA.b #$04
#_00ACBE: STA.w $0088
#_00ACC1: LDA.w $045A
#_00ACC4: AND.b #$3F
#_00ACC6: STA.w $0089
#_00ACC9: LDY.b #$00
#_00ACCB: LDA.b [$86],Y
#_00ACCD: AND.b #$3F
#_00ACCF: CMP.w $0089
#_00ACD2: BNE .branch00ACDE

#_00ACD4: INY
#_00ACD5: LDA.b [$86],Y
#_00ACD7: CMP.w $0713
#_00ACDA: BNE .branch00ACDE

#_00ACDC: CLC
#_00ACDD: RTS

.branch00ACDE
#_00ACDE: JSR routine00AD44
#_00ACE1: SEC
#_00ACE2: RTS

;===================================================================================================

routine00ACE3:
#_00ACE3: LDA.w $0FD2
#_00ACE6: LDX.w $0FD0
#_00ACE9: JSR ReadPage_A_Bank04
#_00ACEC: AND.b #$F0
#_00ACEE: BEQ .branch00ACFE

#_00ACF0: BMI .branch00ACFA

#_00ACF2: CMP.b #$30
#_00ACF4: BNE .branch00ACFE

#_00ACF6: JSR routine00AD44
#_00ACF9: RTS

.branch00ACFA
#_00ACFA: JSR routine00AD5E
#_00ACFD: RTS

.branch00ACFE
#_00ACFE: CLC
#_00ACFF: TXA
#_00AD00: BPL .branch00AD03

#_00AD02: SEC

.branch00AD03
#_00AD03: LDY.w $040D
#_00AD06: BEQ .branch00AD15

.branch00AD08
#_00AD08: ROL A
#_00AD09: CLC
#_00AD0A: BPL .branch00AD0D

#_00AD0C: SEC

.branch00AD0D
#_00AD0D: ROL A
#_00AD0E: CLC
#_00AD0F: BPL .branch00AD12

#_00AD11: SEC

.branch00AD12
#_00AD12: DEY
#_00AD13: BNE .branch00AD08

.branch00AD15
#_00AD15: REP #$30
#_00AD17: AND.w #$00FF
#_00AD1A: ASL A
#_00AD1B: ASL A
#_00AD1C: ASL A
#_00AD1D: TAY
#_00AD1E: LDX.w $0FC4
#_00AD21: LDA.l data00AD81,X
#_00AD25: AND.w #$00FF
#_00AD28: TAX
#_00AD29: LDA.b [$80],Y
#_00AD2B: STA.w $0106,X
#_00AD2E: INY
#_00AD2F: INY
#_00AD30: LDA.b [$80],Y
#_00AD32: STA.w $011A,X
#_00AD35: INY
#_00AD36: INY
#_00AD37: LDA.b [$80],Y
#_00AD39: STA.w $0108,X
#_00AD3C: INY
#_00AD3D: INY
#_00AD3E: LDA.b [$80],Y
#_00AD40: STA.w $011C,X
#_00AD43: RTS

;===================================================================================================

routine00AD44:
#_00AD44: LDX.w $0FC4
#_00AD47: LDA.l data00AD81,X
#_00AD4B: TAX

#_00AD4C: REP #$20
#_00AD4E: LDA.w #$08E7
#_00AD51: STA.w $0106,X
#_00AD54: STA.w $011A,X
#_00AD57: STA.w $0108,X
#_00AD5A: STA.w $011C,X
#_00AD5D: RTS

;===================================================================================================

routine00AD5E:
#_00AD5E: LDX.w $0FC4
#_00AD61: LDA.l data00AD81,X
#_00AD65: TAX

#_00AD66: REP #$20

#_00AD68: LDA.w #$0CE4
#_00AD6B: STA.w $0106,X

#_00AD6E: LDA.w #$4CE4
#_00AD71: STA.w $011A,X

#_00AD74: LDA.w #$8CE4
#_00AD77: STA.w $0108,X

#_00AD7A: LDA.w #$CCE4
#_00AD7D: STA.w $011C,X

#_00AD80: RTS

data00AD81:
#_00AD81: db $00,$04,$08,$0C,$10,$28,$2C,$30
#_00AD89: db $34,$38,$50,$54,$58,$5C,$60

;===================================================================================================

routine00AD90:
#_00AD90: PHP
#_00AD91: REP #$30
#_00AD93: JSR Clear0106TextBuffer
#_00AD96: LDA.w #$803C
#_00AD99: STA.w $0100
#_00AD9C: LDA.w #$3A19 ; 7432 VRAM
#_00AD9F: STA.w $0102
#_00ADA2: LDA.w #$000A
#_00ADA5: STA.w $0104
#_00ADA8: JSL AddSelfAsVector
#_00ADAC: PLP
#_00ADAD: RTL

;===================================================================================================

#branch00ADAE:
#_00ADAE: LDA.w #$FFFF
#_00ADB1: STA.l $7EFFFE
#_00ADB5: JMP ResetMemory

routine00ADB8:
#_00ADB8: REP #$30
#_00ADBA: LDA.l $7EFFFE
#_00ADBE: JSL routine0FC929
#_00ADC2: JSL routine0F8819

.branch00ADC6
#_00ADC6: JSL AddSelfAsVector

#_00ADCA: REP #$20
#_00ADCC: LDA.w $0400
#_00ADCF: AND.w #$8000
#_00ADD2: BNE branch00ADAE

#_00ADD4: SEP #$30
#_00ADD6: LDA.b #$FE
#_00ADD8: JSL CheckGameProgressFlag
#_00ADDC: BCS .branch00ADFB

#_00ADDE: REP #$30
#_00ADE0: LDA.w $0F31
#_00ADE3: AND.w #$3000
#_00ADE6: BEQ .branch00AE3E

#_00ADE8: AND.w #$1000
#_00ADEB: BEQ .branch00AE0A

#_00ADED: LDA.w $045E
#_00ADF0: EOR.w #$FFFF
#_00ADF3: STA.w $045E
#_00ADF6: BIT.w $045E
#_00ADF9: BMI .branch00AE43

.branch00ADFB
#_00ADFB: SEP #$20
#_00ADFD: LDA.w $0F0D
#_00AE00: AND.b #$F7
#_00AE02: STA.w $0F0D
#_00AE05: STA.w $0F0E
#_00AE08: BRA .branch00ADC6

.branch00AE0A
#_00AE0A: BIT.w $045E
#_00AE0D: BMI .branch00AE2C

#_00AE0F: LDA.w $0460
#_00AE12: INC A
#_00AE13: AND.w #$0007
#_00AE16: STA.w $0460
#_00AE19: CMP.w #$0004
#_00AE1C: BNE .branch00ADC6

#_00AE1E: LDA.w #$0001
#_00AE21: STA.w $0462
#_00AE24: LDA.w #$0010
#_00AE27: STA.w $0464
#_00AE2A: BRA .branch00ADC6

.branch00AE2C
#_00AE2C: LDA.w $0460
#_00AE2F: CMP.w #$0004
#_00AE32: BEQ .branch00AE43

#_00AE34: LDA.w $0464
#_00AE37: INC A
#_00AE38: AND.w #$000F
#_00AE3B: STA.w $0464

.branch00AE3E
#_00AE3E: BIT.w $045E
#_00AE41: BPL .branch00ADC6

.branch00AE43
#_00AE43: JSR routine00AE49
#_00AE46: JMP .branch00ADC6

;===================================================================================================

routine00AE49:
#_00AE49: LDA.w $0460
#_00AE4C: ASL A
#_00AE4D: TAX

#_00AE4E: LDA.l .vectors,X

#_00AE52: STA.w $0468
#_00AE55: JMP ($0468)

.vectors
#_00AE58: dw routine00AE68
#_00AE5A: dw routine00AEB5
#_00AE5C: dw routine00AF19
#_00AE5E: dw routine00AF63
#_00AE60: dw routine00AFBB
#_00AE62: dw routine00B02F
#_00AE64: dw routine00B079
#_00AE66: dw routine00B0C3

;===================================================================================================

routine00AE68:
#_00AE68: DEC.w $0462
#_00AE6B: DEC.w $0462
#_00AE6E: BPL .exit

#_00AE70: LDY.w $0466
#_00AE73: LDX.w #$0000

.branch00AE76
#_00AE76: LDA.w data00B11B,Y
#_00AE79: STA.l $7E2801,X
#_00AE7D: INY
#_00AE7E: INY
#_00AE7F: CPY.w #$0040
#_00AE82: BCC .branch00AE87

#_00AE84: LDY.w #$0000

.branch00AE87
#_00AE87: INX
#_00AE88: INX
#_00AE89: CPX.w #$0100
#_00AE8C: BCC .branch00AE76

#_00AE8E: LDA.w #$0000
#_00AE91: STA.l $7E2801,X
#_00AE95: LDA.w $0464
#_00AE98: STA.w $0462
#_00AE9B: LDA.w $0466
#_00AE9E: INC A
#_00AE9F: INC A
#_00AEA0: AND.w #$003F
#_00AEA3: STA.w $0466

#_00AEA6: SEP #$30
#_00AEA8: LDA.b #$FF
#_00AEAA: STA.l $7E2800
#_00AEAE: LDA.b #$00
#_00AEB0: JSL PrepHDMAtypeFromA

.exit
#_00AEB4: RTS

;===================================================================================================

routine00AEB5:
#_00AEB5: DEC.w $0462
#_00AEB8: BPL .exit

#_00AEBA: LDY.w $0466
#_00AEBD: LDX.w #$0000

.branch00AEC0
#_00AEC0: LDA.w data00B11B,Y
#_00AEC3: STA.l $7E2804,X
#_00AEC7: INY
#_00AEC8: INY
#_00AEC9: CPY.w #$0040
#_00AECC: BCC .branch00AED1

#_00AECE: LDY.w #$0000

.branch00AED1
#_00AED1: INX
#_00AED2: INX
#_00AED3: CPX.w #$0100
#_00AED6: BCC .branch00AEC0

#_00AED8: LDA.w #$0000
#_00AEDB: STA.l $7E2804,X
#_00AEDF: LDA.w #$0001
#_00AEE2: STA.w $0462
#_00AEE5: LDA.w $0466
#_00AEE8: INC A
#_00AEE9: INC A
#_00AEEA: AND.w #$003F
#_00AEED: STA.w $0466

#_00AEF0: SEP #$30
#_00AEF2: LDA.w $0464
#_00AEF5: ASL A
#_00AEF6: ASL A
#_00AEF7: SEC
#_00AEF8: SBC.b #$60
#_00AEFA: EOR.b #$FF
#_00AEFC: STA.l $7E2800
#_00AF00: LDA.b #$00
#_00AF02: STA.l $7E2801
#_00AF06: LDA.b #$00
#_00AF08: STA.l $7E2802
#_00AF0C: LDA.b #$DF
#_00AF0E: STA.l $7E2803
#_00AF12: LDA.b #$00
#_00AF14: JSL PrepHDMAtypeFromA

.exit
#_00AF18: RTS

;===================================================================================================

routine00AF19:
#_00AF19: DEC.w $0462
#_00AF1C: BPL .exit

#_00AF1E: LDY.w $0466
#_00AF21: LDX.w #$0000

.branch00AF24
#_00AF24: LDA.w data00B15B,Y
#_00AF27: STA.l $7E2801,X
#_00AF2B: INY
#_00AF2C: INY
#_00AF2D: CPY.w #$0040
#_00AF30: BCC .branch00AF35

#_00AF32: LDY.w #$0000

.branch00AF35
#_00AF35: INX
#_00AF36: INX
#_00AF37: CPX.w #$0100
#_00AF3A: BCC .branch00AF24

#_00AF3C: LDA.w #$0000
#_00AF3F: STA.l $7E2801,X
#_00AF43: LDA.w $0464
#_00AF46: STA.w $0462
#_00AF49: LDA.w $0466
#_00AF4C: INC A
#_00AF4D: INC A
#_00AF4E: AND.w #$003F
#_00AF51: STA.w $0466

#_00AF54: SEP #$30
#_00AF56: LDA.b #$FF
#_00AF58: STA.l $7E2800
#_00AF5C: LDA.b #$00
#_00AF5E: JSL PrepHDMAtypeFromA

.exit
#_00AF62: RTS

;===================================================================================================
; TODO HDMA stuff with wavy stuff
;===================================================================================================
routine00AF63:
#_00AF63: DEC.w $0462
#_00AF66: DEC.w $0462
#_00AF69: BPL .exit

#_00AF6B: LDY.w $0466
#_00AF6E: LDX.w #$0000

.branch00AF71
#_00AF71: LDA.w data00B11B,Y
#_00AF74: SEC
#_00AF75: SBC.w #$0008
#_00AF78: AND.w #$01FF
#_00AF7B: STA.l $7E2801,X
#_00AF7F: INY
#_00AF80: INY
#_00AF81: CPY.w #$0040
#_00AF84: BCC .branch00AF89

#_00AF86: LDY.w #$0000

.branch00AF89
#_00AF89: INX
#_00AF8A: INX
#_00AF8B: CPX.w #$0100
#_00AF8E: BCC .branch00AF71

#_00AF90: LDA.w #$0000
#_00AF93: STA.l $7E27FF,X
#_00AF97: STA.l $7E2801,X
#_00AF9B: LDA.w $0464
#_00AF9E: STA.w $0462
#_00AFA1: LDA.w $0466
#_00AFA4: INC A
#_00AFA5: INC A
#_00AFA6: AND.w #$003F
#_00AFA9: STA.w $0466

#_00AFAC: SEP #$30
#_00AFAE: LDA.b #$FF
#_00AFB0: STA.l $7E2800
#_00AFB4: LDA.b #$01
#_00AFB6: JSL PrepHDMAtypeFromA

.exit
#_00AFBA: RTS

;===================================================================================================

routine00AFBB:
#_00AFBB: DEC.w $0462
#_00AFBE: BNE .branch00B000

#_00AFC0: LDY.w $0466
#_00AFC3: LDX.w #$0000

.branch00ADC5
#_00AFC6: LDA.w data00B21B,Y
#_00AFC9: STA.l $7E2801,X
#_00AFCD: INY
#_00AFCE: INY
#_00AFCF: CPY.w #$0040
#_00AFD2: BCC .branch00AFD7

#_00AFD4: LDY.w #$0000

.branch00AFD7
#_00AFD7: INX
#_00AFD8: INX
#_00AFD9: CPX.w #$0100
#_00AFDC: BCC .branch00ADC5

#_00AFDE: LDA.w #$0000
#_00AFE1: STA.l $7E2801,X
#_00AFE5: LDA.w $0466
#_00AFE8: INC A
#_00AFE9: INC A
#_00AFEA: AND.w #$003F
#_00AFED: STA.w $0466

#_00AFF0: SEP #$30
#_00AFF2: LDA.b #$FF
#_00AFF4: STA.l $7E2800
#_00AFF8: LDA.b #$00
#_00AFFA: JSL PrepHDMAtypeFromA
#_00AFFE: REP #$30

.branch00B000
#_00B000: DEC.w $0464
#_00B003: BNE .branch00B02B

#_00B005: LDA.w #$0010
#_00B008: STA.w $0464
#_00B00B: LDA.w $0462
#_00B00E: EOR.w #$8000
#_00B011: STA.w $0462
#_00B014: BPL .branch00B02B

#_00B016: SEP #$20
#_00B018: LDA.w $0F0D
#_00B01B: AND.b #$F7
#_00B01D: STA.w $0F0D
#_00B020: STA.w $0F0E

#_00B023: REP #$20
#_00B025: LDA.w #$0080
#_00B028: STA.w $0464

.branch00B02B
#_00B02B: INC.w $0462
#_00B02E: RTS

;===================================================================================================

routine00B02F:
#_00B02F: DEC.w $0462
#_00B032: BPL .exit

#_00B034: LDY.w $0466
#_00B037: LDX.w #$0000

.branch00B03A
#_00B03A: LDA.w data00B1DB,Y
#_00B03D: STA.l $7E2801,X
#_00B041: INY
#_00B042: INY
#_00B043: CPY.w #$0040
#_00B046: BCC .branch00B04B

#_00B048: LDY.w #$0000

.branch00B04B
#_00B04B: INX
#_00B04C: INX
#_00B04D: CPX.w #$0100
#_00B050: BCC .branch00B03A

#_00B052: LDA.w #$0000
#_00B055: STA.l $7E2801,X
#_00B059: LDA.w $0464
#_00B05C: STA.w $0462
#_00B05F: LDA.w $0466
#_00B062: INC A
#_00B063: INC A
#_00B064: AND.w #$003F
#_00B067: STA.w $0466

#_00B06A: SEP #$30
#_00B06C: LDA.b #$FF
#_00B06E: STA.l $7E2800
#_00B072: LDA.b #$00
#_00B074: JSL PrepHDMAtypeFromA

.exit
#_00B078: RTS

;===================================================================================================

routine00B079:
#_00B079: DEC.w $0462
#_00B07C: BPL .exit

#_00B07E: LDY.w $0466
#_00B081: LDX.w #$0000

.branch00B084
#_00B084: LDA.w data00B19B,Y
#_00B087: STA.l $7E2801,X
#_00B08B: INY
#_00B08C: INY
#_00B08D: CPY.w #$0040
#_00B090: BCC .branch00B095

#_00B092: LDY.w #$0000

.branch00B095
#_00B095: INX
#_00B096: INX
#_00B097: CPX.w #$0100
#_00B09A: BCC .branch00B084

#_00B09C: LDA.w #$0000
#_00B09F: STA.l $7E2801,X
#_00B0A3: LDA.w $0464
#_00B0A6: STA.w $0462
#_00B0A9: LDA.w $0466
#_00B0AC: INC A
#_00B0AD: INC A
#_00B0AE: AND.w #$003F
#_00B0B1: STA.w $0466

#_00B0B4: SEP #$30
#_00B0B6: LDA.b #$FF
#_00B0B8: STA.l $7E2800
#_00B0BC: LDA.b #$01
#_00B0BE: JSL PrepHDMAtypeFromA

.exit
#_00B0C2: RTS

;===================================================================================================

routine00B0C3:
#_00B0C3: DEC.w $0462
#_00B0C6: DEC.w $0462
#_00B0C9: BPL .exit

#_00B0CB: LDY.w $0466
#_00B0CE: LDX.w #$0000

.branch00B0D1
#_00B0D1: LDA.w data00B1DB,Y
#_00B0D4: SEC
#_00B0D5: SBC.w #$0008
#_00B0D8: AND.w #$01FF
#_00B0DB: STA.l $7E2801,X
#_00B0DF: INY
#_00B0E0: INY
#_00B0E1: CPY.w #$0040
#_00B0E4: BCC .branch00B0E9

#_00B0E6: LDY.w #$0000

.branch00B0E9
#_00B0E9: INX
#_00B0EA: INX
#_00B0EB: CPX.w #$0100
#_00B0EE: BCC .branch00B0D1

#_00B0F0: LDA.w #$0000
#_00B0F3: STA.l $7E27FF,X
#_00B0F7: STA.l $7E2801,X
#_00B0FB: LDA.w $0464
#_00B0FE: STA.w $0462
#_00B101: LDA.w $0466
#_00B104: INC A
#_00B105: INC A
#_00B106: AND.w #$003F
#_00B109: STA.w $0466

#_00B10C: SEP #$30
#_00B10E: LDA.b #$FF
#_00B110: STA.l $7E2800
#_00B114: LDA.b #$01
#_00B116: JSL PrepHDMAtypeFromA

.exit
#_00B11A: RTS

;===================================================================================================

; TODO hdma tables? perhaps indirect stuff?
data00B11B:
#_00B11B: dw $0000,$01FF,$01FE,$01FE
#_00B123: dw $01FD,$01FD,$01FD,$01FC
#_00B12B: dw $01FC,$01FC,$01FD,$01FD
#_00B133: dw $01FD,$01FE,$01FE,$01FF
#_00B13B: dw $0000,$0001,$0002,$0002
#_00B143: dw $0003,$0003,$0003,$0004
#_00B14B: dw $0004,$0004,$0003,$0003
#_00B153: dw $0003,$0002,$0002,$0001

data00B15B:
#_00B15B: dw $0000,$01FE,$01FC,$01FC
#_00B163: dw $01FA,$01FA,$01FA,$01F8
#_00B16B: dw $01F8,$01F8,$01FA,$01FA
#_00B173: dw $01FA,$01FC,$01FC,$01FE
#_00B17B: dw $0000,$0002,$0004,$0004
#_00B183: dw $0006,$0006,$0006,$0008
#_00B18B: dw $0008,$0008,$0006,$0006
#_00B193: dw $0006,$0004,$0004,$0002

data00B19B:
#_00B19B: dw $0000,$01FF,$01FE,$01FE
#_00B1A3: dw $01FF,$0000,$0001,$0002
#_00B1AB: dw $0002,$0001,$0000,$01FF
#_00B1B3: dw $01FE,$01FE,$01FF,$0000
#_00B1BB: dw $0001,$0002,$0002,$0001
#_00B1C3: dw $0000,$01FF,$01FE,$01FE
#_00B1CB: dw $01FF,$0000,$0001,$0002
#_00B1D3: dw $0002,$0001,$0000,$0000

data00B1DB:
#_00B1DB: dw $0000,$01FF,$01FE,$01FE
#_00B1E3: dw $01FF,$0000,$0001,$0002
#_00B1EB: dw $0002,$0001,$0000,$01FF
#_00B1F3: dw $01FE,$01FE,$01FF,$0000
#_00B1FB: dw $0000,$0000,$0000,$0000
#_00B203: dw $0000,$0000,$0000,$0000
#_00B20B: dw $0000,$0000,$0000,$0000
#_00B213: dw $0000,$0000,$0000,$0000

data00B21B:
#_00B21B: dw $0000,$01FC,$01F8,$01F4
#_00B223: dw $01F3,$01F2,$01F1,$01F0
#_00B22B: dw $01F0,$01F4,$01F8,$01FC
#_00B233: dw $01FD,$01FE,$01FF,$0000
#_00B23B: dw $0000,$0004,$0008,$000C
#_00B243: dw $000D,$000E,$000F,$0010
#_00B24B: dw $0010,$000C,$0008,$0004
#_00B253: dw $0003,$0002,$0001,$0000
#_00B25B: dw $0000,$0010,$0001,$000F
#_00B263: dw $0002,$000E,$0003,$000D
#_00B26B: dw $0004,$000C,$0005,$000B
#_00B273: dw $0006,$000A,$0007,$0008
#_00B27B: dw $01F8,$01F9,$01F6,$01FA
#_00B283: dw $01F5,$01FB,$01F4,$01FC
#_00B28B: dw $01F3,$01FD,$01F2,$01FE
#_00B293: dw $01F1,$01FF,$01F0,$0000
#_00B29B: dw $0000,$01F8,$01F0,$01E8
#_00B2A3: dw $01E0,$01D8,$01D0,$01C8
#_00B2AB: dw $01C8,$01D0,$01D8,$01E0
#_00B2B3: dw $01E8,$01F0,$01F8,$0000
#_00B2BB: dw $0000,$0008,$0010,$0018
#_00B2C3: dw $0020,$0028,$0030,$0038
#_00B2CB: dw $0038,$0030,$0028,$0020
#_00B2D3: dw $0018,$0010,$0008,$0000

;===================================================================================================

routine00B2DB:
#_00B2DB: SEP #$20
#_00B2DD: LDA.w $0CF3
#_00B2E0: BEQ .branch00B2E5

#_00B2E2: JSR ResetStatsMaybe

.branch00B2E5
#_00B2E5: SEP #$20
#_00B2E7: LDA.b #$00
#_00B2E9: STA.w $0404
#_00B2EC: JSL routine00C197
#_00B2F0: LDA.b #$FF
#_00B2F2: STA.w $0404
#_00B2F5: JSL routine028000
#_00B2F9: BRA .branch00B2E5

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00B2FB:
#_00B2FB: REP #$20
#_00B2FD: JSL AddSelfAsVector
#_00B301: LDA.w $0F2B
#_00B304: BIT.w #$3000
#_00B307: BNE .useless

.useless
#_00B309: JMP routine00B7C5

;===================================================================================================

ResetStatsMaybe:
#_00B30C: REP #$30
#_00B30E: LDX.w #$0000
#_00B311: STX.w $0720
#_00B314: STZ.w $0715

.branch00B317
#_00B317: LDA.w #$8000
#_00B31A: ORA.w $0715
#_00B31D: STA.w $1004,X
#_00B320: STA.w $1006,X
#_00B323: LDA.w #$0001
#_00B326: STA.w $100A,X
#_00B329: LDY.w #$0000

.branch00B32C
#_00B32C: LDA.w #$0005
#_00B32F: STA.w $1010,X
#_00B332: LDA.w #$FFFF
#_00B335: STA.w $1042,X
#_00B338: INX
#_00B339: INX
#_00B33A: INY
#_00B33B: INY
#_00B33C: CPY.w #$000E
#_00B33F: BCC .branch00B32C

#_00B341: TXA
#_00B342: AND.w #$FFE0
#_00B345: TAX
#_00B346: LDA.w #$0080
#_00B349: CPX.w #$00C0
#_00B34C: BCC .branch00B359

#_00B34E: LDA.w #$0000
#_00B351: CPX.w #$0120
#_00B354: BCC .branch00B359

#_00B356: LDA.w #$00FF

.branch00B359
#_00B359: STA.w $101C,X
#_00B35C: JSL UpdateMaxHP
#_00B360: STA.w $102E,X
#_00B363: JSL UpdateSwordPower
#_00B367: JSL UpdateGunPower
#_00B36B: JSL UpdateSwordAccuracy
#_00B36F: JSL UpdateGunAccuracy
#_00B373: JSL UpdateDefense
#_00B377: JSL UpdateEvade
#_00B37B: CPX.w #$0060
#_00B37E: BCC .branch00B387

#_00B380: JSL UpdateMaxMP
#_00B384: STA.w $1032,X

.branch00B387
#_00B387: JSL UpdateMagicPower
#_00B38B: JSL UpdateMagicEffect
#_00B38F: INC.w $0715
#_00B392: TXA
#_00B393: CLC
#_00B394: ADC.w #$0060
#_00B397: TAX
#_00B398: CMP.w #$0180
#_00B39B: BCS .branch00B3A0

#_00B39D: JMP .branch00B317

;---------------------------------------------------------------------------------------------------

.branch00B3A0
#_00B3A0: LDA.w #$FFFF
#_00B3A3: LDX.w #$0000

.branch00B3A6
#_00B3A6: STA.w $0700,X
#_00B3A9: INX
#_00B3AA: INX
#_00B3AB: CPX.w #$000C
#_00B3AE: BCC .branch00B3A6

#_00B3B0: SEP #$20
#_00B3B2: LDX.w #$0000

.branch00B3B5
#_00B3B5: STZ.w $0410,X
#_00B3B8: INX
#_00B3B9: CPX.w #$0020
#_00B3BC: BCC .branch00B3B5

#_00B3BE: LDX.w #$0000

.branch00B3C1
#_00B3C1: STZ.w $0780,X
#_00B3C4: INX
#_00B3C5: CPX.w #$003C
#_00B3C8: BCC .branch00B3C1

#_00B3CA: LDA.b #$80
#_00B3CC: STA.w $0726
#_00B3CF: STZ.w $0726
#_00B3D2: LDA.b #$0F
#_00B3D4: STA.w $070C
#_00B3D7: LDA.b #$0E
#_00B3D9: STA.w $070D
#_00B3DC: LDA.b #$03
#_00B3DE: STA.w $040D
#_00B3E1: LDA.b #$05
#_00B3E3: STA.w $0710
#_00B3E6: LDA.b #$FF
#_00B3E8: JSL SetGameProgressFlag
#_00B3EC: LDA.b #$FE
#_00B3EE: JSL SetGameProgressFlag
#_00B3F2: LDA.b #$03
#_00B3F4: STA.w $0460
#_00B3F7: LDA.b #$10
#_00B3F9: STA.w $0464
#_00B3FC: LDA.b #$FF
#_00B3FE: STA.w $045E
#_00B401: STA.w $045F
#_00B404: RTS

;---------------------------------------------------------------------------------------------------

#_00B405: db $84,$90,$5F,$6A,$5E,$80,$87,$5F
#_00B40D: db $12,$0F,$1C,$19,$13,$18,$0F,$CF
#_00B415: db $87,$5F,$92,$CF,$77,$5A,$87,$5A
#_00B41D: db $62,$61,$69,$CF,$77,$5A,$87,$5A
#_00B425: db $B2,$09,$B2,$09,$B2,$09,$B2,$09
#_00B42D: db $B2,$09,$B2,$09,$B2,$09,$B2,$09
#_00B435: db $E4,$09,$E5,$09,$E6,$09,$E7,$09
#_00B43D: db $E8,$09,$E9,$09,$EA,$09,$EB,$09
#_00B445: db $EC,$09,$ED,$09,$EE,$09,$EF,$09
#_00B44D: db $E4,$09,$E5,$09,$E6,$09,$E7,$09
#_00B455: db $E8,$09,$E9,$09,$EA,$09,$EB,$09
#_00B45D: db $EC,$09,$ED,$09,$EE,$09,$EF,$09

;===================================================================================================

routine00B465:
#_00B465: PHP
#_00B466: REP #$30
#_00B468: PHB
#_00B469: PHK
#_00B46A: PLB
#_00B46B: LDX.w #$0060

.branch00B46E
#_00B46E: LDY.w #$0000

.branch00B471
#_00B471: LDA.w data00B4B7,Y
#_00B474: CPX.w #$00C0
#_00B477: BCC .branch00B484

#_00B479: LDA.w data00B4C5,Y
#_00B47C: CPX.w #$0120
#_00B47F: BCC .branch00B484

#_00B481: LDA.w data00B4D3,Y

.branch00B484
#_00B484: STA.w $1042,X
#_00B487: INX
#_00B488: INX
#_00B489: INY
#_00B48A: INY
#_00B48B: CPY.w #$000E
#_00B48E: BCC .branch00B471

#_00B490: TXA
#_00B491: AND.w #$FFE0
#_00B494: TAX
#_00B495: STA.w $0715
#_00B498: LDA.w #$FFFF
#_00B49B: STA.w $0692
#_00B49E: JSL routine01A700
#_00B4A2: LDX.w $0715
#_00B4A5: JSL UpdatePlayerStats
#_00B4A9: TXA
#_00B4AA: CLC
#_00B4AB: ADC.w #$0060
#_00B4AE: TAX
#_00B4AF: CMP.w #$0180
#_00B4B2: BCC .branch00B46E

#_00B4B4: PLB
#_00B4B5: PLP
#_00B4B6: RTL

data00B4B7:
#_00B4B7: dw $0007,$0042,$0053,$0063
#_00B4BF: dw $007C,$0093,$00A4

data00B4C5:
#_00B4C5: dw $0001,$0041,$0050,$0060
#_00B4CD: dw $0078,$0090,$00A0

data00B4D3:
#_00B4D3: dw $0003,$0042,$0050,$0061
#_00B4DB: dw $0079,$0091,$00A1

;===================================================================================================

UpdatePlayerStats:
#_00B4E1: PHP
#_00B4E2: REP #$30
#_00B4E4: TXA
#_00B4E5: LDY.w #$0000

.next_party_member
#_00B4E8: CMP.w $0700,Y
#_00B4EB: BEQ .this_guy

#_00B4ED: INY
#_00B4EE: INY
#_00B4EF: CPY.w #$000C
#_00B4F2: BCC .next_party_member

#_00B4F4: LDY.w #$0000

.this_guy
#_00B4F7: STY.w $0720

#_00B4FA: JSL UpdateMaxHP
#_00B4FE: JSL UpdateSwordPower
#_00B502: JSL UpdateGunPower
#_00B506: JSL UpdateSwordAccuracy
#_00B50A: JSL UpdateGunAccuracy
#_00B50E: JSL UpdateDefense
#_00B512: JSL UpdateEvade

#_00B516: CPX.w #$0060
#_00B519: BCC .no_mp_for_chase

#_00B51B: JSL UpdateMaxMP

.no_mp_for_chase
#_00B51F: JSL UpdateMagicPower
#_00B523: JSL UpdateMagicEffect

#_00B527: PLP
#_00B528: RTL

;===================================================================================================

UpdateMaxHP:
#_00B529: PHP
#_00B52A: REP #$30

#_00B52C: LDA.w $1010,X
#_00B52F: LSR A
#_00B530: ADC.w $1016,X

#_00B533: LDY.w #$0004
#_00B536: CPX.w #$0060 ; Look at a specific character
#_00B539: BNE .branch00B53C

#_00B53B: INY

.branch00B53C
#_00B53C: PHX

#_00B53D: LDX.w #$0000
#_00B540: JSL DivisionBig_XA_by_Y
#_00B544: JSL RoundQuotient

#_00B548: SEP #$20

#_00B54A: STA.w WRMPYA

#_00B54D: PLX

#_00B54E: LDA.w $100A,X
#_00B551: INC A
#_00B552: STA.w WRMPYB

#_00B555: REP #$20

#_00B557: LDA.w RDMPYL
#_00B55A: CLC
#_00B55B: ADC.w #$000C
#_00B55E: CPX.w #$0060
#_00B561: BEQ .branch00B567

#_00B563: CLC
#_00B564: ADC.w #$0002

.branch00B567
#_00B567: STA.w $1030,X
#_00B56A: CMP.w #$03E7
#_00B56D: BCC .exit

#_00B56F: LDA.w #$03E7
#_00B572: STA.w $1030,X

.exit
#_00B575: PLP
#_00B576: RTL

;===================================================================================================

UpdateMaxMP:
#_00B577: PHP

#_00B578: REP #$30

#_00B57A: LDA.w $1014,X
#_00B57D: LSR A
#_00B57E: ADC.w $1012,X
#_00B581: LSR A
#_00B582: LSR A
#_00B583: LSR A
#_00B584: ADC.w #$0000

#_00B587: SEP #$20

#_00B589: STA.w WRMPYA
#_00B58C: LDA.w $100A,X

#_00B58F: CLC
#_00B590: ADC.b #$04
#_00B592: STA.w WRMPYB

#_00B595: NOP
#_00B596: NOP
#_00B597: NOP
#_00B598: NOP
#_00B599: NOP
#_00B59A: NOP
#_00B59B: NOP
#_00B59C: NOP

#_00B59D: REP #$20

#_00B59F: LDA.w RDMPYL
#_00B5A2: CLC
#_00B5A3: ADC.w #$0004
#_00B5A6: STA.w $1034,X

; cap at 999
#_00B5A9: CMP.w #$03E7
#_00B5AC: BCC .exit

#_00B5AE: LDA.w #$03E7
#_00B5B1: STA.w $1034,X

.exit
#_00B5B4: PLP
#_00B5B5: RTL

;===================================================================================================

UpdateSwordPower:
#_00B5B6: PHP

; Why is this here????
#Native_BRK:
#_00B5B7: REP #$30

#_00B5B9: STZ.w $101E,X

#_00B5BC: LDA.w $1042,X ; Load equipped sword
#_00B5BF: BMI .exit

#_00B5C1: LDY.w #$0001
#_00B5C4: JSL GetEquipmentStat
#_00B5C8: AND.w #$00FF
#_00B5CB: CLC
#_00B5CC: ADC.w $1010,X ; Add in STR
#_00B5CF: STA.w $101E,X

.exit
#_00B5D2: PLP
#_00B5D3: RTL

;===================================================================================================

UpdateGunPower:
#_00B5D4: PHP
#_00B5D5: REP #$30

#_00B5D7: STZ.w $1022,X

 ; if no bullets, exit
#_00B5DA: LDA.w $1046,X
#_00B5DD: BMI .exit

 ; get gun id
#_00B5DF: LDA.w $1044,X
#_00B5E2: BMI .exit

; gun power
#_00B5E4: LDY.w #$0001
#_00B5E7: JSL GetEquipmentStat
#_00B5EB: AND.w #$00FF
#_00B5EE: STA.w $1022,X

 ; add in bullets
#_00B5F1: LDA.w $1046,X
#_00B5F4: LDY.w #$0001
#_00B5F7: JSL GetEquipmentStat

#_00B5FB: AND.w #$00FF
#_00B5FE: CLC
#_00B5FF: ADC.w $1022,X
#_00B602: STA.w $1022,X

.exit
#_00B605: PLP
#_00B606: RTL

;===================================================================================================

UpdateSwordAccuracy:
#_00B607: PHP
#_00B608: REP #$30

#_00B60A: STZ.w $1020,X

#_00B60D: LDA.w $1042,X
#_00B610: BMI .exit

#_00B612: LDY.w #$0002
#_00B615: JSL GetEquipmentStat
#_00B619: AND.w #$00FF
#_00B61C: STA.w $1020,X

#_00B61F: LDA.w $1010,X
#_00B622: LSR A
#_00B623: LSR A
#_00B624: ADC.w $1020,X
#_00B627: STA.w $1020,X

#_00B62A: LDA.w $101A,X
#_00B62D: LSR A
#_00B62E: LSR A
#_00B62F: ADC.w $1020,X
#_00B632: ADC.w $1018,X
#_00B635: STA.w $1020,X

#_00B638: LDY.w $0720
#_00B63B: CPY.w #$0003
#_00B63E: BCC .exit

#_00B640: LSR A
#_00B641: LSR A
#_00B642: LSR A
#_00B643: STA.w $0E80

#_00B646: LDA.w $1020,X
#_00B649: SEC
#_00B64A: SBC.w $0E80
#_00B64D: STA.w $1020,X

.exit
#_00B650: PLP
#_00B651: RTL

;===================================================================================================

UpdateGunAccuracy:
#_00B652: PHP
#_00B653: REP #$30

#_00B655: STZ.w $1024,X

#_00B658: LDA.w $1046,X
#_00B65B: BMI .exit

#_00B65D: LDA.w $1044,X
#_00B660: BMI .exit

#_00B662: LDY.w #$0002
#_00B665: JSL GetEquipmentStat
#_00B669: AND.w #$00FF
#_00B66C: STA.w $1024,X

#_00B66F: LDA.w $1010,X
#_00B672: LSR A
#_00B673: LSR A
#_00B674: ADC.w $1024,X
#_00B677: STA.w $1024,X

#_00B67A: LDA.w $101A,X
#_00B67D: LSR A
#_00B67E: LSR A
#_00B67F: ADC.w $1024,X
#_00B682: ADC.w $1018,X
#_00B685: STA.w $1024,X

#_00B688: LDY.w $0720
#_00B68B: CPY.w #$0003
#_00B68E: BCC .exit

#_00B690: LSR A
#_00B691: LSR A
#_00B692: LSR A
#_00B693: STA.w $0E80

#_00B696: LDA.w $1024,X
#_00B699: SEC
#_00B69A: SBC.w $0E80
#_00B69D: STA.w $1024,X

.exit
#_00B6A0: PLP
#_00B6A1: RTL

;===================================================================================================

UpdateMagicPower:
#_00B6A2: PHP
#_00B6A3: REP #$30

#_00B6A5: LDA.w $1012,X
#_00B6A8: LSR A
#_00B6A9: LSR A
#_00B6AA: LSR A
#_00B6AB: ADC.w $1014,X
#_00B6AE: STA.w $102A,X

#_00B6B1: PLP
#_00B6B2: RTL

;===================================================================================================

UpdateMagicEffect:
#_00B6B3: PHP
#_00B6B4: REP #$30

#_00B6B6: LDA.w $1014,X
#_00B6B9: LSR A
#_00B6BA: LSR A
#_00B6BB: LSR A
#_00B6BC: ADC.w $1012,X
#_00B6BF: STA.w $102C,X

#_00B6C2: PLP
#_00B6C3: RTL

;===================================================================================================

UpdateDefense:
#_00B6C4: PHP
#_00B6C5: REP #$30

#_00B6C7: STZ.w $1026,X
#_00B6CA: STZ.w $0E80

.next_piece
#_00B6CD: TXA
#_00B6CE: CLC
#_00B6CF: ADC.w $0E80
#_00B6D2: TAY
#_00B6D3: LDA.w $1048,Y
#_00B6D6: BMI .skip_piece

#_00B6D8: LDY.w #$0001
#_00B6DB: JSL GetEquipmentStat
#_00B6DF: AND.w #$00FF
#_00B6E2: CLC
#_00B6E3: ADC.w $1026,X
#_00B6E6: STA.w $1026,X

.skip_piece
#_00B6E9: INC.w $0E80
#_00B6EC: INC.w $0E80

#_00B6EF: LDA.w $0E80
#_00B6F2: CMP.w #$0008
#_00B6F5: BCC .next_piece

#_00B6F7: LDA.w $1016,X
#_00B6FA: CLC
#_00B6FB: ADC.w $1018,X
#_00B6FE: LSR A
#_00B6FF: ADC.w $1026,X
#_00B702: STA.w $1026,X

#_00B705: LDY.w $0720
#_00B708: CPY.w #$0003
#_00B70B: BCC .exit

#_00B70D: LSR A
#_00B70E: LSR A
#_00B70F: LSR A
#_00B710: CLC
#_00B711: ADC.w $1026,X
#_00B714: STA.w $1026,X

.exit
#_00B717: PLP
#_00B718: RTL

;===================================================================================================

UpdateEvade:
#_00B719: PHP
#_00B71A: REP #$30

#_00B71C: STZ.w $1028,X

#_00B71F: STZ.w $0E80

.next_piece
#_00B722: TXA
#_00B723: CLC
#_00B724: ADC.w $0E80
#_00B727: TAY

#_00B728: LDA.w $1048,Y
#_00B72B: BMI .skip_piece

#_00B72D: LDY.w #$0002
#_00B730: JSL GetEquipmentStat
#_00B734: AND.w #$00FF
#_00B737: CLC
#_00B738: ADC.w $1028,X
#_00B73B: STA.w $1028,X

.skip_piece
#_00B73E: INC.w $0E80
#_00B741: INC.w $0E80

#_00B744: LDA.w $0E80
#_00B747: CMP.w #$0008
#_00B74A: BCC .next_piece

#_00B74C: LDA.w $1012,X
#_00B74F: LSR A
#_00B750: LSR A
#_00B751: ADC.w $1028,X
#_00B754: STA.w $1028,X

#_00B757: LDA.w $101A,X
#_00B75A: LSR A
#_00B75B: LSR A
#_00B75C: ADC.w $1028,X
#_00B75F: ADC.w $1018,X
#_00B762: STA.w $1028,X

#_00B765: LDY.w $0720
#_00B768: CPY.w #$0003
#_00B76B: BCC .exit

#_00B76D: LSR A
#_00B76E: LSR A
#_00B76F: LSR A
#_00B770: CLC
#_00B771: ADC.w $1028,X
#_00B774: STA.w $1028,X

.exit
#_00B777: PLP
#_00B778: RTL

;===================================================================================================

GetEquipmentStat:
#_00B779: PHP

#_00B77A: SEP #$20

#_00B77C: STA.w WRMPYA ; A = Equipment ID
#_00B77F: LDA.b #$0C
#_00B781: STA.w WRMPYB

#_00B784: PHB

#_00B785: LDA.b #EquipmentStats>>16
#_00B787: PHA
#_00B788: PLB

#_00B789: NOP
#_00B78A: NOP
#_00B78B: NOP
#_00B78C: NOP
#_00B78D: NOP
#_00B78E: NOP
#_00B78F: NOP
#_00B790: NOP

#_00B791: REP #$30

#_00B793: TYA ; Y = requested stat
#_00B794: CLC
#_00B795: ADC.w RDMPYL
#_00B798: TAY

#_00B799: LDA.w EquipmentStats,Y

#_00B79C: PLB

#_00B79D: PLP
#_00B79E: RTL

;===================================================================================================

GetUseItemStat:
#_00B79F: PHP

#_00B7A0: SEP #$20

#_00B7A2: STA.w WRMPYA

#_00B7A5: LDA.b #$04
#_00B7A7: STA.w WRMPYB

#_00B7AA: PHB

#_00B7AB: LDA.b #UseItemStats>>16
#_00B7AD: PHA
#_00B7AE: PLB

#_00B7AF: NOP
#_00B7B0: NOP
#_00B7B1: NOP
#_00B7B2: NOP
#_00B7B3: NOP
#_00B7B4: NOP
#_00B7B5: NOP
#_00B7B6: NOP

#_00B7B7: REP #$30

#_00B7B9: TYA
#_00B7BA: CLC
#_00B7BB: ADC.w RDMPYL
#_00B7BE: TAY

#_00B7BF: LDA.w UseItemStats,Y

#_00B7C2: PLB

#_00B7C3: PLP
#_00B7C4: RTL

;===================================================================================================

routine00B7C5:
#_00B7C5: SEP #$20

#_00B7C7: LDA.b #$00
#_00B7C9: STA.w NMITIMEN

#_00B7CC: STA.w $0F00
#_00B7CF: LDA.b #$80

#_00B7D1: STA.w INIDISP
#_00B7D4: STA.w $0F43

#_00B7D7: REP #$30

#_00B7D9: LDA.w #$0000
#_00B7DC: TAY

.branch00B7DD
#_00B7DD: STA.w $197D,Y
#_00B7E0: INY
#_00B7E1: CPY.w #$0400
#_00B7E4: BCC .branch00B7DD

#_00B7E6: TAX

.branch00B7E7
#_00B7E7: STA.l $7F2000,X
#_00B7EB: INX
#_00B7EC: CPX.w #$4000
#_00B7EF: BCC .branch00B7E7

#_00B7F1: TAX

.branch00B7F2
#_00B7F2: LDA.l $7F6000,X
#_00B7F6: STA.w $1972,X
#_00B7F9: INX
#_00B7FA: CPX.w #$0016
#_00B7FD: BCC .branch00B7F2

#_00B7FF: LDA.w #$4000 ; $8000 VRAM
#_00B802: STA.w VMADDL
#_00B805: LDA.w #$0000
#_00B808: TAY

.branch00B809
#_00B809: STA.w VMDATAL
#_00B80C: INY
#_00B80D: CPY.w #$8000
#_00B810: BCC .branch00B809

#_00B812: LDA.w #$1400 ; $2800 VRAM
#_00B815: STA.w VMADDL
#_00B818: LDA.w #$0000

.branch00B81B
#_00B81B: STA.w VMDATAL
#_00B81E: INC A
#_00B81F: CMP.w #$0800
#_00B822: BCC .branch00B81B

#_00B824: SEP #$20
#_00B826: LDA.b #$02
#_00B828: STA.w TM
#_00B82B: STA.w $0F74
#_00B82E: LDA.b #$00
#_00B830: STA.w TS
#_00B833: STA.w $0F76
#_00B836: LDA.b #$0F
#_00B838: STA.w INIDISP
#_00B83B: STA.w $0F43
#_00B83E: LDA.b #$81
#_00B840: STA.w NMITIMEN
#_00B843: STA.w $0F00

.branch00B846
#_00B846: REP #$20
#_00B848: JSL AddSelfAsVectorAndMakeSpace

#_00B84C: SEP #$20
#_00B84E: JSR routine00B857
#_00B851: JSR routine00B8FE
#_00B854: JMP .branch00B846

;===================================================================================================

routine00B857:
#_00B857: SEP #$30
#_00B859: LDA.w $1975
#_00B85C: AND.b #$0F
#_00B85E: TAX

.branch00B85F
#_00B85F: INC.w $1973
#_00B862: ROR.w $1974
#_00B865: LDA.w $1976
#_00B868: ADC.b #$25
#_00B86A: STA.w $1976
#_00B86D: LDA.w $1977
#_00B870: ADC.b #$33
#_00B872: STA.w $1977
#_00B875: LDA.w $1978
#_00B878: AND.b #$07
#_00B87A: ADC.b #$53
#_00B87C: STA.w $1978
#_00B87F: ADC.w $1976
#_00B882: ADC.w $1977
#_00B885: ROL.w $1974
#_00B888: EOR.w $1975
#_00B88B: STA.w $1975
#_00B88E: DEX
#_00B88F: BPL .branch00B85F

#_00B891: REP #$30
#_00B893: AND.w #$00FF
#_00B896: ASL A
#_00B897: STA.w $196C
#_00B89A: TAX
#_00B89B: INC.w $197D,X
#_00B89E: LSR A
#_00B89F: LSR A
#_00B8A0: LSR A
#_00B8A1: LSR A
#_00B8A2: STA.w $196E
#_00B8A5: LDA.w $197D,X
#_00B8A8: AND.w #$00F8
#_00B8AB: ASL A
#_00B8AC: ASL A
#_00B8AD: CLC
#_00B8AE: ADC.w $196E
#_00B8B1: ASL A
#_00B8B2: ASL A
#_00B8B3: ASL A
#_00B8B4: ASL A
#_00B8B5: STA.w $1970
#_00B8B8: ASL A
#_00B8B9: STA.w $196E
#_00B8BC: LDA.w $197D,X
#_00B8BF: AND.w #$0007
#_00B8C2: DEC A
#_00B8C3: ASL A
#_00B8C4: CLC
#_00B8C5: ADC.w $1970
#_00B8C8: PHA
#_00B8C9: TXA
#_00B8CA: LSR A
#_00B8CB: AND.w #$0007
#_00B8CE: TAY
#_00B8CF: PLX
#_00B8D0: LDA.w #$0000
#_00B8D3: SEC

.branch00B8D4
#_00B8D4: ROR A
#_00B8D5: DEY
#_00B8D6: BPL .branch00B8D4

#_00B8D8: ORA.l $7F2000,X
#_00B8DC: STA.l $7F2000,X
#_00B8E0: STA.w $0106
#_00B8E3: LDX.w $196C
#_00B8E6: LDA.w $197D,X
#_00B8E9: AND.w #$0007
#_00B8EC: DEC A
#_00B8ED: CLC
#_00B8EE: ADC.w $1970
#_00B8F1: ADC.w #$4000
#_00B8F4: STA.w $0102
#_00B8F7: LDA.w #$0001
#_00B8FA: STA.w $0104
#_00B8FD: RTS

;===================================================================================================

routine00B8FE:
#_00B8FE: SEP #$20
#_00B900: CLC
#_00B901: LDA.w $197A
#_00B904: AND.b #$03
#_00B906: BEQ .branch00B90C

#_00B908: CMP.b #$03
#_00B90A: BNE .branch00B90D

.branch00B90C
#_00B90C: SEC

.branch00B90D
#_00B90D: ROL.w $1979
#_00B910: ROL.w $197A
#_00B913: LDA.w $197A
#_00B916: ADC.b #$22
#_00B918: ADC.w $1979
#_00B91B: EOR.b #$5A
#_00B91D: ADC.w $197B
#_00B920: STA.w $197B
#_00B923: EOR.w $197C
#_00B926: STA.w $197C

#_00B929: REP #$30
#_00B92B: AND.w #$00FF
#_00B92E: ASL A
#_00B92F: STA.w $196C
#_00B932: TAX
#_00B933: INC.w $1B7D,X
#_00B936: LSR A
#_00B937: LSR A
#_00B938: LSR A
#_00B939: LSR A
#_00B93A: STA.w $196E
#_00B93D: LDA.w $1B7D,X
#_00B940: AND.w #$00F8
#_00B943: ASL A
#_00B944: ASL A
#_00B945: CLC
#_00B946: ADC.w $196E
#_00B949: ASL A
#_00B94A: ASL A
#_00B94B: ASL A
#_00B94C: ASL A
#_00B94D: STA.w $1970
#_00B950: ASL A
#_00B951: STA.w $196E
#_00B954: LDA.w $1B7D,X
#_00B957: AND.w #$0007
#_00B95A: DEC A
#_00B95B: ASL A
#_00B95C: CLC
#_00B95D: ADC.w $1970
#_00B960: PHA
#_00B961: TXA
#_00B962: LSR A
#_00B963: AND.w #$0007
#_00B966: TAY
#_00B967: PLX
#_00B968: LDA.w #$0000
#_00B96B: SEC

.branch00B96C
#_00B96C: ROR A
#_00B96D: DEY
#_00B96E: BPL .branch00B96C

#_00B970: ORA.l $7F4000,X
#_00B974: STA.l $7F4000,X
#_00B978: STA.w $010C
#_00B97B: LDX.w $196C
#_00B97E: LDA.w $1B7D,X
#_00B981: AND.w #$0007
#_00B984: DEC A
#_00B985: CLC
#_00B986: ADC.w $1970
#_00B989: ADC.w #$6000
#_00B98C: STA.w $0108
#_00B98F: LDA.w #$0001
#_00B992: STA.w $010A
#_00B995: LDA.w #$0002
#_00B998: STA.w $0100
#_00B99B: RTS

;===================================================================================================

InitializeTextBoxToSizeForNewMessage:
#_00B99C: PHP
#_00B99D: SEP #$30

#_00B99F: DEC A
#_00B9A0: DEC A
#_00B9A1: STA.w $0EED

#_00B9A4: JSR routine00B9AD
#_00B9A7: JSL AddSelfAsVector

#_00B9AB: PLP
#_00B9AC: RTL

;===================================================================================================

routine00B9AD:
#_00B9AD: PHB
#_00B9AE: PHK
#_00B9AF: PLB
#_00B9B0: LDX.b #$00

.branch00B9B2
#_00B9B2: LDA.w BG3_Interface_HDMA,X
#_00B9B5: STA.l $7E2700,X
#_00B9B9: INX
#_00B9BA: CPX.b #$43
#_00B9BC: BCC .branch00B9B2

#_00B9BE: LDA.w $0EED
#_00B9C1: CMP.b #$05
#_00B9C3: BEQ .branch00BA25

#_00B9C5: ASL A
#_00B9C6: STA.w $0EEE
#_00B9C9: ASL A
#_00B9CA: CLC
#_00B9CB: ADC.w $0EEE
#_00B9CE: ADC.b #$1F
#_00B9D0: TAX
#_00B9D1: LDA.w $0EED
#_00B9D4: STA.w WRMPYA
#_00B9D7: LDA.b #$0E
#_00B9D9: STA.w WRMPYB
#_00B9DC: LDY.b #$08

.branch00B9DE
#_00B9DE: DEY
#_00B9DF: BNE .branch00B9DE

#_00B9E1: LDA.w RDMPYL
#_00B9E4: STA.w $0EEE
#_00B9E7: LDA.b #$50
#_00B9E9: SEC
#_00B9EA: SBC.w $0EEE
#_00B9ED: LDY.b #$00

.branch00B9EF
#_00B9EF: STA.l $7E2700,X
#_00B9F3: INX
#_00B9F4: INX
#_00B9F5: INX
#_00B9F6: INY
#_00B9F7: CPY.b #$05
#_00B9F9: BCC .branch00B9EF

#_00B9FB: CPX.b #$43
#_00B9FD: BCS .branch00BA25

#_00B9FF: SEC
#_00BA00: SBC.b #$20
#_00BA02: LDY.b #$00

.branch00BA04
#_00BA04: STA.l $7E2700,X
#_00BA08: INX
#_00BA09: INX
#_00BA0A: INX
#_00BA0B: INY
#_00BA0C: CPY.b #$03
#_00BA0E: BCC .branch00BA04

#_00BA10: CPX.b #$43
#_00BA12: BCS .branch00BA25

#_00BA14: SEC
#_00BA15: SBC.b #$10
#_00BA17: LDY.b #$00

.branch00BA19
#_00BA19: STA.l $7E2700,X
#_00BA1D: INX
#_00BA1E: INX
#_00BA1F: INX
#_00BA20: INY
#_00BA21: CPY.b #$04
#_00BA23: BCC .branch00BA19

.branch00BA25
#_00BA25: LDA.b #$02
#_00BA27: JSL PrepHDMAtypeFromA
#_00BA2B: PLB
#_00BA2C: RTS

;===================================================================================================

; TODO figure out this HDMA table
BG3_Interface_HDMA:
#_00BA2D: db $81,$00,$00,$03,$00,$00,$08,$FC
#_00BA35: db $01,$01,$FB,$01,$01,$FA,$01,$01
#_00BA3D: db $F9,$01,$57,$F8,$01,$0A,$F4,$01
#_00BA45: db $0C,$FC,$01,$0E,$FE,$01,$09,$00
#_00BA4D: db $00,$05,$00,$00,$09,$02,$00,$05
#_00BA55: db $02,$00,$09,$04,$00,$05,$04,$00
#_00BA5D: db $09,$06,$00,$05,$06,$00,$09,$08
#_00BA65: db $00,$05,$08,$00,$09,$0A,$00,$05
#_00BA6D: db $0A,$00,$00

;===================================================================================================

routine00BA70:
#_00BA70: PHP
#_00BA71: SEP #$30
#_00BA73: DEC A
#_00BA74: DEC A
#_00BA75: CMP.w $0EED
#_00BA78: BCC .exit
#_00BA7A: BEQ .exit

#_00BA7C: STA.w $0EEC

.branch00BA7F
#_00BA7F: LDY.b #$00

.branch00BA81
#_00BA81: PHY
#_00BA82: LDA.w $0EED
#_00BA85: ASL A
#_00BA86: STA.w $0EEE
#_00BA89: ASL A
#_00BA8A: CLC
#_00BA8B: ADC.w $0EEE
#_00BA8E: ADC.b #$1F
#_00BA90: TAX
#_00BA91: LDY.b #$00

.branch00BA93
#_00BA93: LDA.l $7E2700,X
#_00BA97: SEC
#_00BA98: SBC.b #$03
#_00BA9A: STA.l $7E2700,X
#_00BA9E: INX
#_00BA9F: INX
#_00BAA0: INX
#_00BAA1: INY
#_00BAA2: CPY.b #$02
#_00BAA4: BCC .branch00BA93

#_00BAA6: JSL AddSelfAsVector
#_00BAAA: PLY
#_00BAAB: INY
#_00BAAC: CPY.b #$03
#_00BAAE: BCC .branch00BA81

#_00BAB0: INC.w $0EED
#_00BAB3: JSR routine00B9AD
#_00BAB6: LDA.w $0EED
#_00BAB9: CMP.w $0EEC
#_00BABC: BCC .branch00BA7F

.exit
#_00BABE: PLP ; ooooooooo BABE!
#_00BABF: RTL

;===================================================================================================

routine00BAC0:
#_00BAC0: PHP
#_00BAC1: SEP #$30
#_00BAC3: DEC A
#_00BAC4: DEC A
#_00BAC5: CMP.w $0EED
#_00BAC8: BCS .exit

#_00BACA: STA.w $0EEC

.branch00BACD
#_00BACD: DEC.w $0EED
#_00BAD0: LDY.b #$03

.branch00BAD2
#_00BAD2: PHY
#_00BAD3: JSR routine00B9AD
#_00BAD6: LDA.w $0EED
#_00BAD9: ASL A
#_00BADA: STA.w $0EEE
#_00BADD: ASL A
#_00BADE: CLC
#_00BADF: ADC.w $0EEE
#_00BAE2: ADC.b #$1F
#_00BAE4: TAX
#_00BAE5: PLA
#_00BAE6: PHA
#_00BAE7: STA.w $0EEE
#_00BAEA: ASL A
#_00BAEB: CLC
#_00BAEC: ADC.w $0EEE
#_00BAEF: STA.w $0EEE
#_00BAF2: LDY.b #$00

.branch00BAF4
#_00BAF4: LDA.l $7E2700,X
#_00BAF8: SEC
#_00BAF9: SBC.w $0EEE
#_00BAFC: STA.l $7E2700,X
#_00BB00: INX
#_00BB01: INX
#_00BB02: INX
#_00BB03: INY
#_00BB04: CPY.b #$02
#_00BB06: BCC .branch00BAF4

#_00BB08: JSL AddSelfAsVector
#_00BB0C: PLY
#_00BB0D: DEY
#_00BB0E: BPL .branch00BAD2

#_00BB10: LDA.w $0EED
#_00BB13: CMP.w $0EEC
#_00BB16: BEQ .exit

#_00BB18: BCS .branch00BACD

.exit
#_00BB1A: PLP
#_00BB1B: RTL

;===================================================================================================

PrepHDMAtypeFromA:
#_00BB1C: PHP
#_00BB1D: REP #$30

#_00BB1F: AND.w #$00FF
#_00BB22: ASL A
#_00BB23: STA.w $0E80

#_00BB26: ASL A
#_00BB27: CLC
#_00BB28: ADC.w $0E80
#_00BB2B: TAY

#_00BB2C: SEP #$20

#_00BB2E: LDA.b #$01
#_00BB30: STA.w $0E80

#_00BB33: PHB
#_00BB34: PHK
#_00BB35: PLB

#_00BB36: LDX.w #$0000

.branch00BB39
#_00BB39: LDA.w data00BDB5,Y
#_00BB3C: AND.w $0E80
#_00BB3F: BNE .branch00BB4B

#_00BB41: TXA
#_00BB42: CLC
#_00BB43: ADC.b #$10
#_00BB45: TAX
#_00BB46: ASL.w $0E80
#_00BB49: BRA .branch00BB39

.branch00BB4B
#_00BB4B: LDA.w data00BDB0,Y
#_00BB4E: STA.w DMAXMODE,X

#_00BB51: LDA.b #$01
#_00BB53: STA.w $0E80

#_00BB56: LDX.w #$0000

.branch00BB59
#_00BB59: LDA.w data00BDB5,Y
#_00BB5C: AND.w $0E80
#_00BB5F: BNE .branch00BB6A

#_00BB61: INX
#_00BB62: INX
#_00BB63: INX
#_00BB64: INX
#_00BB65: ASL.w $0E80
#_00BB68: BRA .branch00BB59

.branch00BB6A
#_00BB6A: LDA.w data00BDB1,Y
#_00BB6D: STA.w $0F0F,X

#_00BB70: LDA.w data00BDB2,Y
#_00BB73: STA.w $0F10,X

#_00BB76: LDA.w data00BDB3,Y
#_00BB79: STA.w $0F11,X

#_00BB7C: LDA.w data00BDB4,Y
#_00BB7F: STA.w $0F12,X

#_00BB82: LDA.w data00BDB5,Y
#_00BB85: ORA.w $0F0E
#_00BB88: STA.w $0F0E
#_00BB8B: PLB
#_00BB8C: PLP
#_00BB8D: RTL

;===================================================================================================

SomeOtherDMAsFromE80:
#_00BB8E: PHP
#_00BB8F: REP #$30
#_00BB91: AND.w #$00FF
#_00BB94: ASL A
#_00BB95: ASL A
#_00BB96: ASL A
#_00BB97: TAY

#_00BB98: SEP #$20
#_00BB9A: LDA.b #$01
#_00BB9C: STA.w $0E80
#_00BB9F: PHB
#_00BBA0: PHK
#_00BBA1: PLB
#_00BBA2: LDX.w #$0000

.branch00BBA5
#_00BBA5: LDA.w DMA_DATA_00BFD7+7,Y
#_00BBA8: AND.w $0E80
#_00BBAB: BNE .branch00BBB7

#_00BBAD: TXA
#_00BBAE: CLC
#_00BBAF: ADC.b #$10
#_00BBB1: TAX
#_00BBB2: ASL.w $0E80
#_00BBB5: BRA .branch00BBA5

.branch00BBB7
#_00BBB7: LDA.w DMA_DATA_00BFD7+0,Y
#_00BBBA: STA.w DMAXMODE,X

#_00BBBD: LDA.w DMA_DATA_00BFD7+1,Y
#_00BBC0: STA.w DMAXPORT,X

#_00BBC3: LDA.w DMA_DATA_00BFD7+2,Y
#_00BBC6: STA.w DMAXADDRL,X

#_00BBC9: LDA.w DMA_DATA_00BFD7+3,Y
#_00BBCC: STA.w DMAXADDRH,X

#_00BBCF: LDA.w DMA_DATA_00BFD7+4,Y
#_00BBD2: STA.w DMAXADDRB,X

#_00BBD5: LDA.w DMA_DATA_00BFD7+5,Y
#_00BBD8: STA.w DMAXSIZEL,X

#_00BBDB: LDA.w DMA_DATA_00BFD7+6,Y
#_00BBDE: STA.w DMAXSIZEH,X

#_00BBE1: LDA.w DMA_DATA_00BFD7+7,Y
#_00BBE4: ORA.w $0F06
#_00BBE7: STA.w $0F06

#_00BBEA: SEP #$30
#_00BBEC: LDX.b #$00
#_00BBEE: STX.w MDMAEN

#_00BBF1: PLB
#_00BBF2: PLP
#_00BBF3: RTL

;===================================================================================================

; TODO some manual DMA
routine00BBF4:
#_00BBF4: REP #$30

#_00BBF6: AND.w #$00FF
#_00BBF9: ASL A
#_00BBFA: ASL A
#_00BBFB: ASL A
#_00BBFC: TAY

#_00BBFD: SEP #$20

#_00BBFF: LDA.w $0F0A
#_00BC02: STA.w $0090

#_00BC05: LDA.w $0F0B
#_00BC08: STA.w $0091

#_00BC0B: LDA.w $0F0C
#_00BC0E: STA.w $0092

#_00BC11: PHB
#_00BC12: PHK
#_00BC13: PLB

#_00BC14: LDA.w DMA_DATA_00BFD7+2,Y
#_00BC17: STA.w $0093

#_00BC1A: LDA.w DMA_DATA_00BFD7+3,Y
#_00BC1D: STA.w $0094

#_00BC20: LDA.w DMA_DATA_00BFD7+4,Y
#_00BC23: STA.w $0095

#_00BC26: LDA.w DMA_DATA_00BFD7+6,Y
#_00BC29: XBA
#_00BC2A: LDA.w DMA_DATA_00BFD7+5,Y

#_00BC2D: PLB

#_00BC2E: REP #$30

#_00BC30: TAY

.copy_next
#_00BC31: LDA.b [$93],Y
#_00BC33: STA.b [$90],Y

#_00BC35: DEY
#_00BC36: DEY
#_00BC37: BPL .copy_next

#_00BC39: SEP #$30
#_00BC3B: RTL

;===================================================================================================

routine00BC3C:
#_00BC3C: STA.w $0E80
#_00BC3F: STX.w $0E82

; use slot to calculate VRAM buffer address
#_00BC42: TXA
#_00BC43: ASL A
#_00BC44: ASL A
#_00BC45: ASL A
#_00BC46: XBA
#_00BC47: AND.w #$3800
#_00BC4A: STA.w $0093

#_00BC4D: LDA.w #$007F
#_00BC50: STA.w $0095

#_00BC53: LDX.w #$0000

#_00BC56: LDA.w $0E80,X

.loop
#_00BC59: ASL A
#_00BC5A: ASL A
#_00BC5B: ASL A

#_00BC5C: PHA

#_00BC5D: ASL A
#_00BC5E: XBA

#_00BC5F: SEP #$20

#_00BC61: AND.b #$0F
#_00BC63: CLC
#_00BC64: ADC.w $0EFD
#_00BC67: STA.w $0092

#_00BC6A: REP #$20

#_00BC6C: PLA
#_00BC6D: XBA
#_00BC6E: AND.w #$7800
#_00BC71: ORA.w #$8000
#_00BC74: STA.w $0090

#_00BC77: LDY.w #$0000

.copy_next
#_00BC7A: LDA.b [$90],Y
#_00BC7C: STA.b [$93],Y

#_00BC7E: INY
#_00BC7F: INY
#_00BC80: CPY.w #$0800
#_00BC83: BCC .copy_next

#_00BC85: LDA.w $0093
#_00BC88: CLC
#_00BC89: ADC.w #$0800
#_00BC8C: STA.w $0093

#_00BC8F: INX
#_00BC90: CPX.w #$0002
#_00BC93: BCS .done

#_00BC95: LDA.w $0E80,X
#_00BC98: AND.w #$00FF
#_00BC9B: BNE .loop

;---------------------------------------------------------------------------------------------------

.done
#_00BC9D: LDA.w $0E82
#_00BCA0: ASL A
#_00BCA1: ASL A
#_00BCA2: PHA

#_00BCA3: XBA
#_00BCA4: AND.w #$1C00
#_00BCA7: STA.w $0F07

#_00BCAA: PLA
#_00BCAB: ASL A
#_00BCAC: XBA
#_00BCAD: AND.w #$3800
#_00BCB0: STA.w DMA0ADDRL

#_00BCB3: LDA.w #$1000
#_00BCB6: STA.w DMA0SIZEL

#_00BCB9: SEP #$20

#_00BCBB: LDA.b #$7F
#_00BCBD: STA.w DMA0ADDRB

#_00BCC0: LDA.b #$01
#_00BCC2: STA.w DMA0MODE

#_00BCC5: LDA.b #VMDATA
#_00BCC7: STA.w DMA0PORT

#_00BCCA: LDA.b #$01
#_00BCCC: STA.w $0F06

#_00BCCF: LDA.b #$00
#_00BCD1: STA.w MDMAEN

#_00BCD4: JSL AddSelfAsVector

#_00BCD8: REP #$20
#_00BCDA: RTL

;===================================================================================================

routine00BCDB:
#_00BCDB: STA.w $0E80

#_00BCDE: TXA
#_00BCDF: ASL A
#_00BCE0: ASL A
#_00BCE1: ASL A
#_00BCE2: ASL A
#_00BCE3: ASL A
#_00BCE4: CLC
#_00BCE5: ADC.w #$2500
#_00BCE8: STA.w $0093

#_00BCEB: LDA.w #$007E
#_00BCEE: STA.w $0095

#_00BCF1: SEP #$20

#_00BCF3: LDA.b #Palettes>>16
#_00BCF5: STA.w $0092

#_00BCF8: REP #$20

#_00BCFA: LDA.w $0E80
#_00BCFD: ASL A
#_00BCFE: ASL A
#_00BCFF: ASL A
#_00BD00: ASL A
#_00BD01: ASL A
#_00BD02: CLC
#_00BD03: ADC.w #Palettes
#_00BD06: STA.w $0090

#_00BD09: LDX.w #$0000

.next_chunk
#_00BD0C: LDY.w #$0000

.next_color
#_00BD0F: LDA.b [$90],Y
#_00BD11: STA.b [$93],Y

#_00BD13: INY
#_00BD14: INY
#_00BD15: CPY.w #$0020
#_00BD18: BCC .next_color

#_00BD1A: LDA.w $0093
#_00BD1D: CLC
#_00BD1E: ADC.w #$0080
#_00BD21: STA.w $0093

#_00BD24: INX
#_00BD25: CPX.w #$0002
#_00BD28: BCC .next_chunk

;---------------------------------------------------------------------------------------------------

#_00BD2A: LDA.w #$2200
#_00BD2D: STA.w DMA1MODE

#_00BD30: LDA.w #$2600
#_00BD33: STA.w DMA1ADDRL

#_00BD36: LDA.w #$007E
#_00BD39: STA.w DMA1ADDRB

#_00BD3C: LDA.w #$0100
#_00BD3F: STA.w DMA1SIZEL

#_00BD42: SEP #$20

#_00BD44: LDA.b #$80
#_00BD46: STA.w $0F09

#_00BD49: LDA.b #$02
#_00BD4B: STA.w $0F06

#_00BD4E: LDA.b #$00
#_00BD50: STA.w MDMAEN

#_00BD53: JSL AddSelfAsVector

#_00BD57: REP #$20
#_00BD59: RTL

;===================================================================================================

SetGameProgressFlag:
#_00BD5A: PHP
#_00BD5B: SEP #$30

#_00BD5D: TAY
#_00BD5E: LSR A
#_00BD5F: LSR A
#_00BD60: LSR A
#_00BD61: TAX

#_00BD62: TYA
#_00BD63: AND.b #$07
#_00BD65: TAY

#_00BD66: LDA.b #$00
#_00BD68: SEC

.shift
#_00BD69: ROL A

#_00BD6A: DEY
#_00BD6B: BPL .shift

#_00BD6D: ORA.w $07C0,X
#_00BD70: STA.w $07C0,X

#_00BD73: PLP
#_00BD74: RTL

;===================================================================================================

ClearGameProgressFlag:
#_00BD75: PHP
#_00BD76: SEP #$30

#_00BD78: TAY
#_00BD79: LSR A
#_00BD7A: LSR A
#_00BD7B: LSR A
#_00BD7C: TAX

#_00BD7D: TYA
#_00BD7E: AND.b #$07
#_00BD80: TAY

#_00BD81: LDA.b #$00
#_00BD83: SEC

.shift
#_00BD84: ROL A

#_00BD85: DEY
#_00BD86: BPL .shift

#_00BD88: EOR.b #$FF
#_00BD8A: AND.w $07C0,X
#_00BD8D: STA.w $07C0,X

#_00BD90: PLP
#_00BD91: RTL

;===================================================================================================

CheckGameProgressFlag:
#_00BD92: PHP
#_00BD93: SEP #$30

#_00BD95: TAY
#_00BD96: LSR A
#_00BD97: LSR A
#_00BD98: LSR A
#_00BD99: TAX

#_00BD9A: TYA
#_00BD9B: AND.b #$07
#_00BD9D: TAY

#_00BD9E: LDA.b #$00
#_00BDA0: SEC

.shift
#_00BDA1: ROL A

#_00BDA2: DEY
#_00BDA3: BPL .shift

#_00BDA5: AND.w $07C0,X
#_00BDA8: BEQ .fail

#_00BDAA: PLP
#_00BDAB: CLC

#_00BDAC: RTL

.fail
#_00BDAD: PLP
#_00BDAE: SEC

#_00BDAF: RTL

;===================================================================================================

; TODO put these together
data00BDB0:
#_00BDB0: db $02 ; DMA type $43x0

data00BDB1:
#_00BDB1: db $0F

data00BDB2:
#_00BDB2: db $00

data00BDB3:
#_00BDB3: db $28

data00BDB4:
#_00BDB4: db $7E

data00BDB5:
#_00BDB5: db $08,$02,$10,$00,$28,$7E,$08,$02
#_00BDBD: db $12,$00,$27,$7E,$40,$02,$14,$5D
#_00BDC5: db $BE,$00,$20,$02,$10,$79,$BE,$00
#_00BDCD: db $10,$02,$10,$80,$BE,$00,$10,$02
#_00BDD5: db $10,$B1,$BE,$00,$10,$02,$10,$E2
#_00BDDD: db $BE,$00,$10,$02,$10,$13,$BF,$00
#_00BDE5: db $10,$02,$10,$44,$BF,$00,$10,$02
#_00BDED: db $10,$75,$BF,$00,$10,$02,$10,$A6
#_00BDF5: db $BF,$00,$10,$02,$12,$35,$BE,$00
#_00BDFD: db $40,$02,$0E,$0A,$BE,$00,$10,$02
#_00BE05: db $0E,$00,$28,$7E,$08,$81,$00,$00
#_00BE0D: db $16,$00,$00,$15,$FC,$01,$0C,$00
#_00BE15: db $00,$0C,$04,$00,$0C,$08,$00,$0C
#_00BE1D: db $0C,$00,$0C,$10,$00,$0C,$14,$00
#_00BE25: db $0C,$18,$00,$0C,$1C,$00,$10,$20
#_00BE2D: db $00,$3C,$24,$00,$08,$FC,$00,$00
#_00BE35: db $81,$00,$00,$03,$00,$00,$07,$FC
#_00BE3D: db $01,$0D,$00,$00,$0C,$04,$00,$0C
#_00BE45: db $08,$00,$0C,$0C,$00,$0C,$10,$00
#_00BE4D: db $0C,$14,$00,$4C,$18,$00,$34,$1C
#_00BE55: db $00,$01,$1B,$00,$0B,$1A,$00,$00

; TODO some HDMA table?
#_00BE5D: db $81,$00,$00,$7E,$00,$00,$10,$80
#_00BE65: db $00,$0C,$84,$00,$0C,$88,$00,$0C
#_00BE6D: db $8C,$00,$0C,$90,$00,$0C,$94,$00
#_00BE75: db $14,$98,$00,$00,$81,$F8,$00,$07
#_00BE7D: db $F8,$00,$00,$81,$80,$00,$0E,$80
#_00BE85: db $00,$07,$F1,$00,$07,$F2,$00,$07
#_00BE8D: db $F3,$00,$07,$F4,$00,$07,$F5,$00
#_00BE95: db $07,$F6,$00,$07,$F7,$00,$07,$F8
#_00BE9D: db $00,$07,$F9,$00,$07,$FA,$00,$07
#_00BEA5: db $FB,$00,$07,$FC,$00,$07,$FD,$00
#_00BEAD: db $07,$FE,$00,$00,$81,$80,$00,$15
#_00BEB5: db $80,$00,$06,$EA,$00,$06,$EC,$00
#_00BEBD: db $06,$EE,$00,$06,$F0,$00,$06,$F2
#_00BEC5: db $00,$06,$F4,$00,$06,$F6,$00,$06
#_00BECD: db $F8,$00,$06,$FA,$00,$06,$FC,$00
#_00BED5: db $06,$FE,$00,$06,$00,$00,$06,$02
#_00BEDD: db $00,$06,$04,$00,$00,$81,$80,$00
#_00BEE5: db $1C,$80,$00,$05,$E3,$00,$05,$E6
#_00BEED: db $00,$05,$E9,$00,$05,$EC,$00,$05
#_00BEF5: db $EF,$00,$05,$F2,$00,$05,$F5,$00
#_00BEFD: db $05,$F8,$00,$05,$FB,$00,$05,$FE
#_00BF05: db $00,$05,$01,$00,$05,$04,$00,$05
#_00BF0D: db $07,$00,$05,$0A,$00,$00,$81,$80
#_00BF15: db $00,$23,$80,$00,$04,$DC,$00,$04
#_00BF1D: db $E0,$00,$04,$E4,$00,$04,$E8,$00
#_00BF25: db $04,$EC,$00,$04,$F0,$00,$04,$F4
#_00BF2D: db $00,$04,$F8,$00,$04,$FC,$00,$04
#_00BF35: db $00,$00,$04,$04,$00,$04,$08,$00
#_00BF3D: db $04,$0C,$00,$04,$10,$00,$00,$81
#_00BF45: db $80,$00,$2A,$80,$00,$03,$D5,$00
#_00BF4D: db $03,$DA,$00,$03,$DF,$00,$03,$E4
#_00BF55: db $00,$03,$E9,$00,$03,$EE,$00,$03
#_00BF5D: db $F3,$00,$03,$F8,$00,$03,$FD,$00
#_00BF65: db $03,$02,$00,$03,$07,$00,$03,$0C
#_00BF6D: db $00,$03,$11,$00,$03,$16,$00,$00
#_00BF75: db $81,$80,$00,$31,$80,$00,$02,$CE
#_00BF7D: db $00,$02,$D4,$00,$02,$DA,$00,$02
#_00BF85: db $E0,$00,$02,$E6,$00,$02,$EC,$00
#_00BF8D: db $02,$F2,$00,$02,$F8,$00,$02,$FE
#_00BF95: db $00,$02,$04,$00,$02,$0A,$00,$02
#_00BF9D: db $10,$00,$02,$16,$00,$02,$1C,$00
#_00BFA5: db $00,$81,$80,$00,$38,$80,$00,$01
#_00BFAD: db $C7,$00,$01,$CE,$00,$01,$D5,$00
#_00BFB5: db $01,$DC,$00,$01,$E3,$00,$01,$EA
#_00BFBD: db $00,$01,$F1,$00,$01,$F8,$00,$01
#_00BFC5: db $FF,$00,$01,$06,$00,$01,$0D,$00
#_00BFCD: db $01,$14,$00,$01,$1D,$00,$01,$22
#_00BFD5: db $00

data00BFD6:
#_00BFD6: db $00

;===================================================================================================

; TODO I think some of these are HDMA actually...
DMA_DATA_00BFD7:
; TODO is this unused? it makes no sense
.type_00
#_00BFD7: db $00, OAMDATA ; transfer type, port
#_00BFD9: dl $000800 ; A bus address
#_00BFDC: dw $2002 ; size
#_00BFDE: db $80 ; channel

.type_01
#_00BFDF: db $01, VMDATA ; transfer type, port
#_00BFE1: dl $109000 ; A bus address
#_00BFE4: dw $0200 ; size
#_00BFE6: db $01 ; channel

.type_02
#_00BFE7: db $01, VMDATA ; transfer type, port
#_00BFE9: dl $108000 ; A bus address
#_00BFEC: dw $1000 ; size
#_00BFEE: db $01 ; channel

.type_03
#_00BFEF: db $01, VMDATA ; transfer type, port
#_00BFF1: dl $27E000 ; A bus address
#_00BFF4: dw $1000 ; size
#_00BFF6: db $01 ; channel

.type_04
#_00BFF7: db $01, VMDATA ; transfer type, port
#_00BFF9: dl $118000 ; A bus address
#_00BFFC: dw $8000 ; size
#_00BFFE: db $01 ; channel

.type_05
#_00BFFF: db $01, VMDATA ; transfer type, port
#_00C001: dl $128000 ; A bus address
#_00C004: dw $8000 ; size
#_00C006: db $01 ; channel

.type_06
#_00C007: db $01, VMDATA ; transfer type, port
#_00C009: dl $138000 ; A bus address
#_00C00C: dw $8000 ; size
#_00C00E: db $01 ; channel

.type_07
#_00C00F: db $01, VMDATA ; transfer type, port
#_00C011: dl $148000 ; A bus address
#_00C014: dw $8000 ; size
#_00C016: db $01 ; channel

.type_08
#_00C017: db $01, VMDATA ; transfer type, port
#_00C019: dl $158000 ; A bus address
#_00C01C: dw $8000 ; size
#_00C01E: db $01 ; channel

.type_09
#_00C01F: db $01, VMDATA ; transfer type, port
#_00C021: dl $168000 ; A bus address
#_00C024: dw $8000 ; size
#_00C026: db $01 ; channel

.type_0A
#_00C027: db $01, VMDATA ; transfer type, port
#_00C029: dl $118000 ; A bus address
#_00C02C: dw $8000 ; size
#_00C02E: db $01 ; channel

.type_0B
#_00C02F: db $01, VMDATA ; transfer type, port
#_00C031: dl $128000 ; A bus address
#_00C034: dw $8000 ; size
#_00C036: db $01 ; channel

.type_0C
#_00C037: db $01, VMDATA ; transfer type, port
#_00C039: dl $174000 ; A bus address
#_00C03C: dw $1000 ; size
#_00C03E: db $01 ; channel

.type_0D
#_00C03F: db $01, VMDATA ; transfer type, port
#_00C041: dl $178000 ; A bus address
#_00C044: dw $1000 ; size
#_00C046: db $01 ; channel

.type_0E
#_00C047: db $01, VMDATA ; transfer type, port
#_00C049: dl $184000 ; A bus address
#_00C04C: dw $1000 ; size
#_00C04E: db $01 ; channel

.type_0F
#_00C04F: db $01, VMDATA ; transfer type, port
#_00C051: dl $188000 ; A bus address
#_00C054: dw $1000 ; size
#_00C056: db $01 ; channel

.type_10
#_00C057: db $01, VMDATA ; transfer type, port
#_00C059: dl $194000 ; A bus address
#_00C05C: dw $1000 ; size
#_00C05E: db $01 ; channel

.type_11
#_00C05F: db $01, VMDATA ; transfer type, port
#_00C061: dl $198000 ; A bus address
#_00C064: dw $1000 ; size
#_00C066: db $01 ; channel

.type_12
#_00C067: db $01, VMDATA ; transfer type, port
#_00C069: dl $174000 ; A bus address
#_00C06C: dw $1000 ; size
#_00C06E: db $01 ; channel

.type_13
#_00C06F: db $01, VMDATA ; transfer type, port
#_00C071: dl $178000 ; A bus address
#_00C074: dw $1000 ; size
#_00C076: db $01 ; channel

.type_14
#_00C077: db $00, CGDATA ; transfer type, port
#_00C079: dl $078000 ; A bus address
#_00C07C: dw $0020 ; size
#_00C07E: db $02 ; channel

.type_15
#_00C07F: db $00, CGDATA ; transfer type, port
#_00C081: dl $078020 ; A bus address
#_00C084: dw $0020 ; size
#_00C086: db $02 ; channel

.type_16
#_00C087: db $00, CGDATA ; transfer type, port
#_00C089: dl $078040 ; A bus address
#_00C08C: dw $0020 ; size
#_00C08E: db $02 ; channel

.type_17
#_00C08F: db $00, CGDATA ; transfer type, port
#_00C091: dl $078060 ; A bus address
#_00C094: dw $0020 ; size
#_00C096: db $02 ; channel

.type_18
#_00C097: db $00, CGDATA ; transfer type, port
#_00C099: dl $078080 ; A bus address
#_00C09C: dw $0020 ; size
#_00C09E: db $02 ; channel

.type_19
#_00C09F: db $00, CGDATA ; transfer type, port
#_00C0A1: dl $0780A0 ; A bus address
#_00C0A4: dw $0020 ; size
#_00C0A6: db $02 ; channel

.type_1A
#_00C0A7: db $00, CGDATA ; transfer type, port
#_00C0A9: dl $0780C0 ; A bus address
#_00C0AC: dw $0020 ; size
#_00C0AE: db $02 ; channel

.type_1B
#_00C0AF: db $00, CGDATA ; transfer type, port
#_00C0B1: dl $0780E0 ; A bus address
#_00C0B4: dw $0020 ; size
#_00C0B6: db $02 ; channel

.type_1C
#_00C0B7: db $01, VMDATA ; transfer type, port
#_00C0B9: dl $10A000 ; A bus address
#_00C0BC: dw $0500 ; size
#_00C0BE: db $01 ; channel

.type_1D
#_00C0BF: db $01, VMDATA ; transfer type, port
#_00C0C1: dl $109800 ; A bus address
#_00C0C4: dw $0800 ; size
#_00C0C6: db $01 ; channel

.type_1E
#_00C0C7: db $00, CGDATA ; transfer type, port
#_00C0C9: dl $1CB040 ; A bus address
#_00C0CC: dw $0100 ; size
#_00C0CE: db $02 ; channel

.type_1F
#_00C0CF: db $00, CGDATA ; transfer type, port
#_00C0D1: dl $078000 ; A bus address
#_00C0D4: dw $0100 ; size
#_00C0D6: db $04 ; channel

.type_20
#_00C0D7: db $00, WMDATA ; transfer type, port
#_00C0D9: dl $078100 ; A bus address
#_00C0DC: dw $0020 ; size
#_00C0DE: db $04 ; channel

.type_21
#_00C0DF: db $00, WMDATA ; transfer type, port
#_00C0E1: dl $078120 ; A bus address
#_00C0E4: dw $0020 ; size
#_00C0E6: db $04 ; channel

.type_22
#_00C0E7: db $00, WMDATA ; transfer type, port
#_00C0E9: dl $078140 ; A bus address
#_00C0EC: dw $0020 ; size
#_00C0EE: db $04 ; channel

.type_23
#_00C0EF: db $00, WMDATA ; transfer type, port
#_00C0F1: dl $078160 ; A bus address
#_00C0F4: dw $0020 ; size
#_00C0F6: db $04 ; channel

.type_24
#_00C0F7: db $00, WMDATA ; transfer type, port
#_00C0F9: dl $078180 ; A bus address
#_00C0FC: dw $0020 ; size
#_00C0FE: db $04 ; channel

.type_25
#_00C0FF: db $00, WMDATA ; transfer type, port
#_00C101: dl $0781A0 ; A bus address
#_00C104: dw $0020 ; size
#_00C106: db $04 ; channel

.type_26
#_00C107: db $00, WMDATA ; transfer type, port
#_00C109: dl $0781C0 ; A bus address
#_00C10C: dw $0020 ; size
#_00C10E: db $04 ; channel

.type_27
#_00C10F: db $00, WMDATA ; transfer type, port
#_00C111: dl $0781E0 ; A bus address
#_00C114: dw $0020 ; size
#_00C116: db $04 ; channel

.type_28
#_00C117: db $00, WMDATA ; transfer type, port
#_00C119: dl $078200 ; A bus address
#_00C11C: dw $0020 ; size
#_00C11E: db $04 ; channel

.type_29
#_00C11F: db $00, WMDATA ; transfer type, port
#_00C121: dl $078220 ; A bus address
#_00C124: dw $0020 ; size
#_00C126: db $04 ; channel

.type_2A
#_00C127: db $00, WMDATA ; transfer type, port
#_00C129: dl $078240 ; A bus address
#_00C12C: dw $0020 ; size
#_00C12E: db $04 ; channel

.type_2B
#_00C12F: db $00, WMDATA ; transfer type, port
#_00C131: dl $078260 ; A bus address
#_00C134: dw $0020 ; size
#_00C136: db $04 ; channel

.type_2C
#_00C137: db $00, WMDATA ; transfer type, port
#_00C139: dl $078280 ; A bus address
#_00C13C: dw $0020 ; size
#_00C13E: db $04 ; channel

.type_2D
#_00C13F: db $00, WMDATA ; transfer type, port
#_00C141: dl $0782A0 ; A bus address
#_00C144: dw $0020 ; size
#_00C146: db $04 ; channel

.type_2E
#_00C147: db $00, WMDATA ; transfer type, port
#_00C149: dl $0782C0 ; A bus address
#_00C14C: dw $0020 ; size
#_00C14E: db $04 ; channel

.type_2F
#_00C14F: db $00, WMDATA ; transfer type, port
#_00C151: dl $0782E0 ; A bus address
#_00C154: dw $0020 ; size
#_00C156: db $04 ; channel

.type_30
#_00C157: db $00, WMDATA ; transfer type, port
#_00C159: dl $078300 ; A bus address
#_00C15C: dw $0020 ; size
#_00C15E: db $04 ; channel

.type_31
#_00C15F: db $00, WMDATA ; transfer type, port
#_00C161: dl $078320 ; A bus address
#_00C164: dw $0020 ; size
#_00C166: db $04 ; channel

.type_32
#_00C167: db $00, WMDATA ; transfer type, port
#_00C169: dl $078340 ; A bus address
#_00C16C: dw $0020 ; size
#_00C16E: db $04 ; channel

.type_33
#_00C16F: db $00, WMDATA ; transfer type, port
#_00C171: dl $078360 ; A bus address
#_00C174: dw $0020 ; size
#_00C176: db $04 ; channel

.type_34
#_00C177: db $00, WMDATA ; transfer type, port
#_00C179: dl $078380 ; A bus address
#_00C17C: dw $0020 ; size
#_00C17E: db $04 ; channel

.type_35
#_00C17F: db $00, WMDATA ; transfer type, port
#_00C181: dl $0783A0 ; A bus address
#_00C184: dw $0020 ; size
#_00C186: db $04 ; channel

.type_36
#_00C187: db $00, WMDATA ; transfer type, port
#_00C189: dl $0783C0 ; A bus address
#_00C18C: dw $0020 ; size
#_00C18E: db $04 ; channel

.type_37
#_00C18F: db $00, WMDATA ; transfer type, port
#_00C191: dl $0783E0 ; A bus address
#_00C194: dw $0020 ; size
#_00C196: db $04 ; channel

;===================================================================================================

routine00C197:
#_00C197: SEP #$30

#_00C199: STZ.w NMITIMEN
#_00C19C: STZ.w $0F00

#_00C19F: LDA.b #$80
#_00C1A1: STA.w INIDISP
#_00C1A4: STA.w $0F43

#_00C1A7: LDA.b #$00
#_00C1A9: PHA
#_00C1AA: PLB

#_00C1AB: JSL PPUSettings_00C409
#_00C1AF: JSL ZeroALOTofVRAM
#_00C1B3: JSL EmptyFirst4KBin7F0000
#_00C1B7: JSL routine008F57

; $4000 in VRAM
#_00C1BB: LDA.b #$00
#_00C1BD: STA.w VMADDL
#_00C1C0: LDA.b #$20
#_00C1C2: STA.w VMADDH

#_00C1C5: LDA.b #$02
#_00C1C7: JSL SomeOtherDMAsFromE80
#_00C1CB: STA.w MDMAEN

; $8000 in VRAM
#_00C1CE: LDA.b #$00
#_00C1D0: STA.w VMADDL
#_00C1D3: LDA.b #$40
#_00C1D5: STA.w VMADDH

#_00C1D8: LDA.w $0710
#_00C1DB: ASL A
#_00C1DC: TAX

#_00C1DD: LDA.l DungeonThemes+0,X
#_00C1E1: CLC
#_00C1E2: ADC.b #$04
#_00C1E4: JSL SomeOtherDMAsFromE80
#_00C1E8: STA.w MDMAEN

; $7800 in VRAM
#_00C1EB: LDA.b #$00
#_00C1ED: STA.w VMADDL
#_00C1F0: LDA.b #$3C
#_00C1F2: STA.w VMADDH

#_00C1F5: LDA.b #$1C
#_00C1F7: JSL SomeOtherDMAsFromE80
#_00C1FB: STA.w MDMAEN

; $6800 in VRAM
#_00C1FE: LDA.b #$00
#_00C200: STA.w VMADDL
#_00C203: LDA.b #$34
#_00C205: STA.w VMADDH

#_00C208: LDA.b #$1D
#_00C20A: JSL SomeOtherDMAsFromE80
#_00C20E: STA.w MDMAEN

; $0000 in VRAM
#_00C211: LDA.b #$00
#_00C213: STA.w VMADDL
#_00C216: LDA.b #$00
#_00C218: STA.w VMADDH

#_00C21B: LDA.b #$03
#_00C21D: JSL SomeOtherDMAsFromE80
#_00C221: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_00C224: STZ.w $0F06

#_00C227: JSL routine0F9AE1

; TODO wram address?
#_00C22B: LDA.b #$00
#_00C22D: STA.w $0F0A
#_00C230: LDA.b #$25
#_00C232: STA.w $0F0B
#_00C235: LDA.b #$7E
#_00C237: STA.w $0F0C

#_00C23A: LDA.b #$1F
#_00C23C: JSL routine00BBF4

; TODO wram address?
#_00C240: LDA.b #$40
#_00C242: STA.w $0F0A
#_00C245: LDA.b #$25
#_00C247: STA.w $0F0B
#_00C24A: LDA.b #$7E
#_00C24C: STA.w $0F0C

#_00C24F: LDA.w $0710
#_00C252: ASL A
#_00C253: TAX
#_00C254: LDA.l DungeonThemes+1,X
#_00C258: CLC
#_00C259: ADC.b #$20
#_00C25B: JSL routine00BBF4

;---------------------------------------------------------------------------------------------------

#_00C25F: LDA.b #$80
#_00C261: STA.w CGADD

#_00C264: LDA.b #$1E
#_00C266: JSL SomeOtherDMAsFromE80
#_00C26A: STA.w MDMAEN

#_00C26D: LDA.b #$C0
#_00C26F: STA.w CGADD

#_00C272: LDA.b #$1E
#_00C274: JSL SomeOtherDMAsFromE80
#_00C278: STA.w MDMAEN

; TODO wram address?
#_00C27B: LDA.b #$00
#_00C27D: STA.w $0F0A
#_00C280: LDA.b #$26
#_00C282: STA.w $0F0B
#_00C285: LDA.b #$7E
#_00C287: STA.w $0F0C

#_00C28A: LDA.b #$1E
#_00C28C: JSL routine00BBF4

; TODO wram address?
#_00C290: LDA.b #$80
#_00C292: STA.w $0F0A
#_00C295: LDA.b #$26
#_00C297: STA.w $0F0B
#_00C29A: LDA.b #$7E
#_00C29C: STA.w $0F0C

#_00C29F: LDA.b #$1E
#_00C2A1: JSL routine00BBF4

;---------------------------------------------------------------------------------------------------

#_00C2A5: REP #$20
#_00C2A7: SEP #$10

.wait_for_vblank
#_00C2A9: LDX.w RDNMI
#_00C2AC: BPL .wait_for_vblank

#_00C2AE: LDX.b #$00

.manual_delay
#_00C2B0: INX
#_00C2B1: BNE .manual_delay

#_00C2B3: STZ.w OAMADDR

#_00C2B6: SEP #$20

#_00C2B8: LDA.b #$00
#_00C2BA: JSL SomeOtherDMAsFromE80

#_00C2BE: LDX.b #$80
#_00C2C0: STX.w MDMAEN

#_00C2C3: STZ.w $0F06

#_00C2C6: LDX.w $0710

#_00C2C9: LDA.l MusicTracksTable,X
#_00C2CD: JSL Write_to_APU_transferrable

#_00C2D1: LDA.b #$03
#_00C2D3: JSL PrepHDMAtypeFromA

#_00C2D7: JSL routine00A14C

#_00C2DB: JSL EmptyFirst4KBin7F0000

#_00C2DF: LDA.b #$F8
#_00C2E1: STA.w $0F53
#_00C2E4: STA.w BG2VOFS
#_00C2E7: STZ.w $0F54
#_00C2EA: STZ.w BG2VOFS

#_00C2ED: LDA.b #$FF
#_00C2EF: STA.w $0F4F
#_00C2F2: STA.w BG1VOFS
#_00C2F5: STZ.w $0F50
#_00C2F8: STZ.w BG1VOFS

;---------------------------------------------------------------------------------------------------

routine00C2FB:
#_00C2FB: LDA.w $040F
#_00C2FE: AND.b #$F0
#_00C300: CMP.b #$90
#_00C302: BCC .branch00C30C

#_00C304: LDA.b #$80
#_00C306: SEC
#_00C307: SBC.w $040F
#_00C30A: AND.b #$70

.branch00C30C
#_00C30C: LSR A
#_00C30D: LSR A
#_00C30E: LSR A
#_00C30F: LSR A
#_00C310: STA.w $0714

#_00C313: LDA.b #$00
#_00C315: STA.w $0F7F
#_00C318: STA.w $0F80

#_00C31B: LDA.b #$81
#_00C31D: STA.w NMITIMEN
#_00C320: STA.w $0F00

#_00C323: CLI

#_00C324: JSL routine009853

#_00C328: LDA.b #$02
#_00C32A: JSL InitializeTextBoxToSizeForNewMessage

#_00C32E: LDA.b #$04
#_00C330: LDX.b #$00
#_00C332: STA.w $0EDC
#_00C335: STX.w $0EDF
#_00C338: STZ.w $0EDA
#_00C33B: JSL routine0091FD

#_00C33F: JSL BrightenScreen

#_00C343: LDA.b #$04
#_00C345: LDX.b #$00
#_00C347: LDY.b #$04
#_00C349: JSL routine0091A1
#_00C34D: JSL routine00C51A

;===================================================================================================
; TODO auto movement?
routine00C351:
#_00C351: REP #$20

#_00C353: JSL Dungeon_UpdateAutoMapper

#_00C357: LDA.w $070C
#_00C35A: STA.w $070E

#_00C35D: JSL UpdateVisitedSquares
#_00C361: JSR routine00CB4A

#_00C364: STZ.w $05A6

.next
#_00C367: DEC.w $071A
#_00C36A: BPL .branch00C378

#_00C36C: LDA.w #$0008
#_00C36F: STA.w $071A

#_00C372: LDA.w #$F0C0
#_00C375: STA.w $0F2D

.branch00C378
#_00C378: DEC.w $0EF5

#_00C37B: LDA.w $0EF5
#_00C37E: AND.w #$00FF
#_00C381: BNE .branch00C386

#_00C383: JSR routine00D38A

.branch00C386
#_00C386: JSL AddSelfAsVector
#_00C38A: JSR routine00D484

#_00C38D: LDA.w $0F2B
#_00C390: BEQ .skip

#_00C392: BIT.w #$0080
#_00C395: BEQ .branch00C3AD

#_00C397: JSL routine00D3DA
#_00C39B: JSL GameMenu

#_00C39F: LDA.w $0C4F
#_00C3A2: BMI .branch00C3C3

#_00C3A4: JSR routine00C805
#_00C3A7: JSL Dungeon_UpdateAutoMapper

#_00C3AB: BRA .next

;---------------------------------------------------------------------------------------------------

.branch00C3AD
#_00C3AD: BIT.w #$0F30
#_00C3B0: BEQ .skip

#_00C3B2: LDA.w #$0008
#_00C3B5: STA.w $071A

#_00C3B8: LDA.w $0F2B
#_00C3BB: JSR TryToMoveOrTurn
#_00C3BE: BCS .branch00C3C3

#_00C3C0: JMP .next

;---------------------------------------------------------------------------------------------------

.branch00C3C3
#_00C3C3: LDA.w #$00FD ; SONG FD
#_00C3C6: JSL Write_to_APU_transferrable

#_00C3CA: SEP #$30

#_00C3CC: LDA.b #$04
#_00C3CE: LDX.b #$00
#_00C3D0: LDY.b #$01
#_00C3D2: JSL routine009508
#_00C3D6: JSL DarkenScreen

#_00C3DA: LDA.b #$FF
#_00C3DC: STA.w $0F7F

#_00C3DF: LDA.b #$10
#_00C3E1: STA.w $0F77

#_00C3E4: LDA.b #$0C
#_00C3E6: STA.w $0F7C

#_00C3E9: STZ.w MDMAEN
#_00C3EC: STZ.w $0F05
#_00C3EF: STZ.w $0F06

#_00C3F2: STZ.w HDMAEN
#_00C3F5: STZ.w $0F0D
#_00C3F8: STZ.w $0F0E

#_00C3FB: STZ.w $05A6
#_00C3FE: STZ.w $05A7

#_00C401: JSL routine008F57

#_00C405: RTL

;---------------------------------------------------------------------------------------------------

.skip
#_00C406: JMP .next

;===================================================================================================
; TODO more descriptive name
PPUSettings_00C409:
#_00C409: PHP

#_00C40A: SEP #$10
#_00C40C: REP #$20

#_00C40E: LDA.w #$2100
#_00C411: TCD

;---------------------------------------------------------------------------------------------------
; PPU pointers
;---------------------------------------------------------------------------------------------------
#_00C412: LDX.b #$60
#_00C414: STX.b OBSEL
#_00C416: STX.w $0F44

#_00C419: LDA.w #$0000
#_00C41C: STA.b OAMADDR

#_00C41E: LDX.b #$09
#_00C420: STX.b BGMODE
#_00C422: STX.w $0F45

#_00C425: LDX.b #$00
#_00C427: STX.b MOSAIC
#_00C429: STX.w $0F46

#_00C42C: LDX.b #$38
#_00C42E: STX.b BG1SC
#_00C430: STX.w $0F47

#_00C433: LDX.b #$29
#_00C435: STX.b BG2SC
#_00C437: STX.w $0F48

#_00C43A: LDX.b #$3C
#_00C43C: STX.b BG3SC
#_00C43E: STX.w $0F49

#_00C441: LDX.b #$34
#_00C443: STX.b BG4SC
#_00C445: STX.w $0F4A

#_00C448: LDX.b #$43
#_00C44A: STX.b BG12NBA
#_00C44C: STX.w $0F4B

#_00C44F: LDX.b #$22
#_00C451: STX.b BG34NBA
#_00C453: STX.w $0F4C

;---------------------------------------------------------------------------------------------------
; Background scrolls
;---------------------------------------------------------------------------------------------------
#_00C456: LDX.b #$00

#_00C458: STX.b BG1HOFS
#_00C45A: STX.w $0F4D
#_00C45D: STX.b BG1HOFS
#_00C45F: STX.w $0F4E

#_00C462: STX.b BG1VOFS
#_00C464: STX.w $0F4F
#_00C467: STX.b BG1VOFS
#_00C469: STX.w $0F50

#_00C46C: STX.b BG2HOFS
#_00C46E: STX.w $0F51
#_00C471: STX.b BG2HOFS
#_00C473: STX.w $0F52

#_00C476: STX.b BG2VOFS
#_00C478: STX.w $0F53
#_00C47B: STX.b BG2VOFS
#_00C47D: STX.w $0F54

#_00C480: STX.b BG3HOFS
#_00C482: STX.w $0F55
#_00C485: STX.b BG3HOFS
#_00C487: STX.w $0F56

#_00C48A: STX.b BG3VOFS
#_00C48C: STX.w $0F57
#_00C48F: STX.b BG3VOFS
#_00C491: STX.w $0F58

#_00C494: STX.b BG4HOFS
#_00C496: STX.w $0F59
#_00C499: STX.b BG4HOFS
#_00C49B: STX.w $0F5A

#_00C49E: STX.b BG4VOFS
#_00C4A0: STX.w $0F5B
#_00C4A3: STX.b BG4VOFS
#_00C4A5: STX.w $0F50

;---------------------------------------------------------------------------------------------------
; Display settings
;---------------------------------------------------------------------------------------------------
#_00C4A8: LDX.b #$80
#_00C4AA: STX.b VMAIN
#_00C4AC: STX.w $0F5D

#_00C4AF: LDX.b #$1F
#_00C4B1: STX.b TM
#_00C4B3: STX.w $0F74

#_00C4B6: LDX.b #$1D
#_00C4B8: STX.w $0F75

#_00C4BB: LDX.b #$03
#_00C4BD: STX.b TS
#_00C4BF: STX.w $0F76

#_00C4C2: LDX.b #$10
#_00C4C4: STX.w $0F77

#_00C4C7: LDX.b #$00
#_00C4C9: STX.b TMW
#_00C4CB: STX.w $0F78

#_00C4CE: STX.b TSW
#_00C4D0: STX.w $0F79

#_00C4D3: STX.b COLDATA
#_00C4D5: STX.w $0F7D

#_00C4D8: STX.b SETINI

#_00C4DA: LDX.b #$02
#_00C4DC: STX.b CGWSEL
#_00C4DE: STX.w $0F7A

#_00C4E1: LDX.b #$50
#_00C4E3: STX.b CGADSUB
#_00C4E5: STX.w $0F7B

#_00C4E8: LDX.b #$0C
#_00C4EA: STX.w $0F7C

;---------------------------------------------------------------------------------------------------
; CPU registers
;---------------------------------------------------------------------------------------------------
#_00C4ED: LDA.w #$4200
#_00C4F0: TCD

#_00C4F1: LDX.b #$FF
#_00C4F3: STX.b JOYPADIO

#_00C4F5: LDA.w #$0000
#_00C4F8: STA.b HTIMEL
#_00C4FA: STA.w $0F01

#_00C4FD: STA.b VTIMEL
#_00C4FF: STA.w $0F03

#_00C502: LDX.b #$00

#_00C504: STX.b MDMAEN
#_00C506: STX.w $0F05
#_00C509: STX.w $0F06

#_00C50C: STX.b HDMAEN
#_00C50E: STX.w $0F0D
#_00C511: STX.w $0F0E

#_00C514: LDA.w #$0000
#_00C517: TCD

#_00C518: PLP
#_00C519: RTL

;===================================================================================================

routine00C51A:
#_00C51A: PHP

#_00C51B: REP #$30

#_00C51D: LDY.w #$000A
#_00C520: LDX.w #$0014
#_00C523: LDA.w #$01C8
#_00C526: STA.w $1A60,X

#_00C529: LDA.w #$00F0
#_00C52C: STA.w $1AA0,X

#_00C52F: LDA.w #$0011
#_00C532: STA.w $0000,X

#_00C535: SEP #$20

#_00C537: LDA.b #$80
#_00C539: STA.w $1A00,Y

#_00C53C: REP #$30

#_00C53E: LDA.w #$0007
#_00C541: LDY.w #$000A
#_00C544: LDX.w #$0014
#_00C547: STA.w $0040,X

#_00C54A: SEP #$20

#_00C54C: LDA.b #$80
#_00C54E: STA.w $1A20,Y

#_00C551: JSL routine00A63C
#_00C555: JSL routine00A840
#_00C559: JSL UpdateDirTilemap

#_00C55D: PLP
#_00C55E: RTL

;===================================================================================================

HideTheMenu:
#_00C55F: PHP
#_00C560: REP #$30

#_00C562: LDA.w #$0006
#_00C565: LDY.w #$000A
#_00C568: LDX.w #$0014
#_00C56B: STA.w $0040,X

#_00C56E: SEP #$20

#_00C570: LDA.b #$80
#_00C572: STA.w $1A20,Y

#_00C575: JSL BringUpAMenu
#_00C579: JSL UpdateMoonPhase

#_00C57D: PLP
#_00C57E: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00C57F:
#_00C57F: PHP

#_00C580: JSL routine00C76F

.loop
#_00C584: REP #$30

#_00C586: LDA.w $070C
#_00C589: AND.w #$3F7F
#_00C58C: STA.w $070C

#_00C58F: JSR routine00C634

.didnt_press_anything
#_00C592: DEC.w $071A
#_00C595: BPL .branch00C5A3

#_00C597: LDA.w #$0004
#_00C59A: STA.w $071A

#_00C59D: LDA.w #$F0FF
#_00C5A0: STA.w $0F2D

.branch00C5A3
#_00C5A3: JSL AddSelfAsVectorAndMakeSpace

#_00C5A7: LDA.w $0F2B
#_00C5AA: AND.w #$1F00
#_00C5AD: BEQ .didnt_press_anything

;---------------------------------------------------------------------------------------------------

#_00C5AF: AND.w #$0F00
#_00C5B2: BEQ .pressed_start

#_00C5B4: SEP #$20
#_00C5B6: XBA
#_00C5B7: LSR A
#_00C5B8: BCS .pressed_right

#_00C5BA: LSR A
#_00C5BB: BCS .pressed_left

#_00C5BD: LSR A
#_00C5BE: BCS .pressed_down

.pressed_up
#_00C5C0: INC.w $070D
#_00C5C3: BRA .loop

.pressed_right
#_00C5C5: INC.w $070C
#_00C5C8: BRA .loop

.pressed_left
#_00C5CA: DEC.w $070C
#_00C5CD: BRA .loop

.pressed_down
#_00C5CF: DEC.w $070D
#_00C5D2: BRA .loop

;---------------------------------------------------------------------------------------------------

.pressed_start
#_00C5D4: JSL routine00C7A1
#_00C5D8: JSL UpdateVisitedSquares

#_00C5DC: JSL routine009853
#_00C5E0: JSR routine00CB4A

#_00C5E3: SEP #$30

#_00C5E5: LDA.b #$04
#_00C5E7: LDX.b #$00
#_00C5E9: LDY.b #$01
#_00C5EB: JSL GraduallyFadeStuff

#_00C5EF: LDX.b #$1C
#_00C5F1: STX.w $0F75

#_00C5F4: JSL DisplayUnderworldMap

#_00C5F8: STZ.w $0F4D
#_00C5FB: STZ.w $0F4E

#_00C5FE: LDA.b #$FF
#_00C600: STA.w $0F4F
#_00C603: STZ.w $0F50

; TODO WRAM pointer?
#_00C606: LDA.b #$A0
#_00C608: STA.w $0F0A
#_00C60B: LDA.b #$25
#_00C60D: STA.w $0F0B
#_00C610: LDA.b #$7E
#_00C612: STA.w $0F0C

#_00C615: LDA.b #$19
#_00C617: JSL routine00BBF4

#_00C61B: LDA.b #$04
#_00C61D: LDX.b #$00
#_00C61F: LDY.b #$01
#_00C621: JSL routine0091A1
#_00C625: JSL routine00A840

#_00C629: LDX.b #$1D
#_00C62B: STX.w $0F75

#_00C62E: JSL Dungeon_UpdateAutoMapper

#_00C632: PLP
#_00C633: RTS

;===================================================================================================

routine00C634:
#_00C634: LDA.w $070C
#_00C637: TAX

#_00C638: AND.w #$00F0
#_00C63B: LSR A
#_00C63C: LSR A
#_00C63D: LSR A
#_00C63E: LSR A
#_00C63F: CLC
#_00C640: ADC.w #$2001
#_00C643: STA.w $0106

#_00C646: TXA
#_00C647: AND.w #$000F
#_00C64A: CLC
#_00C64B: ADC.w #$2001
#_00C64E: STA.w $0108

#_00C651: LDA.w #$20CF
#_00C654: STA.w $010A
#_00C657: TXA

#_00C658: XBA
#_00C659: AND.w #$00F0
#_00C65C: LSR A
#_00C65D: LSR A
#_00C65E: LSR A
#_00C65F: LSR A
#_00C660: CLC
#_00C661: ADC.w #$2001
#_00C664: STA.w $010C

#_00C667: TXA
#_00C668: XBA
#_00C669: AND.w #$000F
#_00C66C: CLC
#_00C66D: ADC.w #$2001
#_00C670: STA.w $010E

#_00C673: LDA.w #$3DD4
#_00C676: STA.w $0102

#_00C679: LDA.w #$0005
#_00C67C: STA.w $0104

#_00C67F: LDA.w #$0001
#_00C682: STA.w $0100

#_00C685: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00C686:
#_00C686: PHP
#_00C687: SEP #$30

#_00C689: LDA.w $0710
#_00C68C: INC A
#_00C68D: CMP.b #$18
#_00C68F: BCC .branch00C693

#_00C691: LDA.b #$00

.branch00C693
#_00C693: STA.w $0710

#_00C696: STZ.w $0E00

.branch00C699
#_00C699: LDX.w $0E00

#_00C69C: LDA.l data00C72E,X
#_00C6A0: CLC
#_00C6A1: ADC.b #$04
#_00C6A3: JSL PrepHDMAtypeFromA

#_00C6A7: LDA.b #$04
#_00C6A9: JSL Do19XXVectorsATimes

#_00C6AD: SEP #$20
#_00C6AF: LDA.w $0E00
#_00C6B2: INC A
#_00C6B3: STA.w $0E00
#_00C6B6: CMP.b #$0C
#_00C6B8: BCC .branch00C699

;---------------------------------------------------------------------------------------------------

#_00C6BA: JSR Disable_BG2_OnMainScreen
#_00C6BD: JSR routine00C805

#_00C6C0: LDA.b #$04
#_00C6C2: LDX.b #$00
#_00C6C4: STA.w $0EDC
#_00C6C7: STX.w $0EDF

#_00C6CA: LDY.b #$10
#_00C6CC: STY.w $0EDA

#_00C6CF: JSL routine0091FD
#_00C6D3: JSL AddSelfAsVectorAndMakeSpace

#_00C6D7: LDA.l data00C739
#_00C6DB: CLC
#_00C6DC: ADC.b #$04
#_00C6DE: JSL PrepHDMAtypeFromA

#_00C6E2: JSL AddSelfAsVectorAndMakeSpace

#_00C6E6: LDA.b #$F8
#_00C6E8: STA.w $0F53
#_00C6EB: STA.w BG2VOFS

#_00C6EE: LDA.b #$00
#_00C6F0: STA.w $0F54
#_00C6F3: STA.w BG2VOFS

#_00C6F6: JSR Enable_BG2_OnMainScreen

;---------------------------------------------------------------------------------------------------

#_00C6F9: LDA.b #$0B
#_00C6FB: STA.w $0E00

.next_wait
#_00C6FE: LDX.w $0E00

#_00C701: LDA.l data00C72E,X
#_00C705: CLC
#_00C706: ADC.b #$04
#_00C708: JSL PrepHDMAtypeFromA

#_00C70C: LDA.b #$04
#_00C70E: JSL Do19XXVectorsATimes

#_00C712: SEP #$20

#_00C714: LDA.w $0E00
#_00C717: DEC A
#_00C718: STA.w $0E00
#_00C71B: BPL .next_wait

;---------------------------------------------------------------------------------------------------

#_00C71D: LDA.w $0F0D
#_00C720: AND.b #$EF
#_00C722: STA.w $0F0D
#_00C725: STA.w $0F0E

#_00C728: JSL AddSelfAsVectorAndMakeSpace

#_00C72C: PLP
#_00C72D: RTS

;---------------------------------------------------------------------------------------------------

data00C72E:
#_00C72E: db $02,$04,$06,$07
#_00C732: db $05,$00,$01,$00
#_00C736: db $02,$04,$06

data00C739:
#_00C739: db $07

;===================================================================================================

Disable_BG2_OnMainScreen:
#_00C73A: LDA.w $0F74
#_00C73D: AND.b #$FD
#_00C73F: STA.w TM
#_00C742: STA.w $0F74

#_00C745: RTS

;===================================================================================================

Enable_BG2_OnMainScreen:
#_00C746: LDA.w $0F74
#_00C749: ORA.b #$02
#_00C74B: STA.w TM
#_00C74E: STA.w $0F74

#_00C751: RTS

;===================================================================================================

routine00C752:
#_00C752: REP #$20

#_00C754: STA.w $0A22

#_00C757: LDA.w #$0000
#_00C75A: STA.w $0A24

#_00C75D: LDA.w #$3DC4
#_00C760: STA.w $0A1A

#_00C763: STZ.w $0EEF

#_00C766: JSL routine03837C
#_00C76A: JSL AddSelfAsVector

#_00C76E: RTL

;===================================================================================================

routine00C76F:
#_00C76F: PHP

#_00C770: JSL routine00D3DA

#_00C774: REP #$20

#_00C776: LDA.w #$0002
#_00C779: JSL InitializeTextBoxToSizeForNewMessage
#_00C77D: JSL routine00A056

#_00C781: LDA.w #$0003
#_00C784: STA.w $0A26

#_00C787: LDA.w #$0020
#_00C78A: STA.w $0A2C

#_00C78D: LDA.w #$0018
#_00C790: STA.w $0A1E

#_00C793: LDA.w #$000C
#_00C796: STA.w $0A20

#_00C799: LDA.w #$0002
#_00C79C: STA.w $0A1C

#_00C79F: PLP
#_00C7A0: RTL

;===================================================================================================

routine00C7A1:
#_00C7A1: JSL UpdateDialogBox
#_00C7A5: JSL Dungeon_UpdateAutoMapper

#_00C7A9: RTL

;===================================================================================================

routine00C7AA:
#_00C7AA: PHP
#_00C7AB: SEP #$30

#_00C7AD: LDA.b #$04
#_00C7AF: LDX.b #$00
#_00C7B1: LDY.b #$02
#_00C7B3: JSL GraduallyFadeStuff

#_00C7B7: JSR Disable_BG2_OnMainScreen
#_00C7BA: JSR routine00C805

#_00C7BD: LDA.b #$04
#_00C7BF: LDX.b #$00
#_00C7C1: STA.w $0EDC
#_00C7C4: STX.w $0EDF
#_00C7C7: STZ.w $0EDA

#_00C7CA: JSL routine0091FD
#_00C7CE: JSL AddSelfAsVectorAndMakeSpace

#_00C7D2: LDA.b #$F8
#_00C7D4: STA.w $0F53
#_00C7D7: STA.w BG2VOFS
#_00C7DA: STZ.w $0F54
#_00C7DD: STZ.w BG2VOFS

#_00C7E0: LDA.b #$FF
#_00C7E2: STA.w $0F4F
#_00C7E5: STA.w BG1VOFS
#_00C7E8: STZ.w $0F50
#_00C7EB: STZ.w BG1VOFS

#_00C7EE: JSR Enable_BG2_OnMainScreen
#_00C7F1: JSL UpdateVisitedSquares
#_00C7F5: JSL routine009853

#_00C7F9: LDA.b #$04
#_00C7FB: LDX.b #$00
#_00C7FD: LDY.b #$02
#_00C7FF: JSL routine0091A1

#_00C803: PLP
#_00C804: RTL

;===================================================================================================

routine00C805:
#_00C805: PHP
#_00C806: SEP #$30

#_00C808: LDA.b #$00

.next_transfer
#_00C80A: STA.w $0E00
#_00C80D: LDA.w $0710
#_00C810: ASL A
#_00C811: TAX

#_00C812: LDA.l DungeonThemes+0,X
#_00C816: CLC
#_00C817: ADC.b #$04
#_00C819: JSL SomeOtherDMAsFromE80

#_00C81D: LDA.w $0E00
#_00C820: ASL A
#_00C821: ASL A
#_00C822: ASL A
#_00C823: ASL A
#_00C824: CLC
#_00C825: ADC.w DMA0ADDRH
#_00C828: STA.w DMA0ADDRH

#_00C82B: LDA.b #$10
#_00C82D: STA.w DMA0SIZEH

#_00C830: LDA.w $0E00
#_00C833: ASL A
#_00C834: ASL A
#_00C835: ASL A
#_00C836: CLC
#_00C837: ADC.b #$40
#_00C839: STA.w $0F08

#_00C83C: LDA.b #$00
#_00C83E: STA.w $0F07
#_00C841: JSL AddSelfAsVectorAndMakeSpace

#_00C845: LDA.w $0E00
#_00C848: INC A
#_00C849: CMP.b #$08
#_00C84B: BCC .next_transfer

#_00C84D: LDA.b #$40
#_00C84F: STA.w $0F0A

#_00C852: LDA.b #$25
#_00C854: STA.w $0F0B

#_00C857: LDA.b #$7E
#_00C859: STA.w $0F0C

#_00C85C: LDA.w $0710
#_00C85F: ASL A
#_00C860: TAX

#_00C861: LDA.l DungeonThemes+1,X
#_00C865: CLC
#_00C866: ADC.b #$20
#_00C868: JSL routine00BBF4
#_00C86C: JSL AddSelfAsVectorAndMakeSpace

#_00C870: PLP
#_00C871: RTS

;===================================================================================================

TryToMoveOrTurn:
#_00C872: PHP ; checks for dpad and shoulder buttons

#_00C873: SEP #$30

#_00C875: XBA ; get BYsSUDLR
#_00C876: STA.w $0450 ; save it

#_00C879: XBA ; back to AXlr
#_00C87A: LSR A ; shift to bottom nibble
#_00C87B: LSR A
#_00C87C: LSR A
#_00C87D: LSR A
#_00C87E: AND.b #$03 ; mask to just shoulder buttons
#_00C880: ORA.w $0450 ; add in dpad
#_00C883: STA.w $0450

#_00C886: AND.b #$07 ; get just directions
#_00C888: BNE .turn_about

#_00C88A: JSL routine009BDE ; If no directions pressed
#_00C88E: BCC .move_forward

#_00C890: JSR Dungeon_BonkWall

#_00C893: PLP
#_00C894: CLC
#_00C895: RTS

;---------------------------------------------------------------------------------------------------

.move_forward
#_00C896: TXA
#_00C897: ORA.b #$80
#_00C899: STA.w $0712

#_00C89C: LDA.b #$FF
#_00C89E: STA.w $0719

#_00C8A1: JSL routine00983C

#_00C8A5: LDA.b #$FE
#_00C8A7: JSL CheckGameProgressFlag

#_00C8AB: LDA.b #$04
#_00C8AD: BCS .branch00C8B1

#_00C8AF: LDA.b #$0C

.branch00C8B1
#_00C8B1: REP #$20

#_00C8B3: AND.w #$00FF
#_00C8B6: JSL Do19XXVectorsATimes

#_00C8BA: SEP #$20

;---------------------------------------------------------------------------------------------------

.turn_about
#_00C8BC: JSR Dungeon_Movement

#_00C8BF: LDA.w $0450
#_00C8C2: BEQ .branch00C8DC

#_00C8C4: CMP.b #$03
#_00C8C6: BEQ .branch00C8D6

#_00C8C8: CMP.b #$02
#_00C8CA: BEQ .branch00C8D1

#_00C8CC: JSR Dungeon_AdjustPOVTurningRight
#_00C8CF: BRA .branch00C902

.branch00C8D1
#_00C8D1: JSR Dungeon_AdjustPOVTurningLeft
#_00C8D4: BRA .branch00C902

.branch00C8D6
#_00C8D6: JSL routine00CAD3
#_00C8DA: BRA .branch00C902

.branch00C8DC
#_00C8DC: JSR routine00CB4A
#_00C8DF: JSR routine00CB52
#_00C8E2: BCC .branch00C8EB

#_00C8E4: LDA.w $0C4F
#_00C8E7: BMI .exit

#_00C8E9: BRA .stairs_or_exit

;---------------------------------------------------------------------------------------------------

.branch00C8EB
#_00C8EB: LDA.w $0711
#_00C8EE: AND.b #$0F
#_00C8F0: CMP.b #$07
#_00C8F2: BCC .warp_trap_or_turn

#_00C8F4: CMP.b #$0A
#_00C8F6: BCC .stairs_or_exit

.warp_trap_or_turn
#_00C8F8: JSL routine009853

.stairs_or_exit
#_00C8FC: JSR routine00CC71
#_00C8FF: JSR Dungeon_StatusAndMovementDrain

;---------------------------------------------------------------------------------------------------

.branch00C902
#_00C902: JSL Dungeon_UpdateAutoMapper
#_00C906: JSR routine00CC64
#_00C909: JSR routine00CDCB
#_00C90C: BCS .exit

#_00C90E: JSR routine00D304

#_00C911: STZ.w $0712

#_00C914: PLP
#_00C915: CLC

#_00C916: RTS

.exit
#_00C917: PLP
#_00C918: SEC

#_00C919: RTS

;===================================================================================================

Dungeon_BonkWall:
#_00C91A: JSL routine00983C

#_00C91E: LDA.b #$0A ; SFX 0A
#_00C920: JSL Write_to_APU_transferrable

#_00C924: REP #$30

#_00C926: LDA.w #$0008
#_00C929: JSL Do19XXVectorsATimes
#_00C92D: JSL routine009853

#_00C931: RTS

;===================================================================================================

Dungeon_Movement:
#_00C932: LDX.w $040D
#_00C935: STX.w $040E

#_00C938: LDA.w $0450
#_00C93B: LSR A
#_00C93C: BCS .right_turn

#_00C93E: LSR A
#_00C93F: BCS .left_turn

#_00C941: LSR A
#_00C942: BCS .turn_around

.move_forward
#_00C944: JSR UpdateUWCoordinates
#_00C947: JSL UpdateVisitedSquares

#_00C94B: LDX.b #$80
#_00C94D: LDY.b #$90
#_00C94F: LDA.b #$29
#_00C951: JSR SomeDungeon_Check

#_00C954: LDX.b #$00
#_00C956: BRA .update_last_move

.right_turn
#_00C958: LDX.b #$90
#_00C95A: LDY.b #$A0
#_00C95C: LDA.b #$2A
#_00C95E: JSR SomeDungeon_Check

#_00C961: LDX.b #$01

#_00C963: LDA.w $040D
#_00C966: INC A
#_00C967: BRA .update_current_dir

.left_turn
#_00C969: LDX.b #$80
#_00C96B: LDY.b #$A0
#_00C96D: LDA.b #$2A
#_00C96F: JSR SomeDungeon_Check

#_00C972: LDX.b #$02

#_00C974: LDA.w $040D
#_00C977: DEC A
#_00C978: BRA .update_current_dir

.turn_around
#_00C97A: LDX.b #$90
#_00C97C: LDY.b #$A0
#_00C97E: LDA.b #$2A
#_00C980: JSR SomeDungeon_Check

#_00C983: LDX.b #$03

#_00C985: LDA.w $040D
#_00C988: INC A

.update_current_dir
#_00C989: AND.b #$03
#_00C98B: STA.w $040D

.update_last_move
#_00C98E: STX.w $0450

#_00C991: CPX.b #$00
#_00C993: BEQ .branch00C99D

#_00C995: LDA.w $040D
#_00C998: CMP.w $040E
#_00C99B: BEQ .exit

.branch00C99D
#_00C99D: LDA.w $0EF2
#_00C9A0: BPL .exit

#_00C9A2: JSL UpdateUWLabel

.exit
#_00C9A6: RTS

;===================================================================================================

UpdateUWCoordinates:
#_00C9A7: LDA.w $040D
#_00C9AA: ASL A
#_00C9AB: TAY

#_00C9AC: LDA.w .movement_change+0,Y
#_00C9AF: CLC
#_00C9B0: ADC.w $070C
#_00C9B3: STA.w $070C

#_00C9B6: LDA.w .movement_change+1,Y
#_00C9B9: CLC
#_00C9BA: ADC.w $070D
#_00C9BD: STA.w $070D

#_00C9C0: RTS

.movement_change
#_00C9C1: db $00, $FF
#_00C9C3: db $01, $00
#_00C9C5: db $00, $01
#_00C9C7: db $FF, $00

;===================================================================================================

Dungeon_AdjustPOVTurningRight:
#_00C9C9: STZ.w $0E00

.loop
#_00C9CC: SEP #$20

#_00C9CE: LDA.b #$0C
#_00C9D0: JSR routine00CAF4

#_00C9D3: INC.w $0E00

#_00C9D6: REP #$20

#_00C9D8: LDA.w $0F51
#_00C9DB: CLC
#_00C9DC: ADC.w #$0004
#_00C9DF: STA.w $0F51

#_00C9E2: JSL AddSelfAsVector

#_00C9E6: LDA.w $0F51
#_00C9E9: CMP.w #$0010
#_00C9EC: BCC .loop

#_00C9EE: LDA.w #$FFFF
#_00C9F1: JSL routine009C0D

#_00C9F5: LDA.w #$01F0
#_00C9F8: STA.w $0F51

.branch00C9FB
#_00C9FB: JSL AddSelfAsVector

#_00C9FF: LDA.w $0F51
#_00CA02: CLC
#_00CA03: ADC.w #$0008
#_00CA06: AND.w #$01FF
#_00CA09: STA.w $0F51

#_00CA0C: CMP.w #$0030
#_00CA0F: BNE .branch00C9FB

#_00CA11: JSL routine009853

#_00CA15: LDA.w #$01EC
#_00CA18: STA.w $0F51

#_00CA1B: STZ.w $0E00

.branch00CA1E
#_00CA1E: LDA.w $0F51
#_00CA21: CLC
#_00CA22: ADC.w #$0004
#_00CA25: STA.w $0F51

#_00CA28: JSL AddSelfAsVector

#_00CA2C: SEP #$20

#_00CA2E: LDA.b #$04
#_00CA30: JSR routine00CAF4

#_00CA33: INC.w $0E00

#_00CA36: REP #$20

#_00CA38: LDA.w $0F51
#_00CA3B: AND.w #$01FF
#_00CA3E: BNE .branch00CA1E

#_00CA40: STA.w $0F51

#_00CA43: SEP #$20

#_00CA45: STZ.w $0F06

#_00CA48: RTS

;===================================================================================================

Dungeon_AdjustPOVTurningLeft:
#_00CA49: STZ.w $0E00

#_00CA4C: REP #$20

#_00CA4E: LDA.w #$0200
#_00CA51: STA.w $0F51

.branch00CA54
#_00CA54: SEP #$20

#_00CA56: LDA.b #$0C
#_00CA58: JSR routine00CAF4

#_00CA5B: INC.w $0E00

#_00CA5E: REP #$20

#_00CA60: LDA.w $0F51
#_00CA63: SEC
#_00CA64: SBC.w #$0004
#_00CA67: STA.w $0F51

#_00CA6A: JSL AddSelfAsVector

#_00CA6E: LDA.w $0F51
#_00CA71: CMP.w #$01F0
#_00CA74: BNE .branch00CA54

#_00CA76: LDA.w #$0000
#_00CA79: JSL routine009C0D

#_00CA7D: LDA.w #$0030
#_00CA80: STA.w $0F51

.branch00CA83
#_00CA83: JSL AddSelfAsVector

#_00CA87: LDA.w $0F51
#_00CA8A: SEC
#_00CA8B: SBC.w #$0008
#_00CA8E: AND.w #$01FF
#_00CA91: STA.w $0F51
#_00CA94: BNE .branch00CA9C

#_00CA96: LDA.w #$0200
#_00CA99: STA.w $0F51

.branch00CA9C
#_00CA9C: CMP.w #$01F0
#_00CA9F: BNE .branch00CA83

#_00CAA1: JSL routine009853

#_00CAA5: LDA.w #$0014
#_00CAA8: STA.w $0F51
#_00CAAB: STZ.w $0E00

.branch00CAAE
#_00CAAE: LDA.w $0F51
#_00CAB1: SEC
#_00CAB2: SBC.w #$0004
#_00CAB5: STA.w $0F51

#_00CAB8: JSL AddSelfAsVector

#_00CABC: SEP #$20

#_00CABE: LDA.b #$04
#_00CAC0: JSR routine00CAF4

#_00CAC3: INC.w $0E00

#_00CAC6: REP #$20

#_00CAC8: LDA.w $0F51
#_00CACB: BNE .branch00CAAE

#_00CACD: SEP #$20

#_00CACF: STZ.w $0F06

#_00CAD2: RTS

;===================================================================================================

routine00CAD3:
#_00CAD3: PHP
#_00CAD4: SEP #$30

#_00CAD6: JSR Dungeon_AdjustPOVTurningRight
#_00CAD9: JSL Dungeon_UpdateAutoMapper

#_00CADD: LDA.w $040D
#_00CAE0: INC A
#_00CAE1: AND.b #$03
#_00CAE3: STA.w $040D

#_00CAE6: LDX.b #$90
#_00CAE8: LDY.b #$A0
#_00CAEA: LDA.b #$2A
#_00CAEC: JSR SomeDungeon_Check

#_00CAEF: JSR Dungeon_AdjustPOVTurningRight

#_00CAF2: PLP
#_00CAF3: RTL

;===================================================================================================

routine00CAF4:
#_00CAF4: PHP
#_00CAF5: SEP #$30

#_00CAF7: TAY

#_00CAF8: LDA.w $0710
#_00CAFB: ASL A
#_00CAFC: TAX

#_00CAFD: TYA
#_00CAFE: CLC
#_00CAFF: ADC.l DungeonThemes+0,X
#_00CB03: JSL SomeOtherDMAsFromE80

#_00CB07: LDA.w $0E00
#_00CB0A: ASL A
#_00CB0B: ASL A
#_00CB0C: ASL A
#_00CB0D: ASL A
#_00CB0E: CLC
#_00CB0F: ADC.w DMA0ADDRH
#_00CB12: ADC.b #$40
#_00CB14: STA.w DMA0ADDRH

#_00CB17: LDA.b #$10
#_00CB19: STA.w DMA0SIZEH

#_00CB1C: LDA.w $0E00
#_00CB1F: ASL A
#_00CB20: ASL A
#_00CB21: ASL A
#_00CB22: CLC
#_00CB23: ADC.b #$60
#_00CB25: STA.w $0F08

#_00CB28: LDA.b #$00
#_00CB2A: STA.w $0F07

#_00CB2D: PLP
#_00CB2E: RTS

;===================================================================================================

routine00CB2F:
#_00CB2F: PHP
#_00CB30: SEP #$20

#_00CB32: STZ.w $0E00

.next
#_00CB35: LDA.b #$04
#_00CB37: JSR routine00CAF4

#_00CB3A: JSL AddSelfAsVector

#_00CB3E: INC.w $0E00

#_00CB41: LDA.w $0E00
#_00CB44: CMP.b #$04
#_00CB46: BCC .next

#_00CB48: PLP
#_00CB49: RTL

;===================================================================================================

routine00CB4A:
#_00CB4A: JSL routine009BDE

#_00CB4E: STA.w $0711

#_00CB51: RTS

;===================================================================================================

routine00CB52:
#_00CB52: PHP

#_00CB53: LDA.w $0711
#_00CB56: AND.b #$0F

; See if it actually has a vector in the event table
#_00CB58: CMP.b #$0C
#_00CB5A: BCC .fail

; Check for being an elevator
#_00CB5C: BNE LookForAlwaysThereNPC

#_00CB5E: SEP #$20

#_00CB60: LDA.w $0710
#_00CB63: PHA

#_00CB64: REP #$30

#_00CB66: LDA.w #ElevatorShaftID
#_00CB69: LDX.w #$0003
#_00CB6C: JSR FindAssociatedRoomEvent_Moving
#_00CB6F: BCS .no_shaft_found

#_00CB71: TXA
#_00CB72: AND.w #$00FF
#_00CB75: STA.w $0717

#_00CB78: JSL routine00D3DA
#_00CB7C: JSL routine03B5FE

#_00CB80: SEP #$20

#_00CB82: STZ.w $0F4E
#_00CB85: STZ.w $0F4D

#_00CB88: LDA.b #$FF
#_00CB8A: STA.w $0F4F
#_00CB8D: STZ.w $0F50

;---------------------------------------------------------------------------------------------------

.no_shaft_found
#_00CB90: JSR routine00D2C8

#_00CB93: SEP #$20

#_00CB95: LDA.w $0712
#_00CB98: AND.b #$7F
#_00CB9A: STA.w $0712

#_00CB9D: JSL routine00C7AA
#_00CBA1: JSL routine00A840
#_00CBA5: JSL Dungeon_UpdateAutoMapper

#_00CBA9: SEP #$30

#_00CBAB: PLA
#_00CBAC: CMP.w $0710
#_00CBAF: BEQ .fail

#_00CBB1: LDX.w $0710
#_00CBB4: LDA.l MusicTracksTable,X
#_00CBB8: JSL Write_to_APU_transferrable

.fail
#_00CBBC: PLP
#_00CBBD: CLC

#_00CBBE: RTS

;===================================================================================================

LookForAlwaysThereNPC:
#_00CBBF: REP #$30

#_00CBC1: LDA.w #DungeonRoomNPCLocations
#_00CBC4: LDX.w #$0004
#_00CBC7: JSR FindAssociatedRoomEvent_Moving
#_00CBCA: BCS .branch00CC1A

#_00CBCC: STX.w $0A12

#_00CBCF: SEP #$20

#_00CBD1: LDA.w $0711
#_00CBD4: CMP.b #$0F
#_00CBD6: BEQ .branch00CBEE

#_00CBD8: CMP.b #$0E
#_00CBDA: BEQ .branch00CBE0

#_00CBDC: JSL routine009853

.branch00CBE0
#_00CBE0: JSL routine00D3DA

#_00CBE4: LDA.b #$03
#_00CBE6: JSL InitializeTextBoxToSizeForNewMessage
#_00CBEA: JSL routine00A056

.branch00CBEE
#_00CBEE: JSR routine00D24C

#_00CBF1: LDA.b #$00
#_00CBF3: STA.w $0F80

#_00CBF6: STZ.w $0F4D
#_00CBF9: STZ.w $0F4E

#_00CBFC: LDA.b #$FF
#_00CBFE: STA.w $0F4F
#_00CC01: STZ.w $0F50

#_00CC04: LDA.w $0711
#_00CC07: CMP.b #$0F
#_00CC09: BEQ .EXIT_CLC_00CC61

#_00CC0B: JSL routine00C7A1

#_00CC0F: SEP #$30

#_00CC11: LDA.w $0C4F
#_00CC14: BEQ .branch00CC1A

#_00CC16: BPL .branch00CC1D

#_00CC18: BMI .EXIT_SEC_00CC5E

.branch00CC1A
#_00CC1A: JSR routine00D2C8

.branch00CC1D
#_00CC1D: JSL GetCurrentRoomFloorAndDungeonID

#_00CC21: SEP #$30
#_00CC23: LDA.w $0EFE
#_00CC26: BEQ .branch00CC35

#_00CC28: LDX.w $0710
#_00CC2B: LDA.l MusicTracksTable,X
#_00CC2F: JSL Write_to_APU_transferrable
#_00CC33: BRA .branch00CC45

.branch00CC35
#_00CC35: LDA.w $05BA
#_00CC38: BEQ .branch00CC45

#_00CC3A: LDX.w $0710
#_00CC3D: LDA.l MusicTracksTable,X
#_00CC41: JSL Write_to_APU

.branch00CC45
#_00CC45: LDA.w $0712
#_00CC48: AND.b #$7F
#_00CC4A: STA.w $0712
#_00CC4D: LDA.w $0EEF
#_00CC50: BEQ .EXIT_CLC_00CC61

#_00CC52: JSL routine00C7AA
#_00CC56: JSL routine00A840
#_00CC5A: JSL UpdateDirTilemap

.EXIT_SEC_00CC5E
#_00CC5E: PLP
#_00CC5F: SEC
#_00CC60: RTS

.EXIT_CLC_00CC61
#_00CC61: PLP
#_00CC62: CLC
#_00CC63: RTS

;===================================================================================================

routine00CC64:
#_00CC64: LDA.w $040D
#_00CC67: CMP.w $040E
#_00CC6A: BEQ .exit

#_00CC6C: JSL UpdateDirTilemap

.exit
#_00CC70: RTS

;===================================================================================================

routine00CC71:
#_00CC71: LDA.w $0450
#_00CC74: BNE .exit

#_00CC76: JSL routine00A68C

.exit
#_00CC7A: RTS

;===================================================================================================

Dungeon_StatusAndMovementDrain:
#_00CC7B: PHP
#_00CC7C: REP #$30

#_00CC7E: INC.w $0724

#_00CC81: LDY.w #$0000

.next_party_member
#_00CC84: STY.w $0720

#_00CC87: LDX.w $0700,Y
#_00CC8A: BMI .done_statuses

#_00CC8C: STX.w $0715

#_00CC8F: LDA.w $1002,X
#_00CC92: BIT.w #$C000
#_00CC95: BNE .dont_damage

#_00CC97: BIT.w #$1000
#_00CC9A: BNE .paralyzed_or_cursed

#_00CC9C: BIT.w #$0800
#_00CC9F: BNE .poisoned

#_00CCA1: BIT.w #$0100
#_00CCA4: BNE .paralyzed_or_cursed

#_00CCA6: BRA .dont_damage

.poisoned
#_00CCA8: LDA.w $0724
#_00CCAB: AND.w #$0003
#_00CCAE: BEQ .do_damage

#_00CCB0: BRA .dont_damage

.paralyzed_or_cursed
#_00CCB2: LDA.w $0724
#_00CCB5: AND.w #$0001
#_00CCB8: BNE .dont_damage

.do_damage
#_00CCBA: LDA.w #$0001
#_00CCBD: JSR RemoveSomeHP

.dont_damage
#_00CCC0: LDY.w $0720
#_00CCC3: INY
#_00CCC4: INY
#_00CCC5: CPY.w #$000C
#_00CCC8: BCC .next_party_member

;---------------------------------------------------------------------------------------------------

.done_statuses
#_00CCCA: JSL RunMovementDrain
#_00CCCE: BCC .still_have_mag_left

#_00CCD0: JSL routine00C76F

#_00CCD4: LDA.w #$0047
#_00CCD7: JSL routine00C752
#_00CCDB: JSL routine00C7A1

.still_have_mag_left
#_00CCDF: JSL routine00CD8C

#_00CCE3: PLP
#_00CCE4: RTS

;===================================================================================================

RunMovementDrain:
#_00CCE5: PHP
#_00CCE6: REP #$30

#_00CCE8: LDA.w $0409
#_00CCEB: ORA.w $040B
#_00CCEE: BNE .nonzero_mag

#_00CCF0: LDY.w #$0000

.next_demon_hp
#_00CCF3: STY.w $0720

#_00CCF6: LDX.w $0700,Y
#_00CCF9: BMI .done_taking_hp

#_00CCFB: CPX.w #$0180
#_00CCFE: BCC .not_demon_hp

#_00CD00: STX.w $0715

#_00CD03: LDA.w #$0001
#_00CD06: JSR RemoveSomeHP

.not_demon_hp
#_00CD09: LDY.w $0720
#_00CD0C: INY
#_00CD0D: INY
#_00CD0E: CPY.w #$000C
#_00CD11: BCC .next_demon_hp

.done_taking_hp
#_00CD13: PLP
#_00CD14: CLC

#_00CD15: RTL

;---------------------------------------------------------------------------------------------------

.nonzero_mag
#_00CD16: LDY.w #$0000

.next_demon_mag
#_00CD19: STY.w $0720

#_00CD1C: LDX.w $0700,Y
#_00CD1F: BMI .end_of_list

#_00CD21: CPX.w #$0180
#_00CD24: BCC .not_demon_mag

#_00CD26: LDA.w $104A,X
#_00CD29: CLC
#_00CD2A: ADC.w $045C
#_00CD2D: STA.w $045C

.not_demon_mag
#_00CD30: LDY.w $0720
#_00CD33: INY
#_00CD34: INY
#_00CD35: CPY.w #$000C
#_00CD38: BCC .next_demon_mag

;---------------------------------------------------------------------------------------------------

.end_of_list
#_00CD3A: SEP #$20

#_00CD3C: LDA.w $045C
#_00CD3F: STA.w WRDIVL

#_00CD42: LDA.w $045D
#_00CD45: STA.w WRDIVH

#_00CD48: LDA.b #$0A
#_00CD4A: STA.w WRDIVB

#_00CD4D: NOP
#_00CD4E: NOP
#_00CD4F: NOP
#_00CD50: NOP
#_00CD51: NOP
#_00CD52: NOP
#_00CD53: NOP
#_00CD54: NOP

#_00CD55: REP #$20

#_00CD57: LDA.w RDDIVL
#_00CD5A: STA.w $0E00

#_00CD5D: LDA.w RDMPYL
#_00CD60: STA.w $045C

#_00CD63: LDA.w $0409
#_00CD66: SEC
#_00CD67: SBC.w $0E00
#_00CD6A: STA.w $0409

#_00CD6D: LDA.w $040B
#_00CD70: SBC.w #$0000
#_00CD73: STA.w $040B
#_00CD76: BCC .no_more_mag

#_00CD78: ORA.w $0409
#_00CD7B: BNE .nonzero_mag_left

.no_more_mag
#_00CD7D: STZ.w $0409
#_00CD80: STZ.w $040B
#_00CD83: STZ.w $045C

#_00CD86: PLP
#_00CD87: SEC

#_00CD88: RTL

.nonzero_mag_left
#_00CD89: PLP
#_00CD8A: CLC

#_00CD8B: RTL

;===================================================================================================

routine00CD8C:
#_00CD8C: PHP
#_00CD8D: REP #$30

#_00CD8F: LDX.w #$0180

.next_party_member
#_00CD92: BIT.w $1000,X
#_00CD95: BPL .skip_party_member

#_00CD97: BVS .skip_party_member

#_00CD99: LDA.w $1002,X
#_00CD9C: AND.w #$C000
#_00CD9F: BNE .skip_party_member

#_00CDA1: LDA.w $102E,X
#_00CDA4: CMP.w $1030,X
#_00CDA7: BCS .skip_party_member

#_00CDA9: LDA.w $100A,X
#_00CDAC: LSR A
#_00CDAD: LSR A
#_00CDAE: INC A
#_00CDAF: CLC
#_00CDB0: ADC.w $102E,X
#_00CDB3: CMP.w $1030,X
#_00CDB6: BCC .under_max_hp

#_00CDB8: LDA.w $1030,X

.under_max_hp
#_00CDBB: STA.w $102E,X

.skip_party_member
#_00CDBE: TXA
#_00CDBF: CLC
#_00CDC0: ADC.w #$0060
#_00CDC3: TAX

#_00CDC4: CMP.w #$0600
#_00CDC7: BCC .next_party_member

#_00CDC9: PLP
#_00CDCA: RTL

;===================================================================================================

routine00CDCB:
#_00CDCB: PHP

#_00CDCC: JSR RoomEvent_LookForChest

#_00CDCF: LDA.w $0711
#_00CDD2: AND.b #$0F
#_00CDD4: BEQ RoomEvent_00_Nothing

; Elevator
#_00CDD6: CMP.b #$0C
#_00CDD8: BCS RoomEvent_00_Nothing

; Sign A
#_00CDDA: CMP.b #$0A
#_00CDDC: BCS .text_event

#_00CDDE: BIT.w $0719
#_00CDE1: BPL RoomEvent_00_Nothing

.text_event
#_00CDE3: DEC A
#_00CDE4: ASL A
#_00CDE5: TAX

#_00CDE6: LDA.l RoomEventVectors+0,X
#_00CDEA: STA.w $00E0

#_00CDED: LDA.l RoomEventVectors+1,X
#_00CDF1: STA.w $00E1

#_00CDF4: LDA.w $0719
#_00CDF7: AND.b #$7F
#_00CDF9: STA.w $0719

#_00CDFC: LDA.w $0712
#_00CDFF: AND.b #$7F
#_00CE01: STA.w $0712

#_00CE04: JMP ($00E0)

;===================================================================================================

RoomEvent_01_AutoTurn:
#_00CE07: JSL AddSelfAsVector

#_00CE0B: LDA.b #$0E ; SFX 0E
#_00CE0D: JSL Write_to_APU_transferrable

#_00CE11: LDX.w $040D
#_00CE14: STX.w $040E

#_00CE17: JSL GetRandomInt
#_00CE1B: AND.b #$03
#_00CE1D: STA.w $040D

#_00CE20: SEC
#_00CE21: SBC.w $040E
#_00CE24: AND.b #$03
#_00CE26: BEQ .branch00CE4D

#_00CE28: CMP.b #$03
#_00CE2A: BNE .branch00CE31

#_00CE2C: JSR Dungeon_AdjustPOVTurningLeft

#_00CE2F: BRA .branch00CE4D

.branch00CE31
#_00CE31: CMP.b #$01
#_00CE33: BEQ .branch00CE4A

#_00CE35: LDA.w $040D
#_00CE38: DEC A
#_00CE39: AND.b #$03
#_00CE3B: STA.w $040D

#_00CE3E: JSR Dungeon_AdjustPOVTurningRight

#_00CE41: LDA.w $040D
#_00CE44: INC A
#_00CE45: AND.b #$03
#_00CE47: STA.w $040D

.branch00CE4A
#_00CE4A: JSR Dungeon_AdjustPOVTurningRight

.branch00CE4D
#_00CE4D: JSL UpdateDirTilemap
#_00CE51: JSL Dungeon_UpdateAutoMapper

;===================================================================================================

RoomEvent_00_Nothing:
#_00CE55: PLP
#_00CE56: CLC

#_00CE57: RTS

;===================================================================================================

RoomEventVectors:
#_00CE58: dw RoomEvent_01_AutoTurn
#_00CE5A: dw RoomEvent_Trap
#_00CE5C: dw RoomEvent_Trap
#_00CE5E: dw RoomEvent_Trap
#_00CE60: dw RoomEvent_05_Freehole
#_00CE62: dw RoomEvent_06_Warp
#_00CE64: dw RoomEvent_07_ExitToOverworld
#_00CE66: dw RoomEvent_Stairs
#_00CE68: dw RoomEvent_Stairs
#_00CE6A: dw RoomEvent_0A_SignA
#_00CE6C: dw RoomEvent_0B_TurnNPC

;===================================================================================================

RoomEvent_Trap:
#_00CE6E: JSL AddSelfAsVector

#_00CE72: LDA.b #$02
#_00CE74: JSL routine00E817

#_00CE78: LDA.w $0588
#_00CE7B: BEQ .core_shield_not_active

.protected_from_traps
#_00CE7D: PLP
#_00CE7E: CLC

#_00CE7F: RTS

;===================================================================================================

.core_shield_not_active
; check for amulet
#_00CE80: LDA.w $0584
#_00CE83: BNE .protected_from_traps

#_00CE85: LDA.w $0711
#_00CE88: AND.b #$0F
#_00CE8A: SEC
#_00CE8B: SBC.b #$02
#_00CE8D: BNE .not_trap_02

#_00CE8F: JMP TriggerRoomTrap02

.not_trap_02
#_00CE92: REP #$10

#_00CE94: LDX.w #$0000

#_00CE97: CMP.b #$01
#_00CE99: BNE .not_trap_03

#_00CE9B: DEX

.not_trap_03
#_00CE9C: STX.w $0620

;---------------------------------------------------------------------------------------------------

#_00CE9F: REP #$30

#_00CEA1: LDY.w #$0000

.next_party_member
#_00CEA4: STY.w $0720

#_00CEA7: LDX.w $0700,Y
#_00CEAA: BMI .exit

#_00CEAC: LDA.w $1002,X
#_00CEAF: AND.w #$C000
#_00CEB2: BNE .exit

#_00CEB4: STX.w $0715

#_00CEB7: LDA.w $101C,X

#_00CEBA: BIT.w $0620
#_00CEBD: BPL .probably_lawful

#_00CEBF: CMP.w #$0091
#_00CEC2: BCS .skip_party_member

#_00CEC4: BRA .do_damage

.probably_lawful
#_00CEC6: CMP.w #$0070
#_00CEC9: BCC .skip_party_member

.do_damage
#_00CECB: LDA.w $102E,X
#_00CECE: LSR A
#_00CECF: LSR A
#_00CED0: INC A

#_00CED1: PHA
#_00CED2: PHX

#_00CED3: LDA.w #$000F ; SFX 0F
#_00CED6: JSL Write_to_APU_transferrable

#_00CEDA: PLX
#_00CEDB: PLA

#_00CEDC: JSR RemoveSomeHP
#_00CEDF: BCS .skip_party_member

#_00CEE1: JSL routine00C76F

#_00CEE5: LDA.w #$00CC
#_00CEE8: JSL routine00C752
#_00CEEC: JSL routine00C7A1
#_00CEF0: BRA .skip_party_member

.skip_party_member
#_00CEF2: LDY.w $0720
#_00CEF5: INY
#_00CEF6: INY
#_00CEF7: CPY.w #$000C
#_00CEFA: BCC .next_party_member

.exit
#_00CEFC: PLP
#_00CEFD: CLC

#_00CEFE: RTS

;===================================================================================================

TriggerRoomTrap02:
#_00CEFF: REP #$30

#_00CF01: LDY.w #$0000

.next_party_member
#_00CF04: STY.w $0720

#_00CF07: LDX.w $0700,Y
#_00CF0A: BMI .done

#_00CF0C: JSL GetRandomInt
#_00CF10: AND.w #$0003
#_00CF13: BNE .skip_party_member

#_00CF15: LDA.w $1002,X
#_00CF18: AND.w #$D800
#_00CF1B: BNE .skip_party_member

#_00CF1D: LDA.w $1002,X
#_00CF20: ORA.w #$0800
#_00CF23: STA.w $1002,X

#_00CF26: LDA.w $1004,X
#_00CF29: STA.w $0A3E

#_00CF2C: JSL routine00C76F

#_00CF30: LDA.w #$0052
#_00CF33: JSL routine00C752
#_00CF37: JSL routine00C7A1

.skip_party_member
#_00CF3B: LDY.w $0720
#_00CF3E: INY
#_00CF3F: INY
#_00CF40: CPY.w #$000C
#_00CF43: BCC .next_party_member

.done
#_00CF45: JSL routine00A17E

#_00CF49: PLP
#_00CF4A: CLC

#_00CF4B: RTS

;===================================================================================================

RoomEvent_05_Freehole:
#_00CF4C: REP #$30

#_00CF4E: LDA.w #DungeonFreeholeLocations

#_00CF51: LDX.w #$0006

#_00CF54: JSR FindAssociatedRoomEvent_Moving
#_00CF57: BCS .exit

#_00CF59: STX.w $070C

#_00CF5C: PHA

#_00CF5D: REP #$20

#_00CF5F: LDA.w #$000B ; SFX 0B
#_00CF62: JSL Write_to_APU_transferrable

#_00CF66: PLA

#_00CF67: SEP #$30

#_00CF69: CMP.w $0710
#_00CF6C: BEQ .no_theme_change

#_00CF6E: STA.w $0710

#_00CF71: JSL routine00C7AA

#_00CF75: LDX.w $0710
#_00CF78: LDA.l MusicTracksTable,X
#_00CF7C: JSL Write_to_APU_transferrable
#_00CF80: BRA .continue

.no_theme_change
#_00CF82: JSL routine009853

;---------------------------------------------------------------------------------------------------

.continue
#_00CF86: JSL UpdateVisitedSquares
#_00CF8A: JSL routine009BDE

#_00CF8E: SEP #$20

#_00CF90: STA.w $0711

#_00CF93: JSL routine00A840
#_00CF97: JSL UpdateDirTilemap
#_00CF9B: JSL Dungeon_UpdateAutoMapper

.exit
#_00CF9F: PLP
#_00CFA0: CLC

#_00CFA1: RTS

;===================================================================================================

RoomEvent_06_Warp:
#_00CFA2: REP #$30

#_00CFA4: LDA.w #DungeonWarpLocations
#_00CFA7: LDX.w #$0006
#_00CFAA: JSR FindAssociatedRoomEvent_Moving
#_00CFAD: BCS .exit

#_00CFAF: STX.w $070C

#_00CFB2: PHA

#_00CFB3: REP #$20

#_00CFB5: LDA.w #$0031 ; SFX 31
#_00CFB8: JSL Write_to_APU_transferrable

#_00CFBC: PLA

#_00CFBD: SEP #$30

#_00CFBF: CMP.w $0710
#_00CFC2: BEQ .no_theme_change

#_00CFC4: STA.w $0710

#_00CFC7: JSL routine00C7AA

#_00CFCB: LDX.w $0710
#_00CFCE: LDA.l MusicTracksTable,X
#_00CFD2: JSL Write_to_APU_transferrable
#_00CFD6: BRA .continue

.no_theme_change
#_00CFD8: JSL routine009853

.continue
#_00CFDC: JSL UpdateVisitedSquares
#_00CFE0: JSL routine009BDE

#_00CFE4: SEP #$20

#_00CFE6: STA.w $0711

#_00CFE9: JSL routine00A840
#_00CFED: JSL UpdateDirTilemap
#_00CFF1: JSL Dungeon_UpdateAutoMapper

.exit
#_00CFF5: PLP
#_00CFF6: CLC

#_00CFF7: RTS

;===================================================================================================

RoomEvent_07_ExitToOverworld:
#_00CFF8: REP #$30

#_00CFFA: LDA.w #DungeonExitLocations
#_00CFFD: LDX.w #$0008

#_00D000: JSR FindAssociatedRoomEvent_Moving
#_00D003: BCS RoomEventDoneTransition

#_00D005: PHA

#_00D006: TXA
#_00D007: AND.w #$0080
#_00D00A: BNE .exit_to_overworld

#_00D00C: PHX

#_00D00D: INY

#_00D00E: LDA.b [$E0],Y
#_00D010: PHA

#_00D011: INY
#_00D012: INY

#_00D013: LDA.b [$E0],Y
#_00D015: PHA

#_00D016: LDA.w #$002F
#_00D019: JSL CheckGameProgressFlag
#_00D01D: BCS .branch00D027

#_00D01F: PLY
#_00D020: PLX

#_00D021: PLA
#_00D022: PLA

#_00D023: PHY
#_00D024: PHX

#_00D025: BRA .branch00D029

.branch00D027
#_00D027: PLA
#_00D028: PLA

.branch00D029
#_00D029: REP #$30

#_00D02B: JSL routine00D3DA

#_00D02F: LDA.w #$0000
#_00D032: JSL routine02E98E
#_00D036: JSL routine00C76F

#_00D03A: LDX.w #$002E
#_00D03D: JMP HandleTransitionFromRoomEvent

;---------------------------------------------------------------------------------------------------

.do_not_exit
#_00D040: REP #$20

#_00D042: JSR routine00D2C8
#_00D045: JSL routine00C7AA
#_00D049: JSL routine00A840

#_00D04D: JSL UpdateDirTilemap
#_00D051: JSL Dungeon_UpdateAutoMapper

;---------------------------------------------------------------------------------------------------

#RoomEventDoneTransition:
#_00D055: PLP
#_00D056: CLC

#_00D057: RTS

;---------------------------------------------------------------------------------------------------

.exit_to_overworld
#_00D058: TXA
#_00D059: AND.w #$FF7F
#_00D05C: STA.w $07F5

#_00D05F: PLA
#_00D060: STA.w $0B16

#_00D063: JSL routine02E897
#_00D067: JSL routine00C76F

#_00D06B: LDA.w #$0031
#_00D06E: JSL routine00C752
#_00D072: JSL routine00C7A1

#_00D076: SEP #$20

#_00D078: LDA.w $09F3
#_00D07B: BNE .do_not_exit

#_00D07D: REP #$20 ; why?

#_00D07F: PLP
#_00D080: SEC

#_00D081: RTS

;===================================================================================================

RoomEvent_Stairs:
#_00D082: REP #$30

#_00D084: LDA.w #DungeonStairsLocations
#_00D087: LDX.w #$0006
#_00D08A: JSR FindAssociatedRoomEvent_Moving
#_00D08D: BCS RoomEventDoneTransition

#_00D08F: PHA
#_00D090: PHX

#_00D091: REP #$30

#_00D093: JSL routine00D3DA

#_00D097: LDA.w $0711
#_00D09A: AND.w #$000F
#_00D09D: CMP.w #$0008
#_00D0A0: BEQ .stairs_going_up

#_00D0A2: LDA.w #$0001
#_00D0A5: BRA .start_stairs

.stairs_going_up
#_00D0A7: LDA.w #$0000

.start_stairs
#_00D0AA: JSL routine02E98E
#_00D0AE: JSL routine00C76F

#_00D0B2: REP #$30

#_00D0B4: LDX.w #$002E

#_00D0B7: LDA.w $0711
#_00D0BA: AND.w #$000F
#_00D0BD: CMP.w #$0008
#_00D0C0: BEQ HandleTransitionFromRoomEvent

#_00D0C2: INX

;===================================================================================================

HandleTransitionFromRoomEvent:
#_00D0C3: TXA
#_00D0C4: JSL routine00C752

#_00D0C8: SEP #$20

#_00D0CA: LDA.w $09F3
#_00D0CD: BNE .selected_no

#_00D0CF: REP #$20

#_00D0D1: STZ.w $0584

#_00D0D4: LDA.w #$0009 ; SFX 09
#_00D0D7: JSL Write_to_APU_transferrable

#_00D0DB: PLA
#_00D0DC: STA.w $070C

#_00D0DF: JSL routine009BDE

#_00D0E3: SEP #$20
#_00D0E5: STA.w $0711

#_00D0E8: REP #$20
#_00D0EA: PLA

#_00D0EB: SEP #$30

#_00D0ED: CMP.w $0710
#_00D0F0: BEQ .no_theme_change

#_00D0F2: STA.w $0710

#_00D0F5: LDX.w $0710
#_00D0F8: LDA.l MusicTracksTable,X
#_00D0FC: JSL Write_to_APU_transferrable

.no_theme_change
#_00D100: REP #$30
#_00D102: BRA .continue

;---------------------------------------------------------------------------------------------------

.selected_no
#_00D104: REP #$20

#_00D106: PLX
#_00D107: PLY
#_00D108: JSR routine00D2C8

;---------------------------------------------------------------------------------------------------

.continue
#_00D10B: JSL UpdateVisitedSquares
#_00D10F: JSL UpdateDialogBox

#_00D113: JSL routine00C7AA
#_00D117: JSL routine00A840

#_00D11B: JSL UpdateDirTilemap
#_00D11F: JSL Dungeon_UpdateAutoMapper

#_00D123: PLP
#_00D124: CLC

#_00D125: RTS

;===================================================================================================

RoomEvent_0A_SignA:
#_00D126: REP #$30

#_00D128: LDA.w #DungeonSignALocations
#_00D12B: LDX.w #$0003
#_00D12E: JSR FindAssociatedRoomEvent_Turning
#_00D131: BCS .exit

#_00D133: STX.w $0717

#_00D136: SEP #$30

#_00D138: LDA.w $0717
#_00D13B: JSL routine00A8F5

.exit
#_00D13F: PLP
#_00D140: CLC

#_00D141: RTS

;===================================================================================================

RoomEvent_0A_SignA_long:
#_00D142: PHP
#_00D143: REP #$30

#_00D145: LDA.w #DungeonSignALocations
#_00D148: LDX.w #$0003
#_00D14B: JSR FindAssociatedRoomEvent_Turning
#_00D14E: BCS .exit

#_00D150: STX.w $0717

#_00D153: SEP #$30

#_00D155: LDA.w $0717
#_00D158: JSL routine00A8F5

.exit
#_00D15C: PLP
#_00D15D: RTL

;===================================================================================================

RoomEvent_0B_TurnNPC:
#_00D15E: REP #$30

#_00D160: LDA.w #DungeonTurnNPCLocations

#_00D163: LDX.w #$0004
#_00D166: JSR FindAssociatedRoomEvent_Turning
#_00D169: BCS .fail

#_00D16B: STX.w $0A12

#_00D16E: JSL routine00D3DA

#_00D172: LDA.w #$0003
#_00D175: JSL InitializeTextBoxToSizeForNewMessage

#_00D179: JSL routine00A056

#_00D17D: JSR routine00D24C
#_00D180: JSL routine00C7A1

#_00D184: SEP #$30

#_00D186: LDA.w $05BA
#_00D189: BEQ .branch00D196

#_00D18B: LDX.w $0710
#_00D18E: LDA.l MusicTracksTable,X
#_00D192: JSL Write_to_APU

.branch00D196
#_00D196: LDA.w $0EEF
#_00D199: BEQ .fail

#_00D19B: JSL routine00CB2F
#_00D19F: JSL routine009853

.fail
#_00D1A3: PLP
#_00D1A4: CLC

#_00D1A5: RTS

;===================================================================================================
; Enters with
;   A - bank07 address start
;   X - block size
; Exits with:
;   X - parameter 1
;   A - parameter 2
;===================================================================================================
FindAssociatedRoomEvent_Moving:
#_00D1A6: STA.w $00E0

#_00D1A9: LDA.w #$0007
#_00D1AC: STA.w $00E2

.next_check
#_00D1AF: LDY.w #$0000

#_00D1B2: LDA.b [$E0],Y
#_00D1B4: AND.w #$00FF
#_00D1B7: CMP.w #$00FF
#_00D1BA: BEQ .complete_failure

#_00D1BC: LDA.b [$E0],Y
#_00D1BE: CMP.w $070C
#_00D1C1: BEQ .found_event

#_00D1C3: TXA
#_00D1C4: CLC
#_00D1C5: ADC.w $00E0
#_00D1C8: STA.w $00E0

#_00D1CB: BRA .next_check

.found_event
#_00D1CD: INY
#_00D1CE: INY
#_00D1CF: LDA.b [$E0],Y
#_00D1D1: TAX

#_00D1D2: INY
#_00D1D3: INY
#_00D1D4: LDA.b [$E0],Y

#_00D1D6: CLC
#_00D1D7: RTS

;===================================================================================================

#RoomEvent_DisplayErrorMessage:
#_00D1D8: PLB

;---------------------------------------------------------------------------------------------------

.complete_failure
#_00D1D9: JSR routine00DA9F

#_00D1DC: SEC

#_00D1DD: RTS

;===================================================================================================
; Enters with
;   A - bank07 address start
;   X - block size
; Exits with:
;   X - parameter 1
;   A - parameter 2
;   Y - parameter 2
;===================================================================================================
FindAssociatedRoomEvent_Turning:
#_00D1DE: STA.w $00E0
#_00D1E1: STZ.w $00E2

#_00D1E4: PHB

#_00D1E5: SEP #$20

#_00D1E7: LDA.b #$07
#_00D1E9: PHA

#_00D1EA: REP #$20

#_00D1EC: PLB

.check_next
#_00D1ED: LDY.w #$0000

#_00D1F0: LDA.b ($E0),Y
#_00D1F2: AND.w #$00FF
#_00D1F5: CMP.w #$00FF
#_00D1F8: BEQ RoomEvent_DisplayErrorMessage

#_00D1FA: LDA.b ($E0),Y
#_00D1FC: AND.w #$3FFF
#_00D1FF: CMP.w $070C
#_00D202: BNE .no_match

.wrong_direction
#_00D204: SEP #$20

#_00D206: INY

#_00D207: LDA.b ($E0),Y
#_00D209: ROL A
#_00D20A: ROL A
#_00D20B: ROL A
#_00D20C: AND.b #$03
#_00D20E: CMP.w $040D
#_00D211: BEQ .found_match

#_00D213: REP #$20

#_00D215: TXA
#_00D216: CLC
#_00D217: ADC.w $00E0
#_00D21A: STA.w $00E0

#_00D21D: LDY.w #$0000
#_00D220: LDA.b ($E0),Y
#_00D222: AND.w #$3FFF
#_00D225: CMP.w $070C
#_00D228: BNE .fail

#_00D22A: BEQ .wrong_direction

.no_match
#_00D22C: INC.w $00E2

#_00D22F: TXA
#_00D230: CLC
#_00D231: ADC.w $00E0
#_00D234: STA.w $00E0

#_00D237: BRA .check_next

;---------------------------------------------------------------------------------------------------

.fail
#_00D239: REP #$20

#_00D23B: PLB

#_00D23C: SEC

#_00D23D: RTS

;---------------------------------------------------------------------------------------------------

.found_match
#_00D23E: REP #$20

#_00D240: INY

#_00D241: LDA.b ($E0),Y
#_00D243: TAX

#_00D244: INY
#_00D245: INY

#_00D246: LDA.b ($E0),Y
#_00D248: TAY

#_00D249: PLB

#_00D24A: CLC

#_00D24B: RTS

;===================================================================================================

routine00D24C:
#_00D24C: PHP

#_00D24D: JSL routine00A9AD

#_00D251: SEP #$20

#_00D253: LDA.b #$20
#_00D255: STA.w $0A2C

#_00D258: REP #$20

#_00D25A: LDA.w $0400
#_00D25D: ORA.w #$0100
#_00D260: STA.w $0400

#_00D263: STZ.w $0EEF
#_00D266: STZ.w $0EFE
#_00D269: STZ.w $05BA

#_00D26C: LDA.w #$3DC4
#_00D26F: STA.w $0A1A

#_00D272: LDA.w #$0018
#_00D275: STA.w $0A1E

#_00D278: LDA.w #$000C
#_00D27B: STA.w $0A20

#_00D27E: LDA.w #$0002
#_00D281: STA.w $0A1C

#_00D284: JSL LoadClassyMessage
#_00D288: JSL routine03837C
#_00D28C: JSR routine00D29A

#_00D28F: LDA.w $0400
#_00D292: AND.w #$FEFF
#_00D295: STA.w $0400

#_00D298: PLP
#_00D299: RTS

;===================================================================================================

routine00D29A:
#_00D29A: SEP #$10

#_00D29C: LDY.b #$1F

.next
#_00D29E: SEP #$20

#_00D2A0: TYA
#_00D2A1: ASL A
#_00D2A2: TAX

#_00D2A3: LDA.b #$80
#_00D2A5: STA.w $1A00,Y
#_00D2A8: STA.w $1A20,Y

#_00D2AB: REP #$20

#_00D2AD: STZ.w $0000,X

#_00D2B0: STZ.w $1A60,X
#_00D2B3: STZ.w $1AA0,X
#_00D2B6: STZ.w $1AE0,X

#_00D2B9: STZ.w $0040,X

#_00D2BC: STZ.w $1B80,X

#_00D2BF: DEY
#_00D2C0: CPY.b #$10
#_00D2C2: BCS .next

#_00D2C4: RTS

;===================================================================================================

routine00D2C8_long:
#_00D2C5: PHB
#_00D2C6: PHK
#_00D2C7: PLB

#_00D2C8: JSR routine00D2C8

#_00D2CB: PLB
#_00D2CC: RTL

;===================================================================================================
; TODO easy routine
routine00D2C8:
#_00D2CD: PHP
#_00D2CE: SEP #$30

#_00D2D0: LDA.w $040D
#_00D2D3: ASL A
#_00D2D4: TAX

#_00D2D5: LDA.l .movement_change+0,X
#_00D2D9: CLC
#_00D2DA: ADC.w $070C
#_00D2DD: STA.w $070C

#_00D2E0: LDA.l .movement_change+1,X
#_00D2E4: CLC
#_00D2E5: ADC.w $070D
#_00D2E8: STA.w $070D

#_00D2EB: LDA.w $040D
#_00D2EE: EOR.b #$02
#_00D2F0: STA.w $040D

#_00D2F3: JSL routine009BDE
#_00D2F7: STA.w $0711

#_00D2FA: PLP
#_00D2FB: RTS

.movement_change
#_00D2FC: db $00, $01
#_00D2FC: db $FF, $00
#_00D2FC: db $00, $FF
#_00D2FC: db $01, $00

;===================================================================================================
; TODO something encounters
routine00D304:
#_00D304: JSL AddSelfAsVector

#_00D308: LDA.w $0712
#_00D30B: BPL .exit

#_00D30D: LDA.b #$FF
#_00D30F: JSL CheckGameProgressFlag
#_00D313: BCC .exit

#_00D315: JSL TriggerEncounter_Dungeon
#_00D319: BCC .exit

#_00D31B: JSL routine00D3DA
#_00D31F: JSL routine01B263

#_00D323: SEP #$30

#_00D325: LDA.b #$00
#_00D327: STA.w $0F80

#_00D32A: LDX.w $0710
#_00D32D: LDA.l MusicTracksTable,X
#_00D331: JSL Write_to_APU

#_00D335: JSL Dungeon_UpdateAutoMapper

.exit
#_00D339: RTS

;===================================================================================================

UpdateVisitedSquares:
#_00D33A: PHP
#_00D33B: REP #$30

#_00D33D: LDA.w #$00FE
#_00D340: JSL CheckGameProgressFlag
#_00D344: BCC .exit

#_00D346: LDA.w #$0000
#_00D349: JSL CheckGameProgressFlag
#_00D34D: BCS .exit

#_00D34F: LDA.w $070C
#_00D352: TAY
#_00D353: LSR A
#_00D354: LSR A
#_00D355: LSR A
#_00D356: AND.w #$000F
#_00D359: STA.w $0CF9

#_00D35C: LDA.w $070D
#_00D35F: ASL A
#_00D360: ASL A
#_00D361: ASL A
#_00D362: ASL A
#_00D363: AND.w #$03F0
#_00D366: ORA.w $0CF9
#_00D369: TAX

#_00D36A: TYA
#_00D36B: AND.w #$0007
#_00D36E: TAY

#_00D36F: SEP #$20

#_00D371: PHB
#_00D372: PHK
#_00D373: PLB

#_00D374: LDA.l $7E3000,X
#_00D378: ORA.w .bits,Y
#_00D37B: STA.l $7E3000,X

#_00D37F: PLB

.exit
#_00D380: PLP
#_00D381: RTL

.bits
#_00D382: db $80, $40, $20, $10, $08, $04, $02, $01

;===================================================================================================

routine00D38A:
#_00D38A: LDA.w #$20DE

#_00D38D: BIT.w $0EF5
#_00D390: BPL .branch00D395

#_00D392: LDA.w #$0000

.branch00D395
#_00D395: STA.w $0106

#_00D398: LDA.w $0EF1
#_00D39B: AND.w #$7FFF
#_00D39E: STA.w $0102

#_00D3A1: LDA.w #$0001
#_00D3A4: STA.w $0104

#_00D3A7: LDA.w #$0001
#_00D3AA: STA.w $0100

#_00D3AD: LDA.w $0EF5
#_00D3B0: EOR.w #$8010
#_00D3B3: STA.w $0EF5

#_00D3B6: RTS

;===================================================================================================

Dungeon_UpdateAutoMapper:
#_00D3B7: PHP
#_00D3B8: SEP #$30

#_00D3BA: LDA.w $0400
#_00D3BD: AND.b #$80
#_00D3BF: BEQ .exit

#_00D3C1: LDA.b #$1C
#_00D3C3: STA.w $0F77

#_00D3C6: LDA.b #$01
#_00D3C8: STA.w $0F7C

#_00D3CB: JSL routine00AC12

#_00D3CF: LDA.b #$29
#_00D3D1: LDY.b #$A0
#_00D3D3: LDX.b #$80
#_00D3D5: JSR SomeDungeon_Check

.exit
#_00D3D8: PLP
#_00D3D9: RTL

;===================================================================================================

routine00D3DA:
#_00D3DA: PHP
#_00D3DB: SEP #$30

#_00D3DD: LDA.w $0400
#_00D3E0: AND.b #$80
#_00D3E2: BEQ .exit

#_00D3E4: LDA.b #$10
#_00D3E6: STA.w $0F77

#_00D3E9: LDA.b #$0C
#_00D3EB: STA.w $0F7C

#_00D3EE: JSL routine00AD90

#_00D3F2: LDA.b #$00
#_00D3F4: LDX.b #$80
#_00D3F6: JSR SomeDungeon_Check

.exit
#_00D3F9: PLP
#_00D3FA: RTL

;===================================================================================================

SomeDungeon_Check:
#_00D3FB: PHP
#_00D3FC: SEP #$20

#_00D3FE: BIT.w $0400
#_00D401: BPL .exit

#_00D403: REP #$30

#_00D405: AND.w #$00FF
#_00D408: STA.w $0000

#_00D40B: TYA
#_00D40C: AND.w #$00FF
#_00D40F: STA.w $1AA0

#_00D412: LDA.w #$00D8
#_00D415: STA.w $1A60

#_00D418: SEP #$10

#_00D41A: STX.w $1A00

.exit
#_00D41D: PLP
#_00D41E: RTS

;===================================================================================================

RemoveSomeHP:
#_00D41F: STA.w $0A54
#_00D422: STZ.w $0A56

#_00D425: SEC
#_00D426: SBC.w $102E,X
#_00D429: EOR.w #$FFFF
#_00D42C: INC A
#_00D42D: BEQ .continue
#_00D42F: BMI .continue

#_00D431: STA.w $102E,X

#_00D434: LDA.w $1004,X
#_00D437: STA.w $0A3E

#_00D43A: JSL routine00A17E

#_00D43E: CLC
#_00D43F: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_00D440: LDA.w $102E,X
#_00D443: STA.w $0A54

#_00D446: STZ.w $102E,X
#_00D449: STZ.w $1032,X

#_00D44C: LDA.w #$4000
#_00D44F: STA.w $1002,X

#_00D452: LDA.w $1004,X
#_00D455: STA.w $0A3E

#_00D458: JSL routine00C76F

#_00D45C: LDA.w #$00CC
#_00D45F: JSL routine00C752

#_00D463: LDA.w #$00CD
#_00D466: JSL routine00C752

#_00D46A: JSL routine00C7A1
#_00D46E: JSL VerifyTheHumansAreOkay

#_00D472: LDX.w $0715
#_00D475: CPX.w #$0180
#_00D478: BCC .branch00D47E

#_00D47A: JSL routine019581

.branch00D47E
#_00D47E: JSL routine00AB74

#_00D482: SEC

#_00D483: RTS

;===================================================================================================

routine00D484:
#_00D484: LDA.w #$00FE
#_00D487: JSL CheckGameProgressFlag
#_00D48B: BCS .exit

#_00D48D: LDA.w #$000C
#_00D490: JSL Do19XXVectorsATimes

#_00D494: LDA.w $0722
#_00D497: ASL A
#_00D498: TAX

#_00D499: LDA.l data00D4A4,X
#_00D49D: INC.w $0722
#_00D4A0: STA.w $0F2B

.exit
#_00D4A3: RTS

data00D4A4:
#_00D4A4: dw $0800,$0800,$0800,$0800
#_00D4AC: dw $0800,$0800,$0800,$0800
#_00D4B4: dw $0800,$0800,$0800,$0800
#_00D4BC: dw $0800,$0800,$0800,$0100
#_00D4C4: dw $0800,$0800,$0800,$0800
#_00D4CC: dw $0200,$0800,$0800,$0800
#_00D4D4: dw $0800,$0800,$0800,$0800
#_00D4DC: dw $0800,$0800,$0800,$0100
#_00D4E4: dw $0800,$0800,$0800
#_00D4EA: dw $0100,$0800,$0800,$0800
#_00D4F2: dw $0800,$0800,$0800,$0800
#_00D4FA: dw $0800,$0800,$0800,$0800
#_00D502: dw $0800,$0200,$0800,$0800
#_00D50A: dw $0800,$0200,$0800,$0800
#_00D512: dw $0800,$0800,$0800,$0200
#_00D51A: dw $0800,$0800,$0200,$0800
#_00D522: dw $0800,$0100,$0800,$0200
#_00D52A: dw $0800,$0100,$0800,$0800
#_00D532: dw $0800,$0800,$0100,$0800
#_00D53A: dw $0800,$0800,$0800,$0800
#_00D542: dw $0800,$0800,$0100,$0800
#_00D54A: dw $0800,$0800,$0100,$0800
#_00D552: dw $0800,$0800,$0800,$0800
#_00D55A: dw $0200,$0800,$0100,$0800
#_00D562: dw $0100,$0800,$0200,$0800
#_00D56A: dw $0200,$0800,$0200,$0800
#_00D572: dw $0200,$0800,$0200,$0800
#_00D57A: dw $0200,$0800,$0200,$0800
#_00D582: dw $0200,$0800,$0100,$0800
#_00D58A: dw $0800,$0200,$0800,$0200
#_00D592: dw $0800,$0800,$0800

;===================================================================================================

RoomEvent_LookForChest:
#_00D598: PHP
#_00D599: SEP #$30

#_00D59B: BIT.w $0711
#_00D59E: BVC .exit

#_00D5A0: REP #$30

#_00D5A2: LDA.w #DungeonChestLocations
#_00D5A5: LDX.w #$0004
#_00D5A8: JSR FindAssociatedRoomEvent_Turning
#_00D5AB: BCS .exit

#_00D5AD: TXA
#_00D5AE: PHA

#_00D5AF: JSR routine00D95C
#_00D5B2: BCC .continue

#_00D5B4: PLA
#_00D5B5: LSR A
#_00D5B6: LSR A
#_00D5B7: LSR A
#_00D5B8: AND.w #$0006
#_00D5BB: TAX

#_00D5BC: LDA.l data00D673,X
#_00D5C0: STA.w $0A69

#_00D5C3: STZ.w $0A6A

#_00D5C6: LDA.w #$0048
#_00D5C9: STA.w $0A6D

#_00D5CC: LDA.w #$0070
#_00D5CF: STA.w $0A6B
#_00D5D2: JSL routine02E6C9

#_00D5D6: REP #$30

#_00D5D8: JSL routine00C76F

#_00D5DC: LDA.w #$0038
#_00D5DF: JSR routine00D9AD

.exit
#_00D5E2: PLP
#_00D5E3: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_00D5E4: PLA
#_00D5E5: PHA

#_00D5E6: LSR A
#_00D5E7: LSR A
#_00D5E8: LSR A
#_00D5E9: AND.w #$0006
#_00D5EC: TAX

#_00D5ED: LDA.l .data00D66D,X
#_00D5F1: STA.w $0A69
#_00D5F4: STZ.w $0A6A
#_00D5F7: LDA.w #$0048
#_00D5FA: STA.w $0A6D
#_00D5FD: LDA.w #$0070
#_00D600: STA.w $0A6B
#_00D603: JSL routine02E6C9

#_00D607: REP #$30
#_00D609: JSL routine00C76F

#_00D60D: REP #$30
#_00D60F: LDA.w #$0032
#_00D612: JSL DisplaySystemMessage

#_00D616: SEP #$20
#_00D618: LDA.w $09F3
#_00D61B: BEQ .branch00D62D

#_00D61D: REP #$30
#_00D61F: LDA.w #$0033
#_00D622: JSL DisplaySystemMessage
#_00D626: PLA
#_00D627: JSL UpdateDialogBox
#_00D62B: PLP
#_00D62C: RTS

.branch00D62D
#_00D62D: REP #$30

#_00D62F: PLA
#_00D630: PHA

#_00D631: LSR A
#_00D632: LSR A
#_00D633: LSR A
#_00D634: AND.w #$0006
#_00D637: TAX

#_00D638: LDA.l data00D673,X
#_00D63C: STA.w $0A69
#_00D63F: STZ.w $0A6A

#_00D642: LDA.w #$0048
#_00D645: STA.w $0A6D

#_00D648: LDA.w #$0070
#_00D64B: STA.w $0A6B

#_00D64E: JSL routine02E6C9

#_00D652: REP #$30

#_00D654: PLA
#_00D655: TAY

#_00D656: AND.w #$0003
#_00D659: ASL A
#_00D65A: TAX

#_00D65B: LDA.l .vectors,X
#_00D65F: STA.w $0E00

#_00D662: TYA
#_00D663: XBA
#_00D664: AND.w #$00FF
#_00D667: STA.w $0A50

#_00D66A: JMP ($0E00)

;---------------------------------------------------------------------------------------------------

.data00D66D
#_00D66D: dw $0095,$0096,$00B6

#data00D673:
#_00D673: dw $0097,$00B5,$00B7

;---------------------------------------------------------------------------------------------------

.vectors
#_00D679: dw routine00D681
#_00D67B: dw routine00D6E3
#_00D67D: dw routine00D760
#_00D67F: dw routine00D7D6

;===================================================================================================

routine00D681:
#_00D681: LDY.w #$0000

.branch00D684
#_00D684: LDA.w $0780,Y
#_00D687: TAX

#_00D688: AND.w #$FF00
#_00D68B: BEQ .branch00D6AB

#_00D68D: TXA
#_00D68E: AND.w #$00FF
#_00D691: CMP.w $0A50
#_00D694: BNE .branch00D6AB

#_00D696: LDA.w $0780,Y
#_00D699: XBA

#_00D69A: SEP #$20

#_00D69C: CMP.b #$09
#_00D69E: BCS .branch00D6A9

#_00D6A0: INC A

#_00D6A1: REP #$20

#_00D6A3: XBA
#_00D6A4: STA.w $0780,Y

#_00D6A7: BRA .done

.branch00D6A9
#_00D6A9: REP #$20

.branch00D6AB
#_00D6AB: INY
#_00D6AC: INY
#_00D6AD: CPY.w #$003C
#_00D6B0: BCC .branch00D684

;---------------------------------------------------------------------------------------------------

#_00D6B2: LDY.w #$0000

.branch00D6B5
#_00D6B5: LDA.w $0780,Y
#_00D6B8: TAX
#_00D6B9: AND.w #$FF00
#_00D6BC: BNE .branch00D6C9

#_00D6BE: LDA.w $0A50
#_00D6C1: ORA.w #$0100
#_00D6C4: STA.w $0780,Y
#_00D6C7: BRA .done

.branch00D6C9
#_00D6C9: INY
#_00D6CA: INY
#_00D6CB: CPY.w #$003C
#_00D6CE: BCC .branch00D6B5

#_00D6D0: LDA.w #$0027
#_00D6D3: JSR routine00D9AD
#_00D6D6: PLP
#_00D6D7: RTS

;---------------------------------------------------------------------------------------------------

.done
#_00D6D8: JSR routine00D982

#_00D6DB: LDA.w #$0034
#_00D6DE: JSR routine00D9AD

#_00D6E1: PLP
#_00D6E2: RTS

;===================================================================================================

routine00D6E3:
#_00D6E3: LDA.w $0A50
#_00D6E6: ASL A
#_00D6E7: ASL A
#_00D6E8: ASL A
#_00D6E9: ASL A
#_00D6EA: ASL A
#_00D6EB: STA.w $0620

#_00D6EE: CLC
#_00D6EF: ADC.w $0405
#_00D6F2: STA.w $0405

#_00D6F5: LDA.w $0407
#_00D6F8: ADC.w #$0000
#_00D6FB: STA.w $0407

#_00D6FE: LDA.w $0405
#_00D701: SEC
#_00D702: SBC.w #$423F
#_00D705: STA.w $0622

#_00D708: LDA.w $0407
#_00D70B: SBC.w #$000F
#_00D70E: STA.w $0624
#_00D711: BCC .branch00D738

#_00D713: ORA.w $0622
#_00D716: BEQ .branch00D738

#_00D718: LDA.w #$423F
#_00D71B: STA.w $0405

#_00D71E: LDA.w #$000F
#_00D721: STA.w $0407

#_00D724: LDA.w $0620
#_00D727: SEC
#_00D728: SBC.w $0622
#_00D72B: STA.w $0622
#_00D72E: BNE .branch00D73B

;---------------------------------------------------------------------------------------------------

#branch00D730:
#_00D730: LDA.w #$0039
#_00D733: JSR routine00D9AD

#_00D736: PLP
#_00D737: RTS

;---------------------------------------------------------------------------------------------------

.branch00D738
#_00D738: LDA.w $0620

.branch00D73B
#_00D73B: STA.w $0A54
#_00D73E: STZ.w $0A56

#_00D741: JSL TriggerMenuGrow
#_00D745: JSL WriteMoneyToHUD
#_00D749: JSL WriteMAGToHUD

#_00D74D: LDA.w #$0035
#_00D750: JSR routine00D9AD
#_00D753: JSL TriggerMenuShrink

#_00D757: JSL BringUpAMenu
#_00D75B: JSR routine00D982

#_00D75E: PLP
#_00D75F: RTS

;===================================================================================================

routine00D760:
#_00D760: LDA.w $0A50
#_00D763: ASL A
#_00D764: ASL A
#_00D765: ASL A
#_00D766: ASL A
#_00D767: STA.w $0620

#_00D76A: CLC
#_00D76B: ADC.w $0409
#_00D76E: STA.w $0409

#_00D771: LDA.w $040B
#_00D774: ADC.w #$0000
#_00D777: STA.w $040B

#_00D77A: LDA.w $0409
#_00D77D: SEC
#_00D77E: SBC.w #$869F
#_00D781: STA.w $0622

#_00D784: LDA.w $040B
#_00D787: SBC.w #$0001
#_00D78A: STA.w $0624
#_00D78D: BCC .branch00D7AE

#_00D78F: ORA.w $0622
#_00D792: BEQ .branch00D7AE

#_00D794: LDA.w #$869F
#_00D797: STA.w $0409

#_00D79A: LDA.w #$0001
#_00D79D: STA.w $040B

#_00D7A0: LDA.w $0620
#_00D7A3: SEC
#_00D7A4: SBC.w $0622
#_00D7A7: STA.w $0622
#_00D7AA: BNE .branch00D7B1

#_00D7AC: BEQ branch00D730

.branch00D7AE
#_00D7AE: LDA.w $0620

.branch00D7B1
#_00D7B1: STA.w $0A54
#_00D7B4: STZ.w $0A56

#_00D7B7: JSL TriggerMenuGrow
#_00D7BB: JSL WriteMoneyToHUD
#_00D7BF: JSL WriteMAGToHUD

#_00D7C3: LDA.w #$0036
#_00D7C6: JSR routine00D9AD
#_00D7C9: JSL TriggerMenuShrink

#_00D7CD: JSL BringUpAMenu
#_00D7D1: JSR routine00D982

#_00D7D4: PLP
#_00D7D5: RTS

;===================================================================================================

routine00D7D6:
#_00D7D6: LDA.w #DungeonChestLocations
#_00D7D9: LDX.w #$0004
#_00D7DC: JSR FindAssociatedRoomEvent_Turning

#_00D7DF: TXA
#_00D7E0: LSR A
#_00D7E1: LSR A
#_00D7E2: LSR A
#_00D7E3: AND.w #$0006
#_00D7E6: TAX

#_00D7E7: LDA.l data00D673,X
#_00D7EB: STA.w $0A69

#_00D7EE: LDA.w #$0002
#_00D7F1: STA.w $0A6A

#_00D7F4: LDA.w #$0048
#_00D7F7: STA.w $0A6D

#_00D7FA: LDA.w #$0070
#_00D7FD: STA.w $0A6B

#_00D800: JSL routine02E6C9

;---------------------------------------------------------------------------------------------------

#_00D804: REP #$30

#_00D806: LDA.w #$00B8
#_00D809: STA.w $0A69
#_00D80C: STZ.w $0A6A

#_00D80F: LDA.w #$0038
#_00D812: STA.w $0A6D

#_00D815: LDA.w #$0070
#_00D818: STA.w $0A6B

#_00D81B: JSL routine02E6C9

#_00D81F: REP #$30

#_00D821: LDA.w #$0037
#_00D824: JSR routine00D9AD
#_00D827: JSR routine00D982

#_00D82A: LDA.w $0A50
#_00D82D: AND.w #$000E
#_00D830: TAX

#_00D831: LDA.l .vectors,X
#_00D835: STA.w $0E00

#_00D838: LDA.w #.return-1
#_00D83B: PHA

#_00D83C: JMP ($0E00)

.return
#_00D83F: PLP
#_00D840: RTS

.vectors
#_00D841: dw routine00D849
#_00D843: dw routine00D8B4
#_00D845: dw routine00D90E
#_00D847: dw routine00D90E

;===================================================================================================
; TODO easy to analyze
routine00D849:
#_00D849: LDY.w #$0000

.next_party_member
#_00D84C: STY.w $0720

#_00D84F: LDX.w $0700,Y
#_00D852: BMI .done

#_00D854: LDA.w $1002,X
#_00D857: AND.w #$C000
#_00D85A: BNE .skip_party_member

#_00D85C: STX.w $0715

#_00D85F: LDA.w $1034,X
#_00D862: BEQ .skip_party_member

#_00D864: LDY.w $1032,X
#_00D867: BEQ .skip_party_member

#_00D869: LDA.w $0A50
#_00D86C: AND.w #$0001
#_00D86F: BNE .dont_cut_down

#_00D871: TYA
#_00D872: LSR A
#_00D873: LSR A
#_00D874: TAY

.dont_cut_down
#_00D875: TYA
#_00D876: LSR A
#_00D877: BNE .not_zero

#_00D879: INC A

.not_zero
#_00D87A: STA.w $0A54

#_00D87D: SEC
#_00D87E: SBC.w $1032,X
#_00D881: EOR.w #$FFFF
#_00D884: INC A
#_00D885: BPL .positive

#_00D887: LDA.w $1032,X
#_00D88A: STA.w $0A54

#_00D88D: LDA.w #$0000

.positive
#_00D890: STA.w $1032,X

#_00D893: LDA.w $102E,X
#_00D896: CLC
#_00D897: ADC.w $0A54
#_00D89A: CMP.w #$03E7
#_00D89D: BCC .under_1000

#_00D89F: LDA.w #$03E7

.under_1000
#_00D8A2: STA.w $102E,X

.skip_party_member
#_00D8A5: LDY.w $0720
#_00D8A8: INY
#_00D8A9: INY
#_00D8AA: CPY.w #$000C
#_00D8AD: BCC .next_party_member

.done
#_00D8AF: JSL routine00A17E

#_00D8B3: RTS

;===================================================================================================

routine00D8B4:
#_00D8B4: LDY.w #$0000

.next_party_member
#_00D8B7: STY.w $0720

#_00D8BA: LDX.w $0700,Y
#_00D8BD: BMI .done

#_00D8BF: LDA.w $1002,X
#_00D8C2: AND.w #$C000
#_00D8C5: BNE .done

#_00D8C7: STX.w $0715

#_00D8CA: LDY.w $102E,X

#_00D8CD: LDA.w $0A50
#_00D8D0: AND.w #$0001
#_00D8D3: BNE .dont_cut_down

#_00D8D5: TYA
#_00D8D6: LSR A
#_00D8D7: LSR A
#_00D8D8: TAY

.dont_cut_down
#_00D8D9: TYA
#_00D8DA: LSR A
#_00D8DB: BEQ .skip_party_member

#_00D8DD: JSR RemoveSomeHP

#_00D8E0: LDX.w $0715

#_00D8E3: LDA.w $102E,X
#_00D8E6: BEQ .skip_party_member

#_00D8E8: LDA.w $1034,X
#_00D8EB: BEQ .skip_party_member

#_00D8ED: LDA.w $1032,X
#_00D8F0: CLC
#_00D8F1: ADC.w $0A54
#_00D8F4: CMP.w #$03E7
#_00D8F7: BCC .under_1000

#_00D8F9: LDA.w #$03E7

.under_1000
#_00D8FC: STA.w $1032,X

.skip_party_member
#_00D8FF: LDY.w $0720
#_00D902: INY
#_00D903: INY
#_00D904: CPY.w #$000C
#_00D907: BCC .next_party_member

.done
#_00D909: JSL routine00A17E

#_00D90D: RTS

;===================================================================================================

routine00D90E:
#_00D90E: LDY.w #$0000

.next_party_member
#_00D911: STY.w $0720

#_00D914: LDX.w $0700,Y
#_00D917: BMI .exit

#_00D919: LDA.w $1002,X
#_00D91C: AND.w #$C000
#_00D91F: BNE .exit

#_00D921: STX.w $0715
#_00D924: LDY.w $101C,X

#_00D927: LDA.w $0A50
#_00D92A: AND.w #$0002
#_00D92D: BNE .branch00D936

#_00D92F: CPY.w #$0091
#_00D932: BCS .skip_party_member

#_00D934: BRA .continue

.branch00D936
#_00D936: CPY.w #$0070
#_00D939: BCC .skip_party_member

.continue
#_00D93B: LDY.w $102E,X
#_00D93E: LDA.w $0A50
#_00D941: AND.w #$0001
#_00D944: BNE .dont_cut_down

#_00D946: TYA
#_00D947: LSR A
#_00D948: TAY

.dont_cut_down
#_00D949: TYA
#_00D94A: LSR A
#_00D94B: BNE .nonzero

#_00D94D: INC A

.nonzero
#_00D94E: JSR RemoveSomeHP

.skip_party_member
#_00D951: LDY.w $0720
#_00D954: INY
#_00D955: INY
#_00D956: CPY.w #$000C
#_00D959: BCC .next_party_member

.exit
#_00D95B: RTS

;===================================================================================================

routine00D95C:
#_00D95C: LDA.w $00E2
#_00D95F: AND.w #$00FE
#_00D962: LSR A
#_00D963: LSR A
#_00D964: LSR A
#_00D965: AND.w #$00FE
#_00D968: TAX

#_00D969: LDA.w $00E2
#_00D96C: AND.w #$000F
#_00D96F: TAY

#_00D970: LDA.w #$0000
#_00D973: SEC

.shift
#_00D974: ROL A

#_00D975: DEY
#_00D976: BPL .shift

#_00D978: AND.l $7E3400,X
#_00D97C: BNE .exit

#_00D97E: CLC
#_00D97F: RTS

.exit
#_00D980: SEC
#_00D981: RTS

;===================================================================================================

routine00D982:
#_00D982: LDA.w #DungeonChestLocations
#_00D985: LDX.w #$0004
#_00D988: JSR FindAssociatedRoomEvent_Turning

#_00D98B: LDA.w $00E2
#_00D98E: LSR A
#_00D98F: LSR A
#_00D990: LSR A
#_00D991: AND.w #$00FE
#_00D994: TAX

#_00D995: LDA.w $00E2
#_00D998: AND.w #$000F
#_00D99B: TAY
#_00D99C: LDA.w #$0000
#_00D99F: SEC

.shift
#_00D9A0: ROL A
#_00D9A1: DEY
#_00D9A2: BPL .shift

#_00D9A4: ORA.l $7E3400,X
#_00D9A8: STA.l $7E3400,X
#_00D9AC: RTS

;===================================================================================================

routine00D9AD:
#_00D9AD: JSL DisplaySystemMessage
#_00D9B1: JSL UpdateDialogBox

#_00D9B5: RTS

;===================================================================================================
; TODO something with room events
routine00D9B6:
#_00D9B6: PHP

#_00D9B7: SEP #$30

#_00D9B9: LDA.w $0711
#_00D9BC: AND.b #$0F
#_00D9BE: TAY

#_00D9BF: LDA.w .offsets,Y

#_00D9C2: REP #$30

#_00D9C4: ASL A
#_00D9C5: ASL A
#_00D9C6: ASL A
#_00D9C7: ASL A
#_00D9C8: TAY

#_00D9C9: LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.next
#_00D9CC: LDA.w .strings,Y
#_00D9CF: STA.w $0106,X

#_00D9D2: INY
#_00D9D3: INY

#_00D9D4: INX
#_00D9D5: INX
#_00D9D6: CPX.w #$0010
#_00D9D9: BCC .next

;---------------------------------------------------------------------------------------------------

#_00D9DB: LDA.w #$3E0C
#_00D9DE: STA.w $0102

#_00D9E1: LDA.w #$0008
#_00D9E4: STA.w $0104

#_00D9E7: LDA.w #$0001
#_00D9EA: STA.w $0100

#_00D9ED: PLP
#_00D9EE: RTS

;---------------------------------------------------------------------------------------------------

.offsets
#_00D9EF: db $0A ; 0x00
#_00D9F0: db $00 ; 0x01
#_00D9F1: db $00 ; 0x02
#_00D9F2: db $00 ; 0x03
#_00D9F3: db $00 ; 0x04
#_00D9F4: db $01 ; 0x05
#_00D9F5: db $02 ; 0x06
#_00D9F6: db $03 ; 0x07
#_00D9F7: db $04 ; 0x08
#_00D9F8: db $05 ; 0x09
#_00D9F9: db $06 ; 0x0A
#_00D9FA: db $07 ; 0x0B
#_00D9FB: db $08 ; 0x0C
#_00D9FC: db $09 ; 0x0D
#_00D9FD: db $09 ; 0x0E
#_00D9FE: db $09 ; 0x0F

;---------------------------------------------------------------------------------------------------

.strings
#_00D9FF: dw $200E, $200B, $2017, $200B, $2011, $200F, $20CF, $20CF ; 0x00 - "DAMAGE  "
#_00DA0F: dw $2010, $201C, $200F, $200F, $2012, $2019, $2016, $200F ; 0x01 - "FREEHOLE"
#_00DA1F: dw $2021, $200B, $201C, $201A, $20CF, $20CF, $20CF, $20CF ; 0x02 - "WARP    "
#_00DA2F: dw $200F, $2022, $2013, $201E, $20CF, $20CF, $20CF, $20CF ; 0x03 - "EXIT    "
#_00DA3F: dw $201F, $201A, $20CF, $201D, $201E, $200B, $2013, $201C ; 0x04 - "UP STAIR"
#_00DA4F: dw $200E, $2021, $20CF, $201D, $201E, $200B, $2013, $201C ; 0x05 - "DW STAIR"
#_00DA5F: dw $201D, $2013, $2011, $2018, $20CF, $200B, $20CF, $20CF ; 0x06 - "SIGN A  "
#_00DA6F: dw $2017, $200F, $201D, $200F, $2018, $2011, $200F, $201C ; 0x07 - "MESENGER"
#_00DA7F: dw $200F, $2016, $200F, $2020, $200B, $201E, $2019, $201C ; 0x08 - "ELEVATOR"
#_00DA8F: dw $200F, $2020, $200F, $2018, $201E, $20CF, $20CF, $20CF ; 0x09 - "EVENT   "

;===================================================================================================

routine00DA9F:
#_00DA9F: JSL routine00C76F
#_00DAA3: JSR routine00D9B6

#_00DAA6: JSL AddSelfAsVectorAndMakeSpace

#_00DAAA: LDX.w #$0000

.next
#_00DAAD: LDA.w .the_word_error,X
#_00DAB0: STA.w $0106,X

#_00DAB3: INY
#_00DAB4: INY

#_00DAB5: INX
#_00DAB6: INX
#_00DAB7: CPX.w #$000A
#_00DABA: BCC .next

#_00DABC: LDA.w #$3DCC
#_00DABF: STA.w $0102

#_00DAC2: LDA.w #$0005
#_00DAC5: STA.w $0104

#_00DAC8: LDA.w #$0001
#_00DACB: STA.w $0100

#_00DACE: JSL AddSelfAsVectorAndMakeSpace

#_00DAD2: JSR routine00C634

#_00DAD5: JSL Update19XXUntilInput
#_00DAD9: JSL routine00C7A1

#_00DADD: RTS

.the_word_error
#_00DADE: dw $200F,  $201C, $201C, $2019, $201C ; "ERROR"

;===================================================================================================

; TODO DUNGEON THEMES
DungeonThemes:
#_00DAE8: dw $01, $02 ; 0x00 - 
#_00DAEA: dw $01, $05 ; 0x01 - 
#_00DAEC: dw $01, $06 ; 0x02 - 
#_00DAEE: dw $01, $07 ; 0x03 - 
#_00DAF0: dw $01, $09 ; 0x04 - 
#_00DAF2: dw $02, $03 ; 0x05 - 
#_00DAF4: dw $00, $0A ; 0x06 - 
#_00DAF6: dw $03, $08 ; 0x07 - 
#_00DAF8: dw $03, $01 ; 0x08 - 
#_00DAFA: dw $00, $00 ; 0x09 - 
#_00DAFC: dw $02, $04 ; 0x0A - 
#_00DAFE: dw $05, $0B ; 0x0B - 
#_00DB00: dw $05, $0C ; 0x0C - 
#_00DB02: dw $00, $0D ; 0x0D - 
#_00DB04: dw $01, $0E ; 0x0E - 
#_00DB06: dw $05, $10 ; 0x0F - 
#_00DB08: dw $00, $0F ; 0x10 - 
#_00DB0A: dw $03, $12 ; 0x11 - 
#_00DB0C: dw $05, $11 ; 0x12 - 
#_00DB0E: dw $04, $13 ; 0x13 - 
#_00DB10: dw $04, $14 ; 0x14 - 
#_00DB12: dw $00, $15 ; 0x15 - 
#_00DB14: dw $00, $16 ; 0x16 - 
#_00DB16: dw $03, $17 ; 0x17 - 
#_00DB18: dw $02, $03 ; 0x18 - 
#_00DB1A: dw $02, $04 ; 0x19 - 
#_00DB1C: dw $01, $02 ; 0x1A - 
#_00DB1E: dw $00, $00 ; 0x1B - 

;===================================================================================================

MusicTracksTable:
#_00DB20: db $4C ; 0x00 - SONG 4C - EMBASSY
#_00DB21: db $4A ; 0x01 - SONG 4A - SHIBUYA
#_00DB22: db $4B ; 0x02 - SONG 4B - SHITENOU
#_00DB23: db $4C ; 0x03 - SONG 4C - EMBASSY
#_00DB24: db $4C ; 0x04 - SONG 4C - EMBASSY
#_00DB25: db $52 ; 0x05 - SONG 52 - DREAM
#_00DB26: db $4A ; 0x06 - SONG 4A - SHIBUYA
#_00DB27: db $4D ; 0x07 - SONG 4D - ARCADE
#_00DB28: db $4D ; 0x08 - SONG 4D - ARCADE
#_00DB29: db $4A ; 0x09 - SONG 4A - SHIBUYA
#_00DB2A: db $52 ; 0x0A - SONG 52 - DREAM
#_00DB2B: db $48 ; 0x0B - SONG 48 - GINZA
#_00DB2C: db $48 ; 0x0C - SONG 48 - GINZA
#_00DB2D: db $4A ; 0x0D - SONG 4A - SHIBUYA
#_00DB2E: db $4C ; 0x0E - SONG 4C - EMBASSY
#_00DB2F: db $48 ; 0x0F - SONG 48 - GINZA
#_00DB30: db $4A ; 0x10 - SONG 4A - SHIBUYA
#_00DB31: db $4D ; 0x11 - SONG 4D - ARCADE
#_00DB32: db $4B ; 0x12 - SONG 4B - SHITENOU
#_00DB33: db $49 ; 0x13 - SONG 49 - CATHEDRAL
#_00DB34: db $49 ; 0x14 - SONG 49 - CATHEDRAL
#_00DB35: db $4A ; 0x15 - SONG 4A - SHIBUYA
#_00DB36: db $4A ; 0x16 - SONG 4A - SHIBUYA
#_00DB37: db $4D ; 0x17 - SONG 4D - ARCADE
#_00DB38: db $4B ; 0x18 - SONG 4B - SHITENOU
#_00DB39: db $4B ; 0x19 - SONG 4B - SHITENOU
#_00DB3A: db $53 ; 0x1A - SONG 53 - HOME
#_00DB3B: db $4D ; 0x1B - SONG 4D - ARCADE

;===================================================================================================

routine00DB3C:
#_00DB3C: PHP
#_00DB3D: REP #$20

#_00DB3F: AND.w #$00FF
#_00DB42: STA.w $0640

#_00DB45: SEP #$30

#_00DB47: PHB
#_00DB48: PHK
#_00DB49: PLB

#_00DB4A: LDX.b #$00

#_00DB4C: LDA.w $0640
#_00DB4F: CMP.b #$3D
#_00DB51: BCC .branch00DB58

#_00DB53: SEC
#_00DB54: SBC.b #$24
#_00DB56: BRA .branch00DB67

.branch00DB58
#_00DB58: CMP.b #$29
#_00DB5A: BCS .branch00DB60

#_00DB5C: CMP.b #$10
#_00DB5E: BCS .branch00DB64

.branch00DB60
#_00DB60: LDY.b #$20
#_00DB62: BRA .branch00DB6C

.branch00DB64
#_00DB64: SEC
#_00DB65: SBC.b #$10

.branch00DB67
#_00DB67: TAY

#_00DB68: LDA.w data00DD50,Y
#_00DB6B: TAY

;---------------------------------------------------------------------------------------------------

.branch00DB6C
#_00DB6C: LDA.w data00DD70,Y
#_00DB6F: STA.l $7E2300,X

#_00DB73: INY

#_00DB74: INX
#_00DB75: CPX.b #$20
#_00DB77: BNE .branch00DB6C

#_00DB79: LDA.b #$01
#_00DB7B: STA.l $7E22FD

#_00DB7F: LDA.b #$90
#_00DB81: STA.l $7E22FE

#_00DB85: LDA.b #$10
#_00DB87: STA.l $7E22FF

#_00DB8B: LDA.b #$1D
#_00DB8D: STA.w $0EFD

#_00DB90: LDX.w $0640
#_00DB93: LDA.w data00DCF6,X

#_00DB96: REP #$30

#_00DB98: AND.w #$00FF
#_00DB9B: TAX

#_00DB9C: LDA.w data00DD3A,X
#_00DB9F: LDX.w #$0002
#_00DBA2: JSL routine00BC3C

#_00DBA6: LDA.w $0640
#_00DBA9: ASL A
#_00DBAA: TAX

#_00DBAB: LDA.w data00DE50,X
#_00DBAE: STA.w $0642

#_00DBB1: SEP #$20

.branch00DBB3
#_00DBB3: LDX.w $0642
#_00DBB6: LDA.w data00DED8,X
#_00DBB9: BEQ .branch00DBCE

#_00DBBB: INX
#_00DBBC: STX.w $0642

#_00DBBF: JSR routine00DBD6
#_00DBC2: JSR routine00DCB7

#_00DBC5: SEP #$10

#_00DBC7: JSR routine00DCCD

#_00DBCA: REP #$10
#_00DBCC: BRA .branch00DBB3


.branch00DBCE
#_00DBCE: SEP #$30

#_00DBD0: JSR routine00DCCD

#_00DBD3: PLB
#_00DBD4: PLP
#_00DBD5: RTL

;===================================================================================================

routine00DBD6:
#_00DBD6: DEC A

#_00DBD7: REP #$20
#_00DBD9: AND.w #$00FF
#_00DBDC: ASL A
#_00DBDD: TAX

#_00DBDE: LDA.w pointers00DFAB,X
#_00DBE1: STA.w $00B0

#_00DBE4: STZ.w $0644

#_00DBE7: SEP #$20

#_00DBE9: LDY.w #$0000
#_00DBEC: LDA.b ($B0),Y

.next
#_00DBEE: STA.w $0646

#_00DBF1: INY
#_00DBF2: LDA.b ($B0),Y
#_00DBF4: STA.w $0647

#_00DBF7: INY
#_00DBF8: LDA.b ($B0),Y
#_00DBFA: STA.w $0648

#_00DBFD: INY
#_00DBFE: LDA.b ($B0),Y
#_00DC00: STA.w $0649

#_00DC03: INY
#_00DC04: LDA.b ($B0),Y
#_00DC06: STA.w $064A

#_00DC09: INY

#_00DC0A: JSR routine00DC1B

#_00DC0D: LDA.b ($B0),Y
#_00DC0F: BPL .next

#_00DC11: LDA.w $0644
#_00DC14: SEC
#_00DC15: SBC.b #$04
#_00DC17: STA.w $0644

#_00DC1A: RTS

;===================================================================================================

routine00DC1B:
#_00DC1B: LDX.w $0644

#_00DC1E: LDA.w $0648
#_00DC21: AND.b #$30
#_00DC23: ORA.b #$80
#_00DC25: STA.w $1A00,X

#_00DC28: LDA.w $0647
#_00DC2B: BEQ .branch00DC3B

#_00DC2D: LDA.w $0648
#_00DC30: AND.b #$03
#_00DC32: ASL A
#_00DC33: ASL A
#_00DC34: ASL A
#_00DC35: ASL A
#_00DC36: ORA.b #$80
#_00DC38: STA.w $1A20,X

.branch00DC3B
#_00DC3B: REP #$20

#_00DC3D: LDA.w $0644
#_00DC40: ASL A
#_00DC41: TAX

#_00DC42: LDA.w $0646
#_00DC45: AND.w #$00FF
#_00DC48: CLC
#_00DC49: ADC.w #$01F0
#_00DC4C: STA.w $0000,X

#_00DC4F: LDA.w $0649
#_00DC52: AND.w #$00FF

#_00DC55: PHY

#_00DC56: LDY.w $0524
#_00DC59: BEQ .branch00DC7E

#_00DC5B: LDY.w $0518
#_00DC5E: CPY.w #$0600
#_00DC61: BCC .branch00DC73

#_00DC63: PHA

#_00DC64: TYA
#_00DC65: LDY.w #$0000
#_00DC68: CMP.w #$0780
#_00DC6B: BCC .branch00DC70

#_00DC6D: LDY.w #$0002

.branch00DC70
#_00DC70: PLA
#_00DC71: BRA .branch00DC76

.branch00DC73
#_00DC73: LDY.w $0564

;---------------------------------------------------------------------------------------------------

.branch00DC76
#_00DC76: PHB
#_00DC77: PHK
#_00DC78: PLB

#_00DC79: CLC
#_00DC7A: ADC.w .data00DCB3,Y

#_00DC7D: PLB

.branch00DC7E
#_00DC7E: PLY

#_00DC7F: STA.w $1A60,X

#_00DC82: LDA.w $064A
#_00DC85: AND.w #$00FF
#_00DC88: CMP.w #$00F8
#_00DC8B: BNE .branch00DC90

#_00DC8D: LDA.w #$FFF8

.branch00DC90
#_00DC90: STA.w $1AA0,X

#_00DC93: STZ.w $0040,X

#_00DC96: LDA.w $0647
#_00DC99: AND.w #$00FF
#_00DC9C: BEQ .branch00DCA6

#_00DC9E: DEC A
#_00DC9F: CLC
#_00DCA0: ADC.w #$0009
#_00DCA3: STA.w $0040,X

.branch00DCA6
#_00DCA6: LDA.w $0644
#_00DCA9: CLC
#_00DCAA: ADC.w #$0004
#_00DCAD: STA.w $0644

#_00DCB0: SEP #$20
#_00DCB2: RTS

.data00DCB3
#_00DCB3: dw -32, 32

;===================================================================================================

routine00DCB7:
#_00DCB7: SEP #$10

.wait
#_00DCB9: JSL AddSelfAsVector

#_00DCBD: LDA.w $0644
#_00DCC0: ASL A
#_00DCC1: TAX

#_00DCC2: LDA.w $0000,X
#_00DCC5: ORA.w $0001,X
#_00DCC8: BNE .wait

#_00DCCA: REP #$10
#_00DCCC: RTS

;===================================================================================================

; TODO what in the world is this?
routine00DCCD:
#_00DCCD: LDX.b #$18
#_00DCCF: LDY.b #$0C

.next
#_00DCD1: STZ.w $0000,X
#_00DCD4: STZ.w $0001,X

#_00DCD7: STZ.w $0040,X
#_00DCDA: STZ.w $0041,X

#_00DCDD: LDA.b #$80
#_00DCDF: STA.w $1A00,Y

#_00DCE2: LDA.b #$00
#_00DCE4: STA.w $1A40,Y

#_00DCE7: DEY ; Y -= 4
#_00DCE8: DEY
#_00DCE9: DEY
#_00DCEA: DEY

#_00DCEB: DEX ; X -= 8
#_00DCEC: DEX
#_00DCED: DEX
#_00DCEE: DEX
#_00DCEF: DEX
#_00DCF0: DEX
#_00DCF1: DEX
#_00DCF2: DEX

#_00DCF3: BPL .next

#_00DCF5: RTS

;===================================================================================================

data00DCF6:
#_00DCF6: db $00,$00,$00,$00,$00,$00,$00,$00
#_00DCFE: db $02,$02,$02,$02,$02,$02,$02,$02
#_00DD06: db $04,$04,$04,$04,$04,$04,$04,$04
#_00DD0E: db $06,$06,$06,$06,$06,$06,$06,$06
#_00DD16: db $08,$08,$08,$08,$0A,$0A,$0A,$0A
#_00DD1E: db $00,$08,$08,$08,$08,$08,$08,$08
#_00DD26: db $08,$0C,$0C,$0C,$0C,$0C,$0C,$0C
#_00DD2E: db $0C,$0C,$0C,$08,$08,$0E,$10,$10
#_00DD36: db $0E,$12,$14,$0E

data00DD3A:
#_00DD3A: dw $0000,$0001,$0302,$0600
#_00DD42: dw $0504,$0300,$0700,$0A09
#_00DD4A: dw $0C08,$0B08,$000D

data00DD50:
#_00DD50: db $40,$40,$40,$40,$40,$40,$40,$40
#_00DD58: db $00,$00,$00,$00,$00,$00,$00,$00
#_00DD60: db $40,$40,$40,$40,$00,$00,$00,$00
#_00DD68: db $60,$80,$C0,$80,$A0,$00,$A0,$A0

data00DD70:
#_00DD70: db $00,$00,$08,$20,$8C,$30,$10,$41
#_00DD78: db $94,$51,$18,$62,$9C,$72,$9C,$73
#_00DD80: db $00,$00,$08,$00,$10,$00,$90,$00
#_00DD88: db $14,$01,$98,$01,$1C,$02,$9C,$73
#_00DD90: db $00,$00,$08,$00,$10,$00,$1C,$00
#_00DD98: db $1C,$11,$1C,$02,$9C,$03,$9C,$73
#_00DDA0: db $00,$20,$00,$70,$00,$71,$00,$72
#_00DDA8: db $00,$73,$88,$73,$90,$73,$9C,$73
#_00DDB0: db $00,$00,$98,$73,$9C,$53,$18,$33
#_00DDB8: db $8C,$01,$94,$00,$80,$00,$9C,$73
#_00DDC0: db $10,$01,$1C,$02,$9C,$03,$9C,$33
#_00DDC8: db $9C,$73,$9C,$73,$9C,$73,$9C,$73
#_00DDD0: db $00,$00,$08,$71,$8C,$71,$10,$72
#_00DDD8: db $94,$72,$18,$73,$9C,$73,$9C,$73
#_00DDE0: db $00,$00,$00,$00,$00,$00,$00,$00
#_00DDE8: db $00,$00,$00,$00,$00,$00,$9C,$73
#_00DDF0: db $8C,$31,$00,$21,$80,$31,$00,$42
#_00DDF8: db $00,$63,$8C,$73,$94,$73,$9C,$73
#_00DE00: db $04,$10,$88,$20,$08,$41,$8C,$41
#_00DE08: db $90,$51,$14,$62,$1C,$73,$9C,$73
#_00DE10: db $8C,$31,$8C,$10,$10,$11,$94,$21
#_00DE18: db $18,$32,$9C,$42,$1C,$53,$9C,$63
#_00DE20: db $10,$00,$1C,$00,$1C,$01,$1C,$02
#_00DE28: db $1C,$03,$9C,$33,$9C,$53,$9C,$73
#_00DE30: db $08,$21,$84,$70,$08,$71,$8C,$71
#_00DE38: db $10,$72,$94,$72,$18,$73,$9C,$73
#_00DE40: db $00,$00,$00,$00,$00,$00,$00,$00
#_00DE48: db $00,$00,$00,$00,$00,$00,$9C,$73

data00DE50:
#_00DE50: dw $0000,$0003,$0005,$0008
#_00DE58: dw $000A,$0010,$0012,$0018
#_00DE60: dw $001A,$001E,$0020,$0023
#_00DE68: dw $0025,$002D,$0032,$0038
#_00DE70: dw $003A,$003E,$0040,$0048
#_00DE78: dw $004A,$0050,$0052,$0056
#_00DE80: dw $0058,$005A,$005C,$005E
#_00DE88: dw $0060,$0063,$0066,$0069
#_00DE90: dw $006C,$006F,$0071,$0076
#_00DE98: dw $0078,$007B,$007D,$0082
#_00DEA0: dw $0084,$008B,$008E,$0091
#_00DEA8: dw $0093,$0095,$0099,$009B
#_00DEB0: dw $009D,$00A1,$00A3,$00A5
#_00DEB8: dw $00A7,$00AC,$00B1,$00B5
#_00DEC0: dw $00B7,$00B9,$00BB,$00BE
#_00DEC8: dw $00C0,$00C2,$00C4,$00C6
#_00DED0: dw $00C8,$00CB,$00CD,$00CF

data00DED8:
#_00DED8: db $01,$0B,$00,$02,$00,$03,$0C,$00
#_00DEE0: db $04,$00,$05,$0A,$0E,$0D,$0B,$00
#_00DEE8: db $06,$00,$07,$08,$10,$0F,$0C,$00
#_00DEF0: db $09,$00,$11,$08,$15,$00,$12,$00
#_00DEF8: db $13,$16,$00,$14,$00,$56,$57,$58
#_00DF00: db $59,$0E,$0D,$0B,$00,$5A,$5B,$5C
#_00DF08: db $5D,$00,$07,$08,$10,$0F,$0C,$00
#_00DF10: db $09,$00,$5E,$1D,$65,$00,$5F,$00
#_00DF18: db $17,$1D,$65,$1E,$66,$1F,$67,$00
#_00DF20: db $18,$00,$19,$20,$21,$22,$23,$00
#_00DF28: db $1A,$00,$1B,$24,$60,$00,$1C,$00
#_00DF30: db $27,$00,$28,$00,$25,$00,$26,$00
#_00DF38: db $29,$2A,$00,$2B,$2C,$00,$2D,$2E
#_00DF40: db $00,$2F,$30,$00,$31,$33,$00,$32
#_00DF48: db $00,$13,$33,$34,$35,$00,$14,$00
#_00DF50: db $36,$38,$00,$37,$00,$39,$38,$61
#_00DF58: db $64,$00,$3A,$00,$3B,$0C,$63,$62
#_00DF60: db $61,$64,$00,$33,$3C,$00,$07,$08
#_00DF68: db $00,$09,$00,$3D,$00,$3E,$3D,$3F
#_00DF70: db $00,$40,$00,$41,$00,$42,$43,$44
#_00DF78: db $00,$4D,$00,$4C,$00,$4B,$00,$4E
#_00DF80: db $4F,$4B,$50,$00,$51,$52,$4C,$53
#_00DF88: db $00,$54,$4D,$55,$00,$49,$00,$48
#_00DF90: db $00,$47,$00,$49,$4A,$00,$45,$00
#_00DF98: db $46,$00,$68,$00,$69,$00,$6A,$00
#_00DFA0: db $6B,$6C,$00,$6D,$00,$6E,$00,$6F
#_00DFA8: db $70,$71,$00

;===================================================================================================

pointers00DFAB:
#_00DFAB: dw data00E08D
#_00DFAD: dw data00E093
#_00DFAF: dw data00E099
#_00DFB1: dw data00E0A4
#_00DFB3: dw data00E0AF
#_00DFB5: dw data00E0B5
#_00DFB7: dw data00E0BB
#_00DFB9: dw data00E0D0
#_00DFBB: dw data00E0D6
#_00DFBD: dw data00E0EB
#_00DFBF: dw data00E0F6
#_00DFC1: dw data00E0FC
#_00DFC3: dw data00E102
#_00DFC5: dw data00E10D
#_00DFC7: dw data00E118
#_00DFC9: dw data00E123
#_00DFCB: dw data00E12E
#_00DFCD: dw data00E139
#_00DFCF: dw data00E144
#_00DFD1: dw data00E159
#_00DFD3: dw data00E16E
#_00DFD5: dw data00E174
#_00DFD7: dw data00E17A
#_00DFD9: dw data00E18F
#_00DFDB: dw data00E1A4
#_00DFDD: dw data00E1B9
#_00DFDF: dw data00E1CE
#_00DFE1: dw data00E1D4
#_00DFE3: dw data00E1DF
#_00DFE5: dw data00E1E5
#_00DFE7: dw data00E1EB
#_00DFE9: dw data00E1F1
#_00DFEB: dw data00E1F7
#_00DFED: dw data00E1FD
#_00DFEF: dw data00E203
#_00DFF1: dw data00E209
#_00DFF3: dw data00E20F
#_00DFF5: dw data00E224
#_00DFF7: dw data00E239
#_00DFF9: dw data00E244
#_00DFFB: dw data00E24F
#_00DFFD: dw data00E264
#_00DFFF: dw data00E279
#_00E001: dw data00E28E
#_00E003: dw data00E2A3
#_00E005: dw data00E2B8
#_00E007: dw data00E2CD
#_00E009: dw data00E2E2
#_00E00B: dw data00E2F7
#_00E00D: dw data00E302
#_00E00F: dw data00E30D
#_00E011: dw data00E313
#_00E013: dw data00E319
#_00E015: dw data00E31F
#_00E017: dw data00E32F
#_00E019: dw data00E33F
#_00E01B: dw data00E345
#_00E01D: dw data00E34B
#_00E01F: dw data00E351
#_00E021: dw data00E35C
#_00E023: dw data00E371
#_00E025: dw data00E377
#_00E027: dw data00E37D
#_00E029: dw data00E383
#_00E02B: dw data00E38E
#_00E02D: dw data00E3A3
#_00E02F: dw data00E3AE
#_00E031: dw data00E3B9
#_00E033: dw data00E3C4
#_00E035: dw data00E3CF
#_00E037: dw data00E3DA
#_00E039: dw data00E3E0
#_00E03B: dw data00E3E6
#_00E03D: dw data00E3EC
#_00E03F: dw data00E3F2
#_00E041: dw data00E3F8
#_00E043: dw data00E3FE
#_00E045: dw data00E404
#_00E047: dw data00E40A
#_00E049: dw data00E410
#_00E04B: dw data00E416
#_00E04D: dw data00E41C
#_00E04F: dw data00E422
#_00E051: dw data00E428
#_00E053: dw data00E42E
#_00E055: dw data00E434
#_00E057: dw data00E43A
#_00E059: dw data00E440
#_00E05B: dw data00E446
#_00E05D: dw data00E44C
#_00E05F: dw data00E452
#_00E061: dw data00E458
#_00E063: dw data00E45E
#_00E065: dw data00E464
#_00E067: dw data00E479
#_00E069: dw data00E48E
#_00E06B: dw data00E494
#_00E06D: dw data00E4A4
#_00E06F: dw data00E4B4
#_00E071: dw data00E4BF
#_00E073: dw data00E4CA
#_00E075: dw data00E4D0
#_00E077: dw data00E4D6
#_00E079: dw data00E4DC
#_00E07B: dw data00E4E2
#_00E07D: dw data00E4ED
#_00E07F: dw data00E4F3
#_00E081: dw data00E4F9
#_00E083: dw data00E4FF
#_00E085: dw data00E50A
#_00E087: dw data00E510
#_00E089: dw data00E516
#_00E08B: dw data00E51C

;---------------------------------------------------------------------------------------------------

data00E08D:
#_00E08D: db $00, $01, $00, $70, $68

;---------------------------------------------------------------------------------------------------

data00E093:
#_00E093: db $01, $02, $00, $78, $40

;---------------------------------------------------------------------------------------------------

data00E099:
#_00E099: db $00, $03, $00, $00, $68
#_00E09E: db $00, $04, $00, $E0, $18

;---------------------------------------------------------------------------------------------------

data00E0A4:
#_00E0A4: db $01, $05, $00, $78, $48
#_00E0A9: db $01, $06, $00, $78, $48

;---------------------------------------------------------------------------------------------------

data00E0AF:
#_00E0AF: db $02, $00, $00, $70, $68

;---------------------------------------------------------------------------------------------------

data00E0B5:
#_00E0B5: db $03, $00, $00, $78, $50

;---------------------------------------------------------------------------------------------------

data00E0BB:
#_00E0BB: db $04, $07, $00, $10, $08
#_00E0C0: db $04, $08, $10, $B0, $08
#_00E0C5: db $05, $08, $30, $B0, $48
#_00E0CA: db $05, $07, $20, $10, $48

;---------------------------------------------------------------------------------------------------

data00E0D0:
#_00E0D0: db $06, $00, $00, $78, $40

;---------------------------------------------------------------------------------------------------

data00E0D6:
#_00E0D6: db $07, $09, $00, $40, $08
#_00E0DB: db $07, $0A, $10, $80, $08
#_00E0E0: db $08, $0A, $30, $80, $48
#_00E0E5: db $08, $09, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E0EB:
#_00E0EB: db $07, $09, $00, $40, $28
#_00E0F0: db $07, $0A, $10, $80, $28

;---------------------------------------------------------------------------------------------------

data00E0F6:
#_00E0F6: db $09, $00, $00, $70, $58

;---------------------------------------------------------------------------------------------------

data00E0FC:
#_00E0FC: db $0A, $00, $00, $70, $58

;---------------------------------------------------------------------------------------------------

data00E102:
#_00E102: db $09, $00, $00, $58, $58
#_00E107: db $09, $00, $00, $88, $58

;---------------------------------------------------------------------------------------------------

data00E10D:
#_00E10D: db $09, $00, $00, $40, $58
#_00E112: db $09, $00, $00, $A0, $58

;---------------------------------------------------------------------------------------------------

data00E118:
#_00E118: db $0A, $00, $00, $58, $58
#_00E11D: db $0A, $00, $00, $88, $58

;---------------------------------------------------------------------------------------------------

data00E123:
#_00E123: db $0A, $00, $00, $40, $58
#_00E128: db $0A, $00, $00, $A0, $58

;---------------------------------------------------------------------------------------------------

data00E12E:
#_00E12E: db $0B, $00, $00, $40, $48
#_00E133: db $0B, $00, $10, $80, $48

;---------------------------------------------------------------------------------------------------

data00E139:
#_00E139: db $0C, $00, $00, $40, $48
#_00E13E: db $0C, $00, $10, $80, $48

;---------------------------------------------------------------------------------------------------

data00E144:
#_00E144: db $0D, $00, $00, $40, $48
#_00E149: db $0D, $00, $10, $80, $48
#_00E14E: db $0D, $00, $30, $80, $08
#_00E153: db $0D, $00, $20, $40, $08

;---------------------------------------------------------------------------------------------------

data00E159:
#_00E159: db $0E, $00, $00, $40, $48
#_00E15E: db $0E, $00, $10, $80, $48
#_00E163: db $0E, $00, $30, $80, $08
#_00E168: db $0E, $00, $20, $40, $08

;---------------------------------------------------------------------------------------------------

data00E16E:
#_00E16E: db $0F, $00, $00, $70, $38

;---------------------------------------------------------------------------------------------------

data00E174:
#_00E174: db $10, $00, $00, $70, $38

;---------------------------------------------------------------------------------------------------

data00E17A:
#_00E17A: db $11, $00, $00, $40, $08
#_00E17F: db $11, $00, $10, $80, $08
#_00E184: db $11, $00, $30, $80, $48
#_00E189: db $11, $00, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E18F:
#_00E18F: db $12, $00, $00, $40, $08
#_00E194: db $12, $00, $10, $80, $08
#_00E199: db $12, $00, $30, $80, $48
#_00E19E: db $12, $00, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E1A4:
#_00E1A4: db $13, $0B, $00, $40, $08
#_00E1A9: db $13, $0B, $11, $B0, $08
#_00E1AE: db $13, $0B, $31, $B0, $48
#_00E1B3: db $13, $0B, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E1B9:
#_00E1B9: db $14, $0B, $01, $70, $08
#_00E1BE: db $14, $0B, $10, $80, $08
#_00E1C3: db $14, $0B, $30, $80, $48
#_00E1C8: db $14, $0B, $21, $70, $48

;---------------------------------------------------------------------------------------------------

data00E1CE:
#_00E1CE: db $00, $0C, $00, $40, $F8

;---------------------------------------------------------------------------------------------------

data00E1D4:
#_00E1D4: db $01, $0D, $00, $78, $40
#_00E1D9: db $01, $0D, $03, $78, $40

;---------------------------------------------------------------------------------------------------

data00E1DF:
#_00E1DF: db $15, $00, $00, $78, $08

;---------------------------------------------------------------------------------------------------

data00E1E5:
#_00E1E5: db $15, $00, $00, $68, $08

;---------------------------------------------------------------------------------------------------

data00E1EB:
#_00E1EB: db $15, $00, $00, $88, $08

;---------------------------------------------------------------------------------------------------

data00E1F1:
#_00E1F1: db $14, $00, $00, $40, $28

;---------------------------------------------------------------------------------------------------

data00E1F7:
#_00E1F7: db $14, $00, $00, $60, $28

;---------------------------------------------------------------------------------------------------

data00E1FD:
#_00E1FD: db $14, $00, $00, $80, $28

;---------------------------------------------------------------------------------------------------

data00E203:
#_00E203: db $14, $00, $00, $A0, $28

;---------------------------------------------------------------------------------------------------

data00E209:
#_00E209: db $16, $00, $00, $A0, $58

;---------------------------------------------------------------------------------------------------

data00E20F:
#_00E20F: db $18, $00, $00, $40, $08
#_00E214: db $18, $00, $10, $80, $08
#_00E219: db $18, $00, $30, $80, $48
#_00E21E: db $18, $00, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E224:
#_00E224: db $19, $00, $00, $40, $08
#_00E229: db $19, $00, $10, $80, $08
#_00E22E: db $19, $00, $30, $80, $48
#_00E233: db $19, $00, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E239:
#_00E239: db $18, $0E, $20, $40, $08
#_00E23E: db $18, $0E, $12, $80, $48

;---------------------------------------------------------------------------------------------------

data00E244:
#_00E244: db $19, $0F, $20, $40, $46
#_00E249: db $19, $0F, $12, $80, $0A

;---------------------------------------------------------------------------------------------------

data00E24F:
#_00E24F: db $18, $00, $00, $18, $08
#_00E254: db $18, $00, $10, $58, $08
#_00E259: db $18, $00, $30, $58, $48
#_00E25E: db $18, $00, $20, $18, $48

;---------------------------------------------------------------------------------------------------

data00E264:
#_00E264: db $18, $00, $00, $68, $08
#_00E269: db $18, $00, $10, $A8, $08
#_00E26E: db $18, $00, $30, $A8, $48
#_00E273: db $18, $00, $20, $68, $48

;---------------------------------------------------------------------------------------------------

data00E279:
#_00E279: db $19, $00, $00, $18, $08
#_00E27E: db $19, $00, $10, $58, $08
#_00E283: db $19, $00, $30, $58, $48
#_00E288: db $19, $00, $20, $18, $48

;---------------------------------------------------------------------------------------------------

data00E28E:
#_00E28E: db $19, $00, $00, $68, $08
#_00E293: db $19, $00, $10, $A8, $08
#_00E298: db $19, $00, $30, $A8, $48
#_00E29D: db $19, $00, $20, $68, $48

;---------------------------------------------------------------------------------------------------

data00E2A3:
#_00E2A3: db $18, $10, $00, $10, $00
#_00E2A8: db $18, $10, $10, $50, $00
#_00E2AD: db $18, $10, $30, $50, $40
#_00E2B2: db $18, $10, $20, $10, $40

;---------------------------------------------------------------------------------------------------

data00E2B8:
#_00E2B8: db $18, $10, $01, $70, $00
#_00E2BD: db $18, $10, $11, $B0, $00
#_00E2C2: db $18, $10, $31, $B0, $40
#_00E2C7: db $18, $10, $21, $70, $40

;---------------------------------------------------------------------------------------------------

data00E2CD:
#_00E2CD: db $19, $11, $00, $48, $08
#_00E2D2: db $19, $11, $10, $88, $08
#_00E2D7: db $19, $11, $30, $88, $48
#_00E2DC: db $19, $11, $20, $48, $48

;---------------------------------------------------------------------------------------------------

data00E2E2:
#_00E2E2: db $19, $11, $01, $38, $08
#_00E2E7: db $19, $11, $11, $78, $08
#_00E2EC: db $19, $11, $31, $78, $48
#_00E2F1: db $19, $11, $21, $38, $48

;---------------------------------------------------------------------------------------------------

data00E2F7:
#_00E2F7: db $0D, $00, $00, $40, $48
#_00E2FC: db $0D, $00, $10, $80, $48

;---------------------------------------------------------------------------------------------------

data00E302:
#_00E302: db $0E, $00, $00, $40, $48
#_00E307: db $0E, $00, $10, $80, $48

;---------------------------------------------------------------------------------------------------

data00E30D:
#_00E30D: db $1A, $00, $00, $78, $40

;---------------------------------------------------------------------------------------------------

data00E313:
#_00E313: db $1A, $00, $00, $50, $40

;---------------------------------------------------------------------------------------------------

data00E319:
#_00E319: db $1A, $00, $00, $A0, $40

;---------------------------------------------------------------------------------------------------

data00E31F:
#_00E31F: db $1B, $00, $00, $40, $58
#_00E324: db $1C, $00, $00, $B0, $58
#_00E329: db $1D, $00, $00, $78, $08

;---------------------------------------------------------------------------------------------------

data00E32F:
#_00E32F: db $1E, $00, $00, $70, $48
#_00E334: db $1F, $00, $00, $80, $48
#_00E339: db $20, $00, $00, $78, $48

;---------------------------------------------------------------------------------------------------

data00E33F:
#_00E33F: db $21, $00, $00, $70, $38

;---------------------------------------------------------------------------------------------------

data00E345:
#_00E345: db $22, $12, $00, $40, $48

;---------------------------------------------------------------------------------------------------

data00E34B:
#_00E34B: db $23, $13, $00, $80, $40

;---------------------------------------------------------------------------------------------------

data00E351:
#_00E351: db $00, $14, $00, $80, $68
#_00E356: db $00, $14, $01, $60, $68

;---------------------------------------------------------------------------------------------------

data00E35C:
#_00E35C: db $24, $00, $00, $40, $08
#_00E361: db $24, $00, $10, $80, $08
#_00E366: db $24, $00, $30, $80, $48
#_00E36B: db $24, $00, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E371:
#_00E371: db $25, $00, $00, $70, $58

;---------------------------------------------------------------------------------------------------

data00E377:
#_00E377: db $25, $00, $00, $48, $58

;---------------------------------------------------------------------------------------------------

data00E37D:
#_00E37D: db $25, $00, $00, $98, $58

;---------------------------------------------------------------------------------------------------

data00E383:
#_00E383: db $25, $00, $00, $60, $58
#_00E388: db $25, $00, $00, $80, $58

;---------------------------------------------------------------------------------------------------

data00E38E:
#_00E38E: db $26, $00, $00, $60, $08
#_00E393: db $26, $00, $10, $80, $08
#_00E398: db $26, $00, $30, $80, $48
#_00E39D: db $26, $00, $20, $60, $48

;---------------------------------------------------------------------------------------------------

data00E3A3:
#_00E3A3: db $26, $00, $00, $38, $25
#_00E3A8: db $26, $00, $10, $58, $25

;---------------------------------------------------------------------------------------------------

data00E3AE:
#_00E3AE: db $26, $00, $00, $60, $25
#_00E3B3: db $26, $00, $10, $80, $25

;---------------------------------------------------------------------------------------------------

data00E3B9:
#_00E3B9: db $26, $00, $00, $98, $25
#_00E3BE: db $26, $00, $10, $B8, $25

;---------------------------------------------------------------------------------------------------

data00E3C4:
#_00E3C4: db $27, $00, $00, $58, $40
#_00E3C9: db $28, $00, $10, $80, $28

;---------------------------------------------------------------------------------------------------

data00E3CF:
#_00E3CF: db $29, $00, $00, $70, $68
#_00E3D4: db $2A, $00, $20, $60, $38

;---------------------------------------------------------------------------------------------------

data00E3DA:
#_00E3DA: db $2B, $00, $00, $90, $28

;---------------------------------------------------------------------------------------------------

data00E3E0:
#_00E3E0: db $2C, $00, $00, $90, $28

;---------------------------------------------------------------------------------------------------

data00E3E6:
#_00E3E6: db $2D, $15, $00, $A0, $18

;---------------------------------------------------------------------------------------------------

data00E3EC:
#_00E3EC: db $2D, $16, $10, $50, $18

;---------------------------------------------------------------------------------------------------

data00E3F2:
#_00E3F2: db $2E, $00, $00, $78, $40

;---------------------------------------------------------------------------------------------------

data00E3F8:
#_00E3F8: db $2F, $00, $00, $70, $38

;---------------------------------------------------------------------------------------------------

data00E3FE:
#_00E3FE: db $30, $00, $00, $60, $28

;---------------------------------------------------------------------------------------------------

data00E404:
#_00E404: db $2E, $00, $00, $50, $48

;---------------------------------------------------------------------------------------------------

data00E40A:
#_00E40A: db $2E, $00, $00, $70, $50

;---------------------------------------------------------------------------------------------------

data00E410:
#_00E410: db $2E, $00, $00, $A0, $48

;---------------------------------------------------------------------------------------------------

data00E416:
#_00E416: db $2F, $00, $00, $50, $48

;---------------------------------------------------------------------------------------------------

data00E41C:
#_00E41C: db $2F, $00, $00, $70, $50

;---------------------------------------------------------------------------------------------------

data00E422:
#_00E422: db $2F, $00, $00, $A0, $48

;---------------------------------------------------------------------------------------------------

data00E428:
#_00E428: db $30, $00, $00, $38, $38

;---------------------------------------------------------------------------------------------------

data00E42E:
#_00E42E: db $30, $00, $00, $90, $30

;---------------------------------------------------------------------------------------------------

data00E434:
#_00E434: db $04, $07, $00, $10, $08

;---------------------------------------------------------------------------------------------------

data00E43A:
#_00E43A: db $04, $08, $10, $B0, $08

;---------------------------------------------------------------------------------------------------

data00E440:
#_00E440: db $05, $08, $30, $B0, $48

;---------------------------------------------------------------------------------------------------

data00E446:
#_00E446: db $05, $07, $20, $10, $48

;---------------------------------------------------------------------------------------------------

data00E44C:
#_00E44C: db $07, $09, $00, $40, $08

;---------------------------------------------------------------------------------------------------

data00E452:
#_00E452: db $07, $0A, $10, $80, $08

;---------------------------------------------------------------------------------------------------

data00E458:
#_00E458: db $08, $0A, $30, $80, $48

;---------------------------------------------------------------------------------------------------

data00E45E:
#_00E45E: db $08, $09, $20, $40, $48

;---------------------------------------------------------------------------------------------------

data00E464:
#_00E464: db $0B, $00, $00, $40, $48
#_00E469: db $0B, $00, $10, $80, $48
#_00E46E: db $0B, $00, $30, $80, $08
#_00E473: db $0B, $00, $20, $40, $08

;---------------------------------------------------------------------------------------------------

data00E479:
#_00E479: db $0C, $00, $00, $40, $48
#_00E47E: db $0C, $00, $10, $80, $48
#_00E483: db $0C, $00, $30, $80, $08
#_00E488: db $0C, $00, $20, $40, $08

;---------------------------------------------------------------------------------------------------

data00E48E:
#_00E48E: db $17, $00, $00, $A0, $58

;---------------------------------------------------------------------------------------------------

data00E494:
#_00E494: db $21, $00, $00, $70, $38
#_00E499: db $21, $00, $00, $40, $30
#_00E49E: db $21, $00, $00, $A0, $30

;---------------------------------------------------------------------------------------------------

data00E4A4:
#_00E4A4: db $21, $00, $00, $70, $38
#_00E4A9: db $21, $00, $00, $50, $48
#_00E4AE: db $21, $00, $00, $90, $48

;---------------------------------------------------------------------------------------------------

data00E4B4:
#_00E4B4: db $21, $00, $00, $50, $48
#_00E4B9: db $21, $00, $00, $90, $48

;---------------------------------------------------------------------------------------------------

data00E4BF:
#_00E4BF: db $21, $00, $00, $40, $30
#_00E4C4: db $21, $00, $00, $A0, $30

;---------------------------------------------------------------------------------------------------

data00E4CA:
#_00E4CA: db $31, $00, $00, $70, $58

;---------------------------------------------------------------------------------------------------

data00E4D0:
#_00E4D0: db $31, $00, $00, $60, $58

;---------------------------------------------------------------------------------------------------

data00E4D6:
#_00E4D6: db $31, $00, $00, $80, $58

;---------------------------------------------------------------------------------------------------

data00E4DC:
#_00E4DC: db $32, $00, $00, $58, $60

;---------------------------------------------------------------------------------------------------

data00E4E2:
#_00E4E2: db $34, $00, $00, $60, $48
#_00E4E7: db $33, $00, $00, $70, $58

;---------------------------------------------------------------------------------------------------

data00E4ED:
#_00E4ED: db $35, $00, $00, $70, $08

;---------------------------------------------------------------------------------------------------

data00E4F3:
#_00E4F3: db $36, $00, $00, $78, $08

;---------------------------------------------------------------------------------------------------

data00E4F9:
#_00E4F9: db $37, $00, $00, $78, $58

;---------------------------------------------------------------------------------------------------

data00E4FF:
#_00E4FF: db $38, $17, $00, $60, $18
#_00E504: db $38, $18, $30, $90, $68

;---------------------------------------------------------------------------------------------------

data00E50A:
#_00E50A: db $39, $00, $00, $78, $48

;---------------------------------------------------------------------------------------------------

data00E510:
#_00E510: db $3A, $19, $00, $78, $18

;---------------------------------------------------------------------------------------------------

data00E516:
#_00E516: db $3B, $1A, $20, $60, $38

;---------------------------------------------------------------------------------------------------

data00E51C:
#_00E51C: db $3C, $00, $00, $70, $60

;===================================================================================================

routine00E522:
#_00E522: PHP
#_00E523: REP #$30

#_00E525: PHB
#_00E526: PHK
#_00E527: PLB

#_00E528: AND.w #$00FF
#_00E52B: CMP.w #$000C
#_00E52E: BCC .branch00E533

#_00E530: JMP .branch00E5B9

.branch00E533
#_00E533: TAY
#_00E534: LSR A
#_00E535: LSR A
#_00E536: STA.w $0640

#_00E539: ASL A
#_00E53A: TAX

#_00E53B: LDA.w data00E7DF,X
#_00E53E: STA.w $0642

#_00E541: TYA
#_00E542: AND.w #$0003
#_00E545: ASL A
#_00E546: TAX

#_00E547: LDA.w data00E757,X
#_00E54A: STA.w $0644

#_00E54D: LDA.w $0564
#_00E550: BNE .branch00E563

#_00E552: LDA.w #$00A0
#_00E555: STA.w $064C

#_00E558: LDA.w #$0010
#_00E55B: LDX.w #$0014
#_00E55E: LDY.w #$2640

#_00E561: BRA .branch00E572

.branch00E563
#_00E563: LDA.w #$00B0
#_00E566: STA.w $064C

#_00E569: LDA.w #$0017
#_00E56C: LDX.w #$001B
#_00E56F: LDY.w #$2660

.branch00E572
#_00E572: STA.w $0646
#_00E575: STX.w $0648
#_00E578: STY.w $064A
#_00E57B: JSR routine00E6EF

#_00E57E: STZ.w $064E

.branch00E581
#_00E581: JSR routine00E719
#_00E584: JSL AddSelfAsVector

#_00E588: INC.w $064E

#_00E58B: LDA.w $064E
#_00E58E: CMP.w $0642
#_00E591: BNE .branch00E581

#_00E593: LDA.w #$0002
#_00E596: STA.w $064E

#_00E599: JSR routine00E719

#_00E59C: LDA.w $0646
#_00E59F: ASL A
#_00E5A0: TAX

#_00E5A1: LDA.w $0648
#_00E5A4: ASL A
#_00E5A5: TAY

#_00E5A6: LDA.w #$0000
#_00E5A9: STA.w $0040,X
#_00E5AC: STA.w $0040,Y

#_00E5AF: JSR routine00E706
#_00E5B2: JSL AddSelfAsVector

#_00E5B6: JMP .exit

;---------------------------------------------------------------------------------------------------

.branch00E5B9
#_00E5B9: SEC
#_00E5BA: SBC.w #$000C

#_00E5BD: SEP #$30

#_00E5BF: TAX

#_00E5C0: LDA.w data00E7E5,X
#_00E5C3: STA.w $0650

#_00E5C6: LDA.w data00E7E8,X
#_00E5C9: STA.w $0646
#_00E5CC: STA.w $0640

#_00E5CF: TAX

#_00E5D0: STZ.w $0652
#_00E5D3: STZ.w $0654

#_00E5D6: LDA.w $0F51
#_00E5D9: STA.w $0653

#_00E5DC: LDA.w $0F53
#_00E5DF: STA.w $0655

#_00E5E2: JSR routine00E6B0

;---------------------------------------------------------------------------------------------------

#_00E5E5: REP #$30

#_00E5E7: PHB

#_00E5E8: LDA.w #$001F
#_00E5EB: LDX.w #$2540
#_00E5EE: LDY.w #$2560
#_00E5F1: MVN $7E, $7E

#_00E5F4: PLB

#_00E5F5: SEP #$30

#_00E5F7: LDA.b #$08
#_00E5F9: LDX.b #$00
#_00E5FB: LDY.b #$0C
#_00E5FD: STA.w $0EDC
#_00E600: STX.w $0EDF
#_00E603: STY.w $0EDA
#_00E606: JSL routine009534

#_00E60A: LDA.b #$30
#_00E60C: STA.w $0F09

#_00E60F: REP #$30

#_00E611: LDA.w #$2360
#_00E614: STA.w DMA1ADDRL

#_00E617: LDA.w #$0020
#_00E61A: STA.w DMA1SIZEL

#_00E61D: JSL AddSelfAsVector

;---------------------------------------------------------------------------------------------------

#_00E621: PHB

#_00E622: SEP #$20

#_00E624: LDA.b #$7F
#_00E626: PHA

#_00E627: REP #$20
#_00E629: PLB

#_00E62A: LDX.w #$5000
#_00E62D: LDY.w #$01C0

.next_a
#_00E630: LDA.w $7F0000,X
#_00E633: AND.w #$E3FF
#_00E636: ORA.w #$0C00
#_00E639: STA.w $7F0000,X

#_00E63C: INX
#_00E63D: INX

#_00E63E: DEY
#_00E63F: BNE .next_a

#_00E641: PLB

;---------------------------------------------------------------------------------------------------

#_00E642: SEP #$20

#_00E644: LDA.b #$01
#_00E646: JSL VRAM_From_7FXXXX

#_00E64A: SEP #$30

#_00E64C: LDX.w $0640
#_00E64F: JSR routine00E6B0
#_00E652: JSL AddSelfAsVector

#_00E656: INC.w $0640
#_00E659: INC.w $0640

#_00E65C: PHB

#_00E65D: LDA.b #$7F
#_00E65F: PHA
#_00E660: PLB

#_00E661: REP #$30

#_00E663: LDX.w #$5000
#_00E666: LDY.w #$01C0

.next_b
#_00E669: LDA.w $7F0000,X
#_00E66C: AND.w #$E3FF
#_00E66F: ORA.w #$0800
#_00E672: STA.w $7F0000,X

#_00E675: INX
#_00E676: INX

#_00E677: DEY
#_00E678: BNE .next_b

#_00E67A: PLB

;---------------------------------------------------------------------------------------------------

#_00E67B: SEP #$20

#_00E67D: LDA.b #$01
#_00E67F: JSL VRAM_From_7FXXXX

#_00E683: SEP #$30

.next_c
#_00E685: LDY.b #$02

.wait
#_00E687: LDX.w $0640
#_00E68A: JSR routine00E6B0
#_00E68D: BEQ .skip

#_00E68F: PHY
#_00E690: JSL AddSelfAsVector
#_00E694: PLY

#_00E695: DEY
#_00E696: BNE .wait

#_00E698: INC.w $0640
#_00E69B: INC.w $0640
#_00E69E: BRA .next_c

.skip
#_00E6A0: SEP #$20

#_00E6A2: LDA.w $0646
#_00E6A5: STA.w $0640

#_00E6A8: DEC.w $0650
#_00E6AB: BNE .next_c

.exit
#_00E6AD: PLB
#_00E6AE: PLP

#_00E6AF: RTL

;===================================================================================================

routine00E6B0:
#_00E6B0: REP #$20

#_00E6B2: LDA.w data00E7EB,X
#_00E6B5: BNE .continue

#_00E6B7: RTS

.continue
#_00E6B8: LDA.w $0652
#_00E6BB: CLC
#_00E6BC: ADC.w data00E7EB,X
#_00E6BF: STA.w $0652

#_00E6C2: SEP #$20

#_00E6C4: STZ.w $0F52

#_00E6C7: LDA.w $0653
#_00E6CA: STA.w $0F51

#_00E6CD: ASL A
#_00E6CE: ROL.w $0F52

#_00E6D1: REP #$20

#_00E6D3: LDA.w $0654
#_00E6D6: CLC
#_00E6D7: ADC.w data00E7EB,X
#_00E6DA: STA.w $0654

#_00E6DD: SEP #$20

#_00E6DF: STZ.w $0F54

#_00E6E2: LDA.w $0655
#_00E6E5: STA.w $0F53
#_00E6E8: ASL A
#_00E6E9: ROL.w $0F54

#_00E6EC: LDA.b #$FF
#_00E6EE: RTS

;===================================================================================================

routine00E6EF:
#_00E6EF: LDA.w $0646
#_00E6F2: ASL A
#_00E6F3: TAX

#_00E6F4: LDA.w $0648
#_00E6F7: ASL A
#_00E6F8: TAY

#_00E6F9: LDA.w $0640
#_00E6FC: CLC
#_00E6FD: ADC.w #$0025
#_00E700: STA.w $0040,X
#_00E703: STA.w $0040,Y

;---------------------------------------------------------------------------------------------------

routine00E706:
#_00E706: SEP #$30

#_00E708: LDX.w $0646
#_00E70B: LDY.w $0648

#_00E70E: LDA.b #$80
#_00E710: STA.w $1A20,X
#_00E713: STA.w $1A20,Y

#_00E716: REP #$30
#_00E718: RTS

;===================================================================================================

routine00E719:
#_00E719: LDA.w $064E
#_00E71C: LSR A
#_00E71D: BCC .continue

#_00E71F: RTS

.continue
#_00E720: PHB

#_00E721: LSR A
#_00E722: BCC .from_rom

#_00E724: LDA.w #$001F
#_00E727: LDX.w $064A
#_00E72A: LDY.w #$2300
#_00E72D: MVN $7E, $7E

#_00E730: BRA .finish

.from_rom
#_00E732: LDA.w #$001F
#_00E735: LDX.w $0644
#_00E738: LDY.w #$2300
#_00E73B: %MVN($00, $7E)

;---------------------------------------------------------------------------------------------------

.finish
#_00E73E: PLB

#_00E73F: SEP #$20

#_00E741: LDA.b #$01
#_00E743: STA.l $7E22FD

#_00E747: LDA.w $064C
#_00E74A: STA.l $7E22FE

#_00E74E: LDA.b #$10
#_00E750: STA.l $7E22FF

#_00E754: REP #$20
#_00E756: RTS

;===================================================================================================

data00E757:
#_00E757: dw data00E75F
#_00E759: dw data00E77F
#_00E75B: dw data00E79F
#_00E75D: dw data00E7BF

;---------------------------------------------------------------------------------------------------

data00E75F:
#_00E75F: dw $0000,$001C,$109C,$211C
#_00E767: dw $319C,$421C,$529C,$631C
#_00E76F: dw $631C,$529C,$421C,$319C
#_00E777: dw $211C,$109C,$001C,$739C

;---------------------------------------------------------------------------------------------------

data00E77F:
#_00E77F: dw $0000,$7000,$7084,$7108
#_00E787: dw $718C,$7210,$7294,$7318
#_00E78F: dw $7318,$7294,$7210,$718C
#_00E797: dw $7108,$7084,$7000,$739C

;---------------------------------------------------------------------------------------------------

data00E79F:
#_00E79F: dw $0000,$0090,$0114,$0218
#_00E7A7: dw $029C,$039C,$339C,$539C
#_00E7AF: dw $539C,$339C,$039C,$029C
#_00E7B7: dw $0218,$0114,$0090,$739C

;---------------------------------------------------------------------------------------------------

data00E7BF:
#_00E7BF: dw $0000,$7210,$7294,$7318
#_00E7C7: dw $739C,$739C,$739C,$739C
#_00E7CF: dw $739C,$739C,$739C,$739C
#_00E7D7: dw $7318,$7294,$7210,$739C

;---------------------------------------------------------------------------------------------------

data00E7DF:
#_00E7DF: dw $000A,$0012,$001A

data00E7E5:
#_00E7E5: db $02,$02,$03

data00E7E8:
#_00E7E8: db $00,$0C,$1C

data00E7EB:
#_00E7EB: dw $FF80,$0100,$FF00,$0100
#_00E7F3: dw $FF80,$0000,$FF00,$0200
#_00E7FB: dw $FE00,$0200,$FE00,$0200
#_00E803: dw $FF00,$0000,$FE80,$0300
#_00E80B: dw $FD00,$0300,$FD00,$0300
#_00E813: dw $FE80,$0000

;===================================================================================================

routine00E817:
#_00E817: PHP

#_00E818: REP #$30

#_00E81A: PHB
#_00E81B: PHK
#_00E81C: PLB

#_00E81D: AND.w #$00FF
#_00E820: CMP.w #$0002
#_00E823: BNE .continue

#_00E825: JMP routine00E8CC

.continue
#_00E828: ASL A
#_00E829: TAX

#_00E82A: LDA.w data00EA22,X
#_00E82D: STA.w $0640

#_00E830: PHB

#_00E831: LDA.w #$001F
#_00E834: LDX.w #$2540
#_00E837: LDY.w #$2560
#_00E83A: MVN $7E, $7E

#_00E83D: PLB

#_00E83E: SEP #$30

#_00E840: LDY.b #$0C
#_00E842: JSR routine00E961
#_00E845: JSL AddSelfAsVector

#_00E849: LDX.w $0640

#_00E84C: LDA.w data00EA2C,X
#_00E84F: AND.w #$00FF
#_00E852: JSR routine00E9A8_0C00

#_00E855: JSR routine00E986

.branch00E858
#_00E858: LDX.w $0640

#_00E85B: LDA.w data00EA2C,X
#_00E85E: AND.w #$00FF
#_00E861: JSR routine00E9A8_0800

;---------------------------------------------------------------------------------------------------

#branch00E864:
#_00E864: LDX.w $0640
#_00E867: INX
#_00E868: INX
#_00E869: STX.w $0640

#_00E86C: LDA.w data00EA2C,X
#_00E86F: AND.w #$00FF
#_00E872: JSR routine00E9A8_0C00
#_00E875: JSR routine00E986

#_00E878: LDX.w $0640
#_00E87B: INX
#_00E87C: INX

#_00E87D: LDA.w data00EA2C,X
#_00E880: AND.w #$00FF
#_00E883: CMP.w #$00FE
#_00E886: BEQ routine00E8A0

#_00E888: CMP.w #$00FF
#_00E88B: BNE .branch00E858

#_00E88D: LDX.w $0640

#_00E890: LDA.w data00EA2C,X
#_00E893: AND.w #$00FF
#_00E896: JSR routine00E9A8_0800

#_00E899: JSL AddSelfAsVector

;---------------------------------------------------------------------------------------------------

#EXIT_00E89D:
#_00E89D: PLB
#_00E89E: PLP

#_00E89F: RTL

;===================================================================================================

routine00E8A0:
#_00E8A0: LDA.w #$0800
#_00E8A3: STA.w $0642
#_00E8A6: LDX.w #$0021

.next
#_00E8A9: PHX

#_00E8AA: LDX.w $0640

#_00E8AD: LDA.w data00EA2C,X
#_00E8B0: AND.w #$00FF
#_00E8B3: JSR routine00E9A8

#_00E8B6: JSL AddSelfAsVector

#_00E8BA: LDA.w $0642
#_00E8BD: EOR.w #$0400
#_00E8C0: STA.w $0642

#_00E8C3: PLX
#_00E8C4: DEX
#_00E8C5: BNE .next

#_00E8C7: INC.w $0640

#_00E8CA: BRA branch00E864

;---------------------------------------------------------------------------------------------------

routine00E8CC:
#_00E8CC: STZ.w $0650

#_00E8CF: SEP #$30

#_00E8D1: LDA.b #$04
#_00E8D3: LDX.b #$00
#_00E8D5: LDY.b #$08
#_00E8D7: STA.w $0EDC
#_00E8DA: STX.w $0EDF
#_00E8DD: STY.w $0EDA

#_00E8E0: JSL routine009337

#_00E8E4: STZ.w $0F06

#_00E8E7: REP #$30

#_00E8E9: PHB

#_00E8EA: LDA.w #$001F
#_00E8ED: LDX.w #$2340
#_00E8F0: LDY.w #$2560
#_00E8F3: MVN $7E, $7E

#_00E8F6: PLB

#_00E8F7: SEP #$30

#_00E8F9: LDY.b #$01
#_00E8FB: JSR routine00E961

#_00E8FE: JSL AddSelfAsVector

#_00E902: REP #$30

#_00E904: LDA.w #$0001
#_00E907: JSR routine00E9A8_0C00

#_00E90A: SEP #$30

#_00E90C: LDY.b #$01

.next_a
#_00E90E: PHY

#_00E90F: JSR routine00E961

#_00E912: LDX.w $0650

#_00E915: LDA.w .delay_count,X
#_00E918: AND.w #$00FF
#_00E91B: INC.w $0650
#_00E91E: JSL Do19XXVectorsATimes

#_00E922: SEP #$30
#_00E924: PLY
#_00E925: INY
#_00E926: CPY.b #$0B
#_00E928: BNE .next_a

#_00E92A: DEC.w $0650
#_00E92D: DEY

;---------------------------------------------------------------------------------------------------

.next_b
#_00E92E: PHY

#_00E92F: JSR routine00E961

#_00E932: LDX.w $0650

#_00E935: LDA.w .delay_count,X
#_00E938: AND.w #$00FF
#_00E93B: DEC.w $0650

#_00E93E: JSL Do19XXVectorsATimes

#_00E942: SEP #$30

#_00E944: PLY
#_00E945: DEY
#_00E946: BNE .next_b

;---------------------------------------------------------------------------------------------------

#_00E948: REP #$30

#_00E94A: LDA.w #$0001
#_00E94D: JSR routine00E9A8_0800

#_00E950: JSL AddSelfAsVector

#_00E954: JMP EXIT_00E89D

;---------------------------------------------------------------------------------------------------

.delay_count
#_00E957: db $02, $02
#_00E959: db $02, $02
#_00E95B: db $03, $03
#_00E95D: db $04, $04
#_00E95F: db $05, $04

;===================================================================================================

routine00E961:
#_00E961: LDA.b #$08
#_00E963: LDX.b #$00
#_00E965: STA.w $0EDC
#_00E968: STX.w $0EDF

#_00E96B: STY.w $0EDA

#_00E96E: JSL routine009534

#_00E972: LDA.b #$30
#_00E974: STA.w $0F09

#_00E977: REP #$30

#_00E979: LDA.w #$2360
#_00E97C: STA.w DMA1ADDRL

#_00E97F: LDA.w #$0020
#_00E982: STA.w DMA1SIZEL

#_00E985: RTS

;===================================================================================================
; TODO weird
routine00E986:
#_00E986: LDX.w $0640
#_00E989: INX

#_00E98A: LDA.w data00EA2C,X
#_00E98D: AND.w #$00FF
#_00E990: STA.w $064A

.next
#_00E993: JSL AddSelfAsVector

#_00E997: DEC.w $064A
#_00E99A: BNE .next

#_00E99C: RTS

;===================================================================================================

routine00E9A8_0800:
#_00E99D: LDY.w #$0800

#_00E9A0: BRA .start

#routine00E9A8_0C00:
#_00E9A2: LDY.w #$0C00

.start
#_00E9A5: STY.w $0642

;---------------------------------------------------------------------------------------------------

routine00E9A8:
#_00E9A8: ASL A
#_00E9A9: TAY

#_00E9AA: LDA.w data00EA68,Y
#_00E9AD: TAY

#_00E9AE: LDA.w data00EA92,Y

#_00E9B1: INY
#_00E9B2: INY

#_00E9B3: STA.w $064C
#_00E9B6: STZ.w $064E

.big_next
#_00E9B9: LDA.w $064E
#_00E9BC: BNE .branch00E9CB

#_00E9BE: LDA.w data00EA92,Y
#_00E9C1: BPL .branch00E9D6

#_00E9C3: AND.w #$00FF
#_00E9C6: STA.w $064E
#_00E9C9: BRA .branch00E9CE

.branch00E9CB
#_00E9CB: DEC.w $064E

.branch00E9CE
#_00E9CE: TYA
#_00E9CF: SEC
#_00E9D0: SBC.w #$0004
#_00E9D3: TAY

#_00E9D4: BRA .branch00E9D9

.branch00E9D6
#_00E9D6: TAX

#_00E9D7: INY
#_00E9D8: INY

.branch00E9D9
#_00E9D9: LDA.w data00EA92,Y
#_00E9DC: STA.w $0646

#_00E9DF: INY
#_00E9E0: INY

#_00E9E1: LDA.w data00EA92,Y
#_00E9E4: STA.w $0648

#_00E9E7: INY
#_00E9E8: INY

#_00E9E9: PHY

#_00E9EA: LDY.w #$0020

.small_next
#_00E9ED: LDA.w #$0800
#_00E9F0: ASL.w $0648
#_00E9F3: ROL.w $0646
#_00E9F6: BCC .branch00E9FB

#_00E9F8: LDA.w $0642

.branch00E9FB
#_00E9FB: STA.w $0644

#_00E9FE: LDA.l $7F0000,X
#_00EA02: AND.w #$E3FF
#_00EA05: ORA.w $0644
#_00EA08: STA.l $7F0000,X

#_00EA0C: INX
#_00EA0D: INX

#_00EA0E: DEY
#_00EA0F: BNE .small_next

#_00EA11: PLY
#_00EA12: DEC.w $064C
#_00EA15: BNE .big_next

;---------------------------------------------------------------------------------------------------

#_00EA17: PHP
#_00EA18: SEP #$20

#_00EA1A: LDA.b #$01

#_00EA1C: JSL VRAM_From_7FXXXX

#_00EA20: PLP
#_00EA21: RTS

;---------------------------------------------------------------------------------------------------

data00EA22:
#_00EA22: dw $0000,$000B,$0000,$0016
#_00EA2A: dw $002A

data00EA2C:
#_00EA2C: dw $0100,$0101,$0102,$0203
#_00EA34: dw $0204,$04FF
#_00EA38: db $02,$03,$02,$02,$01,$01,$01,$00
#_00EA40: db $01,$FF,$05,$06,$06,$06,$07,$05
#_00EA48: db $08,$05,$09,$04,$01,$03,$FE,$0A
#_00EA50: db $05,$0B,$06,$0C,$07,$FF,$0D,$06
#_00EA58: db $0E,$06,$0F,$05,$10,$05,$11,$04
#_00EA60: db $12,$03,$FE,$13,$05,$14,$06,$FF

data00EA68:
#_00EA68: db $00,$00,$12,$00,$1C,$00,$26,$00
#_00EA70: db $30,$00,$38,$00,$40,$00,$4A,$00
#_00EA78: db $54,$00,$5E,$00,$68,$00,$72,$00
#_00EA80: db $7C,$00,$86,$00,$8E,$00,$98,$00
#_00EA88: db $A2,$00,$AC,$00,$B6,$00,$C0,$00
#_00EA90: db $CA,$00

data00EA92:
#_00EA92: db $06,$00,$00,$50,$FF,$3F,$FC,$FF
#_00EA9A: db $02,$FF,$C0,$52,$FF,$3F,$FC,$FF
#_00EAA2: db $02,$FF,$0E,$00,$00,$50,$FF,$3F
#_00EAAA: db $FC,$FF,$0D,$FF,$0A,$00,$80,$50
#_00EAB2: db $FF,$3F,$FC,$FF,$09,$FF,$03,$00
#_00EABA: db $80,$51,$FF,$3F,$FC,$FF,$02,$FF
#_00EAC2: db $01,$00,$C0,$51,$FF,$3F,$FC,$FF
#_00EACA: db $01,$00,$00,$50,$FF,$3F,$FC,$FF
#_00EAD2: db $02,$00,$00,$50,$FF,$3F,$FC,$FF
#_00EADA: db $01,$FF,$04,$00,$00,$50,$FF,$3F
#_00EAE2: db $FC,$FF,$03,$FF,$07,$00,$00,$50
#_00EAEA: db $FF,$3F,$FC,$FF,$06,$FF,$0A,$00
#_00EAF2: db $00,$50,$FF,$3F,$FC,$FF,$09,$FF
#_00EAFA: db $0E,$00,$00,$50,$3E,$1F,$F8,$7C
#_00EB02: db $0D,$FF,$0E,$00,$00,$50,$1C,$0E
#_00EB0A: db $70,$38,$0D,$FF,$0E,$00,$00,$50
#_00EB12: db $08,$04,$20,$10,$0D,$FF,$01,$00
#_00EB1A: db $00,$50,$FF,$03,$C0,$FF,$02,$00
#_00EB22: db $00,$50,$FF,$03,$C0,$FF,$01,$FF
#_00EB2A: db $04,$00,$00,$50,$FF,$03,$C0,$FF
#_00EB32: db $03,$FF,$06,$00,$00,$50,$FF,$03
#_00EB3A: db $C0,$FF,$05,$FF,$09,$00,$00,$50
#_00EB42: db $FF,$03,$C0,$FF,$08,$FF,$0C,$00
#_00EB4A: db $00,$50,$FF,$03,$C0,$FF,$0B,$FF
#_00EB52: db $0C,$00,$00,$50,$CE,$01,$80,$73
#_00EB5A: db $0B,$FF,$0C,$00,$00,$50,$84,$00
#_00EB62: db $00,$21,$0B,$FF

;===================================================================================================

DisplayUnderworldMap:
#_00EB66: PHP
#_00EB67: CLC

#_00EB68: REP #$30

#_00EB6A: LDA.w #$0000
#_00EB6D: STA.w $0D11

.next
#_00EB70: JSR UploadDungeonMapPalette
#_00EB73: JSR ClearDungeonMap
#_00EB76: JSR UploadDungeonMapGraphics

#_00EB79: REP #$30

#_00EB7B: JSR routine00ED6A
#_00EB7E: JSR routine00ED94
#_00EB81: JSR routine00EF93

#_00EB84: REP #$30

#_00EB86: JSR routine00F547

#_00EB89: LDA.w #$0000
#_00EB8C: JSL VRAM_From_7FXXXX
#_00EB90: JSL AddSelfAsVector

#_00EB94: REP #$30

#_00EB96: JSR routine00F5D7

#_00EB99: REP #$30

#_00EB9B: LDA.w $0D11
#_00EB9E: CMP.w #$0001
#_00EBA1: BEQ .next

#_00EBA3: JSR routine00EC1C

#_00EBA6: PLP
#_00EBA7: RTL

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00EBA8:
#_00EBA8: REP #$30

#_00EBAA: LDA.w $070C
#_00EBAD: LSR A
#_00EBAE: AND.w #$FFFE
#_00EBB1: STA.w $0CF3

#_00EBB4: LDA.w $070D
#_00EBB7: LSR A
#_00EBB8: LSR A
#_00EBB9: AND.w #$FFC0
#_00EBBC: CLC
#_00EBBD: ADC.w $0CF3
#_00EBC0: STA.w $0CF3

#_00EBC3: TAX

#_00EBC4: RTS

;===================================================================================================

UploadDungeonMapGraphics:
#_00EBC5: REP #$10

#_00EBC7: LDA.w #$3000
#_00EBCA: STA.w $0CF3

#_00EBCD: SEP #$20

#_00EBCF: LDA.b #$80
#_00EBD1: STA.w VMAIN

#_00EBD4: SEP #$20

#_00EBD6: LDX.w #$0000
#_00EBD9: LDY.w #$06C0

.next
#_00EBDC: LDA.l GFX_23F900,X
#_00EBE0: STA.l $7F6000,X

#_00EBE4: INX

#_00EBE5: DEY
#_00EBE6: BNE .next

#_00EBE8: REP #$20

#_00EBEA: LDA.w #$0004
#_00EBED: JSL VRAM_From_7FXXXX
#_00EBF1: JSL AddSelfAsVector

#_00EBF5: REP #$30
#_00EBF7: RTS

;===================================================================================================

ClearDungeonMap:
#_00EBF8: REP #$20

#_00EBFA: LDX.w #$0000
#_00EBFD: LDY.w #$0400
#_00EC00: LDA.w #$1400

.fill_next
#_00EC03: STA.l $7F7000,X

#_00EC07: INX
#_00EC08: INX

#_00EC09: DEY
#_00EC0A: BNE .fill_next

#_00EC0C: REP #$20

#_00EC0E: LDA.w #$0000
#_00EC11: JSL VRAM_From_7FXXXX
#_00EC15: JSL AddSelfAsVector

#_00EC19: REP #$30
#_00EC1B: RTS

;===================================================================================================

routine00EC1C:
#_00EC1C: REP #$30

#_00EC1E: LDX.w #$0000
#_00EC21: LDY.w #$0800
#_00EC24: LDA.w #$0000

.next
#_00EC27: STA.l $7F7000,X
#_00EC2B: STA.l $7F6000,X

#_00EC2F: INX
#_00EC30: INX

#_00EC31: DEY
#_00EC32: BNE .next

#_00EC34: REP #$20

#_00EC36: LDA.w #$0000
#_00EC39: JSL VRAM_From_7FXXXX
#_00EC3D: JSL AddSelfAsVector

#_00EC41: REP #$30

#_00EC43: LDA.w #$0004
#_00EC46: JSL VRAM_From_7FXXXX
#_00EC4A: JSL AddSelfAsVector

#_00EC4E: REP #$30
#_00EC50: RTS

;===================================================================================================

UploadDungeonMapPalette:
#_00EC51: SEP #$20
#_00EC53: REP #$10

#_00EC55: LDA.b #$50
#_00EC57: STA.l $7E22FE

#_00EC5B: LDA.b #$10
#_00EC5D: STA.l $7E22FF

#_00EC61: LDX.w #$0000
#_00EC64: LDY.w #$0020

.next
#_00EC67: LDA.l DungeonMapPalette,X
#_00EC6B: STA.l $7E2300,X

#_00EC6F: INX

#_00EC70: DEY
#_00EC71: BNE .next

#_00EC73: LDA.b #$01
#_00EC75: STA.l $7E22FD

#_00EC79: JSL AddSelfAsVector

#_00EC7D: RTS

;===================================================================================================

GetRoomsOffsetIntoData:
#_00EC7E: REP #$30

#_00EC80: PHY

#_00EC81: LDA.w $0CF5
#_00EC84: AND.w #$007F
#_00EC87: ASL A
#_00EC88: STA.w $0CF9

#_00EC8B: LDA.w $0CF7
#_00EC8E: AND.w #$003F
#_00EC91: LDY.w #$0008

#_00EC94: JSR Shift16bitAleft_Ytimes
#_00EC97: ORA.w $0CF9
#_00EC9A: AND.w #$3FFE
#_00EC9D: STA.w $0CF9

#_00ECA0: PLY

#_00ECA1: RTS

;===================================================================================================
; $0CF5 = ..xxxxx.
; $0CF7 = ..yyyy..
; $0CF9 = .... ..yy yyxx xxx.
;===================================================================================================
GetBlockOffsetIntoData:
#_00ECA2: REP #$30

#_00ECA4: PHY

#_00ECA5: LDA.w $0CF5
#_00ECA8: LSR A
#_00ECA9: AND.w #$003E
#_00ECAC: STA.w $0CF9

#_00ECAF: LDA.w $0CF7
#_00ECB2: LDY.w #$0004
#_00ECB5: JSR Shift16bitAleft_Ytimes

#_00ECB8: AND.w #$03C0
#_00ECBB: ORA.w $0CF9
#_00ECBE: STA.w $0CF9

#_00ECC1: PLY
#_00ECC2: RTS

;===================================================================================================
; TODO get bit that corresponds to the room maybe?
routine00ECC3:
#_00ECC3: REP #$30

#_00ECC5: PHY
#_00ECC6: PHX

#_00ECC7: LDA.w $0CF5
#_00ECCA: LSR A
#_00ECCB: LSR A
#_00ECCC: LSR A
#_00ECCD: AND.w #$000F
#_00ECD0: STA.w $0CF9

#_00ECD3: LDA.w $0CF7
#_00ECD6: LDY.w #$0004
#_00ECD9: JSR Shift16bitAleft_Ytimes

#_00ECDC: AND.w #$03F0
#_00ECDF: ORA.w $0CF9
#_00ECE2: STA.w $0CF9

#_00ECE5: LDA.w $0CF5
#_00ECE8: AND.w #$0007
#_00ECEB: TAX

#_00ECEC: SEP #$20

#_00ECEE: LDA.l .bits,X

#_00ECF2: REP #$20

#_00ECF4: AND.w #$00FF

#_00ECF7: PLX
#_00ECF8: PLY

#_00ECF9: RTS

.bits
#_00ECFA: db $80, $40, $20, $10, $08, $04, $02, $01

;===================================================================================================

; TODO unused?
routine00ED02:
#_00ED02: REP #$10

#_00ED04: PHY

#_00ED05: LDA.w $0CF5
#_00ED08: LSR A
#_00ED09: LSR A
#_00ED0A: AND.w #$001F
#_00ED0D: STA.w $0CFB

#_00ED10: LDA.w $0CF7
#_00ED13: LSR A
#_00ED14: LSR A
#_00ED15: AND.w #$000F
#_00ED18: STA.w $0CFD

#_00ED1B: PLY

#_00ED1C: RTS

;===================================================================================================

routine00ED1D:
#_00ED1D: REP #$10

#_00ED1F: PHY

#_00ED20: LDA.w $0CFB
#_00ED23: ASL A
#_00ED24: ASL A
#_00ED25: AND.w #$007C
#_00ED28: STA.w $0CF5

#_00ED2B: LDA.w $0CFD
#_00ED2E: ASL A
#_00ED2F: ASL A
#_00ED30: AND.w #$003C
#_00ED33: STA.w $0CF7

#_00ED36: PLY

#_00ED37: RTS

;===================================================================================================
; TODO unused?
routine00ED38:
#_00ED38: REP #$30

#_00ED3A: PHY

#_00ED3B: LDA.w $0CFB
#_00ED3E: AND.w #$001F
#_00ED41: ASL A
#_00ED42: STA.w $0CF9

#_00ED45: LDA.w $0CF7
#_00ED48: AND.w #$000F
#_00ED4B: LDY.w #$0006
#_00ED4E: JSR Shift16bitAleft_Ytimes

#_00ED51: ORA.w $0CF9
#_00ED54: AND.w #$03FE
#_00ED57: STA.w $0CF9

#_00ED5A: PLY
#_00ED5B: RTS

;===================================================================================================

Shift16bitAleft_Ytimes:
#_00ED5C: REP #$30

.next
#_00ED5E: ASL A

#_00ED5F: DEY
#_00ED60: BNE .next

#_00ED62: RTS

;===================================================================================================

Shift16bitAright_Ytimes:
#_00ED63: REP #$30

.next
#_00ED65: LSR A

#_00ED66: DEY
#_00ED67: BNE .next

#_00ED69: RTS

;===================================================================================================

routine00ED6A:
#_00ED6A: REP #$30

#_00ED6C: LDA.w #$0000
#_00ED6F: STA.w $0CF5
#_00ED72: STA.w $0CF7

#_00ED75: SEP #$20

#_00ED77: LDA.w $070C
#_00ED7A: STA.w $0CF5

#_00ED7D: LDA.w $070D
#_00ED80: STA.w $0CF7

#_00ED83: REP #$20

#_00ED85: JSR GetBlockOffsetIntoData
#_00ED88: TAX

#_00ED89: LDA.l DungeonIDByBlock,X
#_00ED8D: AND.w #$FF3F
#_00ED90: STA.w $0CF3

#_00ED93: RTS

;===================================================================================================
; TODO make .facing_direction labels fully qualified routine00ED94_direction
; the EXIT_ too
routine00ED94:
#_00ED94: SEP #$30

; TODO directions
#_00ED96: LDA.w $040D
#_00ED99: BEQ routine00ED94_north

#_00ED9B: CMP.b #$01
#_00ED9D: BEQ routine00ED94_east

#_00ED9F: CMP.b #$02
#_00EDA1: BNE .not_facing_south

#_00EDA3: JMP routine00ED94_south

.not_facing_south
#_00EDA6: JMP routine00ED94_west

;---------------------------------------------------------------------------------------------------

routine00ED94_north:
#_00EDA9: REP #$30

#_00EDAB: LDX.w #$0000

#_00EDAE: LDA.w #$0000
#_00EDB1: STA.w $0CFB
#_00EDB4: STA.w $0CFD

#_00EDB7: LDY.w #$0020

.branch00ADBA
#_00EDBA: PHX
#_00EDBB: PHY

#_00EDBC: LDY.w #$0010

.branch00EDBF
#_00EDBF: LDA.l DungeonIDByBlock,X
#_00EDC3: AND.w #$FF3F
#_00EDC6: CMP.w $0CF3
#_00EDC9: BEQ .branch00EDE1

#_00EDCB: TXA
#_00EDCC: CLC
#_00EDCD: ADC.w #$0040
#_00EDD0: TAX
#_00EDD1: DEY
#_00EDD2: BNE .branch00EDBF

#_00EDD4: INC.w $0CFB
#_00EDD7: PLY
#_00EDD8: PLX
#_00EDD9: INX
#_00EDDA: INX
#_00EDDB: DEY
#_00EDDC: BNE .branch00ADBA

#_00EDDE: JMP routine00ED94_fail

.branch00EDE1
#_00EDE1: PLX
#_00EDE2: PLY
#_00EDE3: LDX.w #$0000
#_00EDE6: LDY.w #$0010

.branch00EDE9
#_00EDE9: PHX
#_00EDEA: PHY
#_00EDEB: LDY.w #$0020

.branch00EDEE
#_00EDEE: LDA.l DungeonIDByBlock,X
#_00EDF2: AND.w #$FF3F
#_00EDF5: CMP.w $0CF3
#_00EDF8: BEQ .done

#_00EDFA: INX
#_00EDFB: INX
#_00EDFC: DEY
#_00EDFD: BNE .branch00EDEE

#_00EDFF: CLC
#_00EE00: PLY
#_00EE01: PLA
#_00EE02: CLC
#_00EE03: ADC.w #$0040
#_00EE06: TAX
#_00EE07: INC.w $0CFD
#_00EE0A: DEY
#_00EE0B: BNE .branch00EDE9

#_00EE0D: JMP routine00ED94_fail

.done
#_00EE10: JMP routine00ED94_finished

;---------------------------------------------------------------------------------------------------

routine00ED94_east:
#_00EE13: REP #$30
#_00EE15: LDX.w #$003E
#_00EE18: LDA.w #$001F
#_00EE1B: STA.w $0CFB
#_00EE1E: LDA.w #$0000
#_00EE21: STA.w $0CFD
#_00EE24: LDY.w #$0010

.branch00EE27
#_00EE27: PHX
#_00EE28: PHY
#_00EE29: LDY.w #$0020

.branch00EE2C
#_00EE2C: LDA.l DungeonIDByBlock,X
#_00EE30: AND.w #$FF3F
#_00EE33: CMP.w $0CF3
#_00EE36: BEQ .branch00EE4D

#_00EE38: DEX
#_00EE39: DEX
#_00EE3A: DEY
#_00EE3B: BNE .branch00EE2C

#_00EE3D: PLY
#_00EE3E: PLA
#_00EE3F: CLC
#_00EE40: ADC.w #$0040
#_00EE43: TAX
#_00EE44: INC.w $0CFD
#_00EE47: DEY
#_00EE48: BNE .branch00EE27

#_00EE4A: JMP routine00ED94_fail

.branch00EE4D
#_00EE4D: PLX
#_00EE4E: PLY
#_00EE4F: LDX.w #$003E
#_00EE52: LDY.w #$0020

.branch00EE55
#_00EE55: PHX
#_00EE56: PHY
#_00EE57: LDY.w #$0010

.branch00EE5A
#_00EE5A: LDA.l DungeonIDByBlock,X
#_00EE5E: AND.w #$FF3F
#_00EE61: CMP.w $0CF3
#_00EE64: BEQ .done

#_00EE66: TXA
#_00EE67: CLC
#_00EE68: ADC.w #$0040
#_00EE6B: TAX
#_00EE6C: DEY
#_00EE6D: BNE .branch00EE5A

#_00EE6F: CLC
#_00EE70: PLY
#_00EE71: PLX
#_00EE72: DEX
#_00EE73: DEX
#_00EE74: DEC.w $0CFB
#_00EE77: DEY
#_00EE78: BNE .branch00EE55

#_00EE7A: JMP routine00ED94_fail

.done
#_00EE7D: JMP routine00ED94_finished

;---------------------------------------------------------------------------------------------------

routine00ED94_south:
#_00EE80: REP #$30
#_00EE82: LDX.w #$03FE
#_00EE85: LDA.w #$001F
#_00EE88: STA.w $0CFB
#_00EE8B: LDA.w #$000F
#_00EE8E: STA.w $0CFD
#_00EE91: LDY.w #$0020

.branch00EE94
#_00EE94: PHX
#_00EE95: PHY
#_00EE96: LDY.w #$0010

.branch00EE99
#_00EE99: LDA.l DungeonIDByBlock,X
#_00EE9D: AND.w #$FF3F
#_00EEA0: CMP.w $0CF3
#_00EEA3: BEQ .branch00EEBB

#_00EEA5: TXA
#_00EEA6: SEC
#_00EEA7: SBC.w #$0040
#_00EEAA: TAX
#_00EEAB: DEY
#_00EEAC: BNE .branch00EE99

#_00EEAE: PLY
#_00EEAF: PLX
#_00EEB0: DEX
#_00EEB1: DEX
#_00EEB2: DEC.w $0CFB
#_00EEB5: DEY
#_00EEB6: BNE .branch00EE94

#_00EEB8: JMP routine00ED94_fail

.branch00EEBB
#_00EEBB: PLX
#_00EEBC: PLY
#_00EEBD: LDX.w #$03FE
#_00EEC0: LDY.w #$0010

.branch00EEC3
#_00EEC3: PHX
#_00EEC4: PHY
#_00EEC5: LDY.w #$0020

.branch00EEC8
#_00EEC8: LDA.l DungeonIDByBlock,X
#_00EECC: AND.w #$FF3F
#_00EECF: CMP.w $0CF3
#_00EED2: BEQ .done

#_00EED4: DEX
#_00EED5: DEX
#_00EED6: DEY
#_00EED7: BNE .branch00EEC8

#_00EED9: CLC
#_00EEDA: PLY
#_00EEDB: PLA
#_00EEDC: SEC
#_00EEDD: SBC.w #$0040
#_00EEE0: TAX
#_00EEE1: DEC.w $0CFD
#_00EEE4: DEY
#_00EEE5: BNE .branch00EEC3

#_00EEE7: JMP routine00ED94_fail

.done
#_00EEEA: JMP routine00ED94_finished

;---------------------------------------------------------------------------------------------------

.facing_west
#_00EEED: REP #$30
#_00EEEF: LDX.w #$03C0
#_00EEF2: LDA.w #$0000
#_00EEF5: STA.w $0CFB
#_00EEF8: LDA.w #$000F
#_00EEFB: STA.w $0CFD
#_00EEFE: LDY.w #$0010

.branch00EF01
#_00EF01: PHX
#_00EF02: PHY
#_00EF03: LDY.w #$0020

.branch00EF06
#_00EF06: LDA.l DungeonIDByBlock,X
#_00EF0A: AND.w #$FF3F
#_00EF0D: CMP.w $0CF3
#_00EF10: BEQ .branch00EF27

#_00EF12: INX
#_00EF13: INX
#_00EF14: DEY
#_00EF15: BNE .branch00EF06

#_00EF17: PLY
#_00EF18: PLA
#_00EF19: SEC
#_00EF1A: SBC.w #$0040
#_00EF1D: TAX
#_00EF1E: DEC.w $0CFD
#_00EF21: DEY
#_00EF22: BNE .branch00EF01

#_00EF24: JMP routine00ED94_fail

.branch00EF27
#_00EF27: PLX
#_00EF28: PLY
#_00EF29: LDX.w #$03C0
#_00EF2C: LDY.w #$0020

.branch00EF2F
#_00EF2F: PHX
#_00EF30: PHY
#_00EF31: LDY.w #$0010

.branch00EF34
#_00EF34: LDA.l DungeonIDByBlock,X
#_00EF38: AND.w #$FF3F
#_00EF3B: CMP.w $0CF3
#_00EF3E: BEQ routine00ED94_finished

#_00EF40: TXA
#_00EF41: SEC
#_00EF42: SBC.w #$0040
#_00EF45: TAX
#_00EF46: DEY
#_00EF47: BNE .branch00EF34

#_00EF49: CLC
#_00EF4A: PLY
#_00EF4B: PLX
#_00EF4C: INX
#_00EF4D: INX
#_00EF4E: INC.w $0CFB
#_00EF51: DEY
#_00EF52: BNE .branch00EF2F

#_00EF54: BRA routine00ED94_fail

;---------------------------------------------------------------------------------------------------

routine00ED94_finished:
#_00EF56: PLX
#_00EF57: PLY

#_00EF58: RTS

;---------------------------------------------------------------------------------------------------

routine00ED94_fail:
#_00EF59: LDA.w #$FFFF
#_00EF5C: STA.w $0CFB
#_00EF5F: STA.w $0CFD

#_00EF62: RTS

;===================================================================================================

routine00EF63:
#_00EF63: SEP #$30

#_00EF65: LDA.w $040D
#_00EF68: ASL A
#_00EF69: TAX

#_00EF6A: REP #$30

#_00EF6C: CLC
#_00EF6D: LDA.l .tile_offset_x,X
#_00EF71: ADC.w $0CF5
#_00EF74: STA.w $0CF5

#_00EF77: CLC
#_00EF78: LDA.l .tile_offset_y,X
#_00EF7C: ADC.w $0CF7
#_00EF7F: STA.w $0CF7

#_00EF82: RTS

.tile_offset_x
#_00EF83: dw $00, $03, $03, $00

.tile_offset_y
#_00EF8B: dw $00, $00, $03, $03

;===================================================================================================

routine00EF93:
#_00EF93: REP #$30

#_00EF95: JSR routine00ED1D
#_00EF98: JSR routine00EF63

#_00EF9B: LDA.w #$0000
#_00EF9E: STA.w $0D09
#_00EFA1: STA.w $0D0B

#_00EFA4: LDA.w #$0018
#_00EFA7: STA.w $0D13

#_00EFAA: SEP #$20

#_00EFAC: LDA.b #$01
#_00EFAE: STA.w $0D15

#_00EFB1: SEP #$30

#_00EFB3: LDA.w $040D
#_00EFB6: BEQ DrawAutoMapFacingNorth

#_00EFB8: CMP.b #$01
#_00EFBA: BNE .not_facing_east

#_00EFBC: JMP DrawAutoMapFacingEast

.not_facing_east
#_00EFBF: CMP.b #$02
#_00EFC1: BNE .not_facing_south

#_00EFC3: JMP DrawAutoMapFacingSouth

.not_facing_south
#_00EFC6: JMP DrawAutoMapFacingWest

;===================================================================================================

DrawAutoMapFacingNorth:
#_00EFC9: REP #$30

#_00EFCB: JSR routine00F199

#_00EFCE: LDY.w #$0018

.next_row
#_00EFD1: PHY

#_00EFD2: LDA.w $0D03
#_00EFD5: STA.w $0D01

#_00EFD8: LDA.w $0CFF
#_00EFDB: STA.w $0CF5

#_00EFDE: LDA.w #$0000
#_00EFE1: STA.w $0D07

#_00EFE4: LDY.w #$0018

.next_room
#_00EFE7: JSR DrawSingleAutoMapRoom

#_00EFEA: INC.w $0CF5

#_00EFED: LDA.w $0CF5
#_00EFF0: AND.w #$007F
#_00EFF3: STA.w $0CF5

#_00EFF6: INC.w $0D01
#_00EFF9: INC.w $0D01
#_00EFFC: INC.w $0D07

#_00EFFF: DEY
#_00F000: BNE .next_room

#_00F002: INC.w $0CF7

#_00F005: LDA.w $0CF7
#_00F008: AND.w #$003F
#_00F00B: STA.w $0CF7

#_00F00E: SEP #$20

#_00F010: LDA.w $0D15
#_00F013: BNE .branch00F024

#_00F015: REP #$20

#_00F017: CLC
#_00F018: LDA.w $0D03
#_00F01B: ADC.w #$0040
#_00F01E: STA.w $0D03

#_00F021: INC.w $0D0B

.branch00F024
#_00F024: SEP #$20

#_00F026: LDA.w $070D
#_00F029: CMP.w $0CF7
#_00F02C: BNE .branch00F036

#_00F02E: REP #$20
#_00F030: LDA.w $0D0B
#_00F033: STA.w $0D0F

.branch00F036
#_00F036: REP #$20

#_00F038: PLY
#_00F039: DEY
#_00F03A: BNE .next_row

#_00F03C: RTS

;===================================================================================================

DrawAutoMapFacingEast:
#_00F03D: REP #$30

#_00F03F: JSR routine00F1A8

#_00F042: LDY.w #$0018

.next_row
#_00F045: PHY

#_00F046: LDA.w $0D03
#_00F049: STA.w $0D01

#_00F04C: LDA.w $0CFF
#_00F04F: STA.w $0CF7

#_00F052: LDA.w #$0000
#_00F055: STA.w $0D07

#_00F058: LDY.w #$0018

.next_room
#_00F05B: JSR DrawSingleAutoMapRoom

#_00F05E: INC.w $0CF7

#_00F061: LDA.w $0CF7
#_00F064: AND.w #$003F
#_00F067: STA.w $0CF7

#_00F06A: INC.w $0D01
#_00F06D: INC.w $0D01

#_00F070: INC.w $0D07

#_00F073: DEY
#_00F074: BNE .next_room

#_00F076: DEC.w $0CF5

#_00F079: LDA.w $0CF5
#_00F07C: AND.w #$007F
#_00F07F: STA.w $0CF5

#_00F082: SEP #$20

#_00F084: LDA.w $0D15
#_00F087: BNE .branch00F098

#_00F089: REP #$20

#_00F08B: CLC

#_00F08C: LDA.w $0D03
#_00F08F: ADC.w #$0040
#_00F092: STA.w $0D03

#_00F095: INC.w $0D0B

.branch00F098
#_00F098: SEP #$20

#_00F09A: LDA.w $070C
#_00F09D: CMP.w $0CF5
#_00F0A0: BNE .branch00F0AA

#_00F0A2: REP #$20

#_00F0A4: LDA.w $0D0B
#_00F0A7: STA.w $0D0F

.branch00F0AA
#_00F0AA: REP #$20

#_00F0AC: PLY
#_00F0AD: DEY
#_00F0AE: BNE .next_row

#_00F0B0: RTS

;===================================================================================================

DrawAutoMapFacingSouth:
#_00F0B1: REP #$30

#_00F0B3: JSR routine00F199

#_00F0B6: LDY.w #$0018

.next_row
#_00F0B9: PHY

#_00F0BA: LDA.w $0D03
#_00F0BD: STA.w $0D01

#_00F0C0: LDA.w $0CFF
#_00F0C3: STA.w $0CF5

#_00F0C6: LDA.w #$0000
#_00F0C9: STA.w $0D07

#_00F0CC: LDY.w #$0018

.next_room
#_00F0CF: JSR DrawSingleAutoMapRoom

#_00F0D2: DEC.w $0CF5

#_00F0D5: LDA.w $0CF5
#_00F0D8: AND.w #$007F
#_00F0DB: STA.w $0CF5

#_00F0DE: INC.w $0D01
#_00F0E1: INC.w $0D01

#_00F0E4: INC.w $0D07

#_00F0E7: DEY
#_00F0E8: BNE .next_room

#_00F0EA: DEC.w $0CF7

#_00F0ED: LDA.w $0CF7
#_00F0F0: AND.w #$003F
#_00F0F3: STA.w $0CF7

#_00F0F6: SEP #$20

#_00F0F8: LDA.w $0D15
#_00F0FB: BNE .branch00F10C

#_00F0FD: REP #$20

#_00F0FF: CLC

#_00F100: LDA.w $0D03
#_00F103: ADC.w #$0040
#_00F106: STA.w $0D03

#_00F109: INC.w $0D0B

.branch00F10C
#_00F10C: SEP #$20

#_00F10E: LDA.w $070D
#_00F111: CMP.w $0CF7
#_00F114: BNE .branch00F11E

#_00F116: REP #$20

#_00F118: LDA.w $0D0B
#_00F11B: STA.w $0D0F

.branch00F11E
#_00F11E: REP #$20

#_00F120: PLY
#_00F121: DEY
#_00F122: BNE .next_row

#_00F124: RTS

;===================================================================================================

DrawAutoMapFacingWest:
#_00F125: REP #$30

#_00F127: JSR routine00F1A8

#_00F12A: LDY.w #$0018

.next_row
#_00F12D: PHY

#_00F12E: LDA.w $0D03
#_00F131: STA.w $0D01

#_00F134: LDA.w $0CFF
#_00F137: STA.w $0CF7

#_00F13A: LDA.w #$0000
#_00F13D: STA.w $0D07

#_00F140: LDY.w #$0018

.next_room
#_00F143: JSR DrawSingleAutoMapRoom

#_00F146: DEC.w $0CF7

#_00F149: LDA.w $0CF7
#_00F14C: AND.w #$003F
#_00F14F: STA.w $0CF7

#_00F152: INC.w $0D01
#_00F155: INC.w $0D01

#_00F158: INC.w $0D07

#_00F15B: DEY
#_00F15C: BNE .next_room

#_00F15E: INC.w $0CF5

#_00F161: LDA.w $0CF5
#_00F164: AND.w #$007F
#_00F167: STA.w $0CF5

#_00F16A: SEP #$20

#_00F16C: LDA.w $0D15
#_00F16F: BNE .branch00F180

#_00F171: REP #$20

#_00F173: CLC

#_00F174: LDA.w $0D03
#_00F177: ADC.w #$0040
#_00F17A: STA.w $0D03

#_00F17D: INC.w $0D0B

.branch00F180
#_00F180: SEP #$20

#_00F182: LDA.w $070C
#_00F185: CMP.w $0CF5
#_00F188: BNE .branch00F192

#_00F18A: REP #$20

#_00F18C: LDA.w $0D0B
#_00F18F: STA.w $0D0F

.branch00F192
#_00F192: REP #$20

#_00F194: PLY
#_00F195: DEY
#_00F196: BNE .next_row

#_00F198: RTS

;===================================================================================================

routine00F199:
#_00F199: REP #$30

#_00F19B: LDA.w #$0000
#_00F19E: STA.w $0D03

#_00F1A1: LDA.w $0CF5
#_00F1A4: STA.w $0CFF

#_00F1A7: RTS

;===================================================================================================

routine00F1A8:
#_00F1A8: REP #$30

#_00F1AA: LDA.w #$0000
#_00F1AD: STA.w $0D03

#_00F1B0: LDA.w $0CF7
#_00F1B3: STA.w $0CFF

#_00F1B6: RTS

;===================================================================================================

DrawSingleAutoMapRoom:
#_00F1B7: PHY

#_00F1B8: JSR CheckIfRoomInHiddenArea

#_00F1BB: LDA.w $0CF9
#_00F1BE: BNE .exit

#_00F1C0: JSR CheckIfRoomHasBeenVisited

#_00F1C3: LDA.w $0CF9
#_00F1C6: BEQ .exit

#_00F1C8: JSR routine00F234

#_00F1CB: SEP #$20

#_00F1CD: LDA.b #$00
#_00F1CF: STA.w $0D15

#_00F1D2: REP #$30

#_00F1D4: LDA.w $0D0B
#_00F1D7: STA.w $0D0D

#_00F1DA: SEC

#_00F1DB: LDA.w $0D07
#_00F1DE: SBC.w $0D09
#_00F1E1: BCC .no_overflow

#_00F1E3: LDA.w $0D07
#_00F1E6: STA.w $0D09

.no_overflow
#_00F1E9: SEC
#_00F1EA: LDA.w $0D13
#_00F1ED: SBC.w $0D07
#_00F1F0: BCC .exit

#_00F1F2: LDA.w $0D07
#_00F1F5: STA.w $0D13

.exit
#_00F1F8: PLY

#_00F1F9: RTS

;===================================================================================================

CheckIfRoomHasBeenVisited:
#_00F1FA: REP #$30

#_00F1FC: JSR routine00ECC3

#_00F1FF: LDX.w $0CF9

#_00F202: SEP #$20

#_00F204: AND.l $7E3000,X

#_00F208: REP #$20

#_00F20A: PHA

#_00F20B: LDA.w $0D11
#_00F20E: BEQ .test_bit

#_00F210: PLA

#_00F211: LDA.w #$00FF
#_00F214: STA.w $0CF9

#_00F217: RTS

.test_bit
#_00F218: PLA

#_00F219: AND.w #$00FF
#_00F21C: STA.w $0CF9

#_00F21F: RTS

;===================================================================================================

CheckIfRoomInHiddenArea:
#_00F220: REP #$30

#_00F222: JSR GetBlockOffsetIntoData
#_00F225: TAX

#_00F226: LDA.l DungeonIDByBlock,X
#_00F22A: AND.w #$FF3F
#_00F22D: EOR.w $0CF3
#_00F230: STA.w $0CF9

#_00F233: RTS

;===================================================================================================

routine00F234:
#_00F234: REP #$30

#_00F236: JSR GetRoomsOffsetIntoData
#_00F239: TAX

#_00F23A: LDA.l UnderworldRoomData,X
#_00F23E: STA.w $0CF9
#_00F241: STA.w $0D05

#_00F244: REP #$30
#_00F246: JSR MaskOutRoomTileHighByte

#_00F249: SEP #$20
#_00F24B: LDA.w $040D
#_00F24E: REP #$30

#_00F250: AND.w #$0003
#_00F253: BEQ AddAutoMapRoomToTilemapBuffer

#_00F255: CMP.w #$0001
#_00F258: BEQ .facing_east

#_00F25A: CMP.w #$0002
#_00F25D: BEQ .facing_south

;---------------------------------------------------------------------------------------------------

.facing_west
#_00F25F: LDA.w $0CF9
#_00F262: PHA

#_00F263: AND.w #$0003
#_00F266: LDY.w #$0006
#_00F269: JSR Shift16bitAleft_Ytimes
#_00F26C: STA.w $0CF9

#_00F26F: PLA
#_00F270: AND.w #$00FC
#_00F273: LDY.w #$0002
#_00F276: JSR Shift16bitAright_Ytimes
#_00F279: ORA.w $0CF9
#_00F27C: STA.w $0CF9

#_00F27F: BRA AddAutoMapRoomToTilemapBuffer

;---------------------------------------------------------------------------------------------------

.facing_east
#_00F281: LDA.w $0CF9
#_00F284: PHA

#_00F285: AND.w #$00C0
#_00F288: LDY.w #$0006
#_00F28B: JSR Shift16bitAright_Ytimes
#_00F28E: STA.w $0CF9

#_00F291: PLA
#_00F292: AND.w #$003F
#_00F295: LDY.w #$0002

#_00F298: JSR Shift16bitAleft_Ytimes
#_00F29B: ORA.w $0CF9
#_00F29E: STA.w $0CF9

#_00F2A1: BRA AddAutoMapRoomToTilemapBuffer

;---------------------------------------------------------------------------------------------------

.facing_south
#_00F2A3: LDA.w $0CF9
#_00F2A6: PHA

#_00F2A7: AND.w #$00F0
#_00F2AA: LDY.w #$0004
#_00F2AD: JSR Shift16bitAright_Ytimes
#_00F2B0: STA.w $0CF9

#_00F2B3: PLA
#_00F2B4: AND.w #$000F
#_00F2B7: LDY.w #$0004
#_00F2BA: JSR Shift16bitAleft_Ytimes
#_00F2BD: ORA.w $0CF9
#_00F2C0: STA.w $0CF9

#_00F2C3: BRA AddAutoMapRoomToTilemapBuffer

;===================================================================================================

MaskOutRoomTileHighByte:
#_00F2C5: LDA.w $0CF9
#_00F2C8: AND.w #$00FF
#_00F2CB: STA.w $0CF9

#_00F2CE: RTS

;===================================================================================================

AddAutoMapRoomToTilemapBuffer:
#_00F2CF: SEP #$20

#_00F2D1: LDX.w $0CF9

#_00F2D4: LDA.l .room_tiles,X
#_00F2D8: STA.w $0CF9

#_00F2DB: REP #$30

#_00F2DD: JSR routine00F419

#_00F2E0: LDA.w $0CF9
#_00F2E3: AND.w #$00FF
#_00F2E6: STA.w $0CF9

#_00F2E9: AND.w #$00C0
#_00F2EC: LDY.w #$0008
#_00F2EF: JSR Shift16bitAleft_Ytimes
#_00F2F2: ORA.w $0CF9
#_00F2F5: ORA.w #$1400
#_00F2F8: AND.w #$D43F
#_00F2FB: STA.w $0CF9

#_00F2FE: JSR routine00F4C0

#_00F301: SEP #$20

#_00F303: PHX

#_00F304: LDX.w $0D01

#_00F307: LDA.w $0CF9
#_00F30A: STA.l $7F7000,X

#_00F30E: LDA.w $0CFA
#_00F311: STA.l $7F7001,X

#_00F315: PLX

#_00F316: REP #$20

#_00F318: RTS

.room_tiles
#_00F319: db $01, $1F, $01, $20, $9D, $96, $9D, $97
#_00F321: db $01, $1F, $01, $20, $9E, $99, $9E, $98
#_00F329: db $5F, $1A, $5F, $1B, $D6, $8A, $D6, $8B
#_00F331: db $5F, $1A, $5F, $1B, $D9, $8C, $D9, $8D
#_00F339: db $01, $1F, $01, $20, $9D, $96, $9D, $97
#_00F341: db $01, $1F, $01, $20, $9E, $99, $9E, $98
#_00F349: db $60, $5B, $60, $5C, $D7, $CB, $D7, $8E
#_00F351: db $60, $5B, $60, $5C, $D8, $CD, $D8, $8F
#_00F359: db $1D, $16, $1D, $17, $21, $10, $21, $12
#_00F361: db $1D, $16, $1D, $17, $A2, $91, $A2, $93
#_00F369: db $56, $0A, $56, $0B, $50, $02, $50, $44
#_00F371: db $56, $0A, $56, $0B, $D1, $05, $D1, $46
#_00F379: db $1D, $16, $1D, $17, $21, $10, $21, $12
#_00F381: db $1D, $16, $1D, $17, $A2, $91, $A2, $93
#_00F389: db $57, $4B, $57, $0E, $52, $04, $52, $08
#_00F391: db $57, $4B, $57, $0E, $D3, $06, $D3, $07
#_00F399: db $01, $1F, $01, $20, $9D, $96, $9D, $97
#_00F3A1: db $01, $1F, $01, $20, $9E, $99, $9E, $98
#_00F3A9: db $5F, $1A, $5F, $1B, $D6, $8A, $D6, $8B
#_00F3B1: db $5F, $1A, $5F, $1B, $D9, $8C, $D9, $8D
#_00F3B9: db $01, $1F, $01, $20, $9D, $96, $9D, $97
#_00F3C1: db $01, $1F, $01, $20, $9E, $99, $9E, $98
#_00F3C9: db $60, $5B, $60, $5C, $D7, $CB, $D7, $8E
#_00F3D1: db $60, $5B, $60, $5C, $D8, $CD, $D8, $8F
#_00F3D9: db $1E, $19, $1E, $18, $22, $11, $22, $13
#_00F3E1: db $1E, $19, $1E, $18, $23, $14, $23, $15
#_00F3E9: db $59, $0C, $59, $0D, $51, $85, $51, $C6
#_00F3F1: db $59, $0C, $59, $0D, $54, $09, $54, $64
#_00F3F9: db $1E, $19, $1E, $18, $22, $11, $22, $13
#_00F401: db $1E, $19, $1E, $18, $23, $14, $23, $15
#_00F409: db $58, $4D, $58, $0F, $53, $86, $53, $87
#_00F411: db $58, $4D, $58, $0F, $55, $24, $55, $03

;===================================================================================================

routine00F419:
#_00F419: REP #$30

#_00F41B: LDA.w $0D05
#_00F41E: AND.w #$8000
#_00F421: BNE .branch00F44F

#_00F423: LDA.w $0CF9
#_00F426: AND.w #$003F
#_00F429: CMP.w #$0005
#_00F42C: BEQ .branch00F434

#_00F42E: CMP.w #$0004
#_00F431: BEQ .branch00F434

#_00F433: RTS

.branch00F434
#_00F434: LDA.w $0D05
#_00F437: AND.w #$0F00
#_00F43A: CMP.w #$0700
#_00F43D: BEQ .branch00F45C

#_00F43F: CMP.w #$0800
#_00F442: BEQ .branch00F467

#_00F444: CMP.w #$0900
#_00F447: BEQ .branch00F475

#_00F449: CMP.w #$0C00
#_00F44C: BEQ .branch00F483

#_00F44E: RTS

;---------------------------------------------------------------------------------------------------

.branch00F44F
#_00F44F: LDA.w $0D11
#_00F452: BEQ .branch00F455

#_00F454: RTS

;---------------------------------------------------------------------------------------------------

.branch00F455
#_00F455: LDA.w #$002F
#_00F458: STA.w $0CF9

#_00F45B: RTS

;---------------------------------------------------------------------------------------------------

.branch00F45C
#_00F45C: CLC

#_00F45D: LDA.w $0CF9
#_00F460: ADC.w #$0021
#_00F463: STA.w $0CF9

#_00F466: RTS

;---------------------------------------------------------------------------------------------------

.branch00F467
#_00F467: JSR routine00F491

#_00F46A: CLC

#_00F46B: LDA.w $0CF9
#_00F46E: ADC.w #$0027
#_00F471: STA.w $0CF9

#_00F474: RTS

;---------------------------------------------------------------------------------------------------

.branch00F475
#_00F475: JSR routine00F491

#_00F478: CLC

#_00F479: LDA.w $0CF9
#_00F47C: ADC.w #$002B
#_00F47F: STA.w $0CF9

#_00F482: RTS

;---------------------------------------------------------------------------------------------------

.branch00F483
#_00F483: JSR routine00F491

#_00F486: CLC

#_00F487: LDA.w $0CF9
#_00F48A: ADC.w #$0030
#_00F48D: STA.w $0CF9

#_00F490: RTS

;===================================================================================================

routine00F491:
#_00F491: PHP

#_00F492: REP #$10
#_00F494: SEP #$20

#_00F496: LDA.w $0CF9
#_00F499: AND.b #$3F
#_00F49B: CMP.b #$05
#_00F49D: BEQ .branch00F4AE

#_00F49F: LDA.w $0CF9
#_00F4A2: AND.b #$40
#_00F4A4: BEQ .branch00F4AA

#_00F4A6: LDA.b #$00
#_00F4A8: BRA .branch00F4BB

.branch00F4AA
#_00F4AA: LDA.b #$01
#_00F4AC: BRA .branch00F4BB

.branch00F4AE
#_00F4AE: LDA.w $0CF9
#_00F4B1: AND.b #$80
#_00F4B3: BNE .branch00F4B9

#_00F4B5: LDA.b #$02

#_00F4B7: BRA .branch00F4BB

.branch00F4B9
#_00F4B9: LDA.b #$03

.branch00F4BB
#_00F4BB: STA.w $0CF9

#_00F4BE: PLP
#_00F4BF: RTS

;===================================================================================================

routine00F4C0:
#_00F4C0: REP #$10
#_00F4C2: SEP #$20

#_00F4C4: LDA.w $070C
#_00F4C7: CMP.w $0CF5
#_00F4CA: BNE .exit

#_00F4CC: LDA.w $070D
#_00F4CF: CMP.w $0CF7
#_00F4D2: BNE .exit

#_00F4D4: BRA .continue

.exit
#_00F4D6: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_00F4D7: REP #$20

#_00F4D9: LDA.w $0CF9
#_00F4DC: AND.w #$003F
#_00F4DF: LDY.w #$0005
#_00F4E2: JSR Shift16bitAleft_Ytimes
#_00F4E5: TAX

#_00F4E6: LDY.w #$0020

#_00F4E9: LDA.w #$0000
#_00F4EC: STA.w $0CFB

#_00F4EF: SEP #$20

.next
#_00F4F1: LDA.l GFX_23F900,X

#_00F4F5: PHX

#_00F4F6: LDX.w $0CFB
#_00F4F9: ORA.l data00F527,X
#_00F4FD: STA.l $7F66C0,X

#_00F501: PLX
#_00F502: INX

#_00F503: INC.w $0CFB

#_00F506: DEY
#_00F507: BNE .next

;---------------------------------------------------------------------------------------------------

#_00F509: REP #$20

#_00F50B: LDA.w $0CF9
#_00F50E: AND.w #$D400
#_00F511: ORA.w #$0036
#_00F514: STA.w $0CF9

#_00F517: REP #$20

#_00F519: LDA.w #$0004
#_00F51C: JSL VRAM_From_7FXXXX
#_00F520: JSL AddSelfAsVector

#_00F524: REP #$30

#_00F526: RTS

;---------------------------------------------------------------------------------------------------

data00F527:
#_00F527: db $00,$00,$00,$00,$00,$3C,$00,$3C
#_00F52F: db $00,$3C,$00,$3C,$00,$00,$00,$00
#_00F537: db $00,$00,$00,$00,$3C,$00,$3C,$00
#_00F53F: db $3C,$00,$3C,$00,$00,$00,$00,$00

;===================================================================================================

; TODO this looks like stupid math
routine00F547:
#_00F547: REP #$30

#_00F549: LDA.w $0D13
#_00F54C: AND.w #$00FE
#_00F54F: ASL A
#_00F550: ASL A
#_00F551: STA.w $0D13

#_00F554: SEC
#_00F555: LDA.w #$0020
#_00F558: SBC.w $0D09
#_00F55B: AND.w #$00FE
#_00F55E: ASL A
#_00F55F: ASL A
#_00F560: STA.w $0D09

#_00F563: SEC
#_00F564: LDA.w #$0000
#_00F567: SBC.w $0D09
#_00F56A: CLC
#_00F56B: ADC.w $0D13
#_00F56E: STA.w $0D09
#_00F571: STA.w $0F4D

#_00F574: LDA.w #$0000
#_00F577: STA.w $0D07

#_00F57A: SEC
#_00F57B: LDA.w $0D0D
#_00F57E: SBC.w #$0008
#_00F581: BCC .branch00F5B2

#_00F583: STA.w $0D0D

#_00F586: SEC
#_00F587: LDA.w $0D0F
#_00F58A: SBC.w #$0008
#_00F58D: BCC .finished

#_00F58F: SEC
#_00F590: LDA.w $0D0F
#_00F593: SBC.w #$0004
#_00F596: STA.w $0D0F

#_00F599: SEC
#_00F59A: LDA.w $0D0D
#_00F59D: SBC.w $0D0F
#_00F5A0: BCC .branch00F5AA

#_00F5A2: LDA.w $0D0F
#_00F5A5: STA.w $0D07

#_00F5A8: BRA .finished

.branch00F5AA
#_00F5AA: LDA.w $0D0D
#_00F5AD: STA.w $0D07

#_00F5B0: BRA .finished

.branch00F5B2
#_00F5B2: LDA.w #$0000
#_00F5B5: STA.w $0D0D

;---------------------------------------------------------------------------------------------------

.finished
#_00F5B8: REP #$20

#_00F5BA: JSR routine00F5C1
#_00F5BD: STA.w $0F4F

#_00F5C0: RTS

;===================================================================================================

routine00F5C1:
#_00F5C1: REP #$20

#_00F5C3: LDA.w $0D07
#_00F5C6: ASL A
#_00F5C7: ASL A
#_00F5C8: ASL A
#_00F5C9: STA.w $0D09

#_00F5CC: CLC

#_00F5CD: LDA.w #$FFE4
#_00F5D0: ADC.w $0D09
#_00F5D3: STA.w $0D09

#_00F5D6: RTS

;===================================================================================================

routine00F5D7:
#_00F5D7: REP #$30

#_00F5D9: JSL AddSelfAsVector
#_00F5DD: JSR routine00F683

#_00F5E0: REP #$30

#_00F5E2: LDA.w $0F2B
#_00F5E5: AND.w #$F0F0
#_00F5E8: BNE .pressed_not_the_dpad

#_00F5EA: LDA.w $0D0D
#_00F5ED: BEQ routine00F5D7

#_00F5EF: LDA.w $0F2D
#_00F5F2: AND.w #$0800
#_00F5F5: BNE routine00F5D7_up

#_00F5F7: LDA.w $0F2D
#_00F5FA: AND.w #$0400
#_00F5FD: BNE routine00F5D7_down

#_00F5FF: BRA routine00F5D7

.pressed_not_the_dpad
#_00F601: LDA.w #$0000
#_00F604: STA.w $0D11

#_00F607: RTS

;---------------------------------------------------------------------------------------------------

routine00F5D7_up:
#_00F608: REP #$30

#_00F60A: LDA.w $0D07
#_00F60D: BEQ .skip

#_00F60F: JSR routine00F70E
#_00F612: JSR routine00F5C1

#_00F615: LDY.w #$0008

.next
#_00F618: DEC.w $0D09

#_00F61B: LDA.w $0D09
#_00F61E: STA.w $0F4F

#_00F621: PHY

#_00F622: JSL AddSelfAsVector

#_00F626: REP #$30

#_00F628: PLY
#_00F629: DEY
#_00F62A: BNE .next

#_00F62C: DEC.w $0D07

.skip
#_00F62F: JMP routine00F5D7

;---------------------------------------------------------------------------------------------------

routine00F5D7_down:
#_00F632: REP #$30

#_00F634: LDA.w $0D07
#_00F637: CMP.w $0D0D
#_00F63A: BEQ .skip

#_00F63C: JSR routine00F70E
#_00F63F: JSR routine00F5C1

#_00F642: LDY.w #$0008

.next
#_00F645: INC.w $0D09

#_00F648: LDA.w $0D09

#_00F64B: STA.w $0F4F

#_00F64E: PHY
#_00F64F: JSL AddSelfAsVector

#_00F653: REP #$30

#_00F655: PLY
#_00F656: DEY
#_00F657: BNE .next

#_00F659: INC.w $0D07

.skip
#_00F65C: JMP routine00F5D7

;---------------------------------------------------------------------------------------------------

; TODO did I miss some vectors/labels here?
#_00F65F: LDA.w #$0001
#_00F662: STA.w $0D11

#_00F665: RTS

#_00F666: LDA.w #$0000
#_00F669: STA.w $0D11

#_00F66C: JMP routine00F5D7

;===================================================================================================

; TODO unused?
data00F6FF:
#_00F66F: dw $0800,$0400,$0400,$0200
#_00F677: dw $0100,$0200,$0100,$8000
#_00F67F: dw $0080,$FFFF

;===================================================================================================

routine00F683:
#_00F683: PHP

#_00F684: JSR routine00F6EE

#_00F687: REP #$30

#_00F689: LDA.w $0D07
#_00F68C: BEQ .branch00F6A4

#_00F68E: DEC A

#_00F68F: ASL A ; x64
#_00F690: ASL A
#_00F691: ASL A
#_00F692: ASL A
#_00F693: ASL A
#_00F694: ASL A

#_00F695: CLC
#_00F696: ADC.w #$003C
#_00F699: TAX

#_00F69A: SEP #$20

#_00F69C: LDA.b #$34
#_00F69E: STA.l $7F7000,X

#_00F6A2: BRA .branch00F6AF

.branch00F6A4
#_00F6A4: LDX.w #$003C

#_00F6A7: SEP #$20
#_00F6A9: LDA.b #$00
#_00F6AB: STA.l $7F7000,X

.branch00F6AF
#_00F6AF: REP #$20

#_00F6B1: LDA.w $0D07
#_00F6B4: CMP.w $0D0D
#_00F6B7: BEQ .branch00F6CF

#_00F6B9: DEC A

#_00F6BA: ASL A ; x64
#_00F6BB: ASL A
#_00F6BC: ASL A
#_00F6BD: ASL A
#_00F6BE: ASL A
#_00F6BF: ASL A

#_00F6C0: CLC
#_00F6C1: ADC.w #$02BC
#_00F6C4: TAX

#_00F6C5: SEP #$20

#_00F6C7: LDA.b #$35
#_00F6C9: STA.l $7F7000,X

#_00F6CD: BRA .branch00F6E6

;---------------------------------------------------------------------------------------------------

.branch00F6CF
#_00F6CF: REP #$20

#_00F6D1: DEC A
#_00F6D2: DEC A

#_00F6D3: ASL A ; x64
#_00F6D4: ASL A
#_00F6D5: ASL A
#_00F6D6: ASL A
#_00F6D7: ASL A
#_00F6D8: ASL A

#_00F6D9: CLC
#_00F6DA: ADC.w #$02BC
#_00F6DD: TAX

#_00F6DE: SEP #$20

#_00F6E0: LDA.b #$00
#_00F6E2: STA.l $7F7000,X

.branch00F6E6
#_00F6E6: LDA.b #$00
#_00F6E8: JSL VRAM_From_7FXXXX

#_00F6EC: PLP
#_00F6ED: RTS

;===================================================================================================

routine00F6EE:
#_00F6EE: PHP

#_00F6EF: REP #$10
#_00F6F1: SEP #$20

#_00F6F3: LDX.w #$003C
#_00F6F6: LDY.w #$0020

.next
#_00F6F9: LDA.b #$00
#_00F6FB: STA.l $7F7000,X

#_00F6FF: REP #$20

#_00F701: TXA
#_00F702: CLC
#_00F703: ADC.w #$0040
#_00F706: TAX

#_00F707: SEP #$20

#_00F709: DEY
#_00F70A: BNE .next

#_00F70C: PLP
#_00F70D: RTS

;===================================================================================================

routine00F70E:
#_00F70E: PHP
#_00F70F: REP #$30

#_00F711: JSR routine00F6EE

#_00F714: REP #$20

#_00F716: LDA.w #$0000
#_00F719: JSL VRAM_From_7FXXXX

#_00F71D: PLP
#_00F71E: RTS

;===================================================================================================

; TODO unused?
data00F71F:
#_00F71F: db $01,$00,$80,$80,$00,$FF,$FF

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00F726:
#_00F726: PHP

#_00F727: JSR routine00F791

#_00F72A: REP #$30

#_00F72C: LDA.w $0D07
#_00F72F: BEQ .branch00F747

#_00F731: DEC A

#_00F732: ASL A
#_00F733: ASL A
#_00F734: ASL A
#_00F735: ASL A
#_00F736: ASL A
#_00F737: ASL A

#_00F738: CLC
#_00F739: ADC.w #$003C
#_00F73C: TAX

#_00F73D: SEP #$20

#_00F73F: LDA.b #$34
#_00F741: STA.l $7F7000,X

#_00F745: BRA .branch00F752

.branch00F747
#_00F747: LDX.w #$003C

#_00F74A: SEP #$20

#_00F74C: LDA.b #$00
#_00F74E: STA.l $7F7000,X

.branch00F752
#_00F752: REP #$20
#_00F754: LDA.w $0D07
#_00F757: CMP.w $0D0D
#_00F75A: BEQ .branch00F772

#_00F75C: DEC A

#_00F75D: ASL A
#_00F75E: ASL A
#_00F75F: ASL A
#_00F760: ASL A
#_00F761: ASL A
#_00F762: ASL A

#_00F763: CLC
#_00F764: ADC.w #$02BC
#_00F767: TAX

#_00F768: SEP #$20

#_00F76A: LDA.b #$35
#_00F76C: STA.l $7F7000,X

#_00F770: BRA .branch00F789

.branch00F772
#_00F772: REP #$20

#_00F774: DEC A
#_00F775: DEC A

#_00F776: ASL A
#_00F777: ASL A
#_00F778: ASL A
#_00F779: ASL A
#_00F77A: ASL A
#_00F77B: ASL A

#_00F77C: CLC
#_00F77D: ADC.w #$02BC
#_00F780: TAX

#_00F781: SEP #$20

#_00F783: LDA.b #$00
#_00F785: STA.l $7F7000,X

.branch00F789
#_00F789: LDA.b #$00
#_00F78B: JSL VRAM_From_7FXXXX

#_00F78F: PLP
#_00F790: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00F791:
#_00F791: PHP

#_00F792: REP #$10
#_00F794: SEP #$20

#_00F796: LDX.w #$003C
#_00F799: LDY.w #$0020

.next
#_00F79C: LDA.b #$00
#_00F79E: STA.l $7F7000,X

#_00F7A2: REP #$20

#_00F7A4: TXA
#_00F7A5: CLC
#_00F7A6: ADC.w #$0040
#_00F7A9: TAX

#_00F7AA: SEP #$20

#_00F7AC: DEY
#_00F7AD: BNE .next

#_00F7AF: PLP
#_00F7B0: RTS

;===================================================================================================

; TODO POSSIBLY UNUSED ROUTINE
routine00F7B1:
#_00F7B1: PHP
#_00F7B2: REP #$30

#_00F7B4: JSR routine00F791

#_00F7B7: REP #$20

#_00F7B9: LDA.w #$0000
#_00F7BC: JSL VRAM_From_7FXXXX

#_00F7C0: PLP
#_00F7C1: RTS

;===================================================================================================

; I think this is filler
#_00F7C2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7CA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7D2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7DA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7E2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7EA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7F2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F7FA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F802: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F80A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F812: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F81A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F822: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F82A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F832: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F83A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F842: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F84A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F852: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F85A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F862: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F86A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F872: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F87A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F882: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F88A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F892: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F89A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8A2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8AA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8B2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8BA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8C2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8CA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8D2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8DA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8E2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8EA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8F2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F8FA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F902: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F90A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F912: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F91A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F922: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F92A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F932: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F93A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F942: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F94A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F952: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F95A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F962: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F96A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F972: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F97A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F982: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F98A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F992: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F99A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9A2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9AA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9B2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9BA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9C2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9CA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9D2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9DA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9E2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9EA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9F2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00F9FA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FA9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FABA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAC2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FACA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAD2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FADA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAE2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAEA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAF2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FAFA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FB9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBBA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBC2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBCA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBD2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBDA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBE2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBEA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBF2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FBFA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FC9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCBA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCC2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCCA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCD2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCDA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCE2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCEA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCF2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FCFA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FD9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDBA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDC2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDCA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDD2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDDA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDE2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDEA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDF2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FDFA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FE9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEBA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEC2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FECA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FED2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEDA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEE2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEEA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEF2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FEFA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF02: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF0A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF12: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF1A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF22: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF2A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF32: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF3A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF42: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF4A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF52: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF5A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF62: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF6A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF72: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF7A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF82: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF8A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF92: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FF9A: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FFA2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FFAA: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FFB2: db $BB, $B5, $00, $04, $02, $04, $00, $04
#_00FFBA: db $BB, $B5, $00, $04, $02, $04

;===================================================================================================
; ROM header
;===================================================================================================

pushtable
cleartable

org $00FFC0
#_00FFC0: db "DIGITAL DEVIL STORY  "

#_00FFD5: db $20 ; ROM mapping: lorom
#_00FFD6: db $02 ; Cartridge: ROM+RAM+battery
#_00FFD7: db $0B ; ROM size: 2MB
#_00FFD8: db $03 ; RAM size: 8kB

#_00FFD9: db $00 ; Region: Japan (J)
#_00FFDA: db $EB ; Header type: v2
#_00FFDB: db $00 ; Version: 1.0

#_00FFDC: dw $528B ; complement
#_00FFDE: dw $AD74 ; checksum

#_00FFE0: dw $0400
#_00FFE2: dw $B5BB
#_00FFE4: dw $0400
#_00FFE6: dw Native_BRK
#_00FFE8: dw $0400
#_00FFEA: dw Native_NMI
#_00FFEC: dw Vector_Reset
#_00FFEE: dw Native_IRQ

#_00FFF0: dw $0400
#_00FFF2: dw Native_BRK
#_00FFF4: dw $0400
#_00FFF6: dw Native_BRK
#_00FFF8: dw $0400
#_00FFFA: dw Native_NMI
#_00FFFC: dw Vector_Reset
#_00FFFE: dw Native_IRQ

pulltable

;===================================================================================================
