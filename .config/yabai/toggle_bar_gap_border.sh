#!/bin/sh

CURRENT="$(sketchybar --query bar | jq -r '.y_offset')"; 
if [ "$CURRENT" -eq "0" ]; then 
  sketchybar --animate sin 15 --bar margin=10 y_offset=10 corner_radius=9;
  yabai -m config window_border on;
  yabai -m config external_bar all:49:0;
  yabai -m config top_padding 10;
  yabai -m config bottom_padding 10;
  yabai -m config left_padding 10;
  yabai -m config right_padding 10;
  yabai -m config window_gap 8;
else 
  sketchybar --animate sin 15 --bar margin=0 y_offset=0 corner_radius=0; 
  yabai -m config window_border off;
  yabai -m config external_bar all:39:0; 
  yabai -m config top_padding 0;
  yabai -m config bottom_padding 0;
  yabai -m config left_padding 0;
  yabai -m config right_padding 0;
  yabai -m config window_gap 0;
fi 
