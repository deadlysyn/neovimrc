![Neovim Logo](https://github.com/deadlysyn/neovimrc/blob/master/img/neovim-logo.png "Neovim")

# An Opinionated Neovim Configuration

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
[tmux](https://github.com/tmux/tmux/wiki).

Hopefully you find this useful...  If not directly, at least as a starting point for your
own customization!

## Plugins



plugins included...

## Layout, Color & Themes
layout inspired by amix/vimrc
modular - can add/remove vim-plug plugins


color scheme/base16 plug... why not solarized
font / ligatures
truecolor

## Dependencies

```
brew install iterm2
brew install neovim
brew tap caskroom/fonts
brew cask install font-fira-code
brew install gawk
brew install fzf
brew install the_silver_searcher
```

## Installation

vim-plug

## Layout & Customization

file hierarchy

## Resources & Inspiration

- 
- [Ian Langworth's awesome VIM writeup](https://statico.github.io/vim3.html)
- [Vim without NERD tree or CtrlP](https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb)
- [Fira Code Font](https://github.com/tonsky/FiraCode)
- [VimR: Neovim GUI](https://github.com/qvacua/vimr)
