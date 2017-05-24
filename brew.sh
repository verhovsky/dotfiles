# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Check for any problems
brew doctor

# Upgrade any already-installed formulae
brew upgrade


# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names
# Install `OpenSSH`, overwriting the built-in `ssh`
brew install openssh
brew install gcc # a compiler
brew install wget # download files
brew install youtube-dl # download youtube videos
brew install tmux # a terminal multiplexer

brew install emacs --with-cocoa --with-gnutls --with-imagemagick

# Install Python
brew install python
brew install python3
pip install nose pyparsing
pip install mechanize requests beautifulsoup4
pip install numpy scipy matplotlib pandas scikit-learn
pip install theano

# Install IPython
pip install ipython

# Crypto Miner
#brew install bfg
# Reverse engineering firware
#brew install binwalk
# Brute force zip files
#brew install fcrackzip
# Data carving
#brew install foremost
# Hash length extension attack
#brew install hashpump
#brew install john # (the Ripper)
# port-knocking server
#brew install knock
brew install nmap
#brew install pngcheck
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
# tcp dump file analysis
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` et al.

brew install ag
#brew install exiv2
brew install git
brew install node # This installs `npm` too using the recommended installation method
brew install redis
#brew install pv
#brew install rename
#brew install rhino
brew install tree

# read RFCs
brew install bfontaine/utils/rfc

brew install urbit # a distributed computing project
brew install trash # use macOS trash instead of rm

brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid

# mpv
brew install mpv
brew linkapps

# Remove outdated versions from the cellar
brew cleanup
