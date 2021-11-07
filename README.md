## Install on Debian (or Ubuntu)

```sh
wget -q -O - https://raw.githubusercontent.com/verhovsky/dotfiles/master/install/debian.sh | bash
```

## Install on other platforms

```sh
ssh-keygen -o -a 100 -t ed25519 -C ''
open https://github.com/settings/ssh/new  # add the key
git clone git@github.com:verhovsky/dotfiles.git ~/dotfiles
```

Then the next steps depend on the operating system you're installing on:

### macOS

```sh
cat ~/dotfiles/symlink.sh
~/dotfiles/symlink.sh
```

Then manually finish the installation:

```sh
brew install --cask programmer-dvorak
```

### NixOS

Symlink `configuration.nix` to `/etc/nixos/configuration.nix`:

```sh
sudo chown -R $USER:users /etc/nixos
rm /etc/nixos/configuration.nix
ln -s ~/dotfiles/configuration.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch
```

then

```sh
cat ~/dotfiles/symlink.sh
~/dotfiles/symlink.sh
```

Then (in a new terminal window) manually finish the installation:

- install [doom emacs](https://github.com/hlissner/doom-emacs)
  - `git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d`
  - `doom install`
- `xrandr --output DP-0 --mode 2560x1440 -r 143.86` to enable 144Hz refresh rate on monitor. You have to 
specify the resolution (the `--mode`) in order for it to work.
- configure Chrome fonts
- configure the keyboard again in the Desktop Environment (for KDE at least)

## Bare minimum

```sh
vim ~/.bashrc
```

and paste these lines:

```sh
alias e="ls -t --color=auto --group-directories-first"
alias ee="ls -talhv --group-directories-first"
alias u="cd"
alias uu="cd ../"
alias uuu="cd ../.."
alias uuuu="cd ../../.."
alias uuuuu="cd ../../../.."
```
