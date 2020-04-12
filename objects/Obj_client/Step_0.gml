#macro UP 1
#macro DOWN 2
#macro LEFT 4
#macro RIGHT 8

#macro BOMB 16
#macro ULT 32

keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));

keyDropbomb = keyboard_check(vk_space);
keyUlt = keyboard_check(vk_lshift);

keyOpenInGameMenu = keyboard_check_pressed(vk_escape);

var keyMap = 0;

//Movement Keys
if(keyUp and !keyDown)
	keyMap = keyMap | UP;

if(keyDown and !keyUp)
	keyMap = keyMap | DOWN;

if(keyLeft and !keyRight)
	keyMap = keyMap | LEFT;

if(keyRight and !keyLeft)
	keyMap = keyMap | RIGHT;
	
//Other abilities
if(keyDropbomb)
	keyMap = keyMap | BOMB;

if(keyUlt)
	keyMap = keyMap | ULT;
	
if(keyOpenInGameMenu) {
	if(!global.isInGameMenuOpen) {
		layer_background_visible(layer_background_get_id("InGameMenuBackground"), true);
		inGameMenu = instance_create_layer(0,0,"InGameMenu",Obj_inGameMenu);
		global.isInGameMenuOpen = true;
		SendKey(0);
	} else {
		layer_background_visible(layer_background_get_id("InGameMenuBackground"), false);
		if(instance_exists(inGameMenu)) {
			instance_destroy(inGameMenu);
		}
		global.isInGameMenuOpen = false;
	}
}
	
//If keys pressed have not changed dont send data to server
if((keyMap != prev_keyMap) & !global.isInGameMenuOpen & isConnected) {
	SendKey(keyMap);
	prev_keyMap = keyMap;
}


