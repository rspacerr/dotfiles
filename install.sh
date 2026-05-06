# !/bin/bash
# https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/
# https://github.com/nickjj/dotfiles/blob/master/install
# ./install.sh

PACKAGES="git vim-gtk3 xclip wl-clipboard neovim zsh zinit"
DOT=${HOME}/.dotfiles
# OS_TYPE="$(uname | tr "[:upper:]" "[:lower:]")"
ZSH_INSTALL_SCRIPT=${HOME}/.dotfiles/zsh/zsh_install.sh

SUPPORTED="apt dnf"
## TODO: separate script for pacman
if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
else
    echo "The only package managers supported are: ${SUPPORTED}"
    exit 1
fi

if [[ ! -d $DOT ]]; then
    echo "Dotfiles directory not found at ${DOT}"
    exit
fi

if [[ ! -f $ZSH_INSTALL_SCRIPT ]]; then
    echo "Zsh install file not found at ${ZSH_INSTALL_SCRIPT}"
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
	if command -v git &> /dev/null; then
	    echo "Installing git..."

	    sudo ${PKG_MANAGER} update && sudo ${PKG_MANAGER} install -y git

	    echo "Git successfully installed."
	else
	    echo "Git found, skipping installation."
	fi
	
	echo "Installing vim-gtk3 (vim gnome)..."
	# TODO: xclip for x11 wl-clipboard for wayland
	sudo ${PKG_MANAGER} -y install vim vim-gtk3 xclip wl-clipboard
	[ type -p vim > /dev/null ] && echo "Successfully installed vim!\n"

	if command -v nvim &> /dev/null; then
	    echo "Installing nvim..."
	    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	    chmod u+x nvim-linux-x86_64.appimage
	    sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
	    nvim --version

	    # expose globally
	    sudo mkdir -p /opt/nvim
	    sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
	    sudo ln -sf /opt/nvim/nvim/ usr/local/bin/nvim
	    [ type -p nvim > /dev/null ] && echo "Successfully installed nvim!\n" 
	else
	    echo "Nvim found, skipping installation."
	fi

	echo "Installing zsh..."
	sudo ${PKG_MANAGER} install -y zsh

	# install plugins
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.powerlevel10k

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

echo "Successfully installed zsh and all plugins!"
echo "Start a new shell or run source ~/.zshrc for changes to take effect."

echo "Installation complete!"
