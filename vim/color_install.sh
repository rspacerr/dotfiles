#!/bin/bash

if [ ! -d "$HOME/.vim" ]; then
	echo "$HOME/.vim not found"
	exit
fi

if [ ! -d "$HOME/.vim/colors" ]; then
	sudo mkdir $HOME/.vim/colors
fi

# install
cd $HOME/.vim/colors

if [ ! -d "$HOME/.vim/colors/molokai.vim"]; then
	curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
fi


if [ ! -d "$HOME/.vim/colors/one.vim"]; then
	curl -o one.vim https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim
fi
