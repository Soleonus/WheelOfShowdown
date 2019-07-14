if (active == true)
{
	x = oPlayer.x + xoffset * sign(mouse_x-x);
	y = oPlayer.y + yoffset;
	image_angle = point_direction(x,y,mouse_x,mouse_y) + recangle * max(0,(firingdelay / maxfiredelay)) * sign(mouse_x-x);
	if(mouse_x > x) image_yscale = 0.5; else image_yscale = -0.5;
}
else
{
	image_angle = 0;
	image_yscale = .75;
	if (!place_meeting(x,y,oWall)) vspeed += 0.2;
	else vspeed = 0;
}

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if (firemode == 0)
{
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0) and (active)
	{
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
		with (instance_create_layer(x,y,"Bullets",oBullet))
		{
			speed = other.bulspeed;
			damage = other.buldamage;
			direction = other.image_angle + random_range (-other.range,other.range);
			image_angle = direction;
		}
		ammo--;
	}
}
else if (firemode == 1)
{
	if (mouse_check_button(mb_left)) and (firingdelay < 0) and (ammo > 0) and (active)
	{
		recoil = maxrecoil;
		firingdelay = maxfiredelay;
		switch (pellets)
		{
			case 5:
			{
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				break;
			}
			case 8:
			{
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
				with (instance_create_layer(x,y,"Bullets",oBullet))
				{
					speed = other.bulspeed;
					damage = other.buldamage;
					direction = other.image_angle + random_range (-other.range,other.range);
					image_angle = direction;
				}
			}
		}	
		ammo--;
	}
}
else if (firemode == 2)
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
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
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