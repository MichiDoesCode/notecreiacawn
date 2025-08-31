import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;


function postCreate(){
    FlxG.camera.followLerp = 0;

scoreTxt.visible = accuracyTxt.visible = missesTxt.visible = false;

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

TXTA = new FlxText(20, 640, "SCR: 0   X: 0", 15);
TXTA.setFormat(Paths.font('impact.ttf'), 50, FlxColor.WHITE, 'left', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
TXTA.borderSize = 3;
TXTA.cameras = [camHUD];
add(TXTA);


timeTxt = new FlxText(860,640, "",16);
timeTxt.setFormat(Paths.font("impact.ttf"), 50, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
timeTxt.borderSize = 3;
timeTxt.scrollFactor.set();
timeTxt.cameras = [camHUD];
add(timeTxt);

}

function postUpdate(){
    iconP1.scale.set(0.5, 0.5);
    iconP2.scale.set(0.5, 0.5);
    doIconBop = false;
    TXTA.text = "SCORE: " + songScore;
    healthBar.scale.x = 0.2;
    healthBarBG.scale.x = 0.2;
    healthBar.y = 60;
    healthBarBG.y = 56;
    iconP1.y = -27;
    iconP1.x = 470;
    iconP2.y = -21;
    iconP2.x = 310;
    if (Options.downscroll){
    healthBar.y = 60;
    healthBarBG.y = 57;
    iconP1.y = -12;
    iconP1.x = 470;
    TXTA.y = 640;
    timeTxt.y = 640;
    iconP2.y = -20;
    iconP2.x = 310;
    }
  timeTxt.text = Math.floor((inst.length-inst.time)/1000);
}


function create() {
    FlxG.scaleMode.width = 960;
    FlxG.scaleMode.height = 720;
    FlxG.resizeWindow(960, 720);
    FlxG.widescreen = false;
    window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;
}

function destroy() {
    FlxG.game.setFilters([]);
    camGame.bgColor = 0xFF000000;
    FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 720;
    FlxG.resizeWindow(1280, 720);
    window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;
}

function onStrumCreation(e)
{
	e.cancelAnimation();
	e.strum.x -= (5 / 32) * strumLines.members[e.player].startingPos.x + 65;
}