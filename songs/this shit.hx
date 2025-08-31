import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import Date;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.shaders.FunkinShader;
import openfl.filters.ShaderFilter;


var hue:Int = 0;
var sat:Int = 0;
var bri:Int = 0;
var fakeCamHUD:HudCamera = new HudCamera();

function create(){

	kys = new FlxCamera(0, -280, 1280, 1280);
	kys.bgColor = 0x00000000;
	FlxG.cameras.add(kys, false);

	shader2 = new FunkinShader(Assets.getText(Paths.fragShader("fish")));
	// Set Shader
	kys.setFilters([new ShaderFilter(shader2)]);
	kys._filters.push(new ShaderFilter(shader2));
	kys.zoom = 0.8;
	// dn.alpha = 0.5;
	shader2.distortionScale = 0.7;

}


function postCreate(){
	        fakeCamHUD.bgColor = 0x00000000; // for ratings & sustains
	        FlxG.cameras.add(fakeCamHUD, false);
    		dev = new FlxText(-200, (FlxG.height * 1.02) + (downscroll ? -46 : 36), 800, "[DEV BUILD DO NOT DISTRIBIUTE]", 22);
			dev.setFormat(Paths.font("vcr.ttf"), 22, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			dev.scrollFactor.set();
			dev.cameras = [fakeCamHUD];
			add(dev);


	bg = new FlxBackdrop(Paths.image('bluescreen/bluescreen'));
	bg.scrollFactor.set(0.7, 0.7);
	bg.y = -400;
    bg.cameras = [camGame];
    bg.scale.set(0.9,0.9);
    bg.velocity.set(-1000, 1000);
    bg.alpha = 0;
    insert(3, bg);

}

var distortScale:Float = 0.7;
var curDistortScale:Float = 1;
var skipTime = 0; // this is in ms :/
var time:Float = 1;
var robbing:Bool = false;
function postUpdate(elapsed) {


	shader2.distortionScale = curDistortScale;

    curDistortScale = FlxMath.lerp(curDistortScale, distortScale, 0.05 * 60 * elapsed);

    // hudTxt.text = accuracyTxt.text + "\n" + missesTxt.text + "\n" + scoreTxt.text;
    // accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = false;
    
    time += elapsed;
}