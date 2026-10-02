// Move downward at background speed
y += 3;

var ship = instance_place(x, y, obj_landship);

if (ship != noone) {

    // Pick a random component instance
    var comp = ship.components[ irandom(array_length(ship.components) - 1) ];

    // Apply damage
    comp.hp -= damage;
    if (comp.hp < 0) comp.hp = 0;

    // Destroy rock
    instance_destroy();
}



