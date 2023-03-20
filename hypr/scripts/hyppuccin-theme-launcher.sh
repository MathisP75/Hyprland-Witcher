#!/bin/sh
pkill waybar
pkill hyprpaper

m=$(printenv LAPTOP)

if [ $m = 1 ]; then
    hyprpaper -c .config/hypr/hyprpaper/hyprpaper-laptop.conf &
    sleep 2 & waybar --config .config/waybar/laptop-bar/config --style .config/waybar/laptop-bar/style.css
    cd ~/.config/eww/windows && sed 's/:monitor [0-9]/:monitor 0/' overview-generic.yuck > overview.yuck
else
    hyprpaper -c .config/hypr/hyprpaper/hyprpaper-desktop.conf &
    sleep 2 & waybar --config .config/waybar/desktop-bar/config --style .config/waybar/desktop-bar/style.css
    cd ~/.config/eww/windows && sed 's/:monitor [0-9]/:monitor 1/' overview-generic.yuck > overview.yuck
fi
