#!/bin/bash

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

# For VSCode vim plugin
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
