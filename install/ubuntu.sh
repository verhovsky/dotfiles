#!/usr/bin/env bash

# don't ask the current user for the sudo password ever again
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$USER-for-password 1>/dev/null

# update
sudo apt -y update
sudo apt -y upgrade
sudo apt -y full-upgrade
sudo apt -y autoremove

echo "installing latest version of nvidia driver..."
sudo ubuntu-drivers --gpgpu install nvidia

# A terminal emulator. The default gnome-terminal is fine too.
sudo add-apt-repository -y ppa:mmstick76/alacritty

software=(
    git
    xsel # access the clipboard from the terminal. xclip is really similar
    gnome-tweaks # customize which fonts Ubuntu uses
    irssi # IRC chat client
    curl  # download web pages
    torsocks
    libssl-dev
    build-essential
    clang
    imagemagick # manipulate photos from command line
    pass # password manager
    shellcheck # check bash scripts for errors
    tinysshd # control this computer remotely
    zstd # compression library and utility
    whois # see if a URL is available
    dtrx # automatically figure out which decompression command to run
    dos2unix # convert \r\n windows line endings to unix \n
    caffeine # prevent computer from going to sleep
    calibre
    zathura zathura-djvu # read ebooks
    cloc # count lines of code
    rxvt-unicode # a terminal emulator
    alacritty    # a terminal emulator
    kitty        # a terminal emulator
    python3 python3-pip python3-dev
    python3-setuptools python3-matplotlib
    python-is python3
    nodejs npm
    fonts-noto # a font with tons of characters
)
sudo apt -y install ${software[@]}


sudo snap install gimp       # image editor
sudo snap install discord    # chat
sudo snap install jq         # manipulate json from command line
sudo snap install tree       # show directories in a nice format
# VS Code and Emacs text editors
sudo snap install --classic code           # VS Code, a text editor
sudo snap install --classic --beta emacs   # text editor
sudo snap install --classic ripgrep        # search files for some text quickly

# Source Code Pro
# install my second favorite monospace font which is still not part of debian # Dina too
echo "installing the Source Code Pro font"
sudo wget --content-disposition -P /usr/share/fonts/opentype/source-code-pro https://github.com/adobe-fonts/source-code-pro/blob/482adcaccf9777f2850974e08c60e706b1ad9169/OTF/SourceCodePro-{Black,BlackIt,Bold,BoldIt,ExtraLight,ExtraLightIt,It,Light,LightIt,Medium,MediumIt,Regular,Semibold,SemiboldIt}.otf?raw=true
fc-cache -f -v # update font cache

# just a list of fonts I like really
# sudo apt install fonts-ibm-plex fonts-roboto fonts-inconsolata fonts-hack fonts-firacode
# sudo apt install fonts-dejavu fonts-open-sans fonts-go # fonts I don't like as much
# I don't like the ubuntu font and removing it makes the disk password prompt look like the TTY
#sudo apt remove fonts-ubuntu

## Programming languages
sudo pip3 install requests black youtube-dl

# install rust nightly
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ripgrep mdbook rls pijul
# optionally install rust-analyzer
#     https://github.com/rust-analyzer/rust-analyzer

echo "Cloning dotfiles repo"
git clone https://github.com/verhovsky/dotfiles ~/dotfiles
echo "Installing config files from my dotfiles into the home directory"
bash ~/dotfiles/symlink.sh
source ~/.bashrc # get the aliases

echo "Installing Doom Emacs"
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
# saving the environment variables from this shell doesn't seem great, so don't generate an env file
~/.emacs.d/bin/doom install -y --no-env

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

echo "generating new ssh key"
new-ssh-key
echo
echo "add the key you just generated, ~/.ssh/id_ed25519.pub to GitHub keys"
echo "copied the following line:"
cat ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub | y
chromium-browser https://github.com/settings/keys &
sleep 1
echo "and don't forget to change the font settings"
sleep 1

