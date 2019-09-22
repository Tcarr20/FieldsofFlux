/// @description Move on
if (room == rmInitialize) {room_goto_next();}
else if (room == rmPreLim)
{
	var start = 0;
	for(var i=0; i<instance_number(objPlayer); i++)
	{
		var p = instance_find(objPlayer, i);
		start += in_c(Keys.Start, p.p_num);
	}
	if (start == instance_number(objPlayer)) 
	{ 
	    for(var i=0; i<instance_number(objPlayer); i++)
	    {
	        var p = instance_find(objPlayer,i)
	        for(var j=0; j<3; j++)
	        {
	            if(p.p_num = 0){ P1Pow[j] = p.powers[j]; }
	            if(p.p_num = 1){ P2Pow[j] = p.powers[j]; }
	            if(p.p_num = 2){ P3Pow[j] = p.powers[j]; }
	            if(p.p_num = 3){ P4Pow[j] = p.powers[j]; }
	        }
	    }
		room_goto_next(); 
	}
}
else if (room == rmPreLim2)
{
	var start = 0;
	for(var i=0; i<instance_number(objReadyPlatform); i++)
	{
		var p = instance_find(objReadyPlatform, i);
		start += p.ready;
	}
	if (start == instance_number(objPlayer)) 
	{ 
	    for(var i=0; i<instance_number(objPlayer); i++)
	    {
	        var p = instance_find(objPlayer,i)
	        for(var j=0; j<3; j++)
	        {
	            if(p.p_num = 0){ P1Pow[j] = p.powers[j]; }
	            if(p.p_num = 1){ P2Pow[j] = p.powers[j]; }
	            if(p.p_num = 2){ P3Pow[j] = p.powers[j]; }
	            if(p.p_num = 3){ P4Pow[j] = p.powers[j]; }
	        }
	    }
		audio_stop_sound(sndMenu);
		room_trans(rmBigLevel); 
	}
}
else if (room == rmBigLevel)
{
	if (count < 90)
	{
		count++;
		if (count == 5)
		{
			if (global.gp[0])
			{
				global.player[0] = instance_create_layer(global.p_start_x[0], global.p_start_y[0], "Entity", objPlayer);
				global.player[0].p_num = 0;
				global.player[0].powers[0] = P1Pow[0];
				global.player[0].powers[1] = P1Pow[1];
				global.player[0].powers[2] = P1Pow[2];
				with (global.player[0]) { alarm[0] = 1; }
			}
		}
		else if (count == 10)
		{
			if (global.gp[1])
			{
				global.player[1] = instance_create_layer(global.p_start_x[1], global.p_start_y[1], "Entity", objPlayer);
				global.player[1].p_num = 1;
				global.player[1].powers[0] = P2Pow[0];
				global.player[1].powers[1] = P2Pow[1];
				global.player[1].powers[2] = P2Pow[2];
				with (global.player[1]) { alarm[0] = 1; }
			}
		}
		else if (count == 15)
		{
			if (global.gp[2])
			{
				global.player[2] = instance_create_layer(global.p_start_x[2], global.p_start_y[2], "Entity", objPlayer);
				global.player[2].p_num = 2;
				global.player[2].powers[0] = P3Pow[0];
				global.player[2].powers[1] = P3Pow[1];
				global.player[2].powers[2] = P3Pow[2];
				with (global.player[2]) { alarm[0] = 1; }
			}
		}
		else if (count == 20)
		{
			if (global.gp[3])
			{
				global.player[3] = instance_create_layer(global.p_start_x[3], global.p_start_y[3], "Entity", objPlayer);
				global.player[3].p_num = 3;
				global.player[3].powers[0] = P4Pow[0];
				global.player[3].powers[1] = P4Pow[1];
				global.player[3].powers[2] = P4Pow[2];
				with (global.player[3]) { alarm[0] = 1; }
			}
		}
		else if (count == 60)
		{
			global.cutscene = false;
		}
	}
	/// Victory
	if (instance_number(objPlayer) == 1) 
	{
		global.victory = objPlayer.p_num;
		global.cutscene = true;
		cut_time++;
		if (cut_time == 40) 
		{ 
			audio_stop_sound(sndFightMusic);
			cut_time=0; 
			room_trans(rmVictory); 
		}
	}
}
