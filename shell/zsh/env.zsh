#! /usr/bin/env zsh

[[ -z "${LANG}" ]] && export LANG='en_GB.UTF-8'

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

[[ "${TERM}" == xterm ]] && export TERM=xterm-256color

export BROWSER='firefox'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='vimpager'
export MANPAGER="${PAGER}"
export GREP_COLOR='032;255'
export GREP_COLORS="mt=032;ms=032;mc=032;${GREP_COLORS}"
export LESS='-FgiMRSwXz-4'

export NOTES="${HOME}/dev/notes"
export SCRIPTS="${HOME}/.scripts"
export DOTFILES="${HOME}/dev/dotfiles"

export NODE_PATH="${HOME}/.npm/lib/node_modules:${NODE_PATH}"

export XDG_CONFIG_HOME="${HOME}/.config"
export PANEL_FIFO="${TMPDIR}/panel-fifo"

wmname LG3D
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Xmx4096m'

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/cuda/lib64"

typeset -gU cdpath fpath path

cdpath=(
    ${cdpath}
    ${HOME}/dev
    ${HOME}/dev/proj
)

fpath=(
    ${fpath}
)

path=(
    /usr/local/{bin,sbin}
    ${path}
    ${HOME}/.scripts
    ${HOME}/.dev
    ${HOME}/.cabal/bin
    ${HOME}/.gem/ruby/2.1.0/bin
    ${HOME}/.composer/vendor/bin
    ${HOME}/.npm/bin
    /opt/cuda/bin
)
