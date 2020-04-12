socket = network_create_socket(network_socket_tcp);
global.socket = socket;
buffer = buffer_create(1024, buffer_grow, 1);
network_connect(socket, "localhost", PORT);

layer_background_visible(layer_background_get_id("InGameMenuBackground"), false);
isConnected = true;
