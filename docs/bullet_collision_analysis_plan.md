# 子弹碰撞问题排查与改造方案

## 1. 问题现象

当前已观察到以下问题：

1. 奥丁种在水神前方或靠近水神时，奥丁子弹会被水神反弹。
2. 部分子弹可以攻击到障碍物或卡片后方的老鼠。
3. 子弹发射点靠近障碍物时，子弹刚生成就消失，表现为无法发射。
4. 类似问题可能出现在其他直线子弹、穿透子弹和反弹子弹中。

## 2. 已定位的代码位置

### 2.1 奥丁子弹生成位置

文件：`objects/obj_odin/Other_11.gml`

```gml
var inst = instance_create_depth(x + 40, y - 95, depth - 500, obj_odin_bullet);
```

奥丁子弹以固定偏移创建。如果水神或障碍物的碰撞框覆盖这个位置，子弹在创建后的第一轮碰撞检测中就可能被当成已经撞上目标。

### 2.2 水神反弹逻辑

文件：`objects/obj_odin_bullet/Collision_obj_water_god.gml`

```gml
if (!bounced && row == other.grid_row)
{
    move_speed *= -1;
    damage += other.atk;
    image_angle += 180;
    bounced = true;
}
```

这段逻辑只判断：

- 子弹是否已经反弹过；
- 子弹和水神是否在同一行。

实际的对象碰撞由 GameMaker 根据 bbox 触发，因此没有判断子弹是否从水神正面进入，也没有排除子弹生成时已经重叠的情况。子弹只要和水神的碰撞框重叠，就会反弹。

### 2.3 当前版本的障碍物销毁逻辑

文件：`objects/obj_obstacle/Step_0.gml`

当前工作区已经存在一套额外的障碍物处理：

```gml
var _half_w = global.grid_cell_size_x / 2;
var _half_h = global.grid_cell_size_y / 2;
var _bullet = collision_rectangle(
    x - _half_w, y - _half_h,
    x + _half_w, y + _half_h,
    obj_bullet_parent, false, true
);
while (_bullet != noone)
{
    instance_destroy(_bullet);
    _bullet = collision_rectangle(
        x - _half_w, y - _half_h,
        x + _half_w, y + _half_h,
        obj_bullet_parent, false, true
    );
}
```

这段代码会销毁障碍物整格范围内的所有子弹。障碍物对象是在战斗初始化时创建的，子弹则是在攻击时后创建的。实际运行中，障碍物 Step 先检查子弹上一帧的位置，随后子弹 Step 移动并执行敌人检测，最后才可能触发子弹自己的障碍物 Collision 事件。因此子弹进入障碍物格子的这一帧，可能已经先对后方老鼠造成伤害，下一帧才被障碍物销毁。

另外，障碍物创建位置是格子中心向上偏移 35 像素，而碰撞矩形仍按完整格子大小计算。这使得障碍物的碰撞区域与直线子弹的发射高度相交，即使视觉上子弹已经接近格子边缘，也会被计入该障碍物格子。

### 2.4 子弹自己的障碍物 Collision 事件

文件：`objects/obj_odin_bullet/Collision_obj_obstacle.gml`

```gml
if (target_type == "normal" && row == other.row && precise_bbox_collision(id, other))
{
    // 播放命中特效
    instance_destroy();
}
```

这段逻辑会在当前帧碰撞框重叠时直接销毁子弹。它没有记录上一帧位置，也没有区分“从远处撞上障碍物”和“子弹生成时就在障碍物里面”，所以会导致近距离发射失败。

### 2.5 老鼠命中逻辑

文件：`objects/obj_odin_bullet/Step_0.gml`

奥丁子弹会遍历所有可命中的老鼠，并在当前 bbox 重叠时造成伤害：

```gml
if (ds_list_find_index(hitted_enemy, _e.id) == -1
    && _e.hp > 0 && row == _e.grid_row
    && precise_bbox_collision(id, _e))
```

这里没有判断同一帧内障碍物是否先于老鼠被撞到，也没有选择运动方向上的最近碰撞目标。因此，障碍物后面的老鼠可能仍然被命中。

### 2.6 其他子弹存在重复实现

仓库中有多个子弹对象分别实现了：

- `Collision_obj_water_god.gml`
- `Collision_obj_cherry_pudding.gml`
- `Collision_obj_obstacle.gml`

例如 `obj_rig_bullet` 既在 Step 中手动检测水神，又保留水神 Collision 事件。不同子弹的行号判断、bbox 判断和反弹规则并不完全一致，容易产生相同现象的不同变体。

## 3. 两个现象的直接原因

### 3.1 奥丁放在水神前一格时被反弹

奥丁的发射点不是格子右边界，而是从奥丁实例位置向右偏移 40 像素：

