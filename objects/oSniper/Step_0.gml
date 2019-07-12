x = oPlayer.x + 5 * sign(mouse_x-x);
y = oPlayer.y-7;

image_angle = point_direction(x,y,mouse_x,mouse_y) + 75 * max(0,(firingdelay / 60)) * sign(mouse_x-x);

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0)
{
	recoil = 11;
	firingdelay = 60;
	with (instance_create_layer(x,y,"Bullets",oBullet))
	{
		speed = 25;
		damage = 8;
		direction = other.image_angle;
		image_angle = direction;
	}
	ammo--;
}
if (ammo <= 0)
{
	if (i == 0)
	{
		i = 81;
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