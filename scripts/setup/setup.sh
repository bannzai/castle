#!/bin/bash
set -eu
set -o pipefail

echo "begin prezto setup"
setopt EXTENDED_GLOB
PREZTO_DIR="$HOME/.homesick/repos/castle/home/.zprezto"
ls $PREZTO_DIR
for rcfile in $PREZTO_DIR/runcoms/^README.md(.N); do
  echo "mv $HOME/.${rcfile:t} $HOME/.${rcfile:t}.bk"
  set +e
  mv "$HOME/.${rcfile:t}" "$HOME/.${rcfile:t}.bk"
  set -e
  echo "ln -s $rcfile for $HOME/.${rcfile:t}"
  ln -s $rcfile "$HOME/.${rcfile:t}" 
done
echo "end prezto setup"

COMMANDS=(
  "go get github.com/golang/mock/gomock"
  "go get -u github.com/golang/dep/cmd/dep"
  "go get -u github.com/motemen/gore"
  "go get github.com/cweill/gotests/..."
)
for ((i = 0; i < ${#COMMANDS[@]}; i++))
do
  c="${COMMANDS[$i]}"
  echo $c
  exec $c &
  wait $!
done

ghq get -p  --branch stable --shallow flutter/flutter &
wait $!

# (macOS)Neovim necessary python module.
# reference: https://github.com/SirVer/ultisnips/issues/707
# reference: https://qrunch.net/@kanna/entries/aqEBTtX573U09opt
# You can check neovim status this commands on nvim.
# :python3 import sys; print(sys.version)
# :checkhelth provider
pip3 install neovim &
wait $!

# For VSCode vim plugin
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
