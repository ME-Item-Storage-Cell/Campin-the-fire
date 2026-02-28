dt = delta_time / 1000000;

jump_counter -= dt;
stun -= dt;
paralysed -= dt;

if(!climbing){
	y_speed += grav/water_resistance; //grav
	if (stamina < max_stamina) {
			stamina += dt*20;
		}
	oxygen -= dt*2

	if (stamina < 0) {
			stamina = 0;
		}
	
	if (oxygen <= 0) {
			oxygen = 0;
			restart = true;
		}
	
	oxygen -= dt*2

	if (oxygen_drain > 0) {
		oxygen -= dt*50
		oxygen_drain -= dt*50
	}

	if (y_speed <= grav) {
		y_speed += grav;
	}

	// Get input direction: 1 for right, -1 for left, 0 for none
	var move_dir = keyboard_check(vk_right) - keyboard_check(vk_left);

	if (move_dir != 0 && paralysed <= 0) {
	    // Gradually add acceleration to current speed
	    x_speed += move_dir * accel;
	} else {
	    // Apply friction: move x_speed toward 0 by the accel amount
	    if (x_speed > 0) x_speed = max(0, x_speed - accel);
	    if (x_speed < 0) x_speed = min(0, x_speed + accel);
	}

	// Keep speed within the max limit
	var max_w = movement_speed / water_resistance;
	x_speed = clamp(x_speed, -max_w, max_w);

	if (stun <= 0) {
		move_and_collide(x_speed, y_speed, Tileset);
	}
	else {
		x_speed = 0;
		y_speed = 0;
	}


	if (place_meeting(x, y + 1, Tileset)) { 
		
		if (stamina < max_stamina) {
			stamina += 1;
		}
	    if (keyboard_check_pressed(vk_up) && paralysed <= 0) { //jump
			 
	        y_speed = -(jump_force-2)/water_resistance; 
			jump_counter = jump_cooldown;

	    } else { 
			y_speed = lerp(y_speed, 0, 0.5); // Gently stops you instead of snapping to 0
	    }
		
	}

	else { //swim
		if (keyboard_check_pressed(vk_up) && paralysed <= 0 && jump_counter <= 0 && stamina > 20) { 

			y_speed = -jump_force/water_resistance; 
			jump_counter = jump_cooldown;
			stamina -= 30;
		}
	}

	if (place_meeting(x, y - 1, Tileset)) { 

	    y_speed = 0;

	}

	if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room
		restart = true;
	}
}