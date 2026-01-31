locked = true;
image_speed = 0;
image_index = 0;

// --- SET DIFFICULTY BASED ON ROOM ---
if (room == Room1)
{
    required_loot = 50;  // Level 1 Target
}
else if (room == Room2)
{
    required_loot = 100; // Level 2 Target (50 from Lvl 1 + 50 new ones)
}
else
{
    required_loot = 150; // Default for later levels
}

// Variable to control the "Locked" text popup
show_popup = false;
alarm[0] = -1; // Timer to hide the popup