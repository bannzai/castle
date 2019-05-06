#!/bin/bash
set -eu

echo "GOGO!!! bootstrap"

# install homeshick
if ! command -v homeshick > /dev/null 2>&1; then
    # https://github.com/andsens/homeshick/wiki/Installation
    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    echo
    printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
    source $HOME/.bashrc
fi

homeshick clone bannzai/castle
echo
homeshick symlink castle
echo

# install homebrew
if ! command -v brew > /dev/null 2>&1; then
    # Install homebrew: https://brew.sh/
    xcode-select --install
    echo

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo
fi

brew bundle
echo

homeshick cd castle
SETUP_SCRIPT_DIR="$PWD/sourcery"
SCRIPTS=`find "$SETUP_SCRIPT_DIR" -name '*.sh' -type f`

for file in $SCRIPTS; do
  exec $file &
  wait $!
done

echo "End bootstrap 🎉"
