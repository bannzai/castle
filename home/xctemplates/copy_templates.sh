#!/bin/bash

cwd=$(cd $(dirname $0); pwd -P)

mkdir -p ~/Library/Developer/Xcode/Templates
for file in ${cwd}/*.xctemplate; do
    ln -fs $file ~/Library/Developer/Xcode/Templates/
done
