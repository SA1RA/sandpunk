if (interact_cooldown > 0) {
    interact_cooldown -= 1;
}


// movement
if (state == "walking") {
	var spd = 0.5;
	if (keyboard_check(vk_left))  x -= spd;
	if (keyboard_check(vk_right)) x += spd;
	if (keyboard_check(vk_up))    y -= spd;
	if (keyboard_check(vk_down))  y += spd;
}

// driving
if (state == "driving") {
	// maintain position with the ship
	x = obj_landship.x + offset_x;
	y = obj_landship.y + offset_y;
    // can't walk
}


// collision with top walls
if (place_meeting(x, y, obj_walls_topdeck)) {
    x = xprevious;
    y = yprevious;
}

if (place_meeting(x, y, obj_walls_middeck)) {
    x = xprevious;
    y = yprevious;
}

if (place_meeting(x, y, obj_walls_lowerdeck)) {
    x = xprevious;
    y = yprevious;
}

if (keyboard_check_pressed(ord("W"))) {
        show_debug_message("Player X: " + string(x) + "  Y: " + string(y));
}

// collision with steering wheel to enter driving mode
if (state == "walking" && place_meeting(x, y, obj_steeringWheel) && interact_cooldown <= 0) {
    if (keyboard_check_pressed(ord("E"))) {
        enter_driving_mode();
    }
}

if (state == "walking") {
    if (place_meeting(x, y, obj_steeringWheel) && interact_cooldown <= 0) {
        if (keyboard_check_pressed(ord("E"))) {
			switch_to_driving_mode();
        }
    }
}


// Exit driving mode
if (state == "driving" && interact_cooldown <= 0) {
    if (keyboard_check_pressed(ord("E"))) {
        exit_driving_mode();
    }
}

// Check collision with the staircase
// Staircase between 0 or 1
var stair01 = instance_place(x, y, Object16);

if (stair01 != noone) {
    if (keyboard_check_pressed(ord("E"))) {

        if (obj_landship.ship_level == 0) {
            obj_landship.switch_level(1);
        }
        else if (obj_landship.ship_level == 1) {
            obj_landship.switch_level(0);
        }
    }
}

// Staircase between 1 or 2
var stair12 = instance_place(x, y, obj_staircase_midtop_1);

if (stair12 != noone) {
    if (keyboard_check_pressed(ord("E"))) {

        if (obj_landship.ship_level == 1) {
            obj_landship.switch_level(2);
        }
        else if (obj_landship.ship_level == 2) {
            obj_landship.switch_level(1);
        }
    }
}

// make camera follow player
var cam = view_camera[0];
camera_set_view_pos(cam, x - camera_get_view_width(cam)/2, y - camera_get_view_height(cam)/2);
