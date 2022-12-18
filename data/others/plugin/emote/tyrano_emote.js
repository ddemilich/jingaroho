var map_emote_player = {};

EmotePlayer.createRenderCanvas(TYRANO.kag.config.scWidth, TYRANO.kag.config.scHeight);


/*
#[emote_config]
:group
E-mote
:title
E-mote全体のコンフィグ
:exp
E-mote全体の挙動のコンフィグを設定します。
:sample
[emote_config transform=ortho]
:param
transform=座標変換モードを指定します。指定可能な値はorthogonal|persepective|mixのいずれか。デフォルト動作はmixになっています。
#[end]
*/
TYRANO.kag.ftag.master_tag.emote_config = {
  kag: TYRANO.kag,
  pm: {
    transform: "",
  },
  start: function(pm) {
    if (pm.transform != "")
      TYRANO.kag.variable.sf.emote_config_transform = pm.transform;
    TYRANO.kag.ftag.nextOrder();
  },
};

/*
 #[emote_new]
 :group
 E-mote
 :title
 E-moteモデルの作成
 :exp
 E-moteモデルを定義します。実行時点ではまだモデルは表示されません。
 その後 [emote_show]タグで表示されます。
 :sample
 [emote_new name="emoko" x=100 y=200 ]
 :param
 name=モデル名を指定します,
 jname=このキャラクターをネームスペースに表示する場合、適用する名称を指定できます。
 storage=ロードするモデルデータ(emtbytes)を指定します。データはプラグインフォルダ内のmodelフォルダ以下に配置してください。カンマで区切ることで、差分データを読み込ませることもできます。,
 layer=モデルを表示するレイヤを指定できます。デフォルトは0,
 page=backかforeを指定できます。デフォルトはfore,
 scale=モデルを表示する時のスケールを指定できます。デフォルトは１。例えば、1.5を指定すると1.5倍の大きさに拡大されます,
 x=モデルのヨコ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。デフォルトは0,
 y=モデルのタテ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。デフォルトは0,
 grayscale=モデルにグレースケールをかける度合いを指定します。値の範囲は0から1で、1を指定すると完全なグレーになります。デフォルトは0。,
 color=モデルに乗算するカラーを指定します。0xRRGGBB形式で指定します。デフォルトは0xFFFFFF。,
 meshdivisionratio=メッシュ分割率。小さくするとメッシュを粗くする替わりに計算負荷を減らせます。見た目の破綻しない実用的な下限は0.5程度です。デフォルトは1。,
 physics=物理演算の有効（true）、無効（false）を指定できます。デフォルトはtrue,
 zindex=キャラの表示優先度を数値で指定します。デフォルトは1,
 resetmotiononhide=emote_hide時にモーションをリセットするかどうかを指定します。値を指定すると、hide時にメインタイムラインを指定の値のモーションで、差分タイムラインを空文字列でリセットします。初期値は"初期化"です。
 #[end]
 */
 
