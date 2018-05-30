" Do this early.
set encoding=utf8

" junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/denite.nvim'
Plug 'brooth/far.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.17' }
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'mhartington/nvim-typescript'
call plug#end()

" Keep config modular
source ~/.config/nvim/include/00-simple.vim
source ~/.config/nvim/include/05-full.vim
source ~/.config/nvim/include/10-plugin.vim
source ~/.config/nvim/include/99-custom.vim
