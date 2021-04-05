arch SPC700
base $0300

EngineStart:
#_0CB50C: #_0300: clrp

#_0CB50D: #_0301: mov X, #$FF
#_0CB50F: #_0303: mov SP, X

#_0CB510: #_0304: mov A, #$00
#_0CB512: #_0306: mov X, A

.clear1
#_0CB513: #_0307: mov (X+), A
#_0CB514: #_0308: cmp X, #$E0
#_0CB516: #_030A: bne .clear1

#_0CB518: #_030C: mov X, #$C0

.clear2
#_0CB51A: #_030E: dec X
#_0CB51B: #_030F: mov.w $0100+X, A
#_0CB51E: #_0312: bne .clear2

#_0CB520: #_0314: mov X, A

.clear3
#_0CB521: #_0315: mov.w $0200+X, A
#_0CB524: #_0318: inc X
#_0CB525: #_0319: bne .clear3

#_0CB527: #_031B: call Reset_DSP
#_0CB52A: #_031E: mov A, #$00 ; write 0 and 1 to ports
#_0CB52C: #_0320: mov.w DSP.Port0, A

#_0CB52F: #_0323: inc A
#_0CB530: #_0324: mov.w DSP.Port1, A

; reset the sample addresses
#_0CB533: #_0327: mov.b SamplePointerWriteAddr+0, #SamplePointersArb>>0
#_0CB536: #_032A: mov.b SamplePointerWriteAddr+1, #SamplePointersArb>>8
#_0CB539: #_032D: mov.b SampleDataWriteAddr+0, #Sample08>>0
#_0CB53C: #_0330: mov.b SampleDataWriteAddr+1, #Sample08>>8

SPCMainLoop:
#_0CB53F: #_0333: mov.w A, DSP.Counter0
#_0CB542: #_0336: beq .counter0wait
#_0CB544: #_0338: call HandleSongTracks

.counter0wait
#_0CB547: #_033B: mov.w A, DSP.Counter1
#_0CB54A: #_033E: beq .counter1wait
#_0CB54C: #_0340: call HandleSFXTracks

.counter1wait
#_0CB54F: #_0343: mov A, #$FF
#_0CB551: #_0345: mov.w DSP.Port1, A
#_0CB554: #_0348: mov Y, #$04

.wait26
#_0CB556: #_034A: dbnz Y, .wait26 ; dbnz is 5 frames, plus 2 cycles for taking

#_0CB558: #_034C: mov.w A, DSP.Port0 ; copy ports over and then reset
#_0CB55B: #_034F: mov.b Port0_Mirror, A

#_0CB55D: #_0351: mov.w A, DSP.Port1
#_0CB560: #_0354: mov.b Port1_Mirror, A

#_0CB562: #_0356: mov.w A, DSP.Port2
#_0CB565: #_0359: mov.b Port2_Mirror, A

#_0CB567: #_035B: mov.w A, DSP.Port3
#_0CB56A: #_035E: mov.b Port3_Mirror, A

#_0CB56C: #_0360: mov.b A, #!DSP_CTRL_PORT_CLEAR_0123|!DSP_CTRL_START_TIMER_1|!DSP_CTRL_START_TIMER_0
#_0CB56E: #_0362: mov.w DSP.Control, A

#_0CB571: #_0365: inc.b ExecutionCounter
#_0CB573: #_0367: mov.b A, ExecutionCounter

#_0CB575: #_0369: mov.w DSP.Port0, A
#_0CB578: #_036C: bbs2 FLAGS_B0, .skip
#_0CB57B: #_036F: mov A, #$00
#_0CB57D: #_0371: mov.w DSP.Port1, A

.skip
#_0CB580: #_0374: mov X, #$FF

.nextport
#_0CB582: #_0376: inc X
#_0CB583: #_0377: cmp Y, #$05
#_0CB585: #_0379: beq SPCMainLoop

; If zero is read, just continue on
#_0CB587: #_037B: mov.b A, PortX_Mirror+X
#_0CB589: #_037D: beq .nextport

; Increment A for checks for some reason
; Checks for port read of $FF, which resets the DSP
#_0CB58B: #_037F: inc A
#_0CB58C: #_0380: bne .notFF

#_0CB58E: #_0382: call Reset_DSP
#_0CB591: #_0385: bra .doneread

; $B0 is some flag for something...
; It might mean the engine is busy and ignores input
.notFF
#_0CB593: #_0387: bbs2 FLAGS_B0, .doneread

; checks for port read of $FD
; which is something
#_0CB596: #_038A: cmp A, #$FE
#_0CB598: #_038C: beq .inputFD_MVOL_FADE

; checks for port read of $FE
; which is something else
#_0CB59A: #_038E: cmp A, #$FF
#_0CB59C: #_0390: bne .normalinput

#_0CB59E: #_0392: call SongCommandFE_PrepareForTransfer
#_0CB5A1: #_0395: bra SPCMainLoop

.normalinput
#_0CB5A3: #_0397: dec A ; Get back original value
#_0CB5A4: #_0398: push X

#_0CB5A5: #_0399: call ReadDataHeader
#_0CB5A8: #_039C: pop X

.doneread
#_0CB5A9: #_039D: mov A, #$00
#_0CB5AB: #_039F: mov.b PortX_Mirror+X, A
#_0CB5AD: #_03A1: bra .nextport

; probably means busy?
.inputFD_MVOL_FADE
#_0CB5AF: #_03A3: set2 FLAGS_B0

#_0CB5B1: #_03A5: mov A, #$01
#_0CB5B3: #_03A7: mov.b MVOL_Timer, A
#_0CB5B5: #_03A9: mov.b MVOL_TimerLength, A

#_0CB5B7: #_03AB: mov A, #$01
#_0CB5B9: #_03AD: mov.b MVOL_Interval, A

#_0CB5BB: #_03AF: mov A, #$FE
#_0CB5BD: #_03B1: mov.w DSP.Port1, A
#_0CB5C0: #_03B4: bra .doneread

; This is called when a port has a nonzero value
ReadDataHeader:
#_0CB5C2: #_03B6: bbc0 FLAGS_B0, .allowed
#_0CB5C5: #_03B9: ret

.allowed
#_0CB5C6: #_03BA: asl A
#_0CB5C7: #_03BB: mov X, A

#_0CB5C8: #_03BC: mov.w A, SongSFXPointers+0+X
#_0CB5CB: #_03BF: mov.b TrackRead+0, A

#_0CB5CD: #_03C1: mov.w A, SongSFXPointers+1+X
#_0CB5D0: #_03C4: mov.b TrackRead+1, A

#_0CB5D2: #_03C6: mov Y, #$FF

; $80+ are commands
.nextbyte
#_0CB5D4: #_03C8: inc Y
#_0CB5D5: #_03C9: mov.b A, (TrackRead)+Y
#_0CB5D7: #_03CB: bmi .command

; Otherwise, give A to X, and get that channel bit
#_0CB5D9: #_03CD: mov X, A
#_0CB5DA: #_03CE: mov.w A, Channel_Bits_Table+X

; Y looks for 8 channels
#_0CB5DD: #_03D1: cmp Y, #$08
#_0CB5DF: #_03D3: bcs .secondarychannel

; are $02 and $03 for channel activeness flags?
.primarychannel
#_0CB5E1: #_03D5: or.b A, MusicChannelBits
#_0CB5E3: #_03D7: mov.b MusicChannelBits, A
#_0CB5E5: #_03D9: bra .readdata

.secondarychannel
#_0CB5E7: #_03DB: or A, SFXChannelBits
#_0CB5E9: #_03DD: mov SFXChannelBits, A

; Sets channel location and clears some properties
.readdata
#_0CB5EB: #_03DF: inc Y
#_0CB5EC: #_03E0: mov.b A, (TrackRead)+Y
#_0CB5EE: #_03E2: mov.w Channel_LocationLo+X, A

#_0CB5F1: #_03E5: inc Y
#_0CB5F2: #_03E6: mov.b A, (TrackRead)+Y
#_0CB5F4: #_03E8: mov.w Channel_LocationHi+X, A

#_0CB5F7: #_03EB: mov A, #$00
#_0CB5F9: #_03ED: mov.w Channel_PerformFlags+X, A
#_0CB5FC: #_03F0: mov.w Channel_Transpose+X, A
#_0CB5FF: #_03F3: mov.w Channel_Pan+X, A
#_0CB602: #_03F6: mov.w Channel_NoteLengthPage+X, A
#_0CB605: #_03F9: mov.w Channel_FineTune+X, A
#_0CB608: #_03FC: mov.w Channel_PitchBend+X, A
#_0CB60B: #_03FF: mov.w Channel_NoteLengthShorten+X, A
#_0CB60E: #_0402: mov.w Channel_Pan_Index+X, A

#_0CB611: #_0405: inc A ; A=1
#_0CB612: #_0406: mov.b ChannelTimer+X, A

#_0CB614: #_0408: bra .nextbyte

; only bottom nibble used for command
.command
#_0CB616: #_040A: and A, #$0F
#_0CB618: #_040C: asl A
#_0CB619: #_040D: mov X, A
#_0CB61A: #_040E: jmp (HeaderCommands+X)

HeaderCommands:
#_0CB61D: #_0411: dw HeaderCommandx0_ResetDSP
#_0CB61F: #_0413: dw HeaderCommandx1
#_0CB621: #_0415: dw HeaderCommandx2_SetB3
#_0CB623: #_0417: dw HeaderCommandx3_Nothing
#_0CB625: #_0419: dw HeaderCommandx4_Nothing
#_0CB627: #_041B: dw HeaderCommandx5_Nothing
#_0CB629: #_041D: dw HeaderCommandx6_Nothing
#_0CB62B: #_041F: dw HeaderCommandx7_Nothing
#_0CB62D: #_0421: dw HeaderCommandx8_Nothing
#_0CB62F: #_0423: dw HeaderCommandx9_Nothing
#_0CB631: #_0425: dw HeaderCommandxA_Nothing
#_0CB633: #_0427: dw HeaderCommandxB_Nothing
#_0CB635: #_0429: dw HeaderCommandxC_Nothing
#_0CB637: #_042B: dw HeaderCommandxD_Nothing
#_0CB639: #_042D: dw HeaderCommandxE_Nothing
#_0CB63B: #_042F: dw HeaderCommandxF_StopReading

HeaderCommandx3_Nothing:
HeaderCommandx4_Nothing:
HeaderCommandx5_Nothing:
HeaderCommandx6_Nothing:
HeaderCommandx7_Nothing:
HeaderCommandx8_Nothing:
HeaderCommandx9_Nothing:
HeaderCommandxA_Nothing:
HeaderCommandxB_Nothing:
HeaderCommandxC_Nothing:
HeaderCommandxD_Nothing:
HeaderCommandxE_Nothing:
#_0CB63D: #_0431: jmp ReadDataHeader_nextbyte

HeaderCommandx1:
#_0CB640: #_0434: mov A, #$02
#_0CB642: #_0436: mov.w DSP.Control, A

#_0CB645: #_0439: inc Y
#_0CB646: #_043A: mov.b A, (TrackRead)+Y
#_0CB648: #_043C: clrc
#_0CB649: #_043D: adc A, #$80
#_0CB64B: #_043F: mov.w DSP.Timer0, A

#_0CB64E: #_0442: mov A, #$03
#_0CB650: #_0444: mov.w DSP.Control, A
#_0CB653: #_0447: jmp ReadDataHeader_nextbyte

HeaderCommandx0_ResetDSP:
#_0CB656: #_044A: push Y
#_0CB657: #_044B: call Reset_DSP
#_0CB65A: #_044E: pop Y

#_0CB65B: #_044F: jmp ReadDataHeader_nextbyte

; this seems useless, since B3 appears to be completely unused
HeaderCommandx2_SetB3:
#_0CB65E: #_0452: inc Y
#_0CB65F: #_0453: mov.b A, (TrackRead)+Y
#_0CB661: #_0455: mov.b FLAGS_B3, A
#_0CB663: #_0457: jmp ReadDataHeader_nextbyte

HeaderCommandxF_StopReading:
#_0CB666: #_045A: ret

Reset_DSP:
#_0CB667: #_045B: mov.b Y, #!DSP_FLG
#_0CB669: #_045D: mov.w DSP.WriteAddr, Y

#_0CB66C: #_0460: mov.b A, #!DSP_FLG_RESET|!DSP_FLG_ECEN
#_0CB66E: #_0462: mov.w DSP.WriteData, A

#_0CB671: #_0465: mov A, #$00
#_0CB673: #_0467: mov.b MusicChannelBits, A
#_0CB675: #_0469: mov.b SFXChannelBits, A
#_0CB677: #_046B: mov.w DSP.Control, A
#_0CB67A: #_046E: mov.w DSP.Port3, A

#_0CB67D: #_0471: mov.b Y, #!DSP_EVOL_L
#_0CB67F: #_0473: mov.w DSP.WriteAddr, Y
#_0CB682: #_0476: mov.w DSP.WriteData, A

#_0CB685: #_0479: mov.b Y, #!DSP_EVOL_R
#_0CB687: #_047B: mov.w DSP.WriteAddr, Y
#_0CB68A: #_047E: mov.w DSP.WriteData, A

#_0CB68D: #_0481: mov.b Y, #!DSP_EFB
#_0CB68F: #_0483: mov.w DSP.WriteAddr, Y
#_0CB692: #_0486: mov.w DSP.WriteData, A

#_0CB695: #_0489: mov.b Y, #!DSP_PMON
#_0CB697: #_048B: mov.w DSP.WriteAddr, Y
#_0CB69A: #_048E: mov.w DSP.WriteData, A

#_0CB69D: #_0491: mov.b Y, #!DSP_NON
#_0CB69F: #_0493: mov.w DSP.WriteAddr, Y
#_0CB6A2: #_0496: mov.w DSP.WriteData, A

#_0CB6A5: #_0499: mov.b Y, #!DSP_EON
#_0CB6A7: #_049B: mov.w DSP.WriteAddr, Y
#_0CB6AA: #_049E: mov.w DSP.WriteData, A

#_0CB6AD: #_04A1: mov.b Y, #!DSP_EDL
#_0CB6AF: #_04A3: mov.w DSP.WriteAddr, Y
#_0CB6B2: #_04A6: mov A, #$00
#_0CB6B4: #_04A8: mov.w DSP.WriteData, A

#_0CB6B7: #_04AB: mov.b Y, #!DSP_ESA
#_0CB6B9: #_04AD: mov.w DSP.WriteAddr, Y
#_0CB6BC: #_04B0: mov.b A, #EchoBuffer>>8
#_0CB6BE: #_04B2: mov.w DSP.WriteData, A

#_0CB6C1: #_04B5: mov.b Y, #!DSP_MVOL_L
#_0CB6C3: #_04B7: mov.w DSP.WriteAddr, Y
#_0CB6C6: #_04BA: mov A, #$60
#_0CB6C8: #_04BC: mov.w DSP.WriteData, A

#_0CB6CB: #_04BF: mov.b Y, #!DSP_MVOL_R
#_0CB6CD: #_04C1: mov.w DSP.WriteAddr, Y
#_0CB6D0: #_04C4: mov.w DSP.WriteData, A

#_0CB6D3: #_04C7: mov.b Y, #!DSP_DIR
#_0CB6D5: #_04C9: mov.w DSP.WriteAddr, Y
#_0CB6D8: #_04CC: mov.b A, #SamplePointers>>8
#_0CB6DA: #_04CE: mov.w DSP.WriteData, A

#_0CB6DD: #_04D1: mov.b Y, #!DSP_FLG
#_0CB6DF: #_04D3: mov.w DSP.WriteAddr, Y
#_0CB6E2: #_04D6: mov A, #$14 ; echo off, x4 noise clock
#_0CB6E4: #_04D8: mov.w DSP.WriteData, A

#_0CB6E7: #_04DB: mov A, #$80 ; 16ms timers
#_0CB6E9: #_04DD: mov.w DSP.Timer0, A
#_0CB6EC: #_04E0: mov.w DSP.Timer1, A

#_0CB6EF: #_04E3: mov.b A, #!DSP_CTRL_PORT_CLEAR_0123|!DSP_CTRL_START_TIMER_1|!DSP_CTRL_START_TIMER_0
#_0CB6F1: #_04E5: mov.w DSP.Control, A

#_0CB6F4: #_04E8: ret

HandleSongTracks:
#_0CB6F5: #_04E9: mov.b ChannelBit, MusicChannelBits
#_0CB6F8: #_04EC: mov.b ChannelOffset, #$FF

.morechannels
#_0CB6FB: #_04EF: inc.b ChannelOffset
#_0CB6FD: #_04F1: lsr.b ChannelBit
#_0CB6FF: #_04F3: bcc .skipchannel

#_0CB701: #_04F5: push P
#_0CB702: #_04F6: mov.b X, ChannelOffset
#_0CB704: #_04F8: mov.b DSP_PERMISSION, #$01

#_0CB707: #_04FB: mov.w A, Channel_Bits_Table+X
#_0CB70A: #_04FE: and.b A, SFXChannelBits
#_0CB70C: #_0500: beq .sfxchanneloff

.sfxchannelon
#_0CB70E: #_0502: mov.b DSP_PERMISSION, #$03

.sfxchanneloff
#_0CB711: #_0505: mov.w A, Channel_PerformFlags+X
#_0CB714: #_0508: mov.b PerformFlags, A

#_0CB716: #_050A: call HandleSingleTrack

#_0CB719: #_050D: mov.b A, PerformFlags
#_0CB71B: #_050F: mov.w Channel_PerformFlags+X, A
#_0CB71E: #_0512: pop P

.skipchannel
#_0CB71F: #_0513: bne .morechannels
#_0CB721: #_0515: ret

HandleSFXTracks:
#_0CB722: #_0516: mov.b ChannelBit, SFXChannelBits
#_0CB725: #_0519: mov.b ChannelOffset, #$07
#_0CB728: #_051C: mov.b DSP_PERMISSION, #$00

.nextchannel
#_0CB72B: #_051F: inc.b ChannelOffset
#_0CB72D: #_0521: lsr.b ChannelBit
#_0CB72F: #_0523: bcc .skipchannel

#_0CB731: #_0525: push P
#_0CB732: #_0526: mov.b DSP_PERMISSION, #$00

#_0CB735: #_0529: mov.b X, ChannelOffset
#_0CB737: #_052B: mov.w A, Channel_Bits_Table+X
#_0CB73A: #_052E: and.b A, MusicChannelBits

#_0CB73C: #_0530: beq .musicchanneloff

.musicchannelon
#_0CB73E: #_0532: mov.b DSP_PERMISSION, #$04

.musicchanneloff
#_0CB741: #_0535: mov.w A, Channel_PerformFlags+X
#_0CB744: #_0538: mov.b PerformFlags, A

#_0CB746: #_053A: call HandleSingleTrack

#_0CB749: #_053D: mov.b A, PerformFlags
#_0CB74B: #_053F: mov.w Channel_PerformFlags+X, A

#_0CB74E: #_0542: pop P

.skipchannel
#_0CB74F: #_0543: bne .nextchannel
#_0CB751: #_0545: bbc2.b FLAGS_B0, .exit

#_0CB754: #_0548: call HandleMasterVolumeFade

.exit
#_0CB757: #_054B: ret

HandleSingleTrack:
#_0CB758: #_054C: dec.b ChannelTimer+X
#_0CB75A: #_054E: bne .wait_longer

#_0CB75C: #_0550: jmp .handledata

.wait_longer
#_0CB75F: #_0553: bbs5.b PerformFlags, .exit
#_0CB762: #_0556: bbc0.b PerformFlags, .skippitch

#_0CB765: #_0559: call HandlePitch

.skippitch
#_0CB768: #_055C: bbc6.b PerformFlags, .skipvibrato

#_0CB76B: #_055F: call Handle_Vibrato

.skipvibrato
#_0CB76E: #_0562: dec.b Channel_StaccTimer+X
#_0CB770: #_0564: bne .exit

#_0CB772: #_0566: bbs2.b PerformFlags, .exit
#_0CB775: #_0569: bbs1.b DSP_PERMISSION, .exit

#_0CB778: #_056C: mov.b A, #!DSP_KOF
#_0CB77A: #_056E: mov.w DSP.WriteAddr, A

#_0CB77D: #_0571: mov.w A, Channel_Bits_Table+X
#_0CB780: #_0574: or.w A, DSP.WriteData
#_0CB783: #_0577: mov.w DSP.WriteData, A

.exit
#_0CB786: #_057A: ret

.handledata
#_0CB787: #_057B: mov.w A, Channel_LocationLo+X
#_0CB78A: #_057E: mov.b TrackRead+0, A

#_0CB78C: #_0580: mov.w A, Channel_LocationHi+X
#_0CB78F: #_0583: mov.b TrackRead+1, A

#_0CB791: #_0585: bra .start

#CommandDone_next:
#_0CB793: #_0587: incw.b TrackRead

#CommandDone_reset:
.start
#_0CB795: #_0589: mov.b X, ChannelOffset
#_0CB797: #_058B: mov Y, #$00
#_0CB799: #_058D: mov.b A, (TrackRead)+Y
#_0CB79B: #_058F: bmi LengthOrCommand

#_0CB79D: #_0591: cmp A, #$60
#_0CB79F: #_0593: bcs ChangeChannelXVolume
#_0CB7A1: #_0595: jmp HandleTrackWriting

#ChangeChannelXVolume:
#_0CB7A4: #_0598: and A, #$1F
#_0CB7A6: #_059A: mov Y, A
#_0CB7A7: #_059B: mov.w A, Table_of_Pan+Y
#_0CB7AA: #_059E: mov.w Channel_Pan_Index+X, A

#CommandDone_SetVolume:
#_0CB7AD: #_05A1: mov.b ChannelSomething, A
#_0CB7AF: #_05A3: call GetVolumeByte
#_0CB7B2: #_05A6: mov.w Channel_Vol_L+X, A

#_0CB7B5: #_05A9: mov.b A, ChannelSomething
#_0CB7B7: #_05AB: xcn A
#_0CB7B8: #_05AC: call GetVolumeByte
#_0CB7BB: #_05AF: mov.w Channel_Vol_R+X, A

#_0CB7BE: #_05B2: bra CommandDone_next

GetVolumeByte:
#_0CB7C0: #_05B4: and A, #$0F
#_0CB7C2: #_05B6: asl A
#_0CB7C3: #_05B7: asl A
#_0CB7C4: #_05B8: clrc
#_0CB7C5: #_05B9: adc A, Channel_Pan+X

#_0CB7C8: #_05BC: bpl .valid

#_0CB7CA: #_05BE: mov A, #$7F

.valid
#_0CB7CC: #_05C0: eor A, #$FF
#_0CB7CE: #_05C2: and A, #$7F
#_0CB7D0: #_05C4: ret

LengthOrCommand:
#_0CB7D1: #_05C5: cmp A, #$C0 ; $C0 = command?
#_0CB7D3: #_05C7: bcc .length

#_0CB7D5: #_05C9: and A, #$1F
#_0CB7D7: #_05CB: asl A
#_0CB7D8: #_05CC: mov X, A
#_0CB7D9: #_05CD: jmp (TrackCommands+X)

; get bottom 7 bits of byte we just read
; then add in $0C04+Y, based on the index
.length
#_0CB7DC: #_05D0: and A, #$7F
#_0CB7DE: #_05D2: clrc
#_0CB7DF: #_05D3: adc.w A, Channel_NoteLengthPage+X
#_0CB7E2: #_05D6: mov Y, A
#_0CB7E3: #_05D7: mov.w A, NoteLengths+Y

#_0CB7E6: #_05DA: setc
#_0CB7E7: #_05DB: sbc.w A, Channel_NoteLengthShorten+X ; never used in practice
#_0CB7EA: #_05DE: bcs .notzero
#_0CB7EC: #_05E0: bne .notzero

#_0CB7EE: #_05E2: mov A, #$01

.notzero
#_0CB7F0: #_05E4: mov.w Channel_NoteLength+X, A
#_0CB7F3: #_05E7: setc
#_0CB7F4: #_05E8: sbc.w A, Channel_StaccLevel+X
#_0CB7F7: #_05EB: bvc .dontusezero

#_0CB7F9: #_05ED: mov A, #$01

.dontusezero
#_0CB7FB: #_05EF: mov.w Channel_StaccMax+X, A
#_0CB7FE: #_05F2: bra CommandDone_next

#HandleNoise:
#_0CB800: #_05F4: mov A, Y
#_0CB801: #_05F5: and A, #$1F
#_0CB803: #_05F7: bbs1.b FLAGS_B0, .dontenableecho

#_0CB806: #_05FA: or A, #$20

.dontenableecho
#_0CB808: #_05FC: mov.w Channel_Unused_0110+X, A

#_0CB80B: #_05FF: bbs1.b DSP_PERMISSION, .dontdonoise
#_0CB80E: #_0602: mov Y, A
#_0CB80F: #_0603: mov A, #!DSP_NON

#_0CB811: #_0605: mov.w DSP.WriteAddr, A
#_0CB814: #_0608: mov.w A, DSP.WriteData
#_0CB817: #_060B: beq .channelnotnoise

#_0CB819: #_060D: mov.w A, Channel_Bits_Table+X
#_0CB81C: #_0610: eor.w A, DSP.WriteData
#_0CB81F: #_0613: bne .some_channels_are_noise

.channelnotnoise
#_0CB821: #_0615: mov.w A, Channel_Bits_Table+X
#_0CB824: #_0618: mov.w DSP.WriteData, A

#_0CB827: #_061B: mov A, #!DSP_FLG
#_0CB829: #_061D: mov.w DSP.WriteAddr, A
#_0CB82C: #_0620: mov.w DSP.WriteData, Y

.dontdonoise:
#_0CB82F: #_0623: jmp HandleVolume

.some_channels_are_noise
#_0CB832: #_0626: bbc0.b DSP_PERMISSION, .channelnotnoise

#KOFF_channel:
#_0CB835: #_0629: set5.b PerformFlags
#_0CB837: #_062B: bbs1 DSP_PERMISSION, .exit

#_0CB83A: #_062E: mov.b A, #!DSP_KOF
#_0CB83C: #_0630: mov.w DSP.WriteAddr, A

#_0CB83F: #_0633: mov.w A, Channel_Bits_Table+X
#_0CB842: #_0636: or.w A, DSP.WriteData
#_0CB845: #_0639: mov.w DSP.WriteData, A

.exit
#_0CB848: #_063C: ret

HandleTrackWriting:
; increments TrackRead then saves it to channel location
#_0CB849: #_063D: incw.b TrackRead
#_0CB84B: #_063F: mov Y, A

; save track location
#_0CB84C: #_0640: mov.b A, TrackRead+0
#_0CB84E: #_0642: mov.w Channel_LocationLo+X, A
#_0CB851: #_0645: mov.b A, TrackRead+1
#_0CB853: #_0647: mov.w Channel_LocationHi+X, A

; reset these times
#_0CB856: #_064A: mov.w A, Channel_NoteLength+X
#_0CB859: #_064D: mov.b ChannelTimer+X, A

#_0CB85B: #_064F: mov.w A, Channel_StaccMax+X
#_0CB85E: #_0652: mov.b Channel_StaccTimer+X, A

#_0CB860: #_0654: cmp Y, #$30 ; $30 also some kind of rest?
#_0CB862: #_0656: beq KOFF_channel

#_0CB864: #_0658: clr5.b PerformFlags

#_0CB866: #_065A: cmp Y, #$31 ; i think $31 = rest?
#_0CB868: #_065C: bne .not_tie

#_0CB86A: #_065E: set7.b FLAGS_B0
#_0CB86C: #_0660: jmp HandleVolume

.HandleNoise_bounce
#_0CB86F: #_0663: bra HandleNoise

.not_tie
#_0CB871: #_0665: bbs1.b DSP_PERMISSION, .donotdokoff

#_0CB874: #_0668: mov.b A, #!DSP_KOF
#_0CB876: #_066A: mov.w DSP.WriteAddr, A
#_0CB879: #_066D: mov.w A, Channel_Bits_NOT+X
#_0CB87C: #_0670: and.w A, DSP.WriteData
#_0CB87F: #_0673: mov.w DSP.WriteData, A

.donotdokoff
#_0CB882: #_0676: cmp Y, #$40
#_0CB884: #_0678: bcs .HandleNoise_bounce

#_0CB886: #_067A: clr4.b PerformFlags ; never used, so pointless
#_0CB888: #_067C: bbs1.b DSP_PERMISSION, .donotchangenoise

; disable noise on channel
#_0CB88B: #_067F: mov A, #!DSP_NON
#_0CB88D: #_0681: mov.w DSP.WriteAddr, A
#_0CB890: #_0684: mov.w A, Channel_Bits_NOT+X
#_0CB893: #_0687: and.w A, DSP.WriteData
#_0CB896: #_068A: mov.w DSP.WriteData, A

.donotchangenoise
#_0CB899: #_068D: mov A, Y
#_0CB89A: #_068E: clrc
#_0CB89B: #_068F: adc.w A, Channel_Transpose+X
#_0CB89E: #_0692: cmp A, #$30
#_0CB8A0: #_0694: bcc .pitchoverflow

#_0CB8A2: #_0696: mov A, Y

.pitchoverflow
#_0CB8A3: #_0697: asl A
#_0CB8A4: #_0698: mov Y, A

; Use byte to get a pitch
#_0CB8A5: #_0699: mov.w A, NotePitches+0+Y
#_0CB8A8: #_069C: mov.b Scratch0A+0, A

#_0CB8AA: #_069E: mov.w A, NotePitches+1+Y
#_0CB8AD: #_06A1: mov.b Scratch0A+1, A

; then add in tuning
#_0CB8AF: #_06A3: mov.w A, Channel_FineTune+X

; save high byte in Y
#_0CB8B2: #_06A6: mov Y, #$00
#_0CB8B4: #_06A8: clrc
#_0CB8B5: #_06A9: addw.b YA, Scratch0A
#_0CB8B7: #_06AB: mov.w Channel_PitchLow+X, A
#_0CB8BA: #_06AE: bbs1.b DSP_PERMISSION, .dontwritepitch

; so this actually writes the pitch
#_0CB8BD: #_06B1: mov X, A ; low byte of pitch to X
#_0CB8BE: #_06B2: mov.b A, ChannelOffset
#_0CB8C0: #_06B4: and A, #$07
#_0CB8C2: #_06B6: xcn A

#_0CB8C3: #_06B7: or A, #$02 ; PITCH_L
#_0CB8C5: #_06B9: mov.w DSP.WriteAddr, A
#_0CB8C8: #_06BC: mov.w DSP.WriteData, X ; X had low byte

#_0CB8CB: #_06BF: inc A ; PITCH_H
#_0CB8CC: #_06C0: mov.w DSP.WriteAddr, A
#_0CB8CF: #_06C3: mov.w DSP.WriteData, Y ; Y had high byte

; saves high byte to channel pitch
.dontwritepitch
#_0CB8D2: #_06C6: mov A, Y
#_0CB8D3: #_06C7: mov.b X, ChannelOffset
#_0CB8D5: #_06C9: mov.w Channel_PitchHigh+X, A

#HandleVolume:
#_0CB8D8: #_06CC: bbs1.b DSP_PERMISSION, .dontwritevolume
#_0CB8DB: #_06CF: mov A, X
#_0CB8DC: #_06D0: and A, #$07
#_0CB8DE: #_06D2: xcn A
#_0CB8DF: #_06D3: mov Y, A ; VOL_L

#_0CB8E0: #_06D4: mov.w A, Channel_Vol_L+X
#_0CB8E3: #_06D7: mov.w DSP.WriteAddr, Y
#_0CB8E6: #_06DA: mov.w DSP.WriteData, A

#_0CB8E9: #_06DD: inc Y ; VOL_R
#_0CB8EA: #_06DE: mov.w A, Channel_Vol_R+X
#_0CB8ED: #_06E1: mov.w DSP.WriteAddr, Y
#_0CB8F0: #_06E4: mov.w DSP.WriteData, A

.dontwritevolume
#_0CB8F3: #_06E7: bbs7.b FLAGS_B0, .exit
#_0CB8F6: #_06EA: bbs2.b PerformFlags, .exit
#_0CB8F9: #_06ED: bbs1.b DSP_PERMISSION, .exit

#_0CB8FC: #_06F0: mov.b A, #!DSP_KON
#_0CB8FE: #_06F2: mov.w DSP.WriteAddr, A
#_0CB901: #_06F5: mov.w A, Channel_Bits_Table+X
#_0CB904: #_06F8: mov.w DSP.WriteData, A

.exit
#_0CB907: #_06FB: clr7.b FLAGS_B0
#_0CB909: #_06FD: ret

; 0xC0-0xDF also work, but, in practice, only 0xE0-0xFF are used
TrackCommands:
#_0CB90A: #_06FE: dw TrackCommandE0_ChangeTimer0
#_0CB90C: #_0700: dw TrackCommandE1_Nothing
#_0CB90E: #_0702: dw TrackCommandE2_PitchBend_Off
#_0CB910: #_0704: dw TrackCommandE3_PitchBend
#_0CB912: #_0706: dw TrackCommandE4_SetLoop_A
#_0CB914: #_0708: dw TrackCommandE5_PerformLoop_A
#_0CB916: #_070A: dw TrackCommandE6_CallSub_A
#_0CB918: #_070C: dw TrackCommandE7_Return_A
#_0CB91A: #_070E: dw TrackCommandE8_SetVibrato
#_0CB91C: #_0710: dw TrackCommandE9_VibratoOff
#_0CB91E: #_0712: dw TrackCommandEA_KOFF_Channel
#_0CB920: #_0714: dw TrackCommandEB_SetStaccLevel
#_0CB922: #_0716: dw TrackCommandEC_MVOL_Fade
#_0CB924: #_0718: dw TrackCommandED_WriteToPort3
#_0CB926: #_071A: dw TrackCommandEE_Set_B0_bit0
#_0CB928: #_071C: dw TrackCommandEF_Clr_B0_bit0
#_0CB92A: #_071E: dw TrackCommandF0_SetADSR
#_0CB92C: #_0720: dw TrackCommandF1_SetSRCN
#_0CB92E: #_0722: dw TrackCommandF2_SetPan
#_0CB930: #_0724: dw TrackCommandF3_Transpose
#_0CB932: #_0726: dw TrackCommandF4_SetLoop_B
#_0CB934: #_0728: dw TrackCommandF5_PerformLoop_B
#_0CB936: #_072A: dw TrackCommandF6_CallSub_B
#_0CB938: #_072C: dw TrackCommandF7_Return_B
#_0CB93A: #_072E: dw TrackCommandF8_Goto_X
#_0CB93C: #_0730: dw TrackCommandF9_FineTune
#_0CB93E: #_0732: dw TrackCommandFA_SetNoteLengthShorten
#_0CB940: #_0734: dw TrackCommandFB_NoteLengthPage
#_0CB942: #_0736: dw TrackCommandFC_FadeOut
#_0CB944: #_0738: dw TrackCommandFD_FadeOff
#_0CB946: #_073A: dw TrackCommandFE_Set_B8
#_0CB948: #_073C: dw TrackCommandFF_EndTrack

UnusedJump:
#_0CB94A: #_073E: jmp CommandDone_next

