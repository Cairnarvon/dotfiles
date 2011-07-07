#!/bin/sh

xrdb -merge $HOME/.Xresources
if [ -d ~/.wallpape ]; then
    feh --bg-scale "$(echo ~)/.wallpape/$(ls ~/.wallpape | sort -R | head -n 1)" &
fi
exec wmii
