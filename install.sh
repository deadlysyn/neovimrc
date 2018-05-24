#!/usr/bin/env bash

set -eu
umask 022

# If you change this, adjust paths in *.vim to match...
DIR="${HOME}/.config/nvim"

grab() {
    url="$1"
    path="$2"
    [ -e "$path" ] && rm -f "$path"
    curl -sfLo "$path" --create-dirs "$url" && echo "$url --> $path"
}

# Install vim-plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]
then
    grab https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        ~/.local/share/nvim/site/autoload/plug.vim
fi

# Backup configs on first run
if [ ! -d "${DIR}.save" -a -d "${DIR}" ]
then
    mv "${DIR}" "${DIR}.save"
fi

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/init.vim \
    "${DIR}/init.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/00-simple.vim \
    "${DIR}/include/00-simple.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/05-full.vim \
    "${DIR}/include/05-full.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/10-plugin.vim \
    "${DIR}/include/10-plugin.vim"

# Contains overrides, so only install if it doesn't exist.
if [ ! -e "${DIR}/include/99-custom.vim" ]
then
    grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/99-custom.vim \
        "${DIR}/include/99-custom.vim"
fi

cat <<EOF

Configuration complete!

Now start Neovim and type:

    :PlugInstall<enter> (takes awhile on first run)
    :UpdateRemotePlugins
    :q!
    :q!

If this is your first time, you may also need to download spelling
files. If so, just answer 'Y' and hit 'ENTER' until it completes and
you should be good to go.
EOF
