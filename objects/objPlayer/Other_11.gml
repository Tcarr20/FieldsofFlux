/// @description Take damage
if (!hitstun && !hitstop)
{
	scrPlayOnce(sndHurt);
	image_angle = 0;
	/// Damage effects
		 if (p_num == 0) { part_type_color1(part_goop, c_p1); }
	else if (p_num == 1) { part_type_color1(part_goop, c_p2); }
	else if (p_num == 2) { part_type_color1(part_goop, c_p3); }
	else if (p_num == 3) { part_type_color1(part_goop, c_p4); }
	part_emitter_region(player_part, goop_shooter, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(player_part, goop_shooter, part_goop, irandom_range(10, 8));
	hitstun = stun_time;
	hitstop = stop_time;
	vy = -(jump_speed/2);
	stretch = 0.6;
	squish = 1.2;
	attack = Powers.None;
	attack_time = 0;
	if (instance_exists(myHand)) { instance_destroy(myHand); }
	
	/// Lose ability
	var obj = noone;
	if (powers[0] != Powers.None && powers[1] == Powers.None) 
	{
			 if (powers[0] == Powers.Dash) { obj = objItemDash; }
		else if (powers[0] == Powers.Grab) { obj = objItemGrab; }
		else if (powers[0] == Powers.Rocket) { obj = objItemRocket; }
		else if (powers[0] == Powers.Cannon) { obj = objItemCannon; }
		else if (powers[0] == Powers.Bubble) { obj = objItemBubble; }
		else if (powers[0] == Powers.Pound) { obj = objItemPound; }
		powers[0] = Powers.None;
		event_perform(ev_other, ev_user2);
	}
	else if (powers[1] != Powers.None && powers[2] == Powers.None)
	{
			 if (powers[1] == Powers.Dash) { obj = objItemDash; }
		else if (powers[1] == Powers.Grab) { obj = objItemGrab; }
		else if (powers[1] == Powers.Rocket) { obj = objItemRocket; }
		else if (powers[1] == Powers.Cannon) { obj = objItemCannon; }
		else if (powers[1] == Powers.Bubble) { obj = objItemBubble; }
		else if (powers[1] == Powers.Pound) { obj = objItemPound; }
		powers[1] = Powers.None;
	}
	else
	{
			 if (powers[2] == Powers.Dash) { obj = objItemDash; }
		else if (powers[2] == Powers.Grab) { obj = objItemGrab; }
		else if (powers[2] == Powers.Rocket) { obj = objItemRocket; }
		else if (powers[2] == Powers.Cannon) { obj = objItemCannon; }
		else if (powers[2] == Powers.Bubble) { obj = objItemBubble; }
		else if (powers[2] == Powers.Pound) { obj = objItemPound; }
		powers[2] = Powers.None;
	}
	instance_create_layer(x, bbox_top, "Entity", obj);
}