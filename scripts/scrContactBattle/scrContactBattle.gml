/// @description Compare your origin to the targets, and determine who should take damage
/// @param x
/// @param y
/// @param target_x
/// @param target_y
/// @param target_move
var angle = point_direction(argument0, argument1, argument2, argument3);
if ((angle >= 0   && angle < 45) ||
	(angle >= 135 && angle < 180) ||
	(angle >= 180 && angle < 225) ||
	(angle >= 315 && angle < 360))	{ return (argument4 == Powers.Dash); }
if (angle >= 45 && angle < 135)		{ return (argument4 == Powers.Pound || argument4 == Powers.Bubble); }
if (angle >= 225 && angle < 315)	{ return (argument4 == Powers.Rocket); }