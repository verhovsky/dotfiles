# Prefer US English and UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Set emacs as the default editor
export EDITOR="emacs"
export VISUAL=$EDITOR

# list of 200,000 english words
export WORDLIST="/usr/share/dict/words"

# The PS1 is the string bash prints after it finishes running a command
# \w means the full path of current working directory
PS1="(\w) "

e() {
    # if there are no arguments, act like ls
    if [[ ( $# -eq 0 ) ||  ( -d $@ ) ]]; then
        ls -v
    elif [[ -f $@ ]]; then
        $EDITOR $@
    fi
}
# make a directory and cd into it
mkd() {
    mkdir -p $@
    cd ${@: -1}
}
alias ee="ls -alhv"
alias u="cd"
alias uu="cd .."
alias uuu="cd ../.."
alias uuuu="cd ../../.."
alias uuuuu="cd ../../../.."
# Shortcuts
a() {
    sudo !!
}
alias n=$EDITOR
alias p="cd ~/Documents"
alias t="trash"
alias i="python3"
alias py="ipython --no-banner --no-confirm-exit -i"
alias spy="ipython --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias py2="ipython2 --no-banner --no-confirm-exit -i"
alias py3="ipython3 --no-banner --no-confirm-exit -i"
alias yt="youtube-dl"
alias d="cd ~/dotfiles"
alias dl="cd ~/Downloads"
alias p="cd ~/Documents"

alias h="history"
alias t="trash"
alias i="python3"
alias n=$EDITOR
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

alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"
alias amend="git amend"

# Commands with options
alias lisp="clisp -q"
alias news="newsbeuter -q"
# count how many lines of code are in the current directory
alias c="cloc --vcs=git ."
# make a copy of a website for offline viewing
# https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/
alias mirror="wget --mirror --convert-links --adjust-extension --page-requisites --no-parent"

# Open urls from the commandline. 
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias b="chrome-canary"

# Copy tmux buffer into system clipboard
alias tmcp="tmux show-buffer | pbcopy"

# get the day of the year (April 27 2017 is 117)
alias day="python3 -c 'import datetime; print(datetime.datetime.now().timetuple().tm_yday)'"

# Python
alias c='python3 -ic "from math import *"'
# ipython with a few libraries
alias py="ipython --no-banner --no-confirm-exit"
alias spy="ipython --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias py2="ipython2 --no-banner --no-confirm-exit"
alias spy2="ipython2 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias py3="ipython3 --no-banner --no-confirm-exit"
alias spy3="ipython3 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
# Update all pip packages. https://github.com/pypa/pip/issues/59
alias pipall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U; pip install --upgrade pip"
alias pip2all="pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U; pip2 install --upgrade pip"
alias pip3all="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U; pip3 install --upgrade pip"

# Generate new ssh key as recommended by https://blog.g3rt.nl/upgrade-your-ssh-keys.html
# the `-C ''` prevents storing hostname with ssh key
alias new-ssh-key="ssh-keygen -o -a 100 -t ed25519 -C ''"
# copy my ssh key to macOS clipboard
alias ssh-key="cat ~/.ssh/id_ed25519.pub | pbcopy"

# Get OS X Software Updates, and update installed Homebrew and npm packages
# alias update='sudo softwareupdate -l; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g;'
alias update="brew update; brew upgrade; brew cleanup; sudo softwareupdate -i -a; pip2all; pip3all"

# Ag interprets the second argument as the direcotory to search in, usually my query just has space in it
agg () {
    ag "$*"
}

# is a string a top level domain?
alias is-tld="curl -s https://data.iana.org/TLD/tlds-alpha-by-domain.txt | ag"

# if ssh [ip] works but ssh [hostname] doesn't, this might solve it
# http://stackoverflow.com/a/40754476/3064538
alias fix-dns="sudo killall -HUP mDNSResponder"

## macOS utilities
alias chrome="open -a /Applications/Google\ Chrome\ Canary.app"
# preview files
q () {
    qlmanage -p $@ &>/dev/null
}

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
alias badge="tput bel"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# cd into the top-most Finder window directory
alias cdf='cd "$(osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)")"'

o() { # with no arguments 'o' opens the current directory, otherwise opens the given location
    if [[ "$#" -eq 0 ]]; then
        open .
    else
        open $1
    fi
}

# Start a server serving the current directory and open that server directory in chrome
# argv is the port. By default uses port 8000
http() {
    if [[ "$#" -eq 2 ]]; then
        chrome http://$2:$1
        python3 -m http.server $1 --bind $2
    else
        if [[ "$#" -eq 1 ]]; then
            chrome http://127.0.0.1:$1
        else
            chrome http://127.0.0.1:8000
        fi
        python3 -m http.server $1
    fi
}

pandas() { # python prompt with pandas
    if [[ "#$" -eq 0 ]]; then
        ipython3 --no-banner --no-confirm-exit -ic "from pylab import *; import pandas as pd; pd.set_option('display.width', 270)"
    else
        ipython3 --no-banner --no-confirm-exit -ic "from pylab import *; import pandas as pd; pd.set_option('display.width', 270); df = pd.read_csv('$1'); df.head();"
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

# If running on Linux, some aliases and functions won't work and should be redefined
if [[ $(uname) == "Linux" ]] && [[ -f ~/.bash_linux ]]; then
    . ~/.bash_linux
fi
# local config file not tracked by git
if [[ -f ~/.bash_local ]]; then
    . ~/.bash_local
fi

# macOS comes with an older version of git in /usr/bin/git. You probably want to
# `brew install git` for the newer version, brew puts a file `git` into
# `/usr/local/bin/git`.
# When you execute a `command` in bash, it checks if that command is a built in function,
# if not it goes through every director in $PATH (left to right) and executes the 
# first file with the filename `command` it finds. We want all the files we installed
# ourselves (through homebrew) to be the first ones it looks for.
PATH=/usr/local/bin$PATH
PATH=$PATH:~/Library/Android/sdk/platform-tools/

# cargo is rust's package manager
PATH=$PATH:~/.cargo/bin

# cuda is nvidia's proprietary library for programming their GPUs
# cudnn is an extension to cuda for running neural networks specifically
# one day, when it doesn't cost billions of dollars to develop computing hardware,
# we won't have to use proprietary software to use hardware we own
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
PATH=/usr/local/cuda/bin:${PATH} # don't need to export variables that are already defined

# store a list of all the commands I've every issued in bash in ~/.bash_eternal_history
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# stop collecting bash history in the current terminal
# useful for copy pasting sensitive data
alias forget="unset HISTFILE"
