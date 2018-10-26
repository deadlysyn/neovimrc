"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local customiations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

" https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
