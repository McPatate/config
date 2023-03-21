#! /bin/bash

export CONFIG_HOME=/home/mc/Documents/config

# Platform independant
ln -s $CONFIG_HOME/alacritty ~/.config/alacritty
ln -s $CONFIG_HOME/bat ~/.config/bat
# ln -s $CONFIG_HOME/fish/config.fish ~/.config/fish/config.fish
# ln -s $CONFIG_HOME/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $CONFIG_HOME/nvim ~/.config/nvim
ln -s $CONFIG_HOME/starship/starship.toml ~/.config/starship.toml
# ln -s $CONFIG_HOME/tmux.conf ~/.tmux.conf
ln -s $CONFIG_HOME/zsh/.zshrc ~/.zshrc

# Mac
# rm ~/Library/Application\ Support/Code/User/settings.json
# rm ~/Library/Application\ Support/Code/User/keybindings.json
# ln -s $CONFIG_HOME/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -s $CONFIG_HOME/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# defaults write -g KeyRepeat -int 1
# defaults write -g InitialKeyRepeat -int 10
# Linux
rm $HOME/.config/Code/User/keybindings.json
rm $HOME/.config/Code/User/settings.json

ln -s $CONFIG_HOME/k9s/mocha.yml ~/.config/k9s/skin.yml
ln -s $CONFIG_HOME/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $CONFIG_HOME/vscode/settings.json $HOME/.config/Code/User/settings.json
