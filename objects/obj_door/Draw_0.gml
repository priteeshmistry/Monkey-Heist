draw_self(); // Draw the door sprite

// ONLY draw text if the variable is TRUE
if (show_popup == true) 
{
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    draw_text(x + 16, y - 40, "NEED " + string(required_loot) + " BANANAS!");
    draw_set_halign(fa_left); // Reset alignment
    draw_set_color(c_white);  // Reset color
}