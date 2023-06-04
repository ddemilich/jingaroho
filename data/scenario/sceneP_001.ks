;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]

[preload storage="data/sound/ゾンビの声3.mp3"]
[preload storage="data/sound/バタンと倒れる.mp3"]
[preload storage="data/sound/パンチの素振り3.mp3"]
[preload storage="data/sound/倒れる.mp3"]
[preload storage="data/sound/刀の素振り1.mp3"]
[preload storage="data/sound/建物が少し崩れる2.mp3"]
[preload storage="data/sound/拳銃を撃つ.mp3"]
[preload storage="data/sound/高速移動.mp3"]
[preload storage="data/bgm/魔力に満ちた部屋.mp3"]

[bg storage="bgbf009.bmp" time="100"]

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
[chara_config ptext="chara_name_area" talk_anim="up" pos_mode="false"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="akane" storage="chara/heroine_A_akane/04_relax_a.png" jname="赤い髪の尋問官" width="800" height="1130"]
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

;kiriko
[chara_new  name="kiriko" storage="chara/heroine_B_kiriko/04_relax_a.png" jname="青い髪の見張り" width="800" height="1130"]
;キャラクターの表情登録
[chara_face name="kiriko" face="01_happy_a" storage="chara/heroine_B_kiriko/01_happy_a.png"]
[chara_face name="kiriko" face="02_angry_a" storage="chara/heroine_B_kiriko/02_angry_a.png"]
[chara_face name="kiriko" face="03_sad_a" storage="chara/heroine_B_kiriko/03_sad_a.png"]
[chara_face name="kiriko" face="04_relax_a" storage="chara/heroine_B_kiriko/04_relax_a.png"]
[chara_face name="kiriko" face="05_surprise_a" storage="chara/heroine_B_kiriko/05_surprise_a.png"]
[chara_face name="kiriko" face="06_pinch_a" storage="chara/heroine_B_kiriko/06_pinch_a.png"]
[chara_face name="kiriko" face="07_dominated_a" storage="chara/heroine_B_kiriko/07_dominated_a.png"]

[chara_face name="kiriko" face="01_happy_b" storage="chara/heroine_B_kiriko/01_happy_b.png"]
[chara_face name="kiriko" face="02_angry_b" storage="chara/heroine_B_kiriko/02_angry_b.png"]
[chara_face name="kiriko" face="03_sad_b" storage="chara/heroine_B_kiriko/03_sad_b.png"]
[chara_face name="kiriko" face="04_relax_b" storage="chara/heroine_B_kiriko/04_relax_b.png"]
[chara_face name="kiriko" face="05_surprise_b" storage="chara/heroine_B_kiriko/05_surprise_b.png"]
[chara_face name="kiriko" face="06_pinch_b" storage="chara/heroine_B_kiriko/06_pinch_b.png"]
[chara_face name="kiriko" face="07_dominated_b" storage="chara/heroine_B_kiriko/07_dominated_b.png"]

;isamaru
[chara_new name="isamaru" storage="chara/mob/mob_cleaner_male_gray.png" jname="今田勇丸" width="800" height="1130"]
[chara_face name="isamaru" face="wolf" storage="chara/mob/mob_wolf.png"]

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
# 
―――都内某所[p]

[playbgm storage="魔力に満ちた部屋.mp3" loop="true" volume="50"]
#？？？
[ruby text="いま"]今[ruby text="だ"]田[ruby text="いさ"]勇[ruby text="まる"]丸。[l]26歳フリーター。[l][r]
間違いありませんね？[p]
#男
・・・ああ。[p]
#
薄暗い地下室で男が尋問されていた。[l][r]
男は両腕を縛られて椅子に座らされている。[p]

#？？？
貴方には、３日前に都内で発生した強盗殺人事件の容疑がかかっています。[p]

;キャラクター登場
[chara_mod  name="akane" face="02_angry_a"  ]
[chara_show  name="akane" top="50"]
#
尋問をしているのは赤い髪の女性だ。[r]
男を射抜く目は水色に輝いている。[p]

#isamaru
[font color="red" bold="true"]
・・・知らねぇ。[p]
[resetfont]

[chara_mod  name="akane" face="04_relax_a" wait="true" ]
#akane
はいはい。実はそんなことはどうでもいいんです。[l][r]
あたしたちが知りたいのはですね・・・[p]

[chara_mod  name="akane" face="01_happy_a" ]
#akane
貴方が人間かどうか・・・[p]

#
不敵に微笑む尋問官。[p]

#isamaru
人間？どういう意味だ？[l][r]
容疑者は人間に値しないってか？[p]

#akane
いえいえ、そんな侮辱的な意味ではありません。[l][r]
もっと生物学的な意味で[l][r]
[anim name="akane" left="-=150" time="1000" wait="false" effect="easeOutCubic"]
[chara_show name="kiriko" top="50" left="600" time="2000" wait="true"]
[wa]
―――確認していました。[p]

