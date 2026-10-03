image_xscale = 1.6;
image_yscale = 1.6;
instance_create_depth(1473, 284, depth - 1, obj_gods_hall_closer);
instance_create_depth(1296, 284, depth - 1, obj_gods_store_enter);
is_submenu_opened = false;
is_wishing = false;
wish_completed = true;
start_wishing = false;
start_wishing5 = false;
start_wishing50 = false;
skip_animation = false;
reward_id = [];
reward_list = [];
random_begin = false;
var wish = instance_create_depth((x + 2) - 300, 732, depth - 1, obj_gods_hall_wish);
wish.parent_gui = id;
wish.mode = 0;
var wish5 = instance_create_depth(x + 2, 732, depth - 1, obj_gods_hall_wish);
wish5.parent_gui = id;
wish5.mode = 1;
var wish50 = instance_create_depth(x + 2 + 300, 732, depth - 1, obj_gods_hall_wish);
wish50.parent_gui = id;
wish50.mode = 2;
var bag = instance_create_depth(x + 2, (room_height / 2) - 50, depth - 1, obj_gods_hall_bag);
bag.parent_gui = id;
bag.list_num = 0;

if (!variable_struct_exists(global.save_data.player, "wish_count"))
    global.save_data.player.wish_count = 0;
if (!variable_struct_exists(global.save_data.player, "pity_count"))
    global.save_data.player.pity_count = 0;

function gods_hall_get_random_reward()
{
    // 抽卡模式：不出神谕之石
    if (is_eternal_gacha_mode()) {
        var r = irandom(999);
        if (r < 244)
            return ["金币", 1000];
        else if (r < 334)
            return ["金币", 5000];
        else if (r < 374)
            return ["金币", 10000];
        else if (r < 516)
            return ["天然香料", 25];
        else if (r < 556)
            return ["天然香料", 50];
        else if (r < 566)
            return ["天然香料", 200];
        else if (r < 656)
            return ["秘制香料", 25];
        else if (r < 676)
            return ["秘制香料", 50];
        else if (r < 686)
            return ["秘制香料", 200];
        else if (r < 786)
            return ["初级强化水晶", 25];
        else if (r < 826)
            return ["初级强化水晶", 50];
        else if (r < 896)
            return ["中级强化水晶", 25];
        else if (r < 926)
            return ["中级强化水晶", 50];
        else if (r < 956)
            return ["4级四叶草", 20];
        else
            return ["高级强化水晶", 20];
    }

    var r = irandom(999);

    if (r < 244)
        return ["金币", 1000];
    else if (r < 334)
        return ["金币", 5000];
    else if (r < 374)
        return ["金币", 10000];
    else if (r < 377)
        return ["神谕之石", 5];
    else if (r < 379)
        return ["神谕之石", 10];
    else if (r < 380)
        return ["神谕之石", 25];
    else if (r < 510)
        return ["天然香料", 25];
    else if (r < 550)
        return ["天然香料", 50];
    else if (r < 560)
        return ["天然香料", 200];
    else if (r < 650)
        return ["秘制香料", 25];
    else if (r < 670)
        return ["秘制香料", 50];
    else if (r < 680)
        return ["秘制香料", 200];
    else if (r < 780)
        return ["初级强化水晶", 25];
    else if (r < 820)
        return ["初级强化水晶", 50];
    else if (r < 890)
        return ["中级强化水晶", 25];
    else if (r < 920)
        return ["中级强化水晶", 50];
    else if (r < 950)
        return ["4级四叶草", 20];
    else
        return ["高级强化水晶", 20];
}

function gods_hall_get_guarantee_reward()
{
    // 抽卡模式：保底只出四级四叶草和高级强化水晶
    if (is_eternal_gacha_mode()) {
        var r = irandom(99);
        if (r < 50)
            return ["4级四叶草", 25];
        else
            return ["高级强化水晶", 25];
    }

    if (global.save_data.player.pity_count % 2 == 0)
    {
        var r = irandom(99);
        if (r < 60)
            return ["4级四叶草", 25];
        else if (r < 80)
            return ["高级强化水晶", 25];
        else
        {
            var r2 = irandom(99);
            if (r2 < 60)
                return ["神谕之石", 5];
            else if (r2 < 80)
                return ["神谕之石", 10];
            else
                return ["神谕之石", 25];
        }
    }
    else
    {
        var r = irandom(99);
        if (r < 60)
            return ["神谕之石", 5];
        else if (r < 80)
            return ["神谕之石", 10];
        else
            return ["神谕之石", 25];
    }
}
