;=========================================
; 回想モード　画面作成
;=========================================
*start
@layopt layer=message0 visible=false
@clearfix
[hidemenubutton]
[cm]


[bg storage="bg_base.png" time=100]
[layopt layer=1 visible=true]

[image name="label_replay" layer=1 left=0 top=0 storage="config/label_recollection.png" folder="image" ]

[iscript]
    
    tf.page = 0;
    tf.selected_replay_obj = ""; //選択されたリプレイを一時的に保管
    
[endscript]



*replaypage
[cm]
[button graphic="config/c_btn_back.png" enterimg="config/c_btn_back2.png"  target="*backtitle" x=1160 y=20 ]
[button graphic="button/showall.png" enterimg="button/showall2.png"  target="*set_replay_all" x=850 y=20 ]
[button graphic="button/close.png" enterimg="button/close2.png"  target="*clear_replay_all" x=650 y=40 ]

[iscript]
	tf.target_page = "page_"+tf.page;
[endscript]

*replayview

@jump target=&tf.target_page

*page_0
[replay_image_button name="replay01" graphic="cg1_A1.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay02" graphic="cg1_A2.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay03" graphic="cg1_A3.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay04" graphic="cg1_B1.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay05" graphic="cg1_B2.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay06" graphic="cg1_B3C1.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=150 width=160 height=120 folder="bgimage" ]

[replay_image_button name="replay07" graphic="cg2_B1.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay08" graphic="cg2_B2.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay09" graphic="cg2_B3.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay10" graphic="cg2_A1.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay11" graphic="cg2_A2.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay12" graphic="cg2_A3C1.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=310 width=160 height=120 folder="bgimage" ]

[replay_image_button name="replay13" graphic="cg3_A1.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay14" graphic="cg3_B1.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay15" graphic="cg3_A2.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay16" graphic="cg3_B2.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay17" graphic="cg3_A3B3.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay18" graphic="cg3_C1.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=470 width=160 height=120 folder="bgimage" ]

[button graphic="config/arrow_next.png" target="*nextpage" x=1160 y=600 ]
@jump target ="*common"


*page_1

[replay_image_button name="replay19" graphic="cg3_C2.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay20" graphic="cg4_C1.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay21" graphic="cg4_C2.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay22" graphic="cg4_C3.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay23" graphic="cg4_A1B1.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay24" graphic="cg4_A2B2.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=150 width=160 height=120 folder="bgimage" ]

[replay_image_button name="replay25" graphic="cg5_A2.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay26" graphic="cg5_A3.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay27" graphic="cg6_B2.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay28" graphic="cg6_B3.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay29" graphic="cg7_C1.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=310 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay30" graphic="cg7_C2.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=310 width=160 height=120 folder="bgimage" ]

[replay_image_button name="replay31" graphic="cg1_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay32" graphic="cg2_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay33" graphic="cg3_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay34" graphic="cg4_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay35" graphic="cg5_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=860 y=470 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay36" graphic="cg6_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=1060 y=470 width=160 height=120 folder="bgimage" ]

[button graphic="config/arrow_prev.png" target="*backpage" x=20 y=600 ]
[button graphic="config/arrow_next.png" target="*nextpage" x=1160 y=600 ]
@jump target ="*common"

*page_2

[replay_image_button name="replay37" graphic="cg7_end.png" no_graphic="../../tyrano/images/system/noimage.png" x=60 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay38" graphic="cg0_Ap1.png" no_graphic="../../tyrano/images/system/noimage.png" x=260 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay39" graphic="cg0_Bp1.png" no_graphic="../../tyrano/images/system/noimage.png" x=460 y=150 width=160 height=120 folder="bgimage" ]
[replay_image_button name="replay40" graphic="cg0_Cp1.png" no_graphic="../../tyrano/images/system/noimage.png" x=660 y=150 width=160 height=120 folder="bgimage" ]
[button graphic="config/arrow_prev.png" target="*backpage" x=20 y=600 ]
@jump target ="*common"

*common

[s]

*backtitle
[cm]
[freeimage layer=1]
@jump storage=title.ks

*nextpage
[emb exp="tf.page++;"]
@jump target="*replaypage"


*backpage
[emb exp="tf.page--;"]
@jump target="*replaypage"

*set_replay_all
[setreplay name="replay01" storage="scene1_A1.ks" target="*start"]
[setreplay name="replay02"]
[setreplay name="replay03"]
[setreplay name="replay04"]
[setreplay name="replay05"]
[setreplay name="replay06"]
[setreplay name="replay07"]
[setreplay name="replay08"]
[setreplay name="replay09"]
[setreplay name="replay10"]
[setreplay name="replay11"]
[setreplay name="replay12"]
[setreplay name="replay13"]
[setreplay name="replay14"]
[setreplay name="replay15"]
[setreplay name="replay16"]
[setreplay name="replay17"]
[setreplay name="replay18"]
[setreplay name="replay19"]
[setreplay name="replay20"]
[setreplay name="replay21"]
[setreplay name="replay22"]
[setreplay name="replay23"]
[setreplay name="replay24"]
[setreplay name="replay25"]
[setreplay name="replay26"]
[setreplay name="replay27"]
[setreplay name="replay28"]
[setreplay name="replay29"]
[setreplay name="replay30"]
[setreplay name="replay31"]
[setreplay name="replay32"]
[setreplay name="replay33"]
[setreplay name="replay34"]
[setreplay name="replay35"]
[setreplay name="replay36"]
[setreplay name="replay37"]
[setreplay name="replay38"]
[setreplay name="replay39"]
[setreplay name="replay40"]
@jump target="*replaypage"

*clear_replay_all
[clearreplay name="replay01"]
[clearreplay name="replay02"]
[clearreplay name="replay03"]
[clearreplay name="replay04"]
[clearreplay name="replay05"]
[clearreplay name="replay06"]
[clearreplay name="replay07"]
[clearreplay name="replay08"]
[clearreplay name="replay09"]
[clearreplay name="replay10"]
[clearreplay name="replay11"]
[clearreplay name="replay12"]
[clearreplay name="replay13"]
[clearreplay name="replay14"]
[clearreplay name="replay15"]
[clearreplay name="replay16"]
[clearreplay name="replay17"]
[clearreplay name="replay18"]
[clearreplay name="replay19"]
[clearreplay name="replay20"]
[clearreplay name="replay21"]
[clearreplay name="replay22"]
[clearreplay name="replay23"]
[clearreplay name="replay24"]
[clearreplay name="replay25"]
[clearreplay name="replay26"]
[clearreplay name="replay27"]
[clearreplay name="replay28"]
[clearreplay name="replay29"]
[clearreplay name="replay30"]
[clearreplay name="replay31"]
[clearreplay name="replay32"]
[clearreplay name="replay33"]
[clearreplay name="replay34"]
[clearreplay name="replay35"]
[clearreplay name="replay36"]
[clearreplay name="replay37"]
[clearreplay name="replay38"]
[clearreplay name="replay39"]
[clearreplay name="replay40"]

@jump target="*replaypage"

*clickcg
[cm]

[iscript]
    // リプレイモードフラグ:このページに戻ってくるためのアンカ
    tf.flag_replay = true;
[endscript]

[free layer=1 name="label_replay"]

@jump storage=&tf.selected_replay_obj.storage target=&tf.selected_replay_obj.target
[s]

*no_image

@jump  target=*replaypage


