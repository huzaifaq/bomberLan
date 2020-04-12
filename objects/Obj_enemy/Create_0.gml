/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_server)) {
	name = "Enemy"
	AddEntityToDelta(CMD_CREATE,id);
	path_start(path0,3,path_action_continue,true);
} else {
	instance_destroy();
}
