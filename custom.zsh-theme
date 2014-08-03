#!/bin/sh

function +vi-git-status() {
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        hook_com[unstaged]=' %F{239}✗%f'
    fi
}

function prompt_precmd {
    vcs_info

    if (( $+functions[ruby-info] )); then
        ruby-info
    fi
}

function prompt_setup {
    setopt LOCAL_OPTIONS
    unsetopt XTRACE KSH_ARRAYS
    prompt_opts=(cr percent subst)

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' use-simple true
    zstyle ':vcs_info:*' unstagedstr ' %F{239}✗%f'
    zstyle ':vcs_info:*' formats ' %F{239}%b%f %F{white}%.7i%f%u'
    zstyle ':vcs_info:*' actionformats ' %F{239}%b%f %F{white}%.7i%f +%a%u'
    zstyle ':vcs_info:git*+set-message:*' hooks git-status

    zstyle ':prezto:module:ruby:info:version' format ' %F{white}%v%f'


    # %F{magenta}%n%f@%F{green}%m%f 
    PROMPT="%F{007}%~%f
%(?.%F{green}${1:-━━━━╸}%f.%F{red}${1:-━━━━╸}%f) "
    RPROMPT='${ruby_info[version]}${vcs_info_msg_0_}'
}

prompt_setup "$@"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none
