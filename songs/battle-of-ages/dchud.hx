// code from MichiDoesCode (goated coder), adjusted by JoemFunni :3
import funkin.game.PlayState.ComboRating;
import haxe.ds.ObjectMap;

public var useCNERating = false;

function postCreate(){
    comboGroup.setPosition(1070, 550);
    var i = 1;
	var phant = Paths.font("PhantomMuff.ttf");
    for (e in [accuracyTxt, scoreTxt, missesTxt]){
        e.size = 18;
		e.font = phant;
        e.x = 746;
        e.y = (i * 32) + FlxG.height - 128 - 10;
        e.alignment = "right";
        i++;
		}
}

function postUpdate(){
if (Options.downscroll){
    iconP2.y = 570;
    iconP1.y = 570;
}
    iconP2.x = 255;
    iconP1.x = 875;
	iconP2.y = 595;
    iconP1.y = 595;
    iconP1.scale.set(0.8, 0.8);
    iconP2.scale.set(0.8, 0.8);
    healthBar.scale.y = 2;
    healthBarBG.scale.y = 1.5;
	healthBar.y = 667;
    healthBarBG.y = 663;
    doIconBop = false;
	
	comboGroup.cameras = [camHUD];
    add(comboGroup);
}

function create() {
	if (!useCNERating) {
		comboRatings = [
			new ComboRating(0, "D", 0xBD6208),
			new ComboRating(0.7, "C", 0xE66AE4),
			new ComboRating(0.8, "B", 0x68F273),
			new ComboRating(0.9, "A", 0x67EBE7),
			new ComboRating(0.99, "S", 0xB487FF)
		];
	}
}

function onNoteHit(event)
    event.ratingScale = 0.5;

function onRatingUpdate(e) {
	if (!useCNERating && e.rating?.percent == 1 && e.rating.color != (e.rating.color = perfect ? 0xFFFFFF65 : 0xFFFFB6FF) && e.oldRating == e.rating) {
		accuracyTxt.text = "";
		if (updateRatingStuff != null) updateRatingStuff();
		// setting _regen doesnt work?
	}
}