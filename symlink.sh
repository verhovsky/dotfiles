#!/usr/bin/env bash

echo "hopefully you read the source code of the script you're about to run"
echo "because I'm about to delete a bunch of files"
sleep 3

DOTFILES=~/dotfiles
BACKUP_DIRECTORY="$DOTFILES"/.linked_over_files_backup

# if the last argument is not a symlink, move it to a backup directory
# then link (ln -s) the second-last argument to that path instead
ln_if_not_link() {
  mkdir -p "$BACKUP_DIRECTORY"
  if [ ! -L "${@: -1}" ]; then
    sudo mv "${@: -1}" "$BACKUP_DIRECTORY"/"${@: -1}"
    ln -s "$DOTFILES"/"${@: -2}"  ~/"${@: -1}"
  fi
}

backup_if_not_link() {
  if [ ! -L "${@: -1}" ]; then
    # TODO: mkdir -p the parent if arg is a directory
    sudo mv "${@: -1}" "$BACKUP_DIRECTORY"/"${@: -1}"
  fi
}

# if the last argument is a symlink, pass all arguments to an "rm" command
rm_if_not_link() {
  if [ ! -L "${@: -1}" ]; then
    sudo rm "$@"
  fi
}

ln_if_not_link bashrc    ~/.bashrc     > /dev/null 2>&1;
ln_if_not_link gitconfig ~/.gitconfig  > /dev/null 2>&1;
ln_if_not_link gitignore ~/.gitignore  > /dev/null 2>&1;
ln_if_not_link wgetrc    ~/.wgetrc     > /dev/null 2>&1;
ln_if_not_link inputrc   ~/.inputrc    > /dev/null 2>&1;

ln_if_not_link "$DOTFILES_PREFIX"/tmux.conf ~/.tmux.conf
ln_if_not_link "$DOTFILES_PREFIX"/tmux/ ~/.tmux

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
rm_if_not_link ~/.nvimrc               > /dev/null 2>&1;
rm_if_not_link ~/.nvim                 > /dev/null 2>&1;

# macOS specific
if [ "$(uname)" = "Darwin" ]; then
  # Terminal.app doesn't read .bashrc, but .profile works
  echo >> ~/.profile
  echo 'source ~/.bashrc' >> ~/.profile
  ln_if_not_link macos/bash_mac.sh ~/.bash_mac

  # TODO: check if this still has any effect
  mkdir -p ~/Library/KeyBindings
  ln_if_not_link macos/system_wide_emacs_movement.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
fi
