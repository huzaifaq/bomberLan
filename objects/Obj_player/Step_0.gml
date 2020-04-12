//Grid Movement

var del_x = 0;
var del_y = 0;

hdir = keyRight - keyLeft;
vdir = keyDown - keyUp;

if (hdir != 0) and (vdir !=0) {
	actualSpeed = diagspd;
} else {
	actualSpeed = spd;
}
	
del_x = hdir * actualSpeed;
del_y = vdir * actualSpeed;

//If player is not standing on a bomb
if(bombPlayerIsOn == noone) {
	
	if(place_meeting(x + del_x, y, Obj_col))
		while(del_x != 0) {
			if(!place_meeting(x + del_x, y, Obj_col))
				break;
			else del_x += -hdir;	
		}
	
	if(place_meeting(x + del_x, y + del_y, Obj_col))
		while(del_y != 0) {
			if(!place_meeting(x + del_x, y + del_y, Obj_col))
				break;
			else del_y += -vdir;
		}
		
// Ignore bomb collision until player walks of it (Player has no colide with only the bomb he just placed
} else {
	
	if(hdir != 0)
		if(place_meeting_ingoring(x + del_x, y, Obj_col, bombPlayerIsOn))
			while(del_x != 0) {
				if(!place_meeting_ingoring(x + del_x, y, Obj_col, bombPlayerIsOn))
					break;
				else del_x += -hdir;	
			}
	
	if(vdir != 0)
		if(place_meeting_ingoring(x + del_x, y + del_y, Obj_col, bombPlayerIsOn))
			while(del_y != 0) {
				if(!place_meeting_ingoring(x + del_x, y + del_y, Obj_col, bombPlayerIsOn))
					break;
				else del_y += -vdir;
			}
			
	if (!place_meeting(x,y,Obj_bomb)) {  // If bomb explodes or player walks off the bomb re-enable collision
		bombPlayerIsOn = noone;
	}
}

//Commit movement
x += del_x;
y += del_y;

//Send new location to other clients
//for (var s = 0; s < ds_list_size(global.socketsList); s++) {
//	SendSlaveEnteties(ds_list_find_value(global.socketsList, s), CMD_XY, id, x, y);
//}

//Add new location to delta and sync buffer
AddEntityToDelta(CMD_XY, id);

//Save Direction
if(vdir > 0)
	directionFacing = DOWN;
else if(vdir < 0)
	directionFacing = UP;

if(hdir > 0)
	directionFacing = RIGHT;
else if(hdir < 0)
	directionFacing = LEFT;


//Drop Bomb
if keyDropbomb {
	if(ds_list_size(listofBombs) < numberBombs) {
		
		var x_B = x;
		var y_B = y;
		
		if(gridBombs) {
			
			var x_L = x - x%gridSize; 
			var y_U = y - y%gridSize;
		
			var x_R = x_L + gridSize; 
			var y_D = y_U + gridSize;
		
			if(abs(x_R-x) > abs(x_L-x))
				x_B = x_L;
			else
				x_B = x_R;
		
			if(abs(y_U-y) > abs(y_D-y))
				y_B = y_D;
			else
				y_B = y_U;
				
				
			
		}
		
		var b = instance_create_layer(x_B, y_B, "Bombs", Obj_bomb);
		
		
		b.bombOwnerId = id;
		ds_list_add(listofBombs, b);
		bombPlayerIsOn = b; // When bomb is placed save its ID to enable no collision until player walks of 
	}
}

// TO-DO
// Place bomb only in grid

if keyUlt {
	event_user(0);
}
