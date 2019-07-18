if (thrown) and (!bounce)
{
	instance_destroy();
	other.hp -= damage;
}
else if (bounce)
{
	hspeed = -hspeed * 0.5;
}