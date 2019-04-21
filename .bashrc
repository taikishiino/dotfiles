export PATH=$PATH:/Users/xxxxx/.nodebrew/current/bin
source /usr/local/etc/bash_completion.d/git-completion.bash

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^＊]/d' -e 's/＊ \(.*\)/(\1)/'
}

PS1="\[\e[36m\]\D{%Y/%m/%d} \t \u@ \[\e[1;96m\]\n(\w) $ \[\e[0m\]"

