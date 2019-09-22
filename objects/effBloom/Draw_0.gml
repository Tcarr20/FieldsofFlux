/// @description Insert description here
// You can write your code in this editor
//Finally draw surface in additive blend mode
gpu_set_blendmode(bm_add);
draw_surface_stretched_ext(bloom,x,y,room_width,room_height,c_white,0.2);
draw_surface_stretched_ext(bloom2,x,y,room_width,room_height,c_white,0.2);
draw_surface_stretched_ext(bloom3,x,y,room_width,room_height,c_white,0.2);
draw_surface_stretched_ext(bloom4,x,y,room_width,room_height,c_white,0.5);
draw_surface_stretched_ext(bloom5,x,y,room_width,room_height,c_white,0.5);
gpu_set_blendmode(bm_normal);