;===================================================================================================
; Sets timer0 divider to n+0x80
;===================================================================================================
TrackCommandE0_ChangeTimer0:
#_0CB94D: #_0741: incw.b TrackRead
#_0CB94F: #_0743: mov.b A, (TrackRead)+Y
#_0CB951: #_0745: bbc0.b DSP_PERMISSION, .exit

#_0CB954: #_0748: clrc
#_0CB955: #_0749: push A

#_0CB956: #_074A: mov A, #$02
#_0CB958: #_074C: mov.w DSP.Control, A

#_0CB95B: #_074F: pop A
#_0CB95C: #_0750: adc A, #$80
#_0CB95E: #_0752: mov.w DSP.Timer0, A

#_0CB961: #_0755: mov A, #$33
#_0CB963: #_0757: mov.w DSP.Control, A

.exit
#_0CB966: #_075A: jmp CommandDone_next

;===================================================================================================
; Not used and does nothing
;===================================================================================================
TrackCommandE1_Nothing:
#_0CB969: #_075D: jmp CommandDone_next

;===================================================================================================
; Disable pitch bend
;===================================================================================================
TrackCommandE2_PitchBend_Off:
#_0CB96C: #_0760: clr0.b PerformFlags
#_0CB96E: #_0762: jmp CommandDone_next

;===================================================================================================
; Enables pitch bend and sets the detune amount
;===================================================================================================
TrackCommandE3_PitchBend:
#_0CB971: #_0765: set0.b PerformFlags
#_0CB973: #_0767: incw.b TrackRead

#_0CB975: #_0769: mov.b A, (TrackRead)+Y
#_0CB977: #_076B: mov.b X, ChannelOffset
#_0CB979: #_076D: mov.w Channel_PitchBend+X, A

#_0CB97C: #_0770: jmp CommandDone_next

;===================================================================================================
; Marks this spot as a Loop_A point to be looped n times
;===================================================================================================
TrackCommandE4_SetLoop_A:
#_0CB97F: #_0773: incw.b TrackRead
#_0CB981: #_0775: mov.b A, (TrackRead)+Y

#_0CB983: #_0777: mov.b X, ChannelOffset
#_0CB985: #_0779: mov.b Channel_Loops_A+X, A

#_0CB987: #_077B: mov.b A, TrackRead+0
#_0CB989: #_077D: mov.w Channel_Loop_A_Lo+X, A
#_0CB98C: #_0780: mov.b A, TrackRead+1
#_0CB98E: #_0782: mov.w Channel_Loop_A_Hi+X, A

#_0CB991: #_0785: jmp CommandDone_next

;===================================================================================================
; Performs Loop_A loops
;===================================================================================================
TrackCommandE5_PerformLoop_A:
#_0CB994: #_0788: mov.b X, ChannelOffset
#_0CB996: #_078A: dec.b Channel_Loops_A+X
#_0CB998: #_078C: beq .done_looping

#_0CB99A: #_078E: mov.w A, Channel_Loop_A_Lo+X
#_0CB99D: #_0791: mov.b TrackRead+0, A
#_0CB99F: #_0793: mov.w A, Channel_Loop_A_Hi+X
#_0CB9A2: #_0796: mov.b TrackRead+1, A

.done_looping
#_0CB9A4: #_0798: jmp CommandDone_next

;===================================================================================================
; Sets Return_A to here then calls the address
;===================================================================================================
TrackCommandE6_CallSub_A:
#_0CB9A7: #_079B: mov.b X, ChannelOffset
#_0CB9A9: #_079D: incw.b TrackRead

#_0CB9AB: #_079F: mov.b A, (TrackRead)+Y
#_0CB9AD: #_07A1: mov.b ChannelSomething, A

#_0CB9AF: #_07A3: incw.b TrackRead
#_0CB9B1: #_07A5: mov.b A, (TrackRead)+Y
#_0CB9B3: #_07A7: mov Y, A

#_0CB9B4: #_07A8: mov.b A, TrackRead+0
#_0CB9B6: #_07AA: mov.w Channel_Return_A_lo+X, A
#_0CB9B9: #_07AD: mov.b A, TrackRead+1
#_0CB9BB: #_07AF: mov.w Channel_Return_A_hi+X, A

#_0CB9BE: #_07B2: mov.b TrackRead+0, ChannelSomething
#_0CB9C1: #_07B5: mov.b TrackRead+1, Y
#_0CB9C3: #_07B7: jmp CommandDone_reset

;===================================================================================================
; Back to Return_A
;===================================================================================================
TrackCommandE7_Return_A:
#_0CB9C6: #_07BA: mov.b X, ChannelOffset

#_0CB9C8: #_07BC: mov.w A, Channel_Return_A_lo+X
#_0CB9CB: #_07BF: mov.b TrackRead+0, A
#_0CB9CD: #_07C1: mov.w A, Channel_Return_A_hi+X
#_0CB9D0: #_07C4: mov.b TrackRead+1, A

#_0CB9D2: #_07C6: jmp CommandDone_next

;===================================================================================================
; Sets vibrato as type n and enables
;===================================================================================================
TrackCommandE8_SetVibrato:
#_0CB9D5: #_07C9: set6.b PerformFlags
#_0CB9D7: #_07CB: mov.b X, ChannelOffset
#_0CB9D9: #_07CD: incw.b TrackRead

#_0CB9DB: #_07CF: mov.b A, (TrackRead)+Y
#_0CB9DD: #_07D1: asl A
#_0CB9DE: #_07D2: mov Y, A

#_0CB9DF: #_07D3: mov.w A, VibratoPointers+0+Y
#_0CB9E2: #_07D6: mov.w Channel_Vibrato_Address_Lo+X, A
#_0CB9E5: #_07D9: mov.w A, VibratoPointers+1+Y
#_0CB9E8: #_07DC: mov.w Channel_Vibrato_Address_Hi+X, A

#_0CB9EB: #_07DF: mov A, #$00
#_0CB9ED: #_07E1: mov.w Channel_Vibrato_Counter+X, A
#_0CB9F0: #_07E4: jmp CommandDone_next

;===================================================================================================
; Disable vibrato
;===================================================================================================
TrackCommandE9_VibratoOff:
#_0CB9F3: #_07E7: clr6 PerformFlags
#_0CB9F5: #_07E9: jmp CommandDone_next

;===================================================================================================
; Never actually used
;===================================================================================================
TrackCommandEA_KOFF_Channel:
#_0CB9F8: #_07EC: mov.b X, ChannelOffset
#_0CB9FA: #_07EE: mov.w A, Channel_Bits_Table+X
#_0CB9FD: #_07F1: bbs1.b DSP_PERMISSION, .donotchangekoff

#_0CBA00: #_07F4: mov Y, #!DSP_KOF
#_0CBA02: #_07F6: mov.w DSP.WriteAddr, Y
#_0CBA05: #_07F9: mov.w DSP.WriteData, A

.donotchangekoff
#_0CBA08: #_07FC: jmp CommandDone_next

;===================================================================================================
; Never actually used
;===================================================================================================
TrackCommandEB_SetStaccLevel:
#_0CBA0B: #_07FF: mov.b X, ChannelOffset
#_0CBA0D: #_0801: incw.b TrackRead

#_0CBA0F: #_0803: mov.b A, (TrackRead)+Y
#_0CBA11: #_0805: mov.w Channel_StaccLevel+X, A

#_0CBA14: #_0808: jmp CommandDone_next

;===================================================================================================
; Master volume fading
;===================================================================================================
TrackCommandEC_MVOL_Fade:
#_0CBA17: #_080B: mov.b X, ChannelOffset
#_0CBA19: #_080D: incw.b TrackRead

#_0CBA1B: #_080F: mov.b A, (TrackRead)+Y
#_0CBA1D: #_0811: mov.b MVOL_Timer, A
#_0CBA1F: #_0813: mov.b MVOL_TimerLength, A

#_0CBA21: #_0815: incw.b TrackRead
#_0CBA23: #_0817: mov.b A, (TrackRead)+Y
#_0CBA25: #_0819: mov.b MVOL_Interval, A

#_0CBA27: #_081B: set2.b FLAGS_B0
#_0CBA29: #_081D: jmp CommandDone_next

;===================================================================================================
; Never actually used
; I wonder what it would have been for
;===================================================================================================
TrackCommandED_WriteToPort3:
#_0CBA2C: #_0820: incw.b TrackRead

#_0CBA2E: #_0822: mov.b A, (TrackRead)+Y
#_0CBA30: #_0824: mov.w DSP.Port3, A

#_0CBA33: #_0827: jmp CommandDone_next

;===================================================================================================
; Never actually used, so not sure
;===================================================================================================
TrackCommandEE_Set_B0_bit0:
#_0CBA36: #_082A: set0 FLAGS_B0
#_0CBA38: #_082C: jmp CommandDone_next

;===================================================================================================
; Never actually used, so not sure
;===================================================================================================
TrackCommandEF_Clr_B0_bit0:
#_0CBA3B: #_082F: clr0 FLAGS_B0
#_0CBA3D: #_0831: jmp CommandDone_next

;===================================================================================================
; Sets ADSR using next 2 bytes
; Handles GAIN appropriately
;===================================================================================================
TrackCommandF0_SetADSR:
#_0CBA40: #_0834: mov.b X, ChannelOffset
#_0CBA42: #_0836: incw.b TrackRead

#_0CBA44: #_0838: mov.b A, (TrackRead)+Y
#_0CBA46: #_083A: push A

#_0CBA47: #_083B: incw.b TrackRead

#_0CBA49: #_083D: mov.b A, (TrackRead)+Y
#_0CBA4B: #_083F: pop Y

#_0CBA4C: #_0840: bbc1.b DSP_PERMISSION, .okaytogo

#_0CBA4F: #_0843: mov.w Channel_ADSR_B+X, A
#_0CBA52: #_0846: push A

#_0CBA53: #_0847: mov A, Y
#_0CBA54: #_0848: mov.w Channel_ADSR_A+X, A

#_0CBA57: #_084B: pop A
#_0CBA58: #_084C: bbs1.b DSP_PERMISSION, .done ; this should have been a BRA

.okaytogo
#_0CBA5B: #_084F: mov X, A
#_0CBA5C: #_0850: mov.b A, ChannelOffset
#_0CBA5E: #_0852: and A, #$07
#_0CBA60: #_0854: xcn A

#_0CBA61: #_0855: or A, #$05 ; ADSR_A
#_0CBA63: #_0857: mov.w DSP.WriteAddr, A
#_0CBA66: #_085A: mov.w DSP.WriteData, Y

#_0CBA69: #_085D: inc A ; ADSR_B
#_0CBA6A: #_085E: mov.w DSP.WriteAddr, A
#_0CBA6D: #_0861: mov.w DSP.WriteData, X

.done
#_0CBA70: #_0864: jmp CommandDone_next

;===================================================================================================
; Sets channel SRCN to n
;===================================================================================================
TrackCommandF1_SetSRCN:
#_0CBA73: #_0867: mov.b X, ChannelOffset
#_0CBA75: #_0869: incw.b TrackRead

#_0CBA77: #_086B: mov.b A, (TrackRead)+Y
#_0CBA79: #_086D: bbs2.b DSP_PERMISSION, .okaytogo

#_0CBA7C: #_0870: mov.w Channel_SRCN+X, A

.okaytogo
#_0CBA7F: #_0873: bbs1.b DSP_PERMISSION, .done

#_0CBA82: #_0876: mov Y, A
#_0CBA83: #_0877: mov A, X
#_0CBA84: #_0878: and A, #$07
#_0CBA86: #_087A: xcn A

#_0CBA87: #_087B: or A, #$04 ; SRCN
#_0CBA89: #_087D: mov.w DSP.WriteAddr, A
#_0CBA8C: #_0880: mov.w DSP.WriteData, Y

.done
#_0CBA8F: #_0883: jmp CommandDone_next

;===================================================================================================
; Sets panning index to n
;===================================================================================================
TrackCommandF2_SetPan:
#_0CBA92: #_0886: mov.b X, ChannelOffset
#_0CBA94: #_0888: incw.b TrackRead

#_0CBA96: #_088A: mov.b A, (TrackRead)+Y
#_0CBA98: #_088C: mov.w Channel_Pan+X, A
#_0CBA9B: #_088F: mov.w A, Channel_Pan_Index+X

#_0CBA9E: #_0892: jmp CommandDone_SetVolume

;===================================================================================================
; Half step transposition
;===================================================================================================
TrackCommandF3_Transpose:
#_0CBAA1: #_0895: mov.b X, ChannelOffset
#_0CBAA3: #_0897: incw.b TrackRead

#_0CBAA5: #_0899: mov.b A, (TrackRead)+Y
#_0CBAA7: #_089B: mov.w Channel_Transpose+X, A

#_0CBAAA: #_089E: jmp CommandDone_next

;===================================================================================================
; Marks this spot as a Loop_B point to be looped n times
;===================================================================================================
TrackCommandF4_SetLoop_B:
#_0CBAAD: #_08A1: incw.b TrackRead

#_0CBAAF: #_08A3: mov.b A, (TrackRead)+Y
#_0CBAB1: #_08A5: mov.b X, ChannelOffset
#_0CBAB3: #_08A7: mov.b Channel_Loops_B+X, A

#_0CBAB5: #_08A9: mov.b A, TrackRead+0
#_0CBAB7: #_08AB: mov.w Channel_Loop_B_Lo+X, A
#_0CBABA: #_08AE: mov.b A, TrackRead+1
#_0CBABC: #_08B0: mov.w Channel_Loop_B_Hi+X, A

#_0CBABF: #_08B3: jmp CommandDone_next

;===================================================================================================
; Performs Loop_B loops
;===================================================================================================
TrackCommandF5_PerformLoop_B:
#_0CBAC2: #_08B6: mov.b X, ChannelOffset
#_0CBAC4: #_08B8: dec.b Channel_Loops_B+X
#_0CBAC6: #_08BA: beq .donelooping

#_0CBAC8: #_08BC: mov.w A, Channel_Loop_B_Lo+X
#_0CBACB: #_08BF: mov.b TrackRead+0, A
#_0CBACD: #_08C1: mov.w A, Channel_Loop_B_Hi+X
#_0CBAD0: #_08C4: mov.b TrackRead+1, A

.donelooping
#_0CBAD2: #_08C6: jmp CommandDone_next

;===================================================================================================
; Sets Return_B to here then calls the address
;===================================================================================================
TrackCommandF6_CallSub_B:
#_0CBAD5: #_08C9: mov.b X, ChannelOffset

#_0CBAD7: #_08CB: incw.b TrackRead
#_0CBAD9: #_08CD: mov.b A, (TrackRead)+Y
#_0CBADB: #_08CF: mov.b ChannelSomething, A

#_0CBADD: #_08D1: incw.b TrackRead
#_0CBADF: #_08D3: mov.b A, (TrackRead)+Y

#_0CBAE1: #_08D5: mov Y, A
#_0CBAE2: #_08D6: mov.b A, TrackRead+0
#_0CBAE4: #_08D8: mov.w Channel_Return_B_lo+X, A
#_0CBAE7: #_08DB: mov.b A, TrackRead+1
#_0CBAE9: #_08DD: mov.w Channel_Return_B_hi+X, A

#_0CBAEC: #_08E0: mov.b TrackRead+0, ChannelSomething
#_0CBAEF: #_08E3: mov.b TrackRead+1, Y
#_0CBAF1: #_08E5: jmp CommandDone_reset

;===================================================================================================
; Back to Return_B
;===================================================================================================
TrackCommandF7_Return_B:
#_0CBAF4: #_08E8: mov.b X, ChannelOffset

#_0CBAF6: #_08EA: mov.w A, Channel_Return_B_lo+X
#_0CBAF9: #_08ED: mov.b TrackRead+0, A
#_0CBAFB: #_08EF: mov.w A, Channel_Return_B_hi+X
#_0CBAFE: #_08F2: mov.b TrackRead+1, A

#_0CBB00: #_08F4: jmp CommandDone_next

;===================================================================================================
; Changes read point to address
;===================================================================================================
TrackCommandF8_Goto_X:
#_0CBB03: #_08F7: incw.b TrackRead

#_0CBB05: #_08F9: mov.b A, (TrackRead)+Y
#_0CBB07: #_08FB: mov X, A

#_0CBB08: #_08FC: incw.b TrackRead

#_0CBB0A: #_08FE: mov.b A, (TrackRead)+Y
#_0CBB0C: #_0900: mov.b TrackRead+0, X
#_0CBB0E: #_0902: mov.b TrackRead+1, A

#_0CBB10: #_0904: jmp CommandDone_reset

;===================================================================================================
; Sub semitone adjustment
;===================================================================================================
TrackCommandF9_FineTune:
#_0CBB13: #_0907: mov.b X, ChannelOffset
#_0CBB15: #_0909: incw.b TrackRead

#_0CBB17: #_090B: mov.b A, (TrackRead)+Y
#_0CBB19: #_090D: mov.w Channel_FineTune+X, A

#_0CBB1C: #_0910: jmp CommandDone_next

;===================================================================================================
; Negative offset n for reading note lengths
; Never actually used
;===================================================================================================
TrackCommandFA_SetNoteLengthShorten:
#_0CBB1F: #_0913: mov.b X, ChannelOffset
#_0CBB21: #_0915: incw.b TrackRead

#_0CBB23: #_0917: mov.b A, (TrackRead)+Y
#_0CBB25: #_0919: mov.w Channel_NoteLengthShorten+X, A

#_0CBB28: #_091C: jmp CommandDone_next

;===================================================================================================
; Sets which page is used for note length
;===================================================================================================
TrackCommandFB_NoteLengthPage:
#_0CBB2B: #_091F: mov.b X, ChannelOffset
#_0CBB2D: #_0921: incw.b TrackRead

#_0CBB2F: #_0923: mov.b A, (TrackRead)+Y
#_0CBB31: #_0925: mov.w Channel_NoteLengthPage+X, A

#_0CBB34: #_0928: jmp CommandDone_next

;===================================================================================================
; Fades out channel volume
;===================================================================================================
TrackCommandFC_FadeOut:
#_0CBB37: #_092B: set2.b PerformFlags
#_0CBB39: #_092D: jmp CommandDone_next

;===================================================================================================
; Back to full volume
;===================================================================================================
TrackCommandFD_FadeOff:
#_0CBB3C: #_0930: clr2.b PerformFlags
#_0CBB3E: #_0932: jmp CommandDone_next

;===================================================================================================
; Never used
;===================================================================================================
TrackCommandFE_Set_B8:
#_0CBB41: #_0935: incw.b TrackRead

#_0CBB43: #_0937: mov.b A, (TrackRead)+Y
#_0CBB45: #_0939: mov.b Unused_B8, A

#_0CBB47: #_093B: jmp CommandDone_next

;===================================================================================================
; Track off
;===================================================================================================
TrackCommandFF_EndTrack:
#_0CBB4A: #_093E: mov.b X, ChannelOffset
#_0CBB4C: #_0940: mov.b PerformFlags, #$00
#_0CBB4F: #_0943: mov.w A, Channel_Bits_NOT+X

#_0CBB52: #_0946: bbc0.b DSP_PERMISSION, .soundeffects

.music
#_0CBB55: #_0949: and.b A, MusicChannelBits
#_0CBB57: #_094B: mov.b MusicChannelBits, A
#_0CBB59: #_094D: bra .continue

.soundeffects
#_0CBB5B: #_094F: and.b A, SFXChannelBits
#_0CBB5D: #_0951: mov.b SFXChannelBits, A

.continue
#_0CBB5F: #_0953: bbs1.b DSP_PERMISSION, .exit
#_0CBB62: #_0956: bbs2.b DSP_PERMISSION, .writeDSP
#_0CBB65: #_0959: mov.w A, Channel_Bits_Table+X

; cache A in Y
; read NON
; see if channel bit is set in there
#_0CBB68: #_095C: mov Y, A
#_0CBB69: #_095D: mov.b A, #!DSP_NON
#_0CBB6B: #_095F: mov.w DSP.WriteAddr, A
#_0CBB6E: #_0962: mov A, Y
#_0CBB6F: #_0963: and.w A, DSP.WriteData
#_0CBB72: #_0966: beq .channel_not_noise

.channel_is_noise
#_0CBB74: #_0968: mov A, #$00
#_0CBB76: #_096A: mov.w DSP.WriteData, A

.channel_not_noise
#_0CBB79: #_096D: mov A, X
#_0CBB7A: #_096E: and A, #$07
#_0CBB7C: #_0970: xcn A
#_0CBB7D: #_0971: mov.b A, #!DSP_KOF

#_0CBB7F: #_0973: mov.w DSP.WriteAddr, A
#_0CBB82: #_0976: mov.w A, Channel_Bits_Table+X
#_0CBB85: #_0979: or.w A, DSP.WriteData
#_0CBB88: #_097C: mov.w DSP.WriteData, A

.exit
#_0CBB8B: #_097F: ret

.writeDSP
#_0CBB8C: #_0980: mov.b A, #!DSP_KOF
#_0CBB8E: #_0982: mov.w DSP.WriteAddr, A
#_0CBB91: #_0985: mov.w A, Channel_Bits_Table+X
#_0CBB94: #_0988: mov.w DSP.WriteData, A

#_0CBB97: #_098B: mov A, X
#_0CBB98: #_098C: and A, #$07
#_0CBB9A: #_098E: mov X, A
#_0CBB9B: #_098F: xcn A

#_0CBB9C: #_0990: mov Y, #$00 ; VOL_L
#_0CBB9E: #_0992: mov.w DSP.WriteAddr, A
#_0CBBA1: #_0995: mov.w DSP.WriteData, Y

#_0CBBA4: #_0998: inc A ; VOL_R
#_0CBBA5: #_0999: mov.w DSP.WriteAddr, A
#_0CBBA8: #_099C: mov.w DSP.WriteData, Y
#_0CBBAB: #_099F: mov Y, A

#_0CBBAC: #_09A0: inc Y ; PITCH_L
#_0CBBAD: #_09A1: mov.w DSP.WriteAddr, Y
#_0CBBB0: #_09A4: mov.w A, Channel_PitchLow+X
#_0CBBB3: #_09A7: mov.w DSP.WriteData, A

#_0CBBB6: #_09AA: inc Y ; PITCH_H
#_0CBBB7: #_09AB: mov.w DSP.WriteAddr, Y
#_0CBBBA: #_09AE: mov.w A, Channel_PitchHigh+X
#_0CBBBD: #_09B1: mov.w DSP.WriteData, A

#_0CBBC0: #_09B4: inc Y ; SRCN
#_0CBBC1: #_09B5: mov.w DSP.WriteAddr, Y
#_0CBBC4: #_09B8: mov.w A, Channel_SRCN+X
#_0CBBC7: #_09BB: mov.w DSP.WriteData, A

#_0CBBCA: #_09BE: inc Y ; ADSR_A
#_0CBBCB: #_09BF: mov.w DSP.WriteAddr, Y
#_0CBBCE: #_09C2: mov.w A, Channel_ADSR_A+X
#_0CBBD1: #_09C5: mov.w DSP.WriteData, A

#_0CBBD4: #_09C8: inc Y ; ADSR_B
#_0CBBD5: #_09C9: mov.w DSP.WriteAddr, Y
#_0CBBD8: #_09CC: mov.w A, Channel_ADSR_B+X
#_0CBBDB: #_09CF: mov.w DSP.WriteData, A

#_0CBBDE: #_09D2: mov.w A, Channel_Bits_Table+X
#_0CBBE1: #_09D5: mov Y, A

#_0CBBE2: #_09D6: mov.b A, #!DSP_NON
#_0CBBE4: #_09D8: mov.w DSP.WriteAddr, A
#_0CBBE7: #_09DB: mov A, Y
#_0CBBE8: #_09DC: and.w A, DSP.WriteData

#_0CBBEB: #_09DF: beq .channel_not_noise

#_0CBBED: #_09E1: mov A, #$00
#_0CBBEF: #_09E3: mov.w DSP.WriteData, A

#_0CBBF2: #_09E6: ret

HandlePitch:
#_0CBBF3: #_09E7: mov.w A, Channel_PitchLow+X
#_0CBBF6: #_09EA: mov.b Scratch0A+0, A
#_0CBBF8: #_09EC: mov.w A, Channel_PitchHigh+X
#_0CBBFB: #_09EF: mov.b Scratch0A+1, A

#_0CBBFD: #_09F1: mov.w A, Channel_PitchBend+X
#_0CBC00: #_09F4: bmi .negative

#_0CBC02: #_09F6: mov Y, #$00
#_0CBC04: #_09F8: bra .handleit

.negative
#_0CBC06: #_09FA: mov Y, #$FF

.handleit
#_0CBC08: #_09FC: addw.b YA, Scratch0A
#_0CBC0A: #_09FE: cmp Y, #$3F
#_0CBC0C: #_0A00: bcs .pitchtoohigh

#_0CBC0E: #_0A02: mov.w Channel_PitchLow+X, A
#_0CBC11: #_0A05: bbs1.b DSP_PERMISSION, .donotwritepitch

#_0CBC14: #_0A08: mov X, A
#_0CBC15: #_0A09: mov.b A, ChannelOffset
#_0CBC17: #_0A0B: and A, #$07
#_0CBC19: #_0A0D: xcn A
#_0CBC1A: #_0A0E: or A, #$02

#_0CBC1C: #_0A10: mov.w DSP.WriteAddr, A
#_0CBC1F: #_0A13: mov.w DSP.WriteData, X

#_0CBC22: #_0A16: inc A
#_0CBC23: #_0A17: mov.w DSP.WriteAddr, A
#_0CBC26: #_0A1A: mov.w DSP.WriteData, Y
#_0CBC29: #_0A1D: mov.b X, ChannelOffset

.donotwritepitch
#_0CBC2B: #_0A1F: mov A, Y
#_0CBC2C: #_0A20: mov.w Channel_PitchHigh+X, A

.pitchtoohigh
#_0CBC2F: #_0A23: ret

Handle_Vibrato:
#_0CBC30: #_0A24: mov.w A, Channel_Vibrato_Address_Lo+X
#_0CBC33: #_0A27: mov.b Scratch0A+0, A
#_0CBC35: #_0A29: mov.w A, Channel_Vibrato_Address_Hi+X
#_0CBC38: #_0A2C: mov.b Scratch0A+1, A

#_0CBC3A: #_0A2E: mov.w A, Channel_Vibrato_Counter+X
#_0CBC3D: #_0A31: mov Y, A

.next_byte
#_0CBC3E: #_0A32: mov.b A, (Scratch0A)+Y

; if byte is $80
; set a loop point?
#_0CBC40: #_0A34: cmp A, #$80
#_0CBC42: #_0A36: bne .not80

#_0CBC44: #_0A38: inc Y
#_0CBC45: #_0A39: mov A, Y
#_0CBC46: #_0A3A: mov.w Channel_Vibrato_LoopPoint+X, A
#_0CBC49: #_0A3D: bra .next_byte

; if byte is $81, then go to loop point
.not80
#_0CBC4B: #_0A3F: cmp A, #$81
#_0CBC4D: #_0A41: bne .not81

#_0CBC4F: #_0A43: mov.w A, Channel_Vibrato_LoopPoint+X
#_0CBC52: #_0A46: mov Y, A
#_0CBC53: #_0A47: bra .next_byte

.not81
; save the byte
#_0CBC55: #_0A49: push A

#_0CBC56: #_0A4A: mov.w A, Channel_PitchLow+X
#_0CBC59: #_0A4D: mov.b Scratch0A+0, A
#_0CBC5B: #_0A4F: mov.w A, Channel_PitchHigh+X
#_0CBC5E: #_0A52: mov.b Scratch0A+1, A

#_0CBC60: #_0A54: inc Y
#_0CBC61: #_0A55: mov A, Y
#_0CBC62: #_0A56: mov.w Channel_Vibrato_Counter+X, A

#_0CBC65: #_0A59: pop A
#_0CBC66: #_0A5A: cmp A, #$7F
#_0CBC68: #_0A5C: bcs .negative

.positive
#_0CBC6A: #_0A5E: mov Y, #$00
#_0CBC6C: #_0A60: bra .signextended

.negative
#_0CBC6E: #_0A62: mov Y, #$FF

.signextended
#_0CBC70: #_0A64: jmp HandlePitch_handleit

HandleMasterVolumeFade:
#_0CBC73: #_0A67: dec.b MVOL_Timer
#_0CBC75: #_0A69: beq .waitfortimer
#_0CBC77: #_0A6B: ret

.waitfortimer
#_0CBC78: #_0A6C: mov.b MVOL_Timer, MVOL_TimerLength

#_0CBC7B: #_0A6F: mov A, #!DSP_MVOL_L
#_0CBC7D: #_0A71: mov.w DSP.WriteAddr, A
#_0CBC80: #_0A74: mov.w A, DSP.WriteData

#_0CBC83: #_0A77: setc
#_0CBC84: #_0A78: sbc.b A, MVOL_Interval
#_0CBC86: #_0A7A: bmi .exit

#_0CBC88: #_0A7C: mov.w DSP.WriteData, A
#_0CBC8B: #_0A7F: mov Y, #!DSP_MVOL_R
#_0CBC8D: #_0A81: mov.w DSP.WriteAddr, Y
#_0CBC90: #_0A84: mov.w DSP.WriteData, A
#_0CBC93: #_0A87: ret

.exit
#_0CBC94: #_0A88: clr2.b FLAGS_B0
#_0CBC96: #_0A8A: call Reset_DSP
#_0CBC99: #_0A8D: ret

SongCommandFE_PrepareForTransfer:
#_0CBC9A: #_0A8E: call Reset_DSP
#_0CBC9D: #_0A91: mov A, #$EE
#_0CBC9F: #_0A93: mov.w DSP.Port1, A
#_0CBCA2: #_0A96: mov Y, #$20

.wait
#_0CBCA4: #_0A98: dbnz Y, .wait

#_0CBCA6: #_0A9A: mov.w A, DSP.Port0
#_0CBCA9: #_0A9D: mov.b ChannelOffset+0, A
#_0CBCAB: #_0A9F: mov.w A, DSP.Port1

#_0CBCAE: #_0AA2: mov X, A
#_0CBCAF: #_0AA3: and A, #$3F

#_0CBCB1: #_0AA5: mov.b ChannelOffset+1, A
#_0CBCB3: #_0AA7: mov A, X
#_0CBCB4: #_0AA8: asl A
#_0CBCB5: #_0AA9: bcc SongTransfer

#_0CBCB7: #_0AAB: jmp SamplesTransfer

SongTransfer:
#_0CBCBA: #_0AAE: asl A
#_0CBCBB: #_0AAF: bcs .pointersAt7000

.pointersAt7800
#_0CBCBD: #_0AB1: mov.b TrackRead+0, #ArbSong_7800>>0
#_0CBCC0: #_0AB4: mov.b TrackRead+1, #ArbSong_7800>>8
#_0CBCC3: #_0AB7: bra StartTransfer

.pointersAt7000
#_0CBCC5: #_0AB9: mov.b TrackRead+0, #ArbSong_7000>>0
#_0CBCC8: #_0ABC: mov.b TrackRead+1, #ArbSong_7000>>8

StartTransfer:
.next2Bytes
#_0CBCCB: #_0ABF: mov A, #$00
#_0CBCCD: #_0AC1: mov.b Scratch0A+0, A
#_0CBCCF: #_0AC3: mov.b Scratch0A+1, A
#_0CBCD1: #_0AC5: mov.w DSP.Port0, A
#_0CBCD4: #_0AC8: mov.w DSP.Port1, A
#_0CBCD7: #_0ACB: mov X, A

.syncBeforeWrite
#_0CBCD8: #_0ACC: mov.w A, DSP.Port0
#_0CBCDB: #_0ACF: mov.w Y, DSP.Port1
#_0CBCDE: #_0AD2: cmpw.b YA, Scratch0A
#_0CBCE0: #_0AD4: bne .syncBeforeWrite

#_0CBCE2: #_0AD6: mov.w A, DSP.Port2
#_0CBCE5: #_0AD9: mov.b (TrackRead+X), A
#_0CBCE7: #_0ADB: incw.b TrackRead

#_0CBCE9: #_0ADD: decw.b ChannelOffset
#_0CBCEB: #_0ADF: bne .continue
#_0CBCED: #_0AE1: inc.b ChannelOffset
#_0CBCEF: #_0AE3: bra .done

.continue
#_0CBCF1: #_0AE5: mov.w A, DSP.Port3
#_0CBCF4: #_0AE8: mov.b (TrackRead+X), A
#_0CBCF6: #_0AEA: incw.b TrackRead

.done
#_0CBCF8: #_0AEC: incw.b Scratch0A
#_0CBCFA: #_0AEE: mov.b A, Scratch0A+0
#_0CBCFC: #_0AF0: mov.w DSP.Port0, A

#_0CBCFF: #_0AF3: mov.b A, Scratch0A+1
#_0CBD01: #_0AF5: mov.w DSP.Port1, A

#_0CBD04: #_0AF8: decw.b ChannelOffset
#_0CBD06: #_0AFA: bne .syncBeforeWrite

.syncAgain
#_0CBD08: #_0AFC: mov.w A, DSP.Port0
#_0CBD0B: #_0AFF: mov.w Y, DSP.Port1
#_0CBD0E: #_0B02: movw.b Scratch0A, YA
#_0CBD10: #_0B04: incw.b Scratch0A
#_0CBD12: #_0B06: bne .resetsamplepointers

#_0CBD14: #_0B08: jmp SongCommandFE_PrepareForTransfer ; next one

.resetsamplepointers
#_0CBD17: #_0B0B: decw.b Scratch0A
#_0CBD19: #_0B0D: bne .syncAgain

#_0CBD1B: #_0B0F: mov A, #$33
#_0CBD1D: #_0B11: mov.w DSP.Control, A

#_0CBD20: #_0B14: mov A, #$00
#_0CBD22: #_0B16: mov.b ExecutionCounter, A

#_0CBD24: #_0B18: mov.w DSP.Port0, A
#_0CBD27: #_0B1B: mov.w DSP.Port1, A

#_0CBD2A: #_0B1E: mov.b SamplePointerWriteAddr, #SamplePointersArb>>0
#_0CBD2D: #_0B21: mov.b SamplePointerWriteAddr+1, #SamplePointersArb>>8

#_0CBD30: #_0B24: mov.b SampleDataWriteAddr, #Sample08>>0
#_0CBD33: #_0B27: mov.b SampleDataWriteAddr+1, #Sample08>>8
#_0CBD36: #_0B2A: ret

SamplesTransfer:
#_0CBD37: #_0B2B: mov Y, #$00
#_0CBD39: #_0B2D: mov.w A, DSP.Port2
#_0CBD3C: #_0B30: mov.b Scratch0A+0, A
#_0CBD3E: #_0B32: mov.w A, DSP.Port3
#_0CBD41: #_0B35: mov.b Scratch0A+1, A

#_0CBD43: #_0B37: mov.b A, SampleDataWriteAddr+0
#_0CBD45: #_0B39: mov.b (SamplePointerWriteAddr+X), A

#_0CBD47: #_0B3B: mov.b TrackRead+0, A
#_0CBD49: #_0B3D: incw.b SamplePointerWriteAddr

