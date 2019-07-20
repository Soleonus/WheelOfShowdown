if (active)
{
	if (place_meeting(x,y,oWall)) instance_destroy();
	if (place_meeting(x,y,oEnemy)) instance_destroy();
}