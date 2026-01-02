#!/usr/bin/env bash

DOTFILES=~/dotfiles

echo "hopefully you read the source code of the script you're about to run"
sleep 3

BACKUP_DIR="$DOTFILES"/.linked_over_files_backup

# if the last argument is already a symlink, do nothing
# if the last argument is a file, move it to $BACKUP_DIR 
# finally, link (ln -s) the second-last arg to the last
ln_if_not_link() {
  if [ -L "${@: -1}" ]; then
    return 1
  fi
  if [ -f "${@: -1}" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "${@: -1}" "$BACKUP_DIR"/"$(basename "${@: -1}")"
  fi
  echo ln -s "$DOTFILES"/"${@: -2:1}"  "${@: -1}"
  ln -s "$DOTFILES"/"${@: -2:1}"  "${@: -1}"
}

# if the last argument exists and is not a symlink, 
# pass all arguments to an "rm" command
rm_if_normal_file() {
  if [ -f "${@: -1}" ]; then
    sudo rm "$@"
  fi
}

ln_if_not_link bashrc.sh ~/.bashrc     > /dev/null 2>&1;
ln_if_not_link gitconfig ~/.gitconfig  > /dev/null 2>&1;
ln_if_not_link gitignore ~/.gitignore  > /dev/null 2>&1;
ln_if_not_link wgetrc    ~/.wgetrc     > /dev/null 2>&1;
ln_if_not_link inputrc   ~/.inputrc    > /dev/null 2>&1;

ln_if_not_link ideavimrc ~/.ideavimrc

ln_if_not_link tmux.conf ~/.tmux.conf
ln_if_not_link tmux      ~/.tmux

# TODO: do this idempotently and safely
# TODO: should I remove untracked files with git checkout -- ./config
# should probably prompt on that...
# Avoid getting into an incosistent state if you can't copy something from the existing ~/.config
# because it already exists in ~/dotfiles/config
if [[ ! -L ~/.config ]]; then
  cp ~/.config/* "$DOTFILES"/config
  ln -s "$DOTFILES"/config ~/.config
fi

# It's in ~/dotfiles/config/nvim/init.vim
rm_if_normal_file ~/.nvimrc               > /dev/null 2>&1;
rm_if_normal_file ~/.nvim                 > /dev/null 2>&1;

# macOS specific
if [ "$(uname)" = "Darwin" ]; then
  # Terminal.app doesn't read .bashrc, but .profile works
  echo >> ~/.profile
  echo 'source ~/.bashrc' >> ~/.profile
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

