
jellyDamageCounter -= dt;


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
		oPlayer.y_speed = -5;
	}
}