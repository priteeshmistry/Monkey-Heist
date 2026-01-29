// 1. Check if surface exists (surfaces are volatile and can disappear)
if (!surface_exists(surf))
{
    surf = surface_create(room_width, room_height);
}

// 2. Target the surface to start drawing ON IT
surface_set_target(surf);

// 3. Clear it with black color (The Darkness)
draw_clear_alpha(c_black, 0.85); // 0.85 is opacity. 1.0 is pitch black.

// 4. CHANGE BLENDING MODE to "Subtract" (We are now erasing darkness)
gpu_set_blendmode(bm_subtract);

// --- START CUTTING HOLES ---

// A. Hole around the Monkey (Player Vision)
if (instance_exists(obj_monkey))
{
    // Draw a soft circle around the monkey
    // You can use a sprite gradient for a smoother look, but circle works for now
    // Draw the fuzzy sprite instead of the hard circle
// vary the scale slightly (random_range) to make the light "flicker" like a candle/lamp
var _flicker = random_range(0.95, 1.05);
draw_sprite_ext(spr_light_glow, 0, obj_monkey.x, obj_monkey.y, _flicker, _flicker, 0, c_white, 1);
}

// B. Hole around the Shopkeeper (Flashlight)
with (obj_shopkeeper)
{
    // Cut a hole for his vision cone
    draw_sprite_ext(spr_cone, 0, x, y, 3.5, 3.5, image_angle, c_white, 1);
}

// --- STOP CUTTING HOLES ---

// 5. Reset Blending Mode
gpu_set_blendmode(bm_normal);

// 6. Stop drawing on the surface
surface_reset_target();

// 7. DRAW THE SURFACE to the screen
draw_surface(surf, 0, 0);