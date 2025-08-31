import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import funkin.game.PlayState.ComboRating;



var ratingGroup:FlxTypedGroup<FlxSprite>;
var ratingThing:Array<Int> = [];
var hits = 0;
var ratingX = 0;
var ratingY = 0;

function postCreate(){
      comboGroup.visible = false;

  ratingGroup = new FlxTypedGroup();
  add(ratingGroup);

  	notehit = new FlxText(20, -72, 0, "Combo:\n0", 20);
	notehit.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	notehit.scrollFactor.set();
	notehit.borderSize = 2;
	notehit.borderQuality = 2;
	notehit.cameras = [camHUD];
	notehit.screenCenter(FlxAxes.X);
	add(notehit);

}

function onSongStart(){
        FlxTween.tween(notehit, {y: 60}, 0.5, {ease: FlxEase.circOut});
}

function postUpdate(elasped:Float){
	notehit.text = 'Combo:\n000' + combo;
	if (combo > 0) {
  	notehit.text = 'Combo:\n000' + combo;      
    }
	if (combo > 9) {
  	notehit.text = 'Combo:\n00' + combo;      
    }
	if (combo > 99) {
  	notehit.text = 'Combo:\n0' + combo;      
    }
	if (combo > 999) {
  	notehit.text = 'Combo:\n' + combo;      
    }
}

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