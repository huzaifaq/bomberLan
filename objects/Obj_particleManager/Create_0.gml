particleSystem = part_system_create();

particleType_Laser_channeling = part_type_create();
part_type_sprite(particleType_Laser_channeling, p_Trail,0,0,0);
part_type_size(particleType_Laser_channeling, 1, 1, 0, 0);
part_type_life(particleType_Laser_channeling, 50, 50);
part_type_alpha3(particleType_Laser_channeling, 0.3, 0.7, 1);