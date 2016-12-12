function elite_prompt 
{

# Standard  bash Colours ::

local RED="\[\033[0;31m\]"
local GREEN="\[\033[0;32m\]"
local BROWN="\[\033[0;33m\]"
local BLUE="\[\033[0;34m\]"
local PURPLE="\[\033[0;35m\]"
local CYAN="\[\033[0;36m\]"
local L_GRAY="\[\033[0;37m\]"
local GRAY="\[\033[1;30m\]"
local L_RED="\[\033[1;31m\]"
local L_GREEN="\[\033[1;32m\]"
local YELLOW="\[\033[1;33m\]"
local L_BLUE="\[\033[1;34m\]"
local L_PURPLE="\[\033[1;35m\]"
local L_CYAN="\[\033[1;36m\]"
local WHITE="\[\033[1;37m\]"
local NO_COLOUR="\[\033[0m\]"

#PS1="$RED[$L_GREEN\u$RED@$L_GREEN\h$RED $L_PURPLE\w$RED]$L_GREEN:$NO_COLOUR " #(phil's )
PS1="$GRAY[$RED\u$L_GREEN@$BROWN\h$GRAY $L_CYAN\w$GRAY]$L_GREEN:~>$NO_COLOUR "
#PS1="$GRAY[$L_CYAN\w$GRAY]$L_GREEN:~>$NO_COLOUR "

}

elite_prompt

# add bin to path
export PATH=/home/$USER/bin:$PATH



case $TERM in
(xterm*)
PROMPT_COMMAND='echo -ne "\033]0; ${PWD}\007"'
;;
esac

if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# Useful Aliases:
# first add aliases file
. ~/.aliases

alias ll="ls -al"
alias c='clear'
alias cproj='cd ~/PersonalProjects'
alias ..='cd ..'
alias t='cd /TMP/`whoami`'
alias l='ls -lrth'

findn (){
   find -name "*$1*"
}
cdl (){
   cd "$1" && ls
}  

bk (){
   .. && ls
}
function mkdir
{
   command mkdir $1 && cd $1 
}

# download this file: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# store it in location below to get git branch name completion in commandline
source ~/git-completion.bash

#Don't let Ctrl S screw you over
##  stty ixany
##  stty ixoff -ixon
##  stty stop undef
##  stty start undef


export NODE_PATH=:/usr/local/lib/node_modules

export NVM_DIR="/home/omer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
