alias t="rm"
alias tt="rm -rf"
alias eu="tmux attach 2>/dev/null; or tmux"
alias p="cd /data/work"
alias x="startx"
alias top="top"
alias t="rm -rf"
alias bat="cat /sys/class/power_supply/BAT0/capacity"

# set python3 as default
alias py="ipython3 --no-banner --no-confirm-exit"
# don't load matplotlib on a headless server
alias spy="ipython3 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T'"
alias spy2="ipython2 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T;'"
alias spy3="ipython3 --no-banner --no-confirm-exit -i -c 'import pandas as pd; import numpy as np; import theano; import theano.tensor as T;'"

# Update all pip packages. https://github.com/pypa/pip/issues/59
# On linux requires root, sudo's -H flag silences an error about directory ownership
alias pipall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U"
alias pip2all="pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip2 install -U"
alias pip3all="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip3 install -U"

# system wide update
alias update="pip2all; pip3all; sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""



function pandas -d "python prompt with pandas"
  if test (count $argv) = 0
    ipython3 --no-banner --no-confirm-exit -ic "import pandas as pd; pd.set_option('display.width', 270)"
  else
    ipython3 --no-banner --no-confirm-exit -ic "import pandas as pd; pd.set_option('display.width', 270); df = pd.  read_csv('$argv'); df.head();"
  end
end

# go
set -e GOROOT


# CUDA for programming the GPU
set -gx PATH $PATH /usr/local/cuda/bin
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/lib64
