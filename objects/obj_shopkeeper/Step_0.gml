// --- PART 1: MOVEMENT & PATROL ---

// Check if he hits the left (0) or right (room_width) edge
if (x < 0 || x > room_width)
{
    // Reverse direction
    hspeed = -hspeed;
}

// Face the direction we are moving
if (hspeed != 0)
{
    if (hspeed > 0) image_angle = 0;   // Facing Right
    else image_angle = 180;            // Facing Left
}


// --- PART 2: VISION & KILL LOGIC ---

// Check if Monkey exists (to prevent crash if he's already dead)
if (instance_exists(obj_monkey))
{
    // Are we close enough? (View Distance e.g., 200 pixels)
    var _distance = point_distance(x, y, obj_monkey.x, obj_monkey.y);
    
    if (_distance < 200) 
    {
        // Are we facing the monkey?
        var _angle_to_monkey = point_direction(x, y, obj_monkey.x, obj_monkey.y);
        
        // Calculate difference between our facing direction and the monkey
        var _diff = angle_difference(image_angle, _angle_to_monkey);
        
        // If the difference is small (inside the cone)
        if (abs(_diff) < 45)
        {
            // Is the monkey visible?
            if (obj_monkey.is_invisible == false)
            {
                // CAUGHT!
                score = 0;
				audio_play_sound(snd_die, 10, false);
                room_restart();
            }
        }
    }
}