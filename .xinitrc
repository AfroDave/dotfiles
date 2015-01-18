if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "${f}" ] && . "${f}"
    done
    unset f
fi

source_these=(
	"/etc/profile"
	"/etc/zsh/zprofile"
	"${HOME}/.profile"
	"${HOME}/.zprofile"
	"${XDG_CONFIG_HOME:-"${HOME}/.autostart"
	"${XDG_CONFIG_HOME:-"${HOME}/.config"}/bspwm/bspwmrc"
)

for file in "${source_these[@]}"; do
	[ -r "${file}" ] && . "${file}"
done

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GPG_AGENT_INFO SSH_AUTH_SOCK

sxhkd &
exec bspwm -c ~/.config/bspwm/bspwmrc
