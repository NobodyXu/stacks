all: install_apt-add-repository

install_apt-add-repository: install_curl
	sudo apt-get update
	sudo apt-get install -y apt-transport-https ca-certificates gnupg2 gnupg-agent software-properties-common
