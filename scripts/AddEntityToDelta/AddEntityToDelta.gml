// (CMD_, EntityID,)
/// @arg CMD_
/// @arg EntityID
buffer_write(global.buffer_delta, buffer_u8, argument0); 
buffer_write(global.buffer_delta, buffer_u32, argument1.id);  //ID of entity

switch (argument0) { 
	case CMD_XY:
		buffer_write(global.buffer_delta, buffer_s16, argument1.x);  //X
		buffer_write(global.buffer_delta, buffer_s16, argument1.y);  //Y
	break;
	
	case CMD_NAME:
		buffer_write(global.buffer_delta, buffer_string, argument1.name);
	break;
	
	case CMD_SPRITE_INDEX:
		buffer_write(global.buffer_delta, buffer_u16, argument1.sprite_index);
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_speed);
	break;
	
	case CMD_SPRITE_SCALE:
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_xscale); //X
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_yscale); //Y
	break;
	
	case CMD_PATICLE:
		//buffer_write(global.buffer_delta, buffer_u16, argument3);
		//buffer_write(global.buffer_delta, buffer_u16, argument4);
	break;
	
	case CMD_DESTROY:
		buffer_write(global.buffer_delta, buffer_u8, argument1);
	break;
	
	case CMD_IAM:
	
	break;
	
	case CMD_CREATE:

		//CMD_XY:
		buffer_write(global.buffer_delta, buffer_s16, argument1.x);  //X
		buffer_write(global.buffer_delta, buffer_s16, argument1.y);  //Y
	
		//CMD_SPRITE_INDEX:
		buffer_write(global.buffer_delta, buffer_u16, argument1.sprite_index); //Index
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_speed); //speed
	
		//CMD_SPRITE_SCALE:
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_xscale); //X
		buffer_write(global.buffer_delta, buffer_u16, argument1.image_yscale); //Y

		//CMD_NAME:
		buffer_write(global.buffer_delta, buffer_string, argument1.name);
	break;
	
}

var currentBufferLocation = buffer_tell(global.buffer_delta);
buffer_seek(global.buffer_delta, buffer_seek_start, 1);
var numberEntities = buffer_read(global.buffer_delta, buffer_u16);
if((numberEntities + 1) > 65535) {
	//then pepega has happened ¯\_(ツ)_/¯
	buffer_seek(global.buffer_delta, buffer_seek_start, currentBufferLocation);
} else {
	numberEntities++;	
	buffer_seek(global.buffer_delta, buffer_seek_start, 1);
	buffer_write(global.buffer_delta, buffer_u16, numberEntities);
	buffer_seek(global.buffer_delta, buffer_seek_start, currentBufferLocation);
}


