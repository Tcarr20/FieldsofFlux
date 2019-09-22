if (!instance_exists(objRoomTrans))
{
	var r = instance_create_layer(0, 0, "Entity", objRoomTrans);
	r.room_go = argument0;
}