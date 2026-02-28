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
