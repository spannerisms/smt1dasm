;===================================================================================================
; SRAM is at
;  $70:0000   Game 1
;  $70:1000   Game 2
;===================================================================================================
; SRAM is copied into segregated chunks and placed in WRAM.
; This file documents the WRAM addresses.
;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
; Block 1 - copied from [x000,x0FF] to [7E0700,7E07FF]
;===================================================================================================

; Stat offsets for each party member
; 0xFFFF for empty slot
TMOFF0           = $7E0700
TMOFF1           = $7E0702
TMOFF2           = $7E0704
TMOFF3           = $7E0706
TMOFF4           = $7E0708
TMOFF5           = $7E070A

; Underworld coordinates
UWX              = $7E070C
UWY              = $7E070C

; Something else with coords
UNKNOWN_X        = $7E070E
UNKNOWN_Y        = $7E070F

; Dungeon theme
DGTHM            = $7E0710

; Event of current room
RMEVENT          = $7E0711

; TODO some flags
; m... ..ee
;   m - moving?
;   e - event?
MVFLAG           = $7E0712

; Current dungeon floor
DGFLR            = $7E0713

UNKNOWN_7E0714   = $7E0714

; Current user's stats offset
CUROFF           = $7E0715

UNKNOWN_7E0717   = $7E0717
UNKNOWN_7E0718   = $7E0718
UNKNOWN_7E0719   = $7E0719
UNKNOWN_7E071A   = $7E071A
UNKNOWN_7E071B   = $7E071B
UNKNOWN_7E071C   = $7E071C
UNKNOWN_7E071D   = $7E071D
UNKNOWN_7E071E   = $7E071E
UNKNOWN_7E071F   = $7E071F
UNKNOWN_7E0720   = $7E0720
UNKNOWN_7E0721   = $7E0721
UNKNOWN_7E0722   = $7E0722
UNKNOWN_7E0723   = $7E0723

; Movement counter in dungeons
STEPCT           = $7E0724


UNKNOWN_7E0726   = $7E0726
UNKNOWN_7E0727   = $7E0727
UNKNOWN_7E0728   = $7E0728
UNKNOWN_7E0729   = $7E0729
UNKNOWN_7E072A   = $7E072A
UNKNOWN_7E072B   = $7E072B
UNKNOWN_7E072C   = $7E072C
UNKNOWN_7E072D   = $7E072D
UNKNOWN_7E072E   = $7E072E
UNKNOWN_7E072F   = $7E072F
UNKNOWN_7E0730   = $7E0730
UNKNOWN_7E0731   = $7E0731
UNKNOWN_7E0732   = $7E0732
UNKNOWN_7E0733   = $7E0733
UNKNOWN_7E0734   = $7E0734
UNKNOWN_7E0735   = $7E0735
UNKNOWN_7E0736   = $7E0736
UNKNOWN_7E0737   = $7E0737
UNKNOWN_7E0738   = $7E0738
UNKNOWN_7E0739   = $7E0739
UNKNOWN_7E073A   = $7E073A
UNKNOWN_7E073B   = $7E073B
UNKNOWN_7E073C   = $7E073C
UNKNOWN_7E073D   = $7E073D
UNKNOWN_7E073E   = $7E073E
UNKNOWN_7E073F   = $7E073F
UNKNOWN_7E0740   = $7E0740
UNKNOWN_7E0741   = $7E0741
UNKNOWN_7E0742   = $7E0742
UNKNOWN_7E0743   = $7E0743
UNKNOWN_7E0744   = $7E0744
UNKNOWN_7E0745   = $7E0745
UNKNOWN_7E0746   = $7E0746
UNKNOWN_7E0747   = $7E0747
UNKNOWN_7E0748   = $7E0748
UNKNOWN_7E0749   = $7E0749
UNKNOWN_7E074A   = $7E074A
UNKNOWN_7E074B   = $7E074B
UNKNOWN_7E074C   = $7E074C
UNKNOWN_7E074D   = $7E074D
UNKNOWN_7E074E   = $7E074E
UNKNOWN_7E074F   = $7E074F
UNKNOWN_7E0750   = $7E0750
UNKNOWN_7E0751   = $7E0751
UNKNOWN_7E0752   = $7E0752
UNKNOWN_7E0753   = $7E0753
UNKNOWN_7E0754   = $7E0754
UNKNOWN_7E0755   = $7E0755
UNKNOWN_7E0756   = $7E0756
UNKNOWN_7E0757   = $7E0757
UNKNOWN_7E0758   = $7E0758
UNKNOWN_7E0759   = $7E0759
UNKNOWN_7E075A   = $7E075A
UNKNOWN_7E075B   = $7E075B
UNKNOWN_7E075C   = $7E075C
UNKNOWN_7E075D   = $7E075D
UNKNOWN_7E075E   = $7E075E
UNKNOWN_7E075F   = $7E075F

