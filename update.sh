#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/bin:/bin:$PATH"
set -e
cd "$HOME/Desktop/firestarter-port"
python3 dashboard.py >/dev/null 2>&1
cp reports/dashboard-public.html "$HOME/fs-site/index.html"   # PUBLIC (money-free) only
cd "$HOME/fs-site"
git add -A
git diff --cached --quiet && { echo "no change"; exit 0; }
git -c user.email="lenehan1996@gmail.com" -c user.name="lenehan3" commit -qm "update $(date '+%Y-%m-%d %H:%M')"
git push -q origin main && echo "pushed $(date)"
