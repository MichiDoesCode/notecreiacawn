import flixel.text.FlxTextBorderStyle;

var timer:FlxTimer = new FlxTimer();
var fadeOut:Bool = false;

function postCreate(){
    FlxG.camera.followLerp = 0;
    for (e in [iconP1, iconP2, scoreTxt, accuracyTxt, missesTxt]) e.kill();
    healthBarBG.visible = false;
    remove(comboGroup, true);

    healthBar.scale.x = 1.62;
    healthBar.scale.y = 3;
    healthBar.y = 698;

    add(newScore = new FunkinText(missesTxt, healthBarBG.y + -15, FlxG.width, "SCR: 0   X: 0"));
    newScore.setFormat(Paths.font('pixel.otf'), 25, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

    blackbox = new FlxSprite().makeGraphic(1000, 120, 0xFF000000);
    blackbox.screenCenter(FlxAxes.X);
    insert(members.indexOf(healthBar)-5, blackbox);

    blackboxb = new FlxSprite().makeGraphic(1000, 120, 0xFF000000);
    blackboxb.screenCenter(FlxAxes.X);
    blackboxb.y = 620;
    insert(members.indexOf(healthBar)-10, blackboxb);

    add(ratingMap = new FlxText(0, 90, FlxG.width).setFormat(Paths.font('impact.ttf'), 50, -1, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK)).borderSize = 3;

    add(comboMap = new FlxText(0, 40, FlxG.width).setFormat(Paths.font('impact.ttf'), 40, -1, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK)).borderSize = 3;
    comboMap.visible = false;

    for (a in [newScore, blackbox, blackboxb, ratingMap, comboMap]) a.camera = camHUD;
}

function postUpdate(){
    newScore.text = "SCR: " + songScore + "   X: " + misses;

    ratingMap.scale.set(lerp(ratingMap.scale.x, 1, 0.25), lerp(ratingMap.scale.y, 1, 0.2));
    for (a in [ratingMap, comboMap]) if (fadeOut) a.alpha = 0;
    comboMap.text = StringTools.lpad(Std.string(combo), '0', 3);
}

function destroy() {
    FlxG.game.setFilters([]);
    camGame.bgColor = 0xFF000000;
}

function onPlayerHit(e) if (!e.note.isSustainNote) rateChange(e.rating);
function onPlayerMiss(e) {
	e.playMissSound = false;
    rateChange('miss');
}

function rateChange(rating:String) {
    ratingMap.text = rating.toUpperCase();
    
    ratingMap.visible = comboMap.visible = !(fadeOut = false);
    ratingMap.alpha = comboMap.alpha = 1;
    ratingMap.scale.set(1.2, 1.2);
    
    if (timer.active) timer.cancel();
    timer.start(1.5, () -> fadeOut = true);
}