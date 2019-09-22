/// @description Particle Burst
	 if (p_num == 0) { part_type_color1(part_shoot, c_p1); }
else if (p_num == 1) { part_type_color1(part_shoot, c_p2); }
else if (p_num == 2) { part_type_color1(part_shoot, c_p3); }
else if (p_num == 3) { part_type_color1(part_shoot, c_p4); }
part_emitter_region(player_part, goop_shooter, bbox_left, bbox_right, bbox_top, bbox_bottom-(sprite_height/2), ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(player_part, goop_shooter, part_shoot, irandom_range(10, 8));
