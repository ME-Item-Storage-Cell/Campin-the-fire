Tileset = layer_tilemap_get_id("Tiles_1");

x_speed = 0;

//x_target = 0;

y_speed = 0; 

//y_target = 0;

movement_speed = 5; 

water_resistance = 3;

grav = 0.25;

h_fric = 0.02;   // Horizontal deceleration (Lower = more sliding)
v_fric = 0.01;   // Vertical deceleration (Lower = floatier)
accel = 0.4;     // How fast you gain speed

accel_final = 0;

accel_max = 50;

jump_force = 15;

jump_cooldown = 0.2;

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

h_fric = 0.05;   // Horizontal deceleration (Lower = more sliding)
v_fric = 0.02;   // Vertical deceleration (Lower = floatier)
accel = 0.2;     // How fast you gain speed

accel_final = 500;

accel_max = 500;

last_h = 0;

vsp = 0;

restart = false;

win = false;
