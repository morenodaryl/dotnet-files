#!/usr/bin/env bash
#
# Sync dotfiles from $HOME into this repo.
# Mirrors the whole ~/.config/nvim tree (LazyVim layout), so new files/dirs are
# picked up automatically and files deleted at home disappear here too.

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

echo "Copying from home"

# Junk that should never be versioned (mirrors ~/.config/nvim/.gitignore).
nvim_excludes=(
  --exclude='.git/'
  --exclude='.claude/'
  --exclude='.DS_Store'
  --exclude='*.log'
  --exclude='tt.*'
  --exclude='foo.*'
  --exclude='.tests/'
  --exclude='.repro/'
  --exclude='debug/'
  --exclude='data/'
  --exclude='doc/tags'
)

# whole nvim config tree
mkdir -p .config/nvim
rsync -a --delete "${nvim_excludes[@]}" "$HOME/.config/nvim/" .config/nvim/

# single files
cp "$HOME/.vimrc" .vimrc
cp "$HOME/.tmux.conf" .tmux.conf

echo "DONE ✅"