TYRANO.kag.ftag.master_tag.emote_new = {
    
    kag: TYRANO.kag,
	vital : ["storage"],
    	
    pm : {
        name:"",
        jname: "",
        storage : "",
        width:"",
        height:"",
        scale:"1",
        left:"",
        top:"",
        x:"",
        y:"",
        meshdivisionratio:"1",
        physics:"false",
        color:"FFFFFF",
        opacity:"0",
        grayscale:"0",
        motion:"",
        
        layer:"0",
        page:"fore",
        
        motion_1:"",
        motion_2:"",
        motion_3:"",
        motion_4:"",
        motion_5:"",
        motion_6:"",

        resetmotiononhide:"初期化",

        zindex: "1",
        
        next:"true",

        variableHash: {}
    },

    start : function(pm) {

      var that = this;
        
        if (!EmoteDriver_Initialized) {
            setTimeout(function(){that.start(pm)}, 100);
            return;
        }

        if (! ("variableHash" in pm))
          pm.variableHash = {};
      
        var j_canvas = $('<canvas class="'+pm.name+' emote_model" id="emote_canvas_'+pm.name+'"></canvas>');
        j_canvas.css("position","absolute");
        j_canvas.css("opacity",parseInt(pm.opacity));
        
        if(pm.width==""){
            pm.width = TYRANO.kag.config.scWidth;
        }
        
        if(pm.height==""){
            pm.height = TYRANO.kag.config.scHeight;
        }
        
        j_canvas.attr("width",pm.width);
        j_canvas.attr("height",pm.height);
        
        /*
        if(pm.left!=""){
            j_canvas.css("left",parseInt(pm.left));
        }
        
        if(pm.top!=""){
            j_canvas.css("top",parseInt(pm.top));
        }
        */
        
        var player = new EmotePlayer(j_canvas.get(0));
        player.meshDivisionRatio = parseFloat(pm.meshdivisionratio);
      if ("emote_config_transform" in TYRANO.kag.variable.sf) {
          switch (TYRANO.kag.variable.sf.emote_config_transform) {
          case "orthogonal":   player.transformOrderMask = 0x101; break;
          case "persepective": player.transformOrderMask = 0x202; break;
          default:             player.transformOrderMask = 0x201; break;
          }
        }
      
        if (pm.opacity == "0") 
            player.hide = true;
        else
            player.hide = false;
        
        if(pm.physics=="true"){
            player.convolveCanvasMovementToPhysics=true;
        }
        
        if(pm.motion!=""){
            player.mainTimelineLabel = pm.motion;
        }

        if (pm.zindex != "") {
          j_canvas.css("z-index", pm.zindex);
        }
        
        for(var i=1;i<7;i++){
            
            if(pm["motion_"+i] != ""){
                player["diffTimelineSlot"+i ] = pm["motion_"+i];
            }
        
        }
        
        if(pm.x!="") pm.left = pm.x;
        if(pm.y!="") pm.top = pm.y;
       
        
        var left = 0;
        var top = 0;
        
        if(pm.left!=""){
            left = parseInt(pm.left);
        }
        
        if(pm.top!=""){
            top = parseInt(pm.top);
        }

        player.setCoord(left, top);
                
        map_emote_player[pm.name] = {};
        map_emote_player[pm.name]["player"] = player
        map_emote_player[pm.name]["canvas"] = j_canvas;

        if(pm.jname!="") TYRANO.kag.stat.jcharas[pm.name]=pm.jname;

        if (pm.color.substr(0, 2) == "0x") {
            pm.color = pm.color.substr(2);
        }
        
        //ステータスにモデル情報を配置する。
        if(!TYRANO.kag.stat.emote_models){
            TYRANO.kag.stat.emote_models={};
        }

        TYRANO.kag.stat.emote_models[pm.name] = pm;
        
        
        var target_layer = TYRANO.kag.layer.getLayer(pm.layer,pm.page);
        target_layer.show();
        target_layer.append(j_canvas);

        var storages = pm.storage.replace(".emtbytes","").split(",").map(function(value){ return "./data/others/plugin/emote/model/" + value + ".emtbytes"; });

        var applyVariableEntry = function(val) { player.setVariable(val[0], val[1]); };
        var applyVariableHash = function() { Object.entries(pm.variableHash).forEach(applyVariableEntry); };
        player.promiseLoadDataFromURL.apply(player, storages)
        .then(applyVariableHash)
        .catch(function(error) { console.error(error);});

        // set chara scale
        player.scale = parseFloat(pm.scale);
        player.grayscale = parseFloat(pm.grayscale);
        player.globalColor = pm.color;
        // play test timeline
        //player.mainTimelineLabel = 'sample_全自動_test';
        if(pm.next=="true"){
            TYRANO.kag.ftag.nextOrder();
        }
        
    }
        
};


