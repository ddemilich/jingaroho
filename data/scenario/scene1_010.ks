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
[scene_header name="1_010"]

;;; シーン1-010
; 狂介登場・駆け引きをもちかける
; 自分は実は人狼である
; 戦闘力は無い
; キミ達狩人の目的はこの学園の人狼の殲滅だろう
; 私は人は襲わない。研究がいいところまできた。
; 仲間の情報と引き換えに自分を見逃してほしい

#
シーン1-010[p]

; 近づいてみる、みない。
[glink text="取引に乗る" size=20 width=520 height=70 x=60 y=150 color=blue target=bear ]
[glink text="こいつはここで始末する" size=20 width=520 height=70 x=60 y=260 color=blue target=bull ]
[s]

*bear
#
人狼と確定させてからでも遅くない。取引に乗ろう[p]
[iscript]
    tf.flag_alt = 0
[endscript]
[jump target="footer"]

*bull
#
嫌な予感がする。人狼であっても人間であってもこいつを生かしておくのは危険だ。[p]
[iscript]
    tf.flag_alt = 1
[endscript]
[jump target="footer"]

*footer
[cm]
;シーンフッタ
[scene_footer]

[s]