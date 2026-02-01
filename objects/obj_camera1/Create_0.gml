// Define the target resolution
cam_width = 640;
cam_height = 360;

// How fast the camera follows (lower = smoother/lazier)
follow_speed = 0.1;

// Center the camera on the monkey initially
if (instance_exists(obj_monkey))
{
    x = obj_monkey.x;
    y = obj_monkey.y;
}