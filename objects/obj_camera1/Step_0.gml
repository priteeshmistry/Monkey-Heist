// 1. Check if monkey exists
if (instance_exists(obj_monkey))
{
    // 2. Calculate where the camera SHOULD be (Monkey's position)
    var _target_x = obj_monkey.x;
    var _target_y = obj_monkey.y;

    // 3. Smoothly move current x/y towards target x/y (Linear Interpolation)
    x = lerp(x, _target_x, follow_speed);
    y = lerp(y, _target_y, follow_speed);
}

// 4. Clamp camera so it doesn't show the black void outside the room
// (Assumes room is larger than the camera view)
var _half_w = cam_width / 2;
var _half_h = cam_height / 2;
x = clamp(x, _half_w, room_width - _half_w);
y = clamp(y, _half_h, room_height - _half_h);

// 5. Apply coordinates to the actual game camera
// We subtract half width/height to center the view on the object
camera_set_view_pos(view_camera[0], x - _half_w, y - _half_h);