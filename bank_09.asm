org $098000

#_098000: dw PTR16_09FA7A
#_098002: dw PTR16_09F794
#_098004: dw PTR16_09F818
#_098006: dw PTR16_09F882
#_098008: dw PTR16_09F958
#_09800A: dw PTR16_09F9E2
#_09800C: dw PTR16_09FB00
#_09800E: dw PTR16_09FB36
#_098010: dw PTR16_09FB7E
#_098012: dw PTR16_09FBB2
#_098014: dw PTR16_09FBC2

;===================================================================================================
; Demon names
;===================================================================================================
DemonNames:

.demon_00_name ; VUiSIyuNU | ヴィシュヌ
#_098016: db kVU, kIIs, kSI, kYUs, kNU, $FF

.demon_01_name ; INDORA | インドラ
#_09801C: db kII, kNN, kDO, kRA, $FF

.demon_02_name ; HUDOUMIyoUOU | フドウミョウオウ
#_098021: db kHU, kDO, kUU, kMI, kYOs, kUU, kOO, kUU, $FF

.demon_03_name ; O-DEiN | オーディン
#_09802A: db kOO, h__, kDE, kIIs, kNN, $FF

.demon_04_name ; ARAHABAKI | アラハバキ
#_098030: db kAA, kRA, kHA, kBA, kKI, $FF

.demon_05_name ; ROKI | ロキ
#_098036: db kRO, kKI, $FF

.demon_06_name ; RAKUSIyuMI | ラクシュミ
#_098039: db kRA, kKU, kSI, kYUs, kMI, $FF

.demon_07_name ; KIKURIHIME | キクリヒメ
#_09803F: db kKI, kKU, kRI, kHI, kME, $FF

.demon_08_name ; SARASUVUaTEi | サラスヴァティ
#_098045: db kSA, kRA, kSU, kVU, kAAs, kTE, kIIs, $FF

.demon_09_name ; KUSINADAHIME | クシナダヒメ
#_09804D: db kKU, kSI, kNA, kDA, kHI, kME, $FF

.demon_0A_name ; AMENOUZUME | アメノウズメ
#_098054: db kAA, kME, kNO, kUU, kZU, kME, $FF

.demon_0B_name ; ASURAOU | アスラおう
#_09805B: db kAA, kSU, kRA, hOO, hUU, $FF

.demon_0C_name ; SIVUa | シヴァ
#_098061: db kSI, kVU, kAAs, $FF

.demon_0D_name ; MAHAKA-RA | マハカーラ
#_098065: db kMA, kHA, kKA, h__, kRA, $FF

.demon_0E_name ; SEITENTAISEI | セイテンタイセイ
#_09806B: db kSE, kII, kTE, kNN, kTA, kII, kSE, kII, $FF

.demon_0F_name ; INDORAZItsuTO | インドラジット
#_098074: db kII, kNN, kDO, kRA, kZI, kTSUs, kTO, $FF

.demon_10_name ; YAMA | ヤマ
#_09807C: db kYA, kMA, $FF

.demon_11_name ; RA-VUaNA | ラーヴァナ
#_09807F: db kRA, h__, kVU, kAAs, kNA, $FF

.demon_12_name ; AGUNI | アグニ
#_098085: db kAA, kGU, kNI, $FF

.demon_13_name ; BISIyaMONTEN | ビシャモンテン
#_098089: db kBI, kSI, kYAs, kMO, kNN, kTE, kNN, $FF

.demon_14_name ; NIOU | ニオウ
#_098091: db kNI, kOO, kUU, $FF

.demon_15_name ; TAKEMIKADUTI | タケミカヅチ
#_098095: db kTA, kKE, kMI, kKA, kDU, kTI, $FF

.demon_16_name ; HINOKAGUTUTI | ヒノカグツチ
#_09809C: db kHI, kNO, kKA, kGU, kTU, kTI, $FF

.demon_17_name ; ZIKOKUTEN | ジコクテン
#_0980A3: db kZI, kKO, kKU, kTE, kNN, $FF

.demon_18_name ; KOUMOKUTEN | コウモクテン
#_0980A9: db kKO, kUU, kMO, kKU, kTE, kNN, $FF

.demon_19_name ; ZOUTIyoUTEN | ゾウチョウテン
#_0980B0: db kZO, kUU, kTI, kYOs, kUU, kTE, kNN, $FF

.demon_1A_name ; NAGASUNEHIKO | ナガスネヒコ
#_0980B8: db kNA, kGA, kSU, kNE, kHI, kKO, $FF

.demon_1B_name ; TAKEMINAKATA | タケミナカタ
#_0980BF: db kTA, kKE, kMI, kNA, kKA, kTA, $FF

.demon_1C_name ; OOMONONUSI | オオモノヌシ
#_0980C6: db kOO, kOO, kMO, kNO, kNU, kSI, $FF

.demon_1D_name ; KOTOSIRONUSI | コトシロヌシ
#_0980CD: db kKO, kTO, kSI, kRO, kNU, kSI, $FF

.demon_1E_name ; HITOKOTONUSI | ヒトコトヌシ
#_0980D4: db kHI, kTO, kKO, kTO, kNU, kSI, $FF

.demon_1F_name ; MIKAERU | ミカエル
#_0980DB: db kMI, kKA, kEE, kRU, $FF

.demon_20_name ; GABURIERU | ガブリエル
#_0980E0: db kGA, kBU, kRI, kEE, kRU, $FF

.demon_21_name ; RAHUaERU | ラファエル
#_0980E6: db kRA, kHU, kAAs, kEE, kRU, $FF

.demon_22_name ; URIERU | ウリエル
#_0980EC: db kUU, kRI, kEE, kRU, $FF

.demon_23_name ; KERUPU | ケルプ
#_0980F1: db kKE, kRU, kPU, $FF

.demon_24_name ; SORONE | ソロネ
#_0980F5: db kSO, kRO, kNE, $FF

.demon_25_name ; DOMINION | ドミニオン
#_0980F9: db kDO, kMI, kNI, kOO, kNN, $FF

.demon_26_name ; VUa-TIya- | ヴァーチャー
#_0980FF: db kVU, kAAs, h__, kTI, kYAs, h__, $FF

.demon_27_name ; PAWA- | パワー
#_098106: db kPA, kWA, h__, $FF

.demon_28_name ; A-KUENZIeRU | アークエンジェル
#_09810A: db kAA, h__, kKU, kEE, kNN, kZI, kEEs, kRU, $FF

.demon_29_name ; ENZIeRU | エンジェル
#_098113: db kEE, kNN, kZI, kEEs, kRU, $FF

.demon_2A_name ; ANANTA | アナンタ
#_098119: db kAA, kNA, kNN, kTA, $FF

.demon_2B_name ; MAYA | マヤ
#_09811E: db kMA, kYA, $FF

.demon_2C_name ; PEKUYON | ペクヨン
#_098121: db kPE, kKU, kYO, kNN, $FF

.demon_2D_name ; VURITORA | ヴリトラ
#_098126: db kVU, kRI, kTO, kRA, $FF

.demon_2E_name ; GANGA- | ガンガー
#_09812B: db kGA, kNN, kGA, h__, $FF

.demon_2F_name ; KOWATORIKUE | コワトリクエ
#_098130: db kKO, kWA, kTO, kRI, kKU, kEE, $FF

.demon_30_name ; GARU-DA | ガルーダ
#_098137: db kGA, kRU, h__, kDA, $FF

.demon_31_name ; YATAGARASU | ヤタガラス
#_09813C: db kYA, kTA, kGA, kRA, kSU, $FF

.demon_32_name ; HUeNItsuKUSU | フェニックス
#_098142: db kHU, kEEs, kNI, kTSUs, kKU, kSU, $FF

.demon_33_name ; ZIyaTA-YU | ジャターユ
#_098149: db kZI, kYAs, kTA, h__, kYU, $FF

.demon_34_name ; HOUOU | ホウオウ
#_09814F: db kHO, kUU, kOO, kUU, $FF

.demon_35_name ; BARON | バロン
#_098154: db kBA, kRO, kNN, $FF

.demon_36_name ; KIMAIRA | キマイラ
#_098158: db kKI, kMA, kII, kRA, $FF

.demon_37_name ; NARASINHA | ナラシンハ
#_09815D: db kNA, kRA, kSI, kNN, kHA, $FF

.demon_38_name ; NANDEi | ナンディ
#_098163: db kNA, kNN, kDE, kIIs, $FF

.demon_39_name ; GENBU | ゲンブ
#_098168: db kGE, kNN, kBU, $FF

.demon_3A_name ; KIRIN | キリン
#_09816C: db kKI, kRI, kNN, $FF

.demon_3B_name ; PAPIRUSAGU | パピルサグ
#_098170: db kPA, kPI, kRU, kSA, kGU, $FF

.demon_3C_name ; HAKUTAKU | ハクタク
#_098176: db kHA, kKU, kTA, kKU, $FF

.demon_3D_name ; YUNIKO-N | ユニコーン
#_09817B: db kYU, kNI, kKO, h__, kNN, $FF

.demon_3E_name ; SARAMANDA- | サラマンダー
#_098181: db kSA, kRA, kMA, kNN, kDA, h__, $FF

.demon_3F_name ; UNDEi-NE | ウンディーネ
#_098188: db kUU, kNN, kDE, kIIs, h__, kNE, $FF

.demon_40_name ; SIRUHU | シルフ
#_09818F: db kSI, kRU, kHU, $FF

.demon_41_name ; NO-MU | ノーム
#_098193: db kNO, h__, kMU, $FF

.demon_42_name ; HUREIMI-ZU | フレイミーズ
#_098197: db kHU, kRE, kII, kMI, h__, kZU, $FF

.demon_43_name ; AKUANZU | アクアンズ
#_09819E: db kAA, kKU, kAA, kNN, kZU, $FF

.demon_44_name ; EAROSU | エアロス
#_0981A4: db kEE, kAA, kRO, kSU, $FF

.demon_45_name ; A-SI-ZU | アーシーズ
#_0981A9: db kAA, h__, kSI, h__, kZU, $FF

.demon_46_name ; KA-RI- | カーリー
#_0981AF: db kKA, h__, kRI, h__, $FF

.demon_47_name ; HARITEi- | ハリティー
#_0981B4: db kHA, kRI, kTE, kIIs, h__, $FF

.demon_48_name ; RANDA | ランダ
#_0981BA: db kRA, kNN, kDA, $FF

.demon_49_name ; SUKIyuRA | スキュラ
#_0981BE: db kSU, kKI, kYUs, kRA, $FF

.demon_4A_name ; DA-KINI- | ダーキニー
#_0981C3: db kDA, h__, kKI, kNI, h__, $FF

.demon_4B_name ; GORUGON | ゴルゴン
#_0981C9: db kGO, kRU, kGO, kNN, $FF

.demon_4C_name ; TA-RAKA | ターラカ
#_0981CE: db kTA, h__, kRA, kKA, $FF

.demon_4D_name ; RAMIA | ラミア
#_0981D3: db kRA, kMI, kAA, $FF

.demon_4E_name ; HANUMA-N | ハヌマーン
#_0981D7: db kHA, kNU, kMA, h__, kNN, $FF

.demon_4F_name ; GANE-SIya | ガネーシャ
#_0981DD: db kGA, kNE, h__, kSI, kYAs, $FF

.demon_50_name ; KINNARA | キンナラ
#_0981E3: db kKI, kNN, kNA, kRA, $FF

.demon_51_name ; Tengu | テング | Tengu
#_0981E8: db kTE, kNN, kGU, $FF

.demon_52_name ; KORONZON | コロンゾン
#_0981EC: db kKO, kRO, kNN, kZO, kNN, $FF

.demon_53_name ; ONKOtsuTO | オンコット
#_0981F2: db kOO, kNN, kKO, kTSUs, kTO, $FF

.demon_54_name ; ROA | ロア
#_0981F8: db kRO, kAA, $FF

.demon_55_name ; UOtsuTIya- | ウオッチャー
#_0981FB: db kUU, kOO, kTSUs, kTI, kYAs, h__, $FF

.demon_56_name ; ISORA | イソラ
#_098202: db kII, kSO, kRA, $FF

.demon_57_name ; APUSARASU | アプサラス
#_098206: db kAA, kPU, kSA, kRA, kSU, $FF

.demon_58_name ; KINNARI- | キンナリー
#_09820C: db kKI, kNN, kNA, kRI, h__, $FF

.demon_59_name ; VUaNPAIA | ヴァンパイア
#_098212: db kVU, kAAs, kNN, kPA, kII, kAA, $FF

.demon_5A_name ; SAKIyuBASU | サキュバス
#_098219: db kSA, kKI, kYUs, kBA, kSU, $FF

.demon_5B_name ; INKIyuBASU | インキュバス
#_09821F: db kII, kNN, kKI, kYUs, kBA, kSU, $FF

.demon_5C_name ; NI-KARON | ニ・カロン
#_098226: db kNI, k__, kKA, kRO, kNN, $FF

.demon_5D_name ; TIyuRURUtsuKU | チュルルック
#_09822C: db kTI, kYUs, kRU, kRU, kTSUs, kKU, $FF

.demon_5E_name ; RIRIMU | リリム
#_098233: db kRI, kRI, kMU, $FF

.demon_5F_name ; NAITOMEA | ナイトメア
#_098237: db kNA, kII, kTO, kME, kAA, $FF

.demon_60_name ; KIyaKU | キャク
#_09823D: db kKI, kYAs, kKU, $FF

.demon_61_name ; INPU | インプ
#_098241: db kII, kNN, kPU, $FF

.demon_62_name ; OBERON | オベロン
#_098245: db kOO, kBE, kRO, kNN, $FF

.demon_63_name ; SENKO | センコ
#_09824A: db kSE, kNN, kKO, $FF

.demon_64_name ; KU-HU--RIN | クーフー・リン
#_09824E: db kKU, h__, kHU, h__, k__, kRI, kNN, $FF

.demon_65_name ; TAMU-RIN | タム・リン
#_098256: db kTA, kMU, k__, kRI, kNN, $FF

.demon_66_name ; TORO-RU | トロール
#_09825C: db kTO, kRO, h__, kRU, $FF

.demon_67_name ; SENRI | センリ
#_098261: db kSE, kNN, kRI, $FF

.demon_68_name ; HOBUGOBURIN | ホブゴブリン
#_098265: db kHO, kBU, kGO, kBU, kRI, kNN, $FF

.demon_69_name ; ERUHU | エルフ
#_09826C: db kEE, kRU, kHU, $FF

.demon_6A_name ; KERUPI- | ケルピー
#_098270: db kKE, kRU, kPI, h__, $FF

.demon_6B_name ; RUSA-RUKA | ルサールカ
#_098275: db kRU, kSA, h__, kRU, kKA, $FF

.demon_6C_name ; GANDARUBA | ガンダルバ
#_09827B: db kGA, kNN, kDA, kRU, kBA, $FF

.demon_6D_name ; DORIA-DO | ドリアード
#_098281: db kDO, kRI, kAA, h__, kDO, $FF

.demon_6E_name ; ZIyatsuKURANTAN | ジャックランタン
#_098287: db kZI, kYAs, kTSUs, kKU, kRA, kNN, kTA, kNN, $FF

.demon_6F_name ; ZIyatsuKUHUROSUTO | ジャックフロスト
#_098290: db kZI, kYAs, kTSUs, kKU, kHU, kRO, kSU, kTO, $FF

.demon_70_name ; Goburin | ゴブリン | Goblin TODO ?
#_098299: db kGO, kBU, kRI, kNN, $FF

.demon_71_name ; PIKUSI- | ピクシー
#_09829E: db kPI, kKU, kSI, h__, $FF

.demon_72_name ; HURAROUSU | フラロウス
#_0982A3: db kHU, kRA, kRO, kUU, kSU, $FF

.demon_73_name ; HURU-RETEi | フルーレティ
#_0982A9: db kHU, kRU, h__, kRE, kTE, kIIs, $FF

.demon_74_name ; ABADON | アバドン
#_0982B0: db kAA, kBA, kDO, kNN, $FF

.demon_75_name ; SAMAERU | サマエル
#_0982B5: db kSA, kMA, kEE, kRU, $FF

.demon_76_name ; MARUKOKIASU | マルコキアス
#_0982BA: db kMA, kRU, kKO, kKI, kAA, kSU, $FF

.demon_77_name ; OSE | オセ
#_0982C1: db kOO, kSE, $FF

.demon_78_name ; DEKARABIA | デカラビア
#_0982C4: db kDE, kKA, kRA, kBI, kAA, $FF

.demon_79_name ; REONARUDO | レオナルド
#_0982CA: db kRE, kOO, kNA, kRU, kDO, $FF

.demon_7A_name ; OROBASU | オロバス
#_0982D0: db kOO, kRO, kBA, kSU, $FF

.demon_7B_name ; SITORI- | シトリー
#_0982D5: db kSI, kTO, kRI, h__, $FF

.demon_7C_name ; BERISU | ベリス
#_0982DA: db kBE, kRI, kSU, $FF

.demon_7D_name ; HUoRUNEUSU | フォルネウス
#_0982DE: db kHU, kOOs, kRU, kNE, kUU, kSU, $FF

.demon_7E_name ; GAMIZIN | ガミジン
#_0982E5: db kGA, kMI, kZI, kNN, $FF

.demon_7F_name ; ANDORASU | アンドラス
#_0982EA: db kAA, kNN, kDO, kRA, kSU, $FF

.demon_80_name ; Pendoragon | ペンドラゴン | Pendragon
#_0982F0: db kPE, kNN, kDO, kRA, kGO, kNN, $FF

.demon_81_name ; YAMATANOOROTI | ヤマタノオロチ
#_0982F7: db kYA, kMA, kTA, kNO, kOO, kRO, kTI, $FF

.demon_82_name ; ITUaMU-NA- | イツァム・ナー
#_0982FF: db kII, kTU, kAAs, kMU, k__, kNA, h__, $FF

.demon_83_name ; KETUARUKATORU | ケツアルカトル
#_098307: db kKE, kTU, kAA, kRU, kKA, kTO, kRU, $FF

.demon_84_name ; YURUNGU | ユルング
#_09830F: db kYU, kRU, kNN, kGU, $FF

.demon_85_name ; NA-GA-RAZIya | ナーガ・ラジャ
#_098314: db kNA, h__, kGA, k__, kRA, kZI, kYAs, $FF

.demon_86_name ; SEIRE-N | セイレーン
#_09831C: db kSE, kII, kRE, h__, kNN, $FF

.demon_87_name ; BAIBU-KAHA | バイブ・カハ
#_098322: db kBA, kII, kBU, k__, kKA, kHA, $FF

.demon_88_name ; KOKAKUTIyoU | コカクチョウ
#_098329: db kKO, kKA, kKU, kTI, kYOs, kUU, $FF

.demon_89_name ; HA-PI- | ハーピー
#_098330: db kHA, h__, kPI, h__, $FF

.demon_8A_name ; GURIHUoN | グリフォン
#_098335: db kGU, kRI, kHU, kOOs, kNN, $FF

.demon_8B_name ; KERUBEROSU | ケルベロス
#_09833B: db kKE, kRU, kBE, kRO, kSU, $FF

.demon_8C_name ; RAKUTIyaRANGO | ラクチャランゴ
#_098341: db kRA, kKU, kTI, kYAs, kRA, kNN, kGO, $FF

.demon_8D_name ; ORUTOROSU | オルトロス
#_098349: db kOO, kRU, kTO, kRO, kSU, $FF

.demon_8E_name ; TAMUZU | タムズ
#_09834F: db kTA, kMU, kZU, $FF

.demon_8F_name ; SUTO-NKA | ストーンカ
#_098353: db kSU, kTO, h__, kNN, kKA, $FF

.demon_90_name ; NEKOMATA | ネコマタ
#_098359: db kNE, kKO, kMA, kTA, $FF

.demon_91_name ; TANKI | タンキ
#_09835E: db kTA, kNN, kKI, $FF

.demon_92_name ; KA-SI- | カーシー
#_098362: db kKA, h__, kSI, h__, $FF

.demon_93_name ; SANKI | サンキ
#_098367: db kSA, kNN, kKI, $FF

.demon_94_name ; YAKUSIya | ヤクシャ
#_09836B: db kYA, kKU, kSI, kYAs, $FF

.demon_95_name ; NATAKU | ナタク
#_098370: db kNA, kTA, kKU, $FF

.demon_96_name ; MEZUKI | メズキ
#_098374: db kME, kZU, kKI, $FF

.demon_97_name ; GOZUKI | ゴズキ
#_098378: db kGO, kZU, kKI, $FF

.demon_98_name ; YAKUSINI- | ヤクシニー
#_09837C: db kYA, kKU, kSI, kNI, h__, $FF

.demon_99_name ; SUPARUTOI | スパルトイ
#_098382: db kSU, kPA, kRU, kTO, kII, $FF

.demon_9A_name ; SIyuTENDOUZI | シュテンドウジ
#_098388: db kSI, kYUs, kTE, kNN, kDO, kUU, kZI, $FF

.demon_9B_name ; TOURUDAKU | トウルダク
#_098390: db kTO, kUU, kRU, kDA, kKU, $FF

.demon_9C_name ; IBARAGIDOUZI | イバラギドウジ
#_098396: db kII, kBA, kRA, kGI, kDO, kUU, kZI, $FF

.demon_9D_name ; PURUSIKI | プルシキ
#_09839E: db kPU, kRU, kSI, kKI, $FF

.demon_9E_name ; MOMUNOHU | モムノフ
#_0983A3: db kMO, kMU, kNO, kHU, $FF

.demon_9F_name ; BO-GURU | ボーグル
#_0983A8: db kBO, h__, kGU, kRU, $FF

.demon_A0_name ; AZUMI | アズミ
#_0983AD: db kAA, kZU, kMI, $FF

.demon_A1_name ; ATORASU | アトラス
#_0983B1: db kAA, kTO, kRA, kSU, $FF

.demon_A2_name ; ZIyaIANTO | ジャイアント
#_0983B6: db kZI, kYAs, kII, kAA, kNN, kTO, $FF

.demon_A3_name ; SARUTAHIKO | サルタヒコ
#_0983BD: db kSA, kRU, kTA, kHI, kKO, $FF

.demon_A4_name ; KAWANTIya | カワンチャ
#_0983C3: db kKA, kWA, kNN, kTI, kYAs, $FF

.demon_A5_name ; DOWA-HU | ドワーフ
#_0983C9: db kDO, kWA, h__, kHU, $FF

.demon_A6_name ; BUtsuKABU- | ブッカブー
#_0983CE: db kBU, kTSUs, kKA, kBU, h__, $FF

.demon_A7_name ; TUTIGUMO | ツチグモ
#_0983D4: db kTU, kTI, kGU, kMO, $FF

.demon_A8_name ; HUaHAN | ファハン
#_0983D9: db kHU, kAAs, kHA, kNN, $FF

.demon_A9_name ; KOBORUTO | コボルト
#_0983DE: db kKO, kBO, kRU, kTO, $FF

.demon_AA_name ; NOtsuKA- | ノッカー
#_0983E3: db kNO, kTSUs, kKA, h__, $FF

.demon_AB_name ; BURAUNI- | ブラウニー
#_0983E8: db kBU, kRA, kUU, kNI, h__, $FF

.demon_AC_name ; WA-URUHU | ワーウルフ
#_0983EE: db kWA, h__, kUU, kRU, kHU, $FF

.demon_AD_name ; WA-KIyatsuTO | ワーキャット
#_0983F4: db kWA, h__, kKI, kYAs, kTSUs, kTO, $FF

.demon_AE_name ; WA-DOtsuGU | ワードッグ
#_0983FB: db kWA, h__, kDO, kTSUs, kGU, $FF

.demon_AF_name ; SUKIyaNA- | スキャナー
#_098401: db kSU, kKI, kYAs, kNA, h__, $FF

.demon_B0_name ; MEIGASU | メイガス
#_098407: db kME, kII, kGA, kSU, $FF

.demon_B1_name ; TENPURUNAITO | テンプルナイト
#_09840C: db kTE, kNN, kPU, kRU, kNA, kII, kTO, $FF

.demon_B2_name ; KIyoUSINSIya | きょうしんしゃ
#_098414: db hKI, hYOs, hUU, hSI, hNN, hSI, hYAs, $FF

.demon_B3_name ; Asasin | アサシン | Assassin TODO ???
#_09841C: db kAA, kSA, kSI, kNN, $FF

.demon_B4_name ; YAMIHOUSI | やみほうし
#_098421: db hYA, hMI, hHO, hUU, hSI, $FF

.demon_B5_name ; ONIZIyoROU | おにじょろう
#_098427: db hOO, hNI, hZI, hYOs, hRO, hUU, $FF

.demon_B6_name ; HAKAISOU | はかいそう
#_09842E: db hHA, hKA, hII, hSO, hUU, $FF

.demon_B7_name ; SIyoKEIRAIDA- | しょけいライダー
#_098434: db hSI, hYOs, hKE, hII, kRA, kII, kDA, h__, $FF

.demon_B8_name ; TOtsuKOUTAI | とっこうたい
#_09843D: db hTO, hTSUs, hKO, hUU, hTA, hII, $FF

.demon_B9_name ; TOUTETU | トウテツ
#_098444: db kTO, kUU, kTE, kTU, $FF

.demon_BA_name ; O-KASU | オーカス
#_098449: db kOO, h__, kKA, kSU, $FF

.demon_BB_name ; TETOKATORIPOKA | テトカトリポカ
#_09844E: db kTE, kTO, kKA, kTO, kRI, kPO, kKA, $FF

.demon_BC_name ; MISIyaGUZISAMA | ミシャグジさま
#_098456: db kMI, kSI, kYAs, kGU, kZI, hSA, hMA, $FF

.demon_BD_name ; BERUZEBUBU | ベルゼブブ
#_09845E: db kBE, kRU, kZE, kBU, kBU, $FF

.demon_BE_name ; MA-RA | マーラ
#_098464: db kMA, h__, kRA, $FF

.demon_BF_name ; BAERU | バエル
#_098468: db kBA, kEE, kRU, $FF

.demon_C0_name ; DAGON | ダゴン
#_09846C: db kDA, kGO, kNN, $FF

.demon_C1_name ; ARIOKU | アリオク
#_098470: db kAA, kRI, kOO, kKU, $FF

.demon_C2_name ; HUaHUNI-RU | ファフニール
#_098475: db kHU, kAAs, kHU, kNI, h__, kRU, $FF

.demon_C3_name ; SA-PENTO | サーペント
#_09847C: db kSA, h__, kPE, kNN, kTO, $FF

.demon_C4_name ; BAZIRISUKU | バジリスク
#_098482: db kBA, kZI, kRI, kSU, kKU, $FF

.demon_C5_name ; WAIBA-N | ワイバーン
#_098488: db kWA, kII, kBA, h__, kNN, $FF

.demon_C6_name ; WAIA-MU | ワイアーム
#_09848E: db kWA, kII, kAA, h__, kMU, $FF

.demon_C7_name ; KOKATORAISU | コカトライス
#_098494: db kKO, kKA, kTO, kRA, kII, kSU, $FF

.demon_C8_name ; WA-MU | ワーム
#_09849B: db kWA, h__, kMU, $FF

.demon_C9_name ; HURESUBERUGU | フレスベルグ
#_09849F: db kHU, kRE, kSU, kBE, kRU, kGU, $FF

.demon_CA_name ; GURURU | グルル
#_0984A6: db kGU, kRU, kRU, $FF

.demon_CB_name ; HURIAI | フリアイ
#_0984AA: db kHU, kRI, kAA, kII, $FF

.demon_CC_name ; HUKEI | フケイ
#_0984AF: db kHU, kKE, kII, $FF

.demon_CD_name ; HUeNRIRU | フェンリル
#_0984B3: db kHU, kEEs, kNN, kRI, kRU, $FF

.demon_CE_name ; KURA-KEN | クラーケン
#_0984B9: db kKU, kRA, h__, kKE, kNN, $FF

.demon_CF_name ; MANTEiKOA | マンティコア
#_0984BF: db kMA, kNN, kTE, kIIs, kKO, kAA, $FF

.demon_D0_name ; TAMAMO | タマモ
#_0984C6: db kTA, kMA, kMO, $FF

.demon_D1_name ; ATUYU | アツユ
#_0984CA: db kAA, kTU, kYU, $FF

.demon_D2_name ; NUE | ヌエ
#_0984CE: db kNU, kEE, $FF

.demon_D3_name ; GIRIMEKARA | ギリメカラ
#_0984D1: db kGI, kRI, kME, kKA, kRA, $FF

.demon_D4_name ; SAIKUROPUSU | サイクロプス
#_0984D7: db kSA, kII, kKU, kRO, kPU, kSU, $FF

.demon_D5_name ; RAKUSIya-SA | ラクシャーサ
#_0984DE: db kRA, kKU, kSI, kYAs, h__, kSA, $FF

.demon_D6_name ; BA-BEGAZI | バーベガジ
#_0984E5: db kBA, h__, kBE, kGA, kZI, $FF

.demon_D7_name ; RAKE- | ラケー
#_0984EB: db kRA, kKE, h__, $FF

.demon_D8_name ; UeNDEiGO | ウェンディゴ
#_0984EF: db kUU, kEEs, kNN, kDE, kIIs, kGO, $FF

.demon_D9_name ; O-KU | オーク
#_0984F6: db kOO, h__, kKU, $FF

.demon_DA_name ; DONKOU | ドンコウ
#_0984FA: db kDO, kNN, kKO, kUU, $FF

.demon_DB_name ; GUREMURIN | グレムリン
#_0984FF: db kGU, kRE, kMU, kRI, kNN, $FF

.demon_DC_name ; RItsuTI | リッチ
#_098505: db kRI, kTSUs, kTI, $FF

.demon_DD_name ; VUe-TARA | ヴェータラ
#_098509: db kVU, kEEs, h__, kTA, kRA, $FF

.demon_DE_name ; SANNI-YAKA- | サンニ・ヤカー
#_09850F: db kSA, kNN, kNI, k__, kYA, kKA, h__, $FF

.demon_DF_name ; SAUoBAKU | サウォバク
#_098517: db kSA, kUU, kOOs, kBA, kKU, $FF

.demon_E0_name ; BEIKOKU | ベイコク
#_09851D: db kBE, kII, kKO, kKU, $FF

.demon_E1_name ; MANI-TA- | マンイーター
#_098522: db kMA, kNN, kII, h__, kTA, h__, $FF

.demon_E2_name ; GU-RU | グール
#_098529: db kGU, h__, kRU, $FF

.demon_E3_name ; OSITI | おしち
#_09852D: db hOO, hSI, hTI, $FF

.demon_E4_name ; GAKI | ガキ
#_098531: db kGA, kKI, $FF

.demon_E5_name ; REGION | レギオン
#_098534: db kRE, kGI, kOO, kNN, $FF

.demon_E6_name ; HUaNTOMU | ファントム
#_098539: db kHU, kAAs, kNN, kTO, kMU, $FF

.demon_E7_name ; RARUUaI | ラルウァイ
#_09853F: db kRA, kRU, kUU, kAAs, kII, $FF

.demon_E8_name ; PISIya-TIya | ピシャーチャ
#_098545: db kPI, kSI, kYAs, h__, kTI, kYAs, $FF

.demon_E9_name ; REMURU-SU | レムルース
#_09854C: db kRE, kMU, kRU, h__, kSU, $FF

.demon_EA_name ; SIeIDO | シェイド
#_098552: db kSI, kEEs, kII, kDO, $FF

.demon_EB_name ; GO-SUTO | ゴースト
#_098557: db kGO, h__, kSU, kTO, $FF

.demon_EC_name ; KO-PUSU | コープス
#_09855C: db kKO, h__, kPU, kSU, $FF

.demon_ED_name ; ZONBIA-MI- | ゾンビアーミー
#_098561: db kZO, kNN, kBI, kAA, h__, kMI, h__, $FF

.demon_EE_name ; BODEiKONIAN | ボディコニアン
#_098569: db kBO, kDE, kIIs, kKO, kNI, kAA, kNN, $FF

.demon_EF_name ; ZONBIKOtsuPU | ゾンビコップ
#_098571: db kZO, kNN, kBI, kKO, kTSUs, kPU, $FF

.demon_F0_name ; OBATARION | オバタリオン
#_098578: db kOO, kBA, kTA, kRI, kOO, kNN, $FF

.demon_F1_name ; REDEi-ZONBI | レディーゾンビ
#_09857F: db kRE, kDE, kIIs, h__, kZO, kNN, kBI, $FF

.demon_F2_name ; ZONBI | ゾンビ
#_098587: db kZO, kNN, kBI, $FF

.demon_F3_name ; BAtsuKUBEA-DO | バックベアード
#_09858B: db kBA, kTSUs, kKU, kBE, kAA, h__, kDO, $FF

.demon_F4_name ; BURAtsuKUU-ZU | ブラックウーズ
#_098593: db kBU, kRA, kTSUs, kKU, kUU, h__, kZU, $FF

.demon_F5_name ; SURAIMU | スライム
#_09859B: db kSU, kRA, kII, kMU, $FF

.demon_F6_name ; MOURIyoU | モウリョウ
#_0985A0: db kMO, kUU, kRI, kYOs, kUU, $FF

.demon_F7_name ; YAKUZA | やくざ
#_0985A6: db hYA, hKU, hZA, $FF

.demon_F8_name ; TINPIRA | ちんぴら
#_0985AA: db hTI, hNN, hPI, hRA, $FF

.demon_F9_name ; T95D | T95D | T95D
#_0985AF: db "T95D", $FF

.demon_FA_name ; T95C/P | T95C/P | T95C/P
#_0985B4: db "T95C/P", $FF

.demon_FB_name ; T93G | T93G | T93G
#_0985BB: db "T93G", $FF

.demon_FC_name ; BItsuTOBO-RU | ビットボール
#_0985C0: db kBI, kTSUs, kTO, kBO, h__, kRU, $FF

.demon_FD_name ; BItsuGUHUtsuTO | ビッグフット
#_0985C7: db kBI, kTSUs, kGU, kHU, kTSUs, kTO, $FF

.demon_FE_name ; KUGUTU | クグツ
#_0985CE: db kKU, kGU, kTU, $FF

.demon_FF_name ; GAtsuTAIHUNOU | がったいふのう
#_0985D2: db hGA, hTSUs, hTA, hII, hHU, hNO, hUU, $FF

DATA8_0985DA:
#_0985DA: db $61,$84,$5D,$69,$FF
DATA8_0985DF:
#_0985DF: db $5D,$7B,$75,$67,$64,$B5,$7C,$FF
DATA8_0985E7:
#_0985E7: db $C3,$5F,$7B,$8A,$FF
DATA8_0985EC:
#_0985EC: db $B9,$70,$5F,$FF
DATA8_0985F0:
#_0985F0: db $70,$5A,$85,$FF
DATA8_0985F4:
#_0985F4: db $2A,$26,$A2,$52,$FF
DATA8_0985F9:
#_0985F9: db $2A,$26,$A2,$52,$FF
DATA8_0985FE:
#_0985FE: db $6C,$65,$7C,$71,$62,$6C,$FF
DATA8_098605:
#_098605: db $5D,$85,$65,$72,$5A,$FF
DATA8_09860B:
#_09860B: db $C7,$84,$5D,$85,$FF
DATA8_098610:
#_098610: db $74,$C5,$87,$69,$FF
DATA8_098615:
#_098615: db $2D,$26,$AC,$68,$69,$6F,$7D,$FF
DATA8_09861D:
#_09861D: db $62,$BC,$78,$8D,$85,$FF
DATA8_098623:
#_098623: db $76,$72,$60,$85,$FF
DATA8_098628:
#_098628: db $80,$7B,$FF
DATA8_09862B:
#_09862B: db $72,$61,$5F,$FF
DATA8_09862F:
#_09862F: db $83,$C3,$8A,$FF
DATA8_098633:
#_098633: db $60,$63,$C3,$71,$FF
DATA8_098638:
#_098638: db $CE,$8C,$68,$90,$73,$FF
DATA8_09863E:
#_09863E: db $83,$5A,$CE,$8B,$71,$FF
DATA8_098644:
#_098644: db $5E,$8A,$C3,$83,$BB,$92,$70,$FF
DATA8_09864C:
#_09864C: db $B5,$C6,$84,$60,$85,$FF
DATA8_098652:
#_098652: db $5F,$84,$60,$85,$FF
DATA8_098657:
#_098657: db $83,$78,$8B,$60,$85,$FF
DATA8_09865D:
#_09865D: db $5D,$84,$61,$64,$FF
DATA8_098662:
#_098662: db $5D,$69,$6C,$87,$70,$FF
DATA8_098668:
#_098668: db $69,$85,$70,$FF
DATA8_09866C:
#_09866C: db $87,$5F,$77,$5A,$87,$5A,$FF
DATA8_098673:
#_098673: db $62,$61,$69,$77,$5A,$87,$5A,$FF
DATA8_09867B:
#_09867B: db $84,$84,$69,$FF
DATA8_09867F:
#_09867F: db $C7,$85,$BD,$C6,$C6,$FF
DATA8_098685:
#_098685: db $7C,$62,$60,$85,$FF
DATA8_09868A:
#_09868A: db $5D,$69,$83,$29,$27,$FF
DATA8_098690:
#_098690: db $BD,$8A,$63,$FF
DATA8_098694:
#_098694: db $B9,$63,$FF
DATA8_098697:
#_098697: db $C2,$5E,$C5,$92,$70,$FF
DATA8_09869D:
#_09869D: db $CC,$5E,$85,$83,$5E,$BF,$5A,$FF
DATA8_0986A5:
#_0986A5: db $A6,$26,$33,$27,$A2,$57,$27,$FF
DATA8_0986AD:
#_0986AD: db $7B,$67,$62,$C3,$2F,$43,$FF
DATA8_0986B4:
#_0986B4: db $62,$7E,$FF
DATA8_0986B7:
#_0986B7: db $6C,$66,$FF
DATA8_0986BA:
#_0986BA: db $C5,$68,$8F,$7F,$8A,$6F,$8A,$FF
DATA8_0986C2:
#_0986C2: db $30,$37,$52,$3D,$27,$FF
DATA8_0986C8:
#_0986C8: db $4E,$52,$2B,$3D,$2D,$52,$FF
DATA8_0986CF:
#_0986CF: db $40,$27,$A2,$52,$2D,$52,$FF
DATA8_0986D6:
#_0986D6: db $4B,$26,$A2,$52,$2D,$52,$FF
DATA8_0986DD:
#_0986DD: db $2A,$4C,$56,$27,$2D,$52,$FF
DATA8_0986E4:
#_0986E4: db $2C,$2F,$39,$9D,$3D,$36,$4D,$9D
#_0986EC: db $FF
DATA8_0986ED:
#_0986ED: db $40,$36,$3D,$44,$34,$43,$FF
DATA8_0986F4:
#_0986F4: db $25,$46,$3D,$45,$4B,$2C,$47,$FF
DATA8_0986FC:
#_0986FC: db $3F,$3D,$2A,$9E,$36,$35,$FF
DATA8_098703:
#_098703: db $60,$8A,$BD,$85,$84,$8A,$B7,$FF
DATA8_09870B:
#_09870B: db $C9,$69,$62,$85,$FF
DATA8_098710:
#_098710: db $50,$4D,$29,$FF
DATA8_098714:
#_098714: db $7B,$BB,$8A,$FF
DATA8_098718:
#_098718: db $7E,$B5,$7C,$FF
DATA8_09871C:
#_09871C: db $6F,$8A,$7B,$FF
DATA8_098720:
#_098720: db $63,$68,$8A,$FF
DATA8_098724:
#_098724: db $6A,$83,$78,$FF
DATA8_098728:
#_098728: db $6F,$8A,$68,$FF
DATA8_09872C:
#_09872C: db $84,$90,$5F,$BB,$8A,$FF
DATA8_098732:
#_098732: db $86,$5E,$6D,$91,$5F,$FF
DATA8_098738:
#_098738: db $68,$8A,$BB,$90,$5F,$FF
DATA8_09873E:
#_09873E: db $6A,$5E,$BB,$90,$5F,$FF
DATA8_098744:
#_098744: db $6A,$5E,$86,$5E,$FF
DATA8_098749:
#_098749: db $63,$BB,$91,$FF
DATA8_09874D:
#_09874D: db $82,$5F,$7B,$FF
DATA8_098751:
#_098751: db $80,$7B,$FF
DATA8_098754:
#_098754: db $82,$5F,$6A,$5E,$FF
DATA8_098759:
#_098759: db $BF,$6F,$8A,$68,$FF
DATA8_09875E:
#_09875E: db $84,$90,$5F,$61,$5F,$FF
DATA8_098764:
#_098764: db $82,$5F,$6D,$91,$5F,$FF
DATA8_09876A:
#_09876A: db $7B,$BB,$90,$5F,$FF
DATA8_09876F:
#_09876F: db $70,$5F,$63,$FF
DATA8_098773:
#_098773: db $82,$5F,$63,$FF
DATA8_098777:
#_098777: db $6D,$86,$5E,$FF
DATA8_09877B:
#_09877B: db $BB,$90,$5F,$BB,$8A,$FF
DATA8_098781:
#_098781: db $7E,$68,$5D,$63,$91,$5F,$70,$FF
DATA8_098789:
#_098789: db $B5,$5E,$5D,$63,$91,$5F,$70,$FF
DATA8_098791:
#_098791: db $BB,$8F,$68,$8A,$FF
DATA8_098796:
#_098796: db $7B,$61,$5F,$FF
DATA8_09879A:
#_09879A: db $BB,$8F,$84,$90,$5F,$FF
DATA8_0987A0:
#_0987A0: db $63,$91,$5F,$6D,$91,$5F,$FF
DATA8_0987A7:
#_0987A7: db $82,$5F,$BB,$90,$5F,$FF
DATA8_0987AD:
#_0987AD: db $BB,$8F,$63,$FF
DATA8_0987B1:
#_0987B1: db $81,$5F,$63,$FF
DATA8_0987B5:
#_0987B5: db $5D,$64,$84,$91,$5F,$FF
DATA8_0987BB:
#_0987BB: db $68,$63,$FF
DATA8_0987BE:
#_0987BE: db $B8,$C3,$5F,$FF
DATA8_0987C2:
#_0987C2: db $7B,$68,$8A,$FF
DATA8_0987C6:
#_0987C6: db $5E,$73,$FF
DATA8_0987C9:
#_0987C9: db $6D,$91,$5F,$BB,$8A,$FF
DATA8_0987CF:
#_0987CF: db $65,$8A,$FF

;===================================================================================================
; Spell names
;===================================================================================================
SpellNames:
.spell_00_name ; AGI | アギ
#_0987D2: db kAA, kGI, $FF

.spell_01_name ; AGIRAO | アギラオ
#_0987D5: db kAA, kGI, kRA, kOO, $FF

.spell_02_name ; MAHARAGI | マハラギ
#_0987DA: db kMA, kHA, kRA, kGI, $FF

.spell_03_name ; MAHARAGION | マハラギオン
#_0987DF: db kMA, kHA, kRA, kGI, kOO, kNN, $FF

.spell_04_name ; BUHU | ブフ
#_0987E6: db kBU, kHU, $FF

.spell_05_name ; BUHU-RA | ブフーラ
#_0987E9: db kBU, kHU, h__, kRA, $FF

.spell_06_name ; MAHA-BUHU | マハーブフ
#_0987EE: db kMA, kHA, h__, kBU, kHU, $FF

.spell_07_name ; MAHABUHU-RA | マハブフーラ
#_0987F4: db kMA, kHA, kBU, kHU, h__, kRA, $FF

.spell_08_name ; ZIO | ジオ
#_0987FB: db kZI, kOO, $FF

.spell_09_name ; ZIONGA | ジオンガ
#_0987FE: db kZI, kOO, kNN, kGA, $FF

.spell_0A_name ; MAHAZIO | マハジオ
#_098803: db kMA, kHA, kZI, kOO, $FF

.spell_0B_name ; MAHAZIONGA | マハジオンガ
#_098808: db kMA, kHA, kZI, kOO, kNN, kGA, $FF

.spell_0C_name ; ZAN | ザン
#_09880F: db kZA, kNN, $FF

.spell_0D_name ; ZANMA | ザンマ
#_098812: db kZA, kNN, kMA, $FF

.spell_0E_name ; MAHAZAN | マハザン
#_098816: db kMA, kHA, kZA, kNN, $FF

.spell_0F_name ; MAHAZANMA | マハザンマ
#_09881B: db kMA, kHA, kZA, kNN, kMA, $FF

.spell_10_name ; TENTARAHU- | テンタラフー
#_098821: db kTE, kNN, kTA, kRA, kHU, h__, $FF

.spell_11_name ; RIMUDO-RA | リムドーラ
#_098828: db kRI, kMU, kDO, h__, kRA, $FF

.spell_12_name ; MEGIDO | メギド
#_09882E: db kME, kGI, kDO, $FF

.spell_13_name ; MEGIDORAON | メギドラオン
#_098832: db kME, kGI, kDO, kRA, kOO, kNN, $FF

.spell_14_name ; MATORAPO- | マトラポー
#_098839: db kMA, kTO, kRA, kPO, h__, $FF

.spell_15_name ; HANMA | ハンマ
#_09883F: db kHA, kNN, kMA, $FF

.spell_16_name ; MAHANMA | マハンマ
#_098843: db kMA, kHA, kNN, kMA, $FF

.spell_17_name ; MUDO | ムド
#_098848: db kMU, kDO, $FF

.spell_18_name ; MUDOON | ムドオン
#_09884B: db kMU, kDO, kOO, kNN, $FF

.spell_19_name ; DORUMINA- | ドルミナー
#_098850: db kDO, kRU, kMI, kNA, h__, $FF

.spell_1A_name ; SIBABU- | シバブー
#_098856: db kSI, kBA, kBU, h__, $FF

.spell_1B_name ; PURINPA | プリンパ
#_09885B: db kPU, kRI, kNN, kPA, $FF

.spell_1C_name ; HAPIRUMA | ハピルマ
#_098860: db kHA, kPI, kRU, kMA, $FF

.spell_1D_name ; MARINKARIN | マリンカリン
#_098865: db kMA, kRI, kNN, kKA, kRI, kNN, $FF

.spell_1E_name ; MAKAZIyaMA | マカジャマ
#_09886C: db kMA, kKA, kZI, kYAs, kMA, $FF

.spell_1F_name ; MAKATORANDA | マカトランダ
#_098872: db kMA, kKA, kTO, kRA, kNN, kDA, $FF

.spell_20_name ; TARUNDA | タルンダ
#_098879: db kTA, kRU, kNN, kDA, $FF

.spell_21_name ; RAKUNDA | ラクンダ
#_09887E: db kRA, kKU, kNN, kDA, $FF

.spell_22_name ; SUKUNDA | スクンダ
#_098883: db kSU, kKU, kNN, kDA, $FF

.spell_23_name ; TARUKAZIya | タルカジャ
#_098888: db kTA, kRU, kKA, kZI, kYAs, $FF

.spell_24_name ; RAKUKAZIya | ラクカジャ
#_09888E: db kRA, kKU, kKA, kZI, kYAs, $FF

.spell_25_name ; SUKUKAZIya | スクカジャ
#_098894: db kSU, kKU, kKA, kZI, kYAs, $FF

.spell_26_name ; MAKAKAZIya | マカカジャ
#_09889A: db kMA, kKA, kKA, kZI, kYAs, $FF

.spell_27_name ; TETORAZIya | テトラジャ
#_0988A0: db kTE, kTO, kRA, kZI, kYAs, $FF

.spell_28_name ; MAKARAKA-N | マカラカーン
#_0988A6: db kMA, kKA, kRA, kKA, h__, kNN, $FF

.spell_29_name ; TETORAKA-N | テトラカーン
#_0988AD: db kTE, kTO, kRA, kKA, h__, kNN, $FF

.spell_2A_name ; DEiA | ディア
#_0988B4: db kDE, kIIs, kAA, $FF

.spell_2B_name ; DEiARAMA | ディアラマ
#_0988B8: db kDE, kIIs, kAA, kRA, kMA, $FF

.spell_2C_name ; DEiARAHAN | ディアラハン
#_0988BE: db kDE, kIIs, kAA, kRA, kHA, kNN, $FF

.spell_2D_name ; MEDEiA | メディア
#_0988C5: db kME, kDE, kIIs, kAA, $FF

.spell_2E_name ; MEDEiARAHAN | メディアラハン
#_0988CA: db kME, kDE, kIIs, kAA, kRA, kHA, kNN, $FF

.spell_2F_name ; PATORA | パトラ
#_0988D2: db kPA, kTO, kRA, $FF

.spell_30_name ; PENPATORA | ペンパトラ
#_0988D6: db kPE, kNN, kPA, kTO, kRA, $FF

.spell_31_name ; POZUMUDEi | ポズムディ
#_0988DC: db kPO, kZU, kMU, kDE, kIIs, $FF

.spell_32_name ; PARARADEi | パララディ
#_0988E2: db kPA, kRA, kRA, kDE, kIIs, $FF

.spell_33_name ; PETORADEi | ペトラディ
#_0988E8: db kPE, kTO, kRA, kDE, kIIs, $FF

.spell_34_name ; RIKA-MU | リカーム
#_0988EE: db kRI, kKA, h__, kMU, $FF

.spell_35_name ; SAMARIKA-MU | サマリカーム
#_0988F3: db kSA, kMA, kRI, kKA, h__, kMU, $FF

.spell_36_name ; RIKA-MUDORA | リカームドラ
#_0988FA: db kRI, kKA, h__, kMU, kDO, kRA, $FF

.spell_37_name ; MAKATORA | マカトラ
#_098901: db kMA, kKA, kTO, kRA, $FF

.spell_38_name ; MAtsuPA- | マッパー
#_098906: db kMA, kTSUs, kPA, h__, $FF

.spell_39_name ; TORAESUTO | トラエスト
#_09890B: db kTO, kRA, kEE, kSU, kTO, $FF

.spell_3A_name ; TORAPO-TO | トラポート
#_098911: db kTO, kRA, kPO, h__, kTO, $FF

.spell_3B_name ; TORAHU-RI | トラフーリ
#_098917: db kTO, kRA, kHU, h__, kRI, $FF

.spell_3C_name ; ESUTOMA | エストマ
#_09891D: db kEE, kSU, kTO, kMA, $FF

.spell_3D_name ; SABATOMA | サバトマ
#_098922: db kSA, kBA, kTO, kMA, $FF

.spell_3E_name ; SABATOMAON | サバトマオン
#_098927: db kSA, kBA, kTO, kMA, kOO, kNN, $FF

.spell_3F_name ; null
#_09892E: db $FF

.spell_40_name ; PARARAAI | パララアイ
#_09892F: db kPA, kRA, kRA, kAA, kII, $FF

.spell_41_name ; PETORAAI | ペトラアイ
#_098935: db kPE, kTO, kRA, kAA, kII, $FF

.spell_42_name ; SIHENOMITI | しへのみち
#_09893B: db hSI, hHE, hNO, hMI, hTI, $FF

.spell_43_name ; BURAtsuDOSUTI-RU | ブラッドスチール
#_098941: db kBU, kRA, kTSUs, kDO, kSU, kTI, h__, kRU, $FF

.spell_44_name ; BAERUNONOROI | バエルののろい
#_09894A: db kBA, kEE, kRU, hNO, hNO, hRO, hII, $FF

.spell_45_name ; SEKUSI-DANSU | セクシーダンス
#_098952: db kSE, kKU, kSI, h__, kDA, kNN, kSU, $FF

.spell_46_name ; HAtsuPI-SUTEtsuPU | ハッピーステップ
#_09895A: db kHA, kTSUs, kPI, h__, kSU, kTE, kTSUs, kPU, $FF

.spell_47_name ; SIAWASENOUTA | しあわせのうた
#_098963: db hSI, hAA, hWA, hSE, hNO, hUU, hTA, $FF

.spell_48_name ; KOMORIUTA | こもりうた
#_09896B: db hKO, hMO, hRI, hUU, hTA, $FF

.spell_49_name ; PANItsuKUBOISU | パニックボイス
#_098971: db kPA, kNI, kTSUs, kKU, kBO, kII, kSU, $FF

.spell_4A_name ; BAINDOBOISU | バインドボイス
#_098979: db kBA, kII, kNN, kDO, kBO, kII, kSU, $FF

.spell_4B_name ; AKUMANOKISU | あくまのキス
#_098981: db hAA, hKU, hMA, hNO, kKI, kSU, $FF

.spell_4C_name ; AKUMANOKISU | あくまのキス
#_098988: db hAA, hKU, hMA, hNO, kKI, kSU, $FF

.spell_4D_name ; DEBIRUSUMAIRU | デビルスマイル
#_09898F: db kDE, kBI, kRU, kSU, kMA, kII, kRU, $FF

.spell_4E_name ; HUaIABURESU | ファイアブレス
#_098997: db kHU, kAAs, kII, kAA, kBU, kRE, kSU, $FF

.spell_4F_name ; AISUBURESU | アイスブレス
#_09899F: db kAA, kII, kSU, kBU, kRE, kSU, $FF

.spell_50_name ; DOKUGASUBURESU | どくガスブレス
#_0989A6: db hDO, hKU, kGA, kSU, kBU, kRE, kSU, $FF

.spell_51_name ; HUotsuGUBURESU | フォッグブレス
#_0989AE: db kHU, kOOs, kTSUs, kGU, kBU, kRE, kSU, $FF

.spell_52_name ; HUaIABO-RU | ファイアボール
#_0989B6: db kHU, kAAs, kII, kAA, kBO, h__, kRU, $FF

.spell_53_name ; DENGEKI | でんげき
#_0989BE: db hDE, hNN, hGE, hKI, $FF

.spell_54_name ; DESUTAtsuTI | デスタッチ
#_0989C3: db kDE, kSU, kTA, kTSUs, kTI, $FF

.spell_55_name ; MIZUNOKABE | みずのかべ
#_0989C9: db hMI, hZU, hNO, hKA, hBE, $FF

.spell_56_name ; HONOONOKABE | ほのおのかべ
#_0989CF: db hHO, hNO, hOO, hNO, hKA, hBE, $FF

.spell_57_name ; KAMITUKI | かみつき
#_0989D6: db hKA, hMI, hTU, hKI, $FF

.spell_58_name ; DOKUKAMITUKI | どくかみつき
#_0989DB: db hDO, hKU, hKA, hMI, hTU, hKI, $FF

.spell_59_name ; MAHIKAMITUKI | まひかみつき
#_0989E2: db hMA, hHI, hKA, hMI, hTU, hKI, $FF

.spell_5A_name ; SEKIKAKAMITUKI | せきかかみつき
#_0989E9: db hSE, hKI, hKA, hKA, hMI, hTU, hKI, $FF

.spell_5B_name ; MIWAKUKAMITUKI | みわくかみつき
#_0989F1: db hMI, hWA, hKU, hKA, hMI, hTU, hKI, $FF

.spell_5C_name ; HItsuKAKI | ひっかき
#_0989F9: db hHI, hTSUs, hKA, hKI, $FF

.spell_5D_name ; DOKUHItsuKAKI | どくひっかき
#_0989FE: db hDO, hKU, hHI, hTSUs, hKA, hKI, $FF

.spell_5E_name ; MAHIHItsuKAKI | まひひっかき
#_098A05: db hMA, hHI, hHI, hTSUs, hKA, hKI, $FF

.spell_5F_name ; DOKUBARI | どくばり
#_098A0C: db hDO, hKU, hBA, hRI, $FF

.spell_60_name ; MAHIBARI | まひばり
#_098A11: db hMA, hHI, hBA, hRI, $FF

.spell_61_name ; HABATAKI | はばたき
#_098A16: db hHA, hBA, hTA, hKI, $FF

.spell_62_name ; TUKUMOBARI | つくもばり
#_098A1B: db hTU, hKU, hMO, hBA, hRI, $FF

.spell_63_name ; TAIATARI | たいあたり
#_098A21: db hTA, hII, hAA, hTA, hRI, $FF

.spell_64_name ; MAKITUKI | まきつき
#_098A27: db hMA, hKI, hTU, hKI, $FF

.spell_65_name ; ABAREMAWARI | あばれまわり
#_098A2C: db hAA, hBA, hRE, hMA, hWA, hRI, $FF

.spell_66_name ; OSITUBUSI | おしつぶし
#_098A33: db hOO, hSI, hTU, hBU, hSI, $FF

.spell_67_name ; HItsuSATU | ひっさつ
#_098A39: db hHI, hTSUs, hSA, hTU, $FF

.spell_68_name ; TE-RU | テール
#_098A3E: db kTE, h__, kRU, $FF

.spell_69_name ; KAISIN | かいしん
#_098A42: db hKA, hII, hSI, hNN, $FF

.spell_6A_name ; null
#_098A47: db $FF

.spell_6B_name ; null
#_098A48: db $FF

.spell_6C_name ; null
#_098A49: db $FF

.spell_6D_name ; null
#_098A4A: db $FF

.spell_6E_name ; null
#_098A4B: db $FF

.spell_6F_name ; null
#_098A4C: db $FF

.spell_70_name ; null
#_098A4D: db $FF

.spell_71_name ; null
#_098A4E: db $FF

.spell_72_name ; null
#_098A4F: db $FF

.spell_73_name ; MAMORU | まもる
#_098A50: db hMA, hMO, hRU, $FF

.spell_74_name ; NIKERU | にける
#_098A54: db hNI, hKE, hRU, $FF

.spell_75_name ; NAKAMAYOBI | なかまよび
#_098A58: db hNA, hKA, hMA, hYO, hBI, $FF

.spell_76_name ; null
#_098A5E: db $FF

.spell_77_name ; null
#_098A5F: db $FF

.spell_78_name ; null
#_098A60: db $FF

.spell_79_name ; null
#_098A61: db $FF

.spell_7A_name ; null
#_098A62: db $FF

.spell_7B_name ; null
#_098A63: db $FF

.spell_7C_name ; null
#_098A64: db $FF

.spell_7D_name ; null
#_098A65: db $FF

.spell_7E_name ; null
#_098A66: db $FF

.spell_7F_name ; null
#_098A67: db $FF


;===================================================================================================
; Item names
;===================================================================================================
ItemNames:
.item_00_name ; Atakkunaifu | アタックナイフ | Attack knife
#_098A68: db kAA, kTA, kTSUs, kKU, kNA, kII, kHU, $FF

.item_01_name ; Machetto | マチェット | Machete
#_098A70: db kMA, kTI, kEEs, kTSUs, kTO, $FF

.item_02_name ; Tonfā | トンファー | Tonfa
#_098A76: db kTO, kNN, kHU, kAAs, h__, $FF

.item_03_name ; Supaikuroddo | スパイクロッド | Spike rod
#_098A7C: db kSU, kPA, kII, kKU, kRO, kTSUs, kDO, $FF

.item_04_name ; Mozō-gatana| もぞうとう | Replica sword
#_098A84: db hMO, hZO, hUU, hTO, hUU, $FF

.item_05_name ; Mumei no katana | むめいのかたな | Unnamed katana
#_098A8A: db hMU, hME, hII, hNO, hKA, hTA, hNA, $FF

.item_06_name ; SEIRIyuUTOU | せいりゅうとう | Seiryu-to
#_098A92: db hSE, hII, hRI, hYUs, hUU, hTO, hUU, $FF

.item_07_name ; SASORIMUTI | さそりムチ | Scorpion whip
#_098A9A: db hSA, hSO, hRI, kMU, kTI, $FF

.item_08_name ; Batoruhanmā | バトルハンマー | Battle hammer
#_098AA0: db kBA, kTO, kRU, kHA, kNN, kMA, h__, $FF

.item_09_name ; SANSETUKON | さんせつこん | San-setsu-kon
#_098AA8: db hSA, hNN, hSE, hTU, hKO, hNN, $FF

.item_0A_name ; BIZENNOTANTOU | びぜんのたんとう | Bizen's Tanto
#_098AAF: db hBI, hZE, hNN, hNO, hTA, hNN, hTO, hUU, $FF

.item_0B_name ; Chēnsō | チェーンソー | Chainsaw
#_098AB8: db kTI, kEEs, h__, kNN, kSO, h__, $FF

.item_0C_name ; ASEIMINAIHU | アセイミナイフ | Athame knife
#_098ABF: db kAA, kSE, kII, kMI, kNA, kII, kHU, $FF

.item_0D_name ; Guradiusu | グラディウス | Gladius
#_098AC7: db kGU, kRA, kDE, kIIs, kUU, kSU, $FF

.item_0E_name ; MEITOUKOTETU | めいとうこてつ | Meito Kotetsu [Kotetsu's Honor?]
#_098ACE: db hME, hII, hTO, hUU, hKO, hTE, hTU, $FF

.item_0F_name ; TOMOENONAGINATA | ともえのなぎなた | Tomoe's Naginata
#_098AD6: db hTO, hMO, hEE, hNO, hNA, hGI, hNA, hTA, $FF

.item_10_name ; MIKADUKINOTATI | みかづきのたち | Mikazuchi's Tachi
#_098ADF: db hMI, hKA, hDU, hKI, hNO, hTA, hTI, $FF

.item_11_name ; HIKARINOKODATI | ひかりのこだち | Kodachi of Light
#_098AE7: db hHI, hKA, hRI, hNO, hKO, hDA, hTI, $FF

.item_12_name ; GIROTINAKUSU | ギロチンアクス | Guillotine axe
#_098AEF: db kGI, kRO, kTI, kNN, kAA, kKU, kSU, $FF

.item_13_name ; GURENNOMUTI | ぐれんのムチ | Lotus whip
#_098AF7: db hGU, hRE, hNN, hNO, kMU, kTI, $FF

.item_14_name ; BIZENOSAHUNE | びぜんおさふね | Bizen-Osafune
#_098AFE: db hBI, hZE, hNN, hOO, hSA, hHU, hNE, $FF

.item_15_name ; RAIDENNOMUTI | らいでんのムチ | Raiden's whip
#_098B06: db hRA, hII, hDE, hNN, hNO, kMU, kTI, $FF

.item_16_name ; RANSUOBUKA-SU | ランスオブカース | Lance of Curses
#_098B0E: db kRA, kNN, kSU, kOO, kBU, kKA, h__, kSU, $FF

.item_17_name ; Kamudo no turugi | カムドのつるぎ | Kamudo's sword
#_098B17: db kKA, kMU, kDO, hNO, hTU, hRU, hGI, $FF

.item_18_name ; PURAZUMASO-DO | プラズマソード | Plasma sword
#_098B1F: db kPU, kRA, kZU, kMA, kSO, h__, kDO, $FF

.item_19_name ; KUSANAGINOTURUGI | くさなぎのつるぎ | Kusanagi-no-tsurugi
#_098B27: db hKU, hSA, hNA, hGI, hNO, hTU, hRU, hGI, $FF

.item_1A_name ; BURIyu-NAKU | ブリューナク | Brionac
#_098B30: db kBU, kRI, kYUs, h__, kNA, kKU, $FF

.item_1B_name ; Tokkosho | とっこしょ | Tokkosho
#_098B37: db hTO, hTSUs, hKO, hSI, hYOs, $FF

.item_1C_name ; KUTINAWANOKEN | クチナワのけん | Kuchinawa's sword
#_098B3D: db kKU, kTI, kNA, kWA, hNO, hKE, hNN, $FF

; Normal mitama?? what?
.item_1D_name ; HUTUNOMITAMA | ふつのみたま | Futsu-no-mitama
#_098B45: db hHU, hTU, hNO, hMI, hTA, hMA, $FF

.item_1E_name ; SONItsuKUBURE-DO | ソニックブレード | Sonic blade
#_098B4C: db kSO, kNI, kTSUs, kKU, kBU, kRE, h__, kDO, $FF

.item_1F_name ; KURAUSONASU | クラウソナス | Cliamh Solais
#_098B55: db kKU, kRA, kUU, kSO, kNA, kSU, $FF

.item_20_name ; SITISEIKEN | しちせいけん | Shichiseiken
#_098B5C: db hSI, hTI, hSE, hII, hKE, hNN, $FF

.item_21_name ; HIGIyoUSANKO | ひぎょうさんこ | Higyosanko
#_098B63: db hHI, hGI, hYOs, hUU, hSA, hNN, hKO, $FF

.item_22_name ; KIKUSUINOKODATI | きくすいのこだち | Kodachi of Kikusui
#_098B6B: db hKI, hKU, hSU, hII, hNO, hKO, hDA, hTI, $FF

.item_23_name ; YOUTOUNIHIRU | ようとうニヒル | Yoto Nihiru
#_098B74: db hYO, hUU, hTO, hUU, kNI, kHI, kRU, $FF

.item_24_name ; MEIDONOMIYAGE | メイドのミヤゲ | Present from Hades
#_098B7C: db kME, kII, kDO, hNO, kMI, kYA, kGE, $FF

.item_25_name ; GEIBORUKU | ゲイボルク | Gae Bolga
#_098B84: db kGE, kII, kBO, kRU, kKU, $FF

; Muramasa was a famous swordsmith
.item_26_name ; Maken Muramasa | まけんムラマサ | Maken murasame [Muramasa's Cursed Sword]
#_098B8A: db hMA, hKE, hNN, kMU, kRA, kMA, kSA, $FF

.item_27_name ; DESUBURINGA- | デスブリンガー | Deathbringer
#_098B92: db kDE, kSU, kBU, kRI, kNN, kGA, h__, $FF

.item_28_name ; KUBIKARISUPU-N | くびかりスプーン | Headhunter spoon
#_098B9A: db hKU, hBI, hKA, hRI, kSU, kPU, h__, kNN, $FF

.item_29_name ; KIyuUBINOMUTI | きゅうびのムチ | Cat of nine tails
#_098BA3: db hKI, hYUs, hUU, hBI, hNO, kMU, kTI, $FF

.item_2A_name ; RENKINOKEN | れんきのけん | Renki-no-ken [Alchemist's Sword]
#_098BAB: db hRE, hNN, hKI, hNO, hKE, hNN, $FF

; Amenonuhoko is a mythical spear; Amenonuboko is probably a dev typo
.item_2B_name ; Amenonuboko | あめのぬぼこ | Ame-no-nuboko [Amenonuhoko]
#_098BB2: db hAA, hME, hNO, hNU, hBO, hKO, $FF

.item_2C_name ; YATUKANOKEN | やつかのけん | Yatsuka's sword
#_098BB9: db hYA, hTU, hKA, hNO, hKE, hNN, $FF

.item_2D_name ; BARUHARASO-DO | バルハラソード | Valhalla sword
#_098BC0: db kBA, kRU, kHA, kRA, kSO, h__, kDO, $FF

.item_2E_name ; HAOUNOTURUGI | はおうのつるぎ | Sword of Hao
#_098BC8: db hHA, hOO, hUU, hNO, hTU, hRU, hGI, $FF

.item_2F_name ; MEIHUHADUKI | めいふはづき | Hades Hazuki
#_098BD0: db hME, hII, hHU, hHA, hDU, hKI, $FF

.item_30_name ; TENSINORAtsuPA | てんしのラッパ | Angel's Trumpet
#_098BD7: db hTE, hNN, hSI, hNO, kRA, kTSUs, kPA, $FF

.item_31_name ; RUNABUREIDO | ルナブレイド | Luna Blade
#_098BDF: db kRU, kNA, kBU, kRE, kII, kDO, $FF

.item_32_name ; SINIGAMINOKANE | しにがみのかね | Reaper's Bell
#_098BE6: db hSI, hNI, hGA, hMI, hNO, hKA, hNE, $FF

.item_33_name ; MAZIyoUSEN | まじょうせん | Majousen
#_098BEE: db hMA, hZI, hYOs, hUU, hSE, hNN, $FF

.item_34_name ; RO-TASUWANDO | ロータスワンド | Lotus Wand
#_098BF5: db kRO, h__, kTA, kSU, kWA, kNN, kDO, $FF

.item_35_name ; RONGINUSU | ロンギヌス | Longinus
#_098BFD: db kRO, kNN, kGI, kNU, kSU, $FF

.item_36_name ; SORUBUREIDO | ソルブレイド | Soul blade
#_098C03: db kSO, kRU, kBU, kRE, kII, kDO, $FF

.item_37_name ; SUTORADEiBARI | ストラディバリ | Stradivari
#_098C0A: db kSU, kTO, kRA, kDE, kIIs, kBA, kRI, $FF

; Murakumo is some sort of sword maybe (passing clouds)
.item_38_name ; AMENOMURAKUMO | あめのむらくも | Ame-no-Murakumo
#_098C12: db hAA, hME, hNO, hMU, hRA, hKU, hMO, $FF

.item_39_name ; HUUZINKEN | ふうじんけん | Fuujin-ken [Scattered wind sword]
#_098C1A: db hHU, hUU, hZI, hNN, hKE, hNN, $FF

.item_3A_name ; RAIZINKEN | らいじんけん | Raijin-ken [Thunder sword]
#_098C21: db hRA, hII, hZI, hNN, hKE, hNN, $FF

.item_3B_name ; KARIyuUKEN | かりゅうけん | Karyu-ken [River sword]
#_098C28: db hKA, hRI, hYUs, hUU, hKE, hNN, $FF

.item_3C_name ; AMANOMITURUGI | あまのみつるぎ | Sword of Heaven
#_098C2F: db hAA, hMA, hNO, hMI, hTU, hRU, hGI, $FF

.item_3D_name ; MASAKADONOKATANA | マサカドのかたな | Masakodo's katana
#_098C37: db kMA, kSA, kKA, kDO, hNO, hKA, hTA, hNA, $FF

.item_3E_name ; KURIKARANOTURUGI | くりからのつるぎ | Kurikara's sword
#_098C40: db hKU, hRI, hKA, hRA, hNO, hTU, hRU, hGI, $FF

.item_3F_name ; HINOKAGUTUTI | ひのかぐつち | Hinokagutsuchi
#_098C49: db hHI, hNO, hKA, hGU, hTU, hTI, $FF

.item_40_name ; NIyu-NANBU | ニューナンブ | New Nanbu
#_098C50: db kNI, kYUs, h__, kNA, kNN, kBU, $FF

.item_41_name ; Beretta 92F | ベレッタ92F | Beretta 92F
#_098C57: db kBE, kRE, kTSUs, kTA, "92F", $FF

.item_42_name ; MP5 mashingan | MP5マシンガン | MP5 machine gun
#_098C5F: db "MP5", kMA, kSI, kNN, kGA, kNN, $FF

.item_43_name ; M16 Raifuru | M16ライフル | M16 rifle
#_098C68: db "M16", kRA, kII, kHU, kRU, $FF

.item_44_name ; SPAS12 | SPAS12 | SPAS12
#_098C70: db "SPAS12", $FF

.item_45_name ; M249 Minimi | M249ミニミ | M249 Minimi
#_098C77: db "M249", kMI, kNI, kMI, $FF

.item_46_name ; Burōningu M2 | ブローニングM2 | Browning M2
#_098C7F: db kBU, kRO, h__, kNI, kNN, kGU, "M2", $FF

.item_47_name ; Pauza P50 | パウザP50 | Pauza P50
#_098C88: db kPA, kUU, kZA, "P50", $FF

.item_48_name ; KIRAIHOU | きらいほう | Explosive gun [Mine gun?]
#_098C8F: db hKI, hRA, hII, hHO, hUU, $FF

.item_49_name ; OUGONZIyuU | おうごんじゅう | Golden gun
#_098C95: db hOO, hUU, hGO, hNN, hZI, hYUs, hUU, $FF

.item_4A_name ; GIGASUMAtsuSIya- | ギガスマッシャー | Gigasmasher
#_098C9D: db kGI, kGA, kSU, kMA, kTSUs, kSI, kYAs, h__, $FF

.item_4B_name ; KUNITOMONOZIyuU | くにとものじゅう | Kinitomo's Gun
#_098CA6: db hKU, hNI, hTO, hMO, hNO, hZI, hYUs, hUU, $FF

.item_4C_name ; M134 Minigan | M134ミニガン | M134 minigun
#_098CAF: db "M134", kMI, kNI, kGA, kNN, $FF

.item_4D_name ; Rērugan | レールガン | Railgun
#_098CB8: db kRE, h__, kRU, kGA, kNN, $FF

.item_4E_name ; MEGIDOHUaIA | メギドファイア
#_098CBE: db kME, kGI, kDO, kHU, kAAs, kII, kAA, $FF

.item_4F_name ; Pīsumēkā | ピースメーカー | Peacemaker
#_098CC6: db kPI, h__, kSU, kME, h__, kKA, h__, $FF

.item_50_name ; TUUZIyoUDAN | つうじょうだん | Bullets
#_098CCE: db hTU, hUU, hZI, hYOs, hUU, hDA, hNN, $FF

.item_51_name ; SIyotsuTOSIeRU | ショットシェル | Shotgun shells
#_098CD6: db kSI, kYOs, kTSUs, kTO, kSI, kEEs, kRU, $FF

.item_52_name ; DOKUBARIDAN | どくばりだん | Poisoned bullets
#_098CDE: db hDO, hKU, hBA, hRI, hDA, hNN, $FF

.item_53_name ; SINKEIDAN | しんけいだん | Nerve bullets
#_098CE5: db hSI, hNN, hKE, hII, hDA, hNN, $FF

.item_54_name ; NOROINODANGAN | のろいのだんがん | Cursed bullets
#_098CEC: db hNO, hRO, hII, hNO, hDA, hNN, hGA, hNN, $FF

.item_55_name ; SEINARUDANGAN | せいなるだんがん | Blessed bullets
#_098CF5: db hSE, hII, hNA, hRU, hDA, hNN, hGA, hNN, $FF

.item_56_name ; GINNODANGAN | ぎんのだんがん | Silver bullets
#_098CFE: db hGI, hNN, hNO, hDA, hNN, hGA, hNN, $FF

.item_57_name ; URANIUMUDAN | ウラニウムだん | Uranium slugs
#_098D06: db kUU, kRA, kNI, kUU, kMU, hDA, hNN, $FF

.item_58_name ; PURUTONIUMUDAN | プルトニウムだん | Plutonium slugs
#_098D0E: db kPU, kRU, kTO, kNI, kUU, kMU, hDA, hNN, $FF

.item_59_name ; MARIyoKUNOTAMA | まりょくのたま | Magic shells
#_098D17: db hMA, hRI, hYOs, hKU, hNO, hTA, hMA, $FF

.item_5A_name ; MEDEyu-SANOTAMA | メデューサのたま | Medusa shells
#_098D1F: db kME, kDE, kYUs, h__, kSA, hNO, hTA, hMA, $FF

.item_5B_name ; MAHUUZINOTAMA | まふうじのたま | Antimagic shells
#_098D28: db hMA, hHU, hUU, hZI, hNO, hTA, hMA, $FF

.item_5C_name ; SENKOUDAN | せんこうだん | Flash slugs
#_098D30: db hSE, hNN, hKO, hUU, hDA, hNN, $FF

.item_5D_name ; HAtsuPI-SIyotsuTO | ハッピーショット | Happy shot
#_098D37: db kHA, kTSUs, kPI, h__, kSI, kYOs, kTSUs, kTO, $FF

.item_5E_name ; HIKARINODANGAN | ひかりのだんがん | Bullets of Light
#_098D40: db hHI, hKA, hRI, hNO, hDA, hNN, hGA, hNN, $FF

.item_5F_name ; YAMINODANGAN | やみのだんがん | Bullets of Darkness
#_098D49: db hYA, hMI, hNO, hDA, hNN, hGA, hNN, $FF

.item_60_name ; HEtsuDOGIA | ヘッドギア | Headgear
#_098D51: db kHE, kTSUs, kDO, kGI, kAA, $FF

.item_61_name ; Furuherumu | フルヘルム | Full helm
#_098D57: db kHU, kRU, kHE, kRU, kMU, $FF

.item_62_name ; HURItsuTUHERUMU | フリッツヘルム | Fritz helm
#_098D5D: db kHU, kRI, kTSUs, kTU, kHE, kRU, kMU, $FF

.item_63_name ; METARUKURAUN | メタルクラウン | Metal crown
#_098D65: db kME, kTA, kRU, kKU, kRA, kUU, kNN, $FF

.item_64_name ; DEyuRAHANHERUMU | デュラハンヘルム | Dullachan helm
#_098D6D: db kDE, kYUs, kRA, kHA, kNN, kHE, kRU, kMU, $FF

.item_65_name ; SANKAKUBOUSI | さんかくぼうし | Tricorne hat
#_098D76: db hSA, hNN, hKA, hKU, hBO, hUU, hSI, $FF

.item_66_name ; DA-KUKURAUN | ダーククラウン | Dark crown
#_098D7E: db kDA, h__, kKU, kKU, kRA, kUU, kNN, $FF

.item_67_name ; ONIKUIKABUTO | おにくいカブト | Demoneater helm
#_098D86: db hOO, hNI, hKU, hII, kKA, kBU, kTO, $FF

.item_68_name ; SEIREIMAEDATE | せいれいまえだて | Spirit crest
#_098D8E: db hSE, hII, hRE, hII, hMA, hEE, hDA, hTE, $FF

.item_69_name ; DORAGONHERUMU | ドラゴンヘルム | Dragon helm
#_098D97: db kDO, kRA, kGO, kNN, kHE, kRU, kMU, $FF

.item_6A_name ; KURENAINOKABUTO | くれないのかぶと | Crimson helm
#_098D9F: db hKU, hRE, hNA, hII, hNO, hKA, hBU, hTO, $FF

.item_6B_name ; TIENOWA | ちえのわ | Circlet of Knowledge TODO what?
#_098DA8: db hTI, hEE, hNO, hWA, $FF

.item_6C_name ; MASUKARE-DO | マスカレード | Masquerade
#_098DAD: db kMA, kSU, kKA, kRE, h__, kDO, $FF

.item_6D_name ; KINKO | きんこ | Safe
#_098DB4: db hKI, hNN, hKO, $FF

.item_6E_name ; HERUMESUHERUMU | ヘルメスヘルム | Hermes' Helmet
#_098DB8: db kHE, kRU, kME, kSU, kHE, kRU, kMU, $FF

.item_6F_name ; PANTUa-HERUMU | パンツァーヘルム | Panzer Helm
#_098DC0: db kPA, kNN, kTU, kAAs, h__, kHE, kRU, kMU, $FF

; Jagd is a reference to the Gundam series
.item_70_name ; YAKUTOHERUMU | ヤクトヘルム | Jagd helm
#_098DC9: db kYA, kKU, kTO, kHE, kRU, kMU, $FF

; This should probably be storm, but I'm leaving it as Sturm
; for Erica
.item_71_name ; SIyuTURUMUHERUMU | シュツルムヘルム | Sturm helm
#_098DD0: db kSI, kYUs, kTU, kRU, kMU, kHE, kRU, kMU, $FF

.item_72_name ; MADOUSINOMASUKU | まどうしのマスク | Magician's mask
#_098DD9: db hMA, hDO, hUU, hSI, hNO, kMA, kSU, kKU, $FF

.item_73_name ; TUKIKAGENOHIMO | つきかげのひも | Moonbeam string
#_098DE2: db hTU, hKI, hKA, hGE, hNO, hHI, hMO, $FF

.item_74_name ; SUWAHOtsuSIyoU | すわほっしょう | Suwa Hossho's helmet
#_098DEA: db hSU, hWA, hHO, hTSUs, hSI, hYOs, hUU, $FF

.item_75_name ; ZI-ZASUHERUMU | ジーザスヘルム | Jesus helm
#_098DF2: db kZI, h__, kZA, kSU, kHE, kRU, kMU, $FF

.item_76_name ; TENMANOKABUTO | てんまのかぶと | Tenma helmet
#_098DFA: db hTE, hNN, hMA, hNO, hKA, hBU, hTO, $FF

.item_77_name ; MASAKADONOKABUTO | マサカドのかぶと | Masakado's helmet
#_098E02: db kMA, kSA, kKA, kDO, hNO, hKA, hBU, hTO, $FF

.item_78_name ; SABAIBA-BESUTO | サバイバーベスト | Survival vest
#_098E0B: db kSA, kBA, kII, kBA, h__, kBE, kSU, kTO, $FF

.item_79_name ; KEBURA-BESUTO | ケブラーベスト | Kevlar vest
#_098E14: db kKE, kBU, kRA, h__, kBE, kSU, kTO, $FF

.item_7A_name ; HUaIAGA-DO | ファイアガード | Fire guard
#_098E1C: db kHU, kAAs, kII, kAA, kGA, h__, kDO, $FF

.item_7B_name ; SANDA-GA-DO | サンダーガード | Thunder guard
#_098E24: db kSA, kNN, kDA, h__, kGA, h__, kDO, $FF

.item_7C_name ; HAIREGUA-MA- | ハイレグアーマー | Highleg armor
#_098E2C: db kHA, kII, kRE, kGU, kAA, h__, kMA, h__, $FF

.item_7D_name ; AGEHADORESU | アゲハドレス | Ageha dress [Butterfly dress]
#_098E35: db kAA, kGE, kHA, kDO, kRE, kSU, $FF

.item_7E_name ; ITARIA-MA- | イタリアーマー | Italiarmor [Italian armor]
#_098E3C: db kII, kTA, kRI, kAA, h__, kMA, h__, $FF

.item_7F_name ; TETORAZIyaMA- | テトラジャマー | Tetrajammer
#_098E44: db kTE, kTO, kRA, kZI, kYAs, kMA, h__, $FF

.item_80_name ; HAOUNOYOROI | はおうのよろい | Haou's armor
#_098E4C: db hHA, hOO, hUU, hNO, hYO, hRO, hII, $FF

.item_81_name ; HOUNOKOROMO | ほうのころも | Robe of Law
#_098E54: db hHO, hUU, hNO, hKO, hRO, hMO, $FF

.item_82_name ; DORAGONMEIRU | ドラゴンメイル | Dragon mail
#_098E5B: db kDO, kRA, kGO, kNN, kME, kII, kRU, $FF

.item_83_name ; KURENAINOYOROI | くれないのよろい | Crimson armor
#_098E63: db hKU, hRE, hNA, hII, hNO, hYO, hRO, hII, $FF

.item_84_name ; DEBIRUKORUSEtsuTO | デビルコルセット | Devil corset
#_098E6C: db kDE, kBI, kRU, kKO, kRU, kSE, kTSUs, kTO, $FF

.item_85_name ; SItsuKOKUNOYOROI | しっこくのよろい | Black armor
#_098E75: db hSI, hTSUs, hKO, hKU, hNO, hYO, hRO, hII, $FF

.item_86_name ; PAWA-DOSU-TU | パワードスーツ | Powered suit
#_098E7E: db kPA, kWA, h__, kDO, kSU, h__, kTU, $FF

.item_87_name ; HAKUMANOYOROI | はくまのよろい | Hakuma's armor
#_098E86: db hHA, hKU, hMA, hNO, hYO, hRO, hII, $FF

.item_88_name ; PANTUa-SU-TU | パンツァースーツ | Panzer suit
#_098E8E: db kPA, kNN, kTU, kAAs, h__, kSU, h__, kTU, $FF

.item_89_name ; YAKUTOA-MA- | ヤクトアーマー | Jagd armor
#_098E97: db kYA, kKU, kTO, kAA, h__, kMA, h__, $FF

.item_8A_name ; SIyuTURUMUSU-TU | シュツルムスーツ | Sturm suit
#_098E9F: db kSI, kYUs, kTU, kRU, kMU, kSU, h__, kTU, $FF

.item_8B_name ; A-SUMEIRU | アースメイル | Earth mail
#_098EA8: db kAA, h__, kSU, kME, kII, kRU, $FF

; Argama is likely another Gundam reference
.item_8C_name ; A-GAMASU-TU | アーガマスーツ | Argama suit
#_098EAF: db kAA, h__, kGA, kMA, kSU, h__, kTU, $FF

.item_8D_name ; ZI-ZASUA-MA- | ジーザスアーマー | Jesus armor
#_098EB7: db kZI, h__, kZA, kSU, kAA, h__, kMA, h__, $FF

; Tenma could mean pegasus
.item_8E_name ; TENMANOYOROI | てんまのよろい | Tenma armor
#_098EC0: db hTE, hNN, hMA, hNO, hYO, hRO, hII, $FF

.item_8F_name ; MASAKADONOYOROI | マサカドのよろい | Masakado's armor
#_098EC8: db kMA, kSA, kKA, kDO, hNO, hYO, hRO, hII, $FF

.item_90_name ; REZA-GURABU | レザーグラブ | Leather glove
#_098ED1: db kRE, kZA, h__, kGU, kRA, kBU, $FF

.item_91_name ; RIBEtsuTONAtsuKURU | リベットナックル | Rivet knuckle
#_098ED8: db kRI, kBE, kTSUs, kTO, kNA, kTSUs, kKU, kRU, $FF

.item_92_name ; KAIZA-NAtsuKURU | カイザーナックル | Kaiser knuckle
#_098EE1: db kKA, kII, kZA, h__, kNA, kTSUs, kKU, kRU, $FF

.item_93_name ; GANTOREtsuTO | ガントレット | Gauntlet
#_098EEA: db kGA, kNN, kTO, kRE, kTSUs, kTO, $FF

.item_94_name ; SAIBA-A-MU | サイバーアーム | Cyber arm
#_098EF1: db kSA, kII, kBA, h__, kAA, h__, kMU, $FF

.item_95_name ; AIANKURO- | アイアンクロー | Iron claw
#_098EF9: db kAA, kII, kAA, kNN, kKU, kRO, h__, $FF

.item_96_name ; ATORASUNOKOTE | アトラスのこて | Atlas gauntlet
#_098F01: db kAA, kTO, kRA, kSU, hNO, hKO, hTE, $FF

.item_97_name ; KISINNOKOTE | きしんのこて | Kishin gauntlet [Noble gauntlet?]
#_098F09: db hKI, hSI, hNN, hNO, hKO, hTE, $FF

; Gold ring from Norse mythology
.item_98_name ; DORAUPUNIRU | ドラウプニル | Draupnir
#_098F10: db kDO, kRA, kUU, kPU, kNI, kRU, $FF

.item_99_name ; KURENAINOKOTE | くれないのこて | Crimson gauntlet
#_098F17: db hKU, hRE, hNA, hII, hNO, hKO, hTE, $FF

.item_9A_name ; PANTUaHUiSUTO | パンツァフィスト | Panzer fist
#_098F1F: db kPA, kNN, kTU, kAAs, kHU, kIIs, kSU, kTO, $FF

.item_9B_name ; YAKUTOGURABU | ヤクトグラブ | Jagd glove
#_098F28: db kYA, kKU, kTO, kGU, kRA, kBU, $FF

.item_9C_name ; SIyuTURUMUGURABU | シュツルムグラブ | Sturm glove
#_098F2F: db kSI, kYUs, kTU, kRU, kMU, kGU, kRA, kBU, $FF

.item_9D_name ; ZI-ZASUGURABU | ジーザスグラブ | Jesus glove
#_098F38: db kZI, h__, kZA, kSU, kGU, kRA, kBU, $FF

.item_9E_name ; TENMANOKOTE | てんまのこて | Tenma gauntlet
#_098F40: db hTE, hNN, hMA, hNO, hKO, hTE, $FF

.item_9F_name ; MASAKADONOKOTE | マサカドのこて | Masakado's gauntlet
#_098F47: db kMA, kSA, kKA, kDO, hNO, hKO, hTE, $FF

.item_A0_name ; REZA-BU-TU | レザーブーツ | Leather boots
#_098F4F: db kRE, kZA, h__, kBU, h__, kTU, $FF

.item_A1_name ; KONBAtsuTOBU-TU | コンバットブーツ | Combat boots
#_098F56: db kKO, kNN, kBA, kTSUs, kTO, kBU, h__, kTU, $FF

.item_A2_name ; RAIDA-BU-TU | ライダーブーツ | Rider boots
#_098F5F: db kRA, kII, kDA, h__, kBU, h__, kTU, $FF

.item_A3_name ; ZIetsuTOBU-TU | ジェットブーツ | Jet boots
#_098F67: db kZI, kEEs, kTSUs, kTO, kBU, h__, kTU, $FF

.item_A4_name ; SUKAIHI-RU | スカイヒール | Sky heels
#_098F6F: db kSU, kKA, kII, kHI, h__, kRU, $FF

.item_A5_name ; METARUBU-TU | メタルブーツ | Metal boots
#_098F76: db kME, kTA, kRU, kBU, h__, kTU, $FF

.item_A6_name ; DANSINGUHI-RU | ダンシングヒール | Dancing heels
#_098F7D: db kDA, kNN, kSI, kNN, kGU, kHI, h__, kRU, $FF

.item_A7_name ; DORAGONBU-TU | ドラゴンブーツ | Dragon boots
#_098F86: db kDO, kRA, kGO, kNN, kBU, h__, kTU, $FF

.item_A8_name ; MUSIyaNOGUSOKU | むしゃのぐそく | Musha greaves [Warrior greaves]
#_098F8E: db hMU, hSI, hYAs, hNO, hGU, hSO, hKU, $FF

.item_A9_name ; KURENAINOGUSOKU | くれないのぐそく | Crimson greaves
#_098F96: db hKU, hRE, hNA, hII, hNO, hGU, hSO, hKU, $FF

.item_AA_name ; PANTUa-REtsuGU | パンツァーレッグ | Panzer legs
#_098F9F: db kPA, kNN, kTU, kAAs, h__, kRE, kTSUs, kGU, $FF

.item_AB_name ; YAKUTOREtsuGU | ヤクトレッグ | Jagd legs
#_098FA8: db kYA, kKU, kTO, kRE, kTSUs, kGU, $FF

.item_AC_name ; SIyuTURUMUREtsuGU | シュツルムレッグ | Sturm legs
#_098FAF: db kSI, kYUs, kTU, kRU, kMU, kRE, kTSUs, kGU, $FF

.item_AD_name ; ZI-ZASUREtsuGU | ジーザスレッグ | Jesus legs
#_098FB8: db kZI, h__, kZA, kSU, kRE, kTSUs, kGU, $FF

.item_AE_name ; TENMANOGUSOKU | てんまのぐそく | Tenma greaves
#_098FC0: db hTE, hNN, hMA, hNO, hGU, hSO, hKU, $FF

.item_AF_name ; MASAKADONOGUSOKU | マサカドのぐそく | Masakado's greaves
#_098FC8: db kMA, kSA, kKA, kDO, hNO, hGU, hSO, hKU, $FF

.item_B0_name ; KIZUGUSURI | きずぐすり | Ointment
#_098FD1: db hKI, hZU, hGU, hSU, hRI, $FF

.item_B1_name ; GIyuUOUTAN | ぎゅうおうたん | Gyoutan
#_098FD7: db hGI, hYUs, hUU, hOO, hUU, hTA, hNN, $FF

.item_B2_name ; MASEKI | ませき | Magic stone
#_098FDF: db hMA, hSE, hKI, $FF

.item_B3_name ; MAtsuSURUDORINKO | マッスルドリンコ | Muscle drink
#_098FE3: db kMA, kTSUs, kSU, kRU, kDO, kRI, kNN, kKO, $FF

.item_B4_name ; HOUGIyoKU | ほうぎょく | Orb
#_098FEC: db hHO, hUU, hGI, hYOs, hKU, $FF

.item_B5_name ; Hiranya | ヒランヤ | Hiranya
#_098FF2: db kHI, kRA, kNN, kYA, $FF

.item_B6_name ; DEiSUPOIZUN | ディスポイズン | Dis-poison
#_098FF7: db kDE, kIIs, kSU, kPO, kII, kZU, kNN, $FF

.item_B7_name ; DEiSUPARAIZU | ディスパライズ | Dis-paralyze
#_098FFF: db kDE, kIIs, kSU, kPA, kRA, kII, kZU, $FF

.item_B8_name ; DEiSUTO-N | ディストーン | De-stone
#_099007: db kDE, kIIs, kSU, kTO, h__, kNN, $FF

.item_B9_name ; SO-MA | ソーマ | Soma
#_09900E: db kSO, h__, kMA, $FF

.item_BA_name ; KINTAN | きんたん | Gold pill
#_099012: db hKI, hNN, hTA, hNN, $FF

.item_BB_name ; HANGONKOU | はんごんこう | Soul incense
#_099017: db hHA, hNN, hGO, hNN, hKO, hUU, $FF

.item_BC_name ; MAHOUBIN | まほうびん | Magic bottle
#_09901E: db hMA, hHO, hUU, hBI, hNN, $FF

.item_BD_name ; TUYOSANOKOU | つよさのこう | Strength incense
#_099024: db hTU, hYO, hSA, hNO, hKO, hUU, $FF

.item_BE_name ; TIENOKOU | ちえのこう | Intelligence incense
#_09902B: db hTI, hEE, hNO, hKO, hUU, $FF

.item_BF_name ; MARIyoKUNOKOU | まりょくのこう | Magic incense
#_099031: db hMA, hRI, hYOs, hKU, hNO, hKO, hUU, $FF

.item_C0_name ; TAIRIyoKUNOKOU | たいりょくのこう | Stamina incense
#_099039: db hTA, hII, hRI, hYOs, hKU, hNO, hKO, hUU, $FF

.item_C1_name ; HAYASANOKOU | はやさのこう | Speed incense
#_099042: db hHA, hYA, hSA, hNO, hKO, hUU, $FF

.item_C2_name ; UNNOKOU | うんのこう | Luck incense
#_099049: db hUU, hNN, hNO, hKO, hUU, $FF

.item_C3_name ; KAENBIN | かえんびん | Molotov cocktail
#_09904F: db hKA, hEE, hNN, hBI, hNN, $FF

.item_C4_name ; HANDOGURENE-DO | ハンドグレネード | Hand grenade
#_099055: db kHA, kNN, kDO, kGU, kRE, kNE, h__, kDO, $FF

.item_C5_name ; SUTEiNGA- | スティンガー | Stinger
#_09905E: db kSU, kTE, kIIs, kNN, kGA, h__, $FF

.item_C6_name ; Doragon ATM | ドラゴンATM | Dragon ATM
#_099065: db kDO, kRA, kGO, kNN, "ATM", $FF

.item_C7_name ; DOKUYAKUBIN | どくやくびん | Poison bottle
#_09906D: db hDO, hKU, hYA, hKU, hBI, hNN, $FF

.item_C8_name ; AGIRAOSUTO-N | アギラオストーン | Agirao stone
#_099074: db kAA, kGI, kRA, kOO, kSU, kTO, h__, kNN, $FF

.item_C9_name ; MAHARAGISUTO-N | マハラギストーン | Maha agi stone
#_09907D: db kMA, kHA, kRA, kGI, kSU, kTO, h__, kNN, $FF

.item_CA_name ; ZIONGASUTO-N | ジオンガストーン | Jionga stone
#_099086: db kZI, kOO, kNN, kGA, kSU, kTO, h__, kNN, $FF

.item_CB_name ; MAHAZIOSUTO-N | マハジオストーン | Maha zio stone
#_09908F: db kMA, kHA, kZI, kOO, kSU, kTO, h__, kNN, $FF

.item_CC_name ; MAHABUHUSUTO-N | マハブフストーン | Maha bufu stone
#_099098: db kMA, kHA, kBU, kHU, kSU, kTO, h__, kNN, $FF

.item_CD_name ; SEISUI | せいすい | Holy water
#_0990A1: db hSE, hII, hSU, hII, $FF

.item_CE_name ; TAMAGAERI | たまがえり | Soul returner
#_0990A6: db hTA, hMA, hGA, hEE, hRI, $FF

.item_CF_name ; HAMAYA | はまや | Hamaya
#_0990AC: db hHA, hMA, hYA, $FF

.item_D0_name ; ZIGOKUDAMA | じごくだま | Hell soul
#_0990B0: db hZI, hGO, hKU, hDA, hMA, $FF

.item_D1_name ; TIya-MU | チャーム | Charm
#_0990B6: db kTI, kYAs, h__, kMU, $FF

.item_D2_name ; Doku ya | どくや | Poison arrow
#_0990BB: db hDO, hKU, hYA, $FF

.item_D3_name ; HIKOUBARI | ひこうばり | Hiko-bari TODO lazy translation
#_0990BF: db hHI, hKO, hUU, hBA, hRI, $FF

.item_D4_name ; ENZERUHEA- | エンゼルヘアー | Angel hair
#_0990C5: db kEE, kNN, kZE, kRU, kHE, kAA, h__, $FF

.item_D5_name ; ASIyuRANOTE | アシュラのて | Ashura hand
#_0990CD: db kAA, kSI, kYUs, kRA, hNO, hTE, $FF

.item_D6_name ; PENTAGURAMU | ペンタグラム | Pentagram
#_0990D4: db kPE, kNN, kTA, kGU, kRA, kMU, $FF

.item_D7_name ; SEGAKIMAI | せがきまい | Segaki rice
#_0990DB: db hSE, hGA, hKI, hMA, hII, $FF

.item_D8_name ; KODOKUZARA | こどくざら | Kodokuzara
#_0990E1: db hKO, hDO, hKU, hZA, hRA, $FF

.item_D9_name ; ENMAKUDAN | えんまくだん | Smoke bomb
#_0990E7: db hEE, hNN, hMA, hKU, hDA, hNN, $FF

.item_DA_name ; NIyoRAIZOU | にょらいぞう | Nyorai statue
#_0990EE: db hNI, hYOs, hRA, hII, hZO, hUU, $FF

.item_DB_name ; AMIDAZIyuZU | あみだじゅず | Amida beads
#_0990F5: db hAA, hMI, hDA, hZI, hYUs, hZU, $FF

.item_DC_name ; ROZARIO | ロザリオ | Rosary [beads]?
#_0990FC: db kRO, kZA, kRI, kOO, $FF

.item_DD_name ; AMUREtsuTO | アムレット | Amulet
#_099101: db kAA, kMU, kRE, kTSUs, kTO, $FF

.item_DE_name ; TARISUMAN | タリスマン | Talisman
#_099107: db kTA, kRI, kSU, kMA, kNN, $FF

.item_DF_name ; HUUMANOSUZU | ふうまのすず | Fuma bell
#_09910D: db hHU, hUU, hMA, hNO, hSU, hZU, $FF

.item_E0_name ; KOASI-RUDO | コアシールド | Core shield
#_099114: db kKO, kAA, kSI, h__, kRU, kDO, $FF

.item_E1_name ; WAKIMINOTUBO | わきみのつぼ | Gushing jar
#_09911B: db hWA, hKI, hMI, hNO, hTU, hBO, $FF

; those fortune slips
.item_E2_name ; OMIKUZI | おみくじ | Omikuji
#_099122: db hOO, hMI, hKU, hZI, $FF

.item_E3_name ; MENZAIHU | めんざいふ | Indulgence
#_099127: db hME, hNN, hZA, hII, hHU, $FF

.item_E4_name ; GA-NEtsuTO | ガーネット | Garnet
#_09912D: db kGA, h__, kNE, kTSUs, kTO, $FF

.item_E5_name ; AMEZISUTO | アメジスト | Amethyst
#_099133: db kAA, kME, kZI, kSU, kTO, $FF

.item_E6_name ; AKUAMARIN | アクアマリン | Aquamarine
#_099139: db kAA, kKU, kAA, kMA, kRI, kNN, $FF

.item_E7_name ; DAIYAMONDO | ダイヤモンド | Diamond
#_099140: db kDA, kII, kYA, kMO, kNN, kDO, $FF

.item_E8_name ; EMERARUDO | エメラルド | Emerald
#_099147: db kEE, kME, kRA, kRU, kDO, $FF

.item_E9_name ; PA-RU | パール | Pearl
#_09914D: db kPA, h__, kRU, $FF

.item_EA_name ; RUBI- | ルビー | Ruby
#_099151: db kRU, kBI, h__, $FF

.item_EB_name ; ONIKISU | オニキス | Onyx
#_099155: db kOO, kNI, kKI, kSU, $FF

.item_EC_name ; SAHUaIA | サファイア | Sapphire
#_09915A: db kSA, kHU, kAAs, kII, kAA, $FF

.item_ED_name ; OPA-RU | オパール | Opal
#_099160: db kOO, kPA, h__, kRU, $FF

.item_EE_name ; TOPA-ZU | トパーズ | Topaz
#_099165: db kTO, kPA, h__, kZU, $FF

.item_EF_name ; TA-KOIZU | ターコイズ | Turquoise
#_09916A: db kTA, h__, kKO, kII, kZU, $FF

.item_F0_name ; ID KA-DO | IDカード | ID card
#_099170: db "ID", kKA, h__, kDO, $FF

.item_F1_name ; ENZERURINGU | エンゼルリング | Angel ring
#_099176: db kEE, kNN, kZE, kRU, kRI, kNN, kGU, $FF

.item_F2_name ; GIZOU ID KA-DO | ぎぞうIDカード | Gizou ID card
#_09917E: db hGI, hZO, hUU, "ID", kKA, h__, kDO, $FF

.item_F3_name ; BAR NOMAtsuTI | BARのマッチ | Box of matches TODO ??
#_099187: db "BAR", hNO, kMA, kTSUs, kTI, $FF

.item_F4_name ; OUGONNORINGO | おうごんのリンゴ | Apple of Apples [Golden apple]
#_09918F: db hOO, hUU, hGO, hNN, hNO, kRI, kNN, kGO, $FF

.item_F5_name ; MEMORI-BO-DO | メモリーボード | Memory board
#_099198: db kME, kMO, kRI, h__, kBO, h__, kDO, $FF

.item_F6_name ; KItsuKOUNOSUZU | きっこうのすず | Tin of Tin TODO ??
#_0991A0: db hKI, hTSUs, hKO, hUU, hNO, hSU, hZU, $FF

.item_F7_name ; TAKONOHUE | タコのふえ | Octupus tentacle
#_0991A8: db kTA, kKO, hNO, hHU, hEE, $FF

; I should keep this
.item_F8_name ; SURUTONOTUME | スルトのつめ | Slut's claw
#_0991AE: db kSU, kRU, kTO, hNO, hTU, hME, $FF

.item_F9_name ; ASUTAROTONOHANE | アスタロトのはね | Astaroth splash TODO ??
#_0991B5: db kAA, kSU, kTA, kRO, kTO, hNO, hHA, hNE, $FF

.item_FA_name ; ARIOKUNOKIBA | アリオクのきば | Ariok's fang TODO ??
#_0991BE: db kAA, kRI, kOO, kKU, hNO, hKI, hBA, $FF

.item_FB_name ; DEBIRURINGU | デビルリング | Devil ring TODO ??
#_0991C6: db kDE, kBI, kRU, kRI, kNN, kGU, $FF

.item_FC_name ; BERIARUNOTUBO | ベリアルのつぼ | Belial vase TODO ??
#_0991CD: db kBE, kRI, kAA, kRU, hNO, hTU, hBO, $FF

.item_FD_name ; SIMONNOGIyoKU | しもんのぎょく | King's fingerprint TODO ??
#_0991D5: db hSI, hMO, hNN, hNO, hGI, hYOs, hKU, $FF

.item_FE_name ; ￥NOTABA | ￥のたば | Cigarette TODO ??
#_0991DD: db YEN, hNO, hTA, hBA, $FF

.item_FF_name ; null
#_0991E2: db $FF


DATA8_0991E3:
#_0991E3: db $C6,$86,$8A,$C3,$FF
DATA8_0991E8:
#_0991E8: db $7F,$62,$FF
DATA8_0991EB:
#_0991EB: db $C6,$85,$5A,$7B,$5F,$8A,$6F,$8A
#_0991F3: db $FF
DATA8_0991F4:
#_0991F4: db $61,$8A,$BA,$87,$92,$64,$FF
DATA8_0991FB:
#_0991FB: db $BB,$8A,$78,$8C,$BC,$FF
DATA8_099201:
#_099201: db $5F,$8E,$92,$62,$70,$72,$92,$64
#_099209: db $FF
DATA8_09920A:
#_09920A: db $69,$CA,$5A,$C3,$62,$64,$6F,$85
#_099212: db $FF
DATA8_099213:
#_099213: db $7B,$BB,$62,$85,$78,$8C,$BC,$FF
DATA8_09921B:
#_09921B: db $7C,$83,$64,$85,$70,$72,$92,$64
#_099223: db $FF
DATA8_099224:
#_099224: db $FE,$2A,$D2,$6D,$01,$D5,$46,$DE
#_09922C: db $01,$00,$1C,$01,$E4,$00,$EF,$9A
#_099234: db $F9,$F0,$F2,$0B,$F9,$2C,$4D,$39
#_09923C: db $58,$37,$CF,$26,$58,$34,$4F,$27
#_099244: db $FC,$FA,$29,$4E,$3D,$37,$A9,$CF
#_09924C: db $29,$43,$28,$51,$CF,$36,$2A,$43
#_099254: db $28,$34,$2C,$3E,$F9,$39,$2A,$58
#_09925C: db $34,$52,$A6,$F2,$0B,$FC,$FA,$30
#_099264: db $2A,$34,$9C,$39,$26,$F9,$29,$43
#_09926C: db $28,$3A,$3E,$CF,$2F,$AB,$2B,$51
#_099274: db $CF,$27,$2D,$37,$47,$4B,$27,$A5
#_09927C: db $F9,$F2,$0B,$2F,$25,$CF,$2C,$4D
#_099284: db $52,$A6,$FC,$FE,$1C,$01,$FA,$FE
#_09928C: db $1B,$6D,$96,$0F,$00,$08,$1F,$FE
#_099294: db $37,$FE,$1C,$00,$D3,$02
DATA8_09929A:
#_09929A: db $D6,$00,$65,$70,$28,$F2,$34,$38
#_0992A2: db $9A,$F9,$31,$9E,$63,$6C,$3A,$CF
#_0992AA: db $44,$28,$4D,$3D,$3E,$F9,$45,$2A
#_0992B2: db $30,$CF,$67,$8A,$68,$8F,$5E,$8A
#_0992BA: db $38,$CF,$4A,$AB,$4E,$34,$CF,$C5
#_0992C2: db $85,$A6,$F9,$2F,$4B,$3A,$CF,$45
#_0992CA: db $2A,$30,$3A,$3E,$CF,$69,$B5,$7F
#_0992D2: db $93,$CB,$84,$BC,$8A,$38,$F9,$4A
#_0992DA: db $AB,$4E,$37,$26,$34,$4B,$30,$26
#_0992E2: db $FC,$FA,$33,$3D,$39,$9C,$CF,$26
#_0992EA: db $43,$CF,$40,$58,$2A,$36,$30,$34
#_0992F2: db $50,$2D,$A6,$FC,$FF
DATA8_0992F7:
#_0992F7: db $D2,$6D,$03,$EF,$9A,$F9,$2E,$2E
#_0992FF: db $3E,$CF,$28,$52,$43,$A6,$26,$29
#_099307: db $27,$CF,$2E,$38,$CF,$80,$7B,$2F
#_09930F: db $43,$3D,$F9,$2F,$AB,$2B,$3D,$CF
#_099317: db $43,$FC,$FA,$2E,$4E,$2A,$4B,$CF
#_09931F: db $F2,$6D,$CF,$F0,$F9,$36,$43,$4C
#_099327: db $CF,$29,$43,$28,$3D,$CF,$2F,$26
#_09932F: db $AB,$52,$9C,$CF,$3E,$A2,$43,$4D
#_099337: db $52,$A6,$FC,$FA,$2C,$4E,$9E,$4E
#_09933F: db $47,$CF,$80,$7B,$2F,$43,$3A,$CF
#_099347: db $30,$36,$4E,$26,$3D,$39,$26,$4A
#_09934F: db $27,$3A,$39,$FC,$FA,$E7,$00,$D6
#_099357: db $00,$6B,$60,$28,$FE,$07,$3C,$D3
#_09935F: db $05
DATA8_099360:
#_099360: db $D6,$00,$6B,$60,$28,$97,$80,$7B
#_099368: db $3D,$CF,$2F,$AB,$2B,$3D,$CF,$43
#_099370: db $F9,$D2,$6F,$04,$D2,$6E,$04,$F2
#_099378: db $68,$F8,$05,$FF
DATA8_09937C:
#_09937C: db $F2,$69,$FC,$FF
DATA8_099380:
#_099380: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_099388: db $D6,$00,$00,$FE,$1A,$6D,$97,$0F
#_099390: db $00,$08,$1F,$D3,$09
DATA8_099395:
#_099395: db $FE,$1C,$01,$E7,$00,$D4,$03,$FE
#_09939D: db $1A,$6D,$16,$0F,$00,$08,$1F,$FE
#_0993A5: db $37,$FE,$1C,$00,$DE,$01,$00,$1C
#_0993AD: db $01,$E4,$00,$EF,$9A,$F9,$D2,$6E
#_0993B5: db $07,$4A,$2A,$58,$34,$39,$CF,$45
#_0993BD: db $A1,$26,$A9,$F2,$0B,$29,$4E,$47
#_0993C5: db $CF,$7A,$92,$38,$30,$34,$A4,$FC
#_0993CD: db $FA,$A2,$55,$25,$39,$CF,$29,$34
#_0993D5: db $9C,$26,$CF,$26,$3D,$35,$9C,$CF
#_0993DD: db $25,$58,$34,$4B,$F9,$43,$34,$25
#_0993E5: db $29,$27,$A4,$FC,$E7,$00,$D3,$08
DATA8_0993ED:
#_0993ED: db $80,$CF,$80,$7B,$51,$CF,$34,$29
#_0993F5: db $30,$35,$43,$58,$34,$F2,$0B,$F9
#_0993FD: db $39,$52,$37,$2E,$38,$CF,$31,$4D
#_099405: db $52,$A6,$FC,$FA,$F2,$0B,$80,$7B
#_09940D: db $3D,$48,$36,$47,$CF,$34,$26,$30
#_099415: db $34,$2E,$38,$F9,$39,$2A,$58,$34
#_09941D: db $58,$37,$2E,$38,$2A,$F2,$0B,$F9
#_099425: db $80,$C4,$5E,$2E,$38,$3A,$CF,$39
#_09942D: db $4C,$33,$27,$A6,$F9,$29,$4E,$3E
#_099435: db $CF,$47,$58,$38,$CF,$36,$4A,$26
#_09943D: db $35,$2A,$4B,$51,$F9,$37,$3A,$26
#_099445: db $4E,$37,$CF,$44,$32,$4D,$A4,$F9
#_09944D: db $A2,$55,$25,$39,$94,$FC,$E7,$00
DATA8_099455:
#_099455: db $FE,$1A,$6D,$15,$0F,$00,$08,$1F
#_09945D: db $FF
DATA8_09945E:
#_09945E: db $D4,$03,$D5,$46,$D7,$2C,$DE,$01
#_099466: db $00,$0E,$01,$E4,$00,$F5,$9A,$F9
#_09946E: db $D2,$72,$14,$2E,$4E,$4A,$4C,$CF
#_099476: db $5D,$64,$7B,$36,$2A,$26,$CF,$F0
#_09947E: db $3D,$F9,$2F,$AB,$2B,$51,$CF,$29
#_099486: db $2E,$39,$27,$FC,$E9,$04,$18
DATA8_09948D:
#_09948D: db $FA,$F0,$4A,$CF,$33,$3D,$42,$27
#_099495: db $F9,$F2,$13,$F2,$08,$39,$4D,$47
#_09949D: db $3D,$51,$F9,$47,$35,$26,$37,$CF
#_0994A5: db $5D,$64,$7B,$51,$CF,$29,$47,$27
#_0994AD: db $9C,$43,$43,$3A,$CF,$25,$48,$36
#_0994B5: db $4C,$F9,$34,$34,$2A,$50,$30,$46
#_0994BD: db $34,$2E,$38,$CF,$4A,$47,$48,$CF
#_0994C5: db $30,$4B,$3B,$38,$3E,$F9,$26,$27
#_0994CD: db $43,$26,$39,$FC,$FA,$5D,$64,$7B
#_0994D5: db $38,$CF,$3A,$52,$9F,$52,$38,$3D
#_0994DD: db $CF,$25,$26,$A6,$3A,$F9,$26,$3A
#_0994E5: db $30,$28,$4A,$4C,$CF,$36,$34,$50
#_0994ED: db $4C,$30,$CF,$2D,$26,$48,$2C,$3A
#_0994F5: db $4A,$4B,$A3,$30,$37,$F9,$5D,$64
#_0994FD: db $7B,$51,$CF,$36,$2A,$26,$30,$2E
#_099505: db $38,$CF,$39,$9C,$2B,$3A,$CF,$50
#_09950D: db $34,$58,$37,$29,$4D,$FC,$D0,$6D
#_099515: db $D2,$83,$0B,$D3,$0C
DATA8_09951A:
#_09951A: db $D0,$8E
DATA8_09951C:
#_09951C: db $D2,$78,$0D,$D3,$0E
DATA8_099521:
#_099521: db $D0,$8F
DATA8_099523:
#_099523: db $FE,$04,$10,$13,$FA,$33,$3D,$CF
#_09952B: db $30,$57,$9D,$57,$27,$F9,$43,$2E
#_099533: db $38,$CF,$49,$4D,$30,$9C,$34,$2B
#_09953B: db $CF,$38,$2E,$4F,$A9,$3E,$CF,$25
#_099543: db $4D,$9C,$F9,$48,$45,$3A,$48,$43
#_09954B: db $4E,$3B,$CF,$A2,$A2,$57,$27,$47
#_099553: db $CF,$25,$58,$34,$2E,$38,$47,$43
#_09955B: db $34,$F9,$44,$38,$46,$4B,$4E,$4D
#_099563: db $FC,$FA,$33,$2E,$A9,$CF,$50,$9C
#_09956B: db $CF,$34,$3D,$44,$CF,$2B,$2B,$26
#_099573: db $4E,$4D,$39,$4B,$F9,$31,$AE,$37
#_09957B: db $CF,$49,$4D,$30,$37,$CF,$36,$2A
#_099583: db $50,$33,$27,$FC,$FA,$25,$4B,$34
#_09958B: db $39,$4D,$CF,$30,$3E,$26,$3D,$CF
#_099593: db $30,$57,$27,$35,$57,$27,$F9,$F2
#_09959B: db $5C,$3D,$CF,$2A,$52,$32,$26,$51
#_0995A3: db $CF,$3E,$AB,$52,$A9,$42,$30,$26
#_0995AB: db $F9,$50,$9C,$CF,$34,$3D,$44,$CF
#_0995B3: db $2B,$2B,$26,$4E,$4D,$2A,$95,$F8
#_0995BB: db $0F,$D4,$04,$39,$52,$38,$94,$CF
#_0995C3: db $2E,$AB,$45,$38,$CF,$47,$27,$31
#_0995CB: db $2A,$94,$F9,$50,$9C,$CF,$A2,$3F
#_0995D3: db $3D,$CF,$2E,$2E,$4F,$CF,$50,$2A
#_0995DB: db $4B,$3B,$38,$CF,$47,$27,$31,$2A
#_0995E3: db $94,$F9,$39,$4B,$AB,$CF,$4F,$27
#_0995EB: db $3A,$CF,$3E,$26,$4C,$CF,$2C,$26
#_0995F3: db $25,$4B,$34,$46,$4A,$94,$F9,$FE
#_0995FB: db $02,$F0,$D3,$11
DATA8_0995FF:
#_0995FF: db $D4,$04,$33,$27,$2A,$CF,$A9,$3E
#_099607: db $CF,$44,$A3,$2A,$4B,$3D,$35,$2A
#_09960F: db $4B,$F9,$62,$61,$69,$3D,$CF,$9C
#_099617: db $50,$3A,$CF,$2F,$2F,$9F,$F9,$F2
#_09961F: db $5C,$51,$CF,$35,$A2,$57,$27,$4A
#_099627: db $4C,$CF,$42,$27,$45,$4C,$2F,$4D
#_09962F: db $43,$A9,$F9,$34,$34,$2A,$26,$36
#_099637: db $A8,$2D,$4D,$3D,$A6,$F9,$4A,$26
#_09963F: db $39,$FC,$FE,$02,$10,$D3,$17
DATA8_099646:
#_099646: db $D0,$70,$FE,$02,$FB,$FA,$43,$2E
#_09964E: db $38,$3A,$CF,$47,$58,$37,$CF,$49
#_099656: db $4D,$30,$9C,$34,$26,$94,$F9,$4A
#_09965E: db $58,$37,$CF,$30,$A1,$26,$51,$CF
#_099666: db $47,$27,$30,$36,$2D,$4D,$F9,$30
#_09966E: db $57,$2D,$26,$3E,$CF,$44,$57,$27
#_099676: db $35,$57,$27,$CF,$38,$4C,$29,$2E
#_09967E: db $39,$27,$F9
DATA8_099681:
#_099681: db $31,$9E,$3A,$CF,$3F,$58,$34,$37
#_099689: db $26,$94,$FC,$FE,$1C,$01,$FA,$E7
#_099691: db $00
DATA8_099692:
#_099692: db $FE,$1B,$6A,$5F,$0F,$00,$08,$1F
#_09969A: db $D3,$19
DATA8_09969C:
#_09969C: db $FA,$A6,$9C,$CF,$33,$3D,$3E,$34
#_0996A4: db $4B,$2B,$F9,$47,$58,$B0,$4B,$CF
#_0996AC: db $62,$61,$69,$3D,$9C,$50,$3D,$34
#_0996B4: db $46,$CF,$36,$2C,$2F,$4E,$37,$29
#_0996BC: db $4D,$F9,$4A,$58,$37,$CF,$F0,$3E
#_0996C4: db $CF,$45,$A1,$26,$42,$27,$46,$52
#_0996CC: db $F9,$26,$58,$2F,$26,$CF,$38,$9C
#_0996D4: db $46,$39,$2B,$2E,$38,$38,$CF,$31
#_0996DC: db $4D,$FC,$D3,$17
DATA8_0996E0:
#_0996E0: db $A6,$36,$A0,$2C,$30,$34,$27,$28
#_0996E8: db $CF,$50,$9C,$43,$28,$3A,$CF,$31
#_0996F0: db $9C,$34,$25,$4B,$50,$31,$38,$3E
#_0996F8: db $F9,$40,$38,$AA,$2B,$32,$52,$AB
#_099700: db $52,$94,$F9,$33,$58,$2E,$2C,$CF
#_099708: db $32,$26,$AB,$26,$30,$37,$2C,$4E
#_099710: db $4D,$94,$FC,$E5,$01,$16,$D3,$15
DATA8_099718:
#_099718: db $E5,$00,$16,$D3,$15
DATA8_09971D:
#_09971D: db $E7,$00,$FE,$02,$F0,$D0,$6E,$D3
#_099725: db $06
DATA8_099726:
#_099726: db $D0,$6F,$FE,$02,$05,$D3,$06
DATA8_09972D:
#_09972D: db $FA,$2F,$AB,$2B,$51,$CF,$27,$2D
#_099735: db $4B,$4E,$4D,$CF,$2A,$4B,$A6,$A9
#_09973D: db $3E,$CF,$39,$26,$39,$F9,$43,$A3
#_099745: db $3E,$CF,$39,$29,$30,$37,$CF,$36
#_09974D: db $2A,$50,$33,$27,$FC,$FE,$25,$FF
#_099755: db $FE,$23,$FF,$FE,$24,$FF,$D3,$0A
DATA8_09975D:
#_09975D: db $D0,$0C,$D4,$03,$FE,$37,$D7,$33
#_099765: db $D6,$00,$65,$70,$28,$FE,$1C,$00
#_09976D: db $F2,$34,$38,$9A,$F9,$2E,$2E,$3A
#_099775: db $CF,$3E,$26,$58,$37,$26,$4F,$FC
#_09977D: db $D2,$70,$1A,$D3,$1B
DATA8_099782:
#_099782: db $FA,$F2,$04,$3D,$CF,$26,$3D,$35
#_09978A: db $47,$CF,$25,$30,$34,$43,$A9,$A6
#_099792: db $FC
DATA8_099793:
#_099793: db $FE,$1A,$69,$5F,$0F,$00,$08,$1F
#_09979B: db $FF
DATA8_09979C:
#_09979C: db $FE,$37,$D2,$72,$1E,$D7,$33,$D2
#_0997A4: db $76,$1D,$F2,$84,$FF
DATA8_0997A9:
#_0997A9: db $FE,$62,$FE,$07,$3C,$DE,$01,$00
#_0997B1: db $1C,$01,$E4,$00,$EF,$9A,$F9,$A6
#_0997B9: db $2A,$4B,$CF,$26,$58,$34,$A2,$55
#_0997C1: db $3C,$28,$2A,$F9,$2E,$58,$35,$3A
#_0997C9: db $3E,$CF,$2C,$4D,$39,$58,$37,$FC
#_0997D1: db $FA,$2E,$3D,$2F,$2B,$CF,$43,$35
#_0997D9: db $9C,$58,$37,$47,$CF,$5F,$60,$75
#_0997E1: db $42,$27,$46,$52,$3A,$F9,$26,$2E
#_0997E9: db $27,$39,$52,$37,$CF,$29,$47,$27
#_0997F1: db $39,$4A,$FC,$E7,$00,$D0,$72,$FE
#_0997F9: db $1A,$6B,$5F,$0F,$00,$08,$1F,$FA
#_099801: db $97,$33,$38,$3A,$CF,$A9,$4B,$4E
#_099809: db $34,$FC,$D0,$0C,$D1,$73,$D1,$74
#_099811: db $D1,$75,$D1,$76,$FF
DATA8_099816:
#_099816: db $D7,$33,$97,$F2,$2C,$FC,$FF
DATA8_09981D:
#_09981D: db $D6,$00,$A9,$70,$28,$ED,$9A,$F9
#_099825: db $D2,$73,$20,$3E,$48,$2C,$CF,$2E
#_09982D: db $2E,$2A,$4B,$CF,$3A,$9F,$39,$2B
#_099835: db $55,$FC,$D0,$73,$FF
DATA8_09983A:
#_09983A: db $D2,$74,$21,$25,$25,$58,$CF,$AA
#_099842: db $27,$30,$34,$4B,$CF,$26,$26,$3D
#_09984A: db $4A,$F2,$0B,$FC,$D0,$74,$FF
DATA8_099851:
#_099851: db $D2,$75,$22,$3C,$28,$CF,$5F,$87
#_099859: db $5F,$87,$30,$37,$39,$26,$A9,$F9
#_099861: db $25,$39,$34,$47,$CF,$2A,$52,$9C
#_099869: db $28,$37,$4A,$FC,$D0,$75,$FF
DATA8_099870:
#_099870: db $A6,$4E,$2A,$CF,$2B,$34,$50,$4A
#_099878: db $FC,$D0,$76,$FF
DATA8_09987C:
#_09987C: db $DE,$01,$00,$0F,$01,$D2,$77,$28
#_099884: db $E4,$00,$F5,$9A,$F9,$D2,$72,$25
#_09988C: db $50,$34,$30,$9C,$CF,$69,$B5,$7F
#_099894: db $93,$CB,$84,$BC,$8A,$51,$CF,$43
#_09989C: db $47,$58,$37,$26,$4D,$3D,$A6,$FC
#_0998A4: db $D2,$6F,$24,$E7,$00,$FF
DATA8_0998AA:
#_0998AA: db $FA,$36,$44,$39,$2B,$47,$3D,$3A
#_0998B2: db $CF,$4A,$27,$3E,$39,$26,$F9,$33
#_0998BA: db $27,$33,$27,$3A,$CF,$34,$35,$2F
#_0998C2: db $4B,$4E,$4A,$FC,$E7,$00,$FF
DATA8_0998C9:
#_0998C9: db $A6,$36,$A0,$2C,$3E,$CF,$A4,$58
#_0998D1: db $34,$26,$CF,$49,$4D,$2F,$52,$94
#_0998D9: db $FC,$E4,$00,$E5,$01,$27
DATA8_0998DF:
#_0998DF: db $E5,$00,$27,$D3,$26
DATA8_0998E4:
#_0998E4: db $E7,$00,$FA,$FE,$02,$F0,$D0,$77
DATA8_0998EC:
#_0998EC: db $D6,$00,$6C,$60,$28,$D2,$0C,$29
#_0998F4: db $D3,$2A
DATA8_0998F6:
#_0998F6: db $97,$CB,$84,$BC,$8A,$3D,$CF,$F2
#_0998FE: db $89,$F8,$2B,$FF
DATA8_099902:
#_099902: db $97,$CB,$84,$BC,$8A,$3D,$CF,$F2
#_09990A: db $68,$F8,$2C,$FF
DATA8_09990E:
#_09990E: db $D6,$00,$75,$60,$28,$FE,$07,$03
#_099916: db $D6,$00,$00,$FE,$1A,$64,$1D,$0F
#_09991E: db $00,$08,$1F,$D1,$0C,$FF
DATA8_099924:
#_099924: db $D6,$00,$75,$60,$28,$FE,$07,$03
#_09992C: db $D6,$00,$00,$FE,$1A,$64,$9F,$0F
#_099934: db $00,$08,$1F,$D0,$0C,$FF
DATA8_09993A:
#_09993A: db $D7,$A4,$33,$D6,$00,$85,$70,$28
#_099942: db $F2,$33,$38,$9A,$F9,$2A,$44,$3D
#_09994A: db $CF,$34,$46,$39,$4B,$CF,$2E,$3D
#_099952: db $26,$3D,$35,$F9,$26,$36,$A9,$47
#_09995A: db $CF,$31,$37,$43,$30,$57,$27,$FC
#_099962: db $FF
DATA8_099963:
#_099963: db $D7,$A4,$33,$D6,$00,$0E,$70,$38
#_09996B: db $F2,$33,$38,$9A,$F9,$AF,$2C,$3E
#_099973: db $CF,$2A,$44,$2F,$43,$3D,$34,$46
#_09997B: db $3A,$F9,$5D,$64,$7B,$51,$CF,$2E
#_099983: db $4F,$30,$34,$52,$A6,$4A,$F9,$2A
#_09998B: db $44,$2F,$43,$3E,$CF,$31,$A0,$2C
#_099993: db $CF,$4A,$4F,$2E,$52,$A9,$CF,$2C
#_09999B: db $4E,$4D,$52,$A6,$FC,$FF
DATA8_0999A1:
#_0999A1: db $D7,$A4,$33,$D6,$00,$85,$70,$28
#_0999A9: db $F2,$33,$38,$9A,$F9,$F2,$33,$3D
#_0999B1: db $34,$46,$CF,$30,$3B,$2E,$38,$3A
#_0999B9: db $F9,$2C,$26,$3E,$CF,$25,$4C,$43
#_0999C1: db $32,$52,$FC,$FA,$34,$A6,$CF,$30
#_0999C9: db $3B,$43,$28,$3A,$CF,$F2,$5C,$51
#_0999D1: db $F9,$26,$35,$AA,$CF,$44,$34,$2A
#_0999D9: db $58,$34,$F2,$0B,$FC,$FF
DATA8_0999DF:
#_0999DF: db $D7,$A4,$33,$D6,$00,$A3,$70,$28
#_0999E7: db $30,$56,$27,$A2,$52,$9A,$F9,$50
#_0999EF: db $34,$30,$3E,$CF,$F2,$34,$38,$51
#_0999F7: db $F9,$39,$52,$3A,$52,$47,$CF,$2E
#_0999FF: db $4F,$30,$43,$30,$34,$F9,$26,$36
#_099A07: db $2A,$CF,$2A,$44,$3E,$CF,$30,$56
#_099A0F: db $2C,$40,$2C,$30,$37,$CF,$2C,$A6
#_099A17: db $2F,$26,$43,$31,$FC,$FF
DATA8_099A1D:
#_099A1D: db $D7,$A4,$33,$D6,$00,$87,$70,$28
#_099A25: db $30,$56,$27,$A2,$52,$9A,$F9,$2B
#_099A2D: db $57,$27,$2A,$26,$51,$CF,$34,$37
#_099A35: db $4D,$3A,$3E,$CF,$2A,$3C,$9C,$2A
#_099A3D: db $2A,$4D,$52,$A6,$F9,$31,$2E,$30
#_099A45: db $9E,$4B,$26,$CF,$2A,$58,$B0,$4B
#_099A4D: db $58,$34,$58,$37,$CF,$26,$26,$A2
#_099A55: db $55,$39,$26,$2A,$FC,$FF
DATA8_099A5B:
#_099A5B: db $D7,$A4,$33,$D6,$00,$65,$70,$28
#_099A63: db $30,$56,$27,$A2,$52,$9A,$F9,$3A
#_099A6B: db $52,$9F,$52,$3D,$CF,$37,$2B,$CF
#_099A73: db $5D,$64,$7B,$51,$CF,$2E,$4F,$30
#_099A7B: db $37,$F9,$39,$3A,$9C,$CF,$50,$4D
#_099A83: db $26,$FC,$FA,$29,$4E,$3E,$CF,$A4
#_099A8B: db $58,$34,$26,$CF,$34,$A6,$30,$26
#_099A93: db $94,$FC,$FF
DATA8_099A96:
#_099A96: db $D7,$A4,$33,$97,$F2,$2C,$FC,$FF
DATA8_099A9E:
#_099A9E: db $D6,$00,$65,$70,$28,$F2,$34,$38
#_099AA6: db $9A,$F9,$80,$7B,$A6,$26,$29,$27
#_099AAE: db $2F,$43,$3D,$CF,$2F,$AB,$2B,$3E
#_099AB6: db $CF,$2E,$27,$41,$26,$A6,$FC,$FA
#_099ABE: db $25,$2C,$3A,$52,$38,$CF,$F2,$33
#_099AC6: db $38,$3E,$F9,$44,$39,$CF,$30,$2D
#_099ACE: db $26,$3A,$CF,$39,$4D,$52,$A6,$FC
#_099AD6: db $FF
DATA8_099AD7:
#_099AD7: db $80,$7B,$2F,$43,$9C,$CF,$26,$39
#_099ADF: db $2C,$39,$58,$37,$F9,$A6,$4E,$9C
#_099AE7: db $CF,$25,$2C,$3A,$52,$51,$CF,$2F
#_099AEF: db $AB,$2C,$52,$A6,$95,$FC,$FF
DATA8_099AF6:
#_099AF6: db $D6,$00,$8A,$70,$28,$F2,$34,$38
#_099AFE: db $9A,$F9,$25,$52,$34,$44,$34,$26
#_099B06: db $39,$48,$36,$CF,$5F,$60,$75,$3D
#_099B0E: db $B5,$5E,$5D,$A6,$26,$30,$52,$A9
#_099B16: db $52,$3A,$F9,$35,$2A,$A8,$2C,$30
#_099B1E: db $2A,$2C,$47,$CF,$39,$26,$50,$3C
#_099B26: db $FC,$FF
DATA8_099B28:
#_099B28: db $25,$52,$34,$CF,$F2,$34,$38,$3A
#_099B30: db $CF,$39,$58,$34,$4B,$95,$F9,$5F
#_099B38: db $60,$75,$3D,$CF,$B5,$5E,$5D,$A6
#_099B40: db $26,$30,$52,$A9,$52,$A9,$F9,$32
#_099B48: db $52,$4E,$26,$51,$CF,$27,$2D,$4E
#_099B50: db $AB,$26,$26,$3D,$4A,$FC,$FF
DATA8_099B57:
#_099B57: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_099B5F: db $9A,$F9,$63,$6C,$3A,$CF,$29,$33
#_099B67: db $4F,$30,$26,$9C,$CF,$34,$4A,$4C
#_099B6F: db $3A,$39,$4D,$F9,$63,$68,$8A,$9C
#_099B77: db $CF,$26,$4D,$33,$27,$A6,$FC,$FF
DATA8_099B7F:
#_099B7F: db $D6,$00,$89,$70,$28,$4F,$27,$A2
#_099B87: db $52,$9A,$F9,$69,$B5,$7F,$CB,$84
#_099B8F: db $BC,$8A,$CF,$2F,$26,$A2,$57,$27
#_099B97: db $2A,$26,$3A,$3E,$F9,$38,$2C,$AE
#_099B9F: db $36,$2A,$52,$A0,$2C,$9C,$CF,$25
#_099BA7: db $4D,$58,$37,$CF,$27,$50,$2F,$A6
#_099BAF: db $9C,$F9,$26,$58,$34,$48,$36,$3E
#_099BB7: db $CF,$F2,$2C,$FC,$FA,$33,$2E,$3A
#_099BBF: db $CF,$5D,$64,$7B,$9C,$58,$34,$26
#_099BC7: db $3D,$CF,$46,$26,$A2,$52,$9C,$F9
#_099BCF: db $38,$A2,$2E,$46,$4B,$4E,$37,$4D
#_099BD7: db $58,$37,$CF,$27,$50,$2F,$A6,$9C
#_099BDF: db $F9,$44,$34,$48,$36,$3E,$CF,$F2
#_099BE7: db $2C,$FC,$FF
DATA8_099BEA:
#_099BEA: db $D6,$00,$B2,$70,$38,$2E,$AA,$47
#_099BF2: db $9A,$F9,$69,$B5,$7F,$CB,$84,$BC
#_099BFA: db $8A,$3A,$3E,$CF,$50,$4D,$26,$48
#_099C02: db $36,$9C,$F9,$29,$29,$A4,$26,$CF
#_099C0A: db $26,$4E,$4B,$4E,$37,$CF,$30,$2D
#_099C12: db $26,$3A,$CF,$2F,$4E,$37,$2C,$52
#_099C1A: db $A6,$FC,$FA,$45,$2A,$30,$2A,$4B
#_099C22: db $CF,$33,$27,$A6,$58,$34,$52,$A6
#_099C2A: db $58,$37,$FC,$FA,$31,$26,$A5,$2C
#_099C32: db $2A,$52,$48,$CF,$CB,$83,$74,$6C
#_099C3A: db $84,$5F,$7D,$47,$CF,$25,$58,$34
#_099C42: db $F9,$58,$37,$26,$27,$CF,$3F,$38
#_099C4A: db $9C,$CF,$26,$34,$2D,$AA,$CF,$39
#_099C52: db $3A,$33,$4E,$95,$FC,$FF
DATA8_099C58:
#_099C58: db $D7,$A4,$33,$D2,$77,$41,$D5,$47
#_099C60: db $D6,$00,$2D,$70,$28,$F2,$83,$9A
#_099C68: db $F9,$D2,$69,$3C,$43,$34,$CF,$25
#_099C70: db $58,$34,$39,$CF,$F0,$2C,$52,$FC
#_099C78: db $D0,$69,$FA,$2E,$2E,$3D,$CF,$3B
#_099C80: db $30,$CF,$80,$7B,$3E,$F9,$3F,$38
#_099C88: db $AC,$38,$51,$CF,$2F,$AB,$2B,$3A
#_099C90: db $CF,$2A,$2D,$37,$26,$4D,$F9,$2F
#_099C98: db $AB,$2B,$A2,$34,$26,$3E,$CF,$2E
#_099CA0: db $27,$41,$26,$39,$3D,$A6,$9C,$F9
#_099CA8: db $33,$3D,$CF,$2B,$A2,$56,$52,$3E
#_099CB0: db $CF,$25,$2C,$43,$A9,$CF,$62,$61
#_099CB8: db $69,$4A,$4C,$39,$3D,$A6,$FC,$D3
#_099CC0: db $3D
DATA8_099CC1:
#_099CC1: db $A6,$26,$A2,$57,$27,$AD,$2A,$3C
#_099CC9: db $95,$F9
DATA8_099CCB:
#_099CCB: db $39,$3A,$2A,$CF,$2E,$43,$58,$34
#_099CD3: db $2E,$38,$9C,$CF,$25,$58,$34,$4B
#_099CDB: db $F9,$2E,$2E,$41,$CF,$2B,$39,$2F
#_099CE3: db $26,$FC
DATA8_099CE5:
#_099CE5: db $FE,$25,$FF,$FE,$23,$FF,$FE,$24
#_099CED: db $FF,$FA,$3C,$52,$3D,$34,$46,$CF
#_099CF5: db $2E,$2E,$A9,$CF,$2B,$4F,$2C,$31
#_099CFD: db $4D,$2A,$3C,$95,$F8,$3F,$D3,$40
DATA8_099D05:
#_099D05: db $FE,$42,$FE,$22,$40,$FA,$D6,$00
#_099D0D: db $2D,$70,$28,$F2,$5A,$FA,$F2,$5B
#_099D15: db $F8,$40,$FE,$1D,$24,$03
DATA8_099D1B:
#_099D1B: db $D5,$47,$D6,$00,$2D,$70,$28,$D4
#_099D23: db $03,$72,$61,$5F,$51,$CF,$34,$29
#_099D2B: db $32,$AB,$CF,$33,$38,$41,$CF,$A9
#_099D33: db $4B,$4E,$4D,$3E,$A3,$A6,$FC,$FF
DATA8_099D3B:
#_099D3B: db $97,$F2,$2C,$FC,$FF
DATA8_099D40:
#_099D40: db $D5,$46,$D7,$2E,$FE,$3A,$02,$03
#_099D48: db $FE,$07,$7F,$D6,$00,$84,$70,$28
#_099D50: db $F2,$34,$CF,$2B,$57,$27,$33,$9A
#_099D58: db $F9,$D2,$7D,$08,$D2,$79,$06,$D2
#_099D60: db $78,$01,$2E,$2E,$3E,$CF,$50,$9C
#_099D68: db $CF,$F2,$34,$3D,$CF,$33,$27,$42
#_099D70: db $52,$A1,$52,$F9,$B5,$5E,$5D,$A6
#_099D78: db $26,$30,$52,$A9,$52,$FC,$FA,$29
#_099D80: db $3B,$30,$9C,$CF,$F0,$2A,$F9,$27
#_099D88: db $50,$2F,$3E,$CF,$50,$34,$30,$3D
#_099D90: db $CF,$44,$44,$3A,$47,$CF,$38,$AA
#_099D98: db $26,$37,$29,$4D,$A5,$F9,$3E,$A9
#_099DA0: db $3A,$CF,$25,$35,$2E,$35,$CF,$25
#_099DA8: db $4B,$30,$43,$50,$58,$37,$26,$4D
#_099DB0: db $33,$27,$A6,$39,$FC,$D0,$78,$D3
#_099DB8: db $02
DATA8_099DB9:
#_099DB9: db $29,$3B,$30,$3D,$CF,$49,$27,$A2
#_099DC1: db $52,$A9,$25,$58,$34,$CF,$EF,$3E
#_099DC9: db $F9,$F2,$67,$38,$30,$37,$F9,$50
#_099DD1: db $4E,$4B,$3D,$34,$46,$3A,$CF,$3E
#_099DD9: db $34,$4B,$26,$37,$2C,$4E,$37,$29
#_099DE1: db $4D,$FC
DATA8_099DE3:
#_099DE3: db $FA,$F0,$4A,$F9,$4A,$2C,$A5,$CF
#_099DEB: db $2E,$2E,$43,$A9,$2B,$34,$F2,$0B
#_099DF3: db $FC,$FE,$05,$EF,$FF,$03,$D3,$04
DATA8_099DFB:
#_099DFB: db $FA,$38,$CF,$26,$26,$34,$26,$38
#_099E03: db $2E,$4F,$A6,$9C,$CF,$29,$43,$28
#_099E0B: db $3E,$F9,$2E,$2E,$3A,$CF,$34,$35
#_099E13: db $4A,$4D,$30,$2A,$2C,$51,$CF,$47
#_099E1B: db $58,$37,$29,$4B,$3B,$4A,$27,$A6
#_099E23: db $F9,$31,$9E,$3A,$CF,$34,$35,$2F
#_099E2B: db $4D,$9C,$4A,$26,$FC,$FF
DATA8_099E31:
#_099E31: db $29,$43,$28,$3E,$CF,$50,$9C,$CF
#_099E39: db $F2,$34,$A6,$52,$3D,$CF,$26,$35
#_099E41: db $26,$52,$38,$F9,$39,$4C,$27,$4D
#_099E49: db $CF,$30,$2A,$2C,$9C,$25,$4D,$FC
#_099E51: db $FA,$31,$9E,$3A,$CF,$32,$52,$4E
#_099E59: db $26,$51,$27,$2D,$37,$F9,$50,$9C
#_099E61: db $CF,$F2,$34,$A6,$52,$41,$CF,$2C
#_099E69: db $50,$50,$4C,$34,$43,$28,$FC,$FA
#_099E71: db $97,$F2,$34,$3D,$CF,$32,$52,$4E
#_099E79: db $26,$51,$CF,$27,$2D,$43,$31,$2A
#_099E81: db $95,$F8,$05,$D4,$03,$39,$52,$38
#_099E89: db $CF,$2E,$38,$50,$4D,$38,$CF,$47
#_099E91: db $27,$31,$2A,$F2,$0B,$F9,$33,$4E
#_099E99: db $3E,$CF,$A1,$52,$3C,$52,$30,$A0
#_099EA1: db $2C,$F9,$43,$34,$CF,$26,$36,$A9
#_099EA9: db $47,$CF,$2C,$4D,$9C,$4A,$26,$FC
#_099EB1: db $FF
DATA8_099EB2:
#_099EB2: db $D4,$03,$4A,$4F,$30,$26,$CF,$31
#_099EBA: db $9E,$3A,$CF,$32,$52,$4E,$26,$30
#_099EC2: db $2B,$51,$CF,$29,$2E,$39,$29,$27
#_099ECA: db $F9,$26,$33,$9F,$CF,$9D,$30,$2B
#_099ED2: db $3D,$CF,$4A,$27,$26,$51,$94,$FC
#_099EDA: db $FA,$D6,$00,$00,$FE,$07,$7F,$D6
#_099EE2: db $00,$35,$70,$28,$D6,$02,$92,$50
#_099EEA: db $38,$D6,$03,$92,$90,$38,$FE,$07
#_099EF2: db $3C,$D6,$00,$00,$D6,$00,$91,$60
#_099EFA: db $28,$97,$F2,$34,$3D,$F9,$32,$52
#_099F02: db $4E,$26,$3D,$CF,$9D,$30,$2B,$9C
#_099F0A: db $CF,$29,$2E,$39,$50,$4E,$34,$F2
#_099F12: db $0B,$FE,$07,$7F,$FE,$1C,$03,$FC
#_099F1A: db $FA,$D6,$00,$00,$D6,$00,$35,$70
#_099F22: db $28,$FE,$07,$3C,$FE,$02,$10,$D0
#_099F2A: db $79,$D0,$FB,$D6,$00,$00,$D6,$02
#_099F32: db $00,$D6,$03,$00,$FE,$07,$3C,$D6
#_099F3A: db $00,$84,$70,$28,$F2,$34,$2B,$57
#_099F42: db $27,$33,$9A,$F9,$D3,$07
DATA8_099F48:
#_099F48: db $29,$29,$CF,$50,$9C,$CF,$2B,$57
#_099F50: db $27,$A6,$26,$CF,$F0,$4A,$F9,$4A
#_099F58: db $2C,$A5,$CF,$A6,$26,$30,$52,$A9
#_099F60: db $52,$3A,$CF,$25,$30,$51,$CF,$3E
#_099F68: db $2E,$52,$A9,$2C,$4E,$34,$FC,$FE
#_099F70: db $06,$41,$07,$D3,$09
DATA8_099F75:
#_099F75: db $FE,$25,$FF,$FE,$23,$FF,$FE,$24
#_099F7D: db $FF,$2E,$4E,$2A,$4B,$47,$CF,$F2
#_099F85: db $34,$38,$CF,$50,$9C,$CF,$2B,$57
#_099F8D: db $27,$A6,$52,$3A,$F9,$31,$2C,$26
#_099F95: db $51,$CF,$47,$38,$46,$4D,$CF,$3F
#_099F9D: db $38,$AC,$38,$3D,$34,$46,$F9,$3E
#_099FA5: db $34,$4B,$26,$37,$2C,$4E,$CF,$34
#_099FAD: db $3D,$52,$A6,$A5,$FC,$FF
DATA8_099FB3:
#_099FB3: db $45,$45,$58,$CF,$26,$43,$50,$30
#_099FBB: db $2B,$CF,$2A,$44,$3D,$CF,$37,$2F
#_099FC3: db $2B,$46,$94,$F9,$2E,$2E,$3E,$CF
#_099FCB: db $2B,$2F,$43,$3D,$CF,$2C,$4D,$38
#_099FD3: db $2E,$4F,$A9,$3E,$39,$26,$94,$FC
#_099FDB: db $FF
DATA8_099FDC:
#_099FDC: db $D2,$7F,$07,$FA,$2B,$57,$27,$3E
#_099FE4: db $CF,$50,$9C,$CF,$2B,$57,$27,$A6
#_099FEC: db $26,$3A,$CF,$40,$2F,$50,$30,$26
#_099FF4: db $F9,$33,$27,$AC,$51,$CF,$25,$34
#_099FFC: db $28,$4A,$27,$FC,$FA,$38,$A1,$2F
#_09A004: db $4E,$34,$CF,$38,$AC,$4B,$51,$CF
#_09A00C: db $25,$2D,$37,$29,$26,$34,$F9,$29
#_09A014: db $2C,$3A,$CF,$29,$26,$37,$25,$4D
#_09A01C: db $CF,$47,$58,$37,$49,$2C,$9C,$CF
#_09A024: db $4A,$26,$FC,$D0,$7F,$D3,$07
DATA8_09A02B:
#_09A02B: db $D2,$7A,$0C,$D5,$39,$DE,$01,$00
#_09A033: db $10,$01,$E4,$00,$E5,$01,$0C
DATA8_09A03A:
#_09A03A: db $E5,$00,$0C,$D3,$0B
DATA8_09A03F:
#_09A03F: db $E7,$00,$FA,$D0,$7A,$D2,$83,$0D
#_09A047: db $D3,$0E
DATA8_09A049:
#_09A049: db $D0,$90
DATA8_09A04B:
#_09A04B: db $F2,$74,$F8,$0F,$F2,$75,$FC,$FF
DATA8_09A053:
#_09A053: db $D6,$00,$B7,$70,$48,$D2,$7B,$10
#_09A05B: db $D4,$03,$E1,$F4,$F1,$3E,$CF,$F3
#_09A063: db $51,$F9,$FE,$3C,$11,$F2,$2D,$FC
#_09A06B: db $FE,$28,$D0,$7B,$FF
DATA8_09A070:
#_09A070: db $F2,$76,$FC,$FF
DATA8_09A074:
#_09A074: db $F2,$72,$FC,$FF
DATA8_09A078:
#_09A078: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09A080: db $9A,$F9,$F2,$34,$3D,$CF,$32,$52
#_09A088: db $4E,$26,$51,$CF,$27,$2D,$3A,$2B
#_09A090: db $34,$9C,$F9,$30,$2A,$2C,$9C,$CF
#_09A098: db $39,$26,$38,$CF,$26,$50,$4E,$37
#_09A0A0: db $30,$43,$58,$34,$FC,$FF
DATA8_09A0A6:
#_09A0A6: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09A0AE: db $9A,$F9,$F2,$33,$38,$9C,$CF,$F2
#_09A0B6: db $5C,$51,$F9,$47,$27,$A2,$2B,$CF
#_09A0BE: db $2A,$52,$32,$26,$2F,$32,$4D,$33
#_09A0C6: db $27,$A6,$FC,$FA,$A6,$9C,$CF,$F2
#_09A0CE: db $34,$38,$34,$35,$9C,$F9,$F2,$5C
#_09A0D6: db $3D,$58,$38,$4C,$51,$CF,$34,$2C
#_09A0DE: db $4B,$52,$A9,$CF,$26,$4D,$4B,$30
#_09A0E6: db $26,$A5,$FC,$FF
DATA8_09A0EA:
#_09A0EA: db $D6,$00,$65,$70,$28,$F2,$34,$38
#_09A0F2: db $9A,$F9,$29,$4E,$3E,$CF,$F2,$5C
#_09A0FA: db $3D,$58,$38,$4C,$3A,$CF,$26,$2C
#_09A102: db $A4,$FC,$FA,$2E,$4E,$26,$A2,$57
#_09A10A: db $27,$CF,$F2,$33,$38,$AA,$47,$3A
#_09A112: db $F9,$31,$2B,$2A,$58,$37,$2F,$4E
#_09A11A: db $37,$CF,$34,$43,$4D,$2A,$94,$FC
#_09A122: db $FF
DATA8_09A123:
#_09A123: db $D6,$00,$8A,$70,$28,$F2,$34,$38
#_09A12B: db $9A,$F9,$2E,$2E,$3E,$CF,$F2,$34
#_09A133: db $3D,$CF,$33,$27,$42,$52,$A1,$52
#_09A13B: db $F9,$A5,$2C,$32,$26,$9C,$CF,$62
#_09A143: db $61,$69,$A9,$39,$26,$48,$36,$3E
#_09A14B: db $F9,$BF,$7E,$5A,$BB,$CF,$27,$2D
#_09A153: db $43,$2C,$4C,$4A,$FC,$FF
DATA8_09A159:
#_09A159: db $D6,$00,$0A,$70,$28,$F2,$34,$38
#_09A161: db $9A,$F9,$9C,$26,$38,$27,$1E,$20
#_09A169: db $3E,$CF,$AD,$35,$2E,$50,$30,$37
#_09A171: db $CF,$48,$58,$34,$4A,$FC,$FA,$F2
#_09A179: db $1C,$6C,$88,$5A,$3A,$CF,$6F,$8A
#_09A181: db $68,$9C,$CF,$2B,$37,$F9,$2A,$44
#_09A189: db $9C,$CF,$AA,$27,$3D,$CF,$2E,$27
#_09A191: db $3D,$38,$CF,$27,$4D,$2F,$2C,$58
#_09A199: db $37,$F9,$7D,$62,$36,$2C,$A4,$FC
#_09A1A1: db $FF
DATA8_09A1A2:
#_09A1A2: db $D6,$00,$65,$70,$28,$F2,$34,$38
#_09A1AA: db $9A,$F9,$F2,$5C,$2A,$F2,$0B,$FC
#_09A1B2: db $FA,$2A,$52,$32,$26,$2F,$32,$4D
#_09A1BA: db $3A,$30,$37,$47,$CF,$3D,$58,$38
#_09A1C2: db $4D,$3A,$30,$37,$47,$F9,$F2,$56
#_09A1CA: db $3E,$CF,$AA,$27,$31,$52,$A6,$4F
#_09A1D2: db $27,$FC,$FF
DATA8_09A1D5:
#_09A1D5: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09A1DD: db $9A,$F9,$3C,$28,$CF,$F2,$62,$58
#_09A1E5: db $37,$CF,$30,$58,$37,$4D,$2A,$26
#_09A1ED: db $95,$F8,$1A,$FA,$30,$4B,$39,$26
#_09A1F5: db $3D,$2A,$26,$95,$F9,$A2,$55,$CF
#_09A1FD: db $29,$30,$28,$37,$48,$4D,$4A,$CF
#_09A205: db $5C,$02,$01,$01,$A6,$30,$39,$F8
#_09A20D: db $1B,$D4,$03,$30,$44,$58,$34,$4E
#_09A215: db $F9,$65,$6D,$65,$6D,$CF,$31,$52
#_09A21D: db $39,$4A,$FC,$FF
DATA8_09A221:
#_09A221: db $D4,$03,$35,$58,$CF,$68,$65,$37
#_09A229: db $48,$9C,$4D,$FC,$FF
DATA8_09A22E:
#_09A22E: db $D4,$03,$25,$58,$CF,$33,$27,$FC
#_09A236: db $FF
DATA8_09A237:
#_09A237: db $D9,$64,$00,$00,$19,$DA,$9C,$FF
#_09A23F: db $FF,$D4,$03,$2E,$2E,$2A,$4B,$CF
#_09A247: db $7C,$71,$7C,$3A,$30,$43,$9C,$CF
#_09A24F: db $25,$58,$37,$F9,$26,$58,$37,$2B
#_09A257: db $34,$CF,$72,$8A,$B8,$8A,$3E,$CF
#_09A25F: db $2E,$27,$27,$52,$9C,$F9,$44,$3A
#_09A267: db $36,$2C,$4B,$30,$26,$4A,$FC,$FA
#_09A26F: db $A2,$AD,$52,$3D,$CF,$27,$52,$46
#_09A277: db $26,$51,$CF,$2A,$28,$4B,$4E,$4D
#_09A27F: db $9E,$4B,$26,$3D,$F9,$2E,$27,$27
#_09A287: db $52,$4B,$30,$26,$4A,$FC,$FA,$34
#_09A28F: db $A6,$CF,$2F,$26,$2B,$52,$CF,$30
#_09A297: db $43,$41,$CF,$50,$34,$4E,$4D,$CF
#_09A29F: db $3E,$30,$3D,$43,$28,$3A,$F9,$5D
#_09A2A7: db $64,$7B,$9C,$CF,$26,$31,$50,$58
#_09A2AF: db $37,$4D,$52,$A6,$F9,$AA,$27,$47
#_09A2B7: db $CF,$25,$26,$36,$3E,$CF,$30,$57
#_09A2BF: db $27,$2B,$51,$CF,$27,$30,$39,$58
#_09A2C7: db $37,$4D,$F9,$44,$34,$26,$39,$52
#_09A2CF: db $A6,$FC,$FF
DATA8_09A2D2:
#_09A2D2: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09A2DA: db $9A,$F9,$F2,$62,$3A,$CF,$26,$2B
#_09A2E2: db $34,$26,$52,$A6,$F9,$A9,$47,$CF
#_09A2EA: db $26,$4C,$9E,$35,$3A,$CF,$A9,$58
#_09A2F2: db $2D,$28,$5E,$73,$3D,$CF,$AB,$2D
#_09A2FA: db $47,$52,$9C,$F9,$26,$4D,$52,$A6
#_09A302: db $39,$5A,$CF,$2E,$4E,$9C,$FC,$FF
DATA8_09A30A:
#_09A30A: db $D6,$00,$89,$70,$28,$4F,$27,$A2
#_09A312: db $52,$9A,$F9,$D2,$7A,$1E,$5F,$60
#_09A31A: db $75,$3D,$CF,$35,$2A,$70,$8A,$74
#_09A322: db $85,$3D,$CF,$29,$2C,$3A,$3E,$F9
#_09A32A: db $2A,$26,$A2,$56,$27,$CF,$83,$C3
#_09A332: db $8A,$9C,$CF,$31,$44,$36,$26,$37
#_09A33A: db $4D,$A5,$FC,$FA,$F2,$34,$3D,$48
#_09A342: db $36,$4B,$CF,$4A,$2C,$CF,$41,$26
#_09A34A: db $2B,$A2,$55,$39,$FC,$FF
DATA8_09A350:
#_09A350: db $28,$58,$CF,$35,$2A,$3A,$26,$34
#_09A358: db $CF,$83,$C3,$8A,$51,$CF,$34,$29
#_09A360: db $30,$34,$58,$37,$94,$95,$FC,$FA
#_09A368: db $33,$4C,$55,$CF,$31,$A0,$26,$F2
#_09A370: db $0B,$F2,$0B,$F9,$26,$48,$CF,$30
#_09A378: db $52,$A2,$4B,$4E,$52,$3D,$5A,$FC
#_09A380: db $FF
DATA8_09A381:
#_09A381: db $D2,$D1,$22,$D6,$00,$2F,$70,$28
#_09A389: db $39,$A5,$3D,$29,$38,$2E,$9A,$F9
#_09A391: db $2B,$44,$9C,$CF,$F0,$2C,$52,$A6
#_09A399: db $3C,$F9,$50,$34,$30,$3E,$CF,$F2
#_09A3A1: db $6C,$F2,$0B,$FC,$FA,$85,$5E,$38
#_09A3A9: db $CF,$4A,$52,$A9,$2C,$4E,$34,$43
#_09A3B1: db $28,$FC,$E9,$00,$21,$FA,$2B,$57
#_09A3B9: db $27,$3E,$CF,$2B,$44,$3A,$CF,$A4
#_09A3C1: db $3F,$CF,$25,$26,$34,$26,$38,$26
#_09A3C9: db $27,$F9,$3F,$38,$51,$CF,$36,$4E
#_09A3D1: db $37,$2B,$34,$F9,$2B,$44,$47,$CF
#_09A3D9: db $4A,$2C,$30,$58,$37,$26,$4D,$CF
#_09A3E1: db $3F,$38,$A6,$FC,$2F,$25,$CF,$2B
#_09A3E9: db $39,$2F,$26,$F2,$0B,$FC,$D4,$03
#_09A3F1: db $D6,$00,$00,$FE,$07,$3C,$D6,$00
#_09A3F9: db $2C,$70,$28,$49,$4C,$2E,$9A,$F9
#_09A401: db $F0,$F2,$0B,$50,$34,$30,$CF,$47
#_09A409: db $27,$26,$35,$AA,$F9,$25,$39,$34
#_09A411: db $3A,$CF,$25,$26,$34,$2A,$58,$34
#_09A419: db $3D,$4A,$FC,$FA,$42,$52,$38,$27
#_09A421: db $3E,$CF,$50,$34,$30,$9C,$CF,$25
#_09A429: db $39,$34,$3D,$CF,$C9,$5A,$70,$71
#_09A431: db $5A,$3A,$F9,$39,$4D,$3E,$A3,$A6
#_09A439: db $58,$34,$3D,$4A,$F9,$A9,$47,$CF
#_09A441: db $25,$39,$34,$3E,$CF,$33,$3D,$29
#_09A449: db $52,$39,$CF,$ED,$51,$F9,$28,$4B
#_09A451: db $52,$A6,$F2,$0B,$26,$28,$CF,$28
#_09A459: db $4B,$AB,$2F,$4E,$34,$38,$F9,$26
#_09A461: db $58,$34,$42,$27,$9C,$CF,$26,$26
#_09A469: db $50,$FC,$FA,$50,$34,$30,$3E,$CF
#_09A471: db $33,$3D,$29,$52,$39,$2A,$4B,$F9
#_09A479: db $25,$39,$34,$51,$CF,$3F,$2B,$3E
#_09A481: db $39,$33,$27,$38,$30,$34,$F2,$0B
#_09A489: db $F9,$A9,$47,$CF,$A6,$46,$A6,$58
#_09A491: db $34,$F2,$0B,$F9,$50,$34,$30,$3D
#_09A499: db $47,$3D,$3A,$CF,$39,$4B,$39,$26
#_09A4A1: db $CF,$25,$39,$34,$39,$4B,$F9,$26
#_09A4A9: db $39,$26,$42,$27,$9C,$CF,$43,$30
#_09A4B1: db $4A,$94,$FC,$FA,$FE,$46,$0B,$FE
#_09A4B9: db $07,$06,$D6,$00,$9D,$78,$38,$FE
#_09A4C1: db $07,$19,$D6,$00,$00,$DE,$01,$00
#_09A4C9: db $1D,$01,$D4,$03,$E4,$00,$84,$84
#_09A4D1: db $69,$9A,$F9,$25,$39,$34,$3D,$CF
#_09A4D9: db $26,$3D,$35,$CF,$50,$34,$30,$3D
#_09A4E1: db $CF,$2E,$3D,$37,$A9,$F9,$27,$AB
#_09A4E9: db $58,$37,$48,$4D,$94,$D5,$11,$FE
#_09A4F1: db $1C,$03,$D5,$2D,$FE,$0B,$00,$19
#_09A4F9: db $FC
DATA8_09A4FA:
#_09A4FA: db $FA,$84,$84,$69,$9A,$F9,$25,$25
#_09A502: db $CF,$A6,$46,$F2,$0B,$F9,$48,$58
#_09A50A: db $B0,$4C,$CF,$25,$39,$34,$38,$3E
#_09A512: db $CF,$34,$34,$2A,$28,$39,$26,$FC
#_09A51A: db $E7,$00,$FE,$07,$06,$D6,$00,$9D
#_09A522: db $78,$38,$FE,$07,$19,$D6,$00,$2C
#_09A52A: db $70,$28,$FE,$46,$09,$FE,$07,$06
#_09A532: db $D6,$00,$2C,$70,$28,$FA,$49,$4C
#_09A53A: db $2E,$9A,$F9,$2F,$4A,$27,$39,$4B
#_09A542: db $CF,$F0,$F2,$0B,$FC,$D6,$00,$00
#_09A54A: db $FE,$07,$78,$D6,$00,$2F,$70,$28
#_09A552: db $FA,$FE,$2D,$03,$F2,$6C,$9A,$F9
#_09A55A: db $29,$48,$29,$48,$CF,$43,$2F,$2A
#_09A562: db $CF,$2E,$52,$39,$2E,$38,$3A,$39
#_09A56A: db $4D,$38,$3E,$3C,$F9,$50,$4D,$2C
#_09A572: db $CF,$29,$47,$50,$52,$A9,$CF,$2C
#_09A57A: db $4E,$34,$43,$28,$FC,$D6,$00,$00
#_09A582: db $D0,$D1,$FF
DATA8_09A585:
#_09A585: db $FA,$3F,$AA,$26,$CF,$A2,$57,$27
#_09A58D: db $34,$26,$A6,$39,$F9,$3E,$48,$2C
#_09A595: db $CF,$37,$25,$37,$30,$34,$42,$27
#_09A59D: db $9C,$CF,$26,$26,$F9,$33,$27,$30
#_09A5A5: db $34,$4B,$CF,$2E,$2E,$41,$CF,$2B
#_09A5AD: db $34,$43,$28,$FC,$FF
DATA8_09A5B2:
#_09A5B2: db $D6,$00,$B2,$70,$38,$2E,$AA,$47
#_09A5BA: db $9A,$F9,$85,$5E,$39,$52,$38,$2A
#_09A5C2: db $58,$37,$26,$27,$CF,$41,$52,$39
#_09A5CA: db $29,$48,$A2,$9C,$F9,$25,$52,$34
#_09A5D2: db $34,$35,$3A,$CF,$4A,$4F,$30,$2C
#_09A5DA: db $CF,$58,$37,$CF,$26,$58,$37,$34
#_09A5E2: db $A4,$FC,$FF
DATA8_09A5E5:
#_09A5E5: db $D6,$00,$0C,$70,$38,$F2,$6D,$9A
#_09A5ED: db $F9,$D2,$35,$2D,$71,$8A,$BF,$CF
#_09A5F5: db $61,$7B,$60,$94,$95,$F9,$61,$86
#_09A5FD: db $75,$CF,$BB,$8F,$7B,$69,$85,$CF
#_09A605: db $80,$6E,$CF,$66,$87,$69,$94,$FC
#_09A60D: db $D6,$00,$00,$FE,$07,$78,$DE,$00
#_09A615: db $00,$EC,$08,$D5,$39,$E4,$00,$E5
#_09A61D: db $01,$25
DATA8_09A61F:
#_09A61F: db $E5,$00,$25,$D3,$24
DATA8_09A624:
#_09A624: db $E7,$00,$DE,$00,$00,$E6,$08,$D5
#_09A62C: db $39,$E4,$00,$E5,$01,$27
DATA8_09A632:
#_09A632: db $E5,$00,$27,$D3,$26
DATA8_09A637:
#_09A637: db $E7,$00,$DE,$00,$00,$E5,$04,$EB
#_09A63F: db $00,$00,$DE,$04,$D5,$39,$E4,$00
#_09A647: db $E4,$01,$E5,$81,$29
DATA8_09A64C:
#_09A64C: db $E5,$80,$29,$D3,$28
DATA8_09A651:
#_09A651: db $E7,$00,$E7,$01,$FE,$07,$78,$D6
#_09A659: db $00,$0C,$70,$38,$F2,$0B,$6C,$CF
#_09A661: db $6C,$75,$7D,$CF,$5E,$75,$6D,$CF
#_09A669: db $6C,$69,$65,$6F,$F9,$66,$86,$CF
#_09A671: db $80,$85,$CF,$6C,$69,$65,$6F,$64
#_09A679: db $86,$FC,$D0,$35,$FA,$97,$F2,$6D
#_09A681: db $3E,$F9,$E1,$F5,$F3,$51,$CF,$2F
#_09A689: db $30,$A6,$30,$34,$FC,$FA,$D3,$2B
DATA8_09A691:
#_09A691: db $FA,$97
DATA8_09A693:
#_09A693: db $F1,$3E,$CF,$F3,$51,$F9,$FE,$3C
#_09A69B: db $2C,$F2,$2D,$FC,$FE,$28,$D0,$1F
#_09A6A3: db $FF
DATA8_09A6A4:
#_09A6A4: db $F2,$72,$FC,$FF
DATA8_09A6A8:
#_09A6A8: db $E1,$F5,$D2,$1F,$2E,$F3,$CF,$6B
#_09A6B0: db $66,$72,$CF,$5D,$85,$CF,$7F,$92
#_09A6B8: db $6F,$5E,$65,$FC,$D6,$00,$00,$D3
#_09A6C0: db $2A
DATA8_09A6C1:
#_09A6C1: db $7B,$6C,$CF,$F3,$CF,$67,$B5,$68
#_09A6C9: db $6F,$85,$F9,$7F,$5F,$80,$83,$71
#_09A6D1: db $5E,$FC,$FF
DATA8_09A6D4:
#_09A6D4: db $D6,$00,$6B,$60,$28,$D2,$0C,$31
#_09A6DC: db $D2,$7F,$30,$D3,$34
DATA8_09A6E1:
#_09A6E1: db $97,$F2,$68,$F8,$32,$FF
DATA8_09A6E7:
#_09A6E7: db $97,$F2,$89,$F8,$32,$FF
DATA8_09A6ED:
#_09A6ED: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09A6F5: db $D6,$00,$00,$D2,$0C,$33,$FE,$1A
#_09A6FD: db $7C,$14,$10,$00,$00,$00,$D0,$0C
#_09A705: db $FF
DATA8_09A706:
#_09A706: db $FE,$1A,$7C,$96,$10,$00,$00,$00
#_09A70E: db $D1,$0C,$FF
DATA8_09A711:
#_09A711: db $97,$F2,$69,$FC,$FF
DATA8_09A716:
#_09A716: db $D2,$5A,$05,$D5,$54,$D6,$00,$BC
#_09A71E: db $78,$38,$D2,$59,$04,$29,$52,$39
#_09A726: db $3D,$2E,$9A,$F9,$50,$34,$30,$CF
#_09A72E: db $5D,$84,$69,$F9,$3C,$28,$CF,$3C
#_09A736: db $28,$CF,$29,$3A,$26,$35,$55,$52
#_09A73E: db $34,$35,$CF,$AA,$2E,$2A,$4B,$2B
#_09A746: db $34,$3D,$95,$FC,$D2,$47,$02,$E9
#_09A74E: db $03,$01,$FA,$EF,$9A,$F9,$39,$3A
#_09A756: db $CF,$BB,$87,$BB,$87,$44,$37,$52
#_09A75E: db $A6,$4A,$CF,$2E,$3D,$B5,$63,$94
#_09A766: db $FC,$FA,$5D,$84,$69,$9A,$F9,$48
#_09A76E: db $5A,$52,$CF,$79,$8A,$39,$CF,$29
#_09A776: db $3A,$26,$35,$55,$52,$CF,$29,$2E
#_09A77E: db $58,$34,$5A,$94,$FC,$D3,$06
DATA8_09A785:
#_09A785: db $FA,$25,$5A,$58,$CF,$79,$8A,$39
#_09A78D: db $CF,$29,$3A,$26,$35,$55,$52,$CF
#_09A795: db $2C,$4D,$30,$33,$27,$F9,$3E,$48
#_09A79D: db $2C,$CF,$37,$25,$37,$30,$37,$25
#_09A7A5: db $9F,$39,$26,$38,$CF,$34,$26,$41
#_09A7AD: db $52,$A6,$4A,$5A,$FC,$D3,$06
DATA8_09A7B4:
#_09A7B4: db $D2,$52,$03,$D3,$06
DATA8_09A7B9:
#_09A7B9: db $FA,$3C,$28,$3C,$28,$CF,$F0,$29
#_09A7C1: db $3A,$26,$35,$55,$52,$3E,$F9,$2E
#_09A7C9: db $3D,$43,$35,$CF,$2B,$3A,$26,$58
#_09A7D1: db $34,$5A,$95,$FC,$50,$34,$30,$CF
#_09A7D9: db $29,$38,$47,$A6,$35,$9C,$CF,$42
#_09A7E1: db $30,$26,$3D,$F9,$F0,$29,$3A,$26
#_09A7E9: db $35,$55,$52,$F9,$50,$34,$30,$3D
#_09A7F1: db $CF,$29,$38,$47,$A6,$35,$3A,$CF
#_09A7F9: db $39,$58,$37,$F9,$3C,$58,$94,$CF
#_09A801: db $26,$26,$A9,$30,$57,$94,$94,$FC
#_09A809: db $FA,$2E,$3D,$43,$35,$3E,$3C,$5A
#_09A811: db $CF,$F2,$52,$38,$CF,$F2,$53,$9C
#_09A819: db $F9,$50,$34,$30,$3A,$CF,$36,$2C
#_09A821: db $58,$37,$2C,$4E,$34,$3D,$5A,$FC
#_09A829: db $FA,$25,$58,$CF,$33,$27,$A6,$F9
#_09A831: db $3C,$28,$3C,$28,$CF,$F2,$52,$3A
#_09A839: db $CF,$25,$58,$37,$4A,$5A,$F9,$50
#_09A841: db $34,$30,$9C,$CF,$34,$3D,$52,$A9
#_09A849: db $25,$9F,$4D,$5A,$FC,$D0,$59,$D3
#_09A851: db $06
DATA8_09A852:
#_09A852: db $FA,$5D,$84,$69,$9A,$F9,$3C,$28
#_09A85A: db $3C,$28,$CF,$F2,$52,$3A,$CF,$25
#_09A862: db $58,$37,$4A,$5A,$F9,$5D,$84,$69
#_09A86A: db $3D,$CF,$38,$47,$A6,$35,$30,$2A
#_09A872: db $CF,$25,$28,$39,$26,$52,$A6,$4A
#_09A87A: db $5A,$FC,$D3,$06
DATA8_09A87E:
#_09A87E: db $FA,$97,$29,$52,$39,$3D,$2E,$3E
#_09A886: db $CF,$47,$27,$26,$39,$26,$F2,$0B
#_09A88E: db $FC,$FF
DATA8_09A890:
#_09A890: db $D6,$00,$00,$FF
DATA8_09A894:
#_09A894: db $D2,$57,$13,$D2,$56,$0E,$D6,$00
#_09A89C: db $67,$70,$28,$3F,$30,$57,$9A,$F9
#_09A8A4: db $D2,$0C,$0C,$E9,$02,$08,$D2,$2C
#_09A8AC: db $0A,$D2,$59,$09,$D3,$08
DATA8_09A8B2:
#_09A8B2: db $F2,$50,$2F,$43,$3E,$F9,$34,$A6
#_09A8BA: db $26,$43,$CF,$9C,$26,$30,$56,$36
#_09A8C2: db $30,$37,$29,$4C,$43,$31,$FC,$FF
DATA8_09A8CA:
#_09A8CA: db $29,$A2,$57,$27,$2F,$43,$CF,$33
#_09A8D2: db $4E,$3E,$CF,$2E,$43,$4C,$43,$31
#_09A8DA: db $FC,$D6,$00,$00,$FA,$DF,$DF,$DF
#_09A8E2: db $D6,$00,$BC,$78,$38,$5D,$84,$69
#_09A8EA: db $9A,$F9,$25,$58,$CF,$2B,$34,$2B
#_09A8F2: db $34,$F9,$26,$43,$CF,$3F,$30,$57
#_09A8FA: db $3A,$CF,$29,$3C,$9C,$26,$30,$37
#_09A902: db $4D,$38,$2E,$4F,$5A,$FC,$D6,$00
#_09A90A: db $00,$FA,$DF,$DF,$DF,$D6,$00,$67
#_09A912: db $70,$28,$3F,$30,$57,$9A,$F9,$29
#_09A91A: db $A2,$57,$27,$2F,$43,$CF,$47,$27
#_09A922: db $30,$50,$2D,$25,$4C,$43,$32,$52
#_09A92A: db $F9,$A6,$4E,$47,$CF,$38,$29,$31
#_09A932: db $39,$38,$CF,$26,$50,$4E,$37,$29
#_09A93A: db $4C,$43,$31,$3D,$A9,$FC,$FA,$5D
#_09A942: db $84,$69,$9A,$F9,$25,$34,$30,$3D
#_09A94A: db $26,$27,$2E,$38,$CF,$2B,$2D,$39
#_09A952: db $26,$3D,$94,$F9,$48,$A6,$48,$A6
#_09A95A: db $CF,$48,$A6,$48,$A6,$CF,$48,$A6
#_09A962: db $48,$A6,$94,$FC,$FA,$3F,$30,$57
#_09A96A: db $9A,$F9,$2E,$43,$4C,$43,$30,$34
#_09A972: db $3C,$F2,$0B,$F2,$0B,$F9,$A9,$3E
#_09A97A: db $CF,$30,$AB,$4B,$2C,$29,$43,$35
#_09A982: db $2C,$A6,$2F,$26,$FC,$D6,$00,$00
#_09A98A: db $FE,$07,$3C,$D6,$00,$67,$70,$28
#_09A992: db $FA,$F2,$50,$2F,$43,$3E,$F9,$F2
#_09A99A: db $03,$3A,$CF,$25,$50,$4E,$4D,$33
#_09A9A2: db $27,$A9,$31,$F9,$2F,$25,$CF,$29
#_09A9AA: db $2C,$41,$CF,$AA,$27,$A5,$FC,$FA
#_09A9B2: db $D6,$00,$00,$DF,$DF,$DF,$D6,$00
#_09A9BA: db $BC,$78,$38,$5D,$84,$69,$9A,$F9
#_09A9C2: db $4A,$2A,$58,$34,$3C,$5A,$F9,$A2
#_09A9CA: db $55,$CF,$50,$34,$30,$CF,$2F,$2B
#_09A9D2: db $3A,$CF,$26,$58,$37,$4D,$3C,$5A
#_09A9DA: db $FC,$D6,$00,$00,$D0,$2C,$D3,$0B
DATA8_09A9E2:
#_09A9E2: db $AA,$27,$A5,$CF,$29,$38,$29,$4C
#_09A9EA: db $2C,$A6,$2F,$26,$FC
DATA8_09A9EF:
#_09A9EF: db $D0,$0C,$FE,$1A,$6A,$05,$04,$00
#_09A9F7: db $07,$13,$FF
DATA8_09A9FA:
#_09A9FA: db $29,$2A,$28,$4C,$A9,$31,$3C,$FC
DATA8_09AA02:
#_09AA02: db $D1,$0C,$FE,$1A,$6A,$87,$04,$00
#_09AA0A: db $07,$13,$FF
DATA8_09AA0D:
#_09AA0D: db $D2,$5C,$0F,$D3,$12
DATA8_09AA12:
#_09AA12: db $D2,$0C,$10,$D3,$11
DATA8_09AA17:
#_09AA17: db $97,$F1,$3E,$CF,$F2,$50,$3D,$F9
#_09AA1F: db $41,$48,$2A,$4B,$CF,$A9,$34,$FC
#_09AA27: db $D3,$0D
DATA8_09AA29:
#_09AA29: db $97,$F1,$3E,$CF,$F2,$50,$3D,$F9
#_09AA31: db $41,$48,$3A,$CF,$3E,$26,$58,$34
#_09AA39: db $FC,$D3,$0B
DATA8_09AA3C:
#_09AA3C: db $D5,$46,$D6,$00,$BE,$70,$18,$F2
#_09AA44: db $51,$9A,$F9,$2B,$44,$34,$35,$3E
#_09AA4C: db $CF,$AA,$27,$26,$27,$2E,$38,$51
#_09AA54: db $CF,$30,$34,$3D,$2A,$F9,$50,$2A
#_09AA5C: db $58,$37,$26,$4D,$3D,$A9,$31,$2A
#_09AA64: db $95,$FC,$FA,$3F,$38,$4C,$3D,$F2
#_09AA6C: db $00,$3D,$F9,$2F,$2F,$48,$2A,$39
#_09AA74: db $49,$46,$51,$CF,$40,$44,$3A,$A2
#_09AA7C: db $58,$34,$3D,$A9,$31,$4A,$FC,$FA
#_09AA84: db $C7,$84,$5D,$85,$47,$CF,$50,$34
#_09AA8C: db $30,$47,$CF,$34,$A6,$CF,$25,$3D
#_09AA94: db $2E,$3D,$28,$9C,$29,$51,$F9,$44
#_09AA9C: db $34,$2A,$58,$34,$A6,$2D,$39,$3D
#_09AAA4: db $A9,$31,$F9,$A6,$2A,$4B,$2E,$33
#_09AAAC: db $CF,$25,$3D,$2E,$3A,$CF,$28,$26
#_09AAB4: db $28,$52,$3D,$26,$3D,$35,$51,$F9
#_09AABC: db $25,$34,$28,$34,$38,$26,$27,$3D
#_09AAC4: db $3A,$F2,$0B,$FC,$D4,$03,$EE,$9A
#_09AACC: db $F9,$33,$3D,$34,$46,$3A,$CF,$29
#_09AAD4: db $29,$A4,$26,$3D,$3F,$38,$51,$CF
#_09AADC: db $2E,$4F,$30,$37,$F9,$34,$43,$30
#_09AAE4: db $26,$51,$CF,$38,$4C,$2E,$3A,$CF
#_09AAEC: db $30,$34,$3D,$2A,$94,$FC,$FA,$D6
#_09AAF4: db $00,$BE,$70,$18,$F2,$51,$9A,$F9
#_09AAFC: db $2A,$4E,$4B,$3E,$CF,$2E,$2E,$3A
#_09AB04: db $26,$4D,$2A,$9D,$4C,$CF,$28,$26
#_09AB0C: db $28,$52,$3A,$F9,$41,$26,$29,$52
#_09AB14: db $39,$CF,$3F,$AC,$51,$CF,$29,$2C
#_09AB1C: db $4E,$4D,$3D,$A9,$31,$4A,$FC,$28
#_09AB24: db $26,$28,$52,$3A,$F2,$0B,$FC,$FA
#_09AB2C: db $D5,$3C,$F2,$03,$3A,$47,$CF,$2F
#_09AB34: db $30,$25,$9F,$43,$30,$57,$27,$94
#_09AB3C: db $F9,$28,$26,$28,$52,$3A,$CF,$41
#_09AB44: db $26,$29,$52,$39,$CF,$3F,$AC,$51
#_09AB4C: db $94,$FC,$D4,$03,$EE,$9A,$F9,$25
#_09AB54: db $AD,$39,$26,$94,$CF,$2F,$9C,$58
#_09AB5C: db $37,$94,$FC,$F9,$D6,$00,$C0,$40
#_09AB64: db $18,$FE,$07,$18,$D6,$00,$00,$D6
#_09AB6C: db $01,$C1,$70,$18,$D6,$00,$C2,$84
#_09AB74: db $30,$FA,$F2,$51,$9A,$F9,$35,$58
#_09AB7C: db $CF,$3F,$38,$4C,$A6,$2D,$A9,$31
#_09AB84: db $2A,$DF,$DF,$DF,$CF,$43,$25,$CF
#_09AB8C: db $26,$26,$A9,$30,$57,$27,$F9,$EE
#_09AB94: db $3D,$34,$43,$30,$26,$3E,$CF,$26
#_09AB9C: db $34,$A6,$2B,$43,$30,$34,$4A,$FC
#_09ABA4: db $D6,$00,$00,$D6,$01,$00,$FE,$27
#_09ABAC: db $02,$D0,$5C,$D1,$FF,$FA,$D3,$10
DATA8_09ABB4:
#_09ABB4: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09ABBC: db $9A,$F9,$29,$58,$38,$CF,$2E,$2E
#_09ABC4: db $2A,$4B,$2F,$2B,$3E,$F9,$F2,$2B
#_09ABCC: db $FC,$FA,$F2,$50,$3D,$CF,$A1,$26
#_09ABD4: db $42,$27,$3E,$F9,$29,$4E,$34,$35
#_09ABDC: db $9C,$CF,$26,$34,$A6,$2C,$A4,$F9
#_09ABE4: db $26,$43,$CF,$39,$2A,$43,$9C,$CF
#_09ABEC: db $2F,$9C,$30,$37,$4D,$38,$2E,$4F
#_09ABF4: db $A6,$F9,$2F,$58,$2F,$38,$CF,$2A
#_09ABFC: db $28,$52,$39,$FC,$D3,$0D
DATA8_09AC02:
#_09AC02: db $E1,$B5,$D7,$29,$D2,$56,$27,$D2
#_09AC0A: db $68,$19,$D5,$54,$D2,$5A,$1A,$D6
#_09AC12: db $00,$C5,$70,$28,$F2,$50,$9A,$F9
#_09AC1A: db $5D,$84,$69,$9C,$CF,$25,$50,$32
#_09AC22: db $34,$26,$38,$CF,$26,$27,$3D,$3E
#_09AC2A: db $CF,$2B,$44,$34,$35,$2A,$FC,$FA
#_09AC32: db $25,$3D,$2E,$9C,$CF,$39,$3A,$40
#_09AC3A: db $A2,$49,$27,$39,$2C,$CF,$2C,$4B
#_09AC42: db $32,$4D,$4A,$27,$3A,$F9,$2E,$2E
#_09AC4A: db $3A,$CF,$43,$35,$51,$36,$2C,$4C
#_09AC52: db $F9,$25,$3D,$2E,$9C,$CF,$5D,$64
#_09AC5A: db $7B,$3A,$CF,$29,$33,$50,$4E,$39
#_09AC62: db $26,$4A,$27,$3A,$F9,$2D,$58,$2A
#_09AC6A: db $26,$51,$CF,$3E,$58,$37,$26,$4D
#_09AC72: db $3D,$A6,$FC,$FA,$50,$34,$30,$3E
#_09AC7A: db $CF,$25,$3D,$2E,$3D,$CF,$30,$25
#_09AC82: db $50,$32,$A6,$2D,$51,$F9,$3C,$9C
#_09AC8A: db $58,$37,$26,$4D,$FC,$FA,$50,$34
#_09AC92: db $30,$3E,$CF,$26,$33,$9C,$30,$26
#_09AC9A: db $3D,$A6,$F9,$2E,$4E,$A9,$CF,$30
#_09ACA2: db $36,$4E,$26,$31,$4D,$4A,$FC,$FA
#_09ACAA: db $D6,$00,$00,$FE,$07,$20,$D6,$00
#_09ACB2: db $BC,$78,$38,$5D,$84,$69,$9A,$F9
#_09ACBA: db $29,$A2,$2F,$52,$CF,$26,$33,$9C
#_09ACC2: db $30,$26,$2A,$4B,$3C,$5A,$F9,$2E
#_09ACCA: db $3D,$43,$35,$51,$CF,$36,$2C,$58
#_09ACD2: db $34,$3F,$38,$A6,$2A,$4B,$F9,$38
#_09ACDA: db $58,$37,$47,$CF,$28,$4B,$26,$52
#_09ACE2: db $A6,$4A,$FC
DATA8_09ACE5:
#_09ACE5: db $D4,$03,$3C,$28,$3C,$28,$CF,$50
#_09ACED: db $34,$30,$3D,$29,$3C,$9C,$26,$CF
#_09ACF5: db $2B,$26,$37,$2C,$4E,$4D,$95,$F9
DATA8_09ACFD:
#_09ACFD: db $50,$34,$30,$3C,$5A,$CF,$F3,$9C
#_09AD05: db $CF,$42,$30,$26,$3D,$5A,$F9,$3C
#_09AD0D: db $5A,$3C,$5A,$CF,$F3,$2A,$58,$37
#_09AD15: db $F8,$17,$D4,$03,$2A,$58,$37,$2C
#_09AD1D: db $4E,$39,$26,$38,$CF,$F2,$52,$3A
#_09AD25: db $F9,$26,$26,$36,$2D,$35,$55,$27
#_09AD2D: db $4A,$5A,$FC,$FA,$DD,$B5,$16,$25
#_09AD35: db $58,$CF,$47,$58,$37,$4D,$3D,$5A
#_09AD3D: db $F9,$35,$57,$27,$A6,$26,$CF,$35
#_09AD45: db $57,$27,$A6,$26,$FC,$FA,$D3,$1B
DATA8_09AD4D:
#_09AD4D: db $D4,$03,$50,$5A,$26,$94,$CF,$27
#_09AD55: db $4E,$30,$26,$5A,$94,$F9
DATA8_09AD5B:
#_09AD5B: db $3E,$48,$2C,$CF,$2A,$58,$37,$2B
#_09AD63: db $37,$3C,$5A,$FC,$D0,$5A,$FF
DATA8_09AD6A:
#_09AD6A: db $5D,$84,$69,$9A,$F9,$D3,$1D
DATA8_09AD71:
#_09AD71: db $D6,$00,$BC,$78,$38,$5D,$84,$69
#_09AD79: db $9A,$F9,$3C,$28,$3C,$28,$CF,$2A
#_09AD81: db $58,$37,$2B,$37,$2C,$4E,$34,$5A
#_09AD89: db $95,$FC,$DD,$B5,$18
DATA8_09AD8E:
#_09AD8E: db $48,$58,$34,$5A,$94,$CF,$25,$4C
#_09AD96: db $9C,$38,$5A,$94,$FC,$FE,$29,$FA
#_09AD9E: db $3C,$28,$3C,$28,$CF,$47,$3F,$38
#_09ADA6: db $36,$29,$3C,$9C,$26,$9C,$CF,$25
#_09ADAE: db $4D,$3D,$5A,$FC,$FA,$25,$3D,$3C
#_09ADB6: db $5A,$F2,$0B,$30,$52,$A9,$2C,$4E
#_09ADBE: db $4D,$95,$F8,$26
DATA8_09ADC2:
#_09ADC2: db $D4,$03,$50,$34,$30,$3D,$CF,$26
#_09ADCA: db $27,$2E,$38,$2B,$26,$37,$2C,$4E
#_09ADD2: db $39,$26,$52,$A6,$5A,$94,$F9,$FE
#_09ADDA: db $07,$20
DATA8_09ADDC:
#_09ADDC: db $D6,$00,$00,$D6,$00,$BD,$70,$48
#_09ADE4: db $5F,$8D,$5A,$8A,$94,$CF,$3F,$AA
#_09ADEC: db $26,$4A,$5A,$CF,$3F,$AA,$26,$4A
#_09ADF4: db $5A,$F9,$F2,$52,$CF,$2B,$26,$37
#_09ADFC: db $4A,$5A,$94,$F9,$29,$3A,$26,$35
#_09AE04: db $55,$52,$34,$35,$CF,$3F,$AA,$26
#_09AE0C: db $52,$A6,$4A,$5A,$94,$FC,$D4,$03
#_09AE14: db $F2,$50,$9A,$F9,$AA,$27,$30,$34
#_09AE1C: db $52,$A6,$CF,$5D,$84,$69,$95,$FC
#_09AE24: db $FA,$5D,$84,$69,$9A,$F9,$29,$3A
#_09AE2C: db $26,$35,$55,$52,$34,$35,$9C,$3C
#_09AE34: db $CF,$50,$34,$30,$9C,$3C,$F9,$30
#_09AE3C: db $52,$A9,$3C,$58,$37,$26,$58,$34
#_09AE44: db $3D,$3A,$3C,$CF,$30,$52,$A9,$2C
#_09AE4C: db $4E,$39,$26,$3D,$F9,$29,$3A,$26
#_09AE54: db $35,$55,$52,$38,$CF,$A3,$58,$38
#_09AE5C: db $26,$34,$26,$3D,$3A,$3C,$F9,$A6
#_09AE64: db $2A,$4B,$CF,$29,$3C,$9C,$26,$30
#_09AE6C: db $34,$3D,$3A,$5A,$94,$FC,$FA,$D6
#_09AE74: db $00,$00,$FE,$07,$20,$D6,$07,$C5
#_09AE7C: db $70,$28,$F2,$50,$9A,$F9,$33,$27
#_09AE84: db $2A,$CF,$33,$27,$2A,$CF,$4A,$30
#_09AE8C: db $4A,$30,$F9,$A2,$55,$25,$CF,$F2
#_09AE94: db $52,$9C,$F9,$5D,$84,$69,$3D,$3C
#_09AE9C: db $9C,$26,$51,$CF,$2A,$39,$28,$37
#_09AEA4: db $25,$9F,$4A,$27,$FC,$DE,$01,$00
#_09AEAC: db $09,$01,$F2,$7C,$D6,$07,$00,$D5
#_09AEB4: db $39,$E4,$00,$DD,$E1,$1E,$D3,$22
DATA8_09AEBC:
#_09AEBC: db $E5,$02,$1F,$E5,$00,$1F
DATA8_09AEC2:
#_09AEC2: db $FA,$E9,$02,$20,$EE,$9A,$F9,$F5
#_09AECA: db $3E,$CF,$BF,$7E,$5A,$BB,$51,$CF
#_09AED2: db $27,$2D,$37,$43,$32,$52,$4A,$94
#_09AEDA: db $FC
DATA8_09AEDB:
#_09AEDB: db $E5,$04,$21,$FA,$E9,$01,$21,$ED
#_09AEE3: db $9A,$F9,$43,$42,$27,$47,$CF,$2B
#_09AEEB: db $2B,$33,$27,$3A,$39,$26,$50,$CF
#_09AEF3: db $AA,$27,$31,$4E,$AB,$26,$26,$3D
#_09AEFB: db $94,$FC
DATA8_09AEFD:
#_09AEFD: db $D4,$03,$97,$F1,$3E,$CF,$3A,$9F
#_09AF05: db $A6,$30,$34,$F2,$0B,$F2,$0B,$FC
#_09AF0D: db $D0,$68,$FF
DATA8_09AF10:
#_09AF10: db $D4,$03,$E1,$E1,$F5,$9A,$F9,$2B
#_09AF18: db $CF,$2B,$2F,$43,$CF,$F3,$51,$CF
#_09AF20: db $47,$58,$37,$26,$4D,$3D,$2A,$94
#_09AF28: db $FC,$FE,$07,$3C,$E7,$00,$D6,$00
#_09AF30: db $9E,$78,$28,$FE,$07,$09,$D5,$FD
#_09AF38: db $FA,$97,$F5,$3E,$CF,$36,$AF,$3A
#_09AF40: db $CF,$40,$27,$26,$52,$2F,$4E,$34
#_09AF48: db $FC,$D6,$00,$BD,$70,$48,$FA,$5D
#_09AF50: db $84,$69,$9A,$F9,$2B,$55,$5A,$58
#_09AF58: db $94,$CF,$F2,$52,$9C,$5A,$58,$94
#_09AF60: db $F9,$60,$5A,$8A,$60,$5A,$8A,$DF
#_09AF68: db $60,$5A,$8A,$F2,$0B,$FC,$D6,$00
#_09AF70: db $00,$FA,$97,$29,$52,$39,$3D,$2E
#_09AF78: db $3E,$CF,$2B,$28,$2F,$58,$34,$FC
#_09AF80: db $D0,$56,$FE,$29,$E1,$FC,$FE,$28
#_09AF88: db $FA,$D6,$00,$98,$50,$18,$FE,$07
#_09AF90: db $10,$D6,$00,$2C,$70,$28,$FE,$46
#_09AF98: db $0B,$FE,$07,$06,$D6,$00,$2C,$70
#_09AFA0: db $28,$49,$4C,$2E,$9A,$F9,$F2,$1D
#_09AFA8: db $39,$2A,$39,$2A,$CF,$48,$4D,$A2
#_09AFB0: db $55,$39,$26,$F9,$E9,$0A,$25
DATA8_09AFB7:
#_09AFB7: db $34,$A6,$CF,$29,$52,$39,$3D,$2E
#_09AFBF: db $51,$CF,$39,$2A,$31,$3D,$3E,$CF
#_09AFC7: db $4A,$2C,$39,$26,$50,$3C,$FC,$FA
#_09AFCF: db $38,$2E,$4F,$A9,$CF,$C7,$84,$5D
#_09AFD7: db $85,$51,$CF,$40,$27,$26,$52,$30
#_09AFDF: db $34,$36,$AF,$F9,$50,$34,$30,$37
#_09AFE7: db $35,$57,$27,$A6,$26,$FC,$FA,$F2
#_09AFEF: db $03,$9C,$CF,$47,$58,$37,$37,$47
#_09AFF7: db $25,$AD,$39,$26,$50,$4A,$F9,$29
#_09AFFF: db $38,$39,$30,$2C,$CF,$50,$34,$30
#_09B007: db $39,$2F,$26,$FC,$FA,$E1,$FC,$97
#_09B00F: db $F3,$51,$CF,$50,$34,$30,$43,$31
#_09B017: db $2A,$95,$F8,$24,$D4,$03,$49,$4C
#_09B01F: db $2E,$9A,$F9,$2B,$2B,$50,$2D,$3D
#_09B027: db $CF,$39,$26,$3F,$38,$3C,$FC,$FA
#_09B02F: db $97,$49,$4C,$2E,$3E,$CF,$68,$C4
#_09B037: db $C6,$5A,$51,$CF,$38,$39,$28,$34
#_09B03F: db $FE,$1C,$03,$D5,$2D,$FE,$0D,$FF
#_09B047: db $0A,$FC
DATA8_09B049:
#_09B049: db $D4,$03,$49,$4C,$2E,$9A,$F9,$33
#_09B051: db $27,$CF,$29,$38,$39,$30,$2C,$CF
#_09B059: db $50,$34,$32,$AB,$26,$26,$3D,$4A
#_09B061: db $F9,$A2,$55,$CF,$26,$34,$A6,$26
#_09B069: db $37,$2C,$50,$3C,$FC,$FE,$29,$FE
#_09B071: db $46,$0B,$FE,$07,$06,$FE,$00,$00
#_09B079: db $D6,$00,$9E,$78,$40,$FE,$07,$09
#_09B081: db $D6,$00,$00,$FA,$97,$F3,$51,$CF
#_09B089: db $47,$58,$37,$F9,$49,$4C,$2E,$3E
#_09B091: db $CF,$2F,$58,$37,$26,$58,$34,$FC
#_09B099: db $D0,$5D,$FF
DATA8_09B09C:
#_09B09C: db $A9,$47,$CF,$3F,$AA,$2C,$37,$CF
#_09B0A4: db $44,$37,$4B,$4E,$39,$26,$50,$3C
#_09B0AC: db $F9,$FE,$07,$3C,$FE,$25,$FF,$FE
#_09B0B4: db $23,$FF,$2E,$4E,$A9,$CF,$A6,$26
#_09B0BC: db $A2,$57,$27,$AD,$3C,$F9,$D3,$23
DATA8_09B0C4:
#_09B0C4: db $D4,$03,$50,$5A,$26,$94,$CF,$27
#_09B0CC: db $4E,$30,$26,$5A,$94,$F9,$29,$3A
#_09B0D4: db $26,$35,$55,$52,$34,$35,$CF,$A3
#_09B0DC: db $58,$38,$CF,$26,$37,$2C,$4E,$4D
#_09B0E4: db $52,$A6,$5A,$94,$FC,$FA,$3E,$48
#_09B0EC: db $2C,$5A,$CF,$3E,$48,$2C,$30,$52
#_09B0F4: db $A9,$4A,$F9,$3C,$28,$3C,$28,$CF
#_09B0FC: db $3E,$48,$2C,$CF,$30,$52,$A9,$4A
#_09B104: db $CF,$3E,$48,$2C,$5A,$FC,$FA,$3C
#_09B10C: db $28,$CF,$30,$52,$A9,$2C,$4E,$39
#_09B114: db $26,$3D,$5A,$95,$FC,$D3,$1C,$FF
DATA8_09B11C:
#_09B11C: db $97,$F2,$2C,$FC,$FF
DATA8_09B121:
#_09B121: db $D7,$29,$D2,$57,$2E,$D5,$54,$D6
#_09B129: db $00,$BE,$70,$18,$F2,$51,$9A,$F9
#_09B131: db $D2,$56,$29,$AA,$27,$A9,$31,$CF
#_09B139: db $2E,$2E,$CF,$F2,$4C,$3D,$CF,$26
#_09B141: db $A0,$A0,$35,$3E,$95,$FC,$FA,$3F
#_09B149: db $38,$AC,$38,$3E,$CF,$44,$39,$CF
#_09B151: db $45,$2A,$30,$3D,$38,$29,$4C,$F9
#_09B159: db $34,$3D,$30,$2C,$CF,$2C,$4B,$30
#_09B161: db $37,$26,$43,$31,$4A,$FC,$FA,$50
#_09B169: db $34,$30,$47,$CF,$F2,$50,$47,$F9
#_09B171: db $3E,$A2,$46,$3E,$CF,$5D,$84,$69
#_09B179: db $CF,$3D,$CF,$34,$46,$3A,$F9,$2E
#_09B181: db $3D,$43,$35,$51,$CF,$40,$58,$2E
#_09B189: db $27,$30,$43,$30,$34,$9C,$F9,$42
#_09B191: db $2A,$3D,$3F,$38,$34,$35,$3A,$47
#_09B199: db $CF,$4A,$4F,$2E,$52,$A9,$47,$4B
#_09B1A1: db $58,$37,$26,$43,$31,$FC,$FF
DATA8_09B1A8:
#_09B1A8: db $29,$38,$47,$A6,$35,$51,$CF,$31
#_09B1B0: db $2C,$27,$34,$46,$3A,$CF,$2B,$34
#_09B1B8: db $3D,$A9,$31,$2A,$95,$FC,$F2,$03
#_09B1C0: db $3D,$CF,$42,$27,$2A,$4B,$CF,$48
#_09B1C8: db $58,$37,$2B,$37,$2C,$4E,$37,$F9
#_09B1D0: db $37,$43,$9C,$CF,$3E,$AD,$2D,$43
#_09B1D8: db $30,$34,$3C,$FC,$FA,$43,$34,$43
#_09B1E0: db $34,$CF,$26,$2B,$3D,$26,$26,$CF
#_09B1E8: db $34,$43,$30,$26,$9C,$F9,$37,$3A
#_09B1F0: db $CF,$3E,$26,$4D,$A5,$CF,$78,$8E
#_09B1F8: db $92,$7A,$92,$7A,$92,$7A,$92,$7A
#_09B200: db $F2,$0B,$FC,$DE,$01,$00,$0A,$01
#_09B208: db $FE,$46,$09,$FE,$07,$06,$D5,$39
#_09B210: db $D6,$00,$9D,$78,$38,$FE,$07,$13
#_09B218: db $E4,$00,$E5,$01,$2B
DATA8_09B21D:
#_09B21D: db $E5,$00,$2B,$D3,$2A
DATA8_09B222:
#_09B222: db $F5,$9A,$F9,$F2,$0B,$5D,$84,$69
#_09B22A: db $CF,$3D,$CF,$34,$46,$3A,$F2,$0B
#_09B232: db $F9,$43,$AF,$4F,$30,$3D,$CF,$43
#_09B23A: db $35,$51,$CF,$27,$36,$30,$A6,$30
#_09B242: db $F2,$0B,$F9,$30,$AC,$38,$51,$CF
#_09B24A: db $27,$A0,$2A,$30,$37,$CF,$A2,$56
#_09B252: db $27,$3A,$52,$38,$30,$F2,$0B,$F9
#_09B25A: db $29,$29,$2C,$3D,$CF,$32,$26,$34
#_09B262: db $26,$F2,$56,$51,$F9,$3F,$36,$4A
#_09B26A: db $27,$38,$CF,$30,$34,$3D,$A6,$F2
#_09B272: db $0B,$FC,$FA,$25,$26,$31,$4D,$47
#_09B27A: db $3D,$3D,$CF,$34,$46,$3A,$CF,$36
#_09B282: db $2C,$31,$3D,$9C,$F9,$39,$A4,$CF
#_09B28A: db $26,$2D,$39,$26,$3D,$A6,$F2,$0B
#_09B292: db $FC,$D0,$57,$D4,$03,$E7,$00,$FE
#_09B29A: db $07,$20,$D5,$45,$D6,$00,$1F,$70
#_09B2A2: db $28,$FE,$45,$00,$01,$EE,$9A,$F9
#_09B2AA: db $25,$4C,$9C,$38,$27,$CF,$F0,$2C
#_09B2B2: db $52,$F9,$29,$2A,$9F,$A9,$CF,$AF
#_09B2BA: db $2C,$3D,$CF,$34,$43,$30,$26,$3E
#_09B2C2: db $CF,$2A,$26,$42,$27,$2F,$4E,$43
#_09B2CA: db $30,$34,$F9,$25,$4C,$9C,$38,$27
#_09B2D2: db $F2,$0B,$FC,$FA,$2E,$4E,$A9,$CF
#_09B2DA: db $30,$A0,$3D,$32,$2A,$26,$41,$CF
#_09B2E2: db $26,$2D,$43,$31,$F2,$0B,$FC,$D2
#_09B2EA: db $8C,$2C,$D3,$2D
DATA8_09B2EE:
#_09B2EE: db $D2,$8B,$2D,$DE,$00,$00,$EE,$01
#_09B2F6: db $FA,$34,$A6,$CF,$F5,$3A,$CF,$39
#_09B2FE: db $58,$37,$30,$43,$58,$34,$F9,$ED
#_09B306: db $51,$CF,$34,$31,$2D,$4B,$4E,$39
#_09B30E: db $2A,$58,$34,$3D,$9C,$F9,$A1,$52
#_09B316: db $3C,$52,$A9,$31,$FC
DATA8_09B31B:
#_09B31B: db $FA,$47,$27,$CF,$33,$4F,$33,$4F
#_09B323: db $CF,$29,$50,$2A,$4E,$A9,$31,$F9
#_09B32B: db $2F,$4A,$27,$39,$4B,$F2,$0B,$FE
#_09B333: db $07,$60,$D6,$00,$00,$D6,$00,$17
#_09B33B: db $70,$38,$FE,$45,$00,$01,$FE,$07
#_09B343: db $3C,$D6,$00,$00,$D6,$00,$17,$70
#_09B34B: db $38,$FA,$2A,$44,$3D,$36,$2A,$26
#_09B353: db $9A,$F9,$2E,$3D,$47,$3D,$CF,$EE
#_09B35B: db $3E,$F9,$43,$2E,$38,$3A,$CF,$2D
#_09B363: db $52,$30,$52,$37,$2B,$39,$CF,$34
#_09B36B: db $43,$30,$26,$DF,$DF,$DF,$F9,$2A
#_09B373: db $44,$3D,$47,$38,$3A,$CF,$29,$2C
#_09B37B: db $4D,$3A,$CF,$40,$2F,$50,$30,$26
#_09B383: db $DF,$DF,$DF,$FC,$FA,$EE,$3D,$CF
#_09B38B: db $34,$43,$30,$26,$3E,$F9,$50,$34
#_09B393: db $30,$9C,$CF,$37,$52,$3A,$DF,$DF
#_09B39B: db $DF,$F9,$26,$A1,$39,$26,$43,$30
#_09B3A3: db $57,$27,$DF,$DF,$DF,$FC,$FE,$45
#_09B3AB: db $00,$01,$FE,$07,$3C,$D6,$00,$00
#_09B3B3: db $FE,$07,$3C,$FF
DATA8_09B3B7:
#_09B3B7: db $97,$F2,$2C,$FC,$FF
DATA8_09B3BC:
#_09B3BC: db $D7,$A4,$33,$D2,$8B,$36,$D5,$45
#_09B3C4: db $D6,$00,$4B,$78,$28,$DE,$00,$00
#_09B3CC: db $EE,$01,$97,$F2,$00,$9C,$CF,$38
#_09B3D4: db $A2,$2E,$46,$4B,$4E,$37,$26,$4D
#_09B3DC: db $FC,$D2,$8C,$30,$E9,$02,$30,$FA
#_09B3E4: db $EE,$9A,$F9,$25,$4E,$3E,$CF,$34
#_09B3EC: db $30,$2A,$3A,$CF,$ED,$A6,$94,$FC
#_09B3F4: db $26,$CF,$26,$2B,$37,$26,$34,$3D
#_09B3FC: db $2A,$F2,$0B,$FC,$FA,$F2,$0B,$39
#_09B404: db $A4,$CF,$45,$2A,$30,$38,$CF,$A4
#_09B40C: db $52,$A4,$52,$CF,$2A,$50,$4B,$39
#_09B414: db $26,$F9,$31,$9C,$34,$39,$52,$A6
#_09B41C: db $F2,$0B,$FC,$FA,$ED,$9A,$F9,$EE
#_09B424: db $F2,$0B,$CF,$EE,$39,$3D,$F9,$26
#_09B42C: db $2B,$37,$26,$34,$3D,$3C,$CF,$EE
#_09B434: db $FC,$FA,$EE,$9A,$F9,$ED,$94,$FC
DATA8_09B43C:
#_09B43C: db $FA,$ED,$9A,$F9,$D2,$58,$31,$2E
#_09B444: db $39,$26,$A9,$94,$FC,$44,$2A,$2D
#_09B44C: db $3E,$CF,$2A,$50,$4B,$39,$2C,$37
#_09B454: db $47,$CF,$26,$43,$3D,$CF,$25,$34
#_09B45C: db $30,$3E,$F2,$0B,$FE,$07,$24,$F9
#_09B464: db $2E,$3D,$43,$35,$3E,$CF,$F2,$50
#_09B46C: db $38,$CF,$F2,$51,$3D,$F9,$43,$42
#_09B474: db $27,$A9,$CF,$26,$2A,$2F,$4E,$37
#_09B47C: db $26,$4D,$CF,$30,$AC,$38,$3D,$43
#_09B484: db $35,$39,$3D,$F9,$25,$34,$30,$47
#_09B48C: db $CF,$F5,$3A,$CF,$2F,$4E,$37,$30
#_09B494: db $43,$58,$34,$50,$FC,$FA,$A9,$47
#_09B49C: db $CF,$25,$34,$30,$A6,$2D,$3E,$CF
#_09B4A4: db $3A,$52,$9F,$52,$A6,$58,$34,$CF
#_09B4AC: db $38,$2B,$3D,$2E,$38,$51,$F9,$50
#_09B4B4: db $31,$4E,$39,$2A,$58,$34,$3D,$F2
#_09B4BC: db $0B,$F9,$33,$3D,$34,$46,$3A,$CF
#_09B4C4: db $2E,$2E,$3A,$CF,$38,$A2,$2E,$46
#_09B4CC: db $4B,$4E,$37,$30,$43,$58,$34,$F9
#_09B4D4: db $F5,$A6,$2A,$4B,$CF,$30,$3B,$2E
#_09B4DC: db $38,$47,$A9,$2B,$A3,$3A,$F2,$0B
#_09B4E4: db $FC,$FA
DATA8_09B4E6:
#_09B4E6: db $E1,$BB,$F3,$F2,$0B,$FE,$07,$24
#_09B4EE: db $F3,$2F,$28,$25,$4E,$AB,$F9,$25
#_09B4F6: db $34,$30,$3E,$CF,$31,$2C,$50,$4E
#_09B4FE: db $4D,$FE,$07,$24,$F9,$29,$3C,$9C
#_09B506: db $26,$CF,$25,$34,$30,$51,$CF,$4B
#_09B50E: db $2C,$3A,$30,$37,$F2,$0B,$FC,$D0
#_09B516: db $8C,$DD,$BB,$32,$D3,$33
DATA8_09B51C:
#_09B51C: db $FF
DATA8_09B51D:
#_09B51D: db $FA,$97,$F3,$51,$CF,$ED,$3A,$F9
#_09B525: db $36,$2A,$26,$43,$31,$2A,$95,$F8
#_09B52D: db $34,$FF
DATA8_09B52F:
#_09B52F: db $E1,$BB,$FE,$29,$D4,$03,$ED,$9A
#_09B537: db $F9,$25,$58,$CF,$25,$25,$58,$CF
#_09B53F: db $2A,$CF,$2A,$4B,$A6,$9C,$53,$53
#_09B547: db $53,$F2,$0B,$FC,$FE,$45,$00,$01
#_09B54F: db $FE,$07,$20,$D6,$00,$4B,$78,$28
#_09B557: db $FE,$07,$10,$FE,$45,$00,$01,$FE
#_09B55F: db $07,$10,$D6,$00,$4B,$78,$28,$FE
#_09B567: db $07,$08,$FE,$45,$00,$01,$FE,$07
#_09B56F: db $08,$D6,$00,$4B,$78,$28,$FE,$07
#_09B577: db $02,$FE,$45,$00,$01,$FE,$07,$02
#_09B57F: db $D6,$00,$4B,$78,$28,$FE,$07,$02
#_09B587: db $FE,$45,$00,$01,$D6,$00,$4B,$78
#_09B58F: db $28,$FE,$45,$00,$01,$FA,$25,$4C
#_09B597: db $9C,$38,$27,$CF,$2E,$4E,$A9,$CF
#_09B59F: db $48,$58,$38,$CF,$30,$3C,$4D,$50
#_09B5A7: db $F9,$26,$43,$CF,$38,$58,$37,$47
#_09B5AF: db $CF,$48,$31,$4B,$2A,$39,$CF,$2B
#_09B5B7: db $AD,$52,$4A,$F2,$0B,$FC,$FA,$25
#_09B5BF: db $4C,$9C,$38,$27,$F2,$0B,$FC,$D6
#_09B5C7: db $00,$00,$D0,$8B,$FE,$02,$F0,$E9
#_09B5CF: db $02,$35,$FA,$EE,$9A,$F9,$ED,$F2
#_09B5D7: db $0B,$43,$34,$CF,$25,$28,$34,$3D
#_09B5DF: db $3A,$F2,$0B,$FC
DATA8_09B5E3:
#_09B5E3: db $FF
DATA8_09B5E4:
#_09B5E4: db $97,$F2,$2C,$FC,$FF
DATA8_09B5E9:
#_09B5E9: db $D2,$56,$38,$D6,$00,$37,$70,$28
#_09B5F1: db $29,$38,$2E,$9A,$F9,$2E,$3D,$43
#_09B5F9: db $35,$3E,$CF,$41,$26,$50,$A9,$26
#_09B601: db $26,$39,$25,$F9,$5D,$64,$7B,$3A
#_09B609: db $47,$CF,$29,$33,$50,$4E,$39,$26
#_09B611: db $FC,$FF
DATA8_09B613:
#_09B613: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09B61B: db $9A,$F9,$D2,$58,$39,$39,$52,$A6
#_09B623: db $4A,$CF,$F2,$4C,$3E,$F9,$26,$26
#_09B62B: db $38,$2E,$A6,$58,$37,$CF,$2B,$26
#_09B633: db $37,$2B,$34,$3D,$3A,$F9,$BE,$8A
#_09B63B: db $C5,$9C,$CF,$27,$4F,$27,$4F,$30
#_09B643: db $37,$4D,$CF,$A6,$2D,$A2,$55,$3C
#_09B64B: db $28,$2A,$FC,$FF
DATA8_09B64F:
#_09B64F: db $35,$2C,$30,$57,$27,$CF,$44,$52
#_09B657: db $39,$CF,$25,$38,$2A,$4B,$F9,$3D
#_09B65F: db $2E,$3D,$2E,$CF,$25,$36,$43,$58
#_09B667: db $37,$2B,$48,$9C,$58,$37,$FC,$FF
DATA8_09B66F:
#_09B66F: db $D2,$58,$3D,$D2,$56,$3B,$D6,$00
#_09B677: db $45,$78,$28,$D3,$3C
DATA8_09B67C:
#_09B67C: db $DE,$00,$00,$F1,$01,$E4,$00
DATA8_09B683:
#_09B683: db $29,$52,$39,$9A,$F9,$F2,$4C,$3E
#_09B68B: db $CF,$40,$34,$4C,$3D,$CF,$29,$38
#_09B693: db $2E,$9C,$CF,$30,$3E,$26,$30,$37
#_09B69B: db $4D,$3D,$F9,$F2,$50,$CF,$F2,$51
#_09B6A3: db $38,$2A,$F9,$39,$3D,$58,$37,$4D
#_09B6AB: db $50,$FC,$FA,$34,$A6,$3D,$CF,$87
#_09B6B3: db $84,$66,$8A,$29,$48,$A2,$3D,$CF
#_09B6BB: db $2C,$32,$30,$37,$F9,$39,$3A,$CF
#_09B6C3: db $2A,$58,$2E,$36,$2D,$37,$4D,$3D
#_09B6CB: db $2A,$30,$4B,$FC,$E7,$00,$FF
DATA8_09B6D2:
#_09B6D2: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09B6DA: db $9A,$F9,$F2,$4C,$58,$37,$CF,$C7
#_09B6E2: db $84,$5D,$85,$38,$CF,$74,$C5,$87
#_09B6EA: db $69,$9C,$F9,$30,$3E,$26,$30,$37
#_09B6F2: db $34,$3D,$3C,$FC,$FF
DATA8_09B6F7:
#_09B6F7: db $D2,$58,$41,$D2,$56,$3F,$D6,$00
#_09B6FF: db $29,$70,$28,$D3,$40
DATA8_09B704:
#_09B704: db $DE,$00,$00,$F2,$01,$E4,$00
DATA8_09B70B:
#_09B70B: db $29,$38,$2E,$9A,$F9,$25,$2A,$26
#_09B713: db $29,$58,$2F,$52,$38,$CF,$2C,$4F
#_09B71B: db $26,$29,$58,$2F,$52,$9C,$F9,$F2
#_09B723: db $4C,$3D,$CF,$43,$50,$4C,$3A,$CF
#_09B72B: db $2D,$58,$2A,$26,$51,$3E,$58,$37
#_09B733: db $52,$A6,$FC,$FA,$5D,$64,$7B,$3E
#_09B73B: db $CF,$3E,$26,$58,$37,$2E,$4E,$3C
#_09B743: db $28,$52,$A6,$4A,$FC,$E7,$00,$FF
DATA8_09B74B:
#_09B74B: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09B753: db $9A,$F9,$28,$4B,$26,$CF,$5D,$64
#_09B75B: db $7B,$9C,$CF,$30,$3E,$26,$30,$37
#_09B763: db $34,$2A,$4B,$F9,$30,$34,$58,$B0
#_09B76B: db $3D,$CF,$5D,$64,$7B,$3E,$CF,$4A
#_09B773: db $58,$37,$2E,$39,$2A,$58,$34,$52
#_09B77B: db $A6,$39,$FC,$FF
DATA8_09B77F:
#_09B77F: db $D2,$58,$45,$D2,$56,$43,$D6,$00
#_09B787: db $4A,$78,$28,$D3,$44
DATA8_09B78C:
#_09B78C: db $DE,$00,$00,$F2,$01,$E4,$00
DATA8_09B793:
#_09B793: db $29,$38,$2E,$9A,$F9,$2E,$3D,$43
#_09B79B: db $35,$3D,$CF,$AA,$2E,$2A,$3A,$CF
#_09B7A3: db $F2,$50,$38,$F9,$F2,$51,$9C,$CF
#_09B7AB: db $34,$26,$32,$36,$3A,$30,$37,$26
#_09B7B3: db $4D,$F9,$36,$AF,$9C,$25,$4D,$58
#_09B7BB: db $37,$CF,$A6,$4E,$2A,$9C,$26,$58
#_09B7C3: db $37,$34,$FC,$E7,$00,$FF
DATA8_09B7C9:
#_09B7C9: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09B7D1: db $9A,$F9,$F2,$4C,$3D,$43,$35,$3E
#_09B7D9: db $CF,$5D,$64,$7B,$3D,$CF,$37,$2A
#_09B7E1: db $4B,$F9,$31,$2C,$50,$4E,$43,$30
#_09B7E9: db $34,$FC,$FA,$2F,$58,$33,$2C,$CF
#_09B7F1: db $2E,$2E,$3A,$CF,$F2,$33,$2A,$26
#_09B7F9: db $51,$F9,$36,$2C,$4F,$27,$38,$CF
#_09B801: db $29,$47,$26,$43,$31,$FC,$FF
DATA8_09B808:
#_09B808: db $D2,$58,$49,$D2,$56,$47,$D6,$00
#_09B810: db $44,$78,$28,$D3,$48
DATA8_09B815:
#_09B815: db $DE,$00,$00,$F1,$01,$E4,$00
DATA8_09B81C:
#_09B81C: db $29,$52,$39,$9A,$F9,$2E,$2E,$3D
#_09B824: db $CF,$29,$2C,$3A,$CF,$29,$52,$39
#_09B82C: db $3D,$2E,$9C,$CF,$38,$A2,$2E,$46
#_09B834: db $4B,$4E,$37,$4D,$50,$F9,$39,$43
#_09B83C: db $28,$3E,$F2,$0B,$ED,$58,$37,$CF
#_09B844: db $26,$58,$34,$2A,$39,$95,$FC,$FA
#_09B84C: db $5D,$64,$7B,$3A,$CF,$38,$4C,$36
#_09B854: db $2A,$4E,$35,$55,$58,$37,$3C,$F9
#_09B85C: db $25,$AB,$4E,$43,$50,$4D,$3D,$4A
#_09B864: db $CF,$A6,$2A,$4B,$CF,$38,$A2,$2E
#_09B86C: db $46,$37,$4D,$3D,$FC,$FA,$2A,$50
#_09B874: db $26,$33,$27,$A6,$2D,$AA,$CF,$30
#_09B87C: db $2A,$34,$39,$26,$50,$FC,$E7,$00
#_09B884: db $FF
DATA8_09B885:
#_09B885: db $D6,$00,$8A,$70,$28,$F2,$34,$38
#_09B88D: db $9A,$F9,$3F,$4F,$2C,$37,$26,$26
#_09B895: db $50,$25,$CF,$2E,$2E,$F9,$F2,$34
#_09B89D: db $30,$52,$A9,$52,$51,$CF,$36,$2C
#_09B8A5: db $4D,$3D,$3A,$F9,$35,$57,$27,$AA
#_09B8AD: db $26,$26,$50,$FC,$FF
DATA8_09B8B2:
#_09B8B2: db $D2,$58,$4E,$D2,$56,$4C,$D6,$00
#_09B8BA: db $6A,$70,$28
DATA8_09B8BD:
#_09B8BD: db $29,$38,$2E,$9A,$F9,$43,$26,$3A
#_09B8C5: db $35,$CF,$34,$3D,$30,$2C,$58,$37
#_09B8CD: db $94,$F9,$2E,$2E,$3E,$CF,$37,$52
#_09B8D5: db $A0,$2C,$A6,$A4,$FC,$E7,$00,$FF
DATA8_09B8DD:
#_09B8DD: db $D2,$57,$4D,$D6,$00,$2E,$70,$28
#_09B8E5: db $FE,$07,$48,$EE,$9A,$F9,$F0,$2C
#_09B8ED: db $52,$F9,$3F,$2F,$30,$AD,$4C,$A6
#_09B8F5: db $3C,$CF,$9F,$52,$2B,$2A,$26,$95
#_09B8FD: db $FC,$FF
DATA8_09B8FF:
#_09B8FF: db $DE,$00,$00,$F2,$01,$E4,$00,$D3
#_09B907: db $4B
DATA8_09B908:
#_09B908: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09B910: db $9A,$F9,$29,$2C,$3D,$42,$27,$3A
#_09B918: db $CF,$F2,$2C,$3D,$3A,$F9,$2E,$28
#_09B920: db $A6,$2D,$9C,$CF,$2B,$2E,$28,$4D
#_09B928: db $CF,$41,$48,$9C,$CF,$25,$4D,$52
#_09B930: db $A6,$FC,$FA,$2B,$58,$38,$CF,$74
#_09B938: db $C5,$87,$69,$48,$CF,$C7,$84,$5D
#_09B940: db $85,$3A,$F9,$2E,$4F,$2F,$4E,$34
#_09B948: db $48,$36,$3D,$CF,$49,$27,$4E,$26
#_09B950: db $3A,$CF,$35,$9C,$26,$39,$26,$F9
#_09B958: db $29,$29,$CF,$2E,$50,$FC,$FF
DATA8_09B95F:
#_09B95F: db $D2,$58,$52,$D2,$56,$50,$D6,$00
#_09B967: db $46,$78,$28,$D3,$51
DATA8_09B96C:
#_09B96C: db $DE,$00,$00,$F1,$01,$E4,$00
DATA8_09B973:
#_09B973: db $29,$52,$39,$9A,$F9,$F2,$18,$2A
#_09B97B: db $4B,$CF,$2E,$2E,$41,$CF,$3A,$9F
#_09B983: db $A6,$30,$37,$2B,$37,$F9,$A6,$26
#_09B98B: db $32,$26,$2A,$26,$CF,$A6,$58,$34
#_09B993: db $50,$FC,$E7,$00,$FF
DATA8_09B998:
#_09B998: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09B9A0: db $9A,$F9,$25,$3C,$9C,$CF,$F2,$18
#_09B9A8: db $2A,$4B,$CF,$2E,$2E,$41,$F9,$3A
#_09B9B0: db $9F,$37,$2B,$34,$CF,$3E,$A3,$39
#_09B9B8: db $52,$A9,$31,$9C,$F2,$0B,$FC,$FF
DATA8_09B9C0:
#_09B9C0: db $D2,$58,$56,$D7,$15,$D2,$56,$54
#_09B9C8: db $D6,$00,$64,$70,$28,$D3,$55
DATA8_09B9CF:
#_09B9CF: db $DE,$00,$00,$F2,$01,$E4,$00
DATA8_09B9D6:
#_09B9D6: db $2C,$4F,$40,$2C,$9A,$F9,$F2,$32
#_09B9DE: db $FC,$D0,$0C,$E7,$00,$FF
DATA8_09B9E4:
#_09B9E4: db $D6,$00,$B0,$70,$38,$29,$38,$2E
#_09B9EC: db $9A,$F9,$47,$27,$CF,$BE,$8A,$C5
#_09B9F4: db $AA,$47,$3E,$CF,$26,$39,$26,$4A
#_09B9FC: db $FC,$FF
DATA8_09B9FE:
#_09B9FE: db $D2,$58,$5A,$D7,$15,$D2,$56,$58
#_09BA06: db $D6,$00,$64,$70,$28,$D3,$59
DATA8_09BA0D:
#_09BA0D: db $DE,$00,$00,$F2,$01,$E4,$00
DATA8_09BA14:
#_09BA14: db $2C,$4F,$40,$2C,$9A,$F9,$F2,$31
#_09BA1C: db $FC,$D1,$0C,$E7,$00,$FF
DATA8_09BA22:
#_09BA22: db $D6,$00,$B0,$70,$38,$29,$38,$2E
#_09BA2A: db $9A,$F9,$43,$34,$CF,$AA,$27,$A5
#_09BA32: db $FC,$FF
DATA8_09BA34:
#_09BA34: db $D2,$57,$5C,$D6,$00,$1F,$70,$28
#_09BA3C: db $FE,$45,$00,$01,$29,$38,$2E,$9A
#_09BA44: db $F9,$2B,$26,$37,$2C,$4E,$CF,$29
#_09BA4C: db $4E,$3E,$CF,$F2,$51,$3A,$F9,$2A
#_09BA54: db $4B,$A6,$2A,$4B,$CF,$34,$43,$30
#_09BA5C: db $26,$51,$CF,$3B,$2A,$4E,$35,$43
#_09BA64: db $58,$34,$FC,$FA,$48,$36,$3E,$CF
#_09BA6C: db $2E,$2E,$3A,$CF,$34,$43,$30,$26
#_09BA74: db $51,$25,$36,$46,$CF,$F2,$56,$3A
#_09BA7C: db $F9,$2A,$28,$37,$26,$4D,$52,$A6
#_09BA84: db $CF,$29,$4E,$47,$CF,$47,$27,$31
#_09BA8C: db $9E,$CF,$2A,$28,$4B,$4E,$4D,$94
#_09BA94: db $F9,$34,$31,$2D,$37,$2C,$4E,$94
#_09BA9C: db $FC,$FF
DATA8_09BA9E:
#_09BA9E: db $97,$2E,$28,$9C,$CF,$2B,$2E,$28
#_09BAA6: db $37,$2B,$34,$FC,$FA,$29,$38,$2E
#_09BAAE: db $3D,$2E,$28,$9A,$F9,$2E,$4E,$A9
#_09BAB6: db $CF,$29,$4E,$47,$CF,$A2,$57,$27
#_09BABE: db $AD,$36,$CF,$A9,$2B,$4D,$F9,$29
#_09BAC6: db $52,$3A,$CF,$2B,$4D,$A4,$F2,$0B
#_09BACE: db $FC,$FF
DATA8_09BAD0:
#_09BAD0: db $D2,$57,$5E,$D6,$00,$1F,$70,$28
#_09BAD8: db $FE,$45,$00,$01,$29,$38,$2E,$9A
#_09BAE0: db $F9,$F2,$51,$38,$CF,$F2,$50,$3E
#_09BAE8: db $F9,$39,$3A,$2A,$3D,$47,$2C,$37
#_09BAF0: db $2B,$A9,$CF,$F2,$56,$51,$CF,$25
#_09BAF8: db $36,$46,$37,$26,$34,$9C,$FC,$FA
#_09BB00: db $3F,$38,$4C,$3D,$CF,$29,$52,$39
#_09BB08: db $3D,$2E,$51,$CF,$44,$57,$27,$3A
#_09BB10: db $CF,$2B,$3A,$26,$58,$37,$F9,$26
#_09BB18: db $43,$A9,$3E,$CF,$25,$36,$46,$34
#_09BB20: db $F2,$56,$51,$F9,$31,$AE,$37,$CF
#_09BB28: db $33,$3D,$2E,$3D,$34,$46,$3A,$CF
#_09BB30: db $36,$2A,$58,$37,$26,$4D,$FC,$FF
DATA8_09BB38:
#_09BB38: db $97,$2E,$28,$9C,$CF,$2B,$2E,$28
#_09BB40: db $37,$2B,$34,$FC,$FA,$29,$38,$2E
#_09BB48: db $3D,$2E,$28,$9A,$F9,$29,$2A,$9F
#_09BB50: db $A9,$CF,$34,$31,$2A,$58,$34,$4A
#_09BB58: db $CF,$25,$4C,$9C,$38,$27,$F9,$2E
#_09BB60: db $4E,$A9,$CF,$48,$31,$4B,$2A,$3A
#_09BB68: db $CF,$3C,$45,$4E,$4D,$A6,$4F,$27
#_09BB70: db $F2,$0B,$FC,$FF
DATA8_09BB74:
#_09BB74: db $D2,$57,$60,$D6,$00,$1F,$70,$28
#_09BB7C: db $FE,$45,$00,$01,$EE,$9A,$F9,$AF
#_09BB84: db $2C,$3D,$3A,$2C,$34,$26,$9C,$CF
#_09BB8C: db $43,$35,$3A,$26,$4D,$3E,$A3,$A9
#_09BB94: db $31,$FC,$FA,$26,$30,$2B,$3D,$39
#_09BB9C: db $26,$CF,$3A,$2C,$34,$26,$A6,$2D
#_09BBA4: db $9C,$F9,$F2,$51,$3A,$CF,$25,$48
#_09BBAC: db $36,$4B,$4E,$37,$26,$4D,$3D,$A9
#_09BBB4: db $31,$FC,$FA,$F2,$51,$51,$CF,$34
#_09BBBC: db $29,$2F,$39,$2D,$4E,$AB,$F9,$2E
#_09BBC4: db $2E,$3A,$CF,$38,$A2,$2E,$46,$4B
#_09BBCC: db $4E,$34,$CF,$43,$43,$A9,$30,$57
#_09BBD4: db $27,$F2,$0B,$FC,$FF
DATA8_09BBD9:
#_09BBD9: db $97,$EE,$3D,$CF,$34,$43,$30,$26
#_09BBE1: db $3E,$F9,$2A,$26,$42,$27,$2F,$4E
#_09BBE9: db $34,$F2,$0B,$FC,$FF
DATA8_09BBEE:
#_09BBEE: db $D6,$00,$6B,$60,$28,$D2,$0C,$64
#_09BBF6: db $D2,$56,$62,$97,$36,$4A,$26,$CF
#_09BBFE: db $43,$4C,$57,$2C,$A9,$CF,$F2,$69
#_09BC06: db $FC,$FF
DATA8_09BC08:
#_09BC08: db $97,$F2,$68,$F8,$63,$FF
DATA8_09BC0E:
#_09BC0E: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09BC16: db $D6,$00,$00,$FE,$1A,$63,$04,$04
#_09BC1E: db $00,$07,$13,$D0,$0C,$FF
DATA8_09BC24:
#_09BC24: db $97,$41,$48,$3D,$CF,$33,$38,$3A
#_09BC2C: db $CF,$A9,$43,$31,$2A,$95,$F8,$65
#_09BC34: db $FF
DATA8_09BC35:
#_09BC35: db $FE,$1A,$63,$86,$04,$00,$07,$13
#_09BC3D: db $D1,$0C,$FF
DATA8_09BC40:
#_09BC40: db $D2,$56,$68,$D0,$FF,$FF
DATA8_09BC46:
#_09BC46: db $D2,$56,$68,$D1,$FF
DATA8_09BC4B:
#_09BC4B: db $FF
DATA8_09BC4C:
#_09BC4C: db $D5,$47,$D6,$00,$59,$70,$38,$4F
#_09BC54: db $27,$A2,$52,$9A,$F9,$D2,$65,$0C
#_09BC5C: db $D2,$66,$0D,$D2,$67,$09,$D2,$63
#_09BC64: db $06
DATA8_09BC65:
#_09BC65: db $D2,$61,$02,$3F,$2F,$30,$AD,$4C
#_09BC6D: db $A2,$55,$3D,$27,$CF,$34,$58,$30
#_09BC75: db $55,$A9,$CF,$29,$58,$34,$2A,$95
#_09BC7D: db $F9,$F2,$1A,$26,$4B,$26,$A2,$55
#_09BC85: db $39,$FC,$FA,$29,$43,$28,$34,$35
#_09BC8D: db $9C,$CF,$F2,$36,$3A,$CF,$26,$4D
#_09BC95: db $25,$26,$A6,$F9,$04,$01,$3C,$52
#_09BC9D: db $CF,$31,$9D,$34,$9C,$F2,$0B,$F9
#_09BCA5: db $3E,$2A,$26,$A0,$3D,$CF,$32,$2A
#_09BCAD: db $26,$3A,$3E,$CF,$39,$4E,$34,$2A
#_09BCB5: db $95,$FC
DATA8_09BCB7:
#_09BCB7: db $29,$43,$28,$34,$35,$3D,$CF,$2A
#_09BCBF: db $36,$48,$2C,$3E,$CF,$2B,$26,$37
#_09BCC7: db $29,$4D,$A5,$FC,$D0,$61,$FE,$04
#_09BCCF: db $03,$04,$FA,$27,$5A,$45,$CF,$39
#_09BCD7: db $2A,$39,$2A,$CF,$4A,$26,$36,$4B
#_09BCDF: db $9C,$43,$28,$3A,$CF,$39,$58,$34
#_09BCE7: db $39,$F9,$26,$43,$3D,$CF,$2E,$2E
#_09BCEF: db $4F,$9C,$2D,$51,$CF,$50,$31,$4E
#_09BCF7: db $3B,$4A,$27,$3A,$39,$FC,$D3,$05
DATA8_09BCFF:
#_09BCFF: db $FA,$44,$A3,$2A,$4B,$3D,$CF,$2E
#_09BD07: db $27,$AA,$27,$51,$F9,$32,$26,$9D
#_09BD0F: db $38,$CF,$30,$52,$A2,$37,$CF,$29
#_09BD17: db $4D,$3D,$2A,$95,$F9,$32,$26,$9D
#_09BD1F: db $38,$3E,$CF,$39,$3A,$2A,$CF,$50
#_09BD27: db $2A,$58,$37,$29,$4D,$3D,$2A,$95
#_09BD2F: db $FC,$D3,$05
DATA8_09BD32:
#_09BD32: db $FA,$2A,$52,$A2,$57,$27,$38,$CF
#_09BD3A: db $4A,$2C,$AF,$27,$3D,$CF,$43,$43
#_09BD42: db $3A,$F9,$27,$A0,$26,$37,$3E,$CF
#_09BD4A: db $29,$4B,$3B,$2A,$95,$F9,$34,$A6
#_09BD52: db $CF,$2F,$36,$4C,$2C,$51,$CF,$2C
#_09BD5A: db $4C,$2A,$28,$31,$3D,$44,$CF,$A9
#_09BD62: db $3E,$39,$26,$2A,$95,$FC
DATA8_09BD68:
#_09BD68: db $FA,$49,$2C,$AE,$2B,$CF,$44,$35
#_09BD70: db $51,$CF,$44,$27,$30,$39,$58,$34
#_09BD78: db $38,$2B,$3E,$F9,$2E,$3D,$A2,$A2
#_09BD80: db $26,$3D,$47,$38,$51,$CF,$34,$A3
#_09BD88: db $3C,$37,$2C,$4E,$FC,$FF
DATA8_09BD8E:
#_09BD8E: db $D2,$64,$07,$D3,$01
DATA8_09BD93:
#_09BD93: db $F2,$1C,$50,$52,$A2,$57,$27,$3D
#_09BD9B: db $CF,$F2,$5C,$3E,$F9,$87,$5F,$3D
#_09BDA3: db $CF,$7C,$62,$60,$85,$9C,$CF,$2A
#_09BDAB: db $52,$32,$26,$CF,$2F,$32,$4A,$27
#_09BDB3: db $38,$F9,$62,$61,$69,$3D,$CF,$5D
#_09BDBB: db $69,$83,$9C,$CF,$27,$AB,$26,$38
#_09BDC3: db $4F,$27,$38,$F9,$F2,$04,$CF,$3A
#_09BDCB: db $52,$9F,$52,$3A,$F9,$2E,$27,$40
#_09BDD3: db $2C,$3E,$CF,$47,$34,$4B,$2F,$3B
#_09BDDB: db $FC,$FA,$AA,$35,$4B,$3D,$37,$3A
#_09BDE3: db $CF,$49,$A6,$3C,$37,$47,$F9,$3A
#_09BDEB: db $52,$9F,$52,$51,$CF,$30,$3E,$26
#_09BDF3: db $31,$4D,$CF,$AA,$27,$9E,$38,$39
#_09BDFB: db $4F,$27,$F9,$33,$4E,$51,$CF,$3E
#_09BE03: db $AB,$46,$4D,$3D,$3E,$CF,$29,$43
#_09BE0B: db $28,$CF,$A6,$2D,$A2,$55,$FC,$FA
#_09BE13: db $2E,$3D,$29,$2C,$3E,$CF,$F2,$5C
#_09BE1B: db $3A,$CF,$36,$27,$A2,$37,$29,$4D
#_09BE23: db $F9,$2E,$2E,$2A,$4B,$CF,$49,$2C
#_09BE2B: db $9C,$CF,$4A,$26,$FC,$FE,$03,$00
#_09BE33: db $D0,$67,$D0,$FB
DATA8_09BE37:
#_09BE37: db $D0,$0C,$FE,$1B,$1D,$52,$0D,$00
#_09BE3F: db $07,$18,$D4,$03,$2B,$51,$CF,$36
#_09BE47: db $2D,$37,$39,$FC,$FF
DATA8_09BE4C:
#_09BE4C: db $D2,$9E,$0F,$D2,$0C,$0B,$F2,$5C
#_09BE54: db $41,$CF,$26,$2C,$3D,$2A,$95,$F8
#_09BE5C: db $08,$D4,$03,$33,$27,$2A,$CF,$25
#_09BE64: db $32,$58,$37,$3E,$CF,$29,$4B,$3B
#_09BE6C: db $39,$FC
DATA8_09BE6E:
#_09BE6E: db $FE,$1B,$1B,$D2,$0D,$00,$07,$18
#_09BE76: db $D1,$0C,$FF
DATA8_09BE79:
#_09BE79: db $B6,$8A,$BA,$41,$CF,$26,$2C,$3D
#_09BE81: db $2A,$95,$F8,$0A,$D3,$08
DATA8_09BE87:
#_09BE87: db $29,$43,$28,$3E,$CF,$6F,$8A,$68
#_09BE8F: db $CF,$76,$72,$60,$85,$3D,$CF,$2E
#_09BE97: db $38,$AB,$51,$F9,$2B,$26,$34,$3D
#_09BE9F: db $A6,$39,$FC,$D3,$0E
DATA8_09BEA4:
#_09BEA4: db $29,$43,$28,$3E,$CF,$60,$63,$C3
#_09BEAC: db $71,$3D,$CF,$2E,$38,$AB,$51,$F9
#_09BEB4: db $2B,$26,$34,$3D,$A6,$39,$FC,$D3
#_09BEBC: db $0E
DATA8_09BEBD:
#_09BEBD: db $FA,$33,$4E,$9C,$CF,$29,$43,$28
#_09BEC5: db $3D,$26,$30,$39,$4B,$AB,$F9,$50
#_09BECD: db $30,$3E,$CF,$39,$3A,$47,$CF,$26
#_09BED5: db $27,$43,$26,$FC,$FF
DATA8_09BEDA:
#_09BEDA: db $2E,$3D,$2F,$2B,$3E,$CF,$47,$3E
#_09BEE2: db $48,$CF,$27,$44,$3D,$CF,$33,$2E
#_09BEEA: db $A6,$F9,$3F,$2B,$2A,$28,$31,$9C
#_09BEF2: db $4A,$26,$FC,$FF
DATA8_09BEF6:
#_09BEF6: db $D5,$50,$D7,$A4,$25,$D6,$00,$AC
#_09BEFE: db $70,$28,$83,$B7,$9A,$F9,$4A,$2C
#_09BF06: db $2B,$34,$3C,$8D,$F9,$2E,$2E,$9C
#_09BF0E: db $CF,$11,$13,$18,$24,$0B,$A2,$56
#_09BF16: db $50,$26,$29,$2C,$35,$56,$5A,$4D
#_09BF1E: db $93,$83,$B7,$FC,$FE,$58,$01,$11
#_09BF26: db $D3,$12
DATA8_09BF28:
#_09BF28: db $FA,$29,$48,$95,$CF,$F2,$4E,$A2
#_09BF30: db $55,$39,$26,$F9,$BF,$7E,$A6,$3C
#_09BF38: db $8D,$5A,$FC,$FA,$F2,$4E,$3F,$38
#_09BF40: db $3E,$F9,$2B,$35,$55,$BF,$7E,$A6
#_09BF48: db $4A,$5A,$FC,$D3,$1F
DATA8_09BF4D:
#_09BF4D: db $FA,$4A,$27,$3E,$CF,$39,$3A,$2A
#_09BF55: db $39,$95,$D8,$03,$17,$13,$18,$16
#_09BF5D: db $22,$1E,$12,$1F,$D3,$1F
DATA8_09BF63:
#_09BF63: db $FA,$5D,$8B,$CF,$33,$27,$CF,$F2
#_09BF6B: db $4F,$FE,$5C,$01,$12,$FA,$A2,$55
#_09BF73: db $CF,$F3,$F9,$38,$CF,$2E,$27,$2A
#_09BF7B: db $52,$A6,$3C,$CF,$26,$26,$95,$F8
#_09BF83: db $14,$D3,$12
DATA8_09BF86:
#_09BF86: db $FA,$FE,$3C,$15,$FE,$59,$97,$F1
#_09BF8E: db $3E,$CF,$F3,$51,$F9,$F2,$2D,$FC
#_09BF96: db $D3,$12
DATA8_09BF98:
#_09BF98: db $47,$35,$47,$3D,$9C,$CF,$26,$58
#_09BFA0: db $B0,$26,$A6,$3C,$8D,$F9,$41,$4B
#_09BFA8: db $30,$38,$26,$A9,$FC,$D3,$12
DATA8_09BFAF:
#_09BFAF: db $FE,$58,$03,$1D
DATA8_09BFB3:
#_09BFB3: db $FA,$A2,$55,$CF,$04,$30,$56,$4D
#_09BFBB: db $26,$CF,$28,$4B,$52,$A9,$4A,$F9
#_09BFC3: db $FE,$5C,$03,$12,$FE,$5B,$1A,$FA
#_09BFCB: db $F5,$38,$CF,$2E,$27,$2A,$52,$A6
#_09BFD3: db $4A,$CF,$26,$26,$95,$F8,$18,$D3
#_09BFDB: db $17
DATA8_09BFDC:
#_09BFDC: db $FE,$08,$04,$19,$D3,$1B
DATA8_09BFE2:
#_09BFE2: db $FE,$09,$1C,$FE,$5A,$FE,$26,$04
#_09BFEA: db $97,$F5,$9C,$CF,$F2,$2F,$FC,$D3
#_09BFF2: db $12
DATA8_09BFF3:
#_09BFF3: db $FA,$33,$4E,$A2,$55,$CF,$6A,$5E
#_09BFFB: db $86,$5E,$3E,$CF,$2E,$27,$2A,$52
#_09C003: db $A9,$2B,$39,$26,$3C,$FC,$D3,$12
DATA8_09C00B:
#_09C00B: db $FA,$A1,$5A,$52,$3C,$52,$CF,$29
#_09C013: db $39,$A2,$71,$62,$7B,$9C,$CF,$26
#_09C01B: db $4D,$39,$8B,$FC,$D3,$17
DATA8_09C021:
#_09C021: db $FA,$A1,$5A,$52,$3C,$52,$CF,$71
#_09C029: db $62,$7B,$9C,$CF,$26,$58,$B0,$26
#_09C031: db $A6,$8B,$FC,$D3,$12
DATA8_09C036:
#_09C036: db $FA,$6A,$5E,$86,$5E,$9C,$CF,$42
#_09C03E: db $30,$2D,$4C,$55,$F9,$42,$27,$32
#_09C046: db $2B,$51,$CF,$04,$30,$56,$4D,$26
#_09C04E: db $CF,$47,$58,$37,$2B,$39,$4A,$FC
#_09C056: db $D3,$12
DATA8_09C058:
#_09C058: db $FA,$52,$5A,$38,$3C,$F9,$5A,$5D
#_09C060: db $5E,$6F,$7D,$38,$CF,$2E,$27,$2A
#_09C068: db $52,$5A,$CF,$3E,$F9,$42,$27,$32
#_09C070: db $2B,$02,$2E,$51,$CF,$5D,$5E,$6F
#_09C078: db $7D,$02,$2E,$38,$CF,$2E,$27,$2A
#_09C080: db $52,$31,$4D,$4A,$FC,$FA,$2E,$27
#_09C088: db $2A,$52,$31,$4D,$CF,$5D,$5E,$6F
#_09C090: db $7D,$3E,$F2,$0B,$FC,$E1,$E4,$F3
#_09C098: db $3E,$CF,$CF,$E1,$CB,$F3,$F9,$E1
#_09C0A0: db $E5,$F3,$3E,$CF,$CF,$E1,$DF,$F3
#_09C0A8: db $F9,$E1,$E6,$F3,$3E,$CF,$E1,$D4
#_09C0B0: db $F3,$F9,$E1,$E7,$F3,$3E,$CF,$E1
#_09C0B8: db $BB,$F3,$F9,$E1,$E8,$F3,$3E,$CF
#_09C0C0: db $CF,$E1,$E0,$F3,$F9,$E1,$E9,$F3
#_09C0C8: db $3E,$CF,$CF,$CF,$CF,$E1,$B9,$F3
#_09C0D0: db $FC,$FA,$E1,$EA,$F3,$3E,$CF,$CF
#_09C0D8: db $CF,$E1,$E1,$F3,$F9,$E1,$EB,$F3
#_09C0E0: db $3E,$CF,$CF,$E1,$C9,$F3,$F9,$E1
#_09C0E8: db $EC,$F3,$3E,$CF,$E1,$D6,$F3,$F9
#_09C0F0: db $E1,$ED,$F3,$3E,$CF,$CF,$E1,$DE
#_09C0F8: db $F3,$F9,$E1,$EE,$F3,$3E,$CF,$CF
#_09C100: db $E1,$D5,$F3,$F9,$E1,$EF,$F3,$3E
#_09C108: db $CF,$E1,$BC,$F3,$F9,$58,$37,$39
#_09C110: db $CF,$2C,$44,$25,$50,$32,$2A,$39
#_09C118: db $FC,$FA,$5A,$6A,$5E,$86,$5E,$38
#_09C120: db $CF,$2E,$27,$2A,$52,$5A,$CF,$3E
#_09C128: db $F9,$42,$27,$32,$2B,$04,$2E,$A9
#_09C130: db $CF,$6A,$5E,$86,$5E,$02,$34,$26
#_09C138: db $38,$CF,$2E,$27,$2A,$52,$A6,$4A
#_09C140: db $FC,$FA,$E1,$E5,$F3,$CF,$E1,$EB
#_09C148: db $F3,$CF,$E1,$ED,$F3,$A9,$F9,$DE
#_09C150: db $00,$00,$45,$01,$F2,$8D,$F5,$F9
#_09C158: db $E1,$ED,$F3,$CF,$E1,$EE,$F3,$CF
#_09C160: db $E1,$EF,$F3,$A9,$F9,$DE,$00,$00
#_09C168: db $44,$01,$F2,$8D,$F5,$F9,$E1,$E6
#_09C170: db $F3,$CF,$E1,$E9,$F3,$CF,$E1,$EF
#_09C178: db $F3,$A9,$F9,$DE,$00,$00,$43,$01
#_09C180: db $F2,$8D,$F5,$FC,$FA,$E1,$E4,$F3
#_09C188: db $CF,$E1,$E5,$F3,$CF,$E1,$E9,$F3
#_09C190: db $A9,$F9,$DE,$00,$00,$42,$01,$F2
#_09C198: db $8D,$F5,$F9,$E1,$E8,$F3,$CF,$E1
#_09C1A0: db $EB,$F3,$CF,$E1,$EE,$F3,$A9,$F9
#_09C1A8: db $DE,$00,$00,$41,$01,$F2,$8D,$F5
#_09C1B0: db $F9,$E1,$EC,$F3,$CF,$E1,$ED,$F3
#_09C1B8: db $CF,$E1,$EF,$F3,$A9,$F9,$DE,$00
#_09C1C0: db $00,$40,$01,$F2,$8D,$F5,$FC,$FA
#_09C1C8: db $E1,$E6,$F3,$CF,$E1,$E8,$F3,$CF
#_09C1D0: db $E1,$E9,$F3,$A9,$F9,$DE,$00,$00
#_09C1D8: db $3F,$01,$F2,$8D,$F5,$F9,$E1,$E4
#_09C1E0: db $F3,$CF,$E1,$E7,$F3,$CF,$E1,$EA
#_09C1E8: db $F3,$A9,$F9,$DE,$00,$00,$3E,$01
#_09C1F0: db $F2,$8D,$F5,$FC,$2C,$44,$25,$50
#_09C1F8: db $32,$3E,$CF,$26,$A2,$57,$27,$3D
#_09C200: db $CF,$38,$29,$4C,$FC,$D3,$12
DATA8_09C207:
#_09C207: db $FA,$42,$27,$32,$2B,$CF,$47,$58
#_09C20F: db $37,$2C,$4C,$55,$F9,$26,$36,$A9
#_09C217: db $47,$CF,$A6,$26,$2A,$52,$9F,$26
#_09C21F: db $2F,$FC,$FF
DATA8_09C222:
#_09C222: db $E1,$F5,$D2,$EF,$2A,$D5,$47,$D6
#_09C22A: db $00,$2D,$70,$28,$F2,$83,$9A,$F9
#_09C232: db $D2,$60,$22,$43,$34,$CF,$25,$58
#_09C23A: db $34,$39,$CF,$F0,$2C,$52,$FC,$FA
#_09C242: db $33,$4E,$3A,$30,$37,$47,$CF,$2B
#_09C24A: db $44,$3E,$CF,$34,$26,$30,$34,$47
#_09C252: db $3D,$A6,$39,$F9,$43,$A6,$CF,$5D
#_09C25A: db $64,$7B,$3A,$26,$30,$2B,$51,$CF
#_09C262: db $3D,$58,$38,$4B,$4E,$37,$39,$26
#_09C26A: db $3D,$2A,$F9,$27,$5A,$52,$CF,$50
#_09C272: db $34,$30,$9C,$CF,$44,$2E,$52,$A6
#_09C27A: db $A6,$2D,$3D,$2E,$38,$3E,$25,$4D
#_09C282: db $FC,$FA,$38,$2E,$4F,$A9,$CF,$47
#_09C28A: db $58,$38,$29,$29,$2C,$3D,$5D,$64
#_09C292: db $7B,$51,$F9,$71,$62,$7B,$3A,$CF
#_09C29A: db $30,$34,$2C,$3E,$39,$26,$2A,$3C
#_09C2A2: db $95,$FC,$FA,$2B,$44,$3D,$CF,$76
#_09C2AA: db $8A,$C3,$79,$85,$C3,$F2,$09,$3A
#_09C2B2: db $F9,$F3,$51,$CF,$38,$4C,$36,$2D
#_09C2BA: db $4E,$AB,$F9,$71,$62,$7B,$3D,$CF
#_09C2C2: db $2A,$A3,$51,$CF,$40,$48,$32,$4D
#_09C2CA: db $52,$A6,$9C,$39,$25,$FC,$D0,$60
#_09C2D2: db $DD,$F5,$21,$D3,$26
DATA8_09C2D7:
#_09C2D7: db $FF
DATA8_09C2D8:
#_09C2D8: db $9F,$52,$2B,$3A,$CF,$48,$58,$37
#_09C2E0: db $26,$4D,$2A,$3C,$F9,$D2,$EE,$25
DATA8_09C2E8:
#_09C2E8: db $F3,$3E,$CF,$44,$36,$2A,$58,$34
#_09C2F0: db $2A,$39,$95,$FC,$DD,$F5,$24,$D3
#_09C2F8: db $26
DATA8_09C2F9:
#_09C2F9: db $FA,$3E,$2A,$26,$A0,$3D,$32,$2A
#_09C301: db $26,$3A,$3E,$CF,$3D,$2E,$58,$37
#_09C309: db $39,$26,$2A,$39,$95,$FC,$FF
DATA8_09C310:
#_09C310: db $02,$01,$34,$26,$43,$A9,$CF,$71
#_09C318: db $62,$7B,$3A,$CF,$A9,$2B,$4E,$AB
#_09C320: db $F9,$A2,$56,$27,$AD,$52,$2A,$3C
#_09C328: db $F9,$D3,$23
DATA8_09C32B:
#_09C32B: db $D2,$EE,$28,$FA,$29,$29,$CF,$33
#_09C333: db $4E,$3E,$CF,$43,$2F,$30,$2C,$CF
#_09C33B: db $F3,$F9,$43,$A6,$CF,$3D,$2E,$58
#_09C343: db $37,$26,$34,$38,$3E,$F2,$0B,$F9
#_09C34B: db $2F,$58,$33,$2C,$CF,$2B,$44,$3D
#_09C353: db $CF,$F2,$09,$3A,$F9,$38,$4C,$36
#_09C35B: db $2D,$37,$25,$9F,$4A,$27,$FC,$FA
#_09C363: db $F2,$54,$F9,$4A,$4C,$CF,$F2,$55
#_09C36B: db $50,$2D,$A6,$FC,$D0,$EE,$FE,$29
#_09C373: db $DD,$F5,$27,$FA,$47,$27,$CF,$02
#_09C37B: db $43,$26,$CF,$47,$58,$37,$26,$4D
#_09C383: db $3D,$2A,$F9,$D3,$29
DATA8_09C388:
#_09C388: db $FF
DATA8_09C389:
#_09C389: db $43,$34,$CF,$F3,$51,$CF,$44,$36
#_09C391: db $2D,$34,$3D,$2A,$95,$F9
DATA8_09C397:
#_09C397: db $2D,$58,$2E,$27,$CF,$3D,$2E,$58
#_09C39F: db $37,$26,$4D,$47,$3D,$A6,$39,$FC
#_09C3A7: db $FA,$F2,$54,$F9,$2F,$4B,$3A,$CF
#_09C3AF: db $F2,$55,$A6,$4F,$27,$FC,$D0,$EF
#_09C3B7: db $FE,$29,$FF
DATA8_09C3BA:
#_09C3BA: db $97,$F2,$2C,$FC,$FF
DATA8_09C3BF:
#_09C3BF: db $D6,$00,$49,$78,$28,$F2,$33,$38
#_09C3C7: db $9A,$F9,$F2,$0B,$F2,$5C,$9C,$CF
#_09C3CF: db $A9,$2B,$25,$9C,$4E,$AB,$F9,$33
#_09C3D7: db $2E,$3A,$CF,$2A,$44,$9C,$CF,$25
#_09C3DF: db $4B,$50,$4E,$CF,$2C,$4D,$30,$45
#_09C3E7: db $3F,$38,$AC,$38,$51,$F9,$25,$43
#_09C3EF: db $3C,$2C,$CF,$29,$31,$2C,$26,$3A
#_09C3F7: db $CF,$39,$4B,$4E,$4D,$3D,$A9,$31
#_09C3FF: db $FC,$FA,$2E,$2E,$2A,$4B,$7C,$71
#_09C407: db $7C,$3D,$CF,$68,$71,$B5,$88,$3A
#_09C40F: db $25,$4D,$F9,$F2,$33,$3D,$CF,$A6
#_09C417: db $26,$2B,$57,$27,$2A,$26,$41,$F9
#_09C41F: db $25,$30,$51,$CF,$29,$3E,$2E,$AC
#_09C427: db $2C,$A6,$2F,$26,$FC,$FF
DATA8_09C42D:
#_09C42D: db $D6,$00,$65,$70,$28,$F2,$34,$38
#_09C435: db $9A,$F9,$F2,$33,$3E,$CF,$2A,$44
#_09C43D: db $9C,$CF,$31,$AE,$37,$3D,$CF,$3A
#_09C445: db $52,$9F,$52,$51,$F9,$31,$2C,$27
#_09C44D: db $4A,$27,$39,$2E,$38,$51,$CF,$26
#_09C455: db $58,$37,$26,$4D,$9C,$F9,$33,$52
#_09C45D: db $39,$CF,$43,$48,$2A,$30,$3A,$CF
#_09C465: db $A6,$43,$2F,$4E,$37,$3E,$CF,$39
#_09C46D: db $4B,$52,$94,$FC,$FF
DATA8_09C472:
#_09C472: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09C47A: db $9A,$F9,$F2,$33,$47,$CF,$F2,$34
#_09C482: db $47,$F9,$3F,$38,$AC,$38,$51,$CF
#_09C48A: db $31,$2C,$27,$38,$CF,$26,$58,$37
#_09C492: db $4D,$FC,$FA,$A9,$47,$39,$25,$F9
#_09C49A: db $34,$A6,$CF,$32,$26,$4C,$57,$2C
#_09C4A2: db $25,$4B,$33,$26,$51,$CF,$30,$37
#_09C4AA: db $4D,$38,$30,$2A,$F9,$29,$47,$28
#_09C4B2: db $52,$3D,$A6,$9C,$FC,$FF
DATA8_09C4B8:
#_09C4B8: db $D6,$00,$B2,$70,$38,$2E,$AA,$47
#_09C4C0: db $9A,$F9,$27,$44,$3D,$27,$28,$3A
#_09C4C8: db $CF,$39,$52,$2A,$A9,$58,$2A,$26
#_09C4D0: db $CF,$34,$37,$47,$3D,$9C,$F9,$27
#_09C4D8: db $2A,$52,$A9,$34,$52,$A6,$CF,$34
#_09C4E0: db $30,$2A,$3A,$CF,$44,$34,$52,$A6
#_09C4E8: db $4A,$FC,$FA,$69,$7C,$BF,$B5,$88
#_09C4F0: db $2A,$2E,$27,$3D,$CF,$30,$43,$4A
#_09C4F8: db $4C,$CF,$A3,$58,$38,$F9,$29,$29
#_09C500: db $2B,$2A,$58,$34,$4A,$CF,$42,$52
#_09C508: db $38,$A6,$4A,$FC,$FF
DATA8_09C50D:
#_09C50D: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09C515: db $9A,$F9,$E1,$19,$68,$71,$B5,$88
#_09C51D: db $3D,$CF,$AA,$2E,$2A,$3A,$CF,$25
#_09C525: db $4D,$4B,$30,$26,$F9,$F3,$3A,$3E
#_09C52D: db $CF,$3F,$44,$36,$9C,$CF,$25,$4D
#_09C535: db $33,$27,$A6,$FC,$FF
DATA8_09C53A:
#_09C53A: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09C542: db $9A,$F9,$5F,$60,$75,$3A,$CF,$F2
#_09C54A: db $34,$3D,$CF,$33,$27,$42,$52,$A1
#_09C552: db $52,$9C,$F9,$25,$4D,$33,$27,$A6
#_09C55A: db $4A,$FC,$FA,$5F,$60,$75,$41,$3E
#_09C562: db $CF,$2B,$34,$3A,$26,$2D,$AB,$CF
#_09C56A: db $31,$9E,$A6,$2D,$AA,$F9,$A6,$26
#_09C572: db $3E,$2A,$26,$3D,$25,$38,$CF,$F2
#_09C57A: db $1C,$3D,$35,$2D,$26,$3E,$F9,$7E
#_09C582: db $6D,$8F,$7E,$6D,$8F,$CF,$AA,$27
#_09C58A: db $26,$2C,$52,$A6,$4F,$27,$3C,$FC
#_09C592: db $FA,$5E,$65,$C6,$64,$87,$3D,$CF
#_09C59A: db $42,$27,$3A,$F9,$38,$29,$43,$50
#_09C5A2: db $4C,$CF,$30,$37,$44,$34,$4B,$CF
#_09C5AA: db $26,$2D,$4D,$58,$37,$F9,$2B,$26
#_09C5B2: db $34,$2E,$38,$CF,$25,$4D,$2D,$AA
#_09C5BA: db $FC,$FF
DATA8_09C5BC:
#_09C5BC: db $D6,$00,$B0,$70,$38,$29,$38,$2E
#_09C5C4: db $9A,$F9,$72,$90,$5A,$69,$CF,$72
#_09C5CC: db $90,$5A,$69,$CF,$A6,$26,$72,$90
#_09C5D4: db $5A,$69,$94,$F9,$69,$7C,$BF,$B5
#_09C5DC: db $88,$2A,$2E,$27,$3A,$CF,$38,$36
#_09C5E4: db $A2,$57,$CF,$30,$43,$CF,$30,$56
#_09C5EC: db $36,$9F,$52,$94,$FC,$FF
DATA8_09C5F2:
#_09C5F2: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09C5FA: db $9A,$F9,$2B,$26,$34,$2A,$95,$CF
#_09C602: db $69,$7C,$BF,$B5,$88,$2A,$2E,$27
#_09C60A: db $3A,$A9,$2B,$34,$58,$37,$26,$27
#_09C612: db $F9,$25,$3D,$30,$43,$FC,$FA,$A2
#_09C61A: db $36,$3E,$CF,$AA,$2E,$2A,$4B,$2A
#_09C622: db $CF,$27,$A0,$26,$37,$2B,$34,$58
#_09C62A: db $37,$F9,$27,$50,$2F,$A6,$A4,$FC
#_09C632: db $FF
DATA8_09C633:
#_09C633: db $D6,$00,$89,$70,$28,$4F,$27,$A2
#_09C63B: db $52,$9A,$F9,$2D,$26,$30,$35,$57
#_09C643: db $27,$A6,$58,$34,$CF,$C5,$85,$3E
#_09C64B: db $F9,$45,$2A,$30,$3E,$CF,$2D,$26
#_09C653: db $AC,$68,$69,$6F,$7D,$9C,$F9,$2F
#_09C65B: db $AA,$27,$30,$37,$26,$34,$9C,$F2
#_09C663: db $0B,$FC,$FA,$47,$27,$CF,$2E,$50
#_09C66B: db $4E,$37,$4D,$2A,$39,$FC,$FF
DATA8_09C672:
#_09C672: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09C67A: db $9A,$F9,$F2,$1C,$3D,$CF,$05,$36
#_09C682: db $3D,$CF,$42,$27,$9C,$2C,$3A,$F9
#_09C68A: db $61,$72,$9C,$CF,$31,$52,$A9,$4D
#_09C692: db $58,$37,$CF,$27,$50,$2F,$A6,$FC
#_09C69A: db $FA,$68,$71,$B5,$88,$3D,$CF,$F2
#_09C6A2: db $6D,$9C,$CF,$44,$34,$2E,$38,$25
#_09C6AA: db $4D,$4B,$30,$26,$FC,$FF
DATA8_09C6B0:
#_09C6B0: db $D6,$00,$A3,$70,$28,$F2,$6D,$9A
#_09C6B8: db $F9,$D2,$34,$41,$39,$52,$A6,$CF
#_09C6C0: db $2E,$2E,$51,$CF,$38,$29,$4C,$34
#_09C6C8: db $26,$3D,$2A,$95,$F9,$68,$71,$B5
#_09C6D0: db $88,$41,$CF,$26,$2C,$3D,$2A,$95
#_09C6D8: db $F9,$A6,$58,$34,$4B,$CF,$5C,$02
#_09C6E0: db $01,$01,$01,$01,$CF,$4A,$2E,$30
#_09C6E8: db $39,$F8,$3F,$D4,$03,$34,$A6,$A9
#_09C6F0: db $CF,$38,$29,$4F,$27,$58,$37,$3D
#_09C6F8: db $2A,$95,$F8,$36,$D3,$40
DATA8_09C6FE:
#_09C6FE: db $DE,$00,$00,$E8,$08,$D4,$03,$A2
#_09C706: db $55,$25,$CF,$26,$34,$26,$46,$3A
#_09C70E: db $CF,$25,$58,$37,$47,$4B,$29,$27
#_09C716: db $2A,$F9,$F5,$4A,$CF,$26,$2D,$94
#_09C71E: db $FC,$D6,$00,$00,$FE,$07,$3C,$D5
#_09C726: db $39,$E4,$00,$E5,$01,$38
DATA8_09C72C:
#_09C72C: db $E5,$00,$38,$D3,$37
DATA8_09C731:
#_09C731: db $E7,$00,$FE,$07,$78,$D6,$00,$A3
#_09C739: db $70,$28,$DE,$00,$00,$E0,$08,$F2
#_09C741: db $6D,$9A,$F9,$36,$9D,$3E,$CF,$F5
#_09C749: db $A6,$94,$CF,$2A,$37,$4D,$2A,$95
#_09C751: db $FC,$D6,$00,$00,$FE,$07,$78,$D5
#_09C759: db $39,$E4,$00,$E5,$01,$3A
DATA8_09C75F:
#_09C75F: db $E5,$00,$3A,$D3,$39
DATA8_09C764:
#_09C764: db $E7,$00,$FE,$07,$78,$D6,$00,$A3
#_09C76C: db $70,$28,$DE,$00,$00,$D7,$08,$F2
#_09C774: db $6D,$9A,$F9,$F5,$3A,$3E,$CF,$2A
#_09C77C: db $37,$3C,$28,$A6,$4F,$94,$FC,$D6
#_09C784: db $00,$00,$FE,$07,$78,$D5,$39,$E4
#_09C78C: db $00,$E5,$01,$3C
DATA8_09C790:
#_09C790: db $E5,$00,$3C,$D3,$3B
DATA8_09C795:
#_09C795: db $E7,$00,$FE,$07,$78,$D0,$34,$D6
#_09C79D: db $00,$A3,$70,$28,$F2,$6D,$9A,$F9
#_09C7A5: db $F5,$43,$A9,$CF,$34,$29,$30,$35
#_09C7AD: db $43,$27,$39,$52,$37,$F9,$25,$CF
#_09C7B5: db $25,$52,$34,$CF,$36,$CF,$36,$28
#_09C7BD: db $28,$48,$F2,$0B,$F9,$5D,$72,$63
#_09C7C5: db $58,$37,$CF,$4A,$AB,$32,$37,$2C
#_09C7CD: db $4E,$4A,$CF,$26,$26,$A6,$4F,$F9
#_09C7D5: db $29,$4E,$3D,$CF,$5D,$72,$63,$3A
#_09C7DD: db $CF,$39,$58,$37,$2C,$4E,$4A,$FC
#_09C7E5: db $FA
DATA8_09C7E6:
#_09C7E6: db $25,$CF,$5D,$72,$63,$CF,$2E,$2E
#_09C7EE: db $51,$CF,$38,$29,$4C,$34,$26,$52
#_09C7F6: db $A9,$31,$2A,$26,$95,$F8,$3E,$FF
DATA8_09C7FE:
#_09C7FE: db $D4,$03,$AA,$27,$A5,$CF,$AA,$27
#_09C806: db $A5,$CF,$38,$29,$58,$37,$2C,$A6
#_09C80E: db $2F,$26,$4A,$FC,$D2,$38,$42,$FE
#_09C816: db $1A,$39,$9C,$0B,$00,$07,$18,$FF
DATA8_09C81E:
#_09C81E: db $D9,$10,$27,$00,$40,$DA,$F0,$D8
#_09C826: db $FF,$D4,$03,$AB,$2A,$46,$CF,$2A
#_09C82E: db $3C,$3E,$CF,$26,$34,$A6,$26,$38
#_09C836: db $2C,$A4,$FC,$FF
DATA8_09C83A:
#_09C83A: db $D4,$03,$AC,$52,$AF,$27,$3A,$52
#_09C842: db $51,$CF,$F2,$2B,$FC,$FF
DATA8_09C848:
#_09C848: db $2E,$4E,$3E,$CF,$2E,$4E,$3E,$CF
#_09C850: db $F0,$3D,$5D,$72,$63,$FC,$D2,$38
#_09C858: db $3E,$D3,$3D
DATA8_09C85B:
#_09C85B: db $FE,$1A,$39,$1B,$0B,$00,$07,$18
#_09C863: db $D1,$38,$FF
DATA8_09C866:
#_09C866: db $D0,$38,$FF
DATA8_09C869:
#_09C869: db $D1,$38,$FF
DATA8_09C86C:
#_09C86C: db $D5,$45,$D7,$2D,$FE,$3A,$02,$03
#_09C874: db $FE,$07,$7F,$DE,$01,$00,$0D,$01
#_09C87C: db $D2,$64,$15,$D2,$65,$16,$DE,$01
#_09C884: db $00,$1B,$01,$E4,$00,$D2,$6D,$01
#_09C88C: db $D3,$02
DATA8_09C88E:
#_09C88E: db $D0,$8E
DATA8_09C890:
#_09C890: db $D2,$7A,$03,$D3,$04
DATA8_09C895:
#_09C895: db $D0,$90
DATA8_09C897:
#_09C897: db $EE,$9A,$F9,$D2,$84,$0F,$D2,$85
#_09C89F: db $08,$D2,$83,$05,$F0,$2C,$52,$CF
#_09C8A7: db $3F,$2F,$30,$AD,$4C,$A9,$31,$FC
#_09C8AF: db $AF,$2C,$3E,$CF,$2A,$44,$3D,$35
#_09C8B7: db $2A,$4B,$3A,$CF,$4A,$58,$37,$F9
#_09C8BF: db $40,$58,$2A,$36,$30,$34,$3D,$A9
#_09C8C7: db $31,$F9,$33,$30,$37,$CF,$F2,$21
#_09C8CF: db $3D,$CF,$4C,$33,$27,$51,$F9,$2B
#_09C8D7: db $2A,$2F,$4E,$43,$30,$34,$FC,$FA
#_09C8DF: db $35,$A2,$57,$27,$3A,$CF,$28,$26
#_09C8E7: db $28,$52,$3D,$CF,$41,$26,$50,$51
#_09C8EF: db $CF,$47,$34,$4B,$31,$F9,$F2,$21
#_09C8F7: db $F2,$0B,$F9,$AF,$2C,$3E,$CF,$2D
#_09C8FF: db $58,$30,$52,$30,$43,$30,$34,$FC
#_09C907: db $F2,$21,$CF,$A2,$36,$9F,$52,$3D
#_09C90F: db $34,$46,$F9,$2B,$56,$27,$32,$26
#_09C917: db $30,$56,$38,$30,$37,$CF,$34,$34
#_09C91F: db $2A,$27,$2E,$38,$51,$FC,$FA,$D0
#_09C927: db $83,$D2,$63,$09,$FE,$05,$00,$BF
#_09C92F: db $10,$FA,$F2,$0B,$30,$2A,$30,$CF
#_09C937: db $5D,$64,$7B,$3D,$2A,$A3,$3E,$CF
#_09C93F: db $25,$43,$4C,$3A,$29,$29,$2C,$F9
#_09C947: db $2A,$44,$3D,$CF,$A0,$2A,$A0,$9C
#_09C94F: db $CF,$25,$58,$37,$47,$F9,$AF,$2C
#_09C957: db $3F,$38,$4C,$A9,$3E,$CF,$37,$3A
#_09C95F: db $CF,$29,$28,$43,$32,$52,$FC,$FA
#_09C967: db $33,$2E,$A9,$CF,$F0,$2C,$52,$FC
#_09C96F: db $2B,$44,$3A,$CF,$34,$3D,$44,$9C
#_09C977: db $CF,$25,$4C,$43,$31,$F9
DATA8_09C97D:
#_09C97D: db $D2,$63,$09,$F2,$1C,$3D,$CF,$77
#_09C985: db $B5,$68,$3A,$CF,$31,$44,$36,$26
#_09C98D: db $34,$F9,$BB,$8F,$84,$90,$5F,$CF
#_09C995: db $60,$63,$C3,$71,$51,$CF,$34,$29
#_09C99D: db $30,$37,$FE,$05,$40,$FF,$07,$2C
#_09C9A5: db $4E,$43,$32,$52,$2A,$95,$D2,$82
#_09C9AD: db $0D,$FC
DATA8_09C9AF:
#_09C9AF: db $FA,$60,$63,$C3,$71,$3E,$CF,$33
#_09C9B7: db $3D,$2B,$57,$34,$26,$A9,$F9,$F2
#_09C9BF: db $5C,$3D,$CF,$3E,$2A,$26,$51,$CF
#_09C9C7: db $34,$2C,$4B,$52,$A9,$26,$4D,$4A
#_09C9CF: db $27,$A9,$31,$FC,$FA,$2E,$4E,$26
#_09C9D7: db $A2,$57,$27,$CF,$5D,$64,$7B,$51
#_09C9DF: db $CF,$3D,$2F,$AB,$4B,$32,$F9,$29
#_09C9E7: db $29,$2C,$3D,$3F,$38,$51,$CF,$9D
#_09C9EF: db $32,$26,$3A,$30,$37,$CF,$4A,$26
#_09C9F7: db $3D,$A9,$30,$57,$27,$2A,$F9,$41
#_09C9FF: db $26,$50,$51,$CF,$2A,$35,$38,$4D
#_09CA07: db $43,$A9,$F9,$2A,$44,$3D,$CF,$39
#_09CA0F: db $3D,$47,$38,$3A,$CF,$34,$34,$2A
#_09CA17: db $58,$37,$2C,$A6,$2F,$26,$F9,$29
#_09CA1F: db $3C,$9C,$26,$30,$43,$31,$FC,$FF
DATA8_09CA27:
#_09CA27: db $2C,$A6,$2F,$26,$FC,$D0,$85,$D3
#_09CA2F: db $06
DATA8_09CA30:
#_09CA30: db $D2,$63,$09,$3E,$48,$2C,$CF,$60
#_09CA38: db $63,$C3,$71,$51,$CF,$34,$29,$30
#_09CA40: db $37,$2C,$A6,$2F,$26,$F9,$F2,$5C
#_09CA48: db $9C,$CF,$3E,$2A,$26,$2F,$4E,$34
#_09CA50: db $4B,$F9,$38,$4C,$2A,$28,$30,$3D
#_09CA58: db $CF,$36,$2A,$39,$26,$2E,$38,$3A
#_09CA60: db $CF,$39,$4C,$43,$31,$FC,$E7,$00
#_09CA68: db $FF
DATA8_09CA69:
#_09CA69: db $DE,$01,$00,$0D,$01,$F2,$0B,$60
#_09CA71: db $63,$C3,$71,$51,$CF,$34,$29,$30
#_09CA79: db $34,$3D,$A9,$31,$3C,$F9,$F5,$2F
#_09CA81: db $43,$CF,$F0,$2C,$52,$3E,$F9,$48
#_09CA89: db $58,$37,$2C,$4E,$43,$30,$34,$94
#_09CA91: db $FC,$FA,$E7,$00,$FE,$07,$78,$F2
#_09CA99: db $7C,$F2,$7D,$E4,$00,$F5,$9A,$F9
#_09CAA1: db $4A,$2C,$48,$58,$34,$CF,$F0,$4A
#_09CAA9: db $F9,$2E,$4E,$2A,$4B,$47,$CF,$2A
#_09CAB1: db $44,$3D,$34,$46,$CF,$F2,$21,$3D
#_09CAB9: db $34,$46,$F9,$35,$2A,$4B,$51,$CF
#_09CAC1: db $36,$2C,$30,$37,$2C,$4E,$CF,$4A
#_09CAC9: db $26,$39,$95,$FE,$05,$40,$FF,$0B
#_09CAD1: db $F8,$0C
DATA8_09CAD3:
#_09CAD3: db $D5,$39,$D4,$03,$2A,$44,$3D,$CF
#_09CADB: db $34,$46,$3A,$CF,$34,$34,$2A,$27
#_09CAE3: db $2E,$38,$51,$CF,$2E,$AB,$45,$3D
#_09CAEB: db $2A,$95,$F9,$33,$3D,$4A,$27,$39
#_09CAF3: db $CF,$2E,$38,$9C,$CF,$49,$4D,$2F
#_09CAFB: db $4E,$4D,$38,$F9,$29,$47,$58,$37
#_09CB03: db $26,$4D,$3D,$2A,$94,$FC,$D3,$12
DATA8_09CB0B:
#_09CB0B: db $FC
DATA8_09CB0C:
#_09CB0C: db $D4,$03,$A9,$3E,$CF,$F2,$5C,$41
#_09CB14: db $CF,$49,$2C,$9C,$4A,$26,$F9,$3E
#_09CB1C: db $30,$51,$CF,$2A,$2D,$37,$48,$4F
#_09CB24: db $27,$FC,$FE,$02,$B0,$D0,$FB,$FA
#_09CB2C: db $E7,$00,$FE,$07,$78,$DE,$01,$00
#_09CB34: db $1B,$01,$E4,$00,$EE,$9A,$F9,$4A
#_09CB3C: db $2A,$58,$34,$A9,$31,$3C,$CF,$76
#_09CB44: db $72,$60,$85,$2F,$43,$47,$F9,$29
#_09CB4C: db $4A,$4F,$2E,$AC,$A9,$31,$CF,$A9
#_09CB54: db $3E,$CF,$43,$34,$25,$26,$43,$30
#_09CB5C: db $57,$27,$FC,$D0,$65,$E7,$00,$FF
DATA8_09CB64:
#_09CB64: db $F8,$0E,$D3,$11
DATA8_09CB68:
#_09CB68: db $D4,$04,$33,$27,$A9,$31,$2A,$CF
#_09CB70: db $3F,$2B,$27,$2D,$37,$2C,$4E,$4D
#_09CB78: db $52,$A9,$31,$2A,$F9,$F2,$31,$F9
#_09CB80: db $2B,$44,$3E,$CF,$43,$A6,$CF,$5D
#_09CB88: db $64,$7B,$3A,$CF,$34,$43,$30,$26
#_09CB90: db $51,$F9,$27,$4C,$50,$34,$30,$37
#_09CB98: db $CF,$39,$2A,$58,$34,$52,$A9,$31
#_09CBA0: db $3C,$FC,$D0,$85,$E7,$00,$FF
DATA8_09CBA7:
#_09CBA7: db $2B,$44,$3E,$CF,$AA,$27,$48,$4B
#_09CBAF: db $F9,$60,$63,$C3,$71,$3D,$CF,$26
#_09CBB7: db $27,$2E,$38,$51,$F9,$2B,$26,$37
#_09CBBF: db $30,$43,$58,$34,$CF,$4A,$27,$A9
#_09CBC7: db $31,$3C,$FC,$D3,$11
DATA8_09CBCC:
#_09CBCC: db $F0,$2C,$52,$CF,$2B,$44,$3E,$F9
#_09CBD4: db $33,$2E,$43,$A9,$CF,$62,$61,$69
#_09CBDC: db $3A,$CF,$2A,$34,$45,$26,$37,$F9
#_09CBE4: db $30,$43,$58,$34,$52,$A9,$31,$2A
#_09CBEC: db $FC
DATA8_09CBED:
#_09CBED: db $D4,$03,$2E,$28,$9A,$F9,$EE,$4A
#_09CBF5: db $F2,$0B,$F9,$32,$58,$38,$2C,$3E
#_09CBFD: db $CF,$45,$A6,$39,$CF,$4A,$27,$A6
#_09CC05: db $39,$FC,$FA,$EE,$9A,$F9,$25,$F2
#_09CC0D: db $0B,$25,$3D,$CF,$2E,$28,$3E,$F2
#_09CC15: db $0B,$FC,$FA,$E7,$00,$FE,$07,$3C
#_09CC1D: db $F2,$7C,$F2,$7D,$DE,$01,$00,$0D
#_09CC25: db $01,$D5,$39,$E4,$00,$FA,$F5,$9A
#_09CC2D: db $F9,$47,$38,$3E,$CF,$EE,$3D,$CF
#_09CC35: db $38,$47,$A9,$CF,$25,$58,$34,$F9
#_09CC3D: db $F0,$4A,$F9,$2E,$3D,$F6,$CF,$F5
#_09CC45: db $CF,$44,$A3,$2A,$4B,$F9,$A2,$A0
#_09CC4D: db $2C,$41,$CF,$29,$2C,$58,$37,$48
#_09CC55: db $4F,$27,$94,$FC
DATA8_09CC59:
#_09CC59: db $E5,$01,$14
DATA8_09CC5C:
#_09CC5C: db $E5,$00,$14,$D3,$13
DATA8_09CC61:
#_09CC61: db $E7,$00,$FE,$07,$78,$DE,$01,$00
#_09CC69: db $1B,$01,$E4,$00,$FE,$02,$20,$EE
#_09CC71: db $9A,$F9,$39,$CF,$39,$52,$38,$26
#_09CC79: db $27,$2E,$38,$51,$F2,$0B,$F9,$76
#_09CC81: db $72,$60,$85,$2F,$43,$51,$CF,$34
#_09CC89: db $29,$30,$37,$30,$43,$27,$38,$3E
#_09CC91: db $FC,$FA,$2B,$44,$3E,$CF,$35,$2A
#_09CC99: db $4B,$3D,$36,$2A,$26,$2A,$34,$51
#_09CCA1: db $CF,$43,$35,$9C,$28,$37,$26,$43
#_09CCA9: db $31,$F9,$2E,$3D,$43,$43,$A9,$3E
#_09CCB1: db $CF,$26,$36,$2A,$CF,$3E,$46,$36
#_09CCB9: db $30,$43,$31,$4A,$F2,$0B,$FC,$E7
#_09CCC1: db $00,$D0,$64,$FF
DATA8_09CCC5:
#_09CCC5: db $97,$7E,$68,$5D,$A6,$26,$2B,$57
#_09CCCD: db $27,$2A,$26,$FC,$FF
DATA8_09CCD2:
#_09CCD2: db $D6,$00,$8B,$70,$28,$FA,$F2,$33
#_09CCDA: db $CF,$2B,$57,$27,$33,$9A,$F9,$D2
#_09CCE2: db $7D,$1B,$D2,$7C,$17,$7E,$68,$5D
#_09CCEA: db $A6,$26,$2B,$57,$27,$2A,$26,$41
#_09CCF2: db $F9,$4A,$27,$2E,$33,$CF,$26,$4B
#_09CCFA: db $58,$30,$55,$26,$43,$30,$34,$FC
#_09CD02: db $D0,$7C,$D3,$18
DATA8_09CD06:
#_09CD06: db $25,$39,$34,$3D,$CF,$49,$27,$A2
#_09CD0E: db $52,$CF,$EE,$2F,$52,$3E,$F9,$F2
#_09CD16: db $66,$38,$30,$37,$CF,$29,$29,$2C
#_09CD1E: db $3D,$CF,$30,$52,$A2,$55,$3A,$F9
#_09CD26: db $30,$34,$50,$4E,$37,$26,$43,$31
#_09CD2E: db $FC,$D3,$18
DATA8_09CD31:
#_09CD31: db $FA,$F0,$2F,$52,$F9,$25,$39,$34
#_09CD39: db $3A,$47,$CF,$32,$52,$4E,$26,$51
#_09CD41: db $CF,$27,$2D,$37,$26,$34,$A6,$2B
#_09CD49: db $F9,$F2,$33,$A6,$52,$3A,$CF,$2C
#_09CD51: db $50,$50,$58,$37,$47,$4B,$29,$27
#_09CD59: db $38,$F9,$FE,$05,$10,$FF,$19,$29
#_09CD61: db $47,$58,$34,$3D,$A9,$31,$9C,$F2
#_09CD69: db $0B,$FC,$FA,$A1,$52,$3C,$52,$39
#_09CD71: db $9C,$4B,$CF,$25,$39,$34,$3E,$F9
#_09CD79: db $33,$3D,$30,$2A,$2C,$51,$CF,$47
#_09CD81: db $58,$37,$26,$39,$26,$4A,$27,$A9
#_09CD89: db $31,$3C,$FC,$FF
DATA8_09CD8D:
#_09CD8D: db $29,$47,$26,$43,$31,$FC,$FA,$F0
#_09CD95: db $2F,$52,$F2,$0B,$25,$39,$34,$3A
#_09CD9D: db $3E,$F9,$33,$3D,$30,$2A,$2C,$9C
#_09CDA5: db $CF,$A2,$56,$27,$AD,$52,$3A,$CF
#_09CDAD: db $25,$4D,$3D,$A9,$31,$F9,$F2,$5C
#_09CDB5: db $51,$CF,$2A,$52,$32,$26,$2F,$32
#_09CDBD: db $F9,$3F,$38,$AC,$38,$51,$CF,$31
#_09CDC5: db $2C,$27,$34,$46,$3A,$47,$F9,$A4
#_09CDCD: db $3F,$CF,$50,$34,$30,$34,$35,$CF
#_09CDD5: db $F2,$33,$2A,$26,$3A,$F9,$35,$2A
#_09CDDD: db $4B,$51,$CF,$2A,$30,$37,$26,$34
#_09CDE5: db $A6,$2D,$43,$32,$52,$2A,$FC,$FA
#_09CDED: db $97,$F2,$33,$3D,$CF,$32,$52,$4E
#_09CDF5: db $26,$51,$CF,$27,$2D,$43,$31,$2A
#_09CDFD: db $95,$F8,$1A,$D4,$03,$33,$27,$A9
#_09CE05: db $31,$2A,$CF,$2E,$38,$50,$4D,$38
#_09CE0D: db $CF,$26,$27,$3D,$A9,$31,$3C,$F9
#_09CE15: db $29,$29,$2C,$3D,$CF,$3F,$38,$AC
#_09CE1D: db $38,$9C,$F9,$31,$2C,$26,$51,$CF
#_09CE25: db $47,$38,$46,$37,$26,$4D,$38,$26
#_09CE2D: db $27,$3D,$3A,$F2,$0B,$FC,$FA,$2B
#_09CE35: db $9C,$CF,$2A,$50,$4C,$43,$30,$34
#_09CE3D: db $4B,$F9,$43,$34,$CF,$29,$26,$A9
#_09CE45: db $2C,$A6,$2F,$26,$FC,$FF
DATA8_09CE4B:
#_09CE4B: db $D4,$03,$25,$4C,$9C,$38,$27,$A0
#_09CE53: db $A1,$26,$43,$31,$F9,$2A,$44,$47
#_09CE5B: db $CF,$2B,$58,$38,$CF,$29,$4A,$4F
#_09CE63: db $2E,$AC,$3D,$2E,$38,$A9,$30,$57
#_09CE6B: db $27,$F9,$31,$9E,$3A,$CF,$32,$52
#_09CE73: db $4E,$26,$3D,$CF,$9D,$30,$2B,$51
#_09CE7B: db $CF,$3E,$A2,$46,$43,$30,$57,$27
#_09CE83: db $FC,$FA,$D6,$00,$00,$FE,$07,$7F
#_09CE8B: db $D6,$00,$3F,$70,$28,$D6,$01,$94
#_09CE93: db $50,$28,$D6,$02,$94,$90,$28,$FE
#_09CE9B: db $07,$3C,$D6,$00,$00,$D6,$00,$93
#_09CEA3: db $70,$28,$97,$F2,$33,$3D,$F9,$32
#_09CEAB: db $52,$4E,$26,$3D,$CF,$9D,$30,$2B
#_09CEB3: db $9C,$CF,$29,$2E,$39,$50,$4E,$34
#_09CEBB: db $F2,$0B,$FE,$07,$7F,$FE,$1C,$03
#_09CEC3: db $FC,$D6,$00,$00,$D6,$00,$3F,$70
#_09CECB: db $28,$FE,$07,$3C,$FE,$02,$F0,$D0
#_09CED3: db $7D,$D6,$00,$00,$D6,$01,$00,$D6
#_09CEDB: db $02,$00,$FE,$07,$3C,$FA,$D6,$00
#_09CEE3: db $8B,$70,$28,$F2,$33,$CF,$2B,$57
#_09CEEB: db $27,$33,$9A,$F9,$D3,$1C
DATA8_09CEF1:
#_09CEF1: db $50,$4E,$4B,$9C,$CF,$2A,$44,$3D
#_09CEF9: db $32,$52,$30,$CF,$F0,$CF,$4A,$F9
#_09CF01: db $4A,$2C,$CF,$26,$4B,$58,$30,$55
#_09CF09: db $26,$43,$30,$34,$FC,$FE,$06,$41
#_09CF11: db $1C,$D3,$1D
DATA8_09CF14:
#_09CF14: db $FE,$25,$FF,$FE,$23,$FF,$FE,$24
#_09CF1C: db $FF,$2E,$4E,$2A,$4B,$47,$CF,$2A
#_09CF24: db $44,$3D,$34,$46,$3A,$F9,$33,$30
#_09CF2C: db $37,$CF,$2A,$44,$51,$30,$52,$A2
#_09CF34: db $4D,$CF,$3F,$38,$AC,$38,$3D,$34
#_09CF3C: db $46,$3A,$F9,$35,$2A,$4B,$51,$CF
#_09CF44: db $40,$4D,$58,$37,$2C,$A6,$2F,$26
#_09CF4C: db $FC,$FF
DATA8_09CF4E:
#_09CF4E: db $D2,$7E,$1C,$FA,$25,$39,$34,$3A
#_09CF56: db $CF,$40,$2F,$50,$30,$26,$F9,$33
#_09CF5E: db $27,$AC,$9C,$CF,$2A,$44,$2A,$4B
#_09CF66: db $CF,$29,$2C,$4B,$4E,$43,$31,$F9
#_09CF6E: db $A4,$3F,$CF,$29,$27,$2D,$38,$4C
#_09CF76: db $2C,$A6,$2F,$26,$FC,$FA,$2E,$2E
#_09CF7E: db $CF,$68,$71,$B5,$88,$3D,$F9,$05
#_09CF86: db $36,$3D,$CF,$38,$A1,$2F,$4E,$34
#_09CF8E: db $CF,$38,$AC,$4B,$3E,$F9,$25,$39
#_09CF96: db $34,$9C,$CF,$26,$2D,$AB,$CF,$3F
#_09CF9E: db $4B,$2B,$43,$31,$F9,$29,$2C,$3D
#_09CFA6: db $CF,$3E,$2E,$3D,$39,$2A,$3A,$CF
#_09CFAE: db $25,$4C,$43,$31,$FC,$D0,$7E,$D3
#_09CFB6: db $1C
DATA8_09CFB7:
#_09CFB7: db $D5,$45,$D6,$00,$3F,$70,$28,$F2
#_09CFBF: db $33,$30,$52,$B2,$9A,$F9,$44,$47
#_09CFC7: db $CF,$2E,$2E,$4F,$47,$CF,$2A,$44
#_09CFCF: db $3A,$CF,$2F,$2F,$9F,$4D,$3D,$A9
#_09CFD7: db $31,$F9,$2A,$44,$3E,$CF,$26,$43
#_09CFDF: db $CF,$30,$52,$A2,$4D,$47,$3D,$3D
#_09CFE7: db $CF,$35,$2A,$4B,$51,$F9,$3F,$36
#_09CFEF: db $4A,$27,$38,$CF,$30,$37,$26,$43
#_09CFF7: db $31,$FC,$FA,$F2,$7B,$F8,$1F,$FF
DATA8_09CFFF:
#_09CFFF: db $D4,$03,$F2,$33,$30,$52,$B2,$9A
#_09D007: db $F9,$F2,$5C,$51,$CF,$2A,$52,$32
#_09D00F: db $26,$2F,$32,$4D,$34,$46,$F9,$44
#_09D017: db $39,$3D,$CF,$35,$2A,$4B,$51,$CF
#_09D01F: db $2A,$44,$3A,$CF,$2F,$2F,$9F,$4D
#_09D027: db $3D,$A9,$31,$F9,$2A,$44,$3D,$CF
#_09D02F: db $34,$46,$3A,$CF,$3E,$34,$4B,$2C
#_09D037: db $3D,$3E,$CF,$26,$43,$A9,$31,$FC
#_09D03F: db $FA,$F2,$7B,$F8,$20,$FF
DATA8_09D045:
#_09D045: db $D4,$03,$F2,$33,$30,$52,$B2,$9A
#_09D04D: db $F9,$F2,$5C,$9C,$CF,$2A,$52,$32
#_09D055: db $26,$31,$4E,$AB,$F9,$2A,$44,$3E
#_09D05D: db $CF,$33,$2E,$3A,$CF,$29,$4C,$34
#_09D065: db $35,$F9,$F2,$21,$9C,$CF,$3E,$A2
#_09D06D: db $43,$4C,$3D,$38,$2B,$51,$F9,$45
#_09D075: db $2A,$28,$4D,$A9,$30,$57,$27,$F9
#_09D07D: db $33,$30,$37,$CF,$2A,$44,$3A,$CF
#_09D085: db $35,$2A,$4B,$51,$CF,$2F,$2F,$9F
#_09D08D: db $34,$47,$3D,$3E,$F9,$2A,$39,$4B
#_09D095: db $A3,$CF,$2A,$44,$3A,$CF,$31,$2C
#_09D09D: db $50,$4E,$4D,$3D,$A9,$31,$FC,$FA
#_09D0A5: db $F2,$7B,$F8,$21,$FF
DATA8_09D0AA:
#_09D0AA: db $D4,$03,$F2,$33,$30,$52,$B2,$9A
#_09D0B2: db $F9,$2F,$25,$CF,$F2,$5C,$41,$CF
#_09D0BA: db $45,$2A,$26,$F9,$38,$47,$3A,$CF
#_09D0C2: db $38,$27,$38,$26,$CF,$25,$32,$51
#_09D0CA: db $CF,$39,$9C,$30,$43,$30,$57,$27
#_09D0D2: db $94,$FC,$FE,$02,$FF,$FF
DATA8_09D0D8:
#_09D0D8: db $D5,$45,$D6,$00,$C8,$70,$08,$D2
#_09D0E0: db $45,$24,$97,$7E,$68,$5D,$A5,$27
#_09D0E8: db $9C,$CF,$25,$4D,$F9,$33,$3D,$CF
#_09D0F0: db $31,$9C,$34,$3E,$CF,$25,$2B,$4B
#_09D0F8: db $2A,$3A,$F9,$EE,$51,$CF,$2A,$34
#_09D100: db $AA,$58,$37,$26,$34,$FC,$E9,$01
#_09D108: db $23,$FA,$ED,$9A,$F9,$3C,$28,$CF
#_09D110: db $F0,$CF,$2E,$3D,$A5,$27,$F9,$EE
#_09D118: db $3A,$CF,$33,$58,$2C,$4C,$A2,$55
#_09D120: db $39,$26,$95,$FC
DATA8_09D124:
#_09D124: db $D0,$45,$FF
DATA8_09D127:
#_09D127: db $97,$EE,$51,$CF,$2A,$34,$AA,$58
#_09D12F: db $34,$F9,$7E,$68,$5D,$A5,$27,$9C
#_09D137: db $CF,$25,$4D,$FC,$FF
DATA8_09D13C:
#_09D13C: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09D144: db $9A,$F9,$D2,$83,$26,$2E,$2E,$CF
#_09D14C: db $68,$71,$B5,$88,$3A,$3E,$F9,$7E
#_09D154: db $68,$5D,$CF,$EE,$2F,$43,$3D,$F9
#_09D15C: db $A5,$27,$9C,$CF,$25,$4C,$43,$31
#_09D164: db $FC,$FA,$EE,$2F,$43,$3E,$CF,$A0
#_09D16C: db $A2,$AD,$52,$3D,$CF,$26,$3D,$35
#_09D174: db $51,$F9,$9D,$32,$26,$3A,$CF,$29
#_09D17C: db $38,$47,$A6,$35,$51,$CF,$34,$31
#_09D184: db $2D,$37,$F9,$2A,$44,$3D,$47,$38
#_09D18C: db $41,$CF,$46,$2F,$4E,$34,$3D,$A9
#_09D194: db $31,$FC,$FA,$33,$30,$37,$CF,$43
#_09D19C: db $47,$39,$2C,$F9,$EE,$2F,$43,$3E
#_09D1A4: db $CF,$7E,$68,$5D,$38,$30,$37,$F9
#_09D1AC: db $4A,$44,$9C,$28,$4D,$3D,$A9,$31
#_09D1B4: db $FC,$FF
DATA8_09D1B6:
#_09D1B6: db $36,$CF,$36,$26,$3A,$CF,$EE,$2F
#_09D1BE: db $43,$9C,$CF,$7E,$68,$5D,$38,$30
#_09D1C6: db $37,$F9,$4A,$44,$9C,$28,$4C,$43
#_09D1CE: db $30,$34,$FC,$FA,$2E,$4E,$A9,$CF
#_09D1D6: db $2A,$44,$3D,$2C,$3A,$3D,$CF,$A2
#_09D1DE: db $36,$9F,$52,$3A,$F9,$43,$34,$CF
#_09D1E6: db $26,$58,$B4,$CF,$35,$2A,$A8,$26
#_09D1EE: db $34,$3D,$A9,$31,$FC,$FF
DATA8_09D1F4:
#_09D1F4: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09D1FC: db $9A,$F9,$F2,$5C,$2F,$28,$CF,$2A
#_09D204: db $52,$32,$26,$31,$4E,$AB,$F9,$5D
#_09D20C: db $64,$7B,$34,$35,$47,$CF,$F2,$34
#_09D214: db $38,$34,$35,$47,$F9,$29,$33,$4D
#_09D21C: db $4D,$3A,$CF,$34,$4C,$52,$FC,$FF
DATA8_09D224:
#_09D224: db $D6,$00,$0E,$70,$38,$F2,$33,$38
#_09D22C: db $9A,$F9,$E1,$F4,$F3,$9C,$CF,$25
#_09D234: db $4D,$38,$F9,$AA,$52,$39,$CF,$5D
#_09D23C: db $64,$7B,$47,$CF,$30,$57,$27,$2B
#_09D244: db $3A,$CF,$2A,$28,$4D,$52,$A6,$FC
#_09D24C: db $FA,$A6,$2D,$AA,$CF,$F2,$34,$38
#_09D254: db $3A,$CF,$38,$4B,$4E,$37,$F9,$5F
#_09D25C: db $60,$75,$3A,$CF,$47,$58,$37,$2A
#_09D264: db $4E,$35,$55,$58,$34,$F9,$35,$2A
#_09D26C: db $3A,$CF,$31,$52,$A9,$4D,$CF,$2A
#_09D274: db $26,$A2,$56,$27,$3D,$F9,$28,$2F
#_09D27C: db $3A,$CF,$31,$4D,$58,$37,$CF,$26
#_09D284: db $58,$37,$34,$FC,$FF
DATA8_09D289:
#_09D289: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09D291: db $9A,$F9,$F2,$33,$A6,$26,$2B,$57
#_09D299: db $27,$2A,$26,$41,$3D,$CF,$44,$35
#_09D2A1: db $3E,$F9,$A5,$2C,$32,$26,$9C,$CF
#_09D2A9: db $87,$5F,$A9,$39,$26,$47,$3D,$3A
#_09D2B1: db $3E,$F9,$2C,$39,$52,$3D,$CF,$44
#_09D2B9: db $35,$A9,$31,$FC,$FA,$E1,$E0,$F3
#_09D2C1: db $9C,$CF,$25,$4E,$AB,$CF,$4B,$2C
#_09D2C9: db $3A,$39,$4D,$3D,$A9,$31,$9C,$F2
#_09D2D1: db $0B,$FC,$FF
DATA8_09D2D4:
#_09D2D4: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09D2DC: db $9A,$F9,$50,$34,$30,$3D,$CF,$29
#_09D2E4: db $58,$38,$3E,$CF,$F2,$5C,$41,$CF
#_09D2EC: db $26,$58,$34,$43,$43,$F9,$2A,$28
#_09D2F4: db $58,$37,$2E,$39,$26,$52,$A9,$31
#_09D2FC: db $FC,$FF
DATA8_09D2FE:
#_09D2FE: db $D6,$00,$89,$70,$28,$4F,$27,$A2
#_09D306: db $52,$9A,$F9,$39,$52,$38,$27,$3D
#_09D30E: db $42,$27,$3A,$CF,$35,$2A,$68,$8D
#_09D316: db $85,$6C,$5A,$9C,$CF,$25,$58,$37
#_09D31E: db $F9,$A6,$26,$3E,$2A,$26,$3D,$38
#_09D326: db $2B,$CF,$29,$29,$A4,$26,$CF,$3A
#_09D32E: db $9F,$2E,$52,$A6,$FC,$FA,$A6,$9C
#_09D336: db $39,$CF,$7C,$67,$5E,$85,$3D,$CF
#_09D33E: db $35,$57,$2C,$9F,$2B,$51,$CF,$27
#_09D346: db $2D,$37,$F9,$A4,$52,$46,$36,$30
#_09D34E: db $34,$33,$27,$A2,$55,$FC,$FF
DATA8_09D355:
#_09D355: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09D35D: db $9A,$F9,$2E,$2E,$2A,$4B,$CF,$44
#_09D365: db $39,$44,$3A,$CF,$29,$33,$4F,$30
#_09D36D: db $26,$CF,$61,$72,$9C,$F9,$31,$44
#_09D375: db $36,$26,$37,$26,$4D,$33,$27,$A6
#_09D37D: db $FC,$FA,$47,$27,$CF,$39,$52,$3A
#_09D385: db $52,$47,$CF,$2C,$50,$4E,$34,$4B
#_09D38D: db $30,$26,$F9,$29,$29,$CF,$2A,$44
#_09D395: db $4A,$CF,$50,$34,$30,$51,$CF,$29
#_09D39D: db $43,$47,$4C,$2C,$A6,$2F,$26,$FC
#_09D3A5: db $FF
DATA8_09D3A6:
#_09D3A6: db $D2,$36,$36,$D6,$00,$A5,$70,$28
#_09D3AE: db $F2,$6D,$9A,$F9,$25,$39,$34,$47
#_09D3B6: db $CF,$F2,$6D,$3D,$CF,$4A,$27,$A9
#_09D3BE: db $31,$3C,$F9,$A2,$AD,$52,$3D,$CF
#_09D3C6: db $71,$62,$7B,$9C,$F9,$26,$35,$AB
#_09D3CE: db $52,$36,$4A,$26,$38,$CF,$29,$47
#_09D3D6: db $58,$37,$43,$31,$3C,$FC,$FA,$A9
#_09D3DE: db $47,$CF,$33,$4E,$3E,$CF,$43,$35
#_09D3E6: db $9C,$58,$37,$43,$31,$F9,$39,$A4
#_09D3EE: db $39,$4B,$CF,$50,$34,$30,$3D,$CF
#_09D3F6: db $71,$62,$7B,$9C,$F9,$26,$35,$AB
#_09D3FE: db $52,$CF,$36,$4A,$26,$2A,$4B,$A9
#_09D406: db $31,$FC,$DE,$00,$00,$D2,$08,$FA
#_09D40E: db $2F,$25,$CF,$F5,$2F,$52,$CF,$A9
#_09D416: db $37,$4B,$58,$30,$55,$26,$FC,$D6
#_09D41E: db $00,$00,$FE,$07,$78,$D5,$39,$E4
#_09D426: db $00,$E5,$01,$2F
DATA8_09D42A:
#_09D42A: db $E5,$00,$2F,$D3,$2E
DATA8_09D42F:
#_09D42F: db $E7,$00,$FE,$07,$78,$D6,$00,$A5
#_09D437: db $70,$28,$F2,$6D,$9A,$F9,$39,$2A
#_09D43F: db $39,$2A,$CF,$48,$4C,$43,$31,$3C
#_09D447: db $F9,$37,$A0,$34,$28,$9C,$CF,$25
#_09D44F: db $58,$37,$CF,$27,$4E,$30,$26,$A9
#_09D457: db $31,$3C,$FC,$FA,$DE,$00,$00,$DF
#_09D45F: db $08,$A9,$3E,$CF,$F5,$2F,$52,$3D
#_09D467: db $CF,$A9,$AB,$52,$A9,$31,$FC,$D6
#_09D46F: db $00,$00,$FE,$07,$78,$D5,$39,$E4
#_09D477: db $00,$E5,$01,$31
DATA8_09D47B:
#_09D47B: db $E5,$00,$31,$D3,$30
DATA8_09D480:
#_09D480: db $E7,$00,$FE,$07,$78,$D6,$00,$A5
#_09D488: db $70,$28,$F2,$6D,$9A,$F9,$49,$A6
#_09D490: db $52,$30,$37,$43,$30,$34,$4A,$F9
#_09D498: db $A9,$3E,$CF,$42,$52,$2B,$51,$CF
#_09D4A0: db $A6,$31,$38,$CF,$30,$43,$30,$57
#_09D4A8: db $27,$FC,$FA,$D6,$00,$00,$DE,$00
#_09D4B0: db $00,$D6,$08,$FE,$07,$78,$D5,$39
#_09D4B8: db $E4,$00,$E5,$01,$33
DATA8_09D4BD:
#_09D4BD: db $E5,$00,$33,$D3,$32
DATA8_09D4C2:
#_09D4C2: db $E7,$00,$FE,$07,$78,$D6,$00,$A5
#_09D4CA: db $70,$28,$F2,$6D,$9A,$F9,$50,$34
#_09D4D2: db $30,$3D,$CF,$5D,$64,$7B,$2F,$52
#_09D4DA: db $34,$35,$9C,$F2,$0B,$F9,$29,$CF
#_09D4E2: db $29,$AF,$28,$37,$4B,$58,$30,$55
#_09D4EA: db $26,$F2,$0B,$FC,$D6,$00,$00,$D0
#_09D4F2: db $36,$D4,$03,$97
DATA8_09D4F6:
#_09D4F6: db $E1,$FD,$F1,$3E,$CF,$F3,$51,$F9
#_09D4FE: db $FE,$3C,$35,$F2,$2D,$FC,$FE,$28
#_09D506: db $FF
DATA8_09D507:
#_09D507: db $44,$36,$2D,$34,$9C,$CF,$47,$35
#_09D50F: db $47,$3D,$9C,$CF,$26,$58,$B0,$26
#_09D517: db $A9,$F9,$47,$37,$39,$2A,$58,$34
#_09D51F: db $FC,$FF
DATA8_09D521:
#_09D521: db $97,$F2,$2C,$FC,$DD,$FD,$34,$FF
DATA8_09D529:
#_09D529: db $D6,$00,$6B,$60,$28,$D2,$0C,$39
#_09D531: db $D2,$7E,$38,$D3,$4B
DATA8_09D536:
#_09D536: db $97,$F2,$68,$F8,$3A,$FF
DATA8_09D53C:
#_09D53C: db $97,$F2,$89,$F8,$3A,$FF
DATA8_09D542:
#_09D542: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09D54A: db $D6,$00,$00,$D2,$0C,$3B,$FE,$1A
#_09D552: db $52,$5A,$0E,$00,$00,$00,$D0,$0C
#_09D55A: db $FF
DATA8_09D55B:
#_09D55B: db $FE,$1A,$50,$DA,$0E,$00,$00,$00
#_09D563: db $D1,$0C,$FF
DATA8_09D566:
#_09D566: db $D6,$00,$6B,$60,$28,$D2,$0C,$3E
#_09D56E: db $D2,$7E,$3D,$D3,$4B
DATA8_09D573:
#_09D573: db $97,$F2,$68,$F8,$3F,$FF
DATA8_09D579:
#_09D579: db $97,$F2,$89,$F8,$3F,$FF
DATA8_09D57F:
#_09D57F: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09D587: db $D6,$00,$00,$D2,$0C,$40,$FE,$1A
#_09D58F: db $55,$9B,$0E,$00,$00,$00,$D0,$0C
#_09D597: db $FF
DATA8_09D598:
#_09D598: db $FE,$1A,$55,$19,$0E,$00,$00,$00
#_09D5A0: db $D1,$0C,$FF
DATA8_09D5A3:
#_09D5A3: db $D6,$00,$6B,$60,$28,$D2,$0C,$43
#_09D5AB: db $D2,$7E,$42,$D3,$4B
DATA8_09D5B0:
#_09D5B0: db $97,$F2,$68,$F8,$44,$FF
DATA8_09D5B6:
#_09D5B6: db $97,$F2,$89,$F8,$44,$FF
DATA8_09D5BC:
#_09D5BC: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09D5C4: db $D6,$00,$00,$D2,$0C,$45,$FE,$1A
#_09D5CC: db $54,$DE,$0E,$00,$00,$00,$D0,$0C
#_09D5D4: db $FF
DATA8_09D5D5:
#_09D5D5: db $FE,$1A,$56,$5E,$0E,$00,$00,$00
#_09D5DD: db $D1,$0C,$FF
DATA8_09D5E0:
#_09D5E0: db $D6,$00,$6B,$60,$28,$D2,$0C,$48
#_09D5E8: db $D2,$7E,$47,$D3,$4B
DATA8_09D5ED:
#_09D5ED: db $97,$F2,$68,$F8,$49,$FF
DATA8_09D5F3:
#_09D5F3: db $97,$F2,$89,$F8,$49,$FF
DATA8_09D5F9:
#_09D5F9: db $D6,$00,$74,$60,$28,$FE,$07,$03
#_09D601: db $D6,$00,$00,$D2,$0C,$4A,$FE,$1A
#_09D609: db $51,$1D,$0E,$00,$00,$00,$D0,$0C
#_09D611: db $FF
DATA8_09D612:
#_09D612: db $FE,$1A,$51,$9F,$0E,$00,$00,$00
#_09D61A: db $D1,$0C,$FF
DATA8_09D61D:
#_09D61D: db $97,$F2,$69,$FC,$FF
DATA8_09D622:
#_09D622: db $D7,$B2,$33,$FE,$1C,$00,$D2,$0C
#_09D62A: db $02
DATA8_09D62B:
#_09D62B: db $D7,$B2,$33
DATA8_09D62E:
#_09D62E: db $D2,$52,$07,$D5,$46,$D6,$00,$AB
#_09D636: db $68,$18,$D2,$50,$04,$D0,$4F,$97
#_09D63E: db $F2,$00,$9C,$CF,$30,$AB,$4B,$4E
#_09D646: db $37,$26,$4D,$FC,$E9,$00,$03,$FA
#_09D64E: db $F2,$45
DATA8_09D650:
#_09D650: db $FF
DATA8_09D651:
#_09D651: db $D6,$01,$B1,$98,$38,$F2,$46,$9A
#_09D659: db $F9,$D2,$0C,$06,$D2,$53,$05,$2E
#_09D661: db $3D,$CF,$29,$52,$39,$3D,$2E,$9C
#_09D669: db $CF,$F0,$2C,$52,$3A,$F9,$34,$31
#_09D671: db $2D,$51,$CF,$47,$38,$46,$37,$26
#_09D679: db $4D,$52,$A6,$FC,$FA,$39,$3A,$2A
#_09D681: db $9C,$CF,$32,$26,$30,$52,$3D,$29
#_09D689: db $2C,$40,$2A,$2C,$3A,$F9,$3E,$26
#_09D691: db $4C,$2E,$52,$A9,$26,$4D,$F9,$33
#_09D699: db $26,$36,$51,$CF,$38,$4C,$3D,$A5
#_09D6A1: db $2A,$39,$26,$38,$CF,$26,$2D,$39
#_09D6A9: db $26,$4A,$27,$A6,$FC,$FA,$29,$4E
#_09D6B1: db $51,$CF,$34,$31,$2D,$37,$2C,$4E
#_09D6B9: db $34,$CF,$4E,$26,$3A,$F9,$29,$52
#_09D6C1: db $39,$3D,$2E,$3D,$CF,$F2,$71,$3A
#_09D6C9: db $F9,$36,$4E,$37,$26,$58,$37,$48
#_09D6D1: db $4F,$27,$FC,$FA
DATA8_09D6D5:
#_09D6D5: db $A9,$3E,$CF,$F2,$71,$41,$F9,$26
#_09D6DD: db $2C,$A5,$94,$FC,$FE,$1C,$01,$FA
#_09D6E5: db $D6,$01,$00,$D6,$00,$00,$D7,$FF
#_09D6ED: db $FE,$1B,$7F,$84,$18,$00,$07,$11
#_09D6F5: db $D3,$15
DATA8_09D6F7:
#_09D6F7: db $9F,$52,$A2,$36,$3D,$CF,$32,$2A
#_09D6FF: db $26,$3A,$CF,$47,$AA,$58,$37,$2B
#_09D707: db $34,$A5,$F9,$43,$34,$CF,$F2,$71
#_09D70F: db $41,$CF,$3E,$26,$4D,$39,$4B,$F9
#_09D717: db $2E,$2E,$3A,$CF,$2B,$37,$2C,$4E
#_09D71F: db $FC,$FA,$3E,$48,$2C,$CF,$F2,$71
#_09D727: db $3A,$CF,$3E,$26,$4C,$2E,$52,$A6
#_09D72F: db $5D,$64,$7B,$51,$F9,$34,$29,$2F
#_09D737: db $39,$26,$38,$CF,$2E,$3D,$29,$52
#_09D73F: db $39,$3D,$2E,$3E,$F9,$2A,$4B,$A6
#_09D747: db $51,$CF,$3D,$58,$38,$4B,$4E,$37
#_09D74F: db $30,$43,$27,$2A,$4B,$39,$FC,$D1
#_09D757: db $0C,$D3,$08
DATA8_09D75A:
#_09D75A: db $D2,$54,$09,$D5,$47,$D6,$01,$B1
#_09D762: db $90,$38,$D6,$00,$A9,$70,$28,$FE
#_09D76A: db $62,$F2,$46,$9A,$F9,$29,$52,$39
#_09D772: db $3D,$2E,$3E,$CF,$34,$31,$2A,$58
#_09D77A: db $34,$A4,$F2,$0B,$F9,$2E,$4E,$A9
#_09D782: db $CF,$29,$4E,$3D,$CF,$48,$2C,$46
#_09D78A: db $3E,$CF,$29,$50,$4C,$A6,$F9,$25
#_09D792: db $38,$3E,$CF,$4A,$4F,$30,$2C,$CF
#_09D79A: db $48,$58,$37,$2C,$4E,$CF,$78,$78
#_09D7A2: db $78,$FC,$D6,$01,$00,$D4,$03,$ED
#_09D7AA: db $9A,$F9,$F2,$0B,$F0,$F2,$0B,$F9
#_09D7B2: db $25,$39,$34,$9C,$CF,$34,$31,$2D
#_09D7BA: db $37,$2C,$4E,$34,$3D,$3C,$FC,$FA
#_09D7C2: db $50,$34,$30,$CF,$27,$43,$4E,$2A
#_09D7CA: db $50,$58,$37,$F9,$2E,$3D,$32,$2A
#_09D7D2: db $26,$3A,$CF,$2B,$34,$3D,$3C,$F2
#_09D7DA: db $0B,$F9,$42,$2A,$3D,$2E,$38,$3E
#_09D7E2: db $CF,$A4,$52,$AD,$50,$31,$4E,$34
#_09D7EA: db $2D,$AA,$FC,$FA,$25,$39,$34,$3D
#_09D7F2: db $2E,$38,$A6,$2D,$3E,$CF,$50,$31
#_09D7FA: db $4E,$39,$2A,$58,$34,$F9,$50,$34
#_09D802: db $30,$3D,$CF,$2F,$A6,$46,$3E,$F9
#_09D80A: db $F2,$0B,$25,$39,$34,$38,$CF,$38
#_09D812: db $47,$3A,$CF,$31,$31,$52,$A9,$26
#_09D81A: db $2C,$2E,$38,$FC,$FA,$AA,$2E,$43
#_09D822: db $A9,$47,$CF,$26,$2C,$50,$CF,$26
#_09D82A: db $58,$30,$57,$3A,$FC,$FA,$FE,$26
#_09D832: db $01,$97,$ED,$9C,$CF,$F2,$2F,$FC
#_09D83A: db $D0,$54,$D1,$0C
DATA8_09D83E:
#_09D83E: db $FE,$1A,$58,$8F,$06,$00,$07,$11
#_09D846: db $FF
DATA8_09D847:
#_09D847: db $97,$F2,$2C,$FC,$FF
DATA8_09D84C:
#_09D84C: db $D2,$55,$12,$D5,$45,$D7,$81,$2B
#_09D854: db $D6,$00,$3F,$70,$28,$F2,$33,$30
#_09D85C: db $52,$B2,$9A,$F9,$D2,$51,$0B,$32
#_09D864: db $58,$2A,$2C,$CF,$29,$2E,$30,$26
#_09D86C: db $34,$A6,$26,$34,$3D,$3A,$F9
DATA8_09D873:
#_09D873: db $50,$9C,$CF,$F2,$33,$2A,$26,$3E
#_09D87B: db $D2,$51,$0D,$CF,$A9,$2B,$37,$29
#_09D883: db $4C,$43,$32,$52,$FC,$FA,$A2,$36
#_09D88B: db $3E,$CF,$50,$4E,$4B,$3D,$7E,$68
#_09D893: db $5D,$3A,$CF,$5D,$64,$7B,$9C,$38
#_09D89B: db $4C,$36,$26,$37,$26,$4D,$F9,$39
#_09D8A3: db $AA,$38,$26,$27,$CF,$C2,$7B,$9C
#_09D8AB: db $CF,$3F,$4F,$9C,$58,$37,$30,$43
#_09D8B3: db $26,$F9,$2B,$40,$9C,$CF,$25,$36
#_09D8BB: db $43,$4B,$39,$2C,$CF,$39,$58,$37
#_09D8C3: db $30,$43,$58,$34,$3D,$A9,$31,$FC
#_09D8CB: db $FA,$AA,$27,$2A,$CF,$2A,$44,$3D
#_09D8D3: db $34,$46,$F9,$2A,$44,$3A,$CF,$31
#_09D8DB: db $2C,$26,$51,$47,$38,$46,$4D,$CF
#_09D8E3: db $3F,$38,$AC,$38,$3D,$34,$46,$F9
#_09D8EB: db $5C,$02,$01,$01,$01,$42,$AA,$CF
#_09D8F3: db $2B,$40,$51,$CF,$F2,$4A,$F8,$0E
#_09D8FB: db $F2,$0B,$33,$27,$A9,$31,$2A,$F9
#_09D903: db $D3,$11
DATA8_09D905:
#_09D905: db $FA,$F2,$31,$F9,$2B,$57,$27,$2A
#_09D90D: db $26,$3D,$CF,$2A,$52,$32,$26,$3A
#_09D915: db $F9,$43,$34,$CF,$26,$58,$B4,$CF
#_09D91D: db $35,$2A,$A8,$2B,$43,$30,$34,$F9
#_09D925: db $25,$39,$34,$3A,$CF,$2A,$44,$3D
#_09D92D: db $CF,$A0,$2A,$A0,$3D,$CF,$25,$4B
#_09D935: db $52,$2E,$38,$51,$F2,$0B,$FC,$FF
DATA8_09D93D:
#_09D93D: db $43,$47,$39,$2C,$CF,$2A,$52,$32
#_09D945: db $26,$30,$43,$31,$F9,$44,$39,$2F
#_09D94D: db $52,$3D,$CF,$29,$2A,$9F,$A9,$31
#_09D955: db $F9,$F2,$31,$FC,$FF
DATA8_09D95A:
#_09D95A: db $39,$52,$38,$CF,$4A,$26,$29,$2E
#_09D962: db $2E,$4F,$9C,$2D,$A9,$30,$57,$27
#_09D96A: db $F9,$2A,$44,$3E,$CF,$2B,$58,$38
#_09D972: db $CF,$A0,$4B,$52,$3A,$39,$58,$37
#_09D97A: db $CF,$29,$4C,$43,$31,$A5,$FC,$FE
#_09D982: db $48,$10,$FE,$49,$0F,$D3,$0C
DATA8_09D989:
#_09D989: db $FA,$29,$29,$CF,$25,$39,$34,$3D
#_09D991: db $CF,$2B,$40,$3A,$4A,$58,$37,$F9
#_09D999: db $F2,$33,$2A,$26,$9C,$CF,$2A,$52
#_09D9A1: db $32,$26,$30,$43,$31,$A5,$FC,$FA
#_09D9A9: db $2A,$44,$47,$CF,$29,$4A,$4F,$2E
#_09D9B1: db $AC,$3D,$CF,$2E,$38,$A9,$30,$57
#_09D9B9: db $27,$F9,$36,$2B,$9C,$CF,$40,$34
#_09D9C1: db $43,$50,$4C,$31,$4D,$2E,$4F,$3A
#_09D9C9: db $3E,$F9,$50,$9C,$CF,$F2,$33,$2A
#_09D9D1: db $26,$9C,$CF,$A9,$2B,$25,$9C,$4C
#_09D9D9: db $43,$31,$FC,$D0,$51,$FE,$02,$F0
#_09D9E1: db $D3,$0C
DATA8_09D9E3:
#_09D9E3: db $FA,$25,$43,$4C,$CF,$29,$2A,$3C
#_09D9EB: db $51,$CF,$47,$58,$37,$26,$39,$26
#_09D9F3: db $4A,$27,$A9,$31,$3C,$F9
DATA8_09D9F9:
#_09D9F9: db $A9,$3E,$CF,$43,$34,$3D,$CF,$2B
#_09DA01: db $2A,$26,$3A,$CF,$F2,$4A,$FC,$FF
DATA8_09DA09:
#_09DA09: db $FE,$1D,$63,$80
DATA8_09DA0D:
#_09DA0D: db $D6,$00,$49,$78,$28,$F2,$33,$38
#_09DA15: db $9A,$F9,$D2,$52,$14,$25,$25,$CF
#_09DA1D: db $39,$52,$A9,$CF,$2E,$52,$39,$2E
#_09DA25: db $38,$3A,$F2,$0B,$F9,$7E,$68,$5D
#_09DA2D: db $2F,$43,$3A,$CF,$5D,$64,$7B,$9C
#_09DA35: db $CF,$38,$4C,$36,$26,$37,$30,$43
#_09DA3D: db $27,$39,$52,$37,$FC,$FA,$2B,$58
#_09DA45: db $38,$CF,$F2,$34,$38,$3D,$F9,$30
#_09DA4D: db $50,$A1,$3A,$CF,$35,$9C,$26,$39
#_09DA55: db $26,$50,$F2,$0B,$F9,$F2,$4A,$DF
#_09DA5D: db $DF,$F9,$7E,$68,$5D,$2F,$43,$51
#_09DA65: db $CF,$34,$31,$2D,$37,$2C,$A6,$2F
#_09DA6D: db $26,$FC,$FF
DATA8_09DA70:
#_09DA70: db $F2,$0B,$25,$25,$F2,$0B,$7E,$68
#_09DA78: db $5D,$2F,$43,$9C,$CF,$26,$58,$37
#_09DA80: db $30,$43,$50,$4E,$4D,$F9,$3D,$2E
#_09DA88: db $2F,$4E,$34,$CF,$50,$34,$30,$3E
#_09DA90: db $CF,$26,$58,$34,$26,$AA,$27,$31
#_09DA98: db $4E,$AB,$F2,$0B,$FC,$FF
DATA8_09DA9E:
#_09DA9E: db $FE,$37,$FE,$1C,$00
DATA8_09DAA3:
#_09DAA3: db $D5,$47,$D6,$00,$B1,$70,$38,$F2
#_09DAAB: db $46,$9A,$F9,$D2,$52,$1A,$D2,$0C
#_09DAB3: db $18,$F2,$71,$3A,$CF,$3E,$26,$58
#_09DABB: db $34,$A5,$FC,$D2,$53,$17,$FA,$F2
#_09DAC3: db $0B,$29,$2C,$2A,$4B,$CF,$34,$A6
#_09DACB: db $4A,$58,$37,$2C,$4D,$F9,$39,$3A
#_09DAD3: db $2A,$9C,$F2,$0B,$CF,$AA,$31,$9E
#_09DADB: db $4F,$26,$CF,$27,$A3,$9C,$F2,$0B
#_09DAE3: db $FC,$A6,$46,$A6,$94,$F9,$29,$4E
#_09DAEB: db $3E,$CF,$29,$2C,$43,$A9,$CF,$26
#_09DAF3: db $2D,$39,$26,$F9,$2E,$50,$26,$52
#_09DAFB: db $A6,$94,$F9,$50,$4D,$26,$9C,$CF
#_09DB03: db $2B,$44,$34,$35,$A6,$2D,$A9,$CF
#_09DB0B: db $26,$58,$37,$2C,$4E,$FC,$D0,$53
DATA8_09DB13:
#_09DB13: db $FA,$29,$4E,$3E,$CF,$2E,$2E,$A9
#_09DB1B: db $CF,$43,$58,$37,$26,$4D,$F9,$9F
#_09DB23: db $52,$A2,$36,$3D,$32,$2A,$26,$41
#_09DB2B: db $CF,$2A,$28,$4C,$34,$2D,$4E,$AB
#_09DB33: db $F9,$47,$AA,$58,$37,$2B,$37,$2C
#_09DB3B: db $4E,$FC,$D0,$0C,$FE,$1A,$7F,$85
#_09DB43: db $18,$00,$07,$11,$FF
DATA8_09DB48:
#_09DB48: db $4A,$2C,$CF,$47,$AA,$58,$37,$2B
#_09DB50: db $34,$39,$F9,$9F,$52,$A2,$36,$3D
#_09DB58: db $32,$2A,$26,$41,$CF,$2A,$28,$4C
#_09DB60: db $34,$26,$3D,$2A,$95,$F8,$19,$D4
#_09DB68: db $03,$33,$27,$2A,$CF,$29,$2C,$41
#_09DB70: db $CF,$26,$2C,$3D,$2A,$F9,$36,$26
#_09DB78: db $37,$26,$2D,$39,$2C,$37,$CF,$31
#_09DB80: db $43,$52,$9C,$F9,$25,$43,$4C,$CF
#_09DB88: db $45,$4C,$31,$4D,$39,$4A,$FC,$FE
#_09DB90: db $1A,$7F,$85,$18,$00,$07,$11,$FF
DATA8_09DB98:
#_09DB98: db $D4,$03,$A9,$3E,$CF,$F2,$71,$2A
#_09DBA0: db $4B,$CF,$33,$38,$41,$A9,$4A,$27
#_09DBA8: db $FC,$FA,$D1,$FF,$FE,$1C,$01,$D6
#_09DBB0: db $00,$00,$FE,$1B,$58,$0E,$06,$00
#_09DBB8: db $07,$11,$D3,$00
DATA8_09DBBC:
#_09DBBC: db $48,$58,$34,$39,$CF,$29,$52,$39
#_09DBC4: db $3D,$2E,$3E,$CF,$34,$31,$2A,$58
#_09DBCC: db $34,$A5,$F9,$AA,$31,$9E,$4F,$26
#_09DBD4: db $CF,$37,$2B,$26,$3D,$27,$A3,$3E
#_09DBDC: db $CF,$2B,$28,$34,$FC,$D3,$19
DATA8_09DBE3:
#_09DBE3: db $D7,$01,$D5,$45,$D6,$00,$23,$80
#_09DBEB: db $28,$D6,$01,$1C,$68,$38,$68,$69
#_09DBF3: db $6C,$5A,$9A,$F9,$F2,$0B,$26,$26
#_09DBFB: db $A9,$31,$2A,$95,$F9,$25,$39,$34
#_09DC03: db $3E,$CF,$28,$4B,$AB,$4E,$34,$CF
#_09DC0B: db $3A,$52,$9F,$52,$39,$3D,$A9,$31
#_09DC13: db $FC,$FA,$25,$39,$34,$3E,$CF,$25
#_09DC1B: db $4E,$3E,$37,$34,$32,$2A,$26,$51
#_09DC23: db $31,$2C,$27,$F9,$2B,$56,$27,$32
#_09DC2B: db $26,$30,$56,$CF,$7E,$68,$5D,$38
#_09DC33: db $39,$4D,$AE,$2C,$CF,$2F,$A6,$46
#_09DC3B: db $4B,$4E,$F9,$27,$43,$4E,$37,$2B
#_09DC43: db $34,$3D,$A9,$31,$FC,$FA,$7E,$68
#_09DC4B: db $5D,$38,$CF,$39,$58,$37,$CF,$2A
#_09DC53: db $44,$3D,$47,$38,$3A,$F9,$3F,$38
#_09DC5B: db $AC,$38,$51,$CF,$44,$35,$AC,$2C
#_09DC63: db $3D,$9C,$F9,$25,$39,$34,$3D,$CF
#_09DC6B: db $2F,$A6,$46,$39,$3D,$A9,$31,$F2
#_09DC73: db $0B,$FC,$FF
DATA8_09DC76:
#_09DC76: db $D7,$37,$D2,$52,$1F,$D5,$46,$DE
#_09DC7E: db $01,$00,$08,$01,$E4,$00,$F5,$9A
#_09DC86: db $F9,$A6,$4E,$A6,$94,$95,$CF,$25
#_09DC8E: db $34,$30,$3D,$CF,$34,$3D,$30,$26
#_09DC96: db $A2,$2A,$52,$51,$F9,$A2,$55,$43
#_09DC9E: db $31,$4D,$80,$6E,$3E,$FC,$FA,$3A
#_09DCA6: db $52,$9F,$52,$CF,$2A,$95,$CF,$47
#_09DCAE: db $27,$31,$2E,$30,$A9,$CF,$2E,$3D
#_09DCB6: db $45,$31,$46,$3E,$F9,$25,$34,$30
#_09DCBE: db $3D,$CF,$47,$3D,$3A,$CF,$39,$4D
#_09DCC6: db $38,$2E,$4F,$39,$52,$A6,$F9,$A2
#_09DCCE: db $55,$43,$3E,$CF,$2F,$32,$39,$26
#_09DCD6: db $4A,$94,$FC,$D5,$39,$E5,$01,$1E
DATA8_09DCDE:
#_09DCDE: db $E5,$00,$1E,$D3,$1D
DATA8_09DCE3:
#_09DCE3: db $E7,$00,$FE,$07,$78
DATA8_09DCE8:
#_09DCE8: db $D5,$47,$D6,$00,$1E,$78,$28,$FE
#_09DCF0: db $45,$00,$01,$F2,$00,$3D,$26,$30
#_09DCF8: db $2B,$9A,$F9,$50,$34,$30,$3E,$CF
#_09DD00: db $34,$31,$2A,$58,$34,$3D,$3C,$94
#_09DD08: db $FC,$FA,$F2,$0B,$25,$4C,$9C,$38
#_09DD10: db $27,$F9,$3E,$48,$2C,$CF,$47,$AA
#_09DD18: db $58,$37,$2B,$37,$FC,$D1,$4B,$D1
#_09DD20: db $4F,$D0,$52,$D0,$FF,$FF
DATA8_09DD26:
#_09DD26: db $D6,$00,$0E,$70,$38,$F2,$33,$38
#_09DD2E: db $9A,$F9,$43,$47,$39,$2C,$CF,$F2
#_09DD36: db $33,$3D,$CF,$32,$26,$35,$CF,$F2
#_09DD3E: db $5C,$9C,$F9,$A9,$2B,$25,$9C,$4D
#_09DD46: db $4A,$FC,$FA,$F2,$5C,$9C,$CF,$A9
#_09DD4E: db $2B,$25,$9C,$4E,$AB,$CF,$2A,$44
#_09DD56: db $9C,$CF,$29,$26,$A9,$3A,$39,$4C
#_09DD5E: db $F9,$41,$26,$50,$39,$CF,$32,$2A
#_09DD66: db $26,$9C,$CF,$29,$38,$A3,$4E,$4D
#_09DD6E: db $F2,$0B,$F9,$F2,$33,$CF,$AB,$52
#_09DD76: db $A1,$26,$94,$FC,$FA,$F2,$5C,$3D
#_09DD7E: db $AB,$30,$57,$95,$FC,$FE,$04,$22
#_09DD86: db $21,$D3,$21
DATA8_09DD89:
#_09DD89: db $FA,$26,$2B,$57,$27,$38,$3A,$3E
#_09DD91: db $CF,$29,$30,$28,$4B,$4E,$39,$26
#_09DD99: db $4A,$FC,$FF
DATA8_09DD9C:
#_09DD9C: db $FA,$F2,$1C,$93,$C7,$5E,$3A,$CF
#_09DDA4: db $36,$2C,$4B,$4E,$37,$26,$4D,$4A
#_09DDAC: db $F9,$F2,$4C,$51,$CF,$38,$29,$4B
#_09DDB4: db $39,$26,$38,$F9,$27,$44,$3A,$3E
#_09DDBC: db $CF,$26,$2A,$4E,$39,$26,$4A,$94
#_09DDC4: db $FC,$FF
DATA8_09DDC6:
#_09DDC6: db $D6,$00,$85,$70,$28,$F2,$33,$38
#_09DDCE: db $9A,$F9,$F2,$5C,$2A,$52,$32,$26
#_09DDD6: db $3E,$CF,$4A,$4F,$2E,$52,$A9,$26
#_09DDDE: db $26,$9C,$F9,$AB,$2C,$A6,$26,$39
#_09DDE6: db $CF,$F2,$56,$9C,$CF,$3F,$36,$4A
#_09DDEE: db $27,$A6,$FC,$FA,$26,$58,$34,$26
#_09DDF6: db $CF,$AA,$27,$48,$58,$37,$CF,$36
#_09DDFE: db $2C,$4C,$A6,$31,$3D,$2A,$F2,$0B
#_09DE06: db $FC,$FF
DATA8_09DE08:
#_09DE08: db $D6,$00,$88,$70,$28,$29,$52,$39
#_09DE10: db $9A,$F9,$F2,$4C,$3A,$3E,$CF,$5D
#_09DE18: db $64,$7B,$51,$CF,$40,$27,$26,$52
#_09DE20: db $A9,$2B,$4D,$F9,$36,$AF,$9C,$CF
#_09DE28: db $25,$4D,$33,$27,$4A,$F9,$33,$4E
#_09DE30: db $9C,$25,$4E,$AB,$CF,$5D,$64,$7B
#_09DE38: db $39,$52,$37,$CF,$2E,$50,$2C,$39
#_09DE40: db $26,$3D,$3A,$FC,$FF
DATA8_09DE45:
#_09DE45: db $D6,$00,$87,$70,$28,$29,$38,$2E
#_09DE4D: db $9A,$F9,$29,$4E,$3E,$CF,$F2,$5C
#_09DE55: db $41,$CF,$26,$2B,$34,$26,$3D,$A6
#_09DE5D: db $9C,$F2,$0B,$F9,$D2,$57,$26,$F2
#_09DE65: db $4C,$3A,$CF,$2D,$58,$2A,$26,$9C
#_09DE6D: db $CF,$3E,$4B,$4E,$37,$26,$4D,$34
#_09DE75: db $46,$F9,$33,$3D,$2F,$2B,$41,$CF
#_09DE7D: db $26,$2D,$39,$26,$52,$A6,$FC,$FF
DATA8_09DE85:
#_09DE85: db $28,$28,$58,$CF,$F2,$4C,$3D,$CF
#_09DE8D: db $2D,$58,$2A,$26,$3E,$F9,$38,$2D
#_09DE95: db $34,$3D,$2A,$FC,$FF
DATA8_09DE9A:
#_09DE9A: db $D6,$00,$89,$70,$28,$4F,$27,$A2
#_09DEA2: db $52,$9A,$F9,$D2,$52,$28,$F2,$18
#_09DEAA: db $3A,$CF,$32,$26,$30,$52,$3D,$39
#_09DEB2: db $2A,$3A,$F9,$3E,$26,$4C,$2E,$46
#_09DEBA: db $4D,$CF,$3F,$38,$9C,$CF,$26,$4D
#_09DEC2: db $38,$F9,$2B,$26,$34,$2E,$38,$9C
#_09DECA: db $25,$4D,$FC,$FA,$D2,$52,$28,$33
#_09DED2: db $3D,$3F,$38,$39,$4B,$CF,$7E,$68
#_09DEDA: db $5D,$2F,$43,$3A,$CF,$38,$4C,$36
#_09DEE2: db $26,$34,$CF,$5D,$64,$7B,$51,$F9
#_09DEEA: db $34,$29,$31,$2E,$38,$9C,$CF,$A9
#_09DEF2: db $2B,$4D,$2A,$47,$30,$4E,$52,$F2
#_09DEFA: db $0B,$FC,$FF
DATA8_09DEFD:
#_09DEFD: db $4A,$3D,$39,$2A,$3A,$3E,$CF,$2A
#_09DF05: db $50,$58,$34,$3D,$27,$4C,$57,$2C
#_09DF0D: db $51,$F9,$47,$58,$34,$3F,$38,$47
#_09DF15: db $CF,$26,$4D,$47,$52,$A6,$F2,$0B
#_09DF1D: db $FC,$FF
DATA8_09DF1F:
#_09DF1F: db $D6,$00,$49,$78,$28,$F2,$33,$38
#_09DF27: db $9A,$F9,$72,$68,$3A,$CF,$29,$33
#_09DF2F: db $4F,$30,$26,$CF,$61,$72,$9C,$CF
#_09DF37: db $26,$4D,$58,$37,$CF,$5F,$88,$67
#_09DF3F: db $4A,$FC,$50,$34,$30,$3A,$3E,$CF
#_09DF47: db $2A,$44,$3D,$CF,$A0,$2A,$A0,$9C
#_09DF4F: db $25,$4D,$2A,$4B,$CF,$26,$26,$2D
#_09DF57: db $AA,$FC,$FF
DATA8_09DF5A:
#_09DF5A: db $D2,$F4,$42,$F7,$00,$3B,$F7,$06
#_09DF62: db $2B,$DE,$00,$00,$AB,$01,$D3,$3E
DATA8_09DF6A:
#_09DF6A: db $DE,$00,$00,$FD,$01,$D3,$3E
DATA8_09DF71:
#_09DF71: db $D2,$F4,$42,$F7,$00,$3B,$F7,$10
#_09DF79: db $2D,$DE,$00,$00,$70,$01,$D3,$3E
DATA8_09DF81:
#_09DF81: db $DE,$00,$00,$60,$01,$D3,$3E
DATA8_09DF88:
#_09DF88: db $D2,$F4,$42,$F7,$00,$3B,$F7,$08
#_09DF90: db $2F,$DE,$00,$00,$91,$01,$D3,$3E
DATA8_09DF98:
#_09DF98: db $DE,$00,$00,$98,$01,$D3,$3E
DATA8_09DF9F:
#_09DF9F: db $D2,$F4,$42,$F7,$00,$3B,$F7,$06
#_09DFA7: db $31,$DE,$00,$00,$6B,$01,$D3,$3E
DATA8_09DFAF:
#_09DFAF: db $DE,$00,$00,$28,$01,$D3,$3E
DATA8_09DFB6:
#_09DFB6: db $D2,$F4,$42,$F7,$00,$3B,$F7,$08
#_09DFBE: db $33,$DE,$00,$00,$EC,$01,$D3,$3E
DATA8_09DFC6:
#_09DFC6: db $DE,$00,$00,$A4,$01,$D3,$3E
DATA8_09DFCD:
#_09DFCD: db $D2,$F4,$42,$F7,$00,$3B,$F7,$10
#_09DFD5: db $35,$DE,$00,$00,$68,$01,$D3,$3E
DATA8_09DFDD:
#_09DFDD: db $DE,$00,$00,$F3,$01,$D3,$3E
DATA8_09DFE4:
#_09DFE4: db $D2,$F4,$42,$F7,$00,$3B,$F7,$04
#_09DFEC: db $37,$DE,$00,$00,$5C,$01,$D3,$3E
DATA8_09DFF4:
#_09DFF4: db $DE,$00,$00,$BC,$01,$D3,$3E
DATA8_09DFFB:
#_09DFFB: db $D2,$F4,$42,$F7,$00,$3B,$F7,$04
#_09E003: db $39,$DE,$00,$00,$4B,$01,$D3,$3E
DATA8_09E00B:
#_09E00B: db $DE,$00,$00,$BA,$01,$D3,$3E
DATA8_09E012:
#_09E012: db $D2,$F4,$42,$F7,$00,$3B,$DE,$00
#_09E01A: db $00,$84,$01,$D3,$3E
DATA8_09E01F:
#_09E01F: db $F7,$55,$3C,$DE,$01,$00,$23,$01
#_09E027: db $D3,$3E
DATA8_09E029:
#_09E029: db $F7,$AA,$3D,$DE,$01,$00,$24,$01
#_09E031: db $D3,$3E
DATA8_09E033:
#_09E033: db $DE,$01,$00,$25,$01
DATA8_09E038:
#_09E038: db $D5,$39,$E4,$00
DATA8_09E03C:
#_09E03C: db $E5,$01,$41
DATA8_09E03F:
#_09E03F: db $E5,$00,$41,$D3,$40
DATA8_09E044:
#_09E044: db $E7,$00,$FA,$D0,$F4,$FF
DATA8_09E04A:
#_09E04A: db $97,$F2,$2C,$FC,$FF
DATA8_09E04F:
#_09E04F: db $D6,$00,$6D,$60,$28,$D2,$E6,$01
#_09E057: db $97,$F2,$68,$F8,$02,$FF
DATA8_09E05D:
#_09E05D: db $97,$F2,$69,$FC,$FF
DATA8_09E062:
#_09E062: db $D6,$00,$76,$60,$28,$FE,$07,$03
#_09E06A: db $D6,$00,$00,$FE,$1A,$15,$08,$03
#_09E072: db $00,$03,$0B
DATA8_09E075:
#_09E075: db $D5,$45,$D7,$10,$D4,$03,$D2,$2F
#_09E07D: db $13,$D6,$07,$4E,$70,$28,$D2,$2D
#_09E085: db $05,$F2,$1B,$34,$26,$30,$9A,$F9
#_09E08D: db $21,$0F,$16,$0D,$19,$17,$0F,$94
#_09E095: db $18,$13,$0D,$0F,$CF,$1E,$19,$CF
#_09E09D: db $17,$0F,$0F,$1E,$CF,$23,$19,$1F
#_09E0A5: db $F9,$82,$5F,$66,$6B,$CF,$7C,$71
#_09E0AD: db $67,$8A,$FC,$FA,$88,$6C,$68,$B5
#_09E0B5: db $CF,$F2,$1B,$6C,$5E,$68,$75,$CF
#_09E0BD: db $70,$5A,$85,$7B,$8A,$CF,$C2,$69
#_09E0C5: db $F9,$5D,$71,$6C,$B5,$6C,$75,$CF
#_09E0CD: db $5F,$88,$67,$CF,$63,$5E,$6F,$7B
#_09E0D5: db $69,$F9,$BF,$5E,$62,$8A,$B8,$5E
#_09E0DD: db $C2,$69,$94,$FC
DATA8_09E0E1:
#_09E0E1: db $D4,$03,$88,$86,$88,$86,$76,$CF
#_09E0E9: db $7C,$71,$67,$8A,$89,$CF,$5D,$64
#_09E0F1: db $7B,$62,$83,$CF,$6C,$69,$65,$85
#_09E0F9: db $6C,$7E,$F9,$F2,$1B,$B7,$8A,$CF
#_09E101: db $BF,$68,$7B,$68,$6C,$F9,$68,$62
#_09E109: db $68,$F2,$0B,$7B,$BF,$CF,$6E,$82
#_09E111: db $64,$71,$5E,$C2,$69,$FC,$FA,$B9
#_09E119: db $70,$5F,$F2,$0B,$62,$86,$76,$CF
#_09E121: db $F2,$1C,$72,$F9,$7B,$61,$5F,$CF
#_09E129: db $85,$68,$78,$8B,$5A,$CF,$82,$C8
#_09E131: db $5F,$70,$CF,$68,$6F,$5E,$7B,$69
#_09E139: db $F9,$6B,$75,$7B,$60,$72,$CF,$62
#_09E141: db $86,$89,$CF,$6C,$61,$67,$71,$65
#_09E149: db $86,$C4,$CF,$71,$84,$7B,$6A,$8A
#_09E151: db $FC,$FA,$88,$86,$88,$86,$C2,$76
#_09E159: db $CF,$5D,$64,$7B,$72,$CF,$62,$71
#_09E161: db $5E,$7B,$6A,$8A,$F9,$5D,$71,$6C
#_09E169: db $B5,$6C,$71,$83,$CF,$62,$71,$5E
#_09E171: db $7B,$69,$F9,$61,$74,$B5,$5E,$C2
#_09E179: db $69,$CF,$B9,$70,$5F,$89,$CF,$6C
#_09E181: db $61,$68,$6F,$64,$BF,$67,$5E,$FC
#_09E189: db $D0,$2D,$FA,$5D,$71,$6C,$B5,$CF
#_09E191: db $6C,$69,$65,$6F,$64,$86,$86,$C4
#_09E199: db $F9,$F2,$1C,$72,$76,$CF,$79,$5E
#_09E1A1: db $88,$B5,$CF,$7F,$C3,$84,$F9,$7F
#_09E1A9: db $70,$75,$CF,$62,$92,$63,$89,$CF
#_09E1B1: db $70,$84,$7F,$C3,$69,$C2,$68,$91
#_09E1B9: db $5F,$FC,$FA,$D2,$29,$06,$D3,$07
DATA8_09E1C1:
#_09E1C1: db $D4,$03,$70,$5A,$85,$7B,$8A,$34
#_09E1C9: db $26,$30,$9A,$F9,$D2,$2B,$0A,$D2
#_09E1D1: db $2E,$08,$D2,$2A,$0D
DATA8_09E1D6:
#_09E1D6: db $7B,$BF,$CF,$65,$92,$68,$8A,$CF
#_09E1DE: db $6E,$63,$7B,$6A,$8A,$62,$95,$F9
#_09E1E6: db $88,$6C,$68,$75,$CF,$76,$71,$68
#_09E1EE: db $89,$CF,$7F,$5F,$02,$62,$5E,$CF
#_09E1F6: db $63,$63,$7B,$69,$62,$95,$F8,$04
#_09E1FE: db $D2,$29,$09
DATA8_09E201:
#_09E201: db $D4,$03,$6D,$91,$70,$CF,$5D,$6C
#_09E209: db $7B,$CF,$77,$80,$68,$6F,$CF,$62
#_09E211: db $8A,$B5,$60,$86,$C4,$F9,$63,$92
#_09E219: db $70,$CF,$6C,$69,$65,$6F,$64,$86
#_09E221: db $85,$70,$CF,$68,$8A,$BB,$6F,$7B
#_09E229: db $69,$FC,$D3,$14
DATA8_09E22D:
#_09E22D: db $7B,$BF,$CF,$B9,$70,$5F,$89,$CF
#_09E235: db $6C,$61,$68,$6F,$71,$5E,$CF,$C2
#_09E23D: db $69,$74,$F9,$5E,$6B,$5E,$C2,$CF
#_09E245: db $64,$BF,$67,$5E,$FC,$D3,$14
DATA8_09E24C:
#_09E24C: db $FA,$65,$92,$68,$8A,$CF,$68,$7B
#_09E254: db $68,$6C,$62,$95,$F9,$88,$6C,$68
#_09E25C: db $75,$CF,$6C,$75,$7C,$CF,$63,$5E
#_09E264: db $6F,$64,$86,$7B,$69,$62,$95,$F8
#_09E26C: db $12,$FA,$F2,$0B,$6B,$5F,$C2,$69
#_09E274: db $62,$CF,$C2,$76,$CF,$B9,$70,$5F
#_09E27C: db $89,$F9,$66,$75,$7B,$7B,$72,$CF
#_09E284: db $68,$6F,$61,$5E,$6F,$7F,$CF,$82
#_09E28C: db $5E,$75,$C2,$69,$62,$95,$F8,$0D
#_09E294: db $D3,$07
DATA8_09E296:
#_09E296: db $7F,$5F,$CF,$B9,$70,$5F,$89,$CF
#_09E29E: db $6C,$61,$68,$6C,$75,$C2,$69,$62
#_09E2A6: db $94,$95,$F9,$6B,$86,$76,$CF,$6B
#_09E2AE: db $86,$76,$F2,$0B,$FC
DATA8_09E2B3:
#_09E2B3: db $DE,$01,$00,$04,$01,$F2,$7C,$D6
#_09E2BB: db $07,$00,$F2,$7D,$E4,$00,$D2,$6A
#_09E2C3: db $0E,$F2,$0B,$A0,$2C,$4F,$27,$A6
#_09E2CB: db $58,$34,$39,$FC,$FA,$4A,$2C,$48
#_09E2D3: db $58,$37,$2C,$4E,$34,$F9,$2E,$3D
#_09E2DB: db $CF,$F6,$CF,$F5,$9C,$F9,$2A,$44
#_09E2E3: db $3A,$2A,$50,$58,$37,$CF,$42,$46
#_09E2EB: db $37,$CF,$36,$2A,$50,$33,$27,$FC
#_09E2F3: db $FA,$2E,$4E,$2A,$4B,$47,$CF,$2A
#_09E2FB: db $44,$3D,$34,$46,$3A,$CF,$3E,$34
#_09E303: db $4B,$26,$37,$2C,$4E,$4D,$2A,$95
#_09E30B: db $F8,$0C,$D3,$0E
DATA8_09E30F:
#_09E30F: db $D4,$03,$33,$4E,$3E,$CF,$30,$56
#_09E317: db $30,$57,$27,$39,$CF,$2E,$2E,$4F
#_09E31F: db $9C,$2D,$A6,$FC,$FA,$2E,$4E,$A9
#_09E327: db $CF,$B9,$70,$5F,$3D,$CF,$34,$2C
#_09E32F: db $4B,$44,$3E,$CF,$33,$30,$30,$34
#_09E337: db $9C,$F9,$31,$A9,$3A,$CF,$F2,$1C
#_09E33F: db $3A,$3E,$CF,$2A,$A3,$29,$29,$2C
#_09E347: db $3D,$F9,$5D,$64,$7B,$9C,$CF,$3E
#_09E34F: db $26,$4C,$2E,$52,$A9,$29,$4D,$FC
#_09E357: db $FA,$5D,$64,$7B,$3D,$45,$4E,$51
#_09E35F: db $CF,$42,$27,$45,$4C,$2F,$4D,$34
#_09E367: db $46,$3A,$F9,$2E,$3D,$CF,$F5,$9C
#_09E36F: db $F9,$76,$8A,$7B,$5A,$51,$CF,$40
#_09E377: db $4C,$29,$4F,$33,$27,$FC,$FA,$43
#_09E37F: db $47,$39,$2C,$CF,$F2,$1C,$3A,$F9
#_09E387: db $F2,$24,$9C,$CF,$35,$57,$2C,$9F
#_09E38F: db $2B,$31,$4D,$FC,$FA,$2D,$9C,$4E
#_09E397: db $34,$CF,$2B,$57,$28,$26,$3D,$43
#_09E39F: db $35,$CF,$F2,$1C,$3E,$F9,$5D,$64
#_09E3A7: db $7B,$47,$4F,$38,$47,$CF,$35,$A2
#_09E3AF: db $57,$27,$2A,$4B,$CF,$2B,$28,$2F
#_09E3B7: db $4D,$3D,$A6,$FC,$FA,$2E,$4E,$A9
#_09E3BF: db $CF,$F2,$21,$2D,$52,$32,$36,$3D
#_09E3C7: db $CF,$A2,$56,$52,$AC,$47,$F9,$31
#_09E3CF: db $31,$47,$27,$38,$CF,$26,$27,$47
#_09E3D7: db $3D,$FC,$A9,$3E,$CF,$2F,$4B,$AB
#_09E3DF: db $A6,$F2,$0B,$FC,$D3,$11
DATA8_09E3E5:
#_09E3E5: db $D4,$03,$D0,$6A,$F2,$0B,$6B,$5F
#_09E3ED: db $C2,$69,$62,$CF,$88,$6C,$68,$75
#_09E3F5: db $CF,$5E,$5F,$66,$70,$B5,$F2,$0B
#_09E3FD: db $FC,$D3,$0B
DATA8_09E400:
#_09E400: db $D4,$03,$2E,$3D,$CF,$50,$34,$30
#_09E408: db $3D,$CF,$26,$27,$2E,$38,$9C,$F9
#_09E410: db $F2,$0B,$2B,$2D,$3B,$38,$CF,$26
#_09E418: db $27,$3D,$2A,$94,$FC,$FA,$39,$4B
#_09E420: db $AB,$CF,$F2,$04,$3D,$CF,$26,$3D
#_09E428: db $35,$F9,$2E,$3D,$CF,$F6,$CF,$F5
#_09E430: db $9C,$F9,$26,$34,$A6,$2E,$27,$94
#_09E438: db $FC,$D5,$39,$E5,$01,$10
DATA8_09E43E:
#_09E43E: db $E5,$00,$10,$D3,$0F
DATA8_09E443:
#_09E443: db $F5,$9A,$F9,$F2,$0B,$43,$2F,$2A
#_09E44B: db $CF,$F2,$04,$3A,$CF,$43,$2D,$4A
#_09E453: db $27,$38,$3E,$F2,$0B,$F9,$A6,$9C
#_09E45B: db $CF,$31,$A9,$3A,$CF,$50,$9C,$CF
#_09E463: db $76,$8A,$7B,$5A,$3E,$CF,$40,$4C
#_09E46B: db $29,$4F,$2F,$4E,$34,$F9,$43,$47
#_09E473: db $39,$2C,$CF,$F2,$1C,$3A,$F9,$F2
#_09E47B: db $24,$9C,$CF,$35,$57,$2C,$9F,$2B
#_09E483: db $31,$4D,$FC,$FA,$F2,$1C,$3E,$CF
#_09E48B: db $5D,$64,$7B,$47,$4F,$38,$47,$F9
#_09E493: db $2B,$28,$2F,$4D,$3D,$A6,$F2,$0B
#_09E49B: db $F9,$2A,$44,$3D,$CF,$F2,$21,$3A
#_09E4A3: db $CF,$28,$26,$2E,$27,$25,$4E,$F2
#_09E4AB: db $0B,$FC,$FE,$02,$20
DATA8_09E4B0:
#_09E4B0: db $E7,$00,$D1,$34,$D1,$35,$D1,$36
#_09E4B8: db $D1,$0C,$D1,$0B,$FA,$FE,$3B,$D3
#_09E4C0: db $14
DATA8_09E4C1:
#_09E4C1: db $D4,$03,$19,$12,$94,$CF,$1E,$12
#_09E4C9: db $0B,$18,$15,$CF,$23,$19,$1F,$CF
#_09E4D1: db $20,$0F,$1C,$23,$CF,$17,$1F,$0D
#_09E4D9: db $12,$F9,$F2,$0B,$B9,$70,$5F,$89
#_09E4E1: db $CF,$6C,$61,$68,$6F,$74,$F9,$11
#_09E4E9: db $19,$19,$0E,$CF,$16,$1F,$0D,$15
#_09E4F1: db $94,$FC,$D0,$2E,$D3,$14
DATA8_09E4F7:
#_09E4F7: db $97,$F2,$2C,$FC
DATA8_09E4FB:
#_09E4FB: db $FE,$1A,$17,$48,$03,$00,$03,$0B
#_09E503: db $FF
DATA8_09E504:
#_09E504: db $FE,$2A,$D6,$03,$5F,$38,$48,$D6
#_09E50C: db $04,$5F,$88,$48,$D6,$00,$5E,$70
#_09E514: db $28,$F2,$1B,$41,$26,$9A,$F9,$79
#_09E51C: db $5E,$94,$CF,$66,$66,$76,$CF,$70
#_09E524: db $61,$86,$71,$5E,$74,$FC,$FF
DATA8_09E52B:
#_09E52B: db $D6,$00,$5E,$70,$28,$F2,$1B,$41
#_09E533: db $26,$9A,$F9,$D2,$E6,$1A,$D2,$0C
#_09E53B: db $18,$D2,$0D,$17,$70,$7B,$86,$94
#_09E543: db $CF,$70,$7B,$86,$71,$67,$5A,$5E
#_09E54B: db $94,$FC,$FA,$66,$62,$83,$67,$63
#_09E553: db $CF,$6C,$6D,$84,$63,$8A,$68,$CF
#_09E55B: db $C2,$5A,$69,$FC,$DD,$F2,$19,$FA
#_09E563: db $E1,$F0,$F2,$0B,$61,$5F,$CF,$F3
#_09E56B: db $CF,$7F,$6F,$7B,$69,$74,$F9,$D0
#_09E573: db $0D
DATA8_09E574:
#_09E574: db $C3,$BE,$CF,$61,$70,$84,$64,$BF
#_09E57C: db $67,$5E,$FC,$D0,$0C,$FE,$1B,$16
#_09E584: db $CD,$09,$00,$00,$00,$FF
DATA8_09E58A:
#_09E58A: db $B9,$64,$87,$67,$7B,$CF,$63,$5E
#_09E592: db $61,$6E,$65,$6F,$74,$FC
DATA8_09E598:
#_09E598: db $D1,$0C,$FE,$1A,$18,$4D,$09,$00
#_09E5A0: db $00,$00,$FF
DATA8_09E5A3:
#_09E5A3: db $71,$72,$CF,$5D,$88,$6F,$6F,$7B
#_09E5AB: db $69,$62,$95,$D3,$19
DATA8_09E5B0:
#_09E5B0: db $D5,$45,$D7,$23,$FE,$3A,$02,$00
#_09E5B8: db $FE,$07,$FF,$D2,$62,$15
DATA8_09E5BE:
#_09E5BE: db $D6,$01,$C3,$60,$20,$D6,$00,$C4
#_09E5C6: db $60,$20,$D2,$47,$03,$D2,$43,$02
#_09E5CE: db $E9,$03,$02,$EF,$9A,$F9,$44,$4F
#_09E5D6: db $4A,$CF,$F0,$CF,$EE,$F9,$25,$3D
#_09E5DE: db $C5,$85,$CF,$3D,$2E,$58,$37,$4D
#_09E5E6: db $A4,$94,$FC,$FA
DATA8_09E5EA:
#_09E5EA: db $97,$61,$5A,$87,$83,$CE,$8C,$BB
#_09E5F2: db $91,$8A,$3A,$3E,$F9,$3F,$38,$4C
#_09E5FA: db $3D,$CF,$F2,$33,$38,$9C,$CF,$27
#_09E602: db $36,$58,$37,$26,$4D,$FC,$FA
DATA8_09E609:
#_09E609: db $F2,$33,$38,$9A,$F9,$F2,$0B,$44
#_09E611: db $39,$2F,$52,$CF,$2A,$44,$51,$CF
#_09E619: db $30,$52,$A2,$4D,$3D,$A9,$31,$FC
#_09E621: db $FA,$35,$A2,$57,$27,$3D,$4B,$2C
#_09E629: db $28,$52,$CF,$F2,$21,$9C,$F9,$44
#_09E631: db $39,$2F,$52,$51,$CF,$43,$58,$37
#_09E639: db $26,$43,$31,$F9,$2A,$44,$41,$3D
#_09E641: db $CF,$25,$26,$51,$CF,$50,$31,$4E
#_09E649: db $39,$2A,$58,$34,$47,$3D,$9C,$F9
#_09E651: db $F2,$21,$41,$CF,$26,$2D,$4D,$3D
#_09E659: db $A9,$31,$FC,$FA,$D2,$47,$07,$D2
#_09E661: db $43,$05,$E9,$03,$04,$EF,$9A,$F9
#_09E669: db $2C,$A6,$4B,$3C,$28,$CF,$3E,$39
#_09E671: db $30,$94,$F9,$A2,$2A,$52,$3D,$45
#_09E679: db $A6,$A6,$CF,$26,$2E,$27,$A4,$FC
#_09E681: db $FA
DATA8_09E682:
#_09E682: db $E9,$02,$05,$EE,$9A,$F9,$39,$3A
#_09E68A: db $2A,$CF,$A2,$57,$27,$42,$27,$9C
#_09E692: db $CF,$28,$4B,$4E,$4D,$2A,$47,$30
#_09E69A: db $4E,$43,$32,$52,$F9,$2B,$26,$37
#_09E6A2: db $26,$2B,$43,$30,$57,$27,$FC
DATA8_09E6A9:
#_09E6A9: db $FA,$F2,$33,$38,$9A,$F9,$F2,$0B
#_09E6B1: db $2A,$44,$51,$CF,$30,$52,$A2,$37
#_09E6B9: db $CF,$26,$2B,$37,$49,$2C,$2E,$38
#_09E6C1: db $9C,$F9,$50,$34,$30,$34,$35,$3D
#_09E6C9: db $CF,$36,$38,$46,$39,$52,$A9,$31
#_09E6D1: db $F9,$26,$43,$2A,$4B,$CF,$04,$01
#_09E6D9: db $3C,$52,$43,$28,$CF,$32,$2A,$26
#_09E6E1: db $3E,$CF,$A6,$26,$3E,$2A,$26,$3A
#_09E6E9: db $F9,$44,$43,$50,$4E,$43,$30,$34
#_09E6F1: db $FC,$D2,$43,$06,$E9,$09,$06,$FA
#_09E6F9: db $EE,$9A,$F9,$2B,$2B,$43,$30,$34
#_09E701: db $2A,$94,$CF,$25,$4E,$2A,$4B,$CF
#_09E709: db $04,$01,$3C,$52,$58,$37,$F2,$0B
#_09E711: db $FC,$FA,$EF,$9A,$F9,$25,$25,$CF
#_09E719: db $34,$30,$2A,$3A,$94,$CF,$2E,$2E
#_09E721: db $3E,$CF,$42,$52,$38,$27,$3A,$F9
#_09E729: db $04,$01,$3C,$52,$A0,$3D,$CF,$32
#_09E731: db $2A,$26,$39,$3D,$2A,$95,$FC
DATA8_09E738:
#_09E738: db $FA,$F2,$33,$38,$9A,$F9
DATA8_09E73E:
#_09E73E: db $04,$01,$3C,$52,$43,$28,$3D,$CF
#_09E746: db $A6,$26,$3E,$2A,$26,$3E,$DF,$DF
#_09E74E: db $F9,$2A,$44,$3A,$4A,$58,$37,$CF
#_09E756: db $25,$34,$28,$4B,$4E,$34,$CF,$30
#_09E75E: db $4E,$52,$39,$3D,$A9,$31,$DF,$DF
#_09E766: db $F9,$30,$4E,$52,$51,$CF,$34,$28
#_09E76E: db $30,$3D,$AC,$CF,$2A,$44,$51,$30
#_09E776: db $52,$A2,$36,$A8,$2D,$DF,$DF,$F9
#_09E77E: db $26,$58,$30,$57,$27,$2D,$52,$46
#_09E786: db $26,$CF,$26,$2B,$37,$2B,$34,$CF
#_09E78E: db $44,$39,$2F,$52,$3D,$DF,$DF,$F9
#_09E796: db $35,$2A,$4B,$3A,$4A,$58,$37,$CF
#_09E79E: db $32,$2A,$26,$3E,$40,$58,$2E,$27
#_09E7A6: db $3D,$2B,$A1,$30,$51,$DF,$DF,$F9
#_09E7AE: db $44,$32,$37,$26,$43,$31,$CF,$2A
#_09E7B6: db $44,$51,$CF,$30,$52,$A2,$4D,$2E
#_09E7BE: db $38,$9C,$F2,$0B,$FC,$D4,$03,$97
#_09E7C6: db $32,$58,$2B,$57,$27,$3E,$CF,$36
#_09E7CE: db $A8,$26,$37,$26,$4D,$FC,$D0,$43
#_09E7D6: db $FF
DATA8_09E7D7:
#_09E7D7: db $D7,$36,$D5,$45,$D2,$62,$15,$D6
#_09E7DF: db $00,$C7,$60,$20,$D6,$01,$C7,$70
#_09E7E7: db $20,$D6,$02,$C7,$80,$20,$D6,$03
#_09E7EF: db $C7,$90,$20,$97,$1E,$20,$9C,$CF
#_09E7F7: db $29,$26,$37,$25,$4D,$FC,$FA,$F2
#_09E7FF: db $33,$38,$9A,$F9,$D2,$79,$13,$D2
#_09E807: db $64,$10,$D2,$7D,$12,$D2,$63,$0F
#_09E80F: db $D2,$45,$0E,$D2,$6E,$0B,$D2,$55
#_09E817: db $0A,$D2,$47,$09,$D3,$07
DATA8_09E81D:
#_09E81D: db $F2,$18,$3D,$CF,$30,$3E,$26,$30
#_09E825: db $55,$CF,$61,$BA,$88,$9C,$F9,$39
#_09E82D: db $3A,$47,$3D,$2A,$3A,$CF,$4A,$58
#_09E835: db $37,$CF,$34,$29,$2F,$4E,$43,$30
#_09E83D: db $34,$FC,$FA,$36,$26,$3A,$CF,$61
#_09E845: db $BA,$88,$3A,$4A,$4D,$CF,$F2,$18
#_09E84D: db $30,$3E,$26,$3E,$F9,$29,$50,$4C
#_09E855: db $51,$CF,$36,$9F,$34,$3D,$A9,$31
#_09E85D: db $F9,$2E,$4E,$47,$CF,$2A,$44,$3D
#_09E865: db $CF,$45,$2C,$26,$A9,$30,$57,$27
#_09E86D: db $F9,$37,$52,$3A,$CF,$43,$30,$43
#_09E875: db $31,$CF,$50,$4E,$4B,$3D,$2A,$44
#_09E87D: db $3E,$F9,$26,$36,$A9,$47,$CF,$A0
#_09E885: db $4B,$52,$3A,$CF,$39,$58,$37,$29
#_09E88D: db $4B,$4E,$43,$31,$FC,$FF
DATA8_09E893:
#_09E893: db $2A,$3C,$37,$2A,$4B,$CF,$2D,$52
#_09E89B: db $32,$36,$35,$56,$27,$A6,$58,$34
#_09E8A3: db $F9,$68,$C6,$80,$3D,$CF,$F2,$33
#_09E8AB: db $2A,$26,$9C,$CF,$2A,$52,$32,$26
#_09E8B3: db $30,$43,$30,$34,$FC,$FA,$38,$25
#_09E8BB: db $4D,$CF,$A4,$52,$26,$3D,$2A,$34
#_09E8C3: db $9C,$CF,$34,$9C,$2C,$3D,$CF,$2B
#_09E8CB: db $40,$51,$F9,$30,$37,$2C,$4E,$34
#_09E8D3: db $29,$2A,$9F,$38,$CF,$26,$27,$2E
#_09E8DB: db $38,$A9,$31,$F9,$33,$3D,$2A,$34
#_09E8E3: db $3E,$CF,$39,$47,$36,$9F,$A3,$CF
#_09E8EB: db $2F,$58,$37,$26,$2A,$4E,$34,$33
#_09E8F3: db $27,$A9,$31,$FC,$FA,$39,$47,$30
#_09E8FB: db $4E,$3B,$CF,$A4,$52,$26,$3D,$CF
#_09E903: db $2A,$34,$3A,$F9,$F2,$6F,$FC,$FF
DATA8_09E90B:
#_09E90B: db $5E,$65,$C6,$64,$87,$3A,$CF,$69
#_09E913: db $B5,$7F,$CB,$84,$BC,$8A,$51,$CF
#_09E91B: db $40,$58,$2A,$36,$2F,$32,$F9,$3F
#_09E923: db $38,$AC,$38,$51,$CF,$36,$2A,$43
#_09E92B: db $28,$37,$3E,$CF,$2A,$58,$37,$3A
#_09E933: db $CF,$2F,$AB,$26,$37,$26,$34,$F9
#_09E93B: db $DE,$00,$00,$10,$00,$28,$52,$43
#_09E943: db $A6,$26,$29,$27,$CF,$2E,$38,$CF
#_09E94B: db $F6,$CF,$F5,$9C,$F9,$36,$26,$3A
#_09E953: db $CF,$34,$29,$2F,$4E,$43,$30,$34
#_09E95B: db $FC
DATA8_09E95C:
#_09E95C: db $FA,$2E,$3D,$CF,$26,$9D,$57,$27
#_09E964: db $51,$CF,$39,$30,$38,$9F,$34,$3D
#_09E96C: db $3E,$F9,$49,$27,$30,$55,$CF,$F0
#_09E974: db $A9,$31,$F9,$2A,$44,$47,$CF,$2F
#_09E97C: db $A5,$2A,$30,$CF,$29,$4A,$4F,$2E
#_09E984: db $AC,$3D,$CF,$2E,$38,$A9,$30,$57
#_09E98C: db $27,$FC
DATA8_09E98E:
#_09E98E: db $FA,$49,$27,$30,$55,$CF,$F0,$3A
#_09E996: db $F9,$F2,$6F,$FC,$FF
DATA8_09E99B:
#_09E99B: db $36,$26,$3A,$CF,$2A,$44,$9C,$CF
#_09E9A3: db $7E,$68,$5D,$51,$CF,$36,$2A,$50
#_09E9AB: db $2F,$4E,$43,$30,$34,$F9,$33,$3D
#_09E9B3: db $39,$3E,$CF,$EE,$2F,$43,$A9,$31
#_09E9BB: db $FC,$FA,$2C,$4D,$30,$45,$CF,$50
#_09E9C3: db $34,$30,$34,$35,$51,$CF,$44,$37
#_09E9CB: db $CF,$31,$2C,$26,$3D,$CF,$37,$51
#_09E9D3: db $F9,$2F,$30,$3D,$AE,$4B,$4E,$34
#_09E9DB: db $3D,$A9,$31,$FC,$FF
DATA8_09E9E0:
#_09E9E0: db $F2,$1C,$3D,$CF,$72,$68,$3A,$CF
#_09E9E8: db $31,$44,$36,$26,$37,$26,$34,$F9
#_09E9F0: db $60,$63,$C3,$71,$9C,$CF,$34,$26
#_09E9F8: db $A2,$2F,$4E,$43,$30,$34
DATA8_09E9FE:
#_09E9FE: db $FC,$D3,$0C
DATA8_09EA01:
#_09EA01: db $2A,$39,$30,$26,$CF,$29,$30,$4B
#_09EA09: db $32,$A9,$31,$F9,$68,$71,$B5,$88
#_09EA11: db $3A,$37,$CF,$6F,$8A,$68,$CF,$76
#_09EA19: db $72,$60,$85,$2F,$43,$9C,$F9,$34
#_09EA21: db $29,$2F,$4E,$37,$30,$43,$26,$43
#_09EA29: db $30,$34,$FC,$FA,$76,$72,$60,$85
#_09EA31: db $2F,$43,$51,$CF,$37,$3A,$2A,$2D
#_09EA39: db $34,$3D,$3E,$F9,$5D,$64,$7B,$36
#_09EA41: db $2A,$26,$CF,$F0,$A9,$31,$F9,$39
#_09EA49: db $52,$38,$26,$27,$CF,$29,$33,$4F
#_09EA51: db $30,$26,$2E,$38,$51,$CF,$31,$4D
#_09EA59: db $3D,$A9,$30,$57,$27,$FC
DATA8_09EA5F:
#_09EA5F: db $FA,$A0,$2C,$25,$2C,$3F,$AA,$27
#_09EA67: db $3D,$CF,$5D,$64,$7B,$36,$2A,$26
#_09EA6F: db $F9,$F0,$3A,$CF,$37,$52,$AB,$36
#_09EA77: db $25,$4E,$94,$FC,$FF
DATA8_09EA7C:
#_09EA7C: db $49,$27,$30,$55,$CF,$F0,$9C,$F9
#_09EA84: db $68,$71,$B5,$88,$CF,$7E,$68,$5D
#_09EA8C: db $A6,$26,$2B,$57,$27,$2A,$26,$A9
#_09EA94: db $F9,$32,$52,$4E,$26,$51,$CF,$27
#_09EA9C: db $2D,$CF,$F2,$33,$3D,$CF,$30,$52
#_09EAA4: db $A2,$55,$3A,$F9,$39,$4B,$4E,$43
#_09EAAC: db $30,$34,$FC,$FA,$2E,$4E,$A9,$CF
#_09EAB4: db $49,$27,$30,$55,$CF,$F0,$3E,$F9
#_09EABC: db $46,$26,$A2,$36,$38,$47,$3A,$CF
#_09EAC4: db $87,$5F,$3D,$CF,$32,$52,$30,$38
#_09EACC: db $CF,$39,$58,$34,$3D,$A9,$31,$FC
#_09EAD4: db $D3,$0D
DATA8_09EAD6:
#_09EAD6: db $A0,$2C,$25,$2C,$3F,$AA,$27,$3D
#_09EADE: db $CF,$5D,$64,$7B,$36,$2A,$26,$F9
#_09EAE6: db $F0,$9C,$CF,$5F,$60,$75,$A9,$CF
#_09EAEE: db $F2,$34,$3D,$F9,$32,$52,$4E,$26
#_09EAF6: db $51,$CF,$27,$2D,$34,$33,$27,$A9
#_09EAFE: db $31,$FC,$FA,$36,$26,$3A,$CF,$F0
#_09EB06: db $3E,$F9,$5D,$64,$7B,$3A,$CF,$34
#_09EB0E: db $43,$30,$26,$51,$CF,$27,$4C,$50
#_09EB16: db $34,$30,$34,$3D,$A9,$31,$FC,$FF
DATA8_09EB1E:
#_09EB1E: db $D7,$36
DATA8_09EB20:
#_09EB20: db $97,$F2,$6E,$FC,$FF
DATA8_09EB25:
#_09EB25: db $D7,$31,$D6,$01,$C7,$48,$08,$D6
#_09EB2D: db $02,$C7,$58,$08,$D6,$03,$C7,$68
#_09EB35: db $08,$D6,$04,$C7,$78,$08,$D6,$05
#_09EB3D: db $C7,$88,$08,$D6,$06,$C7,$98,$08
#_09EB45: db $D6,$07,$C7,$A8,$08,$D2,$62,$17
#_09EB4D: db $D5,$45,$D6,$00,$85,$70,$28,$F2
#_09EB55: db $33,$38,$9A,$F9,$50,$9C,$CF,$F2
#_09EB5D: db $33,$42,$27,$33,$27,$2B,$57,$2C
#_09EB65: db $41,$CF,$4A,$27,$2E,$33,$F9,$F2
#_09EB6D: db $02,$3E,$CF,$F2,$33,$3D,$CF,$2A
#_09EB75: db $44,$3D,$CF,$29,$30,$28,$51,$F9
#_09EB7D: db $3F,$38,$AC,$38,$3A,$CF,$36,$34
#_09EB85: db $28,$4D,$34,$46,$CF,$3E,$34,$4B
#_09EB8D: db $26,$37,$26,$43,$31,$FC,$FF
DATA8_09EB94:
#_09EB94: db $97,$F2,$2C,$FC,$FF
DATA8_09EB99:
#_09EB99: db $D7,$30,$D2,$62,$23,$D5,$45,$D6
#_09EBA1: db $00,$49,$78,$28,$F2,$33,$38,$9A
#_09EBA9: db $F9,$E9,$00,$1D,$25,$39,$34,$9C
#_09EBB1: db $CF,$F0,$2F,$52,$F2,$0B,$95,$FC
#_09EBB9: db $39,$43,$28,$A6,$2D,$3E,$CF,$4A
#_09EBC1: db $2C,$30,$58,$37,$4D,$50,$F9,$25
#_09EBC9: db $39,$34,$3D,$CF,$72,$90,$5A,$69
#_09EBD1: db $3E,$CF,$4A,$2C,$CF,$42,$27,$33
#_09EBD9: db $27,$31,$4D,$2A,$4B,$FC,$FA,$25
#_09EBE1: db $4E,$3E,$37,$34,$CF,$32,$2A,$26
#_09EBE9: db $A9,$CF,$3F,$38,$AC,$38,$3E,$F9
#_09EBF1: db $40,$25,$52,$3A,$CF,$29,$3D,$3D
#_09EBF9: db $2B,$CF,$48,$2D,$3A,$CF,$39,$58
#_09EC01: db $37,$F9,$26,$2B,$3D,$AC,$37,$4D
#_09EC09: db $50,$FC,$FA,$A6,$2A,$4B,$CF,$2A
#_09EC11: db $44,$3D,$CF,$29,$30,$28,$3A,$CF
#_09EC19: db $4A,$58,$37,$F9,$31,$2C,$58,$37
#_09EC21: db $25,$9F,$4D,$3D,$F9,$2E,$2E,$2A
#_09EC29: db $4B,$CF,$42,$27,$33,$27,$31,$4E
#_09EC31: db $AB,$CF,$34,$2C,$2F,$52,$3D,$3F
#_09EC39: db $38,$3A,$F9,$2A,$44,$3D,$29,$30
#_09EC41: db $28,$51,$CF,$36,$34,$28,$4D,$2E
#_09EC49: db $38,$9C,$A9,$2B,$4D,$50,$FC,$FE
#_09EC51: db $04,$1A,$1B,$D2,$82,$19,$FF
DATA8_09EC58:
#_09EC58: db $D2,$83,$1E,$FF
DATA8_09EC5C:
#_09EC5C: db $FA,$25,$39,$34,$3E,$CF,$34,$A6
#_09EC64: db $3D,$CF,$5D,$64,$7B,$36,$2A,$26
#_09EC6C: db $CF,$A2,$55,$39,$26,$50,$3C,$F9
#_09EC74: db $50,$34,$30,$34,$35,$CF,$F2,$33
#_09EC7C: db $38,$CF,$29,$39,$A2,$F9,$87,$5F
#_09EC84: db $9C,$50,$3D,$CF,$3A,$52,$9F,$52
#_09EC8C: db $3D,$4A,$27,$3C,$FC,$FF
DATA8_09EC92:
#_09EC92: db $FA,$38,$2E,$4F,$A9,$CF,$25,$39
#_09EC9A: db $34,$CF,$5D,$64,$7B,$51,$CF,$25
#_09ECA2: db $48,$36,$58,$37,$F9,$34,$34,$2A
#_09ECAA: db $26,$CF,$36,$A8,$2D,$37,$CF,$39
#_09ECB2: db $3A,$51,$CF,$30,$4A,$27,$58,$37
#_09ECBA: db $26,$27,$3D,$95,$F9,$5D,$64,$7B
#_09ECC2: db $38,$CF,$5D,$64,$7B,$51,$CF,$34
#_09ECCA: db $34,$2A,$50,$32,$4D,$39,$52,$37
#_09ECD2: db $F9,$3F,$2B,$57,$27,$4A,$94,$FC
#_09ECDA: db $D2,$82,$1C,$FF
DATA8_09ECDE:
#_09ECDE: db $D2,$83,$1F,$FF
DATA8_09ECE2:
#_09ECE2: db $3F,$AA,$2C,$48,$4B,$4E,$37,$4D
#_09ECEA: db $50,$F9,$3E,$48,$2C,$CF,$37,$25
#_09ECF2: db $37,$30,$37,$25,$9F,$39,$26,$38
#_09ECFA: db $FC,$FF
DATA8_09ECFC:
#_09ECFC: db $FA,$3E,$2A,$26,$2F,$4E,$34,$CF
#_09ED04: db $F2,$1C,$51,$CF,$44,$37,$F9,$25
#_09ED0C: db $39,$34,$3E,$CF,$AA,$27,$CF,$2A
#_09ED14: db $52,$A2,$34,$95,$FC,$FA,$26,$43
#_09ED1C: db $2E,$33,$CF,$2A,$44,$3D,$CF,$31
#_09ED24: db $2C,$26,$3D,$37,$9C,$F9,$3F,$36
#_09ED2C: db $4A,$27,$A6,$38,$CF,$29,$47,$27
#_09ED34: db $A9,$30,$57,$27,$95,$F8,$22,$D4
#_09ED3C: db $03,$33,$27,$F2,$0B,$33,$4E,$9C
#_09ED44: db $CF,$25,$39,$34,$3D,$CF,$2E,$34
#_09ED4C: db $28,$39,$3D,$3C,$FC
DATA8_09ED51:
#_09ED51: db $FA,$26,$43,$43,$A9,$CF,$25,$39
#_09ED59: db $34,$3E,$CF,$50,$34,$30,$34,$35
#_09ED61: db $3D,$CF,$72,$90,$5A,$69,$3A,$F9
#_09ED69: db $4C,$4A,$27,$2F,$32,$37,$CF,$47
#_09ED71: db $4B,$58,$34,$2D,$AA,$F9,$47,$3E
#_09ED79: db $48,$CF,$2E,$4E,$43,$A9,$3C,$F2
#_09ED81: db $0B,$FC,$D5,$39,$FE,$46,$09,$FE
#_09ED89: db $07,$06,$D6,$00,$9D,$78,$38,$FE
#_09ED91: db $07,$13,$DE,$01,$00,$0C,$01,$E4
#_09ED99: db $00,$FA,$F5,$9A,$F9,$2E,$4E,$26
#_09EDA1: db $A2,$57,$27,$CF,$2A,$44,$3D,$CF
#_09EDA9: db $44,$2E,$2E,$4F,$3A,$F9,$2F,$2A
#_09EDB1: db $4B,$27,$2E,$38,$3E,$CF,$49,$4D
#_09EDB9: db $2F,$52,$94,$FC,$E5,$01,$21
DATA8_09EDC0:
#_09EDC0: db $E5,$00,$21,$D3,$20
DATA8_09EDC5:
#_09EDC5: db $D0,$62,$FE,$02,$10,$FF
DATA8_09EDCB:
#_09EDCB: db $D4,$03,$A9,$3E,$CF,$2E,$4E,$2A
#_09EDD3: db $4B,$47,$CF,$2A,$44,$3D,$CF,$34
#_09EDDB: db $46,$F9,$2A,$44,$3D,$CF,$31,$2C
#_09EDE3: db $26,$51,$CF,$47,$38,$46,$4D,$CF
#_09EDEB: db $3F,$38,$34,$35,$3D,$CF,$34,$46
#_09EDF3: db $F9,$9C,$52,$AB,$58,$37,$CF,$2C
#_09EDFB: db $A6,$2F,$26,$FC,$D0,$62,$FE,$02
#_09EE03: db $F0,$FF
DATA8_09EE05:
#_09EE05: db $97,$F2,$2C,$FC,$FF
DATA8_09EE0A:
#_09EE0A: db $D5,$44,$D7,$00,$D2,$E2,$03
DATA8_09EE11:
#_09EE11: db $D6,$00,$34,$70,$28
DATA8_09EE16:
#_09EE16: db $FE,$14,$20,$FA,$48,$2A,$34,$3D
#_09EE1E: db $25,$4D,$A2,$9A,$F9,$5D,$64,$7B
#_09EE26: db $9C,$36,$AA,$26,$30,$CF,$A2,$55
#_09EE2E: db $2B,$57,$27,$3D,$48,$2A,$34,$CF
#_09EE36: db $3A,$F9,$4A,$27,$2E,$33,$FC,$D3
#_09EE3E: db $05
DATA8_09EE3F:
#_09EE3F: db $D2,$49,$01,$E9,$03,$01,$FE,$6B
#_09EE47: db $01,$DE,$01,$00,$35,$01,$E4,$00
#_09EE4F: db $D0,$49,$EF,$9A,$F9,$F2,$0B,$29
#_09EE57: db $4E,$3E,$CF,$47,$58,$38,$CF,$35
#_09EE5F: db $2A,$4B,$9C,$CF,$42,$30,$26,$94
#_09EE67: db $F9,$5D,$64,$7B,$3D,$35,$2A,$4B
#_09EE6F: db $A9,$47,$CF,$2A,$43,$50,$52,$94
#_09EE77: db $FC,$FA,$61,$BA,$88,$51,$CF,$34
#_09EE7F: db $29,$31,$34,$46,$F2,$0B,$26,$48
#_09EE87: db $F2,$0B,$F9,$2E,$3D,$32,$2A,$26
#_09EE8F: db $A9,$CF,$34,$34,$2A,$58,$37,$CF
#_09EE97: db $26,$2B,$3D,$2E,$4D,$34,$46,$3A
#_09EE9F: db $F9,$29,$4E,$3E,$CF,$5D,$64,$7B
#_09EEA7: db $38,$CF,$9C,$58,$34,$26,$31,$4D
#_09EEAF: db $A5,$94,$FC,$E7,$00,$FE,$64,$29
#_09EEB7: db $4E,$3E,$CF,$36,$26,$3A,$35,$2A
#_09EEBF: db $4B,$51,$CF,$37,$3A,$26,$4E,$34
#_09EEC7: db $94,$F9,$47,$27,$A6,$4E,$3A,$47
#_09EECF: db $43,$2D,$39,$26,$94,$94,$FC,$FE
#_09EED7: db $60
DATA8_09EED8:
#_09EED8: db $D6,$00,$34,$70,$28,$FE,$14,$20
#_09EEE0: db $FA,$39,$52,$3D,$4A,$27,$2A,$39
#_09EEE8: db $95,$FE,$67,$07,$D8,$03,$07,$08
#_09EEF0: db $08,$09,$09,$0B,$19,$06
DATA8_09EEF6:
#_09EEF6: db $FA,$71,$62,$7B,$9C,$CF,$40,$28
#_09EEFE: db $34,$4B,$CF,$43,$34,$CF,$2C,$4D
#_09EF06: db $9C,$4A,$26,$FC,$FF
DATA8_09EF0B:
#_09EF0B: db $D8,$04,$07,$08,$08,$09,$1B,$17
#_09EF13: db $09,$0B,$19,$06,$D3,$06
DATA8_09EF19:
#_09EF19: db $FD,$02,$FE,$1E,$0A,$FE,$22,$04
#_09EF21: db $D3,$0D
DATA8_09EF23:
#_09EF23: db $FD,$03,$FE,$1E,$0A,$FE,$22,$04
#_09EF2B: db $D3,$0D
DATA8_09EF2D:
#_09EF2D: db $FA,$9C,$58,$34,$26,$2F,$32,$4D
#_09EF35: db $71,$62,$7B,$9C,$CF,$29,$4B,$52
#_09EF3D: db $4A,$27,$A6,$39,$FC,$D3,$04
DATA8_09EF44:
#_09EF44: db $FE,$72,$00,$D3,$04
DATA8_09EF49:
#_09EF49: db $D6,$00,$34,$70,$28,$FA,$A9,$2B
#_09EF51: db $25,$9C,$4D,$CF,$71,$62,$7B,$CF
#_09EF59: db $3E,$93,$93,$93,$FC,$FE,$61,$FE
#_09EF61: db $51,$15
DATA8_09EF63:
#_09EF63: db $D6,$00,$34,$70,$28,$FA,$2E,$4E
#_09EF6B: db $A9,$4A,$26,$3D,$A6,$39,$95,$F8
#_09EF73: db $10,$D3,$04
DATA8_09EF76:
#_09EF76: db $FE,$1F,$13,$FE,$20,$14
DATA8_09EF7C:
#_09EF7C: db $FA,$A9,$3E,$CF,$9C,$58,$34,$26
#_09EF84: db $2F,$32,$4D,$A5,$FC,$FE,$6D,$FE
#_09EF8C: db $5E
DATA8_09EF8D:
#_09EF8D: db $50,$34,$30,$3E,$CF,$F6,$CF,$F5
#_09EF95: db $FC,$2E,$DF,$52,$DF,$A0,$DF,$38
#_09EF9D: db $DF,$47,$CF,$DF,$4A,$DF,$4F,$DF
#_09EFA5: db $30,$DF,$2C,$DF,$93,$DF,$93,$DF
#_09EFAD: db $93,$DF,$DF,$DF,$FC,$FE,$50,$FE
#_09EFB5: db $60,$D3,$04
DATA8_09EFB8:
#_09EFB8: db $FA,$A1,$52,$3C,$52,$A6,$9C,$CF
#_09EFC0: db $26,$43,$3D,$29,$43,$28,$3D,$86
#_09EFC8: db $C7,$85,$A9,$3E,$F9,$37,$3A,$CF
#_09EFD0: db $29,$28,$39,$26,$4A,$27,$A6,$39
#_09EFD8: db $93,$93,$93,$FC,$D3,$04
DATA8_09EFDE:
#_09EFDE: db $FA,$AA,$27,$48,$4B,$CF,$A5,$2C
#_09EFE6: db $32,$26,$9C,$CF,$35,$9C,$27,$4A
#_09EFEE: db $27,$A6,$39,$F9,$4A,$AC,$A6,$32
#_09EFF6: db $39,$26,$9C,$CF,$33,$4E,$A9,$47
#_09EFFE: db $CF,$4A,$26,$2A,$95,$F8,$11,$D3
#_09F006: db $04
DATA8_09F007:
#_09F007: db $FA,$29,$39,$A2,$CF,$39,$2A,$43
#_09F00F: db $9C,$CF,$26,$4D,$4A,$27,$A6,$39
#_09F017: db $FC,$D3,$04
DATA8_09F01A:
#_09F01A: db $FE,$63,$60,$8A,$BD,$85,$84,$8A
#_09F022: db $B7,$9C,$A9,$2B,$43,$30,$34,$FC
#_09F02A: db $FE,$65,$FF
DATA8_09F02D:
#_09F02D: db $FE,$68,$0A,$D6,$00,$34,$70,$28
#_09F035: db $FE,$22,$04,$FA,$4A,$26,$3D,$A6
#_09F03D: db $39,$95,$F8,$18,$D3,$04
DATA8_09F043:
#_09F043: db $FE,$69,$19,$FE,$22,$04,$FE,$5E
#_09F04B: db $F5,$CF,$9C,$A9,$2B,$34,$A5,$F9
#_09F053: db $2F,$53,$CF,$47,$58,$37,$26,$2C
#_09F05B: db $9C,$4A,$26,$FC,$FE,$60,$D6,$00
#_09F063: db $34,$70,$28,$D3,$04
DATA8_09F068:
#_09F068: db $D6,$00,$34,$70,$28,$FA,$5D,$5E
#_09F070: db $6F,$7D,$9C,$26,$58,$B0,$26,$A9
#_09F078: db $CF,$47,$35,$2B,$4E,$3B,$4A,$27
#_09F080: db $A6,$39,$FC,$D3,$04
DATA8_09F085:
#_09F085: db $D5,$50,$D7,$85,$1A,$DA,$00,$00
#_09F08D: db $00,$D6,$00,$3B,$70,$28,$2E,$58
#_09F095: db $38,$27,$3F,$52,$48,$9A,$F9,$D2
#_09F09D: db $06,$06,$F2,$0B,$F2,$0B,$F2,$0B
#_09F0A5: db $F2,$0B,$FC,$FA
DATA8_09F0A9:
#_09F0A9: db $39,$3A,$2A,$CF,$4A,$27,$2A,$95
#_09F0B1: db $D8,$02,$04,$02,$11,$04,$12,$07
#_09F0B9: db $D3,$07
DATA8_09F0BB:
#_09F0BB: db $FA,$39,$3A,$2A,$CF,$2A,$27,$3D
#_09F0C3: db $2A,$95,$D8,$03,$13,$03,$14,$03
#_09F0CB: db $15,$03,$16,$03,$D3,$01
DATA8_09F0D1:
#_09F0D1: db $FA,$47,$3D,$51,$CF,$44,$4D,$46
#_09F0D9: db $3D,$CF,$39,$26,$48,$36,$3A,$3E
#_09F0E1: db $CF,$27,$4E,$52,$39,$FC,$D3,$05
DATA8_09F0E9:
#_09F0E9: db $FA,$B5,$83,$64,$6C,$3E,$CF,$2A
#_09F0F1: db $26,$38,$4E,$52,$39,$FC
DATA8_09F0F7:
#_09F0F7: db $FA,$43,$A6,$CF,$D3,$01
DATA8_09F0FD:
#_09F0FD: db $AA
DATA8_09F0FE:
#_09F0FE: db $27,$48,$4B,$CF,$2E,$35,$4B,$3D
#_09F106: db $42,$27,$9C,$CF,$26,$4C,$4A,$27
#_09F10E: db $4B,$30,$26,$39,$FC,$EA,$06
DATA8_09F115:
#_09F115: db $FF
DATA8_09F116:
#_09F116: db $E1,$E4,$F2,$74,$DD,$E4,$11,$D3
#_09F11E: db $0D
DATA8_09F11F:
#_09F11F: db $E1,$E5,$F2,$74,$DD,$E5,$11,$D3
#_09F127: db $0D
DATA8_09F128:
#_09F128: db $E1,$E6,$F2,$74,$DD,$E6,$11,$D3
#_09F130: db $0D
DATA8_09F131:
#_09F131: db $E1,$E7,$F2,$74,$DD,$E7,$11,$D3
#_09F139: db $0D
DATA8_09F13A:
#_09F13A: db $E1,$E8,$F2,$74,$DD,$E8,$11,$D3
#_09F142: db $0D
DATA8_09F143:
#_09F143: db $E1,$E9,$F2,$74,$DD,$E9,$11,$D3
#_09F14B: db $0D
DATA8_09F14C:
#_09F14C: db $E1,$EA,$F2,$74,$DD,$EA,$11,$D3
#_09F154: db $0D
DATA8_09F155:
#_09F155: db $E1,$EB,$F2,$74,$DD,$EB,$11,$D3
#_09F15D: db $0D
DATA8_09F15E:
#_09F15E: db $E1,$EC,$F2,$74,$DD,$EC,$11,$D3
#_09F166: db $0D
DATA8_09F167:
#_09F167: db $E1,$ED,$F2,$74,$DD,$ED,$11,$D3
#_09F16F: db $0D
DATA8_09F170:
#_09F170: db $E1,$EE,$F2,$74,$DD,$EE,$11,$D3
#_09F178: db $0D
DATA8_09F179:
#_09F179: db $E1,$EF,$F2,$74,$DD,$EF,$11,$D3
#_09F181: db $0D
DATA8_09F182:
#_09F182: db $D2,$56,$13,$E1,$E1,$F2,$74,$DD
#_09F18A: db $E1,$11
DATA8_09F18C:
#_09F18C: db $F8,$0F
DATA8_09F18E:
#_09F18E: db $F2,$75,$FC,$FF
DATA8_09F192:
#_09F192: db $D6,$00,$B7,$70,$48,$F2,$76,$FC
#_09F19A: db $FF
DATA8_09F19B:
#_09F19B: db $F2,$72,$FC,$FF
DATA8_09F19F:
#_09F19F: db $F8,$12,$D3,$0E
DATA8_09F1A3:
#_09F1A3: db $D6,$00,$B7,$70,$48,$D4,$03,$F1
#_09F1AB: db $3E,$CF,$F3,$51,$F9,$FE,$3C,$10
#_09F1B3: db $F2,$2D,$FC,$FE,$28,$FF
DATA8_09F1B9:
#_09F1B9: db $F2,$74,$D3,$0D

DemonNamePointers:
#_09F1BD: dw .demon_00_name
#_09F1BF: dw .demon_01_name
#_09F1C1: dw .demon_02_name
#_09F1C3: dw .demon_03_name
#_09F1C5: dw .demon_04_name
#_09F1C7: dw .demon_05_name
#_09F1C9: dw .demon_06_name
#_09F1CB: dw .demon_07_name
#_09F1CD: dw .demon_08_name
#_09F1CF: dw .demon_09_name
#_09F1D1: dw .demon_0A_name
#_09F1D3: dw .demon_0B_name
#_09F1D5: dw .demon_0C_name
#_09F1D7: dw .demon_0D_name
#_09F1D9: dw .demon_0E_name
#_09F1DB: dw .demon_0F_name
#_09F1DD: dw .demon_10_name
#_09F1DF: dw .demon_11_name
#_09F1E1: dw .demon_12_name
#_09F1E3: dw .demon_13_name
#_09F1E5: dw .demon_14_name
#_09F1E7: dw .demon_15_name
#_09F1E9: dw .demon_16_name
#_09F1EB: dw .demon_17_name
#_09F1ED: dw .demon_18_name
#_09F1EF: dw .demon_19_name
#_09F1F1: dw .demon_1A_name
#_09F1F3: dw .demon_1B_name
#_09F1F5: dw .demon_1C_name
#_09F1F7: dw .demon_1D_name
#_09F1F9: dw .demon_1E_name
#_09F1FB: dw .demon_1F_name
#_09F1FD: dw .demon_20_name
#_09F1FF: dw .demon_21_name
#_09F201: dw .demon_22_name
#_09F203: dw .demon_23_name
#_09F205: dw .demon_24_name
#_09F207: dw .demon_25_name
#_09F209: dw .demon_26_name
#_09F20B: dw .demon_27_name
#_09F20D: dw .demon_28_name
#_09F20F: dw .demon_29_name
#_09F211: dw .demon_2A_name
#_09F213: dw .demon_2B_name
#_09F215: dw .demon_2C_name
#_09F217: dw .demon_2D_name
#_09F219: dw .demon_2E_name
#_09F21B: dw .demon_2F_name
#_09F21D: dw .demon_30_name
#_09F21F: dw .demon_31_name
#_09F221: dw .demon_32_name
#_09F223: dw .demon_33_name
#_09F225: dw .demon_34_name
#_09F227: dw .demon_35_name
#_09F229: dw .demon_36_name
#_09F22B: dw .demon_37_name
#_09F22D: dw .demon_38_name
#_09F22F: dw .demon_39_name
#_09F231: dw .demon_3A_name
#_09F233: dw .demon_3B_name
#_09F235: dw .demon_3C_name
#_09F237: dw .demon_3D_name
#_09F239: dw .demon_3E_name
#_09F23B: dw .demon_3F_name
#_09F23D: dw .demon_40_name
#_09F23F: dw .demon_41_name
#_09F241: dw .demon_42_name
#_09F243: dw .demon_43_name
#_09F245: dw .demon_44_name
#_09F247: dw .demon_45_name
#_09F249: dw .demon_46_name
#_09F24B: dw .demon_47_name
#_09F24D: dw .demon_48_name
#_09F24F: dw .demon_49_name
#_09F251: dw .demon_4A_name
#_09F253: dw .demon_4B_name
#_09F255: dw .demon_4C_name
#_09F257: dw .demon_4D_name
#_09F259: dw .demon_4E_name
#_09F25B: dw .demon_4F_name
#_09F25D: dw .demon_50_name
#_09F25F: dw .demon_51_name
#_09F261: dw .demon_52_name
#_09F263: dw .demon_53_name
#_09F265: dw .demon_54_name
#_09F267: dw .demon_55_name
#_09F269: dw .demon_56_name
#_09F26B: dw .demon_57_name
#_09F26D: dw .demon_58_name
#_09F26F: dw .demon_59_name
#_09F271: dw .demon_5A_name
#_09F273: dw .demon_5B_name
#_09F275: dw .demon_5C_name
#_09F277: dw .demon_5D_name
#_09F279: dw .demon_5E_name
#_09F27B: dw .demon_5F_name
#_09F27D: dw .demon_60_name
#_09F27F: dw .demon_61_name
#_09F281: dw .demon_62_name
#_09F283: dw .demon_63_name
#_09F285: dw .demon_64_name
#_09F287: dw .demon_65_name
#_09F289: dw .demon_66_name
#_09F28B: dw .demon_67_name
#_09F28D: dw .demon_68_name
#_09F28F: dw .demon_69_name
#_09F291: dw .demon_6A_name
#_09F293: dw .demon_6B_name
#_09F295: dw .demon_6C_name
#_09F297: dw .demon_6D_name
#_09F299: dw .demon_6E_name
#_09F29B: dw .demon_6F_name
#_09F29D: dw .demon_70_name
#_09F29F: dw .demon_71_name
#_09F2A1: dw .demon_72_name
#_09F2A3: dw .demon_73_name
#_09F2A5: dw .demon_74_name
#_09F2A7: dw .demon_75_name
#_09F2A9: dw .demon_76_name
#_09F2AB: dw .demon_77_name
#_09F2AD: dw .demon_78_name
#_09F2AF: dw .demon_79_name
#_09F2B1: dw .demon_7A_name
#_09F2B3: dw .demon_7B_name
#_09F2B5: dw .demon_7C_name
#_09F2B7: dw .demon_7D_name
#_09F2B9: dw .demon_7E_name
#_09F2BB: dw .demon_7F_name
#_09F2BD: dw .demon_80_name
#_09F2BF: dw .demon_81_name
#_09F2C1: dw .demon_82_name
#_09F2C3: dw .demon_83_name
#_09F2C5: dw .demon_84_name
#_09F2C7: dw .demon_85_name
#_09F2C9: dw .demon_86_name
#_09F2CB: dw .demon_87_name
#_09F2CD: dw .demon_88_name
#_09F2CF: dw .demon_89_name
#_09F2D1: dw .demon_8A_name
#_09F2D3: dw .demon_8B_name
#_09F2D5: dw .demon_8C_name
#_09F2D7: dw .demon_8D_name
#_09F2D9: dw .demon_8E_name
#_09F2DB: dw .demon_8F_name
#_09F2DD: dw .demon_90_name
#_09F2DF: dw .demon_91_name
#_09F2E1: dw .demon_92_name
#_09F2E3: dw .demon_93_name
#_09F2E5: dw .demon_94_name
#_09F2E7: dw .demon_95_name
#_09F2E9: dw .demon_96_name
#_09F2EB: dw .demon_97_name
#_09F2ED: dw .demon_98_name
#_09F2EF: dw .demon_99_name
#_09F2F1: dw .demon_9A_name
#_09F2F3: dw .demon_9B_name
#_09F2F5: dw .demon_9C_name
#_09F2F7: dw .demon_9D_name
#_09F2F9: dw .demon_9E_name
#_09F2FB: dw .demon_9F_name
#_09F2FD: dw .demon_A0_name
#_09F2FF: dw .demon_A1_name
#_09F301: dw .demon_A2_name
#_09F303: dw .demon_A3_name
#_09F305: dw .demon_A4_name
#_09F307: dw .demon_A5_name
#_09F309: dw .demon_A6_name
#_09F30B: dw .demon_A7_name
#_09F30D: dw .demon_A8_name
#_09F30F: dw .demon_A9_name
#_09F311: dw .demon_AA_name
#_09F313: dw .demon_AB_name
#_09F315: dw .demon_AC_name
#_09F317: dw .demon_AD_name
#_09F319: dw .demon_AE_name
#_09F31B: dw .demon_AF_name
#_09F31D: dw .demon_B0_name
#_09F31F: dw .demon_B1_name
#_09F321: dw .demon_B2_name
#_09F323: dw .demon_B3_name
#_09F325: dw .demon_B4_name
#_09F327: dw .demon_B5_name
#_09F329: dw .demon_B6_name
#_09F32B: dw .demon_B7_name
#_09F32D: dw .demon_B8_name
#_09F32F: dw .demon_B9_name
#_09F331: dw .demon_BA_name
#_09F333: dw .demon_BB_name
#_09F335: dw .demon_BC_name
#_09F337: dw .demon_BD_name
#_09F339: dw .demon_BE_name
#_09F33B: dw .demon_BF_name
#_09F33D: dw .demon_C0_name
#_09F33F: dw .demon_C1_name
#_09F341: dw .demon_C2_name
#_09F343: dw .demon_C3_name
#_09F345: dw .demon_C4_name
#_09F347: dw .demon_C5_name
#_09F349: dw .demon_C6_name
#_09F34B: dw .demon_C7_name
#_09F34D: dw .demon_C8_name
#_09F34F: dw .demon_C9_name
#_09F351: dw .demon_CA_name
#_09F353: dw .demon_CB_name
#_09F355: dw .demon_CC_name
#_09F357: dw .demon_CD_name
#_09F359: dw .demon_CE_name
#_09F35B: dw .demon_CF_name
#_09F35D: dw .demon_D0_name
#_09F35F: dw .demon_D1_name
#_09F361: dw .demon_D2_name
#_09F363: dw .demon_D3_name
#_09F365: dw .demon_D4_name
#_09F367: dw .demon_D5_name
#_09F369: dw .demon_D6_name
#_09F36B: dw .demon_D7_name
#_09F36D: dw .demon_D8_name
#_09F36F: dw .demon_D9_name
#_09F371: dw .demon_DA_name
#_09F373: dw .demon_DB_name
#_09F375: dw .demon_DC_name
#_09F377: dw .demon_DD_name
#_09F379: dw .demon_DE_name
#_09F37B: dw .demon_DF_name
#_09F37D: dw .demon_E0_name
#_09F37F: dw .demon_E1_name
#_09F381: dw .demon_E2_name
#_09F383: dw .demon_E3_name
#_09F385: dw .demon_E4_name
#_09F387: dw .demon_E5_name
#_09F389: dw .demon_E6_name
#_09F38B: dw .demon_E7_name
#_09F38D: dw .demon_E8_name
#_09F38F: dw .demon_E9_name
#_09F391: dw .demon_EA_name
#_09F393: dw .demon_EB_name
#_09F395: dw .demon_EC_name
#_09F397: dw .demon_ED_name
#_09F399: dw .demon_EE_name
#_09F39B: dw .demon_EF_name
#_09F39D: dw .demon_F0_name
#_09F39F: dw .demon_F1_name
#_09F3A1: dw .demon_F2_name
#_09F3A3: dw .demon_F3_name
#_09F3A5: dw .demon_F4_name
#_09F3A7: dw .demon_F5_name
#_09F3A9: dw .demon_F6_name
#_09F3AB: dw .demon_F7_name
#_09F3AD: dw .demon_F8_name
#_09F3AF: dw .demon_F9_name
#_09F3B1: dw .demon_FA_name
#_09F3B3: dw .demon_FB_name
#_09F3B5: dw .demon_FC_name
#_09F3B7: dw .demon_FD_name
#_09F3B9: dw .demon_FE_name
#_09F3BB: dw .demon_FF_name

data09F3BD:
#_09F3BD: dw DATA8_0985DA
#_09F3BF: dw DATA8_0985DF
#_09F3C1: dw DATA8_0985E7
#_09F3C3: dw DATA8_0985EC
#_09F3C5: dw DATA8_0985F0
#_09F3C7: dw DATA8_0985F4
#_09F3C9: dw DATA8_0985F9
#_09F3CB: dw DATA8_0985FE
#_09F3CD: dw DATA8_098605
#_09F3CF: dw DATA8_09860B
#_09F3D1: dw DATA8_098610
#_09F3D3: dw DATA8_098615
#_09F3D5: dw DATA8_09861D
#_09F3D7: dw DATA8_098623
#_09F3D9: dw DATA8_098628
#_09F3DB: dw DATA8_09862B
#_09F3DD: dw DATA8_09862F
#_09F3DF: dw DATA8_098633
#_09F3E1: dw DATA8_098638
#_09F3E3: dw DATA8_09863E
#_09F3E5: dw DATA8_098644
#_09F3E7: dw DATA8_09864C
#_09F3E9: dw DATA8_098652
#_09F3EB: dw DATA8_098657
#_09F3ED: dw DATA8_09865D
#_09F3EF: dw DATA8_098662
#_09F3F1: dw DATA8_098668
#_09F3F3: dw DATA8_09866C
#_09F3F5: dw DATA8_098673
#_09F3F7: dw DATA8_09867B
#_09F3F9: dw DATA8_09867F
#_09F3FB: dw DATA8_098685
#_09F3FD: dw DATA8_09868A
#_09F3FF: dw DATA8_098690
#_09F401: dw DATA8_098694
#_09F403: dw DATA8_098697
#_09F405: dw DATA8_09869D
#_09F407: dw DATA8_0986A5
#_09F409: dw DATA8_0986AD
#_09F40B: dw DATA8_0986B4
#_09F40D: dw DATA8_0986B7
#_09F40F: dw DATA8_0986BA
#_09F411: dw DATA8_0986C2
#_09F413: dw DATA8_0986C8
#_09F415: dw DATA8_0986CF
#_09F417: dw DATA8_0986D6
#_09F419: dw DATA8_0986DD
#_09F41B: dw DATA8_0986E4
#_09F41D: dw DATA8_0986ED
#_09F41F: dw DATA8_0986F4
#_09F421: dw DATA8_0986FC
#_09F423: dw DATA8_098703
#_09F425: dw DATA8_09870B
#_09F427: dw DATA8_098710

;===================================================================================================
; TODO
;===================================================================================================
DATA_09F429:
#_09F429: dw DATA8_098714
#_09F42B: dw DATA8_098718
#_09F42D: dw DATA8_09871C
#_09F42F: dw DATA8_098720
#_09F431: dw DATA8_098724
#_09F433: dw DATA8_098728
#_09F435: dw DATA8_09872C
#_09F437: dw DATA8_098732
#_09F439: dw DATA8_098738
#_09F43B: dw DATA8_09873E
#_09F43D: dw DATA8_098744
#_09F43F: dw DATA8_098749
#_09F441: dw DATA8_09874D
#_09F443: dw DATA8_098751
#_09F445: dw DATA8_098754
#_09F447: dw DATA8_098759
#_09F449: dw DATA8_09875E
#_09F44B: dw DATA8_098764
#_09F44D: dw DATA8_09876A
#_09F44F: dw DATA8_09876F
#_09F451: dw DATA8_098773
#_09F453: dw DATA8_098777
#_09F455: dw DATA8_09877B
#_09F457: dw DATA8_098781
#_09F459: dw DATA8_098789
#_09F45B: dw DATA8_098791
#_09F45D: dw DATA8_098796
#_09F45F: dw DATA8_09879A
#_09F461: dw DATA8_0987A0
#_09F463: dw DATA8_0987A7
#_09F465: dw DATA8_0987AD
#_09F467: dw DATA8_0987B1
#_09F469: dw DATA8_0987B5
#_09F46B: dw DATA8_0987BB
#_09F46D: dw DATA8_0987BE
#_09F46F: dw DATA8_0987C2
#_09F471: dw DATA8_0987C6
#_09F473: dw DATA8_0987C9
#_09F475: dw DATA8_0987CF

SpellNamePointers:
#_09F477: dw .spell_00_name
#_09F479: dw .spell_01_name
#_09F47B: dw .spell_02_name
#_09F47D: dw .spell_03_name
#_09F47F: dw .spell_04_name
#_09F481: dw .spell_05_name
#_09F483: dw .spell_06_name
#_09F485: dw .spell_07_name
#_09F487: dw .spell_08_name
#_09F489: dw .spell_09_name
#_09F48B: dw .spell_0A_name
#_09F48D: dw .spell_0B_name
#_09F48F: dw .spell_0C_name
#_09F491: dw .spell_0D_name
#_09F493: dw .spell_0E_name
#_09F495: dw .spell_0F_name
#_09F497: dw .spell_10_name
#_09F499: dw .spell_11_name
#_09F49B: dw .spell_12_name
#_09F49D: dw .spell_13_name
#_09F49F: dw .spell_14_name
#_09F4A1: dw .spell_15_name
#_09F4A3: dw .spell_16_name
#_09F4A5: dw .spell_17_name
#_09F4A7: dw .spell_18_name
#_09F4A9: dw .spell_19_name
#_09F4AB: dw .spell_1A_name
#_09F4AD: dw .spell_1B_name
#_09F4AF: dw .spell_1C_name
#_09F4B1: dw .spell_1D_name
#_09F4B3: dw .spell_1E_name
#_09F4B5: dw .spell_1F_name
#_09F4B7: dw .spell_20_name
#_09F4B9: dw .spell_21_name
#_09F4BB: dw .spell_22_name
#_09F4BD: dw .spell_23_name
#_09F4BF: dw .spell_24_name
#_09F4C1: dw .spell_25_name
#_09F4C3: dw .spell_26_name
#_09F4C5: dw .spell_27_name
#_09F4C7: dw .spell_28_name
#_09F4C9: dw .spell_29_name
#_09F4CB: dw .spell_2A_name
#_09F4CD: dw .spell_2B_name
#_09F4CF: dw .spell_2C_name
#_09F4D1: dw .spell_2D_name
#_09F4D3: dw .spell_2E_name
#_09F4D5: dw .spell_2F_name
#_09F4D7: dw .spell_30_name
#_09F4D9: dw .spell_31_name
#_09F4DB: dw .spell_32_name
#_09F4DD: dw .spell_33_name
#_09F4DF: dw .spell_34_name
#_09F4E1: dw .spell_35_name
#_09F4E3: dw .spell_36_name
#_09F4E5: dw .spell_37_name
#_09F4E7: dw .spell_38_name
#_09F4E9: dw .spell_39_name
#_09F4EB: dw .spell_3A_name
#_09F4ED: dw .spell_3B_name
#_09F4EF: dw .spell_3C_name
#_09F4F1: dw .spell_3D_name
#_09F4F3: dw .spell_3E_name
#_09F4F5: dw .spell_3F_name
#_09F4F7: dw .spell_40_name
#_09F4F9: dw .spell_41_name
#_09F4FB: dw .spell_42_name
#_09F4FD: dw .spell_43_name
#_09F4FF: dw .spell_44_name
#_09F501: dw .spell_45_name
#_09F503: dw .spell_46_name
#_09F505: dw .spell_47_name
#_09F507: dw .spell_48_name
#_09F509: dw .spell_49_name
#_09F50B: dw .spell_4A_name
#_09F50D: dw .spell_4B_name
#_09F50F: dw .spell_4C_name
#_09F511: dw .spell_4D_name
#_09F513: dw .spell_4E_name
#_09F515: dw .spell_4F_name
#_09F517: dw .spell_50_name
#_09F519: dw .spell_51_name
#_09F51B: dw .spell_52_name
#_09F51D: dw .spell_53_name
#_09F51F: dw .spell_54_name
#_09F521: dw .spell_55_name
#_09F523: dw .spell_56_name
#_09F525: dw .spell_57_name
#_09F527: dw .spell_58_name
#_09F529: dw .spell_59_name
#_09F52B: dw .spell_5A_name
#_09F52D: dw .spell_5B_name
#_09F52F: dw .spell_5C_name
#_09F531: dw .spell_5D_name
#_09F533: dw .spell_5E_name
#_09F535: dw .spell_5F_name
#_09F537: dw .spell_60_name
#_09F539: dw .spell_61_name
#_09F53B: dw .spell_62_name
#_09F53D: dw .spell_63_name
#_09F53F: dw .spell_64_name
#_09F541: dw .spell_65_name
#_09F543: dw .spell_66_name
#_09F545: dw .spell_67_name
#_09F547: dw .spell_68_name
#_09F549: dw .spell_69_name
#_09F54B: dw .spell_6A_name
#_09F54D: dw .spell_6B_name
#_09F54F: dw .spell_6C_name
#_09F551: dw .spell_6D_name
#_09F553: dw .spell_6E_name
#_09F555: dw .spell_6F_name
#_09F557: dw .spell_70_name
#_09F559: dw .spell_71_name
#_09F55B: dw .spell_72_name
#_09F55D: dw .spell_73_name
#_09F55F: dw .spell_74_name
#_09F561: dw .spell_75_name
#_09F563: dw .spell_76_name
#_09F565: dw .spell_77_name
#_09F567: dw .spell_78_name
#_09F569: dw .spell_79_name
#_09F56B: dw .spell_7A_name
#_09F56D: dw .spell_7B_name
#_09F56F: dw .spell_7C_name
#_09F571: dw .spell_7D_name
#_09F573: dw .spell_7E_name
#_09F575: dw .spell_7F_name

ItemNamePointers:
#_09F577: dw .item_00_name
#_09F579: dw .item_01_name
#_09F57B: dw .item_02_name
#_09F57D: dw .item_03_name
#_09F57F: dw .item_04_name
#_09F581: dw .item_05_name
#_09F583: dw .item_06_name
#_09F585: dw .item_07_name
#_09F587: dw .item_08_name
#_09F589: dw .item_09_name
#_09F58B: dw .item_0A_name
#_09F58D: dw .item_0B_name
#_09F58F: dw .item_0C_name
#_09F591: dw .item_0D_name
#_09F593: dw .item_0E_name
#_09F595: dw .item_0F_name
#_09F597: dw .item_10_name
#_09F599: dw .item_11_name
#_09F59B: dw .item_12_name
#_09F59D: dw .item_13_name
#_09F59F: dw .item_14_name
#_09F5A1: dw .item_15_name
#_09F5A3: dw .item_16_name
#_09F5A5: dw .item_17_name
#_09F5A7: dw .item_18_name
#_09F5A9: dw .item_19_name
#_09F5AB: dw .item_1A_name
#_09F5AD: dw .item_1B_name
#_09F5AF: dw .item_1C_name
#_09F5B1: dw .item_1D_name
#_09F5B3: dw .item_1E_name
#_09F5B5: dw .item_1F_name
#_09F5B7: dw .item_20_name
#_09F5B9: dw .item_21_name
#_09F5BB: dw .item_22_name
#_09F5BD: dw .item_23_name
#_09F5BF: dw .item_24_name
#_09F5C1: dw .item_25_name
#_09F5C3: dw .item_26_name
#_09F5C5: dw .item_27_name
#_09F5C7: dw .item_28_name
#_09F5C9: dw .item_29_name
#_09F5CB: dw .item_2A_name
#_09F5CD: dw .item_2B_name
#_09F5CF: dw .item_2C_name
#_09F5D1: dw .item_2D_name
#_09F5D3: dw .item_2E_name
#_09F5D5: dw .item_2F_name
#_09F5D7: dw .item_30_name
#_09F5D9: dw .item_31_name
#_09F5DB: dw .item_32_name
#_09F5DD: dw .item_33_name
#_09F5DF: dw .item_34_name
#_09F5E1: dw .item_35_name
#_09F5E3: dw .item_36_name
#_09F5E5: dw .item_37_name
#_09F5E7: dw .item_38_name
#_09F5E9: dw .item_39_name
#_09F5EB: dw .item_3A_name
#_09F5ED: dw .item_3B_name
#_09F5EF: dw .item_3C_name
#_09F5F1: dw .item_3D_name
#_09F5F3: dw .item_3E_name
#_09F5F5: dw .item_3F_name
#_09F5F7: dw .item_40_name
#_09F5F9: dw .item_41_name
#_09F5FB: dw .item_42_name
#_09F5FD: dw .item_43_name
#_09F5FF: dw .item_44_name
#_09F601: dw .item_45_name
#_09F603: dw .item_46_name
#_09F605: dw .item_47_name
#_09F607: dw .item_48_name
#_09F609: dw .item_49_name
#_09F60B: dw .item_4A_name
#_09F60D: dw .item_4B_name
#_09F60F: dw .item_4C_name
#_09F611: dw .item_4D_name
#_09F613: dw .item_4E_name
#_09F615: dw .item_4F_name
#_09F617: dw .item_50_name
#_09F619: dw .item_51_name
#_09F61B: dw .item_52_name
#_09F61D: dw .item_53_name
#_09F61F: dw .item_54_name
#_09F621: dw .item_55_name
#_09F623: dw .item_56_name
#_09F625: dw .item_57_name
#_09F627: dw .item_58_name
#_09F629: dw .item_59_name
#_09F62B: dw .item_5A_name
#_09F62D: dw .item_5B_name
#_09F62F: dw .item_5C_name
#_09F631: dw .item_5D_name
#_09F633: dw .item_5E_name
#_09F635: dw .item_5F_name
#_09F637: dw .item_60_name
#_09F639: dw .item_61_name
#_09F63B: dw .item_62_name
#_09F63D: dw .item_63_name
#_09F63F: dw .item_64_name
#_09F641: dw .item_65_name
#_09F643: dw .item_66_name
#_09F645: dw .item_67_name
#_09F647: dw .item_68_name
#_09F649: dw .item_69_name
#_09F64B: dw .item_6A_name
#_09F64D: dw .item_6B_name
#_09F64F: dw .item_6C_name
#_09F651: dw .item_6D_name
#_09F653: dw .item_6E_name
#_09F655: dw .item_6F_name
#_09F657: dw .item_70_name
#_09F659: dw .item_71_name
#_09F65B: dw .item_72_name
#_09F65D: dw .item_73_name
#_09F65F: dw .item_74_name
#_09F661: dw .item_75_name
#_09F663: dw .item_76_name
#_09F665: dw .item_77_name
#_09F667: dw .item_78_name
#_09F669: dw .item_79_name
#_09F66B: dw .item_7A_name
#_09F66D: dw .item_7B_name
#_09F66F: dw .item_7C_name
#_09F671: dw .item_7D_name
#_09F673: dw .item_7E_name
#_09F675: dw .item_7F_name
#_09F677: dw .item_80_name
#_09F679: dw .item_81_name
#_09F67B: dw .item_82_name
#_09F67D: dw .item_83_name
#_09F67F: dw .item_84_name
#_09F681: dw .item_85_name
#_09F683: dw .item_86_name
#_09F685: dw .item_87_name
#_09F687: dw .item_88_name
#_09F689: dw .item_89_name
#_09F68B: dw .item_8A_name
#_09F68D: dw .item_8B_name
#_09F68F: dw .item_8C_name
#_09F691: dw .item_8D_name
#_09F693: dw .item_8E_name
#_09F695: dw .item_8F_name
#_09F697: dw .item_90_name
#_09F699: dw .item_91_name
#_09F69B: dw .item_92_name
#_09F69D: dw .item_93_name
#_09F69F: dw .item_94_name
#_09F6A1: dw .item_95_name
#_09F6A3: dw .item_96_name
#_09F6A5: dw .item_97_name
#_09F6A7: dw .item_98_name
#_09F6A9: dw .item_99_name
#_09F6AB: dw .item_9A_name
#_09F6AD: dw .item_9B_name
#_09F6AF: dw .item_9C_name
#_09F6B1: dw .item_9D_name
#_09F6B3: dw .item_9E_name
#_09F6B5: dw .item_9F_name
#_09F6B7: dw .item_A0_name
#_09F6B9: dw .item_A1_name
#_09F6BB: dw .item_A2_name
#_09F6BD: dw .item_A3_name
#_09F6BF: dw .item_A4_name
#_09F6C1: dw .item_A5_name
#_09F6C3: dw .item_A6_name
#_09F6C5: dw .item_A7_name
#_09F6C7: dw .item_A8_name
#_09F6C9: dw .item_A9_name
#_09F6CB: dw .item_AA_name
#_09F6CD: dw .item_AB_name
#_09F6CF: dw .item_AC_name
#_09F6D1: dw .item_AD_name
#_09F6D3: dw .item_AE_name
#_09F6D5: dw .item_AF_name
#_09F6D7: dw .item_B0_name
#_09F6D9: dw .item_B1_name
#_09F6DB: dw .item_B2_name
#_09F6DD: dw .item_B3_name
#_09F6DF: dw .item_B4_name
#_09F6E1: dw .item_B5_name
#_09F6E3: dw .item_B6_name
#_09F6E5: dw .item_B7_name
#_09F6E7: dw .item_B8_name
#_09F6E9: dw .item_B9_name
#_09F6EB: dw .item_BA_name
#_09F6ED: dw .item_BB_name
#_09F6EF: dw .item_BC_name
#_09F6F1: dw .item_BD_name
#_09F6F3: dw .item_BE_name
#_09F6F5: dw .item_BF_name
#_09F6F7: dw .item_C0_name
#_09F6F9: dw .item_C1_name
#_09F6FB: dw .item_C2_name
#_09F6FD: dw .item_C3_name
#_09F6FF: dw .item_C4_name
#_09F701: dw .item_C5_name
#_09F703: dw .item_C6_name
#_09F705: dw .item_C7_name
#_09F707: dw .item_C8_name
#_09F709: dw .item_C9_name
#_09F70B: dw .item_CA_name
#_09F70D: dw .item_CB_name
#_09F70F: dw .item_CC_name
#_09F711: dw .item_CD_name
#_09F713: dw .item_CE_name
#_09F715: dw .item_CF_name
#_09F717: dw .item_D0_name
#_09F719: dw .item_D1_name
#_09F71B: dw .item_D2_name
#_09F71D: dw .item_D3_name
#_09F71F: dw .item_D4_name
#_09F721: dw .item_D5_name
#_09F723: dw .item_D6_name
#_09F725: dw .item_D7_name
#_09F727: dw .item_D8_name
#_09F729: dw .item_D9_name
#_09F72B: dw .item_DA_name
#_09F72D: dw .item_DB_name
#_09F72F: dw .item_DC_name
#_09F731: dw .item_DD_name
#_09F733: dw .item_DE_name
#_09F735: dw .item_DF_name
#_09F737: dw .item_E0_name
#_09F739: dw .item_E1_name
#_09F73B: dw .item_E2_name
#_09F73D: dw .item_E3_name
#_09F73F: dw .item_E4_name
#_09F741: dw .item_E5_name
#_09F743: dw .item_E6_name
#_09F745: dw .item_E7_name
#_09F747: dw .item_E8_name
#_09F749: dw .item_E9_name
#_09F74B: dw .item_EA_name
#_09F74D: dw .item_EB_name
#_09F74F: dw .item_EC_name
#_09F751: dw .item_ED_name
#_09F753: dw .item_EE_name
#_09F755: dw .item_EF_name
#_09F757: dw .item_F0_name
#_09F759: dw .item_F1_name
#_09F75B: dw .item_F2_name
#_09F75D: dw .item_F3_name
#_09F75F: dw .item_F4_name
#_09F761: dw .item_F5_name
#_09F763: dw .item_F6_name
#_09F765: dw .item_F7_name
#_09F767: dw .item_F8_name
#_09F769: dw .item_F9_name
#_09F76B: dw .item_FA_name
#_09F76D: dw .item_FB_name
#_09F76F: dw .item_FC_name
#_09F771: dw .item_FD_name
#_09F773: dw .item_FE_name
#_09F775: dw .item_FF_name
#_09F777: dw .item_terminator

.item_terminator:
#_09F779: db $5A,$5A,$5A,$5A,$5A,$5A,$5A,$5A
#_09F781: db $FF

; TODO handle this table and stuff
#_09F782: dw DATA8_0991E3
#_09F784: dw DATA8_0991E8
#_09F786: dw DATA8_0991EB
#_09F788: dw DATA8_0991F4
#_09F78A: dw DATA8_0991FB
#_09F78C: dw DATA8_099201
#_09F78E: dw DATA8_09920A
#_09F790: dw DATA8_099213
#_09F792: dw DATA8_09921B

PTR16_09F794:
#_09F794: dw DATA8_099224
#_09F796: dw DATA8_09929A
#_09F798: dw DATA8_0992F7
#_09F79A: dw DATA8_099360
#_09F79C: dw DATA8_09937C
#_09F79E: dw DATA8_099380
#_09F7A0: dw DATA8_099395
#_09F7A2: dw DATA8_0993ED
#_09F7A4: dw DATA8_099455
#_09F7A6: dw DATA8_09945E
#_09F7A8: dw DATA8_09948D
#_09F7AA: dw DATA8_09951A
#_09F7AC: dw DATA8_09951C
#_09F7AE: dw DATA8_099521
#_09F7B0: dw DATA8_099523
#_09F7B2: dw DATA8_0995FF
#_09F7B4: dw DATA8_099646
#_09F7B6: dw DATA8_099681
#_09F7B8: dw DATA8_099692
#_09F7BA: dw DATA8_09969C
#_09F7BC: dw DATA8_0996E0
#_09F7BE: dw DATA8_099718
#_09F7C0: dw DATA8_09971D
#_09F7C2: dw DATA8_099726
#_09F7C4: dw DATA8_09972D
#_09F7C6: dw DATA8_09975D
#_09F7C8: dw DATA8_099782
#_09F7CA: dw DATA8_099793
#_09F7CC: dw DATA8_09979C
#_09F7CE: dw DATA8_0997A9
#_09F7D0: dw DATA8_099816
#_09F7D2: dw DATA8_09981D
#_09F7D4: dw DATA8_09983A
#_09F7D6: dw DATA8_099851
#_09F7D8: dw DATA8_099870
#_09F7DA: dw DATA8_09987C
#_09F7DC: dw DATA8_0998AA
#_09F7DE: dw DATA8_0998C9
#_09F7E0: dw DATA8_0998DF
#_09F7E2: dw DATA8_0998E4
#_09F7E4: dw DATA8_0998EC
#_09F7E6: dw DATA8_0998F6
#_09F7E8: dw DATA8_099902
#_09F7EA: dw DATA8_09990E
#_09F7EC: dw DATA8_099924
#_09F7EE: dw DATA8_09993A
#_09F7F0: dw DATA8_099963
#_09F7F2: dw DATA8_0999A1
#_09F7F4: dw DATA8_0999DF
#_09F7F6: dw DATA8_099A1D
#_09F7F8: dw DATA8_099A5B
#_09F7FA: dw DATA8_099A96
#_09F7FC: dw DATA8_099A9E
#_09F7FE: dw DATA8_099AD7
#_09F800: dw DATA8_099AF6
#_09F802: dw DATA8_099B28
#_09F804: dw DATA8_099B57
#_09F806: dw DATA8_099B7F
#_09F808: dw DATA8_099BEA
#_09F80A: dw DATA8_099C58
#_09F80C: dw DATA8_099CC1
#_09F80E: dw DATA8_099CCB
#_09F810: dw DATA8_099CE5
#_09F812: dw DATA8_099D05
#_09F814: dw DATA8_099D1B
#_09F816: dw DATA8_099D3B
PTR16_09F818:
#_09F818: dw DATA8_099D40
#_09F81A: dw DATA8_099DB9
#_09F81C: dw DATA8_099DE3
#_09F81E: dw DATA8_099DFB
#_09F820: dw DATA8_099E31
#_09F822: dw DATA8_099EB2
#_09F824: dw DATA8_099F48
#_09F826: dw DATA8_099F75
#_09F828: dw DATA8_099FB3
#_09F82A: dw DATA8_099FDC
#_09F82C: dw DATA8_09A02B
#_09F82E: dw DATA8_09A03A
#_09F830: dw DATA8_09A03F
#_09F832: dw DATA8_09A049
#_09F834: dw DATA8_09A04B
#_09F836: dw DATA8_09A053
#_09F838: dw DATA8_09A070
#_09F83A: dw DATA8_09A074
#_09F83C: dw DATA8_09A078
#_09F83E: dw DATA8_09A0A6
#_09F840: dw DATA8_09A0EA
#_09F842: dw DATA8_09A123
#_09F844: dw DATA8_09A159
#_09F846: dw DATA8_09A1A2
#_09F848: dw DATA8_09A1D5
#_09F84A: dw DATA8_09A221
#_09F84C: dw DATA8_09A22E
#_09F84E: dw DATA8_09A237
#_09F850: dw DATA8_09A2D2
#_09F852: dw DATA8_09A30A
#_09F854: dw DATA8_09A350
#_09F856: dw DATA8_09A381
#_09F858: dw DATA8_09A4FA
#_09F85A: dw DATA8_09A585
#_09F85C: dw DATA8_09A5B2
#_09F85E: dw DATA8_09A5E5
#_09F860: dw DATA8_09A61F
#_09F862: dw DATA8_09A624
#_09F864: dw DATA8_09A632
#_09F866: dw DATA8_09A637
#_09F868: dw DATA8_09A64C
#_09F86A: dw DATA8_09A651
#_09F86C: dw DATA8_09A691
#_09F86E: dw DATA8_09A693
#_09F870: dw DATA8_09A6A4
#_09F872: dw DATA8_09A6A8
#_09F874: dw DATA8_09A6C1
#_09F876: dw DATA8_09A6D4
#_09F878: dw DATA8_09A6E1
#_09F87A: dw DATA8_09A6E7
#_09F87C: dw DATA8_09A6ED
#_09F87E: dw DATA8_09A706
#_09F880: dw DATA8_09A711
PTR16_09F882:
#_09F882: dw DATA8_09A716
#_09F884: dw DATA8_09A785
#_09F886: dw DATA8_09A7B4
#_09F888: dw DATA8_09A7B9
#_09F88A: dw DATA8_09A852
#_09F88C: dw DATA8_09A87E
#_09F88E: dw DATA8_09A890
#_09F890: dw DATA8_09A894
#_09F892: dw DATA8_09A8B2
#_09F894: dw DATA8_09A8CA
#_09F896: dw DATA8_09A9E2
#_09F898: dw DATA8_09A9EF
#_09F89A: dw DATA8_09A9FA
#_09F89C: dw DATA8_09AA02
#_09F89E: dw DATA8_09AA0D
#_09F8A0: dw DATA8_09AA12
#_09F8A2: dw DATA8_09AA17
#_09F8A4: dw DATA8_09AA29
#_09F8A6: dw DATA8_09AA3C
#_09F8A8: dw DATA8_09ABB4
#_09F8AA: dw DATA8_09AC02
#_09F8AC: dw DATA8_09ACE5
#_09F8AE: dw DATA8_09ACFD
#_09F8B0: dw DATA8_09AD4D
#_09F8B2: dw DATA8_09AD5B
#_09F8B4: dw DATA8_09AD6A
#_09F8B6: dw DATA8_09AD71
#_09F8B8: dw DATA8_09AD8E
#_09F8BA: dw DATA8_09ADC2
#_09F8BC: dw DATA8_09ADDC
#_09F8BE: dw DATA8_09AEBC
#_09F8C0: dw DATA8_09AEC2
#_09F8C2: dw DATA8_09AEDB
#_09F8C4: dw DATA8_09AEFD
#_09F8C6: dw DATA8_09AF10
#_09F8C8: dw DATA8_09AFB7
#_09F8CA: dw DATA8_09B049
#_09F8CC: dw DATA8_09B09C
#_09F8CE: dw DATA8_09B0C4
#_09F8D0: dw DATA8_09B11C
#_09F8D2: dw DATA8_09B121
#_09F8D4: dw DATA8_09B1A8
#_09F8D6: dw DATA8_09B21D
#_09F8D8: dw DATA8_09B222
#_09F8DA: dw DATA8_09B2EE
#_09F8DC: dw DATA8_09B31B
#_09F8DE: dw DATA8_09B3B7
#_09F8E0: dw DATA8_09B3BC
#_09F8E2: dw DATA8_09B43C
#_09F8E4: dw DATA8_09B4E6
#_09F8E6: dw DATA8_09B51C
#_09F8E8: dw DATA8_09B51D
#_09F8EA: dw DATA8_09B52F
#_09F8EC: dw DATA8_09B5E3
#_09F8EE: dw DATA8_09B5E4
#_09F8F0: dw DATA8_09B5E9
#_09F8F2: dw DATA8_09B613
#_09F8F4: dw DATA8_09B64F
#_09F8F6: dw DATA8_09B66F
#_09F8F8: dw DATA8_09B67C
#_09F8FA: dw DATA8_09B683
#_09F8FC: dw DATA8_09B6D2
#_09F8FE: dw DATA8_09B6F7
#_09F900: dw DATA8_09B704
#_09F902: dw DATA8_09B70B
#_09F904: dw DATA8_09B74B
#_09F906: dw DATA8_09B77F
#_09F908: dw DATA8_09B78C
#_09F90A: dw DATA8_09B793
#_09F90C: dw DATA8_09B7C9
#_09F90E: dw DATA8_09B808
#_09F910: dw DATA8_09B815
#_09F912: dw DATA8_09B81C
#_09F914: dw DATA8_09B885
#_09F916: dw DATA8_09B8B2
#_09F918: dw DATA8_09B8BD
#_09F91A: dw DATA8_09B8DD
#_09F91C: dw DATA8_09B8FF
#_09F91E: dw DATA8_09B908
#_09F920: dw DATA8_09B95F
#_09F922: dw DATA8_09B96C
#_09F924: dw DATA8_09B973
#_09F926: dw DATA8_09B998
#_09F928: dw DATA8_09B9C0
#_09F92A: dw DATA8_09B9CF
#_09F92C: dw DATA8_09B9D6
#_09F92E: dw DATA8_09B9E4
#_09F930: dw DATA8_09B9FE
#_09F932: dw DATA8_09BA0D
#_09F934: dw DATA8_09BA14
#_09F936: dw DATA8_09BA22
#_09F938: dw DATA8_09BA34
#_09F93A: dw DATA8_09BA9E
#_09F93C: dw DATA8_09BAD0
#_09F93E: dw DATA8_09BB38
#_09F940: dw DATA8_09BB74
#_09F942: dw DATA8_09BBD9
#_09F944: dw DATA8_09BBEE
#_09F946: dw DATA8_09BC08
#_09F948: dw DATA8_09BC0E
#_09F94A: dw DATA8_09BC24
#_09F94C: dw DATA8_09BC35
#_09F94E: dw DATA8_09BC40
#_09F950: dw DATA8_09BC46
#_09F952: dw DATA8_09BC4B
#_09F954: dw DATA8_09BC4B
#_09F956: dw DATA8_09BC4B
PTR16_09F958:
#_09F958: dw DATA8_09BC4C
#_09F95A: dw DATA8_09BC65
#_09F95C: dw DATA8_09BCB7
#_09F95E: dw DATA8_09BCFF
#_09F960: dw DATA8_09BD32
#_09F962: dw DATA8_09BD68
#_09F964: dw DATA8_09BD8E
#_09F966: dw DATA8_09BD93
#_09F968: dw DATA8_09BE37
#_09F96A: dw DATA8_09BE4C
#_09F96C: dw DATA8_09BE6E
#_09F96E: dw DATA8_09BE79
#_09F970: dw DATA8_09BE87
#_09F972: dw DATA8_09BEA4
#_09F974: dw DATA8_09BEBD
#_09F976: dw DATA8_09BEDA
#_09F978: dw DATA8_09BEF6
#_09F97A: dw DATA8_09BF28
#_09F97C: dw DATA8_09BF4D
#_09F97E: dw DATA8_09BF63
#_09F980: dw DATA8_09BF86
#_09F982: dw DATA8_09BF98
#_09F984: dw DATA8_09BFAF
#_09F986: dw DATA8_09BFB3
#_09F988: dw DATA8_09BFDC
#_09F98A: dw DATA8_09BFE2
#_09F98C: dw DATA8_09BFF3
#_09F98E: dw DATA8_09C00B
#_09F990: dw DATA8_09C021
#_09F992: dw DATA8_09C036
#_09F994: dw DATA8_09C058
#_09F996: dw DATA8_09C207
#_09F998: dw DATA8_09C222
#_09F99A: dw DATA8_09C2D7
#_09F99C: dw DATA8_09C2D8
#_09F99E: dw DATA8_09C2E8
#_09F9A0: dw DATA8_09C2F9
#_09F9A2: dw DATA8_09C310
#_09F9A4: dw DATA8_09C32B
#_09F9A6: dw DATA8_09C388
#_09F9A8: dw DATA8_09C389
#_09F9AA: dw DATA8_09C397
#_09F9AC: dw DATA8_09C3BA
#_09F9AE: dw DATA8_09C3BF
#_09F9B0: dw DATA8_09C42D
#_09F9B2: dw DATA8_09C472
#_09F9B4: dw DATA8_09C4B8
#_09F9B6: dw DATA8_09C50D
#_09F9B8: dw DATA8_09C53A
#_09F9BA: dw DATA8_09C5BC
#_09F9BC: dw DATA8_09C5F2
#_09F9BE: dw DATA8_09C633
#_09F9C0: dw DATA8_09C672
#_09F9C2: dw DATA8_09C6B0
#_09F9C4: dw DATA8_09C6FE
#_09F9C6: dw DATA8_09C72C
#_09F9C8: dw DATA8_09C731
#_09F9CA: dw DATA8_09C75F
#_09F9CC: dw DATA8_09C764
#_09F9CE: dw DATA8_09C790
#_09F9D0: dw DATA8_09C795
#_09F9D2: dw DATA8_09C7E6
#_09F9D4: dw DATA8_09C7FE
#_09F9D6: dw DATA8_09C81E
#_09F9D8: dw DATA8_09C83A
#_09F9DA: dw DATA8_09C848
#_09F9DC: dw DATA8_09C85B
#_09F9DE: dw DATA8_09C866
#_09F9E0: dw DATA8_09C869
PTR16_09F9E2:
#_09F9E2: dw DATA8_09C86C
#_09F9E4: dw DATA8_09C88E
#_09F9E6: dw DATA8_09C890
#_09F9E8: dw DATA8_09C895
#_09F9EA: dw DATA8_09C897
#_09F9EC: dw DATA8_09C97D
#_09F9EE: dw DATA8_09C9AF
#_09F9F0: dw DATA8_09CA27
#_09F9F2: dw DATA8_09CA30
#_09F9F4: dw DATA8_09CA69
#_09F9F6: dw DATA8_09CAD3
#_09F9F8: dw DATA8_09CB0B
#_09F9FA: dw DATA8_09CB0C
#_09F9FC: dw DATA8_09CB64
#_09F9FE: dw DATA8_09CB68
#_09FA00: dw DATA8_09CBA7
#_09FA02: dw DATA8_09CBCC
#_09FA04: dw DATA8_09CBED
#_09FA06: dw DATA8_09CC59
#_09FA08: dw DATA8_09CC5C
#_09FA0A: dw DATA8_09CC61
#_09FA0C: dw DATA8_09CCC5
#_09FA0E: dw DATA8_09CCD2
#_09FA10: dw DATA8_09CD06
#_09FA12: dw DATA8_09CD31
#_09FA14: dw DATA8_09CD8D
#_09FA16: dw DATA8_09CE4B
#_09FA18: dw DATA8_09CEF1
#_09FA1A: dw DATA8_09CF14
#_09FA1C: dw DATA8_09CF4E
#_09FA1E: dw DATA8_09CFB7
#_09FA20: dw DATA8_09CFFF
#_09FA22: dw DATA8_09D045
#_09FA24: dw DATA8_09D0AA
#_09FA26: dw DATA8_09D0D8
#_09FA28: dw DATA8_09D124
#_09FA2A: dw DATA8_09D127
#_09FA2C: dw DATA8_09D13C
#_09FA2E: dw DATA8_09D1B6
#_09FA30: dw DATA8_09D1F4
#_09FA32: dw DATA8_09D224
#_09FA34: dw DATA8_09D289
#_09FA36: dw DATA8_09D2D4
#_09FA38: dw DATA8_09D2FE
#_09FA3A: dw DATA8_09D355
#_09FA3C: dw DATA8_09D3A6
#_09FA3E: dw DATA8_09D42A
#_09FA40: dw DATA8_09D42F
#_09FA42: dw DATA8_09D47B
#_09FA44: dw DATA8_09D480
#_09FA46: dw DATA8_09D4BD
#_09FA48: dw DATA8_09D4C2
#_09FA4A: dw DATA8_09D4F6
#_09FA4C: dw DATA8_09D507
#_09FA4E: dw DATA8_09D521
#_09FA50: dw DATA8_09D529
#_09FA52: dw DATA8_09D536
#_09FA54: dw DATA8_09D53C
#_09FA56: dw DATA8_09D542
#_09FA58: dw DATA8_09D55B
#_09FA5A: dw DATA8_09D566
#_09FA5C: dw DATA8_09D573
#_09FA5E: dw DATA8_09D579
#_09FA60: dw DATA8_09D57F
#_09FA62: dw DATA8_09D598
#_09FA64: dw DATA8_09D5A3
#_09FA66: dw DATA8_09D5B0
#_09FA68: dw DATA8_09D5B6
#_09FA6A: dw DATA8_09D5BC
#_09FA6C: dw DATA8_09D5D5
#_09FA6E: dw DATA8_09D5E0
#_09FA70: dw DATA8_09D5ED
#_09FA72: dw DATA8_09D5F3
#_09FA74: dw DATA8_09D5F9
#_09FA76: dw DATA8_09D612
#_09FA78: dw DATA8_09D61D
PTR16_09FA7A:
#_09FA7A: dw DATA8_09D622
#_09FA7C: dw DATA8_09D62B
#_09FA7E: dw DATA8_09D62E
#_09FA80: dw DATA8_09D650
#_09FA82: dw DATA8_09D651
#_09FA84: dw DATA8_09D6D5
#_09FA86: dw DATA8_09D6F7
#_09FA88: dw DATA8_09D75A
#_09FA8A: dw DATA8_09D83E
#_09FA8C: dw DATA8_09D847
#_09FA8E: dw DATA8_09D84C
#_09FA90: dw DATA8_09D873
#_09FA92: dw DATA8_09D905
#_09FA94: dw DATA8_09D93D
#_09FA96: dw DATA8_09D95A
#_09FA98: dw DATA8_09D989
#_09FA9A: dw DATA8_09D9E3
#_09FA9C: dw DATA8_09D9F9
#_09FA9E: dw DATA8_09DA09
#_09FAA0: dw DATA8_09DA0D
#_09FAA2: dw DATA8_09DA70
#_09FAA4: dw DATA8_09DA9E
#_09FAA6: dw DATA8_09DAA3
#_09FAA8: dw DATA8_09DB13
#_09FAAA: dw DATA8_09DB48
#_09FAAC: dw DATA8_09DB98
#_09FAAE: dw DATA8_09DBBC
#_09FAB0: dw DATA8_09DBE3
#_09FAB2: dw DATA8_09DC76
#_09FAB4: dw DATA8_09DCDE
#_09FAB6: dw DATA8_09DCE3
#_09FAB8: dw DATA8_09DCE8
#_09FABA: dw DATA8_09DD26
#_09FABC: dw DATA8_09DD89
#_09FABE: dw DATA8_09DD9C
#_09FAC0: dw DATA8_09DDC6
#_09FAC2: dw DATA8_09DE08
#_09FAC4: dw DATA8_09DE45
#_09FAC6: dw DATA8_09DE85
#_09FAC8: dw DATA8_09DE9A
#_09FACA: dw DATA8_09DEFD
#_09FACC: dw DATA8_09DF1F
#_09FACE: dw DATA8_09DF5A
#_09FAD0: dw DATA8_09DF6A
#_09FAD2: dw DATA8_09DF71
#_09FAD4: dw DATA8_09DF81
#_09FAD6: dw DATA8_09DF88
#_09FAD8: dw DATA8_09DF98
#_09FADA: dw DATA8_09DF9F
#_09FADC: dw DATA8_09DFAF
#_09FADE: dw DATA8_09DFB6
#_09FAE0: dw DATA8_09DFC6
#_09FAE2: dw DATA8_09DFCD
#_09FAE4: dw DATA8_09DFDD
#_09FAE6: dw DATA8_09DFE4
#_09FAE8: dw DATA8_09DFF4
#_09FAEA: dw DATA8_09DFFB
#_09FAEC: dw DATA8_09E00B
#_09FAEE: dw DATA8_09E012
#_09FAF0: dw DATA8_09E01F
#_09FAF2: dw DATA8_09E029
#_09FAF4: dw DATA8_09E033
#_09FAF6: dw DATA8_09E038
#_09FAF8: dw DATA8_09E03C
#_09FAFA: dw DATA8_09E03F
#_09FAFC: dw DATA8_09E044
#_09FAFE: dw DATA8_09E04A
PTR16_09FB00:
#_09FB00: dw DATA8_09E04F
#_09FB02: dw DATA8_09E05D
#_09FB04: dw DATA8_09E062
#_09FB06: dw DATA8_09E075
#_09FB08: dw DATA8_09E0E1
#_09FB0A: dw DATA8_09E1C1
#_09FB0C: dw DATA8_09E1D6
#_09FB0E: dw DATA8_09E201
#_09FB10: dw DATA8_09E22D
#_09FB12: dw DATA8_09E24C
#_09FB14: dw DATA8_09E296
#_09FB16: dw DATA8_09E2B3
#_09FB18: dw DATA8_09E30F
#_09FB1A: dw DATA8_09E3E5
#_09FB1C: dw DATA8_09E400
#_09FB1E: dw DATA8_09E43E
#_09FB20: dw DATA8_09E443
#_09FB22: dw DATA8_09E4B0
#_09FB24: dw DATA8_09E4C1
#_09FB26: dw DATA8_09E4F7
#_09FB28: dw DATA8_09E4FB
#_09FB2A: dw DATA8_09E504
#_09FB2C: dw DATA8_09E52B
#_09FB2E: dw DATA8_09E574
#_09FB30: dw DATA8_09E58A
#_09FB32: dw DATA8_09E598
#_09FB34: dw DATA8_09E5A3
PTR16_09FB36:
#_09FB36: dw DATA8_09E5B0
#_09FB38: dw DATA8_09E5BE
#_09FB3A: dw DATA8_09E5EA
#_09FB3C: dw DATA8_09E609
#_09FB3E: dw DATA8_09E682
#_09FB40: dw DATA8_09E6A9
#_09FB42: dw DATA8_09E738
#_09FB44: dw DATA8_09E73E
#_09FB46: dw DATA8_09E7D7
#_09FB48: dw DATA8_09E81D
#_09FB4A: dw DATA8_09E893
#_09FB4C: dw DATA8_09E90B
#_09FB4E: dw DATA8_09E95C
#_09FB50: dw DATA8_09E98E
#_09FB52: dw DATA8_09E99B
#_09FB54: dw DATA8_09E9E0
#_09FB56: dw DATA8_09EA01
#_09FB58: dw DATA8_09EA5F
#_09FB5A: dw DATA8_09EA7C
#_09FB5C: dw DATA8_09EAD6
#_09FB5E: dw DATA8_09EB1E
#_09FB60: dw DATA8_09EB20
#_09FB62: dw DATA8_09EB25
#_09FB64: dw DATA8_09EB94
#_09FB66: dw DATA8_09EB99
#_09FB68: dw DATA8_09EC58
#_09FB6A: dw DATA8_09EC5C
#_09FB6C: dw DATA8_09EC92
#_09FB6E: dw DATA8_09ECDE
#_09FB70: dw DATA8_09ECE2
#_09FB72: dw DATA8_09ECFC
#_09FB74: dw DATA8_09ED51
#_09FB76: dw DATA8_09EDC0
#_09FB78: dw DATA8_09EDC5
#_09FB7A: dw DATA8_09EDCB
#_09FB7C: dw DATA8_09EE05
PTR16_09FB7E:
#_09FB7E: dw DATA8_09EE0A
#_09FB80: dw DATA8_09EE11
#_09FB82: dw DATA8_09EE16
#_09FB84: dw DATA8_09EE3F
#_09FB86: dw DATA8_09EED8
#_09FB88: dw DATA8_09EED8
#_09FB8A: dw DATA8_09EEF6
#_09FB8C: dw DATA8_09EF0B
#_09FB8E: dw DATA8_09EF19
#_09FB90: dw DATA8_09EF23
#_09FB92: dw DATA8_09EF2D
#_09FB94: dw DATA8_09EF44
#_09FB96: dw DATA8_09EF44
#_09FB98: dw DATA8_09EF49
#_09FB9A: dw DATA8_09EF63
#_09FB9C: dw DATA8_09EF63
#_09FB9E: dw DATA8_09EF76
#_09FBA0: dw DATA8_09EF7C
#_09FBA2: dw DATA8_09EF8D
#_09FBA4: dw DATA8_09EFB8
#_09FBA6: dw DATA8_09EFDE
#_09FBA8: dw DATA8_09F007
#_09FBAA: dw DATA8_09F01A
#_09FBAC: dw DATA8_09F02D
#_09FBAE: dw DATA8_09F043
#_09FBB0: dw DATA8_09F068
PTR16_09FBB2:
#_09FBB2: dw DATA8_09F085
#_09FBB4: dw DATA8_09F0A9
#_09FBB6: dw DATA8_09F0BB
#_09FBB8: dw DATA8_09F0D1
#_09FBBA: dw DATA8_09F0E9
#_09FBBC: dw DATA8_09F0F7
#_09FBBE: dw DATA8_09F0FD
#_09FBC0: dw DATA8_09F115
PTR16_09FBC2:
#_09FBC2: dw DATA8_09F116
#_09FBC4: dw DATA8_09F11F
#_09FBC6: dw DATA8_09F128
#_09FBC8: dw DATA8_09F131
#_09FBCA: dw DATA8_09F13A
#_09FBCC: dw DATA8_09F143
#_09FBCE: dw DATA8_09F14C
#_09FBD0: dw DATA8_09F155
#_09FBD2: dw DATA8_09F15E
#_09FBD4: dw DATA8_09F167
#_09FBD6: dw DATA8_09F170
#_09FBD8: dw DATA8_09F179
#_09FBDA: dw DATA8_09F182
#_09FBDC: dw DATA8_09F18C
#_09FBDE: dw DATA8_09F18E
#_09FBE0: dw DATA8_09F192
#_09FBE2: dw DATA8_09F19B
#_09FBE4: dw DATA8_09F19F
#_09FBE6: dw DATA8_09F1A3
#_09FBE8: dw DATA8_09F1B9

data09FBEA:
#_09FBEA: db $CF,$12,$1A,$93,$17,$1A,$2A,$26
#_09FBF2: db $40,$2C,$FF

data09FBF4:
#_09FBF5: db $CF,$69,$6F,$5E,$6C,$69,$35,$4C
#_09FBFD: db $57,$27,$FF

data09FC00:
#_09FC00: db $CF,$40,$58,$2A,$36,$FF

data09FC06:
#_09FC06: db $CF,$3D,$4F,$26,$51,$CF,$38,$2C
#_09FC0E: db $FF

data09FC0F:
#_09FC0F: db $CF,$5D,$5E,$6F,$7D,$51,$CF,$2A
#_09FC17: db $27,$FF

data09FC19:
#_09FC19: db $CF,$2B,$4F,$2C,$FF

data09FC1E:
#_09FC1E: db $CF,$37,$52,$33,$27,$FF

data09FC24:
#_09FC24: db $CF,$03,$30,$52,$CF,$9C,$58,$34
#_09FC2C: db $26,$FF

data09FC2E:
#_09FC2E: db $CF,$04,$30,$52,$CF,$9C,$58,$34
#_09FC36: db $26,$FF

data09FC38:
#_09FC38: db $CF,$69,$6F,$5E,$6C,$69,$51,$CF
#_09FC40: db $44,$4D,$FF

data09FC43:
#_09FC43: db $CF,$66,$8A,$CA,$90,$5A,$6C,$FF

data09Fc4b:
#_09FC4B: db $CF,$41,$48,$51,$CF,$A9,$4D,$FF

data09FC53:
#_09FC53: db $CF,$A2,$AD,$52,$3D,$CF,$41,$48
#_09FC5B: db $3A,$CF,$26,$2C,$FF

data09FC60:
#_09FC60: db $CF,$31,$26,$44,$52,$51,$CF,$38
#_09FC68: db $4D,$FF

data09FC6A:
#_09FC6A: db $CF,$33,$38,$3A,$CF,$A9,$2A,$2D
#_09FC72: db $4D,$FF

data09FC74:
#_09FC74: db $CF,$30,$57,$27,$A2,$57,$51,$CF
#_09FC7C: db $34,$31,$2D,$3A,$26,$2C,$FF

data09FC83:
#_09FC83: db $CF,$61,$BA,$88,$3D,$2A,$2C,$4E
#_09FC8B: db $9C,$41,$CF,$26,$2C,$FF

data09FC91:
#_09FC91: db $CF,$27,$4D,$FF

data09FC95:
#_09FC95: db $CF,$44,$32,$51,$CF,$A9,$4D,$FF

data09FC9D:
#_09FC9D: db $CF,$2A,$2D,$A2,$2C,$CF,$CF,$CF
#_09FCA5: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$5B
#_09FCAD: db $CF,$02,$01,$01,$01,$01,$FF

data09FCB4:
#_09FCB4: db $CF,$31,$26,$AF,$2C,$9C,$CF,$CF
#_09FCBC: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$5B
#_09FCC4: db $CF,$02,$03,$09,$01,$01,$FF

data09FCCB:
#_09FCCB: db $CF,$26,$30,$AA,$27,$4F,$27,$CF
#_09FCD3: db $CF,$CF,$CF,$CF,$CF,$CF,$CF,$5B
#_09FCDB: db $CF,$03,$06,$01,$01,$01,$FF

data09FCE2:
#_09FCE2: db $CF,$29,$27,$A0,$52,$3D,$AD,$36
#_09FCEA: db $A5,$27,$CF,$CF,$CF,$CF,$CF,$5B
#_09FCF2: db $CF,$05,$04,$01,$01,$01,$FF
DATA8_09FCF9:
#_09FCF9: db $CF,$5D,$5E,$6F,$7D,$38,$CF,$2E
#_09FD01: db $27,$2A,$52,$FF

data09FFD05:
#_09FD05: db $CF,$6A,$5E,$86,$5E,$38,$CF,$2E
#_09FD0D: db $27,$2A,$52,$FF

data09FD11:
#_09FD11: db $CF,$33,$38,$3A,$CF,$A9,$4D,$FF

data09FD19:
#_09FD19: db $CF,$2A,$27,$3D,$51,$CF,$48,$46
#_09FD21: db $4D,$FF

data09FD23:
#_09FD23: db $CF,$65,$8A,$38,$CF,$9C,$58,$34
#_09FD2B: db $26,$FF

data09FD2D:
#_09FD2D: db $CF,$78,$8B,$5E,$85,$02,$FF

data09FD34:
#_09FD34: db $CF,$78,$8B,$5E,$85,$03,$FF

data09FD3B:
#_09FD3B: db $CF,$48,$46,$4D,$FF

data09FD40:
#_09FD40: db $CF,$3F,$A6,$4C,$3D,$3E,$2E,$FF

data09FD48:
#_09FD48: db $CF,$43,$52,$39,$2A,$3D,$3E,$2E
#_09FD50: db $FF

data09FD51:
#_09FD51: db $CF,$44,$9D,$3D,$3E,$2E,$FF

data09FD58:
#_09FD58: db $CF,$32,$36,$46,$26,$51,$CF,$2B
#_09FD60: db $2C,$FF

data09FD62:
#_09FD62: db $AD,$2B,$2A,$4B,$CF,$39,$4B,$AE
#_09FD6A: db $4D,$FF

data09FD6C:
#_09FD6C: db $5D,$5E,$6F,$7D,$2A,$4B,$CF,$39
#_09FD74: db $4B,$AE,$4D,$FF

data09FD78:
#_09FD78: db $48,$46,$4D,$FF

data09FD7C:
#_09FD7C: dw data09FBEA
#_09FD7E: dw data09FBF4
#_09FD80: dw data09FC00
#_09FD82: dw data09FC06
#_09FD84: dw data09FC0F
#_09FD86: dw data09FC19
#_09FD88: dw data09FC1E
#_09FD8A: dw data09FC24
#_09FD8C: dw data09FC2E
#_09FD8E: dw data09FC38
#_09FD90: dw data09FC43
#_09FD92: dw data09Fc4b
#_09FD94: dw data09FC53
#_09FD96: dw data09FC60
#_09FD98: dw data09FC6A
#_09FD9A: dw data09FC74
#_09FD9C: dw data09FC83
#_09FD9E: dw data09FC91
#_09FDA0: dw data09FC95
#_09FDA2: dw data09FC9D
#_09FDA4: dw data09FCB4
#_09FDA6: dw data09FCCB
#_09FDA8: dw data09FCE2
#_09FDAA: dw DATA8_09FCF9
#_09FDAC: dw data09FFD05
#_09FDAE: dw data09FD11
#_09FDB0: dw data09FD19
#_09FDB2: dw data09FD23
#_09FDB4: dw data09FD2D
#_09FDB6: dw data09FD34
#_09FDB8: dw data09FD3B
#_09FDBA: dw data09FD40
#_09FDBC: dw data09FD48
#_09FDBE: dw data09FD51
#_09FDC0: dw data09FD58
#_09FDC2: dw data09FD62
#_09FDC4: dw data09FD6C
#_09FDC6: dw data09FD78

data09FDC8:
#_09FDC8: db $2A,$43,$28,$4D,$FF

data09FDCD:
#_09FDCD: db $41,$26,$A4,$52,$38,$31,$4D,$FF

data09FDD5:
#_09FDD5: db $35,$57,$27,$32,$52,$51,$27,$2D
#_09FDDD: db $4D,$FF

data09FDDF:
#_09FDDF: db $39,$A6,$46,$4D,$FF

data09FDE4:
#_09FDE4: db $29,$AA,$31,$FF

data09FDE8:
#_09FDE8: db $50,$4B,$26,$2A,$28,$31,$FF

data09FDEF:
#_09FDEF: db $45,$30,$31,$4D,$FF

data09FDF4:
#_09FDF4: db $2F,$4B,$3A,$50,$4B,$27,$FF

data09FDFB:
#_09FDFB: db $42,$42,$28,$45,$FF

data09FE00:
#_09FE00: db $37,$43,$3C,$2B,$FF

data09FE05:
#_09FE05: db $3F,$2B,$38,$46,$4D,$FF

data09FE0B:
#_09FE0B: db $42,$58,$38,$2C,$FF

data09FE10:
#_09FE10: db $AD,$2B,$51,$CF,$29,$2F,$46,$4D
#_09FE18: db $FF

data09FE19:
#_09FE19: db $35,$2A,$A8,$2C,$FF

data09FE1E:
#_09FE1E: db $29,$A6,$37,$4D,$FF

data09FE23:
#_09FE23: db $29,$2E,$4D,$FF

data09FE27:
#_09FE27: db $3A,$9F,$4D,$FF

data09FE2B:
#_09FE2B: db $25,$48,$43,$4D,$FF

data09FE30:
#_09FE30: db $34,$34,$2A,$27,$FF

data09FE35:
#_09FE35: db $25,$26,$33,$50,$4B,$26,$FF

data09FE3C:
#_09FE3C: db $39,$3D,$4D,$FF

data09FE40:
#_09FE40: db $3A,$4B,$45,$FF

data09FE44:
#_09FE44: db $2F,$4B,$3A,$29,$AA,$31,$FF

data09FE4B:
#_09FE4B: db $26,$2A,$2C,$31,$4D,$FF

data09FE51:
#_09FE51: db $AB,$2A,$3A,$31,$4D,$FF

data09FE57:
#_09FE57: db $71,$62,$7B,$3A,$39,$4E,$FF

data09FE5E:
#_09FE5E: db $34,$35,$2F,$4E,$FF

data09FE63:
#_09FE63: db $50,$4B,$27,$FF

data09FE67:
#_09FE67: db $BB,$91,$5A,$64,$FF

data09FE6C:
#_09FE6C: db $3F,$2B,$38,$46,$4D,$FF

data09FE72:
#_09FE72: db $2E,$34,$28,$4D,$FF

data09FE77:
#_09FE77: db $35,$57,$27,$3E,$36,$51,$27,$2D
#_09FE7F: db $4D,$FF

data09FE81:
#_09FE81: db $32,$58,$38,$2C,$31,$4D,$FF

data09FE88:
#_09FE88: db $27,$34,$27,$FF

data09FE8C:
#_09FE8C: db $29,$AA,$4D,$FF

data09FE90:
#_09FE90: db $34,$A2,$4F,$9E,$40,$4C,$51,$31
#_09FE98: db $4D,$FF

data09FE9A:
#_09FE9A: db $44,$36,$46,$4D,$FF

data09FE9F:
#_09FE9F: db $25,$2C,$30,$56,$FF

data09FEA4:
#_09FEA4: db $AE,$36,$3A,$CF,$4A,$27,$3E,$39
#_09FEAC: db $26,$FF

data09FEAE:
#_09FEAE: db $37,$51,$25,$9F,$4D,$FF

data09FEB4:
#_09FEB4: db $25,$2B,$4B,$46,$4D,$FF

data09FEBA:
#_09FEBA: db $50,$4B,$27,$3D,$51,$CF,$48,$46
#_09FEC2: db $2F,$32,$4D,$FF

data09FEC6:
#_09FEC6: db $30,$57,$27,$35,$31,$4D,$FF

data09FECD:
#_09FECD: db $71,$62,$7B,$3A,$31,$4D,$FF

data09FED4:
#_09FED4: db $2A,$3C,$FF
DATA8_09FED7:
#_09FED7: db $7B,$B7,$74,$6C,$5E,$70,$FF

data09FEDE:
#_09FEDE: db $29,$58,$B0,$4B,$27,$FF

data09FEE4:
#_09FEE4: db $49,$27,$2E,$27,$37,$2B,$FF

data09FEEB:
#_09FEEB: db $26,$25,$36,$37,$2B,$FF

data09FEF1:
#_09FEF1: dw data09FDC8
#_09FEF3: dw data09FDCD
#_09FEF5: dw data09FDD5
#_09FEF7: dw data09FDDF
#_09FEF9: dw data09FDE4
#_09FEFB: dw data09FDE8
#_09FEFD: dw data09FDEF
#_09FEFF: dw data09FDF4
#_09FF01: dw data09FDFB
#_09FF03: dw data09FE00
#_09FF05: dw data09FE05
#_09FF07: dw data09FE0B
#_09FF09: dw data09FE10
#_09FF0B: dw data09FE19
#_09FF0D: dw data09FE1E
#_09FF0F: dw data09FE23
#_09FF11: dw data09FE27
#_09FF13: dw data09FE2B
#_09FF15: dw data09FE30
#_09FF17: dw data09FE35
#_09FF19: dw data09FE3C
#_09FF1B: dw data09FE40
#_09FF1D: dw data09FE44
#_09FF1F: dw data09FE4B
#_09FF21: dw data09FE51
#_09FF23: dw data09FE57
#_09FF25: dw data09FE5E
#_09FF27: dw data09FE63
#_09FF29: dw data09FE67
#_09FF2B: dw data09FE6C
#_09FF2D: dw data09FE72
#_09FF2F: dw data09FE77
#_09FF31: dw data09FE81
#_09FF33: dw data09FE88
#_09FF35: dw data09FE8C
#_09FF37: dw data09FE90
#_09FF39: dw data09FE9A
#_09FF3B: dw data09FE9F
#_09FF3D: dw data09FEA4
#_09FF3F: dw data09FEAE
#_09FF41: dw data09FEB4
#_09FF43: dw data09FEBA
#_09FF45: dw data09FEC6
#_09FF47: dw data09FECD
#_09FF49: dw data09FED4
#_09FF4B: dw DATA8_09FED7
#_09FF4D: dw data09FEDE
#_09FF4F: dw data09FEE4
#_09FF51: dw data09FEEB
#_09FF53: dw DATA8_09E9FE
#_09FF55: dw DATA8_09F0FE
#_09FF57: db $FE,$58,$38,$2C,$FF,$AD,$2B,$51
#_09FF5F: db $CF,$29,$2F,$46,$4D,$FF,$35,$2A
#_09FF67: db $A8,$2C,$FF,$29,$A6,$37,$4D,$FF
#_09FF6F: db $29,$2E,$4D,$FF,$3A,$9F,$4D,$FF
#_09FF77: db $25,$48,$43,$4D,$FF,$34,$34,$2A
#_09FF7F: db $27,$FF,$25,$26,$33,$50,$4B,$26
#_09FF87: db $FF,$39,$3D,$4D,$FF,$3A,$4B,$45
#_09FF8F: db $FF,$2F,$4B,$3A,$29,$AA,$31,$FF
#_09FF97: db $26,$2A,$2C,$31,$4D,$FF,$AB,$2A
#_09FF9F: db $3A,$31,$4D,$FF,$39,$2A,$43,$3A
#_09FFA7: db $39,$4E,$FF,$34,$35,$2F,$4E,$FF
#_09FFAF: db $50,$4B,$27,$FF,$BB,$91,$5A,$64
#_09FFB7: db $FF,$3F,$2B,$38,$46,$4D,$FF,$2E
#_09FFBF: db $34,$28,$4D,$FF,$35,$57,$27,$3E
#_09FFC7: db $36,$51,$27,$2D,$4D,$FF,$32,$58
#_09FFCF: db $38,$2C,$31,$4D,$FF,$27,$34,$27
#_09FFD7: db $FF,$29,$AA,$4D,$FF,$34,$A2,$4F
#_09FFDF: db $9E,$40,$4C,$51,$31,$4D,$FF,$44
#_09FFE7: db $36,$46,$4D,$FF,$25,$2C,$30,$56
#_09FFEF: db $FF,$AE,$36,$3A,$CF,$4A,$27,$3E
#_09FFF7: db $39,$26,$FF,$37,$51,$25,$9F,$4D
#_09FFFF: db $FF
