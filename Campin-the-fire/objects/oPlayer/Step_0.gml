/// -------------------------
/// STEP EVENT
/// -------------------------
dt = delta_time / 1000000;

// ==========================
// DEATH SYSTEM
// ==========================
if (death_playing)
{
    // Freeze player
    x_speed = 0;
    y_speed = 0;

    // Countdown timer
    death_timer -= dt;

    // Play death sound once
    if (!death_sound_played)
    {
        audio_play_sound(snd_death, 1, false);
        death_sound_played = true;
    }

    // Restart room when timer ends
    if (death_timer <= 0)
    {
        room_restart();
    }

    exit; // skip normal step while dead
}

// ==========================
// ORIGINAL PLAYER CODE START
// ==========================
jump_counter -= dt;
stun -= dt;
paralysed -= dt;

audio_play_sound(Museum__Aquarium____Animal_Crossing__New_Horizons_Music,0, true)

/// stamina regen
if (stamina < max_stamina) {
    stamina += dt*20;
}
oxygen -= dt*5;

if (stamina < 0) stamina = 0;

/// death trigger
if (oxygen < 0) {
    death_playing = true;
    death_timer = 6;
    death_sound_played = false;
}

/// oxygen drain
oxygen -= dt;

if (oxygen_drain > 0) {
    oxygen -= dt*50;
    oxygen_drain -= dt*50;
}

/// falling
if (y_speed <= grav) y_speed += grav;

/// horizontal movement
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"))
var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"))
var move_dir = move_right - move_left;

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
	move_and_collide(x_speed, y_speed, Tileset)
}
else {
	x_speed = 0;
	y_speed = 0;
}

// Jumping/swimming
var move_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))

if (place_meeting(x, y + 1, Tileset)) { 
    if(!climbing){
        y_speed += grav/water_resistance;
        if (stamina < max_stamina) stamina += dt*20;
        if (stamina < 0) stamina = 0;

        if (oxygen <= 0) {
            oxygen = 0;
            death_playing = true;
            death_timer = 6;
            death_sound_played = false;
        }

		if (oxygen_drain > 0) {
			oxygen -= dt*50
			oxygen_drain -= dt*50
		}
	    if (move_up && paralysed <= 0) 
		{
	        y_speed = -(jump_force-2)/water_resistance; 
			jump_counter = jump_cooldown;

        if (oxygen_drain > 0) {
            oxygen -= dt*50;
            oxygen_drain -= dt*50;
        }

        if (keyboard_check_pressed(vk_up) && paralysed <= 0) {
            y_speed = -(jump_force-2)/water_resistance; 
            jump_counter = jump_cooldown;
        } else { 
            y_speed = lerp(y_speed, 0, 0.1);
        }
    }
} else {
    y_speed = lerp(y_speed, 0, v_fric);

else {
	y_speed = lerp(y_speed, 0, v_fric)
	if (move_up && paralysed <= 0 && jump_counter <= 0 && stamina >= 30) { 
        y_speed = -jump_force/water_resistance; 
        jump_counter = jump_cooldown;
        stamina -= 35;
        oxygen_drain = 2;
    }

    if (place_meeting(x, y + 1, Tileset)) { 
        if (stamina < max_stamina) stamina += 1;
        if (keyboard_check_pressed(vk_up) && paralysed <= 0) {
            y_speed = -(jump_force)/water_resistance; 
            jump_counter = jump_cooldown;
        } else { 
            y_speed = lerp(y_speed, 0, 0.5);
        }
    } else { // swim
        if (keyboard_check_pressed(vk_up) && paralysed <= 0 && jump_counter <= 0 && stamina > 20) { 
            y_speed = -jump_force/water_resistance; 
            jump_counter = jump_cooldown;
            stamina -= 30;
        }
    }

    if (place_meeting(x, y - 1, Tileset)) y_speed = 0;

	if (place_meeting(x, y + 1, Tileset)) { 
		
		if (stamina < max_stamina) {
			stamina += 1;
		}
	    if (move_up && paralysed <= 0) {
			 
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

	if (y < 0 or x > room_width or x < 0) { // if the player is outside of the room
		restart = true;
		
	}
	if (y > room_height){
		win = true;
		audio_stop_sound(Museum__Aquarium____Animal_Crossing__New_Horizons_Music)
		}
}

var move_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))

if (move_down && paralysed <= 00) {
	y_speed += (jump_force/water_resistance/5);
}
