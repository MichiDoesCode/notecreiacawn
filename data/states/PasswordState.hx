import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UIButton;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import haxe.crypto.Sha256;
import flixel.text.FlxTextBorderStyle as Border;
import flixel.tweens.FlxTweenType;

/*Made and Programmed by HeroEyad, Credit me if this is used
	Otherwise I will get Saul Goodman to sue you!
	that's how you do it and you can setup a background or whatever lol!
	Just make sure to add the password to the json file in the format:
		[{"password": "hashedPassword", "song": "songName", "difficulty": "hard"}] (or any other difficulty)
		And make sure to hash the password using sha256 before adding it to the varaible.
    if you're not sure what to use for Sha256 encoding just go there https://emn178.github.io/online-tools/sha256.html
*/
var source = [
	{password: "99a7026172d42714d0293e5598ec1c8e8260d7d0c4b8582ad002c1883494e216", song: "blue-screen", difficulty: "hard"}, // this is "coolpassword"
	{password: "a595a45d227e801a36e0905ebaacf64940baa22ba3eaed0f4fb18f406a53b603", song: "blue-screen", difficulty: "hard"} // this is "tankman"
];
var inputKey:UITextBox;
function create() {
	add(var bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, -1).screenCenter(0x11));

	var grid = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, FlxColor.fromRGB(64, 64, 64), FlxColor.fromRGB(32, 32, 32)));
	grid.velocity.set(40, 40);
	grid.scrollFactor.set(0, 0);
	add(grid);

	text = new FlxText(0, 150, 1280, "PASSWORD SCRIPT!!!!!!!!!").setFormat(Paths.font("vcr.ttf"), 80, -1, "center",Border.OUTLINE,0xFF000000);
	text.borderSize *= 3;
	add(text);

	inputKey = new UITextBox(850, 30, "", 400, 60);
	inputKey.screenCenter(0x11);
	inputKey.x -= 200;
	add(inputKey);

	var buttonKey = new UIButton(850, 450, "Enter", onButtonKey);
	buttonKey.screenCenter(0x01);
	buttonKey.x -= 60;
	buttonKey.scale.set(3, 3);
	add(buttonKey);
}

function postUpdate() {
	if (FlxG.keys.justPressed.ESCAPE) {
		CoolUtil.playMenuSFX(2);
		FlxG.switchState(new MainMenuState());
	}
}

function onButtonKey() {
	final hash = Sha256.encode(inputKey?.label?.text);
	for (entry in source)
		if (hash == entry.password) {
			CoolUtil.playMenuSFX(1);
			trace('Password correct (' + inputKey.label.text + ')');
			FlxG.camera.flash(-1, 0.4);
			new FlxTimer().start(0.85, () -> {
				PlayState.loadSong(entry.song, entry.difficulty);
				FlxG.switchState(new PlayState());
			});
			return;
		}
	CoolUtil.playMenuSFX(5);
	FlxG.camera.shake(0.01, 0.3);
	trace('Incorrect password (' + inputKey.label.text + ')');
}