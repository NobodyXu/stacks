all: install_linux-tools

install_linux-tools:
	sudo bash -c 'exec $(apt) install -y linux-tools-`uname -r`'
