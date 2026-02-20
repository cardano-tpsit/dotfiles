#!/bin/bash

# Script di avvio per i3

# Imposta il compositor per evitare tearing e abilitare trasparenze
if ! pgrep -x "picom" > /dev/null; then
    picom -b --config ~/.config/picom/picom.conf &
fi

# Network Manager applet
if ! pgrep -x "nm-applet" > /dev/null; then
    nm-applet &
fi

# Polkit per permessi elevati
if ! pgrep -x "polkit-kde-authentication-agent-1" > /dev/null; then
    /usr/lib/polkit-kde-authentication-agent-1 &
fi

# Notifiche
if ! pgrep -x "dunst" > /dev/null; then
    dunst &
fi

# Cursore del mouse (previene che scompaia)
xsetroot -cursor_name left_ptr

# Disabilita il beep
xset b off

# Imposta il layout della tastiera (modifica se necessario)
setxkbmap it

# Compositing e anti-aliasing per i font
xrdb -merge ~/.Xresources 2>/dev/null

# Auto-lock dopo 10 minuti di inattività (opzionale)
# xautolock -time 10 -locker "i3lock -c 000000" -detectsleep &

echo "Startup completato"
