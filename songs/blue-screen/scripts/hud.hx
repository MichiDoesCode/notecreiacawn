function postCreate(){
    if (Options.downscroll){
       scoreTxt.y = 615;
    }
        accuracyTxt.alpha = missesTxt.alpha = 0;
        window.title = "DIMENSIONAL CHAOS: BLUE SCREEN ~ WHY IT HAD TO BE YOU.";
        //window.alert("The one who stole my light.", "Oh, it's you");
}

function onNoteHit(e) {
    if (!e.player)
        e.strumGlowCancelled = true;
}

function onGamePause(){
        window.title = "Hope you don't take that long.";
}

function onSubstateClose() {
    window.title = "DIMENSIONAL CHAOS: BLUE SCREEN ~ WHY IT HAD TO BE YOU.";
    for (a in cameras) a.removeShader(bnw);

}


