#!/bin/bash
set -eu

# (macOS)Neovim necessary python module.
# reference: https://github.com/SirVer/ultisnips/issues/707
# reference: https://qrunch.net/@kanna/entries/aqEBTtX573U09opt
# You can check neovim status this commands on nvim.
# :python3 import sys; print(sys.version)
# :checkhelth provider
pip3 install neovim
