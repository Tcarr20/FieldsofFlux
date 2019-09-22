/// @description HUD
if (global.cutscene) { exit; }
if(myPlayer!=noone)
{
	playerNum = myPlayer.p_num;
	if(playerNum != -4)
	{
		switch(playerNum)
		{
			case 0:
				//top left p1
				PlayerUiX= UiOffset;
				PlayerUiY= UiOffset;
			break;
			case 1:
				//top Right p2
				PlayerUiX= viewWidth - UiOffset;
				PlayerUiY= UiOffset;
			break;
			case 2:
				//Bot Left p3
				PlayerUiX= UiOffset;
				PlayerUiY= viewHieght-UiOffset;
			break;
			case 3:
				//bot Right p4
				PlayerUiX= viewWidth -UiOffset;
				PlayerUiY= viewHieght -UiOffset;
			break;
		}
		draw_sprite_ext(sprIconWheel,0,PlayerUiX,PlayerUiY,1,1,0,c_white, 0.7);
	}


		switch(myPlayer.powers[0])
		{
			case Powers.Pound:
			draw_sprite(sprIconPound,0,PlayerUiX-28,PlayerUiY)
			break;
			case Powers.Rocket:
			draw_sprite(sprIconRocket,0,PlayerUiX-28,PlayerUiY)
			break;
			case Powers.Bubble:
			draw_sprite(sprIconBounce,0,PlayerUiX-28,PlayerUiY)
			break;
			case Powers.Cannon:
			draw_sprite(sprIconCannon,0,PlayerUiX-28,PlayerUiY)
			break;
			case Powers.Dash:
			draw_sprite(sprIconDash,0,PlayerUiX-28,PlayerUiY)
			break;
			case Powers.Grab:
			draw_sprite(sprIconGrapple,0,PlayerUiX-28,PlayerUiY)
			break;
		}
		switch(myPlayer.powers[1])
		{
			case Powers.Pound:
			draw_sprite(sprIconPound,0,PlayerUiX,PlayerUiY-28)
			break;
			case Powers.Rocket:
			draw_sprite(sprIconRocket,0,PlayerUiX,PlayerUiY-28)
			break;
			case Powers.Bubble:
			draw_sprite(sprIconBounce,0,PlayerUiX,PlayerUiY-28)
			break;
			case Powers.Cannon:
			draw_sprite(sprIconCannon,0,PlayerUiX,PlayerUiY-28)
			break;
			case Powers.Dash:
			draw_sprite(sprIconDash,0,PlayerUiX,PlayerUiY-28)
			break;
			case Powers.Grab:
			draw_sprite(sprIconGrapple,0,PlayerUiX,PlayerUiY-28)
			break;
		}
		switch(myPlayer.powers[2])
		{
			case Powers.Pound:
			draw_sprite(sprIconPound,0,PlayerUiX+28,PlayerUiY)
			break;
			case Powers.Rocket:
			draw_sprite(sprIconRocket,0,PlayerUiX+28,PlayerUiY)
			break;
			case Powers.Bubble:
			draw_sprite(sprIconBounce,0,PlayerUiX+28,PlayerUiY)
			break;
			case Powers.Cannon:
			draw_sprite(sprIconCannon,0,PlayerUiX+28,PlayerUiY)
			break;
			case Powers.Dash:
			draw_sprite(sprIconDash,0,PlayerUiX+28,PlayerUiY)
			break;
			case Powers.Grab:
			draw_sprite(sprIconGrapple,0,PlayerUiX+28,PlayerUiY)
			break;
		}

}

