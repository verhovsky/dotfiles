#!/bin/bash

sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.nvimrc > /dev/null 2>&1
sudo rm -rf ~/.nvim > /dev/null 2>&1
sudo rm -rf ~/.spacemacs > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore > /dev/null 2>&1
sudo rm -rf ~/.wgetrc > /dev/null 2>&1
sudo rm -rf ~/.pentadactylrc > /dev/null 2>&1
sudo rm -rf ~/.pentadactyl > /dev/null 2>&1
sudo rm -rf ~/.inputrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
if [ "$(uname)" = "Darwin" ]; then
  sudo rm -rf ~/dotfiles/system_wide_emacs_movement.dict > /dev/null 2>&1
else
  sudo rm -rf ~/.Xresources > /dev/null 2>&1
  sudo rm -rf ~/.xinitrc > /dev/null 2>&1
fi

ln -s ~/dotfiles/config ~/.config
ln -s ~/dotfiles/spacemacs ~/.spacemacs
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/mac_tmux ~/.tmux

if [ "$(uname)" = "Darwin" ]; then
  mkdir -p ~/Library/KeyBindings
  ln -s ~/dotfiles/system_wide_emacs_movement.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

  # by default Terminal.app doesn't read .bashrc, but .profile works
  echo 'source ~/.bashrc' > ~/.profile
else
  ln -s ~/dotfiles/bashlinux ~/.bashlinux
  ln -s ~/dotfiles/Xresources ~/.Xresources
  ln -s ~/dotfiles/xinitrc ~/.xinitrc
      # ubuntu doesn't run xinitrc or xsession
  ln -s ~/dotfiles/xinitrc ~/.xsessionrc
fi
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/wgetrc ~/.wgetrc
ln -s ~/dotfiles/pentadactyl ~/.pentadactyl
ln -s ~/dotfiles/pentadactylrc ~/.pentadactylrc
ln -s ~/dotfiles/inputrc ~/.inputrc

cp ~/dotfiles/agignore ~/.agignore
