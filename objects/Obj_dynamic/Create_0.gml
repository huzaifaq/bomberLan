if(instance_exists(Obj_server)) {
	name = "Dynamic Base";
	//buffer = buffer_create(48, buffer_grow, 1);
	//for (var s = 0; s < ds_list_size(global.socketsList); s++) {
	//	CreateSlaveEnteties(ds_list_find_value(global.socketsList, s), self);	
	//}
	
	AddEntityToDelta(CMD_CREATE, id);
} else {
	instance_destroy();	
}
