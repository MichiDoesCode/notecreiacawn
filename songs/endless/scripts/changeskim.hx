function stepHit(curStep:Int){
    if(curStep == 904) {
            for(a in strumLines){
                for(b in a){
                    updateStrumSkin(b, "notes/bluenotes", b.ID);
                    b.y = a.startingPos.y;
                }
                for(c in a.notes)
                    updateNoteSkin(c, "notes/bluenotes");
            }
    }
}

function updateStrumSkin(theFucking:Strum, newSkin:String, id:Int) {
    theFucking.frames = Paths.getSparrowAtlas(newSkin);

    theFucking.animation.addByPrefix('green', 'arrowUP');
    theFucking.animation.addByPrefix('blue', 'arrowDOWN');
    theFucking.animation.addByPrefix('purple', 'arrowLEFT');
    theFucking.animation.addByPrefix('red', 'arrowRIGHT');

    theFucking.antialiasing = Options.antialiasing;

    theFucking.animation.addByPrefix('static', 'arrow' + ["left", "down", "up", "right"][id].toUpperCase());
    theFucking.animation.addByPrefix('pressed', ["left", "down", "up", "right"][id] + ' press', 24, false);
    theFucking.animation.addByPrefix('confirm', ["left", "down", "up", "right"][id] + ' confirm', 24, false);

    theFucking.animation.play('static');
    theFucking.updateHitbox();

}

function updateNoteSkin(theFucker:Note, newSkin:String){
    var idk = theFucker.animation.name;
    theFucker.frames = Paths.getSparrowAtlas(newSkin);

    theFucker.animation.addByPrefix(idk, switch(idk){
        case 'scroll': ['purple', 'blue', 'green', 'red'][theFucker.strumID % 4] + '0';
        case 'hold': ['purple hold piece', 'blue hold piece', 'green hold piece', 'red hold piece'][theFucker.strumID % 4];
        case 'holdend': ['pruple end hold', 'blue hold end', 'green hold end', 'red hold end'][theFucker.strumID % 4] + '0';
    });

    theFucker.animation.play(idk);
    theFucker.updateHitbox();
}