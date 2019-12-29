set encoding=utf8

" junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'hzchirs/vim-material'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
call plug#end()

source ~/.config/nvim/include/00-simple.vim
source ~/.config/nvim/include/05-full.vim
source ~/.config/nvim/include/10-plugin.vim
source ~/.config/nvim/include/99-custom.vim
