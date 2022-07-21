#!/bin/bash

# yabai -m space --focus $(yabai -m query --displays --display | jq --arg SPACE $(($1 - 1)) '.spaces[$SPACE|tonumber]')
# $(yabai -m window $(yabai -m query --windows --window | jq -re ".id") --close)