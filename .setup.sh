#!/bin/bash
# install vim addons
cd ~/.vim/bundle
git clone https://github.com/chriskempson/base16-vim.git
git clone https://github.com/termhn/i3-vim-nav.git
git clone https://github.com/tshirtman/vim-cython.git
git clone https://github.com/fatih/vim-go.git

# base16 color scheme
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
