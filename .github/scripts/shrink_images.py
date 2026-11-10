"""Downscale blog photos in place.

usage: shrink_images.py <file-or-dir> [...]

Used in two places:
- the deploy workflow, on _site (keeps the Pages artifact under 1 GB)
- the pre-commit hook (.githooks/pre-commit), on newly staged photos

Each file keeps its name and format, so every link still works. EXIF rotation
is applied and EXIF metadata (including GPS) is dropped. Tall screenshots
(height >= 2x width) are capped by width instead, so their text stays readable.
"""
import os, sys
from PIL import Image, ImageOps

MAX_SIDE = 2000
TALL_WIDTH = 1200
MIN_BYTES = 400_000
EXTS = ('jpg', 'jpeg', 'png')


def shrink(p):
    """Return (before, after) bytes, or None if the file was left alone."""
    size = os.path.getsize(p)
    if size < MIN_BYTES:
        return None
    ext = p.lower().rsplit('.', 1)[-1]
    try:
        im = Image.open(p)
        w, h = im.size
        if (w <= TALL_WIDTH if h >= 2 * w else max(w, h) <= MAX_SIDE) and (size < 1_500_000 or p.lower().endswith('.png')):
            return None  # already small enough: don't re-encode
        im = ImageOps.exif_transpose(im)
        w, h = im.size
        if h >= 2 * w:
            im.thumbnail((TALL_WIDTH, h))
        else:
            im.thumbnail((MAX_SIDE, MAX_SIDE))
        if ext == 'png':
            im.save(p, optimize=True)
        else:
            im.convert('RGB').save(p, quality=82, optimize=True, progressive=True)
    except Exception as e:  # leave anything Pillow can't read as-is
        print('skip', p, e)
        return None
    return size, os.path.getsize(p)


def files(args):
    for a in args:
        if os.path.isdir(a):
            for d, _, fs in os.walk(a):
                for f in fs:
                    yield os.path.join(d, f)
        else:
            yield a


if __name__ == '__main__':
    before = after = count = 0
    for p in files(sys.argv[1:] or ['_site']):
        if p.lower().rsplit('.', 1)[-1] not in EXTS or not os.path.isfile(p):
            continue
        r = shrink(p)
        if r:
            before += r[0]; after += r[1]; count += 1
    print(f'shrunk {count} images: {before/1e6:.0f} MB -> {after/1e6:.0f} MB')
