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
;emofuri
[emote_new name="akane_e" storage="akane_emofuri"]

[emote_variable name="akane_e" head_LR="30"]
#
ここでキャラクターの表情をデバッグします[p]

;キャラクター登場
[emote_show  name="akane_e"  scale="0.4" y="100"]
#あかね
こんにちは。[p]
私の名前は風洞朱音。[p]
#あかね
[emote_motion name="akane_e" motion="sample_00"]
"sample_00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_01"]
"sample_01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_02"]
"sample_02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_03"]
"sample_03" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_04"]
"sample_04" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_05"]
"sample_05" を再生しています。[p]

[emote_motion name="akane_e" motion="sample_喜00"]
"sample_喜00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_喜01"]
"sample_喜01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_喜02"]
"sample_喜02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_喜03"]
"sample_喜03" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_喜04"]
"sample_喜04" を再生しています。[p]

[emote_motion name="akane_e" motion="sample_怒00"]
"sample_怒00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_怒01"]
"sample_怒01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_怒02"]
"sample_怒02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_怒03"]
"sample_怒03" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_怒04"]
"sample_怒04" を再生しています。[p]

[emote_motion name="akane_e" motion="sample_哀00"]
"sample_哀00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_哀01"]
"sample_哀01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_哀02"]
"sample_哀02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_哀03"]
"sample_哀03" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_哀04"]
"sample_哀04" を再生しています。[p]

[emote_motion name="akane_e" motion="sample_楽00"]
"sample_楽00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_楽01"]
"sample_楽01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_楽02"]
"sample_楽02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_楽03"]
"sample_楽03" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_楽04"]
"sample_楽04" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_楽05"]
"sample_楽05" を再生しています。[p]

[emote_motion name="akane_e" motion="sample_驚00"]
"sample_驚00" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_驚01"]
"sample_驚01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_驚02"]
"sample_驚02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_驚03"]
"sample_驚03" を再生しています。[p]


[emote_motion name="akane_e" motion="sample_複合01"]
"sample_複合01" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_複合02"]
"sample_複合02" を再生しています。[p]
[emote_motion name="akane_e" motion="sample_複合03"]
"sample_複合03" を再生しています。[p]


[emote_motion name="akane_e" motion="普通"]
"普通" を再生しています。[p]
[emote_motion name="akane_e" motion="微笑"]
"微笑" を再生しています。[p]

[cm]
[emote_hide name="akane_e"]
[freeimage layer=1]

[scene_footer]
[s]