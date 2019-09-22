/// @description Motion
/// Gravity & Friction
if (on_ground)
{
	if (!place_meeting(x, y + 1, objSolidPar)) { on_ground = false; }
	vx = approach(vx, 0, move_fric);
}
else { vy+=fall_grav; }

/// Destruction
if (!vx && !vy && on_ground)
{
	life++;
	if ((life > 30) && (life mod 30 < 15)) { visible = false; }
	else { visible = true; }
	if (life >= 90) { instance_destroy(); }
}

/// Countdown
if (wait > 0) { wait--; }

///Sub-pixel movement
var mx, my;
cx += vx;
cy += vy;
mx = round(cx);
my = round(cy);
cx -= mx;
cy -= my;
repeat(abs(mx)) 
{
	if (!place_meeting(x+sign(mx), y, objSolidPar)) { x+=sign(mx); }
	else 
	{ 
		vx = -(vx*0.8); 
		if (abs(vx) < move_fric) { vx = 0; }
		break; 
	}
}
repeat(abs(my)) 
{
	if (!place_meeting(x, y+sign(my), objSolidPar)) { y+=sign(my); }
	else
	{ 
		vy = -(vy*0.7);
		vx -= (sign(mx)*move_fric*0.6);
		if (abs(vy) < 0.5) { on_ground = true; vy = 0; }
		break; 
	}
}
while (place_meeting(x, y, objSolidPar)) { y--; }