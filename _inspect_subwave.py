import json, os

D = r'd:\gameProject\FVM-Reborn-mod\datafiles\level_data\volcanic'

def robust_load(path):
    raw = open(path, encoding='utf-8').read()
    for cut in range(len(raw), 0, -1):
        try:
            return json.loads(raw[:cut])
        except json.JSONDecodeError:
            continue
    raise RuntimeError('no valid prefix')

data = robust_load(os.path.join(D, 'cheese_castle_warrior.json'))

# dump full keys of one subwave, and the full first subwave of each wave
for wi in [0,1,2,3,4,5]:
    w = data['waves'][wi]
    s0 = w['subwaves'][0]
    print('==== wave%d boss=%s boss=%r' % (wi, w.get('boss_wave'), w.get('boss')))
    print('  wave-level keys:', sorted(w.keys()))
    print('  s0 keys:', sorted(s0.keys()))
    # print full subwave 0 (compact)
    print('  s0 =', json.dumps(s0, ensure_ascii=False)[:400])
    # print the last subwave too (to see how wave ends)
    s_last = w['subwaves'][-1]
    print('  s_last(min/max)=', s_last.get('local_min_wave_time'), s_last.get('local_max_wave_time'))
    print()