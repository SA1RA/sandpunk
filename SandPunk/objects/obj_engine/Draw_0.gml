draw_self();

// Health bar position
var bar_w = 40;
var bar_h = 6;
var bar_x = x - bar_w/2;
var bar_y = y - sprite_height/2 - 12;

// Background
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

// Fill amount
var fill = (hp / max_engine_hp) * bar_w;

draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + fill, bar_y + bar_h, false);
