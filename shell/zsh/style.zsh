#! /usr/bin/env zsh

ZSH_HIGHLIGHT_STYLES[default]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=red'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[assign]='fg=none'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=green,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none,fg=red,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

zstyle ':completion::complete:*' use-cache on

zstyle ':completion:*:*:*:*:*' menu select=2
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%B%F{green}>> %d (errors: %e)%f%b'
zstyle ':completion:*:descriptions' format '%B%F{magenta}>> %d%f%b'
zstyle ':completion:*:messages' format '%B%F{cyan}>> %d%f%b'
zstyle ':completion:*:warnings' format '%B%F{red}>> no matches found%f%b'
zstyle ':completion:*:default' list-prompt '%B%S%M matches%s%b'
zstyle ':completion:*' format '%B%F{cyan}>> %d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _oldlist _expand _complete _match _approximate
zstyle ':completion:*' menu select=2

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:*:*:users' ignored-patterns \
    bin daemon mail ftp http nobody dbus avahi named git bitlbee mpd \
    rtkit ntp usbmux gdm

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:*:(vim|gvim):*:*files' ignored-patterns '*~|*.(old|bak|o|hi)'
zstyle ':completion:*:*:(vim|gvim):*:*files' file-sort modification
zstyle ':completion:*:*:(vim|gvim):*' file-sort modification
zstyle ':completion:*:*:(vim|gvim):*' tag-order files

zstyle ':completion:*:*:kill:*' command 'ps -e -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*' insert-ids single

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
