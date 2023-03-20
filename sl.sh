#! /bin/bash

export CONFIG_HOME=/home/mc/Documents/config

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

ln -s $CONFIG_HOME/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
# ln -s $CONFIG_HOME/tmux.conf ~/.tmux.conf
ln -s $CONFIG_HOME/nvim ~/.config/nvim
# ln -s $CONFIG_HOME/fish/config.fish ~/.config/fish/config.fish
# ln -s $CONFIG_HOME/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $CONFIG_HOME/zsh/.zshrc ~/.zshrc
ln -s $CONFIG_HOME/starship/starship.toml ~/.config/starship.toml
ln -s $CONFIG_HOME/k9s/mocha.yml ~/.config/k9s/skin.yml
# Mac
# rm ~/Library/Application\ Support/Code/User/settings.json
# rm ~/Library/Application\ Support/Code/User/keybindings.json
# ln -s $CONFIG_HOME/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -s $CONFIG_HOME/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# defaults write -g KeyRepeat -int 1
# defaults write -g InitialKeyRepeat -int 10
# Linux
rm $HOME/.config/Code/User/settings.json
rm $HOME/.config/Code/User/keybindings.json
ln -s $CONFIG_HOME/vscode/settings.json $HOME/.config/Code/User/settings.json
ln -s $CONFIG_HOME/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
