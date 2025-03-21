#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles
OS_TYPE="$(uname -s)"
echo "OS_TYPE: $OS_TYPE"

# homebrew
if [ "$OS_TYPE" = "Darwin" ]; then
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# git
git config --global user.name utanaka2000
git config --global user.email 27200337+utanaka2000@users.noreply.github.com

# zsh
mkdir -p $HOME/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.zsh/zsh-completions
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc


# vim
mkdir -p $HOME/.vim
ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
curl -fLo $HOME/.vim/colors/hybrid.vim --create-dirs \
    https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


mkdir -p $HOME/.config

# neovim
ln -s $DOTFILES_DIR/nvim $HOME/.config


if [ "$OS_TYPE" = "Darwin" ]; then
    # karabiner
    ln -s $DOTFILES_DIR/karabiner $HOME/.config

    # vscode
    ln -s $DOTFILES_DIR/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    ln -s $DOTFILES_DIR/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
fi
