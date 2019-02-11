# Prefer US English and UTF-8
set -g LC_ALL "en_US.UTF-8"
set -g LANG "en_US.UTF-8"

# Set nvim as the default editor
set -g EDITOR "nvim"
set -g VISUAL $EDITOR

# list of 200,000 english words
set -g WORDLIST "/usr/share/dict/words"

set fish_greeting

alias e="ls -v" # -v sorts by numbers in filenames instead of alphabetically
alias ee="ls -alhv"
alias u="cd"
alias uu="cd .."
alias uuu="cd ../.."
alias uuuu="cd ../../.."
alias uuuuu="cd ../../../.."
# Shortcuts
function a
  eval sudo $history[1]
end
alias n=$EDITOR
alias nn="cd ~/dotfiles; $EDITOR config/nvim/init.vim"
alias d="cd ~/dotfiles; $EDITOR config/fish/config.fish"
alias p="cd ~/Documents"
alias t="trash"
alias i="python3"
alias py="ipython --no-banner --no-confirm-exit -i"
alias spy="ipython --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias py2="ipython2 --no-banner --no-confirm-exit -i"
alias spy2="ipython2 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias py3="ipython3 --no-banner --no-confirm-exit -i"
alias spy3="ipython3 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; from matplotlib import pyplot as plt; import seaborn as sns; sns.set()'"
alias c="cloc ."
alias chrome="open -a /Applications/Google\ Chrome\ Canary.app"
alias d="cd ~/dotfiles"
alias dl="cd ~/Downloads"
alias p="cd ~/Documents"

function a
  eval sudo $history[1]
end
alias h="history"
alias t="trash"
alias i="python3"
alias n=$EDITOR

alias g="git"
# View abbreviated SHA, description, and history graph of the latest 20 commits
alias gl="git log --pretty=oneline -n 20 --graph --abbrev-commit"
# view abbreviated SHA, description, time since commit, username, and history graph of all commits
# alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# View the current working tree status using the short format
alias gs="git status -s"
# Show the diff between the latest commit and the current state
alias gd="git diff-index --quiet HEAD -- ;or clear; git --no-pager diff --patch-with-stat"
# `git di $number` shows the diff between the state `$number` revisions ago and the current state
# alias gdi="d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
# Make a commit, showing a full diff for all changes
alias gc="git commit -v"
alias ga="git add"
# Commit all changes
alias gca="git add -A ;and git commit -av"

alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"
alias amend="git amend"

# Commands with options
alias lisp="clisp -q"
alias chrome="open -a /Applications/Chromium.app"
alias news="newsbeuter -q"
alias octave="octave -q"
alias top="top -o mem"

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

# Get OS X Software Updates, and update installed Homebrew and npm packages
# alias update='sudo softwareupdate -l; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g;'
alias update="brew update; brew upgrade --all; brew linkapps; brew cleanup; sudo softwareupdate -i -a; pip2all; pip3all"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

function mkd -d "create one or more directories and cd into the last one"
  command mkdir $argv
  cd $argv[(count $argv)]
end

# Change working directory to the top-most Finder window location
alias cdf="cd (osascript -e 'tell app \"Finder\" to POSIX path of (insertion location as alias)')"

function o -d "with no arguments 'o' opens the current directory, otherwise opens the given location"
  if [ (count $argv) = 0 ]
    open .
  else
    open $argv
  end
end

# Start a server serving the current directory and open that server directory in chrome
# argv is the port. By default uses port 8000
function http -d "serve current directory to the intranet"
  if [ (count $argv) = 0 ]
    chrome http://localhost:8000
  else
    chrome http://localhost:$argv
  end
  python -m SimpleHTTPServer $argv
end

function pw -d "get full path to current directory or to a specified file in current directory"
  if [ (count $argv) = 0 ]
    pwd
  else
    echo (pwd)/$argv
  end
end

# If running on Linux, some aliases and functions won't work and should be redefined
if [ (uname) = "Linux" ]
  . ~/.config/fish/linux_specific.fish
end
# local config file not tracked by git
if test -e ~/.config/fish/local.fish
  . ~/.config/fish/local.fish
end