#_0CBD4B: #_0B3F: mov.b SampleLoopPoint+0, A
#_0CBD4D: #_0B41: mov.b A, SampleDataWriteAddr+1
#_0CBD4F: #_0B43: mov.b (SamplePointerWriteAddr+X), A

#_0CBD51: #_0B45: mov.b TrackRead+1, A
#_0CBD53: #_0B47: incw.b SamplePointerWriteAddr
#_0CBD55: #_0B49: mov.b SampleLoopPoint+1, A

#_0CBD57: #_0B4B: mov Y, A
#_0CBD58: #_0B4C: mov.b A, SampleLoopPoint+0

#_0CBD5A: #_0B4E: addw.b YA, Scratch0A
#_0CBD5C: #_0B50: mov.b (SamplePointerWriteAddr+X), A
#_0CBD5E: #_0B52: incw.b SamplePointerWriteAddr

#_0CBD60: #_0B54: mov A, Y
#_0CBD61: #_0B55: mov.b (SamplePointerWriteAddr+X), A
#_0CBD63: #_0B57: incw.b SamplePointerWriteAddr

#_0CBD65: #_0B59: movw.b YA, SampleLoopPoint
#_0CBD67: #_0B5B: addw.b YA, ChannelOffset

#_0CBD69: #_0B5D: mov.b SampleDataWriteAddr+0, A
#_0CBD6B: #_0B5F: mov.b SampleDataWriteAddr+1, Y
#_0CBD6D: #_0B61: jmp StartTransfer

Table_of_Pan:
#_0CBD70: #_0B64: db $00, $10, $20, $30, $40, $50, $60, $70
#_0CBD78: #_0B6C: db $80, $90, $A0, $B0, $C0, $D0, $E0, $F0
#_0CBD80: #_0B74: db $00, $01, $02, $03, $04, $05, $06, $07
#_0CBD88: #_0B7C: db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F

Channel_Bits_Table:
#_0CBD90: #_0B84: db $01, $02, $04, $08, $10, $20, $40, $80
#_0CBD98: #_0B8C: db $01, $02, $04, $08, $10, $20, $40, $80

Channel_Bits_NOT:
#_0CBDA0: #_0B94: db $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F
#_0CBDA8: #_0B9C: db $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F

NotePitches:
#_0CBDB0: #_0BA4: dw $0400
#_0CBDB2: #_0BA6: dw $043D
#_0CBDB4: #_0BA8: dw $047D
#_0CBDB6: #_0BAA: dw $04C2
#_0CBDB8: #_0BAC: dw $050A
#_0CBDBA: #_0BAE: dw $0557
#_0CBDBC: #_0BB0: dw $05A8
#_0CBDBE: #_0BB2: dw $05FE
#_0CBDC0: #_0BB4: dw $0659
#_0CBDC2: #_0BB6: dw $06BA
#_0CBDC4: #_0BB8: dw $0721
#_0CBDC6: #_0BBA: dw $078D

#_0CBDC8: #_0BBC: dw $0800
#_0CBDCA: #_0BBE: dw $087A
#_0CBDCC: #_0BC0: dw $08FB
#_0CBDCE: #_0BC2: dw $0983
#_0CBDD0: #_0BC4: dw $0A14
#_0CBDD2: #_0BC6: dw $0AAE
#_0CBDD4: #_0BC8: dw $0B50
#_0CBDD6: #_0BCA: dw $0BFD
#_0CBDD8: #_0BCC: dw $0CB3
#_0CBDDA: #_0BCE: dw $0D74
#_0CBDDC: #_0BD0: dw $0E41
#_0CBDDE: #_0BD2: dw $0F1A

#_0CBDE0: #_0BD4: dw $1000
#_0CBDE2: #_0BD6: dw $10F4
#_0CBDE4: #_0BD8: dw $11F6
#_0CBDE6: #_0BDA: dw $1307
#_0CBDE8: #_0BDC: dw $1429
#_0CBDEA: #_0BDE: dw $155C
#_0CBDEC: #_0BE0: dw $16A1
#_0CBDEE: #_0BE2: dw $17F9
#_0CBDF0: #_0BE4: dw $1966
#_0CBDF2: #_0BE6: dw $1AE9
#_0CBDF4: #_0BE8: dw $1C82
#_0CBDF6: #_0BEA: dw $1E34

#_0CBDF8: #_0BEC: dw $2000
#_0CBDFA: #_0BEE: dw $21E7
#_0CBDFC: #_0BF0: dw $23EB
#_0CBDFE: #_0BF2: dw $260E
#_0CBE00: #_0BF4: dw $2851
#_0CBE02: #_0BF6: dw $2AB7
#_0CBE04: #_0BF8: dw $2D41
#_0CBE06: #_0BFA: dw $2FF2
#_0CBE08: #_0BFC: dw $32CC
#_0CBE0A: #_0BFE: dw $35D1
#_0CBE0C: #_0C00: dw $3904
#_0CBE0E: #_0C02: dw $3C68

NoteLengths:
#_0CBE10: #_0C04: db $00
#_0CBE11: #_0C05: db $01
#_0CBE12: #_0C06: db $02
#_0CBE13: #_0C07: db $03
#_0CBE14: #_0C08: db $04
#_0CBE15: #_0C09: db $06
#_0CBE16: #_0C0A: db $08
#_0CBE17: #_0C0B: db $0C
#_0CBE18: #_0C0C: db $10
#_0CBE19: #_0C0D: db $18
#_0CBE1A: #_0C0E: db $20
#_0CBE1B: #_0C0F: db $30
#_0CBE1C: #_0C10: db $40
#_0CBE1D: #_0C11: db $60
#_0CBE1E: #_0C12: db $80
#_0CBE1F: #_0C13: db $C0

#_0CBE20: #_0C14: db $00
#_0CBE21: #_0C15: db $01
#_0CBE22: #_0C16: db $00
#_0CBE23: #_0C17: db $00
#_0CBE24: #_0C18: db $05
#_0CBE25: #_0C19: db $00
#_0CBE26: #_0C1A: db $0A
#_0CBE27: #_0C1B: db $0F
#_0CBE28: #_0C1C: db $14
#_0CBE29: #_0C1D: db $1E
#_0CBE2A: #_0C1E: db $28
#_0CBE2B: #_0C1F: db $3C
#_0CBE2C: #_0C20: db $50
#_0CBE2D: #_0C21: db $78
#_0CBE2E: #_0C22: db $A0
#_0CBE2F: #_0C23: db $F0

#_0CBE30: #_0C24: db $00
#_0CBE31: #_0C25: db $01
#_0CBE32: #_0C26: db $00
#_0CBE33: #_0C27: db $00
#_0CBE34: #_0C28: db $06
#_0CBE35: #_0C29: db $09
#_0CBE36: #_0C2A: db $0C
#_0CBE37: #_0C2B: db $12
#_0CBE38: #_0C2C: db $18
#_0CBE39: #_0C2D: db $24
#_0CBE3A: #_0C2E: db $30
#_0CBE3B: #_0C2F: db $48
#_0CBE3C: #_0C30: db $60
#_0CBE3D: #_0C31: db $90
#_0CBE3E: #_0C32: db $C0
#_0CBE3F: #_0C33: db $00
#_0CBE40: #_0C34: db $00

#_0CBE41: #_0C35: db $01
#_0CBE42: #_0C36: db $03
#_0CBE43: #_0C37: db $04
#_0CBE44: #_0C38: db $07
#_0CBE45: #_0C39: db $0A
#_0CBE46: #_0C3A: db $0E
#_0CBE47: #_0C3B: db $15
#_0CBE48: #_0C3C: db $1C
#_0CBE49: #_0C3D: db $2A
#_0CBE4A: #_0C3E: db $38
#_0CBE4B: #_0C3F: db $54
#_0CBE4C: #_0C40: db $70
#_0CBE4D: #_0C41: db $A8
#_0CBE4E: #_0C42: db $E0
#_0CBE4F: #_0C43: db $00

VibratoPointers:
#_0CBE50: #_0C44: dw .long
#_0CBE52: #_0C46: dw .short_medium
#_0CBE54: #_0C48: dw .short_small
#_0CBE56: #_0C4A: dw .veryshort_A
#_0CBE58: #_0C4C: dw .veryshort_B
#_0CBE5A: #_0C4E: dw .veryshort_C
#_0CBE5C: #_0C50: dw .veryshort_D
#_0CBE5E: #_0C52: dw .veryshort_E
#_0CBE60: #_0C54: dw .veryshort_F
#_0CBE62: #_0C56: dw .veryshort_G
#_0CBE64: #_0C58: dw .veryshort_H
#_0CBE66: #_0C5A: dw .veryshort_I

.long
#_0CBE68: #_0C5C: db +2, +2
#_0CBE6A: #_0C5E: db -2, -2
#_0CBE6C: #_0C60: db -2, -2
#_0CBE6E: #_0C62: db +2, +2

#_0CBE70: #_0C64: db +4, +4
#_0CBE72: #_0C66: db -4, -4
#_0CBE74: #_0C68: db -4, -4
#_0CBE76: #_0C6A: db +4, +4

#_0CBE78: #_0C6C: db +6, +6
#_0CBE7A: #_0C6E: db -6, -6
#_0CBE7C: #_0C70: db -6, -6
#_0CBE7E: #_0C72: db +6, +6

#_0CBE80: #_0C74: db +8, +8
#_0CBE82: #_0C76: db -8, -8
#_0CBE84: #_0C78: db -8, -8
#_0CBE86: #_0C7A: db +8, +8

#_0CBE88: #_0C7C: db +10, +10
#_0CBE8A: #_0C7E: db -10, -10
#_0CBE8C: #_0C80: db -10, -10
#_0CBE8E: #_0C82: db +10, +10

#_0CBE90: #_0C84: db +12, +12
#_0CBE92: #_0C86: db -12, -12
#_0CBE94: #_0C88: db -12, -12
#_0CBE96: #_0C8A: db +12, +12

#_0CBE98: #_0C8C: db +14, +14
#_0CBE9A: #_0C8E: db -14, -14
#_0CBE9C: #_0C90: db -14, -14
#_0CBE9E: #_0C92: db +14, +14

#_0CBEA0: #_0C94: db +16, +16
#_0CBEA2: #_0C96: db -16, -16
#_0CBEA4: #_0C98: db -16, -16
#_0CBEA6: #_0C9A: db +16, +16

#_0CBEA8: #_0C9C: db +18, +18
#_0CBEAA: #_0C9E: db -18, -18
#_0CBEAC: #_0CA0: db -18, -18
#_0CBEAE: #_0CA2: db +18, +18

#_0CBEB0: #_0CA4: db +20, +20
#_0CBEB2: #_0CA6: db -20, -20
#_0CBEB4: #_0CA8: db -20, -20
#_0CBEB6: #_0CAA: db +20, +20

#_0CBEB8: #_0CAC: db +22, +22
#_0CBEBA: #_0CAE: db -22, -22
#_0CBEBC: #_0CB0: db -22, -22
#_0CBEBE: #_0CB2: db +22, +22

#_0CBEC0: #_0CB4: db +24, +24
#_0CBEC2: #_0CB6: db -24, -24
#_0CBEC4: #_0CB8: db -24, -24
#_0CBEC6: #_0CBA: db +24, +24

#_0CBEC8: #_0CBC: db +26, +26
#_0CBECA: #_0CBE: db -26, -26
#_0CBECC: #_0CC0: db -26, -26
#_0CBECE: #_0CC2: db +26, +26

#_0CBED0: #_0CC4: db +28, +28
#_0CBED2: #_0CC6: db -28, -28
#_0CBED4: #_0CC8: db -28, -28
#_0CBED6: #_0CCA: db +28, +28

#_0CBED8: #_0CCC: db +30, +30
#_0CBEDA: #_0CCE: db -30, -30
#_0CBEDC: #_0CD0: db -30, -30
#_0CBEDE: #_0CD2: db +30, +30

#_0CBEE0: #_0CD4: db +32, +32
#_0CBEE2: #_0CD6: db -16, -16 ; weird mistake by devs?
#_0CBEE4: #_0CD8: db -16, -16
#_0CBEE6: #_0CDA: db +32, +32

#_0CBEE8: #_0CDC: db +34, +34
#_0CBEEA: #_0CDE: db -34, -34
#_0CBEEC: #_0CE0: db -34, -34
#_0CBEEE: #_0CE2: db +34, +34

#_0CBEF0: #_0CE4: db +36, +36
#_0CBEF2: #_0CE6: db -36, -36
#_0CBEF4: #_0CE8: db -36, -36
#_0CBEF6: #_0CEA: db +36, +36

#_0CBEF8: #_0CEC: db +38, +38
#_0CBEFA: #_0CEE: db -38, -38
#_0CBEFC: #_0CF0: db -38, -38
#_0CBEFE: #_0CF2: db +38, +38

#_0CBF00: #_0CF4: db +40, +40
#_0CBF02: #_0CF6: db -40, -40
#_0CBF04: #_0CF8: db -40, -40
#_0CBF06: #_0CFA: db +40, +40

#_0CBF08: #_0CFC: db +42, +42
#_0CBF0A: #_0CFE: db -42, -42
#_0CBF0C: #_0D00: db -42, -42
#_0CBF0E: #_0D02: db +42, +42

#_0CBF10: #_0D04: db +44, +44
#_0CBF12: #_0D06: db -44, -44
#_0CBF14: #_0D08: db -44, -44
#_0CBF16: #_0D0A: db +44, +44

#_0CBF18: #_0D0C: db +46, +46
#_0CBF1A: #_0D0E: db -46, -46
#_0CBF1C: #_0D10: db -46, -46
#_0CBF1E: #_0D12: db +46, +46

#_0CBF20: #_0D14: db !PITCH_SHIFT_LOOP_POINT
#_0CBF21: #_0D15: db +48, +48
#_0CBF23: #_0D17: db -48, -48
#_0CBF25: #_0D19: db -48, -48
#_0CBF27: #_0D1B: db +48, +48
#_0CBF29: #_0D1D: db !PITCH_SHIFT_DO_LOOP

.short_medium
#_0CBF2A: #_0D1E: db !PITCH_SHIFT_LOOP_POINT
#_0CBF2B: #_0D1F: db +20, +20
#_0CBF2D: #_0D21: db -20, -20
#_0CBF2F: #_0D23: db -20, -20
#_0CBF31: #_0D25: db +20, +20
#_0CBF33: #_0D27: db !PITCH_SHIFT_DO_LOOP

.short_small
#_0CBF34: #_0D28: db !PITCH_SHIFT_LOOP_POINT
#_0CBF35: #_0D29: db +16, +16
#_0CBF37: #_0D2B: db -16, -16
#_0CBF39: #_0D2D: db -16, -16
#_0CBF3B: #_0D2F: db +16, +16
#_0CBF3D: #_0D31: db !PITCH_SHIFT_DO_LOOP

.veryshort_A
#_0CBF3E: #_0D32: db !PITCH_SHIFT_LOOP_POINT
#_0CBF3F: #_0D33: db +64, +64
#_0CBF41: #_0D35: db -64, -64
#_0CBF43: #_0D37: db !PITCH_SHIFT_DO_LOOP

.veryshort_B
#_0CBF44: #_0D38: db !PITCH_SHIFT_LOOP_POINT
#_0CBF45: #_0D39: db +64, +64
#_0CBF47: #_0D3B: db -64, -64
#_0CBF49: #_0D3D: db !PITCH_SHIFT_DO_LOOP

.veryshort_C
#_0CBF4A: #_0D3E: db !PITCH_SHIFT_LOOP_POINT
#_0CBF4B: #_0D3F: db +64, +64
#_0CBF4D: #_0D41: db -64, -64
#_0CBF4F: #_0D43: db !PITCH_SHIFT_DO_LOOP

.veryshort_D
#_0CBF50: #_0D44: db !PITCH_SHIFT_LOOP_POINT
#_0CBF51: #_0D45: db +64, +64
#_0CBF53: #_0D47: db -64, -64
#_0CBF55: #_0D49: db !PITCH_SHIFT_DO_LOOP

.veryshort_E
#_0CBF56: #_0D4A: db !PITCH_SHIFT_LOOP_POINT
#_0CBF57: #_0D4B: db +64, +64
#_0CBF59: #_0D4D: db -64, -64
#_0CBF5B: #_0D4F: db !PITCH_SHIFT_DO_LOOP

.veryshort_F
#_0CBF5C: #_0D50: db !PITCH_SHIFT_LOOP_POINT
#_0CBF5D: #_0D51: db +64, +64
#_0CBF5F: #_0D53: db -64, -64
#_0CBF61: #_0D55: db !PITCH_SHIFT_DO_LOOP

.veryshort_G
#_0CBF62: #_0D56: db !PITCH_SHIFT_LOOP_POINT
#_0CBF63: #_0D57: db +64, +64
#_0CBF65: #_0D59: db -64, -64
#_0CBF67: #_0D5B: db !PITCH_SHIFT_DO_LOOP

.veryshort_H
#_0CBF68: #_0D5C: db !PITCH_SHIFT_LOOP_POINT
#_0CBF69: #_0D5D: db -64, -64
#_0CBF6B: #_0D5F: db +64, +64
#_0CBF6D: #_0D61: db !PITCH_SHIFT_DO_LOOP

.veryshort_I
#_0CBF6E: #_0D62: db !PITCH_SHIFT_LOOP_POINT
#_0CBF6F: #_0D63: db -64, -64
#_0CBF71: #_0D65: db +64, +64
#_0CBF73: #_0D67: db !PITCH_SHIFT_DO_LOOP

SongSFXPointers:
#_0CBF74: #_0D68: dw SFX_00_Nothing
#_0CBF76: #_0D6A: dw SFX_01
#_0CBF78: #_0D6C: dw SFX_02
#_0CBF7A: #_0D6E: dw SFX_03
#_0CBF7C: #_0D70: dw SFX_04
#_0CBF7E: #_0D72: dw SFX_05
#_0CBF80: #_0D74: dw SFX_06
#_0CBF82: #_0D76: dw SFX_07
#_0CBF84: #_0D78: dw SFX_08
#_0CBF86: #_0D7A: dw SFX_09
#_0CBF88: #_0D7C: dw SFX_0A
#_0CBF8A: #_0D7E: dw SFX_0B
#_0CBF8C: #_0D80: dw SFX_0C
#_0CBF8E: #_0D82: dw SFX_0D
#_0CBF90: #_0D84: dw SFX_0E
#_0CBF92: #_0D86: dw SFX_0F
#_0CBF94: #_0D88: dw SFX_10
#_0CBF96: #_0D8A: dw SFX_11
#_0CBF98: #_0D8C: dw SFX_12
#_0CBF9A: #_0D8E: dw SFX_13
#_0CBF9C: #_0D90: dw SFX_14
#_0CBF9E: #_0D92: dw SFX_15
#_0CBFA0: #_0D94: dw SFX_16
#_0CBFA2: #_0D96: dw SFX_17
#_0CBFA4: #_0D98: dw SFX_18
#_0CBFA6: #_0D9A: dw SFX_19
#_0CBFA8: #_0D9C: dw SFX_1A
#_0CBFAA: #_0D9E: dw SFX_1B
#_0CBFAC: #_0DA0: dw SFX_1C
#_0CBFAE: #_0DA2: dw SFX_1D
#_0CBFB0: #_0DA4: dw SFX_1E
#_0CBFB2: #_0DA6: dw SFX_1F
#_0CBFB4: #_0DA8: dw SFX_20
#_0CBFB6: #_0DAA: dw SFX_21
#_0CBFB8: #_0DAC: dw SFX_22
#_0CBFBA: #_0DAE: dw SFX_23
#_0CBFBC: #_0DB0: dw SFX_24_Silence
#_0CBFBE: #_0DB2: dw SFX_25_Silence
#_0CBFC0: #_0DB4: dw SFX_26_Silence
#_0CBFC2: #_0DB6: dw SFX_27_Nothing
#_0CBFC4: #_0DB8: dw SFX_28_Nothing
#_0CBFC6: #_0DBA: dw SFX_29_Nothing
#_0CBFC8: #_0DBC: dw SFX_2A
#_0CBFCA: #_0DBE: dw SFX_2B
#_0CBFCC: #_0DC0: dw SFX_2C
#_0CBFCE: #_0DC2: dw SFX_2D
#_0CBFD0: #_0DC4: dw SFX_2E
#_0CBFD2: #_0DC6: dw SFX_2F
#_0CBFD4: #_0DC8: dw SFX_30
#_0CBFD6: #_0DCA: dw SFX_31
#_0CBFD8: #_0DCC: dw SFX_32
#_0CBFDA: #_0DCE: dw SFX_33
#_0CBFDC: #_0DD0: dw SFX_34
#_0CBFDE: #_0DD2: dw SFX_35
#_0CBFE0: #_0DD4: dw SFX_36_Nothing
#_0CBFE2: #_0DD6: dw SFX_37_Nothing
#_0CBFE4: #_0DD8: dw Song_38_DemonAppears
#_0CBFE6: #_0DDA: dw Song_39_DemonAppears
#_0CBFE8: #_0DDC: dw Song_3A_DemonAppears
#_0CBFEA: #_0DDE: dw Song_3B_DemonAppears
#_0CBFEC: #_0DE0: dw Song_3C_Battle
#_0CBFEE: #_0DE2: dw Song_3D_LevelUp
#_0CBFF0: #_0DE4: dw Song_3E_Nothing
#_0CBFF2: #_0DE6: dw Song_3F_DemonAppears
#_0CBFF4: #_0DE8: dw ArbSong_7000 ; 40
#_0CBFF6: #_0DEA: dw Song_41_Nothing
#_0CBFF8: #_0DEC: dw Song_42_DemonAppears
#_0CBFFA: #_0DEE: dw Song_43_DemonAppears
#_0CBFFC: #_0DF0: dw ArbSong_7800 ; 44 - "Jakyou"
#_0CBFFE: #_0DF2: dw ArbSong_7800 ; 45 - "Law"
#_0CC000: #_0DF4: dw ArbSong_7800 ; 46 - "Chaos"
#_0CC002: #_0DF6: dw ArbSong_7800 ; 47 - "Neutral"
#_0CC004: #_0DF8: dw ArbSong_7800 ; 48 - "Ginza"
#_0CC006: #_0DFA: dw ArbSong_7800 ; 49 - "Cathedral"
#_0CC008: #_0DFC: dw ArbSong_7800 ; 4A - "Shibuya"
#_0CC00A: #_0DFE: dw ArbSong_7800 ; 4B - "Shitenou's Lair"
#_0CC00C: #_0E00: dw ArbSong_7800 ; 4C - "Embassy"
#_0CC00E: #_0E02: dw ArbSong_7800 ; 4D - "Arcade"
#_0CC010: #_0E04: dw ArbSong_7800 ; 4E - "Kichijoi"
#_0CC012: #_0E06: dw ArbSong_7800 ; 4F - "Ruins"
#_0CC014: #_0E08: dw ArbSong_7800 ; 50 - "Shop"
#_0CC016: #_0E0A: dw ArbSong_7800 ; 51 - "Boss Battle"
#_0CC018: #_0E0C: dw ArbSong_7800 ; 52 - "Dream"
#_0CC01A: #_0E0E: dw ArbSong_7800 ; 53 - "Home"
#_0CC01C: #_0E10: dw ArbSong_7800 ; 54 - "Pascal's Theme"
#_0CC01E: #_0E12: dw ArbSong_7800 ; 55 - Unused song
#_0CC020: #_0E14: dw ArbSong_7800 ; 56 - "Game Over"
#_0CC022: #_0E16: dw ArbSong_7800 ; 57 - "Terminal"
#_0CC024: #_0E18: dw ArbSong_7800 ; 58 - "Epilogue"
#_0CC026: #_0E1A: dw ArbSong_7800 ; 59 - "Ginza"
#_0CC028: #_0E1C: dw ArbSong_7800 ; 5A - "Ginza"
#_0CC02A: #_0E1E: dw ArbSong_7800 ; 5B - "Ginza"
#_0CC02C: #_0E20: dw ArbSong_7800 ; 5C - "Ginza"
#_0CC02E: #_0E22: dw ArbSong_7800 ; 5D - "Title" - opening
#_0CC030: #_0E24: dw ArbSong_7800 ; 5E - Title screen
#_0CC032: #_0E26: dw ArbSong_7000 ; 5F - "Ending"
#_0CC034: #_0E28: dw $0000 ; 60
#_0CC036: #_0E2A: dw Song_61_Battle

;===================================================================================================
; HEADER FORMAT
;------------------------------------------------------------------------------
; db $0b   - channel A bit
; dw $aaaa - channel A data
; ...
; db $0b   - channel X bit
; dw $aaaa - channel X data
;
; db $FF   - no more channels
;
; db $xx   - xx >= $80 indicates a command
;===================================================================================================
SFX_Nothing:
SFX_00_Nothing:
SFX_27_Nothing:
SFX_28_Nothing:
SFX_29_Nothing:
SFX_36_Nothing:
SFX_37_Nothing:
Song_3E_Nothing:
Song_41_Nothing:
#_0CC038: #_0E2C: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_01:
#_0CC039: #_0E2D: db !SFX_CHANNEL_5 : dw SFX_01_SEGMENT_0E31
#_0CC03C: #_0E30: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_01_SEGMENT_0E31:
#_0CC03D: #_0E31: db $70 ; vol 0x10
#_0CC03E: #_0E32: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC041: #_0E35: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC043: #_0E37: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC045: #_0E39: db $82 ; dur 0x02
#_0CC046: #_0E3A: db C5
#_0CC047: #_0E3B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_02:
#_0CC048: #_0E3C: db !SFX_CHANNEL_4 : dw SFX_02_SEGMENT_0E4A
#_0CC04B: #_0E3F: db !SFX_CHANNEL_5 : dw SFX_02_SEGMENT_0E43
#_0CC04E: #_0E42: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_02_SEGMENT_0E43:
#_0CC04F: #_0E43: db $84 ; dur 0x04
#_0CC050: #_0E44: db R
#_0CC051: #_0E45: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC053: #_0E47: db !TRACKCOMMAND_F8_Goto_X : dw SFX_02_SEGMENT_0E4C

SFX_02_SEGMENT_0E4A:
#_0CC056: #_0E4A: db !TRACKCOMMAND_F2_SetPan, $40

SFX_02_SEGMENT_0E4C:
#_0CC058: #_0E4C: db $70 ; vol 0x10
#_0CC059: #_0E4D: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC05C: #_0E50: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC05E: #_0E52: db $83 ; dur 0x03
#_0CC05F: #_0E53: db C5
#_0CC060: #_0E54: db E5
#_0CC061: #_0E55: db G5
#_0CC062: #_0E56: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_03:
#_0CC063: #_0E57: db !SFX_CHANNEL_4 : dw SFX_03_SEGMENT_0E65
#_0CC066: #_0E5A: db !SFX_CHANNEL_5 : dw SFX_03_SEGMENT_0E5E
#_0CC069: #_0E5D: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_03_SEGMENT_0E5E:
#_0CC06A: #_0E5E: db $84 ; dur 0x04
#_0CC06B: #_0E5F: db R
#_0CC06C: #_0E60: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC06E: #_0E62: db !TRACKCOMMAND_F8_Goto_X : dw SFX_03_SEGMENT_0E67

SFX_03_SEGMENT_0E65:
#_0CC071: #_0E65: db !TRACKCOMMAND_F2_SetPan, $40

SFX_03_SEGMENT_0E67:
#_0CC073: #_0E67: db $70 ; vol 0x10
#_0CC074: #_0E68: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC077: #_0E6B: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC079: #_0E6D: db $83 ; dur 0x03
#_0CC07A: #_0E6E: db G5
#_0CC07B: #_0E6F: db D5
#_0CC07C: #_0E70: db B4
#_0CC07D: #_0E71: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_04:
#_0CC07E: #_0E72: db !SFX_CHANNEL_5 : dw SFX_04_SEGMENT_0E76
#_0CC081: #_0E75: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_04_SEGMENT_0E76:
#_0CC082: #_0E76: db $70 ; vol 0x10
#_0CC083: #_0E77: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC086: #_0E7A: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC088: #_0E7C: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC08A: #_0E7E: db $84 ; dur 0x04
#_0CC08B: #_0E7F: db Fs4
#_0CC08C: #_0E80: db R
#_0CC08D: #_0E81: db Fs4
#_0CC08E: #_0E82: db R
#_0CC08F: #_0E83: db Fs4
#_0CC090: #_0E84: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_05:
#_0CC091: #_0E85: db !SFX_CHANNEL_4 : dw SFX_05_SEGMENT_0E95
#_0CC094: #_0E88: db !SFX_CHANNEL_5 : dw SFX_05_SEGMENT_0E8C
#_0CC097: #_0E8B: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_05_SEGMENT_0E8C:
#_0CC098: #_0E8C: db $84 ; dur 0x04
#_0CC099: #_0E8D: db R
#_0CC09A: #_0E8E: db !TRACKCOMMAND_F9_FineTune, $10
#_0CC09C: #_0E90: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC09E: #_0E92: db !TRACKCOMMAND_F8_Goto_X : dw SFX_05_SEGMENT_0E97

SFX_05_SEGMENT_0E95:
#_0CC0A1: #_0E95: db !TRACKCOMMAND_F2_SetPan, $40

SFX_05_SEGMENT_0E97:
#_0CC0A3: #_0E97: db $70 ; vol 0x10
#_0CC0A4: #_0E98: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC0A7: #_0E9B: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC0A9: #_0E9D: db $82 ; dur 0x02
#_0CC0AA: #_0E9E: db D4
#_0CC0AB: #_0E9F: db $86 ; dur 0x06
#_0CC0AC: #_0EA0: db R
#_0CC0AD: #_0EA1: db $83 ; dur 0x03
#_0CC0AE: #_0EA2: db C5
#_0CC0AF: #_0EA3: db R
#_0CC0B0: #_0EA4: db D4
#_0CC0B1: #_0EA5: db R
#_0CC0B2: #_0EA6: db A4
#_0CC0B3: #_0EA7: db R
#_0CC0B4: #_0EA8: db B4
#_0CC0B5: #_0EA9: db As4
#_0CC0B6: #_0EAA: db R
#_0CC0B7: #_0EAB: db C5
#_0CC0B8: #_0EAC: db R
#_0CC0B9: #_0EAD: db G4
#_0CC0BA: #_0EAE: db R
#_0CC0BB: #_0EAF: db A4
#_0CC0BC: #_0EB0: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_06:
#_0CC0BD: #_0EB1: db !SFX_CHANNEL_5 : dw SFX_06_SEGMENT_0EB5
#_0CC0C0: #_0EB4: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_06_SEGMENT_0EB5:
#_0CC0C1: #_0EB5: db $70 ; vol 0x10
#_0CC0C2: #_0EB6: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC0C5: #_0EB9: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC0C7: #_0EBB: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC0C9: #_0EBD: db $82 ; dur 0x02
#_0CC0CA: #_0EBE: db A3
#_0CC0CB: #_0EBF: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_07:
#_0CC0CC: #_0EC0: db !SFX_CHANNEL_5 : dw SFX_07_SEGMENT_0EC4
#_0CC0CF: #_0EC3: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_07_SEGMENT_0EC4:
#_0CC0D0: #_0EC4: db $70 ; vol 0x10
#_0CC0D1: #_0EC5: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC0D4: #_0EC8: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC0D6: #_0ECA: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC0D8: #_0ECC: db !TRACKCOMMAND_F3_Transpose, -6
#_0CC0DA: #_0ECE: db !TRACKCOMMAND_E3_PitchBend, $E0
#_0CC0DC: #_0ED0: db !TRACKCOMMAND_F4_SetLoop_B, $08
#_0CC0DE: #_0ED2: db $82 ; dur 0x02
#_0CC0DF: #_0ED3: db C3
#_0CC0E0: #_0ED4: db $83 ; dur 0x03
#_0CC0E1: #_0ED5: db R
#_0CC0E2: #_0ED6: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC0E3: #_0ED7: db $82 ; dur 0x02
#_0CC0E4: #_0ED8: db Cs3
#_0CC0E5: #_0ED9: db R
#_0CC0E6: #_0EDA: db D3
#_0CC0E7: #_0EDB: db R
#_0CC0E8: #_0EDC: db Ds3
#_0CC0E9: #_0EDD: db R
#_0CC0EA: #_0EDE: db E3
#_0CC0EB: #_0EDF: db R
#_0CC0EC: #_0EE0: db F3
#_0CC0ED: #_0EE1: db R
#_0CC0EE: #_0EE2: db Fs3
#_0CC0EF: #_0EE3: db R
#_0CC0F0: #_0EE4: db G3
#_0CC0F1: #_0EE5: db R
#_0CC0F2: #_0EE6: db Gs3
#_0CC0F3: #_0EE7: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_08:
#_0CC0F4: #_0EE8: db !SFX_CHANNEL_5 : dw SFX_08_SEGMENT_0EEC
#_0CC0F7: #_0EEB: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_08_SEGMENT_0EEC:
#_0CC0F8: #_0EEC: db $70 ; vol 0x10
#_0CC0F9: #_0EED: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC0FC: #_0EF0: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC0FE: #_0EF2: db !TRACKCOMMAND_F2_SetPan, $6F
#_0CC100: #_0EF4: db $81 ; dur 0x01
#_0CC101: #_0EF5: db $5E ; Noise 0x1E
#_0CC102: #_0EF6: db $5C ; Noise 0x1C
#_0CC103: #_0EF7: db $5A ; Noise 0x1A
#_0CC104: #_0EF8: db $8A ; dur 0x0A
#_0CC105: #_0EF9: db $5E ; Noise 0x1E
#_0CC106: #_0EFA: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_09:
#_0CC107: #_0EFB: db !SFX_CHANNEL_5 : dw SFX_09_SEGMENT_0EFF
#_0CC10A: #_0EFE: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_09_SEGMENT_0EFF:
#_0CC10B: #_0EFF: db $70 ; vol 0x10
#_0CC10C: #_0F00: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC10F: #_0F03: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC111: #_0F05: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC113: #_0F07: db !TRACKCOMMAND_F4_SetLoop_B, $03
#_0CC115: #_0F09: db $81 ; dur 0x01
#_0CC116: #_0F0A: db $52 ; Noise 0x12
#_0CC117: #_0F0B: db $54 ; Noise 0x14
#_0CC118: #_0F0C: db $55 ; Noise 0x15
#_0CC119: #_0F0D: db $53 ; Noise 0x13
#_0CC11A: #_0F0E: db $84 ; dur 0x04
#_0CC11B: #_0F0F: db R
#_0CC11C: #_0F10: db R
#_0CC11D: #_0F11: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC11E: #_0F12: db $81 ; dur 0x01
#_0CC11F: #_0F13: db $52 ; Noise 0x12
#_0CC120: #_0F14: db $54 ; Noise 0x14
#_0CC121: #_0F15: db $55 ; Noise 0x15
#_0CC122: #_0F16: db $53 ; Noise 0x13
#_0CC123: #_0F17: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_0A:
#_0CC124: #_0F18: db !SFX_CHANNEL_4 : dw SFX_0A_SEGMENT_0F1F
#_0CC127: #_0F1B: db !SFX_CHANNEL_5 : dw SFX_0A_SEGMENT_0F2C
#_0CC12A: #_0F1E: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0A_SEGMENT_0F1F:
#_0CC12B: #_0F1F: db $70 ; vol 0x10
#_0CC12C: #_0F20: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC12F: #_0F23: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC131: #_0F25: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC133: #_0F27: db $82 ; dur 0x02
#_0CC134: #_0F28: db D4
#_0CC135: #_0F29: db C4
#_0CC136: #_0F2A: db As3
#_0CC137: #_0F2B: db !TRACKCOMMAND_FF_EndTrack