; Stat points left to be distributed when leveling up/creating a character
PTLEFT           = $7E0760

UNKNOWN_7E0761   = $7E0761
UNKNOWN_7E0762   = $7E0762
UNKNOWN_7E0763   = $7E0763

; Copy of stats and stat bonuses before the level up
STSTR            = $7E0764
STINT            = $7E0766
STMAG            = $7E0768
STSTM            = $7E076A
STSPD            = $7E076C
STLUK            = $7E076E

BNSTR            = $7E0770
BNINT            = $7E0772
BNMAG            = $7E0774
BNSTM            = $7E0776
BNSPD            = $7E0778
BNLUK            = $7E077A


UNKNOWN_7E077C   = $7E077C
UNKNOWN_7E077D   = $7E077D
UNKNOWN_7E077E   = $7E077E
UNKNOWN_7E077F   = $7E077F

; Inventory
; 2 bytes for each item
; low byte is item ID
; high byte is quantity held
ITEMS            = $7E0780


; Game progress flags
; see «resources/progressflags.txt»
PROGRESS         = $7E07C0


UNKNOWN_7E07E0   = $7E07E0
UNKNOWN_7E07E1   = $7E07E1
UNKNOWN_7E07E2   = $7E07E2
UNKNOWN_7E07E3   = $7E07E3
UNKNOWN_7E07E4   = $7E07E4
UNKNOWN_7E07E5   = $7E07E5
UNKNOWN_7E07E6   = $7E07E6
UNKNOWN_7E07E7   = $7E07E7
UNKNOWN_7E07E8   = $7E07E8
UNKNOWN_7E07E9   = $7E07E9
UNKNOWN_7E07EA   = $7E07EA
UNKNOWN_7E07EB   = $7E07EB
UNKNOWN_7E07EC   = $7E07EC
UNKNOWN_7E07ED   = $7E07ED

; Mirror of moon phase? TODO
UNKNOWN_7E07EE   = $7E07EE
UNKNOWN_7E07EF   = $7E07EF
UNKNOWN_7E07F0   = $7E07F0
UNKNOWN_7E07F1   = $7E07F1
UNKNOWN_7E07F2   = $7E07F2
UNKNOWN_7E07F3   = $7E07F3
UNKNOWN_7E07F4   = $7E07F4

; Overworld coordinates
OWX              = $7E07F5
OWY              = $7E07F6

UNKNOWN_7E07F7   = $7E07F7
UNKNOWN_7E07F8   = $7E07F8
UNKNOWN_7E07F9   = $7E07F9
UNKNOWN_7E07FA   = $7E07FA
UNKNOWN_7E07FB   = $7E07FB
UNKNOWN_7E07FC   = $7E07FC
UNKNOWN_7E07FD   = $7E07FD
UNKNOWN_7E07FE   = $7E07FE
UNKNOWN_7E07FF   = $7E07FF

