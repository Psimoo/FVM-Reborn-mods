import json, re

FILES = [
    r'd:\gameProject\FVM-Reborn-mod\datafiles\level_data\volcanic\cheese_castle_warrior.json',
    r'd:\gameProject\FVM-Reborn-mod\datafiles\level_data\volcanic\cheese_castle_warrior_hard.json',
]
NEW = '240.0'

def robust_load(raw):
    for cut in range(len(raw), 0, -1):
        try:
            return json.loads(raw[:cut])
        except Exception:
            continue
    raise RuntimeError('no valid prefix')

pat = re.compile(r'("local_max_wave_time":\s*)360\.0(\s*,\s*"local_min_wave_time":\s*)360\.0')

for PATH in FILES:
    raw = open(PATH, encoding='utf-8').read()
    before = len(pat.findall(raw))
    new_raw = pat.sub(lambda m: m.group(1) + NEW + m.group(2) + NEW, raw)
    if raw.endswith('\x00') and not new_raw.endswith('\x00'):
        new_raw += '\x00'
    if new_raw != raw:
        open(PATH, 'w', encoding='utf-8', newline='').write(new_raw)
    data = robust_load(open(PATH, encoding='utf-8').read())
    print('FILE:', PATH.split('\\')[-1])
    print('  pairs replaced:', before)
    for wi in [2, 3, 5]:
        w = data['waves'][wi]
        sub = w['subwaves']
        mins = set(s.get('local_min_wave_time') for s in sub)
        maxs = set(s.get('local_max_wave_time') for s in sub)
        print('  wave%d idx=%s boss=%r min=%s max=%s' % (wi, w.get('wave_index'), w.get('boss'), sorted(mins), sorted(maxs)))
    # confirm non-boss unchanged
    for wi in [0, 1, 4]:
        sub = data['waves'][wi]['subwaves']
        maxs = set(s.get('local_max_wave_time') for s in sub)
        print('  wave%d idx=%s (non-boss) max=%s' % (wi, data['waves'][wi].get('wave_index'), sorted(maxs)))
    print()