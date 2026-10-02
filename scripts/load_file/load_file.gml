/// @function load_file(file_slot)
/// @desc 加载存档文件到全局变量global.save_data中
/// @param {real} file_slot 存档槽位
function load_file(file_slot) {
	var file_path = "saves/" + "save" + string(file_slot) + ".json"
    // 检查存档文件是否存在
    if (!file_exists(file_path)) {
        // 如果存档不存在，创建初始存档数据
        reset_file(file_slot)
        random_gift_sync_unlock()
        return true;
    }
    
    // 打开存档文件
    var file = file_text_open_read(file_path);
    if (file == -1) {
        show_debug_message("无法打开存档文件!");
        return false;
    }
    
    // 读取文件内容
    var json_string = "";
    while (!file_text_eof(file)) {
        json_string += file_text_read_string(file);
        file_text_readln(file);
    }
    file_text_close(file);
    
    // 解析JSON字符串
    try {
        global.save_data = json_parse(json_string);
        show_debug_message("存档加载成功!");

        var _v = global.save_data.version;

        // 1.4 版本特有迁移：根据已通关关卡解锁武器/卡片
        if _v == "1.4" || _v == 1.4 {
            if array_get_index(global.save_data.completed_levels, "cocoa_island_night") != -1 {
                unlock_weapon("double_water_gun")
            }
            if array_get_index(global.save_data.completed_levels, "abyss") != -1 {
                unlock_card("chocolate_pult", 0, 0, 5)
            }
        }

        // 非破坏性迁移：补充缺失字段，保留通关记录和游玩时间等进度数据
        ensure_save_data()

        return true;
    } catch(e) {
        show_debug_message("存档解析错误: " + string(e));
        return false;
    }
}

function ensure_save_data() {
    // 确保 player 结构存在且包含必需字段（不覆盖已有值）
    if !variable_struct_exists(global.save_data, "player") {
        global.save_data.player = {}
    }
    var _p = global.save_data.player
    if !variable_struct_exists(_p, "gold") { _p.gold = 50000 }
    if !variable_struct_exists(_p, "level") { _p.level = 1 }
    if !variable_struct_exists(_p, "experience") { _p.experience = 0 }
    if !variable_struct_exists(_p, "name") { _p.name = "Player" }
    if !variable_struct_exists(_p, "total_time") { _p.total_time = 0 }
    if !variable_struct_exists(_p, "crown_version") { _p.crown_version = "0.0.0" }

    if !variable_struct_exists(global.save_data, "completed_levels") || !is_array(global.save_data.completed_levels) {
        global.save_data.completed_levels = []
    }
    if !variable_struct_exists(global.save_data, "completed_elite_levels") || !is_array(global.save_data.completed_elite_levels) {
        global.save_data.completed_elite_levels = []
    }
    if !variable_struct_exists(global.save_data, "gacha_box_buy_count") {
        global.save_data.gacha_box_buy_count = 0
    }
    if !variable_struct_exists(global.save_data, "inventory") || !is_array(global.save_data.inventory) {
        global.save_data.inventory = []
    }
    if !variable_struct_exists(global.save_data, "unlocked_items") {
        global.save_data.unlocked_items = {
            max_card_level: 0,
            max_skill_level: 0,
            max_gem_level: 0,
            max_slot: 5,
            max_shape: [],
            shovel: "normal",
            elite_unlocked: false,
            mario_mouse_killed: false,
            arno_killed: false
        }
    } else {
        var _ui = global.save_data.unlocked_items
        if !variable_struct_exists(_ui, "max_card_level") { _ui.max_card_level = 0 }
        if !variable_struct_exists(_ui, "max_skill_level") { _ui.max_skill_level = 0 }
        if !variable_struct_exists(_ui, "max_gem_level") { _ui.max_gem_level = 0 }
        if !variable_struct_exists(_ui, "max_slot") { _ui.max_slot = 5 }
        if !variable_struct_exists(_ui, "max_shape") { _ui.max_shape = [] }
        if !variable_struct_exists(_ui, "shovel") { _ui.shovel = "normal" }
        if !variable_struct_exists(_ui, "elite_unlocked") { _ui.elite_unlocked = false }
        if !variable_struct_exists(_ui, "mario_mouse_killed") { _ui.mario_mouse_killed = false }
        if !variable_struct_exists(_ui, "arno_killed") { _ui.arno_killed = false }
    }
    if !variable_struct_exists(global.save_data, "unlocked_cards") || !is_array(global.save_data.unlocked_cards) {
        global.save_data.unlocked_cards = [
            {id: "small_fire", level: 0, shape: 0, skill: 0, max_level: 0, max_shape: 0},
            {id: "toast_bread", level: 0, shape: 0, skill: 0, max_level: 0, max_shape: 0},
            {id: "xiao_long_bao", level: 0, shape: 0, skill: 0, max_level: 0, max_shape: 0},
            {id: "flour_sack", level: 0, shape: 0, skill: 0, max_level: 0, max_shape: 0}
        ]
    }
    random_gift_sync_unlock();
    if !variable_struct_exists(global.save_data, "unlocked_weapons") || !is_array(global.save_data.unlocked_weapons) {
        global.save_data.unlocked_weapons = [{id: "long_bao_gun"}]
    }
    if !variable_struct_exists(global.save_data, "unlocked_gems") || !is_array(global.save_data.unlocked_gems) {
        global.save_data.unlocked_gems = []
    }
    if !variable_struct_exists(global.save_data, "equipped_items") {
        global.save_data.equipped_items = {
            main_weapon: {id: "long_bao_gun", gems: []},
            secondary_weapon: {id: "", gems: []},
            super_weapon: {id: "", gems: []}
        }
    } else {
        var _ei = global.save_data.equipped_items
        if !variable_struct_exists(_ei, "main_weapon") { _ei.main_weapon = {id: "long_bao_gun", gems: []} }
        if !variable_struct_exists(_ei, "secondary_weapon") { _ei.secondary_weapon = {id: "", gems: []} }
        if !variable_struct_exists(_ei, "super_weapon") { _ei.super_weapon = {id: "", gems: []} }
    }
    if !variable_struct_exists(global.save_data, "saved_decks") || !is_array(global.save_data.saved_decks) {
        global.save_data.saved_decks = [
            {name: "卡组1", card_id: []},
            {name: "卡组2", card_id: []},
            {name: "卡组3", card_id: []},
            {name: "卡组4", card_id: []},
            {name: "卡组5", card_id: []},
            {name: "卡组6", card_id: []}
        ]
    }
    if !variable_struct_exists(global.save_data, "tasks") || !is_array(global.save_data.tasks) {
        global.save_data.tasks = [
            {id: "main_level_0", progress: [0], state: "new"},
            {id: "card_upgrade_1", progress: [0], state: "new"},
            {id: "flame_save_1", progress: [0, 0], state: "new"},
            {id: "perfect_challenge_1", progress: [0, 0, 0], state: "new"},
            {id: "hardcore_challenge_1", progress: [0, 0, 0], state: "new"}
        ]
    }
    if !variable_struct_exists(global.save_data, "completed_tasks") || !is_array(global.save_data.completed_tasks) {
        global.save_data.completed_tasks = []
    }
    if !variable_struct_exists(global.save_data, "attires") || !is_array(global.save_data.attires) {
        global.save_data.attires = []
    }
    if !variable_struct_exists(global.save_data, "equipped_cookbook") || !is_array(global.save_data.equipped_cookbook) {
        global.save_data.equipped_cookbook = [[], [], []]
    }

    global.save_data.version = 1.8
}

