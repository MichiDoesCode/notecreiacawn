var ythud:FlxSprite;
var fakeCamHUD:HudCamera = new HudCamera();


function postCreate(){
    fakeCamHUD.bgColor = 0x00000000; // for ratings & sustains
    FlxG.cameras.add(fakeCamHUD, false);
    ythud = new FlxSprite(-150, -77);
	ythud.loadGraphic(Paths.image("sexoentrefurros/yt"));
    ythud.cameras = [fakeCamHUD];
    //ythud.screenCenter();
	ythud.scale.set(0.825, 0.825);
	insert(20, ythud);

    healthBar.alpha = 0;
    healthBarBG.alpha = 0;
    iconP1.alpha = 0;
    iconP2.alpha = 0;
}

function onNoteCreation(e) {
        e.noteSprite = "notes/tailsnotes";
}

function onStrumCreation(e) {
        e.sprite = "notes/tailsnotes";
	e.cancelAnimation();
}
