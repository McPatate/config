# Mc's configuration


[Pimp my *nix](https://luc-sydney-georges.medium.com/pimp-my-nix-2e74b229a080)


## Installation

```sh
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# required for kube-fzf
brew tap thecasualcoder/stable

# Install packages - edit file to remove / add packages
xargs brew install < homebrew_leaves

# kitty
brew install --cask kitty

# base16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# fzf install after brew install
$(brew --prefix)/opt/fzf/install

# create symbolic links for config ; edit script if need be
chmod +x sl.sh
./sl.sh

# vim-plug - https://github.com/junegunn/vim-plug#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install all vim plugins
nvim +PlugInstall +qall

# vscode remove applepressandhold
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# tldr
cargo install tealdeer
tldr --update
```

## Linux specifics

### kube-fzf

```sh
git clone https://github.com/thecasualcoder/kube-fzf.git ~/.kube-fzf
sudo ln -s ~/.kube-fzf/findpod /usr/local/bin/findpod
sudo ln -s ~/.kube-fzf/execpod /usr/local/bin/execpod
sudo ln -s ~/.kube-fzf/tailpod /usr/local/bin/tailpod
sudo ln -s ~/.kube-fzf/describepod /usr/local/bin/describepod
sudo ln -s ~/.kube-fzf/pfpod /usr/local/bin/pfpod
sudo ln -s ~/.kube-fzf/kube-fzf.sh /usr/local/bin/kube-fzf.sh
```
