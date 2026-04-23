#!/bin/bash
python3 - <<'EOF'
import os, re

posts_dir = "posts"

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
EOF