#
部屋の扉を塞ぐように青い髪の女性が見張りとして立っている。[l][r]
[anim name="kiriko" top="70" time="300"][wa]
[anim name="kiriko" top="50" time="200"][wa]
見張りは目配せで何かを伝えたようだ。[p]
[anim name="akane" top="70" time="300"][wa]
[anim name="akane" top="50" time="200"][wa]

[anim name="akane" left="+=150" time="500" effect="easeOutCubic"]
[chara_hide name="kiriko"]
#akane
今田さん・・・。[l][r]
貴方―――[l][r]
[chara_mod name="akane" face="02_angry_a" wait="true"]
――――人狼ですね？[p]

#isamaru
[font color="red" bold="true"]
じ・ん・・ろ？[p]
[resetfont]

[chara_mod name="akane" face="04_relax_a" wait="true"]
#akane
トボけてもだめだめ。証拠は挙がってるんだから。[p]
[anim name="akane" left="-=150" time="1000" effect="easeOutCubic"]
[chara_show name="isamaru" left="600" top="50"]
#isamaru
[font color="red" bold="true"]
何のことだかさっぱりだ！[l][r]
[resetfont]
こんな取り調べがあるか！[l]人権侵害だ！[l][r]
そ、そうだ！弁護士を呼べ！[p]
#
―――その瞬間[l][r]
[playse storage="拳銃を撃つ.mp3"]
[chara_mod name="akane" face="02_angry_a" wait="true"]
尋問官は拳銃を取り出し男に向かって発砲した。
[anim name="isamaru" top="+=100" time="100"]
[wa]
[p]
#isamaru
ぐ・・・[p]
[playse storage="倒れる.mp3"]
#
椅子ごと崩れ落ちる男。
[anim name="isamaru" top="+=150" time="500"]
[wa]
[anim name="isamaru" top="+=200" time="500"]
[wa]
[anim name="isamaru" top="+=500" time="1000" effect="easeInCubic"]
[wa]
[p]

[chara_mod name="akane" face="01_happy_a" wait="true"]
#akane
ほらほら。早く変身しないと死んじゃいますよ？[p]

[chara_mod name="isamaru" face="wolf"]
[anim name="isamaru" top="50" time="200" effect="easeOutCubic"]
[wa]
[playse storage="ゾンビの声3.mp3"]
#isamaru
人間のメスが舐めやがってェァアアアア！！！[p]

#
獣の姿となった男が、尋問官に襲い掛かる。[l][r]
[playse storage="建物が少し崩れる2.mp3" buf="1"]
[playse storage="パンチの素振り3.mp3"]
[anim name="isamaru" left="50" time="250" effect="easeOutElastic"]
[anim name="akane" left="+=800" time="200" effect="easeOutCubic"]
尋問官は軽々と[ruby text="かわ"]躱す。[p]

#akane
正体表してくれてどーも。[p]

[chara_mod name="isamaru" reflect="true" left="-=100"][wa]
#isamaru
お前は徹底的に[ruby text="ヤ"]犯ったあとに[ruby text="ヤ"]殺ってやる・・[p]
#
銃弾が命中したはずの男の胸は傷一つない。[l][r]
床には男を縛り付けていた椅子の破片が散乱している[p]

#akane
人狼ってやつはこれだから・・・[p]
#
尋問官は筒状の武器を構えて男の下半身に狙いを定める。[p]
#isamaru
何発撃っても無駄だァ！俺には銃は効かねぇ！[p]

#akane
それはどうかな！[p]
[playse storage="重力魔法1.mp3"]
[anim name="akane" left="+=20" time="200"]
[anim name="isamaru" left="-=100" time="200"][wa]
#
筒から出た水色に輝く弾が男の下半身を吹き飛ばす
[anim name="akane" left="-=20" time="1000"][wa]
[p]

[playse storage="バタンと倒れる.mp3"]
[anim name="isamaru" top="+=150" time="500"]
[wa]
[anim name="isamaru" top="+=200" time="500"]
[wa]
#isamaru
グァアアアア![p]
何故だぁ・・・何故・・・[p]

#
男は傷が塞がらないことに動揺を隠せない。[l][r]
[playse storage="ペットボトルを握りつぶす.mp3"]
破片の散乱した床に獣の体液が染み渡っていく。[p]

[chara_mod name="akane" face="04_relax_a" wait="true"]
#akane
狩人と戦ったことが無かったのかなぁ？[p]
だとしたら結構な田舎の出身だね、君は。[p]

#
尋問官は再び筒を男に向ける[p]

