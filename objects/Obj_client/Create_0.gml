isConnected = false;

entities = ds_map_create();
prev_keyMap = 0;

global.isInGameMenuOpen = false;
inGameMenu = pointer_null;

alarm[0] = 10; // Delay connecting to host