/// @description Send all changes that ouccered this frame to all clients

if(buffer_tell(global.buffer_delta) != 0) { // If buffer not empty send it
	for (var s = 0; s < ds_list_size(global.socketsList); s++) {
		network_send_packet(ds_list_find_value(global.socketsList, s), global.buffer_delta, buffer_tell(global.buffer_delta));
	}
	buffer_seek(global.buffer_delta, buffer_seek_start, 0); //Go to start of buffer
	buffer_write(global.buffer_delta, buffer_u8, PACKET_DELTA); // Add packet command
	buffer_write(global.buffer_delta, buffer_u16, 0); // Counter for number of entities
}
