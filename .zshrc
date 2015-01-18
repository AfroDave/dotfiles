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
setopt ZLE
setopt NO_HUP
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt RC_EXPAND_PARAM
setopt COMPLETEALIASES
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
export HISTFILE="${HOME}"/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
unsetopt CORRECT_ALL
unsetopt CORRECT
setopt NOCORRECTALL
DISABLE_CORRECTION="true"

# env
export DISPLAY=:0.0
export GREP_COLOR='032;255'

# keys
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^[[C" forward-word
bindkey "^[[D" backward-word
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward

[[ -f ~/.aliases ]] && source ~/.aliases

# config
autoload -U compinit promptinit colors
compinit -i
promptinit
colors

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
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=yellow'
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
ZSH_HIGHLIGHT_STYLES[assign]='none'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=green,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none,fg=red,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
