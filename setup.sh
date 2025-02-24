#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles
OS_TYPE="$(uname -s)"

# install homebrew
if [ "$OS_TYPE" = "Darwin" ]; then
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew update
        brew bundle --file="$DOTFILES_DIR/Brewfile"
    fi


# for zsh settings
mkdir -p $HOME/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.zsh/zsh-completions
ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc


# for vim settings
mkdir -p $HOME/.vim/colors
ln -sf $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc
ln -sf $DOTFILES_DIR/dotfiles/vim/.vim/colors $HOME/.vim/colors
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# for install neovim
mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES_DIR/nvim $HOME/.config/nvim


# for karabiner settings
if [ "$OS_TYPE" = "Darwin" ]; then
    mkdir -p $HOME/.config/karabiner
    ln -sf $DOTFILES_DIR/karabiner.json $HOME/.config/karabiner/karabiner.json
fi