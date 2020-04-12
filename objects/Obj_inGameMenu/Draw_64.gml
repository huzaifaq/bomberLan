draw_set_font(font_8bit);
draw_set_color(c_white);
draw_set_halign(fa_center);

for(var i = 0; i < array_length_1d(menu); i++) {
	draw_set_color(currentIndex == i?c_green:c_white)
	draw_text(view_wport[0]/2, 100 + 32*i, menu[i]);
}