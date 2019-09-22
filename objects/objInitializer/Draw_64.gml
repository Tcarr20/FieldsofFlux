/// @description Draw Ready & Go
if (room == rmBigLevel)
{
	if (count < 60)
	{
		draw_sprite(sprReady, count, window_get_width()/4, window_get_height()/4);	
	}
	else if (count >= 60 && count < 90)
	{
		draw_sprite(sprFlux, count, window_get_width()/4, window_get_height()/4);	
	}
}
