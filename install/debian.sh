#!/usr/bin/env bash

# first upgrade Ubuntu
#     sudo nano /etc/update-manager/release-upgrades
#         change Prompt=lts to Prompt=normal
#     sudo apt update
#     sudo apt upgrade
#     do-release-upgrade
# change the logged in user's password
#     passwd
# reconfigure login screen password
#     sudo dpkg-reconfigure keyboard-configuration
# change locale to en_US.UTF-8

echo first make the current user a sudoer by doing
echo su -
echo "adduser <username> sudo"

# don't ask the current user for the sudo password ever again
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$USER-for-password 1>/dev/null

# update
sudo apt -y update
sudo apt -y upgrade
sudo apt -y full-upgrade
sudo apt -y autoremove

# add google-chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# make `apt install git` install the latest version of git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update

software=(
    git
    i3
    compton # I use picom instead
    xsel # access the clipboard from the terminal. xclip is really similar
    gnome-tweaks # customize which fonts Ubuntu uses
    irssi # IRC chat client
    curl  # download web pages
    snapd # for installing other software that updates automatically
    torsocks
    libssl-dev
    build-essential
    clang
    imagemagick # manipulate photos from command line
    pass # password manager
    shellcheck # check bash scripts for errors
    tinysshd # control this computer remotely
    whois # see if a URL is available
    dtrx # automatically figure out which decompression command to run
    dos2unix # convert \r\n windows line endings to unix \n
    caffeine # prevent computer from going to sleep
    calibre
    zathura zathura-djvu # read ebooks
    fd-find   # search for files
    cloc # count lines of code
    zip  # compress directories
    zstd # more modern compression library and utility
    #rxvt-unicode # a terminal emulator
    #alacritty    # a terminal emulator
    #kitty        # a terminal emulator
    python3 python3-pip python3-dev
    python3.8 python3.8-dev
    python3-setuptools python3-matplotlib
    nodejs npm
    # $latest_nvidia_driver
    fonts-noto # a font with tons of characters
    pngcrush # compress png files
    trash-cli # like rm -rf but safer. You have to clear the trash from time to time though
    unattended-upgrades # install security updates automatically
)
sudo apt -y install ${software[@]}

sudo snap install gimp       # image editor
sudo snap install discord    # chat
sudo snap install jq         # manipulate json from command line
sudo snap install tree       # show directories in a nice format
# VS Code and Emacs text editors
sudo snap install --classic code    # VS Code, a text editor
sudo snap install --classic emacs   # text editor
sudo snap install --classic ripgrep # search files for some text quickly

# Source Code Pro
# install my second favorite monospace font which is still not part of debian # Dina too
echo "installing the Source Code Pro font"
sudo wget --content-disposition -P /usr/share/fonts/opentype/source-code-pro https://github.com/adobe-fonts/source-code-pro/blob/482adcaccf9777f2850974e08c60e706b1ad9169/OTF/SourceCodePro-{Black,BlackIt,Bold,BoldIt,ExtraLight,ExtraLightIt,It,Light,LightIt,Medium,MediumIt,Regular,Semibold,SemiboldIt}.otf?raw=true
fc-cache -f -v # update font cache

# just a list of fonts I like
# sudo apt install fonts-ibm-plex fonts-roboto fonts-inconsolata fonts-hack fonts-firacode
# fonts I don't like as much
# sudo apt install fonts-dejavu fonts-open-sans fonts-go

sudo pip3 install requests black youtube-dl python-dateutil

# install rust nightly
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ripgrep mdbook rls pijul
# optionally install rust-analyzer
#     https://github.com/rust-analyzer/rust-analyzer

echo "generating ssh key"
ssh-keygen -o -a 100 -t ed25519 -C ''
echo
echo "add the key you just generated, ~/.ssh/id_ed25519.pub to GitHub keys"
echo "and then hit enter"
cat ~/.ssh/id_ed25519.pub
google-chrome https://github.com/settings/keys &
read

echo "Cloning dotfiles repo"
git clone git@github.com:verhovsky/dotfiles.git ~/dotfiles
echo "Installing config files from my dotfiles into the home directory"
bash ~/dotfiles/symlink.sh

echo "Installing Doom Emacs"
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
# saving the environment variables from this shell doesn't seem great, so don't generate an env file
~/.emacs.d/bin/doom install -y --no-env

# set the latest version of python as the default python3
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2

# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2

# sudo apt-mark hold python

# Configure custom system default fonts
# gsettings set org.gnome.desktop.interface document-font-name 'Sans 10'
# gsettings set org.gnome.desktop.interface font-name 'Ubuntu 10'
# gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 11'
# gsettings set org.gnome.nautilus.desktop font 'Ubuntu 10'
# gconftool --set /apps/metacity/general/titlebar_font 'Ubuntu Bold 10' --type STRING

# TODO: install VS Code settings
# TODO: VS Code always add trailing newline
# TODO: fix .Xresources
# TODO: set gnome-terminal theme to white and font
# TODO: set chromium Gmail to open mailto: links
# TODO: set chromium fonts (Noto and Noto Mono)
# TODO: add `"detachKeys": "ctrl-e,e"` to ~/.docker/config.json
# TODO: up the number of inotify watches
# https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc
# TODO: enable and configure unattended-upgrades
# sudo dpkg-reconfigure --priority=low unattended-upgrades
# /etc/apt/apt.conf.d/50unattended-upgrades
# TODO: install picom
# https://github.com/yshui/picom#build
