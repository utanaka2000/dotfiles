# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update


# for zsh settings
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
brew install peco
cp ./.zshrc ~/
source ~/.zshrc


# for vim settings
brew install vim
cp -r ./vim/* ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# for install neovim
brew install neovim
mkdir -p ~/.config/nvim/
cp ./nvim/init.lua ~/.config/nvim/init.lua


# for karabiner settings
brew install --cask karabiner-elements
mkdir -p ~/.config/karabiner
cp ./karabiner.json ~/.config/karabiner/karabiner.json


# for install mac applications
brew install --cask iterm2
brew install --cask clipy
brew install --cask rectangle
brew install --cask visual-studio-code
brew install --cask flux
brew install --cask google-chrome
