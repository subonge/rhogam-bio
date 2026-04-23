#!/bin/bash
for dir in posts/*/; do
  qmd="$dir/index.qmd"
  [ -f "$qmd" ] || continue

  for ext in jpg jpeg png; do
    thumb="$dir/thumbnail.$ext"
    if [ -f "$thumb" ] && ! grep -q "^image:" "$qmd"; then
      sed -i '' "/^categories:/a\\
image: thumbnail.$ext" "$qmd"
      break
    fi
  done
done
