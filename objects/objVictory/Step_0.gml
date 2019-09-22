/// @description Insert description here
// You can write your code in this editor
if (in_cp(Keys.Down, 0)) { select = 1; }
if (in_cp(Keys.Up, 0)) { select = 0; }
if (in_cp(Keys.Jump, 0))
{
	global.victory = -1;
	if (select) { room_trans(rmTitle); }
	else { room_trans(rmPreLim2); }
	audio_stop_sound(sndVictory);
}