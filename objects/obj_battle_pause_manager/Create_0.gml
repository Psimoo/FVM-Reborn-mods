// obj_battle_pause_manager - Create Event
global.is_paused = false;
global.show_menu = false; // 新增变量控制菜单显示
depth = -3000

// 暂停来源分离（global.is_paused 仍然是对外的统一冻结标志）：
//   entry_pause  : 进关暂停——等待玩家放置人物，只能由“人物已放置”解除
//   manual_pause : 手动暂停——空格/ESC 触发，只能由手动操作解除
// 两者不再互相覆盖，避免“进关暂停”每帧把 is_paused 重新置位造成自锁。
entry_pause = true;
manual_pause = false;

settlement = false
first_complete = false
gacha_settlement_done = false
gacha_confirm_btn_hover = false

slot_unlock_level_id_list = ["cookie_island","salad_island_land","salad_island_water","champagne_island_land","champagne_island_water","cocoa_island_daytime","curry_island_night"]