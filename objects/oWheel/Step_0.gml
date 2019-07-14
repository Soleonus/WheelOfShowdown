if (keyboard_check_pressed(vk_space) and (!spun))
{
	randomize();
	timer = irandom_range(360, 540);
	spun = true;
	
	choice = irandom(99);

	if (choice <= 4)
	{
		output = choose(oMinigun);
		category = 0;
		add = irandom_range(106, 128);
	}
	else if (choice <= 24)
	{
		output = choose(oSniper, oP90, oKatana, oAutoShotgun);
		category = 1;
		add = choose(irandom_range(0, 27), irandom_range(180, 206), irandom_range(286, 308));
	}
	else if (choice <= 54)
	{
		output = choose(oShotgun, oRevolver, oScar);
		category = 2;
		add = choose(irandom_range(52, 74), irandom_range(153, 180), irandom_range(232, 254), irandom_range(333, 360));
	}
	else if (choice <= 99)
	{
		output = choose(oUzi, oMachete, oM416, oFlintlock, oM1911, oShuriken, oToy);
		category = 3;
		add = choose(irandom_range(28, 51), irandom_range(75, 105), irandom_range(129, 152), irandom_range(207, 231), irandom_range(265, 285), irandom_range(309, 332));
	}
}
if (spun)
{
	timer--;
	
	rspeed = timer*2;
	
	period = (2*pi*32)/rspeed;
	
	if (timer > 4) image_angle += timer/period;

	if (timer <= 4)
	{
		if (round(image_angle) % 360 != add) { if (abs(timer) % 2 == 0) image_angle++; }
		else
		{
			instance_create_layer(x,y+100,"Gun", output);
			show_debug_message(category);
			spun = false;	
		}
	}
}