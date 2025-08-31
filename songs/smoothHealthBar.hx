// Coded by @NebulaStellaNova on Discord.
var prevHealthPerc;
function update() {
    prevHealthPerc = healthBar.percent;
}
function postUpdate() {
    healthBar.unbounded = true;
    healthBar.percent = CoolUtil.fpsLerp(prevHealthPerc, (health/healthBar.max) * 100, 0.1);
}