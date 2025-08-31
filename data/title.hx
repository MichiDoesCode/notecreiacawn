var logo:FlxSprite = null;



function create(){
	window.title = windowTitle + 'Here Once More';
	var logo = new FlxSprite(0,-100).loadGraphic(Paths.image('titlehog'));
}


function update(elapsed:Float) {

	if (controls.ACCEPT) {
		FlxG.switchState(new ("FreeplayState"));
	}
}
