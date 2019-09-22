/// @description Insert description here
// You can write your code in this editor
start = true;
playerNum =instance_number(objPlayer);
for(i=0;i < playerNum;i++)
{
	//currentPlayer=instance_find(objPlayer,i)
	//currentPlayer.powers[0]
	if(!(instance_find(objPlayer,i)).start)
	{
		start = false;
	}
}

if(start&& room == rmPreLim)
{
	room_goto_next();
}