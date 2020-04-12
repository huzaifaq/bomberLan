name = "Player"

directionFacing = UP;

hdir = 0;
vdir = 0;
actualSpeed = 0;
diagspd = round(spd * (sqrt(2) / 2));

keyUp = false;
keyDown = false;
keyLeft = false;
keyRight = false;

keyDropbomb = false;
keyUlt = false;
Ult = noone;

listofBombs = ds_list_create();
bombPlayerIsOn = noone;

explosionHitPlayer = noone;
wasKilledBy = noone;

//buffer = buffer_create(1024, buffer_grow, 1);
// hello
AddEntityToDelta(CMD_CREATE,id);