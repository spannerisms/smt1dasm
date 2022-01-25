org $0B8000

;===================================================================================================

Message_03_Pointers:
#_0B8000: dw Message_03_00_Pointers
#_0B8002: dw Message_03_01_Pointers
#_0B8004: dw Message_03_02_Pointers
#_0B8006: dw Message_03_03_Pointers
#_0B8008: dw Message_03_04_Pointers
#_0B800A: dw Message_03_05_Pointers
#_0B800C: dw Message_03_06_Pointers
#_0B800E: dw Message_03_07_Pointers
#_0B8010: dw Message_03_08_Pointers
#_0B8012: dw Message_03_09_Pointers
#_0B8014: dw Message_03_0A_Pointers

;===================================================================================================

Message_03_02_00:
#_0B8016: db $D2, $9B, $0B ; test progress bit 9B for message 0B
#_0B8019: db $D2, $9D, $0B ; test progress bit 9D for message 0B
#_0B801C: db $FE, $04, $01, $0B ; ext command 04: message 01 if 11C >= 112; 0B if >= 144
#_0B8020: db $D3, $0B ; go to message 0B

;===================================================================================================

; «ロウヒーロー»:
; «メシアきょう»の せいち «カテドラル»へ
; ようこそ [CHASE]くん
; かみの «せんねんおうこく»は
; まもなく げんじつのものと なるでしょう
; しかし «カテドラル»には おおくの アクマが
; はいりこんで «しまいました»
; このままで かみのおいでを
; まつわけには いきません
Message_03_02_01:
#_0B8022: db $D2, $CD, $10 ; test progress bit CD for message 10
#_0B8025: db $D5, $45 ; send 45 to APU
#_0B8027: db $DE, $01, $00, $1B, $01 ; load 1x demon 011B
#_0B802C: db $E4, $00 ; load demon $00
#_0B802E: db $F2, $66 ; prewritten text 66
#_0B8030: db $9A ; :
#_0B8031: db $F9 ; new line
#_0B8032: db $D2, $C9, $0E ; test progress bit C9 for message 0E
#_0B8035: db $D2, $CA, $0F ; test progress bit CA for message 0F
#_0B8038: db $D2, $95, $06 ; test progress bit 95 for message 06
#_0B803B: db $E9, $00, $0D ; go to message 0D maybe TODO
#_0B803E: db $F2, $33 ; prewritten text 33
#_0B8040: db $3D, $CF, $32, $26, $35, $CF ; の⎵せいち⎵
#_0B8046: db $F2, $5C ; prewritten text 5C
#_0B8048: db $41 ; へ
#_0B8049: db $F9 ; new line
#_0B804A: db $4A, $27, $2E, $33, $CF ; ようこそ⎵
#_0B804F: db $F0 ; write player name
#_0B8050: db $2C, $52 ; くん
#_0B8052: db $FC ; wait for key and new line
#_0B8053: db $FA ; clear message box
#_0B8054: db $2A, $44, $3D, $CF ; かみの⎵
#_0B8058: db $F2, $21 ; prewritten text 21
#_0B805A: db $3E ; は
#_0B805B: db $F9 ; new line
#_0B805C: db $43, $47, $39, $2C, $CF, $9F, $52, $A2 ; まもなく⎵げんじ
#_0B8064: db $36, $3D, $47, $3D, $38, $CF, $39, $4D ; つのものと⎵なる
#_0B806C: db $A9, $30, $57, $27 ; でしょう
#_0B8070: db $F9 ; new line
#_0B8071: db $30, $2A, $30, $CF ; しかし⎵
#_0B8075: db $F2, $5C ; prewritten text 5C
#_0B8077: db $3A, $3E, $CF, $29, $29, $2C, $3D, $CF ; には⎵おおくの⎵
#_0B807F: db $5D, $64, $7B, $9C ; アクマが
#_0B8083: db $F9 ; new line
#_0B8084: db $3E, $26, $4C, $2E, $52, $A9, $CF ; はいりこんで⎵
#_0B808B: db $F2, $8B ; prewritten text 8B
#_0B808D: db $F9 ; new line
#_0B808E: db $2E, $3D, $43, $43, $A9, $CF, $2A, $44 ; このままで⎵かみ
#_0B8096: db $3D, $29, $26, $A9, $51 ; のおいでを
#_0B809B: db $F9 ; new line
#_0B809C: db $43, $36, $50, $2D, $3A, $3E, $CF, $26 ; まつわけには⎵い
#_0B80A4: db $2B, $43, $32, $52 ; きません
#_0B80A8: db $FC ; wait for key and new line
#_0B80A9: db $D0, $95 ; set progress bit 95

;===================================================================================================

; ところで まだ «トウキョウ»には
; かみの じゃまをする ふとどきものが います
; してんのうと なのって «トウキョウ»の
; しほうに いる 4ひきのオニです
Message_03_02_02:
#_0B80AB: db $D2, $9F, $04 ; test progress bit 9F for message 04
#_0B80AE: db $D2, $99, $03 ; test progress bit 99 for message 03
#_0B80B1: db $FA ; clear message box
#_0B80B2: db $38, $2E, $4F, $A9, $CF, $43, $A6, $CF ; ところで⎵まだ⎵
#_0B80BA: db $F2, $1C ; prewritten text 1C
#_0B80BC: db $3A, $3E ; には
#_0B80BE: db $F9 ; new line
#_0B80BF: db $2A, $44, $3D, $CF, $A2, $55, $43, $51 ; かみの⎵じゃまを
#_0B80C7: db $31, $4D, $CF, $40, $38, $AA, $2B, $47 ; する⎵ふとどきも
#_0B80CF: db $3D, $9C, $CF, $26, $43, $31 ; のが⎵います
#_0B80D5: db $F9 ; new line
#_0B80D6: db $30, $37, $52, $3D, $27, $38, $CF, $39 ; してんのうと⎵な
#_0B80DE: db $3D, $58, $37, $CF ; のって⎵
#_0B80E2: db $F2, $1C ; prewritten text 1C
#_0B80E4: db $3D ; の
#_0B80E5: db $F9 ; new line
#_0B80E6: db $30, $42, $27, $3A, $CF, $26, $4D, $CF ; しほうに⎵いる⎵
#_0B80EE: db $05, $3F, $2B, $3D, $61, $72, $A9, $31 ; 4ひきのオニです
#_0B80F6: db $FC ; wait for key and new line

;===================================================================================================

; [CHASE]くん
; してんのうを たいじしてください
; ぼくは «カテドラル»を
; はなれるわけには いかないのです
; ぜひ «おねがいします»«・・・»
Message_03_02_03:
#_0B80F7: db $FA ; clear message box
#_0B80F8: db $F0 ; write player name
#_0B80F9: db $2C, $52 ; くん
#_0B80FB: db $F9 ; new line
#_0B80FC: db $30, $37, $52, $3D, $27, $51, $CF, $34 ; してんのうを⎵た
#_0B8104: db $26, $A2, $30, $37, $2C, $A6, $2F, $26 ; いじしてください
#_0B810C: db $F9 ; new line
#_0B810D: db $AF, $2C, $3E, $CF ; ぼくは⎵
#_0B8111: db $F2, $5C ; prewritten text 5C
#_0B8113: db $51 ; を
#_0B8114: db $F9 ; new line
#_0B8115: db $3E, $39, $4E, $4D, $50, $2D, $3A, $3E ; はなれるわけには
#_0B811D: db $CF, $26, $2A, $39, $26, $3D, $A9, $31 ; ⎵いかないのです
#_0B8125: db $FC ; wait for key and new line
#_0B8126: db $FA ; clear message box
#_0B8127: db $A4, $3F, $CF ; ぜひ⎵
#_0B812A: db $F2, $4A ; prewritten text 4A
#_0B812C: db $F2, $0B ; prewritten text 0B
#_0B812E: db $FC ; wait for key and new line
#_0B812F: db $D0, $99 ; set progress bit 99
#_0B8131: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8133: db $FF ; end of message

;===================================================================================================

; «・・・»ああ ついに かみの いかりが
; ちじょうに くだされました
Message_03_02_04:
#_0B8134: db $FE, $73 ; ext command 73: Call routine 0F9833 TODO
#_0B8136: db $FA ; clear message box
#_0B8137: db $F2, $0B ; prewritten text 0B
#_0B8139: db $25, $25, $CF, $36, $26, $3A, $CF, $2A ; ああ⎵ついに⎵か
#_0B8141: db $44, $3D, $CF, $26, $2A, $4C, $9C ; みの⎵いかりが
#_0B8148: db $F9 ; new line
#_0B8149: db $35, $A2, $57, $27, $3A, $CF, $2C, $A6 ; ちじょうに⎵くだ
#_0B8151: db $2F, $4E, $43, $30, $34 ; されました
#_0B8156: db $FC ; wait for key and new line
#_0B8157: db $FA ; clear message box

;===================================================================================================

; じゃあくな ちからに みちあふれた «トウキョウ»は
; かんぜんに そのすがたを けしました
; «トウキョウ»が どうなったか
; そのめで たしかめてみれば よいでしょう
Message_03_02_05:
#_0B8158: db $A2, $55, $25, $2C, $39, $CF, $35, $2A ; じゃあくな⎵ちか
#_0B8160: db $4B, $3A, $CF, $44, $35, $25, $40, $4E ; らに⎵みちあふれ
#_0B8168: db $34, $CF ; た⎵
#_0B816A: db $F2, $1C ; prewritten text 1C
#_0B816C: db $3E ; は
#_0B816D: db $F9 ; new line
#_0B816E: db $2A, $52, $A4, $52, $3A, $CF, $33, $3D ; かんぜんに⎵その
#_0B8176: db $31, $9C, $34, $51, $CF, $2D, $30, $43 ; すがたを⎵けしま
#_0B817E: db $30, $34 ; した
#_0B8180: db $FC ; wait for key and new line
#_0B8181: db $FA ; clear message box
#_0B8182: db $F2, $1C ; prewritten text 1C
#_0B8184: db $9C, $CF, $AA, $27, $39, $58, $34, $2A ; が⎵どうなったか
#_0B818C: db $F9 ; new line
#_0B818D: db $33, $3D, $46, $A9, $CF, $34, $30, $2A ; そのめで⎵たしか
#_0B8195: db $46, $37, $44, $4E, $AB, $CF, $4A, $26 ; めてみれば⎵よい
#_0B819D: db $A9, $30, $57, $27 ; でしょう
#_0B81A1: db $FC ; wait for key and new line
#_0B81A2: db $D0, $9E ; set progress bit 9E
#_0B81A4: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B81A6: db $FF ; end of message

;===================================================================================================

; やあ [CHASE]くん
; ぶじで なによりです
Message_03_02_06:
#_0B81A7: db $D2, $9E, $07 ; test progress bit 9E for message 07
#_0B81AA: db $48, $25, $CF ; やあ⎵
#_0B81AD: db $F0 ; write player name
#_0B81AE: db $2C, $52 ; くん
#_0B81B0: db $F9 ; new line
#_0B81B1: db $AD, $A2, $A9, $CF, $39, $3A, $4A, $4C ; ぶじで⎵なにより
#_0B81B9: db $A9, $31 ; です
#_0B81BB: db $FC ; wait for key and new line
#_0B81BC: db $D3, $02 ; go to message 02

;===================================================================================================

Message_03_02_07:
#_0B81BE: db $D2, $D2, $08 ; test progress bit D2 for message 08
#_0B81C1: db $D3, $05 ; go to message 05

;===================================================================================================

; ひとつ こまったことが おこりました
; «シンジュク»とちょうで テンマ ラーヴァナと
; たたかっている マジン ヴィシュヌさまが
; ききに おちいっています
; ラーヴァナを たおさなければ かみは
; «カテドラル»に おりられないのです
Message_03_02_08:
#_0B81C3: db $D2, $97, $09 ; test progress bit 97 for message 09
#_0B81C6: db $3F, $38, $36, $CF, $2E, $43, $58, $34 ; ひとつ⎵こまった
#_0B81CE: db $2E, $38, $9C, $CF, $29, $2E, $4C, $43 ; ことが⎵おこりま
#_0B81D6: db $30, $34 ; した
#_0B81D8: db $FC ; wait for key and new line
#_0B81D9: db $FA ; clear message box
#_0B81DA: db $F2, $18 ; prewritten text 18
#_0B81DC: db $38, $35, $57, $27, $A9, $CF, $6F, $8A ; とちょうで⎵テン
#_0B81E4: db $7B, $CF, $83, $5A, $CE, $8B, $71, $38 ; マ⎵ラーヴァナと
#_0B81EC: db $F9 ; new line
#_0B81ED: db $34, $34, $2A, $58, $37, $26, $4D, $CF ; たたかっている⎵
#_0B81F5: db $7B, $BB, $8A, $CF, $CE, $8C, $68, $90 ; マジン⎵ヴィシュ
#_0B81FD: db $73, $2F, $43, $9C ; ヌさまが
#_0B8201: db $F9 ; new line
#_0B8202: db $2B, $2B, $3A, $CF, $29, $35, $26, $58 ; ききに⎵おちいっ
#_0B820A: db $37, $26, $43, $31 ; ています
#_0B820E: db $FC ; wait for key and new line
#_0B820F: db $FA ; clear message box
#_0B8210: db $83, $5A, $CE, $8B, $71, $51, $CF, $34 ; ラーヴァナを⎵た
#_0B8218: db $29, $2F, $39, $2D, $4E, $AB, $CF, $2A ; おさなければ⎵か
#_0B8220: db $44, $3E ; みは
#_0B8222: db $F9 ; new line
#_0B8223: db $F2, $5C ; prewritten text 5C
#_0B8225: db $3A, $CF, $29, $4C, $4B, $4E, $39, $26 ; に⎵おりられない
#_0B822D: db $3D, $A9, $31 ; のです
#_0B8230: db $FC ; wait for key and new line
#_0B8231: db $D3, $0A ; go to message 0A

;===================================================================================================

; ぼくは まだ «カテドラル»を
; はなれるわけには いきません
Message_03_02_09:
#_0B8233: db $AF, $2C, $3E, $CF, $43, $A6, $CF ; ぼくは⎵まだ⎵
#_0B823A: db $F2, $5C ; prewritten text 5C
#_0B823C: db $51 ; を
#_0B823D: db $F9 ; new line
#_0B823E: db $3E, $39, $4E, $4D, $50, $2D, $3A, $3E ; はなれるわけには
#_0B8246: db $CF, $26, $2B, $43, $32, $52 ; ⎵いきません
#_0B824C: db $FC ; wait for key and new line

;===================================================================================================

; ヴィシュヌさまを たすけてあげて ください
; [CHASE]くん きみだけが たよりです
; «おねがいします»
Message_03_02_0A:
#_0B824D: db $FA ; clear message box
#_0B824E: db $CE, $8C, $68, $90, $73, $2F, $43, $51 ; ヴィシュヌさまを
#_0B8256: db $CF, $34, $31, $2D, $37, $25, $9F, $37 ; ⎵たすけてあげて
#_0B825E: db $CF, $2C, $A6, $2F, $26 ; ⎵ください
#_0B8263: db $F9 ; new line
#_0B8264: db $F0 ; write player name
#_0B8265: db $2C, $52, $CF, $2B, $44, $A6, $2D, $9C ; くん⎵きみだけが
#_0B826D: db $CF, $34, $4A, $4C, $A9, $31 ; ⎵たよりです
#_0B8273: db $F9 ; new line
#_0B8274: db $F2, $4A ; prewritten text 4A
#_0B8276: db $FC ; wait for key and new line
#_0B8277: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8279: db $D0, $97 ; set progress bit 97
#_0B827B: db $FF ; end of message

;===================================================================================================

; «メシアきょう»と:
; このさきは まだまだ アクマたちが
; うろついていて きけんです
; われらが きゅうせいしゅ [JIMMY]さまも
; おくへと むかわれたのですが
; まだ おもどりに なりません
; いくなとは もうしませんが
; なにとぞ おきをつけて«・・・»
Message_03_02_0B:
#_0B827C: db $D6, $00, $85, $70, $28 ; place sprite 85 in slot 00 at XY:{70,28}
#_0B8281: db $F2, $33 ; prewritten text 33
#_0B8283: db $38, $9A ; と:
#_0B8285: db $F9 ; new line
#_0B8286: db $D2, $9B, $0C ; test progress bit 9B for message 0C
#_0B8289: db $2E, $3D, $2F, $2B, $3E, $CF, $43, $A6 ; このさきは⎵まだ
#_0B8291: db $43, $A6, $CF, $5D, $64, $7B, $34, $35 ; まだ⎵アクマたち
#_0B8299: db $9C ; が
#_0B829A: db $F9 ; new line
#_0B829B: db $27, $4F, $36, $26, $37, $26, $37, $CF ; うろついていて⎵
#_0B82A3: db $2B, $2D, $52, $A9, $31 ; きけんです
#_0B82A8: db $FC ; wait for key and new line
#_0B82A9: db $FA ; clear message box
#_0B82AA: db $50, $4E, $4B, $9C, $CF, $2B, $56, $27 ; われらが⎵きゅう
#_0B82B2: db $32, $26, $30, $56, $CF ; せいしゅ⎵
#_0B82B7: db $EE ; write lawful hero name
#_0B82B8: db $2F, $43, $47 ; さまも
#_0B82BB: db $F9 ; new line
#_0B82BC: db $29, $2C, $41, $38, $CF, $45, $2A, $50 ; おくへと⎵むかわ
#_0B82C4: db $4E, $34, $3D, $A9, $31, $9C ; れたのですが
#_0B82CA: db $F9 ; new line
#_0B82CB: db $43, $A6, $CF, $29, $47, $AA, $4C, $3A ; まだ⎵おもどりに
#_0B82D3: db $CF, $39, $4C, $43, $32, $52 ; ⎵なりません
#_0B82D9: db $FC ; wait for key and new line
#_0B82DA: db $FA ; clear message box
#_0B82DB: db $26, $2C, $39, $38, $3E, $CF, $47, $27 ; いくなとは⎵もう
#_0B82E3: db $30, $43, $32, $52, $9C ; しませんが
#_0B82E8: db $F9 ; new line
#_0B82E9: db $39, $3A, $38, $A5, $CF, $29, $2B, $51 ; なにとぞ⎵おきを
#_0B82F1: db $36, $2D, $37 ; つけて
#_0B82F4: db $F2, $0B ; prewritten text 0B
#_0B82F6: db $FC ; wait for key and new line
#_0B82F7: db $FA ; clear message box
#_0B82F8: db $D6, $00, $00 ; delete sprite in slot 00
#_0B82FB: db $D6, $01, $6F, $60, $28 ; place sprite 6F in slot 01 at XY:{60,28}
#_0B8300: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B8303: db $D6, $01, $78, $60, $28 ; place sprite 78 in slot 01 at XY:{60,28}
#_0B8308: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B830B: db $D6, $01, $00 ; delete sprite in slot 01
#_0B830E: db $FE, $1A, $2B, $39, $13, $00, $00, $00 ; ext command 1A: 2B,39,13,00,00,00
#_0B8316: db $D3, $13 ; go to message 13

;===================================================================================================

; ここは «カテドラル»に はいった
; «メシアきょう»とのための まちです
; ここは アクマのてから まもられております
; かみの ごかごの おかげでしょう
Message_03_02_0C:
#_0B8318: db $2E, $2E, $3E, $CF ; ここは⎵
#_0B831C: db $F2, $5C ; prewritten text 5C
#_0B831E: db $3A, $CF, $3E, $26, $58, $34 ; に⎵はいった
#_0B8324: db $F9 ; new line
#_0B8325: db $F2, $33 ; prewritten text 33
#_0B8327: db $38, $3D, $34, $46, $3D, $CF, $43, $35 ; とのための⎵まち
#_0B832F: db $A9, $31 ; です
#_0B8331: db $FC ; wait for key and new line
#_0B8332: db $FA ; clear message box
#_0B8333: db $2E, $2E, $3E, $CF, $5D, $64, $7B, $3D ; ここは⎵アクマの
#_0B833B: db $37, $2A, $4B, $CF, $43, $47, $4B, $4E ; てから⎵まもられ
#_0B8343: db $37, $29, $4C, $43, $31 ; ております
#_0B8348: db $F9 ; new line
#_0B8349: db $2A, $44, $3D, $CF, $A0, $2A, $A0, $3D ; かみの⎵ごかごの
#_0B8351: db $CF, $29, $2A, $9F, $A9, $30, $57, $27 ; ⎵おかげでしょう
#_0B8359: db $FC ; wait for key and new line
#_0B835A: db $D1, $9B ; clear progress bit 9B
#_0B835C: db $FE, $1A, $2B, $BC, $13, $00, $00, $00 ; ext command 1A: 2B,BC,13,00,00,00
#_0B8364: db $FF ; end of message

;===================================================================================================

; [CHASE]くん! だいじょうぶですか!
; はやく てあてを«・・・»
Message_03_02_0D:
#_0B8365: db $F0 ; write player name
#_0B8366: db $2C, $52, $94, $CF, $A6, $26, $A2, $57 ; くん!⎵だいじょ
#_0B836E: db $27, $AD, $A9, $31, $2A, $94 ; うぶですか!
#_0B8374: db $F9 ; new line
#_0B8375: db $3E, $48, $2C, $CF, $37, $25, $37, $51 ; はやく⎵てあてを
#_0B837D: db $F2, $0B ; prewritten text 0B
#_0B837F: db $FC ; wait for key and new line
#_0B8380: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8382: db $FF ; end of message

;===================================================================================================

; ヴィシュヌさまを たおしてしまったのですね
; もう きみに つたえることばは
; なにも ありません«・・・»
; つぎに あうとき ぼくは きみを
; かみの てきとして うちはたすでしょう
; ほんとうに ざんねんです
Message_03_02_0E:
#_0B8383: db $CE, $8C, $68, $90, $73, $2F, $43, $51 ; ヴィシュヌさまを
#_0B838B: db $CF, $34, $29, $30, $37, $30, $43, $58 ; ⎵たおしてしまっ
#_0B8393: db $34, $3D, $A9, $31, $3C ; たのですね
#_0B8398: db $FC ; wait for key and new line
#_0B8399: db $47, $27, $CF, $2B, $44, $3A, $CF, $36 ; もう⎵きみに⎵つ
#_0B83A1: db $34, $28, $4D, $2E, $38, $AB, $3E ; たえることばは
#_0B83A8: db $F9 ; new line
#_0B83A9: db $39, $3A, $47, $CF, $25, $4C, $43, $32 ; なにも⎵ありませ
#_0B83B1: db $52 ; ん
#_0B83B2: db $F2, $0B ; prewritten text 0B
#_0B83B4: db $FC ; wait for key and new line
#_0B83B5: db $FA ; clear message box
#_0B83B6: db $36, $9D, $3A, $CF, $25, $27, $38, $2B ; つぎに⎵あうとき
#_0B83BE: db $CF, $AF, $2C, $3E, $CF, $2B, $44, $51 ; ⎵ぼくは⎵きみを
#_0B83C6: db $F9 ; new line
#_0B83C7: db $2A, $44, $3D, $CF, $37, $2B, $38, $30 ; かみの⎵てきとし
#_0B83CF: db $37, $CF, $27, $35, $3E, $34, $31, $A9 ; て⎵うちはたすで
#_0B83D7: db $30, $57, $27 ; しょう
#_0B83DA: db $F9 ; new line
#_0B83DB: db $42, $52, $38, $27, $3A, $CF, $A1, $52 ; ほんとうに⎵ざん
#_0B83E3: db $3C, $52, $A9, $31 ; ねんです
#_0B83E7: db $FC ; wait for key and new line
#_0B83E8: db $D0, $CD ; set progress bit CD
#_0B83EA: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B83EC: db $FF ; end of message

;===================================================================================================

; ありがとう [CHASE]くん
; これからも ともに かみのため
; «せんねんおうこく»けんせつのため
; はたらきましょう
; ぼくは ミカエルさまから たのまれていることが
; あるので これでしつれいします
; [CHASE]くんは «カテドラル»に はいった
; カオスの アクマどもを たいじしてください
; では また あいましょう
Message_03_02_0F:
#_0B83ED: db $25, $4C, $9C, $38, $27, $CF ; ありがとう⎵
#_0B83F3: db $F0 ; write player name
#_0B83F4: db $2C, $52 ; くん
#_0B83F6: db $F9 ; new line
#_0B83F7: db $2E, $4E, $2A, $4B, $47, $CF, $38, $47 ; これからも⎵とも
#_0B83FF: db $3A, $CF, $2A, $44, $3D, $34, $46 ; に⎵かみのため
#_0B8406: db $F9 ; new line
#_0B8407: db $F2, $21 ; prewritten text 21
#_0B8409: db $2D, $52, $32, $36, $3D, $34, $46 ; けんせつのため
#_0B8410: db $F9 ; new line
#_0B8411: db $3E, $34, $4B, $2B, $43, $30, $57, $27 ; はたらきましょう
#_0B8419: db $FC ; wait for key and new line
#_0B841A: db $FA ; clear message box
#_0B841B: db $AF, $2C, $3E, $CF, $7C, $62, $60, $85 ; ぼくは⎵ミカエル
#_0B8423: db $2F, $43, $2A, $4B, $CF, $34, $3D, $43 ; さまから⎵たのま
#_0B842B: db $4E, $37, $26, $4D, $2E, $38, $9C ; れていることが
#_0B8432: db $F9 ; new line
#_0B8433: db $25, $4D, $3D, $A9, $CF, $2E, $4E, $A9 ; あるので⎵これで
#_0B843B: db $30, $36, $4E, $26, $30, $43, $31 ; しつれいします
#_0B8442: db $F9 ; new line
#_0B8443: db $F0 ; write player name
#_0B8444: db $2C, $52, $3E, $CF ; くんは⎵
#_0B8448: db $F2, $5C ; prewritten text 5C
#_0B844A: db $3A, $CF, $3E, $26, $58, $34 ; に⎵はいった
#_0B8450: db $F9 ; new line
#_0B8451: db $62, $61, $69, $3D, $CF, $5D, $64, $7B ; カオスの⎵アクマ
#_0B8459: db $AA, $47, $51, $CF, $34, $26, $A2, $30 ; どもを⎵たいじし
#_0B8461: db $37, $2C, $A6, $2F, $26 ; てください
#_0B8466: db $FC ; wait for key and new line
#_0B8467: db $D4, $03 ; set text box size to 3
#_0B8469: db $A9, $3E, $CF, $43, $34, $CF, $25, $26 ; では⎵また⎵あい
#_0B8471: db $43, $30, $57, $27 ; ましょう
#_0B8475: db $FC ; wait for key and new line
#_0B8476: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8478: db $D0, $CD ; set progress bit CD
#_0B847A: db $FF ; end of message

;===================================================================================================

Message_03_02_10:
#_0B847B: db $D2, $67, $11 ; test progress bit 67 for message 11
#_0B847E: db $D2, $0C, $11 ; test progress bit 0C for message 11
#_0B8481: db $D6, $01, $6F, $60, $28 ; place sprite 6F in slot 01 at XY:{60,28}

;===================================================================================================

; >«だれもいない»
Message_03_02_11:
#_0B8486: db $97 ; >
#_0B8487: db $F2, $2C ; prewritten text 2C
#_0B8489: db $FC ; wait for key and new line
#_0B848A: db $FF ; end of message

;===================================================================================================

Message_03_02_12:
#_0B848B: db $D1, $9B ; clear progress bit 9B
#_0B848D: db $FF ; end of message

;===================================================================================================

Message_03_02_13:
#_0B848E: db $D0, $9B ; set progress bit 9B
#_0B8490: db $FF ; end of message

;===================================================================================================

Message_03_02_14:
#_0B8491: db $D2, $9C, $20 ; test progress bit 9C for message 20
#_0B8494: db $D2, $9D, $20 ; test progress bit 9D for message 20
#_0B8497: db $FE, $04, $20, $15 ; ext command 04: message 20 if 11C >= 112; 15 if >= 144
#_0B849B: db $D3, $20 ; go to message 20

;===================================================================================================

; «カオスヒーロー»:
; [CHASE] ついに ここまできたか«・・・»
; あぶないところだったぜ
; もうすこしで «カテドラル»が
; かんせいする ところだった
; だが やつらの おもいどおりには させん
; なかには もう たくさんの アクマが
; はいりこんでる
; こんな じょうたいのところへ
; かみを よんでくるわけには いかないだろう
; あとは わるあがきしてる
; かみの てさきどもを
; ぜんぶ かたづければ «カテドラル»は
; カオスの しろと なるわけだ
Message_03_02_15:
#_0B849D: db $D2, $CE, $25 ; test progress bit CE for message 25
#_0B84A0: db $D5, $46 ; send 46 to APU
#_0B84A2: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0B84A7: db $E4, $00 ; load demon $00
#_0B84A9: db $D6, $01, $B3, $90, $28 ; place sprite B3 in slot 01 at XY:{90,28}
#_0B84AE: db $F2, $67 ; prewritten text 67
#_0B84B0: db $9A ; :
#_0B84B1: db $F9 ; new line
#_0B84B2: db $D2, $CA, $23 ; test progress bit CA for message 23
#_0B84B5: db $D2, $C9, $24 ; test progress bit C9 for message 24
#_0B84B8: db $D2, $9E, $1D ; test progress bit 9E for message 1D
#_0B84BB: db $D2, $96, $1C ; test progress bit 96 for message 1C
#_0B84BE: db $E9, $00, $22 ; go to message 22 maybe TODO
#_0B84C1: db $F0 ; write player name
#_0B84C2: db $DF, $DF ; delay 7 frames [x2]
#_0B84C4: db $CF, $36, $26, $3A, $CF, $2E, $2E, $43 ; ⎵ついに⎵ここま
#_0B84CC: db $A9, $2B, $34, $2A ; できたか
#_0B84D0: db $F2, $0B ; prewritten text 0B
#_0B84D2: db $FC ; wait for key and new line
#_0B84D3: db $FA ; clear message box
#_0B84D4: db $25, $AD, $39, $26, $38, $2E, $4F, $A6 ; あぶないところだ
#_0B84DC: db $58, $34, $A4 ; ったぜ
#_0B84DF: db $F9 ; new line
#_0B84E0: db $47, $27, $31, $2E, $30, $A9, $CF ; もうすこしで⎵
#_0B84E7: db $F2, $5C ; prewritten text 5C
#_0B84E9: db $9C ; が
#_0B84EA: db $F9 ; new line
#_0B84EB: db $2A, $52, $32, $26, $31, $4D, $CF, $38 ; かんせいする⎵と
#_0B84F3: db $2E, $4F, $A6, $58, $34 ; ころだった
#_0B84F8: db $F9 ; new line
#_0B84F9: db $A6, $9C, $CF, $48, $36, $4B, $3D, $CF ; だが⎵やつらの⎵
#_0B8501: db $29, $47, $26, $AA, $29, $4C, $3A, $3E ; おもいどおりには
#_0B8509: db $CF, $2F, $32, $52 ; ⎵させん
#_0B850D: db $FC ; wait for key and new line
#_0B850E: db $FA ; clear message box
#_0B850F: db $39, $2A, $3A, $3E, $CF, $47, $27, $CF ; なかには⎵もう⎵
#_0B8517: db $34, $2C, $2F, $52, $3D, $CF, $5D, $64 ; たくさんの⎵アク
#_0B851F: db $7B, $9C ; マが
#_0B8521: db $F9 ; new line
#_0B8522: db $3E, $26, $4C, $2E, $52, $A9, $4D ; はいりこんでる
#_0B8529: db $F9 ; new line
#_0B852A: db $2E, $52, $39, $CF, $A2, $57, $27, $34 ; こんな⎵じょうた
#_0B8532: db $26, $3D, $38, $2E, $4F, $41 ; いのところへ
#_0B8538: db $F9 ; new line
#_0B8539: db $2A, $44, $51, $CF, $4A, $52, $A9, $2C ; かみを⎵よんでく
#_0B8541: db $4D, $50, $2D, $3A, $3E, $CF, $26, $2A ; るわけには⎵いか
#_0B8549: db $39, $26, $A6, $4F, $27 ; ないだろう
#_0B854E: db $FC ; wait for key and new line
#_0B854F: db $FA ; clear message box
#_0B8550: db $25, $38, $3E, $CF, $50, $4D, $25, $9C ; あとは⎵わるあが
#_0B8558: db $2B, $30, $37, $4D ; きしてる
#_0B855C: db $F9 ; new line
#_0B855D: db $2A, $44, $3D, $CF, $37, $2F, $2B, $AA ; かみの⎵てさきど
#_0B8565: db $47, $51 ; もを
#_0B8567: db $F9 ; new line
#_0B8568: db $A4, $52, $AD, $CF, $2A, $34, $A8, $2D ; ぜんぶ⎵かたづけ
#_0B8570: db $4E, $AB, $CF ; れば⎵
#_0B8573: db $F2, $5C ; prewritten text 5C
#_0B8575: db $3E ; は
#_0B8576: db $F9 ; new line
#_0B8577: db $62, $61, $69, $3D, $CF, $30, $4F, $38 ; カオスの⎵しろと
#_0B857F: db $CF, $39, $4D, $50, $2D, $A6 ; ⎵なるわけだ
#_0B8585: db $FC ; wait for key and new line
#_0B8586: db $D0, $96 ; set progress bit 96

;===================================================================================================

; ところで いいことを おしえてやろうか
; してんのうのことは きいたこと あるか?
; キタに [DEMON1] ヒガシに [DEMON1]
; ミナミに [DEMON1] ニシに [DEMON1]が
; それぞれの ほうがくを まもっている
Message_03_02_16:
#_0B8588: db $D2, $9F, $1A ; test progress bit 9F for message 1A
#_0B858B: db $D2, $9A, $19 ; test progress bit 9A for message 19
#_0B858E: db $FA ; clear message box
#_0B858F: db $38, $2E, $4F, $A9, $CF, $26, $26, $2E ; ところで⎵いいこ
#_0B8597: db $38, $51, $CF, $29, $30, $28, $37, $48 ; とを⎵おしえてや
#_0B859F: db $4F, $27, $2A ; ろうか
#_0B85A2: db $F9 ; new line
#_0B85A3: db $30, $37, $52, $3D, $27, $3D, $2E, $38 ; してんのうのこと
#_0B85AB: db $3E, $CF, $2B, $26, $34, $2E, $38, $CF ; は⎵きいたこと⎵
#_0B85B3: db $25, $4D, $2A, $95 ; あるか?
#_0B85B7: db $F8, $17 ; YES/NO - go to message 17 if YES
#_0B85B9: db $D4, $03 ; set text box size to 3
#_0B85BB: db $DE, $00, $00, $13, $01 ; load 1x demon 0013
#_0B85C0: db $63, $6C, $3A, $CF ; キタに⎵
#_0B85C4: db $F5 ; write demon name from $050A
#_0B85C5: db $CF ; ⎵
#_0B85C6: db $DE, $00, $00, $17, $01 ; load 1x demon 0017
#_0B85CB: db $77, $B5, $68, $3A, $CF ; ヒガシに⎵
#_0B85D0: db $F5 ; write demon name from $050A
#_0B85D1: db $F9 ; new line
#_0B85D2: db $DE, $00, $00, $18, $01 ; load 1x demon 0018
#_0B85D7: db $7C, $71, $7C, $3A, $CF ; ミナミに⎵
#_0B85DC: db $F5 ; write demon name from $050A
#_0B85DD: db $CF ; ⎵
#_0B85DE: db $DE, $00, $00, $19, $01 ; load 1x demon 0019
#_0B85E3: db $72, $68, $3A, $CF ; ニシに⎵
#_0B85E7: db $F5 ; write demon name from $050A
#_0B85E8: db $9C ; が
#_0B85E9: db $F9 ; new line
#_0B85EA: db $33, $4E, $A5, $4E, $3D, $CF, $42, $27 ; それぞれの⎵ほう
#_0B85F2: db $9C, $2C, $51, $CF, $43, $47, $58, $37 ; がくを⎵まもって
#_0B85FA: db $26, $4D ; いる
#_0B85FC: db $FC ; wait for key and new line
#_0B85FD: db $D3, $18 ; go to message 18

;===================================================================================================

; そうか ならば はなしは はやい
Message_03_02_17:
#_0B85FF: db $FA ; clear message box
#_0B8600: db $33, $27, $2A, $CF, $39, $4B, $AB, $CF ; そうか⎵ならば⎵
#_0B8608: db $3E, $39, $30, $3E, $CF, $3E, $48, $26 ; はなしは⎵はやい
#_0B8610: db $FC ; wait for key and new line

;===================================================================================================

; おまえは やつらに あう ひつようがある
; じぶんの ちからを ためすためにも
Message_03_02_18:
#_0B8611: db $FA ; clear message box
#_0B8612: db $29, $43, $28, $3E, $CF, $48, $36, $4B ; おまえは⎵やつら
#_0B861A: db $3A, $CF, $25, $27, $CF, $3F, $36, $4A ; に⎵あう⎵ひつよ
#_0B8622: db $27, $9C, $25, $4D ; うがある
#_0B8626: db $F9 ; new line
#_0B8627: db $A2, $AD, $52, $3D, $CF, $35, $2A, $4B ; じぶんの⎵ちから
#_0B862F: db $51, $CF, $34, $46, $31, $34, $46, $3A ; を⎵ためすために
#_0B8637: db $47 ; も
#_0B8638: db $FC ; wait for key and new line
#_0B8639: db $D0, $9A ; set progress bit 9A
#_0B863B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B863D: db $FF ; end of message

;===================================================================================================

; してんのうは まだ のこっているようだな
; «トウキョウ»は もう まもるかちが ない
; やつらを かいほうして やらないと«・・・»
Message_03_02_19:
#_0B863E: db $D2, $9F, $1A ; test progress bit 9F for message 1A
#_0B8641: db $30, $37, $52, $3D, $27, $3E, $CF, $43 ; してんのうは⎵ま
#_0B8649: db $A6, $CF, $3D, $2E, $58, $37, $26, $4D ; だ⎵のこっている
#_0B8651: db $4A, $27, $A6, $39 ; ようだな
#_0B8655: db $F9 ; new line
#_0B8656: db $F2, $1C ; prewritten text 1C
#_0B8658: db $3E, $CF, $47, $27, $CF, $43, $47, $4D ; は⎵もう⎵まもる
#_0B8660: db $2A, $35, $9C, $CF, $39, $26 ; かちが⎵ない
#_0B8666: db $FC ; wait for key and new line
#_0B8667: db $48, $36, $4B, $51, $CF, $2A, $26, $42 ; やつらを⎵かいほ
#_0B866F: db $27, $30, $37, $CF, $48, $4B, $39, $26 ; うして⎵やらない
#_0B8677: db $38 ; と
#_0B8678: db $F2, $0B ; prewritten text 0B
#_0B867A: db $FC ; wait for key and new line
#_0B867B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B867D: db $FF ; end of message

;===================================================================================================

; «・・・»なんだ?
Message_03_02_1A:
#_0B867E: db $FA ; clear message box
#_0B867F: db $F2, $0B ; prewritten text 0B
#_0B8681: db $39, $52, $A6, $95 ; なんだ?
#_0B8685: db $FC ; wait for key and new line
#_0B8686: db $FE, $73 ; ext command 73: Call routine 0F9833 TODO

;===================================================================================================

; いったい なにが あったんだ
; «トウキョウ»が どうなったか みてきてくれ
; たのむ
Message_03_02_1B:
#_0B8688: db $26, $58, $34, $26, $CF, $39, $3A, $9C ; いったい⎵なにが
#_0B8690: db $CF, $25, $58, $34, $52, $A6 ; ⎵あったんだ
#_0B8696: db $F9 ; new line
#_0B8697: db $F2, $1C ; prewritten text 1C
#_0B8699: db $9C, $CF, $AA, $27, $39, $58, $34, $2A ; が⎵どうなったか
#_0B86A1: db $CF, $44, $37, $2B, $37, $2C, $4E ; ⎵みてきてくれ
#_0B86A8: db $F9 ; new line
#_0B86A9: db $34, $3D, $45 ; たのむ
#_0B86AC: db $FC ; wait for key and new line
#_0B86AD: db $D0, $9E ; set progress bit 9E
#_0B86AF: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B86B1: db $FF ; end of message

;===================================================================================================

; まだ いのちは あるようだな [CHASE]
; おまえも たいしたやつだ
Message_03_02_1C:
#_0B86B2: db $D2, $9E, $1D ; test progress bit 9E for message 1D
#_0B86B5: db $43, $A6, $CF, $26, $3D, $35, $3E, $CF ; まだ⎵いのちは⎵
#_0B86BD: db $25, $4D, $4A, $27, $A6, $39, $CF ; あるようだな⎵
#_0B86C4: db $F0 ; write player name
#_0B86C5: db $F9 ; new line
#_0B86C6: db $29, $43, $28, $47, $CF, $34, $26, $30 ; おまえも⎵たいし
#_0B86CE: db $34, $48, $36, $A6 ; たやつだ
#_0B86D2: db $FC ; wait for key and new line
#_0B86D3: db $FA ; clear message box
#_0B86D4: db $D3, $16 ; go to message 16

;===================================================================================================

Message_03_02_1D:
#_0B86D6: db $D2, $98, $1F ; test progress bit 98 for message 1F
#_0B86D9: db $D2, $D2, $1E ; test progress bit D2 for message 1E
#_0B86DC: db $D3, $1B ; go to message 1B

;===================================================================================================

; どうやら だいこうずいは かみの しわざらしい
; してんのうの ちからが かけたせいで
; ふせぎきれなくなったようだ
; おれたちが «カテドラル»を のっとらなければ
; みんな «トウキョウ»もろとも みずのそこに
; しずんでいたわけだ
; «・・・»ところで こまったことが おこっている
; «シンジュク»とちょうで かみが くるのを
; ふせいでいる テンマ ラーヴァナが
; マジン ヴィシュヌに おそわれているんだ
; たたかいは ながびいている
; ラーヴァナをたすけ ヴィシュヌを たおしてくれ
; たのんだぞ
Message_03_02_1E:
#_0B86DE: db $AA, $27, $48, $4B, $CF, $A6, $26, $2E ; どうやら⎵だいこ
#_0B86E6: db $27, $A3, $26, $3E, $CF, $2A, $44, $3D ; うずいは⎵かみの
#_0B86EE: db $CF, $30, $50, $A1, $4B, $30, $26 ; ⎵しわざらしい
#_0B86F5: db $F9 ; new line
#_0B86F6: db $30, $37, $52, $3D, $27, $3D, $CF, $35 ; してんのうの⎵ち
#_0B86FE: db $2A, $4B, $9C, $CF, $2A, $2D, $34, $32 ; からが⎵かけたせ
#_0B8706: db $26, $A9 ; いで
#_0B8708: db $F9 ; new line
#_0B8709: db $40, $32, $9D, $2B, $4E, $39, $2C, $39 ; ふせぎきれなくな
#_0B8711: db $58, $34, $4A, $27, $A6 ; ったようだ
#_0B8716: db $FC ; wait for key and new line
#_0B8717: db $FA ; clear message box
#_0B8718: db $29, $4E, $34, $35, $9C, $CF ; おれたちが⎵
#_0B871E: db $F2, $5C ; prewritten text 5C
#_0B8720: db $51, $CF, $3D, $58, $38, $4B, $39, $2D ; を⎵のっとらなけ
#_0B8728: db $4E, $AB ; れば
#_0B872A: db $F9 ; new line
#_0B872B: db $44, $52, $39, $CF ; みんな⎵
#_0B872F: db $F2, $1C ; prewritten text 1C
#_0B8731: db $47, $4F, $38, $47, $CF, $44, $A3, $3D ; もろとも⎵みずの
#_0B8739: db $33, $2E, $3A ; そこに
#_0B873C: db $F9 ; new line
#_0B873D: db $30, $A3, $52, $A9, $26, $34, $50, $2D ; しずんでいたわけ
#_0B8745: db $A6 ; だ
#_0B8746: db $FC ; wait for key and new line
#_0B8747: db $FA ; clear message box
#_0B8748: db $F2, $0B ; prewritten text 0B
#_0B874A: db $38, $2E, $4F, $A9, $CF, $2E, $43, $58 ; ところで⎵こまっ
#_0B8752: db $34, $2E, $38, $9C, $CF, $29, $2E, $58 ; たことが⎵おこっ
#_0B875A: db $37, $26, $4D ; ている
#_0B875D: db $FC ; wait for key and new line
#_0B875E: db $F2, $18 ; prewritten text 18
#_0B8760: db $38, $35, $57, $27, $A9, $CF, $2A, $44 ; とちょうで⎵かみ
#_0B8768: db $9C, $CF, $2C, $4D, $3D, $51 ; が⎵くるのを
#_0B876E: db $F9 ; new line
#_0B876F: db $40, $32, $26, $A9, $26, $4D, $CF, $6F ; ふせいでいる⎵テ
#_0B8777: db $8A, $7B, $CF, $83, $5A, $CE, $8B, $71 ; ンマ⎵ラーヴァナ
#_0B877F: db $9C ; が
#_0B8780: db $F9 ; new line
#_0B8781: db $7B, $BB, $8A, $CF, $CE, $8C, $68, $90 ; マジン⎵ヴィシュ
#_0B8789: db $73, $3A, $CF, $29, $33, $50, $4E, $37 ; ヌに⎵おそわれて
#_0B8791: db $26, $4D, $52, $A6 ; いるんだ
#_0B8795: db $FC ; wait for key and new line
#_0B8796: db $FA ; clear message box
#_0B8797: db $34, $34, $2A, $26, $3E, $CF, $39, $9C ; たたかいは⎵なが
#_0B879F: db $AC, $26, $37, $26, $4D ; びいている
#_0B87A4: db $F9 ; new line
#_0B87A5: db $83, $5A, $CE, $8B, $71, $51, $34, $31 ; ラーヴァナをたす
#_0B87AD: db $2D, $CF, $CE, $8C, $68, $90, $73, $51 ; け⎵ヴィシュヌを
#_0B87B5: db $CF, $34, $29, $30, $37, $2C, $4E ; ⎵たおしてくれ
#_0B87BC: db $F9 ; new line
#_0B87BD: db $34, $3D, $52, $A6, $A5 ; たのんだぞ
#_0B87C2: db $FC ; wait for key and new line
#_0B87C3: db $D0, $98 ; set progress bit 98
#_0B87C5: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B87C7: db $FF ; end of message

;===================================================================================================

; «カテドラル»を のっとられ あせったテンシどもが
; かみを ごういんに よびだしてきたとき
; もし ラーヴァナが まけていると
; «カテドラル»じょうくうを ふせぐものが
; いなくなってしまう
Message_03_02_1F:
#_0B87C8: db $F2, $5C ; prewritten text 5C
#_0B87CA: db $51, $CF, $3D, $58, $38, $4B, $4E, $CF ; を⎵のっとられ⎵
#_0B87D2: db $25, $32, $58, $34, $6F, $8A, $68, $AA ; あせったテンシど
#_0B87DA: db $47, $9C ; もが
#_0B87DC: db $F9 ; new line
#_0B87DD: db $2A, $44, $51, $CF, $A0, $27, $26, $52 ; かみを⎵ごういん
#_0B87E5: db $3A, $CF, $4A, $AC, $A6, $30, $37, $2B ; に⎵よびだしてき
#_0B87ED: db $34, $38, $2B ; たとき
#_0B87F0: db $F9 ; new line
#_0B87F1: db $47, $30, $CF, $83, $5A, $CE, $8B, $71 ; もし⎵ラーヴァナ
#_0B87F9: db $9C, $CF, $43, $2D, $37, $26, $4D, $38 ; が⎵まけていると
#_0B8801: db $F9 ; new line
#_0B8802: db $F2, $5C ; prewritten text 5C
#_0B8804: db $A2, $57, $27, $2C, $27, $51, $CF, $40 ; じょうくうを⎵ふ
#_0B880C: db $32, $9E, $47, $3D, $9C ; せぐものが
#_0B8811: db $F9 ; new line
#_0B8812: db $26, $39, $2C, $39, $58, $37, $30, $43 ; いなくなってしま
#_0B881A: db $27 ; う
#_0B881B: db $FC ; wait for key and new line
#_0B881C: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B881E: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»と:
; このおくは アクマが いっぱいだ
; いのちの ほしょうは ないぜ
Message_03_02_20:
#_0B881F: db $D6, $00, $65, $70, $28 ; place sprite 65 in slot 00 at XY:{70,28}
#_0B8824: db $F2, $34 ; prewritten text 34
#_0B8826: db $38, $9A ; と:
#_0B8828: db $F9 ; new line
#_0B8829: db $D2, $9C, $21 ; test progress bit 9C for message 21
#_0B882C: db $2E, $3D, $29, $2C, $3E, $CF, $5D, $64 ; このおくは⎵アク
#_0B8834: db $7B, $9C, $CF, $26, $58, $B0, $26, $A6 ; マが⎵いっぱいだ
#_0B883C: db $F9 ; new line
#_0B883D: db $26, $3D, $35, $3D, $CF, $42, $30, $57 ; いのちの⎵ほしょ
#_0B8845: db $27, $3E, $CF, $39, $26, $A4 ; うは⎵ないぜ
#_0B884B: db $FC ; wait for key and new line
#_0B884C: db $FA ; clear message box
#_0B884D: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8850: db $D6, $01, $6F, $60, $28 ; place sprite 6F in slot 01 at XY:{60,28}
#_0B8855: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B8858: db $D6, $01, $78, $60, $28 ; place sprite 78 in slot 01 at XY:{60,28}
#_0B885D: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8860: db $D6, $01, $00 ; delete sprite in slot 01
#_0B8863: db $FE, $1A, $2C, $AE, $13, $00, $00, $00 ; ext command 1A: 2C,AE,13,00,00,00
#_0B886B: db $D3, $28 ; go to message 28

;===================================================================================================

; ここは «カテドラル»へ のりこんだものが
; あつまってできた まちだ
; だれも こばみは しないが
; ゆっくりできる ばしょではないぞ
Message_03_02_21:
#_0B886D: db $2E, $2E, $3E, $CF ; ここは⎵
#_0B8871: db $F2, $5C ; prewritten text 5C
#_0B8873: db $41, $CF, $3D, $4C, $2E, $52, $A6, $47 ; へ⎵のりこんだも
#_0B887B: db $3D, $9C ; のが
#_0B887D: db $F9 ; new line
#_0B887E: db $25, $36, $43, $58, $37, $A9, $2B, $34 ; あつまってできた
#_0B8886: db $CF, $43, $35, $A6 ; ⎵まちだ
#_0B888A: db $F9 ; new line
#_0B888B: db $A6, $4E, $47, $CF, $2E, $AB, $44, $3E ; だれも⎵こばみは
#_0B8893: db $CF, $30, $39, $26, $9C ; ⎵しないが
#_0B8898: db $F9 ; new line
#_0B8899: db $49, $58, $2C, $4C, $A9, $2B, $4D, $CF ; ゆっくりできる⎵
#_0B88A1: db $AB, $30, $57, $A9, $3E, $39, $26, $A5 ; ばしょではないぞ
#_0B88A9: db $FC ; wait for key and new line
#_0B88AA: db $D1, $9C ; clear progress bit 9C
#_0B88AC: db $FE, $1A, $2C, $2C, $13, $00, $00, $00 ; ext command 1A: 2C,2C,13,00,00,00
#_0B88B4: db $FF ; end of message

;===================================================================================================

; だいじょうぶか [CHASE]!?
; はやく てあてを するんだ!
Message_03_02_22:
#_0B88B5: db $A6, $26, $A2, $57, $27, $AD, $2A, $CF ; だいじょうぶか⎵
#_0B88BD: db $F0 ; write player name
#_0B88BE: db $94, $95 ; !?
#_0B88C0: db $F9 ; new line
#_0B88C1: db $3E, $48, $2C, $CF, $37, $25, $37, $51 ; はやく⎵てあてを
#_0B88C9: db $CF, $31, $4D, $52, $A6, $94 ; ⎵するんだ!
#_0B88CF: db $FC ; wait for key and new line
#_0B88D0: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B88D2: db $FF ; end of message

;===================================================================================================

; なんてことだ ラーヴァナを たおすとは«・・・»
; ナカマだったよしみで たすけたりしたが
; これで おしまいだ
; つぎに あうときには てきどうしだ!
; かくご しておけ!
Message_03_02_23:
#_0B88D3: db $39, $52, $37, $2E, $38, $A6, $CF, $83 ; なんてことだ⎵ラ
#_0B88DB: db $5A, $CE, $8B, $71, $51, $CF, $34, $29 ; ーヴァナを⎵たお
#_0B88E3: db $31, $38, $3E ; すとは
#_0B88E6: db $F2, $0B ; prewritten text 0B
#_0B88E8: db $FC ; wait for key and new line
#_0B88E9: db $71, $62, $7B, $A6, $58, $34, $4A, $30 ; ナカマだったよし
#_0B88F1: db $44, $A9, $CF, $34, $31, $2D, $34, $4C ; みで⎵たすけたり
#_0B88F9: db $30, $34, $9C ; したが
#_0B88FC: db $F9 ; new line
#_0B88FD: db $2E, $4E, $A9, $CF, $29, $30, $43, $26 ; これで⎵おしまい
#_0B8905: db $A6 ; だ
#_0B8906: db $FC ; wait for key and new line
#_0B8907: db $FA ; clear message box
#_0B8908: db $36, $9D, $3A, $CF, $25, $27, $38, $2B ; つぎに⎵あうとき
#_0B8910: db $3A, $3E, $CF, $37, $2B, $AA, $27, $30 ; には⎵てきどうし
#_0B8918: db $A6, $94 ; だ!
#_0B891A: db $F9 ; new line
#_0B891B: db $2A, $2C, $A0, $CF, $30, $37, $29, $2D ; かくご⎵しておけ
#_0B8923: db $94 ; !
#_0B8924: db $FC ; wait for key and new line
#_0B8925: db $D0, $CE ; set progress bit CE
#_0B8927: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8929: db $FF ; end of message

;===================================================================================================

; ヴィシュヌを たおしたのか [CHASE]
; かんがえなおして くれたようだな
; これからも ロウのやつらを たたきのめすため
; たたかってくれ
; また ちかいうちに あえるだろう
; じゃあな
Message_03_02_24:
#_0B892A: db $CE, $8C, $68, $90, $73, $51, $CF, $34 ; ヴィシュヌを⎵た
#_0B8932: db $29, $30, $34, $3D, $2A, $CF ; おしたのか⎵
#_0B8938: db $F0 ; write player name
#_0B8939: db $F9 ; new line
#_0B893A: db $2A, $52, $9C, $28, $39, $29, $30, $37 ; かんがえなおして
#_0B8942: db $CF, $2C, $4E, $34, $4A, $27, $A6, $39 ; ⎵くれたようだな
#_0B894A: db $FC ; wait for key and new line
#_0B894B: db $FA ; clear message box
#_0B894C: db $2E, $4E, $2A, $4B, $47, $CF, $87, $5F ; これからも⎵ロウ
#_0B8954: db $3D, $48, $36, $4B, $51, $CF, $34, $34 ; のやつらを⎵たた
#_0B895C: db $2B, $3D, $46, $31, $34, $46 ; きのめすため
#_0B8962: db $F9 ; new line
#_0B8963: db $34, $34, $2A, $58, $37, $2C, $4E ; たたかってくれ
#_0B896A: db $F9 ; new line
#_0B896B: db $43, $34, $CF, $35, $2A, $26, $27, $35 ; また⎵ちかいうち
#_0B8973: db $3A, $CF, $25, $28, $4D, $A6, $4F, $27 ; に⎵あえるだろう
#_0B897B: db $FC ; wait for key and new line
#_0B897C: db $FA ; clear message box
#_0B897D: db $A2, $55, $25, $39 ; じゃあな
#_0B8981: db $FC ; wait for key and new line
#_0B8982: db $D0, $CE ; set progress bit CE
#_0B8984: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8986: db $FF ; end of message

;===================================================================================================

Message_03_02_25:
#_0B8987: db $D2, $67, $26 ; test progress bit 67 for message 26
#_0B898A: db $D2, $0C, $26 ; test progress bit 0C for message 26
#_0B898D: db $D6, $01, $6F, $60, $28 ; place sprite 6F in slot 01 at XY:{60,28}

;===================================================================================================

; >«だれもいない»
Message_03_02_26:
#_0B8992: db $97 ; >
#_0B8993: db $F2, $2C ; prewritten text 2C
#_0B8995: db $FC ; wait for key and new line
#_0B8996: db $FF ; end of message

;===================================================================================================

Message_03_02_27:
#_0B8997: db $D1, $9C ; clear progress bit 9C
#_0B8999: db $FF ; end of message

;===================================================================================================

Message_03_02_28:
#_0B899A: db $D0, $9C ; set progress bit 9C
#_0B899C: db $FF ; end of message

;===================================================================================================

Message_03_02_29:
#_0B899D: db $FE, $1C, $00 ; ext command 1C: $00 TODO

;===================================================================================================

; しょうにん:
; いいカメが てにはいったんだ
; こいつの にくを
; ふろうちょうじゅの くすりとして うれば«・・・»
; クッククク おおもうけ!
Message_03_02_2A:
#_0B89A0: db $D6, $00, $B0, $70, $38 ; place sprite B0 in slot 00 at XY:{70,38}
#_0B89A5: db $30, $57, $27, $3A, $52, $9A ; しょうにん:
#_0B89AB: db $F9 ; new line
#_0B89AC: db $D2, $A2, $2E ; test progress bit A2 for message 2E
#_0B89AF: db $D2, $A6, $2D ; test progress bit A6 for message 2D
#_0B89B2: db $D2, $A0, $2B ; test progress bit A0 for message 2B
#_0B89B5: db $26, $26, $62, $7E, $9C, $CF, $37, $3A ; いいカメが⎵てに
#_0B89BD: db $3E, $26, $58, $34, $52, $A6 ; はいったんだ
#_0B89C3: db $F9 ; new line
#_0B89C4: db $2E, $26, $36, $3D, $CF, $3A, $2C, $51 ; こいつの⎵にくを
#_0B89CC: db $F9 ; new line
#_0B89CD: db $40, $4F, $27, $35, $57, $27, $A2, $56 ; ふろうちょうじゅ
#_0B89D5: db $3D, $CF, $2C, $31, $4C, $38, $30, $37 ; の⎵くすりとして
#_0B89DD: db $CF, $27, $4E, $AB ; ⎵うれば
#_0B89E1: db $F2, $0B ; prewritten text 0B
#_0B89E3: db $F9 ; new line
#_0B89E4: db $64, $92, $64, $64, $64, $CF, $29, $29 ; クッククク⎵おお
#_0B89EC: db $47, $27, $2D, $94 ; もうけ!
#_0B89F0: db $FC ; wait for key and new line
#_0B89F1: db $FF ; end of message

;===================================================================================================

; ほしけりゃ あとで うってやるよ
Message_03_02_2B:
#_0B89F2: db $D2, $A1, $2C ; test progress bit A1 for message 2C
#_0B89F5: db $42, $30, $2D, $4C, $55, $CF, $25, $38 ; ほしけりゃ⎵あと
#_0B89FD: db $A9, $CF, $27, $58, $37, $48, $4D, $4A ; で⎵うってやるよ
#_0B8A05: db $FC ; wait for key and new line
#_0B8A06: db $FF ; end of message

;===================================================================================================

; おれの もうけを よこどりするきかあ?
; カメは ぜったいに わたさ«・・・»«・・・»
; んー あー その いいぶきを おもちで«・・・»
; えー へへへ カメが ほしいんで?
; あ あげます あげますとも どうぞ どうぞ
Message_03_02_2C:
#_0B8A07: db $29, $4E, $3D, $CF, $47, $27, $2D, $51 ; おれの⎵もうけを
#_0B8A0F: db $CF, $4A, $2E, $AA, $4C, $31, $4D, $2B ; ⎵よこどりするき
#_0B8A17: db $2A, $25, $95 ; かあ?
#_0B8A1A: db $F9 ; new line
#_0B8A1B: db $62, $7E, $3E, $CF, $A4, $58, $34, $26 ; カメは⎵ぜったい
#_0B8A23: db $3A, $CF, $50, $34, $2F ; に⎵わたさ
#_0B8A28: db $F2, $0B ; prewritten text 0B
#_0B8A2A: db $F2, $0B ; prewritten text 0B
#_0B8A2C: db $F9 ; new line
#_0B8A2D: db $52, $5A, $CF, $25, $5A, $CF, $33, $3D ; んー⎵あー⎵その
#_0B8A35: db $CF, $26, $26, $AD, $2B, $51, $CF, $29 ; ⎵いいぶきを⎵お
#_0B8A3D: db $47, $35, $A9 ; もちで
#_0B8A40: db $F2, $0B ; prewritten text 0B
#_0B8A42: db $F9 ; new line
#_0B8A43: db $28, $5A, $CF, $41, $41, $41, $CF, $62 ; えー⎵へへへ⎵カ
#_0B8A4B: db $7E, $9C, $CF, $42, $30, $26, $52, $A9 ; メが⎵ほしいんで
#_0B8A53: db $95 ; ?
#_0B8A54: db $FC ; wait for key and new line
#_0B8A55: db $25, $CF, $25, $9F, $43, $31, $CF, $25 ; あ⎵あげます⎵あ
#_0B8A5D: db $9F, $43, $31, $38, $47, $CF, $AA, $27 ; げますとも⎵どう
#_0B8A65: db $A5, $CF, $AA, $27, $A5 ; ぞ⎵どうぞ
#_0B8A6A: db $FC ; wait for key and new line
#_0B8A6B: db $D0, $A3 ; set progress bit A3
#_0B8A6D: db $FF ; end of message

;===================================================================================================

; «・・・»カメ?
; ああ うれなかったんで
; みんなで くっちまったよ
; もうけそこなっちまったい
Message_03_02_2D:
#_0B8A6E: db $F2, $0B ; prewritten text 0B
#_0B8A70: db $62, $7E, $95 ; カメ?
#_0B8A73: db $F9 ; new line
#_0B8A74: db $25, $25, $CF, $27, $4E, $39, $2A, $58 ; ああ⎵うれなかっ
#_0B8A7C: db $34, $52, $A9 ; たんで
#_0B8A7F: db $F9 ; new line
#_0B8A80: db $44, $52, $39, $A9, $CF, $2C, $58, $35 ; みんなで⎵くっち
#_0B8A88: db $43, $58, $34, $4A ; まったよ
#_0B8A8C: db $FC ; wait for key and new line
#_0B8A8D: db $FA ; clear message box
#_0B8A8E: db $47, $27, $2D, $33, $2E, $39, $58, $35 ; もうけそこなっち
#_0B8A96: db $43, $58, $34, $26 ; まったい
#_0B8A9A: db $FC ; wait for key and new line
#_0B8A9B: db $FF ; end of message

;===================================================================================================

; ああ おおもうけの チャンスだったのに«・・・»
Message_03_02_2E:
#_0B8A9C: db $25, $25, $CF, $29, $29, $47, $27, $2D ; ああ⎵おおもうけ
#_0B8AA4: db $3D, $CF, $6D, $8F, $8A, $69, $A6, $58 ; の⎵チャンスだっ
#_0B8AAC: db $34, $3D, $3A ; たのに
#_0B8AAF: db $F2, $0B ; prewritten text 0B
#_0B8AB1: db $FC ; wait for key and new line
#_0B8AB2: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
Message_03_02_2F:
#_0B8AB3: db $D7, $24 ; load scene 24
#_0B8AB5: db $D2, $A6, $34 ; test progress bit A6 for message 34
#_0B8AB8: db $D2, $A2, $34 ; test progress bit A2 for message 34
#_0B8ABB: db $D5, $54 ; send 54 to APU
#_0B8ABD: db $DE, $01, $00, $27, $01 ; load 1x demon 0127
#_0B8AC2: db $E4, $00 ; load demon $00
#_0B8AC4: db $F5 ; write demon name from $050A
#_0B8AC5: db $9A ; :
#_0B8AC6: db $F9 ; new line
#_0B8AC7: db $D0, $A0 ; set progress bit A0
#_0B8AC9: db $D2, $A3, $33 ; test progress bit A3 for message 33
#_0B8ACC: db $D2, $A3, $33 ; test progress bit A3 for message 33
#_0B8ACF: db $FE, $04, $32, $30 ; ext command 04: message 32 if 11C >= 112; 30 if >= 144

;===================================================================================================

; たすけてくれよー
; もういちど うみで およぎたいよー
; たすけてくれよー
; なんでも いうこときくからさー
; >カメを たすけますか?
Message_03_02_30:
#_0B8AD3: db $34, $31, $2D, $37, $2C, $4E, $4A, $5A ; たすけてくれよー
#_0B8ADB: db $F9 ; new line
#_0B8ADC: db $47, $27, $26, $35, $AA, $CF, $27, $44 ; もういちど⎵うみ
#_0B8AE4: db $A9, $CF, $29, $4A, $9D, $34, $26, $4A ; で⎵およぎたいよ
#_0B8AEC: db $5A ; ー
#_0B8AED: db $FC ; wait for key and new line
#_0B8AEE: db $FA ; clear message box
#_0B8AEF: db $34, $31, $2D, $37, $2C, $4E, $4A, $5A ; たすけてくれよー
#_0B8AF7: db $F9 ; new line
#_0B8AF8: db $39, $52, $A9, $47, $CF, $26, $27, $2E ; なんでも⎵いうこ
#_0B8B00: db $38, $2B, $2C, $2A, $4B, $2F, $5A ; ときくからさー
#_0B8B07: db $FC ; wait for key and new line
#_0B8B08: db $FA ; clear message box
#_0B8B09: db $97, $62, $7E, $51, $CF, $34, $31, $2D ; >カメを⎵たすけ
#_0B8B11: db $43, $31, $2A, $95 ; ますか?
#_0B8B15: db $F8, $31 ; YES/NO - go to message 31 if YES
#_0B8B17: db $FF ; end of message

;===================================================================================================

; しょうにんのこえ:
; ちょっとまて! なに してるんだ!
Message_03_02_31:
#_0B8B18: db $D0, $A1 ; set progress bit A1
#_0B8B1A: db $D4, $03 ; set text box size to 3
#_0B8B1C: db $30, $57, $27, $3A, $52, $3D, $2E, $28 ; しょうにんのこえ
#_0B8B24: db $9A ; :
#_0B8B25: db $F9 ; new line
#_0B8B26: db $35, $57, $58, $38, $43, $37, $94, $CF ; ちょっとまて!⎵
#_0B8B2E: db $39, $3A, $CF, $30, $37, $4D, $52, $A6 ; なに⎵してるんだ
#_0B8B36: db $94 ; !
#_0B8B37: db $FC ; wait for key and new line
#_0B8B38: db $FE, $1C, $01 ; ext command 1C: $01 TODO
#_0B8B3B: db $FA ; clear message box
#_0B8B3C: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8B3E: db $FE, $1A, $2D, $AB, $13, $00, $00, $00 ; ext command 1A: 2D,AB,13,00,00,00
#_0B8B46: db $FE, $37 ; ext command 37: reload dungeon view
#_0B8B48: db $D3, $29 ; go to message 29

;===================================================================================================

; «・・・»«・・・»«・・・»«・・・»
Message_03_02_32:
#_0B8B4A: db $F2, $0B ; prewritten text 0B
#_0B8B4C: db $F2, $0B ; prewritten text 0B
#_0B8B4E: db $F2, $0B ; prewritten text 0B
#_0B8B50: db $F2, $0B ; prewritten text 0B
#_0B8B52: db $FC ; wait for key and new line
#_0B8B53: db $FF ; end of message

;===================================================================================================

; たすけてくれるの! ありがとう!
; おれいに これ あげるよ
; これ つかえば いつでも およいでいくよ
; じゃあねー! はやく うみに もどろうっと
; >[ITEM]を «てにいれた»
Message_03_02_33:
#_0B8B54: db $34, $31, $2D, $37, $2C, $4E, $4D, $3D ; たすけてくれるの
#_0B8B5C: db $94, $CF, $25, $4C, $9C, $38, $27, $94 ; !⎵ありがとう!
#_0B8B64: db $FC ; wait for key and new line
#_0B8B65: db $FA ; clear message box
#_0B8B66: db $29, $4E, $26, $3A, $CF, $2E, $4E, $CF ; おれいに⎵これ⎵
#_0B8B6E: db $25, $9F, $4D, $4A ; あげるよ
#_0B8B72: db $F9 ; new line
#_0B8B73: db $2E, $4E, $CF, $36, $2A, $28, $AB, $CF ; これ⎵つかえば⎵
#_0B8B7B: db $26, $36, $A9, $47, $CF, $29, $4A, $26 ; いつでも⎵およい
#_0B8B83: db $A9, $26, $2C, $4A ; でいくよ
#_0B8B87: db $F9 ; new line
#_0B8B88: db $A2, $55, $25, $3C, $5A, $94, $CF, $3E ; じゃあねー!⎵は
#_0B8B90: db $48, $2C, $CF, $27, $44, $3A, $CF, $47 ; やく⎵うみに⎵も
#_0B8B98: db $AA, $4F, $27, $58, $38 ; どろうっと
#_0B8B9D: db $FC ; wait for key and new line
#_0B8B9E: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8BA0: db $E1, $F6 ; set $0A50 to item F6
#_0B8BA2: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0B8BA4: db $FA ; clear message box
#_0B8BA5: db $97 ; >
#_0B8BA6: db $F3 ; write item name from $0A50
#_0B8BA7: db $51, $CF ; を⎵
#_0B8BA9: db $F2, $2D ; prewritten text 2D
#_0B8BAB: db $FC ; wait for key and new line
#_0B8BAC: db $D0, $A2 ; set progress bit A2
#_0B8BAE: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_02_34:
#_0B8BAF: db $97 ; >
#_0B8BB0: db $F2, $2C ; prewritten text 2C
#_0B8BB2: db $FC ; wait for key and new line
#_0B8BB3: db $FF ; end of message

;===================================================================================================

Message_03_02_35:
#_0B8BB4: db $FE, $1C, $00 ; ext command 1C: $00 TODO

;===================================================================================================

; «メシアきょう»と:
; このなかに いるのは
; かみへの ささげものです
Message_03_02_36:
#_0B8BB7: db $D6, $00, $49, $78, $28 ; place sprite 49 in slot 00 at XY:{78,28}
#_0B8BBC: db $F2, $33 ; prewritten text 33
#_0B8BBE: db $38, $9A ; と:
#_0B8BC0: db $F9 ; new line
#_0B8BC1: db $D2, $A6, $3B ; test progress bit A6 for message 3B
#_0B8BC4: db $D2, $A2, $3A ; test progress bit A2 for message 3A
#_0B8BC7: db $D2, $A4, $37 ; test progress bit A4 for message 37
#_0B8BCA: db $2E, $3D, $39, $2A, $3A, $CF, $26, $4D ; このなかに⎵いる
#_0B8BD2: db $3D, $3E ; のは
#_0B8BD4: db $F9 ; new line
#_0B8BD5: db $2A, $44, $41, $3D, $CF, $2F, $2F, $9F ; かみへの⎵ささげ
#_0B8BDD: db $47, $3D, $A9, $31 ; ものです
#_0B8BE1: db $FC ; wait for key and new line
#_0B8BE2: db $FF ; end of message

;===================================================================================================

; かみへのささげものを ほしがるのですか?
; それは いけません
Message_03_02_37:
#_0B8BE3: db $D2, $A5, $38 ; test progress bit A5 for message 38
#_0B8BE6: db $2A, $44, $41, $3D, $2F, $2F, $9F, $47 ; かみへのささげも
#_0B8BEE: db $3D, $51, $CF, $42, $30, $9C, $4D, $3D ; のを⎵ほしがるの
#_0B8BF6: db $A9, $31, $2A, $95 ; ですか?
#_0B8BFA: db $F9 ; new line
#_0B8BFB: db $33, $4E, $3E, $CF, $26, $2D, $43, $32 ; それは⎵いけませ
#_0B8C03: db $52 ; ん
#_0B8C04: db $FC ; wait for key and new line
#_0B8C05: db $FF ; end of message

;===================================================================================================

; このものは じゃあくな アクマのてさき
; それが いけにえとして
; かみのもとへ めされるのです
; これをしふくと いわずして なにをしあわせと
; いいましょう«・・・»
; どうしても たすけたいと いうのですか?
; そうです かみへの ささげものを
; たやすわけには いきません
Message_03_02_38:
#_0B8C06: db $2E, $3D, $47, $3D, $3E, $CF, $A2, $55 ; このものは⎵じゃ
#_0B8C0E: db $25, $2C, $39, $CF, $5D, $64, $7B, $3D ; あくな⎵アクマの
#_0B8C16: db $37, $2F, $2B ; てさき
#_0B8C19: db $F9 ; new line
#_0B8C1A: db $33, $4E, $9C, $CF, $26, $2D, $3A, $28 ; それが⎵いけにえ
#_0B8C22: db $38, $30, $37 ; として
#_0B8C25: db $F9 ; new line
#_0B8C26: db $2A, $44, $3D, $47, $38, $41, $CF, $46 ; かみのもとへ⎵め
#_0B8C2E: db $2F, $4E, $4D, $3D, $A9, $31 ; されるのです
#_0B8C34: db $F9 ; new line
#_0B8C35: db $2E, $4E, $51, $30, $40, $2C, $38, $CF ; これをしふくと⎵
#_0B8C3D: db $26, $50, $A3, $30, $37, $CF, $39, $3A ; いわずして⎵なに
#_0B8C45: db $51, $30, $25, $50, $32, $38 ; をしあわせと
#_0B8C4B: db $F9 ; new line
#_0B8C4C: db $26, $26, $43, $30, $57, $27 ; いいましょう
#_0B8C52: db $F2, $0B ; prewritten text 0B
#_0B8C54: db $FC ; wait for key and new line
#_0B8C55: db $FA ; clear message box
#_0B8C56: db $AA, $27, $30, $37, $47, $CF, $34, $31 ; どうしても⎵たす
#_0B8C5E: db $2D, $34, $26, $38, $CF, $26, $27, $3D ; けたいと⎵いうの
#_0B8C66: db $A9, $31, $2A, $95 ; ですか?
#_0B8C6A: db $F8, $39 ; YES/NO - go to message 39 if YES
#_0B8C6C: db $D4, $03 ; set text box size to 3
#_0B8C6E: db $33, $27, $A9, $31, $CF, $2A, $44, $41 ; そうです⎵かみへ
#_0B8C76: db $3D, $CF, $2F, $2F, $9F, $47, $3D, $51 ; の⎵ささげものを
#_0B8C7E: db $F9 ; new line
#_0B8C7F: db $34, $48, $31, $50, $2D, $3A, $3E, $CF ; たやすわけには⎵
#_0B8C87: db $26, $2B, $43, $32, $52 ; いきません
#_0B8C8C: db $FC ; wait for key and new line
#_0B8C8D: db $D1, $A7 ; clear progress bit A7
#_0B8C8F: db $FF ; end of message

;===================================================================================================

; むえきな せっしょうは いけないと
; いうのですね«・・・»
; わかりました
; いけにえにするのは やめましょう
; どこへ なりとも つれていって かまいません
Message_03_02_39:
#_0B8C90: db $D4, $03 ; set text box size to 3
#_0B8C92: db $45, $28, $2B, $39, $CF, $32, $58, $30 ; むえきな⎵せっし
#_0B8C9A: db $57, $27, $3E, $CF, $26, $2D, $39, $26 ; ょうは⎵いけない
#_0B8CA2: db $38 ; と
#_0B8CA3: db $F9 ; new line
#_0B8CA4: db $26, $27, $3D, $A9, $31, $3C ; いうのですね
#_0B8CAA: db $F2, $0B ; prewritten text 0B
#_0B8CAC: db $FC ; wait for key and new line
#_0B8CAD: db $FA ; clear message box
#_0B8CAE: db $50, $2A, $4C, $43, $30, $34 ; わかりました
#_0B8CB4: db $FC ; wait for key and new line
#_0B8CB5: db $26, $2D, $3A, $28, $3A, $31, $4D, $3D ; いけにえにするの
#_0B8CBD: db $3E, $CF, $48, $46, $43, $30, $57, $27 ; は⎵やめましょう
#_0B8CC5: db $F9 ; new line
#_0B8CC6: db $AA, $2E, $41, $CF, $39, $4C, $38, $47 ; どこへ⎵なりとも
#_0B8CCE: db $CF, $36, $4E, $37, $26, $58, $37, $CF ; ⎵つれていって⎵
#_0B8CD6: db $2A, $43, $26, $43, $32, $52 ; かまいません
#_0B8CDC: db $FC ; wait for key and new line
#_0B8CDD: db $D0, $A7 ; set progress bit A7
#_0B8CDF: db $FF ; end of message

;===================================================================================================

; «・・・»かみよ つぎの ささげものは
; なんに いたしましょうか?
Message_03_02_3A:
#_0B8CE0: db $F2, $0B ; prewritten text 0B
#_0B8CE2: db $2A, $44, $4A, $CF, $36, $9D, $3D, $CF ; かみよ⎵つぎの⎵
#_0B8CEA: db $2F, $2F, $9F, $47, $3D, $3E ; ささげものは
#_0B8CF0: db $F9 ; new line
#_0B8CF1: db $39, $52, $3A, $CF, $26, $34, $30, $43 ; なんに⎵いたしま
#_0B8CF9: db $30, $57, $27, $2A, $95 ; しょうか?
#_0B8CFE: db $FC ; wait for key and new line
#_0B8CFF: db $FF ; end of message

;===================================================================================================

; かみには べつのものを ささげなくては«・・・»
Message_03_02_3B:
#_0B8D00: db $2A, $44, $3A, $3E, $CF, $AE, $36, $3D ; かみには⎵べつの
#_0B8D08: db $47, $3D, $51, $CF, $2F, $2F, $9F, $39 ; ものを⎵ささげな
#_0B8D10: db $2C, $37, $3E ; くては
#_0B8D13: db $F2, $0B ; prewritten text 0B
#_0B8D15: db $FC ; wait for key and new line
#_0B8D16: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
Message_03_02_3C:
#_0B8D17: db $D7, $24 ; load scene 24
#_0B8D19: db $D2, $A6, $41 ; test progress bit A6 for message 41
#_0B8D1C: db $D2, $A2, $41 ; test progress bit A2 for message 41
#_0B8D1F: db $D5, $54 ; send 54 to APU
#_0B8D21: db $DE, $01, $00, $28, $01 ; load 1x demon 0128
#_0B8D26: db $E4, $00 ; load demon $00
#_0B8D28: db $F5 ; write demon name from $050A
#_0B8D29: db $9A ; :
#_0B8D2A: db $F9 ; new line
#_0B8D2B: db $D0, $A4 ; set progress bit A4
#_0B8D2D: db $D2, $A7, $40 ; test progress bit A7 for message 40
#_0B8D30: db $FE, $04, $3D, $3F ; ext command 04: message 3D if 11C >= 112; 3F if >= 144

;===================================================================================================

; たすけてくれ«・・・»
; こんなとこに とじこめられて ひからびちまう
; おれが なにしたってんだ«・・・»
; たのむから たすけてくれ«・・・»
; >タコを たすけますか?
Message_03_02_3D:
#_0B8D34: db $34, $31, $2D, $37, $2C, $4E ; たすけてくれ
#_0B8D3A: db $F2, $0B ; prewritten text 0B
#_0B8D3C: db $F9 ; new line
#_0B8D3D: db $2E, $52, $39, $38, $2E, $3A, $CF, $38 ; こんなとこに⎵と
#_0B8D45: db $A2, $2E, $46, $4B, $4E, $37, $CF, $3F ; じこめられて⎵ひ
#_0B8D4D: db $2A, $4B, $AC, $35, $43, $27 ; からびちまう
#_0B8D53: db $FC ; wait for key and new line
#_0B8D54: db $FA ; clear message box
#_0B8D55: db $29, $4E, $9C, $CF, $39, $3A, $30, $34 ; おれが⎵なにした
#_0B8D5D: db $58, $37, $52, $A6 ; ってんだ
#_0B8D61: db $F2, $0B ; prewritten text 0B
#_0B8D63: db $F9 ; new line
#_0B8D64: db $34, $3D, $45, $2A, $4B, $CF, $34, $31 ; たのむから⎵たす
#_0B8D6C: db $2D, $37, $2C, $4E ; けてくれ
#_0B8D70: db $F2, $0B ; prewritten text 0B
#_0B8D72: db $FC ; wait for key and new line
#_0B8D73: db $FA ; clear message box
#_0B8D74: db $97, $6C, $66, $51, $CF, $34, $31, $2D ; >タコを⎵たすけ
#_0B8D7C: db $43, $31, $2A, $95 ; ますか?
#_0B8D80: db $F8, $3E ; YES/NO - go to message 3E if YES
#_0B8D82: db $FF ; end of message

;===================================================================================================

; «メシアきょう»とのこえ:
; «あなたがた»は そこで なにを しているのですか
Message_03_02_3E:
#_0B8D83: db $D4, $03 ; set text box size to 3
#_0B8D85: db $D0, $A5 ; set progress bit A5
#_0B8D87: db $F2, $33 ; prewritten text 33
#_0B8D89: db $38, $3D, $2E, $28, $9A ; とのこえ:
#_0B8D8E: db $F9 ; new line
#_0B8D8F: db $F2, $03 ; prewritten text 03
#_0B8D91: db $3E, $CF, $33, $2E, $A9, $CF, $39, $3A ; は⎵そこで⎵なに
#_0B8D99: db $51, $CF, $30, $37, $26, $4D, $3D, $A9 ; を⎵しているので
#_0B8DA1: db $31, $2A ; すか
#_0B8DA3: db $FC ; wait for key and new line
#_0B8DA4: db $FE, $1C, $01 ; ext command 1C: $01 TODO
#_0B8DA7: db $FA ; clear message box
#_0B8DA8: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8DAA: db $FE, $1A, $28, $3E, $13, $00, $00, $00 ; ext command 1A: 28,3E,13,00,00,00
#_0B8DB2: db $FE, $37 ; ext command 37: reload dungeon view
#_0B8DB4: db $D3, $35 ; go to message 35

;===================================================================================================

; «・・・»«・・・»«・・・»«・・・»
Message_03_02_3F:
#_0B8DB6: db $F2, $0B ; prewritten text 0B
#_0B8DB8: db $F2, $0B ; prewritten text 0B
#_0B8DBA: db $F2, $0B ; prewritten text 0B
#_0B8DBC: db $F2, $0B ; prewritten text 0B
#_0B8DBE: db $FC ; wait for key and new line
#_0B8DBF: db $FF ; end of message

;===================================================================================================

; た たすけてくれるのか«・・・»
; «おまえたち» よくみると
; なかなか うまそうだな
; まあ たすけてくれたんだから
; くわないで おいてやろう
; おれさまに あいたくなったら
; このふえを つかいな
; ただし もうにどと りくにはあがらないからな
; >[ITEM]を «てにいれた»
Message_03_02_40:
#_0B8DC0: db $34, $CF, $34, $31, $2D, $37, $2C, $4E ; た⎵たすけてくれ
#_0B8DC8: db $4D, $3D, $2A ; るのか
#_0B8DCB: db $F2, $0B ; prewritten text 0B
#_0B8DCD: db $FC ; wait for key and new line
#_0B8DCE: db $FA ; clear message box
#_0B8DCF: db $F2, $04 ; prewritten text 04
#_0B8DD1: db $CF, $4A, $2C, $44, $4D, $38 ; ⎵よくみると
#_0B8DD7: db $F9 ; new line
#_0B8DD8: db $39, $2A, $39, $2A, $CF, $27, $43, $33 ; なかなか⎵うまそ
#_0B8DE0: db $27, $A6, $39 ; うだな
#_0B8DE3: db $F9 ; new line
#_0B8DE4: db $43, $25, $CF, $34, $31, $2D, $37, $2C ; まあ⎵たすけてく
#_0B8DEC: db $4E, $34, $52, $A6, $2A, $4B ; れたんだから
#_0B8DF2: db $F9 ; new line
#_0B8DF3: db $2C, $50, $39, $26, $A9, $CF, $29, $26 ; くわないで⎵おい
#_0B8DFB: db $37, $48, $4F, $27 ; てやろう
#_0B8DFF: db $FC ; wait for key and new line
#_0B8E00: db $FA ; clear message box
#_0B8E01: db $29, $4E, $2F, $43, $3A, $CF, $25, $26 ; おれさまに⎵あい
#_0B8E09: db $34, $2C, $39, $58, $34, $4B ; たくなったら
#_0B8E0F: db $F9 ; new line
#_0B8E10: db $2E, $3D, $40, $28, $51, $CF, $36, $2A ; このふえを⎵つか
#_0B8E18: db $26, $39 ; いな
#_0B8E1A: db $F9 ; new line
#_0B8E1B: db $34, $A6, $30, $CF, $47, $27, $3A, $AA ; ただし⎵もうにど
#_0B8E23: db $38, $CF, $4C, $2C, $3A, $3E, $25, $9C ; と⎵りくにはあが
#_0B8E2B: db $4B, $39, $26, $2A, $4B, $39 ; らないからな
#_0B8E31: db $FC ; wait for key and new line
#_0B8E32: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B8E34: db $E1, $F7 ; set $0A50 to item F7
#_0B8E36: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0B8E38: db $FA ; clear message box
#_0B8E39: db $97 ; >
#_0B8E3A: db $F3 ; write item name from $0A50
#_0B8E3B: db $51, $CF ; を⎵
#_0B8E3D: db $F2, $2D ; prewritten text 2D
#_0B8E3F: db $FC ; wait for key and new line
#_0B8E40: db $D0, $A6 ; set progress bit A6
#_0B8E42: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_02_41:
#_0B8E43: db $97 ; >
#_0B8E44: db $F2, $2C ; prewritten text 2C
#_0B8E46: db $FC ; wait for key and new line
#_0B8E47: db $FF ; end of message

;===================================================================================================

Message_03_02_42:
#_0B8E48: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B8E4D: db $D2, $CD, $43 ; test progress bit CD for message 43
#_0B8E50: db $D3, $46 ; go to message 46

;===================================================================================================

Message_03_02_43:
#_0B8E52: db $D2, $CE, $44 ; test progress bit CE for message 44
#_0B8E55: db $D3, $46 ; go to message 46

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_44:
#_0B8E57: db $97 ; >
#_0B8E58: db $FE, $04, $46, $46 ; ext command 04: message 46 if 11C >= 112; 46 if >= 144
#_0B8E5C: db $F2, $68 ; prewritten text 68
#_0B8E5E: db $F8, $45 ; YES/NO - go to message 45 if YES
#_0B8E60: db $FF ; end of message

;===================================================================================================

Message_03_02_45:
#_0B8E61: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8E66: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8E69: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8E6C: db $FE, $1A, $74, $74, $14, $00, $00, $00 ; ext command 1A: 74,74,14,00,00,00
#_0B8E74: db $D1, $0C ; clear progress bit 0C
#_0B8E76: db $D3, $59 ; go to message 59

;===================================================================================================

; «とびらは とざされている»
Message_03_02_46:
#_0B8E78: db $F2, $69 ; prewritten text 69
#_0B8E7A: db $FC ; wait for key and new line
#_0B8E7B: db $FF ; end of message

;===================================================================================================

; >«とびらは とざされている»
Message_03_02_47:
#_0B8E7C: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B8E81: db $97 ; >
#_0B8E82: db $D2, $67, $48 ; test progress bit 67 for message 48
#_0B8E85: db $F2, $69 ; prewritten text 69
#_0B8E87: db $FC ; wait for key and new line
#_0B8E88: db $FF ; end of message

;===================================================================================================

; «なかに はいりますか?»
Message_03_02_48:
#_0B8E89: db $D2, $0C, $4A ; test progress bit 0C for message 4A
#_0B8E8C: db $F2, $68 ; prewritten text 68
#_0B8E8E: db $F8, $49 ; YES/NO - go to message 49 if YES
#_0B8E90: db $FF ; end of message

;===================================================================================================

Message_03_02_49:
#_0B8E91: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8E96: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8E99: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8E9C: db $FE, $1A, $70, $B4, $14, $00, $00, $00 ; ext command 1A: 70,B4,14,00,00,00
#_0B8EA4: db $D0, $0C ; set progress bit 0C
#_0B8EA6: db $FF ; end of message

;===================================================================================================

; «そとに でますか?»
Message_03_02_4A:
#_0B8EA7: db $F2, $89 ; prewritten text 89
#_0B8EA9: db $F8, $4B ; YES/NO - go to message 4B if YES
#_0B8EAB: db $FF ; end of message

;===================================================================================================

Message_03_02_4B:
#_0B8EAC: db $D1, $0C ; clear progress bit 0C
#_0B8EAE: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8EB3: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8EB6: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8EB9: db $FE, $1A, $70, $32, $14, $00, $00, $00 ; ext command 1A: 70,32,14,00,00,00
#_0B8EC1: db $FF ; end of message

;===================================================================================================

; >«とびらは とざされている»
Message_03_02_4C:
#_0B8EC2: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B8EC7: db $97 ; >
#_0B8EC8: db $D2, $67, $4D ; test progress bit 67 for message 4D
#_0B8ECB: db $F2, $69 ; prewritten text 69
#_0B8ECD: db $FC ; wait for key and new line
#_0B8ECE: db $FF ; end of message

;===================================================================================================

; «なかに はいりますか?»
Message_03_02_4D:
#_0B8ECF: db $D2, $0C, $4F ; test progress bit 0C for message 4F
#_0B8ED2: db $F2, $68 ; prewritten text 68
#_0B8ED4: db $F8, $4E ; YES/NO - go to message 4E if YES
#_0B8ED6: db $FF ; end of message

;===================================================================================================

Message_03_02_4E:
#_0B8ED7: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8EDC: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8EDF: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8EE2: db $FE, $1A, $70, $34, $14, $00, $00, $00 ; ext command 1A: 70,34,14,00,00,00
#_0B8EEA: db $D0, $0C ; set progress bit 0C
#_0B8EEC: db $FF ; end of message

;===================================================================================================

; «そとに でますか?»
Message_03_02_4F:
#_0B8EED: db $F2, $89 ; prewritten text 89
#_0B8EEF: db $F8, $50 ; YES/NO - go to message 50 if YES
#_0B8EF1: db $FF ; end of message

;===================================================================================================

Message_03_02_50:
#_0B8EF2: db $D1, $0C ; clear progress bit 0C
#_0B8EF4: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8EF9: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8EFC: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8EFF: db $FE, $1A, $70, $B6, $14, $00, $00, $00 ; ext command 1A: 70,B6,14,00,00,00
#_0B8F07: db $FF ; end of message

;===================================================================================================

; >«カテドラル»ちゅうしんぶ
Message_03_02_51:
#_0B8F08: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B8F0D: db $97 ; >
#_0B8F0E: db $F2, $5C ; prewritten text 5C
#_0B8F10: db $35, $56, $27, $30, $52, $AD ; ちゅうしんぶ
#_0B8F16: db $FC ; wait for key and new line
#_0B8F17: db $D2, $67, $54 ; test progress bit 67 for message 54

;===================================================================================================

; «なかに はいりますか?»
Message_03_02_52:
#_0B8F1A: db $F2, $68 ; prewritten text 68
#_0B8F1C: db $F8, $53 ; YES/NO - go to message 53 if YES
#_0B8F1E: db $FF ; end of message

;===================================================================================================

Message_03_02_53:
#_0B8F1F: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8F24: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8F27: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8F2A: db $FE, $1A, $74, $34, $14, $00, $00, $00 ; ext command 1A: 74,34,14,00,00,00
#_0B8F32: db $D3, $59 ; go to message 59

;===================================================================================================

; «とびらは とざされている»
Message_03_02_54:
#_0B8F34: db $F2, $69 ; prewritten text 69
#_0B8F36: db $FC ; wait for key and new line
#_0B8F37: db $FF ; end of message

;===================================================================================================

; >«カテドラル»ちゅうしんぶ
Message_03_02_55:
#_0B8F38: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B8F3D: db $97 ; >
#_0B8F3E: db $F2, $5C ; prewritten text 5C
#_0B8F40: db $35, $56, $27, $30, $52, $AD ; ちゅうしんぶ
#_0B8F46: db $FC ; wait for key and new line
#_0B8F47: db $D2, $67, $58 ; test progress bit 67 for message 58

;===================================================================================================

; «なかに はいりますか?»
Message_03_02_56:
#_0B8F4A: db $F2, $68 ; prewritten text 68
#_0B8F4C: db $F8, $57 ; YES/NO - go to message 57 if YES
#_0B8F4E: db $FF ; end of message

;===================================================================================================

Message_03_02_57:
#_0B8F4F: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B8F54: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B8F57: db $D6, $00, $00 ; delete sprite in slot 00
#_0B8F5A: db $FE, $1A, $74, $B4, $14, $00, $00, $00 ; ext command 1A: 74,B4,14,00,00,00
#_0B8F62: db $D3, $59 ; go to message 59

;===================================================================================================

; «とびらは とざされている»
Message_03_02_58:
#_0B8F64: db $F2, $69 ; prewritten text 69
#_0B8F66: db $FC ; wait for key and new line
#_0B8F67: db $FF ; end of message

;===================================================================================================

; ろうじん:
; «カテドラル»の うばいあいは
; けっちゃくが つかなんだ
; «カテドラル»の なかは ロウ カオスりょうほうの
; ものたちが いりみだれておる
; ロウのぐんだんを ひきいておるのは
; 8かいに いる «セラフてんし» ミカエル
; カオスのぐんだんを ひきいておるのは
; ちか8かいに いる テンマ アスラおう
; この りょうめいが いるかぎり
; あらそいは おわるまい«・・・»
Message_03_02_59:
#_0B8F68: db $D5, $45 ; send 45 to APU
#_0B8F6A: db $D7, $2D ; load scene 2D
#_0B8F6C: db $FE, $3A, $02, $03 ; ext command 3A: 02 03 TODO
#_0B8F70: db $FE, $07, $7F ; ext command 07: draw buffered text then wait 126 frames
#_0B8F73: db $D4, $03 ; set text box size to 3
#_0B8F75: db $FE, $04, $5C, $5D ; ext command 04: message 5C if 11C >= 112; 5D if >= 144
#_0B8F79: db $D2, $AB, $5A ; test progress bit AB for message 5A
#_0B8F7C: db $D6, $00, $59, $70, $38 ; place sprite 59 in slot 00 at XY:{70,38}
#_0B8F81: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0B8F86: db $F9 ; new line
#_0B8F87: db $F2, $5C ; prewritten text 5C
#_0B8F89: db $3D, $CF, $27, $AB, $26, $25, $26, $3E ; の⎵うばいあいは
#_0B8F91: db $F9 ; new line
#_0B8F92: db $2D, $58, $35, $55, $2C, $9C, $CF, $36 ; けっちゃくが⎵つ
#_0B8F9A: db $2A, $39, $52, $A6 ; かなんだ
#_0B8F9E: db $FC ; wait for key and new line
#_0B8F9F: db $FA ; clear message box
#_0B8FA0: db $F2, $5C ; prewritten text 5C
#_0B8FA2: db $3D, $CF, $39, $2A, $3E, $CF, $87, $5F ; の⎵なかは⎵ロウ
#_0B8FAA: db $CF, $62, $61, $69, $4C, $57, $27, $42 ; ⎵カオスりょうほ
#_0B8FB2: db $27, $3D ; うの
#_0B8FB4: db $F9 ; new line
#_0B8FB5: db $47, $3D, $34, $35, $9C, $CF, $26, $4C ; ものたちが⎵いり
#_0B8FBD: db $44, $A6, $4E, $37, $29, $4D ; みだれておる
#_0B8FC3: db $FC ; wait for key and new line
#_0B8FC4: db $FA ; clear message box
#_0B8FC5: db $87, $5F, $3D, $9E, $52, $A6, $52, $51 ; ロウのぐんだんを
#_0B8FCD: db $CF, $3F, $2B, $26, $37, $29, $4D, $3D ; ⎵ひきいておるの
#_0B8FD5: db $3E ; は
#_0B8FD6: db $F9 ; new line
#_0B8FD7: db $09, $2A, $26, $3A, $CF, $26, $4D, $CF ; 8かいに⎵いる⎵
#_0B8FDF: db $F2, $87 ; prewritten text 87
#_0B8FE1: db $CF, $7C, $62, $60, $85 ; ⎵ミカエル
#_0B8FE6: db $FC ; wait for key and new line
#_0B8FE7: db $62, $61, $69, $3D, $9E, $52, $A6, $52 ; カオスのぐんだん
#_0B8FEF: db $51, $CF, $3F, $2B, $26, $37, $29, $4D ; を⎵ひきいておる
#_0B8FF7: db $3D, $3E ; のは
#_0B8FF9: db $F9 ; new line
#_0B8FFA: db $35, $2A, $09, $2A, $26, $3A, $CF, $26 ; ちか8かいに⎵い
#_0B9002: db $4D, $CF, $6F, $8A, $7B, $CF, $5D, $69 ; る⎵テンマ⎵アス
#_0B900A: db $83, $29, $27 ; ラおう
#_0B900D: db $FC ; wait for key and new line
#_0B900E: db $2E, $3D, $CF, $4C, $57, $27, $46, $26 ; この⎵りょうめい
#_0B9016: db $9C, $CF, $26, $4D, $2A, $9D, $4C ; が⎵いるかぎり
#_0B901D: db $F9 ; new line
#_0B901E: db $25, $4B, $33, $26, $3E, $CF, $29, $50 ; あらそいは⎵おわ
#_0B9026: db $4D, $43, $26 ; るまい
#_0B9029: db $F2, $0B ; prewritten text 0B
#_0B902B: db $FC ; wait for key and new line
#_0B902C: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B902F: db $D4, $03 ; set text box size to 3
#_0B9031: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9034: db $D0, $AB ; set progress bit AB
#_0B9036: db $D3, $5B ; go to message 5B

;===================================================================================================

; >«カテドラル»ちゅうしんぶ
Message_03_02_5A:
#_0B9038: db $97 ; >
#_0B9039: db $F2, $5C ; prewritten text 5C
#_0B903B: db $35, $56, $27, $30, $52, $AD ; ちゅうしんぶ
#_0B9041: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_5B:
#_0B9042: db $FE, $1A, $75, $74, $14, $00, $00, $00 ; ext command 1A: 75,74,14,00,00,00
#_0B904A: db $FF ; end of message

;===================================================================================================

; «ロウヒーロー»:
; [CHASE]くん
; たいへんな ことに なって«しまいました»
; [HIM]くんが
; «カテドラル»の どうりょくろを
; さどうさせて «しまいました»
; そして カオスの ぐんだんを ひきいて
; テンマ アスラおう が «カテドラル»の
; ちか8かいに のりこんできたのです
; さいじょうかいに おられる ミカエルさまも
; この じたいに こころを いためておられます
; «カテドラル»を とりもどすために
; アスラおうを たおさなければ なりません«・・・»
Message_03_02_5C:
#_0B904B: db $D2, $B2, $5A ; test progress bit B2 for message 5A
#_0B904E: db $D2, $A9, $5A ; test progress bit A9 for message 5A
#_0B9051: db $DE, $01, $00, $1B, $01 ; load 1x demon 011B
#_0B9056: db $E4, $00 ; load demon $00
#_0B9058: db $F2, $66 ; prewritten text 66
#_0B905A: db $9A ; :
#_0B905B: db $F9 ; new line
#_0B905C: db $F0 ; write player name
#_0B905D: db $2C, $52 ; くん
#_0B905F: db $F9 ; new line
#_0B9060: db $34, $26, $41, $52, $39, $CF, $2E, $38 ; たいへんな⎵こと
#_0B9068: db $3A, $CF, $39, $58, $37 ; に⎵なって
#_0B906D: db $F2, $8B ; prewritten text 8B
#_0B906F: db $FC ; wait for key and new line
#_0B9070: db $FA ; clear message box
#_0B9071: db $EF ; write chaos hero name
#_0B9072: db $2C, $52, $9C ; くんが
#_0B9075: db $F9 ; new line
#_0B9076: db $F2, $5C ; prewritten text 5C
#_0B9078: db $3D, $CF, $AA, $27, $4C, $57, $2C, $4F ; の⎵どうりょくろ
#_0B9080: db $51 ; を
#_0B9081: db $F9 ; new line
#_0B9082: db $2F, $AA, $27, $2F, $32, $37, $CF ; さどうさせて⎵
#_0B9089: db $F2, $8B ; prewritten text 8B
#_0B908B: db $FC ; wait for key and new line
#_0B908C: db $FA ; clear message box
#_0B908D: db $33, $30, $37, $CF, $62, $61, $69, $3D ; そして⎵カオスの
#_0B9095: db $CF, $9E, $52, $A6, $52, $51, $CF, $3F ; ⎵ぐんだんを⎵ひ
#_0B909D: db $2B, $26, $37 ; きいて
#_0B90A0: db $F9 ; new line
#_0B90A1: db $6F, $8A, $7B, $CF, $5D, $69, $83, $29 ; テンマ⎵アスラお
#_0B90A9: db $27, $CF, $9C, $CF ; う⎵が⎵
#_0B90AD: db $F2, $5C ; prewritten text 5C
#_0B90AF: db $3D ; の
#_0B90B0: db $F9 ; new line
#_0B90B1: db $35, $2A, $09, $2A, $26, $3A, $CF, $3D ; ちか8かいに⎵の
#_0B90B9: db $4C, $2E, $52, $A9, $2B, $34, $3D, $A9 ; りこんできたので
#_0B90C1: db $31 ; す
#_0B90C2: db $FC ; wait for key and new line
#_0B90C3: db $FA ; clear message box
#_0B90C4: db $2F, $26, $A2, $57, $27, $2A, $26, $3A ; さいじょうかいに
#_0B90CC: db $CF, $29, $4B, $4E, $4D, $CF, $7C, $62 ; ⎵おられる⎵ミカ
#_0B90D4: db $60, $85, $2F, $43, $47 ; エルさまも
#_0B90D9: db $F9 ; new line
#_0B90DA: db $2E, $3D, $CF, $A2, $34, $26, $3A, $CF ; この⎵じたいに⎵
#_0B90E2: db $2E, $2E, $4F, $51, $CF, $26, $34, $46 ; こころを⎵いため
#_0B90EA: db $37, $29, $4B, $4E, $43, $31 ; ておられます
#_0B90F0: db $F9 ; new line
#_0B90F1: db $F2, $5C ; prewritten text 5C
#_0B90F3: db $51, $CF, $38, $4C, $47, $AA, $31, $34 ; を⎵とりもどすた
#_0B90FB: db $46, $3A ; めに
#_0B90FD: db $F9 ; new line
#_0B90FE: db $5D, $69, $83, $29, $27, $51, $CF, $34 ; アスラおうを⎵た
#_0B9106: db $29, $2F, $39, $2D, $4E, $AB, $CF, $39 ; おさなければ⎵な
#_0B910E: db $4C, $43, $32, $52 ; りません
#_0B9112: db $F2, $0B ; prewritten text 0B
#_0B9114: db $FC ; wait for key and new line
#_0B9115: db $D0, $A9 ; set progress bit A9
#_0B9117: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9119: db $D3, $5B ; go to message 5B

;===================================================================================================

; «カオスヒーロー»:
; かみの てさきに なりさがった
; [JIMMY]の やつめ«・・・»
; ついに «カテドラル»の どうりょくろを
; うごかしやがった
; おまけに じょうきゅうてんしどもを ひきつれて
; だいテンシ ミカエルが
; «カテドラル»の 8かいに おでましだ
; ちか8かいに アスラおうが いるってのに
; ロウのやつら «カテドラル»に だれが いようと
; かみを よびだすつもりだ
; そのまえに ミカエルを しまつしてやる«・・・»
; りえ いくぞ!
; «カオスヒロイン»:
; «・・・»«・・・»
Message_03_02_5D:
#_0B911B: db $D2, $C1, $5A ; test progress bit C1 for message 5A
#_0B911E: db $D2, $AA, $5A ; test progress bit AA for message 5A
#_0B9121: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0B9126: db $E4, $00 ; load demon $00
#_0B9128: db $D6, $01, $B3, $90, $28 ; place sprite B3 in slot 01 at XY:{90,28}
#_0B912D: db $F2, $67 ; prewritten text 67
#_0B912F: db $9A ; :
#_0B9130: db $F9 ; new line
#_0B9131: db $2A, $44, $3D, $CF, $37, $2F, $2B, $3A ; かみの⎵てさきに
#_0B9139: db $CF, $39, $4C, $2F, $9C, $58, $34 ; ⎵なりさがった
#_0B9140: db $F9 ; new line
#_0B9141: db $EE ; write lawful hero name
#_0B9142: db $3D, $CF, $48, $36, $46 ; の⎵やつめ
#_0B9147: db $F2, $0B ; prewritten text 0B
#_0B9149: db $FC ; wait for key and new line
#_0B914A: db $FA ; clear message box
#_0B914B: db $36, $26, $3A, $CF ; ついに⎵
#_0B914F: db $F2, $5C ; prewritten text 5C
#_0B9151: db $3D, $CF, $AA, $27, $4C, $57, $2C, $4F ; の⎵どうりょくろ
#_0B9159: db $51 ; を
#_0B915A: db $F9 ; new line
#_0B915B: db $27, $A0, $2A, $30, $48, $9C, $58, $34 ; うごかしやがった
#_0B9163: db $F9 ; new line
#_0B9164: db $29, $43, $2D, $3A, $CF, $A2, $57, $27 ; おまけに⎵じょう
#_0B916C: db $2B, $56, $27, $37, $52, $30, $AA, $47 ; きゅうてんしども
#_0B9174: db $51, $CF, $3F, $2B, $36, $4E, $37 ; を⎵ひきつれて
#_0B917B: db $F9 ; new line
#_0B917C: db $A6, $26, $6F, $8A, $68, $CF, $7C, $62 ; だいテンシ⎵ミカ
#_0B9184: db $60, $85, $9C ; エルが
#_0B9187: db $F9 ; new line
#_0B9188: db $F2, $5C ; prewritten text 5C
#_0B918A: db $3D, $CF, $09, $2A, $26, $3A, $CF, $29 ; の⎵8かいに⎵お
#_0B9192: db $A9, $43, $30, $A6 ; でましだ
#_0B9196: db $FC ; wait for key and new line
#_0B9197: db $FA ; clear message box
#_0B9198: db $35, $2A, $09, $2A, $26, $3A, $CF, $5D ; ちか8かいに⎵ア
#_0B91A0: db $69, $83, $29, $27, $9C, $CF, $26, $4D ; スラおうが⎵いる
#_0B91A8: db $58, $37, $3D, $3A ; ってのに
#_0B91AC: db $F9 ; new line
#_0B91AD: db $87, $5F, $3D, $48, $36, $4B, $CF ; ロウのやつら⎵
#_0B91B4: db $F2, $5C ; prewritten text 5C
#_0B91B6: db $3A, $CF, $A6, $4E, $9C, $CF, $26, $4A ; に⎵だれが⎵いよ
#_0B91BE: db $27, $38 ; うと
#_0B91C0: db $F9 ; new line
#_0B91C1: db $2A, $44, $51, $CF, $4A, $AC, $A6, $31 ; かみを⎵よびだす
#_0B91C9: db $36, $47, $4C, $A6 ; つもりだ
#_0B91CD: db $F9 ; new line
#_0B91CE: db $33, $3D, $43, $28, $3A, $CF, $7C, $62 ; そのまえに⎵ミカ
#_0B91D6: db $60, $85, $51, $CF, $30, $43, $36, $30 ; エルを⎵しまつし
#_0B91DE: db $37, $48, $4D ; てやる
#_0B91E1: db $F2, $0B ; prewritten text 0B
#_0B91E3: db $F9 ; new line
#_0B91E4: db $4C, $28, $CF, $26, $2C, $A5, $94 ; りえ⎵いくぞ!
#_0B91EB: db $FC ; wait for key and new line
#_0B91EC: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B91EE: db $FA ; clear message box
#_0B91EF: db $F2, $6A ; prewritten text 6A
#_0B91F1: db $9A ; :
#_0B91F2: db $F9 ; new line
#_0B91F3: db $F2, $0B ; prewritten text 0B
#_0B91F5: db $F2, $0B ; prewritten text 0B
#_0B91F7: db $FC ; wait for key and new line
#_0B91F8: db $D6, $01, $00 ; delete sprite in slot 01
#_0B91FB: db $D0, $AA ; set progress bit AA
#_0B91FD: db $D3, $5B ; go to message 5B

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_5E:
#_0B91FF: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9204: db $97 ; >
#_0B9205: db $F2, $68 ; prewritten text 68
#_0B9207: db $F8, $5F ; YES/NO - go to message 5F if YES
#_0B9209: db $FF ; end of message

;===================================================================================================

Message_03_02_5F:
#_0B920A: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B920F: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9212: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9215: db $FE, $1A, $0B, $34, $13, $00, $00, $00 ; ext command 1A: 0B,34,13,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_60:
#_0B921D: db $D5, $45 ; send 45 to APU
#_0B921F: db $D7, $3A ; load scene 3A
#_0B9221: db $D4, $03 ; set text box size to 3
#_0B9223: db $D2, $AD, $67 ; test progress bit AD for message 67
#_0B9226: db $DE, $01, $00, $15, $01 ; load 1x demon 0115
#_0B922B: db $E4, $00 ; load demon $00
#_0B922D: db $F5 ; write demon name from $050A
#_0B922E: db $9A ; :
#_0B922F: db $F9 ; new line
#_0B9230: db $FE, $04, $61, $64 ; ext command 04: message 61 if 11C >= 112; 64 if >= 144
#_0B9234: db $D3, $64 ; go to message 64

;===================================================================================================

; [CHASE]よ [MOMO]よ
; あらたなる アダムと イヴよ
; «せんねんおうこく» ちじょうに あらわれるまで
; あと ひといき
; «おまえたち»の ゆくてには
; ひかりが みちあふれておる
Message_03_02_61:
#_0B9236: db $D2, $AC, $62 ; test progress bit AC for message 62
#_0B9239: db $F0 ; write player name
#_0B923A: db $4A, $CF ; よ⎵
#_0B923C: db $ED ; write female protag name
#_0B923D: db $4A ; よ
#_0B923E: db $F9 ; new line
#_0B923F: db $25, $4B, $34, $39, $4D, $CF, $5D, $BF ; あらたなる⎵アダ
#_0B9247: db $7D, $38, $CF, $5E, $CE, $4A ; ムと⎵イヴよ
#_0B924D: db $F9 ; new line
#_0B924E: db $F2, $21 ; prewritten text 21
#_0B9250: db $CF, $35, $A2, $57, $27, $3A, $CF, $25 ; ⎵ちじょうに⎵あ
#_0B9258: db $4B, $50, $4E, $4D, $43, $A9 ; らわれるまで
#_0B925E: db $F9 ; new line
#_0B925F: db $25, $38, $CF, $3F, $38, $26, $2B ; あと⎵ひといき
#_0B9266: db $FC ; wait for key and new line
#_0B9267: db $FA ; clear message box
#_0B9268: db $F2, $04 ; prewritten text 04
#_0B926A: db $3D, $CF, $49, $2C, $37, $3A, $3E ; の⎵ゆくてには
#_0B9271: db $F9 ; new line
#_0B9272: db $3F, $2A, $4C, $9C, $CF, $44, $35, $25 ; ひかりが⎵みちあ
#_0B927A: db $40, $4E, $37, $29, $4D ; ふれておる
#_0B927F: db $FC ; wait for key and new line
#_0B9280: db $D0, $AC ; set progress bit AC
#_0B9282: db $FA ; clear message box

;===================================================================================================

; わが ちからを もって よりいっそうの
; ひかりを «おまえたち»に あたえよう
; >[CLASS] [DEMON1]が
; «ナカマに くわわった»
Message_03_02_62:
#_0B9283: db $50, $9C, $CF, $35, $2A, $4B, $51, $CF ; わが⎵ちからを⎵
#_0B928B: db $47, $58, $37, $CF, $4A, $4C, $26, $58 ; もって⎵よりいっ
#_0B9293: db $33, $27, $3D ; そうの
#_0B9296: db $F9 ; new line
#_0B9297: db $3F, $2A, $4C, $51, $CF ; ひかりを⎵
#_0B929C: db $F2, $04 ; prewritten text 04
#_0B929E: db $3A, $CF, $25, $34, $28, $4A, $27 ; に⎵あたえよう
#_0B92A5: db $FC ; wait for key and new line
#_0B92A6: db $FE, $09, $63 ; ext command 09: demon joins party or message 63 if full
#_0B92A9: db $D4, $03 ; set text box size to 3
#_0B92AB: db $97 ; >
#_0B92AC: db $F6 ; write class name from $0506
#_0B92AD: db $CF ; ⎵
#_0B92AE: db $F5 ; write demon name from $050A
#_0B92AF: db $9C ; が
#_0B92B0: db $F9 ; new line
#_0B92B1: db $F2, $2F ; prewritten text 2F
#_0B92B3: db $FC ; wait for key and new line
#_0B92B4: db $DE, $00, $00, $20, $01 ; load 1x demon 0020
#_0B92B9: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0B92BC: db $D0, $AD ; set progress bit AD
#_0B92BE: db $D3, $68 ; go to message 68

;===================================================================================================

; «では ナカマを へらして»から
; もういちど くるがよい
Message_03_02_63:
#_0B92C0: db $FA ; clear message box
#_0B92C1: db $F2, $43 ; prewritten text 43
#_0B92C3: db $2A, $4B ; から
#_0B92C5: db $F9 ; new line
#_0B92C6: db $47, $27, $26, $35, $AA, $CF, $2C, $4D ; もういちど⎵くる
#_0B92CE: db $9C, $4A, $26 ; がよい
#_0B92D1: db $FC ; wait for key and new line
#_0B92D2: db $D3, $68 ; go to message 68

;===================================================================================================

; きたか アクマの ゆうわくに まけ
; そのみを だらくさせた
; つみぶかき ものたちよ
; しを もって そのつみ くいあらためよ!
Message_03_02_64:
#_0B92D4: db $2B, $34, $2A, $CF, $5D, $64, $7B, $3D ; きたか⎵アクマの
#_0B92DC: db $CF, $49, $27, $50, $2C, $3A, $CF, $43 ; ⎵ゆうわくに⎵ま
#_0B92E4: db $2D ; け
#_0B92E5: db $F9 ; new line
#_0B92E6: db $33, $3D, $44, $51, $CF, $A6, $4B, $2C ; そのみを⎵だらく
#_0B92EE: db $2F, $32, $34 ; させた
#_0B92F1: db $F9 ; new line
#_0B92F2: db $36, $44, $AD, $2A, $2B, $CF, $47, $3D ; つみぶかき⎵もの
#_0B92FA: db $34, $35, $4A ; たちよ
#_0B92FD: db $FC ; wait for key and new line
#_0B92FE: db $FA ; clear message box
#_0B92FF: db $30, $51, $CF, $47, $58, $37, $CF, $33 ; しを⎵もって⎵そ
#_0B9307: db $3D, $36, $44, $CF, $2C, $26, $25, $4B ; のつみ⎵くいあら
#_0B930F: db $34, $46, $4A, $94 ; ためよ!
#_0B9313: db $FC ; wait for key and new line
#_0B9314: db $D5, $39 ; send 39 to APU
#_0B9316: db $E5, $01, $66 ; [COMMAND E5:01,66]

;===================================================================================================

Message_03_02_65:
#_0B9319: db $E5, $00, $66 ; [COMMAND E5:00,66]
#_0B931C: db $D3, $65 ; go to message 65

;===================================================================================================

; [DEMON1]:
; お «おまえたち»には
; だいテンシ ミカエルさまが
; てんばつを あたえよう«・・・»
Message_03_02_66:
#_0B931E: db $F5 ; write demon name from $050A
#_0B931F: db $9A ; :
#_0B9320: db $F9 ; new line
#_0B9321: db $29, $CF ; お⎵
#_0B9323: db $F2, $04 ; prewritten text 04
#_0B9325: db $3A, $3E ; には
#_0B9327: db $F9 ; new line
#_0B9328: db $A6, $26, $6F, $8A, $68, $CF, $7C, $62 ; だいテンシ⎵ミカ
#_0B9330: db $60, $85, $2F, $43, $9C ; エルさまが
#_0B9335: db $F9 ; new line
#_0B9336: db $37, $52, $AB, $36, $51, $CF, $25, $34 ; てんばつを⎵あた
#_0B933E: db $28, $4A, $27 ; えよう
#_0B9341: db $F2, $0B ; prewritten text 0B
#_0B9343: db $FC ; wait for key and new line
#_0B9344: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9346: db $D0, $AD ; set progress bit AD
#_0B9348: db $D3, $68 ; go to message 68

;===================================================================================================

; >«だれもいない»
Message_03_02_67:
#_0B934A: db $97 ; >
#_0B934B: db $F2, $2C ; prewritten text 2C
#_0B934D: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_68:
#_0B934E: db $FE, $1A, $0B, $B6, $13, $00, $00, $00 ; ext command 1A: 0B,B6,13,00,00,00
#_0B9356: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_69:
#_0B9357: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B935C: db $97 ; >
#_0B935D: db $F2, $68 ; prewritten text 68
#_0B935F: db $F8, $6A ; YES/NO - go to message 6A if YES
#_0B9361: db $FF ; end of message

;===================================================================================================

Message_03_02_6A:
#_0B9362: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9367: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B936A: db $D6, $00, $00 ; delete sprite in slot 00
#_0B936D: db $FE, $1A, $11, $FE, $13, $00, $00, $00 ; ext command 1A: 11,FE,13,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_6B:
#_0B9375: db $D5, $45 ; send 45 to APU
#_0B9377: db $D7, $3A ; load scene 3A
#_0B9379: db $D4, $03 ; set text box size to 3
#_0B937B: db $D2, $AF, $72 ; test progress bit AF for message 72
#_0B937E: db $DE, $01, $00, $16, $01 ; load 1x demon 0116
#_0B9383: db $E4, $00 ; load demon $00
#_0B9385: db $F5 ; write demon name from $050A
#_0B9386: db $9A ; :
#_0B9387: db $F9 ; new line
#_0B9388: db $FE, $04, $6C, $6F ; ext command 04: message 6C if 11C >= 112; 6F if >= 144
#_0B938C: db $D3, $6F ; go to message 6F

;===================================================================================================

; かみのため たたかう ゆうしゃよ
; じゃあくなる ものどもを
; «カテドラル»より おいはらい
; ちじょうに ひかりを もたらそう
Message_03_02_6C:
#_0B938E: db $D2, $AE, $6D ; test progress bit AE for message 6D
#_0B9391: db $2A, $44, $3D, $34, $46, $CF, $34, $34 ; かみのため⎵たた
#_0B9399: db $2A, $27, $CF, $49, $27, $30, $55, $4A ; かう⎵ゆうしゃよ
#_0B93A1: db $F9 ; new line
#_0B93A2: db $A2, $55, $25, $2C, $39, $4D, $CF, $47 ; じゃあくなる⎵も
#_0B93AA: db $3D, $AA, $47, $51 ; のどもを
#_0B93AE: db $F9 ; new line
#_0B93AF: db $F2, $5C ; prewritten text 5C
#_0B93B1: db $4A, $4C, $CF, $29, $26, $3E, $4B, $26 ; より⎵おいはらい
#_0B93B9: db $F9 ; new line
#_0B93BA: db $35, $A2, $57, $27, $3A, $CF, $3F, $2A ; ちじょうに⎵ひか
#_0B93C2: db $4C, $51, $CF, $47, $34, $4B, $33, $27 ; りを⎵もたらそう
#_0B93CA: db $FC ; wait for key and new line
#_0B93CB: db $D0, $AE ; set progress bit AE
#_0B93CD: db $FA ; clear message box

;===================================================================================================

; そなたに わが ちから あたえよう
; >[CLASS] [DEMON1]が
; «ナカマに くわわった»
Message_03_02_6D:
#_0B93CE: db $FE, $09, $6E ; ext command 09: demon joins party or message 6E if full
#_0B93D1: db $33, $39, $34, $3A, $CF, $50, $9C, $CF ; そなたに⎵わが⎵
#_0B93D9: db $35, $2A, $4B, $CF, $25, $34, $28, $4A ; ちから⎵あたえよ
#_0B93E1: db $27 ; う
#_0B93E2: db $FC ; wait for key and new line
#_0B93E3: db $D4, $03 ; set text box size to 3
#_0B93E5: db $97 ; >
#_0B93E6: db $F6 ; write class name from $0506
#_0B93E7: db $CF ; ⎵
#_0B93E8: db $F5 ; write demon name from $050A
#_0B93E9: db $9C ; が
#_0B93EA: db $F9 ; new line
#_0B93EB: db $F2, $2F ; prewritten text 2F
#_0B93ED: db $FC ; wait for key and new line
#_0B93EE: db $DE, $00, $00, $22, $01 ; load 1x demon 0022
#_0B93F3: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0B93F6: db $D0, $AF ; set progress bit AF
#_0B93F8: db $D3, $73 ; go to message 73

;===================================================================================================

; «では ナカマを へらして»から
; もういちど くるがよい
Message_03_02_6E:
#_0B93FA: db $FA ; clear message box
#_0B93FB: db $F2, $43 ; prewritten text 43
#_0B93FD: db $2A, $4B ; から
#_0B93FF: db $F9 ; new line
#_0B9400: db $47, $27, $26, $35, $AA, $CF, $2C, $4D ; もういちど⎵くる
#_0B9408: db $9C, $4A, $26 ; がよい
#_0B940B: db $FC ; wait for key and new line
#_0B940C: db $D3, $73 ; go to message 73

;===================================================================================================

; じゃあくな やみに つつまれし ものどもよ
; やみとともに ちじょうより うせよ!
Message_03_02_6F:
#_0B940E: db $A2, $55, $25, $2C, $39, $CF, $48, $44 ; じゃあくな⎵やみ
#_0B9416: db $3A, $CF, $36, $36, $43, $4E, $30, $CF ; に⎵つつまれし⎵
#_0B941E: db $47, $3D, $AA, $47, $4A ; ものどもよ
#_0B9423: db $F9 ; new line
#_0B9424: db $48, $44, $38, $38, $47, $3A, $CF, $35 ; やみとともに⎵ち
#_0B942C: db $A2, $57, $27, $4A, $4C, $CF, $27, $32 ; じょうより⎵うせ
#_0B9434: db $4A, $94 ; よ!
#_0B9436: db $FC ; wait for key and new line
#_0B9437: db $E5, $01, $71 ; [COMMAND E5:01,71]

;===================================================================================================

Message_03_02_70:
#_0B943A: db $E5, $00, $71 ; [COMMAND E5:00,71]
#_0B943D: db $D3, $70 ; go to message 70

;===================================================================================================

; [DEMON1]:
; «・・・»ほうの かみと«・・・»
; かみの «せんねんおうこく»に
; えいこう あれ«・・・»
Message_03_02_71:
#_0B943F: db $F5 ; write demon name from $050A
#_0B9440: db $9A ; :
#_0B9441: db $F9 ; new line
#_0B9442: db $F2, $0B ; prewritten text 0B
#_0B9444: db $42, $27, $3D, $CF, $2A, $44, $38 ; ほうの⎵かみと
#_0B944B: db $F2, $0B ; prewritten text 0B
#_0B944D: db $F9 ; new line
#_0B944E: db $2A, $44, $3D, $CF ; かみの⎵
#_0B9452: db $F2, $21 ; prewritten text 21
#_0B9454: db $3A ; に
#_0B9455: db $F9 ; new line
#_0B9456: db $28, $26, $2E, $27, $CF, $25, $4E ; えいこう⎵あれ
#_0B945D: db $F2, $0B ; prewritten text 0B
#_0B945F: db $FC ; wait for key and new line
#_0B9460: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9462: db $D0, $AF ; set progress bit AF
#_0B9464: db $D3, $73 ; go to message 73

;===================================================================================================

; >«だれもいない»
Message_03_02_72:
#_0B9466: db $97 ; >
#_0B9467: db $F2, $2C ; prewritten text 2C
#_0B9469: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_73:
#_0B946A: db $FE, $1A, $13, $7E, $13, $00, $00, $00 ; ext command 1A: 13,7E,13,00,00,00
#_0B9472: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_74:
#_0B9473: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9478: db $97 ; >
#_0B9479: db $F2, $68 ; prewritten text 68
#_0B947B: db $F8, $75 ; YES/NO - go to message 75 if YES
#_0B947D: db $FF ; end of message

;===================================================================================================

Message_03_02_75:
#_0B947E: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9483: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9486: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9489: db $FE, $1A, $49, $34, $13, $00, $00, $00 ; ext command 1A: 49,34,13,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_76:
#_0B9491: db $D5, $45 ; send 45 to APU
#_0B9493: db $D7, $3A ; load scene 3A
#_0B9495: db $D4, $03 ; set text box size to 3
#_0B9497: db $D2, $B1, $7D ; test progress bit B1 for message 7D
#_0B949A: db $DE, $01, $00, $17, $01 ; load 1x demon 0117
#_0B949F: db $E4, $00 ; load demon $00
#_0B94A1: db $F5 ; write demon name from $050A
#_0B94A2: db $9A ; :
#_0B94A3: db $F9 ; new line
#_0B94A4: db $FE, $04, $77, $7A ; ext command 04: message 77 if 11C >= 112; 7A if >= 144
#_0B94A8: db $D3, $7A ; go to message 7A

;===================================================================================================

; おお ロウのちからに あふれる
; たのもしき ひとのこ [CHASE]よ
; よくぞ ここまできた
; はかいと さつりくが くりかえされる
; せいきまつの よに
; しゅうしふを うとうでは ないか
Message_03_02_77:
#_0B94AA: db $D2, $B0, $78 ; test progress bit B0 for message 78
#_0B94AD: db $29, $29, $CF, $87, $5F, $3D, $35, $2A ; おお⎵ロウのちか
#_0B94B5: db $4B, $3A, $CF, $25, $40, $4E, $4D ; らに⎵あふれる
#_0B94BC: db $F9 ; new line
#_0B94BD: db $34, $3D, $47, $30, $2B, $CF, $3F, $38 ; たのもしき⎵ひと
#_0B94C5: db $3D, $2E, $CF ; のこ⎵
#_0B94C8: db $F0 ; write player name
#_0B94C9: db $4A ; よ
#_0B94CA: db $F9 ; new line
#_0B94CB: db $4A, $2C, $A5, $CF, $2E, $2E, $43, $A9 ; よくぞ⎵ここまで
#_0B94D3: db $2B, $34 ; きた
#_0B94D5: db $FC ; wait for key and new line
#_0B94D6: db $FA ; clear message box
#_0B94D7: db $3E, $2A, $26, $38, $CF, $2F, $36, $4C ; はかいと⎵さつり
#_0B94DF: db $2C, $9C, $CF, $2C, $4C, $2A, $28, $2F ; くが⎵くりかえさ
#_0B94E7: db $4E, $4D ; れる
#_0B94E9: db $F9 ; new line
#_0B94EA: db $32, $26, $2B, $43, $36, $3D, $CF, $4A ; せいきまつの⎵よ
#_0B94F2: db $3A ; に
#_0B94F3: db $F9 ; new line
#_0B94F4: db $30, $56, $27, $30, $40, $51, $CF, $27 ; しゅうしふを⎵う
#_0B94FC: db $38, $27, $A9, $3E, $CF, $39, $26, $2A ; とうでは⎵ないか
#_0B9504: db $FC ; wait for key and new line
#_0B9505: db $D0, $B0 ; set progress bit B0
#_0B9507: db $FA ; clear message box

;===================================================================================================

; ちじょうに へいわが おとずれるまで
; そなたに したがおう
; >[CLASS] [DEMON1]が
; «ナカマに くわわった»
Message_03_02_78:
#_0B9508: db $FE, $09, $79 ; ext command 09: demon joins party or message 79 if full
#_0B950B: db $35, $A2, $57, $27, $3A, $CF, $41, $26 ; ちじょうに⎵へい
#_0B9513: db $50, $9C, $CF, $29, $38, $A3, $4E, $4D ; わが⎵おとずれる
#_0B951B: db $43, $A9 ; まで
#_0B951D: db $F9 ; new line
#_0B951E: db $33, $39, $34, $3A, $CF, $30, $34, $9C ; そなたに⎵したが
#_0B9526: db $29, $27 ; おう
#_0B9528: db $FC ; wait for key and new line
#_0B9529: db $D4, $03 ; set text box size to 3
#_0B952B: db $97 ; >
#_0B952C: db $F6 ; write class name from $0506
#_0B952D: db $CF ; ⎵
#_0B952E: db $F5 ; write demon name from $050A
#_0B952F: db $9C ; が
#_0B9530: db $F9 ; new line
#_0B9531: db $F2, $2F ; prewritten text 2F
#_0B9533: db $FC ; wait for key and new line
#_0B9534: db $DE, $00, $00, $21, $01 ; load 1x demon 0021
#_0B9539: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0B953C: db $D0, $B1 ; set progress bit B1
#_0B953E: db $D3, $7E ; go to message 7E

;===================================================================================================

; «では ナカマを へらして»から
; もういちど くるがよい
Message_03_02_79:
#_0B9540: db $FA ; clear message box
#_0B9541: db $F2, $43 ; prewritten text 43
#_0B9543: db $2A, $4B ; から
#_0B9545: db $F9 ; new line
#_0B9546: db $47, $27, $26, $35, $AA, $CF, $2C, $4D ; もういちど⎵くる
#_0B954E: db $9C, $4A, $26 ; がよい
#_0B9551: db $FC ; wait for key and new line
#_0B9552: db $D3, $7E ; go to message 7E

;===================================================================================================

; おろかものめ まだこれいじょう
; さつりくを くりかえすと いうのか
; ちに まみれた のろわれし ひとのこ
; [CHASE]よ!
Message_03_02_7A:
#_0B9554: db $29, $4F, $2A, $47, $3D, $46, $CF, $43 ; おろかものめ⎵ま
#_0B955C: db $A6, $2E, $4E, $26, $A2, $57, $27 ; だこれいじょう
#_0B9563: db $F9 ; new line
#_0B9564: db $2F, $36, $4C, $2C, $51, $CF, $2C, $4C ; さつりくを⎵くり
#_0B956C: db $2A, $28, $31, $38, $CF, $26, $27, $3D ; かえすと⎵いうの
#_0B9574: db $2A ; か
#_0B9575: db $F9 ; new line
#_0B9576: db $35, $3A, $CF, $43, $44, $4E, $34, $CF ; ちに⎵まみれた⎵
#_0B957E: db $3D, $4F, $50, $4E, $30, $CF, $3F, $38 ; のろわれし⎵ひと
#_0B9586: db $3D, $2E ; のこ
#_0B9588: db $F9 ; new line
#_0B9589: db $F0 ; write player name
#_0B958A: db $4A, $94 ; よ!
#_0B958C: db $FC ; wait for key and new line
#_0B958D: db $D5, $39 ; send 39 to APU
#_0B958F: db $E5, $01, $7C ; [COMMAND E5:01,7C]

;===================================================================================================

Message_03_02_7B:
#_0B9592: db $E5, $00, $7C ; [COMMAND E5:00,7C]
#_0B9595: db $D3, $7B ; go to message 7B

;===================================================================================================

; [DEMON1]:
; «・・・»われ ここで たおれようとも
; «せんねんおうこく»は
; まもなく ちじょうに あらわれよう«・・・»
Message_03_02_7C:
#_0B9597: db $F5 ; write demon name from $050A
#_0B9598: db $9A ; :
#_0B9599: db $F9 ; new line
#_0B959A: db $F2, $0B ; prewritten text 0B
#_0B959C: db $50, $4E, $CF, $2E, $2E, $A9, $CF, $34 ; われ⎵ここで⎵た
#_0B95A4: db $29, $4E, $4A, $27, $38, $47 ; おれようとも
#_0B95AA: db $F9 ; new line
#_0B95AB: db $F2, $21 ; prewritten text 21
#_0B95AD: db $3E ; は
#_0B95AE: db $F9 ; new line
#_0B95AF: db $43, $47, $39, $2C, $CF, $35, $A2, $57 ; まもなく⎵ちじょ
#_0B95B7: db $27, $3A, $CF, $25, $4B, $50, $4E, $4A ; うに⎵あらわれよ
#_0B95BF: db $27 ; う
#_0B95C0: db $F2, $0B ; prewritten text 0B
#_0B95C2: db $FC ; wait for key and new line
#_0B95C3: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B95C5: db $D0, $B1 ; set progress bit B1
#_0B95C7: db $D3, $7E ; go to message 7E

;===================================================================================================

; >«だれもいない»
Message_03_02_7D:
#_0B95C9: db $97 ; >
#_0B95CA: db $F2, $2C ; prewritten text 2C
#_0B95CC: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_7E:
#_0B95CD: db $FE, $1A, $49, $B5, $13, $00, $00, $00 ; ext command 1A: 49,B5,13,00,00,00
#_0B95D5: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
; まだ アクマの さそいに まどわされ
; めが さめないのですか?
; ひとは よわいものです
; まよい きずつき そして しんでゆく«・・・»
; いまの [CHASE]くんは
; ただ まよいつづけて いるだけです
; ロウでも カオスでもない みちを さがすのは
; まぼろしを おっているのと おなじことです
; きみが こころを ひらいてくれれば
; すぐにでも めざめさせて あげられたのに«・・・»
; しかし きみの めざめを まっていられません
; かみなき ちからは
; ちからある アクマを うみだします
; それが いまの きみです
; [CHASE]くん«・・・»
; ちからある アクマを いかしては おけません
Message_03_02_7F:
#_0B95D6: db $D5, $45 ; send 45 to APU
#_0B95D8: db $D2, $0C, $8F ; test progress bit 0C for message 8F
#_0B95DB: db $D2, $86, $8B ; test progress bit 86 for message 8B
#_0B95DE: db $D2, $B2, $8B ; test progress bit B2 for message 8B
#_0B95E1: db $D2, $D4, $8A ; test progress bit D4 for message 8A
#_0B95E4: db $FE, $04, $8A, $80 ; ext command 04: message 8A if 11C >= 112; 80 if >= 144
#_0B95E8: db $DE, $01, $00, $1B, $01 ; load 1x demon 011B
#_0B95ED: db $E4, $00 ; load demon $00
#_0B95EF: db $F5 ; write demon name from $050A
#_0B95F0: db $9A ; :
#_0B95F1: db $F9 ; new line
#_0B95F2: db $43, $A6, $CF, $5D, $64, $7B, $3D, $CF ; まだ⎵アクマの⎵
#_0B95FA: db $2F, $33, $26, $3A, $CF, $43, $AA, $50 ; さそいに⎵まどわ
#_0B9602: db $2F, $4E ; され
#_0B9604: db $F9 ; new line
#_0B9605: db $46, $9C, $CF, $2F, $46, $39, $26, $3D ; めが⎵さめないの
#_0B960D: db $A9, $31, $2A, $95 ; ですか?
#_0B9611: db $FC ; wait for key and new line
#_0B9612: db $FA ; clear message box
#_0B9613: db $3F, $38, $3E, $CF, $4A, $50, $26, $47 ; ひとは⎵よわいも
#_0B961B: db $3D, $A9, $31 ; のです
#_0B961E: db $F9 ; new line
#_0B961F: db $43, $4A, $26, $CF, $2B, $A3, $36, $2B ; まよい⎵きずつき
#_0B9627: db $CF, $33, $30, $37, $CF, $30, $52, $A9 ; ⎵そして⎵しんで
#_0B962F: db $49, $2C ; ゆく
#_0B9631: db $F2, $0B ; prewritten text 0B
#_0B9633: db $F9 ; new line
#_0B9634: db $26, $43, $3D, $CF ; いまの⎵
#_0B9638: db $F0 ; write player name
#_0B9639: db $2C, $52, $3E ; くんは
#_0B963C: db $F9 ; new line
#_0B963D: db $34, $A6, $CF, $43, $4A, $26, $36, $A8 ; ただ⎵まよいつづ
#_0B9645: db $2D, $37, $CF, $26, $4D, $A6, $2D, $A9 ; けて⎵いるだけで
#_0B964D: db $31 ; す
#_0B964E: db $F9 ; new line
#_0B964F: db $87, $5F, $A9, $47, $CF, $62, $61, $69 ; ロウでも⎵カオス
#_0B9657: db $A9, $47, $39, $26, $CF, $44, $35, $51 ; でもない⎵みちを
#_0B965F: db $CF, $2F, $9C, $31, $3D, $3E ; ⎵さがすのは
#_0B9665: db $F9 ; new line
#_0B9666: db $43, $AF, $4F, $30, $51, $CF, $29, $58 ; まぼろしを⎵おっ
#_0B966E: db $37, $26, $4D, $3D, $38, $CF, $29, $39 ; ているのと⎵おな
#_0B9676: db $A2, $2E, $38, $A9, $31 ; じことです
#_0B967B: db $FC ; wait for key and new line
#_0B967C: db $D4, $03 ; set text box size to 3
#_0B967E: db $2B, $44, $9C, $CF, $2E, $2E, $4F, $51 ; きみが⎵こころを
#_0B9686: db $CF, $3F, $4B, $26, $37, $2C, $4E, $4E ; ⎵ひらいてくれれ
#_0B968E: db $AB ; ば
#_0B968F: db $F9 ; new line
#_0B9690: db $31, $9E, $3A, $A9, $47, $CF, $46, $A1 ; すぐにでも⎵めざ
#_0B9698: db $46, $2F, $32, $37, $CF, $25, $9F, $4B ; めさせて⎵あげら
#_0B96A0: db $4E, $34, $3D, $3A ; れたのに
#_0B96A4: db $F2, $0B ; prewritten text 0B
#_0B96A6: db $F9 ; new line
#_0B96A7: db $30, $2A, $30, $CF, $2B, $44, $3D, $CF ; しかし⎵きみの⎵
#_0B96AF: db $46, $A1, $46, $51, $CF, $43, $58, $37 ; めざめを⎵まって
#_0B96B7: db $26, $4B, $4E, $43, $32, $52 ; いられません
#_0B96BD: db $FC ; wait for key and new line
#_0B96BE: db $FA ; clear message box
#_0B96BF: db $2A, $44, $39, $2B, $CF, $35, $2A, $4B ; かみなき⎵ちから
#_0B96C7: db $3E ; は
#_0B96C8: db $F9 ; new line
#_0B96C9: db $35, $2A, $4B, $25, $4D, $CF, $5D, $64 ; ちからある⎵アク
#_0B96D1: db $7B, $51, $CF, $27, $44, $A6, $30, $43 ; マを⎵うみだしま
#_0B96D9: db $31 ; す
#_0B96DA: db $F9 ; new line
#_0B96DB: db $33, $4E, $9C, $CF, $26, $43, $3D, $CF ; それが⎵いまの⎵
#_0B96E3: db $2B, $44, $A9, $31 ; きみです
#_0B96E7: db $F9 ; new line
#_0B96E8: db $F0 ; write player name
#_0B96E9: db $2C, $52 ; くん
#_0B96EB: db $F2, $0B ; prewritten text 0B
#_0B96ED: db $FC ; wait for key and new line
#_0B96EE: db $FA ; clear message box
#_0B96EF: db $35, $2A, $4B, $25, $4D, $CF, $5D, $64 ; ちからある⎵アク
#_0B96F7: db $7B, $51, $CF, $26, $2A, $30, $37, $3E ; マを⎵いかしては
#_0B96FF: db $CF, $29, $2D, $43, $32, $52 ; ⎵おけません
#_0B9705: db $FC ; wait for key and new line
#_0B9706: db $D3, $87 ; go to message 87

;===================================================================================================

Message_03_02_80:
#_0B9708: db $D2, $C3, $81 ; test progress bit C3 for message 81
#_0B970B: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0B9710: db $E4, $00 ; load demon $00
#_0B9712: db $D6, $01, $B3, $90, $28 ; place sprite B3 in slot 01 at XY:{90,28}
#_0B9717: db $D3, $82 ; go to message 82

;===================================================================================================

Message_03_02_81:
#_0B9719: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0B971E: db $E4, $00 ; load demon $00

;===================================================================================================

; «カオスヒーロー»:
; くそっ とびらが あかない!
; どうすれば いいんだ«・・・»
; おれには あける ちからが ないっていうのか!
; «カオスヒロイン»:
; あなたには ちからが あるわよ
; おちついて [HIM]
; なにか ほうほうが あるはずよ
; «カオスヒーロー»:
Message_03_02_82:
#_0B9720: db $F2, $67 ; prewritten text 67
#_0B9722: db $9A ; :
#_0B9723: db $F9 ; new line
#_0B9724: db $D2, $B3, $84 ; test progress bit B3 for message 84
#_0B9727: db $2C, $33, $58, $CF, $38, $AC, $4B, $9C ; くそっ⎵とびらが
#_0B972F: db $CF, $25, $2A, $39, $26, $94 ; ⎵あかない!
#_0B9735: db $F9 ; new line
#_0B9736: db $AA, $27, $31, $4E, $AB, $CF, $26, $26 ; どうすれば⎵いい
#_0B973E: db $52, $A6 ; んだ
#_0B9740: db $F2, $0B ; prewritten text 0B
#_0B9742: db $F9 ; new line
#_0B9743: db $29, $4E, $3A, $3E, $CF, $25, $2D, $4D ; おれには⎵あける
#_0B974B: db $CF, $35, $2A, $4B, $9C, $CF, $39, $26 ; ⎵ちからが⎵ない
#_0B9753: db $58, $37, $26, $27, $3D, $2A, $94 ; っていうのか!
#_0B975A: db $FC ; wait for key and new line
#_0B975B: db $D2, $C3, $83 ; test progress bit C3 for message 83
#_0B975E: db $FA ; clear message box
#_0B975F: db $F2, $6A ; prewritten text 6A
#_0B9761: db $9A ; :
#_0B9762: db $F9 ; new line
#_0B9763: db $25, $39, $34, $3A, $3E, $CF, $35, $2A ; あなたには⎵ちか
#_0B976B: db $4B, $9C, $CF, $25, $4D, $50, $4A ; らが⎵あるわよ
#_0B9772: db $F9 ; new line
#_0B9773: db $29, $35, $36, $26, $37, $CF ; おちついて⎵
#_0B9779: db $EF ; write chaos hero name
#_0B977A: db $F9 ; new line
#_0B977B: db $39, $3A, $2A, $CF, $42, $27, $42, $27 ; なにか⎵ほうほう
#_0B9783: db $9C, $CF, $25, $4D, $3E, $A3, $4A ; が⎵あるはずよ
#_0B978A: db $FC ; wait for key and new line
#_0B978B: db $FA ; clear message box
#_0B978C: db $F2, $67 ; prewritten text 67
#_0B978E: db $9A ; :
#_0B978F: db $F9 ; new line

;===================================================================================================

Message_03_02_83:
#_0B9790: db $D0, $B3 ; set progress bit B3

;===================================================================================================

; [CHASE]も ここまできたのか
; ごらんの とおり こまってるところだ
; この とびらが あきさえすれば
; ミカエルの ところへ いけるんだが«・・・»
Message_03_02_84:
#_0B9792: db $F0 ; write player name
#_0B9793: db $47, $CF, $2E, $2E, $43, $A9, $2B, $34 ; も⎵ここまできた
#_0B979B: db $3D, $2A ; のか
#_0B979D: db $F9 ; new line
#_0B979E: db $A0, $4B, $52, $3D, $CF, $38, $29, $4C ; ごらんの⎵とおり
#_0B97A6: db $CF, $2E, $43, $58, $37, $4D, $38, $2E ; ⎵こまってるとこ
#_0B97AE: db $4F, $A6 ; ろだ
#_0B97B0: db $FC ; wait for key and new line
#_0B97B1: db $FA ; clear message box
#_0B97B2: db $2E, $3D, $CF, $38, $AC, $4B, $9C, $CF ; この⎵とびらが⎵
#_0B97BA: db $25, $2B, $2F, $28, $31, $4E, $AB ; あきさえすれば
#_0B97C1: db $F9 ; new line
#_0B97C2: db $7C, $62, $60, $85, $3D, $CF, $38, $2E ; ミカエルの⎵とこ
#_0B97CA: db $4F, $41, $CF, $26, $2D, $4D, $52, $A6 ; ろへ⎵いけるんだ
#_0B97D2: db $9C ; が
#_0B97D3: db $F2, $0B ; prewritten text 0B
#_0B97D5: db $FC ; wait for key and new line
#_0B97D6: db $E1, $FB ; set $0A50 to item FB
#_0B97D8: db $DD, $FB, $85 ; go to message 85 if missing item FB
#_0B97DB: db $D3, $86 ; go to message 86

;===================================================================================================

Message_03_02_85:
#_0B97DD: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B97DF: db $FF ; end of message

;===================================================================================================

; おお! [ITEM]を もってるのか!?
; それを おれに かすんだ!
; >[HIM]は [ITEM]を はめた
; «カオスヒーロー»:
; «・・・»おおっ ち ちからが わいてくる«・・・»
; う うおおっ!
; ワッ«ハッハッハッハッ» かたてで あいちまった
; すごいぜ! いくらでも ちからが わいてくる
; ワッ«ハッハッハッハッ»«ハッハッハッハッ»ハッハッハ
; ハッハッハ おれは もう ハッハッハ だれにも
; まけないぜ ハッハッハ かみをも ハッハッハ
; しのぐ ちからを «てにいれた»んだ!
; ワッハッハ ハーッ«ハッハッハッハッ»ハ
; ン? な なんだ? か からだが
; おれの おれの からだ があーっ!
; «ロウヒーロー»:
; «・・・»ちからのみ おいもとめた ものが
; あわれなさいごを むかえたようですね«・・・»
; かわいそうですが とうぜんの むくいでしょう
; かみの みこころに
; さからい つづけたのですから«・・・»
; そして [CHASE]くん
; つぎは きみのばんです
; きみも ここで かみに さからったものとして
; さいごを むかえるのです
; こんなことに なってしまって
; ほんとうに ざんねんです«・・・»
; これで えいえんに おわかれです
; さようなら!
Message_03_02_86:
#_0B97E0: db $FA ; clear message box
#_0B97E1: db $29, $29, $94, $CF ; おお!⎵
#_0B97E5: db $F3 ; write item name from $0A50
#_0B97E6: db $51, $CF, $47, $58, $37, $4D, $3D, $2A ; を⎵もってるのか
#_0B97EE: db $94, $95 ; !?
#_0B97F0: db $F9 ; new line
#_0B97F1: db $33, $4E, $51, $CF, $29, $4E, $3A, $CF ; それを⎵おれに⎵
#_0B97F9: db $2A, $31, $52, $A6, $94 ; かすんだ!
#_0B97FE: db $FC ; wait for key and new line
#_0B97FF: db $FA ; clear message box
#_0B9800: db $97 ; >
#_0B9801: db $EF ; write chaos hero name
#_0B9802: db $3E, $CF ; は⎵
#_0B9804: db $F3 ; write item name from $0A50
#_0B9805: db $51, $CF, $3E, $46, $34 ; を⎵はめた
#_0B980A: db $FC ; wait for key and new line
#_0B980B: db $FA ; clear message box
#_0B980C: db $F2, $67 ; prewritten text 67
#_0B980E: db $9A ; :
#_0B980F: db $F9 ; new line
#_0B9810: db $F2, $0B ; prewritten text 0B
#_0B9812: db $29, $29, $58, $CF, $35, $CF, $35, $2A ; おおっ⎵ち⎵ちか
#_0B981A: db $4B, $9C, $CF, $50, $26, $37, $2C, $4D ; らが⎵わいてくる
#_0B9822: db $F2, $0B ; prewritten text 0B
#_0B9824: db $F9 ; new line
#_0B9825: db $27, $CF, $27, $29, $29, $58, $94 ; う⎵うおおっ!
#_0B982C: db $FC ; wait for key and new line
#_0B982D: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9830: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9832: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9837: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B983A: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B983F: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9842: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9845: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B9848: db $E4, $00 ; load demon $00
#_0B984A: db $FA ; clear message box
#_0B984B: db $88, $92 ; ワッ
#_0B984D: db $F2, $6B ; prewritten text 6B
#_0B984F: db $CF, $2A, $34, $37, $A9, $CF, $25, $26 ; ⎵かたてで⎵あい
#_0B9857: db $35, $43, $58, $34 ; ちまった
#_0B985B: db $F9 ; new line
#_0B985C: db $31, $A0, $26, $A4, $94, $CF, $26, $2C ; すごいぜ!⎵いく
#_0B9864: db $4B, $A9, $47, $CF, $35, $2A, $4B, $9C ; らでも⎵ちからが
#_0B986C: db $CF, $50, $26, $37, $2C, $4D ; ⎵わいてくる
#_0B9872: db $F9 ; new line
#_0B9873: db $88, $92 ; ワッ
#_0B9875: db $F2, $6B ; prewritten text 6B
#_0B9877: db $F2, $6B ; prewritten text 6B
#_0B9879: db $76, $92, $76, $92, $76 ; ハッハッハ
#_0B987E: db $FC ; wait for key and new line
#_0B987F: db $FA ; clear message box
#_0B9880: db $76, $92, $76, $92, $76, $CF, $29, $4E ; ハッハッハ⎵おれ
#_0B9888: db $3E, $CF, $47, $27, $CF, $76, $92, $76 ; は⎵もう⎵ハッハ
#_0B9890: db $92, $76, $CF, $A6, $4E, $3A, $47 ; ッハ⎵だれにも
#_0B9897: db $F9 ; new line
#_0B9898: db $43, $2D, $39, $26, $A4, $CF, $76, $92 ; まけないぜ⎵ハッ
#_0B98A0: db $76, $92, $76, $CF, $2A, $44, $51, $47 ; ハッハ⎵かみをも
#_0B98A8: db $CF, $76, $92, $76, $92, $76 ; ⎵ハッハッハ
#_0B98AE: db $F9 ; new line
#_0B98AF: db $30, $3D, $9E, $CF, $35, $2A, $4B, $51 ; しのぐ⎵ちからを
#_0B98B7: db $CF ; ⎵
#_0B98B8: db $F2, $2D ; prewritten text 2D
#_0B98BA: db $52, $A6, $94 ; んだ!
#_0B98BD: db $F9 ; new line
#_0B98BE: db $88, $92, $76, $92, $76, $CF, $76, $5A ; ワッハッハ⎵ハー
#_0B98C6: db $92 ; ッ
#_0B98C7: db $F2, $6B ; prewritten text 6B
#_0B98C9: db $76 ; ハ
#_0B98CA: db $FC ; wait for key and new line
#_0B98CB: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B98CD: db $D6, $00, $80, $70, $28 ; place sprite 80 in slot 00 at XY:{70,28}
#_0B98D2: db $FA ; clear message box
#_0B98D3: db $8A, $95, $CF, $39, $CF, $39, $52, $A6 ; ン?⎵な⎵なんだ
#_0B98DB: db $95, $CF, $2A, $CF, $2A, $4B, $A6, $9C ; ?⎵か⎵からだが
#_0B98E3: db $F9 ; new line
#_0B98E4: db $29, $4E, $3D, $CF, $29, $4E, $3D, $CF ; おれの⎵おれの⎵
#_0B98EC: db $2A, $4B, $A6, $CF, $9C, $25, $5A, $58 ; からだ⎵があーっ
#_0B98F4: db $94 ; !
#_0B98F5: db $FE, $07, $20 ; ext command 07: draw buffered text then wait 31 frames
#_0B98F8: db $D6, $00, $08, $70, $28 ; place sprite 08 in slot 00 at XY:{70,28}
#_0B98FD: db $FE, $07, $20 ; ext command 07: draw buffered text then wait 31 frames
#_0B9900: db $D6, $00, $06, $70, $28 ; place sprite 06 in slot 00 at XY:{70,28}
#_0B9905: db $FE, $07, $20 ; ext command 07: draw buffered text then wait 31 frames
#_0B9908: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0B990B: db $FE, $07, $10 ; ext command 07: draw buffered text then wait 15 frames
#_0B990E: db $D6, $00, $07, $70, $28 ; place sprite 07 in slot 00 at XY:{70,28}
#_0B9913: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0B9916: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9919: db $FC ; wait for key and new line
#_0B991A: db $FA ; clear message box
#_0B991B: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0B991E: db $DE, $01, $00, $1B, $01 ; load 1x demon 011B
#_0B9923: db $E4, $00 ; load demon $00
#_0B9925: db $F2, $66 ; prewritten text 66
#_0B9927: db $9A ; :
#_0B9928: db $F9 ; new line
#_0B9929: db $F2, $0B ; prewritten text 0B
#_0B992B: db $35, $2A, $4B, $3D, $44, $CF, $29, $26 ; ちからのみ⎵おい
#_0B9933: db $47, $38, $46, $34, $CF, $47, $3D, $9C ; もとめた⎵ものが
#_0B993B: db $F9 ; new line
#_0B993C: db $25, $50, $4E, $39, $2F, $26, $A0, $51 ; あわれなさいごを
#_0B9944: db $CF, $45, $2A, $28, $34, $4A, $27, $A9 ; ⎵むかえたようで
#_0B994C: db $31, $3C ; すね
#_0B994E: db $F2, $0B ; prewritten text 0B
#_0B9950: db $F9 ; new line
#_0B9951: db $2A, $50, $26, $33, $27, $A9, $31, $9C ; かわいそうですが
#_0B9959: db $CF, $38, $27, $A4, $52, $3D, $CF, $45 ; ⎵とうぜんの⎵む
#_0B9961: db $2C, $26, $A9, $30, $57, $27 ; くいでしょう
#_0B9967: db $F9 ; new line
#_0B9968: db $2A, $44, $3D, $CF, $44, $2E, $2E, $4F ; かみの⎵みこころ
#_0B9970: db $3A ; に
#_0B9971: db $F9 ; new line
#_0B9972: db $2F, $2A, $4B, $26, $CF, $36, $A8, $2D ; さからい⎵つづけ
#_0B997A: db $34, $3D, $A9, $31, $2A, $4B ; たのですから
#_0B9980: db $F2, $0B ; prewritten text 0B
#_0B9982: db $FC ; wait for key and new line
#_0B9983: db $FA ; clear message box
#_0B9984: db $33, $30, $37, $CF ; そして⎵
#_0B9988: db $F0 ; write player name
#_0B9989: db $2C, $52 ; くん
#_0B998B: db $F9 ; new line
#_0B998C: db $36, $9D, $3E, $CF, $2B, $44, $3D, $AB ; つぎは⎵きみのば
#_0B9994: db $52, $A9, $31 ; んです
#_0B9997: db $FC ; wait for key and new line
#_0B9998: db $2B, $44, $47, $CF, $2E, $2E, $A9, $CF ; きみも⎵ここで⎵
#_0B99A0: db $2A, $44, $3A, $CF, $2F, $2A, $4B, $58 ; かみに⎵さからっ
#_0B99A8: db $34, $47, $3D, $38, $30, $37 ; たものとして
#_0B99AE: db $F9 ; new line
#_0B99AF: db $2F, $26, $A0, $51, $CF, $45, $2A, $28 ; さいごを⎵むかえ
#_0B99B7: db $4D, $3D, $A9, $31 ; るのです
#_0B99BB: db $F9 ; new line
#_0B99BC: db $2E, $52, $39, $2E, $38, $3A, $CF, $39 ; こんなことに⎵な
#_0B99C4: db $58, $37, $30, $43, $58, $37 ; ってしまって
#_0B99CA: db $F9 ; new line
#_0B99CB: db $42, $52, $38, $27, $3A, $CF, $A1, $52 ; ほんとうに⎵ざん
#_0B99D3: db $3C, $52, $A9, $31 ; ねんです
#_0B99D7: db $F2, $0B ; prewritten text 0B
#_0B99D9: db $FC ; wait for key and new line
#_0B99DA: db $FA ; clear message box
#_0B99DB: db $2E, $4E, $A9, $CF, $28, $26, $28, $52 ; これで⎵えいえん
#_0B99E3: db $3A, $CF, $29, $50, $2A, $4E, $A9, $31 ; に⎵おわかれです
#_0B99EB: db $F9 ; new line
#_0B99EC: db $2F, $4A, $27, $39, $4B, $94 ; さようなら!
#_0B99F2: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_87:
#_0B99F3: db $D5, $39 ; send 39 to APU
#_0B99F5: db $E5, $02, $89 ; [COMMAND E5:02,89]

;===================================================================================================

Message_03_02_88:
#_0B99F8: db $E5, $00, $89 ; [COMMAND E5:00,89]
#_0B99FB: db $D3, $88 ; go to message 88

;===================================================================================================

; «ロウヒーロー»:
; «・・・»こ これが かみの おぼしめし
; «・・・»ですか«・・・»
; ぼくは ふたたび しぬのか«・・・»
; ぼくは«・・・»かみに えらばれしものでは«・・・»
; な なかったのか«・・・»«・・・»
; かみに ささげられし«・・・»そうか«・・・»
; ぼくは いけにえに すぎなかったのか«・・・»
Message_03_02_89:
#_0B99FD: db $F2, $66 ; prewritten text 66
#_0B99FF: db $9A ; :
#_0B9A00: db $F9 ; new line
#_0B9A01: db $F2, $0B ; prewritten text 0B
#_0B9A03: db $2E, $CF, $2E, $4E, $9C, $CF, $2A, $44 ; こ⎵これが⎵かみ
#_0B9A0B: db $3D, $CF, $29, $AF, $30, $46, $30 ; の⎵おぼしめし
#_0B9A12: db $F9 ; new line
#_0B9A13: db $F2, $0B ; prewritten text 0B
#_0B9A15: db $A9, $31, $2A ; ですか
#_0B9A18: db $F2, $0B ; prewritten text 0B
#_0B9A1A: db $F9 ; new line
#_0B9A1B: db $AF, $2C, $3E, $CF, $40, $34, $34, $AC ; ぼくは⎵ふたたび
#_0B9A23: db $CF, $30, $3B, $3D, $2A ; ⎵しぬのか
#_0B9A28: db $F2, $0B ; prewritten text 0B
#_0B9A2A: db $FC ; wait for key and new line
#_0B9A2B: db $FA ; clear message box
#_0B9A2C: db $AF, $2C, $3E ; ぼくは
#_0B9A2F: db $F2, $0B ; prewritten text 0B
#_0B9A31: db $2A, $44, $3A, $CF, $28, $4B, $AB, $4E ; かみに⎵えらばれ
#_0B9A39: db $30, $47, $3D, $A9, $3E ; しものでは
#_0B9A3E: db $F2, $0B ; prewritten text 0B
#_0B9A40: db $F9 ; new line
#_0B9A41: db $39, $CF, $39, $2A, $58, $34, $3D, $2A ; な⎵なかったのか
#_0B9A49: db $F2, $0B ; prewritten text 0B
#_0B9A4B: db $F2, $0B ; prewritten text 0B
#_0B9A4D: db $F9 ; new line
#_0B9A4E: db $2A, $44, $3A, $CF, $2F, $2F, $9F, $4B ; かみに⎵ささげら
#_0B9A56: db $4E, $30 ; れし
#_0B9A58: db $F2, $0B ; prewritten text 0B
#_0B9A5A: db $33, $27, $2A ; そうか
#_0B9A5D: db $F2, $0B ; prewritten text 0B
#_0B9A5F: db $F9 ; new line
#_0B9A60: db $AF, $2C, $3E, $CF, $26, $2D, $3A, $28 ; ぼくは⎵いけにえ
#_0B9A68: db $3A, $CF, $31, $9D, $39, $2A, $58, $34 ; に⎵すぎなかった
#_0B9A70: db $3D, $2A ; のか
#_0B9A72: db $F2, $0B ; prewritten text 0B
#_0B9A74: db $FC ; wait for key and new line
#_0B9A75: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9A77: db $D0, $B2 ; set progress bit B2
#_0B9A79: db $D2, $67, $91 ; test progress bit 67 for message 91
#_0B9A7C: db $D3, $8B ; go to message 8B

;===================================================================================================

; «ロウヒーロー»のこえ:
; さあ とびらを あけて
; なかに はいってください
Message_03_02_8A:
#_0B9A7E: db $D2, $D4, $8B ; test progress bit D4 for message 8B
#_0B9A81: db $F2, $66 ; prewritten text 66
#_0B9A83: db $3D, $2E, $28, $9A ; のこえ:
#_0B9A87: db $F9 ; new line
#_0B9A88: db $2F, $25, $CF, $38, $AC, $4B, $51, $CF ; さあ⎵とびらを⎵
#_0B9A90: db $25, $2D, $37 ; あけて
#_0B9A93: db $F9 ; new line
#_0B9A94: db $39, $2A, $3A, $CF, $3E, $26, $58, $37 ; なかに⎵はいって
#_0B9A9C: db $2C, $A6, $2F, $26 ; ください
#_0B9AA0: db $FC ; wait for key and new line
#_0B9AA1: db $FA ; clear message box
#_0B9AA2: db $D0, $D4 ; set progress bit D4

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_8B:
#_0B9AA4: db $FA ; clear message box
#_0B9AA5: db $D0, $86 ; set progress bit 86
#_0B9AA7: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9AAC: db $97 ; >
#_0B9AAD: db $F2, $68 ; prewritten text 68
#_0B9AAF: db $F8, $8C ; YES/NO - go to message 8C if YES
#_0B9AB1: db $FF ; end of message

;===================================================================================================

Message_03_02_8C:
#_0B9AB2: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9AB7: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B9ABA: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9ABF: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9AC2: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9AC5: db $D2, $0C, $90 ; test progress bit 0C for message 90

;===================================================================================================

Message_03_02_8E:
#_0B9AC8: db $FE, $1A, $33, $A2, $13, $00, $00, $00 ; ext command 1A: 33,A2,13,00,00,00
#_0B9AD0: db $D0, $0C ; set progress bit 0C
#_0B9AD2: db $FF ; end of message

;===================================================================================================

; >そとに でますか?
Message_03_02_8F:
#_0B9AD3: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9AD8: db $97, $33, $38, $3A, $CF, $A9, $43, $31 ; >そとに⎵でます
#_0B9AE0: db $2A, $95 ; か?
#_0B9AE2: db $F8, $8D ; YES/NO - go to message 8D if YES
#_0B9AE4: db $FF ; end of message

;===================================================================================================

Message_03_02_90:
#_0B9AE5: db $FE, $1A, $33, $20, $13, $00, $00, $00 ; ext command 1A: 33,20,13,00,00,00
#_0B9AED: db $D1, $0C ; clear progress bit 0C
#_0B9AEF: db $FF ; end of message

;===================================================================================================

; ろうじん:
; よくぞ ここまで きたな
; このさきには かみに つかわされた
; セラフ ミカエルが おる
; ながく みまもってきた かいが あった«・・・»
Message_03_02_91:
#_0B9AF0: db $FA ; clear message box
#_0B9AF1: db $D2, $87, $8B ; test progress bit 87 for message 8B
#_0B9AF4: db $D6, $00, $59, $70, $38 ; place sprite 59 in slot 00 at XY:{70,38}
#_0B9AF9: db $FE, $45, $00, $01 ; ext command 45: something 00, 01 TODO
#_0B9AFD: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0B9B00: db $D6, $00, $59, $70, $38 ; place sprite 59 in slot 00 at XY:{70,38}
#_0B9B05: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0B9B0A: db $F9 ; new line
#_0B9B0B: db $4A, $2C, $A5, $CF, $2E, $2E, $43, $A9 ; よくぞ⎵ここまで
#_0B9B13: db $CF, $2B, $34, $39 ; ⎵きたな
#_0B9B17: db $F9 ; new line
#_0B9B18: db $2E, $3D, $2F, $2B, $3A, $3E, $CF, $2A ; このさきには⎵か
#_0B9B20: db $44, $3A, $CF, $36, $2A, $50, $2F, $4E ; みに⎵つかわされ
#_0B9B28: db $34 ; た
#_0B9B29: db $F9 ; new line
#_0B9B2A: db $6A, $83, $78, $CF, $7C, $62, $60, $85 ; セラフ⎵ミカエル
#_0B9B32: db $9C, $CF, $29, $4D ; が⎵おる
#_0B9B36: db $FC ; wait for key and new line
#_0B9B37: db $FA ; clear message box
#_0B9B38: db $39, $9C, $2C, $CF, $44, $43, $47, $58 ; ながく⎵みまもっ
#_0B9B40: db $37, $2B, $34, $CF, $2A, $26, $9C, $CF ; てきた⎵かいが⎵
#_0B9B48: db $25, $58, $34 ; あった
#_0B9B4B: db $F2, $0B ; prewritten text 0B
#_0B9B4D: db $FC ; wait for key and new line
#_0B9B4E: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0B9B51: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0B9B54: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9B57: db $D6, $00, $9D, $78, $40 ; place sprite 9D in slot 00 at XY:{78,40}
#_0B9B5C: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames

;===================================================================================================

; «タイジョウロウクン»:
; さあ ゆくがよい
Message_03_02_92:
#_0B9B5F: db $D6, $00, $66, $70, $28 ; place sprite 66 in slot 00 at XY:{70,28}
#_0B9B64: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0B9B67: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0B9B6A: db $D6, $00, $66, $70, $28 ; place sprite 66 in slot 00 at XY:{70,28}
#_0B9B6F: db $D0, $87 ; set progress bit 87
#_0B9B71: db $FA ; clear message box
#_0B9B72: db $F2, $8A ; prewritten text 8A
#_0B9B74: db $9A ; :
#_0B9B75: db $F9 ; new line
#_0B9B76: db $2F, $25, $CF, $49, $2C, $9C, $4A, $26 ; さあ⎵ゆくがよい
#_0B9B7E: db $FC ; wait for key and new line
#_0B9B7F: db $D6, $00, $66, $70, $28 ; place sprite 66 in slot 00 at XY:{70,28}
#_0B9B84: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0B9B87: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0B9B8A: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9B8D: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0B9B90: db $D3, $8B ; go to message 8B

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_93:
#_0B9B92: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9B97: db $97 ; >
#_0B9B98: db $F2, $68 ; prewritten text 68
#_0B9B9A: db $F8, $94 ; YES/NO - go to message 94 if YES
#_0B9B9C: db $FF ; end of message

;===================================================================================================

Message_03_02_94:
#_0B9B9D: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9BA2: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9BA5: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9BA8: db $FE, $1A, $41, $E7, $14, $00, $00, $00 ; ext command 1A: 41,E7,14,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_95:
#_0B9BB0: db $D5, $46 ; send 46 to APU
#_0B9BB2: db $D7, $3B ; load scene 3B
#_0B9BB4: db $D4, $03 ; set text box size to 3
#_0B9BB6: db $DE, $01, $00, $1A, $01 ; load 1x demon 011A
#_0B9BBB: db $D2, $B9, $9E ; test progress bit B9 for message 9E
#_0B9BBE: db $E4, $00 ; load demon $00
#_0B9BC0: db $F5 ; write demon name from $050A
#_0B9BC1: db $9A ; :
#_0B9BC2: db $F9 ; new line
#_0B9BC3: db $FE, $04, $9A, $96 ; ext command 04: message 9A if 11C >= 112; 96 if >= 144
#_0B9BC7: db $D3, $9A ; go to message 9A

;===================================================================================================

; ここ «カテドラル»は
; まもなく カオスがわの てに おちよう
; «おまえたち»の はたらきも みごとで あった
; «おまえたち»ニンゲンには
; じょうねつと よくぼうが ある
; それを おさえつけて えられる へいわに
; なんの かちが あろう
Message_03_02_96:
#_0B9BC9: db $D2, $B8, $97 ; test progress bit B8 for message 97
#_0B9BCC: db $2E, $2E, $CF ; ここ⎵
#_0B9BCF: db $F2, $5C ; prewritten text 5C
#_0B9BD1: db $3E ; は
#_0B9BD2: db $F9 ; new line
#_0B9BD3: db $43, $47, $39, $2C, $CF, $62, $61, $69 ; まもなく⎵カオス
#_0B9BDB: db $9C, $50, $3D, $CF, $37, $3A, $CF, $29 ; がわの⎵てに⎵お
#_0B9BE3: db $35, $4A, $27 ; ちよう
#_0B9BE6: db $F9 ; new line
#_0B9BE7: db $F2, $04 ; prewritten text 04
#_0B9BE9: db $3D, $CF, $3E, $34, $4B, $2B, $47, $CF ; の⎵はたらきも⎵
#_0B9BF1: db $44, $A0, $38, $A9, $CF, $25, $58, $34 ; みごとで⎵あった
#_0B9BF9: db $FC ; wait for key and new line
#_0B9BFA: db $FA ; clear message box
#_0B9BFB: db $F2, $04 ; prewritten text 04
#_0B9BFD: db $72, $8A, $B8, $8A, $3A, $3E ; ニンゲンには
#_0B9C03: db $F9 ; new line
#_0B9C04: db $A2, $57, $27, $3C, $36, $38, $CF, $4A ; じょうねつと⎵よ
#_0B9C0C: db $2C, $AF, $27, $9C, $CF, $25, $4D ; くぼうが⎵ある
#_0B9C13: db $F9 ; new line
#_0B9C14: db $33, $4E, $51, $CF, $29, $2F, $28, $36 ; それを⎵おさえつ
#_0B9C1C: db $2D, $37, $CF, $28, $4B, $4E, $4D, $CF ; けて⎵えられる⎵
#_0B9C24: db $41, $26, $50, $3A ; へいわに
#_0B9C28: db $F9 ; new line
#_0B9C29: db $39, $52, $3D, $CF, $2A, $35, $9C, $CF ; なんの⎵かちが⎵
#_0B9C31: db $25, $4F, $27 ; あろう
#_0B9C34: db $FC ; wait for key and new line
#_0B9C35: db $FA ; clear message box

;===================================================================================================

Message_03_02_97:
#_0B9C36: db $D2, $B7, $9D ; test progress bit B7 for message 9D
#_0B9C39: db $D2, $C8, $98 ; test progress bit C8 for message 98
#_0B9C3C: db $D0, $B8 ; set progress bit B8
#_0B9C3E: db $D3, $9D ; go to message 9D

;===================================================================================================

; そうか«・・・»
; わが つめを しょもうするとは
; ふてきな ニンゲンめ«・・・»«・・・»
; よろしい まりょく ひめたる
; [ITEM]を あたえよう
; >[LEADER]は [ITEM]を
; «てにいれた»
Message_03_02_98:
#_0B9C40: db $E1, $F8 ; set $0A50 to item F8
#_0B9C42: db $33, $27, $2A ; そうか
#_0B9C45: db $F2, $0B ; prewritten text 0B
#_0B9C47: db $F9 ; new line
#_0B9C48: db $50, $9C, $CF, $36, $46, $51, $CF, $30 ; わが⎵つめを⎵し
#_0B9C50: db $57, $47, $27, $31, $4D, $38, $3E ; ょもうするとは
#_0B9C57: db $F9 ; new line
#_0B9C58: db $40, $37, $2B, $39, $CF, $72, $8A, $B8 ; ふてきな⎵ニンゲ
#_0B9C60: db $8A, $46 ; ンめ
#_0B9C62: db $F2, $0B ; prewritten text 0B
#_0B9C64: db $F2, $0B ; prewritten text 0B
#_0B9C66: db $F9 ; new line
#_0B9C67: db $4A, $4F, $30, $26, $CF, $43, $4C, $57 ; よろしい⎵まりょ
#_0B9C6F: db $2C, $CF, $3F, $46, $34, $4D ; く⎵ひめたる
#_0B9C75: db $F9 ; new line
#_0B9C76: db $F3 ; write item name from $0A50
#_0B9C77: db $51, $CF, $25, $34, $28, $4A, $27 ; を⎵あたえよう
#_0B9C7E: db $FC ; wait for key and new line
#_0B9C7F: db $FE, $3C, $99 ; ext command 3C: go to message 99 if no space for item
#_0B9C82: db $FA ; clear message box
#_0B9C83: db $97 ; >
#_0B9C84: db $F1 ; write leader's name for team
#_0B9C85: db $3E, $CF ; は⎵
#_0B9C87: db $F3 ; write item name from $0A50
#_0B9C88: db $51 ; を
#_0B9C89: db $F9 ; new line
#_0B9C8A: db $F2, $2D ; prewritten text 2D
#_0B9C8C: db $FC ; wait for key and new line
#_0B9C8D: db $D0, $B7 ; set progress bit B7
#_0B9C8F: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0B9C91: db $D3, $9F ; go to message 9F

;===================================================================================================

; «では もちものを へらしてこい»
Message_03_02_99:
#_0B9C93: db $FA ; clear message box
#_0B9C94: db $F2, $79 ; prewritten text 79
#_0B9C96: db $FC ; wait for key and new line
#_0B9C97: db $D0, $B8 ; set progress bit B8
#_0B9C99: db $D3, $9F ; go to message 9F

;===================================================================================================

; ニンゲンよ«・・・»
; かみに つくられし
; できそこないの ニンギョウよ
; «おまえたち»は
; しょせん ほろびゆく さだめ
; ここで いんどうを わたしてやろう!
Message_03_02_9A:
#_0B9C9B: db $72, $8A, $B8, $8A, $4A ; ニンゲンよ
#_0B9CA0: db $F2, $0B ; prewritten text 0B
#_0B9CA2: db $F9 ; new line
#_0B9CA3: db $2A, $44, $3A, $CF, $36, $2C, $4B, $4E ; かみに⎵つくられ
#_0B9CAB: db $30 ; し
#_0B9CAC: db $F9 ; new line
#_0B9CAD: db $A9, $2B, $33, $2E, $39, $26, $3D, $CF ; できそこないの⎵
#_0B9CB5: db $72, $8A, $B6, $91, $5F, $4A ; ニンギョウよ
#_0B9CBB: db $FC ; wait for key and new line
#_0B9CBC: db $FA ; clear message box
#_0B9CBD: db $F2, $04 ; prewritten text 04
#_0B9CBF: db $3E ; は
#_0B9CC0: db $F9 ; new line
#_0B9CC1: db $30, $57, $32, $52, $CF, $42, $4F, $AC ; しょせん⎵ほろび
#_0B9CC9: db $49, $2C, $CF, $2F, $A6, $46 ; ゆく⎵さだめ
#_0B9CCF: db $F9 ; new line
#_0B9CD0: db $2E, $2E, $A9, $CF, $26, $52, $AA, $27 ; ここで⎵いんどう
#_0B9CD8: db $51, $CF, $50, $34, $30, $37, $48, $4F ; を⎵わたしてやろ
#_0B9CE0: db $27, $94 ; う!
#_0B9CE2: db $FC ; wait for key and new line
#_0B9CE3: db $D5, $39 ; send 39 to APU
#_0B9CE5: db $E5, $01, $9C ; [COMMAND E5:01,9C]

;===================================================================================================

Message_03_02_9B:
#_0B9CE8: db $E5, $00, $9C ; [COMMAND E5:00,9C]
#_0B9CEB: db $D3, $9B ; go to message 9B

;===================================================================================================

; [DEMON1]:
; くっ できそこないの かみの ニンギョウに
; いんどうを わたされるとは«・・・»
; おちたものだ«・・・»
Message_03_02_9C:
#_0B9CED: db $F5 ; write demon name from $050A
#_0B9CEE: db $9A ; :
#_0B9CEF: db $F9 ; new line
#_0B9CF0: db $2C, $58, $CF, $A9, $2B, $33, $2E, $39 ; くっ⎵できそこな
#_0B9CF8: db $26, $3D, $CF, $2A, $44, $3D, $CF, $72 ; いの⎵かみの⎵ニ
#_0B9D00: db $8A, $B6, $91, $5F, $3A ; ンギョウに
#_0B9D05: db $F9 ; new line
#_0B9D06: db $26, $52, $AA, $27, $51, $CF, $50, $34 ; いんどうを⎵わた
#_0B9D0E: db $2F, $4E, $4D, $38, $3E ; されるとは
#_0B9D13: db $F2, $0B ; prewritten text 0B
#_0B9D15: db $F9 ; new line
#_0B9D16: db $29, $35, $34, $47, $3D, $A6 ; おちたものだ
#_0B9D1C: db $F2, $0B ; prewritten text 0B
#_0B9D1E: db $FC ; wait for key and new line
#_0B9D1F: db $D0, $B9 ; set progress bit B9
#_0B9D21: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9D23: db $D3, $9F ; go to message 9F

;===================================================================================================

; カオスの ぐんだんを ひきいる
; アスラおうも きたいしておいでだ
Message_03_02_9D:
#_0B9D25: db $62, $61, $69, $3D, $CF, $9E, $52, $A6 ; カオスの⎵ぐんだ
#_0B9D2D: db $52, $51, $CF, $3F, $2B, $26, $4D ; んを⎵ひきいる
#_0B9D34: db $F9 ; new line
#_0B9D35: db $5D, $69, $83, $29, $27, $47, $CF, $2B ; アスラおうも⎵き
#_0B9D3D: db $34, $26, $30, $37, $29, $26, $A9, $A6 ; たいしておいでだ
#_0B9D45: db $FC ; wait for key and new line
#_0B9D46: db $D3, $9F ; go to message 9F

;===================================================================================================

; >«だれもいない»
Message_03_02_9E:
#_0B9D48: db $97 ; >
#_0B9D49: db $F2, $2C ; prewritten text 2C
#_0B9D4B: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_9F:
#_0B9D4C: db $FE, $1A, $42, $67, $14, $00, $00, $00 ; ext command 1A: 42,67,14,00,00,00
#_0B9D54: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_A0:
#_0B9D55: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9D5A: db $97 ; >
#_0B9D5B: db $F2, $68 ; prewritten text 68
#_0B9D5D: db $F8, $A1 ; YES/NO - go to message A1 if YES
#_0B9D5F: db $FF ; end of message

;===================================================================================================

Message_03_02_A1:
#_0B9D60: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9D65: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9D68: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9D6B: db $FE, $1A, $59, $A7, $14, $00, $00, $00 ; ext command 1A: 59,A7,14,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_A2:
#_0B9D73: db $D5, $46 ; send 46 to APU
#_0B9D75: db $D7, $3B ; load scene 3B
#_0B9D77: db $D4, $03 ; set text box size to 3
#_0B9D79: db $DE, $01, $00, $19, $01 ; load 1x demon 0119
#_0B9D7E: db $D2, $BC, $AC ; test progress bit BC for message AC
#_0B9D81: db $E4, $00 ; load demon $00
#_0B9D83: db $F5 ; write demon name from $050A
#_0B9D84: db $9A ; :
#_0B9D85: db $F9 ; new line
#_0B9D86: db $FE, $04, $A7, $A3 ; ext command 04: message A7 if 11C >= 112; A3 if >= 144
#_0B9D8A: db $D3, $A7 ; go to message A7

;===================================================================================================

; «ホーッホッホッホッホ»
; かみに たちむかう
; おおしき ひとのことは そなたたちか
Message_03_02_A3:
#_0B9D8C: db $D2, $BB, $A4 ; test progress bit BB for message A4
#_0B9D8F: db $F2, $7A ; prewritten text 7A
#_0B9D91: db $F9 ; new line
#_0B9D92: db $2A, $44, $3A, $CF, $34, $35, $45, $2A ; かみに⎵たちむか
#_0B9D9A: db $27 ; う
#_0B9D9B: db $F9 ; new line
#_0B9D9C: db $29, $29, $30, $2B, $CF, $3F, $38, $3D ; おおしき⎵ひとの
#_0B9DA4: db $2E, $38, $3E, $CF, $33, $39, $34, $34 ; ことは⎵そなたた
#_0B9DAC: db $35, $2A ; ちか
#_0B9DAE: db $FC ; wait for key and new line
#_0B9DAF: db $D0, $BB ; set progress bit BB
#_0B9DB1: db $FA ; clear message box

;===================================================================================================

; そなたたちが かちつづければ
; マオウにされた わたしも
; しんの すがた とりもどせるかもしれん
; «ホーッホッホッホッホ»
Message_03_02_A4:
#_0B9DB2: db $33, $39, $34, $34, $35, $9C, $CF, $2A ; そなたたちが⎵か
#_0B9DBA: db $35, $36, $A8, $2D, $4E, $AB ; ちつづければ
#_0B9DC0: db $F9 ; new line
#_0B9DC1: db $7B, $61, $5F, $3A, $2F, $4E, $34, $CF ; マオウにされた⎵
#_0B9DC9: db $50, $34, $30, $47 ; わたしも
#_0B9DCD: db $F9 ; new line
#_0B9DCE: db $30, $52, $3D, $CF, $31, $9C, $34, $CF ; しんの⎵すがた⎵
#_0B9DD6: db $38, $4C, $47, $AA, $32, $4D, $2A, $47 ; とりもどせるかも
#_0B9DDE: db $30, $4E, $52 ; しれん
#_0B9DE1: db $F9 ; new line
#_0B9DE2: db $F2, $7A ; prewritten text 7A
#_0B9DE4: db $FC ; wait for key and new line
#_0B9DE5: db $D2, $BA, $AA ; test progress bit BA for message AA
#_0B9DE8: db $D2, $C8, $A5 ; test progress bit C8 for message A5
#_0B9DEB: db $D3, $AA ; go to message AA

;===================================================================================================

; わが はねを ほしいと もうすか«・・・»
; かみに たちむかうものの ねがい
; きかぬわけには ゆくまい
; «ホーッホッホッホッホ»
; >[LEADER]は [ITEM]を
; «てにいれた»
Message_03_02_A5:
#_0B9DED: db $E1, $F9 ; set $0A50 to item F9
#_0B9DEF: db $FA ; clear message box
#_0B9DF0: db $50, $9C, $CF, $3E, $3C, $51, $CF, $42 ; わが⎵はねを⎵ほ
#_0B9DF8: db $30, $26, $38, $CF, $47, $27, $31, $2A ; しいと⎵もうすか
#_0B9E00: db $F2, $0B ; prewritten text 0B
#_0B9E02: db $F9 ; new line
#_0B9E03: db $2A, $44, $3A, $CF, $34, $35, $45, $2A ; かみに⎵たちむか
#_0B9E0B: db $27, $47, $3D, $3D, $CF, $3C, $9C, $26 ; うものの⎵ねがい
#_0B9E13: db $F9 ; new line
#_0B9E14: db $2B, $2A, $3B, $50, $2D, $3A, $3E, $CF ; きかぬわけには⎵
#_0B9E1C: db $49, $2C, $43, $26 ; ゆくまい
#_0B9E20: db $F9 ; new line
#_0B9E21: db $F2, $7A ; prewritten text 7A
#_0B9E23: db $FC ; wait for key and new line
#_0B9E24: db $FE, $3C, $A6 ; ext command 3C: go to message A6 if no space for item
#_0B9E27: db $D4, $03 ; set text box size to 3
#_0B9E29: db $97 ; >
#_0B9E2A: db $F1 ; write leader's name for team
#_0B9E2B: db $3E, $CF ; は⎵
#_0B9E2D: db $F3 ; write item name from $0A50
#_0B9E2E: db $51 ; を
#_0B9E2F: db $F9 ; new line
#_0B9E30: db $F2, $2D ; prewritten text 2D
#_0B9E32: db $FC ; wait for key and new line
#_0B9E33: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0B9E35: db $D0, $BA ; set progress bit BA
#_0B9E37: db $D3, $AB ; go to message AB

;===================================================================================================

; «では もちものを へらしてこい»
Message_03_02_A6:
#_0B9E39: db $FA ; clear message box
#_0B9E3A: db $F2, $79 ; prewritten text 79
#_0B9E3C: db $FC ; wait for key and new line
#_0B9E3D: db $D3, $AB ; go to message AB

;===================================================================================================

; «ホーッホッホッホッホ»
; めしいて かみに したがうのみの
; あわれな こひつじよ かくごしろ!
Message_03_02_A7:
#_0B9E3F: db $F2, $7A ; prewritten text 7A
#_0B9E41: db $F9 ; new line
#_0B9E42: db $46, $30, $26, $37, $CF, $2A, $44, $3A ; めしいて⎵かみに
#_0B9E4A: db $CF, $30, $34, $9C, $27, $3D, $44, $3D ; ⎵したがうのみの
#_0B9E52: db $F9 ; new line
#_0B9E53: db $25, $50, $4E, $39, $CF, $2E, $3F, $36 ; あわれな⎵こひつ
#_0B9E5B: db $A2, $4A, $CF, $2A, $2C, $A0, $30, $4F ; じよ⎵かくごしろ
#_0B9E63: db $94 ; !
#_0B9E64: db $FC ; wait for key and new line
#_0B9E65: db $D5, $39 ; send 39 to APU
#_0B9E67: db $E5, $01, $A9 ; [COMMAND E5:01,A9]

;===================================================================================================

Message_03_02_A8:
#_0B9E6A: db $E5, $00, $A9 ; [COMMAND E5:00,A9]
#_0B9E6D: db $D3, $A8 ; go to message A8

;===================================================================================================

; [DEMON1]:
; «・・・»もうすこしで イシュタルの すがた
; とりもどせた ものを«・・・»
; む むねん«・・・»
Message_03_02_A9:
#_0B9E6F: db $F5 ; write demon name from $050A
#_0B9E70: db $9A ; :
#_0B9E71: db $F9 ; new line
#_0B9E72: db $F2, $0B ; prewritten text 0B
#_0B9E74: db $47, $27, $31, $2E, $30, $A9, $CF, $5E ; もうすこしで⎵イ
#_0B9E7C: db $68, $90, $6C, $85, $3D, $CF, $31, $9C ; シュタルの⎵すが
#_0B9E84: db $34 ; た
#_0B9E85: db $F9 ; new line
#_0B9E86: db $38, $4C, $47, $AA, $32, $34, $CF, $47 ; とりもどせた⎵も
#_0B9E8E: db $3D, $51 ; のを
#_0B9E90: db $F2, $0B ; prewritten text 0B
#_0B9E92: db $F9 ; new line
#_0B9E93: db $45, $CF, $45, $3C, $52 ; む⎵むねん
#_0B9E98: db $F2, $0B ; prewritten text 0B
#_0B9E9A: db $FC ; wait for key and new line
#_0B9E9B: db $D0, $BC ; set progress bit BC
#_0B9E9D: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9E9F: db $D3, $AB ; go to message AB

;===================================================================================================

; おおしき ひとのこよ
; ロウの てさきがいう ほうや ちつじょに
; くみこまれるで ないぞ
; «ホーッホッホッホッホ»
Message_03_02_AA:
#_0B9EA1: db $FA ; clear message box
#_0B9EA2: db $29, $29, $30, $2B, $CF, $3F, $38, $3D ; おおしき⎵ひとの
#_0B9EAA: db $2E, $4A ; こよ
#_0B9EAC: db $F9 ; new line
#_0B9EAD: db $87, $5F, $3D, $CF, $37, $2F, $2B, $9C ; ロウの⎵てさきが
#_0B9EB5: db $26, $27, $CF, $42, $27, $48, $CF, $35 ; いう⎵ほうや⎵ち
#_0B9EBD: db $36, $A2, $57, $3A ; つじょに
#_0B9EC1: db $F9 ; new line
#_0B9EC2: db $2C, $44, $2E, $43, $4E, $4D, $A9, $CF ; くみこまれるで⎵
#_0B9ECA: db $39, $26, $A5 ; ないぞ
#_0B9ECD: db $F9 ; new line
#_0B9ECE: db $F2, $7A ; prewritten text 7A
#_0B9ED0: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_AB:
#_0B9ED1: db $FE, $1A, $59, $26, $14, $00, $00, $00 ; ext command 1A: 59,26,14,00,00,00
#_0B9ED9: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_02_AC:
#_0B9EDA: db $97 ; >
#_0B9EDB: db $F2, $2C ; prewritten text 2C
#_0B9EDD: db $FC ; wait for key and new line
#_0B9EDE: db $D3, $AB ; go to message AB

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_AD:
#_0B9EE0: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0B9EE5: db $97 ; >
#_0B9EE6: db $F2, $68 ; prewritten text 68
#_0B9EE8: db $F8, $AE ; YES/NO - go to message AE if YES
#_0B9EEA: db $FF ; end of message

;===================================================================================================

Message_03_02_AE:
#_0B9EEB: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0B9EF0: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0B9EF3: db $D6, $00, $00 ; delete sprite in slot 00
#_0B9EF6: db $FE, $1A, $52, $3B, $14, $00, $00, $00 ; ext command 1A: 52,3B,14,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_AF:
#_0B9EFE: db $D5, $46 ; send 46 to APU
#_0B9F00: db $D7, $3B ; load scene 3B
#_0B9F02: db $D4, $03 ; set text box size to 3
#_0B9F04: db $DE, $01, $00, $18, $01 ; load 1x demon 0118
#_0B9F09: db $D2, $BF, $B8 ; test progress bit BF for message B8
#_0B9F0C: db $E4, $00 ; load demon $00
#_0B9F0E: db $F5 ; write demon name from $050A
#_0B9F0F: db $9A ; :
#_0B9F10: db $F9 ; new line
#_0B9F11: db $D2, $BD, $B7 ; test progress bit BD for message B7
#_0B9F14: db $FE, $04, $B4, $B0 ; ext command 04: message B4 if 11C >= 112; B0 if >= 144
#_0B9F18: db $D3, $B4 ; go to message B4

;===================================================================================================

; カオスの がわに みを とうじ
; たたかう ニンゲンか
; なんと けなげな
Message_03_02_B0:
#_0B9F1A: db $D2, $BE, $B1 ; test progress bit BE for message B1
#_0B9F1D: db $62, $61, $69, $3D, $CF, $9C, $50, $3A ; カオスの⎵がわに
#_0B9F25: db $CF, $44, $51, $CF, $38, $27, $A2 ; ⎵みを⎵とうじ
#_0B9F2C: db $F9 ; new line
#_0B9F2D: db $34, $34, $2A, $27, $CF, $72, $8A, $B8 ; たたかう⎵ニンゲ
#_0B9F35: db $8A, $2A ; ンか
#_0B9F37: db $F9 ; new line
#_0B9F38: db $39, $52, $38, $CF, $2D, $39, $9F, $39 ; なんと⎵けなげな
#_0B9F40: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_B1:
#_0B9F41: db $D2, $C8, $B2 ; test progress bit C8 for message B2
#_0B9F44: db $D0, $BE ; set progress bit BE
#_0B9F46: db $D3, $B7 ; go to message B7

;===================================================================================================

; なに? [ITEM]が ほしいとな
; わかった わけは いわずともよい
; >[LEADER]は [ITEM]を
; «てにいれた»
Message_03_02_B2:
#_0B9F48: db $E1, $FA ; set $0A50 to item FA
#_0B9F4A: db $39, $3A, $95, $CF ; なに?⎵
#_0B9F4E: db $F3 ; write item name from $0A50
#_0B9F4F: db $9C, $CF, $42, $30, $26, $38, $39 ; が⎵ほしいとな
#_0B9F56: db $F9 ; new line
#_0B9F57: db $50, $2A, $58, $34, $CF, $50, $2D, $3E ; わかった⎵わけは
#_0B9F5F: db $CF, $26, $50, $A3, $38, $47, $4A, $26 ; ⎵いわずともよい
#_0B9F67: db $FC ; wait for key and new line
#_0B9F68: db $FE, $3C, $B3 ; ext command 3C: go to message B3 if no space for item
#_0B9F6B: db $FA ; clear message box
#_0B9F6C: db $97 ; >
#_0B9F6D: db $F1 ; write leader's name for team
#_0B9F6E: db $3E, $CF ; は⎵
#_0B9F70: db $F3 ; write item name from $0A50
#_0B9F71: db $51 ; を
#_0B9F72: db $F9 ; new line
#_0B9F73: db $F2, $2D ; prewritten text 2D
#_0B9F75: db $FC ; wait for key and new line
#_0B9F76: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0B9F78: db $D0, $BD ; set progress bit BD
#_0B9F7A: db $D3, $B9 ; go to message B9

;===================================================================================================

; «では もちものを へらしてこい»
Message_03_02_B3:
#_0B9F7C: db $FA ; clear message box
#_0B9F7D: db $F2, $79 ; prewritten text 79
#_0B9F7F: db $FC ; wait for key and new line
#_0B9F80: db $D3, $B9 ; go to message B9

;===================================================================================================

; おのれ こざかしき ニンゲンめ!
; わが ふくしゅうの きば うけてみよ!
Message_03_02_B4:
#_0B9F82: db $29, $3D, $4E, $CF, $2E, $A1, $2A, $30 ; おのれ⎵こざかし
#_0B9F8A: db $2B, $CF, $72, $8A, $B8, $8A, $46, $94 ; き⎵ニンゲンめ!
#_0B9F92: db $F9 ; new line
#_0B9F93: db $50, $9C, $CF, $40, $2C, $30, $56, $27 ; わが⎵ふくしゅう
#_0B9F9B: db $3D, $CF, $2B, $AB, $CF, $27, $2D, $37 ; の⎵きば⎵うけて
#_0B9FA3: db $44, $4A, $94 ; みよ!
#_0B9FA6: db $FC ; wait for key and new line
#_0B9FA7: db $D5, $39 ; send 39 to APU
#_0B9FA9: db $E5, $01, $B6 ; [COMMAND E5:01,B6]

;===================================================================================================

Message_03_02_B5:
#_0B9FAC: db $E5, $00, $B6 ; [COMMAND E5:00,B6]
#_0B9FAF: db $D3, $B5 ; go to message B5

;===================================================================================================

; [DEMON1]:
; たかが ニンゲンふぜいの ちから
; わが きばの するどさを
; うわまわるというのか
; そんな バカな«・・・»
Message_03_02_B6:
#_0B9FB1: db $F5 ; write demon name from $050A
#_0B9FB2: db $9A ; :
#_0B9FB3: db $F9 ; new line
#_0B9FB4: db $34, $2A, $9C, $CF, $72, $8A, $B8, $8A ; たかが⎵ニンゲン
#_0B9FBC: db $40, $A4, $26, $3D, $CF, $35, $2A, $4B ; ふぜいの⎵ちから
#_0B9FC4: db $F9 ; new line
#_0B9FC5: db $50, $9C, $CF, $2B, $AB, $3D, $CF, $31 ; わが⎵きばの⎵す
#_0B9FCD: db $4D, $AA, $2F, $51 ; るどさを
#_0B9FD1: db $F9 ; new line
#_0B9FD2: db $27, $50, $43, $50, $4D, $38, $26, $27 ; うわまわるという
#_0B9FDA: db $3D, $2A ; のか
#_0B9FDC: db $F9 ; new line
#_0B9FDD: db $33, $52, $39, $CF, $C4, $62, $39 ; そんな⎵バカな
#_0B9FE4: db $F2, $0B ; prewritten text 0B
#_0B9FE6: db $FC ; wait for key and new line
#_0B9FE7: db $D0, $BF ; set progress bit BF
#_0B9FE9: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0B9FEB: db $D3, $B9 ; go to message B9

;===================================================================================================

; かみの てさきに まどわされぬようにな
Message_03_02_B7:
#_0B9FED: db $2A, $44, $3D, $CF, $37, $2F, $2B, $3A ; かみの⎵てさきに
#_0B9FF5: db $CF, $43, $AA, $50, $2F, $4E, $3B, $4A ; ⎵まどわされぬよ
#_0B9FFD: db $27, $3A, $39 ; うにな
#_0BA000: db $FC ; wait for key and new line
#_0BA001: db $D3, $B9 ; go to message B9

;===================================================================================================

; >«だれもいない»
Message_03_02_B8:
#_0BA003: db $97 ; >
#_0BA004: db $F2, $2C ; prewritten text 2C
#_0BA006: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_B9:
#_0BA007: db $FE, $1A, $52, $BC, $14, $00, $00, $00 ; ext command 1A: 52,BC,14,00,00,00
#_0BA00F: db $FF ; end of message

;===================================================================================================

Message_03_02_BA:
#_0BA010: db $D2, $C7, $BB ; test progress bit C7 for message BB
#_0BA013: db $D2, $C0, $BF ; test progress bit C0 for message BF

;===================================================================================================

; «ルイ・サイファー»:
; ひさしぶりだな«・・・»
; こんなところで なにを しているのだ?
Message_03_02_BB:
#_0BA016: db $D6, $00, $2F, $70, $28 ; place sprite 2F in slot 00 at XY:{70,28}
#_0BA01B: db $F2, $6C ; prewritten text 6C
#_0BA01D: db $9A ; :
#_0BA01E: db $F9 ; new line
#_0BA01F: db $D2, $C7, $BE ; test progress bit C7 for message BE
#_0BA022: db $3F, $2F, $30, $AD, $4C, $A6, $39 ; ひさしぶりだな
#_0BA029: db $F2, $0B ; prewritten text 0B
#_0BA02B: db $F9 ; new line
#_0BA02C: db $2E, $52, $39, $38, $2E, $4F, $A9, $CF ; こんなところで⎵
#_0BA034: db $39, $3A, $51, $CF, $30, $37, $26, $4D ; なにを⎵している
#_0BA03C: db $3D, $A6, $95 ; のだ?
#_0BA03F: db $FC ; wait for key and new line
#_0BA040: db $FA ; clear message box
#_0BA041: db $FE, $04, $BC, $BD ; ext command 04: message BC if 11C >= 112; BD if >= 144

;===================================================================================================

; アスラおうを たおすつもりで いるのか?
; ニシの しまに いいものが ある
; それが てに はいらぬようでは
; アスラおうに かてるわけがないぞ
Message_03_02_BC:
#_0BA045: db $5D, $69, $83, $29, $27, $51, $CF, $34 ; アスラおうを⎵た
#_0BA04D: db $29, $31, $36, $47, $4C, $A9, $CF, $26 ; おすつもりで⎵い
#_0BA055: db $4D, $3D, $2A, $95 ; るのか?
#_0BA059: db $F9 ; new line
#_0BA05A: db $72, $68, $3D, $CF, $30, $43, $3A, $CF ; ニシの⎵しまに⎵
#_0BA062: db $26, $26, $47, $3D, $9C, $CF, $25, $4D ; いいものが⎵ある
#_0BA06A: db $F9 ; new line
#_0BA06B: db $33, $4E, $9C, $CF, $37, $3A, $CF, $3E ; それが⎵てに⎵は
#_0BA073: db $26, $4B, $3B, $4A, $27, $A9, $3E ; いらぬようでは
#_0BA07A: db $F9 ; new line
#_0BA07B: db $5D, $69, $83, $29, $27, $3A, $CF, $2A ; アスラおうに⎵か
#_0BA083: db $37, $4D, $50, $2D, $9C, $39, $26, $A5 ; てるわけがないぞ
#_0BA08B: db $FC ; wait for key and new line
#_0BA08C: db $D0, $C0 ; set progress bit C0
#_0BA08E: db $FF ; end of message

;===================================================================================================

; いいことを おしえてやろう
; ニシの しまに [CLASS] [DEMON1]が きている
; ナカマに なってもらえば こころづよかろう
Message_03_02_BD:
#_0BA08F: db $26, $26, $2E, $38, $51, $CF, $29, $30 ; いいことを⎵おし
#_0BA097: db $28, $37, $48, $4F, $27 ; えてやろう
#_0BA09C: db $F9 ; new line
#_0BA09D: db $DE, $00, $00, $BD, $01 ; load 1x demon 00BD
#_0BA0A2: db $72, $68, $3D, $CF, $30, $43, $3A, $CF ; ニシの⎵しまに⎵
#_0BA0AA: db $F6 ; write class name from $0506
#_0BA0AB: db $CF ; ⎵
#_0BA0AC: db $F5 ; write demon name from $050A
#_0BA0AD: db $9C, $CF, $2B, $37, $26, $4D ; が⎵きている
#_0BA0B3: db $F9 ; new line
#_0BA0B4: db $71, $62, $7B, $3A, $CF, $39, $58, $37 ; ナカマに⎵なって
#_0BA0BC: db $47, $4B, $28, $AB, $CF, $2E, $2E, $4F ; もらえば⎵こころ
#_0BA0C4: db $A8, $4A, $2A, $4F, $27 ; づよかろう
#_0BA0C9: db $FC ; wait for key and new line
#_0BA0CA: db $D0, $C0 ; set progress bit C0
#_0BA0CC: db $FF ; end of message

;===================================================================================================

; アスラおうを たおしたのか?
; まさか そこまでの ちからを もっていようとは
; だが じぶんが ほんとうに
; ただしいことを したと おもっているのか?
Message_03_02_BE:
#_0BA0CD: db $5D, $69, $83, $29, $27, $51, $CF, $34 ; アスラおうを⎵た
#_0BA0D5: db $29, $30, $34, $3D, $2A, $95 ; おしたのか?
#_0BA0DB: db $F9 ; new line
#_0BA0DC: db $43, $2F, $2A, $CF, $33, $2E, $43, $A9 ; まさか⎵そこまで
#_0BA0E4: db $3D, $CF, $35, $2A, $4B, $51, $CF, $47 ; の⎵ちからを⎵も
#_0BA0EC: db $58, $37, $26, $4A, $27, $38, $3E ; っていようとは
#_0BA0F3: db $FC ; wait for key and new line
#_0BA0F4: db $A6, $9C, $CF, $A2, $AD, $52, $9C, $CF ; だが⎵じぶんが⎵
#_0BA0FC: db $42, $52, $38, $27, $3A ; ほんとうに
#_0BA101: db $F9 ; new line
#_0BA102: db $34, $A6, $30, $26, $2E, $38, $51, $CF ; ただしいことを⎵
#_0BA10A: db $30, $34, $38, $CF, $29, $47, $58, $37 ; したと⎵おもって
#_0BA112: db $26, $4D, $3D, $2A, $95 ; いるのか?
#_0BA117: db $FC ; wait for key and new line
#_0BA118: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA11B: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_02_BF:
#_0BA11C: db $97 ; >
#_0BA11D: db $F2, $2C ; prewritten text 2C
#_0BA11F: db $FC ; wait for key and new line
#_0BA120: db $FF ; end of message

;===================================================================================================

Message_03_02_C0:
#_0BA121: db $D5, $46 ; send 46 to APU
#_0BA123: db $D2, $0C, $D6 ; test progress bit 0C for message D6
#_0BA126: db $FE, $04, $C1, $C2 ; ext command 04: message C1 if 11C >= 112; C2 if >= 144
#_0BA12A: db $D3, $C2 ; go to message C2

;===================================================================================================

Message_03_02_C1:
#_0BA12C: db $D2, $B5, $C2 ; test progress bit B5 for message C2
#_0BA12F: db $D3, $D5 ; go to message D5

;===================================================================================================

Message_03_02_C2:
#_0BA131: db $D2, $C5, $D2 ; test progress bit C5 for message D2
#_0BA134: db $D2, $C4, $D1 ; test progress bit C4 for message D1
#_0BA137: db $D2, $C1, $D1 ; test progress bit C1 for message D1

;===================================================================================================

; «カオスヒーロー»:
Message_03_02_C3:
#_0BA13A: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0BA13F: db $E4, $00 ; load demon $00
#_0BA141: db $F2, $67 ; prewritten text 67
#_0BA143: db $9A ; :
#_0BA144: db $F9 ; new line
#_0BA145: db $D2, $67, $D8 ; test progress bit 67 for message D8
#_0BA148: db $FE, $04, $C4, $C8 ; ext command 04: message C4 if 11C >= 112; C8 if >= 144

;===================================================================================================

; みろ! おれの あしもとに たおれた
; [JIMMY]の すがたを!
; ちからなき せいぎの みじめな さいごだ
; まるで むかしの おれみたいだぜ«・・・»
; せいぎは ちからを うみださない
; ちからこそ せいぎだ!!
Message_03_02_C4:
#_0BA14C: db $D6, $01, $7F, $58, $58 ; place sprite 7F in slot 01 at XY:{58,58}
#_0BA151: db $44, $4F, $94, $CF, $29, $4E, $3D, $CF ; みろ!⎵おれの⎵
#_0BA159: db $25, $30, $47, $38, $3A, $CF, $34, $29 ; あしもとに⎵たお
#_0BA161: db $4E, $34 ; れた
#_0BA163: db $F9 ; new line
#_0BA164: db $EE ; write lawful hero name
#_0BA165: db $3D, $CF, $31, $9C, $34, $51, $94 ; の⎵すがたを!
#_0BA16C: db $F9 ; new line
#_0BA16D: db $35, $2A, $4B, $39, $2B, $CF, $32, $26 ; ちからなき⎵せい
#_0BA175: db $9D, $3D, $CF, $44, $A2, $46, $39, $CF ; ぎの⎵みじめな⎵
#_0BA17D: db $2F, $26, $A0, $A6 ; さいごだ
#_0BA181: db $F9 ; new line
#_0BA182: db $43, $4D, $A9, $CF, $45, $2A, $30, $3D ; まるで⎵むかしの
#_0BA18A: db $CF, $29, $4E, $44, $34, $26, $A6, $A4 ; ⎵おれみたいだぜ
#_0BA192: db $F2, $0B ; prewritten text 0B
#_0BA194: db $FC ; wait for key and new line
#_0BA195: db $FA ; clear message box
#_0BA196: db $32, $26, $9D, $3E, $CF, $35, $2A, $4B ; せいぎは⎵ちから
#_0BA19E: db $51, $CF, $27, $44, $A6, $2F, $39, $26 ; を⎵うみださない
#_0BA1A6: db $F9 ; new line
#_0BA1A7: db $35, $2A, $4B, $2E, $33, $CF, $32, $26 ; ちからこそ⎵せい
#_0BA1AF: db $9D, $A6, $94, $94 ; ぎだ!!
#_0BA1B3: db $FC ; wait for key and new line
#_0BA1B4: db $D0, $B2 ; set progress bit B2
#_0BA1B6: db $FE, $45, $01, $01 ; ext command 45: something 01, 01 TODO
#_0BA1BA: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA1BD: db $D6, $01, $00 ; delete sprite in slot 01
#_0BA1C0: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames

;===================================================================================================

; いくぞ! [CHASE]!
Message_03_02_C5:
#_0BA1C3: db $FA ; clear message box
#_0BA1C4: db $26, $2C, $A5, $94, $CF ; いくぞ!⎵
#_0BA1C9: db $F0 ; write player name
#_0BA1CA: db $94 ; !
#_0BA1CB: db $FC ; wait for key and new line
#_0BA1CC: db $D5, $39 ; send 39 to APU
#_0BA1CE: db $E5, $01, $C7 ; [COMMAND E5:01,C7]

;===================================================================================================

Message_03_02_C6:
#_0BA1D1: db $E5, $00, $C7 ; [COMMAND E5:00,C7]
#_0BA1D4: db $D3, $C6 ; go to message C6

;===================================================================================================

; «カオスヒーロー»:
; «・・・»おれにも さいごが きたか«・・・»
; [CHASE]には けっきょく かてなかった
; おれは かみをもしのぐ ちからを えたはず
; «・・・»これは ゆめ«・・・»だったのか«・・・»
; わるい ゆめ«・・・»いや«・・・»
; いい ゆめ«・・・»だった«・・・»
; «カオスヒロイン»:
; [HIM]を たおしたわね
; あなたは ともだちを ころして へいきなの!?
Message_03_02_C7:
#_0BA1D6: db $F2, $67 ; prewritten text 67
#_0BA1D8: db $9A ; :
#_0BA1D9: db $F9 ; new line
#_0BA1DA: db $F2, $0B ; prewritten text 0B
#_0BA1DC: db $29, $4E, $3A, $47, $CF, $2F, $26, $A0 ; おれにも⎵さいご
#_0BA1E4: db $9C, $CF, $2B, $34, $2A ; が⎵きたか
#_0BA1E9: db $F2, $0B ; prewritten text 0B
#_0BA1EB: db $F9 ; new line
#_0BA1EC: db $F0 ; write player name
#_0BA1ED: db $3A, $3E, $CF, $2D, $58, $2B, $57, $2C ; には⎵けっきょく
#_0BA1F5: db $CF, $2A, $37, $39, $2A, $58, $34 ; ⎵かてなかった
#_0BA1FC: db $F9 ; new line
#_0BA1FD: db $29, $4E, $3E, $CF, $2A, $44, $51, $47 ; おれは⎵かみをも
#_0BA205: db $30, $3D, $9E, $CF, $35, $2A, $4B, $51 ; しのぐ⎵ちからを
#_0BA20D: db $CF, $28, $34, $3E, $A3 ; ⎵えたはず
#_0BA212: db $F9 ; new line
#_0BA213: db $F2, $0B ; prewritten text 0B
#_0BA215: db $2E, $4E, $3E, $CF, $49, $46 ; これは⎵ゆめ
#_0BA21B: db $F2, $0B ; prewritten text 0B
#_0BA21D: db $A6, $58, $34, $3D, $2A ; だったのか
#_0BA222: db $F2, $0B ; prewritten text 0B
#_0BA224: db $F9 ; new line
#_0BA225: db $50, $4D, $26, $CF, $49, $46 ; わるい⎵ゆめ
#_0BA22B: db $F2, $0B ; prewritten text 0B
#_0BA22D: db $26, $48 ; いや
#_0BA22F: db $F2, $0B ; prewritten text 0B
#_0BA231: db $F9 ; new line
#_0BA232: db $26, $26, $CF, $49, $46 ; いい⎵ゆめ
#_0BA237: db $F2, $0B ; prewritten text 0B
#_0BA239: db $A6, $58, $34 ; だった
#_0BA23C: db $F2, $0B ; prewritten text 0B
#_0BA23E: db $FC ; wait for key and new line
#_0BA23F: db $D0, $C1 ; set progress bit C1
#_0BA241: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA243: db $D4, $03 ; set text box size to 3
#_0BA245: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA248: db $D6, $00, $B3, $70, $28 ; place sprite B3 in slot 00 at XY:{70,28}
#_0BA24D: db $F2, $6A ; prewritten text 6A
#_0BA24F: db $9A ; :
#_0BA250: db $F9 ; new line
#_0BA251: db $EF ; write chaos hero name
#_0BA252: db $51, $CF, $34, $29, $30, $34, $50, $3C ; を⎵たおしたわね
#_0BA25A: db $F9 ; new line
#_0BA25B: db $25, $39, $34, $3E, $CF, $38, $47, $A6 ; あなたは⎵ともだ
#_0BA263: db $35, $51, $CF, $2E, $4F, $30, $37, $CF ; ちを⎵ころして⎵
#_0BA26B: db $41, $26, $2B, $39, $3D, $94, $95 ; へいきなの!?
#_0BA272: db $FC ; wait for key and new line
#_0BA273: db $FA ; clear message box
#_0BA274: db $D3, $C9 ; go to message C9

;===================================================================================================

; [CHASE] よく ここまできた
; この さきに アスラおうが いる
; ところで りえが
; おまえに はなしが あるそうだ
; «カオスヒロイン»:
; «・・・»[CHASE]さん«・・・»
Message_03_02_C8:
#_0BA276: db $F0 ; write player name
#_0BA277: db $CF, $4A, $2C, $CF, $2E, $2E, $43, $A9 ; ⎵よく⎵ここまで
#_0BA27F: db $2B, $34 ; きた
#_0BA281: db $F9 ; new line
#_0BA282: db $2E, $3D, $CF, $2F, $2B, $3A, $CF, $5D ; この⎵さきに⎵ア
#_0BA28A: db $69, $83, $29, $27, $9C, $CF, $26, $4D ; スラおうが⎵いる
#_0BA292: db $F9 ; new line
#_0BA293: db $38, $2E, $4F, $A9, $CF, $4C, $28, $9C ; ところで⎵りえが
#_0BA29B: db $F9 ; new line
#_0BA29C: db $29, $43, $28, $3A, $CF, $3E, $39, $30 ; おまえに⎵はなし
#_0BA2A4: db $9C, $CF, $25, $4D, $33, $27, $A6 ; が⎵あるそうだ
#_0BA2AB: db $FC ; wait for key and new line
#_0BA2AC: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA2AE: db $D4, $03 ; set text box size to 3
#_0BA2B0: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA2B3: db $D6, $00, $B3, $70, $28 ; place sprite B3 in slot 00 at XY:{70,28}
#_0BA2B8: db $F2, $6A ; prewritten text 6A
#_0BA2BA: db $9A ; :
#_0BA2BB: db $F9 ; new line
#_0BA2BC: db $F2, $0B ; prewritten text 0B
#_0BA2BE: db $F0 ; write player name
#_0BA2BF: db $2F, $52 ; さん
#_0BA2C1: db $F2, $0B ; prewritten text 0B
#_0BA2C3: db $F9 ; new line

;===================================================================================================

; わたし リリスよ
Message_03_02_C9:
#_0BA2C4: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BA2C7: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BA2CA: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA2CD: db $D6, $00, $9D, $78, $40 ; place sprite 9D in slot 00 at XY:{78,40}
#_0BA2D2: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BA2D5: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA2D8: db $DE, $01, $00, $1D, $01 ; load 1x demon 011D
#_0BA2DD: db $E4, $00 ; load demon $00
#_0BA2DF: db $50, $34, $30, $CF, $84, $84, $69, $4A ; わたし⎵リリスよ
#_0BA2E7: db $FC ; wait for key and new line
#_0BA2E8: db $D2, $C1, $CD ; test progress bit C1 for message CD
#_0BA2EB: db $FA ; clear message box

;===================================================================================================

; [DEMON1]:
; ほんとうは あなたと わたしが
; あたらしい アダムと イヴに なるはずだったのよ
; でも わたしは あなたから
; とおざけられて しまった
; だから わたしは あなたの«・・・»
; だいじな ひとを«・・・»うばおうと«・・・»
; «・・・»でも だめだった«・・・»
; ごめんなさい
; もう にどと あなたの まえには
; あらわれないわ
; さよなら [CHASE]«・・・»«・・・»
Message_03_02_CA:
#_0BA2EC: db $F5 ; write demon name from $050A
#_0BA2ED: db $9A ; :
#_0BA2EE: db $F9 ; new line
#_0BA2EF: db $42, $52, $38, $27, $3E, $CF, $25, $39 ; ほんとうは⎵あな
#_0BA2F7: db $34, $38, $CF, $50, $34, $30, $9C ; たと⎵わたしが
#_0BA2FE: db $F9 ; new line
#_0BA2FF: db $25, $34, $4B, $30, $26, $CF, $5D, $BF ; あたらしい⎵アダ
#_0BA307: db $7D, $38, $CF, $5E, $CE, $3A, $CF, $39 ; ムと⎵イヴに⎵な
#_0BA30F: db $4D, $3E, $A3, $A6, $58, $34, $3D, $4A ; るはずだったのよ
#_0BA317: db $F9 ; new line
#_0BA318: db $A9, $47, $CF, $50, $34, $30, $3E, $CF ; でも⎵わたしは⎵
#_0BA320: db $25, $39, $34, $2A, $4B ; あなたから
#_0BA325: db $F9 ; new line
#_0BA326: db $38, $29, $A1, $2D, $4B, $4E, $37, $CF ; とおざけられて⎵
#_0BA32E: db $30, $43, $58, $34 ; しまった
#_0BA332: db $FC ; wait for key and new line
#_0BA333: db $FA ; clear message box
#_0BA334: db $A6, $2A, $4B, $CF, $50, $34, $30, $3E ; だから⎵わたしは
#_0BA33C: db $CF, $25, $39, $34, $3D ; ⎵あなたの
#_0BA341: db $F2, $0B ; prewritten text 0B
#_0BA343: db $F9 ; new line
#_0BA344: db $A6, $26, $A2, $39, $CF, $3F, $38, $51 ; だいじな⎵ひとを
#_0BA34C: db $F2, $0B ; prewritten text 0B
#_0BA34E: db $27, $AB, $29, $27, $38 ; うばおうと
#_0BA353: db $F2, $0B ; prewritten text 0B
#_0BA355: db $F9 ; new line
#_0BA356: db $F2, $0B ; prewritten text 0B
#_0BA358: db $A9, $47, $CF, $A6, $46, $A6, $58, $34 ; でも⎵だめだった
#_0BA360: db $F2, $0B ; prewritten text 0B
#_0BA362: db $FC ; wait for key and new line
#_0BA363: db $D2, $C2, $CB ; test progress bit C2 for message CB
#_0BA366: db $FA ; clear message box
#_0BA367: db $A0, $46, $52, $39, $2F, $26 ; ごめんなさい
#_0BA36D: db $F9 ; new line
#_0BA36E: db $47, $27, $CF, $3A, $AA, $38, $CF, $25 ; もう⎵にどと⎵あ
#_0BA376: db $39, $34, $3D, $CF, $43, $28, $3A, $3E ; なたの⎵まえには
#_0BA37E: db $F9 ; new line
#_0BA37F: db $25, $4B, $50, $4E, $39, $26, $50 ; あらわれないわ
#_0BA386: db $F9 ; new line
#_0BA387: db $2F, $4A, $39, $4B, $CF ; さよなら⎵
#_0BA38C: db $F0 ; write player name
#_0BA38D: db $F2, $0B ; prewritten text 0B
#_0BA38F: db $F2, $0B ; prewritten text 0B
#_0BA391: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]は [ITEM]を
; のこしていった
Message_03_02_CB:
#_0BA392: db $E1, $FC ; set $0A50 to item FC
#_0BA394: db $FE, $3C, $CC ; ext command 3C: go to message CC if no space for item
#_0BA397: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BA399: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA39B: db $D4, $03 ; set text box size to 3
#_0BA39D: db $97 ; >
#_0BA39E: db $F5 ; write demon name from $050A
#_0BA39F: db $3E, $CF ; は⎵
#_0BA3A1: db $F3 ; write item name from $0A50
#_0BA3A2: db $51 ; を
#_0BA3A3: db $F9 ; new line
#_0BA3A4: db $3D, $2E, $30, $37, $26, $58, $34 ; のこしていった
#_0BA3AB: db $FC ; wait for key and new line

;===================================================================================================

; «カオスヒーロー»:
; やつは リリスだったのか«・・・»
; また あの おんなに だまされたぜ
; くそっ じゃあ おれは [CHASE]の
; アテうま だったのか?
; なんか はらが たってきたな
; まあいい
; アスラおうが おまえに あいたがっている
; はやくいけ
; おれか? すこし ひとりに させてくれ
; じゃあな
Message_03_02_CC:
#_0BA3AC: db $D2, $C2, $D0 ; test progress bit C2 for message D0
#_0BA3AF: db $D0, $C3 ; set progress bit C3
#_0BA3B1: db $FA ; clear message box
#_0BA3B2: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0BA3B7: db $E4, $00 ; load demon $00
#_0BA3B9: db $F2, $67 ; prewritten text 67
#_0BA3BB: db $9A ; :
#_0BA3BC: db $F9 ; new line
#_0BA3BD: db $48, $36, $3E, $CF, $84, $84, $69, $A6 ; やつは⎵リリスだ
#_0BA3C5: db $58, $34, $3D, $2A ; ったのか
#_0BA3C9: db $F2, $0B ; prewritten text 0B
#_0BA3CB: db $F9 ; new line
#_0BA3CC: db $43, $34, $CF, $25, $3D, $CF, $29, $52 ; また⎵あの⎵おん
#_0BA3D4: db $39, $3A, $CF, $A6, $43, $2F, $4E, $34 ; なに⎵だまされた
#_0BA3DC: db $A4 ; ぜ
#_0BA3DD: db $FC ; wait for key and new line
#_0BA3DE: db $FA ; clear message box
#_0BA3DF: db $2C, $33, $58, $CF, $A2, $55, $25, $CF ; くそっ⎵じゃあ⎵
#_0BA3E7: db $29, $4E, $3E, $CF ; おれは⎵
#_0BA3EB: db $F0 ; write player name
#_0BA3EC: db $3D ; の
#_0BA3ED: db $F9 ; new line
#_0BA3EE: db $5D, $6F, $27, $43, $CF, $A6, $58, $34 ; アテうま⎵だった
#_0BA3F6: db $3D, $2A, $95 ; のか?
#_0BA3F9: db $F9 ; new line
#_0BA3FA: db $39, $52, $2A, $CF, $3E, $4B, $9C, $CF ; なんか⎵はらが⎵
#_0BA402: db $34, $58, $37, $2B, $34, $39 ; たってきたな
#_0BA408: db $FC ; wait for key and new line
#_0BA409: db $FA ; clear message box
#_0BA40A: db $43, $25, $26, $26 ; まあいい
#_0BA40E: db $F9 ; new line
#_0BA40F: db $5D, $69, $83, $29, $27, $9C, $CF, $29 ; アスラおうが⎵お
#_0BA417: db $43, $28, $3A, $CF, $25, $26, $34, $9C ; まえに⎵あいたが
#_0BA41F: db $58, $37, $26, $4D ; っている
#_0BA423: db $F9 ; new line
#_0BA424: db $3E, $48, $2C, $26, $2D ; はやくいけ
#_0BA429: db $FC ; wait for key and new line
#_0BA42A: db $FA ; clear message box
#_0BA42B: db $29, $4E, $2A, $95 ; おれか?
#_0BA42F: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BA432: db $CF, $31, $2E, $30, $CF, $3F, $38, $4C ; ⎵すこし⎵ひとり
#_0BA43A: db $3A, $CF, $2F, $32, $37, $2C, $4E ; に⎵させてくれ
#_0BA441: db $F9 ; new line
#_0BA442: db $A2, $55, $25, $39 ; じゃあな
#_0BA446: db $FC ; wait for key and new line
#_0BA447: db $D0, $C4 ; set progress bit C4
#_0BA449: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA44B: db $D6, $03, $6F, $60, $28 ; place sprite 6F in slot 03 at XY:{60,28}
#_0BA450: db $D3, $D4 ; go to message D4

;===================================================================================================

Message_03_02_CD:
#_0BA452: db $D5, $39 ; send 39 to APU
#_0BA454: db $E5, $01, $CF ; [COMMAND E5:01,CF]

;===================================================================================================

Message_03_02_CE:
#_0BA457: db $E5, $00, $CF ; [COMMAND E5:00,CF]
#_0BA45A: db $D3, $CE ; go to message CE

;===================================================================================================

Message_03_02_CF:
#_0BA45C: db $D0, $C2 ; set progress bit C2
#_0BA45E: db $D3, $CA ; go to message CA

;===================================================================================================

Message_03_02_D0:
#_0BA460: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA462: db $D0, $C4 ; set progress bit C4

;===================================================================================================

Message_03_02_D1:
#_0BA464: db $DD, $F1, $D5 ; go to message D5 if missing item F1
#_0BA467: db $FA ; clear message box

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_D2:
#_0BA468: db $D6, $03, $6F, $60, $28 ; place sprite 6F in slot 03 at XY:{60,28}
#_0BA46D: db $97 ; >
#_0BA46E: db $F2, $68 ; prewritten text 68
#_0BA470: db $F8, $D3 ; YES/NO - go to message D3 if YES
#_0BA472: db $FF ; end of message

;===================================================================================================

; >[ITEM]が かがやきだした
; [ITEM]の ひかりを あびて
; とびらが ひらいた
Message_03_02_D3:
#_0BA473: db $D2, $C5, $D4 ; test progress bit C5 for message D4
#_0BA476: db $E1, $F1 ; set $0A50 to item F1
#_0BA478: db $D4, $03 ; set text box size to 3
#_0BA47A: db $97 ; >
#_0BA47B: db $F3 ; write item name from $0A50
#_0BA47C: db $9C, $CF, $2A, $9C, $48, $2B, $A6, $30 ; が⎵かがやきだし
#_0BA484: db $34 ; た
#_0BA485: db $FC ; wait for key and new line
#_0BA486: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BA489: db $FA ; clear message box
#_0BA48A: db $F3 ; write item name from $0A50
#_0BA48B: db $3D, $CF, $3F, $2A, $4C, $51, $CF, $25 ; の⎵ひかりを⎵あ
#_0BA493: db $AC, $37 ; びて
#_0BA495: db $F9 ; new line
#_0BA496: db $38, $AC, $4B, $9C, $CF, $3F, $4B, $26 ; とびらが⎵ひらい
#_0BA49E: db $34 ; た
#_0BA49F: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_D4:
#_0BA4A0: db $D0, $C5 ; set progress bit C5
#_0BA4A2: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA4A5: db $D6, $03, $78, $60, $28 ; place sprite 78 in slot 03 at XY:{60,28}
#_0BA4AA: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BA4AD: db $D6, $03, $00 ; delete sprite in slot 03
#_0BA4B0: db $D2, $0C, $D7 ; test progress bit 0C for message D7
#_0BA4B3: db $FE, $1A, $7B, $66, $14, $00, $00, $00 ; ext command 1A: 7B,66,14,00,00,00
#_0BA4BB: db $D0, $0C ; set progress bit 0C
#_0BA4BD: db $FF ; end of message

;===================================================================================================

; >«とびらは とざされている»
Message_03_02_D5:
#_0BA4BE: db $D2, $67, $D9 ; test progress bit 67 for message D9
#_0BA4C1: db $FA ; clear message box
#_0BA4C2: db $D6, $03, $6F, $60, $28 ; place sprite 6F in slot 03 at XY:{60,28}
#_0BA4C7: db $97 ; >
#_0BA4C8: db $F2, $69 ; prewritten text 69
#_0BA4CA: db $FC ; wait for key and new line
#_0BA4CB: db $FF ; end of message

;===================================================================================================

; >«そとに でますか?»
Message_03_02_D6:
#_0BA4CC: db $D6, $03, $6F, $60, $28 ; place sprite 6F in slot 03 at XY:{60,28}
#_0BA4D1: db $97 ; >
#_0BA4D2: db $F2, $89 ; prewritten text 89
#_0BA4D4: db $F8, $D4 ; YES/NO - go to message D4 if YES
#_0BA4D6: db $FF ; end of message

;===================================================================================================

Message_03_02_D7:
#_0BA4D7: db $FE, $1A, $79, $E6, $14, $00, $00, $00 ; ext command 1A: 79,E6,14,00,00,00
#_0BA4DF: db $D1, $0C ; clear progress bit 0C
#_0BA4E1: db $FF ; end of message

;===================================================================================================

; おまえが いつ かいしんするのか
; ずっと まっていたが それも むだだったな
; ちょうわ バランス なんてものは
; いつか くずれるために あるのだ!
Message_03_02_D8:
#_0BA4E2: db $29, $43, $28, $9C, $CF, $26, $36, $CF ; おまえが⎵いつ⎵
#_0BA4EA: db $2A, $26, $30, $52, $31, $4D, $3D, $2A ; かいしんするのか
#_0BA4F2: db $F9 ; new line
#_0BA4F3: db $A3, $58, $38, $CF, $43, $58, $37, $26 ; ずっと⎵まってい
#_0BA4FB: db $34, $9C, $CF, $33, $4E, $47, $CF, $45 ; たが⎵それも⎵む
#_0BA503: db $A6, $A6, $58, $34, $39 ; だだったな
#_0BA508: db $F9 ; new line
#_0BA509: db $35, $57, $27, $50, $CF, $C4, $83, $8A ; ちょうわ⎵バラン
#_0BA511: db $69, $CF, $39, $52, $37, $47, $3D, $3E ; ス⎵なんてものは
#_0BA519: db $F9 ; new line
#_0BA51A: db $26, $36, $2A, $CF, $2C, $A3, $4E, $4D ; いつか⎵くずれる
#_0BA522: db $34, $46, $3A, $CF, $25, $4D, $3D, $A6 ; ために⎵あるのだ
#_0BA52A: db $94 ; !
#_0BA52B: db $FC ; wait for key and new line
#_0BA52C: db $D3, $C5 ; go to message C5

;===================================================================================================

; ろうじん:
; よくぞ ここまで きたな
; このさきには アクマぐんだんの そうすい
; テンマ アスラおうが おる
; おまえの たたかいも まもなく おわろう«・・・»
Message_03_02_D9:
#_0BA52E: db $FA ; clear message box
#_0BA52F: db $D2, $87, $DA ; test progress bit 87 for message DA
#_0BA532: db $D6, $00, $59, $70, $38 ; place sprite 59 in slot 00 at XY:{70,38}
#_0BA537: db $FE, $45, $00, $01 ; ext command 45: something 00, 01 TODO
#_0BA53B: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA53E: db $D6, $00, $59, $70, $38 ; place sprite 59 in slot 00 at XY:{70,38}
#_0BA543: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0BA548: db $F9 ; new line
#_0BA549: db $4A, $2C, $A5, $CF, $2E, $2E, $43, $A9 ; よくぞ⎵ここまで
#_0BA551: db $CF, $2B, $34, $39 ; ⎵きたな
#_0BA555: db $F9 ; new line
#_0BA556: db $2E, $3D, $2F, $2B, $3A, $3E, $CF, $5D ; このさきには⎵ア
#_0BA55E: db $64, $7B, $9E, $52, $A6, $52, $3D, $CF ; クマぐんだんの⎵
#_0BA566: db $33, $27, $31, $26 ; そうすい
#_0BA56A: db $F9 ; new line
#_0BA56B: db $6F, $8A, $7B, $CF, $5D, $69, $83, $29 ; テンマ⎵アスラお
#_0BA573: db $27, $9C, $CF, $29, $4D ; うが⎵おる
#_0BA578: db $FC ; wait for key and new line
#_0BA579: db $FA ; clear message box
#_0BA57A: db $29, $43, $28, $3D, $CF, $34, $34, $2A ; おまえの⎵たたか
#_0BA582: db $26, $47, $CF, $43, $47, $39, $2C, $CF ; いも⎵まもなく⎵
#_0BA58A: db $29, $50, $4F, $27 ; おわろう
#_0BA58E: db $F2, $0B ; prewritten text 0B
#_0BA590: db $FC ; wait for key and new line
#_0BA591: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BA594: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BA597: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA59A: db $D6, $00, $9D, $78, $40 ; place sprite 9D in slot 00 at XY:{78,40}
#_0BA59F: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames

;===================================================================================================

; «タイジョウロウクン»:
; さあ ゆくがよい
Message_03_02_DA:
#_0BA5A2: db $D6, $00, $66, $70, $28 ; place sprite 66 in slot 00 at XY:{70,28}
#_0BA5A7: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BA5AA: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BA5AD: db $D6, $00, $66, $70, $28 ; place sprite 66 in slot 00 at XY:{70,28}
#_0BA5B2: db $D0, $87 ; set progress bit 87
#_0BA5B4: db $FA ; clear message box
#_0BA5B5: db $F2, $8A ; prewritten text 8A
#_0BA5B7: db $9A ; :
#_0BA5B8: db $F9 ; new line
#_0BA5B9: db $2F, $25, $CF, $49, $2C, $9C, $4A, $26 ; さあ⎵ゆくがよい
#_0BA5C1: db $FC ; wait for key and new line
#_0BA5C2: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BA5C5: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BA5C8: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA5CB: db $FA ; clear message box
#_0BA5CC: db $D0, $C5 ; set progress bit C5
#_0BA5CE: db $D3, $D2 ; go to message D2

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_DB:
#_0BA5D0: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0BA5D5: db $97 ; >
#_0BA5D6: db $F2, $68 ; prewritten text 68
#_0BA5D8: db $F8, $DC ; YES/NO - go to message DC if YES
#_0BA5DA: db $FF ; end of message

;===================================================================================================

Message_03_02_DC:
#_0BA5DB: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0BA5E0: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BA5E3: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA5E6: db $FE, $1A, $29, $B7, $14, $00, $00, $00 ; ext command 1A: 29,B7,14,00,00,00

;===================================================================================================

; [DEMON1]:
Message_03_02_DD:
#_0BA5EE: db $D5, $46 ; send 46 to APU
#_0BA5F0: db $D7, $3B ; load scene 3B
#_0BA5F2: db $D4, $03 ; set text box size to 3
#_0BA5F4: db $D2, $C7, $E7 ; test progress bit C7 for message E7
#_0BA5F7: db $D2, $B4, $E7 ; test progress bit B4 for message E7
#_0BA5FA: db $DE, $01, $00, $20, $01 ; load 1x demon 0120
#_0BA5FF: db $E4, $00 ; load demon $00
#_0BA601: db $F5 ; write demon name from $050A
#_0BA602: db $9A ; :
#_0BA603: db $F9 ; new line
#_0BA604: db $FE, $04, $DE, $E3 ; ext command 04: message DE if 11C >= 112; E3 if >= 144

;===================================================================================================

; ハーッ «ハッハッハッハッ»
; ついに やってきたか
; かみのため たたかう いだいなる ゆうしゃさまよ
; かつての とも [HIM]の しかばねを
; ふみつけて きただけあって いいつらがまえだな
; この わたしが ともの もとへ
; おくってやろう!
Message_03_02_DE:
#_0BA608: db $76, $5A, $92, $CF ; ハーッ⎵
#_0BA60C: db $F2, $6B ; prewritten text 6B
#_0BA60E: db $F9 ; new line
#_0BA60F: db $36, $26, $3A, $CF, $48, $58, $37, $2B ; ついに⎵やってき
#_0BA617: db $34, $2A ; たか
#_0BA619: db $F9 ; new line
#_0BA61A: db $2A, $44, $3D, $34, $46, $CF, $34, $34 ; かみのため⎵たた
#_0BA622: db $2A, $27, $CF, $26, $A6, $26, $39, $4D ; かう⎵いだいなる
#_0BA62A: db $CF, $49, $27, $30, $55, $2F, $43, $4A ; ⎵ゆうしゃさまよ
#_0BA632: db $F9 ; new line
#_0BA633: db $2A, $36, $37, $3D, $CF, $38, $47, $CF ; かつての⎵とも⎵
#_0BA63B: db $EF ; write chaos hero name
#_0BA63C: db $3D, $CF, $30, $2A, $AB, $3C, $51 ; の⎵しかばねを
#_0BA643: db $F9 ; new line
#_0BA644: db $40, $44, $36, $2D, $37, $CF, $2B, $34 ; ふみつけて⎵きた
#_0BA64C: db $A6, $2D, $25, $58, $37, $CF, $26, $26 ; だけあって⎵いい
#_0BA654: db $36, $4B, $9C, $43, $28, $A6, $39 ; つらがまえだな
#_0BA65B: db $FC ; wait for key and new line
#_0BA65C: db $FA ; clear message box
#_0BA65D: db $2E, $3D, $CF, $50, $34, $30, $9C, $CF ; この⎵わたしが⎵
#_0BA665: db $38, $47, $3D, $CF, $47, $38, $41 ; ともの⎵もとへ
#_0BA66C: db $F9 ; new line
#_0BA66D: db $29, $2C, $58, $37, $48, $4F, $27, $94 ; おくってやろう!
#_0BA675: db $FC ; wait for key and new line
#_0BA676: db $D5, $39 ; send 39 to APU
#_0BA678: db $E5, $01, $E0 ; [COMMAND E5:01,E0]

;===================================================================================================

Message_03_02_DF:
#_0BA67B: db $E5, $00, $E0 ; [COMMAND E5:00,E0]
#_0BA67E: db $D3, $DF ; go to message DF

;===================================================================================================

; [DEMON1]:
; «・・・»もう すこし«・・・»あと ひといきで
; かみの «せんねんおうこく»を
; たたきつぶせたものを«・・・»
; «カテドラル»を わがてに おさめ«・・・»
; ダイマオウ «ルシファーさま»にも
; いちもく おかせ«・・・»
; こえ:
; よくやったな«・・・»
Message_03_02_E0:
#_0BA680: db $F5 ; write demon name from $050A
#_0BA681: db $9A ; :
#_0BA682: db $F9 ; new line
#_0BA683: db $F2, $0B ; prewritten text 0B
#_0BA685: db $47, $27, $CF, $31, $2E, $30 ; もう⎵すこし
#_0BA68B: db $F2, $0B ; prewritten text 0B
#_0BA68D: db $25, $38, $CF, $3F, $38, $26, $2B, $A9 ; あと⎵ひといきで
#_0BA695: db $F9 ; new line
#_0BA696: db $2A, $44, $3D, $CF ; かみの⎵
#_0BA69A: db $F2, $21 ; prewritten text 21
#_0BA69C: db $51 ; を
#_0BA69D: db $F9 ; new line
#_0BA69E: db $34, $34, $2B, $36, $AD, $32, $34, $47 ; たたきつぶせたも
#_0BA6A6: db $3D, $51 ; のを
#_0BA6A8: db $F2, $0B ; prewritten text 0B
#_0BA6AA: db $F9 ; new line
#_0BA6AB: db $F2, $5C ; prewritten text 5C
#_0BA6AD: db $51, $CF, $50, $9C, $37, $3A, $CF, $29 ; を⎵わがてに⎵お
#_0BA6B5: db $2F, $46 ; さめ
#_0BA6B7: db $F2, $0B ; prewritten text 0B
#_0BA6B9: db $F9 ; new line
#_0BA6BA: db $BF, $5E, $7B, $61, $5F, $CF ; ダイマオウ⎵
#_0BA6C0: db $F2, $23 ; prewritten text 23
#_0BA6C2: db $3A, $47 ; にも
#_0BA6C4: db $F9 ; new line
#_0BA6C5: db $26, $35, $47, $2C, $CF, $29, $2A, $32 ; いちもく⎵おかせ
#_0BA6CD: db $F2, $0B ; prewritten text 0B
#_0BA6CF: db $FC ; wait for key and new line
#_0BA6D0: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BA6D2: db $D0, $C7 ; set progress bit C7
#_0BA6D4: db $D4, $03 ; set text box size to 3
#_0BA6D6: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BA6D9: db $2E, $28, $9A ; こえ:
#_0BA6DC: db $F9 ; new line
#_0BA6DD: db $4A, $2C, $48, $58, $34, $39 ; よくやったな
#_0BA6E3: db $F2, $0B ; prewritten text 0B
#_0BA6E5: db $F9 ; new line
#_0BA6E6: db $D2, $67, $E1 ; test progress bit 67 for message E1
#_0BA6E9: db $D3, $E2 ; go to message E2

;===================================================================================================

; だが まだ だいてんし ミカエルが
; のこっていよう
; のぼるのだ «カテドラル»の かいだんを«・・・»
Message_03_02_E1:
#_0BA6EB: db $D2, $B6, $E2 ; test progress bit B6 for message E2
#_0BA6EE: db $A6, $9C, $CF, $43, $A6, $CF, $A6, $26 ; だが⎵まだ⎵だい
#_0BA6F6: db $37, $52, $30, $CF, $7C, $62, $60, $85 ; てんし⎵ミカエル
#_0BA6FE: db $9C ; が
#_0BA6FF: db $F9 ; new line
#_0BA700: db $3D, $2E, $58, $37, $26, $4A, $27 ; のこっていよう
#_0BA707: db $F9 ; new line
#_0BA708: db $3D, $AF, $4D, $3D, $A6, $CF ; のぼるのだ⎵
#_0BA70E: db $F2, $5C ; prewritten text 5C
#_0BA710: db $3D, $CF, $2A, $26, $A6, $52, $51 ; の⎵かいだんを
#_0BA717: db $F2, $0B ; prewritten text 0B
#_0BA719: db $FC ; wait for key and new line
#_0BA71A: db $D3, $E8 ; go to message E8

;===================================================================================================

; では きたれ わがもとへ«・・・»
Message_03_02_E2:
#_0BA71C: db $A9, $3E, $CF, $2B, $34, $4E, $CF, $50 ; では⎵きたれ⎵わ
#_0BA724: db $9C, $47, $38, $41 ; がもとへ
#_0BA728: db $F2, $0B ; prewritten text 0B
#_0BA72A: db $FC ; wait for key and new line
#_0BA72B: db $FA ; clear message box
#_0BA72C: db $D3, $F7 ; go to message F7

;===================================================================================================

; [CHASE]よ
; わたしが [CLASS] [DEMON1]
; «せんねんおうこく»を ほうむるため
; カオスの アクマを ひきいて
; ここ«カテドラル»に のりこんできた
; ほんらいは «カテドラル»を はかいするのが
; ねらいであったが すでに はんぶんは
; わがほうが しゅちゅうに おさめた
; そこで このまま «カテドラル»すべてを
; わがてに おさめようと おもう
; ここを «ガイアきょう»とに ひきわたし
; «ガイアきょう»だいしんでんと するのだ
; かつて «ほうのかみ»に アクマへと
; おとしめられた いにしえの かみがみを
; ひとしく まつると しよう
; «カテドラル»を てに いれるために
; ミカエルを なきものに せねばならん
; その たいにんを ひきうけてくれるな?
; [CHASE]よ
; ミカエルの もとに おもむくには
; [ITEM]が ひつようだ
; «アリオクのきば アスタロトのはね »
; そして [ITEM]を てに いれて
; ここへ くるのだ
Message_03_02_E3:
#_0BA72E: db $D2, $C8, $E4 ; test progress bit C8 for message E4
#_0BA731: db $F0 ; write player name
#_0BA732: db $4A ; よ
#_0BA733: db $F9 ; new line
#_0BA734: db $50, $34, $30, $9C, $CF ; わたしが⎵
#_0BA739: db $F6 ; write class name from $0506
#_0BA73A: db $CF ; ⎵
#_0BA73B: db $F5 ; write demon name from $050A
#_0BA73C: db $F9 ; new line
#_0BA73D: db $F2, $21 ; prewritten text 21
#_0BA73F: db $51, $CF, $42, $27, $45, $4D, $34, $46 ; を⎵ほうむるため
#_0BA747: db $F9 ; new line
#_0BA748: db $62, $61, $69, $3D, $CF, $5D, $64, $7B ; カオスの⎵アクマ
#_0BA750: db $51, $CF, $3F, $2B, $26, $37 ; を⎵ひきいて
#_0BA756: db $F9 ; new line
#_0BA757: db $2E, $2E ; ここ
#_0BA759: db $F2, $5C ; prewritten text 5C
#_0BA75B: db $3A, $CF, $3D, $4C, $2E, $52, $A9, $2B ; に⎵のりこんでき
#_0BA763: db $34 ; た
#_0BA764: db $FC ; wait for key and new line
#_0BA765: db $FA ; clear message box
#_0BA766: db $42, $52, $4B, $26, $3E, $CF ; ほんらいは⎵
#_0BA76C: db $F2, $5C ; prewritten text 5C
#_0BA76E: db $51, $CF, $3E, $2A, $26, $31, $4D, $3D ; を⎵はかいするの
#_0BA776: db $9C ; が
#_0BA777: db $F9 ; new line
#_0BA778: db $3C, $4B, $26, $A9, $25, $58, $34, $9C ; ねらいであったが
#_0BA780: db $CF, $31, $A9, $3A, $CF, $3E, $52, $AD ; ⎵すでに⎵はんぶ
#_0BA788: db $52, $3E ; んは
#_0BA78A: db $F9 ; new line
#_0BA78B: db $50, $9C, $42, $27, $9C, $CF, $30, $56 ; わがほうが⎵しゅ
#_0BA793: db $35, $56, $27, $3A, $CF, $29, $2F, $46 ; ちゅうに⎵おさめ
#_0BA79B: db $34 ; た
#_0BA79C: db $F9 ; new line
#_0BA79D: db $33, $2E, $A9, $CF, $2E, $3D, $43, $43 ; そこで⎵このまま
#_0BA7A5: db $CF ; ⎵
#_0BA7A6: db $F2, $5C ; prewritten text 5C
#_0BA7A8: db $31, $AE, $37, $51 ; すべてを
#_0BA7AC: db $F9 ; new line
#_0BA7AD: db $50, $9C, $37, $3A, $CF, $29, $2F, $46 ; わがてに⎵おさめ
#_0BA7B5: db $4A, $27, $38, $CF, $29, $47, $27 ; ようと⎵おもう
#_0BA7BC: db $FC ; wait for key and new line
#_0BA7BD: db $FA ; clear message box
#_0BA7BE: db $2E, $2E, $51, $CF ; ここを⎵
#_0BA7C2: db $F2, $34 ; prewritten text 34
#_0BA7C4: db $38, $3A, $CF, $3F, $2B, $50, $34, $30 ; とに⎵ひきわたし
#_0BA7CC: db $F9 ; new line
#_0BA7CD: db $F2, $34 ; prewritten text 34
#_0BA7CF: db $A6, $26, $30, $52, $A9, $52, $38, $CF ; だいしんでんと⎵
#_0BA7D7: db $31, $4D, $3D, $A6 ; するのだ
#_0BA7DB: db $FC ; wait for key and new line
#_0BA7DC: db $FA ; clear message box
#_0BA7DD: db $2A, $36, $37, $CF ; かつて⎵
#_0BA7E1: db $F2, $63 ; prewritten text 63
#_0BA7E3: db $3A, $CF, $5D, $64, $7B, $41, $38 ; に⎵アクマへと
#_0BA7EA: db $F9 ; new line
#_0BA7EB: db $29, $38, $30, $46, $4B, $4E, $34, $CF ; おとしめられた⎵
#_0BA7F3: db $26, $3A, $30, $28, $3D, $CF, $2A, $44 ; いにしえの⎵かみ
#_0BA7FB: db $9C, $44, $51 ; がみを
#_0BA7FE: db $F9 ; new line
#_0BA7FF: db $3F, $38, $30, $2C, $CF, $43, $36, $4D ; ひとしく⎵まつる
#_0BA807: db $38, $CF, $30, $4A, $27 ; と⎵しよう
#_0BA80C: db $FC ; wait for key and new line
#_0BA80D: db $FA ; clear message box
#_0BA80E: db $F2, $5C ; prewritten text 5C
#_0BA810: db $51, $CF, $37, $3A, $CF, $26, $4E, $4D ; を⎵てに⎵いれる
#_0BA818: db $34, $46, $3A ; ために
#_0BA81B: db $F9 ; new line
#_0BA81C: db $7C, $62, $60, $85, $51, $CF, $39, $2B ; ミカエルを⎵なき
#_0BA824: db $47, $3D, $3A, $CF, $32, $3C, $AB, $39 ; ものに⎵せねばな
#_0BA82C: db $4B, $52 ; らん
#_0BA82E: db $F9 ; new line
#_0BA82F: db $33, $3D, $CF, $34, $26, $3A, $52, $51 ; その⎵たいにんを
#_0BA837: db $CF, $3F, $2B, $27, $2D, $37, $2C, $4E ; ⎵ひきうけてくれ
#_0BA83F: db $4D, $39, $95 ; るな?
#_0BA842: db $F9 ; new line
#_0BA843: db $F0 ; write player name
#_0BA844: db $4A ; よ
#_0BA845: db $FC ; wait for key and new line
#_0BA846: db $FA ; clear message box
#_0BA847: db $7C, $62, $60, $85, $3D, $CF, $47, $38 ; ミカエルの⎵もと
#_0BA84F: db $3A, $CF, $29, $47, $45, $2C, $3A, $3E ; に⎵おもむくには
#_0BA857: db $F9 ; new line
#_0BA858: db $E1, $FB ; set $0A50 to item FB
#_0BA85A: db $F3 ; write item name from $0A50
#_0BA85B: db $9C, $CF, $3F, $36, $4A, $27, $A6 ; が⎵ひつようだ
#_0BA862: db $FC ; wait for key and new line
#_0BA863: db $FA ; clear message box
#_0BA864: db $F2, $78 ; prewritten text 78
#_0BA866: db $33, $30, $37, $CF ; そして⎵
#_0BA86A: db $F3 ; write item name from $0A50
#_0BA86B: db $51, $CF, $37, $3A, $CF, $26, $4E, $37 ; を⎵てに⎵いれて
#_0BA873: db $F9 ; new line
#_0BA874: db $2E, $2E, $41, $CF, $2C, $4D, $3D, $A6 ; ここへ⎵くるのだ
#_0BA87C: db $FC ; wait for key and new line
#_0BA87D: db $D0, $C8 ; set progress bit C8
#_0BA87F: db $D3, $E8 ; go to message E8

;===================================================================================================

; おお 3つとも そろったか
; では [ITEM]に かえてやろう
; >[LEADER]は [ITEM]を
; «てにいれた»
; [DEMON1]:
; これで ミカエルの もとへの
; みちが ひらけるはず
; だが [ITEM]は
; アクマの ちからの みなもと
; つかいすぎには くれぐれも きを つけてくれ
; たのんだぞ [CHASE]よ
Message_03_02_E4:
#_0BA881: db $DD, $F8, $E5 ; go to message E5 if missing item F8
#_0BA884: db $DD, $F9, $E5 ; go to message E5 if missing item F9
#_0BA887: db $DD, $FA, $E5 ; go to message E5 if missing item FA
#_0BA88A: db $29, $29, $CF, $04, $36, $38, $47, $CF ; おお⎵3つとも⎵
#_0BA892: db $33, $4F, $58, $34, $2A ; そろったか
#_0BA897: db $F9 ; new line
#_0BA898: db $A9, $3E, $CF ; では⎵
#_0BA89B: db $E1, $FB ; set $0A50 to item FB
#_0BA89D: db $F3 ; write item name from $0A50
#_0BA89E: db $3A, $CF, $2A, $28, $37, $48, $4F, $27 ; に⎵かえてやろう
#_0BA8A6: db $FC ; wait for key and new line
#_0BA8A7: db $E1, $F8 ; set $0A50 to item F8
#_0BA8A9: db $FE, $29 ; ext command 29: take item from $0A51 TODO
#_0BA8AB: db $E1, $F9 ; set $0A50 to item F9
#_0BA8AD: db $FE, $29 ; ext command 29: take item from $0A51 TODO
#_0BA8AF: db $E1, $FA ; set $0A50 to item FA
#_0BA8B1: db $FE, $29 ; ext command 29: take item from $0A51 TODO
#_0BA8B3: db $E1, $FB ; set $0A50 to item FB
#_0BA8B5: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BA8B7: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BA8BA: db $FA ; clear message box
#_0BA8BB: db $97 ; >
#_0BA8BC: db $F1 ; write leader's name for team
#_0BA8BD: db $3E, $CF ; は⎵
#_0BA8BF: db $F3 ; write item name from $0A50
#_0BA8C0: db $51 ; を
#_0BA8C1: db $F9 ; new line
#_0BA8C2: db $F2, $2D ; prewritten text 2D
#_0BA8C4: db $FC ; wait for key and new line
#_0BA8C5: db $FA ; clear message box
#_0BA8C6: db $F5 ; write demon name from $050A
#_0BA8C7: db $9A ; :
#_0BA8C8: db $F9 ; new line
#_0BA8C9: db $2E, $4E, $A9, $CF, $7C, $62, $60, $85 ; これで⎵ミカエル
#_0BA8D1: db $3D, $CF, $47, $38, $41, $3D ; の⎵もとへの
#_0BA8D7: db $F9 ; new line
#_0BA8D8: db $44, $35, $9C, $CF, $3F, $4B, $2D, $4D ; みちが⎵ひらける
#_0BA8E0: db $3E, $A3 ; はず
#_0BA8E2: db $FC ; wait for key and new line
#_0BA8E3: db $FA ; clear message box
#_0BA8E4: db $A6, $9C, $CF ; だが⎵
#_0BA8E7: db $F3 ; write item name from $0A50
#_0BA8E8: db $3E ; は
#_0BA8E9: db $F9 ; new line
#_0BA8EA: db $5D, $64, $7B, $3D, $CF, $35, $2A, $4B ; アクマの⎵ちから
#_0BA8F2: db $3D, $CF, $44, $39, $47, $38 ; の⎵みなもと
#_0BA8F8: db $F9 ; new line
#_0BA8F9: db $36, $2A, $26, $31, $9D, $3A, $3E, $CF ; つかいすぎには⎵
#_0BA901: db $2C, $4E, $9E, $4E, $47, $CF, $2B, $51 ; くれぐれも⎵きを
#_0BA909: db $CF, $36, $2D, $37, $2C, $4E ; ⎵つけてくれ
#_0BA90F: db $FC ; wait for key and new line
#_0BA910: db $FA ; clear message box
#_0BA911: db $34, $3D, $52, $A6, $A5, $CF ; たのんだぞ⎵
#_0BA917: db $F0 ; write player name
#_0BA918: db $4A ; よ
#_0BA919: db $FC ; wait for key and new line
#_0BA91A: db $D0, $B4 ; set progress bit B4
#_0BA91C: db $D3, $E8 ; go to message E8

;===================================================================================================

Message_03_02_E5:
#_0BA91E: db $D2, $C8, $E6 ; test progress bit C8 for message E6
#_0BA921: db $D3, $E8 ; go to message E8

;===================================================================================================

; はやく «アリオクのきば アスタロトのはね »
; そして [ITEM]を てに いれるのだ
Message_03_02_E6:
#_0BA923: db $3E, $48, $2C, $CF ; はやく⎵
#_0BA927: db $F2, $78 ; prewritten text 78
#_0BA929: db $33, $30, $37, $CF ; そして⎵
#_0BA92D: db $F3 ; write item name from $0A50
#_0BA92E: db $51, $CF, $37, $3A, $CF, $26, $4E, $4D ; を⎵てに⎵いれる
#_0BA936: db $3D, $A6 ; のだ
#_0BA938: db $FC ; wait for key and new line
#_0BA939: db $D3, $E8 ; go to message E8

;===================================================================================================

; >«だれもいない»
Message_03_02_E7:
#_0BA93B: db $97 ; >
#_0BA93C: db $F2, $2C ; prewritten text 2C
#_0BA93E: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_E8:
#_0BA93F: db $FE, $1A, $29, $36, $14, $00, $00, $00 ; ext command 1A: 29,36,14,00,00,00
#_0BA947: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_02_E9:
#_0BA948: db $D6, $00, $6F, $60, $28 ; place sprite 6F in slot 00 at XY:{60,28}
#_0BA94D: db $97 ; >
#_0BA94E: db $F2, $68 ; prewritten text 68
#_0BA950: db $F8, $EA ; YES/NO - go to message EA if YES
#_0BA952: db $FF ; end of message

;===================================================================================================

Message_03_02_EA:
#_0BA953: db $D6, $00, $78, $60, $28 ; place sprite 78 in slot 00 at XY:{60,28}
#_0BA958: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BA95B: db $D6, $00, $00 ; delete sprite in slot 00
#_0BA95E: db $FE, $1A, $2B, $31, $13, $00, $00, $00 ; ext command 1A: 2B,31,13,00,00,00

;===================================================================================================

Message_03_02_EB:
#_0BA966: db $D5, $45 ; send 45 to APU
#_0BA968: db $E1, $F1 ; set $0A50 to item F1
#_0BA96A: db $D2, $B6, $F0 ; test progress bit B6 for message F0
#_0BA96D: db $FE, $04, $F1, $EC ; ext command 04: message F1 if 11C >= 112; EC if >= 144

;===================================================================================================

; [DEMON1]:
; ついに ここまで きたか
; この わたしが みずから
; てを くださねば ならぬようだな
; アクマに たましいを うりわたし
; へいわの ため さしのべられた
; かみの てを こばみ
; «せんねんおうこく»の まえに たちふさがる«・・・»
; この にせ きゅうせいしゅ め!
; それとも まよったあげくに ひよりみ きめこむ
; ひれつな ほんしょうを
; あらわしたか ひとのこよ?
; いずれにしても
Message_03_02_EC:
#_0BA971: db $D7, $3A ; load scene 3A
#_0BA973: db $DE, $01, $00, $1F, $01 ; load 1x demon 011F
#_0BA978: db $E4, $00 ; load demon $00
#_0BA97A: db $F5 ; write demon name from $050A
#_0BA97B: db $9A ; :
#_0BA97C: db $F9 ; new line
#_0BA97D: db $36, $26, $3A, $CF, $2E, $2E, $43, $A9 ; ついに⎵ここまで
#_0BA985: db $CF, $2B, $34, $2A ; ⎵きたか
#_0BA989: db $F9 ; new line
#_0BA98A: db $2E, $3D, $CF, $50, $34, $30, $9C, $CF ; この⎵わたしが⎵
#_0BA992: db $44, $A3, $2A, $4B ; みずから
#_0BA996: db $F9 ; new line
#_0BA997: db $37, $51, $CF, $2C, $A6, $2F, $3C, $AB ; てを⎵くださねば
#_0BA99F: db $CF, $39, $4B, $3B, $4A, $27, $A6, $39 ; ⎵ならぬようだな
#_0BA9A7: db $FC ; wait for key and new line
#_0BA9A8: db $FA ; clear message box
#_0BA9A9: db $5D, $64, $7B, $3A, $CF, $34, $43, $30 ; アクマに⎵たまし
#_0BA9B1: db $26, $51, $CF, $27, $4C, $50, $34, $30 ; いを⎵うりわたし
#_0BA9B9: db $F9 ; new line
#_0BA9BA: db $41, $26, $50, $3D, $CF, $34, $46, $CF ; へいわの⎵ため⎵
#_0BA9C2: db $2F, $30, $3D, $AE, $4B, $4E, $34 ; さしのべられた
#_0BA9C9: db $F9 ; new line
#_0BA9CA: db $2A, $44, $3D, $CF, $37, $51, $CF, $2E ; かみの⎵てを⎵こ
#_0BA9D2: db $AB, $44 ; ばみ
#_0BA9D4: db $F9 ; new line
#_0BA9D5: db $F2, $21 ; prewritten text 21
#_0BA9D7: db $3D, $CF, $43, $28, $3A, $CF, $34, $35 ; の⎵まえに⎵たち
#_0BA9DF: db $40, $2F, $9C, $4D ; ふさがる
#_0BA9E3: db $F2, $0B ; prewritten text 0B
#_0BA9E5: db $F9 ; new line
#_0BA9E6: db $2E, $3D, $CF, $3A, $32, $CF, $2B, $56 ; この⎵にせ⎵きゅ
#_0BA9EE: db $27, $32, $26, $30, $56, $CF, $46, $94 ; うせいしゅ⎵め!
#_0BA9F6: db $FC ; wait for key and new line
#_0BA9F7: db $FA ; clear message box
#_0BA9F8: db $FE, $04, $F2, $ED ; ext command 04: message F2 if 11C >= 112; ED if >= 144
#_0BA9FC: db $33, $4E, $38, $47, $CF, $43, $4A, $58 ; それとも⎵まよっ
#_0BAA04: db $34, $25, $9F, $2C, $3A, $CF, $3F, $4A ; たあげくに⎵ひよ
#_0BAA0C: db $4C, $44, $CF, $2B, $46, $2E, $45 ; りみ⎵きめこむ
#_0BAA13: db $F9 ; new line
#_0BAA14: db $3F, $4E, $36, $39, $CF, $42, $52, $30 ; ひれつな⎵ほんし
#_0BAA1C: db $57, $27, $51 ; ょうを
#_0BAA1F: db $F9 ; new line
#_0BAA20: db $25, $4B, $50, $30, $34, $2A, $CF, $3F ; あらわしたか⎵ひ
#_0BAA28: db $38, $3D, $2E, $4A, $95 ; とのこよ?
#_0BAA2D: db $FC ; wait for key and new line
#_0BAA2E: db $FA ; clear message box
#_0BAA2F: db $26, $A3, $4E, $3A, $30, $37, $47 ; いずれにしても
#_0BAA36: db $F9 ; new line

;===================================================================================================

; いかしては おけぬ!
; じごくの ごうかに やかれるがよい!
Message_03_02_ED:
#_0BAA37: db $26, $2A, $30, $37, $3E, $CF, $29, $2D ; いかしては⎵おけ
#_0BAA3F: db $3B, $94 ; ぬ!
#_0BAA41: db $F9 ; new line
#_0BAA42: db $A2, $A0, $2C, $3D, $CF, $A0, $27, $2A ; じごくの⎵ごうか
#_0BAA4A: db $3A, $CF, $48, $2A, $4E, $4D, $9C, $4A ; に⎵やかれるがよ
#_0BAA52: db $26, $94 ; い!
#_0BAA54: db $FC ; wait for key and new line
#_0BAA55: db $D5, $39 ; send 39 to APU
#_0BAA57: db $E5, $02, $EF ; [COMMAND E5:02,EF]

;===================================================================================================

Message_03_02_EE:
#_0BAA5A: db $E5, $00, $EF ; [COMMAND E5:00,EF]
#_0BAA5D: db $D3, $EE ; go to message EE

;===================================================================================================

; [DEMON1]:
; «・・・»かみよ«・・・»
; この [DEMON1] ちから およばず«・・・»
; おむかえすること かなわず«・・・»おゆるしを
; «・・・»«・・・»«・・・»«・・・»
Message_03_02_EF:
#_0BAA5F: db $F5 ; write demon name from $050A
#_0BAA60: db $9A ; :
#_0BAA61: db $F9 ; new line
#_0BAA62: db $F2, $0B ; prewritten text 0B
#_0BAA64: db $2A, $44, $4A ; かみよ
#_0BAA67: db $F2, $0B ; prewritten text 0B
#_0BAA69: db $F9 ; new line
#_0BAA6A: db $2E, $3D, $CF ; この⎵
#_0BAA6D: db $F5 ; write demon name from $050A
#_0BAA6E: db $CF, $35, $2A, $4B, $CF, $29, $4A, $AB ; ⎵ちから⎵およば
#_0BAA76: db $A3 ; ず
#_0BAA77: db $F2, $0B ; prewritten text 0B
#_0BAA79: db $F9 ; new line
#_0BAA7A: db $29, $45, $2A, $28, $31, $4D, $2E, $38 ; おむかえすること
#_0BAA82: db $CF, $2A, $39, $50, $A3 ; ⎵かなわず
#_0BAA87: db $F2, $0B ; prewritten text 0B
#_0BAA89: db $29, $49, $4D, $30, $51 ; おゆるしを
#_0BAA8E: db $F9 ; new line
#_0BAA8F: db $F2, $0B ; prewritten text 0B
#_0BAA91: db $F2, $0B ; prewritten text 0B
#_0BAA93: db $F2, $0B ; prewritten text 0B
#_0BAA95: db $F2, $0B ; prewritten text 0B
#_0BAA97: db $FC ; wait for key and new line
#_0BAA98: db $D0, $B6 ; set progress bit B6
#_0BAA9A: db $E7, $00 ; call routine 01E5CD with value 00 TODO

;===================================================================================================

Message_03_02_F0:
#_0BAA9C: db $D2, $C7, $F7 ; test progress bit C7 for message F7
#_0BAA9F: db $D2, $67, $F4 ; test progress bit 67 for message F4
#_0BAAA2: db $D3, $F8 ; go to message F8

;===================================================================================================

Message_03_02_F1:
#_0BAAA4: db $D2, $B2, $F4 ; test progress bit B2 for message F4
#_0BAAA7: db $D7, $2D ; load scene 2D

;===================================================================================================

; «ロウヒーロー»:
; かみが うみだした ニンゲンは
; ついに じめつして«しまいました»
; はかいされた せかいは こんとん そのもの
; カオスの ものどもは よろこんでいるでしょう
; だが かみは ニンゲンをみはなしては いません
; かみの じひは ニンゲンを
; ぜつぼうの ふちより すくいだし
; もういちど やりなおす きかいを
; あたえようと しているのです
; それが かみの すくい
; «せんねんおうこく»
; かみの もとで えいえんの へいわが
; おとずれる せかいなのです
; そして «せんねんおうこく»のため
; かみの おりたたれる «カテドラル»が
; かみを あがめる «メシアきょう»が
; ひつようだったのです
; «カテドラル»を アクマのてから とりもどすには
; アスラおうを たおすしか ありません
; だが アスラおうの もとへ いくには
; [ITEM]が いるのです
; [ITEM]は 3たいの «セラフてんし»を
; がったいさせれば できると
; ミカエルさまは おっしゃるのですが«・・・»
; どこへ いけば その がったいが
; できるのでしょう?
Message_03_02_F2:
#_0BAAA9: db $D2, $D5, $F5 ; test progress bit D5 for message F5
#_0BAAAC: db $FE, $3A, $02, $03 ; ext command 3A: 02 03 TODO
#_0BAAB0: db $FE, $07, $7F ; ext command 07: draw buffered text then wait 126 frames
#_0BAAB3: db $DE, $01, $00, $1B, $01 ; load 1x demon 011B
#_0BAAB8: db $E4, $00 ; load demon $00
#_0BAABA: db $F2, $66 ; prewritten text 66
#_0BAABC: db $9A ; :
#_0BAABD: db $F9 ; new line
#_0BAABE: db $D2, $B5, $F3 ; test progress bit B5 for message F3
#_0BAAC1: db $2A, $44, $9C, $CF, $27, $44, $A6, $30 ; かみが⎵うみだし
#_0BAAC9: db $34, $CF, $72, $8A, $B8, $8A, $3E ; た⎵ニンゲンは
#_0BAAD0: db $F9 ; new line
#_0BAAD1: db $36, $26, $3A, $CF, $A2, $46, $36, $30 ; ついに⎵じめつし
#_0BAAD9: db $37 ; て
#_0BAADA: db $F2, $8B ; prewritten text 8B
#_0BAADC: db $F9 ; new line
#_0BAADD: db $3E, $2A, $26, $2F, $4E, $34, $CF, $32 ; はかいされた⎵せ
#_0BAAE5: db $2A, $26, $3E, $CF, $2E, $52, $38, $52 ; かいは⎵こんとん
#_0BAAED: db $CF, $33, $3D, $47, $3D ; ⎵そのもの
#_0BAAF2: db $F9 ; new line
#_0BAAF3: db $62, $61, $69, $3D, $CF, $47, $3D, $AA ; カオスの⎵ものど
#_0BAAFB: db $47, $3E, $CF, $4A, $4F, $2E, $52, $A9 ; もは⎵よろこんで
#_0BAB03: db $26, $4D, $A9, $30, $57, $27 ; いるでしょう
#_0BAB09: db $FC ; wait for key and new line
#_0BAB0A: db $FA ; clear message box
#_0BAB0B: db $A6, $9C, $CF, $2A, $44, $3E, $CF, $72 ; だが⎵かみは⎵ニ
#_0BAB13: db $8A, $B8, $8A, $51, $44, $3E, $39, $30 ; ンゲンをみはなし
#_0BAB1B: db $37, $3E, $CF, $26, $43, $32, $52 ; ては⎵いません
#_0BAB22: db $F9 ; new line
#_0BAB23: db $2A, $44, $3D, $CF, $A2, $3F, $3E, $CF ; かみの⎵じひは⎵
#_0BAB2B: db $72, $8A, $B8, $8A, $51 ; ニンゲンを
#_0BAB30: db $F9 ; new line
#_0BAB31: db $A4, $36, $AF, $27, $3D, $CF, $40, $35 ; ぜつぼうの⎵ふち
#_0BAB39: db $4A, $4C, $CF, $31, $2C, $26, $A6, $30 ; より⎵すくいだし
#_0BAB41: db $F9 ; new line
#_0BAB42: db $47, $27, $26, $35, $AA, $CF, $48, $4C ; もういちど⎵やり
#_0BAB4A: db $39, $29, $31, $CF, $2B, $2A, $26, $51 ; なおす⎵きかいを
#_0BAB52: db $F9 ; new line
#_0BAB53: db $25, $34, $28, $4A, $27, $38, $CF, $30 ; あたえようと⎵し
#_0BAB5B: db $37, $26, $4D, $3D, $A9, $31 ; ているのです
#_0BAB61: db $FC ; wait for key and new line
#_0BAB62: db $FA ; clear message box
#_0BAB63: db $33, $4E, $9C, $CF, $2A, $44, $3D, $CF ; それが⎵かみの⎵
#_0BAB6B: db $31, $2C, $26 ; すくい
#_0BAB6E: db $F9 ; new line
#_0BAB6F: db $F2, $21 ; prewritten text 21
#_0BAB71: db $FC ; wait for key and new line
#_0BAB72: db $2A, $44, $3D, $CF, $47, $38, $A9, $CF ; かみの⎵もとで⎵
#_0BAB7A: db $28, $26, $28, $52, $3D, $CF, $41, $26 ; えいえんの⎵へい
#_0BAB82: db $50, $9C ; わが
#_0BAB84: db $F9 ; new line
#_0BAB85: db $29, $38, $A3, $4E, $4D, $CF, $32, $2A ; おとずれる⎵せか
#_0BAB8D: db $26, $39, $3D, $A9, $31 ; いなのです
#_0BAB92: db $FC ; wait for key and new line
#_0BAB93: db $FA ; clear message box
#_0BAB94: db $33, $30, $37, $CF ; そして⎵
#_0BAB98: db $F2, $21 ; prewritten text 21
#_0BAB9A: db $3D, $34, $46 ; のため
#_0BAB9D: db $F9 ; new line
#_0BAB9E: db $2A, $44, $3D, $CF, $29, $4C, $34, $34 ; かみの⎵おりたた
#_0BABA6: db $4E, $4D, $CF ; れる⎵
#_0BABA9: db $F2, $5C ; prewritten text 5C
#_0BABAB: db $9C ; が
#_0BABAC: db $F9 ; new line
#_0BABAD: db $2A, $44, $51, $CF, $25, $9C, $46, $4D ; かみを⎵あがめる
#_0BABB5: db $CF ; ⎵
#_0BABB6: db $F2, $33 ; prewritten text 33
#_0BABB8: db $9C ; が
#_0BABB9: db $F9 ; new line
#_0BABBA: db $3F, $36, $4A, $27, $A6, $58, $34, $3D ; ひつようだったの
#_0BABC2: db $A9, $31 ; です
#_0BABC4: db $FC ; wait for key and new line
#_0BABC5: db $FA ; clear message box
#_0BABC6: db $F2, $5C ; prewritten text 5C
#_0BABC8: db $51, $CF, $5D, $64, $7B, $3D, $37, $2A ; を⎵アクマのてか
#_0BABD0: db $4B, $CF, $38, $4C, $47, $AA, $31, $3A ; ら⎵とりもどすに
#_0BABD8: db $3E ; は
#_0BABD9: db $F9 ; new line
#_0BABDA: db $5D, $69, $83, $29, $27, $51, $CF, $34 ; アスラおうを⎵た
#_0BABE2: db $29, $31, $30, $2A, $CF, $25, $4C, $43 ; おすしか⎵ありま
#_0BABEA: db $32, $52 ; せん
#_0BABEC: db $F9 ; new line
#_0BABED: db $A6, $9C, $CF, $5D, $69, $83, $29, $27 ; だが⎵アスラおう
#_0BABF5: db $3D, $CF, $47, $38, $41, $CF, $26, $2C ; の⎵もとへ⎵いく
#_0BABFD: db $3A, $3E ; には
#_0BABFF: db $F9 ; new line
#_0BAC00: db $F3 ; write item name from $0A50
#_0BAC01: db $9C, $CF, $26, $4D, $3D, $A9, $31 ; が⎵いるのです
#_0BAC08: db $FC ; wait for key and new line
#_0BAC09: db $FA ; clear message box
#_0BAC0A: db $F3 ; write item name from $0A50
#_0BAC0B: db $3E, $CF, $04, $34, $26, $3D, $CF ; は⎵3たいの⎵
#_0BAC12: db $F2, $87 ; prewritten text 87
#_0BAC14: db $51 ; を
#_0BAC15: db $F9 ; new line
#_0BAC16: db $9C, $58, $34, $26, $2F, $32, $4E, $AB ; がったいさせれば
#_0BAC1E: db $CF, $A9, $2B, $4D, $38 ; ⎵できると
#_0BAC23: db $F9 ; new line
#_0BAC24: db $7C, $62, $60, $85, $2F, $43, $3E, $CF ; ミカエルさまは⎵
#_0BAC2C: db $29, $58, $30, $55, $4D, $3D, $A9, $31 ; おっしゃるのです
#_0BAC34: db $9C ; が
#_0BAC35: db $F2, $0B ; prewritten text 0B
#_0BAC37: db $FC ; wait for key and new line
#_0BAC38: db $FA ; clear message box
#_0BAC39: db $AA, $2E, $41, $CF, $26, $2D, $AB, $CF ; どこへ⎵いけば⎵
#_0BAC41: db $33, $3D, $CF, $9C, $58, $34, $26, $9C ; その⎵がったいが
#_0BAC49: db $F9 ; new line
#_0BAC4A: db $A9, $2B, $4D, $3D, $A9, $30, $57, $27 ; できるのでしょう
#_0BAC52: db $95 ; ?
#_0BAC53: db $FC ; wait for key and new line
#_0BAC54: db $D0, $B5 ; set progress bit B5
#_0BAC56: db $D3, $F9 ; go to message F9

;===================================================================================================

; ああ はやく [ITEM]を
; てに いれなければ
Message_03_02_F3:
#_0BAC58: db $25, $25, $CF, $3E, $48, $2C, $CF ; ああ⎵はやく⎵
#_0BAC5F: db $F3 ; write item name from $0A50
#_0BAC60: db $51 ; を
#_0BAC61: db $F9 ; new line
#_0BAC62: db $37, $3A, $CF, $26, $4E, $39, $2D, $4E ; てに⎵いれなけれ
#_0BAC6A: db $AB ; ば
#_0BAC6B: db $FC ; wait for key and new line
#_0BAC6C: db $D3, $F9 ; go to message F9

;===================================================================================================

Message_03_02_F4:
#_0BAC6E: db $D7, $3A ; load scene 3A

;===================================================================================================

; >«だれもいない»
Message_03_02_F5:
#_0BAC70: db $D4, $03 ; set text box size to 3
#_0BAC72: db $97 ; >
#_0BAC73: db $F2, $2C ; prewritten text 2C
#_0BAC75: db $FC ; wait for key and new line
#_0BAC76: db $D3, $F9 ; go to message F9

;===================================================================================================

; [DEMON1]:
; ごくろうで あった
; さあ «カテドラル»の おくじょうへ いけ
Message_03_02_F6:
#_0BAC78: db $D2, $67, $F7 ; test progress bit 67 for message F7
#_0BAC7B: db $D7, $3A ; load scene 3A
#_0BAC7D: db $FE, $3A, $02, $02 ; ext command 3A: 02 02 TODO
#_0BAC81: db $DE, $01, $00, $1F, $01 ; load 1x demon 011F
#_0BAC86: db $E4, $00 ; load demon $00
#_0BAC88: db $F5 ; write demon name from $050A
#_0BAC89: db $9A ; :
#_0BAC8A: db $F9 ; new line
#_0BAC8B: db $A0, $2C, $4F, $27, $A9, $CF, $25, $58 ; ごくろうで⎵あっ
#_0BAC93: db $34 ; た
#_0BAC94: db $F9 ; new line
#_0BAC95: db $2F, $25, $CF ; さあ⎵
#_0BAC98: db $F2, $5C ; prewritten text 5C
#_0BAC9A: db $3D, $CF, $29, $2C, $A2, $57, $27, $41 ; の⎵おくじょうへ
#_0BACA2: db $CF, $26, $2D ; ⎵いけ
#_0BACA5: db $FC ; wait for key and new line

;===================================================================================================

Message_03_02_F7:
#_0BACA6: db $FE, $25, $FF ; ext command 25: something FF TODO
#_0BACA9: db $FE, $23, $FF ; ext command 23: something FF TODO
#_0BACAC: db $FE, $24, $FF ; ext command 24: something FF TODO
#_0BACAF: db $FE, $1A, $22, $0B, $13, $00, $00, $00 ; ext command 1A: 22,0B,13,00,00,00
#_0BACB7: db $D0, $FF ; set progress bit FF
#_0BACB9: db $FF ; end of message

;===================================================================================================

Message_03_02_F8:
#_0BACBA: db $D3, $F7 ; go to message F7

;===================================================================================================

Message_03_02_F9:
#_0BACBC: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BACBE: db $FE, $1A, $2B, $B2, $13, $00, $00, $00 ; ext command 1A: 2B,B2,13,00,00,00
#_0BACC6: db $FF ; end of message

;===================================================================================================

; «メシアきょう»と:
; ようこそ «カテドラル»へ
; ここへ くれば あなたも かみの おすがたを
; まのあたりに できるでしょう
Message_03_03_00:
#_0BACC7: db $D6, $00, $49, $78, $28 ; place sprite 49 in slot 00 at XY:{78,28}
#_0BACCC: db $F2, $33 ; prewritten text 33
#_0BACCE: db $38, $9A ; と:
#_0BACD0: db $F9 ; new line
#_0BACD1: db $4A, $27, $2E, $33, $CF ; ようこそ⎵
#_0BACD6: db $F2, $5C ; prewritten text 5C
#_0BACD8: db $41 ; へ
#_0BACD9: db $FC ; wait for key and new line
#_0BACDA: db $FA ; clear message box
#_0BACDB: db $2E, $2E, $41, $CF, $2C, $4E, $AB, $CF ; ここへ⎵くれば⎵
#_0BACE3: db $25, $39, $34, $47, $CF, $2A, $44, $3D ; あなたも⎵かみの
#_0BACEB: db $CF, $29, $31, $9C, $34, $51 ; ⎵おすがたを
#_0BACF1: db $F9 ; new line
#_0BACF2: db $43, $3D, $25, $34, $4C, $3A, $CF, $A9 ; まのあたりに⎵で
#_0BACFA: db $2B, $4D, $A9, $30, $57, $27 ; きるでしょう
#_0BAD00: db $FC ; wait for key and new line
#_0BAD01: db $FF ; end of message

;===================================================================================================

; ろうじん:
; わしにも かみの すがたが おがめるのかのう
Message_03_03_01:
#_0BAD02: db $D2, $9E, $02 ; test progress bit 9E for message 02
#_0BAD05: db $D6, $00, $89, $70, $28 ; place sprite 89 in slot 00 at XY:{70,28}
#_0BAD0A: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0BAD0F: db $F9 ; new line
#_0BAD10: db $50, $30, $3A, $47, $CF, $2A, $44, $3D ; わしにも⎵かみの
#_0BAD18: db $CF, $31, $9C, $34, $9C, $CF, $29, $9C ; ⎵すがたが⎵おが
#_0BAD20: db $46, $4D, $3D, $2A, $3D, $27 ; めるのかのう
#_0BAD26: db $FC ; wait for key and new line
#_0BAD27: db $FF ; end of message

;===================================================================================================

; «メシアきょう»きょうそ:
; «カテドラル»のおかげで おもわぬ
; いのちびろいを しました
; これも かみの おぼしめしでしょうか
Message_03_03_02:
#_0BAD28: db $D6, $00, $8B, $70, $28 ; place sprite 8B in slot 00 at XY:{70,28}
#_0BAD2D: db $F2, $33 ; prewritten text 33
#_0BAD2F: db $2B, $57, $27, $33, $9A ; きょうそ:
#_0BAD34: db $F9 ; new line
#_0BAD35: db $F2, $5C ; prewritten text 5C
#_0BAD37: db $3D, $29, $2A, $9F, $A9, $CF, $29, $47 ; のおかげで⎵おも
#_0BAD3F: db $50, $3B ; わぬ
#_0BAD41: db $F9 ; new line
#_0BAD42: db $26, $3D, $35, $AC, $4F, $26, $51, $CF ; いのちびろいを⎵
#_0BAD4A: db $30, $43, $30, $34 ; しました
#_0BAD4E: db $FC ; wait for key and new line
#_0BAD4F: db $FA ; clear message box
#_0BAD50: db $2E, $4E, $47, $CF, $2A, $44, $3D, $CF ; これも⎵かみの⎵
#_0BAD58: db $29, $AF, $30, $46, $30, $A9, $30, $57 ; おぼしめしでしょ
#_0BAD60: db $27, $2A ; うか
#_0BAD62: db $FC ; wait for key and new line
#_0BAD63: db $FF ; end of message

;===================================================================================================

; «メシアきょう»と:
; せっかくできた «カテドラル»に
; めざわりな アクマや いきょうとどもが
; はいりこんでしまった どうしてくれよう
Message_03_03_03:
#_0BAD64: db $D6, $00, $85, $70, $28 ; place sprite 85 in slot 00 at XY:{70,28}
#_0BAD69: db $F2, $33 ; prewritten text 33
#_0BAD6B: db $38, $9A ; と:
#_0BAD6D: db $F9 ; new line
#_0BAD6E: db $D2, $9E, $04 ; test progress bit 9E for message 04
#_0BAD71: db $32, $58, $2A, $2C, $A9, $2B, $34, $CF ; せっかくできた⎵
#_0BAD79: db $F2, $5C ; prewritten text 5C
#_0BAD7B: db $3A ; に
#_0BAD7C: db $F9 ; new line
#_0BAD7D: db $46, $A1, $50, $4C, $39, $CF, $5D, $64 ; めざわりな⎵アク
#_0BAD85: db $7B, $48, $CF, $26, $2B, $57, $27, $38 ; マや⎵いきょうと
#_0BAD8D: db $AA, $47, $9C ; どもが
#_0BAD90: db $F9 ; new line
#_0BAD91: db $3E, $26, $4C, $2E, $52, $A9, $30, $43 ; はいりこんでしま
#_0BAD99: db $58, $34, $CF, $AA, $27, $30, $37, $2C ; った⎵どうしてく
#_0BADA1: db $4E, $4A, $27 ; れよう
#_0BADA4: db $FC ; wait for key and new line
#_0BADA5: db $FF ; end of message

;===================================================================================================

; かみが おいかりに なられたのだ
; けがれた «トウキョウ»を
; かみが あらいながされたのだ
Message_03_03_04:
#_0BADA6: db $2A, $44, $9C, $CF, $29, $26, $2A, $4C ; かみが⎵おいかり
#_0BADAE: db $3A, $CF, $39, $4B, $4E, $34, $3D, $A6 ; に⎵なられたのだ
#_0BADB6: db $F9 ; new line
#_0BADB7: db $2D, $9C, $4E, $34, $CF ; けがれた⎵
#_0BADBC: db $F2, $1C ; prewritten text 1C
#_0BADBE: db $51 ; を
#_0BADBF: db $F9 ; new line
#_0BADC0: db $2A, $44, $9C, $CF, $25, $4B, $26, $39 ; かみが⎵あらいな
#_0BADC8: db $9C, $2F, $4E, $34, $3D, $A6 ; がされたのだ
#_0BADCE: db $FC ; wait for key and new line
#_0BADCF: db $FF ; end of message

;===================================================================================================

; «メシアきょう»と:
; もう だいテンシさまが ここに きているって
; はやく あいたいな
Message_03_03_05:
#_0BADD0: db $D6, $00, $0E, $70, $38 ; place sprite 0E in slot 00 at XY:{70,38}
#_0BADD5: db $F2, $33 ; prewritten text 33
#_0BADD7: db $38, $9A ; と:
#_0BADD9: db $F9 ; new line
#_0BADDA: db $47, $27, $CF, $A6, $26, $6F, $8A, $68 ; もう⎵だいテンシ
#_0BADE2: db $2F, $43, $9C, $CF, $2E, $2E, $3A, $CF ; さまが⎵ここに⎵
#_0BADEA: db $2B, $37, $26, $4D, $58, $37 ; きているって
#_0BADF0: db $F9 ; new line
#_0BADF1: db $3E, $48, $2C, $CF, $25, $26, $34, $26 ; はやく⎵あいたい
#_0BADF9: db $39 ; な
#_0BADFA: db $FC ; wait for key and new line
#_0BADFB: db $FF ; end of message

;===================================================================================================

; おとこ:
; «メシアきょう»とに なるつもりなんか ないが
; とりあえず しんじてるふり してれば
; このまちに いられるからな
; そう おもってるやつ けっこういるぜ
Message_03_03_06:
#_0BADFC: db $D6, $00, $87, $70, $28 ; place sprite 87 in slot 00 at XY:{70,28}
#_0BAE01: db $29, $38, $2E, $9A ; おとこ:
#_0BAE05: db $F9 ; new line
#_0BAE06: db $F2, $33 ; prewritten text 33
#_0BAE08: db $38, $3A, $CF, $39, $4D, $36, $47, $4C ; とに⎵なるつもり
#_0BAE10: db $39, $52, $2A, $CF, $39, $26, $9C ; なんか⎵ないが
#_0BAE17: db $F9 ; new line
#_0BAE18: db $38, $4C, $25, $28, $A3, $CF, $30, $52 ; とりあえず⎵しん
#_0BAE20: db $A2, $37, $4D, $40, $4C, $CF, $30, $37 ; じてるふり⎵して
#_0BAE28: db $4E, $AB ; れば
#_0BAE2A: db $F9 ; new line
#_0BAE2B: db $2E, $3D, $43, $35, $3A, $CF, $26, $4B ; このまちに⎵いら
#_0BAE33: db $4E, $4D, $2A, $4B, $39 ; れるからな
#_0BAE38: db $FC ; wait for key and new line
#_0BAE39: db $D4, $03 ; set text box size to 3
#_0BAE3B: db $33, $27, $CF, $29, $47, $58, $37, $4D ; そう⎵おもってる
#_0BAE43: db $48, $36, $CF, $2D, $58, $2E, $27, $26 ; やつ⎵けっこうい
#_0BAE4B: db $4D, $A4 ; るぜ
#_0BAE4D: db $FC ; wait for key and new line
#_0BAE4E: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»と:
; なんとしても «カテドラル»を
; わが «ガイアきょう»だんの ものに するのだ
Message_03_03_07:
#_0BAE4F: db $D2, $9E, $08 ; test progress bit 9E for message 08
#_0BAE52: db $D6, $00, $65, $70, $28 ; place sprite 65 in slot 00 at XY:{70,28}
#_0BAE57: db $F2, $34 ; prewritten text 34
#_0BAE59: db $38, $9A ; と:
#_0BAE5B: db $F9 ; new line
#_0BAE5C: db $39, $52, $38, $30, $37, $47, $CF ; なんとしても⎵
#_0BAE63: db $F2, $5C ; prewritten text 5C
#_0BAE65: db $51 ; を
#_0BAE66: db $F9 ; new line
#_0BAE67: db $50, $9C, $CF ; わが⎵
#_0BAE6A: db $F2, $34 ; prewritten text 34
#_0BAE6C: db $A6, $52, $3D, $CF, $47, $3D, $3A, $CF ; だんの⎵ものに⎵
#_0BAE74: db $31, $4D, $3D, $A6 ; するのだ
#_0BAE78: db $FC ; wait for key and new line
#_0BAE79: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»きょうそ:
; みよ! «メシアきょう»とどものいう かみは
; ちじょうに いきるものすべてを
; まっさつしようとしたぞ!
; われらが いきのびるためにも
; «カテドラル»を てに いれるのだ
Message_03_03_08:
#_0BAE7A: db $D6, $00, $84, $70, $28 ; place sprite 84 in slot 00 at XY:{70,28}
#_0BAE7F: db $F2, $34 ; prewritten text 34
#_0BAE81: db $2B, $57, $27, $33, $9A ; きょうそ:
#_0BAE86: db $F9 ; new line
#_0BAE87: db $44, $4A, $94, $CF ; みよ!⎵
#_0BAE8B: db $F2, $33 ; prewritten text 33
#_0BAE8D: db $38, $AA, $47, $3D, $26, $27, $CF, $2A ; とどものいう⎵か
#_0BAE95: db $44, $3E ; みは
#_0BAE97: db $F9 ; new line
#_0BAE98: db $35, $A2, $57, $27, $3A, $CF, $26, $2B ; ちじょうに⎵いき
#_0BAEA0: db $4D, $47, $3D, $31, $AE, $37, $51 ; るものすべてを
#_0BAEA7: db $F9 ; new line
#_0BAEA8: db $43, $58, $2F, $36, $30, $4A, $27, $38 ; まっさつしようと
#_0BAEB0: db $30, $34, $A5, $94 ; したぞ!
#_0BAEB4: db $FC ; wait for key and new line
#_0BAEB5: db $FA ; clear message box
#_0BAEB6: db $50, $4E, $4B, $9C, $CF, $26, $2B, $3D ; われらが⎵いきの
#_0BAEBE: db $AC, $4D, $34, $46, $3A, $47 ; びるためにも
#_0BAEC4: db $F9 ; new line
#_0BAEC5: db $F2, $5C ; prewritten text 5C
#_0BAEC7: db $51, $CF, $37, $3A, $CF, $26, $4E, $4D ; を⎵てに⎵いれる
#_0BAECF: db $3D, $A6 ; のだ
#_0BAED1: db $FC ; wait for key and new line
#_0BAED2: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»と:
; «われわれ»の «カテドラル»のっとりさくせんは
; せいこうした
Message_03_03_09:
#_0BAED3: db $D6, $00, $65, $70, $28 ; place sprite 65 in slot 00 at XY:{70,28}
#_0BAED8: db $F2, $34 ; prewritten text 34
#_0BAEDA: db $38, $9A ; と:
#_0BAEDC: db $F9 ; new line
#_0BAEDD: db $F2, $02 ; prewritten text 02
#_0BAEDF: db $3D, $CF ; の⎵
#_0BAEE1: db $F2, $5C ; prewritten text 5C
#_0BAEE3: db $3D, $58, $38, $4C, $2F, $2C, $32, $52 ; のっとりさくせん
#_0BAEEB: db $3E ; は
#_0BAEEC: db $F9 ; new line
#_0BAEED: db $32, $26, $2E, $27, $30, $34 ; せいこうした
#_0BAEF3: db $FC ; wait for key and new line
#_0BAEF4: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»と:
; «カテドラル»のなかには
; したっぱの アクマだけじゃなくて
; カオスの おおものアクマも きてるのよ
; きょうそさまから ないしょで きいたのよ
Message_03_03_0A:
#_0BAEF5: db $D6, $00, $8A, $70, $28 ; place sprite 8A in slot 00 at XY:{70,28}
#_0BAEFA: db $F2, $34 ; prewritten text 34
#_0BAEFC: db $38, $9A ; と:
#_0BAEFE: db $F9 ; new line
#_0BAEFF: db $F2, $5C ; prewritten text 5C
#_0BAF01: db $3D, $39, $2A, $3A, $3E ; のなかには
#_0BAF06: db $F9 ; new line
#_0BAF07: db $30, $34, $58, $B0, $3D, $CF, $5D, $64 ; したっぱの⎵アク
#_0BAF0F: db $7B, $A6, $2D, $A2, $55, $39, $2C, $37 ; マだけじゃなくて
#_0BAF17: db $F9 ; new line
#_0BAF18: db $62, $61, $69, $3D, $CF, $29, $29, $47 ; カオスの⎵おおも
#_0BAF20: db $3D, $5D, $64, $7B, $47, $CF, $2B, $37 ; のアクマも⎵きて
#_0BAF28: db $4D, $3D, $4A ; るのよ
#_0BAF2B: db $FC ; wait for key and new line
#_0BAF2C: db $FA ; clear message box
#_0BAF2D: db $2B, $57, $27, $33, $2F, $43, $2A, $4B ; きょうそさまから
#_0BAF35: db $CF, $39, $26, $30, $57, $A9, $CF, $2B ; ⎵ないしょで⎵き
#_0BAF3D: db $26, $34, $3D, $4A ; いたのよ
#_0BAF41: db $FC ; wait for key and new line
#_0BAF42: db $FF ; end of message

;===================================================================================================

; «ガイアきょう»と:
; «メシアきょう»とは まぎれこんで ねえだろうな!
; みつけたら たたじゃおかねえよ!
Message_03_03_0B:
#_0BAF43: db $D6, $00, $0A, $70, $28 ; place sprite 0A in slot 00 at XY:{70,28}
#_0BAF48: db $F2, $34 ; prewritten text 34
#_0BAF4A: db $38, $9A ; と:
#_0BAF4C: db $F9 ; new line
#_0BAF4D: db $F2, $33 ; prewritten text 33
#_0BAF4F: db $38, $3E, $CF, $43, $9D, $4E, $2E, $52 ; とは⎵まぎれこん
#_0BAF57: db $A9, $CF, $3C, $28, $A6, $4F, $27, $39 ; で⎵ねえだろうな
#_0BAF5F: db $94 ; !
#_0BAF60: db $F9 ; new line
#_0BAF61: db $44, $36, $2D, $34, $4B, $CF, $34, $34 ; みつけたら⎵たた
#_0BAF69: db $A2, $55, $29, $2A, $3C, $28, $4A, $94 ; じゃおかねえよ!
#_0BAF71: db $FC ; wait for key and new line
#_0BAF72: db $D2, $9E, $0C ; test progress bit 9E for message 0C
#_0BAF75: db $FF ; end of message

;===================================================================================================

; どうせ こんどの だいこうずいだって
; やつらの しわざに きまってる
Message_03_03_0C:
#_0BAF76: db $FA ; clear message box
#_0BAF77: db $AA, $27, $32, $CF, $2E, $52, $AA, $3D ; どうせ⎵こんどの
#_0BAF7F: db $CF, $A6, $26, $2E, $27, $A3, $26, $A6 ; ⎵だいこうずいだ
#_0BAF87: db $58, $37 ; って
#_0BAF89: db $F9 ; new line
#_0BAF8A: db $48, $36, $4B, $3D, $CF, $30, $50, $A1 ; やつらの⎵しわざ
#_0BAF92: db $3A, $CF, $2B, $43, $58, $37, $4D ; に⎵きまってる
#_0BAF99: db $FC ; wait for key and new line
#_0BAF9A: db $FF ; end of message

;===================================================================================================

; おんな:
; ここに くれば なにか ひとしょうばい
; できるかって おもったんだけど«・・・»
; いいばしょは みんな とられちまってるよ
Message_03_03_0D:
#_0BAF9B: db $D6, $00, $88, $70, $28 ; place sprite 88 in slot 00 at XY:{70,28}
#_0BAFA0: db $29, $52, $39, $9A ; おんな:
#_0BAFA4: db $F9 ; new line
#_0BAFA5: db $D2, $9E, $0E ; test progress bit 9E for message 0E
#_0BAFA8: db $2E, $2E, $3A, $CF, $2C, $4E, $AB, $CF ; ここに⎵くれば⎵
#_0BAFB0: db $39, $3A, $2A, $CF, $3F, $38, $30, $57 ; なにか⎵ひとしょ
#_0BAFB8: db $27, $AB, $26 ; うばい
#_0BAFBB: db $F9 ; new line
#_0BAFBC: db $A9, $2B, $4D, $2A, $58, $37, $CF, $29 ; できるかって⎵お
#_0BAFC4: db $47, $58, $34, $52, $A6, $2D, $AA ; もったんだけど
#_0BAFCB: db $F2, $0B ; prewritten text 0B
#_0BAFCD: db $FC ; wait for key and new line
#_0BAFCE: db $FA ; clear message box
#_0BAFCF: db $26, $26, $AB, $30, $57, $3E, $CF, $44 ; いいばしょは⎵み
#_0BAFD7: db $52, $39, $CF, $38, $4B, $4E, $35, $43 ; んな⎵とられちま
#_0BAFDF: db $58, $37, $4D, $4A ; ってるよ
#_0BAFE3: db $FC ; wait for key and new line
#_0BAFE4: db $FF ; end of message

;===================================================================================================

; もし «トウキョウ»に のこってたら
; あたしも いまごろ うみのそこだったよ
Message_03_03_0E:
#_0BAFE5: db $47, $30, $CF ; もし⎵
#_0BAFE8: db $F2, $1C ; prewritten text 1C
#_0BAFEA: db $3A, $CF, $3D, $2E, $58, $37, $34, $4B ; に⎵のこってたら
#_0BAFF2: db $F9 ; new line
#_0BAFF3: db $25, $34, $30, $47, $CF, $26, $43, $A0 ; あたしも⎵いまご
#_0BAFFB: db $4F, $CF, $27, $44, $3D, $33, $2E, $A6 ; ろ⎵うみのそこだ
#_0BB003: db $58, $34, $4A ; ったよ
#_0BB006: db $FC ; wait for key and new line
#_0BB007: db $FF ; end of message

;===================================================================================================

; >
Message_03_03_0F:
#_0BB008: db $97 ; >
#_0BB009: db $D2, $CD, $12 ; test progress bit CD for message 12
#_0BB00C: db $D2, $CE, $12 ; test progress bit CE for message 12

;===================================================================================================

; りょうがわから こえがきこえる
; どちらも ききおぼえの あるこえだ
; みぎからのこえ:
; [CHASE]くん!
; まだ まよっているのですか?
; よく かんがえなおして ください!
; ひだりからのこえ:
; そんな ぎぜんしゃの いうことを きくな!
; ちからが なければ なにも できないことは
; さんざん みてきただろう
Message_03_03_10:
#_0BB00F: db $D2, $D3, $11 ; test progress bit D3 for message 11
#_0BB012: db $4C, $57, $27, $9C, $50, $2A, $4B, $CF ; りょうがわから⎵
#_0BB01A: db $2E, $28, $9C, $2B, $2E, $28, $4D ; こえがきこえる
#_0BB021: db $F9 ; new line
#_0BB022: db $AA, $35, $4B, $47, $CF, $2B, $2B, $29 ; どちらも⎵ききお
#_0BB02A: db $AF, $28, $3D, $CF, $25, $4D, $2E, $28 ; ぼえの⎵あるこえ
#_0BB032: db $A6 ; だ
#_0BB033: db $FC ; wait for key and new line
#_0BB034: db $FA ; clear message box
#_0BB035: db $44, $9D, $2A, $4B, $3D, $2E, $28, $9A ; みぎからのこえ:
#_0BB03D: db $F9 ; new line
#_0BB03E: db $F0 ; write player name
#_0BB03F: db $2C, $52, $94 ; くん!
#_0BB042: db $F9 ; new line
#_0BB043: db $43, $A6, $CF, $43, $4A, $58, $37, $26 ; まだ⎵まよってい
#_0BB04B: db $4D, $3D, $A9, $31, $2A, $95 ; るのですか?
#_0BB051: db $F9 ; new line
#_0BB052: db $4A, $2C, $CF, $2A, $52, $9C, $28, $39 ; よく⎵かんがえな
#_0BB05A: db $29, $30, $37, $CF, $2C, $A6, $2F, $26 ; おして⎵ください
#_0BB062: db $94 ; !
#_0BB063: db $FC ; wait for key and new line
#_0BB064: db $FA ; clear message box
#_0BB065: db $3F, $A6, $4C, $2A, $4B, $3D, $2E, $28 ; ひだりからのこえ
#_0BB06D: db $9A ; :
#_0BB06E: db $F9 ; new line
#_0BB06F: db $33, $52, $39, $CF, $9D, $A4, $52, $30 ; そんな⎵ぎぜんし
#_0BB077: db $55, $3D, $CF, $26, $27, $2E, $38, $51 ; ゃの⎵いうことを
#_0BB07F: db $CF, $2B, $2C, $39, $94 ; ⎵きくな!
#_0BB084: db $F9 ; new line
#_0BB085: db $35, $2A, $4B, $9C, $CF, $39, $2D, $4E ; ちからが⎵なけれ
#_0BB08D: db $AB, $CF, $39, $3A, $47, $CF, $A9, $2B ; ば⎵なにも⎵でき
#_0BB095: db $39, $26, $2E, $38, $3E ; ないことは
#_0BB09A: db $F9 ; new line
#_0BB09B: db $2F, $52, $A1, $52, $CF, $44, $37, $2B ; さんざん⎵みてき
#_0BB0A3: db $34, $A6, $4F, $27 ; ただろう
#_0BB0A7: db $FC ; wait for key and new line
#_0BB0A8: db $D0, $D3 ; set progress bit D3
#_0BB0AA: db $FF ; end of message

;===================================================================================================

; [JIMMY]と [HIM]との
; いいあらそいが つづいている
Message_03_03_11:
#_0BB0AB: db $EE ; write lawful hero name
#_0BB0AC: db $38, $CF ; と⎵
#_0BB0AE: db $EF ; write chaos hero name
#_0BB0AF: db $38, $3D ; との
#_0BB0B1: db $F9 ; new line
#_0BB0B2: db $26, $26, $25, $4B, $33, $26, $9C, $CF ; いいあらそいが⎵
#_0BB0BA: db $36, $A8, $26, $37, $26, $4D ; つづいている
#_0BB0C0: db $FC ; wait for key and new line
#_0BB0C1: db $FF ; end of message

;===================================================================================================

Message_03_03_12:
#_0BB0C2: db $D2, $CD, $13 ; test progress bit CD for message 13
#_0BB0C5: db $D3, $14 ; go to message 14

;===================================================================================================

; もう みぎからのこえは きこえない
Message_03_03_13:
#_0BB0C7: db $47, $27, $CF, $44, $9D, $2A, $4B, $3D ; もう⎵みぎからの
#_0BB0CF: db $2E, $28, $3E, $CF, $2B, $2E, $28, $39 ; こえは⎵きこえな
#_0BB0D7: db $26 ; い
#_0BB0D8: db $FC ; wait for key and new line
#_0BB0D9: db $D2, $CE, $14 ; test progress bit CE for message 14
#_0BB0DC: db $D3, $15 ; go to message 15

;===================================================================================================

; もう ひだりからのこえは きこえない
Message_03_03_14:
#_0BB0DE: db $47, $27, $CF, $3F, $A6, $4C, $2A, $4B ; もう⎵ひだりから
#_0BB0E6: db $3D, $2E, $28, $3E, $CF, $2B, $2E, $28 ; のこえは⎵きこえ
#_0BB0EE: db $39, $26 ; ない
#_0BB0F0: db $FC ; wait for key and new line

;===================================================================================================

Message_03_03_15:
#_0BB0F1: db $D2, $CD, $16 ; test progress bit CD for message 16
#_0BB0F4: db $FF ; end of message

;===================================================================================================

Message_03_03_16:
#_0BB0F5: db $D2, $CE, $17 ; test progress bit CE for message 17
#_0BB0F8: db $FF ; end of message

;===================================================================================================

; こえ:
; そのまま まえに すすめ«・・・»
Message_03_03_17:
#_0BB0F9: db $FA ; clear message box
#_0BB0FA: db $2E, $28, $9A ; こえ:
#_0BB0FD: db $F9 ; new line
#_0BB0FE: db $33, $3D, $43, $43, $CF, $43, $28, $3A ; そのまま⎵まえに
#_0BB106: db $CF, $31, $31, $46 ; ⎵すすめ
#_0BB10A: db $F2, $0B ; prewritten text 0B
#_0BB10C: db $FC ; wait for key and new line
#_0BB10D: db $FF ; end of message

;===================================================================================================

; [JIMMY]のこえ:
; いくら よびかけても
; [HIM]くんは きいてくれません
; かれは アクマに たましいを
; うりわたして しまったんでしょうか
Message_03_03_18:
#_0BB10E: db $D2, $CD, $19 ; test progress bit CD for message 19
#_0BB111: db $EE ; write lawful hero name
#_0BB112: db $3D, $2E, $28, $9A ; のこえ:
#_0BB116: db $F9 ; new line
#_0BB117: db $26, $2C, $4B, $CF, $4A, $AC, $2A, $2D ; いくら⎵よびかけ
#_0BB11F: db $37, $47 ; ても
#_0BB121: db $F9 ; new line
#_0BB122: db $EF ; write chaos hero name
#_0BB123: db $2C, $52, $3E, $CF, $2B, $26, $37, $2C ; くんは⎵きいてく
#_0BB12B: db $4E, $43, $32, $52 ; れません
#_0BB12F: db $F9 ; new line
#_0BB130: db $2A, $4E, $3E, $CF, $5D, $64, $7B, $3A ; かれは⎵アクマに
#_0BB138: db $CF, $34, $43, $30, $26, $51 ; ⎵たましいを
#_0BB13E: db $F9 ; new line
#_0BB13F: db $27, $4C, $50, $34, $30, $37, $CF, $30 ; うりわたして⎵し
#_0BB147: db $43, $58, $34, $52, $A9, $30, $57, $27 ; まったんでしょう
#_0BB14F: db $2A ; か
#_0BB150: db $FC ; wait for key and new line
#_0BB151: db $FF ; end of message

;===================================================================================================

; >[JIMMY]は もう いないようだ
Message_03_03_19:
#_0BB152: db $97 ; >
#_0BB153: db $EE ; write lawful hero name
#_0BB154: db $3E, $CF, $47, $27, $CF, $26, $39, $26 ; は⎵もう⎵いない
#_0BB15C: db $4A, $27, $A6 ; ようだ
#_0BB15F: db $FC ; wait for key and new line
#_0BB160: db $FF ; end of message

;===================================================================================================

; [HIM]のこえ:
; [JIMMY]のやつは
; かみや テンシたちのいうことを
; うのみに してるだけだ
; まるで じぶんで かんがえることを
; やめちまってる みたいだ
Message_03_03_1A:
#_0BB161: db $D2, $CE, $1B ; test progress bit CE for message 1B
#_0BB164: db $EF ; write chaos hero name
#_0BB165: db $3D, $2E, $28, $9A ; のこえ:
#_0BB169: db $F9 ; new line
#_0BB16A: db $EE ; write lawful hero name
#_0BB16B: db $3D, $48, $36, $3E ; のやつは
#_0BB16F: db $F9 ; new line
#_0BB170: db $2A, $44, $48, $CF, $6F, $8A, $68, $34 ; かみや⎵テンシた
#_0BB178: db $35, $3D, $26, $27, $2E, $38, $51 ; ちのいうことを
#_0BB17F: db $F9 ; new line
#_0BB180: db $27, $3D, $44, $3A, $CF, $30, $37, $4D ; うのみに⎵してる
#_0BB188: db $A6, $2D, $A6 ; だけだ
#_0BB18B: db $F9 ; new line
#_0BB18C: db $43, $4D, $A9, $CF, $A2, $AD, $52, $A9 ; まるで⎵じぶんで
#_0BB194: db $CF, $2A, $52, $9C, $28, $4D, $2E, $38 ; ⎵かんがえること
#_0BB19C: db $51 ; を
#_0BB19D: db $F9 ; new line
#_0BB19E: db $48, $46, $35, $43, $58, $37, $4D, $CF ; やめちまってる⎵
#_0BB1A6: db $44, $34, $26, $A6 ; みたいだ
#_0BB1AA: db $FC ; wait for key and new line
#_0BB1AB: db $FF ; end of message

;===================================================================================================

; >[HIM]は もう いないようだ
Message_03_03_1B:
#_0BB1AC: db $97 ; >
#_0BB1AD: db $EF ; write chaos hero name
#_0BB1AE: db $3E, $CF, $47, $27, $CF, $26, $39, $26 ; は⎵もう⎵いない
#_0BB1B6: db $4A, $27, $A6 ; ようだ
#_0BB1B9: db $FC ; wait for key and new line
#_0BB1BA: db $FF ; end of message

;===================================================================================================

Message_03_03_1C:
#_0BB1BB: db $D2, $B6, $1D ; test progress bit B6 for message 1D
#_0BB1BE: db $FE, $6C, $02 ; ext command 6C: R0F903F [02] TODO

;===================================================================================================

Message_03_03_1D:
#_0BB1C1: db $D2, $C7, $1E ; test progress bit C7 for message 1E
#_0BB1C4: db $FE, $6C, $01 ; ext command 6C: R0F903F [01] TODO

;===================================================================================================

Message_03_03_1E:
#_0BB1C7: db $FE, $6C, $00 ; ext command 6C: R0F903F [00] TODO

;===================================================================================================

; >
Message_03_04_00:
#_0BB1CA: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BB1CF: db $97 ; >
#_0BB1D0: db $D2, $97, $01 ; test progress bit 97 for message 01
#_0BB1D3: db $D2, $98, $01 ; test progress bit 98 for message 01
#_0BB1D6: db $D3, $02 ; go to message 02

;===================================================================================================

; «なかに はいりますか?»
Message_03_04_01:
#_0BB1D8: db $F2, $68 ; prewritten text 68
#_0BB1DA: db $F8, $03 ; YES/NO - go to message 03 if YES
#_0BB1DC: db $FF ; end of message

;===================================================================================================

; «とびらは とざされている»
Message_03_04_02:
#_0BB1DD: db $F2, $69 ; prewritten text 69
#_0BB1DF: db $FC ; wait for key and new line
#_0BB1E0: db $FF ; end of message

;===================================================================================================

Message_03_04_03:
#_0BB1E1: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BB1E6: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BB1E9: db $D6, $00, $00 ; delete sprite in slot 00
#_0BB1EC: db $FE, $1A, $3E, $30, $08, $00, $00, $00 ; ext command 1A: 3E,30,08,00,00,00

;===================================================================================================

; [DEMON1]:
; めのまえに ニンゲンが あらわれるのも
; ひさしく なかった
; だが いまの われには
; しゅくてき ラーヴァナを たおすことよりほか
; のぞみは あらず
; ラーヴァナは かみが «カテドラル»へと
; おりたつまえに たちふさがるもの
; なんとしても とりのぞかねば ならぬ
; そして わがまえに たちふさがる
; こしゃくな ニンゲンも!
Message_03_04_04:
#_0BB1F4: db $D5, $45 ; send 45 to APU
#_0BB1F6: db $D7, $2D ; load scene 2D
#_0BB1F8: db $D4, $03 ; set text box size to 3
#_0BB1FA: db $FE, $3A, $02, $03 ; ext command 3A: 02 03 TODO
#_0BB1FE: db $FE, $07, $7F ; ext command 07: draw buffered text then wait 126 frames
#_0BB201: db $D2, $C9, $0F ; test progress bit C9 for message 0F
#_0BB204: db $D2, $CB, $0F ; test progress bit CB for message 0F
#_0BB207: db $DE, $01, $00, $12, $01 ; load 1x demon 0112
#_0BB20C: db $E4, $00 ; load demon $00
#_0BB20E: db $F5 ; write demon name from $050A
#_0BB20F: db $9A ; :
#_0BB210: db $F9 ; new line
#_0BB211: db $D2, $88, $06 ; test progress bit 88 for message 06
#_0BB214: db $FE, $04, $05, $09 ; ext command 04: message 05 if 11C >= 112; 09 if >= 144
#_0BB218: db $46, $3D, $43, $28, $3A, $CF, $72, $8A ; めのまえに⎵ニン
#_0BB220: db $B8, $8A, $9C, $CF, $25, $4B, $50, $4E ; ゲンが⎵あらわれ
#_0BB228: db $4D, $3D, $47 ; るのも
#_0BB22B: db $F9 ; new line
#_0BB22C: db $3F, $2F, $30, $2C, $CF, $39, $2A, $58 ; ひさしく⎵なかっ
#_0BB234: db $34 ; た
#_0BB235: db $FC ; wait for key and new line
#_0BB236: db $FA ; clear message box
#_0BB237: db $D2, $CA, $09 ; test progress bit CA for message 09
#_0BB23A: db $A6, $9C, $CF, $26, $43, $3D, $CF, $50 ; だが⎵いまの⎵わ
#_0BB242: db $4E, $3A, $3E ; れには
#_0BB245: db $F9 ; new line
#_0BB246: db $30, $56, $2C, $37, $2B, $CF, $83, $5A ; しゅくてき⎵ラー
#_0BB24E: db $CE, $8B, $71, $51, $CF, $34, $29, $31 ; ヴァナを⎵たおす
#_0BB256: db $2E, $38, $4A, $4C, $42, $2A ; ことよりほか
#_0BB25C: db $F9 ; new line
#_0BB25D: db $3D, $A5, $44, $3E, $CF, $25, $4B, $A3 ; のぞみは⎵あらず
#_0BB265: db $FC ; wait for key and new line
#_0BB266: db $FA ; clear message box
#_0BB267: db $83, $5A, $CE, $8B, $71, $3E, $CF, $2A ; ラーヴァナは⎵か
#_0BB26F: db $44, $9C, $CF ; みが⎵
#_0BB272: db $F2, $5C ; prewritten text 5C
#_0BB274: db $41, $38 ; へと
#_0BB276: db $F9 ; new line
#_0BB277: db $29, $4C, $34, $36, $43, $28, $3A, $CF ; おりたつまえに⎵
#_0BB27F: db $34, $35, $40, $2F, $9C, $4D, $47, $3D ; たちふさがるもの
#_0BB287: db $F9 ; new line
#_0BB288: db $39, $52, $38, $30, $37, $47, $CF, $38 ; なんとしても⎵と
#_0BB290: db $4C, $3D, $A5, $2A, $3C, $AB, $CF, $39 ; りのぞかねば⎵な
#_0BB298: db $4B, $3B ; らぬ
#_0BB29A: db $FC ; wait for key and new line
#_0BB29B: db $FA ; clear message box
#_0BB29C: db $33, $30, $37, $CF, $50, $9C, $43, $28 ; そして⎵わがまえ
#_0BB2A4: db $3A, $CF, $34, $35, $40, $2F, $9C, $4D ; に⎵たちふさがる
#_0BB2AC: db $F9 ; new line
#_0BB2AD: db $2E, $30, $55, $2C, $39, $CF, $72, $8A ; こしゃくな⎵ニン
#_0BB2B5: db $B8, $8A, $47, $94 ; ゲンも!
#_0BB2B9: db $FC ; wait for key and new line
#_0BB2BA: db $D3, $0A ; go to message 0A

;===================================================================================================

; おお そなたこそ
; わが ちから たくすに あたいする ニンゲン
; ともに たたかい ラーヴァナを ほうむり
Message_03_04_05:
#_0BB2BC: db $29, $29, $CF, $33, $39, $34, $2E, $33 ; おお⎵そなたこそ
#_0BB2C4: db $F9 ; new line
#_0BB2C5: db $50, $9C, $CF, $35, $2A, $4B, $CF, $34 ; わが⎵ちから⎵た
#_0BB2CD: db $2C, $31, $3A, $CF, $25, $34, $26, $31 ; くすに⎵あたいす
#_0BB2D5: db $4D, $CF, $72, $8A, $B8, $8A ; る⎵ニンゲン
#_0BB2DB: db $F9 ; new line
#_0BB2DC: db $D2, $CA, $06 ; test progress bit CA for message 06
#_0BB2DF: db $38, $47, $3A, $CF, $34, $34, $2A, $26 ; ともに⎵たたかい
#_0BB2E7: db $CF, $83, $5A, $CE, $8B, $71, $51, $CF ; ⎵ラーヴァナを⎵
#_0BB2EF: db $42, $27, $45, $4C ; ほうむり
#_0BB2F3: db $F9 ; new line

;===================================================================================================

; みごと «カテドラル»へ
; かみの みちを ひらこう
Message_03_04_06:
#_0BB2F4: db $44, $A0, $38, $CF ; みごと⎵
#_0BB2F8: db $F2, $5C ; prewritten text 5C
#_0BB2FA: db $41 ; へ
#_0BB2FB: db $F9 ; new line
#_0BB2FC: db $2A, $44, $3D, $CF, $44, $35, $51, $CF ; かみの⎵みちを⎵
#_0BB304: db $3F, $4B, $2E, $27 ; ひらこう
#_0BB308: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]は «ナカマに くわわった»
Message_03_04_07:
#_0BB309: db $D4, $03 ; set text box size to 3
#_0BB30B: db $FE, $09, $08 ; ext command 09: demon joins party or message 08 if full
#_0BB30E: db $97 ; >
#_0BB30F: db $F5 ; write demon name from $050A
#_0BB310: db $3E, $CF ; は⎵
#_0BB312: db $F2, $2F ; prewritten text 2F
#_0BB314: db $FC ; wait for key and new line
#_0BB315: db $DE, $00, $00, $00, $01 ; load 1x demon 0000
#_0BB31A: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BB31D: db $D0, $CB ; set progress bit CB
#_0BB31F: db $D3, $0D ; go to message 0D

;===================================================================================================

; «では ナカマを へらして»こい
Message_03_04_08:
#_0BB321: db $F2, $43 ; prewritten text 43
#_0BB323: db $2E, $26 ; こい
#_0BB325: db $FC ; wait for key and new line
#_0BB326: db $D0, $88 ; set progress bit 88
#_0BB328: db $D3, $0D ; go to message 0D

;===================================================================================================

; おのれ ニンゲンの ぶんざいで
; わがまえに たちふさがるとは
; そなたは ラーヴァナの けしんか!?
Message_03_04_09:
#_0BB32A: db $29, $3D, $4E, $CF, $72, $8A, $B8, $8A ; おのれ⎵ニンゲン
#_0BB332: db $3D, $CF, $AD, $52, $A1, $26, $A9 ; の⎵ぶんざいで
#_0BB339: db $F9 ; new line
#_0BB33A: db $50, $9C, $43, $28, $3A, $CF, $34, $35 ; わがまえに⎵たち
#_0BB342: db $40, $2F, $9C, $4D, $38, $3E ; ふさがるとは
#_0BB348: db $F9 ; new line
#_0BB349: db $33, $39, $34, $3E, $CF, $83, $5A, $CE ; そなたは⎵ラーヴ
#_0BB351: db $8B, $71, $3D, $CF, $2D, $30, $52, $2A ; ァナの⎵けしんか
#_0BB359: db $94, $95 ; !?
#_0BB35B: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_0A:
#_0BB35C: db $D5, $39 ; send 39 to APU
#_0BB35E: db $E5, $01, $0C ; [COMMAND E5:01,0C]

;===================================================================================================

Message_03_04_0B:
#_0BB361: db $E5, $00, $0C ; [COMMAND E5:00,0C]
#_0BB364: db $D3, $0B ; go to message 0B

;===================================================================================================

; かみでも アクマでもない
; まして ラーヴァナの けしんですらない
; ただの ニンゲンに まけるとは«・・・»
Message_03_04_0C:
#_0BB366: db $2A, $44, $A9, $47, $CF, $5D, $64, $7B ; かみでも⎵アクマ
#_0BB36E: db $A9, $47, $39, $26 ; でもない
#_0BB372: db $F9 ; new line
#_0BB373: db $43, $30, $37, $CF, $83, $5A, $CE, $8B ; まして⎵ラーヴァ
#_0BB37B: db $71, $3D, $CF, $2D, $30, $52, $A9, $31 ; ナの⎵けしんです
#_0BB383: db $4B, $39, $26 ; らない
#_0BB386: db $F9 ; new line
#_0BB387: db $34, $A6, $3D, $CF, $72, $8A, $B8, $8A ; ただの⎵ニンゲン
#_0BB38F: db $3A, $CF, $43, $2D, $4D, $38, $3E ; に⎵まけるとは
#_0BB396: db $F2, $0B ; prewritten text 0B
#_0BB398: db $FC ; wait for key and new line
#_0BB399: db $D0, $C9 ; set progress bit C9

;===================================================================================================

Message_03_04_0D:
#_0BB39B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BB39D: db $D2, $CA, $0E ; test progress bit CA for message 0E
#_0BB3A0: db $D2, $CC, $0E ; test progress bit CC for message 0E
#_0BB3A3: db $D3, $10 ; go to message 10

;===================================================================================================

Message_03_04_0E:
#_0BB3A5: db $D0, $9D ; set progress bit 9D
#_0BB3A7: db $D3, $10 ; go to message 10

;===================================================================================================

; >«だれもいない»
Message_03_04_0F:
#_0BB3A9: db $97 ; >
#_0BB3AA: db $F2, $2C ; prewritten text 2C
#_0BB3AC: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_10:
#_0BB3AD: db $FE, $1A, $3E, $B1, $08, $00, $00, $00 ; ext command 1A: 3E,B1,08,00,00,00
#_0BB3B5: db $FF ; end of message

;===================================================================================================

; >
Message_03_04_11:
#_0BB3B6: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BB3BB: db $97 ; >
#_0BB3BC: db $D2, $97, $12 ; test progress bit 97 for message 12
#_0BB3BF: db $D2, $98, $12 ; test progress bit 98 for message 12
#_0BB3C2: db $D3, $13 ; go to message 13

;===================================================================================================

; «なかに はいりますか?»
Message_03_04_12:
#_0BB3C4: db $F2, $68 ; prewritten text 68
#_0BB3C6: db $F8, $14 ; YES/NO - go to message 14 if YES
#_0BB3C8: db $FF ; end of message

;===================================================================================================

; «とびらは とざされている»
Message_03_04_13:
#_0BB3C9: db $F2, $69 ; prewritten text 69
#_0BB3CB: db $FC ; wait for key and new line
#_0BB3CC: db $FF ; end of message

;===================================================================================================

Message_03_04_14:
#_0BB3CD: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BB3D2: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BB3D5: db $D6, $00, $00 ; delete sprite in slot 00
#_0BB3D8: db $FE, $1A, $61, $30, $08, $00, $00, $00 ; ext command 1A: 61,30,08,00,00,00

;===================================================================================================

; [DEMON1]:
; ニンゲンか«・・・»きけ!
; われは いま ヴィシュヌと
; さいごの けっちゃくを つけんと するところ
; われ ここに たおれれば
; てんくうより «カテドラル»まで
; さえぎるものなし
Message_03_04_15:
#_0BB3E0: db $D5, $46 ; send 46 to APU
#_0BB3E2: db $D7, $2E ; load scene 2E
#_0BB3E4: db $D4, $03 ; set text box size to 3
#_0BB3E6: db $FE, $3A, $02, $03 ; ext command 3A: 02 03 TODO
#_0BB3EA: db $FE, $07, $7F ; ext command 07: draw buffered text then wait 126 frames
#_0BB3ED: db $D2, $CA, $24 ; test progress bit CA for message 24
#_0BB3F0: db $D2, $CC, $24 ; test progress bit CC for message 24
#_0BB3F3: db $DE, $01, $00, $13, $01 ; load 1x demon 0113
#_0BB3F8: db $E4, $00 ; load demon $00
#_0BB3FA: db $F5 ; write demon name from $050A
#_0BB3FB: db $9A ; :
#_0BB3FC: db $F9 ; new line
#_0BB3FD: db $D2, $89, $18 ; test progress bit 89 for message 18
#_0BB400: db $FE, $04, $1B, $17 ; ext command 04: message 1B if 11C >= 112; 17 if >= 144
#_0BB404: db $72, $8A, $B8, $8A, $2A ; ニンゲンか
#_0BB409: db $F2, $0B ; prewritten text 0B
#_0BB40B: db $D2, $C9, $16 ; test progress bit C9 for message 16
#_0BB40E: db $2B, $2D, $94 ; きけ!
#_0BB411: db $F9 ; new line
#_0BB412: db $50, $4E, $3E, $CF, $26, $43, $CF, $CE ; われは⎵いま⎵ヴ
#_0BB41A: db $8C, $68, $90, $73, $38 ; ィシュヌと
#_0BB41F: db $F9 ; new line
#_0BB420: db $2F, $26, $A0, $3D, $CF, $2D, $58, $35 ; さいごの⎵けっち
#_0BB428: db $55, $2C, $51, $CF, $36, $2D, $52, $38 ; ゃくを⎵つけんと
#_0BB430: db $CF, $31, $4D, $38, $2E, $4F ; ⎵するところ
#_0BB436: db $FC ; wait for key and new line
#_0BB437: db $FA ; clear message box
#_0BB438: db $50, $4E, $CF, $2E, $2E, $3A, $CF, $34 ; われ⎵ここに⎵た
#_0BB440: db $29, $4E, $4E, $AB ; おれれば
#_0BB444: db $F9 ; new line
#_0BB445: db $37, $52, $2C, $27, $4A, $4C, $CF ; てんくうより⎵
#_0BB44C: db $F2, $5C ; prewritten text 5C
#_0BB44E: db $43, $A9 ; まで
#_0BB450: db $F9 ; new line
#_0BB451: db $2F, $28, $9D, $4D, $47, $3D, $39, $30 ; さえぎるものなし
#_0BB459: db $FC ; wait for key and new line
#_0BB45A: db $FA ; clear message box
#_0BB45B: db $D3, $1B ; go to message 1B

;===================================================================================================

; ヴィシュヌしんを たおすとは
Message_03_04_16:
#_0BB45D: db $CE, $8C, $68, $90, $73, $30, $52, $51 ; ヴィシュヌしんを
#_0BB465: db $CF, $34, $29, $31, $38, $3E ; ⎵たおすとは
#_0BB46B: db $F9 ; new line
#_0BB46C: db $D3, $1C ; go to message 1C

;===================================================================================================

; ヴィシュヌしんは つよい
; そなたの ちから かしてくれ!
Message_03_04_17:
#_0BB46E: db $D2, $C9, $18 ; test progress bit C9 for message 18
#_0BB471: db $CE, $8C, $68, $90, $73, $30, $52, $3E ; ヴィシュヌしんは
#_0BB479: db $CF, $36, $4A, $26 ; ⎵つよい
#_0BB47D: db $F9 ; new line
#_0BB47E: db $33, $39, $34, $3D, $CF, $35, $2A, $4B ; そなたの⎵ちから
#_0BB486: db $CF, $2A, $30, $37, $2C, $4E, $94 ; ⎵かしてくれ!
#_0BB48D: db $F9 ; new line

;===================================================================================================

; われは そなたの ナカマと なろう
; そして ともに たたかおう
; かみの いんぼうを たたきつぶすため
Message_03_04_18:
#_0BB48E: db $50, $4E, $3E, $CF, $33, $39, $34, $3D ; われは⎵そなたの
#_0BB496: db $CF, $71, $62, $7B, $38, $CF, $39, $4F ; ⎵ナカマと⎵なろ
#_0BB49E: db $27 ; う
#_0BB49F: db $F9 ; new line
#_0BB4A0: db $33, $30, $37, $CF, $38, $47, $3A, $CF ; そして⎵ともに⎵
#_0BB4A8: db $34, $34, $2A, $29, $27 ; たたかおう
#_0BB4AD: db $F9 ; new line
#_0BB4AE: db $2A, $44, $3D, $CF, $26, $52, $AF, $27 ; かみの⎵いんぼう
#_0BB4B6: db $51, $CF, $34, $34, $2B, $36, $AD, $31 ; を⎵たたきつぶす
#_0BB4BE: db $34, $46 ; ため
#_0BB4C0: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]は «ナカマに くわわった»
Message_03_04_19:
#_0BB4C1: db $FA ; clear message box
#_0BB4C2: db $FE, $09, $1A ; ext command 09: demon joins party or message 1A if full
#_0BB4C5: db $97 ; >
#_0BB4C6: db $F5 ; write demon name from $050A
#_0BB4C7: db $3E, $CF ; は⎵
#_0BB4C9: db $F2, $2F ; prewritten text 2F
#_0BB4CB: db $FC ; wait for key and new line
#_0BB4CC: db $DE, $00, $00, $11, $01 ; load 1x demon 0011
#_0BB4D1: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BB4D4: db $D0, $CC ; set progress bit CC
#_0BB4D6: db $D3, $22 ; go to message 22

;===================================================================================================

; «では ナカマを へらして»くれば くわわろう
Message_03_04_1A:
#_0BB4D8: db $F2, $43 ; prewritten text 43
#_0BB4DA: db $2C, $4E, $AB, $CF, $2C, $50, $50, $4F ; くれば⎵くわわろ
#_0BB4E2: db $27 ; う
#_0BB4E3: db $FC ; wait for key and new line
#_0BB4E4: db $D0, $89 ; set progress bit 89
#_0BB4E6: db $D3, $21 ; go to message 21

;===================================================================================================

; わたしに たちむかうとは
; ヴィシュヌの ちからを えてのことか
Message_03_04_1B:
#_0BB4E8: db $50, $34, $30, $3A, $CF, $34, $35, $45 ; わたしに⎵たちむ
#_0BB4F0: db $2A, $27, $38, $3E ; かうとは
#_0BB4F4: db $F9 ; new line
#_0BB4F5: db $CE, $8C, $68, $90, $73, $3D, $CF, $35 ; ヴィシュヌの⎵ち
#_0BB4FD: db $2A, $4B, $51, $CF, $28, $37, $3D, $2E ; からを⎵えてのこ
#_0BB505: db $38, $2A ; とか
#_0BB507: db $F9 ; new line

;===================================================================================================

; おもしろい しばし あそんでやろう
Message_03_04_1C:
#_0BB508: db $29, $47, $30, $4F, $26, $CF, $30, $AB ; おもしろい⎵しば
#_0BB510: db $30, $CF, $25, $33, $52, $A9, $48, $4F ; し⎵あそんでやろ
#_0BB518: db $27 ; う
#_0BB519: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_1D:
#_0BB51A: db $D5, $39 ; send 39 to APU
#_0BB51C: db $E5, $01, $1F ; [COMMAND E5:01,1F]

;===================================================================================================

Message_03_04_1E:
#_0BB51F: db $E5, $00, $1F ; [COMMAND E5:00,1F]
#_0BB522: db $D3, $1E ; go to message 1E

;===================================================================================================

; またも ヴィシュヌしんを うちはたせず
; ほろびるのか«・・・»
; [DEMON1]:
; まて! わが ちち ラーヴァナの かたき!
; にがすわけには いかんぞ!
Message_03_04_1F:
#_0BB524: db $43, $34, $47, $CF, $CE, $8C, $68, $90 ; またも⎵ヴィシュ
#_0BB52C: db $73, $30, $52, $51, $CF, $27, $35, $3E ; ヌしんを⎵うちは
#_0BB534: db $34, $32, $A3 ; たせず
#_0BB537: db $F9 ; new line
#_0BB538: db $42, $4F, $AC, $4D, $3D, $2A ; ほろびるのか
#_0BB53E: db $F2, $0B ; prewritten text 0B
#_0BB540: db $FC ; wait for key and new line
#_0BB541: db $D0, $CA ; set progress bit CA
#_0BB543: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BB545: db $FA ; clear message box
#_0BB546: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BB549: db $DE, $01, $00, $14, $01 ; load 1x demon 0114
#_0BB54E: db $E4, $00 ; load demon $00
#_0BB550: db $F5 ; write demon name from $050A
#_0BB551: db $9A ; :
#_0BB552: db $F9 ; new line
#_0BB553: db $43, $37, $94, $CF, $50, $9C, $CF, $35 ; まて!⎵わが⎵ち
#_0BB55B: db $35, $CF, $83, $5A, $CE, $8B, $71, $3D ; ち⎵ラーヴァナの
#_0BB563: db $CF, $2A, $34, $2B, $94 ; ⎵かたき!
#_0BB568: db $F9 ; new line
#_0BB569: db $3A, $9C, $31, $50, $2D, $3A, $3E, $CF ; にがすわけには⎵
#_0BB571: db $26, $2A, $52, $A5, $94 ; いかんぞ!
#_0BB576: db $FC ; wait for key and new line
#_0BB577: db $E5, $01, $21 ; [COMMAND E5:01,21]

;===================================================================================================

Message_03_04_20:
#_0BB57A: db $E5, $00, $21 ; [COMMAND E5:00,21]
#_0BB57D: db $D3, $20 ; go to message 20

;===================================================================================================

; [DEMON1]:
; む むねん«・・・»
Message_03_04_21:
#_0BB57F: db $F5 ; write demon name from $050A
#_0BB580: db $9A ; :
#_0BB581: db $F9 ; new line
#_0BB582: db $45, $CF, $45, $3C, $52 ; む⎵むねん
#_0BB587: db $F2, $0B ; prewritten text 0B
#_0BB589: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_22:
#_0BB58A: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BB58C: db $D2, $CA, $23 ; test progress bit CA for message 23
#_0BB58F: db $D2, $CC, $23 ; test progress bit CC for message 23
#_0BB592: db $D3, $25 ; go to message 25

;===================================================================================================

Message_03_04_23:
#_0BB594: db $D0, $9D ; set progress bit 9D
#_0BB596: db $D3, $25 ; go to message 25

;===================================================================================================

; >«だれもいない»
Message_03_04_24:
#_0BB598: db $97 ; >
#_0BB599: db $F2, $2C ; prewritten text 2C
#_0BB59B: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_25:
#_0BB59C: db $FE, $1A, $61, $B1, $08, $00, $00, $00 ; ext command 1A: 61,B1,08,00,00,00
#_0BB5A4: db $FF ; end of message

;===================================================================================================

; [MOMO]:
; ねえ なにか かんじない? [CHASE]
; なにか つよい きの ようなものを«・・・»
Message_03_04_26:
#_0BB5A5: db $D5, $46 ; send 46 to APU
#_0BB5A7: db $D7, $3B ; load scene 3B
#_0BB5A9: db $D2, $D0, $33 ; test progress bit D0 for message 33
#_0BB5AC: db $DE, $01, $00, $1E, $01 ; load 1x demon 011E
#_0BB5B1: db $D2, $CF, $2D ; test progress bit CF for message 2D
#_0BB5B4: db $D2, $C0, $28 ; test progress bit C0 for message 28
#_0BB5B7: db $E9, $01, $27 ; go to message 27 maybe TODO
#_0BB5BA: db $ED ; write female protag name
#_0BB5BB: db $9A ; :
#_0BB5BC: db $F9 ; new line
#_0BB5BD: db $3C, $28, $CF, $39, $3A, $2A, $CF, $2A ; ねえ⎵なにか⎵か
#_0BB5C5: db $52, $A2, $39, $26, $95, $CF ; んじない?⎵
#_0BB5CB: db $F0 ; write player name
#_0BB5CC: db $F9 ; new line
#_0BB5CD: db $39, $3A, $2A, $CF, $36, $4A, $26, $CF ; なにか⎵つよい⎵
#_0BB5D5: db $2B, $3D, $CF, $4A, $27, $39, $47, $3D ; きの⎵ようなもの
#_0BB5DD: db $51 ; を
#_0BB5DE: db $F2, $0B ; prewritten text 0B
#_0BB5E0: db $FC ; wait for key and new line

;===================================================================================================

; >なにかの けはいを かんじる«・・・»
Message_03_04_27:
#_0BB5E1: db $FA ; clear message box
#_0BB5E2: db $97, $39, $3A, $2A, $3D, $CF, $2D, $3E ; >なにかの⎵けは
#_0BB5EA: db $26, $51, $CF, $2A, $52, $A2, $4D ; いを⎵かんじる
#_0BB5F1: db $F2, $0B ; prewritten text 0B
#_0BB5F3: db $FC ; wait for key and new line
#_0BB5F4: db $FF ; end of message

;===================================================================================================

; こえ:
; どうやら «おまえたち»の ようだな
; [DEMON1]:
; なんだ まだ ほんの ひよっこ ではないか
Message_03_04_28:
#_0BB5F5: db $2E, $28, $9A ; こえ:
#_0BB5F8: db $F9 ; new line
#_0BB5F9: db $AA, $27, $48, $4B, $CF ; どうやら⎵
#_0BB5FE: db $F2, $04 ; prewritten text 04
#_0BB600: db $3D, $CF, $4A, $27, $A6, $39 ; の⎵ようだな
#_0BB606: db $FC ; wait for key and new line
#_0BB607: db $FE, $07, $7F ; ext command 07: draw buffered text then wait 126 frames
#_0BB60A: db $E4, $00 ; load demon $00
#_0BB60C: db $FA ; clear message box
#_0BB60D: db $F5 ; write demon name from $050A
#_0BB60E: db $9A ; :
#_0BB60F: db $F9 ; new line
#_0BB610: db $39, $52, $A6, $CF, $43, $A6, $CF, $42 ; なんだ⎵まだ⎵ほ
#_0BB618: db $52, $3D, $CF, $3F, $4A, $58, $2E, $CF ; んの⎵ひよっこ⎵
#_0BB620: db $A9, $3E, $39, $26, $2A ; ではないか
#_0BB625: db $F9 ; new line
#_0BB626: db $FE, $04, $29, $2C ; ext command 04: message 29 if 11C >= 112; 2C if >= 144

;===================================================================================================

; なぜ «ルイ・サイファー»は
; おそれているのか
; では この わたしが この てで
; ちの うみに しずめてやろう
Message_03_04_29:
#_0BB62A: db $39, $A4, $CF ; なぜ⎵
#_0BB62D: db $F2, $6C ; prewritten text 6C
#_0BB62F: db $3E ; は
#_0BB630: db $F9 ; new line
#_0BB631: db $29, $33, $4E, $37, $26, $4D, $3D, $2A ; おそれているのか
#_0BB639: db $FC ; wait for key and new line
#_0BB63A: db $FA ; clear message box
#_0BB63B: db $A9, $3E, $CF, $2E, $3D, $CF, $50, $34 ; では⎵この⎵わた
#_0BB643: db $30, $9C, $CF, $2E, $3D, $CF, $37, $A9 ; しが⎵この⎵てで
#_0BB64B: db $F9 ; new line
#_0BB64C: db $35, $3D, $CF, $27, $44, $3A, $CF, $30 ; ちの⎵うみに⎵し
#_0BB654: db $A3, $46, $37, $48, $4F, $27 ; ずめてやろう
#_0BB65A: db $FC ; wait for key and new line
#_0BB65B: db $D5, $39 ; send 39 to APU
#_0BB65D: db $E5, $01, $2B ; [COMMAND E5:01,2B]

;===================================================================================================

Message_03_04_2A:
#_0BB660: db $E5, $00, $2B ; [COMMAND E5:00,2B]
#_0BB663: db $D3, $2A ; go to message 2A

;===================================================================================================

; [DEMON1]:
; «・・・»こちらが ちの うみに しずめられるとは
; «ルイ・サイファー»が おそれた わけだ«・・・»
Message_03_04_2B:
#_0BB665: db $F5 ; write demon name from $050A
#_0BB666: db $9A ; :
#_0BB667: db $F9 ; new line
#_0BB668: db $F2, $0B ; prewritten text 0B
#_0BB66A: db $2E, $35, $4B, $9C, $CF, $35, $3D, $CF ; こちらが⎵ちの⎵
#_0BB672: db $27, $44, $3A, $CF, $30, $A3, $46, $4B ; うみに⎵しずめら
#_0BB67A: db $4E, $4D, $38, $3E ; れるとは
#_0BB67E: db $F9 ; new line
#_0BB67F: db $F2, $6C ; prewritten text 6C
#_0BB681: db $9C, $CF, $29, $33, $4E, $34, $CF, $50 ; が⎵おそれた⎵わ
#_0BB689: db $2D, $A6 ; けだ
#_0BB68B: db $F2, $0B ; prewritten text 0B
#_0BB68D: db $FC ; wait for key and new line
#_0BB68E: db $D0, $D0 ; set progress bit D0
#_0BB690: db $FE, $02, $E0 ; ext command 02: add 224 to STAT_11C if progress bit FB
#_0BB693: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BB695: db $FF ; end of message

;===================================================================================================

; だが «ルイ・サイファー»の たのみも ある
Message_03_04_2C:
#_0BB696: db $A6, $9C, $CF ; だが⎵
#_0BB699: db $F2, $6C ; prewritten text 6C
#_0BB69B: db $3D, $CF, $34, $3D, $44, $47, $CF, $25 ; の⎵たのみも⎵あ
#_0BB6A3: db $4D ; る
#_0BB6A4: db $F9 ; new line
#_0BB6A5: db $D3, $2E ; go to message 2E

;===================================================================================================

; [DEMON1]:
Message_03_04_2D:
#_0BB6A7: db $E4, $00 ; load demon $00
#_0BB6A9: db $F5 ; write demon name from $050A
#_0BB6AA: db $9A ; :
#_0BB6AB: db $F9 ; new line
#_0BB6AC: db $FE, $04, $29, $2E ; ext command 04: message 29 if 11C >= 112; 2E if >= 144
#_0BB6B0: db $D3, $30 ; go to message 30

;===================================================================================================

; «おまえたち»が のぞむなら
; ナカマに なってやろう
; >[DEMON1]を «を ナカマに しますか?»
; [DEMON1]:
; そうか では このしまで
Message_03_04_2E:
#_0BB6B2: db $F2, $04 ; prewritten text 04
#_0BB6B4: db $9C, $CF, $3D, $A5, $45, $39, $4B ; が⎵のぞむなら
#_0BB6BB: db $F9 ; new line
#_0BB6BC: db $71, $62, $7B, $3A, $CF, $39, $58, $37 ; ナカマに⎵なって
#_0BB6C4: db $48, $4F, $27 ; やろう
#_0BB6C7: db $FC ; wait for key and new line
#_0BB6C8: db $FA ; clear message box
#_0BB6C9: db $97 ; >
#_0BB6CA: db $F5 ; write demon name from $050A
#_0BB6CB: db $51, $CF ; を⎵
#_0BB6CD: db $F2, $7E ; prewritten text 7E
#_0BB6CF: db $F8, $31 ; YES/NO - go to message 31 if YES
#_0BB6D1: db $F5 ; write demon name from $050A
#_0BB6D2: db $9A ; :
#_0BB6D3: db $F9 ; new line
#_0BB6D4: db $33, $27, $2A, $CF, $A9, $3E, $CF, $2E ; そうか⎵では⎵こ
#_0BB6DC: db $3D, $30, $43, $A9 ; のしまで
#_0BB6E0: db $F9 ; new line

;===================================================================================================

; たかみの けんぶつを しよう
Message_03_04_2F:
#_0BB6E1: db $34, $2A, $44, $3D, $CF, $2D, $52, $AD ; たかみの⎵けんぶ
#_0BB6E9: db $36, $51, $CF, $30, $4A, $27 ; つを⎵しよう
#_0BB6EF: db $FC ; wait for key and new line
#_0BB6F0: db $D0, $CF ; set progress bit CF
#_0BB6F2: db $FF ; end of message

;===================================================================================================

; «おまえたち»が どれほどの ことが できるのか
Message_03_04_30:
#_0BB6F3: db $F2, $04 ; prewritten text 04
#_0BB6F5: db $9C, $CF, $AA, $4E, $42, $AA, $3D, $CF ; が⎵どれほどの⎵
#_0BB6FD: db $2E, $38, $9C, $CF, $A9, $2B, $4D, $3D ; ことが⎵できるの
#_0BB705: db $2A ; か
#_0BB706: db $F9 ; new line
#_0BB707: db $D3, $2F ; go to message 2F

;===================================================================================================

; [DEMON1]:
; わたしは [DEMON1]
; «こんごとも よろしく・・・»«・・・»
; と いえば いいのか?
; >[DEMON1]が «ナカマに くわわった»
Message_03_04_31:
#_0BB709: db $F5 ; write demon name from $050A
#_0BB70A: db $9A ; :
#_0BB70B: db $F9 ; new line
#_0BB70C: db $FE, $09, $32 ; ext command 09: demon joins party or message 32 if full
#_0BB70F: db $50, $34, $30, $3E, $CF ; わたしは⎵
#_0BB714: db $F5 ; write demon name from $050A
#_0BB715: db $F9 ; new line
#_0BB716: db $F2, $41 ; prewritten text 41
#_0BB718: db $F2, $0B ; prewritten text 0B
#_0BB71A: db $F9 ; new line
#_0BB71B: db $38, $CF, $26, $28, $AB, $CF, $26, $26 ; と⎵いえば⎵いい
#_0BB723: db $3D, $2A, $95 ; のか?
#_0BB726: db $FC ; wait for key and new line
#_0BB727: db $FA ; clear message box
#_0BB728: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BB72A: db $97 ; >
#_0BB72B: db $F5 ; write demon name from $050A
#_0BB72C: db $9C, $CF ; が⎵
#_0BB72E: db $F2, $2F ; prewritten text 2F
#_0BB730: db $FC ; wait for key and new line
#_0BB731: db $DE, $00, $00, $BD, $01 ; load 1x demon 00BD
#_0BB736: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BB739: db $FE, $02, $20 ; ext command 02: add 32 to STAT_11C if progress bit FB
#_0BB73C: db $D0, $D0 ; set progress bit D0
#_0BB73E: db $FF ; end of message

;===================================================================================================

; «では ナカマを へらして» ここへ くれば
; ナカマに なってやる
; ふたたび くる こないは
; «おまえたち»で きめてくれ
Message_03_04_32:
#_0BB73F: db $F2, $43 ; prewritten text 43
#_0BB741: db $CF, $2E, $2E, $41, $CF, $2C, $4E, $AB ; ⎵ここへ⎵くれば
#_0BB749: db $F9 ; new line
#_0BB74A: db $71, $62, $7B, $3A, $CF, $39, $58, $37 ; ナカマに⎵なって
#_0BB752: db $48, $4D ; やる
#_0BB754: db $F9 ; new line
#_0BB755: db $40, $34, $34, $AC, $CF, $2C, $4D, $CF ; ふたたび⎵くる⎵
#_0BB75D: db $2E, $39, $26, $3E ; こないは
#_0BB761: db $F9 ; new line
#_0BB762: db $F2, $04 ; prewritten text 04
#_0BB764: db $A9, $CF, $2B, $46, $37, $2C, $4E ; で⎵きめてくれ
#_0BB76B: db $FC ; wait for key and new line
#_0BB76C: db $D0, $CF ; set progress bit CF
#_0BB76E: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_04_33:
#_0BB76F: db $97 ; >
#_0BB770: db $F2, $2C ; prewritten text 2C
#_0BB772: db $FC ; wait for key and new line
#_0BB773: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_04_34:
#_0BB774: db $D6, $00, $6C, $60, $28 ; place sprite 6C in slot 00 at XY:{60,28}
#_0BB779: db $97 ; >
#_0BB77A: db $F2, $68 ; prewritten text 68
#_0BB77C: db $F8, $35 ; YES/NO - go to message 35 if YES
#_0BB77E: db $FF ; end of message

;===================================================================================================

Message_03_04_35:
#_0BB77F: db $D6, $00, $75, $60, $28 ; place sprite 75 in slot 00 at XY:{60,28}
#_0BB784: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BB787: db $D6, $00, $00 ; delete sprite in slot 00
#_0BB78A: db $FE, $1A, $3B, $38, $03, $00, $00, $00 ; ext command 1A: 3B,38,03,00,00,00

;===================================================================================================

; ろうじん:
Message_03_04_36:
#_0BB792: db $D5, $44 ; send 44 to APU
#_0BB794: db $E1, $F1 ; set $0A50 to item F1
#_0BB796: db $D7, $24 ; load scene 24
#_0BB798: db $D4, $03 ; set text box size to 3
#_0BB79A: db $D6, $00, $89, $70, $28 ; place sprite 89 in slot 00 at XY:{70,28}
#_0BB79F: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0BB7A4: db $F9 ; new line
#_0BB7A5: db $D2, $D5, $3E ; test progress bit D5 for message 3E
#_0BB7A8: db $D2, $D6, $39 ; test progress bit D6 for message 39
#_0BB7AB: db $FE, $04, $37, $38 ; ext command 04: message 37 if 11C >= 112; 38 if >= 144
#_0BB7AF: db $D3, $38 ; go to message 38

;===================================================================================================

Message_03_04_37:
#_0BB7B1: db $D2, $B5, $3A ; test progress bit B5 for message 3A

;===================================================================================================

; «・・・»この おいぼれに
; なにも ようは あるまい
Message_03_04_38:
#_0BB7B4: db $F2, $0B ; prewritten text 0B
#_0BB7B6: db $2E, $3D, $CF, $29, $26, $AF, $4E, $3A ; この⎵おいぼれに
#_0BB7BE: db $F9 ; new line
#_0BB7BF: db $39, $3A, $47, $CF, $4A, $27, $3E, $CF ; なにも⎵ようは⎵
#_0BB7C7: db $25, $4D, $43, $26 ; あるまい
#_0BB7CB: db $FC ; wait for key and new line
#_0BB7CC: db $D3, $3F ; go to message 3F

;===================================================================================================

; «セラフてんし»は つれてきたか?
Message_03_04_39:
#_0BB7CE: db $F2, $87 ; prewritten text 87
#_0BB7D0: db $3E, $CF, $36, $4E, $37, $2B, $34, $2A ; は⎵つれてきたか
#_0BB7D8: db $95 ; ?
#_0BB7D9: db $FC ; wait for key and new line
#_0BB7DA: db $D3, $3B ; go to message 3B

;===================================================================================================

; [ITEM]が いりようか«・・・»
; おぬしらは とてつもないことを
; やろうと しているな
Message_03_04_3A:
#_0BB7DC: db $F3 ; write item name from $0A50
#_0BB7DD: db $9C, $CF, $26, $4C, $4A, $27, $2A ; が⎵いりようか
#_0BB7E4: db $F2, $0B ; prewritten text 0B
#_0BB7E6: db $F9 ; new line
#_0BB7E7: db $29, $3B, $30, $4B, $3E, $CF, $38, $37 ; おぬしらは⎵とて
#_0BB7EF: db $36, $47, $39, $26, $2E, $38, $51 ; つもないことを
#_0BB7F6: db $F9 ; new line
#_0BB7F7: db $48, $4F, $27, $38, $CF, $30, $37, $26 ; やろうと⎵してい
#_0BB7FF: db $4D, $39 ; るな
#_0BB801: db $FC ; wait for key and new line

;===================================================================================================

; 3たいの «セラフてんし»は
; そろった ようじゃな«・・・»
; では がったいさせてやろう
; ひさびさで うでが なるわい
; [ITEM] じゃ«・・・»もってゆけ
Message_03_04_3B:
#_0BB802: db $FA ; clear message box
#_0BB803: db $04, $34, $26, $3D, $CF ; 3たいの⎵
#_0BB808: db $F2, $87 ; prewritten text 87
#_0BB80A: db $DE, $00, $00, $20, $01 ; load 1x demon 0020
#_0BB80F: db $FE, $08, $04, $3C ; ext command 08: something with levels to message 3C, 04 TODO
#_0BB813: db $DE, $00, $00, $21, $01 ; load 1x demon 0021
#_0BB818: db $FE, $08, $04, $3C ; ext command 08: something with levels to message 3C, 04 TODO
#_0BB81C: db $DE, $00, $00, $22, $01 ; load 1x demon 0022
#_0BB821: db $FE, $08, $04, $3C ; ext command 08: something with levels to message 3C, 04 TODO
#_0BB825: db $3E ; は
#_0BB826: db $F9 ; new line
#_0BB827: db $33, $4F, $58, $34, $CF, $4A, $27, $A2 ; そろった⎵ようじ
#_0BB82F: db $55, $39 ; ゃな
#_0BB831: db $F2, $0B ; prewritten text 0B
#_0BB833: db $F9 ; new line
#_0BB834: db $FE, $3C, $40 ; ext command 3C: go to message 40 if no space for item
#_0BB837: db $A9, $3E, $CF, $9C, $58, $34, $26, $2F ; では⎵がったいさ
#_0BB83F: db $32, $37, $48, $4F, $27 ; せてやろう
#_0BB844: db $F9 ; new line
#_0BB845: db $3F, $2F, $AC, $2F, $A9, $CF, $27, $A9 ; ひさびさで⎵うで
#_0BB84D: db $9C, $CF, $39, $4D, $50, $26 ; が⎵なるわい
#_0BB853: db $FC ; wait for key and new line
#_0BB854: db $FE, $63 ; ext command 63: show triple fusion cutscene
#_0BB856: db $F3 ; write item name from $0A50
#_0BB857: db $CF, $A2, $55 ; ⎵じゃ
#_0BB85A: db $F2, $0B ; prewritten text 0B
#_0BB85C: db $47, $58, $37, $49, $2D ; もってゆけ
#_0BB861: db $FC ; wait for key and new line
#_0BB862: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BB864: db $FE, $65 ; ext command 65: Call routine 02A017 TODO
#_0BB866: db $DE, $00, $00, $22, $01 ; load 1x demon 0022
#_0BB86B: db $FE, $27, $04 ; ext command 27: something 04 TODO
#_0BB86E: db $DE, $00, $00, $21, $01 ; load 1x demon 0021
#_0BB873: db $FE, $27, $04 ; ext command 27: something 04 TODO
#_0BB876: db $DE, $00, $00, $20, $01 ; load 1x demon 0020
#_0BB87B: db $FE, $27, $04 ; ext command 27: something 04 TODO
#_0BB87E: db $D0, $D5 ; set progress bit D5
#_0BB880: db $D7, $24 ; load scene 24
#_0BB882: db $D6, $00, $89, $70, $28 ; place sprite 89 in slot 00 at XY:{70,28}
#_0BB887: db $D3, $3D ; go to message 3D

;===================================================================================================

; を
; つれてくるのじゃ
; そのちからを あわせねば
; [ITEM]は できん
; また «セラフてんし»を ナカマに できぬものに
; [ITEM]など あっても むだじゃ
Message_03_04_3C:
#_0BB889: db $51 ; を
#_0BB88A: db $F9 ; new line
#_0BB88B: db $36, $4E, $37, $2C, $4D, $3D, $A2, $55 ; つれてくるのじゃ
#_0BB893: db $F9 ; new line
#_0BB894: db $33, $3D, $35, $2A, $4B, $51, $CF, $25 ; そのちからを⎵あ
#_0BB89C: db $50, $32, $3C, $AB ; わせねば
#_0BB8A0: db $F9 ; new line
#_0BB8A1: db $F3 ; write item name from $0A50
#_0BB8A2: db $3E, $CF, $A9, $2B, $52 ; は⎵できん
#_0BB8A7: db $FC ; wait for key and new line
#_0BB8A8: db $FA ; clear message box
#_0BB8A9: db $43, $34, $CF ; また⎵
#_0BB8AC: db $F2, $87 ; prewritten text 87
#_0BB8AE: db $51, $CF, $71, $62, $7B, $3A, $CF, $A9 ; を⎵ナカマに⎵で
#_0BB8B6: db $2B, $3B, $47, $3D, $3A ; きぬものに
#_0BB8BB: db $F9 ; new line
#_0BB8BC: db $F3 ; write item name from $0A50
#_0BB8BD: db $39, $AA, $CF, $25, $58, $37, $47, $CF ; など⎵あっても⎵
#_0BB8C5: db $45, $A6, $A2, $55 ; むだじゃ
#_0BB8C9: db $FC ; wait for key and new line
#_0BB8CA: db $D0, $D6 ; set progress bit D6
#_0BB8CC: db $D3, $3F ; go to message 3F

;===================================================================================================

; ろうじん:
Message_03_04_3D:
#_0BB8CE: db $D4, $03 ; set text box size to 3
#_0BB8D0: db $4F, $27, $A2, $52, $9A ; ろうじん:
#_0BB8D5: db $F9 ; new line

;===================================================================================================

; [ITEM]を «てにいれた»ら
; ようは ないじゃろう
Message_03_04_3E:
#_0BB8D6: db $F3 ; write item name from $0A50
#_0BB8D7: db $51, $CF ; を⎵
#_0BB8D9: db $F2, $2D ; prewritten text 2D
#_0BB8DB: db $4B ; ら
#_0BB8DC: db $F9 ; new line
#_0BB8DD: db $4A, $27, $3E, $CF, $39, $26, $A2, $55 ; ようは⎵ないじゃ
#_0BB8E5: db $4F, $27 ; ろう
#_0BB8E7: db $FC ; wait for key and new line

;===================================================================================================

Message_03_04_3F:
#_0BB8E8: db $FE, $1A, $3B, $B9, $03, $00, $00, $00 ; ext command 1A: 3B,B9,03,00,00,00
#_0BB8F0: db $FF ; end of message

;===================================================================================================

; だが つくっても もちきれんようじゃ
; «では もちものを へらしてこい»
Message_03_04_40:
#_0BB8F1: db $A6, $9C, $CF, $36, $2C, $58, $37, $47 ; だが⎵つくっても
#_0BB8F9: db $CF, $47, $35, $2B, $4E, $52, $4A, $27 ; ⎵もちきれんよう
#_0BB901: db $A2, $55 ; じゃ
#_0BB903: db $F9 ; new line
#_0BB904: db $F2, $79 ; prewritten text 79
#_0BB906: db $FC ; wait for key and new line
#_0BB907: db $D3, $3F ; go to message 3F

;===================================================================================================

; >
Message_03_04_41:
#_0BB909: db $FE, $2A ; ext command 2A: call routine 02E87C TODO
#_0BB90B: db $DE, $00, $00, $13, $01 ; load 1x demon 0013
#_0BB910: db $97 ; >
#_0BB911: db $D2, $73, $4E ; test progress bit 73 for message 4E
#_0BB914: db $D2, $E0, $42 ; test progress bit E0 for message 42
#_0BB917: db $D3, $4E ; go to message 4E

;===================================================================================================

Message_03_04_42:
#_0BB919: db $DD, $FD, $4E ; go to message 4E if missing item FD
#_0BB91C: db $D2, $DB, $43 ; test progress bit DB for message 43
#_0BB91F: db $D3, $4E ; go to message 4E

;===================================================================================================

; «とつぜん [ITEM]が かがやきはじめた»
; «ひかりが すいめんを てらすと»
; «[ITEM]が うかびあがってきた»
; [LEADER]は [ITEM]を
; «てにいれた»
Message_03_04_43:
#_0BB921: db $E1, $FD ; set $0A50 to item FD
#_0BB923: db $F2, $7F ; prewritten text 7F
#_0BB925: db $E1, $77 ; set $0A50 to item 77
#_0BB927: db $F2, $80 ; prewritten text 80
#_0BB929: db $FE, $3C, $4D ; ext command 3C: go to message 4D if no space for item
#_0BB92C: db $FA ; clear message box
#_0BB92D: db $F1 ; write leader's name for team
#_0BB92E: db $3E, $CF ; は⎵
#_0BB930: db $F3 ; write item name from $0A50
#_0BB931: db $51 ; を
#_0BB932: db $F9 ; new line
#_0BB933: db $F2, $2D ; prewritten text 2D
#_0BB935: db $FC ; wait for key and new line
#_0BB936: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BB938: db $D0, $73 ; set progress bit 73
#_0BB93A: db $FF ; end of message

;===================================================================================================

; >
Message_03_04_44:
#_0BB93B: db $FE, $2A ; ext command 2A: call routine 02E87C TODO
#_0BB93D: db $DE, $00, $00, $17, $01 ; load 1x demon 0017
#_0BB942: db $97 ; >
#_0BB943: db $D2, $74, $4E ; test progress bit 74 for message 4E
#_0BB946: db $D2, $E0, $45 ; test progress bit E0 for message 45
#_0BB949: db $D3, $4E ; go to message 4E

;===================================================================================================

Message_03_04_45:
#_0BB94B: db $DD, $FD, $4E ; go to message 4E if missing item FD
#_0BB94E: db $D2, $DA, $46 ; test progress bit DA for message 46
#_0BB951: db $D3, $4E ; go to message 4E

;===================================================================================================

; «とつぜん [ITEM]が かがやきはじめた»
; «ひかりが すいめんを てらすと»
; «[ITEM]が うかびあがってきた»
; [LEADER]は [ITEM]を
; «てにいれた»
Message_03_04_46:
#_0BB953: db $E1, $FD ; set $0A50 to item FD
#_0BB955: db $F2, $7F ; prewritten text 7F
#_0BB957: db $E1, $8F ; set $0A50 to item 8F
#_0BB959: db $F2, $80 ; prewritten text 80
#_0BB95B: db $FE, $3C, $4D ; ext command 3C: go to message 4D if no space for item
#_0BB95E: db $FA ; clear message box
#_0BB95F: db $F1 ; write leader's name for team
#_0BB960: db $3E, $CF ; は⎵
#_0BB962: db $F3 ; write item name from $0A50
#_0BB963: db $51 ; を
#_0BB964: db $F9 ; new line
#_0BB965: db $F2, $2D ; prewritten text 2D
#_0BB967: db $FC ; wait for key and new line
#_0BB968: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BB96A: db $D0, $74 ; set progress bit 74
#_0BB96C: db $FF ; end of message

;===================================================================================================

; >
Message_03_04_47:
#_0BB96D: db $FE, $2A ; ext command 2A: call routine 02E87C TODO
#_0BB96F: db $DE, $00, $00, $18, $01 ; load 1x demon 0018
#_0BB974: db $97 ; >
#_0BB975: db $D2, $75, $4E ; test progress bit 75 for message 4E
#_0BB978: db $D2, $E0, $48 ; test progress bit E0 for message 48
#_0BB97B: db $D3, $4E ; go to message 4E

;===================================================================================================

Message_03_04_48:
#_0BB97D: db $DD, $FD, $4E ; go to message 4E if missing item FD
#_0BB980: db $D2, $D9, $49 ; test progress bit D9 for message 49
#_0BB983: db $D3, $4E ; go to message 4E

;===================================================================================================

; «とつぜん [ITEM]が かがやきはじめた»
; «ひかりが すいめんを てらすと»
; «[ITEM]が うかびあがってきた»
; [LEADER]は [ITEM]を
; «てにいれた»
Message_03_04_49:
#_0BB985: db $E1, $FD ; set $0A50 to item FD
#_0BB987: db $F2, $7F ; prewritten text 7F
#_0BB989: db $E1, $9F ; set $0A50 to item 9F
#_0BB98B: db $F2, $80 ; prewritten text 80
#_0BB98D: db $FE, $3C, $4D ; ext command 3C: go to message 4D if no space for item
#_0BB990: db $FA ; clear message box
#_0BB991: db $F1 ; write leader's name for team
#_0BB992: db $3E, $CF ; は⎵
#_0BB994: db $F3 ; write item name from $0A50
#_0BB995: db $51 ; を
#_0BB996: db $F9 ; new line
#_0BB997: db $F2, $2D ; prewritten text 2D
#_0BB999: db $FC ; wait for key and new line
#_0BB99A: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BB99C: db $D0, $75 ; set progress bit 75
#_0BB99E: db $FF ; end of message

;===================================================================================================

; >
Message_03_04_4A:
#_0BB99F: db $FE, $2A ; ext command 2A: call routine 02E87C TODO
#_0BB9A1: db $DE, $00, $00, $19, $01 ; load 1x demon 0019
#_0BB9A6: db $97 ; >
#_0BB9A7: db $D2, $76, $4E ; test progress bit 76 for message 4E
#_0BB9AA: db $D2, $E0, $4B ; test progress bit E0 for message 4B
#_0BB9AD: db $D3, $4E ; go to message 4E

;===================================================================================================

Message_03_04_4B:
#_0BB9AF: db $DD, $FD, $4E ; go to message 4E if missing item FD
#_0BB9B2: db $D2, $D8, $4C ; test progress bit D8 for message 4C
#_0BB9B5: db $D3, $4E ; go to message 4E

;===================================================================================================

; «とつぜん [ITEM]が かがやきはじめた»
; «ひかりが すいめんを てらすと»
; «[ITEM]が うかびあがってきた»
; [LEADER]は [ITEM]を
; «てにいれた»
Message_03_04_4C:
#_0BB9B7: db $E1, $FD ; set $0A50 to item FD
#_0BB9B9: db $F2, $7F ; prewritten text 7F
#_0BB9BB: db $E1, $AF ; set $0A50 to item AF
#_0BB9BD: db $F2, $80 ; prewritten text 80
#_0BB9BF: db $FE, $3C, $4D ; ext command 3C: go to message 4D if no space for item
#_0BB9C2: db $FA ; clear message box
#_0BB9C3: db $F1 ; write leader's name for team
#_0BB9C4: db $3E, $CF ; は⎵
#_0BB9C6: db $F3 ; write item name from $0A50
#_0BB9C7: db $51 ; を
#_0BB9C8: db $F9 ; new line
#_0BB9C9: db $F2, $2D ; prewritten text 2D
#_0BB9CB: db $FC ; wait for key and new line
#_0BB9CC: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BB9CE: db $D0, $76 ; set progress bit 76
#_0BB9D0: db $FF ; end of message

;===================================================================================================

; [LEADER]は [ITEM]を
; «みつけたが もちきれなかった»
Message_03_04_4D:
#_0BB9D1: db $FA ; clear message box
#_0BB9D2: db $F1 ; write leader's name for team
#_0BB9D3: db $3E, $CF ; は⎵
#_0BB9D5: db $F3 ; write item name from $0A50
#_0BB9D6: db $51 ; を
#_0BB9D7: db $F9 ; new line
#_0BB9D8: db $F2, $72 ; prewritten text 72
#_0BB9DA: db $FC ; wait for key and new line
#_0BB9DB: db $FF ; end of message

;===================================================================================================

; だいとかい «トウキョウ»は
; うみのそこに しずんでしまった
Message_03_04_4E:
#_0BB9DC: db $A6, $26, $38, $2A, $26, $CF ; だいとかい⎵
#_0BB9E2: db $F2, $1C ; prewritten text 1C
#_0BB9E4: db $3E ; は
#_0BB9E5: db $F9 ; new line
#_0BB9E6: db $27, $44, $3D, $33, $2E, $3A, $CF, $30 ; うみのそこに⎵し
#_0BB9EE: db $A3, $52, $A9, $30, $43, $58, $34 ; ずんでしまった
#_0BB9F5: db $FC ; wait for key and new line
#_0BB9F6: db $FF ; end of message

;===================================================================================================

; «>[ITEM]が かがやき»
; «ひかりが とびらを てらした»
; «なかに はいりますか?»
Message_03_05_00:
#_0BB9F7: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BB9FC: db $DD, $FD, $50 ; go to message 50 if missing item FD
#_0BB9FF: db $E1, $FD ; set $0A50 to item FD
#_0BBA01: db $F2, $81 ; prewritten text 81
#_0BBA03: db $FA ; clear message box
#_0BBA04: db $F2, $68 ; prewritten text 68
#_0BBA06: db $F8, $01 ; YES/NO - go to message 01 if YES
#_0BBA08: db $FF ; end of message

;===================================================================================================

Message_03_05_01:
#_0BBA09: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BBA0E: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BBA11: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBA14: db $FE, $1A, $5C, $F9, $02, $00, $09, $25 ; ext command 1A: 5C,F9,02,00,09,25

;===================================================================================================

; [DEMON1]:
; この ぞうには わが まりょくを ふうじこめ
; «トウキョウ»の ニシの まもりと していたのだ
; だが おぬしの ナカマと なった いま
; もはや ふようの ものだ«・・・»
Message_03_05_02:
#_0BBA1C: db $D7, $24 ; load scene 24
#_0BBA1E: db $D5, $46 ; send 46 to APU
#_0BBA20: db $D4, $03 ; set text box size to 3
#_0BBA22: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBA27: db $E4, $00 ; load demon $00
#_0BBA29: db $DE, $00, $00, $19, $01 ; load 1x demon 0019
#_0BBA2E: db $D2, $D8, $0D ; test progress bit D8 for message 0D
#_0BBA31: db $F5 ; write demon name from $050A
#_0BBA32: db $9A ; :
#_0BBA33: db $F9 ; new line
#_0BBA34: db $D2, $DC, $0C ; test progress bit DC for message 0C
#_0BBA37: db $FE, $08, $04, $03 ; ext command 08: something with levels to message 03, 04 TODO
#_0BBA3B: db $2E, $3D, $CF, $A5, $27, $3A, $3E, $CF ; この⎵ぞうには⎵
#_0BBA43: db $50, $9C, $CF, $43, $4C, $57, $2C, $51 ; わが⎵まりょくを
#_0BBA4B: db $CF, $40, $27, $A2, $2E, $46 ; ⎵ふうじこめ
#_0BBA51: db $F9 ; new line
#_0BBA52: db $F2, $1C ; prewritten text 1C
#_0BBA54: db $3D, $CF, $72, $68, $3D, $CF, $43, $47 ; の⎵ニシの⎵まも
#_0BBA5C: db $4C, $38, $CF, $30, $37, $26, $34, $3D ; りと⎵していたの
#_0BBA64: db $A6 ; だ
#_0BBA65: db $FC ; wait for key and new line
#_0BBA66: db $FA ; clear message box
#_0BBA67: db $A6, $9C, $CF, $29, $3B, $30, $3D, $CF ; だが⎵おぬしの⎵
#_0BBA6F: db $71, $62, $7B, $38, $CF, $39, $58, $34 ; ナカマと⎵なった
#_0BBA77: db $CF, $26, $43 ; ⎵いま
#_0BBA7A: db $F9 ; new line
#_0BBA7B: db $47, $3E, $48, $CF, $40, $4A, $27, $3D ; もはや⎵ふようの
#_0BBA83: db $CF, $47, $3D, $A6 ; ⎵ものだ
#_0BBA87: db $F2, $0B ; prewritten text 0B
#_0BBA89: db $FC ; wait for key and new line
#_0BBA8A: db $D3, $0A ; go to message 0A

;===================================================================================================

; われに ちかづくは なにものだ!
; ついに あらわれたか
; われを したがえる ニンゲンよ
; この [CLASS] [DEMON1]
; おぬしと ともに たたかおう
Message_03_05_03:
#_0BBA8C: db $50, $4E, $3A, $CF, $35, $2A, $A8, $2C ; われに⎵ちかづく
#_0BBA94: db $3E, $CF, $39, $3A, $47, $3D, $A6, $94 ; は⎵なにものだ!
#_0BBA9C: db $FC ; wait for key and new line
#_0BBA9D: db $D5, $39 ; send 39 to APU
#_0BBA9F: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBAA1: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBAA6: db $FE, $07, $19 ; ext command 07: draw buffered text then wait 24 frames
#_0BBAA9: db $E4, $00 ; load demon $00
#_0BBAAB: db $FA ; clear message box
#_0BBAAC: db $FE, $05, $F0, $FF, $07 ; ext command 05: go to message 07 if 11C >= -16
#_0BBAB1: db $36, $26, $3A, $CF, $25, $4B, $50, $4E ; ついに⎵あらわれ
#_0BBAB9: db $34, $2A ; たか
#_0BBABB: db $F9 ; new line
#_0BBABC: db $50, $4E, $51, $CF, $30, $34, $9C, $28 ; われを⎵したがえ
#_0BBAC4: db $4D, $CF, $72, $8A, $B8, $8A, $4A ; る⎵ニンゲンよ
#_0BBACB: db $F9 ; new line
#_0BBACC: db $2E, $3D, $CF ; この⎵
#_0BBACF: db $F6 ; write class name from $0506
#_0BBAD0: db $CF ; ⎵
#_0BBAD1: db $F5 ; write demon name from $050A
#_0BBAD2: db $F9 ; new line
#_0BBAD3: db $29, $3B, $30, $38, $CF, $38, $47, $3A ; おぬしと⎵ともに
#_0BBADB: db $CF, $34, $34, $2A, $29, $27 ; ⎵たたかおう
#_0BBAE1: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]が «ナカマに くわわった»
Message_03_05_04:
#_0BBAE2: db $D0, $DC ; set progress bit DC
#_0BBAE4: db $FE, $06, $36, $06 ; ext command 06: go to message 06 if MC level < 54
#_0BBAE8: db $FE, $09, $05 ; ext command 09: demon joins party or message 05 if full
#_0BBAEB: db $FA ; clear message box
#_0BBAEC: db $97 ; >
#_0BBAED: db $F5 ; write demon name from $050A
#_0BBAEE: db $9C, $CF ; が⎵
#_0BBAF0: db $F2, $2F ; prewritten text 2F
#_0BBAF2: db $FC ; wait for key and new line
#_0BBAF3: db $DE, $00, $00, $19, $01 ; load 1x demon 0019
#_0BBAF8: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BBAFB: db $D1, $DC ; clear progress bit DC
#_0BBAFD: db $D3, $0A ; go to message 0A

;===================================================================================================

; «では ナカマを へらして»こい
Message_03_05_05:
#_0BBAFF: db $FA ; clear message box
#_0BBB00: db $F2, $43 ; prewritten text 43
#_0BBB02: db $2E, $26 ; こい
#_0BBB04: db $FC ; wait for key and new line
#_0BBB05: db $D3, $0E ; go to message 0E

;===================================================================================================

; «では もっと レベルを あげてこい»
Message_03_05_06:
#_0BBB07: db $FA ; clear message box
#_0BBB08: db $F2, $88 ; prewritten text 88
#_0BBB0A: db $D3, $0E ; go to message 0E

;===================================================================================================

; おぬしのようなものと たたかうのが
; わが つとめ
; いざ まいる!
Message_03_05_07:
#_0BBB0C: db $29, $3B, $30, $3D, $4A, $27, $39, $47 ; おぬしのようなも
#_0BBB14: db $3D, $38, $CF, $34, $34, $2A, $27, $3D ; のと⎵たたかうの
#_0BBB1C: db $9C ; が
#_0BBB1D: db $F9 ; new line
#_0BBB1E: db $50, $9C, $CF, $36, $38, $46 ; わが⎵つとめ
#_0BBB24: db $F9 ; new line
#_0BBB25: db $26, $A1, $CF, $43, $26, $4D, $94 ; いざ⎵まいる!
#_0BBB2C: db $FC ; wait for key and new line
#_0BBB2D: db $D5, $39 ; send 39 to APU
#_0BBB2F: db $E5, $01, $09 ; [COMMAND E5:01,09]

;===================================================================================================

Message_03_05_08:
#_0BBB32: db $E5, $00, $09 ; [COMMAND E5:00,09]
#_0BBB35: db $D3, $08 ; go to message 08

;===================================================================================================

Message_03_05_09:
#_0BBB37: db $FE, $04, $0A, $0B ; ext command 04: message 0A if 11C >= 112; 0B if >= 144

;===================================================================================================

Message_03_05_0A:
#_0BBB3B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBB3D: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBB42: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BBB45: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBB48: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBB4D: db $E4, $00 ; load demon $00
#_0BBB4F: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BBB52: db $D0, $D8 ; set progress bit D8
#_0BBB54: db $D3, $0E ; go to message 0E

;===================================================================================================

; [DEMON1]:
; «・・・»われを まかすほどの つよさとは
; おぬしに したがうなら わが しゅごしんも
; おゆるしに なろう
Message_03_05_0B:
#_0BBB56: db $F5 ; write demon name from $050A
#_0BBB57: db $9A ; :
#_0BBB58: db $F9 ; new line
#_0BBB59: db $F2, $0B ; prewritten text 0B
#_0BBB5B: db $50, $4E, $51, $CF, $43, $2A, $31, $42 ; われを⎵まかすほ
#_0BBB63: db $AA, $3D, $CF, $36, $4A, $2F, $38, $3E ; どの⎵つよさとは
#_0BBB6B: db $F9 ; new line
#_0BBB6C: db $29, $3B, $30, $3A, $CF, $30, $34, $9C ; おぬしに⎵したが
#_0BBB74: db $27, $39, $4B, $CF, $50, $9C, $CF, $30 ; うなら⎵わが⎵し
#_0BBB7C: db $56, $A0, $30, $52, $47 ; ゅごしんも
#_0BBB81: db $F9 ; new line
#_0BBB82: db $29, $49, $4D, $30, $3A, $CF, $39, $4F ; おゆるしに⎵なろ
#_0BBB8A: db $27 ; う
#_0BBB8B: db $FC ; wait for key and new line
#_0BBB8C: db $D3, $04 ; go to message 04

;===================================================================================================

; まっていたぞ [CHASE]よ
Message_03_05_0C:
#_0BBB8E: db $43, $58, $37, $26, $34, $A5, $CF ; まっていたぞ⎵
#_0BBB95: db $F0 ; write player name
#_0BBB96: db $4A ; よ
#_0BBB97: db $FC ; wait for key and new line
#_0BBB98: db $D3, $04 ; go to message 04

;===================================================================================================

; «>[DEMON1]の ぞうが ある»
Message_03_05_0D:
#_0BBB9A: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBB9F: db $E4, $00 ; load demon $00
#_0BBBA1: db $F2, $77 ; prewritten text 77

;===================================================================================================

Message_03_05_0E:
#_0BBBA3: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBBA5: db $FE, $1A, $5D, $79, $02, $00, $09, $25 ; ext command 1A: 5D,79,02,00,09,25
#_0BBBAD: db $D3, $3D ; go to message 3D

;===================================================================================================

; «>[ITEM]が かがやき»
; «ひかりが とびらを てらした»
; «なかに はいりますか?»
Message_03_05_0F:
#_0BBBAF: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BBBB4: db $DD, $FD, $50 ; go to message 50 if missing item FD
#_0BBBB7: db $E1, $FD ; set $0A50 to item FD
#_0BBBB9: db $F2, $81 ; prewritten text 81
#_0BBBBB: db $FA ; clear message box
#_0BBBBC: db $F2, $68 ; prewritten text 68
#_0BBBBE: db $F8, $10 ; YES/NO - go to message 10 if YES
#_0BBBC0: db $FF ; end of message

;===================================================================================================

Message_03_05_10:
#_0BBBC1: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BBBC6: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BBBC9: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBBCC: db $FE, $1A, $47, $B3, $02, $00, $09, $1D ; ext command 1A: 47,B3,02,00,09,1D

;===================================================================================================

; [DEMON1]:
; «トウキョウ»の ミナミを まもるため
; さる おかたの めいにより
; わが ちからを ふうじこめた ぞうだ
; その やくめも もはや おわりだ
Message_03_05_11:
#_0BBBD4: db $D7, $24 ; load scene 24
#_0BBBD6: db $D5, $46 ; send 46 to APU
#_0BBBD8: db $D4, $03 ; set text box size to 3
#_0BBBDA: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBBDF: db $E4, $00 ; load demon $00
#_0BBBE1: db $DE, $00, $00, $18, $01 ; load 1x demon 0018
#_0BBBE6: db $D2, $D9, $1C ; test progress bit D9 for message 1C
#_0BBBE9: db $F5 ; write demon name from $050A
#_0BBBEA: db $9A ; :
#_0BBBEB: db $F9 ; new line
#_0BBBEC: db $D2, $DD, $1B ; test progress bit DD for message 1B
#_0BBBEF: db $FE, $08, $04, $12 ; ext command 08: something with levels to message 12, 04 TODO
#_0BBBF3: db $F2, $1C ; prewritten text 1C
#_0BBBF5: db $3D, $CF, $7C, $71, $7C, $51, $CF, $43 ; の⎵ミナミを⎵ま
#_0BBBFD: db $47, $4D, $34, $46 ; もるため
#_0BBC01: db $F9 ; new line
#_0BBC02: db $2F, $4D, $CF, $29, $2A, $34, $3D, $CF ; さる⎵おかたの⎵
#_0BBC0A: db $46, $26, $3A, $4A, $4C ; めいにより
#_0BBC0F: db $F9 ; new line
#_0BBC10: db $50, $9C, $CF, $35, $2A, $4B, $51, $CF ; わが⎵ちからを⎵
#_0BBC18: db $40, $27, $A2, $2E, $46, $34, $CF, $A5 ; ふうじこめた⎵ぞ
#_0BBC20: db $27, $A6 ; うだ
#_0BBC22: db $FC ; wait for key and new line
#_0BBC23: db $FA ; clear message box
#_0BBC24: db $33, $3D, $CF, $48, $2C, $46, $47, $CF ; その⎵やくめも⎵
#_0BBC2C: db $47, $3E, $48, $CF, $29, $50, $4C, $A6 ; もはや⎵おわりだ
#_0BBC34: db $FC ; wait for key and new line
#_0BBC35: db $D3, $19 ; go to message 19

;===================================================================================================

; ここに あらわれるとは ただものでは ないな
; おぬしの ような ニンゲンが あらわれたとき
; したがうよう さるおかたに めいじられている
; [CLASS] [DEMON1]は
; おぬしに したがおう
Message_03_05_12:
#_0BBC37: db $2E, $2E, $3A, $CF, $25, $4B, $50, $4E ; ここに⎵あらわれ
#_0BBC3F: db $4D, $38, $3E, $CF, $34, $A6, $47, $3D ; るとは⎵ただもの
#_0BBC47: db $A9, $3E, $CF, $39, $26, $39 ; では⎵ないな
#_0BBC4D: db $FC ; wait for key and new line
#_0BBC4E: db $D5, $39 ; send 39 to APU
#_0BBC50: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBC52: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBC57: db $FE, $07, $19 ; ext command 07: draw buffered text then wait 24 frames
#_0BBC5A: db $E4, $00 ; load demon $00
#_0BBC5C: db $FA ; clear message box
#_0BBC5D: db $FE, $05, $F0, $FF, $16 ; ext command 05: go to message 16 if 11C >= -16
#_0BBC62: db $29, $3B, $30, $3D, $CF, $4A, $27, $39 ; おぬしの⎵ような
#_0BBC6A: db $CF, $72, $8A, $B8, $8A, $9C, $CF, $25 ; ⎵ニンゲンが⎵あ
#_0BBC72: db $4B, $50, $4E, $34, $38, $2B ; らわれたとき
#_0BBC78: db $F9 ; new line
#_0BBC79: db $30, $34, $9C, $27, $4A, $27, $CF, $2F ; したがうよう⎵さ
#_0BBC81: db $4D, $29, $2A, $34, $3A, $CF, $46, $26 ; るおかたに⎵めい
#_0BBC89: db $A2, $4B, $4E, $37, $26, $4D ; じられている
#_0BBC8F: db $F9 ; new line
#_0BBC90: db $F6 ; write class name from $0506
#_0BBC91: db $CF ; ⎵
#_0BBC92: db $F5 ; write demon name from $050A
#_0BBC93: db $3E ; は
#_0BBC94: db $F9 ; new line
#_0BBC95: db $29, $3B, $30, $3A, $CF, $30, $34, $9C ; おぬしに⎵したが
#_0BBC9D: db $29, $27 ; おう
#_0BBC9F: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]が «ナカマに くわわった»
Message_03_05_13:
#_0BBCA0: db $D0, $DD ; set progress bit DD
#_0BBCA2: db $FE, $06, $38, $15 ; ext command 06: go to message 15 if MC level < 56
#_0BBCA6: db $FE, $09, $14 ; ext command 09: demon joins party or message 14 if full
#_0BBCA9: db $DE, $00, $00, $18, $01 ; load 1x demon 0018
#_0BBCAE: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BBCB1: db $FA ; clear message box
#_0BBCB2: db $97 ; >
#_0BBCB3: db $F5 ; write demon name from $050A
#_0BBCB4: db $9C, $CF ; が⎵
#_0BBCB6: db $F2, $2F ; prewritten text 2F
#_0BBCB8: db $FC ; wait for key and new line
#_0BBCB9: db $D1, $DD ; clear progress bit DD
#_0BBCBB: db $D3, $19 ; go to message 19

;===================================================================================================

; «では ナカマを へらして»こい
Message_03_05_14:
#_0BBCBD: db $FA ; clear message box
#_0BBCBE: db $F2, $43 ; prewritten text 43
#_0BBCC0: db $2E, $26 ; こい
#_0BBCC2: db $FC ; wait for key and new line
#_0BBCC3: db $D3, $1D ; go to message 1D

;===================================================================================================

; «では もっと レベルを あげてこい»
Message_03_05_15:
#_0BBCC5: db $FA ; clear message box
#_0BBCC6: db $F2, $88 ; prewritten text 88
#_0BBCC8: db $D3, $1D ; go to message 1D

;===================================================================================================

; だが しょせん ニンゲン
; かなわぬこと おもいしらせてやる!
Message_03_05_16:
#_0BBCCA: db $A6, $9C, $CF, $30, $57, $32, $52, $CF ; だが⎵しょせん⎵
#_0BBCD2: db $72, $8A, $B8, $8A ; ニンゲン
#_0BBCD6: db $F9 ; new line
#_0BBCD7: db $2A, $39, $50, $3B, $2E, $38, $CF, $29 ; かなわぬこと⎵お
#_0BBCDF: db $47, $26, $30, $4B, $32, $37, $48, $4D ; もいしらせてやる
#_0BBCE7: db $94 ; !
#_0BBCE8: db $FC ; wait for key and new line
#_0BBCE9: db $D5, $39 ; send 39 to APU
#_0BBCEB: db $E5, $01, $18 ; [COMMAND E5:01,18]

;===================================================================================================

Message_03_05_17:
#_0BBCEE: db $E5, $00, $18 ; [COMMAND E5:00,18]
#_0BBCF1: db $D3, $17 ; go to message 17

;===================================================================================================

Message_03_05_18:
#_0BBCF3: db $FE, $04, $19, $1A ; ext command 04: message 19 if 11C >= 112; 1A if >= 144

;===================================================================================================

Message_03_05_19:
#_0BBCF7: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBCF9: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBCFE: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BBD01: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBD04: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBD09: db $E4, $00 ; load demon $00
#_0BBD0B: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BBD0E: db $D0, $D9 ; set progress bit D9
#_0BBD10: db $D3, $1D ; go to message 1D

;===================================================================================================

; [DEMON1]:
; まいった! おそれいった!
; あの おかたに まけていらいだ
; おぬしに ついてゆこう
Message_03_05_1A:
#_0BBD12: db $F5 ; write demon name from $050A
#_0BBD13: db $9A ; :
#_0BBD14: db $F9 ; new line
#_0BBD15: db $43, $26, $58, $34, $94, $CF, $29, $33 ; まいった!⎵おそ
#_0BBD1D: db $4E, $26, $58, $34, $94 ; れいった!
#_0BBD22: db $F9 ; new line
#_0BBD23: db $25, $3D, $CF, $29, $2A, $34, $3A, $CF ; あの⎵おかたに⎵
#_0BBD2B: db $43, $2D, $37, $26, $4B, $26, $A6 ; まけていらいだ
#_0BBD32: db $F9 ; new line
#_0BBD33: db $29, $3B, $30, $3A, $CF, $36, $26, $37 ; おぬしに⎵ついて
#_0BBD3B: db $49, $2E, $27 ; ゆこう
#_0BBD3E: db $FC ; wait for key and new line
#_0BBD3F: db $D3, $13 ; go to message 13

;===================================================================================================

; きたな [CHASE]よ
Message_03_05_1B:
#_0BBD41: db $2B, $34, $39, $CF ; きたな⎵
#_0BBD45: db $F0 ; write player name
#_0BBD46: db $4A ; よ
#_0BBD47: db $FC ; wait for key and new line
#_0BBD48: db $D3, $13 ; go to message 13

;===================================================================================================

; «>[DEMON1]の ぞうが ある»
Message_03_05_1C:
#_0BBD4A: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBD4F: db $E4, $00 ; load demon $00
#_0BBD51: db $F2, $77 ; prewritten text 77

;===================================================================================================

Message_03_05_1D:
#_0BBD53: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBD55: db $FE, $1A, $47, $32, $02, $00, $09, $1D ; ext command 1A: 47,32,02,00,09,1D
#_0BBD5D: db $D3, $3D ; go to message 3D

;===================================================================================================

; «>[ITEM]が かがやき»
; «ひかりが とびらを てらした»
; «なかに はいりますか?»
Message_03_05_1E:
#_0BBD5F: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BBD64: db $DD, $FD, $50 ; go to message 50 if missing item FD
#_0BBD67: db $E1, $FD ; set $0A50 to item FD
#_0BBD69: db $F2, $81 ; prewritten text 81
#_0BBD6B: db $FA ; clear message box
#_0BBD6C: db $F2, $68 ; prewritten text 68
#_0BBD6E: db $F8, $1F ; YES/NO - go to message 1F if YES
#_0BBD70: db $FF ; end of message

;===================================================================================================

Message_03_05_1F:
#_0BBD71: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BBD76: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BBD79: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBD7C: db $FE, $1A, $43, $77, $02, $00, $09, $1D ; ext command 1A: 43,77,02,00,09,1D

;===================================================================================================

; [DEMON1]:
; この ぞうは «トウキョウ»の ヒガシを まもる
; わが ぶんしん
; しゅごしんの めいにより
; ながく ここに あったのだ«・・・»
Message_03_05_20:
#_0BBD84: db $D7, $24 ; load scene 24
#_0BBD86: db $D5, $46 ; send 46 to APU
#_0BBD88: db $D4, $03 ; set text box size to 3
#_0BBD8A: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBD8F: db $E4, $00 ; load demon $00
#_0BBD91: db $DE, $00, $00, $17, $01 ; load 1x demon 0017
#_0BBD96: db $D2, $DA, $2B ; test progress bit DA for message 2B
#_0BBD99: db $F5 ; write demon name from $050A
#_0BBD9A: db $9A ; :
#_0BBD9B: db $F9 ; new line
#_0BBD9C: db $D2, $DE, $2A ; test progress bit DE for message 2A
#_0BBD9F: db $FE, $08, $04, $21 ; ext command 08: something with levels to message 21, 04 TODO
#_0BBDA3: db $2E, $3D, $CF, $A5, $27, $3E, $CF ; この⎵ぞうは⎵
#_0BBDAA: db $F2, $1C ; prewritten text 1C
#_0BBDAC: db $3D, $CF, $77, $B5, $68, $51, $CF, $43 ; の⎵ヒガシを⎵ま
#_0BBDB4: db $47, $4D ; もる
#_0BBDB6: db $F9 ; new line
#_0BBDB7: db $50, $9C, $CF, $AD, $52, $30, $52 ; わが⎵ぶんしん
#_0BBDBE: db $FC ; wait for key and new line
#_0BBDBF: db $FA ; clear message box
#_0BBDC0: db $30, $56, $A0, $30, $52, $3D, $CF, $46 ; しゅごしんの⎵め
#_0BBDC8: db $26, $3A, $4A, $4C ; いにより
#_0BBDCC: db $F9 ; new line
#_0BBDCD: db $39, $9C, $2C, $CF, $2E, $2E, $3A, $CF ; ながく⎵ここに⎵
#_0BBDD5: db $25, $58, $34, $3D, $A6 ; あったのだ
#_0BBDDA: db $F2, $0B ; prewritten text 0B
#_0BBDDC: db $FC ; wait for key and new line
#_0BBDDD: db $D3, $28 ; go to message 28

;===================================================================================================

; おぬしは うわさの [CHASE]か?
; われら しゅごしんのもと
; «トウキョウ»の しほうを まもりたるもの
; だが しゅごしんと むすんだ ちかいは
; いま おわりのときを むかえた
; われ [CLASS] [DEMON1]
; [CHASE]の もとで たたかおう
Message_03_05_21:
#_0BBDDF: db $29, $3B, $30, $3E, $CF, $27, $50, $2F ; おぬしは⎵うわさ
#_0BBDE7: db $3D, $CF ; の⎵
#_0BBDE9: db $F0 ; write player name
#_0BBDEA: db $2A, $95 ; か?
#_0BBDEC: db $F9 ; new line
#_0BBDED: db $50, $4E, $4B, $CF, $30, $56, $A0, $30 ; われら⎵しゅごし
#_0BBDF5: db $52, $3D, $47, $38 ; んのもと
#_0BBDF9: db $F9 ; new line
#_0BBDFA: db $F2, $1C ; prewritten text 1C
#_0BBDFC: db $3D, $CF, $30, $42, $27, $51, $CF, $43 ; の⎵しほうを⎵ま
#_0BBE04: db $47, $4C, $34, $4D, $47, $3D ; もりたるもの
#_0BBE0A: db $FC ; wait for key and new line
#_0BBE0B: db $D5, $39 ; send 39 to APU
#_0BBE0D: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBE0F: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBE14: db $FE, $07, $19 ; ext command 07: draw buffered text then wait 24 frames
#_0BBE17: db $DE, $00, $00, $17, $01 ; load 1x demon 0017
#_0BBE1C: db $E4, $00 ; load demon $00
#_0BBE1E: db $FE, $05, $F0, $FF, $25 ; ext command 05: go to message 25 if 11C >= -16
#_0BBE23: db $FA ; clear message box
#_0BBE24: db $A6, $9C, $CF, $30, $56, $A0, $30, $52 ; だが⎵しゅごしん
#_0BBE2C: db $38, $CF, $45, $31, $52, $A6, $CF, $35 ; と⎵むすんだ⎵ち
#_0BBE34: db $2A, $26, $3E ; かいは
#_0BBE37: db $F9 ; new line
#_0BBE38: db $26, $43, $CF, $29, $50, $4C, $3D, $38 ; いま⎵おわりのと
#_0BBE40: db $2B, $51, $CF, $45, $2A, $28, $34 ; きを⎵むかえた
#_0BBE47: db $F9 ; new line
#_0BBE48: db $50, $4E, $CF ; われ⎵
#_0BBE4B: db $F6 ; write class name from $0506
#_0BBE4C: db $CF ; ⎵
#_0BBE4D: db $F5 ; write demon name from $050A
#_0BBE4E: db $F9 ; new line
#_0BBE4F: db $F0 ; write player name
#_0BBE50: db $3D, $CF, $47, $38, $A9, $CF, $34, $34 ; の⎵もとで⎵たた
#_0BBE58: db $2A, $29, $27 ; かおう
#_0BBE5B: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]が «ナカマに くわわった»
Message_03_05_22:
#_0BBE5C: db $D0, $DE ; set progress bit DE
#_0BBE5E: db $FE, $06, $3A, $24 ; ext command 06: go to message 24 if MC level < 58
#_0BBE62: db $FE, $09, $23 ; ext command 09: demon joins party or message 23 if full
#_0BBE65: db $DE, $00, $00, $17, $01 ; load 1x demon 0017
#_0BBE6A: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BBE6D: db $FA ; clear message box
#_0BBE6E: db $97 ; >
#_0BBE6F: db $F5 ; write demon name from $050A
#_0BBE70: db $9C, $CF ; が⎵
#_0BBE72: db $F2, $2F ; prewritten text 2F
#_0BBE74: db $FC ; wait for key and new line
#_0BBE75: db $D1, $DE ; clear progress bit DE
#_0BBE77: db $D3, $28 ; go to message 28

;===================================================================================================

; «では ナカマを へらして»こい
Message_03_05_23:
#_0BBE79: db $FA ; clear message box
#_0BBE7A: db $F2, $43 ; prewritten text 43
#_0BBE7C: db $2E, $26 ; こい
#_0BBE7E: db $FC ; wait for key and new line
#_0BBE7F: db $D3, $2C ; go to message 2C

;===================================================================================================

; «では もっと レベルを あげてこい»
Message_03_05_24:
#_0BBE81: db $FA ; clear message box
#_0BBE82: db $F2, $88 ; prewritten text 88
#_0BBE84: db $D3, $2C ; go to message 2C

;===================================================================================================

; ただならぬ ちからを かんじる
; ひさびさに たのしませて もらえそうだな
; さあ おぬしらの ちから
; みせてみろ!
Message_03_05_25:
#_0BBE86: db $FA ; clear message box
#_0BBE87: db $34, $A6, $39, $4B, $3B, $CF, $35, $2A ; ただならぬ⎵ちか
#_0BBE8F: db $4B, $51, $CF, $2A, $52, $A2, $4D ; らを⎵かんじる
#_0BBE96: db $F9 ; new line
#_0BBE97: db $3F, $2F, $AC, $2F, $3A, $CF, $34, $3D ; ひさびさに⎵たの
#_0BBE9F: db $30, $43, $32, $37, $CF, $47, $4B, $28 ; しませて⎵もらえ
#_0BBEA7: db $33, $27, $A6, $39 ; そうだな
#_0BBEAB: db $FC ; wait for key and new line
#_0BBEAC: db $FA ; clear message box
#_0BBEAD: db $2F, $25, $CF, $29, $3B, $30, $4B, $3D ; さあ⎵おぬしらの
#_0BBEB5: db $CF, $35, $2A, $4B ; ⎵ちから
#_0BBEB9: db $F9 ; new line
#_0BBEBA: db $44, $32, $37, $44, $4F, $94 ; みせてみろ!
#_0BBEC0: db $FC ; wait for key and new line
#_0BBEC1: db $D5, $39 ; send 39 to APU
#_0BBEC3: db $E5, $01, $27 ; [COMMAND E5:01,27]

;===================================================================================================

Message_03_05_26:
#_0BBEC6: db $E5, $00, $27 ; [COMMAND E5:00,27]
#_0BBEC9: db $D3, $26 ; go to message 26

;===================================================================================================

Message_03_05_27:
#_0BBECB: db $FE, $04, $28, $29 ; ext command 04: message 28 if 11C >= 112; 29 if >= 144

;===================================================================================================

Message_03_05_28:
#_0BBECF: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBED1: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBED6: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BBED9: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBEDC: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBEE1: db $E4, $00 ; load demon $00
#_0BBEE3: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BBEE6: db $D0, $DA ; set progress bit DA
#_0BBEE8: db $D3, $2C ; go to message 2C

;===================================================================================================

; [DEMON1]:
; しゅごしんの いうとおり
; われらを うちたおす ニンゲンが あらわれた
; [CHASE]よ われ [DEMON1]は
; おぬしと ともに たたかおう
Message_03_05_29:
#_0BBEEA: db $F5 ; write demon name from $050A
#_0BBEEB: db $9A ; :
#_0BBEEC: db $F9 ; new line
#_0BBEED: db $30, $56, $A0, $30, $52, $3D, $CF, $26 ; しゅごしんの⎵い
#_0BBEF5: db $27, $38, $29, $4C ; うとおり
#_0BBEF9: db $F9 ; new line
#_0BBEFA: db $50, $4E, $4B, $51, $CF, $27, $35, $34 ; われらを⎵うちた
#_0BBF02: db $29, $31, $CF, $72, $8A, $B8, $8A, $9C ; おす⎵ニンゲンが
#_0BBF0A: db $CF, $25, $4B, $50, $4E, $34 ; ⎵あらわれた
#_0BBF10: db $FC ; wait for key and new line
#_0BBF11: db $FA ; clear message box
#_0BBF12: db $F0 ; write player name
#_0BBF13: db $4A, $CF, $50, $4E, $CF ; よ⎵われ⎵
#_0BBF18: db $F5 ; write demon name from $050A
#_0BBF19: db $3E ; は
#_0BBF1A: db $F9 ; new line
#_0BBF1B: db $29, $3B, $30, $38, $CF, $38, $47, $3A ; おぬしと⎵ともに
#_0BBF23: db $CF, $34, $34, $2A, $29, $27 ; ⎵たたかおう
#_0BBF29: db $FC ; wait for key and new line
#_0BBF2A: db $D3, $22 ; go to message 22

;===================================================================================================

; おお [CHASE]か
Message_03_05_2A:
#_0BBF2C: db $29, $29, $CF ; おお⎵
#_0BBF2F: db $F0 ; write player name
#_0BBF30: db $2A ; か
#_0BBF31: db $FC ; wait for key and new line
#_0BBF32: db $D3, $22 ; go to message 22

;===================================================================================================

; «>[DEMON1]の ぞうが ある»
Message_03_05_2B:
#_0BBF34: db $DE, $01, $00, $2A, $01 ; load 1x demon 012A
#_0BBF39: db $E4, $00 ; load demon $00
#_0BBF3B: db $F2, $77 ; prewritten text 77

;===================================================================================================

Message_03_05_2C:
#_0BBF3D: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBF3F: db $FE, $1A, $42, $F7, $02, $00, $09, $1D ; ext command 1A: 42,F7,02,00,09,1D
#_0BBF47: db $D3, $3D ; go to message 3D

;===================================================================================================

; «>[ITEM]が かがやき»
; «ひかりが とびらを てらした»
; «なかに はいりますか?»
Message_03_05_2D:
#_0BBF49: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BBF4E: db $DD, $FD, $50 ; go to message 50 if missing item FD
#_0BBF51: db $E1, $FD ; set $0A50 to item FD
#_0BBF53: db $F2, $81 ; prewritten text 81
#_0BBF55: db $FA ; clear message box
#_0BBF56: db $F2, $68 ; prewritten text 68
#_0BBF58: db $F8, $2E ; YES/NO - go to message 2E if YES
#_0BBF5A: db $FF ; end of message

;===================================================================================================

Message_03_05_2E:
#_0BBF5B: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BBF60: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BBF63: db $D6, $00, $00 ; delete sprite in slot 00
#_0BBF66: db $FE, $1A, $5A, $30, $02, $00, $09, $1D ; ext command 1A: 5A,30,02,00,09,1D

;===================================================================================================

; [DEMON1]:
; わが まりょくを ふうじこめた ぞうで ある
; «トウキョウ»の キタを まもっていた
Message_03_05_2F:
#_0BBF6E: db $D7, $24 ; load scene 24
#_0BBF70: db $D5, $46 ; send 46 to APU
#_0BBF72: db $D4, $03 ; set text box size to 3
#_0BBF74: db $DE, $01, $00, $29, $01 ; load 1x demon 0129
#_0BBF79: db $E4, $00 ; load demon $00
#_0BBF7B: db $DE, $00, $00, $13, $01 ; load 1x demon 0013
#_0BBF80: db $D2, $DB, $3B ; test progress bit DB for message 3B
#_0BBF83: db $F5 ; write demon name from $050A
#_0BBF84: db $9A ; :
#_0BBF85: db $F9 ; new line
#_0BBF86: db $D2, $DF, $3A ; test progress bit DF for message 3A
#_0BBF89: db $FE, $08, $04, $30 ; ext command 08: something with levels to message 30, 04 TODO
#_0BBF8D: db $50, $9C, $CF, $43, $4C, $57, $2C, $51 ; わが⎵まりょくを
#_0BBF95: db $CF, $40, $27, $A2, $2E, $46, $34, $CF ; ⎵ふうじこめた⎵
#_0BBF9D: db $A5, $27, $A9, $CF, $25, $4D ; ぞうで⎵ある
#_0BBFA3: db $F9 ; new line
#_0BBFA4: db $F2, $1C ; prewritten text 1C
#_0BBFA6: db $3D, $CF, $63, $6C, $51, $CF, $43, $47 ; の⎵キタを⎵まも
#_0BBFAE: db $58, $37, $26, $34 ; っていた
#_0BBFB2: db $FC ; wait for key and new line
#_0BBFB3: db $D3, $37 ; go to message 37

;===================================================================================================

; ニンゲンよ ここへ あしを ふみいれるからには
; かくごが できているのだな
; われら してんのうは «トウキョウ»の しゅごしん
; タイラノ マサカドこうに ちかいを たてた
; われらに かてる ニンゲンが あらわれるまで
; «トウキョウ»の しほうを まもり おさめることを
; そして いま おぬしが あらわれた
; わがちから [CHASE]に あたえよう
Message_03_05_30:
#_0BBFB5: db $72, $8A, $B8, $8A, $4A, $CF, $2E, $2E ; ニンゲンよ⎵ここ
#_0BBFBD: db $41, $CF, $25, $30, $51, $CF, $40, $44 ; へ⎵あしを⎵ふみ
#_0BBFC5: db $26, $4E, $4D, $2A, $4B, $3A, $3E ; いれるからには
#_0BBFCC: db $F9 ; new line
#_0BBFCD: db $2A, $2C, $A0, $9C, $CF, $A9, $2B, $37 ; かくごが⎵できて
#_0BBFD5: db $26, $4D, $3D, $A6, $39 ; いるのだな
#_0BBFDA: db $FC ; wait for key and new line
#_0BBFDB: db $D5, $39 ; send 39 to APU
#_0BBFDD: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BBFDF: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BBFE4: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BBFE7: db $E4, $00 ; load demon $00
#_0BBFE9: db $FA ; clear message box
#_0BBFEA: db $FE, $05, $F0, $FF, $34 ; ext command 05: go to message 34 if 11C >= -16
#_0BBFEF: db $50, $4E, $4B, $CF, $30, $37, $52, $3D ; われら⎵してんの
#_0BBFF7: db $27, $3E, $CF ; うは⎵
#_0BBFFA: db $F2, $1C ; prewritten text 1C
#_0BBFFC: db $3D, $CF, $30, $56, $A0, $30, $52 ; の⎵しゅごしん
#_0BC003: db $F9 ; new line
#_0BC004: db $6C, $5E, $83, $75, $CF, $7B, $67, $62 ; タイラノ⎵マサカ
#_0BC00C: db $C3, $2E, $27, $3A, $CF, $35, $2A, $26 ; ドこうに⎵ちかい
#_0BC014: db $51, $CF, $34, $37, $34 ; を⎵たてた
#_0BC019: db $FC ; wait for key and new line
#_0BC01A: db $FA ; clear message box
#_0BC01B: db $50, $4E, $4B, $3A, $CF, $2A, $37, $4D ; われらに⎵かてる
#_0BC023: db $CF, $72, $8A, $B8, $8A, $9C, $CF, $25 ; ⎵ニンゲンが⎵あ
#_0BC02B: db $4B, $50, $4E, $4D, $43, $A9 ; らわれるまで
#_0BC031: db $F9 ; new line
#_0BC032: db $F2, $1C ; prewritten text 1C
#_0BC034: db $3D, $CF, $30, $42, $27, $51, $CF, $43 ; の⎵しほうを⎵ま
#_0BC03C: db $47, $4C, $CF, $29, $2F, $46, $4D, $2E ; もり⎵おさめるこ
#_0BC044: db $38, $51 ; とを
#_0BC046: db $FC ; wait for key and new line
#_0BC047: db $FA ; clear message box
#_0BC048: db $33, $30, $37, $CF, $26, $43, $CF, $29 ; そして⎵いま⎵お
#_0BC050: db $3B, $30, $9C, $CF, $25, $4B, $50, $4E ; ぬしが⎵あらわれ
#_0BC058: db $34 ; た
#_0BC059: db $F9 ; new line
#_0BC05A: db $50, $9C, $35, $2A, $4B, $CF ; わがちから⎵
#_0BC060: db $F0 ; write player name
#_0BC061: db $3A, $CF, $25, $34, $28, $4A, $27 ; に⎵あたえよう
#_0BC068: db $FC ; wait for key and new line

;===================================================================================================

; >[DEMON1]が «ナカマに くわわった»
Message_03_05_31:
#_0BC069: db $D0, $DF ; set progress bit DF
#_0BC06B: db $FE, $06, $4A, $33 ; ext command 06: go to message 33 if MC level < 74
#_0BC06F: db $FE, $09, $32 ; ext command 09: demon joins party or message 32 if full
#_0BC072: db $DE, $00, $00, $13, $01 ; load 1x demon 0013
#_0BC077: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BC07A: db $FA ; clear message box
#_0BC07B: db $97 ; >
#_0BC07C: db $F5 ; write demon name from $050A
#_0BC07D: db $9C, $CF ; が⎵
#_0BC07F: db $F2, $2F ; prewritten text 2F
#_0BC081: db $FC ; wait for key and new line
#_0BC082: db $D1, $DF ; clear progress bit DF
#_0BC084: db $D3, $38 ; go to message 38

;===================================================================================================

; «では ナカマを へらして»こい
Message_03_05_32:
#_0BC086: db $FA ; clear message box
#_0BC087: db $F2, $43 ; prewritten text 43
#_0BC089: db $2E, $26 ; こい
#_0BC08B: db $FC ; wait for key and new line
#_0BC08C: db $D3, $3C ; go to message 3C

;===================================================================================================

; «では もっと レベルを あげてこい»
Message_03_05_33:
#_0BC08E: db $FA ; clear message box
#_0BC08F: db $F2, $88 ; prewritten text 88
#_0BC091: db $D3, $3C ; go to message 3C

;===================================================================================================

; [DEMON1]の なに かけて
; おぬしと たたかおう! ゆくぞ!
Message_03_05_34:
#_0BC093: db $F5 ; write demon name from $050A
#_0BC094: db $3D, $CF, $39, $3A, $CF, $2A, $2D, $37 ; の⎵なに⎵かけて
#_0BC09C: db $F9 ; new line
#_0BC09D: db $29, $3B, $30, $38, $CF, $34, $34, $2A ; おぬしと⎵たたか
#_0BC0A5: db $29, $27, $94, $CF, $49, $2C, $A5, $94 ; おう!⎵ゆくぞ!
#_0BC0AD: db $FC ; wait for key and new line
#_0BC0AE: db $D5, $39 ; send 39 to APU
#_0BC0B0: db $E5, $01, $36 ; [COMMAND E5:01,36]

;===================================================================================================

Message_03_05_35:
#_0BC0B3: db $E5, $00, $36 ; [COMMAND E5:00,36]
#_0BC0B6: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_05_36:
#_0BC0B8: db $FA ; clear message box
#_0BC0B9: db $FE, $04, $37, $39 ; ext command 04: message 37 if 11C >= 112; 39 if >= 144

;===================================================================================================

; [DEMON1]:
; «・・・»マ マサカドこうよ
; [CLASS] [DEMON1]
; ここに やぶれたり«・・・»
Message_03_05_37:
#_0BC0BD: db $F5 ; write demon name from $050A
#_0BC0BE: db $9A ; :
#_0BC0BF: db $F9 ; new line
#_0BC0C0: db $F2, $0B ; prewritten text 0B
#_0BC0C2: db $7B, $CF, $7B, $67, $62, $C3, $2E, $27 ; マ⎵マサカドこう
#_0BC0CA: db $4A ; よ
#_0BC0CB: db $F9 ; new line
#_0BC0CC: db $F6 ; write class name from $0506
#_0BC0CD: db $CF ; ⎵
#_0BC0CE: db $F5 ; write demon name from $050A
#_0BC0CF: db $F9 ; new line
#_0BC0D0: db $2E, $2E, $3A, $CF, $48, $AD, $4E, $34 ; ここに⎵やぶれた
#_0BC0D8: db $4C ; り
#_0BC0D9: db $F2, $0B ; prewritten text 0B
#_0BC0DB: db $FC ; wait for key and new line
#_0BC0DC: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC0DE: db $D6, $00, $9D, $78, $38 ; place sprite 9D in slot 00 at XY:{78,38}
#_0BC0E3: db $FE, $07, $13 ; ext command 07: draw buffered text then wait 18 frames
#_0BC0E6: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC0E9: db $DE, $01, $00, $29, $01 ; load 1x demon 0129
#_0BC0EE: db $E4, $00 ; load demon $00
#_0BC0F0: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames

;===================================================================================================

Message_03_05_38:
#_0BC0F3: db $D0, $DB ; set progress bit DB
#_0BC0F5: db $D3, $3C ; go to message 3C

;===================================================================================================

; まさか ニンゲンに やぶれようとは
; だが これで マサカドこうとの
; やくそくは はたした
; [CLASS] [DEMON1] これからは
; [CHASE]よ おぬしと ともにあり
; おぬしと ともに たたかおう
Message_03_05_39:
#_0BC0F7: db $FE, $2D, $03 ; ext command 2D: call routine 00B99C with value 03 TODO
#_0BC0FA: db $43, $2F, $2A, $CF, $72, $8A, $B8, $8A ; まさか⎵ニンゲン
#_0BC102: db $3A, $CF, $48, $AD, $4E, $4A, $27, $38 ; に⎵やぶれようと
#_0BC10A: db $3E ; は
#_0BC10B: db $F9 ; new line
#_0BC10C: db $A6, $9C, $CF, $2E, $4E, $A9, $CF, $7B ; だが⎵これで⎵マ
#_0BC114: db $67, $62, $C3, $2E, $27, $38, $3D ; サカドこうとの
#_0BC11B: db $F9 ; new line
#_0BC11C: db $48, $2C, $33, $2C, $3E, $CF, $3E, $34 ; やくそくは⎵はた
#_0BC124: db $30, $34 ; した
#_0BC126: db $FC ; wait for key and new line
#_0BC127: db $FA ; clear message box
#_0BC128: db $F6 ; write class name from $0506
#_0BC129: db $CF ; ⎵
#_0BC12A: db $F5 ; write demon name from $050A
#_0BC12B: db $CF, $2E, $4E, $2A, $4B, $3E ; ⎵これからは
#_0BC131: db $F9 ; new line
#_0BC132: db $F0 ; write player name
#_0BC133: db $4A, $CF, $29, $3B, $30, $38, $CF, $38 ; よ⎵おぬしと⎵と
#_0BC13B: db $47, $3A, $25, $4C ; もにあり
#_0BC13F: db $F9 ; new line
#_0BC140: db $29, $3B, $30, $38, $CF, $38, $47, $3A ; おぬしと⎵ともに
#_0BC148: db $CF, $34, $34, $2A, $29, $27 ; ⎵たたかおう
#_0BC14E: db $FC ; wait for key and new line
#_0BC14F: db $D3, $31 ; go to message 31

;===================================================================================================

; また やってきたな [CHASE]よ
Message_03_05_3A:
#_0BC151: db $43, $34, $CF, $48, $58, $37, $2B, $34 ; また⎵やってきた
#_0BC159: db $39, $CF ; な⎵
#_0BC15B: db $F0 ; write player name
#_0BC15C: db $4A ; よ
#_0BC15D: db $FC ; wait for key and new line
#_0BC15E: db $D3, $31 ; go to message 31

;===================================================================================================

; «>[DEMON1]の ぞうが ある»
Message_03_05_3B:
#_0BC160: db $F2, $77 ; prewritten text 77
#_0BC162: db $D3, $38 ; go to message 38

;===================================================================================================

Message_03_05_3C:
#_0BC164: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC166: db $FE, $1A, $5A, $B1, $02, $00, $09, $21 ; ext command 1A: 5A,B1,02,00,09,21

;===================================================================================================

Message_03_05_3D:
#_0BC16E: db $D2, $D8, $3E ; test progress bit D8 for message 3E
#_0BC171: db $D2, $DC, $3E ; test progress bit DC for message 3E
#_0BC174: db $D2, $D9, $3F ; test progress bit D9 for message 3F
#_0BC177: db $D2, $DD, $3F ; test progress bit DD for message 3F
#_0BC17A: db $D2, $DA, $40 ; test progress bit DA for message 40
#_0BC17D: db $D2, $DE, $40 ; test progress bit DE for message 40
#_0BC180: db $FF ; end of message

;===================================================================================================

Message_03_05_3E:
#_0BC181: db $D2, $D9, $41 ; test progress bit D9 for message 41
#_0BC184: db $D2, $DD, $41 ; test progress bit DD for message 41

;===================================================================================================

Message_03_05_3F:
#_0BC187: db $D2, $DA, $41 ; test progress bit DA for message 41
#_0BC18A: db $D2, $DE, $41 ; test progress bit DE for message 41

;===================================================================================================

Message_03_05_40:
#_0BC18D: db $D2, $DB, $41 ; test progress bit DB for message 41
#_0BC190: db $D2, $DF, $41 ; test progress bit DF for message 41
#_0BC193: db $FF ; end of message

;===================================================================================================

Message_03_05_41:
#_0BC194: db $D0, $9F ; set progress bit 9F
#_0BC196: db $FF ; end of message

;===================================================================================================

Message_03_05_42:
#_0BC197: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BC19C: db $D2, $0C, $48 ; test progress bit 0C for message 48
#_0BC19F: db $DD, $FD, $50 ; go to message 50 if missing item FD
#_0BC1A2: db $D2, $D8, $43 ; test progress bit D8 for message 43
#_0BC1A5: db $D3, $50 ; go to message 50

;===================================================================================================

Message_03_05_43:
#_0BC1A7: db $D2, $D9, $44 ; test progress bit D9 for message 44
#_0BC1AA: db $D3, $50 ; go to message 50

;===================================================================================================

Message_03_05_44:
#_0BC1AC: db $D2, $DA, $45 ; test progress bit DA for message 45
#_0BC1AF: db $D3, $50 ; go to message 50

;===================================================================================================

Message_03_05_45:
#_0BC1B1: db $D2, $DB, $46 ; test progress bit DB for message 46
#_0BC1B4: db $D3, $50 ; go to message 50

;===================================================================================================

; «>[ITEM]が かがやき»
; «ひかりが とびらを てらした»
; «なかに はいりますか?»
Message_03_05_46:
#_0BC1B6: db $E1, $FD ; set $0A50 to item FD
#_0BC1B8: db $F2, $81 ; prewritten text 81
#_0BC1BA: db $FA ; clear message box
#_0BC1BB: db $F2, $68 ; prewritten text 68
#_0BC1BD: db $F8, $47 ; YES/NO - go to message 47 if YES
#_0BC1BF: db $FF ; end of message

;===================================================================================================

Message_03_05_47:
#_0BC1C0: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BC1C5: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BC1C8: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC1CB: db $D2, $0C, $49 ; test progress bit 0C for message 49
#_0BC1CE: db $FE, $1A, $65, $B8, $12, $00, $09, $21 ; ext command 1A: 65,B8,12,00,09,21
#_0BC1D6: db $D0, $0C ; set progress bit 0C
#_0BC1D8: db $FF ; end of message

;===================================================================================================

; >そとに でますか?
Message_03_05_48:
#_0BC1D9: db $97, $33, $38, $3A, $CF, $A9, $43, $31 ; >そとに⎵でます
#_0BC1E1: db $2A, $95 ; か?
#_0BC1E3: db $F8, $47 ; YES/NO - go to message 47 if YES
#_0BC1E5: db $FF ; end of message

;===================================================================================================

Message_03_05_49:
#_0BC1E6: db $FE, $1A, $65, $36, $12, $00, $09, $21 ; ext command 1A: 65,36,12,00,09,21
#_0BC1EE: db $D1, $0C ; clear progress bit 0C
#_0BC1F0: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_05_4A:
#_0BC1F1: db $D6, $00, $6B, $60, $28 ; place sprite 6B in slot 00 at XY:{60,28}
#_0BC1F6: db $97 ; >
#_0BC1F7: db $F2, $68 ; prewritten text 68
#_0BC1F9: db $F8, $4B ; YES/NO - go to message 4B if YES
#_0BC1FB: db $FF ; end of message

;===================================================================================================

Message_03_05_4B:
#_0BC1FC: db $D6, $00, $74, $60, $28 ; place sprite 74 in slot 00 at XY:{60,28}
#_0BC201: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BC204: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC207: db $FE, $1A, $63, $3B, $12, $00, $00, $00 ; ext command 1A: 63,3B,12,00,00,00
#_0BC20F: db $FE, $37 ; ext command 37: reload dungeon view

;===================================================================================================

; マサカドさま:
; よは 1せんねんのながきに わたり
; ここ «トウキョウ»の まもりを つとめし
; タイラノ マサカドである
; よの つとめも おわりに ちかづいたようだ
; «トウキョウ»は ロウとカオスが
; あらそう ぶたいとなり はかいしつくされた
; もはや まもるに あたいせぬ
; なにより そなたのような ひとのこが
; あらわれた«・・・»
; しほうのまもりを まかせた キシンをも しのぐ
; ちからそなえし そなたの しゅつげんが
; あらそいを おわらせ あたらしき じだいを
; ひらくのであろう
; ロウとカオス そなたの つきしほうが
; しょうりを えよう«・・・»
; そなたには これを やろう
; つとめを おえる よには もはや ふようのもの
; うけとるがよい
; >[LEADER]は [ITEM]を
; «てにいれた»
; マサカドさま:
; では さらばじゃ
Message_03_05_4C:
#_0BC211: db $D2, $E0, $4D ; test progress bit E0 for message 4D
#_0BC214: db $D5, $46 ; send 46 to APU
#_0BC216: db $DE, $01, $00, $26, $01 ; load 1x demon 0126
#_0BC21B: db $E4, $00 ; load demon $00
#_0BC21D: db $7B, $67, $62, $C3, $2F, $43, $9A ; マサカドさま:
#_0BC224: db $F9 ; new line
#_0BC225: db $4A, $3E, $CF, $02, $32, $52, $3C, $52 ; よは⎵1せんねん
#_0BC22D: db $3D, $39, $9C, $2B, $3A, $CF, $50, $34 ; のながきに⎵わた
#_0BC235: db $4C ; り
#_0BC236: db $F9 ; new line
#_0BC237: db $2E, $2E, $CF ; ここ⎵
#_0BC23A: db $F2, $1C ; prewritten text 1C
#_0BC23C: db $3D, $CF, $43, $47, $4C, $51, $CF, $36 ; の⎵まもりを⎵つ
#_0BC244: db $38, $46, $30 ; とめし
#_0BC247: db $F9 ; new line
#_0BC248: db $6C, $5E, $83, $75, $CF, $7B, $67, $62 ; タイラノ⎵マサカ
#_0BC250: db $C3, $A9, $25, $4D ; ドである
#_0BC254: db $FC ; wait for key and new line
#_0BC255: db $FA ; clear message box
#_0BC256: db $4A, $3D, $CF, $36, $38, $46, $47, $CF ; よの⎵つとめも⎵
#_0BC25E: db $29, $50, $4C, $3A, $CF, $35, $2A, $A8 ; おわりに⎵ちかづ
#_0BC266: db $26, $34, $4A, $27, $A6 ; いたようだ
#_0BC26B: db $F9 ; new line
#_0BC26C: db $F2, $1C ; prewritten text 1C
#_0BC26E: db $3E, $CF, $87, $5F, $38, $62, $61, $69 ; は⎵ロウとカオス
#_0BC276: db $9C ; が
#_0BC277: db $F9 ; new line
#_0BC278: db $25, $4B, $33, $27, $CF, $AD, $34, $26 ; あらそう⎵ぶたい
#_0BC280: db $38, $39, $4C, $CF, $3E, $2A, $26, $30 ; となり⎵はかいし
#_0BC288: db $36, $2C, $2F, $4E, $34 ; つくされた
#_0BC28D: db $F9 ; new line
#_0BC28E: db $47, $3E, $48, $CF, $43, $47, $4D, $3A ; もはや⎵まもるに
#_0BC296: db $CF, $25, $34, $26, $32, $3B ; ⎵あたいせぬ
#_0BC29C: db $F9 ; new line
#_0BC29D: db $39, $3A, $4A, $4C, $CF, $33, $39, $34 ; なにより⎵そなた
#_0BC2A5: db $3D, $4A, $27, $39, $CF, $3F, $38, $3D ; のような⎵ひとの
#_0BC2AD: db $2E, $9C ; こが
#_0BC2AF: db $F9 ; new line
#_0BC2B0: db $25, $4B, $50, $4E, $34 ; あらわれた
#_0BC2B5: db $F2, $0B ; prewritten text 0B
#_0BC2B7: db $FC ; wait for key and new line
#_0BC2B8: db $FA ; clear message box
#_0BC2B9: db $30, $42, $27, $3D, $43, $47, $4C, $51 ; しほうのまもりを
#_0BC2C1: db $CF, $43, $2A, $32, $34, $CF, $63, $68 ; ⎵まかせた⎵キシ
#_0BC2C9: db $8A, $51, $47, $CF, $30, $3D, $9E ; ンをも⎵しのぐ
#_0BC2D0: db $F9 ; new line
#_0BC2D1: db $35, $2A, $4B, $33, $39, $28, $30, $CF ; ちからそなえし⎵
#_0BC2D9: db $33, $39, $34, $3D, $CF, $30, $56, $36 ; そなたの⎵しゅつ
#_0BC2E1: db $9F, $52, $9C ; げんが
#_0BC2E4: db $F9 ; new line
#_0BC2E5: db $25, $4B, $33, $26, $51, $CF, $29, $50 ; あらそいを⎵おわ
#_0BC2ED: db $4B, $32, $CF, $25, $34, $4B, $30, $2B ; らせ⎵あたらしき
#_0BC2F5: db $CF, $A2, $A6, $26, $51 ; ⎵じだいを
#_0BC2FA: db $F9 ; new line
#_0BC2FB: db $3F, $4B, $2C, $3D, $A9, $25, $4F, $27 ; ひらくのであろう
#_0BC303: db $F9 ; new line
#_0BC304: db $87, $5F, $38, $62, $61, $69, $CF, $33 ; ロウとカオス⎵そ
#_0BC30C: db $39, $34, $3D, $CF, $36, $2B, $30, $42 ; なたの⎵つきしほ
#_0BC314: db $27, $9C ; うが
#_0BC316: db $F9 ; new line
#_0BC317: db $30, $57, $27, $4C, $51, $CF, $28, $4A ; しょうりを⎵えよ
#_0BC31F: db $27 ; う
#_0BC320: db $F2, $0B ; prewritten text 0B
#_0BC322: db $FC ; wait for key and new line
#_0BC323: db $FA ; clear message box
#_0BC324: db $33, $39, $34, $3A, $3E, $CF, $2E, $4E ; そなたには⎵これ
#_0BC32C: db $51, $CF, $48, $4F, $27 ; を⎵やろう
#_0BC331: db $F9 ; new line
#_0BC332: db $36, $38, $46, $51, $CF, $29, $28, $4D ; つとめを⎵おえる
#_0BC33A: db $CF, $4A, $3A, $3E, $CF, $47, $3E, $48 ; ⎵よには⎵もはや
#_0BC342: db $CF, $40, $4A, $27, $3D, $47, $3D ; ⎵ふようのもの
#_0BC349: db $F9 ; new line
#_0BC34A: db $27, $2D, $38, $4D, $9C, $4A, $26 ; うけとるがよい
#_0BC351: db $FC ; wait for key and new line
#_0BC352: db $E1, $3D ; set $0A50 to item 3D
#_0BC354: db $FE, $3C, $4E ; ext command 3C: go to message 4E if no space for item
#_0BC357: db $D4, $03 ; set text box size to 3
#_0BC359: db $97 ; >
#_0BC35A: db $F1 ; write leader's name for team
#_0BC35B: db $3E, $CF ; は⎵
#_0BC35D: db $F3 ; write item name from $0A50
#_0BC35E: db $51 ; を
#_0BC35F: db $F9 ; new line
#_0BC360: db $F2, $2D ; prewritten text 2D
#_0BC362: db $FC ; wait for key and new line
#_0BC363: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BC365: db $FA ; clear message box
#_0BC366: db $7B, $67, $62, $C3, $2F, $43, $9A ; マサカドさま:
#_0BC36D: db $F9 ; new line
#_0BC36E: db $A9, $3E, $CF, $2F, $4B, $AB, $A2, $55 ; では⎵さらばじゃ
#_0BC376: db $FC ; wait for key and new line
#_0BC377: db $D0, $E0 ; set progress bit E0
#_0BC379: db $D3, $4F ; go to message 4F

;===================================================================================================

; >«だれもいない»
Message_03_05_4D:
#_0BC37B: db $97 ; >
#_0BC37C: db $F2, $2C ; prewritten text 2C
#_0BC37E: db $FC ; wait for key and new line
#_0BC37F: db $D3, $4F ; go to message 4F

;===================================================================================================

; もてないならば もちものを へらしたのち
; ふたたびくるがよい
Message_03_05_4E:
#_0BC381: db $FA ; clear message box
#_0BC382: db $47, $37, $39, $26, $39, $4B, $AB, $CF ; もてないならば⎵
#_0BC38A: db $47, $35, $47, $3D, $51, $CF, $41, $4B ; もちものを⎵へら
#_0BC392: db $30, $34, $3D, $35 ; したのち
#_0BC396: db $F9 ; new line
#_0BC397: db $40, $34, $34, $AC, $2C, $4D, $9C, $4A ; ふたたびくるがよ
#_0BC39F: db $26 ; い
#_0BC3A0: db $FC ; wait for key and new line

;===================================================================================================

Message_03_05_4F:
#_0BC3A1: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC3A3: db $FE, $1A, $63, $BC, $12, $00, $00, $00 ; ext command 1A: 63,BC,12,00,00,00
#_0BC3AB: db $FF ; end of message

;===================================================================================================

; >«とびらは とざされている»
Message_03_05_50:
#_0BC3AC: db $97 ; >
#_0BC3AD: db $F2, $69 ; prewritten text 69
#_0BC3AF: db $FC ; wait for key and new line
#_0BC3B0: db $FF ; end of message

;===================================================================================================

; おんせいごうせいのこえ:
; [ITEM]ヲ«・・・»[ITEM]ヲ«・・・»
; [ITEM]ヲ«・・・»[ITEM]ヲ«・・・»«・・・»
Message_03_06_00:
#_0BC3B1: db $D6, $00, $A1, $60, $28 ; place sprite A1 in slot 00 at XY:{60,28}
#_0BC3B6: db $D2, $0C, $01 ; test progress bit 0C for message 01
#_0BC3B9: db $E1, $F0 ; set $0A50 to item F0
#_0BC3BB: db $29, $52, $32, $26, $A0, $27, $32, $26 ; おんせいごうせい
#_0BC3C3: db $3D, $2E, $28, $9A ; のこえ:
#_0BC3C7: db $F9 ; new line
#_0BC3C8: db $F3 ; write item name from $0A50
#_0BC3C9: db $89 ; ヲ
#_0BC3CA: db $F2, $0B ; prewritten text 0B
#_0BC3CC: db $F3 ; write item name from $0A50
#_0BC3CD: db $89 ; ヲ
#_0BC3CE: db $F2, $0B ; prewritten text 0B
#_0BC3D0: db $F9 ; new line
#_0BC3D1: db $F3 ; write item name from $0A50
#_0BC3D2: db $89 ; ヲ
#_0BC3D3: db $F2, $0B ; prewritten text 0B
#_0BC3D5: db $F3 ; write item name from $0A50
#_0BC3D6: db $89 ; ヲ
#_0BC3D7: db $F2, $0B ; prewritten text 0B
#_0BC3D9: db $F2, $0B ; prewritten text 0B
#_0BC3DB: db $FC ; wait for key and new line
#_0BC3DC: db $FA ; clear message box

;===================================================================================================

; >とびらは こわれている
; «なかに はいりますか?»
Message_03_06_01:
#_0BC3DD: db $97, $38, $AC, $4B, $3E, $CF, $2E, $50 ; >とびらは⎵こわ
#_0BC3E5: db $4E, $37, $26, $4D ; れている
#_0BC3E9: db $FC ; wait for key and new line
#_0BC3EA: db $D2, $0C, $03 ; test progress bit 0C for message 03
#_0BC3ED: db $FA ; clear message box
#_0BC3EE: db $F2, $68 ; prewritten text 68
#_0BC3F0: db $F8, $02 ; YES/NO - go to message 02 if YES
#_0BC3F2: db $FF ; end of message

;===================================================================================================

Message_03_06_02:
#_0BC3F3: db $D6, $00, $A2, $60, $28 ; place sprite A2 in slot 00 at XY:{60,28}
#_0BC3F8: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BC3FB: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC3FE: db $D2, $0C, $04 ; test progress bit 0C for message 04
#_0BC401: db $FE, $1A, $07, $18, $0C, $00, $07, $16 ; ext command 1A: 07,18,0C,00,07,16
#_0BC409: db $D0, $0C ; set progress bit 0C
#_0BC40B: db $FF ; end of message

;===================================================================================================

; «そとに でますか?»
Message_03_06_03:
#_0BC40C: db $FA ; clear message box
#_0BC40D: db $F2, $89 ; prewritten text 89
#_0BC40F: db $F8, $02 ; YES/NO - go to message 02 if YES
#_0BC411: db $FF ; end of message

;===================================================================================================

Message_03_06_04:
#_0BC412: db $FE, $1A, $07, $9A, $0C, $00, $07, $16 ; ext command 1A: 07,9A,0C,00,07,16
#_0BC41A: db $D1, $0C ; clear progress bit 0C
#_0BC41C: db $FF ; end of message

;===================================================================================================

; «マッドサイエンティスト»:
; ヒィーヒッヒッヒッ うごいたぞ うごいたぞ
; ロボットけいかんの «コントロール・システム»が
; これで ひとも アクマも みなごろしだ
; みんな ジゴクへ いってしまえ!
; ヒィーヒッヒ
; «・・・»まさか じゃましに きたのか?
; そうは いかんぞ!
; いけえ! ロボットぐんだん!
Message_03_06_05:
#_0BC41D: db $D7, $34 ; load scene 34
#_0BC41F: db $D2, $D7, $0D ; test progress bit D7 for message 0D
#_0BC422: db $D5, $46 ; send 46 to APU
#_0BC424: db $D2, $5F, $0C ; test progress bit 5F for message 0C
#_0BC427: db $D2, $5E, $08 ; test progress bit 5E for message 08
#_0BC42A: db $D6, $00, $25, $70, $28 ; place sprite 25 in slot 00 at XY:{70,28}
#_0BC42F: db $F2, $8C ; prewritten text 8C
#_0BC431: db $9A ; :
#_0BC432: db $F9 ; new line
#_0BC433: db $77, $8C, $5A, $77, $92, $77, $92, $77 ; ヒィーヒッヒッヒ
#_0BC43B: db $92, $CF, $27, $A0, $26, $34, $A5, $CF ; ッ⎵うごいたぞ⎵
#_0BC443: db $27, $A0, $26, $34, $A5 ; うごいたぞ
#_0BC448: db $F9 ; new line
#_0BC449: db $87, $C8, $92, $70, $2D, $26, $2A, $52 ; ロボットけいかん
#_0BC451: db $3D, $CF ; の⎵
#_0BC453: db $F2, $4D ; prewritten text 4D
#_0BC455: db $9C ; が
#_0BC456: db $FC ; wait for key and new line
#_0BC457: db $FA ; clear message box
#_0BC458: db $2E, $4E, $A9, $CF, $3F, $38, $47, $CF ; これで⎵ひとも⎵
#_0BC460: db $5D, $64, $7B, $47, $CF, $44, $39, $A0 ; アクマも⎵みなご
#_0BC468: db $4F, $30, $A6 ; ろしだ
#_0BC46B: db $F9 ; new line
#_0BC46C: db $44, $52, $39, $CF, $BB, $B9, $64, $41 ; みんな⎵ジゴクへ
#_0BC474: db $CF, $26, $58, $37, $30, $43, $28, $94 ; ⎵いってしまえ!
#_0BC47C: db $F9 ; new line
#_0BC47D: db $77, $8C, $5A, $77, $92, $77 ; ヒィーヒッヒ
#_0BC483: db $FC ; wait for key and new line
#_0BC484: db $FA ; clear message box
#_0BC485: db $F2, $0B ; prewritten text 0B
#_0BC487: db $43, $2F, $2A, $CF, $A2, $55, $43, $30 ; まさか⎵じゃまし
#_0BC48F: db $3A, $CF, $2B, $34, $3D, $2A, $95 ; に⎵きたのか?
#_0BC496: db $F9 ; new line
#_0BC497: db $33, $27, $3E, $CF, $26, $2A, $52, $A5 ; そうは⎵いかんぞ
#_0BC49F: db $94 ; !
#_0BC4A0: db $F9 ; new line
#_0BC4A1: db $DE, $00, $00, $FA, $08 ; load 8x demon 00FA
#_0BC4A6: db $26, $2D, $28, $94, $CF, $87, $C8, $92 ; いけえ!⎵ロボッ
#_0BC4AE: db $70, $9E, $52, $A6, $52, $94 ; トぐんだん!
#_0BC4B4: db $FC ; wait for key and new line
#_0BC4B5: db $FA ; clear message box
#_0BC4B6: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC4B9: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BC4BC: db $D5, $39 ; send 39 to APU
#_0BC4BE: db $E4, $00 ; load demon $00
#_0BC4C0: db $E5, $01, $07 ; [COMMAND E5:01,07]

;===================================================================================================

Message_03_06_06:
#_0BC4C3: db $E5, $00, $07 ; [COMMAND E5:00,07]
#_0BC4C6: db $D3, $06 ; go to message 06

;===================================================================================================

Message_03_06_07:
#_0BC4C8: db $D0, $5E ; set progress bit 5E
#_0BC4CA: db $E7, $00 ; call routine 01E5CD with value 00 TODO

;===================================================================================================

; >«コントロール・システム»は うごいている
; はかいしますか?
Message_03_06_08:
#_0BC4CC: db $97 ; >
#_0BC4CD: db $F2, $4D ; prewritten text 4D
#_0BC4CF: db $3E, $CF, $27, $A0, $26, $37, $26, $4D ; は⎵うごいている
#_0BC4D7: db $F9 ; new line
#_0BC4D8: db $3E, $2A, $26, $30, $43, $31, $2A, $95 ; はかいしますか?
#_0BC4E0: db $F8, $09 ; YES/NO - go to message 09 if YES
#_0BC4E2: db $FF ; end of message

;===================================================================================================

; [LEADER]は «コントロール・システム»を
; はかいしようと ちかづいた
; [DEMON1]:
; キンキュウジタイ!
; システム サドウカイシ
; タダチニ シンニュウシャヲ ハイジョスル
Message_03_06_09:
#_0BC4E3: db $D4, $03 ; set text box size to 3
#_0BC4E5: db $F1 ; write leader's name for team
#_0BC4E6: db $3E, $CF ; は⎵
#_0BC4E8: db $F2, $4D ; prewritten text 4D
#_0BC4EA: db $51 ; を
#_0BC4EB: db $F9 ; new line
#_0BC4EC: db $3E, $2A, $26, $30, $4A, $27, $38, $CF ; はかいしようと⎵
#_0BC4F4: db $35, $2A, $A8, $26, $34 ; ちかづいた
#_0BC4F9: db $FC ; wait for key and new line
#_0BC4FA: db $FA ; clear message box
#_0BC4FB: db $DE, $01, $00, $0B, $01 ; load 1x demon 010B
#_0BC500: db $F5 ; write demon name from $050A
#_0BC501: db $9A ; :
#_0BC502: db $F9 ; new line
#_0BC503: db $63, $8A, $63, $90, $5F, $BB, $6C, $5E ; キンキュウジタイ
#_0BC50B: db $94 ; !
#_0BC50C: db $F9 ; new line
#_0BC50D: db $68, $69, $6F, $7D, $CF, $67, $C3, $5F ; システム⎵サドウ
#_0BC515: db $62, $5E, $68 ; カイシ
#_0BC518: db $FC ; wait for key and new line
#_0BC519: db $FA ; clear message box
#_0BC51A: db $6C, $BF, $6D, $72, $CF, $68, $8A, $72 ; タダチニ⎵シンニ
#_0BC522: db $90, $5F, $68, $8F, $89, $CF, $76, $5E ; ュウシャヲ⎵ハイ
#_0BC52A: db $BB, $91, $69, $85 ; ジョスル
#_0BC52E: db $FC ; wait for key and new line
#_0BC52F: db $D5, $39 ; send 39 to APU
#_0BC531: db $E4, $00 ; load demon $00
#_0BC533: db $E5, $01, $0B ; [COMMAND E5:01,0B]

;===================================================================================================

Message_03_06_0A:
#_0BC536: db $E5, $00, $0B ; [COMMAND E5:00,0B]
#_0BC539: db $D3, $0A ; go to message 0A

;===================================================================================================

Message_03_06_0B:
#_0BC53B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC53D: db $D0, $5F ; set progress bit 5F

;===================================================================================================

; >[LEADER]は ざんがいの なかから
; [ITEM]を «てにいれた»
; «マッドサイエンティスト»:
; おお わしの メカロボぐんだんが«・・・»
Message_03_06_0C:
#_0BC53F: db $E1, $F5 ; set $0A50 to item F5
#_0BC541: db $97 ; >
#_0BC542: db $F1 ; write leader's name for team
#_0BC543: db $3E, $CF, $A1, $52, $9C, $26, $3D, $CF ; は⎵ざんがいの⎵
#_0BC54B: db $39, $2A, $2A, $4B ; なかから
#_0BC54F: db $F9 ; new line
#_0BC550: db $F3 ; write item name from $0A50
#_0BC551: db $51 ; を
#_0BC552: db $FE, $3C, $0E ; ext command 3C: go to message 0E if no space for item
#_0BC555: db $CF ; ⎵
#_0BC556: db $F2, $2D ; prewritten text 2D
#_0BC558: db $FC ; wait for key and new line
#_0BC559: db $D0, $D7 ; set progress bit D7
#_0BC55B: db $FE, $28 ; ext command 28: add item to inventory from $0A50
#_0BC55D: db $FA ; clear message box
#_0BC55E: db $D6, $00, $25, $70, $28 ; place sprite 25 in slot 00 at XY:{70,28}
#_0BC563: db $F2, $8C ; prewritten text 8C
#_0BC565: db $9A ; :
#_0BC566: db $F9 ; new line
#_0BC567: db $29, $29, $CF, $50, $30, $3D, $CF, $7E ; おお⎵わしの⎵メ
#_0BC56F: db $62, $87, $C8, $9E, $52, $A6, $52, $9C ; カロボぐんだんが
#_0BC577: db $F2, $0B ; prewritten text 0B
#_0BC579: db $FC ; wait for key and new line
#_0BC57A: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_06_0D:
#_0BC57B: db $97 ; >
#_0BC57C: db $F2, $2C ; prewritten text 2C
#_0BC57E: db $FC ; wait for key and new line
#_0BC57F: db $FF ; end of message

;===================================================================================================

;  «みつけたが もちきれなかった»
Message_03_06_0E:
#_0BC580: db $CF ; ⎵
#_0BC581: db $F2, $72 ; prewritten text 72
#_0BC583: db $FC ; wait for key and new line
#_0BC584: db $FF ; end of message

;===================================================================================================

; [HIM]:
; よお げんきそうだな
; おれも だいぶ ちからを つけてきたぜ
; ここで しょうぶしてみるか?
Message_03_06_0F:
#_0BC585: db $D2, $F3, $11 ; test progress bit F3 for message 11
#_0BC588: db $D5, $46 ; send 46 to APU
#_0BC58A: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0BC58F: db $E4, $00 ; load demon $00
#_0BC591: db $EF ; write chaos hero name
#_0BC592: db $9A ; :
#_0BC593: db $F9 ; new line
#_0BC594: db $4A, $29, $CF, $9F, $52, $2B, $33, $27 ; よお⎵げんきそう
#_0BC59C: db $A6, $39 ; だな
#_0BC59E: db $F9 ; new line
#_0BC59F: db $29, $4E, $47, $CF, $A6, $26, $AD, $CF ; おれも⎵だいぶ⎵
#_0BC5A7: db $35, $2A, $4B, $51, $CF, $36, $2D, $37 ; ちからを⎵つけて
#_0BC5AF: db $2B, $34, $A4 ; きたぜ
#_0BC5B2: db $FC ; wait for key and new line
#_0BC5B3: db $FA ; clear message box
#_0BC5B4: db $2E, $2E, $A9, $CF, $30, $57, $27, $AD ; ここで⎵しょうぶ
#_0BC5BC: db $30, $37, $44, $4D, $2A, $95 ; してみるか?
#_0BC5C2: db $F8, $10 ; YES/NO - go to message 10 if YES

;===================================================================================================

; ははっ じょうだんだよ
; ところで ひとつ ちゅうこくしとくぜ
; このさきの イケブクロほうめんには
; ぜったいに いくな
; おまえのためを おもって いってるんだ
; いうこと きいてくれよ
Message_03_06_10:
#_0BC5C4: db $D4, $03 ; set text box size to 3
#_0BC5C6: db $3E, $3E, $58, $CF, $A2, $57, $27, $A6 ; ははっ⎵じょうだ
#_0BC5CE: db $52, $A6, $4A ; んだよ
#_0BC5D1: db $F9 ; new line
#_0BC5D2: db $38, $2E, $4F, $A9, $CF, $3F, $38, $36 ; ところで⎵ひとつ
#_0BC5DA: db $CF, $35, $56, $27, $2E, $2C, $30, $38 ; ⎵ちゅうこくしと
#_0BC5E2: db $2C, $A4 ; くぜ
#_0BC5E4: db $FC ; wait for key and new line
#_0BC5E5: db $FA ; clear message box
#_0BC5E6: db $2E, $3D, $2F, $2B, $3D, $CF, $5E, $65 ; このさきの⎵イケ
#_0BC5EE: db $C6, $64, $87, $42, $27, $46, $52, $3A ; ブクロほうめんに
#_0BC5F6: db $3E ; は
#_0BC5F7: db $F9 ; new line
#_0BC5F8: db $A4, $58, $34, $26, $3A, $CF, $26, $2C ; ぜったいに⎵いく
#_0BC600: db $39 ; な
#_0BC601: db $FC ; wait for key and new line
#_0BC602: db $FA ; clear message box
#_0BC603: db $29, $43, $28, $3D, $34, $46, $51, $CF ; おまえのためを⎵
#_0BC60B: db $29, $47, $58, $37, $CF, $26, $58, $37 ; おもって⎵いって
#_0BC613: db $4D, $52, $A6 ; るんだ
#_0BC616: db $F9 ; new line
#_0BC617: db $26, $27, $2E, $38, $CF, $2B, $26, $37 ; いうこと⎵きいて
#_0BC61F: db $2C, $4E, $4A ; くれよ
#_0BC622: db $FC ; wait for key and new line
#_0BC623: db $D0, $F3 ; set progress bit F3
#_0BC625: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC627: db $D5, $4A ; send 4A to APU
#_0BC629: db $FF ; end of message

;===================================================================================================

; おとこ:
; おっと おれは てきじゃないよ
; めぼしいもんが おちてねえか
; さがしてんですよ
Message_03_06_11:
#_0BC62A: db $D6, $00, $0C, $70, $38 ; place sprite 0C in slot 00 at XY:{70,38}
#_0BC62F: db $29, $38, $2E, $9A ; おとこ:
#_0BC633: db $F9 ; new line
#_0BC634: db $29, $58, $38, $CF, $29, $4E, $3E, $CF ; おっと⎵おれは⎵
#_0BC63C: db $37, $2B, $A2, $55, $39, $26, $4A ; てきじゃないよ
#_0BC643: db $F9 ; new line
#_0BC644: db $46, $AF, $30, $26, $47, $52, $9C, $CF ; めぼしいもんが⎵
#_0BC64C: db $29, $35, $37, $3C, $28, $2A ; おちてねえか
#_0BC652: db $F9 ; new line
#_0BC653: db $2F, $9C, $30, $37, $52, $A9, $31, $4A ; さがしてんですよ
#_0BC65B: db $FC ; wait for key and new line
#_0BC65C: db $FF ; end of message

;===================================================================================================

; [JIMMY]:
; «・・・»[CHASE]くん«・・・»
; おねがいがあって やってきました
; けいしちょうだった ビルにある
; ロボットけいかんの コントロールそうちを
; なにものかが うごかそうとしています
; それを とめてください
; ぼくは いのちを うしない
; からだを もっていないので
; どうしようも ありません
; このさきを みぎにまがると ギンザのまち
; まっすぐいくと
; けいしちょうだった ビルが あります
; «おねがいします» [CHASE]くん
; たのめるのは きみしかいません«・・・»
Message_03_06_12:
#_0BC65D: db $D2, $F2, $13 ; test progress bit F2 for message 13
#_0BC660: db $D5, $45 ; send 45 to APU
#_0BC662: db $D6, $00, $1F, $70, $28 ; place sprite 1F in slot 00 at XY:{70,28}
#_0BC667: db $FE, $45, $00, $01 ; ext command 45: something 00, 01 TODO
#_0BC66B: db $EE ; write lawful hero name
#_0BC66C: db $9A ; :
#_0BC66D: db $F9 ; new line
#_0BC66E: db $F2, $0B ; prewritten text 0B
#_0BC670: db $F0 ; write player name
#_0BC671: db $2C, $52 ; くん
#_0BC673: db $F2, $0B ; prewritten text 0B
#_0BC675: db $F9 ; new line
#_0BC676: db $29, $3C, $9C, $26, $9C, $25, $58, $37 ; おねがいがあって
#_0BC67E: db $CF, $48, $58, $37, $2B, $43, $30, $34 ; ⎵やってきました
#_0BC686: db $FC ; wait for key and new line
#_0BC687: db $FA ; clear message box
#_0BC688: db $2D, $26, $30, $35, $57, $27, $A6, $58 ; けいしちょうだっ
#_0BC690: db $34, $CF, $C5, $85, $3A, $25, $4D ; た⎵ビルにある
#_0BC697: db $F9 ; new line
#_0BC698: db $87, $C8, $92, $70, $2D, $26, $2A, $52 ; ロボットけいかん
#_0BC6A0: db $3D, $CF, $66, $8A, $70, $87, $5A, $85 ; の⎵コントロール
#_0BC6A8: db $33, $27, $35, $51 ; そうちを
#_0BC6AC: db $F9 ; new line
#_0BC6AD: db $39, $3A, $47, $3D, $2A, $9C, $CF, $27 ; なにものかが⎵う
#_0BC6B5: db $A0, $2A, $33, $27, $38, $30, $37, $26 ; ごかそうとしてい
#_0BC6BD: db $43, $31 ; ます
#_0BC6BF: db $FC ; wait for key and new line
#_0BC6C0: db $FA ; clear message box
#_0BC6C1: db $33, $4E, $51, $CF, $38, $46, $37, $2C ; それを⎵とめてく
#_0BC6C9: db $A6, $2F, $26 ; ださい
#_0BC6CC: db $F9 ; new line
#_0BC6CD: db $AF, $2C, $3E, $CF, $26, $3D, $35, $51 ; ぼくは⎵いのちを
#_0BC6D5: db $CF, $27, $30, $39, $26 ; ⎵うしない
#_0BC6DA: db $F9 ; new line
#_0BC6DB: db $2A, $4B, $A6, $51, $CF, $47, $58, $37 ; からだを⎵もって
#_0BC6E3: db $26, $39, $26, $3D, $A9 ; いないので
#_0BC6E8: db $F9 ; new line
#_0BC6E9: db $AA, $27, $30, $4A, $27, $47, $CF, $25 ; どうしようも⎵あ
#_0BC6F1: db $4C, $43, $32, $52 ; りません
#_0BC6F5: db $FC ; wait for key and new line
#_0BC6F6: db $FA ; clear message box
#_0BC6F7: db $2E, $3D, $2F, $2B, $51, $CF, $44, $9D ; このさきを⎵みぎ
#_0BC6FF: db $3A, $43, $9C, $4D, $38, $CF, $B6, $8A ; にまがると⎵ギン
#_0BC707: db $BA, $3D, $43, $35 ; ザのまち
#_0BC70B: db $F9 ; new line
#_0BC70C: db $43, $58, $31, $9E, $26, $2C, $38 ; まっすぐいくと
#_0BC713: db $F9 ; new line
#_0BC714: db $2D, $26, $30, $35, $57, $27, $A6, $58 ; けいしちょうだっ
#_0BC71C: db $34, $CF, $C5, $85, $9C, $CF, $25, $4C ; た⎵ビルが⎵あり
#_0BC724: db $43, $31 ; ます
#_0BC726: db $FC ; wait for key and new line
#_0BC727: db $FA ; clear message box
#_0BC728: db $F2, $4A ; prewritten text 4A
#_0BC72A: db $CF ; ⎵
#_0BC72B: db $F0 ; write player name
#_0BC72C: db $2C, $52 ; くん
#_0BC72E: db $F9 ; new line
#_0BC72F: db $34, $3D, $46, $4D, $3D, $3E, $CF, $2B ; たのめるのは⎵き
#_0BC737: db $44, $30, $2A, $26, $43, $32, $52 ; みしかいません
#_0BC73E: db $F2, $0B ; prewritten text 0B
#_0BC740: db $FC ; wait for key and new line
#_0BC741: db $D0, $F2 ; set progress bit F2
#_0BC743: db $D6, $00, $00 ; delete sprite in slot 00
#_0BC746: db $D5, $4A ; send 4A to APU
#_0BC748: db $FF ; end of message

;===================================================================================================

; «メシアきょう»と:
; ここで メシアさまが おすがたを あらわされた
; ときいて きたのですが«・・・»
; けんめいに いのっても
; メシアさまは あらわれて くださいません
; わたしの しんじんが たりないのでしょうか
Message_03_06_13:
#_0BC749: db $D6, $00, $49, $78, $28 ; place sprite 49 in slot 00 at XY:{78,28}
#_0BC74E: db $F2, $33 ; prewritten text 33
#_0BC750: db $38, $9A ; と:
#_0BC752: db $F9 ; new line
#_0BC753: db $2E, $2E, $A9, $CF, $7E, $68, $5D, $2F ; ここで⎵メシアさ
#_0BC75B: db $43, $9C, $CF, $29, $31, $9C, $34, $51 ; まが⎵おすがたを
#_0BC763: db $CF, $25, $4B, $50, $2F, $4E, $34 ; ⎵あらわされた
#_0BC76A: db $F9 ; new line
#_0BC76B: db $38, $2B, $26, $37, $CF, $2B, $34, $3D ; ときいて⎵きたの
#_0BC773: db $A9, $31, $9C ; ですが
#_0BC776: db $F2, $0B ; prewritten text 0B
#_0BC778: db $FC ; wait for key and new line
#_0BC779: db $FA ; clear message box
#_0BC77A: db $2D, $52, $46, $26, $3A, $CF, $26, $3D ; けんめいに⎵いの
#_0BC782: db $58, $37, $47 ; っても
#_0BC785: db $F9 ; new line
#_0BC786: db $7E, $68, $5D, $2F, $43, $3E, $CF, $25 ; メシアさまは⎵あ
#_0BC78E: db $4B, $50, $4E, $37, $CF, $2C, $A6, $2F ; らわれて⎵くださ
#_0BC796: db $26, $43, $32, $52 ; いません
#_0BC79A: db $F9 ; new line
#_0BC79B: db $50, $34, $30, $3D, $CF, $30, $52, $A2 ; わたしの⎵しんじ
#_0BC7A3: db $52, $9C, $CF, $34, $4C, $39, $26, $3D ; んが⎵たりないの
#_0BC7AB: db $A9, $30, $57, $27, $2A ; でしょうか
#_0BC7B0: db $FC ; wait for key and new line
#_0BC7B1: db $FF ; end of message

;===================================================================================================

; «くるまいすのおとこ»:
; やあ [CHASE]くんじゃないか
; きみたちも いきのこったようだね
; わたしが あげた«プログラム»は
; やくに たっているかい
; ところで どうじに よべるナカマは
; 3たいまでだが ふべんでは ないかね?
; そんなことは ないだろう
Message_03_06_14:
#_0BC7B2: db $D7, $24 ; load scene 24
#_0BC7B4: db $D2, $F0, $17 ; test progress bit F0 for message 17
#_0BC7B7: db $D5, $47 ; send 47 to APU
#_0BC7B9: db $D6, $00, $2D, $70, $28 ; place sprite 2D in slot 00 at XY:{70,28}
#_0BC7BE: db $F2, $83 ; prewritten text 83
#_0BC7C0: db $9A ; :
#_0BC7C1: db $F9 ; new line
#_0BC7C2: db $48, $25, $CF ; やあ⎵
#_0BC7C5: db $F0 ; write player name
#_0BC7C6: db $2C, $52, $A2, $55, $39, $26, $2A ; くんじゃないか
#_0BC7CD: db $F9 ; new line
#_0BC7CE: db $2B, $44, $34, $35, $47, $CF, $26, $2B ; きみたちも⎵いき
#_0BC7D6: db $3D, $2E, $58, $34, $4A, $27, $A6, $3C ; のこったようだね
#_0BC7DE: db $FC ; wait for key and new line
#_0BC7DF: db $FA ; clear message box
#_0BC7E0: db $50, $34, $30, $9C, $CF, $25, $9F, $34 ; わたしが⎵あげた
#_0BC7E8: db $F2, $08 ; prewritten text 08
#_0BC7EA: db $3E ; は
#_0BC7EB: db $F9 ; new line
#_0BC7EC: db $48, $2C, $3A, $CF, $34, $58, $37, $26 ; やくに⎵たってい
#_0BC7F4: db $4D, $2A, $26 ; るかい
#_0BC7F7: db $FC ; wait for key and new line
#_0BC7F8: db $FA ; clear message box
#_0BC7F9: db $38, $2E, $4F, $A9, $CF, $AA, $27, $A2 ; ところで⎵どうじ
#_0BC801: db $3A, $CF, $4A, $AE, $4D, $71, $62, $7B ; に⎵よべるナカマ
#_0BC809: db $3E ; は
#_0BC80A: db $F9 ; new line
#_0BC80B: db $04, $34, $26, $43, $A9, $A6, $9C, $CF ; 3たいまでだが⎵
#_0BC813: db $40, $AE, $52, $A9, $3E, $CF, $39, $26 ; ふべんでは⎵ない
#_0BC81B: db $2A, $3C, $95 ; かね?
#_0BC81E: db $F8, $15 ; YES/NO - go to message 15 if YES
#_0BC820: db $D4, $03 ; set text box size to 3
#_0BC822: db $33, $52, $39, $2E, $38, $3E, $CF, $39 ; そんなことは⎵な
#_0BC82A: db $26, $A6, $4F, $27 ; いだろう
#_0BC82E: db $F9 ; new line
#_0BC82F: db $D3, $16 ; go to message 16

;===================================================================================================

; そうだろう では どうじに よべるナカマを
Message_03_06_15:
#_0BC831: db $D4, $03 ; set text box size to 3
#_0BC833: db $33, $27, $A6, $4F, $27, $CF, $A9, $3E ; そうだろう⎵では
#_0BC83B: db $CF, $AA, $27, $A2, $3A, $CF, $4A, $AE ; ⎵どうじに⎵よべ
#_0BC843: db $4D, $71, $62, $7B, $51 ; るナカマを
#_0BC848: db $F9 ; new line

;===================================================================================================

; では どうじに よべるナカマを
; 4たいに してあげよう
; では またあおう
Message_03_06_16:
#_0BC839: db $A9, $3E, $CF, $AA, $27, $A2, $3A, $CF ; では⎵どうじに⎵
#_0BC841: db $4A, $AE, $4D, $71, $62, $7B, $51 ; よべるナカマを
#_0BC848: db $F9 ; new line
#_0BC849: db $05, $34, $26, $3A, $CF, $30, $37, $25 ; 4たいに⎵してあ
#_0BC851: db $9F, $4A, $27 ; げよう
#_0BC854: db $FC ; wait for key and new line
#_0BC855: db $D0, $F0 ; set progress bit F0
#_0BC857: db $FA ; clear message box
#_0BC858: db $A9, $3E, $CF, $43, $34, $25, $29, $27 ; では⎵またあおう
#_0BC860: db $FC ; wait for key and new line
#_0BC861: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_06_17:
#_0BC862: db $97 ; >
#_0BC863: db $F2, $2C ; prewritten text 2C
#_0BC865: db $FC ; wait for key and new line
#_0BC866: db $FF ; end of message

;===================================================================================================

; >[CLASS] [DEMON1] が いる
; >[ITEM]が かがやきだした
; [DEMON1]は しょうきを とりもどした
; [DEMON1]:
; おれは なにを していたんだ«・・・»
; どうやら «おまえたち»が すくってくれたようだな
Message_03_07_00:
#_0BC867: db $FE, $2A ; ext command 2A: call routine 02E87C TODO
#_0BC869: db $DE, $00, $00, $8B, $01 ; load 1x demon 008B
#_0BC86E: db $E4, $00 ; load demon $00
#_0BC870: db $97 ; >
#_0BC871: db $F6 ; write class name from $0506
#_0BC872: db $CF ; ⎵
#_0BC873: db $F5 ; write demon name from $050A
#_0BC874: db $CF, $9C, $CF, $26, $4D ; ⎵が⎵いる
#_0BC879: db $FC ; wait for key and new line
#_0BC87A: db $D2, $81, $05 ; test progress bit 81 for message 05
#_0BC87D: db $E1, $F4 ; set $0A50 to item F4
#_0BC87F: db $E9, $00, $02 ; go to message 02 maybe TODO
#_0BC882: db $DD, $F4, $02 ; go to message 02 if missing item F4
#_0BC885: db $FA ; clear message box
#_0BC886: db $97 ; >
#_0BC887: db $F3 ; write item name from $0A50
#_0BC888: db $9C, $CF, $2A, $9C, $48, $2B, $A6, $30 ; が⎵かがやきだし
#_0BC890: db $34 ; た
#_0BC891: db $FE, $07, $30 ; ext command 07: draw buffered text then wait 47 frames
#_0BC894: db $FC ; wait for key and new line
#_0BC895: db $F5 ; write demon name from $050A
#_0BC896: db $3E, $CF, $30, $57, $27, $2B, $51, $CF ; は⎵しょうきを⎵
#_0BC89E: db $38, $4C, $47, $AA, $30, $34 ; とりもどした
#_0BC8A4: db $FC ; wait for key and new line
#_0BC8A5: db $FA ; clear message box
#_0BC8A6: db $F5 ; write demon name from $050A
#_0BC8A7: db $9A ; :
#_0BC8A8: db $F9 ; new line
#_0BC8A9: db $29, $4E, $3E, $CF, $39, $3A, $51, $CF ; おれは⎵なにを⎵
#_0BC8B1: db $30, $37, $26, $34, $52, $A6 ; していたんだ
#_0BC8B7: db $F2, $0B ; prewritten text 0B
#_0BC8B9: db $F9 ; new line
#_0BC8BA: db $D2, $1B, $04 ; test progress bit 1B for message 04
#_0BC8BD: db $AA, $27, $48, $4B, $CF ; どうやら⎵
#_0BC8C2: db $F2, $04 ; prewritten text 04
#_0BC8C4: db $9C, $CF, $31, $2C, $58, $37, $2C, $4E ; が⎵すくってくれ
#_0BC8CC: db $34, $4A, $27, $A6, $39 ; たようだな
#_0BC8D1: db $FC ; wait for key and new line
#_0BC8D2: db $FA ; clear message box

;===================================================================================================

; ここは じゆうに とおっていいぜ
; あばよ!
Message_03_07_01:
#_0BC8D3: db $2E, $2E, $3E, $CF, $A2, $49, $27, $3A ; ここは⎵じゆうに
#_0BC8DB: db $CF, $38, $29, $58, $37, $26, $26, $A4 ; ⎵とおっていいぜ
#_0BC8E3: db $F9 ; new line
#_0BC8E4: db $25, $AB, $4A, $94 ; あばよ!
#_0BC8E8: db $FC ; wait for key and new line
#_0BC8E9: db $D0, $80 ; set progress bit 80
#_0BC8EB: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BC8ED: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
; ここを «とおすわけには いかないな»
Message_03_07_02:
#_0BC8EE: db $FA ; clear message box
#_0BC8EF: db $F5 ; write demon name from $050A
#_0BC8F0: db $9A ; :
#_0BC8F1: db $F9 ; new line
#_0BC8F2: db $2E, $2E, $51, $CF ; ここを⎵
#_0BC8F6: db $F2, $2B ; prewritten text 2B
#_0BC8F8: db $FC ; wait for key and new line

;===================================================================================================

Message_03_07_03:
#_0BC8F9: db $FE, $1A, $E2, $36, $00, $00, $00, $00 ; ext command 1A: E2,36,00,00,00,00
#_0BC901: db $FF ; end of message

;===================================================================================================

; あ あなたは [CHASE]
; ぶじで なにより
; わたしは みょうな きかいに とばされたあげく
; いしきを なくしたまま
; こんなところで ばんけんを するしまつ
Message_03_07_04:
#_0BC902: db $25, $CF, $25, $39, $34, $3E, $CF ; あ⎵あなたは⎵
#_0BC909: db $F0 ; write player name
#_0BC90A: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BC90D: db $F9 ; new line
#_0BC90E: db $AD, $A2, $A9, $CF, $39, $3A, $4A, $4C ; ぶじで⎵なにより
#_0BC916: db $FC ; wait for key and new line
#_0BC917: db $FA ; clear message box
#_0BC918: db $50, $34, $30, $3E, $CF, $44, $57, $27 ; わたしは⎵みょう
#_0BC920: db $39, $CF, $2B, $2A, $26, $3A, $CF, $38 ; な⎵きかいに⎵と
#_0BC928: db $AB, $2F, $4E, $34, $25, $9F, $2C ; ばされたあげく
#_0BC92F: db $F9 ; new line
#_0BC930: db $26, $30, $2B, $51, $CF, $39, $2C, $30 ; いしきを⎵なくし
#_0BC938: db $34, $43, $43 ; たまま
#_0BC93B: db $F9 ; new line
#_0BC93C: db $2E, $52, $39, $38, $2E, $4F, $A9, $CF ; こんなところで⎵
#_0BC944: db $AB, $52, $2D, $52, $51, $CF, $31, $4D ; ばんけんを⎵する
#_0BC94C: db $30, $43, $36 ; しまつ
#_0BC94F: db $FC ; wait for key and new line
#_0BC950: db $FA ; clear message box
#_0BC951: db $D3, $06 ; go to message 06

;===================================================================================================

; [DEMON1]:
Message_03_07_05:
#_0BC953: db $FA ; clear message box
#_0BC954: db $F5 ; write demon name from $050A
#_0BC955: db $9A ; :
#_0BC956: db $F9 ; new line

;===================================================================================================

; わたしを ふたたびナカマに
; くわえて いただけるか?
Message_03_07_06:
#_0BC957: db $50, $34, $30, $51, $CF, $40, $34, $34 ; わたしを⎵ふたた
#_0BC95F: db $AC, $71, $62, $7B, $3A ; びナカマに
#_0BC964: db $F9 ; new line
#_0BC965: db $2C, $50, $28, $37, $CF, $26, $34, $A6 ; くわえて⎵いただ
#_0BC96D: db $2D, $4D, $2A, $95 ; けるか?
#_0BC971: db $F8, $08 ; YES/NO - go to message 08 if YES

;===================================================================================================

; そうか«・・・»
; では くわえてもらうまで
; ここで まっていよう
Message_03_07_07:
#_0BC973: db $D4, $03 ; set text box size to 3
#_0BC975: db $33, $27, $2A ; そうか
#_0BC978: db $F2, $0B ; prewritten text 0B
#_0BC97A: db $F9 ; new line
#_0BC97B: db $A9, $3E, $CF, $2C, $50, $28, $37, $47 ; では⎵くわえても
#_0BC983: db $4B, $27, $43, $A9 ; らうまで
#_0BC987: db $F9 ; new line
#_0BC988: db $2E, $2E, $A9, $CF, $43, $58, $37, $26 ; ここで⎵まってい
#_0BC990: db $4A, $27 ; よう
#_0BC992: db $FC ; wait for key and new line
#_0BC993: db $D0, $81 ; set progress bit 81
#_0BC995: db $D3, $03 ; go to message 03

;===================================================================================================

Message_03_07_08:
#_0BC997: db $FE, $09, $0A ; ext command 09: demon joins party or message 0A if full
#_0BC99A: db $FE, $08, $04, $09 ; ext command 08: something with levels to message 09, 04 TODO
#_0BC99E: db $D3, $0B ; go to message 0B

;===================================================================================================

; では おともさせて いただこう
; «こんごとも よろしく・・・»
; >[DEMON1]が «ナカマに くわわった»
Message_03_07_09:
#_0BC9A0: db $D4, $03 ; set text box size to 3
#_0BC9A2: db $A9, $3E, $CF, $29, $38, $47, $2F, $32 ; では⎵おともさせ
#_0BC9AA: db $37, $CF, $26, $34, $A6, $2E, $27 ; て⎵いただこう
#_0BC9B1: db $FC ; wait for key and new line
#_0BC9B2: db $FA ; clear message box
#_0BC9B3: db $F2, $41 ; prewritten text 41
#_0BC9B5: db $FC ; wait for key and new line
#_0BC9B6: db $FA ; clear message box
#_0BC9B7: db $97 ; >
#_0BC9B8: db $F5 ; write demon name from $050A
#_0BC9B9: db $9C, $CF ; が⎵
#_0BC9BB: db $F2, $2F ; prewritten text 2F
#_0BC9BD: db $FC ; wait for key and new line
#_0BC9BE: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BC9C1: db $D0, $80 ; set progress bit 80
#_0BC9C3: db $FF ; end of message

;===================================================================================================

; >しかし ナカマが いっぱいだ
Message_03_07_0A:
#_0BC9C4: db $D4, $03 ; set text box size to 3
#_0BC9C6: db $97, $30, $2A, $30, $CF, $71, $62, $7B ; >しかし⎵ナカマ
#_0BC9CE: db $9C, $CF, $26, $58, $B0, $26, $A6 ; が⎵いっぱいだ
#_0BC9D5: db $FC ; wait for key and new line
#_0BC9D6: db $D3, $07 ; go to message 07

;===================================================================================================

; >しかし おなじ ナカマが いる
; [DEMON1]:
Message_03_07_0B:
#_0BC9D8: db $D4, $03 ; set text box size to 3
#_0BC9DA: db $97, $30, $2A, $30, $CF, $29, $39, $A2 ; >しかし⎵おなじ
#_0BC9E2: db $CF, $71, $62, $7B, $9C, $CF, $26, $4D ; ⎵ナカマが⎵いる
#_0BC9EA: db $FC ; wait for key and new line
#_0BC9EB: db $FA ; clear message box
#_0BC9EC: db $F5 ; write demon name from $050A
#_0BC9ED: db $9A ; :
#_0BC9EE: db $F9 ; new line
#_0BC9EF: db $D3, $01 ; go to message 01

;===================================================================================================

; [DEMON1]:
; よお [CHASE]か ひさしぶりだな
; おれは いま かみの いんぼうを
; つぶすため たたかってるんだ
; ところで おれにも パートナーが できたぜ
; なまえは りえ っていうんだ
; >«しょうじょ»は なにもいわず ほほえんだ
; やはり «デスティニーランド»まで きたか
; おまえには そのちからが あると おもってたぜ
; だが まだ ちゅうとはんぱに
; まよっているようだな
; おまえほどの やつが «メシアきょう»の
; ぎまんで いっぱいの たわごとに
; みみを かすとは«・・・»
Message_03_07_0C:
#_0BC9F1: db $D2, $8A, $2D ; test progress bit 8A for message 2D
#_0BC9F4: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0BC9F9: db $E4, $00 ; load demon $00
#_0BC9FB: db $D6, $01, $B3, $90, $28 ; place sprite B3 in slot 01 at XY:{90,28}
#_0BCA00: db $F5 ; write demon name from $050A
#_0BCA01: db $9A ; :
#_0BCA02: db $F9 ; new line
#_0BCA03: db $4A, $29, $CF ; よお⎵
#_0BCA06: db $F0 ; write player name
#_0BCA07: db $2A, $CF, $3F, $2F, $30, $AD, $4C, $A6 ; か⎵ひさしぶりだ
#_0BCA0F: db $39 ; な
#_0BCA10: db $F9 ; new line
#_0BCA11: db $29, $4E, $3E, $CF, $26, $43, $CF, $2A ; おれは⎵いま⎵か
#_0BCA19: db $44, $3D, $CF, $26, $52, $AF, $27, $51 ; みの⎵いんぼうを
#_0BCA21: db $F9 ; new line
#_0BCA22: db $36, $AD, $31, $34, $46, $CF, $34, $34 ; つぶすため⎵たた
#_0BCA2A: db $2A, $58, $37, $4D, $52, $A6 ; かってるんだ
#_0BCA30: db $FC ; wait for key and new line
#_0BCA31: db $FA ; clear message box
#_0BCA32: db $38, $2E, $4F, $A9, $CF, $29, $4E, $3A ; ところで⎵おれに
#_0BCA3A: db $47, $CF, $C9, $5A, $70, $71, $5A, $9C ; も⎵パートナーが
#_0BCA42: db $CF, $A9, $2B, $34, $A4 ; ⎵できたぜ
#_0BCA47: db $F9 ; new line
#_0BCA48: db $39, $43, $28, $3E, $CF, $4C, $28, $CF ; なまえは⎵りえ⎵
#_0BCA50: db $58, $37, $26, $27, $52, $A6 ; っていうんだ
#_0BCA56: db $FC ; wait for key and new line
#_0BCA57: db $D4, $03 ; set text box size to 3
#_0BCA59: db $97 ; >
#_0BCA5A: db $F2, $00 ; prewritten text 00
#_0BCA5C: db $3E, $CF, $39, $3A, $47, $26, $50, $A3 ; は⎵なにもいわず
#_0BCA64: db $CF, $42, $42, $28, $52, $A6 ; ⎵ほほえんだ
#_0BCA6A: db $FC ; wait for key and new line
#_0BCA6B: db $FA ; clear message box
#_0BCA6C: db $FE, $04, $0F, $0D ; ext command 04: message 0F if 11C >= 112; 0D if >= 144
#_0BCA70: db $48, $3E, $4C, $CF ; やはり⎵
#_0BCA74: db $F2, $62 ; prewritten text 62
#_0BCA76: db $43, $A9, $CF, $2B, $34, $2A ; まで⎵きたか
#_0BCA7C: db $F9 ; new line
#_0BCA7D: db $29, $43, $28, $3A, $3E, $CF, $33, $3D ; おまえには⎵その
#_0BCA85: db $35, $2A, $4B, $9C, $CF, $25, $4D, $38 ; ちからが⎵あると
#_0BCA8D: db $CF, $29, $47, $58, $37, $34, $A4 ; ⎵おもってたぜ
#_0BCA94: db $FC ; wait for key and new line
#_0BCA95: db $FA ; clear message box
#_0BCA96: db $A6, $9C, $CF, $43, $A6, $CF, $35, $56 ; だが⎵まだ⎵ちゅ
#_0BCA9E: db $27, $38, $3E, $52, $B0, $3A ; うとはんぱに
#_0BCAA4: db $F9 ; new line
#_0BCAA5: db $43, $4A, $58, $37, $26, $4D, $4A, $27 ; まよっているよう
#_0BCAAD: db $A6, $39 ; だな
#_0BCAAF: db $F9 ; new line
#_0BCAB0: db $29, $43, $28, $42, $AA, $3D, $CF, $48 ; おまえほどの⎵や
#_0BCAB8: db $36, $9C, $CF ; つが⎵
#_0BCABB: db $F2, $33 ; prewritten text 33
#_0BCABD: db $3D ; の
#_0BCABE: db $F9 ; new line
#_0BCABF: db $9D, $43, $52, $A9, $CF, $26, $58, $B0 ; ぎまんで⎵いっぱ
#_0BCAC7: db $26, $3D, $CF, $34, $50, $A0, $38, $3A ; いの⎵たわごとに
#_0BCACF: db $F9 ; new line
#_0BCAD0: db $44, $44, $51, $CF, $2A, $31, $38, $3E ; みみを⎵かすとは
#_0BCAD8: db $F2, $0B ; prewritten text 0B
#_0BCADA: db $FC ; wait for key and new line
#_0BCADB: db $D3, $0E ; go to message 0E

;===================================================================================================

; [HIM]:
; どうやら おまえは おれのかんがえを
; わかってくれそうだ
; すくなくとも «メシアきょう»の ぎまんには
; ひっかかって いないようだな
; おれも いろいろ やることが あるんだ
; いのちが あったら またあおう«・・・»
; そうそう ひとつ いうことが あった
Message_03_07_0D:
#_0BCADD: db $EF ; write chaos hero name
#_0BCADE: db $9A ; :
#_0BCADF: db $F9 ; new line
#_0BCAE0: db $AA, $27, $48, $4B, $CF, $29, $43, $28 ; どうやら⎵おまえ
#_0BCAE8: db $3E, $CF, $29, $4E, $3D, $2A, $52, $9C ; は⎵おれのかんが
#_0BCAF0: db $28, $51 ; えを
#_0BCAF2: db $F9 ; new line
#_0BCAF3: db $50, $2A, $58, $37, $2C, $4E, $33, $27 ; わかってくれそう
#_0BCAFB: db $A6 ; だ
#_0BCAFC: db $FC ; wait for key and new line
#_0BCAFD: db $FA ; clear message box
#_0BCAFE: db $31, $2C, $39, $2C, $38, $47, $CF ; すくなくとも⎵
#_0BCB05: db $F2, $33 ; prewritten text 33
#_0BCB07: db $3D, $CF, $9D, $43, $52, $3A, $3E ; の⎵ぎまんには
#_0BCB0E: db $F9 ; new line
#_0BCB0F: db $3F, $58, $2A, $2A, $58, $37, $CF, $26 ; ひっかかって⎵い
#_0BCB17: db $39, $26, $4A, $27, $A6, $39 ; ないようだな
#_0BCB1D: db $FC ; wait for key and new line
#_0BCB1E: db $FA ; clear message box
#_0BCB1F: db $29, $4E, $47, $CF, $26, $4F, $26, $4F ; おれも⎵いろいろ
#_0BCB27: db $CF, $48, $4D, $2E, $38, $9C, $CF, $25 ; ⎵やることが⎵あ
#_0BCB2F: db $4D, $52, $A6 ; るんだ
#_0BCB32: db $F9 ; new line
#_0BCB33: db $26, $3D, $35, $9C, $CF, $25, $58, $34 ; いのちが⎵あった
#_0BCB3B: db $4B, $CF, $43, $34, $25, $29, $27 ; ら⎵またあおう
#_0BCB42: db $F2, $0B ; prewritten text 0B
#_0BCB44: db $F9 ; new line
#_0BCB45: db $33, $27, $33, $27, $CF, $3F, $38, $36 ; そうそう⎵ひとつ
#_0BCB4D: db $CF, $26, $27, $2E, $38, $9C, $CF, $25 ; ⎵いうことが⎵あ
#_0BCB55: db $58, $34 ; った
#_0BCB57: db $FC ; wait for key and new line

;===================================================================================================

; ここ «デスティニーランド»には
; だいちぼしん エキドナさまが いる
; あって はなしを きいてみな
Message_03_07_0E:
#_0BCB58: db $FA ; clear message box
#_0BCB59: db $2E, $2E, $CF ; ここ⎵
#_0BCB5C: db $F2, $62 ; prewritten text 62
#_0BCB5E: db $3A, $3E ; には
#_0BCB60: db $F9 ; new line
#_0BCB61: db $A6, $26, $35, $AF, $30, $52, $CF, $60 ; だいちぼしん⎵エ
#_0BCB69: db $63, $C3, $71, $2F, $43, $9C, $CF, $26 ; キドナさまが⎵い
#_0BCB71: db $4D ; る
#_0BCB72: db $F9 ; new line
#_0BCB73: db $25, $58, $37, $CF, $3E, $39, $30, $51 ; あって⎵はなしを
#_0BCB7B: db $CF, $2B, $26, $37, $44, $39 ; ⎵きいてみな
#_0BCB81: db $FC ; wait for key and new line
#_0BCB82: db $D3, $11 ; go to message 11

;===================================================================================================

; [HIM]:
; [CHASE]«・・・»
; おまえは じぶんの こうどうを
; ほんとうに せいぎだと おもっているのか?
; こたえられるか?
; おまえの やってることは
; おれの やってることと おなじだ!
; ちがうのは かみのために«・・・»とかいう
; いいわけが ついていることだ
; いや かみのなを だして
; せいぎづらを してるぶん たちがわるいぜ!
; りえ! おまえは さがってろ
; せいぎづらの ばけのかわを はいでやる!
; [DEMON1]は いきなり おそいかかってきた!
Message_03_07_0F:
#_0BCB84: db $EF ; write chaos hero name
#_0BCB85: db $9A ; :
#_0BCB86: db $F9 ; new line
#_0BCB87: db $F0 ; write player name
#_0BCB88: db $F2, $0B ; prewritten text 0B
#_0BCB8A: db $F9 ; new line
#_0BCB8B: db $29, $43, $28, $3E, $CF, $A2, $AD, $52 ; おまえは⎵じぶん
#_0BCB93: db $3D, $CF, $2E, $27, $AA, $27, $51 ; の⎵こうどうを
#_0BCB9A: db $F9 ; new line
#_0BCB9B: db $42, $52, $38, $27, $3A, $CF, $32, $26 ; ほんとうに⎵せい
#_0BCBA3: db $9D, $A6, $38, $CF, $29, $47, $58, $37 ; ぎだと⎵おもって
#_0BCBAB: db $26, $4D, $3D, $2A, $95 ; いるのか?
#_0BCBB0: db $FC ; wait for key and new line
#_0BCBB1: db $FA ; clear message box
#_0BCBB2: db $2E, $34, $28, $4B, $4E, $4D, $2A, $95 ; こたえられるか?
#_0BCBBA: db $FC ; wait for key and new line
#_0BCBBB: db $29, $43, $28, $3D, $CF, $48, $58, $37 ; おまえの⎵やって
#_0BCBC3: db $4D, $2E, $38, $3E ; ることは
#_0BCBC7: db $F9 ; new line
#_0BCBC8: db $29, $4E, $3D, $CF, $48, $58, $37, $4D ; おれの⎵やってる
#_0BCBD0: db $2E, $38, $38, $CF, $29, $39, $A2, $A6 ; ことと⎵おなじだ
#_0BCBD8: db $94 ; !
#_0BCBD9: db $FC ; wait for key and new line
#_0BCBDA: db $FA ; clear message box
#_0BCBDB: db $35, $9C, $27, $3D, $3E, $CF, $2A, $44 ; ちがうのは⎵かみ
#_0BCBE3: db $3D, $34, $46, $3A ; のために
#_0BCBE7: db $F2, $0B ; prewritten text 0B
#_0BCBE9: db $38, $2A, $26, $27 ; とかいう
#_0BCBED: db $F9 ; new line
#_0BCBEE: db $26, $26, $50, $2D, $9C, $CF, $36, $26 ; いいわけが⎵つい
#_0BCBF6: db $37, $26, $4D, $2E, $38, $A6 ; ていることだ
#_0BCBFC: db $FC ; wait for key and new line
#_0BCBFD: db $26, $48, $CF, $2A, $44, $3D, $39, $51 ; いや⎵かみのなを
#_0BCC05: db $CF, $A6, $30, $37 ; ⎵だして
#_0BCC09: db $F9 ; new line
#_0BCC0A: db $32, $26, $9D, $A8, $4B, $51, $CF, $30 ; せいぎづらを⎵し
#_0BCC12: db $37, $4D, $AD, $52, $CF, $34, $35, $9C ; てるぶん⎵たちが
#_0BCC1A: db $50, $4D, $26, $A4, $94 ; わるいぜ!
#_0BCC1F: db $FC ; wait for key and new line
#_0BCC20: db $FA ; clear message box
#_0BCC21: db $4C, $28, $94, $CF, $29, $43, $28, $3E ; りえ!⎵おまえは
#_0BCC29: db $CF, $2F, $9C, $58, $37, $4F ; ⎵さがってろ
#_0BCC2F: db $F9 ; new line
#_0BCC30: db $D6, $01, $00 ; delete sprite in slot 01
#_0BCC33: db $32, $26, $9D, $A8, $4B, $3D, $CF, $AB ; せいぎづらの⎵ば
#_0BCC3B: db $2D, $3D, $2A, $50, $51, $CF, $3E, $26 ; けのかわを⎵はい
#_0BCC43: db $A9, $48, $4D, $94 ; でやる!
#_0BCC47: db $FC ; wait for key and new line
#_0BCC48: db $DE, $01, $00, $1C, $01 ; load 1x demon 011C
#_0BCC4D: db $F5 ; write demon name from $050A
#_0BCC4E: db $3E, $CF, $26, $2B, $39, $4C, $CF, $29 ; は⎵いきなり⎵お
#_0BCC56: db $33, $26, $2A, $2A, $58, $37, $2B, $34 ; そいかかってきた
#_0BCC5E: db $94 ; !
#_0BCC5F: db $D5, $11 ; send 11 to APU
#_0BCC61: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BCC64: db $D5, $2D ; send 2D to APU
#_0BCC66: db $FE, $0B, $00, $1E ; ext command 0B: something 1E, 00
#_0BCC6A: db $D5, $11 ; send 11 to APU
#_0BCC6C: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BCC6F: db $D5, $2D ; send 2D to APU
#_0BCC71: db $FE, $0B, $01, $1E ; ext command 0B: something 1E, 01
#_0BCC75: db $FC ; wait for key and new line

;===================================================================================================

; [DEMON1]:
; なかなか やるじゃねえか«・・・»
; だが つぎに あったとき こうは いかねえぜ
Message_03_07_10:
#_0BCC76: db $FA ; clear message box
#_0BCC77: db $F5 ; write demon name from $050A
#_0BCC78: db $9A ; :
#_0BCC79: db $F9 ; new line
#_0BCC7A: db $39, $2A, $39, $2A, $CF, $48, $4D, $A2 ; なかなか⎵やるじ
#_0BCC82: db $55, $3C, $28, $2A ; ゃねえか
#_0BCC86: db $F2, $0B ; prewritten text 0B
#_0BCC88: db $F9 ; new line
#_0BCC89: db $A6, $9C, $CF, $36, $9D, $3A, $CF, $25 ; だが⎵つぎに⎵あ
#_0BCC91: db $58, $34, $38, $2B, $CF, $2E, $27, $3E ; ったとき⎵こうは
#_0BCC99: db $CF, $26, $2A, $3C, $28, $A4 ; ⎵いかねえぜ
#_0BCC9F: db $FC ; wait for key and new line

;===================================================================================================

; >[HIM]たちは さっていった
; [MOMO]:
; ねえ [HIM]くんと いっしょにいた
; おんなのこ わたし どうも きにいらないの
; どうしてかな«・・・»
Message_03_07_11:
#_0BCCA0: db $D4, $03 ; set text box size to 3
#_0BCCA2: db $D6, $01, $00 ; delete sprite in slot 01
#_0BCCA5: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BCCA7: db $97 ; >
#_0BCCA8: db $EF ; write chaos hero name
#_0BCCA9: db $34, $35, $3E, $CF, $2F, $58, $37, $26 ; たちは⎵さってい
#_0BCCB1: db $58, $34 ; った
#_0BCCB3: db $FC ; wait for key and new line
#_0BCCB4: db $D0, $8A ; set progress bit 8A
#_0BCCB6: db $E9, $01, $12 ; go to message 12 maybe TODO
#_0BCCB9: db $D6, $00, $A9, $70, $28 ; place sprite A9 in slot 00 at XY:{70,28}
#_0BCCBE: db $FA ; clear message box
#_0BCCBF: db $FE, $2D, $03 ; ext command 2D: call routine 00B99C with value 03 TODO
#_0BCCC2: db $ED ; write female protag name
#_0BCCC3: db $9A ; :
#_0BCCC4: db $F9 ; new line
#_0BCCC5: db $E9, $00, $13 ; go to message 13 maybe TODO
#_0BCCC8: db $3C, $28, $CF ; ねえ⎵
#_0BCCCB: db $EF ; write chaos hero name
#_0BCCCC: db $2C, $52, $38, $CF, $26, $58, $30, $57 ; くんと⎵いっしょ
#_0BCCD4: db $3A, $26, $34 ; にいた
#_0BCCD7: db $F9 ; new line
#_0BCCD8: db $29, $52, $39, $3D, $2E, $CF, $50, $34 ; おんなのこ⎵わた
#_0BCCE0: db $30, $CF, $AA, $27, $47, $CF, $2B, $3A ; し⎵どうも⎵きに
#_0BCCE8: db $26, $4B, $39, $26, $3D ; いらないの
#_0BCCED: db $F9 ; new line
#_0BCCEE: db $AA, $27, $30, $37, $2A, $39 ; どうしてかな
#_0BCCF4: db $F2, $0B ; prewritten text 0B
#_0BCCF6: db $FC ; wait for key and new line

;===================================================================================================

Message_03_07_12:
#_0BCCF7: db $FF ; end of message

;===================================================================================================

; [CHASE]! だいじょうぶ!?
; しっかりして!
Message_03_07_13:
#_0BCCF8: db $F0 ; write player name
#_0BCCF9: db $94, $CF, $A6, $26, $A2, $57, $27, $AD ; !⎵だいじょうぶ
#_0BCD01: db $94, $95 ; !?
#_0BCD03: db $F9 ; new line
#_0BCD04: db $30, $58, $2A, $4C, $30, $37, $94 ; しっかりして!
#_0BCD0B: db $FC ; wait for key and new line
#_0BCD0C: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
; そのほうが [CHASE]か
; わらわは はるかな むかし
; いきとし いけるもの うみし
; めがみ [DEMON1] であるぞよ
; この«デスティニーランド»は わがみをもって
; ささえられておるのじゃ
Message_03_07_14:
#_0BCD0D: db $D5, $46 ; send 46 to APU
#_0BCD0F: db $D7, $2F ; load scene 2F
#_0BCD11: db $D0, $8F ; set progress bit 8F
#_0BCD13: db $D2, $66, $22 ; test progress bit 66 for message 22
#_0BCD16: db $D2, $63, $22 ; test progress bit 63 for message 22
#_0BCD19: db $DE, $01, $00, $11, $01 ; load 1x demon 0111
#_0BCD1E: db $E4, $00 ; load demon $00
#_0BCD20: db $F5 ; write demon name from $050A
#_0BCD21: db $9A ; :
#_0BCD22: db $F9 ; new line
#_0BCD23: db $D2, $85, $1C ; test progress bit 85 for message 1C
#_0BCD26: db $D2, $82, $16 ; test progress bit 82 for message 16
#_0BCD29: db $33, $3D, $42, $27, $9C, $CF ; そのほうが⎵
#_0BCD2F: db $F0 ; write player name
#_0BCD30: db $2A ; か
#_0BCD31: db $F9 ; new line
#_0BCD32: db $50, $4B, $50, $3E, $CF, $3E, $4D, $2A ; わらわは⎵はるか
#_0BCD3A: db $39, $CF, $45, $2A, $30 ; な⎵むかし
#_0BCD3F: db $F9 ; new line
#_0BCD40: db $26, $2B, $38, $30, $CF, $26, $2D, $4D ; いきとし⎵いける
#_0BCD48: db $47, $3D, $CF, $27, $44, $30 ; もの⎵うみし
#_0BCD4E: db $F9 ; new line
#_0BCD4F: db $46, $9C, $44, $CF ; めがみ⎵
#_0BCD53: db $F5 ; write demon name from $050A
#_0BCD54: db $CF, $A9, $25, $4D, $A5, $4A ; ⎵であるぞよ
#_0BCD5A: db $FC ; wait for key and new line
#_0BCD5B: db $FA ; clear message box
#_0BCD5C: db $2E, $3D ; この
#_0BCD5E: db $F2, $62 ; prewritten text 62
#_0BCD60: db $3E, $CF, $50, $9C, $44, $51, $47, $58 ; は⎵わがみをもっ
#_0BCD68: db $37 ; て
#_0BCD69: db $F9 ; new line
#_0BCD6A: db $2F, $2F, $28, $4B, $4E, $37, $29, $4D ; ささえられておる
#_0BCD72: db $3D, $A2, $55 ; のじゃ
#_0BCD75: db $FC ; wait for key and new line
#_0BCD76: db $D0, $82 ; set progress bit 82

;===================================================================================================

; いま «ほうのかみ» すうはいする ものども
; せかいを しはい せんと たくらんでおる
; ひとびと すくわんがためと しょうし
; きゃつらは «ほうのかみ» このちじょうに
; おろさんと しておる
; «トウキョウ»わんに きずかれつつある «カテドラル»
; そのために もちいられるのじゃ
; ひとたび «ほうのかみ» こうりんすれば
; そのしはいに ひとびと よりくるしもう
; しんこうの なのもと こころの おくそこまでも
; かみへの ちゅうせい ちかわせるのじゃ
; ちゅうせい たしかなる にんげんのみ えらび
; «せんねんおうこく» きずきあげる
; それが きゃつらの たくらみじゃ
; かつて わらわを ふくめ おおくの かみがみ
; «ほうのかみ»により マカイへ おとされ
; いにしえの かみと ニンゲンが
; ともに さかえしじだい おわりを つげた
; そのひげき ふたたび くりかえして よいものか
; いにしえの かみがみ
; しんずる «ガイアきょう»とたち
; «カテドラル» のっとろうと しておる
; それをたすけるため
; «デスティニーランド»ごと
; ここまで やってきたのじゃ
; «カテドラル» かんせいさせるため
; シナガワから «メシアきょう»と
; おくりこまれておる
; かれら しぬまで はたらかされ
; しねば かみのもとに めされる とか
; これを さしずする テンシ
; シナガワに ある
; まずは そのテンシ たおさねばならぬ
Message_03_07_15:
#_0BCD78: db $D4, $03 ; set text box size to 3
#_0BCD7A: db $26, $43, $CF ; いま⎵
#_0BCD7D: db $F2, $63 ; prewritten text 63
#_0BCD7F: db $CF, $31, $27, $3E, $26, $31, $4D, $CF ; ⎵すうはいする⎵
#_0BCD87: db $47, $3D, $AA, $47 ; ものども
#_0BCD8B: db $F9 ; new line
#_0BCD8C: db $32, $2A, $26, $51, $CF, $30, $3E, $26 ; せかいを⎵しはい
#_0BCD94: db $CF, $32, $52, $38, $CF, $34, $2C, $4B ; ⎵せんと⎵たくら
#_0BCD9C: db $52, $A9, $29, $4D ; んでおる
#_0BCDA0: db $FC ; wait for key and new line
#_0BCDA1: db $FA ; clear message box
#_0BCDA2: db $3F, $38, $AC, $38, $CF, $31, $2C, $50 ; ひとびと⎵すくわ
#_0BCDAA: db $52, $9C, $34, $46, $38, $CF, $30, $57 ; んがためと⎵しょ
#_0BCDB2: db $27, $30 ; うし
#_0BCDB4: db $F9 ; new line
#_0BCDB5: db $2B, $55, $36, $4B, $3E, $CF ; きゃつらは⎵
#_0BCDBB: db $F2, $63 ; prewritten text 63
#_0BCDBD: db $CF, $2E, $3D, $35, $A2, $57, $27, $3A ; ⎵このちじょうに
#_0BCDC5: db $F9 ; new line
#_0BCDC6: db $29, $4F, $2F, $52, $38, $CF, $30, $37 ; おろさんと⎵して
#_0BCDCE: db $29, $4D ; おる
#_0BCDD0: db $F9 ; new line
#_0BCDD1: db $F2, $1C ; prewritten text 1C
#_0BCDD3: db $50, $52, $3A, $CF, $2B, $A3, $2A, $4E ; わんに⎵きずかれ
#_0BCDDB: db $36, $36, $25, $4D, $CF ; つつある⎵
#_0BCDE0: db $F2, $5C ; prewritten text 5C
#_0BCDE2: db $F9 ; new line
#_0BCDE3: db $33, $3D, $34, $46, $3A, $CF, $47, $35 ; そのために⎵もち
#_0BCDEB: db $26, $4B, $4E, $4D, $3D, $A2, $55 ; いられるのじゃ
#_0BCDF2: db $FC ; wait for key and new line
#_0BCDF3: db $FA ; clear message box
#_0BCDF4: db $3F, $38, $34, $AC, $CF ; ひとたび⎵
#_0BCDF9: db $F2, $63 ; prewritten text 63
#_0BCDFB: db $CF, $2E, $27, $4C, $52, $31, $4E, $AB ; ⎵こうりんすれば
#_0BCE03: db $F9 ; new line
#_0BCE04: db $33, $3D, $30, $3E, $26, $3A, $CF, $3F ; そのしはいに⎵ひ
#_0BCE0C: db $38, $AC, $38, $CF, $4A, $4C, $2C, $4D ; とびと⎵よりくる
#_0BCE14: db $30, $47, $27 ; しもう
#_0BCE17: db $F9 ; new line
#_0BCE18: db $30, $52, $2E, $27, $3D, $CF, $39, $3D ; しんこうの⎵なの
#_0BCE20: db $47, $38, $CF, $2E, $2E, $4F, $3D, $CF ; もと⎵こころの⎵
#_0BCE28: db $29, $2C, $33, $2E, $43, $A9, $47 ; おくそこまでも
#_0BCE2F: db $F9 ; new line
#_0BCE30: db $2A, $44, $41, $3D, $CF, $35, $56, $27 ; かみへの⎵ちゅう
#_0BCE38: db $32, $26, $CF, $35, $2A, $50, $32, $4D ; せい⎵ちかわせる
#_0BCE40: db $3D, $A2, $55 ; のじゃ
#_0BCE43: db $FC ; wait for key and new line
#_0BCE44: db $FA ; clear message box
#_0BCE45: db $35, $56, $27, $32, $26, $CF, $34, $30 ; ちゅうせい⎵たし
#_0BCE4D: db $2A, $39, $4D, $CF, $3A, $52, $9F, $52 ; かなる⎵にんげん
#_0BCE55: db $3D, $44, $CF, $28, $4B, $AC ; のみ⎵えらび
#_0BCE5B: db $F9 ; new line
#_0BCE5C: db $F2, $21 ; prewritten text 21
#_0BCE5E: db $CF, $2B, $A3, $2B, $25, $9F, $4D ; ⎵きずきあげる
#_0BCE65: db $F9 ; new line
#_0BCE66: db $33, $4E, $9C, $CF, $2B, $55, $36, $4B ; それが⎵きゃつら
#_0BCE6E: db $3D, $CF, $34, $2C, $4B, $44, $A2, $55 ; の⎵たくらみじゃ
#_0BCE76: db $FC ; wait for key and new line
#_0BCE77: db $FA ; clear message box
#_0BCE78: db $2A, $36, $37, $CF, $50, $4B, $50, $51 ; かつて⎵わらわを
#_0BCE80: db $CF, $40, $2C, $46, $CF, $29, $29, $2C ; ⎵ふくめ⎵おおく
#_0BCE88: db $3D, $CF, $2A, $44, $9C, $44 ; の⎵かみがみ
#_0BCE8E: db $F9 ; new line
#_0BCE8F: db $F2, $63 ; prewritten text 63
#_0BCE91: db $3A, $4A, $4C, $CF, $7B, $62, $5E, $41 ; により⎵マカイへ
#_0BCE99: db $CF, $29, $38, $2F, $4E ; ⎵おとされ
#_0BCE9E: db $F9 ; new line
#_0BCE9F: db $26, $3A, $30, $28, $3D, $CF, $2A, $44 ; いにしえの⎵かみ
#_0BCEA7: db $38, $CF, $72, $8A, $B8, $8A, $9C ; と⎵ニンゲンが
#_0BCEAE: db $F9 ; new line
#_0BCEAF: db $38, $47, $3A, $CF, $2F, $2A, $28, $30 ; ともに⎵さかえし
#_0BCEB7: db $A2, $A6, $26, $CF, $29, $50, $4C, $51 ; じだい⎵おわりを
#_0BCEBF: db $CF, $36, $9F, $34 ; ⎵つげた
#_0BCEC3: db $F9 ; new line
#_0BCEC4: db $33, $3D, $3F, $9F, $2B, $CF, $40, $34 ; そのひげき⎵ふた
#_0BCECC: db $34, $AC, $CF, $2C, $4C, $2A, $28, $30 ; たび⎵くりかえし
#_0BCED4: db $37, $CF, $4A, $26, $47, $3D, $2A ; て⎵よいものか
#_0BCEDB: db $FC ; wait for key and new line
#_0BCEDC: db $FA ; clear message box
#_0BCEDD: db $26, $3A, $30, $28, $3D, $CF, $2A, $44 ; いにしえの⎵かみ
#_0BCEE5: db $9C, $44 ; がみ
#_0BCEE7: db $F9 ; new line
#_0BCEE8: db $30, $52, $A3, $4D, $CF ; しんずる⎵
#_0BCEED: db $F2, $34 ; prewritten text 34
#_0BCEEF: db $38, $34, $35 ; とたち
#_0BCEF2: db $F9 ; new line
#_0BCEF3: db $F2, $5C ; prewritten text 5C
#_0BCEF5: db $CF, $3D, $58, $38, $4F, $27, $38, $CF ; ⎵のっとろうと⎵
#_0BCEFD: db $30, $37, $29, $4D ; しておる
#_0BCF01: db $F9 ; new line
#_0BCF02: db $33, $4E, $51, $34, $31, $2D, $4D, $34 ; それをたすけるた
#_0BCF0A: db $46 ; め
#_0BCF0B: db $F9 ; new line
#_0BCF0C: db $F2, $62 ; prewritten text 62
#_0BCF0E: db $A0, $38 ; ごと
#_0BCF10: db $F9 ; new line
#_0BCF11: db $2E, $2E, $43, $A9, $CF, $48, $58, $37 ; ここまで⎵やって
#_0BCF19: db $2B, $34, $3D, $A2, $55 ; きたのじゃ
#_0BCF1E: db $FC ; wait for key and new line
#_0BCF1F: db $FA ; clear message box
#_0BCF20: db $FE, $05, $40, $FF, $1C ; ext command 05: go to message 1C if 11C >= -192
#_0BCF25: db $F2, $5C ; prewritten text 5C
#_0BCF27: db $CF, $2A, $52, $32, $26, $2F, $32, $4D ; ⎵かんせいさせる
#_0BCF2F: db $34, $46 ; ため
#_0BCF31: db $F9 ; new line
#_0BCF32: db $68, $71, $B5, $88, $2A, $4B, $CF ; シナガワから⎵
#_0BCF39: db $F2, $33 ; prewritten text 33
#_0BCF3B: db $38 ; と
#_0BCF3C: db $F9 ; new line
#_0BCF3D: db $29, $2C, $4C, $2E, $43, $4E, $37, $29 ; おくりこまれてお
#_0BCF45: db $4D ; る
#_0BCF46: db $F9 ; new line
#_0BCF47: db $2A, $4E, $4B, $CF, $30, $3B, $43, $A9 ; かれら⎵しぬまで
#_0BCF4F: db $CF, $3E, $34, $4B, $2A, $2F, $4E ; ⎵はたらかされ
#_0BCF56: db $F9 ; new line
#_0BCF57: db $30, $3C, $AB, $CF, $2A, $44, $3D, $47 ; しねば⎵かみのも
#_0BCF5F: db $38, $3A, $CF, $46, $2F, $4E, $4D, $CF ; とに⎵めされる⎵
#_0BCF67: db $38, $2A ; とか
#_0BCF69: db $FC ; wait for key and new line
#_0BCF6A: db $D4, $03 ; set text box size to 3
#_0BCF6C: db $2E, $4E, $51, $CF, $2F, $30, $A3, $31 ; これを⎵さしずす
#_0BCF74: db $4D, $CF, $6F, $8A, $68 ; る⎵テンシ
#_0BCF79: db $F9 ; new line
#_0BCF7A: db $68, $71, $B5, $88, $3A, $CF, $25, $4D ; シナガワに⎵ある
#_0BCF82: db $FC ; wait for key and new line
#_0BCF83: db $FA ; clear message box
#_0BCF84: db $D2, $64, $1D ; test progress bit 64 for message 1D
#_0BCF87: db $43, $A3, $3E, $CF, $33, $3D, $6F, $8A ; まずは⎵そのテン
#_0BCF8F: db $68, $CF, $34, $29, $2F, $3C, $AB, $39 ; シ⎵たおさねばな
#_0BCF97: db $4B, $3B ; らぬ
#_0BCF99: db $FC ; wait for key and new line
#_0BCF9A: db $FE, $05, $00, $BF, $18 ; ext command 05: go to message 18 if 11C >= -16640

;===================================================================================================

; わらわの はなし いまいちど きくか?
; シナガワの テンシ たおすやくめ
; ひきうけてくれぬか?
; わらわは このとおり 
; «デスティニーランド»を ささえておるため
; シナガワまで ゆけぬ
; [CHASE]よ そなた みこんで
; たのみたいのじゃ
; かんがえて おくれ«・・・»
Message_03_07_16:
#_0BCF9F: db $D2, $64, $1E ; test progress bit 64 for message 1E
#_0BCFA2: db $D2, $84, $1B ; test progress bit 84 for message 1B
#_0BCFA5: db $50, $4B, $50, $3D, $CF, $3E, $39, $30 ; わらわの⎵はなし
#_0BCFAD: db $CF, $26, $43, $26, $35, $AA, $CF, $2B ; ⎵いまいちど⎵き
#_0BCFB5: db $2C, $2A, $95 ; くか?
#_0BCFB8: db $F8, $15 ; YES/NO - go to message 15 if YES
#_0BCFBA: db $D4, $03 ; set text box size to 3
#_0BCFBC: db $68, $71, $B5, $88, $3D, $CF, $6F, $8A ; シナガワの⎵テン
#_0BCFC4: db $68, $CF, $34, $29, $31, $48, $2C, $46 ; シ⎵たおすやくめ
#_0BCFCC: db $F9 ; new line
#_0BCFCD: db $3F, $2B, $27, $2D, $37, $2C, $4E, $3B ; ひきうけてくれぬ
#_0BCFD5: db $2A, $95 ; か?
#_0BCFD7: db $D2, $83, $17 ; test progress bit 83 for message 17
#_0BCFDA: db $FC ; wait for key and new line
#_0BCFDB: db $FA ; clear message box
#_0BCFDC: db $50, $4B, $50, $3E, $CF, $2E, $3D, $38 ; わらわは⎵このと
#_0BCFE4: db $29, $4C, $CF ; おり⎵
#_0BCFE7: db $F9 ; new line
#_0BCFE8: db $F2, $62 ; prewritten text 62
#_0BCFEA: db $51, $CF, $2F, $2F, $28, $37, $29, $4D ; を⎵ささえておる
#_0BCFF2: db $34, $46 ; ため
#_0BCFF4: db $F9 ; new line
#_0BCFF5: db $68, $71, $B5, $88, $43, $A9, $CF, $49 ; シナガワまで⎵ゆ
#_0BCFFD: db $2D, $3B ; けぬ
#_0BCFFF: db $F9 ; new line
#_0BD000: db $F0 ; write player name
#_0BD001: db $4A, $CF, $33, $39, $34, $CF, $44, $2E ; よ⎵そなた⎵みこ
#_0BD009: db $52, $A9 ; んで
#_0BD00B: db $F9 ; new line
#_0BD00C: db $34, $3D, $44, $34, $26, $3D, $A2, $55 ; たのみたいのじゃ
#_0BD014: db $F9 ; new line
#_0BD015: db $2A, $52, $9C, $28, $37, $CF, $29, $2C ; かんがえて⎵おく
#_0BD01D: db $4E ; れ
#_0BD01E: db $F2, $0B ; prewritten text 0B
#_0BD020: db $FC ; wait for key and new line
#_0BD021: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD023: db $FF ; end of message

;===================================================================================================

Message_03_07_17:
#_0BD024: db $F8, $19 ; YES/NO - go to message 19 if YES
#_0BD026: db $D3, $1F ; go to message 1F

;===================================================================================================

; [CHASE]よ そなただけが たよりじゃ
Message_03_07_18:
#_0BD028: db $F0 ; write player name
#_0BD029: db $4A, $CF, $33, $39, $34, $A6, $2D, $9C ; よ⎵そなただけが
#_0BD031: db $CF, $34, $4A, $4C, $A2, $55 ; ⎵たよりじゃ
#_0BD037: db $F9 ; new line
#_0BD038: db $D3, $1A ; go to message 1A

;===================================================================================================

; ひきうけると もうすか!
; さすが わらわが みこんだだけのことはある
Message_03_07_19:
#_0BD03A: db $D4, $03 ; set text box size to 3
#_0BD03C: db $3F, $2B, $27, $2D, $4D, $38, $CF, $47 ; ひきうけると⎵も
#_0BD044: db $27, $31, $2A, $94 ; うすか!
#_0BD048: db $FC ; wait for key and new line
#_0BD049: db $2F, $31, $9C, $CF, $50, $4B, $50, $9C ; さすが⎵わらわが
#_0BD051: db $CF, $44, $2E, $52, $A6, $A6, $2D, $3D ; ⎵みこんだだけの
#_0BD059: db $2E, $38, $3E, $25, $4D ; ことはある
#_0BD05E: db $F9 ; new line

;===================================================================================================

; たのんだぞよ
Message_03_07_1A:
#_0BD05F: db $34, $3D, $52, $A6, $A5, $4A ; たのんだぞよ
#_0BD065: db $FC ; wait for key and new line
#_0BD066: db $D0, $84 ; set progress bit 84
#_0BD068: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD06A: db $FF ; end of message

;===================================================================================================

; いまだ たおしておらぬのか
; はようせねば «カテドラル»
; できあがって しまうぞよ
Message_03_07_1B:
#_0BD06B: db $26, $43, $A6, $CF, $34, $29, $30, $37 ; いまだ⎵たおして
#_0BD073: db $29, $4B, $3B, $3D, $2A ; おらぬのか
#_0BD078: db $F9 ; new line
#_0BD079: db $3E, $4A, $27, $32, $3C, $AB, $CF ; はようせねば⎵
#_0BD080: db $F2, $5C ; prewritten text 5C
#_0BD082: db $F9 ; new line
#_0BD083: db $A9, $2B, $25, $9C, $58, $37, $CF, $30 ; できあがって⎵し
#_0BD08B: db $43, $27, $A5, $4A ; まうぞよ
#_0BD08F: db $FC ; wait for key and new line
#_0BD090: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD092: db $FF ; end of message

;===================================================================================================

; どうやら そなたに せっとくは むだなようじゃ
; [HIM]の はなしでは
; みこみ ありそうだったが
Message_03_07_1C:
#_0BD093: db $AA, $27, $48, $4B, $CF, $33, $39, $34 ; どうやら⎵そなた
#_0BD09B: db $3A, $CF, $32, $58, $38, $2C, $3E, $CF ; に⎵せっとくは⎵
#_0BD0A3: db $45, $A6, $39, $4A, $27, $A2, $55 ; むだなようじゃ
#_0BD0AA: db $F9 ; new line
#_0BD0AB: db $EF ; write chaos hero name
#_0BD0AC: db $3D, $CF, $3E, $39, $30, $A9, $3E ; の⎵はなしでは
#_0BD0B3: db $F9 ; new line
#_0BD0B4: db $44, $2E, $44, $CF, $25, $4C, $33, $27 ; みこみ⎵ありそう
#_0BD0BC: db $A6, $58, $34, $9C ; だったが
#_0BD0C0: db $FC ; wait for key and new line
#_0BD0C1: db $D3, $1F ; go to message 1F

;===================================================================================================

; その テンシ ハニエル しとめたそうじゃな
Message_03_07_1D:
#_0BD0C3: db $33, $3D, $CF, $6F, $8A, $68, $CF, $76 ; その⎵テンシ⎵ハ
#_0BD0CB: db $72, $60, $85, $CF, $30, $38, $46, $34 ; ニエル⎵しとめた
#_0BD0D3: db $33, $27, $A2, $55, $39 ; そうじゃな
#_0BD0D8: db $F9 ; new line

;===================================================================================================

; テンシ ハニエル しとめたそうじゃな
; ごくろうであった
; さて «ガイアきょう»とによる
; «カテドラル»のっとりの けいりゃくが
; まもなく はじまらんと しておる
; [CHASE]よ そなた これに
; かせいしてくれぬか?
; なに! わらわの たのみ きけぬともうすか!
Message_03_07_1E:
#_0BD0C6: db $6F, $8A, $68, $CF, $76, $72, $60, $85 ; テンシ⎵ハニエル
#_0BD0CE: db $CF, $30, $38, $46, $34, $33, $27, $A2 ; ⎵しとめたそうじ
#_0BD0D6: db $55, $39 ; ゃな
#_0BD0D8: db $F9 ; new line
#_0BD0D9: db $A0, $2C, $4F, $27, $A9, $25, $58, $34 ; ごくろうであった
#_0BD0E1: db $FC ; wait for key and new line
#_0BD0E2: db $FA ; clear message box
#_0BD0E3: db $FE, $05, $00, $BF, $21 ; ext command 05: go to message 21 if 11C >= -16640
#_0BD0E8: db $2F, $37, $CF ; さて⎵
#_0BD0EB: db $F2, $34 ; prewritten text 34
#_0BD0ED: db $38, $3A, $4A, $4D ; とによる
#_0BD0F1: db $F9 ; new line
#_0BD0F2: db $F2, $5C ; prewritten text 5C
#_0BD0F4: db $3D, $58, $38, $4C, $3D, $CF, $2D, $26 ; のっとりの⎵けい
#_0BD0FC: db $4C, $55, $2C, $9C ; りゃくが
#_0BD100: db $F9 ; new line
#_0BD101: db $43, $47, $39, $2C, $CF, $3E, $A2, $43 ; まもなく⎵はじま
#_0BD109: db $4B, $52, $38, $CF, $30, $37, $29, $4D ; らんと⎵しておる
#_0BD111: db $FC ; wait for key and new line
#_0BD112: db $FA ; clear message box
#_0BD113: db $F0 ; write player name
#_0BD114: db $4A, $CF, $33, $39, $34, $CF, $2E, $4E ; よ⎵そなた⎵これ
#_0BD11C: db $3A ; に
#_0BD11D: db $F9 ; new line
#_0BD11E: db $2A, $32, $26, $30, $37, $2C, $4E, $3B ; かせいしてくれぬ
#_0BD126: db $2A, $95 ; か?
#_0BD128: db $F8, $21 ; YES/NO - go to message 21 if YES
#_0BD12A: db $D4, $03 ; set text box size to 3
#_0BD12C: db $39, $3A, $94, $CF, $50, $4B, $50, $3D ; なに!⎵わらわの
#_0BD134: db $CF, $34, $3D, $44, $CF, $2B, $2D, $3B ; ⎵たのみ⎵きけぬ
#_0BD13C: db $38, $47, $27, $31, $2A, $94 ; ともうすか!
#_0BD142: db $FC ; wait for key and new line

;===================================================================================================

; では わらわが やつざきに してくれようぞ!
Message_03_07_1F:
#_0BD143: db $D4, $03 ; set text box size to 3
#_0BD145: db $A9, $3E, $CF, $50, $4B, $50, $9C, $CF ; では⎵わらわが⎵
#_0BD14D: db $48, $36, $A1, $2B, $3A, $CF, $30, $37 ; やつざきに⎵して
#_0BD155: db $2C, $4E, $4A, $27, $A5, $94 ; くれようぞ!
#_0BD15B: db $FC ; wait for key and new line
#_0BD15C: db $DE, $01, $00, $11, $01 ; load 1x demon 0111
#_0BD161: db $E4, $00 ; load demon $00
#_0BD163: db $D5, $39 ; send 39 to APU
#_0BD165: db $E5, $01, $23 ; [COMMAND E5:01,23]

;===================================================================================================

Message_03_07_20:
#_0BD168: db $E5, $00, $23 ; [COMMAND E5:00,23]
#_0BD16B: db $D3, $20 ; go to message 20

;===================================================================================================

; では «カテドラル»へ はしを かけよう
; そとにでて ミナミに ゆくがよい
Message_03_07_21:
#_0BD16D: db $D4, $03 ; set text box size to 3
#_0BD16F: db $A9, $3E, $CF ; では⎵
#_0BD172: db $F2, $5C ; prewritten text 5C
#_0BD174: db $41, $CF, $3E, $30, $51, $CF, $2A, $2D ; へ⎵はしを⎵かけ
#_0BD17C: db $4A, $27 ; よう
#_0BD17E: db $F9 ; new line
#_0BD17F: db $33, $38, $3A, $A9, $37, $CF, $7C, $71 ; そとにでて⎵ミナ
#_0BD187: db $7C, $3A, $CF, $49, $2C, $9C, $4A, $26 ; ミに⎵ゆくがよい
#_0BD18F: db $FC ; wait for key and new line
#_0BD190: db $D0, $66 ; set progress bit 66
#_0BD192: db $FE, $02, $50 ; ext command 02: add 80 to STAT_11C if progress bit FB
#_0BD195: db $D0, $FB ; set progress bit FB
#_0BD197: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD199: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_07_22:
#_0BD19A: db $97 ; >
#_0BD19B: db $F2, $2C ; prewritten text 2C
#_0BD19D: db $FC ; wait for key and new line
#_0BD19E: db $FF ; end of message

;===================================================================================================

Message_03_07_23:
#_0BD19F: db $D0, $63 ; set progress bit 63
#_0BD1A1: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD1A3: db $FE, $02, $E0 ; ext command 02: add 224 to STAT_11C if progress bit FB
#_0BD1A6: db $D2, $64, $24 ; test progress bit 64 for message 24
#_0BD1A9: db $FF ; end of message

;===================================================================================================

Message_03_07_24:
#_0BD1AA: db $D0, $FB ; set progress bit FB
#_0BD1AC: db $FF ; end of message

;===================================================================================================

; こえ:
; «グワッ グワッ» «グワッ グワッ»
; おまえの うんを ためしてやる«グワッ グワッ»
; グワーッ う うんの いいやつめ
; «グワッ グワッ» «グワッ グワッ» «グワッ グワッ»
Message_03_07_25:
#_0BD1AD: db $2E, $28, $9A ; こえ:
#_0BD1B0: db $F9 ; new line
#_0BD1B1: db $F2, $64 ; prewritten text 64
#_0BD1B3: db $CF ; ⎵
#_0BD1B4: db $F2, $64 ; prewritten text 64
#_0BD1B6: db $F9 ; new line
#_0BD1B7: db $29, $43, $28, $3D, $CF, $27, $52, $51 ; おまえの⎵うんを
#_0BD1BF: db $CF, $34, $46, $30, $37, $48, $4D ; ⎵ためしてやる
#_0BD1C6: db $F2, $64 ; prewritten text 64
#_0BD1C8: db $FC ; wait for key and new line
#_0BD1C9: db $F7, $5F, $26 ; go to message 26 if RNG <= $5F
#_0BD1CC: db $FA ; clear message box
#_0BD1CD: db $B7, $88, $5A, $92, $CF, $27, $CF, $27 ; グワーッ⎵う⎵う
#_0BD1D5: db $52, $3D, $CF, $26, $26, $48, $36, $46 ; んの⎵いいやつめ
#_0BD1DD: db $F9 ; new line
#_0BD1DE: db $F2, $64 ; prewritten text 64
#_0BD1E0: db $CF ; ⎵
#_0BD1E1: db $F2, $64 ; prewritten text 64
#_0BD1E3: db $CF ; ⎵
#_0BD1E4: db $F2, $64 ; prewritten text 64
#_0BD1E6: db $FC ; wait for key and new line
#_0BD1E7: db $FE, $23, $00 ; ext command 23: something 00 TODO
#_0BD1EA: db $FF ; end of message

;===================================================================================================

Message_03_07_26:
#_0BD1EB: db $F7, $5F, $27 ; go to message 27 if RNG <= $5F
#_0BD1EE: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD1F1: db $D5, $0E ; send 0E to APU
#_0BD1F3: db $FE, $0B, $00, $0A ; ext command 0B: something 0A, 00
#_0BD1F7: db $D3, $2C ; go to message 2C

;===================================================================================================

Message_03_07_27:
#_0BD1F9: db $F7, $7F, $28 ; go to message 28 if RNG <= $7F
#_0BD1FC: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD1FF: db $D5, $0E ; send 0E to APU
#_0BD201: db $FE, $0B, $00, $0F ; ext command 0B: something 0F, 00
#_0BD205: db $D3, $2C ; go to message 2C

;===================================================================================================

Message_03_07_28:
#_0BD207: db $F7, $3F, $29 ; go to message 29 if RNG <= $3F
#_0BD20A: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD20D: db $D5, $0E ; send 0E to APU
#_0BD20F: db $FE, $0B, $00, $1E ; ext command 0B: something 1E, 00
#_0BD213: db $D3, $2C ; go to message 2C

;===================================================================================================

Message_03_07_29:
#_0BD215: db $F7, $3F, $2A ; go to message 2A if RNG <= $3F
#_0BD218: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD21B: db $D5, $0E ; send 0E to APU
#_0BD21D: db $FE, $0B, $00, $32 ; ext command 0B: something 32, 00
#_0BD221: db $D3, $2C ; go to message 2C

;===================================================================================================

Message_03_07_2A:
#_0BD223: db $F7, $7F, $2B ; go to message 2B if RNG <= $7F
#_0BD226: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD229: db $D5, $0E ; send 0E to APU
#_0BD22B: db $FE, $0B, $00, $46 ; ext command 0B: something 46, 00
#_0BD22F: db $D3, $2C ; go to message 2C

;===================================================================================================

Message_03_07_2B:
#_0BD231: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD234: db $D5, $0E ; send 0E to APU
#_0BD236: db $FE, $0B, $00, $5A ; ext command 0B: something 5A, 00

;===================================================================================================

; «グワッ グワッ» うんが わるかったな
; «グワッ グワッ» «グワッ グワッ»
Message_03_07_2C:
#_0BD23A: db $FA ; clear message box
#_0BD23B: db $F2, $64 ; prewritten text 64
#_0BD23D: db $CF, $27, $52, $9C, $CF, $50, $4D, $2A ; ⎵うんが⎵わるか
#_0BD245: db $58, $34, $39 ; ったな
#_0BD248: db $F9 ; new line
#_0BD249: db $F2, $64 ; prewritten text 64
#_0BD24B: db $CF ; ⎵
#_0BD24C: db $F2, $64 ; prewritten text 64
#_0BD24E: db $FC ; wait for key and new line
#_0BD24F: db $FF ; end of message

;===================================================================================================

; こえ:
; WELCOME TO
; TOKYO DESTINY LAND
; «デスティニーランド»へ ようこそ!
; ここは ひとの うんめいを
; ためすところだよ さあ きみは どうかな?
Message_03_07_2D:
#_0BD250: db $2E, $28, $9A ; こえ:
#_0BD253: db $F9 ; new line
#_0BD254: db $21, $0F, $16, $0D, $19, $17, $0F, $CF ; WELCOME⎵
#_0BD25C: db $1E, $19 ; TO
#_0BD25E: db $F9 ; new line
#_0BD25F: db $1E, $19, $15, $23, $19, $CF, $0E, $0F ; TOKYO⎵DE
#_0BD267: db $1D, $1E, $13, $18, $23, $CF, $16, $0B ; STINY⎵LA
#_0BD26F: db $18, $0E ; ND
#_0BD271: db $FC ; wait for key and new line
#_0BD272: db $FA ; clear message box
#_0BD273: db $F2, $62 ; prewritten text 62
#_0BD275: db $41, $CF, $4A, $27, $2E, $33, $94 ; へ⎵ようこそ!
#_0BD27C: db $FC ; wait for key and new line
#_0BD27D: db $FA ; clear message box
#_0BD27E: db $2E, $2E, $3E, $CF, $3F, $38, $3D, $CF ; ここは⎵ひとの⎵
#_0BD286: db $27, $52, $46, $26, $51 ; うんめいを
#_0BD28B: db $F9 ; new line
#_0BD28C: db $34, $46, $31, $38, $2E, $4F, $A6, $4A ; ためすところだよ
#_0BD294: db $CF, $2F, $25, $CF, $2B, $44, $3E, $CF ; ⎵さあ⎵きみは⎵
#_0BD29C: db $AA, $27, $2A, $39, $95 ; どうかな?
#_0BD2A1: db $FC ; wait for key and new line
#_0BD2A2: db $FE, $2E, $00, $00 ; ext command 2E: 00 00 2E TODO
#_0BD2A7: db $FE, $2E, $00, $01 ; ext command 2E: 00 01 2E TODO
#_0BD2AC: db $FE, $2E, $00, $02 ; ext command 2E: 00 02 2E TODO
#_0BD2B1: db $FE, $2E, $00, $03 ; ext command 2E: 00 03 2E TODO
#_0BD2B6: db $FE, $2E, $00, $05 ; ext command 2E: 00 05 2E TODO
#_0BD2BB: db $FE, $2E, $00, $06 ; ext command 2E: 00 06 2E TODO
#_0BD2C0: db $F7, $5F, $2F ; go to message 2F if RNG <= $5F

;===================================================================================================

; きみは うんが よかったね
; うんさえ よければ このよは てんごく!
Message_03_07_2E:
#_0BD2C3: db $FA ; clear message box
#_0BD2C4: db $2B, $44, $3E, $CF, $27, $52, $9C, $CF ; きみは⎵うんが⎵
#_0BD2CC: db $4A, $2A, $58, $34, $3C ; よかったね
#_0BD2D1: db $F9 ; new line
#_0BD2D2: db $27, $52, $2F, $28, $CF, $4A, $2D, $4E ; うんさえ⎵よけれ
#_0BD2DA: db $AB, $CF, $2E, $3D, $4A, $3E, $CF, $37 ; ば⎵このよは⎵て
#_0BD2E2: db $52, $A0, $2C, $94 ; んごく!
#_0BD2E6: db $FC ; wait for key and new line
#_0BD2E7: db $FF ; end of message

;===================================================================================================

Message_03_07_2F:
#_0BD2E8: db $F7, $F7, $30 ; go to message 30 if RNG <= $F7
#_0BD2EB: db $D5, $20 ; send 20 to APU
#_0BD2ED: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD2F0: db $D5, $2D ; send 2D to APU
#_0BD2F2: db $FE, $0D, $00, $04 ; ext command 0D: something 04, 00
#_0BD2F6: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_07_30:
#_0BD2F8: db $F7, $3F, $31 ; go to message 31 if RNG <= $3F
#_0BD2FB: db $D5, $20 ; send 20 to APU
#_0BD2FD: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD300: db $D5, $2D ; send 2D to APU
#_0BD302: db $FE, $0D, $00, $07 ; ext command 0D: something 07, 00
#_0BD306: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_07_31:
#_0BD308: db $F7, $3F, $32 ; go to message 32 if RNG <= $3F
#_0BD30B: db $D5, $20 ; send 20 to APU
#_0BD30D: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD310: db $D5, $2D ; send 2D to APU
#_0BD312: db $FE, $0D, $00, $06 ; ext command 0D: something 06, 00
#_0BD316: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_07_32:
#_0BD318: db $F7, $3F, $33 ; go to message 33 if RNG <= $3F
#_0BD31B: db $D5, $20 ; send 20 to APU
#_0BD31D: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD320: db $D5, $2D ; send 2D to APU
#_0BD322: db $FE, $0D, $00, $05 ; ext command 0D: something 05, 00
#_0BD326: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_07_33:
#_0BD328: db $F7, $7F, $34 ; go to message 34 if RNG <= $7F
#_0BD32B: db $D5, $20 ; send 20 to APU
#_0BD32D: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD330: db $D5, $2D ; send 2D to APU
#_0BD332: db $FE, $0D, $00, $03 ; ext command 0D: something 03, 00
#_0BD336: db $D3, $35 ; go to message 35

;===================================================================================================

Message_03_07_34:
#_0BD338: db $D5, $20 ; send 20 to APU
#_0BD33A: db $FE, $1C, $03 ; ext command 1C: $03 TODO
#_0BD33D: db $D5, $2D ; send 2D to APU
#_0BD33F: db $FE, $0D, $00, $02 ; ext command 0D: something 02, 00

;===================================================================================================

; きみは うんが わるかったね
; うんが わるけりゃ しぬだけさ!
Message_03_07_35:
#_0BD343: db $FA ; clear message box
#_0BD344: db $2B, $44, $3E, $CF, $27, $52, $9C, $CF ; きみは⎵うんが⎵
#_0BD34C: db $50, $4D, $2A, $58, $34, $3C ; わるかったね
#_0BD352: db $F9 ; new line
#_0BD353: db $27, $52, $9C, $CF, $50, $4D, $2D, $4C ; うんが⎵わるけり
#_0BD35B: db $55, $CF, $30, $3B, $A6, $2D, $2F, $94 ; ゃ⎵しぬだけさ!
#_0BD363: db $FC ; wait for key and new line
#_0BD364: db $FF ; end of message

;===================================================================================================

; おとこ:
; さあさあ あなたも うんだめし
; そして うんめいを うらなおう
; このおくへ すすんでいき ついたさきが
; あなたの うんめいだよ
; なにが でるかは おたのしみ
; おだいは たったの ℏ5000 だよ
; >ℏ5000 はらいますか?
; おとこ:
; はらわないなら さよならだ
Message_03_07_36:
#_0BD365: db $D6, $00, $87, $70, $28 ; place sprite 87 in slot 00 at XY:{70,28}
#_0BD36A: db $DA, $00, $00, $00 ; give 0 money
#_0BD36E: db $29, $38, $2E, $9A ; おとこ:
#_0BD372: db $F9 ; new line
#_0BD373: db $2F, $25, $2F, $25, $CF, $25, $39, $34 ; さあさあ⎵あなた
#_0BD37B: db $47, $CF, $27, $52, $A6, $46, $30 ; も⎵うんだめし
#_0BD382: db $F9 ; new line
#_0BD383: db $33, $30, $37, $CF, $27, $52, $46, $26 ; そして⎵うんめい
#_0BD38B: db $51, $CF, $27, $4B, $39, $29, $27 ; を⎵うらなおう
#_0BD392: db $FC ; wait for key and new line
#_0BD393: db $FA ; clear message box
#_0BD394: db $2E, $3D, $29, $2C, $41, $CF, $31, $31 ; このおくへ⎵すす
#_0BD39C: db $52, $A9, $26, $2B, $CF, $36, $26, $34 ; んでいき⎵ついた
#_0BD3A4: db $2F, $2B, $9C ; さきが
#_0BD3A7: db $F9 ; new line
#_0BD3A8: db $25, $39, $34, $3D, $CF, $27, $52, $46 ; あなたの⎵うんめ
#_0BD3B0: db $26, $A6, $4A ; いだよ
#_0BD3B3: db $F9 ; new line
#_0BD3B4: db $39, $3A, $9C, $CF, $A9, $4D, $2A, $3E ; なにが⎵でるかは
#_0BD3BC: db $CF, $29, $34, $3D, $30, $44 ; ⎵おたのしみ
#_0BD3C2: db $FC ; wait for key and new line
#_0BD3C3: db $FA ; clear message box
#_0BD3C4: db $29, $A6, $26, $3E, $CF, $34, $58, $34 ; おだいは⎵たった
#_0BD3CC: db $3D, $CF, $5C, $06, $01, $01, $01, $CF ; の⎵ℏ5000⎵
#_0BD3D4: db $A6, $4A ; だよ
#_0BD3D6: db $FC ; wait for key and new line
#_0BD3D7: db $FA ; clear message box
#_0BD3D8: db $97, $5C, $06, $01, $01, $01, $CF, $3E ; >ℏ5000⎵は
#_0BD3E0: db $4B, $26, $43, $31, $2A, $95 ; らいますか?
#_0BD3E6: db $F8, $37 ; YES/NO - go to message 37 if YES
#_0BD3E8: db $D4, $03 ; set text box size to 3
#_0BD3EA: db $29, $38, $2E, $9A ; おとこ:
#_0BD3EE: db $F9 ; new line
#_0BD3EF: db $3E, $4B, $50, $39, $26, $39, $4B, $CF ; はらわないなら⎵
#_0BD3F7: db $2F, $4A, $39, $4B, $A6 ; さよならだ
#_0BD3FC: db $FC ; wait for key and new line
#_0BD3FD: db $FF ; end of message

;===================================================================================================

; 4つの いりぐち どこから はいっても いいよ
Message_03_07_37:
#_0BD3FE: db $D9, $88, $13, $00, $38 ; go to message 38 if money < 5000
#_0BD403: db $DA, $78, $EC, $FF ; take 5000 money
#_0BD407: db $D4, $03 ; set text box size to 3
#_0BD409: db $05, $36, $3D, $CF, $26, $4C, $9E, $35 ; 4つの⎵いりぐち
#_0BD411: db $CF, $AA, $2E, $2A, $4B, $CF, $3E, $26 ; ⎵どこから⎵はい
#_0BD419: db $58, $37, $47, $CF, $26, $26, $4A ; っても⎵いいよ
#_0BD420: db $FC ; wait for key and new line
#_0BD421: db $FE, $1A, $07, $28, $11, $00, $08, $27 ; ext command 1A: 07,28,11,00,08,27
#_0BD429: db $FF ; end of message

;===================================================================================================

; かねが たりねえぞ! なめんなよ こら!
Message_03_07_38:
#_0BD42A: db $FA ; clear message box
#_0BD42B: db $2A, $3C, $9C, $CF, $34, $4C, $3C, $28 ; かねが⎵たりねえ
#_0BD433: db $A5, $94, $CF, $39, $46, $52, $39, $4A ; ぞ!⎵なめんなよ
#_0BD43B: db $CF, $2E, $4B, $94 ; ⎵こら!
#_0BD43F: db $FC ; wait for key and new line
#_0BD440: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
; カオスの やつら こんなとこに
; とじこめやがって
; ついに おれを ころしに きたのか!
; やられて たまるか!
Message_03_07_39:
#_0BD441: db $D5, $45 ; send 45 to APU
#_0BD443: db $D2, $91, $3C ; test progress bit 91 for message 3C
#_0BD446: db $DE, $00, $00, $CA, $01 ; load 1x demon 00CA
#_0BD44B: db $E4, $00 ; load demon $00
#_0BD44D: db $F5 ; write demon name from $050A
#_0BD44E: db $9A ; :
#_0BD44F: db $F9 ; new line
#_0BD450: db $62, $61, $69, $3D, $CF, $48, $36, $4B ; カオスの⎵やつら
#_0BD458: db $CF, $2E, $52, $39, $38, $2E, $3A ; ⎵こんなとこに
#_0BD45F: db $F9 ; new line
#_0BD460: db $38, $A2, $2E, $46, $48, $9C, $58, $37 ; とじこめやがって
#_0BD468: db $FC ; wait for key and new line
#_0BD469: db $FA ; clear message box
#_0BD46A: db $36, $26, $3A, $CF, $29, $4E, $51, $CF ; ついに⎵おれを⎵
#_0BD472: db $2E, $4F, $30, $3A, $CF, $2B, $34, $3D ; ころしに⎵きたの
#_0BD47A: db $2A, $94 ; か!
#_0BD47C: db $F9 ; new line
#_0BD47D: db $48, $4B, $4E, $37, $CF, $34, $43, $4D ; やられて⎵たまる
#_0BD485: db $2A, $94 ; か!
#_0BD487: db $FC ; wait for key and new line
#_0BD488: db $D5, $39 ; send 39 to APU
#_0BD48A: db $E5, $01, $3B ; [COMMAND E5:01,3B]

;===================================================================================================

Message_03_07_3A:
#_0BD48D: db $E5, $00, $3B ; [COMMAND E5:00,3B]
#_0BD490: db $D3, $3A ; go to message 3A

;===================================================================================================

Message_03_07_3B:
#_0BD492: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD494: db $FE, $02, $10 ; ext command 02: add 16 to STAT_11C if progress bit FB
#_0BD497: db $D0, $91 ; set progress bit 91
#_0BD499: db $D3, $45 ; go to message 45

;===================================================================================================

; >«だれもいない»
Message_03_07_3C:
#_0BD49B: db $97 ; >
#_0BD49C: db $F2, $2C ; prewritten text 2C
#_0BD49E: db $FC ; wait for key and new line
#_0BD49F: db $D3, $45 ; go to message 45

;===================================================================================================

; [DEMON1]:
; おのれ かみの てさきめ!
; せいばいしてくれる!
Message_03_07_3D:
#_0BD4A1: db $D5, $46 ; send 46 to APU
#_0BD4A3: db $D2, $92, $3C ; test progress bit 92 for message 3C
#_0BD4A6: db $DE, $00, $00, $C4, $01 ; load 1x demon 00C4
#_0BD4AB: db $E4, $00 ; load demon $00
#_0BD4AD: db $F5 ; write demon name from $050A
#_0BD4AE: db $9A ; :
#_0BD4AF: db $F9 ; new line
#_0BD4B0: db $29, $3D, $4E, $CF, $2A, $44, $3D, $CF ; おのれ⎵かみの⎵
#_0BD4B8: db $37, $2F, $2B, $46, $94 ; てさきめ!
#_0BD4BD: db $F9 ; new line
#_0BD4BE: db $32, $26, $AB, $26, $30, $37, $2C, $4E ; せいばいしてくれ
#_0BD4C6: db $4D, $94 ; る!
#_0BD4C8: db $FC ; wait for key and new line
#_0BD4C9: db $D5, $39 ; send 39 to APU
#_0BD4CB: db $E5, $01, $3F ; [COMMAND E5:01,3F]

;===================================================================================================

Message_03_07_3E:
#_0BD4CE: db $E5, $00, $3F ; [COMMAND E5:00,3F]
#_0BD4D1: db $D3, $3E ; go to message 3E

;===================================================================================================

Message_03_07_3F:
#_0BD4D3: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD4D5: db $FE, $02, $F0 ; ext command 02: add 240 to STAT_11C if progress bit FB
#_0BD4D8: db $D0, $92 ; set progress bit 92
#_0BD4DA: db $D3, $45 ; go to message 45

;===================================================================================================

; «ガイアきょう»と:
; おまえの たましいは われらカオスに
; ひきよせられたのだ!
Message_03_07_40:
#_0BD4DC: db $D5, $46 ; send 46 to APU
#_0BD4DE: db $D6, $00, $65, $70, $28 ; place sprite 65 in slot 00 at XY:{70,28}
#_0BD4E3: db $F2, $34 ; prewritten text 34
#_0BD4E5: db $38, $9A ; と:
#_0BD4E7: db $F9 ; new line
#_0BD4E8: db $D2, $93, $41 ; test progress bit 93 for message 41
#_0BD4EB: db $29, $43, $28, $3D, $CF, $34, $43, $30 ; おまえの⎵たまし
#_0BD4F3: db $26, $3E, $CF, $50, $4E, $4B, $62, $61 ; いは⎵われらカオ
#_0BD4FB: db $69, $3A ; スに
#_0BD4FD: db $F9 ; new line
#_0BD4FE: db $3F, $2B, $4A, $32, $4B, $4E, $34, $3D ; ひきよせられたの
#_0BD506: db $A6, $94 ; だ!
#_0BD508: db $FC ; wait for key and new line
#_0BD509: db $FE, $02, $10 ; ext command 02: add 16 to STAT_11C if progress bit FB
#_0BD50C: db $D0, $93 ; set progress bit 93
#_0BD50E: db $FE, $23, $FF ; ext command 23: something FF TODO
#_0BD511: db $FE, $24, $FF ; ext command 24: something FF TODO
#_0BD514: db $D6, $00, $00 ; delete sprite in slot 00
#_0BD517: db $D3, $45 ; go to message 45

;===================================================================================================

; さあゆけ
; われら カオスのために たたかうのだ
Message_03_07_41:
#_0BD519: db $2F, $25, $49, $2D ; さあゆけ
#_0BD51D: db $F9 ; new line
#_0BD51E: db $50, $4E, $4B, $CF, $62, $61, $69, $3D ; われら⎵カオスの
#_0BD526: db $34, $46, $3A, $CF, $34, $34, $2A, $27 ; ために⎵たたかう
#_0BD52E: db $3D, $A6 ; のだ
#_0BD530: db $FC ; wait for key and new line
#_0BD531: db $D6, $00, $10, $D3, $45 ; place sprite 10 in slot 00 at XY:{D3,45}

;===================================================================================================

; [DEMON1]:
; わたしの もとに たどりついた あなたは
; ひかりの つかいです«・・・»
Message_03_07_42:
#_0BD536: db $D5, $45 ; send 45 to APU
#_0BD538: db $DE, $00, $00, $29, $01 ; load 1x demon 0029
#_0BD53D: db $E4, $00 ; load demon $00
#_0BD53F: db $F5 ; write demon name from $050A
#_0BD540: db $9A ; :
#_0BD541: db $F9 ; new line
#_0BD542: db $D2, $94, $44 ; test progress bit 94 for message 44
#_0BD545: db $50, $34, $30, $3D, $CF, $47, $38, $3A ; わたしの⎵もとに
#_0BD54D: db $CF, $34, $AA, $4C, $36, $26, $34, $CF ; ⎵たどりついた⎵
#_0BD555: db $25, $39, $34, $3E ; あなたは
#_0BD559: db $F9 ; new line
#_0BD55A: db $3F, $2A, $4C, $3D, $CF, $36, $2A, $26 ; ひかりの⎵つかい
#_0BD562: db $A9, $31 ; です
#_0BD564: db $F2, $0B ; prewritten text 0B
#_0BD566: db $FC ; wait for key and new line
#_0BD567: db $FE, $02, $F0 ; ext command 02: add 240 to STAT_11C if progress bit FB
#_0BD56A: db $D0, $94 ; set progress bit 94
#_0BD56C: db $FE, $23, $FF ; ext command 23: something FF TODO
#_0BD56F: db $FE, $24, $FF ; ext command 24: something FF TODO

;===================================================================================================

Message_03_07_43:
#_0BD572: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD574: db $D3, $45 ; go to message 45

;===================================================================================================

; もう わたしには あなたに なにかしてあげる
; ちからは のこっていません«・・・»
Message_03_07_44:
#_0BD576: db $47, $27, $CF, $50, $34, $30, $3A, $3E ; もう⎵わたしには
#_0BD57E: db $CF, $25, $39, $34, $3A, $CF, $39, $3A ; ⎵あなたに⎵なに
#_0BD586: db $2A, $30, $37, $25, $9F, $4D ; かしてあげる
#_0BD58C: db $F9 ; new line
#_0BD58D: db $35, $2A, $4B, $3E, $CF, $3D, $2E, $58 ; ちからは⎵のこっ
#_0BD595: db $37, $26, $43, $32, $52 ; ていません
#_0BD59A: db $F2, $0B ; prewritten text 0B
#_0BD59C: db $FC ; wait for key and new line
#_0BD59D: db $D3, $43 ; go to message 43

;===================================================================================================

Message_03_07_45:
#_0BD59F: db $FE, $1A, $08, $A9, $11, $00, $08, $27 ; ext command 1A: 08,A9,11,00,08,27
#_0BD5A7: db $FE, $37 ; ext command 37: reload dungeon view
#_0BD5A9: db $FF ; end of message

;===================================================================================================

; «アクマつかい»:
; そこの «アクマつかい» まて!
; いい ハンドヘルド«コンピュータ»を もっているな
; それを だまって おいていけば
; いのちだけは たすけてやろう«・・・»
; ふん おいていくきは ないようね
; ならば いやでも おいていかせてやる!
Message_03_07_46:
#_0BD5AA: db $D2, $37, $4D ; test progress bit 37 for message 4D
#_0BD5AD: db $D6, $00, $A4, $70, $28 ; place sprite A4 in slot 00 at XY:{70,28}
#_0BD5B2: db $F2, $6D ; prewritten text 6D
#_0BD5B4: db $9A ; :
#_0BD5B5: db $F9 ; new line
#_0BD5B6: db $33, $2E, $3D, $CF ; そこの⎵
#_0BD5BA: db $F2, $6D ; prewritten text 6D
#_0BD5BC: db $CF, $43, $37, $94 ; ⎵まて!
#_0BD5C0: db $F9 ; new line
#_0BD5C1: db $26, $26, $CF, $76, $8A, $C3, $79, $85 ; いい⎵ハンドヘル
#_0BD5C9: db $C3 ; ド
#_0BD5CA: db $F2, $09 ; prewritten text 09
#_0BD5CC: db $51, $CF, $47, $58, $37, $26, $4D, $39 ; を⎵もっているな
#_0BD5D4: db $FC ; wait for key and new line
#_0BD5D5: db $FA ; clear message box
#_0BD5D6: db $33, $4E, $51, $CF, $A6, $43, $58, $37 ; それを⎵だまって
#_0BD5DE: db $CF, $29, $26, $37, $26, $2D, $AB ; ⎵おいていけば
#_0BD5E5: db $F9 ; new line
#_0BD5E6: db $26, $3D, $35, $A6, $2D, $3E, $CF, $34 ; いのちだけは⎵た
#_0BD5EE: db $31, $2D, $37, $48, $4F, $27 ; すけてやろう
#_0BD5F4: db $F2, $0B ; prewritten text 0B
#_0BD5F6: db $FC ; wait for key and new line
#_0BD5F7: db $FA ; clear message box
#_0BD5F8: db $40, $52, $CF, $29, $26, $37, $26, $2C ; ふん⎵おいていく
#_0BD600: db $2B, $3E, $CF, $39, $26, $4A, $27, $3C ; きは⎵ないようね
#_0BD608: db $F9 ; new line
#_0BD609: db $39, $4B, $AB, $CF, $26, $48, $A9, $47 ; ならば⎵いやでも
#_0BD611: db $CF, $29, $26, $37, $26, $2A, $32, $37 ; ⎵おいていかせて
#_0BD619: db $48, $4D, $94 ; やる!
#_0BD61C: db $FC ; wait for key and new line
#_0BD61D: db $D6, $00, $00 ; delete sprite in slot 00
#_0BD620: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BD623: db $DE, $00, $00, $DD, $04 ; load 4x demon 00DD
#_0BD628: db $EB, $00, $00, $DE, $04 ; load 4x demon 00DE
#_0BD62D: db $D5, $39 ; send 39 to APU
#_0BD62F: db $E4, $00 ; load demon $00
#_0BD631: db $E4, $01 ; load demon $01
#_0BD633: db $E5, $81, $48 ; [COMMAND E5:81,48]

;===================================================================================================

Message_03_07_47:
#_0BD636: db $E5, $80, $48 ; [COMMAND E5:80,48]
#_0BD639: db $D3, $47 ; go to message 47

;===================================================================================================

Message_03_07_48:
#_0BD63B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD63D: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BD63F: db $DE, $00, $00, $C5, $04 ; load 4x demon 00C5
#_0BD644: db $EB, $00, $00, $C6, $04 ; load 4x demon 00C6
#_0BD649: db $D5, $39 ; send 39 to APU
#_0BD64B: db $E4, $00 ; load demon $00
#_0BD64D: db $E4, $01 ; load demon $01
#_0BD64F: db $E5, $81, $4A ; [COMMAND E5:81,4A]

;===================================================================================================

Message_03_07_49:
#_0BD652: db $E5, $80, $4A ; [COMMAND E5:80,4A]
#_0BD655: db $D3, $49 ; go to message 49

;===================================================================================================

Message_03_07_4A:
#_0BD657: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD659: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BD65B: db $DE, $00, $00, $D5, $04 ; load 4x demon 00D5
#_0BD660: db $EB, $00, $00, $CF, $04 ; load 4x demon 00CF
#_0BD665: db $D5, $39 ; send 39 to APU
#_0BD667: db $E4, $00 ; load demon $00
#_0BD669: db $E4, $01 ; load demon $01
#_0BD66B: db $E5, $81, $4C ; [COMMAND E5:81,4C]

;===================================================================================================

Message_03_07_4B:
#_0BD66E: db $E5, $80, $4C ; [COMMAND E5:80,4C]
#_0BD671: db $D3, $4B ; go to message 4B

;===================================================================================================

; «アクマつかい»:
; なんてやつ«・・・»わたしの まけだ«・・・»
; のこった ナカマは きさまのものだ
Message_03_07_4C:
#_0BD673: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD675: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BD677: db $FE, $07, $78 ; ext command 07: draw buffered text then wait 119 frames
#_0BD67A: db $D6, $00, $A4, $70, $28 ; place sprite A4 in slot 00 at XY:{70,28}
#_0BD67F: db $F2, $6D ; prewritten text 6D
#_0BD681: db $9A ; :
#_0BD682: db $F9 ; new line
#_0BD683: db $39, $52, $37, $48, $36 ; なんてやつ
#_0BD688: db $F2, $0B ; prewritten text 0B
#_0BD68A: db $50, $34, $30, $3D, $CF, $43, $2D, $A6 ; わたしの⎵まけだ
#_0BD692: db $F2, $0B ; prewritten text 0B
#_0BD694: db $F9 ; new line
#_0BD695: db $3D, $2E, $58, $34, $CF, $71, $62, $7B ; のこった⎵ナカマ
#_0BD69D: db $3E, $CF, $2B, $2F, $43, $3D, $47, $3D ; は⎵きさまのもの
#_0BD6A5: db $A6 ; だ
#_0BD6A6: db $FC ; wait for key and new line
#_0BD6A7: db $D0, $37 ; set progress bit 37
#_0BD6A9: db $D6, $00, $00 ; delete sprite in slot 00
#_0BD6AC: db $D3, $4E ; go to message 4E

;===================================================================================================

Message_03_07_4D:
#_0BD6AE: db $D2, $E1, $51 ; test progress bit E1 for message 51

;===================================================================================================

; >[DEMON1]が いる
; ナカマに しますか?
Message_03_07_4E:
#_0BD6B1: db $FE, $5F, $52 ; ext command 5F: 52 TODO
#_0BD6B4: db $E4, $00 ; load demon $00
#_0BD6B6: db $FA ; clear message box
#_0BD6B7: db $97 ; >
#_0BD6B8: db $F5 ; write demon name from $050A
#_0BD6B9: db $9C, $CF, $26, $4D ; が⎵いる
#_0BD6BD: db $F9 ; new line
#_0BD6BE: db $71, $62, $7B, $3A, $CF, $30, $43, $31 ; ナカマに⎵します
#_0BD6C6: db $2A, $95 ; か?
#_0BD6C8: db $F8, $4F ; YES/NO - go to message 4F if YES
#_0BD6CA: db $FF ; end of message

;===================================================================================================

; アクマ:
; わたしは [CLASS] [DEMON1]
; «こんごとも よろしく・・・»
; >[DEMON1]が «ナカマに くわわった»
Message_03_07_4F:
#_0BD6CB: db $FE, $09, $50 ; ext command 09: demon joins party or message 50 if full
#_0BD6CE: db $5D, $64, $7B, $9A ; アクマ:
#_0BD6D2: db $F9 ; new line
#_0BD6D3: db $50, $34, $30, $3E, $CF ; わたしは⎵
#_0BD6D8: db $F6 ; write class name from $0506
#_0BD6D9: db $CF ; ⎵
#_0BD6DA: db $F5 ; write demon name from $050A
#_0BD6DB: db $F9 ; new line
#_0BD6DC: db $F2, $41 ; prewritten text 41
#_0BD6DE: db $FC ; wait for key and new line
#_0BD6DF: db $FA ; clear message box
#_0BD6E0: db $97 ; >
#_0BD6E1: db $F5 ; write demon name from $050A
#_0BD6E2: db $9C, $CF ; が⎵
#_0BD6E4: db $F2, $2F ; prewritten text 2F
#_0BD6E6: db $FC ; wait for key and new line
#_0BD6E7: db $FE, $26, $04 ; ext command 26: something 04 TODO
#_0BD6EA: db $D0, $E1 ; set progress bit E1
#_0BD6EC: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BD6EE: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BD6F0: db $FF ; end of message

;===================================================================================================

; ナカマが いっぱいで [DEMON1]は
; くわえられない
Message_03_07_50:
#_0BD6F1: db $D4, $03 ; set text box size to 3
#_0BD6F3: db $71, $62, $7B, $9C, $CF, $26, $58, $B0 ; ナカマが⎵いっぱ
#_0BD6FB: db $26, $A9, $CF ; いで⎵
#_0BD6FE: db $F5 ; write demon name from $050A
#_0BD6FF: db $3E ; は
#_0BD700: db $F9 ; new line
#_0BD701: db $2C, $50, $28, $4B, $4E, $39, $26 ; くわえられない
#_0BD708: db $FC ; wait for key and new line
#_0BD709: db $FF ; end of message

;===================================================================================================

; «アクマつかい»:
; ほっといてくれ いまは ナカマを あつめるのに
; いそがしいんだ
; ほとんど きさまに やられたからな
Message_03_07_51:
#_0BD70A: db $D6, $00, $A4, $70, $28 ; place sprite A4 in slot 00 at XY:{70,28}
#_0BD70F: db $F2, $6D ; prewritten text 6D
#_0BD711: db $9A ; :
#_0BD712: db $F9 ; new line
#_0BD713: db $42, $58, $38, $26, $37, $2C, $4E, $CF ; ほっといてくれ⎵
#_0BD71B: db $26, $43, $3E, $CF, $71, $62, $7B, $51 ; いまは⎵ナカマを
#_0BD723: db $CF, $25, $36, $46, $4D, $3D, $3A ; ⎵あつめるのに
#_0BD72A: db $F9 ; new line
#_0BD72B: db $26, $33, $9C, $30, $26, $52, $A6 ; いそがしいんだ
#_0BD732: db $FC ; wait for key and new line
#_0BD733: db $FA ; clear message box
#_0BD734: db $42, $38, $52, $AA, $CF, $2B, $2F, $43 ; ほとんど⎵きさま
#_0BD73C: db $3A, $CF, $48, $4B, $4E, $34, $2A, $4B ; に⎵やられたから
#_0BD744: db $39 ; な
#_0BD745: db $FC ; wait for key and new line
#_0BD746: db $FF ; end of message

;===================================================================================================

; «・・・»だが ナカマは ぜんめつだ
; «マグネタイト»を やるから かんべんしてくれ
; >[LEADER]は 10000mag を
; «てにいれた»
Message_03_07_52:
#_0BD747: db $FA ; clear message box
#_0BD748: db $F2, $0B ; prewritten text 0B
#_0BD74A: db $A6, $9C, $CF, $71, $62, $7B, $3E, $CF ; だが⎵ナカマは⎵
#_0BD752: db $A4, $52, $46, $36, $A6 ; ぜんめつだ
#_0BD757: db $F9 ; new line
#_0BD758: db $F2, $05 ; prewritten text 05
#_0BD75A: db $51, $CF, $48, $4D, $2A, $4B, $CF, $2A ; を⎵やるから⎵か
#_0BD762: db $52, $AE, $52, $30, $37, $2C, $4E ; んべんしてくれ
#_0BD769: db $FC ; wait for key and new line
#_0BD76A: db $FA ; clear message box
#_0BD76B: db $97 ; >
#_0BD76C: db $F1 ; write leader's name for team
#_0BD76D: db $3E, $CF, $02, $01, $01, $01, $01 ; は⎵10000
#_0BD774: db $FE, $66 ; ext command 66: write MAG
#_0BD776: db $CF, $51 ; ⎵を
#_0BD778: db $F9 ; new line
#_0BD779: db $F2, $2D ; prewritten text 2D
#_0BD77B: db $DC, $10, $27, $00 ; give 10000 MAG
#_0BD77F: db $D0, $E1 ; set progress bit E1
#_0BD781: db $FC ; wait for key and new line
#_0BD782: db $FF ; end of message

;===================================================================================================

; おとこ:
; ここは «たちいりきんし»だ!
; れいのものを もっているか?
Message_03_08_00:
#_0BD783: db $D2, $2F, $12 ; test progress bit 2F for message 12
#_0BD786: db $D6, $00, $4A, $78, $28 ; place sprite 4A in slot 00 at XY:{78,28}
#_0BD78B: db $29, $38, $2E, $9A ; おとこ:
#_0BD78F: db $F9 ; new line
#_0BD790: db $D2, $0C, $07 ; test progress bit 0C for message 07
#_0BD793: db $D2, $20, $04 ; test progress bit 20 for message 04
#_0BD796: db $2E, $2E, $3E, $CF ; ここは⎵
#_0BD79A: db $F2, $0E ; prewritten text 0E
#_0BD79C: db $A6, $94 ; だ!
#_0BD79E: db $F9 ; new line
#_0BD79F: db $4E, $26, $3D, $47, $3D, $51, $CF, $47 ; れいのものを⎵も
#_0BD7A7: db $58, $37, $26, $4D, $2A, $95 ; っているか?
#_0BD7AD: db $F8, $03 ; YES/NO - go to message 03 if YES

;===================================================================================================

; «とおすわけには いかないな»
Message_03_08_01:
#_0BD7AF: db $D4, $03 ; set text box size to 3
#_0BD7B1: db $F2, $2B ; prewritten text 2B
#_0BD7B3: db $FC ; wait for key and new line
#_0BD7B4: db $FF ; end of message

;===================================================================================================

; もってないじゃん
; «とおすわけには いかないな»
; まさか ゴトウの まわしものか?
Message_03_08_02:
#_0BD7B5: db $FA ; clear message box
#_0BD7B6: db $47, $58, $37, $39, $26, $A2, $55, $52 ; もってないじゃん
#_0BD7BE: db $F9 ; new line
#_0BD7BF: db $F2, $2B ; prewritten text 2B
#_0BD7C1: db $FC ; wait for key and new line
#_0BD7C2: db $43, $2F, $2A, $CF, $B9, $70, $5F, $3D ; まさか⎵ゴトウの
#_0BD7CA: db $CF, $43, $50, $30, $47, $3D, $2A, $95 ; ⎵まわしものか?
#_0BD7D2: db $FC ; wait for key and new line
#_0BD7D3: db $FF ; end of message

;===================================================================================================

; みせてみろ
; «・・・»たしかに ほんものだ とおれよ
Message_03_08_03:
#_0BD7D4: db $DD, $F3, $02 ; go to message 02 if missing item F3
#_0BD7D7: db $D4, $03 ; set text box size to 3
#_0BD7D9: db $44, $32, $37, $44, $4F ; みせてみろ
#_0BD7DE: db $DF, $DF ; delay 7 frames [x2]
#_0BD7E0: db $F9 ; new line
#_0BD7E1: db $F2, $0B ; prewritten text 0B
#_0BD7E3: db $34, $30, $2A, $3A, $CF, $42, $52, $47 ; たしかに⎵ほんも
#_0BD7EB: db $3D, $A6, $CF, $38, $29, $4E, $4A ; のだ⎵とおれよ
#_0BD7F2: db $FC ; wait for key and new line
#_0BD7F3: db $D3, $06 ; go to message 06

;===================================================================================================

; [CHASE]さんですね どうぞ
Message_03_08_04:
#_0BD7F5: db $D2, $28, $05 ; test progress bit 28 for message 05
#_0BD7F8: db $F0 ; write player name
#_0BD7F9: db $2F, $52, $A9, $31, $3C, $CF, $AA, $27 ; さんですね⎵どう
#_0BD801: db $A5 ; ぞ
#_0BD802: db $FC ; wait for key and new line
#_0BD803: db $D3, $06 ; go to message 06

;===================================================================================================

; «リーダー»のことが しんぱいで
; おちつかないよ
Message_03_08_05:
#_0BD805: db $D2, $27, $09 ; test progress bit 27 for message 09
#_0BD808: db $F2, $16 ; prewritten text 16
#_0BD80A: db $3D, $2E, $38, $9C, $CF, $30, $52, $B0 ; のことが⎵しんぱ
#_0BD812: db $26, $A9 ; いで
#_0BD814: db $F9 ; new line
#_0BD815: db $29, $35, $36, $2A, $39, $26, $4A ; おちつかないよ
#_0BD81C: db $FC ; wait for key and new line
#_0BD81D: db $D2, $0C, $0A ; test progress bit 0C for message 0A

;===================================================================================================

Message_03_08_06:
#_0BD820: db $FE, $1A, $2E, $48, $06, $00, $04, $07 ; ext command 1A: 2E,48,06,00,04,07
#_0BD828: db $D0, $0C ; set progress bit 0C
#_0BD82A: db $FF ; end of message

;===================================================================================================

; ごくろうさまです
Message_03_08_07:
#_0BD82B: db $D2, $28, $08 ; test progress bit 28 for message 08
#_0BD82E: db $A0, $2C, $4F, $27, $2F, $43, $A9, $31 ; ごくろうさまです
#_0BD836: db $FC ; wait for key and new line
#_0BD837: db $D3, $0A ; go to message 0A

;===================================================================================================

; みんな «リーダー»を さがしにいって
; おれは るすばんさ
; «リーダー»の ゆくえが わかったら
; メンバーは れいの BARに あつまるはずだ
Message_03_08_08:
#_0BD839: db $D2, $27, $09 ; test progress bit 27 for message 09
#_0BD83C: db $44, $52, $39, $CF ; みんな⎵
#_0BD840: db $F2, $16 ; prewritten text 16
#_0BD842: db $51, $CF, $2F, $9C, $30, $3A, $26, $58 ; を⎵さがしにいっ
#_0BD84A: db $37 ; て
#_0BD84B: db $F9 ; new line
#_0BD84C: db $29, $4E, $3E, $CF, $4D, $31, $AB, $52 ; おれは⎵るすばん
#_0BD854: db $2F ; さ
#_0BD855: db $FC ; wait for key and new line
#_0BD856: db $FA ; clear message box
#_0BD857: db $F2, $16 ; prewritten text 16
#_0BD859: db $3D, $CF, $49, $2C, $28, $9C, $CF, $50 ; の⎵ゆくえが⎵わ
#_0BD861: db $2A, $58, $34, $4B ; かったら
#_0BD865: db $F9 ; new line
#_0BD866: db $7E, $8A, $C4, $5A, $3E, $CF, $4E, $26 ; メンバーは⎵れい
#_0BD86E: db $3D, $CF, $0C, $0B, $1C, $3A, $CF, $25 ; の⎵BARに⎵あ
#_0BD876: db $36, $43, $4D, $3E, $A3, $A6 ; つまるはずだ
#_0BD87C: db $FC ; wait for key and new line
#_0BD87D: db $D3, $0A ; go to message 0A

;===================================================================================================

; «リーダー»を たすけてくれて «ありがとう»
Message_03_08_09:
#_0BD87F: db $F2, $16 ; prewritten text 16
#_0BD881: db $51, $CF, $34, $31, $2D, $37, $2C, $4E ; を⎵たすけてくれ
#_0BD889: db $37, $CF ; て⎵
#_0BD88B: db $F2, $0D ; prewritten text 0D
#_0BD88D: db $FC ; wait for key and new line
#_0BD88E: db $D2, $0C, $0A ; test progress bit 0C for message 0A
#_0BD891: db $D3, $06 ; go to message 06

;===================================================================================================

Message_03_08_0A:
#_0BD893: db $D1, $0C ; clear progress bit 0C
#_0BD895: db $FE, $1A, $2C, $C8, $06, $00, $04, $07 ; ext command 1A: 2C,C8,06,00,04,07
#_0BD89D: db $FF ; end of message

;===================================================================================================

; «レジスタンス»のおとこ:
; よく アジトまで きたな
; [JIMMY]:
; あなたが «レジスタンス»の «リーダー»ですね?
; «レジスタンス»のおとこ:
; ちょっと まった!
; わたしは «リーダー»ではない
; «われわれ»の «リーダー»を ぶがいしゃに
; あわせるわけには いかないんだ
; «しょうじょ»のこえ:
; そのひとたちは だいじょうぶです
; わたしが ちょくせつ あいましょう
; «レジスタンス»のおとこ:
; いいんですか? «・・・»わかりました
; «リーダー»が おくにいる
; «しょうじょ»:
; よく いらっしゃいました
; [CHASE]さん«・・・»
; [JIMMY]さん«・・・»
; [HIM]さん«・・・»
; «あなたがた»が くるのを まっていました
; わたしが «レジスタンス»の «リーダー»
; [MOMO]です
; [JIMMY]:
; きみも [MOMO]と いうのか?
; «レジスタンス»の«リーダー» [MOMO]:
; «あなたがた»は
; わたしに みおぼえが あるはずです
; わたしは ゆめのなかで いけにえに
; されるところを «あなたがた»にたすけられました
; そして まっていたのです
; «あなたがた»が ほんとうに あらわれて
; たすけにきてくれるのを«・・・»«・・・»
; «あなたがた»に おはなしが あります«・・・»
; いま «トウキョウ»では ゴトウという おとこが
; アクマを よびだし そのちからを つかって
; みずからの おもいのままのせかいを
; つくろうと しています
; このままでは きょういになると
; おもった «アメリカ»たいしトールマンは
; ぐんを ひきいて じたいの ちんあつに
; のりだしたのです
; わたしたちでは ゴトウを そしすることも できず
; «アメリカ»ぐんを とめることも できません
; このままでは «トウキョウ»は
; かいめつ してしまいます
; «おねがいします» わたしたちに
; きょうりょく してください
; まず わたしと おなじなまえのせいで
; つかまってしまった ひとたちを たすけ«・・・»
; [JIMMY]:
; [MOMO]が どこに いるか
; しってるんですか!?
; [MOMO]:
; «・・・»«・・・»
; そして さいきん ゴトウの てさきとなって
; はたらいている オザワいちみの かいめつ«・・・»
; [HIM]:
; おいっ! いまなんて いった!?
; オザワって いったな!
; [MOMO]:
; «・・・»«・・・»
; «おねがいします» ちからを かしてください
; [JIMMY]:
; ぼくの ちからで よろしければ
; よろこんで かしましょう
; [HIM]:
; オザワの てきなら おれの みかただ
; てを かすぜ
Message_03_08_0B:
#_0BD89E: db $D2, $2F, $19 ; test progress bit 2F for message 19
#_0BD8A1: db $D5, $47 ; send 47 to APU
#_0BD8A3: db $D7, $05 ; load scene 05
#_0BD8A5: db $D2, $28, $11 ; test progress bit 28 for message 11
#_0BD8A8: db $D6, $00, $82, $70, $28 ; place sprite 82 in slot 00 at XY:{70,28}
#_0BD8AD: db $F2, $15 ; prewritten text 15
#_0BD8AF: db $3D, $29, $38, $2E, $9A ; のおとこ:
#_0BD8B4: db $F9 ; new line
#_0BD8B5: db $4A, $2C, $CF, $5D, $BB, $70, $43, $A9 ; よく⎵アジトまで
#_0BD8BD: db $CF, $2B, $34, $39 ; ⎵きたな
#_0BD8C1: db $FC ; wait for key and new line
#_0BD8C2: db $E9, $0C, $10 ; go to message 10 maybe TODO
#_0BD8C5: db $FA ; clear message box
#_0BD8C6: db $EE ; write lawful hero name
#_0BD8C7: db $9A ; :
#_0BD8C8: db $F9 ; new line
#_0BD8C9: db $25, $39, $34, $9C, $CF ; あなたが⎵
#_0BD8CE: db $F2, $15 ; prewritten text 15
#_0BD8D0: db $3D, $CF ; の⎵
#_0BD8D2: db $F2, $16 ; prewritten text 16
#_0BD8D4: db $A9, $31, $3C, $95 ; ですね?
#_0BD8D8: db $FC ; wait for key and new line
#_0BD8D9: db $FA ; clear message box
#_0BD8DA: db $F2, $15 ; prewritten text 15
#_0BD8DC: db $3D, $29, $38, $2E, $9A ; のおとこ:
#_0BD8E1: db $F9 ; new line
#_0BD8E2: db $35, $57, $58, $38, $CF, $43, $58, $34 ; ちょっと⎵まった
#_0BD8EA: db $94 ; !
#_0BD8EB: db $F9 ; new line
#_0BD8EC: db $50, $34, $30, $3E, $CF ; わたしは⎵
#_0BD8F1: db $F2, $16 ; prewritten text 16
#_0BD8F3: db $A9, $3E, $39, $26 ; ではない
#_0BD8F7: db $FC ; wait for key and new line
#_0BD8F8: db $FA ; clear message box
#_0BD8F9: db $F2, $02 ; prewritten text 02
#_0BD8FB: db $3D, $CF ; の⎵
#_0BD8FD: db $F2, $16 ; prewritten text 16
#_0BD8FF: db $51, $CF, $AD, $9C, $26, $30, $55, $3A ; を⎵ぶがいしゃに
#_0BD907: db $F9 ; new line
#_0BD908: db $25, $50, $32, $4D, $50, $2D, $3A, $3E ; あわせるわけには
#_0BD910: db $CF, $26, $2A, $39, $26, $52, $A6 ; ⎵いかないんだ
#_0BD917: db $FC ; wait for key and new line
#_0BD918: db $FA ; clear message box
#_0BD919: db $F2, $00 ; prewritten text 00
#_0BD91B: db $3D, $2E, $28, $9A ; のこえ:
#_0BD91F: db $F9 ; new line
#_0BD920: db $33, $3D, $3F, $38, $34, $35, $3E, $CF ; そのひとたちは⎵
#_0BD928: db $A6, $26, $A2, $57, $27, $AD, $A9, $31 ; だいじょうぶです
#_0BD930: db $F9 ; new line
#_0BD931: db $50, $34, $30, $9C, $CF, $35, $57, $2C ; わたしが⎵ちょく
#_0BD939: db $32, $36, $CF, $25, $26, $43, $30, $57 ; せつ⎵あいましょ
#_0BD941: db $27 ; う
#_0BD942: db $FC ; wait for key and new line
#_0BD943: db $FA ; clear message box
#_0BD944: db $F2, $15 ; prewritten text 15
#_0BD946: db $3D, $29, $38, $2E, $9A ; のおとこ:
#_0BD94B: db $F9 ; new line
#_0BD94C: db $26, $26, $52, $A9, $31, $2A, $95, $CF ; いいんですか?⎵
#_0BD954: db $F2, $0B ; prewritten text 0B
#_0BD956: db $50, $2A, $4C, $43, $30, $34 ; わかりました
#_0BD95C: db $F9 ; new line
#_0BD95D: db $F2, $16 ; prewritten text 16
#_0BD95F: db $9C, $CF, $29, $2C, $3A, $26, $4D ; が⎵おくにいる
#_0BD966: db $FC ; wait for key and new line
#_0BD967: db $D0, $20 ; set progress bit 20
#_0BD969: db $E1, $F3 ; set $0A50 to item F3
#_0BD96B: db $FE, $29 ; ext command 29: take item from $0A51 TODO
#_0BD96D: db $D6, $00, $00 ; delete sprite in slot 00
#_0BD970: db $FA ; clear message box
#_0BD971: db $D7, $05 ; load scene 05
#_0BD973: db $D6, $07, $4C, $78, $28 ; place sprite 4C in slot 07 at XY:{78,28}
#_0BD978: db $F2, $00 ; prewritten text 00
#_0BD97A: db $9A ; :
#_0BD97B: db $F9 ; new line
#_0BD97C: db $4A, $2C, $CF, $26, $4B, $58, $30, $55 ; よく⎵いらっしゃ
#_0BD984: db $26, $43, $30, $34 ; いました
#_0BD988: db $FC ; wait for key and new line
#_0BD989: db $F0 ; write player name
#_0BD98A: db $2F, $52 ; さん
#_0BD98C: db $F2, $0B ; prewritten text 0B
#_0BD98E: db $F9 ; new line
#_0BD98F: db $EE ; write lawful hero name
#_0BD990: db $2F, $52 ; さん
#_0BD992: db $F2, $0B ; prewritten text 0B
#_0BD994: db $F9 ; new line
#_0BD995: db $EF ; write chaos hero name
#_0BD996: db $2F, $52 ; さん
#_0BD998: db $F2, $0B ; prewritten text 0B
#_0BD99A: db $F9 ; new line
#_0BD99B: db $F2, $03 ; prewritten text 03
#_0BD99D: db $9C, $CF, $2C, $4D, $3D, $51, $CF, $43 ; が⎵くるのを⎵ま
#_0BD9A5: db $58, $37, $26, $43, $30, $34 ; っていました
#_0BD9AB: db $FC ; wait for key and new line
#_0BD9AC: db $FA ; clear message box
#_0BD9AD: db $50, $34, $30, $9C, $CF ; わたしが⎵
#_0BD9B2: db $F2, $15 ; prewritten text 15
#_0BD9B4: db $3D, $CF ; の⎵
#_0BD9B6: db $F2, $16 ; prewritten text 16
#_0BD9B8: db $F9 ; new line
#_0BD9B9: db $ED ; write female protag name
#_0BD9BA: db $A9, $31 ; です
#_0BD9BC: db $FC ; wait for key and new line
#_0BD9BD: db $D4, $03 ; set text box size to 3
#_0BD9BF: db $EE ; write lawful hero name
#_0BD9C0: db $9A ; :
#_0BD9C1: db $F9 ; new line
#_0BD9C2: db $2B, $44, $47, $CF ; きみも⎵
#_0BD9C6: db $ED ; write female protag name
#_0BD9C7: db $38, $CF, $26, $27, $3D, $2A, $95 ; と⎵いうのか?
#_0BD9CE: db $FC ; wait for key and new line
#_0BD9CF: db $FA ; clear message box
#_0BD9D0: db $F2, $15 ; prewritten text 15
#_0BD9D2: db $3D ; の
#_0BD9D3: db $F2, $16 ; prewritten text 16
#_0BD9D5: db $CF ; ⎵
#_0BD9D6: db $ED ; write female protag name
#_0BD9D7: db $9A ; :
#_0BD9D8: db $F9 ; new line
#_0BD9D9: db $F2, $03 ; prewritten text 03
#_0BD9DB: db $3E ; は
#_0BD9DC: db $F9 ; new line
#_0BD9DD: db $50, $34, $30, $3A, $CF, $44, $29, $AF ; わたしに⎵みおぼ
#_0BD9E5: db $28, $9C, $CF, $25, $4D, $3E, $A3, $A9 ; えが⎵あるはずで
#_0BD9ED: db $31 ; す
#_0BD9EE: db $FC ; wait for key and new line
#_0BD9EF: db $FA ; clear message box
#_0BD9F0: db $50, $34, $30, $3E, $CF, $49, $46, $3D ; わたしは⎵ゆめの
#_0BD9F8: db $39, $2A, $A9, $CF, $26, $2D, $3A, $28 ; なかで⎵いけにえ
#_0BDA00: db $3A ; に
#_0BDA01: db $F9 ; new line
#_0BDA02: db $2F, $4E, $4D, $38, $2E, $4F, $51, $CF ; されるところを⎵
#_0BDA0A: db $F2, $03 ; prewritten text 03
#_0BDA0C: db $3A, $34, $31, $2D, $4B, $4E, $43, $30 ; にたすけられまし
#_0BDA14: db $34 ; た
#_0BDA15: db $FC ; wait for key and new line
#_0BDA16: db $FA ; clear message box
#_0BDA17: db $33, $30, $37, $CF, $43, $58, $37, $26 ; そして⎵まってい
#_0BDA1F: db $34, $3D, $A9, $31 ; たのです
#_0BDA23: db $F9 ; new line
#_0BDA24: db $F2, $03 ; prewritten text 03
#_0BDA26: db $9C, $CF, $42, $52, $38, $27, $3A, $CF ; が⎵ほんとうに⎵
#_0BDA2E: db $25, $4B, $50, $4E, $37 ; あらわれて
#_0BDA33: db $F9 ; new line
#_0BDA34: db $34, $31, $2D, $3A, $2B, $37, $2C, $4E ; たすけにきてくれ
#_0BDA3C: db $4D, $3D, $51 ; るのを
#_0BDA3F: db $F2, $0B ; prewritten text 0B
#_0BDA41: db $F2, $0B ; prewritten text 0B
#_0BDA43: db $FC ; wait for key and new line
#_0BDA44: db $FA ; clear message box
#_0BDA45: db $F2, $03 ; prewritten text 03
#_0BDA47: db $3A, $CF, $29, $3E, $39, $30, $9C, $CF ; に⎵おはなしが⎵
#_0BDA4F: db $25, $4C, $43, $31 ; あります
#_0BDA53: db $F2, $0B ; prewritten text 0B
#_0BDA55: db $F9 ; new line
#_0BDA56: db $26, $43, $CF ; いま⎵
#_0BDA59: db $F2, $1C ; prewritten text 1C
#_0BDA5B: db $A9, $3E, $CF, $B9, $70, $5F, $38, $26 ; では⎵ゴトウとい
#_0BDA63: db $27, $CF, $29, $38, $2E, $9C ; う⎵おとこが
#_0BDA69: db $F9 ; new line
#_0BDA6A: db $5D, $64, $7B, $51, $CF, $4A, $AC, $A6 ; アクマを⎵よびだ
#_0BDA72: db $30, $CF, $33, $3D, $35, $2A, $4B, $51 ; し⎵そのちからを
#_0BDA7A: db $CF, $36, $2A, $58, $37 ; ⎵つかって
#_0BDA7F: db $F9 ; new line
#_0BDA80: db $44, $A3, $2A, $4B, $3D, $CF, $29, $47 ; みずからの⎵おも
#_0BDA88: db $26, $3D, $43, $43, $3D, $32, $2A, $26 ; いのままのせかい
#_0BDA90: db $51 ; を
#_0BDA91: db $F9 ; new line
#_0BDA92: db $36, $2C, $4F, $27, $38, $CF, $30, $37 ; つくろうと⎵して
#_0BDA9A: db $26, $43, $31 ; います
#_0BDA9D: db $FC ; wait for key and new line
#_0BDA9E: db $FA ; clear message box
#_0BDA9F: db $2E, $3D, $43, $43, $A9, $3E, $CF, $2B ; このままでは⎵き
#_0BDAA7: db $57, $27, $26, $3A, $39, $4D, $38 ; ょういになると
#_0BDAAE: db $F9 ; new line
#_0BDAAF: db $29, $47, $58, $34, $CF ; おもった⎵
#_0BDAB4: db $F2, $1B ; prewritten text 1B
#_0BDAB6: db $34, $26, $30, $70, $5A, $85, $7B, $8A ; たいしトールマン
#_0BDABE: db $3E ; は
#_0BDABF: db $F9 ; new line
#_0BDAC0: db $9E, $52, $51, $CF, $3F, $2B, $26, $37 ; ぐんを⎵ひきいて
#_0BDAC8: db $CF, $A2, $34, $26, $3D, $CF, $35, $52 ; ⎵じたいの⎵ちん
#_0BDAD0: db $25, $36, $3A ; あつに
#_0BDAD3: db $F9 ; new line
#_0BDAD4: db $3D, $4C, $A6, $30, $34, $3D, $A9, $31 ; のりだしたのです
#_0BDADC: db $FC ; wait for key and new line
#_0BDADD: db $FA ; clear message box
#_0BDADE: db $50, $34, $30, $34, $35, $A9, $3E, $CF ; わたしたちでは⎵
#_0BDAE6: db $B9, $70, $5F, $51, $CF, $33, $30, $31 ; ゴトウを⎵そしす
#_0BDAEE: db $4D, $2E, $38, $47, $CF, $A9, $2B, $A3 ; ることも⎵できず
#_0BDAF6: db $F9 ; new line
#_0BDAF7: db $F2, $1B ; prewritten text 1B
#_0BDAF9: db $9E, $52, $51, $CF, $38, $46, $4D, $2E ; ぐんを⎵とめるこ
#_0BDB01: db $38, $47, $CF, $A9, $2B, $43, $32, $52 ; とも⎵できません
#_0BDB09: db $F9 ; new line
#_0BDB0A: db $2E, $3D, $43, $43, $A9, $3E, $CF ; このままでは⎵
#_0BDB11: db $F2, $1C ; prewritten text 1C
#_0BDB13: db $3E ; は
#_0BDB14: db $F9 ; new line
#_0BDB15: db $2A, $26, $46, $36, $CF, $30, $37, $30 ; かいめつ⎵してし
#_0BDB1D: db $43, $26, $43, $31 ; まいます
#_0BDB21: db $F9 ; new line
#_0BDB22: db $F2, $4A ; prewritten text 4A
#_0BDB24: db $CF, $50, $34, $30, $34, $35, $3A ; ⎵わたしたちに
#_0BDB2B: db $F9 ; new line
#_0BDB2C: db $2B, $57, $27, $4C, $57, $2C, $CF, $30 ; きょうりょく⎵し
#_0BDB34: db $37, $2C, $A6, $2F, $26 ; てください
#_0BDB39: db $FC ; wait for key and new line
#_0BDB3A: db $FA ; clear message box
#_0BDB3B: db $43, $A3, $CF, $50, $34, $30, $38, $CF ; まず⎵わたしと⎵
#_0BDB43: db $29, $39, $A2, $39, $43, $28, $3D, $32 ; おなじなまえのせ
#_0BDB4B: db $26, $A9 ; いで
#_0BDB4D: db $F9 ; new line
#_0BDB4E: db $36, $2A, $43, $58, $37, $30, $43, $58 ; つかまってしまっ
#_0BDB56: db $34, $CF, $3F, $38, $34, $35, $51, $CF ; た⎵ひとたちを⎵
#_0BDB5E: db $34, $31, $2D ; たすけ
#_0BDB61: db $F2, $0B ; prewritten text 0B
#_0BDB63: db $FC ; wait for key and new line
#_0BDB64: db $D4, $03 ; set text box size to 3
#_0BDB66: db $EE ; write lawful hero name
#_0BDB67: db $9A ; :
#_0BDB68: db $F9 ; new line
#_0BDB69: db $ED ; write female protag name
#_0BDB6A: db $9C, $CF, $AA, $2E, $3A, $CF, $26, $4D ; が⎵どこに⎵いる
#_0BDB72: db $2A ; か
#_0BDB73: db $F9 ; new line
#_0BDB74: db $30, $58, $37, $4D, $52, $A9, $31, $2A ; しってるんですか
#_0BDB7C: db $94, $95 ; !?
#_0BDB7E: db $FC ; wait for key and new line
#_0BDB7F: db $FA ; clear message box
#_0BDB80: db $ED ; write female protag name
#_0BDB81: db $9A ; :
#_0BDB82: db $F9 ; new line
#_0BDB83: db $F2, $0B ; prewritten text 0B
#_0BDB85: db $F2, $0B ; prewritten text 0B
#_0BDB87: db $F9 ; new line
#_0BDB88: db $33, $30, $37, $CF, $2F, $26, $2B, $52 ; そして⎵さいきん
#_0BDB90: db $CF, $B9, $70, $5F, $3D, $CF, $37, $2F ; ⎵ゴトウの⎵てさ
#_0BDB98: db $2B, $38, $39, $58, $37 ; きとなって
#_0BDB9D: db $F9 ; new line
#_0BDB9E: db $3E, $34, $4B, $26, $37, $26, $4D, $CF ; はたらいている⎵
#_0BDBA6: db $61, $BA, $88, $26, $35, $44, $3D, $CF ; オザワいちみの⎵
#_0BDBAE: db $2A, $26, $46, $36 ; かいめつ
#_0BDBB2: db $F2, $0B ; prewritten text 0B
#_0BDBB4: db $FC ; wait for key and new line
#_0BDBB5: db $D4, $03 ; set text box size to 3
#_0BDBB7: db $EF ; write chaos hero name
#_0BDBB8: db $9A ; :
#_0BDBB9: db $F9 ; new line
#_0BDBBA: db $29, $26, $58, $94, $CF, $26, $43, $39 ; おいっ!⎵いまな
#_0BDBC2: db $52, $37, $CF, $26, $58, $34, $94, $95 ; んて⎵いった!?
#_0BDBCA: db $FC ; wait for key and new line
#_0BDBCB: db $61, $BA, $88, $58, $37, $CF, $26, $58 ; オザワって⎵いっ
#_0BDBD3: db $34, $39, $94 ; たな!
#_0BDBD6: db $FC ; wait for key and new line
#_0BDBD7: db $FA ; clear message box
#_0BDBD8: db $ED ; write female protag name
#_0BDBD9: db $9A ; :
#_0BDBDA: db $F9 ; new line
#_0BDBDB: db $F2, $0B ; prewritten text 0B
#_0BDBDD: db $F2, $0B ; prewritten text 0B
#_0BDBDF: db $F9 ; new line
#_0BDBE0: db $F2, $4A ; prewritten text 4A
#_0BDBE2: db $CF, $35, $2A, $4B, $51, $CF, $2A, $30 ; ⎵ちからを⎵かし
#_0BDBEA: db $37, $2C, $A6, $2F, $26 ; てください
#_0BDBEF: db $FC ; wait for key and new line
#_0BDBF0: db $FA ; clear message box
#_0BDBF1: db $EE ; write lawful hero name
#_0BDBF2: db $9A ; :
#_0BDBF3: db $F9 ; new line
#_0BDBF4: db $AF, $2C, $3D, $CF, $35, $2A, $4B, $A9 ; ぼくの⎵ちからで
#_0BDBFC: db $CF, $4A, $4F, $30, $2D, $4E, $AB ; ⎵よろしければ
#_0BDC03: db $F9 ; new line
#_0BDC04: db $4A, $4F, $2E, $52, $A9, $CF, $2A, $30 ; よろこんで⎵かし
#_0BDC0C: db $43, $30, $57, $27 ; ましょう
#_0BDC10: db $FC ; wait for key and new line
#_0BDC11: db $FA ; clear message box
#_0BDC12: db $EF ; write chaos hero name
#_0BDC13: db $9A ; :
#_0BDC14: db $F9 ; new line
#_0BDC15: db $61, $BA, $88, $3D, $CF, $37, $2B, $39 ; オザワの⎵てきな
#_0BDC1D: db $4B, $CF, $29, $4E, $3D, $CF, $44, $2A ; ら⎵おれの⎵みか
#_0BDC25: db $34, $A6 ; ただ
#_0BDC27: db $F9 ; new line
#_0BDC28: db $37, $51, $CF, $2A, $31, $A4 ; てを⎵かすぜ
#_0BDC2E: db $FC ; wait for key and new line

;===================================================================================================

; >«レジスタンス»の«リーダー» [MOMO]に
; ちからを かしますか?
; [JIMMY]:
; [CHASE]くん
; だまって みてるばあいじゃないですよ
; [HIM]:
; そうだ そうだ
; ゆめじゃ かのじょを たすけたじゃないか
Message_03_08_0C:
#_0BDC2F: db $FA ; clear message box
#_0BDC30: db $97 ; >
#_0BDC31: db $F2, $15 ; prewritten text 15
#_0BDC33: db $3D ; の
#_0BDC34: db $F2, $16 ; prewritten text 16
#_0BDC36: db $CF ; ⎵
#_0BDC37: db $ED ; write female protag name
#_0BDC38: db $3A ; に
#_0BDC39: db $F9 ; new line
#_0BDC3A: db $35, $2A, $4B, $51, $CF, $2A, $30, $43 ; ちからを⎵かしま
#_0BDC42: db $31, $2A, $95 ; すか?
#_0BDC45: db $F8, $0D ; YES/NO - go to message 0D if YES
#_0BDC47: db $D4, $03 ; set text box size to 3
#_0BDC49: db $EE ; write lawful hero name
#_0BDC4A: db $9A ; :
#_0BDC4B: db $F9 ; new line
#_0BDC4C: db $F0 ; write player name
#_0BDC4D: db $2C, $52 ; くん
#_0BDC4F: db $F9 ; new line
#_0BDC50: db $A6, $43, $58, $37, $CF, $44, $37, $4D ; だまって⎵みてる
#_0BDC58: db $AB, $25, $26, $A2, $55, $39, $26, $A9 ; ばあいじゃないで
#_0BDC60: db $31, $4A ; すよ
#_0BDC62: db $FC ; wait for key and new line
#_0BDC63: db $FA ; clear message box
#_0BDC64: db $EF ; write chaos hero name
#_0BDC65: db $9A ; :
#_0BDC66: db $F9 ; new line
#_0BDC67: db $33, $27, $A6, $CF, $33, $27, $A6 ; そうだ⎵そうだ
#_0BDC6E: db $F9 ; new line
#_0BDC6F: db $49, $46, $A2, $55, $CF, $2A, $3D, $A2 ; ゆめじゃ⎵かのじ
#_0BDC77: db $57, $51, $CF, $34, $31, $2D, $34, $A2 ; ょを⎵たすけたじ
#_0BDC7F: db $55, $39, $26, $2A ; ゃないか
#_0BDC83: db $FC ; wait for key and new line
#_0BDC84: db $D3, $0C ; go to message 0C

;===================================================================================================

; [MOMO]:
; «ありがとう»ございます
; おんなのこえ:
; «ウフフフフ» こんなところに いたとはね
Message_03_08_0D:
#_0BDC86: db $D4, $03 ; set text box size to 3
#_0BDC88: db $ED ; write female protag name
#_0BDC89: db $9A ; :
#_0BDC8A: db $F9 ; new line
#_0BDC8B: db $F2, $0D ; prewritten text 0D
#_0BDC8D: db $A0, $A1, $26, $43, $31 ; ございます
#_0BDC92: db $FC ; wait for key and new line
#_0BDC93: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BDC96: db $FA ; clear message box
#_0BDC97: db $29, $52, $39, $3D, $2E, $28, $9A ; おんなのこえ:
#_0BDC9E: db $F9 ; new line
#_0BDC9F: db $F2, $1D ; prewritten text 1D
#_0BDCA1: db $CF, $2E, $52, $39, $38, $2E, $4F, $3A ; ⎵こんなところに
#_0BDCA9: db $CF, $26, $34, $38, $3E, $3C ; ⎵いたとはね
#_0BDCAF: db $FC ; wait for key and new line

;===================================================================================================

; ゆりこ:
; やっと ほんものの [MOMO]を
; みつけたわ!!
Message_03_08_0E:
#_0BDCB0: db $FE, $07, $20 ; ext command 07: draw buffered text then wait 31 frames
#_0BDCB3: db $D6, $00, $98, $50, $18 ; place sprite 98 in slot 00 at XY:{50,18}
#_0BDCB8: db $FE, $07, $10 ; ext command 07: draw buffered text then wait 15 frames
#_0BDCBB: db $D6, $07, $00 ; delete sprite in slot 07
#_0BDCBE: db $D6, $07, $30, $70, $28 ; place sprite 30 in slot 07 at XY:{70,28}
#_0BDCC3: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BDCC6: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BDCC9: db $D6, $07, $30, $70, $28 ; place sprite 30 in slot 07 at XY:{70,28}
#_0BDCCE: db $FA ; clear message box
#_0BDCCF: db $D5, $3C ; send 3C to APU
#_0BDCD1: db $49, $4C, $2E, $9A ; ゆりこ:
#_0BDCD5: db $F9 ; new line
#_0BDCD6: db $48, $58, $38, $CF, $42, $52, $47, $3D ; やっと⎵ほんもの
#_0BDCDE: db $3D, $CF ; の⎵
#_0BDCE0: db $ED ; write female protag name
#_0BDCE1: db $51 ; を
#_0BDCE2: db $F9 ; new line
#_0BDCE3: db $44, $36, $2D, $34, $50, $94, $94 ; みつけたわ!!
#_0BDCEA: db $FC ; wait for key and new line

;===================================================================================================

; [MOMO]は
; オザワのところに つれていくわ«・・・»
; «レジスタンス»のおとこ:
; どうした! なにが あったんだ«・・・»
; なに!? «リーダー»が さらわれた!
; «・・・»なんてこった
; ぐずぐずしてる ひまはない
; «われわれ»は «リーダー»を たすけにいくぞ!
; >«レジスタンス»の メンバーは でていった
Message_03_08_0F:
#_0BDCEB: db $D4, $03 ; set text box size to 3
#_0BDCED: db $ED ; write female protag name
#_0BDCEE: db $3E ; は
#_0BDCEF: db $F9 ; new line
#_0BDCF0: db $61, $BA, $88, $3D, $38, $2E, $4F, $3A ; オザワのところに
#_0BDCF8: db $CF, $36, $4E, $37, $26, $2C, $50 ; ⎵つれていくわ
#_0BDCFF: db $F2, $0B ; prewritten text 0B
#_0BDD01: db $FC ; wait for key and new line
#_0BDD02: db $FE, $46, $09 ; ext command 46: 09 TODO
#_0BDD05: db $FE, $07, $06 ; ext command 07: draw buffered text then wait 5 frames
#_0BDD08: db $D6, $07, $9E, $78, $20 ; place sprite 9E in slot 07 at XY:{78,20}
#_0BDD0D: db $FE, $07, $09 ; ext command 07: draw buffered text then wait 8 frames
#_0BDD10: db $D6, $07, $00 ; delete sprite in slot 07
#_0BDD13: db $D0, $28 ; set progress bit 28
#_0BDD15: db $FA ; clear message box
#_0BDD16: db $FE, $07, $3C ; ext command 07: draw buffered text then wait 59 frames
#_0BDD19: db $D6, $00, $82, $70, $28 ; place sprite 82 in slot 00 at XY:{70,28}
#_0BDD1E: db $F2, $15 ; prewritten text 15
#_0BDD20: db $3D, $29, $38, $2E, $9A ; のおとこ:
#_0BDD25: db $F9 ; new line
#_0BDD26: db $AA, $27, $30, $34, $94, $CF, $39, $3A ; どうした!⎵なに
#_0BDD2E: db $9C, $CF, $25, $58, $34, $52, $A6 ; が⎵あったんだ
#_0BDD35: db $F2, $0B ; prewritten text 0B
#_0BDD37: db $FC ; wait for key and new line
#_0BDD38: db $39, $3A, $94, $95, $CF ; なに!?⎵
#_0BDD3D: db $F2, $16 ; prewritten text 16
#_0BDD3F: db $9C, $CF, $2F, $4B, $50, $4E, $34, $94 ; が⎵さらわれた!
#_0BDD47: db $FC ; wait for key and new line
#_0BDD48: db $FA ; clear message box
#_0BDD49: db $F2, $0B ; prewritten text 0B
#_0BDD4B: db $39, $52, $37, $2E, $58, $34 ; なんてこった
#_0BDD51: db $F9 ; new line
#_0BDD52: db $9E, $A3, $9E, $A3, $30, $37, $4D, $CF ; ぐずぐずしてる⎵
#_0BDD5A: db $3F, $43, $3E, $39, $26 ; ひまはない
#_0BDD5F: db $F9 ; new line
#_0BDD60: db $F2, $02 ; prewritten text 02
#_0BDD62: db $3E, $CF ; は⎵
#_0BDD64: db $F2, $16 ; prewritten text 16
#_0BDD66: db $51, $CF, $34, $31, $2D, $3A, $26, $2C ; を⎵たすけにいく
#_0BDD6E: db $A5, $94 ; ぞ!
#_0BDD70: db $FC ; wait for key and new line
#_0BDD71: db $D6, $00, $00 ; delete sprite in slot 00
#_0BDD74: db $FA ; clear message box
#_0BDD75: db $97 ; >
#_0BDD76: db $F2, $15 ; prewritten text 15
#_0BDD78: db $3D, $CF, $7E, $8A, $C4, $5A, $3E, $CF ; の⎵メンバーは⎵
#_0BDD80: db $A9, $37, $26, $58, $34 ; でていった
#_0BDD85: db $FC ; wait for key and new line
#_0BDD86: db $FF ; end of message

;===================================================================================================

; ひどく やられてる じゃないか
; すぐに てあてしてくるんだ
Message_03_08_10:
#_0BDD87: db $FA ; clear message box
#_0BDD88: db $3F, $AA, $2C, $CF, $48, $4B, $4E, $37 ; ひどく⎵やられて
#_0BDD90: db $4D, $CF, $A2, $55, $39, $26, $2A ; る⎵じゃないか
#_0BDD97: db $F9 ; new line
#_0BDD98: db $31, $9E, $3A, $CF, $37, $25, $37, $30 ; すぐに⎵てあてし
#_0BDDA0: db $37, $2C, $4D, $52, $A6 ; てくるんだ
#_0BDDA5: db $FC ; wait for key and new line
#_0BDDA6: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_08_11:
#_0BDDA7: db $97 ; >
#_0BDDA8: db $F2, $2C ; prewritten text 2C
#_0BDDAA: db $FC ; wait for key and new line
#_0BDDAB: db $FF ; end of message

;===================================================================================================

; [DEMON1]:
; なんの ようだ?
; いのちが おしけりゃ くるな!
; それとも オザワのやつの つかいか?
; なら おれさまの きが かわらんうちに
; かえれ!
Message_03_08_12:
#_0BDDAC: db $D2, $4C, $15 ; test progress bit 4C for message 15
#_0BDDAF: db $DE, $00, $00, $D8, $01 ; load 1x demon 00D8
#_0BDDB4: db $E4, $00 ; load demon $00
#_0BDDB6: db $F5 ; write demon name from $050A
#_0BDDB7: db $9A ; :
#_0BDDB8: db $F9 ; new line
#_0BDDB9: db $39, $52, $3D, $CF, $4A, $27, $A6, $95 ; なんの⎵ようだ?
#_0BDDC1: db $F9 ; new line
#_0BDDC2: db $26, $3D, $35, $9C, $CF, $29, $30, $2D ; いのちが⎵おしけ
#_0BDDCA: db $4C, $55, $CF, $2C, $4D, $39, $94 ; りゃ⎵くるな!
#_0BDDD1: db $FC ; wait for key and new line
#_0BDDD2: db $FA ; clear message box
#_0BDDD3: db $33, $4E, $38, $47, $CF, $61, $BA, $88 ; それとも⎵オザワ
#_0BDDDB: db $3D, $48, $36, $3D, $CF, $36, $2A, $26 ; のやつの⎵つかい
#_0BDDE3: db $2A, $95 ; か?
#_0BDDE5: db $F8, $13 ; YES/NO - go to message 13 if YES
#_0BDDE7: db $D4, $03 ; set text box size to 3
#_0BDDE9: db $39, $4B, $CF, $29, $4E, $2F, $43, $3D ; なら⎵おれさまの
#_0BDDF1: db $CF, $2B, $9C, $CF, $2A, $50, $4B, $52 ; ⎵きが⎵かわらん
#_0BDDF9: db $27, $35, $3A ; うちに
#_0BDDFC: db $F9 ; new line
#_0BDDFD: db $2A, $28, $4E, $94 ; かえれ!
#_0BDE01: db $FC ; wait for key and new line
#_0BDE02: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BDE04: db $FF ; end of message

;===================================================================================================

; オザワが じぶんで こなけりゃ
; ここを «とおすわけには いかないな»!
Message_03_08_13:
#_0BDE05: db $D4, $03 ; set text box size to 3
#_0BDE07: db $61, $BA, $88, $9C, $CF, $A2, $AD, $52 ; オザワが⎵じぶん
#_0BDE0F: db $A9, $CF, $2E, $39, $2D, $4C, $55 ; で⎵こなけりゃ
#_0BDE16: db $F9 ; new line
#_0BDE17: db $2E, $2E, $51, $CF ; ここを⎵
#_0BDE1B: db $F2, $2B ; prewritten text 2B
#_0BDE1D: db $94 ; !
#_0BDE1E: db $D5, $39 ; send 39 to APU
#_0BDE20: db $FC ; wait for key and new line
#_0BDE21: db $E5, $01, $15 ; [COMMAND E5:01,15]

;===================================================================================================

Message_03_08_14:
#_0BDE24: db $E5, $00, $15 ; [COMMAND E5:00,15]
#_0BDE27: db $D3, $14 ; go to message 14

;===================================================================================================

; >おくへ はいりますか?
Message_03_08_15:
#_0BDE29: db $D0, $4C ; set progress bit 4C
#_0BDE2B: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BDE2D: db $D2, $0C, $17 ; test progress bit 0C for message 17
#_0BDE30: db $FA ; clear message box
#_0BDE31: db $97, $29, $2C, $41, $CF, $3E, $26, $4C ; >おくへ⎵はいり
#_0BDE39: db $43, $31, $2A, $95 ; ますか?
#_0BDE3D: db $F8, $16 ; YES/NO - go to message 16 if YES
#_0BDE3F: db $FF ; end of message

;===================================================================================================

Message_03_08_16:
#_0BDE40: db $D0, $0C ; set progress bit 0C
#_0BDE42: db $FE, $1A, $2E, $48, $06, $00, $07, $0E ; ext command 1A: 2E,48,06,00,07,0E
#_0BDE4A: db $FF ; end of message

;===================================================================================================

; >そとに でますか?
Message_03_08_17:
#_0BDE4B: db $FA ; clear message box
#_0BDE4C: db $97, $33, $38, $3A, $CF, $A9, $43, $31 ; >そとに⎵でます
#_0BDE54: db $2A, $95 ; か?
#_0BDE56: db $F8, $18 ; YES/NO - go to message 18 if YES
#_0BDE58: db $FF ; end of message

;===================================================================================================

Message_03_08_18:
#_0BDE59: db $D1, $0C ; clear progress bit 0C
#_0BDE5B: db $FE, $1A, $2C, $C8, $06, $00, $07, $0E ; ext command 1A: 2C,C8,06,00,07,0E
#_0BDE63: db $FF ; end of message

;===================================================================================================

; おとこ:
; きみたちは だれだ?
; おれは オザワにつかわれる あわれな おとこ
; オザワは じぶんに したがわぬものを つかまえ
; «せいしんの なか»を いじって せんのうする
; おれは そのための どうぐ «サイコダイバー»だ
; ちょうのうりょくを もったばっかりに
; くるひも くるひも ひとの«せいしんの なか»に
; むりやり はいりこみ
; そうで なけりゃ ろうやのなか
; だが
; アクマと てをむすんだ オザワには さからえん
; ああ おれは もういやだ«・・・»«・・・»
; フフフ つまらんグチを きかせたな
; «・・・»ん? [CHASE]くん
Message_03_08_19:
#_0BDE64: db $D7, $A4, $33 ; load scenes A4 and 33
#_0BDE67: db $D2, $46, $20 ; test progress bit 46 for message 20
#_0BDE6A: db $D5, $46 ; send 46 to APU
#_0BDE6C: db $D6, $00, $B1, $70, $38 ; place sprite B1 in slot 00 at XY:{70,38}
#_0BDE71: db $D2, $4E, $1B ; test progress bit 4E for message 1B
#_0BDE74: db $29, $38, $2E, $9A ; おとこ:
#_0BDE78: db $F9 ; new line
#_0BDE79: db $2B, $44, $34, $35, $3E, $CF, $A6, $4E ; きみたちは⎵だれ
#_0BDE81: db $A6, $95 ; だ?
#_0BDE83: db $DF, $DF ; delay 7 frames [x2]
#_0BDE85: db $F9 ; new line
#_0BDE86: db $29, $4E, $3E, $CF, $61, $BA, $88, $3A ; おれは⎵オザワに
#_0BDE8E: db $36, $2A, $50, $4E, $4D, $CF, $25, $50 ; つかわれる⎵あわ
#_0BDE96: db $4E, $39, $CF, $29, $38, $2E ; れな⎵おとこ
#_0BDE9C: db $FC ; wait for key and new line
#_0BDE9D: db $FA ; clear message box
#_0BDE9E: db $61, $BA, $88, $3E, $CF, $A2, $AD, $52 ; オザワは⎵じぶん
#_0BDEA6: db $3A, $CF, $30, $34, $9C, $50, $3B, $47 ; に⎵したがわぬも
#_0BDEAE: db $3D, $51, $CF, $36, $2A, $43, $28 ; のを⎵つかまえ
#_0BDEB5: db $F9 ; new line
#_0BDEB6: db $F2, $71 ; prewritten text 71
#_0BDEB8: db $51, $CF, $26, $A2, $58, $37, $CF, $32 ; を⎵いじって⎵せ
#_0BDEC0: db $52, $3D, $27, $31, $4D ; んのうする
#_0BDEC5: db $F9 ; new line
#_0BDEC6: db $29, $4E, $3E, $CF, $33, $3D, $34, $46 ; おれは⎵そのため
#_0BDECE: db $3D, $CF, $AA, $27, $9E, $CF ; の⎵どうぐ⎵
#_0BDED4: db $F2, $46 ; prewritten text 46
#_0BDED6: db $A6 ; だ
#_0BDED7: db $FC ; wait for key and new line
#_0BDED8: db $FA ; clear message box
#_0BDED9: db $35, $57, $27, $3D, $27, $4C, $57, $2C ; ちょうのうりょく
#_0BDEE1: db $51, $CF, $47, $58, $34, $AB, $58, $2A ; を⎵もったばっか
#_0BDEE9: db $4C, $3A ; りに
#_0BDEEB: db $F9 ; new line
#_0BDEEC: db $2C, $4D, $3F, $47, $CF, $2C, $4D, $3F ; くるひも⎵くるひ
#_0BDEF4: db $47, $CF, $3F, $38, $3D ; も⎵ひとの
#_0BDEF9: db $F2, $71 ; prewritten text 71
#_0BDEFB: db $3A ; に
#_0BDEFC: db $F9 ; new line
#_0BDEFD: db $45, $4C, $48, $4C, $CF, $3E, $26, $4C ; むりやり⎵はいり
#_0BDF05: db $2E, $44 ; こみ
#_0BDF07: db $F9 ; new line
#_0BDF08: db $33, $27, $A9, $CF, $39, $2D, $4C, $55 ; そうで⎵なけりゃ
#_0BDF10: db $CF, $4F, $27, $48, $3D, $39, $2A ; ⎵ろうやのなか
#_0BDF17: db $FC ; wait for key and new line
#_0BDF18: db $FA ; clear message box
#_0BDF19: db $D0, $4E ; set progress bit 4E
#_0BDF1B: db $A6, $9C ; だが
#_0BDF1D: db $F9 ; new line
#_0BDF1E: db $5D, $64, $7B, $38, $CF, $37, $51, $45 ; アクマと⎵てをむ
#_0BDF26: db $31, $52, $A6, $CF, $61, $BA, $88, $3A ; すんだ⎵オザワに
#_0BDF2E: db $3E, $CF, $2F, $2A, $4B, $28, $52 ; は⎵さからえん
#_0BDF35: db $F9 ; new line
#_0BDF36: db $25, $25, $CF, $29, $4E, $3E, $CF, $47 ; ああ⎵おれは⎵も
#_0BDF3E: db $27, $26, $48, $A6 ; ういやだ
#_0BDF42: db $F2, $0B ; prewritten text 0B
#_0BDF44: db $F2, $0B ; prewritten text 0B
#_0BDF46: db $F9 ; new line
#_0BDF47: db $78, $78, $78, $CF, $36, $43, $4B, $52 ; フフフ⎵つまらん
#_0BDF4F: db $B7, $6D, $51, $CF, $2B, $2A, $32, $34 ; グチを⎵きかせた
#_0BDF57: db $39 ; な
#_0BDF58: db $FC ; wait for key and new line
#_0BDF59: db $E9, $00, $1A ; go to message 1A maybe TODO
#_0BDF5C: db $FA ; clear message box
#_0BDF5D: db $F2, $0B ; prewritten text 0B
#_0BDF5F: db $52, $95, $CF ; ん?⎵
#_0BDF62: db $F0 ; write player name
#_0BDF63: db $2C, $52 ; くん
#_0BDF65: db $F9 ; new line
#_0BDF66: db $D3, $1C ; go to message 1C

;===================================================================================================

Message_03_08_1A:
#_0BDF68: db $D2, $47, $1D ; test progress bit 47 for message 1D
#_0BDF6B: db $FF ; end of message

;===================================================================================================

; «サイコダイバー»:
; きみたちが くるのは すぐわかったよ
; せいしんのうごきを かんじたんだ
; オザワのめいれいで
; ここには めったに ひとが こないんだ
Message_03_08_1B:
#_0BDF6C: db $F2, $46 ; prewritten text 46
#_0BDF6E: db $9A ; :
#_0BDF6F: db $F9 ; new line
#_0BDF70: db $2B, $44, $34, $35, $9C, $CF, $2C, $4D ; きみたちが⎵くる
#_0BDF78: db $3D, $3E, $CF, $31, $9E, $50, $2A, $58 ; のは⎵すぐわかっ
#_0BDF80: db $34, $4A ; たよ
#_0BDF82: db $F9 ; new line
#_0BDF83: db $32, $26, $30, $52, $3D, $27, $A0, $2B ; せいしんのうごき
#_0BDF8B: db $51, $CF, $2A, $52, $A2, $34, $52, $A6 ; を⎵かんじたんだ
#_0BDF93: db $FC ; wait for key and new line
#_0BDF94: db $FA ; clear message box
#_0BDF95: db $61, $BA, $88, $3D, $46, $26, $4E, $26 ; オザワのめいれい
#_0BDF9D: db $A9 ; で
#_0BDF9E: db $F9 ; new line
#_0BDF9F: db $2E, $2E, $3A, $3E, $CF, $46, $58, $34 ; ここには⎵めった
#_0BDFA7: db $3A, $CF, $3F, $38, $9C, $CF, $2E, $39 ; に⎵ひとが⎵こな
#_0BDFAF: db $26, $52, $A6 ; いんだ
#_0BDFB2: db $FC ; wait for key and new line
#_0BDFB3: db $D2, $47, $1D ; test progress bit 47 for message 1D

;===================================================================================================

; きみの せいしんは おかしくなっている
; ぶんしんともいえる パートナーが
; ピンチに なっているせいだ
; はやく たすけてあげたほうがいい
Message_03_08_1C:
#_0BDFB6: db $2B, $44, $3D, $CF, $32, $26, $30, $52 ; きみの⎵せいしん
#_0BDFBE: db $3E, $CF, $29, $2A, $30, $2C, $39, $58 ; は⎵おかしくなっ
#_0BDFC6: db $37, $26, $4D ; ている
#_0BDFC9: db $F9 ; new line
#_0BDFCA: db $AD, $52, $30, $52, $38, $47, $26, $28 ; ぶんしんともいえ
#_0BDFD2: db $4D, $CF, $C9, $5A, $70, $71, $5A, $9C ; る⎵パートナーが
#_0BDFDA: db $F9 ; new line
#_0BDFDB: db $CA, $8A, $6D, $3A, $CF, $39, $58, $37 ; ピンチに⎵なって
#_0BDFE3: db $26, $4D, $32, $26, $A6 ; いるせいだ
#_0BDFE8: db $FC ; wait for key and new line
#_0BDFE9: db $FA ; clear message box
#_0BDFEA: db $3E, $48, $2C, $CF, $34, $31, $2D, $37 ; はやく⎵たすけて
#_0BDFF2: db $25, $9F, $34, $42, $27, $9C, $26, $26 ; あげたほうがいい
#_0BDFFA: db $FC ; wait for key and new line
#_0BDFFB: db $D2, $47, $1D ; test progress bit 47 for message 1D
#_0BDFFE: db $FF ; end of message

;===================================================================================================

; ん? オザワを たおしたのか!
; ということは そとへでても
; へいきだな!
; «ありがとう» やっとじゆうに なれた
; サケがのみたくて
; しようが なかったんだ
; さあ おもいっきりのむぞー!
Message_03_08_1D:
#_0BDFFF: db $FA ; clear message box
#_0BE000: db $52, $95, $CF, $61, $BA, $88, $51, $CF ; ん?⎵オザワを⎵
#_0BE008: db $34, $29, $30, $34, $3D, $2A, $94 ; たおしたのか!
#_0BE00F: db $F9 ; new line
#_0BE010: db $38, $26, $27, $2E, $38, $3E, $CF, $33 ; ということは⎵そ
#_0BE018: db $38, $41, $A9, $37, $47 ; とへでても
#_0BE01D: db $F9 ; new line
#_0BE01E: db $41, $26, $2B, $A6, $39, $94 ; へいきだな!
#_0BE024: db $FC ; wait for key and new line
#_0BE025: db $FE, $62 ; ext command 62: Call routine 0FA371 TODO
#_0BE027: db $FA ; clear message box
#_0BE028: db $F2, $0D ; prewritten text 0D
#_0BE02A: db $CF, $48, $58, $38, $A2, $49, $27, $3A ; ⎵やっとじゆうに
#_0BE032: db $CF, $39, $4E, $34 ; ⎵なれた
#_0BE036: db $FC ; wait for key and new line
#_0BE037: db $D2, $4F, $1F ; test progress bit 4F for message 1F
#_0BE03A: db $FA ; clear message box
#_0BE03B: db $67, $65, $9C, $3D, $44, $34, $2C, $37 ; サケがのみたくて
#_0BE043: db $F9 ; new line
#_0BE044: db $30, $4A, $27, $9C, $CF, $39, $2A, $58 ; しようが⎵なかっ
#_0BE04C: db $34, $52, $A6 ; たんだ
#_0BE04F: db $F9 ; new line
#_0BE050: db $2F, $25, $CF, $29, $47, $26, $58, $2B ; さあ⎵おもいっき
#_0BE058: db $4C, $3D, $45, $A5, $5A, $94 ; りのむぞー!
#_0BE05E: db $FC ; wait for key and new line

;===================================================================================================

Message_03_08_1E:
#_0BE05F: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE062: db $D0, $46 ; set progress bit 46
#_0BE064: db $FF ; end of message

;===================================================================================================

; [CHASE]くんの いしきに
; まんげつのたび よびかけてくる こえがある
; こえのぬしの «せいしんの なか»に
; なにかが はいりこんだらしい
; そのせいで きみのせいしんにも
; えいきょうが でているんだ
; «・・・»«・・・»«・・・»«・・・»
; こえのぬしは シブヤにいる おんなのこ だな
; たすけてくれた れいに
; おれが なんとかしてみよう
; さきに シブヤへ いってるぜ
Message_03_08_1F:
#_0BE065: db $FA ; clear message box
#_0BE066: db $F0 ; write player name
#_0BE067: db $2C, $52, $3D, $CF, $26, $30, $2B, $3A ; くんの⎵いしきに
#_0BE06F: db $F9 ; new line
#_0BE070: db $43, $52, $9F, $36, $3D, $34, $AC, $CF ; まんげつのたび⎵
#_0BE078: db $4A, $AC, $2A, $2D, $37, $2C, $4D, $CF ; よびかけてくる⎵
#_0BE080: db $2E, $28, $9C, $25, $4D ; こえがある
#_0BE085: db $FC ; wait for key and new line
#_0BE086: db $FA ; clear message box
#_0BE087: db $2E, $28, $3D, $3B, $30, $3D, $CF ; こえのぬしの⎵
#_0BE08E: db $F2, $71 ; prewritten text 71
#_0BE090: db $3A ; に
#_0BE091: db $F9 ; new line
#_0BE092: db $39, $3A, $2A, $9C, $CF, $3E, $26, $4C ; なにかが⎵はいり
#_0BE09A: db $2E, $52, $A6, $4B, $30, $26 ; こんだらしい
#_0BE0A0: db $F9 ; new line
#_0BE0A1: db $33, $3D, $32, $26, $A9, $CF, $2B, $44 ; そのせいで⎵きみ
#_0BE0A9: db $3D, $32, $26, $30, $52, $3A, $47 ; のせいしんにも
#_0BE0B0: db $F9 ; new line
#_0BE0B1: db $28, $26, $2B, $57, $27, $9C, $CF, $A9 ; えいきょうが⎵で
#_0BE0B9: db $37, $26, $4D, $52, $A6 ; ているんだ
#_0BE0BE: db $FC ; wait for key and new line
#_0BE0BF: db $FA ; clear message box
#_0BE0C0: db $F2, $0B ; prewritten text 0B
#_0BE0C2: db $F2, $0B ; prewritten text 0B
#_0BE0C4: db $F2, $0B ; prewritten text 0B
#_0BE0C6: db $F2, $0B ; prewritten text 0B
#_0BE0C8: db $F9 ; new line
#_0BE0C9: db $2E, $28, $3D, $3B, $30, $3E, $CF, $68 ; こえのぬしは⎵シ
#_0BE0D1: db $C6, $80, $3A, $26, $4D, $CF, $29, $52 ; ブヤにいる⎵おん
#_0BE0D9: db $39, $3D, $2E, $CF, $A6, $39 ; なのこ⎵だな
#_0BE0DF: db $F9 ; new line
#_0BE0E0: db $34, $31, $2D, $37, $2C, $4E, $34, $CF ; たすけてくれた⎵
#_0BE0E8: db $4E, $26, $3A ; れいに
#_0BE0EB: db $F9 ; new line
#_0BE0EC: db $29, $4E, $9C, $CF, $39, $52, $38, $2A ; おれが⎵なんとか
#_0BE0F4: db $30, $37, $44, $4A, $27 ; してみよう
#_0BE0F9: db $FC ; wait for key and new line
#_0BE0FA: db $FA ; clear message box
#_0BE0FB: db $2F, $2B, $3A, $CF, $68, $C6, $80, $41 ; さきに⎵シブヤへ
#_0BE103: db $CF, $26, $58, $37, $4D, $A4 ; ⎵いってるぜ
#_0BE109: db $FC ; wait for key and new line
#_0BE10A: db $D0, $50 ; set progress bit 50
#_0BE10C: db $D3, $1E ; go to message 1E

;===================================================================================================

; >«だれもいない»
Message_03_08_20:
#_0BE10E: db $97 ; >
#_0BE10F: db $F2, $2C ; prewritten text 2C
#_0BE111: db $FC ; wait for key and new line
#_0BE112: db $FF ; end of message

;===================================================================================================

; >«なかに はいりますか?»
Message_03_09_00:
#_0BE113: db $D6, $00, $A1, $60, $28 ; place sprite A1 in slot 00 at XY:{60,28}
#_0BE118: db $97 ; >
#_0BE119: db $F2, $68 ; prewritten text 68
#_0BE11B: db $F8, $01 ; YES/NO - go to message 01 if YES
#_0BE11D: db $FF ; end of message

;===================================================================================================

Message_03_09_01:
#_0BE11E: db $D6, $00, $A2, $60, $28 ; place sprite A2 in slot 00 at XY:{60,28}
#_0BE123: db $FE, $07, $03 ; ext command 07: draw buffered text then wait 2 frames
#_0BE126: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE129: db $FE, $1A, $2C, $05, $01, $00, $03, $09 ; ext command 1A: 2C,05,01,00,03,09

;===================================================================================================

; «しれいかん»:
; ようこそ しょくん まっていたよ
; わたしが ゴトウだ
; [MOMO]の ことでは
; さぞわたしを うらんで いることだろう
; しかし まず はなしを きいてほしい
Message_03_09_02:
#_0BE131: db $D5, $46 ; send 46 to APU
#_0BE133: db $D7, $0F ; load scene 0F
#_0BE135: db $D4, $03 ; set text box size to 3
#_0BE137: db $D2, $2B, $10 ; test progress bit 2B for message 10
#_0BE13A: db $FE, $2F, $82, $01 ; ext command 2F: 82 01 TODO
#_0BE13E: db $D6, $00, $10, $70, $38 ; place sprite 10 in slot 00 at XY:{70,38}
#_0BE143: db $D2, $29, $05 ; test progress bit 29 for message 05
#_0BE146: db $F2, $20 ; prewritten text 20
#_0BE148: db $9A ; :
#_0BE149: db $F9 ; new line
#_0BE14A: db $4A, $27, $2E, $33, $CF, $30, $57, $2C ; ようこそ⎵しょく
#_0BE152: db $52, $CF, $43, $58, $37, $26, $34, $4A ; ん⎵まっていたよ
#_0BE15A: db $F9 ; new line
#_0BE15B: db $50, $34, $30, $9C, $CF, $B9, $70, $5F ; わたしが⎵ゴトウ
#_0BE163: db $A6 ; だ
#_0BE164: db $FC ; wait for key and new line
#_0BE165: db $FA ; clear message box
#_0BE166: db $ED ; write female protag name
#_0BE167: db $3D, $CF, $2E, $38, $A9, $3E ; の⎵ことでは
#_0BE16D: db $F9 ; new line
#_0BE16E: db $2F, $A5, $50, $34, $30, $51, $CF, $27 ; さぞわたしを⎵う
#_0BE176: db $4B, $52, $A9, $CF, $26, $4D, $2E, $38 ; らんで⎵いること
#_0BE17E: db $A6, $4F, $27 ; だろう
#_0BE181: db $F9 ; new line
#_0BE182: db $30, $2A, $30, $CF, $43, $A3, $CF, $3E ; しかし⎵まず⎵は
#_0BE18A: db $39, $30, $51, $CF, $2B, $26, $37, $42 ; なしを⎵きいてほ
#_0BE192: db $30, $26 ; しい
#_0BE194: db $FC ; wait for key and new line

;===================================================================================================

; いま かみの なのもとに
; «せんねんおうこく»を つくりあげる
; けいかくが すすんでいる
; «せんねんおうこく»«・・・»
; そこに いきる たみは とこしえの やすらぎが
; やくそく されるという
; しかし それは かみに えらばれた
; ひとにぎりの もののみに ゆるされること«・・・»
; そのたのものは かみの いしのもと
; «アメリカ»ぐんにより まっさつされる
; いまも しょくんの しらない ところで
; いにしえの かみがみが ニッポンへの
; ミサイルこうげきを ふせいで いるのだよ«・・・»
; しかし まだまだ «われわれ»の ちからは よわい
; どうか ちからを かしてほしい
Message_03_09_03:
#_0BE195: db $D4, $03 ; set text box size to 3
#_0BE197: db $26, $43, $CF, $2A, $44, $3D, $CF, $39 ; いま⎵かみの⎵な
#_0BE19F: db $3D, $47, $38, $3A ; のもとに
#_0BE1A3: db $F9 ; new line
#_0BE1A4: db $F2, $21 ; prewritten text 21
#_0BE1A6: db $51, $CF, $36, $2C, $4C, $25, $9F, $4D ; を⎵つくりあげる
#_0BE1AE: db $F9 ; new line
#_0BE1AF: db $2D, $26, $2A, $2C, $9C, $CF, $31, $31 ; けいかくが⎵すす
#_0BE1B7: db $52, $A9, $26, $4D ; んでいる
#_0BE1BB: db $FC ; wait for key and new line
#_0BE1BC: db $FA ; clear message box
#_0BE1BD: db $F2, $21 ; prewritten text 21
#_0BE1BF: db $F2, $0B ; prewritten text 0B
#_0BE1C1: db $F9 ; new line
#_0BE1C2: db $33, $2E, $3A, $CF, $26, $2B, $4D, $CF ; そこに⎵いきる⎵
#_0BE1CA: db $34, $44, $3E, $CF, $38, $2E, $30, $28 ; たみは⎵とこしえ
#_0BE1D2: db $3D, $CF, $48, $31, $4B, $9D, $9C ; の⎵やすらぎが
#_0BE1D9: db $F9 ; new line
#_0BE1DA: db $48, $2C, $33, $2C, $CF, $2F, $4E, $4D ; やくそく⎵される
#_0BE1E2: db $38, $26, $27 ; という
#_0BE1E5: db $FC ; wait for key and new line
#_0BE1E6: db $FA ; clear message box
#_0BE1E7: db $30, $2A, $30, $CF, $33, $4E, $3E, $CF ; しかし⎵それは⎵
#_0BE1EF: db $2A, $44, $3A, $CF, $28, $4B, $AB, $4E ; かみに⎵えらばれ
#_0BE1F7: db $34 ; た
#_0BE1F8: db $F9 ; new line
#_0BE1F9: db $3F, $38, $3A, $9D, $4C, $3D, $CF, $47 ; ひとにぎりの⎵も
#_0BE201: db $3D, $3D, $44, $3A, $CF, $49, $4D, $2F ; ののみに⎵ゆるさ
#_0BE209: db $4E, $4D, $2E, $38 ; れること
#_0BE20D: db $F2, $0B ; prewritten text 0B
#_0BE20F: db $F9 ; new line
#_0BE210: db $33, $3D, $34, $3D, $47, $3D, $3E, $CF ; そのたのものは⎵
#_0BE218: db $2A, $44, $3D, $CF, $26, $30, $3D, $47 ; かみの⎵いしのも
#_0BE220: db $38 ; と
#_0BE221: db $F9 ; new line
#_0BE222: db $F2, $1B ; prewritten text 1B
#_0BE224: db $9E, $52, $3A, $4A, $4C, $CF, $43, $58 ; ぐんにより⎵まっ
#_0BE22C: db $2F, $36, $2F, $4E, $4D ; さつされる
#_0BE231: db $FC ; wait for key and new line
#_0BE232: db $FA ; clear message box
#_0BE233: db $26, $43, $47, $CF, $30, $57, $2C, $52 ; いまも⎵しょくん
#_0BE23B: db $3D, $CF, $30, $4B, $39, $26, $CF, $38 ; の⎵しらない⎵と
#_0BE243: db $2E, $4F, $A9 ; ころで
#_0BE246: db $F9 ; new line
#_0BE247: db $26, $3A, $30, $28, $3D, $CF, $2A, $44 ; いにしえの⎵かみ
#_0BE24F: db $9C, $44, $9C, $CF, $72, $92, $CD, $8A ; がみが⎵ニッポン
#_0BE257: db $41, $3D ; への
#_0BE259: db $F9 ; new line
#_0BE25A: db $7C, $67, $5E, $85, $2E, $27, $9F, $2B ; ミサイルこうげき
#_0BE262: db $51, $CF, $40, $32, $26, $A9, $CF, $26 ; を⎵ふせいで⎵い
#_0BE26A: db $4D, $3D, $A6, $4A ; るのだよ
#_0BE26E: db $F2, $0B ; prewritten text 0B
#_0BE270: db $FC ; wait for key and new line
#_0BE271: db $FA ; clear message box
#_0BE272: db $30, $2A, $30, $CF, $43, $A6, $43, $A6 ; しかし⎵まだまだ
#_0BE27A: db $CF ; ⎵
#_0BE27B: db $F2, $02 ; prewritten text 02
#_0BE27D: db $3D, $CF, $35, $2A, $4B, $3E, $CF, $4A ; の⎵ちからは⎵よ
#_0BE285: db $50, $26 ; わい
#_0BE287: db $F9 ; new line
#_0BE288: db $AA, $27, $2A, $CF, $35, $2A, $4B, $51 ; どうか⎵ちからを
#_0BE290: db $CF, $2A, $30, $37, $42, $30, $26 ; ⎵かしてほしい
#_0BE297: db $FC ; wait for key and new line
#_0BE298: db $D0, $29 ; set progress bit 29

;===================================================================================================

; しょくんが こたえを だすのに
; いましばらくの ゆうよを あたえよう«・・・»
Message_03_09_04:
#_0BE29A: db $FA ; clear message box
#_0BE29B: db $30, $57, $2C, $52, $9C, $CF, $2E, $34 ; しょくんが⎵こた
#_0BE2A3: db $28, $51, $CF, $A6, $31, $3D, $3A ; えを⎵だすのに
#_0BE2AA: db $F9 ; new line
#_0BE2AB: db $26, $43, $30, $AB, $4B, $2C, $3D, $CF ; いましばらくの⎵
#_0BE2B3: db $49, $27, $4A, $51, $CF, $25, $34, $28 ; ゆうよを⎵あたえ
#_0BE2BB: db $4A, $27 ; よう
#_0BE2BD: db $F2, $0B ; prewritten text 0B
#_0BE2BF: db $FC ; wait for key and new line
#_0BE2C0: db $D3, $11 ; go to message 11

;===================================================================================================

; ゴトウ:
; まだ けっしんが つかぬようだな
; いまいちど わたしの はなしを きくか?
Message_03_09_05:
#_0BE2C2: db $B9, $70, $5F, $9A ; ゴトウ:
#_0BE2C6: db $F9 ; new line
#_0BE2C7: db $D2, $2E, $0E ; test progress bit 2E for message 0E
#_0BE2CA: db $D2, $2D, $06 ; test progress bit 2D for message 06
#_0BE2CD: db $43, $A6, $CF, $2D, $58, $30, $52, $9C ; まだ⎵けっしんが
#_0BE2D5: db $CF, $36, $2A, $3B, $4A, $27, $A6, $39 ; ⎵つかぬようだな
#_0BE2DD: db $F9 ; new line
#_0BE2DE: db $26, $43, $26, $35, $AA, $CF, $50, $34 ; いまいちど⎵わた
#_0BE2E6: db $30, $3D, $CF, $3E, $39, $30, $51, $CF ; しの⎵はなしを⎵
#_0BE2EE: db $2B, $2C, $2A, $95 ; きくか?
#_0BE2F2: db $F8, $03 ; YES/NO - go to message 03 if YES
#_0BE2F4: db $D3, $04 ; go to message 04

;===================================================================================================

; どうやら けっしんが ついたようだな
; このわたしに «ちからを かしてくれるか»?
Message_03_09_06:
#_0BE2F6: db $AA, $27, $48, $4B, $CF, $2D, $58, $30 ; どうやら⎵けっし
#_0BE2FE: db $52, $9C, $CF, $36, $26, $34, $4A, $27 ; んが⎵ついたよう
#_0BE306: db $A6, $39 ; だな
#_0BE308: db $F9 ; new line
#_0BE309: db $2E, $3D, $50, $34, $30, $3A, $CF ; このわたしに⎵
#_0BE310: db $F2, $28 ; prewritten text 28
#_0BE312: db $95 ; ?
#_0BE313: db $F8, $0F ; YES/NO - go to message 0F if YES

;===================================================================================================

; このわたしに さからうと いうのか
; ならば しょくんに いきるみちは ない!!
Message_03_09_07:
#_0BE315: db $D4, $03 ; set text box size to 3
#_0BE317: db $2E, $3D, $50, $34, $30, $3A, $CF, $2F ; このわたしに⎵さ
#_0BE31F: db $2A, $4B, $27, $38, $CF, $26, $27, $3D ; からうと⎵いうの
#_0BE327: db $2A ; か
#_0BE328: db $F9 ; new line
#_0BE329: db $39, $4B, $AB, $CF, $30, $57, $2C, $52 ; ならば⎵しょくん
#_0BE331: db $3A, $CF, $26, $2B, $4D, $44, $35, $3E ; に⎵いきるみちは
#_0BE339: db $CF, $39, $26, $94, $94 ; ⎵ない!!
#_0BE33E: db $FC ; wait for key and new line
#_0BE33F: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE342: db $EB, $00, $00, $D2, $01 ; load 1x demon 00D2
#_0BE347: db $DE, $00, $00, $E8, $01 ; load 1x demon 00E8
#_0BE34C: db $D5, $39 ; send 39 to APU
#_0BE34E: db $E4, $00 ; load demon $00
#_0BE350: db $E4, $01 ; load demon $01
#_0BE352: db $E5, $81, $09 ; [COMMAND E5:81,09]

;===================================================================================================

Message_03_09_08:
#_0BE355: db $E5, $80, $09 ; [COMMAND E5:80,09]
#_0BE358: db $D3, $08 ; go to message 08

;===================================================================================================

Message_03_09_09:
#_0BE35A: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BE35C: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BE35E: db $EB, $00, $00, $E0, $01 ; load 1x demon 00E0
#_0BE363: db $DE, $00, $00, $EA, $01 ; load 1x demon 00EA
#_0BE368: db $D5, $39 ; send 39 to APU
#_0BE36A: db $E4, $00 ; load demon $00
#_0BE36C: db $E4, $01 ; load demon $01
#_0BE36E: db $E5, $81, $0B ; [COMMAND E5:81,0B]

;===================================================================================================

Message_03_09_0A:
#_0BE371: db $E5, $80, $0B ; [COMMAND E5:80,0B]
#_0BE374: db $D3, $0A ; go to message 0A

;===================================================================================================

; ゴトウ:
; やはり アクマどもでは かなわぬか
; わたしの てで ほうむってやろう
Message_03_09_0B:
#_0BE376: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BE378: db $E7, $01 ; call routine 01E5CD with value 02 TODO
#_0BE37A: db $FE, $2F, $82, $01 ; ext command 2F: 82 01 TODO
#_0BE37E: db $D6, $00, $10, $70, $38 ; place sprite 10 in slot 00 at XY:{70,38}
#_0BE383: db $B9, $70, $5F, $9A ; ゴトウ:
#_0BE387: db $F9 ; new line
#_0BE388: db $48, $3E, $4C, $CF, $5D, $64, $7B, $AA ; やはり⎵アクマど
#_0BE390: db $47, $A9, $3E, $CF, $2A, $39, $50, $3B ; もでは⎵かなわぬ
#_0BE398: db $2A ; か
#_0BE399: db $F9 ; new line
#_0BE39A: db $50, $34, $30, $3D, $CF, $37, $A9, $CF ; わたしの⎵てで⎵
#_0BE3A2: db $42, $27, $45, $58, $37, $48, $4F, $27 ; ほうむってやろう
#_0BE3AA: db $FC ; wait for key and new line
#_0BE3AB: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE3AE: db $DE, $01, $00, $03, $01 ; load 1x demon 0103
#_0BE3B3: db $D5, $39 ; send 39 to APU
#_0BE3B5: db $E4, $00 ; load demon $00
#_0BE3B7: db $E5, $01, $0D ; [COMMAND E5:01,0D]

;===================================================================================================

Message_03_09_0C:
#_0BE3BA: db $E5, $00, $0D ; [COMMAND E5:00,0D]
#_0BE3BD: db $D3, $0C ; go to message 0C

;===================================================================================================

; ゴトウ:
; わたしが しねば どうなるか«・・・»
; しょくんらは かんがえなかったか«・・・»
Message_03_09_0D:
#_0BE3BF: db $B9, $70, $5F, $9A ; ゴトウ:
#_0BE3C3: db $F9 ; new line
#_0BE3C4: db $50, $34, $30, $9C, $CF, $30, $3C, $AB ; わたしが⎵しねば
#_0BE3CC: db $CF, $AA, $27, $39, $4D, $2A ; ⎵どうなるか
#_0BE3D2: db $F2, $0B ; prewritten text 0B
#_0BE3D4: db $F9 ; new line
#_0BE3D5: db $30, $57, $2C, $52, $4B, $3E, $CF, $2A ; しょくんらは⎵か
#_0BE3DD: db $52, $9C, $28, $39, $2A, $58, $34, $2A ; んがえなかったか
#_0BE3E5: db $F2, $0B ; prewritten text 0B
#_0BE3E7: db $FC ; wait for key and new line
#_0BE3E8: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BE3EA: db $D0, $2B ; set progress bit 2B
#_0BE3EC: db $FE, $02, $E0 ; ext command 02: add 224 to STAT_11C if progress bit FB
#_0BE3EF: db $D3, $11 ; go to message 11

;===================================================================================================

; どうやら かみの てさきに
; うまく まるめこまれたようだな
Message_03_09_0E:
#_0BE3F1: db $AA, $27, $48, $4B, $CF, $2A, $44, $3D ; どうやら⎵かみの
#_0BE3F9: db $CF, $37, $2F, $2B, $3A ; ⎵てさきに
#_0BE3FE: db $F9 ; new line
#_0BE3FF: db $27, $43, $2C, $CF, $43, $4D, $46, $2E ; うまく⎵まるめこ
#_0BE407: db $43, $4E, $34, $4A, $27, $A6, $39 ; まれたようだな
#_0BE40E: db $FC ; wait for key and new line
#_0BE40F: db $D3, $07 ; go to message 07

;===================================================================================================

; ゴトウ:
; «ちからを かしてくれるか»!
; では «アメリカ»たいしかんへ いってくれ
; «アメリカ»たいしを せっとくして
; «アメリカ»ぐんのこうげきを やめさせてくれ
; たのんだぞ«・・・»
Message_03_09_0F:
#_0BE411: db $D4, $03 ; set text box size to 3
#_0BE413: db $B9, $70, $5F, $9A ; ゴトウ:
#_0BE417: db $F9 ; new line
#_0BE418: db $F2, $28 ; prewritten text 28
#_0BE41A: db $94 ; !
#_0BE41B: db $FC ; wait for key and new line
#_0BE41C: db $A9, $3E, $CF ; では⎵
#_0BE41F: db $F2, $1B ; prewritten text 1B
#_0BE421: db $34, $26, $30, $2A, $52, $41, $CF, $26 ; たいしかんへ⎵い
#_0BE429: db $58, $37, $2C, $4E ; ってくれ
#_0BE42D: db $FC ; wait for key and new line
#_0BE42E: db $FA ; clear message box
#_0BE42F: db $F2, $1B ; prewritten text 1B
#_0BE431: db $34, $26, $30, $51, $CF, $32, $58, $38 ; たいしを⎵せっと
#_0BE439: db $2C, $30, $37 ; くして
#_0BE43C: db $F9 ; new line
#_0BE43D: db $F2, $1B ; prewritten text 1B
#_0BE43F: db $9E, $52, $3D, $2E, $27, $9F, $2B, $51 ; ぐんのこうげきを
#_0BE447: db $CF, $48, $46, $2F, $32, $37, $2C, $4E ; ⎵やめさせてくれ
#_0BE44F: db $F9 ; new line
#_0BE450: db $34, $3D, $52, $A6, $A5 ; たのんだぞ
#_0BE455: db $F2, $0B ; prewritten text 0B
#_0BE457: db $D0, $2A ; set progress bit 2A
#_0BE459: db $FC ; wait for key and new line
#_0BE45A: db $D3, $11 ; go to message 11

;===================================================================================================

; >だれも いない«・・・»
Message_03_09_10:
#_0BE45C: db $97, $A6, $4E, $47, $CF, $26, $39, $26 ; >だれも⎵いない
#_0BE464: db $F2, $0B ; prewritten text 0B
#_0BE466: db $FC ; wait for key and new line

;===================================================================================================

Message_03_09_11:
#_0BE467: db $FE, $1A, $2C, $86, $01, $00, $03, $09 ; ext command 1A: 2C,86,01,00,03,09
#_0BE46F: db $FF ; end of message

;===================================================================================================

; へいし:
; きみたちも わがぶたいに はいりたくて
; ここに きたのか?
Message_03_09_12:
#_0BE470: db $D6, $00, $5A, $70, $28 ; place sprite 5A in slot 00 at XY:{70,28}
#_0BE475: db $41, $26, $30, $9A ; へいし:
#_0BE479: db $F9 ; new line
#_0BE47A: db $2B, $44, $34, $35, $47, $CF, $50, $9C ; きみたちも⎵わが
#_0BE482: db $AD, $34, $26, $3A, $CF, $3E, $26, $4C ; ぶたいに⎵はいり
#_0BE48A: db $34, $2C, $37 ; たくて
#_0BE48D: db $F9 ; new line
#_0BE48E: db $2E, $2E, $3A, $CF, $2B, $34, $3D, $2A ; ここに⎵きたのか
#_0BE496: db $95 ; ?
#_0BE497: db $FC ; wait for key and new line
#_0BE498: db $FF ; end of message

;===================================================================================================

; へいし:
; ゴトウ«しれいかん»は りっぱなかたです
; あのかたの めいれいなら
; じぶんは どんなことも やります
Message_03_09_13:
#_0BE499: db $D6, $00, $5A, $70, $28 ; place sprite 5A in slot 00 at XY:{70,28}
#_0BE49E: db $41, $26, $30, $9A ; へいし:
#_0BE4A2: db $F9 ; new line
#_0BE4A3: db $B9, $70, $5F ; ゴトウ
#_0BE4A6: db $F2, $20 ; prewritten text 20
#_0BE4A8: db $3E, $CF, $4C, $58, $B0, $39, $2A, $34 ; は⎵りっぱなかた
#_0BE4B0: db $A9, $31 ; です
#_0BE4B2: db $F9 ; new line
#_0BE4B3: db $25, $3D, $2A, $34, $3D, $CF, $46, $26 ; あのかたの⎵めい
#_0BE4BB: db $4E, $26, $39, $4B ; れいなら
#_0BE4BF: db $F9 ; new line
#_0BE4C0: db $A2, $AD, $52, $3E, $CF, $AA, $52, $39 ; じぶんは⎵どんな
#_0BE4C8: db $2E, $38, $47, $CF, $48, $4C, $43, $31 ; ことも⎵やります
#_0BE4D0: db $FC ; wait for key and new line
#_0BE4D1: db $FF ; end of message

;===================================================================================================

; へいし:
; «しれいかん»のゴトウは アクマまで よびよせて
; いったい なにを するつもりだろう
; おれは こわくなってきた«・・・»
Message_03_09_14:
#_0BE4D2: db $D6, $00, $5A, $70, $28 ; place sprite 5A in slot 00 at XY:{70,28}
#_0BE4D7: db $41, $26, $30, $9A ; へいし:
#_0BE4DB: db $F9 ; new line
#_0BE4DC: db $F2, $20 ; prewritten text 20
#_0BE4DE: db $3D, $B9, $70, $5F, $3E, $CF, $5D, $64 ; のゴトウは⎵アク
#_0BE4E6: db $7B, $43, $A9, $CF, $4A, $AC, $4A, $32 ; マまで⎵よびよせ
#_0BE4EE: db $37 ; て
#_0BE4EF: db $F9 ; new line
#_0BE4F0: db $26, $58, $34, $26, $CF, $39, $3A, $51 ; いったい⎵なにを
#_0BE4F8: db $CF, $31, $4D, $36, $47, $4C, $A6, $4F ; ⎵するつもりだろ
#_0BE500: db $27 ; う
#_0BE501: db $F9 ; new line
#_0BE502: db $29, $4E, $3E, $CF, $2E, $50, $2C, $39 ; おれは⎵こわくな
#_0BE50A: db $58, $37, $2B, $34 ; ってきた
#_0BE50E: db $F2, $0B ; prewritten text 0B
#_0BE510: db $FC ; wait for key and new line
#_0BE511: db $FF ; end of message

;===================================================================================================

; おんな:
; たすけて! わたし なにも
; わるいこと してないわよ
; >たすけますか?
Message_03_09_15:
#_0BE512: db $D2, $34, $1B ; test progress bit 34 for message 1B
#_0BE515: db $D7, $85, $33 ; load scenes 85 and 33
#_0BE518: db $D6, $00, $44, $78, $28 ; place sprite 44 in slot 00 at XY:{78,28}
#_0BE51D: db $29, $52, $39, $9A ; おんな:
#_0BE521: db $F9 ; new line
#_0BE522: db $34, $31, $2D, $37, $94, $CF, $50, $34 ; たすけて!⎵わた
#_0BE52A: db $30, $CF, $39, $3A, $47 ; し⎵なにも
#_0BE52F: db $F9 ; new line
#_0BE530: db $50, $4D, $26, $2E, $38, $CF, $30, $37 ; わるいこと⎵して
#_0BE538: db $39, $26, $50, $4A ; ないわよ
#_0BE53C: db $FC ; wait for key and new line
#_0BE53D: db $FA ; clear message box
#_0BE53E: db $97, $34, $31, $2D, $43, $31, $2A, $95 ; >たすけますか?
#_0BE546: db $F8, $16 ; YES/NO - go to message 16 if YES
#_0BE548: db $FF ; end of message

;===================================================================================================

; おんな:
; たすかったわ
; そういえば もうひとり いたんだけど
; どこかへ つれてかれたわよ
Message_03_09_16:
#_0BE549: db $FE, $62 ; ext command 62: Call routine 0FA371 TODO
#_0BE54B: db $D4, $04 ; set text box size to 4
#_0BE54D: db $29, $52, $39, $9A ; おんな:
#_0BE551: db $F9 ; new line
#_0BE552: db $34, $31, $2A, $58, $34, $50 ; たすかったわ
#_0BE558: db $F9 ; new line
#_0BE559: db $33, $27, $26, $28, $AB, $CF, $47, $27 ; そういえば⎵もう
#_0BE561: db $3F, $38, $4C, $CF, $26, $34, $52, $A6 ; ひとり⎵いたんだ
#_0BE569: db $2D, $AA ; けど
#_0BE56B: db $F9 ; new line
#_0BE56C: db $AA, $2E, $2A, $41, $CF, $36, $4E, $37 ; どこかへ⎵つれて
#_0BE574: db $2A, $4E, $34, $50, $4A ; かれたわよ
#_0BE579: db $FC ; wait for key and new line
#_0BE57A: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE57D: db $D0, $34 ; set progress bit 34
#_0BE57F: db $FE, $02, $FF ; ext command 02: add 255 to STAT_11C if progress bit FB
#_0BE582: db $FF ; end of message

;===================================================================================================

; «しょうじょ»:
; おねがい たすけて«・・・»
; >たすけますか?
Message_03_09_17:
#_0BE583: db $D2, $35, $1B ; test progress bit 35 for message 1B
#_0BE586: db $D7, $85, $33 ; load scenes 85 and 33
#_0BE589: db $D6, $00, $48, $78, $28 ; place sprite 48 in slot 00 at XY:{78,28}
#_0BE58E: db $F2, $00 ; prewritten text 00
#_0BE590: db $9A ; :
#_0BE591: db $F9 ; new line
#_0BE592: db $29, $3C, $9C, $26, $CF, $34, $31, $2D ; おねがい⎵たすけ
#_0BE59A: db $37 ; て
#_0BE59B: db $F2, $0B ; prewritten text 0B
#_0BE59D: db $FC ; wait for key and new line
#_0BE59E: db $FA ; clear message box
#_0BE59F: db $97, $34, $31, $2D, $43, $31, $2A, $95 ; >たすけますか?
#_0BE5A7: db $F8, $18 ; YES/NO - go to message 18 if YES
#_0BE5A9: db $FF ; end of message

;===================================================================================================

; «ありがとう»
; すこしまえに
; [JIMMY]さんって ひとが きたの
; わたしたちを たすけようと したんだけど
; みはりが おおぜいきて だめだったの
Message_03_09_18:
#_0BE5AA: db $FE, $62 ; ext command 62: Call routine 0FA371 TODO
#_0BE5AC: db $D4, $03 ; set text box size to 3
#_0BE5AE: db $F2, $0D ; prewritten text 0D
#_0BE5B0: db $F9 ; new line
#_0BE5B1: db $31, $2E, $30, $43, $28, $3A ; すこしまえに
#_0BE5B7: db $F9 ; new line
#_0BE5B8: db $EE ; write lawful hero name
#_0BE5B9: db $2F, $52, $58, $37, $CF, $3F, $38, $9C ; さんって⎵ひとが
#_0BE5C1: db $CF, $2B, $34, $3D ; ⎵きたの
#_0BE5C5: db $FC ; wait for key and new line
#_0BE5C6: db $FA ; clear message box
#_0BE5C7: db $50, $34, $30, $34, $35, $51, $CF, $34 ; わたしたちを⎵た
#_0BE5CF: db $31, $2D, $4A, $27, $38, $CF, $30, $34 ; すけようと⎵した
#_0BE5D7: db $52, $A6, $2D, $AA ; んだけど
#_0BE5DB: db $F9 ; new line
#_0BE5DC: db $44, $3E, $4C, $9C, $CF, $29, $29, $A4 ; みはりが⎵おおぜ
#_0BE5E4: db $26, $2B, $37, $CF, $A6, $46, $A6, $58 ; いきて⎵だめだっ
#_0BE5EC: db $34, $3D ; たの
#_0BE5EE: db $FC ; wait for key and new line
#_0BE5EF: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE5F2: db $D0, $35 ; set progress bit 35
#_0BE5F4: db $FE, $02, $FF ; ext command 02: add 255 to STAT_11C if progress bit FB
#_0BE5F7: db $FF ; end of message

;===================================================================================================

; おんなのこ:
; たすけてよー! こわいよー!
; >たすけますか?
Message_03_09_19:
#_0BE5F8: db $D2, $36, $1B ; test progress bit 36 for message 1B
#_0BE5FB: db $D7, $85, $33 ; load scenes 85 and 33
#_0BE5FE: db $D6, $00, $0F, $78, $38 ; place sprite 0F in slot 00 at XY:{78,38}
#_0BE603: db $29, $52, $39, $3D, $2E, $9A ; おんなのこ:
#_0BE609: db $F9 ; new line
#_0BE60A: db $34, $31, $2D, $37, $4A, $5A, $94, $CF ; たすけてよー!⎵
#_0BE612: db $2E, $50, $26, $4A, $5A, $94 ; こわいよー!
#_0BE618: db $FC ; wait for key and new line
#_0BE619: db $FA ; clear message box
#_0BE61A: db $97, $34, $31, $2D, $43, $31, $2A, $95 ; >たすけますか?
#_0BE622: db $F8, $1A ; YES/NO - go to message 1A if YES
#_0BE624: db $FF ; end of message

;===================================================================================================

; わーい! «ありがとう»
; わたし [MOMO]!
; ゆうかい されたの
Message_03_09_1A:
#_0BE625: db $D4, $04 ; set text box size to 4
#_0BE627: db $50, $5A, $26, $94, $CF ; わーい!⎵
#_0BE62C: db $F2, $0D ; prewritten text 0D
#_0BE62E: db $F9 ; new line
#_0BE62F: db $50, $34, $30, $CF ; わたし⎵
#_0BE633: db $ED ; write female protag name
#_0BE634: db $94 ; !
#_0BE635: db $F9 ; new line
#_0BE636: db $49, $27, $2A, $26, $CF, $2F, $4E, $34 ; ゆうかい⎵された
#_0BE63E: db $3D ; の
#_0BE63F: db $FC ; wait for key and new line
#_0BE640: db $FE, $62 ; ext command 62: Call routine 0FA371 TODO
#_0BE642: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE645: db $D0, $36 ; set progress bit 36
#_0BE647: db $FE, $02, $FF ; ext command 02: add 255 to STAT_11C if progress bit FB
#_0BE64A: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_09_1B:
#_0BE64B: db $D7, $85, $33 ; load scenes 85 and 33
#_0BE64E: db $97 ; >
#_0BE64F: db $F2, $2C ; prewritten text 2C
#_0BE651: db $FC ; wait for key and new line
#_0BE652: db $FF ; end of message

;===================================================================================================

Message_03_0A_00:
#_0BE653: db $D5, $46 ; send 46 to APU
#_0BE655: db $D2, $15, $03 ; test progress bit 15 for message 03
#_0BE658: db $D6, $01, $26, $80, $28 ; place sprite 26 in slot 01 at XY:{80,28}
#_0BE65D: db $D6, $02, $27, $40, $28 ; place sprite 27 in slot 02 at XY:{40,28}
#_0BE662: db $D6, $03, $28, $60, $28 ; place sprite 28 in slot 03 at XY:{60,28}
#_0BE667: db $D6, $04, $29, $A0, $28 ; place sprite 29 in slot 04 at XY:{A0,28}
#_0BE66C: db $E9, $05, $02 ; go to message 02 maybe TODO
#_0BE66F: db $D2, $10, $01 ; test progress bit 10 for message 01
#_0BE672: db $D3, $02 ; go to message 02

;===================================================================================================

; オザワ:
; このやろ ちょうしくれてんじゃねえぞ!
; なにが アクマだあ!
; ねごとこきやがって
; てめえら もっといためつけてやれ!
; >ひとりの «しょうねん»が
; おおぜいに とりかこまれて なぐられている
; [JIMMY]:
; なんて ひどい ことを«・・・»
; ひきょうな やつは ゆるせません
; なにをしている! やめろ!
; オザワ:
; ちっ じゃまがはいったか まあいい
; にどと ふざけたまね すんじゃねえぞ
; «しょうねん»:
; «・・・»お おまえら«・・・»みたいな
; ゲスやろうには«・・・»まけない«・・・»
; «・・・»ぜったいに まけないぞ«・・・»
; [JIMMY]:
; だいじょうぶですか?
; «しょうねん»:
; うるさい! なにを いまさら«・・・»
; おれに ちからさえ あれば
; おまえらなんか«・・・»
; [JIMMY]:
; どうしよう? [CHASE]くん
; まだ あんなこと いってますよ
; «しょうねん»:
; «・・・»お おい«・・・»
; いま なんていった?
; «・・・»[CHASE]«・・・»って いったな
; おまえ«・・・»[CHASE]なのか?
; やっぱり あれは ただのゆめ じゃなかったんだ
; すると おまえが [JIMMY]だな«・・・»
; [JIMMY]:
; «・・・»きみは [HIM]くん ですね
; [HIM]:
; そうか どうやら たすけてもらった らしいな
; ああ«・・・»ちくしょう!
; おれに もっと ちからが あれば«・・・»
; おれひとりの ちからじゃ
; あんなやつらにさえ かてない«・・・»
; オザワいちみにも かてないのに
; アクマに かてるわけがない
; たのむ! おれも なかまに いれてくれ!
; いやだと いっても ついていくからな
; >[HIM]が «ナカマに くわわった»
Message_03_0A_01:
#_0BE674: db $D6, $00, $2A, $70, $48 ; place sprite 2A in slot 00 at XY:{70,48}
#_0BE679: db $FA ; clear message box
#_0BE67A: db $61, $BA, $88, $9A ; オザワ:
#_0BE67E: db $F9 ; new line
#_0BE67F: db $2E, $3D, $48, $4F, $CF, $35, $57, $27 ; このやろ⎵ちょう
#_0BE687: db $30, $2C, $4E, $37, $52, $A2, $55, $3C ; しくれてんじゃね
#_0BE68F: db $28, $A5, $94 ; えぞ!
#_0BE692: db $FC ; wait for key and new line
#_0BE693: db $FA ; clear message box
#_0BE694: db $39, $3A, $9C, $CF, $5D, $64, $7B, $A6 ; なにが⎵アクマだ
#_0BE69C: db $25, $94 ; あ!
#_0BE69E: db $F9 ; new line
#_0BE69F: db $3C, $A0, $38, $2E, $2B, $48, $9C, $58 ; ねごとこきやがっ
#_0BE6A7: db $37 ; て
#_0BE6A8: db $F9 ; new line
#_0BE6A9: db $37, $46, $28, $4B, $CF, $47, $58, $38 ; てめえら⎵もっと
#_0BE6B1: db $26, $34, $46, $36, $2D, $37, $48, $4E ; いためつけてやれ
#_0BE6B9: db $94 ; !
#_0BE6BA: db $FC ; wait for key and new line
#_0BE6BB: db $FA ; clear message box
#_0BE6BC: db $97, $3F, $38, $4C, $3D, $CF ; >ひとりの⎵
#_0BE6C2: db $F2, $01 ; prewritten text 01
#_0BE6C4: db $9C ; が
#_0BE6C5: db $F9 ; new line
#_0BE6C6: db $29, $29, $A4, $26, $3A, $CF, $38, $4C ; おおぜいに⎵とり
#_0BE6CE: db $2A, $2E, $43, $4E, $37, $CF, $39, $9E ; かこまれて⎵なぐ
#_0BE6D6: db $4B, $4E, $37, $26, $4D ; られている
#_0BE6DB: db $FC ; wait for key and new line
#_0BE6DC: db $FA ; clear message box
#_0BE6DD: db $EE ; write lawful hero name
#_0BE6DE: db $9A ; :
#_0BE6DF: db $F9 ; new line
#_0BE6E0: db $39, $52, $37, $CF, $3F, $AA, $26, $CF ; なんて⎵ひどい⎵
#_0BE6E8: db $2E, $38, $51 ; ことを
#_0BE6EB: db $F2, $0B ; prewritten text 0B
#_0BE6ED: db $F9 ; new line
#_0BE6EE: db $3F, $2B, $57, $27, $39, $CF, $48, $36 ; ひきょうな⎵やつ
#_0BE6F6: db $3E, $CF, $49, $4D, $32, $43, $32, $52 ; は⎵ゆるせません
#_0BE6FE: db $FC ; wait for key and new line
#_0BE6FF: db $FA ; clear message box
#_0BE700: db $39, $3A, $51, $30, $37, $26, $4D, $94 ; なにをしている!
#_0BE708: db $CF, $48, $46, $4F, $94 ; ⎵やめろ!
#_0BE70D: db $FC ; wait for key and new line
#_0BE70E: db $D6, $02, $00 ; delete sprite in slot 02
#_0BE711: db $D6, $03, $00 ; delete sprite in slot 03
#_0BE714: db $D6, $04, $00 ; delete sprite in slot 04
#_0BE717: db $FA ; clear message box
#_0BE718: db $61, $BA, $88, $9A ; オザワ:
#_0BE71C: db $F9 ; new line
#_0BE71D: db $35, $58, $CF, $A2, $55, $43, $9C, $3E ; ちっ⎵じゃまがは
#_0BE725: db $26, $58, $34, $2A, $CF, $43, $25, $26 ; いったか⎵まあい
#_0BE72D: db $26 ; い
#_0BE72E: db $F9 ; new line
#_0BE72F: db $3A, $AA, $38, $CF, $40, $A1, $2D, $34 ; にどと⎵ふざけた
#_0BE737: db $43, $3C, $CF, $31, $52, $A2, $55, $3C ; まね⎵すんじゃね
#_0BE73F: db $28, $A5 ; えぞ
#_0BE741: db $FC ; wait for key and new line
#_0BE742: db $D6, $01, $00 ; delete sprite in slot 01
#_0BE745: db $FA ; clear message box
#_0BE746: db $F2, $01 ; prewritten text 01
#_0BE748: db $9A ; :
#_0BE749: db $F9 ; new line
#_0BE74A: db $F2, $0B ; prewritten text 0B
#_0BE74C: db $29, $CF, $29, $43, $28, $4B ; お⎵おまえら
#_0BE752: db $F2, $0B ; prewritten text 0B
#_0BE754: db $44, $34, $26, $39 ; みたいな
#_0BE758: db $F9 ; new line
#_0BE759: db $B8, $69, $48, $4F, $27, $3A, $3E ; ゲスやろうには
#_0BE760: db $F2, $0B ; prewritten text 0B
#_0BE762: db $43, $2D, $39, $26 ; まけない
#_0BE766: db $F2, $0B ; prewritten text 0B
#_0BE768: db $F9 ; new line
#_0BE769: db $F2, $0B ; prewritten text 0B
#_0BE76B: db $A4, $58, $34, $26, $3A, $CF, $43, $2D ; ぜったいに⎵まけ
#_0BE773: db $39, $26, $A5 ; ないぞ
#_0BE776: db $F2, $0B ; prewritten text 0B
#_0BE778: db $FC ; wait for key and new line
#_0BE779: db $D4, $03 ; set text box size to 3
#_0BE77B: db $FA ; clear message box
#_0BE77C: db $EE ; write lawful hero name
#_0BE77D: db $9A ; :
#_0BE77E: db $F9 ; new line
#_0BE77F: db $A6, $26, $A2, $57, $27, $AD, $A9, $31 ; だいじょうぶです
#_0BE787: db $2A, $95 ; か?
#_0BE789: db $FC ; wait for key and new line
#_0BE78A: db $FA ; clear message box
#_0BE78B: db $F2, $01 ; prewritten text 01
#_0BE78D: db $9A ; :
#_0BE78E: db $F9 ; new line
#_0BE78F: db $27, $4D, $2F, $26, $94, $CF, $39, $3A ; うるさい!⎵なに
#_0BE797: db $51, $CF, $26, $43, $2F, $4B ; を⎵いまさら
#_0BE79D: db $F2, $0B ; prewritten text 0B
#_0BE79F: db $F9 ; new line
#_0BE7A0: db $29, $4E, $3A, $CF, $35, $2A, $4B, $2F ; おれに⎵ちからさ
#_0BE7A8: db $28, $CF, $25, $4E, $AB ; え⎵あれば
#_0BE7AD: db $F9 ; new line
#_0BE7AE: db $29, $43, $28, $4B, $39, $52, $2A ; おまえらなんか
#_0BE7B5: db $F2, $0B ; prewritten text 0B
#_0BE7B7: db $FC ; wait for key and new line
#_0BE7B8: db $D4, $03 ; set text box size to 3
#_0BE7BA: db $FA ; clear message box
#_0BE7BB: db $EE ; write lawful hero name
#_0BE7BC: db $9A ; :
#_0BE7BD: db $F9 ; new line
#_0BE7BE: db $AA, $27, $30, $4A, $27, $95, $CF ; どうしよう?⎵
#_0BE7C5: db $F0 ; write player name
#_0BE7C6: db $2C, $52 ; くん
#_0BE7C8: db $F9 ; new line
#_0BE7C9: db $43, $A6, $CF, $25, $52, $39, $2E, $38 ; まだ⎵あんなこと
#_0BE7D1: db $CF, $26, $58, $37, $43, $31, $4A ; ⎵いってますよ
#_0BE7D8: db $FC ; wait for key and new line
#_0BE7D9: db $FA ; clear message box
#_0BE7DA: db $F2, $01 ; prewritten text 01
#_0BE7DC: db $9A ; :
#_0BE7DD: db $F9 ; new line
#_0BE7DE: db $F2, $0B ; prewritten text 0B
#_0BE7E0: db $29, $CF, $29, $26 ; お⎵おい
#_0BE7E4: db $F2, $0B ; prewritten text 0B
#_0BE7E6: db $F9 ; new line
#_0BE7E7: db $26, $43, $CF, $39, $52, $37, $26, $58 ; いま⎵なんていっ
#_0BE7EF: db $34, $95 ; た?
#_0BE7F1: db $FC ; wait for key and new line
#_0BE7F2: db $FA ; clear message box
#_0BE7F3: db $F2, $0B ; prewritten text 0B
#_0BE7F5: db $F0 ; write player name
#_0BE7F6: db $F2, $0B ; prewritten text 0B
#_0BE7F8: db $58, $37, $CF, $26, $58, $34, $39 ; って⎵いったな
#_0BE7FF: db $FC ; wait for key and new line
#_0BE800: db $FA ; clear message box
#_0BE801: db $D6, $00, $00 ; delete sprite in slot 00
#_0BE804: db $DE, $01, $00, $35, $01 ; load 1x demon 0135
#_0BE809: db $E4, $00 ; load demon $00
#_0BE80B: db $29, $43, $28 ; おまえ
#_0BE80E: db $F2, $0B ; prewritten text 0B
#_0BE810: db $F0 ; write player name
#_0BE811: db $39, $3D, $2A, $95 ; なのか?
#_0BE815: db $F9 ; new line
#_0BE816: db $48, $58, $B0, $4C, $CF, $25, $4E, $3E ; やっぱり⎵あれは
#_0BE81E: db $CF, $34, $A6, $3D, $49, $46, $CF, $A2 ; ⎵ただのゆめ⎵じ
#_0BE826: db $55, $39, $2A, $58, $34, $52, $A6 ; ゃなかったんだ
#_0BE82D: db $F9 ; new line
#_0BE82E: db $31, $4D, $38, $CF, $29, $43, $28, $9C ; すると⎵おまえが
#_0BE836: db $CF ; ⎵
#_0BE837: db $EE ; write lawful hero name
#_0BE838: db $A6, $39 ; だな
#_0BE83A: db $F2, $0B ; prewritten text 0B
#_0BE83C: db $FC ; wait for key and new line
#_0BE83D: db $FA ; clear message box
#_0BE83E: db $EE ; write lawful hero name
#_0BE83F: db $9A ; :
#_0BE840: db $F9 ; new line
#_0BE841: db $F2, $0B ; prewritten text 0B
#_0BE843: db $2B, $44, $3E, $CF ; きみは⎵
#_0BE847: db $EF ; write chaos hero name
#_0BE848: db $2C, $52, $CF, $A9, $31, $3C ; くん⎵ですね
#_0BE84E: db $FC ; wait for key and new line
#_0BE84F: db $FA ; clear message box
#_0BE850: db $EF ; write chaos hero name
#_0BE851: db $9A ; :
#_0BE852: db $F9 ; new line
#_0BE853: db $33, $27, $2A, $CF, $AA, $27, $48, $4B ; そうか⎵どうやら
#_0BE85B: db $CF, $34, $31, $2D, $37, $47, $4B, $58 ; ⎵たすけてもらっ
#_0BE863: db $34, $CF, $4B, $30, $26, $39 ; た⎵らしいな
#_0BE869: db $F9 ; new line
#_0BE86A: db $25, $25 ; ああ
#_0BE86C: db $F2, $0B ; prewritten text 0B
#_0BE86E: db $35, $2C, $30, $57, $27, $94 ; ちくしょう!
#_0BE874: db $FC ; wait for key and new line
#_0BE875: db $FA ; clear message box
#_0BE876: db $29, $4E, $3A, $CF, $47, $58, $38, $CF ; おれに⎵もっと⎵
#_0BE87E: db $35, $2A, $4B, $9C, $CF, $25, $4E, $AB ; ちからが⎵あれば
#_0BE886: db $F2, $0B ; prewritten text 0B
#_0BE888: db $FC ; wait for key and new line
#_0BE889: db $29, $4E, $3F, $38, $4C, $3D, $CF, $35 ; おれひとりの⎵ち
#_0BE891: db $2A, $4B, $A2, $55 ; からじゃ
#_0BE895: db $F9 ; new line
#_0BE896: db $25, $52, $39, $48, $36, $4B, $3A, $2F ; あんなやつらにさ
#_0BE89E: db $28, $CF, $2A, $37, $39, $26 ; え⎵かてない
#_0BE8A4: db $F2, $0B ; prewritten text 0B
#_0BE8A6: db $FC ; wait for key and new line
#_0BE8A7: db $FA ; clear message box
#_0BE8A8: db $61, $BA, $88, $26, $35, $44, $3A, $47 ; オザワいちみにも
#_0BE8B0: db $CF, $2A, $37, $39, $26, $3D, $3A ; ⎵かてないのに
#_0BE8B7: db $F9 ; new line
#_0BE8B8: db $5D, $64, $7B, $3A, $CF, $2A, $37, $4D ; アクマに⎵かてる
#_0BE8C0: db $50, $2D, $9C, $39, $26 ; わけがない
#_0BE8C5: db $FC ; wait for key and new line
#_0BE8C6: db $FA ; clear message box
#_0BE8C7: db $34, $3D, $45, $94, $CF, $29, $4E, $47 ; たのむ!⎵おれも
#_0BE8CF: db $CF, $39, $2A, $43, $3A, $CF, $26, $4E ; ⎵なかまに⎵いれ
#_0BE8D7: db $37, $2C, $4E, $94 ; てくれ!
#_0BE8DB: db $FC ; wait for key and new line
#_0BE8DC: db $FA ; clear message box
#_0BE8DD: db $26, $48, $A6, $38, $CF, $26, $58, $37 ; いやだと⎵いって
#_0BE8E5: db $47, $CF, $36, $26, $37, $26, $2C, $2A ; も⎵ついていくか
#_0BE8ED: db $4B, $39 ; らな
#_0BE8EF: db $FC ; wait for key and new line
#_0BE8F0: db $FE, $26, $03 ; ext command 26: something 03 TODO
#_0BE8F3: db $FA ; clear message box
#_0BE8F4: db $D0, $15 ; set progress bit 15
#_0BE8F6: db $E7, $00 ; call routine 01E5CD with value 00 TODO
#_0BE8F8: db $97 ; >
#_0BE8F9: db $EF ; write chaos hero name
#_0BE8FA: db $9C, $CF ; が⎵
#_0BE8FC: db $F2, $2F ; prewritten text 2F
#_0BE8FE: db $FC ; wait for key and new line
#_0BE8FF: db $FF ; end of message

;===================================================================================================

; オザワ:
; てめえ! ここに はいるんじゃねえ!
Message_03_0A_02:
#_0BE900: db $61, $BA, $88, $9A ; オザワ:
#_0BE904: db $F9 ; new line
#_0BE905: db $37, $46, $28, $94, $CF, $2E, $2E, $3A ; てめえ!⎵ここに
#_0BE90D: db $CF, $3E, $26, $4D, $52, $A2, $55, $3C ; ⎵はいるんじゃね
#_0BE915: db $28, $94 ; え!
#_0BE917: db $FC ; wait for key and new line
#_0BE918: db $FF ; end of message

;===================================================================================================

; >«だれもいない»
Message_03_0A_03:
#_0BE919: db $97 ; >
#_0BE91A: db $F2, $2C ; prewritten text 2C
#_0BE91C: db $FC ; wait for key and new line
#_0BE91D: db $FF ; end of message

;===================================================================================================

Message_03_02_Pointers:
#_0BE91E: dw Message_03_02_00
#_0BE920: dw Message_03_02_01
#_0BE922: dw Message_03_02_02
#_0BE924: dw Message_03_02_03
#_0BE926: dw Message_03_02_04
#_0BE928: dw Message_03_02_05
#_0BE92A: dw Message_03_02_06
#_0BE92C: dw Message_03_02_07
#_0BE92E: dw Message_03_02_08
#_0BE930: dw Message_03_02_09
#_0BE932: dw Message_03_02_0A
#_0BE934: dw Message_03_02_0B
#_0BE936: dw Message_03_02_0C
#_0BE938: dw Message_03_02_0D
#_0BE93A: dw Message_03_02_0E
#_0BE93C: dw Message_03_02_0F
#_0BE93E: dw Message_03_02_10
#_0BE940: dw Message_03_02_11
#_0BE942: dw Message_03_02_12
#_0BE944: dw Message_03_02_13
#_0BE946: dw Message_03_02_14
#_0BE948: dw Message_03_02_15
#_0BE94A: dw Message_03_02_16
#_0BE94C: dw Message_03_02_17
#_0BE94E: dw Message_03_02_18
#_0BE950: dw Message_03_02_19
#_0BE952: dw Message_03_02_1A
#_0BE954: dw Message_03_02_1B
#_0BE956: dw Message_03_02_1C
#_0BE958: dw Message_03_02_1D
#_0BE95A: dw Message_03_02_1E
#_0BE95C: dw Message_03_02_1F
#_0BE95E: dw Message_03_02_20
#_0BE960: dw Message_03_02_21
#_0BE962: dw Message_03_02_22
#_0BE964: dw Message_03_02_23
#_0BE966: dw Message_03_02_24
#_0BE968: dw Message_03_02_25
#_0BE96A: dw Message_03_02_26
#_0BE96C: dw Message_03_02_27
#_0BE96E: dw Message_03_02_28
#_0BE970: dw Message_03_02_29
#_0BE972: dw Message_03_02_2A
#_0BE974: dw Message_03_02_2B
#_0BE976: dw Message_03_02_2C
#_0BE978: dw Message_03_02_2D
#_0BE97A: dw Message_03_02_2E
#_0BE97C: dw Message_03_02_2F
#_0BE97E: dw Message_03_02_30
#_0BE980: dw Message_03_02_31
#_0BE982: dw Message_03_02_32
#_0BE984: dw Message_03_02_33
#_0BE986: dw Message_03_02_34
#_0BE988: dw Message_03_02_35
#_0BE98A: dw Message_03_02_36
#_0BE98C: dw Message_03_02_37
#_0BE98E: dw Message_03_02_38
#_0BE990: dw Message_03_02_39
#_0BE992: dw Message_03_02_3A
#_0BE994: dw Message_03_02_3B
#_0BE996: dw Message_03_02_3C
#_0BE998: dw Message_03_02_3D
#_0BE99A: dw Message_03_02_3E
#_0BE99C: dw Message_03_02_3F
#_0BE99E: dw Message_03_02_40
#_0BE9A0: dw Message_03_02_41
#_0BE9A2: dw Message_03_02_42
#_0BE9A4: dw Message_03_02_43
#_0BE9A6: dw Message_03_02_44
#_0BE9A8: dw Message_03_02_45
#_0BE9AA: dw Message_03_02_46
#_0BE9AC: dw Message_03_02_47
#_0BE9AE: dw Message_03_02_48
#_0BE9B0: dw Message_03_02_49
#_0BE9B2: dw Message_03_02_4A
#_0BE9B4: dw Message_03_02_4B
#_0BE9B6: dw Message_03_02_4C
#_0BE9B8: dw Message_03_02_4D
#_0BE9BA: dw Message_03_02_4E
#_0BE9BC: dw Message_03_02_4F
#_0BE9BE: dw Message_03_02_50
#_0BE9C0: dw Message_03_02_51
#_0BE9C2: dw Message_03_02_52
#_0BE9C4: dw Message_03_02_53
#_0BE9C6: dw Message_03_02_54
#_0BE9C8: dw Message_03_02_55
#_0BE9CA: dw Message_03_02_56
#_0BE9CC: dw Message_03_02_57
#_0BE9CE: dw Message_03_02_58
#_0BE9D0: dw Message_03_02_59
#_0BE9D2: dw Message_03_02_5A
#_0BE9D4: dw Message_03_02_5B
#_0BE9D6: dw Message_03_02_5C
#_0BE9D8: dw Message_03_02_5D
#_0BE9DA: dw Message_03_02_5E
#_0BE9DC: dw Message_03_02_5F
#_0BE9DE: dw Message_03_02_60
#_0BE9E0: dw Message_03_02_61
#_0BE9E2: dw Message_03_02_62
#_0BE9E4: dw Message_03_02_63
#_0BE9E6: dw Message_03_02_64
#_0BE9E8: dw Message_03_02_65
#_0BE9EA: dw Message_03_02_66
#_0BE9EC: dw Message_03_02_67
#_0BE9EE: dw Message_03_02_68
#_0BE9F0: dw Message_03_02_69
#_0BE9F2: dw Message_03_02_6A
#_0BE9F4: dw Message_03_02_6B
#_0BE9F6: dw Message_03_02_6C
#_0BE9F8: dw Message_03_02_6D
#_0BE9FA: dw Message_03_02_6E
#_0BE9FC: dw Message_03_02_6F
#_0BE9FE: dw Message_03_02_70
#_0BEA00: dw Message_03_02_71
#_0BEA02: dw Message_03_02_72
#_0BEA04: dw Message_03_02_73
#_0BEA06: dw Message_03_02_74
#_0BEA08: dw Message_03_02_75
#_0BEA0A: dw Message_03_02_76
#_0BEA0C: dw Message_03_02_77
#_0BEA0E: dw Message_03_02_78
#_0BEA10: dw Message_03_02_79
#_0BEA12: dw Message_03_02_7A
#_0BEA14: dw Message_03_02_7B
#_0BEA16: dw Message_03_02_7C
#_0BEA18: dw Message_03_02_7D
#_0BEA1A: dw Message_03_02_7E
#_0BEA1C: dw Message_03_02_7F
#_0BEA1E: dw Message_03_02_80
#_0BEA20: dw Message_03_02_81
#_0BEA22: dw Message_03_02_82
#_0BEA24: dw Message_03_02_83
#_0BEA26: dw Message_03_02_84
#_0BEA28: dw Message_03_02_85
#_0BEA2A: dw Message_03_02_86
#_0BEA2C: dw Message_03_02_87
#_0BEA2E: dw Message_03_02_88
#_0BEA30: dw Message_03_02_89
#_0BEA32: dw Message_03_02_8A
#_0BEA34: dw Message_03_02_8B
#_0BEA36: dw Message_03_02_8C
#_0BEA38: dw Message_03_02_8C
#_0BEA3A: dw Message_03_02_8E
#_0BEA3C: dw Message_03_02_8F
#_0BEA3E: dw Message_03_02_90
#_0BEA40: dw Message_03_02_91
#_0BEA42: dw Message_03_02_92
#_0BEA44: dw Message_03_02_93
#_0BEA46: dw Message_03_02_94
#_0BEA48: dw Message_03_02_95
#_0BEA4A: dw Message_03_02_96
#_0BEA4C: dw Message_03_02_97
#_0BEA4E: dw Message_03_02_98
#_0BEA50: dw Message_03_02_99
#_0BEA52: dw Message_03_02_9A
#_0BEA54: dw Message_03_02_9B
#_0BEA56: dw Message_03_02_9C
#_0BEA58: dw Message_03_02_9D
#_0BEA5A: dw Message_03_02_9E
#_0BEA5C: dw Message_03_02_9F
#_0BEA5E: dw Message_03_02_A0
#_0BEA60: dw Message_03_02_A1
#_0BEA62: dw Message_03_02_A2
#_0BEA64: dw Message_03_02_A3
#_0BEA66: dw Message_03_02_A4
#_0BEA68: dw Message_03_02_A5
#_0BEA6A: dw Message_03_02_A6
#_0BEA6C: dw Message_03_02_A7
#_0BEA6E: dw Message_03_02_A8
#_0BEA70: dw Message_03_02_A9
#_0BEA72: dw Message_03_02_AA
#_0BEA74: dw Message_03_02_AB
#_0BEA76: dw Message_03_02_AC
#_0BEA78: dw Message_03_02_AD
#_0BEA7A: dw Message_03_02_AE
#_0BEA7C: dw Message_03_02_AF
#_0BEA7E: dw Message_03_02_B0
#_0BEA80: dw Message_03_02_B1
#_0BEA82: dw Message_03_02_B2
#_0BEA84: dw Message_03_02_B3
#_0BEA86: dw Message_03_02_B4
#_0BEA88: dw Message_03_02_B5
#_0BEA8A: dw Message_03_02_B6
#_0BEA8C: dw Message_03_02_B7
#_0BEA8E: dw Message_03_02_B8
#_0BEA90: dw Message_03_02_B9
#_0BEA92: dw Message_03_02_BA
#_0BEA94: dw Message_03_02_BB
#_0BEA96: dw Message_03_02_BC
#_0BEA98: dw Message_03_02_BD
#_0BEA9A: dw Message_03_02_BE
#_0BEA9C: dw Message_03_02_BF
#_0BEA9E: dw Message_03_02_C0
#_0BEAA0: dw Message_03_02_C1
#_0BEAA2: dw Message_03_02_C2
#_0BEAA4: dw Message_03_02_C3
#_0BEAA6: dw Message_03_02_C4
#_0BEAA8: dw Message_03_02_C5
#_0BEAAA: dw Message_03_02_C6
#_0BEAAC: dw Message_03_02_C7
#_0BEAAE: dw Message_03_02_C8
#_0BEAB0: dw Message_03_02_C9
#_0BEAB2: dw Message_03_02_CA
#_0BEAB4: dw Message_03_02_CB
#_0BEAB6: dw Message_03_02_CC
#_0BEAB8: dw Message_03_02_CD
#_0BEABA: dw Message_03_02_CE
#_0BEABC: dw Message_03_02_CF
#_0BEABE: dw Message_03_02_D0
#_0BEAC0: dw Message_03_02_D1
#_0BEAC2: dw Message_03_02_D2
#_0BEAC4: dw Message_03_02_D3
#_0BEAC6: dw Message_03_02_D4
#_0BEAC8: dw Message_03_02_D5
#_0BEACA: dw Message_03_02_D6
#_0BEACC: dw Message_03_02_D7
#_0BEACE: dw Message_03_02_D8
#_0BEAD0: dw Message_03_02_D9
#_0BEAD2: dw Message_03_02_DA
#_0BEAD4: dw Message_03_02_DB
#_0BEAD6: dw Message_03_02_DC
#_0BEAD8: dw Message_03_02_DD
#_0BEADA: dw Message_03_02_DE
#_0BEADC: dw Message_03_02_DF
#_0BEADE: dw Message_03_02_E0
#_0BEAE0: dw Message_03_02_E1
#_0BEAE2: dw Message_03_02_E2
#_0BEAE4: dw Message_03_02_E3
#_0BEAE6: dw Message_03_02_E4
#_0BEAE8: dw Message_03_02_E5
#_0BEAEA: dw Message_03_02_E6
#_0BEAEC: dw Message_03_02_E7
#_0BEAEE: dw Message_03_02_E8
#_0BEAF0: dw Message_03_02_E9
#_0BEAF2: dw Message_03_02_EA
#_0BEAF4: dw Message_03_02_EB
#_0BEAF6: dw Message_03_02_EC
#_0BEAF8: dw Message_03_02_ED
#_0BEAFA: dw Message_03_02_EE
#_0BEAFC: dw Message_03_02_EF
#_0BEAFE: dw Message_03_02_F0
#_0BEB00: dw Message_03_02_F1
#_0BEB02: dw Message_03_02_F2
#_0BEB04: dw Message_03_02_F3
#_0BEB06: dw Message_03_02_F4
#_0BEB08: dw Message_03_02_F5
#_0BEB0A: dw Message_03_02_F6
#_0BEB0C: dw Message_03_02_F7
#_0BEB0E: dw Message_03_02_F8
#_0BEB10: dw Message_03_02_F9

;===================================================================================================

Message_03_03_Pointers:
#_0BEB12: dw Message_03_03_00
#_0BEB14: dw Message_03_03_01
#_0BEB16: dw Message_03_03_02
#_0BEB18: dw Message_03_03_03
#_0BEB1A: dw Message_03_03_04
#_0BEB1C: dw Message_03_03_05
#_0BEB1E: dw Message_03_03_06
#_0BEB20: dw Message_03_03_07
#_0BEB22: dw Message_03_03_08
#_0BEB24: dw Message_03_03_09
#_0BEB26: dw Message_03_03_0A
#_0BEB28: dw Message_03_03_0B
#_0BEB2A: dw Message_03_03_0C
#_0BEB2C: dw Message_03_03_0D
#_0BEB2E: dw Message_03_03_0E
#_0BEB30: dw Message_03_03_0F
#_0BEB32: dw Message_03_03_10
#_0BEB34: dw Message_03_03_11
#_0BEB36: dw Message_03_03_12
#_0BEB38: dw Message_03_03_13
#_0BEB3A: dw Message_03_03_14
#_0BEB3C: dw Message_03_03_15
#_0BEB3E: dw Message_03_03_16
#_0BEB40: dw Message_03_03_17
#_0BEB42: dw Message_03_03_18
#_0BEB44: dw Message_03_03_19
#_0BEB46: dw Message_03_03_1A
#_0BEB48: dw Message_03_03_1B
#_0BEB4A: dw Message_03_03_1C
#_0BEB4C: dw Message_03_03_1D
#_0BEB4E: dw Message_03_03_1E

;===================================================================================================

Message_03_04_Pointers:
#_0BEB50: dw Message_03_04_00
#_0BEB52: dw Message_03_04_01
#_0BEB54: dw Message_03_04_02
#_0BEB56: dw Message_03_04_03
#_0BEB58: dw Message_03_04_04
#_0BEB5A: dw Message_03_04_05
#_0BEB5C: dw Message_03_04_06
#_0BEB5E: dw Message_03_04_07
#_0BEB60: dw Message_03_04_08
#_0BEB62: dw Message_03_04_09
#_0BEB64: dw Message_03_04_0A
#_0BEB66: dw Message_03_04_0B
#_0BEB68: dw Message_03_04_0C
#_0BEB6A: dw Message_03_04_0D
#_0BEB6C: dw Message_03_04_0E
#_0BEB6E: dw Message_03_04_0F
#_0BEB70: dw Message_03_04_10
#_0BEB72: dw Message_03_04_11
#_0BEB74: dw Message_03_04_12
#_0BEB76: dw Message_03_04_13
#_0BEB78: dw Message_03_04_14
#_0BEB7A: dw Message_03_04_15
#_0BEB7C: dw Message_03_04_16
#_0BEB7E: dw Message_03_04_17
#_0BEB80: dw Message_03_04_18
#_0BEB82: dw Message_03_04_19
#_0BEB84: dw Message_03_04_1A
#_0BEB86: dw Message_03_04_1B
#_0BEB88: dw Message_03_04_1C
#_0BEB8A: dw Message_03_04_1D
#_0BEB8C: dw Message_03_04_1E
#_0BEB8E: dw Message_03_04_1F
#_0BEB90: dw Message_03_04_20
#_0BEB92: dw Message_03_04_21
#_0BEB94: dw Message_03_04_22
#_0BEB96: dw Message_03_04_23
#_0BEB98: dw Message_03_04_24
#_0BEB9A: dw Message_03_04_25
#_0BEB9C: dw Message_03_04_26
#_0BEB9E: dw Message_03_04_27
#_0BEBA0: dw Message_03_04_28
#_0BEBA2: dw Message_03_04_29
#_0BEBA4: dw Message_03_04_2A
#_0BEBA6: dw Message_03_04_2B
#_0BEBA8: dw Message_03_04_2C
#_0BEBAA: dw Message_03_04_2D
#_0BEBAC: dw Message_03_04_2E
#_0BEBAE: dw Message_03_04_2F
#_0BEBB0: dw Message_03_04_30
#_0BEBB2: dw Message_03_04_31
#_0BEBB4: dw Message_03_04_32
#_0BEBB6: dw Message_03_04_33
#_0BEBB8: dw Message_03_04_34
#_0BEBBA: dw Message_03_04_35
#_0BEBBC: dw Message_03_04_36
#_0BEBBE: dw Message_03_04_37
#_0BEBC0: dw Message_03_04_38
#_0BEBC2: dw Message_03_04_39
#_0BEBC4: dw Message_03_04_3A
#_0BEBC6: dw Message_03_04_3B
#_0BEBC8: dw Message_03_04_3C
#_0BEBCA: dw Message_03_04_3D
#_0BEBCC: dw Message_03_04_3E
#_0BEBCE: dw Message_03_04_3F
#_0BEBD0: dw Message_03_04_40
#_0BEBD2: dw Message_03_04_41
#_0BEBD4: dw Message_03_04_42
#_0BEBD6: dw Message_03_04_43
#_0BEBD8: dw Message_03_04_44
#_0BEBDA: dw Message_03_04_45
#_0BEBDC: dw Message_03_04_46
#_0BEBDE: dw Message_03_04_47
#_0BEBE0: dw Message_03_04_48
#_0BEBE2: dw Message_03_04_49
#_0BEBE4: dw Message_03_04_4A
#_0BEBE6: dw Message_03_04_4B
#_0BEBE8: dw Message_03_04_4C
#_0BEBEA: dw Message_03_04_4D
#_0BEBEC: dw Message_03_04_4E

;===================================================================================================

Message_03_05_Pointers:
#_0BEBEE: dw Message_03_05_00
#_0BEBF0: dw Message_03_05_01
#_0BEBF2: dw Message_03_05_02
#_0BEBF4: dw Message_03_05_03
#_0BEBF6: dw Message_03_05_04
#_0BEBF8: dw Message_03_05_05
#_0BEBFA: dw Message_03_05_06
#_0BEBFC: dw Message_03_05_07
#_0BEBFE: dw Message_03_05_08
#_0BEC00: dw Message_03_05_09
#_0BEC02: dw Message_03_05_0A
#_0BEC04: dw Message_03_05_0B
#_0BEC06: dw Message_03_05_0C
#_0BEC08: dw Message_03_05_0D
#_0BEC0A: dw Message_03_05_0E
#_0BEC0C: dw Message_03_05_0F
#_0BEC0E: dw Message_03_05_10
#_0BEC10: dw Message_03_05_11
#_0BEC12: dw Message_03_05_12
#_0BEC14: dw Message_03_05_13
#_0BEC16: dw Message_03_05_14
#_0BEC18: dw Message_03_05_15
#_0BEC1A: dw Message_03_05_16
#_0BEC1C: dw Message_03_05_17
#_0BEC1E: dw Message_03_05_18
#_0BEC20: dw Message_03_05_19
#_0BEC22: dw Message_03_05_1A
#_0BEC24: dw Message_03_05_1B
#_0BEC26: dw Message_03_05_1C
#_0BEC28: dw Message_03_05_1D
#_0BEC2A: dw Message_03_05_1E
#_0BEC2C: dw Message_03_05_1F
#_0BEC2E: dw Message_03_05_20
#_0BEC30: dw Message_03_05_21
#_0BEC32: dw Message_03_05_22
#_0BEC34: dw Message_03_05_23
#_0BEC36: dw Message_03_05_24
#_0BEC38: dw Message_03_05_25
#_0BEC3A: dw Message_03_05_26
#_0BEC3C: dw Message_03_05_27
#_0BEC3E: dw Message_03_05_28
#_0BEC40: dw Message_03_05_29
#_0BEC42: dw Message_03_05_2A
#_0BEC44: dw Message_03_05_2B
#_0BEC46: dw Message_03_05_2C
#_0BEC48: dw Message_03_05_2D
#_0BEC4A: dw Message_03_05_2E
#_0BEC4C: dw Message_03_05_2F
#_0BEC4E: dw Message_03_05_30
#_0BEC50: dw Message_03_05_31
#_0BEC52: dw Message_03_05_32
#_0BEC54: dw Message_03_05_33
#_0BEC56: dw Message_03_05_34
#_0BEC58: dw Message_03_05_35
#_0BEC5A: dw Message_03_05_36
#_0BEC5C: dw Message_03_05_37
#_0BEC5E: dw Message_03_05_38
#_0BEC60: dw Message_03_05_39
#_0BEC62: dw Message_03_05_3A
#_0BEC64: dw Message_03_05_3B
#_0BEC66: dw Message_03_05_3C
#_0BEC68: dw Message_03_05_3D
#_0BEC6A: dw Message_03_05_3E
#_0BEC6C: dw Message_03_05_3F
#_0BEC6E: dw Message_03_05_40
#_0BEC70: dw Message_03_05_41
#_0BEC72: dw Message_03_05_42
#_0BEC74: dw Message_03_05_43
#_0BEC76: dw Message_03_05_44
#_0BEC78: dw Message_03_05_45
#_0BEC7A: dw Message_03_05_46
#_0BEC7C: dw Message_03_05_47
#_0BEC7E: dw Message_03_05_48
#_0BEC80: dw Message_03_05_49
#_0BEC82: dw Message_03_05_4A
#_0BEC84: dw Message_03_05_4B
#_0BEC86: dw Message_03_05_4C
#_0BEC88: dw Message_03_05_4D
#_0BEC8A: dw Message_03_05_4E
#_0BEC8C: dw Message_03_05_4F
#_0BEC8E: dw Message_03_05_50

;===================================================================================================

Message_03_06_Pointers:
#_0BEC90: dw Message_03_06_00
#_0BEC92: dw Message_03_06_01
#_0BEC94: dw Message_03_06_02
#_0BEC96: dw Message_03_06_03
#_0BEC98: dw Message_03_06_04
#_0BEC9A: dw Message_03_06_05
#_0BEC9C: dw Message_03_06_06
#_0BEC9E: dw Message_03_06_07
#_0BECA0: dw Message_03_06_08
#_0BECA2: dw Message_03_06_09
#_0BECA4: dw Message_03_06_0A
#_0BECA6: dw Message_03_06_0B
#_0BECA8: dw Message_03_06_0C
#_0BECAA: dw Message_03_06_0D
#_0BECAC: dw Message_03_06_0E
#_0BECAE: dw Message_03_06_0F
#_0BECB0: dw Message_03_06_10
#_0BECB2: dw Message_03_06_11
#_0BECB4: dw Message_03_06_12
#_0BECB6: dw Message_03_06_13
#_0BECB8: dw Message_03_06_14
#_0BECBA: dw Message_03_06_15
#_0BECBC: dw Message_03_06_16
#_0BECBE: dw Message_03_06_17

;===================================================================================================

Message_03_07_Pointers:
#_0BECC0: dw Message_03_07_00
#_0BECC2: dw Message_03_07_01
#_0BECC4: dw Message_03_07_02
#_0BECC6: dw Message_03_07_03
#_0BECC8: dw Message_03_07_04
#_0BECCA: dw Message_03_07_05
#_0BECCC: dw Message_03_07_06
#_0BECCE: dw Message_03_07_07
#_0BECD0: dw Message_03_07_08
#_0BECD2: dw Message_03_07_09
#_0BECD4: dw Message_03_07_0A
#_0BECD6: dw Message_03_07_0B
#_0BECD8: dw Message_03_07_0C
#_0BECDA: dw Message_03_07_0D
#_0BECDC: dw Message_03_07_0E
#_0BECDE: dw Message_03_07_0F
#_0BECE0: dw Message_03_07_10
#_0BECE2: dw Message_03_07_11
#_0BECE4: dw Message_03_07_12
#_0BECE6: dw Message_03_07_13
#_0BECE8: dw Message_03_07_14
#_0BECEA: dw Message_03_07_15
#_0BECEC: dw Message_03_07_16
#_0BECEE: dw Message_03_07_17
#_0BECF0: dw Message_03_07_18
#_0BECF2: dw Message_03_07_19
#_0BECF4: dw Message_03_07_1A
#_0BECF6: dw Message_03_07_1B
#_0BECF8: dw Message_03_07_1C
#_0BECFA: dw Message_03_07_1D
#_0BECFC: dw Message_03_07_1E
#_0BECFE: dw Message_03_07_1F
#_0BED00: dw Message_03_07_20
#_0BED02: dw Message_03_07_21
#_0BED04: dw Message_03_07_22
#_0BED06: dw Message_03_07_23
#_0BED08: dw Message_03_07_24
#_0BED0A: dw Message_03_07_25
#_0BED0C: dw Message_03_07_26
#_0BED0E: dw Message_03_07_27
#_0BED10: dw Message_03_07_28
#_0BED12: dw Message_03_07_29
#_0BED14: dw Message_03_07_2A
#_0BED16: dw Message_03_07_2B
#_0BED18: dw Message_03_07_2C
#_0BED1A: dw Message_03_07_2D
#_0BED1C: dw Message_03_07_2E
#_0BED1E: dw Message_03_07_2F
#_0BED20: dw Message_03_07_30
#_0BED22: dw Message_03_07_31
#_0BED24: dw Message_03_07_32
#_0BED26: dw Message_03_07_33
#_0BED28: dw Message_03_07_34
#_0BED2A: dw Message_03_07_35
#_0BED2C: dw Message_03_07_36
#_0BED2E: dw Message_03_07_37
#_0BED30: dw Message_03_07_38
#_0BED32: dw Message_03_07_39
#_0BED34: dw Message_03_07_3A
#_0BED36: dw Message_03_07_3B
#_0BED38: dw Message_03_07_3C
#_0BED3A: dw Message_03_07_3D
#_0BED3C: dw Message_03_07_3E
#_0BED3E: dw Message_03_07_3F
#_0BED40: dw Message_03_07_40
#_0BED42: dw Message_03_07_41
#_0BED44: dw Message_03_07_42
#_0BED46: dw Message_03_07_43
#_0BED48: dw Message_03_07_44
#_0BED4A: dw Message_03_07_45
#_0BED4C: dw Message_03_07_46
#_0BED4E: dw Message_03_07_47
#_0BED50: dw Message_03_07_48
#_0BED52: dw Message_03_07_49
#_0BED54: dw Message_03_07_4A
#_0BED56: dw Message_03_07_4B
#_0BED58: dw Message_03_07_4C
#_0BED5A: dw Message_03_07_4D
#_0BED5C: dw Message_03_07_4E
#_0BED5E: dw Message_03_07_4F
#_0BED60: dw Message_03_07_50
#_0BED62: dw Message_03_07_51
#_0BED64: dw Message_03_07_52

;===================================================================================================

Message_03_08_Pointers:
#_0BED66: dw Message_03_08_00
#_0BED68: dw Message_03_08_01
#_0BED6A: dw Message_03_08_02
#_0BED6C: dw Message_03_08_03
#_0BED6E: dw Message_03_08_04
#_0BED70: dw Message_03_08_05
#_0BED72: dw Message_03_08_06
#_0BED74: dw Message_03_08_07
#_0BED76: dw Message_03_08_08
#_0BED78: dw Message_03_08_09
#_0BED7A: dw Message_03_08_0A
#_0BED7C: dw Message_03_08_0B
#_0BED7E: dw Message_03_08_0C
#_0BED80: dw Message_03_08_0D
#_0BED82: dw Message_03_08_0E
#_0BED84: dw Message_03_08_0F
#_0BED86: dw Message_03_08_10
#_0BED88: dw Message_03_08_11
#_0BED8A: dw Message_03_08_12
#_0BED8C: dw Message_03_08_13
#_0BED8E: dw Message_03_08_14
#_0BED90: dw Message_03_08_15
#_0BED92: dw Message_03_08_16
#_0BED94: dw Message_03_08_17
#_0BED96: dw Message_03_08_18
#_0BED98: dw Message_03_08_19
#_0BED9A: dw Message_03_08_1A
#_0BED9C: dw Message_03_08_1B
#_0BED9E: dw Message_03_08_1C
#_0BEDA0: dw Message_03_08_1D
#_0BEDA2: dw Message_03_08_1E
#_0BEDA4: dw Message_03_08_1F
#_0BEDA6: dw Message_03_08_20

;===================================================================================================

Message_03_09_Pointers:
#_0BEDA8: dw Message_03_09_00
#_0BEDAA: dw Message_03_09_01
#_0BEDAC: dw Message_03_09_02
#_0BEDAE: dw Message_03_09_03
#_0BEDB0: dw Message_03_09_04
#_0BEDB2: dw Message_03_09_05
#_0BEDB4: dw Message_03_09_06
#_0BEDB6: dw Message_03_09_07
#_0BEDB8: dw Message_03_09_08
#_0BEDBA: dw Message_03_09_09
#_0BEDBC: dw Message_03_09_0A
#_0BEDBE: dw Message_03_09_0B
#_0BEDC0: dw Message_03_09_0C
#_0BEDC2: dw Message_03_09_0D
#_0BEDC4: dw Message_03_09_0E
#_0BEDC6: dw Message_03_09_0F
#_0BEDC8: dw Message_03_09_10
#_0BEDCA: dw Message_03_09_11
#_0BEDCC: dw Message_03_09_12
#_0BEDCE: dw Message_03_09_13
#_0BEDD0: dw Message_03_09_14
#_0BEDD2: dw Message_03_09_15
#_0BEDD4: dw Message_03_09_16
#_0BEDD6: dw Message_03_09_17
#_0BEDD8: dw Message_03_09_18
#_0BEDDA: dw Message_03_09_19
#_0BEDDC: dw Message_03_09_1A
#_0BEDDE: dw Message_03_09_1B

;===================================================================================================

Message_03_0A_Pointers:
#_0BEDE0: dw Message_03_0A_00
#_0BEDE2: dw Message_03_0A_01
#_0BEDE4: dw Message_03_0A_02
#_0BEDE6: dw Message_03_0A_03

;===================================================================================================

Message_03_00_Pointers:
#_0BEDE8: dw Message_03_00_00
#_0BEDEA: dw Message_03_00_01
#_0BEDEC: dw Message_03_00_02
#_0BEDEE: dw Message_03_00_03
#_0BEDF0: dw Message_03_00_04
#_0BEDF2: dw Message_03_00_05
#_0BEDF4: dw Message_03_00_06
#_0BEDF6: dw Message_03_00_07
#_0BEDF8: dw Message_03_00_08
#_0BEDFA: dw Message_03_00_09
#_0BEDFC: dw Message_03_00_0A
#_0BEDFE: dw Message_03_00_0B
#_0BEE00: dw Message_03_00_0C
#_0BEE02: dw Message_03_00_0D
#_0BEE04: dw Message_03_00_0E
#_0BEE06: dw Message_03_00_0F
#_0BEE08: dw Message_03_00_10
#_0BEE0A: dw Message_03_00_11
#_0BEE0C: dw Message_03_00_12
#_0BEE0E: dw Message_03_00_13
#_0BEE10: dw Message_03_00_14
#_0BEE12: dw Message_03_00_15
#_0BEE14: dw Message_03_00_16
#_0BEE16: dw Message_03_00_17
#_0BEE18: dw Message_03_00_18
#_0BEE1A: dw Message_03_00_19
#_0BEE1C: dw Message_03_00_1A
#_0BEE1E: dw Message_03_00_1B
#_0BEE20: dw Message_03_00_1C
#_0BEE22: dw Message_03_00_1D
#_0BEE24: dw Message_03_00_1E
#_0BEE26: dw Message_03_00_1F
#_0BEE28: dw Message_03_00_20
#_0BEE2A: dw Message_03_00_21
#_0BEE2C: dw Message_03_00_22
#_0BEE2E: dw Message_03_00_23
#_0BEE30: dw Message_03_00_24
#_0BEE32: dw Message_03_00_25
#_0BEE34: dw Message_03_00_26
#_0BEE36: dw Message_03_00_27
#_0BEE38: dw Message_03_00_28
#_0BEE3A: dw Message_03_00_29
#_0BEE3C: dw Message_03_00_2A
#_0BEE3E: dw Message_03_00_2B
#_0BEE40: dw Message_03_00_2C
#_0BEE42: dw Message_03_00_2D
#_0BEE44: dw Message_03_00_2E
#_0BEE46: dw Message_03_00_2F
#_0BEE48: dw Message_03_00_30
#_0BEE4A: dw Message_03_00_31
#_0BEE4C: dw Message_03_00_32
#_0BEE4E: dw Message_03_00_33
#_0BEE50: dw Message_03_00_34
#_0BEE52: dw Message_03_00_35
#_0BEE54: dw Message_03_00_36
#_0BEE56: dw Message_03_00_37
#_0BEE58: dw Message_03_00_38
#_0BEE5A: dw Message_03_00_39
#_0BEE5C: dw Message_03_00_3A
#_0BEE5E: dw Message_03_00_3B
#_0BEE60: dw Message_03_00_3C
#_0BEE62: dw Message_03_00_3D
#_0BEE64: dw Message_03_00_3E
#_0BEE66: dw Message_03_00_3F
#_0BEE68: dw Message_03_00_40
#_0BEE6A: dw Message_03_00_41
#_0BEE6C: dw Message_03_00_42
#_0BEE6E: dw Message_03_00_43
#_0BEE70: dw Message_03_00_44
#_0BEE72: dw Message_03_00_45
#_0BEE74: dw Message_03_00_46
#_0BEE76: dw Message_03_00_47
#_0BEE78: dw Message_03_00_48
#_0BEE7A: dw Message_03_00_49
#_0BEE7C: dw Message_03_00_4A
#_0BEE7E: dw Message_03_00_4B
#_0BEE80: dw Message_03_00_4C
#_0BEE82: dw Message_03_00_4D
#_0BEE84: dw Message_03_00_4E
#_0BEE86: dw Message_03_00_4F
#_0BEE88: dw Message_03_00_50
#_0BEE8A: dw Message_03_00_51
#_0BEE8C: dw Message_03_00_52
#_0BEE8E: dw Message_03_00_53
#_0BEE90: dw Message_03_00_54
#_0BEE92: dw Message_03_00_54
#_0BEE94: dw Message_03_00_56
#_0BEE96: dw Message_03_00_56
#_0BEE98: dw Message_03_00_58
#_0BEE9A: dw Message_03_00_58
#_0BEE9C: dw Message_03_00_5A
#_0BEE9E: dw Message_03_00_5B
#_0BEEA0: dw Message_03_00_5C
#_0BEEA2: dw Message_03_00_5D
#_0BEEA4: dw Message_03_00_5E
#_0BEEA6: dw Message_03_00_5F
#_0BEEA8: dw Message_03_00_60
#_0BEEAA: dw Message_03_00_61
#_0BEEAC: dw Message_03_00_62
#_0BEEAE: dw Message_03_00_63
#_0BEEB0: dw Message_03_00_64
#_0BEEB2: dw Message_03_00_65
#_0BEEB4: dw Message_03_00_66
#_0BEEB6: dw Message_03_00_67
#_0BEEB8: dw Message_03_00_68
#_0BEEBA: dw Message_03_00_69
#_0BEEBC: dw Message_03_00_6A
#_0BEEBE: dw Message_03_00_6B
#_0BEEC0: dw Message_03_00_6C
#_0BEEC2: dw Message_03_00_6D
#_0BEEC4: dw Message_03_00_6E
#_0BEEC6: dw Message_03_00_6F
#_0BEEC8: dw Message_03_00_70
#_0BEECA: dw Message_03_00_71
#_0BEECC: dw Message_03_00_72
#_0BEECE: dw Message_03_00_73
#_0BEED0: dw Message_03_00_74
#_0BEED2: dw Message_03_00_75
#_0BEED4: dw Message_03_00_76
#_0BEED6: dw Message_03_00_77
#_0BEED8: dw Message_03_00_78
#_0BEEDA: dw Message_03_00_79
#_0BEEDC: dw Message_03_00_7A
#_0BEEDE: dw Message_03_00_7B
#_0BEEE0: dw Message_03_00_7C
#_0BEEE2: dw Message_03_00_7D
#_0BEEE4: dw Message_03_00_7E
#_0BEEE6: dw Message_03_00_7F
#_0BEEE8: dw Message_03_00_80
#_0BEEEA: dw Message_03_00_80
#_0BEEEC: dw Message_03_00_80
#_0BEEEE: dw Message_03_00_80
#_0BEEF0: dw Message_03_00_80
#_0BEEF2: dw Message_03_00_80
#_0BEEF4: dw Message_03_00_86
#_0BEEF6: dw Message_03_00_87
#_0BEEF8: dw Message_03_00_88
#_0BEEFA: dw Message_03_00_89
#_0BEEFC: dw Message_03_00_8A
#_0BEEFE: dw Message_03_00_8A
#_0BEF00: dw Message_03_00_8C
#_0BEF02: dw Message_03_00_8D
#_0BEF04: dw Message_03_00_8E
#_0BEF06: dw Message_03_00_8E
#_0BEF08: dw Message_03_00_90
#_0BEF0A: dw Message_03_00_90
#_0BEF0C: dw Message_03_00_92
#_0BEF0E: dw Message_03_00_92
#_0BEF10: dw Message_03_00_94
#_0BEF12: dw Message_03_00_95
#_0BEF14: dw Message_03_00_96
#_0BEF16: dw Message_03_00_97
#_0BEF18: dw Message_03_00_98
#_0BEF1A: dw Message_03_00_99
#_0BEF1C: dw Message_03_00_9A
#_0BEF1E: dw Message_03_00_9B
#_0BEF20: dw Message_03_00_9C
#_0BEF22: dw Message_03_00_9D
#_0BEF24: dw Message_03_00_9E
#_0BEF26: dw Message_03_00_9F
#_0BEF28: dw Message_03_00_A0
#_0BEF2A: dw Message_03_00_A1
#_0BEF2C: dw Message_03_00_A2
#_0BEF2E: dw Message_03_00_A3
#_0BEF30: dw Message_03_00_A4
#_0BEF32: dw Message_03_00_A4
#_0BEF34: dw Message_03_00_A6
#_0BEF36: dw Message_03_00_A7
#_0BEF38: dw Message_03_00_A8
#_0BEF3A: dw Message_03_00_A9
#_0BEF3C: dw Message_03_00_AA
#_0BEF3E: dw Message_03_00_AB
#_0BEF40: dw Message_03_00_AC
#_0BEF42: dw Message_03_00_AD
#_0BEF44: dw Message_03_00_AE
#_0BEF46: dw Message_03_00_AF
#_0BEF48: dw Message_03_00_B0
#_0BEF4A: dw Message_03_00_B0
#_0BEF4C: dw Message_03_00_B0
#_0BEF4E: dw Message_03_00_B0
#_0BEF50: dw Message_03_00_B4
#_0BEF52: dw Message_03_00_B5
#_0BEF54: dw Message_03_00_B5
#_0BEF56: dw Message_03_00_B5
#_0BEF58: dw Message_03_00_B8
#_0BEF5A: dw Message_03_00_B8
#_0BEF5C: dw Message_03_00_BA
#_0BEF5E: dw Message_03_00_BB
#_0BEF60: dw Message_03_00_BC
#_0BEF62: dw Message_03_00_BD
#_0BEF64: dw Message_03_00_BE
#_0BEF66: dw Message_03_00_BF
#_0BEF68: dw Message_03_00_C0
#_0BEF6A: dw Message_03_00_C1
#_0BEF6C: dw Message_03_00_C2
#_0BEF6E: dw Message_03_00_C3
#_0BEF70: dw Message_03_00_C4
#_0BEF72: dw Message_03_00_C5
#_0BEF74: dw Message_03_00_C6
#_0BEF76: dw Message_03_00_C7
#_0BEF78: dw Message_03_00_C8
#_0BEF7A: dw Message_03_00_C9
#_0BEF7C: dw Message_03_00_CA
#_0BEF7E: dw Message_03_00_CB
#_0BEF80: dw Message_03_00_CC
#_0BEF82: dw Message_03_00_CD
#_0BEF84: dw Message_03_00_CE
#_0BEF86: dw Message_03_00_CF
#_0BEF88: dw Message_03_00_D0
#_0BEF8A: dw Message_03_00_D1
#_0BEF8C: dw Message_03_00_D2
#_0BEF8E: dw Message_03_00_D3
#_0BEF90: dw Message_03_00_D4
#_0BEF92: dw Message_03_00_D5
#_0BEF94: dw Message_03_00_D6
#_0BEF96: dw Message_03_00_D7
#_0BEF98: dw Message_03_00_D8
#_0BEF9A: dw Message_03_00_D9
#_0BEF9C: dw Message_03_00_DA
#_0BEF9E: dw Message_03_00_DB
#_0BEFA0: dw Message_03_00_DC
#_0BEFA2: dw Message_03_00_DC
#_0BEFA4: dw Message_03_00_DE
#_0BEFA6: dw Message_03_00_DF
#_0BEFA8: dw Message_03_00_E0
#_0BEFAA: dw Message_03_00_E1
#_0BEFAC: dw Message_03_00_E2
#_0BEFAE: dw Message_03_00_E3
#_0BEFB0: dw Message_03_00_E4
#_0BEFB2: dw Message_03_00_E5
#_0BEFB4: dw Message_03_00_E6
#_0BEFB6: dw Message_03_00_E7

;===================================================================================================

Message_03_01_Pointers:
#_0BEFB8: dw Message_03_01_00
#_0BEFBA: dw Message_03_01_01
#_0BEFBC: dw Message_03_01_02
#_0BEFBE: dw Message_03_01_03
#_0BEFC0: dw Message_03_01_04
#_0BEFC2: dw Message_03_01_05
#_0BEFC4: dw Message_03_01_06
#_0BEFC6: dw Message_03_01_07
#_0BEFC8: dw Message_03_01_08
#_0BEFCA: dw Message_03_01_09
#_0BEFCC: dw Message_03_01_0A
#_0BEFCE: dw Message_03_01_0B
#_0BEFD0: dw Message_03_01_0C
#_0BEFD2: dw Message_03_01_0D
#_0BEFD4: dw Message_03_01_0E
#_0BEFD6: dw Message_03_01_0F
#_0BEFD8: dw Message_03_01_10
#_0BEFDA: dw Message_03_01_11
#_0BEFDC: dw Message_03_01_12
#_0BEFDE: dw Message_03_01_13
#_0BEFE0: dw Message_03_01_14
#_0BEFE2: dw Message_03_01_15
#_0BEFE4: dw Message_03_01_16
#_0BEFE6: dw Message_03_01_17
#_0BEFE8: dw Message_03_01_18
#_0BEFEA: dw Message_03_01_19
#_0BEFEC: dw Message_03_01_1A
#_0BEFEE: dw Message_03_01_1B
#_0BEFF0: dw Message_03_01_1C
#_0BEFF2: dw Message_03_01_1D
#_0BEFF4: dw Message_03_01_1E
#_0BEFF6: dw Message_03_01_1F
#_0BEFF8: dw Message_03_01_20
#_0BEFFA: dw Message_03_01_21
#_0BEFFC: dw Message_03_01_22
#_0BEFFE: dw Message_03_01_23
#_0BF000: dw Message_03_01_24
#_0BF002: dw Message_03_01_25
#_0BF004: dw Message_03_01_26
#_0BF006: dw Message_03_01_27
#_0BF008: dw Message_03_01_28
#_0BF00A: dw Message_03_01_29
#_0BF00C: dw Message_03_01_2A
#_0BF00E: dw Message_03_01_2B
#_0BF010: dw Message_03_01_2C
#_0BF012: dw Message_03_01_2D
#_0BF014: dw Message_03_01_2E
#_0BF016: dw Message_03_01_2F
#_0BF018: dw Message_03_01_30
#_0BF01A: dw Message_03_01_31
#_0BF01C: dw Message_03_01_32
#_0BF01E: dw Message_03_01_33
#_0BF020: dw Message_03_01_34
#_0BF022: dw Message_03_01_35
#_0BF024: dw Message_03_01_36
#_0BF026: dw Message_03_01_37
#_0BF028: dw Message_03_01_38
#_0BF02A: dw Message_03_01_39

;===================================================================================================

; コンピュータ さどう
Message_03_00_00:
#_0BF02C: db $FA ; clear message box
#_0BF02D: db $66, $8A, $CA, $90, $5A, $6C, $CF, $2F ; コンピュータ⎵さ
#_0BF035: db $AA, $27 ; どう
#_0BF037: db $F9 ; new line
#_0BF038: db $FF ; end of message

;===================================================================================================

; コンピュータを つかえるじょうたいでは ない
Message_03_00_01:
#_0BF039: db $66, $8A, $CA, $90, $5A, $6C, $51, $CF ; コンピュータを⎵
#_0BF041: db $36, $2A, $28, $4D, $A2, $57, $27, $34 ; つかえるじょうた
#_0BF049: db $26, $A9, $3E, $CF, $39, $26 ; いでは⎵ない
#_0BF04F: db $FC ; wait for key and new line
#_0BF050: db $FF ; end of message

;===================================================================================================

; コンピュータ システム エラー
Message_03_00_02:
#_0BF051: db $66, $8A, $CA, $90, $5A, $6C, $CF, $68 ; コンピュータ⎵シ
#_0BF059: db $69, $6F, $7D, $CF, $60, $83, $5A ; ステム⎵エラー
#_0BF060: db $FC ; wait for key and new line
#_0BF061: db $FF ; end of message

;===================================================================================================

; ここでは コンピュータを つかえない
Message_03_00_03:
#_0BF062: db $2E, $2E, $A9, $3E, $CF, $66, $8A, $CA ; ここでは⎵コンピ
#_0BF06A: db $90, $5A, $6C, $51, $CF, $36, $2A, $28 ; ュータを⎵つかえ
#_0BF072: db $39, $26 ; ない
#_0BF074: db $FC ; wait for key and new line
#_0BF075: db $FF ; end of message

;===================================================================================================

; どうしますか?
;  つかう
;  そうびする
;  すてる
Message_03_00_04:
#_0BF076: db $FA ; clear message box
#_0BF077: db $AA, $27, $30, $43, $31, $2A, $95 ; どうしますか?
#_0BF07E: db $F9 ; new line
#_0BF07F: db $CF, $36, $2A, $27 ; ⎵つかう
#_0BF083: db $F9 ; new line
#_0BF084: db $CF, $33, $27, $AC, $31, $4D ; ⎵そうびする
#_0BF08A: db $F9 ; new line
#_0BF08B: db $CF, $31, $37, $4D ; ⎵すてる
#_0BF08F: db $FF ; end of message

;===================================================================================================

; マッパーの こうかが なくなった
Message_03_00_05:
#_0BF090: db $7B, $92, $C9, $5A, $3D, $CF, $2E, $27 ; マッパーの⎵こう
#_0BF098: db $2A, $9C, $CF, $39, $2C, $39, $58, $34 ; かが⎵なくなった
#_0BF0A0: db $FC ; wait for key and new line
#_0BF0A1: db $FF ; end of message

;===================================================================================================

; コアシールドの こうかが なくなった
Message_03_00_06:
#_0BF0A2: db $66, $5D, $68, $5A, $85, $C3, $3D, $CF ; コアシールドの⎵
#_0BF0AA: db $2E, $27, $2A, $9C, $CF, $39, $2C, $39 ; こうかが⎵なくな
#_0BF0B2: db $58, $34 ; った
#_0BF0B4: db $FC ; wait for key and new line
#_0BF0B5: db $FF ; end of message

;===================================================================================================

; アムレットの こうかが なくなった
Message_03_00_07:
#_0BF0B6: db $5D, $7D, $86, $92, $70, $3D, $CF, $2E ; アムレットの⎵こ
#_0BF0BE: db $27, $2A, $9C, $CF, $39, $2C, $39, $58 ; うかが⎵なくなっ
#_0BF0C6: db $34 ; た
#_0BF0C7: db $FC ; wait for key and new line
#_0BF0C8: db $FF ; end of message

;===================================================================================================

; だれに しますか?  
Message_03_00_08:
#_0BF0C9: db $A6, $4E, $3A, $CF, $30, $43, $31, $2A ; だれに⎵しますか
#_0BF0D1: db $95, $CF, $CF ; ?⎵⎵
#_0BF0D4: db $FF ; end of message

;===================================================================================================

; ここでは つかえない
Message_03_00_09:
#_0BF0D5: db $FA ; clear message box
#_0BF0D6: db $2E, $2E, $A9, $3E, $CF, $36, $2A, $28 ; ここでは⎵つかえ
#_0BF0DE: db $39, $26 ; ない
#_0BF0E0: db $FC ; wait for key and new line
#_0BF0E1: db $FF ; end of message

;===================================================================================================

;  ナカマを よびだす
Message_03_00_0A:
#_0BF0E2: db $CF, $71, $62, $7B, $51, $CF, $4A, $AC ; ⎵ナカマを⎵よび
#_0BF0EA: db $A6, $31 ; だす
#_0BF0EC: db $F9 ; new line
#_0BF0ED: db $FF ; end of message

;===================================================================================================

;  ナカマを もどす
Message_03_00_0B:
#_0BF0EE: db $CF, $71, $62, $7B, $51, $CF, $47, $AA ; ⎵ナカマを⎵もど
#_0BF0F6: db $31 ; す
#_0BF0F7: db $F9 ; new line
#_0BF0F8: db $FF ; end of message

;===================================================================================================

;  ナカマを はずす
Message_03_00_0C:
#_0BF0F9: db $CF, $71, $62, $7B, $51, $CF, $3E, $A3 ; ⎵ナカマを⎵はず
#_0BF101: db $31 ; す
#_0BF102: db $F9 ; new line
#_0BF103: db $FF ; end of message

;===================================================================================================

;  いちがえを する
Message_03_00_0D:
#_0BF104: db $CF, $26, $35, $9C, $28, $51, $CF, $31 ; ⎵いちがえを⎵す
#_0BF10C: db $4D ; る
#_0BF10D: db $F9 ; new line
#_0BF10E: db $FF ; end of message

;===================================================================================================

;  オートマッピング
Message_03_00_0E:
#_0BF10F: db $CF, $61, $5A, $70, $7B, $92, $CA, $8A ; ⎵オートマッピン
#_0BF117: db $B7 ; グ
#_0BF118: db $F9 ; new line
#_0BF119: db $FF ; end of message

;===================================================================================================

;  デビルアナライズ
Message_03_00_0F:
#_0BF11A: db $CF, $C2, $C5, $85, $5D, $71, $83, $5E ; ⎵デビルアナライ
#_0BF122: db $BC ; ズ
#_0BF123: db $FF ; end of message

;===================================================================================================

; NO DATA
Message_03_00_10:
#_0BF124: db $FA ; clear message box
#_0BF125: db $18, $19, $CF, $0E, $0B, $1E, $0B ; NO⎵DATA
#_0BF12C: db $FC ; wait for key and new line
#_0BF12D: db $FF ; end of message

;===================================================================================================

; NO DATA
Message_03_00_11:
#_0BF12E: db $18, $19, $CF, $0E, $0B, $1E, $0B ; NO⎵DATA
#_0BF135: db $FC ; wait for key and new line
#_0BF136: db $FF ; end of message

;===================================================================================================

; アナライズ できない
Message_03_00_12:
#_0BF137: db $5D, $71, $83, $5E, $BC, $CF, $A9, $2B ; アナライズ⎵でき
#_0BF13F: db $39, $26 ; ない
#_0BF141: db $FC ; wait for key and new line
#_0BF142: db $FF ; end of message

;===================================================================================================

; いちがえを してください
Message_03_00_13:
#_0BF143: db $FA ; clear message box
#_0BF144: db $26, $35, $9C, $28, $51, $CF, $30, $37 ; いちがえを⎵して
#_0BF14C: db $2C, $A6, $2F, $26 ; ください
#_0BF150: db $FF ; end of message

;===================================================================================================

; だれを よびだしますか?
Message_03_00_14:
#_0BF151: db $FA ; clear message box
#_0BF152: db $A6, $4E, $51, $CF, $4A, $AC, $A6, $30 ; だれを⎵よびだし
#_0BF15A: db $43, $31, $2A, $95 ; ますか?
#_0BF15E: db $FF ; end of message

;===================================================================================================

; だれを もどしますか?
Message_03_00_15:
#_0BF15F: db $FA ; clear message box
#_0BF160: db $A6, $4E, $51, $CF, $47, $AA, $30, $43 ; だれを⎵もどしま
#_0BF168: db $31, $2A, $95 ; すか?
#_0BF16B: db $FF ; end of message

;===================================================================================================

; だれを はずしますか?
Message_03_00_16:
#_0BF16C: db $FA ; clear message box
#_0BF16D: db $A6, $4E, $51, $CF, $3E, $A3, $30, $43 ; だれを⎵はずしま
#_0BF175: db $31, $2A, $95 ; すか?
#_0BF178: db $FF ; end of message

;===================================================================================================

; どこに よびだしますか?
Message_03_00_17:
#_0BF179: db $FA ; clear message box
#_0BF17A: db $AA, $2E, $3A, $CF, $4A, $AC, $A6, $30 ; どこに⎵よびだし
#_0BF182: db $43, $31, $2A, $95 ; ますか?
#_0BF186: db $FF ; end of message

;===================================================================================================

; パーティが いっぱいです
; だれと かわりますか?
Message_03_00_18:
#_0BF187: db $FA ; clear message box
#_0BF188: db $C9, $5A, $6F, $8C, $9C, $CF, $26, $58 ; パーティが⎵いっ
#_0BF190: db $B0, $26, $A9, $31 ; ぱいです
#_0BF194: db $FC ; wait for key and new line
#_0BF195: db $FA ; clear message box
#_0BF196: db $A6, $4E, $38, $CF, $2A, $50, $4C, $43 ; だれと⎵かわりま
#_0BF19E: db $31, $2A, $95 ; すか?
#_0BF1A1: db $FF ; end of message

;===================================================================================================

; よびだせる ナカマは いない
Message_03_00_19:
#_0BF1A2: db $FA ; clear message box
#_0BF1A3: db $4A, $AC, $A6, $32, $4D, $CF, $71, $62 ; よびだせる⎵ナカ
#_0BF1AB: db $7B, $3E, $CF, $26, $39, $26 ; マは⎵いない
#_0BF1B1: db $FC ; wait for key and new line
#_0BF1B2: db $FF ; end of message

;===================================================================================================

; もどせる ナカマは いない
Message_03_00_1A:
#_0BF1B3: db $FA ; clear message box
#_0BF1B4: db $47, $AA, $32, $4D, $CF, $71, $62, $7B ; もどせる⎵ナカマ
#_0BF1BC: db $3E, $CF, $26, $39, $26 ; は⎵いない
#_0BF1C1: db $FC ; wait for key and new line
#_0BF1C2: db $FF ; end of message

;===================================================================================================

; はずせる ナカマは いない
Message_03_00_1B:
#_0BF1C3: db $FA ; clear message box
#_0BF1C4: db $3E, $A3, $32, $4D, $CF, $71, $62, $7B ; はずせる⎵ナカマ
#_0BF1CC: db $3E, $CF, $26, $39, $26 ; は⎵いない
#_0BF1D1: db $FC ; wait for key and new line
#_0BF1D2: db $FF ; end of message

;===================================================================================================

; そのナカマは はずせない
Message_03_00_1C:
#_0BF1D3: db $FA ; clear message box
#_0BF1D4: db $33, $3D, $71, $62, $7B, $3E, $CF, $3E ; そのナカマは⎵は
#_0BF1DC: db $A3, $32, $39, $26 ; ずせない
#_0BF1E0: db $FC ; wait for key and new line
#_0BF1E1: db $FF ; end of message

;===================================================================================================

; [NAME2]を はずします よろしいですか?
Message_03_00_1D:
#_0BF1E2: db $FA ; clear message box
#_0BF1E3: db $EC ; write someone's name
#_0BF1E4: db $51, $CF, $3E, $A3, $30, $43, $31, $CF ; を⎵はずします⎵
#_0BF1EC: db $4A, $4F, $30, $26, $A9, $31, $2A, $95 ; よろしいですか?
#_0BF1F4: db $F8, $1E ; YES/NO - go to message 1E if YES

;===================================================================================================

Message_03_00_1E:
#_0BF1F6: db $FF ; end of message

;===================================================================================================

; いちがえ できない
Message_03_00_1F:
#_0BF1F7: db $FA ; clear message box
#_0BF1F8: db $26, $35, $9C, $28, $CF, $A9, $2B, $39 ; いちがえ⎵できな
#_0BF200: db $26 ; い
#_0BF201: db $FC ; wait for key and new line
#_0BF202: db $FF ; end of message

;===================================================================================================

; もっていない
Message_03_00_20:
#_0BF203: db $FA ; clear message box
#_0BF204: db $47, $58, $37, $26, $39, $26 ; もっていない
#_0BF20A: db $FC ; wait for key and new line
#_0BF20B: db $FF ; end of message

;===================================================================================================

; つかえるアイテムは もっていない
Message_03_00_21:
#_0BF20C: db $36, $2A, $28, $4D, $5D, $5E, $6F, $7D ; つかえるアイテム
#_0BF214: db $3E, $CF, $47, $58, $37, $26, $39, $26 ; は⎵もっていない
#_0BF21C: db $FC ; wait for key and new line
#_0BF21D: db $FF ; end of message

;===================================================================================================

; だれも つかえない
Message_03_00_22:
#_0BF21E: db $A6, $4E, $47, $CF, $36, $2A, $28, $39 ; だれも⎵つかえな
#_0BF226: db $26 ; い
#_0BF227: db $FC ; wait for key and new line
#_0BF228: db $FF ; end of message

;===================================================================================================

; そうびできるアイテムは もっていない
Message_03_00_23:
#_0BF229: db $FA ; clear message box
#_0BF22A: db $33, $27, $AC, $A9, $2B, $4D, $5D, $5E ; そうびできるアイ
#_0BF232: db $6F, $7D, $3E, $CF, $47, $58, $37, $26 ; テムは⎵もってい
#_0BF23A: db $39, $26 ; ない
#_0BF23C: db $FC ; wait for key and new line
#_0BF23D: db $FF ; end of message

;===================================================================================================

; だれに そうびしますか?
Message_03_00_24:
#_0BF23E: db $FA ; clear message box
#_0BF23F: db $A6, $4E, $3A, $CF, $33, $27, $AC, $30 ; だれに⎵そうびし
#_0BF247: db $43, $31, $2A, $95 ; ますか?
#_0BF24B: db $FF ; end of message

;===================================================================================================

; どのアイテムを つかいますか?
Message_03_00_25:
#_0BF24C: db $FA ; clear message box
#_0BF24D: db $AA, $3D, $5D, $5E, $6F, $7D, $51, $CF ; どのアイテムを⎵
#_0BF255: db $36, $2A, $26, $43, $31, $2A, $95 ; つかいますか?
#_0BF25C: db $FF ; end of message

;===================================================================================================

; どのアイテムを すてますか?
Message_03_00_26:
#_0BF25D: db $FA ; clear message box
#_0BF25E: db $AA, $3D, $5D, $5E, $6F, $7D, $51, $CF ; どのアイテムを⎵
#_0BF266: db $31, $37, $43, $31, $2A, $95 ; すてますか?
#_0BF26C: db $FF ; end of message

;===================================================================================================

; アイテムが いっぱいです
; なにか すててください
Message_03_00_27:
#_0BF26D: db $FA ; clear message box
#_0BF26E: db $5D, $5E, $6F, $7D, $9C, $CF, $26, $58 ; アイテムが⎵いっ
#_0BF276: db $B0, $26, $A9, $31 ; ぱいです
#_0BF27A: db $F9 ; new line
#_0BF27B: db $39, $3A, $2A, $CF, $31, $37, $37, $2C ; なにか⎵すててく
#_0BF283: db $A6, $2F, $26 ; ださい
#_0BF286: db $FC ; wait for key and new line
#_0BF287: db $FF ; end of message

;===================================================================================================

; [ITEM]を すてます よろしいですか?
Message_03_00_28:
#_0BF288: db $FA ; clear message box
#_0BF289: db $F3 ; write item name from $0A50
#_0BF28A: db $51, $CF, $31, $37, $43, $31, $CF, $4A ; を⎵すてます⎵よ
#_0BF292: db $4F, $30, $26, $A9, $31, $2A, $95 ; ろしいですか?
#_0BF299: db $F8, $29 ; YES/NO - go to message 29 if YES

;===================================================================================================

Message_03_00_29:
#_0BF29B: db $FF ; end of message

;===================================================================================================

; [NAME2]は [ITEM]をつかった
Message_03_00_2A:
#_0BF29C: db $EC ; write someone's name
#_0BF29D: db $3E, $CF ; は⎵
#_0BF29F: db $F3 ; write item name from $0A50
#_0BF2A0: db $51, $36, $2A, $58, $34 ; をつかった
#_0BF2A5: db $FC ; wait for key and new line
#_0BF2A6: db $FF ; end of message

;===================================================================================================

; だれに つかいますか?
Message_03_00_2B:
#_0BF2A7: db $FA ; clear message box
#_0BF2A8: db $A6, $4E, $3A, $CF, $36, $2A, $26, $43 ; だれに⎵つかいま
#_0BF2B0: db $31, $2A, $95 ; すか?
#_0BF2B3: db $FF ; end of message

;===================================================================================================

; しかし こうかがなかった
Message_03_00_2C:
#_0BF2B4: db $30, $2A, $30, $CF, $2E, $27, $2A, $9C ; しかし⎵こうかが
#_0BF2BC: db $39, $2A, $58, $34 ; なかった
#_0BF2C0: db $FC ; wait for key and new line
#_0BF2C1: db $FF ; end of message

;===================================================================================================

; [NAME2]の そぬがあっがた!!
Message_03_00_2D:
#_0BF2C2: db $FA ; clear message box
#_0BF2C3: db $EC ; write someone's name
#_0BF2C4: db $3D, $CF, $33, $3B, $9C, $25, $58, $9C ; の⎵そぬがあっが
#_0BF2CC: db $34, $94, $94 ; た!!
#_0BF2CF: db $FC ; wait for key and new line
#_0BF2D0: db $FF ; end of message

;===================================================================================================

; のぼりかいだんが あります
; のぼりますか?
Message_03_00_2E:
#_0BF2D1: db $3D, $AF, $4C, $2A, $26, $A6, $52, $9C ; のぼりかいだんが
#_0BF2D9: db $CF, $25, $4C, $43, $31 ; ⎵あります
#_0BF2DE: db $F9 ; new line
#_0BF2DF: db $3D, $AF, $4C, $43, $31, $2A, $95 ; のぼりますか?
#_0BF2E6: db $F8, $30 ; YES/NO - go to message 30 if YES
#_0BF2E8: db $FF ; end of message

;===================================================================================================

; くだりかいだんが あります
; おりますか?
Message_03_00_2F:
#_0BF2E9: db $2C, $A6, $4C, $2A, $26, $A6, $52, $9C ; くだりかいだんが
#_0BF2F1: db $CF, $25, $4C, $43, $31 ; ⎵あります
#_0BF2F6: db $F9 ; new line
#_0BF2F7: db $29, $4C, $43, $31, $2A, $95 ; おりますか?
#_0BF2FD: db $F8, $30 ; YES/NO - go to message 30 if YES

;===================================================================================================

Message_03_00_30:
#_0BF2FF: db $FF ; end of message

;===================================================================================================

; でぐちが あります
; そとへ でますか?
Message_03_00_31:
#_0BF300: db $A9, $9E, $35, $9C, $CF, $25, $4C, $43 ; でぐちが⎵ありま
#_0BF308: db $31 ; す
#_0BF309: db $F9 ; new line
#_0BF30A: db $33, $38, $41, $CF, $A9, $43, $31, $2A ; そとへ⎵でますか
#_0BF312: db $95 ; ?
#_0BF313: db $F8, $30 ; YES/NO - go to message 30 if YES
#_0BF315: db $FF ; end of message

;===================================================================================================

; たからばこが あります
; あけますか?
Message_03_00_32:
#_0BF316: db $34, $2A, $4B, $AB, $2E, $9C, $CF, $25 ; たからばこが⎵あ
#_0BF31E: db $4C, $43, $31 ; ります
#_0BF321: db $F9 ; new line
#_0BF322: db $25, $2D, $43, $31, $2A, $95 ; あけますか?
#_0BF328: db $F8, $30 ; YES/NO - go to message 30 if YES
#_0BF32A: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; たからばこを あきらめた
Message_03_00_33:
#_0BF32B: db $FA ; clear message box
#_0BF32C: db $F1 ; write leader's name for team
#_0BF32D: db $3E ; は
#_0BF32E: db $F9 ; new line
#_0BF32F: db $34, $2A, $4B, $AB, $2E, $51, $CF, $25 ; たからばこを⎵あ
#_0BF337: db $2B, $4B, $46, $34 ; きらめた
#_0BF33B: db $FC ; wait for key and new line
#_0BF33C: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]を みつけた
Message_03_00_34:
#_0BF33D: db $F1 ; write leader's name for team
#_0BF33E: db $3E ; は
#_0BF33F: db $F9 ; new line
#_0BF340: db $F3 ; write item name from $0A50
#_0BF341: db $51, $CF, $44, $36, $2D, $34 ; を⎵みつけた
#_0BF347: db $FC ; wait for key and new line
#_0BF348: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [LONG]の おかねを みつけた
Message_03_00_35:
#_0BF349: db $F1 ; write leader's name for team
#_0BF34A: db $3E ; は
#_0BF34B: db $F9 ; new line
#_0BF34C: db $FB ; write 32-bit integer from $0A54
#_0BF34D: db $3D, $CF, $29, $2A, $3C, $51, $CF, $44 ; の⎵おかねを⎵み
#_0BF355: db $36, $2D, $34 ; つけた
#_0BF358: db $FC ; wait for key and new line
#_0BF359: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [LONG]の マグネタイトを みつけた
Message_03_00_36:
#_0BF35A: db $F1 ; write leader's name for team
#_0BF35B: db $3E ; は
#_0BF35C: db $F9 ; new line
#_0BF35D: db $FB ; write 32-bit integer from $0A54
#_0BF35E: db $3D, $CF, $7B, $B7, $74, $6C, $5E, $70 ; の⎵マグネタイト
#_0BF366: db $51, $CF, $44, $36, $2D, $34 ; を⎵みつけた
#_0BF36C: db $FC ; wait for key and new line
#_0BF36D: db $FF ; end of message

;===================================================================================================

; [LEADER]は わなに かかった
Message_03_00_37:
#_0BF36E: db $F1 ; write leader's name for team
#_0BF36F: db $3E, $CF, $50, $39, $3A, $CF, $2A, $2A ; は⎵わなに⎵かか
#_0BF377: db $58, $34 ; った
#_0BF379: db $FC ; wait for key and new line
#_0BF37A: db $FF ; end of message

;===================================================================================================

; すでに なかみは からっぽだ
Message_03_00_38:
#_0BF37B: db $31, $A9, $3A, $CF, $39, $2A, $44, $3E ; すでに⎵なかみは
#_0BF383: db $CF, $2A, $4B, $58, $B4, $A6 ; ⎵からっぽだ
#_0BF389: db $FC ; wait for key and new line
#_0BF38A: db $FF ; end of message

;===================================================================================================

; しかし なかみは からっぽだった
Message_03_00_39:
#_0BF38B: db $30, $2A, $30, $CF, $39, $2A, $44, $3E ; しかし⎵なかみは
#_0BF393: db $CF, $2A, $4B, $58, $B4, $A6, $58, $34 ; ⎵からっぽだった
#_0BF39B: db $FC ; wait for key and new line
#_0BF39C: db $FF ; end of message

;===================================================================================================

; だれも まほうを つかえない
Message_03_00_3A:
#_0BF39D: db $FA ; clear message box
#_0BF39E: db $A6, $4E, $47, $CF, $43, $42, $27, $51 ; だれも⎵まほうを
#_0BF3A6: db $CF, $36, $2A, $28, $39, $26 ; ⎵つかえない
#_0BF3AC: db $FC ; wait for key and new line
#_0BF3AD: db $FF ; end of message

;===================================================================================================

; だれの まほうを つかいますか?
Message_03_00_3B:
#_0BF3AE: db $FA ; clear message box
#_0BF3AF: db $A6, $4E, $3D, $CF, $43, $42, $27, $51 ; だれの⎵まほうを
#_0BF3B7: db $CF, $36, $2A, $26, $43, $31, $2A, $95 ; ⎵つかいますか?
#_0BF3BF: db $FF ; end of message

;===================================================================================================

; どの まほうを つかいますか?
Message_03_00_3C:
#_0BF3C0: db $FA ; clear message box
#_0BF3C1: db $AA, $3D, $CF, $43, $42, $27, $51, $CF ; どの⎵まほうを⎵
#_0BF3C9: db $36, $2A, $26, $43, $31, $2A, $95 ; つかいますか?
#_0BF3D0: db $FF ; end of message

;===================================================================================================

; いまつかえる まほうは おぼえていない
Message_03_00_3D:
#_0BF3D1: db $26, $43, $36, $2A, $28, $4D, $CF, $43 ; いまつかえる⎵ま
#_0BF3D9: db $42, $27, $3E, $CF, $29, $AF, $28, $37 ; ほうは⎵おぼえて
#_0BF3E1: db $26, $39, $26 ; いない
#_0BF3E4: db $FC ; wait for key and new line
#_0BF3E5: db $FF ; end of message

;===================================================================================================

; [NAME2]の まほうは ふうじられている
Message_03_00_3E:
#_0BF3E6: db $EC ; write someone's name
#_0BF3E7: db $3D, $CF, $43, $42, $27, $3E, $CF, $40 ; の⎵まほうは⎵ふ
#_0BF3EF: db $27, $A2, $4B, $4E, $37, $26, $4D ; うじられている
#_0BF3F6: db $FC ; wait for key and new line
#_0BF3F7: db $FF ; end of message

;===================================================================================================

; [NAME2]は [SPELL]を となえた
Message_03_00_3F:
#_0BF3F8: db $EC ; write someone's name
#_0BF3F9: db $3E, $CF ; は⎵
#_0BF3FB: db $F4 ; write spell name from $0A52
#_0BF3FC: db $51, $CF, $38, $39, $28, $34 ; を⎵となえた
#_0BF402: db $FC ; wait for key and new line
#_0BF403: db $FF ; end of message

;===================================================================================================

; パーティが いっぱいで よべない
Message_03_00_40:
#_0BF404: db $C9, $5A, $6F, $8C, $9C, $CF, $26, $58 ; パーティが⎵いっ
#_0BF40C: db $B0, $26, $A9, $CF, $4A, $AE, $39, $26 ; ぱいで⎵よべない
#_0BF414: db $FC ; wait for key and new line
#_0BF415: db $FF ; end of message

;===================================================================================================

; だれも わるくない
Message_03_00_41:
#_0BF416: db $A6, $4E, $47, $CF, $50, $4D, $2C, $39 ; だれも⎵わるくな
#_0BF41E: db $26 ; い
#_0BF41F: db $FC ; wait for key and new line
#_0BF420: db $FF ; end of message

;===================================================================================================

; [NAME2]は かいふくした
Message_03_00_42:
#_0BF421: db $EC ; write someone's name
#_0BF422: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BF42A: db $FC ; wait for key and new line
#_0BF42B: db $FF ; end of message

;===================================================================================================

; しっぱいして しまった!!
Message_03_00_43:
#_0BF42C: db $30, $58, $B0, $26, $30, $37, $CF, $30 ; しっぱいして⎵し
#_0BF434: db $43, $58, $34, $94, $94 ; まった!!
#_0BF439: db $FC ; wait for key and new line
#_0BF43A: db $FF ; end of message

;===================================================================================================

; すでに きいている
Message_03_00_44:
#_0BF43B: db $31, $A9, $3A, $CF, $2B, $26, $37, $26 ; すでに⎵きいてい
#_0BF443: db $4D ; る
#_0BF444: db $FC ; wait for key and new line
#_0BF445: db $FF ; end of message

;===================================================================================================

; MPが たりない
Message_03_00_45:
#_0BF446: db $FA ; clear message box
#_0BF447: db $17, $1A, $9C, $CF, $34, $4C, $39, $26 ; MPが⎵たりない
#_0BF44F: db $FC ; wait for key and new line
#_0BF450: db $FF ; end of message

;===================================================================================================

; しまった MPが ない
Message_03_00_46:
#_0BF451: db $30, $43, $58, $34, $CF, $17, $1A, $9C ; しまった⎵MPが
#_0BF459: db $CF, $39, $26 ; ⎵ない
#_0BF45C: db $FC ; wait for key and new line
#_0BF45D: db $FF ; end of message

;===================================================================================================

; マグネタイトが なくなった
Message_03_00_47:
#_0BF45E: db $7B, $B7, $74, $6C, $5E, $70, $9C, $CF ; マグネタイトが⎵
#_0BF466: db $39, $2C, $39, $58, $34 ; なくなった
#_0BF46B: db $FC ; wait for key and new line
#_0BF46C: db $FF ; end of message

;===================================================================================================

; おかねが たりません
Message_03_00_48:
#_0BF46D: db $FA ; clear message box
#_0BF46E: db $29, $2A, $3C, $9C, $CF, $34, $4C, $43 ; おかねが⎵たりま
#_0BF476: db $32, $52 ; せん
#_0BF478: db $FC ; wait for key and new line
#_0BF479: db $FF ; end of message

;===================================================================================================

; ぞくせいが ちがうので よびだせない
Message_03_00_49:
#_0BF47A: db $FA ; clear message box
#_0BF47B: db $A5, $2C, $32, $26, $9C, $CF, $35, $9C ; ぞくせいが⎵ちが
#_0BF483: db $27, $3D, $A9, $CF, $4A, $AC, $A6, $32 ; うので⎵よびだせ
#_0BF48B: db $39, $26 ; ない
#_0BF48D: db $FC ; wait for key and new line
#_0BF48E: db $FF ; end of message

;===================================================================================================

; [NAME2]は のろいころされた
Message_03_00_4A:
#_0BF48F: db $EC ; write someone's name
#_0BF490: db $3E, $CF, $3D, $4F, $26, $2E, $4F, $2F ; は⎵のろいころさ
#_0BF498: db $4E, $34 ; れた
#_0BF49A: db $FC ; wait for key and new line
#_0BF49B: db $FF ; end of message

;===================================================================================================

; [NAME2]を のろいころした
Message_03_00_4B:
#_0BF49C: db $EC ; write someone's name
#_0BF49D: db $51, $CF, $3D, $4F, $26, $2E, $4F, $30 ; を⎵のろいころし
#_0BF4A5: db $34 ; た
#_0BF4A6: db $FC ; wait for key and new line
#_0BF4A7: db $FF ; end of message

;===================================================================================================

; [NAME2]は たおされた
Message_03_00_4C:
#_0BF4A8: db $EC ; write someone's name
#_0BF4A9: db $3E, $CF, $34, $29, $2F, $4E, $34 ; は⎵たおされた
#_0BF4B0: db $FC ; wait for key and new line
#_0BF4B1: db $FF ; end of message

;===================================================================================================

; [NAME2]を たおした
Message_03_00_4D:
#_0BF4B2: db $EC ; write someone's name
#_0BF4B3: db $51, $CF, $34, $29, $30, $34 ; を⎵たおした
#_0BF4B9: db $FC ; wait for key and new line
#_0BF4BA: db $FF ; end of message

;===================================================================================================

; [NAME2]は いしに された
Message_03_00_4E:
#_0BF4BB: db $EC ; write someone's name
#_0BF4BC: db $3E, $CF, $26, $30, $3A, $CF, $2F, $4E ; は⎵いしに⎵され
#_0BF4C4: db $34 ; た
#_0BF4C5: db $FC ; wait for key and new line
#_0BF4C6: db $FF ; end of message

;===================================================================================================

; [NAME2]を いしに した
Message_03_00_4F:
#_0BF4C7: db $EC ; write someone's name
#_0BF4C8: db $51, $CF, $26, $30, $3A, $CF, $30, $34 ; を⎵いしに⎵した
#_0BF4D0: db $FC ; wait for key and new line
#_0BF4D1: db $FF ; end of message

;===================================================================================================

; [NAME2]は からだが まひした
Message_03_00_50:
#_0BF4D2: db $EC ; write someone's name
#_0BF4D3: db $3E, $CF, $2A, $4B, $A6, $9C, $CF, $43 ; は⎵からだが⎵ま
#_0BF4DB: db $3F, $30, $34 ; ひした
#_0BF4DE: db $FC ; wait for key and new line
#_0BF4DF: db $FF ; end of message

;===================================================================================================

; [NAME2]を まひさせた
Message_03_00_51:
#_0BF4E0: db $EC ; write someone's name
#_0BF4E1: db $51, $CF, $43, $3F, $2F, $32, $34 ; を⎵まひさせた
#_0BF4E8: db $FC ; wait for key and new line
#_0BF4E9: db $FF ; end of message

;===================================================================================================

; [NAME2]は どくに おかされた
Message_03_00_52:
#_0BF4EA: db $EC ; write someone's name
#_0BF4EB: db $3E, $CF, $AA, $2C, $3A, $CF, $29, $2A ; は⎵どくに⎵おか
#_0BF4F3: db $2F, $4E, $34 ; された
#_0BF4F6: db $FC ; wait for key and new line
#_0BF4F7: db $FF ; end of message

;===================================================================================================

; [NAME2]を どくで よわらせた
Message_03_00_53:
#_0BF4F8: db $EC ; write someone's name
#_0BF4F9: db $51, $CF, $AA, $2C, $A9, $CF, $4A, $50 ; を⎵どくで⎵よわ
#_0BF501: db $4B, $32, $34 ; らせた
#_0BF504: db $FC ; wait for key and new line
#_0BF505: db $FF ; end of message

;===================================================================================================

; [NAME2]は ハエに かえられた
Message_03_00_54:
#_0BF506: db $EC ; write someone's name
#_0BF507: db $3E, $CF, $76, $60, $3A, $CF, $2A, $28 ; は⎵ハエに⎵かえ
#_0BF50F: db $4B, $4E, $34 ; られた
#_0BF512: db $FC ; wait for key and new line
#_0BF513: db $FF ; end of message

;===================================================================================================

; [NAME2]は カエルに かえられた
Message_03_00_56:
#_0BF514: db $EC ; write someone's name
#_0BF515: db $3E, $CF, $62, $60, $85, $3A, $CF, $2A ; は⎵カエルに⎵か
#_0BF51D: db $28, $4B, $4E, $34 ; えられた
#_0BF521: db $FC ; wait for key and new line
#_0BF522: db $FF ; end of message

;===================================================================================================

; [NAME2]は のろわれた
Message_03_00_58:
#_0BF523: db $EC ; write someone's name
#_0BF524: db $3E, $CF, $3D, $4F, $50, $4E, $34 ; は⎵のろわれた
#_0BF52B: db $FC ; wait for key and new line
#_0BF52C: db $FF ; end of message

;===================================================================================================

; [NAME2]は とりこになった
Message_03_00_5A:
#_0BF52D: db $EC ; write someone's name
#_0BF52E: db $3E, $CF, $38, $4C, $2E, $3A, $39, $58 ; は⎵とりこになっ
#_0BF536: db $34 ; た
#_0BF537: db $FC ; wait for key and new line
#_0BF538: db $FF ; end of message

;===================================================================================================

; [NAME2]を とりこにした
Message_03_00_5B:
#_0BF539: db $EC ; write someone's name
#_0BF53A: db $51, $CF, $38, $4C, $2E, $3A, $30, $34 ; を⎵とりこにした
#_0BF542: db $FC ; wait for key and new line
#_0BF543: db $FF ; end of message

;===================================================================================================

; [NAME2]は ねむってしまった
Message_03_00_5C:
#_0BF544: db $EC ; write someone's name
#_0BF545: db $3E, $CF, $3C, $45, $58, $37, $30, $43 ; は⎵ねむってしま
#_0BF54D: db $58, $34 ; った
#_0BF54F: db $FC ; wait for key and new line
#_0BF550: db $FF ; end of message

;===================================================================================================

; [NAME2]を ねむらせた
Message_03_00_5D:
#_0BF551: db $EC ; write someone's name
#_0BF552: db $51, $CF, $3C, $45, $4B, $32, $34 ; を⎵ねむらせた
#_0BF559: db $FC ; wait for key and new line
#_0BF55A: db $FF ; end of message

;===================================================================================================

; [NAME2]は かなしばりになった
Message_03_00_5E:
#_0BF55B: db $EC ; write someone's name
#_0BF55C: db $3E, $CF, $2A, $39, $30, $AB, $4C, $3A ; は⎵かなしばりに
#_0BF564: db $39, $58, $34 ; なった
#_0BF567: db $FC ; wait for key and new line
#_0BF568: db $FF ; end of message

;===================================================================================================

; [NAME2]を かなしばりにした
Message_03_00_5F:
#_0BF569: db $EC ; write someone's name
#_0BF56A: db $51, $CF, $2A, $39, $30, $AB, $4C, $3A ; を⎵かなしばりに
#_0BF572: db $30, $34 ; した
#_0BF574: db $FC ; wait for key and new line
#_0BF575: db $FF ; end of message

;===================================================================================================

; [NAME2]は こおりついた
Message_03_00_60:
#_0BF576: db $EC ; write someone's name
#_0BF577: db $3E, $CF, $2E, $29, $4C, $36, $26, $34 ; は⎵こおりついた
#_0BF57F: db $FC ; wait for key and new line
#_0BF580: db $FF ; end of message

;===================================================================================================

; [NAME2]を こおりつかせた
Message_03_00_61:
#_0BF581: db $EC ; write someone's name
#_0BF582: db $51, $CF, $2E, $29, $4C, $36, $2A, $32 ; を⎵こおりつかせ
#_0BF58A: db $34 ; た
#_0BF58B: db $FC ; wait for key and new line
#_0BF58C: db $FF ; end of message

;===================================================================================================

; [NAME2]は かんでんした
Message_03_00_62:
#_0BF58D: db $EC ; write someone's name
#_0BF58E: db $3E, $CF, $2A, $52, $A9, $52, $30, $34 ; は⎵かんでんした
#_0BF596: db $FC ; wait for key and new line
#_0BF597: db $FF ; end of message

;===================================================================================================

; [NAME2]を かんでんさせた
Message_03_00_63:
#_0BF598: db $EC ; write someone's name
#_0BF599: db $51, $CF, $2A, $52, $A9, $52, $2F, $32 ; を⎵かんでんさせ
#_0BF5A1: db $34 ; た
#_0BF5A2: db $FC ; wait for key and new line
#_0BF5A3: db $FF ; end of message

;===================================================================================================

; [NAME2]は まほうを ふうじられた
Message_03_00_64:
#_0BF5A4: db $EC ; write someone's name
#_0BF5A5: db $3E, $CF, $43, $42, $27, $51, $CF, $40 ; は⎵まほうを⎵ふ
#_0BF5AD: db $27, $A2, $4B, $4E, $34 ; うじられた
#_0BF5B2: db $FC ; wait for key and new line
#_0BF5B3: db $FF ; end of message

;===================================================================================================

; [NAME2]の まほうを ふうじた
Message_03_00_65:
#_0BF5B4: db $EC ; write someone's name
#_0BF5B5: db $3D, $CF, $43, $42, $27, $51, $CF, $40 ; の⎵まほうを⎵ふ
#_0BF5BD: db $27, $A2, $34 ; うじた
#_0BF5C0: db $FC ; wait for key and new line
#_0BF5C1: db $FF ; end of message

;===================================================================================================

; [NAME2]は ちょっと おかしくなった
Message_03_00_66:
#_0BF5C2: db $EC ; write someone's name
#_0BF5C3: db $3E, $CF, $35, $57, $58, $38, $CF, $29 ; は⎵ちょっと⎵お
#_0BF5CB: db $2A, $30, $2C, $39, $58, $34 ; かしくなった
#_0BF5D1: db $FC ; wait for key and new line
#_0BF5D2: db $FF ; end of message

;===================================================================================================

; [NAME2]を くるわせた
Message_03_00_67:
#_0BF5D3: db $EC ; write someone's name
#_0BF5D4: db $51, $CF, $2C, $4D, $50, $32, $34 ; を⎵くるわせた
#_0BF5DB: db $FC ; wait for key and new line
#_0BF5DC: db $FF ; end of message

;===================================================================================================

; [NAME2]は しあわせに つつまれた
Message_03_00_68:
#_0BF5DD: db $EC ; write someone's name
#_0BF5DE: db $3E, $CF, $30, $25, $50, $32, $3A, $CF ; は⎵しあわせに⎵
#_0BF5E6: db $36, $36, $43, $4E, $34 ; つつまれた
#_0BF5EB: db $FC ; wait for key and new line
#_0BF5EC: db $FF ; end of message

;===================================================================================================

; [NAME2]を しあわせに してあげた
Message_03_00_69:
#_0BF5ED: db $EC ; write someone's name
#_0BF5EE: db $51, $CF, $30, $25, $50, $32, $3A, $CF ; を⎵しあわせに⎵
#_0BF5F6: db $30, $37, $25, $9F, $34 ; してあげた
#_0BF5FB: db $FC ; wait for key and new line
#_0BF5FC: db $FF ; end of message

;===================================================================================================

; [NAME2]から MPを すいとった
Message_03_00_6A:
#_0BF5FD: db $EC ; write someone's name
#_0BF5FE: db $2A, $4B, $CF, $17, $1A, $51, $CF, $31 ; から⎵MPを⎵す
#_0BF606: db $26, $38, $58, $34 ; いとった
#_0BF60A: db $FC ; wait for key and new line
#_0BF60B: db $FF ; end of message

;===================================================================================================

; [NAME2]は MPを すいとられた
Message_03_00_6B:
#_0BF60C: db $EC ; write someone's name
#_0BF60D: db $3E, $CF, $17, $1A, $51, $CF, $31, $26 ; は⎵MPを⎵すい
#_0BF615: db $38, $4B, $4E, $34 ; とられた
#_0BF619: db $FC ; wait for key and new line
#_0BF61A: db $FF ; end of message

;===================================================================================================

; アクマたちの
; こうげきりょくを さげた
Message_03_00_6C:
#_0BF61B: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF621: db $F9 ; new line
#_0BF622: db $2E, $27, $9F, $2B, $4C, $57, $2C, $51 ; こうげきりょくを
#_0BF62A: db $CF, $2F, $9F, $34 ; ⎵さげた
#_0BF62E: db $FC ; wait for key and new line
#_0BF62F: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; こうげきりょくが さがった
Message_03_00_6D:
#_0BF630: db $F1 ; write leader's name for team
#_0BF631: db $3D ; の
#_0BF632: db $F9 ; new line
#_0BF633: db $2E, $27, $9F, $2B, $4C, $57, $2C, $9C ; こうげきりょくが
#_0BF63B: db $CF, $2F, $9C, $58, $34 ; ⎵さがった
#_0BF640: db $FC ; wait for key and new line
#_0BF641: db $FF ; end of message

;===================================================================================================

; アクマたちの
; ぼうぎょりょくを さげた
Message_03_00_6E:
#_0BF642: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF648: db $F9 ; new line
#_0BF649: db $AF, $27, $9D, $57, $4C, $57, $2C, $51 ; ぼうぎょりょくを
#_0BF651: db $CF, $2F, $9F, $34 ; ⎵さげた
#_0BF655: db $FC ; wait for key and new line
#_0BF656: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; ぼうぎょりょくが さがった
Message_03_00_6F:
#_0BF657: db $F1 ; write leader's name for team
#_0BF658: db $3D ; の
#_0BF659: db $F9 ; new line
#_0BF65A: db $AF, $27, $9D, $57, $4C, $57, $2C, $9C ; ぼうぎょりょくが
#_0BF662: db $CF, $2F, $9C, $58, $34 ; ⎵さがった
#_0BF667: db $FC ; wait for key and new line
#_0BF668: db $FF ; end of message

;===================================================================================================

; アクマたちの
; めいちゅうりょくを さげた
Message_03_00_70:
#_0BF669: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF66F: db $F9 ; new line
#_0BF670: db $46, $26, $35, $56, $27, $4C, $57, $2C ; めいちゅうりょく
#_0BF678: db $51, $CF, $2F, $9F, $34 ; を⎵さげた
#_0BF67D: db $FC ; wait for key and new line
#_0BF67E: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; めいちゅうりょくが さがった
Message_03_00_71:
#_0BF67F: db $F1 ; write leader's name for team
#_0BF680: db $3D ; の
#_0BF681: db $F9 ; new line
#_0BF682: db $46, $26, $35, $56, $27, $4C, $57, $2C ; めいちゅうりょく
#_0BF68A: db $9C, $CF, $2F, $9C, $58, $34 ; が⎵さがった
#_0BF690: db $FC ; wait for key and new line
#_0BF691: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; こうげきりょくを あげた
Message_03_00_72:
#_0BF692: db $F1 ; write leader's name for team
#_0BF693: db $3D ; の
#_0BF694: db $F9 ; new line
#_0BF695: db $2E, $27, $9F, $2B, $4C, $57, $2C, $51 ; こうげきりょくを
#_0BF69D: db $CF, $25, $9F, $34 ; ⎵あげた
#_0BF6A1: db $FC ; wait for key and new line
#_0BF6A2: db $FF ; end of message

;===================================================================================================

; アクマたちの
; こうげきりょくが あがった
Message_03_00_73:
#_0BF6A3: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF6A9: db $F9 ; new line
#_0BF6AA: db $2E, $27, $9F, $2B, $4C, $57, $2C, $9C ; こうげきりょくが
#_0BF6B2: db $CF, $25, $9C, $58, $34 ; ⎵あがった
#_0BF6B7: db $FC ; wait for key and new line
#_0BF6B8: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; ぼうぎょりょくを あげた
Message_03_00_74:
#_0BF6B9: db $F1 ; write leader's name for team
#_0BF6BA: db $3D ; の
#_0BF6BB: db $F9 ; new line
#_0BF6BC: db $AF, $27, $9D, $57, $4C, $57, $2C, $51 ; ぼうぎょりょくを
#_0BF6C4: db $CF, $25, $9F, $34 ; ⎵あげた
#_0BF6C8: db $FC ; wait for key and new line
#_0BF6C9: db $FF ; end of message

;===================================================================================================

; アクマたちの
; ぼうぎょりょくが あがった
Message_03_00_75:
#_0BF6CA: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF6D0: db $F9 ; new line
#_0BF6D1: db $AF, $27, $9D, $57, $4C, $57, $2C, $9C ; ぼうぎょりょくが
#_0BF6D9: db $CF, $25, $9C, $58, $34 ; ⎵あがった
#_0BF6DE: db $FC ; wait for key and new line
#_0BF6DF: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; めいちゅうりょくを あげた
Message_03_00_76:
#_0BF6E0: db $F1 ; write leader's name for team
#_0BF6E1: db $3D ; の
#_0BF6E2: db $F9 ; new line
#_0BF6E3: db $46, $26, $35, $56, $27, $4C, $57, $2C ; めいちゅうりょく
#_0BF6EB: db $51, $CF, $25, $9F, $34 ; を⎵あげた
#_0BF6F0: db $FC ; wait for key and new line
#_0BF6F1: db $FF ; end of message

;===================================================================================================

; アクマたちの
; めいちゅうりょくが あがった
Message_03_00_77:
#_0BF6F2: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF6F8: db $F9 ; new line
#_0BF6F9: db $46, $26, $35, $56, $27, $4C, $57, $2C ; めいちゅうりょく
#_0BF701: db $9C, $CF, $25, $9C, $58, $34 ; が⎵あがった
#_0BF707: db $FC ; wait for key and new line
#_0BF708: db $FF ; end of message

;===================================================================================================

; [LEADER]の
; まりょくを あげた
Message_03_00_78:
#_0BF709: db $F1 ; write leader's name for team
#_0BF70A: db $3D ; の
#_0BF70B: db $F9 ; new line
#_0BF70C: db $43, $4C, $57, $2C, $51, $CF, $25, $9F ; まりょくを⎵あげ
#_0BF714: db $34 ; た
#_0BF715: db $FC ; wait for key and new line
#_0BF716: db $FF ; end of message

;===================================================================================================

; アクマたちの
; まりょくが あがった
Message_03_00_79:
#_0BF717: db $5D, $64, $7B, $34, $35, $3D ; アクマたちの
#_0BF71D: db $F9 ; new line
#_0BF71E: db $43, $4C, $57, $2C, $9C, $CF, $25, $9C ; まりょくが⎵あが
#_0BF726: db $58, $34 ; った
#_0BF728: db $FC ; wait for key and new line
#_0BF729: db $FF ; end of message

;===================================================================================================

; [LEADER]に けっかいを はった
Message_03_00_7A:
#_0BF72A: db $F1 ; write leader's name for team
#_0BF72B: db $3A, $CF, $2D, $58, $2A, $26, $51, $CF ; に⎵けっかいを⎵
#_0BF733: db $3E, $58, $34 ; はった
#_0BF736: db $FC ; wait for key and new line
#_0BF737: db $FF ; end of message

;===================================================================================================

; アクマたちは けっかいを はった
Message_03_00_7B:
#_0BF738: db $5D, $64, $7B, $34, $35, $3E, $CF, $2D ; アクマたちは⎵け
#_0BF740: db $58, $2A, $26, $51, $CF, $3E, $58, $34 ; っかいを⎵はった
#_0BF748: db $FC ; wait for key and new line
#_0BF749: db $FF ; end of message

;===================================================================================================

; [LEADER]に シールドを はった
Message_03_00_7C:
#_0BF74A: db $F1 ; write leader's name for team
#_0BF74B: db $3A, $CF, $68, $5A, $85, $C3, $51, $CF ; に⎵シールドを⎵
#_0BF753: db $3E, $58, $34 ; はった
#_0BF756: db $FC ; wait for key and new line
#_0BF757: db $FF ; end of message

;===================================================================================================

; アクマたちは シールドを はった
Message_03_00_7D:
#_0BF758: db $5D, $64, $7B, $34, $35, $3E, $CF, $68 ; アクマたちは⎵シ
#_0BF760: db $5A, $85, $C3, $51, $CF, $3E, $58, $34 ; ールドを⎵はった
#_0BF768: db $FC ; wait for key and new line
#_0BF769: db $FF ; end of message

;===================================================================================================

; [LEADER]に バリアを はった
Message_03_00_7E:
#_0BF76A: db $F1 ; write leader's name for team
#_0BF76B: db $3A, $CF, $C4, $84, $5D, $51, $CF, $3E ; に⎵バリアを⎵は
#_0BF773: db $58, $34 ; った
#_0BF775: db $FC ; wait for key and new line
#_0BF776: db $FF ; end of message

;===================================================================================================

; アクマたちは バリアを はった
Message_03_00_7F:
#_0BF777: db $5D, $64, $7B, $34, $35, $3E, $CF, $C4 ; アクマたちは⎵バ
#_0BF77F: db $84, $5D, $51, $CF, $3E, $58, $34 ; リアを⎵はった
#_0BF786: db $FC ; wait for key and new line
#_0BF787: db $FF ; end of message

;===================================================================================================

; [NAME2]は かいふくした
Message_03_00_80:
#_0BF788: db $EC ; write someone's name
#_0BF789: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BF791: db $FC ; wait for key and new line
#_0BF792: db $FF ; end of message

;===================================================================================================

; [LEADER]は かいふくした
Message_03_00_86:
#_0BF793: db $F1 ; write leader's name for team
#_0BF794: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BF79C: db $FC ; wait for key and new line
#_0BF79D: db $FF ; end of message

;===================================================================================================

; [NAME2]たちは かいふくした
Message_03_00_87:
#_0BF79E: db $EC ; write someone's name
#_0BF79F: db $34, $35, $3E, $CF, $2A, $26, $40, $2C ; たちは⎵かいふく
#_0BF7A7: db $30, $34 ; した
#_0BF7A9: db $FC ; wait for key and new line
#_0BF7AA: db $FF ; end of message

;===================================================================================================

; [LEADER]は かいふくした
Message_03_00_88:
#_0BF7AB: db $F1 ; write leader's name for team
#_0BF7AC: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BF7B4: db $FC ; wait for key and new line
#_0BF7B5: db $FF ; end of message

;===================================================================================================

; [NAME2]たちは かいふくした
Message_03_00_89:
#_0BF7B6: db $EC ; write someone's name
#_0BF7B7: db $34, $35, $3E, $CF, $2A, $26, $40, $2C ; たちは⎵かいふく
#_0BF7BF: db $30, $34 ; した
#_0BF7C1: db $FC ; wait for key and new line
#_0BF7C2: db $FF ; end of message

;===================================================================================================

; [NAME2]は われに かえった
Message_03_00_8A:
#_0BF7C3: db $EC ; write someone's name
#_0BF7C4: db $3E, $CF, $50, $4E, $3A, $CF, $2A, $28 ; は⎵われに⎵かえ
#_0BF7CC: db $58, $34 ; った
#_0BF7CE: db $FC ; wait for key and new line
#_0BF7CF: db $FF ; end of message

;===================================================================================================

; [LEADER]は われに かえった
Message_03_00_8C:
#_0BF7D0: db $F1 ; write leader's name for team
#_0BF7D1: db $3E, $CF, $50, $4E, $3A, $CF, $2A, $28 ; は⎵われに⎵かえ
#_0BF7D9: db $58, $34 ; った
#_0BF7DB: db $FC ; wait for key and new line
#_0BF7DC: db $FF ; end of message

;===================================================================================================

; [NAME2]たちは われに かえった
Message_03_00_8D:
#_0BF7DD: db $EC ; write someone's name
#_0BF7DE: db $34, $35, $3E, $CF, $50, $4E, $3A, $CF ; たちは⎵われに⎵
#_0BF7E6: db $2A, $28, $58, $34 ; かえった
#_0BF7EA: db $FC ; wait for key and new line
#_0BF7EB: db $FF ; end of message

;===================================================================================================

; [NAME2]から どくが きえた
Message_03_00_8E:
#_0BF7EC: db $EC ; write someone's name
#_0BF7ED: db $2A, $4B, $CF, $AA, $2C, $9C, $CF, $2B ; から⎵どくが⎵き
#_0BF7F5: db $28, $34 ; えた
#_0BF7F7: db $FC ; wait for key and new line
#_0BF7F8: db $FF ; end of message

;===================================================================================================

; [NAME2]の まひが なおった
Message_03_00_90:
#_0BF7F9: db $EC ; write someone's name
#_0BF7FA: db $3D, $CF, $43, $3F, $9C, $CF, $39, $29 ; の⎵まひが⎵なお
#_0BF802: db $58, $34 ; った
#_0BF804: db $FC ; wait for key and new line
#_0BF805: db $FF ; end of message

;===================================================================================================

; [NAME2]は いしから もどった
Message_03_00_92:
#_0BF806: db $EC ; write someone's name
#_0BF807: db $3E, $CF, $26, $30, $2A, $4B, $CF, $47 ; は⎵いしから⎵も
#_0BF80F: db $AA, $58, $34 ; どった
#_0BF812: db $FC ; wait for key and new line
#_0BF813: db $FF ; end of message

;===================================================================================================

; [NAME2]は いきを ふきかえした
Message_03_00_94:
#_0BF814: db $EC ; write someone's name
#_0BF815: db $3E, $CF, $26, $2B, $51, $CF, $40, $2B ; は⎵いきを⎵ふき
#_0BF81D: db $2A, $28, $30, $34 ; かえした
#_0BF821: db $FC ; wait for key and new line
#_0BF822: db $FF ; end of message

;===================================================================================================

; [NAME2]は ふっかつした
Message_03_00_95:
#_0BF823: db $EC ; write someone's name
#_0BF824: db $3E, $CF, $40, $58, $2A, $36, $30, $34 ; は⎵ふっかつした
#_0BF82C: db $FC ; wait for key and new line
#_0BF82D: db $FF ; end of message

;===================================================================================================

; [NAME2]は 10MP あたえた
Message_03_00_96:
#_0BF82E: db $EC ; write someone's name
#_0BF82F: db $3E, $CF, $02, $01, $17, $1A, $CF, $25 ; は⎵10MP⎵あ
#_0BF837: db $34, $28, $34 ; たえた
#_0BF83A: db $FC ; wait for key and new line
#_0BF83B: db $FF ; end of message

;===================================================================================================

; [LEADER]は すがたを けした
Message_03_00_97:
#_0BF83C: db $F1 ; write leader's name for team
#_0BF83D: db $3E, $CF, $31, $9C, $34, $51, $CF, $2D ; は⎵すがたを⎵け
#_0BF845: db $30, $34 ; した
#_0BF847: db $FC ; wait for key and new line
#_0BF848: db $FF ; end of message

;===================================================================================================

; [NAME2]を しょうかんした
Message_03_00_98:
#_0BF849: db $EC ; write someone's name
#_0BF84A: db $51, $CF, $30, $57, $27, $2A, $52, $30 ; を⎵しょうかんし
#_0BF852: db $34 ; た
#_0BF853: db $FC ; wait for key and new line
#_0BF854: db $FF ; end of message

;===================================================================================================

; [NAME2]の めが ひかった
Message_03_00_99:
#_0BF855: db $EC ; write someone's name
#_0BF856: db $3D, $CF, $46, $9C, $CF, $3F, $2A, $58 ; の⎵めが⎵ひかっ
#_0BF85E: db $34 ; た
#_0BF85F: db $FC ; wait for key and new line
#_0BF860: db $FF ; end of message

;===================================================================================================

; [NAME2]は にらみを きかせた
Message_03_00_9A:
#_0BF861: db $EC ; write someone's name
#_0BF862: db $3E, $CF, $3A, $4B, $44, $51, $CF, $2B ; は⎵にらみを⎵き
#_0BF86A: db $2A, $32, $34 ; かせた
#_0BF86D: db $FC ; wait for key and new line
#_0BF86E: db $FF ; end of message

;===================================================================================================

; [NAME2]は しへの じゅもんを となえた
Message_03_00_9B:
#_0BF86F: db $EC ; write someone's name
#_0BF870: db $3E, $CF, $30, $41, $3D, $CF, $A2, $56 ; は⎵しへの⎵じゅ
#_0BF878: db $47, $52, $51, $CF, $38, $39, $28, $34 ; もんを⎵となえた
#_0BF880: db $FC ; wait for key and new line
#_0BF881: db $FF ; end of message

;===================================================================================================

; [NAME2]は じゅもんを となえた
Message_03_00_9C:
#_0BF882: db $EC ; write someone's name
#_0BF883: db $3E, $CF, $A2, $56, $47, $52, $51, $CF ; は⎵じゅもんを⎵
#_0BF88B: db $38, $39, $28, $34 ; となえた
#_0BF88F: db $FC ; wait for key and new line
#_0BF890: db $FF ; end of message

;===================================================================================================

; [NAME2]は バエルの のろいを かけた
Message_03_00_9D:
#_0BF891: db $EC ; write someone's name
#_0BF892: db $3E, $CF, $C4, $60, $85, $3D, $CF, $3D ; は⎵バエルの⎵の
#_0BF89A: db $4F, $26, $51, $CF, $2A, $2D, $34 ; ろいを⎵かけた
#_0BF8A1: db $FC ; wait for key and new line
#_0BF8A2: db $FF ; end of message

;===================================================================================================

; [NAME2]は なやましく おどった
Message_03_00_9E:
#_0BF8A3: db $EC ; write someone's name
#_0BF8A4: db $3E, $CF, $39, $48, $43, $30, $2C, $CF ; は⎵なやましく⎵
#_0BF8AC: db $29, $AA, $58, $34 ; おどった
#_0BF8B0: db $FC ; wait for key and new line
#_0BF8B1: db $FF ; end of message

;===================================================================================================

; [NAME2]は ステップを ふんだ
Message_03_00_9F:
#_0BF8B2: db $EC ; write someone's name
#_0BF8B3: db $3E, $CF, $69, $6F, $92, $CB, $51, $CF ; は⎵ステップを⎵
#_0BF8BB: db $40, $52, $A6 ; ふんだ
#_0BF8BE: db $FC ; wait for key and new line
#_0BF8BF: db $FF ; end of message

;===================================================================================================

; [NAME2]は やさしく うたった
Message_03_00_A0:
#_0BF8C0: db $EC ; write someone's name
#_0BF8C1: db $3E, $CF, $48, $2F, $30, $2C, $CF, $27 ; は⎵やさしく⎵う
#_0BF8C9: db $34, $58, $34 ; たった
#_0BF8CC: db $FC ; wait for key and new line
#_0BF8CD: db $FF ; end of message

;===================================================================================================

; [NAME2]は こもりうたを うたった
Message_03_00_A1:
#_0BF8CE: db $EC ; write someone's name
#_0BF8CF: db $3E, $CF, $2E, $47, $4C, $27, $34, $51 ; は⎵こもりうたを
#_0BF8D7: db $CF, $27, $34, $58, $34 ; ⎵うたった
#_0BF8DC: db $FC ; wait for key and new line
#_0BF8DD: db $FF ; end of message

;===================================================================================================

; [NAME2]は なにやら つぶやいた
Message_03_00_A2:
#_0BF8DE: db $EC ; write someone's name
#_0BF8DF: db $3E, $CF, $39, $3A, $48, $4B, $CF, $36 ; は⎵なにやら⎵つ
#_0BF8E7: db $AD, $48, $26, $34 ; ぶやいた
#_0BF8EB: db $FC ; wait for key and new line
#_0BF8EC: db $FF ; end of message

;===================================================================================================

; [NAME2]は うなりごえを あげた
Message_03_00_A3:
#_0BF8ED: db $EC ; write someone's name
#_0BF8EE: db $3E, $CF, $27, $39, $4C, $A0, $28, $51 ; は⎵うなりごえを
#_0BF8F6: db $CF, $25, $9F, $34 ; ⎵あげた
#_0BF8FA: db $FC ; wait for key and new line
#_0BF8FB: db $FF ; end of message

;===================================================================================================

; [NAME2]は あまい くちづけを した
Message_03_00_A4:
#_0BF8FC: db $EC ; write someone's name
#_0BF8FD: db $3E, $CF, $25, $43, $26, $CF, $2C, $35 ; は⎵あまい⎵くち
#_0BF905: db $A8, $2D, $51, $CF, $30, $34 ; づけを⎵した
#_0BF90B: db $FC ; wait for key and new line
#_0BF90C: db $FF ; end of message

;===================================================================================================

; [NAME2]は ニヤリと わらった
Message_03_00_A6:
#_0BF90D: db $EC ; write someone's name
#_0BF90E: db $3E, $CF, $72, $80, $84, $38, $CF, $50 ; は⎵ニヤリと⎵わ
#_0BF916: db $4B, $58, $34 ; らった
#_0BF919: db $FC ; wait for key and new line
#_0BF91A: db $FF ; end of message

;===================================================================================================

; [NAME2]は ほのおを はいた
Message_03_00_A7:
#_0BF91B: db $EC ; write someone's name
#_0BF91C: db $3E, $CF, $42, $3D, $29, $51, $CF, $3E ; は⎵ほのおを⎵は
#_0BF924: db $26, $34 ; いた
#_0BF926: db $FC ; wait for key and new line
#_0BF927: db $FF ; end of message

;===================================================================================================

; [NAME2]は れいきを ふきかけた
Message_03_00_A8:
#_0BF928: db $EC ; write someone's name
#_0BF929: db $3E, $CF, $4E, $26, $2B, $51, $CF, $40 ; は⎵れいきを⎵ふ
#_0BF931: db $2B, $2A, $2D, $34 ; きかけた
#_0BF935: db $FC ; wait for key and new line
#_0BF936: db $FF ; end of message

;===================================================================================================

; [NAME2]は どくガスを ふいた
Message_03_00_A9:
#_0BF937: db $EC ; write someone's name
#_0BF938: db $3E, $CF, $AA, $2C, $B5, $69, $51, $CF ; は⎵どくガスを⎵
#_0BF940: db $40, $26, $34 ; ふいた
#_0BF943: db $FC ; wait for key and new line
#_0BF944: db $FF ; end of message

;===================================================================================================

; [NAME2]は きりを はいた
Message_03_00_AA:
#_0BF945: db $EC ; write someone's name
#_0BF946: db $3E, $CF, $2B, $4C, $51, $CF, $3E, $26 ; は⎵きりを⎵はい
#_0BF94E: db $34 ; た
#_0BF94F: db $FC ; wait for key and new line
#_0BF950: db $FF ; end of message

;===================================================================================================

; [NAME2]は ほのおを とばした
Message_03_00_AB:
#_0BF951: db $EC ; write someone's name
#_0BF952: db $3E, $CF, $42, $3D, $29, $51, $CF, $38 ; は⎵ほのおを⎵と
#_0BF95A: db $AB, $30, $34 ; ばした
#_0BF95D: db $FC ; wait for key and new line
#_0BF95E: db $FF ; end of message

;===================================================================================================

; [NAME2]の でんげきが はしった
Message_03_00_AC:
#_0BF95F: db $EC ; write someone's name
#_0BF960: db $3D, $CF, $A9, $52, $9F, $2B, $9C, $CF ; の⎵でんげきが⎵
#_0BF968: db $3E, $30, $58, $34 ; はしった
#_0BF96C: db $FC ; wait for key and new line
#_0BF96D: db $FF ; end of message

;===================================================================================================

; [NAME2]の つめたいてが ふれた
Message_03_00_AD:
#_0BF96E: db $EC ; write someone's name
#_0BF96F: db $3D, $CF, $36, $46, $34, $26, $37, $9C ; の⎵つめたいてが
#_0BF977: db $CF, $40, $4E, $34 ; ⎵ふれた
#_0BF97B: db $FC ; wait for key and new line
#_0BF97C: db $FF ; end of message

;===================================================================================================

; [NAME2]は みずの かべを はった
Message_03_00_AE:
#_0BF97D: db $EC ; write someone's name
#_0BF97E: db $3E, $CF, $44, $A3, $3D, $CF, $2A, $AE ; は⎵みずの⎵かべ
#_0BF986: db $51, $CF, $3E, $58, $34 ; を⎵はった
#_0BF98B: db $FC ; wait for key and new line
#_0BF98C: db $FF ; end of message

;===================================================================================================

; [NAME2]は ほのおの かべを はった
Message_03_00_AF:
#_0BF98D: db $EC ; write someone's name
#_0BF98E: db $3E, $CF, $42, $3D, $29, $3D, $CF, $2A ; は⎵ほのおの⎵か
#_0BF996: db $AE, $51, $CF, $3E, $58, $34 ; べを⎵はった
#_0BF99C: db $FC ; wait for key and new line
#_0BF99D: db $FF ; end of message

;===================================================================================================

; [NAME2]の かみつき こうげき
Message_03_00_B0:
#_0BF99E: db $EC ; write someone's name
#_0BF99F: db $3D, $CF, $2A, $44, $36, $2B, $CF, $2E ; の⎵かみつき⎵こ
#_0BF9A7: db $27, $9F, $2B ; うげき
#_0BF9AA: db $FC ; wait for key and new line
#_0BF9AB: db $FF ; end of message

;===================================================================================================

; [NAME2]は やさしく かんだ
Message_03_00_B4:
#_0BF9AC: db $EC ; write someone's name
#_0BF9AD: db $3E, $CF, $48, $2F, $30, $2C, $CF, $2A ; は⎵やさしく⎵か
#_0BF9B5: db $52, $A6 ; んだ
#_0BF9B7: db $FC ; wait for key and new line
#_0BF9B8: db $FF ; end of message

;===================================================================================================

; [NAME2]の ひっかき こうげき
Message_03_00_B5:
#_0BF9B9: db $EC ; write someone's name
#_0BF9BA: db $3D, $CF, $3F, $58, $2A, $2B, $CF, $2E ; の⎵ひっかき⎵こ
#_0BF9C2: db $27, $9F, $2B ; うげき
#_0BF9C5: db $FC ; wait for key and new line
#_0BF9C6: db $FF ; end of message

;===================================================================================================

; [NAME2]は どくばりを とばした
Message_03_00_B8:
#_0BF9C7: db $EC ; write someone's name
#_0BF9C8: db $3E, $CF, $AA, $2C, $AB, $4C, $51, $CF ; は⎵どくばりを⎵
#_0BF9D0: db $38, $AB, $30, $34 ; とばした
#_0BF9D4: db $FC ; wait for key and new line
#_0BF9D5: db $FF ; end of message

;===================================================================================================

; [NAME2]は はばたいた
Message_03_00_BA:
#_0BF9D6: db $EC ; write someone's name
#_0BF9D7: db $3E, $CF, $3E, $AB, $34, $26, $34 ; は⎵はばたいた
#_0BF9DE: db $FC ; wait for key and new line
#_0BF9DF: db $FF ; end of message

;===================================================================================================

; [NAME2]は たくさんのはりを とばした
Message_03_00_BB:
#_0BF9E0: db $EC ; write someone's name
#_0BF9E1: db $3E, $CF, $34, $2C, $2F, $52, $3D, $3E ; は⎵たくさんのは
#_0BF9E9: db $4C, $51, $CF, $38, $AB, $30, $34 ; りを⎵とばした
#_0BF9F0: db $FC ; wait for key and new line
#_0BF9F1: db $FF ; end of message

;===================================================================================================

; [NAME2]は たいあたりを くらわした
Message_03_00_BC:
#_0BF9F2: db $EC ; write someone's name
#_0BF9F3: db $3E, $CF, $34, $26, $25, $34, $4C, $51 ; は⎵たいあたりを
#_0BF9FB: db $CF, $2C, $4B, $50, $30, $34 ; ⎵くらわした
#_0BFA01: db $FC ; wait for key and new line
#_0BFA02: db $FF ; end of message

;===================================================================================================

; [NAME2]は からだを まきつけた
Message_03_00_BD:
#_0BFA03: db $EC ; write someone's name
#_0BFA04: db $3E, $CF, $2A, $4B, $A6, $51, $CF, $43 ; は⎵からだを⎵ま
#_0BFA0C: db $2B, $36, $2D, $34 ; きつけた
#_0BFA10: db $FC ; wait for key and new line
#_0BFA11: db $FF ; end of message

;===================================================================================================

; [NAME2]は あばれた
Message_03_00_BE:
#_0BFA12: db $EC ; write someone's name
#_0BFA13: db $3E, $CF, $25, $AB, $4E, $34 ; は⎵あばれた
#_0BFA19: db $FC ; wait for key and new line
#_0BFA1A: db $FF ; end of message

;===================================================================================================

; [NAME2]は からだを ぶつけた
Message_03_00_BF:
#_0BFA1B: db $EC ; write someone's name
#_0BFA1C: db $3E, $CF, $2A, $4B, $A6, $51, $CF, $AD ; は⎵からだを⎵ぶ
#_0BFA24: db $36, $2D, $34 ; つけた
#_0BFA27: db $FC ; wait for key and new line
#_0BFA28: db $FF ; end of message

;===================================================================================================

; [NAME2]の ひっさつ こうげき
Message_03_00_C0:
#_0BFA29: db $EC ; write someone's name
#_0BFA2A: db $3D, $CF, $3F, $58, $2F, $36, $CF, $2E ; の⎵ひっさつ⎵こ
#_0BFA32: db $27, $9F, $2B ; うげき
#_0BFA35: db $FC ; wait for key and new line
#_0BFA36: db $FF ; end of message

;===================================================================================================

; [NAME2]が しっぽを ふった
Message_03_00_C1:
#_0BFA37: db $EC ; write someone's name
#_0BFA38: db $9C, $CF, $30, $58, $B4, $51, $CF, $40 ; が⎵しっぽを⎵ふ
#_0BFA40: db $58, $34 ; った
#_0BFA42: db $FC ; wait for key and new line
#_0BFA43: db $FF ; end of message

;===================================================================================================

; [NAME2]の かいしん こうげき
Message_03_00_C2:
#_0BFA44: db $EC ; write someone's name
#_0BFA45: db $3D, $CF, $2A, $26, $30, $52, $CF, $2E ; の⎵かいしん⎵こ
#_0BFA4D: db $27, $9F, $2B ; うげき
#_0BFA50: db $FC ; wait for key and new line
#_0BFA51: db $FF ; end of message

;===================================================================================================

; [NAME2]は とつぜん ばくはつした
Message_03_00_C3:
#_0BFA52: db $EC ; write someone's name
#_0BFA53: db $3E, $CF, $38, $36, $A4, $52, $CF, $AB ; は⎵とつぜん⎵ば
#_0BFA5B: db $2C, $3E, $36, $30, $34 ; くはつした
#_0BFA60: db $FC ; wait for key and new line
#_0BFA61: db $FF ; end of message

;===================================================================================================

; [NAME2]は みがまえた
Message_03_00_C4:
#_0BFA62: db $EC ; write someone's name
#_0BFA63: db $3E, $CF, $44, $9C, $43, $28, $34 ; は⎵みがまえた
#_0BFA6A: db $FC ; wait for key and new line
#_0BFA6B: db $FF ; end of message

;===================================================================================================

; [NAME2]は みを まもった
Message_03_00_C5:
#_0BFA6C: db $EC ; write someone's name
#_0BFA6D: db $3E, $CF, $44, $51, $CF, $43, $47, $58 ; は⎵みを⎵まもっ
#_0BFA75: db $34 ; た
#_0BFA76: db $FC ; wait for key and new line
#_0BFA77: db $FF ; end of message

;===================================================================================================

; [NAME2]は そそくさと にげだした
Message_03_00_C6:
#_0BFA78: db $EC ; write someone's name
#_0BFA79: db $3E, $CF, $33, $33, $2C, $2F, $38, $CF ; は⎵そそくさと⎵
#_0BFA81: db $3A, $9F, $A6, $30, $34 ; にげだした
#_0BFA86: db $FC ; wait for key and new line
#_0BFA87: db $FF ; end of message

;===================================================================================================

; [NAME2]は ナカマに こえを かけた
Message_03_00_C7:
#_0BFA88: db $EC ; write someone's name
#_0BFA89: db $3E, $CF, $71, $62, $7B, $3A, $CF, $2E ; は⎵ナカマに⎵こ
#_0BFA91: db $28, $51, $CF, $2A, $2D, $34 ; えを⎵かけた
#_0BFA97: db $FC ; wait for key and new line
#_0BFA98: db $FF ; end of message

;===================================================================================================

; [NAME2]は ちからが ぬけていった
Message_03_00_C8:
#_0BFA99: db $EC ; write someone's name
#_0BFA9A: db $3E, $CF, $35, $2A, $4B, $9C, $CF, $3B ; は⎵ちからが⎵ぬ
#_0BFAA2: db $2D, $37, $26, $58, $34 ; けていった
#_0BFAA7: db $FC ; wait for key and new line
#_0BFAA8: db $FF ; end of message

;===================================================================================================

; [NAME2]は HPを すいとられた
Message_03_00_C9:
#_0BFAA9: db $EC ; write someone's name
#_0BFAAA: db $3E, $CF, $12, $1A, $51, $CF, $31, $26 ; は⎵HPを⎵すい
#_0BFAB2: db $38, $4B, $4E, $34 ; とられた
#_0BFAB6: db $FC ; wait for key and new line
#_0BFAB7: db $FF ; end of message

;===================================================================================================

; [NAME2]の HPを すいとった
Message_03_00_CA:
#_0BFAB8: db $EC ; write someone's name
#_0BFAB9: db $3D, $CF, $12, $1A, $51, $CF, $31, $26 ; の⎵HPを⎵すい
#_0BFAC1: db $38, $58, $34 ; とった
#_0BFAC4: db $FC ; wait for key and new line
#_0BFAC5: db $FF ; end of message

;===================================================================================================

; しかし だれも こなかった
Message_03_00_CB:
#_0BFAC6: db $30, $2A, $30, $CF, $A6, $4E, $47, $CF ; しかし⎵だれも⎵
#_0BFACE: db $2E, $39, $2A, $58, $34 ; こなかった
#_0BFAD3: db $FC ; wait for key and new line
#_0BFAD4: db $FF ; end of message

;===================================================================================================

; [NAME2]は [LONG]のダメージをうけた
Message_03_00_CC:
#_0BFAD5: db $EC ; write someone's name
#_0BFAD6: db $3E, $CF ; は⎵
#_0BFAD8: db $FB ; write 32-bit integer from $0A54
#_0BFAD9: db $3D, $BF, $7E, $5A, $BB, $51, $27, $2D ; のダメージをうけ
#_0BFAE1: db $34 ; た
#_0BFAE2: db $FC ; wait for key and new line
#_0BFAE3: db $FF ; end of message

;===================================================================================================

; [NAME2]は ちからつきた
Message_03_00_CD:
#_0BFAE4: db $EC ; write someone's name
#_0BFAE5: db $3E, $CF, $35, $2A, $4B, $36, $2B, $34 ; は⎵ちからつきた
#_0BFAED: db $FC ; wait for key and new line
#_0BFAEE: db $FF ; end of message

;===================================================================================================

; [NAME2]の HPが かいふくした
Message_03_00_CE:
#_0BFAEF: db $EC ; write someone's name
#_0BFAF0: db $3D, $CF, $12, $1A, $9C, $CF, $2A, $26 ; の⎵HPが⎵かい
#_0BFAF8: db $40, $2C, $30, $34 ; ふくした
#_0BFAFC: db $FC ; wait for key and new line
#_0BFAFD: db $FF ; end of message

;===================================================================================================

; [NAME2]は げんきが でてきた
Message_03_00_CF:
#_0BFAFE: db $EC ; write someone's name
#_0BFAFF: db $3E, $CF, $9F, $52, $2B, $9C, $CF, $A9 ; は⎵げんきが⎵で
#_0BFB07: db $37, $2B, $34 ; てきた
#_0BFB0A: db $FC ; wait for key and new line
#_0BFB0B: db $FF ; end of message

;===================================================================================================

; [NAME2]の HPが いっぱいになった
Message_03_00_D0:
#_0BFB0C: db $EC ; write someone's name
#_0BFB0D: db $3D, $CF, $12, $1A, $9C, $CF, $26, $58 ; の⎵HPが⎵いっ
#_0BFB15: db $B0, $26, $3A, $39, $58, $34 ; ぱいになった
#_0BFB1B: db $FC ; wait for key and new line
#_0BFB1C: db $FF ; end of message

;===================================================================================================

; [NAME2]は かいふくした
Message_03_00_D1:
#_0BFB1D: db $EC ; write someone's name
#_0BFB1E: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BFB26: db $FC ; wait for key and new line
#_0BFB27: db $FF ; end of message

;===================================================================================================

; [NAME2]は ぜんかいした
Message_03_00_D2:
#_0BFB28: db $EC ; write someone's name
#_0BFB29: db $3E, $CF, $A4, $52, $2A, $26, $30, $34 ; は⎵ぜんかいした
#_0BFB31: db $FC ; wait for key and new line
#_0BFB32: db $FF ; end of message

;===================================================================================================

; [NAME2]は いきを ふきかえした
Message_03_00_D3:
#_0BFB33: db $EC ; write someone's name
#_0BFB34: db $3E, $CF, $26, $2B, $51, $CF, $40, $2B ; は⎵いきを⎵ふき
#_0BFB3C: db $2A, $28, $30, $34 ; かえした
#_0BFB40: db $FC ; wait for key and new line
#_0BFB41: db $FF ; end of message

;===================================================================================================

; [NAME2]は ふっかつを とげた
Message_03_00_D4:
#_0BFB42: db $EC ; write someone's name
#_0BFB43: db $3E, $CF, $40, $58, $2A, $36, $51, $CF ; は⎵ふっかつを⎵
#_0BFB4B: db $38, $9F, $34 ; とげた
#_0BFB4E: db $FC ; wait for key and new line
#_0BFB4F: db $FF ; end of message

;===================================================================================================

; [LEADER]の MPが かいふくした
Message_03_00_D5:
#_0BFB50: db $F1 ; write leader's name for team
#_0BFB51: db $3D, $CF, $17, $1A, $9C, $CF, $2A, $26 ; の⎵MPが⎵かい
#_0BFB59: db $40, $2C, $30, $34 ; ふくした
#_0BFB5D: db $FC ; wait for key and new line
#_0BFB5E: db $FF ; end of message

;===================================================================================================

; [NAME2]の つよさが あがった
Message_03_00_D6:
#_0BFB5F: db $EC ; write someone's name
#_0BFB60: db $3D, $CF, $36, $4A, $2F, $9C, $CF, $25 ; の⎵つよさが⎵あ
#_0BFB68: db $9C, $58, $34 ; がった
#_0BFB6B: db $FC ; wait for key and new line
#_0BFB6C: db $FF ; end of message

;===================================================================================================

; [NAME2]の ちえが あがった
Message_03_00_D7:
#_0BFB6D: db $EC ; write someone's name
#_0BFB6E: db $3D, $CF, $35, $28, $9C, $CF, $25, $9C ; の⎵ちえが⎵あが
#_0BFB76: db $58, $34 ; った
#_0BFB78: db $FC ; wait for key and new line
#_0BFB79: db $FF ; end of message

;===================================================================================================

; [NAME2]の まりょくが あがった
Message_03_00_D8:
#_0BFB7A: db $EC ; write someone's name
#_0BFB7B: db $3D, $CF, $43, $4C, $57, $2C, $9C, $CF ; の⎵まりょくが⎵
#_0BFB83: db $25, $9C, $58, $34 ; あがった
#_0BFB87: db $FC ; wait for key and new line
#_0BFB88: db $FF ; end of message

;===================================================================================================

; [NAME2]の たいりょくが あがった
Message_03_00_D9:
#_0BFB89: db $EC ; write someone's name
#_0BFB8A: db $3D, $CF, $34, $26, $4C, $57, $2C, $9C ; の⎵たいりょくが
#_0BFB92: db $CF, $25, $9C, $58, $34 ; ⎵あがった
#_0BFB97: db $FC ; wait for key and new line
#_0BFB98: db $FF ; end of message

;===================================================================================================

; [NAME2]の はやさが あがった
Message_03_00_DA:
#_0BFB99: db $EC ; write someone's name
#_0BFB9A: db $3D, $CF, $3E, $48, $2F, $9C, $CF, $25 ; の⎵はやさが⎵あ
#_0BFBA2: db $9C, $58, $34 ; がった
#_0BFBA5: db $FC ; wait for key and new line
#_0BFBA6: db $FF ; end of message

;===================================================================================================

; [NAME2]の うんが あがった
Message_03_00_DB:
#_0BFBA7: db $EC ; write someone's name
#_0BFBA8: db $3D, $CF, $27, $52, $9C, $CF, $25, $9C ; の⎵うんが⎵あが
#_0BFBB0: db $58, $34 ; った
#_0BFBB2: db $FC ; wait for key and new line
#_0BFBB3: db $FF ; end of message

;===================================================================================================

; [LEADER]は かいふくした
Message_03_00_DC:
#_0BFBB4: db $F1 ; write leader's name for team
#_0BFBB5: db $3E, $CF, $2A, $26, $40, $2C, $30, $34 ; は⎵かいふくした
#_0BFBBD: db $FC ; wait for key and new line
#_0BFBBE: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; まほうの バリアを はった
Message_03_00_DE:
#_0BFBBF: db $F1 ; write leader's name for team
#_0BFBC0: db $3E ; は
#_0BFBC1: db $F9 ; new line
#_0BFBC2: db $43, $42, $27, $3D, $CF, $C4, $84, $5D ; まほうの⎵バリア
#_0BFBCA: db $51, $CF, $3E, $58, $34 ; を⎵はった
#_0BFBCF: db $FC ; wait for key and new line
#_0BFBD0: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]に まもられている
Message_03_00_DF:
#_0BFBD1: db $F1 ; write leader's name for team
#_0BFBD2: db $3E ; は
#_0BFBD3: db $F9 ; new line
#_0BFBD4: db $F3 ; write item name from $0A50
#_0BFBD5: db $3A, $CF, $43, $47, $4B, $4E, $37, $26 ; に⎵まもられてい
#_0BFBDD: db $4D ; る
#_0BFBDE: db $FC ; wait for key and new line
#_0BFBDF: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]に まもられた
Message_03_00_E0:
#_0BFBE0: db $F1 ; write leader's name for team
#_0BFBE1: db $3E ; は
#_0BFBE2: db $F9 ; new line
#_0BFBE3: db $F3 ; write item name from $0A50
#_0BFBE4: db $3A, $CF, $43, $47, $4B, $4E, $34 ; に⎵まもられた
#_0BFBEB: db $FC ; wait for key and new line
#_0BFBEC: db $FF ; end of message

;===================================================================================================

; [LEADER]を
; [ITEM]が まもっている
Message_03_00_E1:
#_0BFBED: db $F1 ; write leader's name for team
#_0BFBEE: db $51 ; を
#_0BFBEF: db $F9 ; new line
#_0BFBF0: db $F3 ; write item name from $0A50
#_0BFBF1: db $9C, $CF, $43, $47, $58, $37, $26, $4D ; が⎵まもっている
#_0BFBF9: db $FC ; wait for key and new line
#_0BFBFA: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]に つつまれた
Message_03_00_E2:
#_0BFBFB: db $F1 ; write leader's name for team
#_0BFBFC: db $3E ; は
#_0BFBFD: db $F9 ; new line
#_0BFBFE: db $F3 ; write item name from $0A50
#_0BFBFF: db $3A, $CF, $36, $36, $43, $4E, $34 ; に⎵つつまれた
#_0BFC06: db $FC ; wait for key and new line
#_0BFC07: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]に みまもられた
Message_03_00_E3:
#_0BFC08: db $F1 ; write leader's name for team
#_0BFC09: db $3E ; は
#_0BFC0A: db $F9 ; new line
#_0BFC0B: db $F3 ; write item name from $0A50
#_0BFC0C: db $3A, $CF, $44, $43, $47, $4B, $4E, $34 ; に⎵みまもられた
#_0BFC14: db $FC ; wait for key and new line
#_0BFC15: db $FF ; end of message

;===================================================================================================

; [LEADER]は
; [ITEM]をはった
Message_03_00_E4:
#_0BFC16: db $F1 ; write leader's name for team
#_0BFC17: db $3E ; は
#_0BFC18: db $F9 ; new line
#_0BFC19: db $F3 ; write item name from $0A50
#_0BFC1A: db $51, $3E, $58, $34 ; をはった
#_0BFC1E: db $FC ; wait for key and new line
#_0BFC1F: db $FF ; end of message

;===================================================================================================

; [NAME2]を
; [ITEM]に ふうじこめた
Message_03_00_E5:
#_0BFC20: db $EC ; write someone's name
#_0BFC21: db $51 ; を
#_0BFC22: db $F9 ; new line
#_0BFC23: db $F3 ; write item name from $0A50
#_0BFC24: db $3A, $CF, $40, $27, $A2, $2E, $46, $34 ; に⎵ふうじこめた
#_0BFC2C: db $FC ; wait for key and new line
#_0BFC2D: db $FF ; end of message

;===================================================================================================

; アクマたちは たちさった
Message_03_00_E6:
#_0BFC2E: db $5D, $64, $7B, $34, $35, $3E, $CF, $34 ; アクマたちは⎵た
#_0BFC36: db $35, $2F, $58, $34 ; ちさった
#_0BFC3A: db $FC ; wait for key and new line
#_0BFC3B: db $FF ; end of message

;===================================================================================================

; しかし [ITEM]が みがわりになった
Message_03_00_E7:
#_0BFC3C: db $30, $2A, $30, $CF ; しかし⎵
#_0BFC40: db $F3 ; write item name from $0A50
#_0BFC41: db $9C, $CF, $44, $9C, $50, $4C, $3A, $39 ; が⎵みがわりにな
#_0BFC49: db $58, $34 ; った
#_0BFC4B: db $FC ; wait for key and new line
#_0BFC4C: db $FF ; end of message

;===================================================================================================

;                         
Message_03_01_00:
#_0BFC4D: db $CF, $CF, $CF, $CF, $CF, $CF, $CF, $CF ; ⎵⎵⎵⎵⎵⎵⎵⎵
#_0BFC55: db $CF, $CF, $CF, $CF, $CF, $CF, $CF, $CF ; ⎵⎵⎵⎵⎵⎵⎵⎵
#_0BFC5D: db $CF, $CF, $CF, $CF, $CF, $CF, $CF, $CF ; ⎵⎵⎵⎵⎵⎵⎵⎵
#_0BFC65: db $FF ; end of message

;===================================================================================================

; [CLASS] [DEMON1]が でた!
Message_03_01_01:
#_0BFC66: db $FA ; clear message box
#_0BFC67: db $F6 ; write class name from $0506
#_0BFC68: db $CF ; ⎵
#_0BFC69: db $F5 ; write demon name from $050A
#_0BFC6A: db $9C, $CF, $A9, $34, $94 ; が⎵でた!
#_0BFC6F: db $FF ; end of message

;===================================================================================================

; [DEMON1]が [LONG]たい いる!
Message_03_01_02:
#_0BFC70: db $F5 ; write demon name from $050A
#_0BFC71: db $9C, $CF ; が⎵
#_0BFC73: db $FB ; write 32-bit integer from $0A54
#_0BFC74: db $34, $26, $CF, $26, $4D, $94 ; たい⎵いる!
#_0BFC7A: db $FF ; end of message

;===================================================================================================

; [DEMON2]が [LONG]たい いる!
Message_03_01_03:
#_0BFC7B: db $E8 ; write demon name from $050C
#_0BFC7C: db $9C, $CF ; が⎵
#_0BFC7E: db $FB ; write 32-bit integer from $0A54
#_0BFC7F: db $34, $26, $CF, $26, $4D, $94 ; たい⎵いる!
#_0BFC85: db $FF ; end of message

;===================================================================================================

; [DEMON1]と [DEMON2]が でた!
Message_03_01_04:
#_0BFC86: db $FA ; clear message box
#_0BFC87: db $F5 ; write demon name from $050A
#_0BFC88: db $38, $CF ; と⎵
#_0BFC8A: db $E8 ; write demon name from $050C
#_0BFC8B: db $9C, $CF, $A9, $34, $94 ; が⎵でた!
#_0BFC90: db $FF ; end of message

;===================================================================================================

; [DEMON1]と [DEMON2]が いる!
Message_03_01_05:
#_0BFC91: db $F5 ; write demon name from $050A
#_0BFC92: db $38, $CF ; と⎵
#_0BFC94: db $E8 ; write demon name from $050C
#_0BFC95: db $9C, $CF, $26, $4D, $94 ; が⎵いる!
#_0BFC9A: db $FF ; end of message

;===================================================================================================

; [DEMON1]が[LONG]たい
Message_03_01_06:
#_0BFC9B: db $F5 ; write demon name from $050A
#_0BFC9C: db $9C ; が
#_0BFC9D: db $FB ; write 32-bit integer from $0A54
#_0BFC9E: db $34, $26 ; たい
#_0BFCA0: db $FF ; end of message

;===================================================================================================

; どうしますか?
Message_03_01_07:
#_0BFCA1: db $AA, $27, $30, $43, $31, $2A, $95 ; どうしますか?
#_0BFCA8: db $FF ; end of message

;===================================================================================================

; [DEMON2]が[LONG]たい
Message_03_01_08:
#_0BFCA9: db $E8 ; write demon name from $050C
#_0BFCAA: db $9C ; が
#_0BFCAB: db $FB ; write 32-bit integer from $0A54
#_0BFCAC: db $34, $26 ; たい
#_0BFCAE: db $FF ; end of message

;===================================================================================================

; [NAME2]は どうしますか?
Message_03_01_09:
#_0BFCAF: db $EC ; write someone's name
#_0BFCB0: db $3E, $CF, $AA, $27, $30, $43, $31, $2A ; は⎵どうしますか
#_0BFCB8: db $95 ; ?
#_0BFCB9: db $FF ; end of message

;===================================================================================================

; [LEADER]は にげだした
; ・・・・・・・・・・・・にげのびた
Message_03_01_0A:
#_0BFCBA: db $F1 ; write leader's name for team
#_0BFCBB: db $3E, $CF, $3A, $9F, $A6, $30, $34 ; は⎵にげだした
#_0BFCC2: db $F9 ; new line
#_0BFCC3: db $93 ; ・
#_0BFCC4: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCC7: db $93 ; ・
#_0BFCC8: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCCB: db $93 ; ・
#_0BFCCC: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCCF: db $93 ; ・
#_0BFCD0: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCD3: db $93 ; ・
#_0BFCD4: db $DF, $DF ; delay 7 frames [x2]
#_0BFCD6: db $93 ; ・
#_0BFCD7: db $DF, $DF ; delay 7 frames [x2]
#_0BFCD9: db $93 ; ・
#_0BFCDA: db $DF, $DF ; delay 7 frames [x2]
#_0BFCDC: db $93 ; ・
#_0BFCDD: db $DF, $DF ; delay 7 frames [x2]
#_0BFCDF: db $93 ; ・
#_0BFCE0: db $DF ; delay 7 frames
#_0BFCE1: db $93 ; ・
#_0BFCE2: db $DF ; delay 7 frames
#_0BFCE3: db $93 ; ・
#_0BFCE4: db $DF ; delay 7 frames
#_0BFCE5: db $93 ; ・
#_0BFCE6: db $DF ; delay 7 frames
#_0BFCE7: db $3A, $9F, $3D, $AC, $34 ; にげのびた
#_0BFCEC: db $FC ; wait for key and new line
#_0BFCED: db $FF ; end of message

;===================================================================================================

; [LEADER]は にげだした
; ・・・・・・・・・・・・こけた
Message_03_01_0B:
#_0BFCEE: db $F1 ; write leader's name for team
#_0BFCEF: db $3E, $CF, $3A, $9F, $A6, $30, $34 ; は⎵にげだした
#_0BFCF6: db $F9 ; new line
#_0BFCF7: db $93 ; ・
#_0BFCF8: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCFB: db $93 ; ・
#_0BFCFC: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFCFF: db $93 ; ・
#_0BFD00: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFD03: db $93 ; ・
#_0BFD04: db $DF, $DF, $DF ; delay 7 frames [x3]
#_0BFD07: db $93 ; ・
#_0BFD08: db $DF, $DF ; delay 7 frames [x2]
#_0BFD0A: db $93 ; ・
#_0BFD0B: db $DF, $DF ; delay 7 frames [x2]
#_0BFD0D: db $93 ; ・
#_0BFD0E: db $DF, $DF ; delay 7 frames [x2]
#_0BFD10: db $93 ; ・
#_0BFD11: db $DF, $DF ; delay 7 frames [x2]
#_0BFD13: db $93 ; ・
#_0BFD14: db $DF ; delay 7 frames
#_0BFD15: db $93 ; ・
#_0BFD16: db $DF ; delay 7 frames
#_0BFD17: db $93 ; ・
#_0BFD18: db $DF ; delay 7 frames
#_0BFD19: db $93 ; ・
#_0BFD1A: db $DF ; delay 7 frames
#_0BFD1B: db $2E, $2D, $34 ; こけた
#_0BFD1E: db $FC ; wait for key and new line
#_0BFD1F: db $FF ; end of message

;===================================================================================================

; しまった!!
; うしろが かべで にげられない
Message_03_01_0C:
#_0BFD20: db $30, $43, $58, $34, $94, $94 ; しまった!!
#_0BFD26: db $F9 ; new line
#_0BFD27: db $27, $30, $4F, $9C, $CF, $2A, $AE, $A9 ; うしろが⎵かべで
#_0BFD2F: db $CF, $3A, $9F, $4B, $4E, $39, $26 ; ⎵にげられない
#_0BFD36: db $FC ; wait for key and new line
#_0BFD37: db $FF ; end of message

;===================================================================================================

; [LEADER]は アクマに はなしかけた
Message_03_01_0D:
#_0BFD38: db $F1 ; write leader's name for team
#_0BFD39: db $3E, $CF, $5D, $64, $7B, $3A, $CF, $3E ; は⎵アクマに⎵は
#_0BFD41: db $39, $30, $2A, $2D, $34 ; なしかけた
#_0BFD46: db $FC ; wait for key and new line
#_0BFD47: db $FF ; end of message

;===================================================================================================

; みんな いっしょうけんめいたたかっている
Message_03_01_0E:
#_0BFD48: db $44, $52, $39, $CF, $26, $58, $30, $57 ; みんな⎵いっしょ
#_0BFD50: db $27, $2D, $52, $46, $26, $34, $34, $2A ; うけんめいたたか
#_0BFD58: db $58, $37, $26, $4D ; っている
#_0BFD5C: db $FF ; end of message

;===================================================================================================

; どちらに こうげきしますか?
Message_03_01_0F:
#_0BFD5D: db $AA, $35, $4B, $3A, $CF, $2E, $27, $9F ; どちらに⎵こうげ
#_0BFD65: db $2B, $30, $43, $31, $2A, $95 ; きしますか?
#_0BFD6B: db $FF ; end of message

;===================================================================================================

; これで よろしいですか?
Message_03_01_10:
#_0BFD6C: db $2E, $4E, $A9, $CF, $4A, $4F, $30, $26 ; これで⎵よろしい
#_0BFD74: db $A9, $31, $2A, $95 ; ですか?
#_0BFD78: db $FF ; end of message

;===================================================================================================

; [NAME2]の こうげき
Message_03_01_11:
#_0BFD79: db $EC ; write someone's name
#_0BFD7A: db $3D, $CF, $2E, $27, $9F, $2B ; の⎵こうげき
#_0BFD80: db $FC ; wait for key and new line
#_0BFD81: db $FF ; end of message

;===================================================================================================

; しまった! かわされた
Message_03_01_12:
#_0BFD82: db $30, $43, $58, $34, $94, $CF, $2A, $50 ; しまった!⎵かわ
#_0BFD8A: db $2F, $4E, $34 ; された
#_0BFD8D: db $FC ; wait for key and new line
#_0BFD8E: db $FF ; end of message

;===================================================================================================

; やった! [NAME2]は かわした
Message_03_01_13:
#_0BFD8F: db $48, $58, $34, $94, $CF ; やった!⎵
#_0BFD94: db $EC ; write someone's name
#_0BFD95: db $3E, $CF, $2A, $50, $30, $34 ; は⎵かわした
#_0BFD9B: db $FC ; wait for key and new line
#_0BFD9C: db $FF ; end of message

;===================================================================================================

; [NAME2]は [LONG]のダメージをうけた
Message_03_01_14:
#_0BFD9D: db $EC ; write someone's name
#_0BFD9E: db $3E, $CF ; は⎵
#_0BFDA0: db $FB ; write 32-bit integer from $0A54
#_0BFDA1: db $3D, $BF, $7E, $5A, $BB, $51, $27, $2D ; のダメージをうけ
#_0BFDA9: db $34 ; た
#_0BFDAA: db $FC ; wait for key and new line
#_0BFDAB: db $FF ; end of message

;===================================================================================================

; [NAME2]に [LONG]のダメージをあたえた
Message_03_01_15:
#_0BFDAC: db $EC ; write someone's name
#_0BFDAD: db $3A, $CF ; に⎵
#_0BFDAF: db $FB ; write 32-bit integer from $0A54
#_0BFDB0: db $3D, $BF, $7E, $5A, $BB, $51, $25, $34 ; のダメージをあた
#_0BFDB8: db $28, $34 ; えた
#_0BFDBA: db $FC ; wait for key and new line
#_0BFDBB: db $FF ; end of message

;===================================================================================================

; [NAME2]は [SPELL]をとなえた
; しかし まほうは ふうじこまれていた
Message_03_01_16:
#_0BFDBC: db $EC ; write someone's name
#_0BFDBD: db $3E, $CF ; は⎵
#_0BFDBF: db $F4 ; write spell name from $0A52
#_0BFDC0: db $51, $38, $39, $28, $34 ; をとなえた
#_0BFDC5: db $DF ; delay 7 frames
#_0BFDC6: db $F9 ; new line
#_0BFDC7: db $30, $2A, $30, $CF, $43, $42, $27, $3E ; しかし⎵まほうは
#_0BFDCF: db $CF, $40, $27, $A2, $2E, $43, $4E, $37 ; ⎵ふうじこまれて
#_0BFDD7: db $26, $34 ; いた
#_0BFDD9: db $FC ; wait for key and new line
#_0BFDDA: db $FF ; end of message

;===================================================================================================

; おっと はずしてしまった
Message_03_01_17:
#_0BFDDB: db $29, $58, $38, $CF, $3E, $A3, $30, $37 ; おっと⎵はずして
#_0BFDE3: db $30, $43, $58, $34 ; しまった
#_0BFDE7: db $FC ; wait for key and new line
#_0BFDE8: db $FF ; end of message

;===================================================================================================

; おっと [NAME2]は へいきだ
Message_03_01_18:
#_0BFDE9: db $29, $58, $38, $CF ; おっと⎵
#_0BFDED: db $EC ; write someone's name
#_0BFDEE: db $3E, $CF, $41, $26, $2B, $A6 ; は⎵へいきだ
#_0BFDF4: db $FC ; wait for key and new line
#_0BFDF5: db $FF ; end of message

;===================================================================================================

; ぜんぜん きいていない
Message_03_01_19:
#_0BFDF6: db $A4, $52, $A4, $52, $CF, $2B, $26, $37 ; ぜんぜん⎵きいて
#_0BFDFE: db $26, $39, $26 ; いない
#_0BFE01: db $FC ; wait for key and new line
#_0BFE02: db $FF ; end of message

;===================================================================================================

; [NAME2]には きかない
Message_03_01_1A:
#_0BFE03: db $EC ; write someone's name
#_0BFE04: db $3A, $3E, $CF, $2B, $2A, $39, $26 ; には⎵きかない
#_0BFE0B: db $FC ; wait for key and new line
#_0BFE0C: db $FF ; end of message

;===================================================================================================

; [NAME2]は ちからつきた
Message_03_01_1B:
#_0BFE0D: db $EC ; write someone's name
#_0BFE0E: db $3E, $CF, $35, $2A, $4B, $36, $2B, $34 ; は⎵ちからつきた
#_0BFE16: db $FC ; wait for key and new line
#_0BFE17: db $FF ; end of message

;===================================================================================================

; [NAME2] [LONG]たいに とどめをさした
Message_03_01_1C:
#_0BFE18: db $EC ; write someone's name
#_0BFE19: db $CF ; ⎵
#_0BFE1A: db $FB ; write 32-bit integer from $0A54
#_0BFE1B: db $34, $26, $3A, $CF, $38, $AA, $46, $51 ; たいに⎵とどめを
#_0BFE23: db $2F, $30, $34 ; さした
#_0BFE26: db $FC ; wait for key and new line
#_0BFE27: db $FF ; end of message

;===================================================================================================

; [CLASS] [DEMON1]を たおした
Message_03_01_1D:
#_0BFE28: db $F6 ; write class name from $0506
#_0BFE29: db $CF ; ⎵
#_0BFE2A: db $F5 ; write demon name from $050A
#_0BFE2B: db $51, $CF, $34, $29, $30, $34 ; を⎵たおした
#_0BFE31: db $FF ; end of message

;===================================================================================================

; アクマを たおした
Message_03_01_1E:
#_0BFE32: db $5D, $64, $7B, $51, $CF, $34, $29, $30 ; アクマを⎵たおし
#_0BFE3A: db $34 ; た
#_0BFE3B: db $FF ; end of message

;===================================================================================================

; [NAME2]は [LONG]のEXPをえた
Message_03_01_1F:
#_0BFE3C: db $EC ; write someone's name
#_0BFE3D: db $3E, $CF ; は⎵
#_0BFE3F: db $FB ; write 32-bit integer from $0A54
#_0BFE40: db $3D, $0F, $22, $1A, $51, $28, $34 ; のEXPをえた
#_0BFE47: db $FC ; wait for key and new line
#_0BFE48: db $FF ; end of message

;===================================================================================================

; [LONG]の おかねを てにいれた
Message_03_01_20:
#_0BFE49: db $FB ; write 32-bit integer from $0A54
#_0BFE4A: db $3D, $CF, $29, $2A, $3C, $51, $CF, $37 ; の⎵おかねを⎵て
#_0BFE52: db $3A, $26, $4E, $34 ; にいれた
#_0BFE56: db $FC ; wait for key and new line
#_0BFE57: db $FF ; end of message

;===================================================================================================

; [LONG]の マグネタイトを えた
Message_03_01_21:
#_0BFE58: db $FB ; write 32-bit integer from $0A54
#_0BFE59: db $3D, $CF, $7B, $B7, $74, $6C, $5E, $70 ; の⎵マグネタイト
#_0BFE61: db $51, $CF, $28, $34 ; を⎵えた
#_0BFE65: db $FC ; wait for key and new line
#_0BFE66: db $FF ; end of message

;===================================================================================================

; [LONG]この ませきを ひろった
Message_03_01_22:
#_0BFE67: db $FB ; write 32-bit integer from $0A54
#_0BFE68: db $2E, $3D, $CF, $43, $32, $2B, $51, $CF ; この⎵ませきを⎵
#_0BFE70: db $3F, $4F, $58, $34 ; ひろった
#_0BFE74: db $FC ; wait for key and new line
#_0BFE75: db $FF ; end of message

;===================================================================================================

; [LONG]この ほうぎょくを ひろった
Message_03_01_23:
#_0BFE76: db $FB ; write 32-bit integer from $0A54
#_0BFE77: db $2E, $3D, $CF, $42, $27, $9D, $57, $2C ; この⎵ほうぎょく
#_0BFE7F: db $51, $CF, $3F, $4F, $58, $34 ; を⎵ひろった
#_0BFE85: db $FC ; wait for key and new line
#_0BFE86: db $FF ; end of message

;===================================================================================================

; [ITEM]を ひろった
Message_03_01_24:
#_0BFE87: db $F3 ; write item name from $0A50
#_0BFE88: db $51, $CF, $3F, $4F, $58, $34 ; を⎵ひろった
#_0BFE8E: db $FC ; wait for key and new line
#_0BFE8F: db $FF ; end of message

;===================================================================================================

; [NAME2]の レベルが あがった!!
Message_03_01_25:
#_0BFE90: db $EC ; write someone's name
#_0BFE91: db $3D, $CF, $86, $C7, $85, $9C, $CF, $25 ; の⎵レベルが⎵あ
#_0BFE99: db $9C, $58, $34, $94, $94 ; がった!!
#_0BFE9E: db $FC ; wait for key and new line
#_0BFE9F: db $FF ; end of message

;===================================================================================================

; せんとうじょうたいで それどころではない
Message_03_01_26:
#_0BFEA0: db $32, $52, $38, $27, $A2, $57, $27, $34 ; せんとうじょうた
#_0BFEA8: db $26, $A9, $CF, $33, $4E, $AA, $2E, $4F ; いで⎵それどころ
#_0BFEB0: db $A9, $3E, $39, $26 ; ではない
#_0BFEB4: db $FC ; wait for key and new line
#_0BFEB5: db $FF ; end of message

;===================================================================================================

; はなせるじょうたいでは ない
Message_03_01_27:
#_0BFEB6: db $3E, $39, $32, $4D, $A2, $57, $27, $34 ; はなせるじょうた
#_0BFEBE: db $26, $A9, $3E, $CF, $39, $26 ; いでは⎵ない
#_0BFEC4: db $FC ; wait for key and new line
#_0BFEC5: db $FF ; end of message

;===================================================================================================

; そうびしていません
Message_03_01_28:
#_0BFEC6: db $33, $27, $AC, $30, $37, $26, $43, $32 ; そうびしていませ
#_0BFECE: db $52 ; ん
#_0BFECF: db $FC ; wait for key and new line
#_0BFED0: db $FF ; end of message

;===================================================================================================

; たまが そうびされていません
Message_03_01_29:
#_0BFED1: db $34, $43, $9C, $CF, $33, $27, $AC, $2F ; たまが⎵そうびさ
#_0BFED9: db $4E, $37, $26, $43, $32, $52 ; れていません
#_0BFEDF: db $FC ; wait for key and new line
#_0BFEE0: db $FF ; end of message

;===================================================================================================

; [NAME2]は コンピュータに もどった
Message_03_01_2A:
#_0BFEE1: db $EC ; write someone's name
#_0BFEE2: db $3E, $CF, $66, $8A, $CA, $90, $5A, $6C ; は⎵コンピュータ
#_0BFEEA: db $3A, $CF, $47, $AA, $58, $34 ; に⎵もどった
#_0BFEF0: db $FC ; wait for key and new line
#_0BFEF1: db $FF ; end of message

;===================================================================================================

; [NAME2]は とくぎを もっていない
Message_03_01_2B:
#_0BFEF2: db $EC ; write someone's name
#_0BFEF3: db $3E, $CF, $38, $2C, $9D, $51, $CF, $47 ; は⎵とくぎを⎵も
#_0BFEFB: db $58, $37, $26, $39, $26 ; っていない
#_0BFF00: db $FC ; wait for key and new line
#_0BFF01: db $FF ; end of message

;===================================================================================================

; [LEADER]は アクマの ふいをついた
Message_03_01_2C:
#_0BFF02: db $F1 ; write leader's name for team
#_0BFF03: db $3E, $CF, $5D, $64, $7B, $3D, $CF, $40 ; は⎵アクマの⎵ふ
#_0BFF0B: db $26, $51, $36, $26, $34 ; いをついた
#_0BFF10: db $FC ; wait for key and new line
#_0BFF11: db $FF ; end of message

;===================================================================================================

; アクマが とつぜん おそいかかってきた
Message_03_01_2D:
#_0BFF12: db $5D, $64, $7B, $9C, $CF, $38, $36, $A4 ; アクマが⎵とつぜ
#_0BFF1A: db $52, $CF, $29, $33, $26, $2A, $2A, $58 ; ん⎵おそいかかっ
#_0BFF22: db $37, $2B, $34 ; てきた
#_0BFF25: db $FC ; wait for key and new line
#_0BFF26: db $FF ; end of message

;===================================================================================================

; [NAME2]の ガンが ひをふいた
Message_03_01_2E:
#_0BFF27: db $EC ; write someone's name
#_0BFF28: db $3D, $CF, $B5, $8A, $9C, $CF, $3F, $51 ; の⎵ガンが⎵ひを
#_0BFF30: db $40, $26, $34 ; ふいた
#_0BFF33: db $FC ; wait for key and new line
#_0BFF34: db $FF ; end of message

;===================================================================================================

; [NAME2]は きりかかった
Message_03_01_2F:
#_0BFF35: db $EC ; write someone's name
#_0BFF36: db $3E, $CF, $2B, $4C, $2A, $2A, $58, $34 ; は⎵きりかかった
#_0BFF3E: db $FC ; wait for key and new line
#_0BFF3F: db $FF ; end of message

;===================================================================================================

; [NAME2]は いちがえを した
Message_03_01_30:
#_0BFF40: db $EC ; write someone's name
#_0BFF41: db $3E, $CF, $26, $35, $9C, $28, $51, $CF ; は⎵いちがえを⎵
#_0BFF49: db $30, $34 ; した
#_0BFF4B: db $FC ; wait for key and new line
#_0BFF4C: db $FF ; end of message

;===================================================================================================

; [NAME2]は ナカマを よんだ
Message_03_01_31:
#_0BFF4D: db $EC ; write someone's name
#_0BFF4E: db $3E, $CF, $71, $62, $7B, $51, $CF, $4A ; は⎵ナカマを⎵よ
#_0BFF56: db $52, $A6 ; んだ
#_0BFF58: db $FC ; wait for key and new line
#_0BFF59: db $FF ; end of message

;===================================================================================================

; [NAME2]は ナカマを もどした
Message_03_01_32:
#_0BFF5A: db $EC ; write someone's name
#_0BFF5B: db $3E, $CF, $71, $62, $7B, $51, $CF, $47 ; は⎵ナカマを⎵も
#_0BFF63: db $AA, $30, $34 ; どした
#_0BFF66: db $FC ; wait for key and new line
#_0BFF67: db $FF ; end of message

;===================================================================================================

; [LEADER]は うしろから おそわれた
Message_03_01_33:
#_0BFF68: db $F1 ; write leader's name for team
#_0BFF69: db $3E, $CF, $27, $30, $4F, $2A, $4B, $CF ; は⎵うしろから⎵
#_0BFF71: db $29, $33, $50, $4E, $34 ; おそわれた
#_0BFF76: db $FC ; wait for key and new line
#_0BFF77: db $FF ; end of message

;===================================================================================================

; [NAME2]は はねかえした
Message_03_01_34:
#_0BFF78: db $EC ; write someone's name
#_0BFF79: db $3E, $CF, $3E, $3C, $2A, $28, $30, $34 ; は⎵はねかえした
#_0BFF81: db $FC ; wait for key and new line
#_0BFF82: db $FF ; end of message

;===================================================================================================

; しまった はねかえされた
Message_03_01_35:
#_0BFF83: db $30, $43, $58, $34, $CF, $3E, $3C, $2A ; しまった⎵はねか
#_0BFF8B: db $28, $2F, $4E, $34 ; えされた
#_0BFF8F: db $FC ; wait for key and new line
#_0BFF90: db $FF ; end of message

;===================================================================================================

; [NAME2]は まほうを おぼえた
Message_03_01_36:
#_0BFF91: db $EC ; write someone's name
#_0BFF92: db $3E, $CF, $43, $42, $27, $51, $CF, $29 ; は⎵まほうを⎵お
#_0BFF9A: db $AF, $28, $34 ; ぼえた
#_0BFF9D: db $FC ; wait for key and new line
#_0BFF9E: db $FF ; end of message

;===================================================================================================

; しかし [ITEM]が みがわりになった
Message_03_01_37:
#_0BFF9F: db $30, $2A, $30, $CF ; しかし⎵
#_0BFFA3: db $F3 ; write item name from $0A50
#_0BFFA4: db $9C, $CF, $44, $9C, $50, $4C, $3A, $39 ; が⎵みがわりにな
#_0BFFAC: db $58, $34 ; った
#_0BFFAE: db $FC ; wait for key and new line
#_0BFFAF: db $FF ; end of message

;===================================================================================================

; [NAME2]は しあわせだ
Message_03_01_38:
#_0BFFB0: db $EC ; write someone's name
#_0BFFB1: db $3E, $CF, $30, $25, $50, $32, $A6 ; は⎵しあわせだ
#_0BFFB8: db $FC ; wait for key and new line
#_0BFFB9: db $FF ; end of message

;===================================================================================================

; [NAME2]は みを まもった
; あわせだ
; [NAME2]は みを まもった
; [NAME2]は しあわせだ
; [NAME2]は みを まもった
; わせだ
; [NAME2]は みを まもった
; TODO WTF?
Message_03_01_39:
#_0BFFBA: db $EC ; write someone's name
#_0BFFBB: db $3E, $CF, $44, $51, $CF, $43, $47, $58 ; は⎵みを⎵まもっ
#_0BFFC3: db $34 ; た
#_0BFFC4: db $FC ; wait for key and new line
#_0BFFC5: db $FF ; end of message

#_0BFFC6: db $25, $50, $32, $A6 ; あわせだ
#_0BFFCA: db $FC ; wait for key and new line
#_0BFFCB: db $FF ; end of message

#_0BFFCC: db $EC ; write someone's name
#_0BFFCD: db $3E, $CF, $44, $51, $CF, $43, $47, $58 ; は⎵みを⎵まもっ
#_0BFFD5: db $34 ; た
#_0BFFD6: db $FC ; wait for key and new line
#_0BFFD7: db $FF ; end of message

#_0BFFD8: db $FC ; wait for key and new line
#_0BFFD9: db $FF ; end of message

#_0BFFDA: db $EC ; write someone's name
#_0BFFDB: db $3E, $CF, $30, $25, $50, $32, $A6 ; は⎵しあわせだ
#_0BFFE2: db $FC ; wait for key and new line
#_0BFFE3: db $FF ; end of message

#_0BFFE4: db $EC ; write someone's name
#_0BFFE5: db $3E, $CF, $44, $51, $CF, $43, $47, $58 ; は⎵みを⎵まもっ
#_0BFFED: db $34 ; た
#_0BFFEE: db $FC ; wait for key and new line
#_0BFFEF: db $FF ; end of message

#_0BFFF0: db $50, $32, $A6 ; わせだ
#_0BFFF3: db $FC ; wait for key and new line
#_0BFFF4: db $FF ; end of message

#_0BFFF5: db $EC ; write someone's name
#_0BFFF6: db $3E, $CF, $44, $51, $CF, $43, $47, $58 ; は⎵みを⎵まもっ
#_0BFFFE: db $34 ; た
#_0BFFFF: db $FC ; wait for key and new line

;===================================================================================================
