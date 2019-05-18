/// @DnDAction : YoYo Games.Collisions.If_Collision_Point
/// @DnDVersion : 1
/// @DnDHash : 2BED781C
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "obj" "oBullet"
/// @DnDSaveInfo : "obj" "4414d534-3430-4de4-9ee3-a67d8bd463c9"
var l2BED781C_0 = collision_point(x + 0, y + 0, oBullet, true, 1);
if((l2BED781C_0))
{
	/// @DnDAction : YoYo Games.Instance Variables.Set_Health
	/// @DnDVersion : 1
	/// @DnDHash : 453BEB94
	/// @DnDParent : 2BED781C
	/// @DnDArgument : "health" "-1"
	/// @DnDArgument : "health_relative" "1"
	if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;
	__dnd_health += real(-1);

	/// @DnDAction : YoYo Games.Instance Variables.If_Health
	/// @DnDVersion : 1
	/// @DnDHash : 43DD7862
	/// @DnDParent : 2BED781C
	if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;
	if(__dnd_health == 0)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 5224D94B
		/// @DnDApplyTo : 786bc75a-e682-4549-8b3f-72584aafc107
		/// @DnDParent : 43DD7862
		with(oEnemy) instance_destroy();
	}
}