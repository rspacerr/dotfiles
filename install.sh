# !/bin/bash
# https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/
# https://github.com/nickjj/dotfiles/blob/master/install
# ./install.sh

PACKAGES="git vim-gtk3 neovim zsh zinit"
DOT=${HOME}/.dotfiles
OS_TYPE="$(uname | tr "[:upper:]" "[:lower:]")"
ZSH_INSTALL_SCRIPT=${HOME}/.dotfiles/zsh/zsh_install.sh

if [[ ! -d $DOT ]]; then
    echo "Dotfiles directory not found! Please check your installation."
    exit
fi

if [[ ! -d $ZSH_INSTALL_SCRIPT ]]; then
    echo "Zsh install file not found! Please check your installation."
    exit
fi

echo "Dotfiles directory set as ${DOT}\n"
cat <<EOF
The following packages and their dependencies are about to be installed:
$PACKAGES
EOF

while true; do
    read -rp "Do you want to install the above packages? (y/n) " yn
    case "${yn}" in [Yy]*)
	
	if type -p vim > /dev/null; then
	    echo "Installing vim-gtk3 (vim gnome)..."
	    sudo apt -y install vim-gtk3
	    [ type -p vim > /dev/null ] && echo "Successfully installed vim!\n"
	else
	    echo "Vim found, skipping installation."
	fi


	if type -p nvim > /dev/null; then
	    echo "Installing nvim..."
	    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	    chmod u+x nvim-linux-x86_64.appimage
	    ./nvim-linux-x86_64.appimage

	    # expose globally
	    sudo mkdir -p /opt/nvim
	    sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
	    [ type -p nvim > /dev/null ] && echo "Successfully installed nvim!\n" 
	else
	    echo "Nvim found, skipping installation."

	# TODO: create script
	
	# script will handle checking previous installs
	# chmod +x ${ZSH_INSTALL_SCRIPT}
	# source ${ZSH_INSTALL_SCRIPT}

	echo "Installing zsh..."
	sudo apt install zsh

	break ;;
    [Nn]*) 
	exit ;;
    *) 
	printf "Please answer y or n\n\n" ;;
    esac
done


# setup symlinks
echo "Setting up symlinks..."
sh ./setup-symlinks.sh

# default to zsh
echo "Changing default shell to $(which zsh)..."
sudo chsh -s $(which zsh)

echo "Installation complete!"
