if (start_wishing)
{
    is_wishing = true;
    random_begin = true;
    wish_completed = false;
    skip_animation = false;
    start_wishing = false;
}

if (random_begin)
{
    var _is_pity = (global.save_data.player.wish_count >= 50);
    reward_id = _is_pity ? gods_hall_get_guarantee_reward() : gods_hall_get_random_reward();

    switch (reward_id[0])
    {
        case "金币":
            global.save_data.player.gold += reward_id[1];
            global.save_data.player.wish_count++;
            break;

        case "神谕之石":
            add_material_amount("oracle_stone", reward_id[1]);
            global.save_data.player.wish_count = 0;
            if (_is_pity)
                global.save_data.player.pity_count++;
            break;

        case "天然香料":
            add_material_amount("natural_spices", reward_id[1]);
            global.save_data.player.wish_count++;
            break;

        case "秘制香料":
            add_material_amount("secret_spices", reward_id[1]);
            global.save_data.player.wish_count++;
            break;

        case "初级强化水晶":
            add_material_amount("less_crystal", reward_id[1]);
            global.save_data.player.wish_count++;
            break;

        case "中级强化水晶":
            add_material_amount("middle_crystal", reward_id[1]);
            global.save_data.player.wish_count++;
            break;

        case "4级四叶草":
            add_material_amount("clover_4", reward_id[1]);
            if (_is_pity)
            {
                global.save_data.player.wish_count = 0;
                global.save_data.player.pity_count++;
            }
            else
                global.save_data.player.wish_count++;
            break;

        case "高级强化水晶":
            add_material_amount("advanced_crystal", reward_id[1]);
            if (_is_pity)
            {
                global.save_data.player.wish_count = 0;
                global.save_data.player.pity_count++;
            }
            else
                global.save_data.player.wish_count++;
            break;
    }

    array_push(reward_list, reward_id);
    random_begin = false;
}

if (start_wishing5)
{
    is_wishing = true;
    skip_animation = false;
    var bag2 = instance_create_depth(x + 2 + 150, (room_height / 2) - 50, depth - 1, obj_gods_hall_bag);
    bag2.parent_gui = id;
    bag2.list_num = 1;
    bag2.image_alpha = 0;
    var bag3 = instance_create_depth(x + 2 + 300, (room_height / 2) - 50, depth - 1, obj_gods_hall_bag);
    bag3.parent_gui = id;
    bag3.list_num = 2;
    bag3.image_alpha = 0;
    var bag4 = instance_create_depth((x + 2) - 150, (room_height / 2) - 50, depth - 2, obj_gods_hall_bag);
    bag4.parent_gui = id;
    bag4.list_num = 3;
    bag4.image_alpha = 0;
    var bag5 = instance_create_depth((x + 2) - 300, (room_height / 2) - 50, depth - 3, obj_gods_hall_bag);
    bag5.parent_gui = id;
    bag5.list_num = 4;
    bag5.image_alpha = 0;
    
    for (var i = 0; i < 5; i++)
    {
        var _is_pity = (global.save_data.player.wish_count >= 50);
        reward_id = _is_pity ? gods_hall_get_guarantee_reward() : gods_hall_get_random_reward();

        switch (reward_id[0])
        {
            case "金币":
                global.save_data.player.gold += reward_id[1];
                global.save_data.player.wish_count++;
                break;

            case "神谕之石":
                add_material_amount("oracle_stone", reward_id[1]);
                global.save_data.player.wish_count = 0;
                if (_is_pity)
                    global.save_data.player.pity_count++;
                break;

            case "天然香料":
                add_material_amount("natural_spices", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "秘制香料":
                add_material_amount("secret_spices", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "初级强化水晶":
                add_material_amount("less_crystal", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "中级强化水晶":
                add_material_amount("middle_crystal", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "4级四叶草":
                add_material_amount("clover_4", reward_id[1]);
                if (_is_pity)
                {
                    global.save_data.player.wish_count = 0;
                    global.save_data.player.pity_count++;
                }
                else
                    global.save_data.player.wish_count++;
                break;

            case "高级强化水晶":
                add_material_amount("advanced_crystal", reward_id[1]);
                if (_is_pity)
                {
                    global.save_data.player.wish_count = 0;
                    global.save_data.player.pity_count++;
                }
                else
                    global.save_data.player.wish_count++;
                break;
        }

        array_push(reward_list, reward_id);
    }
    
    wish_completed = false;
    start_wishing5 = false;
}

if (start_wishing50)
{
    is_wishing = true;
    skip_animation = false;
    var bag2 = instance_create_depth(x + 2 + 150, (room_height / 2) - 50, depth - 1, obj_gods_hall_bag);
    bag2.parent_gui = id;
    bag2.list_num = 1;
    bag2.image_alpha = 0;
    var bag3 = instance_create_depth(x + 2 + 300, (room_height / 2) - 50, depth - 1, obj_gods_hall_bag);
    bag3.parent_gui = id;
    bag3.list_num = 2;
    bag3.image_alpha = 0;
    var bag4 = instance_create_depth((x + 2) - 150, (room_height / 2) - 50, depth - 2, obj_gods_hall_bag);
    bag4.parent_gui = id;
    bag4.list_num = 3;
    bag4.image_alpha = 0;
    var bag5 = instance_create_depth((x + 2) - 300, (room_height / 2) - 50, depth - 3, obj_gods_hall_bag);
    bag5.parent_gui = id;
    bag5.list_num = 4;
    bag5.image_alpha = 0;

    for (var i = 0; i < 50; i++)
    {
        var _is_pity = (global.save_data.player.wish_count >= 50);
        reward_id = _is_pity ? gods_hall_get_guarantee_reward() : gods_hall_get_random_reward();

        switch (reward_id[0])
        {
            case "金币":
                global.save_data.player.gold += reward_id[1];
                global.save_data.player.wish_count++;
                break;

            case "神谕之石":
                add_material_amount("oracle_stone", reward_id[1]);
                global.save_data.player.wish_count = 0;
                if (_is_pity)
                    global.save_data.player.pity_count++;
                break;

            case "天然香料":
                add_material_amount("natural_spices", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "秘制香料":
                add_material_amount("secret_spices", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "初级强化水晶":
                add_material_amount("less_crystal", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "中级强化水晶":
                add_material_amount("middle_crystal", reward_id[1]);
                global.save_data.player.wish_count++;
                break;

            case "4级四叶草":
                add_material_amount("clover_4", reward_id[1]);
                if (_is_pity)
                {
                    global.save_data.player.wish_count = 0;
                    global.save_data.player.pity_count++;
                }
                else
                    global.save_data.player.wish_count++;
                break;

            case "高级强化水晶":
                add_material_amount("advanced_crystal", reward_id[1]);
                if (_is_pity)
                {
                    global.save_data.player.wish_count = 0;
                    global.save_data.player.pity_count++;
                }
                else
                    global.save_data.player.wish_count++;
                break;
        }

        array_push(reward_list, reward_id);
    }

    wish_completed = false;
    start_wishing50 = false;
}
