if (!scrInArray(impacts, other))
{
	other.hp -= damage;
	impacts[array_length_1d(impacts)] = other;
	if (other.hp <= 0) oPlayer.pscore++;
}
show_debug_message(oPlayer.pscore);