#!/bin/bash
dir="$HOME/.config/rofi/launchers/type-6"
theme='style-1'

### Run
#rofi \
#    -show drun \
#    -theme ${dir}/${theme}.rasi
selection=$(fd . --hidden --type file $HOME 2>/dev/null | \
    sed "s;$HOME;~;" | \
    rofi -sort -sorting-method fzf -disable-history -dmenu -theme ${dir}/${theme}.rasi -no-custom -p "" | \
    sed "s;\~;$HOME;"
)

xdg-open "$selection"
