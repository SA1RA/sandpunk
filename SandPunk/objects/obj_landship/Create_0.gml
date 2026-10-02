ship_level = 0; // 0=topdeck 1=middeck 2=belowdeck
state = "notDriving";

//camera settings
camera_zoom = [1.2, 0.6, 0.4];
var zoom = camera_zoom[ship_level];

// Starting deck = 0
ship_level = 0;

// Steering wheel
with (obj_steeringWheel) instance_activate_object(id);


switch_level = function(new_level) {

    ship_level = new_level;

    // Change landship sprite
    switch (ship_level) {
        case 0: sprite_index = spr_landship_topdeck; break;
        case 1: sprite_index = spr_landship_middeck; break;
        case 2: sprite_index = spr_landship_lowerdeck; break;
    }

    // Delete old walls
    with (obj_walls_topdeck) instance_destroy();
    with (obj_walls_middeck) instance_destroy();
    with (obj_walls_lowerdeck) instance_destroy();

    // Create new walls for this deck
    switch (ship_level) {
        case 0:
            instance_create_layer(x, y, "Instances", obj_walls_topdeck);
            break;
        case 1:
            instance_create_layer(x, y, "Instances", obj_walls_middeck);
            break;
        case 2:
            instance_create_layer(x, y, "Instances", obj_walls_lowerdeck);
            break;
    }

    // Camera zoom
    var cam = view_camera[0];
    var base_w = 640;
    var base_h = 360;
    var zoom = camera_zoom[ship_level];
    camera_set_view_size(cam, base_w * zoom, base_h * zoom);

    // Move player to correct landing spot
    if (ship_level == 0) {
        //obj_player.x = topdeck_stair_x;
        //obj_player.y = topdeck_stair_y;
    }
    else if (ship_level == 1) {
        //obj_player.x = middeck_stair_x;
        //obj_player.y = middeck_stair_y;
    }
    else if (ship_level == 2) {
        //obj_player.x = lowdeck_stair_x;
        //obj_player.y = lowdeck_stair_y;
    }

    show_debug_message("Switched to deck: " + string(ship_level));
};

// List of component names for random selection
components = [
    obj_engine,
];
