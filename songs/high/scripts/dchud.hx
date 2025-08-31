function postCreate(){
    if  (Options.downscroll){
    missesTxt.y =  650;
    accuracyTxt.y =  620;
    }
    scoreTxt.x = -370;
    missesTxt.x = -150;
    accuracyTxt.x =  62;
    missesTxt.y = 650;
    scoreTxt.y = 620;
}

function postUpdate(){
if (Options.downscroll){
    iconP2.y = 570;
    iconP1.y = 570;
}
    iconP2.x = 260;
    iconP1.x = 840;
    iconP1.scale.set(0.8, 0.8);
    iconP2.scale.set(0.8, 0.8);
    healthBar.scale.y = 2;
    healthBarBG.scale.y = 1.5;
    doIconBop = false;
}