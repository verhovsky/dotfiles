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
brew install openssl
brew install gcc
brew install wget # download files

brew install python # install python3
brew postinstall python # when building from source, brew doesn't link pip
brew install numpy --HEAD # this python library has to be installed from homebrew
pip install ipython requests
pip install sh flask pillow ipython hy

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
#brew install aircrack-ng # not very useful, use macOS's builtin wifi scanner

brew install youtube-dl # download videos from the internet
brew install tmux # a terminal multiplexer
brew install neovim # an editor
brew cask install emacs # also an editor, the app version of it.

brew install pt # search file contents
brew install node # installs `npm` too
brew install tree # like recursive `ls`, prints all files in all directories in current directory
brew install pass # a command line password manager
brew install rg # faster grep. searching for strings
brew install unrar # unpack .rar files
brew install tor # hide your ip address when running a command with `torify command`
brew install torsocks # torify command to run it through the onion router
brew install clol # count lines of code, run with 'cloc .'

brew install flac

brew install bash
brew install guile # a scheme (lisp) like programming language
brew install rust # the programming language
brew install redis # a NoSQL database
brew install imagemagick # work with image files
brew install sqlite # a database
brew install xonsh # use python as your shell instead of bash
brew install fish # a different shell with nice completions but slow start up
brew install gpg-agent
brew install readline
brew install htop # view cpu and memory usage


brew install exiv2 # used to change exif data
brew install exiftool # used to change exif data

brew install git
brew install hub # for working with github

brew install tldr # community managed man pages
brew install bfontaine/utils/rfc # read RFCs

brew install trash # use macOS Trash instead of rm

# work with videos
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid

# apps
brew cask install google-chrome
brew cask install android-file-transfer
brew cask install android-studio
brew cask install mpv # watch videos. doesn't display colors properly, but can play files quicktime can't
brew cask install qlmarkdown
brew cask install wireshark # analyse network traffic
brew cask install osxfuse # used for sshfs
brew cask install emacs

# mpv
brew install mpv
brew linkapps

brew install urbit

# Remove outdated versions from the cellar
brew cleanup
