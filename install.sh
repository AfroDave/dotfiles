#! /usr/bin/env bash

ln -s '~/dev/dotfiles' '~/.dotfiles'
ln -s '~/.dotfiles/bspwm' '~/.config/bspwm'
ln -s '~/.dotfiles/sxhkd' '~/.config/sxhkd'
ln -s '~/.dotfiles/ranger' '~/.config/ranger'
ln -s '~/.dotfiles/.scripts' '~/.scripts'

git clone --recursive 'https://github.com/sorin-ionescu/prezto.git' "${ZDOTDIR:-$HOME}/.zprezto"
ln -s '~/.dotfiles/prompt_custom_setup' '~/.zprezto/modules/prompt/functions'
ln -s '~/.dotfiles/.zpreztorc' '~/.zpreztorc'
ln -s '~/.dotfiles/.zprofile' '~/.zprofile'
ln -s '~/.dotfiles/.zshenv' '~/.zshenv'
ln -s '~/.dotfiles/.zshrc' '~/.zshrc'
ln -s '~/.dotfiles/.aliases' '~/.aliases'

ln -s '~/.dotfiles/.xinitrc' '~/.xinitrc'
ln -s '~/.dotfiles/.autostart' '~/.autostart'
ln -s '~/.dotfiles/.Xresources' '~/.Xresources'

ln -s '~/.dotfiles/.tmux.conf' '~/.tmux.conf'

ln -s '~/.dotfiles/.vimrc' '~/.vimrc'
ln -s '~/.dotfiles/.vimrc.bundles' '~/.vimrc.bundles'
mkdir -p '~/.vim/autoload'
curl -fLo '~/.vim/autoload/plug.vim' 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +PlugInstall +qa

ln -s '~/.dotfiles/.gtkrc-2.0.mine' '~/.gtkrc-2.0.mine'
