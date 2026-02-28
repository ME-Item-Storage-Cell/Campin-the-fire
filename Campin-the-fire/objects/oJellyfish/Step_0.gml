dt = delta_time / 1000000;
jellyDamageCounter -= dt;

movementCounter += dt;

if (movementCounter > 0 && movementCounter < 1){
	move_towards_point(x, y-100, 1);
}
if (movementCounter > 3 && movementCounter < 4){
	move_towards_point(x, y+100, 1);
}
if (movementCounter > 6){
	movementCounter = 0;
}



if (place_meeting(x, y+10, oPlayer)){
	if (jellyDamageCounter < 0) {
		//stun player
		oPlayer.paralysed = 0.5;
		oPlayer.stun = 0.1;
		oPlayer.oxygen -= 5;
		jellyDamageCounter = 1.5;
	}
}
else {
	if (place_meeting(x, y-10, oPlayer) && oPlayer.y_speed >= -15){
		oPlayer.y_speed = -12.5;
	}
}