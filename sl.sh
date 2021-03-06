#! /bin/bash

export CONFIG_HOME=/Users/mc/Documents/mc_config

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

ln -s $CONFIG_HOME/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $CONFIG_HOME/tmux.conf ~/.tmux.conf
ln -s $CONFIG_HOME/nvim/init.vim ~/.config/nvim/init.vim
ln -s $CONFIG_HOME/fish/config.fish ~/.config/fish/config.fish
ln -s $CONFIG_HOME/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $CONFIG_HOME/zsh/.zshrc ~/.zshrc

