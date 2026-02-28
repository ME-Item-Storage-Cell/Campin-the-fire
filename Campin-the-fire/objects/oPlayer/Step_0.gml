
x_speed = 0;
y_speed += grav/water_resistance;
jump_counter -= dt;
stun -= dt;
paralysed -= dt;

if (stamina < max_stamina) {
		stamina += dt*20;
	}

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

key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))

var hmove = key_right - key_left

if hmove != 0
	{
		if last_h != hmove
			{
				last_h = hmove
				accel_final = 0
			}
			
		if accel_final <= accel_max
			{
				accel_final += accel
			}
	}
	else
	{
		if accel_final > 0
			{
				accel_final -= accel
			}
	}
	
if accel_final < accel
	{
		accel_final = 0
		last_h = 0
	}
	
hsp = accel_final * last_h

x+= hsp
y+= vsp