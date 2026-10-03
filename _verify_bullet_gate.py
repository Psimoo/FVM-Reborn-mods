import os, re, sys

ROOT = r'D:\PVZ\FVMRMakk\FVM-Reborn-mods'
OBJ = os.path.join(ROOT, 'objects')

def strip_code(text):
    """粗略去掉 // 注释、字符串、字符常量，用于括号配平检查。"""
    out = []
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c == '/' and i + 1 < n and text[i+1] == '/':
            while i < n and text[i] != '\n':
                i += 1
            continue
        if c == '/' and i + 1 < n and text[i+1] == '*':
            i += 2
            while i + 1 < n and not (text[i] == '*' and text[i+1] == '/'):
                i += 1
            i += 2
            continue
        if c == '"':
            i += 1
            while i < n and text[i] != '"':
                if text[i] == '\\':
                    i += 1
                i += 1
            i += 1
            continue
        if c == "'":
            i += 1
            while i < n and text[i] != "'":
                if text[i] == '\\':
                    i += 1
                i += 1
            i += 1
            continue
        out.append(c)
        i += 1
    return ''.join(out)

GATE = 'hit_tick >= global.bullet_hit_interval'
bad = []
ok = 0
for d in sorted(os.listdir(OBJ)):
    p = os.path.join(OBJ, d, 'Step_0.gml')
    if not os.path.isfile(p):
        continue
    raw = open(p, 'rb').read().decode('utf-8', errors='replace').replace('\r\n', '\n')
    if GATE not in raw:
        continue
    code = strip_code(raw)
    b = code.count('{') - code.count('}')
    if b != 0:
        bad.append((d, 'brace diff %+d' % b))
        continue
    # 找到 gate 的 { ，配对，检查后面是不是紧接 else
    gi = raw.find(GATE)
    j = raw.find('{', gi)
    depth = 0
    k = j
    while k < len(raw):
        if raw[k] == '{':
            depth += 1
        elif raw[k] == '}':
            depth -= 1
            if depth == 0:
                break
        k += 1
    rest = raw[k+1:].lstrip()
    if rest.startswith('else'):
        bad.append((d, 'gate block followed by else'))
        continue
    ok += 1

print('checked ok:', ok)
print('problems:', len(bad))
for x in bad:
    print('   %-42s %s' % (x[0], x[1]))
