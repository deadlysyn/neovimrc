#!/usr/bin/env bash

set -e
umask 022

# If you change this, adjust paths in *.vim to match...
DIR="~/.config/nvim"
mkdir -p "${DIR}/{autoload,colors,include,plugged}"

function grab() {
    path="$1"
    url="$2"
    curl -fLo "$path" --create-dirs "$url" && echo "$url --> $path"
}

# Install vim-plug
if [ ! -r ~/.local/share/nvim/site/autoload/plug.vim ]
then
    grab ~/.local/share/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Backup config if it exists
if [ ! -r "${DIR}/init.vim.save" -a -r "${DIR}/init.vim" ]
then
    cp "${DIR}/init.vim" "${DIR}/init.vim.save"
fi

grab "${DIR}/init.vim" \
    https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/init.vim
grab "${DIR}/include/00-simple.vim" \
    https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/00-simple.vim
grab "${DIR}/include/05-full.vim" \
    https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/05-full.vim
grab "${DIR}/include/10-plugin.vim" \
    https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/10-plugin.vim
grab "${DIR}/include/99-custom.vim" \
    https://raw.githubusercontent.com/deadlysyn/neovimrc/master/vimrcs/include/99-custom.vim
