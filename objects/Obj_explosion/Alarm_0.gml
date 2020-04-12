/// @description Spawn Explosions in other directions if needed 

if(expSize > 0) {
	expSize = expSize - 1;
	if (expDirection & UP) {
		var expUp = instance_create_layer(x+gridSize, y,"Bombs", Obj_explosion);
		expUp.expDirection = UP;
		expUp.expSize = expSize;
		expUp.bombOwnerId = bombOwnerId;
		expUp.alarm[1] = alarm[1] - 2;
	}

	if (expDirection & DOWN) {
		var expDown = instance_create_layer(x-gridSize, y,"Bombs", Obj_explosion);
		expDown.expDirection = DOWN;
		expDown.expSize = expSize;
		expDown.bombOwnerId = bombOwnerId;
		expDown.alarm[1] = alarm[1] - 2;
	}

	if (expDirection & LEFT) {
		var expLeft = instance_create_layer(x, y+gridSize,"Bombs", Obj_explosion);
		expLeft.expDirection = LEFT;
		expLeft.expSize = expSize;
		expLeft.bombOwnerId = bombOwnerId;
		expLeft.alarm[1] = alarm[1] - 2;
	}

	if (expDirection & RIGHT) {
		var expRight = instance_create_layer(x, y-gridSize,"Bombs", Obj_explosion);
		expRight.expDirection = RIGHT;
		expRight.expSize = expSize;
		expRight.bombOwnerId = bombOwnerId;
		expRight.alarm[1] = alarm[1] - 2;
	}
}
