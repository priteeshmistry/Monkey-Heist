// 1. Pause everything EXCEPT this object
instance_deactivate_all(true);


// 2. Double-check that WE are still active (Safety)
instance_activate_object(id);

// ACTIVATE YOUR MANAGERS (If you have them)
// If you have a pause manager or game manager, wake them up too:
if (instance_exists(obj_pause_manager)) instance_activate_object(obj_pause_manager);
if (instance_exists(obj_game_manager)) instance_activate_object(obj_game_manager);