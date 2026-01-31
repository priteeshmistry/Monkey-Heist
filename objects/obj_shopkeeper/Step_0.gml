// --- PART 1: MOVEMENT & PATROL ---

//// Check if he hits the left (0) or right (room_width) edge
//if (x < 0 || x > room_width)
//{
//    // Reverse direction
//    hspeed = -hspeed;
//}

//// Face the direction we are moving


// --- PART 1: MOVEMENT ---
if (place_meeting(x + hspeed, y, obj_wall) || x < 0 || x > room_width)
{
    hspeed = -hspeed;
}

// --- PART 2: FACING (The Fix) ---
if (hspeed != 0)
{
    // Use xscale to mirror the sprite horizontally (Facing Right = 1, Left = -1)
    image_xscale = sign(hspeed); 
    
    // FORCE angle to 0 so he doesn't flip vertically
    image_angle = 0; 
    
    // Set our mathematical vision direction
    if (hspeed > 0) vision_angle = 0;
    else vision_angle = 180;
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
        //var _angle_to_monkey = point_direction(x, y, obj_monkey.x, obj_monkey.y);
        
        //// Calculate difference between our facing direction and the monkey
        //var _diff = angle_difference(image_angle, _angle_to_monkey);
        var _angle_to_monkey = point_direction(x, y, obj_monkey.x, obj_monkey.y);
		var _diff = angle_difference(vision_angle, _angle_to_monkey); // Use vision_angle here
        // If the difference is small (inside the cone)
        if (abs(_diff) < 45)
        {
            // Is the monkey visible?
            if (obj_monkey.is_invisible == false)
            {
                // CAUGHT!
                score = 0;
				audio_play_sound(snd_die, 10, false);
                room_goto(Room_GameOver);
            }
        }
    }
}

// Depth Sorting: The lower we are on screen (higher y), the closer we are to camera (lower depth)
depth = -y;