var _my_id = id;
with (obj_card_parent) {
    if (id != _my_id && variable_instance_exists(id, "chongsheng_buff_source") && chongsheng_buff_source == _my_id) {
        chongsheng_buff_timer = 0;
        chongsheng_buff_reduction = 0;
        chongsheng_buff_source = noone;
    }
}
event_inherited();
