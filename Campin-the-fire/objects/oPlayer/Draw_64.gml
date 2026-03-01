draw_set_colour(c_teal);
draw_rectangle(20, 20, 20 + (500*oxygen/max_oxygen), 40, false);

draw_set_colour(c_yellow);
draw_rectangle(20, 60, 20 + (300*stamina/max_stamina), 80, false);

if (death_playing)
{
    draw_clear(c_black);

    // Fade in/out alpha
    var total_time = 6;       // Death screen duration
    var fade_duration = 1;    // Duration of fade in/out
    var alpha = 1;

    if (death_timer > total_time - fade_duration)
        alpha = 1 - ((death_timer - (total_time - fade_duration)) / fade_duration);
    else if (death_timer < fade_duration)
        alpha = death_timer / fade_duration;
    else
        alpha = 1;

    draw_set_alpha(alpha);

    // Draw death PNG
    if (sprite_exists(spr_death_png))
    {
        var sprite_w = sprite_get_width(spr_death_png);
        var sprite_h = sprite_get_height(spr_death_png);

        // Get camera viewport
        var cam = view_camera[0]; // main camera
        var cam_w = camera_get_view_width(cam);
        var cam_h = camera_get_view_height(cam);
        var cam_x = camera_get_view_x(cam);
        var cam_y = camera_get_view_y(cam);

        // Fit image inside camera view
        var scale_x = cam_w / sprite_w;
        var scale_y = cam_h / sprite_h;
        var scale = min(scale_x, scale_y); // fully visible, no crop

        var draw_width = sprite_w * scale;
        var draw_height = sprite_h * scale;

        // Center relative to camera
        var draw_x = cam_x + (cam_w - draw_width) / 2;
        var draw_y = cam_y + (cam_h - draw_height) / 2;

        draw_sprite_stretched(spr_death_png, 0, draw_x, draw_y, draw_width, draw_height);
    }

    draw_set_alpha(1); // reset alpha
}
