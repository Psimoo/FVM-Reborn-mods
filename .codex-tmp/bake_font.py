import sys, re
from PIL import Image, ImageDraw, ImageFont

YY_PATH = r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.yy'
PNG_PATH = r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.png'
FONT_PATH = r'C:\Windows\Fonts\simhei.ttf'

TARGET = '喵煲炫飨羿豚沌黯漪槃肴黏鳗鲨啰±戟阈焗涮绮'  # 21 chars ( '<' already present )
CELL_H = 28
BASELINE = 24          # ascender = 24 => baseline 24px from cell top
CJK_SHIFT = 21         # advance for full-width ideographs (matches existing)

def probe_size(S):
    font = ImageFont.truetype(FONT_PATH, S)
    rows = []
    for ch in '国中国人一':
        img = Image.new('L', (80, 80), 0)
        d = ImageDraw.Draw(img)
        X, Y = 12, 48
        d.text((X, Y), ch, font=font, fill=255, anchor='ls')
        bb = img.getbbox()
        if bb is None:
            rows.append((ch, None)); continue
        ink_w = bb[2]-bb[0]; ink_h = bb[3]-bb[1]
        above = Y-bb[1]; below = bb[3]-Y; lb = bb[0]-X
        rows.append((ch, ink_w, ink_h, above, below, lb))
    return rows

print('=== probe sizes ===')
for S in (19, 20, 21):
    r = probe_size(S)
    ws = [x[1] for x in r]; hs = [x[2] for x in r]; ab = [x[3] for x in r]
    print(f'S={S}: avg ink_w={sum(ws)/len(ws):.1f} ink_h={sum(hs)/len(hs):.1f} above={sum(ab)/len(ab):.1f}')

COMMIT = '--commit' in sys.argv

# load original png + yy
img = Image.open(PNG_PATH).convert('RGBA')
yy = open(YY_PATH, encoding='utf-8').read()
px = img.load()

# check existing ink color (RGB of an opaque glyph pixel)
for code in (20013, 19968):  # 中, 一
    m = re.search(r'"%d":\{"character":%d,"h":(\d+),"offset":(-?\d+),"shift":(\d+),"w":(\d+),"x":(\d+),"y":(\d+),' % (code, code), yy)
    if m:
        h=int(m.group(1)); x=int(m.group(5)); y=int(m.group(6))
        # find an opaque pixel
        for dy in range(h):
            for dx in range(0, int(m.group(4))):
                if px[x+dx, y+dy][3] > 0:
                    print(f'glyph U+{code:04X} ink pixel RGBA = {px[x+dx,y+dy]}')
                    break
            else:
                continue
            break
        break

# choose size
S = 21
font = ImageFont.truetype(FONT_PATH, S)

# free band: bottom of existing glyphs = 1260 (from earlier analysis), start at 1264
START_Y = 1264
GAP = 2

def render(ch):
    tmp = Image.new('L', (64, 64), 0)
    d = ImageDraw.Draw(tmp)
    X, Y = 8, 40
    d.text((X, Y), ch, font=font, fill=255, anchor='ls')
    bb = tmp.getbbox()
    if bb is None:
        return None
    left, top, right, bottom = bb
    ink_w = right - left
    above = Y - top       # ink above baseline
    below = bottom - Y    # ink below baseline
    lb = left - X         # left bearing
    # tight-crop ink (L mode)
    ink = tmp.crop((left, top, right, bottom))
    return dict(ch=ch, ink=ink, ink_w=ink_w, above=above, below=below, lb=lb)

# determine shift per char: full-width ideographs -> 21; '+-' -> natural advance
def natural_advance(ch):
    return round(font.getlength(ch))  # pixels at size S

entries = []
cursor_x = 2
cursor_y = START_Y
for ch in TARGET:
    r = render(ch)
    if r is None:
        print('WARN: no ink for', ch); continue
    code = ord(ch)
    shift = CJK_SHIFT   # all 21 chars render as full-width in SimHei
    offset = r['lb']
    w = r['ink_w']
    h = CELL_H
    x = cursor_x
    y = cursor_y
    # bottom-align ink to the font baseline (matches existing CJK: glyph bottom == baseline y=24)
    ink_h = r['above'] + r['below']
    top_in_cell = BASELINE - ink_h
    assert top_in_cell >= 0, (ch, top_in_cell)
    rgba_ink = Image.new('RGBA', r['ink'].size, (255,255,255,255))
    rgba_ink.putalpha(r['ink'])
    img.paste(rgba_ink, (x, y + top_in_cell), rgba_ink)
    entries.append(dict(code=code, h=h, offset=offset, shift=shift, w=w, x=x, y=y,
                        top_in_cell=top_in_cell, ink_h=r['ink_w'], above=r['above'], lb=r['lb']))
    cursor_x += w + GAP
    if cursor_x + 40 > img.size[0]:
        cursor_x = 2
        cursor_y += CELL_H + GAP

print('\n=== rendered entries ===')
for e in entries:
    c = chr(e['code'])
    print(f"{c} U+{e['code']:04X}: offset={e['offset']} shift={e['shift']} w={e['w']} h={e['h']} x={e['x']} y={e['y']} top_in_cell={e['top_in_cell']} (above={e['above']}, lb={e['lb']})")
print(f'total placed: {len(entries)}; last free y cursor={cursor_y}')

if not COMMIT:
    print('\nDRY RUN — no files written. run with --commit to bake.')
    sys.exit(0)

# ---- write PNG ----
img.save(PNG_PATH)

# ---- build glyph entry lines ----
glyph_lines = []
for e in entries:
    c = e['code']
    glyph_lines.append(
        '    "%d":{"character":%d,"h":%d,"offset":%d,"shift":%d,"w":%d,"x":%d,"y":%d,}'
        % (c, c, e['h'], e['offset'], e['shift'], e['w'], e['x'], e['y'])
    )
glyph_insert = '\n'.join(glyph_lines) + '\n'

# insert glyphs right after "glyphs":{
anchor = '"glyphs":{\n'
assert yy.count(anchor) == 1, 'glyphs anchor not unique'
yy = yy.replace(anchor, anchor + glyph_insert, 1)

# ---- rebuild ranges: add new codes, merge & sort ----
# parse existing ranges
existing = []
for m in re.finditer(r'\{"lower":(\d+),"upper":(\d+),', yy):
    existing.append((int(m.group(1)), int(m.group(2))))
# remove the ones we'll rebuild (we'll rewrite entire ranges block instead)
covered = []
for lo, hi in existing:
    covered.append((lo, hi))
covered += [(e['code'], e['code']) for e in entries]
covered.sort()
merged = []
for lo, hi in covered:
    if merged and lo <= merged[-1][1] + 1:
        merged[-1] = (merged[-1][0], max(merged[-1][1], hi))
    else:
        merged.append((lo, hi))

# rebuild ranges text between "ranges":[\n ... \n  ],
start = yy.find('"ranges":[')
end = yy.find('  ],\n  "regenerateBitmap"', start)
assert start != -1 and end != -1, 'ranges block not found'
range_lines = ['    {"lower":%d,"upper":%d,}' % (lo, hi) for lo, hi in merged]
new_ranges = '"ranges":[\n' + ',\n'.join(range_lines) + '\n'
yy = yy[:start] + new_ranges + yy[end:]

open(YY_PATH, 'w', encoding='utf-8', newline='').write(yy)

print(f'committed: {len(entries)} glyphs added; ranges rebuilt from {len(existing)} to {len(merged)} intervals')
print('existing range count before:', len(existing), 'after merge:', len(merged))