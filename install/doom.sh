#!/usr/bin/env bash
set -euo pipefail

if [ ! -f /.dockerenv ]; then
    echo "not in container, exiting" >&2
    exit 1
fi

# docker exec -it dev bash ~/install-doom.sh

########## everything else should be in the container ##########

# rg
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb \
    && sudo dpkg -i ripgrep_11.0.2_amd64.deb \
    && rm ripgrep_11.0.2_amd64.deb
# fd
# https://github.com/sharkdp/fd/releases
curl -LO https://github.com/sharkdp/fd/releases/download/v8.1.1/fd-musl_8.1.1_amd64.deb \
    && sudo dpkg -i fd-musl_8.1.1_amd64.deb \
    && rm fd-musl_8.1.1_amd64.deb

sudo add-apt-repository --yes ppa:kelleyk/emacs \
    && sudo apt-get --yes update \
    && sudo apt install --yes emacs26

rm /usr/bin/emacs
ln -s /usr/bin/emacs26 /usr/bin/emacs

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
# Don't ask me if I'm okay with installing Doom as root
~/.emacs.d/bin/doom --yes install

# Install the font I use
sudo wget --content-disposition -P /usr/share/fonts/opentype/source-code-pro https://github.com/adobe-fonts/source-code-pro/blob/482adcaccf9777f2850974e08c60e706b1ad9169/OTF/SourceCodePro-{Black,BlackIt,Bold,BoldIt,ExtraLight,ExtraLightIt,It,Light,LightIt,Medium,MediumIt,Regular,Semibold,SemiboldIt}.otf?raw=true


~/.emacs.d/bin/doom --yes doctor
echo still need to M-x lsp-install-server