```gml
instance_create_depth(x + 40, y - 95, depth - 500, obj_odin_bullet);
```

子弹创建后会注册为 `obj_bullet_parent` 的子对象，并且 `obj_odin_bullet.yy` 同时注册了 `obj_water_god` 的 Collision 事件。水神事件只检查 `row == other.grid_row` 和自动 bbox 重叠，没有检查子弹是否已经从水神的反方向离开，也没有记录碰撞前的位置。

因此，只要奥丁子弹的碰撞框在创建或首次移动时与水神的碰撞框重叠，GameMaker 就会直接执行：

```gml
move_speed *= -1;
bounced = true;
```

这不是“前一格被当成同一格”的网格判断错误。真正的问题是：网格列没有参与水神反弹判断，而反弹事件只使用同一行加 bbox 重叠。若现场所说的“前一格”是上下相邻的一排，则需要进一步确认水神实例的 `grid_row` 是否被移动或平台逻辑改写；当前代码本身不会用 `grid_col` 过滤水神反弹。

### 3.2 可以攻击障碍物格子后方的老鼠

奥丁子弹在自己的 Step 中移动后，立即遍历 `global.enemy_by_type` 并按当前 bbox 命中所有符合行号的老鼠。它没有查询障碍物是否位于子弹和老鼠之间。

与此同时，障碍物的 Step 使用 `collision_rectangle` 销毁子弹，但这个检查发生在子弹完成当前 Step 的敌人检测之后，或者只检查到子弹移动前的位置。于是会出现以下顺序：

1. 子弹从障碍物前方移动到障碍物格子。
2. 子弹 Step 先检测到障碍物后的老鼠并造成伤害。
3. 障碍物 Step 或子弹 Collision 事件再销毁子弹。

所以现有障碍物逻辑确实存在，但它是“发现子弹进入格子后销毁”，不是“在子弹命中老鼠前先做遮挡判定”。

## 4. 根因判断

问题的共同根因是当前碰撞系统采用了“当前帧 bbox 重叠即处理”的方式：

1. 没有保存子弹上一帧位置。
2. 没有使用子弹的运动方向判断碰撞面。
3. 没有处理子弹生成时已经和目标重叠的情况。
4. 没有按运动方向选择最近的阻挡物。
5. 老鼠命中检测与障碍物阻挡检测相互独立。
6. 反弹和障碍物逻辑分散在大量对象的 Collision 事件中。

因此，水神误反弹、障碍物近距离吞弹、障碍物后方误伤，本质上属于同一类碰撞顺序和碰撞边界问题。

## 5. 建议的统一方案

### 4.1 在子弹父对象中增加统一状态

在 `obj_bullet_parent` 中统一维护以下字段：

- `previous_x`、`previous_y`：上一帧位置；
- `move_speed_x`、`move_speed_y`：实际运动方向；
- `spawn_grace_timer`：生成后的短暂保护时间；
- `bounced`：是否已经反弹；
- `collision_mode`：普通、穿透、追踪等碰撞类型；
- `blocks_on_obstacle`：是否被障碍物阻挡；
- `reflectable`：是否允许被水神或樱桃布丁反弹。

### 4.2 使用移动路径检测

子弹每帧移动时按以下顺序处理：

1. 保存上一帧位置。
2. 计算本帧移动后的包围区域，或计算从上一帧到当前帧的扫掠线段。
3. 收集同一行内的水神、樱桃布丁、障碍物和老鼠。
4. 根据运动方向计算它们在路径上的碰撞距离。
5. 优先处理距离最近的阻挡物。

这样可以避免高速子弹漏检，也可以保证障碍物先于其后的老鼠生效。

### 4.3 修正水神反弹条件

水神反弹应满足以下条件：

- 子弹确实朝水神方向移动；
- 上一帧子弹位于水神碰撞边界外；
- 当前帧越过了水神的正面边界；
- 子弹不是生成保护阶段；
- 子弹尚未反弹过。

反弹后需要把子弹位置推到水神边界外，防止下一帧继续处于重叠状态。

### 4.4 修正障碍物阻挡规则

对于普通直线子弹：

- 障碍物是第一个阻挡目标；
- 命中障碍物后播放特效并销毁子弹；
- 同一帧不再处理障碍物后方的老鼠。

对于穿透子弹：

- 可以穿透老鼠；
- 是否穿透障碍物由 `blocks_on_obstacle` 决定；
- 默认仍应被障碍物阻挡，除非该子弹明确声明可以穿透障碍物。

对于子弹生成时已经和障碍物重叠的情况：

- 生成保护阶段不触发障碍物命中；
- 子弹先移动到发射点外侧；
- 只有真正向前越过障碍物边界时才处理阻挡。

### 4.5 统一敌人命中顺序

敌人命中不能只遍历全部敌人并判断 bbox。应先得到运动方向上的候选目标，再按距离排序：

