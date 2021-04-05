struct DSP $F0
	.Test: skip 1			; $F0 don't write here
	.Control: skip 1		; $F1
	.WriteAddr: skip 1		; $F2
	.WriteData: skip 1		; $F3
	.Port0: skip 1			; $F4
	.Port1: skip 1			; $F5
	.Port2: skip 1			; $F6
	.Port3: skip 1			; $F7
	.AUXIO4: skip 1			; $F8 not connected to ricoh
	.AUXIO5: skip 1			; $F9 not connected to ricoh
	.Timer0: skip 1			; $FA
	.Timer1: skip 1			; $FB
	.Timer2: skip 1			; $FC
	.Counter0: skip 1		; $FD
	.Counter1: skip 1		; $FE
	.Counter2: skip 1		; $FF
endstruct

macro DSP_channel_defines(name, lowbyte)
	!DSP_CH0_<name> #= $00|(<lowbyte>&$F)
	!DSP_CH1_<name> #= $10|(<lowbyte>&$F)
	!DSP_CH2_<name> #= $20|(<lowbyte>&$F)
	!DSP_CH3_<name> #= $30|(<lowbyte>&$F)
	!DSP_CH4_<name> #= $40|(<lowbyte>&$F)
	!DSP_CH5_<name> #= $50|(<lowbyte>&$F)
	!DSP_CH6_<name> #= $60|(<lowbyte>&$F)
	!DSP_CH7_<name> #= $70|(<lowbyte>&$F)
	!DSP_CHX_<name> #= <lowbyte>&$F
endmacro

%DSP_channel_defines("VOL_L", $00)
%DSP_channel_defines("VOL_R", $01)
%DSP_channel_defines("PITCH_L", $02)
%DSP_channel_defines("PITCH_H", $03)
%DSP_channel_defines("SRCN", $04)
%DSP_channel_defines("ADSR_A", $05)
%DSP_channel_defines("ADSR_B", $06)
%DSP_channel_defines("GAIN", $07)
%DSP_channel_defines("ENVX", $08)
%DSP_channel_defines("OUT_X", $09)

; $80+ are read-only mirrors of below
!DSP_MVOL_L = $0C ; main volume
!DSP_MVOL_R = $1C
!DSP_EVOL_L = $2C ; echo volume
!DSP_EVOL_R = $3C
!DSP_KON = $4C ; key on bitfield - not an anime
!DSP_KOF = $5C ; key off
!DSP_FLG = $6C ; flags for mute, echo, reset, noise
	!DSP_FLG_RESET = $80
	!DSP_FLG_MUTE = $40
	!DSP_FLG_ECEN = $20
!DSP_ENDX = $7C ; bitfield
!DSP_EFB = $0D ; echo feedback
!DSP_PMON = $2D ; pitch modulation
!DSP_NON = $3D ; noise enable
!DSP_EON = $4D ; echo enable
!DSP_DIR = $5D ; $xx00 for SRCN directory
!DSP_ESA = $6D ; $xx00 for echo buffer
!DSP_EDL = $7D ; $0x echo delay
!DSP_FIR = $0F
	!DSP_FIR_0 = $0F
	!DSP_FIR_1 = $1F
	!DSP_FIR_2 = $2F
	!DSP_FIR_3 = $3F
	!DSP_FIR_4 = $4F
	!DSP_FIR_5 = $5F
	!DSP_FIR_6 = $6F
	!DSP_FIR_7 = $7F

!DSP_CTRL_PORT_CLEAR_23    = $20
!DSP_CTRL_PORT_CLEAR_01    = $10
!DSP_CTRL_PORT_CLEAR_0123 #= !DSP_CTRL_PORT_CLEAR_23|!DSP_CTRL_PORT_CLEAR_01
!DSP_CTRL_START_TIMER_2    = $04
!DSP_CTRL_START_TIMER_1    = $02
!DSP_CTRL_START_TIMER_0    = $01

