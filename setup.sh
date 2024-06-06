# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update


# for zsh settings
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
brew install peco
cp ./assets/.zshrc ~/
source ~/.zshrc


# for vim settings
brew install vim
cp ./assets/.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp ./assets/hybrid.vim ~/.vim/colors/hybrid.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install deno


# for install neovim
brew install neovim
mkdir -p ~/.config/nvim/
cp ./assets/init.vim ~/.config/nvim/init.vim


# for karabiner settings
mkdir -p ~/.config/karabiner
cp ./assets/karabiner.json ~/.config/karabiner/karabiner.json

