#!/bin/bash
set -e

echo -e "\e[92mIf you found your github connection too slow (possibly you are in CHINA!), please use a mirror website:\e[0m"
echo -e '\e[92mgit config --global url."https://hub.fastgit.org/".insteadOf "https://github.com/"\e[0m'

[[ $CHINA == 1 ]] && export ACCELERATE_PREFIX=https://ghproxy.com/ && echo -e "\e[92mUsing mirror: $ACCELERATE_PREFIX\e[0m"

# neovim.py
python3 -m pip install neovim

# NodeJS
NODE_TAR_GZ=node-v15.9.0-linux-x64.tar.gz
which npm || (wget https://nodejs.org/download/release/v15.9.0/$NODE_TAR_GZ && tar xf $NODE_TAR_GZ && mv node-v15.9.0-linux-x64 node && rm $NODE_TAR_GZ && echo "export PATH=\$PATH:$(realpath node)/bin")

# neovim
which nvim || (wget ${ACCELERATE_PREFIX}https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod u+x nvim.appimage && mkdir -p ~/bin && mv nvim.appimage ~/bin/nvim)

# vim-plug
[ -e $HOME/.local/share/nvim/site/autoload/plug.vim ] || sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# clangd
which clangd || conda install -y -c conda-forge clang-tools

# Update nvim
nvim +PlugInstall +CocInstall +qa

# coc-snippets
[ -e $HOME/.config/coc/ultisnips ] || (mkdir -p $HOME/.config/coc/ultisnips && cp ./ultisnips/* $HOME/.config/coc/ultisnips)

# I know it's your favorite. Copilot!
nvim +'Copilot setup' +qa
