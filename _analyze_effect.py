import os
from PIL import Image

base = r'sprites\spr_hufa_god_effect_death'
order = [
    '331749c8-aae7-4a16-8c4d-08084a2592eb',
    '90647a1a-dae8-4416-b78b-d64650add271',
    'e1a23d97-2cc4-4412-aa6f-cd2d99847ba9',
    'bad83e2c-e073-4081-aa0b-fd6e392e0741',
    '121c5faa-545b-455b-a6cc-7529bcb570d6',
    '9bd38c9a-a74f-42d9-9ea9-647c044f2ee0',
    'a09b4298-9b73-4d1b-a034-7102e0a94dcb',
    'b5b665de-e701-4209-99e8-b347e547f1b1',
    '25d2830e-f62d-441f-8be5-0084f63fb643',
    '64977585-7cdb-4ad4-844b-8ce607f35d83',
    '036cd980-af3b-4f56-9117-f708f64fca65',
    'bb77a375-9da2-44d1-8295-aa67f244aa52',
    'f28aecd8-513a-4012-ae3e-3b9c63472dda',
    '42e9f1fa-55ae-4987-853b-ee59f95fd19b',
    '75d26bb1-c519-4a48-8035-d00f25fa2c41',
]

print('idx | opaque_px | avg_rgb(non-transparent)')
for i, name in enumerate(order):
    p = os.path.join(base, name + '.png')
    img = Image.open(p).convert('RGBA')
    w, h = img.size
    px = list(img.getdata())
    opaque = [c for c in px if c[3] > 10]
    n = len(opaque)
    if n:
        r = sum(c[0] for c in opaque) / n
        g = sum(c[1] for c in opaque) / n
        b = sum(c[2] for c in opaque) / n
        print(f'{i:2d} | {n:5d} | ({r:5.1f}, {g:5.1f}, {b:5.1f})')
    else:
        print(f'{i:2d} | {n:5d} | (empty)')