#!/bin/bash

set -x

cd $HOME

[ -e "$HOME/npoi_dotfiles" ] || git clone git@github.com:NPoi/npoi_dotfiles.git npoi_dotfiles

ln -s npoi_dotfiles/bin bin
ln -s npoi_dotfiles/_bashrc_profile .bash_profile
ln -s npoi_dotfiles/_bashrc .bashrc
ln -s npoi_dotfiles/_vimrc .vimrc
ln -s npoi_dotfiles/_gvimrc .gvimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir -p ~/usr/local/src
mkdir -p ~/usr/local/bin
mkdir -p ~/usr/local/pkg
