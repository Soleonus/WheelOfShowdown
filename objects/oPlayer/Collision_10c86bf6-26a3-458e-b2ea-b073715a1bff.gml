if (hasgun == false)
{
	other.active = true;
	gun = other;
	hasgun = true;
}

else if (keyboard_check_pressed(ord("F"))) 
{
	hasgun = false;
	gun.active = false;
	gun.x += 10 * sign(mouse_x-x);
	//other.active = true;
	//gun.active = false;
	//gun = other;
}