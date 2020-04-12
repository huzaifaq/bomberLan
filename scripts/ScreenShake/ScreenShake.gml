/// @desc Shakes the global instance of camera (global.iCamera)
/// @arg Magnitude
/// @arg Frames

with (global.iCamera) {
	if (argument0 > shakeRemain) {
		shakeMagnitude = argument0;
		shakeRemain = shakeMagnitude;
		shakeLength = argument1;
	}
}