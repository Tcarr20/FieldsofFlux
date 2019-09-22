/// @description Motion

start = in_c(Keys.Start,p_num);
switch (attack)
{
	case Powers.None:
		// sound reset
		usedPowerSnd[0] = false;
		usedPowerSnd[1] = false;
		usedPowerSnd[2] = false;
		/// Move Left
		if (in_c(Keys.Right, p_num) && !global.cutscene && !hitstop) 
		{ 
			// Moving
			if (skidding) { vx+=(move_acc*0.4); scrPlayOnce(sndSkidGoo)}
			else { vx+=move_acc; }
		}
		else if (vx > 0) 
		{
			// Friction
			if (on_ground) 
			{ 
				if (skidding) { vx-=(move_fric*0.5); scrPlayOnce(sndSkidGoo)}
				else { vx-=move_fric; }
			}
			else { vx-=(move_fric*0.6) }
		}

		/// Move Right
		if (in_c(Keys.Left, p_num) && !global.cutscene && !hitstop)  
		{ 
			// Moving
			if (skidding) { vx-=(move_acc*0.4); scrPlayOnce(sndSkidGoo)}
			else { vx-=move_acc; }
		} 
		else if (vx < 0) 
		{
			// Friction
			if (on_ground) 
			{ 
				if (skidding) { vx+=(move_fric*0.5); scrPlayOnce(sndSkidGoo)}
				else { vx+=move_fric; }
			}
			else { vx+=(move_fric*0.6); }
		}
		if (abs(vx) < move_fric) { vx = 0; }
		vx = clamp(vx, -move_speed, move_speed);

		/// Turning & skidding
		if (vx > 0) 
		{ 
			face = 1; 
			if (on_ground) { skidding = in_c(Keys.Left, p_num); }
			else { skidding = false; }
		}
		if (vx < 0) 
		{ 
			face = -1; 
			if (on_ground) { skidding = in_c(Keys.Right, p_num); }
			else { skidding = false; }
		}
		if (vx == 0) { skidding = false; }

		/// Gravity & Jumping
		if (in_c(Keys.Jump, p_num) && (jumping || on_ground || sticking))
		{
			jumping = true;
			on_ground = false;
			scrPlayOnce(sndJump);
			if (sticking && in_cp(Keys.Jump, p_num)) { vx = -sign(vx)*move_speed*1.5; }
			if (in_cp(Keys.Jump, p_num)) { stretch = 0.8; squish = 1.2; }
			if (abs(vy) < jump_speed) { vy -= jump_acc; }
			else { jumping = false; }
		}
		else { jumping = false; }
		if (on_ground)
		{
			if (!place_meeting(x, y + 1, objSolidPar)) { on_ground = false; }
		}
		else
		{
			if (sticking) { vy = slide_speed; }
			else { vy+=fall_grav; }
			if (vy > fall_speed) { vy = fall_speed; }
		}

		/// Wall sliding
		if (sticking)
		{
			if (!place_meeting(x+sign(vx), y, objSolidPar) || place_meeting(x, y+1, objSolidPar)) { sticking = false; }	
		}
	break;
	case Powers.Pound:
		/// Spin
		if (attack_time == 0) 
		{ 
			image_angle+=(360/18); 
			if(!usedPowerSnd[0]){audio_play_sound(sndGroundPoundInitailize,1,0); usedPowerSnd[0] =true} 
			spin_time++;
		}
		if (image_angle mod 360 == 0 || spin_time >= 18) 
		{
			spin_time = 0;
			if (attack_time < 15) { attack_time++; }
			else
			{
				// Drop
				vy = 14;
				stretch = 0.4;
				squish = 2.1;
				if(place_meeting(x,y+vy,objSolidPar) && !usedPowerSnd[1]){ audio_play_sound(sndGroundPoundLand,1,0); usedPowerSnd[1] = true}
			}
		}
		else
		{
			vx = 0;
			vy = 0;
		}
	break;
	case Powers.Dash:
		/// Timing
		if (!attack_time) { vx = face*20; attack_time++; if(!usedPowerSnd[0]){audio_play_sound(sndDash,1,0); usedPowerSnd[0] =true} }
		else
		{
			vx = tween(tw_fastin, face*20, 1, 30, attack_time);
			attack_time++;
			if (abs(vx) < 1) {
				attack = Powers.None;
				attack_time = 0;
			}
			vy = 0;
		}
	break;
	case Powers.Cannon:
		/// Gravity
		if (on_ground)
		{
			if (!place_meeting(x, y + 1, objSolidPar)) { on_ground = false; }
		}
		else
		{
			vy+=fall_grav;
			if (vy > fall_speed) { vy = fall_speed; }
		}
		
		/// Timing
		if (!attack_time) 
		{ 
			audio_play_sound(sndCannonShoot,1,0);
			
			vy += (fall_speed/2); 
			attack_time++;
			var c = instance_create_layer(x-(face*12), bbox_top - (sprite_get_height(sprCannonShot)/2), "Effect", objCannonball);
				 if (p_num == 0) { c.col = c_p1; }
			else if (p_num == 1) { c.col = c_p2; }
			else if (p_num == 2) { c.col = c_p3; }
			else if (p_num == 3) { c.col = c_p4; }
			c.owner = self;
		}
		else
		{
			attack_time++;
			if (attack_time==3) 
			{ 
				attack = Powers.None;
				attack_time = 0;
				audio_play_sound(sndCannonReload,1,0);
			}
		}
	break;
	case Powers.Grab:
		if (!attack_time) 
		{
			audio_play_sound(sndGrappleGrab,1,0);
			myHand = instance_create_depth(x,y,depth,objGappleHand);
			myHand.myPlayer = self;
			myHand.hspeed = GrabSpeed*face;
			myHand.image_xscale = face;
			attack_time++;
			vx = 0;
			vy = 0;
		}
		else if(myHand != noone)
		{
			attack_time++;
			if (abs(point_distance(x,y,myHand.x,myHand.y)) > GrabDist) { retract = true; }
			if (retract) { myHand.hspeed = -GrabSpeed*face; }
			if(myHand.hit)// hand hit some thing
			{
				myHand.hspeed = 0;
				x = approach(x, myHand.x-(sprite_get_width(mask_index)*.1*face), GrabSpeed);
				y = approach(y, myHand.y, GrabSpeed);
			}
			if (point_distance(x, y, myHand.x, y) <= 10 && (attack_time > 10 || retract || myHand.hit))
			{
				retract = false;
				instance_destroy(myHand);
				myHand = noone;
				attack = Powers.None;
				attack_time = 0;
				//scrPlayOnce(sndGrappleRetract);
				/// Check collision
				if (place_meeting(x+(face*10), y, objPlayer))
				{
					clash = instance_place(x+(face*10), y, objPlayer);
					event_perform(ev_other, ev_user3);
				}
				break;
			}
		}
	break;
	case Powers.Bubble:
		/// Puff
		if (!puffed) { 
			if(!usedPowerSnd[0]){audio_play_sound(sndBouncing,1,0); usedPowerSnd[0] =true} 
			puffed = true;
			squish = 1.3;
			stretch = 0.7;
			if (vy > 2) { vy = 2; }
		}
		attack_time++;
		if (attack_time > 180 && attack_time mod 10 == 0)
		{
			//if(!usedPowerSnd[1]){audio_play_sound(sndBouncing,1,0); usedPowerSnd[1] =true} 
			squish = 1.1;
			stretch = 0.8;
		}
		if (attack_time >= 240)
		{
			squish = 0.7;
			stretch = 1.4;
			attack = Powers.None;
			puffed = false;
			attack_time = 0;
		}
		/// Move Left
		if (in_c(Keys.Right, p_num) && !global.cutscene) 
		{ 
			// Moving
			if (skidding) { vx+=(move_acc*0.3); }
			else { vx+=(move_acc*0.8); }
		}
		else if (vx > 0) 
		{
			// Friction
			if (on_ground) 
			{ 
				if (skidding) { vx-=(move_fric*0.2); }
				else { vx-=(move_fric*0.4); }
			}
			else { vx-=(move_fric*0.2) }
		}

		/// Move Right
		if (in_c(Keys.Left, p_num) && !global.cutscene)  
		{ 
			// Moving
			if (skidding) { vx-=(move_acc*0.3); }
			else { vx-=(move_acc*0.8); }
		} 
		else if (vx < 0) 
		{
			// Friction
			if (on_ground) 
			{ 
				if (skidding) { vx+=(move_fric*0.2); }
				else { vx+=(move_fric*0.4); }
			}
			else { vx+=(move_fric*0.2); }
		}
		if (abs(vx) < (move_fric*0.8)) { vx = 0; }
		vx = clamp(vx, -(move_speed*0.75), (move_speed*0.75));

		/// Turning & skidding
		if (vx > 0) 
		{ 
			face = 1; 
			if (vy > 1) { image_angle -= vx; }
			if (on_ground) { skidding = in_c(Keys.Left, p_num); }
			else { skidding = false; }
		}
		if (vx < 0) 
		{ 
			face = -1; 
			if (vy > 1) { image_angle -= vx; }
			if (on_ground) { skidding = in_c(Keys.Right, p_num); }
			else { skidding = false; }
		}
		if (vx == 0) { skidding = false; }

		/// Gravity & Jumping
		if (in_c(Keys.Jump, p_num) && (jumping || on_ground))
		{
			jumping = true;
			on_ground = false;
			if (in_cp(Keys.Jump, p_num)) { stretch = 0.8; squish = 1.2; }
			if (abs(vy) < (jump_speed*0.9)) { vy -= (jump_acc*0.4); }
			else { jumping = false; }
		}
		else { jumping = false; }
		if (on_ground)
		{
			if (!place_meeting(x, y + 1, objSolidPar)) { on_ground = false; }
		}
		else
		{
			vy+=(fall_grav*0.4);
			if (vy > (fall_speed*0.7)) { vy = (fall_speed*0.7); }
		}
	break;
	case Powers.Rocket:
		/// Timing
		if (!attack_time) { vy = -20; attack_time++; scrPlayOnce(sndRocket);}
		else
		{
			vy = tween(tw_expin, -20, -1, 40, attack_time);
			attack_time++;
			if (attack_time mod 4) 
			{
				var e =instance_create_layer(x, y+(sprite_height/2), "Effect", objRocketExhaust);
					 if (p_num == 0) { e.col = c_p1; }
				else if (p_num == 1) { e.col = c_p2; }
				else if (p_num == 2) { e.col = c_p3; }
				else if (p_num == 3) { e.col = c_p4; }
				e.owner = self;
			}
			if (abs(vy) < 1) {
				attack = Powers.None;
				attack_time = 0;
			}
			vx = 0;
		}
	break;
}
if (attack == Powers.None) { bloom = false; }
else { bloom = true; sticking = false; }

