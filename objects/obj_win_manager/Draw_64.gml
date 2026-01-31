// 1. SETUP
draw_set_font(fnt_gui_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Center of screen
var _cx = 640;
var _cy = 360;

// 2. DRAW TITLE & SCORE
draw_set_color(c_yellow);
draw_text_transformed(_cx, 150, "YOU WIN!", 2, 2, 0);

draw_set_color(c_white);
draw_text(_cx, 250, "TOTAL LOOT: " + string(score));

// --- VIRTUAL BUTTONS ---
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _click = mouse_check_button_pressed(mb_left);

var _btn_w = 200;
var _btn_h = 60;
var _x = _cx - (_btn_w/2); // Center buttons horizontally

// 3. HOME BUTTON (Y = 400)
draw_rectangle(_x, 400, _x + _btn_w, 400 + _btn_h, false);

draw_set_color(c_black);
draw_text(_cx, 400 + (_btn_h/2), "HOME");
draw_set_color(c_white);

if (_click && point_in_rectangle(_mx, _my, _x, 400, _x + _btn_w, 400 + _btn_h))
{
    score = 0; // <--- CRITICAL: Reset score for the next run
    room_goto(Room_Menu);
}

// 4. EXIT BUTTON (Y = 500)
draw_rectangle(_x, 500, _x + _btn_w, 500 + _btn_h, false);

draw_set_color(c_black);
draw_text(_cx, 500 + (_btn_h/2), "EXIT");
draw_set_color(c_white);

if (_click && point_in_rectangle(_mx, _my, _x, 500, _x + _btn_w, 500 + _btn_h))
{
    game_end();
}

// 5. CLEANUP
draw_set_halign(fa_left);
draw_set_valign(fa_top);