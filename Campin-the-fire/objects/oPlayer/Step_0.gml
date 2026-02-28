y_speed += grav/water_resistance;
jump_counter -= dt;

if keyboard_check(vk_right) { 

    x_speed = movement_speed/water_resistance; 

} else if keyboard_check(vk_left) { 

    x_speed = -movement_speed/water_resistance; 
}

move_and_collide(x_speed, y_speed, oSolid);

if (keyboard_check_pressed(vk_up) && jump_counter < 0) { 
        y_speed = -15/water_resistance; 
		jump_counter = jump_cooldown;
}

if (place_meeting(x, y + 1, oSolid)) { 

    if (keyboard_check_pressed(vk_up)) { 

        y_speed = -10/water_resistance; 
		jump_counter = jump_cooldown;

    } else { 
		if (y_speed > 0.2 || y_speed < 0.2) {
			y_speed = 0; 
		}
		else {
			y_speed /= 1.2;
		}

    }

}