"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim / ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Grep_Skip_Dirs = '.git node_modules'

" Use ag to grep
set grepprg=ag\ --vimgrep\ --smart-case
let g:ackprg = 'ag --vimgrep --smart-case'

" remap '<leader>g' to grep directory for word under cursor
nnoremap <leader>g :Ack! "\b<cword>\b" <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:ale_fix_on_save = 1

" Linters to use
" let g:ale_fixers = {}
" let g:ale_fixers = {
" \   'javascript': ['prettier-eslint\ --stdin'],
" \}

" Only run specified linters
" let g:ale_linters_explicit = 1

" Always show sign column
let g:ale_sign_column_always = 1

" Use quickfix vs loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Error and warning signs.
" let g:ale_sign_error = 'E'
" let g:ale_sign_warning = 'W'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Where symbols are displayed
set signcolumn=yes

" Display symbols for git diffs
let g:gitgutter_enabled=1

" Turn symbols off at some point for better performance
let g:gitgutter_max_signs = 500

" Easily turn gitgutter on/off
nnoremap <silent> <leader>gg :GitGutterToggle<cr>

" Use ag vs grep
let g:gitgutter_grep = 'ag'

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '-'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme = 'minimalist'

" Show open buffers in tabline when only one tab open
let g:airline#extensions#tabline#enabled = 1

" Use straight vs powerline style tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Adjust tabline format
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use goimports instead of gofmt
let g:go_fmt_command = "goimports"

" Enable auto import
let g:go_auto_sameids = 1

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

" show type info in status line
let g:go_auto_type_info = 1

" don't check for go-vim binaries on each run to speed things up
let g:go_disable_autoinstall = 0

" make all lists quickfix (vs quickfix+location which use different keys)
let g:go_list_type = "quickfix"

" make jumping between errors in go-vim easier
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

" make common go tasks easier in go-vim
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>t  <Plug>(go-test)
let g:go_test_timeout = '30s'
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap gd <Plug>(go-def-tab)

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" force *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" enable fenced code block syntax highlighting
let g:markdown_fenced_languages = ['html', 'css', 'bash=sh', 'javascript', 'go', 'python']

" disable markdown syntax concealing
let g:markdown_syntax_conceal = 0

