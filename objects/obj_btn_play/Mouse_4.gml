// 1. Reset the score to 0
score = 0;

// Delete the old save file so we start fresh
if (file_exists("monkey_save.ini"))
{
    file_delete("monkey_save.ini");
}

room_goto(Room_Intro);