#!/bin/bash
# One-time setup on each computer: Pillow venv + turn on the repo's hooks.
V="$HOME/.cache/rhogam-bio/venv"
[ -x "$V/bin/python" ] || { python3 -m venv "$V" && "$V/bin/pip" -q --disable-pip-version-check install pillow; }
git -C "$(dirname "$0")/.." config core.hooksPath .githooks
echo "photo shrink hook enabled"
