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

// Spotlight
//if !surface_exists(surf)
//{
//	var _cw = room_width; //camera_get_view_width(view_camera[0]);
//	var _ch = room_height; //camera_get_view_height(view_camera[0]);
//	surf = surface_create(_cw, _ch);
//	surface_set_target(surf);
//	draw_set_colour(c_black);
//	draw_set_alpha(0);
//	draw_rectangle(0, 0, _cw, _cw, false);
//	surface_reset_target();
//}
//else
//{
//	if (surface_exists(surf)) 
//	{
//		var _cw = room_width; //camera_get_view_width(view_camera[0]);
//		var _ch = room_height; //camera_get_view_height(view_camera[0]);
//		var _cx = 0; //camera_get_view_x(view_camera[0]);
//		var _cy = 0; //camera_get_view_y(view_camera[0]);
//		surface_set_target(surf);
//		draw_set_color(c_black);
//		draw_set_alpha(0.8);
//		draw_rectangle(0, 0, _cw, _ch, 0);
//		gpu_set_blendmode(bm_subtract);
//		with (oLightParent)
//		{
//			switch(object_index)
//			{
//				case oPlayer:
//					draw_sprite_ext(sLight, 0, x, y, 1, 1, 0, c_white, 1);            
//					break;
//			}
//		}
//		gpu_set_blendmode(bm_normal);
//		draw_set_alpha(1);
//		surface_reset_target();
//		draw_surface(surf, _cx, _cy);
//	}
//}