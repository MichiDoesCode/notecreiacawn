var rate = 25;
var move = true;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

public var focusCam = false;

function create(){
    camGame.fade(FlxColor.BLACK, 0);
}

function postCreate(){
        scoreTxt.font = accuracyTxt.font = missesTxt.font = Paths.font("MusekininKatakana-x34r.ttf");
        scoreTxt.size = accuracyTxt.size = missesTxt.size = 12;
        scoreTxt.y = accuracyTxt.y = missesTxt.y = 600;
        missesTxt.x = 445;

    add(songTitleTxt = new FlxText(0, 20, FlxG.width, curSong));
    songTitleTxt.setFormat(Paths.font("MusekininKatakana-x34r.ttf"), 30, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 020202);
    songTitleTxt.borderSize = 20;
    songTitleTxt.camera = camHUD;
    songTitleTxt.alpha = 0;

    majinBar = new FlxSprite();
    majinBar.loadGraphic(Paths.image("majinbar"));
    majinBar.screenCenter();
    insert(2, majinBar);
    majinBar.cameras = [camHUD];
    majinBar.y = 585;

    circle = new FlxSprite();
    circle.loadGraphic(Paths.image("FunInfiniteStage/Circle-endless"));
    circle.x = 1000;
    insert(2, circle);
    circle.cameras = [camHUD];
    circle.y = 0;

    tex = new FlxSprite();
    tex.loadGraphic(Paths.image("FunInfiniteStage/Text-endless"));
    tex.x = 1100;
    insert(3, tex);
    tex.cameras = [camHUD];
    tex.y = 0;    

    t = new FlxSprite();    
    t.loadGraphic(Paths.image("FunInfiniteStage/3f"));
    t.screenCenter();
    insert(2, t);
    t.alpha = 0;
    t.cameras = [camHUD];
    t.angle = 10;

    tt = new FlxSprite();    
    tt.loadGraphic(Paths.image("FunInfiniteStage/2f"));
    tt.screenCenter();
    insert(2, tt);
    tt.alpha = 0;
    tt.cameras = [camHUD];
    tt.angle = -10;

    ttt = new FlxSprite();    
    ttt.loadGraphic(Paths.image("FunInfiniteStage/1f"));
    ttt.screenCenter();
    insert(2, ttt);
    ttt.alpha = 0;
    ttt.cameras = [camHUD];
    ttt.angle = 10;

    tttt = new FlxSprite();    
    tttt.loadGraphic(Paths.image("FunInfiniteStage/4go"));
    tttt.screenCenter();
    insert(2, tttt);
    tttt.alpha = 0;
    tttt.cameras = [camHUD];
}

function onCountdown() {
    FlxTween.tween(circle, {x: 0}, 0.5, {ease: FlxEase.circOut});
    FlxTween.tween(tex, {x: 0}, 0.7, {ease: FlxEase.circOut});
}

function onSongStart() {
    FlxTween.tween(songTitleTxt, {alpha: 1}, 0.5);
    FlxTween.tween(circle, {x: 1000}, 0.5, {ease: FlxEase.circOut});
    FlxTween.tween(tex, {x: -1100}, 0.7, {ease: FlxEase.circOut});
    FlxTween.tween(circle, {alpha: 0}, 0.5, {ease: FlxEase.circOut});
    FlxTween.tween(tex, {alpha: 0}, 0.7, {ease: FlxEase.circOut});
    camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8, true);
}
function onStrumCreation(e){
    e.strum.angle = 0;
}
    


function beatHit(beat:Int){
        switch(beat){
            case 222:
            t.alpha = 1;
            defaultCamZoom = 0.9;
            FlxTween.tween(t, {alpha: 0}, 0.3);
            FlxTween.tween(t, {angle: 0}, 0.3, {ease: FlxEase.circOut});
           
            case 223:
            tt.alpha = 1;
            defaultCamZoom = 1.2;
            FlxTween.tween(tt, {alpha: 0}, 0.3);
            FlxTween.tween(tt, {angle: 0}, 0.3, {ease: FlxEase.circOut});

            case 224:
            ttt.alpha = 1;
            defaultCamZoom = 1.4;
            FlxTween.tween(ttt, {alpha: 0}, 0.3);
            FlxTween.tween(ttt, {angle: 0}, 0.3, {ease: FlxEase.circOut});

            case 225:
            tttt.alpha = 1;
            defaultCamZoom = 0.75;
            FlxTween.tween(tttt, {alpha: 0}, 0.9);
            FlxTween.tween(tttt, {angle: 360}, 0.7, {ease: FlxEase.circOut});  
            
            
            case 68 | 69 | 84 | 85 | 100 | 101 | 116 | 117 | 132 | 133 | 148 | 149 | 164 | 165 | 180 | 181 | 196 | 197 | 212 | 213 | 228 | 229 | 244 | 245 | 260 | 261 | 276 | 277 | 292 | 293 | 308 | 309 | 324 | 325 | 340 | 341 | 356 | 357 | 372 | 373 | 388 | 389 | 404 | 405:
            iconP1.angle = 0;
            iconP2.angle = 0;
            FlxTween.tween(iconP1, {angle: 360}, 0.3, {ease: FlxEase.circOut});
            FlxTween.tween(iconP2, {angle: 360}, 0.3, {ease: FlxEase.circOut});
     
        }
    }

function postUpdate(elapsed:Float) {
    
     var x = 0;
     var y = 0;
    iconP1.x = 840;
    iconP1.y = 550;
    iconP2.x = 250;
    iconP2.y = 550;
    iconP1.scale.set(0.8, 0.8);
    iconP2.scale.set(0.8, 0.8);
    healthBarBG.y = 630;
    healthBar.y = 634;
    doIconBop = false;
    camHUD.zoom = 0.93;
     var mult = 25; //modify this as you want
     var char = strumLines.members[curCameraTarget].characters[0];
        
     if (move != true) return;

     switch(char.getAnimName()) {

             case "singLEFT":
             x = -rate;
             y = 0;

             case "singDOWN":
             x = 0;
             y = rate;

             case "singUP":
             x = 0;
             y = -rate;

             case "singRIGHT":
             x = rate;
             y = 0;

             case "idle":
             x = 0;
             y = 0;
      }
      FlxG.camera.targetOffset.set(
          FlxMath.lerp(FlxG.camera.targetOffset.x, x, camera.followLerp * mult), 
          FlxMath.lerp(FlxG.camera.targetOffset.y, y, camera.followLerp * mult)
      );
      FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle, x / -30, camera.followLerp);
}

function onCameraMove(e) if (focusCam) e.cancel();