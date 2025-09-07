import flixel.addons.display.FlxBackdrop;
import funkin.backend.shaders.FunkinShader;
import openfl.filters.ShaderFilter;

function create(){
}

function postCreate(){
	bg = new FlxBackdrop(Paths.image('sonistage/stars'));
	bg.scrollFactor.set(1, 0);
	bg.y = -400;
    bg.cameras = [camGame];
    bg.scale.set(1.7,1.7);
    bg.velocity.set(0, 0);
    bg.alpha = 1;
    insert(2, bg);

    island = new FlxSprite(-761.324827416872, -46.5688922691679);
    island.loadGraphic(Paths.image("sonistage/island2"));
    island.scale.set(2,2);
    island.cameras = [camGame];
    insert(3, island);

	bg2 = new FlxBackdrop(Paths.image('sonistage/moving-effect'));
	bg2.scrollFactor.set(0.2, 0);
	bg2.y = -400;
    bg2.cameras = [camGame];
    bg2.scale.set(1.7,1.7);
    bg2.velocity.set(0, 3000);
    bg2.alpha = 0;
    insert(2, bg2);


}

function onSongStart(){
    tweenLoopAngle(boyfriend, -2.1, 2.1, 3, 3);
    tweenLoopAngle(dad, -2.1, 2.1, 3, 3);
    tweenLoopAngle(island, -1.1, 0.1, 3, 3);
}

var velocityShitHehe:Int = 1;

//comes from an old open source pibby apocalypse cne port, will work for now.
function tweenLoopAngle(varx, distance1, distance2, duration1, duration2) {
    FlxTween.tween(varx, {angle: distance1}, duration1 / velocityShitHehe, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function (twn:FlxTween)
            {
                FlxTween.tween(varx, {angle: distance2}, duration2 / velocityShitHehe, {
                    ease: FlxEase.sineInOut,
                    onComplete: 
                    function (twn:FlxTween)
                        {
                            tweenLoopAngle(varx, distance1, distance2, duration1, duration2);
                        }
                });
            }
    });
}