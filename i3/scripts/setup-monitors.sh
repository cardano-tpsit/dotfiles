#!/bin/bash

# Script to automatically configure dual monitors
# Laptop monitor: 1920x1200
# External monitor: 2560x1440

# Find connected monitors
LAPTOP=$(xrandr | grep " connected" | grep -E "eDP|LVDS" | cut -d" " -f1)
# External monitors can be HDMI-1, HDMI-1-1, DP-1, DP-1-1, etc.
EXTERNAL=$(xrandr | grep " connected" | grep -vE "eDP|LVDS" | cut -d" " -f1 | head -n1)

# Debug log
echo "Laptop monitor: $LAPTOP"
echo "External monitor: $EXTERNAL"

# Log all connected outputs for debugging
echo "All connected outputs:"
xrandr | grep " connected"

if [ -n "$EXTERNAL" ]; then
    # External monitor connected - configure dual monitor
    echo "Configuring dual monitor setup..."
    
    # Set external monitor to the right of laptop
    xrandr --output $LAPTOP --mode 1920x1200 --pos 0x0 --rotate normal \
           --output $EXTERNAL --mode 2560x1440 --pos 1920x0 --rotate normal --primary
    
    # Restart polybar after configuration change
    sleep 1
    ~/.config/polybar/launch.sh &
    
    # Notification
    notify-send "Monitor" "Dual monitor configured: $LAPTOP + $EXTERNAL" -i display
else
    # Only laptop monitor
    echo "Configuring single monitor..."
    
    xrandr --output $LAPTOP --mode 1920x1200 --pos 0x0 --rotate normal --primary
    
    # Restart polybar
    sleep 1
    ~/.config/polybar/launch.sh &
    
    # Notification
    notify-send "Monitor" "Single monitor: $LAPTOP" -i display
fi

# Restore wallpaper
nitrogen --restore &

echo "Monitor configuration completed"