SFX_0A_SEGMENT_0F2C:
#_0CC138: #_0F2C: db $70 ; vol 0x10
#_0CC139: #_0F2D: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC13C: #_0F30: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC13E: #_0F32: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC140: #_0F34: db $81 ; dur 0x01
#_0CC141: #_0F35: db $54 ; Noise 0x14
#_0CC142: #_0F36: db $50 ; Noise 0x10
#_0CC143: #_0F37: db $4C ; Noise 0x0C
#_0CC144: #_0F38: db $54 ; Noise 0x14
#_0CC145: #_0F39: db $50 ; Noise 0x10
#_0CC146: #_0F3A: db $4C ; Noise 0x0C
#_0CC147: #_0F3B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_0B:
#_0CC148: #_0F3C: db !SFX_CHANNEL_4 : dw SFX_0B_SEGMENT_0F43
#_0CC14B: #_0F3F: db !SFX_CHANNEL_5 : dw SFX_0B_SEGMENT_0F45
#_0CC14E: #_0F42: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0B_SEGMENT_0F43:
#_0CC14F: #_0F43: db !TRACKCOMMAND_F9_FineTune, $20

SFX_0B_SEGMENT_0F45:
#_0CC151: #_0F45: db !TRACKCOMMAND_F2_SetPan, $48
#_0CC153: #_0F47: db $70 ; vol 0x10
#_0CC154: #_0F48: db !TRACKCOMMAND_F0_SetADSR, $FF, $E8
#_0CC157: #_0F4B: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC159: #_0F4D: db !TRACKCOMMAND_E3_PitchBend, $F0
#_0CC15B: #_0F4F: db $8E ; dur 0x0E
#_0CC15C: #_0F50: db C4
#_0CC15D: #_0F51: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_0C:
#_0CC15E: #_0F52: db !SFX_CHANNEL_4 : dw SFX_0C_SEGMENT_0F59
#_0CC161: #_0F55: db !SFX_CHANNEL_5 : dw SFX_0C_SEGMENT_0F5F
#_0CC164: #_0F58: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0C_SEGMENT_0F59:
#_0CC165: #_0F59: db $74 ; vol 0x14
#_0CC166: #_0F5A: db !TRACKCOMMAND_F9_FineTune, $10
#_0CC168: #_0F5C: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0C_SEGMENT_0F60

SFX_0C_SEGMENT_0F5F:
#_0CC16B: #_0F5F: db $64 ; vol 0x04

SFX_0C_SEGMENT_0F60:
#_0CC16C: #_0F60: db !TRACKCOMMAND_F0_SetADSR, $FF, $E8
#_0CC16F: #_0F63: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC171: #_0F65: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC173: #_0F67: db !TRACKCOMMAND_E3_PitchBend, $04
#_0CC175: #_0F69: db $8E ; dur 0x0E
#_0CC176: #_0F6A: db C3
#_0CC177: #_0F6B: db TIE
#_0CC178: #_0F6C: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_0D:
#_0CC179: #_0F6D: db !MUS_CHANNEL_0 : dw SFX_0D_SEGMENT_0F86
#_0CC17C: #_0F70: db !MUS_CHANNEL_1 : dw SFX_0D_SEGMENT_0F98
#_0CC17F: #_0F73: db !MUS_CHANNEL_2 : dw SFX_0D_SEGMENT_0F9E
#_0CC182: #_0F76: db !MUS_CHANNEL_3 : dw SFX_0D_SEGMENT_0FA4
#_0CC185: #_0F79: db !MUS_CHANNEL_4 : dw SFX_0D_SEGMENT_0FAC
#_0CC188: #_0F7C: db !MUS_CHANNEL_5 : dw SFX_0D_SEGMENT_0FB4
#_0CC18B: #_0F7F: db !MUS_CHANNEL_6 : dw SFX_0D_SEGMENT_0FBE
#_0CC18E: #_0F82: db !MUS_CHANNEL_7 : dw SFX_0D_SEGMENT_0FC4
#_0CC191: #_0F85: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0D_SEGMENT_0F86:
#_0CC192: #_0F86: db $74 ; vol 0x14

SFX_0D_SEGMENT_0F87:
#_0CC193: #_0F87: db !TRACKCOMMAND_F2_SetPan, $60

SFX_0D_SEGMENT_0F89:
#_0CC195: #_0F89: db !TRACKCOMMAND_F0_SetADSR, $E0, $FF
#_0CC198: #_0F8C: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC19A: #_0F8E: db $8E ; dur 0x0E
#_0CC19B: #_0F8F: db G2
#_0CC19C: #_0F90: db TIE
#_0CC19D: #_0F91: db TIE
#_0CC19E: #_0F92: db TIE
#_0CC19F: #_0F93: db TIE
#_0CC1A0: #_0F94: db TIE
#_0CC1A1: #_0F95: db TIE
#_0CC1A2: #_0F96: db TIE
#_0CC1A3: #_0F97: db !TRACKCOMMAND_FF_EndTrack

SFX_0D_SEGMENT_0F98:
#_0CC1A4: #_0F98: db $64 ; vol 0x04
#_0CC1A5: #_0F99: db !TRACKCOMMAND_F9_FineTune, $10
#_0CC1A7: #_0F9B: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F87

SFX_0D_SEGMENT_0F9E:
#_0CC1AA: #_0F9E: db $73 ; vol 0x13
#_0CC1AB: #_0F9F: db !TRACKCOMMAND_F3_Transpose, 6
#_0CC1AD: #_0FA1: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F87

SFX_0D_SEGMENT_0FA4:
#_0CC1B0: #_0FA4: db $63 ; vol 0x03
#_0CC1B1: #_0FA5: db !TRACKCOMMAND_F3_Transpose, 6
#_0CC1B3: #_0FA7: db !TRACKCOMMAND_F9_FineTune, $10
#_0CC1B5: #_0FA9: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F87

SFX_0D_SEGMENT_0FAC:
#_0CC1B8: #_0FAC: db $72 ; vol 0x12
#_0CC1B9: #_0FAD: db !TRACKCOMMAND_F2_SetPan, $64
#_0CC1BB: #_0FAF: db !TRACKCOMMAND_F3_Transpose, 15
#_0CC1BD: #_0FB1: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F89

SFX_0D_SEGMENT_0FB4:
#_0CC1C0: #_0FB4: db $62 ; vol 0x02
#_0CC1C1: #_0FB5: db !TRACKCOMMAND_F2_SetPan, $64
#_0CC1C3: #_0FB7: db !TRACKCOMMAND_F3_Transpose, 15
#_0CC1C5: #_0FB9: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC1C7: #_0FBB: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F89

SFX_0D_SEGMENT_0FBE:
#_0CC1CA: #_0FBE: db $70 ; vol 0x10
#_0CC1CB: #_0FBF: db !TRACKCOMMAND_F3_Transpose, 9
#_0CC1CD: #_0FC1: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F87

SFX_0D_SEGMENT_0FC4:
#_0CC1D0: #_0FC4: db $70 ; vol 0x10
#_0CC1D1: #_0FC5: db !TRACKCOMMAND_F2_SetPan, $68
#_0CC1D3: #_0FC7: db !TRACKCOMMAND_F3_Transpose, 21
#_0CC1D5: #_0FC9: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC1D7: #_0FCB: db !TRACKCOMMAND_F8_Goto_X : dw SFX_0D_SEGMENT_0F89

;===================================================================================================
; 
;===================================================================================================
SFX_0E:
#_0CC1DA: #_0FCE: db !SFX_CHANNEL_5 : dw SFX_0E_SEGMENT_0FD5
#_0CC1DD: #_0FD1: db !SFX_CHANNEL_4 : dw SFX_0E_SEGMENT_0FF0
#_0CC1E0: #_0FD4: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0E_SEGMENT_0FD5:
#_0CC1E1: #_0FD5: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC1E4: #_0FD8: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC1E6: #_0FDA: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC1E8: #_0FDC: db $82 ; dur 0x02
#_0CC1E9: #_0FDD: db $7E ; vol 0x1E
#_0CC1EA: #_0FDE: db Gs2
#_0CC1EB: #_0FDF: db $7A ; vol 0x1A
#_0CC1EC: #_0FE0: db As2
#_0CC1ED: #_0FE1: db $76 ; vol 0x16
#_0CC1EE: #_0FE2: db C3
#_0CC1EF: #_0FE3: db $73 ; vol 0x13
#_0CC1F0: #_0FE4: db D3
#_0CC1F1: #_0FE5: db $70 ; vol 0x10
#_0CC1F2: #_0FE6: db E3
#_0CC1F3: #_0FE7: db $63 ; vol 0x03
#_0CC1F4: #_0FE8: db Fs3
#_0CC1F5: #_0FE9: db $66 ; vol 0x06
#_0CC1F6: #_0FEA: db Gs3
#_0CC1F7: #_0FEB: db $6A ; vol 0x0A
#_0CC1F8: #_0FEC: db As3
#_0CC1F9: #_0FED: db $6E ; vol 0x0E
#_0CC1FA: #_0FEE: db C4
#_0CC1FB: #_0FEF: db !TRACKCOMMAND_FF_EndTrack

SFX_0E_SEGMENT_0FF0:
#_0CC1FC: #_0FF0: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC1FF: #_0FF3: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC201: #_0FF5: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC203: #_0FF7: db $82 ; dur 0x02
#_0CC204: #_0FF8: db $6E ; vol 0x0E
#_0CC205: #_0FF9: db Cs3
#_0CC206: #_0FFA: db $6A ; vol 0x0A
#_0CC207: #_0FFB: db Ds3
#_0CC208: #_0FFC: db $66 ; vol 0x06
#_0CC209: #_0FFD: db F3
#_0CC20A: #_0FFE: db $63 ; vol 0x03
#_0CC20B: #_0FFF: db G3
#_0CC20C: #_1000: db $60 ; vol 0x00
#_0CC20D: #_1001: db A3
#_0CC20E: #_1002: db $73 ; vol 0x13
#_0CC20F: #_1003: db B3
#_0CC210: #_1004: db $76 ; vol 0x16
#_0CC211: #_1005: db Cs4
#_0CC212: #_1006: db $7A ; vol 0x1A
#_0CC213: #_1007: db Ds4
#_0CC214: #_1008: db $7E ; vol 0x1E
#_0CC215: #_1009: db F4
#_0CC216: #_100A: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_0F:
#_0CC217: #_100B: db !SFX_CHANNEL_5 : dw SFX_0F_SEGMENT_100F
#_0CC21A: #_100E: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_0F_SEGMENT_100F:
#_0CC21B: #_100F: db $70 ; vol 0x10
#_0CC21C: #_1010: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC21F: #_1013: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC221: #_1015: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC223: #_1017: db $81 ; dur 0x01
#_0CC224: #_1018: db $52 ; Noise 0x12
#_0CC225: #_1019: db $54 ; Noise 0x14
#_0CC226: #_101A: db $58 ; Noise 0x18
#_0CC227: #_101B: db $5C ; Noise 0x1C
#_0CC228: #_101C: db R
#_0CC229: #_101D: db R
#_0CC22A: #_101E: db $52 ; Noise 0x12
#_0CC22B: #_101F: db $54 ; Noise 0x14
#_0CC22C: #_1020: db $58 ; Noise 0x18
#_0CC22D: #_1021: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_10:
#_0CC22E: #_1022: db !SFX_CHANNEL_5 : dw SFX_10_SEGMENT_1026
#_0CC231: #_1025: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_10_SEGMENT_1026:
#_0CC232: #_1026: db $70 ; vol 0x10
#_0CC233: #_1027: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC236: #_102A: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC238: #_102C: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC23A: #_102E: db $81 ; dur 0x01
#_0CC23B: #_102F: db $52 ; Noise 0x12
#_0CC23C: #_1030: db $54 ; Noise 0x14
#_0CC23D: #_1031: db $58 ; Noise 0x18
#_0CC23E: #_1032: db $5C ; Noise 0x1C
#_0CC23F: #_1033: db $52 ; Noise 0x12
#_0CC240: #_1034: db $50 ; Noise 0x10
#_0CC241: #_1035: db $4E ; Noise 0x0E
#_0CC242: #_1036: db $4C ; Noise 0x0C
#_0CC243: #_1037: db $52 ; Noise 0x12
#_0CC244: #_1038: db $50 ; Noise 0x10
#_0CC245: #_1039: db $4E ; Noise 0x0E
#_0CC246: #_103A: db $4C ; Noise 0x0C
#_0CC247: #_103B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_11:
#_0CC248: #_103C: db !SFX_CHANNEL_5 : dw SFX_11_SEGMENT_1040
#_0CC24B: #_103F: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_11_SEGMENT_1040:
#_0CC24C: #_1040: db $70 ; vol 0x10
#_0CC24D: #_1041: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC250: #_1044: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC252: #_1046: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC254: #_1048: db $81 ; dur 0x01
#_0CC255: #_1049: db $5C ; Noise 0x1C
#_0CC256: #_104A: db $58 ; Noise 0x18
#_0CC257: #_104B: db $5C ; Noise 0x1C
#_0CC258: #_104C: db $5D ; Noise 0x1D
#_0CC259: #_104D: db $5E ; Noise 0x1E
#_0CC25A: #_104E: db $5F ; Noise 0x1F
#_0CC25B: #_104F: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_12:
#_0CC25C: #_1050: db !SFX_CHANNEL_5 : dw SFX_12_SEGMENT_1054
#_0CC25F: #_1053: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_12_SEGMENT_1054:
#_0CC260: #_1054: db $70 ; vol 0x10
#_0CC261: #_1055: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC264: #_1058: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC266: #_105A: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC268: #_105C: db $81 ; dur 0x01
#_0CC269: #_105D: db $5C ; Noise 0x1C
#_0CC26A: #_105E: db $58 ; Noise 0x18
#_0CC26B: #_105F: db $54 ; Noise 0x14
#_0CC26C: #_1060: db $50 ; Noise 0x10
#_0CC26D: #_1061: db $54 ; Noise 0x14
#_0CC26E: #_1062: db $58 ; Noise 0x18
#_0CC26F: #_1063: db $5C ; Noise 0x1C
#_0CC270: #_1064: db $5E ; Noise 0x1E
#_0CC271: #_1065: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_13:
#_0CC272: #_1066: db !SFX_CHANNEL_5 : dw SFX_13_SEGMENT_106A
#_0CC275: #_1069: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_13_SEGMENT_106A:
#_0CC276: #_106A: db $70 ; vol 0x10
#_0CC277: #_106B: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC27A: #_106E: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC27C: #_1070: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC27E: #_1072: db $81 ; dur 0x01
#_0CC27F: #_1073: db $58 ; Noise 0x18
#_0CC280: #_1074: db $54 ; Noise 0x14
#_0CC281: #_1075: db $4E ; Noise 0x0E
#_0CC282: #_1076: db $50 ; Noise 0x10
#_0CC283: #_1077: db $52 ; Noise 0x12
#_0CC284: #_1078: db $54 ; Noise 0x14
#_0CC285: #_1079: db $56 ; Noise 0x16
#_0CC286: #_107A: db $58 ; Noise 0x18
#_0CC287: #_107B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_14:
#_0CC288: #_107C: db !SFX_CHANNEL_5 : dw SFX_14_SEGMENT_1080
#_0CC28B: #_107F: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_14_SEGMENT_1080:
#_0CC28C: #_1080: db $70 ; vol 0x10
#_0CC28D: #_1081: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC290: #_1084: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC292: #_1086: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC294: #_1088: db $81 ; dur 0x01
#_0CC295: #_1089: db $58 ; Noise 0x18
#_0CC296: #_108A: db $56 ; Noise 0x16
#_0CC297: #_108B: db $54 ; Noise 0x14
#_0CC298: #_108C: db $52 ; Noise 0x12
#_0CC299: #_108D: db $50 ; Noise 0x10
#_0CC29A: #_108E: db $4E ; Noise 0x0E
#_0CC29B: #_108F: db $4C ; Noise 0x0C
#_0CC29C: #_1090: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_15:
#_0CC29D: #_1091: db !SFX_CHANNEL_5 : dw SFX_15_SEGMENT_1095
#_0CC2A0: #_1094: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_15_SEGMENT_1095:
#_0CC2A1: #_1095: db $70 ; vol 0x10
#_0CC2A2: #_1096: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC2A5: #_1099: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC2A7: #_109B: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC2A9: #_109D: db $81 ; dur 0x01
#_0CC2AA: #_109E: db $54 ; Noise 0x14
#_0CC2AB: #_109F: db $58 ; Noise 0x18
#_0CC2AC: #_10A0: db $5C ; Noise 0x1C
#_0CC2AD: #_10A1: db $5C ; Noise 0x1C
#_0CC2AE: #_10A2: db $58 ; Noise 0x18
#_0CC2AF: #_10A3: db $54 ; Noise 0x14
#_0CC2B0: #_10A4: db $50 ; Noise 0x10
#_0CC2B1: #_10A5: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_16:
#_0CC2B2: #_10A6: db !SFX_CHANNEL_5 : dw SFX_16_SEGMENT_10AA
#_0CC2B5: #_10A9: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_16_SEGMENT_10AA:
#_0CC2B6: #_10AA: db $70 ; vol 0x10
#_0CC2B7: #_10AB: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC2BA: #_10AE: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC2BC: #_10B0: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC2BE: #_10B2: db $81 ; dur 0x01
#_0CC2BF: #_10B3: db $58 ; Noise 0x18
#_0CC2C0: #_10B4: db $5A ; Noise 0x1A
#_0CC2C1: #_10B5: db $5C ; Noise 0x1C
#_0CC2C2: #_10B6: db $5E ; Noise 0x1E
#_0CC2C3: #_10B7: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_17:
#_0CC2C4: #_10B8: db !SFX_CHANNEL_4 : dw SFX_17_SEGMENT_10BF
#_0CC2C7: #_10BB: db !SFX_CHANNEL_5 : dw SFX_17_SEGMENT_10CA
#_0CC2CA: #_10BE: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_17_SEGMENT_10BF:
#_0CC2CB: #_10BF: db $70 ; vol 0x10
#_0CC2CC: #_10C0: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC2CF: #_10C3: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC2D1: #_10C5: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CC2D3: #_10C7: db $84 ; dur 0x04
#_0CC2D4: #_10C8: db F3
#_0CC2D5: #_10C9: db !TRACKCOMMAND_FF_EndTrack

SFX_17_SEGMENT_10CA:
#_0CC2D6: #_10CA: db $70 ; vol 0x10
#_0CC2D7: #_10CB: db !TRACKCOMMAND_F0_SetADSR, $FF, $F8
#_0CC2DA: #_10CE: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC2DC: #_10D0: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC2DE: #_10D2: db $8A ; dur 0x0A
#_0CC2DF: #_10D3: db $58 ; Noise 0x18
#_0CC2E0: #_10D4: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_18:
#_0CC2E1: #_10D5: db !SFX_CHANNEL_4 : dw SFX_18_SEGMENT_10DC
#_0CC2E4: #_10D8: db !SFX_CHANNEL_5 : dw SFX_18_SEGMENT_10EA
#_0CC2E7: #_10DB: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_18_SEGMENT_10DC:
#_0CC2E8: #_10DC: db $70 ; vol 0x10
#_0CC2E9: #_10DD: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC2EC: #_10E0: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC2EE: #_10E2: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CC2F0: #_10E4: db $84 ; dur 0x04
#_0CC2F1: #_10E5: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CC2F3: #_10E7: db F3
#_0CC2F4: #_10E8: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC2F5: #_10E9: db !TRACKCOMMAND_FF_EndTrack

SFX_18_SEGMENT_10EA:
#_0CC2F6: #_10EA: db $70 ; vol 0x10
#_0CC2F7: #_10EB: db !TRACKCOMMAND_F0_SetADSR, $FF, $F8
#_0CC2FA: #_10EE: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC2FC: #_10F0: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC2FE: #_10F2: db $84 ; dur 0x04
#_0CC2FF: #_10F3: db !TRACKCOMMAND_F4_SetLoop_B, $06
#_0CC301: #_10F5: db $54 ; Noise 0x14
#_0CC302: #_10F6: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC303: #_10F7: db $88 ; dur 0x08
#_0CC304: #_10F8: db $54 ; Noise 0x14
#_0CC305: #_10F9: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_19:
#_0CC306: #_10FA: db !SFX_CHANNEL_5 : dw SFX_19_SEGMENT_10FE
#_0CC309: #_10FD: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_19_SEGMENT_10FE:
#_0CC30A: #_10FE: db $70 ; vol 0x10
#_0CC30B: #_10FF: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC30E: #_1102: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CC310: #_1104: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC312: #_1106: db $8C ; dur 0x0C
#_0CC313: #_1107: db C3
#_0CC314: #_1108: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1A:
#_0CC315: #_1109: db !SFX_CHANNEL_5 : dw SFX_1A_SEGMENT_110D
#_0CC318: #_110C: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1A_SEGMENT_110D:
#_0CC319: #_110D: db $70 ; vol 0x10
#_0CC31A: #_110E: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC31D: #_1111: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC31F: #_1113: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC321: #_1115: db $81 ; dur 0x01
#_0CC322: #_1116: db $54 ; Noise 0x14
#_0CC323: #_1117: db $50 ; Noise 0x10
#_0CC324: #_1118: db $4C ; Noise 0x0C
#_0CC325: #_1119: db $50 ; Noise 0x10
#_0CC326: #_111A: db $54 ; Noise 0x14
#_0CC327: #_111B: db !TRACKCOMMAND_F2_SetPan, $38
#_0CC329: #_111D: db $56 ; Noise 0x16
#_0CC32A: #_111E: db !TRACKCOMMAND_F2_SetPan, $3C
#_0CC32C: #_1120: db $55 ; Noise 0x15
#_0CC32D: #_1121: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC32F: #_1123: db $54 ; Noise 0x14
#_0CC330: #_1124: db !TRACKCOMMAND_F2_SetPan, $44
#_0CC332: #_1126: db $56 ; Noise 0x16
#_0CC333: #_1127: db !TRACKCOMMAND_F2_SetPan, $48
#_0CC335: #_1129: db $57 ; Noise 0x17
#_0CC336: #_112A: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CC338: #_112C: db $53 ; Noise 0x13
#_0CC339: #_112D: db !TRACKCOMMAND_F2_SetPan, $54
#_0CC33B: #_112F: db $53 ; Noise 0x13
#_0CC33C: #_1130: db !TRACKCOMMAND_F2_SetPan, $5C
#_0CC33E: #_1132: db $58 ; Noise 0x18
#_0CC33F: #_1133: db !TRACKCOMMAND_F2_SetPan, $64
#_0CC341: #_1135: db $56 ; Noise 0x16
#_0CC342: #_1136: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CC344: #_1138: db $55 ; Noise 0x15
#_0CC345: #_1139: db !TRACKCOMMAND_F2_SetPan, $74
#_0CC347: #_113B: db $52 ; Noise 0x12
#_0CC348: #_113C: db !TRACKCOMMAND_F2_SetPan, $7C
#_0CC34A: #_113E: db $54 ; Noise 0x14
#_0CC34B: #_113F: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1B:
#_0CC34C: #_1140: db !SFX_CHANNEL_4 : dw SFX_1B_SEGMENT_1147
#_0CC34F: #_1143: db !SFX_CHANNEL_5 : dw SFX_1B_SEGMENT_1149
#_0CC352: #_1146: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1B_SEGMENT_1147:
#_0CC353: #_1147: db !TRACKCOMMAND_F3_Transpose, 3

SFX_1B_SEGMENT_1149:
#_0CC355: #_1149: db $70 ; vol 0x10
#_0CC356: #_114A: db !TRACKCOMMAND_F0_SetADSR, $FF, $F0
#_0CC359: #_114D: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC35B: #_114F: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC35D: #_1151: db !TRACKCOMMAND_E3_PitchBend, $F0
#_0CC35F: #_1153: db $82 ; dur 0x02
#_0CC360: #_1154: db C4
#_0CC361: #_1155: db Gs3
#_0CC362: #_1156: db E3
#_0CC363: #_1157: db C3
#_0CC364: #_1158: db $82 ; dur 0x02
#_0CC365: #_1159: db C4
#_0CC366: #_115A: db Gs3
#_0CC367: #_115B: db E3
#_0CC368: #_115C: db $8C ; dur 0x0C
#_0CC369: #_115D: db C3
#_0CC36A: #_115E: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1C:
#_0CC36B: #_115F: db !SFX_CHANNEL_5 : dw SFX_1C_SEGMENT_1163
#_0CC36E: #_1162: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1C_SEGMENT_1163:
#_0CC36F: #_1163: db $70 ; vol 0x10
#_0CC370: #_1164: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC373: #_1167: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC375: #_1169: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC377: #_116B: db $81 ; dur 0x01
#_0CC378: #_116C: db $50 ; Noise 0x10
#_0CC379: #_116D: db $52 ; Noise 0x12
#_0CC37A: #_116E: db $8C ; dur 0x0C
#_0CC37B: #_116F: db $54 ; Noise 0x14
#_0CC37C: #_1170: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1D:
#_0CC37D: #_1171: db !SFX_CHANNEL_5 : dw SFX_1D_SEGMENT_1175
#_0CC380: #_1174: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1D_SEGMENT_1175:
#_0CC381: #_1175: db $70 ; vol 0x10
#_0CC382: #_1176: db !TRACKCOMMAND_F0_SetADSR, $F2, $E0
#_0CC385: #_1179: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC387: #_117B: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC389: #_117D: db $8C ; dur 0x0C
#_0CC38A: #_117E: db $5E ; Noise 0x1E
#_0CC38B: #_117F: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1E:
#_0CC38C: #_1180: db !MUS_CHANNEL_5 : dw SFX_1E_SEGMENT_1184
#_0CC38F: #_1183: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1E_SEGMENT_1184:
#_0CC390: #_1184: db $70 ; vol 0x10
#_0CC391: #_1185: db !TRACKCOMMAND_F0_SetADSR, $FF, $EE
#_0CC394: #_1188: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC396: #_118A: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC398: #_118C: db $82 ; dur 0x02
#_0CC399: #_118D: db $5E ; Noise 0x1E
#_0CC39A: #_118E: db $5D ; Noise 0x1D
#_0CC39B: #_118F: db $5C ; Noise 0x1C
#_0CC39C: #_1190: db $5B ; Noise 0x1B
#_0CC39D: #_1191: db $5A ; Noise 0x1A
#_0CC39E: #_1192: db $5E ; Noise 0x1E
#_0CC39F: #_1193: db $5D ; Noise 0x1D
#_0CC3A0: #_1194: db $5C ; Noise 0x1C
#_0CC3A1: #_1195: db $5B ; Noise 0x1B
#_0CC3A2: #_1196: db $5A ; Noise 0x1A
#_0CC3A3: #_1197: db $59 ; Noise 0x19
#_0CC3A4: #_1198: db $58 ; Noise 0x18
#_0CC3A5: #_1199: db $57 ; Noise 0x17
#_0CC3A6: #_119A: db $56 ; Noise 0x16
#_0CC3A7: #_119B: db $8C ; dur 0x0C
#_0CC3A8: #_119C: db $55 ; Noise 0x15
#_0CC3A9: #_119D: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_1F:
#_0CC3AA: #_119E: db !MUS_CHANNEL_5 : dw SFX_1F_SEGMENT_11A2
#_0CC3AD: #_11A1: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_1F_SEGMENT_11A2:
#_0CC3AE: #_11A2: db $70 ; vol 0x10
#_0CC3AF: #_11A3: db !TRACKCOMMAND_F0_SetADSR, $FF, $F0
#_0CC3B2: #_11A6: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC3B4: #_11A8: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC3B6: #_11AA: db $82 ; dur 0x02
#_0CC3B7: #_11AB: db $5A ; Noise 0x1A
#_0CC3B8: #_11AC: db $5B ; Noise 0x1B
#_0CC3B9: #_11AD: db $5C ; Noise 0x1C
#_0CC3BA: #_11AE: db R
#_0CC3BB: #_11AF: db R
#_0CC3BC: #_11B0: db R
#_0CC3BD: #_11B1: db $5A ; Noise 0x1A
#_0CC3BE: #_11B2: db $5B ; Noise 0x1B
#_0CC3BF: #_11B3: db $5C ; Noise 0x1C
#_0CC3C0: #_11B4: db $8C ; dur 0x0C
#_0CC3C1: #_11B5: db $5D ; Noise 0x1D
#_0CC3C2: #_11B6: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_20:
#_0CC3C3: #_11B7: db !SFX_CHANNEL_4 : dw SFX_20_SEGMENT_11BE
#_0CC3C6: #_11BA: db !SFX_CHANNEL_5 : dw SFX_20_SEGMENT_11C4
#_0CC3C9: #_11BD: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_20_SEGMENT_11BE:
#_0CC3CA: #_11BE: db $74 ; vol 0x14
#_0CC3CB: #_11BF: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC3CD: #_11C1: db !TRACKCOMMAND_F8_Goto_X : dw SFX_20_SEGMENT_11C5

SFX_20_SEGMENT_11C4:
#_0CC3D0: #_11C4: db $64 ; vol 0x04

SFX_20_SEGMENT_11C5:
#_0CC3D1: #_11C5: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC3D4: #_11C8: db !TRACKCOMMAND_F1_SetSRCN, $07
#_0CC3D6: #_11CA: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC3D8: #_11CC: db $82 ; dur 0x02
#_0CC3D9: #_11CD: db !TRACKCOMMAND_E3_PitchBend, $C0
#_0CC3DB: #_11CF: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CC3DD: #_11D1: db B4
#_0CC3DE: #_11D2: db !TRACKCOMMAND_F2_SetPan, $68
#_0CC3E0: #_11D4: db B4
#_0CC3E1: #_11D5: db !TRACKCOMMAND_F2_SetPan, $64
#_0CC3E3: #_11D7: db B4
#_0CC3E4: #_11D8: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC3E6: #_11DA: db B4
#_0CC3E7: #_11DB: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC3E9: #_11DD: db B4
#_0CC3EA: #_11DE: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC3EC: #_11E0: db B4
#_0CC3ED: #_11E1: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC3EF: #_11E3: db B4
#_0CC3F0: #_11E4: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC3F2: #_11E6: db B4
#_0CC3F3: #_11E7: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC3F5: #_11E9: db B4
#_0CC3F6: #_11EA: db !TRACKCOMMAND_F2_SetPan, $10
#_0CC3F8: #_11EC: db B4
#_0CC3F9: #_11ED: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_21:
#_0CC3FA: #_11EE: db !SFX_CHANNEL_4 : dw SFX_21_SEGMENT_11FE
#_0CC3FD: #_11F1: db !SFX_CHANNEL_5 : dw SFX_21_SEGMENT_11F5
#_0CC400: #_11F4: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_21_SEGMENT_11F5:
#_0CC401: #_11F5: db $84 ; dur 0x04
#_0CC402: #_11F6: db R
#_0CC403: #_11F7: db !TRACKCOMMAND_F2_SetPan, $68
#_0CC405: #_11F9: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC407: #_11FB: db !TRACKCOMMAND_F8_Goto_X : dw SFX_21_SEGMENT_1200

SFX_21_SEGMENT_11FE:
#_0CC40A: #_11FE: db !TRACKCOMMAND_F2_SetPan, $40

SFX_21_SEGMENT_1200:
#_0CC40C: #_1200: db $70 ; vol 0x10
#_0CC40D: #_1201: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC410: #_1204: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC412: #_1206: db !TRACKCOMMAND_F3_Transpose, 6
#_0CC414: #_1208: db !TRACKCOMMAND_F3_Transpose, 12
#_0CC416: #_120A: db $82 ; dur 0x02
#_0CC417: #_120B: db Gs3
#_0CC418: #_120C: db C4
#_0CC419: #_120D: db As3
#_0CC41A: #_120E: db D4
#_0CC41B: #_120F: db C4
#_0CC41C: #_1210: db E4
#_0CC41D: #_1211: db As3
#_0CC41E: #_1212: db D4
#_0CC41F: #_1213: db C4
#_0CC420: #_1214: db E4
#_0CC421: #_1215: db D4
#_0CC422: #_1216: db Fs4
#_0CC423: #_1217: db C4
#_0CC424: #_1218: db E4
#_0CC425: #_1219: db D4
#_0CC426: #_121A: db Fs4
#_0CC427: #_121B: db E4
#_0CC428: #_121C: db Gs4
#_0CC429: #_121D: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_22:
#_0CC42A: #_121E: db !SFX_CHANNEL_4 : dw SFX_22_SEGMENT_1225
#_0CC42D: #_1221: db !SFX_CHANNEL_5 : dw SFX_22_SEGMENT_1227
#_0CC430: #_1224: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_22_SEGMENT_1225:
#_0CC431: #_1225: db !TRACKCOMMAND_F3_Transpose, 4

SFX_22_SEGMENT_1227:
#_0CC433: #_1227: db $70 ; vol 0x10
#_0CC434: #_1228: db !TRACKCOMMAND_F0_SetADSR, $FA, $F2
#_0CC437: #_122B: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC439: #_122D: db $82 ; dur 0x02
#_0CC43A: #_122E: db C4
#_0CC43B: #_122F: db !TRACKCOMMAND_FC_FadeOut
#_0CC43C: #_1230: db D4
#_0CC43D: #_1231: db E4
#_0CC43E: #_1232: db Fs4
#_0CC43F: #_1233: db !TRACKCOMMAND_E3_PitchBend, $A0
#_0CC441: #_1235: db $8C ; dur 0x0C
#_0CC442: #_1236: db Gs4
#_0CC443: #_1237: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CC444: #_1238: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_23:
#_0CC445: #_1239: db !SFX_CHANNEL_4 : dw SFX_23_SEGMENT_1240
#_0CC448: #_123C: db !SFX_CHANNEL_5 : dw SFX_23_SEGMENT_1242
#_0CC44B: #_123F: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_23_SEGMENT_1240:
#_0CC44C: #_1240: db !TRACKCOMMAND_F3_Transpose, 3

SFX_23_SEGMENT_1242:
#_0CC44E: #_1242: db $70 ; vol 0x10
#_0CC44F: #_1243: db !TRACKCOMMAND_F0_SetADSR, $FF, $F0
#_0CC452: #_1246: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC454: #_1248: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC456: #_124A: db $82 ; dur 0x02
#_0CC457: #_124B: db Gs3
#_0CC458: #_124C: db C4
#_0CC459: #_124D: db E4
#_0CC45A: #_124E: db $8C ; dur 0x0C
#_0CC45B: #_124F: db Gs4
#_0CC45C: #_1250: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_24_Silence:
#_0CC45D: #_1251: db !SFX_CHANNEL_4 : dw SFX_24_Silence_SEGMENT_1258
#_0CC460: #_1254: db !SFX_CHANNEL_5 : dw SFX_24_Silence_SEGMENT_1259
#_0CC463: #_1257: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_24_Silence_SEGMENT_1258:
#_0CC464: #_1258: db !TRACKCOMMAND_FF_EndTrack

