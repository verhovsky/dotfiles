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

# I use a keyboard with 60 keys, which doesn't have room for an Escape.
# the keyboard comes with a modifier key, and the top left button, instead
# of being $ (or ` on QWERTY), acts as Escape and you need to use the
# modifier key to type the original key. Since I remap the Caps Lock to
# Escape, I don't need this and can remap the top left key back to what
# it should be
# Unfortunately this makes it the wrong key on QWERTY, but you can still
# type the correct one with the modifier key
# This doesn't work in Chrome.
xmodmap -e "keycode 9 = dollar asciitilde"

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
