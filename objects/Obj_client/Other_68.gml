var event_id = async_load[? "id"];

if (socket == event_id) {
	
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	switch (cmd) {
		case PACKET_ENTITY_EDIT:
			var c = buffer_read(buff, buffer_u8);
			var e_id = buffer_read(buff, buffer_u32);
			
			//If entity does not exist create it and request its data form server
			if(!ds_map_exists(entities, e_id)) {
				var p = instance_create_layer( 0, 0, "Instances", Obj_slave);
				RequestData(CMD_XY, e_id);
				RequestData(CMD_SPRITE_INDEX, e_id);
				RequestData(CMD_SPRITE_SCALE, e_id);
				ds_map_set(entities, e_id, p);
			}
			var p = entities[? e_id];
		
			switch (c) {
				case CMD_XY:
					p.xTo = buffer_read(buff, buffer_s16);
					p.yTo = buffer_read(buff, buffer_s16);
				break;
				
				case CMD_NAME:
					p.name = buffer_read(buff, buffer_string);
				break;
				
				case CMD_SPRITE_INDEX:
					p.sprite_index = buffer_read(buff, buffer_u16);
					p.image_speed = buffer_read(buff, buffer_u16);
				break;
				
				case CMD_SPRITE_SCALE:
					p.image_xscale = buffer_read(buff, buffer_u16);
					p.image_yscale = buffer_read(buff, buffer_u16);
				break;
				
				case CMD_PATICLE:
					//TO - DO
				break;
				
				case CMD_DESTROY:
					with(p) {
						instance_destroy();
					}
				break;
				
				case CMD_IAM:
					global.iCamera.follow = p;
				break;
			}
			
		break;
		
		case PACKET_ENTITY_CREATE:
			var e_id = buffer_read(buff, buffer_u32);
			if(!ds_map_exists(entities, e_id)) { // If does not exist create it
				var p = instance_create_layer( 0, 0, "Instances", Obj_slave);
				p.x = buffer_read(buff, buffer_s16);
				p.y = buffer_read(buff, buffer_s16);
				
				p.xTo = p.x;
				p.yTo = p.y;
				
				p.sprite_index = buffer_read(buff, buffer_u16);
				p.image_speed = buffer_read(buff, buffer_u16);
				
				p.image_xscale = buffer_read(buff, buffer_u16);
				p.image_yscale = buffer_read(buff, buffer_u16);
				
				p.name = buffer_read(buff, buffer_string);
				
				
				ds_map_set(entities, e_id, p);
			} else { // Else updates its data to match server
				
			}
		break;
		
		case PACKET_DELTA: //¯\_(ツ)_/¯ all changes in new frame
		
			var numberEntities = buffer_read(buff, buffer_u16);
			for( var i = 0; i < numberEntities; i++) {
				var c = buffer_read(buff, buffer_u8);
				var e_id = buffer_read(buff, buffer_u32);
			
				//If entity does not exist create it and request its data form server
				if(!ds_map_exists(entities, e_id) & (c != CMD_CREATE)) {
					var p = instance_create_layer( 0, 0, "Instances", Obj_slave);
					RequestData(CMD_XY, e_id);
					RequestData(CMD_SPRITE_INDEX, e_id);
					RequestData(CMD_SPRITE_SCALE, e_id);
					ds_map_set(entities, e_id, p);
				}
				var p = entities[? e_id];
				
				switch (c) {
					case CMD_XY:
						p.xTo = buffer_read(buff, buffer_s16);
						p.yTo = buffer_read(buff, buffer_s16);
					break;
				
					case CMD_NAME:
						p.name = buffer_read(buff, buffer_string);
					break;
				
					case CMD_SPRITE_INDEX:
						p.sprite_index = buffer_read(buff, buffer_u16);
						p.image_speed = buffer_read(buff, buffer_u16);
					break;
				
					case CMD_SPRITE_SCALE:
						p.image_xscale = buffer_read(buff, buffer_u16);
						p.image_yscale = buffer_read(buff, buffer_u16);
					break;
				
					case CMD_PATICLE:
						//TO - DO
					break;
				
					case CMD_DESTROY:
						buffer_read(buff, buffer_u8);
						with(p) {
							instance_destroy();
						}
					break;
				
					case CMD_IAM:
						global.iCamera.follow = p;
					break;
					
					case CMD_CREATE:
						if(!ds_map_exists(entities, e_id)) { // If does not exist create it
							var p = instance_create_layer( 0, 0, "Instances", Obj_slave);
							p.x = buffer_read(buff, buffer_s16);
							p.y = buffer_read(buff, buffer_s16);
				
							p.xTo = p.x;
							p.yTo = p.y;
				
							p.sprite_index = buffer_read(buff, buffer_u16);
							p.image_speed = buffer_read(buff, buffer_u16);
				
							p.image_xscale = buffer_read(buff, buffer_u16);
							p.image_yscale = buffer_read(buff, buffer_u16);
				
							p.name = buffer_read(buff, buffer_string);
				
							ds_map_set(entities, e_id, p);
						} else { // Else updates its data to match server
							
							p.x = buffer_read(buff, buffer_s16);
							p.y = buffer_read(buff, buffer_s16);
				
							p.xTo = p.x;
							p.yTo = p.y;
				
							p.sprite_index = buffer_read(buff, buffer_u16);
							p.image_speed = buffer_read(buff, buffer_u16);
				
							p.image_xscale = buffer_read(buff, buffer_u16);
							p.image_yscale = buffer_read(buff, buffer_u16);
				
							p.name = buffer_read(buff, buffer_string);
						}
					break;
				}
			}
			
		break;
		
		case PACKET_FULL_SYNC:
		
		break;
			
	}
}
