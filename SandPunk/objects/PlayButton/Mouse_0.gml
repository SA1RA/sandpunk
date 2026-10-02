/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 60AFF9C6
/// @DnDArgument : "room" "Room2"
/// @DnDSaveInfo : "room" "Room2"
room_goto(Room2);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 5C3ADF02
instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 70FED1FE
/// @DnDApplyTo : {QuitButton}
with(QuitButton) instance_destroy();