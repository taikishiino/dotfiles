# Homebrew（compinit より前に読み込み、Homebrew の補完を fpath に入れる）
eval "$(/opt/homebrew/bin/brew shellenv)"

# 補完
autoload -Uz compinit && compinit -u
# 小文字の入力で大文字にもマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# TAB を続けて押すと候補をメニューで選べる
zstyle ':completion:*:default' menu select=1

# 履歴（↑キーはこの履歴、Ctrl+R は atuin）
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks

setopt auto_cd no_beep
# Ctrl+Q / Ctrl+S を端末のフロー制御に取られないようにする
setopt no_flow_control

# ツール
eval "$(fzf --zsh)"                          # Ctrl+T: ファイル検索 / Alt+C: ディレクトリ移動
eval "$(zoxide init zsh)"                    # z <キーワード>: よく行くディレクトリへ移動
eval "$(atuin init zsh --disable-up-arrow)"  # Ctrl+R: 履歴検索（fzf の Ctrl+R を上書き）
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

# Ctrl+Q: zoxide の移動履歴から fzf で選んで cd
function zoxide-fzf-cd() {
  local dir
  dir=$(zoxide query --interactive) && cd -- "$dir"
  zle reset-prompt
}
zle -N zoxide-fzf-cd
bindkey '^Q' zoxide-fzf-cd

alias g='gitui'
alias pn='pnpm'

# Git アカウント切り替え（~/.gitconfig の user.name / email を書き換える）
function gitmain() {
  git config --global user.name "taikishiino"
  git config --global user.email "taiki.shiino@gmail.com"
  git config --list
}

function gitxaiondata() {
  git config --global user.name "taikishiino-xaiondata"
  git config --global user.email "taiki.shiino@xaiondata.co.jp"
  git config --list
}

# プラグイン（zsh-syntax-highlighting が上のウィジェットも拾えるよう最後に読み込む）
eval "$(sheldon source)"
