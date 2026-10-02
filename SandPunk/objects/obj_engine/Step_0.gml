x = obj_landship.x + offset_x;
y = obj_landship.y + offset_y;

// Check if player is touching the engine
var p = instance_place(x, y, obj_player);

if (p != noone) {
    // Player is colliding with engine
    if (keyboard_check_pressed(ord("E"))) {

        hp += repair_amount;

        // Clamp to max
        if (hp > max_engine_hp) hp = max_engine_hp;

        // hp message
        show_debug_message("Engine repaired to: " + string(hp));
    }
}

//game ends when engine explodes
if (hp <= 0) {
    game_end();
}
