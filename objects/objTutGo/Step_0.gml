/// @description Insert description here
// You can write your code in this editor
if (accept)
{
	if (in_cp(Keys.Jump, 0))
	{
		if (room==rmTut5) { room_trans(rmPreLim2); }
		else { room_trans(room_next(room)); }
	}
}