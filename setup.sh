#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .git .vim .vimrc .pyrc .env-exporter .dein .gitconfig)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
