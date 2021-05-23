#!/bin/bash

set -eu

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "vim-plug ✅"

# install plugins from init.vim
nvim --headless +PlugInstall +qall

echo "vim plugins from init.vim ✅"