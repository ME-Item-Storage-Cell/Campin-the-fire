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

jump_counter -= dt;
stun -= dt;
paralysed -= dt;



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
    oxygen -= dt*75;
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
var move_up = keyboard_check(vk_up) || keyboard_check_pressed(ord("W"))
var move_down = keyboard_check(vk_down)         || keyboard_check(ord("S"));
var is_on_floor = place_meeting(x, y + 1, Tileset);

// Gravity / Buoyancy
if (!is_on_floor) {
    y_speed += (grav * 0.5); // Lower gravity for "floaty" feel
}

// Swimming Up
if (move_up && paralysed <= 0 && jump_counter <= 0 && stamina >= 20) {
    y_speed = -jump_force / water_resistance;
    stamina -= 25;
    oxygen_drain = 3;
    jump_counter = 0.2; // Small cooldown to prevent spamming
}

// Diving Down
if (move_down && paralysed <= 0) {
    y_speed += (grav * 2);
}

// Vertical Drag (Stops the player from sinking/rising forever)
y_speed *= 0.96; 

// Ceiling check
if (place_meeting(x, y - 1, Tileset) && y_speed < 0) {
    y_speed = 0;
}

	if (y > room_height or x > room_width or x < 0) { // if the player is outside of the room
		restart = true;
		
	}

	else if (y <= 0){
		win = true;
		audio_stop_sound(Museum__Aquarium____Animal_Crossing__New_Horizons_Music)
		}


    if (move_down && paralysed <= 0) {
        y_speed += (grav * 0.6);
}


