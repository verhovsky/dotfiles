echo "grabbing icons"
wget "http://www.ccard3.com/uploads/9/7/7/8/9778620/___dynamic_archived.zip"

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install utilities
./brew.sh

# symlink dotfiles to home directory
./symlink.sh

# install some apps
./cask.sh

# System Settings
./osx

unzip -d ~/icons '___dynamic_archived.zip'
