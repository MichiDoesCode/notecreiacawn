var painthud:FlxSprite;
var paintCamHUD:HudCamera = new HudCamera();
var bar:FlxSprite;

function postCreate(){
    paintCamHUD.bgColor = 0x00000000; // for ratings & sustains
    FlxG.cameras.add(paintCamHUD, false);
    ythud = new FlxSprite(-41, -23);
	ythud.loadGraphic(Paths.image("stepup/paint"));
    ythud.cameras = [paintCamHUD];
    //ythud.screenCenter();
	ythud.scale.set(0.94, 0.94);
	insert(20, ythud);

    bar = new FlxSprite(-350, 300);
    bar.loadGraphic(Paths.image("Healthbar"));
    bar.scale.set(0.7,0.7);
    insert(13, bar);
    bar.cameras = [camHUD];

    healthBar.scale.x = 0.69;
    healthBar.scale.y = 1.7;

}

function postUpdate(){
    camHUD.zoom = 0.73;
    camHUD.y = 35;
    camGame.zoom = 0.8;
healthBarBG.visible = false;
    healthBar.x = healthBarBG.x = -147;
    healthBar.y = 615;
    iconP1.x = 350;
    iconP2.x = -190;
    iconP1.y = 535;
    iconP2.y = 535;
 if (Options.downscroll){
        iconP1.y = 525;
        iconP2.y = 525;
        bar.y = 360;
        healthBar.y = 589.5;
 }
}

function onNoteCreation(e) {
        e.noteSprite = "notes/sanicNote";
}

function onStrumCreation(e) {
        e.sprite = "notes/sanicNote";
	e.cancelAnimation();
}