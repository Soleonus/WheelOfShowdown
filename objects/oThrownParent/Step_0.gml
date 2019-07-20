if (!thrown)
{
	if (active == true)
	{
		x = oPlayer.x + (-xmove * charge/maxcharge + xoffset) * sign(mouse_x-x);
		y = oPlayer.y - ymove * charge/maxcharge + yoffset;
		image_angle = point_direction(x,y,mouse_x,mouse_y) + charge * sign(mouse_x-x);
		if(mouse_x > x) image_yscale = 1; else image_yscale = -1;
	}
	else
	{
		image_angle = 0;
		image_yscale = 1.25;
		if (!place_meeting(x,y,oWall)) vspeed += 0.2;
		else vspeed = 0;
	}

	image_xscale = abs(image_yscale);
	
	if (delay > 0) delay--;

	if (mouse_check_button(mb_left) and (charge < maxcharge) and (delay <= 0))
	{
		charge += chargespd;
	}
	if (charge > 0) and (mouse_check_button_released(mb_left)) and (active)
	{
		flightspd = flightspd * sign(mouse_x-x) * charge/maxcharge;
		thrown = true;
		damage = charge/maxcharge * maxdamage;
		with(instance_copy(true))
		{
			active = true;
			thrown = false;
			charge = 0;
			delay = other.maxdelay;
		}
		direction = point_direction(x,y,mouse_x,mouse_y);
		speed = abs(flightspd);
		active = false;
	}
}
else if (thrown)
{
	image_angle += -flightspd;
	vspeed += grv;
	if (place_meeting(x,y,oWall)) instance_destroy();
}