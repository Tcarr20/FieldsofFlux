/// @description Give Power
if (!wait)
{
	if (other.attack = Powers.Dash || other.attack == Powers.Rocket || (other.attack == Powers.Pound && other.vy > 1) || (other.attack == Powers.Bubble && other.vy > 1))
	{
		scrPlayOnce(sndPowerup);
		myUi = instance_create_layer(x, y, "Control", objItemUI);
		myUi.myPlayer = other;
		myUi.sprite_index = sprite_index;
		with(myUi)
		{
			TargetX = objUi.PlayerUiX;
			TargetY = objUi.PlayerUiY;
			mySpeed = 30;
		}
		other.power_new = abil;
		with(other) { event_perform(ev_other,ev_user0); }
		instance_destroy();
	}
}