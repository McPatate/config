#! /bin/bash

export PATH=/Users/mc/Documents/mc_config

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

ln -s $PATH/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $PATH/tmux.conf ~/.tmux.conf
ln -s $PATH/nvim/init.vim ~/.config/nvim/init.vim
ln -s $PATH/fish/config.fish ~/.config/fish/config.fish

