"""Downscale photos in the built site so the Pages artifact stays under 1 GB.

Runs on _site only (originals in posts/images stay untouched). Keeps each
file's name and format so every link still works, applies EXIF rotation,
and drops EXIF metadata (including GPS) from the served copies.
"""
import os, sys
from PIL import Image, ImageOps

MAX_SIDE = 2000
root = sys.argv[1] if len(sys.argv) > 1 else '_site'
before = after = count = 0
for d, _, files in os.walk(root):
    for f in files:
        ext = f.lower().rsplit('.', 1)[-1]
        if ext not in ('jpg', 'jpeg', 'png'):
            continue
        p = os.path.join(d, f)
        size = os.path.getsize(p)
        if size < 400_000:
            continue
        try:
            im = ImageOps.exif_transpose(Image.open(p))
            im.thumbnail((MAX_SIDE, MAX_SIDE))
            if ext == 'png':
                im.save(p, optimize=True)
            else:
                im.convert('RGB').save(p, quality=82, optimize=True, progressive=True)
        except Exception as e:  # leave anything Pillow can't read as-is
            print('skip', p, e)
            continue
        before += size; after += os.path.getsize(p); count += 1
print(f'shrunk {count} images: {before/1e6:.0f} MB -> {after/1e6:.0f} MB')