function reset_file(file_slot){
	//重置到初始存档
	global.save_data = {
            "version": 1.8,
            "player": {
                "gold": 50000,
                "level": 1,
                "experience": 0,
				"name":"Player",
				"total_time":0,
				"crown_version":"0.0.0"
            },
            "unlocked_cards": [
                {"id": "small_fire", "level": 0, "shape": 0,"skill":0,"max_level":0,"max_shape":0},
				{"id": "toast_bread", "level": 0, "shape": 0,"skill":0,"max_level":0,"max_shape":0},
				{"id": "xiao_long_bao", "level": 0, "shape": 0,"skill":0,"max_level":0,"max_shape":0},
				{"id": "flour_sack", "level": 0, "shape": 0,"skill":0,"max_level":0,"max_shape":0},
            ],
            "completed_levels": [],
            "completed_elite_levels": [],
            "gacha_box_buy_count": 0,
            "inventory": [],
            "unlocked_items": {
                "max_card_level": 0,
                "max_skill_level": 0,
                "max_gem_level": 0,
				"max_slot":5,
				"max_shape":[],
				"shovel":"normal",
				"elite_unlocked":false,
				"mario_mouse_killed":false,
				"arno_killed":false
            },
            "unlocked_weapons": [
                {"id": "long_bao_gun"}
            ],
			"unlocked_gems":[],
			"equipped_items":{
				"main_weapon":{
					"id":"long_bao_gun",
					"gems":[]
				},
				"secondary_weapon":{
					"id":"",
					"gems":[]
				},
				"super_weapon":{
					"id":"",
					"gems":[]
				}
			},
			"saved_decks":[
				{"name":"卡组1","card_id":[]},
				{"name":"卡组2","card_id":[]},
				{"name":"卡组3","card_id":[]},
				{"name":"卡组4","card_id":[]},
				{"name":"卡组5","card_id":[]},
				{"name":"卡组6","card_id":[]} 
			],
			"tasks":[
				{
					"id":"main_level_0",
					"progress":[0],
					"state":"new"
				},
				{
					"id":"card_upgrade_1",
					"progress":[0],
					"state":"new"
				},
				{
					"id":"flame_save_1",
					"progress":[0,0],
					"state":"new"
				},
				{
					"id":"perfect_challenge_1",
					"progress":[0,0,0],
					"state":"new"
				},
				{
					"id":"hardcore_challenge_1",
					"progress":[0,0,0],
					"state":"new"
				}
			],
			"completed_tasks":[],
			"attires":[],
			"equipped_cookbook":[[],[],[]]
        };
	save_file(file_slot)
}
