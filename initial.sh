#!/bin/bash

set -x

cd $HOME

[ -e "$HOME/npoi_dotfiles" ] || git clone git@github.com:NPoi/npoi_dotfiles.git npoi_dotfiles

ln -s $HOME/npoi_dotfiles/bin bin
ln -s $HOME/npoi_dotfiles/_bashrc_profile .bash_profile
ln -s $HOME/npoi_dotfiles/_bashrc .bashrc
ln -s $HOME/npoi_dotfiles/_vimrc .vimrc
ln -s $HOME/npoi_dotfiles/_gvimrc .gvimrc
ln -s $HOME/npoi_dotfiles/_digrc .digrc

mkdir -p ~/.vim/dein/rc
mkdir -p ~/.vim/dein/plugins
ln -s $HOME/npoi_dotfiles/vim/dein/dein.toml .vim/dein/rc/dein.toml
ln -s $HOME/npoi_dotfiles/vim/dein/dein_lazy.toml .vim/dein/rc/dein_lazy.toml

mkdir -p ~/usr/local/src
mkdir -p ~/usr/local/bin
mkdir -p ~/usr/local/pkg
