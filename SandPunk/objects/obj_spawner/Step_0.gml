//reduce timer
spawn_timer--;

if (spawn_timer <= 0) {

    // Pick a random object from the list
    var obj = spawn_list[ irandom(array_length(spawn_list) - 1) ];

    // Random X offset from car
    var x_offset = random_range(spawn_min, spawn_max);

    // Spawn position relative to landship
    var spawn_x = obj_landship.x + x_offset;
    var spawn_y = obj_landship.y - 800; // above the screen

    // Create the object
    instance_create_layer(spawn_x, spawn_y, "Instances", obj);

    // Reset timer
    spawn_timer = spawn_interval;
}
