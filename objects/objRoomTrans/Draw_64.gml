/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
if (global.state==0)
{
	draw_rectangle(0,0,(timer/20)*(display_get_gui_width()), display_get_gui_height(), false);
}
else
{
	draw_rectangle(0,0,display_get_gui_width() - (((timer-20)/20)*(display_get_gui_width())), display_get_gui_height(), false);
}