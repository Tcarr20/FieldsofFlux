/// @description Check if no gamepads are connected
for(var i=0; i<gamepad_get_device_count(); i++)
{
	if (global.gp[i]) return false;
}
return true;