/// @description Player Interactions
if (hitstun) { exit; }
var o_a = other.attack;
switch (attack)
{
	/// No moves
	case Powers.Grab:
	case Powers.None:
		if (o_a == Powers.None || o_a == Powers.Grab || o_a == Powers.Cannon || (o_a == Powers.Bubble && other.vy <= 1) || (o_a == Powers.Pound && other.vy <= 1)) { /*Nothing happens?*/ }
		else { /*Take damage*/event_perform(ev_other, ev_user1); }
	break;
	case Powers.Dash:	//Sideways
		if (o_a == Powers.None) { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
		else if (o_a == Powers.Dash) { /*Clash*/clash = other; event_perform(ev_other, ev_user3); }
		else
		{
			var o_x = other.x, o_y = other.y, o_v = other.vy;
			if (scrContactBattle(x, y, o_x, o_y, o_a) && o_v > 1) { /*Take damage*/event_perform(ev_other, ev_user1); }
			else { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
		}
	break;
	/// Down attack
	case Powers.Pound:
	case Powers.Bubble:
		if (vy > 1) { // Moving Down
			if (o_a == Powers.None) { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
			else if (o_a == Powers.Rocket) { /*Clash*/clash = other; event_perform(ev_other, ev_user3); }
			else
			{
				var o_x = other.x, o_y = other.y;
				if (scrContactBattle(x, y, o_x, o_y, o_a)) { /*Take damage*/event_perform(ev_other, ev_user1); }
				else { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
			}
		}
		else	// Otherwise
		{
			if (o_a == Powers.None || o_a == Powers.Grab || o_a == Powers.Cannon || (o_a == Powers.Bubble && other.vy > 1) || (o_a == Powers.Pound && other.vy > 1)) { /*Nothing happens?*/ }
			else { /*Take damage*/event_perform(ev_other, ev_user1); }
		}
	break;
	/// Up attack
	case Powers.Rocket:
		if (o_a == Powers.None) { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
		else if ((o_a == Powers.Pound || Powers.Bubble) && other.vy > 1) { /*Clash*/clash = other; event_perform(ev_other, ev_user3); }
		else
		{
			var o_x = other.x, o_y = other.y;
			if (scrContactBattle(x, y, o_x, o_y, o_a)) { /*Take damage*/event_perform(ev_other, ev_user1); }
			else { /*They take damage*/with(other) event_perform(ev_other, ev_user1); }
		}
	break;
}