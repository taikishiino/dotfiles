#!/usr/bin/env bash
# 何度実行しても同じ状態になる（既存の実ファイルだけ .bak に退避する）
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# 1. Homebrew のパッケージを入れる
brew bundle --file="$DOTFILES/Brewfile"

# 2. home/ 以下を同じ構成のまま ~ に symlink する
cd "$DOTFILES/home"
find . -type f ! -name .DS_Store | while read -r f; do
  f="${f#./}"
  dst="$HOME/$f"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$DOTFILES/home/$f" "$dst"
  echo "linked ~/$f"
done

# 3. mise のランタイムを入れる
mise install
