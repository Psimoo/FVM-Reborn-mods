import os, re

ROOT = os.path.dirname(os.path.abspath(__file__))
OBJ = os.path.join(ROOT, 'objects')

dirs = [d for d in os.listdir(OBJ) if os.path.isdir(os.path.join(OBJ, d))]
objs = set(dirs)

parent = {}
refs = {}
for d in dirs:
    path = os.path.join(OBJ, d)
    files = os.listdir(path)
    yy = next((f for f in files if f.endswith('.yy')), None)
    p = None
    if yy:
        txt = open(os.path.join(path, yy), encoding='utf-8', errors='replace').read()
        m = re.search(r'"parentObjectId"\s*:\s*\{[^}]*"name"\s*:\s*"([^"]*)"', txt)
        if m:
            p = m.group(1)
    parent[d] = p
    found = set()
    for f in files:
        if not f.endswith('.gml'):
            continue
        txt = open(os.path.join(path, f), encoding='utf-8', errors='replace').read()
        for name in re.findall(r'\b(obj_[A-Za-z0-9_]+)\b', txt):
            if name in objs and ('bullet' in name or 'explode' in name or 'ash_death' in name or 'death_effect' in name):
                found.add(name)
    refs[d] = found

memo = {}
def eff(d, seen=None):
    if d in memo:
        return memo[d]
    if seen is None:
        seen = set()
    if d in seen:
        return set()
    seen = seen | {d}
    out = set(refs.get(d, set()))
    p = parent.get(d)
    if p and p in objs:
        out |= eff(p, seen)
    memo[d] = out
    return out

entries = []
for d in sorted(dirs):
    s = eff(d)
    if s:
        entries.append((d, sorted(s)))

lines = []
lines.append('function obj_pool_build_deck_map() {')
lines.append('    var _m = {};')
for d, s in entries:
    lines.append('    _m[$ "%s"] = [%s];' % (d, ', '.join(s)))
lines.append('    return _m;')
lines.append('}')
lines.append('')
lines.append('function obj_pool_prewarm_deck() {')
lines.append('    if (!variable_global_exists("_obj_pool_ready") || !global._obj_pool_ready) obj_pool_init();')
lines.append('    if (!variable_global_exists("obj_pool_deck_prewarm")) global.obj_pool_deck_prewarm = 25;')
lines.append('    if (!variable_global_exists("obj_pool_prewarm_per_frame")) global.obj_pool_prewarm_per_frame = 8;')
lines.append('')
lines.append('    global._obj_pool_prewarm_queue = [];')
lines.append('')
lines.append('    var _count = global.obj_pool_deck_prewarm;')
lines.append('    if (_count <= 0) return;')
lines.append('    if (!variable_global_exists("_obj_pool_deck_map")) global._obj_pool_deck_map = obj_pool_build_deck_map();')
lines.append('    if (!variable_global_exists("selected_deck")) return;')
lines.append('')
lines.append('    var _done = ds_map_create();')
lines.append('    for (var i = 0; i < ds_list_size(global.selected_deck); i++) {')
lines.append('        var _e = global.selected_deck[| i];')
lines.append('        if (!ds_exists(_e, ds_type_map)) continue;')
lines.append('        if (!ds_map_exists(_e, "data")) continue;')
lines.append('        var _data = _e[? "data"];')
lines.append('        if (!ds_exists(_data, ds_type_map)) continue;')
lines.append('        if (!ds_map_exists(_data, "obj")) continue;')
lines.append('        var _plant = _data[? "obj"];')
lines.append('        if (!is_real(_plant) || _plant < 0) continue;')
lines.append('        var _name = object_get_name(_plant);')
lines.append('        if (!variable_struct_exists(global._obj_pool_deck_map, _name)) continue;')
lines.append('        var _bullets = global._obj_pool_deck_map[$ _name];')
lines.append('        for (var j = 0; j < array_length(_bullets); j++) {')
lines.append('            var _b = _bullets[j];')
lines.append('            if (!is_real(_b) || _b < 0) continue;')
lines.append('            var _bk = string(_b);')
lines.append('            if (ds_map_exists(_done, _bk)) continue;')
lines.append('            ds_map_add(_done, _bk, true);')
lines.append('            array_push(global._obj_pool_prewarm_queue, [_b, _count]);')
lines.append('        }')
lines.append('    }')
lines.append('    ds_map_destroy(_done);')
lines.append('    obj_pool_prewarm_tick();')
lines.append('}')
lines.append('')
lines.append('function obj_pool_prewarm_tick() {')
lines.append('    if (!variable_global_exists("_obj_pool_prewarm_queue") || !is_array(global._obj_pool_prewarm_queue)) return;')
lines.append('    var _q = global._obj_pool_prewarm_queue;')
lines.append('    var _budget = global.obj_pool_prewarm_per_frame;')
lines.append('    for (var i = array_length(_q) - 1; i >= 0 && _budget > 0; i--) {')
lines.append('        var _item = _q[i];')
lines.append('        obj_pool_prealloc(_item[0], 1);')
lines.append('        _item[1] -= 1;')
lines.append('        _budget -= 1;')
lines.append('        if (_item[1] <= 0) array_delete(_q, i, 1);')
lines.append('    }')
lines.append('    if (array_length(_q) == 0) global._obj_pool_prewarm_queue = [];')
lines.append('}')
lines.append('')

outdir = os.path.join(ROOT, 'scripts', 'obj_pool_deck')
os.makedirs(outdir, exist_ok=True)
with open(os.path.join(outdir, 'obj_pool_deck.gml'), 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

total = sum(len(s) for _, s in entries)
print('objects scanned:', len(dirs))
print('map entries:', len(entries))
print('total bullet refs:', total)

yyp = open(os.path.join(ROOT, 'FVM_Reborn_makk.yyp'), encoding='utf-8', errors='replace').read()
missing = []
for d, s in entries:
    for b in s:
        if ('"%s"' % b) not in yyp:
            missing.append((d, b))
print('refs missing from yyp:', len(missing))
if missing:
    print('EXAMPLES:', missing[:20])
print('sample:', entries[:5])
