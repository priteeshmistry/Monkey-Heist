if (!paused)
{
    paused = true;
    
    // 1. Take Screenshot of the small game view
    var _w = surface_get_width(application_surface);
    var _h = surface_get_height(application_surface);
    screenshot = sprite_create_from_surface(application_surface, 0, 0, _w, _h, false, false, 0, 0);
    
    // 2. Freeze the game
    instance_deactivate_all(true);
}
else
{
    // UNPAUSE
    paused = false;
    if (sprite_exists(screenshot)) sprite_delete(screenshot);
    instance_activate_all();
}