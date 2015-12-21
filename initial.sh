#!/bin/bash

set -x

cd $HOME

git clone git@github.com:NPoi/dotfiles.git npoi_dotfiles
ln -s npoi_dotfiles/_bashrc .bashrc
ln -s npoi_dotfiles/_vimrc .vimrc
ln -s npoi_dotfiles/_gvimrc .gvimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir -p ~/golang
