if (active == true)
{
	x = parent.x + xoffset * sign(mouse_x-parent.x);
	y = parent.y + yoffset;
	image_angle = point_direction(x,y,mouse_x,mouse_y) + recangle * max(0,(firingdelay / maxfiredelay)) * sign(mouse_x-x);
	if(mouse_x > x) image_yscale = 1; else image_yscale = -1;
}
else
{
	image_angle = 0;
	image_yscale = 1.25;
	if (!place_meeting(x,y,oWall)) vspeed += 0.2;
	else vspeed = 0;
}

var sxoffset = sprite_width - sprite_xoffset;
var syoffset = sprite_height - sprite_yoffset;

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if (firemode == 0) // Auto/semi-auto
{
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0) and (active)
	{
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
		with (instance_create_layer(x+sxoffset,y-syoffset/2,"Bullets",oBullet))
		{
			parent = other;
			speed = other.bulspeed;
			damage = other.buldamage;
			direction = other.image_angle + random_range (-other.range,other.range);
			image_angle = direction;
		}
		ammo--;
	}
}
else if (firemode == 1) // Shotgun spray
{
	var p = pellets;
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0) and (active)
	{
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
		while (p > 0)
		{
			with (instance_create_layer(x+sxoffset,y-syoffset/2,"Bullets",oBullet))
			{
				parent = other;
				speed = other.bulspeed;
				damage = other.buldamage;
				direction = other.image_angle + random_range (-other.range,other.range);
				image_angle = direction;
			}
			p--;
		}
		ammo--;
	}
}
else if (firemode == 2) // Burst fire
{
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0) and (active) and (!firing)
	{
		firing = true;
		c = maxc;
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
	}
	if (firing) and (c > 0)
	{
		if (c % (maxc/burst) == 0)
		{
			with (instance_create_layer(x+sxoffset,y-syoffset/2,"Bullets",oBullet))
			{
				parent = other;
				speed = other.bulspeed;
				damage = other.buldamage;
				direction = other.image_angle + random_range (-other.range,other.range);
				image_angle = direction;
			}
			ammo--;
		}
		c--;
	}
	if (c == 0)
	{
		firing = false;
	}
}
else if (firemode == 3) // Explosive projectile
{
	if (actproj == false and ammo > 0 and active)
	{
		var proj = instance_create_layer(x+sxoffset,y-syoffset/2,"Bullets",projectile)
		proj.image_angle = image_angle;
		actproj = true;
	}
	if (actproj)
	{
		proj = instance_nearest(x + lengthdir_x(sxoffset, image_angle),y + lengthdir_y(sxoffset, image_angle),projectile);
		proj.x = x + lengthdir_x(sxoffset, image_angle);
		proj.y = y + lengthdir_y(sxoffset, image_angle);
		proj.image_angle = image_angle;
	}
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (actproj) and (active)
	{
		proj = instance_nearest(x + lengthdir_x(sxoffset, image_angle),y + lengthdir_y(sxoffset, image_angle),projectile);
		proj.active = true;
		proj.parent = self;
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
		proj.rad = projrad;
		proj.speed = bulspeed;
		proj.damage = buldamage;
		proj.direction = image_angle + random_range (-other.range,other.range);
		proj.image_angle = proj.direction;
		actproj = false;
		ammo--;
	}
}

if (ammo <= 0)
{
	if (i == 0)
	{
		i = reload;
	}
	else
	{
		i --;
		image_angle = 90;
	}
	if (i == 1) ammo = magazine;
}
if (keyboard_check_pressed(ord("R"))) and (active) ammo = 0;

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

image_xscale = abs(image_yscale);