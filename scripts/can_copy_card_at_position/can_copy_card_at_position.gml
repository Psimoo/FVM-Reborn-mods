/// @function can_copy_card_at_position(x, y, plant_type, feature_type, card_id, base_target_card)
/// @description Copy placement check that prevents a copied target card from stacking on itself.
/// @param {real} x X coordinate
/// @param {real} y Y coordinate
/// @param {string} plant_type Plant type of the card being copied
/// @param {string} feature_type Feature type of the card being copied
/// @param {string} card_id Plant ID of the card being copied (for dedup check)
/// @param {string} base_target_card Target card (base requirement) of the card being copied
function can_copy_card_at_position(_x, _y, _plant_type, _feature_type, _card_id, _base_target_card) {
    // Normalize base target: undefined becomes "none" for non-upgrade cards
    var _actual_base = _base_target_card;
    if (_actual_base == undefined)
        _actual_base = "none";

    if (!can_place_at_position(_x, _y, _plant_type, _feature_type, _actual_base))
        return false;

    var _grid_pos = get_grid_position_from_world(_x, _y);
    var _plant_list = ds_grid_get(global.grid_plants, _grid_pos.col, _grid_pos.row);

    for (var i = 0; i < ds_list_size(_plant_list); i++) {
        var _plant = ds_list_find_value(_plant_list, i);
        if (instance_exists(_plant)
            && variable_instance_exists(_plant, "plant_id")
            && _plant.plant_id == _card_id
            && _feature_type != "upgrade") {
            return false;
        }
    }

    return true;
}