SFX_24_Silence_SEGMENT_1259:
#_0CC465: #_1259: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_25_Silence:
#_0CC466: #_125A: db !SFX_CHANNEL_4 : dw SFX_25_Silence_SEGMENT_1261
#_0CC469: #_125D: db !SFX_CHANNEL_5 : dw SFX_25_Silence_SEGMENT_1262
#_0CC46C: #_1260: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_25_Silence_SEGMENT_1261:
#_0CC46D: #_1261: db !TRACKCOMMAND_FF_EndTrack

SFX_25_Silence_SEGMENT_1262:
#_0CC46E: #_1262: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_26_Silence:
#_0CC46F: #_1263: db !SFX_CHANNEL_4 : dw SFX_26_Silence_SEGMENT_126A
#_0CC472: #_1266: db !SFX_CHANNEL_5 : dw SFX_26_Silence_SEGMENT_126B
#_0CC475: #_1269: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_26_Silence_SEGMENT_126A:
#_0CC476: #_126A: db !TRACKCOMMAND_FF_EndTrack

SFX_26_Silence_SEGMENT_126B:
#_0CC477: #_126B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2A:
#_0CC478: #_126C: db !SFX_CHANNEL_5 : dw SFX_2A_SEGMENT_1271
#_0CC47B: #_126F: db !HEADERCOMMAND_FF_LAST_CHANNEL
#_0CC47C: #_1270: db !TRACKCOMMAND_FF_EndTrack

SFX_2A_SEGMENT_1271:
#_0CC47D: #_1271: db $70 ; vol 0x10
#_0CC47E: #_1272: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC481: #_1275: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC483: #_1277: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC485: #_1279: db $81 ; dur 0x01
#_0CC486: #_127A: db $5C ; Noise 0x1C
#_0CC487: #_127B: db $5D ; Noise 0x1D
#_0CC488: #_127C: db $5E ; Noise 0x1E
#_0CC489: #_127D: db R
#_0CC48A: #_127E: db $5C ; Noise 0x1C
#_0CC48B: #_127F: db $5D ; Noise 0x1D
#_0CC48C: #_1280: db $5E ; Noise 0x1E
#_0CC48D: #_1281: db R
#_0CC48E: #_1282: db $5B ; Noise 0x1B
#_0CC48F: #_1283: db $5C ; Noise 0x1C
#_0CC490: #_1284: db $5D ; Noise 0x1D
#_0CC491: #_1285: db R
#_0CC492: #_1286: db $5B ; Noise 0x1B
#_0CC493: #_1287: db $5C ; Noise 0x1C
#_0CC494: #_1288: db $5D ; Noise 0x1D
#_0CC495: #_1289: db R
#_0CC496: #_128A: db $5A ; Noise 0x1A
#_0CC497: #_128B: db $5B ; Noise 0x1B
#_0CC498: #_128C: db $5C ; Noise 0x1C
#_0CC499: #_128D: db R
#_0CC49A: #_128E: db $5A ; Noise 0x1A
#_0CC49B: #_128F: db $5B ; Noise 0x1B
#_0CC49C: #_1290: db $5C ; Noise 0x1C
#_0CC49D: #_1291: db R
#_0CC49E: #_1292: db $82 ; dur 0x02
#_0CC49F: #_1293: db $5E ; Noise 0x1E
#_0CC4A0: #_1294: db $5D ; Noise 0x1D
#_0CC4A1: #_1295: db $5C ; Noise 0x1C
#_0CC4A2: #_1296: db $5B ; Noise 0x1B
#_0CC4A3: #_1297: db $5A ; Noise 0x1A
#_0CC4A4: #_1298: db $59 ; Noise 0x19
#_0CC4A5: #_1299: db $58 ; Noise 0x18
#_0CC4A6: #_129A: db $57 ; Noise 0x17
#_0CC4A7: #_129B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2B:
#_0CC4A8: #_129C: db !SFX_CHANNEL_4 : dw SFX_0A_SEGMENT_0F1F
#_0CC4AB: #_129F: db !SFX_CHANNEL_5 : dw SFX_0A_SEGMENT_0F2C
#_0CC4AE: #_12A2: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2B_UNUSED:
#_0CC4AF: #_12A3: db !SFX_CHANNEL_5 : dw SFX_2B_UNUSED_SEGMENT_12A7
#_0CC4B2: #_12A6: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2B_UNUSED_SEGMENT_12A7:
#_0CC4B3: #_12A7: db $70 ; vol 0x10
#_0CC4B4: #_12A8: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC4B7: #_12AB: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC4B9: #_12AD: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC4BB: #_12AF: db $81 ; dur 0x01
#_0CC4BC: #_12B0: db C4
#_0CC4BD: #_12B1: db Gs3
#_0CC4BE: #_12B2: db E3
#_0CC4BF: #_12B3: db C3
#_0CC4C0: #_12B4: db Gs3
#_0CC4C1: #_12B5: db E3
#_0CC4C2: #_12B6: db C3
#_0CC4C3: #_12B7: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2C:
#_0CC4C4: #_12B8: db !SFX_CHANNEL_5 : dw SFX_2C_SEGMENT_12BC
#_0CC4C7: #_12BB: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2C_SEGMENT_12BC:
#_0CC4C8: #_12BC: db $70 ; vol 0x10
#_0CC4C9: #_12BD: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC4CC: #_12C0: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC4CE: #_12C2: db !TRACKCOMMAND_F3_Transpose, 4
#_0CC4D0: #_12C4: db $81 ; dur 0x01
#_0CC4D1: #_12C5: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC4D3: #_12C7: db Gs4
#_0CC4D4: #_12C8: db E4
#_0CC4D5: #_12C9: db C4
#_0CC4D6: #_12CA: db Gs3
#_0CC4D7: #_12CB: db !TRACKCOMMAND_F2_SetPan, $10
#_0CC4D9: #_12CD: db Gs4
#_0CC4DA: #_12CE: db E4
#_0CC4DB: #_12CF: db C4
#_0CC4DC: #_12D0: db Gs3
#_0CC4DD: #_12D1: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC4DF: #_12D3: db Gs4
#_0CC4E0: #_12D4: db E4
#_0CC4E1: #_12D5: db C4
#_0CC4E2: #_12D6: db Gs3
#_0CC4E3: #_12D7: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC4E5: #_12D9: db Gs4
#_0CC4E6: #_12DA: db E4
#_0CC4E7: #_12DB: db C4
#_0CC4E8: #_12DC: db Gs3
#_0CC4E9: #_12DD: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC4EB: #_12DF: db Gs4
#_0CC4EC: #_12E0: db E4
#_0CC4ED: #_12E1: db C4
#_0CC4EE: #_12E2: db Gs3
#_0CC4EF: #_12E3: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC4F1: #_12E5: db Gs4
#_0CC4F2: #_12E6: db E4
#_0CC4F3: #_12E7: db C4
#_0CC4F4: #_12E8: db Gs3
#_0CC4F5: #_12E9: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC4F7: #_12EB: db Gs4
#_0CC4F8: #_12EC: db E4
#_0CC4F9: #_12ED: db C4
#_0CC4FA: #_12EE: db Gs3
#_0CC4FB: #_12EF: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2D:
#_0CC4FC: #_12F0: db !SFX_CHANNEL_4 : dw SFX_2D_SEGMENT_12F7
#_0CC4FF: #_12F3: db !SFX_CHANNEL_5 : dw SFX_2D_SEGMENT_1304
#_0CC502: #_12F6: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2D_SEGMENT_12F7:
#_0CC503: #_12F7: db $70 ; vol 0x10
#_0CC504: #_12F8: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC507: #_12FB: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC509: #_12FD: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC50B: #_12FF: db $83 ; dur 0x03
#_0CC50C: #_1300: db D4
#_0CC50D: #_1301: db C4
#_0CC50E: #_1302: db As3
#_0CC50F: #_1303: db !TRACKCOMMAND_FF_EndTrack

SFX_2D_SEGMENT_1304:
#_0CC510: #_1304: db $70 ; vol 0x10
#_0CC511: #_1305: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC514: #_1308: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC516: #_130A: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC518: #_130C: db $81 ; dur 0x01
#_0CC519: #_130D: db As5
#_0CC51A: #_130E: db Fs5
#_0CC51B: #_130F: db D5
#_0CC51C: #_1310: db $54 ; Noise 0x14
#_0CC51D: #_1311: db $50 ; Noise 0x10
#_0CC51E: #_1312: db $4C ; Noise 0x0C
#_0CC51F: #_1313: db $54 ; Noise 0x14
#_0CC520: #_1314: db $50 ; Noise 0x10
#_0CC521: #_1315: db $4C ; Noise 0x0C
#_0CC522: #_1316: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2E:
#_0CC523: #_1317: db !SFX_CHANNEL_4 : dw SFX_2E_SEGMENT_131E
#_0CC526: #_131A: db !SFX_CHANNEL_5 : dw SFX_2E_SEGMENT_132F
#_0CC529: #_131D: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2E_SEGMENT_131E:
#_0CC52A: #_131E: db $70 ; vol 0x10
#_0CC52B: #_131F: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC52E: #_1322: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC530: #_1324: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC532: #_1326: db $81 ; dur 0x01
#_0CC533: #_1327: db C4
#_0CC534: #_1328: db !TRACKCOMMAND_FC_FadeOut
#_0CC535: #_1329: db Gs3
#_0CC536: #_132A: db E3
#_0CC537: #_132B: db C4
#_0CC538: #_132C: db Gs3
#_0CC539: #_132D: db E3
#_0CC53A: #_132E: db !TRACKCOMMAND_FF_EndTrack

SFX_2E_SEGMENT_132F:
#_0CC53B: #_132F: db $70 ; vol 0x10
#_0CC53C: #_1330: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC53F: #_1333: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC541: #_1335: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC543: #_1337: db $81 ; dur 0x01
#_0CC544: #_1338: db C4
#_0CC545: #_1339: db Gs3
#_0CC546: #_133A: db E3
#_0CC547: #_133B: db $54 ; Noise 0x14
#_0CC548: #_133C: db $58 ; Noise 0x18
#_0CC549: #_133D: db $5C ; Noise 0x1C
#_0CC54A: #_133E: db $54 ; Noise 0x14
#_0CC54B: #_133F: db $50 ; Noise 0x10
#_0CC54C: #_1340: db $4C ; Noise 0x0C
#_0CC54D: #_1341: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_2F:
#_0CC54E: #_1342: db !SFX_CHANNEL_4 : dw SFX_2F_SEGMENT_1352
#_0CC551: #_1345: db !SFX_CHANNEL_5 : dw SFX_2F_SEGMENT_1349
#_0CC554: #_1348: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_2F_SEGMENT_1349:
#_0CC555: #_1349: db $84 ; dur 0x04
#_0CC556: #_134A: db R
#_0CC557: #_134B: db !TRACKCOMMAND_F2_SetPan, $58
#_0CC559: #_134D: db !TRACKCOMMAND_F9_FineTune, $30
#_0CC55B: #_134F: db !TRACKCOMMAND_F8_Goto_X : dw SFX_2F_SEGMENT_1355

SFX_2F_SEGMENT_1352:
#_0CC55E: #_1352: db $70 ; vol 0x10
#_0CC55F: #_1353: db !TRACKCOMMAND_F2_SetPan, $40

SFX_2F_SEGMENT_1355:
#_0CC561: #_1355: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC564: #_1358: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CC566: #_135A: db $81 ; dur 0x01
#_0CC567: #_135B: db E5
#_0CC568: #_135C: db !TRACKCOMMAND_FC_FadeOut
#_0CC569: #_135D: db Fs5
#_0CC56A: #_135E: db Gs5
#_0CC56B: #_135F: db As5
#_0CC56C: #_1360: db Gs5
#_0CC56D: #_1361: db Fs5
#_0CC56E: #_1362: db !TRACKCOMMAND_F3_Transpose, -2
#_0CC570: #_1364: db E5
#_0CC571: #_1365: db Fs5
#_0CC572: #_1366: db Gs5
#_0CC573: #_1367: db As5
#_0CC574: #_1368: db Gs5
#_0CC575: #_1369: db Fs5
#_0CC576: #_136A: db !TRACKCOMMAND_F3_Transpose, -4
#_0CC578: #_136C: db E5
#_0CC579: #_136D: db Fs5
#_0CC57A: #_136E: db Gs5
#_0CC57B: #_136F: db As5
#_0CC57C: #_1370: db Gs5
#_0CC57D: #_1371: db Fs5
#_0CC57E: #_1372: db !TRACKCOMMAND_F3_Transpose, -6
#_0CC580: #_1374: db E5
#_0CC581: #_1375: db Fs5
#_0CC582: #_1376: db Gs5
#_0CC583: #_1377: db As5
#_0CC584: #_1378: db Gs5
#_0CC585: #_1379: db Fs5
#_0CC586: #_137A: db !TRACKCOMMAND_F3_Transpose, -8
#_0CC588: #_137C: db E5
#_0CC589: #_137D: db Fs5
#_0CC58A: #_137E: db Gs5
#_0CC58B: #_137F: db As5
#_0CC58C: #_1380: db Gs5
#_0CC58D: #_1381: db Fs5
#_0CC58E: #_1382: db !TRACKCOMMAND_F3_Transpose, -10
#_0CC590: #_1384: db E5
#_0CC591: #_1385: db Fs5
#_0CC592: #_1386: db Gs5
#_0CC593: #_1387: db As5
#_0CC594: #_1388: db Gs5
#_0CC595: #_1389: db Fs5
#_0CC596: #_138A: db !TRACKCOMMAND_F3_Transpose, -12
#_0CC598: #_138C: db E5
#_0CC599: #_138D: db Fs5
#_0CC59A: #_138E: db Gs5
#_0CC59B: #_138F: db As5
#_0CC59C: #_1390: db Gs5
#_0CC59D: #_1391: db Fs5
#_0CC59E: #_1392: db !TRACKCOMMAND_F3_Transpose, -14
#_0CC5A0: #_1394: db E5
#_0CC5A1: #_1395: db Fs5
#_0CC5A2: #_1396: db Gs5
#_0CC5A3: #_1397: db As5
#_0CC5A4: #_1398: db Gs5
#_0CC5A5: #_1399: db Fs5
#_0CC5A6: #_139A: db !TRACKCOMMAND_F3_Transpose, -16
#_0CC5A8: #_139C: db E5
#_0CC5A9: #_139D: db Fs5
#_0CC5AA: #_139E: db Gs5
#_0CC5AB: #_139F: db As5
#_0CC5AC: #_13A0: db Gs5
#_0CC5AD: #_13A1: db Fs5
#_0CC5AE: #_13A2: db !TRACKCOMMAND_F3_Transpose, -18
#_0CC5B0: #_13A4: db E5
#_0CC5B1: #_13A5: db Fs5
#_0CC5B2: #_13A6: db Gs5
#_0CC5B3: #_13A7: db As5
#_0CC5B4: #_13A8: db Gs5
#_0CC5B5: #_13A9: db Fs5
#_0CC5B6: #_13AA: db !TRACKCOMMAND_F3_Transpose, -20
#_0CC5B8: #_13AC: db E5
#_0CC5B9: #_13AD: db Fs5
#_0CC5BA: #_13AE: db Gs5
#_0CC5BB: #_13AF: db As5
#_0CC5BC: #_13B0: db Gs5
#_0CC5BD: #_13B1: db Fs5
#_0CC5BE: #_13B2: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_30:
#_0CC5BF: #_13B3: db !SFX_CHANNEL_4 : dw SFX_30_SEGMENT_13BA
#_0CC5C2: #_13B6: db !SFX_CHANNEL_5 : dw SFX_30_SEGMENT_13BB
#_0CC5C5: #_13B9: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_30_SEGMENT_13BA:
#_0CC5C6: #_13BA: db !TRACKCOMMAND_FF_EndTrack

SFX_30_SEGMENT_13BB:
#_0CC5C7: #_13BB: db $70 ; vol 0x10
#_0CC5C8: #_13BC: db !TRACKCOMMAND_F0_SetADSR, $FF, $F4
#_0CC5CB: #_13BF: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC5CD: #_13C1: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC5CF: #_13C3: db $84 ; dur 0x04
#_0CC5D0: #_13C4: db $56 ; Noise 0x16
#_0CC5D1: #_13C5: db $8A ; dur 0x0A
#_0CC5D2: #_13C6: db $58 ; Noise 0x18
#_0CC5D3: #_13C7: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_31:
#_0CC5D4: #_13C8: db !SFX_CHANNEL_4 : dw SFX_31_SEGMENT_13CF
#_0CC5D7: #_13CB: db !SFX_CHANNEL_5 : dw SFX_31_SEGMENT_13D5
#_0CC5DA: #_13CE: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_31_SEGMENT_13CF:
#_0CC5DB: #_13CF: db $74 ; vol 0x14
#_0CC5DC: #_13D0: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC5DE: #_13D2: db !TRACKCOMMAND_F8_Goto_X : dw SFX_31_SEGMENT_13D6

SFX_31_SEGMENT_13D5:
#_0CC5E1: #_13D5: db $64 ; vol 0x04

SFX_31_SEGMENT_13D6:
#_0CC5E2: #_13D6: db !TRACKCOMMAND_F0_SetADSR, $FF, $F4
#_0CC5E5: #_13D9: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC5E7: #_13DB: db !TRACKCOMMAND_E3_PitchBend, $7F
#_0CC5E9: #_13DD: db $86 ; dur 0x06
#_0CC5EA: #_13DE: db !TRACKCOMMAND_F2_SetPan, $10
#_0CC5EC: #_13E0: db C4
#_0CC5ED: #_13E1: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC5EF: #_13E3: db C4
#_0CC5F0: #_13E4: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC5F2: #_13E6: db C4
#_0CC5F3: #_13E7: db !TRACKCOMMAND_F2_SetPan, $40
#_0CC5F5: #_13E9: db C4
#_0CC5F6: #_13EA: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC5F8: #_13EC: db C4
#_0CC5F9: #_13ED: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC5FB: #_13EF: db C4
#_0CC5FC: #_13F0: db !TRACKCOMMAND_F2_SetPan, $70
#_0CC5FE: #_13F2: db C4
#_0CC5FF: #_13F3: db !TRACKCOMMAND_F2_SetPan, $78
#_0CC601: #_13F5: db C4
#_0CC602: #_13F6: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_32:
#_0CC603: #_13F7: db !MUS_CHANNEL_4 : dw SFX_32_SEGMENT_1401
#_0CC606: #_13FA: db !MUS_CHANNEL_5 : dw SFX_32_SEGMENT_1410
#_0CC609: #_13FD: db !MUS_CHANNEL_6 : dw SFX_32_SEGMENT_1412
#_0CC60C: #_1400: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_32_SEGMENT_1401:
#_0CC60D: #_1401: db $70 ; vol 0x10
#_0CC60E: #_1402: db !TRACKCOMMAND_F0_SetADSR, $91, $EA
#_0CC611: #_1405: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC613: #_1407: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC615: #_1409: db $8E ; dur 0x0E
#_0CC616: #_140A: db $5D ; Noise 0x1D
#_0CC617: #_140B: db TIE
#_0CC618: #_140C: db TIE
#_0CC619: #_140D: db TIE
#_0CC61A: #_140E: db TIE
#_0CC61B: #_140F: db !TRACKCOMMAND_FF_EndTrack

SFX_32_SEGMENT_1410:
#_0CC61C: #_1410: db !TRACKCOMMAND_F9_FineTune, $20

SFX_32_SEGMENT_1412:
#_0CC61E: #_1412: db $70 ; vol 0x10
#_0CC61F: #_1413: db !TRACKCOMMAND_F0_SetADSR, $91, $EA
#_0CC622: #_1416: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CC624: #_1418: db !TRACKCOMMAND_F2_SetPan, $50
#_0CC626: #_141A: db $82 ; dur 0x02
#_0CC627: #_141B: db Gs2
#_0CC628: #_141C: db !TRACKCOMMAND_FC_FadeOut
#_0CC629: #_141D: db !TRACKCOMMAND_F4_SetLoop_B, $28
#_0CC62B: #_141F: db E2
#_0CC62C: #_1420: db As2
#_0CC62D: #_1421: db Fs2
#_0CC62E: #_1422: db F2
#_0CC62F: #_1423: db G2
#_0CC630: #_1424: db Ds2
#_0CC631: #_1425: db A2
#_0CC632: #_1426: db Fs2
#_0CC633: #_1427: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC634: #_1428: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_33:
#_0CC635: #_1429: db !MUS_CHANNEL_4 : dw SFX_33_SEGMENT_1436
#_0CC638: #_142C: db !MUS_CHANNEL_5 : dw SFX_33_SEGMENT_143C
#_0CC63B: #_142F: db !MUS_CHANNEL_6 : dw SFX_33_SEGMENT_14FF
#_0CC63E: #_1432: db !MUS_CHANNEL_7 : dw SFX_33_SEGMENT_1505
#_0CC641: #_1435: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_33_SEGMENT_1436:
#_0CC642: #_1436: db $74 ; vol 0x14
#_0CC643: #_1437: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC645: #_1439: db !TRACKCOMMAND_F8_Goto_X : dw SFX_33_SEGMENT_143D

SFX_33_SEGMENT_143C:
#_0CC648: #_143C: db $64 ; vol 0x04

SFX_33_SEGMENT_143D:
#_0CC649: #_143D: db !TRACKCOMMAND_F0_SetADSR, $FA, $E0
#_0CC64C: #_1440: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC64E: #_1442: db !TRACKCOMMAND_E3_PitchBend, $7F
#_0CC650: #_1444: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC652: #_1446: db $81 ; dur 0x01
#_0CC653: #_1447: db Fs3
#_0CC654: #_1448: db !TRACKCOMMAND_FC_FadeOut
#_0CC655: #_1449: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14E9
#_0CC658: #_144C: db $8A ; dur 0x0A
#_0CC659: #_144D: db TIE
#_0CC65A: #_144E: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14F4
#_0CC65D: #_1451: db $89 ; dur 0x09
#_0CC65E: #_1452: db TIE
#_0CC65F: #_1453: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14E9
#_0CC662: #_1456: db $88 ; dur 0x08
#_0CC663: #_1457: db TIE
#_0CC664: #_1458: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14F4
#_0CC667: #_145B: db $88 ; dur 0x08
#_0CC668: #_145C: db TIE
#_0CC669: #_145D: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14E9
#_0CC66C: #_1460: db $86 ; dur 0x06
#_0CC66D: #_1461: db TIE
#_0CC66E: #_1462: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14F4
#_0CC671: #_1465: db $86 ; dur 0x06
#_0CC672: #_1466: db TIE
#_0CC673: #_1467: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14E9
#_0CC676: #_146A: db $84 ; dur 0x04
#_0CC677: #_146B: db TIE
#_0CC678: #_146C: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14F4
#_0CC67B: #_146F: db $84 ; dur 0x04
#_0CC67C: #_1470: db TIE
#_0CC67D: #_1471: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14E9
#_0CC680: #_1474: db $82 ; dur 0x02
#_0CC681: #_1475: db TIE
#_0CC682: #_1476: db !TRACKCOMMAND_F6_CallSub_B : dw SFX_33_SEGMENT_14F4
#_0CC685: #_1479: db $82 ; dur 0x02
#_0CC686: #_147A: db TIE
#_0CC687: #_147B: db Fs3
#_0CC688: #_147C: db G3
#_0CC689: #_147D: db A3
#_0CC68A: #_147E: db As3
#_0CC68B: #_147F: db B3
#_0CC68C: #_1480: db Cs4
#_0CC68D: #_1481: db D4
#_0CC68E: #_1482: db D4
#_0CC68F: #_1483: db Cs4
#_0CC690: #_1484: db B3
#_0CC691: #_1485: db As3
#_0CC692: #_1486: db A3
#_0CC693: #_1487: db G3
#_0CC694: #_1488: db Fs3
#_0CC695: #_1489: db Fs3
#_0CC696: #_148A: db G3
#_0CC697: #_148B: db A3
#_0CC698: #_148C: db B3
#_0CC699: #_148D: db Cs4
#_0CC69A: #_148E: db D4
#_0CC69B: #_148F: db D4
#_0CC69C: #_1490: db Cs4
#_0CC69D: #_1491: db B3
#_0CC69E: #_1492: db A3
#_0CC69F: #_1493: db G3
#_0CC6A0: #_1494: db Fs3
#_0CC6A1: #_1495: db Fs3
#_0CC6A2: #_1496: db Gs3
#_0CC6A3: #_1497: db As3
#_0CC6A4: #_1498: db C4
#_0CC6A5: #_1499: db D4
#_0CC6A6: #_149A: db D4
#_0CC6A7: #_149B: db C4
#_0CC6A8: #_149C: db As3
#_0CC6A9: #_149D: db Gs3
#_0CC6AA: #_149E: db Fs3
#_0CC6AB: #_149F: db $81 ; dur 0x01
#_0CC6AC: #_14A0: db Fs3
#_0CC6AD: #_14A1: db G3
#_0CC6AE: #_14A2: db Gs3
#_0CC6AF: #_14A3: db A3
#_0CC6B0: #_14A4: db As3
#_0CC6B1: #_14A5: db B3
#_0CC6B2: #_14A6: db C4
#_0CC6B3: #_14A7: db Cs4
#_0CC6B4: #_14A8: db D4
#_0CC6B5: #_14A9: db D4
#_0CC6B6: #_14AA: db Cs4
#_0CC6B7: #_14AB: db C4
#_0CC6B8: #_14AC: db B3
#_0CC6B9: #_14AD: db As3
#_0CC6BA: #_14AE: db A3
#_0CC6BB: #_14AF: db Gs3
#_0CC6BC: #_14B0: db G3
#_0CC6BD: #_14B1: db Fs3
#_0CC6BE: #_14B2: db Fs3
#_0CC6BF: #_14B3: db G3
#_0CC6C0: #_14B4: db Gs3
#_0CC6C1: #_14B5: db A3
#_0CC6C2: #_14B6: db B3
#_0CC6C3: #_14B7: db C4
#_0CC6C4: #_14B8: db Cs4
#_0CC6C5: #_14B9: db D4
#_0CC6C6: #_14BA: db D4
#_0CC6C7: #_14BB: db Cs4
#_0CC6C8: #_14BC: db C4
#_0CC6C9: #_14BD: db B3
#_0CC6CA: #_14BE: db A3
#_0CC6CB: #_14BF: db Gs3
#_0CC6CC: #_14C0: db G3
#_0CC6CD: #_14C1: db Fs3
#_0CC6CE: #_14C2: db Fs3
#_0CC6CF: #_14C3: db G3
#_0CC6D0: #_14C4: db A3
#_0CC6D1: #_14C5: db As3
#_0CC6D2: #_14C6: db B3
#_0CC6D3: #_14C7: db Cs4
#_0CC6D4: #_14C8: db D4
#_0CC6D5: #_14C9: db D4
#_0CC6D6: #_14CA: db Cs4
#_0CC6D7: #_14CB: db B3
#_0CC6D8: #_14CC: db As3
#_0CC6D9: #_14CD: db A3
#_0CC6DA: #_14CE: db G3
#_0CC6DB: #_14CF: db Fs3
#_0CC6DC: #_14D0: db Fs3
#_0CC6DD: #_14D1: db G3
#_0CC6DE: #_14D2: db A3
#_0CC6DF: #_14D3: db As3
#_0CC6E0: #_14D4: db C4
#_0CC6E1: #_14D5: db Cs4
#_0CC6E2: #_14D6: db D4
#_0CC6E3: #_14D7: db Cs4
#_0CC6E4: #_14D8: db B3
#_0CC6E5: #_14D9: db As3
#_0CC6E6: #_14DA: db Gs3
#_0CC6E7: #_14DB: db G3

SFX_33_SEGMENT_14DC:
#_0CC6E8: #_14DC: db Fs3
#_0CC6E9: #_14DD: db Gs3
#_0CC6EA: #_14DE: db As3
#_0CC6EB: #_14DF: db C4
#_0CC6EC: #_14E0: db D4
#_0CC6ED: #_14E1: db D4
#_0CC6EE: #_14E2: db C4
#_0CC6EF: #_14E3: db As3
#_0CC6F0: #_14E4: db Gs3
#_0CC6F1: #_14E5: db Fs3
#_0CC6F2: #_14E6: db !TRACKCOMMAND_F8_Goto_X : dw SFX_33_SEGMENT_14DC

SFX_33_SEGMENT_14E9:
#_0CC6F5: #_14E9: db $82 ; dur 0x02
#_0CC6F6: #_14EA: db Fs3
#_0CC6F7: #_14EB: db G3
#_0CC6F8: #_14EC: db Gs3
#_0CC6F9: #_14ED: db A3
#_0CC6FA: #_14EE: db As3
#_0CC6FB: #_14EF: db B3
#_0CC6FC: #_14F0: db C4
#_0CC6FD: #_14F1: db Cs4
#_0CC6FE: #_14F2: db D4
#_0CC6FF: #_14F3: db !TRACKCOMMAND_F7_Return_B

SFX_33_SEGMENT_14F4:
#_0CC700: #_14F4: db $82 ; dur 0x02
#_0CC701: #_14F5: db D4
#_0CC702: #_14F6: db Cs4
#_0CC703: #_14F7: db C4
#_0CC704: #_14F8: db B3
#_0CC705: #_14F9: db As3
#_0CC706: #_14FA: db A3
#_0CC707: #_14FB: db Gs3
#_0CC708: #_14FC: db G3
#_0CC709: #_14FD: db Fs3
#_0CC70A: #_14FE: db !TRACKCOMMAND_F7_Return_B

SFX_33_SEGMENT_14FF:
#_0CC70B: #_14FF: db $70 ; vol 0x10
#_0CC70C: #_1500: db !TRACKCOMMAND_F3_Transpose, -7
#_0CC70E: #_1502: db !TRACKCOMMAND_F8_Goto_X : dw SFX_33_SEGMENT_143D

SFX_33_SEGMENT_1505:
#_0CC711: #_1505: db $70 ; vol 0x10
#_0CC712: #_1506: db !TRACKCOMMAND_F3_Transpose, -5
#_0CC714: #_1508: db !TRACKCOMMAND_F8_Goto_X : dw SFX_33_SEGMENT_143D

;===================================================================================================
; 
;===================================================================================================
SFX_34:
#_0CC717: #_150B: db !MUS_CHANNEL_4 : dw SFX_34_SEGMENT_1518
#_0CC71A: #_150E: db !MUS_CHANNEL_5 : dw SFX_34_SEGMENT_151E
#_0CC71D: #_1511: db !MUS_CHANNEL_6 : dw SFX_34_SEGMENT_1524
#_0CC720: #_1514: db !MUS_CHANNEL_7 : dw SFX_34_SEGMENT_152A
#_0CC723: #_1517: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_34_SEGMENT_1518:
#_0CC724: #_1518: db $78 ; vol 0x18
#_0CC725: #_1519: db !TRACKCOMMAND_F3_Transpose, 2
#_0CC727: #_151B: db !TRACKCOMMAND_F8_Goto_X : dw SFX_34_SEGMENT_152B

SFX_34_SEGMENT_151E:
#_0CC72A: #_151E: db $68 ; vol 0x08
#_0CC72B: #_151F: db !TRACKCOMMAND_F3_Transpose, 4
#_0CC72D: #_1521: db !TRACKCOMMAND_F8_Goto_X : dw SFX_34_SEGMENT_152B

SFX_34_SEGMENT_1524:
#_0CC730: #_1524: db $64 ; vol 0x04
#_0CC731: #_1525: db !TRACKCOMMAND_F3_Transpose, 5
#_0CC733: #_1527: db !TRACKCOMMAND_F8_Goto_X : dw SFX_34_SEGMENT_152B

SFX_34_SEGMENT_152A:
#_0CC736: #_152A: db $74 ; vol 0x14

SFX_34_SEGMENT_152B:
#_0CC737: #_152B: db !TRACKCOMMAND_F0_SetADSR, $FF, $E2
#_0CC73A: #_152E: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC73C: #_1530: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC73E: #_1532: db $82 ; dur 0x02
#_0CC73F: #_1533: db C4
#_0CC740: #_1534: db Gs3
#_0CC741: #_1535: db E3
#_0CC742: #_1536: db !TRACKCOMMAND_E3_PitchBend, $20
#_0CC744: #_1538: db $8E ; dur 0x0E
#_0CC745: #_1539: db C3
#_0CC746: #_153A: db TIE
#_0CC747: #_153B: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
SFX_35:
#_0CC748: #_153C: db !MUS_CHANNEL_4 : dw SFX_35_SEGMENT_0E2C
#_0CC74B: #_153F: db !MUS_CHANNEL_5 : dw SFX_35_SEGMENT_0E2C
#_0CC74E: #_1542: db !MUS_CHANNEL_6 : dw SFX_35_SEGMENT_1555
#_0CC751: #_1545: db !MUS_CHANNEL_7 : dw SFX_35_SEGMENT_155B
#_0CC754: #_1548: db !HEADERCOMMAND_FF_LAST_CHANNEL

SFX_35_UNUSED_SEGMENT_1549: ; unused segment
#_0CC755: #_1549: db $78 ; vol 0x18
#_0CC756: #_154A: db !TRACKCOMMAND_F3_Transpose, 2
#_0CC758: #_154C: db !TRACKCOMMAND_F8_Goto_X : dw SFX_35_SEGMENT_155C

SFX_35_UNUSED_SEGMENT_154F: ; unused segment
#_0CC75B: #_154F: db $68 ; vol 0x08
#_0CC75C: #_1550: db !TRACKCOMMAND_F3_Transpose, 4
#_0CC75E: #_1552: db !TRACKCOMMAND_F8_Goto_X : dw SFX_35_SEGMENT_155C

SFX_35_SEGMENT_1555:
#_0CC761: #_1555: db $64 ; vol 0x04
#_0CC762: #_1556: db !TRACKCOMMAND_F3_Transpose, 5
#_0CC764: #_1558: db !TRACKCOMMAND_F8_Goto_X : dw SFX_35_SEGMENT_155C

SFX_35_SEGMENT_155B:
#_0CC767: #_155B: db $74 ; vol 0x14

