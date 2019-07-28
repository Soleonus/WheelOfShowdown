if (!scrInArray(contact, other) and swinging)
{
	other.hp -= damage;
	contact[array_length_1d(contact)] = other;
	if (other.hp <= 0) oPlayer.pscore++;
}

if (charge <= 0)
{
	contact = [0];
}