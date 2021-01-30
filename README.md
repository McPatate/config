# Mc's configuration


[Pimp my *nix](https://luc-sydney-georges.medium.com/pimp-my-nix-2e74b229a080)


## Installation

```sh
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
xargs brew install < homebrew_leaves

# kitty
brew install --cask kitty

# base16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# tldr
cargo install tealdeer
tldr --update
```