[chara_mod name="akane" face="02_angry_a" wait="true"]
#akane
君にはいくつか聞きたいことがある。[p]
[font color="red" bold="true"]虚偽の証言[resetfont]をした瞬間頭を吹き飛ばす。[p]
[chara_mod name="akane" face="01_happy_a" wait="true"]
そうなりたくないでしょう？[p]

#isamaru
ひっ・・・[p]
分かった・・。分かったからよぉ・・・。[p]
命だけは・・・なんとか・・・[p]

[chara_mod name="akane" face="02_angry_a" wait="true"]
#akane
仲間の数と居場所を教えろ。[l][r]
君たち人狼は夜間に相談が可能と聞いている。[l][r]
相談相手は何匹いて、どこにいる？[p]

#isamaru
い、今は・・・いねぇよ！[p]

[chara_mod name="akane" face="03_sad_a" wait="true"]
#akane
(今はいない・・・か・・・)[l][r]
[chara_mod name="akane" face="02_angry_a" wait="true"]
昔の話でもいい。一番最近相談したときのこと・・・覚えてる？[p]

#isamaru
俺は・・・そう。[ruby text="しぶ"]渋[ruby text="が"]ヶ[ruby text="やま"]山学園から出てきたんだ。。。[p]

[chara_mod name="akane" face="03_sad_a" wait="true"]
#akane
(しぶがやま・・・？聞かない名前・・でも嘘は付いていない・・・)[l][r]
[chara_mod name="akane" face="02_angry_a" wait="true"]
続けて。[p]

#isamaru
そこで人をヤってたんだが・・・[l][r]
そん時の仲間は俺以外に５人いた・・・はずだ・・・。[p]

#akane
(今のところ・・・全て正直に話している・・・)[l][r]
５人の名前は？[p]

#isamaru
知らねぇ・・・[l]本当だ！信じてくれ！[p]

#akane
(人数だけでも上々・・・かな。)[l][r]
その前はどうだ？その学園に入る前は・・・どこでヤッてたんだ？[p]

#isamaru
もういいだろう！[l][r]
[font color="red" bold="true"]知っていることは全部喋った！[resetfont][l]早く・・・治療を・・・[p]

#akane
[chara_mod name="akane" face="03_sad_a" wait="true"]
(まだ何か隠している・・)[l][r]
(でも・・・これ以上は無理かなぁ・・・)[l][r]
[chara_mod name="akane" face="04_relax_a" wait="true"]
わかった。話す気がないなら処分だね。[p]

#
尋問官がトリガを引こうとしたその瞬間―――[l][r]
[playse storage="高速移動.mp3"]
[chara_mod name="akane" face="05_surprise_a"]
[anim name="isamaru" left="+=1500" time="200" effect="easeOutCubic"]
[wa]
上半身だけの男が矢のようなスピードで扉に向かって突進する。[p]

#akane
きりちゃん！逃がさないで！[p]
[anim name="akane" left="+=1500" time="200" effect="easeOutCubic"]
[wa]
[mask time="100" effect="fadeInLeftBig"]

[chara_hide_all]
#

[chara_show name="kiriko" top="50" left="600"]
[chara_show name="isamaru" face="wolf" top="400" left="-600" reflect="true"]
[mask_off time="100" effect="fadeOutLeftBig"]
[anim name="isamaru" left="0" effect="easeOutElastic"]
[wa]
#kiriko
・・・。[p]

#isamaru
お前もこｒ[p]
[playse storage="刀の素振り1.mp3"]
[chara_hide name="isamaru"]
#
男は何か発しようとしたが・・・言葉にならないうちに細かく刻まれた肉片となっていた。[p]

[playse storage="打撃8.mp3"]
[chara_mod name="kiriko" face="03_sad_a" wait="true"]
#kiriko
逃がすわけ・・ない。[p]

[chara_show name="akane" top="50" left="-=150" wait=true]
#akane
危ないとこだったー！ありがと！[p]

#kiriko
煽りすぎでしょ・・・[l][r]
あ、研究開発部に連絡しなきゃ。[l][r]サンプル欲しがってたから。[p]

#akane
あたしかけるよ。[l][r]
生け捕りにできなかったから怒られそうだし・・・[p]

#akane
あ、もしもしー。こちら風洞です。[l]はい。[l]はい。[l][r]
そうです。地下の夜間会議室５番目です。[l][r]
[chara_mod name="akane" face="03_sad_a" wait="true"]
・・・それが・・・うっかり殺しちゃって・・・[p]

[mask effect="fadeIn"]
[playse storage="鉄の扉を開ける.mp3"]
[stopbgm]
;キャラクター非表示
[chara_hide_all]

[cm]
[hidemenubutton]

[layopt layer="message0" visible="false"] 
[bg storage="bg_base.png" time="0"]
[mask_off time="100" effect="fadeOut"]
[movie storage="jingaro_op.mp4" skip="true"]
;シーンフッタ
[scene_footer]

[s]