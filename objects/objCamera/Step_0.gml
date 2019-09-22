/// @description Motion
if (global.follow_obj == noone || global.cutscene) { exit; }
far_left = 0;
far_right = 0;
far_up = 0;
far_down = 0;

/// Set dimensions
for(var i=0; i<instance_number(objPlayer); i++)
{
	var p = instance_find(objPlayer, i), w1, w2, h1, h2;
	if (p.x < global.follow_obj.x) { far_left = max(far_left, point_distance(p.x, 0, global.follow_obj.x, 0) + 64); }
	else { far_right = max(far_right, point_distance(p.x, 0, global.follow_obj.x, 0) + 64); }
	
	if (p.y < global.follow_obj.y) { far_up = max(far_up, point_distance(p.y, 0, global.follow_obj.y, 0) + 64); }
	else { far_down = max(far_down, point_distance(p.y, 0, global.follow_obj.y, 0) + 64); }

	w1 = max((far_right+far_left) + 256, 1024);
	h1 = max((far_up+far_down) + 140, 576);
	w2 = h1 * (16/9);
	h2 = w1 * (9/16);
	
	if (w1*h2 > w2*h1)
	{
		wTo = w1;
		hTo = h2;
	}
	else
	{
		wTo = w2;
		hTo = h1;
	}
	
}
view_w += (wTo - view_w)/motion_scale;
view_h += (hTo - view_h)/motion_scale;
view_w = clamp(view_w, 1024, room_width);
view_h = clamp(view_h, 576, room_height);

/// Set target
xTo = global.follow_obj.x;
yTo = global.follow_obj.y;
xTo = clamp(xTo, view_w/2, room_width-(view_w/2));
yTo = clamp(yTo, view_h/2, room_height-(view_h/2));
x += (xTo - x)/motion_scale;
y += (yTo - y)/motion_scale;

/// Shake
if (shake > 0)
{
	shake--;
	if (shake > 0)
	{
		x += irandom_range(-5, 5);
		y += irandom_range(-5, 5);
	}
}

x = clamp(x, view_w/2, room_width-(view_w/2));
y = clamp(y, view_h/2, room_height-(view_h/2));

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_w, view_h, 1, 10000);
camera_set_view_mat(room_cam, vm);
camera_set_proj_mat(room_cam, pm);
