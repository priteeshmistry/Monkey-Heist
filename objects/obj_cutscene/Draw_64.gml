// 1. Draw the Background Image (The Slide)
// Stretch it to fill the screen (1280x720)
draw_sprite_stretched(slides[current_page], 0, 0, 0, 1280, 720);

// 2. Draw the Text Box (Black Rectangle at bottom)
draw_set_color(c_black);
draw_set_alpha(0.8); // Make it slightly transparent
draw_rectangle(0, 550, 1280, 720, false);
draw_set_alpha(1); // Reset alpha

// 3. Draw the Text
draw_set_font(fnt_gui_large); // Use your retro font
draw_set_color(c_white);
draw_set_halign(fa_center);

// Draw text in the middle of the box
draw_text_ext(640, 600, text[current_page], 30, 1000);

// 4. Draw "Press Space" hint
draw_set_font(-1); // Switch to small font for hint
draw_text(1100, 680, "Press SPACE >>");

// Reset alignment
draw_set_halign(fa_left);