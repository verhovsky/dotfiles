# Upgrade any already-installed formulae
brew upgrade

brew install bash
# sudo nano /etc/shells
# /opt/homebrew/bin/bash
# sudo chsh -s /opt/homebrew/bin/bash

brew install git

# GNU core utilities (those that come with OS X are outdated)
# add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew install findutils # `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install whois # handles ipv6 correctly
brew install gnu-sed --with-default-names # GNU `sed`, overwrites the built-in `sed`
brew install openssh # overwrites builtin ssh
brew install openssl
brew install gcc
brew install wget # download files

brew install python # install python3
brew postinstall python # when building from source, brew doesn't link pip
pip install requests

#brew install binwalk # Reverse engineering firmware
#brew install fcrackzip # Brute force zip files
#brew install foremost # Data carving
#brew install hashpump # Hash length extension attack
#brew install john # bruteforce passwords
#brew install knock # port-knocking server
#brew install nmap # scan networks for computers and what those computers are
#brew install pngcheck
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace # tcp dump file analysis
#brew install ucspi-tcp # `tcpserver` et al.
#brew install aircrack-ng # not very useful, use macOS's builtin wifi scanner

brew install neovim # text editor
brew install yt-dlp # download videos from the internet
brew install tmux # terminal multiplexer

# also an editor, the app version of it.
brew tap d12frosted/emacs-plus
brew install --cask emacs-plus@30
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
brew install --cask font-sf-mono

brew install rg # faster grep. searching for strings
brew install fd # faster find
brew install tree # like recursive `ls`, prints all files in all directories in current directory

brew install unrar # unpack .rar files

brew install imagemagick # work with image files
brew install sqlite # a database

brew install htop # view cpu and memory usage
brew install readline

brew install node # installs `npm` too

brew install zig
brew install rust # the programming language

brew install exiv2 # used to change exif data
brew install exiftool # used to change exif data


# work with videos
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid

# apps
brew install --cask google-chrome
brew install --cask wireshark # analyse network traffic

# Remove outdated versions from the cellar
brew cleanup
