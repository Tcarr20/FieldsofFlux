/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntDraw);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_halign(fa_center);

draw_text(room_width/2, room_height/2, "Would you like to see the tutorial?\n");

if (!select) { draw_set_color(sel); }
else { draw_set_color(norm); }
draw_text(room_width/2, room_height/2, "\n\n"+string(o1));
if (select) { draw_set_color(sel); }
else { draw_set_color(norm); }
draw_text(room_width/2, room_height/2, "\n\n\n"+string(o2));