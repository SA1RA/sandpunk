if (state == "driving") {
	var steer_speed = 2;
	var scroll_speed = 3;
    layer_y("Background", layer_get_y("Background") + scroll_speed);
    if (keyboard_check(vk_left))  x -= steer_speed;
    if (keyboard_check(vk_right)) x += steer_speed;
}
if (state == "notDriving") {
	var scroll_speed = 3;
    layer_y("Background", layer_get_y("Background") + scroll_speed);
}