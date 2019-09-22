/// Particles
player_part = part_system_create_layer("Effect", true);
part_smoke = part_type_create();
part_type_sprite(part_smoke, sprSmoke, true, true, true);
part_type_size(part_smoke, 1.5, 2.1, 0.05, 0);
part_type_alpha3(part_smoke, 1, 0.6, 0.3);
part_type_speed(part_smoke, 0.6, 1.1, -0.1, 0);
part_type_direction(part_smoke, 230, 310, 0, 0.5);
part_type_orientation(part_smoke, 0, 180, 8, 0, true);
part_type_blend(part_smoke, false)
part_type_life(part_smoke, 6, 12);
goop_shooter = part_emitter_create(player_part);
life = 12;
col = c_white;
owner = noone;