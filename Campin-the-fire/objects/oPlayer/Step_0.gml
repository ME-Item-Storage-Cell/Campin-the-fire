dt = delta_time / 1000000;


jump_counter -= dt;
stun -= dt;
paralysed -= dt;

if (stamina < max_stamina) stamina += dt * 20;
stamina = max(0, stamina);

oxygen -= dt * 2;
if (oxygen_drain > 0) {
    oxygen -= dt * 50;
    oxygen_drain -= dt * 50;
}
if (oxygen <= 0) {
    oxygen = 0;
    restart = true;
}

var move_dir = keyboard_check(vk_right) - keyboard_check(vk_left);

if (move_dir != 0 && paralysed <= 0) {
    x_speed += move_dir * accel;
} else {
    
    x_speed = lerp(x_speed, 0, h_fric); 
}

var max_w = movement_speed / water_resistance;
x_speed = clamp(x_speed, -max_w, max_w);

// --- 3. Vertical Movement & Jumping ---
var grounded = place_meeting(x, y + 1, oSolid);

if (grounded) {
    // Reset falling speed and recover extra stamina on ground
    if (y_speed > 0) y_speed = 0;
		stamina += 1; 

    if (keyboard_check_pressed(vk_up) && paralysed <= 0) {
        y_speed = -(jump_force - 2) / water_resistance; 
        jump_counter = jump_cooldown;
    }
} else {
    y_speed += (grav / water_resistance) + buoyancy;
    y_speed = lerp(y_speed, 0, 0.1); 
    y_speed = clamp(y_speed, -jump_force, 4);

    if (keyboard_check_pressed(vk_up) && paralysed <= 0 && jump_counter <= 0 && stamina > 20) { 
        y_speed = -jump_force / water_resistance; 
        jump_counter = jump_cooldown;
        stamina -= 30;
    }
}

// Ceiling collision
if (place_meeting(x, y - 1, oSolid) && y_speed < 0) {
    y_speed = 0;
}

// stunning
if (stun <= 0) {
    move_and_collide(x_speed, y_speed, oSolid);
} else {
    x_speed = 0;
    y_speed = 0;
    move_and_collide(0, 0, oSolid); 
}

// out of bounds
if (y > room_height || y < 0 || x > room_width || x < 0) {
    restart = true;
}