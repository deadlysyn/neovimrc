#!/usr/bin/env bash

# If you change this, adjust paths in *.vim to match...
DIR="~/.config/nvim"

set -e
umask 022

function grab() {
    url="$1"
    path="$2"
    curl -sfLo "$path" --create-dirs "$url" && echo "$url --> $path"
}

# Install vim-plug
if [ ! -r ~/.local/share/nvim/site/autoload/plug.vim ]
then
    grab https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        ~/.local/share/nvim/site/autoload/plug.vim
fi

# Backup configs on first run
if [ ! -d "${DIR}.save" -a -d "${DIR}" ]
then
    mv "${DIR}" "${DIR}.save"
fi

mkdir -p "${DIR}/{autoload,colors,include,plugged}"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/init.vim \
    "${DIR}/init.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/00-simple.vim \
    "${DIR}/include/00-simple.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/05-full.vim \
    "${DIR}/include/05-full.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/10-plugin.vim \
    "${DIR}/include/10-plugin.vim"

grab https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/99-custom.vim \
    "${DIR}/include/99-custom.vim"

cat <<EOF

All Done!

Start Neovim and type ':PlugInstall'. You may also need to download
spelling files. If so, just answer 'Y' and hit 'ENTER' until it
completes and you should be good to go.
EOF
