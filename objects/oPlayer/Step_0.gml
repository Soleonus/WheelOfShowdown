//Get player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));
key_drop = keyboard_check_pressed(ord("F"));

//Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

// Ground Collision
if (place_meeting (x,y+1,oWall))
{
	// Jumping
	if (key_jump)
	{
	vsp = -7;
	}
	wjumps = 1;
}
else if ((place_meeting (x-1,y,oWall) and (key_jump)) or (place_meeting (x+1,y,oWall) and (key_jump)))
{
	if (wjumps > 0)
	{
		vsp = -7;
		wjumps = wjumps - 1;
	}
}

//Horizontal Collision
if(place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if(place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Debug Functions
if (keyboard_check_pressed(ord("1"))) // Gun
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oGun);
}
if (keyboard_check_pressed(ord("2"))) // Revolver
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oRevolver);
}
if (keyboard_check_pressed(ord("3"))) // Uzi
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oUzi);
}
if (keyboard_check_pressed(ord("4"))) // Shotgun
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oShotgun);
}
if (keyboard_check_pressed(ord("5"))) // Minigun
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oMinigun);
}
if (keyboard_check_pressed(ord("6"))) // Scar
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oScar);
}
if (keyboard_check_pressed(ord("7"))) // Sniper
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oSniper);
}
if (keyboard_check_pressed(ord("8"))) // P90
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oP90);
}
if (keyboard_check_pressed(ord("9"))) // Auto Shotgun
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oAutoShotgun);
}
if (keyboard_check_pressed(ord("0"))) // Flintlock Pistol
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oFlintlock);
}
if (keyboard_check_pressed(ord("T"))) // Toy Gun
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oToy);
}
if (keyboard_check_pressed(ord("Y"))) // M1911
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oM1911);
}
if (keyboard_check_pressed(ord("U"))) // M416
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oM416);
}
if (keyboard_check_pressed(ord("I"))) // Machete
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oMachete);
}
if (keyboard_check_pressed(ord("O"))) // Katana
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oKatana);
}
if (keyboard_check_pressed(ord("P"))) // Shuriken
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oShuriken);
}
if (keyboard_check_pressed(ord("G"))) // Grenades
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oGrenade);
}
if (keyboard_check_pressed(ord("H"))) // RPG
{
		layer_destroy_instances("Gun");
		hasgun = false;
		instance_create_layer(x,y,"Gun",oRPG);
}

if (key_drop) 
{
	hasgun = false;
	gun.active = false;
	gun.x += gun.sprite_width+5 * sign(mouse_x-x);
	gun = 0;
}