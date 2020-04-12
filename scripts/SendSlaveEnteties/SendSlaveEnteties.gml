// (Socket, EntityID, Data1, Data2)
#macro CMD_XY			0
#macro CMD_NAME			1
#macro CMD_SPRITE_INDEX	2
#macro CMD_SPRITE_SCALE	3
#macro CMD_DESTROY		4
#macro CMD_PATICLE		5
#macro CMD_IAM			6
#macro CMD_CREATE		7

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, PACKET_ENTITY_EDIT);
buffer_write(buffer, buffer_u8, argument1);  //Type of entity data to send
buffer_write(buffer, buffer_u32, argument2);  //ID of entity

switch (argument1) {
	case CMD_XY:
		buffer_write(buffer, buffer_s16, argument3);  //X
		buffer_write(buffer, buffer_s16, argument4);  //Y
	break;
	
	case CMD_NAME:
		buffer_write(buffer, buffer_string, argument3);
	break;
	
	case CMD_SPRITE_INDEX:
		buffer_write(buffer, buffer_u16, argument3);
		buffer_write(buffer, buffer_u16, argument4);
	break;
	
	case CMD_SPRITE_SCALE:
		buffer_write(buffer, buffer_u16, argument3); //X
		buffer_write(buffer, buffer_u16, argument4); //Y
	break;
	
	case CMD_PATICLE:
		buffer_write(buffer, buffer_u16, argument3);
		buffer_write(buffer, buffer_u16, argument4);
	break;
	
	case CMD_DESTROY:
		buffer_write(buffer, buffer_u8, argument1);
	break;
	
	case CMD_IAM:
	
	break;
	
}

network_send_packet(argument0, buffer, buffer_tell(buffer));