arch 65816
lorom
check bankcross off
math pri on

org $008000

table "textcharmap.txt"

incsrc "registers.asm"
incsrc "registers_spc.asm"
incsrc "macros_and_functions.asm"
incsrc "spcdefines.asm"

;===================================================================================================
; Code
;===================================================================================================
incsrc "bank_00.asm"
incsrc "bank_01.asm"
incsrc "bank_02.asm"
incsrc "bank_03.asm"

;===================================================================================================
; Data
;===================================================================================================
incsrc "bank_04.asm"
incsrc "bank_05.asm"
incsrc "bank_06.asm" ; and a little bit of code
incsrc "bank_07.asm"

;===================================================================================================
; Text
;===================================================================================================
incsrc "bank_08.asm"
incsrc "bank_09.asm"
incsrc "bank_0A.asm"
incsrc "bank_0B.asm"

;===================================================================================================
; Music
;===================================================================================================
incsrc "bank_0C.asm"
incsrc "bank_0D.asm"
incsrc "bank_0E.asm"

;===================================================================================================
; More code
;===================================================================================================
incsrc "bank_0F.asm"

;===================================================================================================
; Graphics
;===================================================================================================
incsrc "bank_10.asm"

;---------------------------------------------------------------------------------------------------

; Dungeon themes
org $118000 : DungeonTheme0GFX: incbin "bin/gfx/dungeon/theme0.4bpp"
org $128000 : DungeonTheme1GFX: incbin "bin/gfx/dungeon/theme1.4bpp"
org $138000 : DungeonTheme2GFX: incbin "bin/gfx/dungeon/theme2.4bpp"
org $148000 : DungeonTheme3GFX: incbin "bin/gfx/dungeon/theme3.4bpp"
org $158000 : DungeonTheme4GFX: incbin "bin/gfx/dungeon/theme4.4bpp"
org $168000 : DungeonTheme5GFX: incbin "bin/gfx/dungeon/theme5.4bpp"

;---------------------------------------------------------------------------------------------------

incsrc "bank_17.asm"
incsrc "bank_18.asm"
incsrc "bank_19.asm"
incsrc "bank_1A.asm"
incsrc "bank_1B.asm"
incsrc "bank_1C.asm"
incsrc "bank_1D.asm"
incsrc "bank_1E.asm"
incsrc "bank_1F.asm"
incsrc "bank_20.asm"
incsrc "bank_21.asm"
incsrc "bank_22.asm"
incsrc "bank_23.asm"
incsrc "bank_24.asm"
incsrc "bank_25.asm"
incsrc "bank_26.asm"
incsrc "bank_27.asm"
incsrc "bank_28.asm"
incsrc "bank_29.asm"
incsrc "bank_2A.asm"
incsrc "bank_2B.asm"
incsrc "bank_2C.asm"
incsrc "bank_2D.asm"
incsrc "bank_2E.asm"
incsrc "bank_2F.asm"
