var keyMap = argument0;

//Basic movement
if(keyMap & UP) {
	keyUp = true;
} else {
	keyUp = false;
}

if(keyMap & DOWN) {
	keyDown = true;
} else {
	keyDown = false;
}

if(keyMap & LEFT) {
	keyLeft = true;
} else {
	keyLeft = false;
}

if(keyMap & RIGHT) {
	keyRight = true;
} else {
	keyRight = false;
}

//Abilities
if(keyMap & BOMB) {
	keyDropbomb = true;
} else {
	keyDropbomb = false;
}

if(keyMap & ULT) {
	keyUlt = true;
} else { 
	keyUlt = false;
}

