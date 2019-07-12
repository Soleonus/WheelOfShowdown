x = oPlayer.x + 5 * sign(mouse_x-x);
y = oPlayer.y-7;

image_angle = point_direction(x,y,mouse_x,mouse_y) + 2 * max(0,(firingdelay / 40)) * sign(mouse_x-x);

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0)
{
	recoil = 3;
	firingdelay = 40;
	with (instance_create_layer(x - lengthdir_x(recoil,image_angle)*1.75,y - lengthdir_y(recoil,image_angle)*1.75,"Bullets",oBullet))
	{
		speed = 10;
		damage = 0.1;
		direction = other.image_angle + random_range (-4,4);
		image_angle = direction;
	}
	ammo--;
}
if (ammo <= 0)
{
	if (i == 0)
	{
		i = 71;
	}
	else
	{
		i --;
		image_angle = 90;
	}
	if (i == 1) ammo = magazine;
}
if (keyboard_check_pressed(ord("R"))) ammo = 0;

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if(mouse_x > x) image_yscale = 0.5; else image_yscale = -0.5;
image_xscale = abs(image_yscale);