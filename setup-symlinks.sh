#!/bin/bash

DOT=${HOME}/.dotfiles

ln -nsfv ${DOT}/nvim         ${HOME}/.config/nvim
ln -nsfv ${DOT}/vim/init.vim ${HOME}/.vimrc
ln -nsfv ${DOT}/zsh/.zshrc   ${HOME}/.zshrc
