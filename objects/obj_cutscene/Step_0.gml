// Go to next slide when Space is pressed
if (keyboard_check_pressed(vk_space))
{
    if (current_page < total_pages)
    {
        current_page += 1; // Next page
        // Optional: Play a "page turn" sound here
    }
    else
    {
        // END OF STORY - Start the Game
        room_goto(Room1); // Or Room_Level1
    }
}