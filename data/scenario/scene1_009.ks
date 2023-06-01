;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]


[bg storage="room.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="akane" storage="chara/heroine_A_akane/04_relax_a.png" jname="朱音" width="800" height="1130"]
;キャラクターの表情登録
[chara_face name="akane" face="01_happy_a" storage="chara/heroine_A_akane/01_happy_a.png"]
[chara_face name="akane" face="02_angry_a" storage="chara/heroine_A_akane/02_angry_a.png"]
[chara_face name="akane" face="03_sad_a" storage="chara/heroine_A_akane/03_sad_a.png"]
[chara_face name="akane" face="04_relax_a" storage="chara/heroine_A_akane/04_relax_a.png"]
[chara_face name="akane" face="05_surprise_a" storage="chara/heroine_A_akane/05_surprise_a.png"]
[chara_face name="akane" face="06_pinch_a" storage="chara/heroine_A_akane/06_pinch_a.png"]
[chara_face name="akane" face="07_dominated_a" storage="chara/heroine_A_akane/07_dominated_a.png"]

[chara_face name="akane" face="01_happy_b" storage="chara/heroine_A_akane/01_happy_b.png"]
[chara_face name="akane" face="02_angry_b" storage="chara/heroine_A_akane/02_angry_b.png"]
[chara_face name="akane" face="03_sad_b" storage="chara/heroine_A_akane/03_sad_b.png"]
[chara_face name="akane" face="04_relax_b" storage="chara/heroine_A_akane/04_relax_b.png"]
[chara_face name="akane" face="05_surprise_b" storage="chara/heroine_A_akane/05_surprise_b.png"]
[chara_face name="akane" face="06_pinch_b" storage="chara/heroine_A_akane/06_pinch_b.png"]
[chara_face name="akane" face="07_dominated_b" storage="chara/heroine_A_akane/07_dominated_b.png"]

;シーンヘッダ。自分の名前を指定。
[scene_header name="1_009"]

;;; シーン1-009
; ケンが行方不明になり、治安維持隊に報告
; 
; 事情聴取
; よくあること
; 変な手紙
; 待ち合わせの場所を見張る
; 用務員が来る
; 地下道への入り口
#
シーン1-009[p]

; 近づいてみる、みない。
[glink text="調べる" size=20 width=520 height=70 x=60 y=150 color=blue target=confirm ]
[glink text="調べない" size=20 width=520 height=70 x=60 y=260 color=blue target=ignore ]
[s]

*confirm
#
どこに向かうのか把握する必要がある。[p]
[iscript]
    tf.flag_alt = 0
[endscript]
[jump target="footer"]

*ignore
#
そもそもあの手紙がきっかけでここまで来た。[l]誰かに誘導されているような・・・。[p]
[iscript]
    tf.flag_alt = 1
[endscript]
[jump target="footer"]

*footer
[cm]
;シーンフッタ
[scene_footer]

[s]