/*
 #[emote_show]
 :group
 E-mote
 :title
 E-moteモデルの表示
 :exp
 E-moteモデルをゲーム画面に表示します。
 表示するためには予め[emote_new]タグでモデルを読み込んでおく必要があります。
 :sample
 [emote_new name="emoko"  ]
 [emote_show name="emoko" left=100 top=200 ]
 :param
 name=モデル名を指定します,
 scale=モデルを表示する時のスケールを指定できます。例えば、1.5を指定すると1.5倍の大きさに拡大されます,
 x=モデルのヨコ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。,
 y=モデルのタテ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。,
 grayscale=モデルにグレースケールをかける度合いを指定します。値の範囲は0から1で、1を指定すると完全なグレーになります。,
 color=モデルに乗算するカラーを指定します。0xRRGGBB形式で指定します。,
 time=モデルがフェードインで表示される時間をミリ秒で指定できます。デフォルトは1000,
 wait=フェードインの完了を待つかどうかを指定できます。true or false 。デフォルトはtrue です。,
 zindex=キャラの表示優先度を数値で指定します。
 #[end]
*/


TYRANO.kag.ftag.master_tag.emote_show = {
    
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
        name:"",
        left:"",
        top:"",
        x:"",
        y:"",
        scale:"",
        grayscale:"",
        color:"",
        time:"1000",
        wait: "true",
        zindex: "",
    },

    start : function(pm) {
        
        var that = this;
        
        var j_canvas = map_emote_player[pm.name]["canvas"];
        var player = map_emote_player[pm.name]["player"];

        player.hide = false;
        
        //プレイヤーの初期化が完了するまで待つ
        if (!player.initialized) {
            setTimeout(function(){that.start(pm)}, 100);
            return;
        }

        if(pm.x!="") pm.left = pm.x;
        if(pm.y!="") pm.top = pm.y;

        // ZIndex
        if (pm.zindex != "") {
          TYRANO.kag.stat.emote_models[pm.name]["zindex"] = pm.zindex;
          j_canvas.css("z-index", pm.zindex);
        }          

        //位置情報の確認。
        var left = player.coord[0];
        var top = player.coord[1];
        
        if(pm.left!=""){
            left = parseInt(pm.left);
        }
        
        if(pm.top!=""){
            top = parseInt(pm.top);
        }

        player.setCoord(left, top);
        player.skip();
        
        TYRANO.kag.stat.emote_models[pm.name]["left"] = pm.left;
        TYRANO.kag.stat.emote_models[pm.name]["top"] = pm.top;
        
        
        if(pm.scale!=""){
            player.scale = parseFloat(pm.scale);
            TYRANO.kag.stat.emote_models[pm.name]["scale"] = pm.scale;
        }

        // グレースケールの設定
        if (pm.grayscale != "") {
            player.grayscale = parseFloat(pm.grayscale);
            TYRANO.kag.stat.emote_models[pm.name]["grayscale"] = pm.grayscale;
        }

        // カラーの設定
        if (pm.color.substr(0, 2) == "0x") {
            pm.color = pm.color.substr(2);
        }
        if (pm.color != "") {
            player.globalColor = pm.color;
            TYRANO.kag.stat.emote_models[pm.name]["color"] = pm.color;
        }
        
        TYRANO.kag.stat.emote_models[pm.name]["opacity"] = "1";
        
        if (parseInt(pm.time) == 0) {
          j_canvas.css("opacity", 1);
          TYRANO.kag.ftag.nextOrder();
        } else if (pm.wait == "true") {
          j_canvas.animate(
              {
                 "opacity":1
              },
              parseInt(pm.time),
              function(){
                  TYRANO.kag.ftag.nextOrder();
             }
          );
        } else {
          TYRANO.kag.ftag.nextOrder();
          j_canvas.animate(
              {
                 "opacity":1
              },
              parseInt(pm.time)
          );
        }
        //canvas.style.opacity = 1;  
        
        
    }
        
};

/*
 #[emote_hide]
 :group
 E-mote
 :title
 E-moteモデルの非表示
 :exp
 E-moteモデルをゲーム画面から非表示にします。
 このタグや画面から非表示にするだけで、メモリ上には残ります。
 完全に使用しなくなったモデルは[emote_delete]タグで削除してください。
 :sample
 ;モデルの宣言
 [emote_new name="emoko"  ]
 ;モデルの表示
 [emote_show name="emoko" x=100 y=200 ]
 ;モデルの非表示
 [emote_hide name="emoko" time=2000]
 ;モデルの削除
 [emote_delete name="emoko"]
 :param
 name=モデル名を指定します,
 time=モデルがフェードアウトされる時間をミリ秒で指定できます。デフォルトは1000,
 wait=フェードアウトの完了を待つかどうかを指定できます。true or false 。デフォルトはtrue です。
 #[end]
*/


