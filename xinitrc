#!/usr/bin/env bash

xrdb -merge ~/.Xresources

# use dvorak as a fall back to dvorak-programmer layout
setxkbmap -layout us -variant dvorak
setxkbmap -layout us -variant dvp
# remap caps to esc
setxkbmap -option caps:ctrl_modifier
# swap alt and super, like on mac keyboard
setxkbmap -option altwin:swap_lalt_lwin
# set key repeat rate and delay
xset r rate 200 30

# Disable audible bell
xset -b

# set desktop background to black
xsetroot -solid "#111111"

# hide mouse pointer after a few seconds of non use
# breaks i3 focus bindings, but I don't use those
unclutter -root &

exec i3
