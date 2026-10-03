import os, re, sys

ROOT = r'D:\PVZ\FVMRMakk\FVM-Reborn-mods'
OBJ = os.path.join(ROOT, 'objects')
DRY = ('--apply' not in sys.argv)
INTERVAL = 2

NEEDLE = 'variable_global_exists("enemy_by_type")'

def find_block(text, i):
    """从 i 之后找第一个 '{'，再做括号配对，返回 (block_open, block_close)。"""
    j = text.find('{', i)
    if j < 0:
        return None
    depth = 0
    k = j
    while k < len(text):
        c = text[k]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                return (j, k)
        k += 1
    return None

changed, skipped = [], []

dirs = sorted(d for d in os.listdir(OBJ) if 'bullet' in d)
for d in dirs:
    p = os.path.join(OBJ, d, 'Step_0.gml')
    if not os.path.isfile(p):
        continue
    raw = open(p, 'rb').read().decode('utf-8', errors='replace')
    nl = '\r\n' if '\r\n' in raw else '\n'
    t = raw.replace('\r\n', '\n')

    if 'bullet_hit_interval' in t:
        skipped.append((d, 'already')); continue
    if t.count(NEEDLE) != 1:
        skipped.append((d, 'needle x%d' % t.count(NEEDLE))); continue
    if 'precise_bbox_collision' not in t:
        skipped.append((d, 'no pbc')); continue

    i = t.find(NEEDLE)
    blk = find_block(t, i)
    if blk is None:
        skipped.append((d, 'no brace match')); continue
    j, k = blk
    inner = t[j:k + 1]
    # 只允许包裹"遍历敌人 + 精密碰撞"的循环块
    if 'precise_bbox_collision' not in inner or 'instance_exists' not in inner:
        skipped.append((d, 'block not collision loop')); continue
    if ('for (' not in inner) and ('while (' not in inner):
        skipped.append((d, 'no loop in block')); continue

    # 插到 if 所在行的行首
    line_start = t.rfind('\n', 0, i) + 1
    indent = re.match(r'[ \t]*', t[line_start:]).group(0)

    gate = (
        indent + 'if (!variable_instance_exists(id, "hit_tick")) hit_tick = 0;\n' +
        indent + 'if (!variable_global_exists("bullet_hit_interval")) global.bullet_hit_interval = %d;\n' % INTERVAL +
        indent + 'hit_tick++;\n' +
        indent + 'if (hit_tick >= global.bullet_hit_interval)\n' +
        indent + '{\n' +
        indent + '\thit_tick = 0;\n'
    )
    new = t[:line_start] + gate + t[line_start:k + 1] + '\n' + indent + '}\n' + t[k + 1:]

    if DRY:
        changed.append((d, len(t), len(new)))
    else:
        out = new.replace('\n', nl)
        open(p, 'w', encoding='utf-8', newline='').write(out)
        changed.append((d, len(t), len(new)))

    show = [a.split('=', 1)[1] for a in sys.argv if a.startswith('--show=')]
    if show and d in show:
        print('===== PREVIEW %s =====' % d)
        print(new[:1500])

print('DRY' if DRY else 'APPLY', '-> changed', len(changed), ' skipped', len(skipped))
print('--- changed ---')
for c in changed:
    print('   ', c[0])
print('--- skipped ---')
for s in skipped:
    print('   %-42s %s' % (s[0], s[1]))