SFX_35_SEGMENT_155C:
#_0CC768: #_155C: db !TRACKCOMMAND_F0_SetADSR, $FF, $E2
#_0CC76B: #_155F: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC76D: #_1561: db !TRACKCOMMAND_F2_SetPan, $30
#_0CC76F: #_1563: db !TRACKCOMMAND_E3_PitchBend, $81
#_0CC771: #_1565: db $84 ; dur 0x04
#_0CC772: #_1566: db E4
#_0CC773: #_1567: db E4
#_0CC774: #_1568: db E4
#_0CC775: #_1569: db E4
#_0CC776: #_156A: db $94 ; dur 0x14
#_0CC777: #_156B: db E4
#_0CC778: #_156C: db E4
#_0CC779: #_156D: db $85 ; dur 0x05
#_0CC77A: #_156E: db E4
#_0CC77B: #_156F: db $A4 ; dur 0x24
#_0CC77C: #_1570: db E4
#_0CC77D: #_1571: db $86 ; dur 0x06
#_0CC77E: #_1572: db E4
#_0CC77F: #_1573: db $96 ; dur 0x16
#_0CC780: #_1574: db E4
#_0CC781: #_1575: db $87 ; dur 0x07
#_0CC782: #_1576: db E4
#_0CC783: #_1577: db $88 ; dur 0x08
#_0CC784: #_1578: db E4
#_0CC785: #_1579: db $89 ; dur 0x09
#_0CC786: #_157A: db E4
#_0CC787: #_157B: db $8A ; dur 0x0A
#_0CC788: #_157C: db E4
#_0CC789: #_157D: db $8B ; dur 0x0B
#_0CC78A: #_157E: db E4
#_0CC78B: #_157F: db $8C ; dur 0x0C
#_0CC78C: #_1580: db E4
#_0CC78D: #_1581: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
Song_38_DemonAppears:
#_0CC78E: #_1582: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC790: #_1584: db !MUS_CHANNEL_0 : dw Song_DemonAppears_SEGMENT_159D
#_0CC793: #_1587: db !MUS_CHANNEL_1 : dw Song_DemonAppears_SEGMENT_15B3
#_0CC796: #_158A: db !MUS_CHANNEL_2 : dw Song_DemonAppears_SEGMENT_15B9
#_0CC799: #_158D: db !MUS_CHANNEL_3 : dw Song_DemonAppears_SEGMENT_15CF
#_0CC79C: #_1590: db !MUS_CHANNEL_4 : dw Song_DemonAppears_SEGMENT_15E7
#_0CC79F: #_1593: db !MUS_CHANNEL_5 : dw Song_DemonAppears_SEGMENT_15E8
#_0CC7A2: #_1596: db !MUS_CHANNEL_6 : dw Song_DemonAppears_SEGMENT_15E9
#_0CC7A5: #_1599: db !MUS_CHANNEL_7 : dw Song_DemonAppears_SEGMENT_15FF
#_0CC7A8: #_159C: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_DemonAppears_SEGMENT_159D:
#_0CC7A9: #_159D: db $72 ; vol 0x12

Song_DemonAppears_SEGMENT_159E:
#_0CC7AA: #_159E: db !TRACKCOMMAND_F0_SetADSR, $F0, $EA
#_0CC7AD: #_15A1: db !TRACKCOMMAND_F1_SetSRCN, $05
#_0CC7AF: #_15A3: db !TRACKCOMMAND_F2_SetPan, $66
#_0CC7B1: #_15A5: db !TRACKCOMMAND_F3_Transpose, -5
#_0CC7B3: #_15A7: db $8E ; dur 0x0E

Song_DemonAppears_SEGMENT_15A8:
#_0CC7B4: #_15A8: db As4
#_0CC7B5: #_15A9: db TIE
#_0CC7B6: #_15AA: db TIE
#_0CC7B7: #_15AB: db TIE
#_0CC7B8: #_15AC: db A4
#_0CC7B9: #_15AD: db TIE
#_0CC7BA: #_15AE: db TIE
#_0CC7BB: #_15AF: db TIE
#_0CC7BC: #_15B0: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15A8

Song_DemonAppears_SEGMENT_15B3:
#_0CC7BF: #_15B3: db $61 ; vol 0x01
#_0CC7C0: #_15B4: db !TRACKCOMMAND_F9_FineTune, $20
#_0CC7C2: #_15B6: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159E

Song_DemonAppears_SEGMENT_15B9:
#_0CC7C5: #_15B9: db $70 ; vol 0x10
#_0CC7C6: #_15BA: db !TRACKCOMMAND_F0_SetADSR, $F0, $EA
#_0CC7C9: #_15BD: db !TRACKCOMMAND_F1_SetSRCN, $05
#_0CC7CB: #_15BF: db !TRACKCOMMAND_F2_SetPan, $66
#_0CC7CD: #_15C1: db !TRACKCOMMAND_F3_Transpose, -5
#_0CC7CF: #_15C3: db $8E ; dur 0x0E

Song_DemonAppears_SEGMENT_15C4:
#_0CC7D0: #_15C4: db G4
#_0CC7D1: #_15C5: db TIE
#_0CC7D2: #_15C6: db TIE
#_0CC7D3: #_15C7: db TIE
#_0CC7D4: #_15C8: db F4
#_0CC7D5: #_15C9: db TIE
#_0CC7D6: #_15CA: db TIE
#_0CC7D7: #_15CB: db TIE
#_0CC7D8: #_15CC: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15C4

Song_DemonAppears_SEGMENT_15CF:
#_0CC7DB: #_15CF: db $70 ; vol 0x10
#_0CC7DC: #_15D0: db !TRACKCOMMAND_F0_SetADSR, $F0, $EA
#_0CC7DF: #_15D3: db !TRACKCOMMAND_F1_SetSRCN, $05
#_0CC7E1: #_15D5: db !TRACKCOMMAND_F2_SetPan, $66
#_0CC7E3: #_15D7: db !TRACKCOMMAND_F3_Transpose, -5
#_0CC7E5: #_15D9: db !TRACKCOMMAND_E8_SetVibrato, $02
#_0CC7E7: #_15DB: db $8E ; dur 0x0E

Song_DemonAppears_SEGMENT_15DC:
#_0CC7E8: #_15DC: db Ds4
#_0CC7E9: #_15DD: db TIE
#_0CC7EA: #_15DE: db TIE
#_0CC7EB: #_15DF: db TIE
#_0CC7EC: #_15E0: db D4
#_0CC7ED: #_15E1: db TIE
#_0CC7EE: #_15E2: db TIE
#_0CC7EF: #_15E3: db TIE
#_0CC7F0: #_15E4: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15DC

Song_DemonAppears_SEGMENT_15E7:
#_0CC7F3: #_15E7: db !TRACKCOMMAND_FF_EndTrack

Song_DemonAppears_SEGMENT_15E8:
#_0CC7F4: #_15E8: db !TRACKCOMMAND_FF_EndTrack

Song_DemonAppears_SEGMENT_15E9:
#_0CC7F5: #_15E9: db $70 ; vol 0x10
#_0CC7F6: #_15EA: db !TRACKCOMMAND_F0_SetADSR, $FF, $F2
#_0CC7F9: #_15ED: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC7FB: #_15EF: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CC7FD: #_15F1: db !TRACKCOMMAND_F3_Transpose, 7
#_0CC7FF: #_15F3: db $88 ; dur 0x08

Song_DemonAppears_SEGMENT_15F4:
#_0CC800: #_15F4: db !TRACKCOMMAND_F4_SetLoop_B, $20
#_0CC802: #_15F6: db C3
#_0CC803: #_15F7: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC804: #_15F8: db !TRACKCOMMAND_F4_SetLoop_B, $20
#_0CC806: #_15FA: db D3
#_0CC807: #_15FB: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC808: #_15FC: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15F4

Song_DemonAppears_SEGMENT_15FF:
#_0CC80B: #_15FF: db $70 ; vol 0x10
#_0CC80C: #_1600: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC80F: #_1603: db !TRACKCOMMAND_F2_SetPan, $44
#_0CC811: #_1605: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC813: #_1607: db $8A ; dur 0x0A

Song_DemonAppears_SEGMENT_1608:
#_0CC814: #_1608: db C4
#_0CC815: #_1609: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_1608

;===================================================================================================
; 
;===================================================================================================
Song_39_DemonAppears:
#_0CC818: #_160C: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC819: #_160D: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC81B: #_160F: db !MUS_CHANNEL_0 : dw Song_39_DemonAppears_SEGMENT_1628
#_0CC81E: #_1612: db !MUS_CHANNEL_1 : dw Song_39_DemonAppears_SEGMENT_162D
#_0CC821: #_1615: db !MUS_CHANNEL_2 : dw Song_39_DemonAppears_SEGMENT_1632
#_0CC824: #_1618: db !MUS_CHANNEL_3 : dw Song_39_DemonAppears_SEGMENT_1637
#_0CC827: #_161B: db !MUS_CHANNEL_4 : dw Song_39_DemonAppears_SEGMENT_163C
#_0CC82A: #_161E: db !MUS_CHANNEL_5 : dw Song_39_DemonAppears_SEGMENT_1650
#_0CC82D: #_1621: db !MUS_CHANNEL_6 : dw Song_39_DemonAppears_SEGMENT_1660
#_0CC830: #_1624: db !MUS_CHANNEL_7 : dw Song_39_DemonAppears_SEGMENT_1665
#_0CC833: #_1627: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_39_DemonAppears_SEGMENT_1628:
#_0CC834: #_1628: db $8B ; dur 0x0B
#_0CC835: #_1629: db R
#_0CC836: #_162A: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_39_DemonAppears_SEGMENT_162D:
#_0CC839: #_162D: db $8B ; dur 0x0B
#_0CC83A: #_162E: db R
#_0CC83B: #_162F: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_39_DemonAppears_SEGMENT_1632:
#_0CC83E: #_1632: db $8B ; dur 0x0B
#_0CC83F: #_1633: db R
#_0CC840: #_1634: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_39_DemonAppears_SEGMENT_1637:
#_0CC843: #_1637: db $8B ; dur 0x0B
#_0CC844: #_1638: db R
#_0CC845: #_1639: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_39_DemonAppears_SEGMENT_163C:
#_0CC848: #_163C: db $70 ; vol 0x10
#_0CC849: #_163D: db !TRACKCOMMAND_F0_SetADSR, $FF, $F2
#_0CC84C: #_1640: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC84E: #_1642: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC850: #_1644: db $82 ; dur 0x02
#_0CC851: #_1645: db $50 ; Noise 0x10
#_0CC852: #_1646: db $53 ; Noise 0x13
#_0CC853: #_1647: db $4E ; Noise 0x0E
#_0CC854: #_1648: db $50 ; Noise 0x10
#_0CC855: #_1649: db $54 ; Noise 0x14
#_0CC856: #_164A: db $56 ; Noise 0x16
#_0CC857: #_164B: db $51 ; Noise 0x11
#_0CC858: #_164C: db $53 ; Noise 0x13
#_0CC859: #_164D: db $8E ; dur 0x0E
#_0CC85A: #_164E: db $5C ; Noise 0x1C
#_0CC85B: #_164F: db !TRACKCOMMAND_FF_EndTrack

Song_39_DemonAppears_SEGMENT_1650:
#_0CC85C: #_1650: db $70 ; vol 0x10
#_0CC85D: #_1651: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC860: #_1654: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC862: #_1656: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC864: #_1658: db $84 ; dur 0x04
#_0CC865: #_1659: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CC867: #_165B: db A2
#_0CC868: #_165C: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CC869: #_165D: db $8E ; dur 0x0E
#_0CC86A: #_165E: db A2
#_0CC86B: #_165F: db !TRACKCOMMAND_FF_EndTrack

Song_39_DemonAppears_SEGMENT_1660:
#_0CC86C: #_1660: db $8B ; dur 0x0B
#_0CC86D: #_1661: db R
#_0CC86E: #_1662: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_39_DemonAppears_SEGMENT_1665:
#_0CC871: #_1665: db $8B ; dur 0x0B
#_0CC872: #_1666: db R
#_0CC873: #_1667: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_3A_DemonAppears:
#_0CC876: #_166A: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC877: #_166B: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC879: #_166D: db !MUS_CHANNEL_0 : dw Song_3A_DemonAppears_SEGMENT_1686
#_0CC87C: #_1670: db !MUS_CHANNEL_1 : dw Song_3A_DemonAppears_SEGMENT_168B
#_0CC87F: #_1673: db !MUS_CHANNEL_2 : dw Song_3A_DemonAppears_SEGMENT_1690
#_0CC882: #_1676: db !MUS_CHANNEL_3 : dw Song_3A_DemonAppears_SEGMENT_1695
#_0CC885: #_1679: db !MUS_CHANNEL_4 : dw Song_3A_DemonAppears_SEGMENT_169A
#_0CC888: #_167C: db !MUS_CHANNEL_5 : dw Song_3A_DemonAppears_SEGMENT_16A5
#_0CC88B: #_167F: db !MUS_CHANNEL_6 : dw Song_3A_DemonAppears_SEGMENT_16B0
#_0CC88E: #_1682: db !MUS_CHANNEL_7 : dw Song_3A_DemonAppears_SEGMENT_16B5
#_0CC891: #_1685: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_3A_DemonAppears_SEGMENT_1686:
#_0CC892: #_1686: db $8B ; dur 0x0B
#_0CC893: #_1687: db R
#_0CC894: #_1688: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_3A_DemonAppears_SEGMENT_168B:
#_0CC897: #_168B: db $8B ; dur 0x0B
#_0CC898: #_168C: db R
#_0CC899: #_168D: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_3A_DemonAppears_SEGMENT_1690:
#_0CC89C: #_1690: db $8B ; dur 0x0B
#_0CC89D: #_1691: db R
#_0CC89E: #_1692: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_3A_DemonAppears_SEGMENT_1695:
#_0CC8A1: #_1695: db $8B ; dur 0x0B
#_0CC8A2: #_1696: db R
#_0CC8A3: #_1697: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_3A_DemonAppears_SEGMENT_169A:
#_0CC8A6: #_169A: db $70 ; vol 0x10
#_0CC8A7: #_169B: db !TRACKCOMMAND_F0_SetADSR, $F1, $E0
#_0CC8AA: #_169E: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC8AC: #_16A0: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC8AE: #_16A2: db $8C ; dur 0x0C
#_0CC8AF: #_16A3: db $5C ; Noise 0x1C
#_0CC8B0: #_16A4: db !TRACKCOMMAND_FF_EndTrack

Song_3A_DemonAppears_SEGMENT_16A5:
#_0CC8B1: #_16A5: db $70 ; vol 0x10
#_0CC8B2: #_16A6: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC8B5: #_16A9: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CC8B7: #_16AB: db !TRACKCOMMAND_F2_SetPan, $00
#_0CC8B9: #_16AD: db $86 ; dur 0x06
#_0CC8BA: #_16AE: db E3
#_0CC8BB: #_16AF: db !TRACKCOMMAND_FF_EndTrack

Song_3A_DemonAppears_SEGMENT_16B0:
#_0CC8BC: #_16B0: db $8B ; dur 0x0B
#_0CC8BD: #_16B1: db R
#_0CC8BE: #_16B2: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_3A_DemonAppears_SEGMENT_16B5:
#_0CC8C1: #_16B5: db $8B ; dur 0x0B
#_0CC8C2: #_16B6: db R
#_0CC8C3: #_16B7: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_3B_DemonAppears:
#_0CC8C6: #_16BA: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC8C7: #_16BB: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC8C9: #_16BD: db !MUS_CHANNEL_0 : dw Song_3B_DemonAppears_SEGMENT_16D6
#_0CC8CC: #_16C0: db !MUS_CHANNEL_1 : dw Song_3B_DemonAppears_SEGMENT_16DB
#_0CC8CF: #_16C3: db !MUS_CHANNEL_2 : dw Song_3B_DemonAppears_SEGMENT_16E0
#_0CC8D2: #_16C6: db !MUS_CHANNEL_3 : dw Song_3B_DemonAppears_SEGMENT_16E5
#_0CC8D5: #_16C9: db !MUS_CHANNEL_4 : dw Song_3B_DemonAppears_SEGMENT_16EA
#_0CC8D8: #_16CC: db !MUS_CHANNEL_5 : dw Song_3B_DemonAppears_SEGMENT_16EB
#_0CC8DB: #_16CF: db !MUS_CHANNEL_6 : dw Song_3B_DemonAppears_SEGMENT_16FC
#_0CC8DE: #_16D2: db !MUS_CHANNEL_7 : dw Song_3B_DemonAppears_SEGMENT_1701
#_0CC8E1: #_16D5: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_3B_DemonAppears_SEGMENT_16D6:
#_0CC8E2: #_16D6: db $8B ; dur 0x0B
#_0CC8E3: #_16D7: db R
#_0CC8E4: #_16D8: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_3B_DemonAppears_SEGMENT_16DB:
#_0CC8E7: #_16DB: db $8B ; dur 0x0B
#_0CC8E8: #_16DC: db R
#_0CC8E9: #_16DD: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_3B_DemonAppears_SEGMENT_16E0:
#_0CC8EC: #_16E0: db $8B ; dur 0x0B
#_0CC8ED: #_16E1: db R
#_0CC8EE: #_16E2: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_3B_DemonAppears_SEGMENT_16E5:
#_0CC8F1: #_16E5: db $8B ; dur 0x0B
#_0CC8F2: #_16E6: db R
#_0CC8F3: #_16E7: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_3B_DemonAppears_SEGMENT_16EA:
#_0CC8F6: #_16EA: db !TRACKCOMMAND_FF_EndTrack

Song_3B_DemonAppears_SEGMENT_16EB:
#_0CC8F7: #_16EB: db $70 ; vol 0x10
#_0CC8F8: #_16EC: db !TRACKCOMMAND_F0_SetADSR, $FF, $F0
#_0CC8FB: #_16EF: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC8FD: #_16F1: db !TRACKCOMMAND_F2_SetPan, $60
#_0CC8FF: #_16F3: db $84 ; dur 0x04
#_0CC900: #_16F4: db $5C ; Noise 0x1C
#_0CC901: #_16F5: db R
#_0CC902: #_16F6: db $82 ; dur 0x02
#_0CC903: #_16F7: db $5A ; Noise 0x1A
#_0CC904: #_16F8: db $5B ; Noise 0x1B
#_0CC905: #_16F9: db $8E ; dur 0x0E
#_0CC906: #_16FA: db $5D ; Noise 0x1D
#_0CC907: #_16FB: db !TRACKCOMMAND_FF_EndTrack

Song_3B_DemonAppears_SEGMENT_16FC:
#_0CC908: #_16FC: db $8B ; dur 0x0B
#_0CC909: #_16FD: db R
#_0CC90A: #_16FE: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_3B_DemonAppears_SEGMENT_1701:
#_0CC90D: #_1701: db $8B ; dur 0x0B
#_0CC90E: #_1702: db R
#_0CC90F: #_1703: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_3F_DemonAppears:
#_0CC912: #_1706: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC913: #_1707: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC915: #_1709: db !MUS_CHANNEL_0 : dw Song_3F_DemonAppears_SEGMENT_1722
#_0CC918: #_170C: db !MUS_CHANNEL_1 : dw Song_3F_DemonAppears_SEGMENT_1727
#_0CC91B: #_170F: db !MUS_CHANNEL_2 : dw Song_3F_DemonAppears_SEGMENT_172C
#_0CC91E: #_1712: db !MUS_CHANNEL_3 : dw Song_3F_DemonAppears_SEGMENT_1731
#_0CC921: #_1715: db !MUS_CHANNEL_4 : dw Song_3F_DemonAppears_SEGMENT_1736
#_0CC924: #_1718: db !MUS_CHANNEL_5 : dw Song_3F_DemonAppears_SEGMENT_1750
#_0CC927: #_171B: db !MUS_CHANNEL_6 : dw Song_3F_DemonAppears_SEGMENT_1768
#_0CC92A: #_171E: db !MUS_CHANNEL_7 : dw Song_3F_DemonAppears_SEGMENT_176D
#_0CC92D: #_1721: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_3F_DemonAppears_SEGMENT_1722:
#_0CC92E: #_1722: db $8A ; dur 0x0A
#_0CC92F: #_1723: db R
#_0CC930: #_1724: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_3F_DemonAppears_SEGMENT_1727:
#_0CC933: #_1727: db $8A ; dur 0x0A
#_0CC934: #_1728: db R
#_0CC935: #_1729: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_3F_DemonAppears_SEGMENT_172C:
#_0CC938: #_172C: db $8A ; dur 0x0A
#_0CC939: #_172D: db R
#_0CC93A: #_172E: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_3F_DemonAppears_SEGMENT_1731:
#_0CC93D: #_1731: db $8A ; dur 0x0A
#_0CC93E: #_1732: db R
#_0CC93F: #_1733: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_3F_DemonAppears_SEGMENT_1736:
#_0CC942: #_1736: db $68 ; vol 0x08
#_0CC943: #_1737: db !TRACKCOMMAND_F0_SetADSR, $FA, $E0
#_0CC946: #_173A: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC948: #_173C: db !TRACKCOMMAND_F9_FineTune, $30
#_0CC94A: #_173E: db $82 ; dur 0x02
#_0CC94B: #_173F: db C4
#_0CC94C: #_1740: db E4
#_0CC94D: #_1741: db D4
#_0CC94E: #_1742: db Fs4
#_0CC94F: #_1743: db E4
#_0CC950: #_1744: db Gs4
#_0CC951: #_1745: db Fs4
#_0CC952: #_1746: db As4
#_0CC953: #_1747: db Gs4
#_0CC954: #_1748: db C5
#_0CC955: #_1749: db As4
#_0CC956: #_174A: db D5
#_0CC957: #_174B: db C5
#_0CC958: #_174C: db E5
#_0CC959: #_174D: db D5
#_0CC95A: #_174E: db Fs5
#_0CC95B: #_174F: db !TRACKCOMMAND_FF_EndTrack

Song_3F_DemonAppears_SEGMENT_1750:
#_0CC95C: #_1750: db $78 ; vol 0x18
#_0CC95D: #_1751: db !TRACKCOMMAND_F0_SetADSR, $FA, $E0
#_0CC960: #_1754: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CC962: #_1756: db $82 ; dur 0x02
#_0CC963: #_1757: db C4
#_0CC964: #_1758: db E4
#_0CC965: #_1759: db D4
#_0CC966: #_175A: db Fs4
#_0CC967: #_175B: db E4
#_0CC968: #_175C: db Gs4
#_0CC969: #_175D: db Fs4
#_0CC96A: #_175E: db As4
#_0CC96B: #_175F: db Gs4
#_0CC96C: #_1760: db C5
#_0CC96D: #_1761: db As4
#_0CC96E: #_1762: db D5
#_0CC96F: #_1763: db C5
#_0CC970: #_1764: db E5
#_0CC971: #_1765: db D5
#_0CC972: #_1766: db Fs5
#_0CC973: #_1767: db !TRACKCOMMAND_FF_EndTrack

Song_3F_DemonAppears_SEGMENT_1768:
#_0CC974: #_1768: db $8A ; dur 0x0A
#_0CC975: #_1769: db R
#_0CC976: #_176A: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_3F_DemonAppears_SEGMENT_176D:
#_0CC979: #_176D: db $8A ; dur 0x0A
#_0CC97A: #_176E: db R
#_0CC97B: #_176F: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_42_DemonAppears:
#_0CC97E: #_1772: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC97F: #_1773: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC981: #_1775: db !MUS_CHANNEL_0 : dw Song_42_DemonAppears_SEGMENT_178E
#_0CC984: #_1778: db !MUS_CHANNEL_1 : dw Song_42_DemonAppears_SEGMENT_1793
#_0CC987: #_177B: db !MUS_CHANNEL_2 : dw Song_42_DemonAppears_SEGMENT_1798
#_0CC98A: #_177E: db !MUS_CHANNEL_3 : dw Song_42_DemonAppears_SEGMENT_179D
#_0CC98D: #_1781: db !MUS_CHANNEL_4 : dw Song_42_DemonAppears_SEGMENT_17A2
#_0CC990: #_1784: db !MUS_CHANNEL_5 : dw Song_42_DemonAppears_SEGMENT_17A6
#_0CC993: #_1787: db !MUS_CHANNEL_6 : dw Song_42_DemonAppears_SEGMENT_17C3
#_0CC996: #_178A: db !MUS_CHANNEL_7 : dw Song_42_DemonAppears_SEGMENT_17C8
#_0CC999: #_178D: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_42_DemonAppears_SEGMENT_178E:
#_0CC99A: #_178E: db $8A ; dur 0x0A
#_0CC99B: #_178F: db R
#_0CC99C: #_1790: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_42_DemonAppears_SEGMENT_1793:
#_0CC99F: #_1793: db $8A ; dur 0x0A
#_0CC9A0: #_1794: db R
#_0CC9A1: #_1795: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_42_DemonAppears_SEGMENT_1798:
#_0CC9A4: #_1798: db $8A ; dur 0x0A
#_0CC9A5: #_1799: db R
#_0CC9A6: #_179A: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_42_DemonAppears_SEGMENT_179D:
#_0CC9A9: #_179D: db $8A ; dur 0x0A
#_0CC9AA: #_179E: db R
#_0CC9AB: #_179F: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_42_DemonAppears_SEGMENT_17A2:
#_0CC9AE: #_17A2: db !TRACKCOMMAND_F3_Transpose, 1
#_0CC9B0: #_17A4: db !TRACKCOMMAND_F9_FineTune, $20

Song_42_DemonAppears_SEGMENT_17A6:
#_0CC9B2: #_17A6: db $70 ; vol 0x10
#_0CC9B3: #_17A7: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CC9B6: #_17AA: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CC9B8: #_17AC: db !TRACKCOMMAND_F2_SetPan, $20
#_0CC9BA: #_17AE: db $82 ; dur 0x02
#_0CC9BB: #_17AF: db D5
#_0CC9BC: #_17B0: db As4
#_0CC9BD: #_17B1: db Fs4
#_0CC9BE: #_17B2: db D5
#_0CC9BF: #_17B3: db C5
#_0CC9C0: #_17B4: db As4
#_0CC9C1: #_17B5: db Gs4
#_0CC9C2: #_17B6: db Fs4
#_0CC9C3: #_17B7: db E4
#_0CC9C4: #_17B8: db D4
#_0CC9C5: #_17B9: db C4
#_0CC9C6: #_17BA: db As3
#_0CC9C7: #_17BB: db Gs3
#_0CC9C8: #_17BC: db Fs3
#_0CC9C9: #_17BD: db E3
#_0CC9CA: #_17BE: db D3
#_0CC9CB: #_17BF: db C3
#_0CC9CC: #_17C0: db As2
#_0CC9CD: #_17C1: db Gs2
#_0CC9CE: #_17C2: db !TRACKCOMMAND_FF_EndTrack

Song_42_DemonAppears_SEGMENT_17C3:
#_0CC9CF: #_17C3: db $8A ; dur 0x0A
#_0CC9D0: #_17C4: db R
#_0CC9D1: #_17C5: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_42_DemonAppears_SEGMENT_17C8:
#_0CC9D4: #_17C8: db $8A ; dur 0x0A
#_0CC9D5: #_17C9: db R
#_0CC9D6: #_17CA: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_43_DemonAppears:
#_0CC9D9: #_17CD: db !HEADERCOMMAND_F0_RESET_DSP
#_0CC9DA: #_17CE: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CC9DC: #_17D0: db !MUS_CHANNEL_0 : dw Song_43_DemonAppears_SEGMENT_17E9
#_0CC9DF: #_17D3: db !MUS_CHANNEL_1 : dw Song_43_DemonAppears_SEGMENT_17EE
#_0CC9E2: #_17D6: db !MUS_CHANNEL_2 : dw Song_43_DemonAppears_SEGMENT_17F3
#_0CC9E5: #_17D9: db !MUS_CHANNEL_3 : dw Song_43_DemonAppears_SEGMENT_17F8
#_0CC9E8: #_17DC: db !MUS_CHANNEL_4 : dw Song_43_DemonAppears_SEGMENT_17FD
#_0CC9EB: #_17DF: db !MUS_CHANNEL_5 : dw Song_43_DemonAppears_SEGMENT_17FE
#_0CC9EE: #_17E2: db !MUS_CHANNEL_6 : dw Song_43_DemonAppears_SEGMENT_1818
#_0CC9F1: #_17E5: db !MUS_CHANNEL_7 : dw Song_43_DemonAppears_SEGMENT_181D
#_0CC9F4: #_17E8: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_43_DemonAppears_SEGMENT_17E9:
#_0CC9F5: #_17E9: db $8C ; dur 0x0C
#_0CC9F6: #_17EA: db R
#_0CC9F7: #_17EB: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_159D

Song_43_DemonAppears_SEGMENT_17EE:
#_0CC9FA: #_17EE: db $8C ; dur 0x0C
#_0CC9FB: #_17EF: db R
#_0CC9FC: #_17F0: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B3

Song_43_DemonAppears_SEGMENT_17F3:
#_0CC9FF: #_17F3: db $8C ; dur 0x0C
#_0CCA00: #_17F4: db R
#_0CCA01: #_17F5: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15B9

Song_43_DemonAppears_SEGMENT_17F8:
#_0CCA04: #_17F8: db $8C ; dur 0x0C
#_0CCA05: #_17F9: db R
#_0CCA06: #_17FA: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15CF

Song_43_DemonAppears_SEGMENT_17FD:
#_0CCA09: #_17FD: db !TRACKCOMMAND_FF_EndTrack

Song_43_DemonAppears_SEGMENT_17FE:
#_0CCA0A: #_17FE: db $70 ; vol 0x10
#_0CCA0B: #_17FF: db !TRACKCOMMAND_F0_SetADSR, $FF, $EE
#_0CCA0E: #_1802: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CCA10: #_1804: db !TRACKCOMMAND_F2_SetPan, $60
#_0CCA12: #_1806: db $82 ; dur 0x02
#_0CCA13: #_1807: db $5E ; Noise 0x1E
#_0CCA14: #_1808: db $5D ; Noise 0x1D
#_0CCA15: #_1809: db $5C ; Noise 0x1C
#_0CCA16: #_180A: db $5B ; Noise 0x1B
#_0CCA17: #_180B: db $5A ; Noise 0x1A
#_0CCA18: #_180C: db $59 ; Noise 0x19
#_0CCA19: #_180D: db $5E ; Noise 0x1E
#_0CCA1A: #_180E: db $5D ; Noise 0x1D
#_0CCA1B: #_180F: db $5C ; Noise 0x1C
#_0CCA1C: #_1810: db $5B ; Noise 0x1B
#_0CCA1D: #_1811: db $5A ; Noise 0x1A
#_0CCA1E: #_1812: db $59 ; Noise 0x19
#_0CCA1F: #_1813: db $58 ; Noise 0x18
#_0CCA20: #_1814: db $57 ; Noise 0x17
#_0CCA21: #_1815: db $8E ; dur 0x0E
#_0CCA22: #_1816: db $56 ; Noise 0x16
#_0CCA23: #_1817: db !TRACKCOMMAND_FF_EndTrack

Song_43_DemonAppears_SEGMENT_1818:
#_0CCA24: #_1818: db $8C ; dur 0x0C
#_0CCA25: #_1819: db R
#_0CCA26: #_181A: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15E9

Song_43_DemonAppears_SEGMENT_181D:
#_0CCA29: #_181D: db $8C ; dur 0x0C
#_0CCA2A: #_181E: db R
#_0CCA2B: #_181F: db !TRACKCOMMAND_F8_Goto_X : dw Song_DemonAppears_SEGMENT_15FF

;===================================================================================================
; 
;===================================================================================================
Song_61_Battle:
Song_3C_Battle:
#_0CCA2E: #_1822: db !HEADERCOMMAND_F1_SET_CONTROL, $00
#_0CCA30: #_1824: db !MUS_CHANNEL_0 : dw Song_3C_Battle_SEGMENT_183D
#_0CCA33: #_1827: db !MUS_CHANNEL_1 : dw Song_3C_Battle_SEGMENT_19BF
#_0CCA36: #_182A: db !MUS_CHANNEL_4 : dw Song_3C_Battle_SEGMENT_1A08
#_0CCA39: #_182D: db !MUS_CHANNEL_5 : dw Song_3C_Battle_SEGMENT_1A54
#_0CCA3C: #_1830: db !MUS_CHANNEL_2 : dw Song_3C_Battle_SEGMENT_1AA0
#_0CCA3F: #_1833: db !MUS_CHANNEL_3 : dw Song_3C_Battle_SEGMENT_1AA6
#_0CCA42: #_1836: db !MUS_CHANNEL_6 : dw Song_3C_Battle_SEGMENT_1B36
#_0CCA45: #_1839: db !MUS_CHANNEL_7 : dw Song_3C_Battle_SEGMENT_1BC4
#_0CCA48: #_183C: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_3C_Battle_SEGMENT_183D:
#_0CCA49: #_183D: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_183F:
#_0CCA4B: #_183F: db $73 ; vol 0x13
#_0CCA4C: #_1840: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCA4F: #_1843: db !TRACKCOMMAND_F1_SetSRCN, $07
#_0CCA51: #_1845: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CCA53: #_1847: db !TRACKCOMMAND_F3_Transpose, -12
#_0CCA55: #_1849: db !TRACKCOMMAND_F9_FineTune, $10
#_0CCA57: #_184B: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_185A
#_0CCA5A: #_184E: db !TRACKCOMMAND_F2_SetPan, $64
#_0CCA5C: #_1850: db !TRACKCOMMAND_F9_FineTune, $00
#_0CCA5E: #_1852: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1885
#_0CCA61: #_1855: db TIE
#_0CCA62: #_1856: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCA63: #_1857: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_183F

