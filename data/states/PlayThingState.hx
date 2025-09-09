import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.editors.ui.UIState;
import Sys;

final options = ['Play', 'Options', 'Exit'];
var menuItems:FlxTypedGroup<FlxText>;
var curSelected:Int = 0;
var selectedSomething:Bool = false;

function create() {
	add(menuItemHeader = new FlxText(0, 0, 0, '', 20));
	menuItemHeader.x = FlxG.width - menuItemHeader.width;

	add(menuItemFooter = new FlxText(menuItemHeader.x += -700, menuItemHeader.height * (options.length + 5), 0, '', 20));

    add(menuItems = new FlxTypedGroup());
	for (i => label in options) {
		var item = new FlxText(menuItemHeader.x, menuItemHeader.height * (i + 1), 0, label.toUpperCase(), 20);
		item.y = (50 * i) + 330;
		menuItems.add(item);
	}

	changeItem(0);
}

function postUpdate() if (FlxG.keys.justPressed.P) FlxG.switchState(new UIState(true, "PasswordState"));

function update(){
	if (controls.SWITCHMOD || controls.DEV_ACCESS) {
		persistentUpdate = false;
		persistentDraw = true;
		openSubState(controls.SWITCHMOD ? new ModSwitchMenu() : new EditorPicker());
	}

	if (!selectedSomething) {
		if (controls.ACCEPT) {
			selectedSomething = true;
			if (options[curSelected] == 'Play') {
				FlxTween.tween(FlxG.sound.music, {volume: 0}, 1);
				FlxG.camera.fade(FlxColor.BLACK, 1, false, function() {
					FlxTween.tween(AspectUtil, {width: 960}, 2, {ease: FlxEase.cubeInOut, onComplete: ()-> { loadState(options[curSelected]); }});
				});
			} else {
				loadState(options[curSelected]);
			}
        }

        if (controls.UP_P) changeItem(-1);
		if (controls.DOWN_P) changeItem(1);
    }
}

function changeItem(wuh:Int = 0) {
	curSelected = FlxMath.wrap(curSelected + wuh, 0, options.length - 1);
	if (wuh != null) CoolUtil.playMenuSFX(0);
	
	menuItems.forEach(item -> item.color = 0x808080);
	menuItems.members[curSelected].color = 0xFFFFFF;
}

function loadState(choose) {
	switch (choose) {
		case 'Play':
			FlxG.sound.music.stop();
			PlayState.isStoryMode = true;
			PlayState.loadWeek({
				name: "reset",
				id: 0,
				sprite: null,
				chars: [null, null, null],
				songs: [{name: 'new-adventure', hide: false}],
				difficulties: ['hard']
			}, "hard");
			FlxG.switchState(new PlayState());
		case 'Options': FlxG.switchState(new OptionsMenu((_) -> FlxG.switchState(new ModState("PlayThingState"))));
		case 'Exit': Sys.exit(0);
	}
}