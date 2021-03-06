#!/bin/bash
set -eu

echo "GOGO!!!! bootstrap"

if !(type "xcode-select" > /dev/null 2>&1); then
    xcode-select --install
    echo
fi
# install homebrew
if !(type "brew" > /dev/null 2>&1); then
    # Install homebrew: https://brew.sh/†
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
export PATH="$HOME/usr/local/bin:$PATH"


# For already installed applications
set +e
brew bundle
echo
set -e
brew install --HEAD neovim &
wait $!

homeshick cd castle
SETUP_SCRIPT_DIR="$PWD/scripts/setup/"
SCRIPTS=`find "$SETUP_SCRIPT_DIR" -name '*.sh' -type f`

for file in $SCRIPTS; do
  exec $file &
  wait $!
done

# Install powerline font
git clone https://github.com/powerline/fonts.git --depth=1
echo
cd fonts
./install.sh
cd ..
rm -rf fonts

echo 'Create develop/bannzai'
mkdir -p ~/develop/bannzai
cd ~/develop/bannzai
cat <<EOF > .envrc
export GIT_AUTHOR_EMAIL="kingkong999yhirose@gmail.com"
export GIT_COMMITTER_EMAIL="kingkong999yhirose@gmail.com"
export GIT_COMMITTER_NAME=bannzai
export GIT_AUTHOR_NAME=bannzai
EOF
direnv allow
cd -

echo "Let's set login shells. sudo vim /etc/shells \n And write for $(which zsh) \n chsh -s /usr/local/bin/zsh"
echo "And you should set zhistory. (If you use Dropbox. Copy and paste to $HOME/ named .zhistory. )"
echo "Next you should set terminal.app settings for design and default font to use [Source Code Pro Bold for Powerline 12pt]"
echo "End bootstrap 🎉"
