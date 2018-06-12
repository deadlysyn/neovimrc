"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack.vim / ag / grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Grep_Skip_Dirs = '.git node_modules'

" Use ag to grep
set grepprg=ag\ --vimgrep\ --smart-case
let g:ackprg = 'ag --vimgrep --smart-case'

" remap 'K' to grep directory for word under cursor
nnoremap K :Ack! "\b<cword>\b" <CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack<space>

" Do :help cope if you are unsure what cope is. It's super useful!
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
" To go to the next search result do:
"   <leader>n
" To go to the previous search results do:
"   <leader>p
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Lazy-load to help startup time
"let g:deoplete#enable_at_startup = 0

"" Neocomplete-like auto select
""set completeopt+=noinsert

"" Make status messages more concise
""set shortmess+=c

"" Smart case matching
"let g:deoplete#enable_smart_case = 1

"" Helps performance
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

"" disable autocomplete by default
"" let b:deoplete_disable_auto_complete=1
"" let g:deoplete_disable_auto_complete=1
"" call deoplete#custom#buffer_option('auto_complete', v:false)

"" Disable the candidates in Comment/String syntaxes.
"call deoplete#custom#source('_',
"    \ 'disabled_syntaxes', ['Comment', 'String'])

"" Disable buffer source
"call deoplete#custom#option('ignore_sources', {'_': ['buffer']})

"" Close completion popup after selection
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:ale_fix_on_save = 1
" let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_linters_explicit = 1

" Disable highlighting
let g:ale_set_highlights = 0

" Always show sign column
let g:ale_sign_column_always = 1

" Use quickfix vs loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Denite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>ff :Denite file/rec<CR>
nnoremap <leader>fb :Denite buffer<CR>
nnoremap <leader>fc :DeniteCursorWord file/rec buffer<CR>
call denite#custom#option('default', 'prompt', '➤')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
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

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '∓'
let g:gitgutter_sign_modified_removed = '∓'
let g:gitgutter_sign_removed = '∅'
let g:gitgutter_sign_removed_first_line = '∅'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme = 'base16_tomorrow'

" Show open buffers in tabline when only one tab open
let g:airline#extensions#tabline#enabled = 1

" Use straight vs powerline style tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Adjust tabline format
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_open_list = 2

" Be less aggressive when on battery
if system('pmset -g | grep AC >/dev/null')
    call neomake#configure#automake('nrwi', 500)
else
    call neomake#configure#automake('w')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
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
" => vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:javascript_plugin_flow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'css', 'bash=sh', 'javascript', 'go']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
