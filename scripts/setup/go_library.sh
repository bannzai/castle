#!/bin/bash
set -eu

COMMANDS=(
  "go get -u github.com/derekparker/delve/cmd/dlv"
  "go get github.com/golang/mock/gomock"
  "go get -u github.com/golang/dep/cmd/dep"
  "go get -u github.com/motemen/gore"
  "go get github.com/cweill/gotests/..."
  "go get -u github.com/sourcegraph/go-langserver"
)
for ((i = 0; i < ${#COMMANDS[@]}; i++))
do
  c="${COMMANDS[$i]}"
  echo $c
  exec $c &
  wait $!
done
