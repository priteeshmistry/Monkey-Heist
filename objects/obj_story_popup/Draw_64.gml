// 1. Darken the background (Full Screen Black)
draw_set_alpha(0.9); // Make it very dark
draw_set_color(c_black);
draw_rectangle(0, 0, 1280, 720, false);
draw_set_alpha(1);

// 2. DRAW THE MASK IMAGE (Centered)
// We scale it up 2x so it looks impressive
draw_sprite_ext(mask_sprite, 0, 640, 300, 1, 1, 0, c_white, 1);

// 3. Draw Title (Moved down slightly to fit under the mask)
draw_set_halign(fa_center);
draw_set_font(fnt_gui_large);
draw_set_color(c_purple); 
draw_text(640, 500, title); // Moved to Y=500

// 4. Draw Lore
draw_set_color(c_white);
draw_text_ext(640, 560, lore, 30, 800); // Moved to Y=560

// 5. Draw Tutorial
draw_set_color(c_yellow);
draw_text(640, 650, tutorial); // Moved to Y=650

// Reset Alignment
draw_set_halign(fa_left);