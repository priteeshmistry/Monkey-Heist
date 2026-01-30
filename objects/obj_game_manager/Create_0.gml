// --- 1. SINGLETON CHECK ---
// If I am not the original manager, I must disappear.
if (instance_number(obj_game_manager) > 1)
{
    instance_destroy();
    exit;
}

// --- 2. PERSISTENCE ---
persistent = true;

// --- 3. AUDIO LOGIC ---
// Initialize Volume
if (!variable_global_exists("master_volume"))
{
    global.master_volume = 1;
}

// *** THE FIX ***
// Check if the specific song is ALREADY playing.
// ... (Your Singleton and Persistence code here) ...

if (!audio_is_playing(snd_music_main)) 
{
    // Print a message to the Output window at the bottom
    show_debug_message("MUSIC STARTED BY: " + object_get_name(object_index) + " IN ROOM: " + room_get_name(room));
    
    audio_play_sound(snd_music_main, 1000, true);
}
else
{
    show_debug_message("MUSIC BLOCKED (Already Playing) IN ROOM: " + room_get_name(room));
}
// If it IS playing, this code does nothing. The music continues.