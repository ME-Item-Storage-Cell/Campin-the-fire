timer -= dt;
if (timer <= 0){
	x_speed *= -1;
	timer = 5;
}
move_and_collide(x_speed, 0, oSolid);





