alias n="emacsclient --no-wait --alternate-editor='emacs &'"

# Update all pip packages. https://github.com/pypa/pip/issues/59
# On linux requires root, sudo's -H flag silences an error about directory ownership
alias pipall="sudo pip3 install --upgrade pip; pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip3  install -U"
# system wide update
update() {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoclean
    sudo apt-get dist-upgrade
    sudo apt-get autoclean
    sudo apt autoremove
    pipall
}

# Switch between dvorak (default) and qwerty. Useful because everyone designs keyboard shortcuts for QWERTY
alias keyboard_options="setxkbmap -option caps:escape -option altwin:swap_lalt_lwin; xset r rate 200 30"
alias aoeu="setxkbmap -layout us; keyboard_options"
alias aoeuu="setxkbmap -layout ru; keyboard_options"
alias фыва="setxkbmap -layout us -variant dvp; keyboard_options"
alias asdf="setxkbmap -layout us -variant dvp; keyboard_options"

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
fi
