if (active == true)
{
	x = oPlayer.x + xoffset * sign(mouse_x-x);
	y = oPlayer.y + yoffset;
	image_angle = point_direction(x,y,mouse_x,mouse_y) - maxcharge/2 * sign(mouse_x-x) + charge * sign(mouse_x-x);
	if(mouse_x > x) image_yscale = 1; else image_yscale = -1;
}
else
{
	image_angle = 0;
	image_yscale = 1.25;
	if (!place_meeting(x,y+1,oWall)) vspeed += 0.2;
	else vspeed = 0;
}

image_xscale = abs(image_yscale);

if (swingdelay > 0) swingdelay--;

if (mouse_check_button(mb_left) and (charge < maxcharge) and (!swinging) and (swingdelay <= 0))
{
	charge += chargespd;
}
if (charge > 0) and (mouse_check_button_released(mb_left))
{
	swinging = true;
}
if (swinging)
{
	charge -= swingspeed;
	damage = charge/maxcharge * maxdamage
	if (charge <= 0)
	{
		damage = 0;
		charge = 0;
		swinging = false;
		swingdelay = maxswgdelay;
	}
}