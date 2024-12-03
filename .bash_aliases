
#---------#
# ALIASES #
#---------#

alias diff="diff --color"

alias pcr="pre-commit run"
alias pcra="pre-commit run -a"
alias pyt="pytest"
alias pyts="pytest --capture=tee-sys"

alias vim='nvim'

alias cls='clear'

## Prevents accidentally nuking files
alias rm='rm -i'
# alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias ..='cd ..'

## The 'ls' family
alias ls='exa --group-directories-first'
alias ll='ls -l --git'
alias la='ll -a'
alias d='exa -la'
alias tree='exa -T'
# alias ls='ls -h --color=auto'
# alias ll='ls -lv --group-directories-first'
# alias lm='ll | less'
# alias la='ll -A'
# alias d='ll -A'
# alias tree='tree -Csuh'

alias gts='git status'
alias gtl='git log'
alias gtf='git fetch'
alias glt='git log --graph --decorate --oneline $(git rev-list -g -all)'
alias gps='git rev-parse HEAD'
alias grh='git rev-parse HEAD'
alias gco='git checkout'
alias gri='git rebase -i'

alias bashrc='vim ~/.bashrc && source ~/.bashrc'
alias bash_aliases='vim ~/.bash_aliases && source ~/.bash_aliases'
alias vimrc='vim ~/.vimrc'
# alias rpi='telnet rpi-11a087 2001'
# export RPI='rpi-5cacb0'
# alias SSH='ssh root@$RPI'

## Versal
alias bootgen="~/versal/Vivado/2023.1/bin/bootgen"
