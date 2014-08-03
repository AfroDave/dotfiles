ZSH=$HOME/.oh-my-zsh
ZSH_THEME="custom"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git mercurial zsh-syntax-highlighting)

# configure zsh
setopt AUTO_CD
setopt BRACE_CCL
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
unsetopt correct_all

source $ZSH/oh-my-zsh.sh

# path
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/${USER}/.gem/ruby/2.1.0/bin:/home/${USER}/.scripts:/home/${USER}/.scripts/panel:/home/${USER}/.cabal/bin:/home/${USER}/.npm/bin

# cd path
export CDPATH=$CDPATH:/home/${USER}/dev:/home/${USER}/dev/projects

# default editor
export EDITOR=vim

export JAVA_HOME=/opt/java/

# powerline
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_RIGHT_A="exit-status"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"

# paths
export NOTES=/home/${USER}/dev/notes
export SCRIPTS=/home/${USER}/.scripts

# functions
mkcd() {
    if [ -d "${1}" ] ; then
        cd "${1}"
    else
        mkdir -p "${1}" && cd "${1}"
    fi
}

brightness() {
    sudo su -c "echo $@ > /sys/class/backlight/intel_backlight/brightness"
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

extract() {
    if [ -z "$1" ]; then
       echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
       if [ -f $1 ] ; then
           case $1 in
             *.tar.bz2)   tar xvjf ../$1    ;;
             *.tar.gz)    tar xvzf ../$1    ;;
             *.tar.xz)    tar xvJf ../$1    ;;
             *.lzma)      unlzma ../$1      ;;
             *.bz2)       bunzip2 ../$1     ;;
             *.rar)       unrar x -ad ../$1 ;;
             *.gz)        gunzip ../$1      ;;
             *.tar)       tar xvf ../$1     ;;
             *.tbz2)      tar xvjf ../$1    ;;
             *.tgz)       tar xvzf ../$1    ;;
             *.zip)       unzip ../$1       ;;
             *.Z)         uncompress ../$1  ;;
             *.7z)        7z x ../$1        ;;
             *.xz)        unxz ../$1        ;;
             *.exe)       cabextract ../$1  ;;
             *)           echo "extract: '$1' - unknown archive method" ;;
           esac
       else
           echo "$1 - file does not exist"
       fi
    fi
}

# aliases
alias cb='cd -'
alias cdh='cd ~'
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

export PAGER='vimpager'
export MANPAGER='vimpager'
alias less=$PAGER
alias zless=$PAGER
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

alias grep='grep --color=auto -B 3 -A 3 -n'

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

# zsh syntax highlighting
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