;===================================================================================================
; Block 2 - copied from [x100,x6FF] to [7E1000,7E15FF]
;===================================================================================================
; Every 0x60 bytes here corresponds to the statistics and properties of a single character:
;   $1000   +0x000   Main character
;   $1060   +0x060   Female hero
;   $10C0   +0x0C0   Law hero
;   $1120   +0x120   Chaos hero
;   $1180   +0x180   Demon 0
;   $11E0   +0x1E0   Demon 1
;   $1240   +0x240   Demon 2
;   $12A0   +0x2A0   Demon 3
;   $1300   +0x300   Demon 4
;   $1360   +0x360   Demon 5
;   $13C0   +0x3C0   Demon 6
;   $1420   +0x420   Demon 7
;   $1480   +0x480   Demon 8
;   $14E0   +0x4E0   Demon 9
;   $1540   +0x540   Demon A
;   $15A0   +0x5A0   Demon B

; Humans are documented first
; See below for demons
MC_7E1000        = $7E1000

; Status affliction bitfield
MCSTAFL          = $7E1002

; TODO not sure yet for humans
MC_7E1004        = $7E1004

MC_7E1006        = $7E1006
MC_7E1007        = $7E1007

; Action
; .... .... ...d ....
;   d - defend
MCACT            = $7E1008

; Level
MCLEVEL          = $7E100A

; Current XP
MCXP             = $7E100C

; Self-explanatory stats
MCSTR            = $7E1010
MCINT            = $7E1012
MCMAG            = $7E1014
MCSTM            = $7E1016
MCSPD            = $7E1018
MCLUK            = $7E101A

; Alignment
MCALIGN         = $7E101C

; Sword and gun stats
MCSWDPOW         = $7E101E
MCSWDACC         = $7E1020

MCGUNPOW         = $7E1022
MCGUNACC         = $7E1024

; Defense
MCDEF            = $7E1026

; Evasion
MCEVD            = $7E1028

; Magic power and effect
MCMPOW           = $7E102A
MCMEFF           = $7E102C

; Health and max health
MCHPCUR          = $7E102E
MCHPMAX          = $7E1030

; MP and max MP
MCMPCUR          = $7E1032
MCMPMAX          = $7E1034

; Self explanatory stat bonuses
MCBNSSTR         = $7E1036
MCBNSINT         = $7E1038
MCBNSMAG         = $7E103A
MCBNSSTM         = $7E103C
MCBNSSPD         = $7E103E
MCBNSLUK         = $7E1040

; Equips
MCSWORD          = $7E1042
MCGUN            = $7E1044
MCAMMO           = $7E1046
MCHEAD           = $7E1048
MCBODY           = $7E104A
MCARMS           = $7E104C
MCLEGS           = $7E104E

;---------------------------------------------------------------------------------------------------
; Demon stat differences (this also applies to $7E:1600)
;---------------------------------------------------------------------------------------------------
; 1004/1604 - Demon ID (with 0x100+ meaning boss battles)
; 1022/1622 - Power
; 1024/1624 - Accuracy
; 103E/163E - Move 1
; 1040/1640 - Move 2
; 1042/1642 - Move 3
; 1044/1644 - XP/Drop rate
; 1048/1648 - Money/Mag drop rate
; 104A/164A - CP
;---------------------------------------------------------------------------------------------------
; The following variables are now nothing:
; 101E/161E
; 1020/1620
; 104E/164E
;---------------------------------------------------------------------------------------------------

;===================================================================================================
; Block 3 - copied from [x700,x7FF] to [7E0400,7E04FF]
;===================================================================================================

; Some sort of bitfield
; m... ....
;   m - Mapper active
UNKNOWN_7E0400   = $7E0400
UNKNOWN_7E0401   = $7E0401
UNKNOWN_7E0402   = $7E0402
UNKNOWN_7E0403   = $7E0403
UNKNOWN_7E0404   = $7E0404


; Current money, whether it's Yen or Macca
CASH             = $7E0405

; Current magnetite
MAG              = $7E0409


