// 1. Check: Does a popup ALREADY exist?
audio_play_sound(snd_mask, 1, false);
if (!instance_exists(obj_story_popup))
{
    // 2. Grant Power
    other.has_shadow_mask = true;

    // 3. Create the Story Popup
    instance_create_layer(0, 0, "Instances", obj_story_popup);
    
    // 4. Destroy the Mask
    instance_destroy();
}