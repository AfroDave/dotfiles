#! /usr/bin/env zsh

alias cb='cd -'
alias cdh='cd ~'
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias more='less'

alias l='ls -FNh --tabsize=0 --color=auto --show-control-chars --group-directories-first'
alias ls='l'
alias la='ls -alhFG'
alias lr='ls -R'

alias tree='tree -C'

alias c='clear'

alias gvim='gvim --remote-silent'
alias vi='vim'
alias vim='vim'
alias vimx='gvim'
alias :e='vim'

alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

alias grep='grep --color=auto'
alias grepf='grep -l'
alias grepa='grep -B 3 -A 3 -n'

alias df='dfc'
alias du='du -c -h'

alias bc='bc -ql'

alias tls='tmux ls'
alias tlp='tmux lsp'
alias tlw='tmux lsw'
alias tsw='tmux select-window -t'

alias pacman='sudo pacman'
alias cower='cower --color=auto'