; Current and previous direction
DIR              = $7E040D
DIRPREV          = $7E040E

; Moon phase
; mmmm ssss
;   m - phase
;   s - steps for phase
MOON             = $7E040F

; Character names
; Exactly 8 characters is the maximum
; Names shorter than 8 characters are terminated with FF
MCNAME           = $7E0410
FMNAME           = $7E0418
LHNAME           = $7E0420
CHNAME           = $7E0428

UNKNOWN_7E0430   = $7E0430
UNKNOWN_7E0431   = $7E0431
UNKNOWN_7E0432   = $7E0432
UNKNOWN_7E0433   = $7E0433
UNKNOWN_7E0434   = $7E0434
UNKNOWN_7E0435   = $7E0435
UNKNOWN_7E0436   = $7E0436
UNKNOWN_7E0437   = $7E0437
UNKNOWN_7E0438   = $7E0438
UNKNOWN_7E0439   = $7E0439
UNKNOWN_7E043A   = $7E043A
UNKNOWN_7E043B   = $7E043B
UNKNOWN_7E043C   = $7E043C
UNKNOWN_7E043D   = $7E043D
UNKNOWN_7E043E   = $7E043E
UNKNOWN_7E043F   = $7E043F
UNKNOWN_7E0440   = $7E0440
UNKNOWN_7E0441   = $7E0441
UNKNOWN_7E0442   = $7E0442
UNKNOWN_7E0443   = $7E0443
UNKNOWN_7E0444   = $7E0444
UNKNOWN_7E0445   = $7E0445
UNKNOWN_7E0446   = $7E0446
UNKNOWN_7E0447   = $7E0447
UNKNOWN_7E0448   = $7E0448
UNKNOWN_7E0449   = $7E0449
UNKNOWN_7E044A   = $7E044A
UNKNOWN_7E044B   = $7E044B
UNKNOWN_7E044C   = $7E044C
UNKNOWN_7E044D   = $7E044D
UNKNOWN_7E044E   = $7E044E
UNKNOWN_7E044F   = $7E044F

; Last turn action?
;   1 - right
;   2 - left
;   3 - turn around (down)
UNKNOWN_7E0450   = $7E0450

; Frame counter
FRAME            = $7E0451

UNKNOWN_7E0452   = $7E0452
UNKNOWN_7E0453   = $7E0453
UNKNOWN_7E0454   = $7E0454
UNKNOWN_7E0455   = $7E0455
UNKNOWN_7E0456   = $7E0456
UNKNOWN_7E0457   = $7E0457
UNKNOWN_7E0458   = $7E0458
UNKNOWN_7E0459   = $7E0459

; Current dungeon ID
DGID             = $7E045A

UNKNOWN_7E045B   = $7E045B

; Total mag taken per step (x10 with rollover)
MAGCP            = $7E045C


UNKNOWN_7E045E   = $7E045E
UNKNOWN_7E045F   = $7E045F
UNKNOWN_7E0460   = $7E0460
UNKNOWN_7E0461   = $7E0461
UNKNOWN_7E0462   = $7E0462
UNKNOWN_7E0463   = $7E0463
UNKNOWN_7E0464   = $7E0464
UNKNOWN_7E0465   = $7E0465
UNKNOWN_7E0466   = $7E0466
UNKNOWN_7E0467   = $7E0467
UNKNOWN_7E0468   = $7E0468
UNKNOWN_7E0469   = $7E0469

; Caches destintation properties for teleporting
; direction, theme, x coord, y coord
TPDIR            = $7E046A
TPTHM            = $7E046B
TPUWX            = $7E046C
TPUWY            = $7E046D


