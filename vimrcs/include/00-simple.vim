"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Use Unix as the standard file type
set ffs=unix,dos,mac

" make navigating files and buffers easier
set wildmenu
set wildignorecase

" Ignore cruft
set wildignore=*~,*.swp,*.bak,*/.DS_Store
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.pdb,*.min.*,*.o
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" Write file contents when calling :make
set autowrite

" Plugin refresh time
" Note: Some plugins suggest lowering this, but going too
" low can cause highlighting glitches. YMMV.
set updatetime=300

" Adjust key sequence timeout
set ttimeout
set ttimeoutlen=100

" Use system clipboard
set clipboard=unnamed

" I find folding confusing, and it causes glitches in
" some plugins.
set nofoldenable

" disable automatic comment insertion
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" See 10 lines around the cursor when moving vertically
set scrolloff=10

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Warn when there are unsaved changes
set warn

" Turn on line numbers
set nu

" Don't send special characters with backspace
set t_kb=

" Enable modelines
set modeline
set modelines=5

" Crosshair-highlight cursor
set cursorline
set cursorcolumn

" Delete comment character when joining commented lines
set formatoptions+=j

" performance tuning
set noshowmode noshowcmd noruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Truecolor support
set termguicolors

" Show colored column to help prevent long lines
set colorcolumn=80

" Highlight unwanted spaces
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc
set nobackup
set nowb
set noswapfile

" Turn persistent undo on
set undofile

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Soft wrap lines
set wrap
set linebreak

set autoindent
set smartindent

" Smart indenting after certain words
set cinwords=if,elif,else,for,while,try,except,finally,def,class

" Delete trailing white space on save, only useful for some filetypes!
" E.g. This would break markdown.
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Easily move lines or visual blocks
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Run macro on visual selection by pressing '@'
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set spelllang=en
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Turn on spell-checking for select filetypes
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd BufRead,BufNewFile *.html setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" git commits
autocmd FileType gitcommit setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72
