all: install_ninja

install_ninja:
	sudo $(apt) install -y ninja-build
