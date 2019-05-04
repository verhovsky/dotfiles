#!/usr/bin/env bash

xrdb -merge ~/.Xresources

# use the Dvorak-programmer layout
setxkbmap -layout us -variant dvp
# remap caps to esc
setxkbmap -option caps:escape
# swap alt and super, like on mac keyboard
setxkbmap -option altwin:swap_alt_win
# set key repeat rate and delay
xset r rate 200 30

# Disable audible bell
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
