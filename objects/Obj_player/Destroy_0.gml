if(instance_exists(Obj_server)) {
	//for (var s = 0; s < ds_list_size(global.socketsList); s++) {
	//	SendSlaveEnteties(ds_list_find_value(global.socketsList, s), CMD_DESTROY, id, 0, 0);	
	//}
	
	ds_list_destroy(listofBombs);
	AddEntityToDelta(CMD_DESTROY, id)
}
