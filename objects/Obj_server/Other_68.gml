var event_id = async_load[? "id"];

if server == event_id {
	var type = async_load[? "type"];
	var sock = async_load[? "socket"];
	
	//Player connected
	if (type == network_type_connect) {
		
		//Add player to list of connected sockets
		ds_list_add(sockets, sock);
		
		//Create player Obj
		var p = instance_create_layer(128, 128, "Players", Obj_playerMaskar);
		ds_map_add(clients, sock, p);
		
		//Send copy of static MAP
		for (var i = 0; i < instance_number(Obj_static); i++) {
				CreateSlaveEnteties(sock,instance_find(Obj_static, i ));
		}
		
		//Send copy of dynamic MAP
		for (var i = 0; i < instance_number(Obj_dynamic); i++) {
				CreateSlaveEnteties(sock, instance_find(Obj_dynamic, i ));
		}
		
		//Send data of all players
		for (var i = 0; i < instance_number(Obj_player); i++) {
				CreateSlaveEnteties(sock, instance_find(Obj_player, i ));
		}
		
		//Send data of all other entities to newly connected player
		for (var i = 0; i < instance_number(Obj_enemy); i++) {
				CreateSlaveEnteties(sock, instance_find(Obj_enemy, i ));
		}
		
		//Send the client it own player ID
		SendSlaveEnteties(sock, CMD_IAM, p.id, 0, 0);
	}
	
	//Player disconnected
	if (type == network_type_disconnect) {
		var p = clients[? sock]
		if(instance_exists(p)) {
			with(p) {
				instance_destroy();
			}
		}
		
		ds_list_delete(sockets, ds_list_find_index(sockets, sock));
		ds_map_delete(clients, sock);
		
	}
} else if(event_id != global.socket) {
	var sock = async_load[? "id"];
	var buff = async_load[? "buffer"];
	
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	
	var p = clients[? sock];
	switch (cmd) {
		case PACKET_KEY: //User Input from client
			var d = buffer_read(buff, buffer_u16);
			with(p) {
				DecodeMovement(d);
			}
		break;
		
		case PACKET_ENTITY_EDIT: //Client requests missing data (reSync)
			var e_stat = buffer_read(buff, buffer_u8);
			var e_id = buffer_read(buff, buffer_u32);
			switch (e_stat) {
				case CMD_XY:
					SendSlaveEnteties(sock, CMD_XY, e_id.id, e_id.x, e_id.y);
				break;
				
				case CMD_NAME:
					SendSlaveEnteties(sock, CMD_NAME, e_id.id, e_id.name, 0);
				break;
				
				case CMD_SPRITE_INDEX:
					SendSlaveEnteties(sock, CMD_SPRITE_INDEX, e_id.id, e_id.sprite_index, 0);
				break;
				
				case CMD_SPRITE_SCALE:
					SendSlaveEnteties(sock, CMD_SPRITE_SCALE, e_id.id, e_id.image_xscale, e_id.image_yscale);
				break;
				
				case CMD_IAM:
					SendSlaveEnteties(sock, CMD_IAM, p.id, 0, 0);
				break;
				
				case CMD_PATICLE:
					//Should never be called.
				break;
				
				case CMD_DESTROY:
					//Should never be called.
				break;
				
			}
		break;
		
		case PACKET_DELTA:
		
		break;
		
		case PACKET_FULL_SYNC: // Client requests full sync ????
			
		break;
		
	}
	
	
}
