if !surface_exists(surf)
{
	var _cw = room_width; //camera_get_view_width(view_camera[0]);
	var _ch = room_height; //camera_get_view_height(view_camera[0]);
	surf = surface_create(_cw, _ch);
	surface_set_target(surf);
	draw_set_colour(c_black);
	draw_set_alpha(0);
	draw_rectangle(0, 0, _cw, _cw, false);
	surface_reset_target();
}
else
{
	if (surface_exists(surf)) 
	{
		var _cw = room_width; //camera_get_view_width(view_camera[0]);
		var _ch = room_height; //camera_get_view_height(view_camera[0]);
		var _cx = room_width/2; //camera_get_view_x(view_camera[0]);
		var _cy = room_height/2; //camera_get_view_y(view_camera[0]);
		surface_set_target(surf);
		draw_set_color(c_black);
		draw_set_alpha(0.8);
		draw_rectangle(0, 0, _cw, _ch, 0);
		gpu_set_blendmode(bm_subtract);
		with (oLightParent)
		{
			switch(object_index)
			{
				case oPlayer:
					draw_sprite_ext(sLight, 0, x, y, 1, 1, 0, c_white, 1);            
					break;
			}
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(surf, _cx, _cy);
	}
}