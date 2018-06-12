"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local customiations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Improves startup time
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Not used in terminal; set in iTerm
"set guifont=Fira\ Code:h12

set background=dark

" https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Note: These "fixes" are only required by my choice of
" colorscheme and line/cursor highlighting.
"
" keep denite matches readable
highlight deniteMatchedChar cterm=reverse gui=reverse
" make syntax errors readable
highlight Error ctermfg=1 ctermbg=3 guifg=#cc6666 guibg=#f0c674
