#!/usr/bin/env bash

if amixer get Capture | grep -q "\[on\]"; then
    amixer set Capture nocap >/dev/null
    notify-send "Microphone Muted" "Capture disabled" -i "dialog-information"
else
    amixer set Capture cap >/dev/null
    notify-send "Microphone Unmuted" "Capture enabled" -i "dialog-information"
fi
