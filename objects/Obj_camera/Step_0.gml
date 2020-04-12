/// @description Update Camera
if(instance_exists(follow)) {
	
	xTo = follow.x;
	yTo = follow.y;
	
}

//Update Camera Position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

//Clamp x,y to keep camera in the room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

//ScreenShake
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);