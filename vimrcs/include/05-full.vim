"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of custom configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>e :e! ~/.config/nvim/99-custom_conf.vim<cr>
autocmd! bufwritepost ~/.config/nvim/99-custom_conf.vim source ~/.config/nvim/99-custom_conf.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Smart mappings on the command line
" cno $h e ~/
" cno $d e ~/Desktop/
" cno $j e ./

" " Bash like keys for the command line
" cnoremap <C-A>		<Home>
" cnoremap <C-E>		<End>
" cnoremap <C-K>		<C-U>
" cnoremap <C-P> <Up>
" cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ISO 8601
iab xdate <c-r>=strftime("%Y-%m-%dT%H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""
" => Bash section
""""""""""""""""""""""""""""""

" Correct highlighting for bash files
au BufRead,BufNewFile *bash* let g:is_bash=1
au BufRead,BufNewFile *bash* setf sh

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

"au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""

" treat ejs templates like html
"au BufNewFile,BufRead *.ejs set filetype=html

" run prettier on javascript files
autocmd FileType javascript set formatprg=prettier\ --stdin

" format on save
autocmd BufWritePre *.js :normal gggqG
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

" function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction

""""""""""""""""""""""""""""""
" => YAML section
"""""""""""""""""""""""""""""""

" use two space tabs for yaml
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
