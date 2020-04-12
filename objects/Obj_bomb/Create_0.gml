bombTimer = 200;
bombOwnerid = pointer_null;

if(instance_exists(Obj_server)) {
	name = "Bomb Base";
	buffer = buffer_create(24, buffer_grow, 1);
	for (var s = 0; s < ds_list_size(global.socketsList); s++) {
		CreateSlaveEnteties(ds_list_find_value(global.socketsList, s), self);	
	}
	alarm[0] = bombTimer;
} else {
	instance_destroy();	
}