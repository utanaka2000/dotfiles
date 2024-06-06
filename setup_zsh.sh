# for zsh settings
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
cp ./.zshrc ~/
source ~/.zshrc

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# for vim settings
brew install vim
cp $HOME/dotfiles/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
cp $HOME/dotfiles/.vim/colors/hybrid.vim $HOME/.vim/colors/hybrid.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install deno

# for install neovim
brew install neovim
mkdir -p ~/.config/nvim/
cp ./init.vim ~/.config/nvim/init.vim
