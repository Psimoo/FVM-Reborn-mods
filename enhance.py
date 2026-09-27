from PIL import Image, ImageFilter, ImageEnhance
import numpy as np

src = r"d:\gameProject\FVM-Reborn-mod\badge_transparent.png"
dst = r"d:\gameProject\FVM-Reborn-mod\badge_clear.png"

img = Image.open(src).convert("RGBA")
print(f"original size: {img.size}")

scale = 4
big = img.resize((img.width * scale, img.height * scale), Image.LANCZOS)
print(f"scaled size: {big.size}")

rgb = big.convert("RGB")

sharp = rgb.filter(ImageFilter.UnsharpMask(radius=2, percent=150, threshold=2))
sharp = sharp.filter(ImageFilter.UnsharpMask(radius=1, percent=100, threshold=1))

enhancer = ImageEnhance.Contrast(sharp)
sharp = enhancer.enhance(1.2)

enhancer = ImageEnhance.Color(sharp)
sharp = enhancer.enhance(1.15)

alpha = big.split()[3]
alpha_enh = alpha.filter(ImageFilter.SMOOTH)
alpha_arr = np.array(alpha_enh)
alpha_arr = np.clip(alpha_arr * 1.1, 0, 255).astype(np.uint8)
alpha_out = Image.fromarray(alpha_arr, mode="L")

result = Image.new("RGBA", big.size)
result.paste(sharp, (0, 0), alpha_out)

result.save(dst)
print(f"saved: {dst}")
