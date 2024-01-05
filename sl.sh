#! /bin/bash

export CONFIG_HOME=/home/mc/Documents/config

# Platform independant
ln -s $CONFIG_HOME/alacritty ~/.config/alacritty
ln -s $CONFIG_HOME/bat ~/.config/bat
# ln -s $CONFIG_HOME/fish/config.fish ~/.config/fish/config.fish
# ln -s $CONFIG_HOME/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $CONFIG_HOME/lazygit $HOME/.config/lazygit
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
ln -s $CONFIG_HOME/git/.gitconfig-mac $HOME/.gitconfig
# Linux
rm $HOME/.config/Code/User/keybindings.json
rm $HOME/.config/Code/User/settings.json

ln -s $CONFIG_HOME/k9s/mocha.yml $HOME/.config/k9s/skin.yml
ln -s $CONFIG_HOME/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $CONFIG_HOME/vscode/settings.json $HOME/.config/Code/User/settings.json
ln -s $CONFIG_HOME/git/.gitconfig-linux $HOME/.gitconfig

# Linux - switch light and dark
sudo ln -s /home/mc/Documents/config/systemd $HOME/.config/systemd
loginctl enable-linger mc
python3 -m pip install astral
systemctl --user enable switch_light_dark.service
systemctl --user start switch_light_dark.service
