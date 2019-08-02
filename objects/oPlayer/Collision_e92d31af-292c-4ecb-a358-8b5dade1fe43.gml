if (hasgun == false) and (other.active == false)
{
	//if (!other.thrown)
	other.active = true;
	gun = other;
	hasgun = true;
	other.parent = self;
}