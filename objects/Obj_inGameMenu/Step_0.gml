if(global.isInGameMenuOpen) {
	if(keyboard_check_pressed(vk_down)) {
	currentIndex++;
	}

	if(keyboard_check_pressed(vk_up)) {
		currentIndex--;
	}

	currentIndex = clamp(currentIndex, 0, array_length_1d(menu)-1);

	if(keyboard_check_pressed(vk_enter)) {
		//Select [currentIndex] option
		switch(currentIndex) {
			case 0:
				//Create game
				//instance_create_layer(0,0,"Instances",Obj_server);
				//room_goto_next();
			break;
		
			case 1:
				//room_goto_next();
			break;
		
			case 2:
				game_end();
			break;
			
		}
	}
}