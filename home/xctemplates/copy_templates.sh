#!/bin/bash
set -eu

cwd=$(cd $(dirname $0); pwd)
mkdir -p ~/Library/Developer/Xcode/Templates
for file in ${cwd}/*.xctemplate; do
    ln -fs $file ~/Library/Developer/Xcode/Templates/
done
