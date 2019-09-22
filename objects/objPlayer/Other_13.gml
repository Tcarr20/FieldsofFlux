/// @description Clash
if (instance_exists(clash) && !hitstun && !hitstop)
{
	hitstun = stun_time;
	hitstop = stop_time;
	clash.hitstun = stun_time;
	clash.hitstop = stop_time;
	room_speed = 5;
	var i1 = irandom(2), i2 = irandom(2), p1 = powers[i1], p2 = clash.powers[i2], temp;
	while (p1 == Powers.None) { p1 = powers[++i1 mod 3]; }
	while (p2 == Powers.None) { p2 = clash.powers[++i2 mod 3]; }
	powers[i1] = p2;
	clash.powers[i2] = p1;
	
	/// Effect
	
	/// Finished
	clash = noone;
}