export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
eval "$(rbenv init -)"

if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi

export GOROOT=$HOME/go/goroot
export GOPATH=$HOME/go/goroot
#export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

