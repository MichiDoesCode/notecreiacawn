//a

import flixel.addons.display.FlxGridOverlay;

import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;

import flixel.util.FlxAxes;

import openfl.display.BitmapData;

function create() {
    CoolUtil.playMenuSong(true);

    init_bg();
    init_top();
}

//region Init BG

var bg_shader:CustomShader = new CustomShader("title");
bg_shader.iTime = FlxG.random.int(0, 100);
bg_shader.color1 = color_to_vec3(0xFF42bfe1);
bg_shader.color2 = color_to_vec3(0xFF3490a3);

bg_shader.color3 = color_to_vec3(0xFF1de24b);
bg_shader.color4 = color_to_vec3(0xFF42954f);
// bg_shader.triangleCount = 15;
function init_bg() {
    var bg = new FlxSprite().makeGraphic(FlxG.width + 5, FlxG.height + 5, 0xFF000000);
    bg.scrollFactor.set();
    bg.shader = bg_shader;
    add(bg);
}

//endregion

//region Init Top Layer

var start_velocity:Float = 50;
var start_text_backdrop:FlxBackdrop;

var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/title/logo"));

var splash_texts:Array<String> = CoolUtil.coolTextFile(Paths.txt("splash"));
function init_top() {

    add(logo);
    logo.antialiasing = Options.antialiasing;
    logo.setGraphicSize(Std.int(logo.width * 0.185));
    logo.updateHitbox();
    logo.screenCenter();
    logo.y = 125;
    sprite_backdrop(logo, FlxPoint.get(12, 18));

    var splash_text = new FlxText(0, 0, logo.width * 0.5, FlxG.random.getObject(splash_texts));
    splash_text.antialiasing = Options.antialiasing;
    splash_text.setFormat(Paths.font("vcr.ttf"), 25, FlxColor.YELLOW, "center");
    splash_text.angle = -8;
    splash_text.updateHitbox();
    splash_text.setPosition(logo.x + (logo.width - splash_text.width) + 45, logo.y + (logo.height - splash_text.height) + 5);
    add(splash_text);
    sprite_backdrop(splash_text, FlxPoint.get(3, 3));

    var white_spaces = 3;
    var text = "PRESS START TO BEGIN";
    for (i in 0...(white_spaces*2)+1) text += (i == white_spaces) ? "-" : " ";

    var start_text = new FlxText(0, 0, 0, text);
    start_text.antialiasing = Options.antialiasing;
    start_text.setFormat(Paths.font("vcr.ttf"), 38, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    start_text.borderSize = 2;
    start_text.updateHitbox();

    var start_bg = new FlxSprite().makeSolid(FlxG.width, start_text.height, 0x64000000);
    start_bg.onDraw = (spr) -> {
        spr.y = start_text_backdrop.y;
        spr.draw();
    }
    add(start_bg);

    add(start_text_backdrop = new FlxBackdrop(start_text.pixels, FlxAxes.X));
    start_text_backdrop.antialiasing = start_text.antialiasing;
    start_text_backdrop.velocity.x = start_velocity;
    start_text_backdrop.screenCenter();
    start_text_backdrop.y = FlxG.height - start_text.height - 125;
}
//endregion

var time = FlxG.random.int(0, 1500 * 1000) * FlxG.random.sign();
function update(elapsed:Float) {
    bg_shader.iTime += elapsed;
    // bg_shader.triangleCount = 15 + Math.sin(((Conductor.songPosition + time) * 0.001) * 0.65) * 2.5;

    if (controls.ACCEPT) start();
}

function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0) {
        if (!entering) {
            FlxTween.cancelTweensOf(start_text_backdrop);
            start_text_backdrop.velocity.x *= 6;
            FlxTween.tween(start_text_backdrop.velocity, {x: start_velocity}, Conductor.crochet * 0.001, {ease: FlxEase.cubicOut});
        }

        FlxTween.cancelTweensOf(logo);
        var original_scale = logo.scale.x;
        logo.scale.x *= 1.05;
        logo.scale.y *= 1.05;
        FlxTween.tween(logo.scale, {x: original_scale, y: original_scale}, Conductor.crochet * 0.001, {ease: FlxEase.circOut});
    }

}

var entering = false;
function start() {
    if (entering) return;
    entering = true;

    var oneBeat = Conductor.crochet * 0.001;
    FlxTween.cancelTweensOf(start_text_backdrop);
    FlxTween.tween(start_text_backdrop, {y: FlxG.height + start_text_backdrop.height + 15}, oneBeat * 2, {ease: FlxEase.quadIn});
    FlxTween.tween(start_text_backdrop.velocity, {x: 0}, oneBeat * 2, {ease: FlxEase.quadIn});

    new FlxTimer().start(oneBeat * 4, () -> {
        FlxG.switchState(new MainMenuState());
    });
}