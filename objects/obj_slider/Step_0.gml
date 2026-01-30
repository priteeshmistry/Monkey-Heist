// 1. Check for Mouse Click
if (mouse_check_button_pressed(mb_left))
{
    // Check if mouse is touching the knob OR the bar
    var _button_x = x + (value * max_width);
    if (point_in_circle(mouse_x, mouse_y, _button_x, y, 20) || position_meeting(mouse_x, mouse_y, self))
    {
        is_dragging = true;
    }
}

// 2. Release Mouse
if (mouse_check_button_released(mb_left))
{
    is_dragging = false;
}

// 3. Logic while dragging
if (is_dragging)
{
    // Calculate value based on mouse position relative to the bar's start (x)
    var _xx = mouse_x - x;
    
    // Clamp it so you can't drag past the ends (0 to 1)
    value = clamp(_xx / max_width, 0, 1);
    
    // UPDATE THE REAL VOLUME
    global.master_volume = value;
    audio_master_gain(global.master_volume);
}