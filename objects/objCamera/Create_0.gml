/// @description Initialize Camera
global.follow_obj = objPlayerCenter;
motion_scale = 10;
follow_buffer = 32;
view_w = room_width;
view_h = room_height;
xTo = x;
yTo = y;
wTo = view_w;
hTo = view_h;
far_left = 0;
far_right = 0;
far_up = 0;
far_down = 0;
room_cam = camera_create();
shake = 0;
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_w, view_h, 1, 10000);
camera_set_view_mat(room_cam, vm);
camera_set_proj_mat(room_cam, pm);
view_camera[0]=room_cam;