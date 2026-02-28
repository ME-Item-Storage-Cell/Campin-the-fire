
y_speed += grav;
x_speed = 0;
y_speed += grav/water_resistance;
jump_counter -= dt;


if keyboard_check(vk_right) { 

    x_speed = movement_speed/water_resistance; 

} else if keyboard_check(vk_left) { 

    x_speed = -movement_speed/water_resistance; 
}
else {
	x_speed = 0;
}

move_and_collide(x_speed, y_speed, oSolid);

if (keyboard_check_pressed(vk_up) && jump_counter < 0) { 
        y_speed = -(jump_force-5)/water_resistance; 
		jump_counter = jump_cooldown;
}

if (place_meeting(x, y + 1, oSolid)) { 

    if (keyboard_check_pressed(vk_up)) { 

        y_speed = -jump_force/water_resistance; 
		jump_counter = jump_cooldown;

    } else { 
		if (y_speed > 0.2 && y_speed < 0.2) {
			y_speed = 0; 
		}
		else {
			y_speed /= 1.1;
		}

    }

}

if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room

    room_restart(); 

}