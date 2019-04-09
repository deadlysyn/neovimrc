" Do this early.
set encoding=utf8

" junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
call plug#end()

" Keep config modular
source ~/.config/nvim/include/00-simple.vim
source ~/.config/nvim/include/05-full.vim
source ~/.config/nvim/include/10-plugin.vim
source ~/.config/nvim/include/99-custom.vim
