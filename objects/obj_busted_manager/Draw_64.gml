// 1. SETUP
draw_set_font(fnt_gui_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _cx = 640;
var _cy = 360;

// 2. RED BACKGROUND
draw_set_color(c_red);
draw_set_alpha(0.3);
draw_rectangle(0, 0, 1280, 720, false);
draw_set_alpha(1);

// 3. TEXT
draw_set_color(c_red);
draw_text_transformed(_cx, 200, "BUSTED!", 3, 3, 0);
draw_set_color(c_white);
draw_text(_cx, 300, "The Shopkeeper caught you.");

// --- BUTTONS ---
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _click = mouse_check_button_pressed(mb_left);
var _btn_w = 200;
var _btn_h = 60;
var _x = _cx - (_btn_w/2);

// BUTTON 1: RETRY (Reloads the last level you were in)
draw_rectangle(_x, 400, _x + _btn_w, 400 + _btn_h, false);
draw_set_color(c_black);
draw_text(_cx, 430, "RETRY");
draw_set_color(c_white);

if (_click && point_in_rectangle(_mx, _my, _x, 400, _x + _btn_w, 400 + _btn_h))
{
    // Reset score if you want (Optional: score = 0;)
    room_goto(global.checkpoint); 
}

// BUTTON 2: MENU
// 4. EXIT / MENU BUTTON (Y = 500)
draw_rectangle(_x, 500, _x + _btn_w, 500 + _btn_h, false);

draw_set_color(c_black);
draw_text(_cx, 500 + (_btn_h/2), "MENU");
draw_set_color(c_white);

// THE CLICK LOGIC
if (_click && point_in_rectangle(_mx, _my, _x, 500, _x + _btn_w, 500 + _btn_h))
{
    // CRITICAL: Make sure this name matches your actual room name perfectly!
    room_goto(Room_Menu); 
}

// Reset Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);