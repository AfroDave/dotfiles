prompt_custom_precmd() {
    vcs_info
    print -P "%F{248}%~%F{242}${vcs_info_msg_0_}"
}

prompt_custom_setup() {
    export PROMPT_EOL_MARK=''

    prompt_opts=(cr subst percent)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git cvs svn
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' formats ' %F{cyan}%b%f%c%u'
    zstyle ':vcs_info:*' actionformats ' %F{magenta}%b%f%c%u %F{yellow}(%a)%f'
    zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
    zstyle ':vcs_info:*' unstagedstr '%F{green}!%f'
    zstyle ':vcs_info:git*+set-message:*' hooks git-status

    add-zsh-hook precmd prompt_custom_precmd

    [[ -n ${SSH_CONNECTION} ]] && prompt_custom_username='%n@%m '

    PROMPT='%(?.%F{green}.%F{red})━%f '
    RPROMPT='%F{242}${prompt_custom_username}%f'
}

prompt_custom_setup "$@"
