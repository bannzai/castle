set rtp+=~/.fzf
set incsearch
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile
set history=10000
filetype on 
let g:mapleader = ' '

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
