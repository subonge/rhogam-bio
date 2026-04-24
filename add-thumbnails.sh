#!/bin/bash
python3 - <<'EOF'
import os, re, json, glob

posts_dir = "posts"

# ── 1. 썸네일 자동 추가 ──────────────────────────────────────────
for root, dirs, files in os.walk(posts_dir):
    dirs[:] = [d for d in dirs if d != 'images']
    for filename in files:
        if not (filename.endswith('.md') or filename.endswith('.qmd')):
            continue
        filepath = os.path.join(root, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        modified = False

        # Convert Obsidian ![[file]] to standard ![](images/file)
        new_content = re.sub(
            r'!\[\[([^\]]+)\]\]',
            lambda m: f'![](<images/{m.group(1)}>)',
            content
        )
        if new_content != content:
            content = new_content
            modified = True

        # Auto-add image: frontmatter from first image in content
        fm_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
        if fm_match and 'image:' not in fm_match.group(1):
            img_match = re.search(r'!\[.*?\]\(<?(.*?)>?\)', content[fm_match.end():])
            if img_match:
                image_path = img_match.group(1).strip()
                new_fm = fm_match.group(1) + f'\nimage: {image_path}'
                content = content[:fm_match.start(1)] + new_fm + content[fm_match.end(1):]
                modified = True

        if modified:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)

# ── 2. posts-data.json 생성 ──────────────────────────────────────
posts = []
all_files = glob.glob('posts/**/*.md', recursive=True) + glob.glob('posts/**/*.qmd', recursive=True)

for filepath in all_files:
    if '/images' in filepath or '\\images' in filepath:
        continue
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    fm_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    if not fm_match:
        continue
    fm = fm_match.group(1)

    if re.search(r'^draft:\s*true', fm, re.MULTILINE):
        continue

    def get_field(pattern, text):
        m = re.search(pattern, text, re.MULTILINE)
        return m.group(1).strip().strip('"\'') if m else ''

    title = get_field(r'^title:\s*["\']?(.*?)["\']?\s*$', fm)
    if not title:
        continue

    date  = get_field(r'^date:\s*["\']?(.*?)["\']?\s*$', fm)
    desc  = get_field(r'^description:\s*["\']?(.*?)["\']?\s*$', fm)
    image = get_field(r'^image:\s*(.*?)\s*$', fm)

    categories = []
    # inline: categories: [A, B]
    cats_inline = re.search(r'^categories:\s*\[(.+?)\]', fm, re.MULTILINE)
    # list: categories:\n  - A
    cats_list = re.findall(r'^categories:.*?(?=\n\S|\Z)', fm, re.MULTILINE | re.DOTALL)
    if cats_inline:
        categories = [c.strip().strip('"\'') for c in cats_inline.group(1).split(',')]
    elif cats_list:
        categories = re.findall(r'^\s*-\s*(.+)$', cats_list[0], re.MULTILINE)
        categories = [c.strip().strip('"\'') for c in categories]

    # URL from filepath
    rel = filepath.replace('\\', '/')
    url = '/' + rel.replace('.md', '.html').replace('.qmd', '.html')
    if url.endswith('/index.html'):
        url = url[:-len('index.html')]

    # Image full path from site root
    if image:
        post_dir = '/' + os.path.dirname(rel)
        if not post_dir.endswith('/'):
            post_dir += '/'
        image_url = post_dir + image
    else:
        image_url = ''

    posts.append({
        'title': title,
        'date': date,
        'description': desc,
        'image': image_url,
        'categories': categories,
        'url': url
    })

posts.sort(key=lambda x: x['date'], reverse=True)

with open('posts-data.json', 'w', encoding='utf-8') as f:
    json.dump(posts, f, ensure_ascii=False, indent=2)
EOF
