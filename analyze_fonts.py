import re, json, glob, os

target_names = ['font_yuan','font_hei','font_song','font_song2','font_pixel','font_number','scribble_fallback_font']
chars = list('喵<煲炫飨羿豚沌黯漪槃肴黏鳗鲨啰±戟阈焗涮绮')
targets = set(ord(c) for c in chars)

for name in target_names:
    p = 'fonts/' + name + '/' + name + '.yy'
    with open(p, encoding='utf-8') as f:
        txt = f.read()
    m = re.search(r'"ranges":\[(.*?)\]\s*,\s*"regenerateBitmap"', txt, re.S)
    if not m:
        # fallback: find ranges up to next key
        m = re.search(r'"ranges":\[(.*?)\]', txt, re.S)
    ranges = []
    if m:
        for lm in re.finditer(r'"lower":(\d+),"upper":(\d+)', m.group(1)):
            ranges.append((int(lm.group(1)), int(lm.group(2))))
    missing = sorted(cp for cp in targets if not any(lo<=cp<=hi for lo,hi in ranges))
    present = sorted(cp for cp in targets if any(lo<=cp<=hi for lo,hi in ranges))
    print('===', name, '| ranges count =', len(ranges))
    print('  PRESENT:', ''.join(chr(cp) for cp in present))
    print('  MISSING:', ''.join(chr(cp) for cp in missing))