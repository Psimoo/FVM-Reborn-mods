// Inherit the parent event
event_inherited();
if (banding_target_inst != noone && instance_exists(banding_target_inst)) {
    instance_destroy(banding_target_inst)
}
