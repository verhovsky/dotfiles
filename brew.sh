# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
# add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew install moreutils # some other useful utilities like `sponge`
brew install findutils # `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install whois # handles ipv6 correctly
brew install gnu-sed --with-default-names # GNU `sed`, overwrites the built-in `sed`
brew install openssh # overwrites builtin ssh
brew install gcc
brew install wget # download files

brew install python3
pip3 install ipython requests
pip3 install sh flask pillow neovim numpy ipython hy

#brew install binwalk # Reverse engineering firmware
#brew install fcrackzip # Brute force zip files
#brew install foremost # Data carving
#brew install hashpump # Hash length extension attack
#brew install john # bruteforce passwords
#brew install knock # port-knocking server
brew install nmap # scan networks for computers and what those computers are
#brew install pngcheck
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace # tcp dump file analysis
#brew install ucspi-tcp # `tcpserver` et al.

brew install youtube-dl # download videos from the internet
brew install tmux # a terminal multiplexer
brew install neovim

brew install pt # search file contents
brew install node # installs `npm` too
brew install redis # a database
brew install tree # like recursive `ls`, prints all files in all directories in current directory
brew install pass # a command line password manager
brew install rg # searching for strings

brew install exiv2 # used to change exif data

brew install git
brew install hub # for working with github


brew install bfontaine/utils/rfc # read RFCs

brew install trash # use macOS Trash instead of rm

brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid

# apps
brew cask install google-chrome
brew cask install android-file-transfer
brew cask install mpv
brew cask install qlmarkdown
brew cask install wireshark
# screen saver from apple tv http://benjaminmayo.co.uk/watch-all-the-apple-tv-aerial-video-screensavers
brew cask install aerial

# mpv
brew install mpv
brew linkapps

brew install urbit

# Remove outdated versions from the cellar
brew cleanup
