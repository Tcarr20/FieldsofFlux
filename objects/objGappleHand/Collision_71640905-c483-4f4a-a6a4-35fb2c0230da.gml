/// @description Snag player
if (other != myPlayer && hspeed != 0)
{
	myPlayer.retract = true;
	with (other) 
	{
		vx = 0;
		vy = 0;
		event_perform(ev_other, ev_user1);
	}
	if (other.hitstop<2) { other.hitstop = 2; }
	if (other.hitstun<2) { other.hitstun = 2; }
}