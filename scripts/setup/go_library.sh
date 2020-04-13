#!/bin/bash
set -eu

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
