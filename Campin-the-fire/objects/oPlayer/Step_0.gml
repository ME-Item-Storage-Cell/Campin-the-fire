
x_speed = 0;
y_speed += grav/water_resistance;
jump_counter -= dt;
stun -= dt;
paralysed -= dt;

if (stamina < max_stamina) {
		stamina += dt*20;
	}
oxygen -= dt*2

if (y_speed <= grav) {
	y_speed += grav;
}

if (keyboard_check(vk_right) && paralysed <= 0) { 

    x_speed = movement_speed/water_resistance; 

} else if (keyboard_check(vk_left) && paralysed <= 0) { 

    x_speed = -movement_speed/water_resistance; 
}
else {
	x_speed = 0;
}

if (stun <= 0) {
	move_and_collide(x_speed, y_speed, oSolid);
}



if (place_meeting(x, y + 1, oSolid)) { 
	if (stamina < max_stamina) {
		stamina += 1;
	}
    if (keyboard_check_pressed(vk_up) && paralysed <= 0) { //jump
        y_speed = -(jump_force-2)/water_resistance; 
		jump_counter = jump_cooldown;

    } else { 
		y_speed = 0;
    }

}

else { //swim
	if (keyboard_check_pressed(vk_up) && paralysed <= 0 && jump_counter <= 0) { 
        y_speed = -jump_force/water_resistance; 
		jump_counter = jump_cooldown;
		stamina -= 30;
	}
}

if (place_meeting(x, y - 1, oSolid)) { 

    y_speed = 0;

}

if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room

    room_restart(); 

}
