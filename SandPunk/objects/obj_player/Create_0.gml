offset_x = x - obj_landship.x;
offset_y = y - obj_landship.y;
interact_cooldown = 0;
state = "walking";
visible = true;

enter_driving_mode = function() {
    visible = false;
    state = "driving";
    obj_landship.state = "driving";
	interact_cooldown = 10;
    show_debug_message("Entered driving mode");
	
};

exit_driving_mode = function() {
    visible = true;
    state = "walking";
	drive_cooldown = 10;
    obj_landship.state = "notDriving";
    show_debug_message("Exited driving mode");
};