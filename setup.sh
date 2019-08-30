#!/bin/bash
DOT_FILES=(.bashrc .bash_profile .git .vim .pyrc .env-exporter .dein .gitconfig .config/nvim/init.vim .tmux.conf .config/fish)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
