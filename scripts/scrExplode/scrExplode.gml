// Arguments: Xpos, Ypos, Size, Damage,

with(instance_create_layer(argument0, argument1, "Bullets", oExplosion))
{
	image_xscale = argument2;
	image_yscale = image_xscale;
	damage = argument3;
}