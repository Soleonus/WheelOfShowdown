if (!scrInArray(impacts, other))
{
	other.hp -= damage;
	impacts[array_length_1d(impacts)] = other;
	if (other.hp <= 0) parent.parent.pscore++;
}
show_debug_message(parent.parent.pscore);