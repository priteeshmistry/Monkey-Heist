// Set color to white
draw_set_font(fnt_gui_large);
draw_set_color(c_white);

// Set alignment (Top Left)
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw Score at position (10, 10) on the screen
draw_text(10, 10, "Score: " + string(score));

// Optional: Draw "INVISIBLE!" text if the monkey is using the mask
if (instance_exists(obj_monkey))
{
    if (obj_monkey.is_invisible)
    {
        draw_set_color(c_red);
        draw_text(10, 30, "INVISIBLE MODE ACTIVE!");
    }
}