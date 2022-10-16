;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]

[scene_header name="1_A1"]

[bg storage="room.jpg" time="100"]
[iscript]
    tf.next_scene = "title.ks"
[endscript]

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
[chara_new  name="akane" storage="chara/akane/normal.png" jname="あかね"  ]
;キャラクターの表情登録
[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]


;yamato
[chara_new  name="yamato"  storage="chara/yamato/normal.png" jname="やまと" ]

#
さて、ゲームが簡単に作れるというから、来てみたものの[p]

誰もいねぇじゃねぇか。[p]
……[p]
帰るか。。。[p]

[font  size="30"   ]
#?
ちょっとまったーーーーー[p]
[resetfont  ]

#
誰だ！？[p]

;キャラクター登場
[chara_show  name="akane"  ]
#?
こんにちは。[p]
私の名前はあかね。[p]
#あかね
もしかして、ノベルゲームの開発に興味があるの？[p]
まず、ティラノスクリプトの特徴として[font color="red"]「HTML5」[resetfont]で動作するよ[p]
[cm]
[chara_hide name="akane"]
[freeimage layer=1]

[scene_footer]
[s]