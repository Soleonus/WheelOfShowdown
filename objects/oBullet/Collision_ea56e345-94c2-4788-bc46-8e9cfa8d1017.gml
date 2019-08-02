instance_destroy();
other.hp -= damage;
if (other.hp <= 0)
{
	if (parent.firemode == 1)
	{
		if (parent.kill == false) 
		{
			if (oPlayer.gun == parent) oPlayer.pscore++;
			parent.kill = true;
		}
	}
	else
		{ parent.parent.pscore++; }
}
else if (parent.firemode == 1) and (other.hp > 0) parent.kill = false;

show_debug_message(parent.parent.pscore);
