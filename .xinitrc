if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

source_these=(
	"/etc/profile"
	"/etc/zsh/zprofile"
	"${HOME}/.profile"
	"${HOME}/.zprofile"
	"${XDG_CONFIG_HOME:-"$HOME/.config"}/bspwm/autostart"
)

for file in "${source_these[@]}"; do
	[ -r "${file}" ] && . "${file}"
done

sxhkd &
exec bspwm
