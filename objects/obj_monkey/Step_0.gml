// --- PART 1: INPUT CALCULATION ---
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Calculate movement axis (1, -1, or 0)
var _xinput = _right - _left;
var _yinput = _down - _up;

// --- PART 2: MOVEMENT PHYSICS (WITH COLLISIONS) ---

// 1. Horizontal Collision
if (place_meeting(x + _xinput * move_speed, y, obj_wall))
{
    while (!place_meeting(x + sign(_xinput), y, obj_wall))
    {
        x += sign(_xinput);
    }
    _xinput = 0; 
}
x += _xinput * move_speed;

// 2. Vertical Collision
if (place_meeting(x, y + _yinput * move_speed, obj_wall))
{
    while (!place_meeting(x, y + sign(_yinput), obj_wall))
    {
        y += sign(_yinput);
    }
    _yinput = 0;
}
y += _yinput * move_speed;

// --- PART 3: ANIMATION LOGIC ---

if (_xinput != 0)
{
    if (_xinput > 0) sprite_index = spr_monkey_right;
    else sprite_index = spr_monkey_left;
    image_speed = 1;
}
else if (_yinput != 0)
{
    if (_yinput > 0) sprite_index = spr_monkey_down;
    else sprite_index = spr_monkey_up;
    image_speed = 1;
}
else
{
    image_speed = 0;
    image_index = 0; 
}

// --- PART 4: DEPTH SORTING ---
depth = -y; 

// --- PART 5: STORY ABILITY (THE SHADOW MASK) ---
// This is the new part. We only allow invisibility IF we found the mask.

if (has_shadow_mask == true)
{
    // Check input AND stamina
    if (keyboard_check(vk_shift) && stamina > 0)
    {
        is_invisible = true;
        image_alpha = 0.5; // Turn semi-transparent (Visual feedback)
        stamina -= 1;      // Drain energy
    }
    else
    {
        is_invisible = false;
        image_alpha = 1;   // Return to normal
        
        // Regen stamina when not using it
        if (stamina < max_stamina) 
        {
            stamina += 0.5; 
        }
    }
}
else
{
    // If we don't have the mask yet, ensure we are visible
    is_invisible = false;
    image_alpha = 1;
}