# -------------
# Try to get close to normal colors in tmux
# -------------
set -g default-terminal "screen-256color"

# -------------
# status line
# -------------
set-option -g status-position top
set -g status-justify left
# status bar refresh-rate in seconds
set -g status-interval 1

# -------------
# window status
# -------------
setw -g window-status-format " #W "
setw -g window-status-current-format " #W "

# -------------
# colors
# -------------
# default statusbar colors
set-option -g status-style fg=white,bg=black  # white is actually grey, colour255 is white

# default window title colors
set-window-option -g window-status-style fg=colour246,bg=black  # gray
# active window title colors
set-window-option -g window-status-current-style fg=black,bg=white

# pane border
set-option -g pane-border-style fg=black
set-option -g pane-active-border-style fg=brightgreen

# message text
set-option -g message-style fg=black,bg=white

# Solarized colours for future reference
# SOLARIZED TERMCOL  XTERM
# --------- -------  -----
# base03    brblack  234
# base02    black    235
# base01    brgreen  240
# base00    bryellow 241
# base0     brblue   244
# base1     brcyan   245
# base2     white    254
# base3     brwhite  230
# yellow    yellow   136
# orange    brred    166
# red       red      124
# magenta   magenta  125
# violet    brmagenta 61
# blue      blue      33
# cyan      cyan      37
# green     green     64


# -------------
# Info on left (no session display)
# -------------
set -g status-left ''
set -g status-right-length 150
#set -g status-right " #(bash ~/.tmux/scripts/decimal_time.sh)  #(bash ~/.tmux/scripts/age.sh) "
set -g status-right " #(bash ~/.tmux/scripts/decimal_time.sh)   #(date --iso-8601)   %a %b %d %R " # Fri Jun 19 08:32
