#! /usr/bin/env zsh

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^[[C" forward-word
bindkey "^[[D" backward-word
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
