// 工匠神竖向子弹 - 销毁事件
if (ds_exists(hitted_enemy, ds_type_list))
    ds_list_destroy(hitted_enemy);
