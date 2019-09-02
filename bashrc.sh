# Prefer US English and UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export EDITOR="emacsclient"
export VISUAL=$EDITOR  # the variable that actually gets used for everything

# list of ~100,000 english words
export WORDLIST="/usr/share/dict/words"

# The PS1 is the string bash prints after it finishes running a command
# \H is the hostname
# \w is the full path of current working directory
# \u is the username
# PS1="\u:\H:\w$ "  # this is Ubuntu's default and I don't mind it

# enable recursive wildcard
# **/*.png will match a.png b/c.png d/e/f.png
shopt -s globstar


alias n="$VISUAL --no-wait --alternate-editor=vim 2>/dev/null"
alias nn="nvim"
alias e="ls -t --color=auto --group-directories-first" # last modified date
alias ee="ls -talhv --group-directories-first"
alias eee="tree -a"
alias eeee="tree"
alias u="cd"
alias uu="cd ../"
alias uuu="cd ../.."
alias uuuu="cd ../../.."
alias uuuuu="cd ../../../.."
alias h="history"
alias x="dtrx" # figure out what tar or unzip command to run
alias t="trash"
alias tt="rm -rf"
# for when you actually want to delete a file
# (as long as you don't have an unencrypted ssd and aren't using a journaling file system. see `man shred`)
#alias ttt="shred -zn 3 --remove"

alias yt="youtube-dl"

# create a list of directories and cd into the last one.
mkd() {
    # in bash, you can refer to "all of the functions arguments" as either $@ or $*
    # $@ means pass each argument on its own
    # $* means pass all arguments as a single argument. Wrap it in quotes to be extra safe.
    mkdir -p "$@"
    cd "${@: -1}" # the last argument
}

alias python="python3"
alias pip="python -m pip"
# I'm tempted to add import requests but startup time increase like 10x
alias py="python3 -q -i -c 'import random, time, datetime, math, collections, itertools, re, string, sys, subprocess, json, base64, pickle; from pathlib import Path; from pprint import pprint'"

# serve the current directory to the internet on port 8000
alias http="python3 -m http.server"

alias psg="pass generate -n -c" # don't use symbols in password manager
alias pss="pass show -c" # copy password to clipboard
alias psi="pass insert"

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
# defined in dotfiles/gitconfig
alias gp="git p" # push
alias gpl="git pl" # pull
alias gpll="git pull"
alias gcl="git clone"
alias amend="git amend" # commit --amend

# Commands with options
# count how many lines of code are in the current git repository
alias cloc="cloc --vcs=git"
# shuf's builtin randomness generator is insecure
alias shuf='shuf --random-source=/dev/urandom'
# make a copy of a website for offline viewing
# https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/
alias mirror="wget --mirror --convert-links --adjust-extension --page-requisites --no-parent"
# transfer a file over ssh and keep partial files that haven't finished transferring if the connection is cut
alias scp="rsync -P -e ssh"

# check if you're connected to the IPv4 internet by pinging google's DNS server
alias four="ping 8.8.8.8"
alias internet="ping 2001:4860:4860::8888"
# another option is sprint's website `ping 2600::`

# Open urls from the commandline.
alias browser="chromium-browser"
alias b="browser"
# use chrome headless as curl
alias churl="browser --headless --dump-dom"

# Copy tmux buffer into system clipboard
alias tmcp="tmux show-buffer | pbcopy"

# make a file executable
alias chmox="chmod +x"

# Updating
pipall() {  # all pip packages. https://github.com/pypa/pip/issues/59
    pip3 install -U `pip3 list --outdated | tail -n +3 | shuf | awk '{print $1}'`
}

# Generate new ssh key as recommended by https://blog.g3rt.nl/upgrade-your-ssh-keys.html
# the `-C ''` prevents storing hostname with the ssh key
alias new-ssh-key="ssh-keygen -o -a 100 -t ed25519 -C ''"
# print main ssh key
alias ssh-key="cat ~/.ssh/id_ed25519.pub"

# if you need need a quick source of url-safe random data
alias random-hash="head -c 1024 /dev/urandom | shasum -a 256"
alias random-base32="head -c 30 /dev/urandom | base32"
alias random-base64="head -c 30 /dev/urandom | base64"
alias random-number="shuf --random-source=/dev/urandom -i 1-1000000000000000000 -n 1"
alias random-letters="cat /dev/urandom | tr -dc 'a-z' | fold -w 32 | head -n 1"
alias correct-battery="curl -s https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt | shuf --random-source=/dev/urandom | head -n 4 | tr '\n' ' '; echo"

random() {
    if [ "$#" -eq 0 ]; then
        shuf -i 0-10000 -n 1 --random-source=/dev/urandom
    fi
    if [ "$#" -eq 1 ]; then
        shuf -i 0-$1 -n 1 --random-source=/dev/urandom
    fi
    if [ "$#" -eq 2 ]; then
        shuf -i $1-$2 -n 1 --random-source=/dev/urandom
    fi
}

# Rg interprets the second argument as the direcotory to search in, usually my query just has space in it
rgg() {
    rg "$*"
}

# is a string a top level domain?
alias is-tld="curl -s https://data.iana.org/TLD/tlds-alpha-by-domain.txt | rg -i"

o() { # with no arguments 'o' opens the current directory, otherwise opens the given location
    if [[ "$#" -eq 0 ]]; then
        xdg-open .
    else
        xdg-open "$1"
    fi
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

export GOPATH=~/go
# use go binaries
PATH=$PATH:$GOPATH/bin
# use rust binaries
PATH=$PATH:~/.cargo/bin
# use doom emacs commands
PATH=$PATH:~/.emacs.d/bin

# store a list of all the commands I've every issued in ~/.bash_eternal_history
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
export HISTCONTROL=ignorespace

journal() {
    birthday=19960201 # YYYYMMDD
    days_since_birth=$(echo "( `date +%s` - `date -d $birthday +%s`) / (24*3600)" | bc)

    # don't get the date twice, in case I call it at midnight on the last day of the year
    current_time=$(date)

    year=$(date --date="$current_time" +%Y)
    day_zero_indexed=$(printf "%0*d\n" 3 $((10#$(date --date="$current_time" +%j)-1)))

    mkdir -p ~/Documents/journal/$year
    $VISUAL ~/Documents/journal/$year/$day_zero_indexed
}
alias j="journal"

# If running on Linux, some aliases and functions won't work and should be redefined
if [[ $(uname) == "Linux" ]] && [[ -f ~/.bashlinux ]]; then
    . ~/.bashlinux
fi
# macOS specific aliases
if [[ $(uname) == "Darwin" ]] && [[ -f ~/.bashmac ]]; then
    . ~/.bashmac
fi

# local config file not tracked by git
if [[ -f ~/.bashlocal ]]; then
    . ~/.bashlocal
fi

