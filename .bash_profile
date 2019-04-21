export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export GOROOT=$HOME/go
export GOPATH=$HOME/go/goroot
export PATH=$PATH:$HOME/go/bin

# Alias
alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcs='docker-compose stop'
alias dcd='docker-compose down'
alias dcus='docker-compose up serve'
alias dcnt='docker container'
alias dimg='docker image'

