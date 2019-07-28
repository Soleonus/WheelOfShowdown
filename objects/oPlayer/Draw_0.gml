//Set Font settings
if (draw_get_halign() != fa_center) draw_set_halign(fa_center);
if (draw_get_alpha() != 1) draw_set_alpha(1);
if (draw_get_color() != c_white) draw_set_color(c_white);
if (draw_get_font() == -1) draw_set_font(fScore);
draw_text(x,y-60, "SCORE: "+string(pscore));

//Animation
image_yscale = abs(image_xscale);
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

if (mouse_x-x != 0) image_xscale = sign(mouse_x-x);
else image_xscale = 1;

draw_self();