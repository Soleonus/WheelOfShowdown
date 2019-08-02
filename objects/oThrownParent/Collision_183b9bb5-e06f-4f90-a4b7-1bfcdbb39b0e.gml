if (thrown) and (!bounce)
{
	instance_destroy();
	other.hp -= damage;
	if (other.hp <= 0) parent.pscore++;
}
else if (bounce)
{
	hspeed = -hspeed * 0.5;
}