/// Hitstun
if (hitstun != 0)
{
	image_alpha = 0.4;
	if (room_speed < 60) { room_speed = 60; }
	hitstun--;
}
else { image_alpha = 1; }
if (hitstop != 0) { hitstop--; }

/// Cooldowns
if (attack == Powers.None) {
	if (x_cool > 0) { x_cool--; }
	if (y_cool > 0) { y_cool--; }
	if (b_cool > 0) { b_cool--; }
}

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
		if (!on_ground && vy > 0) { sticking = true; }
		if (attack = Powers.Dash) { attack = Powers.None; }
		vx = 0; 
		break; 
	}
}
repeat(abs(my)) 
{
	if (!place_meeting(x, y+sign(my), objSolidPar)) { y+=sign(my); }
	else 
	{ 
		if (my > 0)
		{
			if (attack == Powers.Pound)
			{
				stretch = 2.1;
				squish = 0.4;
				attack = Powers.None;
				attack_time = 0;
			}
			else if (attack == Powers.Bubble)
			{
				image_angle = 0;
				while (place_meeting(x, y, objSolidPar)) { y--; }
				stretch = 1.6;
				squish = 0.5;
			}
			else
			{
				stretch = 1.5;
				squish = 0.6;
			}
			on_ground = true;
			vy = 0; 
			break; 
		}
		else if (my < 0)
		{
			if (attack == Powers.Rocket)
			{
				stretch = 2.1;
				squish = 0.4;
				attack = Powers.None;
				attack_time = 0;
			}
			else
			{
				stretch = 1.5;
				squish = 0.6;
			}
			vy = 0;
			jumping = false;
			break;
		}
	}
}
while (attack == Powers.None && place_meeting(x, y, objSolidPar)) { y--; }

