/// @description Move to point

if(myPlayer!=noone)
	TargetX = myPlayer.myUi.PlayerUiX;
	TargetY = myPlayer.myUi.PlayerUiY;
move_towards_point(TargetX, TargetY, mySpeed)

if(point_distance(x, y, TargetX, TargetY) < (sprite_width/2) )
{
	instance_destroy();
}

