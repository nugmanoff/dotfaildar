#!/bin/bash

set -eu

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [[ -f ".zshrc.pre-oh-my-zsh" ]] && mv ".zshrc.pre-oh-my-zsh" ".zshrc"
fi

echo "Oh My Zsh ✅"

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/notify" ]; then
    sh -c "$(git clone https://github.com/marzocchi/zsh-notify.git $HOME/.oh-my-zsh/custom/plugins/notify)"
fi

# Plugins

echo "Oh My Zsh Notify Plugin ✅"

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/alias-tips" ]; then
    sh -c "$(git clone https://github.com/djui/alias-tips.git $HOME/.oh-my-zsh/custom/plugins/alias-tips)"
fi

echo "Oh My Zsh Alias-Tips Plugin ✅"