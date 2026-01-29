// Check if there is another room after this one
if (room_exists(room_next(room)))
{
    // Go to it
    room_goto_next();
}
else
{
    // If no more rooms exist (You beat the game), restart or show a message.
    // For now, let's just loop back to the start.
    room_goto(Room1); 
}