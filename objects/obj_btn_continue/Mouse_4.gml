if (file_exists("monkey_save.ini"))
{
    // 1. Load the Room Name
    ini_open("monkey_save.ini");
    var _saved_room = ini_read_real("SaveData", "CurrentLevel", Room1);
    ini_close();
    
    // 2. FORCE THE SCORE BASED ON THE ROOM
    // If we are in Room 2, we assume we beat Room 1 (which needed 50 points)
    if (_saved_room == Room2)
    {
        score = 50;
    }
    else
    {
        score = 0; // Default for Room 1
    }
    
    // 3. Go to the room
    room_goto(_saved_room);
}