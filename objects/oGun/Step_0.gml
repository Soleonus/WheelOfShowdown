x = oPlayer.x;
y = oPlayer.y-7;

image_angle = point_direction(x,y,mouse_x,mouse_y) + 10 * max(0,(firingdelay / 5)) * sign(mouse_x-x);

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) and (firingdelay < 0)
{
	recoil = 4;
	firingdelay = 5;
	with (instance_create_layer(x - lengthdir_x(recoil,image_angle)*1.75,y - lengthdir_y(recoil,image_angle)*1.75,"Bullets",oBullet))
	{
		speed = 25;
		damage = 1;
		direction = other.image_angle + random_range (-3,3);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if(mouse_x > x) image_yscale = 0.5; else image_yscale = -0.5;
image_xscale = abs(image_yscale);