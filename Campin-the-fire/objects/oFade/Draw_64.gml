dt = delta_time/1000000;

if (oPlayer.restart){
	
	draw_set_colour(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,browser_width,browser_height,0);
	alpha += 0.01;
	if (alpha >= 1){
		oPlayer.restart = false;
		room_restart()
	}
}

if (oPlayer.win) {
	oPlayer.oxygen = 100000;
	draw_set_colour(c_white);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,browser_width,browser_height,0);
	draw_set_colour(c_blue);
	draw_text_transformed(browser_width/2, browser_height/2, "You Escaped...", 5, 5, 0);
	alpha += 0.02;
	if (keyboard_check_pressed(vk_enter)) {
		game_restart();
	}
}