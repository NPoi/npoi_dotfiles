#!/bin/bash

set -x

cd $HOME

ln -s npoi_dotfiles/bin bin
git clone git@github.com:NPoi/dotfiles.git npoi_dotfiles
ln -s npoi_dotfiles/_bashrc .bashrc
ln -s npoi_dotfiles/_vimrc .vimrc
ln -s npoi_dotfiles/_gvimrc .gvimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir -p ~/usr/local/src
mkdir -p ~/usr/local/bin
mkdir -p ~/usr/local/pkg
