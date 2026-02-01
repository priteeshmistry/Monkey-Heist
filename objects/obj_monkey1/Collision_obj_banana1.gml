// Destroy the specific banana we just touched
instance_destroy(other);
audio_play_sound(snd_eat, 1, false);
// Increase score (this is a built-in GameMaker variable)
score = score + 10;

// Verify it works in the Output window
show_debug_message("Banana Eaten! Current Score: " + string(score));
