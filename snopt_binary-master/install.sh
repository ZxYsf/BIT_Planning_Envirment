#!/bin/bash
set -e # exit on first error
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{
	echo "start to install snopt binary files......."
	install_snopt_binary
	install_dependencies
	install_snopt_interface	
	echo "Snopt successfully installed."
}


## this snopt interface depend on snopt binary libary file 
install_snopt_interface()
{
	echo "install snopt cpp ....."	
	cd /tmp && sudo rm -rf snopt-interface
	git clone https://github.com/snopt/snopt-interface.git	
	cd snopt-interface
        git reset --hard 76b166ecdf5c55a3289ce0f849d8d3d101954a22 #use old version
	./autogen.sh
	./configure prefix="/usr/local"
	sudo make install
	cd include
	sudo mkdir -p /usr/local/include/snopt && sudo cp -rf * /usr/local/include/snopt
	echo "snopt cpp installed successfully"
}

install_dependencies()
{
        sudo apt-get -qq install autoconf autogen
}


install_snopt_binary()
{
	echo "install snopt fortran libraries ......"
	cd $SCRIPT_DIR/lib && sudo cp -rf * /usr/local/lib
	echo "install snopt.pc package configure file......"
	cd $SCRIPT_DIR && sudo cp -rf snopt.pc /usr/local/lib/pkgconfig
	echo "snopt binary libraries installed successfully."
}


main
