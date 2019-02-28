if [ -f ~/.git-completion.bash ]; then
 . ~/.git-completion.bash
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=hxFxBxDxCxegedabagacad

bind "set show-all-if-ambiguous on"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

source ~/.bashrc
source ~/.bash_local