; $FFC0-$FFFF writes are always RAM
!DSP_CTRL_ROM = $80 ; Reading $FFC0-$FFFF is ROM
!DSP_CTRL_RAM = $00 ; Reading $FFC0-$FFFF is RAM

;===================================================================================================
; Song parsing
;===================================================================================================
!HEADERCOMMAND_F0_RESET_DSP = $F0
!HEADERCOMMAND_F1_SET_CONTROL = $F1
!HEADERCOMMAND_F2_SET_B3 = $F2
!HEADERCOMMAND_F3_UNUSED = $F3
!HEADERCOMMAND_F4_UNUSED = $F4
!HEADERCOMMAND_F5_UNUSED = $F5
!HEADERCOMMAND_F6_UNUSED = $F6
!HEADERCOMMAND_F7_UNUSED = $F7
!HEADERCOMMAND_F8_UNUSED = $F8
!HEADERCOMMAND_F9_UNUSED = $F9
!HEADERCOMMAND_FA_UNUSED = $FA
!HEADERCOMMAND_FB_UNUSED = $FB
!HEADERCOMMAND_FC_UNUSED = $FC
!HEADERCOMMAND_FD_UNUSED = $FD
!HEADERCOMMAND_FE_UNUSED = $FE
!HEADERCOMMAND_FF_LAST_CHANNEL = $FF

!MUS_CHANNEL_0 = $00
!MUS_CHANNEL_1 = $01
!MUS_CHANNEL_2 = $02
!MUS_CHANNEL_3 = $03
!MUS_CHANNEL_4 = $04
!MUS_CHANNEL_5 = $05
!MUS_CHANNEL_6 = $06
!MUS_CHANNEL_7 = $07

!SFX_CHANNEL_0 = $08
!SFX_CHANNEL_1 = $09
!SFX_CHANNEL_2 = $0A
!SFX_CHANNEL_3 = $0B
!SFX_CHANNEL_4 = $0C
!SFX_CHANNEL_5 = $0D
!SFX_CHANNEL_6 = $0E
!SFX_CHANNEL_7 = $0F

