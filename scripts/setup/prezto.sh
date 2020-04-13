#!/bin/zsh
set -eu

echo "begin prezto setup"
setopt EXTENDED_GLOB
PREZTO_DIR="$HOME/.homesick/repos/castle/home/.zprezto"
ls $PREZTO_DIR
for rcfile in $PREZTO_DIR/runcoms/^README.md(.N); do
  echo "symlink $rcfile for $PREZTO_DIR/.${rcfile:t}"
  # ln -s "$rcfile" "$PREZTO_DIR/.${rcfile:t}"
done
echo "end prezto setup"

