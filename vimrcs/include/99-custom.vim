"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local customiations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not used by terminal (neo)vim (set in iTerm)
"set guifont=Fira\ Code:h12

" function to toggle light/dark...

set background=dark

" https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
