/// @description Add new power
var p0, p1, p2, words;
p2 = powers[2];
p1 = powers[1];
p0 = powers[0];
words = instance_create_layer(x, y-sprite_height, "Effect", objItemWord);

switch (power_new)
{
	case Powers.Cannon: words.sprite_index = sprTextCannon; break;	
	case Powers.Dash: words.sprite_index = sprTextDash; break;	
	case Powers.Pound: words.sprite_index = sprTextSlam break;	
	case Powers.Grab: words.sprite_index = sprTextGrab; break;	
	case Powers.Rocket: words.sprite_index = sprTextRocket; break;	
	case Powers.Bubble: words.sprite_index = sprTextBubble; break;	
}

powers[2] = p1;
powers[1] = p0;
powers[0] = power_new;

power_new = Powers.None;
if (p2 != Powers.None)
{
	switch (p2)
	{
		case Powers.Cannon: instance_create_layer(x, y, "Entity", objItemCannon); break;	
		case Powers.Dash: instance_create_layer(x, y, "Entity", objItemDash); break;	
		case Powers.Pound: instance_create_layer(x, y, "Entity", objItemPound); break;	
		case Powers.Grab: instance_create_layer(x, y, "Entity", objItemGrab); break;	
		case Powers.Rocket: instance_create_layer(x, y, "Entity", objItemRocket); break;	
		case Powers.Bubble: instance_create_layer(x, y, "Entity", objItemBubble); break;	
	}
}

	 if (p_num == 0) { part_type_color1(part_shoot, c_p1); }
else if (p_num == 1) { part_type_color1(part_shoot, c_p2); }
else if (p_num == 2) { part_type_color1(part_shoot, c_p3); }
else if (p_num == 3) { part_type_color1(part_shoot, c_p4); }
part_emitter_region(player_part, goop_shooter, bbox_left, bbox_right, bbox_top, bbox_bottom-(sprite_height/2), ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(player_part, goop_shooter, part_shoot, irandom_range(10, 8));