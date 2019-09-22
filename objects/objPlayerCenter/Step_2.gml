/// @description Follow players
vx=0
vy=0
c_x = 0;
c_y = 0;
c_i = instance_number(objPlayer);
for(var i=0; i<c_i; i++)
{
	var p = instance_find(objPlayer, i);
	c_x += p.x;
	c_y += p.y;
}
x = round(c_x/c_i);
y = round(c_y/c_i);