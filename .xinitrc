#!/bin/sh

xrdb -merge $HOME/.Xresources
if [ -d ~/.wallpape ] && [ -n "`ls ~/.wallpape`" ]; then
    feh --bg-scale "$HOME/.wallpape/$(ls ~/.wallpape | sort -R | head -n 1)" &
fi
exec wmii
