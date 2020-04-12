/// @description Check object type to draw client side effects

switch (name) {
	case "Player":
		draw_sprite(sp_DebugShadow,0,x,y+32);
	break;
	case "Enemy":
		draw_sprite(sp_DebugShadow,0,x,y+32);
	break;
	
}
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
draw_self();