/// Attacking
if (attack == Powers.None && !hitstop)
{
		 if (in_cp(Keys.Att1, p_num) && !x_cool) { attack = powers[0]; attack_time = 0; x_cool = 30; }
	else if (in_cp(Keys.Att2, p_num) && !y_cool) { attack = powers[1]; attack_time = 0; y_cool = 30; }
	else if (in_cp(Keys.Att3, p_num) && !b_cool) { attack = powers[2]; attack_time = 0; b_cool = 30; }
}
else if (attack == Powers.Bubble)
{
	if ((in_cr(Keys.Att1, p_num) && powers[0] == Powers.Bubble) ||
		(in_cr(Keys.Att2, p_num) && powers[1] == Powers.Bubble) ||
		(in_cr(Keys.Att3, p_num) && powers[2] == Powers.Bubble) ||
		hitstop) { attack = Powers.None; puffed = false; image_angle = 0; }
}

/// DEBUG
if (keyboard_check_pressed(ord("Q"))) { powers[0]++; powers[0] = powers[0] mod 7; }
if (keyboard_check_pressed(ord("W"))) { powers[1]++; powers[1] = powers[1] mod 7; }
if (keyboard_check_pressed(ord("E"))) { powers[2]++; powers[2] = powers[2] mod 7; }
if (powers[0]==Powers.Rocket || powers[1]==Powers.Rocket || powers[2]==Powers.Rocket)
{
	mask_index = sprPlayerMaskTall;
}
else
{
	mask_index = sprPlayerMask;	
}