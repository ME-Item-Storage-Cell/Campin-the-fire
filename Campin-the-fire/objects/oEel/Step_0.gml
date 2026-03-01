dt = delta_time / 1000000;
harmTimer -= dt;


move_and_collide(x_speed, 0, oSolid);

if (point_in_rectangle(oPlayer.x, oPlayer.y, x-150, y-40, x+150, y+40) && harmTimer <= 0) {//significantly bigger than eel becuz player x and y is a point
	oPlayer.stun = 1;
	visible = false;
	oPlayer.oxygen_drain = 15;
	originalSpeed = x_speed;
	x_speed = 0; //animation
	harmTimer = 2;
	
	
}
if (harmTimer <= 0.2) {visible = true;}
	if (harmTimer <= 0) {
		
		if (x < max_x + initial_x && movingRight) {
			x_speed = 2;
		}
		else if (x >= max_x + initial_x && movingRight) {
			movingRight = false;
			self.image_xscale = -.8;
		}
		if (x > initial_x && !movingRight) {
			x_speed = -2;
		}
		else if (x <= initial_x && !movingRight) {
			movingRight = true;
			self.image_xscale = 0.8;
		}
	}




