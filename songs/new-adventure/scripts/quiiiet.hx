import openfl.Lib;
import openfl.system.Capabilities;
import lime.graphics.Image;
import flixel.util.FlxStringUtil;
import flixel.text.FlxTextBorderStyle;

function postCreate(){
    FlxG.camera.followLerp = 0;
    iconP1.visible = iconP2.visible = healthBarBG.visible = scoreTxt.visible = accuracyTxt.visible = missesTxt.visible = false;
    healthBar.scale.x = 1.62;
    healthBar.scale.y = 3;
    healthBar.y = 698;

    newScore = new FunkinText(missesTxt, healthBarBG.y + -15, FlxG.width, "SCR: 0   X: 0");
    newScore.setFormat(Paths.font('pixel.otf'), 25, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    newScore.cameras = [camHUD];
    add(newScore);

    blackbox = new FlxSprite().makeGraphic(1000, 120, 0xFF000000);
    blackbox.screenCenter();
    blackbox.alpha = 1;
    blackbox.y = 0;
    blackbox.cameras = [camHUD];
    insert(members.indexOf(healthBar)-5, blackbox);

    blackboxb = new FlxSprite().makeGraphic(1000, 120, 0xFF000000);
    blackboxb.screenCenter();
    blackboxb.alpha = 1;
    blackboxb.y = 620;
    blackboxb.cameras = [camHUD];
    insert(members.indexOf(healthBar)-10, blackboxb);

    // if (Options.downscroll) healthBar.y = 698; this literally does nothing, it's already at 698 at line 12.
}

function postUpdate(){
    newScore.text = "SCR: " + songScore + "   X: " + misses;
}

function destroy() {
    FlxG.game.setFilters([]);
    camGame.bgColor = 0xFF000000;
}

