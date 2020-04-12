/// @description destroy all lists and buffers
network_destroy(server);

ds_map_destroy(clients);
ds_list_destroy(sockets);

buffer_delete(buffer);
buffer_delete(global.buffer_delta);
buffer_delete(global.buffer_full_sync);