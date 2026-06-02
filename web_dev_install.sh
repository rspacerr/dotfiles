# !/bin/bash

PACKAGES="npm nvm pnpm"
SUPPORTED="apt dnf"
OS_TYPE="$(uname | tr "[:upper:]" "[:lower:]")"

## TODO: separate script for pacman
if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
else
    echo "The only package managers supported are: ${SUPPORTED}"
    exit 1
fi

cat <<EOF
The following packages and their dependencies are about to be installed:
$PACKAGES
EOF

while true; do
    read -rp "Do you want to install the above packages? (y/n) " yn
    case "${yn}" in [Yy]*)
	if command -v npm &> /dev/null; then
	    echo "Installing npm..."

	    sudo ${PKG_MANAGER} install -y npm

	    echo "npm successfully installed."
	else
	    echo "npm found, skipping installation."
	fi
	
	if command -v nvm &> /dev/null; then
	    echo "Installing nvm..."
	    sudo ${PKG_MANAGER} install -y nvm
	else
	    echo "nvm found, skipping installation."
	fi

	echo "Installing pnpm..."
	sudo npm install -g pnpm


	### TODO: tsc install

	break ;;
    [Nn]*) 
	exit ;;
    *) 
	printf "Please answer y or n\n\n" ;;
    esac
done


echo "Installation complete!"
