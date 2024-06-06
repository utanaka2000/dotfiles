#!/bin/bash

cp $HOME/dotfiles/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
cp $HOME/dotfiles/.vim/colors/hybrid.vim $HOME/.vim/colors/hybrid.vim
# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# for ddc
brew install deno
