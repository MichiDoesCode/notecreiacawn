function onNoteCreation(e) {
        e.noteSprite = "notes/TFITNOTE_assets";
}

function onStrumCreation(e) {
        e.sprite = "notes/TFITNOTE_assets";
	e.cancelAnimation();
}
