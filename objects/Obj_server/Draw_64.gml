//Debug print number of clients
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(10,10,"Players: " +string(ds_list_size(sockets)));