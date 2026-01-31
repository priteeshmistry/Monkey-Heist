// 1. CHECK IF WE HAVE ENOUGH BANANAS
if (score >= required_loot)
{
    // --- SUCCESS SEQUENCE ---
    locked = false;
    image_index = 1; // Show open sprite
    audio_stop_all();

    // --- DETERMINE NEXT ROOM ---
    var _next_room = Room_Win; 
    if (room == Room1) _next_room = Room2;
    else if (room == Room2) _next_room = Room_Win;

    // --- SAVE THE GAME ---
    if (_next_room != Room_Win)
    {
        ini_open("monkey_save.ini");
        ini_write_real("SaveData", "CurrentLevel", _next_room);
        ini_close();
    }

    // --- GO THERE ---
    room_goto(_next_room);
}
else
{
    // --- FAILURE SEQUENCE ---
    // We don't have enough points yet!
    show_popup = true;
    alarm[0] = 60; // Show the text for 1 second
}