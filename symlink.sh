#!/bin/bash
#
echo "hopefully you read the source code of the script you're about to run"
echo "because I'm about to delete a bunch of files"
read -p  "continue? (y/N) > " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    # handle exits from shell or function but don't exit interactive shell
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.nvimrc > /dev/null 2>&1
sudo rm -rf ~/.nvim > /dev/null 2>&1
sudo rm -rf ~/.spacemacs > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore > /dev/null 2>&1
sudo rm -rf ~/.wgetrc > /dev/null 2>&1
sudo rm -rf ~/.inputrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
if [ "$(uname)" = "Darwin" ]; then
  :
else
  sudo rm -rf ~/.Xresources > /dev/null 2>&1
  sudo rm -rf ~/.xinitrc > /dev/null 2>&1
fi

ln -s ~/dotfiles/config ~/.config
ln -s ~/dotfiles/bashrc.sh ~/.bashrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/mac_tmux ~/.tmux

if [ "$(uname)" = "Darwin" ]; then
  mkdir -p ~/Library/KeyBindings
  # TODO: does this still add anything?
  ln -s ~/dotfiles/system_wide_emacs_movement.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

  # Terminal.app doesn't read .bashrc, but .profile works
  echo >> ~/.profile
  echo 'source ~/.bashrc' >> ~/.profile
else
  ln -s ~/dotfiles/bashlinux.sh ~/.bashlinux
  ln -s ~/dotfiles/Xresources ~/.Xresources
  ln -s ~/dotfiles/xinitrc ~/.xinitrc
  # ubuntu doesn't run xinitrc or xsession
  ln -s ~/dotfiles/xinitrc ~/.xsessionrc
fi
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/wgetrc ~/.wgetrc
ln -s ~/dotfiles/inputrc ~/.inputrc