UNKNOWN_7E046E   = $7E046E
UNKNOWN_7E046F   = $7E046F
UNKNOWN_7E0470   = $7E0470
UNKNOWN_7E0471   = $7E0471
UNKNOWN_7E0472   = $7E0472
UNKNOWN_7E0473   = $7E0473
UNKNOWN_7E0474   = $7E0474
UNKNOWN_7E0475   = $7E0475
UNKNOWN_7E0476   = $7E0476
UNKNOWN_7E0477   = $7E0477
UNKNOWN_7E0478   = $7E0478
UNKNOWN_7E0479   = $7E0479
UNKNOWN_7E047A   = $7E047A
UNKNOWN_7E047B   = $7E047B
UNKNOWN_7E047C   = $7E047C
UNKNOWN_7E047D   = $7E047D
UNKNOWN_7E047E   = $7E047E
UNKNOWN_7E047F   = $7E047F
UNKNOWN_7E0480   = $7E0480
UNKNOWN_7E0481   = $7E0481
UNKNOWN_7E0482   = $7E0482
UNKNOWN_7E0483   = $7E0483
UNKNOWN_7E0484   = $7E0484
UNKNOWN_7E0485   = $7E0485
UNKNOWN_7E0486   = $7E0486
UNKNOWN_7E0487   = $7E0487
UNKNOWN_7E0488   = $7E0488
UNKNOWN_7E0489   = $7E0489
UNKNOWN_7E048A   = $7E048A
UNKNOWN_7E048B   = $7E048B
UNKNOWN_7E048C   = $7E048C
UNKNOWN_7E048D   = $7E048D
UNKNOWN_7E048E   = $7E048E
UNKNOWN_7E048F   = $7E048F
UNKNOWN_7E0490   = $7E0490
UNKNOWN_7E0491   = $7E0491
UNKNOWN_7E0492   = $7E0492
UNKNOWN_7E0493   = $7E0493
UNKNOWN_7E0494   = $7E0494
UNKNOWN_7E0495   = $7E0495
UNKNOWN_7E0496   = $7E0496
UNKNOWN_7E0497   = $7E0497
UNKNOWN_7E0498   = $7E0498
UNKNOWN_7E0499   = $7E0499
UNKNOWN_7E049A   = $7E049A
UNKNOWN_7E049B   = $7E049B
UNKNOWN_7E049C   = $7E049C
UNKNOWN_7E049D   = $7E049D
UNKNOWN_7E049E   = $7E049E
UNKNOWN_7E049F   = $7E049F
UNKNOWN_7E04A0   = $7E04A0
UNKNOWN_7E04A1   = $7E04A1
UNKNOWN_7E04A2   = $7E04A2
UNKNOWN_7E04A3   = $7E04A3
UNKNOWN_7E04A4   = $7E04A4
UNKNOWN_7E04A5   = $7E04A5
UNKNOWN_7E04A6   = $7E04A6
UNKNOWN_7E04A7   = $7E04A7
UNKNOWN_7E04A8   = $7E04A8
UNKNOWN_7E04A9   = $7E04A9
UNKNOWN_7E04AA   = $7E04AA
UNKNOWN_7E04AB   = $7E04AB
UNKNOWN_7E04AC   = $7E04AC
UNKNOWN_7E04AD   = $7E04AD
UNKNOWN_7E04AE   = $7E04AE
UNKNOWN_7E04AF   = $7E04AF

; Some overworld movement counter that caps at 1000 TODO did i mean 1000 or $1000?
UNKNOWN_7E04B0   = $7E04B0