TYRANO.kag.ftag.master_tag.emote_hide = {
    
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
        name:"",
        time:"1000",
        wait:"true"
    },

    start : function(pm) {
        
        var that = this;

        var j_canvas = map_emote_player[pm.name]["canvas"];
        var player = map_emote_player[pm.name]["player"];
        
        TYRANO.kag.stat.emote_models[pm.name]["opacity"] = "0";
        var stat = TYRANO.kag.stat.emote_models[pm.name];

        if (parseInt(pm.time) == 0) {
          j_canvas.css("opacity", 0);
          that.resetmotion(player, stat);
          player.hide = true;
          TYRANO.kag.ftag.nextOrder();
        } else if (pm.wait == "true") {
          j_canvas.animate(
              {
                  "opacity":0
              },
              parseInt(pm.time),
              function(){
                  that.resetmotion(player, stat);
                  player.hide = true;
                  TYRANO.kag.ftag.nextOrder();
              }
          );
        } else {
          TYRANO.kag.ftag.nextOrder();
          j_canvas.animate(
              {
                  "opacity":0
              },
              parseInt(pm.time),
              function(){
                  that.resetmotion(player, stat);
                  player.hide = true;
              }
          );
        }        
        //canvas.style.opacity = 1;  
        
    },

    resetmotion: function(player, stat) {
      if (stat["resetmotiononhide"] != "") {
        player.mainTimelineLabel = stat["resetmotiononhide"];
        player.diffTimelineSlot1 = "";
        player.diffTimelineSlot2 = "";
        player.diffTimelineSlot3 = "";
        player.diffTimelineSlot4 = "";
        player.diffTimelineSlot5 = "";
        player.diffTimelineSlot6 = "";
        stat["motion"] = stat["resetmotiononhide"];
        stat["motion_1"] = "";
        stat["motion_2"] = "";
        stat["motion_3"] = "";
        stat["motion_4"] = "";
        stat["motion_5"] = "";
        stat["motion_6"] = "";
      }
    }
};

/*
 #[emote_motion]
 :group
 E-mote
 :title
 E-moteモデルにモーションを設定する
 :exp
 E-moteモデルのモーションを再生します。
 予め[emote_new]タグでモデルを読み込んでおく必要があります。
 :sample
 [emote_new name="emoko"  ]
 [emote_show name="emoko" x=100 y=200 ]
 
 ;モーションの再生
 [emote_motion name="emote1" motion="sample_00" ]

 :param
 name=モデル名を指定します,
 motion=再生するモーション名を指定してください省略すると、モーションを停止します。,
 slot=モーションのスロットを1-6の範囲で指定できます。差分モーションを設定する場合は数値を入れてください。デフォルトはメインモーション（main）,
 wait=モーションの再生が完了するまで待つか否かを指定できます。true or false 。デフォルトはfalse です。
 #[end]
*/


TYRANO.kag.ftag.master_tag.emote_motion = {
    
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
        name:"",
        motion:"",
        slot:"main",
        wait:"false"
    },

    start : function(pm) {
        
        var j_canvas = map_emote_player[pm.name]["canvas"];
        var player = map_emote_player[pm.name]["player"];

        var tmProp = "";
        var pmProp = "";
        if(pm.slot=="main"){
          tmProp = "mainTimelineLabel";
          pmProp = "motion";
        }else{
          tmProp = "diffTimelineSlot"+pm.slot;
          pmProp = "motion_"+pm.slot;
        }

        if (player[tmProp] == pm.motion) 
          player[tmProp] = "";
        player[tmProp] = pm.motion;
        TYRANO.kag.stat.emote_models[pm.name][pmProp] = pm.motion;
        
        if(pm.wait=="true"){
            
            if(!player.isLoopTimeline(pm.motion)){
                this.waitOrder(player,pm);
            }else{
                TYRANO.kag.ftag.nextOrder();
            }
            
        }else{
            TYRANO.kag.ftag.nextOrder();
        }
    },
    
    waitOrder:function(player,pm){
        
        var that = this;
        
        //モーションの再生完了を待つ
        if(player.isTimelinePlaying(pm.motion)){
            
            setTimeout(function(){
                that.waitOrder(player,pm);
            },100);
            
        }else{
                
            TYRANO.kag.ftag.nextOrder();
        }
    }
        
};

