import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

function postCreate(){

  comboGroup.visible = false;

  ratingGroup = new FlxTypedGroup();
  add(ratingGroup);

    godot = new FlxText(0, healthBar.y + (downscroll ? -39 : 25), FlxG.width, "Score:0 • Misses:0 • Accuracy:N/A (N/A)");
	godot.setFormat(Paths.font("vcr.ttf"), 17, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 10);
	godot.borderSize = 1.5;
	godot.camera = camHUD;
	godot.screenCenter(FlxAxes.X);
    scoreTxt.visible = missesTxt.visible = accuracyTxt.visible = false;
	add(godot);

	songtx = new FlxText(0, 10, 0, "" + PlayState.SONG.meta.displayName + " • " + "[" + PlayState.difficulty + "]");
	songtx.setFormat(Paths.font("vcr.ttf"), 17, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2.2);
	songtx.camera = camHUD;
	songtx.borderSize = 1.5;
	songtx.screenCenter(FlxAxes.X);
	add(songtx);
}

function postUpdate(){
        godot.text = "Score:" + songScore + " • Misses:" + misses + " • Accuracy:" + FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2) + "% " + "(" + curRating.rating + ")";
}

var ratingGroup:FlxTypedGroup<FlxSprite>;
var ratingThing:Array<Int> = [];
var hits = 0;
var ratingX = 0;
var ratingY = 0;

function onPlayerHit(event) {
   if (!event.note.isSustainNote) {
      hits++;
      spawnRating(event);
   }
}

function spawnRating(event) {
   var rating:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image("game/score/" + event.rating));
   rating.screenCenter(FlxAxes.X);
   rating.screenCenter(FlxAxes.Y);
   rating.cameras = [camHUD];
   rating.scale.set(0.7, 0.7);
   ratingGroup.add(rating);
   ratingThing.push(hits);

   FlxTween.tween(rating, {"scale.x": 0.6, "scale.y": 0.6}, 0.25, {ease: FlxEase.circOut, onComplete: function(tween:FlxTween) {
       FlxTween.tween(rating, {alpha: 0}, 0.5, {ease: FlxEase.linear, onComplete: function(tween:FlxTween) {
           rating.kill();
       }});
   }});
}