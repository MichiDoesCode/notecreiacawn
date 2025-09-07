//
import openfl.Lib;
import openfl.system.Capabilities;
import lime.graphics.Image;
import funkin.backend.utils.WindowUtils;

import openfl.geom.ColorTransform;

//region AspectUtil

class AspectUtil {
    static var _instance:AspectUtil;
    public function new() {
        if (_instance != null) return null;
        AspectUtil._instance = this;
    }

    public var width(default, set):Float = 1280;
    public var height(default, set):Float = 720;

    function set_width(value:Float):Float {
        FlxG.initialWidth = value;
        FlxG.resizeWindow(value, height);
        Lib.application.window.x = Std.int((Capabilities.screenResolutionX * 0.5) - (Lib.application.window.width * 0.5));
        return value;
    }

    function set_height(value:Float):Float {
        FlxG.initialHeight = value;
        FlxG.resizeWindow(width, value);
        Lib.application.window.y = Std.int((Capabilities.screenResolutionY * 0.5) - (Lib.application.window.height * 0.5));
        return value;
    }

    public function reset() {
        width = 1280;
        height = 720;
    }
}
static var AspectUtil = new AspectUtil();

//endregion

//region Custom Utility

static function sprite_backdrop(spr:FlxSprite, ?distance:FlxPoint, ?color:FlxColor = FlxColor.BLACK) {
    color ??= FlxColor.BLACK;
    distance ??= FlxPoint.get(10, 10);

    var prevOnDraw = spr.onDraw ?? (spr) -> spr.draw();
    spr.onDraw = (spr) -> {
        var prevTransform = spr.colorTransform;

        spr.colorTransform = new ColorTransform();
        spr.colorTransform.color = color;
        spr.x += distance.x;
        spr.y += distance.y;

        spr.draw();
        
        spr.x -= distance.x;
        spr.y -= distance.y;
        spr.colorTransform = prevTransform;

        prevOnDraw(spr);
    }

}

static function color_to_vec3(color:FlxColor):Array<Float> {
    // var a:Float = ((color >> 24) & 0xFF) / 255;
    var r:Float = ((color >> 16) & 0xFF) / 255;
    var g:Float = ((color >> 8)  & 0xFF) / 255;
    var b:Float = (color         & 0xFF) / 255;

    return [r, g, b];
}

//endregion

function destroy() {
    // title
    window.title = "Friday Night Funkin' - Codename Engine"; // LJ | Don't know why you need this here but alright

    // resize
    AspectUtil.reset();
}
