// Draw the shopkeeper himself
draw_self();

// Draw the cone attached to him
// x, y: Position (same as shopkeeper)
// image_xscale, image_yscale: Size (1 = normal)
// image_angle: Rotation (same as shopkeeper)
// c_white: Color tint
// 0.3: Alpha (30% opacity, so we can see the floor through it)
//draw_sprite_ext(spr_cone, 0, x, y, 1, 1, image_angle, c_white, 0.3);