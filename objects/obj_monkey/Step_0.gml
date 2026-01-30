// --- PART 1: INPUT CALCULATION ---
// We must do this FIRST so _xinput exists for the rest of the code

var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Calculate movement axis (1, -1, or 0)
var _xinput = _right - _left;
var _yinput = _down - _up;

// --- PART 2: MOVEMENT PHYSICS (WITH COLLISIONS) ---

// 1. Horizontal Collision
// Check if moving 'move_speed' pixels to the side would hit a wall
if (place_meeting(x + _xinput * move_speed, y, obj_wall))
{
    // If we would hit a wall, stop moving in that direction
    while (!place_meeting(x + sign(_xinput), y, obj_wall))
    {
        x += sign(_xinput);
    }
    _xinput = 0; // Stop the input so we don't slide
}
x += _xinput * move_speed;

// 2. Vertical Collision
// Check if moving 'move_speed' pixels up/down would hit a wall
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

// 1. Check Horizontal Movement
if (_xinput != 0)
{
    // Set sprite based on direction
    if (_xinput > 0) sprite_index = spr_monkey_right;
    else sprite_index = spr_monkey_left;
    
    image_speed = 1;
}
// 2. Check Vertical Movement (Only if not moving horizontally)
else if (_yinput != 0)
{
    if (_yinput > 0) sprite_index = spr_monkey_down;
    else sprite_index = spr_monkey_up;
    
    image_speed = 1;
}
// 3. No Movement (Idle)
else
{
    image_speed = 0;
    image_index = 0; 
}

// --- PART 4: DEPTH SORTING ---
// Ensure we stand behind objects that are lower than us
depth = -y;