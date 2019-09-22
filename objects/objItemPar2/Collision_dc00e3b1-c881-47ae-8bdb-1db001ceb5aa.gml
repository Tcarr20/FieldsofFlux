/// @description Give Power
if (!wait)
{
	audio_play_sound(sndPowerup,1,0)
	myUi = instance_create_layer(x, y, "Control", objItemUI);
	myUi.myPlayer = other.owner;
	myUi.sprite_index = sprite_index;
	with(myUi)
	{
		TargetX = objUi.PlayerUiX;
		TargetY = objUi.PlayerUiY;
		mySpeed = 30;
	}
	other.owner.power_new = abil;
	with(other.owner) { event_perform(ev_other,ev_user0); }
	instance_destroy();
}