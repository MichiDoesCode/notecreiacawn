if (PlayState.instance.curSong != "new-adventure") destroyScript();

import openfl.system.Capabilities;

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