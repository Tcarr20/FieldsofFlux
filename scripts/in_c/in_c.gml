/// @description Handles input continuously, auto-detecting keyboard or gamepad.
/// @param input
/// @param device
//gamepad_set_axis_deadzone(argument1, 0.1);
switch (argument0)
{
	case Keys.Left:
		return abs(clamp(gamepad_axis_value(argument1, gp_axislh), -1, 0));
	break;
	case Keys.Right:
		return keyboard_check(vk_right)//abs(clamp(gamepad_axis_value(argument1, gp_axislh), 0, 1));
	break;
	case Keys.Up:
		return abs(clamp(gamepad_axis_value(argument1, gp_axislv), -1, 0));
	break;
	case Keys.Down:
		return keyboard_check(vk_down)//abs(clamp(gamepad_axis_value(argument1, gp_axislv), 0, 1));
	break;
	case Keys.Jump:
		return gamepad_button_check(argument1, gp_face1);
	break;
	case Keys.Att1:
		return keyboard_check(ord("Z")) //gamepad_button_check(argument1, gp_face3);
	break;
	case Keys.Att2:
		return keyboard_check(ord("X"))//gamepad_button_check(argument1, gp_face4);
	break;
	case Keys.Att3:
		return keyboard_check(ord("C"));//gamepad_button_check(argument1, gp_face2);
	break;
	case Keys.Start:
		return keyboard_check(vk_enter); //gamepad_button_check(argument1, gp_start);
	break;
}