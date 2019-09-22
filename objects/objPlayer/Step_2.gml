/// @description Sprite control
/// Squash & Stretch
if (squish != 1) { squish = approach(squish, 1, 0.06); }
if (stretch != 1) { stretch = approach(stretch, 1, 0.06); }

/// Determine sprite
switch (attack)
{
	case Powers.None:
		if (on_ground)
		{
			if (vx != 0 || vy != 0) { 
				if (skidding) { sprite = "Skid"; }
				else { sprite = "Move"; }
			}
			else { sprite = "Idle"; }
		}
		else
		{
			if (sticking) { sprite = "Skid"; }
			else {
				if (vy<0) { sprite = "Jump"; }
				else { sprite = "Fall"; }
			}
		}
		image_speed = anim_norm;
		image_angle = 0;
	break;
	case Powers.Pound:
		if (!vy) { sprite = "Idle"; }
		else { sprite = "Fall"; }
		image_speed = 0;
	break;
	case Powers.Dash:
		sprite = "Move";
		image_speed = anim_norm*3;
	break;
	case Powers.Cannon:
		sprite = "Idle";
		image_speed = anim_norm;
	break;
	case Powers.Rocket:
		sprite = "Jump";
		image_speed = anim_norm*3;
	break;
	case Powers.Grab:
		if (instance_exists(myHand))
		{ 
			if (myHand.hit) { sprite = "Skid"; }
		}
		else 
		{
			if (on_ground) { sprite = "Idle"; }
			else { sprite = "Fall"; }
		}
		image_speed = 0;
	break;
	case Powers.Bubble:
		if (on_ground)
		{
			if (vx != 0 || vy != 0) { 
				if (skidding) { sprite = "Skid"; }
				else { sprite = "Move"; }
			}
			else { sprite = "Idle"; }
		}
		else
		{
			if (vy<0) { sprite = "Jump"; }
			else { sprite = "Fall"; }
		}
		image_speed = anim_norm;
	break;
}