/*
 #[emote_variable]
 :group
 E-mote
 :title
 E-moteモデルに変数を設定する
 :exp
 E-moteモデルの変数を設定します。
 予め[emote_new]タグでモデルを読み込んでおく必要があります。
 :sample
 [emote_new name="emoko"  ]
 [emote_show name="emoko" x=100 y=200 ]
 
 ;変数の設定
 [emote_variable name="emoko" variable="face_LR" value=-30 time=300]

 :param
 name=モデル名を指定します,
 variable=設定する変数名を指定してください。
 value=設定する変数の値を指定してください。デフォルトは0です。
 time=変数が繊維する時間をミリ秒で指定できます。デフォルトは0です。
 wait=変数の再生が完了するまで待つか否かを指定できます。true or false 。デフォルトはfalse です。
 #[end]
*/

TYRANO.kag.ftag.master_tag.emote_variable = {
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
      name:"",
      variable:"",
      time:"0",
      value:"0",
      wait:"false",
    },
  start: function(pm) {
    // ハッシュ更新
    TYRANO.kag.stat.emote_models[pm.name]["variableHash"][pm.variable] = parseFloat(pm.value);

    //プレイヤーの初期化が完了してないならスルー
    var player = map_emote_player[pm.name]["player"];
    if (! player.initialized) {
      TYRANO.kag.ftag.nextOrder();
      return;
    }
    player.setVariable(pm.variable, parseFloat(pm.value), parseInt(pm.time));

    if (parseInt(pm.time) != 0
        && pm.wait == "true") {
      setTimeout(function() { TYRANO.kag.ftag.nextOrder(); }, parseInt(pm.time));
    } else {
      TYRANO.kag.ftag.nextOrder();
    }
  }
};

      
/*
 #[emote_delete]
 :group
 E-mote
 :title
 E-moteモデルを削除
 :exp
 E-moteモデルを完全に削除します。
 メモリ上からも排除されるため、不要になったモデルはこまめにdeleteしておきましょう。
 削除したモデルを再度、表示したい場合はもう一度[emote_new]タグから行います。
 :sample
 [emote_new name="emoko"  ]
 [emote_show name="emoko" x=100 y=200 ]
 [emote_hide name="emoko" ]
 
 ;完全に削除
 [emote_delete name="emoko" ]
 
 :param
 name=削除するモデル名を指定します
 #[end]
*/

TYRANO.kag.ftag.master_tag.emote_delete = {
    
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
        name:"",
        next:"true",
        is_restore:"false"
    },

    start : function(pm) {
        
        if(map_emote_player[pm.name]){
            
            var j_canvas = map_emote_player[pm.name]["canvas"];
            var player = map_emote_player[pm.name]["player"];
            
            player.unloadData();
            j_canvas.remove();
            
            delete map_emote_player[pm.name];
            if(pm.is_restore=="false"){
                delete TYRANO.kag.stat.emote_models[pm.name];
            }
            
        }
        
        if(pm.next=="true"){
            //falseの時はロード時の前処理だから、以下の削除は不要
            TYRANO.kag.ftag.nextOrder();
        }
    }
        
};

