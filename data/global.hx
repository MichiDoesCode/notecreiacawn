//
import openfl.Lib;
import openfl.system.Capabilities;
import lime.graphics.Image
import funkin.backend.utils.WindowUtils;
function new() {
	//FlxG.scaleMode = new PixelPerfectScaleMode();
	WindowUtils.winTitle = "TEST BUILD";
}

function update(elapsed:Float){
	if (FlxG.keys.justPressed.F5) FlxG.resetState();
}

function resize(w, h){
    // initialSize
    FlxG.initialWidth = w;
    FlxG.initialHeight = h;
    // resizeWindow
    FlxG.resizeWindow(w, h);
    // application
    Lib.application.window.x = Std.int((Capabilities.screenResolutionX / 2) - (Lib.application.window.width / 2));
    Lib.application.window.y = Std.int((Capabilities.screenResolutionY / 2) - (Lib.application.window.height / 2));
}
function destroy(){
    // title
    window.title = "Friday Night Funkin' - Codename Engine";
    // resize
    resize(1280, 720);
}
// resize
resize(960, 720);
