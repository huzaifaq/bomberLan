/// @description Finger of Death for Maskar
if(!instance_exists(Ult)) {

	Ult = instance_create_layer(x, y,"Ult", Obj_laser);
	Ult.ownerId = id;
	Ult.directionFacing = directionFacing;

	if(directionFacing & UP) {
		Ult.direction = point_direction(x, y, x+gridSize, y);
	} else if(directionFacing & DOWN) {
		Ult.direction = point_direction(x, y, x-gridSize, y);
	} else if(directionFacing & LEFT) {
		Ult.direction = point_direction(x, y, x, y+gridSize);
	} else if(directionFacing & RIGHT) {
		Ult.direction = point_direction(x, y, x, y-gridSize);
	}
	
}