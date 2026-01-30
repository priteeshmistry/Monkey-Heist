// --- 1. IF GAME IS PAUSED (Show the Menu) ---
if (paused)
{
    // Draw the dark screenshot
    if (sprite_exists(screenshot))
    {
        draw_sprite_stretched_ext(screenshot, 0, 0, 0, 1280, 720, c_grey, 1);
    }
    
    // Setup Text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_gui_large); // Ensure we use the pixel font
    draw_set_color(c_white);
    
    // Draw "PAUSED" Title
    draw_text_transformed(640, 150, "PAUSED", 3, 3, 0);
    
    // --- VIRTUAL BUTTONS ---
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _click = mouse_check_button_pressed(mb_left);
    
    // Button Dimensions
    var _btn_w = 200;
    var _btn_h = 60;
    var _x = 640 - (_btn_w/2); // Center X
    
    // -- RESUME BUTTON (Y = 300) --
    // (If you have a sprite, use draw_sprite instead of draw_rectangle)
    draw_rectangle(_x, 300, _x + _btn_w, 300 + _btn_h, false);
    
    draw_set_color(c_black);
    draw_text(640, 300 + (_btn_h/2), "RESUME"); // Centered text
    draw_set_color(c_white);
    
    if (_click && point_in_rectangle(_mx, _my, _x, 300, _x + _btn_w, 300 + _btn_h))
    {
        paused = false;
        if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();
    }
    
    // -- EXIT BUTTON (Y = 400) --
    draw_rectangle(_x, 400, _x + _btn_w, 400 + _btn_h, false);
    
    draw_set_color(c_black);
    draw_text(640, 400 + (_btn_h/2), "EXIT");
    draw_set_color(c_white);
    
    if (_click && point_in_rectangle(_mx, _my, _x, 400, _x + _btn_w, 400 + _btn_h))
    {
        game_end();
    }
    
    // Reset Alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// --- 2. IF GAME IS PLAYING (Show the Pause Icon) ---
else 
{
    // Define Position (Top Right Corner - 80px from right edge)
    var _btn_x = 1200; 
    var _btn_y = 20;
    
    // Draw the Pause Icon
    // Ensure you have a sprite named 'spr_hud_pause'
    draw_sprite(spr_hud_pause, 0, _btn_x, _btn_y);
    
    // Check for Click on the Icon
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _w = sprite_get_width(spr_hud_pause);
    var _h = sprite_get_height(spr_hud_pause);
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (point_in_rectangle(_mx, _my, _btn_x, _btn_y, _btn_x + _w, _btn_y + _h))
        {
            // *** TRIGGER PAUSE ***
            paused = true;
            
            // 1. Take Screenshot
            var _sw = surface_get_width(application_surface);
            var _sh = surface_get_height(application_surface);
            screenshot = sprite_create_from_surface(application_surface, 0, 0, _sw, _sh, false, false, 0, 0);
            
            // 2. Freeze Game
            instance_deactivate_all(true);
        }
    }
}