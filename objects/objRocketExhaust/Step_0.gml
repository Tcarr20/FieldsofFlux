/// @description Count
life--;
if (!life) { instance_destroy(); }
part_type_color1(part_smoke, col);
part_emitter_region(player_part, goop_shooter, bbox_left, bbox_right, bbox_top, bbox_bottom-(sprite_height/2), ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(player_part, goop_shooter, part_smoke, irandom_range(10, 8));