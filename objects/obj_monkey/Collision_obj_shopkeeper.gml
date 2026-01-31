//// 1. Check if we are caught
//// Note: If 'has_shadow_mask' is false, 'is_invisible' is automatically false.

//if (is_invisible == false)
//{
//    // CAUGHT!
//    audio_stop_all(); // Kill music
//    room_goto(Room_GameOver); // Go to Busted screen
//}
//else
//{
//    // SAFE! (Visual feedback)
//    // You can add a sound effect here like "whoosh"
//}
room_goto(Room_GameOver);