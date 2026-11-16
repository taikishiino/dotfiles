# dotfiles

taikishiino の macOS 開発環境（zsh · sheldon · starship · atuin · fzf · zoxide · mise）

## Install

```bash
git clone https://github.com/taikishiino/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

初回だけ手でやること：

- ターミナルのフォントを **HackGen Console NF** にする
- `atuin import zsh` で既存の履歴を取り込む

更新は `cd ~/dotfiles && git pull && ./install.sh`。

## Keys

| キー | 動作 |
| --- | --- |
| `Ctrl+R` | 履歴検索（atuin） |
| `Ctrl+Q` | よく行くディレクトリへ移動（zoxide + fzf） |
| `Ctrl+T` | ファイル検索（fzf） |
| `g` / `pn` | gitui / pnpm |

## Structure

- `home/`：中身が同じパスで `~` に symlink される。設定を増やすときはここに置いて `./install.sh` を再実行
- `Brewfile`：入れるパッケージ
- `install.sh`：`brew bundle` → symlink → `mise install`
