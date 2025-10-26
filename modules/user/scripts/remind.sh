#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <MIN> <MESSAGE>"
    exit 1
fi

MIN=$1
MESSAGE=$2

while true; do
    notify-send "Reminder" "$MESSAGE" -i "dialog-information"
    sleep "${MIN}m"
done
