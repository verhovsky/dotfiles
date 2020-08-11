#!/usr/bin/env bash


alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias c="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --remote-debugging-port=9222" # a bit dangerous
alias safari="open -a Safari"

alias macos-update="sudo softwareupdate -i -a"
pipall() {  # all pip packages. https://github.com/pypa/pip/issues/59
    # TODO: fix this
    pip3 install --upgrade pip
    pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
update() {
    brew upgrade
    brew cask upgrade
    brew cleanup
    pipall
    doom -y upgrade
    macos-update
}
alias upgrade=update

alias pipi="pip install"
alias brei="brew install"


# TODO: does this still do anything?
# if ssh [ip] works but ssh [hostname] doesn't, this might solve it
# https://stackoverflow.com/a/40754476/3064538
alias fix-dns="sudo killall -HUP mDNSResponder"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# cd into the top-most Finder window directory
alias cdf='cd "$(osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)")"'

# use brew installed software (curl, coreutils, sed, go)
# this also includes coreutils if you do `brew install coreutils`,
# which might be a bad but has worked fine so far
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/curl/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/go/libexec/bin:$PATH"
# use the man pages for the homebrew installed coreutils
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Android SDK
PATH=$PATH:~/Library/Android/sdk/platform-tools

unalias fd
unalias open

o() { # with no arguments 'o' opens the current directory, otherwise opens the given location
    if [[ "$#" -eq 0 ]]; then
        open .
    else
        open "$1"
    fi
}

# Ring the terminal bell, and put a badge on Terminal.app's Dock icon
alias badge="tput bel"
alias internet="ping6 2001:4860:4860::8888"

journal() {
    birthday=19960201 # YYYYMMDD
    days_since_birth=$(echo "( `date -u +%s` - `date -u -d $birthday +%s`) / (24*3600)" | bc)

    mkdir -p ~/Documents/journal/
    $VISUAL ~/Documents/journal/$days_since_birth
}
