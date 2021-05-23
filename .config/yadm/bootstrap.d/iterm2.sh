#!/bin/sh

if brew list iterm2 &>/dev/null; then
    if [ -d "$HOME/.config/iterm2" ]; then
        defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.config/iterm2"
        defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
        echo "iTerm preferences are set ✅"
    fi
else
    echo "iTerm is not installed. Skipping..."
fi