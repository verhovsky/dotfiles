#!/usr/bin/env bash

echo "hopefully you read the source code of the script you're about to run"
echo "because I'm about to delete a bunch of files"
sleep 3

DOTFILES_PREFIX=~/dotfiles

rm_if_not_link(){ [ -L "$1" ] || sudo rm "$1" > /dev/null 2>&1; }
rm_rf_if_not_link(){ [ -L "$1" ] || sudo rm -rf "$1" > /dev/null 2>&1; }

rm_if_not_link ~/.bashrc
rm_if_not_link ~/.nvimrc
rm_if_not_link ~/.nvim 
rm_if_not_link ~/.spacemacs 
rm_if_not_link ~/.gitconfig
rm_if_not_link ~/.gitignore 
rm_if_not_link ~/.wgetrc 
rm_if_not_link ~/.inputrc
rm_if_not_link ~/.Xmodmap

#rm_rf_if_not_link ~/.config
mv ~/.config/* ~/dotfiles/config
rm_rf_if_not_link ~/.tmux.conf 
rm_rf_if_not_link ~/.tmux 

if [ "$(uname)" = "Darwin" ]; then
  rm_if_not_link ~/.bash_mac
else
  rm_if_not_link ~/.Xresources
  rm_if_not_link ~/.xinitrc
fi


ln -s "$DOTFILES_PREFIX"/config ~/.config
ln -s "$DOTFILES_PREFIX"/bashrc.sh ~/.bashrc
ln -s "$DOTFILES_PREFIX"/tmux/tmux.conf ~/.tmux.conf
ln -s "$DOTFILES_PREFIX"/tmux/mac_tmux ~/.tmux
ln -s "$DOTFILES_PREFIX"/gitconfig ~/.gitconfig
ln -s "$DOTFILES_PREFIX"/gitignore ~/.gitignore
ln -s "$DOTFILES_PREFIX"/wgetrc ~/.wgetrc
ln -s "$DOTFILES_PREFIX"/inputrc ~/.inputrc
ln -s "$DOTFILES_PREFIX"/Xmodmap ~/.Xmodmap

if [ "$(uname)" = "Darwin" ]; then
  mkdir -p ~/Library/KeyBindings
  # TODO: does this still add anything?
  ln -s  "$DOTFILES_PREFIX"/macos/system_wide_emacs_movement.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

  # Terminal.app doesn't read .bashrc, but .profile works
  echo >> ~/.profile
  echo 'source ~/.bashrc' >> ~/.profile
  ln -s "$DOTFILES_PREFIX"/macos/bash_mac.sh ~/.bash_mac
else
  ln -s "$DOTFILES_PREFIX"/Xresources ~/.Xresources
  ln -s "$DOTFILES_PREFIX"/xinitrc ~/.xinitrc
  # ubuntu doesn't run xinitrc or xsession
  ln -s "$DOTFILES_PREFIX"/xinitrc ~/.xsessionrc
fi