Song_3C_Battle_SEGMENT_185A:
#_0CCA66: #_185A: db $8C ; dur 0x0C
#_0CCA67: #_185B: db E4
#_0CCA68: #_185C: db $8A ; dur 0x0A
#_0CCA69: #_185D: db G4
#_0CCA6A: #_185E: db $86 ; dur 0x06
#_0CCA6B: #_185F: db TIE
#_0CCA6C: #_1860: db TIE
#_0CCA6D: #_1861: db G4
#_0CCA6E: #_1862: db A4
#_0CCA6F: #_1863: db $8C ; dur 0x0C
#_0CCA70: #_1864: db E4
#_0CCA71: #_1865: db $89 ; dur 0x09
#_0CCA72: #_1866: db G4
#_0CCA73: #_1867: db $84 ; dur 0x04
#_0CCA74: #_1868: db TIE
#_0CCA75: #_1869: db TIE
#_0CCA76: #_186A: db $87 ; dur 0x07
#_0CCA77: #_186B: db G4
#_0CCA78: #_186C: db Fs4
#_0CCA79: #_186D: db $86 ; dur 0x06
#_0CCA7A: #_186E: db F4
#_0CCA7B: #_186F: db $8C ; dur 0x0C
#_0CCA7C: #_1870: db E4
#_0CCA7D: #_1871: db $8A ; dur 0x0A
#_0CCA7E: #_1872: db G4
#_0CCA7F: #_1873: db $86 ; dur 0x06
#_0CCA80: #_1874: db TIE
#_0CCA81: #_1875: db TIE
#_0CCA82: #_1876: db G4
#_0CCA83: #_1877: db A4
#_0CCA84: #_1878: db $8C ; dur 0x0C
#_0CCA85: #_1879: db E4
#_0CCA86: #_187A: db $8A ; dur 0x0A
#_0CCA87: #_187B: db TIE
#_0CCA88: #_187C: db $86 ; dur 0x06
#_0CCA89: #_187D: db D4
#_0CCA8A: #_187E: db $84 ; dur 0x04
#_0CCA8B: #_187F: db R
#_0CCA8C: #_1880: db $87 ; dur 0x07
#_0CCA8D: #_1881: db D4
#_0CCA8E: #_1882: db $86 ; dur 0x06
#_0CCA8F: #_1883: db Ds4
#_0CCA90: #_1884: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1885:
#_0CCA91: #_1885: db $70 ; vol 0x10
#_0CCA92: #_1886: db !TRACKCOMMAND_F0_SetADSR, $FF, $E6
#_0CCA95: #_1889: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CCA97: #_188B: db !TRACKCOMMAND_F3_Transpose, 0
#_0CCA99: #_188D: db $81 ; dur 0x01
#_0CCA9A: #_188E: db D5
#_0CCA9B: #_188F: db !TRACKCOMMAND_FC_FadeOut
#_0CCA9C: #_1890: db D5
#_0CCA9D: #_1891: db D5
#_0CCA9E: #_1892: db Ds5
#_0CCA9F: #_1893: db Ds5
#_0CCAA0: #_1894: db E5
#_0CCAA1: #_1895: db E5
#_0CCAA2: #_1896: db !TRACKCOMMAND_FD_FadeOff
#_0CCAA3: #_1897: db $87 ; dur 0x07
#_0CCAA4: #_1898: db TIE
#_0CCAA5: #_1899: db $88 ; dur 0x08
#_0CCAA6: #_189A: db TIE
#_0CCAA7: #_189B: db !TRACKCOMMAND_E3_PitchBend, $F0
#_0CCAA9: #_189D: db $8C ; dur 0x0C
#_0CCAAA: #_189E: db TIE
#_0CCAAB: #_189F: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCAAC: #_18A0: db $84 ; dur 0x04
#_0CCAAD: #_18A1: db B4
#_0CCAAE: #_18A2: db D5
#_0CCAAF: #_18A3: db B4
#_0CCAB0: #_18A4: db A4
#_0CCAB1: #_18A5: db B4
#_0CCAB2: #_18A6: db A4
#_0CCAB3: #_18A7: db G4
#_0CCAB4: #_18A8: db Fs4
#_0CCAB5: #_18A9: db $8A ; dur 0x0A
#_0CCAB6: #_18AA: db E4
#_0CCAB7: #_18AB: db !TRACKCOMMAND_E3_PitchBend, $E0
#_0CCAB9: #_18AD: db $89 ; dur 0x09
#_0CCABA: #_18AE: db TIE
#_0CCABB: #_18AF: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCABC: #_18B0: db $84 ; dur 0x04
#_0CCABD: #_18B1: db E3
#_0CCABE: #_18B2: db F3
#_0CCABF: #_18B3: db E3
#_0CCAC0: #_18B4: db Fs3
#_0CCAC1: #_18B5: db G3
#_0CCAC2: #_18B6: db A3
#_0CCAC3: #_18B7: db B3
#_0CCAC4: #_18B8: db C4
#_0CCAC5: #_18B9: db D4
#_0CCAC6: #_18BA: db E4
#_0CCAC7: #_18BB: db C4
#_0CCAC8: #_18BC: db D4
#_0CCAC9: #_18BD: db E4
#_0CCACA: #_18BE: db Fs4
#_0CCACB: #_18BF: db G4
#_0CCACC: #_18C0: db A4
#_0CCACD: #_18C1: db B4
#_0CCACE: #_18C2: db C5
#_0CCACF: #_18C3: db $84 ; dur 0x04
#_0CCAD0: #_18C4: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCAD2: #_18C6: db A4
#_0CCAD3: #_18C7: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCAD4: #_18C8: db !TRACKCOMMAND_FC_FadeOut
#_0CCAD5: #_18C9: db $87 ; dur 0x07
#_0CCAD6: #_18CA: db B4
#_0CCAD7: #_18CB: db !TRACKCOMMAND_FD_FadeOff
#_0CCAD8: #_18CC: db $88 ; dur 0x08
#_0CCAD9: #_18CD: db D5
#_0CCADA: #_18CE: db $84 ; dur 0x04
#_0CCADB: #_18CF: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCADD: #_18D1: db A4
#_0CCADE: #_18D2: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCADF: #_18D3: db !TRACKCOMMAND_FC_FadeOut
#_0CCAE0: #_18D4: db $87 ; dur 0x07
#_0CCAE1: #_18D5: db B4
#_0CCAE2: #_18D6: db $86 ; dur 0x06
#_0CCAE3: #_18D7: db B4
#_0CCAE4: #_18D8: db !TRACKCOMMAND_FD_FadeOff
#_0CCAE5: #_18D9: db $88 ; dur 0x08
#_0CCAE6: #_18DA: db G5
#_0CCAE7: #_18DB: db $84 ; dur 0x04
#_0CCAE8: #_18DC: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCAEA: #_18DE: db A4
#_0CCAEB: #_18DF: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCAEC: #_18E0: db !TRACKCOMMAND_FC_FadeOut
#_0CCAED: #_18E1: db $87 ; dur 0x07
#_0CCAEE: #_18E2: db B4
#_0CCAEF: #_18E3: db !TRACKCOMMAND_FD_FadeOff
#_0CCAF0: #_18E4: db $86 ; dur 0x06
#_0CCAF1: #_18E5: db D5
#_0CCAF2: #_18E6: db $84 ; dur 0x04
#_0CCAF3: #_18E7: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCAF5: #_18E9: db A4
#_0CCAF6: #_18EA: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCAF7: #_18EB: db !TRACKCOMMAND_FC_FadeOut
#_0CCAF8: #_18EC: db B4
#_0CCAF9: #_18ED: db $84 ; dur 0x04
#_0CCAFA: #_18EE: db !TRACKCOMMAND_E3_PitchBend, $88
#_0CCAFC: #_18F0: db B4
#_0CCAFD: #_18F1: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCAFE: #_18F2: db !TRACKCOMMAND_FC_FadeOut
#_0CCAFF: #_18F3: db A4
#_0CCB00: #_18F4: db !TRACKCOMMAND_FD_FadeOff
#_0CCB01: #_18F5: db $84 ; dur 0x04
#_0CCB02: #_18F6: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCB04: #_18F8: db A4
#_0CCB05: #_18F9: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB06: #_18FA: db !TRACKCOMMAND_FC_FadeOut
#_0CCB07: #_18FB: db B4
#_0CCB08: #_18FC: db $84 ; dur 0x04
#_0CCB09: #_18FD: db !TRACKCOMMAND_E3_PitchBend, $88
#_0CCB0B: #_18FF: db B4
#_0CCB0C: #_1900: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB0D: #_1901: db !TRACKCOMMAND_FC_FadeOut
#_0CCB0E: #_1902: db A4
#_0CCB0F: #_1903: db !TRACKCOMMAND_FD_FadeOff
#_0CCB10: #_1904: db $84 ; dur 0x04
#_0CCB11: #_1905: db !TRACKCOMMAND_E3_PitchBend, $78
#_0CCB13: #_1907: db A4
#_0CCB14: #_1908: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB15: #_1909: db !TRACKCOMMAND_FC_FadeOut
#_0CCB16: #_190A: db $87 ; dur 0x07
#_0CCB17: #_190B: db B4
#_0CCB18: #_190C: db !TRACKCOMMAND_FD_FadeOff
#_0CCB19: #_190D: db $86 ; dur 0x06
#_0CCB1A: #_190E: db G5
#_0CCB1B: #_190F: db B4
#_0CCB1C: #_1910: db $8A ; dur 0x0A
#_0CCB1D: #_1911: db TIE
#_0CCB1E: #_1912: db !TRACKCOMMAND_E3_PitchBend, $E0
#_0CCB20: #_1914: db TIE
#_0CCB21: #_1915: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB22: #_1916: db $84 ; dur 0x04
#_0CCB23: #_1917: db A4
#_0CCB24: #_1918: db B4
#_0CCB25: #_1919: db A4
#_0CCB26: #_191A: db G4
#_0CCB27: #_191B: db A4
#_0CCB28: #_191C: db G4
#_0CCB29: #_191D: db Fs4
#_0CCB2A: #_191E: db !TRACKCOMMAND_E3_PitchBend, $E0
#_0CCB2C: #_1920: db TIE
#_0CCB2D: #_1921: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB2E: #_1922: db $81 ; dur 0x01
#_0CCB2F: #_1923: db A4
#_0CCB30: #_1924: db !TRACKCOMMAND_FC_FadeOut
#_0CCB31: #_1925: db A4
#_0CCB32: #_1926: db A4
#_0CCB33: #_1927: db As4
#_0CCB34: #_1928: db As4
#_0CCB35: #_1929: db B4
#_0CCB36: #_192A: db B4
#_0CCB37: #_192B: db $89 ; dur 0x09
#_0CCB38: #_192C: db C5
#_0CCB39: #_192D: db $8A ; dur 0x0A
#_0CCB3A: #_192E: db C5
#_0CCB3B: #_192F: db $81 ; dur 0x01
#_0CCB3C: #_1930: db B4
#_0CCB3D: #_1931: db As4
#_0CCB3E: #_1932: db A4
#_0CCB3F: #_1933: db Gs4
#_0CCB40: #_1934: db G4
#_0CCB41: #_1935: db Fs4
#_0CCB42: #_1936: db F4
#_0CCB43: #_1937: db !TRACKCOMMAND_FD_FadeOff
#_0CCB44: #_1938: db $84 ; dur 0x04
#_0CCB45: #_1939: db A3
#_0CCB46: #_193A: db B3
#_0CCB47: #_193B: db C4
#_0CCB48: #_193C: db D4
#_0CCB49: #_193D: db E4
#_0CCB4A: #_193E: db Fs4
#_0CCB4B: #_193F: db G4
#_0CCB4C: #_1940: db Fs4
#_0CCB4D: #_1941: db G4
#_0CCB4E: #_1942: db A4
#_0CCB4F: #_1943: db B4
#_0CCB50: #_1944: db A4
#_0CCB51: #_1945: db B4
#_0CCB52: #_1946: db C5
#_0CCB53: #_1947: db D5
#_0CCB54: #_1948: db Ds5
#_0CCB55: #_1949: db !TRACKCOMMAND_E3_PitchBend, $50
#_0CCB57: #_194B: db $86 ; dur 0x06
#_0CCB58: #_194C: db D5
#_0CCB59: #_194D: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB5A: #_194E: db !TRACKCOMMAND_FC_FadeOut
#_0CCB5B: #_194F: db E5
#_0CCB5C: #_1950: db !TRACKCOMMAND_FD_FadeOff
#_0CCB5D: #_1951: db G5
#_0CCB5E: #_1952: db !TRACKCOMMAND_E3_PitchBend, $50
#_0CCB60: #_1954: db $86 ; dur 0x06
#_0CCB61: #_1955: db D5
#_0CCB62: #_1956: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB63: #_1957: db !TRACKCOMMAND_FC_FadeOut
#_0CCB64: #_1958: db $89 ; dur 0x09
#_0CCB65: #_1959: db E5
#_0CCB66: #_195A: db !TRACKCOMMAND_E3_PitchBend, $B0
#_0CCB68: #_195C: db $86 ; dur 0x06
#_0CCB69: #_195D: db E5
#_0CCB6A: #_195E: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB6B: #_195F: db !TRACKCOMMAND_FD_FadeOff
#_0CCB6C: #_1960: db !TRACKCOMMAND_E3_PitchBend, $50
#_0CCB6E: #_1962: db $86 ; dur 0x06
#_0CCB6F: #_1963: db D5
#_0CCB70: #_1964: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB71: #_1965: db !TRACKCOMMAND_FC_FadeOut
#_0CCB72: #_1966: db E5
#_0CCB73: #_1967: db !TRACKCOMMAND_FD_FadeOff
#_0CCB74: #_1968: db $84 ; dur 0x04
#_0CCB75: #_1969: db G5
#_0CCB76: #_196A: db R
#_0CCB77: #_196B: db !TRACKCOMMAND_E3_PitchBend, $6B
#_0CCB79: #_196D: db $86 ; dur 0x06
#_0CCB7A: #_196E: db G5
#_0CCB7B: #_196F: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB7C: #_1970: db !TRACKCOMMAND_FC_FadeOut
#_0CCB7D: #_1971: db A5
#_0CCB7E: #_1972: db !TRACKCOMMAND_FD_FadeOff
#_0CCB7F: #_1973: db G5
#_0CCB80: #_1974: db $84 ; dur 0x04
#_0CCB81: #_1975: db E5
#_0CCB82: #_1976: db G5
#_0CCB83: #_1977: db E5
#_0CCB84: #_1978: db D5
#_0CCB85: #_1979: db $88 ; dur 0x08
#_0CCB86: #_197A: db C5
#_0CCB87: #_197B: db !TRACKCOMMAND_E3_PitchBend, $D0
#_0CCB89: #_197D: db TIE
#_0CCB8A: #_197E: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB8B: #_197F: db $84 ; dur 0x04
#_0CCB8C: #_1980: db C4
#_0CCB8D: #_1981: db D4
#_0CCB8E: #_1982: db E4
#_0CCB8F: #_1983: db Fs4
#_0CCB90: #_1984: db G4
#_0CCB91: #_1985: db A4
#_0CCB92: #_1986: db B4
#_0CCB93: #_1987: db C5
#_0CCB94: #_1988: db $88 ; dur 0x08
#_0CCB95: #_1989: db D5
#_0CCB96: #_198A: db !TRACKCOMMAND_E3_PitchBend, $D0
#_0CCB98: #_198C: db TIE
#_0CCB99: #_198D: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCB9A: #_198E: db $84 ; dur 0x04
#_0CCB9B: #_198F: db E4
#_0CCB9C: #_1990: db Fs4
#_0CCB9D: #_1991: db G4
#_0CCB9E: #_1992: db A4
#_0CCB9F: #_1993: db B4
#_0CCBA0: #_1994: db C5
#_0CCBA1: #_1995: db D5
#_0CCBA2: #_1996: db Ds5
#_0CCBA3: #_1997: db !TRACKCOMMAND_E3_PitchBend, $50
#_0CCBA5: #_1999: db $86 ; dur 0x06
#_0CCBA6: #_199A: db D5
#_0CCBA7: #_199B: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCBA8: #_199C: db !TRACKCOMMAND_FC_FadeOut
#_0CCBA9: #_199D: db E5
#_0CCBAA: #_199E: db !TRACKCOMMAND_FD_FadeOff
#_0CCBAB: #_199F: db $84 ; dur 0x04
#_0CCBAC: #_19A0: db G5
#_0CCBAD: #_19A1: db R
#_0CCBAE: #_19A2: db !TRACKCOMMAND_E3_PitchBend, $6B
#_0CCBB0: #_19A4: db $86 ; dur 0x06
#_0CCBB1: #_19A5: db G5
#_0CCBB2: #_19A6: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCBB3: #_19A7: db !TRACKCOMMAND_FC_FadeOut
#_0CCBB4: #_19A8: db A5
#_0CCBB5: #_19A9: db !TRACKCOMMAND_FD_FadeOff
#_0CCBB6: #_19AA: db $84 ; dur 0x04
#_0CCBB7: #_19AB: db G5
#_0CCBB8: #_19AC: db R
#_0CCBB9: #_19AD: db E5
#_0CCBBA: #_19AE: db G5
#_0CCBBB: #_19AF: db E5
#_0CCBBC: #_19B0: db D5
#_0CCBBD: #_19B1: db E5
#_0CCBBE: #_19B2: db G5
#_0CCBBF: #_19B3: db E5
#_0CCBC0: #_19B4: db D5
#_0CCBC1: #_19B5: db $86 ; dur 0x06
#_0CCBC2: #_19B6: db B4
#_0CCBC3: #_19B7: db $84 ; dur 0x04
#_0CCBC4: #_19B8: db D4
#_0CCBC5: #_19B9: db E5
#_0CCBC6: #_19BA: db $88 ; dur 0x08
#_0CCBC7: #_19BB: db TIE
#_0CCBC8: #_19BC: db !TRACKCOMMAND_E3_PitchBend, $E0
#_0CCBCA: #_19BE: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_19BF:
#_0CCBCB: #_19BF: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_19C1:
#_0CCBCD: #_19C1: db $63 ; vol 0x03
#_0CCBCE: #_19C2: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCBD1: #_19C5: db !TRACKCOMMAND_F1_SetSRCN, $07
#_0CCBD3: #_19C7: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CCBD5: #_19C9: db !TRACKCOMMAND_F3_Transpose, -12
#_0CCBD7: #_19CB: db !TRACKCOMMAND_F9_FineTune, $10
#_0CCBD9: #_19CD: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_19DD
#_0CCBDC: #_19D0: db $87 ; dur 0x07
#_0CCBDD: #_19D1: db R
#_0CCBDE: #_19D2: db !TRACKCOMMAND_F2_SetPan, $6A
#_0CCBE0: #_19D4: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1885
#_0CCBE3: #_19D7: db $84 ; dur 0x04
#_0CCBE4: #_19D8: db TIE
#_0CCBE5: #_19D9: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCBE6: #_19DA: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_19C1

Song_3C_Battle_SEGMENT_19DD:
#_0CCBE9: #_19DD: db $8C ; dur 0x0C
#_0CCBEA: #_19DE: db B3
#_0CCBEB: #_19DF: db $8A ; dur 0x0A
#_0CCBEC: #_19E0: db E4
#_0CCBED: #_19E1: db $86 ; dur 0x06
#_0CCBEE: #_19E2: db TIE
#_0CCBEF: #_19E3: db TIE
#_0CCBF0: #_19E4: db D4
#_0CCBF1: #_19E5: db E4
#_0CCBF2: #_19E6: db $8C ; dur 0x0C
#_0CCBF3: #_19E7: db B3
#_0CCBF4: #_19E8: db $89 ; dur 0x09
#_0CCBF5: #_19E9: db E4
#_0CCBF6: #_19EA: db $84 ; dur 0x04
#_0CCBF7: #_19EB: db TIE
#_0CCBF8: #_19EC: db TIE
#_0CCBF9: #_19ED: db $87 ; dur 0x07
#_0CCBFA: #_19EE: db D4
#_0CCBFB: #_19EF: db Cs4
#_0CCBFC: #_19F0: db $86 ; dur 0x06
#_0CCBFD: #_19F1: db C4
#_0CCBFE: #_19F2: db $8C ; dur 0x0C
#_0CCBFF: #_19F3: db B3
#_0CCC00: #_19F4: db $8A ; dur 0x0A
#_0CCC01: #_19F5: db E4
#_0CCC02: #_19F6: db $86 ; dur 0x06
#_0CCC03: #_19F7: db TIE
#_0CCC04: #_19F8: db TIE
#_0CCC05: #_19F9: db D4
#_0CCC06: #_19FA: db E4
#_0CCC07: #_19FB: db $8C ; dur 0x0C
#_0CCC08: #_19FC: db B3
#_0CCC09: #_19FD: db $8A ; dur 0x0A
#_0CCC0A: #_19FE: db TIE
#_0CCC0B: #_19FF: db $86 ; dur 0x06
#_0CCC0C: #_1A00: db A3
#_0CCC0D: #_1A01: db $84 ; dur 0x04
#_0CCC0E: #_1A02: db R
#_0CCC0F: #_1A03: db $87 ; dur 0x07
#_0CCC10: #_1A04: db A3
#_0CCC11: #_1A05: db $86 ; dur 0x06
#_0CCC12: #_1A06: db As3
#_0CCC13: #_1A07: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1A08:
#_0CCC14: #_1A08: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCC17: #_1A0B: db !TRACKCOMMAND_F1_SetSRCN, $07
#_0CCC19: #_1A0D: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CCC1B: #_1A0F: db !TRACKCOMMAND_F3_Transpose, -12
#_0CCC1D: #_1A11: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_1A13:
#_0CCC1F: #_1A13: db $63 ; vol 0x03
#_0CCC20: #_1A14: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_185A
#_0CCC23: #_1A17: db $61 ; vol 0x01
#_0CCC24: #_1A18: db !TRACKCOMMAND_E6_CallSub_A : dw Song_3C_Battle_SEGMENT_1A1E
#_0CCC27: #_1A1B: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1A13

Song_3C_Battle_SEGMENT_1A1E:
#_0CCC2A: #_1A1E: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_185A
#_0CCC2D: #_1A21: db $8C ; dur 0x0C
#_0CCC2E: #_1A22: db C4
#_0CCC2F: #_1A23: db $8B ; dur 0x0B
#_0CCC30: #_1A24: db D4
#_0CCC31: #_1A25: db $88 ; dur 0x08
#_0CCC32: #_1A26: db Ds4
#_0CCC33: #_1A27: db $86 ; dur 0x06
#_0CCC34: #_1A28: db E4
#_0CCC35: #_1A29: db TIE
#_0CCC36: #_1A2A: db G4
#_0CCC37: #_1A2B: db E4
#_0CCC38: #_1A2C: db TIE
#_0CCC39: #_1A2D: db TIE
#_0CCC3A: #_1A2E: db As4
#_0CCC3B: #_1A2F: db A4
#_0CCC3C: #_1A30: db E4
#_0CCC3D: #_1A31: db TIE
#_0CCC3E: #_1A32: db G4
#_0CCC3F: #_1A33: db E4
#_0CCC40: #_1A34: db TIE
#_0CCC41: #_1A35: db TIE
#_0CCC42: #_1A36: db As4
#_0CCC43: #_1A37: db A4
#_0CCC44: #_1A38: db $8C ; dur 0x0C
#_0CCC45: #_1A39: db C4
#_0CCC46: #_1A3A: db $8B ; dur 0x0B
#_0CCC47: #_1A3B: db D4
#_0CCC48: #_1A3C: db $88 ; dur 0x08
#_0CCC49: #_1A3D: db Ds4
#_0CCC4A: #_1A3E: db $86 ; dur 0x06
#_0CCC4B: #_1A3F: db E4
#_0CCC4C: #_1A40: db TIE
#_0CCC4D: #_1A41: db G4
#_0CCC4E: #_1A42: db E4
#_0CCC4F: #_1A43: db TIE
#_0CCC50: #_1A44: db TIE
#_0CCC51: #_1A45: db As4
#_0CCC52: #_1A46: db A4
#_0CCC53: #_1A47: db E4
#_0CCC54: #_1A48: db TIE
#_0CCC55: #_1A49: db D4
#_0CCC56: #_1A4A: db $84 ; dur 0x04
#_0CCC57: #_1A4B: db Ds3
#_0CCC58: #_1A4C: db E4
#_0CCC59: #_1A4D: db $88 ; dur 0x08
#_0CCC5A: #_1A4E: db TIE
#_0CCC5B: #_1A4F: db !TRACKCOMMAND_E3_PitchBend, $F8
#_0CCC5D: #_1A51: db TIE
#_0CCC5E: #_1A52: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCC5F: #_1A53: db !TRACKCOMMAND_E7_Return_A

Song_3C_Battle_SEGMENT_1A54:
#_0CCC60: #_1A54: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCC63: #_1A57: db !TRACKCOMMAND_F1_SetSRCN, $07
#_0CCC65: #_1A59: db !TRACKCOMMAND_F2_SetPan, $6C
#_0CCC67: #_1A5B: db !TRACKCOMMAND_F3_Transpose, -12
#_0CCC69: #_1A5D: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_1A5F:
#_0CCC6B: #_1A5F: db $73 ; vol 0x13
#_0CCC6C: #_1A60: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_19DD
#_0CCC6F: #_1A63: db $71 ; vol 0x11
#_0CCC70: #_1A64: db !TRACKCOMMAND_E6_CallSub_A : dw Song_3C_Battle_SEGMENT_1A6A
#_0CCC73: #_1A67: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1A5F

Song_3C_Battle_SEGMENT_1A6A:
#_0CCC76: #_1A6A: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_19DD
#_0CCC79: #_1A6D: db $8C ; dur 0x0C
#_0CCC7A: #_1A6E: db G3
#_0CCC7B: #_1A6F: db $8B ; dur 0x0B
#_0CCC7C: #_1A70: db A3
#_0CCC7D: #_1A71: db $88 ; dur 0x08
#_0CCC7E: #_1A72: db As3
#_0CCC7F: #_1A73: db $86 ; dur 0x06
#_0CCC80: #_1A74: db B3
#_0CCC81: #_1A75: db TIE
#_0CCC82: #_1A76: db D4
#_0CCC83: #_1A77: db B3
#_0CCC84: #_1A78: db TIE
#_0CCC85: #_1A79: db TIE
#_0CCC86: #_1A7A: db F4
#_0CCC87: #_1A7B: db E4
#_0CCC88: #_1A7C: db B3
#_0CCC89: #_1A7D: db TIE
#_0CCC8A: #_1A7E: db D4
#_0CCC8B: #_1A7F: db B3
#_0CCC8C: #_1A80: db TIE
#_0CCC8D: #_1A81: db TIE
#_0CCC8E: #_1A82: db F4
#_0CCC8F: #_1A83: db E4
#_0CCC90: #_1A84: db $8C ; dur 0x0C
#_0CCC91: #_1A85: db G3
#_0CCC92: #_1A86: db $8B ; dur 0x0B
#_0CCC93: #_1A87: db A3
#_0CCC94: #_1A88: db $88 ; dur 0x08
#_0CCC95: #_1A89: db As3
#_0CCC96: #_1A8A: db $86 ; dur 0x06
#_0CCC97: #_1A8B: db B3
#_0CCC98: #_1A8C: db TIE
#_0CCC99: #_1A8D: db D4
#_0CCC9A: #_1A8E: db B3
#_0CCC9B: #_1A8F: db TIE
#_0CCC9C: #_1A90: db TIE
#_0CCC9D: #_1A91: db F4
#_0CCC9E: #_1A92: db E4
#_0CCC9F: #_1A93: db B3
#_0CCCA0: #_1A94: db TIE
#_0CCCA1: #_1A95: db A3
#_0CCCA2: #_1A96: db $84 ; dur 0x04
#_0CCCA3: #_1A97: db As3
#_0CCCA4: #_1A98: db B3
#_0CCCA5: #_1A99: db $88 ; dur 0x08
#_0CCCA6: #_1A9A: db TIE
#_0CCCA7: #_1A9B: db !TRACKCOMMAND_E3_PitchBend, $F8
#_0CCCA9: #_1A9D: db TIE
#_0CCCAA: #_1A9E: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCCAB: #_1A9F: db !TRACKCOMMAND_E7_Return_A

Song_3C_Battle_SEGMENT_1AA0:
#_0CCCAC: #_1AA0: db $64 ; vol 0x04
#_0CCCAD: #_1AA1: db !TRACKCOMMAND_F9_FineTune, $10
#_0CCCAF: #_1AA3: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1AA7

Song_3C_Battle_SEGMENT_1AA6:
#_0CCCB2: #_1AA6: db $74 ; vol 0x14

Song_3C_Battle_SEGMENT_1AA7:
#_0CCCB3: #_1AA7: db !TRACKCOMMAND_F0_SetADSR, $FF, $E6
#_0CCCB6: #_1AAA: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CCCB8: #_1AAC: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCCBA: #_1AAE: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_1AB0:
#_0CCCBC: #_1AB0: db !TRACKCOMMAND_F4_SetLoop_B, $02
#_0CCCBE: #_1AB2: db !TRACKCOMMAND_E6_CallSub_A : dw Song_3C_Battle_SEGMENT_1AB8
#_0CCCC1: #_1AB5: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1AB0

Song_3C_Battle_SEGMENT_1AB8:
#_0CCCC4: #_1AB8: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCCC6: #_1ABA: db $8D ; dur 0x0D
#_0CCCC7: #_1ABB: db B3
#_0CCCC8: #_1ABC: db $88 ; dur 0x08
#_0CCCC9: #_1ABD: db TIE
#_0CCCCA: #_1ABE: db $86 ; dur 0x06
#_0CCCCB: #_1ABF: db D4
#_0CCCCC: #_1AC0: db E4
#_0CCCCD: #_1AC1: db $8D ; dur 0x0D
#_0CCCCE: #_1AC2: db B3
#_0CCCCF: #_1AC3: db $87 ; dur 0x07
#_0CCCD0: #_1AC4: db D4
#_0CCCD1: #_1AC5: db Cs4
#_0CCCD2: #_1AC6: db $86 ; dur 0x06
#_0CCCD3: #_1AC7: db C4
#_0CCCD4: #_1AC8: db $8D ; dur 0x0D
#_0CCCD5: #_1AC9: db B3
#_0CCCD6: #_1ACA: db $88 ; dur 0x08
#_0CCCD7: #_1ACB: db TIE
#_0CCCD8: #_1ACC: db $86 ; dur 0x06
#_0CCCD9: #_1ACD: db D4
#_0CCCDA: #_1ACE: db E4
#_0CCCDB: #_1ACF: db $8D ; dur 0x0D
#_0CCCDC: #_1AD0: db B3
#_0CCCDD: #_1AD1: db !TRACKCOMMAND_F2_SetPan, $58
#_0CCCDF: #_1AD3: db $86 ; dur 0x06
#_0CCCE0: #_1AD4: db A4
#_0CCCE1: #_1AD5: db $84 ; dur 0x04
#_0CCCE2: #_1AD6: db R
#_0CCCE3: #_1AD7: db $87 ; dur 0x07
#_0CCCE4: #_1AD8: db A4
#_0CCCE5: #_1AD9: db $86 ; dur 0x06
#_0CCCE6: #_1ADA: db As4
#_0CCCE7: #_1ADB: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCCE8: #_1ADC: db $8C ; dur 0x0C
#_0CCCE9: #_1ADD: db G4
#_0CCCEA: #_1ADE: db $8B ; dur 0x0B
#_0CCCEB: #_1ADF: db A4
#_0CCCEC: #_1AE0: db $84 ; dur 0x04
#_0CCCED: #_1AE1: db A4
#_0CCCEE: #_1AE2: db Gs4
#_0CCCEF: #_1AE3: db G4
#_0CCCF0: #_1AE4: db Fs4
#_0CCCF1: #_1AE5: db !TRACKCOMMAND_F4_SetLoop_B, $02
#_0CCCF3: #_1AE7: db $84 ; dur 0x04
#_0CCCF4: #_1AE8: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B11
#_0CCCF7: #_1AEB: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCCF8: #_1AEC: db $8C ; dur 0x0C
#_0CCCF9: #_1AED: db G4
#_0CCCFA: #_1AEE: db $8B ; dur 0x0B
#_0CCCFB: #_1AEF: db A4
#_0CCCFC: #_1AF0: db $84 ; dur 0x04
#_0CCCFD: #_1AF1: db A4
#_0CCCFE: #_1AF2: db Gs4
#_0CCCFF: #_1AF3: db G4
#_0CCD00: #_1AF4: db Fs4
#_0CCD01: #_1AF5: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B11
#_0CCD04: #_1AF8: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCD06: #_1AFA: db !TRACKCOMMAND_F0_SetADSR, $FF, $EF
#_0CCD09: #_1AFD: db $84 ; dur 0x04
#_0CCD0A: #_1AFE: db B3
#_0CCD0B: #_1AFF: db B3
#_0CCD0C: #_1B00: db B3
#_0CCD0D: #_1B01: db B3
#_0CCD0E: #_1B02: db $86 ; dur 0x06
#_0CCD0F: #_1B03: db A3
#_0CCD10: #_1B04: db $84 ; dur 0x04
#_0CCD11: #_1B05: db As3
#_0CCD12: #_1B06: db !TRACKCOMMAND_F0_SetADSR, $FF, $E6
#_0CCD15: #_1B09: db B3
#_0CCD16: #_1B0A: db $88 ; dur 0x08
#_0CCD17: #_1B0B: db TIE
#_0CCD18: #_1B0C: db !TRACKCOMMAND_E3_PitchBend, $F0
#_0CCD1A: #_1B0E: db TIE
#_0CCD1B: #_1B0F: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCD1C: #_1B10: db !TRACKCOMMAND_E7_Return_A

Song_3C_Battle_SEGMENT_1B11:
#_0CCD1D: #_1B11: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCD1F: #_1B13: db !TRACKCOMMAND_F0_SetADSR, $FF, $EF
#_0CCD22: #_1B16: db B3
#_0CCD23: #_1B17: db B3
#_0CCD24: #_1B18: db B3
#_0CCD25: #_1B19: db B3
#_0CCD26: #_1B1A: db !TRACKCOMMAND_F2_SetPan, $5C
#_0CCD28: #_1B1C: db !TRACKCOMMAND_F0_SetADSR, $FF, $E6
#_0CCD2B: #_1B1F: db $86 ; dur 0x06
#_0CCD2C: #_1B20: db D5
#_0CCD2D: #_1B21: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCD2F: #_1B23: db !TRACKCOMMAND_F0_SetADSR, $FF, $EF
#_0CCD32: #_1B26: db $84 ; dur 0x04
#_0CCD33: #_1B27: db B3
#_0CCD34: #_1B28: db $86 ; dur 0x06
#_0CCD35: #_1B29: db B3
#_0CCD36: #_1B2A: db B3
#_0CCD37: #_1B2B: db $84 ; dur 0x04
#_0CCD38: #_1B2C: db B3
#_0CCD39: #_1B2D: db !TRACKCOMMAND_F2_SetPan, $5C
#_0CCD3B: #_1B2F: db !TRACKCOMMAND_F0_SetADSR, $FF, $E6
#_0CCD3E: #_1B32: db $86 ; dur 0x06
#_0CCD3F: #_1B33: db F5
#_0CCD40: #_1B34: db E5
#_0CCD41: #_1B35: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1B36:
#_0CCD42: #_1B36: db $70 ; vol 0x10
#_0CCD43: #_1B37: db !TRACKCOMMAND_F0_SetADSR, $FF, $F3
#_0CCD46: #_1B3A: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CCD48: #_1B3C: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCD4A: #_1B3E: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_1B40:
#_0CCD4C: #_1B40: db $84 ; dur 0x04
#_0CCD4D: #_1B41: db !TRACKCOMMAND_E4_SetLoop_A, $02
#_0CCD4F: #_1B43: db !TRACKCOMMAND_E6_CallSub_A : dw Song_3C_Battle_SEGMENT_1B49
#_0CCD52: #_1B46: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1B40

Song_3C_Battle_SEGMENT_1B49:
#_0CCD55: #_1B49: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B94
#_0CCD58: #_1B4C: db G4
#_0CCD59: #_1B4D: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCD5B: #_1B4F: db E4
#_0CCD5C: #_1B50: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCD5D: #_1B51: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B94
#_0CCD60: #_1B54: db G4
#_0CCD61: #_1B55: db G4
#_0CCD62: #_1B56: db G4
#_0CCD63: #_1B57: db Fs4
#_0CCD64: #_1B58: db Fs4
#_0CCD65: #_1B59: db Fs4
#_0CCD66: #_1B5A: db F4
#_0CCD67: #_1B5B: db F4
#_0CCD68: #_1B5C: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B94
#_0CCD6B: #_1B5F: db G4
#_0CCD6C: #_1B60: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCD6E: #_1B62: db E4
#_0CCD6F: #_1B63: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCD70: #_1B64: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1B94
#_0CCD73: #_1B67: db D4
#_0CCD74: #_1B68: db D4
#_0CCD75: #_1B69: db D4
#_0CCD76: #_1B6A: db D4
#_0CCD77: #_1B6B: db D4
#_0CCD78: #_1B6C: db D4
#_0CCD79: #_1B6D: db Ds4
#_0CCD7A: #_1B6E: db Ds4
#_0CCD7B: #_1B6F: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CCD7C: #_1B70: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1BA4
#_0CCD7F: #_1B73: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1BB3
#_0CCD82: #_1B76: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1BB3
#_0CCD85: #_1B79: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1BA4
#_0CCD88: #_1B7C: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1BB3
#_0CCD8B: #_1B7F: db E4
#_0CCD8C: #_1B80: db E4
#_0CCD8D: #_1B81: db E4
#_0CCD8E: #_1B82: db E4
#_0CCD8F: #_1B83: db D4
#_0CCD90: #_1B84: db TIE
#_0CCD91: #_1B85: db Ds4
#_0CCD92: #_1B86: db !TRACKCOMMAND_F0_SetADSR, $FF, $E8
#_0CCD95: #_1B89: db E3
#_0CCD96: #_1B8A: db $88 ; dur 0x08
#_0CCD97: #_1B8B: db TIE
#_0CCD98: #_1B8C: db !TRACKCOMMAND_E3_PitchBend, $F0
#_0CCD9A: #_1B8E: db TIE
#_0CCD9B: #_1B8F: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCD9C: #_1B90: db !TRACKCOMMAND_F0_SetADSR, $FF, $F3
#_0CCD9F: #_1B93: db !TRACKCOMMAND_E7_Return_A

