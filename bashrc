# Prefer US English and UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL=$EDITOR

# list of 200,000 english words
export WORDLIST="/usr/share/dict/words"

# The PS1 is the string bash prints after it finishes running a command
# \w means the full path of current working directory
PS1="\w )( "

# create a list of directories and cd into the last one.
mkd() {
    # in bash, you can refer to "all of the functions arguments" as either $@ or $*
    # $@ means pass each argument on its own
    # $* means pass all arguments as a single argument. Wrap it in quotes to be extra safe.
    mkdir -p $@
    cd ${@: -1} # the last argument
}
alias e="ls"
alias ee="ls -alhv"
alias u="cd"
alias uu="cd ../"
alias uuu="cd ../.."
alias uuuu="cd ../../.."
alias uuuuu="cd ../../../.."
alias n=$EDITOR
alias h="history"
alias t="trash"
alias tt="rm -rf"
# for when you actually want to delete a file
# (as long as you don't have an unencrypted ssd and aren't using a journaling file system. see `man shred`)
#alias ttt="shred -zn 3 --remove"

alias yt="youtube-dl"

alias d="cd ~/dotfiles"
alias dl="cd ~/Downloads"

alias g="git"
# View abbreviated SHA, description, and history graph of the latest 20 commits
alias gl="git log --pretty=oneline -n 20 --graph --abbrev-commit"
# view abbreviated SHA, description, time since commit, username, and history graph of all commits
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# View the current working tree status using the short format
alias gs="git status -s"
# Show the diff between the latest commit and the current state
alias gd="git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"
# `git di $number` shows the diff between the state `$number` revisions ago and the current state
alias gdi="d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
# Make a commit, showing a full diff for all changes
alias gc="git commit -v"
alias ga="git add"
# Commit all changes
alias gca="git add -A && git commit -av"

alias gp="git p"
alias gpl="git pl"
alias gpll="git pull"
alias gcl="git clone"
alias amend="git amend"

# Commands with options
alias lisp="clisp -q"
# count how many lines of code are in the current directory
alias c="cloc --vcs=git ."
# make a copy of a website for offline viewing
# https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/
alias mirror="wget --mirror --convert-links --adjust-extension --page-requisites --no-parent"
y () {
     yarn $@ --silent --no-emoji
}

# Python
alias py2="ipython2 --no-banner --no-confirm-exit"
alias py3="ipython3 --no-banner --no-confirm-exit"
alias py="py3"

# Open urls from the commandline.
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias safari="open -a Safari"
alias browser="chrome"
alias b="browser"

# Copy tmux buffer into system clipboard
alias tmcp="tmux show-buffer | pbcopy"

# get the day of the year (April 27 2017 is 117)
alias day="python3 -c 'import datetime; print(datetime.datetime.now().timetuple().tm_yday)'"

# Updating
# all pip packages. https://github.com/pypa/pip/issues/59
alias pip2all="pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U; pip2 install --upgrade pip"
alias pip3all="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U; pip3 install --upgrade pip"
alias pipall="pip2all; pip3all"
alias yarnall="yarn self-update; yarn global upgrade"
alias macos-update="sudo softwareupdate -i -a"
alias update="brew upgrade; pipall; macos-update"

# Generate new ssh key as recommended by https://blog.g3rt.nl/upgrade-your-ssh-keys.html
# the `-C ''` prevents storing hostname with ssh key
alias new-ssh-key="ssh-keygen -o -a 100 -t ed25519 -C ''"
# copy my ssh key to macOS clipboard
alias ssh-key="cat ~/.ssh/id_ed25519.pub | pbcopy"

# if you need need a quick source of url-safe random data
alias random_hash="head -c 1024 /dev/urandom | shasum -a 256"

# Ag interprets the second argument as the direcotory to search in, usually my query just has space in it
agg () {
    ag "$*"
}

# is a string a top level domain?
alias is-tld="curl -s https://data.iana.org/TLD/tlds-alpha-by-domain.txt | ag"

# if ssh [ip] works but ssh [hostname] doesn't, this might solve it
# https://stackoverflow.com/a/40754476/3064538
alias fix-dns="sudo killall -HUP mDNSResponder"

# Ring the terminal bell, and put a badge on Terminal.app's Dock icon
alias badge="tput bel"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# cd into the top-most Finder window directory
alias cdf='cd "$(osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)")"'

o() { # with no arguments 'o' opens the current directory, otherwise opens the given location
    open ${1:-.} # if $1 doesn't exist, open "."
}

# Start a server serving the current directory and open that server directory in the browser
# usage: http [port]
http() {
    port=${1:-8484} # default to 8484 if no port name given
    hostname=${2:-$(hostname)} # default to the computer hostname

    browser http://$hostname:$port
    python3 -m http.server $port --bind $hostname
}

# finds a process and kills it
find_kill() {
    kill `ps aux | grep $@ | awk '{print $2}'`
}

pw() { # get full path to current directory or to a specified file in current directory
    if [[ "$#" -eq 0 ]]; then
        pwd
    else
        echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
    fi
}

# enable recursive wildcard
# **/*.arc now matches a.arc b/c.arc d/e/f.arc
shopt -s globstar

# macOS comes with an older version of git in /usr/bin/git. You probably want to
# `brew install git` for the newer version, brew puts a file `git` into
# `/usr/local/bin/git`.
# When you execute a `command` in bash, it checks if that command is a built in function,
# if not it goes through every director in $PATH (left to right) and executes the
# first file with the filename `command` it finds. We want all the files we installed
# ourselves (through homebrew) to be the first ones it looks for.
PATH=/usr/local/bin:$PATH

# macOS comes with a bunch of outdated commands. We want to use
# GNU's versions of these utilities. This might break your system, which is
# why brew doesn't install it in /usr/local/bin and makes you add a separate
# line to your bashrc.
# Most stack overflow answers are written for GNU's coreutils though.
# Concistency across all my systems is a plus too.
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Use the `man` command to learn more about different commands
# This is similar to path, in that if you `man ls` it will show you the
# man page of the brew installed `ls` rather than the one that came with your macos
# see `brew info coreutils`
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

PATH=$PATH:~/Library/Android/sdk/platform-tools/

# cargo is rust's package manager
PATH=$PATH:~/.cargo/bin

# cuda is nvidia's proprietary library for programming their GPUs
# cudnn is an extension to cuda for running neural networks specifically
# one day, when it doesn't cost billions of dollars to develop computing hardware,
# we won't have to use proprietary software to use hardware we own
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
PATH=/usr/local/cuda/bin:$PATH # don't need to export variables that are already defined

# store a list of all the commands I've every issued in bash in ~/.bash_eternal_history
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# https://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# https://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# stop collecting bash history in the current terminal
# useful for copy pasting sensitive data
alias forget="unset HISTFILE"

# If running on Linux, some aliases and functions won't work and should be redefined
if [[ $(uname) == "Linux" ]] && [[ -f ~/.bash_linux ]]; then
    . ~/.bash_linux
fi
# local config file not tracked by git
if [[ -f ~/.bash_local ]]; then
    . ~/.bash_local
fi