- 普通子弹命中最近的可攻击目标后停止；
- 穿透子弹按 `hitted_enemy` 记录，允许继续命中其他目标；
- 如果障碍物距离更近，则不处理其后的敌人。

## 6. 实施步骤

### 第一阶段：验证核心规则

先处理以下对象：

- `obj_odin_bullet`
- `obj_rig_bullet`
- `obj_corn_shooter_bullet`
- `obj_love_god_bullet`
- `obj_war_god_bullet`

验证三个场景：

1. 子弹贴近水神生成，不应立即反弹。
2. 子弹贴近障碍物生成，应能正常离开发射点。
3. 障碍物后方有老鼠时，普通子弹不应穿透障碍物命中老鼠。

### 第二阶段：抽取公共函数

建议新增公共脚本，例如：

- `bullet_collision_init`
- `bullet_collision_move`
- `bullet_find_first_blocker`
- `bullet_try_reflect`
- `bullet_hit_enemies`

各子弹对象只提供伤害、速度、行列、是否穿透等参数，不再各自复制完整碰撞逻辑。

### 第三阶段：迁移其他子弹

批量迁移剩余带有水神、樱桃布丁或障碍物 Collision 事件的子弹对象，并删除已经由公共函数接管的重复 Collision 事件，避免一次碰撞被处理两次。

## 7. 验收标准

- 奥丁放在水神前方或紧邻水神时，子弹不会在生成瞬间被反弹。
- 子弹靠近障碍物发射时，不会因为初始 bbox 重叠而直接消失。
- 障碍物可以阻挡普通直线子弹。
- 障碍物后方的老鼠不会被普通直线子弹误伤。
- 穿透子弹仍能穿透允许穿透的老鼠。
- 每个子弹最多反弹一次。
- 反弹后的子弹不会在同一个水神位置反复触发碰撞。
- 不同子弹对水神、樱桃布丁和障碍物使用一致的碰撞规则。

## 8. 当前结论

奥丁的问题不是单个伤害数值或生成间隔配置错误，而是子弹生成、自动 Collision 事件和 Step 中敌人扫描之间缺少统一的碰撞顺序。建议先按第一阶段修正奥丁和几种代表性子弹，再抽取公共碰撞函数，最后迁移其他子弹对象。

## 9. 子弹与水神的碰撞遮罩检查

### 9.1 当前配置

奥丁子弹使用 `spr_odin_bullet` 系列 sprite，基础 sprite 的自动 bbox 为：

- `bbox_left = 2`
- `bbox_right = 74`
- `bbox_top = 3`
- `bbox_bottom = 17`
- sprite 尺寸为 `77 x 22`
- `collisionKind = 0`

奥丁子弹 Create 事件又设置了：

```gml
image_xscale = 1.8;
image_yscale = 1.8;
```

因此 GameMaker 原生 Collision 事件使用的是放大后的子弹 mask，实际碰撞宽度约为 131 像素，高度约为 27 像素。

水神基础 sprite 的自动 bbox 为：

- `bbox_left = 11`
- `bbox_right = 61`
- `bbox_top = 24`
- `bbox_bottom = 80`
- sprite 尺寸为 `73 x 92`
- `collisionKind = 5`

水神和奥丁对象都没有设置 `spriteMaskId`，所以它们的自动 Collision 事件使用各自当前 `sprite_index` 的 sprite mask。

### 9.2 实际存在的范围不一致

水神反弹使用 GameMaker 原生 Collision 事件，会使用放大后的子弹 mask：

```gml
obj_odin_bullet -> obj_water_god
```

但奥丁命中老鼠使用 `precise_bbox_collision`。该函数读取 sprite 原始 bbox，并明确没有乘以 `image_xscale` 或 `image_yscale`。所以：

- 水神反弹判断：使用放大后的原生 mask；
- 老鼠命中判断：使用未放大的原始 bbox；
- 障碍物 Step：使用 `collision_rectangle` 检测父对象实例；
- 三者的碰撞范围不一致。

这会导致子弹看起来还没有完全碰到水神时，原生 Collision 已经先触发反弹；同时它对老鼠的自定义检测范围又比原生 mask 小。

### 9.3 结论

当前子弹和水神的 sprite bbox 没有明显的“整张图误判”问题，bbox 都是自动裁剪后的局部区域。但碰撞实现存在明确的不一致：同一颗奥丁子弹同时使用了缩放后的原生 mask 和未缩放的自定义 bbox。

因此，水神反弹异常不能只通过修改水神图片的 bbox 解决。应统一碰撞口径：要么所有检测都使用缩放后的实际 mask，要么所有检测都使用同一个不随视觉缩放变化的专用碰撞框，并且水神反弹还需要增加运动方向和上一帧位置判断。
