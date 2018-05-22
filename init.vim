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

source ~/.config/nvim/basic.vim
source ~/.config/nvim/extended.vim
source ~/.config/nvim/filetypes.vim
source ~/.config/nvim/plugins_config.vim

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" run neomake when reading/writing/insert.
call neomake#configure#automake('nrwi', 500)
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" fzf-filemru
nnoremap <c-p> :FilesMru --tiebreak=end<cr>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

set guifont=Fira\ Code:12
set termencoding=utf-8
set termguicolors
set fillchars+=stl:\ ,stlnc:\

" Fixes syntax errors in .sh
let is_bash=1

hi LineNr term=none ctermfg=none

if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  source ~/.vimrc_background
endif

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set t_kb=

" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set modeline

" Set up go syntax highlighting
au BufRead,BufNewFile *.go set filetype=go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

set warn nu

" VIM Specific Commands
set list

" cursor highlight
set cursorline
set cursorcolumn

" Smart indenting after certain words
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" don't check for go-vim binaries on each run to speed things up
let g:go_disable_autoinstall = 0

" write file contents when calling :make
set autowrite

" make jumping between errors in go-vim easier
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" make common go tasks easier in go-vim
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap gd <Plug>(go-def-tab)

let g:go_auto_sameids = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" ? make all lists quickfix (vs quickfix+location which use different keys)
let g:go_list_type = "quickfix"

" timeout for go test
let g:go_test_timeout = '30s'

" treat ejs templates like html
au BufNewFile,BufRead *.ejs set filetype=html

" use two space tabs for yaml
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" make yank, etc go to standard clipboard
set clipboard=unnamed

" performance tuning
set noshowmode noshowcmd noruler

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" run prettier on javascript files
autocmd FileType javascript set formatprg=prettier\ --stdin
" format on save
autocmd BufWritePre *.js :normal gggqG

" deoplete
let g:deoplete#enable_at_startup = 1

" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
