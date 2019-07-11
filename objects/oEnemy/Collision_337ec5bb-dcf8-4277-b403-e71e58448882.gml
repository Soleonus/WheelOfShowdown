/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 42AB1141
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "oBullet"
/// @DnDSaveInfo : "object" "4414d534-3430-4de4-9ee3-a67d8bd463c9"
var l42AB1141_0 = instance_place(x + 0, y + 0, oBullet);
if ((l42AB1141_0 > 0))
{
	/// @DnDAction : YoYo Games.Instance Variables.Set_Health
	/// @DnDVersion : 1
	/// @DnDHash : 453BEB94
	/// @DnDParent : 42AB1141
	/// @DnDArgument : "health" "-1"
	/// @DnDArgument : "health_relative" "1"
	if(!variable_instance_exists(id, "__dnd_health")) __dnd_health = 0;
	__dnd_health += real(-1);

	/// @DnDAction : YoYo Games.Instance Variables.If_Health
	/// @DnDVersion : 1
	/// @DnDHash : 43DD7862
	/// @DnDParent : 42AB1141
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