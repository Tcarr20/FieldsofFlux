/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntDraw);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_halign(fa_center);

draw_text(room_width/2, room_height/2, "VICTORY!\n\n");
switch(global.victory)
{
	case 0: draw_text(room_width/2, room_height/2, "\nPLAYER 1!"); break;
	case 1: draw_text(room_width/2, room_height/2, "\nPLAYER 2!"); break;
	case 2: draw_text(room_width/2, room_height/2, "\nPLAYER 3!"); break;
	case 3: draw_text(room_width/2, room_height/2, "\nPLAYER 4!"); break;
}

if (!select) { draw_set_color(sel); }
else { draw_set_color(norm); }
draw_text(room_width/2, room_height/2, "\n\n\n"+string(o1));
if (select) { draw_set_color(sel); }
else { draw_set_color(norm); }
draw_text(room_width/2, room_height/2, "\n\n\n\n"+string(o2));