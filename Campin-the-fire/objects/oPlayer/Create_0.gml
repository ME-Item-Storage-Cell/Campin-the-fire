Tileset = layer_tilemap_get_id("Tiles_1");

x_speed = 0;

//x_target = 0;

y_speed = 0; 

//y_target = 0;

movement_speed = 8; 

water_resistance = 4;

grav = 0.15;

buoyancy = -0;
h_fric = 0.02;   // Horizontal deceleration (Lower = more sliding)
v_fric = 0.05;   // Vertical deceleration (Lower = floatier)
accel = 0.05;     // How fast you gain speed
deccel = 0.01;

accel_final = 0;

accel_max = 1;

jump_force = 12;

jump_cooldown = 0.3;

jump_counter = 0;

dt = 0;

max_oxygen = 100;

oxygen = 100;

oxygen_drain = 0;

max_stamina = 100;

stamina = 100;

climbing = false;

stun = 0;

paralysed = 0;

accel = 0.2;     // How fast you gain speed

accel_final = 500;

accel_max = 500;

last_h = 0;

vsp = 0;

restart = false;

win = false;

max_fall_speed = 5.0;  // Cap on falling speed
