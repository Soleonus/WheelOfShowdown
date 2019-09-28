if (keyboard_check_pressed(vk_space) and (!spun))
{
	randomize();
	timer = irandom_range(360, 540);
	spun = true;
	
	choice = irandom(99);
	show_debug_message(choice);

	if (choice <= 4)
	{
		output = legend[irandom(array_length_1d(legend)-1)];
		category = 0;
		add = irandom_range(106, 128);
	}
	else if (choice <= 24)
	{
		output = epic[irandom(array_length_1d(epic)-1)];
		category = 1;
		add = choose(irandom_range(0, 27), irandom_range(180, 206), irandom_range(286, 308));
	}
	else if (choice <= 54)
	{
		output = rare[irandom(array_length_1d(rare)-1)];
		category = 2;
		add = choose(irandom_range(52, 74), irandom_range(153, 180), irandom_range(232, 254), irandom_range(333, 360));
	}
	else if (choice <= 99)
	{
		output = common[irandom(array_length_1d(common)-1)];
		category = 3;
		add = choose(irandom_range(28, 51), irandom_range(75, 105), irandom_range(129, 152), irandom_range(207, 231), irandom_range(265, 285), irandom_range(309, 332));
	}
}
if (spun)
{
	timer--;
	show_debug_message(add);
	show_debug_message(image_angle % 360);
	rspeed = timer*2;
	
	period = (2*pi*32)/rspeed;
	
	if (timer > 4) image_angle += timer/period;

	if (timer <= 4)
	{
		if (round(image_angle) % 360 != add) { if (abs(timer) % 1.5 == 0) image_angle++; }
		else
		{
			switch(category) 
			{
				case 0:
					chest = instance_nearest(x,y-15,oOChest);
					break;
				case 1:
					chest = instance_nearest(x,y-10,oPChest);
					break;
				case 2:
					chest = instance_nearest(x,y-10,oBChest);
					break;
				case 3:
					chest = instance_nearest(x,y-10,oGChest);
					break;
			}
			chest.image_speed = 1;
			if (chest.image_index == 4)
				instance_create_layer(chest.x-sprite_get_width(output)/(2*1.25),chest.y-chest.sprite_height,"Gun", output);
			else if (chest.image_index == 9)
			{
				chest.image_index = 0;
				chest.image_speed = 0;
				spun = false;	
			}
			//show_debug_message(category);
		}
	}
}