// Hover Effect
if (position_meeting(mouse_x, mouse_y, id)) { image_alpha = 0.8; }
else { image_alpha = 1; }

// Click Logic
if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left))
{
    // Tell the Pause Manager to Unpause
    with (obj_pause_manager)
    {
        paused = false;
        if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();

        // Destroy the pause buttons
        instance_destroy(obj_btn_resume);
        instance_destroy(obj_btn_menu);
        instance_destroy(obj_btn_exit);
    }
}