#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles
OS_TYPE="$(uname -s)"
echo "OS_TYPE: $OS_TYPE"

# install homebrew
if [ "$OS_TYPE" = "Darwin" ]; then
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew update
        brew bundle --file="$DOTFILES_DIR/Brewfile"
    fi
fi

# for zsh settings
mkdir -p $HOME/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.zsh/zsh-completions
ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc


# for vim settings
mkdir -p $HOME/.vim
ln -sf $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc
ln -sf $DOTFILES_DIR/vim/colors $HOME/.vim/
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# for install neovim
mkdir -p $HOME/.config
ln -sf $DOTFILES_DIR/nvim $HOME/.config/


if [ "$OS_TYPE" = "Darwin" ]; then
    # for karabiner settings
    mkdir -p $HOME/.config/karabiner
    ln -sf $DOTFILES_DIR/karabiner.json $HOME/.config/karabiner/karabiner.json

    # for vscode settings
    ln -sf $DOTFILES_DIR/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    ln -sf $DOTFILES_DIR/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
fi
