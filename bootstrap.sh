#!/bin/bash
set -eu

echo "GOGO!!! bootstrap"

# install homebrew
if ! command -v brew > /dev/null 2>&1; then
    # Install homebrew: https://brew.sh/
    xcode-select --install
    echo

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo
fi

# install homebrew prepare for homeshick
if ! command -v git > /dev/null 2>&1; then
  brew install git
  echo
fi

# install homeshick
if ! command -v homeshick > /dev/null 2>&1; then
    # https://github.com/andsens/homeshick/wiki/Installation
    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    echo
    source $HOME/.homesick/repos/homeshick/homeshick.sh
fi

# Using yes command, because question for symlink[y/N]?.
# Using --skip command, because default option is not skipt when files already exists.
yes | homeshick clone bannzai/castle --skip
echo


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
