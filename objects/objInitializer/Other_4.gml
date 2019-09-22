/// @description Room setup
if (room == rmPreLim)
{
	count = 0;
	for(var i=0; i<gamepad_get_device_count(); i++)
	{
		if (global.gp[i])
		{
			global.player[i] = instance_create_layer(global.p_start_x[i], global.p_start_y[i], "Entity", objPlayer);
			global.player[i].p_num = i;
			with (global.player[i]) { alarm[0] = 1; }
		}
	}
	instance_create_layer(0, 0, "Control", effBloom);
	//instance_create_layer(room_width/2, room_height/2, "Control", objCamera);
	global.follow_obj = instance_create_layer(0, 0, "Control", objPlayerCenter);
}
if (room == rmPreLim2)
{
	count = 0;
	for(var i=0; i<gamepad_get_device_count(); i++)
	{
		if (global.gp[i])
		{
			global.player[i] = instance_create_layer(global.p_start_x[i], global.p_start_y[i], "Entity", objPlayer);
			global.player[i].p_num = i;
			with (global.player[i]) { alarm[0] = 1; }
		}
	}
	instance_create_layer(0, 0, "Control", effBloom);
	//instance_create_layer(room_width/2, room_height/2, "Control", objCamera);
	global.follow_obj = instance_create_layer(0, 0, "Control", objPlayerCenter);
}
else if (room == rmBigLevel)
{
	global.cutscene = true;
	count = 0;
	for(var i=0; i<gamepad_get_device_count(); i++)
	{
		if (global.gp[i])
		{
			//global.player[i] = instance_create_layer(global.p_start_x[i], global.p_start_y[i], "Entity", objPlayer);
			//global.player[i].p_num = i;
			//with (global.player[i]) { alarm[0] = 1; }
		}
	}
	instance_create_layer(0, 0, "Control", effBloom);
	instance_create_layer(room_width/2, room_height/2, "Control", objCamera);
	global.follow_obj = instance_create_layer(0, 0, "Control", objPlayerCenter);
}

