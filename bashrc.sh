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

alias n="$VISUAL --no-wait --alternate-editor='emacs &'"
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
alias fd=fdfind  # installed as fdfind on debian based OSes

# create a list of directories and cd into the last one.
mkd() {
    # in bash, you can refer to "all of the functions arguments" as either $@ or $*
    # $@ means pass each argument on its own
    # $* means pass all arguments as a single argument. Wrap it in quotes to be extra safe.
    mkdir -p "$@"
    cd "${@: -1}" # the last argument
}

alias pip="python -m pip"
# I want to add `import requests` but startup time increase like 10x
alias py="python3.8 -q -i -c 'import random, time, math, statistics, collections, itertools, re, string, argparse, sys, traceback, csv, subprocess, shutil, json, base64, pickle; from pathlib import Path; from urllib.parse import urlparse; from pprint import pprint; from dis import dis; from datetime import datetime, timedelta'"

# serve the current directory to the internet on port 8000
alias http="python -m http.server"

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
alias gb="git branch"
# Show the diff between the latest commit and the current state
alias gd="git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"
# `git di $number` shows the diff between the state `$number` revisions ago and the current state
alias gdi="d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
# Make a commit, showing a full diff for all changes
alias gc="git commit -v"
alias ga="git add"
# Commit all changes
alias gca="git add -A && git commit -av"
# pull changes to local checkout of fork from upstream
alias gu="git pull upstream master --rebase"
# defined in dotfiles/gitconfig
alias gp="git p" # push
alias gpl="git pl" # pull
alias gpll="git pull"
alias gcl="git clone"
alias amend="git amend" # commit --amend
alias gsu="git pull && git submodule update --recursive --remote" # pull current repo and all submodules


gau() {
    echo git remote add upstream git://github.com/$1.git
    git remote add upstream git://github.com/$1.git
}

# Commands with options
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
alias browser="google-chrome"
# use chrome headless as curl
alias churl="browser --headless --dump-dom"

# Copy tmux buffer into system clipboard
alias tmcp="tmux show-buffer | pbcopy"

# make a file executable
alias chmox="chmod +x"

# open files with gui apps on Linux
alias open=xdg-open

# alert for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# delete useless python interpreter artifacts
# TODO: I think the .py[co] part might not be necessary, and all those files are in __pycache__
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

# Updating
pipall() {  # all pip packages. https://github.com/pypa/pip/issues/59
    pip3 install --upgrade pip
    pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
# system wide update
update() {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoclean
    sudo apt-get dist-upgrade
    sudo apt-get autoclean
    sudo apt autoremove
    sudo pip3 install --upgrade pip
    sudo pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip3 install -U
    doom refresh && doom upgrade
}
alias upgrade=update

alias reinstall_doom="rm -rf ~/.emacs.d/ && git clone https://github.com/hlissner/doom-emacs ~/.emacs.d && ~/.emacs.d/bin/doom install"


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

# press ctrl-d when you want to stop timing
alias stopwatch="echo press Ctrl-c to stop the timer.; TIMEFORMAT=%R; time cat; unset TIMEFORMAT"

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
PATH=$PATH:/snap/bin

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

export RIPGREP_CONFIG_PATH=~/.config/ripgrep.conf

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

# Switch between dvorak (default) and qwerty. Useful because everyone designs keyboard shortcuts for QWERTY
alias keyboard_options="setxkbmap -option caps:escape -option altwin:swap_alt_win; xset r rate 180 30"
alias aoeu="setxkbmap -layout us,ru,us -variant dvp,,; keyboard_options"
# alias aoeuu="setxkbmap -layout ru; keyboard_options"
# alias фыва="setxkbmap -layout us -variant dvp; keyboard_options"
# alias asdf="setxkbmap -layout us -variant dvp; keyboard_options"

alias yayc='yay -Sc'    # clean pacman
alias yayo='yay -Qtdq'  # orphaned packages

alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'

function _os {
  case $OSTYPE in
    linux*) if   [[ -f /etc/arch-release   ]]; then echo arch
            elif [[ -f /etc/debian_version ]]; then echo debian
            fi ;;
    darwin*) echo macos ;;
  esac
}

function _is_callable {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null || return 1
  done
}

# Clipboard pipes
if _is_callable xclip; then
  alias y='xclip -selection clipboard -in'
  alias p='xclip -selection clipboard -out'
elif _is_callable xsel; then
  alias y='xsel -i --clipboard'
  alias p='xsel -o --clipboard'
elif _is_callable pbcopy; then
  alias y='pbcopy'
  alias p='pbpaste'
fi

# macOS specific aliases
if [[ $(uname) == "Darwin" ]] && [[ -f ~/.bash_mac ]]; then
    . ~/.bash_mac
fi

# local config file not tracked by git
if [[ -f ~/.bash_local ]]; then
    . ~/.bash_local
fi
