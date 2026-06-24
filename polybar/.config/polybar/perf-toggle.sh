#!/usr/bin/env bash

current=$(powerprofilesctl get)

case "$current" in
    power-saver)
        next="balanced"
        label="Balanced"
        icon="󰗑"
        urgency="low"
        ;;
    balanced)
        next="performance"
        label="Performance"
        icon="󱐌"
        urgency="normal"
        ;;
    performance)
        next="power-saver"
        label="Power Saver"
        icon="󰌪"
        urgency="low"
        ;;
esac

powerprofilesctl set "$next"

notify-send -u "$urgency" -a "Power Profile" "$icon  $label" "CPU mode switched to $label"
