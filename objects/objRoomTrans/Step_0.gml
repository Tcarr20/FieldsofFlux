/// @description Insert description here
// You can write your code in this editor
if (global.state == 0)
{
	timer++;
	if (timer == 20)
	{
		global.state = 1;
		room_goto(room_go);	
	}
}
else
{
	timer++;
	if (timer == 40)
	{
		instance_destroy();
		global.cutscene = false;
		global.state = 0;
	}
}