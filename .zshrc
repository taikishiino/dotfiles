##### oh-my-zsh の設定 #####
export ZSH=$HOME/.oh-my-zsh

# たとえば oh-my-zsh テーマカラーを robbyrussell から変更する場合
ZSH_THEME="candy"

# oh my zsh で利用するプラグインを指定
plugins=(git zsh-syntax-highlighting zsh-completions)

##### zsh の設定 #####

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
#RPROMPT=$'%{\e[38;5;251m%}%W, %*%{\e[m%}'
RPROMPT=$'%D, %*'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}


# zsh-completions の設定。コマンド補完機能
autoload -U compinit && compinit -u

# git のカラー表示
git config --global color.ui auto


# Alias
alias relogin='exec $SHELL -l'
# Docker 系
alias d='docker'
alias dc='docker-compose'
# git 系
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

# Git
function gitWork() {
  git config --global user.name "taikishiino-oct"
  git config --global user.email taiki.shiino@88oct.co.jp
  git config --list
}

function gitMy() {
  git config --global user.name "taikishiino"
  git config --global user.email taiki.shiino@gmail.com
  git config --list
}

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

eval "$(direnv hook zsh)"

export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

# anyenv
# eval "$(anyenv init -)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/taiki.shiino/.nodenv/versions/12.19.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/taiki.shiino/.nodenv/versions/12.19.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/taiki.shiino/.nodenv/versions/12.19.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/taiki.shiino/.nodenv/versions/12.19.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zshexport PATH="/usr/local/sbin:$PATH"

# Flutter
export PATH=$PATH:/Users/furusin/Library/Android/sdk/platform-tools

export PATH="/usr/local/sbin:$PATH"

test -e /Users/taiki.shiino/.iterm2_shell_integration.zsh && source /Users/taiki.shiino/.iterm2_shell_integration.zsh || true

# gatsby
export DYLD_LIBRARY_PATH=/usr/lib/:$DYLD_LIBRARY_PATH

# zsh: no matches found ~対策
setopt nonomatch

# Flutter
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH:$HOME/flutter/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taiki.shiino/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taiki.shiino/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taiki.shiino/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taiki.shiino/google-cloud-sdk/completion.zsh.inc'; fi
