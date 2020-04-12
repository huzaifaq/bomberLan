//
#macro PORT 63322
#macro MAX_CLIENTS 10

#macro PACKET_KEY 0
#macro PACKET_ENTITY_CREATE 1
#macro PACKET_ENTITY_EDIT 2
#macro PACKET_DELTA 3
#macro PACKET_FULL_SYNC 4

server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);

buffer = buffer_create(256, buffer_grow, 1);

clients = ds_map_create();
sockets = ds_list_create();

global.socketsList = sockets;
global.buffer_delta = buffer_create(256, buffer_grow, 1);

buffer_seek(global.buffer_delta, buffer_seek_start, 0); //Go to start of buffer
buffer_write(global.buffer_delta, buffer_u8, PACKET_DELTA); // Add packet command
buffer_write(global.buffer_delta, buffer_u16, 0); // Counter for number of entities


global.buffer_full_sync = buffer_create(256, buffer_grow, 1);

