#! /bin/bash

export PATH=/Users/mc/Documents/mc_config

mkidr -p ~/.config/alacritty

ln -s $PATH/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $PATH/tmux.conf ~/.tmux.conf

