#!/bin/sh
pkill waybar
pkill hyprpaper

m=$(printenv LAPTOP)

hyprpaper -c .config/hypr/hyprpaper/hyprpaper-witcher.conf &

if [ $m = 1 ]; then
    sleep 2 & waybar --config .config/waybar/witcher-bar-laptop/config --style .config/waybar/witcher-bar-laptop/style.css
    cd ~/.config/eww/windows && sed 's/:monitor [0-9]/:monitor 0/' overview-generic.yuck > overview.yuck
else
    sleep 2 & waybar --config .config/waybar/witcher-bar-desktop2/config --style .config/waybar/witcher-bar-desktop2/style.css
    cd ~/.config/eww/windows && sed 's/:monitor [0-9]/:monitor 1/' overview-generic.yuck > overview.yuck
fi
