#!/bin/bash

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
ln -s $HOME/dotfiles/.vim/colors/hybrid.vim $HOME/.vim/colors/hybrid.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install deno
