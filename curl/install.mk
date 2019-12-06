all: install_curl

install_curl:
	$(apt) install -y curl
