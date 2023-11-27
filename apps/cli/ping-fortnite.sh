#!/bin/bash

ping_output=$(ping ping-eu.ds.on.epicgames.com -c 4)
ping=$(echo "$ping_output" | grep -oP 'time=\K\d+' | tail -1)


TOKEN="$TELEGRAM_TOKEN"
CHAT_ID="1551732857"
MESSAGE="Ping = $ping; 🎮 Let's play 🎊"

LOG_FILE="/tmp/ping.txt"

if [ "$ping" -gt 120 ]; then
    [ -f "$LOG_FILE" ] && rm "$LOG_FILE"
else
    if [ ! -f "$LOG_FILE" ]; then
        echo "$MESSAGE" >> "$LOG_FILE"
        if [ "$ping" -lt 120 ]; then
            curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE" > /dev/null
        fi
    fi
fi
