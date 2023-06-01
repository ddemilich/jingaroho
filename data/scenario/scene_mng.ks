*start

; シーンマネージャ配列の初期化
[iscript]
    sf.scene_mng = {};
[endscript]

; シーンの疑似コンストラクタ
; 引数(*)は必須
; (*)mp.name=名前
; (*)mp.storage=スクリプトファイル
;    mp.target=シーンの開始位置
; (*)mp.nextdefault=次のシーンのname
;    mp.nextalt1=次の選択1シーンのname
;    mp.nextalt2=次の選択2シーンのname
;    mp.nextalt3=次の選択3シーンのname
[macro name="new_scene"]
[iscript]
    let sobj = {};
    sobj.storage = mp.storage;
    if (mp.target) {
        tf.sobj.target=mp.target;
    }
    sobj.nextdefault=mp.nextdefault;
    sobj.nextalt1=mp.nextalt1;
    sobj.nextalt2=mp.nextalt2;
    sobj .nextalt3=mp.nextalt3;
    sf.scene_mng[mp.name] = sobj;
[endscript]
[endmacro]

; シーン生成
; debug
[new_scene name="1_A1" storage="scene1_A1.ks" nextdefault="title"]
; タイトル(戻ってくる専用)
[new_scene name="title" storage="title.ks" nextdefault="title"]
; プロローグ
[new_scene name="p_001" storage="sceneP_001.ks" nextdefault="title"]
; ルート1
[new_scene name="1_001" storage="scene1_001.ks" nextdefault="1_099"]
[new_scene name="1_099" storage="scene1_099.ks" nextdefault="1_101" nextalt1="1_101" nextalt2="2_001" nextalt3="3_001"]
[new_scene name="1_101" storage="scene1_101.ks" nextdefault="1_199"]
[new_scene name="1_199" storage="scene1_199.ks" nextdefault="1_201" nextalt1="1_201" nextalt2="5_001"]
[new_scene name="1_201" storage="scene1_201.ks" nextdefault="1_299"]
[new_scene name="1_299" storage="scene1_299.ks" nextdefault="1_901"]
[new_scene name="1_901" storage="scene1_901.ks" nextdefault="1_999"]
[new_scene name="1_999" storage="scene1_999.ks" nextdefault="title"]
; ルート2
[new_scene name="2_001" storage="scene2_001.ks" nextdefault="2_099"]
[new_scene name="2_099" storage="scene2_099.ks" nextdefault="2_101" nextalt1="2_101" nextalt2="4_001"]
[new_scene name="2_101" storage="scene2_101.ks" nextdefault="2_199"]
[new_scene name="2_199" storage="scene2_199.ks" nextdefault="2_201" nextalt1="2_201" nextalt2="6_001"]
[new_scene name="2_201" storage="scene2_201.ks" nextdefault="2_299"]
[new_scene name="2_299" storage="scene2_299.ks" nextdefault="2_901"]
[new_scene name="2_901" storage="scene2_901.ks" nextdefault="2_999"]
[new_scene name="2_999" storage="scene2_999.ks" nextdefault="title"]
; ルート3
[new_scene name="3_001" storage="scene3_001.ks" nextdefault="3_099"]
[new_scene name="3_099" storage="scene3_099.ks" nextdefault="3_101" nextalt1="3_101" nextalt2="7_001"]
[new_scene name="3_101" storage="scene3_101.ks" nextdefault="3_199"]
[new_scene name="3_199" storage="scene3_199.ks" nextdefault="3_901"]
[new_scene name="3_901" storage="scene3_901.ks" nextdefault="3_999"]
[new_scene name="3_999" storage="scene3_999.ks" nextdefault="title"]
; ルート4
[new_scene name="4_001" storage="scene4_001.ks" nextdefault="4_099"]
[new_scene name="4_099" storage="scene4_099.ks" nextdefault="4_901"]
[new_scene name="4_901" storage="scene4_901.ks" nextdefault="4_999"]
[new_scene name="4_999" storage="scene4_999.ks" nextdefault="title"]
; ルート5
[new_scene name="5_001" storage="scene5_001.ks" nextdefault="5_099"]
[new_scene name="5_099" storage="scene5_099.ks" nextdefault="5_901"]
[new_scene name="5_901" storage="scene5_901.ks" nextdefault="5_999"]
[new_scene name="5_999" storage="scene5_999.ks" nextdefault="title"]
; ルート6
[new_scene name="6_001" storage="scene6_001.ks" nextdefault="6_099"]
[new_scene name="6_099" storage="scene6_099.ks" nextdefault="6_901"]
[new_scene name="6_901" storage="scene6_901.ks" nextdefault="6_999"]
[new_scene name="6_999" storage="scene6_999.ks" nextdefault="title"]
; ルート7
[new_scene name="7_001" storage="scene7_001.ks" nextdefault="7_099"]
[new_scene name="7_099" storage="scene7_099.ks" nextdefault="7_901"]
[new_scene name="7_901" storage="scene7_901.ks" nextdefault="7_999"]
[new_scene name="7_999" storage="scene7_999.ks" nextdefault="title"]

; シーン生成ここまで

; シーンヘッダ
; 引数
; mp.name=自分のシーンの名前
[macro name="scene_header"]
[iscript]
    tf.flag_alt = 0
    console.log(mp.name)
    tf.current_scene=sf.scene_mng[mp.name]
[endscript]
[endmacro]

; シーンフッタ
; 引数なし
[macro name="scene_footer"]
[iscript]
    if (tf.flag_replay) {
        tf.flag_replay = false
        tf.next_scene  = "replay.ks"
        tf.next_target = ""
    } else {
        if (tf.flag_alt == 1) {
            tf.next_scene  = sf.scene_mng[tf.current_scene.nextalt1].storage
            tf.next_target = sf.scene_mng[tf.current_scene.nextalt1].target
        } else if (tf.flag_alt == 2) {
            tf.next_scene  = sf.scene_mng[tf.current_scene.nextalt2].storage
            tf.next_target = sf.scene_mng[tf.current_scene.nextalt2].target
        } else if (tf.flag_alt == 3) {
            tf.next_scene  = sf.scene_mng[tf.current_scene.nextalt3].storage
            tf.next_target = sf.scene_mng[tf.current_scene.nextalt3].target
        } else {
            tf.next_scene  = sf.scene_mng[tf.current_scene.nextdefault].storage
            tf.next_target = sf.scene_mng[tf.current_scene.nextdefault].target
        }
    }
[endscript]
@jump storage=&tf.next_scene target=&tf.next_target
[endmacro]

[return]