if [[ "${OSTYPE}" == darwin* ]]; then
  export BROWSER='open'
fi

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -c 'nmap q :q<Return>' -\""

# user paths
export NOTES="${HOME}/dev/notes"
export SCRIPTS="${HOME}/.scripts"
export DOTFILES="${HOME}/dev/dotfiles"
NPM_LOCAL="${HOME}/.npm"
export NODE_PATH="${NPM_LOCAL}/lib/node_modules:${NODE_PATH}"

if [[ -z "${LANG}" ]]; then
  export LANG='en_GB.UTF-8'
fi

typeset -gU cdpath fpath mailpath path

cdpath=(
    ${cdpath}
    ${HOME}/dev
    ${HOME}/dev/proj
)

path=(
    /usr/local/{bin,sbin}
    ${path}
    ${HOME}/.gem/ruby/2.1.0/bin
    ${HOME}/.scripts
    ${HOME}/.dev
    ${HOME}/.cabal/bin
    ${NPM_LOCAL}/bin
)

unset MANPATH
MANPATH="${NPM_LOCAL}/share/man:$(manpath)"

export LESS='-F -g -i -M -R -S -w -X -z-4'

if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

if [[ ! -d "${TMPDIR}" ]]; then
  export TMPDIR="/tmp/${USER}"
  mkdir -p -m 700 "${TMPDIR}"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "${TMPPREFIX}" ]]; then
  mkdir -p "${TMPPREFIX}"
fi

export XDG_CONFIG_HOME="${HOME}/.config"
export PANEL_FIFO="/tmp/panel-fifo"

export _JAVA_AWT_WM_NONREPARTENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Xmx4096m'

[[ -z ${DISPLAY} && ${XDG_VTNR} -eq 1 ]] && exec startx