UNKNOWN_7E04B2   = $7E04B2
UNKNOWN_7E04B3   = $7E04B3
UNKNOWN_7E04B4   = $7E04B4
UNKNOWN_7E04B5   = $7E04B5
UNKNOWN_7E04B6   = $7E04B6
UNKNOWN_7E04B7   = $7E04B7
UNKNOWN_7E04B8   = $7E04B8
UNKNOWN_7E04B9   = $7E04B9
UNKNOWN_7E04BA   = $7E04BA
UNKNOWN_7E04BB   = $7E04BB
UNKNOWN_7E04BC   = $7E04BC
UNKNOWN_7E04BD   = $7E04BD
UNKNOWN_7E04BE   = $7E04BE
UNKNOWN_7E04BF   = $7E04BF
UNKNOWN_7E04C0   = $7E04C0
UNKNOWN_7E04C1   = $7E04C1
UNKNOWN_7E04C2   = $7E04C2
UNKNOWN_7E04C3   = $7E04C3
UNKNOWN_7E04C4   = $7E04C4
UNKNOWN_7E04C5   = $7E04C5
UNKNOWN_7E04C6   = $7E04C6
UNKNOWN_7E04C7   = $7E04C7
UNKNOWN_7E04C8   = $7E04C8
UNKNOWN_7E04C9   = $7E04C9
UNKNOWN_7E04CA   = $7E04CA
UNKNOWN_7E04CB   = $7E04CB
UNKNOWN_7E04CC   = $7E04CC
UNKNOWN_7E04CD   = $7E04CD
UNKNOWN_7E04CE   = $7E04CE
UNKNOWN_7E04CF   = $7E04CF
UNKNOWN_7E04D0   = $7E04D0
UNKNOWN_7E04D1   = $7E04D1
UNKNOWN_7E04D2   = $7E04D2
UNKNOWN_7E04D3   = $7E04D3
UNKNOWN_7E04D4   = $7E04D4
UNKNOWN_7E04D5   = $7E04D5
UNKNOWN_7E04D6   = $7E04D6
UNKNOWN_7E04D7   = $7E04D7
UNKNOWN_7E04D8   = $7E04D8
UNKNOWN_7E04D9   = $7E04D9
UNKNOWN_7E04DA   = $7E04DA
UNKNOWN_7E04DB   = $7E04DB
UNKNOWN_7E04DC   = $7E04DC
UNKNOWN_7E04DD   = $7E04DD
UNKNOWN_7E04DE   = $7E04DE
UNKNOWN_7E04DF   = $7E04DF
UNKNOWN_7E04E0   = $7E04E0
UNKNOWN_7E04E1   = $7E04E1
UNKNOWN_7E04E2   = $7E04E2
UNKNOWN_7E04E3   = $7E04E3
UNKNOWN_7E04E4   = $7E04E4
UNKNOWN_7E04E5   = $7E04E5
UNKNOWN_7E04E6   = $7E04E6
UNKNOWN_7E04E7   = $7E04E7
UNKNOWN_7E04E8   = $7E04E8
UNKNOWN_7E04E9   = $7E04E9
UNKNOWN_7E04EA   = $7E04EA
UNKNOWN_7E04EB   = $7E04EB
UNKNOWN_7E04EC   = $7E04EC
UNKNOWN_7E04ED   = $7E04ED
UNKNOWN_7E04EE   = $7E04EE
UNKNOWN_7E04EF   = $7E04EF
UNKNOWN_7E04F0   = $7E04F0
UNKNOWN_7E04F1   = $7E04F1
UNKNOWN_7E04F2   = $7E04F2
UNKNOWN_7E04F3   = $7E04F3
UNKNOWN_7E04F4   = $7E04F4
UNKNOWN_7E04F5   = $7E04F5
UNKNOWN_7E04F6   = $7E04F6
UNKNOWN_7E04F7   = $7E04F7
UNKNOWN_7E04F8   = $7E04F8
UNKNOWN_7E04F9   = $7E04F9
UNKNOWN_7E04FA   = $7E04FA
UNKNOWN_7E04FB   = $7E04FB
UNKNOWN_7E04FC   = $7E04FC
UNKNOWN_7E04FD   = $7E04FD
UNKNOWN_7E04FE   = $7E04FE
UNKNOWN_7E04FF   = $7E04FF

;===================================================================================================
; Block 4 - copied from [x800,xDFF] to [7E3000,7E35FF]
;===================================================================================================
; Visited map squares
ROOMVISITS       = $7E3000

UNKNOWN_7E3100   = $7E3100

; Chests unlocked
CHESTSOPENED     = $7E3400

UNKNOWN_7E3500   = $7E3500
