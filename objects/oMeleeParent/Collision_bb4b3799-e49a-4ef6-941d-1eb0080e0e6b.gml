if (!scrInArray(contact, other) and swinging)
{
	other.hp -= damage;
	contact[array_length_1d(contact)] = other;
}

if (charge <= 0)
{
	contact = [0];
}