;===================================================================================================
; 
;===================================================================================================
!TRACKCOMMAND_C0_ChangeTimer0         = $C0
!TRACKCOMMAND_C1_Nothing              = $C1
!TRACKCOMMAND_C2_PitchBend_Off        = $C2
!TRACKCOMMAND_C3_PitchBend            = $C3
!TRACKCOMMAND_C4_SetLoop_A            = $C4
!TRACKCOMMAND_C5_PerformLoop_A        = $C5
!TRACKCOMMAND_C6_CallSub_A            = $C6
!TRACKCOMMAND_C7_Return_A             = $C7
!TRACKCOMMAND_C8_SetVibrato           = $C8
!TRACKCOMMAND_C9_VibratoOff           = $C9
!TRACKCOMMAND_CA_KOFF_Channel         = $CA
!TRACKCOMMAND_CB_SetStaccLevel        = $CB
!TRACKCOMMAND_CC_MVOL_Fade            = $CC
!TRACKCOMMAND_CD_WriteToPort3         = $CD
!TRACKCOMMAND_CE_Set_B0_bit0          = $CE
!TRACKCOMMAND_CF_Clr_B0_bit0          = $CF
!TRACKCOMMAND_D0_SetADSR              = $D0
!TRACKCOMMAND_D1_SetSRCN              = $D1
!TRACKCOMMAND_D2_SetPan               = $D2
!TRACKCOMMAND_D3_Transpose            = $D3
!TRACKCOMMAND_D4_SetLoop_B            = $D4
!TRACKCOMMAND_D5_PerformLoop_B        = $D5
!TRACKCOMMAND_D6_CallSub_B            = $D6
!TRACKCOMMAND_D7_Return_B             = $D7
!TRACKCOMMAND_D8_Goto_X               = $D8
!TRACKCOMMAND_D9_FineTune             = $D9
!TRACKCOMMAND_DA_SetNoteLengthShorten = $DA
!TRACKCOMMAND_DB_SetNoteLengthPage    = $DB
!TRACKCOMMAND_DC_FadeOut              = $DC
!TRACKCOMMAND_DD_FadeOff              = $DD
!TRACKCOMMAND_DE_Set_B8               = $DE
!TRACKCOMMAND_DF_EndTrack             = $DF
!TRACKCOMMAND_E0_ChangeTimer0         = $E0
!TRACKCOMMAND_E1_Nothing              = $E1
!TRACKCOMMAND_E2_PitchBend_Off        = $E2
!TRACKCOMMAND_E3_PitchBend            = $E3
!TRACKCOMMAND_E4_SetLoop_A            = $E4
!TRACKCOMMAND_E5_PerformLoop_A        = $E5
!TRACKCOMMAND_E6_CallSub_A            = $E6
!TRACKCOMMAND_E7_Return_A             = $E7
!TRACKCOMMAND_E8_SetVibrato           = $E8
!TRACKCOMMAND_E9_VibratoOff           = $E9
!TRACKCOMMAND_EA_KOFF_Channel         = $EA
!TRACKCOMMAND_EB_SetStaccLevel        = $EB
!TRACKCOMMAND_EC_MVOL_Fade            = $EC
!TRACKCOMMAND_ED_WriteToPort3         = $ED
!TRACKCOMMAND_EE_Set_B0_bit0          = $EE
!TRACKCOMMAND_EF_Clr_B0_bit0          = $EF
!TRACKCOMMAND_F0_SetADSR              = $F0
!TRACKCOMMAND_F1_SetSRCN              = $F1
!TRACKCOMMAND_F2_SetPan               = $F2
!TRACKCOMMAND_F3_Transpose            = $F3
!TRACKCOMMAND_F4_SetLoop_B            = $F4
!TRACKCOMMAND_F5_PerformLoop_B        = $F5
!TRACKCOMMAND_F6_CallSub_B            = $F6
!TRACKCOMMAND_F7_Return_B             = $F7
!TRACKCOMMAND_F8_Goto_X               = $F8
!TRACKCOMMAND_F9_FineTune             = $F9
!TRACKCOMMAND_FA_SetNoteLengthShorten = $FA
!TRACKCOMMAND_FB_SetNoteLengthPage    = $FB
!TRACKCOMMAND_FC_FadeOut              = $FC
!TRACKCOMMAND_FD_FadeOff              = $FD
!TRACKCOMMAND_FE_Set_B8               = $FE
!TRACKCOMMAND_FF_EndTrack             = $FF

;------------------------------------------------------------------------------
!PITCH_SHIFT_LOOP_POINT = $80
!PITCH_SHIFT_DO_LOOP = $81

;===================================================================================================
; Notes
;===================================================================================================
C2	= $00
Cs2	= $01
Df2	= $01
D2	= $02
Ds2	= $03
Ef2	= $03
E2	= $04
Ff2	= $04
Es2	= $05
F2	= $05
Fs2	= $06
Gf2	= $06
G2	= $07
Gs2	= $08
Af2	= $08
A2	= $09
As2	= $0A
Bf2	= $0A
B2	= $0B
Cf3	= $0B
Bs2	= $0C

C3	= $0C
Cs3	= $0D
Df3	= $0D
D3	= $0E
Ds3	= $0F
Ef3	= $0F
E3	= $10
Ff3	= $10
Es3	= $11
F3	= $11
Fs3	= $12
Gf3	= $12
G3	= $13
Gs3	= $14
Af3	= $14
A3	= $15
As3	= $16
Bf3	= $16
B3	= $17
Cf4	= $17
Bs3	= $18

C4	= $18
Cs4	= $19
Df4	= $19
D4	= $1A
Ds4	= $1B
Ef4	= $1B
E4	= $1C
Ff4	= $1C
Es4	= $1D
F4	= $1D
Fs4	= $1E
Gf4	= $1E
G4	= $1F
Gs4	= $20
Af4	= $20
A4	= $21
As4	= $22
Bf4	= $22
B4	= $23
Cf5	= $23
Bs4	= $24