/*
 #[emote_trans]
 :group
 E-mote
 :title
 E-moteモデルの変形、変更
 :exp
 E-moteモデルの位置や大きさを変更できます。
 :sample
 立ち位置変更[p]
 [emote_trans name="emote1" time=500 x=200]
 [emote_trans name="emote1" time=500 x=-200]

 :param
 name=モデル名を指定します,
 time=モデルがアニメーションする時間をミリ秒で指定できます。デフォルトは1000,
 scale=モデルのスケールを指定できます。例えば、1.5を指定すると1.5倍の大きさに拡大されます,
 x=モデルのヨコ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。,
 y=モデルのタテ、立ち位置を指定します。注意点として画面中央が 0 となり、ティラノの他の指定とは異なりますのでご注意ください。,
 grayscale=モデルにグレースケールをかける度合いを指定します。値の範囲は0から1で、1を指定すると完全なグレーになります。,
 color=モデルに乗算するカラーを指定します。0xRRGGBB形式で指定します。,
 zindex=キャラの表示優先度を数値で指定します。,
 wait=trueを指定すると、アニメーションの完了を待ちます。デフォルトはtrue です。

 #[end]
*/


TYRANO.kag.ftag.master_tag.emote_trans = {
    
    kag: TYRANO.kag,
	vital : ["name"],
    pm:{
        name:"",
        left:"",
        top:"",
        x:"",
        y:"",
        scale:"",
        grayscale:"",
        color:"",
        time:"1000",
        easing:"-1",
        wait:"true",
        zindex:"",
    },

    start : function(pm) {
        
        var j_canvas = map_emote_player[pm.name]["canvas"];
        var player = map_emote_player[pm.name]["player"];
        
        // ZIndex
        if (pm.zindex != "") {
          TYRANO.kag.stat.emote_models[pm.name]["zindex"] = pm.zindex;
          j_canvas.css("z-index", pm.zindex);
        }          

        var coord = player.coord;
        
        var xofs = coord[0];
        var yofs = coord[1];
        
        if(pm.x!="") pm.left = pm.x;
        if(pm.y!="") pm.top = pm.y;
        
        
        if(pm.left!=""){
            xofs = parseInt(pm.left)
            TYRANO.kag.stat.emote_models[pm.name]["left"] = pm.left;
        }
        
        if(pm.top!=""){
            yofs = parseInt(pm.top);
            TYRANO.kag.stat.emote_models[pm.name]["top"] = pm.top;
        }
        
        if(pm.left!="" || pm.top!=""){
            player.setCoord(xofs, yofs, parseInt(pm.time), parseInt(pm.easing));
        }
        
        if(pm.scale!=""){
            player.setScale(parseFloat(pm.scale), parseInt(pm.time), parseInt(pm.easing));
            TYRANO.kag.stat.emote_models[pm.name]["scale"] = pm.scale;
        }

       if(pm.grayscale!=""){
            player.setGrayscale(parseFloat(pm.grayscale), parseInt(pm.time), parseInt(pm.easing));
            TYRANO.kag.stat.emote_models[pm.name]["grayscale"] = pm.grayscale;
        }

        if (pm.color.substr(0, 2) == "0x") {
            pm.color = pm.color.substr(2);
        }
        if (pm.color != "") {
            player.setGlobalColor(pm.color, parseInt(pm.time), parseInt(pm.easing));
            TYRANO.kag.stat.emote_models[pm.name]["color"] = pm.color;
        }
        
        if(pm.wait=="true"){
        
            setTimeout(function(){
                TYRANO.kag.ftag.nextOrder();
            },parseInt(pm.time));
        
        }else{
            
            TYRANO.kag.ftag.nextOrder();
            
        }
        //canvas.style.opacity = 1;  
        
        
    }
        
};


TYRANO.kag.ftag.master_tag.emote_restore = {
    
    kag: TYRANO.kag,
	vital : [],
    pm:{
        
    },

    start : function(pm) {
        
       // 残置 emote削除
        var remains = Object.keys(map_emote_player);

        remains.forEach(function(key) {
          TYRANO.kag.ftag.startTag("emote_delete",{name:key, next:"false",is_restore:"true"});
        });
     
        // セーブデータ emote 復活
        models = TYRANO.kag.stat.emote_models;

        for(key in models){
            var pm = models[key];
            pm.next="false";
            TYRANO.kag.ftag.startTag("emote_new",pm);
        }
        
        TYRANO.kag.ftag.nextOrder();
        
    }
        
};


