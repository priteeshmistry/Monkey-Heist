//// 1. Destroy the mask so we can't pick it up twice
//instance_destroy(other);

//// 2. Turn on invisibility
//is_invisible = true;

//// 3. Change sprite alpha (transparency) so the player KNOWS they are invisible
//image_alpha = 0.5; 

//// 4. Set a timer for 5 seconds (60 frames * 5 seconds = 300)
//alarm[0] = 300;