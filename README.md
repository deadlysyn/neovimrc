[![Neovim Logo](https://github.com/deadlysyn/neovimrc/blob/master/img/neovim-logo.png "Neovim")](https://neovim.io)

**NOTE: Plugin selection is almost locked down, but tuning in progress! This is mostly true for deoplete, which I am working hard to optimize for my specific language choices. Feel free to test drive, but I'm hoping to get startup time improved after some pending changes.**

# Opinionated Neovim Configuration

I've been using vi(m) for over 20 years. In that time, I've accumulated a lot of
customizations. Aside from my personal settings, pre-baked configs -- including
"[The Ultimate Vim Configuration](https://github.com/amix/vimrc)" and
[vim-go](https://github.com/fatih/vim-go) -- provide a lightweight IDE
when combined with [tmux](https://github.com/tmux/tmux). These served me well for many years.

When I decided to give [Neovim](https://neovim.io) a spin, I wanted to take the opportunity to
re-evaluate my choices -- removing plugins I didn't use, updating ones which had
better alternatives (in my opinion), adjusting key bindings and other bits to my taste,
and optimizing the environment for the languages I currently use most (Javascript and Go).
For better or worse, I also spend a lot of time staring at JSON and YAML, and like
appropriately tuned syntax highlighting.

_This project is very opinionated._ When compared to more thorough projects like
[amix/vim](https://github.com/amix/vimrc), I've stripped a lot of compatibility code
(multi-OS support, GUI checks, etc). This certainly makes the configuration less
portable, but I've purposefully optimized for MacOS + [iTerm2](https://www.iterm2.com) +
[tmux](https://github.com/tmux/tmux/wiki). I've also stripped a few plugins I relied
on heavily for years ([bufexplorer](https://github.com/jlanzarotta/bufexplorer),
[NERD Tree](https://github.com/scrooloose/nerdtree), [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)),
opting for [fzf](https://github.com/junegunn/fzf) as a more efficient Swiss Army knife.

Hopefully you find this useful...  If not directly, at least as a starting point for your
own customization!

## Dependencies

Out of the box, this configuration requires the following:

```
# My preferences
brew install iterm2
brew install tmux
brew tap caskroom/fonts
brew cask install font-fira-code # ligature support

# Hard dependencies
brew install neovim
brew install fzf # fuzzy search
brew install gawk # required by fzf-filemru
brew install the_silver_searcher # grep replacement
brew install python # python3 required by deoplete

pip3 install --user neovim
pip3 install --upgrade neovim

# Install/configure your favorite linters and formatters..
npm install -g eslint
npm install -g prettier
```

This is still a work in progress, so if you find something missing please let me know...
A lot more can be required, depending how far down the completion rabbit hole you want to go!

## Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. It's fairly
minimalist while maintaining a user-friendly interface -- for the most part, you just
need to remember `PlugInstall` and `PlugClean`. Installation is a breeze, and the install
script will take care of it for you.

A future effort may refactor using [dein](https://github.com/Shougo/dein.vim) since it's
reportedly faster, or perhaps [native package management](https://shapeshed.com/vim-packages)
since that's a thing now and fewer dependencies are awesome.

### Included Plugins

Read over the documentation for each of the included plugins for usage information...

- [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for the Perl module / CLI script 'ack' (used for alias and command definitions, with `ackprg` mapped to `ag --vimgrep`)
- [deoplete](https://github.com/Shougo/deoplete.nvim): Dark powered asynchronous completion framework for neovim/Vim8
- [lightline](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline plugin for Vim.
- [neomake](https://github.com/neomake/neomake): Asynchronous linting and make framework for Neovim/Vim
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [fzf.vim](https://github.com/junegunn/fzf.vim): Useful bundle of fzf-based commands and mappings
- [fzf-filemru](https://github.com/tweekmonster/fzf-filemru): File MRU with fzf.vim
- [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing gf (if the text under the cursor is a path)
- [ultisnips](https://github.com/SirVer/ultisnips): The ultimate snippet solution for Vim
- [vim-snippets](https://github.com/honza/vim-snippets): vim-snipmate default snippets (Previously snipmate-snippets)
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired): pairs of handy bracket mappings
- [vim-repeat](https://github.com/tpope/vim-repeat): enable repeating supported plugin maps with "."
- [vim-surround](https://github.com/tpope/vim-surround): quoting/parenthesizing made simple
- [vim-sleuth](https://github.com/tpope/vim-sleuth): Heuristically set buffer options
- [vim-commentary](https://github.com/tpope/vim-commentary): comment stuff out
- [vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper so awesome, it should be illegal
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): A solid language pack for Vim
- [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim
- [vim-javascript](https://github.com/pangloss/vim-javascript): Vastly improved Javascript indentation and syntax support in Vim
- [vim-jsx](https://github.com/mxw/vim-jsx): React JSX syntax highlighting and indenting for vim.
- [vim-json](https://github.com/elzr/vim-json): A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing
- [vim-markdown](https://github.com/gabrielelana/vim-markdown): Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that doesn't suck!
- [vim-yaml](https://github.com/stephpy/vim-yaml): Override vim syntax for yaml files

## Layout, Color & Themes

Neovim configuration resides in `~/.config/neovim` (like vim's `~/.vim`). The main file is `init.vim`
(Neovim's equivalent of `.vimrc`), which simply sources a number of `*.vim` files. This makes things
somewhat modular -- you can easily edit `init.vim` and exclude parts of the configuration you don't
use. If you like everything and just want to override a couple settings or extend the defaults, you
can drop custom bits in `99-custom.vim`.

Themes live in `~/.config/nvim/colors`. I know themes are often seen as unnecessary bling,
but as something I spend many hours a day staring at, I find a well designed colorscheme
essential to happiness. When done right, it relieves eyestrain through optimal contrast
and boosts efficiency by better conveying important information.

For many years I was a [solarized](http://ethanschoonover.com/solarized) user.
Everyone's taste is different, but I still think it's a thoughtful design. Unfortunately, I'm a
night owl and often find myself working late. With Night Shift now native in MacOS (thank you,
[flux](https://justgetflux.com)), I've found blue-heavy themes suffer as the day progresses. This
got me looking for alternatives that offer similarly thoughtful design (balanced and consistent
contrast, light and dark modes) in a different color palette.

I spent some time looking at available themes (I really don't want to create my own), and
the primary candidates I considered moving to were [gruvbox](https://github.com/morhetz/gruvbox)
and [tomorrow](https://github.com/chriskempson/tomorrow-theme)... Both are beautiful, but
I've currently settled on _Tomorrow_ for a few reasons:

- Themes were available for all my tools (gruvbox is now too, just not in the official lightline repo)
- More modes (light, dark, eighties, blue, etc.)
- Stronger contrast in some areas (personal preference)
- Mature project with [good community feedback](https://www.slant.co/topics/358/~best-color-themes-for-text-editors)

### Base16 FTW

Out of the box, I use the [Tomorrow Night](https://github.com/chriskempson/base16-tomorrow-scheme)
colorscheme based on [base16](https://github.com/chriskempson/base16) (an amazing set of styling
guidelines and theme builder framework). Aside from theming your terminal
([which is left as an exercise for the reader](https://github.com/martinlindhe/base16-iterm2)),
we just need to ensure Neovim itself and [lightline](https://github.com/itchyny/lightline.vim)
are consistently styled.

The first is addressed by simply installing [base16-vim](https://github.com/chriskempson/base16-vim)
which pulls in all the base16 themes (the one we care about is `~/.config/nvim/colors/base16-tomorrow-night.vim`),
and the latter by `~/.config/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/Tomorrow_Night.vim`
(which ships with [lightline](https://github.com/itchyny/lightline.vim) so is only present after `PlugInstall`).
Feel free to adjust or override these as needed!

### Truecolor

I've realized I enjoy "truecolor" support. Luckily,
[most terminals can do it](https://github.com/junegunn/vim-plug). The differences
range from subtle to glaring, but make for a better experience overall. While this repo
configures Neovim itself in a way that should be appropriate, you may need additional
steps in your environment which will differ based on the terminal you use, whether you
layer on tmux, etc.

Along with truecolor support, I mostly live in the commandline so use
[base16-shell](https://github.com/chriskempson/base16-shell) to preserve the original ANSI colors.
There's also a useful `colortest` utility you can use to verify proper behavior, and
[a helpful troubleshooting guide](https://recordnotfound.com/base16-vim-chriskempson-31016).

Historically, support was spotty and this seemed to be black magic...  With any recent
combination of tools it should be straightforward. This is working for me:

```
# iTerm
Ensure Settings > Profiles > Terminal > Report Terminal Type == xterm-256color

# tmux.conf
# some sources refer to "tmux-256color" which didn't work when I tested
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",screen-256color:Tc"

# (neo)vim
set termguicolors
```

Inside iTerm and tmux `echo $COLORTERM` returns `truecolor`.  Another common test is that
`printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"` should display `TRUECOLOR` in red.

## Ligatures

After years with [Source Code Pro](https://github.com/adobe-fonts/source-code-pro), I've moved to
[Fira Code](https://github.com/tonsky/FiraCode) mainly for
[ligature support](https://medium.com/larsenwork-andreas-larsen/ligatures-coding-fonts-5375ab47ef8e).
This is all the rage, but I feel it's a subjective setting. Some feel it makes their code
easier to read, I resisted for quite awhile because I felt it actually made some things harder to read.
Finally decided to give it a spin in this config, and chose Fira Code because
[it is one of the top-reviewed fonts with ligature support](https://www.slant.co/topics/5611/~monospace-programming-fonts-with-ligatures).
Aside from installing the font, be sure to select it and enable ligatures via `iTerm Settings > Profiles > Text > Font`.

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

By default, I assign `<leader>` to `<space>`.

### Find Stuff

- `,f`: fuzzy search files
- `,b`: fuzzy search buffers
- `<ctrl>-p`: MRU file list

### Easier Editing

- `<ctrl>-j/k`: move line or visual block up/down
- `<leader>-ss`: toggle spell checking
- `<leader>-pp`: toggle paste mode

### Language Support
TODO

## Terminal Thoughts

Years ago I hopped on the iTerm bandwagon because it addressed serious gaps in the native MacOS
terminal. As things have evolved, there are less reasons to use a terminal
replacement...it largely comes down to personal preference.  A future experiment may include
rip/replace of iTerm (though I still love it!), or at least keeping a close eye on performance
due to [this interesting writeup](https://danluu.com/term-latency).

## Resources & Inspiration

- [Ian Langworth's amazing Vim writeup](https://statico.github.io/vim3.html)
- [Afnan Enayet's Neovim Setup](https://afnan.io/2018-04-12/my-neovim-development-setup)
- [Oldie but goodie](https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard)
- [Vim without NERD tree or CtrlP](https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb)
- [VimR: A Neovim GUI](https://github.com/qvacua/vimr)
- [Awesome tmux Config](https://github.com/tony/tmux-config)
