/// @description Trying to smooth out object movement
if(abs(x - xTo) < 4)
	x = xTo;
	
if(abs(y - yTo) < 4)
	y = yTo;
	
x += (xTo - x) / 2;
y += (yTo - y) / 2;
