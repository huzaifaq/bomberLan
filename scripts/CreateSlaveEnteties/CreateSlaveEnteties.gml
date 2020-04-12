buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, PACKET_ENTITY_CREATE);
buffer_write(buffer, buffer_u32, argument1.id);  //ID of entity

//CMD_XY:
buffer_write(buffer, buffer_s16, argument1.x);  //X
buffer_write(buffer, buffer_s16, argument1.y);  //Y
	
//CMD_SPRITE_INDEX:
buffer_write(buffer, buffer_u16, argument1.sprite_index); //Index
buffer_write(buffer, buffer_u16, argument1.image_speed); //speed
	
//CMD_SPRITE_SCALE:
buffer_write(buffer, buffer_u16, argument1.image_xscale); //X
buffer_write(buffer, buffer_u16, argument1.image_yscale); //Y

//CMD_NAME:
buffer_write(buffer, buffer_string, argument1.name);

network_send_packet(argument0, buffer, buffer_tell(buffer));