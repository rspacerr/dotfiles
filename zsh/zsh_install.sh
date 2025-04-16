#!/bin/sh

echo "Installing zsh..."
sudo apt install zsh

# install plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.powerlevel10k
# git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh-syntax-highlighting

echo "Successfully installed zsh and all plugins!"
echo "Start a new shell or run source ~/.zshrc for changes to take effect."
