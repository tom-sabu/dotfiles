#!/usr/bin/env bash
# Outputs a colored label for the current power profile
# Used by polybar custom/script module

current=$(powerprofilesctl get)

case "$current" in
    performance)
        # peach - matches CPU module color
        echo "%{F#f5a97f}󱐌 PERF%{F-}"
        ;;
    balanced)
        # blue - matches focused workspace color
        echo "%{F#8aadf4}󰗑 BAL%{F-}"
        ;;
    power-saver)
        # green - matches memory module color
        echo "%{F#a6da95}󰌪 SAVE%{F-}"
        ;;
    *)
        echo "%{F#8087a2} UNKN%{F-}"
        ;;
esac
