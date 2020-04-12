//Debug print if client is disconnected
if(!instance_exists(Obj_server) & !isConnected) {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(10,10,"Disconnected");
}