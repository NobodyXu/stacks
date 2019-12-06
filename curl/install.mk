all: install_curl

install_curl:
	sudo $(apt) install -y curl
