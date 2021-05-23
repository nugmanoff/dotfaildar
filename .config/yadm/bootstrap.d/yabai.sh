#!/bin/bash

set -eu

if brew list yabai >/dev/null; then
    # Check if SIP is disabled
    if csrutil status | grep "System Integrity Protection status: unknown" >/dev/null; then

        sudo yabai --install-sa
        sudo yabai --load-sa
        brew services start skhd
        brew services start yabai

        echo "yabai ✅"
    
    else
        echo "Please disable SIP before continuing (https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)"
        echo "Or if you want to keep SIP enabled, remove this script file ('rm $HOME/.config/yadm/bootstrap.d/yabai.sh') and manually continue installing yabai (https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))"
        exit 1
    fi
fi
