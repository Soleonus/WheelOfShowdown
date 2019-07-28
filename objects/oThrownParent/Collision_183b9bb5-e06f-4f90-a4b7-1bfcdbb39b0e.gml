if (thrown) and (!bounce)
{
	instance_destroy();
	other.hp -= damage;
	if (other.hp <= 0) oPlayer.pscore++;
}
else if (bounce)
{
	hspeed = -hspeed * 0.5;
}