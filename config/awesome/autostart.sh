#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

# Load terminal colorscheme and settings
xrdb ~/.Xresources

# Urxvt daemon
run urxvtd -q -o -f

# Enable numlock on login
run numlockx

# Network manager tray icon
run nm-applet

# Keyboard layout
setxkbmap -layout "pt" &

# screen layout
.screenlayout/my-layout.sh

#gnome authentication
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#set vivaldi default browser
xdg-mime default vivaldi-stable.desktop 'x-scheme-handler/https'
xdg-mime default vivaldi-stable.desktop 'x-scheme-handler/http'


#restore wpp and Desktop effects
nitrogen --restore; sleep 1; compton -b --config /home/andre/.config/compton/compton.conf &
disown

#mailspring
run mailspring

#franz
/home/andre/Applications/franz.AppImage &
disown
