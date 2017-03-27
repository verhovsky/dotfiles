# Prefer US English and UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Set emacs as the default editor
export EDITOR="nvim"
export VISUAL=$EDITOR

# list of 200,000 english words
export WORDLIST="/usr/share/dict/words"

PS1="(\w) "

e() {
    if [[ $# -eq 0 ]]; then
        ls -v
    elif [[ -d $1 ]]; then
        cd "$@"
    elif [[ -f $1 ]]; then
        $EDITOR $@
    else
        # create one or more directories and cd into the last one
        # maybe this is a bad idea
        mkdir $@
        cd ${@: -1}
    fi
}
alias ee="ls -alhv"
alias eu="ssh gpu"
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
alias chrome="open -a /Applications/Google\ Chrome.app"
alias news="newsbeuter -q"
alias c="cloc ."
alias x="dtrx" # uncompress file

# Copy tmux buffer into system clipboard
alias tmcp="tmux show-buffer | pbcopy"

# get the day of the year for a given day
alias day="python2 /Users/space/Documents/scripts/day.py"

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

# Generate new ssh key as recommended by
# https://blog.g3rt.nl/upgrade-your-ssh-keys.html
# the `-C ''` prevents storing hostname with ssh key
alias ssh-key="ssh-keygen -o -a 100 -t ed25519 -C ''"

# Get OS X Software Updates, and update installed Homebrew and npm packages
# alias update='sudo softwareupdate -l; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g;'
alias update="brew update; brew upgrade; brew cleanup; sudo softwareupdate -i -a; pip2all; pip3all"

## macOS utilities
alias chrome="open -a /Applications/Google\ Chrome\ Canary.app"
# preview files
q () {
    qlmanage -p $@ &>/dev/null
}

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
alias badge="tput bel"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"

# Change working directory to the top-most Finder window location
# alias cdf="cd `osascript -e tell app \"Finder\" to POSIX path of (insertion location as alias)`"

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
    if [[ "$#" -eq 0 ]]; then
        chrome http://localhost:8000
    else
        chrome http://localhost:$1
    fi
    python -m SimpleHTTPServer $1
}

pandas() { # python prompt with pandas
    if [[ "#$" -eq 0 ]]; then
        ipython3 --no-banner --no-confirm-exit -ic "from pylab import *; import pandas as pd; pd.set_option('display.width', 270)"
    else
        ipython3 --no-banner --no-confirm-exit -ic "from pylab import *; import pandas as pd; pd.set_option('display.width', 270); df = pd.read_csv('$1'); df.head();"
    fi
}


export PATH="$PATH:/usr/local/bin"
export PATH=$PATH:~/Library/Android/sdk/platform-tools/


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
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
PATH=${CUDA_HOME}/bin:${PATH}

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
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
