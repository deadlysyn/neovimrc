![Neovim Logo](https://github.com/deadlysyn/neovimrc/blob/master/img/neovim-logo.png "Neovim")

# Opinionated Neovim Configuration

I've been using vi and vim for over 20 years now. In that time, I've accumulated a lot of
customizations. Aside from my personal settings, pre-baked configs -- including
"[The Ultimate Vim Configuration](https://github.com/amix/vimrc)" and
[vim-go](https://github.com/fatih/vim-go) -- provide a lightweight IDE
when combined with [tmux](https://github.com/tmux/tmux). These served me well for many years.

When I decided to give [Neovim](https://neovim.io) a spin, I wanted to take the opportunity to
reevaluate my choices -- removing plugins I didn't use, updating ones which had
better alternatives (in my opinion), adjusting key bindings and other bits to my taste,
and optimizing the environment for the languages I currently use most (Javascript and Go).

_This project is very opinionated._ When compared to more thorough projects like
[amix/vim](https://github.com/amix/vimrc), I've stripped a lot of compatability code
(multi-OS support, GUI checks, etc). This certainly makes the configuration less
portable, but I've purposefully optimized for MacOS + [iTerm2](https://www.iterm2.com) +
[tmux](https://github.com/tmux/tmux/wiki). I've also stripped a few plugins I relied
on heavily for years ([bufexplorer](https://github.com/jlanzarotta/bufexplorer),
[NERD Tree](https://github.com/scrooloose/nerdtree), [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)),
opting for [fzf](https://github.com/junegunn/fzf) as a more efficient swiss army knife.

Hopefully you find this useful...  If not directly, at least as a starting point for your
own customization!

## Dependencies

Out of the box, this configuration requires the following:

```
# My preferences
brew install tmux
brew install iterm2

# Hard dependencies
brew install neovim
brew tap caskroom/fonts
brew cask install font-fira-code # ligature support
brew install gawk
brew install fzf
brew install the_silver_searcher
brew install python # need python3

pip3 install neovim
pip3 install --upgrade neovim

# You'll need to install/configure your favorite linters...
npm install -g eslint
npm install -g prettier
```

## Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. It's minimalist,
and you just need to remember `PlugInstall` and `PlugClean`.

### Included Plugins

Read over the documentation for each of the included plugins for usage information.

- [lightline](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline plugin for Vim.
- [neomake](https://github.com/neomake/neomake): Asynchronous linting and make framework for Neovim/Vim
- [deoplete](https://github.com/Shougo/deoplete.nvim): Dark powered asynchronous completion framework for neovim/Vim8
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [fzf.vim](https://github.com/junegunn/fzf.vim): Useful bundle of fzf-based commands and mappings
- [fzf-filemru](https://github.com/tweekmonster/fzf-filemru): File MRU with fzf.vim
- [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing gf (if the text under the cursor is a path)
- [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for the Perl module / CLI script 'ack' (used for alias and command definitions, with `ackprg` mapped to `ag --vimgrep`)
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired): pairs of handy bracket mappings
- [vim-repeat](https://github.com/tpope/vim-repeat): enable repeating supported plugin maps with "."
- [vim-surround](https://github.com/tpope/vim-surround): quoting/parenthesizing made simple
- [vim-sleuth](https://github.com/tpope/vim-sleuth): Heuristically set buffer options
- [vim-commentary](https://github.com/tpope/vim-commentary): comment stuff out
- [vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper so awesome, it should be illegal
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): A solid language pack for Vim
- [ultisnips](https://github.com/SirVer/ultisnips): The ultimate snippet solution for Vim
- [vim-snippets](https://github.com/honza/vim-snippets): vim-snipmate default snippets (Previously snipmate-snippets)
- [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim
- [vim-javascript](https://github.com/pangloss/vim-javascript): Vastly improved Javascript indentation and syntax support in Vim
- [vim-json](https://github.com/elzr/vim-json): A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. 


## Layout, Color & Themes

layout inspired by amix/vimrc
modular - can add/remove vim-plug plugins

color scheme/base16 plug... why not solarized
font / ligatures
truecolor

## Installation

vim-plug
PlugInstall

## Resources & Inspiration

- [vim-plug](https://github.com/junegunn/vim-plug)
- [Ian Langworth's awesome VIM writeup](https://statico.github.io/vim3.html)
- [Vim without NERD tree or CtrlP](https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb)
- [Fira Code Font](https://github.com/tonsky/FiraCode)
- [VimR: Neovim GUI](https://github.com/qvacua/vimr)
- [Nice tmux Config](https://github.com/tony/tmux-config)
