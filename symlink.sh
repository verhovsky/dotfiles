#!/usr/bin/env bash

# Location of current file
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# if the first arg exists, print an rm and ln command to stdout
# that the user can then execute later
# if it doesn't exist, run the ln command directly
ln_if_not_link() {
  if [ -e "${@: -1}" ]; then
    echo "rm $DOTFILES/$1"
    echo ln -s "$DOTFILES/$1" "$2"
  else
    echo ln -s "$DOTFILES/$1" "$2"
  fi
}

# if the last argument is a symlink, pass all arguments to an "rm" command
rm_if_not_link() {
  if [ ! -L "${@: -1}" ]; then
    echo "rm $1"
  fi
}

ln_if_not_link bashrc    ~/.bashrc
ln_if_not_link gitconfig ~/.gitconfig
ln_if_not_link gitignore ~/.gitignore
ln_if_not_link wgetrc    ~/.wgetrc
ln_if_not_link inputrc   ~/.inputrc

ln_if_not_link ideavimrc ~/.ideavimrc

ln_if_not_link tmux.conf ~/.tmux.conf
ln_if_not_link tmux/ ~/.tmux

# TODO: do this idempotently and safely
# should probably prompt on that...
# Avoid getting into an incosistent state if you can't copy something from the existing ~/.config
# because it already exists in ~/dotfiles/config
if [[ ! -L ~/.config ]]; then
  echo cp ~/.config/* "$DOTFILES"/config
  echo ln -s "$DOTFILES"/config ~/.config
fi

# It's in ~/dotfiles/config/nvim/init.lua
rm_if_not_link ~/.nvimrc               > /dev/null 2>&1;
rm_if_not_link ~/.nvim                 > /dev/null 2>&1;

# macOS specific
if [ "$(uname)" = "Darwin" ]; then
  # Terminal.app doesn't read .bashrc, but .profile works
  # Check if `source ~/.bashrc` is already in .profile
  grep -q 'source ~/.bashrc' ~/.profile ||  {
    echo >> ~/.profile
    echo 'source ~/.bashrc' >> ~/.profile
  }
  ln_if_not_link macos/bash_mac.sh ~/.bash_mac

  # enable things like alt-b to move back a word system-wide
  mkdir -p ~/Library/KeyBindings
  ln_if_not_link macos/system_wide_emacs_movement.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
fi
#OS_NAME=$(grep '^NAME=' /etc/os-release)
#if [[ "$OS_NAME" == "NAME=NixOS" ]]; then
#  # TODO: link ~/dotfiles/nixos to /etc/nixos instead? can I?
#  echo you need to do something like
#  echo ln -s "$DOTFILES"/nixos/configuration.nix /etc/nixos/configuration.nix
#  echo ln -s "$DOTFILES"/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
#fi

