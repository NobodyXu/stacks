all: install_gnupg

install_gnupg:
	sudo $(apt) install -y gnupg2
