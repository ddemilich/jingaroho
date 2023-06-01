
[cm]

@clearstack
@bg storage ="title.png" time=100
@wait time = 200

*start 

; 1280*720
; センタリングしてボタンを置く
; ボタンのサイズ360*74
; 左側x= 270 = 640(真ん中)-360(ボタンw)-10(マージン)
; 右側x= 650 = 640(真ん中)+10(マージン)
[button x=270 y=520 graphic="title/button_start.png" enterimg="title/button_start2.png"  target="gamestart"]
[button x=270 y=610 graphic="title/button_load.png" enterimg="title/button_load2.png" role="load" ]
[button x=650 y=520 graphic="title/button_replay.png" enterimg="title/button_replay2.png" storage="replay.ks" ]
[button x=650 y=610 graphic="title/button_config.png" enterimg="title/button_config2.png" role="sleepgame" storage="config.ks" ]

[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
@jump storage="sceneP_001.ks"



