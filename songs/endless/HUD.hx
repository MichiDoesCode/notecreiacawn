import flixel.util.FlxStringUtil;

camZoomingStrength = 0;

function create() {
    FlxG.cameras.add(sonicHUD = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    add(scoreLabel = new FlxSprite(40, 40, Paths.image("game/score"))).camera = sonicHUD;
    add(newScoreTxt = new Alphabet(250, 14, "123", "s3numbers")).camera = sonicHUD;

    add(timeLabel = new FlxSprite(40, 100, Paths.image("game/time"))).camera = sonicHUD;
    add(timeTxt = new Alphabet(250, 74, "123", "s3numbers")).camera = sonicHUD;

    add(ringsLabel = new FlxSprite(40, 160, Paths.image("game/rings"))).camera = sonicHUD;
    add(ringsTxt = new Alphabet(250, 134, "123", "s3numbers")).camera = sonicHUD;

    add(lifeLabel = new FlxSprite(40, 0, Paths.image("game/life"))).camera = sonicHUD;
    lifeLabel.y = FlxG.height-lifeLabel.height-30;
}

function postCreate()
    for (e in [scoreTxt, missesTxt, accuracyTxt, iconP1, iconP2, healthBar, healthBarBG])
        e.kill();

function update() {
    newScoreTxt.text = songScore;
    timeTxt.text = FlxStringUtil.formatTime(inst.time/1000);
    ringsTxt.text = combo;
}