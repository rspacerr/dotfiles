#!/bin/zsh

# manually run this file after setting up p10k

if [[ ! -d ~/.dotfiles/zsh/.p10k.zsh ]]; then
    mv ~/.p10k.zsh ~/.dotfiles/zsh/
fi

ln -nsfv ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