C5	= $24
Cs5	= $25
Df5	= $25
D5	= $26
Ds5	= $27
Ef5	= $27
E5	= $28
Ff5	= $28
Es5	= $29
F5	= $29
Fs5	= $2A
Gf5	= $2A
G5	= $2B
Gs5	= $2C
Af5	= $2C
A5	= $2D
As5	= $2E
Bf5	= $2E
B5	= $2F
Cf6	= $2F

R	= $30
TIE = $31

;===================================================================================================
ArbSong_7000 = $7000
ArbSong_7800 = $7800

EchoBuffer = $8000

;------------------------------------------------------------------------------
TrackRead = $00

MusicChannelBits = $02
SFXChannelBits = $03

ChannelBit = $06

ChannelOffset = $08
ChannelSomething = $09

Scratch0A = $0A
SampleLoopPoint = $0C

ChannelTimer = $10 ; [16]
Channel_Loops_A = $20 ; [16]
Channel_Loops_B = $30 ; [16]
Channel_StaccTimer = $40 ; [16]

Channel_Vol_L = $50 ; [16]
Channel_Vol_R = $60 ; [16]

Channel_Loop_A_Lo = $70 ; [16]
Channel_Loop_A_Hi = $80 ; [16]
Channel_Loop_B_Lo = $90 ; [16]
Channel_Loop_B_Hi = $A0 ; [16]

; 7... .21.
; 1 - working with SFX atm?
;     echo related too?
; 2 - busy? set when mvol fade
; 7 - idk set when track byte not 30 or 31
;     prevents KON
FLAGS_B0 = $B0

; .... .210
; 0 - for control register?
; 1 - seems to prevent any DSP channel changes
;     prevents pitch writing
;     prevents volume writing
;     prevents KON
;     prevents KOFF
;     prevents noise writes
; 2 - seems to be set when music channel is active
;     prevents KON
DSP_PERMISSION = $B1 ; something to do with which channel types are playing?

; .654 .2.0
; 0 - pitch bend it seems
; 2 - ??? can be set by commands
; 4 - seems cleared but never tested for
; 5 - KOFF channel? idk clear when track byte not 30 flag for koff?
; 6 - set when preset pitch shifting allowed
PerformFlags = $B2

FLAGS_B3 = $B3 ; seems completely unused

PortX_Mirror = $B4
Port0_Mirror = $B4
Port1_Mirror = $B5
Port2_Mirror = $B6
Port3_Mirror = $B7

Unused_B8 = $B8 ; only ever written to with a command? seems useless

SamplePointerWriteAddr = $B9 ; used for writing new samples to arb area
SampleDataWriteAddr = $BB

ExecutionCounter = $BD
MVOL_Timer = $BE
MVOL_TimerLength = $BF
MVOL_Interval = $C0

Channel_NoteLengthShorten = $0100
Channel_Unused_0110 = $0110
Channel_StaccMax = $0120
Channel_StaccLevel = $0130
Channel_ADSR_A = $0140
Channel_ADSR_B = $0148
Channel_SRCN = $0150

Channel_Return_B_lo = $0158
Channel_Return_B_hi = $0168
Channel_Return_A_lo = $0178
Channel_Return_A_hi = $0188

Channel_PerformFlags = $0200 ; seems to cache flags for B2
Channel_Transpose = $0210
Channel_LocationLo = $0220
Channel_LocationHi = $0230
Channel_PitchLow = $0240
Channel_PitchHigh = $0250
Channel_NoteLength = $0260
Channel_Pan = $0270
Channel_NoteLengthPage = $0280
Channel_Pan_Index = $0290
Channel_FineTune = $02A0
Channel_PitchBend = $02B0
Channel_Vibrato_LoopPoint = $02C0
Channel_Vibrato_Counter = $02D0
Channel_Vibrato_Address_Lo = $02E0
Channel_Vibrato_Address_Hi = $02F0
