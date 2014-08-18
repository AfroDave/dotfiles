if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# configure zsh
setopt AUTO_CD
setopt BRACE_CCL
setopt MULTIOS
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt RM_STAR_WAIT
setopt ZLE
setopt NO_HUP
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_CLOBBER
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt RC_EXPAND_PARAM
setopt COMPLETEALIASES
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
export HISTFILE="${HOME}"/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
unsetopt CORRECT_ALL

# keys
bindkey -v '^A' vi-beginning-of-line
bindkey -v '^E' vi-end-of-line

# functions
mkcd() {
    if [ -d "${1}" ] ; then
        cd "${1}"
    else
        mkdir -p "${1}" && cd "${1}"
    fi
}

brightness() {
    sudo su -c "echo ${@} > /sys/class/backlight/intel_backlight/brightness"
}

note() {
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi
    if ! (($#)); then
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        > "$HOME/.notes"
    else
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

todo() {
    if [[ ! -f $HOME/.todo ]]; then
        touch "$HOME/.todo"
    fi
    if ! (($#)); then
        cat "$HOME/.todo"
    elif [[ "$1" == "-l" ]]; then
        nl -b a "$HOME/.todo"
    elif [[ "$1" == "-c" ]]; then
        > $HOME/.todo
    elif [[ "$1" == "-r" ]]; then
        nl -b a "$HOME/.todo"
        printf "----------------------------\n"
        read -p "Type a number to remove: " number
        ex -sc "${number}d" "$HOME/.todo"
    else
        printf "%s\n" "$*" >> "$HOME/.todo"
    fi
}

calc() {
    echo "scale=3;$@" | bc -ql
}

# aliases
alias cb='cd -'
alias cdh='cd ~'
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias more='less'

alias lsa='ls -alhFG'
alias ls='ls -hF --color=auto'
alias lr='ls -R'
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'
alias lz='ll -rS'
alias lt='ll -rt'
alias lm='la | more'

alias c='clear'

alias gvim='gvim --remote-silent'
alias vi='vim'
alias vim='vim'
alias vimx='gvim'

alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

alias grep='grep --color=auto'
alias grepf='grep -l'
alias grepa='grep -B 3 -A 3 -n'

alias df='pydf -h'
alias du='du -c -h'

alias bc='bc -ql'

alias tls='tmux ls'
alias tlp='tmux lsp'
alias tlw='tmux lsw'
alias tsw='tmux select-window -t'

# config
autoload -U compinit promptinit colors
compinit -i
promptinit
colors

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose false
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u ${USER} -o pid,%cpu,tty,cputime,cmd'

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
ZSH_HIGHLIGHT_STYLES[alias]=fg=blue
ZSH_HIGHLIGHT_STYLES[builtin]=fg=blue
ZSH_HIGHLIGHT_STYLES[function]=fg=blue
ZSH_HIGHLIGHT_STYLES[command]=fg=blue
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=blue
ZSH_HIGHLIGHT_STYLES[path]=fg=yellow
ZSH_HIGHLIGHT_STYLES[path_prefix]=yellow
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=yellow
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none
