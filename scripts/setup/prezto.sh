#!/bin/zsh
set -eu

echo "begin prezto setup"
setopt EXTENDED_GLOB
PREZTO_DIR="$HOME/.homesick/repos/castle/home/.zprezto"
ls $PREZTO_DIR
for rcfile in $PREZTO_DIR/runcoms/^README.md(.N); do
  echo "mv $HOME/${rcfile:t} $HOME/${rcfile:t}.bk"
  set +e
  mv "$HOME/${rcfile:t}" "$HOME/${rcfile:t}.bk"
  set -e
  echo "ln -s $rcfile for $HOME/.${rcfile:t}"
  ln -s "$PREZTO_DIR/.${rcfile:t}" 
done
echo "end prezto setup"

