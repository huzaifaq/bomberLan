if(other.id != explosionHitPlayer) {
	hp = hp - 1;
	if(hp == 0) {
		wasKilledBy = other.id;
		instance_destroy();
	}
	explosionHitPlayer = other.id;
}
