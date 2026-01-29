// Input check
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Calculate movement axis (1, -1, or 0)
var _xinput = _right - _left;
var _yinput = _down - _up;

// Apply movement
x += _xinput * move_speed;
y += _yinput * move_speed;