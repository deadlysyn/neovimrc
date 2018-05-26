" Do this early.
set encoding=utf8

" https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/Shougo/deoplete.nvim.git', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/Shougo/denite.nvim.git'
Plug 'https://github.com/brooth/far.vim.git'
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
"Plug 'https://github.com/gabrielelana/vim-markdown.git'
Plug 'https://github.com/stephpy/vim-yaml.git'
call plug#end()

" Keep config modular
source ~/.config/nvim/include/00-simple.vim
source ~/.config/nvim/include/05-full.vim
source ~/.config/nvim/include/10-plugin.vim
source ~/.config/nvim/include/99-custom.vim
