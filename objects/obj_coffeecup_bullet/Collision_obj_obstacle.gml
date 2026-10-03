if (!active || pooled){
    exit
}
if target_type == "normal" && row == other.row && precise_bbox_collision(id, other){
    var _fx = pool_acquire(obj_coffeecup_bullet_effect, x, y, depth);
    _fx.pooled_managed = true;
    _fx.timer = 0;
    _fx.image_index = 0;
    pool_release_bullet(id, "obstacle")
}