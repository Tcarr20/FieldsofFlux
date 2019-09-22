/// @description Give Power
if (!wait)
{
	scrPlayOnce(sndPowerup);
	myUi = instance_create_layer(x, y, "Control", objItemUI);
	myUi.myPlayer = other.myPlayer;
	myUi.sprite_index = sprite_index;
	with(myUi)
	{
		TargetX = objUi.PlayerUiX;
		TargetY = objUi.PlayerUiY;
		mySpeed = 30;
	}
	other.myPlayer.power_new = abil;
	with(other.myPlayer) { event_perform(ev_other,ev_user0); }
	instance_destroy();
}