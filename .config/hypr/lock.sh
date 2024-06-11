#!/usr/bin/env bash
 
FILE="/tmp/ss.png"
grim -g "0,0 1920x1080" $FILE
corrupter $FILE $FILE

hyprlock
