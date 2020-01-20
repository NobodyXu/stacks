all: install_apt-listchanges

install_apt-listchanges:
	sudo $(apt) install -y apt-listchanges
	sudo dpkg-reconfigure apt-listchanges
