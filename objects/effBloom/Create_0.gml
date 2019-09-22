/// @description Insert description here
// You can write your code in this editor
//Creates surfaces required for bloom and clear it with black color
//Multiple surfaces are created to make smooth bloom
image_speed=0;
surface_reset_target()
bloom=surface_create(room_width/1,room_height/1);
bloom2=surface_create(room_width/2,room_height/2);
bloom3=surface_create(room_width/4,room_height/4);
bloom4=surface_create(room_width/8,room_height/8);
bloom5=surface_create(room_width/16,room_height/16);
gpu_set_tex_filter(1);
surface_reset_target()
surface_set_target(bloom);
draw_clear(c_black);
surface_reset_target()
surface_set_target(bloom2);
draw_clear(c_black);
surface_reset_target()
surface_set_target(bloom3);
draw_clear(c_black);
surface_reset_target()
surface_set_target(bloom4);
draw_clear(c_black);
surface_reset_target()
surface_set_target(bloom5);
draw_clear(c_black);
surface_reset_target();
