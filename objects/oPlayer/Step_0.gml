//Get player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
//key_down = keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(ord("W"));

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

//Animation
image_xscale = 2;
image_xscale = image_yscale;
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;	
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;	
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);