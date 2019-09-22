/// @description Insert description here
// You can write your code in this editor
life++;
t_y = round((ystart - sprite_height) + (sin(life / (8*pi))*12));
if (place_meeting(x, y, objPlayer))
{
	ready = true;
	image_index = 1;
}
else
{
	ready = false;
	image_index = 0;
}