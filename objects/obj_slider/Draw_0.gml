// 1. Draw the Slider parts (Bar and Knob)
draw_sprite(spr_slider_bar, 0, x, y);
var _knob_x = x + (value * max_width);
draw_sprite(spr_slider_knob, 0, _knob_x, y);

// 2. TEXT SETUP
draw_set_font(fnt_gui_large); // Use your new font
draw_set_halign(fa_left);     // Align text to the left
draw_set_valign(fa_middle);   // Align text to the middle of the height

// 3. THE "DROP SHADOW" TRICK (Draw black text slightly offset)
var _text_x = x + max_width + 15; // Position it to the right of the bar
var _text_string = string(round(value * 100)) + "%";

draw_set_color(c_black);
draw_text(_text_x + 2, y + 2, _text_string); // Draw Shadow 2 pixels down/right

// 4. DRAW MAIN TEXT
draw_set_color(c_white); // Or c_yellow, whatever looks good
draw_text(_text_x, y, _text_string);

// 5. CLEANUP (Always reset these or other objects will look weird)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);