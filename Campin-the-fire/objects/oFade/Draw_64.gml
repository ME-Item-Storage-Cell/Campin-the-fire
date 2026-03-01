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
	draw_set_colour(c_white);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,browser_width,browser_height,0);
	draw_text(browser_width/2, browser_height/2, "You Escaped...");
	alpha += 0.02;
	timer += dt;
	if (timer > 4) {
		game_restart();
	}
}