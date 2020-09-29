## Installation

### on NixOS

``` sh
git clone https://github.com/verhovsky/dotfiles.git ~/dotfiles
```

Symlink `configuration.nix` to `/etc/nixos/configuration.nix`:

``` sh
sudo chown -R $USER:users /etc/nixos
rm /etc/nixos/configuration.nix
ln -s ~/dotfiles/configuration.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch
```

then

``` sh
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

### on Debian (or Ubuntu)

``` sh
wget -q -O - https://raw.githubusercontent.com/verhovsky/dotfiles/master/install/debian.sh | bash
```
