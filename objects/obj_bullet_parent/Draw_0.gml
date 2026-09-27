var _visual_scale_x = 1;
var _visual_scale_y = 1;

if (variable_instance_exists(id, "visual_scale_x"))
    _visual_scale_x = visual_scale_x;
else
    _visual_scale_x = image_xscale;

if (variable_instance_exists(id, "visual_scale_y"))
    _visual_scale_y = visual_scale_y;
else
    _visual_scale_y = image_yscale;

if (sprite_index >= 0)
{
    draw_sprite_ext(
        sprite_index,
        image_index,
        x,
        y,
        _visual_scale_x,
        _visual_scale_y,
        image_angle,
        image_blend,
        image_alpha
    );
}