Song_3C_Battle_SEGMENT_1B94:
#_0CCDA0: #_1B94: db D4
#_0CCDA1: #_1B95: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCDA3: #_1B97: db E4
#_0CCDA4: #_1B98: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDA5: #_1B99: db G4
#_0CCDA6: #_1B9A: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCDA8: #_1B9C: db E4
#_0CCDA9: #_1B9D: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDAA: #_1B9E: db D4
#_0CCDAB: #_1B9F: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCDAD: #_1BA1: db E4
#_0CCDAE: #_1BA2: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDAF: #_1BA3: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1BA4:
#_0CCDB0: #_1BA4: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCDB2: #_1BA6: db B3
#_0CCDB3: #_1BA7: db C4
#_0CCDB4: #_1BA8: db C4
#_0CCDB5: #_1BA9: db C4
#_0CCDB6: #_1BAA: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDB7: #_1BAB: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCDB9: #_1BAD: db Cs4
#_0CCDBA: #_1BAE: db D4
#_0CCDBB: #_1BAF: db D4
#_0CCDBC: #_1BB0: db D4
#_0CCDBD: #_1BB1: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDBE: #_1BB2: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1BB3:
#_0CCDBF: #_1BB3: db E4
#_0CCDC0: #_1BB4: db E4
#_0CCDC1: #_1BB5: db E4
#_0CCDC2: #_1BB6: db E4
#_0CCDC3: #_1BB7: db G4
#_0CCDC4: #_1BB8: db TIE
#_0CCDC5: #_1BB9: db E4
#_0CCDC6: #_1BBA: db E4
#_0CCDC7: #_1BBB: db TIE
#_0CCDC8: #_1BBC: db E4
#_0CCDC9: #_1BBD: db TIE
#_0CCDCA: #_1BBE: db E4
#_0CCDCB: #_1BBF: db As4
#_0CCDCC: #_1BC0: db TIE
#_0CCDCD: #_1BC1: db A4
#_0CCDCE: #_1BC2: db TIE
#_0CCDCF: #_1BC3: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1BC4:
#_0CCDD0: #_1BC4: db $70 ; vol 0x10
#_0CCDD1: #_1BC5: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCDD4: #_1BC8: db !TRACKCOMMAND_F2_SetPan, $44
#_0CCDD6: #_1BCA: db !TRACKCOMMAND_FB_SetNoteLengthPage, $30

Song_3C_Battle_SEGMENT_1BCC:
#_0CCDD8: #_1BCC: db !TRACKCOMMAND_E4_SetLoop_A, $04
#_0CCDDA: #_1BCE: db !TRACKCOMMAND_E6_CallSub_A : dw Song_3C_Battle_SEGMENT_1BD4
#_0CCDDD: #_1BD1: db !TRACKCOMMAND_F8_Goto_X : dw Song_3C_Battle_SEGMENT_1BCC

Song_3C_Battle_SEGMENT_1BD4:
#_0CCDE0: #_1BD4: db !TRACKCOMMAND_F4_SetLoop_B, $03
#_0CCDE2: #_1BD6: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C24
#_0CCDE5: #_1BD9: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCDE6: #_1BDA: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCDE8: #_1BDC: db $86 ; dur 0x06
#_0CCDE9: #_1BDD: db C4
#_0CCDEA: #_1BDE: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCDEC: #_1BE0: db C4
#_0CCDED: #_1BE1: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCDEF: #_1BE3: db $84 ; dur 0x04
#_0CCDF0: #_1BE4: db C4
#_0CCDF1: #_1BE5: db C4
#_0CCDF2: #_1BE6: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCDF4: #_1BE8: db $86 ; dur 0x06
#_0CCDF5: #_1BE9: db C4
#_0CCDF6: #_1BEA: db $84 ; dur 0x04
#_0CCDF7: #_1BEB: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCDF9: #_1BED: db C4
#_0CCDFA: #_1BEE: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCDFC: #_1BF0: db C4
#_0CCDFD: #_1BF1: db C4
#_0CCDFE: #_1BF2: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE00: #_1BF4: db C4
#_0CCE01: #_1BF5: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE03: #_1BF7: db C4
#_0CCE04: #_1BF8: db C4
#_0CCE05: #_1BF9: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE07: #_1BFB: db C4
#_0CCE08: #_1BFC: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE0A: #_1BFE: db C4
#_0CCE0B: #_1BFF: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CCE0C: #_1C00: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C24
#_0CCE0F: #_1C03: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C49
#_0CCE12: #_1C06: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C72
#_0CCE15: #_1C09: db !TRACKCOMMAND_F4_SetLoop_B, $02
#_0CCE17: #_1C0B: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C77
#_0CCE1A: #_1C0E: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C24
#_0CCE1D: #_1C11: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C49
#_0CCE20: #_1C14: db !TRACKCOMMAND_F6_CallSub_B : dw Song_3C_Battle_SEGMENT_1C72
#_0CCE23: #_1C17: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE25: #_1C19: db C4
#_0CCE26: #_1C1A: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE28: #_1C1C: db C4
#_0CCE29: #_1C1D: db C4
#_0CCE2A: #_1C1E: db C4
#_0CCE2B: #_1C1F: db C4
#_0CCE2C: #_1C20: db C4
#_0CCE2D: #_1C21: db C4
#_0CCE2E: #_1C22: db C4
#_0CCE2F: #_1C23: db !TRACKCOMMAND_E7_Return_A

Song_3C_Battle_SEGMENT_1C24:
#_0CCE30: #_1C24: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE32: #_1C26: db $86 ; dur 0x06
#_0CCE33: #_1C27: db C4
#_0CCE34: #_1C28: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE36: #_1C2A: db C4
#_0CCE37: #_1C2B: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE39: #_1C2D: db $84 ; dur 0x04
#_0CCE3A: #_1C2E: db C4
#_0CCE3B: #_1C2F: db C4
#_0CCE3C: #_1C30: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE3E: #_1C32: db $86 ; dur 0x06
#_0CCE3F: #_1C33: db C4
#_0CCE40: #_1C34: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE42: #_1C36: db $84 ; dur 0x04
#_0CCE43: #_1C37: db C4
#_0CCE44: #_1C38: db C4
#_0CCE45: #_1C39: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE47: #_1C3B: db C4
#_0CCE48: #_1C3C: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE4A: #_1C3E: db $86 ; dur 0x06
#_0CCE4B: #_1C3F: db C4
#_0CCE4C: #_1C40: db $84 ; dur 0x04
#_0CCE4D: #_1C41: db C4
#_0CCE4E: #_1C42: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE50: #_1C44: db C4
#_0CCE51: #_1C45: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE53: #_1C47: db C4
#_0CCE54: #_1C48: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1C49:
#_0CCE55: #_1C49: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE57: #_1C4B: db $86 ; dur 0x06
#_0CCE58: #_1C4C: db C4
#_0CCE59: #_1C4D: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE5B: #_1C4F: db C4
#_0CCE5C: #_1C50: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE5E: #_1C52: db $84 ; dur 0x04
#_0CCE5F: #_1C53: db C4
#_0CCE60: #_1C54: db C4
#_0CCE61: #_1C55: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE63: #_1C57: db $86 ; dur 0x06
#_0CCE64: #_1C58: db C4
#_0CCE65: #_1C59: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE67: #_1C5B: db $84 ; dur 0x04
#_0CCE68: #_1C5C: db C4
#_0CCE69: #_1C5D: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE6B: #_1C5F: db $86 ; dur 0x06
#_0CCE6C: #_1C60: db C4
#_0CCE6D: #_1C61: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE6F: #_1C63: db $84 ; dur 0x04
#_0CCE70: #_1C64: db C4
#_0CCE71: #_1C65: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE73: #_1C67: db C4
#_0CCE74: #_1C68: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE76: #_1C6A: db C4
#_0CCE77: #_1C6B: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE79: #_1C6D: db C4
#_0CCE7A: #_1C6E: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE7C: #_1C70: db C4
#_0CCE7D: #_1C71: db !TRACKCOMMAND_F7_Return_B

Song_3C_Battle_SEGMENT_1C72:
#_0CCE7E: #_1C72: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE80: #_1C74: db $84 ; dur 0x04
#_0CCE81: #_1C75: db !TRACKCOMMAND_F4_SetLoop_B, $06

Song_3C_Battle_SEGMENT_1C77:
#_0CCE83: #_1C77: db C4
#_0CCE84: #_1C78: db C4
#_0CCE85: #_1C79: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCE87: #_1C7B: db C4
#_0CCE88: #_1C7C: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCE8A: #_1C7E: db C4
#_0CCE8B: #_1C7F: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCE8C: #_1C80: db !TRACKCOMMAND_F7_Return_B

;===================================================================================================
; 
;===================================================================================================
Song_3D_LevelUp:
#_0CCE8D: #_1C81: db !HEADERCOMMAND_F1_SET_CONTROL, $F4
#_0CCE8F: #_1C83: db !MUS_CHANNEL_0 : dw Song_3D_LevelUp_SEGMENT_1C9C
#_0CCE92: #_1C86: db !MUS_CHANNEL_1 : dw Song_3D_LevelUp_SEGMENT_1CA2
#_0CCE95: #_1C89: db !MUS_CHANNEL_2 : dw Song_3D_LevelUp_SEGMENT_1D0C
#_0CCE98: #_1C8C: db !MUS_CHANNEL_3 : dw Song_3D_LevelUp_SEGMENT_1D18
#_0CCE9B: #_1C8F: db !MUS_CHANNEL_4 : dw Song_3D_LevelUp_SEGMENT_1D7E
#_0CCE9E: #_1C92: db !MUS_CHANNEL_5 : dw Song_3D_LevelUp_SEGMENT_1D7F
#_0CCEA1: #_1C95: db !MUS_CHANNEL_6 : dw Song_3D_LevelUp_SEGMENT_1D8D
#_0CCEA4: #_1C98: db !MUS_CHANNEL_7 : dw Song_3D_LevelUp_SEGMENT_1DDE
#_0CCEA7: #_1C9B: db !HEADERCOMMAND_FF_LAST_CHANNEL

Song_3D_LevelUp_SEGMENT_1C9C:
#_0CCEA8: #_1C9C: db $63 ; vol 0x03
#_0CCEA9: #_1C9D: db !TRACKCOMMAND_F9_FineTune, $20
#_0CCEAB: #_1C9F: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1CA3

Song_3D_LevelUp_SEGMENT_1CA2:
#_0CCEAE: #_1CA2: db $73 ; vol 0x13

Song_3D_LevelUp_SEGMENT_1CA3:
#_0CCEAF: #_1CA3: db $8B ; dur 0x0B
#_0CCEB0: #_1CA4: db R
#_0CCEB1: #_1CA5: db $86 ; dur 0x06
#_0CCEB2: #_1CA6: db R
#_0CCEB3: #_1CA7: db !TRACKCOMMAND_F0_SetADSR, $FE, $E8
#_0CCEB6: #_1CAA: db !TRACKCOMMAND_F1_SetSRCN, $04
#_0CCEB8: #_1CAC: db !TRACKCOMMAND_F2_SetPan, $60
#_0CCEBA: #_1CAE: db !TRACKCOMMAND_F3_Transpose, -8

Song_3D_LevelUp_SEGMENT_1CB0:
#_0CCEBC: #_1CB0: db !TRACKCOMMAND_E4_SetLoop_A, $03
#_0CCEBE: #_1CB2: db $86 ; dur 0x06
#_0CCEBF: #_1CB3: db A4
#_0CCEC0: #_1CB4: db $8C ; dur 0x0C
#_0CCEC1: #_1CB5: db B4
#_0CCEC2: #_1CB6: db $8B ; dur 0x0B
#_0CCEC3: #_1CB7: db TIE
#_0CCEC4: #_1CB8: db $86 ; dur 0x06
#_0CCEC5: #_1CB9: db TIE
#_0CCEC6: #_1CBA: db $86 ; dur 0x06
#_0CCEC7: #_1CBB: db Cs5
#_0CCEC8: #_1CBC: db $8C ; dur 0x0C
#_0CCEC9: #_1CBD: db D5
#_0CCECA: #_1CBE: db $8B ; dur 0x0B
#_0CCECB: #_1CBF: db TIE
#_0CCECC: #_1CC0: db $86 ; dur 0x06
#_0CCECD: #_1CC1: db TIE
#_0CCECE: #_1CC2: db $86 ; dur 0x06
#_0CCECF: #_1CC3: db D5
#_0CCED0: #_1CC4: db $8C ; dur 0x0C
#_0CCED1: #_1CC5: db E5
#_0CCED2: #_1CC6: db $8B ; dur 0x0B
#_0CCED3: #_1CC7: db TIE
#_0CCED4: #_1CC8: db $86 ; dur 0x06
#_0CCED5: #_1CC9: db TIE
#_0CCED6: #_1CCA: db $86 ; dur 0x06
#_0CCED7: #_1CCB: db Fs5
#_0CCED8: #_1CCC: db $8C ; dur 0x0C
#_0CCED9: #_1CCD: db G5
#_0CCEDA: #_1CCE: db $86 ; dur 0x06
#_0CCEDB: #_1CCF: db G5
#_0CCEDC: #_1CD0: db Fs5
#_0CCEDD: #_1CD1: db F5
#_0CCEDE: #_1CD2: db E5
#_0CCEDF: #_1CD3: db Ds5
#_0CCEE0: #_1CD4: db D5
#_0CCEE1: #_1CD5: db Cs5
#_0CCEE2: #_1CD6: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CCEE3: #_1CD7: db $86 ; dur 0x06
#_0CCEE4: #_1CD8: db A4
#_0CCEE5: #_1CD9: db $8C ; dur 0x0C
#_0CCEE6: #_1CDA: db B4
#_0CCEE7: #_1CDB: db $8B ; dur 0x0B
#_0CCEE8: #_1CDC: db TIE
#_0CCEE9: #_1CDD: db $86 ; dur 0x06
#_0CCEEA: #_1CDE: db TIE
#_0CCEEB: #_1CDF: db $86 ; dur 0x06
#_0CCEEC: #_1CE0: db Cs5
#_0CCEED: #_1CE1: db $8C ; dur 0x0C
#_0CCEEE: #_1CE2: db D5
#_0CCEEF: #_1CE3: db $8B ; dur 0x0B
#_0CCEF0: #_1CE4: db TIE
#_0CCEF1: #_1CE5: db $86 ; dur 0x06
#_0CCEF2: #_1CE6: db TIE
#_0CCEF3: #_1CE7: db $86 ; dur 0x06
#_0CCEF4: #_1CE8: db D5
#_0CCEF5: #_1CE9: db $8C ; dur 0x0C
#_0CCEF6: #_1CEA: db E5
#_0CCEF7: #_1CEB: db TIE
#_0CCEF8: #_1CEC: db $86 ; dur 0x06
#_0CCEF9: #_1CED: db A4
#_0CCEFA: #_1CEE: db R
#_0CCEFB: #_1CEF: db D5
#_0CCEFC: #_1CF0: db R
#_0CCEFD: #_1CF1: db G4
#_0CCEFE: #_1CF2: db R
#_0CCEFF: #_1CF3: db C5
#_0CCF00: #_1CF4: db R
#_0CCF01: #_1CF5: db B4
#_0CCF02: #_1CF6: db R
#_0CCF03: #_1CF7: db E5
#_0CCF04: #_1CF8: db R
#_0CCF05: #_1CF9: db A4
#_0CCF06: #_1CFA: db R
#_0CCF07: #_1CFB: db D4
#_0CCF08: #_1CFC: db R
#_0CCF09: #_1CFD: db $8C ; dur 0x0C
#_0CCF0A: #_1CFE: db B4
#_0CCF0B: #_1CFF: db $88 ; dur 0x08
#_0CCF0C: #_1D00: db B4
#_0CCF0D: #_1D01: db !TRACKCOMMAND_E3_PitchBend, $81
#_0CCF0F: #_1D03: db TIE
#_0CCF10: #_1D04: db TIE
#_0CCF11: #_1D05: db !TRACKCOMMAND_E2_PitchBend_Off
#_0CCF12: #_1D06: db $86 ; dur 0x06
#_0CCF13: #_1D07: db R
#_0CCF14: #_1D08: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1CB0
#_0CCF17: #_1D0B: db !TRACKCOMMAND_FF_EndTrack

Song_3D_LevelUp_SEGMENT_1D0C:
#_0CCF18: #_1D0C: db $87 ; dur 0x07
#_0CCF19: #_1D0D: db R
#_0CCF1A: #_1D0E: db !TRACKCOMMAND_F0_SetADSR, $FA, $F0
#_0CCF1D: #_1D11: db !TRACKCOMMAND_F2_SetPan, $70
#_0CCF1F: #_1D13: db !TRACKCOMMAND_F9_FineTune, $20
#_0CCF21: #_1D15: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1D1D

Song_3D_LevelUp_SEGMENT_1D18:
#_0CCF24: #_1D18: db !TRACKCOMMAND_F0_SetADSR, $FE, $F0
#_0CCF27: #_1D1B: db !TRACKCOMMAND_F2_SetPan, $64

Song_3D_LevelUp_SEGMENT_1D1D:
#_0CCF29: #_1D1D: db $8C ; dur 0x0C
#_0CCF2A: #_1D1E: db R
#_0CCF2B: #_1D1F: db !TRACKCOMMAND_F1_SetSRCN, $03
#_0CCF2D: #_1D21: db !TRACKCOMMAND_F3_Transpose, -12

Song_3D_LevelUp_SEGMENT_1D23:
#_0CCF2F: #_1D23: db $86 ; dur 0x06
#_0CCF30: #_1D24: db !TRACKCOMMAND_E4_SetLoop_A, $03
#_0CCF32: #_1D26: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF34: #_1D28: db E4
#_0CCF35: #_1D29: db B3
#_0CCF36: #_1D2A: db G3
#_0CCF37: #_1D2B: db B3
#_0CCF38: #_1D2C: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF39: #_1D2D: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF3B: #_1D2F: db D4
#_0CCF3C: #_1D30: db B3
#_0CCF3D: #_1D31: db G3
#_0CCF3E: #_1D32: db B3
#_0CCF3F: #_1D33: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF40: #_1D34: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF42: #_1D36: db E4
#_0CCF43: #_1D37: db C4
#_0CCF44: #_1D38: db A3
#_0CCF45: #_1D39: db C4
#_0CCF46: #_1D3A: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF47: #_1D3B: db E4
#_0CCF48: #_1D3C: db C4
#_0CCF49: #_1D3D: db G3
#_0CCF4A: #_1D3E: db C4
#_0CCF4B: #_1D3F: db E4
#_0CCF4C: #_1D40: db C4
#_0CCF4D: #_1D41: db G3
#_0CCF4E: #_1D42: db C4
#_0CCF4F: #_1D43: db C4
#_0CCF50: #_1D44: db Cs4
#_0CCF51: #_1D45: db D4
#_0CCF52: #_1D46: db Ds4
#_0CCF53: #_1D47: db E4
#_0CCF54: #_1D48: db F4
#_0CCF55: #_1D49: db Fs4
#_0CCF56: #_1D4A: db D4
#_0CCF57: #_1D4B: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CCF58: #_1D4C: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF5A: #_1D4E: db E4
#_0CCF5B: #_1D4F: db B3
#_0CCF5C: #_1D50: db G3
#_0CCF5D: #_1D51: db B3
#_0CCF5E: #_1D52: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF5F: #_1D53: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF61: #_1D55: db D4
#_0CCF62: #_1D56: db B3
#_0CCF63: #_1D57: db G3
#_0CCF64: #_1D58: db B3
#_0CCF65: #_1D59: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF66: #_1D5A: db !TRACKCOMMAND_F4_SetLoop_B, $04
#_0CCF68: #_1D5C: db E4
#_0CCF69: #_1D5D: db C4
#_0CCF6A: #_1D5E: db A3
#_0CCF6B: #_1D5F: db C4
#_0CCF6C: #_1D60: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCF6D: #_1D61: db D4
#_0CCF6E: #_1D62: db A4
#_0CCF6F: #_1D63: db G4
#_0CCF70: #_1D64: db D4
#_0CCF71: #_1D65: db C4
#_0CCF72: #_1D66: db G4
#_0CCF73: #_1D67: db F4
#_0CCF74: #_1D68: db C4
#_0CCF75: #_1D69: db E4
#_0CCF76: #_1D6A: db B3
#_0CCF77: #_1D6B: db A4
#_0CCF78: #_1D6C: db E4
#_0CCF79: #_1D6D: db D4
#_0CCF7A: #_1D6E: db A4
#_0CCF7B: #_1D6F: db G4
#_0CCF7C: #_1D70: db D4
#_0CCF7D: #_1D71: db E4
#_0CCF7E: #_1D72: db B3
#_0CCF7F: #_1D73: db G3
#_0CCF80: #_1D74: db B3
#_0CCF81: #_1D75: db E4
#_0CCF82: #_1D76: db B3
#_0CCF83: #_1D77: db G3
#_0CCF84: #_1D78: db B3
#_0CCF85: #_1D79: db $8C ; dur 0x0C
#_0CCF86: #_1D7A: db E4
#_0CCF87: #_1D7B: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1D23

Song_3D_LevelUp_SEGMENT_1D7E:
#_0CCF8A: #_1D7E: db !TRACKCOMMAND_FF_EndTrack

Song_3D_LevelUp_SEGMENT_1D7F:
#_0CCF8B: #_1D7F: db $70 ; vol 0x10
#_0CCF8C: #_1D80: db !TRACKCOMMAND_F0_SetADSR, $FF, $F8
#_0CCF8F: #_1D83: db !TRACKCOMMAND_F1_SetSRCN, $06
#_0CCF91: #_1D85: db !TRACKCOMMAND_F2_SetPan, $60
#_0CCF93: #_1D87: db !TRACKCOMMAND_F3_Transpose, -20
#_0CCF95: #_1D89: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1D97
#_0CCF98: #_1D8C: db !TRACKCOMMAND_FF_EndTrack

Song_3D_LevelUp_SEGMENT_1D8D:
#_0CCF99: #_1D8D: db $70 ; vol 0x10
#_0CCF9A: #_1D8E: db !TRACKCOMMAND_F0_SetADSR, $FF, $F4
#_0CCF9D: #_1D91: db !TRACKCOMMAND_F1_SetSRCN, $02
#_0CCF9F: #_1D93: db !TRACKCOMMAND_F2_SetPan, $4C
#_0CCFA1: #_1D95: db !TRACKCOMMAND_F3_Transpose, -8

Song_3D_LevelUp_SEGMENT_1D97:
#_0CCFA3: #_1D97: db $8B ; dur 0x0B
#_0CCFA4: #_1D98: db R
#_0CCFA5: #_1D99: db $86 ; dur 0x06
#_0CCFA6: #_1D9A: db R

Song_3D_LevelUp_SEGMENT_1D9B:
#_0CCFA7: #_1D9B: db !TRACKCOMMAND_E4_SetLoop_A, $03
#_0CCFA9: #_1D9D: db $86 ; dur 0x06
#_0CCFAA: #_1D9E: db D4
#_0CCFAB: #_1D9F: db !TRACKCOMMAND_F4_SetLoop_B, $0F
#_0CCFAD: #_1DA1: db E4
#_0CCFAE: #_1DA2: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFAF: #_1DA3: db Fs4
#_0CCFB0: #_1DA4: db !TRACKCOMMAND_F4_SetLoop_B, $10
#_0CCFB2: #_1DA6: db G4
#_0CCFB3: #_1DA7: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFB4: #_1DA8: db !TRACKCOMMAND_F4_SetLoop_B, $0F
#_0CCFB6: #_1DAA: db A4
#_0CCFB7: #_1DAB: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFB8: #_1DAC: db B4
#_0CCFB9: #_1DAD: db !TRACKCOMMAND_F4_SetLoop_B, $08
#_0CCFBB: #_1DAF: db C5
#_0CCFBC: #_1DB0: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFBD: #_1DB1: db C5
#_0CCFBE: #_1DB2: db B4
#_0CCFBF: #_1DB3: db As4
#_0CCFC0: #_1DB4: db A4
#_0CCFC1: #_1DB5: db Gs4
#_0CCFC2: #_1DB6: db G4
#_0CCFC3: #_1DB7: db Fs4
#_0CCFC4: #_1DB8: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CCFC5: #_1DB9: db $86 ; dur 0x06
#_0CCFC6: #_1DBA: db D4
#_0CCFC7: #_1DBB: db !TRACKCOMMAND_F4_SetLoop_B, $0F
#_0CCFC9: #_1DBD: db E4
#_0CCFCA: #_1DBE: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFCB: #_1DBF: db Fs4
#_0CCFCC: #_1DC0: db !TRACKCOMMAND_F4_SetLoop_B, $10
#_0CCFCE: #_1DC2: db G4
#_0CCFCF: #_1DC3: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFD0: #_1DC4: db !TRACKCOMMAND_F4_SetLoop_B, $10
#_0CCFD2: #_1DC6: db A4
#_0CCFD3: #_1DC7: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFD4: #_1DC8: db $88 ; dur 0x08
#_0CCFD5: #_1DC9: db D4
#_0CCFD6: #_1DCA: db G4
#_0CCFD7: #_1DCB: db C4
#_0CCFD8: #_1DCC: db F4
#_0CCFD9: #_1DCD: db E4
#_0CCFDA: #_1DCE: db A4
#_0CCFDB: #_1DCF: db D4
#_0CCFDC: #_1DD0: db G4
#_0CCFDD: #_1DD1: db $86 ; dur 0x06
#_0CCFDE: #_1DD2: db !TRACKCOMMAND_F4_SetLoop_B, $08
#_0CCFE0: #_1DD4: db E4
#_0CCFE1: #_1DD5: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFE2: #_1DD6: db $8B ; dur 0x0B
#_0CCFE3: #_1DD7: db E4
#_0CCFE4: #_1DD8: db $86 ; dur 0x06
#_0CCFE5: #_1DD9: db TIE
#_0CCFE6: #_1DDA: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1D9B
#_0CCFE9: #_1DDD: db !TRACKCOMMAND_FF_EndTrack

Song_3D_LevelUp_SEGMENT_1DDE:
#_0CCFEA: #_1DDE: db $70 ; vol 0x10
#_0CCFEB: #_1DDF: db !TRACKCOMMAND_F0_SetADSR, $FF, $E0
#_0CCFEE: #_1DE2: db !TRACKCOMMAND_F2_SetPan, $44
#_0CCFF0: #_1DE4: db $86 ; dur 0x06
#_0CCFF1: #_1DE5: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CCFF3: #_1DE7: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCFF5: #_1DE9: db C4
#_0CCFF6: #_1DEA: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CCFF7: #_1DEB: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CCFF9: #_1DED: db $86 ; dur 0x06
#_0CCFFA: #_1DEE: db C4

Song_3D_LevelUp_SEGMENT_1DEF:
#_0CCFFB: #_1DEF: db !TRACKCOMMAND_E4_SetLoop_A, $03
#_0CCFFD: #_1DF1: db !TRACKCOMMAND_F4_SetLoop_B, $07
#_0CCFFF: #_1DF3: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD001: #_1DF5: db $88 ; dur 0x08
#_0CD002: #_1DF6: db C4
#_0CD003: #_1DF7: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD005: #_1DF9: db C4
#_0CD006: #_1DFA: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD008: #_1DFC: db $86 ; dur 0x06
#_0CD009: #_1DFD: db C4
#_0CD00A: #_1DFE: db C4
#_0CD00B: #_1DFF: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD00D: #_1E01: db $88 ; dur 0x08
#_0CD00E: #_1E02: db C4
#_0CD00F: #_1E03: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CD010: #_1E04: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD012: #_1E06: db $86 ; dur 0x06
#_0CD013: #_1E07: db C4
#_0CD014: #_1E08: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD016: #_1E0A: db C4
#_0CD017: #_1E0B: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD019: #_1E0D: db C4
#_0CD01A: #_1E0E: db C4
#_0CD01B: #_1E0F: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD01D: #_1E11: db C4
#_0CD01E: #_1E12: db C4
#_0CD01F: #_1E13: db C4
#_0CD020: #_1E14: db C4
#_0CD021: #_1E15: db !TRACKCOMMAND_E5_PerformLoop_A
#_0CD022: #_1E16: db !TRACKCOMMAND_F4_SetLoop_B, $06
#_0CD024: #_1E18: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD026: #_1E1A: db $88 ; dur 0x08
#_0CD027: #_1E1B: db C4
#_0CD028: #_1E1C: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD02A: #_1E1E: db C4
#_0CD02B: #_1E1F: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD02D: #_1E21: db $86 ; dur 0x06
#_0CD02E: #_1E22: db C4
#_0CD02F: #_1E23: db C4
#_0CD030: #_1E24: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD032: #_1E26: db $88 ; dur 0x08
#_0CD033: #_1E27: db C4
#_0CD034: #_1E28: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CD035: #_1E29: db $86 ; dur 0x06
#_0CD036: #_1E2A: db !TRACKCOMMAND_F4_SetLoop_B, $08
#_0CD038: #_1E2C: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD03A: #_1E2E: db C4
#_0CD03B: #_1E2F: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD03D: #_1E31: db C4
#_0CD03E: #_1E32: db !TRACKCOMMAND_F5_PerformLoop_B
#_0CD03F: #_1E33: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD041: #_1E35: db C4
#_0CD042: #_1E36: db C4
#_0CD043: #_1E37: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD045: #_1E39: db C4
#_0CD046: #_1E3A: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD048: #_1E3C: db C4
#_0CD049: #_1E3D: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD04B: #_1E3F: db C4
#_0CD04C: #_1E40: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD04E: #_1E42: db C4
#_0CD04F: #_1E43: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD051: #_1E45: db C4
#_0CD052: #_1E46: db !TRACKCOMMAND_F1_SetSRCN, $00
#_0CD054: #_1E48: db C4
#_0CD055: #_1E49: db !TRACKCOMMAND_F1_SetSRCN, $01
#_0CD057: #_1E4B: db C4
#_0CD058: #_1E4C: db C4
#_0CD059: #_1E4D: db C4
#_0CD05A: #_1E4E: db C4
#_0CD05B: #_1E4F: db C4
#_0CD05C: #_1E50: db C4
#_0CD05D: #_1E51: db C4
#_0CD05E: #_1E52: db C4
#_0CD05F: #_1E53: db !TRACKCOMMAND_F8_Goto_X : dw Song_3D_LevelUp_SEGMENT_1DEF
#_0CD062: #_1E56: db !TRACKCOMMAND_FF_EndTrack

;===================================================================================================
; 
;===================================================================================================
JustPaddingToSamplesIThink:
#_0CD063: #_1E57: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD06B: #_1E5F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD073: #_1E67: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD07B: #_1E6F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD083: #_1E77: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD08B: #_1E7F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD093: #_1E87: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD09B: #_1E8F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0A3: #_1E97: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0AB: #_1E9F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0B3: #_1EA7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0BB: #_1EAF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0C3: #_1EB7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0CB: #_1EBF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0D3: #_1EC7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0DB: #_1ECF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0E3: #_1ED7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0EB: #_1EDF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0F3: #_1EE7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD0FB: #_1EEF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD103: #_1EF7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD10B: #_1EFF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD113: #_1F07: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD11B: #_1F0F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD123: #_1F17: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD12B: #_1F1F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD133: #_1F27: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD13B: #_1F2F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD143: #_1F37: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD14B: #_1F3F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD153: #_1F47: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD15B: #_1F4F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD163: #_1F57: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD16B: #_1F5F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD173: #_1F67: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD17B: #_1F6F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD183: #_1F77: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD18B: #_1F7F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD193: #_1F87: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD19B: #_1F8F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1A3: #_1F97: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1AB: #_1F9F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1B3: #_1FA7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1BB: #_1FAF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1C3: #_1FB7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1CB: #_1FBF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1D3: #_1FC7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1DB: #_1FCF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1E3: #_1FD7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1EB: #_1FDF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1F3: #_1FE7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD1FB: #_1FEF: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD203: #_1FF7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CD20B: #_1FFF: db $FF

SamplePointers:
#_0CD20C: #_2000: dw Sample00, Sample00+$0843
#_0CD210: #_2004: dw Sample01, Sample01+$0C06
#_0CD214: #_2008: dw Sample02, Sample02+$001B
#_0CD218: #_200C: dw Sample03, Sample03+$001B
#_0CD21C: #_2010: dw Sample04, Sample04+$001B
#_0CD220: #_2014: dw Sample05, Sample05+$001B
#_0CD224: #_2018: dw Sample06, Sample06+$001B
#_0CD228: #_201C: dw Sample07, Sample07+$001B

SamplePointersArb:
#_0CD22C: #_2020: dw $0000, $0000
#_0CD230: #_2024: dw $0000, $0000
#_0CD234: #_2028: dw $0000, $0000
#_0CD238: #_202C: dw $0000, $0000
#_0CD23C: #_2030: dw $0000, $0000
#_0CD240: #_2034: dw $0000, $0000
#_0CD244: #_2038: dw $0000, $0000
#_0CD248: #_203C: dw $0000, $0000

Sample00:
#_0CD24C: #_2040: incbin "bin/brr/SMT_SAMPLE_00.brr"

Sample01:
#_0CDA8F: #_2883: incbin "bin/brr/SMT_SAMPLE_01.brr"

Sample02:
#_0CE695: #_3489: incbin "bin/brr/SMT_SAMPLE_02.brr"

Sample03:
#_0CE8D5: #_36C9: incbin "bin/brr/SMT_SAMPLE_03.brr"

Sample04:
#_0CE90B: #_36FF: incbin "bin/brr/SMT_SAMPLE_04.brr"

Sample05:
#_0CEABB: #_38AF: incbin "bin/brr/SMT_SAMPLE_05.brr"

Sample06:
#_0CEB5D: #_3951: incbin "bin/brr/SMT_SAMPLE_06.brr"

Sample07:
#_0CEBFF: #_39F3: incbin "bin/brr/SMT_SAMPLE_07.brr"

Sample08:
          #_3A95:

base off
arch 65816
