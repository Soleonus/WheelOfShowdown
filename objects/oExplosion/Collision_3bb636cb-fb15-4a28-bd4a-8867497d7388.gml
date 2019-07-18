if (!scrInArray(impacts, other))
{
	other.hp -= damage;
	impacts[array_length_1d(impacts)] = other;
}