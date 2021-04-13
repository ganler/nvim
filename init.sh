#!/bin/bash
set -e

# neovim.py
python3 -m pip install neovim

# NodeJS
[ -e npm ] || wget https://nodejs.org/download/release/v15.9.0/node-v15.9.0-linux-x64.tar.gz && tar xvf node-v15.9.0-linux-x64.tar.gz && mv node-v15.9.0-linux-x64 node && echo "export PATH=\$PATH:$(realpath node)/bin"

# neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod u+x nvim.appimage && mkdir -p ~/bin && mv nvim.appimage ~/bin

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

