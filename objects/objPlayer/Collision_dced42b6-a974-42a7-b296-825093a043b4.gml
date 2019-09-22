/// @description Damage
if (!hitstun && other.owner != self)
{
	instance_destroy(other);
	if (other.x < x) { vx += (move_speed/2); }
	else { vx -= (move_speed/2); }
	event_perform(ev_other, ev_user1);
}