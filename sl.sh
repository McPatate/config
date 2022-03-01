#! /bin/bash

export CONFIG_HOME=/home/mc/Documents/config

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

ln -s $CONFIG_HOME/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
# ln -s $CONFIG_HOME/tmux.conf ~/.tmux.conf
ln -s $CONFIG_HOME/nvim/init.vim ~/.config/nvim/init.vim
# ln -s $CONFIG_HOME/fish/config.fish ~/.config/fish/config.fish
# ln -s $CONFIG_HOME/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $CONFIG_HOME/zsh/.zshrc ~/.zshrc
# Mac
# rm ~/Library/Application\ Support/Code/User/settings.json
# ln -s $CONFIG_HOME/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# Linux
rm $HOME/.config/Code/User/settings.json
ln -s $CONFIG_HOME/vscode/settings.json $HOME/.config/Code/User/settings.json

