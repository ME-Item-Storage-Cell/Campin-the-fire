dt = delta_time / 1000000;

jump_counter -= dt;
stun -= dt;
paralysed -= dt;

/// stamina regen
if (stamina < max_stamina) {
		stamina += dt*20;
	}
oxygen -= dt*5

if (stamina < 0) {
		stamina = 0;
	}

/// death
if (oxygen < 0) {
		restart = true;
	}

/// oxygen drain
oxygen -= dt

if (oxygen_drain > 0) {
	oxygen -= dt*50
	oxygen_drain -= dt*50
}

/// falling
if (y_speed <= grav) {
	y_speed += grav;
}

/// horizontal movement
var move_dir = keyboard_check(vk_right) - keyboard_check(vk_left);

if (move_dir != 0 && paralysed <= 0) {
    var is_turning = (sign(move_dir) != sign(x_speed) && x_speed != 0);
    var active_accel = is_turning ? (accel * 2.5) : accel;
    
    x_speed += move_dir * active_accel;
} else {
    if (x_speed > 0) x_speed = max(0, x_speed - h_fric);
    if (x_speed < 0) x_speed = min(0, x_speed + h_fric);
}


var max_w = movement_speed / water_resistance;
x_speed = clamp(x_speed, -max_w, max_w);

/// stunning
if (stun <= 0) {
	move_and_collide(x_speed, y_speed, Tileset);
}
else {
	x_speed = 0;
	y_speed = 0;
}


if (place_meeting(x, y + 1, Tileset)) { 
	if(!climbing){
		y_speed += grav/water_resistance; //grav
		if (stamina < max_stamina) {
				stamina += dt*20;
			}
		

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
	    if (keyboard_check_pressed(vk_up) && paralysed <= 0) 
		{
	        y_speed = -(jump_force-2)/water_resistance; 
			jump_counter = jump_cooldown;

	    } else { 
			y_speed = lerp(y_speed, 0, 0.1);
	    }

	}
}

else {
	y_speed = lerp(y_speed, 0, v_fric)
	if (keyboard_check_pressed(vk_up) && paralysed <= 0 && jump_counter <= 0 && stamina >= 30) { 
        y_speed = -jump_force/water_resistance; 
		jump_counter = jump_cooldown;
		stamina -= 35;
		oxygen_drain = 2;
	}



	if (place_meeting(x, y + 1, Tileset)) { 
		
		if (stamina < max_stamina) {
			stamina += 1;
		}
	    if (keyboard_check_pressed(vk_up) && paralysed <= 0) {
			 
	        y_speed = -(jump_force)/water_resistance; 
			jump_counter = jump_cooldown;

	    } else { 
			y_speed = lerp(y_speed, 0, 0.5);
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

	if (y > room_height or x > room_width or x < 0) { // if the player is outside of the room
		restart = true;
	}
	if (y < 0){
		win = true;
		}
}

if (keyboard_check_pressed(vk_down) && paralysed <= 00) {
	y_speed += (jump_force/water_resistance/5);
}