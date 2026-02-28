if (place_meeting(x, y-5, oPlayer)){
	//stun player
	oPlayer.oxygen -= 5;
}
else {
	if (place_meeting(x, y+1, oPlayer)){
		oPlayer.y_speed = -40;
	}
}