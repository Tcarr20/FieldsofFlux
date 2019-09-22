/// @description Collisions
if (place_meeting(x, y, objSolidPar) || place_meeting(x, y, objGappleHand))
{
	hspeed=0;
	hit = true;
	while (place_meeting(x + image_xscale, y, objSolidPar)) { x-=image_xscale; }
}

if (!instance_exists(myPlayer)) { instance_destroy(); }