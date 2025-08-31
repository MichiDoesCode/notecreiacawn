import funkin.backend.utils.CoolUtil;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.utils.FlxAxes;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;
import funkin.backend.utils.WindowUtils;
import funkin.backend.MusicBeatState;


var dclogo:FlxSprite;
var dcCamera:FlxCamera;

function postCreate(){

    dcCamera = new FlxCamera();
    dcCamera.bgColor = FlxColor.TRANSPARENT;
    originalZoom = dcCamera.zoom;
    FlxG.cameras.add(dcCamera);

    var backgroundGrid = new FlxBackdrop(FlxGridOverlay.createGrid(50, 50, 100, 100, true, FlxColor.BLACK, background.color));
    backgroundGrid.velocity.set(20, 20);
    backgroundGrid.alpha = 0.5;
    backgroundGrid.cameras = [menuCamera];
    add(backgroundGrid);

    pressEnterToStart = new FlxText(0, 0, 0, "Press Enter to Play", 38, true);
    pressEnterToStart.alignment = FlxTextAlign.CENTER;
    pressEnterToStart.screenCenter(FlxAxes.XY);
    pressEnterToStart.y += 320;
    pressEnterToStart.font = Paths.font("vcr.ttf");
    pressEnterToStart.cameras = [menuCamera];
    pressEnterToStart.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3, 1);
    add(pressEnterToStart);

}