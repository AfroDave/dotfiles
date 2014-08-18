if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export JAVA_HOME=/opt/java/

# user paths
export NOTES=/home/${USER}/dev/notes
export SCRIPTS=/home/${USER}/.scripts
export DOTFILES=/home/${USER}/dev/dotfiles

if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi

typeset -gU cdpath fpath mailpath path

cdpath=(
    $cdpath
    /home/${USER}/dev
    /home/${USER}/dev/projects
)

path=(
    /usr/local/{bin,sbin}
    $path
    /home/${USER}/.gem/ruby/2.1.0/bin
    /home/${USER}/.scripts
    /home/${USER}/.scripts/panel
    /home/${USER}/.cabal/bin
    /home/${USER}/.npm/bin
)

export LESS='-F -g -i -M -R -S -w -X -z-4'

if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

