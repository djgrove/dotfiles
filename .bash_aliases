alias c='clear'
alias e='exit'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

function gcsit {
    local var=`expr $(current_branch) : '\(SIT-....\)'`
    print "Commit msg: $var $@...\n"
    git commit -am "$var $@"
}

# File system
alias bashrc='${EDITOR} ~/.bashrc && source ~/.bashrc'
alias ealias='${EDITOR} ~/.bash_aliases && source ~/.bashrc'
alias ealiases=ealias
alias rbrc='source ~/.bashrc'
alias sbrc=rbrc
alias rm='rm -I'
alias cd..='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias back='cd "$OLDPWD"'
alias bk=back
alias sl='ls'
alias lsl='ls -lsFA | less'
alias fhere='find . -name'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias trash='rm -rf ~/.local/share/Trash/files/*'
alias a="atom . && source ~/.bashrc"

# Date and time
alias week='date +"%V"'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'

# Updates
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias apt-get='sudo apt-get'

# System
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias myip='curl http://ipecho.net/plain; echo'
alias localip='ifconfig | grep "inet addr" | grep -v "127.0.0.1" | cut -d: -f2 | cut -d" " -f1'

# Python Shortcuts
alias py='python3'
alias pycalc='python -ic "from __future__ import division; from math import *"'

# Git shortcuts
alias g='git'
alias gr='git rm -rf'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gconf='git config --global'
alias gc='git commit -m'
alias gca='git commit -am'
alias gpu='git push origin master'
alias gup=gpu
alias gpl='git pull origin master'
alias gdown=gpl
alias gupdate=gpl
alias gl='git log'
alias gb='git branch'

# ETC / Fun
alias hs='history | grep $1'
alias ag='alias | grep $1'
alias cls='clear'
alias h='history'
alias srch='apt-cache search'
alias search=srch
alias searchapt=srch
alias last='fs -s'
alias lastcmd=last
alias stopwatch='echo "Timer started. Stop with Ctrl + D." && date && time cat && date'
alias timer=stopwatch
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias gio='gitio $1 $2'

# Raspberry Pi stuff
alias findpi='sudo nmap -sP 192.168.1.0/24 | awk
`/^Nmap/{ip=$NF}/B8:27:EB/{print ip}`'

# Docker
alias dc='docker container'
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'
alias dcub='docker-compose up -d --build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcdv='docker-compose down -v'
# run bash inside Docker container
dockin() {
    docker exec -it "$1" bash
}

source ~/.bash_functions
