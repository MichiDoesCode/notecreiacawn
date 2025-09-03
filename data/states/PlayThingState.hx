//a
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import funkin.editors.ui.UIState;
import Sys;

final options = ['Play', 'Options', 'Exit'];
var menuItems:FlxTypedGroup<FlxText>;
var curSelected = 0;
var selectedSomething = false;

function create() {
	window.title = "what the hecky is this";
}

function postCreate(){
//	  tabmenu = new FlxText(10, 690, 0, '[TAB] AND YOU GO TO THE MOD SELECT', 15);
//    add(tabmenu);

	menuItemHeader = new FlxText(0, 0, 0, '', 20);
	menuItemHeader.x = FlxG.width - menuItemHeader.width;
	add(menuItemHeader);

	var menuItemFooter = new FlxText(menuItemHeader.x += -700, menuItemHeader.height * (options.length + 5), 0, '', 20);
	add(menuItemFooter);

    menuItems = new FlxTypedGroup();
	add(menuItems);

	for (i => label in options) {
		var item = new FlxText(menuItemHeader.x, menuItemHeader.height * (i + 1), 0, label.toUpperCase(), 20);
		item.y = (50 * i) + 330;
		menuItems.add(item);
	}

	changeItem(0);
}


function postUpdate() if (FlxG.keys.justPressed.P) FlxG.switchState(new UIState(true, "PasswordState"));

function update(){
	if (!selectedSomething) {
    	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
        }
		else if (controls.ACCEPT) {
			var choose:String = options[curSelected];
			switch (choose) {
                case 'Play':
					PlayState.loadWeek({
						name: "reset",
						id: "reseter", // idk what this is i would use the week name lol
						sprite: null,
						chars: [null, null, null],
						songs: [{name: 'new-adventure', hide: false}],
						difficulties: ['hard']
						}, "hard");
					FlxG.switchState(new PlayState());
					FlxG.sound.music.stop();
					return;
                case 'Options':
					FlxG.switchState(new OptionsMenu((_) -> FlxG.switchState(new ModState("PlayThingState"))));
                case 'Exit':
                    Sys.exit();
            }

        }

        if (controls.UP_P)
        changeItem(-1);
		if (controls.DOWN_P)
		changeItem(1);
    }
}

function changeItem(wuh:Int = 0) {
	if (wuh != 0)
		CoolUtil.playMenuSFX(0, 0.7);

	curSelected = FlxMath.wrap(curSelected + wuh, 0, options.length - 1);
	menuItems.forEach(item -> item.color = 0x808080);
	menuItems.members[curSelected].color = 0xFFFFFF;
}