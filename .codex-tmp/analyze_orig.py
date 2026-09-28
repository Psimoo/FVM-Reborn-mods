import re
from PIL import Image

img = Image.open(r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.png').convert('RGBA')
px = img.load()
yy = open(r'd:\gameProject\FVM-Reborn-mod\fonts\font_yuan\font_yuan.yy', encoding='utf-8').read()

glyphs = {}
for m in re.finditer(r'"(\d+)":\{"character":\d+,"h":(\d+),"offset":(-?\d+),"shift":(\d+),"w":(\d+),"x":(\d+),"y":(\d+),', yy):
    code=int(m.group(1)); glyphs[code]=dict(h=int(m.group(2)),offset=int(m.group(3)),shift=int(m.group(4)),w=int(m.group(5)),x=int(m.group(6)),y=int(m.group(7)))

def ink(g):
    x,y,w,h = g['x'],g['y'],g['w'],g['h']
    minx=w; miny=h; maxx=-1; maxy=-1
    for dy in range(h):
        for dx in range(w):
            if px[x+dx,y+dy][3] > 0:
                if dx<minx: minx=dx
                if dx>maxx: maxx=dx
                if dy<miny: miny=dy
                if dy>maxy: maxy=dy
    if maxx<0: return None
    return (maxx-minx+1, maxy-miny+1, minx, miny)  # (ink_w, ink_h, ink_x_off, ink_y_off)

print('=== CJK samples: ink (w,h,xoff,yoff) within 28px cell, shift, offset ===')
for ch in '一中国人大的言':
    g = glyphs.get(ord(ch))
    if g is None: print(ch,'missing'); continue
    iv = ink(g)
    print(f'{ch} U+{ord(ch):04X}: cell(w={g["w"]},h={g["h"]},off={g["offset"]},shift={g["shift"]}) ink={iv}')

print('\n=== Latin with descender: baseline check ===')
for ch in 'gypAq':
    g = glyphs.get(ord(ch))
    if g is None: print(ch,'missing'); continue
    iv = ink(g)
    print(f'{ch} U+{ord(ch):04X}: cell(w={g["w"]},h={g["h"]},off={g["offset"]},shift={g["shift"]}) ink={iv}')

# CJK ink height stats
import statistics
heights=[]
for code,g in glyphs.items():
    if g['shift']==21:
        iv=ink(g)
        if iv: heights.append(iv[1])
print('\nCJK (shift=21) ink height stats: min=%d max=%d mean=%.1f'%(min(heights),max(heights),statistics.mean(heights)))
# bottom offset (baseline) stats for CJK
bots=[ink(g)[3]+ink(g)[1] for g in glyphs.values() if g['shift']==21 and ink(g)]
print('CJK ink bottom (baseline) stats: min=%d max=%d mean=%.1f'%(min(bots),max(bots),statistics.mean(bots)))