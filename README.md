# Simple, opinionated neovim config

I've been using vi(m) for over 20 years. In that time, I've accumulated a lot of
customizations. Aside from my personal settings, pre-baked configs -- including
[The Ultimate Vim Configuration](https://github.com/amix/vimrc) and
[vim-go](https://github.com/fatih/vim-go) -- provide a lightweight IDE
when combined with [tmux](https://github.com/tmux/tmux). These served me well for many years.

When I decided to give [Neovim](https://neovim.io) a spin, I wanted to take the opportunity to
re-evaluate my choices -- removing plugins I didn't use, updating ones which had
better alternatives (in my opinion), adjusting key bindings and other bits to my taste,
and optimizing the environment for the languages I currently use most.

_This project is very opinionated._ When compared to more thorough projects like
[amix/vim](https://github.com/amix/vimrc), I've stripped a lot of compatibility code
(multi-OS support, GUI checks, etc). This certainly makes the configuration less
portable, but I've purposefully optimized for MacOS + [iTerm2](https://www.iterm2.com) +
[tmux](https://github.com/tmux/tmux/wiki). I've also stripped a few plugins I relied
on heavily for years ([bufexplorer](https://github.com/jlanzarotta/bufexplorer),
[NERD Tree](https://github.com/scrooloose/nerdtree), [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)),
opting for [fzf](https://github.com/junegunn/fzf) as a more efficient Swiss Army knife.

## Dependencies

Out of the box, this configuration requires the following:

```
# Hard dependencies
brew install neovim
brew install the_silver_searcher # grep replacement
```

## Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. It's fairly
minimalist while maintaining a user-friendly interface -- for the most part, you just
need to remember `PlugInstall` and `PlugClean`. Installation is a breeze, and the install
script will take care of it for you.

### Included Plugins

There are a ton of cool plugins out there. I've tried very hard to add enough useful
functionality to increase efficiency without over-bloating my editor.  Read over the
documentation for each of the included plugins for usage information...

- [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for the Perl module / CLI script 'ack' (used for alias and command definitions, with `ackprg` mapped to `ag --vimgrep`)
- [airline](https://github.com/vim-airline/vim-airline): A light and configurable statusline/tabline plugin for Vim.
- [ale](https://github.com/w0rp/ale): Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
- [editorconfig](https://github.com/editorconfig/editorconfig-vim): EditorConfig plugin for Vim
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [fzf.vim](https://github.com/junegunn/fzf.vim): Better fzf vim plugin
- [vim-commentary](https://github.com/tpope/vim-commentary): comment stuff out
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): A solid language pack for Vim
- [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim
- [vim-json](https://github.com/elzr/vim-json): A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing
- [vim-yaml](https://github.com/stephpy/vim-yaml): Override vim syntax for yaml files

## Customizing

Neovim configuration resides in `~/.config/nvim` (like vim's `~/.vim`). The main file is `init.vim`
(Neovim's equivalent of `.vimrc`), which simply sources a number of `*.vim` files. This makes things
somewhat modular -- you can easily edit `init.vim` and exclude parts of the configuration you don't
use. If you like everything and just want to override a couple settings or extend the defaults, you
can drop custom bits in `99-custom.vim`.

### Truecolor

[Most terminals support "truecolor" these days](https://gist.github.com/XVilka/8346728).
This repo configures Neovim appropriately, but you may need additional steps in your
environment based on the terminal you use, whether you layer on tmux, etc. There's a useful
`colortest` utility you can use to verify proper behavior, and
[a helpful troubleshooting guide](https://recordnotfound.com/base16-vim-chriskempson-31016).

This is working for me on latest versions:

```
# iTerm
Ensure Settings > Profiles > Terminal > Report Terminal Type == xterm-256color

# tmux.conf
# some sources refer to "tmux-256color" which didn't work when I tested
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",screen-256color:Tc"

# neovim
set termguicolors
```

Inside iTerm and tmux `echo $COLORTERM` returns `truecolor`.
`printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"` should display `TRUECOLOR` in red.

## Installation

[Give the script a read](https://github.com/deadlysyn/neovimrc/blob/master/install.sh),
then installation should be as simple as running `install.sh`.

After that, you should have a properly configured nvim, but no plugins will be
installed.  Start nvim, ignore the warnings, run `PlugInstall`, `UpdateRemotePlugins`,
exit, restart and you should be ready to rock!

Refer to the [vim-plug](https://github.com/junegunn/vim-plug) docs for more information.

## Keymapping

I'm still refining the aliases, and you can always grep the configs for key mappings,
but here are some useful things to get you started...

Note: By default, I assign `<leader>` to `<space>`.

### Buffers Windows

- `<leader>-bn`: open new buffer
- `<leader>-bq`: close current buffer
- `<leader>-ba`: close all buffers
- `<leader>-l`: next buffer
- `<leader>-h`: previous buffer
- `<leader>-cd`: change working directory to current buffer's
- `<ctrl>-j/k/h/l`: move around windows

### Find Stuff

- `<leader><cr>`: clear search highlight
- `<leader>f`: fuzzy search files
- `<leader>b`: fuzzy search buffers
- `<leader>g`: grep directory for word under cursor

### Easier Editing

- `@`: run macro on visual selection
- `<ctrl>-j/k`: move line or visual block up/down
- `<leader>-w`: quick save
- `<leader>-ss`: toggle spell checking
- `<leader>-pp`: toggle paste mode

### Misc

- `<leader>-m`: trim `^M`'s
- `xdate`: type in insert mode to replace with ISO 8601 timestamp

## Resources & Inspiration

- [Ian Langworth's amazing Vim writeup](https://statico.github.io/vim3.html)
- [Afnan Enayet's Neovim Setup](https://afnan.io/2018-04-12/my-neovim-development-setup)
- [Oldie but goodie](https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard)
- [Vim without NERD tree or CtrlP](https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb)
- [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com)
- [Awesome tmux Config](https://github.com/tony/tmux-config)
