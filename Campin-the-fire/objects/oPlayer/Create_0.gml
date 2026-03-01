Tileset = layer_tilemap_get_id("Tiles_1");
audio_play_sound(Museum__Aquarium____Animal_Crossing__New_Horizons_Music,0, true)
x_speed = 0;

y_speed = 0; 

movement_speed = 6; 

water_resistance = 3.5;

grav = 0.30;

buoyancy = 0;
h_fric = 0.035;
v_fric = 0.05;
accel = 0.07;

jump_force = 50;

jump_cooldown = 0.4;

jump_counter = 0;

dt = 0;

max_oxygen = 150;

oxygen = 150;

oxygen_drain = 0;

max_stamina = 100;

stamina = 100;

climbing = false;

stun = 0;

paralysed = 0;

accel_final = 1;

accel_max = 1;

last_h = 0;

vsp = 0;

restart = false;

win = false;

// Initialize death system
death_playing = false;      // Are we showing the death screen?
death_timer = 0;            // Countdown timer for death screen
death_sound_played = false; // Make sure death sound only plays once
