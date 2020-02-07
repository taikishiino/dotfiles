export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
eval "$(rbenv init -)"

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export GOROOT=$HOME/go/goroot
export GOPATH=$HOME/go/goroot
#export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

# Alias
alias d='docker'
alias dc='docker-compose'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gs='git status'
alias gpom='git pull origin master'

export PATH=~/dotfiles/.bash_profile:$PATH
