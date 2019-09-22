/// @description Screen Wrapping
if (x > room_width) { x = 0; }
else if (x < 0) { x = room_width; }
if (y > room_height) { y = 0; }
else if (y < 0) { y = room_height; }