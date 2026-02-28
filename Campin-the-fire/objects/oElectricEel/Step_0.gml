
harmTimer -= dt;


move_and_collide(x_speed, 0, oSolid);

if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 200) && harmTimer <= 0) {//significantly bigger than eel becuz player x and y is a point
	oPlayer.stun = 0.2;
	oPlayer.paralysed = 2;
	oPlayer.oxygen_drain = 5;
	originalSpeed = x_speed;
	x_speed = 0; //animation
	harmTimer = 2;
	
	
}
	if (harmTimer <= 0) {
		if (x < max_x + initial_x && movingRight) {
			x_speed = 2;
		}
		else if (x >= max_x + initial_x && movingRight) {
			movingRight = false;
		}
		if (x > initial_x && !movingRight) {
			x_speed = -2;
		}
		else if (x <= initial_x && !movingRight) {
			movingRight = true;
		}
	}

