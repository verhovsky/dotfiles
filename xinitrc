#!/usr/bin/env bash

xrdb -merge ~/.Xresources

# Dvorak-programmer layout ЙЦУКЕН and QWERTY
setxkbmap -layout "us,ru,us" -variant "dvp,,"
# press both Shift keys to change the keyboard layout
setxkbmap -option grp:shifts_toggle
# remap caps to esc
setxkbmap -option caps:escape
# swap alt and super, like on mac keyboard
setxkbmap -option altwin:swap_alt_win

# set keyboard key repeat delay (180ms) and rate
# (key is repeated once for every 30ms it's held down)
xset r rate 180 30


# disable audible bell
xset -b

# set desktop background to black
xsetroot -solid "#111111"

xrandr --output DP-0 --rotate left
xrandr --output DP-0 --left-of DVI-I-1
#xrandr --output DP-0 --rotate normal

# hide mouse pointer after a few seconds of non use
# breaks i3 focus bindings, but I don't use those
unclutter -root &

exec i3
