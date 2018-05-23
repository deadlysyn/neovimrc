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
Plug 'https://github.com/elzr/vim-json.git'
call plug#end()

source ~/.config/nvim/00-simple.vim
source ~/.config/nvim/05-full.vim
source ~/.config/nvim/10-plugin_conf.vim
source ~/.config/nvim/99-custom_conf.vim
