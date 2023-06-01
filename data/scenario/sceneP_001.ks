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
[scene_header name="p_001"]

;;; プロローグ
;
; YMSの部屋で連行されてきた人狼を尋問
; 戦闘
; 再生できない
; 仲間の情報を吐かせる
; 逃げようとする
; 始末
; 電話
# 男
……[p]
あああああ。[p]

;キャラクター登場
[chara_show  name="akane" top="50"]
# ?
こんにちは。[p]
私の名前はあかね。[p]
#朱音
偶然だけどあかねが一緒だった[p]

[chara_mod  name="akane" face="01_happy_a"  ]
#朱音
わー。興味あるなんて、嬉しいなー。[p]
#
・・・・・[p]
まぁ、作ってみたい気持ちはあるけど、むずかしいんでしょ？[p]
プログラミングとかやったことないし、、、[p]


[chara_mod  name="akane" face="02_angry_a"  ]
#朱音
おこっちゃう[p]

[chara_mod  name="akane" face="03_sad_a"  ]
#朱音
悲しい[p]

[chara_mod  name="akane" face="04_relax_a"  ]
#朱音
りらっくす[p]

[chara_mod  name="akane" face="05_surprise_a"  ]
#朱音
びっくり[p]

[chara_mod  name="akane" face="06_pinch_a"  ]
#朱音
ぴんち[p]

[chara_mod  name="akane" face="07_dominated_a"  ]
#朱音
もうだめ[p]

[chara_mod name="akane" face="default"]
#朱音
デフォルト[p]

[chara_mod name="akane" face="01_happy_b"]
#朱音
変身解除[p]

[chara_mod name="akane" face="02_angry_b"]
#朱音
変身解除いかり[p]

[chara_mod name="akane" face="03_sad_b"]
#朱音
変身解除かなしい[p]

[chara_mod name="akane" face="04_relax_b"]
#朱音
変身解除いかり[p]

[chara_mod name="akane" face="05_surprise_b"]
#朱音
変身解除おどろき[p]

[chara_mod name="akane" face="06_pinch_b"]
#朱音
変身解除ぴんち[p]

[chara_mod name="akane" face="07_dominated_b"]
#朱音
だめだめ[p]

#
・・・・[p]

;キャラクター非表示
[chara_hide name="akane"]
#
非表示にした

どうかな？[p]
ゲームに合わせて自分の好きなデザインを作ってくださいね[p]

あと、デフォルトだとセーブやロードは画面右下のボタンからできるけど[p]
ウィンドウをカスタマイズすれば、、、、[p]

こんな風にゲームに必要な機能を画面の上に持たせることも簡単にできるよ[p]
これはロールボタンといって、ボタンに特別な機能を持たせる事ができます。[p]
標準で用意されているのは、[l]
セーブ、[l]
ロード、[l][cm]
タイトルへ戻る、
メニュー表示、
メッセージ非表示、
スキップ、
バックログ、
フルスクリーン切り替え、
クイックセーブ、
クイックロード、
オートモード！
[p]

はぁ、はぁ[p]

#
大丈夫？[p]
これだけあれば、ゲームを作るには困らなそうだね[p]

最後にティラノスクリプトで役立つ情報へのリンクを表示しておくから
確認してみてね。[p]

[cm]
[movie storage="jingaro_op.mp4" skip="true"]
;シーンフッタ
[scene_footer]

[s]