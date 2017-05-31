if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# vim-plug is a package manager for nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# brew install programs
./brew.sh

# symlink dotfiles to home directory
./symlink.sh

# System Settings
./osx_config.sh

