// Play music, priority 10, loop = true
if (!audio_is_playing(snd_music_main))
{
    audio_play_sound(snd_music_main, 10, true);
}