// Keep the collision mask at native size while preserving each bullet's visual scale.
if (!variable_instance_exists(id, "visual_scale_x"))
{
    visual_scale_x = 1;
    visual_scale_y = 1;
}

if (image_xscale != 1 || image_yscale != 1)
{
    visual_scale_x = image_xscale;
    visual_scale_y = image_yscale;
}

image_xscale = 1;
image_yscale = 1;
