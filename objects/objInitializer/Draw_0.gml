/// @description Check controllers
if (room==rmInitialize)
{
	draw_set_color(c_white);
	if (scrNoGamepads()) {
		draw_text(0, 0, "Please connect a gamepad.");	
	}
	else
	{
		for(var i=0; i<gamepad_get_device_count(); i++) 
		{
			if (global.gp[i])
			{
				draw_text(0, i*14, "Gamepad "+string(i)+": ");
				if (in_c(Keys.Left, i))		{ draw_text(100, i*14, "Left "	+string(in_c(Keys.Left, i))); }
				if (in_c(Keys.Right, i))	{ draw_text(200, i*14, "Right "	+string(in_c(Keys.Right, i))); }
				if (in_c(Keys.Up, i))		{ draw_text(300, i*14, "Up "	+string(in_c(Keys.Up, i))); }
				if (in_c(Keys.Down, i))		{ draw_text(400, i*14, "Down "	+string(in_c(Keys.Down, i))); }
			}
		}
	}
}