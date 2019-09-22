/// @description Set game state
scrDefineMacros();
randomize();
enum Powers 
{
	None = 0,
	Grab,
	Dash,
	Pound,
	Cannon,
	Bubble,
	Rocket
};
enum Keys
{
	None = 0,
	Up,
	Down,
	Left,
	Right,
	Jump,
	Att1,
	Att2,
	Att3,
	Start
}
global.cutscene = false;
global.state = 0;
global.victory = -1;

/// Controller setup
for(var i=0; i<gamepad_get_device_count(); i++) 
{
	global.gp[i] = gamepad_is_connected(i);	
	gamepad_set_axis_deadzone(i, 0.05);
	global.player[i] = noone;
}