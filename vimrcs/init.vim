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

" run neomake when reading/writing/insert.
call neomake#configure#automake('nrwi', 500)
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" fzf-filemru
nnoremap <c-p> :FilesMru --tiebreak=end<cr>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>


" Fixes syntax errors in .sh
let is_bash=1

if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  source ~/.vimrc_background
endif

" write file contents when calling :make
set autowrite

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

" don't check for go-vim binaries on each run to speed things up
let g:go_disable_autoinstall = 0

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
