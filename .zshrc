export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"
plugins=(git zsh-syntax-highlighting zsh-completions)

# プロンプト表示設定
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () {
  # 1行あける
  print
  # カレントディレクトリ
  local left=' %{\e[38;5;2m%}(%~)%{\e[m%}'
  # バージョン管理されてた場合、ブランチ名
  vcs_info
  local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
  # スペースの長さを計算
  # テキストを装飾する場合、エスケープシーケンスをカウントしないようにします
  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))

  print -P $left${(r:$padwidth:: :)}$right
}
# ユーザ名@ホスト名
PROMPT='%n@%m $ '
# 現在時刻
RPROMPT=$'%D, %*'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

# zsh-completions の設定。コマンド補完機能
autoload -U compinit && compinit -u

# Alias
alias relogin='exec $SHELL -l'
alias d='docker'
alias dc='docker-compose'
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcma='git checkout master'
alias gmod='git merge origin/develop'
alias gmom='git merge origin/master'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias gst='git stash'

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cd なしでもディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ (履歴) を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# キーバインディングを emacs 風にする
bindkey -d
bindkey -e

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# [TAB] でパス名の補完候補を表示したあと、
# 続けて [TAB] を押すと候補からパス名を選択できるようになる
# 候補を選ぶには [TAB] か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# コマンドのスペルを訂正する
setopt correct

# cd した先のディレクトリをディレクトリスタックに追加する
# cd [TAB] でディレクトリのヒストリが表示されるので、選択して移動できる
# ※ ディレクトリスタック: 今までに行ったディレクトリのヒストリのこと
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# glob: パス名にマッチするワイルドカードパターンのこと
# ※ たとえば mv hoge.* ~/dir というコマンドにおける * のこと
setopt extended_glob

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものにしている
# ※ たとえば Ctrl-W でカーソル前の1単語を削除したとき / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# zsh: no matches found ~対策
setopt nonomatch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taiki.shiino/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taiki.shiino/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taiki.shiino/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taiki.shiino/google-cloud-sdk/completion.zsh.inc'; fi

# Git
git config --global color.ui auto
git config --global user.name "taikishiino"
git config --global user.email taiki.shiino@gmail.com
git config --list

# Go
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

# gatsby
export DYLD_LIBRARY_PATH=/usr/lib/:$DYLD_LIBRARY_PATH

# Flutter
export PATH=$PATH:/Users/furusin/Library/Android/sdk/platform-tools
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH:$HOME/flutter/bin"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# fastdoctor MacBook Pro
export PATH=/opt/homebrew/bin:$PATH
