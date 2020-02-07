export PATH=$PATH:/Users/xxxxx/.nodebrew/current/bin
source /usr/local/etc/bash_completion.d/git-completion.bash

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^＊]/d' -e 's/＊ \(.*\)/(\1)/'
}

PS1="\[\e[36m\]\D{%Y/%m/%d} \t \u@ \[\e[1;96m\]\n(\w) $ \[\e[0m\]"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/taiki/organizations/origin/template/serverless/nuxt-serverless/node_modules/tabtab/.completions/slss.bash