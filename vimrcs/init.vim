" I inheirit these from my terminal. If you adjust, do it at the top
" of your config or you may run into edge cases.
"set encoding=utf8
"set termencoding=utf-8

" https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/Shougo/deoplete.nvim.git', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/tweekmonster/fzf-filemru.git'
Plug 'https://github.com/amix/open_file_under_cursor.vim.git'
Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-sleuth.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/fatih/vim-go.git', { 'do': ':GoUpdateBinaries', 'tag': 'v1.17' }
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'https://github.com/elzr/vim-json.git'
Plug 'https://github.com/gabrielelana/vim-markdown.git'
Plug 'https://github.com/stephpy/vim-yaml.git'
call plug#end()

" Keep config modular
source ~/.config/nvim/includes/00-simple.vim
source ~/.config/nvim/includes/05-full.vim
source ~/.config/nvim/includes/10-plugin_conf.vim
source ~/.config/nvim/includes/99-custom_conf.vim
