//Direction calc
var hdir = 0;
var vdir = 0;
if(directionFacing & RIGHT) {
	hdir = 1;
} else if(directionFacing & LEFT) {
	hdir = -1;
} else if(directionFacing & DOWN) {
	vdir = 1;
} else if(directionFacing & UP) {
	vdir = -1;
}
direction = point_direction(x, y, x + hdir, y + vdir);


//Create the channeling particles
part_type_orientation(global.iParticleManager.particleType_Laser_channeling, direction, direction, 0, 0, 0);

for(var i = 1; i < maxLength div 64; i++) {
		part_particles_create(global.iParticleManager.particleSystem, x + (hdir * 64 * i), y + (vdir * 64 * i), global.iParticleManager.particleType_Laser_channeling, 1);
}
//Send particle to clients
//CreateSlaveParticles() //particle type, x, y, number


alarm[1] = 20;