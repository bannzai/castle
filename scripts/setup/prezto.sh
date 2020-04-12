#!/bin/zsh
set -eu

PREZTO_DIR="~/.homesick/repos/castle/home/.zprezto"
for rcfile in $PREZTO_DIR/runcoms/*; do
  ln -s "$rcfile" "$PREZTO_DIR/.${rcfile:t}"
done

