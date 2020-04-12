buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, PACKET_ENTITY_EDIT);
buffer_write(buffer, buffer_u8, argument0);
buffer_write(buffer, buffer_u32, argument1);  //ID of entity
network_send_packet(socket, buffer, buffer_tell(buffer));