import re
from PIL import Image, ImageDraw, ImageFont

YY = r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.yy'
PNG = r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.png'
FP = r'C:\Windows\Fonts\simhei.ttf'

orig = Image.open(PNG).convert('RGBA')
yy = open(YY, encoding='utf-8').read()

# existing glyph lookup
existing = {}
for m in re.finditer(r'"(\d+)":\{"character":\d+,"h":(\d+),"offset":(-?\d+),"shift":(\d+),"w":(\d+),"x":(\d+),"y":(\d+),', yy):
    existing[int(m.group(1))] = dict(h=int(m.group(2)), shift=int(m.group(4)), w=int(m.group(5)), x=int(m.group(6)), y=int(m.group(7)))

CELL_H = 28
BASELINE = 24
font = ImageFont.truetype(FP, 21)

def render_new(ch):
    tmp = Image.new('L', (64, 64), 0)
    d = ImageDraw.Draw(tmp)
    X, Y = 8, 40
    d.text((X, Y), ch, font=font, fill=255, anchor='ls')
    bb = tmp.getbbox()
    ink = tmp.crop((bb[0], bb[1], bb[2], bb[3]))
    above = Y - bb[1]
    return ink, above, bb[3]-Y

def paste_glyph(canvas, ink_rgba, x, top_in_cell):
    canvas.paste(ink_rgba, (x, top_in_cell), ink_rgba)

W = 900
H = 220
canvas = Image.new('RGBA', (W, H), (0, 0, 0, 0))
draw = ImageDraw.Draw(canvas)

# row 1: existing glyphs (baseline at y=40)
y_base1 = 40
x = 10
for ch in '中国人大值鱼黑':
    g = existing.get(ord(ch))
    if not g:
        continue
    crop = orig.crop((g['x'], g['y'], g['x']+g['w'], g['y']+g['h']))
    canvas.paste(crop, (x, y_base1 - BASELINE), crop)
    x += g['shift'] + 4

# row 2: new glyphs (baseline at y=120)
y_base2 = 120
x = 10
for ch in '喵煲炫飨羿鳗鲨啰戟阈焗涮绮黯':
    ink, above, below = render_new(ch)
    rgba = Image.new('RGBA', ink.size, (255, 255, 255, 255))
    rgba.putalpha(ink)
    canvas.paste(rgba, (x, y_base2 - above), rgba)
    x += 21 + 4

# baseline + labels
draw = ImageDraw.Draw(canvas)
draw.line([(0, y_base1), (W, y_base1)], fill=(255,0,0,200), width=1)
draw.line([(0, y_base2), (W, y_base2)], fill=(255,0,0,200), width=1)
draw.text((10, 8), 'EXISTING (中国人大值鱼黑)', fill=(255,255,100,255))
draw.text((10, 90), 'NEW - SimHei 21px (喵煲炫飨羿鳗鲨啰戟阈焗涮绮黯)', fill=(255,255,100,255))

canvas.convert('RGB').save(r'd:\gameProject\FVM-Reborn-mod\.codex-tmp\preview.png')
print('saved preview.png')