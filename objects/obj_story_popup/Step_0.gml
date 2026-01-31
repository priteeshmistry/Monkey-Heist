// Check Space, Enter, or Mouse Click
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left))
{
    // 1. Wake everyone up
    instance_activate_all(); 
    
    // 2. Destroy this popup
    instance_destroy();
}