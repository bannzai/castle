#!/bin/bash
set -eu

# prezto 
# https://github.com/bannzai/castle/tree/master/home/.zprezto 
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo 'Let's set login shells. sudo vim /etc/shells \n And write for /usr/local/bin/zsh \n chsh -s /usr/local/bin/zsh'
